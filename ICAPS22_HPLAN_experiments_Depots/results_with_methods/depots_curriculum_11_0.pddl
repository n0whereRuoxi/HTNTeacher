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
      ?auto_2702 - SURFACE
      ?auto_2703 - SURFACE
    )
    :vars
    (
      ?auto_2704 - HOIST
      ?auto_2705 - PLACE
      ?auto_2707 - PLACE
      ?auto_2708 - HOIST
      ?auto_2709 - SURFACE
      ?auto_2706 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2704 ?auto_2705 ) ( SURFACE-AT ?auto_2703 ?auto_2705 ) ( CLEAR ?auto_2703 ) ( IS-CRATE ?auto_2702 ) ( AVAILABLE ?auto_2704 ) ( not ( = ?auto_2707 ?auto_2705 ) ) ( HOIST-AT ?auto_2708 ?auto_2707 ) ( AVAILABLE ?auto_2708 ) ( SURFACE-AT ?auto_2702 ?auto_2707 ) ( ON ?auto_2702 ?auto_2709 ) ( CLEAR ?auto_2702 ) ( TRUCK-AT ?auto_2706 ?auto_2705 ) ( not ( = ?auto_2702 ?auto_2703 ) ) ( not ( = ?auto_2702 ?auto_2709 ) ) ( not ( = ?auto_2703 ?auto_2709 ) ) ( not ( = ?auto_2704 ?auto_2708 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2706 ?auto_2705 ?auto_2707 )
      ( !LIFT ?auto_2708 ?auto_2702 ?auto_2709 ?auto_2707 )
      ( !LOAD ?auto_2708 ?auto_2702 ?auto_2706 ?auto_2707 )
      ( !DRIVE ?auto_2706 ?auto_2707 ?auto_2705 )
      ( !UNLOAD ?auto_2704 ?auto_2702 ?auto_2706 ?auto_2705 )
      ( !DROP ?auto_2704 ?auto_2702 ?auto_2703 ?auto_2705 )
      ( MAKE-ON-VERIFY ?auto_2702 ?auto_2703 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2712 - SURFACE
      ?auto_2713 - SURFACE
    )
    :vars
    (
      ?auto_2714 - HOIST
      ?auto_2715 - PLACE
      ?auto_2717 - PLACE
      ?auto_2718 - HOIST
      ?auto_2719 - SURFACE
      ?auto_2716 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2714 ?auto_2715 ) ( SURFACE-AT ?auto_2713 ?auto_2715 ) ( CLEAR ?auto_2713 ) ( IS-CRATE ?auto_2712 ) ( AVAILABLE ?auto_2714 ) ( not ( = ?auto_2717 ?auto_2715 ) ) ( HOIST-AT ?auto_2718 ?auto_2717 ) ( AVAILABLE ?auto_2718 ) ( SURFACE-AT ?auto_2712 ?auto_2717 ) ( ON ?auto_2712 ?auto_2719 ) ( CLEAR ?auto_2712 ) ( TRUCK-AT ?auto_2716 ?auto_2715 ) ( not ( = ?auto_2712 ?auto_2713 ) ) ( not ( = ?auto_2712 ?auto_2719 ) ) ( not ( = ?auto_2713 ?auto_2719 ) ) ( not ( = ?auto_2714 ?auto_2718 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2716 ?auto_2715 ?auto_2717 )
      ( !LIFT ?auto_2718 ?auto_2712 ?auto_2719 ?auto_2717 )
      ( !LOAD ?auto_2718 ?auto_2712 ?auto_2716 ?auto_2717 )
      ( !DRIVE ?auto_2716 ?auto_2717 ?auto_2715 )
      ( !UNLOAD ?auto_2714 ?auto_2712 ?auto_2716 ?auto_2715 )
      ( !DROP ?auto_2714 ?auto_2712 ?auto_2713 ?auto_2715 )
      ( MAKE-ON-VERIFY ?auto_2712 ?auto_2713 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2722 - SURFACE
      ?auto_2723 - SURFACE
    )
    :vars
    (
      ?auto_2724 - HOIST
      ?auto_2725 - PLACE
      ?auto_2727 - PLACE
      ?auto_2728 - HOIST
      ?auto_2729 - SURFACE
      ?auto_2726 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2724 ?auto_2725 ) ( SURFACE-AT ?auto_2723 ?auto_2725 ) ( CLEAR ?auto_2723 ) ( IS-CRATE ?auto_2722 ) ( AVAILABLE ?auto_2724 ) ( not ( = ?auto_2727 ?auto_2725 ) ) ( HOIST-AT ?auto_2728 ?auto_2727 ) ( AVAILABLE ?auto_2728 ) ( SURFACE-AT ?auto_2722 ?auto_2727 ) ( ON ?auto_2722 ?auto_2729 ) ( CLEAR ?auto_2722 ) ( TRUCK-AT ?auto_2726 ?auto_2725 ) ( not ( = ?auto_2722 ?auto_2723 ) ) ( not ( = ?auto_2722 ?auto_2729 ) ) ( not ( = ?auto_2723 ?auto_2729 ) ) ( not ( = ?auto_2724 ?auto_2728 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2726 ?auto_2725 ?auto_2727 )
      ( !LIFT ?auto_2728 ?auto_2722 ?auto_2729 ?auto_2727 )
      ( !LOAD ?auto_2728 ?auto_2722 ?auto_2726 ?auto_2727 )
      ( !DRIVE ?auto_2726 ?auto_2727 ?auto_2725 )
      ( !UNLOAD ?auto_2724 ?auto_2722 ?auto_2726 ?auto_2725 )
      ( !DROP ?auto_2724 ?auto_2722 ?auto_2723 ?auto_2725 )
      ( MAKE-ON-VERIFY ?auto_2722 ?auto_2723 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2732 - SURFACE
      ?auto_2733 - SURFACE
    )
    :vars
    (
      ?auto_2734 - HOIST
      ?auto_2735 - PLACE
      ?auto_2737 - PLACE
      ?auto_2738 - HOIST
      ?auto_2739 - SURFACE
      ?auto_2736 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2734 ?auto_2735 ) ( SURFACE-AT ?auto_2733 ?auto_2735 ) ( CLEAR ?auto_2733 ) ( IS-CRATE ?auto_2732 ) ( AVAILABLE ?auto_2734 ) ( not ( = ?auto_2737 ?auto_2735 ) ) ( HOIST-AT ?auto_2738 ?auto_2737 ) ( AVAILABLE ?auto_2738 ) ( SURFACE-AT ?auto_2732 ?auto_2737 ) ( ON ?auto_2732 ?auto_2739 ) ( CLEAR ?auto_2732 ) ( TRUCK-AT ?auto_2736 ?auto_2735 ) ( not ( = ?auto_2732 ?auto_2733 ) ) ( not ( = ?auto_2732 ?auto_2739 ) ) ( not ( = ?auto_2733 ?auto_2739 ) ) ( not ( = ?auto_2734 ?auto_2738 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2736 ?auto_2735 ?auto_2737 )
      ( !LIFT ?auto_2738 ?auto_2732 ?auto_2739 ?auto_2737 )
      ( !LOAD ?auto_2738 ?auto_2732 ?auto_2736 ?auto_2737 )
      ( !DRIVE ?auto_2736 ?auto_2737 ?auto_2735 )
      ( !UNLOAD ?auto_2734 ?auto_2732 ?auto_2736 ?auto_2735 )
      ( !DROP ?auto_2734 ?auto_2732 ?auto_2733 ?auto_2735 )
      ( MAKE-ON-VERIFY ?auto_2732 ?auto_2733 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2742 - SURFACE
      ?auto_2743 - SURFACE
    )
    :vars
    (
      ?auto_2744 - HOIST
      ?auto_2745 - PLACE
      ?auto_2747 - PLACE
      ?auto_2748 - HOIST
      ?auto_2749 - SURFACE
      ?auto_2746 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2744 ?auto_2745 ) ( SURFACE-AT ?auto_2743 ?auto_2745 ) ( CLEAR ?auto_2743 ) ( IS-CRATE ?auto_2742 ) ( AVAILABLE ?auto_2744 ) ( not ( = ?auto_2747 ?auto_2745 ) ) ( HOIST-AT ?auto_2748 ?auto_2747 ) ( AVAILABLE ?auto_2748 ) ( SURFACE-AT ?auto_2742 ?auto_2747 ) ( ON ?auto_2742 ?auto_2749 ) ( CLEAR ?auto_2742 ) ( TRUCK-AT ?auto_2746 ?auto_2745 ) ( not ( = ?auto_2742 ?auto_2743 ) ) ( not ( = ?auto_2742 ?auto_2749 ) ) ( not ( = ?auto_2743 ?auto_2749 ) ) ( not ( = ?auto_2744 ?auto_2748 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2746 ?auto_2745 ?auto_2747 )
      ( !LIFT ?auto_2748 ?auto_2742 ?auto_2749 ?auto_2747 )
      ( !LOAD ?auto_2748 ?auto_2742 ?auto_2746 ?auto_2747 )
      ( !DRIVE ?auto_2746 ?auto_2747 ?auto_2745 )
      ( !UNLOAD ?auto_2744 ?auto_2742 ?auto_2746 ?auto_2745 )
      ( !DROP ?auto_2744 ?auto_2742 ?auto_2743 ?auto_2745 )
      ( MAKE-ON-VERIFY ?auto_2742 ?auto_2743 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2752 - SURFACE
      ?auto_2753 - SURFACE
    )
    :vars
    (
      ?auto_2754 - HOIST
      ?auto_2755 - PLACE
      ?auto_2757 - PLACE
      ?auto_2758 - HOIST
      ?auto_2759 - SURFACE
      ?auto_2756 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2754 ?auto_2755 ) ( SURFACE-AT ?auto_2753 ?auto_2755 ) ( CLEAR ?auto_2753 ) ( IS-CRATE ?auto_2752 ) ( AVAILABLE ?auto_2754 ) ( not ( = ?auto_2757 ?auto_2755 ) ) ( HOIST-AT ?auto_2758 ?auto_2757 ) ( AVAILABLE ?auto_2758 ) ( SURFACE-AT ?auto_2752 ?auto_2757 ) ( ON ?auto_2752 ?auto_2759 ) ( CLEAR ?auto_2752 ) ( TRUCK-AT ?auto_2756 ?auto_2755 ) ( not ( = ?auto_2752 ?auto_2753 ) ) ( not ( = ?auto_2752 ?auto_2759 ) ) ( not ( = ?auto_2753 ?auto_2759 ) ) ( not ( = ?auto_2754 ?auto_2758 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2756 ?auto_2755 ?auto_2757 )
      ( !LIFT ?auto_2758 ?auto_2752 ?auto_2759 ?auto_2757 )
      ( !LOAD ?auto_2758 ?auto_2752 ?auto_2756 ?auto_2757 )
      ( !DRIVE ?auto_2756 ?auto_2757 ?auto_2755 )
      ( !UNLOAD ?auto_2754 ?auto_2752 ?auto_2756 ?auto_2755 )
      ( !DROP ?auto_2754 ?auto_2752 ?auto_2753 ?auto_2755 )
      ( MAKE-ON-VERIFY ?auto_2752 ?auto_2753 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2762 - SURFACE
      ?auto_2763 - SURFACE
    )
    :vars
    (
      ?auto_2764 - HOIST
      ?auto_2765 - PLACE
      ?auto_2767 - PLACE
      ?auto_2768 - HOIST
      ?auto_2769 - SURFACE
      ?auto_2766 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2764 ?auto_2765 ) ( SURFACE-AT ?auto_2763 ?auto_2765 ) ( CLEAR ?auto_2763 ) ( IS-CRATE ?auto_2762 ) ( AVAILABLE ?auto_2764 ) ( not ( = ?auto_2767 ?auto_2765 ) ) ( HOIST-AT ?auto_2768 ?auto_2767 ) ( AVAILABLE ?auto_2768 ) ( SURFACE-AT ?auto_2762 ?auto_2767 ) ( ON ?auto_2762 ?auto_2769 ) ( CLEAR ?auto_2762 ) ( TRUCK-AT ?auto_2766 ?auto_2765 ) ( not ( = ?auto_2762 ?auto_2763 ) ) ( not ( = ?auto_2762 ?auto_2769 ) ) ( not ( = ?auto_2763 ?auto_2769 ) ) ( not ( = ?auto_2764 ?auto_2768 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2766 ?auto_2765 ?auto_2767 )
      ( !LIFT ?auto_2768 ?auto_2762 ?auto_2769 ?auto_2767 )
      ( !LOAD ?auto_2768 ?auto_2762 ?auto_2766 ?auto_2767 )
      ( !DRIVE ?auto_2766 ?auto_2767 ?auto_2765 )
      ( !UNLOAD ?auto_2764 ?auto_2762 ?auto_2766 ?auto_2765 )
      ( !DROP ?auto_2764 ?auto_2762 ?auto_2763 ?auto_2765 )
      ( MAKE-ON-VERIFY ?auto_2762 ?auto_2763 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2772 - SURFACE
      ?auto_2773 - SURFACE
    )
    :vars
    (
      ?auto_2774 - HOIST
      ?auto_2775 - PLACE
      ?auto_2777 - PLACE
      ?auto_2778 - HOIST
      ?auto_2779 - SURFACE
      ?auto_2776 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2774 ?auto_2775 ) ( SURFACE-AT ?auto_2773 ?auto_2775 ) ( CLEAR ?auto_2773 ) ( IS-CRATE ?auto_2772 ) ( AVAILABLE ?auto_2774 ) ( not ( = ?auto_2777 ?auto_2775 ) ) ( HOIST-AT ?auto_2778 ?auto_2777 ) ( AVAILABLE ?auto_2778 ) ( SURFACE-AT ?auto_2772 ?auto_2777 ) ( ON ?auto_2772 ?auto_2779 ) ( CLEAR ?auto_2772 ) ( TRUCK-AT ?auto_2776 ?auto_2775 ) ( not ( = ?auto_2772 ?auto_2773 ) ) ( not ( = ?auto_2772 ?auto_2779 ) ) ( not ( = ?auto_2773 ?auto_2779 ) ) ( not ( = ?auto_2774 ?auto_2778 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2776 ?auto_2775 ?auto_2777 )
      ( !LIFT ?auto_2778 ?auto_2772 ?auto_2779 ?auto_2777 )
      ( !LOAD ?auto_2778 ?auto_2772 ?auto_2776 ?auto_2777 )
      ( !DRIVE ?auto_2776 ?auto_2777 ?auto_2775 )
      ( !UNLOAD ?auto_2774 ?auto_2772 ?auto_2776 ?auto_2775 )
      ( !DROP ?auto_2774 ?auto_2772 ?auto_2773 ?auto_2775 )
      ( MAKE-ON-VERIFY ?auto_2772 ?auto_2773 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2782 - SURFACE
      ?auto_2783 - SURFACE
    )
    :vars
    (
      ?auto_2784 - HOIST
      ?auto_2785 - PLACE
      ?auto_2787 - PLACE
      ?auto_2788 - HOIST
      ?auto_2789 - SURFACE
      ?auto_2786 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2784 ?auto_2785 ) ( SURFACE-AT ?auto_2783 ?auto_2785 ) ( CLEAR ?auto_2783 ) ( IS-CRATE ?auto_2782 ) ( AVAILABLE ?auto_2784 ) ( not ( = ?auto_2787 ?auto_2785 ) ) ( HOIST-AT ?auto_2788 ?auto_2787 ) ( AVAILABLE ?auto_2788 ) ( SURFACE-AT ?auto_2782 ?auto_2787 ) ( ON ?auto_2782 ?auto_2789 ) ( CLEAR ?auto_2782 ) ( TRUCK-AT ?auto_2786 ?auto_2785 ) ( not ( = ?auto_2782 ?auto_2783 ) ) ( not ( = ?auto_2782 ?auto_2789 ) ) ( not ( = ?auto_2783 ?auto_2789 ) ) ( not ( = ?auto_2784 ?auto_2788 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2786 ?auto_2785 ?auto_2787 )
      ( !LIFT ?auto_2788 ?auto_2782 ?auto_2789 ?auto_2787 )
      ( !LOAD ?auto_2788 ?auto_2782 ?auto_2786 ?auto_2787 )
      ( !DRIVE ?auto_2786 ?auto_2787 ?auto_2785 )
      ( !UNLOAD ?auto_2784 ?auto_2782 ?auto_2786 ?auto_2785 )
      ( !DROP ?auto_2784 ?auto_2782 ?auto_2783 ?auto_2785 )
      ( MAKE-ON-VERIFY ?auto_2782 ?auto_2783 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2792 - SURFACE
      ?auto_2793 - SURFACE
    )
    :vars
    (
      ?auto_2794 - HOIST
      ?auto_2795 - PLACE
      ?auto_2797 - PLACE
      ?auto_2798 - HOIST
      ?auto_2799 - SURFACE
      ?auto_2796 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2794 ?auto_2795 ) ( SURFACE-AT ?auto_2793 ?auto_2795 ) ( CLEAR ?auto_2793 ) ( IS-CRATE ?auto_2792 ) ( AVAILABLE ?auto_2794 ) ( not ( = ?auto_2797 ?auto_2795 ) ) ( HOIST-AT ?auto_2798 ?auto_2797 ) ( AVAILABLE ?auto_2798 ) ( SURFACE-AT ?auto_2792 ?auto_2797 ) ( ON ?auto_2792 ?auto_2799 ) ( CLEAR ?auto_2792 ) ( TRUCK-AT ?auto_2796 ?auto_2795 ) ( not ( = ?auto_2792 ?auto_2793 ) ) ( not ( = ?auto_2792 ?auto_2799 ) ) ( not ( = ?auto_2793 ?auto_2799 ) ) ( not ( = ?auto_2794 ?auto_2798 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2796 ?auto_2795 ?auto_2797 )
      ( !LIFT ?auto_2798 ?auto_2792 ?auto_2799 ?auto_2797 )
      ( !LOAD ?auto_2798 ?auto_2792 ?auto_2796 ?auto_2797 )
      ( !DRIVE ?auto_2796 ?auto_2797 ?auto_2795 )
      ( !UNLOAD ?auto_2794 ?auto_2792 ?auto_2796 ?auto_2795 )
      ( !DROP ?auto_2794 ?auto_2792 ?auto_2793 ?auto_2795 )
      ( MAKE-ON-VERIFY ?auto_2792 ?auto_2793 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2802 - SURFACE
      ?auto_2803 - SURFACE
    )
    :vars
    (
      ?auto_2804 - HOIST
      ?auto_2805 - PLACE
      ?auto_2807 - PLACE
      ?auto_2808 - HOIST
      ?auto_2809 - SURFACE
      ?auto_2806 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2804 ?auto_2805 ) ( SURFACE-AT ?auto_2803 ?auto_2805 ) ( CLEAR ?auto_2803 ) ( IS-CRATE ?auto_2802 ) ( AVAILABLE ?auto_2804 ) ( not ( = ?auto_2807 ?auto_2805 ) ) ( HOIST-AT ?auto_2808 ?auto_2807 ) ( AVAILABLE ?auto_2808 ) ( SURFACE-AT ?auto_2802 ?auto_2807 ) ( ON ?auto_2802 ?auto_2809 ) ( CLEAR ?auto_2802 ) ( TRUCK-AT ?auto_2806 ?auto_2805 ) ( not ( = ?auto_2802 ?auto_2803 ) ) ( not ( = ?auto_2802 ?auto_2809 ) ) ( not ( = ?auto_2803 ?auto_2809 ) ) ( not ( = ?auto_2804 ?auto_2808 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2806 ?auto_2805 ?auto_2807 )
      ( !LIFT ?auto_2808 ?auto_2802 ?auto_2809 ?auto_2807 )
      ( !LOAD ?auto_2808 ?auto_2802 ?auto_2806 ?auto_2807 )
      ( !DRIVE ?auto_2806 ?auto_2807 ?auto_2805 )
      ( !UNLOAD ?auto_2804 ?auto_2802 ?auto_2806 ?auto_2805 )
      ( !DROP ?auto_2804 ?auto_2802 ?auto_2803 ?auto_2805 )
      ( MAKE-ON-VERIFY ?auto_2802 ?auto_2803 ) )
  )

)

