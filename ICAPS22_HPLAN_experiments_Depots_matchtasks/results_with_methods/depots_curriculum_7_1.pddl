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

  ( :method MAKE-1CRATE
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
    ( and ( HOIST-AT ?auto_2734 ?auto_2735 ) ( SURFACE-AT ?auto_2732 ?auto_2735 ) ( CLEAR ?auto_2732 ) ( IS-CRATE ?auto_2733 ) ( AVAILABLE ?auto_2734 ) ( not ( = ?auto_2737 ?auto_2735 ) ) ( HOIST-AT ?auto_2738 ?auto_2737 ) ( AVAILABLE ?auto_2738 ) ( SURFACE-AT ?auto_2733 ?auto_2737 ) ( ON ?auto_2733 ?auto_2739 ) ( CLEAR ?auto_2733 ) ( TRUCK-AT ?auto_2736 ?auto_2735 ) ( not ( = ?auto_2732 ?auto_2733 ) ) ( not ( = ?auto_2732 ?auto_2739 ) ) ( not ( = ?auto_2733 ?auto_2739 ) ) ( not ( = ?auto_2734 ?auto_2738 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2736 ?auto_2735 ?auto_2737 )
      ( !LIFT ?auto_2738 ?auto_2733 ?auto_2739 ?auto_2737 )
      ( !LOAD ?auto_2738 ?auto_2733 ?auto_2736 ?auto_2737 )
      ( !DRIVE ?auto_2736 ?auto_2737 ?auto_2735 )
      ( !UNLOAD ?auto_2734 ?auto_2733 ?auto_2736 ?auto_2735 )
      ( !DROP ?auto_2734 ?auto_2733 ?auto_2732 ?auto_2735 )
      ( MAKE-1CRATE-VERIFY ?auto_2732 ?auto_2733 ) )
  )

  ( :method MAKE-1CRATE
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
    ( and ( HOIST-AT ?auto_2744 ?auto_2745 ) ( SURFACE-AT ?auto_2742 ?auto_2745 ) ( CLEAR ?auto_2742 ) ( IS-CRATE ?auto_2743 ) ( AVAILABLE ?auto_2744 ) ( not ( = ?auto_2747 ?auto_2745 ) ) ( HOIST-AT ?auto_2748 ?auto_2747 ) ( AVAILABLE ?auto_2748 ) ( SURFACE-AT ?auto_2743 ?auto_2747 ) ( ON ?auto_2743 ?auto_2749 ) ( CLEAR ?auto_2743 ) ( TRUCK-AT ?auto_2746 ?auto_2745 ) ( not ( = ?auto_2742 ?auto_2743 ) ) ( not ( = ?auto_2742 ?auto_2749 ) ) ( not ( = ?auto_2743 ?auto_2749 ) ) ( not ( = ?auto_2744 ?auto_2748 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2746 ?auto_2745 ?auto_2747 )
      ( !LIFT ?auto_2748 ?auto_2743 ?auto_2749 ?auto_2747 )
      ( !LOAD ?auto_2748 ?auto_2743 ?auto_2746 ?auto_2747 )
      ( !DRIVE ?auto_2746 ?auto_2747 ?auto_2745 )
      ( !UNLOAD ?auto_2744 ?auto_2743 ?auto_2746 ?auto_2745 )
      ( !DROP ?auto_2744 ?auto_2743 ?auto_2742 ?auto_2745 )
      ( MAKE-1CRATE-VERIFY ?auto_2742 ?auto_2743 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2753 - SURFACE
      ?auto_2754 - SURFACE
      ?auto_2755 - SURFACE
    )
    :vars
    (
      ?auto_2758 - HOIST
      ?auto_2760 - PLACE
      ?auto_2757 - PLACE
      ?auto_2756 - HOIST
      ?auto_2759 - SURFACE
      ?auto_2762 - SURFACE
      ?auto_2761 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2758 ?auto_2760 ) ( IS-CRATE ?auto_2755 ) ( not ( = ?auto_2757 ?auto_2760 ) ) ( HOIST-AT ?auto_2756 ?auto_2757 ) ( SURFACE-AT ?auto_2755 ?auto_2757 ) ( ON ?auto_2755 ?auto_2759 ) ( CLEAR ?auto_2755 ) ( not ( = ?auto_2754 ?auto_2755 ) ) ( not ( = ?auto_2754 ?auto_2759 ) ) ( not ( = ?auto_2755 ?auto_2759 ) ) ( not ( = ?auto_2758 ?auto_2756 ) ) ( SURFACE-AT ?auto_2753 ?auto_2760 ) ( CLEAR ?auto_2753 ) ( IS-CRATE ?auto_2754 ) ( AVAILABLE ?auto_2758 ) ( AVAILABLE ?auto_2756 ) ( SURFACE-AT ?auto_2754 ?auto_2757 ) ( ON ?auto_2754 ?auto_2762 ) ( CLEAR ?auto_2754 ) ( TRUCK-AT ?auto_2761 ?auto_2760 ) ( not ( = ?auto_2753 ?auto_2754 ) ) ( not ( = ?auto_2753 ?auto_2762 ) ) ( not ( = ?auto_2754 ?auto_2762 ) ) ( not ( = ?auto_2753 ?auto_2755 ) ) ( not ( = ?auto_2753 ?auto_2759 ) ) ( not ( = ?auto_2755 ?auto_2762 ) ) ( not ( = ?auto_2759 ?auto_2762 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2753 ?auto_2754 )
      ( MAKE-1CRATE ?auto_2754 ?auto_2755 )
      ( MAKE-2CRATE-VERIFY ?auto_2753 ?auto_2754 ?auto_2755 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2765 - SURFACE
      ?auto_2766 - SURFACE
    )
    :vars
    (
      ?auto_2767 - HOIST
      ?auto_2768 - PLACE
      ?auto_2770 - PLACE
      ?auto_2771 - HOIST
      ?auto_2772 - SURFACE
      ?auto_2769 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2767 ?auto_2768 ) ( SURFACE-AT ?auto_2765 ?auto_2768 ) ( CLEAR ?auto_2765 ) ( IS-CRATE ?auto_2766 ) ( AVAILABLE ?auto_2767 ) ( not ( = ?auto_2770 ?auto_2768 ) ) ( HOIST-AT ?auto_2771 ?auto_2770 ) ( AVAILABLE ?auto_2771 ) ( SURFACE-AT ?auto_2766 ?auto_2770 ) ( ON ?auto_2766 ?auto_2772 ) ( CLEAR ?auto_2766 ) ( TRUCK-AT ?auto_2769 ?auto_2768 ) ( not ( = ?auto_2765 ?auto_2766 ) ) ( not ( = ?auto_2765 ?auto_2772 ) ) ( not ( = ?auto_2766 ?auto_2772 ) ) ( not ( = ?auto_2767 ?auto_2771 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2769 ?auto_2768 ?auto_2770 )
      ( !LIFT ?auto_2771 ?auto_2766 ?auto_2772 ?auto_2770 )
      ( !LOAD ?auto_2771 ?auto_2766 ?auto_2769 ?auto_2770 )
      ( !DRIVE ?auto_2769 ?auto_2770 ?auto_2768 )
      ( !UNLOAD ?auto_2767 ?auto_2766 ?auto_2769 ?auto_2768 )
      ( !DROP ?auto_2767 ?auto_2766 ?auto_2765 ?auto_2768 )
      ( MAKE-1CRATE-VERIFY ?auto_2765 ?auto_2766 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2777 - SURFACE
      ?auto_2778 - SURFACE
      ?auto_2779 - SURFACE
      ?auto_2780 - SURFACE
    )
    :vars
    (
      ?auto_2784 - HOIST
      ?auto_2781 - PLACE
      ?auto_2782 - PLACE
      ?auto_2786 - HOIST
      ?auto_2783 - SURFACE
      ?auto_2787 - PLACE
      ?auto_2790 - HOIST
      ?auto_2789 - SURFACE
      ?auto_2788 - SURFACE
      ?auto_2785 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2784 ?auto_2781 ) ( IS-CRATE ?auto_2780 ) ( not ( = ?auto_2782 ?auto_2781 ) ) ( HOIST-AT ?auto_2786 ?auto_2782 ) ( AVAILABLE ?auto_2786 ) ( SURFACE-AT ?auto_2780 ?auto_2782 ) ( ON ?auto_2780 ?auto_2783 ) ( CLEAR ?auto_2780 ) ( not ( = ?auto_2779 ?auto_2780 ) ) ( not ( = ?auto_2779 ?auto_2783 ) ) ( not ( = ?auto_2780 ?auto_2783 ) ) ( not ( = ?auto_2784 ?auto_2786 ) ) ( IS-CRATE ?auto_2779 ) ( not ( = ?auto_2787 ?auto_2781 ) ) ( HOIST-AT ?auto_2790 ?auto_2787 ) ( SURFACE-AT ?auto_2779 ?auto_2787 ) ( ON ?auto_2779 ?auto_2789 ) ( CLEAR ?auto_2779 ) ( not ( = ?auto_2778 ?auto_2779 ) ) ( not ( = ?auto_2778 ?auto_2789 ) ) ( not ( = ?auto_2779 ?auto_2789 ) ) ( not ( = ?auto_2784 ?auto_2790 ) ) ( SURFACE-AT ?auto_2777 ?auto_2781 ) ( CLEAR ?auto_2777 ) ( IS-CRATE ?auto_2778 ) ( AVAILABLE ?auto_2784 ) ( AVAILABLE ?auto_2790 ) ( SURFACE-AT ?auto_2778 ?auto_2787 ) ( ON ?auto_2778 ?auto_2788 ) ( CLEAR ?auto_2778 ) ( TRUCK-AT ?auto_2785 ?auto_2781 ) ( not ( = ?auto_2777 ?auto_2778 ) ) ( not ( = ?auto_2777 ?auto_2788 ) ) ( not ( = ?auto_2778 ?auto_2788 ) ) ( not ( = ?auto_2777 ?auto_2779 ) ) ( not ( = ?auto_2777 ?auto_2789 ) ) ( not ( = ?auto_2779 ?auto_2788 ) ) ( not ( = ?auto_2789 ?auto_2788 ) ) ( not ( = ?auto_2777 ?auto_2780 ) ) ( not ( = ?auto_2777 ?auto_2783 ) ) ( not ( = ?auto_2778 ?auto_2780 ) ) ( not ( = ?auto_2778 ?auto_2783 ) ) ( not ( = ?auto_2780 ?auto_2789 ) ) ( not ( = ?auto_2780 ?auto_2788 ) ) ( not ( = ?auto_2782 ?auto_2787 ) ) ( not ( = ?auto_2786 ?auto_2790 ) ) ( not ( = ?auto_2783 ?auto_2789 ) ) ( not ( = ?auto_2783 ?auto_2788 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2777 ?auto_2778 ?auto_2779 )
      ( MAKE-1CRATE ?auto_2779 ?auto_2780 )
      ( MAKE-3CRATE-VERIFY ?auto_2777 ?auto_2778 ?auto_2779 ?auto_2780 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2793 - SURFACE
      ?auto_2794 - SURFACE
    )
    :vars
    (
      ?auto_2795 - HOIST
      ?auto_2796 - PLACE
      ?auto_2798 - PLACE
      ?auto_2799 - HOIST
      ?auto_2800 - SURFACE
      ?auto_2797 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2795 ?auto_2796 ) ( SURFACE-AT ?auto_2793 ?auto_2796 ) ( CLEAR ?auto_2793 ) ( IS-CRATE ?auto_2794 ) ( AVAILABLE ?auto_2795 ) ( not ( = ?auto_2798 ?auto_2796 ) ) ( HOIST-AT ?auto_2799 ?auto_2798 ) ( AVAILABLE ?auto_2799 ) ( SURFACE-AT ?auto_2794 ?auto_2798 ) ( ON ?auto_2794 ?auto_2800 ) ( CLEAR ?auto_2794 ) ( TRUCK-AT ?auto_2797 ?auto_2796 ) ( not ( = ?auto_2793 ?auto_2794 ) ) ( not ( = ?auto_2793 ?auto_2800 ) ) ( not ( = ?auto_2794 ?auto_2800 ) ) ( not ( = ?auto_2795 ?auto_2799 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2797 ?auto_2796 ?auto_2798 )
      ( !LIFT ?auto_2799 ?auto_2794 ?auto_2800 ?auto_2798 )
      ( !LOAD ?auto_2799 ?auto_2794 ?auto_2797 ?auto_2798 )
      ( !DRIVE ?auto_2797 ?auto_2798 ?auto_2796 )
      ( !UNLOAD ?auto_2795 ?auto_2794 ?auto_2797 ?auto_2796 )
      ( !DROP ?auto_2795 ?auto_2794 ?auto_2793 ?auto_2796 )
      ( MAKE-1CRATE-VERIFY ?auto_2793 ?auto_2794 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2806 - SURFACE
      ?auto_2807 - SURFACE
      ?auto_2808 - SURFACE
      ?auto_2809 - SURFACE
      ?auto_2810 - SURFACE
    )
    :vars
    (
      ?auto_2814 - HOIST
      ?auto_2815 - PLACE
      ?auto_2813 - PLACE
      ?auto_2812 - HOIST
      ?auto_2816 - SURFACE
      ?auto_2821 - PLACE
      ?auto_2818 - HOIST
      ?auto_2817 - SURFACE
      ?auto_2822 - PLACE
      ?auto_2819 - HOIST
      ?auto_2820 - SURFACE
      ?auto_2823 - SURFACE
      ?auto_2811 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2814 ?auto_2815 ) ( IS-CRATE ?auto_2810 ) ( not ( = ?auto_2813 ?auto_2815 ) ) ( HOIST-AT ?auto_2812 ?auto_2813 ) ( AVAILABLE ?auto_2812 ) ( SURFACE-AT ?auto_2810 ?auto_2813 ) ( ON ?auto_2810 ?auto_2816 ) ( CLEAR ?auto_2810 ) ( not ( = ?auto_2809 ?auto_2810 ) ) ( not ( = ?auto_2809 ?auto_2816 ) ) ( not ( = ?auto_2810 ?auto_2816 ) ) ( not ( = ?auto_2814 ?auto_2812 ) ) ( IS-CRATE ?auto_2809 ) ( not ( = ?auto_2821 ?auto_2815 ) ) ( HOIST-AT ?auto_2818 ?auto_2821 ) ( AVAILABLE ?auto_2818 ) ( SURFACE-AT ?auto_2809 ?auto_2821 ) ( ON ?auto_2809 ?auto_2817 ) ( CLEAR ?auto_2809 ) ( not ( = ?auto_2808 ?auto_2809 ) ) ( not ( = ?auto_2808 ?auto_2817 ) ) ( not ( = ?auto_2809 ?auto_2817 ) ) ( not ( = ?auto_2814 ?auto_2818 ) ) ( IS-CRATE ?auto_2808 ) ( not ( = ?auto_2822 ?auto_2815 ) ) ( HOIST-AT ?auto_2819 ?auto_2822 ) ( SURFACE-AT ?auto_2808 ?auto_2822 ) ( ON ?auto_2808 ?auto_2820 ) ( CLEAR ?auto_2808 ) ( not ( = ?auto_2807 ?auto_2808 ) ) ( not ( = ?auto_2807 ?auto_2820 ) ) ( not ( = ?auto_2808 ?auto_2820 ) ) ( not ( = ?auto_2814 ?auto_2819 ) ) ( SURFACE-AT ?auto_2806 ?auto_2815 ) ( CLEAR ?auto_2806 ) ( IS-CRATE ?auto_2807 ) ( AVAILABLE ?auto_2814 ) ( AVAILABLE ?auto_2819 ) ( SURFACE-AT ?auto_2807 ?auto_2822 ) ( ON ?auto_2807 ?auto_2823 ) ( CLEAR ?auto_2807 ) ( TRUCK-AT ?auto_2811 ?auto_2815 ) ( not ( = ?auto_2806 ?auto_2807 ) ) ( not ( = ?auto_2806 ?auto_2823 ) ) ( not ( = ?auto_2807 ?auto_2823 ) ) ( not ( = ?auto_2806 ?auto_2808 ) ) ( not ( = ?auto_2806 ?auto_2820 ) ) ( not ( = ?auto_2808 ?auto_2823 ) ) ( not ( = ?auto_2820 ?auto_2823 ) ) ( not ( = ?auto_2806 ?auto_2809 ) ) ( not ( = ?auto_2806 ?auto_2817 ) ) ( not ( = ?auto_2807 ?auto_2809 ) ) ( not ( = ?auto_2807 ?auto_2817 ) ) ( not ( = ?auto_2809 ?auto_2820 ) ) ( not ( = ?auto_2809 ?auto_2823 ) ) ( not ( = ?auto_2821 ?auto_2822 ) ) ( not ( = ?auto_2818 ?auto_2819 ) ) ( not ( = ?auto_2817 ?auto_2820 ) ) ( not ( = ?auto_2817 ?auto_2823 ) ) ( not ( = ?auto_2806 ?auto_2810 ) ) ( not ( = ?auto_2806 ?auto_2816 ) ) ( not ( = ?auto_2807 ?auto_2810 ) ) ( not ( = ?auto_2807 ?auto_2816 ) ) ( not ( = ?auto_2808 ?auto_2810 ) ) ( not ( = ?auto_2808 ?auto_2816 ) ) ( not ( = ?auto_2810 ?auto_2817 ) ) ( not ( = ?auto_2810 ?auto_2820 ) ) ( not ( = ?auto_2810 ?auto_2823 ) ) ( not ( = ?auto_2813 ?auto_2821 ) ) ( not ( = ?auto_2813 ?auto_2822 ) ) ( not ( = ?auto_2812 ?auto_2818 ) ) ( not ( = ?auto_2812 ?auto_2819 ) ) ( not ( = ?auto_2816 ?auto_2817 ) ) ( not ( = ?auto_2816 ?auto_2820 ) ) ( not ( = ?auto_2816 ?auto_2823 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_2806 ?auto_2807 ?auto_2808 ?auto_2809 )
      ( MAKE-1CRATE ?auto_2809 ?auto_2810 )
      ( MAKE-4CRATE-VERIFY ?auto_2806 ?auto_2807 ?auto_2808 ?auto_2809 ?auto_2810 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2826 - SURFACE
      ?auto_2827 - SURFACE
    )
    :vars
    (
      ?auto_2828 - HOIST
      ?auto_2829 - PLACE
      ?auto_2831 - PLACE
      ?auto_2832 - HOIST
      ?auto_2833 - SURFACE
      ?auto_2830 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2828 ?auto_2829 ) ( SURFACE-AT ?auto_2826 ?auto_2829 ) ( CLEAR ?auto_2826 ) ( IS-CRATE ?auto_2827 ) ( AVAILABLE ?auto_2828 ) ( not ( = ?auto_2831 ?auto_2829 ) ) ( HOIST-AT ?auto_2832 ?auto_2831 ) ( AVAILABLE ?auto_2832 ) ( SURFACE-AT ?auto_2827 ?auto_2831 ) ( ON ?auto_2827 ?auto_2833 ) ( CLEAR ?auto_2827 ) ( TRUCK-AT ?auto_2830 ?auto_2829 ) ( not ( = ?auto_2826 ?auto_2827 ) ) ( not ( = ?auto_2826 ?auto_2833 ) ) ( not ( = ?auto_2827 ?auto_2833 ) ) ( not ( = ?auto_2828 ?auto_2832 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2830 ?auto_2829 ?auto_2831 )
      ( !LIFT ?auto_2832 ?auto_2827 ?auto_2833 ?auto_2831 )
      ( !LOAD ?auto_2832 ?auto_2827 ?auto_2830 ?auto_2831 )
      ( !DRIVE ?auto_2830 ?auto_2831 ?auto_2829 )
      ( !UNLOAD ?auto_2828 ?auto_2827 ?auto_2830 ?auto_2829 )
      ( !DROP ?auto_2828 ?auto_2827 ?auto_2826 ?auto_2829 )
      ( MAKE-1CRATE-VERIFY ?auto_2826 ?auto_2827 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2840 - SURFACE
      ?auto_2841 - SURFACE
      ?auto_2842 - SURFACE
      ?auto_2843 - SURFACE
      ?auto_2844 - SURFACE
      ?auto_2845 - SURFACE
    )
    :vars
    (
      ?auto_2846 - HOIST
      ?auto_2849 - PLACE
      ?auto_2850 - PLACE
      ?auto_2848 - HOIST
      ?auto_2847 - SURFACE
      ?auto_2855 - PLACE
      ?auto_2856 - HOIST
      ?auto_2852 - SURFACE
      ?auto_2860 - PLACE
      ?auto_2858 - HOIST
      ?auto_2853 - SURFACE
      ?auto_2861 - PLACE
      ?auto_2854 - HOIST
      ?auto_2859 - SURFACE
      ?auto_2857 - SURFACE
      ?auto_2851 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2846 ?auto_2849 ) ( IS-CRATE ?auto_2845 ) ( not ( = ?auto_2850 ?auto_2849 ) ) ( HOIST-AT ?auto_2848 ?auto_2850 ) ( AVAILABLE ?auto_2848 ) ( SURFACE-AT ?auto_2845 ?auto_2850 ) ( ON ?auto_2845 ?auto_2847 ) ( CLEAR ?auto_2845 ) ( not ( = ?auto_2844 ?auto_2845 ) ) ( not ( = ?auto_2844 ?auto_2847 ) ) ( not ( = ?auto_2845 ?auto_2847 ) ) ( not ( = ?auto_2846 ?auto_2848 ) ) ( IS-CRATE ?auto_2844 ) ( not ( = ?auto_2855 ?auto_2849 ) ) ( HOIST-AT ?auto_2856 ?auto_2855 ) ( AVAILABLE ?auto_2856 ) ( SURFACE-AT ?auto_2844 ?auto_2855 ) ( ON ?auto_2844 ?auto_2852 ) ( CLEAR ?auto_2844 ) ( not ( = ?auto_2843 ?auto_2844 ) ) ( not ( = ?auto_2843 ?auto_2852 ) ) ( not ( = ?auto_2844 ?auto_2852 ) ) ( not ( = ?auto_2846 ?auto_2856 ) ) ( IS-CRATE ?auto_2843 ) ( not ( = ?auto_2860 ?auto_2849 ) ) ( HOIST-AT ?auto_2858 ?auto_2860 ) ( AVAILABLE ?auto_2858 ) ( SURFACE-AT ?auto_2843 ?auto_2860 ) ( ON ?auto_2843 ?auto_2853 ) ( CLEAR ?auto_2843 ) ( not ( = ?auto_2842 ?auto_2843 ) ) ( not ( = ?auto_2842 ?auto_2853 ) ) ( not ( = ?auto_2843 ?auto_2853 ) ) ( not ( = ?auto_2846 ?auto_2858 ) ) ( IS-CRATE ?auto_2842 ) ( not ( = ?auto_2861 ?auto_2849 ) ) ( HOIST-AT ?auto_2854 ?auto_2861 ) ( SURFACE-AT ?auto_2842 ?auto_2861 ) ( ON ?auto_2842 ?auto_2859 ) ( CLEAR ?auto_2842 ) ( not ( = ?auto_2841 ?auto_2842 ) ) ( not ( = ?auto_2841 ?auto_2859 ) ) ( not ( = ?auto_2842 ?auto_2859 ) ) ( not ( = ?auto_2846 ?auto_2854 ) ) ( SURFACE-AT ?auto_2840 ?auto_2849 ) ( CLEAR ?auto_2840 ) ( IS-CRATE ?auto_2841 ) ( AVAILABLE ?auto_2846 ) ( AVAILABLE ?auto_2854 ) ( SURFACE-AT ?auto_2841 ?auto_2861 ) ( ON ?auto_2841 ?auto_2857 ) ( CLEAR ?auto_2841 ) ( TRUCK-AT ?auto_2851 ?auto_2849 ) ( not ( = ?auto_2840 ?auto_2841 ) ) ( not ( = ?auto_2840 ?auto_2857 ) ) ( not ( = ?auto_2841 ?auto_2857 ) ) ( not ( = ?auto_2840 ?auto_2842 ) ) ( not ( = ?auto_2840 ?auto_2859 ) ) ( not ( = ?auto_2842 ?auto_2857 ) ) ( not ( = ?auto_2859 ?auto_2857 ) ) ( not ( = ?auto_2840 ?auto_2843 ) ) ( not ( = ?auto_2840 ?auto_2853 ) ) ( not ( = ?auto_2841 ?auto_2843 ) ) ( not ( = ?auto_2841 ?auto_2853 ) ) ( not ( = ?auto_2843 ?auto_2859 ) ) ( not ( = ?auto_2843 ?auto_2857 ) ) ( not ( = ?auto_2860 ?auto_2861 ) ) ( not ( = ?auto_2858 ?auto_2854 ) ) ( not ( = ?auto_2853 ?auto_2859 ) ) ( not ( = ?auto_2853 ?auto_2857 ) ) ( not ( = ?auto_2840 ?auto_2844 ) ) ( not ( = ?auto_2840 ?auto_2852 ) ) ( not ( = ?auto_2841 ?auto_2844 ) ) ( not ( = ?auto_2841 ?auto_2852 ) ) ( not ( = ?auto_2842 ?auto_2844 ) ) ( not ( = ?auto_2842 ?auto_2852 ) ) ( not ( = ?auto_2844 ?auto_2853 ) ) ( not ( = ?auto_2844 ?auto_2859 ) ) ( not ( = ?auto_2844 ?auto_2857 ) ) ( not ( = ?auto_2855 ?auto_2860 ) ) ( not ( = ?auto_2855 ?auto_2861 ) ) ( not ( = ?auto_2856 ?auto_2858 ) ) ( not ( = ?auto_2856 ?auto_2854 ) ) ( not ( = ?auto_2852 ?auto_2853 ) ) ( not ( = ?auto_2852 ?auto_2859 ) ) ( not ( = ?auto_2852 ?auto_2857 ) ) ( not ( = ?auto_2840 ?auto_2845 ) ) ( not ( = ?auto_2840 ?auto_2847 ) ) ( not ( = ?auto_2841 ?auto_2845 ) ) ( not ( = ?auto_2841 ?auto_2847 ) ) ( not ( = ?auto_2842 ?auto_2845 ) ) ( not ( = ?auto_2842 ?auto_2847 ) ) ( not ( = ?auto_2843 ?auto_2845 ) ) ( not ( = ?auto_2843 ?auto_2847 ) ) ( not ( = ?auto_2845 ?auto_2852 ) ) ( not ( = ?auto_2845 ?auto_2853 ) ) ( not ( = ?auto_2845 ?auto_2859 ) ) ( not ( = ?auto_2845 ?auto_2857 ) ) ( not ( = ?auto_2850 ?auto_2855 ) ) ( not ( = ?auto_2850 ?auto_2860 ) ) ( not ( = ?auto_2850 ?auto_2861 ) ) ( not ( = ?auto_2848 ?auto_2856 ) ) ( not ( = ?auto_2848 ?auto_2858 ) ) ( not ( = ?auto_2848 ?auto_2854 ) ) ( not ( = ?auto_2847 ?auto_2852 ) ) ( not ( = ?auto_2847 ?auto_2853 ) ) ( not ( = ?auto_2847 ?auto_2859 ) ) ( not ( = ?auto_2847 ?auto_2857 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_2840 ?auto_2841 ?auto_2842 ?auto_2843 ?auto_2844 )
      ( MAKE-1CRATE ?auto_2844 ?auto_2845 )
      ( MAKE-5CRATE-VERIFY ?auto_2840 ?auto_2841 ?auto_2842 ?auto_2843 ?auto_2844 ?auto_2845 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2864 - SURFACE
      ?auto_2865 - SURFACE
    )
    :vars
    (
      ?auto_2866 - HOIST
      ?auto_2867 - PLACE
      ?auto_2869 - PLACE
      ?auto_2870 - HOIST
      ?auto_2871 - SURFACE
      ?auto_2868 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2866 ?auto_2867 ) ( SURFACE-AT ?auto_2864 ?auto_2867 ) ( CLEAR ?auto_2864 ) ( IS-CRATE ?auto_2865 ) ( AVAILABLE ?auto_2866 ) ( not ( = ?auto_2869 ?auto_2867 ) ) ( HOIST-AT ?auto_2870 ?auto_2869 ) ( AVAILABLE ?auto_2870 ) ( SURFACE-AT ?auto_2865 ?auto_2869 ) ( ON ?auto_2865 ?auto_2871 ) ( CLEAR ?auto_2865 ) ( TRUCK-AT ?auto_2868 ?auto_2867 ) ( not ( = ?auto_2864 ?auto_2865 ) ) ( not ( = ?auto_2864 ?auto_2871 ) ) ( not ( = ?auto_2865 ?auto_2871 ) ) ( not ( = ?auto_2866 ?auto_2870 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2868 ?auto_2867 ?auto_2869 )
      ( !LIFT ?auto_2870 ?auto_2865 ?auto_2871 ?auto_2869 )
      ( !LOAD ?auto_2870 ?auto_2865 ?auto_2868 ?auto_2869 )
      ( !DRIVE ?auto_2868 ?auto_2869 ?auto_2867 )
      ( !UNLOAD ?auto_2866 ?auto_2865 ?auto_2868 ?auto_2867 )
      ( !DROP ?auto_2866 ?auto_2865 ?auto_2864 ?auto_2867 )
      ( MAKE-1CRATE-VERIFY ?auto_2864 ?auto_2865 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2879 - SURFACE
      ?auto_2880 - SURFACE
      ?auto_2881 - SURFACE
      ?auto_2882 - SURFACE
      ?auto_2883 - SURFACE
      ?auto_2885 - SURFACE
      ?auto_2884 - SURFACE
    )
    :vars
    (
      ?auto_2886 - HOIST
      ?auto_2891 - PLACE
      ?auto_2889 - PLACE
      ?auto_2888 - HOIST
      ?auto_2887 - SURFACE
      ?auto_2894 - PLACE
      ?auto_2893 - HOIST
      ?auto_2902 - SURFACE
      ?auto_2896 - PLACE
      ?auto_2900 - HOIST
      ?auto_2901 - SURFACE
      ?auto_2892 - PLACE
      ?auto_2899 - HOIST
      ?auto_2903 - SURFACE
      ?auto_2904 - PLACE
      ?auto_2895 - HOIST
      ?auto_2897 - SURFACE
      ?auto_2898 - SURFACE
      ?auto_2890 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2886 ?auto_2891 ) ( IS-CRATE ?auto_2884 ) ( not ( = ?auto_2889 ?auto_2891 ) ) ( HOIST-AT ?auto_2888 ?auto_2889 ) ( AVAILABLE ?auto_2888 ) ( SURFACE-AT ?auto_2884 ?auto_2889 ) ( ON ?auto_2884 ?auto_2887 ) ( CLEAR ?auto_2884 ) ( not ( = ?auto_2885 ?auto_2884 ) ) ( not ( = ?auto_2885 ?auto_2887 ) ) ( not ( = ?auto_2884 ?auto_2887 ) ) ( not ( = ?auto_2886 ?auto_2888 ) ) ( IS-CRATE ?auto_2885 ) ( not ( = ?auto_2894 ?auto_2891 ) ) ( HOIST-AT ?auto_2893 ?auto_2894 ) ( AVAILABLE ?auto_2893 ) ( SURFACE-AT ?auto_2885 ?auto_2894 ) ( ON ?auto_2885 ?auto_2902 ) ( CLEAR ?auto_2885 ) ( not ( = ?auto_2883 ?auto_2885 ) ) ( not ( = ?auto_2883 ?auto_2902 ) ) ( not ( = ?auto_2885 ?auto_2902 ) ) ( not ( = ?auto_2886 ?auto_2893 ) ) ( IS-CRATE ?auto_2883 ) ( not ( = ?auto_2896 ?auto_2891 ) ) ( HOIST-AT ?auto_2900 ?auto_2896 ) ( AVAILABLE ?auto_2900 ) ( SURFACE-AT ?auto_2883 ?auto_2896 ) ( ON ?auto_2883 ?auto_2901 ) ( CLEAR ?auto_2883 ) ( not ( = ?auto_2882 ?auto_2883 ) ) ( not ( = ?auto_2882 ?auto_2901 ) ) ( not ( = ?auto_2883 ?auto_2901 ) ) ( not ( = ?auto_2886 ?auto_2900 ) ) ( IS-CRATE ?auto_2882 ) ( not ( = ?auto_2892 ?auto_2891 ) ) ( HOIST-AT ?auto_2899 ?auto_2892 ) ( AVAILABLE ?auto_2899 ) ( SURFACE-AT ?auto_2882 ?auto_2892 ) ( ON ?auto_2882 ?auto_2903 ) ( CLEAR ?auto_2882 ) ( not ( = ?auto_2881 ?auto_2882 ) ) ( not ( = ?auto_2881 ?auto_2903 ) ) ( not ( = ?auto_2882 ?auto_2903 ) ) ( not ( = ?auto_2886 ?auto_2899 ) ) ( IS-CRATE ?auto_2881 ) ( not ( = ?auto_2904 ?auto_2891 ) ) ( HOIST-AT ?auto_2895 ?auto_2904 ) ( SURFACE-AT ?auto_2881 ?auto_2904 ) ( ON ?auto_2881 ?auto_2897 ) ( CLEAR ?auto_2881 ) ( not ( = ?auto_2880 ?auto_2881 ) ) ( not ( = ?auto_2880 ?auto_2897 ) ) ( not ( = ?auto_2881 ?auto_2897 ) ) ( not ( = ?auto_2886 ?auto_2895 ) ) ( SURFACE-AT ?auto_2879 ?auto_2891 ) ( CLEAR ?auto_2879 ) ( IS-CRATE ?auto_2880 ) ( AVAILABLE ?auto_2886 ) ( AVAILABLE ?auto_2895 ) ( SURFACE-AT ?auto_2880 ?auto_2904 ) ( ON ?auto_2880 ?auto_2898 ) ( CLEAR ?auto_2880 ) ( TRUCK-AT ?auto_2890 ?auto_2891 ) ( not ( = ?auto_2879 ?auto_2880 ) ) ( not ( = ?auto_2879 ?auto_2898 ) ) ( not ( = ?auto_2880 ?auto_2898 ) ) ( not ( = ?auto_2879 ?auto_2881 ) ) ( not ( = ?auto_2879 ?auto_2897 ) ) ( not ( = ?auto_2881 ?auto_2898 ) ) ( not ( = ?auto_2897 ?auto_2898 ) ) ( not ( = ?auto_2879 ?auto_2882 ) ) ( not ( = ?auto_2879 ?auto_2903 ) ) ( not ( = ?auto_2880 ?auto_2882 ) ) ( not ( = ?auto_2880 ?auto_2903 ) ) ( not ( = ?auto_2882 ?auto_2897 ) ) ( not ( = ?auto_2882 ?auto_2898 ) ) ( not ( = ?auto_2892 ?auto_2904 ) ) ( not ( = ?auto_2899 ?auto_2895 ) ) ( not ( = ?auto_2903 ?auto_2897 ) ) ( not ( = ?auto_2903 ?auto_2898 ) ) ( not ( = ?auto_2879 ?auto_2883 ) ) ( not ( = ?auto_2879 ?auto_2901 ) ) ( not ( = ?auto_2880 ?auto_2883 ) ) ( not ( = ?auto_2880 ?auto_2901 ) ) ( not ( = ?auto_2881 ?auto_2883 ) ) ( not ( = ?auto_2881 ?auto_2901 ) ) ( not ( = ?auto_2883 ?auto_2903 ) ) ( not ( = ?auto_2883 ?auto_2897 ) ) ( not ( = ?auto_2883 ?auto_2898 ) ) ( not ( = ?auto_2896 ?auto_2892 ) ) ( not ( = ?auto_2896 ?auto_2904 ) ) ( not ( = ?auto_2900 ?auto_2899 ) ) ( not ( = ?auto_2900 ?auto_2895 ) ) ( not ( = ?auto_2901 ?auto_2903 ) ) ( not ( = ?auto_2901 ?auto_2897 ) ) ( not ( = ?auto_2901 ?auto_2898 ) ) ( not ( = ?auto_2879 ?auto_2885 ) ) ( not ( = ?auto_2879 ?auto_2902 ) ) ( not ( = ?auto_2880 ?auto_2885 ) ) ( not ( = ?auto_2880 ?auto_2902 ) ) ( not ( = ?auto_2881 ?auto_2885 ) ) ( not ( = ?auto_2881 ?auto_2902 ) ) ( not ( = ?auto_2882 ?auto_2885 ) ) ( not ( = ?auto_2882 ?auto_2902 ) ) ( not ( = ?auto_2885 ?auto_2901 ) ) ( not ( = ?auto_2885 ?auto_2903 ) ) ( not ( = ?auto_2885 ?auto_2897 ) ) ( not ( = ?auto_2885 ?auto_2898 ) ) ( not ( = ?auto_2894 ?auto_2896 ) ) ( not ( = ?auto_2894 ?auto_2892 ) ) ( not ( = ?auto_2894 ?auto_2904 ) ) ( not ( = ?auto_2893 ?auto_2900 ) ) ( not ( = ?auto_2893 ?auto_2899 ) ) ( not ( = ?auto_2893 ?auto_2895 ) ) ( not ( = ?auto_2902 ?auto_2901 ) ) ( not ( = ?auto_2902 ?auto_2903 ) ) ( not ( = ?auto_2902 ?auto_2897 ) ) ( not ( = ?auto_2902 ?auto_2898 ) ) ( not ( = ?auto_2879 ?auto_2884 ) ) ( not ( = ?auto_2879 ?auto_2887 ) ) ( not ( = ?auto_2880 ?auto_2884 ) ) ( not ( = ?auto_2880 ?auto_2887 ) ) ( not ( = ?auto_2881 ?auto_2884 ) ) ( not ( = ?auto_2881 ?auto_2887 ) ) ( not ( = ?auto_2882 ?auto_2884 ) ) ( not ( = ?auto_2882 ?auto_2887 ) ) ( not ( = ?auto_2883 ?auto_2884 ) ) ( not ( = ?auto_2883 ?auto_2887 ) ) ( not ( = ?auto_2884 ?auto_2902 ) ) ( not ( = ?auto_2884 ?auto_2901 ) ) ( not ( = ?auto_2884 ?auto_2903 ) ) ( not ( = ?auto_2884 ?auto_2897 ) ) ( not ( = ?auto_2884 ?auto_2898 ) ) ( not ( = ?auto_2889 ?auto_2894 ) ) ( not ( = ?auto_2889 ?auto_2896 ) ) ( not ( = ?auto_2889 ?auto_2892 ) ) ( not ( = ?auto_2889 ?auto_2904 ) ) ( not ( = ?auto_2888 ?auto_2893 ) ) ( not ( = ?auto_2888 ?auto_2900 ) ) ( not ( = ?auto_2888 ?auto_2899 ) ) ( not ( = ?auto_2888 ?auto_2895 ) ) ( not ( = ?auto_2887 ?auto_2902 ) ) ( not ( = ?auto_2887 ?auto_2901 ) ) ( not ( = ?auto_2887 ?auto_2903 ) ) ( not ( = ?auto_2887 ?auto_2897 ) ) ( not ( = ?auto_2887 ?auto_2898 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_2879 ?auto_2880 ?auto_2881 ?auto_2882 ?auto_2883 ?auto_2885 )
      ( MAKE-1CRATE ?auto_2885 ?auto_2884 )
      ( MAKE-6CRATE-VERIFY ?auto_2879 ?auto_2880 ?auto_2881 ?auto_2882 ?auto_2883 ?auto_2885 ?auto_2884 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2907 - SURFACE
      ?auto_2908 - SURFACE
    )
    :vars
    (
      ?auto_2909 - HOIST
      ?auto_2910 - PLACE
      ?auto_2912 - PLACE
      ?auto_2913 - HOIST
      ?auto_2914 - SURFACE
      ?auto_2911 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2909 ?auto_2910 ) ( SURFACE-AT ?auto_2907 ?auto_2910 ) ( CLEAR ?auto_2907 ) ( IS-CRATE ?auto_2908 ) ( AVAILABLE ?auto_2909 ) ( not ( = ?auto_2912 ?auto_2910 ) ) ( HOIST-AT ?auto_2913 ?auto_2912 ) ( AVAILABLE ?auto_2913 ) ( SURFACE-AT ?auto_2908 ?auto_2912 ) ( ON ?auto_2908 ?auto_2914 ) ( CLEAR ?auto_2908 ) ( TRUCK-AT ?auto_2911 ?auto_2910 ) ( not ( = ?auto_2907 ?auto_2908 ) ) ( not ( = ?auto_2907 ?auto_2914 ) ) ( not ( = ?auto_2908 ?auto_2914 ) ) ( not ( = ?auto_2909 ?auto_2913 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2911 ?auto_2910 ?auto_2912 )
      ( !LIFT ?auto_2913 ?auto_2908 ?auto_2914 ?auto_2912 )
      ( !LOAD ?auto_2913 ?auto_2908 ?auto_2911 ?auto_2912 )
      ( !DRIVE ?auto_2911 ?auto_2912 ?auto_2910 )
      ( !UNLOAD ?auto_2909 ?auto_2908 ?auto_2911 ?auto_2910 )
      ( !DROP ?auto_2909 ?auto_2908 ?auto_2907 ?auto_2910 )
      ( MAKE-1CRATE-VERIFY ?auto_2907 ?auto_2908 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2923 - SURFACE
      ?auto_2924 - SURFACE
      ?auto_2925 - SURFACE
      ?auto_2926 - SURFACE
      ?auto_2927 - SURFACE
      ?auto_2929 - SURFACE
      ?auto_2928 - SURFACE
      ?auto_2930 - SURFACE
    )
    :vars
    (
      ?auto_2931 - HOIST
      ?auto_2935 - PLACE
      ?auto_2936 - PLACE
      ?auto_2934 - HOIST
      ?auto_2933 - SURFACE
      ?auto_2946 - PLACE
      ?auto_2945 - HOIST
      ?auto_2947 - SURFACE
      ?auto_2937 - SURFACE
      ?auto_2943 - PLACE
      ?auto_2948 - HOIST
      ?auto_2938 - SURFACE
      ?auto_2944 - PLACE
      ?auto_2950 - HOIST
      ?auto_2939 - SURFACE
      ?auto_2940 - PLACE
      ?auto_2941 - HOIST
      ?auto_2942 - SURFACE
      ?auto_2949 - SURFACE
      ?auto_2932 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2931 ?auto_2935 ) ( IS-CRATE ?auto_2930 ) ( not ( = ?auto_2936 ?auto_2935 ) ) ( HOIST-AT ?auto_2934 ?auto_2936 ) ( SURFACE-AT ?auto_2930 ?auto_2936 ) ( ON ?auto_2930 ?auto_2933 ) ( CLEAR ?auto_2930 ) ( not ( = ?auto_2928 ?auto_2930 ) ) ( not ( = ?auto_2928 ?auto_2933 ) ) ( not ( = ?auto_2930 ?auto_2933 ) ) ( not ( = ?auto_2931 ?auto_2934 ) ) ( IS-CRATE ?auto_2928 ) ( not ( = ?auto_2946 ?auto_2935 ) ) ( HOIST-AT ?auto_2945 ?auto_2946 ) ( AVAILABLE ?auto_2945 ) ( SURFACE-AT ?auto_2928 ?auto_2946 ) ( ON ?auto_2928 ?auto_2947 ) ( CLEAR ?auto_2928 ) ( not ( = ?auto_2929 ?auto_2928 ) ) ( not ( = ?auto_2929 ?auto_2947 ) ) ( not ( = ?auto_2928 ?auto_2947 ) ) ( not ( = ?auto_2931 ?auto_2945 ) ) ( IS-CRATE ?auto_2929 ) ( AVAILABLE ?auto_2934 ) ( SURFACE-AT ?auto_2929 ?auto_2936 ) ( ON ?auto_2929 ?auto_2937 ) ( CLEAR ?auto_2929 ) ( not ( = ?auto_2927 ?auto_2929 ) ) ( not ( = ?auto_2927 ?auto_2937 ) ) ( not ( = ?auto_2929 ?auto_2937 ) ) ( IS-CRATE ?auto_2927 ) ( not ( = ?auto_2943 ?auto_2935 ) ) ( HOIST-AT ?auto_2948 ?auto_2943 ) ( AVAILABLE ?auto_2948 ) ( SURFACE-AT ?auto_2927 ?auto_2943 ) ( ON ?auto_2927 ?auto_2938 ) ( CLEAR ?auto_2927 ) ( not ( = ?auto_2926 ?auto_2927 ) ) ( not ( = ?auto_2926 ?auto_2938 ) ) ( not ( = ?auto_2927 ?auto_2938 ) ) ( not ( = ?auto_2931 ?auto_2948 ) ) ( IS-CRATE ?auto_2926 ) ( not ( = ?auto_2944 ?auto_2935 ) ) ( HOIST-AT ?auto_2950 ?auto_2944 ) ( AVAILABLE ?auto_2950 ) ( SURFACE-AT ?auto_2926 ?auto_2944 ) ( ON ?auto_2926 ?auto_2939 ) ( CLEAR ?auto_2926 ) ( not ( = ?auto_2925 ?auto_2926 ) ) ( not ( = ?auto_2925 ?auto_2939 ) ) ( not ( = ?auto_2926 ?auto_2939 ) ) ( not ( = ?auto_2931 ?auto_2950 ) ) ( IS-CRATE ?auto_2925 ) ( not ( = ?auto_2940 ?auto_2935 ) ) ( HOIST-AT ?auto_2941 ?auto_2940 ) ( SURFACE-AT ?auto_2925 ?auto_2940 ) ( ON ?auto_2925 ?auto_2942 ) ( CLEAR ?auto_2925 ) ( not ( = ?auto_2924 ?auto_2925 ) ) ( not ( = ?auto_2924 ?auto_2942 ) ) ( not ( = ?auto_2925 ?auto_2942 ) ) ( not ( = ?auto_2931 ?auto_2941 ) ) ( SURFACE-AT ?auto_2923 ?auto_2935 ) ( CLEAR ?auto_2923 ) ( IS-CRATE ?auto_2924 ) ( AVAILABLE ?auto_2931 ) ( AVAILABLE ?auto_2941 ) ( SURFACE-AT ?auto_2924 ?auto_2940 ) ( ON ?auto_2924 ?auto_2949 ) ( CLEAR ?auto_2924 ) ( TRUCK-AT ?auto_2932 ?auto_2935 ) ( not ( = ?auto_2923 ?auto_2924 ) ) ( not ( = ?auto_2923 ?auto_2949 ) ) ( not ( = ?auto_2924 ?auto_2949 ) ) ( not ( = ?auto_2923 ?auto_2925 ) ) ( not ( = ?auto_2923 ?auto_2942 ) ) ( not ( = ?auto_2925 ?auto_2949 ) ) ( not ( = ?auto_2942 ?auto_2949 ) ) ( not ( = ?auto_2923 ?auto_2926 ) ) ( not ( = ?auto_2923 ?auto_2939 ) ) ( not ( = ?auto_2924 ?auto_2926 ) ) ( not ( = ?auto_2924 ?auto_2939 ) ) ( not ( = ?auto_2926 ?auto_2942 ) ) ( not ( = ?auto_2926 ?auto_2949 ) ) ( not ( = ?auto_2944 ?auto_2940 ) ) ( not ( = ?auto_2950 ?auto_2941 ) ) ( not ( = ?auto_2939 ?auto_2942 ) ) ( not ( = ?auto_2939 ?auto_2949 ) ) ( not ( = ?auto_2923 ?auto_2927 ) ) ( not ( = ?auto_2923 ?auto_2938 ) ) ( not ( = ?auto_2924 ?auto_2927 ) ) ( not ( = ?auto_2924 ?auto_2938 ) ) ( not ( = ?auto_2925 ?auto_2927 ) ) ( not ( = ?auto_2925 ?auto_2938 ) ) ( not ( = ?auto_2927 ?auto_2939 ) ) ( not ( = ?auto_2927 ?auto_2942 ) ) ( not ( = ?auto_2927 ?auto_2949 ) ) ( not ( = ?auto_2943 ?auto_2944 ) ) ( not ( = ?auto_2943 ?auto_2940 ) ) ( not ( = ?auto_2948 ?auto_2950 ) ) ( not ( = ?auto_2948 ?auto_2941 ) ) ( not ( = ?auto_2938 ?auto_2939 ) ) ( not ( = ?auto_2938 ?auto_2942 ) ) ( not ( = ?auto_2938 ?auto_2949 ) ) ( not ( = ?auto_2923 ?auto_2929 ) ) ( not ( = ?auto_2923 ?auto_2937 ) ) ( not ( = ?auto_2924 ?auto_2929 ) ) ( not ( = ?auto_2924 ?auto_2937 ) ) ( not ( = ?auto_2925 ?auto_2929 ) ) ( not ( = ?auto_2925 ?auto_2937 ) ) ( not ( = ?auto_2926 ?auto_2929 ) ) ( not ( = ?auto_2926 ?auto_2937 ) ) ( not ( = ?auto_2929 ?auto_2938 ) ) ( not ( = ?auto_2929 ?auto_2939 ) ) ( not ( = ?auto_2929 ?auto_2942 ) ) ( not ( = ?auto_2929 ?auto_2949 ) ) ( not ( = ?auto_2936 ?auto_2943 ) ) ( not ( = ?auto_2936 ?auto_2944 ) ) ( not ( = ?auto_2936 ?auto_2940 ) ) ( not ( = ?auto_2934 ?auto_2948 ) ) ( not ( = ?auto_2934 ?auto_2950 ) ) ( not ( = ?auto_2934 ?auto_2941 ) ) ( not ( = ?auto_2937 ?auto_2938 ) ) ( not ( = ?auto_2937 ?auto_2939 ) ) ( not ( = ?auto_2937 ?auto_2942 ) ) ( not ( = ?auto_2937 ?auto_2949 ) ) ( not ( = ?auto_2923 ?auto_2928 ) ) ( not ( = ?auto_2923 ?auto_2947 ) ) ( not ( = ?auto_2924 ?auto_2928 ) ) ( not ( = ?auto_2924 ?auto_2947 ) ) ( not ( = ?auto_2925 ?auto_2928 ) ) ( not ( = ?auto_2925 ?auto_2947 ) ) ( not ( = ?auto_2926 ?auto_2928 ) ) ( not ( = ?auto_2926 ?auto_2947 ) ) ( not ( = ?auto_2927 ?auto_2928 ) ) ( not ( = ?auto_2927 ?auto_2947 ) ) ( not ( = ?auto_2928 ?auto_2937 ) ) ( not ( = ?auto_2928 ?auto_2938 ) ) ( not ( = ?auto_2928 ?auto_2939 ) ) ( not ( = ?auto_2928 ?auto_2942 ) ) ( not ( = ?auto_2928 ?auto_2949 ) ) ( not ( = ?auto_2946 ?auto_2936 ) ) ( not ( = ?auto_2946 ?auto_2943 ) ) ( not ( = ?auto_2946 ?auto_2944 ) ) ( not ( = ?auto_2946 ?auto_2940 ) ) ( not ( = ?auto_2945 ?auto_2934 ) ) ( not ( = ?auto_2945 ?auto_2948 ) ) ( not ( = ?auto_2945 ?auto_2950 ) ) ( not ( = ?auto_2945 ?auto_2941 ) ) ( not ( = ?auto_2947 ?auto_2937 ) ) ( not ( = ?auto_2947 ?auto_2938 ) ) ( not ( = ?auto_2947 ?auto_2939 ) ) ( not ( = ?auto_2947 ?auto_2942 ) ) ( not ( = ?auto_2947 ?auto_2949 ) ) ( not ( = ?auto_2923 ?auto_2930 ) ) ( not ( = ?auto_2923 ?auto_2933 ) ) ( not ( = ?auto_2924 ?auto_2930 ) ) ( not ( = ?auto_2924 ?auto_2933 ) ) ( not ( = ?auto_2925 ?auto_2930 ) ) ( not ( = ?auto_2925 ?auto_2933 ) ) ( not ( = ?auto_2926 ?auto_2930 ) ) ( not ( = ?auto_2926 ?auto_2933 ) ) ( not ( = ?auto_2927 ?auto_2930 ) ) ( not ( = ?auto_2927 ?auto_2933 ) ) ( not ( = ?auto_2929 ?auto_2930 ) ) ( not ( = ?auto_2929 ?auto_2933 ) ) ( not ( = ?auto_2930 ?auto_2947 ) ) ( not ( = ?auto_2930 ?auto_2937 ) ) ( not ( = ?auto_2930 ?auto_2938 ) ) ( not ( = ?auto_2930 ?auto_2939 ) ) ( not ( = ?auto_2930 ?auto_2942 ) ) ( not ( = ?auto_2930 ?auto_2949 ) ) ( not ( = ?auto_2933 ?auto_2947 ) ) ( not ( = ?auto_2933 ?auto_2937 ) ) ( not ( = ?auto_2933 ?auto_2938 ) ) ( not ( = ?auto_2933 ?auto_2939 ) ) ( not ( = ?auto_2933 ?auto_2942 ) ) ( not ( = ?auto_2933 ?auto_2949 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_2923 ?auto_2924 ?auto_2925 ?auto_2926 ?auto_2927 ?auto_2929 ?auto_2928 )
      ( MAKE-1CRATE ?auto_2928 ?auto_2930 )
      ( MAKE-7CRATE-VERIFY ?auto_2923 ?auto_2924 ?auto_2925 ?auto_2926 ?auto_2927 ?auto_2929 ?auto_2928 ?auto_2930 ) )
  )

)

