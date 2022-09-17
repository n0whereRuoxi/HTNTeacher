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
      ?auto_2812 - SURFACE
      ?auto_2813 - SURFACE
    )
    :vars
    (
      ?auto_2814 - HOIST
      ?auto_2815 - PLACE
      ?auto_2817 - PLACE
      ?auto_2818 - HOIST
      ?auto_2819 - SURFACE
      ?auto_2816 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2814 ?auto_2815 ) ( SURFACE-AT ?auto_2813 ?auto_2815 ) ( CLEAR ?auto_2813 ) ( IS-CRATE ?auto_2812 ) ( AVAILABLE ?auto_2814 ) ( not ( = ?auto_2817 ?auto_2815 ) ) ( HOIST-AT ?auto_2818 ?auto_2817 ) ( AVAILABLE ?auto_2818 ) ( SURFACE-AT ?auto_2812 ?auto_2817 ) ( ON ?auto_2812 ?auto_2819 ) ( CLEAR ?auto_2812 ) ( TRUCK-AT ?auto_2816 ?auto_2815 ) ( not ( = ?auto_2812 ?auto_2813 ) ) ( not ( = ?auto_2812 ?auto_2819 ) ) ( not ( = ?auto_2813 ?auto_2819 ) ) ( not ( = ?auto_2814 ?auto_2818 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2816 ?auto_2815 ?auto_2817 )
      ( !LIFT ?auto_2818 ?auto_2812 ?auto_2819 ?auto_2817 )
      ( !LOAD ?auto_2818 ?auto_2812 ?auto_2816 ?auto_2817 )
      ( !DRIVE ?auto_2816 ?auto_2817 ?auto_2815 )
      ( !UNLOAD ?auto_2814 ?auto_2812 ?auto_2816 ?auto_2815 )
      ( !DROP ?auto_2814 ?auto_2812 ?auto_2813 ?auto_2815 )
      ( MAKE-ON-VERIFY ?auto_2812 ?auto_2813 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2822 - SURFACE
      ?auto_2823 - SURFACE
    )
    :vars
    (
      ?auto_2824 - HOIST
      ?auto_2825 - PLACE
      ?auto_2827 - PLACE
      ?auto_2828 - HOIST
      ?auto_2829 - SURFACE
      ?auto_2826 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2824 ?auto_2825 ) ( SURFACE-AT ?auto_2823 ?auto_2825 ) ( CLEAR ?auto_2823 ) ( IS-CRATE ?auto_2822 ) ( AVAILABLE ?auto_2824 ) ( not ( = ?auto_2827 ?auto_2825 ) ) ( HOIST-AT ?auto_2828 ?auto_2827 ) ( AVAILABLE ?auto_2828 ) ( SURFACE-AT ?auto_2822 ?auto_2827 ) ( ON ?auto_2822 ?auto_2829 ) ( CLEAR ?auto_2822 ) ( TRUCK-AT ?auto_2826 ?auto_2825 ) ( not ( = ?auto_2822 ?auto_2823 ) ) ( not ( = ?auto_2822 ?auto_2829 ) ) ( not ( = ?auto_2823 ?auto_2829 ) ) ( not ( = ?auto_2824 ?auto_2828 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2826 ?auto_2825 ?auto_2827 )
      ( !LIFT ?auto_2828 ?auto_2822 ?auto_2829 ?auto_2827 )
      ( !LOAD ?auto_2828 ?auto_2822 ?auto_2826 ?auto_2827 )
      ( !DRIVE ?auto_2826 ?auto_2827 ?auto_2825 )
      ( !UNLOAD ?auto_2824 ?auto_2822 ?auto_2826 ?auto_2825 )
      ( !DROP ?auto_2824 ?auto_2822 ?auto_2823 ?auto_2825 )
      ( MAKE-ON-VERIFY ?auto_2822 ?auto_2823 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2832 - SURFACE
      ?auto_2833 - SURFACE
    )
    :vars
    (
      ?auto_2834 - HOIST
      ?auto_2835 - PLACE
      ?auto_2837 - PLACE
      ?auto_2838 - HOIST
      ?auto_2839 - SURFACE
      ?auto_2836 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2834 ?auto_2835 ) ( SURFACE-AT ?auto_2833 ?auto_2835 ) ( CLEAR ?auto_2833 ) ( IS-CRATE ?auto_2832 ) ( AVAILABLE ?auto_2834 ) ( not ( = ?auto_2837 ?auto_2835 ) ) ( HOIST-AT ?auto_2838 ?auto_2837 ) ( AVAILABLE ?auto_2838 ) ( SURFACE-AT ?auto_2832 ?auto_2837 ) ( ON ?auto_2832 ?auto_2839 ) ( CLEAR ?auto_2832 ) ( TRUCK-AT ?auto_2836 ?auto_2835 ) ( not ( = ?auto_2832 ?auto_2833 ) ) ( not ( = ?auto_2832 ?auto_2839 ) ) ( not ( = ?auto_2833 ?auto_2839 ) ) ( not ( = ?auto_2834 ?auto_2838 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2836 ?auto_2835 ?auto_2837 )
      ( !LIFT ?auto_2838 ?auto_2832 ?auto_2839 ?auto_2837 )
      ( !LOAD ?auto_2838 ?auto_2832 ?auto_2836 ?auto_2837 )
      ( !DRIVE ?auto_2836 ?auto_2837 ?auto_2835 )
      ( !UNLOAD ?auto_2834 ?auto_2832 ?auto_2836 ?auto_2835 )
      ( !DROP ?auto_2834 ?auto_2832 ?auto_2833 ?auto_2835 )
      ( MAKE-ON-VERIFY ?auto_2832 ?auto_2833 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2842 - SURFACE
      ?auto_2843 - SURFACE
    )
    :vars
    (
      ?auto_2844 - HOIST
      ?auto_2845 - PLACE
      ?auto_2847 - PLACE
      ?auto_2848 - HOIST
      ?auto_2849 - SURFACE
      ?auto_2846 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2844 ?auto_2845 ) ( SURFACE-AT ?auto_2843 ?auto_2845 ) ( CLEAR ?auto_2843 ) ( IS-CRATE ?auto_2842 ) ( AVAILABLE ?auto_2844 ) ( not ( = ?auto_2847 ?auto_2845 ) ) ( HOIST-AT ?auto_2848 ?auto_2847 ) ( AVAILABLE ?auto_2848 ) ( SURFACE-AT ?auto_2842 ?auto_2847 ) ( ON ?auto_2842 ?auto_2849 ) ( CLEAR ?auto_2842 ) ( TRUCK-AT ?auto_2846 ?auto_2845 ) ( not ( = ?auto_2842 ?auto_2843 ) ) ( not ( = ?auto_2842 ?auto_2849 ) ) ( not ( = ?auto_2843 ?auto_2849 ) ) ( not ( = ?auto_2844 ?auto_2848 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2846 ?auto_2845 ?auto_2847 )
      ( !LIFT ?auto_2848 ?auto_2842 ?auto_2849 ?auto_2847 )
      ( !LOAD ?auto_2848 ?auto_2842 ?auto_2846 ?auto_2847 )
      ( !DRIVE ?auto_2846 ?auto_2847 ?auto_2845 )
      ( !UNLOAD ?auto_2844 ?auto_2842 ?auto_2846 ?auto_2845 )
      ( !DROP ?auto_2844 ?auto_2842 ?auto_2843 ?auto_2845 )
      ( MAKE-ON-VERIFY ?auto_2842 ?auto_2843 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2852 - SURFACE
      ?auto_2853 - SURFACE
    )
    :vars
    (
      ?auto_2854 - HOIST
      ?auto_2855 - PLACE
      ?auto_2857 - PLACE
      ?auto_2858 - HOIST
      ?auto_2859 - SURFACE
      ?auto_2856 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2854 ?auto_2855 ) ( SURFACE-AT ?auto_2853 ?auto_2855 ) ( CLEAR ?auto_2853 ) ( IS-CRATE ?auto_2852 ) ( AVAILABLE ?auto_2854 ) ( not ( = ?auto_2857 ?auto_2855 ) ) ( HOIST-AT ?auto_2858 ?auto_2857 ) ( AVAILABLE ?auto_2858 ) ( SURFACE-AT ?auto_2852 ?auto_2857 ) ( ON ?auto_2852 ?auto_2859 ) ( CLEAR ?auto_2852 ) ( TRUCK-AT ?auto_2856 ?auto_2855 ) ( not ( = ?auto_2852 ?auto_2853 ) ) ( not ( = ?auto_2852 ?auto_2859 ) ) ( not ( = ?auto_2853 ?auto_2859 ) ) ( not ( = ?auto_2854 ?auto_2858 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2856 ?auto_2855 ?auto_2857 )
      ( !LIFT ?auto_2858 ?auto_2852 ?auto_2859 ?auto_2857 )
      ( !LOAD ?auto_2858 ?auto_2852 ?auto_2856 ?auto_2857 )
      ( !DRIVE ?auto_2856 ?auto_2857 ?auto_2855 )
      ( !UNLOAD ?auto_2854 ?auto_2852 ?auto_2856 ?auto_2855 )
      ( !DROP ?auto_2854 ?auto_2852 ?auto_2853 ?auto_2855 )
      ( MAKE-ON-VERIFY ?auto_2852 ?auto_2853 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2862 - SURFACE
      ?auto_2863 - SURFACE
    )
    :vars
    (
      ?auto_2864 - HOIST
      ?auto_2865 - PLACE
      ?auto_2867 - PLACE
      ?auto_2868 - HOIST
      ?auto_2869 - SURFACE
      ?auto_2866 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2864 ?auto_2865 ) ( SURFACE-AT ?auto_2863 ?auto_2865 ) ( CLEAR ?auto_2863 ) ( IS-CRATE ?auto_2862 ) ( AVAILABLE ?auto_2864 ) ( not ( = ?auto_2867 ?auto_2865 ) ) ( HOIST-AT ?auto_2868 ?auto_2867 ) ( AVAILABLE ?auto_2868 ) ( SURFACE-AT ?auto_2862 ?auto_2867 ) ( ON ?auto_2862 ?auto_2869 ) ( CLEAR ?auto_2862 ) ( TRUCK-AT ?auto_2866 ?auto_2865 ) ( not ( = ?auto_2862 ?auto_2863 ) ) ( not ( = ?auto_2862 ?auto_2869 ) ) ( not ( = ?auto_2863 ?auto_2869 ) ) ( not ( = ?auto_2864 ?auto_2868 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2866 ?auto_2865 ?auto_2867 )
      ( !LIFT ?auto_2868 ?auto_2862 ?auto_2869 ?auto_2867 )
      ( !LOAD ?auto_2868 ?auto_2862 ?auto_2866 ?auto_2867 )
      ( !DRIVE ?auto_2866 ?auto_2867 ?auto_2865 )
      ( !UNLOAD ?auto_2864 ?auto_2862 ?auto_2866 ?auto_2865 )
      ( !DROP ?auto_2864 ?auto_2862 ?auto_2863 ?auto_2865 )
      ( MAKE-ON-VERIFY ?auto_2862 ?auto_2863 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2872 - SURFACE
      ?auto_2873 - SURFACE
    )
    :vars
    (
      ?auto_2874 - HOIST
      ?auto_2875 - PLACE
      ?auto_2877 - PLACE
      ?auto_2878 - HOIST
      ?auto_2879 - SURFACE
      ?auto_2876 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2874 ?auto_2875 ) ( SURFACE-AT ?auto_2873 ?auto_2875 ) ( CLEAR ?auto_2873 ) ( IS-CRATE ?auto_2872 ) ( AVAILABLE ?auto_2874 ) ( not ( = ?auto_2877 ?auto_2875 ) ) ( HOIST-AT ?auto_2878 ?auto_2877 ) ( AVAILABLE ?auto_2878 ) ( SURFACE-AT ?auto_2872 ?auto_2877 ) ( ON ?auto_2872 ?auto_2879 ) ( CLEAR ?auto_2872 ) ( TRUCK-AT ?auto_2876 ?auto_2875 ) ( not ( = ?auto_2872 ?auto_2873 ) ) ( not ( = ?auto_2872 ?auto_2879 ) ) ( not ( = ?auto_2873 ?auto_2879 ) ) ( not ( = ?auto_2874 ?auto_2878 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2876 ?auto_2875 ?auto_2877 )
      ( !LIFT ?auto_2878 ?auto_2872 ?auto_2879 ?auto_2877 )
      ( !LOAD ?auto_2878 ?auto_2872 ?auto_2876 ?auto_2877 )
      ( !DRIVE ?auto_2876 ?auto_2877 ?auto_2875 )
      ( !UNLOAD ?auto_2874 ?auto_2872 ?auto_2876 ?auto_2875 )
      ( !DROP ?auto_2874 ?auto_2872 ?auto_2873 ?auto_2875 )
      ( MAKE-ON-VERIFY ?auto_2872 ?auto_2873 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2882 - SURFACE
      ?auto_2883 - SURFACE
    )
    :vars
    (
      ?auto_2884 - HOIST
      ?auto_2885 - PLACE
      ?auto_2887 - PLACE
      ?auto_2888 - HOIST
      ?auto_2889 - SURFACE
      ?auto_2886 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2884 ?auto_2885 ) ( SURFACE-AT ?auto_2883 ?auto_2885 ) ( CLEAR ?auto_2883 ) ( IS-CRATE ?auto_2882 ) ( AVAILABLE ?auto_2884 ) ( not ( = ?auto_2887 ?auto_2885 ) ) ( HOIST-AT ?auto_2888 ?auto_2887 ) ( AVAILABLE ?auto_2888 ) ( SURFACE-AT ?auto_2882 ?auto_2887 ) ( ON ?auto_2882 ?auto_2889 ) ( CLEAR ?auto_2882 ) ( TRUCK-AT ?auto_2886 ?auto_2885 ) ( not ( = ?auto_2882 ?auto_2883 ) ) ( not ( = ?auto_2882 ?auto_2889 ) ) ( not ( = ?auto_2883 ?auto_2889 ) ) ( not ( = ?auto_2884 ?auto_2888 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2886 ?auto_2885 ?auto_2887 )
      ( !LIFT ?auto_2888 ?auto_2882 ?auto_2889 ?auto_2887 )
      ( !LOAD ?auto_2888 ?auto_2882 ?auto_2886 ?auto_2887 )
      ( !DRIVE ?auto_2886 ?auto_2887 ?auto_2885 )
      ( !UNLOAD ?auto_2884 ?auto_2882 ?auto_2886 ?auto_2885 )
      ( !DROP ?auto_2884 ?auto_2882 ?auto_2883 ?auto_2885 )
      ( MAKE-ON-VERIFY ?auto_2882 ?auto_2883 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2892 - SURFACE
      ?auto_2893 - SURFACE
    )
    :vars
    (
      ?auto_2894 - HOIST
      ?auto_2895 - PLACE
      ?auto_2897 - PLACE
      ?auto_2898 - HOIST
      ?auto_2899 - SURFACE
      ?auto_2896 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2894 ?auto_2895 ) ( SURFACE-AT ?auto_2893 ?auto_2895 ) ( CLEAR ?auto_2893 ) ( IS-CRATE ?auto_2892 ) ( AVAILABLE ?auto_2894 ) ( not ( = ?auto_2897 ?auto_2895 ) ) ( HOIST-AT ?auto_2898 ?auto_2897 ) ( AVAILABLE ?auto_2898 ) ( SURFACE-AT ?auto_2892 ?auto_2897 ) ( ON ?auto_2892 ?auto_2899 ) ( CLEAR ?auto_2892 ) ( TRUCK-AT ?auto_2896 ?auto_2895 ) ( not ( = ?auto_2892 ?auto_2893 ) ) ( not ( = ?auto_2892 ?auto_2899 ) ) ( not ( = ?auto_2893 ?auto_2899 ) ) ( not ( = ?auto_2894 ?auto_2898 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2896 ?auto_2895 ?auto_2897 )
      ( !LIFT ?auto_2898 ?auto_2892 ?auto_2899 ?auto_2897 )
      ( !LOAD ?auto_2898 ?auto_2892 ?auto_2896 ?auto_2897 )
      ( !DRIVE ?auto_2896 ?auto_2897 ?auto_2895 )
      ( !UNLOAD ?auto_2894 ?auto_2892 ?auto_2896 ?auto_2895 )
      ( !DROP ?auto_2894 ?auto_2892 ?auto_2893 ?auto_2895 )
      ( MAKE-ON-VERIFY ?auto_2892 ?auto_2893 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2902 - SURFACE
      ?auto_2903 - SURFACE
    )
    :vars
    (
      ?auto_2904 - HOIST
      ?auto_2905 - PLACE
      ?auto_2907 - PLACE
      ?auto_2908 - HOIST
      ?auto_2909 - SURFACE
      ?auto_2906 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2904 ?auto_2905 ) ( SURFACE-AT ?auto_2903 ?auto_2905 ) ( CLEAR ?auto_2903 ) ( IS-CRATE ?auto_2902 ) ( AVAILABLE ?auto_2904 ) ( not ( = ?auto_2907 ?auto_2905 ) ) ( HOIST-AT ?auto_2908 ?auto_2907 ) ( AVAILABLE ?auto_2908 ) ( SURFACE-AT ?auto_2902 ?auto_2907 ) ( ON ?auto_2902 ?auto_2909 ) ( CLEAR ?auto_2902 ) ( TRUCK-AT ?auto_2906 ?auto_2905 ) ( not ( = ?auto_2902 ?auto_2903 ) ) ( not ( = ?auto_2902 ?auto_2909 ) ) ( not ( = ?auto_2903 ?auto_2909 ) ) ( not ( = ?auto_2904 ?auto_2908 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2906 ?auto_2905 ?auto_2907 )
      ( !LIFT ?auto_2908 ?auto_2902 ?auto_2909 ?auto_2907 )
      ( !LOAD ?auto_2908 ?auto_2902 ?auto_2906 ?auto_2907 )
      ( !DRIVE ?auto_2906 ?auto_2907 ?auto_2905 )
      ( !UNLOAD ?auto_2904 ?auto_2902 ?auto_2906 ?auto_2905 )
      ( !DROP ?auto_2904 ?auto_2902 ?auto_2903 ?auto_2905 )
      ( MAKE-ON-VERIFY ?auto_2902 ?auto_2903 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2912 - SURFACE
      ?auto_2913 - SURFACE
    )
    :vars
    (
      ?auto_2914 - HOIST
      ?auto_2915 - PLACE
      ?auto_2917 - PLACE
      ?auto_2918 - HOIST
      ?auto_2919 - SURFACE
      ?auto_2916 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2914 ?auto_2915 ) ( SURFACE-AT ?auto_2913 ?auto_2915 ) ( CLEAR ?auto_2913 ) ( IS-CRATE ?auto_2912 ) ( AVAILABLE ?auto_2914 ) ( not ( = ?auto_2917 ?auto_2915 ) ) ( HOIST-AT ?auto_2918 ?auto_2917 ) ( AVAILABLE ?auto_2918 ) ( SURFACE-AT ?auto_2912 ?auto_2917 ) ( ON ?auto_2912 ?auto_2919 ) ( CLEAR ?auto_2912 ) ( TRUCK-AT ?auto_2916 ?auto_2915 ) ( not ( = ?auto_2912 ?auto_2913 ) ) ( not ( = ?auto_2912 ?auto_2919 ) ) ( not ( = ?auto_2913 ?auto_2919 ) ) ( not ( = ?auto_2914 ?auto_2918 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2916 ?auto_2915 ?auto_2917 )
      ( !LIFT ?auto_2918 ?auto_2912 ?auto_2919 ?auto_2917 )
      ( !LOAD ?auto_2918 ?auto_2912 ?auto_2916 ?auto_2917 )
      ( !DRIVE ?auto_2916 ?auto_2917 ?auto_2915 )
      ( !UNLOAD ?auto_2914 ?auto_2912 ?auto_2916 ?auto_2915 )
      ( !DROP ?auto_2914 ?auto_2912 ?auto_2913 ?auto_2915 )
      ( MAKE-ON-VERIFY ?auto_2912 ?auto_2913 ) )
  )

)

