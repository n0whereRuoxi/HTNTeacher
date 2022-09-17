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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5640 - SURFACE
      ?auto_5641 - SURFACE
    )
    :vars
    (
      ?auto_5642 - HOIST
      ?auto_5643 - PLACE
      ?auto_5645 - PLACE
      ?auto_5646 - HOIST
      ?auto_5647 - SURFACE
      ?auto_5644 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5642 ?auto_5643 ) ( SURFACE-AT ?auto_5640 ?auto_5643 ) ( CLEAR ?auto_5640 ) ( IS-CRATE ?auto_5641 ) ( AVAILABLE ?auto_5642 ) ( not ( = ?auto_5645 ?auto_5643 ) ) ( HOIST-AT ?auto_5646 ?auto_5645 ) ( AVAILABLE ?auto_5646 ) ( SURFACE-AT ?auto_5641 ?auto_5645 ) ( ON ?auto_5641 ?auto_5647 ) ( CLEAR ?auto_5641 ) ( TRUCK-AT ?auto_5644 ?auto_5643 ) ( not ( = ?auto_5640 ?auto_5641 ) ) ( not ( = ?auto_5640 ?auto_5647 ) ) ( not ( = ?auto_5641 ?auto_5647 ) ) ( not ( = ?auto_5642 ?auto_5646 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5644 ?auto_5643 ?auto_5645 )
      ( !LIFT ?auto_5646 ?auto_5641 ?auto_5647 ?auto_5645 )
      ( !LOAD ?auto_5646 ?auto_5641 ?auto_5644 ?auto_5645 )
      ( !DRIVE ?auto_5644 ?auto_5645 ?auto_5643 )
      ( !UNLOAD ?auto_5642 ?auto_5641 ?auto_5644 ?auto_5643 )
      ( !DROP ?auto_5642 ?auto_5641 ?auto_5640 ?auto_5643 )
      ( MAKE-1CRATE-VERIFY ?auto_5640 ?auto_5641 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5650 - SURFACE
      ?auto_5651 - SURFACE
    )
    :vars
    (
      ?auto_5652 - HOIST
      ?auto_5653 - PLACE
      ?auto_5655 - PLACE
      ?auto_5656 - HOIST
      ?auto_5657 - SURFACE
      ?auto_5654 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5652 ?auto_5653 ) ( SURFACE-AT ?auto_5650 ?auto_5653 ) ( CLEAR ?auto_5650 ) ( IS-CRATE ?auto_5651 ) ( AVAILABLE ?auto_5652 ) ( not ( = ?auto_5655 ?auto_5653 ) ) ( HOIST-AT ?auto_5656 ?auto_5655 ) ( AVAILABLE ?auto_5656 ) ( SURFACE-AT ?auto_5651 ?auto_5655 ) ( ON ?auto_5651 ?auto_5657 ) ( CLEAR ?auto_5651 ) ( TRUCK-AT ?auto_5654 ?auto_5653 ) ( not ( = ?auto_5650 ?auto_5651 ) ) ( not ( = ?auto_5650 ?auto_5657 ) ) ( not ( = ?auto_5651 ?auto_5657 ) ) ( not ( = ?auto_5652 ?auto_5656 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5654 ?auto_5653 ?auto_5655 )
      ( !LIFT ?auto_5656 ?auto_5651 ?auto_5657 ?auto_5655 )
      ( !LOAD ?auto_5656 ?auto_5651 ?auto_5654 ?auto_5655 )
      ( !DRIVE ?auto_5654 ?auto_5655 ?auto_5653 )
      ( !UNLOAD ?auto_5652 ?auto_5651 ?auto_5654 ?auto_5653 )
      ( !DROP ?auto_5652 ?auto_5651 ?auto_5650 ?auto_5653 )
      ( MAKE-1CRATE-VERIFY ?auto_5650 ?auto_5651 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_5661 - SURFACE
      ?auto_5662 - SURFACE
      ?auto_5663 - SURFACE
    )
    :vars
    (
      ?auto_5664 - HOIST
      ?auto_5666 - PLACE
      ?auto_5665 - PLACE
      ?auto_5667 - HOIST
      ?auto_5669 - SURFACE
      ?auto_5671 - PLACE
      ?auto_5670 - HOIST
      ?auto_5672 - SURFACE
      ?auto_5668 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5664 ?auto_5666 ) ( IS-CRATE ?auto_5663 ) ( not ( = ?auto_5665 ?auto_5666 ) ) ( HOIST-AT ?auto_5667 ?auto_5665 ) ( AVAILABLE ?auto_5667 ) ( SURFACE-AT ?auto_5663 ?auto_5665 ) ( ON ?auto_5663 ?auto_5669 ) ( CLEAR ?auto_5663 ) ( not ( = ?auto_5662 ?auto_5663 ) ) ( not ( = ?auto_5662 ?auto_5669 ) ) ( not ( = ?auto_5663 ?auto_5669 ) ) ( not ( = ?auto_5664 ?auto_5667 ) ) ( SURFACE-AT ?auto_5661 ?auto_5666 ) ( CLEAR ?auto_5661 ) ( IS-CRATE ?auto_5662 ) ( AVAILABLE ?auto_5664 ) ( not ( = ?auto_5671 ?auto_5666 ) ) ( HOIST-AT ?auto_5670 ?auto_5671 ) ( AVAILABLE ?auto_5670 ) ( SURFACE-AT ?auto_5662 ?auto_5671 ) ( ON ?auto_5662 ?auto_5672 ) ( CLEAR ?auto_5662 ) ( TRUCK-AT ?auto_5668 ?auto_5666 ) ( not ( = ?auto_5661 ?auto_5662 ) ) ( not ( = ?auto_5661 ?auto_5672 ) ) ( not ( = ?auto_5662 ?auto_5672 ) ) ( not ( = ?auto_5664 ?auto_5670 ) ) ( not ( = ?auto_5661 ?auto_5663 ) ) ( not ( = ?auto_5661 ?auto_5669 ) ) ( not ( = ?auto_5663 ?auto_5672 ) ) ( not ( = ?auto_5665 ?auto_5671 ) ) ( not ( = ?auto_5667 ?auto_5670 ) ) ( not ( = ?auto_5669 ?auto_5672 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_5661 ?auto_5662 )
      ( MAKE-1CRATE ?auto_5662 ?auto_5663 )
      ( MAKE-2CRATE-VERIFY ?auto_5661 ?auto_5662 ?auto_5663 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5675 - SURFACE
      ?auto_5676 - SURFACE
    )
    :vars
    (
      ?auto_5677 - HOIST
      ?auto_5678 - PLACE
      ?auto_5680 - PLACE
      ?auto_5681 - HOIST
      ?auto_5682 - SURFACE
      ?auto_5679 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5677 ?auto_5678 ) ( SURFACE-AT ?auto_5675 ?auto_5678 ) ( CLEAR ?auto_5675 ) ( IS-CRATE ?auto_5676 ) ( AVAILABLE ?auto_5677 ) ( not ( = ?auto_5680 ?auto_5678 ) ) ( HOIST-AT ?auto_5681 ?auto_5680 ) ( AVAILABLE ?auto_5681 ) ( SURFACE-AT ?auto_5676 ?auto_5680 ) ( ON ?auto_5676 ?auto_5682 ) ( CLEAR ?auto_5676 ) ( TRUCK-AT ?auto_5679 ?auto_5678 ) ( not ( = ?auto_5675 ?auto_5676 ) ) ( not ( = ?auto_5675 ?auto_5682 ) ) ( not ( = ?auto_5676 ?auto_5682 ) ) ( not ( = ?auto_5677 ?auto_5681 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5679 ?auto_5678 ?auto_5680 )
      ( !LIFT ?auto_5681 ?auto_5676 ?auto_5682 ?auto_5680 )
      ( !LOAD ?auto_5681 ?auto_5676 ?auto_5679 ?auto_5680 )
      ( !DRIVE ?auto_5679 ?auto_5680 ?auto_5678 )
      ( !UNLOAD ?auto_5677 ?auto_5676 ?auto_5679 ?auto_5678 )
      ( !DROP ?auto_5677 ?auto_5676 ?auto_5675 ?auto_5678 )
      ( MAKE-1CRATE-VERIFY ?auto_5675 ?auto_5676 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_5687 - SURFACE
      ?auto_5688 - SURFACE
      ?auto_5689 - SURFACE
      ?auto_5690 - SURFACE
    )
    :vars
    (
      ?auto_5691 - HOIST
      ?auto_5696 - PLACE
      ?auto_5692 - PLACE
      ?auto_5695 - HOIST
      ?auto_5693 - SURFACE
      ?auto_5699 - PLACE
      ?auto_5697 - HOIST
      ?auto_5702 - SURFACE
      ?auto_5698 - PLACE
      ?auto_5701 - HOIST
      ?auto_5700 - SURFACE
      ?auto_5694 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5691 ?auto_5696 ) ( IS-CRATE ?auto_5690 ) ( not ( = ?auto_5692 ?auto_5696 ) ) ( HOIST-AT ?auto_5695 ?auto_5692 ) ( AVAILABLE ?auto_5695 ) ( SURFACE-AT ?auto_5690 ?auto_5692 ) ( ON ?auto_5690 ?auto_5693 ) ( CLEAR ?auto_5690 ) ( not ( = ?auto_5689 ?auto_5690 ) ) ( not ( = ?auto_5689 ?auto_5693 ) ) ( not ( = ?auto_5690 ?auto_5693 ) ) ( not ( = ?auto_5691 ?auto_5695 ) ) ( IS-CRATE ?auto_5689 ) ( not ( = ?auto_5699 ?auto_5696 ) ) ( HOIST-AT ?auto_5697 ?auto_5699 ) ( AVAILABLE ?auto_5697 ) ( SURFACE-AT ?auto_5689 ?auto_5699 ) ( ON ?auto_5689 ?auto_5702 ) ( CLEAR ?auto_5689 ) ( not ( = ?auto_5688 ?auto_5689 ) ) ( not ( = ?auto_5688 ?auto_5702 ) ) ( not ( = ?auto_5689 ?auto_5702 ) ) ( not ( = ?auto_5691 ?auto_5697 ) ) ( SURFACE-AT ?auto_5687 ?auto_5696 ) ( CLEAR ?auto_5687 ) ( IS-CRATE ?auto_5688 ) ( AVAILABLE ?auto_5691 ) ( not ( = ?auto_5698 ?auto_5696 ) ) ( HOIST-AT ?auto_5701 ?auto_5698 ) ( AVAILABLE ?auto_5701 ) ( SURFACE-AT ?auto_5688 ?auto_5698 ) ( ON ?auto_5688 ?auto_5700 ) ( CLEAR ?auto_5688 ) ( TRUCK-AT ?auto_5694 ?auto_5696 ) ( not ( = ?auto_5687 ?auto_5688 ) ) ( not ( = ?auto_5687 ?auto_5700 ) ) ( not ( = ?auto_5688 ?auto_5700 ) ) ( not ( = ?auto_5691 ?auto_5701 ) ) ( not ( = ?auto_5687 ?auto_5689 ) ) ( not ( = ?auto_5687 ?auto_5702 ) ) ( not ( = ?auto_5689 ?auto_5700 ) ) ( not ( = ?auto_5699 ?auto_5698 ) ) ( not ( = ?auto_5697 ?auto_5701 ) ) ( not ( = ?auto_5702 ?auto_5700 ) ) ( not ( = ?auto_5687 ?auto_5690 ) ) ( not ( = ?auto_5687 ?auto_5693 ) ) ( not ( = ?auto_5688 ?auto_5690 ) ) ( not ( = ?auto_5688 ?auto_5693 ) ) ( not ( = ?auto_5690 ?auto_5702 ) ) ( not ( = ?auto_5690 ?auto_5700 ) ) ( not ( = ?auto_5692 ?auto_5699 ) ) ( not ( = ?auto_5692 ?auto_5698 ) ) ( not ( = ?auto_5695 ?auto_5697 ) ) ( not ( = ?auto_5695 ?auto_5701 ) ) ( not ( = ?auto_5693 ?auto_5702 ) ) ( not ( = ?auto_5693 ?auto_5700 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_5687 ?auto_5688 ?auto_5689 )
      ( MAKE-1CRATE ?auto_5689 ?auto_5690 )
      ( MAKE-3CRATE-VERIFY ?auto_5687 ?auto_5688 ?auto_5689 ?auto_5690 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5705 - SURFACE
      ?auto_5706 - SURFACE
    )
    :vars
    (
      ?auto_5707 - HOIST
      ?auto_5708 - PLACE
      ?auto_5710 - PLACE
      ?auto_5711 - HOIST
      ?auto_5712 - SURFACE
      ?auto_5709 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5707 ?auto_5708 ) ( SURFACE-AT ?auto_5705 ?auto_5708 ) ( CLEAR ?auto_5705 ) ( IS-CRATE ?auto_5706 ) ( AVAILABLE ?auto_5707 ) ( not ( = ?auto_5710 ?auto_5708 ) ) ( HOIST-AT ?auto_5711 ?auto_5710 ) ( AVAILABLE ?auto_5711 ) ( SURFACE-AT ?auto_5706 ?auto_5710 ) ( ON ?auto_5706 ?auto_5712 ) ( CLEAR ?auto_5706 ) ( TRUCK-AT ?auto_5709 ?auto_5708 ) ( not ( = ?auto_5705 ?auto_5706 ) ) ( not ( = ?auto_5705 ?auto_5712 ) ) ( not ( = ?auto_5706 ?auto_5712 ) ) ( not ( = ?auto_5707 ?auto_5711 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5709 ?auto_5708 ?auto_5710 )
      ( !LIFT ?auto_5711 ?auto_5706 ?auto_5712 ?auto_5710 )
      ( !LOAD ?auto_5711 ?auto_5706 ?auto_5709 ?auto_5710 )
      ( !DRIVE ?auto_5709 ?auto_5710 ?auto_5708 )
      ( !UNLOAD ?auto_5707 ?auto_5706 ?auto_5709 ?auto_5708 )
      ( !DROP ?auto_5707 ?auto_5706 ?auto_5705 ?auto_5708 )
      ( MAKE-1CRATE-VERIFY ?auto_5705 ?auto_5706 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_5718 - SURFACE
      ?auto_5719 - SURFACE
      ?auto_5720 - SURFACE
      ?auto_5721 - SURFACE
      ?auto_5722 - SURFACE
    )
    :vars
    (
      ?auto_5728 - HOIST
      ?auto_5725 - PLACE
      ?auto_5726 - PLACE
      ?auto_5724 - HOIST
      ?auto_5723 - SURFACE
      ?auto_5731 - PLACE
      ?auto_5735 - HOIST
      ?auto_5732 - SURFACE
      ?auto_5730 - PLACE
      ?auto_5729 - HOIST
      ?auto_5734 - SURFACE
      ?auto_5733 - SURFACE
      ?auto_5727 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5728 ?auto_5725 ) ( IS-CRATE ?auto_5722 ) ( not ( = ?auto_5726 ?auto_5725 ) ) ( HOIST-AT ?auto_5724 ?auto_5726 ) ( SURFACE-AT ?auto_5722 ?auto_5726 ) ( ON ?auto_5722 ?auto_5723 ) ( CLEAR ?auto_5722 ) ( not ( = ?auto_5721 ?auto_5722 ) ) ( not ( = ?auto_5721 ?auto_5723 ) ) ( not ( = ?auto_5722 ?auto_5723 ) ) ( not ( = ?auto_5728 ?auto_5724 ) ) ( IS-CRATE ?auto_5721 ) ( not ( = ?auto_5731 ?auto_5725 ) ) ( HOIST-AT ?auto_5735 ?auto_5731 ) ( AVAILABLE ?auto_5735 ) ( SURFACE-AT ?auto_5721 ?auto_5731 ) ( ON ?auto_5721 ?auto_5732 ) ( CLEAR ?auto_5721 ) ( not ( = ?auto_5720 ?auto_5721 ) ) ( not ( = ?auto_5720 ?auto_5732 ) ) ( not ( = ?auto_5721 ?auto_5732 ) ) ( not ( = ?auto_5728 ?auto_5735 ) ) ( IS-CRATE ?auto_5720 ) ( not ( = ?auto_5730 ?auto_5725 ) ) ( HOIST-AT ?auto_5729 ?auto_5730 ) ( AVAILABLE ?auto_5729 ) ( SURFACE-AT ?auto_5720 ?auto_5730 ) ( ON ?auto_5720 ?auto_5734 ) ( CLEAR ?auto_5720 ) ( not ( = ?auto_5719 ?auto_5720 ) ) ( not ( = ?auto_5719 ?auto_5734 ) ) ( not ( = ?auto_5720 ?auto_5734 ) ) ( not ( = ?auto_5728 ?auto_5729 ) ) ( SURFACE-AT ?auto_5718 ?auto_5725 ) ( CLEAR ?auto_5718 ) ( IS-CRATE ?auto_5719 ) ( AVAILABLE ?auto_5728 ) ( AVAILABLE ?auto_5724 ) ( SURFACE-AT ?auto_5719 ?auto_5726 ) ( ON ?auto_5719 ?auto_5733 ) ( CLEAR ?auto_5719 ) ( TRUCK-AT ?auto_5727 ?auto_5725 ) ( not ( = ?auto_5718 ?auto_5719 ) ) ( not ( = ?auto_5718 ?auto_5733 ) ) ( not ( = ?auto_5719 ?auto_5733 ) ) ( not ( = ?auto_5718 ?auto_5720 ) ) ( not ( = ?auto_5718 ?auto_5734 ) ) ( not ( = ?auto_5720 ?auto_5733 ) ) ( not ( = ?auto_5730 ?auto_5726 ) ) ( not ( = ?auto_5729 ?auto_5724 ) ) ( not ( = ?auto_5734 ?auto_5733 ) ) ( not ( = ?auto_5718 ?auto_5721 ) ) ( not ( = ?auto_5718 ?auto_5732 ) ) ( not ( = ?auto_5719 ?auto_5721 ) ) ( not ( = ?auto_5719 ?auto_5732 ) ) ( not ( = ?auto_5721 ?auto_5734 ) ) ( not ( = ?auto_5721 ?auto_5733 ) ) ( not ( = ?auto_5731 ?auto_5730 ) ) ( not ( = ?auto_5731 ?auto_5726 ) ) ( not ( = ?auto_5735 ?auto_5729 ) ) ( not ( = ?auto_5735 ?auto_5724 ) ) ( not ( = ?auto_5732 ?auto_5734 ) ) ( not ( = ?auto_5732 ?auto_5733 ) ) ( not ( = ?auto_5718 ?auto_5722 ) ) ( not ( = ?auto_5718 ?auto_5723 ) ) ( not ( = ?auto_5719 ?auto_5722 ) ) ( not ( = ?auto_5719 ?auto_5723 ) ) ( not ( = ?auto_5720 ?auto_5722 ) ) ( not ( = ?auto_5720 ?auto_5723 ) ) ( not ( = ?auto_5722 ?auto_5732 ) ) ( not ( = ?auto_5722 ?auto_5734 ) ) ( not ( = ?auto_5722 ?auto_5733 ) ) ( not ( = ?auto_5723 ?auto_5732 ) ) ( not ( = ?auto_5723 ?auto_5734 ) ) ( not ( = ?auto_5723 ?auto_5733 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_5718 ?auto_5719 ?auto_5720 ?auto_5721 )
      ( MAKE-1CRATE ?auto_5721 ?auto_5722 )
      ( MAKE-4CRATE-VERIFY ?auto_5718 ?auto_5719 ?auto_5720 ?auto_5721 ?auto_5722 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5738 - SURFACE
      ?auto_5739 - SURFACE
    )
    :vars
    (
      ?auto_5740 - HOIST
      ?auto_5741 - PLACE
      ?auto_5743 - PLACE
      ?auto_5744 - HOIST
      ?auto_5745 - SURFACE
      ?auto_5742 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5740 ?auto_5741 ) ( SURFACE-AT ?auto_5738 ?auto_5741 ) ( CLEAR ?auto_5738 ) ( IS-CRATE ?auto_5739 ) ( AVAILABLE ?auto_5740 ) ( not ( = ?auto_5743 ?auto_5741 ) ) ( HOIST-AT ?auto_5744 ?auto_5743 ) ( AVAILABLE ?auto_5744 ) ( SURFACE-AT ?auto_5739 ?auto_5743 ) ( ON ?auto_5739 ?auto_5745 ) ( CLEAR ?auto_5739 ) ( TRUCK-AT ?auto_5742 ?auto_5741 ) ( not ( = ?auto_5738 ?auto_5739 ) ) ( not ( = ?auto_5738 ?auto_5745 ) ) ( not ( = ?auto_5739 ?auto_5745 ) ) ( not ( = ?auto_5740 ?auto_5744 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5742 ?auto_5741 ?auto_5743 )
      ( !LIFT ?auto_5744 ?auto_5739 ?auto_5745 ?auto_5743 )
      ( !LOAD ?auto_5744 ?auto_5739 ?auto_5742 ?auto_5743 )
      ( !DRIVE ?auto_5742 ?auto_5743 ?auto_5741 )
      ( !UNLOAD ?auto_5740 ?auto_5739 ?auto_5742 ?auto_5741 )
      ( !DROP ?auto_5740 ?auto_5739 ?auto_5738 ?auto_5741 )
      ( MAKE-1CRATE-VERIFY ?auto_5738 ?auto_5739 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_5752 - SURFACE
      ?auto_5753 - SURFACE
      ?auto_5754 - SURFACE
      ?auto_5755 - SURFACE
      ?auto_5756 - SURFACE
      ?auto_5757 - SURFACE
    )
    :vars
    (
      ?auto_5763 - HOIST
      ?auto_5760 - PLACE
      ?auto_5761 - PLACE
      ?auto_5759 - HOIST
      ?auto_5758 - SURFACE
      ?auto_5764 - PLACE
      ?auto_5768 - HOIST
      ?auto_5773 - SURFACE
      ?auto_5765 - PLACE
      ?auto_5770 - HOIST
      ?auto_5771 - SURFACE
      ?auto_5767 - PLACE
      ?auto_5766 - HOIST
      ?auto_5772 - SURFACE
      ?auto_5769 - SURFACE
      ?auto_5762 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5763 ?auto_5760 ) ( IS-CRATE ?auto_5757 ) ( not ( = ?auto_5761 ?auto_5760 ) ) ( HOIST-AT ?auto_5759 ?auto_5761 ) ( AVAILABLE ?auto_5759 ) ( SURFACE-AT ?auto_5757 ?auto_5761 ) ( ON ?auto_5757 ?auto_5758 ) ( CLEAR ?auto_5757 ) ( not ( = ?auto_5756 ?auto_5757 ) ) ( not ( = ?auto_5756 ?auto_5758 ) ) ( not ( = ?auto_5757 ?auto_5758 ) ) ( not ( = ?auto_5763 ?auto_5759 ) ) ( IS-CRATE ?auto_5756 ) ( not ( = ?auto_5764 ?auto_5760 ) ) ( HOIST-AT ?auto_5768 ?auto_5764 ) ( SURFACE-AT ?auto_5756 ?auto_5764 ) ( ON ?auto_5756 ?auto_5773 ) ( CLEAR ?auto_5756 ) ( not ( = ?auto_5755 ?auto_5756 ) ) ( not ( = ?auto_5755 ?auto_5773 ) ) ( not ( = ?auto_5756 ?auto_5773 ) ) ( not ( = ?auto_5763 ?auto_5768 ) ) ( IS-CRATE ?auto_5755 ) ( not ( = ?auto_5765 ?auto_5760 ) ) ( HOIST-AT ?auto_5770 ?auto_5765 ) ( AVAILABLE ?auto_5770 ) ( SURFACE-AT ?auto_5755 ?auto_5765 ) ( ON ?auto_5755 ?auto_5771 ) ( CLEAR ?auto_5755 ) ( not ( = ?auto_5754 ?auto_5755 ) ) ( not ( = ?auto_5754 ?auto_5771 ) ) ( not ( = ?auto_5755 ?auto_5771 ) ) ( not ( = ?auto_5763 ?auto_5770 ) ) ( IS-CRATE ?auto_5754 ) ( not ( = ?auto_5767 ?auto_5760 ) ) ( HOIST-AT ?auto_5766 ?auto_5767 ) ( AVAILABLE ?auto_5766 ) ( SURFACE-AT ?auto_5754 ?auto_5767 ) ( ON ?auto_5754 ?auto_5772 ) ( CLEAR ?auto_5754 ) ( not ( = ?auto_5753 ?auto_5754 ) ) ( not ( = ?auto_5753 ?auto_5772 ) ) ( not ( = ?auto_5754 ?auto_5772 ) ) ( not ( = ?auto_5763 ?auto_5766 ) ) ( SURFACE-AT ?auto_5752 ?auto_5760 ) ( CLEAR ?auto_5752 ) ( IS-CRATE ?auto_5753 ) ( AVAILABLE ?auto_5763 ) ( AVAILABLE ?auto_5768 ) ( SURFACE-AT ?auto_5753 ?auto_5764 ) ( ON ?auto_5753 ?auto_5769 ) ( CLEAR ?auto_5753 ) ( TRUCK-AT ?auto_5762 ?auto_5760 ) ( not ( = ?auto_5752 ?auto_5753 ) ) ( not ( = ?auto_5752 ?auto_5769 ) ) ( not ( = ?auto_5753 ?auto_5769 ) ) ( not ( = ?auto_5752 ?auto_5754 ) ) ( not ( = ?auto_5752 ?auto_5772 ) ) ( not ( = ?auto_5754 ?auto_5769 ) ) ( not ( = ?auto_5767 ?auto_5764 ) ) ( not ( = ?auto_5766 ?auto_5768 ) ) ( not ( = ?auto_5772 ?auto_5769 ) ) ( not ( = ?auto_5752 ?auto_5755 ) ) ( not ( = ?auto_5752 ?auto_5771 ) ) ( not ( = ?auto_5753 ?auto_5755 ) ) ( not ( = ?auto_5753 ?auto_5771 ) ) ( not ( = ?auto_5755 ?auto_5772 ) ) ( not ( = ?auto_5755 ?auto_5769 ) ) ( not ( = ?auto_5765 ?auto_5767 ) ) ( not ( = ?auto_5765 ?auto_5764 ) ) ( not ( = ?auto_5770 ?auto_5766 ) ) ( not ( = ?auto_5770 ?auto_5768 ) ) ( not ( = ?auto_5771 ?auto_5772 ) ) ( not ( = ?auto_5771 ?auto_5769 ) ) ( not ( = ?auto_5752 ?auto_5756 ) ) ( not ( = ?auto_5752 ?auto_5773 ) ) ( not ( = ?auto_5753 ?auto_5756 ) ) ( not ( = ?auto_5753 ?auto_5773 ) ) ( not ( = ?auto_5754 ?auto_5756 ) ) ( not ( = ?auto_5754 ?auto_5773 ) ) ( not ( = ?auto_5756 ?auto_5771 ) ) ( not ( = ?auto_5756 ?auto_5772 ) ) ( not ( = ?auto_5756 ?auto_5769 ) ) ( not ( = ?auto_5773 ?auto_5771 ) ) ( not ( = ?auto_5773 ?auto_5772 ) ) ( not ( = ?auto_5773 ?auto_5769 ) ) ( not ( = ?auto_5752 ?auto_5757 ) ) ( not ( = ?auto_5752 ?auto_5758 ) ) ( not ( = ?auto_5753 ?auto_5757 ) ) ( not ( = ?auto_5753 ?auto_5758 ) ) ( not ( = ?auto_5754 ?auto_5757 ) ) ( not ( = ?auto_5754 ?auto_5758 ) ) ( not ( = ?auto_5755 ?auto_5757 ) ) ( not ( = ?auto_5755 ?auto_5758 ) ) ( not ( = ?auto_5757 ?auto_5773 ) ) ( not ( = ?auto_5757 ?auto_5771 ) ) ( not ( = ?auto_5757 ?auto_5772 ) ) ( not ( = ?auto_5757 ?auto_5769 ) ) ( not ( = ?auto_5761 ?auto_5764 ) ) ( not ( = ?auto_5761 ?auto_5765 ) ) ( not ( = ?auto_5761 ?auto_5767 ) ) ( not ( = ?auto_5759 ?auto_5768 ) ) ( not ( = ?auto_5759 ?auto_5770 ) ) ( not ( = ?auto_5759 ?auto_5766 ) ) ( not ( = ?auto_5758 ?auto_5773 ) ) ( not ( = ?auto_5758 ?auto_5771 ) ) ( not ( = ?auto_5758 ?auto_5772 ) ) ( not ( = ?auto_5758 ?auto_5769 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_5752 ?auto_5753 ?auto_5754 ?auto_5755 ?auto_5756 )
      ( MAKE-1CRATE ?auto_5756 ?auto_5757 )
      ( MAKE-5CRATE-VERIFY ?auto_5752 ?auto_5753 ?auto_5754 ?auto_5755 ?auto_5756 ?auto_5757 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5776 - SURFACE
      ?auto_5777 - SURFACE
    )
    :vars
    (
      ?auto_5778 - HOIST
      ?auto_5779 - PLACE
      ?auto_5781 - PLACE
      ?auto_5782 - HOIST
      ?auto_5783 - SURFACE
      ?auto_5780 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5778 ?auto_5779 ) ( SURFACE-AT ?auto_5776 ?auto_5779 ) ( CLEAR ?auto_5776 ) ( IS-CRATE ?auto_5777 ) ( AVAILABLE ?auto_5778 ) ( not ( = ?auto_5781 ?auto_5779 ) ) ( HOIST-AT ?auto_5782 ?auto_5781 ) ( AVAILABLE ?auto_5782 ) ( SURFACE-AT ?auto_5777 ?auto_5781 ) ( ON ?auto_5777 ?auto_5783 ) ( CLEAR ?auto_5777 ) ( TRUCK-AT ?auto_5780 ?auto_5779 ) ( not ( = ?auto_5776 ?auto_5777 ) ) ( not ( = ?auto_5776 ?auto_5783 ) ) ( not ( = ?auto_5777 ?auto_5783 ) ) ( not ( = ?auto_5778 ?auto_5782 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5780 ?auto_5779 ?auto_5781 )
      ( !LIFT ?auto_5782 ?auto_5777 ?auto_5783 ?auto_5781 )
      ( !LOAD ?auto_5782 ?auto_5777 ?auto_5780 ?auto_5781 )
      ( !DRIVE ?auto_5780 ?auto_5781 ?auto_5779 )
      ( !UNLOAD ?auto_5778 ?auto_5777 ?auto_5780 ?auto_5779 )
      ( !DROP ?auto_5778 ?auto_5777 ?auto_5776 ?auto_5779 )
      ( MAKE-1CRATE-VERIFY ?auto_5776 ?auto_5777 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_5791 - SURFACE
      ?auto_5792 - SURFACE
      ?auto_5793 - SURFACE
      ?auto_5794 - SURFACE
      ?auto_5795 - SURFACE
      ?auto_5797 - SURFACE
      ?auto_5796 - SURFACE
    )
    :vars
    (
      ?auto_5803 - HOIST
      ?auto_5802 - PLACE
      ?auto_5799 - PLACE
      ?auto_5800 - HOIST
      ?auto_5801 - SURFACE
      ?auto_5813 - PLACE
      ?auto_5807 - HOIST
      ?auto_5805 - SURFACE
      ?auto_5814 - SURFACE
      ?auto_5812 - PLACE
      ?auto_5808 - HOIST
      ?auto_5804 - SURFACE
      ?auto_5809 - PLACE
      ?auto_5811 - HOIST
      ?auto_5806 - SURFACE
      ?auto_5810 - SURFACE
      ?auto_5798 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5803 ?auto_5802 ) ( IS-CRATE ?auto_5796 ) ( not ( = ?auto_5799 ?auto_5802 ) ) ( HOIST-AT ?auto_5800 ?auto_5799 ) ( SURFACE-AT ?auto_5796 ?auto_5799 ) ( ON ?auto_5796 ?auto_5801 ) ( CLEAR ?auto_5796 ) ( not ( = ?auto_5797 ?auto_5796 ) ) ( not ( = ?auto_5797 ?auto_5801 ) ) ( not ( = ?auto_5796 ?auto_5801 ) ) ( not ( = ?auto_5803 ?auto_5800 ) ) ( IS-CRATE ?auto_5797 ) ( not ( = ?auto_5813 ?auto_5802 ) ) ( HOIST-AT ?auto_5807 ?auto_5813 ) ( AVAILABLE ?auto_5807 ) ( SURFACE-AT ?auto_5797 ?auto_5813 ) ( ON ?auto_5797 ?auto_5805 ) ( CLEAR ?auto_5797 ) ( not ( = ?auto_5795 ?auto_5797 ) ) ( not ( = ?auto_5795 ?auto_5805 ) ) ( not ( = ?auto_5797 ?auto_5805 ) ) ( not ( = ?auto_5803 ?auto_5807 ) ) ( IS-CRATE ?auto_5795 ) ( SURFACE-AT ?auto_5795 ?auto_5799 ) ( ON ?auto_5795 ?auto_5814 ) ( CLEAR ?auto_5795 ) ( not ( = ?auto_5794 ?auto_5795 ) ) ( not ( = ?auto_5794 ?auto_5814 ) ) ( not ( = ?auto_5795 ?auto_5814 ) ) ( IS-CRATE ?auto_5794 ) ( not ( = ?auto_5812 ?auto_5802 ) ) ( HOIST-AT ?auto_5808 ?auto_5812 ) ( AVAILABLE ?auto_5808 ) ( SURFACE-AT ?auto_5794 ?auto_5812 ) ( ON ?auto_5794 ?auto_5804 ) ( CLEAR ?auto_5794 ) ( not ( = ?auto_5793 ?auto_5794 ) ) ( not ( = ?auto_5793 ?auto_5804 ) ) ( not ( = ?auto_5794 ?auto_5804 ) ) ( not ( = ?auto_5803 ?auto_5808 ) ) ( IS-CRATE ?auto_5793 ) ( not ( = ?auto_5809 ?auto_5802 ) ) ( HOIST-AT ?auto_5811 ?auto_5809 ) ( AVAILABLE ?auto_5811 ) ( SURFACE-AT ?auto_5793 ?auto_5809 ) ( ON ?auto_5793 ?auto_5806 ) ( CLEAR ?auto_5793 ) ( not ( = ?auto_5792 ?auto_5793 ) ) ( not ( = ?auto_5792 ?auto_5806 ) ) ( not ( = ?auto_5793 ?auto_5806 ) ) ( not ( = ?auto_5803 ?auto_5811 ) ) ( SURFACE-AT ?auto_5791 ?auto_5802 ) ( CLEAR ?auto_5791 ) ( IS-CRATE ?auto_5792 ) ( AVAILABLE ?auto_5803 ) ( AVAILABLE ?auto_5800 ) ( SURFACE-AT ?auto_5792 ?auto_5799 ) ( ON ?auto_5792 ?auto_5810 ) ( CLEAR ?auto_5792 ) ( TRUCK-AT ?auto_5798 ?auto_5802 ) ( not ( = ?auto_5791 ?auto_5792 ) ) ( not ( = ?auto_5791 ?auto_5810 ) ) ( not ( = ?auto_5792 ?auto_5810 ) ) ( not ( = ?auto_5791 ?auto_5793 ) ) ( not ( = ?auto_5791 ?auto_5806 ) ) ( not ( = ?auto_5793 ?auto_5810 ) ) ( not ( = ?auto_5809 ?auto_5799 ) ) ( not ( = ?auto_5811 ?auto_5800 ) ) ( not ( = ?auto_5806 ?auto_5810 ) ) ( not ( = ?auto_5791 ?auto_5794 ) ) ( not ( = ?auto_5791 ?auto_5804 ) ) ( not ( = ?auto_5792 ?auto_5794 ) ) ( not ( = ?auto_5792 ?auto_5804 ) ) ( not ( = ?auto_5794 ?auto_5806 ) ) ( not ( = ?auto_5794 ?auto_5810 ) ) ( not ( = ?auto_5812 ?auto_5809 ) ) ( not ( = ?auto_5812 ?auto_5799 ) ) ( not ( = ?auto_5808 ?auto_5811 ) ) ( not ( = ?auto_5808 ?auto_5800 ) ) ( not ( = ?auto_5804 ?auto_5806 ) ) ( not ( = ?auto_5804 ?auto_5810 ) ) ( not ( = ?auto_5791 ?auto_5795 ) ) ( not ( = ?auto_5791 ?auto_5814 ) ) ( not ( = ?auto_5792 ?auto_5795 ) ) ( not ( = ?auto_5792 ?auto_5814 ) ) ( not ( = ?auto_5793 ?auto_5795 ) ) ( not ( = ?auto_5793 ?auto_5814 ) ) ( not ( = ?auto_5795 ?auto_5804 ) ) ( not ( = ?auto_5795 ?auto_5806 ) ) ( not ( = ?auto_5795 ?auto_5810 ) ) ( not ( = ?auto_5814 ?auto_5804 ) ) ( not ( = ?auto_5814 ?auto_5806 ) ) ( not ( = ?auto_5814 ?auto_5810 ) ) ( not ( = ?auto_5791 ?auto_5797 ) ) ( not ( = ?auto_5791 ?auto_5805 ) ) ( not ( = ?auto_5792 ?auto_5797 ) ) ( not ( = ?auto_5792 ?auto_5805 ) ) ( not ( = ?auto_5793 ?auto_5797 ) ) ( not ( = ?auto_5793 ?auto_5805 ) ) ( not ( = ?auto_5794 ?auto_5797 ) ) ( not ( = ?auto_5794 ?auto_5805 ) ) ( not ( = ?auto_5797 ?auto_5814 ) ) ( not ( = ?auto_5797 ?auto_5804 ) ) ( not ( = ?auto_5797 ?auto_5806 ) ) ( not ( = ?auto_5797 ?auto_5810 ) ) ( not ( = ?auto_5813 ?auto_5799 ) ) ( not ( = ?auto_5813 ?auto_5812 ) ) ( not ( = ?auto_5813 ?auto_5809 ) ) ( not ( = ?auto_5807 ?auto_5800 ) ) ( not ( = ?auto_5807 ?auto_5808 ) ) ( not ( = ?auto_5807 ?auto_5811 ) ) ( not ( = ?auto_5805 ?auto_5814 ) ) ( not ( = ?auto_5805 ?auto_5804 ) ) ( not ( = ?auto_5805 ?auto_5806 ) ) ( not ( = ?auto_5805 ?auto_5810 ) ) ( not ( = ?auto_5791 ?auto_5796 ) ) ( not ( = ?auto_5791 ?auto_5801 ) ) ( not ( = ?auto_5792 ?auto_5796 ) ) ( not ( = ?auto_5792 ?auto_5801 ) ) ( not ( = ?auto_5793 ?auto_5796 ) ) ( not ( = ?auto_5793 ?auto_5801 ) ) ( not ( = ?auto_5794 ?auto_5796 ) ) ( not ( = ?auto_5794 ?auto_5801 ) ) ( not ( = ?auto_5795 ?auto_5796 ) ) ( not ( = ?auto_5795 ?auto_5801 ) ) ( not ( = ?auto_5796 ?auto_5805 ) ) ( not ( = ?auto_5796 ?auto_5814 ) ) ( not ( = ?auto_5796 ?auto_5804 ) ) ( not ( = ?auto_5796 ?auto_5806 ) ) ( not ( = ?auto_5796 ?auto_5810 ) ) ( not ( = ?auto_5801 ?auto_5805 ) ) ( not ( = ?auto_5801 ?auto_5814 ) ) ( not ( = ?auto_5801 ?auto_5804 ) ) ( not ( = ?auto_5801 ?auto_5806 ) ) ( not ( = ?auto_5801 ?auto_5810 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_5791 ?auto_5792 ?auto_5793 ?auto_5794 ?auto_5795 ?auto_5797 )
      ( MAKE-1CRATE ?auto_5797 ?auto_5796 )
      ( MAKE-6CRATE-VERIFY ?auto_5791 ?auto_5792 ?auto_5793 ?auto_5794 ?auto_5795 ?auto_5797 ?auto_5796 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5817 - SURFACE
      ?auto_5818 - SURFACE
    )
    :vars
    (
      ?auto_5819 - HOIST
      ?auto_5820 - PLACE
      ?auto_5822 - PLACE
      ?auto_5823 - HOIST
      ?auto_5824 - SURFACE
      ?auto_5821 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5819 ?auto_5820 ) ( SURFACE-AT ?auto_5817 ?auto_5820 ) ( CLEAR ?auto_5817 ) ( IS-CRATE ?auto_5818 ) ( AVAILABLE ?auto_5819 ) ( not ( = ?auto_5822 ?auto_5820 ) ) ( HOIST-AT ?auto_5823 ?auto_5822 ) ( AVAILABLE ?auto_5823 ) ( SURFACE-AT ?auto_5818 ?auto_5822 ) ( ON ?auto_5818 ?auto_5824 ) ( CLEAR ?auto_5818 ) ( TRUCK-AT ?auto_5821 ?auto_5820 ) ( not ( = ?auto_5817 ?auto_5818 ) ) ( not ( = ?auto_5817 ?auto_5824 ) ) ( not ( = ?auto_5818 ?auto_5824 ) ) ( not ( = ?auto_5819 ?auto_5823 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5821 ?auto_5820 ?auto_5822 )
      ( !LIFT ?auto_5823 ?auto_5818 ?auto_5824 ?auto_5822 )
      ( !LOAD ?auto_5823 ?auto_5818 ?auto_5821 ?auto_5822 )
      ( !DRIVE ?auto_5821 ?auto_5822 ?auto_5820 )
      ( !UNLOAD ?auto_5819 ?auto_5818 ?auto_5821 ?auto_5820 )
      ( !DROP ?auto_5819 ?auto_5818 ?auto_5817 ?auto_5820 )
      ( MAKE-1CRATE-VERIFY ?auto_5817 ?auto_5818 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_5833 - SURFACE
      ?auto_5834 - SURFACE
      ?auto_5835 - SURFACE
      ?auto_5836 - SURFACE
      ?auto_5837 - SURFACE
      ?auto_5839 - SURFACE
      ?auto_5838 - SURFACE
      ?auto_5840 - SURFACE
    )
    :vars
    (
      ?auto_5841 - HOIST
      ?auto_5842 - PLACE
      ?auto_5845 - PLACE
      ?auto_5844 - HOIST
      ?auto_5843 - SURFACE
      ?auto_5849 - PLACE
      ?auto_5858 - HOIST
      ?auto_5847 - SURFACE
      ?auto_5855 - PLACE
      ?auto_5850 - HOIST
      ?auto_5848 - SURFACE
      ?auto_5854 - SURFACE
      ?auto_5853 - PLACE
      ?auto_5857 - HOIST
      ?auto_5852 - SURFACE
      ?auto_5851 - SURFACE
      ?auto_5856 - SURFACE
      ?auto_5846 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5841 ?auto_5842 ) ( IS-CRATE ?auto_5840 ) ( not ( = ?auto_5845 ?auto_5842 ) ) ( HOIST-AT ?auto_5844 ?auto_5845 ) ( SURFACE-AT ?auto_5840 ?auto_5845 ) ( ON ?auto_5840 ?auto_5843 ) ( CLEAR ?auto_5840 ) ( not ( = ?auto_5838 ?auto_5840 ) ) ( not ( = ?auto_5838 ?auto_5843 ) ) ( not ( = ?auto_5840 ?auto_5843 ) ) ( not ( = ?auto_5841 ?auto_5844 ) ) ( IS-CRATE ?auto_5838 ) ( not ( = ?auto_5849 ?auto_5842 ) ) ( HOIST-AT ?auto_5858 ?auto_5849 ) ( SURFACE-AT ?auto_5838 ?auto_5849 ) ( ON ?auto_5838 ?auto_5847 ) ( CLEAR ?auto_5838 ) ( not ( = ?auto_5839 ?auto_5838 ) ) ( not ( = ?auto_5839 ?auto_5847 ) ) ( not ( = ?auto_5838 ?auto_5847 ) ) ( not ( = ?auto_5841 ?auto_5858 ) ) ( IS-CRATE ?auto_5839 ) ( not ( = ?auto_5855 ?auto_5842 ) ) ( HOIST-AT ?auto_5850 ?auto_5855 ) ( AVAILABLE ?auto_5850 ) ( SURFACE-AT ?auto_5839 ?auto_5855 ) ( ON ?auto_5839 ?auto_5848 ) ( CLEAR ?auto_5839 ) ( not ( = ?auto_5837 ?auto_5839 ) ) ( not ( = ?auto_5837 ?auto_5848 ) ) ( not ( = ?auto_5839 ?auto_5848 ) ) ( not ( = ?auto_5841 ?auto_5850 ) ) ( IS-CRATE ?auto_5837 ) ( SURFACE-AT ?auto_5837 ?auto_5849 ) ( ON ?auto_5837 ?auto_5854 ) ( CLEAR ?auto_5837 ) ( not ( = ?auto_5836 ?auto_5837 ) ) ( not ( = ?auto_5836 ?auto_5854 ) ) ( not ( = ?auto_5837 ?auto_5854 ) ) ( IS-CRATE ?auto_5836 ) ( not ( = ?auto_5853 ?auto_5842 ) ) ( HOIST-AT ?auto_5857 ?auto_5853 ) ( AVAILABLE ?auto_5857 ) ( SURFACE-AT ?auto_5836 ?auto_5853 ) ( ON ?auto_5836 ?auto_5852 ) ( CLEAR ?auto_5836 ) ( not ( = ?auto_5835 ?auto_5836 ) ) ( not ( = ?auto_5835 ?auto_5852 ) ) ( not ( = ?auto_5836 ?auto_5852 ) ) ( not ( = ?auto_5841 ?auto_5857 ) ) ( IS-CRATE ?auto_5835 ) ( AVAILABLE ?auto_5844 ) ( SURFACE-AT ?auto_5835 ?auto_5845 ) ( ON ?auto_5835 ?auto_5851 ) ( CLEAR ?auto_5835 ) ( not ( = ?auto_5834 ?auto_5835 ) ) ( not ( = ?auto_5834 ?auto_5851 ) ) ( not ( = ?auto_5835 ?auto_5851 ) ) ( SURFACE-AT ?auto_5833 ?auto_5842 ) ( CLEAR ?auto_5833 ) ( IS-CRATE ?auto_5834 ) ( AVAILABLE ?auto_5841 ) ( AVAILABLE ?auto_5858 ) ( SURFACE-AT ?auto_5834 ?auto_5849 ) ( ON ?auto_5834 ?auto_5856 ) ( CLEAR ?auto_5834 ) ( TRUCK-AT ?auto_5846 ?auto_5842 ) ( not ( = ?auto_5833 ?auto_5834 ) ) ( not ( = ?auto_5833 ?auto_5856 ) ) ( not ( = ?auto_5834 ?auto_5856 ) ) ( not ( = ?auto_5833 ?auto_5835 ) ) ( not ( = ?auto_5833 ?auto_5851 ) ) ( not ( = ?auto_5835 ?auto_5856 ) ) ( not ( = ?auto_5845 ?auto_5849 ) ) ( not ( = ?auto_5844 ?auto_5858 ) ) ( not ( = ?auto_5851 ?auto_5856 ) ) ( not ( = ?auto_5833 ?auto_5836 ) ) ( not ( = ?auto_5833 ?auto_5852 ) ) ( not ( = ?auto_5834 ?auto_5836 ) ) ( not ( = ?auto_5834 ?auto_5852 ) ) ( not ( = ?auto_5836 ?auto_5851 ) ) ( not ( = ?auto_5836 ?auto_5856 ) ) ( not ( = ?auto_5853 ?auto_5845 ) ) ( not ( = ?auto_5853 ?auto_5849 ) ) ( not ( = ?auto_5857 ?auto_5844 ) ) ( not ( = ?auto_5857 ?auto_5858 ) ) ( not ( = ?auto_5852 ?auto_5851 ) ) ( not ( = ?auto_5852 ?auto_5856 ) ) ( not ( = ?auto_5833 ?auto_5837 ) ) ( not ( = ?auto_5833 ?auto_5854 ) ) ( not ( = ?auto_5834 ?auto_5837 ) ) ( not ( = ?auto_5834 ?auto_5854 ) ) ( not ( = ?auto_5835 ?auto_5837 ) ) ( not ( = ?auto_5835 ?auto_5854 ) ) ( not ( = ?auto_5837 ?auto_5852 ) ) ( not ( = ?auto_5837 ?auto_5851 ) ) ( not ( = ?auto_5837 ?auto_5856 ) ) ( not ( = ?auto_5854 ?auto_5852 ) ) ( not ( = ?auto_5854 ?auto_5851 ) ) ( not ( = ?auto_5854 ?auto_5856 ) ) ( not ( = ?auto_5833 ?auto_5839 ) ) ( not ( = ?auto_5833 ?auto_5848 ) ) ( not ( = ?auto_5834 ?auto_5839 ) ) ( not ( = ?auto_5834 ?auto_5848 ) ) ( not ( = ?auto_5835 ?auto_5839 ) ) ( not ( = ?auto_5835 ?auto_5848 ) ) ( not ( = ?auto_5836 ?auto_5839 ) ) ( not ( = ?auto_5836 ?auto_5848 ) ) ( not ( = ?auto_5839 ?auto_5854 ) ) ( not ( = ?auto_5839 ?auto_5852 ) ) ( not ( = ?auto_5839 ?auto_5851 ) ) ( not ( = ?auto_5839 ?auto_5856 ) ) ( not ( = ?auto_5855 ?auto_5849 ) ) ( not ( = ?auto_5855 ?auto_5853 ) ) ( not ( = ?auto_5855 ?auto_5845 ) ) ( not ( = ?auto_5850 ?auto_5858 ) ) ( not ( = ?auto_5850 ?auto_5857 ) ) ( not ( = ?auto_5850 ?auto_5844 ) ) ( not ( = ?auto_5848 ?auto_5854 ) ) ( not ( = ?auto_5848 ?auto_5852 ) ) ( not ( = ?auto_5848 ?auto_5851 ) ) ( not ( = ?auto_5848 ?auto_5856 ) ) ( not ( = ?auto_5833 ?auto_5838 ) ) ( not ( = ?auto_5833 ?auto_5847 ) ) ( not ( = ?auto_5834 ?auto_5838 ) ) ( not ( = ?auto_5834 ?auto_5847 ) ) ( not ( = ?auto_5835 ?auto_5838 ) ) ( not ( = ?auto_5835 ?auto_5847 ) ) ( not ( = ?auto_5836 ?auto_5838 ) ) ( not ( = ?auto_5836 ?auto_5847 ) ) ( not ( = ?auto_5837 ?auto_5838 ) ) ( not ( = ?auto_5837 ?auto_5847 ) ) ( not ( = ?auto_5838 ?auto_5848 ) ) ( not ( = ?auto_5838 ?auto_5854 ) ) ( not ( = ?auto_5838 ?auto_5852 ) ) ( not ( = ?auto_5838 ?auto_5851 ) ) ( not ( = ?auto_5838 ?auto_5856 ) ) ( not ( = ?auto_5847 ?auto_5848 ) ) ( not ( = ?auto_5847 ?auto_5854 ) ) ( not ( = ?auto_5847 ?auto_5852 ) ) ( not ( = ?auto_5847 ?auto_5851 ) ) ( not ( = ?auto_5847 ?auto_5856 ) ) ( not ( = ?auto_5833 ?auto_5840 ) ) ( not ( = ?auto_5833 ?auto_5843 ) ) ( not ( = ?auto_5834 ?auto_5840 ) ) ( not ( = ?auto_5834 ?auto_5843 ) ) ( not ( = ?auto_5835 ?auto_5840 ) ) ( not ( = ?auto_5835 ?auto_5843 ) ) ( not ( = ?auto_5836 ?auto_5840 ) ) ( not ( = ?auto_5836 ?auto_5843 ) ) ( not ( = ?auto_5837 ?auto_5840 ) ) ( not ( = ?auto_5837 ?auto_5843 ) ) ( not ( = ?auto_5839 ?auto_5840 ) ) ( not ( = ?auto_5839 ?auto_5843 ) ) ( not ( = ?auto_5840 ?auto_5847 ) ) ( not ( = ?auto_5840 ?auto_5848 ) ) ( not ( = ?auto_5840 ?auto_5854 ) ) ( not ( = ?auto_5840 ?auto_5852 ) ) ( not ( = ?auto_5840 ?auto_5851 ) ) ( not ( = ?auto_5840 ?auto_5856 ) ) ( not ( = ?auto_5843 ?auto_5847 ) ) ( not ( = ?auto_5843 ?auto_5848 ) ) ( not ( = ?auto_5843 ?auto_5854 ) ) ( not ( = ?auto_5843 ?auto_5852 ) ) ( not ( = ?auto_5843 ?auto_5851 ) ) ( not ( = ?auto_5843 ?auto_5856 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_5833 ?auto_5834 ?auto_5835 ?auto_5836 ?auto_5837 ?auto_5839 ?auto_5838 )
      ( MAKE-1CRATE ?auto_5838 ?auto_5840 )
      ( MAKE-7CRATE-VERIFY ?auto_5833 ?auto_5834 ?auto_5835 ?auto_5836 ?auto_5837 ?auto_5839 ?auto_5838 ?auto_5840 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5861 - SURFACE
      ?auto_5862 - SURFACE
    )
    :vars
    (
      ?auto_5863 - HOIST
      ?auto_5864 - PLACE
      ?auto_5866 - PLACE
      ?auto_5867 - HOIST
      ?auto_5868 - SURFACE
      ?auto_5865 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5863 ?auto_5864 ) ( SURFACE-AT ?auto_5861 ?auto_5864 ) ( CLEAR ?auto_5861 ) ( IS-CRATE ?auto_5862 ) ( AVAILABLE ?auto_5863 ) ( not ( = ?auto_5866 ?auto_5864 ) ) ( HOIST-AT ?auto_5867 ?auto_5866 ) ( AVAILABLE ?auto_5867 ) ( SURFACE-AT ?auto_5862 ?auto_5866 ) ( ON ?auto_5862 ?auto_5868 ) ( CLEAR ?auto_5862 ) ( TRUCK-AT ?auto_5865 ?auto_5864 ) ( not ( = ?auto_5861 ?auto_5862 ) ) ( not ( = ?auto_5861 ?auto_5868 ) ) ( not ( = ?auto_5862 ?auto_5868 ) ) ( not ( = ?auto_5863 ?auto_5867 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5865 ?auto_5864 ?auto_5866 )
      ( !LIFT ?auto_5867 ?auto_5862 ?auto_5868 ?auto_5866 )
      ( !LOAD ?auto_5867 ?auto_5862 ?auto_5865 ?auto_5866 )
      ( !DRIVE ?auto_5865 ?auto_5866 ?auto_5864 )
      ( !UNLOAD ?auto_5863 ?auto_5862 ?auto_5865 ?auto_5864 )
      ( !DROP ?auto_5863 ?auto_5862 ?auto_5861 ?auto_5864 )
      ( MAKE-1CRATE-VERIFY ?auto_5861 ?auto_5862 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_5878 - SURFACE
      ?auto_5879 - SURFACE
      ?auto_5880 - SURFACE
      ?auto_5881 - SURFACE
      ?auto_5882 - SURFACE
      ?auto_5884 - SURFACE
      ?auto_5883 - SURFACE
      ?auto_5886 - SURFACE
      ?auto_5885 - SURFACE
    )
    :vars
    (
      ?auto_5887 - HOIST
      ?auto_5889 - PLACE
      ?auto_5890 - PLACE
      ?auto_5888 - HOIST
      ?auto_5891 - SURFACE
      ?auto_5905 - PLACE
      ?auto_5894 - HOIST
      ?auto_5904 - SURFACE
      ?auto_5907 - PLACE
      ?auto_5898 - HOIST
      ?auto_5893 - SURFACE
      ?auto_5895 - PLACE
      ?auto_5903 - HOIST
      ?auto_5906 - SURFACE
      ?auto_5899 - SURFACE
      ?auto_5900 - PLACE
      ?auto_5896 - HOIST
      ?auto_5901 - SURFACE
      ?auto_5902 - SURFACE
      ?auto_5897 - SURFACE
      ?auto_5892 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5887 ?auto_5889 ) ( IS-CRATE ?auto_5885 ) ( not ( = ?auto_5890 ?auto_5889 ) ) ( HOIST-AT ?auto_5888 ?auto_5890 ) ( AVAILABLE ?auto_5888 ) ( SURFACE-AT ?auto_5885 ?auto_5890 ) ( ON ?auto_5885 ?auto_5891 ) ( CLEAR ?auto_5885 ) ( not ( = ?auto_5886 ?auto_5885 ) ) ( not ( = ?auto_5886 ?auto_5891 ) ) ( not ( = ?auto_5885 ?auto_5891 ) ) ( not ( = ?auto_5887 ?auto_5888 ) ) ( IS-CRATE ?auto_5886 ) ( not ( = ?auto_5905 ?auto_5889 ) ) ( HOIST-AT ?auto_5894 ?auto_5905 ) ( SURFACE-AT ?auto_5886 ?auto_5905 ) ( ON ?auto_5886 ?auto_5904 ) ( CLEAR ?auto_5886 ) ( not ( = ?auto_5883 ?auto_5886 ) ) ( not ( = ?auto_5883 ?auto_5904 ) ) ( not ( = ?auto_5886 ?auto_5904 ) ) ( not ( = ?auto_5887 ?auto_5894 ) ) ( IS-CRATE ?auto_5883 ) ( not ( = ?auto_5907 ?auto_5889 ) ) ( HOIST-AT ?auto_5898 ?auto_5907 ) ( SURFACE-AT ?auto_5883 ?auto_5907 ) ( ON ?auto_5883 ?auto_5893 ) ( CLEAR ?auto_5883 ) ( not ( = ?auto_5884 ?auto_5883 ) ) ( not ( = ?auto_5884 ?auto_5893 ) ) ( not ( = ?auto_5883 ?auto_5893 ) ) ( not ( = ?auto_5887 ?auto_5898 ) ) ( IS-CRATE ?auto_5884 ) ( not ( = ?auto_5895 ?auto_5889 ) ) ( HOIST-AT ?auto_5903 ?auto_5895 ) ( AVAILABLE ?auto_5903 ) ( SURFACE-AT ?auto_5884 ?auto_5895 ) ( ON ?auto_5884 ?auto_5906 ) ( CLEAR ?auto_5884 ) ( not ( = ?auto_5882 ?auto_5884 ) ) ( not ( = ?auto_5882 ?auto_5906 ) ) ( not ( = ?auto_5884 ?auto_5906 ) ) ( not ( = ?auto_5887 ?auto_5903 ) ) ( IS-CRATE ?auto_5882 ) ( SURFACE-AT ?auto_5882 ?auto_5907 ) ( ON ?auto_5882 ?auto_5899 ) ( CLEAR ?auto_5882 ) ( not ( = ?auto_5881 ?auto_5882 ) ) ( not ( = ?auto_5881 ?auto_5899 ) ) ( not ( = ?auto_5882 ?auto_5899 ) ) ( IS-CRATE ?auto_5881 ) ( not ( = ?auto_5900 ?auto_5889 ) ) ( HOIST-AT ?auto_5896 ?auto_5900 ) ( AVAILABLE ?auto_5896 ) ( SURFACE-AT ?auto_5881 ?auto_5900 ) ( ON ?auto_5881 ?auto_5901 ) ( CLEAR ?auto_5881 ) ( not ( = ?auto_5880 ?auto_5881 ) ) ( not ( = ?auto_5880 ?auto_5901 ) ) ( not ( = ?auto_5881 ?auto_5901 ) ) ( not ( = ?auto_5887 ?auto_5896 ) ) ( IS-CRATE ?auto_5880 ) ( AVAILABLE ?auto_5894 ) ( SURFACE-AT ?auto_5880 ?auto_5905 ) ( ON ?auto_5880 ?auto_5902 ) ( CLEAR ?auto_5880 ) ( not ( = ?auto_5879 ?auto_5880 ) ) ( not ( = ?auto_5879 ?auto_5902 ) ) ( not ( = ?auto_5880 ?auto_5902 ) ) ( SURFACE-AT ?auto_5878 ?auto_5889 ) ( CLEAR ?auto_5878 ) ( IS-CRATE ?auto_5879 ) ( AVAILABLE ?auto_5887 ) ( AVAILABLE ?auto_5898 ) ( SURFACE-AT ?auto_5879 ?auto_5907 ) ( ON ?auto_5879 ?auto_5897 ) ( CLEAR ?auto_5879 ) ( TRUCK-AT ?auto_5892 ?auto_5889 ) ( not ( = ?auto_5878 ?auto_5879 ) ) ( not ( = ?auto_5878 ?auto_5897 ) ) ( not ( = ?auto_5879 ?auto_5897 ) ) ( not ( = ?auto_5878 ?auto_5880 ) ) ( not ( = ?auto_5878 ?auto_5902 ) ) ( not ( = ?auto_5880 ?auto_5897 ) ) ( not ( = ?auto_5905 ?auto_5907 ) ) ( not ( = ?auto_5894 ?auto_5898 ) ) ( not ( = ?auto_5902 ?auto_5897 ) ) ( not ( = ?auto_5878 ?auto_5881 ) ) ( not ( = ?auto_5878 ?auto_5901 ) ) ( not ( = ?auto_5879 ?auto_5881 ) ) ( not ( = ?auto_5879 ?auto_5901 ) ) ( not ( = ?auto_5881 ?auto_5902 ) ) ( not ( = ?auto_5881 ?auto_5897 ) ) ( not ( = ?auto_5900 ?auto_5905 ) ) ( not ( = ?auto_5900 ?auto_5907 ) ) ( not ( = ?auto_5896 ?auto_5894 ) ) ( not ( = ?auto_5896 ?auto_5898 ) ) ( not ( = ?auto_5901 ?auto_5902 ) ) ( not ( = ?auto_5901 ?auto_5897 ) ) ( not ( = ?auto_5878 ?auto_5882 ) ) ( not ( = ?auto_5878 ?auto_5899 ) ) ( not ( = ?auto_5879 ?auto_5882 ) ) ( not ( = ?auto_5879 ?auto_5899 ) ) ( not ( = ?auto_5880 ?auto_5882 ) ) ( not ( = ?auto_5880 ?auto_5899 ) ) ( not ( = ?auto_5882 ?auto_5901 ) ) ( not ( = ?auto_5882 ?auto_5902 ) ) ( not ( = ?auto_5882 ?auto_5897 ) ) ( not ( = ?auto_5899 ?auto_5901 ) ) ( not ( = ?auto_5899 ?auto_5902 ) ) ( not ( = ?auto_5899 ?auto_5897 ) ) ( not ( = ?auto_5878 ?auto_5884 ) ) ( not ( = ?auto_5878 ?auto_5906 ) ) ( not ( = ?auto_5879 ?auto_5884 ) ) ( not ( = ?auto_5879 ?auto_5906 ) ) ( not ( = ?auto_5880 ?auto_5884 ) ) ( not ( = ?auto_5880 ?auto_5906 ) ) ( not ( = ?auto_5881 ?auto_5884 ) ) ( not ( = ?auto_5881 ?auto_5906 ) ) ( not ( = ?auto_5884 ?auto_5899 ) ) ( not ( = ?auto_5884 ?auto_5901 ) ) ( not ( = ?auto_5884 ?auto_5902 ) ) ( not ( = ?auto_5884 ?auto_5897 ) ) ( not ( = ?auto_5895 ?auto_5907 ) ) ( not ( = ?auto_5895 ?auto_5900 ) ) ( not ( = ?auto_5895 ?auto_5905 ) ) ( not ( = ?auto_5903 ?auto_5898 ) ) ( not ( = ?auto_5903 ?auto_5896 ) ) ( not ( = ?auto_5903 ?auto_5894 ) ) ( not ( = ?auto_5906 ?auto_5899 ) ) ( not ( = ?auto_5906 ?auto_5901 ) ) ( not ( = ?auto_5906 ?auto_5902 ) ) ( not ( = ?auto_5906 ?auto_5897 ) ) ( not ( = ?auto_5878 ?auto_5883 ) ) ( not ( = ?auto_5878 ?auto_5893 ) ) ( not ( = ?auto_5879 ?auto_5883 ) ) ( not ( = ?auto_5879 ?auto_5893 ) ) ( not ( = ?auto_5880 ?auto_5883 ) ) ( not ( = ?auto_5880 ?auto_5893 ) ) ( not ( = ?auto_5881 ?auto_5883 ) ) ( not ( = ?auto_5881 ?auto_5893 ) ) ( not ( = ?auto_5882 ?auto_5883 ) ) ( not ( = ?auto_5882 ?auto_5893 ) ) ( not ( = ?auto_5883 ?auto_5906 ) ) ( not ( = ?auto_5883 ?auto_5899 ) ) ( not ( = ?auto_5883 ?auto_5901 ) ) ( not ( = ?auto_5883 ?auto_5902 ) ) ( not ( = ?auto_5883 ?auto_5897 ) ) ( not ( = ?auto_5893 ?auto_5906 ) ) ( not ( = ?auto_5893 ?auto_5899 ) ) ( not ( = ?auto_5893 ?auto_5901 ) ) ( not ( = ?auto_5893 ?auto_5902 ) ) ( not ( = ?auto_5893 ?auto_5897 ) ) ( not ( = ?auto_5878 ?auto_5886 ) ) ( not ( = ?auto_5878 ?auto_5904 ) ) ( not ( = ?auto_5879 ?auto_5886 ) ) ( not ( = ?auto_5879 ?auto_5904 ) ) ( not ( = ?auto_5880 ?auto_5886 ) ) ( not ( = ?auto_5880 ?auto_5904 ) ) ( not ( = ?auto_5881 ?auto_5886 ) ) ( not ( = ?auto_5881 ?auto_5904 ) ) ( not ( = ?auto_5882 ?auto_5886 ) ) ( not ( = ?auto_5882 ?auto_5904 ) ) ( not ( = ?auto_5884 ?auto_5886 ) ) ( not ( = ?auto_5884 ?auto_5904 ) ) ( not ( = ?auto_5886 ?auto_5893 ) ) ( not ( = ?auto_5886 ?auto_5906 ) ) ( not ( = ?auto_5886 ?auto_5899 ) ) ( not ( = ?auto_5886 ?auto_5901 ) ) ( not ( = ?auto_5886 ?auto_5902 ) ) ( not ( = ?auto_5886 ?auto_5897 ) ) ( not ( = ?auto_5904 ?auto_5893 ) ) ( not ( = ?auto_5904 ?auto_5906 ) ) ( not ( = ?auto_5904 ?auto_5899 ) ) ( not ( = ?auto_5904 ?auto_5901 ) ) ( not ( = ?auto_5904 ?auto_5902 ) ) ( not ( = ?auto_5904 ?auto_5897 ) ) ( not ( = ?auto_5878 ?auto_5885 ) ) ( not ( = ?auto_5878 ?auto_5891 ) ) ( not ( = ?auto_5879 ?auto_5885 ) ) ( not ( = ?auto_5879 ?auto_5891 ) ) ( not ( = ?auto_5880 ?auto_5885 ) ) ( not ( = ?auto_5880 ?auto_5891 ) ) ( not ( = ?auto_5881 ?auto_5885 ) ) ( not ( = ?auto_5881 ?auto_5891 ) ) ( not ( = ?auto_5882 ?auto_5885 ) ) ( not ( = ?auto_5882 ?auto_5891 ) ) ( not ( = ?auto_5884 ?auto_5885 ) ) ( not ( = ?auto_5884 ?auto_5891 ) ) ( not ( = ?auto_5883 ?auto_5885 ) ) ( not ( = ?auto_5883 ?auto_5891 ) ) ( not ( = ?auto_5885 ?auto_5904 ) ) ( not ( = ?auto_5885 ?auto_5893 ) ) ( not ( = ?auto_5885 ?auto_5906 ) ) ( not ( = ?auto_5885 ?auto_5899 ) ) ( not ( = ?auto_5885 ?auto_5901 ) ) ( not ( = ?auto_5885 ?auto_5902 ) ) ( not ( = ?auto_5885 ?auto_5897 ) ) ( not ( = ?auto_5890 ?auto_5905 ) ) ( not ( = ?auto_5890 ?auto_5907 ) ) ( not ( = ?auto_5890 ?auto_5895 ) ) ( not ( = ?auto_5890 ?auto_5900 ) ) ( not ( = ?auto_5888 ?auto_5894 ) ) ( not ( = ?auto_5888 ?auto_5898 ) ) ( not ( = ?auto_5888 ?auto_5903 ) ) ( not ( = ?auto_5888 ?auto_5896 ) ) ( not ( = ?auto_5891 ?auto_5904 ) ) ( not ( = ?auto_5891 ?auto_5893 ) ) ( not ( = ?auto_5891 ?auto_5906 ) ) ( not ( = ?auto_5891 ?auto_5899 ) ) ( not ( = ?auto_5891 ?auto_5901 ) ) ( not ( = ?auto_5891 ?auto_5902 ) ) ( not ( = ?auto_5891 ?auto_5897 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_5878 ?auto_5879 ?auto_5880 ?auto_5881 ?auto_5882 ?auto_5884 ?auto_5883 ?auto_5886 )
      ( MAKE-1CRATE ?auto_5886 ?auto_5885 )
      ( MAKE-8CRATE-VERIFY ?auto_5878 ?auto_5879 ?auto_5880 ?auto_5881 ?auto_5882 ?auto_5884 ?auto_5883 ?auto_5886 ?auto_5885 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5910 - SURFACE
      ?auto_5911 - SURFACE
    )
    :vars
    (
      ?auto_5912 - HOIST
      ?auto_5913 - PLACE
      ?auto_5915 - PLACE
      ?auto_5916 - HOIST
      ?auto_5917 - SURFACE
      ?auto_5914 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5912 ?auto_5913 ) ( SURFACE-AT ?auto_5910 ?auto_5913 ) ( CLEAR ?auto_5910 ) ( IS-CRATE ?auto_5911 ) ( AVAILABLE ?auto_5912 ) ( not ( = ?auto_5915 ?auto_5913 ) ) ( HOIST-AT ?auto_5916 ?auto_5915 ) ( AVAILABLE ?auto_5916 ) ( SURFACE-AT ?auto_5911 ?auto_5915 ) ( ON ?auto_5911 ?auto_5917 ) ( CLEAR ?auto_5911 ) ( TRUCK-AT ?auto_5914 ?auto_5913 ) ( not ( = ?auto_5910 ?auto_5911 ) ) ( not ( = ?auto_5910 ?auto_5917 ) ) ( not ( = ?auto_5911 ?auto_5917 ) ) ( not ( = ?auto_5912 ?auto_5916 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5914 ?auto_5913 ?auto_5915 )
      ( !LIFT ?auto_5916 ?auto_5911 ?auto_5917 ?auto_5915 )
      ( !LOAD ?auto_5916 ?auto_5911 ?auto_5914 ?auto_5915 )
      ( !DRIVE ?auto_5914 ?auto_5915 ?auto_5913 )
      ( !UNLOAD ?auto_5912 ?auto_5911 ?auto_5914 ?auto_5913 )
      ( !DROP ?auto_5912 ?auto_5911 ?auto_5910 ?auto_5913 )
      ( MAKE-1CRATE-VERIFY ?auto_5910 ?auto_5911 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_5928 - SURFACE
      ?auto_5929 - SURFACE
      ?auto_5930 - SURFACE
      ?auto_5931 - SURFACE
      ?auto_5932 - SURFACE
      ?auto_5935 - SURFACE
      ?auto_5933 - SURFACE
      ?auto_5937 - SURFACE
      ?auto_5936 - SURFACE
      ?auto_5934 - SURFACE
    )
    :vars
    (
      ?auto_5943 - HOIST
      ?auto_5939 - PLACE
      ?auto_5941 - PLACE
      ?auto_5938 - HOIST
      ?auto_5940 - SURFACE
      ?auto_5951 - PLACE
      ?auto_5956 - HOIST
      ?auto_5955 - SURFACE
      ?auto_5945 - PLACE
      ?auto_5952 - HOIST
      ?auto_5944 - SURFACE
      ?auto_5954 - PLACE
      ?auto_5949 - HOIST
      ?auto_5958 - SURFACE
      ?auto_5957 - PLACE
      ?auto_5960 - HOIST
      ?auto_5946 - SURFACE
      ?auto_5948 - SURFACE
      ?auto_5947 - PLACE
      ?auto_5953 - HOIST
      ?auto_5959 - SURFACE
      ?auto_5961 - SURFACE
      ?auto_5950 - SURFACE
      ?auto_5942 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5943 ?auto_5939 ) ( IS-CRATE ?auto_5934 ) ( not ( = ?auto_5941 ?auto_5939 ) ) ( HOIST-AT ?auto_5938 ?auto_5941 ) ( AVAILABLE ?auto_5938 ) ( SURFACE-AT ?auto_5934 ?auto_5941 ) ( ON ?auto_5934 ?auto_5940 ) ( CLEAR ?auto_5934 ) ( not ( = ?auto_5936 ?auto_5934 ) ) ( not ( = ?auto_5936 ?auto_5940 ) ) ( not ( = ?auto_5934 ?auto_5940 ) ) ( not ( = ?auto_5943 ?auto_5938 ) ) ( IS-CRATE ?auto_5936 ) ( not ( = ?auto_5951 ?auto_5939 ) ) ( HOIST-AT ?auto_5956 ?auto_5951 ) ( AVAILABLE ?auto_5956 ) ( SURFACE-AT ?auto_5936 ?auto_5951 ) ( ON ?auto_5936 ?auto_5955 ) ( CLEAR ?auto_5936 ) ( not ( = ?auto_5937 ?auto_5936 ) ) ( not ( = ?auto_5937 ?auto_5955 ) ) ( not ( = ?auto_5936 ?auto_5955 ) ) ( not ( = ?auto_5943 ?auto_5956 ) ) ( IS-CRATE ?auto_5937 ) ( not ( = ?auto_5945 ?auto_5939 ) ) ( HOIST-AT ?auto_5952 ?auto_5945 ) ( SURFACE-AT ?auto_5937 ?auto_5945 ) ( ON ?auto_5937 ?auto_5944 ) ( CLEAR ?auto_5937 ) ( not ( = ?auto_5933 ?auto_5937 ) ) ( not ( = ?auto_5933 ?auto_5944 ) ) ( not ( = ?auto_5937 ?auto_5944 ) ) ( not ( = ?auto_5943 ?auto_5952 ) ) ( IS-CRATE ?auto_5933 ) ( not ( = ?auto_5954 ?auto_5939 ) ) ( HOIST-AT ?auto_5949 ?auto_5954 ) ( SURFACE-AT ?auto_5933 ?auto_5954 ) ( ON ?auto_5933 ?auto_5958 ) ( CLEAR ?auto_5933 ) ( not ( = ?auto_5935 ?auto_5933 ) ) ( not ( = ?auto_5935 ?auto_5958 ) ) ( not ( = ?auto_5933 ?auto_5958 ) ) ( not ( = ?auto_5943 ?auto_5949 ) ) ( IS-CRATE ?auto_5935 ) ( not ( = ?auto_5957 ?auto_5939 ) ) ( HOIST-AT ?auto_5960 ?auto_5957 ) ( AVAILABLE ?auto_5960 ) ( SURFACE-AT ?auto_5935 ?auto_5957 ) ( ON ?auto_5935 ?auto_5946 ) ( CLEAR ?auto_5935 ) ( not ( = ?auto_5932 ?auto_5935 ) ) ( not ( = ?auto_5932 ?auto_5946 ) ) ( not ( = ?auto_5935 ?auto_5946 ) ) ( not ( = ?auto_5943 ?auto_5960 ) ) ( IS-CRATE ?auto_5932 ) ( SURFACE-AT ?auto_5932 ?auto_5954 ) ( ON ?auto_5932 ?auto_5948 ) ( CLEAR ?auto_5932 ) ( not ( = ?auto_5931 ?auto_5932 ) ) ( not ( = ?auto_5931 ?auto_5948 ) ) ( not ( = ?auto_5932 ?auto_5948 ) ) ( IS-CRATE ?auto_5931 ) ( not ( = ?auto_5947 ?auto_5939 ) ) ( HOIST-AT ?auto_5953 ?auto_5947 ) ( AVAILABLE ?auto_5953 ) ( SURFACE-AT ?auto_5931 ?auto_5947 ) ( ON ?auto_5931 ?auto_5959 ) ( CLEAR ?auto_5931 ) ( not ( = ?auto_5930 ?auto_5931 ) ) ( not ( = ?auto_5930 ?auto_5959 ) ) ( not ( = ?auto_5931 ?auto_5959 ) ) ( not ( = ?auto_5943 ?auto_5953 ) ) ( IS-CRATE ?auto_5930 ) ( AVAILABLE ?auto_5952 ) ( SURFACE-AT ?auto_5930 ?auto_5945 ) ( ON ?auto_5930 ?auto_5961 ) ( CLEAR ?auto_5930 ) ( not ( = ?auto_5929 ?auto_5930 ) ) ( not ( = ?auto_5929 ?auto_5961 ) ) ( not ( = ?auto_5930 ?auto_5961 ) ) ( SURFACE-AT ?auto_5928 ?auto_5939 ) ( CLEAR ?auto_5928 ) ( IS-CRATE ?auto_5929 ) ( AVAILABLE ?auto_5943 ) ( AVAILABLE ?auto_5949 ) ( SURFACE-AT ?auto_5929 ?auto_5954 ) ( ON ?auto_5929 ?auto_5950 ) ( CLEAR ?auto_5929 ) ( TRUCK-AT ?auto_5942 ?auto_5939 ) ( not ( = ?auto_5928 ?auto_5929 ) ) ( not ( = ?auto_5928 ?auto_5950 ) ) ( not ( = ?auto_5929 ?auto_5950 ) ) ( not ( = ?auto_5928 ?auto_5930 ) ) ( not ( = ?auto_5928 ?auto_5961 ) ) ( not ( = ?auto_5930 ?auto_5950 ) ) ( not ( = ?auto_5945 ?auto_5954 ) ) ( not ( = ?auto_5952 ?auto_5949 ) ) ( not ( = ?auto_5961 ?auto_5950 ) ) ( not ( = ?auto_5928 ?auto_5931 ) ) ( not ( = ?auto_5928 ?auto_5959 ) ) ( not ( = ?auto_5929 ?auto_5931 ) ) ( not ( = ?auto_5929 ?auto_5959 ) ) ( not ( = ?auto_5931 ?auto_5961 ) ) ( not ( = ?auto_5931 ?auto_5950 ) ) ( not ( = ?auto_5947 ?auto_5945 ) ) ( not ( = ?auto_5947 ?auto_5954 ) ) ( not ( = ?auto_5953 ?auto_5952 ) ) ( not ( = ?auto_5953 ?auto_5949 ) ) ( not ( = ?auto_5959 ?auto_5961 ) ) ( not ( = ?auto_5959 ?auto_5950 ) ) ( not ( = ?auto_5928 ?auto_5932 ) ) ( not ( = ?auto_5928 ?auto_5948 ) ) ( not ( = ?auto_5929 ?auto_5932 ) ) ( not ( = ?auto_5929 ?auto_5948 ) ) ( not ( = ?auto_5930 ?auto_5932 ) ) ( not ( = ?auto_5930 ?auto_5948 ) ) ( not ( = ?auto_5932 ?auto_5959 ) ) ( not ( = ?auto_5932 ?auto_5961 ) ) ( not ( = ?auto_5932 ?auto_5950 ) ) ( not ( = ?auto_5948 ?auto_5959 ) ) ( not ( = ?auto_5948 ?auto_5961 ) ) ( not ( = ?auto_5948 ?auto_5950 ) ) ( not ( = ?auto_5928 ?auto_5935 ) ) ( not ( = ?auto_5928 ?auto_5946 ) ) ( not ( = ?auto_5929 ?auto_5935 ) ) ( not ( = ?auto_5929 ?auto_5946 ) ) ( not ( = ?auto_5930 ?auto_5935 ) ) ( not ( = ?auto_5930 ?auto_5946 ) ) ( not ( = ?auto_5931 ?auto_5935 ) ) ( not ( = ?auto_5931 ?auto_5946 ) ) ( not ( = ?auto_5935 ?auto_5948 ) ) ( not ( = ?auto_5935 ?auto_5959 ) ) ( not ( = ?auto_5935 ?auto_5961 ) ) ( not ( = ?auto_5935 ?auto_5950 ) ) ( not ( = ?auto_5957 ?auto_5954 ) ) ( not ( = ?auto_5957 ?auto_5947 ) ) ( not ( = ?auto_5957 ?auto_5945 ) ) ( not ( = ?auto_5960 ?auto_5949 ) ) ( not ( = ?auto_5960 ?auto_5953 ) ) ( not ( = ?auto_5960 ?auto_5952 ) ) ( not ( = ?auto_5946 ?auto_5948 ) ) ( not ( = ?auto_5946 ?auto_5959 ) ) ( not ( = ?auto_5946 ?auto_5961 ) ) ( not ( = ?auto_5946 ?auto_5950 ) ) ( not ( = ?auto_5928 ?auto_5933 ) ) ( not ( = ?auto_5928 ?auto_5958 ) ) ( not ( = ?auto_5929 ?auto_5933 ) ) ( not ( = ?auto_5929 ?auto_5958 ) ) ( not ( = ?auto_5930 ?auto_5933 ) ) ( not ( = ?auto_5930 ?auto_5958 ) ) ( not ( = ?auto_5931 ?auto_5933 ) ) ( not ( = ?auto_5931 ?auto_5958 ) ) ( not ( = ?auto_5932 ?auto_5933 ) ) ( not ( = ?auto_5932 ?auto_5958 ) ) ( not ( = ?auto_5933 ?auto_5946 ) ) ( not ( = ?auto_5933 ?auto_5948 ) ) ( not ( = ?auto_5933 ?auto_5959 ) ) ( not ( = ?auto_5933 ?auto_5961 ) ) ( not ( = ?auto_5933 ?auto_5950 ) ) ( not ( = ?auto_5958 ?auto_5946 ) ) ( not ( = ?auto_5958 ?auto_5948 ) ) ( not ( = ?auto_5958 ?auto_5959 ) ) ( not ( = ?auto_5958 ?auto_5961 ) ) ( not ( = ?auto_5958 ?auto_5950 ) ) ( not ( = ?auto_5928 ?auto_5937 ) ) ( not ( = ?auto_5928 ?auto_5944 ) ) ( not ( = ?auto_5929 ?auto_5937 ) ) ( not ( = ?auto_5929 ?auto_5944 ) ) ( not ( = ?auto_5930 ?auto_5937 ) ) ( not ( = ?auto_5930 ?auto_5944 ) ) ( not ( = ?auto_5931 ?auto_5937 ) ) ( not ( = ?auto_5931 ?auto_5944 ) ) ( not ( = ?auto_5932 ?auto_5937 ) ) ( not ( = ?auto_5932 ?auto_5944 ) ) ( not ( = ?auto_5935 ?auto_5937 ) ) ( not ( = ?auto_5935 ?auto_5944 ) ) ( not ( = ?auto_5937 ?auto_5958 ) ) ( not ( = ?auto_5937 ?auto_5946 ) ) ( not ( = ?auto_5937 ?auto_5948 ) ) ( not ( = ?auto_5937 ?auto_5959 ) ) ( not ( = ?auto_5937 ?auto_5961 ) ) ( not ( = ?auto_5937 ?auto_5950 ) ) ( not ( = ?auto_5944 ?auto_5958 ) ) ( not ( = ?auto_5944 ?auto_5946 ) ) ( not ( = ?auto_5944 ?auto_5948 ) ) ( not ( = ?auto_5944 ?auto_5959 ) ) ( not ( = ?auto_5944 ?auto_5961 ) ) ( not ( = ?auto_5944 ?auto_5950 ) ) ( not ( = ?auto_5928 ?auto_5936 ) ) ( not ( = ?auto_5928 ?auto_5955 ) ) ( not ( = ?auto_5929 ?auto_5936 ) ) ( not ( = ?auto_5929 ?auto_5955 ) ) ( not ( = ?auto_5930 ?auto_5936 ) ) ( not ( = ?auto_5930 ?auto_5955 ) ) ( not ( = ?auto_5931 ?auto_5936 ) ) ( not ( = ?auto_5931 ?auto_5955 ) ) ( not ( = ?auto_5932 ?auto_5936 ) ) ( not ( = ?auto_5932 ?auto_5955 ) ) ( not ( = ?auto_5935 ?auto_5936 ) ) ( not ( = ?auto_5935 ?auto_5955 ) ) ( not ( = ?auto_5933 ?auto_5936 ) ) ( not ( = ?auto_5933 ?auto_5955 ) ) ( not ( = ?auto_5936 ?auto_5944 ) ) ( not ( = ?auto_5936 ?auto_5958 ) ) ( not ( = ?auto_5936 ?auto_5946 ) ) ( not ( = ?auto_5936 ?auto_5948 ) ) ( not ( = ?auto_5936 ?auto_5959 ) ) ( not ( = ?auto_5936 ?auto_5961 ) ) ( not ( = ?auto_5936 ?auto_5950 ) ) ( not ( = ?auto_5951 ?auto_5945 ) ) ( not ( = ?auto_5951 ?auto_5954 ) ) ( not ( = ?auto_5951 ?auto_5957 ) ) ( not ( = ?auto_5951 ?auto_5947 ) ) ( not ( = ?auto_5956 ?auto_5952 ) ) ( not ( = ?auto_5956 ?auto_5949 ) ) ( not ( = ?auto_5956 ?auto_5960 ) ) ( not ( = ?auto_5956 ?auto_5953 ) ) ( not ( = ?auto_5955 ?auto_5944 ) ) ( not ( = ?auto_5955 ?auto_5958 ) ) ( not ( = ?auto_5955 ?auto_5946 ) ) ( not ( = ?auto_5955 ?auto_5948 ) ) ( not ( = ?auto_5955 ?auto_5959 ) ) ( not ( = ?auto_5955 ?auto_5961 ) ) ( not ( = ?auto_5955 ?auto_5950 ) ) ( not ( = ?auto_5928 ?auto_5934 ) ) ( not ( = ?auto_5928 ?auto_5940 ) ) ( not ( = ?auto_5929 ?auto_5934 ) ) ( not ( = ?auto_5929 ?auto_5940 ) ) ( not ( = ?auto_5930 ?auto_5934 ) ) ( not ( = ?auto_5930 ?auto_5940 ) ) ( not ( = ?auto_5931 ?auto_5934 ) ) ( not ( = ?auto_5931 ?auto_5940 ) ) ( not ( = ?auto_5932 ?auto_5934 ) ) ( not ( = ?auto_5932 ?auto_5940 ) ) ( not ( = ?auto_5935 ?auto_5934 ) ) ( not ( = ?auto_5935 ?auto_5940 ) ) ( not ( = ?auto_5933 ?auto_5934 ) ) ( not ( = ?auto_5933 ?auto_5940 ) ) ( not ( = ?auto_5937 ?auto_5934 ) ) ( not ( = ?auto_5937 ?auto_5940 ) ) ( not ( = ?auto_5934 ?auto_5955 ) ) ( not ( = ?auto_5934 ?auto_5944 ) ) ( not ( = ?auto_5934 ?auto_5958 ) ) ( not ( = ?auto_5934 ?auto_5946 ) ) ( not ( = ?auto_5934 ?auto_5948 ) ) ( not ( = ?auto_5934 ?auto_5959 ) ) ( not ( = ?auto_5934 ?auto_5961 ) ) ( not ( = ?auto_5934 ?auto_5950 ) ) ( not ( = ?auto_5941 ?auto_5951 ) ) ( not ( = ?auto_5941 ?auto_5945 ) ) ( not ( = ?auto_5941 ?auto_5954 ) ) ( not ( = ?auto_5941 ?auto_5957 ) ) ( not ( = ?auto_5941 ?auto_5947 ) ) ( not ( = ?auto_5938 ?auto_5956 ) ) ( not ( = ?auto_5938 ?auto_5952 ) ) ( not ( = ?auto_5938 ?auto_5949 ) ) ( not ( = ?auto_5938 ?auto_5960 ) ) ( not ( = ?auto_5938 ?auto_5953 ) ) ( not ( = ?auto_5940 ?auto_5955 ) ) ( not ( = ?auto_5940 ?auto_5944 ) ) ( not ( = ?auto_5940 ?auto_5958 ) ) ( not ( = ?auto_5940 ?auto_5946 ) ) ( not ( = ?auto_5940 ?auto_5948 ) ) ( not ( = ?auto_5940 ?auto_5959 ) ) ( not ( = ?auto_5940 ?auto_5961 ) ) ( not ( = ?auto_5940 ?auto_5950 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_5928 ?auto_5929 ?auto_5930 ?auto_5931 ?auto_5932 ?auto_5935 ?auto_5933 ?auto_5937 ?auto_5936 )
      ( MAKE-1CRATE ?auto_5936 ?auto_5934 )
      ( MAKE-9CRATE-VERIFY ?auto_5928 ?auto_5929 ?auto_5930 ?auto_5931 ?auto_5932 ?auto_5935 ?auto_5933 ?auto_5937 ?auto_5936 ?auto_5934 ) )
  )

)

