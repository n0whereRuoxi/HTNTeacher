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

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_5661 - SURFACE
      ?auto_5662 - SURFACE
      ?auto_5663 - SURFACE
    )
    :vars
    (
      ?auto_5666 - HOIST
      ?auto_5664 - PLACE
      ?auto_5667 - PLACE
      ?auto_5668 - HOIST
      ?auto_5669 - SURFACE
      ?auto_5671 - PLACE
      ?auto_5672 - HOIST
      ?auto_5670 - SURFACE
      ?auto_5665 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5666 ?auto_5664 ) ( IS-CRATE ?auto_5663 ) ( not ( = ?auto_5667 ?auto_5664 ) ) ( HOIST-AT ?auto_5668 ?auto_5667 ) ( AVAILABLE ?auto_5668 ) ( SURFACE-AT ?auto_5663 ?auto_5667 ) ( ON ?auto_5663 ?auto_5669 ) ( CLEAR ?auto_5663 ) ( not ( = ?auto_5662 ?auto_5663 ) ) ( not ( = ?auto_5662 ?auto_5669 ) ) ( not ( = ?auto_5663 ?auto_5669 ) ) ( not ( = ?auto_5666 ?auto_5668 ) ) ( SURFACE-AT ?auto_5661 ?auto_5664 ) ( CLEAR ?auto_5661 ) ( IS-CRATE ?auto_5662 ) ( AVAILABLE ?auto_5666 ) ( not ( = ?auto_5671 ?auto_5664 ) ) ( HOIST-AT ?auto_5672 ?auto_5671 ) ( AVAILABLE ?auto_5672 ) ( SURFACE-AT ?auto_5662 ?auto_5671 ) ( ON ?auto_5662 ?auto_5670 ) ( CLEAR ?auto_5662 ) ( TRUCK-AT ?auto_5665 ?auto_5664 ) ( not ( = ?auto_5661 ?auto_5662 ) ) ( not ( = ?auto_5661 ?auto_5670 ) ) ( not ( = ?auto_5662 ?auto_5670 ) ) ( not ( = ?auto_5666 ?auto_5672 ) ) ( not ( = ?auto_5661 ?auto_5663 ) ) ( not ( = ?auto_5661 ?auto_5669 ) ) ( not ( = ?auto_5663 ?auto_5670 ) ) ( not ( = ?auto_5667 ?auto_5671 ) ) ( not ( = ?auto_5668 ?auto_5672 ) ) ( not ( = ?auto_5669 ?auto_5670 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_5661 ?auto_5662 )
      ( MAKE-1CRATE ?auto_5662 ?auto_5663 )
      ( MAKE-2CRATE-VERIFY ?auto_5661 ?auto_5662 ?auto_5663 ) )
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
      ?auto_5692 - HOIST
      ?auto_5696 - PLACE
      ?auto_5694 - PLACE
      ?auto_5695 - HOIST
      ?auto_5693 - SURFACE
      ?auto_5702 - PLACE
      ?auto_5699 - HOIST
      ?auto_5697 - SURFACE
      ?auto_5700 - PLACE
      ?auto_5698 - HOIST
      ?auto_5701 - SURFACE
      ?auto_5691 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5692 ?auto_5696 ) ( IS-CRATE ?auto_5690 ) ( not ( = ?auto_5694 ?auto_5696 ) ) ( HOIST-AT ?auto_5695 ?auto_5694 ) ( AVAILABLE ?auto_5695 ) ( SURFACE-AT ?auto_5690 ?auto_5694 ) ( ON ?auto_5690 ?auto_5693 ) ( CLEAR ?auto_5690 ) ( not ( = ?auto_5689 ?auto_5690 ) ) ( not ( = ?auto_5689 ?auto_5693 ) ) ( not ( = ?auto_5690 ?auto_5693 ) ) ( not ( = ?auto_5692 ?auto_5695 ) ) ( IS-CRATE ?auto_5689 ) ( not ( = ?auto_5702 ?auto_5696 ) ) ( HOIST-AT ?auto_5699 ?auto_5702 ) ( AVAILABLE ?auto_5699 ) ( SURFACE-AT ?auto_5689 ?auto_5702 ) ( ON ?auto_5689 ?auto_5697 ) ( CLEAR ?auto_5689 ) ( not ( = ?auto_5688 ?auto_5689 ) ) ( not ( = ?auto_5688 ?auto_5697 ) ) ( not ( = ?auto_5689 ?auto_5697 ) ) ( not ( = ?auto_5692 ?auto_5699 ) ) ( SURFACE-AT ?auto_5687 ?auto_5696 ) ( CLEAR ?auto_5687 ) ( IS-CRATE ?auto_5688 ) ( AVAILABLE ?auto_5692 ) ( not ( = ?auto_5700 ?auto_5696 ) ) ( HOIST-AT ?auto_5698 ?auto_5700 ) ( AVAILABLE ?auto_5698 ) ( SURFACE-AT ?auto_5688 ?auto_5700 ) ( ON ?auto_5688 ?auto_5701 ) ( CLEAR ?auto_5688 ) ( TRUCK-AT ?auto_5691 ?auto_5696 ) ( not ( = ?auto_5687 ?auto_5688 ) ) ( not ( = ?auto_5687 ?auto_5701 ) ) ( not ( = ?auto_5688 ?auto_5701 ) ) ( not ( = ?auto_5692 ?auto_5698 ) ) ( not ( = ?auto_5687 ?auto_5689 ) ) ( not ( = ?auto_5687 ?auto_5697 ) ) ( not ( = ?auto_5689 ?auto_5701 ) ) ( not ( = ?auto_5702 ?auto_5700 ) ) ( not ( = ?auto_5699 ?auto_5698 ) ) ( not ( = ?auto_5697 ?auto_5701 ) ) ( not ( = ?auto_5687 ?auto_5690 ) ) ( not ( = ?auto_5687 ?auto_5693 ) ) ( not ( = ?auto_5688 ?auto_5690 ) ) ( not ( = ?auto_5688 ?auto_5693 ) ) ( not ( = ?auto_5690 ?auto_5697 ) ) ( not ( = ?auto_5690 ?auto_5701 ) ) ( not ( = ?auto_5694 ?auto_5702 ) ) ( not ( = ?auto_5694 ?auto_5700 ) ) ( not ( = ?auto_5695 ?auto_5699 ) ) ( not ( = ?auto_5695 ?auto_5698 ) ) ( not ( = ?auto_5693 ?auto_5697 ) ) ( not ( = ?auto_5693 ?auto_5701 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_5687 ?auto_5688 ?auto_5689 )
      ( MAKE-1CRATE ?auto_5689 ?auto_5690 )
      ( MAKE-3CRATE-VERIFY ?auto_5687 ?auto_5688 ?auto_5689 ?auto_5690 ) )
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
      ?auto_5724 - HOIST
      ?auto_5728 - PLACE
      ?auto_5726 - PLACE
      ?auto_5725 - HOIST
      ?auto_5723 - SURFACE
      ?auto_5734 - PLACE
      ?auto_5735 - HOIST
      ?auto_5731 - SURFACE
      ?auto_5733 - PLACE
      ?auto_5729 - HOIST
      ?auto_5732 - SURFACE
      ?auto_5730 - SURFACE
      ?auto_5727 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5724 ?auto_5728 ) ( IS-CRATE ?auto_5722 ) ( not ( = ?auto_5726 ?auto_5728 ) ) ( HOIST-AT ?auto_5725 ?auto_5726 ) ( SURFACE-AT ?auto_5722 ?auto_5726 ) ( ON ?auto_5722 ?auto_5723 ) ( CLEAR ?auto_5722 ) ( not ( = ?auto_5721 ?auto_5722 ) ) ( not ( = ?auto_5721 ?auto_5723 ) ) ( not ( = ?auto_5722 ?auto_5723 ) ) ( not ( = ?auto_5724 ?auto_5725 ) ) ( IS-CRATE ?auto_5721 ) ( not ( = ?auto_5734 ?auto_5728 ) ) ( HOIST-AT ?auto_5735 ?auto_5734 ) ( AVAILABLE ?auto_5735 ) ( SURFACE-AT ?auto_5721 ?auto_5734 ) ( ON ?auto_5721 ?auto_5731 ) ( CLEAR ?auto_5721 ) ( not ( = ?auto_5720 ?auto_5721 ) ) ( not ( = ?auto_5720 ?auto_5731 ) ) ( not ( = ?auto_5721 ?auto_5731 ) ) ( not ( = ?auto_5724 ?auto_5735 ) ) ( IS-CRATE ?auto_5720 ) ( not ( = ?auto_5733 ?auto_5728 ) ) ( HOIST-AT ?auto_5729 ?auto_5733 ) ( AVAILABLE ?auto_5729 ) ( SURFACE-AT ?auto_5720 ?auto_5733 ) ( ON ?auto_5720 ?auto_5732 ) ( CLEAR ?auto_5720 ) ( not ( = ?auto_5719 ?auto_5720 ) ) ( not ( = ?auto_5719 ?auto_5732 ) ) ( not ( = ?auto_5720 ?auto_5732 ) ) ( not ( = ?auto_5724 ?auto_5729 ) ) ( SURFACE-AT ?auto_5718 ?auto_5728 ) ( CLEAR ?auto_5718 ) ( IS-CRATE ?auto_5719 ) ( AVAILABLE ?auto_5724 ) ( AVAILABLE ?auto_5725 ) ( SURFACE-AT ?auto_5719 ?auto_5726 ) ( ON ?auto_5719 ?auto_5730 ) ( CLEAR ?auto_5719 ) ( TRUCK-AT ?auto_5727 ?auto_5728 ) ( not ( = ?auto_5718 ?auto_5719 ) ) ( not ( = ?auto_5718 ?auto_5730 ) ) ( not ( = ?auto_5719 ?auto_5730 ) ) ( not ( = ?auto_5718 ?auto_5720 ) ) ( not ( = ?auto_5718 ?auto_5732 ) ) ( not ( = ?auto_5720 ?auto_5730 ) ) ( not ( = ?auto_5733 ?auto_5726 ) ) ( not ( = ?auto_5729 ?auto_5725 ) ) ( not ( = ?auto_5732 ?auto_5730 ) ) ( not ( = ?auto_5718 ?auto_5721 ) ) ( not ( = ?auto_5718 ?auto_5731 ) ) ( not ( = ?auto_5719 ?auto_5721 ) ) ( not ( = ?auto_5719 ?auto_5731 ) ) ( not ( = ?auto_5721 ?auto_5732 ) ) ( not ( = ?auto_5721 ?auto_5730 ) ) ( not ( = ?auto_5734 ?auto_5733 ) ) ( not ( = ?auto_5734 ?auto_5726 ) ) ( not ( = ?auto_5735 ?auto_5729 ) ) ( not ( = ?auto_5735 ?auto_5725 ) ) ( not ( = ?auto_5731 ?auto_5732 ) ) ( not ( = ?auto_5731 ?auto_5730 ) ) ( not ( = ?auto_5718 ?auto_5722 ) ) ( not ( = ?auto_5718 ?auto_5723 ) ) ( not ( = ?auto_5719 ?auto_5722 ) ) ( not ( = ?auto_5719 ?auto_5723 ) ) ( not ( = ?auto_5720 ?auto_5722 ) ) ( not ( = ?auto_5720 ?auto_5723 ) ) ( not ( = ?auto_5722 ?auto_5731 ) ) ( not ( = ?auto_5722 ?auto_5732 ) ) ( not ( = ?auto_5722 ?auto_5730 ) ) ( not ( = ?auto_5723 ?auto_5731 ) ) ( not ( = ?auto_5723 ?auto_5732 ) ) ( not ( = ?auto_5723 ?auto_5730 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_5718 ?auto_5719 ?auto_5720 ?auto_5721 )
      ( MAKE-1CRATE ?auto_5721 ?auto_5722 )
      ( MAKE-4CRATE-VERIFY ?auto_5718 ?auto_5719 ?auto_5720 ?auto_5721 ?auto_5722 ) )
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
      ?auto_5758 - HOIST
      ?auto_5762 - PLACE
      ?auto_5760 - PLACE
      ?auto_5763 - HOIST
      ?auto_5761 - SURFACE
      ?auto_5768 - PLACE
      ?auto_5772 - HOIST
      ?auto_5770 - SURFACE
      ?auto_5767 - PLACE
      ?auto_5764 - HOIST
      ?auto_5769 - SURFACE
      ?auto_5766 - PLACE
      ?auto_5773 - HOIST
      ?auto_5765 - SURFACE
      ?auto_5771 - SURFACE
      ?auto_5759 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5758 ?auto_5762 ) ( IS-CRATE ?auto_5757 ) ( not ( = ?auto_5760 ?auto_5762 ) ) ( HOIST-AT ?auto_5763 ?auto_5760 ) ( AVAILABLE ?auto_5763 ) ( SURFACE-AT ?auto_5757 ?auto_5760 ) ( ON ?auto_5757 ?auto_5761 ) ( CLEAR ?auto_5757 ) ( not ( = ?auto_5756 ?auto_5757 ) ) ( not ( = ?auto_5756 ?auto_5761 ) ) ( not ( = ?auto_5757 ?auto_5761 ) ) ( not ( = ?auto_5758 ?auto_5763 ) ) ( IS-CRATE ?auto_5756 ) ( not ( = ?auto_5768 ?auto_5762 ) ) ( HOIST-AT ?auto_5772 ?auto_5768 ) ( SURFACE-AT ?auto_5756 ?auto_5768 ) ( ON ?auto_5756 ?auto_5770 ) ( CLEAR ?auto_5756 ) ( not ( = ?auto_5755 ?auto_5756 ) ) ( not ( = ?auto_5755 ?auto_5770 ) ) ( not ( = ?auto_5756 ?auto_5770 ) ) ( not ( = ?auto_5758 ?auto_5772 ) ) ( IS-CRATE ?auto_5755 ) ( not ( = ?auto_5767 ?auto_5762 ) ) ( HOIST-AT ?auto_5764 ?auto_5767 ) ( AVAILABLE ?auto_5764 ) ( SURFACE-AT ?auto_5755 ?auto_5767 ) ( ON ?auto_5755 ?auto_5769 ) ( CLEAR ?auto_5755 ) ( not ( = ?auto_5754 ?auto_5755 ) ) ( not ( = ?auto_5754 ?auto_5769 ) ) ( not ( = ?auto_5755 ?auto_5769 ) ) ( not ( = ?auto_5758 ?auto_5764 ) ) ( IS-CRATE ?auto_5754 ) ( not ( = ?auto_5766 ?auto_5762 ) ) ( HOIST-AT ?auto_5773 ?auto_5766 ) ( AVAILABLE ?auto_5773 ) ( SURFACE-AT ?auto_5754 ?auto_5766 ) ( ON ?auto_5754 ?auto_5765 ) ( CLEAR ?auto_5754 ) ( not ( = ?auto_5753 ?auto_5754 ) ) ( not ( = ?auto_5753 ?auto_5765 ) ) ( not ( = ?auto_5754 ?auto_5765 ) ) ( not ( = ?auto_5758 ?auto_5773 ) ) ( SURFACE-AT ?auto_5752 ?auto_5762 ) ( CLEAR ?auto_5752 ) ( IS-CRATE ?auto_5753 ) ( AVAILABLE ?auto_5758 ) ( AVAILABLE ?auto_5772 ) ( SURFACE-AT ?auto_5753 ?auto_5768 ) ( ON ?auto_5753 ?auto_5771 ) ( CLEAR ?auto_5753 ) ( TRUCK-AT ?auto_5759 ?auto_5762 ) ( not ( = ?auto_5752 ?auto_5753 ) ) ( not ( = ?auto_5752 ?auto_5771 ) ) ( not ( = ?auto_5753 ?auto_5771 ) ) ( not ( = ?auto_5752 ?auto_5754 ) ) ( not ( = ?auto_5752 ?auto_5765 ) ) ( not ( = ?auto_5754 ?auto_5771 ) ) ( not ( = ?auto_5766 ?auto_5768 ) ) ( not ( = ?auto_5773 ?auto_5772 ) ) ( not ( = ?auto_5765 ?auto_5771 ) ) ( not ( = ?auto_5752 ?auto_5755 ) ) ( not ( = ?auto_5752 ?auto_5769 ) ) ( not ( = ?auto_5753 ?auto_5755 ) ) ( not ( = ?auto_5753 ?auto_5769 ) ) ( not ( = ?auto_5755 ?auto_5765 ) ) ( not ( = ?auto_5755 ?auto_5771 ) ) ( not ( = ?auto_5767 ?auto_5766 ) ) ( not ( = ?auto_5767 ?auto_5768 ) ) ( not ( = ?auto_5764 ?auto_5773 ) ) ( not ( = ?auto_5764 ?auto_5772 ) ) ( not ( = ?auto_5769 ?auto_5765 ) ) ( not ( = ?auto_5769 ?auto_5771 ) ) ( not ( = ?auto_5752 ?auto_5756 ) ) ( not ( = ?auto_5752 ?auto_5770 ) ) ( not ( = ?auto_5753 ?auto_5756 ) ) ( not ( = ?auto_5753 ?auto_5770 ) ) ( not ( = ?auto_5754 ?auto_5756 ) ) ( not ( = ?auto_5754 ?auto_5770 ) ) ( not ( = ?auto_5756 ?auto_5769 ) ) ( not ( = ?auto_5756 ?auto_5765 ) ) ( not ( = ?auto_5756 ?auto_5771 ) ) ( not ( = ?auto_5770 ?auto_5769 ) ) ( not ( = ?auto_5770 ?auto_5765 ) ) ( not ( = ?auto_5770 ?auto_5771 ) ) ( not ( = ?auto_5752 ?auto_5757 ) ) ( not ( = ?auto_5752 ?auto_5761 ) ) ( not ( = ?auto_5753 ?auto_5757 ) ) ( not ( = ?auto_5753 ?auto_5761 ) ) ( not ( = ?auto_5754 ?auto_5757 ) ) ( not ( = ?auto_5754 ?auto_5761 ) ) ( not ( = ?auto_5755 ?auto_5757 ) ) ( not ( = ?auto_5755 ?auto_5761 ) ) ( not ( = ?auto_5757 ?auto_5770 ) ) ( not ( = ?auto_5757 ?auto_5769 ) ) ( not ( = ?auto_5757 ?auto_5765 ) ) ( not ( = ?auto_5757 ?auto_5771 ) ) ( not ( = ?auto_5760 ?auto_5768 ) ) ( not ( = ?auto_5760 ?auto_5767 ) ) ( not ( = ?auto_5760 ?auto_5766 ) ) ( not ( = ?auto_5763 ?auto_5772 ) ) ( not ( = ?auto_5763 ?auto_5764 ) ) ( not ( = ?auto_5763 ?auto_5773 ) ) ( not ( = ?auto_5761 ?auto_5770 ) ) ( not ( = ?auto_5761 ?auto_5769 ) ) ( not ( = ?auto_5761 ?auto_5765 ) ) ( not ( = ?auto_5761 ?auto_5771 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_5752 ?auto_5753 ?auto_5754 ?auto_5755 ?auto_5756 )
      ( MAKE-1CRATE ?auto_5756 ?auto_5757 )
      ( MAKE-5CRATE-VERIFY ?auto_5752 ?auto_5753 ?auto_5754 ?auto_5755 ?auto_5756 ?auto_5757 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_5791 - SURFACE
      ?auto_5792 - SURFACE
      ?auto_5793 - SURFACE
      ?auto_5794 - SURFACE
      ?auto_5795 - SURFACE
      ?auto_5796 - SURFACE
      ?auto_5797 - SURFACE
    )
    :vars
    (
      ?auto_5801 - HOIST
      ?auto_5803 - PLACE
      ?auto_5798 - PLACE
      ?auto_5802 - HOIST
      ?auto_5800 - SURFACE
      ?auto_5814 - PLACE
      ?auto_5809 - HOIST
      ?auto_5807 - SURFACE
      ?auto_5805 - SURFACE
      ?auto_5806 - PLACE
      ?auto_5812 - HOIST
      ?auto_5804 - SURFACE
      ?auto_5811 - PLACE
      ?auto_5810 - HOIST
      ?auto_5808 - SURFACE
      ?auto_5813 - SURFACE
      ?auto_5799 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5801 ?auto_5803 ) ( IS-CRATE ?auto_5797 ) ( not ( = ?auto_5798 ?auto_5803 ) ) ( HOIST-AT ?auto_5802 ?auto_5798 ) ( SURFACE-AT ?auto_5797 ?auto_5798 ) ( ON ?auto_5797 ?auto_5800 ) ( CLEAR ?auto_5797 ) ( not ( = ?auto_5796 ?auto_5797 ) ) ( not ( = ?auto_5796 ?auto_5800 ) ) ( not ( = ?auto_5797 ?auto_5800 ) ) ( not ( = ?auto_5801 ?auto_5802 ) ) ( IS-CRATE ?auto_5796 ) ( not ( = ?auto_5814 ?auto_5803 ) ) ( HOIST-AT ?auto_5809 ?auto_5814 ) ( AVAILABLE ?auto_5809 ) ( SURFACE-AT ?auto_5796 ?auto_5814 ) ( ON ?auto_5796 ?auto_5807 ) ( CLEAR ?auto_5796 ) ( not ( = ?auto_5795 ?auto_5796 ) ) ( not ( = ?auto_5795 ?auto_5807 ) ) ( not ( = ?auto_5796 ?auto_5807 ) ) ( not ( = ?auto_5801 ?auto_5809 ) ) ( IS-CRATE ?auto_5795 ) ( SURFACE-AT ?auto_5795 ?auto_5798 ) ( ON ?auto_5795 ?auto_5805 ) ( CLEAR ?auto_5795 ) ( not ( = ?auto_5794 ?auto_5795 ) ) ( not ( = ?auto_5794 ?auto_5805 ) ) ( not ( = ?auto_5795 ?auto_5805 ) ) ( IS-CRATE ?auto_5794 ) ( not ( = ?auto_5806 ?auto_5803 ) ) ( HOIST-AT ?auto_5812 ?auto_5806 ) ( AVAILABLE ?auto_5812 ) ( SURFACE-AT ?auto_5794 ?auto_5806 ) ( ON ?auto_5794 ?auto_5804 ) ( CLEAR ?auto_5794 ) ( not ( = ?auto_5793 ?auto_5794 ) ) ( not ( = ?auto_5793 ?auto_5804 ) ) ( not ( = ?auto_5794 ?auto_5804 ) ) ( not ( = ?auto_5801 ?auto_5812 ) ) ( IS-CRATE ?auto_5793 ) ( not ( = ?auto_5811 ?auto_5803 ) ) ( HOIST-AT ?auto_5810 ?auto_5811 ) ( AVAILABLE ?auto_5810 ) ( SURFACE-AT ?auto_5793 ?auto_5811 ) ( ON ?auto_5793 ?auto_5808 ) ( CLEAR ?auto_5793 ) ( not ( = ?auto_5792 ?auto_5793 ) ) ( not ( = ?auto_5792 ?auto_5808 ) ) ( not ( = ?auto_5793 ?auto_5808 ) ) ( not ( = ?auto_5801 ?auto_5810 ) ) ( SURFACE-AT ?auto_5791 ?auto_5803 ) ( CLEAR ?auto_5791 ) ( IS-CRATE ?auto_5792 ) ( AVAILABLE ?auto_5801 ) ( AVAILABLE ?auto_5802 ) ( SURFACE-AT ?auto_5792 ?auto_5798 ) ( ON ?auto_5792 ?auto_5813 ) ( CLEAR ?auto_5792 ) ( TRUCK-AT ?auto_5799 ?auto_5803 ) ( not ( = ?auto_5791 ?auto_5792 ) ) ( not ( = ?auto_5791 ?auto_5813 ) ) ( not ( = ?auto_5792 ?auto_5813 ) ) ( not ( = ?auto_5791 ?auto_5793 ) ) ( not ( = ?auto_5791 ?auto_5808 ) ) ( not ( = ?auto_5793 ?auto_5813 ) ) ( not ( = ?auto_5811 ?auto_5798 ) ) ( not ( = ?auto_5810 ?auto_5802 ) ) ( not ( = ?auto_5808 ?auto_5813 ) ) ( not ( = ?auto_5791 ?auto_5794 ) ) ( not ( = ?auto_5791 ?auto_5804 ) ) ( not ( = ?auto_5792 ?auto_5794 ) ) ( not ( = ?auto_5792 ?auto_5804 ) ) ( not ( = ?auto_5794 ?auto_5808 ) ) ( not ( = ?auto_5794 ?auto_5813 ) ) ( not ( = ?auto_5806 ?auto_5811 ) ) ( not ( = ?auto_5806 ?auto_5798 ) ) ( not ( = ?auto_5812 ?auto_5810 ) ) ( not ( = ?auto_5812 ?auto_5802 ) ) ( not ( = ?auto_5804 ?auto_5808 ) ) ( not ( = ?auto_5804 ?auto_5813 ) ) ( not ( = ?auto_5791 ?auto_5795 ) ) ( not ( = ?auto_5791 ?auto_5805 ) ) ( not ( = ?auto_5792 ?auto_5795 ) ) ( not ( = ?auto_5792 ?auto_5805 ) ) ( not ( = ?auto_5793 ?auto_5795 ) ) ( not ( = ?auto_5793 ?auto_5805 ) ) ( not ( = ?auto_5795 ?auto_5804 ) ) ( not ( = ?auto_5795 ?auto_5808 ) ) ( not ( = ?auto_5795 ?auto_5813 ) ) ( not ( = ?auto_5805 ?auto_5804 ) ) ( not ( = ?auto_5805 ?auto_5808 ) ) ( not ( = ?auto_5805 ?auto_5813 ) ) ( not ( = ?auto_5791 ?auto_5796 ) ) ( not ( = ?auto_5791 ?auto_5807 ) ) ( not ( = ?auto_5792 ?auto_5796 ) ) ( not ( = ?auto_5792 ?auto_5807 ) ) ( not ( = ?auto_5793 ?auto_5796 ) ) ( not ( = ?auto_5793 ?auto_5807 ) ) ( not ( = ?auto_5794 ?auto_5796 ) ) ( not ( = ?auto_5794 ?auto_5807 ) ) ( not ( = ?auto_5796 ?auto_5805 ) ) ( not ( = ?auto_5796 ?auto_5804 ) ) ( not ( = ?auto_5796 ?auto_5808 ) ) ( not ( = ?auto_5796 ?auto_5813 ) ) ( not ( = ?auto_5814 ?auto_5798 ) ) ( not ( = ?auto_5814 ?auto_5806 ) ) ( not ( = ?auto_5814 ?auto_5811 ) ) ( not ( = ?auto_5809 ?auto_5802 ) ) ( not ( = ?auto_5809 ?auto_5812 ) ) ( not ( = ?auto_5809 ?auto_5810 ) ) ( not ( = ?auto_5807 ?auto_5805 ) ) ( not ( = ?auto_5807 ?auto_5804 ) ) ( not ( = ?auto_5807 ?auto_5808 ) ) ( not ( = ?auto_5807 ?auto_5813 ) ) ( not ( = ?auto_5791 ?auto_5797 ) ) ( not ( = ?auto_5791 ?auto_5800 ) ) ( not ( = ?auto_5792 ?auto_5797 ) ) ( not ( = ?auto_5792 ?auto_5800 ) ) ( not ( = ?auto_5793 ?auto_5797 ) ) ( not ( = ?auto_5793 ?auto_5800 ) ) ( not ( = ?auto_5794 ?auto_5797 ) ) ( not ( = ?auto_5794 ?auto_5800 ) ) ( not ( = ?auto_5795 ?auto_5797 ) ) ( not ( = ?auto_5795 ?auto_5800 ) ) ( not ( = ?auto_5797 ?auto_5807 ) ) ( not ( = ?auto_5797 ?auto_5805 ) ) ( not ( = ?auto_5797 ?auto_5804 ) ) ( not ( = ?auto_5797 ?auto_5808 ) ) ( not ( = ?auto_5797 ?auto_5813 ) ) ( not ( = ?auto_5800 ?auto_5807 ) ) ( not ( = ?auto_5800 ?auto_5805 ) ) ( not ( = ?auto_5800 ?auto_5804 ) ) ( not ( = ?auto_5800 ?auto_5808 ) ) ( not ( = ?auto_5800 ?auto_5813 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_5791 ?auto_5792 ?auto_5793 ?auto_5794 ?auto_5795 ?auto_5796 )
      ( MAKE-1CRATE ?auto_5796 ?auto_5797 )
      ( MAKE-6CRATE-VERIFY ?auto_5791 ?auto_5792 ?auto_5793 ?auto_5794 ?auto_5795 ?auto_5796 ?auto_5797 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_5833 - SURFACE
      ?auto_5834 - SURFACE
      ?auto_5835 - SURFACE
      ?auto_5836 - SURFACE
      ?auto_5837 - SURFACE
      ?auto_5838 - SURFACE
      ?auto_5839 - SURFACE
      ?auto_5840 - SURFACE
    )
    :vars
    (
      ?auto_5843 - HOIST
      ?auto_5846 - PLACE
      ?auto_5844 - PLACE
      ?auto_5842 - HOIST
      ?auto_5845 - SURFACE
      ?auto_5847 - PLACE
      ?auto_5848 - HOIST
      ?auto_5849 - SURFACE
      ?auto_5853 - PLACE
      ?auto_5857 - HOIST
      ?auto_5855 - SURFACE
      ?auto_5851 - SURFACE
      ?auto_5850 - PLACE
      ?auto_5856 - HOIST
      ?auto_5854 - SURFACE
      ?auto_5858 - SURFACE
      ?auto_5852 - SURFACE
      ?auto_5841 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5843 ?auto_5846 ) ( IS-CRATE ?auto_5840 ) ( not ( = ?auto_5844 ?auto_5846 ) ) ( HOIST-AT ?auto_5842 ?auto_5844 ) ( SURFACE-AT ?auto_5840 ?auto_5844 ) ( ON ?auto_5840 ?auto_5845 ) ( CLEAR ?auto_5840 ) ( not ( = ?auto_5839 ?auto_5840 ) ) ( not ( = ?auto_5839 ?auto_5845 ) ) ( not ( = ?auto_5840 ?auto_5845 ) ) ( not ( = ?auto_5843 ?auto_5842 ) ) ( IS-CRATE ?auto_5839 ) ( not ( = ?auto_5847 ?auto_5846 ) ) ( HOIST-AT ?auto_5848 ?auto_5847 ) ( SURFACE-AT ?auto_5839 ?auto_5847 ) ( ON ?auto_5839 ?auto_5849 ) ( CLEAR ?auto_5839 ) ( not ( = ?auto_5838 ?auto_5839 ) ) ( not ( = ?auto_5838 ?auto_5849 ) ) ( not ( = ?auto_5839 ?auto_5849 ) ) ( not ( = ?auto_5843 ?auto_5848 ) ) ( IS-CRATE ?auto_5838 ) ( not ( = ?auto_5853 ?auto_5846 ) ) ( HOIST-AT ?auto_5857 ?auto_5853 ) ( AVAILABLE ?auto_5857 ) ( SURFACE-AT ?auto_5838 ?auto_5853 ) ( ON ?auto_5838 ?auto_5855 ) ( CLEAR ?auto_5838 ) ( not ( = ?auto_5837 ?auto_5838 ) ) ( not ( = ?auto_5837 ?auto_5855 ) ) ( not ( = ?auto_5838 ?auto_5855 ) ) ( not ( = ?auto_5843 ?auto_5857 ) ) ( IS-CRATE ?auto_5837 ) ( SURFACE-AT ?auto_5837 ?auto_5847 ) ( ON ?auto_5837 ?auto_5851 ) ( CLEAR ?auto_5837 ) ( not ( = ?auto_5836 ?auto_5837 ) ) ( not ( = ?auto_5836 ?auto_5851 ) ) ( not ( = ?auto_5837 ?auto_5851 ) ) ( IS-CRATE ?auto_5836 ) ( not ( = ?auto_5850 ?auto_5846 ) ) ( HOIST-AT ?auto_5856 ?auto_5850 ) ( AVAILABLE ?auto_5856 ) ( SURFACE-AT ?auto_5836 ?auto_5850 ) ( ON ?auto_5836 ?auto_5854 ) ( CLEAR ?auto_5836 ) ( not ( = ?auto_5835 ?auto_5836 ) ) ( not ( = ?auto_5835 ?auto_5854 ) ) ( not ( = ?auto_5836 ?auto_5854 ) ) ( not ( = ?auto_5843 ?auto_5856 ) ) ( IS-CRATE ?auto_5835 ) ( AVAILABLE ?auto_5842 ) ( SURFACE-AT ?auto_5835 ?auto_5844 ) ( ON ?auto_5835 ?auto_5858 ) ( CLEAR ?auto_5835 ) ( not ( = ?auto_5834 ?auto_5835 ) ) ( not ( = ?auto_5834 ?auto_5858 ) ) ( not ( = ?auto_5835 ?auto_5858 ) ) ( SURFACE-AT ?auto_5833 ?auto_5846 ) ( CLEAR ?auto_5833 ) ( IS-CRATE ?auto_5834 ) ( AVAILABLE ?auto_5843 ) ( AVAILABLE ?auto_5848 ) ( SURFACE-AT ?auto_5834 ?auto_5847 ) ( ON ?auto_5834 ?auto_5852 ) ( CLEAR ?auto_5834 ) ( TRUCK-AT ?auto_5841 ?auto_5846 ) ( not ( = ?auto_5833 ?auto_5834 ) ) ( not ( = ?auto_5833 ?auto_5852 ) ) ( not ( = ?auto_5834 ?auto_5852 ) ) ( not ( = ?auto_5833 ?auto_5835 ) ) ( not ( = ?auto_5833 ?auto_5858 ) ) ( not ( = ?auto_5835 ?auto_5852 ) ) ( not ( = ?auto_5844 ?auto_5847 ) ) ( not ( = ?auto_5842 ?auto_5848 ) ) ( not ( = ?auto_5858 ?auto_5852 ) ) ( not ( = ?auto_5833 ?auto_5836 ) ) ( not ( = ?auto_5833 ?auto_5854 ) ) ( not ( = ?auto_5834 ?auto_5836 ) ) ( not ( = ?auto_5834 ?auto_5854 ) ) ( not ( = ?auto_5836 ?auto_5858 ) ) ( not ( = ?auto_5836 ?auto_5852 ) ) ( not ( = ?auto_5850 ?auto_5844 ) ) ( not ( = ?auto_5850 ?auto_5847 ) ) ( not ( = ?auto_5856 ?auto_5842 ) ) ( not ( = ?auto_5856 ?auto_5848 ) ) ( not ( = ?auto_5854 ?auto_5858 ) ) ( not ( = ?auto_5854 ?auto_5852 ) ) ( not ( = ?auto_5833 ?auto_5837 ) ) ( not ( = ?auto_5833 ?auto_5851 ) ) ( not ( = ?auto_5834 ?auto_5837 ) ) ( not ( = ?auto_5834 ?auto_5851 ) ) ( not ( = ?auto_5835 ?auto_5837 ) ) ( not ( = ?auto_5835 ?auto_5851 ) ) ( not ( = ?auto_5837 ?auto_5854 ) ) ( not ( = ?auto_5837 ?auto_5858 ) ) ( not ( = ?auto_5837 ?auto_5852 ) ) ( not ( = ?auto_5851 ?auto_5854 ) ) ( not ( = ?auto_5851 ?auto_5858 ) ) ( not ( = ?auto_5851 ?auto_5852 ) ) ( not ( = ?auto_5833 ?auto_5838 ) ) ( not ( = ?auto_5833 ?auto_5855 ) ) ( not ( = ?auto_5834 ?auto_5838 ) ) ( not ( = ?auto_5834 ?auto_5855 ) ) ( not ( = ?auto_5835 ?auto_5838 ) ) ( not ( = ?auto_5835 ?auto_5855 ) ) ( not ( = ?auto_5836 ?auto_5838 ) ) ( not ( = ?auto_5836 ?auto_5855 ) ) ( not ( = ?auto_5838 ?auto_5851 ) ) ( not ( = ?auto_5838 ?auto_5854 ) ) ( not ( = ?auto_5838 ?auto_5858 ) ) ( not ( = ?auto_5838 ?auto_5852 ) ) ( not ( = ?auto_5853 ?auto_5847 ) ) ( not ( = ?auto_5853 ?auto_5850 ) ) ( not ( = ?auto_5853 ?auto_5844 ) ) ( not ( = ?auto_5857 ?auto_5848 ) ) ( not ( = ?auto_5857 ?auto_5856 ) ) ( not ( = ?auto_5857 ?auto_5842 ) ) ( not ( = ?auto_5855 ?auto_5851 ) ) ( not ( = ?auto_5855 ?auto_5854 ) ) ( not ( = ?auto_5855 ?auto_5858 ) ) ( not ( = ?auto_5855 ?auto_5852 ) ) ( not ( = ?auto_5833 ?auto_5839 ) ) ( not ( = ?auto_5833 ?auto_5849 ) ) ( not ( = ?auto_5834 ?auto_5839 ) ) ( not ( = ?auto_5834 ?auto_5849 ) ) ( not ( = ?auto_5835 ?auto_5839 ) ) ( not ( = ?auto_5835 ?auto_5849 ) ) ( not ( = ?auto_5836 ?auto_5839 ) ) ( not ( = ?auto_5836 ?auto_5849 ) ) ( not ( = ?auto_5837 ?auto_5839 ) ) ( not ( = ?auto_5837 ?auto_5849 ) ) ( not ( = ?auto_5839 ?auto_5855 ) ) ( not ( = ?auto_5839 ?auto_5851 ) ) ( not ( = ?auto_5839 ?auto_5854 ) ) ( not ( = ?auto_5839 ?auto_5858 ) ) ( not ( = ?auto_5839 ?auto_5852 ) ) ( not ( = ?auto_5849 ?auto_5855 ) ) ( not ( = ?auto_5849 ?auto_5851 ) ) ( not ( = ?auto_5849 ?auto_5854 ) ) ( not ( = ?auto_5849 ?auto_5858 ) ) ( not ( = ?auto_5849 ?auto_5852 ) ) ( not ( = ?auto_5833 ?auto_5840 ) ) ( not ( = ?auto_5833 ?auto_5845 ) ) ( not ( = ?auto_5834 ?auto_5840 ) ) ( not ( = ?auto_5834 ?auto_5845 ) ) ( not ( = ?auto_5835 ?auto_5840 ) ) ( not ( = ?auto_5835 ?auto_5845 ) ) ( not ( = ?auto_5836 ?auto_5840 ) ) ( not ( = ?auto_5836 ?auto_5845 ) ) ( not ( = ?auto_5837 ?auto_5840 ) ) ( not ( = ?auto_5837 ?auto_5845 ) ) ( not ( = ?auto_5838 ?auto_5840 ) ) ( not ( = ?auto_5838 ?auto_5845 ) ) ( not ( = ?auto_5840 ?auto_5849 ) ) ( not ( = ?auto_5840 ?auto_5855 ) ) ( not ( = ?auto_5840 ?auto_5851 ) ) ( not ( = ?auto_5840 ?auto_5854 ) ) ( not ( = ?auto_5840 ?auto_5858 ) ) ( not ( = ?auto_5840 ?auto_5852 ) ) ( not ( = ?auto_5845 ?auto_5849 ) ) ( not ( = ?auto_5845 ?auto_5855 ) ) ( not ( = ?auto_5845 ?auto_5851 ) ) ( not ( = ?auto_5845 ?auto_5854 ) ) ( not ( = ?auto_5845 ?auto_5858 ) ) ( not ( = ?auto_5845 ?auto_5852 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_5833 ?auto_5834 ?auto_5835 ?auto_5836 ?auto_5837 ?auto_5838 ?auto_5839 )
      ( MAKE-1CRATE ?auto_5839 ?auto_5840 )
      ( MAKE-7CRATE-VERIFY ?auto_5833 ?auto_5834 ?auto_5835 ?auto_5836 ?auto_5837 ?auto_5838 ?auto_5839 ?auto_5840 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_5878 - SURFACE
      ?auto_5879 - SURFACE
      ?auto_5880 - SURFACE
      ?auto_5881 - SURFACE
      ?auto_5882 - SURFACE
      ?auto_5883 - SURFACE
      ?auto_5884 - SURFACE
      ?auto_5885 - SURFACE
      ?auto_5886 - SURFACE
    )
    :vars
    (
      ?auto_5889 - HOIST
      ?auto_5892 - PLACE
      ?auto_5891 - PLACE
      ?auto_5887 - HOIST
      ?auto_5888 - SURFACE
      ?auto_5897 - PLACE
      ?auto_5898 - HOIST
      ?auto_5905 - SURFACE
      ?auto_5900 - PLACE
      ?auto_5901 - HOIST
      ?auto_5906 - SURFACE
      ?auto_5904 - PLACE
      ?auto_5895 - HOIST
      ?auto_5907 - SURFACE
      ?auto_5902 - SURFACE
      ?auto_5899 - PLACE
      ?auto_5903 - HOIST
      ?auto_5896 - SURFACE
      ?auto_5894 - SURFACE
      ?auto_5893 - SURFACE
      ?auto_5890 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5889 ?auto_5892 ) ( IS-CRATE ?auto_5886 ) ( not ( = ?auto_5891 ?auto_5892 ) ) ( HOIST-AT ?auto_5887 ?auto_5891 ) ( AVAILABLE ?auto_5887 ) ( SURFACE-AT ?auto_5886 ?auto_5891 ) ( ON ?auto_5886 ?auto_5888 ) ( CLEAR ?auto_5886 ) ( not ( = ?auto_5885 ?auto_5886 ) ) ( not ( = ?auto_5885 ?auto_5888 ) ) ( not ( = ?auto_5886 ?auto_5888 ) ) ( not ( = ?auto_5889 ?auto_5887 ) ) ( IS-CRATE ?auto_5885 ) ( not ( = ?auto_5897 ?auto_5892 ) ) ( HOIST-AT ?auto_5898 ?auto_5897 ) ( SURFACE-AT ?auto_5885 ?auto_5897 ) ( ON ?auto_5885 ?auto_5905 ) ( CLEAR ?auto_5885 ) ( not ( = ?auto_5884 ?auto_5885 ) ) ( not ( = ?auto_5884 ?auto_5905 ) ) ( not ( = ?auto_5885 ?auto_5905 ) ) ( not ( = ?auto_5889 ?auto_5898 ) ) ( IS-CRATE ?auto_5884 ) ( not ( = ?auto_5900 ?auto_5892 ) ) ( HOIST-AT ?auto_5901 ?auto_5900 ) ( SURFACE-AT ?auto_5884 ?auto_5900 ) ( ON ?auto_5884 ?auto_5906 ) ( CLEAR ?auto_5884 ) ( not ( = ?auto_5883 ?auto_5884 ) ) ( not ( = ?auto_5883 ?auto_5906 ) ) ( not ( = ?auto_5884 ?auto_5906 ) ) ( not ( = ?auto_5889 ?auto_5901 ) ) ( IS-CRATE ?auto_5883 ) ( not ( = ?auto_5904 ?auto_5892 ) ) ( HOIST-AT ?auto_5895 ?auto_5904 ) ( AVAILABLE ?auto_5895 ) ( SURFACE-AT ?auto_5883 ?auto_5904 ) ( ON ?auto_5883 ?auto_5907 ) ( CLEAR ?auto_5883 ) ( not ( = ?auto_5882 ?auto_5883 ) ) ( not ( = ?auto_5882 ?auto_5907 ) ) ( not ( = ?auto_5883 ?auto_5907 ) ) ( not ( = ?auto_5889 ?auto_5895 ) ) ( IS-CRATE ?auto_5882 ) ( SURFACE-AT ?auto_5882 ?auto_5900 ) ( ON ?auto_5882 ?auto_5902 ) ( CLEAR ?auto_5882 ) ( not ( = ?auto_5881 ?auto_5882 ) ) ( not ( = ?auto_5881 ?auto_5902 ) ) ( not ( = ?auto_5882 ?auto_5902 ) ) ( IS-CRATE ?auto_5881 ) ( not ( = ?auto_5899 ?auto_5892 ) ) ( HOIST-AT ?auto_5903 ?auto_5899 ) ( AVAILABLE ?auto_5903 ) ( SURFACE-AT ?auto_5881 ?auto_5899 ) ( ON ?auto_5881 ?auto_5896 ) ( CLEAR ?auto_5881 ) ( not ( = ?auto_5880 ?auto_5881 ) ) ( not ( = ?auto_5880 ?auto_5896 ) ) ( not ( = ?auto_5881 ?auto_5896 ) ) ( not ( = ?auto_5889 ?auto_5903 ) ) ( IS-CRATE ?auto_5880 ) ( AVAILABLE ?auto_5898 ) ( SURFACE-AT ?auto_5880 ?auto_5897 ) ( ON ?auto_5880 ?auto_5894 ) ( CLEAR ?auto_5880 ) ( not ( = ?auto_5879 ?auto_5880 ) ) ( not ( = ?auto_5879 ?auto_5894 ) ) ( not ( = ?auto_5880 ?auto_5894 ) ) ( SURFACE-AT ?auto_5878 ?auto_5892 ) ( CLEAR ?auto_5878 ) ( IS-CRATE ?auto_5879 ) ( AVAILABLE ?auto_5889 ) ( AVAILABLE ?auto_5901 ) ( SURFACE-AT ?auto_5879 ?auto_5900 ) ( ON ?auto_5879 ?auto_5893 ) ( CLEAR ?auto_5879 ) ( TRUCK-AT ?auto_5890 ?auto_5892 ) ( not ( = ?auto_5878 ?auto_5879 ) ) ( not ( = ?auto_5878 ?auto_5893 ) ) ( not ( = ?auto_5879 ?auto_5893 ) ) ( not ( = ?auto_5878 ?auto_5880 ) ) ( not ( = ?auto_5878 ?auto_5894 ) ) ( not ( = ?auto_5880 ?auto_5893 ) ) ( not ( = ?auto_5897 ?auto_5900 ) ) ( not ( = ?auto_5898 ?auto_5901 ) ) ( not ( = ?auto_5894 ?auto_5893 ) ) ( not ( = ?auto_5878 ?auto_5881 ) ) ( not ( = ?auto_5878 ?auto_5896 ) ) ( not ( = ?auto_5879 ?auto_5881 ) ) ( not ( = ?auto_5879 ?auto_5896 ) ) ( not ( = ?auto_5881 ?auto_5894 ) ) ( not ( = ?auto_5881 ?auto_5893 ) ) ( not ( = ?auto_5899 ?auto_5897 ) ) ( not ( = ?auto_5899 ?auto_5900 ) ) ( not ( = ?auto_5903 ?auto_5898 ) ) ( not ( = ?auto_5903 ?auto_5901 ) ) ( not ( = ?auto_5896 ?auto_5894 ) ) ( not ( = ?auto_5896 ?auto_5893 ) ) ( not ( = ?auto_5878 ?auto_5882 ) ) ( not ( = ?auto_5878 ?auto_5902 ) ) ( not ( = ?auto_5879 ?auto_5882 ) ) ( not ( = ?auto_5879 ?auto_5902 ) ) ( not ( = ?auto_5880 ?auto_5882 ) ) ( not ( = ?auto_5880 ?auto_5902 ) ) ( not ( = ?auto_5882 ?auto_5896 ) ) ( not ( = ?auto_5882 ?auto_5894 ) ) ( not ( = ?auto_5882 ?auto_5893 ) ) ( not ( = ?auto_5902 ?auto_5896 ) ) ( not ( = ?auto_5902 ?auto_5894 ) ) ( not ( = ?auto_5902 ?auto_5893 ) ) ( not ( = ?auto_5878 ?auto_5883 ) ) ( not ( = ?auto_5878 ?auto_5907 ) ) ( not ( = ?auto_5879 ?auto_5883 ) ) ( not ( = ?auto_5879 ?auto_5907 ) ) ( not ( = ?auto_5880 ?auto_5883 ) ) ( not ( = ?auto_5880 ?auto_5907 ) ) ( not ( = ?auto_5881 ?auto_5883 ) ) ( not ( = ?auto_5881 ?auto_5907 ) ) ( not ( = ?auto_5883 ?auto_5902 ) ) ( not ( = ?auto_5883 ?auto_5896 ) ) ( not ( = ?auto_5883 ?auto_5894 ) ) ( not ( = ?auto_5883 ?auto_5893 ) ) ( not ( = ?auto_5904 ?auto_5900 ) ) ( not ( = ?auto_5904 ?auto_5899 ) ) ( not ( = ?auto_5904 ?auto_5897 ) ) ( not ( = ?auto_5895 ?auto_5901 ) ) ( not ( = ?auto_5895 ?auto_5903 ) ) ( not ( = ?auto_5895 ?auto_5898 ) ) ( not ( = ?auto_5907 ?auto_5902 ) ) ( not ( = ?auto_5907 ?auto_5896 ) ) ( not ( = ?auto_5907 ?auto_5894 ) ) ( not ( = ?auto_5907 ?auto_5893 ) ) ( not ( = ?auto_5878 ?auto_5884 ) ) ( not ( = ?auto_5878 ?auto_5906 ) ) ( not ( = ?auto_5879 ?auto_5884 ) ) ( not ( = ?auto_5879 ?auto_5906 ) ) ( not ( = ?auto_5880 ?auto_5884 ) ) ( not ( = ?auto_5880 ?auto_5906 ) ) ( not ( = ?auto_5881 ?auto_5884 ) ) ( not ( = ?auto_5881 ?auto_5906 ) ) ( not ( = ?auto_5882 ?auto_5884 ) ) ( not ( = ?auto_5882 ?auto_5906 ) ) ( not ( = ?auto_5884 ?auto_5907 ) ) ( not ( = ?auto_5884 ?auto_5902 ) ) ( not ( = ?auto_5884 ?auto_5896 ) ) ( not ( = ?auto_5884 ?auto_5894 ) ) ( not ( = ?auto_5884 ?auto_5893 ) ) ( not ( = ?auto_5906 ?auto_5907 ) ) ( not ( = ?auto_5906 ?auto_5902 ) ) ( not ( = ?auto_5906 ?auto_5896 ) ) ( not ( = ?auto_5906 ?auto_5894 ) ) ( not ( = ?auto_5906 ?auto_5893 ) ) ( not ( = ?auto_5878 ?auto_5885 ) ) ( not ( = ?auto_5878 ?auto_5905 ) ) ( not ( = ?auto_5879 ?auto_5885 ) ) ( not ( = ?auto_5879 ?auto_5905 ) ) ( not ( = ?auto_5880 ?auto_5885 ) ) ( not ( = ?auto_5880 ?auto_5905 ) ) ( not ( = ?auto_5881 ?auto_5885 ) ) ( not ( = ?auto_5881 ?auto_5905 ) ) ( not ( = ?auto_5882 ?auto_5885 ) ) ( not ( = ?auto_5882 ?auto_5905 ) ) ( not ( = ?auto_5883 ?auto_5885 ) ) ( not ( = ?auto_5883 ?auto_5905 ) ) ( not ( = ?auto_5885 ?auto_5906 ) ) ( not ( = ?auto_5885 ?auto_5907 ) ) ( not ( = ?auto_5885 ?auto_5902 ) ) ( not ( = ?auto_5885 ?auto_5896 ) ) ( not ( = ?auto_5885 ?auto_5894 ) ) ( not ( = ?auto_5885 ?auto_5893 ) ) ( not ( = ?auto_5905 ?auto_5906 ) ) ( not ( = ?auto_5905 ?auto_5907 ) ) ( not ( = ?auto_5905 ?auto_5902 ) ) ( not ( = ?auto_5905 ?auto_5896 ) ) ( not ( = ?auto_5905 ?auto_5894 ) ) ( not ( = ?auto_5905 ?auto_5893 ) ) ( not ( = ?auto_5878 ?auto_5886 ) ) ( not ( = ?auto_5878 ?auto_5888 ) ) ( not ( = ?auto_5879 ?auto_5886 ) ) ( not ( = ?auto_5879 ?auto_5888 ) ) ( not ( = ?auto_5880 ?auto_5886 ) ) ( not ( = ?auto_5880 ?auto_5888 ) ) ( not ( = ?auto_5881 ?auto_5886 ) ) ( not ( = ?auto_5881 ?auto_5888 ) ) ( not ( = ?auto_5882 ?auto_5886 ) ) ( not ( = ?auto_5882 ?auto_5888 ) ) ( not ( = ?auto_5883 ?auto_5886 ) ) ( not ( = ?auto_5883 ?auto_5888 ) ) ( not ( = ?auto_5884 ?auto_5886 ) ) ( not ( = ?auto_5884 ?auto_5888 ) ) ( not ( = ?auto_5886 ?auto_5905 ) ) ( not ( = ?auto_5886 ?auto_5906 ) ) ( not ( = ?auto_5886 ?auto_5907 ) ) ( not ( = ?auto_5886 ?auto_5902 ) ) ( not ( = ?auto_5886 ?auto_5896 ) ) ( not ( = ?auto_5886 ?auto_5894 ) ) ( not ( = ?auto_5886 ?auto_5893 ) ) ( not ( = ?auto_5891 ?auto_5897 ) ) ( not ( = ?auto_5891 ?auto_5900 ) ) ( not ( = ?auto_5891 ?auto_5904 ) ) ( not ( = ?auto_5891 ?auto_5899 ) ) ( not ( = ?auto_5887 ?auto_5898 ) ) ( not ( = ?auto_5887 ?auto_5901 ) ) ( not ( = ?auto_5887 ?auto_5895 ) ) ( not ( = ?auto_5887 ?auto_5903 ) ) ( not ( = ?auto_5888 ?auto_5905 ) ) ( not ( = ?auto_5888 ?auto_5906 ) ) ( not ( = ?auto_5888 ?auto_5907 ) ) ( not ( = ?auto_5888 ?auto_5902 ) ) ( not ( = ?auto_5888 ?auto_5896 ) ) ( not ( = ?auto_5888 ?auto_5894 ) ) ( not ( = ?auto_5888 ?auto_5893 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_5878 ?auto_5879 ?auto_5880 ?auto_5881 ?auto_5882 ?auto_5883 ?auto_5884 ?auto_5885 )
      ( MAKE-1CRATE ?auto_5885 ?auto_5886 )
      ( MAKE-8CRATE-VERIFY ?auto_5878 ?auto_5879 ?auto_5880 ?auto_5881 ?auto_5882 ?auto_5883 ?auto_5884 ?auto_5885 ?auto_5886 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_5928 - SURFACE
      ?auto_5929 - SURFACE
      ?auto_5930 - SURFACE
      ?auto_5931 - SURFACE
      ?auto_5932 - SURFACE
      ?auto_5933 - SURFACE
      ?auto_5934 - SURFACE
      ?auto_5935 - SURFACE
      ?auto_5936 - SURFACE
      ?auto_5937 - SURFACE
    )
    :vars
    (
      ?auto_5942 - HOIST
      ?auto_5938 - PLACE
      ?auto_5939 - PLACE
      ?auto_5940 - HOIST
      ?auto_5941 - SURFACE
      ?auto_5960 - PLACE
      ?auto_5961 - HOIST
      ?auto_5946 - SURFACE
      ?auto_5957 - PLACE
      ?auto_5958 - HOIST
      ?auto_5944 - SURFACE
      ?auto_5948 - PLACE
      ?auto_5954 - HOIST
      ?auto_5951 - SURFACE
      ?auto_5953 - PLACE
      ?auto_5949 - HOIST
      ?auto_5959 - SURFACE
      ?auto_5952 - SURFACE
      ?auto_5955 - PLACE
      ?auto_5956 - HOIST
      ?auto_5950 - SURFACE
      ?auto_5947 - SURFACE
      ?auto_5945 - SURFACE
      ?auto_5943 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5942 ?auto_5938 ) ( IS-CRATE ?auto_5937 ) ( not ( = ?auto_5939 ?auto_5938 ) ) ( HOIST-AT ?auto_5940 ?auto_5939 ) ( AVAILABLE ?auto_5940 ) ( SURFACE-AT ?auto_5937 ?auto_5939 ) ( ON ?auto_5937 ?auto_5941 ) ( CLEAR ?auto_5937 ) ( not ( = ?auto_5936 ?auto_5937 ) ) ( not ( = ?auto_5936 ?auto_5941 ) ) ( not ( = ?auto_5937 ?auto_5941 ) ) ( not ( = ?auto_5942 ?auto_5940 ) ) ( IS-CRATE ?auto_5936 ) ( not ( = ?auto_5960 ?auto_5938 ) ) ( HOIST-AT ?auto_5961 ?auto_5960 ) ( AVAILABLE ?auto_5961 ) ( SURFACE-AT ?auto_5936 ?auto_5960 ) ( ON ?auto_5936 ?auto_5946 ) ( CLEAR ?auto_5936 ) ( not ( = ?auto_5935 ?auto_5936 ) ) ( not ( = ?auto_5935 ?auto_5946 ) ) ( not ( = ?auto_5936 ?auto_5946 ) ) ( not ( = ?auto_5942 ?auto_5961 ) ) ( IS-CRATE ?auto_5935 ) ( not ( = ?auto_5957 ?auto_5938 ) ) ( HOIST-AT ?auto_5958 ?auto_5957 ) ( SURFACE-AT ?auto_5935 ?auto_5957 ) ( ON ?auto_5935 ?auto_5944 ) ( CLEAR ?auto_5935 ) ( not ( = ?auto_5934 ?auto_5935 ) ) ( not ( = ?auto_5934 ?auto_5944 ) ) ( not ( = ?auto_5935 ?auto_5944 ) ) ( not ( = ?auto_5942 ?auto_5958 ) ) ( IS-CRATE ?auto_5934 ) ( not ( = ?auto_5948 ?auto_5938 ) ) ( HOIST-AT ?auto_5954 ?auto_5948 ) ( SURFACE-AT ?auto_5934 ?auto_5948 ) ( ON ?auto_5934 ?auto_5951 ) ( CLEAR ?auto_5934 ) ( not ( = ?auto_5933 ?auto_5934 ) ) ( not ( = ?auto_5933 ?auto_5951 ) ) ( not ( = ?auto_5934 ?auto_5951 ) ) ( not ( = ?auto_5942 ?auto_5954 ) ) ( IS-CRATE ?auto_5933 ) ( not ( = ?auto_5953 ?auto_5938 ) ) ( HOIST-AT ?auto_5949 ?auto_5953 ) ( AVAILABLE ?auto_5949 ) ( SURFACE-AT ?auto_5933 ?auto_5953 ) ( ON ?auto_5933 ?auto_5959 ) ( CLEAR ?auto_5933 ) ( not ( = ?auto_5932 ?auto_5933 ) ) ( not ( = ?auto_5932 ?auto_5959 ) ) ( not ( = ?auto_5933 ?auto_5959 ) ) ( not ( = ?auto_5942 ?auto_5949 ) ) ( IS-CRATE ?auto_5932 ) ( SURFACE-AT ?auto_5932 ?auto_5948 ) ( ON ?auto_5932 ?auto_5952 ) ( CLEAR ?auto_5932 ) ( not ( = ?auto_5931 ?auto_5932 ) ) ( not ( = ?auto_5931 ?auto_5952 ) ) ( not ( = ?auto_5932 ?auto_5952 ) ) ( IS-CRATE ?auto_5931 ) ( not ( = ?auto_5955 ?auto_5938 ) ) ( HOIST-AT ?auto_5956 ?auto_5955 ) ( AVAILABLE ?auto_5956 ) ( SURFACE-AT ?auto_5931 ?auto_5955 ) ( ON ?auto_5931 ?auto_5950 ) ( CLEAR ?auto_5931 ) ( not ( = ?auto_5930 ?auto_5931 ) ) ( not ( = ?auto_5930 ?auto_5950 ) ) ( not ( = ?auto_5931 ?auto_5950 ) ) ( not ( = ?auto_5942 ?auto_5956 ) ) ( IS-CRATE ?auto_5930 ) ( AVAILABLE ?auto_5958 ) ( SURFACE-AT ?auto_5930 ?auto_5957 ) ( ON ?auto_5930 ?auto_5947 ) ( CLEAR ?auto_5930 ) ( not ( = ?auto_5929 ?auto_5930 ) ) ( not ( = ?auto_5929 ?auto_5947 ) ) ( not ( = ?auto_5930 ?auto_5947 ) ) ( SURFACE-AT ?auto_5928 ?auto_5938 ) ( CLEAR ?auto_5928 ) ( IS-CRATE ?auto_5929 ) ( AVAILABLE ?auto_5942 ) ( AVAILABLE ?auto_5954 ) ( SURFACE-AT ?auto_5929 ?auto_5948 ) ( ON ?auto_5929 ?auto_5945 ) ( CLEAR ?auto_5929 ) ( TRUCK-AT ?auto_5943 ?auto_5938 ) ( not ( = ?auto_5928 ?auto_5929 ) ) ( not ( = ?auto_5928 ?auto_5945 ) ) ( not ( = ?auto_5929 ?auto_5945 ) ) ( not ( = ?auto_5928 ?auto_5930 ) ) ( not ( = ?auto_5928 ?auto_5947 ) ) ( not ( = ?auto_5930 ?auto_5945 ) ) ( not ( = ?auto_5957 ?auto_5948 ) ) ( not ( = ?auto_5958 ?auto_5954 ) ) ( not ( = ?auto_5947 ?auto_5945 ) ) ( not ( = ?auto_5928 ?auto_5931 ) ) ( not ( = ?auto_5928 ?auto_5950 ) ) ( not ( = ?auto_5929 ?auto_5931 ) ) ( not ( = ?auto_5929 ?auto_5950 ) ) ( not ( = ?auto_5931 ?auto_5947 ) ) ( not ( = ?auto_5931 ?auto_5945 ) ) ( not ( = ?auto_5955 ?auto_5957 ) ) ( not ( = ?auto_5955 ?auto_5948 ) ) ( not ( = ?auto_5956 ?auto_5958 ) ) ( not ( = ?auto_5956 ?auto_5954 ) ) ( not ( = ?auto_5950 ?auto_5947 ) ) ( not ( = ?auto_5950 ?auto_5945 ) ) ( not ( = ?auto_5928 ?auto_5932 ) ) ( not ( = ?auto_5928 ?auto_5952 ) ) ( not ( = ?auto_5929 ?auto_5932 ) ) ( not ( = ?auto_5929 ?auto_5952 ) ) ( not ( = ?auto_5930 ?auto_5932 ) ) ( not ( = ?auto_5930 ?auto_5952 ) ) ( not ( = ?auto_5932 ?auto_5950 ) ) ( not ( = ?auto_5932 ?auto_5947 ) ) ( not ( = ?auto_5932 ?auto_5945 ) ) ( not ( = ?auto_5952 ?auto_5950 ) ) ( not ( = ?auto_5952 ?auto_5947 ) ) ( not ( = ?auto_5952 ?auto_5945 ) ) ( not ( = ?auto_5928 ?auto_5933 ) ) ( not ( = ?auto_5928 ?auto_5959 ) ) ( not ( = ?auto_5929 ?auto_5933 ) ) ( not ( = ?auto_5929 ?auto_5959 ) ) ( not ( = ?auto_5930 ?auto_5933 ) ) ( not ( = ?auto_5930 ?auto_5959 ) ) ( not ( = ?auto_5931 ?auto_5933 ) ) ( not ( = ?auto_5931 ?auto_5959 ) ) ( not ( = ?auto_5933 ?auto_5952 ) ) ( not ( = ?auto_5933 ?auto_5950 ) ) ( not ( = ?auto_5933 ?auto_5947 ) ) ( not ( = ?auto_5933 ?auto_5945 ) ) ( not ( = ?auto_5953 ?auto_5948 ) ) ( not ( = ?auto_5953 ?auto_5955 ) ) ( not ( = ?auto_5953 ?auto_5957 ) ) ( not ( = ?auto_5949 ?auto_5954 ) ) ( not ( = ?auto_5949 ?auto_5956 ) ) ( not ( = ?auto_5949 ?auto_5958 ) ) ( not ( = ?auto_5959 ?auto_5952 ) ) ( not ( = ?auto_5959 ?auto_5950 ) ) ( not ( = ?auto_5959 ?auto_5947 ) ) ( not ( = ?auto_5959 ?auto_5945 ) ) ( not ( = ?auto_5928 ?auto_5934 ) ) ( not ( = ?auto_5928 ?auto_5951 ) ) ( not ( = ?auto_5929 ?auto_5934 ) ) ( not ( = ?auto_5929 ?auto_5951 ) ) ( not ( = ?auto_5930 ?auto_5934 ) ) ( not ( = ?auto_5930 ?auto_5951 ) ) ( not ( = ?auto_5931 ?auto_5934 ) ) ( not ( = ?auto_5931 ?auto_5951 ) ) ( not ( = ?auto_5932 ?auto_5934 ) ) ( not ( = ?auto_5932 ?auto_5951 ) ) ( not ( = ?auto_5934 ?auto_5959 ) ) ( not ( = ?auto_5934 ?auto_5952 ) ) ( not ( = ?auto_5934 ?auto_5950 ) ) ( not ( = ?auto_5934 ?auto_5947 ) ) ( not ( = ?auto_5934 ?auto_5945 ) ) ( not ( = ?auto_5951 ?auto_5959 ) ) ( not ( = ?auto_5951 ?auto_5952 ) ) ( not ( = ?auto_5951 ?auto_5950 ) ) ( not ( = ?auto_5951 ?auto_5947 ) ) ( not ( = ?auto_5951 ?auto_5945 ) ) ( not ( = ?auto_5928 ?auto_5935 ) ) ( not ( = ?auto_5928 ?auto_5944 ) ) ( not ( = ?auto_5929 ?auto_5935 ) ) ( not ( = ?auto_5929 ?auto_5944 ) ) ( not ( = ?auto_5930 ?auto_5935 ) ) ( not ( = ?auto_5930 ?auto_5944 ) ) ( not ( = ?auto_5931 ?auto_5935 ) ) ( not ( = ?auto_5931 ?auto_5944 ) ) ( not ( = ?auto_5932 ?auto_5935 ) ) ( not ( = ?auto_5932 ?auto_5944 ) ) ( not ( = ?auto_5933 ?auto_5935 ) ) ( not ( = ?auto_5933 ?auto_5944 ) ) ( not ( = ?auto_5935 ?auto_5951 ) ) ( not ( = ?auto_5935 ?auto_5959 ) ) ( not ( = ?auto_5935 ?auto_5952 ) ) ( not ( = ?auto_5935 ?auto_5950 ) ) ( not ( = ?auto_5935 ?auto_5947 ) ) ( not ( = ?auto_5935 ?auto_5945 ) ) ( not ( = ?auto_5944 ?auto_5951 ) ) ( not ( = ?auto_5944 ?auto_5959 ) ) ( not ( = ?auto_5944 ?auto_5952 ) ) ( not ( = ?auto_5944 ?auto_5950 ) ) ( not ( = ?auto_5944 ?auto_5947 ) ) ( not ( = ?auto_5944 ?auto_5945 ) ) ( not ( = ?auto_5928 ?auto_5936 ) ) ( not ( = ?auto_5928 ?auto_5946 ) ) ( not ( = ?auto_5929 ?auto_5936 ) ) ( not ( = ?auto_5929 ?auto_5946 ) ) ( not ( = ?auto_5930 ?auto_5936 ) ) ( not ( = ?auto_5930 ?auto_5946 ) ) ( not ( = ?auto_5931 ?auto_5936 ) ) ( not ( = ?auto_5931 ?auto_5946 ) ) ( not ( = ?auto_5932 ?auto_5936 ) ) ( not ( = ?auto_5932 ?auto_5946 ) ) ( not ( = ?auto_5933 ?auto_5936 ) ) ( not ( = ?auto_5933 ?auto_5946 ) ) ( not ( = ?auto_5934 ?auto_5936 ) ) ( not ( = ?auto_5934 ?auto_5946 ) ) ( not ( = ?auto_5936 ?auto_5944 ) ) ( not ( = ?auto_5936 ?auto_5951 ) ) ( not ( = ?auto_5936 ?auto_5959 ) ) ( not ( = ?auto_5936 ?auto_5952 ) ) ( not ( = ?auto_5936 ?auto_5950 ) ) ( not ( = ?auto_5936 ?auto_5947 ) ) ( not ( = ?auto_5936 ?auto_5945 ) ) ( not ( = ?auto_5960 ?auto_5957 ) ) ( not ( = ?auto_5960 ?auto_5948 ) ) ( not ( = ?auto_5960 ?auto_5953 ) ) ( not ( = ?auto_5960 ?auto_5955 ) ) ( not ( = ?auto_5961 ?auto_5958 ) ) ( not ( = ?auto_5961 ?auto_5954 ) ) ( not ( = ?auto_5961 ?auto_5949 ) ) ( not ( = ?auto_5961 ?auto_5956 ) ) ( not ( = ?auto_5946 ?auto_5944 ) ) ( not ( = ?auto_5946 ?auto_5951 ) ) ( not ( = ?auto_5946 ?auto_5959 ) ) ( not ( = ?auto_5946 ?auto_5952 ) ) ( not ( = ?auto_5946 ?auto_5950 ) ) ( not ( = ?auto_5946 ?auto_5947 ) ) ( not ( = ?auto_5946 ?auto_5945 ) ) ( not ( = ?auto_5928 ?auto_5937 ) ) ( not ( = ?auto_5928 ?auto_5941 ) ) ( not ( = ?auto_5929 ?auto_5937 ) ) ( not ( = ?auto_5929 ?auto_5941 ) ) ( not ( = ?auto_5930 ?auto_5937 ) ) ( not ( = ?auto_5930 ?auto_5941 ) ) ( not ( = ?auto_5931 ?auto_5937 ) ) ( not ( = ?auto_5931 ?auto_5941 ) ) ( not ( = ?auto_5932 ?auto_5937 ) ) ( not ( = ?auto_5932 ?auto_5941 ) ) ( not ( = ?auto_5933 ?auto_5937 ) ) ( not ( = ?auto_5933 ?auto_5941 ) ) ( not ( = ?auto_5934 ?auto_5937 ) ) ( not ( = ?auto_5934 ?auto_5941 ) ) ( not ( = ?auto_5935 ?auto_5937 ) ) ( not ( = ?auto_5935 ?auto_5941 ) ) ( not ( = ?auto_5937 ?auto_5946 ) ) ( not ( = ?auto_5937 ?auto_5944 ) ) ( not ( = ?auto_5937 ?auto_5951 ) ) ( not ( = ?auto_5937 ?auto_5959 ) ) ( not ( = ?auto_5937 ?auto_5952 ) ) ( not ( = ?auto_5937 ?auto_5950 ) ) ( not ( = ?auto_5937 ?auto_5947 ) ) ( not ( = ?auto_5937 ?auto_5945 ) ) ( not ( = ?auto_5939 ?auto_5960 ) ) ( not ( = ?auto_5939 ?auto_5957 ) ) ( not ( = ?auto_5939 ?auto_5948 ) ) ( not ( = ?auto_5939 ?auto_5953 ) ) ( not ( = ?auto_5939 ?auto_5955 ) ) ( not ( = ?auto_5940 ?auto_5961 ) ) ( not ( = ?auto_5940 ?auto_5958 ) ) ( not ( = ?auto_5940 ?auto_5954 ) ) ( not ( = ?auto_5940 ?auto_5949 ) ) ( not ( = ?auto_5940 ?auto_5956 ) ) ( not ( = ?auto_5941 ?auto_5946 ) ) ( not ( = ?auto_5941 ?auto_5944 ) ) ( not ( = ?auto_5941 ?auto_5951 ) ) ( not ( = ?auto_5941 ?auto_5959 ) ) ( not ( = ?auto_5941 ?auto_5952 ) ) ( not ( = ?auto_5941 ?auto_5950 ) ) ( not ( = ?auto_5941 ?auto_5947 ) ) ( not ( = ?auto_5941 ?auto_5945 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_5928 ?auto_5929 ?auto_5930 ?auto_5931 ?auto_5932 ?auto_5933 ?auto_5934 ?auto_5935 ?auto_5936 )
      ( MAKE-1CRATE ?auto_5936 ?auto_5937 )
      ( MAKE-9CRATE-VERIFY ?auto_5928 ?auto_5929 ?auto_5930 ?auto_5931 ?auto_5932 ?auto_5933 ?auto_5934 ?auto_5935 ?auto_5936 ?auto_5937 ) )
  )

)

