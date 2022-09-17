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
      ?auto_5652 - SURFACE
      ?auto_5653 - SURFACE
    )
    :vars
    (
      ?auto_5654 - HOIST
      ?auto_5655 - PLACE
      ?auto_5657 - PLACE
      ?auto_5658 - HOIST
      ?auto_5659 - SURFACE
      ?auto_5656 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5654 ?auto_5655 ) ( SURFACE-AT ?auto_5653 ?auto_5655 ) ( CLEAR ?auto_5653 ) ( IS-CRATE ?auto_5652 ) ( AVAILABLE ?auto_5654 ) ( not ( = ?auto_5657 ?auto_5655 ) ) ( HOIST-AT ?auto_5658 ?auto_5657 ) ( AVAILABLE ?auto_5658 ) ( SURFACE-AT ?auto_5652 ?auto_5657 ) ( ON ?auto_5652 ?auto_5659 ) ( CLEAR ?auto_5652 ) ( TRUCK-AT ?auto_5656 ?auto_5655 ) ( not ( = ?auto_5652 ?auto_5653 ) ) ( not ( = ?auto_5652 ?auto_5659 ) ) ( not ( = ?auto_5653 ?auto_5659 ) ) ( not ( = ?auto_5654 ?auto_5658 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5656 ?auto_5655 ?auto_5657 )
      ( !LIFT ?auto_5658 ?auto_5652 ?auto_5659 ?auto_5657 )
      ( !LOAD ?auto_5658 ?auto_5652 ?auto_5656 ?auto_5657 )
      ( !DRIVE ?auto_5656 ?auto_5657 ?auto_5655 )
      ( !UNLOAD ?auto_5654 ?auto_5652 ?auto_5656 ?auto_5655 )
      ( !DROP ?auto_5654 ?auto_5652 ?auto_5653 ?auto_5655 )
      ( MAKE-ON-VERIFY ?auto_5652 ?auto_5653 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5662 - SURFACE
      ?auto_5663 - SURFACE
    )
    :vars
    (
      ?auto_5664 - HOIST
      ?auto_5665 - PLACE
      ?auto_5667 - PLACE
      ?auto_5668 - HOIST
      ?auto_5669 - SURFACE
      ?auto_5666 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5664 ?auto_5665 ) ( SURFACE-AT ?auto_5663 ?auto_5665 ) ( CLEAR ?auto_5663 ) ( IS-CRATE ?auto_5662 ) ( AVAILABLE ?auto_5664 ) ( not ( = ?auto_5667 ?auto_5665 ) ) ( HOIST-AT ?auto_5668 ?auto_5667 ) ( AVAILABLE ?auto_5668 ) ( SURFACE-AT ?auto_5662 ?auto_5667 ) ( ON ?auto_5662 ?auto_5669 ) ( CLEAR ?auto_5662 ) ( TRUCK-AT ?auto_5666 ?auto_5665 ) ( not ( = ?auto_5662 ?auto_5663 ) ) ( not ( = ?auto_5662 ?auto_5669 ) ) ( not ( = ?auto_5663 ?auto_5669 ) ) ( not ( = ?auto_5664 ?auto_5668 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5666 ?auto_5665 ?auto_5667 )
      ( !LIFT ?auto_5668 ?auto_5662 ?auto_5669 ?auto_5667 )
      ( !LOAD ?auto_5668 ?auto_5662 ?auto_5666 ?auto_5667 )
      ( !DRIVE ?auto_5666 ?auto_5667 ?auto_5665 )
      ( !UNLOAD ?auto_5664 ?auto_5662 ?auto_5666 ?auto_5665 )
      ( !DROP ?auto_5664 ?auto_5662 ?auto_5663 ?auto_5665 )
      ( MAKE-ON-VERIFY ?auto_5662 ?auto_5663 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5672 - SURFACE
      ?auto_5673 - SURFACE
    )
    :vars
    (
      ?auto_5674 - HOIST
      ?auto_5675 - PLACE
      ?auto_5677 - PLACE
      ?auto_5678 - HOIST
      ?auto_5679 - SURFACE
      ?auto_5676 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5674 ?auto_5675 ) ( SURFACE-AT ?auto_5673 ?auto_5675 ) ( CLEAR ?auto_5673 ) ( IS-CRATE ?auto_5672 ) ( AVAILABLE ?auto_5674 ) ( not ( = ?auto_5677 ?auto_5675 ) ) ( HOIST-AT ?auto_5678 ?auto_5677 ) ( AVAILABLE ?auto_5678 ) ( SURFACE-AT ?auto_5672 ?auto_5677 ) ( ON ?auto_5672 ?auto_5679 ) ( CLEAR ?auto_5672 ) ( TRUCK-AT ?auto_5676 ?auto_5675 ) ( not ( = ?auto_5672 ?auto_5673 ) ) ( not ( = ?auto_5672 ?auto_5679 ) ) ( not ( = ?auto_5673 ?auto_5679 ) ) ( not ( = ?auto_5674 ?auto_5678 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5676 ?auto_5675 ?auto_5677 )
      ( !LIFT ?auto_5678 ?auto_5672 ?auto_5679 ?auto_5677 )
      ( !LOAD ?auto_5678 ?auto_5672 ?auto_5676 ?auto_5677 )
      ( !DRIVE ?auto_5676 ?auto_5677 ?auto_5675 )
      ( !UNLOAD ?auto_5674 ?auto_5672 ?auto_5676 ?auto_5675 )
      ( !DROP ?auto_5674 ?auto_5672 ?auto_5673 ?auto_5675 )
      ( MAKE-ON-VERIFY ?auto_5672 ?auto_5673 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5682 - SURFACE
      ?auto_5683 - SURFACE
    )
    :vars
    (
      ?auto_5684 - HOIST
      ?auto_5685 - PLACE
      ?auto_5687 - PLACE
      ?auto_5688 - HOIST
      ?auto_5689 - SURFACE
      ?auto_5686 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5684 ?auto_5685 ) ( SURFACE-AT ?auto_5683 ?auto_5685 ) ( CLEAR ?auto_5683 ) ( IS-CRATE ?auto_5682 ) ( AVAILABLE ?auto_5684 ) ( not ( = ?auto_5687 ?auto_5685 ) ) ( HOIST-AT ?auto_5688 ?auto_5687 ) ( AVAILABLE ?auto_5688 ) ( SURFACE-AT ?auto_5682 ?auto_5687 ) ( ON ?auto_5682 ?auto_5689 ) ( CLEAR ?auto_5682 ) ( TRUCK-AT ?auto_5686 ?auto_5685 ) ( not ( = ?auto_5682 ?auto_5683 ) ) ( not ( = ?auto_5682 ?auto_5689 ) ) ( not ( = ?auto_5683 ?auto_5689 ) ) ( not ( = ?auto_5684 ?auto_5688 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5686 ?auto_5685 ?auto_5687 )
      ( !LIFT ?auto_5688 ?auto_5682 ?auto_5689 ?auto_5687 )
      ( !LOAD ?auto_5688 ?auto_5682 ?auto_5686 ?auto_5687 )
      ( !DRIVE ?auto_5686 ?auto_5687 ?auto_5685 )
      ( !UNLOAD ?auto_5684 ?auto_5682 ?auto_5686 ?auto_5685 )
      ( !DROP ?auto_5684 ?auto_5682 ?auto_5683 ?auto_5685 )
      ( MAKE-ON-VERIFY ?auto_5682 ?auto_5683 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5692 - SURFACE
      ?auto_5693 - SURFACE
    )
    :vars
    (
      ?auto_5694 - HOIST
      ?auto_5695 - PLACE
      ?auto_5697 - PLACE
      ?auto_5698 - HOIST
      ?auto_5699 - SURFACE
      ?auto_5696 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5694 ?auto_5695 ) ( SURFACE-AT ?auto_5693 ?auto_5695 ) ( CLEAR ?auto_5693 ) ( IS-CRATE ?auto_5692 ) ( AVAILABLE ?auto_5694 ) ( not ( = ?auto_5697 ?auto_5695 ) ) ( HOIST-AT ?auto_5698 ?auto_5697 ) ( AVAILABLE ?auto_5698 ) ( SURFACE-AT ?auto_5692 ?auto_5697 ) ( ON ?auto_5692 ?auto_5699 ) ( CLEAR ?auto_5692 ) ( TRUCK-AT ?auto_5696 ?auto_5695 ) ( not ( = ?auto_5692 ?auto_5693 ) ) ( not ( = ?auto_5692 ?auto_5699 ) ) ( not ( = ?auto_5693 ?auto_5699 ) ) ( not ( = ?auto_5694 ?auto_5698 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5696 ?auto_5695 ?auto_5697 )
      ( !LIFT ?auto_5698 ?auto_5692 ?auto_5699 ?auto_5697 )
      ( !LOAD ?auto_5698 ?auto_5692 ?auto_5696 ?auto_5697 )
      ( !DRIVE ?auto_5696 ?auto_5697 ?auto_5695 )
      ( !UNLOAD ?auto_5694 ?auto_5692 ?auto_5696 ?auto_5695 )
      ( !DROP ?auto_5694 ?auto_5692 ?auto_5693 ?auto_5695 )
      ( MAKE-ON-VERIFY ?auto_5692 ?auto_5693 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5702 - SURFACE
      ?auto_5703 - SURFACE
    )
    :vars
    (
      ?auto_5704 - HOIST
      ?auto_5705 - PLACE
      ?auto_5707 - PLACE
      ?auto_5708 - HOIST
      ?auto_5709 - SURFACE
      ?auto_5706 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5704 ?auto_5705 ) ( SURFACE-AT ?auto_5703 ?auto_5705 ) ( CLEAR ?auto_5703 ) ( IS-CRATE ?auto_5702 ) ( AVAILABLE ?auto_5704 ) ( not ( = ?auto_5707 ?auto_5705 ) ) ( HOIST-AT ?auto_5708 ?auto_5707 ) ( AVAILABLE ?auto_5708 ) ( SURFACE-AT ?auto_5702 ?auto_5707 ) ( ON ?auto_5702 ?auto_5709 ) ( CLEAR ?auto_5702 ) ( TRUCK-AT ?auto_5706 ?auto_5705 ) ( not ( = ?auto_5702 ?auto_5703 ) ) ( not ( = ?auto_5702 ?auto_5709 ) ) ( not ( = ?auto_5703 ?auto_5709 ) ) ( not ( = ?auto_5704 ?auto_5708 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5706 ?auto_5705 ?auto_5707 )
      ( !LIFT ?auto_5708 ?auto_5702 ?auto_5709 ?auto_5707 )
      ( !LOAD ?auto_5708 ?auto_5702 ?auto_5706 ?auto_5707 )
      ( !DRIVE ?auto_5706 ?auto_5707 ?auto_5705 )
      ( !UNLOAD ?auto_5704 ?auto_5702 ?auto_5706 ?auto_5705 )
      ( !DROP ?auto_5704 ?auto_5702 ?auto_5703 ?auto_5705 )
      ( MAKE-ON-VERIFY ?auto_5702 ?auto_5703 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5712 - SURFACE
      ?auto_5713 - SURFACE
    )
    :vars
    (
      ?auto_5714 - HOIST
      ?auto_5715 - PLACE
      ?auto_5717 - PLACE
      ?auto_5718 - HOIST
      ?auto_5719 - SURFACE
      ?auto_5716 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5714 ?auto_5715 ) ( SURFACE-AT ?auto_5713 ?auto_5715 ) ( CLEAR ?auto_5713 ) ( IS-CRATE ?auto_5712 ) ( AVAILABLE ?auto_5714 ) ( not ( = ?auto_5717 ?auto_5715 ) ) ( HOIST-AT ?auto_5718 ?auto_5717 ) ( AVAILABLE ?auto_5718 ) ( SURFACE-AT ?auto_5712 ?auto_5717 ) ( ON ?auto_5712 ?auto_5719 ) ( CLEAR ?auto_5712 ) ( TRUCK-AT ?auto_5716 ?auto_5715 ) ( not ( = ?auto_5712 ?auto_5713 ) ) ( not ( = ?auto_5712 ?auto_5719 ) ) ( not ( = ?auto_5713 ?auto_5719 ) ) ( not ( = ?auto_5714 ?auto_5718 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5716 ?auto_5715 ?auto_5717 )
      ( !LIFT ?auto_5718 ?auto_5712 ?auto_5719 ?auto_5717 )
      ( !LOAD ?auto_5718 ?auto_5712 ?auto_5716 ?auto_5717 )
      ( !DRIVE ?auto_5716 ?auto_5717 ?auto_5715 )
      ( !UNLOAD ?auto_5714 ?auto_5712 ?auto_5716 ?auto_5715 )
      ( !DROP ?auto_5714 ?auto_5712 ?auto_5713 ?auto_5715 )
      ( MAKE-ON-VERIFY ?auto_5712 ?auto_5713 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5722 - SURFACE
      ?auto_5723 - SURFACE
    )
    :vars
    (
      ?auto_5724 - HOIST
      ?auto_5725 - PLACE
      ?auto_5727 - PLACE
      ?auto_5728 - HOIST
      ?auto_5729 - SURFACE
      ?auto_5726 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5724 ?auto_5725 ) ( SURFACE-AT ?auto_5723 ?auto_5725 ) ( CLEAR ?auto_5723 ) ( IS-CRATE ?auto_5722 ) ( AVAILABLE ?auto_5724 ) ( not ( = ?auto_5727 ?auto_5725 ) ) ( HOIST-AT ?auto_5728 ?auto_5727 ) ( AVAILABLE ?auto_5728 ) ( SURFACE-AT ?auto_5722 ?auto_5727 ) ( ON ?auto_5722 ?auto_5729 ) ( CLEAR ?auto_5722 ) ( TRUCK-AT ?auto_5726 ?auto_5725 ) ( not ( = ?auto_5722 ?auto_5723 ) ) ( not ( = ?auto_5722 ?auto_5729 ) ) ( not ( = ?auto_5723 ?auto_5729 ) ) ( not ( = ?auto_5724 ?auto_5728 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5726 ?auto_5725 ?auto_5727 )
      ( !LIFT ?auto_5728 ?auto_5722 ?auto_5729 ?auto_5727 )
      ( !LOAD ?auto_5728 ?auto_5722 ?auto_5726 ?auto_5727 )
      ( !DRIVE ?auto_5726 ?auto_5727 ?auto_5725 )
      ( !UNLOAD ?auto_5724 ?auto_5722 ?auto_5726 ?auto_5725 )
      ( !DROP ?auto_5724 ?auto_5722 ?auto_5723 ?auto_5725 )
      ( MAKE-ON-VERIFY ?auto_5722 ?auto_5723 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5732 - SURFACE
      ?auto_5733 - SURFACE
    )
    :vars
    (
      ?auto_5734 - HOIST
      ?auto_5735 - PLACE
      ?auto_5737 - PLACE
      ?auto_5738 - HOIST
      ?auto_5739 - SURFACE
      ?auto_5736 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5734 ?auto_5735 ) ( SURFACE-AT ?auto_5733 ?auto_5735 ) ( CLEAR ?auto_5733 ) ( IS-CRATE ?auto_5732 ) ( AVAILABLE ?auto_5734 ) ( not ( = ?auto_5737 ?auto_5735 ) ) ( HOIST-AT ?auto_5738 ?auto_5737 ) ( AVAILABLE ?auto_5738 ) ( SURFACE-AT ?auto_5732 ?auto_5737 ) ( ON ?auto_5732 ?auto_5739 ) ( CLEAR ?auto_5732 ) ( TRUCK-AT ?auto_5736 ?auto_5735 ) ( not ( = ?auto_5732 ?auto_5733 ) ) ( not ( = ?auto_5732 ?auto_5739 ) ) ( not ( = ?auto_5733 ?auto_5739 ) ) ( not ( = ?auto_5734 ?auto_5738 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5736 ?auto_5735 ?auto_5737 )
      ( !LIFT ?auto_5738 ?auto_5732 ?auto_5739 ?auto_5737 )
      ( !LOAD ?auto_5738 ?auto_5732 ?auto_5736 ?auto_5737 )
      ( !DRIVE ?auto_5736 ?auto_5737 ?auto_5735 )
      ( !UNLOAD ?auto_5734 ?auto_5732 ?auto_5736 ?auto_5735 )
      ( !DROP ?auto_5734 ?auto_5732 ?auto_5733 ?auto_5735 )
      ( MAKE-ON-VERIFY ?auto_5732 ?auto_5733 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5742 - SURFACE
      ?auto_5743 - SURFACE
    )
    :vars
    (
      ?auto_5744 - HOIST
      ?auto_5745 - PLACE
      ?auto_5747 - PLACE
      ?auto_5748 - HOIST
      ?auto_5749 - SURFACE
      ?auto_5746 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5744 ?auto_5745 ) ( SURFACE-AT ?auto_5743 ?auto_5745 ) ( CLEAR ?auto_5743 ) ( IS-CRATE ?auto_5742 ) ( AVAILABLE ?auto_5744 ) ( not ( = ?auto_5747 ?auto_5745 ) ) ( HOIST-AT ?auto_5748 ?auto_5747 ) ( AVAILABLE ?auto_5748 ) ( SURFACE-AT ?auto_5742 ?auto_5747 ) ( ON ?auto_5742 ?auto_5749 ) ( CLEAR ?auto_5742 ) ( TRUCK-AT ?auto_5746 ?auto_5745 ) ( not ( = ?auto_5742 ?auto_5743 ) ) ( not ( = ?auto_5742 ?auto_5749 ) ) ( not ( = ?auto_5743 ?auto_5749 ) ) ( not ( = ?auto_5744 ?auto_5748 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5746 ?auto_5745 ?auto_5747 )
      ( !LIFT ?auto_5748 ?auto_5742 ?auto_5749 ?auto_5747 )
      ( !LOAD ?auto_5748 ?auto_5742 ?auto_5746 ?auto_5747 )
      ( !DRIVE ?auto_5746 ?auto_5747 ?auto_5745 )
      ( !UNLOAD ?auto_5744 ?auto_5742 ?auto_5746 ?auto_5745 )
      ( !DROP ?auto_5744 ?auto_5742 ?auto_5743 ?auto_5745 )
      ( MAKE-ON-VERIFY ?auto_5742 ?auto_5743 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5752 - SURFACE
      ?auto_5753 - SURFACE
    )
    :vars
    (
      ?auto_5754 - HOIST
      ?auto_5755 - PLACE
      ?auto_5757 - PLACE
      ?auto_5758 - HOIST
      ?auto_5759 - SURFACE
      ?auto_5756 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5754 ?auto_5755 ) ( SURFACE-AT ?auto_5753 ?auto_5755 ) ( CLEAR ?auto_5753 ) ( IS-CRATE ?auto_5752 ) ( AVAILABLE ?auto_5754 ) ( not ( = ?auto_5757 ?auto_5755 ) ) ( HOIST-AT ?auto_5758 ?auto_5757 ) ( AVAILABLE ?auto_5758 ) ( SURFACE-AT ?auto_5752 ?auto_5757 ) ( ON ?auto_5752 ?auto_5759 ) ( CLEAR ?auto_5752 ) ( TRUCK-AT ?auto_5756 ?auto_5755 ) ( not ( = ?auto_5752 ?auto_5753 ) ) ( not ( = ?auto_5752 ?auto_5759 ) ) ( not ( = ?auto_5753 ?auto_5759 ) ) ( not ( = ?auto_5754 ?auto_5758 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5756 ?auto_5755 ?auto_5757 )
      ( !LIFT ?auto_5758 ?auto_5752 ?auto_5759 ?auto_5757 )
      ( !LOAD ?auto_5758 ?auto_5752 ?auto_5756 ?auto_5757 )
      ( !DRIVE ?auto_5756 ?auto_5757 ?auto_5755 )
      ( !UNLOAD ?auto_5754 ?auto_5752 ?auto_5756 ?auto_5755 )
      ( !DROP ?auto_5754 ?auto_5752 ?auto_5753 ?auto_5755 )
      ( MAKE-ON-VERIFY ?auto_5752 ?auto_5753 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5762 - SURFACE
      ?auto_5763 - SURFACE
    )
    :vars
    (
      ?auto_5764 - HOIST
      ?auto_5765 - PLACE
      ?auto_5767 - PLACE
      ?auto_5768 - HOIST
      ?auto_5769 - SURFACE
      ?auto_5766 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5764 ?auto_5765 ) ( SURFACE-AT ?auto_5763 ?auto_5765 ) ( CLEAR ?auto_5763 ) ( IS-CRATE ?auto_5762 ) ( AVAILABLE ?auto_5764 ) ( not ( = ?auto_5767 ?auto_5765 ) ) ( HOIST-AT ?auto_5768 ?auto_5767 ) ( AVAILABLE ?auto_5768 ) ( SURFACE-AT ?auto_5762 ?auto_5767 ) ( ON ?auto_5762 ?auto_5769 ) ( CLEAR ?auto_5762 ) ( TRUCK-AT ?auto_5766 ?auto_5765 ) ( not ( = ?auto_5762 ?auto_5763 ) ) ( not ( = ?auto_5762 ?auto_5769 ) ) ( not ( = ?auto_5763 ?auto_5769 ) ) ( not ( = ?auto_5764 ?auto_5768 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5766 ?auto_5765 ?auto_5767 )
      ( !LIFT ?auto_5768 ?auto_5762 ?auto_5769 ?auto_5767 )
      ( !LOAD ?auto_5768 ?auto_5762 ?auto_5766 ?auto_5767 )
      ( !DRIVE ?auto_5766 ?auto_5767 ?auto_5765 )
      ( !UNLOAD ?auto_5764 ?auto_5762 ?auto_5766 ?auto_5765 )
      ( !DROP ?auto_5764 ?auto_5762 ?auto_5763 ?auto_5765 )
      ( MAKE-ON-VERIFY ?auto_5762 ?auto_5763 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5772 - SURFACE
      ?auto_5773 - SURFACE
    )
    :vars
    (
      ?auto_5774 - HOIST
      ?auto_5775 - PLACE
      ?auto_5777 - PLACE
      ?auto_5778 - HOIST
      ?auto_5779 - SURFACE
      ?auto_5776 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5774 ?auto_5775 ) ( SURFACE-AT ?auto_5773 ?auto_5775 ) ( CLEAR ?auto_5773 ) ( IS-CRATE ?auto_5772 ) ( AVAILABLE ?auto_5774 ) ( not ( = ?auto_5777 ?auto_5775 ) ) ( HOIST-AT ?auto_5778 ?auto_5777 ) ( AVAILABLE ?auto_5778 ) ( SURFACE-AT ?auto_5772 ?auto_5777 ) ( ON ?auto_5772 ?auto_5779 ) ( CLEAR ?auto_5772 ) ( TRUCK-AT ?auto_5776 ?auto_5775 ) ( not ( = ?auto_5772 ?auto_5773 ) ) ( not ( = ?auto_5772 ?auto_5779 ) ) ( not ( = ?auto_5773 ?auto_5779 ) ) ( not ( = ?auto_5774 ?auto_5778 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5776 ?auto_5775 ?auto_5777 )
      ( !LIFT ?auto_5778 ?auto_5772 ?auto_5779 ?auto_5777 )
      ( !LOAD ?auto_5778 ?auto_5772 ?auto_5776 ?auto_5777 )
      ( !DRIVE ?auto_5776 ?auto_5777 ?auto_5775 )
      ( !UNLOAD ?auto_5774 ?auto_5772 ?auto_5776 ?auto_5775 )
      ( !DROP ?auto_5774 ?auto_5772 ?auto_5773 ?auto_5775 )
      ( MAKE-ON-VERIFY ?auto_5772 ?auto_5773 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5782 - SURFACE
      ?auto_5783 - SURFACE
    )
    :vars
    (
      ?auto_5784 - HOIST
      ?auto_5785 - PLACE
      ?auto_5787 - PLACE
      ?auto_5788 - HOIST
      ?auto_5789 - SURFACE
      ?auto_5786 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5784 ?auto_5785 ) ( SURFACE-AT ?auto_5783 ?auto_5785 ) ( CLEAR ?auto_5783 ) ( IS-CRATE ?auto_5782 ) ( AVAILABLE ?auto_5784 ) ( not ( = ?auto_5787 ?auto_5785 ) ) ( HOIST-AT ?auto_5788 ?auto_5787 ) ( AVAILABLE ?auto_5788 ) ( SURFACE-AT ?auto_5782 ?auto_5787 ) ( ON ?auto_5782 ?auto_5789 ) ( CLEAR ?auto_5782 ) ( TRUCK-AT ?auto_5786 ?auto_5785 ) ( not ( = ?auto_5782 ?auto_5783 ) ) ( not ( = ?auto_5782 ?auto_5789 ) ) ( not ( = ?auto_5783 ?auto_5789 ) ) ( not ( = ?auto_5784 ?auto_5788 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5786 ?auto_5785 ?auto_5787 )
      ( !LIFT ?auto_5788 ?auto_5782 ?auto_5789 ?auto_5787 )
      ( !LOAD ?auto_5788 ?auto_5782 ?auto_5786 ?auto_5787 )
      ( !DRIVE ?auto_5786 ?auto_5787 ?auto_5785 )
      ( !UNLOAD ?auto_5784 ?auto_5782 ?auto_5786 ?auto_5785 )
      ( !DROP ?auto_5784 ?auto_5782 ?auto_5783 ?auto_5785 )
      ( MAKE-ON-VERIFY ?auto_5782 ?auto_5783 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5792 - SURFACE
      ?auto_5793 - SURFACE
    )
    :vars
    (
      ?auto_5794 - HOIST
      ?auto_5795 - PLACE
      ?auto_5797 - PLACE
      ?auto_5798 - HOIST
      ?auto_5799 - SURFACE
      ?auto_5796 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5794 ?auto_5795 ) ( SURFACE-AT ?auto_5793 ?auto_5795 ) ( CLEAR ?auto_5793 ) ( IS-CRATE ?auto_5792 ) ( AVAILABLE ?auto_5794 ) ( not ( = ?auto_5797 ?auto_5795 ) ) ( HOIST-AT ?auto_5798 ?auto_5797 ) ( AVAILABLE ?auto_5798 ) ( SURFACE-AT ?auto_5792 ?auto_5797 ) ( ON ?auto_5792 ?auto_5799 ) ( CLEAR ?auto_5792 ) ( TRUCK-AT ?auto_5796 ?auto_5795 ) ( not ( = ?auto_5792 ?auto_5793 ) ) ( not ( = ?auto_5792 ?auto_5799 ) ) ( not ( = ?auto_5793 ?auto_5799 ) ) ( not ( = ?auto_5794 ?auto_5798 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5796 ?auto_5795 ?auto_5797 )
      ( !LIFT ?auto_5798 ?auto_5792 ?auto_5799 ?auto_5797 )
      ( !LOAD ?auto_5798 ?auto_5792 ?auto_5796 ?auto_5797 )
      ( !DRIVE ?auto_5796 ?auto_5797 ?auto_5795 )
      ( !UNLOAD ?auto_5794 ?auto_5792 ?auto_5796 ?auto_5795 )
      ( !DROP ?auto_5794 ?auto_5792 ?auto_5793 ?auto_5795 )
      ( MAKE-ON-VERIFY ?auto_5792 ?auto_5793 ) )
  )

)

