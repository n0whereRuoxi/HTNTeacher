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

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2753 - SURFACE
      ?auto_2754 - SURFACE
      ?auto_2755 - SURFACE
    )
    :vars
    (
      ?auto_2760 - HOIST
      ?auto_2759 - PLACE
      ?auto_2756 - PLACE
      ?auto_2761 - HOIST
      ?auto_2758 - SURFACE
      ?auto_2762 - SURFACE
      ?auto_2757 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2760 ?auto_2759 ) ( IS-CRATE ?auto_2755 ) ( not ( = ?auto_2756 ?auto_2759 ) ) ( HOIST-AT ?auto_2761 ?auto_2756 ) ( SURFACE-AT ?auto_2755 ?auto_2756 ) ( ON ?auto_2755 ?auto_2758 ) ( CLEAR ?auto_2755 ) ( not ( = ?auto_2754 ?auto_2755 ) ) ( not ( = ?auto_2754 ?auto_2758 ) ) ( not ( = ?auto_2755 ?auto_2758 ) ) ( not ( = ?auto_2760 ?auto_2761 ) ) ( SURFACE-AT ?auto_2753 ?auto_2759 ) ( CLEAR ?auto_2753 ) ( IS-CRATE ?auto_2754 ) ( AVAILABLE ?auto_2760 ) ( AVAILABLE ?auto_2761 ) ( SURFACE-AT ?auto_2754 ?auto_2756 ) ( ON ?auto_2754 ?auto_2762 ) ( CLEAR ?auto_2754 ) ( TRUCK-AT ?auto_2757 ?auto_2759 ) ( not ( = ?auto_2753 ?auto_2754 ) ) ( not ( = ?auto_2753 ?auto_2762 ) ) ( not ( = ?auto_2754 ?auto_2762 ) ) ( not ( = ?auto_2753 ?auto_2755 ) ) ( not ( = ?auto_2753 ?auto_2758 ) ) ( not ( = ?auto_2755 ?auto_2762 ) ) ( not ( = ?auto_2758 ?auto_2762 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2753 ?auto_2754 )
      ( MAKE-1CRATE ?auto_2754 ?auto_2755 )
      ( MAKE-2CRATE-VERIFY ?auto_2753 ?auto_2754 ?auto_2755 ) )
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
      ?auto_2785 - HOIST
      ?auto_2781 - PLACE
      ?auto_2784 - PLACE
      ?auto_2786 - HOIST
      ?auto_2783 - SURFACE
      ?auto_2788 - PLACE
      ?auto_2790 - HOIST
      ?auto_2789 - SURFACE
      ?auto_2787 - SURFACE
      ?auto_2782 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2785 ?auto_2781 ) ( IS-CRATE ?auto_2780 ) ( not ( = ?auto_2784 ?auto_2781 ) ) ( HOIST-AT ?auto_2786 ?auto_2784 ) ( AVAILABLE ?auto_2786 ) ( SURFACE-AT ?auto_2780 ?auto_2784 ) ( ON ?auto_2780 ?auto_2783 ) ( CLEAR ?auto_2780 ) ( not ( = ?auto_2779 ?auto_2780 ) ) ( not ( = ?auto_2779 ?auto_2783 ) ) ( not ( = ?auto_2780 ?auto_2783 ) ) ( not ( = ?auto_2785 ?auto_2786 ) ) ( IS-CRATE ?auto_2779 ) ( not ( = ?auto_2788 ?auto_2781 ) ) ( HOIST-AT ?auto_2790 ?auto_2788 ) ( SURFACE-AT ?auto_2779 ?auto_2788 ) ( ON ?auto_2779 ?auto_2789 ) ( CLEAR ?auto_2779 ) ( not ( = ?auto_2778 ?auto_2779 ) ) ( not ( = ?auto_2778 ?auto_2789 ) ) ( not ( = ?auto_2779 ?auto_2789 ) ) ( not ( = ?auto_2785 ?auto_2790 ) ) ( SURFACE-AT ?auto_2777 ?auto_2781 ) ( CLEAR ?auto_2777 ) ( IS-CRATE ?auto_2778 ) ( AVAILABLE ?auto_2785 ) ( AVAILABLE ?auto_2790 ) ( SURFACE-AT ?auto_2778 ?auto_2788 ) ( ON ?auto_2778 ?auto_2787 ) ( CLEAR ?auto_2778 ) ( TRUCK-AT ?auto_2782 ?auto_2781 ) ( not ( = ?auto_2777 ?auto_2778 ) ) ( not ( = ?auto_2777 ?auto_2787 ) ) ( not ( = ?auto_2778 ?auto_2787 ) ) ( not ( = ?auto_2777 ?auto_2779 ) ) ( not ( = ?auto_2777 ?auto_2789 ) ) ( not ( = ?auto_2779 ?auto_2787 ) ) ( not ( = ?auto_2789 ?auto_2787 ) ) ( not ( = ?auto_2777 ?auto_2780 ) ) ( not ( = ?auto_2777 ?auto_2783 ) ) ( not ( = ?auto_2778 ?auto_2780 ) ) ( not ( = ?auto_2778 ?auto_2783 ) ) ( not ( = ?auto_2780 ?auto_2789 ) ) ( not ( = ?auto_2780 ?auto_2787 ) ) ( not ( = ?auto_2784 ?auto_2788 ) ) ( not ( = ?auto_2786 ?auto_2790 ) ) ( not ( = ?auto_2783 ?auto_2789 ) ) ( not ( = ?auto_2783 ?auto_2787 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2777 ?auto_2778 ?auto_2779 )
      ( MAKE-1CRATE ?auto_2779 ?auto_2780 )
      ( MAKE-3CRATE-VERIFY ?auto_2777 ?auto_2778 ?auto_2779 ?auto_2780 ) )
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
      ?auto_2816 - HOIST
      ?auto_2814 - PLACE
      ?auto_2812 - PLACE
      ?auto_2813 - HOIST
      ?auto_2815 - SURFACE
      ?auto_2818 - PLACE
      ?auto_2822 - HOIST
      ?auto_2817 - SURFACE
      ?auto_2821 - PLACE
      ?auto_2819 - HOIST
      ?auto_2823 - SURFACE
      ?auto_2820 - SURFACE
      ?auto_2811 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2816 ?auto_2814 ) ( IS-CRATE ?auto_2810 ) ( not ( = ?auto_2812 ?auto_2814 ) ) ( HOIST-AT ?auto_2813 ?auto_2812 ) ( AVAILABLE ?auto_2813 ) ( SURFACE-AT ?auto_2810 ?auto_2812 ) ( ON ?auto_2810 ?auto_2815 ) ( CLEAR ?auto_2810 ) ( not ( = ?auto_2809 ?auto_2810 ) ) ( not ( = ?auto_2809 ?auto_2815 ) ) ( not ( = ?auto_2810 ?auto_2815 ) ) ( not ( = ?auto_2816 ?auto_2813 ) ) ( IS-CRATE ?auto_2809 ) ( not ( = ?auto_2818 ?auto_2814 ) ) ( HOIST-AT ?auto_2822 ?auto_2818 ) ( AVAILABLE ?auto_2822 ) ( SURFACE-AT ?auto_2809 ?auto_2818 ) ( ON ?auto_2809 ?auto_2817 ) ( CLEAR ?auto_2809 ) ( not ( = ?auto_2808 ?auto_2809 ) ) ( not ( = ?auto_2808 ?auto_2817 ) ) ( not ( = ?auto_2809 ?auto_2817 ) ) ( not ( = ?auto_2816 ?auto_2822 ) ) ( IS-CRATE ?auto_2808 ) ( not ( = ?auto_2821 ?auto_2814 ) ) ( HOIST-AT ?auto_2819 ?auto_2821 ) ( SURFACE-AT ?auto_2808 ?auto_2821 ) ( ON ?auto_2808 ?auto_2823 ) ( CLEAR ?auto_2808 ) ( not ( = ?auto_2807 ?auto_2808 ) ) ( not ( = ?auto_2807 ?auto_2823 ) ) ( not ( = ?auto_2808 ?auto_2823 ) ) ( not ( = ?auto_2816 ?auto_2819 ) ) ( SURFACE-AT ?auto_2806 ?auto_2814 ) ( CLEAR ?auto_2806 ) ( IS-CRATE ?auto_2807 ) ( AVAILABLE ?auto_2816 ) ( AVAILABLE ?auto_2819 ) ( SURFACE-AT ?auto_2807 ?auto_2821 ) ( ON ?auto_2807 ?auto_2820 ) ( CLEAR ?auto_2807 ) ( TRUCK-AT ?auto_2811 ?auto_2814 ) ( not ( = ?auto_2806 ?auto_2807 ) ) ( not ( = ?auto_2806 ?auto_2820 ) ) ( not ( = ?auto_2807 ?auto_2820 ) ) ( not ( = ?auto_2806 ?auto_2808 ) ) ( not ( = ?auto_2806 ?auto_2823 ) ) ( not ( = ?auto_2808 ?auto_2820 ) ) ( not ( = ?auto_2823 ?auto_2820 ) ) ( not ( = ?auto_2806 ?auto_2809 ) ) ( not ( = ?auto_2806 ?auto_2817 ) ) ( not ( = ?auto_2807 ?auto_2809 ) ) ( not ( = ?auto_2807 ?auto_2817 ) ) ( not ( = ?auto_2809 ?auto_2823 ) ) ( not ( = ?auto_2809 ?auto_2820 ) ) ( not ( = ?auto_2818 ?auto_2821 ) ) ( not ( = ?auto_2822 ?auto_2819 ) ) ( not ( = ?auto_2817 ?auto_2823 ) ) ( not ( = ?auto_2817 ?auto_2820 ) ) ( not ( = ?auto_2806 ?auto_2810 ) ) ( not ( = ?auto_2806 ?auto_2815 ) ) ( not ( = ?auto_2807 ?auto_2810 ) ) ( not ( = ?auto_2807 ?auto_2815 ) ) ( not ( = ?auto_2808 ?auto_2810 ) ) ( not ( = ?auto_2808 ?auto_2815 ) ) ( not ( = ?auto_2810 ?auto_2817 ) ) ( not ( = ?auto_2810 ?auto_2823 ) ) ( not ( = ?auto_2810 ?auto_2820 ) ) ( not ( = ?auto_2812 ?auto_2818 ) ) ( not ( = ?auto_2812 ?auto_2821 ) ) ( not ( = ?auto_2813 ?auto_2822 ) ) ( not ( = ?auto_2813 ?auto_2819 ) ) ( not ( = ?auto_2815 ?auto_2817 ) ) ( not ( = ?auto_2815 ?auto_2823 ) ) ( not ( = ?auto_2815 ?auto_2820 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_2806 ?auto_2807 ?auto_2808 ?auto_2809 )
      ( MAKE-1CRATE ?auto_2809 ?auto_2810 )
      ( MAKE-4CRATE-VERIFY ?auto_2806 ?auto_2807 ?auto_2808 ?auto_2809 ?auto_2810 ) )
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
      ?auto_2847 - PLACE
      ?auto_2848 - HOIST
      ?auto_2850 - SURFACE
      ?auto_2856 - PLACE
      ?auto_2861 - HOIST
      ?auto_2857 - SURFACE
      ?auto_2852 - PLACE
      ?auto_2855 - HOIST
      ?auto_2860 - SURFACE
      ?auto_2854 - PLACE
      ?auto_2859 - HOIST
      ?auto_2858 - SURFACE
      ?auto_2853 - SURFACE
      ?auto_2851 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2846 ?auto_2849 ) ( IS-CRATE ?auto_2845 ) ( not ( = ?auto_2847 ?auto_2849 ) ) ( HOIST-AT ?auto_2848 ?auto_2847 ) ( AVAILABLE ?auto_2848 ) ( SURFACE-AT ?auto_2845 ?auto_2847 ) ( ON ?auto_2845 ?auto_2850 ) ( CLEAR ?auto_2845 ) ( not ( = ?auto_2844 ?auto_2845 ) ) ( not ( = ?auto_2844 ?auto_2850 ) ) ( not ( = ?auto_2845 ?auto_2850 ) ) ( not ( = ?auto_2846 ?auto_2848 ) ) ( IS-CRATE ?auto_2844 ) ( not ( = ?auto_2856 ?auto_2849 ) ) ( HOIST-AT ?auto_2861 ?auto_2856 ) ( AVAILABLE ?auto_2861 ) ( SURFACE-AT ?auto_2844 ?auto_2856 ) ( ON ?auto_2844 ?auto_2857 ) ( CLEAR ?auto_2844 ) ( not ( = ?auto_2843 ?auto_2844 ) ) ( not ( = ?auto_2843 ?auto_2857 ) ) ( not ( = ?auto_2844 ?auto_2857 ) ) ( not ( = ?auto_2846 ?auto_2861 ) ) ( IS-CRATE ?auto_2843 ) ( not ( = ?auto_2852 ?auto_2849 ) ) ( HOIST-AT ?auto_2855 ?auto_2852 ) ( AVAILABLE ?auto_2855 ) ( SURFACE-AT ?auto_2843 ?auto_2852 ) ( ON ?auto_2843 ?auto_2860 ) ( CLEAR ?auto_2843 ) ( not ( = ?auto_2842 ?auto_2843 ) ) ( not ( = ?auto_2842 ?auto_2860 ) ) ( not ( = ?auto_2843 ?auto_2860 ) ) ( not ( = ?auto_2846 ?auto_2855 ) ) ( IS-CRATE ?auto_2842 ) ( not ( = ?auto_2854 ?auto_2849 ) ) ( HOIST-AT ?auto_2859 ?auto_2854 ) ( SURFACE-AT ?auto_2842 ?auto_2854 ) ( ON ?auto_2842 ?auto_2858 ) ( CLEAR ?auto_2842 ) ( not ( = ?auto_2841 ?auto_2842 ) ) ( not ( = ?auto_2841 ?auto_2858 ) ) ( not ( = ?auto_2842 ?auto_2858 ) ) ( not ( = ?auto_2846 ?auto_2859 ) ) ( SURFACE-AT ?auto_2840 ?auto_2849 ) ( CLEAR ?auto_2840 ) ( IS-CRATE ?auto_2841 ) ( AVAILABLE ?auto_2846 ) ( AVAILABLE ?auto_2859 ) ( SURFACE-AT ?auto_2841 ?auto_2854 ) ( ON ?auto_2841 ?auto_2853 ) ( CLEAR ?auto_2841 ) ( TRUCK-AT ?auto_2851 ?auto_2849 ) ( not ( = ?auto_2840 ?auto_2841 ) ) ( not ( = ?auto_2840 ?auto_2853 ) ) ( not ( = ?auto_2841 ?auto_2853 ) ) ( not ( = ?auto_2840 ?auto_2842 ) ) ( not ( = ?auto_2840 ?auto_2858 ) ) ( not ( = ?auto_2842 ?auto_2853 ) ) ( not ( = ?auto_2858 ?auto_2853 ) ) ( not ( = ?auto_2840 ?auto_2843 ) ) ( not ( = ?auto_2840 ?auto_2860 ) ) ( not ( = ?auto_2841 ?auto_2843 ) ) ( not ( = ?auto_2841 ?auto_2860 ) ) ( not ( = ?auto_2843 ?auto_2858 ) ) ( not ( = ?auto_2843 ?auto_2853 ) ) ( not ( = ?auto_2852 ?auto_2854 ) ) ( not ( = ?auto_2855 ?auto_2859 ) ) ( not ( = ?auto_2860 ?auto_2858 ) ) ( not ( = ?auto_2860 ?auto_2853 ) ) ( not ( = ?auto_2840 ?auto_2844 ) ) ( not ( = ?auto_2840 ?auto_2857 ) ) ( not ( = ?auto_2841 ?auto_2844 ) ) ( not ( = ?auto_2841 ?auto_2857 ) ) ( not ( = ?auto_2842 ?auto_2844 ) ) ( not ( = ?auto_2842 ?auto_2857 ) ) ( not ( = ?auto_2844 ?auto_2860 ) ) ( not ( = ?auto_2844 ?auto_2858 ) ) ( not ( = ?auto_2844 ?auto_2853 ) ) ( not ( = ?auto_2856 ?auto_2852 ) ) ( not ( = ?auto_2856 ?auto_2854 ) ) ( not ( = ?auto_2861 ?auto_2855 ) ) ( not ( = ?auto_2861 ?auto_2859 ) ) ( not ( = ?auto_2857 ?auto_2860 ) ) ( not ( = ?auto_2857 ?auto_2858 ) ) ( not ( = ?auto_2857 ?auto_2853 ) ) ( not ( = ?auto_2840 ?auto_2845 ) ) ( not ( = ?auto_2840 ?auto_2850 ) ) ( not ( = ?auto_2841 ?auto_2845 ) ) ( not ( = ?auto_2841 ?auto_2850 ) ) ( not ( = ?auto_2842 ?auto_2845 ) ) ( not ( = ?auto_2842 ?auto_2850 ) ) ( not ( = ?auto_2843 ?auto_2845 ) ) ( not ( = ?auto_2843 ?auto_2850 ) ) ( not ( = ?auto_2845 ?auto_2857 ) ) ( not ( = ?auto_2845 ?auto_2860 ) ) ( not ( = ?auto_2845 ?auto_2858 ) ) ( not ( = ?auto_2845 ?auto_2853 ) ) ( not ( = ?auto_2847 ?auto_2856 ) ) ( not ( = ?auto_2847 ?auto_2852 ) ) ( not ( = ?auto_2847 ?auto_2854 ) ) ( not ( = ?auto_2848 ?auto_2861 ) ) ( not ( = ?auto_2848 ?auto_2855 ) ) ( not ( = ?auto_2848 ?auto_2859 ) ) ( not ( = ?auto_2850 ?auto_2857 ) ) ( not ( = ?auto_2850 ?auto_2860 ) ) ( not ( = ?auto_2850 ?auto_2858 ) ) ( not ( = ?auto_2850 ?auto_2853 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_2840 ?auto_2841 ?auto_2842 ?auto_2843 ?auto_2844 )
      ( MAKE-1CRATE ?auto_2844 ?auto_2845 )
      ( MAKE-5CRATE-VERIFY ?auto_2840 ?auto_2841 ?auto_2842 ?auto_2843 ?auto_2844 ?auto_2845 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2879 - SURFACE
      ?auto_2880 - SURFACE
      ?auto_2881 - SURFACE
      ?auto_2882 - SURFACE
      ?auto_2883 - SURFACE
      ?auto_2884 - SURFACE
      ?auto_2885 - SURFACE
    )
    :vars
    (
      ?auto_2886 - HOIST
      ?auto_2889 - PLACE
      ?auto_2891 - PLACE
      ?auto_2888 - HOIST
      ?auto_2890 - SURFACE
      ?auto_2904 - PLACE
      ?auto_2900 - HOIST
      ?auto_2901 - SURFACE
      ?auto_2895 - PLACE
      ?auto_2896 - HOIST
      ?auto_2893 - SURFACE
      ?auto_2892 - PLACE
      ?auto_2897 - HOIST
      ?auto_2903 - SURFACE
      ?auto_2902 - PLACE
      ?auto_2898 - HOIST
      ?auto_2894 - SURFACE
      ?auto_2899 - SURFACE
      ?auto_2887 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2886 ?auto_2889 ) ( IS-CRATE ?auto_2885 ) ( not ( = ?auto_2891 ?auto_2889 ) ) ( HOIST-AT ?auto_2888 ?auto_2891 ) ( AVAILABLE ?auto_2888 ) ( SURFACE-AT ?auto_2885 ?auto_2891 ) ( ON ?auto_2885 ?auto_2890 ) ( CLEAR ?auto_2885 ) ( not ( = ?auto_2884 ?auto_2885 ) ) ( not ( = ?auto_2884 ?auto_2890 ) ) ( not ( = ?auto_2885 ?auto_2890 ) ) ( not ( = ?auto_2886 ?auto_2888 ) ) ( IS-CRATE ?auto_2884 ) ( not ( = ?auto_2904 ?auto_2889 ) ) ( HOIST-AT ?auto_2900 ?auto_2904 ) ( AVAILABLE ?auto_2900 ) ( SURFACE-AT ?auto_2884 ?auto_2904 ) ( ON ?auto_2884 ?auto_2901 ) ( CLEAR ?auto_2884 ) ( not ( = ?auto_2883 ?auto_2884 ) ) ( not ( = ?auto_2883 ?auto_2901 ) ) ( not ( = ?auto_2884 ?auto_2901 ) ) ( not ( = ?auto_2886 ?auto_2900 ) ) ( IS-CRATE ?auto_2883 ) ( not ( = ?auto_2895 ?auto_2889 ) ) ( HOIST-AT ?auto_2896 ?auto_2895 ) ( AVAILABLE ?auto_2896 ) ( SURFACE-AT ?auto_2883 ?auto_2895 ) ( ON ?auto_2883 ?auto_2893 ) ( CLEAR ?auto_2883 ) ( not ( = ?auto_2882 ?auto_2883 ) ) ( not ( = ?auto_2882 ?auto_2893 ) ) ( not ( = ?auto_2883 ?auto_2893 ) ) ( not ( = ?auto_2886 ?auto_2896 ) ) ( IS-CRATE ?auto_2882 ) ( not ( = ?auto_2892 ?auto_2889 ) ) ( HOIST-AT ?auto_2897 ?auto_2892 ) ( AVAILABLE ?auto_2897 ) ( SURFACE-AT ?auto_2882 ?auto_2892 ) ( ON ?auto_2882 ?auto_2903 ) ( CLEAR ?auto_2882 ) ( not ( = ?auto_2881 ?auto_2882 ) ) ( not ( = ?auto_2881 ?auto_2903 ) ) ( not ( = ?auto_2882 ?auto_2903 ) ) ( not ( = ?auto_2886 ?auto_2897 ) ) ( IS-CRATE ?auto_2881 ) ( not ( = ?auto_2902 ?auto_2889 ) ) ( HOIST-AT ?auto_2898 ?auto_2902 ) ( SURFACE-AT ?auto_2881 ?auto_2902 ) ( ON ?auto_2881 ?auto_2894 ) ( CLEAR ?auto_2881 ) ( not ( = ?auto_2880 ?auto_2881 ) ) ( not ( = ?auto_2880 ?auto_2894 ) ) ( not ( = ?auto_2881 ?auto_2894 ) ) ( not ( = ?auto_2886 ?auto_2898 ) ) ( SURFACE-AT ?auto_2879 ?auto_2889 ) ( CLEAR ?auto_2879 ) ( IS-CRATE ?auto_2880 ) ( AVAILABLE ?auto_2886 ) ( AVAILABLE ?auto_2898 ) ( SURFACE-AT ?auto_2880 ?auto_2902 ) ( ON ?auto_2880 ?auto_2899 ) ( CLEAR ?auto_2880 ) ( TRUCK-AT ?auto_2887 ?auto_2889 ) ( not ( = ?auto_2879 ?auto_2880 ) ) ( not ( = ?auto_2879 ?auto_2899 ) ) ( not ( = ?auto_2880 ?auto_2899 ) ) ( not ( = ?auto_2879 ?auto_2881 ) ) ( not ( = ?auto_2879 ?auto_2894 ) ) ( not ( = ?auto_2881 ?auto_2899 ) ) ( not ( = ?auto_2894 ?auto_2899 ) ) ( not ( = ?auto_2879 ?auto_2882 ) ) ( not ( = ?auto_2879 ?auto_2903 ) ) ( not ( = ?auto_2880 ?auto_2882 ) ) ( not ( = ?auto_2880 ?auto_2903 ) ) ( not ( = ?auto_2882 ?auto_2894 ) ) ( not ( = ?auto_2882 ?auto_2899 ) ) ( not ( = ?auto_2892 ?auto_2902 ) ) ( not ( = ?auto_2897 ?auto_2898 ) ) ( not ( = ?auto_2903 ?auto_2894 ) ) ( not ( = ?auto_2903 ?auto_2899 ) ) ( not ( = ?auto_2879 ?auto_2883 ) ) ( not ( = ?auto_2879 ?auto_2893 ) ) ( not ( = ?auto_2880 ?auto_2883 ) ) ( not ( = ?auto_2880 ?auto_2893 ) ) ( not ( = ?auto_2881 ?auto_2883 ) ) ( not ( = ?auto_2881 ?auto_2893 ) ) ( not ( = ?auto_2883 ?auto_2903 ) ) ( not ( = ?auto_2883 ?auto_2894 ) ) ( not ( = ?auto_2883 ?auto_2899 ) ) ( not ( = ?auto_2895 ?auto_2892 ) ) ( not ( = ?auto_2895 ?auto_2902 ) ) ( not ( = ?auto_2896 ?auto_2897 ) ) ( not ( = ?auto_2896 ?auto_2898 ) ) ( not ( = ?auto_2893 ?auto_2903 ) ) ( not ( = ?auto_2893 ?auto_2894 ) ) ( not ( = ?auto_2893 ?auto_2899 ) ) ( not ( = ?auto_2879 ?auto_2884 ) ) ( not ( = ?auto_2879 ?auto_2901 ) ) ( not ( = ?auto_2880 ?auto_2884 ) ) ( not ( = ?auto_2880 ?auto_2901 ) ) ( not ( = ?auto_2881 ?auto_2884 ) ) ( not ( = ?auto_2881 ?auto_2901 ) ) ( not ( = ?auto_2882 ?auto_2884 ) ) ( not ( = ?auto_2882 ?auto_2901 ) ) ( not ( = ?auto_2884 ?auto_2893 ) ) ( not ( = ?auto_2884 ?auto_2903 ) ) ( not ( = ?auto_2884 ?auto_2894 ) ) ( not ( = ?auto_2884 ?auto_2899 ) ) ( not ( = ?auto_2904 ?auto_2895 ) ) ( not ( = ?auto_2904 ?auto_2892 ) ) ( not ( = ?auto_2904 ?auto_2902 ) ) ( not ( = ?auto_2900 ?auto_2896 ) ) ( not ( = ?auto_2900 ?auto_2897 ) ) ( not ( = ?auto_2900 ?auto_2898 ) ) ( not ( = ?auto_2901 ?auto_2893 ) ) ( not ( = ?auto_2901 ?auto_2903 ) ) ( not ( = ?auto_2901 ?auto_2894 ) ) ( not ( = ?auto_2901 ?auto_2899 ) ) ( not ( = ?auto_2879 ?auto_2885 ) ) ( not ( = ?auto_2879 ?auto_2890 ) ) ( not ( = ?auto_2880 ?auto_2885 ) ) ( not ( = ?auto_2880 ?auto_2890 ) ) ( not ( = ?auto_2881 ?auto_2885 ) ) ( not ( = ?auto_2881 ?auto_2890 ) ) ( not ( = ?auto_2882 ?auto_2885 ) ) ( not ( = ?auto_2882 ?auto_2890 ) ) ( not ( = ?auto_2883 ?auto_2885 ) ) ( not ( = ?auto_2883 ?auto_2890 ) ) ( not ( = ?auto_2885 ?auto_2901 ) ) ( not ( = ?auto_2885 ?auto_2893 ) ) ( not ( = ?auto_2885 ?auto_2903 ) ) ( not ( = ?auto_2885 ?auto_2894 ) ) ( not ( = ?auto_2885 ?auto_2899 ) ) ( not ( = ?auto_2891 ?auto_2904 ) ) ( not ( = ?auto_2891 ?auto_2895 ) ) ( not ( = ?auto_2891 ?auto_2892 ) ) ( not ( = ?auto_2891 ?auto_2902 ) ) ( not ( = ?auto_2888 ?auto_2900 ) ) ( not ( = ?auto_2888 ?auto_2896 ) ) ( not ( = ?auto_2888 ?auto_2897 ) ) ( not ( = ?auto_2888 ?auto_2898 ) ) ( not ( = ?auto_2890 ?auto_2901 ) ) ( not ( = ?auto_2890 ?auto_2893 ) ) ( not ( = ?auto_2890 ?auto_2903 ) ) ( not ( = ?auto_2890 ?auto_2894 ) ) ( not ( = ?auto_2890 ?auto_2899 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_2879 ?auto_2880 ?auto_2881 ?auto_2882 ?auto_2883 ?auto_2884 )
      ( MAKE-1CRATE ?auto_2884 ?auto_2885 )
      ( MAKE-6CRATE-VERIFY ?auto_2879 ?auto_2880 ?auto_2881 ?auto_2882 ?auto_2883 ?auto_2884 ?auto_2885 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2923 - SURFACE
      ?auto_2924 - SURFACE
      ?auto_2925 - SURFACE
      ?auto_2926 - SURFACE
      ?auto_2927 - SURFACE
      ?auto_2928 - SURFACE
      ?auto_2929 - SURFACE
      ?auto_2930 - SURFACE
    )
    :vars
    (
      ?auto_2936 - HOIST
      ?auto_2933 - PLACE
      ?auto_2931 - PLACE
      ?auto_2934 - HOIST
      ?auto_2932 - SURFACE
      ?auto_2943 - PLACE
      ?auto_2949 - HOIST
      ?auto_2948 - SURFACE
      ?auto_2938 - SURFACE
      ?auto_2945 - PLACE
      ?auto_2941 - HOIST
      ?auto_2950 - SURFACE
      ?auto_2947 - PLACE
      ?auto_2939 - HOIST
      ?auto_2946 - SURFACE
      ?auto_2942 - PLACE
      ?auto_2944 - HOIST
      ?auto_2940 - SURFACE
      ?auto_2937 - SURFACE
      ?auto_2935 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2936 ?auto_2933 ) ( IS-CRATE ?auto_2930 ) ( not ( = ?auto_2931 ?auto_2933 ) ) ( HOIST-AT ?auto_2934 ?auto_2931 ) ( SURFACE-AT ?auto_2930 ?auto_2931 ) ( ON ?auto_2930 ?auto_2932 ) ( CLEAR ?auto_2930 ) ( not ( = ?auto_2929 ?auto_2930 ) ) ( not ( = ?auto_2929 ?auto_2932 ) ) ( not ( = ?auto_2930 ?auto_2932 ) ) ( not ( = ?auto_2936 ?auto_2934 ) ) ( IS-CRATE ?auto_2929 ) ( not ( = ?auto_2943 ?auto_2933 ) ) ( HOIST-AT ?auto_2949 ?auto_2943 ) ( AVAILABLE ?auto_2949 ) ( SURFACE-AT ?auto_2929 ?auto_2943 ) ( ON ?auto_2929 ?auto_2948 ) ( CLEAR ?auto_2929 ) ( not ( = ?auto_2928 ?auto_2929 ) ) ( not ( = ?auto_2928 ?auto_2948 ) ) ( not ( = ?auto_2929 ?auto_2948 ) ) ( not ( = ?auto_2936 ?auto_2949 ) ) ( IS-CRATE ?auto_2928 ) ( AVAILABLE ?auto_2934 ) ( SURFACE-AT ?auto_2928 ?auto_2931 ) ( ON ?auto_2928 ?auto_2938 ) ( CLEAR ?auto_2928 ) ( not ( = ?auto_2927 ?auto_2928 ) ) ( not ( = ?auto_2927 ?auto_2938 ) ) ( not ( = ?auto_2928 ?auto_2938 ) ) ( IS-CRATE ?auto_2927 ) ( not ( = ?auto_2945 ?auto_2933 ) ) ( HOIST-AT ?auto_2941 ?auto_2945 ) ( AVAILABLE ?auto_2941 ) ( SURFACE-AT ?auto_2927 ?auto_2945 ) ( ON ?auto_2927 ?auto_2950 ) ( CLEAR ?auto_2927 ) ( not ( = ?auto_2926 ?auto_2927 ) ) ( not ( = ?auto_2926 ?auto_2950 ) ) ( not ( = ?auto_2927 ?auto_2950 ) ) ( not ( = ?auto_2936 ?auto_2941 ) ) ( IS-CRATE ?auto_2926 ) ( not ( = ?auto_2947 ?auto_2933 ) ) ( HOIST-AT ?auto_2939 ?auto_2947 ) ( AVAILABLE ?auto_2939 ) ( SURFACE-AT ?auto_2926 ?auto_2947 ) ( ON ?auto_2926 ?auto_2946 ) ( CLEAR ?auto_2926 ) ( not ( = ?auto_2925 ?auto_2926 ) ) ( not ( = ?auto_2925 ?auto_2946 ) ) ( not ( = ?auto_2926 ?auto_2946 ) ) ( not ( = ?auto_2936 ?auto_2939 ) ) ( IS-CRATE ?auto_2925 ) ( not ( = ?auto_2942 ?auto_2933 ) ) ( HOIST-AT ?auto_2944 ?auto_2942 ) ( SURFACE-AT ?auto_2925 ?auto_2942 ) ( ON ?auto_2925 ?auto_2940 ) ( CLEAR ?auto_2925 ) ( not ( = ?auto_2924 ?auto_2925 ) ) ( not ( = ?auto_2924 ?auto_2940 ) ) ( not ( = ?auto_2925 ?auto_2940 ) ) ( not ( = ?auto_2936 ?auto_2944 ) ) ( SURFACE-AT ?auto_2923 ?auto_2933 ) ( CLEAR ?auto_2923 ) ( IS-CRATE ?auto_2924 ) ( AVAILABLE ?auto_2936 ) ( AVAILABLE ?auto_2944 ) ( SURFACE-AT ?auto_2924 ?auto_2942 ) ( ON ?auto_2924 ?auto_2937 ) ( CLEAR ?auto_2924 ) ( TRUCK-AT ?auto_2935 ?auto_2933 ) ( not ( = ?auto_2923 ?auto_2924 ) ) ( not ( = ?auto_2923 ?auto_2937 ) ) ( not ( = ?auto_2924 ?auto_2937 ) ) ( not ( = ?auto_2923 ?auto_2925 ) ) ( not ( = ?auto_2923 ?auto_2940 ) ) ( not ( = ?auto_2925 ?auto_2937 ) ) ( not ( = ?auto_2940 ?auto_2937 ) ) ( not ( = ?auto_2923 ?auto_2926 ) ) ( not ( = ?auto_2923 ?auto_2946 ) ) ( not ( = ?auto_2924 ?auto_2926 ) ) ( not ( = ?auto_2924 ?auto_2946 ) ) ( not ( = ?auto_2926 ?auto_2940 ) ) ( not ( = ?auto_2926 ?auto_2937 ) ) ( not ( = ?auto_2947 ?auto_2942 ) ) ( not ( = ?auto_2939 ?auto_2944 ) ) ( not ( = ?auto_2946 ?auto_2940 ) ) ( not ( = ?auto_2946 ?auto_2937 ) ) ( not ( = ?auto_2923 ?auto_2927 ) ) ( not ( = ?auto_2923 ?auto_2950 ) ) ( not ( = ?auto_2924 ?auto_2927 ) ) ( not ( = ?auto_2924 ?auto_2950 ) ) ( not ( = ?auto_2925 ?auto_2927 ) ) ( not ( = ?auto_2925 ?auto_2950 ) ) ( not ( = ?auto_2927 ?auto_2946 ) ) ( not ( = ?auto_2927 ?auto_2940 ) ) ( not ( = ?auto_2927 ?auto_2937 ) ) ( not ( = ?auto_2945 ?auto_2947 ) ) ( not ( = ?auto_2945 ?auto_2942 ) ) ( not ( = ?auto_2941 ?auto_2939 ) ) ( not ( = ?auto_2941 ?auto_2944 ) ) ( not ( = ?auto_2950 ?auto_2946 ) ) ( not ( = ?auto_2950 ?auto_2940 ) ) ( not ( = ?auto_2950 ?auto_2937 ) ) ( not ( = ?auto_2923 ?auto_2928 ) ) ( not ( = ?auto_2923 ?auto_2938 ) ) ( not ( = ?auto_2924 ?auto_2928 ) ) ( not ( = ?auto_2924 ?auto_2938 ) ) ( not ( = ?auto_2925 ?auto_2928 ) ) ( not ( = ?auto_2925 ?auto_2938 ) ) ( not ( = ?auto_2926 ?auto_2928 ) ) ( not ( = ?auto_2926 ?auto_2938 ) ) ( not ( = ?auto_2928 ?auto_2950 ) ) ( not ( = ?auto_2928 ?auto_2946 ) ) ( not ( = ?auto_2928 ?auto_2940 ) ) ( not ( = ?auto_2928 ?auto_2937 ) ) ( not ( = ?auto_2931 ?auto_2945 ) ) ( not ( = ?auto_2931 ?auto_2947 ) ) ( not ( = ?auto_2931 ?auto_2942 ) ) ( not ( = ?auto_2934 ?auto_2941 ) ) ( not ( = ?auto_2934 ?auto_2939 ) ) ( not ( = ?auto_2934 ?auto_2944 ) ) ( not ( = ?auto_2938 ?auto_2950 ) ) ( not ( = ?auto_2938 ?auto_2946 ) ) ( not ( = ?auto_2938 ?auto_2940 ) ) ( not ( = ?auto_2938 ?auto_2937 ) ) ( not ( = ?auto_2923 ?auto_2929 ) ) ( not ( = ?auto_2923 ?auto_2948 ) ) ( not ( = ?auto_2924 ?auto_2929 ) ) ( not ( = ?auto_2924 ?auto_2948 ) ) ( not ( = ?auto_2925 ?auto_2929 ) ) ( not ( = ?auto_2925 ?auto_2948 ) ) ( not ( = ?auto_2926 ?auto_2929 ) ) ( not ( = ?auto_2926 ?auto_2948 ) ) ( not ( = ?auto_2927 ?auto_2929 ) ) ( not ( = ?auto_2927 ?auto_2948 ) ) ( not ( = ?auto_2929 ?auto_2938 ) ) ( not ( = ?auto_2929 ?auto_2950 ) ) ( not ( = ?auto_2929 ?auto_2946 ) ) ( not ( = ?auto_2929 ?auto_2940 ) ) ( not ( = ?auto_2929 ?auto_2937 ) ) ( not ( = ?auto_2943 ?auto_2931 ) ) ( not ( = ?auto_2943 ?auto_2945 ) ) ( not ( = ?auto_2943 ?auto_2947 ) ) ( not ( = ?auto_2943 ?auto_2942 ) ) ( not ( = ?auto_2949 ?auto_2934 ) ) ( not ( = ?auto_2949 ?auto_2941 ) ) ( not ( = ?auto_2949 ?auto_2939 ) ) ( not ( = ?auto_2949 ?auto_2944 ) ) ( not ( = ?auto_2948 ?auto_2938 ) ) ( not ( = ?auto_2948 ?auto_2950 ) ) ( not ( = ?auto_2948 ?auto_2946 ) ) ( not ( = ?auto_2948 ?auto_2940 ) ) ( not ( = ?auto_2948 ?auto_2937 ) ) ( not ( = ?auto_2923 ?auto_2930 ) ) ( not ( = ?auto_2923 ?auto_2932 ) ) ( not ( = ?auto_2924 ?auto_2930 ) ) ( not ( = ?auto_2924 ?auto_2932 ) ) ( not ( = ?auto_2925 ?auto_2930 ) ) ( not ( = ?auto_2925 ?auto_2932 ) ) ( not ( = ?auto_2926 ?auto_2930 ) ) ( not ( = ?auto_2926 ?auto_2932 ) ) ( not ( = ?auto_2927 ?auto_2930 ) ) ( not ( = ?auto_2927 ?auto_2932 ) ) ( not ( = ?auto_2928 ?auto_2930 ) ) ( not ( = ?auto_2928 ?auto_2932 ) ) ( not ( = ?auto_2930 ?auto_2948 ) ) ( not ( = ?auto_2930 ?auto_2938 ) ) ( not ( = ?auto_2930 ?auto_2950 ) ) ( not ( = ?auto_2930 ?auto_2946 ) ) ( not ( = ?auto_2930 ?auto_2940 ) ) ( not ( = ?auto_2930 ?auto_2937 ) ) ( not ( = ?auto_2932 ?auto_2948 ) ) ( not ( = ?auto_2932 ?auto_2938 ) ) ( not ( = ?auto_2932 ?auto_2950 ) ) ( not ( = ?auto_2932 ?auto_2946 ) ) ( not ( = ?auto_2932 ?auto_2940 ) ) ( not ( = ?auto_2932 ?auto_2937 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_2923 ?auto_2924 ?auto_2925 ?auto_2926 ?auto_2927 ?auto_2928 ?auto_2929 )
      ( MAKE-1CRATE ?auto_2929 ?auto_2930 )
      ( MAKE-7CRATE-VERIFY ?auto_2923 ?auto_2924 ?auto_2925 ?auto_2926 ?auto_2927 ?auto_2928 ?auto_2929 ?auto_2930 ) )
  )

)

