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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_10838 - SURFACE
      ?auto_10839 - SURFACE
    )
    :vars
    (
      ?auto_10840 - HOIST
      ?auto_10841 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10840 ?auto_10841 ) ( SURFACE-AT ?auto_10838 ?auto_10841 ) ( CLEAR ?auto_10838 ) ( LIFTING ?auto_10840 ?auto_10839 ) ( IS-CRATE ?auto_10839 ) ( not ( = ?auto_10838 ?auto_10839 ) ) )
    :subtasks
    ( ( !DROP ?auto_10840 ?auto_10839 ?auto_10838 ?auto_10841 )
      ( MAKE-1CRATE-VERIFY ?auto_10838 ?auto_10839 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_10842 - SURFACE
      ?auto_10843 - SURFACE
    )
    :vars
    (
      ?auto_10845 - HOIST
      ?auto_10844 - PLACE
      ?auto_10846 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10845 ?auto_10844 ) ( SURFACE-AT ?auto_10842 ?auto_10844 ) ( CLEAR ?auto_10842 ) ( IS-CRATE ?auto_10843 ) ( not ( = ?auto_10842 ?auto_10843 ) ) ( TRUCK-AT ?auto_10846 ?auto_10844 ) ( AVAILABLE ?auto_10845 ) ( IN ?auto_10843 ?auto_10846 ) )
    :subtasks
    ( ( !UNLOAD ?auto_10845 ?auto_10843 ?auto_10846 ?auto_10844 )
      ( MAKE-1CRATE ?auto_10842 ?auto_10843 )
      ( MAKE-1CRATE-VERIFY ?auto_10842 ?auto_10843 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_10847 - SURFACE
      ?auto_10848 - SURFACE
    )
    :vars
    (
      ?auto_10849 - HOIST
      ?auto_10850 - PLACE
      ?auto_10851 - TRUCK
      ?auto_10852 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10849 ?auto_10850 ) ( SURFACE-AT ?auto_10847 ?auto_10850 ) ( CLEAR ?auto_10847 ) ( IS-CRATE ?auto_10848 ) ( not ( = ?auto_10847 ?auto_10848 ) ) ( AVAILABLE ?auto_10849 ) ( IN ?auto_10848 ?auto_10851 ) ( TRUCK-AT ?auto_10851 ?auto_10852 ) ( not ( = ?auto_10852 ?auto_10850 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_10851 ?auto_10852 ?auto_10850 )
      ( MAKE-1CRATE ?auto_10847 ?auto_10848 )
      ( MAKE-1CRATE-VERIFY ?auto_10847 ?auto_10848 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_10853 - SURFACE
      ?auto_10854 - SURFACE
    )
    :vars
    (
      ?auto_10856 - HOIST
      ?auto_10857 - PLACE
      ?auto_10855 - TRUCK
      ?auto_10858 - PLACE
      ?auto_10859 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_10856 ?auto_10857 ) ( SURFACE-AT ?auto_10853 ?auto_10857 ) ( CLEAR ?auto_10853 ) ( IS-CRATE ?auto_10854 ) ( not ( = ?auto_10853 ?auto_10854 ) ) ( AVAILABLE ?auto_10856 ) ( TRUCK-AT ?auto_10855 ?auto_10858 ) ( not ( = ?auto_10858 ?auto_10857 ) ) ( HOIST-AT ?auto_10859 ?auto_10858 ) ( LIFTING ?auto_10859 ?auto_10854 ) ( not ( = ?auto_10856 ?auto_10859 ) ) )
    :subtasks
    ( ( !LOAD ?auto_10859 ?auto_10854 ?auto_10855 ?auto_10858 )
      ( MAKE-1CRATE ?auto_10853 ?auto_10854 )
      ( MAKE-1CRATE-VERIFY ?auto_10853 ?auto_10854 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_10860 - SURFACE
      ?auto_10861 - SURFACE
    )
    :vars
    (
      ?auto_10865 - HOIST
      ?auto_10863 - PLACE
      ?auto_10866 - TRUCK
      ?auto_10864 - PLACE
      ?auto_10862 - HOIST
      ?auto_10867 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10865 ?auto_10863 ) ( SURFACE-AT ?auto_10860 ?auto_10863 ) ( CLEAR ?auto_10860 ) ( IS-CRATE ?auto_10861 ) ( not ( = ?auto_10860 ?auto_10861 ) ) ( AVAILABLE ?auto_10865 ) ( TRUCK-AT ?auto_10866 ?auto_10864 ) ( not ( = ?auto_10864 ?auto_10863 ) ) ( HOIST-AT ?auto_10862 ?auto_10864 ) ( not ( = ?auto_10865 ?auto_10862 ) ) ( AVAILABLE ?auto_10862 ) ( SURFACE-AT ?auto_10861 ?auto_10864 ) ( ON ?auto_10861 ?auto_10867 ) ( CLEAR ?auto_10861 ) ( not ( = ?auto_10860 ?auto_10867 ) ) ( not ( = ?auto_10861 ?auto_10867 ) ) )
    :subtasks
    ( ( !LIFT ?auto_10862 ?auto_10861 ?auto_10867 ?auto_10864 )
      ( MAKE-1CRATE ?auto_10860 ?auto_10861 )
      ( MAKE-1CRATE-VERIFY ?auto_10860 ?auto_10861 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_10868 - SURFACE
      ?auto_10869 - SURFACE
    )
    :vars
    (
      ?auto_10873 - HOIST
      ?auto_10872 - PLACE
      ?auto_10875 - PLACE
      ?auto_10871 - HOIST
      ?auto_10870 - SURFACE
      ?auto_10874 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10873 ?auto_10872 ) ( SURFACE-AT ?auto_10868 ?auto_10872 ) ( CLEAR ?auto_10868 ) ( IS-CRATE ?auto_10869 ) ( not ( = ?auto_10868 ?auto_10869 ) ) ( AVAILABLE ?auto_10873 ) ( not ( = ?auto_10875 ?auto_10872 ) ) ( HOIST-AT ?auto_10871 ?auto_10875 ) ( not ( = ?auto_10873 ?auto_10871 ) ) ( AVAILABLE ?auto_10871 ) ( SURFACE-AT ?auto_10869 ?auto_10875 ) ( ON ?auto_10869 ?auto_10870 ) ( CLEAR ?auto_10869 ) ( not ( = ?auto_10868 ?auto_10870 ) ) ( not ( = ?auto_10869 ?auto_10870 ) ) ( TRUCK-AT ?auto_10874 ?auto_10872 ) )
    :subtasks
    ( ( !DRIVE ?auto_10874 ?auto_10872 ?auto_10875 )
      ( MAKE-1CRATE ?auto_10868 ?auto_10869 )
      ( MAKE-1CRATE-VERIFY ?auto_10868 ?auto_10869 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_10885 - SURFACE
      ?auto_10886 - SURFACE
      ?auto_10887 - SURFACE
    )
    :vars
    (
      ?auto_10889 - HOIST
      ?auto_10888 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10889 ?auto_10888 ) ( SURFACE-AT ?auto_10886 ?auto_10888 ) ( CLEAR ?auto_10886 ) ( LIFTING ?auto_10889 ?auto_10887 ) ( IS-CRATE ?auto_10887 ) ( not ( = ?auto_10886 ?auto_10887 ) ) ( ON ?auto_10886 ?auto_10885 ) ( not ( = ?auto_10885 ?auto_10886 ) ) ( not ( = ?auto_10885 ?auto_10887 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_10886 ?auto_10887 )
      ( MAKE-2CRATE-VERIFY ?auto_10885 ?auto_10886 ?auto_10887 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_10895 - SURFACE
      ?auto_10896 - SURFACE
      ?auto_10897 - SURFACE
    )
    :vars
    (
      ?auto_10898 - HOIST
      ?auto_10900 - PLACE
      ?auto_10899 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10898 ?auto_10900 ) ( SURFACE-AT ?auto_10896 ?auto_10900 ) ( CLEAR ?auto_10896 ) ( IS-CRATE ?auto_10897 ) ( not ( = ?auto_10896 ?auto_10897 ) ) ( TRUCK-AT ?auto_10899 ?auto_10900 ) ( AVAILABLE ?auto_10898 ) ( IN ?auto_10897 ?auto_10899 ) ( ON ?auto_10896 ?auto_10895 ) ( not ( = ?auto_10895 ?auto_10896 ) ) ( not ( = ?auto_10895 ?auto_10897 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_10896 ?auto_10897 )
      ( MAKE-2CRATE-VERIFY ?auto_10895 ?auto_10896 ?auto_10897 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_10901 - SURFACE
      ?auto_10902 - SURFACE
    )
    :vars
    (
      ?auto_10904 - HOIST
      ?auto_10906 - PLACE
      ?auto_10903 - TRUCK
      ?auto_10905 - SURFACE
      ?auto_10907 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10904 ?auto_10906 ) ( SURFACE-AT ?auto_10901 ?auto_10906 ) ( CLEAR ?auto_10901 ) ( IS-CRATE ?auto_10902 ) ( not ( = ?auto_10901 ?auto_10902 ) ) ( AVAILABLE ?auto_10904 ) ( IN ?auto_10902 ?auto_10903 ) ( ON ?auto_10901 ?auto_10905 ) ( not ( = ?auto_10905 ?auto_10901 ) ) ( not ( = ?auto_10905 ?auto_10902 ) ) ( TRUCK-AT ?auto_10903 ?auto_10907 ) ( not ( = ?auto_10907 ?auto_10906 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_10903 ?auto_10907 ?auto_10906 )
      ( MAKE-2CRATE ?auto_10905 ?auto_10901 ?auto_10902 )
      ( MAKE-1CRATE-VERIFY ?auto_10901 ?auto_10902 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_10908 - SURFACE
      ?auto_10909 - SURFACE
      ?auto_10910 - SURFACE
    )
    :vars
    (
      ?auto_10912 - HOIST
      ?auto_10911 - PLACE
      ?auto_10913 - TRUCK
      ?auto_10914 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10912 ?auto_10911 ) ( SURFACE-AT ?auto_10909 ?auto_10911 ) ( CLEAR ?auto_10909 ) ( IS-CRATE ?auto_10910 ) ( not ( = ?auto_10909 ?auto_10910 ) ) ( AVAILABLE ?auto_10912 ) ( IN ?auto_10910 ?auto_10913 ) ( ON ?auto_10909 ?auto_10908 ) ( not ( = ?auto_10908 ?auto_10909 ) ) ( not ( = ?auto_10908 ?auto_10910 ) ) ( TRUCK-AT ?auto_10913 ?auto_10914 ) ( not ( = ?auto_10914 ?auto_10911 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_10909 ?auto_10910 )
      ( MAKE-2CRATE-VERIFY ?auto_10908 ?auto_10909 ?auto_10910 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_10915 - SURFACE
      ?auto_10916 - SURFACE
    )
    :vars
    (
      ?auto_10918 - HOIST
      ?auto_10920 - PLACE
      ?auto_10919 - SURFACE
      ?auto_10917 - TRUCK
      ?auto_10921 - PLACE
      ?auto_10922 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_10918 ?auto_10920 ) ( SURFACE-AT ?auto_10915 ?auto_10920 ) ( CLEAR ?auto_10915 ) ( IS-CRATE ?auto_10916 ) ( not ( = ?auto_10915 ?auto_10916 ) ) ( AVAILABLE ?auto_10918 ) ( ON ?auto_10915 ?auto_10919 ) ( not ( = ?auto_10919 ?auto_10915 ) ) ( not ( = ?auto_10919 ?auto_10916 ) ) ( TRUCK-AT ?auto_10917 ?auto_10921 ) ( not ( = ?auto_10921 ?auto_10920 ) ) ( HOIST-AT ?auto_10922 ?auto_10921 ) ( LIFTING ?auto_10922 ?auto_10916 ) ( not ( = ?auto_10918 ?auto_10922 ) ) )
    :subtasks
    ( ( !LOAD ?auto_10922 ?auto_10916 ?auto_10917 ?auto_10921 )
      ( MAKE-2CRATE ?auto_10919 ?auto_10915 ?auto_10916 )
      ( MAKE-1CRATE-VERIFY ?auto_10915 ?auto_10916 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_10923 - SURFACE
      ?auto_10924 - SURFACE
      ?auto_10925 - SURFACE
    )
    :vars
    (
      ?auto_10928 - HOIST
      ?auto_10930 - PLACE
      ?auto_10927 - TRUCK
      ?auto_10929 - PLACE
      ?auto_10926 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_10928 ?auto_10930 ) ( SURFACE-AT ?auto_10924 ?auto_10930 ) ( CLEAR ?auto_10924 ) ( IS-CRATE ?auto_10925 ) ( not ( = ?auto_10924 ?auto_10925 ) ) ( AVAILABLE ?auto_10928 ) ( ON ?auto_10924 ?auto_10923 ) ( not ( = ?auto_10923 ?auto_10924 ) ) ( not ( = ?auto_10923 ?auto_10925 ) ) ( TRUCK-AT ?auto_10927 ?auto_10929 ) ( not ( = ?auto_10929 ?auto_10930 ) ) ( HOIST-AT ?auto_10926 ?auto_10929 ) ( LIFTING ?auto_10926 ?auto_10925 ) ( not ( = ?auto_10928 ?auto_10926 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_10924 ?auto_10925 )
      ( MAKE-2CRATE-VERIFY ?auto_10923 ?auto_10924 ?auto_10925 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_10931 - SURFACE
      ?auto_10932 - SURFACE
    )
    :vars
    (
      ?auto_10936 - HOIST
      ?auto_10933 - PLACE
      ?auto_10938 - SURFACE
      ?auto_10937 - TRUCK
      ?auto_10935 - PLACE
      ?auto_10934 - HOIST
      ?auto_10939 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10936 ?auto_10933 ) ( SURFACE-AT ?auto_10931 ?auto_10933 ) ( CLEAR ?auto_10931 ) ( IS-CRATE ?auto_10932 ) ( not ( = ?auto_10931 ?auto_10932 ) ) ( AVAILABLE ?auto_10936 ) ( ON ?auto_10931 ?auto_10938 ) ( not ( = ?auto_10938 ?auto_10931 ) ) ( not ( = ?auto_10938 ?auto_10932 ) ) ( TRUCK-AT ?auto_10937 ?auto_10935 ) ( not ( = ?auto_10935 ?auto_10933 ) ) ( HOIST-AT ?auto_10934 ?auto_10935 ) ( not ( = ?auto_10936 ?auto_10934 ) ) ( AVAILABLE ?auto_10934 ) ( SURFACE-AT ?auto_10932 ?auto_10935 ) ( ON ?auto_10932 ?auto_10939 ) ( CLEAR ?auto_10932 ) ( not ( = ?auto_10931 ?auto_10939 ) ) ( not ( = ?auto_10932 ?auto_10939 ) ) ( not ( = ?auto_10938 ?auto_10939 ) ) )
    :subtasks
    ( ( !LIFT ?auto_10934 ?auto_10932 ?auto_10939 ?auto_10935 )
      ( MAKE-2CRATE ?auto_10938 ?auto_10931 ?auto_10932 )
      ( MAKE-1CRATE-VERIFY ?auto_10931 ?auto_10932 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_10940 - SURFACE
      ?auto_10941 - SURFACE
      ?auto_10942 - SURFACE
    )
    :vars
    (
      ?auto_10943 - HOIST
      ?auto_10947 - PLACE
      ?auto_10944 - TRUCK
      ?auto_10945 - PLACE
      ?auto_10948 - HOIST
      ?auto_10946 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10943 ?auto_10947 ) ( SURFACE-AT ?auto_10941 ?auto_10947 ) ( CLEAR ?auto_10941 ) ( IS-CRATE ?auto_10942 ) ( not ( = ?auto_10941 ?auto_10942 ) ) ( AVAILABLE ?auto_10943 ) ( ON ?auto_10941 ?auto_10940 ) ( not ( = ?auto_10940 ?auto_10941 ) ) ( not ( = ?auto_10940 ?auto_10942 ) ) ( TRUCK-AT ?auto_10944 ?auto_10945 ) ( not ( = ?auto_10945 ?auto_10947 ) ) ( HOIST-AT ?auto_10948 ?auto_10945 ) ( not ( = ?auto_10943 ?auto_10948 ) ) ( AVAILABLE ?auto_10948 ) ( SURFACE-AT ?auto_10942 ?auto_10945 ) ( ON ?auto_10942 ?auto_10946 ) ( CLEAR ?auto_10942 ) ( not ( = ?auto_10941 ?auto_10946 ) ) ( not ( = ?auto_10942 ?auto_10946 ) ) ( not ( = ?auto_10940 ?auto_10946 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_10941 ?auto_10942 )
      ( MAKE-2CRATE-VERIFY ?auto_10940 ?auto_10941 ?auto_10942 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_10949 - SURFACE
      ?auto_10950 - SURFACE
    )
    :vars
    (
      ?auto_10956 - HOIST
      ?auto_10957 - PLACE
      ?auto_10955 - SURFACE
      ?auto_10953 - PLACE
      ?auto_10954 - HOIST
      ?auto_10952 - SURFACE
      ?auto_10951 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10956 ?auto_10957 ) ( SURFACE-AT ?auto_10949 ?auto_10957 ) ( CLEAR ?auto_10949 ) ( IS-CRATE ?auto_10950 ) ( not ( = ?auto_10949 ?auto_10950 ) ) ( AVAILABLE ?auto_10956 ) ( ON ?auto_10949 ?auto_10955 ) ( not ( = ?auto_10955 ?auto_10949 ) ) ( not ( = ?auto_10955 ?auto_10950 ) ) ( not ( = ?auto_10953 ?auto_10957 ) ) ( HOIST-AT ?auto_10954 ?auto_10953 ) ( not ( = ?auto_10956 ?auto_10954 ) ) ( AVAILABLE ?auto_10954 ) ( SURFACE-AT ?auto_10950 ?auto_10953 ) ( ON ?auto_10950 ?auto_10952 ) ( CLEAR ?auto_10950 ) ( not ( = ?auto_10949 ?auto_10952 ) ) ( not ( = ?auto_10950 ?auto_10952 ) ) ( not ( = ?auto_10955 ?auto_10952 ) ) ( TRUCK-AT ?auto_10951 ?auto_10957 ) )
    :subtasks
    ( ( !DRIVE ?auto_10951 ?auto_10957 ?auto_10953 )
      ( MAKE-2CRATE ?auto_10955 ?auto_10949 ?auto_10950 )
      ( MAKE-1CRATE-VERIFY ?auto_10949 ?auto_10950 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_10958 - SURFACE
      ?auto_10959 - SURFACE
      ?auto_10960 - SURFACE
    )
    :vars
    (
      ?auto_10965 - HOIST
      ?auto_10966 - PLACE
      ?auto_10964 - PLACE
      ?auto_10963 - HOIST
      ?auto_10961 - SURFACE
      ?auto_10962 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10965 ?auto_10966 ) ( SURFACE-AT ?auto_10959 ?auto_10966 ) ( CLEAR ?auto_10959 ) ( IS-CRATE ?auto_10960 ) ( not ( = ?auto_10959 ?auto_10960 ) ) ( AVAILABLE ?auto_10965 ) ( ON ?auto_10959 ?auto_10958 ) ( not ( = ?auto_10958 ?auto_10959 ) ) ( not ( = ?auto_10958 ?auto_10960 ) ) ( not ( = ?auto_10964 ?auto_10966 ) ) ( HOIST-AT ?auto_10963 ?auto_10964 ) ( not ( = ?auto_10965 ?auto_10963 ) ) ( AVAILABLE ?auto_10963 ) ( SURFACE-AT ?auto_10960 ?auto_10964 ) ( ON ?auto_10960 ?auto_10961 ) ( CLEAR ?auto_10960 ) ( not ( = ?auto_10959 ?auto_10961 ) ) ( not ( = ?auto_10960 ?auto_10961 ) ) ( not ( = ?auto_10958 ?auto_10961 ) ) ( TRUCK-AT ?auto_10962 ?auto_10966 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_10959 ?auto_10960 )
      ( MAKE-2CRATE-VERIFY ?auto_10958 ?auto_10959 ?auto_10960 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_10967 - SURFACE
      ?auto_10968 - SURFACE
    )
    :vars
    (
      ?auto_10969 - HOIST
      ?auto_10972 - PLACE
      ?auto_10971 - SURFACE
      ?auto_10973 - PLACE
      ?auto_10974 - HOIST
      ?auto_10975 - SURFACE
      ?auto_10970 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10969 ?auto_10972 ) ( IS-CRATE ?auto_10968 ) ( not ( = ?auto_10967 ?auto_10968 ) ) ( not ( = ?auto_10971 ?auto_10967 ) ) ( not ( = ?auto_10971 ?auto_10968 ) ) ( not ( = ?auto_10973 ?auto_10972 ) ) ( HOIST-AT ?auto_10974 ?auto_10973 ) ( not ( = ?auto_10969 ?auto_10974 ) ) ( AVAILABLE ?auto_10974 ) ( SURFACE-AT ?auto_10968 ?auto_10973 ) ( ON ?auto_10968 ?auto_10975 ) ( CLEAR ?auto_10968 ) ( not ( = ?auto_10967 ?auto_10975 ) ) ( not ( = ?auto_10968 ?auto_10975 ) ) ( not ( = ?auto_10971 ?auto_10975 ) ) ( TRUCK-AT ?auto_10970 ?auto_10972 ) ( SURFACE-AT ?auto_10971 ?auto_10972 ) ( CLEAR ?auto_10971 ) ( LIFTING ?auto_10969 ?auto_10967 ) ( IS-CRATE ?auto_10967 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_10971 ?auto_10967 )
      ( MAKE-2CRATE ?auto_10971 ?auto_10967 ?auto_10968 )
      ( MAKE-1CRATE-VERIFY ?auto_10967 ?auto_10968 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_10976 - SURFACE
      ?auto_10977 - SURFACE
      ?auto_10978 - SURFACE
    )
    :vars
    (
      ?auto_10984 - HOIST
      ?auto_10983 - PLACE
      ?auto_10982 - PLACE
      ?auto_10979 - HOIST
      ?auto_10980 - SURFACE
      ?auto_10981 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10984 ?auto_10983 ) ( IS-CRATE ?auto_10978 ) ( not ( = ?auto_10977 ?auto_10978 ) ) ( not ( = ?auto_10976 ?auto_10977 ) ) ( not ( = ?auto_10976 ?auto_10978 ) ) ( not ( = ?auto_10982 ?auto_10983 ) ) ( HOIST-AT ?auto_10979 ?auto_10982 ) ( not ( = ?auto_10984 ?auto_10979 ) ) ( AVAILABLE ?auto_10979 ) ( SURFACE-AT ?auto_10978 ?auto_10982 ) ( ON ?auto_10978 ?auto_10980 ) ( CLEAR ?auto_10978 ) ( not ( = ?auto_10977 ?auto_10980 ) ) ( not ( = ?auto_10978 ?auto_10980 ) ) ( not ( = ?auto_10976 ?auto_10980 ) ) ( TRUCK-AT ?auto_10981 ?auto_10983 ) ( SURFACE-AT ?auto_10976 ?auto_10983 ) ( CLEAR ?auto_10976 ) ( LIFTING ?auto_10984 ?auto_10977 ) ( IS-CRATE ?auto_10977 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_10977 ?auto_10978 )
      ( MAKE-2CRATE-VERIFY ?auto_10976 ?auto_10977 ?auto_10978 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_10985 - SURFACE
      ?auto_10986 - SURFACE
    )
    :vars
    (
      ?auto_10993 - HOIST
      ?auto_10987 - PLACE
      ?auto_10990 - SURFACE
      ?auto_10991 - PLACE
      ?auto_10992 - HOIST
      ?auto_10988 - SURFACE
      ?auto_10989 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10993 ?auto_10987 ) ( IS-CRATE ?auto_10986 ) ( not ( = ?auto_10985 ?auto_10986 ) ) ( not ( = ?auto_10990 ?auto_10985 ) ) ( not ( = ?auto_10990 ?auto_10986 ) ) ( not ( = ?auto_10991 ?auto_10987 ) ) ( HOIST-AT ?auto_10992 ?auto_10991 ) ( not ( = ?auto_10993 ?auto_10992 ) ) ( AVAILABLE ?auto_10992 ) ( SURFACE-AT ?auto_10986 ?auto_10991 ) ( ON ?auto_10986 ?auto_10988 ) ( CLEAR ?auto_10986 ) ( not ( = ?auto_10985 ?auto_10988 ) ) ( not ( = ?auto_10986 ?auto_10988 ) ) ( not ( = ?auto_10990 ?auto_10988 ) ) ( TRUCK-AT ?auto_10989 ?auto_10987 ) ( SURFACE-AT ?auto_10990 ?auto_10987 ) ( CLEAR ?auto_10990 ) ( IS-CRATE ?auto_10985 ) ( AVAILABLE ?auto_10993 ) ( IN ?auto_10985 ?auto_10989 ) )
    :subtasks
    ( ( !UNLOAD ?auto_10993 ?auto_10985 ?auto_10989 ?auto_10987 )
      ( MAKE-2CRATE ?auto_10990 ?auto_10985 ?auto_10986 )
      ( MAKE-1CRATE-VERIFY ?auto_10985 ?auto_10986 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_10994 - SURFACE
      ?auto_10995 - SURFACE
      ?auto_10996 - SURFACE
    )
    :vars
    (
      ?auto_10998 - HOIST
      ?auto_10999 - PLACE
      ?auto_11002 - PLACE
      ?auto_11000 - HOIST
      ?auto_11001 - SURFACE
      ?auto_10997 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10998 ?auto_10999 ) ( IS-CRATE ?auto_10996 ) ( not ( = ?auto_10995 ?auto_10996 ) ) ( not ( = ?auto_10994 ?auto_10995 ) ) ( not ( = ?auto_10994 ?auto_10996 ) ) ( not ( = ?auto_11002 ?auto_10999 ) ) ( HOIST-AT ?auto_11000 ?auto_11002 ) ( not ( = ?auto_10998 ?auto_11000 ) ) ( AVAILABLE ?auto_11000 ) ( SURFACE-AT ?auto_10996 ?auto_11002 ) ( ON ?auto_10996 ?auto_11001 ) ( CLEAR ?auto_10996 ) ( not ( = ?auto_10995 ?auto_11001 ) ) ( not ( = ?auto_10996 ?auto_11001 ) ) ( not ( = ?auto_10994 ?auto_11001 ) ) ( TRUCK-AT ?auto_10997 ?auto_10999 ) ( SURFACE-AT ?auto_10994 ?auto_10999 ) ( CLEAR ?auto_10994 ) ( IS-CRATE ?auto_10995 ) ( AVAILABLE ?auto_10998 ) ( IN ?auto_10995 ?auto_10997 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_10995 ?auto_10996 )
      ( MAKE-2CRATE-VERIFY ?auto_10994 ?auto_10995 ?auto_10996 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11039 - SURFACE
      ?auto_11040 - SURFACE
    )
    :vars
    (
      ?auto_11047 - HOIST
      ?auto_11043 - PLACE
      ?auto_11042 - SURFACE
      ?auto_11046 - PLACE
      ?auto_11045 - HOIST
      ?auto_11041 - SURFACE
      ?auto_11044 - TRUCK
      ?auto_11048 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11047 ?auto_11043 ) ( SURFACE-AT ?auto_11039 ?auto_11043 ) ( CLEAR ?auto_11039 ) ( IS-CRATE ?auto_11040 ) ( not ( = ?auto_11039 ?auto_11040 ) ) ( AVAILABLE ?auto_11047 ) ( ON ?auto_11039 ?auto_11042 ) ( not ( = ?auto_11042 ?auto_11039 ) ) ( not ( = ?auto_11042 ?auto_11040 ) ) ( not ( = ?auto_11046 ?auto_11043 ) ) ( HOIST-AT ?auto_11045 ?auto_11046 ) ( not ( = ?auto_11047 ?auto_11045 ) ) ( AVAILABLE ?auto_11045 ) ( SURFACE-AT ?auto_11040 ?auto_11046 ) ( ON ?auto_11040 ?auto_11041 ) ( CLEAR ?auto_11040 ) ( not ( = ?auto_11039 ?auto_11041 ) ) ( not ( = ?auto_11040 ?auto_11041 ) ) ( not ( = ?auto_11042 ?auto_11041 ) ) ( TRUCK-AT ?auto_11044 ?auto_11048 ) ( not ( = ?auto_11048 ?auto_11043 ) ) ( not ( = ?auto_11046 ?auto_11048 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_11044 ?auto_11048 ?auto_11043 )
      ( MAKE-1CRATE ?auto_11039 ?auto_11040 )
      ( MAKE-1CRATE-VERIFY ?auto_11039 ?auto_11040 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_11079 - SURFACE
      ?auto_11080 - SURFACE
      ?auto_11081 - SURFACE
      ?auto_11078 - SURFACE
    )
    :vars
    (
      ?auto_11083 - HOIST
      ?auto_11082 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11083 ?auto_11082 ) ( SURFACE-AT ?auto_11081 ?auto_11082 ) ( CLEAR ?auto_11081 ) ( LIFTING ?auto_11083 ?auto_11078 ) ( IS-CRATE ?auto_11078 ) ( not ( = ?auto_11081 ?auto_11078 ) ) ( ON ?auto_11080 ?auto_11079 ) ( ON ?auto_11081 ?auto_11080 ) ( not ( = ?auto_11079 ?auto_11080 ) ) ( not ( = ?auto_11079 ?auto_11081 ) ) ( not ( = ?auto_11079 ?auto_11078 ) ) ( not ( = ?auto_11080 ?auto_11081 ) ) ( not ( = ?auto_11080 ?auto_11078 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_11081 ?auto_11078 )
      ( MAKE-3CRATE-VERIFY ?auto_11079 ?auto_11080 ?auto_11081 ?auto_11078 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_11096 - SURFACE
      ?auto_11097 - SURFACE
      ?auto_11098 - SURFACE
      ?auto_11095 - SURFACE
    )
    :vars
    (
      ?auto_11101 - HOIST
      ?auto_11099 - PLACE
      ?auto_11100 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11101 ?auto_11099 ) ( SURFACE-AT ?auto_11098 ?auto_11099 ) ( CLEAR ?auto_11098 ) ( IS-CRATE ?auto_11095 ) ( not ( = ?auto_11098 ?auto_11095 ) ) ( TRUCK-AT ?auto_11100 ?auto_11099 ) ( AVAILABLE ?auto_11101 ) ( IN ?auto_11095 ?auto_11100 ) ( ON ?auto_11098 ?auto_11097 ) ( not ( = ?auto_11097 ?auto_11098 ) ) ( not ( = ?auto_11097 ?auto_11095 ) ) ( ON ?auto_11097 ?auto_11096 ) ( not ( = ?auto_11096 ?auto_11097 ) ) ( not ( = ?auto_11096 ?auto_11098 ) ) ( not ( = ?auto_11096 ?auto_11095 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_11097 ?auto_11098 ?auto_11095 )
      ( MAKE-3CRATE-VERIFY ?auto_11096 ?auto_11097 ?auto_11098 ?auto_11095 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_11117 - SURFACE
      ?auto_11118 - SURFACE
      ?auto_11119 - SURFACE
      ?auto_11116 - SURFACE
    )
    :vars
    (
      ?auto_11120 - HOIST
      ?auto_11122 - PLACE
      ?auto_11121 - TRUCK
      ?auto_11123 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11120 ?auto_11122 ) ( SURFACE-AT ?auto_11119 ?auto_11122 ) ( CLEAR ?auto_11119 ) ( IS-CRATE ?auto_11116 ) ( not ( = ?auto_11119 ?auto_11116 ) ) ( AVAILABLE ?auto_11120 ) ( IN ?auto_11116 ?auto_11121 ) ( ON ?auto_11119 ?auto_11118 ) ( not ( = ?auto_11118 ?auto_11119 ) ) ( not ( = ?auto_11118 ?auto_11116 ) ) ( TRUCK-AT ?auto_11121 ?auto_11123 ) ( not ( = ?auto_11123 ?auto_11122 ) ) ( ON ?auto_11118 ?auto_11117 ) ( not ( = ?auto_11117 ?auto_11118 ) ) ( not ( = ?auto_11117 ?auto_11119 ) ) ( not ( = ?auto_11117 ?auto_11116 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_11118 ?auto_11119 ?auto_11116 )
      ( MAKE-3CRATE-VERIFY ?auto_11117 ?auto_11118 ?auto_11119 ?auto_11116 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_11141 - SURFACE
      ?auto_11142 - SURFACE
      ?auto_11143 - SURFACE
      ?auto_11140 - SURFACE
    )
    :vars
    (
      ?auto_11146 - HOIST
      ?auto_11148 - PLACE
      ?auto_11145 - TRUCK
      ?auto_11147 - PLACE
      ?auto_11144 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_11146 ?auto_11148 ) ( SURFACE-AT ?auto_11143 ?auto_11148 ) ( CLEAR ?auto_11143 ) ( IS-CRATE ?auto_11140 ) ( not ( = ?auto_11143 ?auto_11140 ) ) ( AVAILABLE ?auto_11146 ) ( ON ?auto_11143 ?auto_11142 ) ( not ( = ?auto_11142 ?auto_11143 ) ) ( not ( = ?auto_11142 ?auto_11140 ) ) ( TRUCK-AT ?auto_11145 ?auto_11147 ) ( not ( = ?auto_11147 ?auto_11148 ) ) ( HOIST-AT ?auto_11144 ?auto_11147 ) ( LIFTING ?auto_11144 ?auto_11140 ) ( not ( = ?auto_11146 ?auto_11144 ) ) ( ON ?auto_11142 ?auto_11141 ) ( not ( = ?auto_11141 ?auto_11142 ) ) ( not ( = ?auto_11141 ?auto_11143 ) ) ( not ( = ?auto_11141 ?auto_11140 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_11142 ?auto_11143 ?auto_11140 )
      ( MAKE-3CRATE-VERIFY ?auto_11141 ?auto_11142 ?auto_11143 ?auto_11140 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_11168 - SURFACE
      ?auto_11169 - SURFACE
      ?auto_11170 - SURFACE
      ?auto_11167 - SURFACE
    )
    :vars
    (
      ?auto_11175 - HOIST
      ?auto_11171 - PLACE
      ?auto_11174 - TRUCK
      ?auto_11173 - PLACE
      ?auto_11176 - HOIST
      ?auto_11172 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11175 ?auto_11171 ) ( SURFACE-AT ?auto_11170 ?auto_11171 ) ( CLEAR ?auto_11170 ) ( IS-CRATE ?auto_11167 ) ( not ( = ?auto_11170 ?auto_11167 ) ) ( AVAILABLE ?auto_11175 ) ( ON ?auto_11170 ?auto_11169 ) ( not ( = ?auto_11169 ?auto_11170 ) ) ( not ( = ?auto_11169 ?auto_11167 ) ) ( TRUCK-AT ?auto_11174 ?auto_11173 ) ( not ( = ?auto_11173 ?auto_11171 ) ) ( HOIST-AT ?auto_11176 ?auto_11173 ) ( not ( = ?auto_11175 ?auto_11176 ) ) ( AVAILABLE ?auto_11176 ) ( SURFACE-AT ?auto_11167 ?auto_11173 ) ( ON ?auto_11167 ?auto_11172 ) ( CLEAR ?auto_11167 ) ( not ( = ?auto_11170 ?auto_11172 ) ) ( not ( = ?auto_11167 ?auto_11172 ) ) ( not ( = ?auto_11169 ?auto_11172 ) ) ( ON ?auto_11169 ?auto_11168 ) ( not ( = ?auto_11168 ?auto_11169 ) ) ( not ( = ?auto_11168 ?auto_11170 ) ) ( not ( = ?auto_11168 ?auto_11167 ) ) ( not ( = ?auto_11168 ?auto_11172 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_11169 ?auto_11170 ?auto_11167 )
      ( MAKE-3CRATE-VERIFY ?auto_11168 ?auto_11169 ?auto_11170 ?auto_11167 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_11196 - SURFACE
      ?auto_11197 - SURFACE
      ?auto_11198 - SURFACE
      ?auto_11195 - SURFACE
    )
    :vars
    (
      ?auto_11199 - HOIST
      ?auto_11200 - PLACE
      ?auto_11203 - PLACE
      ?auto_11201 - HOIST
      ?auto_11204 - SURFACE
      ?auto_11202 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11199 ?auto_11200 ) ( SURFACE-AT ?auto_11198 ?auto_11200 ) ( CLEAR ?auto_11198 ) ( IS-CRATE ?auto_11195 ) ( not ( = ?auto_11198 ?auto_11195 ) ) ( AVAILABLE ?auto_11199 ) ( ON ?auto_11198 ?auto_11197 ) ( not ( = ?auto_11197 ?auto_11198 ) ) ( not ( = ?auto_11197 ?auto_11195 ) ) ( not ( = ?auto_11203 ?auto_11200 ) ) ( HOIST-AT ?auto_11201 ?auto_11203 ) ( not ( = ?auto_11199 ?auto_11201 ) ) ( AVAILABLE ?auto_11201 ) ( SURFACE-AT ?auto_11195 ?auto_11203 ) ( ON ?auto_11195 ?auto_11204 ) ( CLEAR ?auto_11195 ) ( not ( = ?auto_11198 ?auto_11204 ) ) ( not ( = ?auto_11195 ?auto_11204 ) ) ( not ( = ?auto_11197 ?auto_11204 ) ) ( TRUCK-AT ?auto_11202 ?auto_11200 ) ( ON ?auto_11197 ?auto_11196 ) ( not ( = ?auto_11196 ?auto_11197 ) ) ( not ( = ?auto_11196 ?auto_11198 ) ) ( not ( = ?auto_11196 ?auto_11195 ) ) ( not ( = ?auto_11196 ?auto_11204 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_11197 ?auto_11198 ?auto_11195 )
      ( MAKE-3CRATE-VERIFY ?auto_11196 ?auto_11197 ?auto_11198 ?auto_11195 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_11224 - SURFACE
      ?auto_11225 - SURFACE
      ?auto_11226 - SURFACE
      ?auto_11223 - SURFACE
    )
    :vars
    (
      ?auto_11231 - HOIST
      ?auto_11227 - PLACE
      ?auto_11229 - PLACE
      ?auto_11230 - HOIST
      ?auto_11228 - SURFACE
      ?auto_11232 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11231 ?auto_11227 ) ( IS-CRATE ?auto_11223 ) ( not ( = ?auto_11226 ?auto_11223 ) ) ( not ( = ?auto_11225 ?auto_11226 ) ) ( not ( = ?auto_11225 ?auto_11223 ) ) ( not ( = ?auto_11229 ?auto_11227 ) ) ( HOIST-AT ?auto_11230 ?auto_11229 ) ( not ( = ?auto_11231 ?auto_11230 ) ) ( AVAILABLE ?auto_11230 ) ( SURFACE-AT ?auto_11223 ?auto_11229 ) ( ON ?auto_11223 ?auto_11228 ) ( CLEAR ?auto_11223 ) ( not ( = ?auto_11226 ?auto_11228 ) ) ( not ( = ?auto_11223 ?auto_11228 ) ) ( not ( = ?auto_11225 ?auto_11228 ) ) ( TRUCK-AT ?auto_11232 ?auto_11227 ) ( SURFACE-AT ?auto_11225 ?auto_11227 ) ( CLEAR ?auto_11225 ) ( LIFTING ?auto_11231 ?auto_11226 ) ( IS-CRATE ?auto_11226 ) ( ON ?auto_11225 ?auto_11224 ) ( not ( = ?auto_11224 ?auto_11225 ) ) ( not ( = ?auto_11224 ?auto_11226 ) ) ( not ( = ?auto_11224 ?auto_11223 ) ) ( not ( = ?auto_11224 ?auto_11228 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_11225 ?auto_11226 ?auto_11223 )
      ( MAKE-3CRATE-VERIFY ?auto_11224 ?auto_11225 ?auto_11226 ?auto_11223 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_11252 - SURFACE
      ?auto_11253 - SURFACE
      ?auto_11254 - SURFACE
      ?auto_11251 - SURFACE
    )
    :vars
    (
      ?auto_11256 - HOIST
      ?auto_11255 - PLACE
      ?auto_11257 - PLACE
      ?auto_11259 - HOIST
      ?auto_11260 - SURFACE
      ?auto_11258 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11256 ?auto_11255 ) ( IS-CRATE ?auto_11251 ) ( not ( = ?auto_11254 ?auto_11251 ) ) ( not ( = ?auto_11253 ?auto_11254 ) ) ( not ( = ?auto_11253 ?auto_11251 ) ) ( not ( = ?auto_11257 ?auto_11255 ) ) ( HOIST-AT ?auto_11259 ?auto_11257 ) ( not ( = ?auto_11256 ?auto_11259 ) ) ( AVAILABLE ?auto_11259 ) ( SURFACE-AT ?auto_11251 ?auto_11257 ) ( ON ?auto_11251 ?auto_11260 ) ( CLEAR ?auto_11251 ) ( not ( = ?auto_11254 ?auto_11260 ) ) ( not ( = ?auto_11251 ?auto_11260 ) ) ( not ( = ?auto_11253 ?auto_11260 ) ) ( TRUCK-AT ?auto_11258 ?auto_11255 ) ( SURFACE-AT ?auto_11253 ?auto_11255 ) ( CLEAR ?auto_11253 ) ( IS-CRATE ?auto_11254 ) ( AVAILABLE ?auto_11256 ) ( IN ?auto_11254 ?auto_11258 ) ( ON ?auto_11253 ?auto_11252 ) ( not ( = ?auto_11252 ?auto_11253 ) ) ( not ( = ?auto_11252 ?auto_11254 ) ) ( not ( = ?auto_11252 ?auto_11251 ) ) ( not ( = ?auto_11252 ?auto_11260 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_11253 ?auto_11254 ?auto_11251 )
      ( MAKE-3CRATE-VERIFY ?auto_11252 ?auto_11253 ?auto_11254 ?auto_11251 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_11543 - SURFACE
      ?auto_11544 - SURFACE
      ?auto_11545 - SURFACE
      ?auto_11542 - SURFACE
      ?auto_11546 - SURFACE
    )
    :vars
    (
      ?auto_11548 - HOIST
      ?auto_11547 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11548 ?auto_11547 ) ( SURFACE-AT ?auto_11542 ?auto_11547 ) ( CLEAR ?auto_11542 ) ( LIFTING ?auto_11548 ?auto_11546 ) ( IS-CRATE ?auto_11546 ) ( not ( = ?auto_11542 ?auto_11546 ) ) ( ON ?auto_11544 ?auto_11543 ) ( ON ?auto_11545 ?auto_11544 ) ( ON ?auto_11542 ?auto_11545 ) ( not ( = ?auto_11543 ?auto_11544 ) ) ( not ( = ?auto_11543 ?auto_11545 ) ) ( not ( = ?auto_11543 ?auto_11542 ) ) ( not ( = ?auto_11543 ?auto_11546 ) ) ( not ( = ?auto_11544 ?auto_11545 ) ) ( not ( = ?auto_11544 ?auto_11542 ) ) ( not ( = ?auto_11544 ?auto_11546 ) ) ( not ( = ?auto_11545 ?auto_11542 ) ) ( not ( = ?auto_11545 ?auto_11546 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_11542 ?auto_11546 )
      ( MAKE-4CRATE-VERIFY ?auto_11543 ?auto_11544 ?auto_11545 ?auto_11542 ?auto_11546 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_11568 - SURFACE
      ?auto_11569 - SURFACE
      ?auto_11570 - SURFACE
      ?auto_11567 - SURFACE
      ?auto_11571 - SURFACE
    )
    :vars
    (
      ?auto_11572 - HOIST
      ?auto_11574 - PLACE
      ?auto_11573 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11572 ?auto_11574 ) ( SURFACE-AT ?auto_11567 ?auto_11574 ) ( CLEAR ?auto_11567 ) ( IS-CRATE ?auto_11571 ) ( not ( = ?auto_11567 ?auto_11571 ) ) ( TRUCK-AT ?auto_11573 ?auto_11574 ) ( AVAILABLE ?auto_11572 ) ( IN ?auto_11571 ?auto_11573 ) ( ON ?auto_11567 ?auto_11570 ) ( not ( = ?auto_11570 ?auto_11567 ) ) ( not ( = ?auto_11570 ?auto_11571 ) ) ( ON ?auto_11569 ?auto_11568 ) ( ON ?auto_11570 ?auto_11569 ) ( not ( = ?auto_11568 ?auto_11569 ) ) ( not ( = ?auto_11568 ?auto_11570 ) ) ( not ( = ?auto_11568 ?auto_11567 ) ) ( not ( = ?auto_11568 ?auto_11571 ) ) ( not ( = ?auto_11569 ?auto_11570 ) ) ( not ( = ?auto_11569 ?auto_11567 ) ) ( not ( = ?auto_11569 ?auto_11571 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_11570 ?auto_11567 ?auto_11571 )
      ( MAKE-4CRATE-VERIFY ?auto_11568 ?auto_11569 ?auto_11570 ?auto_11567 ?auto_11571 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_11598 - SURFACE
      ?auto_11599 - SURFACE
      ?auto_11600 - SURFACE
      ?auto_11597 - SURFACE
      ?auto_11601 - SURFACE
    )
    :vars
    (
      ?auto_11605 - HOIST
      ?auto_11604 - PLACE
      ?auto_11602 - TRUCK
      ?auto_11603 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11605 ?auto_11604 ) ( SURFACE-AT ?auto_11597 ?auto_11604 ) ( CLEAR ?auto_11597 ) ( IS-CRATE ?auto_11601 ) ( not ( = ?auto_11597 ?auto_11601 ) ) ( AVAILABLE ?auto_11605 ) ( IN ?auto_11601 ?auto_11602 ) ( ON ?auto_11597 ?auto_11600 ) ( not ( = ?auto_11600 ?auto_11597 ) ) ( not ( = ?auto_11600 ?auto_11601 ) ) ( TRUCK-AT ?auto_11602 ?auto_11603 ) ( not ( = ?auto_11603 ?auto_11604 ) ) ( ON ?auto_11599 ?auto_11598 ) ( ON ?auto_11600 ?auto_11599 ) ( not ( = ?auto_11598 ?auto_11599 ) ) ( not ( = ?auto_11598 ?auto_11600 ) ) ( not ( = ?auto_11598 ?auto_11597 ) ) ( not ( = ?auto_11598 ?auto_11601 ) ) ( not ( = ?auto_11599 ?auto_11600 ) ) ( not ( = ?auto_11599 ?auto_11597 ) ) ( not ( = ?auto_11599 ?auto_11601 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_11600 ?auto_11597 ?auto_11601 )
      ( MAKE-4CRATE-VERIFY ?auto_11598 ?auto_11599 ?auto_11600 ?auto_11597 ?auto_11601 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_11632 - SURFACE
      ?auto_11633 - SURFACE
      ?auto_11634 - SURFACE
      ?auto_11631 - SURFACE
      ?auto_11635 - SURFACE
    )
    :vars
    (
      ?auto_11636 - HOIST
      ?auto_11638 - PLACE
      ?auto_11640 - TRUCK
      ?auto_11637 - PLACE
      ?auto_11639 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_11636 ?auto_11638 ) ( SURFACE-AT ?auto_11631 ?auto_11638 ) ( CLEAR ?auto_11631 ) ( IS-CRATE ?auto_11635 ) ( not ( = ?auto_11631 ?auto_11635 ) ) ( AVAILABLE ?auto_11636 ) ( ON ?auto_11631 ?auto_11634 ) ( not ( = ?auto_11634 ?auto_11631 ) ) ( not ( = ?auto_11634 ?auto_11635 ) ) ( TRUCK-AT ?auto_11640 ?auto_11637 ) ( not ( = ?auto_11637 ?auto_11638 ) ) ( HOIST-AT ?auto_11639 ?auto_11637 ) ( LIFTING ?auto_11639 ?auto_11635 ) ( not ( = ?auto_11636 ?auto_11639 ) ) ( ON ?auto_11633 ?auto_11632 ) ( ON ?auto_11634 ?auto_11633 ) ( not ( = ?auto_11632 ?auto_11633 ) ) ( not ( = ?auto_11632 ?auto_11634 ) ) ( not ( = ?auto_11632 ?auto_11631 ) ) ( not ( = ?auto_11632 ?auto_11635 ) ) ( not ( = ?auto_11633 ?auto_11634 ) ) ( not ( = ?auto_11633 ?auto_11631 ) ) ( not ( = ?auto_11633 ?auto_11635 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_11634 ?auto_11631 ?auto_11635 )
      ( MAKE-4CRATE-VERIFY ?auto_11632 ?auto_11633 ?auto_11634 ?auto_11631 ?auto_11635 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_11670 - SURFACE
      ?auto_11671 - SURFACE
      ?auto_11672 - SURFACE
      ?auto_11669 - SURFACE
      ?auto_11673 - SURFACE
    )
    :vars
    (
      ?auto_11678 - HOIST
      ?auto_11674 - PLACE
      ?auto_11677 - TRUCK
      ?auto_11676 - PLACE
      ?auto_11675 - HOIST
      ?auto_11679 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11678 ?auto_11674 ) ( SURFACE-AT ?auto_11669 ?auto_11674 ) ( CLEAR ?auto_11669 ) ( IS-CRATE ?auto_11673 ) ( not ( = ?auto_11669 ?auto_11673 ) ) ( AVAILABLE ?auto_11678 ) ( ON ?auto_11669 ?auto_11672 ) ( not ( = ?auto_11672 ?auto_11669 ) ) ( not ( = ?auto_11672 ?auto_11673 ) ) ( TRUCK-AT ?auto_11677 ?auto_11676 ) ( not ( = ?auto_11676 ?auto_11674 ) ) ( HOIST-AT ?auto_11675 ?auto_11676 ) ( not ( = ?auto_11678 ?auto_11675 ) ) ( AVAILABLE ?auto_11675 ) ( SURFACE-AT ?auto_11673 ?auto_11676 ) ( ON ?auto_11673 ?auto_11679 ) ( CLEAR ?auto_11673 ) ( not ( = ?auto_11669 ?auto_11679 ) ) ( not ( = ?auto_11673 ?auto_11679 ) ) ( not ( = ?auto_11672 ?auto_11679 ) ) ( ON ?auto_11671 ?auto_11670 ) ( ON ?auto_11672 ?auto_11671 ) ( not ( = ?auto_11670 ?auto_11671 ) ) ( not ( = ?auto_11670 ?auto_11672 ) ) ( not ( = ?auto_11670 ?auto_11669 ) ) ( not ( = ?auto_11670 ?auto_11673 ) ) ( not ( = ?auto_11670 ?auto_11679 ) ) ( not ( = ?auto_11671 ?auto_11672 ) ) ( not ( = ?auto_11671 ?auto_11669 ) ) ( not ( = ?auto_11671 ?auto_11673 ) ) ( not ( = ?auto_11671 ?auto_11679 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_11672 ?auto_11669 ?auto_11673 )
      ( MAKE-4CRATE-VERIFY ?auto_11670 ?auto_11671 ?auto_11672 ?auto_11669 ?auto_11673 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_11709 - SURFACE
      ?auto_11710 - SURFACE
      ?auto_11711 - SURFACE
      ?auto_11708 - SURFACE
      ?auto_11712 - SURFACE
    )
    :vars
    (
      ?auto_11716 - HOIST
      ?auto_11717 - PLACE
      ?auto_11715 - PLACE
      ?auto_11718 - HOIST
      ?auto_11714 - SURFACE
      ?auto_11713 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11716 ?auto_11717 ) ( SURFACE-AT ?auto_11708 ?auto_11717 ) ( CLEAR ?auto_11708 ) ( IS-CRATE ?auto_11712 ) ( not ( = ?auto_11708 ?auto_11712 ) ) ( AVAILABLE ?auto_11716 ) ( ON ?auto_11708 ?auto_11711 ) ( not ( = ?auto_11711 ?auto_11708 ) ) ( not ( = ?auto_11711 ?auto_11712 ) ) ( not ( = ?auto_11715 ?auto_11717 ) ) ( HOIST-AT ?auto_11718 ?auto_11715 ) ( not ( = ?auto_11716 ?auto_11718 ) ) ( AVAILABLE ?auto_11718 ) ( SURFACE-AT ?auto_11712 ?auto_11715 ) ( ON ?auto_11712 ?auto_11714 ) ( CLEAR ?auto_11712 ) ( not ( = ?auto_11708 ?auto_11714 ) ) ( not ( = ?auto_11712 ?auto_11714 ) ) ( not ( = ?auto_11711 ?auto_11714 ) ) ( TRUCK-AT ?auto_11713 ?auto_11717 ) ( ON ?auto_11710 ?auto_11709 ) ( ON ?auto_11711 ?auto_11710 ) ( not ( = ?auto_11709 ?auto_11710 ) ) ( not ( = ?auto_11709 ?auto_11711 ) ) ( not ( = ?auto_11709 ?auto_11708 ) ) ( not ( = ?auto_11709 ?auto_11712 ) ) ( not ( = ?auto_11709 ?auto_11714 ) ) ( not ( = ?auto_11710 ?auto_11711 ) ) ( not ( = ?auto_11710 ?auto_11708 ) ) ( not ( = ?auto_11710 ?auto_11712 ) ) ( not ( = ?auto_11710 ?auto_11714 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_11711 ?auto_11708 ?auto_11712 )
      ( MAKE-4CRATE-VERIFY ?auto_11709 ?auto_11710 ?auto_11711 ?auto_11708 ?auto_11712 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_11748 - SURFACE
      ?auto_11749 - SURFACE
      ?auto_11750 - SURFACE
      ?auto_11747 - SURFACE
      ?auto_11751 - SURFACE
    )
    :vars
    (
      ?auto_11755 - HOIST
      ?auto_11756 - PLACE
      ?auto_11757 - PLACE
      ?auto_11754 - HOIST
      ?auto_11753 - SURFACE
      ?auto_11752 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11755 ?auto_11756 ) ( IS-CRATE ?auto_11751 ) ( not ( = ?auto_11747 ?auto_11751 ) ) ( not ( = ?auto_11750 ?auto_11747 ) ) ( not ( = ?auto_11750 ?auto_11751 ) ) ( not ( = ?auto_11757 ?auto_11756 ) ) ( HOIST-AT ?auto_11754 ?auto_11757 ) ( not ( = ?auto_11755 ?auto_11754 ) ) ( AVAILABLE ?auto_11754 ) ( SURFACE-AT ?auto_11751 ?auto_11757 ) ( ON ?auto_11751 ?auto_11753 ) ( CLEAR ?auto_11751 ) ( not ( = ?auto_11747 ?auto_11753 ) ) ( not ( = ?auto_11751 ?auto_11753 ) ) ( not ( = ?auto_11750 ?auto_11753 ) ) ( TRUCK-AT ?auto_11752 ?auto_11756 ) ( SURFACE-AT ?auto_11750 ?auto_11756 ) ( CLEAR ?auto_11750 ) ( LIFTING ?auto_11755 ?auto_11747 ) ( IS-CRATE ?auto_11747 ) ( ON ?auto_11749 ?auto_11748 ) ( ON ?auto_11750 ?auto_11749 ) ( not ( = ?auto_11748 ?auto_11749 ) ) ( not ( = ?auto_11748 ?auto_11750 ) ) ( not ( = ?auto_11748 ?auto_11747 ) ) ( not ( = ?auto_11748 ?auto_11751 ) ) ( not ( = ?auto_11748 ?auto_11753 ) ) ( not ( = ?auto_11749 ?auto_11750 ) ) ( not ( = ?auto_11749 ?auto_11747 ) ) ( not ( = ?auto_11749 ?auto_11751 ) ) ( not ( = ?auto_11749 ?auto_11753 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_11750 ?auto_11747 ?auto_11751 )
      ( MAKE-4CRATE-VERIFY ?auto_11748 ?auto_11749 ?auto_11750 ?auto_11747 ?auto_11751 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_11787 - SURFACE
      ?auto_11788 - SURFACE
      ?auto_11789 - SURFACE
      ?auto_11786 - SURFACE
      ?auto_11790 - SURFACE
    )
    :vars
    (
      ?auto_11796 - HOIST
      ?auto_11792 - PLACE
      ?auto_11793 - PLACE
      ?auto_11791 - HOIST
      ?auto_11794 - SURFACE
      ?auto_11795 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11796 ?auto_11792 ) ( IS-CRATE ?auto_11790 ) ( not ( = ?auto_11786 ?auto_11790 ) ) ( not ( = ?auto_11789 ?auto_11786 ) ) ( not ( = ?auto_11789 ?auto_11790 ) ) ( not ( = ?auto_11793 ?auto_11792 ) ) ( HOIST-AT ?auto_11791 ?auto_11793 ) ( not ( = ?auto_11796 ?auto_11791 ) ) ( AVAILABLE ?auto_11791 ) ( SURFACE-AT ?auto_11790 ?auto_11793 ) ( ON ?auto_11790 ?auto_11794 ) ( CLEAR ?auto_11790 ) ( not ( = ?auto_11786 ?auto_11794 ) ) ( not ( = ?auto_11790 ?auto_11794 ) ) ( not ( = ?auto_11789 ?auto_11794 ) ) ( TRUCK-AT ?auto_11795 ?auto_11792 ) ( SURFACE-AT ?auto_11789 ?auto_11792 ) ( CLEAR ?auto_11789 ) ( IS-CRATE ?auto_11786 ) ( AVAILABLE ?auto_11796 ) ( IN ?auto_11786 ?auto_11795 ) ( ON ?auto_11788 ?auto_11787 ) ( ON ?auto_11789 ?auto_11788 ) ( not ( = ?auto_11787 ?auto_11788 ) ) ( not ( = ?auto_11787 ?auto_11789 ) ) ( not ( = ?auto_11787 ?auto_11786 ) ) ( not ( = ?auto_11787 ?auto_11790 ) ) ( not ( = ?auto_11787 ?auto_11794 ) ) ( not ( = ?auto_11788 ?auto_11789 ) ) ( not ( = ?auto_11788 ?auto_11786 ) ) ( not ( = ?auto_11788 ?auto_11790 ) ) ( not ( = ?auto_11788 ?auto_11794 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_11789 ?auto_11786 ?auto_11790 )
      ( MAKE-4CRATE-VERIFY ?auto_11787 ?auto_11788 ?auto_11789 ?auto_11786 ?auto_11790 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12287 - SURFACE
      ?auto_12288 - SURFACE
    )
    :vars
    (
      ?auto_12294 - HOIST
      ?auto_12289 - PLACE
      ?auto_12295 - SURFACE
      ?auto_12292 - TRUCK
      ?auto_12291 - PLACE
      ?auto_12293 - HOIST
      ?auto_12290 - SURFACE
      ?auto_12296 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12294 ?auto_12289 ) ( SURFACE-AT ?auto_12287 ?auto_12289 ) ( CLEAR ?auto_12287 ) ( IS-CRATE ?auto_12288 ) ( not ( = ?auto_12287 ?auto_12288 ) ) ( AVAILABLE ?auto_12294 ) ( ON ?auto_12287 ?auto_12295 ) ( not ( = ?auto_12295 ?auto_12287 ) ) ( not ( = ?auto_12295 ?auto_12288 ) ) ( TRUCK-AT ?auto_12292 ?auto_12291 ) ( not ( = ?auto_12291 ?auto_12289 ) ) ( HOIST-AT ?auto_12293 ?auto_12291 ) ( not ( = ?auto_12294 ?auto_12293 ) ) ( SURFACE-AT ?auto_12288 ?auto_12291 ) ( ON ?auto_12288 ?auto_12290 ) ( CLEAR ?auto_12288 ) ( not ( = ?auto_12287 ?auto_12290 ) ) ( not ( = ?auto_12288 ?auto_12290 ) ) ( not ( = ?auto_12295 ?auto_12290 ) ) ( LIFTING ?auto_12293 ?auto_12296 ) ( IS-CRATE ?auto_12296 ) ( not ( = ?auto_12287 ?auto_12296 ) ) ( not ( = ?auto_12288 ?auto_12296 ) ) ( not ( = ?auto_12295 ?auto_12296 ) ) ( not ( = ?auto_12290 ?auto_12296 ) ) )
    :subtasks
    ( ( !LOAD ?auto_12293 ?auto_12296 ?auto_12292 ?auto_12291 )
      ( MAKE-1CRATE ?auto_12287 ?auto_12288 )
      ( MAKE-1CRATE-VERIFY ?auto_12287 ?auto_12288 ) )
  )

)

