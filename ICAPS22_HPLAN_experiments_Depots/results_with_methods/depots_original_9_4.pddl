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
      ?auto_63899 - SURFACE
      ?auto_63900 - SURFACE
    )
    :vars
    (
      ?auto_63901 - HOIST
      ?auto_63902 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_63901 ?auto_63902 ) ( SURFACE-AT ?auto_63900 ?auto_63902 ) ( CLEAR ?auto_63900 ) ( LIFTING ?auto_63901 ?auto_63899 ) ( IS-CRATE ?auto_63899 ) ( not ( = ?auto_63899 ?auto_63900 ) ) )
    :subtasks
    ( ( !DROP ?auto_63901 ?auto_63899 ?auto_63900 ?auto_63902 )
      ( MAKE-ON-VERIFY ?auto_63899 ?auto_63900 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_63903 - SURFACE
      ?auto_63904 - SURFACE
    )
    :vars
    (
      ?auto_63905 - HOIST
      ?auto_63906 - PLACE
      ?auto_63907 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_63905 ?auto_63906 ) ( SURFACE-AT ?auto_63904 ?auto_63906 ) ( CLEAR ?auto_63904 ) ( IS-CRATE ?auto_63903 ) ( not ( = ?auto_63903 ?auto_63904 ) ) ( TRUCK-AT ?auto_63907 ?auto_63906 ) ( AVAILABLE ?auto_63905 ) ( IN ?auto_63903 ?auto_63907 ) )
    :subtasks
    ( ( !UNLOAD ?auto_63905 ?auto_63903 ?auto_63907 ?auto_63906 )
      ( MAKE-ON ?auto_63903 ?auto_63904 )
      ( MAKE-ON-VERIFY ?auto_63903 ?auto_63904 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_63908 - SURFACE
      ?auto_63909 - SURFACE
    )
    :vars
    (
      ?auto_63912 - HOIST
      ?auto_63911 - PLACE
      ?auto_63910 - TRUCK
      ?auto_63913 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_63912 ?auto_63911 ) ( SURFACE-AT ?auto_63909 ?auto_63911 ) ( CLEAR ?auto_63909 ) ( IS-CRATE ?auto_63908 ) ( not ( = ?auto_63908 ?auto_63909 ) ) ( AVAILABLE ?auto_63912 ) ( IN ?auto_63908 ?auto_63910 ) ( TRUCK-AT ?auto_63910 ?auto_63913 ) ( not ( = ?auto_63913 ?auto_63911 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_63910 ?auto_63913 ?auto_63911 )
      ( MAKE-ON ?auto_63908 ?auto_63909 )
      ( MAKE-ON-VERIFY ?auto_63908 ?auto_63909 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_63914 - SURFACE
      ?auto_63915 - SURFACE
    )
    :vars
    (
      ?auto_63916 - HOIST
      ?auto_63918 - PLACE
      ?auto_63919 - TRUCK
      ?auto_63917 - PLACE
      ?auto_63920 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_63916 ?auto_63918 ) ( SURFACE-AT ?auto_63915 ?auto_63918 ) ( CLEAR ?auto_63915 ) ( IS-CRATE ?auto_63914 ) ( not ( = ?auto_63914 ?auto_63915 ) ) ( AVAILABLE ?auto_63916 ) ( TRUCK-AT ?auto_63919 ?auto_63917 ) ( not ( = ?auto_63917 ?auto_63918 ) ) ( HOIST-AT ?auto_63920 ?auto_63917 ) ( LIFTING ?auto_63920 ?auto_63914 ) ( not ( = ?auto_63916 ?auto_63920 ) ) )
    :subtasks
    ( ( !LOAD ?auto_63920 ?auto_63914 ?auto_63919 ?auto_63917 )
      ( MAKE-ON ?auto_63914 ?auto_63915 )
      ( MAKE-ON-VERIFY ?auto_63914 ?auto_63915 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_63921 - SURFACE
      ?auto_63922 - SURFACE
    )
    :vars
    (
      ?auto_63925 - HOIST
      ?auto_63924 - PLACE
      ?auto_63927 - TRUCK
      ?auto_63926 - PLACE
      ?auto_63923 - HOIST
      ?auto_63928 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_63925 ?auto_63924 ) ( SURFACE-AT ?auto_63922 ?auto_63924 ) ( CLEAR ?auto_63922 ) ( IS-CRATE ?auto_63921 ) ( not ( = ?auto_63921 ?auto_63922 ) ) ( AVAILABLE ?auto_63925 ) ( TRUCK-AT ?auto_63927 ?auto_63926 ) ( not ( = ?auto_63926 ?auto_63924 ) ) ( HOIST-AT ?auto_63923 ?auto_63926 ) ( not ( = ?auto_63925 ?auto_63923 ) ) ( AVAILABLE ?auto_63923 ) ( SURFACE-AT ?auto_63921 ?auto_63926 ) ( ON ?auto_63921 ?auto_63928 ) ( CLEAR ?auto_63921 ) ( not ( = ?auto_63921 ?auto_63928 ) ) ( not ( = ?auto_63922 ?auto_63928 ) ) )
    :subtasks
    ( ( !LIFT ?auto_63923 ?auto_63921 ?auto_63928 ?auto_63926 )
      ( MAKE-ON ?auto_63921 ?auto_63922 )
      ( MAKE-ON-VERIFY ?auto_63921 ?auto_63922 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_63929 - SURFACE
      ?auto_63930 - SURFACE
    )
    :vars
    (
      ?auto_63933 - HOIST
      ?auto_63932 - PLACE
      ?auto_63936 - PLACE
      ?auto_63935 - HOIST
      ?auto_63931 - SURFACE
      ?auto_63934 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_63933 ?auto_63932 ) ( SURFACE-AT ?auto_63930 ?auto_63932 ) ( CLEAR ?auto_63930 ) ( IS-CRATE ?auto_63929 ) ( not ( = ?auto_63929 ?auto_63930 ) ) ( AVAILABLE ?auto_63933 ) ( not ( = ?auto_63936 ?auto_63932 ) ) ( HOIST-AT ?auto_63935 ?auto_63936 ) ( not ( = ?auto_63933 ?auto_63935 ) ) ( AVAILABLE ?auto_63935 ) ( SURFACE-AT ?auto_63929 ?auto_63936 ) ( ON ?auto_63929 ?auto_63931 ) ( CLEAR ?auto_63929 ) ( not ( = ?auto_63929 ?auto_63931 ) ) ( not ( = ?auto_63930 ?auto_63931 ) ) ( TRUCK-AT ?auto_63934 ?auto_63932 ) )
    :subtasks
    ( ( !DRIVE ?auto_63934 ?auto_63932 ?auto_63936 )
      ( MAKE-ON ?auto_63929 ?auto_63930 )
      ( MAKE-ON-VERIFY ?auto_63929 ?auto_63930 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_63939 - SURFACE
      ?auto_63940 - SURFACE
    )
    :vars
    (
      ?auto_63941 - HOIST
      ?auto_63942 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_63941 ?auto_63942 ) ( SURFACE-AT ?auto_63940 ?auto_63942 ) ( CLEAR ?auto_63940 ) ( LIFTING ?auto_63941 ?auto_63939 ) ( IS-CRATE ?auto_63939 ) ( not ( = ?auto_63939 ?auto_63940 ) ) )
    :subtasks
    ( ( !DROP ?auto_63941 ?auto_63939 ?auto_63940 ?auto_63942 )
      ( MAKE-ON-VERIFY ?auto_63939 ?auto_63940 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_63943 - SURFACE
      ?auto_63944 - SURFACE
    )
    :vars
    (
      ?auto_63946 - HOIST
      ?auto_63945 - PLACE
      ?auto_63947 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_63946 ?auto_63945 ) ( SURFACE-AT ?auto_63944 ?auto_63945 ) ( CLEAR ?auto_63944 ) ( IS-CRATE ?auto_63943 ) ( not ( = ?auto_63943 ?auto_63944 ) ) ( TRUCK-AT ?auto_63947 ?auto_63945 ) ( AVAILABLE ?auto_63946 ) ( IN ?auto_63943 ?auto_63947 ) )
    :subtasks
    ( ( !UNLOAD ?auto_63946 ?auto_63943 ?auto_63947 ?auto_63945 )
      ( MAKE-ON ?auto_63943 ?auto_63944 )
      ( MAKE-ON-VERIFY ?auto_63943 ?auto_63944 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_63948 - SURFACE
      ?auto_63949 - SURFACE
    )
    :vars
    (
      ?auto_63950 - HOIST
      ?auto_63951 - PLACE
      ?auto_63952 - TRUCK
      ?auto_63953 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_63950 ?auto_63951 ) ( SURFACE-AT ?auto_63949 ?auto_63951 ) ( CLEAR ?auto_63949 ) ( IS-CRATE ?auto_63948 ) ( not ( = ?auto_63948 ?auto_63949 ) ) ( AVAILABLE ?auto_63950 ) ( IN ?auto_63948 ?auto_63952 ) ( TRUCK-AT ?auto_63952 ?auto_63953 ) ( not ( = ?auto_63953 ?auto_63951 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_63952 ?auto_63953 ?auto_63951 )
      ( MAKE-ON ?auto_63948 ?auto_63949 )
      ( MAKE-ON-VERIFY ?auto_63948 ?auto_63949 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_63954 - SURFACE
      ?auto_63955 - SURFACE
    )
    :vars
    (
      ?auto_63959 - HOIST
      ?auto_63958 - PLACE
      ?auto_63956 - TRUCK
      ?auto_63957 - PLACE
      ?auto_63960 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_63959 ?auto_63958 ) ( SURFACE-AT ?auto_63955 ?auto_63958 ) ( CLEAR ?auto_63955 ) ( IS-CRATE ?auto_63954 ) ( not ( = ?auto_63954 ?auto_63955 ) ) ( AVAILABLE ?auto_63959 ) ( TRUCK-AT ?auto_63956 ?auto_63957 ) ( not ( = ?auto_63957 ?auto_63958 ) ) ( HOIST-AT ?auto_63960 ?auto_63957 ) ( LIFTING ?auto_63960 ?auto_63954 ) ( not ( = ?auto_63959 ?auto_63960 ) ) )
    :subtasks
    ( ( !LOAD ?auto_63960 ?auto_63954 ?auto_63956 ?auto_63957 )
      ( MAKE-ON ?auto_63954 ?auto_63955 )
      ( MAKE-ON-VERIFY ?auto_63954 ?auto_63955 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_63961 - SURFACE
      ?auto_63962 - SURFACE
    )
    :vars
    (
      ?auto_63966 - HOIST
      ?auto_63964 - PLACE
      ?auto_63967 - TRUCK
      ?auto_63963 - PLACE
      ?auto_63965 - HOIST
      ?auto_63968 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_63966 ?auto_63964 ) ( SURFACE-AT ?auto_63962 ?auto_63964 ) ( CLEAR ?auto_63962 ) ( IS-CRATE ?auto_63961 ) ( not ( = ?auto_63961 ?auto_63962 ) ) ( AVAILABLE ?auto_63966 ) ( TRUCK-AT ?auto_63967 ?auto_63963 ) ( not ( = ?auto_63963 ?auto_63964 ) ) ( HOIST-AT ?auto_63965 ?auto_63963 ) ( not ( = ?auto_63966 ?auto_63965 ) ) ( AVAILABLE ?auto_63965 ) ( SURFACE-AT ?auto_63961 ?auto_63963 ) ( ON ?auto_63961 ?auto_63968 ) ( CLEAR ?auto_63961 ) ( not ( = ?auto_63961 ?auto_63968 ) ) ( not ( = ?auto_63962 ?auto_63968 ) ) )
    :subtasks
    ( ( !LIFT ?auto_63965 ?auto_63961 ?auto_63968 ?auto_63963 )
      ( MAKE-ON ?auto_63961 ?auto_63962 )
      ( MAKE-ON-VERIFY ?auto_63961 ?auto_63962 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_63969 - SURFACE
      ?auto_63970 - SURFACE
    )
    :vars
    (
      ?auto_63971 - HOIST
      ?auto_63974 - PLACE
      ?auto_63976 - PLACE
      ?auto_63973 - HOIST
      ?auto_63975 - SURFACE
      ?auto_63972 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_63971 ?auto_63974 ) ( SURFACE-AT ?auto_63970 ?auto_63974 ) ( CLEAR ?auto_63970 ) ( IS-CRATE ?auto_63969 ) ( not ( = ?auto_63969 ?auto_63970 ) ) ( AVAILABLE ?auto_63971 ) ( not ( = ?auto_63976 ?auto_63974 ) ) ( HOIST-AT ?auto_63973 ?auto_63976 ) ( not ( = ?auto_63971 ?auto_63973 ) ) ( AVAILABLE ?auto_63973 ) ( SURFACE-AT ?auto_63969 ?auto_63976 ) ( ON ?auto_63969 ?auto_63975 ) ( CLEAR ?auto_63969 ) ( not ( = ?auto_63969 ?auto_63975 ) ) ( not ( = ?auto_63970 ?auto_63975 ) ) ( TRUCK-AT ?auto_63972 ?auto_63974 ) )
    :subtasks
    ( ( !DRIVE ?auto_63972 ?auto_63974 ?auto_63976 )
      ( MAKE-ON ?auto_63969 ?auto_63970 )
      ( MAKE-ON-VERIFY ?auto_63969 ?auto_63970 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_63977 - SURFACE
      ?auto_63978 - SURFACE
    )
    :vars
    (
      ?auto_63983 - HOIST
      ?auto_63982 - PLACE
      ?auto_63980 - PLACE
      ?auto_63981 - HOIST
      ?auto_63984 - SURFACE
      ?auto_63979 - TRUCK
      ?auto_63985 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_63983 ?auto_63982 ) ( IS-CRATE ?auto_63977 ) ( not ( = ?auto_63977 ?auto_63978 ) ) ( not ( = ?auto_63980 ?auto_63982 ) ) ( HOIST-AT ?auto_63981 ?auto_63980 ) ( not ( = ?auto_63983 ?auto_63981 ) ) ( AVAILABLE ?auto_63981 ) ( SURFACE-AT ?auto_63977 ?auto_63980 ) ( ON ?auto_63977 ?auto_63984 ) ( CLEAR ?auto_63977 ) ( not ( = ?auto_63977 ?auto_63984 ) ) ( not ( = ?auto_63978 ?auto_63984 ) ) ( TRUCK-AT ?auto_63979 ?auto_63982 ) ( SURFACE-AT ?auto_63985 ?auto_63982 ) ( CLEAR ?auto_63985 ) ( LIFTING ?auto_63983 ?auto_63978 ) ( IS-CRATE ?auto_63978 ) ( not ( = ?auto_63977 ?auto_63985 ) ) ( not ( = ?auto_63978 ?auto_63985 ) ) ( not ( = ?auto_63984 ?auto_63985 ) ) )
    :subtasks
    ( ( !DROP ?auto_63983 ?auto_63978 ?auto_63985 ?auto_63982 )
      ( MAKE-ON ?auto_63977 ?auto_63978 )
      ( MAKE-ON-VERIFY ?auto_63977 ?auto_63978 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_63986 - SURFACE
      ?auto_63987 - SURFACE
    )
    :vars
    (
      ?auto_63991 - HOIST
      ?auto_63992 - PLACE
      ?auto_63993 - PLACE
      ?auto_63990 - HOIST
      ?auto_63989 - SURFACE
      ?auto_63994 - TRUCK
      ?auto_63988 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_63991 ?auto_63992 ) ( IS-CRATE ?auto_63986 ) ( not ( = ?auto_63986 ?auto_63987 ) ) ( not ( = ?auto_63993 ?auto_63992 ) ) ( HOIST-AT ?auto_63990 ?auto_63993 ) ( not ( = ?auto_63991 ?auto_63990 ) ) ( AVAILABLE ?auto_63990 ) ( SURFACE-AT ?auto_63986 ?auto_63993 ) ( ON ?auto_63986 ?auto_63989 ) ( CLEAR ?auto_63986 ) ( not ( = ?auto_63986 ?auto_63989 ) ) ( not ( = ?auto_63987 ?auto_63989 ) ) ( TRUCK-AT ?auto_63994 ?auto_63992 ) ( SURFACE-AT ?auto_63988 ?auto_63992 ) ( CLEAR ?auto_63988 ) ( IS-CRATE ?auto_63987 ) ( not ( = ?auto_63986 ?auto_63988 ) ) ( not ( = ?auto_63987 ?auto_63988 ) ) ( not ( = ?auto_63989 ?auto_63988 ) ) ( AVAILABLE ?auto_63991 ) ( IN ?auto_63987 ?auto_63994 ) )
    :subtasks
    ( ( !UNLOAD ?auto_63991 ?auto_63987 ?auto_63994 ?auto_63992 )
      ( MAKE-ON ?auto_63986 ?auto_63987 )
      ( MAKE-ON-VERIFY ?auto_63986 ?auto_63987 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_63995 - SURFACE
      ?auto_63996 - SURFACE
    )
    :vars
    (
      ?auto_63999 - HOIST
      ?auto_64003 - PLACE
      ?auto_63997 - PLACE
      ?auto_64002 - HOIST
      ?auto_64000 - SURFACE
      ?auto_64001 - SURFACE
      ?auto_63998 - TRUCK
      ?auto_64004 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_63999 ?auto_64003 ) ( IS-CRATE ?auto_63995 ) ( not ( = ?auto_63995 ?auto_63996 ) ) ( not ( = ?auto_63997 ?auto_64003 ) ) ( HOIST-AT ?auto_64002 ?auto_63997 ) ( not ( = ?auto_63999 ?auto_64002 ) ) ( AVAILABLE ?auto_64002 ) ( SURFACE-AT ?auto_63995 ?auto_63997 ) ( ON ?auto_63995 ?auto_64000 ) ( CLEAR ?auto_63995 ) ( not ( = ?auto_63995 ?auto_64000 ) ) ( not ( = ?auto_63996 ?auto_64000 ) ) ( SURFACE-AT ?auto_64001 ?auto_64003 ) ( CLEAR ?auto_64001 ) ( IS-CRATE ?auto_63996 ) ( not ( = ?auto_63995 ?auto_64001 ) ) ( not ( = ?auto_63996 ?auto_64001 ) ) ( not ( = ?auto_64000 ?auto_64001 ) ) ( AVAILABLE ?auto_63999 ) ( IN ?auto_63996 ?auto_63998 ) ( TRUCK-AT ?auto_63998 ?auto_64004 ) ( not ( = ?auto_64004 ?auto_64003 ) ) ( not ( = ?auto_63997 ?auto_64004 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_63998 ?auto_64004 ?auto_64003 )
      ( MAKE-ON ?auto_63995 ?auto_63996 )
      ( MAKE-ON-VERIFY ?auto_63995 ?auto_63996 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_64005 - SURFACE
      ?auto_64006 - SURFACE
    )
    :vars
    (
      ?auto_64011 - HOIST
      ?auto_64008 - PLACE
      ?auto_64014 - PLACE
      ?auto_64007 - HOIST
      ?auto_64013 - SURFACE
      ?auto_64012 - SURFACE
      ?auto_64009 - TRUCK
      ?auto_64010 - PLACE
      ?auto_64015 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_64011 ?auto_64008 ) ( IS-CRATE ?auto_64005 ) ( not ( = ?auto_64005 ?auto_64006 ) ) ( not ( = ?auto_64014 ?auto_64008 ) ) ( HOIST-AT ?auto_64007 ?auto_64014 ) ( not ( = ?auto_64011 ?auto_64007 ) ) ( AVAILABLE ?auto_64007 ) ( SURFACE-AT ?auto_64005 ?auto_64014 ) ( ON ?auto_64005 ?auto_64013 ) ( CLEAR ?auto_64005 ) ( not ( = ?auto_64005 ?auto_64013 ) ) ( not ( = ?auto_64006 ?auto_64013 ) ) ( SURFACE-AT ?auto_64012 ?auto_64008 ) ( CLEAR ?auto_64012 ) ( IS-CRATE ?auto_64006 ) ( not ( = ?auto_64005 ?auto_64012 ) ) ( not ( = ?auto_64006 ?auto_64012 ) ) ( not ( = ?auto_64013 ?auto_64012 ) ) ( AVAILABLE ?auto_64011 ) ( TRUCK-AT ?auto_64009 ?auto_64010 ) ( not ( = ?auto_64010 ?auto_64008 ) ) ( not ( = ?auto_64014 ?auto_64010 ) ) ( HOIST-AT ?auto_64015 ?auto_64010 ) ( LIFTING ?auto_64015 ?auto_64006 ) ( not ( = ?auto_64011 ?auto_64015 ) ) ( not ( = ?auto_64007 ?auto_64015 ) ) )
    :subtasks
    ( ( !LOAD ?auto_64015 ?auto_64006 ?auto_64009 ?auto_64010 )
      ( MAKE-ON ?auto_64005 ?auto_64006 )
      ( MAKE-ON-VERIFY ?auto_64005 ?auto_64006 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_64016 - SURFACE
      ?auto_64017 - SURFACE
    )
    :vars
    (
      ?auto_64020 - HOIST
      ?auto_64026 - PLACE
      ?auto_64022 - PLACE
      ?auto_64025 - HOIST
      ?auto_64024 - SURFACE
      ?auto_64018 - SURFACE
      ?auto_64021 - TRUCK
      ?auto_64023 - PLACE
      ?auto_64019 - HOIST
      ?auto_64027 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_64020 ?auto_64026 ) ( IS-CRATE ?auto_64016 ) ( not ( = ?auto_64016 ?auto_64017 ) ) ( not ( = ?auto_64022 ?auto_64026 ) ) ( HOIST-AT ?auto_64025 ?auto_64022 ) ( not ( = ?auto_64020 ?auto_64025 ) ) ( AVAILABLE ?auto_64025 ) ( SURFACE-AT ?auto_64016 ?auto_64022 ) ( ON ?auto_64016 ?auto_64024 ) ( CLEAR ?auto_64016 ) ( not ( = ?auto_64016 ?auto_64024 ) ) ( not ( = ?auto_64017 ?auto_64024 ) ) ( SURFACE-AT ?auto_64018 ?auto_64026 ) ( CLEAR ?auto_64018 ) ( IS-CRATE ?auto_64017 ) ( not ( = ?auto_64016 ?auto_64018 ) ) ( not ( = ?auto_64017 ?auto_64018 ) ) ( not ( = ?auto_64024 ?auto_64018 ) ) ( AVAILABLE ?auto_64020 ) ( TRUCK-AT ?auto_64021 ?auto_64023 ) ( not ( = ?auto_64023 ?auto_64026 ) ) ( not ( = ?auto_64022 ?auto_64023 ) ) ( HOIST-AT ?auto_64019 ?auto_64023 ) ( not ( = ?auto_64020 ?auto_64019 ) ) ( not ( = ?auto_64025 ?auto_64019 ) ) ( AVAILABLE ?auto_64019 ) ( SURFACE-AT ?auto_64017 ?auto_64023 ) ( ON ?auto_64017 ?auto_64027 ) ( CLEAR ?auto_64017 ) ( not ( = ?auto_64016 ?auto_64027 ) ) ( not ( = ?auto_64017 ?auto_64027 ) ) ( not ( = ?auto_64024 ?auto_64027 ) ) ( not ( = ?auto_64018 ?auto_64027 ) ) )
    :subtasks
    ( ( !LIFT ?auto_64019 ?auto_64017 ?auto_64027 ?auto_64023 )
      ( MAKE-ON ?auto_64016 ?auto_64017 )
      ( MAKE-ON-VERIFY ?auto_64016 ?auto_64017 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_64028 - SURFACE
      ?auto_64029 - SURFACE
    )
    :vars
    (
      ?auto_64033 - HOIST
      ?auto_64039 - PLACE
      ?auto_64035 - PLACE
      ?auto_64037 - HOIST
      ?auto_64034 - SURFACE
      ?auto_64032 - SURFACE
      ?auto_64031 - PLACE
      ?auto_64036 - HOIST
      ?auto_64038 - SURFACE
      ?auto_64030 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_64033 ?auto_64039 ) ( IS-CRATE ?auto_64028 ) ( not ( = ?auto_64028 ?auto_64029 ) ) ( not ( = ?auto_64035 ?auto_64039 ) ) ( HOIST-AT ?auto_64037 ?auto_64035 ) ( not ( = ?auto_64033 ?auto_64037 ) ) ( AVAILABLE ?auto_64037 ) ( SURFACE-AT ?auto_64028 ?auto_64035 ) ( ON ?auto_64028 ?auto_64034 ) ( CLEAR ?auto_64028 ) ( not ( = ?auto_64028 ?auto_64034 ) ) ( not ( = ?auto_64029 ?auto_64034 ) ) ( SURFACE-AT ?auto_64032 ?auto_64039 ) ( CLEAR ?auto_64032 ) ( IS-CRATE ?auto_64029 ) ( not ( = ?auto_64028 ?auto_64032 ) ) ( not ( = ?auto_64029 ?auto_64032 ) ) ( not ( = ?auto_64034 ?auto_64032 ) ) ( AVAILABLE ?auto_64033 ) ( not ( = ?auto_64031 ?auto_64039 ) ) ( not ( = ?auto_64035 ?auto_64031 ) ) ( HOIST-AT ?auto_64036 ?auto_64031 ) ( not ( = ?auto_64033 ?auto_64036 ) ) ( not ( = ?auto_64037 ?auto_64036 ) ) ( AVAILABLE ?auto_64036 ) ( SURFACE-AT ?auto_64029 ?auto_64031 ) ( ON ?auto_64029 ?auto_64038 ) ( CLEAR ?auto_64029 ) ( not ( = ?auto_64028 ?auto_64038 ) ) ( not ( = ?auto_64029 ?auto_64038 ) ) ( not ( = ?auto_64034 ?auto_64038 ) ) ( not ( = ?auto_64032 ?auto_64038 ) ) ( TRUCK-AT ?auto_64030 ?auto_64039 ) )
    :subtasks
    ( ( !DRIVE ?auto_64030 ?auto_64039 ?auto_64031 )
      ( MAKE-ON ?auto_64028 ?auto_64029 )
      ( MAKE-ON-VERIFY ?auto_64028 ?auto_64029 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_64042 - SURFACE
      ?auto_64043 - SURFACE
    )
    :vars
    (
      ?auto_64044 - HOIST
      ?auto_64045 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_64044 ?auto_64045 ) ( SURFACE-AT ?auto_64043 ?auto_64045 ) ( CLEAR ?auto_64043 ) ( LIFTING ?auto_64044 ?auto_64042 ) ( IS-CRATE ?auto_64042 ) ( not ( = ?auto_64042 ?auto_64043 ) ) )
    :subtasks
    ( ( !DROP ?auto_64044 ?auto_64042 ?auto_64043 ?auto_64045 )
      ( MAKE-ON-VERIFY ?auto_64042 ?auto_64043 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_64046 - SURFACE
      ?auto_64047 - SURFACE
    )
    :vars
    (
      ?auto_64048 - HOIST
      ?auto_64049 - PLACE
      ?auto_64050 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_64048 ?auto_64049 ) ( SURFACE-AT ?auto_64047 ?auto_64049 ) ( CLEAR ?auto_64047 ) ( IS-CRATE ?auto_64046 ) ( not ( = ?auto_64046 ?auto_64047 ) ) ( TRUCK-AT ?auto_64050 ?auto_64049 ) ( AVAILABLE ?auto_64048 ) ( IN ?auto_64046 ?auto_64050 ) )
    :subtasks
    ( ( !UNLOAD ?auto_64048 ?auto_64046 ?auto_64050 ?auto_64049 )
      ( MAKE-ON ?auto_64046 ?auto_64047 )
      ( MAKE-ON-VERIFY ?auto_64046 ?auto_64047 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_64051 - SURFACE
      ?auto_64052 - SURFACE
    )
    :vars
    (
      ?auto_64053 - HOIST
      ?auto_64054 - PLACE
      ?auto_64055 - TRUCK
      ?auto_64056 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_64053 ?auto_64054 ) ( SURFACE-AT ?auto_64052 ?auto_64054 ) ( CLEAR ?auto_64052 ) ( IS-CRATE ?auto_64051 ) ( not ( = ?auto_64051 ?auto_64052 ) ) ( AVAILABLE ?auto_64053 ) ( IN ?auto_64051 ?auto_64055 ) ( TRUCK-AT ?auto_64055 ?auto_64056 ) ( not ( = ?auto_64056 ?auto_64054 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_64055 ?auto_64056 ?auto_64054 )
      ( MAKE-ON ?auto_64051 ?auto_64052 )
      ( MAKE-ON-VERIFY ?auto_64051 ?auto_64052 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_64057 - SURFACE
      ?auto_64058 - SURFACE
    )
    :vars
    (
      ?auto_64062 - HOIST
      ?auto_64061 - PLACE
      ?auto_64060 - TRUCK
      ?auto_64059 - PLACE
      ?auto_64063 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_64062 ?auto_64061 ) ( SURFACE-AT ?auto_64058 ?auto_64061 ) ( CLEAR ?auto_64058 ) ( IS-CRATE ?auto_64057 ) ( not ( = ?auto_64057 ?auto_64058 ) ) ( AVAILABLE ?auto_64062 ) ( TRUCK-AT ?auto_64060 ?auto_64059 ) ( not ( = ?auto_64059 ?auto_64061 ) ) ( HOIST-AT ?auto_64063 ?auto_64059 ) ( LIFTING ?auto_64063 ?auto_64057 ) ( not ( = ?auto_64062 ?auto_64063 ) ) )
    :subtasks
    ( ( !LOAD ?auto_64063 ?auto_64057 ?auto_64060 ?auto_64059 )
      ( MAKE-ON ?auto_64057 ?auto_64058 )
      ( MAKE-ON-VERIFY ?auto_64057 ?auto_64058 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_64064 - SURFACE
      ?auto_64065 - SURFACE
    )
    :vars
    (
      ?auto_64067 - HOIST
      ?auto_64070 - PLACE
      ?auto_64069 - TRUCK
      ?auto_64066 - PLACE
      ?auto_64068 - HOIST
      ?auto_64071 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_64067 ?auto_64070 ) ( SURFACE-AT ?auto_64065 ?auto_64070 ) ( CLEAR ?auto_64065 ) ( IS-CRATE ?auto_64064 ) ( not ( = ?auto_64064 ?auto_64065 ) ) ( AVAILABLE ?auto_64067 ) ( TRUCK-AT ?auto_64069 ?auto_64066 ) ( not ( = ?auto_64066 ?auto_64070 ) ) ( HOIST-AT ?auto_64068 ?auto_64066 ) ( not ( = ?auto_64067 ?auto_64068 ) ) ( AVAILABLE ?auto_64068 ) ( SURFACE-AT ?auto_64064 ?auto_64066 ) ( ON ?auto_64064 ?auto_64071 ) ( CLEAR ?auto_64064 ) ( not ( = ?auto_64064 ?auto_64071 ) ) ( not ( = ?auto_64065 ?auto_64071 ) ) )
    :subtasks
    ( ( !LIFT ?auto_64068 ?auto_64064 ?auto_64071 ?auto_64066 )
      ( MAKE-ON ?auto_64064 ?auto_64065 )
      ( MAKE-ON-VERIFY ?auto_64064 ?auto_64065 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_64072 - SURFACE
      ?auto_64073 - SURFACE
    )
    :vars
    (
      ?auto_64079 - HOIST
      ?auto_64074 - PLACE
      ?auto_64075 - PLACE
      ?auto_64077 - HOIST
      ?auto_64076 - SURFACE
      ?auto_64078 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_64079 ?auto_64074 ) ( SURFACE-AT ?auto_64073 ?auto_64074 ) ( CLEAR ?auto_64073 ) ( IS-CRATE ?auto_64072 ) ( not ( = ?auto_64072 ?auto_64073 ) ) ( AVAILABLE ?auto_64079 ) ( not ( = ?auto_64075 ?auto_64074 ) ) ( HOIST-AT ?auto_64077 ?auto_64075 ) ( not ( = ?auto_64079 ?auto_64077 ) ) ( AVAILABLE ?auto_64077 ) ( SURFACE-AT ?auto_64072 ?auto_64075 ) ( ON ?auto_64072 ?auto_64076 ) ( CLEAR ?auto_64072 ) ( not ( = ?auto_64072 ?auto_64076 ) ) ( not ( = ?auto_64073 ?auto_64076 ) ) ( TRUCK-AT ?auto_64078 ?auto_64074 ) )
    :subtasks
    ( ( !DRIVE ?auto_64078 ?auto_64074 ?auto_64075 )
      ( MAKE-ON ?auto_64072 ?auto_64073 )
      ( MAKE-ON-VERIFY ?auto_64072 ?auto_64073 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_64080 - SURFACE
      ?auto_64081 - SURFACE
    )
    :vars
    (
      ?auto_64086 - HOIST
      ?auto_64082 - PLACE
      ?auto_64083 - PLACE
      ?auto_64084 - HOIST
      ?auto_64085 - SURFACE
      ?auto_64087 - TRUCK
      ?auto_64088 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_64086 ?auto_64082 ) ( IS-CRATE ?auto_64080 ) ( not ( = ?auto_64080 ?auto_64081 ) ) ( not ( = ?auto_64083 ?auto_64082 ) ) ( HOIST-AT ?auto_64084 ?auto_64083 ) ( not ( = ?auto_64086 ?auto_64084 ) ) ( AVAILABLE ?auto_64084 ) ( SURFACE-AT ?auto_64080 ?auto_64083 ) ( ON ?auto_64080 ?auto_64085 ) ( CLEAR ?auto_64080 ) ( not ( = ?auto_64080 ?auto_64085 ) ) ( not ( = ?auto_64081 ?auto_64085 ) ) ( TRUCK-AT ?auto_64087 ?auto_64082 ) ( SURFACE-AT ?auto_64088 ?auto_64082 ) ( CLEAR ?auto_64088 ) ( LIFTING ?auto_64086 ?auto_64081 ) ( IS-CRATE ?auto_64081 ) ( not ( = ?auto_64080 ?auto_64088 ) ) ( not ( = ?auto_64081 ?auto_64088 ) ) ( not ( = ?auto_64085 ?auto_64088 ) ) )
    :subtasks
    ( ( !DROP ?auto_64086 ?auto_64081 ?auto_64088 ?auto_64082 )
      ( MAKE-ON ?auto_64080 ?auto_64081 )
      ( MAKE-ON-VERIFY ?auto_64080 ?auto_64081 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_64089 - SURFACE
      ?auto_64090 - SURFACE
    )
    :vars
    (
      ?auto_64091 - HOIST
      ?auto_64092 - PLACE
      ?auto_64096 - PLACE
      ?auto_64095 - HOIST
      ?auto_64094 - SURFACE
      ?auto_64093 - TRUCK
      ?auto_64097 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_64091 ?auto_64092 ) ( IS-CRATE ?auto_64089 ) ( not ( = ?auto_64089 ?auto_64090 ) ) ( not ( = ?auto_64096 ?auto_64092 ) ) ( HOIST-AT ?auto_64095 ?auto_64096 ) ( not ( = ?auto_64091 ?auto_64095 ) ) ( AVAILABLE ?auto_64095 ) ( SURFACE-AT ?auto_64089 ?auto_64096 ) ( ON ?auto_64089 ?auto_64094 ) ( CLEAR ?auto_64089 ) ( not ( = ?auto_64089 ?auto_64094 ) ) ( not ( = ?auto_64090 ?auto_64094 ) ) ( TRUCK-AT ?auto_64093 ?auto_64092 ) ( SURFACE-AT ?auto_64097 ?auto_64092 ) ( CLEAR ?auto_64097 ) ( IS-CRATE ?auto_64090 ) ( not ( = ?auto_64089 ?auto_64097 ) ) ( not ( = ?auto_64090 ?auto_64097 ) ) ( not ( = ?auto_64094 ?auto_64097 ) ) ( AVAILABLE ?auto_64091 ) ( IN ?auto_64090 ?auto_64093 ) )
    :subtasks
    ( ( !UNLOAD ?auto_64091 ?auto_64090 ?auto_64093 ?auto_64092 )
      ( MAKE-ON ?auto_64089 ?auto_64090 )
      ( MAKE-ON-VERIFY ?auto_64089 ?auto_64090 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_64098 - SURFACE
      ?auto_64099 - SURFACE
    )
    :vars
    (
      ?auto_64100 - HOIST
      ?auto_64102 - PLACE
      ?auto_64103 - PLACE
      ?auto_64104 - HOIST
      ?auto_64101 - SURFACE
      ?auto_64106 - SURFACE
      ?auto_64105 - TRUCK
      ?auto_64107 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_64100 ?auto_64102 ) ( IS-CRATE ?auto_64098 ) ( not ( = ?auto_64098 ?auto_64099 ) ) ( not ( = ?auto_64103 ?auto_64102 ) ) ( HOIST-AT ?auto_64104 ?auto_64103 ) ( not ( = ?auto_64100 ?auto_64104 ) ) ( AVAILABLE ?auto_64104 ) ( SURFACE-AT ?auto_64098 ?auto_64103 ) ( ON ?auto_64098 ?auto_64101 ) ( CLEAR ?auto_64098 ) ( not ( = ?auto_64098 ?auto_64101 ) ) ( not ( = ?auto_64099 ?auto_64101 ) ) ( SURFACE-AT ?auto_64106 ?auto_64102 ) ( CLEAR ?auto_64106 ) ( IS-CRATE ?auto_64099 ) ( not ( = ?auto_64098 ?auto_64106 ) ) ( not ( = ?auto_64099 ?auto_64106 ) ) ( not ( = ?auto_64101 ?auto_64106 ) ) ( AVAILABLE ?auto_64100 ) ( IN ?auto_64099 ?auto_64105 ) ( TRUCK-AT ?auto_64105 ?auto_64107 ) ( not ( = ?auto_64107 ?auto_64102 ) ) ( not ( = ?auto_64103 ?auto_64107 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_64105 ?auto_64107 ?auto_64102 )
      ( MAKE-ON ?auto_64098 ?auto_64099 )
      ( MAKE-ON-VERIFY ?auto_64098 ?auto_64099 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_64108 - SURFACE
      ?auto_64109 - SURFACE
    )
    :vars
    (
      ?auto_64114 - HOIST
      ?auto_64115 - PLACE
      ?auto_64110 - PLACE
      ?auto_64111 - HOIST
      ?auto_64116 - SURFACE
      ?auto_64112 - SURFACE
      ?auto_64117 - TRUCK
      ?auto_64113 - PLACE
      ?auto_64118 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_64114 ?auto_64115 ) ( IS-CRATE ?auto_64108 ) ( not ( = ?auto_64108 ?auto_64109 ) ) ( not ( = ?auto_64110 ?auto_64115 ) ) ( HOIST-AT ?auto_64111 ?auto_64110 ) ( not ( = ?auto_64114 ?auto_64111 ) ) ( AVAILABLE ?auto_64111 ) ( SURFACE-AT ?auto_64108 ?auto_64110 ) ( ON ?auto_64108 ?auto_64116 ) ( CLEAR ?auto_64108 ) ( not ( = ?auto_64108 ?auto_64116 ) ) ( not ( = ?auto_64109 ?auto_64116 ) ) ( SURFACE-AT ?auto_64112 ?auto_64115 ) ( CLEAR ?auto_64112 ) ( IS-CRATE ?auto_64109 ) ( not ( = ?auto_64108 ?auto_64112 ) ) ( not ( = ?auto_64109 ?auto_64112 ) ) ( not ( = ?auto_64116 ?auto_64112 ) ) ( AVAILABLE ?auto_64114 ) ( TRUCK-AT ?auto_64117 ?auto_64113 ) ( not ( = ?auto_64113 ?auto_64115 ) ) ( not ( = ?auto_64110 ?auto_64113 ) ) ( HOIST-AT ?auto_64118 ?auto_64113 ) ( LIFTING ?auto_64118 ?auto_64109 ) ( not ( = ?auto_64114 ?auto_64118 ) ) ( not ( = ?auto_64111 ?auto_64118 ) ) )
    :subtasks
    ( ( !LOAD ?auto_64118 ?auto_64109 ?auto_64117 ?auto_64113 )
      ( MAKE-ON ?auto_64108 ?auto_64109 )
      ( MAKE-ON-VERIFY ?auto_64108 ?auto_64109 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_64119 - SURFACE
      ?auto_64120 - SURFACE
    )
    :vars
    (
      ?auto_64124 - HOIST
      ?auto_64122 - PLACE
      ?auto_64121 - PLACE
      ?auto_64125 - HOIST
      ?auto_64129 - SURFACE
      ?auto_64123 - SURFACE
      ?auto_64126 - TRUCK
      ?auto_64128 - PLACE
      ?auto_64127 - HOIST
      ?auto_64130 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_64124 ?auto_64122 ) ( IS-CRATE ?auto_64119 ) ( not ( = ?auto_64119 ?auto_64120 ) ) ( not ( = ?auto_64121 ?auto_64122 ) ) ( HOIST-AT ?auto_64125 ?auto_64121 ) ( not ( = ?auto_64124 ?auto_64125 ) ) ( AVAILABLE ?auto_64125 ) ( SURFACE-AT ?auto_64119 ?auto_64121 ) ( ON ?auto_64119 ?auto_64129 ) ( CLEAR ?auto_64119 ) ( not ( = ?auto_64119 ?auto_64129 ) ) ( not ( = ?auto_64120 ?auto_64129 ) ) ( SURFACE-AT ?auto_64123 ?auto_64122 ) ( CLEAR ?auto_64123 ) ( IS-CRATE ?auto_64120 ) ( not ( = ?auto_64119 ?auto_64123 ) ) ( not ( = ?auto_64120 ?auto_64123 ) ) ( not ( = ?auto_64129 ?auto_64123 ) ) ( AVAILABLE ?auto_64124 ) ( TRUCK-AT ?auto_64126 ?auto_64128 ) ( not ( = ?auto_64128 ?auto_64122 ) ) ( not ( = ?auto_64121 ?auto_64128 ) ) ( HOIST-AT ?auto_64127 ?auto_64128 ) ( not ( = ?auto_64124 ?auto_64127 ) ) ( not ( = ?auto_64125 ?auto_64127 ) ) ( AVAILABLE ?auto_64127 ) ( SURFACE-AT ?auto_64120 ?auto_64128 ) ( ON ?auto_64120 ?auto_64130 ) ( CLEAR ?auto_64120 ) ( not ( = ?auto_64119 ?auto_64130 ) ) ( not ( = ?auto_64120 ?auto_64130 ) ) ( not ( = ?auto_64129 ?auto_64130 ) ) ( not ( = ?auto_64123 ?auto_64130 ) ) )
    :subtasks
    ( ( !LIFT ?auto_64127 ?auto_64120 ?auto_64130 ?auto_64128 )
      ( MAKE-ON ?auto_64119 ?auto_64120 )
      ( MAKE-ON-VERIFY ?auto_64119 ?auto_64120 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_64131 - SURFACE
      ?auto_64132 - SURFACE
    )
    :vars
    (
      ?auto_64141 - HOIST
      ?auto_64140 - PLACE
      ?auto_64138 - PLACE
      ?auto_64142 - HOIST
      ?auto_64139 - SURFACE
      ?auto_64136 - SURFACE
      ?auto_64134 - PLACE
      ?auto_64133 - HOIST
      ?auto_64135 - SURFACE
      ?auto_64137 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_64141 ?auto_64140 ) ( IS-CRATE ?auto_64131 ) ( not ( = ?auto_64131 ?auto_64132 ) ) ( not ( = ?auto_64138 ?auto_64140 ) ) ( HOIST-AT ?auto_64142 ?auto_64138 ) ( not ( = ?auto_64141 ?auto_64142 ) ) ( AVAILABLE ?auto_64142 ) ( SURFACE-AT ?auto_64131 ?auto_64138 ) ( ON ?auto_64131 ?auto_64139 ) ( CLEAR ?auto_64131 ) ( not ( = ?auto_64131 ?auto_64139 ) ) ( not ( = ?auto_64132 ?auto_64139 ) ) ( SURFACE-AT ?auto_64136 ?auto_64140 ) ( CLEAR ?auto_64136 ) ( IS-CRATE ?auto_64132 ) ( not ( = ?auto_64131 ?auto_64136 ) ) ( not ( = ?auto_64132 ?auto_64136 ) ) ( not ( = ?auto_64139 ?auto_64136 ) ) ( AVAILABLE ?auto_64141 ) ( not ( = ?auto_64134 ?auto_64140 ) ) ( not ( = ?auto_64138 ?auto_64134 ) ) ( HOIST-AT ?auto_64133 ?auto_64134 ) ( not ( = ?auto_64141 ?auto_64133 ) ) ( not ( = ?auto_64142 ?auto_64133 ) ) ( AVAILABLE ?auto_64133 ) ( SURFACE-AT ?auto_64132 ?auto_64134 ) ( ON ?auto_64132 ?auto_64135 ) ( CLEAR ?auto_64132 ) ( not ( = ?auto_64131 ?auto_64135 ) ) ( not ( = ?auto_64132 ?auto_64135 ) ) ( not ( = ?auto_64139 ?auto_64135 ) ) ( not ( = ?auto_64136 ?auto_64135 ) ) ( TRUCK-AT ?auto_64137 ?auto_64140 ) )
    :subtasks
    ( ( !DRIVE ?auto_64137 ?auto_64140 ?auto_64134 )
      ( MAKE-ON ?auto_64131 ?auto_64132 )
      ( MAKE-ON-VERIFY ?auto_64131 ?auto_64132 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_64143 - SURFACE
      ?auto_64144 - SURFACE
    )
    :vars
    (
      ?auto_64154 - HOIST
      ?auto_64147 - PLACE
      ?auto_64149 - PLACE
      ?auto_64152 - HOIST
      ?auto_64146 - SURFACE
      ?auto_64150 - SURFACE
      ?auto_64148 - PLACE
      ?auto_64151 - HOIST
      ?auto_64145 - SURFACE
      ?auto_64153 - TRUCK
      ?auto_64155 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_64154 ?auto_64147 ) ( IS-CRATE ?auto_64143 ) ( not ( = ?auto_64143 ?auto_64144 ) ) ( not ( = ?auto_64149 ?auto_64147 ) ) ( HOIST-AT ?auto_64152 ?auto_64149 ) ( not ( = ?auto_64154 ?auto_64152 ) ) ( AVAILABLE ?auto_64152 ) ( SURFACE-AT ?auto_64143 ?auto_64149 ) ( ON ?auto_64143 ?auto_64146 ) ( CLEAR ?auto_64143 ) ( not ( = ?auto_64143 ?auto_64146 ) ) ( not ( = ?auto_64144 ?auto_64146 ) ) ( IS-CRATE ?auto_64144 ) ( not ( = ?auto_64143 ?auto_64150 ) ) ( not ( = ?auto_64144 ?auto_64150 ) ) ( not ( = ?auto_64146 ?auto_64150 ) ) ( not ( = ?auto_64148 ?auto_64147 ) ) ( not ( = ?auto_64149 ?auto_64148 ) ) ( HOIST-AT ?auto_64151 ?auto_64148 ) ( not ( = ?auto_64154 ?auto_64151 ) ) ( not ( = ?auto_64152 ?auto_64151 ) ) ( AVAILABLE ?auto_64151 ) ( SURFACE-AT ?auto_64144 ?auto_64148 ) ( ON ?auto_64144 ?auto_64145 ) ( CLEAR ?auto_64144 ) ( not ( = ?auto_64143 ?auto_64145 ) ) ( not ( = ?auto_64144 ?auto_64145 ) ) ( not ( = ?auto_64146 ?auto_64145 ) ) ( not ( = ?auto_64150 ?auto_64145 ) ) ( TRUCK-AT ?auto_64153 ?auto_64147 ) ( SURFACE-AT ?auto_64155 ?auto_64147 ) ( CLEAR ?auto_64155 ) ( LIFTING ?auto_64154 ?auto_64150 ) ( IS-CRATE ?auto_64150 ) ( not ( = ?auto_64143 ?auto_64155 ) ) ( not ( = ?auto_64144 ?auto_64155 ) ) ( not ( = ?auto_64146 ?auto_64155 ) ) ( not ( = ?auto_64150 ?auto_64155 ) ) ( not ( = ?auto_64145 ?auto_64155 ) ) )
    :subtasks
    ( ( !DROP ?auto_64154 ?auto_64150 ?auto_64155 ?auto_64147 )
      ( MAKE-ON ?auto_64143 ?auto_64144 )
      ( MAKE-ON-VERIFY ?auto_64143 ?auto_64144 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_64156 - SURFACE
      ?auto_64157 - SURFACE
    )
    :vars
    (
      ?auto_64160 - HOIST
      ?auto_64165 - PLACE
      ?auto_64158 - PLACE
      ?auto_64168 - HOIST
      ?auto_64159 - SURFACE
      ?auto_64167 - SURFACE
      ?auto_64164 - PLACE
      ?auto_64163 - HOIST
      ?auto_64162 - SURFACE
      ?auto_64161 - TRUCK
      ?auto_64166 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_64160 ?auto_64165 ) ( IS-CRATE ?auto_64156 ) ( not ( = ?auto_64156 ?auto_64157 ) ) ( not ( = ?auto_64158 ?auto_64165 ) ) ( HOIST-AT ?auto_64168 ?auto_64158 ) ( not ( = ?auto_64160 ?auto_64168 ) ) ( AVAILABLE ?auto_64168 ) ( SURFACE-AT ?auto_64156 ?auto_64158 ) ( ON ?auto_64156 ?auto_64159 ) ( CLEAR ?auto_64156 ) ( not ( = ?auto_64156 ?auto_64159 ) ) ( not ( = ?auto_64157 ?auto_64159 ) ) ( IS-CRATE ?auto_64157 ) ( not ( = ?auto_64156 ?auto_64167 ) ) ( not ( = ?auto_64157 ?auto_64167 ) ) ( not ( = ?auto_64159 ?auto_64167 ) ) ( not ( = ?auto_64164 ?auto_64165 ) ) ( not ( = ?auto_64158 ?auto_64164 ) ) ( HOIST-AT ?auto_64163 ?auto_64164 ) ( not ( = ?auto_64160 ?auto_64163 ) ) ( not ( = ?auto_64168 ?auto_64163 ) ) ( AVAILABLE ?auto_64163 ) ( SURFACE-AT ?auto_64157 ?auto_64164 ) ( ON ?auto_64157 ?auto_64162 ) ( CLEAR ?auto_64157 ) ( not ( = ?auto_64156 ?auto_64162 ) ) ( not ( = ?auto_64157 ?auto_64162 ) ) ( not ( = ?auto_64159 ?auto_64162 ) ) ( not ( = ?auto_64167 ?auto_64162 ) ) ( TRUCK-AT ?auto_64161 ?auto_64165 ) ( SURFACE-AT ?auto_64166 ?auto_64165 ) ( CLEAR ?auto_64166 ) ( IS-CRATE ?auto_64167 ) ( not ( = ?auto_64156 ?auto_64166 ) ) ( not ( = ?auto_64157 ?auto_64166 ) ) ( not ( = ?auto_64159 ?auto_64166 ) ) ( not ( = ?auto_64167 ?auto_64166 ) ) ( not ( = ?auto_64162 ?auto_64166 ) ) ( AVAILABLE ?auto_64160 ) ( IN ?auto_64167 ?auto_64161 ) )
    :subtasks
    ( ( !UNLOAD ?auto_64160 ?auto_64167 ?auto_64161 ?auto_64165 )
      ( MAKE-ON ?auto_64156 ?auto_64157 )
      ( MAKE-ON-VERIFY ?auto_64156 ?auto_64157 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_64169 - SURFACE
      ?auto_64170 - SURFACE
    )
    :vars
    (
      ?auto_64174 - HOIST
      ?auto_64173 - PLACE
      ?auto_64171 - PLACE
      ?auto_64176 - HOIST
      ?auto_64175 - SURFACE
      ?auto_64181 - SURFACE
      ?auto_64180 - PLACE
      ?auto_64177 - HOIST
      ?auto_64172 - SURFACE
      ?auto_64178 - SURFACE
      ?auto_64179 - TRUCK
      ?auto_64182 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_64174 ?auto_64173 ) ( IS-CRATE ?auto_64169 ) ( not ( = ?auto_64169 ?auto_64170 ) ) ( not ( = ?auto_64171 ?auto_64173 ) ) ( HOIST-AT ?auto_64176 ?auto_64171 ) ( not ( = ?auto_64174 ?auto_64176 ) ) ( AVAILABLE ?auto_64176 ) ( SURFACE-AT ?auto_64169 ?auto_64171 ) ( ON ?auto_64169 ?auto_64175 ) ( CLEAR ?auto_64169 ) ( not ( = ?auto_64169 ?auto_64175 ) ) ( not ( = ?auto_64170 ?auto_64175 ) ) ( IS-CRATE ?auto_64170 ) ( not ( = ?auto_64169 ?auto_64181 ) ) ( not ( = ?auto_64170 ?auto_64181 ) ) ( not ( = ?auto_64175 ?auto_64181 ) ) ( not ( = ?auto_64180 ?auto_64173 ) ) ( not ( = ?auto_64171 ?auto_64180 ) ) ( HOIST-AT ?auto_64177 ?auto_64180 ) ( not ( = ?auto_64174 ?auto_64177 ) ) ( not ( = ?auto_64176 ?auto_64177 ) ) ( AVAILABLE ?auto_64177 ) ( SURFACE-AT ?auto_64170 ?auto_64180 ) ( ON ?auto_64170 ?auto_64172 ) ( CLEAR ?auto_64170 ) ( not ( = ?auto_64169 ?auto_64172 ) ) ( not ( = ?auto_64170 ?auto_64172 ) ) ( not ( = ?auto_64175 ?auto_64172 ) ) ( not ( = ?auto_64181 ?auto_64172 ) ) ( SURFACE-AT ?auto_64178 ?auto_64173 ) ( CLEAR ?auto_64178 ) ( IS-CRATE ?auto_64181 ) ( not ( = ?auto_64169 ?auto_64178 ) ) ( not ( = ?auto_64170 ?auto_64178 ) ) ( not ( = ?auto_64175 ?auto_64178 ) ) ( not ( = ?auto_64181 ?auto_64178 ) ) ( not ( = ?auto_64172 ?auto_64178 ) ) ( AVAILABLE ?auto_64174 ) ( IN ?auto_64181 ?auto_64179 ) ( TRUCK-AT ?auto_64179 ?auto_64182 ) ( not ( = ?auto_64182 ?auto_64173 ) ) ( not ( = ?auto_64171 ?auto_64182 ) ) ( not ( = ?auto_64180 ?auto_64182 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_64179 ?auto_64182 ?auto_64173 )
      ( MAKE-ON ?auto_64169 ?auto_64170 )
      ( MAKE-ON-VERIFY ?auto_64169 ?auto_64170 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_64183 - SURFACE
      ?auto_64184 - SURFACE
    )
    :vars
    (
      ?auto_64188 - HOIST
      ?auto_64187 - PLACE
      ?auto_64190 - PLACE
      ?auto_64193 - HOIST
      ?auto_64186 - SURFACE
      ?auto_64192 - SURFACE
      ?auto_64189 - PLACE
      ?auto_64194 - HOIST
      ?auto_64196 - SURFACE
      ?auto_64191 - SURFACE
      ?auto_64195 - TRUCK
      ?auto_64185 - PLACE
      ?auto_64197 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_64188 ?auto_64187 ) ( IS-CRATE ?auto_64183 ) ( not ( = ?auto_64183 ?auto_64184 ) ) ( not ( = ?auto_64190 ?auto_64187 ) ) ( HOIST-AT ?auto_64193 ?auto_64190 ) ( not ( = ?auto_64188 ?auto_64193 ) ) ( AVAILABLE ?auto_64193 ) ( SURFACE-AT ?auto_64183 ?auto_64190 ) ( ON ?auto_64183 ?auto_64186 ) ( CLEAR ?auto_64183 ) ( not ( = ?auto_64183 ?auto_64186 ) ) ( not ( = ?auto_64184 ?auto_64186 ) ) ( IS-CRATE ?auto_64184 ) ( not ( = ?auto_64183 ?auto_64192 ) ) ( not ( = ?auto_64184 ?auto_64192 ) ) ( not ( = ?auto_64186 ?auto_64192 ) ) ( not ( = ?auto_64189 ?auto_64187 ) ) ( not ( = ?auto_64190 ?auto_64189 ) ) ( HOIST-AT ?auto_64194 ?auto_64189 ) ( not ( = ?auto_64188 ?auto_64194 ) ) ( not ( = ?auto_64193 ?auto_64194 ) ) ( AVAILABLE ?auto_64194 ) ( SURFACE-AT ?auto_64184 ?auto_64189 ) ( ON ?auto_64184 ?auto_64196 ) ( CLEAR ?auto_64184 ) ( not ( = ?auto_64183 ?auto_64196 ) ) ( not ( = ?auto_64184 ?auto_64196 ) ) ( not ( = ?auto_64186 ?auto_64196 ) ) ( not ( = ?auto_64192 ?auto_64196 ) ) ( SURFACE-AT ?auto_64191 ?auto_64187 ) ( CLEAR ?auto_64191 ) ( IS-CRATE ?auto_64192 ) ( not ( = ?auto_64183 ?auto_64191 ) ) ( not ( = ?auto_64184 ?auto_64191 ) ) ( not ( = ?auto_64186 ?auto_64191 ) ) ( not ( = ?auto_64192 ?auto_64191 ) ) ( not ( = ?auto_64196 ?auto_64191 ) ) ( AVAILABLE ?auto_64188 ) ( TRUCK-AT ?auto_64195 ?auto_64185 ) ( not ( = ?auto_64185 ?auto_64187 ) ) ( not ( = ?auto_64190 ?auto_64185 ) ) ( not ( = ?auto_64189 ?auto_64185 ) ) ( HOIST-AT ?auto_64197 ?auto_64185 ) ( LIFTING ?auto_64197 ?auto_64192 ) ( not ( = ?auto_64188 ?auto_64197 ) ) ( not ( = ?auto_64193 ?auto_64197 ) ) ( not ( = ?auto_64194 ?auto_64197 ) ) )
    :subtasks
    ( ( !LOAD ?auto_64197 ?auto_64192 ?auto_64195 ?auto_64185 )
      ( MAKE-ON ?auto_64183 ?auto_64184 )
      ( MAKE-ON-VERIFY ?auto_64183 ?auto_64184 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_64198 - SURFACE
      ?auto_64199 - SURFACE
    )
    :vars
    (
      ?auto_64201 - HOIST
      ?auto_64207 - PLACE
      ?auto_64206 - PLACE
      ?auto_64209 - HOIST
      ?auto_64208 - SURFACE
      ?auto_64204 - SURFACE
      ?auto_64210 - PLACE
      ?auto_64205 - HOIST
      ?auto_64212 - SURFACE
      ?auto_64200 - SURFACE
      ?auto_64203 - TRUCK
      ?auto_64211 - PLACE
      ?auto_64202 - HOIST
      ?auto_64213 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_64201 ?auto_64207 ) ( IS-CRATE ?auto_64198 ) ( not ( = ?auto_64198 ?auto_64199 ) ) ( not ( = ?auto_64206 ?auto_64207 ) ) ( HOIST-AT ?auto_64209 ?auto_64206 ) ( not ( = ?auto_64201 ?auto_64209 ) ) ( AVAILABLE ?auto_64209 ) ( SURFACE-AT ?auto_64198 ?auto_64206 ) ( ON ?auto_64198 ?auto_64208 ) ( CLEAR ?auto_64198 ) ( not ( = ?auto_64198 ?auto_64208 ) ) ( not ( = ?auto_64199 ?auto_64208 ) ) ( IS-CRATE ?auto_64199 ) ( not ( = ?auto_64198 ?auto_64204 ) ) ( not ( = ?auto_64199 ?auto_64204 ) ) ( not ( = ?auto_64208 ?auto_64204 ) ) ( not ( = ?auto_64210 ?auto_64207 ) ) ( not ( = ?auto_64206 ?auto_64210 ) ) ( HOIST-AT ?auto_64205 ?auto_64210 ) ( not ( = ?auto_64201 ?auto_64205 ) ) ( not ( = ?auto_64209 ?auto_64205 ) ) ( AVAILABLE ?auto_64205 ) ( SURFACE-AT ?auto_64199 ?auto_64210 ) ( ON ?auto_64199 ?auto_64212 ) ( CLEAR ?auto_64199 ) ( not ( = ?auto_64198 ?auto_64212 ) ) ( not ( = ?auto_64199 ?auto_64212 ) ) ( not ( = ?auto_64208 ?auto_64212 ) ) ( not ( = ?auto_64204 ?auto_64212 ) ) ( SURFACE-AT ?auto_64200 ?auto_64207 ) ( CLEAR ?auto_64200 ) ( IS-CRATE ?auto_64204 ) ( not ( = ?auto_64198 ?auto_64200 ) ) ( not ( = ?auto_64199 ?auto_64200 ) ) ( not ( = ?auto_64208 ?auto_64200 ) ) ( not ( = ?auto_64204 ?auto_64200 ) ) ( not ( = ?auto_64212 ?auto_64200 ) ) ( AVAILABLE ?auto_64201 ) ( TRUCK-AT ?auto_64203 ?auto_64211 ) ( not ( = ?auto_64211 ?auto_64207 ) ) ( not ( = ?auto_64206 ?auto_64211 ) ) ( not ( = ?auto_64210 ?auto_64211 ) ) ( HOIST-AT ?auto_64202 ?auto_64211 ) ( not ( = ?auto_64201 ?auto_64202 ) ) ( not ( = ?auto_64209 ?auto_64202 ) ) ( not ( = ?auto_64205 ?auto_64202 ) ) ( AVAILABLE ?auto_64202 ) ( SURFACE-AT ?auto_64204 ?auto_64211 ) ( ON ?auto_64204 ?auto_64213 ) ( CLEAR ?auto_64204 ) ( not ( = ?auto_64198 ?auto_64213 ) ) ( not ( = ?auto_64199 ?auto_64213 ) ) ( not ( = ?auto_64208 ?auto_64213 ) ) ( not ( = ?auto_64204 ?auto_64213 ) ) ( not ( = ?auto_64212 ?auto_64213 ) ) ( not ( = ?auto_64200 ?auto_64213 ) ) )
    :subtasks
    ( ( !LIFT ?auto_64202 ?auto_64204 ?auto_64213 ?auto_64211 )
      ( MAKE-ON ?auto_64198 ?auto_64199 )
      ( MAKE-ON-VERIFY ?auto_64198 ?auto_64199 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_64214 - SURFACE
      ?auto_64215 - SURFACE
    )
    :vars
    (
      ?auto_64223 - HOIST
      ?auto_64229 - PLACE
      ?auto_64218 - PLACE
      ?auto_64216 - HOIST
      ?auto_64226 - SURFACE
      ?auto_64222 - SURFACE
      ?auto_64220 - PLACE
      ?auto_64225 - HOIST
      ?auto_64224 - SURFACE
      ?auto_64219 - SURFACE
      ?auto_64227 - PLACE
      ?auto_64228 - HOIST
      ?auto_64217 - SURFACE
      ?auto_64221 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_64223 ?auto_64229 ) ( IS-CRATE ?auto_64214 ) ( not ( = ?auto_64214 ?auto_64215 ) ) ( not ( = ?auto_64218 ?auto_64229 ) ) ( HOIST-AT ?auto_64216 ?auto_64218 ) ( not ( = ?auto_64223 ?auto_64216 ) ) ( AVAILABLE ?auto_64216 ) ( SURFACE-AT ?auto_64214 ?auto_64218 ) ( ON ?auto_64214 ?auto_64226 ) ( CLEAR ?auto_64214 ) ( not ( = ?auto_64214 ?auto_64226 ) ) ( not ( = ?auto_64215 ?auto_64226 ) ) ( IS-CRATE ?auto_64215 ) ( not ( = ?auto_64214 ?auto_64222 ) ) ( not ( = ?auto_64215 ?auto_64222 ) ) ( not ( = ?auto_64226 ?auto_64222 ) ) ( not ( = ?auto_64220 ?auto_64229 ) ) ( not ( = ?auto_64218 ?auto_64220 ) ) ( HOIST-AT ?auto_64225 ?auto_64220 ) ( not ( = ?auto_64223 ?auto_64225 ) ) ( not ( = ?auto_64216 ?auto_64225 ) ) ( AVAILABLE ?auto_64225 ) ( SURFACE-AT ?auto_64215 ?auto_64220 ) ( ON ?auto_64215 ?auto_64224 ) ( CLEAR ?auto_64215 ) ( not ( = ?auto_64214 ?auto_64224 ) ) ( not ( = ?auto_64215 ?auto_64224 ) ) ( not ( = ?auto_64226 ?auto_64224 ) ) ( not ( = ?auto_64222 ?auto_64224 ) ) ( SURFACE-AT ?auto_64219 ?auto_64229 ) ( CLEAR ?auto_64219 ) ( IS-CRATE ?auto_64222 ) ( not ( = ?auto_64214 ?auto_64219 ) ) ( not ( = ?auto_64215 ?auto_64219 ) ) ( not ( = ?auto_64226 ?auto_64219 ) ) ( not ( = ?auto_64222 ?auto_64219 ) ) ( not ( = ?auto_64224 ?auto_64219 ) ) ( AVAILABLE ?auto_64223 ) ( not ( = ?auto_64227 ?auto_64229 ) ) ( not ( = ?auto_64218 ?auto_64227 ) ) ( not ( = ?auto_64220 ?auto_64227 ) ) ( HOIST-AT ?auto_64228 ?auto_64227 ) ( not ( = ?auto_64223 ?auto_64228 ) ) ( not ( = ?auto_64216 ?auto_64228 ) ) ( not ( = ?auto_64225 ?auto_64228 ) ) ( AVAILABLE ?auto_64228 ) ( SURFACE-AT ?auto_64222 ?auto_64227 ) ( ON ?auto_64222 ?auto_64217 ) ( CLEAR ?auto_64222 ) ( not ( = ?auto_64214 ?auto_64217 ) ) ( not ( = ?auto_64215 ?auto_64217 ) ) ( not ( = ?auto_64226 ?auto_64217 ) ) ( not ( = ?auto_64222 ?auto_64217 ) ) ( not ( = ?auto_64224 ?auto_64217 ) ) ( not ( = ?auto_64219 ?auto_64217 ) ) ( TRUCK-AT ?auto_64221 ?auto_64229 ) )
    :subtasks
    ( ( !DRIVE ?auto_64221 ?auto_64229 ?auto_64227 )
      ( MAKE-ON ?auto_64214 ?auto_64215 )
      ( MAKE-ON-VERIFY ?auto_64214 ?auto_64215 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_64232 - SURFACE
      ?auto_64233 - SURFACE
    )
    :vars
    (
      ?auto_64234 - HOIST
      ?auto_64235 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_64234 ?auto_64235 ) ( SURFACE-AT ?auto_64233 ?auto_64235 ) ( CLEAR ?auto_64233 ) ( LIFTING ?auto_64234 ?auto_64232 ) ( IS-CRATE ?auto_64232 ) ( not ( = ?auto_64232 ?auto_64233 ) ) )
    :subtasks
    ( ( !DROP ?auto_64234 ?auto_64232 ?auto_64233 ?auto_64235 )
      ( MAKE-ON-VERIFY ?auto_64232 ?auto_64233 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_64236 - SURFACE
      ?auto_64237 - SURFACE
    )
    :vars
    (
      ?auto_64238 - HOIST
      ?auto_64239 - PLACE
      ?auto_64240 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_64238 ?auto_64239 ) ( SURFACE-AT ?auto_64237 ?auto_64239 ) ( CLEAR ?auto_64237 ) ( IS-CRATE ?auto_64236 ) ( not ( = ?auto_64236 ?auto_64237 ) ) ( TRUCK-AT ?auto_64240 ?auto_64239 ) ( AVAILABLE ?auto_64238 ) ( IN ?auto_64236 ?auto_64240 ) )
    :subtasks
    ( ( !UNLOAD ?auto_64238 ?auto_64236 ?auto_64240 ?auto_64239 )
      ( MAKE-ON ?auto_64236 ?auto_64237 )
      ( MAKE-ON-VERIFY ?auto_64236 ?auto_64237 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_64241 - SURFACE
      ?auto_64242 - SURFACE
    )
    :vars
    (
      ?auto_64245 - HOIST
      ?auto_64244 - PLACE
      ?auto_64243 - TRUCK
      ?auto_64246 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_64245 ?auto_64244 ) ( SURFACE-AT ?auto_64242 ?auto_64244 ) ( CLEAR ?auto_64242 ) ( IS-CRATE ?auto_64241 ) ( not ( = ?auto_64241 ?auto_64242 ) ) ( AVAILABLE ?auto_64245 ) ( IN ?auto_64241 ?auto_64243 ) ( TRUCK-AT ?auto_64243 ?auto_64246 ) ( not ( = ?auto_64246 ?auto_64244 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_64243 ?auto_64246 ?auto_64244 )
      ( MAKE-ON ?auto_64241 ?auto_64242 )
      ( MAKE-ON-VERIFY ?auto_64241 ?auto_64242 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_64247 - SURFACE
      ?auto_64248 - SURFACE
    )
    :vars
    (
      ?auto_64249 - HOIST
      ?auto_64251 - PLACE
      ?auto_64252 - TRUCK
      ?auto_64250 - PLACE
      ?auto_64253 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_64249 ?auto_64251 ) ( SURFACE-AT ?auto_64248 ?auto_64251 ) ( CLEAR ?auto_64248 ) ( IS-CRATE ?auto_64247 ) ( not ( = ?auto_64247 ?auto_64248 ) ) ( AVAILABLE ?auto_64249 ) ( TRUCK-AT ?auto_64252 ?auto_64250 ) ( not ( = ?auto_64250 ?auto_64251 ) ) ( HOIST-AT ?auto_64253 ?auto_64250 ) ( LIFTING ?auto_64253 ?auto_64247 ) ( not ( = ?auto_64249 ?auto_64253 ) ) )
    :subtasks
    ( ( !LOAD ?auto_64253 ?auto_64247 ?auto_64252 ?auto_64250 )
      ( MAKE-ON ?auto_64247 ?auto_64248 )
      ( MAKE-ON-VERIFY ?auto_64247 ?auto_64248 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_64254 - SURFACE
      ?auto_64255 - SURFACE
    )
    :vars
    (
      ?auto_64256 - HOIST
      ?auto_64258 - PLACE
      ?auto_64259 - TRUCK
      ?auto_64257 - PLACE
      ?auto_64260 - HOIST
      ?auto_64261 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_64256 ?auto_64258 ) ( SURFACE-AT ?auto_64255 ?auto_64258 ) ( CLEAR ?auto_64255 ) ( IS-CRATE ?auto_64254 ) ( not ( = ?auto_64254 ?auto_64255 ) ) ( AVAILABLE ?auto_64256 ) ( TRUCK-AT ?auto_64259 ?auto_64257 ) ( not ( = ?auto_64257 ?auto_64258 ) ) ( HOIST-AT ?auto_64260 ?auto_64257 ) ( not ( = ?auto_64256 ?auto_64260 ) ) ( AVAILABLE ?auto_64260 ) ( SURFACE-AT ?auto_64254 ?auto_64257 ) ( ON ?auto_64254 ?auto_64261 ) ( CLEAR ?auto_64254 ) ( not ( = ?auto_64254 ?auto_64261 ) ) ( not ( = ?auto_64255 ?auto_64261 ) ) )
    :subtasks
    ( ( !LIFT ?auto_64260 ?auto_64254 ?auto_64261 ?auto_64257 )
      ( MAKE-ON ?auto_64254 ?auto_64255 )
      ( MAKE-ON-VERIFY ?auto_64254 ?auto_64255 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_64262 - SURFACE
      ?auto_64263 - SURFACE
    )
    :vars
    (
      ?auto_64266 - HOIST
      ?auto_64267 - PLACE
      ?auto_64269 - PLACE
      ?auto_64268 - HOIST
      ?auto_64265 - SURFACE
      ?auto_64264 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_64266 ?auto_64267 ) ( SURFACE-AT ?auto_64263 ?auto_64267 ) ( CLEAR ?auto_64263 ) ( IS-CRATE ?auto_64262 ) ( not ( = ?auto_64262 ?auto_64263 ) ) ( AVAILABLE ?auto_64266 ) ( not ( = ?auto_64269 ?auto_64267 ) ) ( HOIST-AT ?auto_64268 ?auto_64269 ) ( not ( = ?auto_64266 ?auto_64268 ) ) ( AVAILABLE ?auto_64268 ) ( SURFACE-AT ?auto_64262 ?auto_64269 ) ( ON ?auto_64262 ?auto_64265 ) ( CLEAR ?auto_64262 ) ( not ( = ?auto_64262 ?auto_64265 ) ) ( not ( = ?auto_64263 ?auto_64265 ) ) ( TRUCK-AT ?auto_64264 ?auto_64267 ) )
    :subtasks
    ( ( !DRIVE ?auto_64264 ?auto_64267 ?auto_64269 )
      ( MAKE-ON ?auto_64262 ?auto_64263 )
      ( MAKE-ON-VERIFY ?auto_64262 ?auto_64263 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_64270 - SURFACE
      ?auto_64271 - SURFACE
    )
    :vars
    (
      ?auto_64277 - HOIST
      ?auto_64273 - PLACE
      ?auto_64276 - PLACE
      ?auto_64272 - HOIST
      ?auto_64274 - SURFACE
      ?auto_64275 - TRUCK
      ?auto_64278 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_64277 ?auto_64273 ) ( IS-CRATE ?auto_64270 ) ( not ( = ?auto_64270 ?auto_64271 ) ) ( not ( = ?auto_64276 ?auto_64273 ) ) ( HOIST-AT ?auto_64272 ?auto_64276 ) ( not ( = ?auto_64277 ?auto_64272 ) ) ( AVAILABLE ?auto_64272 ) ( SURFACE-AT ?auto_64270 ?auto_64276 ) ( ON ?auto_64270 ?auto_64274 ) ( CLEAR ?auto_64270 ) ( not ( = ?auto_64270 ?auto_64274 ) ) ( not ( = ?auto_64271 ?auto_64274 ) ) ( TRUCK-AT ?auto_64275 ?auto_64273 ) ( SURFACE-AT ?auto_64278 ?auto_64273 ) ( CLEAR ?auto_64278 ) ( LIFTING ?auto_64277 ?auto_64271 ) ( IS-CRATE ?auto_64271 ) ( not ( = ?auto_64270 ?auto_64278 ) ) ( not ( = ?auto_64271 ?auto_64278 ) ) ( not ( = ?auto_64274 ?auto_64278 ) ) )
    :subtasks
    ( ( !DROP ?auto_64277 ?auto_64271 ?auto_64278 ?auto_64273 )
      ( MAKE-ON ?auto_64270 ?auto_64271 )
      ( MAKE-ON-VERIFY ?auto_64270 ?auto_64271 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_64279 - SURFACE
      ?auto_64280 - SURFACE
    )
    :vars
    (
      ?auto_64287 - HOIST
      ?auto_64286 - PLACE
      ?auto_64282 - PLACE
      ?auto_64281 - HOIST
      ?auto_64284 - SURFACE
      ?auto_64283 - TRUCK
      ?auto_64285 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_64287 ?auto_64286 ) ( IS-CRATE ?auto_64279 ) ( not ( = ?auto_64279 ?auto_64280 ) ) ( not ( = ?auto_64282 ?auto_64286 ) ) ( HOIST-AT ?auto_64281 ?auto_64282 ) ( not ( = ?auto_64287 ?auto_64281 ) ) ( AVAILABLE ?auto_64281 ) ( SURFACE-AT ?auto_64279 ?auto_64282 ) ( ON ?auto_64279 ?auto_64284 ) ( CLEAR ?auto_64279 ) ( not ( = ?auto_64279 ?auto_64284 ) ) ( not ( = ?auto_64280 ?auto_64284 ) ) ( TRUCK-AT ?auto_64283 ?auto_64286 ) ( SURFACE-AT ?auto_64285 ?auto_64286 ) ( CLEAR ?auto_64285 ) ( IS-CRATE ?auto_64280 ) ( not ( = ?auto_64279 ?auto_64285 ) ) ( not ( = ?auto_64280 ?auto_64285 ) ) ( not ( = ?auto_64284 ?auto_64285 ) ) ( AVAILABLE ?auto_64287 ) ( IN ?auto_64280 ?auto_64283 ) )
    :subtasks
    ( ( !UNLOAD ?auto_64287 ?auto_64280 ?auto_64283 ?auto_64286 )
      ( MAKE-ON ?auto_64279 ?auto_64280 )
      ( MAKE-ON-VERIFY ?auto_64279 ?auto_64280 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_64288 - SURFACE
      ?auto_64289 - SURFACE
    )
    :vars
    (
      ?auto_64291 - HOIST
      ?auto_64290 - PLACE
      ?auto_64296 - PLACE
      ?auto_64294 - HOIST
      ?auto_64292 - SURFACE
      ?auto_64293 - SURFACE
      ?auto_64295 - TRUCK
      ?auto_64297 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_64291 ?auto_64290 ) ( IS-CRATE ?auto_64288 ) ( not ( = ?auto_64288 ?auto_64289 ) ) ( not ( = ?auto_64296 ?auto_64290 ) ) ( HOIST-AT ?auto_64294 ?auto_64296 ) ( not ( = ?auto_64291 ?auto_64294 ) ) ( AVAILABLE ?auto_64294 ) ( SURFACE-AT ?auto_64288 ?auto_64296 ) ( ON ?auto_64288 ?auto_64292 ) ( CLEAR ?auto_64288 ) ( not ( = ?auto_64288 ?auto_64292 ) ) ( not ( = ?auto_64289 ?auto_64292 ) ) ( SURFACE-AT ?auto_64293 ?auto_64290 ) ( CLEAR ?auto_64293 ) ( IS-CRATE ?auto_64289 ) ( not ( = ?auto_64288 ?auto_64293 ) ) ( not ( = ?auto_64289 ?auto_64293 ) ) ( not ( = ?auto_64292 ?auto_64293 ) ) ( AVAILABLE ?auto_64291 ) ( IN ?auto_64289 ?auto_64295 ) ( TRUCK-AT ?auto_64295 ?auto_64297 ) ( not ( = ?auto_64297 ?auto_64290 ) ) ( not ( = ?auto_64296 ?auto_64297 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_64295 ?auto_64297 ?auto_64290 )
      ( MAKE-ON ?auto_64288 ?auto_64289 )
      ( MAKE-ON-VERIFY ?auto_64288 ?auto_64289 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_64298 - SURFACE
      ?auto_64299 - SURFACE
    )
    :vars
    (
      ?auto_64304 - HOIST
      ?auto_64302 - PLACE
      ?auto_64303 - PLACE
      ?auto_64306 - HOIST
      ?auto_64305 - SURFACE
      ?auto_64300 - SURFACE
      ?auto_64307 - TRUCK
      ?auto_64301 - PLACE
      ?auto_64308 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_64304 ?auto_64302 ) ( IS-CRATE ?auto_64298 ) ( not ( = ?auto_64298 ?auto_64299 ) ) ( not ( = ?auto_64303 ?auto_64302 ) ) ( HOIST-AT ?auto_64306 ?auto_64303 ) ( not ( = ?auto_64304 ?auto_64306 ) ) ( AVAILABLE ?auto_64306 ) ( SURFACE-AT ?auto_64298 ?auto_64303 ) ( ON ?auto_64298 ?auto_64305 ) ( CLEAR ?auto_64298 ) ( not ( = ?auto_64298 ?auto_64305 ) ) ( not ( = ?auto_64299 ?auto_64305 ) ) ( SURFACE-AT ?auto_64300 ?auto_64302 ) ( CLEAR ?auto_64300 ) ( IS-CRATE ?auto_64299 ) ( not ( = ?auto_64298 ?auto_64300 ) ) ( not ( = ?auto_64299 ?auto_64300 ) ) ( not ( = ?auto_64305 ?auto_64300 ) ) ( AVAILABLE ?auto_64304 ) ( TRUCK-AT ?auto_64307 ?auto_64301 ) ( not ( = ?auto_64301 ?auto_64302 ) ) ( not ( = ?auto_64303 ?auto_64301 ) ) ( HOIST-AT ?auto_64308 ?auto_64301 ) ( LIFTING ?auto_64308 ?auto_64299 ) ( not ( = ?auto_64304 ?auto_64308 ) ) ( not ( = ?auto_64306 ?auto_64308 ) ) )
    :subtasks
    ( ( !LOAD ?auto_64308 ?auto_64299 ?auto_64307 ?auto_64301 )
      ( MAKE-ON ?auto_64298 ?auto_64299 )
      ( MAKE-ON-VERIFY ?auto_64298 ?auto_64299 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_64309 - SURFACE
      ?auto_64310 - SURFACE
    )
    :vars
    (
      ?auto_64315 - HOIST
      ?auto_64313 - PLACE
      ?auto_64314 - PLACE
      ?auto_64312 - HOIST
      ?auto_64316 - SURFACE
      ?auto_64317 - SURFACE
      ?auto_64319 - TRUCK
      ?auto_64311 - PLACE
      ?auto_64318 - HOIST
      ?auto_64320 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_64315 ?auto_64313 ) ( IS-CRATE ?auto_64309 ) ( not ( = ?auto_64309 ?auto_64310 ) ) ( not ( = ?auto_64314 ?auto_64313 ) ) ( HOIST-AT ?auto_64312 ?auto_64314 ) ( not ( = ?auto_64315 ?auto_64312 ) ) ( AVAILABLE ?auto_64312 ) ( SURFACE-AT ?auto_64309 ?auto_64314 ) ( ON ?auto_64309 ?auto_64316 ) ( CLEAR ?auto_64309 ) ( not ( = ?auto_64309 ?auto_64316 ) ) ( not ( = ?auto_64310 ?auto_64316 ) ) ( SURFACE-AT ?auto_64317 ?auto_64313 ) ( CLEAR ?auto_64317 ) ( IS-CRATE ?auto_64310 ) ( not ( = ?auto_64309 ?auto_64317 ) ) ( not ( = ?auto_64310 ?auto_64317 ) ) ( not ( = ?auto_64316 ?auto_64317 ) ) ( AVAILABLE ?auto_64315 ) ( TRUCK-AT ?auto_64319 ?auto_64311 ) ( not ( = ?auto_64311 ?auto_64313 ) ) ( not ( = ?auto_64314 ?auto_64311 ) ) ( HOIST-AT ?auto_64318 ?auto_64311 ) ( not ( = ?auto_64315 ?auto_64318 ) ) ( not ( = ?auto_64312 ?auto_64318 ) ) ( AVAILABLE ?auto_64318 ) ( SURFACE-AT ?auto_64310 ?auto_64311 ) ( ON ?auto_64310 ?auto_64320 ) ( CLEAR ?auto_64310 ) ( not ( = ?auto_64309 ?auto_64320 ) ) ( not ( = ?auto_64310 ?auto_64320 ) ) ( not ( = ?auto_64316 ?auto_64320 ) ) ( not ( = ?auto_64317 ?auto_64320 ) ) )
    :subtasks
    ( ( !LIFT ?auto_64318 ?auto_64310 ?auto_64320 ?auto_64311 )
      ( MAKE-ON ?auto_64309 ?auto_64310 )
      ( MAKE-ON-VERIFY ?auto_64309 ?auto_64310 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_64321 - SURFACE
      ?auto_64322 - SURFACE
    )
    :vars
    (
      ?auto_64327 - HOIST
      ?auto_64326 - PLACE
      ?auto_64332 - PLACE
      ?auto_64323 - HOIST
      ?auto_64329 - SURFACE
      ?auto_64325 - SURFACE
      ?auto_64324 - PLACE
      ?auto_64330 - HOIST
      ?auto_64331 - SURFACE
      ?auto_64328 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_64327 ?auto_64326 ) ( IS-CRATE ?auto_64321 ) ( not ( = ?auto_64321 ?auto_64322 ) ) ( not ( = ?auto_64332 ?auto_64326 ) ) ( HOIST-AT ?auto_64323 ?auto_64332 ) ( not ( = ?auto_64327 ?auto_64323 ) ) ( AVAILABLE ?auto_64323 ) ( SURFACE-AT ?auto_64321 ?auto_64332 ) ( ON ?auto_64321 ?auto_64329 ) ( CLEAR ?auto_64321 ) ( not ( = ?auto_64321 ?auto_64329 ) ) ( not ( = ?auto_64322 ?auto_64329 ) ) ( SURFACE-AT ?auto_64325 ?auto_64326 ) ( CLEAR ?auto_64325 ) ( IS-CRATE ?auto_64322 ) ( not ( = ?auto_64321 ?auto_64325 ) ) ( not ( = ?auto_64322 ?auto_64325 ) ) ( not ( = ?auto_64329 ?auto_64325 ) ) ( AVAILABLE ?auto_64327 ) ( not ( = ?auto_64324 ?auto_64326 ) ) ( not ( = ?auto_64332 ?auto_64324 ) ) ( HOIST-AT ?auto_64330 ?auto_64324 ) ( not ( = ?auto_64327 ?auto_64330 ) ) ( not ( = ?auto_64323 ?auto_64330 ) ) ( AVAILABLE ?auto_64330 ) ( SURFACE-AT ?auto_64322 ?auto_64324 ) ( ON ?auto_64322 ?auto_64331 ) ( CLEAR ?auto_64322 ) ( not ( = ?auto_64321 ?auto_64331 ) ) ( not ( = ?auto_64322 ?auto_64331 ) ) ( not ( = ?auto_64329 ?auto_64331 ) ) ( not ( = ?auto_64325 ?auto_64331 ) ) ( TRUCK-AT ?auto_64328 ?auto_64326 ) )
    :subtasks
    ( ( !DRIVE ?auto_64328 ?auto_64326 ?auto_64324 )
      ( MAKE-ON ?auto_64321 ?auto_64322 )
      ( MAKE-ON-VERIFY ?auto_64321 ?auto_64322 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_64333 - SURFACE
      ?auto_64334 - SURFACE
    )
    :vars
    (
      ?auto_64342 - HOIST
      ?auto_64335 - PLACE
      ?auto_64343 - PLACE
      ?auto_64336 - HOIST
      ?auto_64338 - SURFACE
      ?auto_64344 - SURFACE
      ?auto_64339 - PLACE
      ?auto_64340 - HOIST
      ?auto_64341 - SURFACE
      ?auto_64337 - TRUCK
      ?auto_64345 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_64342 ?auto_64335 ) ( IS-CRATE ?auto_64333 ) ( not ( = ?auto_64333 ?auto_64334 ) ) ( not ( = ?auto_64343 ?auto_64335 ) ) ( HOIST-AT ?auto_64336 ?auto_64343 ) ( not ( = ?auto_64342 ?auto_64336 ) ) ( AVAILABLE ?auto_64336 ) ( SURFACE-AT ?auto_64333 ?auto_64343 ) ( ON ?auto_64333 ?auto_64338 ) ( CLEAR ?auto_64333 ) ( not ( = ?auto_64333 ?auto_64338 ) ) ( not ( = ?auto_64334 ?auto_64338 ) ) ( IS-CRATE ?auto_64334 ) ( not ( = ?auto_64333 ?auto_64344 ) ) ( not ( = ?auto_64334 ?auto_64344 ) ) ( not ( = ?auto_64338 ?auto_64344 ) ) ( not ( = ?auto_64339 ?auto_64335 ) ) ( not ( = ?auto_64343 ?auto_64339 ) ) ( HOIST-AT ?auto_64340 ?auto_64339 ) ( not ( = ?auto_64342 ?auto_64340 ) ) ( not ( = ?auto_64336 ?auto_64340 ) ) ( AVAILABLE ?auto_64340 ) ( SURFACE-AT ?auto_64334 ?auto_64339 ) ( ON ?auto_64334 ?auto_64341 ) ( CLEAR ?auto_64334 ) ( not ( = ?auto_64333 ?auto_64341 ) ) ( not ( = ?auto_64334 ?auto_64341 ) ) ( not ( = ?auto_64338 ?auto_64341 ) ) ( not ( = ?auto_64344 ?auto_64341 ) ) ( TRUCK-AT ?auto_64337 ?auto_64335 ) ( SURFACE-AT ?auto_64345 ?auto_64335 ) ( CLEAR ?auto_64345 ) ( LIFTING ?auto_64342 ?auto_64344 ) ( IS-CRATE ?auto_64344 ) ( not ( = ?auto_64333 ?auto_64345 ) ) ( not ( = ?auto_64334 ?auto_64345 ) ) ( not ( = ?auto_64338 ?auto_64345 ) ) ( not ( = ?auto_64344 ?auto_64345 ) ) ( not ( = ?auto_64341 ?auto_64345 ) ) )
    :subtasks
    ( ( !DROP ?auto_64342 ?auto_64344 ?auto_64345 ?auto_64335 )
      ( MAKE-ON ?auto_64333 ?auto_64334 )
      ( MAKE-ON-VERIFY ?auto_64333 ?auto_64334 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_64346 - SURFACE
      ?auto_64347 - SURFACE
    )
    :vars
    (
      ?auto_64357 - HOIST
      ?auto_64348 - PLACE
      ?auto_64351 - PLACE
      ?auto_64349 - HOIST
      ?auto_64352 - SURFACE
      ?auto_64358 - SURFACE
      ?auto_64354 - PLACE
      ?auto_64355 - HOIST
      ?auto_64350 - SURFACE
      ?auto_64353 - TRUCK
      ?auto_64356 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_64357 ?auto_64348 ) ( IS-CRATE ?auto_64346 ) ( not ( = ?auto_64346 ?auto_64347 ) ) ( not ( = ?auto_64351 ?auto_64348 ) ) ( HOIST-AT ?auto_64349 ?auto_64351 ) ( not ( = ?auto_64357 ?auto_64349 ) ) ( AVAILABLE ?auto_64349 ) ( SURFACE-AT ?auto_64346 ?auto_64351 ) ( ON ?auto_64346 ?auto_64352 ) ( CLEAR ?auto_64346 ) ( not ( = ?auto_64346 ?auto_64352 ) ) ( not ( = ?auto_64347 ?auto_64352 ) ) ( IS-CRATE ?auto_64347 ) ( not ( = ?auto_64346 ?auto_64358 ) ) ( not ( = ?auto_64347 ?auto_64358 ) ) ( not ( = ?auto_64352 ?auto_64358 ) ) ( not ( = ?auto_64354 ?auto_64348 ) ) ( not ( = ?auto_64351 ?auto_64354 ) ) ( HOIST-AT ?auto_64355 ?auto_64354 ) ( not ( = ?auto_64357 ?auto_64355 ) ) ( not ( = ?auto_64349 ?auto_64355 ) ) ( AVAILABLE ?auto_64355 ) ( SURFACE-AT ?auto_64347 ?auto_64354 ) ( ON ?auto_64347 ?auto_64350 ) ( CLEAR ?auto_64347 ) ( not ( = ?auto_64346 ?auto_64350 ) ) ( not ( = ?auto_64347 ?auto_64350 ) ) ( not ( = ?auto_64352 ?auto_64350 ) ) ( not ( = ?auto_64358 ?auto_64350 ) ) ( TRUCK-AT ?auto_64353 ?auto_64348 ) ( SURFACE-AT ?auto_64356 ?auto_64348 ) ( CLEAR ?auto_64356 ) ( IS-CRATE ?auto_64358 ) ( not ( = ?auto_64346 ?auto_64356 ) ) ( not ( = ?auto_64347 ?auto_64356 ) ) ( not ( = ?auto_64352 ?auto_64356 ) ) ( not ( = ?auto_64358 ?auto_64356 ) ) ( not ( = ?auto_64350 ?auto_64356 ) ) ( AVAILABLE ?auto_64357 ) ( IN ?auto_64358 ?auto_64353 ) )
    :subtasks
    ( ( !UNLOAD ?auto_64357 ?auto_64358 ?auto_64353 ?auto_64348 )
      ( MAKE-ON ?auto_64346 ?auto_64347 )
      ( MAKE-ON-VERIFY ?auto_64346 ?auto_64347 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_64359 - SURFACE
      ?auto_64360 - SURFACE
    )
    :vars
    (
      ?auto_64364 - HOIST
      ?auto_64363 - PLACE
      ?auto_64370 - PLACE
      ?auto_64368 - HOIST
      ?auto_64369 - SURFACE
      ?auto_64366 - SURFACE
      ?auto_64361 - PLACE
      ?auto_64362 - HOIST
      ?auto_64367 - SURFACE
      ?auto_64365 - SURFACE
      ?auto_64371 - TRUCK
      ?auto_64372 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_64364 ?auto_64363 ) ( IS-CRATE ?auto_64359 ) ( not ( = ?auto_64359 ?auto_64360 ) ) ( not ( = ?auto_64370 ?auto_64363 ) ) ( HOIST-AT ?auto_64368 ?auto_64370 ) ( not ( = ?auto_64364 ?auto_64368 ) ) ( AVAILABLE ?auto_64368 ) ( SURFACE-AT ?auto_64359 ?auto_64370 ) ( ON ?auto_64359 ?auto_64369 ) ( CLEAR ?auto_64359 ) ( not ( = ?auto_64359 ?auto_64369 ) ) ( not ( = ?auto_64360 ?auto_64369 ) ) ( IS-CRATE ?auto_64360 ) ( not ( = ?auto_64359 ?auto_64366 ) ) ( not ( = ?auto_64360 ?auto_64366 ) ) ( not ( = ?auto_64369 ?auto_64366 ) ) ( not ( = ?auto_64361 ?auto_64363 ) ) ( not ( = ?auto_64370 ?auto_64361 ) ) ( HOIST-AT ?auto_64362 ?auto_64361 ) ( not ( = ?auto_64364 ?auto_64362 ) ) ( not ( = ?auto_64368 ?auto_64362 ) ) ( AVAILABLE ?auto_64362 ) ( SURFACE-AT ?auto_64360 ?auto_64361 ) ( ON ?auto_64360 ?auto_64367 ) ( CLEAR ?auto_64360 ) ( not ( = ?auto_64359 ?auto_64367 ) ) ( not ( = ?auto_64360 ?auto_64367 ) ) ( not ( = ?auto_64369 ?auto_64367 ) ) ( not ( = ?auto_64366 ?auto_64367 ) ) ( SURFACE-AT ?auto_64365 ?auto_64363 ) ( CLEAR ?auto_64365 ) ( IS-CRATE ?auto_64366 ) ( not ( = ?auto_64359 ?auto_64365 ) ) ( not ( = ?auto_64360 ?auto_64365 ) ) ( not ( = ?auto_64369 ?auto_64365 ) ) ( not ( = ?auto_64366 ?auto_64365 ) ) ( not ( = ?auto_64367 ?auto_64365 ) ) ( AVAILABLE ?auto_64364 ) ( IN ?auto_64366 ?auto_64371 ) ( TRUCK-AT ?auto_64371 ?auto_64372 ) ( not ( = ?auto_64372 ?auto_64363 ) ) ( not ( = ?auto_64370 ?auto_64372 ) ) ( not ( = ?auto_64361 ?auto_64372 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_64371 ?auto_64372 ?auto_64363 )
      ( MAKE-ON ?auto_64359 ?auto_64360 )
      ( MAKE-ON-VERIFY ?auto_64359 ?auto_64360 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_64373 - SURFACE
      ?auto_64374 - SURFACE
    )
    :vars
    (
      ?auto_64384 - HOIST
      ?auto_64376 - PLACE
      ?auto_64380 - PLACE
      ?auto_64378 - HOIST
      ?auto_64379 - SURFACE
      ?auto_64382 - SURFACE
      ?auto_64377 - PLACE
      ?auto_64386 - HOIST
      ?auto_64375 - SURFACE
      ?auto_64383 - SURFACE
      ?auto_64385 - TRUCK
      ?auto_64381 - PLACE
      ?auto_64387 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_64384 ?auto_64376 ) ( IS-CRATE ?auto_64373 ) ( not ( = ?auto_64373 ?auto_64374 ) ) ( not ( = ?auto_64380 ?auto_64376 ) ) ( HOIST-AT ?auto_64378 ?auto_64380 ) ( not ( = ?auto_64384 ?auto_64378 ) ) ( AVAILABLE ?auto_64378 ) ( SURFACE-AT ?auto_64373 ?auto_64380 ) ( ON ?auto_64373 ?auto_64379 ) ( CLEAR ?auto_64373 ) ( not ( = ?auto_64373 ?auto_64379 ) ) ( not ( = ?auto_64374 ?auto_64379 ) ) ( IS-CRATE ?auto_64374 ) ( not ( = ?auto_64373 ?auto_64382 ) ) ( not ( = ?auto_64374 ?auto_64382 ) ) ( not ( = ?auto_64379 ?auto_64382 ) ) ( not ( = ?auto_64377 ?auto_64376 ) ) ( not ( = ?auto_64380 ?auto_64377 ) ) ( HOIST-AT ?auto_64386 ?auto_64377 ) ( not ( = ?auto_64384 ?auto_64386 ) ) ( not ( = ?auto_64378 ?auto_64386 ) ) ( AVAILABLE ?auto_64386 ) ( SURFACE-AT ?auto_64374 ?auto_64377 ) ( ON ?auto_64374 ?auto_64375 ) ( CLEAR ?auto_64374 ) ( not ( = ?auto_64373 ?auto_64375 ) ) ( not ( = ?auto_64374 ?auto_64375 ) ) ( not ( = ?auto_64379 ?auto_64375 ) ) ( not ( = ?auto_64382 ?auto_64375 ) ) ( SURFACE-AT ?auto_64383 ?auto_64376 ) ( CLEAR ?auto_64383 ) ( IS-CRATE ?auto_64382 ) ( not ( = ?auto_64373 ?auto_64383 ) ) ( not ( = ?auto_64374 ?auto_64383 ) ) ( not ( = ?auto_64379 ?auto_64383 ) ) ( not ( = ?auto_64382 ?auto_64383 ) ) ( not ( = ?auto_64375 ?auto_64383 ) ) ( AVAILABLE ?auto_64384 ) ( TRUCK-AT ?auto_64385 ?auto_64381 ) ( not ( = ?auto_64381 ?auto_64376 ) ) ( not ( = ?auto_64380 ?auto_64381 ) ) ( not ( = ?auto_64377 ?auto_64381 ) ) ( HOIST-AT ?auto_64387 ?auto_64381 ) ( LIFTING ?auto_64387 ?auto_64382 ) ( not ( = ?auto_64384 ?auto_64387 ) ) ( not ( = ?auto_64378 ?auto_64387 ) ) ( not ( = ?auto_64386 ?auto_64387 ) ) )
    :subtasks
    ( ( !LOAD ?auto_64387 ?auto_64382 ?auto_64385 ?auto_64381 )
      ( MAKE-ON ?auto_64373 ?auto_64374 )
      ( MAKE-ON-VERIFY ?auto_64373 ?auto_64374 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_64388 - SURFACE
      ?auto_64389 - SURFACE
    )
    :vars
    (
      ?auto_64398 - HOIST
      ?auto_64397 - PLACE
      ?auto_64401 - PLACE
      ?auto_64391 - HOIST
      ?auto_64394 - SURFACE
      ?auto_64399 - SURFACE
      ?auto_64400 - PLACE
      ?auto_64396 - HOIST
      ?auto_64393 - SURFACE
      ?auto_64395 - SURFACE
      ?auto_64390 - TRUCK
      ?auto_64392 - PLACE
      ?auto_64402 - HOIST
      ?auto_64403 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_64398 ?auto_64397 ) ( IS-CRATE ?auto_64388 ) ( not ( = ?auto_64388 ?auto_64389 ) ) ( not ( = ?auto_64401 ?auto_64397 ) ) ( HOIST-AT ?auto_64391 ?auto_64401 ) ( not ( = ?auto_64398 ?auto_64391 ) ) ( AVAILABLE ?auto_64391 ) ( SURFACE-AT ?auto_64388 ?auto_64401 ) ( ON ?auto_64388 ?auto_64394 ) ( CLEAR ?auto_64388 ) ( not ( = ?auto_64388 ?auto_64394 ) ) ( not ( = ?auto_64389 ?auto_64394 ) ) ( IS-CRATE ?auto_64389 ) ( not ( = ?auto_64388 ?auto_64399 ) ) ( not ( = ?auto_64389 ?auto_64399 ) ) ( not ( = ?auto_64394 ?auto_64399 ) ) ( not ( = ?auto_64400 ?auto_64397 ) ) ( not ( = ?auto_64401 ?auto_64400 ) ) ( HOIST-AT ?auto_64396 ?auto_64400 ) ( not ( = ?auto_64398 ?auto_64396 ) ) ( not ( = ?auto_64391 ?auto_64396 ) ) ( AVAILABLE ?auto_64396 ) ( SURFACE-AT ?auto_64389 ?auto_64400 ) ( ON ?auto_64389 ?auto_64393 ) ( CLEAR ?auto_64389 ) ( not ( = ?auto_64388 ?auto_64393 ) ) ( not ( = ?auto_64389 ?auto_64393 ) ) ( not ( = ?auto_64394 ?auto_64393 ) ) ( not ( = ?auto_64399 ?auto_64393 ) ) ( SURFACE-AT ?auto_64395 ?auto_64397 ) ( CLEAR ?auto_64395 ) ( IS-CRATE ?auto_64399 ) ( not ( = ?auto_64388 ?auto_64395 ) ) ( not ( = ?auto_64389 ?auto_64395 ) ) ( not ( = ?auto_64394 ?auto_64395 ) ) ( not ( = ?auto_64399 ?auto_64395 ) ) ( not ( = ?auto_64393 ?auto_64395 ) ) ( AVAILABLE ?auto_64398 ) ( TRUCK-AT ?auto_64390 ?auto_64392 ) ( not ( = ?auto_64392 ?auto_64397 ) ) ( not ( = ?auto_64401 ?auto_64392 ) ) ( not ( = ?auto_64400 ?auto_64392 ) ) ( HOIST-AT ?auto_64402 ?auto_64392 ) ( not ( = ?auto_64398 ?auto_64402 ) ) ( not ( = ?auto_64391 ?auto_64402 ) ) ( not ( = ?auto_64396 ?auto_64402 ) ) ( AVAILABLE ?auto_64402 ) ( SURFACE-AT ?auto_64399 ?auto_64392 ) ( ON ?auto_64399 ?auto_64403 ) ( CLEAR ?auto_64399 ) ( not ( = ?auto_64388 ?auto_64403 ) ) ( not ( = ?auto_64389 ?auto_64403 ) ) ( not ( = ?auto_64394 ?auto_64403 ) ) ( not ( = ?auto_64399 ?auto_64403 ) ) ( not ( = ?auto_64393 ?auto_64403 ) ) ( not ( = ?auto_64395 ?auto_64403 ) ) )
    :subtasks
    ( ( !LIFT ?auto_64402 ?auto_64399 ?auto_64403 ?auto_64392 )
      ( MAKE-ON ?auto_64388 ?auto_64389 )
      ( MAKE-ON-VERIFY ?auto_64388 ?auto_64389 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_64404 - SURFACE
      ?auto_64405 - SURFACE
    )
    :vars
    (
      ?auto_64407 - HOIST
      ?auto_64418 - PLACE
      ?auto_64417 - PLACE
      ?auto_64411 - HOIST
      ?auto_64415 - SURFACE
      ?auto_64408 - SURFACE
      ?auto_64412 - PLACE
      ?auto_64410 - HOIST
      ?auto_64419 - SURFACE
      ?auto_64413 - SURFACE
      ?auto_64416 - PLACE
      ?auto_64409 - HOIST
      ?auto_64406 - SURFACE
      ?auto_64414 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_64407 ?auto_64418 ) ( IS-CRATE ?auto_64404 ) ( not ( = ?auto_64404 ?auto_64405 ) ) ( not ( = ?auto_64417 ?auto_64418 ) ) ( HOIST-AT ?auto_64411 ?auto_64417 ) ( not ( = ?auto_64407 ?auto_64411 ) ) ( AVAILABLE ?auto_64411 ) ( SURFACE-AT ?auto_64404 ?auto_64417 ) ( ON ?auto_64404 ?auto_64415 ) ( CLEAR ?auto_64404 ) ( not ( = ?auto_64404 ?auto_64415 ) ) ( not ( = ?auto_64405 ?auto_64415 ) ) ( IS-CRATE ?auto_64405 ) ( not ( = ?auto_64404 ?auto_64408 ) ) ( not ( = ?auto_64405 ?auto_64408 ) ) ( not ( = ?auto_64415 ?auto_64408 ) ) ( not ( = ?auto_64412 ?auto_64418 ) ) ( not ( = ?auto_64417 ?auto_64412 ) ) ( HOIST-AT ?auto_64410 ?auto_64412 ) ( not ( = ?auto_64407 ?auto_64410 ) ) ( not ( = ?auto_64411 ?auto_64410 ) ) ( AVAILABLE ?auto_64410 ) ( SURFACE-AT ?auto_64405 ?auto_64412 ) ( ON ?auto_64405 ?auto_64419 ) ( CLEAR ?auto_64405 ) ( not ( = ?auto_64404 ?auto_64419 ) ) ( not ( = ?auto_64405 ?auto_64419 ) ) ( not ( = ?auto_64415 ?auto_64419 ) ) ( not ( = ?auto_64408 ?auto_64419 ) ) ( SURFACE-AT ?auto_64413 ?auto_64418 ) ( CLEAR ?auto_64413 ) ( IS-CRATE ?auto_64408 ) ( not ( = ?auto_64404 ?auto_64413 ) ) ( not ( = ?auto_64405 ?auto_64413 ) ) ( not ( = ?auto_64415 ?auto_64413 ) ) ( not ( = ?auto_64408 ?auto_64413 ) ) ( not ( = ?auto_64419 ?auto_64413 ) ) ( AVAILABLE ?auto_64407 ) ( not ( = ?auto_64416 ?auto_64418 ) ) ( not ( = ?auto_64417 ?auto_64416 ) ) ( not ( = ?auto_64412 ?auto_64416 ) ) ( HOIST-AT ?auto_64409 ?auto_64416 ) ( not ( = ?auto_64407 ?auto_64409 ) ) ( not ( = ?auto_64411 ?auto_64409 ) ) ( not ( = ?auto_64410 ?auto_64409 ) ) ( AVAILABLE ?auto_64409 ) ( SURFACE-AT ?auto_64408 ?auto_64416 ) ( ON ?auto_64408 ?auto_64406 ) ( CLEAR ?auto_64408 ) ( not ( = ?auto_64404 ?auto_64406 ) ) ( not ( = ?auto_64405 ?auto_64406 ) ) ( not ( = ?auto_64415 ?auto_64406 ) ) ( not ( = ?auto_64408 ?auto_64406 ) ) ( not ( = ?auto_64419 ?auto_64406 ) ) ( not ( = ?auto_64413 ?auto_64406 ) ) ( TRUCK-AT ?auto_64414 ?auto_64418 ) )
    :subtasks
    ( ( !DRIVE ?auto_64414 ?auto_64418 ?auto_64416 )
      ( MAKE-ON ?auto_64404 ?auto_64405 )
      ( MAKE-ON-VERIFY ?auto_64404 ?auto_64405 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_64420 - SURFACE
      ?auto_64421 - SURFACE
    )
    :vars
    (
      ?auto_64425 - HOIST
      ?auto_64422 - PLACE
      ?auto_64429 - PLACE
      ?auto_64431 - HOIST
      ?auto_64435 - SURFACE
      ?auto_64433 - SURFACE
      ?auto_64430 - PLACE
      ?auto_64424 - HOIST
      ?auto_64434 - SURFACE
      ?auto_64428 - SURFACE
      ?auto_64423 - PLACE
      ?auto_64427 - HOIST
      ?auto_64432 - SURFACE
      ?auto_64426 - TRUCK
      ?auto_64436 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_64425 ?auto_64422 ) ( IS-CRATE ?auto_64420 ) ( not ( = ?auto_64420 ?auto_64421 ) ) ( not ( = ?auto_64429 ?auto_64422 ) ) ( HOIST-AT ?auto_64431 ?auto_64429 ) ( not ( = ?auto_64425 ?auto_64431 ) ) ( AVAILABLE ?auto_64431 ) ( SURFACE-AT ?auto_64420 ?auto_64429 ) ( ON ?auto_64420 ?auto_64435 ) ( CLEAR ?auto_64420 ) ( not ( = ?auto_64420 ?auto_64435 ) ) ( not ( = ?auto_64421 ?auto_64435 ) ) ( IS-CRATE ?auto_64421 ) ( not ( = ?auto_64420 ?auto_64433 ) ) ( not ( = ?auto_64421 ?auto_64433 ) ) ( not ( = ?auto_64435 ?auto_64433 ) ) ( not ( = ?auto_64430 ?auto_64422 ) ) ( not ( = ?auto_64429 ?auto_64430 ) ) ( HOIST-AT ?auto_64424 ?auto_64430 ) ( not ( = ?auto_64425 ?auto_64424 ) ) ( not ( = ?auto_64431 ?auto_64424 ) ) ( AVAILABLE ?auto_64424 ) ( SURFACE-AT ?auto_64421 ?auto_64430 ) ( ON ?auto_64421 ?auto_64434 ) ( CLEAR ?auto_64421 ) ( not ( = ?auto_64420 ?auto_64434 ) ) ( not ( = ?auto_64421 ?auto_64434 ) ) ( not ( = ?auto_64435 ?auto_64434 ) ) ( not ( = ?auto_64433 ?auto_64434 ) ) ( IS-CRATE ?auto_64433 ) ( not ( = ?auto_64420 ?auto_64428 ) ) ( not ( = ?auto_64421 ?auto_64428 ) ) ( not ( = ?auto_64435 ?auto_64428 ) ) ( not ( = ?auto_64433 ?auto_64428 ) ) ( not ( = ?auto_64434 ?auto_64428 ) ) ( not ( = ?auto_64423 ?auto_64422 ) ) ( not ( = ?auto_64429 ?auto_64423 ) ) ( not ( = ?auto_64430 ?auto_64423 ) ) ( HOIST-AT ?auto_64427 ?auto_64423 ) ( not ( = ?auto_64425 ?auto_64427 ) ) ( not ( = ?auto_64431 ?auto_64427 ) ) ( not ( = ?auto_64424 ?auto_64427 ) ) ( AVAILABLE ?auto_64427 ) ( SURFACE-AT ?auto_64433 ?auto_64423 ) ( ON ?auto_64433 ?auto_64432 ) ( CLEAR ?auto_64433 ) ( not ( = ?auto_64420 ?auto_64432 ) ) ( not ( = ?auto_64421 ?auto_64432 ) ) ( not ( = ?auto_64435 ?auto_64432 ) ) ( not ( = ?auto_64433 ?auto_64432 ) ) ( not ( = ?auto_64434 ?auto_64432 ) ) ( not ( = ?auto_64428 ?auto_64432 ) ) ( TRUCK-AT ?auto_64426 ?auto_64422 ) ( SURFACE-AT ?auto_64436 ?auto_64422 ) ( CLEAR ?auto_64436 ) ( LIFTING ?auto_64425 ?auto_64428 ) ( IS-CRATE ?auto_64428 ) ( not ( = ?auto_64420 ?auto_64436 ) ) ( not ( = ?auto_64421 ?auto_64436 ) ) ( not ( = ?auto_64435 ?auto_64436 ) ) ( not ( = ?auto_64433 ?auto_64436 ) ) ( not ( = ?auto_64434 ?auto_64436 ) ) ( not ( = ?auto_64428 ?auto_64436 ) ) ( not ( = ?auto_64432 ?auto_64436 ) ) )
    :subtasks
    ( ( !DROP ?auto_64425 ?auto_64428 ?auto_64436 ?auto_64422 )
      ( MAKE-ON ?auto_64420 ?auto_64421 )
      ( MAKE-ON-VERIFY ?auto_64420 ?auto_64421 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_64437 - SURFACE
      ?auto_64438 - SURFACE
    )
    :vars
    (
      ?auto_64442 - HOIST
      ?auto_64443 - PLACE
      ?auto_64450 - PLACE
      ?auto_64447 - HOIST
      ?auto_64440 - SURFACE
      ?auto_64448 - SURFACE
      ?auto_64446 - PLACE
      ?auto_64441 - HOIST
      ?auto_64445 - SURFACE
      ?auto_64452 - SURFACE
      ?auto_64449 - PLACE
      ?auto_64439 - HOIST
      ?auto_64444 - SURFACE
      ?auto_64451 - TRUCK
      ?auto_64453 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_64442 ?auto_64443 ) ( IS-CRATE ?auto_64437 ) ( not ( = ?auto_64437 ?auto_64438 ) ) ( not ( = ?auto_64450 ?auto_64443 ) ) ( HOIST-AT ?auto_64447 ?auto_64450 ) ( not ( = ?auto_64442 ?auto_64447 ) ) ( AVAILABLE ?auto_64447 ) ( SURFACE-AT ?auto_64437 ?auto_64450 ) ( ON ?auto_64437 ?auto_64440 ) ( CLEAR ?auto_64437 ) ( not ( = ?auto_64437 ?auto_64440 ) ) ( not ( = ?auto_64438 ?auto_64440 ) ) ( IS-CRATE ?auto_64438 ) ( not ( = ?auto_64437 ?auto_64448 ) ) ( not ( = ?auto_64438 ?auto_64448 ) ) ( not ( = ?auto_64440 ?auto_64448 ) ) ( not ( = ?auto_64446 ?auto_64443 ) ) ( not ( = ?auto_64450 ?auto_64446 ) ) ( HOIST-AT ?auto_64441 ?auto_64446 ) ( not ( = ?auto_64442 ?auto_64441 ) ) ( not ( = ?auto_64447 ?auto_64441 ) ) ( AVAILABLE ?auto_64441 ) ( SURFACE-AT ?auto_64438 ?auto_64446 ) ( ON ?auto_64438 ?auto_64445 ) ( CLEAR ?auto_64438 ) ( not ( = ?auto_64437 ?auto_64445 ) ) ( not ( = ?auto_64438 ?auto_64445 ) ) ( not ( = ?auto_64440 ?auto_64445 ) ) ( not ( = ?auto_64448 ?auto_64445 ) ) ( IS-CRATE ?auto_64448 ) ( not ( = ?auto_64437 ?auto_64452 ) ) ( not ( = ?auto_64438 ?auto_64452 ) ) ( not ( = ?auto_64440 ?auto_64452 ) ) ( not ( = ?auto_64448 ?auto_64452 ) ) ( not ( = ?auto_64445 ?auto_64452 ) ) ( not ( = ?auto_64449 ?auto_64443 ) ) ( not ( = ?auto_64450 ?auto_64449 ) ) ( not ( = ?auto_64446 ?auto_64449 ) ) ( HOIST-AT ?auto_64439 ?auto_64449 ) ( not ( = ?auto_64442 ?auto_64439 ) ) ( not ( = ?auto_64447 ?auto_64439 ) ) ( not ( = ?auto_64441 ?auto_64439 ) ) ( AVAILABLE ?auto_64439 ) ( SURFACE-AT ?auto_64448 ?auto_64449 ) ( ON ?auto_64448 ?auto_64444 ) ( CLEAR ?auto_64448 ) ( not ( = ?auto_64437 ?auto_64444 ) ) ( not ( = ?auto_64438 ?auto_64444 ) ) ( not ( = ?auto_64440 ?auto_64444 ) ) ( not ( = ?auto_64448 ?auto_64444 ) ) ( not ( = ?auto_64445 ?auto_64444 ) ) ( not ( = ?auto_64452 ?auto_64444 ) ) ( TRUCK-AT ?auto_64451 ?auto_64443 ) ( SURFACE-AT ?auto_64453 ?auto_64443 ) ( CLEAR ?auto_64453 ) ( IS-CRATE ?auto_64452 ) ( not ( = ?auto_64437 ?auto_64453 ) ) ( not ( = ?auto_64438 ?auto_64453 ) ) ( not ( = ?auto_64440 ?auto_64453 ) ) ( not ( = ?auto_64448 ?auto_64453 ) ) ( not ( = ?auto_64445 ?auto_64453 ) ) ( not ( = ?auto_64452 ?auto_64453 ) ) ( not ( = ?auto_64444 ?auto_64453 ) ) ( AVAILABLE ?auto_64442 ) ( IN ?auto_64452 ?auto_64451 ) )
    :subtasks
    ( ( !UNLOAD ?auto_64442 ?auto_64452 ?auto_64451 ?auto_64443 )
      ( MAKE-ON ?auto_64437 ?auto_64438 )
      ( MAKE-ON-VERIFY ?auto_64437 ?auto_64438 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_64454 - SURFACE
      ?auto_64455 - SURFACE
    )
    :vars
    (
      ?auto_64469 - HOIST
      ?auto_64463 - PLACE
      ?auto_64466 - PLACE
      ?auto_64457 - HOIST
      ?auto_64460 - SURFACE
      ?auto_64464 - SURFACE
      ?auto_64459 - PLACE
      ?auto_64461 - HOIST
      ?auto_64456 - SURFACE
      ?auto_64470 - SURFACE
      ?auto_64465 - PLACE
      ?auto_64462 - HOIST
      ?auto_64458 - SURFACE
      ?auto_64468 - SURFACE
      ?auto_64467 - TRUCK
      ?auto_64471 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_64469 ?auto_64463 ) ( IS-CRATE ?auto_64454 ) ( not ( = ?auto_64454 ?auto_64455 ) ) ( not ( = ?auto_64466 ?auto_64463 ) ) ( HOIST-AT ?auto_64457 ?auto_64466 ) ( not ( = ?auto_64469 ?auto_64457 ) ) ( AVAILABLE ?auto_64457 ) ( SURFACE-AT ?auto_64454 ?auto_64466 ) ( ON ?auto_64454 ?auto_64460 ) ( CLEAR ?auto_64454 ) ( not ( = ?auto_64454 ?auto_64460 ) ) ( not ( = ?auto_64455 ?auto_64460 ) ) ( IS-CRATE ?auto_64455 ) ( not ( = ?auto_64454 ?auto_64464 ) ) ( not ( = ?auto_64455 ?auto_64464 ) ) ( not ( = ?auto_64460 ?auto_64464 ) ) ( not ( = ?auto_64459 ?auto_64463 ) ) ( not ( = ?auto_64466 ?auto_64459 ) ) ( HOIST-AT ?auto_64461 ?auto_64459 ) ( not ( = ?auto_64469 ?auto_64461 ) ) ( not ( = ?auto_64457 ?auto_64461 ) ) ( AVAILABLE ?auto_64461 ) ( SURFACE-AT ?auto_64455 ?auto_64459 ) ( ON ?auto_64455 ?auto_64456 ) ( CLEAR ?auto_64455 ) ( not ( = ?auto_64454 ?auto_64456 ) ) ( not ( = ?auto_64455 ?auto_64456 ) ) ( not ( = ?auto_64460 ?auto_64456 ) ) ( not ( = ?auto_64464 ?auto_64456 ) ) ( IS-CRATE ?auto_64464 ) ( not ( = ?auto_64454 ?auto_64470 ) ) ( not ( = ?auto_64455 ?auto_64470 ) ) ( not ( = ?auto_64460 ?auto_64470 ) ) ( not ( = ?auto_64464 ?auto_64470 ) ) ( not ( = ?auto_64456 ?auto_64470 ) ) ( not ( = ?auto_64465 ?auto_64463 ) ) ( not ( = ?auto_64466 ?auto_64465 ) ) ( not ( = ?auto_64459 ?auto_64465 ) ) ( HOIST-AT ?auto_64462 ?auto_64465 ) ( not ( = ?auto_64469 ?auto_64462 ) ) ( not ( = ?auto_64457 ?auto_64462 ) ) ( not ( = ?auto_64461 ?auto_64462 ) ) ( AVAILABLE ?auto_64462 ) ( SURFACE-AT ?auto_64464 ?auto_64465 ) ( ON ?auto_64464 ?auto_64458 ) ( CLEAR ?auto_64464 ) ( not ( = ?auto_64454 ?auto_64458 ) ) ( not ( = ?auto_64455 ?auto_64458 ) ) ( not ( = ?auto_64460 ?auto_64458 ) ) ( not ( = ?auto_64464 ?auto_64458 ) ) ( not ( = ?auto_64456 ?auto_64458 ) ) ( not ( = ?auto_64470 ?auto_64458 ) ) ( SURFACE-AT ?auto_64468 ?auto_64463 ) ( CLEAR ?auto_64468 ) ( IS-CRATE ?auto_64470 ) ( not ( = ?auto_64454 ?auto_64468 ) ) ( not ( = ?auto_64455 ?auto_64468 ) ) ( not ( = ?auto_64460 ?auto_64468 ) ) ( not ( = ?auto_64464 ?auto_64468 ) ) ( not ( = ?auto_64456 ?auto_64468 ) ) ( not ( = ?auto_64470 ?auto_64468 ) ) ( not ( = ?auto_64458 ?auto_64468 ) ) ( AVAILABLE ?auto_64469 ) ( IN ?auto_64470 ?auto_64467 ) ( TRUCK-AT ?auto_64467 ?auto_64471 ) ( not ( = ?auto_64471 ?auto_64463 ) ) ( not ( = ?auto_64466 ?auto_64471 ) ) ( not ( = ?auto_64459 ?auto_64471 ) ) ( not ( = ?auto_64465 ?auto_64471 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_64467 ?auto_64471 ?auto_64463 )
      ( MAKE-ON ?auto_64454 ?auto_64455 )
      ( MAKE-ON-VERIFY ?auto_64454 ?auto_64455 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_64472 - SURFACE
      ?auto_64473 - SURFACE
    )
    :vars
    (
      ?auto_64480 - HOIST
      ?auto_64482 - PLACE
      ?auto_64487 - PLACE
      ?auto_64475 - HOIST
      ?auto_64483 - SURFACE
      ?auto_64476 - SURFACE
      ?auto_64477 - PLACE
      ?auto_64486 - HOIST
      ?auto_64481 - SURFACE
      ?auto_64484 - SURFACE
      ?auto_64474 - PLACE
      ?auto_64485 - HOIST
      ?auto_64489 - SURFACE
      ?auto_64488 - SURFACE
      ?auto_64479 - TRUCK
      ?auto_64478 - PLACE
      ?auto_64490 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_64480 ?auto_64482 ) ( IS-CRATE ?auto_64472 ) ( not ( = ?auto_64472 ?auto_64473 ) ) ( not ( = ?auto_64487 ?auto_64482 ) ) ( HOIST-AT ?auto_64475 ?auto_64487 ) ( not ( = ?auto_64480 ?auto_64475 ) ) ( AVAILABLE ?auto_64475 ) ( SURFACE-AT ?auto_64472 ?auto_64487 ) ( ON ?auto_64472 ?auto_64483 ) ( CLEAR ?auto_64472 ) ( not ( = ?auto_64472 ?auto_64483 ) ) ( not ( = ?auto_64473 ?auto_64483 ) ) ( IS-CRATE ?auto_64473 ) ( not ( = ?auto_64472 ?auto_64476 ) ) ( not ( = ?auto_64473 ?auto_64476 ) ) ( not ( = ?auto_64483 ?auto_64476 ) ) ( not ( = ?auto_64477 ?auto_64482 ) ) ( not ( = ?auto_64487 ?auto_64477 ) ) ( HOIST-AT ?auto_64486 ?auto_64477 ) ( not ( = ?auto_64480 ?auto_64486 ) ) ( not ( = ?auto_64475 ?auto_64486 ) ) ( AVAILABLE ?auto_64486 ) ( SURFACE-AT ?auto_64473 ?auto_64477 ) ( ON ?auto_64473 ?auto_64481 ) ( CLEAR ?auto_64473 ) ( not ( = ?auto_64472 ?auto_64481 ) ) ( not ( = ?auto_64473 ?auto_64481 ) ) ( not ( = ?auto_64483 ?auto_64481 ) ) ( not ( = ?auto_64476 ?auto_64481 ) ) ( IS-CRATE ?auto_64476 ) ( not ( = ?auto_64472 ?auto_64484 ) ) ( not ( = ?auto_64473 ?auto_64484 ) ) ( not ( = ?auto_64483 ?auto_64484 ) ) ( not ( = ?auto_64476 ?auto_64484 ) ) ( not ( = ?auto_64481 ?auto_64484 ) ) ( not ( = ?auto_64474 ?auto_64482 ) ) ( not ( = ?auto_64487 ?auto_64474 ) ) ( not ( = ?auto_64477 ?auto_64474 ) ) ( HOIST-AT ?auto_64485 ?auto_64474 ) ( not ( = ?auto_64480 ?auto_64485 ) ) ( not ( = ?auto_64475 ?auto_64485 ) ) ( not ( = ?auto_64486 ?auto_64485 ) ) ( AVAILABLE ?auto_64485 ) ( SURFACE-AT ?auto_64476 ?auto_64474 ) ( ON ?auto_64476 ?auto_64489 ) ( CLEAR ?auto_64476 ) ( not ( = ?auto_64472 ?auto_64489 ) ) ( not ( = ?auto_64473 ?auto_64489 ) ) ( not ( = ?auto_64483 ?auto_64489 ) ) ( not ( = ?auto_64476 ?auto_64489 ) ) ( not ( = ?auto_64481 ?auto_64489 ) ) ( not ( = ?auto_64484 ?auto_64489 ) ) ( SURFACE-AT ?auto_64488 ?auto_64482 ) ( CLEAR ?auto_64488 ) ( IS-CRATE ?auto_64484 ) ( not ( = ?auto_64472 ?auto_64488 ) ) ( not ( = ?auto_64473 ?auto_64488 ) ) ( not ( = ?auto_64483 ?auto_64488 ) ) ( not ( = ?auto_64476 ?auto_64488 ) ) ( not ( = ?auto_64481 ?auto_64488 ) ) ( not ( = ?auto_64484 ?auto_64488 ) ) ( not ( = ?auto_64489 ?auto_64488 ) ) ( AVAILABLE ?auto_64480 ) ( TRUCK-AT ?auto_64479 ?auto_64478 ) ( not ( = ?auto_64478 ?auto_64482 ) ) ( not ( = ?auto_64487 ?auto_64478 ) ) ( not ( = ?auto_64477 ?auto_64478 ) ) ( not ( = ?auto_64474 ?auto_64478 ) ) ( HOIST-AT ?auto_64490 ?auto_64478 ) ( LIFTING ?auto_64490 ?auto_64484 ) ( not ( = ?auto_64480 ?auto_64490 ) ) ( not ( = ?auto_64475 ?auto_64490 ) ) ( not ( = ?auto_64486 ?auto_64490 ) ) ( not ( = ?auto_64485 ?auto_64490 ) ) )
    :subtasks
    ( ( !LOAD ?auto_64490 ?auto_64484 ?auto_64479 ?auto_64478 )
      ( MAKE-ON ?auto_64472 ?auto_64473 )
      ( MAKE-ON-VERIFY ?auto_64472 ?auto_64473 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_64491 - SURFACE
      ?auto_64492 - SURFACE
    )
    :vars
    (
      ?auto_64500 - HOIST
      ?auto_64499 - PLACE
      ?auto_64503 - PLACE
      ?auto_64505 - HOIST
      ?auto_64498 - SURFACE
      ?auto_64495 - SURFACE
      ?auto_64507 - PLACE
      ?auto_64497 - HOIST
      ?auto_64506 - SURFACE
      ?auto_64504 - SURFACE
      ?auto_64496 - PLACE
      ?auto_64501 - HOIST
      ?auto_64509 - SURFACE
      ?auto_64493 - SURFACE
      ?auto_64502 - TRUCK
      ?auto_64494 - PLACE
      ?auto_64508 - HOIST
      ?auto_64510 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_64500 ?auto_64499 ) ( IS-CRATE ?auto_64491 ) ( not ( = ?auto_64491 ?auto_64492 ) ) ( not ( = ?auto_64503 ?auto_64499 ) ) ( HOIST-AT ?auto_64505 ?auto_64503 ) ( not ( = ?auto_64500 ?auto_64505 ) ) ( AVAILABLE ?auto_64505 ) ( SURFACE-AT ?auto_64491 ?auto_64503 ) ( ON ?auto_64491 ?auto_64498 ) ( CLEAR ?auto_64491 ) ( not ( = ?auto_64491 ?auto_64498 ) ) ( not ( = ?auto_64492 ?auto_64498 ) ) ( IS-CRATE ?auto_64492 ) ( not ( = ?auto_64491 ?auto_64495 ) ) ( not ( = ?auto_64492 ?auto_64495 ) ) ( not ( = ?auto_64498 ?auto_64495 ) ) ( not ( = ?auto_64507 ?auto_64499 ) ) ( not ( = ?auto_64503 ?auto_64507 ) ) ( HOIST-AT ?auto_64497 ?auto_64507 ) ( not ( = ?auto_64500 ?auto_64497 ) ) ( not ( = ?auto_64505 ?auto_64497 ) ) ( AVAILABLE ?auto_64497 ) ( SURFACE-AT ?auto_64492 ?auto_64507 ) ( ON ?auto_64492 ?auto_64506 ) ( CLEAR ?auto_64492 ) ( not ( = ?auto_64491 ?auto_64506 ) ) ( not ( = ?auto_64492 ?auto_64506 ) ) ( not ( = ?auto_64498 ?auto_64506 ) ) ( not ( = ?auto_64495 ?auto_64506 ) ) ( IS-CRATE ?auto_64495 ) ( not ( = ?auto_64491 ?auto_64504 ) ) ( not ( = ?auto_64492 ?auto_64504 ) ) ( not ( = ?auto_64498 ?auto_64504 ) ) ( not ( = ?auto_64495 ?auto_64504 ) ) ( not ( = ?auto_64506 ?auto_64504 ) ) ( not ( = ?auto_64496 ?auto_64499 ) ) ( not ( = ?auto_64503 ?auto_64496 ) ) ( not ( = ?auto_64507 ?auto_64496 ) ) ( HOIST-AT ?auto_64501 ?auto_64496 ) ( not ( = ?auto_64500 ?auto_64501 ) ) ( not ( = ?auto_64505 ?auto_64501 ) ) ( not ( = ?auto_64497 ?auto_64501 ) ) ( AVAILABLE ?auto_64501 ) ( SURFACE-AT ?auto_64495 ?auto_64496 ) ( ON ?auto_64495 ?auto_64509 ) ( CLEAR ?auto_64495 ) ( not ( = ?auto_64491 ?auto_64509 ) ) ( not ( = ?auto_64492 ?auto_64509 ) ) ( not ( = ?auto_64498 ?auto_64509 ) ) ( not ( = ?auto_64495 ?auto_64509 ) ) ( not ( = ?auto_64506 ?auto_64509 ) ) ( not ( = ?auto_64504 ?auto_64509 ) ) ( SURFACE-AT ?auto_64493 ?auto_64499 ) ( CLEAR ?auto_64493 ) ( IS-CRATE ?auto_64504 ) ( not ( = ?auto_64491 ?auto_64493 ) ) ( not ( = ?auto_64492 ?auto_64493 ) ) ( not ( = ?auto_64498 ?auto_64493 ) ) ( not ( = ?auto_64495 ?auto_64493 ) ) ( not ( = ?auto_64506 ?auto_64493 ) ) ( not ( = ?auto_64504 ?auto_64493 ) ) ( not ( = ?auto_64509 ?auto_64493 ) ) ( AVAILABLE ?auto_64500 ) ( TRUCK-AT ?auto_64502 ?auto_64494 ) ( not ( = ?auto_64494 ?auto_64499 ) ) ( not ( = ?auto_64503 ?auto_64494 ) ) ( not ( = ?auto_64507 ?auto_64494 ) ) ( not ( = ?auto_64496 ?auto_64494 ) ) ( HOIST-AT ?auto_64508 ?auto_64494 ) ( not ( = ?auto_64500 ?auto_64508 ) ) ( not ( = ?auto_64505 ?auto_64508 ) ) ( not ( = ?auto_64497 ?auto_64508 ) ) ( not ( = ?auto_64501 ?auto_64508 ) ) ( AVAILABLE ?auto_64508 ) ( SURFACE-AT ?auto_64504 ?auto_64494 ) ( ON ?auto_64504 ?auto_64510 ) ( CLEAR ?auto_64504 ) ( not ( = ?auto_64491 ?auto_64510 ) ) ( not ( = ?auto_64492 ?auto_64510 ) ) ( not ( = ?auto_64498 ?auto_64510 ) ) ( not ( = ?auto_64495 ?auto_64510 ) ) ( not ( = ?auto_64506 ?auto_64510 ) ) ( not ( = ?auto_64504 ?auto_64510 ) ) ( not ( = ?auto_64509 ?auto_64510 ) ) ( not ( = ?auto_64493 ?auto_64510 ) ) )
    :subtasks
    ( ( !LIFT ?auto_64508 ?auto_64504 ?auto_64510 ?auto_64494 )
      ( MAKE-ON ?auto_64491 ?auto_64492 )
      ( MAKE-ON-VERIFY ?auto_64491 ?auto_64492 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_64511 - SURFACE
      ?auto_64512 - SURFACE
    )
    :vars
    (
      ?auto_64522 - HOIST
      ?auto_64513 - PLACE
      ?auto_64514 - PLACE
      ?auto_64523 - HOIST
      ?auto_64519 - SURFACE
      ?auto_64521 - SURFACE
      ?auto_64526 - PLACE
      ?auto_64524 - HOIST
      ?auto_64515 - SURFACE
      ?auto_64528 - SURFACE
      ?auto_64517 - PLACE
      ?auto_64520 - HOIST
      ?auto_64529 - SURFACE
      ?auto_64518 - SURFACE
      ?auto_64516 - PLACE
      ?auto_64525 - HOIST
      ?auto_64530 - SURFACE
      ?auto_64527 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_64522 ?auto_64513 ) ( IS-CRATE ?auto_64511 ) ( not ( = ?auto_64511 ?auto_64512 ) ) ( not ( = ?auto_64514 ?auto_64513 ) ) ( HOIST-AT ?auto_64523 ?auto_64514 ) ( not ( = ?auto_64522 ?auto_64523 ) ) ( AVAILABLE ?auto_64523 ) ( SURFACE-AT ?auto_64511 ?auto_64514 ) ( ON ?auto_64511 ?auto_64519 ) ( CLEAR ?auto_64511 ) ( not ( = ?auto_64511 ?auto_64519 ) ) ( not ( = ?auto_64512 ?auto_64519 ) ) ( IS-CRATE ?auto_64512 ) ( not ( = ?auto_64511 ?auto_64521 ) ) ( not ( = ?auto_64512 ?auto_64521 ) ) ( not ( = ?auto_64519 ?auto_64521 ) ) ( not ( = ?auto_64526 ?auto_64513 ) ) ( not ( = ?auto_64514 ?auto_64526 ) ) ( HOIST-AT ?auto_64524 ?auto_64526 ) ( not ( = ?auto_64522 ?auto_64524 ) ) ( not ( = ?auto_64523 ?auto_64524 ) ) ( AVAILABLE ?auto_64524 ) ( SURFACE-AT ?auto_64512 ?auto_64526 ) ( ON ?auto_64512 ?auto_64515 ) ( CLEAR ?auto_64512 ) ( not ( = ?auto_64511 ?auto_64515 ) ) ( not ( = ?auto_64512 ?auto_64515 ) ) ( not ( = ?auto_64519 ?auto_64515 ) ) ( not ( = ?auto_64521 ?auto_64515 ) ) ( IS-CRATE ?auto_64521 ) ( not ( = ?auto_64511 ?auto_64528 ) ) ( not ( = ?auto_64512 ?auto_64528 ) ) ( not ( = ?auto_64519 ?auto_64528 ) ) ( not ( = ?auto_64521 ?auto_64528 ) ) ( not ( = ?auto_64515 ?auto_64528 ) ) ( not ( = ?auto_64517 ?auto_64513 ) ) ( not ( = ?auto_64514 ?auto_64517 ) ) ( not ( = ?auto_64526 ?auto_64517 ) ) ( HOIST-AT ?auto_64520 ?auto_64517 ) ( not ( = ?auto_64522 ?auto_64520 ) ) ( not ( = ?auto_64523 ?auto_64520 ) ) ( not ( = ?auto_64524 ?auto_64520 ) ) ( AVAILABLE ?auto_64520 ) ( SURFACE-AT ?auto_64521 ?auto_64517 ) ( ON ?auto_64521 ?auto_64529 ) ( CLEAR ?auto_64521 ) ( not ( = ?auto_64511 ?auto_64529 ) ) ( not ( = ?auto_64512 ?auto_64529 ) ) ( not ( = ?auto_64519 ?auto_64529 ) ) ( not ( = ?auto_64521 ?auto_64529 ) ) ( not ( = ?auto_64515 ?auto_64529 ) ) ( not ( = ?auto_64528 ?auto_64529 ) ) ( SURFACE-AT ?auto_64518 ?auto_64513 ) ( CLEAR ?auto_64518 ) ( IS-CRATE ?auto_64528 ) ( not ( = ?auto_64511 ?auto_64518 ) ) ( not ( = ?auto_64512 ?auto_64518 ) ) ( not ( = ?auto_64519 ?auto_64518 ) ) ( not ( = ?auto_64521 ?auto_64518 ) ) ( not ( = ?auto_64515 ?auto_64518 ) ) ( not ( = ?auto_64528 ?auto_64518 ) ) ( not ( = ?auto_64529 ?auto_64518 ) ) ( AVAILABLE ?auto_64522 ) ( not ( = ?auto_64516 ?auto_64513 ) ) ( not ( = ?auto_64514 ?auto_64516 ) ) ( not ( = ?auto_64526 ?auto_64516 ) ) ( not ( = ?auto_64517 ?auto_64516 ) ) ( HOIST-AT ?auto_64525 ?auto_64516 ) ( not ( = ?auto_64522 ?auto_64525 ) ) ( not ( = ?auto_64523 ?auto_64525 ) ) ( not ( = ?auto_64524 ?auto_64525 ) ) ( not ( = ?auto_64520 ?auto_64525 ) ) ( AVAILABLE ?auto_64525 ) ( SURFACE-AT ?auto_64528 ?auto_64516 ) ( ON ?auto_64528 ?auto_64530 ) ( CLEAR ?auto_64528 ) ( not ( = ?auto_64511 ?auto_64530 ) ) ( not ( = ?auto_64512 ?auto_64530 ) ) ( not ( = ?auto_64519 ?auto_64530 ) ) ( not ( = ?auto_64521 ?auto_64530 ) ) ( not ( = ?auto_64515 ?auto_64530 ) ) ( not ( = ?auto_64528 ?auto_64530 ) ) ( not ( = ?auto_64529 ?auto_64530 ) ) ( not ( = ?auto_64518 ?auto_64530 ) ) ( TRUCK-AT ?auto_64527 ?auto_64513 ) )
    :subtasks
    ( ( !DRIVE ?auto_64527 ?auto_64513 ?auto_64516 )
      ( MAKE-ON ?auto_64511 ?auto_64512 )
      ( MAKE-ON-VERIFY ?auto_64511 ?auto_64512 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_64533 - SURFACE
      ?auto_64534 - SURFACE
    )
    :vars
    (
      ?auto_64535 - HOIST
      ?auto_64536 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_64535 ?auto_64536 ) ( SURFACE-AT ?auto_64534 ?auto_64536 ) ( CLEAR ?auto_64534 ) ( LIFTING ?auto_64535 ?auto_64533 ) ( IS-CRATE ?auto_64533 ) ( not ( = ?auto_64533 ?auto_64534 ) ) )
    :subtasks
    ( ( !DROP ?auto_64535 ?auto_64533 ?auto_64534 ?auto_64536 )
      ( MAKE-ON-VERIFY ?auto_64533 ?auto_64534 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_64537 - SURFACE
      ?auto_64538 - SURFACE
    )
    :vars
    (
      ?auto_64539 - HOIST
      ?auto_64540 - PLACE
      ?auto_64541 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_64539 ?auto_64540 ) ( SURFACE-AT ?auto_64538 ?auto_64540 ) ( CLEAR ?auto_64538 ) ( IS-CRATE ?auto_64537 ) ( not ( = ?auto_64537 ?auto_64538 ) ) ( TRUCK-AT ?auto_64541 ?auto_64540 ) ( AVAILABLE ?auto_64539 ) ( IN ?auto_64537 ?auto_64541 ) )
    :subtasks
    ( ( !UNLOAD ?auto_64539 ?auto_64537 ?auto_64541 ?auto_64540 )
      ( MAKE-ON ?auto_64537 ?auto_64538 )
      ( MAKE-ON-VERIFY ?auto_64537 ?auto_64538 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_64542 - SURFACE
      ?auto_64543 - SURFACE
    )
    :vars
    (
      ?auto_64544 - HOIST
      ?auto_64545 - PLACE
      ?auto_64546 - TRUCK
      ?auto_64547 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_64544 ?auto_64545 ) ( SURFACE-AT ?auto_64543 ?auto_64545 ) ( CLEAR ?auto_64543 ) ( IS-CRATE ?auto_64542 ) ( not ( = ?auto_64542 ?auto_64543 ) ) ( AVAILABLE ?auto_64544 ) ( IN ?auto_64542 ?auto_64546 ) ( TRUCK-AT ?auto_64546 ?auto_64547 ) ( not ( = ?auto_64547 ?auto_64545 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_64546 ?auto_64547 ?auto_64545 )
      ( MAKE-ON ?auto_64542 ?auto_64543 )
      ( MAKE-ON-VERIFY ?auto_64542 ?auto_64543 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_64548 - SURFACE
      ?auto_64549 - SURFACE
    )
    :vars
    (
      ?auto_64553 - HOIST
      ?auto_64550 - PLACE
      ?auto_64551 - TRUCK
      ?auto_64552 - PLACE
      ?auto_64554 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_64553 ?auto_64550 ) ( SURFACE-AT ?auto_64549 ?auto_64550 ) ( CLEAR ?auto_64549 ) ( IS-CRATE ?auto_64548 ) ( not ( = ?auto_64548 ?auto_64549 ) ) ( AVAILABLE ?auto_64553 ) ( TRUCK-AT ?auto_64551 ?auto_64552 ) ( not ( = ?auto_64552 ?auto_64550 ) ) ( HOIST-AT ?auto_64554 ?auto_64552 ) ( LIFTING ?auto_64554 ?auto_64548 ) ( not ( = ?auto_64553 ?auto_64554 ) ) )
    :subtasks
    ( ( !LOAD ?auto_64554 ?auto_64548 ?auto_64551 ?auto_64552 )
      ( MAKE-ON ?auto_64548 ?auto_64549 )
      ( MAKE-ON-VERIFY ?auto_64548 ?auto_64549 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_64555 - SURFACE
      ?auto_64556 - SURFACE
    )
    :vars
    (
      ?auto_64557 - HOIST
      ?auto_64558 - PLACE
      ?auto_64559 - TRUCK
      ?auto_64561 - PLACE
      ?auto_64560 - HOIST
      ?auto_64562 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_64557 ?auto_64558 ) ( SURFACE-AT ?auto_64556 ?auto_64558 ) ( CLEAR ?auto_64556 ) ( IS-CRATE ?auto_64555 ) ( not ( = ?auto_64555 ?auto_64556 ) ) ( AVAILABLE ?auto_64557 ) ( TRUCK-AT ?auto_64559 ?auto_64561 ) ( not ( = ?auto_64561 ?auto_64558 ) ) ( HOIST-AT ?auto_64560 ?auto_64561 ) ( not ( = ?auto_64557 ?auto_64560 ) ) ( AVAILABLE ?auto_64560 ) ( SURFACE-AT ?auto_64555 ?auto_64561 ) ( ON ?auto_64555 ?auto_64562 ) ( CLEAR ?auto_64555 ) ( not ( = ?auto_64555 ?auto_64562 ) ) ( not ( = ?auto_64556 ?auto_64562 ) ) )
    :subtasks
    ( ( !LIFT ?auto_64560 ?auto_64555 ?auto_64562 ?auto_64561 )
      ( MAKE-ON ?auto_64555 ?auto_64556 )
      ( MAKE-ON-VERIFY ?auto_64555 ?auto_64556 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_64563 - SURFACE
      ?auto_64564 - SURFACE
    )
    :vars
    (
      ?auto_64568 - HOIST
      ?auto_64570 - PLACE
      ?auto_64567 - PLACE
      ?auto_64569 - HOIST
      ?auto_64565 - SURFACE
      ?auto_64566 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_64568 ?auto_64570 ) ( SURFACE-AT ?auto_64564 ?auto_64570 ) ( CLEAR ?auto_64564 ) ( IS-CRATE ?auto_64563 ) ( not ( = ?auto_64563 ?auto_64564 ) ) ( AVAILABLE ?auto_64568 ) ( not ( = ?auto_64567 ?auto_64570 ) ) ( HOIST-AT ?auto_64569 ?auto_64567 ) ( not ( = ?auto_64568 ?auto_64569 ) ) ( AVAILABLE ?auto_64569 ) ( SURFACE-AT ?auto_64563 ?auto_64567 ) ( ON ?auto_64563 ?auto_64565 ) ( CLEAR ?auto_64563 ) ( not ( = ?auto_64563 ?auto_64565 ) ) ( not ( = ?auto_64564 ?auto_64565 ) ) ( TRUCK-AT ?auto_64566 ?auto_64570 ) )
    :subtasks
    ( ( !DRIVE ?auto_64566 ?auto_64570 ?auto_64567 )
      ( MAKE-ON ?auto_64563 ?auto_64564 )
      ( MAKE-ON-VERIFY ?auto_64563 ?auto_64564 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_64571 - SURFACE
      ?auto_64572 - SURFACE
    )
    :vars
    (
      ?auto_64574 - HOIST
      ?auto_64576 - PLACE
      ?auto_64575 - PLACE
      ?auto_64578 - HOIST
      ?auto_64577 - SURFACE
      ?auto_64573 - TRUCK
      ?auto_64579 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_64574 ?auto_64576 ) ( IS-CRATE ?auto_64571 ) ( not ( = ?auto_64571 ?auto_64572 ) ) ( not ( = ?auto_64575 ?auto_64576 ) ) ( HOIST-AT ?auto_64578 ?auto_64575 ) ( not ( = ?auto_64574 ?auto_64578 ) ) ( AVAILABLE ?auto_64578 ) ( SURFACE-AT ?auto_64571 ?auto_64575 ) ( ON ?auto_64571 ?auto_64577 ) ( CLEAR ?auto_64571 ) ( not ( = ?auto_64571 ?auto_64577 ) ) ( not ( = ?auto_64572 ?auto_64577 ) ) ( TRUCK-AT ?auto_64573 ?auto_64576 ) ( SURFACE-AT ?auto_64579 ?auto_64576 ) ( CLEAR ?auto_64579 ) ( LIFTING ?auto_64574 ?auto_64572 ) ( IS-CRATE ?auto_64572 ) ( not ( = ?auto_64571 ?auto_64579 ) ) ( not ( = ?auto_64572 ?auto_64579 ) ) ( not ( = ?auto_64577 ?auto_64579 ) ) )
    :subtasks
    ( ( !DROP ?auto_64574 ?auto_64572 ?auto_64579 ?auto_64576 )
      ( MAKE-ON ?auto_64571 ?auto_64572 )
      ( MAKE-ON-VERIFY ?auto_64571 ?auto_64572 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_64580 - SURFACE
      ?auto_64581 - SURFACE
    )
    :vars
    (
      ?auto_64583 - HOIST
      ?auto_64586 - PLACE
      ?auto_64588 - PLACE
      ?auto_64584 - HOIST
      ?auto_64585 - SURFACE
      ?auto_64582 - TRUCK
      ?auto_64587 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_64583 ?auto_64586 ) ( IS-CRATE ?auto_64580 ) ( not ( = ?auto_64580 ?auto_64581 ) ) ( not ( = ?auto_64588 ?auto_64586 ) ) ( HOIST-AT ?auto_64584 ?auto_64588 ) ( not ( = ?auto_64583 ?auto_64584 ) ) ( AVAILABLE ?auto_64584 ) ( SURFACE-AT ?auto_64580 ?auto_64588 ) ( ON ?auto_64580 ?auto_64585 ) ( CLEAR ?auto_64580 ) ( not ( = ?auto_64580 ?auto_64585 ) ) ( not ( = ?auto_64581 ?auto_64585 ) ) ( TRUCK-AT ?auto_64582 ?auto_64586 ) ( SURFACE-AT ?auto_64587 ?auto_64586 ) ( CLEAR ?auto_64587 ) ( IS-CRATE ?auto_64581 ) ( not ( = ?auto_64580 ?auto_64587 ) ) ( not ( = ?auto_64581 ?auto_64587 ) ) ( not ( = ?auto_64585 ?auto_64587 ) ) ( AVAILABLE ?auto_64583 ) ( IN ?auto_64581 ?auto_64582 ) )
    :subtasks
    ( ( !UNLOAD ?auto_64583 ?auto_64581 ?auto_64582 ?auto_64586 )
      ( MAKE-ON ?auto_64580 ?auto_64581 )
      ( MAKE-ON-VERIFY ?auto_64580 ?auto_64581 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_64589 - SURFACE
      ?auto_64590 - SURFACE
    )
    :vars
    (
      ?auto_64597 - HOIST
      ?auto_64596 - PLACE
      ?auto_64592 - PLACE
      ?auto_64594 - HOIST
      ?auto_64595 - SURFACE
      ?auto_64593 - SURFACE
      ?auto_64591 - TRUCK
      ?auto_64598 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_64597 ?auto_64596 ) ( IS-CRATE ?auto_64589 ) ( not ( = ?auto_64589 ?auto_64590 ) ) ( not ( = ?auto_64592 ?auto_64596 ) ) ( HOIST-AT ?auto_64594 ?auto_64592 ) ( not ( = ?auto_64597 ?auto_64594 ) ) ( AVAILABLE ?auto_64594 ) ( SURFACE-AT ?auto_64589 ?auto_64592 ) ( ON ?auto_64589 ?auto_64595 ) ( CLEAR ?auto_64589 ) ( not ( = ?auto_64589 ?auto_64595 ) ) ( not ( = ?auto_64590 ?auto_64595 ) ) ( SURFACE-AT ?auto_64593 ?auto_64596 ) ( CLEAR ?auto_64593 ) ( IS-CRATE ?auto_64590 ) ( not ( = ?auto_64589 ?auto_64593 ) ) ( not ( = ?auto_64590 ?auto_64593 ) ) ( not ( = ?auto_64595 ?auto_64593 ) ) ( AVAILABLE ?auto_64597 ) ( IN ?auto_64590 ?auto_64591 ) ( TRUCK-AT ?auto_64591 ?auto_64598 ) ( not ( = ?auto_64598 ?auto_64596 ) ) ( not ( = ?auto_64592 ?auto_64598 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_64591 ?auto_64598 ?auto_64596 )
      ( MAKE-ON ?auto_64589 ?auto_64590 )
      ( MAKE-ON-VERIFY ?auto_64589 ?auto_64590 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_64599 - SURFACE
      ?auto_64600 - SURFACE
    )
    :vars
    (
      ?auto_64603 - HOIST
      ?auto_64602 - PLACE
      ?auto_64604 - PLACE
      ?auto_64607 - HOIST
      ?auto_64605 - SURFACE
      ?auto_64601 - SURFACE
      ?auto_64608 - TRUCK
      ?auto_64606 - PLACE
      ?auto_64609 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_64603 ?auto_64602 ) ( IS-CRATE ?auto_64599 ) ( not ( = ?auto_64599 ?auto_64600 ) ) ( not ( = ?auto_64604 ?auto_64602 ) ) ( HOIST-AT ?auto_64607 ?auto_64604 ) ( not ( = ?auto_64603 ?auto_64607 ) ) ( AVAILABLE ?auto_64607 ) ( SURFACE-AT ?auto_64599 ?auto_64604 ) ( ON ?auto_64599 ?auto_64605 ) ( CLEAR ?auto_64599 ) ( not ( = ?auto_64599 ?auto_64605 ) ) ( not ( = ?auto_64600 ?auto_64605 ) ) ( SURFACE-AT ?auto_64601 ?auto_64602 ) ( CLEAR ?auto_64601 ) ( IS-CRATE ?auto_64600 ) ( not ( = ?auto_64599 ?auto_64601 ) ) ( not ( = ?auto_64600 ?auto_64601 ) ) ( not ( = ?auto_64605 ?auto_64601 ) ) ( AVAILABLE ?auto_64603 ) ( TRUCK-AT ?auto_64608 ?auto_64606 ) ( not ( = ?auto_64606 ?auto_64602 ) ) ( not ( = ?auto_64604 ?auto_64606 ) ) ( HOIST-AT ?auto_64609 ?auto_64606 ) ( LIFTING ?auto_64609 ?auto_64600 ) ( not ( = ?auto_64603 ?auto_64609 ) ) ( not ( = ?auto_64607 ?auto_64609 ) ) )
    :subtasks
    ( ( !LOAD ?auto_64609 ?auto_64600 ?auto_64608 ?auto_64606 )
      ( MAKE-ON ?auto_64599 ?auto_64600 )
      ( MAKE-ON-VERIFY ?auto_64599 ?auto_64600 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_64610 - SURFACE
      ?auto_64611 - SURFACE
    )
    :vars
    (
      ?auto_64612 - HOIST
      ?auto_64613 - PLACE
      ?auto_64616 - PLACE
      ?auto_64619 - HOIST
      ?auto_64614 - SURFACE
      ?auto_64620 - SURFACE
      ?auto_64618 - TRUCK
      ?auto_64617 - PLACE
      ?auto_64615 - HOIST
      ?auto_64621 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_64612 ?auto_64613 ) ( IS-CRATE ?auto_64610 ) ( not ( = ?auto_64610 ?auto_64611 ) ) ( not ( = ?auto_64616 ?auto_64613 ) ) ( HOIST-AT ?auto_64619 ?auto_64616 ) ( not ( = ?auto_64612 ?auto_64619 ) ) ( AVAILABLE ?auto_64619 ) ( SURFACE-AT ?auto_64610 ?auto_64616 ) ( ON ?auto_64610 ?auto_64614 ) ( CLEAR ?auto_64610 ) ( not ( = ?auto_64610 ?auto_64614 ) ) ( not ( = ?auto_64611 ?auto_64614 ) ) ( SURFACE-AT ?auto_64620 ?auto_64613 ) ( CLEAR ?auto_64620 ) ( IS-CRATE ?auto_64611 ) ( not ( = ?auto_64610 ?auto_64620 ) ) ( not ( = ?auto_64611 ?auto_64620 ) ) ( not ( = ?auto_64614 ?auto_64620 ) ) ( AVAILABLE ?auto_64612 ) ( TRUCK-AT ?auto_64618 ?auto_64617 ) ( not ( = ?auto_64617 ?auto_64613 ) ) ( not ( = ?auto_64616 ?auto_64617 ) ) ( HOIST-AT ?auto_64615 ?auto_64617 ) ( not ( = ?auto_64612 ?auto_64615 ) ) ( not ( = ?auto_64619 ?auto_64615 ) ) ( AVAILABLE ?auto_64615 ) ( SURFACE-AT ?auto_64611 ?auto_64617 ) ( ON ?auto_64611 ?auto_64621 ) ( CLEAR ?auto_64611 ) ( not ( = ?auto_64610 ?auto_64621 ) ) ( not ( = ?auto_64611 ?auto_64621 ) ) ( not ( = ?auto_64614 ?auto_64621 ) ) ( not ( = ?auto_64620 ?auto_64621 ) ) )
    :subtasks
    ( ( !LIFT ?auto_64615 ?auto_64611 ?auto_64621 ?auto_64617 )
      ( MAKE-ON ?auto_64610 ?auto_64611 )
      ( MAKE-ON-VERIFY ?auto_64610 ?auto_64611 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_64622 - SURFACE
      ?auto_64623 - SURFACE
    )
    :vars
    (
      ?auto_64630 - HOIST
      ?auto_64629 - PLACE
      ?auto_64631 - PLACE
      ?auto_64627 - HOIST
      ?auto_64626 - SURFACE
      ?auto_64625 - SURFACE
      ?auto_64633 - PLACE
      ?auto_64632 - HOIST
      ?auto_64624 - SURFACE
      ?auto_64628 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_64630 ?auto_64629 ) ( IS-CRATE ?auto_64622 ) ( not ( = ?auto_64622 ?auto_64623 ) ) ( not ( = ?auto_64631 ?auto_64629 ) ) ( HOIST-AT ?auto_64627 ?auto_64631 ) ( not ( = ?auto_64630 ?auto_64627 ) ) ( AVAILABLE ?auto_64627 ) ( SURFACE-AT ?auto_64622 ?auto_64631 ) ( ON ?auto_64622 ?auto_64626 ) ( CLEAR ?auto_64622 ) ( not ( = ?auto_64622 ?auto_64626 ) ) ( not ( = ?auto_64623 ?auto_64626 ) ) ( SURFACE-AT ?auto_64625 ?auto_64629 ) ( CLEAR ?auto_64625 ) ( IS-CRATE ?auto_64623 ) ( not ( = ?auto_64622 ?auto_64625 ) ) ( not ( = ?auto_64623 ?auto_64625 ) ) ( not ( = ?auto_64626 ?auto_64625 ) ) ( AVAILABLE ?auto_64630 ) ( not ( = ?auto_64633 ?auto_64629 ) ) ( not ( = ?auto_64631 ?auto_64633 ) ) ( HOIST-AT ?auto_64632 ?auto_64633 ) ( not ( = ?auto_64630 ?auto_64632 ) ) ( not ( = ?auto_64627 ?auto_64632 ) ) ( AVAILABLE ?auto_64632 ) ( SURFACE-AT ?auto_64623 ?auto_64633 ) ( ON ?auto_64623 ?auto_64624 ) ( CLEAR ?auto_64623 ) ( not ( = ?auto_64622 ?auto_64624 ) ) ( not ( = ?auto_64623 ?auto_64624 ) ) ( not ( = ?auto_64626 ?auto_64624 ) ) ( not ( = ?auto_64625 ?auto_64624 ) ) ( TRUCK-AT ?auto_64628 ?auto_64629 ) )
    :subtasks
    ( ( !DRIVE ?auto_64628 ?auto_64629 ?auto_64633 )
      ( MAKE-ON ?auto_64622 ?auto_64623 )
      ( MAKE-ON-VERIFY ?auto_64622 ?auto_64623 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_64634 - SURFACE
      ?auto_64635 - SURFACE
    )
    :vars
    (
      ?auto_64643 - HOIST
      ?auto_64641 - PLACE
      ?auto_64645 - PLACE
      ?auto_64640 - HOIST
      ?auto_64638 - SURFACE
      ?auto_64642 - SURFACE
      ?auto_64644 - PLACE
      ?auto_64639 - HOIST
      ?auto_64637 - SURFACE
      ?auto_64636 - TRUCK
      ?auto_64646 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_64643 ?auto_64641 ) ( IS-CRATE ?auto_64634 ) ( not ( = ?auto_64634 ?auto_64635 ) ) ( not ( = ?auto_64645 ?auto_64641 ) ) ( HOIST-AT ?auto_64640 ?auto_64645 ) ( not ( = ?auto_64643 ?auto_64640 ) ) ( AVAILABLE ?auto_64640 ) ( SURFACE-AT ?auto_64634 ?auto_64645 ) ( ON ?auto_64634 ?auto_64638 ) ( CLEAR ?auto_64634 ) ( not ( = ?auto_64634 ?auto_64638 ) ) ( not ( = ?auto_64635 ?auto_64638 ) ) ( IS-CRATE ?auto_64635 ) ( not ( = ?auto_64634 ?auto_64642 ) ) ( not ( = ?auto_64635 ?auto_64642 ) ) ( not ( = ?auto_64638 ?auto_64642 ) ) ( not ( = ?auto_64644 ?auto_64641 ) ) ( not ( = ?auto_64645 ?auto_64644 ) ) ( HOIST-AT ?auto_64639 ?auto_64644 ) ( not ( = ?auto_64643 ?auto_64639 ) ) ( not ( = ?auto_64640 ?auto_64639 ) ) ( AVAILABLE ?auto_64639 ) ( SURFACE-AT ?auto_64635 ?auto_64644 ) ( ON ?auto_64635 ?auto_64637 ) ( CLEAR ?auto_64635 ) ( not ( = ?auto_64634 ?auto_64637 ) ) ( not ( = ?auto_64635 ?auto_64637 ) ) ( not ( = ?auto_64638 ?auto_64637 ) ) ( not ( = ?auto_64642 ?auto_64637 ) ) ( TRUCK-AT ?auto_64636 ?auto_64641 ) ( SURFACE-AT ?auto_64646 ?auto_64641 ) ( CLEAR ?auto_64646 ) ( LIFTING ?auto_64643 ?auto_64642 ) ( IS-CRATE ?auto_64642 ) ( not ( = ?auto_64634 ?auto_64646 ) ) ( not ( = ?auto_64635 ?auto_64646 ) ) ( not ( = ?auto_64638 ?auto_64646 ) ) ( not ( = ?auto_64642 ?auto_64646 ) ) ( not ( = ?auto_64637 ?auto_64646 ) ) )
    :subtasks
    ( ( !DROP ?auto_64643 ?auto_64642 ?auto_64646 ?auto_64641 )
      ( MAKE-ON ?auto_64634 ?auto_64635 )
      ( MAKE-ON-VERIFY ?auto_64634 ?auto_64635 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_64647 - SURFACE
      ?auto_64648 - SURFACE
    )
    :vars
    (
      ?auto_64653 - HOIST
      ?auto_64659 - PLACE
      ?auto_64652 - PLACE
      ?auto_64656 - HOIST
      ?auto_64657 - SURFACE
      ?auto_64651 - SURFACE
      ?auto_64649 - PLACE
      ?auto_64658 - HOIST
      ?auto_64650 - SURFACE
      ?auto_64654 - TRUCK
      ?auto_64655 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_64653 ?auto_64659 ) ( IS-CRATE ?auto_64647 ) ( not ( = ?auto_64647 ?auto_64648 ) ) ( not ( = ?auto_64652 ?auto_64659 ) ) ( HOIST-AT ?auto_64656 ?auto_64652 ) ( not ( = ?auto_64653 ?auto_64656 ) ) ( AVAILABLE ?auto_64656 ) ( SURFACE-AT ?auto_64647 ?auto_64652 ) ( ON ?auto_64647 ?auto_64657 ) ( CLEAR ?auto_64647 ) ( not ( = ?auto_64647 ?auto_64657 ) ) ( not ( = ?auto_64648 ?auto_64657 ) ) ( IS-CRATE ?auto_64648 ) ( not ( = ?auto_64647 ?auto_64651 ) ) ( not ( = ?auto_64648 ?auto_64651 ) ) ( not ( = ?auto_64657 ?auto_64651 ) ) ( not ( = ?auto_64649 ?auto_64659 ) ) ( not ( = ?auto_64652 ?auto_64649 ) ) ( HOIST-AT ?auto_64658 ?auto_64649 ) ( not ( = ?auto_64653 ?auto_64658 ) ) ( not ( = ?auto_64656 ?auto_64658 ) ) ( AVAILABLE ?auto_64658 ) ( SURFACE-AT ?auto_64648 ?auto_64649 ) ( ON ?auto_64648 ?auto_64650 ) ( CLEAR ?auto_64648 ) ( not ( = ?auto_64647 ?auto_64650 ) ) ( not ( = ?auto_64648 ?auto_64650 ) ) ( not ( = ?auto_64657 ?auto_64650 ) ) ( not ( = ?auto_64651 ?auto_64650 ) ) ( TRUCK-AT ?auto_64654 ?auto_64659 ) ( SURFACE-AT ?auto_64655 ?auto_64659 ) ( CLEAR ?auto_64655 ) ( IS-CRATE ?auto_64651 ) ( not ( = ?auto_64647 ?auto_64655 ) ) ( not ( = ?auto_64648 ?auto_64655 ) ) ( not ( = ?auto_64657 ?auto_64655 ) ) ( not ( = ?auto_64651 ?auto_64655 ) ) ( not ( = ?auto_64650 ?auto_64655 ) ) ( AVAILABLE ?auto_64653 ) ( IN ?auto_64651 ?auto_64654 ) )
    :subtasks
    ( ( !UNLOAD ?auto_64653 ?auto_64651 ?auto_64654 ?auto_64659 )
      ( MAKE-ON ?auto_64647 ?auto_64648 )
      ( MAKE-ON-VERIFY ?auto_64647 ?auto_64648 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_64660 - SURFACE
      ?auto_64661 - SURFACE
    )
    :vars
    (
      ?auto_64665 - HOIST
      ?auto_64671 - PLACE
      ?auto_64669 - PLACE
      ?auto_64666 - HOIST
      ?auto_64672 - SURFACE
      ?auto_64662 - SURFACE
      ?auto_64667 - PLACE
      ?auto_64663 - HOIST
      ?auto_64664 - SURFACE
      ?auto_64668 - SURFACE
      ?auto_64670 - TRUCK
      ?auto_64673 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_64665 ?auto_64671 ) ( IS-CRATE ?auto_64660 ) ( not ( = ?auto_64660 ?auto_64661 ) ) ( not ( = ?auto_64669 ?auto_64671 ) ) ( HOIST-AT ?auto_64666 ?auto_64669 ) ( not ( = ?auto_64665 ?auto_64666 ) ) ( AVAILABLE ?auto_64666 ) ( SURFACE-AT ?auto_64660 ?auto_64669 ) ( ON ?auto_64660 ?auto_64672 ) ( CLEAR ?auto_64660 ) ( not ( = ?auto_64660 ?auto_64672 ) ) ( not ( = ?auto_64661 ?auto_64672 ) ) ( IS-CRATE ?auto_64661 ) ( not ( = ?auto_64660 ?auto_64662 ) ) ( not ( = ?auto_64661 ?auto_64662 ) ) ( not ( = ?auto_64672 ?auto_64662 ) ) ( not ( = ?auto_64667 ?auto_64671 ) ) ( not ( = ?auto_64669 ?auto_64667 ) ) ( HOIST-AT ?auto_64663 ?auto_64667 ) ( not ( = ?auto_64665 ?auto_64663 ) ) ( not ( = ?auto_64666 ?auto_64663 ) ) ( AVAILABLE ?auto_64663 ) ( SURFACE-AT ?auto_64661 ?auto_64667 ) ( ON ?auto_64661 ?auto_64664 ) ( CLEAR ?auto_64661 ) ( not ( = ?auto_64660 ?auto_64664 ) ) ( not ( = ?auto_64661 ?auto_64664 ) ) ( not ( = ?auto_64672 ?auto_64664 ) ) ( not ( = ?auto_64662 ?auto_64664 ) ) ( SURFACE-AT ?auto_64668 ?auto_64671 ) ( CLEAR ?auto_64668 ) ( IS-CRATE ?auto_64662 ) ( not ( = ?auto_64660 ?auto_64668 ) ) ( not ( = ?auto_64661 ?auto_64668 ) ) ( not ( = ?auto_64672 ?auto_64668 ) ) ( not ( = ?auto_64662 ?auto_64668 ) ) ( not ( = ?auto_64664 ?auto_64668 ) ) ( AVAILABLE ?auto_64665 ) ( IN ?auto_64662 ?auto_64670 ) ( TRUCK-AT ?auto_64670 ?auto_64673 ) ( not ( = ?auto_64673 ?auto_64671 ) ) ( not ( = ?auto_64669 ?auto_64673 ) ) ( not ( = ?auto_64667 ?auto_64673 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_64670 ?auto_64673 ?auto_64671 )
      ( MAKE-ON ?auto_64660 ?auto_64661 )
      ( MAKE-ON-VERIFY ?auto_64660 ?auto_64661 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_64674 - SURFACE
      ?auto_64675 - SURFACE
    )
    :vars
    (
      ?auto_64682 - HOIST
      ?auto_64681 - PLACE
      ?auto_64686 - PLACE
      ?auto_64684 - HOIST
      ?auto_64685 - SURFACE
      ?auto_64676 - SURFACE
      ?auto_64678 - PLACE
      ?auto_64683 - HOIST
      ?auto_64677 - SURFACE
      ?auto_64687 - SURFACE
      ?auto_64679 - TRUCK
      ?auto_64680 - PLACE
      ?auto_64688 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_64682 ?auto_64681 ) ( IS-CRATE ?auto_64674 ) ( not ( = ?auto_64674 ?auto_64675 ) ) ( not ( = ?auto_64686 ?auto_64681 ) ) ( HOIST-AT ?auto_64684 ?auto_64686 ) ( not ( = ?auto_64682 ?auto_64684 ) ) ( AVAILABLE ?auto_64684 ) ( SURFACE-AT ?auto_64674 ?auto_64686 ) ( ON ?auto_64674 ?auto_64685 ) ( CLEAR ?auto_64674 ) ( not ( = ?auto_64674 ?auto_64685 ) ) ( not ( = ?auto_64675 ?auto_64685 ) ) ( IS-CRATE ?auto_64675 ) ( not ( = ?auto_64674 ?auto_64676 ) ) ( not ( = ?auto_64675 ?auto_64676 ) ) ( not ( = ?auto_64685 ?auto_64676 ) ) ( not ( = ?auto_64678 ?auto_64681 ) ) ( not ( = ?auto_64686 ?auto_64678 ) ) ( HOIST-AT ?auto_64683 ?auto_64678 ) ( not ( = ?auto_64682 ?auto_64683 ) ) ( not ( = ?auto_64684 ?auto_64683 ) ) ( AVAILABLE ?auto_64683 ) ( SURFACE-AT ?auto_64675 ?auto_64678 ) ( ON ?auto_64675 ?auto_64677 ) ( CLEAR ?auto_64675 ) ( not ( = ?auto_64674 ?auto_64677 ) ) ( not ( = ?auto_64675 ?auto_64677 ) ) ( not ( = ?auto_64685 ?auto_64677 ) ) ( not ( = ?auto_64676 ?auto_64677 ) ) ( SURFACE-AT ?auto_64687 ?auto_64681 ) ( CLEAR ?auto_64687 ) ( IS-CRATE ?auto_64676 ) ( not ( = ?auto_64674 ?auto_64687 ) ) ( not ( = ?auto_64675 ?auto_64687 ) ) ( not ( = ?auto_64685 ?auto_64687 ) ) ( not ( = ?auto_64676 ?auto_64687 ) ) ( not ( = ?auto_64677 ?auto_64687 ) ) ( AVAILABLE ?auto_64682 ) ( TRUCK-AT ?auto_64679 ?auto_64680 ) ( not ( = ?auto_64680 ?auto_64681 ) ) ( not ( = ?auto_64686 ?auto_64680 ) ) ( not ( = ?auto_64678 ?auto_64680 ) ) ( HOIST-AT ?auto_64688 ?auto_64680 ) ( LIFTING ?auto_64688 ?auto_64676 ) ( not ( = ?auto_64682 ?auto_64688 ) ) ( not ( = ?auto_64684 ?auto_64688 ) ) ( not ( = ?auto_64683 ?auto_64688 ) ) )
    :subtasks
    ( ( !LOAD ?auto_64688 ?auto_64676 ?auto_64679 ?auto_64680 )
      ( MAKE-ON ?auto_64674 ?auto_64675 )
      ( MAKE-ON-VERIFY ?auto_64674 ?auto_64675 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_64689 - SURFACE
      ?auto_64690 - SURFACE
    )
    :vars
    (
      ?auto_64698 - HOIST
      ?auto_64696 - PLACE
      ?auto_64694 - PLACE
      ?auto_64691 - HOIST
      ?auto_64699 - SURFACE
      ?auto_64702 - SURFACE
      ?auto_64700 - PLACE
      ?auto_64697 - HOIST
      ?auto_64695 - SURFACE
      ?auto_64701 - SURFACE
      ?auto_64693 - TRUCK
      ?auto_64692 - PLACE
      ?auto_64703 - HOIST
      ?auto_64704 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_64698 ?auto_64696 ) ( IS-CRATE ?auto_64689 ) ( not ( = ?auto_64689 ?auto_64690 ) ) ( not ( = ?auto_64694 ?auto_64696 ) ) ( HOIST-AT ?auto_64691 ?auto_64694 ) ( not ( = ?auto_64698 ?auto_64691 ) ) ( AVAILABLE ?auto_64691 ) ( SURFACE-AT ?auto_64689 ?auto_64694 ) ( ON ?auto_64689 ?auto_64699 ) ( CLEAR ?auto_64689 ) ( not ( = ?auto_64689 ?auto_64699 ) ) ( not ( = ?auto_64690 ?auto_64699 ) ) ( IS-CRATE ?auto_64690 ) ( not ( = ?auto_64689 ?auto_64702 ) ) ( not ( = ?auto_64690 ?auto_64702 ) ) ( not ( = ?auto_64699 ?auto_64702 ) ) ( not ( = ?auto_64700 ?auto_64696 ) ) ( not ( = ?auto_64694 ?auto_64700 ) ) ( HOIST-AT ?auto_64697 ?auto_64700 ) ( not ( = ?auto_64698 ?auto_64697 ) ) ( not ( = ?auto_64691 ?auto_64697 ) ) ( AVAILABLE ?auto_64697 ) ( SURFACE-AT ?auto_64690 ?auto_64700 ) ( ON ?auto_64690 ?auto_64695 ) ( CLEAR ?auto_64690 ) ( not ( = ?auto_64689 ?auto_64695 ) ) ( not ( = ?auto_64690 ?auto_64695 ) ) ( not ( = ?auto_64699 ?auto_64695 ) ) ( not ( = ?auto_64702 ?auto_64695 ) ) ( SURFACE-AT ?auto_64701 ?auto_64696 ) ( CLEAR ?auto_64701 ) ( IS-CRATE ?auto_64702 ) ( not ( = ?auto_64689 ?auto_64701 ) ) ( not ( = ?auto_64690 ?auto_64701 ) ) ( not ( = ?auto_64699 ?auto_64701 ) ) ( not ( = ?auto_64702 ?auto_64701 ) ) ( not ( = ?auto_64695 ?auto_64701 ) ) ( AVAILABLE ?auto_64698 ) ( TRUCK-AT ?auto_64693 ?auto_64692 ) ( not ( = ?auto_64692 ?auto_64696 ) ) ( not ( = ?auto_64694 ?auto_64692 ) ) ( not ( = ?auto_64700 ?auto_64692 ) ) ( HOIST-AT ?auto_64703 ?auto_64692 ) ( not ( = ?auto_64698 ?auto_64703 ) ) ( not ( = ?auto_64691 ?auto_64703 ) ) ( not ( = ?auto_64697 ?auto_64703 ) ) ( AVAILABLE ?auto_64703 ) ( SURFACE-AT ?auto_64702 ?auto_64692 ) ( ON ?auto_64702 ?auto_64704 ) ( CLEAR ?auto_64702 ) ( not ( = ?auto_64689 ?auto_64704 ) ) ( not ( = ?auto_64690 ?auto_64704 ) ) ( not ( = ?auto_64699 ?auto_64704 ) ) ( not ( = ?auto_64702 ?auto_64704 ) ) ( not ( = ?auto_64695 ?auto_64704 ) ) ( not ( = ?auto_64701 ?auto_64704 ) ) )
    :subtasks
    ( ( !LIFT ?auto_64703 ?auto_64702 ?auto_64704 ?auto_64692 )
      ( MAKE-ON ?auto_64689 ?auto_64690 )
      ( MAKE-ON-VERIFY ?auto_64689 ?auto_64690 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_64705 - SURFACE
      ?auto_64706 - SURFACE
    )
    :vars
    (
      ?auto_64711 - HOIST
      ?auto_64717 - PLACE
      ?auto_64710 - PLACE
      ?auto_64709 - HOIST
      ?auto_64707 - SURFACE
      ?auto_64713 - SURFACE
      ?auto_64715 - PLACE
      ?auto_64716 - HOIST
      ?auto_64719 - SURFACE
      ?auto_64714 - SURFACE
      ?auto_64708 - PLACE
      ?auto_64712 - HOIST
      ?auto_64720 - SURFACE
      ?auto_64718 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_64711 ?auto_64717 ) ( IS-CRATE ?auto_64705 ) ( not ( = ?auto_64705 ?auto_64706 ) ) ( not ( = ?auto_64710 ?auto_64717 ) ) ( HOIST-AT ?auto_64709 ?auto_64710 ) ( not ( = ?auto_64711 ?auto_64709 ) ) ( AVAILABLE ?auto_64709 ) ( SURFACE-AT ?auto_64705 ?auto_64710 ) ( ON ?auto_64705 ?auto_64707 ) ( CLEAR ?auto_64705 ) ( not ( = ?auto_64705 ?auto_64707 ) ) ( not ( = ?auto_64706 ?auto_64707 ) ) ( IS-CRATE ?auto_64706 ) ( not ( = ?auto_64705 ?auto_64713 ) ) ( not ( = ?auto_64706 ?auto_64713 ) ) ( not ( = ?auto_64707 ?auto_64713 ) ) ( not ( = ?auto_64715 ?auto_64717 ) ) ( not ( = ?auto_64710 ?auto_64715 ) ) ( HOIST-AT ?auto_64716 ?auto_64715 ) ( not ( = ?auto_64711 ?auto_64716 ) ) ( not ( = ?auto_64709 ?auto_64716 ) ) ( AVAILABLE ?auto_64716 ) ( SURFACE-AT ?auto_64706 ?auto_64715 ) ( ON ?auto_64706 ?auto_64719 ) ( CLEAR ?auto_64706 ) ( not ( = ?auto_64705 ?auto_64719 ) ) ( not ( = ?auto_64706 ?auto_64719 ) ) ( not ( = ?auto_64707 ?auto_64719 ) ) ( not ( = ?auto_64713 ?auto_64719 ) ) ( SURFACE-AT ?auto_64714 ?auto_64717 ) ( CLEAR ?auto_64714 ) ( IS-CRATE ?auto_64713 ) ( not ( = ?auto_64705 ?auto_64714 ) ) ( not ( = ?auto_64706 ?auto_64714 ) ) ( not ( = ?auto_64707 ?auto_64714 ) ) ( not ( = ?auto_64713 ?auto_64714 ) ) ( not ( = ?auto_64719 ?auto_64714 ) ) ( AVAILABLE ?auto_64711 ) ( not ( = ?auto_64708 ?auto_64717 ) ) ( not ( = ?auto_64710 ?auto_64708 ) ) ( not ( = ?auto_64715 ?auto_64708 ) ) ( HOIST-AT ?auto_64712 ?auto_64708 ) ( not ( = ?auto_64711 ?auto_64712 ) ) ( not ( = ?auto_64709 ?auto_64712 ) ) ( not ( = ?auto_64716 ?auto_64712 ) ) ( AVAILABLE ?auto_64712 ) ( SURFACE-AT ?auto_64713 ?auto_64708 ) ( ON ?auto_64713 ?auto_64720 ) ( CLEAR ?auto_64713 ) ( not ( = ?auto_64705 ?auto_64720 ) ) ( not ( = ?auto_64706 ?auto_64720 ) ) ( not ( = ?auto_64707 ?auto_64720 ) ) ( not ( = ?auto_64713 ?auto_64720 ) ) ( not ( = ?auto_64719 ?auto_64720 ) ) ( not ( = ?auto_64714 ?auto_64720 ) ) ( TRUCK-AT ?auto_64718 ?auto_64717 ) )
    :subtasks
    ( ( !DRIVE ?auto_64718 ?auto_64717 ?auto_64708 )
      ( MAKE-ON ?auto_64705 ?auto_64706 )
      ( MAKE-ON-VERIFY ?auto_64705 ?auto_64706 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_64721 - SURFACE
      ?auto_64722 - SURFACE
    )
    :vars
    (
      ?auto_64727 - HOIST
      ?auto_64732 - PLACE
      ?auto_64724 - PLACE
      ?auto_64726 - HOIST
      ?auto_64736 - SURFACE
      ?auto_64728 - SURFACE
      ?auto_64735 - PLACE
      ?auto_64729 - HOIST
      ?auto_64730 - SURFACE
      ?auto_64731 - SURFACE
      ?auto_64725 - PLACE
      ?auto_64734 - HOIST
      ?auto_64733 - SURFACE
      ?auto_64723 - TRUCK
      ?auto_64737 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_64727 ?auto_64732 ) ( IS-CRATE ?auto_64721 ) ( not ( = ?auto_64721 ?auto_64722 ) ) ( not ( = ?auto_64724 ?auto_64732 ) ) ( HOIST-AT ?auto_64726 ?auto_64724 ) ( not ( = ?auto_64727 ?auto_64726 ) ) ( AVAILABLE ?auto_64726 ) ( SURFACE-AT ?auto_64721 ?auto_64724 ) ( ON ?auto_64721 ?auto_64736 ) ( CLEAR ?auto_64721 ) ( not ( = ?auto_64721 ?auto_64736 ) ) ( not ( = ?auto_64722 ?auto_64736 ) ) ( IS-CRATE ?auto_64722 ) ( not ( = ?auto_64721 ?auto_64728 ) ) ( not ( = ?auto_64722 ?auto_64728 ) ) ( not ( = ?auto_64736 ?auto_64728 ) ) ( not ( = ?auto_64735 ?auto_64732 ) ) ( not ( = ?auto_64724 ?auto_64735 ) ) ( HOIST-AT ?auto_64729 ?auto_64735 ) ( not ( = ?auto_64727 ?auto_64729 ) ) ( not ( = ?auto_64726 ?auto_64729 ) ) ( AVAILABLE ?auto_64729 ) ( SURFACE-AT ?auto_64722 ?auto_64735 ) ( ON ?auto_64722 ?auto_64730 ) ( CLEAR ?auto_64722 ) ( not ( = ?auto_64721 ?auto_64730 ) ) ( not ( = ?auto_64722 ?auto_64730 ) ) ( not ( = ?auto_64736 ?auto_64730 ) ) ( not ( = ?auto_64728 ?auto_64730 ) ) ( IS-CRATE ?auto_64728 ) ( not ( = ?auto_64721 ?auto_64731 ) ) ( not ( = ?auto_64722 ?auto_64731 ) ) ( not ( = ?auto_64736 ?auto_64731 ) ) ( not ( = ?auto_64728 ?auto_64731 ) ) ( not ( = ?auto_64730 ?auto_64731 ) ) ( not ( = ?auto_64725 ?auto_64732 ) ) ( not ( = ?auto_64724 ?auto_64725 ) ) ( not ( = ?auto_64735 ?auto_64725 ) ) ( HOIST-AT ?auto_64734 ?auto_64725 ) ( not ( = ?auto_64727 ?auto_64734 ) ) ( not ( = ?auto_64726 ?auto_64734 ) ) ( not ( = ?auto_64729 ?auto_64734 ) ) ( AVAILABLE ?auto_64734 ) ( SURFACE-AT ?auto_64728 ?auto_64725 ) ( ON ?auto_64728 ?auto_64733 ) ( CLEAR ?auto_64728 ) ( not ( = ?auto_64721 ?auto_64733 ) ) ( not ( = ?auto_64722 ?auto_64733 ) ) ( not ( = ?auto_64736 ?auto_64733 ) ) ( not ( = ?auto_64728 ?auto_64733 ) ) ( not ( = ?auto_64730 ?auto_64733 ) ) ( not ( = ?auto_64731 ?auto_64733 ) ) ( TRUCK-AT ?auto_64723 ?auto_64732 ) ( SURFACE-AT ?auto_64737 ?auto_64732 ) ( CLEAR ?auto_64737 ) ( LIFTING ?auto_64727 ?auto_64731 ) ( IS-CRATE ?auto_64731 ) ( not ( = ?auto_64721 ?auto_64737 ) ) ( not ( = ?auto_64722 ?auto_64737 ) ) ( not ( = ?auto_64736 ?auto_64737 ) ) ( not ( = ?auto_64728 ?auto_64737 ) ) ( not ( = ?auto_64730 ?auto_64737 ) ) ( not ( = ?auto_64731 ?auto_64737 ) ) ( not ( = ?auto_64733 ?auto_64737 ) ) )
    :subtasks
    ( ( !DROP ?auto_64727 ?auto_64731 ?auto_64737 ?auto_64732 )
      ( MAKE-ON ?auto_64721 ?auto_64722 )
      ( MAKE-ON-VERIFY ?auto_64721 ?auto_64722 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_64738 - SURFACE
      ?auto_64739 - SURFACE
    )
    :vars
    (
      ?auto_64741 - HOIST
      ?auto_64748 - PLACE
      ?auto_64752 - PLACE
      ?auto_64742 - HOIST
      ?auto_64750 - SURFACE
      ?auto_64751 - SURFACE
      ?auto_64743 - PLACE
      ?auto_64749 - HOIST
      ?auto_64746 - SURFACE
      ?auto_64745 - SURFACE
      ?auto_64740 - PLACE
      ?auto_64744 - HOIST
      ?auto_64754 - SURFACE
      ?auto_64747 - TRUCK
      ?auto_64753 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_64741 ?auto_64748 ) ( IS-CRATE ?auto_64738 ) ( not ( = ?auto_64738 ?auto_64739 ) ) ( not ( = ?auto_64752 ?auto_64748 ) ) ( HOIST-AT ?auto_64742 ?auto_64752 ) ( not ( = ?auto_64741 ?auto_64742 ) ) ( AVAILABLE ?auto_64742 ) ( SURFACE-AT ?auto_64738 ?auto_64752 ) ( ON ?auto_64738 ?auto_64750 ) ( CLEAR ?auto_64738 ) ( not ( = ?auto_64738 ?auto_64750 ) ) ( not ( = ?auto_64739 ?auto_64750 ) ) ( IS-CRATE ?auto_64739 ) ( not ( = ?auto_64738 ?auto_64751 ) ) ( not ( = ?auto_64739 ?auto_64751 ) ) ( not ( = ?auto_64750 ?auto_64751 ) ) ( not ( = ?auto_64743 ?auto_64748 ) ) ( not ( = ?auto_64752 ?auto_64743 ) ) ( HOIST-AT ?auto_64749 ?auto_64743 ) ( not ( = ?auto_64741 ?auto_64749 ) ) ( not ( = ?auto_64742 ?auto_64749 ) ) ( AVAILABLE ?auto_64749 ) ( SURFACE-AT ?auto_64739 ?auto_64743 ) ( ON ?auto_64739 ?auto_64746 ) ( CLEAR ?auto_64739 ) ( not ( = ?auto_64738 ?auto_64746 ) ) ( not ( = ?auto_64739 ?auto_64746 ) ) ( not ( = ?auto_64750 ?auto_64746 ) ) ( not ( = ?auto_64751 ?auto_64746 ) ) ( IS-CRATE ?auto_64751 ) ( not ( = ?auto_64738 ?auto_64745 ) ) ( not ( = ?auto_64739 ?auto_64745 ) ) ( not ( = ?auto_64750 ?auto_64745 ) ) ( not ( = ?auto_64751 ?auto_64745 ) ) ( not ( = ?auto_64746 ?auto_64745 ) ) ( not ( = ?auto_64740 ?auto_64748 ) ) ( not ( = ?auto_64752 ?auto_64740 ) ) ( not ( = ?auto_64743 ?auto_64740 ) ) ( HOIST-AT ?auto_64744 ?auto_64740 ) ( not ( = ?auto_64741 ?auto_64744 ) ) ( not ( = ?auto_64742 ?auto_64744 ) ) ( not ( = ?auto_64749 ?auto_64744 ) ) ( AVAILABLE ?auto_64744 ) ( SURFACE-AT ?auto_64751 ?auto_64740 ) ( ON ?auto_64751 ?auto_64754 ) ( CLEAR ?auto_64751 ) ( not ( = ?auto_64738 ?auto_64754 ) ) ( not ( = ?auto_64739 ?auto_64754 ) ) ( not ( = ?auto_64750 ?auto_64754 ) ) ( not ( = ?auto_64751 ?auto_64754 ) ) ( not ( = ?auto_64746 ?auto_64754 ) ) ( not ( = ?auto_64745 ?auto_64754 ) ) ( TRUCK-AT ?auto_64747 ?auto_64748 ) ( SURFACE-AT ?auto_64753 ?auto_64748 ) ( CLEAR ?auto_64753 ) ( IS-CRATE ?auto_64745 ) ( not ( = ?auto_64738 ?auto_64753 ) ) ( not ( = ?auto_64739 ?auto_64753 ) ) ( not ( = ?auto_64750 ?auto_64753 ) ) ( not ( = ?auto_64751 ?auto_64753 ) ) ( not ( = ?auto_64746 ?auto_64753 ) ) ( not ( = ?auto_64745 ?auto_64753 ) ) ( not ( = ?auto_64754 ?auto_64753 ) ) ( AVAILABLE ?auto_64741 ) ( IN ?auto_64745 ?auto_64747 ) )
    :subtasks
    ( ( !UNLOAD ?auto_64741 ?auto_64745 ?auto_64747 ?auto_64748 )
      ( MAKE-ON ?auto_64738 ?auto_64739 )
      ( MAKE-ON-VERIFY ?auto_64738 ?auto_64739 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_64755 - SURFACE
      ?auto_64756 - SURFACE
    )
    :vars
    (
      ?auto_64769 - HOIST
      ?auto_64757 - PLACE
      ?auto_64760 - PLACE
      ?auto_64766 - HOIST
      ?auto_64763 - SURFACE
      ?auto_64764 - SURFACE
      ?auto_64765 - PLACE
      ?auto_64759 - HOIST
      ?auto_64770 - SURFACE
      ?auto_64761 - SURFACE
      ?auto_64758 - PLACE
      ?auto_64767 - HOIST
      ?auto_64762 - SURFACE
      ?auto_64771 - SURFACE
      ?auto_64768 - TRUCK
      ?auto_64772 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_64769 ?auto_64757 ) ( IS-CRATE ?auto_64755 ) ( not ( = ?auto_64755 ?auto_64756 ) ) ( not ( = ?auto_64760 ?auto_64757 ) ) ( HOIST-AT ?auto_64766 ?auto_64760 ) ( not ( = ?auto_64769 ?auto_64766 ) ) ( AVAILABLE ?auto_64766 ) ( SURFACE-AT ?auto_64755 ?auto_64760 ) ( ON ?auto_64755 ?auto_64763 ) ( CLEAR ?auto_64755 ) ( not ( = ?auto_64755 ?auto_64763 ) ) ( not ( = ?auto_64756 ?auto_64763 ) ) ( IS-CRATE ?auto_64756 ) ( not ( = ?auto_64755 ?auto_64764 ) ) ( not ( = ?auto_64756 ?auto_64764 ) ) ( not ( = ?auto_64763 ?auto_64764 ) ) ( not ( = ?auto_64765 ?auto_64757 ) ) ( not ( = ?auto_64760 ?auto_64765 ) ) ( HOIST-AT ?auto_64759 ?auto_64765 ) ( not ( = ?auto_64769 ?auto_64759 ) ) ( not ( = ?auto_64766 ?auto_64759 ) ) ( AVAILABLE ?auto_64759 ) ( SURFACE-AT ?auto_64756 ?auto_64765 ) ( ON ?auto_64756 ?auto_64770 ) ( CLEAR ?auto_64756 ) ( not ( = ?auto_64755 ?auto_64770 ) ) ( not ( = ?auto_64756 ?auto_64770 ) ) ( not ( = ?auto_64763 ?auto_64770 ) ) ( not ( = ?auto_64764 ?auto_64770 ) ) ( IS-CRATE ?auto_64764 ) ( not ( = ?auto_64755 ?auto_64761 ) ) ( not ( = ?auto_64756 ?auto_64761 ) ) ( not ( = ?auto_64763 ?auto_64761 ) ) ( not ( = ?auto_64764 ?auto_64761 ) ) ( not ( = ?auto_64770 ?auto_64761 ) ) ( not ( = ?auto_64758 ?auto_64757 ) ) ( not ( = ?auto_64760 ?auto_64758 ) ) ( not ( = ?auto_64765 ?auto_64758 ) ) ( HOIST-AT ?auto_64767 ?auto_64758 ) ( not ( = ?auto_64769 ?auto_64767 ) ) ( not ( = ?auto_64766 ?auto_64767 ) ) ( not ( = ?auto_64759 ?auto_64767 ) ) ( AVAILABLE ?auto_64767 ) ( SURFACE-AT ?auto_64764 ?auto_64758 ) ( ON ?auto_64764 ?auto_64762 ) ( CLEAR ?auto_64764 ) ( not ( = ?auto_64755 ?auto_64762 ) ) ( not ( = ?auto_64756 ?auto_64762 ) ) ( not ( = ?auto_64763 ?auto_64762 ) ) ( not ( = ?auto_64764 ?auto_64762 ) ) ( not ( = ?auto_64770 ?auto_64762 ) ) ( not ( = ?auto_64761 ?auto_64762 ) ) ( SURFACE-AT ?auto_64771 ?auto_64757 ) ( CLEAR ?auto_64771 ) ( IS-CRATE ?auto_64761 ) ( not ( = ?auto_64755 ?auto_64771 ) ) ( not ( = ?auto_64756 ?auto_64771 ) ) ( not ( = ?auto_64763 ?auto_64771 ) ) ( not ( = ?auto_64764 ?auto_64771 ) ) ( not ( = ?auto_64770 ?auto_64771 ) ) ( not ( = ?auto_64761 ?auto_64771 ) ) ( not ( = ?auto_64762 ?auto_64771 ) ) ( AVAILABLE ?auto_64769 ) ( IN ?auto_64761 ?auto_64768 ) ( TRUCK-AT ?auto_64768 ?auto_64772 ) ( not ( = ?auto_64772 ?auto_64757 ) ) ( not ( = ?auto_64760 ?auto_64772 ) ) ( not ( = ?auto_64765 ?auto_64772 ) ) ( not ( = ?auto_64758 ?auto_64772 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_64768 ?auto_64772 ?auto_64757 )
      ( MAKE-ON ?auto_64755 ?auto_64756 )
      ( MAKE-ON-VERIFY ?auto_64755 ?auto_64756 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_64773 - SURFACE
      ?auto_64774 - SURFACE
    )
    :vars
    (
      ?auto_64783 - HOIST
      ?auto_64778 - PLACE
      ?auto_64780 - PLACE
      ?auto_64776 - HOIST
      ?auto_64781 - SURFACE
      ?auto_64775 - SURFACE
      ?auto_64782 - PLACE
      ?auto_64785 - HOIST
      ?auto_64788 - SURFACE
      ?auto_64777 - SURFACE
      ?auto_64779 - PLACE
      ?auto_64786 - HOIST
      ?auto_64784 - SURFACE
      ?auto_64789 - SURFACE
      ?auto_64787 - TRUCK
      ?auto_64790 - PLACE
      ?auto_64791 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_64783 ?auto_64778 ) ( IS-CRATE ?auto_64773 ) ( not ( = ?auto_64773 ?auto_64774 ) ) ( not ( = ?auto_64780 ?auto_64778 ) ) ( HOIST-AT ?auto_64776 ?auto_64780 ) ( not ( = ?auto_64783 ?auto_64776 ) ) ( AVAILABLE ?auto_64776 ) ( SURFACE-AT ?auto_64773 ?auto_64780 ) ( ON ?auto_64773 ?auto_64781 ) ( CLEAR ?auto_64773 ) ( not ( = ?auto_64773 ?auto_64781 ) ) ( not ( = ?auto_64774 ?auto_64781 ) ) ( IS-CRATE ?auto_64774 ) ( not ( = ?auto_64773 ?auto_64775 ) ) ( not ( = ?auto_64774 ?auto_64775 ) ) ( not ( = ?auto_64781 ?auto_64775 ) ) ( not ( = ?auto_64782 ?auto_64778 ) ) ( not ( = ?auto_64780 ?auto_64782 ) ) ( HOIST-AT ?auto_64785 ?auto_64782 ) ( not ( = ?auto_64783 ?auto_64785 ) ) ( not ( = ?auto_64776 ?auto_64785 ) ) ( AVAILABLE ?auto_64785 ) ( SURFACE-AT ?auto_64774 ?auto_64782 ) ( ON ?auto_64774 ?auto_64788 ) ( CLEAR ?auto_64774 ) ( not ( = ?auto_64773 ?auto_64788 ) ) ( not ( = ?auto_64774 ?auto_64788 ) ) ( not ( = ?auto_64781 ?auto_64788 ) ) ( not ( = ?auto_64775 ?auto_64788 ) ) ( IS-CRATE ?auto_64775 ) ( not ( = ?auto_64773 ?auto_64777 ) ) ( not ( = ?auto_64774 ?auto_64777 ) ) ( not ( = ?auto_64781 ?auto_64777 ) ) ( not ( = ?auto_64775 ?auto_64777 ) ) ( not ( = ?auto_64788 ?auto_64777 ) ) ( not ( = ?auto_64779 ?auto_64778 ) ) ( not ( = ?auto_64780 ?auto_64779 ) ) ( not ( = ?auto_64782 ?auto_64779 ) ) ( HOIST-AT ?auto_64786 ?auto_64779 ) ( not ( = ?auto_64783 ?auto_64786 ) ) ( not ( = ?auto_64776 ?auto_64786 ) ) ( not ( = ?auto_64785 ?auto_64786 ) ) ( AVAILABLE ?auto_64786 ) ( SURFACE-AT ?auto_64775 ?auto_64779 ) ( ON ?auto_64775 ?auto_64784 ) ( CLEAR ?auto_64775 ) ( not ( = ?auto_64773 ?auto_64784 ) ) ( not ( = ?auto_64774 ?auto_64784 ) ) ( not ( = ?auto_64781 ?auto_64784 ) ) ( not ( = ?auto_64775 ?auto_64784 ) ) ( not ( = ?auto_64788 ?auto_64784 ) ) ( not ( = ?auto_64777 ?auto_64784 ) ) ( SURFACE-AT ?auto_64789 ?auto_64778 ) ( CLEAR ?auto_64789 ) ( IS-CRATE ?auto_64777 ) ( not ( = ?auto_64773 ?auto_64789 ) ) ( not ( = ?auto_64774 ?auto_64789 ) ) ( not ( = ?auto_64781 ?auto_64789 ) ) ( not ( = ?auto_64775 ?auto_64789 ) ) ( not ( = ?auto_64788 ?auto_64789 ) ) ( not ( = ?auto_64777 ?auto_64789 ) ) ( not ( = ?auto_64784 ?auto_64789 ) ) ( AVAILABLE ?auto_64783 ) ( TRUCK-AT ?auto_64787 ?auto_64790 ) ( not ( = ?auto_64790 ?auto_64778 ) ) ( not ( = ?auto_64780 ?auto_64790 ) ) ( not ( = ?auto_64782 ?auto_64790 ) ) ( not ( = ?auto_64779 ?auto_64790 ) ) ( HOIST-AT ?auto_64791 ?auto_64790 ) ( LIFTING ?auto_64791 ?auto_64777 ) ( not ( = ?auto_64783 ?auto_64791 ) ) ( not ( = ?auto_64776 ?auto_64791 ) ) ( not ( = ?auto_64785 ?auto_64791 ) ) ( not ( = ?auto_64786 ?auto_64791 ) ) )
    :subtasks
    ( ( !LOAD ?auto_64791 ?auto_64777 ?auto_64787 ?auto_64790 )
      ( MAKE-ON ?auto_64773 ?auto_64774 )
      ( MAKE-ON-VERIFY ?auto_64773 ?auto_64774 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_64792 - SURFACE
      ?auto_64793 - SURFACE
    )
    :vars
    (
      ?auto_64794 - HOIST
      ?auto_64796 - PLACE
      ?auto_64804 - PLACE
      ?auto_64801 - HOIST
      ?auto_64797 - SURFACE
      ?auto_64807 - SURFACE
      ?auto_64799 - PLACE
      ?auto_64808 - HOIST
      ?auto_64803 - SURFACE
      ?auto_64806 - SURFACE
      ?auto_64795 - PLACE
      ?auto_64802 - HOIST
      ?auto_64800 - SURFACE
      ?auto_64809 - SURFACE
      ?auto_64805 - TRUCK
      ?auto_64798 - PLACE
      ?auto_64810 - HOIST
      ?auto_64811 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_64794 ?auto_64796 ) ( IS-CRATE ?auto_64792 ) ( not ( = ?auto_64792 ?auto_64793 ) ) ( not ( = ?auto_64804 ?auto_64796 ) ) ( HOIST-AT ?auto_64801 ?auto_64804 ) ( not ( = ?auto_64794 ?auto_64801 ) ) ( AVAILABLE ?auto_64801 ) ( SURFACE-AT ?auto_64792 ?auto_64804 ) ( ON ?auto_64792 ?auto_64797 ) ( CLEAR ?auto_64792 ) ( not ( = ?auto_64792 ?auto_64797 ) ) ( not ( = ?auto_64793 ?auto_64797 ) ) ( IS-CRATE ?auto_64793 ) ( not ( = ?auto_64792 ?auto_64807 ) ) ( not ( = ?auto_64793 ?auto_64807 ) ) ( not ( = ?auto_64797 ?auto_64807 ) ) ( not ( = ?auto_64799 ?auto_64796 ) ) ( not ( = ?auto_64804 ?auto_64799 ) ) ( HOIST-AT ?auto_64808 ?auto_64799 ) ( not ( = ?auto_64794 ?auto_64808 ) ) ( not ( = ?auto_64801 ?auto_64808 ) ) ( AVAILABLE ?auto_64808 ) ( SURFACE-AT ?auto_64793 ?auto_64799 ) ( ON ?auto_64793 ?auto_64803 ) ( CLEAR ?auto_64793 ) ( not ( = ?auto_64792 ?auto_64803 ) ) ( not ( = ?auto_64793 ?auto_64803 ) ) ( not ( = ?auto_64797 ?auto_64803 ) ) ( not ( = ?auto_64807 ?auto_64803 ) ) ( IS-CRATE ?auto_64807 ) ( not ( = ?auto_64792 ?auto_64806 ) ) ( not ( = ?auto_64793 ?auto_64806 ) ) ( not ( = ?auto_64797 ?auto_64806 ) ) ( not ( = ?auto_64807 ?auto_64806 ) ) ( not ( = ?auto_64803 ?auto_64806 ) ) ( not ( = ?auto_64795 ?auto_64796 ) ) ( not ( = ?auto_64804 ?auto_64795 ) ) ( not ( = ?auto_64799 ?auto_64795 ) ) ( HOIST-AT ?auto_64802 ?auto_64795 ) ( not ( = ?auto_64794 ?auto_64802 ) ) ( not ( = ?auto_64801 ?auto_64802 ) ) ( not ( = ?auto_64808 ?auto_64802 ) ) ( AVAILABLE ?auto_64802 ) ( SURFACE-AT ?auto_64807 ?auto_64795 ) ( ON ?auto_64807 ?auto_64800 ) ( CLEAR ?auto_64807 ) ( not ( = ?auto_64792 ?auto_64800 ) ) ( not ( = ?auto_64793 ?auto_64800 ) ) ( not ( = ?auto_64797 ?auto_64800 ) ) ( not ( = ?auto_64807 ?auto_64800 ) ) ( not ( = ?auto_64803 ?auto_64800 ) ) ( not ( = ?auto_64806 ?auto_64800 ) ) ( SURFACE-AT ?auto_64809 ?auto_64796 ) ( CLEAR ?auto_64809 ) ( IS-CRATE ?auto_64806 ) ( not ( = ?auto_64792 ?auto_64809 ) ) ( not ( = ?auto_64793 ?auto_64809 ) ) ( not ( = ?auto_64797 ?auto_64809 ) ) ( not ( = ?auto_64807 ?auto_64809 ) ) ( not ( = ?auto_64803 ?auto_64809 ) ) ( not ( = ?auto_64806 ?auto_64809 ) ) ( not ( = ?auto_64800 ?auto_64809 ) ) ( AVAILABLE ?auto_64794 ) ( TRUCK-AT ?auto_64805 ?auto_64798 ) ( not ( = ?auto_64798 ?auto_64796 ) ) ( not ( = ?auto_64804 ?auto_64798 ) ) ( not ( = ?auto_64799 ?auto_64798 ) ) ( not ( = ?auto_64795 ?auto_64798 ) ) ( HOIST-AT ?auto_64810 ?auto_64798 ) ( not ( = ?auto_64794 ?auto_64810 ) ) ( not ( = ?auto_64801 ?auto_64810 ) ) ( not ( = ?auto_64808 ?auto_64810 ) ) ( not ( = ?auto_64802 ?auto_64810 ) ) ( AVAILABLE ?auto_64810 ) ( SURFACE-AT ?auto_64806 ?auto_64798 ) ( ON ?auto_64806 ?auto_64811 ) ( CLEAR ?auto_64806 ) ( not ( = ?auto_64792 ?auto_64811 ) ) ( not ( = ?auto_64793 ?auto_64811 ) ) ( not ( = ?auto_64797 ?auto_64811 ) ) ( not ( = ?auto_64807 ?auto_64811 ) ) ( not ( = ?auto_64803 ?auto_64811 ) ) ( not ( = ?auto_64806 ?auto_64811 ) ) ( not ( = ?auto_64800 ?auto_64811 ) ) ( not ( = ?auto_64809 ?auto_64811 ) ) )
    :subtasks
    ( ( !LIFT ?auto_64810 ?auto_64806 ?auto_64811 ?auto_64798 )
      ( MAKE-ON ?auto_64792 ?auto_64793 )
      ( MAKE-ON-VERIFY ?auto_64792 ?auto_64793 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_64812 - SURFACE
      ?auto_64813 - SURFACE
    )
    :vars
    (
      ?auto_64828 - HOIST
      ?auto_64829 - PLACE
      ?auto_64823 - PLACE
      ?auto_64831 - HOIST
      ?auto_64824 - SURFACE
      ?auto_64818 - SURFACE
      ?auto_64814 - PLACE
      ?auto_64816 - HOIST
      ?auto_64815 - SURFACE
      ?auto_64822 - SURFACE
      ?auto_64826 - PLACE
      ?auto_64820 - HOIST
      ?auto_64830 - SURFACE
      ?auto_64827 - SURFACE
      ?auto_64825 - PLACE
      ?auto_64821 - HOIST
      ?auto_64819 - SURFACE
      ?auto_64817 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_64828 ?auto_64829 ) ( IS-CRATE ?auto_64812 ) ( not ( = ?auto_64812 ?auto_64813 ) ) ( not ( = ?auto_64823 ?auto_64829 ) ) ( HOIST-AT ?auto_64831 ?auto_64823 ) ( not ( = ?auto_64828 ?auto_64831 ) ) ( AVAILABLE ?auto_64831 ) ( SURFACE-AT ?auto_64812 ?auto_64823 ) ( ON ?auto_64812 ?auto_64824 ) ( CLEAR ?auto_64812 ) ( not ( = ?auto_64812 ?auto_64824 ) ) ( not ( = ?auto_64813 ?auto_64824 ) ) ( IS-CRATE ?auto_64813 ) ( not ( = ?auto_64812 ?auto_64818 ) ) ( not ( = ?auto_64813 ?auto_64818 ) ) ( not ( = ?auto_64824 ?auto_64818 ) ) ( not ( = ?auto_64814 ?auto_64829 ) ) ( not ( = ?auto_64823 ?auto_64814 ) ) ( HOIST-AT ?auto_64816 ?auto_64814 ) ( not ( = ?auto_64828 ?auto_64816 ) ) ( not ( = ?auto_64831 ?auto_64816 ) ) ( AVAILABLE ?auto_64816 ) ( SURFACE-AT ?auto_64813 ?auto_64814 ) ( ON ?auto_64813 ?auto_64815 ) ( CLEAR ?auto_64813 ) ( not ( = ?auto_64812 ?auto_64815 ) ) ( not ( = ?auto_64813 ?auto_64815 ) ) ( not ( = ?auto_64824 ?auto_64815 ) ) ( not ( = ?auto_64818 ?auto_64815 ) ) ( IS-CRATE ?auto_64818 ) ( not ( = ?auto_64812 ?auto_64822 ) ) ( not ( = ?auto_64813 ?auto_64822 ) ) ( not ( = ?auto_64824 ?auto_64822 ) ) ( not ( = ?auto_64818 ?auto_64822 ) ) ( not ( = ?auto_64815 ?auto_64822 ) ) ( not ( = ?auto_64826 ?auto_64829 ) ) ( not ( = ?auto_64823 ?auto_64826 ) ) ( not ( = ?auto_64814 ?auto_64826 ) ) ( HOIST-AT ?auto_64820 ?auto_64826 ) ( not ( = ?auto_64828 ?auto_64820 ) ) ( not ( = ?auto_64831 ?auto_64820 ) ) ( not ( = ?auto_64816 ?auto_64820 ) ) ( AVAILABLE ?auto_64820 ) ( SURFACE-AT ?auto_64818 ?auto_64826 ) ( ON ?auto_64818 ?auto_64830 ) ( CLEAR ?auto_64818 ) ( not ( = ?auto_64812 ?auto_64830 ) ) ( not ( = ?auto_64813 ?auto_64830 ) ) ( not ( = ?auto_64824 ?auto_64830 ) ) ( not ( = ?auto_64818 ?auto_64830 ) ) ( not ( = ?auto_64815 ?auto_64830 ) ) ( not ( = ?auto_64822 ?auto_64830 ) ) ( SURFACE-AT ?auto_64827 ?auto_64829 ) ( CLEAR ?auto_64827 ) ( IS-CRATE ?auto_64822 ) ( not ( = ?auto_64812 ?auto_64827 ) ) ( not ( = ?auto_64813 ?auto_64827 ) ) ( not ( = ?auto_64824 ?auto_64827 ) ) ( not ( = ?auto_64818 ?auto_64827 ) ) ( not ( = ?auto_64815 ?auto_64827 ) ) ( not ( = ?auto_64822 ?auto_64827 ) ) ( not ( = ?auto_64830 ?auto_64827 ) ) ( AVAILABLE ?auto_64828 ) ( not ( = ?auto_64825 ?auto_64829 ) ) ( not ( = ?auto_64823 ?auto_64825 ) ) ( not ( = ?auto_64814 ?auto_64825 ) ) ( not ( = ?auto_64826 ?auto_64825 ) ) ( HOIST-AT ?auto_64821 ?auto_64825 ) ( not ( = ?auto_64828 ?auto_64821 ) ) ( not ( = ?auto_64831 ?auto_64821 ) ) ( not ( = ?auto_64816 ?auto_64821 ) ) ( not ( = ?auto_64820 ?auto_64821 ) ) ( AVAILABLE ?auto_64821 ) ( SURFACE-AT ?auto_64822 ?auto_64825 ) ( ON ?auto_64822 ?auto_64819 ) ( CLEAR ?auto_64822 ) ( not ( = ?auto_64812 ?auto_64819 ) ) ( not ( = ?auto_64813 ?auto_64819 ) ) ( not ( = ?auto_64824 ?auto_64819 ) ) ( not ( = ?auto_64818 ?auto_64819 ) ) ( not ( = ?auto_64815 ?auto_64819 ) ) ( not ( = ?auto_64822 ?auto_64819 ) ) ( not ( = ?auto_64830 ?auto_64819 ) ) ( not ( = ?auto_64827 ?auto_64819 ) ) ( TRUCK-AT ?auto_64817 ?auto_64829 ) )
    :subtasks
    ( ( !DRIVE ?auto_64817 ?auto_64829 ?auto_64825 )
      ( MAKE-ON ?auto_64812 ?auto_64813 )
      ( MAKE-ON-VERIFY ?auto_64812 ?auto_64813 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_64832 - SURFACE
      ?auto_64833 - SURFACE
    )
    :vars
    (
      ?auto_64843 - HOIST
      ?auto_64842 - PLACE
      ?auto_64850 - PLACE
      ?auto_64845 - HOIST
      ?auto_64851 - SURFACE
      ?auto_64846 - SURFACE
      ?auto_64839 - PLACE
      ?auto_64844 - HOIST
      ?auto_64841 - SURFACE
      ?auto_64837 - SURFACE
      ?auto_64849 - PLACE
      ?auto_64847 - HOIST
      ?auto_64835 - SURFACE
      ?auto_64848 - SURFACE
      ?auto_64834 - PLACE
      ?auto_64840 - HOIST
      ?auto_64838 - SURFACE
      ?auto_64836 - TRUCK
      ?auto_64852 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_64843 ?auto_64842 ) ( IS-CRATE ?auto_64832 ) ( not ( = ?auto_64832 ?auto_64833 ) ) ( not ( = ?auto_64850 ?auto_64842 ) ) ( HOIST-AT ?auto_64845 ?auto_64850 ) ( not ( = ?auto_64843 ?auto_64845 ) ) ( AVAILABLE ?auto_64845 ) ( SURFACE-AT ?auto_64832 ?auto_64850 ) ( ON ?auto_64832 ?auto_64851 ) ( CLEAR ?auto_64832 ) ( not ( = ?auto_64832 ?auto_64851 ) ) ( not ( = ?auto_64833 ?auto_64851 ) ) ( IS-CRATE ?auto_64833 ) ( not ( = ?auto_64832 ?auto_64846 ) ) ( not ( = ?auto_64833 ?auto_64846 ) ) ( not ( = ?auto_64851 ?auto_64846 ) ) ( not ( = ?auto_64839 ?auto_64842 ) ) ( not ( = ?auto_64850 ?auto_64839 ) ) ( HOIST-AT ?auto_64844 ?auto_64839 ) ( not ( = ?auto_64843 ?auto_64844 ) ) ( not ( = ?auto_64845 ?auto_64844 ) ) ( AVAILABLE ?auto_64844 ) ( SURFACE-AT ?auto_64833 ?auto_64839 ) ( ON ?auto_64833 ?auto_64841 ) ( CLEAR ?auto_64833 ) ( not ( = ?auto_64832 ?auto_64841 ) ) ( not ( = ?auto_64833 ?auto_64841 ) ) ( not ( = ?auto_64851 ?auto_64841 ) ) ( not ( = ?auto_64846 ?auto_64841 ) ) ( IS-CRATE ?auto_64846 ) ( not ( = ?auto_64832 ?auto_64837 ) ) ( not ( = ?auto_64833 ?auto_64837 ) ) ( not ( = ?auto_64851 ?auto_64837 ) ) ( not ( = ?auto_64846 ?auto_64837 ) ) ( not ( = ?auto_64841 ?auto_64837 ) ) ( not ( = ?auto_64849 ?auto_64842 ) ) ( not ( = ?auto_64850 ?auto_64849 ) ) ( not ( = ?auto_64839 ?auto_64849 ) ) ( HOIST-AT ?auto_64847 ?auto_64849 ) ( not ( = ?auto_64843 ?auto_64847 ) ) ( not ( = ?auto_64845 ?auto_64847 ) ) ( not ( = ?auto_64844 ?auto_64847 ) ) ( AVAILABLE ?auto_64847 ) ( SURFACE-AT ?auto_64846 ?auto_64849 ) ( ON ?auto_64846 ?auto_64835 ) ( CLEAR ?auto_64846 ) ( not ( = ?auto_64832 ?auto_64835 ) ) ( not ( = ?auto_64833 ?auto_64835 ) ) ( not ( = ?auto_64851 ?auto_64835 ) ) ( not ( = ?auto_64846 ?auto_64835 ) ) ( not ( = ?auto_64841 ?auto_64835 ) ) ( not ( = ?auto_64837 ?auto_64835 ) ) ( IS-CRATE ?auto_64837 ) ( not ( = ?auto_64832 ?auto_64848 ) ) ( not ( = ?auto_64833 ?auto_64848 ) ) ( not ( = ?auto_64851 ?auto_64848 ) ) ( not ( = ?auto_64846 ?auto_64848 ) ) ( not ( = ?auto_64841 ?auto_64848 ) ) ( not ( = ?auto_64837 ?auto_64848 ) ) ( not ( = ?auto_64835 ?auto_64848 ) ) ( not ( = ?auto_64834 ?auto_64842 ) ) ( not ( = ?auto_64850 ?auto_64834 ) ) ( not ( = ?auto_64839 ?auto_64834 ) ) ( not ( = ?auto_64849 ?auto_64834 ) ) ( HOIST-AT ?auto_64840 ?auto_64834 ) ( not ( = ?auto_64843 ?auto_64840 ) ) ( not ( = ?auto_64845 ?auto_64840 ) ) ( not ( = ?auto_64844 ?auto_64840 ) ) ( not ( = ?auto_64847 ?auto_64840 ) ) ( AVAILABLE ?auto_64840 ) ( SURFACE-AT ?auto_64837 ?auto_64834 ) ( ON ?auto_64837 ?auto_64838 ) ( CLEAR ?auto_64837 ) ( not ( = ?auto_64832 ?auto_64838 ) ) ( not ( = ?auto_64833 ?auto_64838 ) ) ( not ( = ?auto_64851 ?auto_64838 ) ) ( not ( = ?auto_64846 ?auto_64838 ) ) ( not ( = ?auto_64841 ?auto_64838 ) ) ( not ( = ?auto_64837 ?auto_64838 ) ) ( not ( = ?auto_64835 ?auto_64838 ) ) ( not ( = ?auto_64848 ?auto_64838 ) ) ( TRUCK-AT ?auto_64836 ?auto_64842 ) ( SURFACE-AT ?auto_64852 ?auto_64842 ) ( CLEAR ?auto_64852 ) ( LIFTING ?auto_64843 ?auto_64848 ) ( IS-CRATE ?auto_64848 ) ( not ( = ?auto_64832 ?auto_64852 ) ) ( not ( = ?auto_64833 ?auto_64852 ) ) ( not ( = ?auto_64851 ?auto_64852 ) ) ( not ( = ?auto_64846 ?auto_64852 ) ) ( not ( = ?auto_64841 ?auto_64852 ) ) ( not ( = ?auto_64837 ?auto_64852 ) ) ( not ( = ?auto_64835 ?auto_64852 ) ) ( not ( = ?auto_64848 ?auto_64852 ) ) ( not ( = ?auto_64838 ?auto_64852 ) ) )
    :subtasks
    ( ( !DROP ?auto_64843 ?auto_64848 ?auto_64852 ?auto_64842 )
      ( MAKE-ON ?auto_64832 ?auto_64833 )
      ( MAKE-ON-VERIFY ?auto_64832 ?auto_64833 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_64853 - SURFACE
      ?auto_64854 - SURFACE
    )
    :vars
    (
      ?auto_64865 - HOIST
      ?auto_64857 - PLACE
      ?auto_64864 - PLACE
      ?auto_64861 - HOIST
      ?auto_64859 - SURFACE
      ?auto_64866 - SURFACE
      ?auto_64872 - PLACE
      ?auto_64871 - HOIST
      ?auto_64862 - SURFACE
      ?auto_64863 - SURFACE
      ?auto_64855 - PLACE
      ?auto_64870 - HOIST
      ?auto_64868 - SURFACE
      ?auto_64869 - SURFACE
      ?auto_64860 - PLACE
      ?auto_64858 - HOIST
      ?auto_64873 - SURFACE
      ?auto_64867 - TRUCK
      ?auto_64856 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_64865 ?auto_64857 ) ( IS-CRATE ?auto_64853 ) ( not ( = ?auto_64853 ?auto_64854 ) ) ( not ( = ?auto_64864 ?auto_64857 ) ) ( HOIST-AT ?auto_64861 ?auto_64864 ) ( not ( = ?auto_64865 ?auto_64861 ) ) ( AVAILABLE ?auto_64861 ) ( SURFACE-AT ?auto_64853 ?auto_64864 ) ( ON ?auto_64853 ?auto_64859 ) ( CLEAR ?auto_64853 ) ( not ( = ?auto_64853 ?auto_64859 ) ) ( not ( = ?auto_64854 ?auto_64859 ) ) ( IS-CRATE ?auto_64854 ) ( not ( = ?auto_64853 ?auto_64866 ) ) ( not ( = ?auto_64854 ?auto_64866 ) ) ( not ( = ?auto_64859 ?auto_64866 ) ) ( not ( = ?auto_64872 ?auto_64857 ) ) ( not ( = ?auto_64864 ?auto_64872 ) ) ( HOIST-AT ?auto_64871 ?auto_64872 ) ( not ( = ?auto_64865 ?auto_64871 ) ) ( not ( = ?auto_64861 ?auto_64871 ) ) ( AVAILABLE ?auto_64871 ) ( SURFACE-AT ?auto_64854 ?auto_64872 ) ( ON ?auto_64854 ?auto_64862 ) ( CLEAR ?auto_64854 ) ( not ( = ?auto_64853 ?auto_64862 ) ) ( not ( = ?auto_64854 ?auto_64862 ) ) ( not ( = ?auto_64859 ?auto_64862 ) ) ( not ( = ?auto_64866 ?auto_64862 ) ) ( IS-CRATE ?auto_64866 ) ( not ( = ?auto_64853 ?auto_64863 ) ) ( not ( = ?auto_64854 ?auto_64863 ) ) ( not ( = ?auto_64859 ?auto_64863 ) ) ( not ( = ?auto_64866 ?auto_64863 ) ) ( not ( = ?auto_64862 ?auto_64863 ) ) ( not ( = ?auto_64855 ?auto_64857 ) ) ( not ( = ?auto_64864 ?auto_64855 ) ) ( not ( = ?auto_64872 ?auto_64855 ) ) ( HOIST-AT ?auto_64870 ?auto_64855 ) ( not ( = ?auto_64865 ?auto_64870 ) ) ( not ( = ?auto_64861 ?auto_64870 ) ) ( not ( = ?auto_64871 ?auto_64870 ) ) ( AVAILABLE ?auto_64870 ) ( SURFACE-AT ?auto_64866 ?auto_64855 ) ( ON ?auto_64866 ?auto_64868 ) ( CLEAR ?auto_64866 ) ( not ( = ?auto_64853 ?auto_64868 ) ) ( not ( = ?auto_64854 ?auto_64868 ) ) ( not ( = ?auto_64859 ?auto_64868 ) ) ( not ( = ?auto_64866 ?auto_64868 ) ) ( not ( = ?auto_64862 ?auto_64868 ) ) ( not ( = ?auto_64863 ?auto_64868 ) ) ( IS-CRATE ?auto_64863 ) ( not ( = ?auto_64853 ?auto_64869 ) ) ( not ( = ?auto_64854 ?auto_64869 ) ) ( not ( = ?auto_64859 ?auto_64869 ) ) ( not ( = ?auto_64866 ?auto_64869 ) ) ( not ( = ?auto_64862 ?auto_64869 ) ) ( not ( = ?auto_64863 ?auto_64869 ) ) ( not ( = ?auto_64868 ?auto_64869 ) ) ( not ( = ?auto_64860 ?auto_64857 ) ) ( not ( = ?auto_64864 ?auto_64860 ) ) ( not ( = ?auto_64872 ?auto_64860 ) ) ( not ( = ?auto_64855 ?auto_64860 ) ) ( HOIST-AT ?auto_64858 ?auto_64860 ) ( not ( = ?auto_64865 ?auto_64858 ) ) ( not ( = ?auto_64861 ?auto_64858 ) ) ( not ( = ?auto_64871 ?auto_64858 ) ) ( not ( = ?auto_64870 ?auto_64858 ) ) ( AVAILABLE ?auto_64858 ) ( SURFACE-AT ?auto_64863 ?auto_64860 ) ( ON ?auto_64863 ?auto_64873 ) ( CLEAR ?auto_64863 ) ( not ( = ?auto_64853 ?auto_64873 ) ) ( not ( = ?auto_64854 ?auto_64873 ) ) ( not ( = ?auto_64859 ?auto_64873 ) ) ( not ( = ?auto_64866 ?auto_64873 ) ) ( not ( = ?auto_64862 ?auto_64873 ) ) ( not ( = ?auto_64863 ?auto_64873 ) ) ( not ( = ?auto_64868 ?auto_64873 ) ) ( not ( = ?auto_64869 ?auto_64873 ) ) ( TRUCK-AT ?auto_64867 ?auto_64857 ) ( SURFACE-AT ?auto_64856 ?auto_64857 ) ( CLEAR ?auto_64856 ) ( IS-CRATE ?auto_64869 ) ( not ( = ?auto_64853 ?auto_64856 ) ) ( not ( = ?auto_64854 ?auto_64856 ) ) ( not ( = ?auto_64859 ?auto_64856 ) ) ( not ( = ?auto_64866 ?auto_64856 ) ) ( not ( = ?auto_64862 ?auto_64856 ) ) ( not ( = ?auto_64863 ?auto_64856 ) ) ( not ( = ?auto_64868 ?auto_64856 ) ) ( not ( = ?auto_64869 ?auto_64856 ) ) ( not ( = ?auto_64873 ?auto_64856 ) ) ( AVAILABLE ?auto_64865 ) ( IN ?auto_64869 ?auto_64867 ) )
    :subtasks
    ( ( !UNLOAD ?auto_64865 ?auto_64869 ?auto_64867 ?auto_64857 )
      ( MAKE-ON ?auto_64853 ?auto_64854 )
      ( MAKE-ON-VERIFY ?auto_64853 ?auto_64854 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_64874 - SURFACE
      ?auto_64875 - SURFACE
    )
    :vars
    (
      ?auto_64882 - HOIST
      ?auto_64890 - PLACE
      ?auto_64883 - PLACE
      ?auto_64884 - HOIST
      ?auto_64891 - SURFACE
      ?auto_64881 - SURFACE
      ?auto_64889 - PLACE
      ?auto_64878 - HOIST
      ?auto_64885 - SURFACE
      ?auto_64879 - SURFACE
      ?auto_64888 - PLACE
      ?auto_64893 - HOIST
      ?auto_64887 - SURFACE
      ?auto_64880 - SURFACE
      ?auto_64892 - PLACE
      ?auto_64876 - HOIST
      ?auto_64886 - SURFACE
      ?auto_64877 - SURFACE
      ?auto_64894 - TRUCK
      ?auto_64895 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_64882 ?auto_64890 ) ( IS-CRATE ?auto_64874 ) ( not ( = ?auto_64874 ?auto_64875 ) ) ( not ( = ?auto_64883 ?auto_64890 ) ) ( HOIST-AT ?auto_64884 ?auto_64883 ) ( not ( = ?auto_64882 ?auto_64884 ) ) ( AVAILABLE ?auto_64884 ) ( SURFACE-AT ?auto_64874 ?auto_64883 ) ( ON ?auto_64874 ?auto_64891 ) ( CLEAR ?auto_64874 ) ( not ( = ?auto_64874 ?auto_64891 ) ) ( not ( = ?auto_64875 ?auto_64891 ) ) ( IS-CRATE ?auto_64875 ) ( not ( = ?auto_64874 ?auto_64881 ) ) ( not ( = ?auto_64875 ?auto_64881 ) ) ( not ( = ?auto_64891 ?auto_64881 ) ) ( not ( = ?auto_64889 ?auto_64890 ) ) ( not ( = ?auto_64883 ?auto_64889 ) ) ( HOIST-AT ?auto_64878 ?auto_64889 ) ( not ( = ?auto_64882 ?auto_64878 ) ) ( not ( = ?auto_64884 ?auto_64878 ) ) ( AVAILABLE ?auto_64878 ) ( SURFACE-AT ?auto_64875 ?auto_64889 ) ( ON ?auto_64875 ?auto_64885 ) ( CLEAR ?auto_64875 ) ( not ( = ?auto_64874 ?auto_64885 ) ) ( not ( = ?auto_64875 ?auto_64885 ) ) ( not ( = ?auto_64891 ?auto_64885 ) ) ( not ( = ?auto_64881 ?auto_64885 ) ) ( IS-CRATE ?auto_64881 ) ( not ( = ?auto_64874 ?auto_64879 ) ) ( not ( = ?auto_64875 ?auto_64879 ) ) ( not ( = ?auto_64891 ?auto_64879 ) ) ( not ( = ?auto_64881 ?auto_64879 ) ) ( not ( = ?auto_64885 ?auto_64879 ) ) ( not ( = ?auto_64888 ?auto_64890 ) ) ( not ( = ?auto_64883 ?auto_64888 ) ) ( not ( = ?auto_64889 ?auto_64888 ) ) ( HOIST-AT ?auto_64893 ?auto_64888 ) ( not ( = ?auto_64882 ?auto_64893 ) ) ( not ( = ?auto_64884 ?auto_64893 ) ) ( not ( = ?auto_64878 ?auto_64893 ) ) ( AVAILABLE ?auto_64893 ) ( SURFACE-AT ?auto_64881 ?auto_64888 ) ( ON ?auto_64881 ?auto_64887 ) ( CLEAR ?auto_64881 ) ( not ( = ?auto_64874 ?auto_64887 ) ) ( not ( = ?auto_64875 ?auto_64887 ) ) ( not ( = ?auto_64891 ?auto_64887 ) ) ( not ( = ?auto_64881 ?auto_64887 ) ) ( not ( = ?auto_64885 ?auto_64887 ) ) ( not ( = ?auto_64879 ?auto_64887 ) ) ( IS-CRATE ?auto_64879 ) ( not ( = ?auto_64874 ?auto_64880 ) ) ( not ( = ?auto_64875 ?auto_64880 ) ) ( not ( = ?auto_64891 ?auto_64880 ) ) ( not ( = ?auto_64881 ?auto_64880 ) ) ( not ( = ?auto_64885 ?auto_64880 ) ) ( not ( = ?auto_64879 ?auto_64880 ) ) ( not ( = ?auto_64887 ?auto_64880 ) ) ( not ( = ?auto_64892 ?auto_64890 ) ) ( not ( = ?auto_64883 ?auto_64892 ) ) ( not ( = ?auto_64889 ?auto_64892 ) ) ( not ( = ?auto_64888 ?auto_64892 ) ) ( HOIST-AT ?auto_64876 ?auto_64892 ) ( not ( = ?auto_64882 ?auto_64876 ) ) ( not ( = ?auto_64884 ?auto_64876 ) ) ( not ( = ?auto_64878 ?auto_64876 ) ) ( not ( = ?auto_64893 ?auto_64876 ) ) ( AVAILABLE ?auto_64876 ) ( SURFACE-AT ?auto_64879 ?auto_64892 ) ( ON ?auto_64879 ?auto_64886 ) ( CLEAR ?auto_64879 ) ( not ( = ?auto_64874 ?auto_64886 ) ) ( not ( = ?auto_64875 ?auto_64886 ) ) ( not ( = ?auto_64891 ?auto_64886 ) ) ( not ( = ?auto_64881 ?auto_64886 ) ) ( not ( = ?auto_64885 ?auto_64886 ) ) ( not ( = ?auto_64879 ?auto_64886 ) ) ( not ( = ?auto_64887 ?auto_64886 ) ) ( not ( = ?auto_64880 ?auto_64886 ) ) ( SURFACE-AT ?auto_64877 ?auto_64890 ) ( CLEAR ?auto_64877 ) ( IS-CRATE ?auto_64880 ) ( not ( = ?auto_64874 ?auto_64877 ) ) ( not ( = ?auto_64875 ?auto_64877 ) ) ( not ( = ?auto_64891 ?auto_64877 ) ) ( not ( = ?auto_64881 ?auto_64877 ) ) ( not ( = ?auto_64885 ?auto_64877 ) ) ( not ( = ?auto_64879 ?auto_64877 ) ) ( not ( = ?auto_64887 ?auto_64877 ) ) ( not ( = ?auto_64880 ?auto_64877 ) ) ( not ( = ?auto_64886 ?auto_64877 ) ) ( AVAILABLE ?auto_64882 ) ( IN ?auto_64880 ?auto_64894 ) ( TRUCK-AT ?auto_64894 ?auto_64895 ) ( not ( = ?auto_64895 ?auto_64890 ) ) ( not ( = ?auto_64883 ?auto_64895 ) ) ( not ( = ?auto_64889 ?auto_64895 ) ) ( not ( = ?auto_64888 ?auto_64895 ) ) ( not ( = ?auto_64892 ?auto_64895 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_64894 ?auto_64895 ?auto_64890 )
      ( MAKE-ON ?auto_64874 ?auto_64875 )
      ( MAKE-ON-VERIFY ?auto_64874 ?auto_64875 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_64896 - SURFACE
      ?auto_64897 - SURFACE
    )
    :vars
    (
      ?auto_64906 - HOIST
      ?auto_64900 - PLACE
      ?auto_64909 - PLACE
      ?auto_64911 - HOIST
      ?auto_64917 - SURFACE
      ?auto_64910 - SURFACE
      ?auto_64915 - PLACE
      ?auto_64913 - HOIST
      ?auto_64908 - SURFACE
      ?auto_64904 - SURFACE
      ?auto_64899 - PLACE
      ?auto_64912 - HOIST
      ?auto_64907 - SURFACE
      ?auto_64916 - SURFACE
      ?auto_64898 - PLACE
      ?auto_64903 - HOIST
      ?auto_64905 - SURFACE
      ?auto_64914 - SURFACE
      ?auto_64901 - TRUCK
      ?auto_64902 - PLACE
      ?auto_64918 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_64906 ?auto_64900 ) ( IS-CRATE ?auto_64896 ) ( not ( = ?auto_64896 ?auto_64897 ) ) ( not ( = ?auto_64909 ?auto_64900 ) ) ( HOIST-AT ?auto_64911 ?auto_64909 ) ( not ( = ?auto_64906 ?auto_64911 ) ) ( AVAILABLE ?auto_64911 ) ( SURFACE-AT ?auto_64896 ?auto_64909 ) ( ON ?auto_64896 ?auto_64917 ) ( CLEAR ?auto_64896 ) ( not ( = ?auto_64896 ?auto_64917 ) ) ( not ( = ?auto_64897 ?auto_64917 ) ) ( IS-CRATE ?auto_64897 ) ( not ( = ?auto_64896 ?auto_64910 ) ) ( not ( = ?auto_64897 ?auto_64910 ) ) ( not ( = ?auto_64917 ?auto_64910 ) ) ( not ( = ?auto_64915 ?auto_64900 ) ) ( not ( = ?auto_64909 ?auto_64915 ) ) ( HOIST-AT ?auto_64913 ?auto_64915 ) ( not ( = ?auto_64906 ?auto_64913 ) ) ( not ( = ?auto_64911 ?auto_64913 ) ) ( AVAILABLE ?auto_64913 ) ( SURFACE-AT ?auto_64897 ?auto_64915 ) ( ON ?auto_64897 ?auto_64908 ) ( CLEAR ?auto_64897 ) ( not ( = ?auto_64896 ?auto_64908 ) ) ( not ( = ?auto_64897 ?auto_64908 ) ) ( not ( = ?auto_64917 ?auto_64908 ) ) ( not ( = ?auto_64910 ?auto_64908 ) ) ( IS-CRATE ?auto_64910 ) ( not ( = ?auto_64896 ?auto_64904 ) ) ( not ( = ?auto_64897 ?auto_64904 ) ) ( not ( = ?auto_64917 ?auto_64904 ) ) ( not ( = ?auto_64910 ?auto_64904 ) ) ( not ( = ?auto_64908 ?auto_64904 ) ) ( not ( = ?auto_64899 ?auto_64900 ) ) ( not ( = ?auto_64909 ?auto_64899 ) ) ( not ( = ?auto_64915 ?auto_64899 ) ) ( HOIST-AT ?auto_64912 ?auto_64899 ) ( not ( = ?auto_64906 ?auto_64912 ) ) ( not ( = ?auto_64911 ?auto_64912 ) ) ( not ( = ?auto_64913 ?auto_64912 ) ) ( AVAILABLE ?auto_64912 ) ( SURFACE-AT ?auto_64910 ?auto_64899 ) ( ON ?auto_64910 ?auto_64907 ) ( CLEAR ?auto_64910 ) ( not ( = ?auto_64896 ?auto_64907 ) ) ( not ( = ?auto_64897 ?auto_64907 ) ) ( not ( = ?auto_64917 ?auto_64907 ) ) ( not ( = ?auto_64910 ?auto_64907 ) ) ( not ( = ?auto_64908 ?auto_64907 ) ) ( not ( = ?auto_64904 ?auto_64907 ) ) ( IS-CRATE ?auto_64904 ) ( not ( = ?auto_64896 ?auto_64916 ) ) ( not ( = ?auto_64897 ?auto_64916 ) ) ( not ( = ?auto_64917 ?auto_64916 ) ) ( not ( = ?auto_64910 ?auto_64916 ) ) ( not ( = ?auto_64908 ?auto_64916 ) ) ( not ( = ?auto_64904 ?auto_64916 ) ) ( not ( = ?auto_64907 ?auto_64916 ) ) ( not ( = ?auto_64898 ?auto_64900 ) ) ( not ( = ?auto_64909 ?auto_64898 ) ) ( not ( = ?auto_64915 ?auto_64898 ) ) ( not ( = ?auto_64899 ?auto_64898 ) ) ( HOIST-AT ?auto_64903 ?auto_64898 ) ( not ( = ?auto_64906 ?auto_64903 ) ) ( not ( = ?auto_64911 ?auto_64903 ) ) ( not ( = ?auto_64913 ?auto_64903 ) ) ( not ( = ?auto_64912 ?auto_64903 ) ) ( AVAILABLE ?auto_64903 ) ( SURFACE-AT ?auto_64904 ?auto_64898 ) ( ON ?auto_64904 ?auto_64905 ) ( CLEAR ?auto_64904 ) ( not ( = ?auto_64896 ?auto_64905 ) ) ( not ( = ?auto_64897 ?auto_64905 ) ) ( not ( = ?auto_64917 ?auto_64905 ) ) ( not ( = ?auto_64910 ?auto_64905 ) ) ( not ( = ?auto_64908 ?auto_64905 ) ) ( not ( = ?auto_64904 ?auto_64905 ) ) ( not ( = ?auto_64907 ?auto_64905 ) ) ( not ( = ?auto_64916 ?auto_64905 ) ) ( SURFACE-AT ?auto_64914 ?auto_64900 ) ( CLEAR ?auto_64914 ) ( IS-CRATE ?auto_64916 ) ( not ( = ?auto_64896 ?auto_64914 ) ) ( not ( = ?auto_64897 ?auto_64914 ) ) ( not ( = ?auto_64917 ?auto_64914 ) ) ( not ( = ?auto_64910 ?auto_64914 ) ) ( not ( = ?auto_64908 ?auto_64914 ) ) ( not ( = ?auto_64904 ?auto_64914 ) ) ( not ( = ?auto_64907 ?auto_64914 ) ) ( not ( = ?auto_64916 ?auto_64914 ) ) ( not ( = ?auto_64905 ?auto_64914 ) ) ( AVAILABLE ?auto_64906 ) ( TRUCK-AT ?auto_64901 ?auto_64902 ) ( not ( = ?auto_64902 ?auto_64900 ) ) ( not ( = ?auto_64909 ?auto_64902 ) ) ( not ( = ?auto_64915 ?auto_64902 ) ) ( not ( = ?auto_64899 ?auto_64902 ) ) ( not ( = ?auto_64898 ?auto_64902 ) ) ( HOIST-AT ?auto_64918 ?auto_64902 ) ( LIFTING ?auto_64918 ?auto_64916 ) ( not ( = ?auto_64906 ?auto_64918 ) ) ( not ( = ?auto_64911 ?auto_64918 ) ) ( not ( = ?auto_64913 ?auto_64918 ) ) ( not ( = ?auto_64912 ?auto_64918 ) ) ( not ( = ?auto_64903 ?auto_64918 ) ) )
    :subtasks
    ( ( !LOAD ?auto_64918 ?auto_64916 ?auto_64901 ?auto_64902 )
      ( MAKE-ON ?auto_64896 ?auto_64897 )
      ( MAKE-ON-VERIFY ?auto_64896 ?auto_64897 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_64919 - SURFACE
      ?auto_64920 - SURFACE
    )
    :vars
    (
      ?auto_64929 - HOIST
      ?auto_64925 - PLACE
      ?auto_64938 - PLACE
      ?auto_64923 - HOIST
      ?auto_64939 - SURFACE
      ?auto_64937 - SURFACE
      ?auto_64932 - PLACE
      ?auto_64931 - HOIST
      ?auto_64921 - SURFACE
      ?auto_64936 - SURFACE
      ?auto_64941 - PLACE
      ?auto_64930 - HOIST
      ?auto_64924 - SURFACE
      ?auto_64933 - SURFACE
      ?auto_64928 - PLACE
      ?auto_64926 - HOIST
      ?auto_64934 - SURFACE
      ?auto_64922 - SURFACE
      ?auto_64940 - TRUCK
      ?auto_64927 - PLACE
      ?auto_64935 - HOIST
      ?auto_64942 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_64929 ?auto_64925 ) ( IS-CRATE ?auto_64919 ) ( not ( = ?auto_64919 ?auto_64920 ) ) ( not ( = ?auto_64938 ?auto_64925 ) ) ( HOIST-AT ?auto_64923 ?auto_64938 ) ( not ( = ?auto_64929 ?auto_64923 ) ) ( AVAILABLE ?auto_64923 ) ( SURFACE-AT ?auto_64919 ?auto_64938 ) ( ON ?auto_64919 ?auto_64939 ) ( CLEAR ?auto_64919 ) ( not ( = ?auto_64919 ?auto_64939 ) ) ( not ( = ?auto_64920 ?auto_64939 ) ) ( IS-CRATE ?auto_64920 ) ( not ( = ?auto_64919 ?auto_64937 ) ) ( not ( = ?auto_64920 ?auto_64937 ) ) ( not ( = ?auto_64939 ?auto_64937 ) ) ( not ( = ?auto_64932 ?auto_64925 ) ) ( not ( = ?auto_64938 ?auto_64932 ) ) ( HOIST-AT ?auto_64931 ?auto_64932 ) ( not ( = ?auto_64929 ?auto_64931 ) ) ( not ( = ?auto_64923 ?auto_64931 ) ) ( AVAILABLE ?auto_64931 ) ( SURFACE-AT ?auto_64920 ?auto_64932 ) ( ON ?auto_64920 ?auto_64921 ) ( CLEAR ?auto_64920 ) ( not ( = ?auto_64919 ?auto_64921 ) ) ( not ( = ?auto_64920 ?auto_64921 ) ) ( not ( = ?auto_64939 ?auto_64921 ) ) ( not ( = ?auto_64937 ?auto_64921 ) ) ( IS-CRATE ?auto_64937 ) ( not ( = ?auto_64919 ?auto_64936 ) ) ( not ( = ?auto_64920 ?auto_64936 ) ) ( not ( = ?auto_64939 ?auto_64936 ) ) ( not ( = ?auto_64937 ?auto_64936 ) ) ( not ( = ?auto_64921 ?auto_64936 ) ) ( not ( = ?auto_64941 ?auto_64925 ) ) ( not ( = ?auto_64938 ?auto_64941 ) ) ( not ( = ?auto_64932 ?auto_64941 ) ) ( HOIST-AT ?auto_64930 ?auto_64941 ) ( not ( = ?auto_64929 ?auto_64930 ) ) ( not ( = ?auto_64923 ?auto_64930 ) ) ( not ( = ?auto_64931 ?auto_64930 ) ) ( AVAILABLE ?auto_64930 ) ( SURFACE-AT ?auto_64937 ?auto_64941 ) ( ON ?auto_64937 ?auto_64924 ) ( CLEAR ?auto_64937 ) ( not ( = ?auto_64919 ?auto_64924 ) ) ( not ( = ?auto_64920 ?auto_64924 ) ) ( not ( = ?auto_64939 ?auto_64924 ) ) ( not ( = ?auto_64937 ?auto_64924 ) ) ( not ( = ?auto_64921 ?auto_64924 ) ) ( not ( = ?auto_64936 ?auto_64924 ) ) ( IS-CRATE ?auto_64936 ) ( not ( = ?auto_64919 ?auto_64933 ) ) ( not ( = ?auto_64920 ?auto_64933 ) ) ( not ( = ?auto_64939 ?auto_64933 ) ) ( not ( = ?auto_64937 ?auto_64933 ) ) ( not ( = ?auto_64921 ?auto_64933 ) ) ( not ( = ?auto_64936 ?auto_64933 ) ) ( not ( = ?auto_64924 ?auto_64933 ) ) ( not ( = ?auto_64928 ?auto_64925 ) ) ( not ( = ?auto_64938 ?auto_64928 ) ) ( not ( = ?auto_64932 ?auto_64928 ) ) ( not ( = ?auto_64941 ?auto_64928 ) ) ( HOIST-AT ?auto_64926 ?auto_64928 ) ( not ( = ?auto_64929 ?auto_64926 ) ) ( not ( = ?auto_64923 ?auto_64926 ) ) ( not ( = ?auto_64931 ?auto_64926 ) ) ( not ( = ?auto_64930 ?auto_64926 ) ) ( AVAILABLE ?auto_64926 ) ( SURFACE-AT ?auto_64936 ?auto_64928 ) ( ON ?auto_64936 ?auto_64934 ) ( CLEAR ?auto_64936 ) ( not ( = ?auto_64919 ?auto_64934 ) ) ( not ( = ?auto_64920 ?auto_64934 ) ) ( not ( = ?auto_64939 ?auto_64934 ) ) ( not ( = ?auto_64937 ?auto_64934 ) ) ( not ( = ?auto_64921 ?auto_64934 ) ) ( not ( = ?auto_64936 ?auto_64934 ) ) ( not ( = ?auto_64924 ?auto_64934 ) ) ( not ( = ?auto_64933 ?auto_64934 ) ) ( SURFACE-AT ?auto_64922 ?auto_64925 ) ( CLEAR ?auto_64922 ) ( IS-CRATE ?auto_64933 ) ( not ( = ?auto_64919 ?auto_64922 ) ) ( not ( = ?auto_64920 ?auto_64922 ) ) ( not ( = ?auto_64939 ?auto_64922 ) ) ( not ( = ?auto_64937 ?auto_64922 ) ) ( not ( = ?auto_64921 ?auto_64922 ) ) ( not ( = ?auto_64936 ?auto_64922 ) ) ( not ( = ?auto_64924 ?auto_64922 ) ) ( not ( = ?auto_64933 ?auto_64922 ) ) ( not ( = ?auto_64934 ?auto_64922 ) ) ( AVAILABLE ?auto_64929 ) ( TRUCK-AT ?auto_64940 ?auto_64927 ) ( not ( = ?auto_64927 ?auto_64925 ) ) ( not ( = ?auto_64938 ?auto_64927 ) ) ( not ( = ?auto_64932 ?auto_64927 ) ) ( not ( = ?auto_64941 ?auto_64927 ) ) ( not ( = ?auto_64928 ?auto_64927 ) ) ( HOIST-AT ?auto_64935 ?auto_64927 ) ( not ( = ?auto_64929 ?auto_64935 ) ) ( not ( = ?auto_64923 ?auto_64935 ) ) ( not ( = ?auto_64931 ?auto_64935 ) ) ( not ( = ?auto_64930 ?auto_64935 ) ) ( not ( = ?auto_64926 ?auto_64935 ) ) ( AVAILABLE ?auto_64935 ) ( SURFACE-AT ?auto_64933 ?auto_64927 ) ( ON ?auto_64933 ?auto_64942 ) ( CLEAR ?auto_64933 ) ( not ( = ?auto_64919 ?auto_64942 ) ) ( not ( = ?auto_64920 ?auto_64942 ) ) ( not ( = ?auto_64939 ?auto_64942 ) ) ( not ( = ?auto_64937 ?auto_64942 ) ) ( not ( = ?auto_64921 ?auto_64942 ) ) ( not ( = ?auto_64936 ?auto_64942 ) ) ( not ( = ?auto_64924 ?auto_64942 ) ) ( not ( = ?auto_64933 ?auto_64942 ) ) ( not ( = ?auto_64934 ?auto_64942 ) ) ( not ( = ?auto_64922 ?auto_64942 ) ) )
    :subtasks
    ( ( !LIFT ?auto_64935 ?auto_64933 ?auto_64942 ?auto_64927 )
      ( MAKE-ON ?auto_64919 ?auto_64920 )
      ( MAKE-ON-VERIFY ?auto_64919 ?auto_64920 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_64943 - SURFACE
      ?auto_64944 - SURFACE
    )
    :vars
    (
      ?auto_64961 - HOIST
      ?auto_64953 - PLACE
      ?auto_64951 - PLACE
      ?auto_64965 - HOIST
      ?auto_64959 - SURFACE
      ?auto_64950 - SURFACE
      ?auto_64962 - PLACE
      ?auto_64949 - HOIST
      ?auto_64955 - SURFACE
      ?auto_64957 - SURFACE
      ?auto_64960 - PLACE
      ?auto_64952 - HOIST
      ?auto_64956 - SURFACE
      ?auto_64946 - SURFACE
      ?auto_64963 - PLACE
      ?auto_64964 - HOIST
      ?auto_64954 - SURFACE
      ?auto_64945 - SURFACE
      ?auto_64947 - PLACE
      ?auto_64966 - HOIST
      ?auto_64948 - SURFACE
      ?auto_64958 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_64961 ?auto_64953 ) ( IS-CRATE ?auto_64943 ) ( not ( = ?auto_64943 ?auto_64944 ) ) ( not ( = ?auto_64951 ?auto_64953 ) ) ( HOIST-AT ?auto_64965 ?auto_64951 ) ( not ( = ?auto_64961 ?auto_64965 ) ) ( AVAILABLE ?auto_64965 ) ( SURFACE-AT ?auto_64943 ?auto_64951 ) ( ON ?auto_64943 ?auto_64959 ) ( CLEAR ?auto_64943 ) ( not ( = ?auto_64943 ?auto_64959 ) ) ( not ( = ?auto_64944 ?auto_64959 ) ) ( IS-CRATE ?auto_64944 ) ( not ( = ?auto_64943 ?auto_64950 ) ) ( not ( = ?auto_64944 ?auto_64950 ) ) ( not ( = ?auto_64959 ?auto_64950 ) ) ( not ( = ?auto_64962 ?auto_64953 ) ) ( not ( = ?auto_64951 ?auto_64962 ) ) ( HOIST-AT ?auto_64949 ?auto_64962 ) ( not ( = ?auto_64961 ?auto_64949 ) ) ( not ( = ?auto_64965 ?auto_64949 ) ) ( AVAILABLE ?auto_64949 ) ( SURFACE-AT ?auto_64944 ?auto_64962 ) ( ON ?auto_64944 ?auto_64955 ) ( CLEAR ?auto_64944 ) ( not ( = ?auto_64943 ?auto_64955 ) ) ( not ( = ?auto_64944 ?auto_64955 ) ) ( not ( = ?auto_64959 ?auto_64955 ) ) ( not ( = ?auto_64950 ?auto_64955 ) ) ( IS-CRATE ?auto_64950 ) ( not ( = ?auto_64943 ?auto_64957 ) ) ( not ( = ?auto_64944 ?auto_64957 ) ) ( not ( = ?auto_64959 ?auto_64957 ) ) ( not ( = ?auto_64950 ?auto_64957 ) ) ( not ( = ?auto_64955 ?auto_64957 ) ) ( not ( = ?auto_64960 ?auto_64953 ) ) ( not ( = ?auto_64951 ?auto_64960 ) ) ( not ( = ?auto_64962 ?auto_64960 ) ) ( HOIST-AT ?auto_64952 ?auto_64960 ) ( not ( = ?auto_64961 ?auto_64952 ) ) ( not ( = ?auto_64965 ?auto_64952 ) ) ( not ( = ?auto_64949 ?auto_64952 ) ) ( AVAILABLE ?auto_64952 ) ( SURFACE-AT ?auto_64950 ?auto_64960 ) ( ON ?auto_64950 ?auto_64956 ) ( CLEAR ?auto_64950 ) ( not ( = ?auto_64943 ?auto_64956 ) ) ( not ( = ?auto_64944 ?auto_64956 ) ) ( not ( = ?auto_64959 ?auto_64956 ) ) ( not ( = ?auto_64950 ?auto_64956 ) ) ( not ( = ?auto_64955 ?auto_64956 ) ) ( not ( = ?auto_64957 ?auto_64956 ) ) ( IS-CRATE ?auto_64957 ) ( not ( = ?auto_64943 ?auto_64946 ) ) ( not ( = ?auto_64944 ?auto_64946 ) ) ( not ( = ?auto_64959 ?auto_64946 ) ) ( not ( = ?auto_64950 ?auto_64946 ) ) ( not ( = ?auto_64955 ?auto_64946 ) ) ( not ( = ?auto_64957 ?auto_64946 ) ) ( not ( = ?auto_64956 ?auto_64946 ) ) ( not ( = ?auto_64963 ?auto_64953 ) ) ( not ( = ?auto_64951 ?auto_64963 ) ) ( not ( = ?auto_64962 ?auto_64963 ) ) ( not ( = ?auto_64960 ?auto_64963 ) ) ( HOIST-AT ?auto_64964 ?auto_64963 ) ( not ( = ?auto_64961 ?auto_64964 ) ) ( not ( = ?auto_64965 ?auto_64964 ) ) ( not ( = ?auto_64949 ?auto_64964 ) ) ( not ( = ?auto_64952 ?auto_64964 ) ) ( AVAILABLE ?auto_64964 ) ( SURFACE-AT ?auto_64957 ?auto_64963 ) ( ON ?auto_64957 ?auto_64954 ) ( CLEAR ?auto_64957 ) ( not ( = ?auto_64943 ?auto_64954 ) ) ( not ( = ?auto_64944 ?auto_64954 ) ) ( not ( = ?auto_64959 ?auto_64954 ) ) ( not ( = ?auto_64950 ?auto_64954 ) ) ( not ( = ?auto_64955 ?auto_64954 ) ) ( not ( = ?auto_64957 ?auto_64954 ) ) ( not ( = ?auto_64956 ?auto_64954 ) ) ( not ( = ?auto_64946 ?auto_64954 ) ) ( SURFACE-AT ?auto_64945 ?auto_64953 ) ( CLEAR ?auto_64945 ) ( IS-CRATE ?auto_64946 ) ( not ( = ?auto_64943 ?auto_64945 ) ) ( not ( = ?auto_64944 ?auto_64945 ) ) ( not ( = ?auto_64959 ?auto_64945 ) ) ( not ( = ?auto_64950 ?auto_64945 ) ) ( not ( = ?auto_64955 ?auto_64945 ) ) ( not ( = ?auto_64957 ?auto_64945 ) ) ( not ( = ?auto_64956 ?auto_64945 ) ) ( not ( = ?auto_64946 ?auto_64945 ) ) ( not ( = ?auto_64954 ?auto_64945 ) ) ( AVAILABLE ?auto_64961 ) ( not ( = ?auto_64947 ?auto_64953 ) ) ( not ( = ?auto_64951 ?auto_64947 ) ) ( not ( = ?auto_64962 ?auto_64947 ) ) ( not ( = ?auto_64960 ?auto_64947 ) ) ( not ( = ?auto_64963 ?auto_64947 ) ) ( HOIST-AT ?auto_64966 ?auto_64947 ) ( not ( = ?auto_64961 ?auto_64966 ) ) ( not ( = ?auto_64965 ?auto_64966 ) ) ( not ( = ?auto_64949 ?auto_64966 ) ) ( not ( = ?auto_64952 ?auto_64966 ) ) ( not ( = ?auto_64964 ?auto_64966 ) ) ( AVAILABLE ?auto_64966 ) ( SURFACE-AT ?auto_64946 ?auto_64947 ) ( ON ?auto_64946 ?auto_64948 ) ( CLEAR ?auto_64946 ) ( not ( = ?auto_64943 ?auto_64948 ) ) ( not ( = ?auto_64944 ?auto_64948 ) ) ( not ( = ?auto_64959 ?auto_64948 ) ) ( not ( = ?auto_64950 ?auto_64948 ) ) ( not ( = ?auto_64955 ?auto_64948 ) ) ( not ( = ?auto_64957 ?auto_64948 ) ) ( not ( = ?auto_64956 ?auto_64948 ) ) ( not ( = ?auto_64946 ?auto_64948 ) ) ( not ( = ?auto_64954 ?auto_64948 ) ) ( not ( = ?auto_64945 ?auto_64948 ) ) ( TRUCK-AT ?auto_64958 ?auto_64953 ) )
    :subtasks
    ( ( !DRIVE ?auto_64958 ?auto_64953 ?auto_64947 )
      ( MAKE-ON ?auto_64943 ?auto_64944 )
      ( MAKE-ON-VERIFY ?auto_64943 ?auto_64944 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_64969 - SURFACE
      ?auto_64970 - SURFACE
    )
    :vars
    (
      ?auto_64971 - HOIST
      ?auto_64972 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_64971 ?auto_64972 ) ( SURFACE-AT ?auto_64970 ?auto_64972 ) ( CLEAR ?auto_64970 ) ( LIFTING ?auto_64971 ?auto_64969 ) ( IS-CRATE ?auto_64969 ) ( not ( = ?auto_64969 ?auto_64970 ) ) )
    :subtasks
    ( ( !DROP ?auto_64971 ?auto_64969 ?auto_64970 ?auto_64972 )
      ( MAKE-ON-VERIFY ?auto_64969 ?auto_64970 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_64973 - SURFACE
      ?auto_64974 - SURFACE
    )
    :vars
    (
      ?auto_64976 - HOIST
      ?auto_64975 - PLACE
      ?auto_64977 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_64976 ?auto_64975 ) ( SURFACE-AT ?auto_64974 ?auto_64975 ) ( CLEAR ?auto_64974 ) ( IS-CRATE ?auto_64973 ) ( not ( = ?auto_64973 ?auto_64974 ) ) ( TRUCK-AT ?auto_64977 ?auto_64975 ) ( AVAILABLE ?auto_64976 ) ( IN ?auto_64973 ?auto_64977 ) )
    :subtasks
    ( ( !UNLOAD ?auto_64976 ?auto_64973 ?auto_64977 ?auto_64975 )
      ( MAKE-ON ?auto_64973 ?auto_64974 )
      ( MAKE-ON-VERIFY ?auto_64973 ?auto_64974 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_64978 - SURFACE
      ?auto_64979 - SURFACE
    )
    :vars
    (
      ?auto_64982 - HOIST
      ?auto_64980 - PLACE
      ?auto_64981 - TRUCK
      ?auto_64983 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_64982 ?auto_64980 ) ( SURFACE-AT ?auto_64979 ?auto_64980 ) ( CLEAR ?auto_64979 ) ( IS-CRATE ?auto_64978 ) ( not ( = ?auto_64978 ?auto_64979 ) ) ( AVAILABLE ?auto_64982 ) ( IN ?auto_64978 ?auto_64981 ) ( TRUCK-AT ?auto_64981 ?auto_64983 ) ( not ( = ?auto_64983 ?auto_64980 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_64981 ?auto_64983 ?auto_64980 )
      ( MAKE-ON ?auto_64978 ?auto_64979 )
      ( MAKE-ON-VERIFY ?auto_64978 ?auto_64979 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_64984 - SURFACE
      ?auto_64985 - SURFACE
    )
    :vars
    (
      ?auto_64988 - HOIST
      ?auto_64987 - PLACE
      ?auto_64986 - TRUCK
      ?auto_64989 - PLACE
      ?auto_64990 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_64988 ?auto_64987 ) ( SURFACE-AT ?auto_64985 ?auto_64987 ) ( CLEAR ?auto_64985 ) ( IS-CRATE ?auto_64984 ) ( not ( = ?auto_64984 ?auto_64985 ) ) ( AVAILABLE ?auto_64988 ) ( TRUCK-AT ?auto_64986 ?auto_64989 ) ( not ( = ?auto_64989 ?auto_64987 ) ) ( HOIST-AT ?auto_64990 ?auto_64989 ) ( LIFTING ?auto_64990 ?auto_64984 ) ( not ( = ?auto_64988 ?auto_64990 ) ) )
    :subtasks
    ( ( !LOAD ?auto_64990 ?auto_64984 ?auto_64986 ?auto_64989 )
      ( MAKE-ON ?auto_64984 ?auto_64985 )
      ( MAKE-ON-VERIFY ?auto_64984 ?auto_64985 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_64991 - SURFACE
      ?auto_64992 - SURFACE
    )
    :vars
    (
      ?auto_64993 - HOIST
      ?auto_64997 - PLACE
      ?auto_64996 - TRUCK
      ?auto_64994 - PLACE
      ?auto_64995 - HOIST
      ?auto_64998 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_64993 ?auto_64997 ) ( SURFACE-AT ?auto_64992 ?auto_64997 ) ( CLEAR ?auto_64992 ) ( IS-CRATE ?auto_64991 ) ( not ( = ?auto_64991 ?auto_64992 ) ) ( AVAILABLE ?auto_64993 ) ( TRUCK-AT ?auto_64996 ?auto_64994 ) ( not ( = ?auto_64994 ?auto_64997 ) ) ( HOIST-AT ?auto_64995 ?auto_64994 ) ( not ( = ?auto_64993 ?auto_64995 ) ) ( AVAILABLE ?auto_64995 ) ( SURFACE-AT ?auto_64991 ?auto_64994 ) ( ON ?auto_64991 ?auto_64998 ) ( CLEAR ?auto_64991 ) ( not ( = ?auto_64991 ?auto_64998 ) ) ( not ( = ?auto_64992 ?auto_64998 ) ) )
    :subtasks
    ( ( !LIFT ?auto_64995 ?auto_64991 ?auto_64998 ?auto_64994 )
      ( MAKE-ON ?auto_64991 ?auto_64992 )
      ( MAKE-ON-VERIFY ?auto_64991 ?auto_64992 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_64999 - SURFACE
      ?auto_65000 - SURFACE
    )
    :vars
    (
      ?auto_65003 - HOIST
      ?auto_65004 - PLACE
      ?auto_65002 - PLACE
      ?auto_65005 - HOIST
      ?auto_65006 - SURFACE
      ?auto_65001 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_65003 ?auto_65004 ) ( SURFACE-AT ?auto_65000 ?auto_65004 ) ( CLEAR ?auto_65000 ) ( IS-CRATE ?auto_64999 ) ( not ( = ?auto_64999 ?auto_65000 ) ) ( AVAILABLE ?auto_65003 ) ( not ( = ?auto_65002 ?auto_65004 ) ) ( HOIST-AT ?auto_65005 ?auto_65002 ) ( not ( = ?auto_65003 ?auto_65005 ) ) ( AVAILABLE ?auto_65005 ) ( SURFACE-AT ?auto_64999 ?auto_65002 ) ( ON ?auto_64999 ?auto_65006 ) ( CLEAR ?auto_64999 ) ( not ( = ?auto_64999 ?auto_65006 ) ) ( not ( = ?auto_65000 ?auto_65006 ) ) ( TRUCK-AT ?auto_65001 ?auto_65004 ) )
    :subtasks
    ( ( !DRIVE ?auto_65001 ?auto_65004 ?auto_65002 )
      ( MAKE-ON ?auto_64999 ?auto_65000 )
      ( MAKE-ON-VERIFY ?auto_64999 ?auto_65000 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_65007 - SURFACE
      ?auto_65008 - SURFACE
    )
    :vars
    (
      ?auto_65014 - HOIST
      ?auto_65012 - PLACE
      ?auto_65011 - PLACE
      ?auto_65010 - HOIST
      ?auto_65009 - SURFACE
      ?auto_65013 - TRUCK
      ?auto_65015 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_65014 ?auto_65012 ) ( IS-CRATE ?auto_65007 ) ( not ( = ?auto_65007 ?auto_65008 ) ) ( not ( = ?auto_65011 ?auto_65012 ) ) ( HOIST-AT ?auto_65010 ?auto_65011 ) ( not ( = ?auto_65014 ?auto_65010 ) ) ( AVAILABLE ?auto_65010 ) ( SURFACE-AT ?auto_65007 ?auto_65011 ) ( ON ?auto_65007 ?auto_65009 ) ( CLEAR ?auto_65007 ) ( not ( = ?auto_65007 ?auto_65009 ) ) ( not ( = ?auto_65008 ?auto_65009 ) ) ( TRUCK-AT ?auto_65013 ?auto_65012 ) ( SURFACE-AT ?auto_65015 ?auto_65012 ) ( CLEAR ?auto_65015 ) ( LIFTING ?auto_65014 ?auto_65008 ) ( IS-CRATE ?auto_65008 ) ( not ( = ?auto_65007 ?auto_65015 ) ) ( not ( = ?auto_65008 ?auto_65015 ) ) ( not ( = ?auto_65009 ?auto_65015 ) ) )
    :subtasks
    ( ( !DROP ?auto_65014 ?auto_65008 ?auto_65015 ?auto_65012 )
      ( MAKE-ON ?auto_65007 ?auto_65008 )
      ( MAKE-ON-VERIFY ?auto_65007 ?auto_65008 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_65016 - SURFACE
      ?auto_65017 - SURFACE
    )
    :vars
    (
      ?auto_65018 - HOIST
      ?auto_65019 - PLACE
      ?auto_65020 - PLACE
      ?auto_65022 - HOIST
      ?auto_65024 - SURFACE
      ?auto_65023 - TRUCK
      ?auto_65021 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_65018 ?auto_65019 ) ( IS-CRATE ?auto_65016 ) ( not ( = ?auto_65016 ?auto_65017 ) ) ( not ( = ?auto_65020 ?auto_65019 ) ) ( HOIST-AT ?auto_65022 ?auto_65020 ) ( not ( = ?auto_65018 ?auto_65022 ) ) ( AVAILABLE ?auto_65022 ) ( SURFACE-AT ?auto_65016 ?auto_65020 ) ( ON ?auto_65016 ?auto_65024 ) ( CLEAR ?auto_65016 ) ( not ( = ?auto_65016 ?auto_65024 ) ) ( not ( = ?auto_65017 ?auto_65024 ) ) ( TRUCK-AT ?auto_65023 ?auto_65019 ) ( SURFACE-AT ?auto_65021 ?auto_65019 ) ( CLEAR ?auto_65021 ) ( IS-CRATE ?auto_65017 ) ( not ( = ?auto_65016 ?auto_65021 ) ) ( not ( = ?auto_65017 ?auto_65021 ) ) ( not ( = ?auto_65024 ?auto_65021 ) ) ( AVAILABLE ?auto_65018 ) ( IN ?auto_65017 ?auto_65023 ) )
    :subtasks
    ( ( !UNLOAD ?auto_65018 ?auto_65017 ?auto_65023 ?auto_65019 )
      ( MAKE-ON ?auto_65016 ?auto_65017 )
      ( MAKE-ON-VERIFY ?auto_65016 ?auto_65017 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_65025 - SURFACE
      ?auto_65026 - SURFACE
    )
    :vars
    (
      ?auto_65030 - HOIST
      ?auto_65032 - PLACE
      ?auto_65028 - PLACE
      ?auto_65029 - HOIST
      ?auto_65031 - SURFACE
      ?auto_65027 - SURFACE
      ?auto_65033 - TRUCK
      ?auto_65034 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_65030 ?auto_65032 ) ( IS-CRATE ?auto_65025 ) ( not ( = ?auto_65025 ?auto_65026 ) ) ( not ( = ?auto_65028 ?auto_65032 ) ) ( HOIST-AT ?auto_65029 ?auto_65028 ) ( not ( = ?auto_65030 ?auto_65029 ) ) ( AVAILABLE ?auto_65029 ) ( SURFACE-AT ?auto_65025 ?auto_65028 ) ( ON ?auto_65025 ?auto_65031 ) ( CLEAR ?auto_65025 ) ( not ( = ?auto_65025 ?auto_65031 ) ) ( not ( = ?auto_65026 ?auto_65031 ) ) ( SURFACE-AT ?auto_65027 ?auto_65032 ) ( CLEAR ?auto_65027 ) ( IS-CRATE ?auto_65026 ) ( not ( = ?auto_65025 ?auto_65027 ) ) ( not ( = ?auto_65026 ?auto_65027 ) ) ( not ( = ?auto_65031 ?auto_65027 ) ) ( AVAILABLE ?auto_65030 ) ( IN ?auto_65026 ?auto_65033 ) ( TRUCK-AT ?auto_65033 ?auto_65034 ) ( not ( = ?auto_65034 ?auto_65032 ) ) ( not ( = ?auto_65028 ?auto_65034 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_65033 ?auto_65034 ?auto_65032 )
      ( MAKE-ON ?auto_65025 ?auto_65026 )
      ( MAKE-ON-VERIFY ?auto_65025 ?auto_65026 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_65035 - SURFACE
      ?auto_65036 - SURFACE
    )
    :vars
    (
      ?auto_65043 - HOIST
      ?auto_65040 - PLACE
      ?auto_65038 - PLACE
      ?auto_65037 - HOIST
      ?auto_65044 - SURFACE
      ?auto_65042 - SURFACE
      ?auto_65041 - TRUCK
      ?auto_65039 - PLACE
      ?auto_65045 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_65043 ?auto_65040 ) ( IS-CRATE ?auto_65035 ) ( not ( = ?auto_65035 ?auto_65036 ) ) ( not ( = ?auto_65038 ?auto_65040 ) ) ( HOIST-AT ?auto_65037 ?auto_65038 ) ( not ( = ?auto_65043 ?auto_65037 ) ) ( AVAILABLE ?auto_65037 ) ( SURFACE-AT ?auto_65035 ?auto_65038 ) ( ON ?auto_65035 ?auto_65044 ) ( CLEAR ?auto_65035 ) ( not ( = ?auto_65035 ?auto_65044 ) ) ( not ( = ?auto_65036 ?auto_65044 ) ) ( SURFACE-AT ?auto_65042 ?auto_65040 ) ( CLEAR ?auto_65042 ) ( IS-CRATE ?auto_65036 ) ( not ( = ?auto_65035 ?auto_65042 ) ) ( not ( = ?auto_65036 ?auto_65042 ) ) ( not ( = ?auto_65044 ?auto_65042 ) ) ( AVAILABLE ?auto_65043 ) ( TRUCK-AT ?auto_65041 ?auto_65039 ) ( not ( = ?auto_65039 ?auto_65040 ) ) ( not ( = ?auto_65038 ?auto_65039 ) ) ( HOIST-AT ?auto_65045 ?auto_65039 ) ( LIFTING ?auto_65045 ?auto_65036 ) ( not ( = ?auto_65043 ?auto_65045 ) ) ( not ( = ?auto_65037 ?auto_65045 ) ) )
    :subtasks
    ( ( !LOAD ?auto_65045 ?auto_65036 ?auto_65041 ?auto_65039 )
      ( MAKE-ON ?auto_65035 ?auto_65036 )
      ( MAKE-ON-VERIFY ?auto_65035 ?auto_65036 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_65046 - SURFACE
      ?auto_65047 - SURFACE
    )
    :vars
    (
      ?auto_65048 - HOIST
      ?auto_65056 - PLACE
      ?auto_65053 - PLACE
      ?auto_65049 - HOIST
      ?auto_65054 - SURFACE
      ?auto_65050 - SURFACE
      ?auto_65052 - TRUCK
      ?auto_65055 - PLACE
      ?auto_65051 - HOIST
      ?auto_65057 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_65048 ?auto_65056 ) ( IS-CRATE ?auto_65046 ) ( not ( = ?auto_65046 ?auto_65047 ) ) ( not ( = ?auto_65053 ?auto_65056 ) ) ( HOIST-AT ?auto_65049 ?auto_65053 ) ( not ( = ?auto_65048 ?auto_65049 ) ) ( AVAILABLE ?auto_65049 ) ( SURFACE-AT ?auto_65046 ?auto_65053 ) ( ON ?auto_65046 ?auto_65054 ) ( CLEAR ?auto_65046 ) ( not ( = ?auto_65046 ?auto_65054 ) ) ( not ( = ?auto_65047 ?auto_65054 ) ) ( SURFACE-AT ?auto_65050 ?auto_65056 ) ( CLEAR ?auto_65050 ) ( IS-CRATE ?auto_65047 ) ( not ( = ?auto_65046 ?auto_65050 ) ) ( not ( = ?auto_65047 ?auto_65050 ) ) ( not ( = ?auto_65054 ?auto_65050 ) ) ( AVAILABLE ?auto_65048 ) ( TRUCK-AT ?auto_65052 ?auto_65055 ) ( not ( = ?auto_65055 ?auto_65056 ) ) ( not ( = ?auto_65053 ?auto_65055 ) ) ( HOIST-AT ?auto_65051 ?auto_65055 ) ( not ( = ?auto_65048 ?auto_65051 ) ) ( not ( = ?auto_65049 ?auto_65051 ) ) ( AVAILABLE ?auto_65051 ) ( SURFACE-AT ?auto_65047 ?auto_65055 ) ( ON ?auto_65047 ?auto_65057 ) ( CLEAR ?auto_65047 ) ( not ( = ?auto_65046 ?auto_65057 ) ) ( not ( = ?auto_65047 ?auto_65057 ) ) ( not ( = ?auto_65054 ?auto_65057 ) ) ( not ( = ?auto_65050 ?auto_65057 ) ) )
    :subtasks
    ( ( !LIFT ?auto_65051 ?auto_65047 ?auto_65057 ?auto_65055 )
      ( MAKE-ON ?auto_65046 ?auto_65047 )
      ( MAKE-ON-VERIFY ?auto_65046 ?auto_65047 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_65058 - SURFACE
      ?auto_65059 - SURFACE
    )
    :vars
    (
      ?auto_65063 - HOIST
      ?auto_65068 - PLACE
      ?auto_65069 - PLACE
      ?auto_65066 - HOIST
      ?auto_65061 - SURFACE
      ?auto_65067 - SURFACE
      ?auto_65060 - PLACE
      ?auto_65062 - HOIST
      ?auto_65064 - SURFACE
      ?auto_65065 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_65063 ?auto_65068 ) ( IS-CRATE ?auto_65058 ) ( not ( = ?auto_65058 ?auto_65059 ) ) ( not ( = ?auto_65069 ?auto_65068 ) ) ( HOIST-AT ?auto_65066 ?auto_65069 ) ( not ( = ?auto_65063 ?auto_65066 ) ) ( AVAILABLE ?auto_65066 ) ( SURFACE-AT ?auto_65058 ?auto_65069 ) ( ON ?auto_65058 ?auto_65061 ) ( CLEAR ?auto_65058 ) ( not ( = ?auto_65058 ?auto_65061 ) ) ( not ( = ?auto_65059 ?auto_65061 ) ) ( SURFACE-AT ?auto_65067 ?auto_65068 ) ( CLEAR ?auto_65067 ) ( IS-CRATE ?auto_65059 ) ( not ( = ?auto_65058 ?auto_65067 ) ) ( not ( = ?auto_65059 ?auto_65067 ) ) ( not ( = ?auto_65061 ?auto_65067 ) ) ( AVAILABLE ?auto_65063 ) ( not ( = ?auto_65060 ?auto_65068 ) ) ( not ( = ?auto_65069 ?auto_65060 ) ) ( HOIST-AT ?auto_65062 ?auto_65060 ) ( not ( = ?auto_65063 ?auto_65062 ) ) ( not ( = ?auto_65066 ?auto_65062 ) ) ( AVAILABLE ?auto_65062 ) ( SURFACE-AT ?auto_65059 ?auto_65060 ) ( ON ?auto_65059 ?auto_65064 ) ( CLEAR ?auto_65059 ) ( not ( = ?auto_65058 ?auto_65064 ) ) ( not ( = ?auto_65059 ?auto_65064 ) ) ( not ( = ?auto_65061 ?auto_65064 ) ) ( not ( = ?auto_65067 ?auto_65064 ) ) ( TRUCK-AT ?auto_65065 ?auto_65068 ) )
    :subtasks
    ( ( !DRIVE ?auto_65065 ?auto_65068 ?auto_65060 )
      ( MAKE-ON ?auto_65058 ?auto_65059 )
      ( MAKE-ON-VERIFY ?auto_65058 ?auto_65059 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_65070 - SURFACE
      ?auto_65071 - SURFACE
    )
    :vars
    (
      ?auto_65077 - HOIST
      ?auto_65076 - PLACE
      ?auto_65080 - PLACE
      ?auto_65078 - HOIST
      ?auto_65079 - SURFACE
      ?auto_65072 - SURFACE
      ?auto_65073 - PLACE
      ?auto_65074 - HOIST
      ?auto_65075 - SURFACE
      ?auto_65081 - TRUCK
      ?auto_65082 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_65077 ?auto_65076 ) ( IS-CRATE ?auto_65070 ) ( not ( = ?auto_65070 ?auto_65071 ) ) ( not ( = ?auto_65080 ?auto_65076 ) ) ( HOIST-AT ?auto_65078 ?auto_65080 ) ( not ( = ?auto_65077 ?auto_65078 ) ) ( AVAILABLE ?auto_65078 ) ( SURFACE-AT ?auto_65070 ?auto_65080 ) ( ON ?auto_65070 ?auto_65079 ) ( CLEAR ?auto_65070 ) ( not ( = ?auto_65070 ?auto_65079 ) ) ( not ( = ?auto_65071 ?auto_65079 ) ) ( IS-CRATE ?auto_65071 ) ( not ( = ?auto_65070 ?auto_65072 ) ) ( not ( = ?auto_65071 ?auto_65072 ) ) ( not ( = ?auto_65079 ?auto_65072 ) ) ( not ( = ?auto_65073 ?auto_65076 ) ) ( not ( = ?auto_65080 ?auto_65073 ) ) ( HOIST-AT ?auto_65074 ?auto_65073 ) ( not ( = ?auto_65077 ?auto_65074 ) ) ( not ( = ?auto_65078 ?auto_65074 ) ) ( AVAILABLE ?auto_65074 ) ( SURFACE-AT ?auto_65071 ?auto_65073 ) ( ON ?auto_65071 ?auto_65075 ) ( CLEAR ?auto_65071 ) ( not ( = ?auto_65070 ?auto_65075 ) ) ( not ( = ?auto_65071 ?auto_65075 ) ) ( not ( = ?auto_65079 ?auto_65075 ) ) ( not ( = ?auto_65072 ?auto_65075 ) ) ( TRUCK-AT ?auto_65081 ?auto_65076 ) ( SURFACE-AT ?auto_65082 ?auto_65076 ) ( CLEAR ?auto_65082 ) ( LIFTING ?auto_65077 ?auto_65072 ) ( IS-CRATE ?auto_65072 ) ( not ( = ?auto_65070 ?auto_65082 ) ) ( not ( = ?auto_65071 ?auto_65082 ) ) ( not ( = ?auto_65079 ?auto_65082 ) ) ( not ( = ?auto_65072 ?auto_65082 ) ) ( not ( = ?auto_65075 ?auto_65082 ) ) )
    :subtasks
    ( ( !DROP ?auto_65077 ?auto_65072 ?auto_65082 ?auto_65076 )
      ( MAKE-ON ?auto_65070 ?auto_65071 )
      ( MAKE-ON-VERIFY ?auto_65070 ?auto_65071 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_65083 - SURFACE
      ?auto_65084 - SURFACE
    )
    :vars
    (
      ?auto_65094 - HOIST
      ?auto_65087 - PLACE
      ?auto_65085 - PLACE
      ?auto_65090 - HOIST
      ?auto_65092 - SURFACE
      ?auto_65093 - SURFACE
      ?auto_65095 - PLACE
      ?auto_65088 - HOIST
      ?auto_65089 - SURFACE
      ?auto_65086 - TRUCK
      ?auto_65091 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_65094 ?auto_65087 ) ( IS-CRATE ?auto_65083 ) ( not ( = ?auto_65083 ?auto_65084 ) ) ( not ( = ?auto_65085 ?auto_65087 ) ) ( HOIST-AT ?auto_65090 ?auto_65085 ) ( not ( = ?auto_65094 ?auto_65090 ) ) ( AVAILABLE ?auto_65090 ) ( SURFACE-AT ?auto_65083 ?auto_65085 ) ( ON ?auto_65083 ?auto_65092 ) ( CLEAR ?auto_65083 ) ( not ( = ?auto_65083 ?auto_65092 ) ) ( not ( = ?auto_65084 ?auto_65092 ) ) ( IS-CRATE ?auto_65084 ) ( not ( = ?auto_65083 ?auto_65093 ) ) ( not ( = ?auto_65084 ?auto_65093 ) ) ( not ( = ?auto_65092 ?auto_65093 ) ) ( not ( = ?auto_65095 ?auto_65087 ) ) ( not ( = ?auto_65085 ?auto_65095 ) ) ( HOIST-AT ?auto_65088 ?auto_65095 ) ( not ( = ?auto_65094 ?auto_65088 ) ) ( not ( = ?auto_65090 ?auto_65088 ) ) ( AVAILABLE ?auto_65088 ) ( SURFACE-AT ?auto_65084 ?auto_65095 ) ( ON ?auto_65084 ?auto_65089 ) ( CLEAR ?auto_65084 ) ( not ( = ?auto_65083 ?auto_65089 ) ) ( not ( = ?auto_65084 ?auto_65089 ) ) ( not ( = ?auto_65092 ?auto_65089 ) ) ( not ( = ?auto_65093 ?auto_65089 ) ) ( TRUCK-AT ?auto_65086 ?auto_65087 ) ( SURFACE-AT ?auto_65091 ?auto_65087 ) ( CLEAR ?auto_65091 ) ( IS-CRATE ?auto_65093 ) ( not ( = ?auto_65083 ?auto_65091 ) ) ( not ( = ?auto_65084 ?auto_65091 ) ) ( not ( = ?auto_65092 ?auto_65091 ) ) ( not ( = ?auto_65093 ?auto_65091 ) ) ( not ( = ?auto_65089 ?auto_65091 ) ) ( AVAILABLE ?auto_65094 ) ( IN ?auto_65093 ?auto_65086 ) )
    :subtasks
    ( ( !UNLOAD ?auto_65094 ?auto_65093 ?auto_65086 ?auto_65087 )
      ( MAKE-ON ?auto_65083 ?auto_65084 )
      ( MAKE-ON-VERIFY ?auto_65083 ?auto_65084 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_65096 - SURFACE
      ?auto_65097 - SURFACE
    )
    :vars
    (
      ?auto_65103 - HOIST
      ?auto_65098 - PLACE
      ?auto_65105 - PLACE
      ?auto_65104 - HOIST
      ?auto_65100 - SURFACE
      ?auto_65101 - SURFACE
      ?auto_65106 - PLACE
      ?auto_65107 - HOIST
      ?auto_65099 - SURFACE
      ?auto_65108 - SURFACE
      ?auto_65102 - TRUCK
      ?auto_65109 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_65103 ?auto_65098 ) ( IS-CRATE ?auto_65096 ) ( not ( = ?auto_65096 ?auto_65097 ) ) ( not ( = ?auto_65105 ?auto_65098 ) ) ( HOIST-AT ?auto_65104 ?auto_65105 ) ( not ( = ?auto_65103 ?auto_65104 ) ) ( AVAILABLE ?auto_65104 ) ( SURFACE-AT ?auto_65096 ?auto_65105 ) ( ON ?auto_65096 ?auto_65100 ) ( CLEAR ?auto_65096 ) ( not ( = ?auto_65096 ?auto_65100 ) ) ( not ( = ?auto_65097 ?auto_65100 ) ) ( IS-CRATE ?auto_65097 ) ( not ( = ?auto_65096 ?auto_65101 ) ) ( not ( = ?auto_65097 ?auto_65101 ) ) ( not ( = ?auto_65100 ?auto_65101 ) ) ( not ( = ?auto_65106 ?auto_65098 ) ) ( not ( = ?auto_65105 ?auto_65106 ) ) ( HOIST-AT ?auto_65107 ?auto_65106 ) ( not ( = ?auto_65103 ?auto_65107 ) ) ( not ( = ?auto_65104 ?auto_65107 ) ) ( AVAILABLE ?auto_65107 ) ( SURFACE-AT ?auto_65097 ?auto_65106 ) ( ON ?auto_65097 ?auto_65099 ) ( CLEAR ?auto_65097 ) ( not ( = ?auto_65096 ?auto_65099 ) ) ( not ( = ?auto_65097 ?auto_65099 ) ) ( not ( = ?auto_65100 ?auto_65099 ) ) ( not ( = ?auto_65101 ?auto_65099 ) ) ( SURFACE-AT ?auto_65108 ?auto_65098 ) ( CLEAR ?auto_65108 ) ( IS-CRATE ?auto_65101 ) ( not ( = ?auto_65096 ?auto_65108 ) ) ( not ( = ?auto_65097 ?auto_65108 ) ) ( not ( = ?auto_65100 ?auto_65108 ) ) ( not ( = ?auto_65101 ?auto_65108 ) ) ( not ( = ?auto_65099 ?auto_65108 ) ) ( AVAILABLE ?auto_65103 ) ( IN ?auto_65101 ?auto_65102 ) ( TRUCK-AT ?auto_65102 ?auto_65109 ) ( not ( = ?auto_65109 ?auto_65098 ) ) ( not ( = ?auto_65105 ?auto_65109 ) ) ( not ( = ?auto_65106 ?auto_65109 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_65102 ?auto_65109 ?auto_65098 )
      ( MAKE-ON ?auto_65096 ?auto_65097 )
      ( MAKE-ON-VERIFY ?auto_65096 ?auto_65097 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_65110 - SURFACE
      ?auto_65111 - SURFACE
    )
    :vars
    (
      ?auto_65113 - HOIST
      ?auto_65118 - PLACE
      ?auto_65112 - PLACE
      ?auto_65120 - HOIST
      ?auto_65115 - SURFACE
      ?auto_65123 - SURFACE
      ?auto_65117 - PLACE
      ?auto_65114 - HOIST
      ?auto_65119 - SURFACE
      ?auto_65122 - SURFACE
      ?auto_65121 - TRUCK
      ?auto_65116 - PLACE
      ?auto_65124 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_65113 ?auto_65118 ) ( IS-CRATE ?auto_65110 ) ( not ( = ?auto_65110 ?auto_65111 ) ) ( not ( = ?auto_65112 ?auto_65118 ) ) ( HOIST-AT ?auto_65120 ?auto_65112 ) ( not ( = ?auto_65113 ?auto_65120 ) ) ( AVAILABLE ?auto_65120 ) ( SURFACE-AT ?auto_65110 ?auto_65112 ) ( ON ?auto_65110 ?auto_65115 ) ( CLEAR ?auto_65110 ) ( not ( = ?auto_65110 ?auto_65115 ) ) ( not ( = ?auto_65111 ?auto_65115 ) ) ( IS-CRATE ?auto_65111 ) ( not ( = ?auto_65110 ?auto_65123 ) ) ( not ( = ?auto_65111 ?auto_65123 ) ) ( not ( = ?auto_65115 ?auto_65123 ) ) ( not ( = ?auto_65117 ?auto_65118 ) ) ( not ( = ?auto_65112 ?auto_65117 ) ) ( HOIST-AT ?auto_65114 ?auto_65117 ) ( not ( = ?auto_65113 ?auto_65114 ) ) ( not ( = ?auto_65120 ?auto_65114 ) ) ( AVAILABLE ?auto_65114 ) ( SURFACE-AT ?auto_65111 ?auto_65117 ) ( ON ?auto_65111 ?auto_65119 ) ( CLEAR ?auto_65111 ) ( not ( = ?auto_65110 ?auto_65119 ) ) ( not ( = ?auto_65111 ?auto_65119 ) ) ( not ( = ?auto_65115 ?auto_65119 ) ) ( not ( = ?auto_65123 ?auto_65119 ) ) ( SURFACE-AT ?auto_65122 ?auto_65118 ) ( CLEAR ?auto_65122 ) ( IS-CRATE ?auto_65123 ) ( not ( = ?auto_65110 ?auto_65122 ) ) ( not ( = ?auto_65111 ?auto_65122 ) ) ( not ( = ?auto_65115 ?auto_65122 ) ) ( not ( = ?auto_65123 ?auto_65122 ) ) ( not ( = ?auto_65119 ?auto_65122 ) ) ( AVAILABLE ?auto_65113 ) ( TRUCK-AT ?auto_65121 ?auto_65116 ) ( not ( = ?auto_65116 ?auto_65118 ) ) ( not ( = ?auto_65112 ?auto_65116 ) ) ( not ( = ?auto_65117 ?auto_65116 ) ) ( HOIST-AT ?auto_65124 ?auto_65116 ) ( LIFTING ?auto_65124 ?auto_65123 ) ( not ( = ?auto_65113 ?auto_65124 ) ) ( not ( = ?auto_65120 ?auto_65124 ) ) ( not ( = ?auto_65114 ?auto_65124 ) ) )
    :subtasks
    ( ( !LOAD ?auto_65124 ?auto_65123 ?auto_65121 ?auto_65116 )
      ( MAKE-ON ?auto_65110 ?auto_65111 )
      ( MAKE-ON-VERIFY ?auto_65110 ?auto_65111 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_65125 - SURFACE
      ?auto_65126 - SURFACE
    )
    :vars
    (
      ?auto_65136 - HOIST
      ?auto_65132 - PLACE
      ?auto_65131 - PLACE
      ?auto_65127 - HOIST
      ?auto_65135 - SURFACE
      ?auto_65137 - SURFACE
      ?auto_65130 - PLACE
      ?auto_65129 - HOIST
      ?auto_65133 - SURFACE
      ?auto_65139 - SURFACE
      ?auto_65128 - TRUCK
      ?auto_65138 - PLACE
      ?auto_65134 - HOIST
      ?auto_65140 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_65136 ?auto_65132 ) ( IS-CRATE ?auto_65125 ) ( not ( = ?auto_65125 ?auto_65126 ) ) ( not ( = ?auto_65131 ?auto_65132 ) ) ( HOIST-AT ?auto_65127 ?auto_65131 ) ( not ( = ?auto_65136 ?auto_65127 ) ) ( AVAILABLE ?auto_65127 ) ( SURFACE-AT ?auto_65125 ?auto_65131 ) ( ON ?auto_65125 ?auto_65135 ) ( CLEAR ?auto_65125 ) ( not ( = ?auto_65125 ?auto_65135 ) ) ( not ( = ?auto_65126 ?auto_65135 ) ) ( IS-CRATE ?auto_65126 ) ( not ( = ?auto_65125 ?auto_65137 ) ) ( not ( = ?auto_65126 ?auto_65137 ) ) ( not ( = ?auto_65135 ?auto_65137 ) ) ( not ( = ?auto_65130 ?auto_65132 ) ) ( not ( = ?auto_65131 ?auto_65130 ) ) ( HOIST-AT ?auto_65129 ?auto_65130 ) ( not ( = ?auto_65136 ?auto_65129 ) ) ( not ( = ?auto_65127 ?auto_65129 ) ) ( AVAILABLE ?auto_65129 ) ( SURFACE-AT ?auto_65126 ?auto_65130 ) ( ON ?auto_65126 ?auto_65133 ) ( CLEAR ?auto_65126 ) ( not ( = ?auto_65125 ?auto_65133 ) ) ( not ( = ?auto_65126 ?auto_65133 ) ) ( not ( = ?auto_65135 ?auto_65133 ) ) ( not ( = ?auto_65137 ?auto_65133 ) ) ( SURFACE-AT ?auto_65139 ?auto_65132 ) ( CLEAR ?auto_65139 ) ( IS-CRATE ?auto_65137 ) ( not ( = ?auto_65125 ?auto_65139 ) ) ( not ( = ?auto_65126 ?auto_65139 ) ) ( not ( = ?auto_65135 ?auto_65139 ) ) ( not ( = ?auto_65137 ?auto_65139 ) ) ( not ( = ?auto_65133 ?auto_65139 ) ) ( AVAILABLE ?auto_65136 ) ( TRUCK-AT ?auto_65128 ?auto_65138 ) ( not ( = ?auto_65138 ?auto_65132 ) ) ( not ( = ?auto_65131 ?auto_65138 ) ) ( not ( = ?auto_65130 ?auto_65138 ) ) ( HOIST-AT ?auto_65134 ?auto_65138 ) ( not ( = ?auto_65136 ?auto_65134 ) ) ( not ( = ?auto_65127 ?auto_65134 ) ) ( not ( = ?auto_65129 ?auto_65134 ) ) ( AVAILABLE ?auto_65134 ) ( SURFACE-AT ?auto_65137 ?auto_65138 ) ( ON ?auto_65137 ?auto_65140 ) ( CLEAR ?auto_65137 ) ( not ( = ?auto_65125 ?auto_65140 ) ) ( not ( = ?auto_65126 ?auto_65140 ) ) ( not ( = ?auto_65135 ?auto_65140 ) ) ( not ( = ?auto_65137 ?auto_65140 ) ) ( not ( = ?auto_65133 ?auto_65140 ) ) ( not ( = ?auto_65139 ?auto_65140 ) ) )
    :subtasks
    ( ( !LIFT ?auto_65134 ?auto_65137 ?auto_65140 ?auto_65138 )
      ( MAKE-ON ?auto_65125 ?auto_65126 )
      ( MAKE-ON-VERIFY ?auto_65125 ?auto_65126 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_65141 - SURFACE
      ?auto_65142 - SURFACE
    )
    :vars
    (
      ?auto_65144 - HOIST
      ?auto_65151 - PLACE
      ?auto_65150 - PLACE
      ?auto_65155 - HOIST
      ?auto_65156 - SURFACE
      ?auto_65145 - SURFACE
      ?auto_65147 - PLACE
      ?auto_65143 - HOIST
      ?auto_65148 - SURFACE
      ?auto_65154 - SURFACE
      ?auto_65153 - PLACE
      ?auto_65149 - HOIST
      ?auto_65146 - SURFACE
      ?auto_65152 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_65144 ?auto_65151 ) ( IS-CRATE ?auto_65141 ) ( not ( = ?auto_65141 ?auto_65142 ) ) ( not ( = ?auto_65150 ?auto_65151 ) ) ( HOIST-AT ?auto_65155 ?auto_65150 ) ( not ( = ?auto_65144 ?auto_65155 ) ) ( AVAILABLE ?auto_65155 ) ( SURFACE-AT ?auto_65141 ?auto_65150 ) ( ON ?auto_65141 ?auto_65156 ) ( CLEAR ?auto_65141 ) ( not ( = ?auto_65141 ?auto_65156 ) ) ( not ( = ?auto_65142 ?auto_65156 ) ) ( IS-CRATE ?auto_65142 ) ( not ( = ?auto_65141 ?auto_65145 ) ) ( not ( = ?auto_65142 ?auto_65145 ) ) ( not ( = ?auto_65156 ?auto_65145 ) ) ( not ( = ?auto_65147 ?auto_65151 ) ) ( not ( = ?auto_65150 ?auto_65147 ) ) ( HOIST-AT ?auto_65143 ?auto_65147 ) ( not ( = ?auto_65144 ?auto_65143 ) ) ( not ( = ?auto_65155 ?auto_65143 ) ) ( AVAILABLE ?auto_65143 ) ( SURFACE-AT ?auto_65142 ?auto_65147 ) ( ON ?auto_65142 ?auto_65148 ) ( CLEAR ?auto_65142 ) ( not ( = ?auto_65141 ?auto_65148 ) ) ( not ( = ?auto_65142 ?auto_65148 ) ) ( not ( = ?auto_65156 ?auto_65148 ) ) ( not ( = ?auto_65145 ?auto_65148 ) ) ( SURFACE-AT ?auto_65154 ?auto_65151 ) ( CLEAR ?auto_65154 ) ( IS-CRATE ?auto_65145 ) ( not ( = ?auto_65141 ?auto_65154 ) ) ( not ( = ?auto_65142 ?auto_65154 ) ) ( not ( = ?auto_65156 ?auto_65154 ) ) ( not ( = ?auto_65145 ?auto_65154 ) ) ( not ( = ?auto_65148 ?auto_65154 ) ) ( AVAILABLE ?auto_65144 ) ( not ( = ?auto_65153 ?auto_65151 ) ) ( not ( = ?auto_65150 ?auto_65153 ) ) ( not ( = ?auto_65147 ?auto_65153 ) ) ( HOIST-AT ?auto_65149 ?auto_65153 ) ( not ( = ?auto_65144 ?auto_65149 ) ) ( not ( = ?auto_65155 ?auto_65149 ) ) ( not ( = ?auto_65143 ?auto_65149 ) ) ( AVAILABLE ?auto_65149 ) ( SURFACE-AT ?auto_65145 ?auto_65153 ) ( ON ?auto_65145 ?auto_65146 ) ( CLEAR ?auto_65145 ) ( not ( = ?auto_65141 ?auto_65146 ) ) ( not ( = ?auto_65142 ?auto_65146 ) ) ( not ( = ?auto_65156 ?auto_65146 ) ) ( not ( = ?auto_65145 ?auto_65146 ) ) ( not ( = ?auto_65148 ?auto_65146 ) ) ( not ( = ?auto_65154 ?auto_65146 ) ) ( TRUCK-AT ?auto_65152 ?auto_65151 ) )
    :subtasks
    ( ( !DRIVE ?auto_65152 ?auto_65151 ?auto_65153 )
      ( MAKE-ON ?auto_65141 ?auto_65142 )
      ( MAKE-ON-VERIFY ?auto_65141 ?auto_65142 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_65157 - SURFACE
      ?auto_65158 - SURFACE
    )
    :vars
    (
      ?auto_65163 - HOIST
      ?auto_65171 - PLACE
      ?auto_65164 - PLACE
      ?auto_65170 - HOIST
      ?auto_65159 - SURFACE
      ?auto_65172 - SURFACE
      ?auto_65169 - PLACE
      ?auto_65162 - HOIST
      ?auto_65165 - SURFACE
      ?auto_65166 - SURFACE
      ?auto_65167 - PLACE
      ?auto_65161 - HOIST
      ?auto_65160 - SURFACE
      ?auto_65168 - TRUCK
      ?auto_65173 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_65163 ?auto_65171 ) ( IS-CRATE ?auto_65157 ) ( not ( = ?auto_65157 ?auto_65158 ) ) ( not ( = ?auto_65164 ?auto_65171 ) ) ( HOIST-AT ?auto_65170 ?auto_65164 ) ( not ( = ?auto_65163 ?auto_65170 ) ) ( AVAILABLE ?auto_65170 ) ( SURFACE-AT ?auto_65157 ?auto_65164 ) ( ON ?auto_65157 ?auto_65159 ) ( CLEAR ?auto_65157 ) ( not ( = ?auto_65157 ?auto_65159 ) ) ( not ( = ?auto_65158 ?auto_65159 ) ) ( IS-CRATE ?auto_65158 ) ( not ( = ?auto_65157 ?auto_65172 ) ) ( not ( = ?auto_65158 ?auto_65172 ) ) ( not ( = ?auto_65159 ?auto_65172 ) ) ( not ( = ?auto_65169 ?auto_65171 ) ) ( not ( = ?auto_65164 ?auto_65169 ) ) ( HOIST-AT ?auto_65162 ?auto_65169 ) ( not ( = ?auto_65163 ?auto_65162 ) ) ( not ( = ?auto_65170 ?auto_65162 ) ) ( AVAILABLE ?auto_65162 ) ( SURFACE-AT ?auto_65158 ?auto_65169 ) ( ON ?auto_65158 ?auto_65165 ) ( CLEAR ?auto_65158 ) ( not ( = ?auto_65157 ?auto_65165 ) ) ( not ( = ?auto_65158 ?auto_65165 ) ) ( not ( = ?auto_65159 ?auto_65165 ) ) ( not ( = ?auto_65172 ?auto_65165 ) ) ( IS-CRATE ?auto_65172 ) ( not ( = ?auto_65157 ?auto_65166 ) ) ( not ( = ?auto_65158 ?auto_65166 ) ) ( not ( = ?auto_65159 ?auto_65166 ) ) ( not ( = ?auto_65172 ?auto_65166 ) ) ( not ( = ?auto_65165 ?auto_65166 ) ) ( not ( = ?auto_65167 ?auto_65171 ) ) ( not ( = ?auto_65164 ?auto_65167 ) ) ( not ( = ?auto_65169 ?auto_65167 ) ) ( HOIST-AT ?auto_65161 ?auto_65167 ) ( not ( = ?auto_65163 ?auto_65161 ) ) ( not ( = ?auto_65170 ?auto_65161 ) ) ( not ( = ?auto_65162 ?auto_65161 ) ) ( AVAILABLE ?auto_65161 ) ( SURFACE-AT ?auto_65172 ?auto_65167 ) ( ON ?auto_65172 ?auto_65160 ) ( CLEAR ?auto_65172 ) ( not ( = ?auto_65157 ?auto_65160 ) ) ( not ( = ?auto_65158 ?auto_65160 ) ) ( not ( = ?auto_65159 ?auto_65160 ) ) ( not ( = ?auto_65172 ?auto_65160 ) ) ( not ( = ?auto_65165 ?auto_65160 ) ) ( not ( = ?auto_65166 ?auto_65160 ) ) ( TRUCK-AT ?auto_65168 ?auto_65171 ) ( SURFACE-AT ?auto_65173 ?auto_65171 ) ( CLEAR ?auto_65173 ) ( LIFTING ?auto_65163 ?auto_65166 ) ( IS-CRATE ?auto_65166 ) ( not ( = ?auto_65157 ?auto_65173 ) ) ( not ( = ?auto_65158 ?auto_65173 ) ) ( not ( = ?auto_65159 ?auto_65173 ) ) ( not ( = ?auto_65172 ?auto_65173 ) ) ( not ( = ?auto_65165 ?auto_65173 ) ) ( not ( = ?auto_65166 ?auto_65173 ) ) ( not ( = ?auto_65160 ?auto_65173 ) ) )
    :subtasks
    ( ( !DROP ?auto_65163 ?auto_65166 ?auto_65173 ?auto_65171 )
      ( MAKE-ON ?auto_65157 ?auto_65158 )
      ( MAKE-ON-VERIFY ?auto_65157 ?auto_65158 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_65174 - SURFACE
      ?auto_65175 - SURFACE
    )
    :vars
    (
      ?auto_65178 - HOIST
      ?auto_65183 - PLACE
      ?auto_65185 - PLACE
      ?auto_65190 - HOIST
      ?auto_65182 - SURFACE
      ?auto_65176 - SURFACE
      ?auto_65188 - PLACE
      ?auto_65180 - HOIST
      ?auto_65186 - SURFACE
      ?auto_65184 - SURFACE
      ?auto_65189 - PLACE
      ?auto_65181 - HOIST
      ?auto_65179 - SURFACE
      ?auto_65177 - TRUCK
      ?auto_65187 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_65178 ?auto_65183 ) ( IS-CRATE ?auto_65174 ) ( not ( = ?auto_65174 ?auto_65175 ) ) ( not ( = ?auto_65185 ?auto_65183 ) ) ( HOIST-AT ?auto_65190 ?auto_65185 ) ( not ( = ?auto_65178 ?auto_65190 ) ) ( AVAILABLE ?auto_65190 ) ( SURFACE-AT ?auto_65174 ?auto_65185 ) ( ON ?auto_65174 ?auto_65182 ) ( CLEAR ?auto_65174 ) ( not ( = ?auto_65174 ?auto_65182 ) ) ( not ( = ?auto_65175 ?auto_65182 ) ) ( IS-CRATE ?auto_65175 ) ( not ( = ?auto_65174 ?auto_65176 ) ) ( not ( = ?auto_65175 ?auto_65176 ) ) ( not ( = ?auto_65182 ?auto_65176 ) ) ( not ( = ?auto_65188 ?auto_65183 ) ) ( not ( = ?auto_65185 ?auto_65188 ) ) ( HOIST-AT ?auto_65180 ?auto_65188 ) ( not ( = ?auto_65178 ?auto_65180 ) ) ( not ( = ?auto_65190 ?auto_65180 ) ) ( AVAILABLE ?auto_65180 ) ( SURFACE-AT ?auto_65175 ?auto_65188 ) ( ON ?auto_65175 ?auto_65186 ) ( CLEAR ?auto_65175 ) ( not ( = ?auto_65174 ?auto_65186 ) ) ( not ( = ?auto_65175 ?auto_65186 ) ) ( not ( = ?auto_65182 ?auto_65186 ) ) ( not ( = ?auto_65176 ?auto_65186 ) ) ( IS-CRATE ?auto_65176 ) ( not ( = ?auto_65174 ?auto_65184 ) ) ( not ( = ?auto_65175 ?auto_65184 ) ) ( not ( = ?auto_65182 ?auto_65184 ) ) ( not ( = ?auto_65176 ?auto_65184 ) ) ( not ( = ?auto_65186 ?auto_65184 ) ) ( not ( = ?auto_65189 ?auto_65183 ) ) ( not ( = ?auto_65185 ?auto_65189 ) ) ( not ( = ?auto_65188 ?auto_65189 ) ) ( HOIST-AT ?auto_65181 ?auto_65189 ) ( not ( = ?auto_65178 ?auto_65181 ) ) ( not ( = ?auto_65190 ?auto_65181 ) ) ( not ( = ?auto_65180 ?auto_65181 ) ) ( AVAILABLE ?auto_65181 ) ( SURFACE-AT ?auto_65176 ?auto_65189 ) ( ON ?auto_65176 ?auto_65179 ) ( CLEAR ?auto_65176 ) ( not ( = ?auto_65174 ?auto_65179 ) ) ( not ( = ?auto_65175 ?auto_65179 ) ) ( not ( = ?auto_65182 ?auto_65179 ) ) ( not ( = ?auto_65176 ?auto_65179 ) ) ( not ( = ?auto_65186 ?auto_65179 ) ) ( not ( = ?auto_65184 ?auto_65179 ) ) ( TRUCK-AT ?auto_65177 ?auto_65183 ) ( SURFACE-AT ?auto_65187 ?auto_65183 ) ( CLEAR ?auto_65187 ) ( IS-CRATE ?auto_65184 ) ( not ( = ?auto_65174 ?auto_65187 ) ) ( not ( = ?auto_65175 ?auto_65187 ) ) ( not ( = ?auto_65182 ?auto_65187 ) ) ( not ( = ?auto_65176 ?auto_65187 ) ) ( not ( = ?auto_65186 ?auto_65187 ) ) ( not ( = ?auto_65184 ?auto_65187 ) ) ( not ( = ?auto_65179 ?auto_65187 ) ) ( AVAILABLE ?auto_65178 ) ( IN ?auto_65184 ?auto_65177 ) )
    :subtasks
    ( ( !UNLOAD ?auto_65178 ?auto_65184 ?auto_65177 ?auto_65183 )
      ( MAKE-ON ?auto_65174 ?auto_65175 )
      ( MAKE-ON-VERIFY ?auto_65174 ?auto_65175 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_65191 - SURFACE
      ?auto_65192 - SURFACE
    )
    :vars
    (
      ?auto_65197 - HOIST
      ?auto_65204 - PLACE
      ?auto_65206 - PLACE
      ?auto_65195 - HOIST
      ?auto_65207 - SURFACE
      ?auto_65199 - SURFACE
      ?auto_65202 - PLACE
      ?auto_65194 - HOIST
      ?auto_65201 - SURFACE
      ?auto_65193 - SURFACE
      ?auto_65205 - PLACE
      ?auto_65198 - HOIST
      ?auto_65200 - SURFACE
      ?auto_65203 - SURFACE
      ?auto_65196 - TRUCK
      ?auto_65208 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_65197 ?auto_65204 ) ( IS-CRATE ?auto_65191 ) ( not ( = ?auto_65191 ?auto_65192 ) ) ( not ( = ?auto_65206 ?auto_65204 ) ) ( HOIST-AT ?auto_65195 ?auto_65206 ) ( not ( = ?auto_65197 ?auto_65195 ) ) ( AVAILABLE ?auto_65195 ) ( SURFACE-AT ?auto_65191 ?auto_65206 ) ( ON ?auto_65191 ?auto_65207 ) ( CLEAR ?auto_65191 ) ( not ( = ?auto_65191 ?auto_65207 ) ) ( not ( = ?auto_65192 ?auto_65207 ) ) ( IS-CRATE ?auto_65192 ) ( not ( = ?auto_65191 ?auto_65199 ) ) ( not ( = ?auto_65192 ?auto_65199 ) ) ( not ( = ?auto_65207 ?auto_65199 ) ) ( not ( = ?auto_65202 ?auto_65204 ) ) ( not ( = ?auto_65206 ?auto_65202 ) ) ( HOIST-AT ?auto_65194 ?auto_65202 ) ( not ( = ?auto_65197 ?auto_65194 ) ) ( not ( = ?auto_65195 ?auto_65194 ) ) ( AVAILABLE ?auto_65194 ) ( SURFACE-AT ?auto_65192 ?auto_65202 ) ( ON ?auto_65192 ?auto_65201 ) ( CLEAR ?auto_65192 ) ( not ( = ?auto_65191 ?auto_65201 ) ) ( not ( = ?auto_65192 ?auto_65201 ) ) ( not ( = ?auto_65207 ?auto_65201 ) ) ( not ( = ?auto_65199 ?auto_65201 ) ) ( IS-CRATE ?auto_65199 ) ( not ( = ?auto_65191 ?auto_65193 ) ) ( not ( = ?auto_65192 ?auto_65193 ) ) ( not ( = ?auto_65207 ?auto_65193 ) ) ( not ( = ?auto_65199 ?auto_65193 ) ) ( not ( = ?auto_65201 ?auto_65193 ) ) ( not ( = ?auto_65205 ?auto_65204 ) ) ( not ( = ?auto_65206 ?auto_65205 ) ) ( not ( = ?auto_65202 ?auto_65205 ) ) ( HOIST-AT ?auto_65198 ?auto_65205 ) ( not ( = ?auto_65197 ?auto_65198 ) ) ( not ( = ?auto_65195 ?auto_65198 ) ) ( not ( = ?auto_65194 ?auto_65198 ) ) ( AVAILABLE ?auto_65198 ) ( SURFACE-AT ?auto_65199 ?auto_65205 ) ( ON ?auto_65199 ?auto_65200 ) ( CLEAR ?auto_65199 ) ( not ( = ?auto_65191 ?auto_65200 ) ) ( not ( = ?auto_65192 ?auto_65200 ) ) ( not ( = ?auto_65207 ?auto_65200 ) ) ( not ( = ?auto_65199 ?auto_65200 ) ) ( not ( = ?auto_65201 ?auto_65200 ) ) ( not ( = ?auto_65193 ?auto_65200 ) ) ( SURFACE-AT ?auto_65203 ?auto_65204 ) ( CLEAR ?auto_65203 ) ( IS-CRATE ?auto_65193 ) ( not ( = ?auto_65191 ?auto_65203 ) ) ( not ( = ?auto_65192 ?auto_65203 ) ) ( not ( = ?auto_65207 ?auto_65203 ) ) ( not ( = ?auto_65199 ?auto_65203 ) ) ( not ( = ?auto_65201 ?auto_65203 ) ) ( not ( = ?auto_65193 ?auto_65203 ) ) ( not ( = ?auto_65200 ?auto_65203 ) ) ( AVAILABLE ?auto_65197 ) ( IN ?auto_65193 ?auto_65196 ) ( TRUCK-AT ?auto_65196 ?auto_65208 ) ( not ( = ?auto_65208 ?auto_65204 ) ) ( not ( = ?auto_65206 ?auto_65208 ) ) ( not ( = ?auto_65202 ?auto_65208 ) ) ( not ( = ?auto_65205 ?auto_65208 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_65196 ?auto_65208 ?auto_65204 )
      ( MAKE-ON ?auto_65191 ?auto_65192 )
      ( MAKE-ON-VERIFY ?auto_65191 ?auto_65192 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_65209 - SURFACE
      ?auto_65210 - SURFACE
    )
    :vars
    (
      ?auto_65225 - HOIST
      ?auto_65213 - PLACE
      ?auto_65223 - PLACE
      ?auto_65215 - HOIST
      ?auto_65219 - SURFACE
      ?auto_65212 - SURFACE
      ?auto_65218 - PLACE
      ?auto_65214 - HOIST
      ?auto_65224 - SURFACE
      ?auto_65211 - SURFACE
      ?auto_65220 - PLACE
      ?auto_65222 - HOIST
      ?auto_65221 - SURFACE
      ?auto_65216 - SURFACE
      ?auto_65217 - TRUCK
      ?auto_65226 - PLACE
      ?auto_65227 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_65225 ?auto_65213 ) ( IS-CRATE ?auto_65209 ) ( not ( = ?auto_65209 ?auto_65210 ) ) ( not ( = ?auto_65223 ?auto_65213 ) ) ( HOIST-AT ?auto_65215 ?auto_65223 ) ( not ( = ?auto_65225 ?auto_65215 ) ) ( AVAILABLE ?auto_65215 ) ( SURFACE-AT ?auto_65209 ?auto_65223 ) ( ON ?auto_65209 ?auto_65219 ) ( CLEAR ?auto_65209 ) ( not ( = ?auto_65209 ?auto_65219 ) ) ( not ( = ?auto_65210 ?auto_65219 ) ) ( IS-CRATE ?auto_65210 ) ( not ( = ?auto_65209 ?auto_65212 ) ) ( not ( = ?auto_65210 ?auto_65212 ) ) ( not ( = ?auto_65219 ?auto_65212 ) ) ( not ( = ?auto_65218 ?auto_65213 ) ) ( not ( = ?auto_65223 ?auto_65218 ) ) ( HOIST-AT ?auto_65214 ?auto_65218 ) ( not ( = ?auto_65225 ?auto_65214 ) ) ( not ( = ?auto_65215 ?auto_65214 ) ) ( AVAILABLE ?auto_65214 ) ( SURFACE-AT ?auto_65210 ?auto_65218 ) ( ON ?auto_65210 ?auto_65224 ) ( CLEAR ?auto_65210 ) ( not ( = ?auto_65209 ?auto_65224 ) ) ( not ( = ?auto_65210 ?auto_65224 ) ) ( not ( = ?auto_65219 ?auto_65224 ) ) ( not ( = ?auto_65212 ?auto_65224 ) ) ( IS-CRATE ?auto_65212 ) ( not ( = ?auto_65209 ?auto_65211 ) ) ( not ( = ?auto_65210 ?auto_65211 ) ) ( not ( = ?auto_65219 ?auto_65211 ) ) ( not ( = ?auto_65212 ?auto_65211 ) ) ( not ( = ?auto_65224 ?auto_65211 ) ) ( not ( = ?auto_65220 ?auto_65213 ) ) ( not ( = ?auto_65223 ?auto_65220 ) ) ( not ( = ?auto_65218 ?auto_65220 ) ) ( HOIST-AT ?auto_65222 ?auto_65220 ) ( not ( = ?auto_65225 ?auto_65222 ) ) ( not ( = ?auto_65215 ?auto_65222 ) ) ( not ( = ?auto_65214 ?auto_65222 ) ) ( AVAILABLE ?auto_65222 ) ( SURFACE-AT ?auto_65212 ?auto_65220 ) ( ON ?auto_65212 ?auto_65221 ) ( CLEAR ?auto_65212 ) ( not ( = ?auto_65209 ?auto_65221 ) ) ( not ( = ?auto_65210 ?auto_65221 ) ) ( not ( = ?auto_65219 ?auto_65221 ) ) ( not ( = ?auto_65212 ?auto_65221 ) ) ( not ( = ?auto_65224 ?auto_65221 ) ) ( not ( = ?auto_65211 ?auto_65221 ) ) ( SURFACE-AT ?auto_65216 ?auto_65213 ) ( CLEAR ?auto_65216 ) ( IS-CRATE ?auto_65211 ) ( not ( = ?auto_65209 ?auto_65216 ) ) ( not ( = ?auto_65210 ?auto_65216 ) ) ( not ( = ?auto_65219 ?auto_65216 ) ) ( not ( = ?auto_65212 ?auto_65216 ) ) ( not ( = ?auto_65224 ?auto_65216 ) ) ( not ( = ?auto_65211 ?auto_65216 ) ) ( not ( = ?auto_65221 ?auto_65216 ) ) ( AVAILABLE ?auto_65225 ) ( TRUCK-AT ?auto_65217 ?auto_65226 ) ( not ( = ?auto_65226 ?auto_65213 ) ) ( not ( = ?auto_65223 ?auto_65226 ) ) ( not ( = ?auto_65218 ?auto_65226 ) ) ( not ( = ?auto_65220 ?auto_65226 ) ) ( HOIST-AT ?auto_65227 ?auto_65226 ) ( LIFTING ?auto_65227 ?auto_65211 ) ( not ( = ?auto_65225 ?auto_65227 ) ) ( not ( = ?auto_65215 ?auto_65227 ) ) ( not ( = ?auto_65214 ?auto_65227 ) ) ( not ( = ?auto_65222 ?auto_65227 ) ) )
    :subtasks
    ( ( !LOAD ?auto_65227 ?auto_65211 ?auto_65217 ?auto_65226 )
      ( MAKE-ON ?auto_65209 ?auto_65210 )
      ( MAKE-ON-VERIFY ?auto_65209 ?auto_65210 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_65228 - SURFACE
      ?auto_65229 - SURFACE
    )
    :vars
    (
      ?auto_65233 - HOIST
      ?auto_65241 - PLACE
      ?auto_65234 - PLACE
      ?auto_65245 - HOIST
      ?auto_65231 - SURFACE
      ?auto_65243 - SURFACE
      ?auto_65242 - PLACE
      ?auto_65244 - HOIST
      ?auto_65232 - SURFACE
      ?auto_65239 - SURFACE
      ?auto_65236 - PLACE
      ?auto_65237 - HOIST
      ?auto_65246 - SURFACE
      ?auto_65235 - SURFACE
      ?auto_65238 - TRUCK
      ?auto_65230 - PLACE
      ?auto_65240 - HOIST
      ?auto_65247 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_65233 ?auto_65241 ) ( IS-CRATE ?auto_65228 ) ( not ( = ?auto_65228 ?auto_65229 ) ) ( not ( = ?auto_65234 ?auto_65241 ) ) ( HOIST-AT ?auto_65245 ?auto_65234 ) ( not ( = ?auto_65233 ?auto_65245 ) ) ( AVAILABLE ?auto_65245 ) ( SURFACE-AT ?auto_65228 ?auto_65234 ) ( ON ?auto_65228 ?auto_65231 ) ( CLEAR ?auto_65228 ) ( not ( = ?auto_65228 ?auto_65231 ) ) ( not ( = ?auto_65229 ?auto_65231 ) ) ( IS-CRATE ?auto_65229 ) ( not ( = ?auto_65228 ?auto_65243 ) ) ( not ( = ?auto_65229 ?auto_65243 ) ) ( not ( = ?auto_65231 ?auto_65243 ) ) ( not ( = ?auto_65242 ?auto_65241 ) ) ( not ( = ?auto_65234 ?auto_65242 ) ) ( HOIST-AT ?auto_65244 ?auto_65242 ) ( not ( = ?auto_65233 ?auto_65244 ) ) ( not ( = ?auto_65245 ?auto_65244 ) ) ( AVAILABLE ?auto_65244 ) ( SURFACE-AT ?auto_65229 ?auto_65242 ) ( ON ?auto_65229 ?auto_65232 ) ( CLEAR ?auto_65229 ) ( not ( = ?auto_65228 ?auto_65232 ) ) ( not ( = ?auto_65229 ?auto_65232 ) ) ( not ( = ?auto_65231 ?auto_65232 ) ) ( not ( = ?auto_65243 ?auto_65232 ) ) ( IS-CRATE ?auto_65243 ) ( not ( = ?auto_65228 ?auto_65239 ) ) ( not ( = ?auto_65229 ?auto_65239 ) ) ( not ( = ?auto_65231 ?auto_65239 ) ) ( not ( = ?auto_65243 ?auto_65239 ) ) ( not ( = ?auto_65232 ?auto_65239 ) ) ( not ( = ?auto_65236 ?auto_65241 ) ) ( not ( = ?auto_65234 ?auto_65236 ) ) ( not ( = ?auto_65242 ?auto_65236 ) ) ( HOIST-AT ?auto_65237 ?auto_65236 ) ( not ( = ?auto_65233 ?auto_65237 ) ) ( not ( = ?auto_65245 ?auto_65237 ) ) ( not ( = ?auto_65244 ?auto_65237 ) ) ( AVAILABLE ?auto_65237 ) ( SURFACE-AT ?auto_65243 ?auto_65236 ) ( ON ?auto_65243 ?auto_65246 ) ( CLEAR ?auto_65243 ) ( not ( = ?auto_65228 ?auto_65246 ) ) ( not ( = ?auto_65229 ?auto_65246 ) ) ( not ( = ?auto_65231 ?auto_65246 ) ) ( not ( = ?auto_65243 ?auto_65246 ) ) ( not ( = ?auto_65232 ?auto_65246 ) ) ( not ( = ?auto_65239 ?auto_65246 ) ) ( SURFACE-AT ?auto_65235 ?auto_65241 ) ( CLEAR ?auto_65235 ) ( IS-CRATE ?auto_65239 ) ( not ( = ?auto_65228 ?auto_65235 ) ) ( not ( = ?auto_65229 ?auto_65235 ) ) ( not ( = ?auto_65231 ?auto_65235 ) ) ( not ( = ?auto_65243 ?auto_65235 ) ) ( not ( = ?auto_65232 ?auto_65235 ) ) ( not ( = ?auto_65239 ?auto_65235 ) ) ( not ( = ?auto_65246 ?auto_65235 ) ) ( AVAILABLE ?auto_65233 ) ( TRUCK-AT ?auto_65238 ?auto_65230 ) ( not ( = ?auto_65230 ?auto_65241 ) ) ( not ( = ?auto_65234 ?auto_65230 ) ) ( not ( = ?auto_65242 ?auto_65230 ) ) ( not ( = ?auto_65236 ?auto_65230 ) ) ( HOIST-AT ?auto_65240 ?auto_65230 ) ( not ( = ?auto_65233 ?auto_65240 ) ) ( not ( = ?auto_65245 ?auto_65240 ) ) ( not ( = ?auto_65244 ?auto_65240 ) ) ( not ( = ?auto_65237 ?auto_65240 ) ) ( AVAILABLE ?auto_65240 ) ( SURFACE-AT ?auto_65239 ?auto_65230 ) ( ON ?auto_65239 ?auto_65247 ) ( CLEAR ?auto_65239 ) ( not ( = ?auto_65228 ?auto_65247 ) ) ( not ( = ?auto_65229 ?auto_65247 ) ) ( not ( = ?auto_65231 ?auto_65247 ) ) ( not ( = ?auto_65243 ?auto_65247 ) ) ( not ( = ?auto_65232 ?auto_65247 ) ) ( not ( = ?auto_65239 ?auto_65247 ) ) ( not ( = ?auto_65246 ?auto_65247 ) ) ( not ( = ?auto_65235 ?auto_65247 ) ) )
    :subtasks
    ( ( !LIFT ?auto_65240 ?auto_65239 ?auto_65247 ?auto_65230 )
      ( MAKE-ON ?auto_65228 ?auto_65229 )
      ( MAKE-ON-VERIFY ?auto_65228 ?auto_65229 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_65248 - SURFACE
      ?auto_65249 - SURFACE
    )
    :vars
    (
      ?auto_65256 - HOIST
      ?auto_65250 - PLACE
      ?auto_65263 - PLACE
      ?auto_65253 - HOIST
      ?auto_65257 - SURFACE
      ?auto_65267 - SURFACE
      ?auto_65262 - PLACE
      ?auto_65251 - HOIST
      ?auto_65258 - SURFACE
      ?auto_65265 - SURFACE
      ?auto_65264 - PLACE
      ?auto_65259 - HOIST
      ?auto_65252 - SURFACE
      ?auto_65260 - SURFACE
      ?auto_65254 - PLACE
      ?auto_65255 - HOIST
      ?auto_65261 - SURFACE
      ?auto_65266 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_65256 ?auto_65250 ) ( IS-CRATE ?auto_65248 ) ( not ( = ?auto_65248 ?auto_65249 ) ) ( not ( = ?auto_65263 ?auto_65250 ) ) ( HOIST-AT ?auto_65253 ?auto_65263 ) ( not ( = ?auto_65256 ?auto_65253 ) ) ( AVAILABLE ?auto_65253 ) ( SURFACE-AT ?auto_65248 ?auto_65263 ) ( ON ?auto_65248 ?auto_65257 ) ( CLEAR ?auto_65248 ) ( not ( = ?auto_65248 ?auto_65257 ) ) ( not ( = ?auto_65249 ?auto_65257 ) ) ( IS-CRATE ?auto_65249 ) ( not ( = ?auto_65248 ?auto_65267 ) ) ( not ( = ?auto_65249 ?auto_65267 ) ) ( not ( = ?auto_65257 ?auto_65267 ) ) ( not ( = ?auto_65262 ?auto_65250 ) ) ( not ( = ?auto_65263 ?auto_65262 ) ) ( HOIST-AT ?auto_65251 ?auto_65262 ) ( not ( = ?auto_65256 ?auto_65251 ) ) ( not ( = ?auto_65253 ?auto_65251 ) ) ( AVAILABLE ?auto_65251 ) ( SURFACE-AT ?auto_65249 ?auto_65262 ) ( ON ?auto_65249 ?auto_65258 ) ( CLEAR ?auto_65249 ) ( not ( = ?auto_65248 ?auto_65258 ) ) ( not ( = ?auto_65249 ?auto_65258 ) ) ( not ( = ?auto_65257 ?auto_65258 ) ) ( not ( = ?auto_65267 ?auto_65258 ) ) ( IS-CRATE ?auto_65267 ) ( not ( = ?auto_65248 ?auto_65265 ) ) ( not ( = ?auto_65249 ?auto_65265 ) ) ( not ( = ?auto_65257 ?auto_65265 ) ) ( not ( = ?auto_65267 ?auto_65265 ) ) ( not ( = ?auto_65258 ?auto_65265 ) ) ( not ( = ?auto_65264 ?auto_65250 ) ) ( not ( = ?auto_65263 ?auto_65264 ) ) ( not ( = ?auto_65262 ?auto_65264 ) ) ( HOIST-AT ?auto_65259 ?auto_65264 ) ( not ( = ?auto_65256 ?auto_65259 ) ) ( not ( = ?auto_65253 ?auto_65259 ) ) ( not ( = ?auto_65251 ?auto_65259 ) ) ( AVAILABLE ?auto_65259 ) ( SURFACE-AT ?auto_65267 ?auto_65264 ) ( ON ?auto_65267 ?auto_65252 ) ( CLEAR ?auto_65267 ) ( not ( = ?auto_65248 ?auto_65252 ) ) ( not ( = ?auto_65249 ?auto_65252 ) ) ( not ( = ?auto_65257 ?auto_65252 ) ) ( not ( = ?auto_65267 ?auto_65252 ) ) ( not ( = ?auto_65258 ?auto_65252 ) ) ( not ( = ?auto_65265 ?auto_65252 ) ) ( SURFACE-AT ?auto_65260 ?auto_65250 ) ( CLEAR ?auto_65260 ) ( IS-CRATE ?auto_65265 ) ( not ( = ?auto_65248 ?auto_65260 ) ) ( not ( = ?auto_65249 ?auto_65260 ) ) ( not ( = ?auto_65257 ?auto_65260 ) ) ( not ( = ?auto_65267 ?auto_65260 ) ) ( not ( = ?auto_65258 ?auto_65260 ) ) ( not ( = ?auto_65265 ?auto_65260 ) ) ( not ( = ?auto_65252 ?auto_65260 ) ) ( AVAILABLE ?auto_65256 ) ( not ( = ?auto_65254 ?auto_65250 ) ) ( not ( = ?auto_65263 ?auto_65254 ) ) ( not ( = ?auto_65262 ?auto_65254 ) ) ( not ( = ?auto_65264 ?auto_65254 ) ) ( HOIST-AT ?auto_65255 ?auto_65254 ) ( not ( = ?auto_65256 ?auto_65255 ) ) ( not ( = ?auto_65253 ?auto_65255 ) ) ( not ( = ?auto_65251 ?auto_65255 ) ) ( not ( = ?auto_65259 ?auto_65255 ) ) ( AVAILABLE ?auto_65255 ) ( SURFACE-AT ?auto_65265 ?auto_65254 ) ( ON ?auto_65265 ?auto_65261 ) ( CLEAR ?auto_65265 ) ( not ( = ?auto_65248 ?auto_65261 ) ) ( not ( = ?auto_65249 ?auto_65261 ) ) ( not ( = ?auto_65257 ?auto_65261 ) ) ( not ( = ?auto_65267 ?auto_65261 ) ) ( not ( = ?auto_65258 ?auto_65261 ) ) ( not ( = ?auto_65265 ?auto_65261 ) ) ( not ( = ?auto_65252 ?auto_65261 ) ) ( not ( = ?auto_65260 ?auto_65261 ) ) ( TRUCK-AT ?auto_65266 ?auto_65250 ) )
    :subtasks
    ( ( !DRIVE ?auto_65266 ?auto_65250 ?auto_65254 )
      ( MAKE-ON ?auto_65248 ?auto_65249 )
      ( MAKE-ON-VERIFY ?auto_65248 ?auto_65249 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_65268 - SURFACE
      ?auto_65269 - SURFACE
    )
    :vars
    (
      ?auto_65279 - HOIST
      ?auto_65272 - PLACE
      ?auto_65286 - PLACE
      ?auto_65283 - HOIST
      ?auto_65274 - SURFACE
      ?auto_65287 - SURFACE
      ?auto_65275 - PLACE
      ?auto_65277 - HOIST
      ?auto_65278 - SURFACE
      ?auto_65280 - SURFACE
      ?auto_65285 - PLACE
      ?auto_65284 - HOIST
      ?auto_65276 - SURFACE
      ?auto_65282 - SURFACE
      ?auto_65270 - PLACE
      ?auto_65271 - HOIST
      ?auto_65273 - SURFACE
      ?auto_65281 - TRUCK
      ?auto_65288 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_65279 ?auto_65272 ) ( IS-CRATE ?auto_65268 ) ( not ( = ?auto_65268 ?auto_65269 ) ) ( not ( = ?auto_65286 ?auto_65272 ) ) ( HOIST-AT ?auto_65283 ?auto_65286 ) ( not ( = ?auto_65279 ?auto_65283 ) ) ( AVAILABLE ?auto_65283 ) ( SURFACE-AT ?auto_65268 ?auto_65286 ) ( ON ?auto_65268 ?auto_65274 ) ( CLEAR ?auto_65268 ) ( not ( = ?auto_65268 ?auto_65274 ) ) ( not ( = ?auto_65269 ?auto_65274 ) ) ( IS-CRATE ?auto_65269 ) ( not ( = ?auto_65268 ?auto_65287 ) ) ( not ( = ?auto_65269 ?auto_65287 ) ) ( not ( = ?auto_65274 ?auto_65287 ) ) ( not ( = ?auto_65275 ?auto_65272 ) ) ( not ( = ?auto_65286 ?auto_65275 ) ) ( HOIST-AT ?auto_65277 ?auto_65275 ) ( not ( = ?auto_65279 ?auto_65277 ) ) ( not ( = ?auto_65283 ?auto_65277 ) ) ( AVAILABLE ?auto_65277 ) ( SURFACE-AT ?auto_65269 ?auto_65275 ) ( ON ?auto_65269 ?auto_65278 ) ( CLEAR ?auto_65269 ) ( not ( = ?auto_65268 ?auto_65278 ) ) ( not ( = ?auto_65269 ?auto_65278 ) ) ( not ( = ?auto_65274 ?auto_65278 ) ) ( not ( = ?auto_65287 ?auto_65278 ) ) ( IS-CRATE ?auto_65287 ) ( not ( = ?auto_65268 ?auto_65280 ) ) ( not ( = ?auto_65269 ?auto_65280 ) ) ( not ( = ?auto_65274 ?auto_65280 ) ) ( not ( = ?auto_65287 ?auto_65280 ) ) ( not ( = ?auto_65278 ?auto_65280 ) ) ( not ( = ?auto_65285 ?auto_65272 ) ) ( not ( = ?auto_65286 ?auto_65285 ) ) ( not ( = ?auto_65275 ?auto_65285 ) ) ( HOIST-AT ?auto_65284 ?auto_65285 ) ( not ( = ?auto_65279 ?auto_65284 ) ) ( not ( = ?auto_65283 ?auto_65284 ) ) ( not ( = ?auto_65277 ?auto_65284 ) ) ( AVAILABLE ?auto_65284 ) ( SURFACE-AT ?auto_65287 ?auto_65285 ) ( ON ?auto_65287 ?auto_65276 ) ( CLEAR ?auto_65287 ) ( not ( = ?auto_65268 ?auto_65276 ) ) ( not ( = ?auto_65269 ?auto_65276 ) ) ( not ( = ?auto_65274 ?auto_65276 ) ) ( not ( = ?auto_65287 ?auto_65276 ) ) ( not ( = ?auto_65278 ?auto_65276 ) ) ( not ( = ?auto_65280 ?auto_65276 ) ) ( IS-CRATE ?auto_65280 ) ( not ( = ?auto_65268 ?auto_65282 ) ) ( not ( = ?auto_65269 ?auto_65282 ) ) ( not ( = ?auto_65274 ?auto_65282 ) ) ( not ( = ?auto_65287 ?auto_65282 ) ) ( not ( = ?auto_65278 ?auto_65282 ) ) ( not ( = ?auto_65280 ?auto_65282 ) ) ( not ( = ?auto_65276 ?auto_65282 ) ) ( not ( = ?auto_65270 ?auto_65272 ) ) ( not ( = ?auto_65286 ?auto_65270 ) ) ( not ( = ?auto_65275 ?auto_65270 ) ) ( not ( = ?auto_65285 ?auto_65270 ) ) ( HOIST-AT ?auto_65271 ?auto_65270 ) ( not ( = ?auto_65279 ?auto_65271 ) ) ( not ( = ?auto_65283 ?auto_65271 ) ) ( not ( = ?auto_65277 ?auto_65271 ) ) ( not ( = ?auto_65284 ?auto_65271 ) ) ( AVAILABLE ?auto_65271 ) ( SURFACE-AT ?auto_65280 ?auto_65270 ) ( ON ?auto_65280 ?auto_65273 ) ( CLEAR ?auto_65280 ) ( not ( = ?auto_65268 ?auto_65273 ) ) ( not ( = ?auto_65269 ?auto_65273 ) ) ( not ( = ?auto_65274 ?auto_65273 ) ) ( not ( = ?auto_65287 ?auto_65273 ) ) ( not ( = ?auto_65278 ?auto_65273 ) ) ( not ( = ?auto_65280 ?auto_65273 ) ) ( not ( = ?auto_65276 ?auto_65273 ) ) ( not ( = ?auto_65282 ?auto_65273 ) ) ( TRUCK-AT ?auto_65281 ?auto_65272 ) ( SURFACE-AT ?auto_65288 ?auto_65272 ) ( CLEAR ?auto_65288 ) ( LIFTING ?auto_65279 ?auto_65282 ) ( IS-CRATE ?auto_65282 ) ( not ( = ?auto_65268 ?auto_65288 ) ) ( not ( = ?auto_65269 ?auto_65288 ) ) ( not ( = ?auto_65274 ?auto_65288 ) ) ( not ( = ?auto_65287 ?auto_65288 ) ) ( not ( = ?auto_65278 ?auto_65288 ) ) ( not ( = ?auto_65280 ?auto_65288 ) ) ( not ( = ?auto_65276 ?auto_65288 ) ) ( not ( = ?auto_65282 ?auto_65288 ) ) ( not ( = ?auto_65273 ?auto_65288 ) ) )
    :subtasks
    ( ( !DROP ?auto_65279 ?auto_65282 ?auto_65288 ?auto_65272 )
      ( MAKE-ON ?auto_65268 ?auto_65269 )
      ( MAKE-ON-VERIFY ?auto_65268 ?auto_65269 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_65289 - SURFACE
      ?auto_65290 - SURFACE
    )
    :vars
    (
      ?auto_65299 - HOIST
      ?auto_65304 - PLACE
      ?auto_65291 - PLACE
      ?auto_65295 - HOIST
      ?auto_65307 - SURFACE
      ?auto_65305 - SURFACE
      ?auto_65293 - PLACE
      ?auto_65296 - HOIST
      ?auto_65300 - SURFACE
      ?auto_65294 - SURFACE
      ?auto_65301 - PLACE
      ?auto_65298 - HOIST
      ?auto_65302 - SURFACE
      ?auto_65309 - SURFACE
      ?auto_65306 - PLACE
      ?auto_65292 - HOIST
      ?auto_65303 - SURFACE
      ?auto_65308 - TRUCK
      ?auto_65297 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_65299 ?auto_65304 ) ( IS-CRATE ?auto_65289 ) ( not ( = ?auto_65289 ?auto_65290 ) ) ( not ( = ?auto_65291 ?auto_65304 ) ) ( HOIST-AT ?auto_65295 ?auto_65291 ) ( not ( = ?auto_65299 ?auto_65295 ) ) ( AVAILABLE ?auto_65295 ) ( SURFACE-AT ?auto_65289 ?auto_65291 ) ( ON ?auto_65289 ?auto_65307 ) ( CLEAR ?auto_65289 ) ( not ( = ?auto_65289 ?auto_65307 ) ) ( not ( = ?auto_65290 ?auto_65307 ) ) ( IS-CRATE ?auto_65290 ) ( not ( = ?auto_65289 ?auto_65305 ) ) ( not ( = ?auto_65290 ?auto_65305 ) ) ( not ( = ?auto_65307 ?auto_65305 ) ) ( not ( = ?auto_65293 ?auto_65304 ) ) ( not ( = ?auto_65291 ?auto_65293 ) ) ( HOIST-AT ?auto_65296 ?auto_65293 ) ( not ( = ?auto_65299 ?auto_65296 ) ) ( not ( = ?auto_65295 ?auto_65296 ) ) ( AVAILABLE ?auto_65296 ) ( SURFACE-AT ?auto_65290 ?auto_65293 ) ( ON ?auto_65290 ?auto_65300 ) ( CLEAR ?auto_65290 ) ( not ( = ?auto_65289 ?auto_65300 ) ) ( not ( = ?auto_65290 ?auto_65300 ) ) ( not ( = ?auto_65307 ?auto_65300 ) ) ( not ( = ?auto_65305 ?auto_65300 ) ) ( IS-CRATE ?auto_65305 ) ( not ( = ?auto_65289 ?auto_65294 ) ) ( not ( = ?auto_65290 ?auto_65294 ) ) ( not ( = ?auto_65307 ?auto_65294 ) ) ( not ( = ?auto_65305 ?auto_65294 ) ) ( not ( = ?auto_65300 ?auto_65294 ) ) ( not ( = ?auto_65301 ?auto_65304 ) ) ( not ( = ?auto_65291 ?auto_65301 ) ) ( not ( = ?auto_65293 ?auto_65301 ) ) ( HOIST-AT ?auto_65298 ?auto_65301 ) ( not ( = ?auto_65299 ?auto_65298 ) ) ( not ( = ?auto_65295 ?auto_65298 ) ) ( not ( = ?auto_65296 ?auto_65298 ) ) ( AVAILABLE ?auto_65298 ) ( SURFACE-AT ?auto_65305 ?auto_65301 ) ( ON ?auto_65305 ?auto_65302 ) ( CLEAR ?auto_65305 ) ( not ( = ?auto_65289 ?auto_65302 ) ) ( not ( = ?auto_65290 ?auto_65302 ) ) ( not ( = ?auto_65307 ?auto_65302 ) ) ( not ( = ?auto_65305 ?auto_65302 ) ) ( not ( = ?auto_65300 ?auto_65302 ) ) ( not ( = ?auto_65294 ?auto_65302 ) ) ( IS-CRATE ?auto_65294 ) ( not ( = ?auto_65289 ?auto_65309 ) ) ( not ( = ?auto_65290 ?auto_65309 ) ) ( not ( = ?auto_65307 ?auto_65309 ) ) ( not ( = ?auto_65305 ?auto_65309 ) ) ( not ( = ?auto_65300 ?auto_65309 ) ) ( not ( = ?auto_65294 ?auto_65309 ) ) ( not ( = ?auto_65302 ?auto_65309 ) ) ( not ( = ?auto_65306 ?auto_65304 ) ) ( not ( = ?auto_65291 ?auto_65306 ) ) ( not ( = ?auto_65293 ?auto_65306 ) ) ( not ( = ?auto_65301 ?auto_65306 ) ) ( HOIST-AT ?auto_65292 ?auto_65306 ) ( not ( = ?auto_65299 ?auto_65292 ) ) ( not ( = ?auto_65295 ?auto_65292 ) ) ( not ( = ?auto_65296 ?auto_65292 ) ) ( not ( = ?auto_65298 ?auto_65292 ) ) ( AVAILABLE ?auto_65292 ) ( SURFACE-AT ?auto_65294 ?auto_65306 ) ( ON ?auto_65294 ?auto_65303 ) ( CLEAR ?auto_65294 ) ( not ( = ?auto_65289 ?auto_65303 ) ) ( not ( = ?auto_65290 ?auto_65303 ) ) ( not ( = ?auto_65307 ?auto_65303 ) ) ( not ( = ?auto_65305 ?auto_65303 ) ) ( not ( = ?auto_65300 ?auto_65303 ) ) ( not ( = ?auto_65294 ?auto_65303 ) ) ( not ( = ?auto_65302 ?auto_65303 ) ) ( not ( = ?auto_65309 ?auto_65303 ) ) ( TRUCK-AT ?auto_65308 ?auto_65304 ) ( SURFACE-AT ?auto_65297 ?auto_65304 ) ( CLEAR ?auto_65297 ) ( IS-CRATE ?auto_65309 ) ( not ( = ?auto_65289 ?auto_65297 ) ) ( not ( = ?auto_65290 ?auto_65297 ) ) ( not ( = ?auto_65307 ?auto_65297 ) ) ( not ( = ?auto_65305 ?auto_65297 ) ) ( not ( = ?auto_65300 ?auto_65297 ) ) ( not ( = ?auto_65294 ?auto_65297 ) ) ( not ( = ?auto_65302 ?auto_65297 ) ) ( not ( = ?auto_65309 ?auto_65297 ) ) ( not ( = ?auto_65303 ?auto_65297 ) ) ( AVAILABLE ?auto_65299 ) ( IN ?auto_65309 ?auto_65308 ) )
    :subtasks
    ( ( !UNLOAD ?auto_65299 ?auto_65309 ?auto_65308 ?auto_65304 )
      ( MAKE-ON ?auto_65289 ?auto_65290 )
      ( MAKE-ON-VERIFY ?auto_65289 ?auto_65290 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_65310 - SURFACE
      ?auto_65311 - SURFACE
    )
    :vars
    (
      ?auto_65329 - HOIST
      ?auto_65325 - PLACE
      ?auto_65330 - PLACE
      ?auto_65327 - HOIST
      ?auto_65313 - SURFACE
      ?auto_65314 - SURFACE
      ?auto_65323 - PLACE
      ?auto_65319 - HOIST
      ?auto_65312 - SURFACE
      ?auto_65322 - SURFACE
      ?auto_65315 - PLACE
      ?auto_65321 - HOIST
      ?auto_65316 - SURFACE
      ?auto_65317 - SURFACE
      ?auto_65320 - PLACE
      ?auto_65326 - HOIST
      ?auto_65328 - SURFACE
      ?auto_65318 - SURFACE
      ?auto_65324 - TRUCK
      ?auto_65331 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_65329 ?auto_65325 ) ( IS-CRATE ?auto_65310 ) ( not ( = ?auto_65310 ?auto_65311 ) ) ( not ( = ?auto_65330 ?auto_65325 ) ) ( HOIST-AT ?auto_65327 ?auto_65330 ) ( not ( = ?auto_65329 ?auto_65327 ) ) ( AVAILABLE ?auto_65327 ) ( SURFACE-AT ?auto_65310 ?auto_65330 ) ( ON ?auto_65310 ?auto_65313 ) ( CLEAR ?auto_65310 ) ( not ( = ?auto_65310 ?auto_65313 ) ) ( not ( = ?auto_65311 ?auto_65313 ) ) ( IS-CRATE ?auto_65311 ) ( not ( = ?auto_65310 ?auto_65314 ) ) ( not ( = ?auto_65311 ?auto_65314 ) ) ( not ( = ?auto_65313 ?auto_65314 ) ) ( not ( = ?auto_65323 ?auto_65325 ) ) ( not ( = ?auto_65330 ?auto_65323 ) ) ( HOIST-AT ?auto_65319 ?auto_65323 ) ( not ( = ?auto_65329 ?auto_65319 ) ) ( not ( = ?auto_65327 ?auto_65319 ) ) ( AVAILABLE ?auto_65319 ) ( SURFACE-AT ?auto_65311 ?auto_65323 ) ( ON ?auto_65311 ?auto_65312 ) ( CLEAR ?auto_65311 ) ( not ( = ?auto_65310 ?auto_65312 ) ) ( not ( = ?auto_65311 ?auto_65312 ) ) ( not ( = ?auto_65313 ?auto_65312 ) ) ( not ( = ?auto_65314 ?auto_65312 ) ) ( IS-CRATE ?auto_65314 ) ( not ( = ?auto_65310 ?auto_65322 ) ) ( not ( = ?auto_65311 ?auto_65322 ) ) ( not ( = ?auto_65313 ?auto_65322 ) ) ( not ( = ?auto_65314 ?auto_65322 ) ) ( not ( = ?auto_65312 ?auto_65322 ) ) ( not ( = ?auto_65315 ?auto_65325 ) ) ( not ( = ?auto_65330 ?auto_65315 ) ) ( not ( = ?auto_65323 ?auto_65315 ) ) ( HOIST-AT ?auto_65321 ?auto_65315 ) ( not ( = ?auto_65329 ?auto_65321 ) ) ( not ( = ?auto_65327 ?auto_65321 ) ) ( not ( = ?auto_65319 ?auto_65321 ) ) ( AVAILABLE ?auto_65321 ) ( SURFACE-AT ?auto_65314 ?auto_65315 ) ( ON ?auto_65314 ?auto_65316 ) ( CLEAR ?auto_65314 ) ( not ( = ?auto_65310 ?auto_65316 ) ) ( not ( = ?auto_65311 ?auto_65316 ) ) ( not ( = ?auto_65313 ?auto_65316 ) ) ( not ( = ?auto_65314 ?auto_65316 ) ) ( not ( = ?auto_65312 ?auto_65316 ) ) ( not ( = ?auto_65322 ?auto_65316 ) ) ( IS-CRATE ?auto_65322 ) ( not ( = ?auto_65310 ?auto_65317 ) ) ( not ( = ?auto_65311 ?auto_65317 ) ) ( not ( = ?auto_65313 ?auto_65317 ) ) ( not ( = ?auto_65314 ?auto_65317 ) ) ( not ( = ?auto_65312 ?auto_65317 ) ) ( not ( = ?auto_65322 ?auto_65317 ) ) ( not ( = ?auto_65316 ?auto_65317 ) ) ( not ( = ?auto_65320 ?auto_65325 ) ) ( not ( = ?auto_65330 ?auto_65320 ) ) ( not ( = ?auto_65323 ?auto_65320 ) ) ( not ( = ?auto_65315 ?auto_65320 ) ) ( HOIST-AT ?auto_65326 ?auto_65320 ) ( not ( = ?auto_65329 ?auto_65326 ) ) ( not ( = ?auto_65327 ?auto_65326 ) ) ( not ( = ?auto_65319 ?auto_65326 ) ) ( not ( = ?auto_65321 ?auto_65326 ) ) ( AVAILABLE ?auto_65326 ) ( SURFACE-AT ?auto_65322 ?auto_65320 ) ( ON ?auto_65322 ?auto_65328 ) ( CLEAR ?auto_65322 ) ( not ( = ?auto_65310 ?auto_65328 ) ) ( not ( = ?auto_65311 ?auto_65328 ) ) ( not ( = ?auto_65313 ?auto_65328 ) ) ( not ( = ?auto_65314 ?auto_65328 ) ) ( not ( = ?auto_65312 ?auto_65328 ) ) ( not ( = ?auto_65322 ?auto_65328 ) ) ( not ( = ?auto_65316 ?auto_65328 ) ) ( not ( = ?auto_65317 ?auto_65328 ) ) ( SURFACE-AT ?auto_65318 ?auto_65325 ) ( CLEAR ?auto_65318 ) ( IS-CRATE ?auto_65317 ) ( not ( = ?auto_65310 ?auto_65318 ) ) ( not ( = ?auto_65311 ?auto_65318 ) ) ( not ( = ?auto_65313 ?auto_65318 ) ) ( not ( = ?auto_65314 ?auto_65318 ) ) ( not ( = ?auto_65312 ?auto_65318 ) ) ( not ( = ?auto_65322 ?auto_65318 ) ) ( not ( = ?auto_65316 ?auto_65318 ) ) ( not ( = ?auto_65317 ?auto_65318 ) ) ( not ( = ?auto_65328 ?auto_65318 ) ) ( AVAILABLE ?auto_65329 ) ( IN ?auto_65317 ?auto_65324 ) ( TRUCK-AT ?auto_65324 ?auto_65331 ) ( not ( = ?auto_65331 ?auto_65325 ) ) ( not ( = ?auto_65330 ?auto_65331 ) ) ( not ( = ?auto_65323 ?auto_65331 ) ) ( not ( = ?auto_65315 ?auto_65331 ) ) ( not ( = ?auto_65320 ?auto_65331 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_65324 ?auto_65331 ?auto_65325 )
      ( MAKE-ON ?auto_65310 ?auto_65311 )
      ( MAKE-ON-VERIFY ?auto_65310 ?auto_65311 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_65332 - SURFACE
      ?auto_65333 - SURFACE
    )
    :vars
    (
      ?auto_65335 - HOIST
      ?auto_65346 - PLACE
      ?auto_65348 - PLACE
      ?auto_65340 - HOIST
      ?auto_65344 - SURFACE
      ?auto_65345 - SURFACE
      ?auto_65351 - PLACE
      ?auto_65337 - HOIST
      ?auto_65341 - SURFACE
      ?auto_65343 - SURFACE
      ?auto_65349 - PLACE
      ?auto_65352 - HOIST
      ?auto_65338 - SURFACE
      ?auto_65342 - SURFACE
      ?auto_65347 - PLACE
      ?auto_65353 - HOIST
      ?auto_65334 - SURFACE
      ?auto_65350 - SURFACE
      ?auto_65339 - TRUCK
      ?auto_65336 - PLACE
      ?auto_65354 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_65335 ?auto_65346 ) ( IS-CRATE ?auto_65332 ) ( not ( = ?auto_65332 ?auto_65333 ) ) ( not ( = ?auto_65348 ?auto_65346 ) ) ( HOIST-AT ?auto_65340 ?auto_65348 ) ( not ( = ?auto_65335 ?auto_65340 ) ) ( AVAILABLE ?auto_65340 ) ( SURFACE-AT ?auto_65332 ?auto_65348 ) ( ON ?auto_65332 ?auto_65344 ) ( CLEAR ?auto_65332 ) ( not ( = ?auto_65332 ?auto_65344 ) ) ( not ( = ?auto_65333 ?auto_65344 ) ) ( IS-CRATE ?auto_65333 ) ( not ( = ?auto_65332 ?auto_65345 ) ) ( not ( = ?auto_65333 ?auto_65345 ) ) ( not ( = ?auto_65344 ?auto_65345 ) ) ( not ( = ?auto_65351 ?auto_65346 ) ) ( not ( = ?auto_65348 ?auto_65351 ) ) ( HOIST-AT ?auto_65337 ?auto_65351 ) ( not ( = ?auto_65335 ?auto_65337 ) ) ( not ( = ?auto_65340 ?auto_65337 ) ) ( AVAILABLE ?auto_65337 ) ( SURFACE-AT ?auto_65333 ?auto_65351 ) ( ON ?auto_65333 ?auto_65341 ) ( CLEAR ?auto_65333 ) ( not ( = ?auto_65332 ?auto_65341 ) ) ( not ( = ?auto_65333 ?auto_65341 ) ) ( not ( = ?auto_65344 ?auto_65341 ) ) ( not ( = ?auto_65345 ?auto_65341 ) ) ( IS-CRATE ?auto_65345 ) ( not ( = ?auto_65332 ?auto_65343 ) ) ( not ( = ?auto_65333 ?auto_65343 ) ) ( not ( = ?auto_65344 ?auto_65343 ) ) ( not ( = ?auto_65345 ?auto_65343 ) ) ( not ( = ?auto_65341 ?auto_65343 ) ) ( not ( = ?auto_65349 ?auto_65346 ) ) ( not ( = ?auto_65348 ?auto_65349 ) ) ( not ( = ?auto_65351 ?auto_65349 ) ) ( HOIST-AT ?auto_65352 ?auto_65349 ) ( not ( = ?auto_65335 ?auto_65352 ) ) ( not ( = ?auto_65340 ?auto_65352 ) ) ( not ( = ?auto_65337 ?auto_65352 ) ) ( AVAILABLE ?auto_65352 ) ( SURFACE-AT ?auto_65345 ?auto_65349 ) ( ON ?auto_65345 ?auto_65338 ) ( CLEAR ?auto_65345 ) ( not ( = ?auto_65332 ?auto_65338 ) ) ( not ( = ?auto_65333 ?auto_65338 ) ) ( not ( = ?auto_65344 ?auto_65338 ) ) ( not ( = ?auto_65345 ?auto_65338 ) ) ( not ( = ?auto_65341 ?auto_65338 ) ) ( not ( = ?auto_65343 ?auto_65338 ) ) ( IS-CRATE ?auto_65343 ) ( not ( = ?auto_65332 ?auto_65342 ) ) ( not ( = ?auto_65333 ?auto_65342 ) ) ( not ( = ?auto_65344 ?auto_65342 ) ) ( not ( = ?auto_65345 ?auto_65342 ) ) ( not ( = ?auto_65341 ?auto_65342 ) ) ( not ( = ?auto_65343 ?auto_65342 ) ) ( not ( = ?auto_65338 ?auto_65342 ) ) ( not ( = ?auto_65347 ?auto_65346 ) ) ( not ( = ?auto_65348 ?auto_65347 ) ) ( not ( = ?auto_65351 ?auto_65347 ) ) ( not ( = ?auto_65349 ?auto_65347 ) ) ( HOIST-AT ?auto_65353 ?auto_65347 ) ( not ( = ?auto_65335 ?auto_65353 ) ) ( not ( = ?auto_65340 ?auto_65353 ) ) ( not ( = ?auto_65337 ?auto_65353 ) ) ( not ( = ?auto_65352 ?auto_65353 ) ) ( AVAILABLE ?auto_65353 ) ( SURFACE-AT ?auto_65343 ?auto_65347 ) ( ON ?auto_65343 ?auto_65334 ) ( CLEAR ?auto_65343 ) ( not ( = ?auto_65332 ?auto_65334 ) ) ( not ( = ?auto_65333 ?auto_65334 ) ) ( not ( = ?auto_65344 ?auto_65334 ) ) ( not ( = ?auto_65345 ?auto_65334 ) ) ( not ( = ?auto_65341 ?auto_65334 ) ) ( not ( = ?auto_65343 ?auto_65334 ) ) ( not ( = ?auto_65338 ?auto_65334 ) ) ( not ( = ?auto_65342 ?auto_65334 ) ) ( SURFACE-AT ?auto_65350 ?auto_65346 ) ( CLEAR ?auto_65350 ) ( IS-CRATE ?auto_65342 ) ( not ( = ?auto_65332 ?auto_65350 ) ) ( not ( = ?auto_65333 ?auto_65350 ) ) ( not ( = ?auto_65344 ?auto_65350 ) ) ( not ( = ?auto_65345 ?auto_65350 ) ) ( not ( = ?auto_65341 ?auto_65350 ) ) ( not ( = ?auto_65343 ?auto_65350 ) ) ( not ( = ?auto_65338 ?auto_65350 ) ) ( not ( = ?auto_65342 ?auto_65350 ) ) ( not ( = ?auto_65334 ?auto_65350 ) ) ( AVAILABLE ?auto_65335 ) ( TRUCK-AT ?auto_65339 ?auto_65336 ) ( not ( = ?auto_65336 ?auto_65346 ) ) ( not ( = ?auto_65348 ?auto_65336 ) ) ( not ( = ?auto_65351 ?auto_65336 ) ) ( not ( = ?auto_65349 ?auto_65336 ) ) ( not ( = ?auto_65347 ?auto_65336 ) ) ( HOIST-AT ?auto_65354 ?auto_65336 ) ( LIFTING ?auto_65354 ?auto_65342 ) ( not ( = ?auto_65335 ?auto_65354 ) ) ( not ( = ?auto_65340 ?auto_65354 ) ) ( not ( = ?auto_65337 ?auto_65354 ) ) ( not ( = ?auto_65352 ?auto_65354 ) ) ( not ( = ?auto_65353 ?auto_65354 ) ) )
    :subtasks
    ( ( !LOAD ?auto_65354 ?auto_65342 ?auto_65339 ?auto_65336 )
      ( MAKE-ON ?auto_65332 ?auto_65333 )
      ( MAKE-ON-VERIFY ?auto_65332 ?auto_65333 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_65355 - SURFACE
      ?auto_65356 - SURFACE
    )
    :vars
    (
      ?auto_65367 - HOIST
      ?auto_65376 - PLACE
      ?auto_65369 - PLACE
      ?auto_65372 - HOIST
      ?auto_65359 - SURFACE
      ?auto_65370 - SURFACE
      ?auto_65362 - PLACE
      ?auto_65364 - HOIST
      ?auto_65365 - SURFACE
      ?auto_65375 - SURFACE
      ?auto_65357 - PLACE
      ?auto_65363 - HOIST
      ?auto_65366 - SURFACE
      ?auto_65373 - SURFACE
      ?auto_65374 - PLACE
      ?auto_65358 - HOIST
      ?auto_65371 - SURFACE
      ?auto_65361 - SURFACE
      ?auto_65368 - TRUCK
      ?auto_65377 - PLACE
      ?auto_65360 - HOIST
      ?auto_65378 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_65367 ?auto_65376 ) ( IS-CRATE ?auto_65355 ) ( not ( = ?auto_65355 ?auto_65356 ) ) ( not ( = ?auto_65369 ?auto_65376 ) ) ( HOIST-AT ?auto_65372 ?auto_65369 ) ( not ( = ?auto_65367 ?auto_65372 ) ) ( AVAILABLE ?auto_65372 ) ( SURFACE-AT ?auto_65355 ?auto_65369 ) ( ON ?auto_65355 ?auto_65359 ) ( CLEAR ?auto_65355 ) ( not ( = ?auto_65355 ?auto_65359 ) ) ( not ( = ?auto_65356 ?auto_65359 ) ) ( IS-CRATE ?auto_65356 ) ( not ( = ?auto_65355 ?auto_65370 ) ) ( not ( = ?auto_65356 ?auto_65370 ) ) ( not ( = ?auto_65359 ?auto_65370 ) ) ( not ( = ?auto_65362 ?auto_65376 ) ) ( not ( = ?auto_65369 ?auto_65362 ) ) ( HOIST-AT ?auto_65364 ?auto_65362 ) ( not ( = ?auto_65367 ?auto_65364 ) ) ( not ( = ?auto_65372 ?auto_65364 ) ) ( AVAILABLE ?auto_65364 ) ( SURFACE-AT ?auto_65356 ?auto_65362 ) ( ON ?auto_65356 ?auto_65365 ) ( CLEAR ?auto_65356 ) ( not ( = ?auto_65355 ?auto_65365 ) ) ( not ( = ?auto_65356 ?auto_65365 ) ) ( not ( = ?auto_65359 ?auto_65365 ) ) ( not ( = ?auto_65370 ?auto_65365 ) ) ( IS-CRATE ?auto_65370 ) ( not ( = ?auto_65355 ?auto_65375 ) ) ( not ( = ?auto_65356 ?auto_65375 ) ) ( not ( = ?auto_65359 ?auto_65375 ) ) ( not ( = ?auto_65370 ?auto_65375 ) ) ( not ( = ?auto_65365 ?auto_65375 ) ) ( not ( = ?auto_65357 ?auto_65376 ) ) ( not ( = ?auto_65369 ?auto_65357 ) ) ( not ( = ?auto_65362 ?auto_65357 ) ) ( HOIST-AT ?auto_65363 ?auto_65357 ) ( not ( = ?auto_65367 ?auto_65363 ) ) ( not ( = ?auto_65372 ?auto_65363 ) ) ( not ( = ?auto_65364 ?auto_65363 ) ) ( AVAILABLE ?auto_65363 ) ( SURFACE-AT ?auto_65370 ?auto_65357 ) ( ON ?auto_65370 ?auto_65366 ) ( CLEAR ?auto_65370 ) ( not ( = ?auto_65355 ?auto_65366 ) ) ( not ( = ?auto_65356 ?auto_65366 ) ) ( not ( = ?auto_65359 ?auto_65366 ) ) ( not ( = ?auto_65370 ?auto_65366 ) ) ( not ( = ?auto_65365 ?auto_65366 ) ) ( not ( = ?auto_65375 ?auto_65366 ) ) ( IS-CRATE ?auto_65375 ) ( not ( = ?auto_65355 ?auto_65373 ) ) ( not ( = ?auto_65356 ?auto_65373 ) ) ( not ( = ?auto_65359 ?auto_65373 ) ) ( not ( = ?auto_65370 ?auto_65373 ) ) ( not ( = ?auto_65365 ?auto_65373 ) ) ( not ( = ?auto_65375 ?auto_65373 ) ) ( not ( = ?auto_65366 ?auto_65373 ) ) ( not ( = ?auto_65374 ?auto_65376 ) ) ( not ( = ?auto_65369 ?auto_65374 ) ) ( not ( = ?auto_65362 ?auto_65374 ) ) ( not ( = ?auto_65357 ?auto_65374 ) ) ( HOIST-AT ?auto_65358 ?auto_65374 ) ( not ( = ?auto_65367 ?auto_65358 ) ) ( not ( = ?auto_65372 ?auto_65358 ) ) ( not ( = ?auto_65364 ?auto_65358 ) ) ( not ( = ?auto_65363 ?auto_65358 ) ) ( AVAILABLE ?auto_65358 ) ( SURFACE-AT ?auto_65375 ?auto_65374 ) ( ON ?auto_65375 ?auto_65371 ) ( CLEAR ?auto_65375 ) ( not ( = ?auto_65355 ?auto_65371 ) ) ( not ( = ?auto_65356 ?auto_65371 ) ) ( not ( = ?auto_65359 ?auto_65371 ) ) ( not ( = ?auto_65370 ?auto_65371 ) ) ( not ( = ?auto_65365 ?auto_65371 ) ) ( not ( = ?auto_65375 ?auto_65371 ) ) ( not ( = ?auto_65366 ?auto_65371 ) ) ( not ( = ?auto_65373 ?auto_65371 ) ) ( SURFACE-AT ?auto_65361 ?auto_65376 ) ( CLEAR ?auto_65361 ) ( IS-CRATE ?auto_65373 ) ( not ( = ?auto_65355 ?auto_65361 ) ) ( not ( = ?auto_65356 ?auto_65361 ) ) ( not ( = ?auto_65359 ?auto_65361 ) ) ( not ( = ?auto_65370 ?auto_65361 ) ) ( not ( = ?auto_65365 ?auto_65361 ) ) ( not ( = ?auto_65375 ?auto_65361 ) ) ( not ( = ?auto_65366 ?auto_65361 ) ) ( not ( = ?auto_65373 ?auto_65361 ) ) ( not ( = ?auto_65371 ?auto_65361 ) ) ( AVAILABLE ?auto_65367 ) ( TRUCK-AT ?auto_65368 ?auto_65377 ) ( not ( = ?auto_65377 ?auto_65376 ) ) ( not ( = ?auto_65369 ?auto_65377 ) ) ( not ( = ?auto_65362 ?auto_65377 ) ) ( not ( = ?auto_65357 ?auto_65377 ) ) ( not ( = ?auto_65374 ?auto_65377 ) ) ( HOIST-AT ?auto_65360 ?auto_65377 ) ( not ( = ?auto_65367 ?auto_65360 ) ) ( not ( = ?auto_65372 ?auto_65360 ) ) ( not ( = ?auto_65364 ?auto_65360 ) ) ( not ( = ?auto_65363 ?auto_65360 ) ) ( not ( = ?auto_65358 ?auto_65360 ) ) ( AVAILABLE ?auto_65360 ) ( SURFACE-AT ?auto_65373 ?auto_65377 ) ( ON ?auto_65373 ?auto_65378 ) ( CLEAR ?auto_65373 ) ( not ( = ?auto_65355 ?auto_65378 ) ) ( not ( = ?auto_65356 ?auto_65378 ) ) ( not ( = ?auto_65359 ?auto_65378 ) ) ( not ( = ?auto_65370 ?auto_65378 ) ) ( not ( = ?auto_65365 ?auto_65378 ) ) ( not ( = ?auto_65375 ?auto_65378 ) ) ( not ( = ?auto_65366 ?auto_65378 ) ) ( not ( = ?auto_65373 ?auto_65378 ) ) ( not ( = ?auto_65371 ?auto_65378 ) ) ( not ( = ?auto_65361 ?auto_65378 ) ) )
    :subtasks
    ( ( !LIFT ?auto_65360 ?auto_65373 ?auto_65378 ?auto_65377 )
      ( MAKE-ON ?auto_65355 ?auto_65356 )
      ( MAKE-ON-VERIFY ?auto_65355 ?auto_65356 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_65379 - SURFACE
      ?auto_65380 - SURFACE
    )
    :vars
    (
      ?auto_65384 - HOIST
      ?auto_65401 - PLACE
      ?auto_65392 - PLACE
      ?auto_65382 - HOIST
      ?auto_65393 - SURFACE
      ?auto_65388 - SURFACE
      ?auto_65381 - PLACE
      ?auto_65387 - HOIST
      ?auto_65383 - SURFACE
      ?auto_65400 - SURFACE
      ?auto_65397 - PLACE
      ?auto_65385 - HOIST
      ?auto_65391 - SURFACE
      ?auto_65396 - SURFACE
      ?auto_65399 - PLACE
      ?auto_65398 - HOIST
      ?auto_65394 - SURFACE
      ?auto_65389 - SURFACE
      ?auto_65395 - PLACE
      ?auto_65402 - HOIST
      ?auto_65386 - SURFACE
      ?auto_65390 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_65384 ?auto_65401 ) ( IS-CRATE ?auto_65379 ) ( not ( = ?auto_65379 ?auto_65380 ) ) ( not ( = ?auto_65392 ?auto_65401 ) ) ( HOIST-AT ?auto_65382 ?auto_65392 ) ( not ( = ?auto_65384 ?auto_65382 ) ) ( AVAILABLE ?auto_65382 ) ( SURFACE-AT ?auto_65379 ?auto_65392 ) ( ON ?auto_65379 ?auto_65393 ) ( CLEAR ?auto_65379 ) ( not ( = ?auto_65379 ?auto_65393 ) ) ( not ( = ?auto_65380 ?auto_65393 ) ) ( IS-CRATE ?auto_65380 ) ( not ( = ?auto_65379 ?auto_65388 ) ) ( not ( = ?auto_65380 ?auto_65388 ) ) ( not ( = ?auto_65393 ?auto_65388 ) ) ( not ( = ?auto_65381 ?auto_65401 ) ) ( not ( = ?auto_65392 ?auto_65381 ) ) ( HOIST-AT ?auto_65387 ?auto_65381 ) ( not ( = ?auto_65384 ?auto_65387 ) ) ( not ( = ?auto_65382 ?auto_65387 ) ) ( AVAILABLE ?auto_65387 ) ( SURFACE-AT ?auto_65380 ?auto_65381 ) ( ON ?auto_65380 ?auto_65383 ) ( CLEAR ?auto_65380 ) ( not ( = ?auto_65379 ?auto_65383 ) ) ( not ( = ?auto_65380 ?auto_65383 ) ) ( not ( = ?auto_65393 ?auto_65383 ) ) ( not ( = ?auto_65388 ?auto_65383 ) ) ( IS-CRATE ?auto_65388 ) ( not ( = ?auto_65379 ?auto_65400 ) ) ( not ( = ?auto_65380 ?auto_65400 ) ) ( not ( = ?auto_65393 ?auto_65400 ) ) ( not ( = ?auto_65388 ?auto_65400 ) ) ( not ( = ?auto_65383 ?auto_65400 ) ) ( not ( = ?auto_65397 ?auto_65401 ) ) ( not ( = ?auto_65392 ?auto_65397 ) ) ( not ( = ?auto_65381 ?auto_65397 ) ) ( HOIST-AT ?auto_65385 ?auto_65397 ) ( not ( = ?auto_65384 ?auto_65385 ) ) ( not ( = ?auto_65382 ?auto_65385 ) ) ( not ( = ?auto_65387 ?auto_65385 ) ) ( AVAILABLE ?auto_65385 ) ( SURFACE-AT ?auto_65388 ?auto_65397 ) ( ON ?auto_65388 ?auto_65391 ) ( CLEAR ?auto_65388 ) ( not ( = ?auto_65379 ?auto_65391 ) ) ( not ( = ?auto_65380 ?auto_65391 ) ) ( not ( = ?auto_65393 ?auto_65391 ) ) ( not ( = ?auto_65388 ?auto_65391 ) ) ( not ( = ?auto_65383 ?auto_65391 ) ) ( not ( = ?auto_65400 ?auto_65391 ) ) ( IS-CRATE ?auto_65400 ) ( not ( = ?auto_65379 ?auto_65396 ) ) ( not ( = ?auto_65380 ?auto_65396 ) ) ( not ( = ?auto_65393 ?auto_65396 ) ) ( not ( = ?auto_65388 ?auto_65396 ) ) ( not ( = ?auto_65383 ?auto_65396 ) ) ( not ( = ?auto_65400 ?auto_65396 ) ) ( not ( = ?auto_65391 ?auto_65396 ) ) ( not ( = ?auto_65399 ?auto_65401 ) ) ( not ( = ?auto_65392 ?auto_65399 ) ) ( not ( = ?auto_65381 ?auto_65399 ) ) ( not ( = ?auto_65397 ?auto_65399 ) ) ( HOIST-AT ?auto_65398 ?auto_65399 ) ( not ( = ?auto_65384 ?auto_65398 ) ) ( not ( = ?auto_65382 ?auto_65398 ) ) ( not ( = ?auto_65387 ?auto_65398 ) ) ( not ( = ?auto_65385 ?auto_65398 ) ) ( AVAILABLE ?auto_65398 ) ( SURFACE-AT ?auto_65400 ?auto_65399 ) ( ON ?auto_65400 ?auto_65394 ) ( CLEAR ?auto_65400 ) ( not ( = ?auto_65379 ?auto_65394 ) ) ( not ( = ?auto_65380 ?auto_65394 ) ) ( not ( = ?auto_65393 ?auto_65394 ) ) ( not ( = ?auto_65388 ?auto_65394 ) ) ( not ( = ?auto_65383 ?auto_65394 ) ) ( not ( = ?auto_65400 ?auto_65394 ) ) ( not ( = ?auto_65391 ?auto_65394 ) ) ( not ( = ?auto_65396 ?auto_65394 ) ) ( SURFACE-AT ?auto_65389 ?auto_65401 ) ( CLEAR ?auto_65389 ) ( IS-CRATE ?auto_65396 ) ( not ( = ?auto_65379 ?auto_65389 ) ) ( not ( = ?auto_65380 ?auto_65389 ) ) ( not ( = ?auto_65393 ?auto_65389 ) ) ( not ( = ?auto_65388 ?auto_65389 ) ) ( not ( = ?auto_65383 ?auto_65389 ) ) ( not ( = ?auto_65400 ?auto_65389 ) ) ( not ( = ?auto_65391 ?auto_65389 ) ) ( not ( = ?auto_65396 ?auto_65389 ) ) ( not ( = ?auto_65394 ?auto_65389 ) ) ( AVAILABLE ?auto_65384 ) ( not ( = ?auto_65395 ?auto_65401 ) ) ( not ( = ?auto_65392 ?auto_65395 ) ) ( not ( = ?auto_65381 ?auto_65395 ) ) ( not ( = ?auto_65397 ?auto_65395 ) ) ( not ( = ?auto_65399 ?auto_65395 ) ) ( HOIST-AT ?auto_65402 ?auto_65395 ) ( not ( = ?auto_65384 ?auto_65402 ) ) ( not ( = ?auto_65382 ?auto_65402 ) ) ( not ( = ?auto_65387 ?auto_65402 ) ) ( not ( = ?auto_65385 ?auto_65402 ) ) ( not ( = ?auto_65398 ?auto_65402 ) ) ( AVAILABLE ?auto_65402 ) ( SURFACE-AT ?auto_65396 ?auto_65395 ) ( ON ?auto_65396 ?auto_65386 ) ( CLEAR ?auto_65396 ) ( not ( = ?auto_65379 ?auto_65386 ) ) ( not ( = ?auto_65380 ?auto_65386 ) ) ( not ( = ?auto_65393 ?auto_65386 ) ) ( not ( = ?auto_65388 ?auto_65386 ) ) ( not ( = ?auto_65383 ?auto_65386 ) ) ( not ( = ?auto_65400 ?auto_65386 ) ) ( not ( = ?auto_65391 ?auto_65386 ) ) ( not ( = ?auto_65396 ?auto_65386 ) ) ( not ( = ?auto_65394 ?auto_65386 ) ) ( not ( = ?auto_65389 ?auto_65386 ) ) ( TRUCK-AT ?auto_65390 ?auto_65401 ) )
    :subtasks
    ( ( !DRIVE ?auto_65390 ?auto_65401 ?auto_65395 )
      ( MAKE-ON ?auto_65379 ?auto_65380 )
      ( MAKE-ON-VERIFY ?auto_65379 ?auto_65380 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_65403 - SURFACE
      ?auto_65404 - SURFACE
    )
    :vars
    (
      ?auto_65417 - HOIST
      ?auto_65406 - PLACE
      ?auto_65415 - PLACE
      ?auto_65407 - HOIST
      ?auto_65411 - SURFACE
      ?auto_65408 - SURFACE
      ?auto_65426 - PLACE
      ?auto_65416 - HOIST
      ?auto_65423 - SURFACE
      ?auto_65420 - SURFACE
      ?auto_65414 - PLACE
      ?auto_65425 - HOIST
      ?auto_65409 - SURFACE
      ?auto_65422 - SURFACE
      ?auto_65419 - PLACE
      ?auto_65405 - HOIST
      ?auto_65412 - SURFACE
      ?auto_65410 - SURFACE
      ?auto_65418 - PLACE
      ?auto_65421 - HOIST
      ?auto_65413 - SURFACE
      ?auto_65424 - TRUCK
      ?auto_65427 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_65417 ?auto_65406 ) ( IS-CRATE ?auto_65403 ) ( not ( = ?auto_65403 ?auto_65404 ) ) ( not ( = ?auto_65415 ?auto_65406 ) ) ( HOIST-AT ?auto_65407 ?auto_65415 ) ( not ( = ?auto_65417 ?auto_65407 ) ) ( AVAILABLE ?auto_65407 ) ( SURFACE-AT ?auto_65403 ?auto_65415 ) ( ON ?auto_65403 ?auto_65411 ) ( CLEAR ?auto_65403 ) ( not ( = ?auto_65403 ?auto_65411 ) ) ( not ( = ?auto_65404 ?auto_65411 ) ) ( IS-CRATE ?auto_65404 ) ( not ( = ?auto_65403 ?auto_65408 ) ) ( not ( = ?auto_65404 ?auto_65408 ) ) ( not ( = ?auto_65411 ?auto_65408 ) ) ( not ( = ?auto_65426 ?auto_65406 ) ) ( not ( = ?auto_65415 ?auto_65426 ) ) ( HOIST-AT ?auto_65416 ?auto_65426 ) ( not ( = ?auto_65417 ?auto_65416 ) ) ( not ( = ?auto_65407 ?auto_65416 ) ) ( AVAILABLE ?auto_65416 ) ( SURFACE-AT ?auto_65404 ?auto_65426 ) ( ON ?auto_65404 ?auto_65423 ) ( CLEAR ?auto_65404 ) ( not ( = ?auto_65403 ?auto_65423 ) ) ( not ( = ?auto_65404 ?auto_65423 ) ) ( not ( = ?auto_65411 ?auto_65423 ) ) ( not ( = ?auto_65408 ?auto_65423 ) ) ( IS-CRATE ?auto_65408 ) ( not ( = ?auto_65403 ?auto_65420 ) ) ( not ( = ?auto_65404 ?auto_65420 ) ) ( not ( = ?auto_65411 ?auto_65420 ) ) ( not ( = ?auto_65408 ?auto_65420 ) ) ( not ( = ?auto_65423 ?auto_65420 ) ) ( not ( = ?auto_65414 ?auto_65406 ) ) ( not ( = ?auto_65415 ?auto_65414 ) ) ( not ( = ?auto_65426 ?auto_65414 ) ) ( HOIST-AT ?auto_65425 ?auto_65414 ) ( not ( = ?auto_65417 ?auto_65425 ) ) ( not ( = ?auto_65407 ?auto_65425 ) ) ( not ( = ?auto_65416 ?auto_65425 ) ) ( AVAILABLE ?auto_65425 ) ( SURFACE-AT ?auto_65408 ?auto_65414 ) ( ON ?auto_65408 ?auto_65409 ) ( CLEAR ?auto_65408 ) ( not ( = ?auto_65403 ?auto_65409 ) ) ( not ( = ?auto_65404 ?auto_65409 ) ) ( not ( = ?auto_65411 ?auto_65409 ) ) ( not ( = ?auto_65408 ?auto_65409 ) ) ( not ( = ?auto_65423 ?auto_65409 ) ) ( not ( = ?auto_65420 ?auto_65409 ) ) ( IS-CRATE ?auto_65420 ) ( not ( = ?auto_65403 ?auto_65422 ) ) ( not ( = ?auto_65404 ?auto_65422 ) ) ( not ( = ?auto_65411 ?auto_65422 ) ) ( not ( = ?auto_65408 ?auto_65422 ) ) ( not ( = ?auto_65423 ?auto_65422 ) ) ( not ( = ?auto_65420 ?auto_65422 ) ) ( not ( = ?auto_65409 ?auto_65422 ) ) ( not ( = ?auto_65419 ?auto_65406 ) ) ( not ( = ?auto_65415 ?auto_65419 ) ) ( not ( = ?auto_65426 ?auto_65419 ) ) ( not ( = ?auto_65414 ?auto_65419 ) ) ( HOIST-AT ?auto_65405 ?auto_65419 ) ( not ( = ?auto_65417 ?auto_65405 ) ) ( not ( = ?auto_65407 ?auto_65405 ) ) ( not ( = ?auto_65416 ?auto_65405 ) ) ( not ( = ?auto_65425 ?auto_65405 ) ) ( AVAILABLE ?auto_65405 ) ( SURFACE-AT ?auto_65420 ?auto_65419 ) ( ON ?auto_65420 ?auto_65412 ) ( CLEAR ?auto_65420 ) ( not ( = ?auto_65403 ?auto_65412 ) ) ( not ( = ?auto_65404 ?auto_65412 ) ) ( not ( = ?auto_65411 ?auto_65412 ) ) ( not ( = ?auto_65408 ?auto_65412 ) ) ( not ( = ?auto_65423 ?auto_65412 ) ) ( not ( = ?auto_65420 ?auto_65412 ) ) ( not ( = ?auto_65409 ?auto_65412 ) ) ( not ( = ?auto_65422 ?auto_65412 ) ) ( IS-CRATE ?auto_65422 ) ( not ( = ?auto_65403 ?auto_65410 ) ) ( not ( = ?auto_65404 ?auto_65410 ) ) ( not ( = ?auto_65411 ?auto_65410 ) ) ( not ( = ?auto_65408 ?auto_65410 ) ) ( not ( = ?auto_65423 ?auto_65410 ) ) ( not ( = ?auto_65420 ?auto_65410 ) ) ( not ( = ?auto_65409 ?auto_65410 ) ) ( not ( = ?auto_65422 ?auto_65410 ) ) ( not ( = ?auto_65412 ?auto_65410 ) ) ( not ( = ?auto_65418 ?auto_65406 ) ) ( not ( = ?auto_65415 ?auto_65418 ) ) ( not ( = ?auto_65426 ?auto_65418 ) ) ( not ( = ?auto_65414 ?auto_65418 ) ) ( not ( = ?auto_65419 ?auto_65418 ) ) ( HOIST-AT ?auto_65421 ?auto_65418 ) ( not ( = ?auto_65417 ?auto_65421 ) ) ( not ( = ?auto_65407 ?auto_65421 ) ) ( not ( = ?auto_65416 ?auto_65421 ) ) ( not ( = ?auto_65425 ?auto_65421 ) ) ( not ( = ?auto_65405 ?auto_65421 ) ) ( AVAILABLE ?auto_65421 ) ( SURFACE-AT ?auto_65422 ?auto_65418 ) ( ON ?auto_65422 ?auto_65413 ) ( CLEAR ?auto_65422 ) ( not ( = ?auto_65403 ?auto_65413 ) ) ( not ( = ?auto_65404 ?auto_65413 ) ) ( not ( = ?auto_65411 ?auto_65413 ) ) ( not ( = ?auto_65408 ?auto_65413 ) ) ( not ( = ?auto_65423 ?auto_65413 ) ) ( not ( = ?auto_65420 ?auto_65413 ) ) ( not ( = ?auto_65409 ?auto_65413 ) ) ( not ( = ?auto_65422 ?auto_65413 ) ) ( not ( = ?auto_65412 ?auto_65413 ) ) ( not ( = ?auto_65410 ?auto_65413 ) ) ( TRUCK-AT ?auto_65424 ?auto_65406 ) ( SURFACE-AT ?auto_65427 ?auto_65406 ) ( CLEAR ?auto_65427 ) ( LIFTING ?auto_65417 ?auto_65410 ) ( IS-CRATE ?auto_65410 ) ( not ( = ?auto_65403 ?auto_65427 ) ) ( not ( = ?auto_65404 ?auto_65427 ) ) ( not ( = ?auto_65411 ?auto_65427 ) ) ( not ( = ?auto_65408 ?auto_65427 ) ) ( not ( = ?auto_65423 ?auto_65427 ) ) ( not ( = ?auto_65420 ?auto_65427 ) ) ( not ( = ?auto_65409 ?auto_65427 ) ) ( not ( = ?auto_65422 ?auto_65427 ) ) ( not ( = ?auto_65412 ?auto_65427 ) ) ( not ( = ?auto_65410 ?auto_65427 ) ) ( not ( = ?auto_65413 ?auto_65427 ) ) )
    :subtasks
    ( ( !DROP ?auto_65417 ?auto_65410 ?auto_65427 ?auto_65406 )
      ( MAKE-ON ?auto_65403 ?auto_65404 )
      ( MAKE-ON-VERIFY ?auto_65403 ?auto_65404 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_65428 - SURFACE
      ?auto_65429 - SURFACE
    )
    :vars
    (
      ?auto_65442 - HOIST
      ?auto_65443 - PLACE
      ?auto_65431 - PLACE
      ?auto_65434 - HOIST
      ?auto_65440 - SURFACE
      ?auto_65449 - SURFACE
      ?auto_65452 - PLACE
      ?auto_65430 - HOIST
      ?auto_65435 - SURFACE
      ?auto_65438 - SURFACE
      ?auto_65432 - PLACE
      ?auto_65445 - HOIST
      ?auto_65444 - SURFACE
      ?auto_65447 - SURFACE
      ?auto_65446 - PLACE
      ?auto_65439 - HOIST
      ?auto_65448 - SURFACE
      ?auto_65433 - SURFACE
      ?auto_65437 - PLACE
      ?auto_65451 - HOIST
      ?auto_65450 - SURFACE
      ?auto_65436 - TRUCK
      ?auto_65441 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_65442 ?auto_65443 ) ( IS-CRATE ?auto_65428 ) ( not ( = ?auto_65428 ?auto_65429 ) ) ( not ( = ?auto_65431 ?auto_65443 ) ) ( HOIST-AT ?auto_65434 ?auto_65431 ) ( not ( = ?auto_65442 ?auto_65434 ) ) ( AVAILABLE ?auto_65434 ) ( SURFACE-AT ?auto_65428 ?auto_65431 ) ( ON ?auto_65428 ?auto_65440 ) ( CLEAR ?auto_65428 ) ( not ( = ?auto_65428 ?auto_65440 ) ) ( not ( = ?auto_65429 ?auto_65440 ) ) ( IS-CRATE ?auto_65429 ) ( not ( = ?auto_65428 ?auto_65449 ) ) ( not ( = ?auto_65429 ?auto_65449 ) ) ( not ( = ?auto_65440 ?auto_65449 ) ) ( not ( = ?auto_65452 ?auto_65443 ) ) ( not ( = ?auto_65431 ?auto_65452 ) ) ( HOIST-AT ?auto_65430 ?auto_65452 ) ( not ( = ?auto_65442 ?auto_65430 ) ) ( not ( = ?auto_65434 ?auto_65430 ) ) ( AVAILABLE ?auto_65430 ) ( SURFACE-AT ?auto_65429 ?auto_65452 ) ( ON ?auto_65429 ?auto_65435 ) ( CLEAR ?auto_65429 ) ( not ( = ?auto_65428 ?auto_65435 ) ) ( not ( = ?auto_65429 ?auto_65435 ) ) ( not ( = ?auto_65440 ?auto_65435 ) ) ( not ( = ?auto_65449 ?auto_65435 ) ) ( IS-CRATE ?auto_65449 ) ( not ( = ?auto_65428 ?auto_65438 ) ) ( not ( = ?auto_65429 ?auto_65438 ) ) ( not ( = ?auto_65440 ?auto_65438 ) ) ( not ( = ?auto_65449 ?auto_65438 ) ) ( not ( = ?auto_65435 ?auto_65438 ) ) ( not ( = ?auto_65432 ?auto_65443 ) ) ( not ( = ?auto_65431 ?auto_65432 ) ) ( not ( = ?auto_65452 ?auto_65432 ) ) ( HOIST-AT ?auto_65445 ?auto_65432 ) ( not ( = ?auto_65442 ?auto_65445 ) ) ( not ( = ?auto_65434 ?auto_65445 ) ) ( not ( = ?auto_65430 ?auto_65445 ) ) ( AVAILABLE ?auto_65445 ) ( SURFACE-AT ?auto_65449 ?auto_65432 ) ( ON ?auto_65449 ?auto_65444 ) ( CLEAR ?auto_65449 ) ( not ( = ?auto_65428 ?auto_65444 ) ) ( not ( = ?auto_65429 ?auto_65444 ) ) ( not ( = ?auto_65440 ?auto_65444 ) ) ( not ( = ?auto_65449 ?auto_65444 ) ) ( not ( = ?auto_65435 ?auto_65444 ) ) ( not ( = ?auto_65438 ?auto_65444 ) ) ( IS-CRATE ?auto_65438 ) ( not ( = ?auto_65428 ?auto_65447 ) ) ( not ( = ?auto_65429 ?auto_65447 ) ) ( not ( = ?auto_65440 ?auto_65447 ) ) ( not ( = ?auto_65449 ?auto_65447 ) ) ( not ( = ?auto_65435 ?auto_65447 ) ) ( not ( = ?auto_65438 ?auto_65447 ) ) ( not ( = ?auto_65444 ?auto_65447 ) ) ( not ( = ?auto_65446 ?auto_65443 ) ) ( not ( = ?auto_65431 ?auto_65446 ) ) ( not ( = ?auto_65452 ?auto_65446 ) ) ( not ( = ?auto_65432 ?auto_65446 ) ) ( HOIST-AT ?auto_65439 ?auto_65446 ) ( not ( = ?auto_65442 ?auto_65439 ) ) ( not ( = ?auto_65434 ?auto_65439 ) ) ( not ( = ?auto_65430 ?auto_65439 ) ) ( not ( = ?auto_65445 ?auto_65439 ) ) ( AVAILABLE ?auto_65439 ) ( SURFACE-AT ?auto_65438 ?auto_65446 ) ( ON ?auto_65438 ?auto_65448 ) ( CLEAR ?auto_65438 ) ( not ( = ?auto_65428 ?auto_65448 ) ) ( not ( = ?auto_65429 ?auto_65448 ) ) ( not ( = ?auto_65440 ?auto_65448 ) ) ( not ( = ?auto_65449 ?auto_65448 ) ) ( not ( = ?auto_65435 ?auto_65448 ) ) ( not ( = ?auto_65438 ?auto_65448 ) ) ( not ( = ?auto_65444 ?auto_65448 ) ) ( not ( = ?auto_65447 ?auto_65448 ) ) ( IS-CRATE ?auto_65447 ) ( not ( = ?auto_65428 ?auto_65433 ) ) ( not ( = ?auto_65429 ?auto_65433 ) ) ( not ( = ?auto_65440 ?auto_65433 ) ) ( not ( = ?auto_65449 ?auto_65433 ) ) ( not ( = ?auto_65435 ?auto_65433 ) ) ( not ( = ?auto_65438 ?auto_65433 ) ) ( not ( = ?auto_65444 ?auto_65433 ) ) ( not ( = ?auto_65447 ?auto_65433 ) ) ( not ( = ?auto_65448 ?auto_65433 ) ) ( not ( = ?auto_65437 ?auto_65443 ) ) ( not ( = ?auto_65431 ?auto_65437 ) ) ( not ( = ?auto_65452 ?auto_65437 ) ) ( not ( = ?auto_65432 ?auto_65437 ) ) ( not ( = ?auto_65446 ?auto_65437 ) ) ( HOIST-AT ?auto_65451 ?auto_65437 ) ( not ( = ?auto_65442 ?auto_65451 ) ) ( not ( = ?auto_65434 ?auto_65451 ) ) ( not ( = ?auto_65430 ?auto_65451 ) ) ( not ( = ?auto_65445 ?auto_65451 ) ) ( not ( = ?auto_65439 ?auto_65451 ) ) ( AVAILABLE ?auto_65451 ) ( SURFACE-AT ?auto_65447 ?auto_65437 ) ( ON ?auto_65447 ?auto_65450 ) ( CLEAR ?auto_65447 ) ( not ( = ?auto_65428 ?auto_65450 ) ) ( not ( = ?auto_65429 ?auto_65450 ) ) ( not ( = ?auto_65440 ?auto_65450 ) ) ( not ( = ?auto_65449 ?auto_65450 ) ) ( not ( = ?auto_65435 ?auto_65450 ) ) ( not ( = ?auto_65438 ?auto_65450 ) ) ( not ( = ?auto_65444 ?auto_65450 ) ) ( not ( = ?auto_65447 ?auto_65450 ) ) ( not ( = ?auto_65448 ?auto_65450 ) ) ( not ( = ?auto_65433 ?auto_65450 ) ) ( TRUCK-AT ?auto_65436 ?auto_65443 ) ( SURFACE-AT ?auto_65441 ?auto_65443 ) ( CLEAR ?auto_65441 ) ( IS-CRATE ?auto_65433 ) ( not ( = ?auto_65428 ?auto_65441 ) ) ( not ( = ?auto_65429 ?auto_65441 ) ) ( not ( = ?auto_65440 ?auto_65441 ) ) ( not ( = ?auto_65449 ?auto_65441 ) ) ( not ( = ?auto_65435 ?auto_65441 ) ) ( not ( = ?auto_65438 ?auto_65441 ) ) ( not ( = ?auto_65444 ?auto_65441 ) ) ( not ( = ?auto_65447 ?auto_65441 ) ) ( not ( = ?auto_65448 ?auto_65441 ) ) ( not ( = ?auto_65433 ?auto_65441 ) ) ( not ( = ?auto_65450 ?auto_65441 ) ) ( AVAILABLE ?auto_65442 ) ( IN ?auto_65433 ?auto_65436 ) )
    :subtasks
    ( ( !UNLOAD ?auto_65442 ?auto_65433 ?auto_65436 ?auto_65443 )
      ( MAKE-ON ?auto_65428 ?auto_65429 )
      ( MAKE-ON-VERIFY ?auto_65428 ?auto_65429 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_65453 - SURFACE
      ?auto_65454 - SURFACE
    )
    :vars
    (
      ?auto_65457 - HOIST
      ?auto_65462 - PLACE
      ?auto_65467 - PLACE
      ?auto_65455 - HOIST
      ?auto_65469 - SURFACE
      ?auto_65476 - SURFACE
      ?auto_65475 - PLACE
      ?auto_65456 - HOIST
      ?auto_65466 - SURFACE
      ?auto_65465 - SURFACE
      ?auto_65470 - PLACE
      ?auto_65473 - HOIST
      ?auto_65460 - SURFACE
      ?auto_65472 - SURFACE
      ?auto_65471 - PLACE
      ?auto_65463 - HOIST
      ?auto_65464 - SURFACE
      ?auto_65459 - SURFACE
      ?auto_65477 - PLACE
      ?auto_65474 - HOIST
      ?auto_65458 - SURFACE
      ?auto_65461 - SURFACE
      ?auto_65468 - TRUCK
      ?auto_65478 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_65457 ?auto_65462 ) ( IS-CRATE ?auto_65453 ) ( not ( = ?auto_65453 ?auto_65454 ) ) ( not ( = ?auto_65467 ?auto_65462 ) ) ( HOIST-AT ?auto_65455 ?auto_65467 ) ( not ( = ?auto_65457 ?auto_65455 ) ) ( AVAILABLE ?auto_65455 ) ( SURFACE-AT ?auto_65453 ?auto_65467 ) ( ON ?auto_65453 ?auto_65469 ) ( CLEAR ?auto_65453 ) ( not ( = ?auto_65453 ?auto_65469 ) ) ( not ( = ?auto_65454 ?auto_65469 ) ) ( IS-CRATE ?auto_65454 ) ( not ( = ?auto_65453 ?auto_65476 ) ) ( not ( = ?auto_65454 ?auto_65476 ) ) ( not ( = ?auto_65469 ?auto_65476 ) ) ( not ( = ?auto_65475 ?auto_65462 ) ) ( not ( = ?auto_65467 ?auto_65475 ) ) ( HOIST-AT ?auto_65456 ?auto_65475 ) ( not ( = ?auto_65457 ?auto_65456 ) ) ( not ( = ?auto_65455 ?auto_65456 ) ) ( AVAILABLE ?auto_65456 ) ( SURFACE-AT ?auto_65454 ?auto_65475 ) ( ON ?auto_65454 ?auto_65466 ) ( CLEAR ?auto_65454 ) ( not ( = ?auto_65453 ?auto_65466 ) ) ( not ( = ?auto_65454 ?auto_65466 ) ) ( not ( = ?auto_65469 ?auto_65466 ) ) ( not ( = ?auto_65476 ?auto_65466 ) ) ( IS-CRATE ?auto_65476 ) ( not ( = ?auto_65453 ?auto_65465 ) ) ( not ( = ?auto_65454 ?auto_65465 ) ) ( not ( = ?auto_65469 ?auto_65465 ) ) ( not ( = ?auto_65476 ?auto_65465 ) ) ( not ( = ?auto_65466 ?auto_65465 ) ) ( not ( = ?auto_65470 ?auto_65462 ) ) ( not ( = ?auto_65467 ?auto_65470 ) ) ( not ( = ?auto_65475 ?auto_65470 ) ) ( HOIST-AT ?auto_65473 ?auto_65470 ) ( not ( = ?auto_65457 ?auto_65473 ) ) ( not ( = ?auto_65455 ?auto_65473 ) ) ( not ( = ?auto_65456 ?auto_65473 ) ) ( AVAILABLE ?auto_65473 ) ( SURFACE-AT ?auto_65476 ?auto_65470 ) ( ON ?auto_65476 ?auto_65460 ) ( CLEAR ?auto_65476 ) ( not ( = ?auto_65453 ?auto_65460 ) ) ( not ( = ?auto_65454 ?auto_65460 ) ) ( not ( = ?auto_65469 ?auto_65460 ) ) ( not ( = ?auto_65476 ?auto_65460 ) ) ( not ( = ?auto_65466 ?auto_65460 ) ) ( not ( = ?auto_65465 ?auto_65460 ) ) ( IS-CRATE ?auto_65465 ) ( not ( = ?auto_65453 ?auto_65472 ) ) ( not ( = ?auto_65454 ?auto_65472 ) ) ( not ( = ?auto_65469 ?auto_65472 ) ) ( not ( = ?auto_65476 ?auto_65472 ) ) ( not ( = ?auto_65466 ?auto_65472 ) ) ( not ( = ?auto_65465 ?auto_65472 ) ) ( not ( = ?auto_65460 ?auto_65472 ) ) ( not ( = ?auto_65471 ?auto_65462 ) ) ( not ( = ?auto_65467 ?auto_65471 ) ) ( not ( = ?auto_65475 ?auto_65471 ) ) ( not ( = ?auto_65470 ?auto_65471 ) ) ( HOIST-AT ?auto_65463 ?auto_65471 ) ( not ( = ?auto_65457 ?auto_65463 ) ) ( not ( = ?auto_65455 ?auto_65463 ) ) ( not ( = ?auto_65456 ?auto_65463 ) ) ( not ( = ?auto_65473 ?auto_65463 ) ) ( AVAILABLE ?auto_65463 ) ( SURFACE-AT ?auto_65465 ?auto_65471 ) ( ON ?auto_65465 ?auto_65464 ) ( CLEAR ?auto_65465 ) ( not ( = ?auto_65453 ?auto_65464 ) ) ( not ( = ?auto_65454 ?auto_65464 ) ) ( not ( = ?auto_65469 ?auto_65464 ) ) ( not ( = ?auto_65476 ?auto_65464 ) ) ( not ( = ?auto_65466 ?auto_65464 ) ) ( not ( = ?auto_65465 ?auto_65464 ) ) ( not ( = ?auto_65460 ?auto_65464 ) ) ( not ( = ?auto_65472 ?auto_65464 ) ) ( IS-CRATE ?auto_65472 ) ( not ( = ?auto_65453 ?auto_65459 ) ) ( not ( = ?auto_65454 ?auto_65459 ) ) ( not ( = ?auto_65469 ?auto_65459 ) ) ( not ( = ?auto_65476 ?auto_65459 ) ) ( not ( = ?auto_65466 ?auto_65459 ) ) ( not ( = ?auto_65465 ?auto_65459 ) ) ( not ( = ?auto_65460 ?auto_65459 ) ) ( not ( = ?auto_65472 ?auto_65459 ) ) ( not ( = ?auto_65464 ?auto_65459 ) ) ( not ( = ?auto_65477 ?auto_65462 ) ) ( not ( = ?auto_65467 ?auto_65477 ) ) ( not ( = ?auto_65475 ?auto_65477 ) ) ( not ( = ?auto_65470 ?auto_65477 ) ) ( not ( = ?auto_65471 ?auto_65477 ) ) ( HOIST-AT ?auto_65474 ?auto_65477 ) ( not ( = ?auto_65457 ?auto_65474 ) ) ( not ( = ?auto_65455 ?auto_65474 ) ) ( not ( = ?auto_65456 ?auto_65474 ) ) ( not ( = ?auto_65473 ?auto_65474 ) ) ( not ( = ?auto_65463 ?auto_65474 ) ) ( AVAILABLE ?auto_65474 ) ( SURFACE-AT ?auto_65472 ?auto_65477 ) ( ON ?auto_65472 ?auto_65458 ) ( CLEAR ?auto_65472 ) ( not ( = ?auto_65453 ?auto_65458 ) ) ( not ( = ?auto_65454 ?auto_65458 ) ) ( not ( = ?auto_65469 ?auto_65458 ) ) ( not ( = ?auto_65476 ?auto_65458 ) ) ( not ( = ?auto_65466 ?auto_65458 ) ) ( not ( = ?auto_65465 ?auto_65458 ) ) ( not ( = ?auto_65460 ?auto_65458 ) ) ( not ( = ?auto_65472 ?auto_65458 ) ) ( not ( = ?auto_65464 ?auto_65458 ) ) ( not ( = ?auto_65459 ?auto_65458 ) ) ( SURFACE-AT ?auto_65461 ?auto_65462 ) ( CLEAR ?auto_65461 ) ( IS-CRATE ?auto_65459 ) ( not ( = ?auto_65453 ?auto_65461 ) ) ( not ( = ?auto_65454 ?auto_65461 ) ) ( not ( = ?auto_65469 ?auto_65461 ) ) ( not ( = ?auto_65476 ?auto_65461 ) ) ( not ( = ?auto_65466 ?auto_65461 ) ) ( not ( = ?auto_65465 ?auto_65461 ) ) ( not ( = ?auto_65460 ?auto_65461 ) ) ( not ( = ?auto_65472 ?auto_65461 ) ) ( not ( = ?auto_65464 ?auto_65461 ) ) ( not ( = ?auto_65459 ?auto_65461 ) ) ( not ( = ?auto_65458 ?auto_65461 ) ) ( AVAILABLE ?auto_65457 ) ( IN ?auto_65459 ?auto_65468 ) ( TRUCK-AT ?auto_65468 ?auto_65478 ) ( not ( = ?auto_65478 ?auto_65462 ) ) ( not ( = ?auto_65467 ?auto_65478 ) ) ( not ( = ?auto_65475 ?auto_65478 ) ) ( not ( = ?auto_65470 ?auto_65478 ) ) ( not ( = ?auto_65471 ?auto_65478 ) ) ( not ( = ?auto_65477 ?auto_65478 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_65468 ?auto_65478 ?auto_65462 )
      ( MAKE-ON ?auto_65453 ?auto_65454 )
      ( MAKE-ON-VERIFY ?auto_65453 ?auto_65454 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_65479 - SURFACE
      ?auto_65480 - SURFACE
    )
    :vars
    (
      ?auto_65493 - HOIST
      ?auto_65496 - PLACE
      ?auto_65492 - PLACE
      ?auto_65494 - HOIST
      ?auto_65495 - SURFACE
      ?auto_65501 - SURFACE
      ?auto_65484 - PLACE
      ?auto_65486 - HOIST
      ?auto_65491 - SURFACE
      ?auto_65482 - SURFACE
      ?auto_65498 - PLACE
      ?auto_65489 - HOIST
      ?auto_65503 - SURFACE
      ?auto_65488 - SURFACE
      ?auto_65487 - PLACE
      ?auto_65485 - HOIST
      ?auto_65490 - SURFACE
      ?auto_65481 - SURFACE
      ?auto_65500 - PLACE
      ?auto_65483 - HOIST
      ?auto_65504 - SURFACE
      ?auto_65499 - SURFACE
      ?auto_65497 - TRUCK
      ?auto_65502 - PLACE
      ?auto_65505 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_65493 ?auto_65496 ) ( IS-CRATE ?auto_65479 ) ( not ( = ?auto_65479 ?auto_65480 ) ) ( not ( = ?auto_65492 ?auto_65496 ) ) ( HOIST-AT ?auto_65494 ?auto_65492 ) ( not ( = ?auto_65493 ?auto_65494 ) ) ( AVAILABLE ?auto_65494 ) ( SURFACE-AT ?auto_65479 ?auto_65492 ) ( ON ?auto_65479 ?auto_65495 ) ( CLEAR ?auto_65479 ) ( not ( = ?auto_65479 ?auto_65495 ) ) ( not ( = ?auto_65480 ?auto_65495 ) ) ( IS-CRATE ?auto_65480 ) ( not ( = ?auto_65479 ?auto_65501 ) ) ( not ( = ?auto_65480 ?auto_65501 ) ) ( not ( = ?auto_65495 ?auto_65501 ) ) ( not ( = ?auto_65484 ?auto_65496 ) ) ( not ( = ?auto_65492 ?auto_65484 ) ) ( HOIST-AT ?auto_65486 ?auto_65484 ) ( not ( = ?auto_65493 ?auto_65486 ) ) ( not ( = ?auto_65494 ?auto_65486 ) ) ( AVAILABLE ?auto_65486 ) ( SURFACE-AT ?auto_65480 ?auto_65484 ) ( ON ?auto_65480 ?auto_65491 ) ( CLEAR ?auto_65480 ) ( not ( = ?auto_65479 ?auto_65491 ) ) ( not ( = ?auto_65480 ?auto_65491 ) ) ( not ( = ?auto_65495 ?auto_65491 ) ) ( not ( = ?auto_65501 ?auto_65491 ) ) ( IS-CRATE ?auto_65501 ) ( not ( = ?auto_65479 ?auto_65482 ) ) ( not ( = ?auto_65480 ?auto_65482 ) ) ( not ( = ?auto_65495 ?auto_65482 ) ) ( not ( = ?auto_65501 ?auto_65482 ) ) ( not ( = ?auto_65491 ?auto_65482 ) ) ( not ( = ?auto_65498 ?auto_65496 ) ) ( not ( = ?auto_65492 ?auto_65498 ) ) ( not ( = ?auto_65484 ?auto_65498 ) ) ( HOIST-AT ?auto_65489 ?auto_65498 ) ( not ( = ?auto_65493 ?auto_65489 ) ) ( not ( = ?auto_65494 ?auto_65489 ) ) ( not ( = ?auto_65486 ?auto_65489 ) ) ( AVAILABLE ?auto_65489 ) ( SURFACE-AT ?auto_65501 ?auto_65498 ) ( ON ?auto_65501 ?auto_65503 ) ( CLEAR ?auto_65501 ) ( not ( = ?auto_65479 ?auto_65503 ) ) ( not ( = ?auto_65480 ?auto_65503 ) ) ( not ( = ?auto_65495 ?auto_65503 ) ) ( not ( = ?auto_65501 ?auto_65503 ) ) ( not ( = ?auto_65491 ?auto_65503 ) ) ( not ( = ?auto_65482 ?auto_65503 ) ) ( IS-CRATE ?auto_65482 ) ( not ( = ?auto_65479 ?auto_65488 ) ) ( not ( = ?auto_65480 ?auto_65488 ) ) ( not ( = ?auto_65495 ?auto_65488 ) ) ( not ( = ?auto_65501 ?auto_65488 ) ) ( not ( = ?auto_65491 ?auto_65488 ) ) ( not ( = ?auto_65482 ?auto_65488 ) ) ( not ( = ?auto_65503 ?auto_65488 ) ) ( not ( = ?auto_65487 ?auto_65496 ) ) ( not ( = ?auto_65492 ?auto_65487 ) ) ( not ( = ?auto_65484 ?auto_65487 ) ) ( not ( = ?auto_65498 ?auto_65487 ) ) ( HOIST-AT ?auto_65485 ?auto_65487 ) ( not ( = ?auto_65493 ?auto_65485 ) ) ( not ( = ?auto_65494 ?auto_65485 ) ) ( not ( = ?auto_65486 ?auto_65485 ) ) ( not ( = ?auto_65489 ?auto_65485 ) ) ( AVAILABLE ?auto_65485 ) ( SURFACE-AT ?auto_65482 ?auto_65487 ) ( ON ?auto_65482 ?auto_65490 ) ( CLEAR ?auto_65482 ) ( not ( = ?auto_65479 ?auto_65490 ) ) ( not ( = ?auto_65480 ?auto_65490 ) ) ( not ( = ?auto_65495 ?auto_65490 ) ) ( not ( = ?auto_65501 ?auto_65490 ) ) ( not ( = ?auto_65491 ?auto_65490 ) ) ( not ( = ?auto_65482 ?auto_65490 ) ) ( not ( = ?auto_65503 ?auto_65490 ) ) ( not ( = ?auto_65488 ?auto_65490 ) ) ( IS-CRATE ?auto_65488 ) ( not ( = ?auto_65479 ?auto_65481 ) ) ( not ( = ?auto_65480 ?auto_65481 ) ) ( not ( = ?auto_65495 ?auto_65481 ) ) ( not ( = ?auto_65501 ?auto_65481 ) ) ( not ( = ?auto_65491 ?auto_65481 ) ) ( not ( = ?auto_65482 ?auto_65481 ) ) ( not ( = ?auto_65503 ?auto_65481 ) ) ( not ( = ?auto_65488 ?auto_65481 ) ) ( not ( = ?auto_65490 ?auto_65481 ) ) ( not ( = ?auto_65500 ?auto_65496 ) ) ( not ( = ?auto_65492 ?auto_65500 ) ) ( not ( = ?auto_65484 ?auto_65500 ) ) ( not ( = ?auto_65498 ?auto_65500 ) ) ( not ( = ?auto_65487 ?auto_65500 ) ) ( HOIST-AT ?auto_65483 ?auto_65500 ) ( not ( = ?auto_65493 ?auto_65483 ) ) ( not ( = ?auto_65494 ?auto_65483 ) ) ( not ( = ?auto_65486 ?auto_65483 ) ) ( not ( = ?auto_65489 ?auto_65483 ) ) ( not ( = ?auto_65485 ?auto_65483 ) ) ( AVAILABLE ?auto_65483 ) ( SURFACE-AT ?auto_65488 ?auto_65500 ) ( ON ?auto_65488 ?auto_65504 ) ( CLEAR ?auto_65488 ) ( not ( = ?auto_65479 ?auto_65504 ) ) ( not ( = ?auto_65480 ?auto_65504 ) ) ( not ( = ?auto_65495 ?auto_65504 ) ) ( not ( = ?auto_65501 ?auto_65504 ) ) ( not ( = ?auto_65491 ?auto_65504 ) ) ( not ( = ?auto_65482 ?auto_65504 ) ) ( not ( = ?auto_65503 ?auto_65504 ) ) ( not ( = ?auto_65488 ?auto_65504 ) ) ( not ( = ?auto_65490 ?auto_65504 ) ) ( not ( = ?auto_65481 ?auto_65504 ) ) ( SURFACE-AT ?auto_65499 ?auto_65496 ) ( CLEAR ?auto_65499 ) ( IS-CRATE ?auto_65481 ) ( not ( = ?auto_65479 ?auto_65499 ) ) ( not ( = ?auto_65480 ?auto_65499 ) ) ( not ( = ?auto_65495 ?auto_65499 ) ) ( not ( = ?auto_65501 ?auto_65499 ) ) ( not ( = ?auto_65491 ?auto_65499 ) ) ( not ( = ?auto_65482 ?auto_65499 ) ) ( not ( = ?auto_65503 ?auto_65499 ) ) ( not ( = ?auto_65488 ?auto_65499 ) ) ( not ( = ?auto_65490 ?auto_65499 ) ) ( not ( = ?auto_65481 ?auto_65499 ) ) ( not ( = ?auto_65504 ?auto_65499 ) ) ( AVAILABLE ?auto_65493 ) ( TRUCK-AT ?auto_65497 ?auto_65502 ) ( not ( = ?auto_65502 ?auto_65496 ) ) ( not ( = ?auto_65492 ?auto_65502 ) ) ( not ( = ?auto_65484 ?auto_65502 ) ) ( not ( = ?auto_65498 ?auto_65502 ) ) ( not ( = ?auto_65487 ?auto_65502 ) ) ( not ( = ?auto_65500 ?auto_65502 ) ) ( HOIST-AT ?auto_65505 ?auto_65502 ) ( LIFTING ?auto_65505 ?auto_65481 ) ( not ( = ?auto_65493 ?auto_65505 ) ) ( not ( = ?auto_65494 ?auto_65505 ) ) ( not ( = ?auto_65486 ?auto_65505 ) ) ( not ( = ?auto_65489 ?auto_65505 ) ) ( not ( = ?auto_65485 ?auto_65505 ) ) ( not ( = ?auto_65483 ?auto_65505 ) ) )
    :subtasks
    ( ( !LOAD ?auto_65505 ?auto_65481 ?auto_65497 ?auto_65502 )
      ( MAKE-ON ?auto_65479 ?auto_65480 )
      ( MAKE-ON-VERIFY ?auto_65479 ?auto_65480 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_65506 - SURFACE
      ?auto_65507 - SURFACE
    )
    :vars
    (
      ?auto_65521 - HOIST
      ?auto_65528 - PLACE
      ?auto_65520 - PLACE
      ?auto_65530 - HOIST
      ?auto_65519 - SURFACE
      ?auto_65525 - SURFACE
      ?auto_65512 - PLACE
      ?auto_65531 - HOIST
      ?auto_65527 - SURFACE
      ?auto_65508 - SURFACE
      ?auto_65524 - PLACE
      ?auto_65529 - HOIST
      ?auto_65516 - SURFACE
      ?auto_65532 - SURFACE
      ?auto_65522 - PLACE
      ?auto_65509 - HOIST
      ?auto_65511 - SURFACE
      ?auto_65518 - SURFACE
      ?auto_65523 - PLACE
      ?auto_65517 - HOIST
      ?auto_65510 - SURFACE
      ?auto_65514 - SURFACE
      ?auto_65526 - TRUCK
      ?auto_65513 - PLACE
      ?auto_65515 - HOIST
      ?auto_65533 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_65521 ?auto_65528 ) ( IS-CRATE ?auto_65506 ) ( not ( = ?auto_65506 ?auto_65507 ) ) ( not ( = ?auto_65520 ?auto_65528 ) ) ( HOIST-AT ?auto_65530 ?auto_65520 ) ( not ( = ?auto_65521 ?auto_65530 ) ) ( AVAILABLE ?auto_65530 ) ( SURFACE-AT ?auto_65506 ?auto_65520 ) ( ON ?auto_65506 ?auto_65519 ) ( CLEAR ?auto_65506 ) ( not ( = ?auto_65506 ?auto_65519 ) ) ( not ( = ?auto_65507 ?auto_65519 ) ) ( IS-CRATE ?auto_65507 ) ( not ( = ?auto_65506 ?auto_65525 ) ) ( not ( = ?auto_65507 ?auto_65525 ) ) ( not ( = ?auto_65519 ?auto_65525 ) ) ( not ( = ?auto_65512 ?auto_65528 ) ) ( not ( = ?auto_65520 ?auto_65512 ) ) ( HOIST-AT ?auto_65531 ?auto_65512 ) ( not ( = ?auto_65521 ?auto_65531 ) ) ( not ( = ?auto_65530 ?auto_65531 ) ) ( AVAILABLE ?auto_65531 ) ( SURFACE-AT ?auto_65507 ?auto_65512 ) ( ON ?auto_65507 ?auto_65527 ) ( CLEAR ?auto_65507 ) ( not ( = ?auto_65506 ?auto_65527 ) ) ( not ( = ?auto_65507 ?auto_65527 ) ) ( not ( = ?auto_65519 ?auto_65527 ) ) ( not ( = ?auto_65525 ?auto_65527 ) ) ( IS-CRATE ?auto_65525 ) ( not ( = ?auto_65506 ?auto_65508 ) ) ( not ( = ?auto_65507 ?auto_65508 ) ) ( not ( = ?auto_65519 ?auto_65508 ) ) ( not ( = ?auto_65525 ?auto_65508 ) ) ( not ( = ?auto_65527 ?auto_65508 ) ) ( not ( = ?auto_65524 ?auto_65528 ) ) ( not ( = ?auto_65520 ?auto_65524 ) ) ( not ( = ?auto_65512 ?auto_65524 ) ) ( HOIST-AT ?auto_65529 ?auto_65524 ) ( not ( = ?auto_65521 ?auto_65529 ) ) ( not ( = ?auto_65530 ?auto_65529 ) ) ( not ( = ?auto_65531 ?auto_65529 ) ) ( AVAILABLE ?auto_65529 ) ( SURFACE-AT ?auto_65525 ?auto_65524 ) ( ON ?auto_65525 ?auto_65516 ) ( CLEAR ?auto_65525 ) ( not ( = ?auto_65506 ?auto_65516 ) ) ( not ( = ?auto_65507 ?auto_65516 ) ) ( not ( = ?auto_65519 ?auto_65516 ) ) ( not ( = ?auto_65525 ?auto_65516 ) ) ( not ( = ?auto_65527 ?auto_65516 ) ) ( not ( = ?auto_65508 ?auto_65516 ) ) ( IS-CRATE ?auto_65508 ) ( not ( = ?auto_65506 ?auto_65532 ) ) ( not ( = ?auto_65507 ?auto_65532 ) ) ( not ( = ?auto_65519 ?auto_65532 ) ) ( not ( = ?auto_65525 ?auto_65532 ) ) ( not ( = ?auto_65527 ?auto_65532 ) ) ( not ( = ?auto_65508 ?auto_65532 ) ) ( not ( = ?auto_65516 ?auto_65532 ) ) ( not ( = ?auto_65522 ?auto_65528 ) ) ( not ( = ?auto_65520 ?auto_65522 ) ) ( not ( = ?auto_65512 ?auto_65522 ) ) ( not ( = ?auto_65524 ?auto_65522 ) ) ( HOIST-AT ?auto_65509 ?auto_65522 ) ( not ( = ?auto_65521 ?auto_65509 ) ) ( not ( = ?auto_65530 ?auto_65509 ) ) ( not ( = ?auto_65531 ?auto_65509 ) ) ( not ( = ?auto_65529 ?auto_65509 ) ) ( AVAILABLE ?auto_65509 ) ( SURFACE-AT ?auto_65508 ?auto_65522 ) ( ON ?auto_65508 ?auto_65511 ) ( CLEAR ?auto_65508 ) ( not ( = ?auto_65506 ?auto_65511 ) ) ( not ( = ?auto_65507 ?auto_65511 ) ) ( not ( = ?auto_65519 ?auto_65511 ) ) ( not ( = ?auto_65525 ?auto_65511 ) ) ( not ( = ?auto_65527 ?auto_65511 ) ) ( not ( = ?auto_65508 ?auto_65511 ) ) ( not ( = ?auto_65516 ?auto_65511 ) ) ( not ( = ?auto_65532 ?auto_65511 ) ) ( IS-CRATE ?auto_65532 ) ( not ( = ?auto_65506 ?auto_65518 ) ) ( not ( = ?auto_65507 ?auto_65518 ) ) ( not ( = ?auto_65519 ?auto_65518 ) ) ( not ( = ?auto_65525 ?auto_65518 ) ) ( not ( = ?auto_65527 ?auto_65518 ) ) ( not ( = ?auto_65508 ?auto_65518 ) ) ( not ( = ?auto_65516 ?auto_65518 ) ) ( not ( = ?auto_65532 ?auto_65518 ) ) ( not ( = ?auto_65511 ?auto_65518 ) ) ( not ( = ?auto_65523 ?auto_65528 ) ) ( not ( = ?auto_65520 ?auto_65523 ) ) ( not ( = ?auto_65512 ?auto_65523 ) ) ( not ( = ?auto_65524 ?auto_65523 ) ) ( not ( = ?auto_65522 ?auto_65523 ) ) ( HOIST-AT ?auto_65517 ?auto_65523 ) ( not ( = ?auto_65521 ?auto_65517 ) ) ( not ( = ?auto_65530 ?auto_65517 ) ) ( not ( = ?auto_65531 ?auto_65517 ) ) ( not ( = ?auto_65529 ?auto_65517 ) ) ( not ( = ?auto_65509 ?auto_65517 ) ) ( AVAILABLE ?auto_65517 ) ( SURFACE-AT ?auto_65532 ?auto_65523 ) ( ON ?auto_65532 ?auto_65510 ) ( CLEAR ?auto_65532 ) ( not ( = ?auto_65506 ?auto_65510 ) ) ( not ( = ?auto_65507 ?auto_65510 ) ) ( not ( = ?auto_65519 ?auto_65510 ) ) ( not ( = ?auto_65525 ?auto_65510 ) ) ( not ( = ?auto_65527 ?auto_65510 ) ) ( not ( = ?auto_65508 ?auto_65510 ) ) ( not ( = ?auto_65516 ?auto_65510 ) ) ( not ( = ?auto_65532 ?auto_65510 ) ) ( not ( = ?auto_65511 ?auto_65510 ) ) ( not ( = ?auto_65518 ?auto_65510 ) ) ( SURFACE-AT ?auto_65514 ?auto_65528 ) ( CLEAR ?auto_65514 ) ( IS-CRATE ?auto_65518 ) ( not ( = ?auto_65506 ?auto_65514 ) ) ( not ( = ?auto_65507 ?auto_65514 ) ) ( not ( = ?auto_65519 ?auto_65514 ) ) ( not ( = ?auto_65525 ?auto_65514 ) ) ( not ( = ?auto_65527 ?auto_65514 ) ) ( not ( = ?auto_65508 ?auto_65514 ) ) ( not ( = ?auto_65516 ?auto_65514 ) ) ( not ( = ?auto_65532 ?auto_65514 ) ) ( not ( = ?auto_65511 ?auto_65514 ) ) ( not ( = ?auto_65518 ?auto_65514 ) ) ( not ( = ?auto_65510 ?auto_65514 ) ) ( AVAILABLE ?auto_65521 ) ( TRUCK-AT ?auto_65526 ?auto_65513 ) ( not ( = ?auto_65513 ?auto_65528 ) ) ( not ( = ?auto_65520 ?auto_65513 ) ) ( not ( = ?auto_65512 ?auto_65513 ) ) ( not ( = ?auto_65524 ?auto_65513 ) ) ( not ( = ?auto_65522 ?auto_65513 ) ) ( not ( = ?auto_65523 ?auto_65513 ) ) ( HOIST-AT ?auto_65515 ?auto_65513 ) ( not ( = ?auto_65521 ?auto_65515 ) ) ( not ( = ?auto_65530 ?auto_65515 ) ) ( not ( = ?auto_65531 ?auto_65515 ) ) ( not ( = ?auto_65529 ?auto_65515 ) ) ( not ( = ?auto_65509 ?auto_65515 ) ) ( not ( = ?auto_65517 ?auto_65515 ) ) ( AVAILABLE ?auto_65515 ) ( SURFACE-AT ?auto_65518 ?auto_65513 ) ( ON ?auto_65518 ?auto_65533 ) ( CLEAR ?auto_65518 ) ( not ( = ?auto_65506 ?auto_65533 ) ) ( not ( = ?auto_65507 ?auto_65533 ) ) ( not ( = ?auto_65519 ?auto_65533 ) ) ( not ( = ?auto_65525 ?auto_65533 ) ) ( not ( = ?auto_65527 ?auto_65533 ) ) ( not ( = ?auto_65508 ?auto_65533 ) ) ( not ( = ?auto_65516 ?auto_65533 ) ) ( not ( = ?auto_65532 ?auto_65533 ) ) ( not ( = ?auto_65511 ?auto_65533 ) ) ( not ( = ?auto_65518 ?auto_65533 ) ) ( not ( = ?auto_65510 ?auto_65533 ) ) ( not ( = ?auto_65514 ?auto_65533 ) ) )
    :subtasks
    ( ( !LIFT ?auto_65515 ?auto_65518 ?auto_65533 ?auto_65513 )
      ( MAKE-ON ?auto_65506 ?auto_65507 )
      ( MAKE-ON-VERIFY ?auto_65506 ?auto_65507 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_65534 - SURFACE
      ?auto_65535 - SURFACE
    )
    :vars
    (
      ?auto_65536 - HOIST
      ?auto_65561 - PLACE
      ?auto_65560 - PLACE
      ?auto_65549 - HOIST
      ?auto_65559 - SURFACE
      ?auto_65557 - SURFACE
      ?auto_65539 - PLACE
      ?auto_65545 - HOIST
      ?auto_65553 - SURFACE
      ?auto_65542 - SURFACE
      ?auto_65546 - PLACE
      ?auto_65548 - HOIST
      ?auto_65540 - SURFACE
      ?auto_65544 - SURFACE
      ?auto_65555 - PLACE
      ?auto_65556 - HOIST
      ?auto_65551 - SURFACE
      ?auto_65547 - SURFACE
      ?auto_65550 - PLACE
      ?auto_65543 - HOIST
      ?auto_65538 - SURFACE
      ?auto_65554 - SURFACE
      ?auto_65541 - PLACE
      ?auto_65537 - HOIST
      ?auto_65552 - SURFACE
      ?auto_65558 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_65536 ?auto_65561 ) ( IS-CRATE ?auto_65534 ) ( not ( = ?auto_65534 ?auto_65535 ) ) ( not ( = ?auto_65560 ?auto_65561 ) ) ( HOIST-AT ?auto_65549 ?auto_65560 ) ( not ( = ?auto_65536 ?auto_65549 ) ) ( AVAILABLE ?auto_65549 ) ( SURFACE-AT ?auto_65534 ?auto_65560 ) ( ON ?auto_65534 ?auto_65559 ) ( CLEAR ?auto_65534 ) ( not ( = ?auto_65534 ?auto_65559 ) ) ( not ( = ?auto_65535 ?auto_65559 ) ) ( IS-CRATE ?auto_65535 ) ( not ( = ?auto_65534 ?auto_65557 ) ) ( not ( = ?auto_65535 ?auto_65557 ) ) ( not ( = ?auto_65559 ?auto_65557 ) ) ( not ( = ?auto_65539 ?auto_65561 ) ) ( not ( = ?auto_65560 ?auto_65539 ) ) ( HOIST-AT ?auto_65545 ?auto_65539 ) ( not ( = ?auto_65536 ?auto_65545 ) ) ( not ( = ?auto_65549 ?auto_65545 ) ) ( AVAILABLE ?auto_65545 ) ( SURFACE-AT ?auto_65535 ?auto_65539 ) ( ON ?auto_65535 ?auto_65553 ) ( CLEAR ?auto_65535 ) ( not ( = ?auto_65534 ?auto_65553 ) ) ( not ( = ?auto_65535 ?auto_65553 ) ) ( not ( = ?auto_65559 ?auto_65553 ) ) ( not ( = ?auto_65557 ?auto_65553 ) ) ( IS-CRATE ?auto_65557 ) ( not ( = ?auto_65534 ?auto_65542 ) ) ( not ( = ?auto_65535 ?auto_65542 ) ) ( not ( = ?auto_65559 ?auto_65542 ) ) ( not ( = ?auto_65557 ?auto_65542 ) ) ( not ( = ?auto_65553 ?auto_65542 ) ) ( not ( = ?auto_65546 ?auto_65561 ) ) ( not ( = ?auto_65560 ?auto_65546 ) ) ( not ( = ?auto_65539 ?auto_65546 ) ) ( HOIST-AT ?auto_65548 ?auto_65546 ) ( not ( = ?auto_65536 ?auto_65548 ) ) ( not ( = ?auto_65549 ?auto_65548 ) ) ( not ( = ?auto_65545 ?auto_65548 ) ) ( AVAILABLE ?auto_65548 ) ( SURFACE-AT ?auto_65557 ?auto_65546 ) ( ON ?auto_65557 ?auto_65540 ) ( CLEAR ?auto_65557 ) ( not ( = ?auto_65534 ?auto_65540 ) ) ( not ( = ?auto_65535 ?auto_65540 ) ) ( not ( = ?auto_65559 ?auto_65540 ) ) ( not ( = ?auto_65557 ?auto_65540 ) ) ( not ( = ?auto_65553 ?auto_65540 ) ) ( not ( = ?auto_65542 ?auto_65540 ) ) ( IS-CRATE ?auto_65542 ) ( not ( = ?auto_65534 ?auto_65544 ) ) ( not ( = ?auto_65535 ?auto_65544 ) ) ( not ( = ?auto_65559 ?auto_65544 ) ) ( not ( = ?auto_65557 ?auto_65544 ) ) ( not ( = ?auto_65553 ?auto_65544 ) ) ( not ( = ?auto_65542 ?auto_65544 ) ) ( not ( = ?auto_65540 ?auto_65544 ) ) ( not ( = ?auto_65555 ?auto_65561 ) ) ( not ( = ?auto_65560 ?auto_65555 ) ) ( not ( = ?auto_65539 ?auto_65555 ) ) ( not ( = ?auto_65546 ?auto_65555 ) ) ( HOIST-AT ?auto_65556 ?auto_65555 ) ( not ( = ?auto_65536 ?auto_65556 ) ) ( not ( = ?auto_65549 ?auto_65556 ) ) ( not ( = ?auto_65545 ?auto_65556 ) ) ( not ( = ?auto_65548 ?auto_65556 ) ) ( AVAILABLE ?auto_65556 ) ( SURFACE-AT ?auto_65542 ?auto_65555 ) ( ON ?auto_65542 ?auto_65551 ) ( CLEAR ?auto_65542 ) ( not ( = ?auto_65534 ?auto_65551 ) ) ( not ( = ?auto_65535 ?auto_65551 ) ) ( not ( = ?auto_65559 ?auto_65551 ) ) ( not ( = ?auto_65557 ?auto_65551 ) ) ( not ( = ?auto_65553 ?auto_65551 ) ) ( not ( = ?auto_65542 ?auto_65551 ) ) ( not ( = ?auto_65540 ?auto_65551 ) ) ( not ( = ?auto_65544 ?auto_65551 ) ) ( IS-CRATE ?auto_65544 ) ( not ( = ?auto_65534 ?auto_65547 ) ) ( not ( = ?auto_65535 ?auto_65547 ) ) ( not ( = ?auto_65559 ?auto_65547 ) ) ( not ( = ?auto_65557 ?auto_65547 ) ) ( not ( = ?auto_65553 ?auto_65547 ) ) ( not ( = ?auto_65542 ?auto_65547 ) ) ( not ( = ?auto_65540 ?auto_65547 ) ) ( not ( = ?auto_65544 ?auto_65547 ) ) ( not ( = ?auto_65551 ?auto_65547 ) ) ( not ( = ?auto_65550 ?auto_65561 ) ) ( not ( = ?auto_65560 ?auto_65550 ) ) ( not ( = ?auto_65539 ?auto_65550 ) ) ( not ( = ?auto_65546 ?auto_65550 ) ) ( not ( = ?auto_65555 ?auto_65550 ) ) ( HOIST-AT ?auto_65543 ?auto_65550 ) ( not ( = ?auto_65536 ?auto_65543 ) ) ( not ( = ?auto_65549 ?auto_65543 ) ) ( not ( = ?auto_65545 ?auto_65543 ) ) ( not ( = ?auto_65548 ?auto_65543 ) ) ( not ( = ?auto_65556 ?auto_65543 ) ) ( AVAILABLE ?auto_65543 ) ( SURFACE-AT ?auto_65544 ?auto_65550 ) ( ON ?auto_65544 ?auto_65538 ) ( CLEAR ?auto_65544 ) ( not ( = ?auto_65534 ?auto_65538 ) ) ( not ( = ?auto_65535 ?auto_65538 ) ) ( not ( = ?auto_65559 ?auto_65538 ) ) ( not ( = ?auto_65557 ?auto_65538 ) ) ( not ( = ?auto_65553 ?auto_65538 ) ) ( not ( = ?auto_65542 ?auto_65538 ) ) ( not ( = ?auto_65540 ?auto_65538 ) ) ( not ( = ?auto_65544 ?auto_65538 ) ) ( not ( = ?auto_65551 ?auto_65538 ) ) ( not ( = ?auto_65547 ?auto_65538 ) ) ( SURFACE-AT ?auto_65554 ?auto_65561 ) ( CLEAR ?auto_65554 ) ( IS-CRATE ?auto_65547 ) ( not ( = ?auto_65534 ?auto_65554 ) ) ( not ( = ?auto_65535 ?auto_65554 ) ) ( not ( = ?auto_65559 ?auto_65554 ) ) ( not ( = ?auto_65557 ?auto_65554 ) ) ( not ( = ?auto_65553 ?auto_65554 ) ) ( not ( = ?auto_65542 ?auto_65554 ) ) ( not ( = ?auto_65540 ?auto_65554 ) ) ( not ( = ?auto_65544 ?auto_65554 ) ) ( not ( = ?auto_65551 ?auto_65554 ) ) ( not ( = ?auto_65547 ?auto_65554 ) ) ( not ( = ?auto_65538 ?auto_65554 ) ) ( AVAILABLE ?auto_65536 ) ( not ( = ?auto_65541 ?auto_65561 ) ) ( not ( = ?auto_65560 ?auto_65541 ) ) ( not ( = ?auto_65539 ?auto_65541 ) ) ( not ( = ?auto_65546 ?auto_65541 ) ) ( not ( = ?auto_65555 ?auto_65541 ) ) ( not ( = ?auto_65550 ?auto_65541 ) ) ( HOIST-AT ?auto_65537 ?auto_65541 ) ( not ( = ?auto_65536 ?auto_65537 ) ) ( not ( = ?auto_65549 ?auto_65537 ) ) ( not ( = ?auto_65545 ?auto_65537 ) ) ( not ( = ?auto_65548 ?auto_65537 ) ) ( not ( = ?auto_65556 ?auto_65537 ) ) ( not ( = ?auto_65543 ?auto_65537 ) ) ( AVAILABLE ?auto_65537 ) ( SURFACE-AT ?auto_65547 ?auto_65541 ) ( ON ?auto_65547 ?auto_65552 ) ( CLEAR ?auto_65547 ) ( not ( = ?auto_65534 ?auto_65552 ) ) ( not ( = ?auto_65535 ?auto_65552 ) ) ( not ( = ?auto_65559 ?auto_65552 ) ) ( not ( = ?auto_65557 ?auto_65552 ) ) ( not ( = ?auto_65553 ?auto_65552 ) ) ( not ( = ?auto_65542 ?auto_65552 ) ) ( not ( = ?auto_65540 ?auto_65552 ) ) ( not ( = ?auto_65544 ?auto_65552 ) ) ( not ( = ?auto_65551 ?auto_65552 ) ) ( not ( = ?auto_65547 ?auto_65552 ) ) ( not ( = ?auto_65538 ?auto_65552 ) ) ( not ( = ?auto_65554 ?auto_65552 ) ) ( TRUCK-AT ?auto_65558 ?auto_65561 ) )
    :subtasks
    ( ( !DRIVE ?auto_65558 ?auto_65561 ?auto_65541 )
      ( MAKE-ON ?auto_65534 ?auto_65535 )
      ( MAKE-ON-VERIFY ?auto_65534 ?auto_65535 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_65564 - SURFACE
      ?auto_65565 - SURFACE
    )
    :vars
    (
      ?auto_65566 - HOIST
      ?auto_65567 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_65566 ?auto_65567 ) ( SURFACE-AT ?auto_65565 ?auto_65567 ) ( CLEAR ?auto_65565 ) ( LIFTING ?auto_65566 ?auto_65564 ) ( IS-CRATE ?auto_65564 ) ( not ( = ?auto_65564 ?auto_65565 ) ) )
    :subtasks
    ( ( !DROP ?auto_65566 ?auto_65564 ?auto_65565 ?auto_65567 )
      ( MAKE-ON-VERIFY ?auto_65564 ?auto_65565 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_65568 - SURFACE
      ?auto_65569 - SURFACE
    )
    :vars
    (
      ?auto_65570 - HOIST
      ?auto_65571 - PLACE
      ?auto_65572 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_65570 ?auto_65571 ) ( SURFACE-AT ?auto_65569 ?auto_65571 ) ( CLEAR ?auto_65569 ) ( IS-CRATE ?auto_65568 ) ( not ( = ?auto_65568 ?auto_65569 ) ) ( TRUCK-AT ?auto_65572 ?auto_65571 ) ( AVAILABLE ?auto_65570 ) ( IN ?auto_65568 ?auto_65572 ) )
    :subtasks
    ( ( !UNLOAD ?auto_65570 ?auto_65568 ?auto_65572 ?auto_65571 )
      ( MAKE-ON ?auto_65568 ?auto_65569 )
      ( MAKE-ON-VERIFY ?auto_65568 ?auto_65569 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_65573 - SURFACE
      ?auto_65574 - SURFACE
    )
    :vars
    (
      ?auto_65576 - HOIST
      ?auto_65575 - PLACE
      ?auto_65577 - TRUCK
      ?auto_65578 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_65576 ?auto_65575 ) ( SURFACE-AT ?auto_65574 ?auto_65575 ) ( CLEAR ?auto_65574 ) ( IS-CRATE ?auto_65573 ) ( not ( = ?auto_65573 ?auto_65574 ) ) ( AVAILABLE ?auto_65576 ) ( IN ?auto_65573 ?auto_65577 ) ( TRUCK-AT ?auto_65577 ?auto_65578 ) ( not ( = ?auto_65578 ?auto_65575 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_65577 ?auto_65578 ?auto_65575 )
      ( MAKE-ON ?auto_65573 ?auto_65574 )
      ( MAKE-ON-VERIFY ?auto_65573 ?auto_65574 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_65579 - SURFACE
      ?auto_65580 - SURFACE
    )
    :vars
    (
      ?auto_65584 - HOIST
      ?auto_65582 - PLACE
      ?auto_65581 - TRUCK
      ?auto_65583 - PLACE
      ?auto_65585 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_65584 ?auto_65582 ) ( SURFACE-AT ?auto_65580 ?auto_65582 ) ( CLEAR ?auto_65580 ) ( IS-CRATE ?auto_65579 ) ( not ( = ?auto_65579 ?auto_65580 ) ) ( AVAILABLE ?auto_65584 ) ( TRUCK-AT ?auto_65581 ?auto_65583 ) ( not ( = ?auto_65583 ?auto_65582 ) ) ( HOIST-AT ?auto_65585 ?auto_65583 ) ( LIFTING ?auto_65585 ?auto_65579 ) ( not ( = ?auto_65584 ?auto_65585 ) ) )
    :subtasks
    ( ( !LOAD ?auto_65585 ?auto_65579 ?auto_65581 ?auto_65583 )
      ( MAKE-ON ?auto_65579 ?auto_65580 )
      ( MAKE-ON-VERIFY ?auto_65579 ?auto_65580 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_65586 - SURFACE
      ?auto_65587 - SURFACE
    )
    :vars
    (
      ?auto_65590 - HOIST
      ?auto_65592 - PLACE
      ?auto_65591 - TRUCK
      ?auto_65588 - PLACE
      ?auto_65589 - HOIST
      ?auto_65593 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_65590 ?auto_65592 ) ( SURFACE-AT ?auto_65587 ?auto_65592 ) ( CLEAR ?auto_65587 ) ( IS-CRATE ?auto_65586 ) ( not ( = ?auto_65586 ?auto_65587 ) ) ( AVAILABLE ?auto_65590 ) ( TRUCK-AT ?auto_65591 ?auto_65588 ) ( not ( = ?auto_65588 ?auto_65592 ) ) ( HOIST-AT ?auto_65589 ?auto_65588 ) ( not ( = ?auto_65590 ?auto_65589 ) ) ( AVAILABLE ?auto_65589 ) ( SURFACE-AT ?auto_65586 ?auto_65588 ) ( ON ?auto_65586 ?auto_65593 ) ( CLEAR ?auto_65586 ) ( not ( = ?auto_65586 ?auto_65593 ) ) ( not ( = ?auto_65587 ?auto_65593 ) ) )
    :subtasks
    ( ( !LIFT ?auto_65589 ?auto_65586 ?auto_65593 ?auto_65588 )
      ( MAKE-ON ?auto_65586 ?auto_65587 )
      ( MAKE-ON-VERIFY ?auto_65586 ?auto_65587 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_65594 - SURFACE
      ?auto_65595 - SURFACE
    )
    :vars
    (
      ?auto_65600 - HOIST
      ?auto_65601 - PLACE
      ?auto_65598 - PLACE
      ?auto_65597 - HOIST
      ?auto_65596 - SURFACE
      ?auto_65599 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_65600 ?auto_65601 ) ( SURFACE-AT ?auto_65595 ?auto_65601 ) ( CLEAR ?auto_65595 ) ( IS-CRATE ?auto_65594 ) ( not ( = ?auto_65594 ?auto_65595 ) ) ( AVAILABLE ?auto_65600 ) ( not ( = ?auto_65598 ?auto_65601 ) ) ( HOIST-AT ?auto_65597 ?auto_65598 ) ( not ( = ?auto_65600 ?auto_65597 ) ) ( AVAILABLE ?auto_65597 ) ( SURFACE-AT ?auto_65594 ?auto_65598 ) ( ON ?auto_65594 ?auto_65596 ) ( CLEAR ?auto_65594 ) ( not ( = ?auto_65594 ?auto_65596 ) ) ( not ( = ?auto_65595 ?auto_65596 ) ) ( TRUCK-AT ?auto_65599 ?auto_65601 ) )
    :subtasks
    ( ( !DRIVE ?auto_65599 ?auto_65601 ?auto_65598 )
      ( MAKE-ON ?auto_65594 ?auto_65595 )
      ( MAKE-ON-VERIFY ?auto_65594 ?auto_65595 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_65602 - SURFACE
      ?auto_65603 - SURFACE
    )
    :vars
    (
      ?auto_65605 - HOIST
      ?auto_65608 - PLACE
      ?auto_65609 - PLACE
      ?auto_65606 - HOIST
      ?auto_65604 - SURFACE
      ?auto_65607 - TRUCK
      ?auto_65610 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_65605 ?auto_65608 ) ( IS-CRATE ?auto_65602 ) ( not ( = ?auto_65602 ?auto_65603 ) ) ( not ( = ?auto_65609 ?auto_65608 ) ) ( HOIST-AT ?auto_65606 ?auto_65609 ) ( not ( = ?auto_65605 ?auto_65606 ) ) ( AVAILABLE ?auto_65606 ) ( SURFACE-AT ?auto_65602 ?auto_65609 ) ( ON ?auto_65602 ?auto_65604 ) ( CLEAR ?auto_65602 ) ( not ( = ?auto_65602 ?auto_65604 ) ) ( not ( = ?auto_65603 ?auto_65604 ) ) ( TRUCK-AT ?auto_65607 ?auto_65608 ) ( SURFACE-AT ?auto_65610 ?auto_65608 ) ( CLEAR ?auto_65610 ) ( LIFTING ?auto_65605 ?auto_65603 ) ( IS-CRATE ?auto_65603 ) ( not ( = ?auto_65602 ?auto_65610 ) ) ( not ( = ?auto_65603 ?auto_65610 ) ) ( not ( = ?auto_65604 ?auto_65610 ) ) )
    :subtasks
    ( ( !DROP ?auto_65605 ?auto_65603 ?auto_65610 ?auto_65608 )
      ( MAKE-ON ?auto_65602 ?auto_65603 )
      ( MAKE-ON-VERIFY ?auto_65602 ?auto_65603 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_65611 - SURFACE
      ?auto_65612 - SURFACE
    )
    :vars
    (
      ?auto_65617 - HOIST
      ?auto_65616 - PLACE
      ?auto_65618 - PLACE
      ?auto_65613 - HOIST
      ?auto_65614 - SURFACE
      ?auto_65615 - TRUCK
      ?auto_65619 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_65617 ?auto_65616 ) ( IS-CRATE ?auto_65611 ) ( not ( = ?auto_65611 ?auto_65612 ) ) ( not ( = ?auto_65618 ?auto_65616 ) ) ( HOIST-AT ?auto_65613 ?auto_65618 ) ( not ( = ?auto_65617 ?auto_65613 ) ) ( AVAILABLE ?auto_65613 ) ( SURFACE-AT ?auto_65611 ?auto_65618 ) ( ON ?auto_65611 ?auto_65614 ) ( CLEAR ?auto_65611 ) ( not ( = ?auto_65611 ?auto_65614 ) ) ( not ( = ?auto_65612 ?auto_65614 ) ) ( TRUCK-AT ?auto_65615 ?auto_65616 ) ( SURFACE-AT ?auto_65619 ?auto_65616 ) ( CLEAR ?auto_65619 ) ( IS-CRATE ?auto_65612 ) ( not ( = ?auto_65611 ?auto_65619 ) ) ( not ( = ?auto_65612 ?auto_65619 ) ) ( not ( = ?auto_65614 ?auto_65619 ) ) ( AVAILABLE ?auto_65617 ) ( IN ?auto_65612 ?auto_65615 ) )
    :subtasks
    ( ( !UNLOAD ?auto_65617 ?auto_65612 ?auto_65615 ?auto_65616 )
      ( MAKE-ON ?auto_65611 ?auto_65612 )
      ( MAKE-ON-VERIFY ?auto_65611 ?auto_65612 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_65620 - SURFACE
      ?auto_65621 - SURFACE
    )
    :vars
    (
      ?auto_65628 - HOIST
      ?auto_65627 - PLACE
      ?auto_65626 - PLACE
      ?auto_65625 - HOIST
      ?auto_65623 - SURFACE
      ?auto_65622 - SURFACE
      ?auto_65624 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_65628 ?auto_65627 ) ( IS-CRATE ?auto_65620 ) ( not ( = ?auto_65620 ?auto_65621 ) ) ( not ( = ?auto_65626 ?auto_65627 ) ) ( HOIST-AT ?auto_65625 ?auto_65626 ) ( not ( = ?auto_65628 ?auto_65625 ) ) ( AVAILABLE ?auto_65625 ) ( SURFACE-AT ?auto_65620 ?auto_65626 ) ( ON ?auto_65620 ?auto_65623 ) ( CLEAR ?auto_65620 ) ( not ( = ?auto_65620 ?auto_65623 ) ) ( not ( = ?auto_65621 ?auto_65623 ) ) ( SURFACE-AT ?auto_65622 ?auto_65627 ) ( CLEAR ?auto_65622 ) ( IS-CRATE ?auto_65621 ) ( not ( = ?auto_65620 ?auto_65622 ) ) ( not ( = ?auto_65621 ?auto_65622 ) ) ( not ( = ?auto_65623 ?auto_65622 ) ) ( AVAILABLE ?auto_65628 ) ( IN ?auto_65621 ?auto_65624 ) ( TRUCK-AT ?auto_65624 ?auto_65626 ) )
    :subtasks
    ( ( !DRIVE ?auto_65624 ?auto_65626 ?auto_65627 )
      ( MAKE-ON ?auto_65620 ?auto_65621 )
      ( MAKE-ON-VERIFY ?auto_65620 ?auto_65621 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_65629 - SURFACE
      ?auto_65630 - SURFACE
    )
    :vars
    (
      ?auto_65635 - HOIST
      ?auto_65631 - PLACE
      ?auto_65637 - PLACE
      ?auto_65632 - HOIST
      ?auto_65633 - SURFACE
      ?auto_65636 - SURFACE
      ?auto_65634 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_65635 ?auto_65631 ) ( IS-CRATE ?auto_65629 ) ( not ( = ?auto_65629 ?auto_65630 ) ) ( not ( = ?auto_65637 ?auto_65631 ) ) ( HOIST-AT ?auto_65632 ?auto_65637 ) ( not ( = ?auto_65635 ?auto_65632 ) ) ( SURFACE-AT ?auto_65629 ?auto_65637 ) ( ON ?auto_65629 ?auto_65633 ) ( CLEAR ?auto_65629 ) ( not ( = ?auto_65629 ?auto_65633 ) ) ( not ( = ?auto_65630 ?auto_65633 ) ) ( SURFACE-AT ?auto_65636 ?auto_65631 ) ( CLEAR ?auto_65636 ) ( IS-CRATE ?auto_65630 ) ( not ( = ?auto_65629 ?auto_65636 ) ) ( not ( = ?auto_65630 ?auto_65636 ) ) ( not ( = ?auto_65633 ?auto_65636 ) ) ( AVAILABLE ?auto_65635 ) ( TRUCK-AT ?auto_65634 ?auto_65637 ) ( LIFTING ?auto_65632 ?auto_65630 ) )
    :subtasks
    ( ( !LOAD ?auto_65632 ?auto_65630 ?auto_65634 ?auto_65637 )
      ( MAKE-ON ?auto_65629 ?auto_65630 )
      ( MAKE-ON-VERIFY ?auto_65629 ?auto_65630 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_65638 - SURFACE
      ?auto_65639 - SURFACE
    )
    :vars
    (
      ?auto_65642 - HOIST
      ?auto_65644 - PLACE
      ?auto_65641 - PLACE
      ?auto_65645 - HOIST
      ?auto_65640 - SURFACE
      ?auto_65646 - SURFACE
      ?auto_65643 - TRUCK
      ?auto_65647 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_65642 ?auto_65644 ) ( IS-CRATE ?auto_65638 ) ( not ( = ?auto_65638 ?auto_65639 ) ) ( not ( = ?auto_65641 ?auto_65644 ) ) ( HOIST-AT ?auto_65645 ?auto_65641 ) ( not ( = ?auto_65642 ?auto_65645 ) ) ( SURFACE-AT ?auto_65638 ?auto_65641 ) ( ON ?auto_65638 ?auto_65640 ) ( CLEAR ?auto_65638 ) ( not ( = ?auto_65638 ?auto_65640 ) ) ( not ( = ?auto_65639 ?auto_65640 ) ) ( SURFACE-AT ?auto_65646 ?auto_65644 ) ( CLEAR ?auto_65646 ) ( IS-CRATE ?auto_65639 ) ( not ( = ?auto_65638 ?auto_65646 ) ) ( not ( = ?auto_65639 ?auto_65646 ) ) ( not ( = ?auto_65640 ?auto_65646 ) ) ( AVAILABLE ?auto_65642 ) ( TRUCK-AT ?auto_65643 ?auto_65641 ) ( AVAILABLE ?auto_65645 ) ( SURFACE-AT ?auto_65639 ?auto_65641 ) ( ON ?auto_65639 ?auto_65647 ) ( CLEAR ?auto_65639 ) ( not ( = ?auto_65638 ?auto_65647 ) ) ( not ( = ?auto_65639 ?auto_65647 ) ) ( not ( = ?auto_65640 ?auto_65647 ) ) ( not ( = ?auto_65646 ?auto_65647 ) ) )
    :subtasks
    ( ( !LIFT ?auto_65645 ?auto_65639 ?auto_65647 ?auto_65641 )
      ( MAKE-ON ?auto_65638 ?auto_65639 )
      ( MAKE-ON-VERIFY ?auto_65638 ?auto_65639 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_65648 - SURFACE
      ?auto_65649 - SURFACE
    )
    :vars
    (
      ?auto_65653 - HOIST
      ?auto_65654 - PLACE
      ?auto_65655 - PLACE
      ?auto_65657 - HOIST
      ?auto_65652 - SURFACE
      ?auto_65656 - SURFACE
      ?auto_65650 - SURFACE
      ?auto_65651 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_65653 ?auto_65654 ) ( IS-CRATE ?auto_65648 ) ( not ( = ?auto_65648 ?auto_65649 ) ) ( not ( = ?auto_65655 ?auto_65654 ) ) ( HOIST-AT ?auto_65657 ?auto_65655 ) ( not ( = ?auto_65653 ?auto_65657 ) ) ( SURFACE-AT ?auto_65648 ?auto_65655 ) ( ON ?auto_65648 ?auto_65652 ) ( CLEAR ?auto_65648 ) ( not ( = ?auto_65648 ?auto_65652 ) ) ( not ( = ?auto_65649 ?auto_65652 ) ) ( SURFACE-AT ?auto_65656 ?auto_65654 ) ( CLEAR ?auto_65656 ) ( IS-CRATE ?auto_65649 ) ( not ( = ?auto_65648 ?auto_65656 ) ) ( not ( = ?auto_65649 ?auto_65656 ) ) ( not ( = ?auto_65652 ?auto_65656 ) ) ( AVAILABLE ?auto_65653 ) ( AVAILABLE ?auto_65657 ) ( SURFACE-AT ?auto_65649 ?auto_65655 ) ( ON ?auto_65649 ?auto_65650 ) ( CLEAR ?auto_65649 ) ( not ( = ?auto_65648 ?auto_65650 ) ) ( not ( = ?auto_65649 ?auto_65650 ) ) ( not ( = ?auto_65652 ?auto_65650 ) ) ( not ( = ?auto_65656 ?auto_65650 ) ) ( TRUCK-AT ?auto_65651 ?auto_65654 ) )
    :subtasks
    ( ( !DRIVE ?auto_65651 ?auto_65654 ?auto_65655 )
      ( MAKE-ON ?auto_65648 ?auto_65649 )
      ( MAKE-ON-VERIFY ?auto_65648 ?auto_65649 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_65658 - SURFACE
      ?auto_65659 - SURFACE
    )
    :vars
    (
      ?auto_65667 - HOIST
      ?auto_65664 - PLACE
      ?auto_65663 - PLACE
      ?auto_65660 - HOIST
      ?auto_65666 - SURFACE
      ?auto_65662 - SURFACE
      ?auto_65661 - SURFACE
      ?auto_65665 - TRUCK
      ?auto_65668 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_65667 ?auto_65664 ) ( IS-CRATE ?auto_65658 ) ( not ( = ?auto_65658 ?auto_65659 ) ) ( not ( = ?auto_65663 ?auto_65664 ) ) ( HOIST-AT ?auto_65660 ?auto_65663 ) ( not ( = ?auto_65667 ?auto_65660 ) ) ( SURFACE-AT ?auto_65658 ?auto_65663 ) ( ON ?auto_65658 ?auto_65666 ) ( CLEAR ?auto_65658 ) ( not ( = ?auto_65658 ?auto_65666 ) ) ( not ( = ?auto_65659 ?auto_65666 ) ) ( IS-CRATE ?auto_65659 ) ( not ( = ?auto_65658 ?auto_65662 ) ) ( not ( = ?auto_65659 ?auto_65662 ) ) ( not ( = ?auto_65666 ?auto_65662 ) ) ( AVAILABLE ?auto_65660 ) ( SURFACE-AT ?auto_65659 ?auto_65663 ) ( ON ?auto_65659 ?auto_65661 ) ( CLEAR ?auto_65659 ) ( not ( = ?auto_65658 ?auto_65661 ) ) ( not ( = ?auto_65659 ?auto_65661 ) ) ( not ( = ?auto_65666 ?auto_65661 ) ) ( not ( = ?auto_65662 ?auto_65661 ) ) ( TRUCK-AT ?auto_65665 ?auto_65664 ) ( SURFACE-AT ?auto_65668 ?auto_65664 ) ( CLEAR ?auto_65668 ) ( LIFTING ?auto_65667 ?auto_65662 ) ( IS-CRATE ?auto_65662 ) ( not ( = ?auto_65658 ?auto_65668 ) ) ( not ( = ?auto_65659 ?auto_65668 ) ) ( not ( = ?auto_65666 ?auto_65668 ) ) ( not ( = ?auto_65662 ?auto_65668 ) ) ( not ( = ?auto_65661 ?auto_65668 ) ) )
    :subtasks
    ( ( !DROP ?auto_65667 ?auto_65662 ?auto_65668 ?auto_65664 )
      ( MAKE-ON ?auto_65658 ?auto_65659 )
      ( MAKE-ON-VERIFY ?auto_65658 ?auto_65659 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_65669 - SURFACE
      ?auto_65670 - SURFACE
    )
    :vars
    (
      ?auto_65671 - HOIST
      ?auto_65676 - PLACE
      ?auto_65675 - PLACE
      ?auto_65673 - HOIST
      ?auto_65674 - SURFACE
      ?auto_65678 - SURFACE
      ?auto_65677 - SURFACE
      ?auto_65679 - TRUCK
      ?auto_65672 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_65671 ?auto_65676 ) ( IS-CRATE ?auto_65669 ) ( not ( = ?auto_65669 ?auto_65670 ) ) ( not ( = ?auto_65675 ?auto_65676 ) ) ( HOIST-AT ?auto_65673 ?auto_65675 ) ( not ( = ?auto_65671 ?auto_65673 ) ) ( SURFACE-AT ?auto_65669 ?auto_65675 ) ( ON ?auto_65669 ?auto_65674 ) ( CLEAR ?auto_65669 ) ( not ( = ?auto_65669 ?auto_65674 ) ) ( not ( = ?auto_65670 ?auto_65674 ) ) ( IS-CRATE ?auto_65670 ) ( not ( = ?auto_65669 ?auto_65678 ) ) ( not ( = ?auto_65670 ?auto_65678 ) ) ( not ( = ?auto_65674 ?auto_65678 ) ) ( AVAILABLE ?auto_65673 ) ( SURFACE-AT ?auto_65670 ?auto_65675 ) ( ON ?auto_65670 ?auto_65677 ) ( CLEAR ?auto_65670 ) ( not ( = ?auto_65669 ?auto_65677 ) ) ( not ( = ?auto_65670 ?auto_65677 ) ) ( not ( = ?auto_65674 ?auto_65677 ) ) ( not ( = ?auto_65678 ?auto_65677 ) ) ( TRUCK-AT ?auto_65679 ?auto_65676 ) ( SURFACE-AT ?auto_65672 ?auto_65676 ) ( CLEAR ?auto_65672 ) ( IS-CRATE ?auto_65678 ) ( not ( = ?auto_65669 ?auto_65672 ) ) ( not ( = ?auto_65670 ?auto_65672 ) ) ( not ( = ?auto_65674 ?auto_65672 ) ) ( not ( = ?auto_65678 ?auto_65672 ) ) ( not ( = ?auto_65677 ?auto_65672 ) ) ( AVAILABLE ?auto_65671 ) ( IN ?auto_65678 ?auto_65679 ) )
    :subtasks
    ( ( !UNLOAD ?auto_65671 ?auto_65678 ?auto_65679 ?auto_65676 )
      ( MAKE-ON ?auto_65669 ?auto_65670 )
      ( MAKE-ON-VERIFY ?auto_65669 ?auto_65670 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_65680 - SURFACE
      ?auto_65681 - SURFACE
    )
    :vars
    (
      ?auto_65690 - HOIST
      ?auto_65689 - PLACE
      ?auto_65688 - PLACE
      ?auto_65685 - HOIST
      ?auto_65686 - SURFACE
      ?auto_65684 - SURFACE
      ?auto_65683 - SURFACE
      ?auto_65682 - SURFACE
      ?auto_65687 - TRUCK
      ?auto_65691 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_65690 ?auto_65689 ) ( IS-CRATE ?auto_65680 ) ( not ( = ?auto_65680 ?auto_65681 ) ) ( not ( = ?auto_65688 ?auto_65689 ) ) ( HOIST-AT ?auto_65685 ?auto_65688 ) ( not ( = ?auto_65690 ?auto_65685 ) ) ( SURFACE-AT ?auto_65680 ?auto_65688 ) ( ON ?auto_65680 ?auto_65686 ) ( CLEAR ?auto_65680 ) ( not ( = ?auto_65680 ?auto_65686 ) ) ( not ( = ?auto_65681 ?auto_65686 ) ) ( IS-CRATE ?auto_65681 ) ( not ( = ?auto_65680 ?auto_65684 ) ) ( not ( = ?auto_65681 ?auto_65684 ) ) ( not ( = ?auto_65686 ?auto_65684 ) ) ( AVAILABLE ?auto_65685 ) ( SURFACE-AT ?auto_65681 ?auto_65688 ) ( ON ?auto_65681 ?auto_65683 ) ( CLEAR ?auto_65681 ) ( not ( = ?auto_65680 ?auto_65683 ) ) ( not ( = ?auto_65681 ?auto_65683 ) ) ( not ( = ?auto_65686 ?auto_65683 ) ) ( not ( = ?auto_65684 ?auto_65683 ) ) ( SURFACE-AT ?auto_65682 ?auto_65689 ) ( CLEAR ?auto_65682 ) ( IS-CRATE ?auto_65684 ) ( not ( = ?auto_65680 ?auto_65682 ) ) ( not ( = ?auto_65681 ?auto_65682 ) ) ( not ( = ?auto_65686 ?auto_65682 ) ) ( not ( = ?auto_65684 ?auto_65682 ) ) ( not ( = ?auto_65683 ?auto_65682 ) ) ( AVAILABLE ?auto_65690 ) ( IN ?auto_65684 ?auto_65687 ) ( TRUCK-AT ?auto_65687 ?auto_65691 ) ( not ( = ?auto_65691 ?auto_65689 ) ) ( not ( = ?auto_65688 ?auto_65691 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_65687 ?auto_65691 ?auto_65689 )
      ( MAKE-ON ?auto_65680 ?auto_65681 )
      ( MAKE-ON-VERIFY ?auto_65680 ?auto_65681 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_65692 - SURFACE
      ?auto_65693 - SURFACE
    )
    :vars
    (
      ?auto_65697 - HOIST
      ?auto_65695 - PLACE
      ?auto_65694 - PLACE
      ?auto_65701 - HOIST
      ?auto_65700 - SURFACE
      ?auto_65696 - SURFACE
      ?auto_65702 - SURFACE
      ?auto_65703 - SURFACE
      ?auto_65698 - TRUCK
      ?auto_65699 - PLACE
      ?auto_65704 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_65697 ?auto_65695 ) ( IS-CRATE ?auto_65692 ) ( not ( = ?auto_65692 ?auto_65693 ) ) ( not ( = ?auto_65694 ?auto_65695 ) ) ( HOIST-AT ?auto_65701 ?auto_65694 ) ( not ( = ?auto_65697 ?auto_65701 ) ) ( SURFACE-AT ?auto_65692 ?auto_65694 ) ( ON ?auto_65692 ?auto_65700 ) ( CLEAR ?auto_65692 ) ( not ( = ?auto_65692 ?auto_65700 ) ) ( not ( = ?auto_65693 ?auto_65700 ) ) ( IS-CRATE ?auto_65693 ) ( not ( = ?auto_65692 ?auto_65696 ) ) ( not ( = ?auto_65693 ?auto_65696 ) ) ( not ( = ?auto_65700 ?auto_65696 ) ) ( AVAILABLE ?auto_65701 ) ( SURFACE-AT ?auto_65693 ?auto_65694 ) ( ON ?auto_65693 ?auto_65702 ) ( CLEAR ?auto_65693 ) ( not ( = ?auto_65692 ?auto_65702 ) ) ( not ( = ?auto_65693 ?auto_65702 ) ) ( not ( = ?auto_65700 ?auto_65702 ) ) ( not ( = ?auto_65696 ?auto_65702 ) ) ( SURFACE-AT ?auto_65703 ?auto_65695 ) ( CLEAR ?auto_65703 ) ( IS-CRATE ?auto_65696 ) ( not ( = ?auto_65692 ?auto_65703 ) ) ( not ( = ?auto_65693 ?auto_65703 ) ) ( not ( = ?auto_65700 ?auto_65703 ) ) ( not ( = ?auto_65696 ?auto_65703 ) ) ( not ( = ?auto_65702 ?auto_65703 ) ) ( AVAILABLE ?auto_65697 ) ( TRUCK-AT ?auto_65698 ?auto_65699 ) ( not ( = ?auto_65699 ?auto_65695 ) ) ( not ( = ?auto_65694 ?auto_65699 ) ) ( HOIST-AT ?auto_65704 ?auto_65699 ) ( LIFTING ?auto_65704 ?auto_65696 ) ( not ( = ?auto_65697 ?auto_65704 ) ) ( not ( = ?auto_65701 ?auto_65704 ) ) )
    :subtasks
    ( ( !LOAD ?auto_65704 ?auto_65696 ?auto_65698 ?auto_65699 )
      ( MAKE-ON ?auto_65692 ?auto_65693 )
      ( MAKE-ON-VERIFY ?auto_65692 ?auto_65693 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_65705 - SURFACE
      ?auto_65706 - SURFACE
    )
    :vars
    (
      ?auto_65716 - HOIST
      ?auto_65709 - PLACE
      ?auto_65711 - PLACE
      ?auto_65712 - HOIST
      ?auto_65707 - SURFACE
      ?auto_65710 - SURFACE
      ?auto_65714 - SURFACE
      ?auto_65717 - SURFACE
      ?auto_65708 - TRUCK
      ?auto_65713 - PLACE
      ?auto_65715 - HOIST
      ?auto_65718 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_65716 ?auto_65709 ) ( IS-CRATE ?auto_65705 ) ( not ( = ?auto_65705 ?auto_65706 ) ) ( not ( = ?auto_65711 ?auto_65709 ) ) ( HOIST-AT ?auto_65712 ?auto_65711 ) ( not ( = ?auto_65716 ?auto_65712 ) ) ( SURFACE-AT ?auto_65705 ?auto_65711 ) ( ON ?auto_65705 ?auto_65707 ) ( CLEAR ?auto_65705 ) ( not ( = ?auto_65705 ?auto_65707 ) ) ( not ( = ?auto_65706 ?auto_65707 ) ) ( IS-CRATE ?auto_65706 ) ( not ( = ?auto_65705 ?auto_65710 ) ) ( not ( = ?auto_65706 ?auto_65710 ) ) ( not ( = ?auto_65707 ?auto_65710 ) ) ( AVAILABLE ?auto_65712 ) ( SURFACE-AT ?auto_65706 ?auto_65711 ) ( ON ?auto_65706 ?auto_65714 ) ( CLEAR ?auto_65706 ) ( not ( = ?auto_65705 ?auto_65714 ) ) ( not ( = ?auto_65706 ?auto_65714 ) ) ( not ( = ?auto_65707 ?auto_65714 ) ) ( not ( = ?auto_65710 ?auto_65714 ) ) ( SURFACE-AT ?auto_65717 ?auto_65709 ) ( CLEAR ?auto_65717 ) ( IS-CRATE ?auto_65710 ) ( not ( = ?auto_65705 ?auto_65717 ) ) ( not ( = ?auto_65706 ?auto_65717 ) ) ( not ( = ?auto_65707 ?auto_65717 ) ) ( not ( = ?auto_65710 ?auto_65717 ) ) ( not ( = ?auto_65714 ?auto_65717 ) ) ( AVAILABLE ?auto_65716 ) ( TRUCK-AT ?auto_65708 ?auto_65713 ) ( not ( = ?auto_65713 ?auto_65709 ) ) ( not ( = ?auto_65711 ?auto_65713 ) ) ( HOIST-AT ?auto_65715 ?auto_65713 ) ( not ( = ?auto_65716 ?auto_65715 ) ) ( not ( = ?auto_65712 ?auto_65715 ) ) ( AVAILABLE ?auto_65715 ) ( SURFACE-AT ?auto_65710 ?auto_65713 ) ( ON ?auto_65710 ?auto_65718 ) ( CLEAR ?auto_65710 ) ( not ( = ?auto_65705 ?auto_65718 ) ) ( not ( = ?auto_65706 ?auto_65718 ) ) ( not ( = ?auto_65707 ?auto_65718 ) ) ( not ( = ?auto_65710 ?auto_65718 ) ) ( not ( = ?auto_65714 ?auto_65718 ) ) ( not ( = ?auto_65717 ?auto_65718 ) ) )
    :subtasks
    ( ( !LIFT ?auto_65715 ?auto_65710 ?auto_65718 ?auto_65713 )
      ( MAKE-ON ?auto_65705 ?auto_65706 )
      ( MAKE-ON-VERIFY ?auto_65705 ?auto_65706 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_65719 - SURFACE
      ?auto_65720 - SURFACE
    )
    :vars
    (
      ?auto_65726 - HOIST
      ?auto_65728 - PLACE
      ?auto_65724 - PLACE
      ?auto_65725 - HOIST
      ?auto_65732 - SURFACE
      ?auto_65727 - SURFACE
      ?auto_65730 - SURFACE
      ?auto_65721 - SURFACE
      ?auto_65729 - PLACE
      ?auto_65722 - HOIST
      ?auto_65723 - SURFACE
      ?auto_65731 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_65726 ?auto_65728 ) ( IS-CRATE ?auto_65719 ) ( not ( = ?auto_65719 ?auto_65720 ) ) ( not ( = ?auto_65724 ?auto_65728 ) ) ( HOIST-AT ?auto_65725 ?auto_65724 ) ( not ( = ?auto_65726 ?auto_65725 ) ) ( SURFACE-AT ?auto_65719 ?auto_65724 ) ( ON ?auto_65719 ?auto_65732 ) ( CLEAR ?auto_65719 ) ( not ( = ?auto_65719 ?auto_65732 ) ) ( not ( = ?auto_65720 ?auto_65732 ) ) ( IS-CRATE ?auto_65720 ) ( not ( = ?auto_65719 ?auto_65727 ) ) ( not ( = ?auto_65720 ?auto_65727 ) ) ( not ( = ?auto_65732 ?auto_65727 ) ) ( AVAILABLE ?auto_65725 ) ( SURFACE-AT ?auto_65720 ?auto_65724 ) ( ON ?auto_65720 ?auto_65730 ) ( CLEAR ?auto_65720 ) ( not ( = ?auto_65719 ?auto_65730 ) ) ( not ( = ?auto_65720 ?auto_65730 ) ) ( not ( = ?auto_65732 ?auto_65730 ) ) ( not ( = ?auto_65727 ?auto_65730 ) ) ( SURFACE-AT ?auto_65721 ?auto_65728 ) ( CLEAR ?auto_65721 ) ( IS-CRATE ?auto_65727 ) ( not ( = ?auto_65719 ?auto_65721 ) ) ( not ( = ?auto_65720 ?auto_65721 ) ) ( not ( = ?auto_65732 ?auto_65721 ) ) ( not ( = ?auto_65727 ?auto_65721 ) ) ( not ( = ?auto_65730 ?auto_65721 ) ) ( AVAILABLE ?auto_65726 ) ( not ( = ?auto_65729 ?auto_65728 ) ) ( not ( = ?auto_65724 ?auto_65729 ) ) ( HOIST-AT ?auto_65722 ?auto_65729 ) ( not ( = ?auto_65726 ?auto_65722 ) ) ( not ( = ?auto_65725 ?auto_65722 ) ) ( AVAILABLE ?auto_65722 ) ( SURFACE-AT ?auto_65727 ?auto_65729 ) ( ON ?auto_65727 ?auto_65723 ) ( CLEAR ?auto_65727 ) ( not ( = ?auto_65719 ?auto_65723 ) ) ( not ( = ?auto_65720 ?auto_65723 ) ) ( not ( = ?auto_65732 ?auto_65723 ) ) ( not ( = ?auto_65727 ?auto_65723 ) ) ( not ( = ?auto_65730 ?auto_65723 ) ) ( not ( = ?auto_65721 ?auto_65723 ) ) ( TRUCK-AT ?auto_65731 ?auto_65728 ) )
    :subtasks
    ( ( !DRIVE ?auto_65731 ?auto_65728 ?auto_65729 )
      ( MAKE-ON ?auto_65719 ?auto_65720 )
      ( MAKE-ON-VERIFY ?auto_65719 ?auto_65720 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_65733 - SURFACE
      ?auto_65734 - SURFACE
    )
    :vars
    (
      ?auto_65744 - HOIST
      ?auto_65740 - PLACE
      ?auto_65742 - PLACE
      ?auto_65746 - HOIST
      ?auto_65735 - SURFACE
      ?auto_65737 - SURFACE
      ?auto_65741 - SURFACE
      ?auto_65738 - SURFACE
      ?auto_65743 - PLACE
      ?auto_65739 - HOIST
      ?auto_65736 - SURFACE
      ?auto_65745 - TRUCK
      ?auto_65747 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_65744 ?auto_65740 ) ( IS-CRATE ?auto_65733 ) ( not ( = ?auto_65733 ?auto_65734 ) ) ( not ( = ?auto_65742 ?auto_65740 ) ) ( HOIST-AT ?auto_65746 ?auto_65742 ) ( not ( = ?auto_65744 ?auto_65746 ) ) ( SURFACE-AT ?auto_65733 ?auto_65742 ) ( ON ?auto_65733 ?auto_65735 ) ( CLEAR ?auto_65733 ) ( not ( = ?auto_65733 ?auto_65735 ) ) ( not ( = ?auto_65734 ?auto_65735 ) ) ( IS-CRATE ?auto_65734 ) ( not ( = ?auto_65733 ?auto_65737 ) ) ( not ( = ?auto_65734 ?auto_65737 ) ) ( not ( = ?auto_65735 ?auto_65737 ) ) ( AVAILABLE ?auto_65746 ) ( SURFACE-AT ?auto_65734 ?auto_65742 ) ( ON ?auto_65734 ?auto_65741 ) ( CLEAR ?auto_65734 ) ( not ( = ?auto_65733 ?auto_65741 ) ) ( not ( = ?auto_65734 ?auto_65741 ) ) ( not ( = ?auto_65735 ?auto_65741 ) ) ( not ( = ?auto_65737 ?auto_65741 ) ) ( IS-CRATE ?auto_65737 ) ( not ( = ?auto_65733 ?auto_65738 ) ) ( not ( = ?auto_65734 ?auto_65738 ) ) ( not ( = ?auto_65735 ?auto_65738 ) ) ( not ( = ?auto_65737 ?auto_65738 ) ) ( not ( = ?auto_65741 ?auto_65738 ) ) ( not ( = ?auto_65743 ?auto_65740 ) ) ( not ( = ?auto_65742 ?auto_65743 ) ) ( HOIST-AT ?auto_65739 ?auto_65743 ) ( not ( = ?auto_65744 ?auto_65739 ) ) ( not ( = ?auto_65746 ?auto_65739 ) ) ( AVAILABLE ?auto_65739 ) ( SURFACE-AT ?auto_65737 ?auto_65743 ) ( ON ?auto_65737 ?auto_65736 ) ( CLEAR ?auto_65737 ) ( not ( = ?auto_65733 ?auto_65736 ) ) ( not ( = ?auto_65734 ?auto_65736 ) ) ( not ( = ?auto_65735 ?auto_65736 ) ) ( not ( = ?auto_65737 ?auto_65736 ) ) ( not ( = ?auto_65741 ?auto_65736 ) ) ( not ( = ?auto_65738 ?auto_65736 ) ) ( TRUCK-AT ?auto_65745 ?auto_65740 ) ( SURFACE-AT ?auto_65747 ?auto_65740 ) ( CLEAR ?auto_65747 ) ( LIFTING ?auto_65744 ?auto_65738 ) ( IS-CRATE ?auto_65738 ) ( not ( = ?auto_65733 ?auto_65747 ) ) ( not ( = ?auto_65734 ?auto_65747 ) ) ( not ( = ?auto_65735 ?auto_65747 ) ) ( not ( = ?auto_65737 ?auto_65747 ) ) ( not ( = ?auto_65741 ?auto_65747 ) ) ( not ( = ?auto_65738 ?auto_65747 ) ) ( not ( = ?auto_65736 ?auto_65747 ) ) )
    :subtasks
    ( ( !DROP ?auto_65744 ?auto_65738 ?auto_65747 ?auto_65740 )
      ( MAKE-ON ?auto_65733 ?auto_65734 )
      ( MAKE-ON-VERIFY ?auto_65733 ?auto_65734 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_65748 - SURFACE
      ?auto_65749 - SURFACE
    )
    :vars
    (
      ?auto_65759 - HOIST
      ?auto_65754 - PLACE
      ?auto_65760 - PLACE
      ?auto_65756 - HOIST
      ?auto_65750 - SURFACE
      ?auto_65758 - SURFACE
      ?auto_65757 - SURFACE
      ?auto_65762 - SURFACE
      ?auto_65751 - PLACE
      ?auto_65755 - HOIST
      ?auto_65761 - SURFACE
      ?auto_65752 - TRUCK
      ?auto_65753 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_65759 ?auto_65754 ) ( IS-CRATE ?auto_65748 ) ( not ( = ?auto_65748 ?auto_65749 ) ) ( not ( = ?auto_65760 ?auto_65754 ) ) ( HOIST-AT ?auto_65756 ?auto_65760 ) ( not ( = ?auto_65759 ?auto_65756 ) ) ( SURFACE-AT ?auto_65748 ?auto_65760 ) ( ON ?auto_65748 ?auto_65750 ) ( CLEAR ?auto_65748 ) ( not ( = ?auto_65748 ?auto_65750 ) ) ( not ( = ?auto_65749 ?auto_65750 ) ) ( IS-CRATE ?auto_65749 ) ( not ( = ?auto_65748 ?auto_65758 ) ) ( not ( = ?auto_65749 ?auto_65758 ) ) ( not ( = ?auto_65750 ?auto_65758 ) ) ( AVAILABLE ?auto_65756 ) ( SURFACE-AT ?auto_65749 ?auto_65760 ) ( ON ?auto_65749 ?auto_65757 ) ( CLEAR ?auto_65749 ) ( not ( = ?auto_65748 ?auto_65757 ) ) ( not ( = ?auto_65749 ?auto_65757 ) ) ( not ( = ?auto_65750 ?auto_65757 ) ) ( not ( = ?auto_65758 ?auto_65757 ) ) ( IS-CRATE ?auto_65758 ) ( not ( = ?auto_65748 ?auto_65762 ) ) ( not ( = ?auto_65749 ?auto_65762 ) ) ( not ( = ?auto_65750 ?auto_65762 ) ) ( not ( = ?auto_65758 ?auto_65762 ) ) ( not ( = ?auto_65757 ?auto_65762 ) ) ( not ( = ?auto_65751 ?auto_65754 ) ) ( not ( = ?auto_65760 ?auto_65751 ) ) ( HOIST-AT ?auto_65755 ?auto_65751 ) ( not ( = ?auto_65759 ?auto_65755 ) ) ( not ( = ?auto_65756 ?auto_65755 ) ) ( AVAILABLE ?auto_65755 ) ( SURFACE-AT ?auto_65758 ?auto_65751 ) ( ON ?auto_65758 ?auto_65761 ) ( CLEAR ?auto_65758 ) ( not ( = ?auto_65748 ?auto_65761 ) ) ( not ( = ?auto_65749 ?auto_65761 ) ) ( not ( = ?auto_65750 ?auto_65761 ) ) ( not ( = ?auto_65758 ?auto_65761 ) ) ( not ( = ?auto_65757 ?auto_65761 ) ) ( not ( = ?auto_65762 ?auto_65761 ) ) ( TRUCK-AT ?auto_65752 ?auto_65754 ) ( SURFACE-AT ?auto_65753 ?auto_65754 ) ( CLEAR ?auto_65753 ) ( IS-CRATE ?auto_65762 ) ( not ( = ?auto_65748 ?auto_65753 ) ) ( not ( = ?auto_65749 ?auto_65753 ) ) ( not ( = ?auto_65750 ?auto_65753 ) ) ( not ( = ?auto_65758 ?auto_65753 ) ) ( not ( = ?auto_65757 ?auto_65753 ) ) ( not ( = ?auto_65762 ?auto_65753 ) ) ( not ( = ?auto_65761 ?auto_65753 ) ) ( AVAILABLE ?auto_65759 ) ( IN ?auto_65762 ?auto_65752 ) )
    :subtasks
    ( ( !UNLOAD ?auto_65759 ?auto_65762 ?auto_65752 ?auto_65754 )
      ( MAKE-ON ?auto_65748 ?auto_65749 )
      ( MAKE-ON-VERIFY ?auto_65748 ?auto_65749 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_65763 - SURFACE
      ?auto_65764 - SURFACE
    )
    :vars
    (
      ?auto_65775 - HOIST
      ?auto_65768 - PLACE
      ?auto_65771 - PLACE
      ?auto_65777 - HOIST
      ?auto_65769 - SURFACE
      ?auto_65772 - SURFACE
      ?auto_65773 - SURFACE
      ?auto_65774 - SURFACE
      ?auto_65765 - PLACE
      ?auto_65766 - HOIST
      ?auto_65776 - SURFACE
      ?auto_65770 - SURFACE
      ?auto_65767 - TRUCK
      ?auto_65778 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_65775 ?auto_65768 ) ( IS-CRATE ?auto_65763 ) ( not ( = ?auto_65763 ?auto_65764 ) ) ( not ( = ?auto_65771 ?auto_65768 ) ) ( HOIST-AT ?auto_65777 ?auto_65771 ) ( not ( = ?auto_65775 ?auto_65777 ) ) ( SURFACE-AT ?auto_65763 ?auto_65771 ) ( ON ?auto_65763 ?auto_65769 ) ( CLEAR ?auto_65763 ) ( not ( = ?auto_65763 ?auto_65769 ) ) ( not ( = ?auto_65764 ?auto_65769 ) ) ( IS-CRATE ?auto_65764 ) ( not ( = ?auto_65763 ?auto_65772 ) ) ( not ( = ?auto_65764 ?auto_65772 ) ) ( not ( = ?auto_65769 ?auto_65772 ) ) ( AVAILABLE ?auto_65777 ) ( SURFACE-AT ?auto_65764 ?auto_65771 ) ( ON ?auto_65764 ?auto_65773 ) ( CLEAR ?auto_65764 ) ( not ( = ?auto_65763 ?auto_65773 ) ) ( not ( = ?auto_65764 ?auto_65773 ) ) ( not ( = ?auto_65769 ?auto_65773 ) ) ( not ( = ?auto_65772 ?auto_65773 ) ) ( IS-CRATE ?auto_65772 ) ( not ( = ?auto_65763 ?auto_65774 ) ) ( not ( = ?auto_65764 ?auto_65774 ) ) ( not ( = ?auto_65769 ?auto_65774 ) ) ( not ( = ?auto_65772 ?auto_65774 ) ) ( not ( = ?auto_65773 ?auto_65774 ) ) ( not ( = ?auto_65765 ?auto_65768 ) ) ( not ( = ?auto_65771 ?auto_65765 ) ) ( HOIST-AT ?auto_65766 ?auto_65765 ) ( not ( = ?auto_65775 ?auto_65766 ) ) ( not ( = ?auto_65777 ?auto_65766 ) ) ( AVAILABLE ?auto_65766 ) ( SURFACE-AT ?auto_65772 ?auto_65765 ) ( ON ?auto_65772 ?auto_65776 ) ( CLEAR ?auto_65772 ) ( not ( = ?auto_65763 ?auto_65776 ) ) ( not ( = ?auto_65764 ?auto_65776 ) ) ( not ( = ?auto_65769 ?auto_65776 ) ) ( not ( = ?auto_65772 ?auto_65776 ) ) ( not ( = ?auto_65773 ?auto_65776 ) ) ( not ( = ?auto_65774 ?auto_65776 ) ) ( SURFACE-AT ?auto_65770 ?auto_65768 ) ( CLEAR ?auto_65770 ) ( IS-CRATE ?auto_65774 ) ( not ( = ?auto_65763 ?auto_65770 ) ) ( not ( = ?auto_65764 ?auto_65770 ) ) ( not ( = ?auto_65769 ?auto_65770 ) ) ( not ( = ?auto_65772 ?auto_65770 ) ) ( not ( = ?auto_65773 ?auto_65770 ) ) ( not ( = ?auto_65774 ?auto_65770 ) ) ( not ( = ?auto_65776 ?auto_65770 ) ) ( AVAILABLE ?auto_65775 ) ( IN ?auto_65774 ?auto_65767 ) ( TRUCK-AT ?auto_65767 ?auto_65778 ) ( not ( = ?auto_65778 ?auto_65768 ) ) ( not ( = ?auto_65771 ?auto_65778 ) ) ( not ( = ?auto_65765 ?auto_65778 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_65767 ?auto_65778 ?auto_65768 )
      ( MAKE-ON ?auto_65763 ?auto_65764 )
      ( MAKE-ON-VERIFY ?auto_65763 ?auto_65764 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_65779 - SURFACE
      ?auto_65780 - SURFACE
    )
    :vars
    (
      ?auto_65783 - HOIST
      ?auto_65784 - PLACE
      ?auto_65786 - PLACE
      ?auto_65791 - HOIST
      ?auto_65792 - SURFACE
      ?auto_65794 - SURFACE
      ?auto_65788 - SURFACE
      ?auto_65790 - SURFACE
      ?auto_65789 - PLACE
      ?auto_65787 - HOIST
      ?auto_65793 - SURFACE
      ?auto_65781 - SURFACE
      ?auto_65782 - TRUCK
      ?auto_65785 - PLACE
      ?auto_65795 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_65783 ?auto_65784 ) ( IS-CRATE ?auto_65779 ) ( not ( = ?auto_65779 ?auto_65780 ) ) ( not ( = ?auto_65786 ?auto_65784 ) ) ( HOIST-AT ?auto_65791 ?auto_65786 ) ( not ( = ?auto_65783 ?auto_65791 ) ) ( SURFACE-AT ?auto_65779 ?auto_65786 ) ( ON ?auto_65779 ?auto_65792 ) ( CLEAR ?auto_65779 ) ( not ( = ?auto_65779 ?auto_65792 ) ) ( not ( = ?auto_65780 ?auto_65792 ) ) ( IS-CRATE ?auto_65780 ) ( not ( = ?auto_65779 ?auto_65794 ) ) ( not ( = ?auto_65780 ?auto_65794 ) ) ( not ( = ?auto_65792 ?auto_65794 ) ) ( AVAILABLE ?auto_65791 ) ( SURFACE-AT ?auto_65780 ?auto_65786 ) ( ON ?auto_65780 ?auto_65788 ) ( CLEAR ?auto_65780 ) ( not ( = ?auto_65779 ?auto_65788 ) ) ( not ( = ?auto_65780 ?auto_65788 ) ) ( not ( = ?auto_65792 ?auto_65788 ) ) ( not ( = ?auto_65794 ?auto_65788 ) ) ( IS-CRATE ?auto_65794 ) ( not ( = ?auto_65779 ?auto_65790 ) ) ( not ( = ?auto_65780 ?auto_65790 ) ) ( not ( = ?auto_65792 ?auto_65790 ) ) ( not ( = ?auto_65794 ?auto_65790 ) ) ( not ( = ?auto_65788 ?auto_65790 ) ) ( not ( = ?auto_65789 ?auto_65784 ) ) ( not ( = ?auto_65786 ?auto_65789 ) ) ( HOIST-AT ?auto_65787 ?auto_65789 ) ( not ( = ?auto_65783 ?auto_65787 ) ) ( not ( = ?auto_65791 ?auto_65787 ) ) ( AVAILABLE ?auto_65787 ) ( SURFACE-AT ?auto_65794 ?auto_65789 ) ( ON ?auto_65794 ?auto_65793 ) ( CLEAR ?auto_65794 ) ( not ( = ?auto_65779 ?auto_65793 ) ) ( not ( = ?auto_65780 ?auto_65793 ) ) ( not ( = ?auto_65792 ?auto_65793 ) ) ( not ( = ?auto_65794 ?auto_65793 ) ) ( not ( = ?auto_65788 ?auto_65793 ) ) ( not ( = ?auto_65790 ?auto_65793 ) ) ( SURFACE-AT ?auto_65781 ?auto_65784 ) ( CLEAR ?auto_65781 ) ( IS-CRATE ?auto_65790 ) ( not ( = ?auto_65779 ?auto_65781 ) ) ( not ( = ?auto_65780 ?auto_65781 ) ) ( not ( = ?auto_65792 ?auto_65781 ) ) ( not ( = ?auto_65794 ?auto_65781 ) ) ( not ( = ?auto_65788 ?auto_65781 ) ) ( not ( = ?auto_65790 ?auto_65781 ) ) ( not ( = ?auto_65793 ?auto_65781 ) ) ( AVAILABLE ?auto_65783 ) ( TRUCK-AT ?auto_65782 ?auto_65785 ) ( not ( = ?auto_65785 ?auto_65784 ) ) ( not ( = ?auto_65786 ?auto_65785 ) ) ( not ( = ?auto_65789 ?auto_65785 ) ) ( HOIST-AT ?auto_65795 ?auto_65785 ) ( LIFTING ?auto_65795 ?auto_65790 ) ( not ( = ?auto_65783 ?auto_65795 ) ) ( not ( = ?auto_65791 ?auto_65795 ) ) ( not ( = ?auto_65787 ?auto_65795 ) ) )
    :subtasks
    ( ( !LOAD ?auto_65795 ?auto_65790 ?auto_65782 ?auto_65785 )
      ( MAKE-ON ?auto_65779 ?auto_65780 )
      ( MAKE-ON-VERIFY ?auto_65779 ?auto_65780 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_65796 - SURFACE
      ?auto_65797 - SURFACE
    )
    :vars
    (
      ?auto_65800 - HOIST
      ?auto_65803 - PLACE
      ?auto_65812 - PLACE
      ?auto_65804 - HOIST
      ?auto_65799 - SURFACE
      ?auto_65808 - SURFACE
      ?auto_65810 - SURFACE
      ?auto_65798 - SURFACE
      ?auto_65809 - PLACE
      ?auto_65802 - HOIST
      ?auto_65807 - SURFACE
      ?auto_65801 - SURFACE
      ?auto_65806 - TRUCK
      ?auto_65811 - PLACE
      ?auto_65805 - HOIST
      ?auto_65813 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_65800 ?auto_65803 ) ( IS-CRATE ?auto_65796 ) ( not ( = ?auto_65796 ?auto_65797 ) ) ( not ( = ?auto_65812 ?auto_65803 ) ) ( HOIST-AT ?auto_65804 ?auto_65812 ) ( not ( = ?auto_65800 ?auto_65804 ) ) ( SURFACE-AT ?auto_65796 ?auto_65812 ) ( ON ?auto_65796 ?auto_65799 ) ( CLEAR ?auto_65796 ) ( not ( = ?auto_65796 ?auto_65799 ) ) ( not ( = ?auto_65797 ?auto_65799 ) ) ( IS-CRATE ?auto_65797 ) ( not ( = ?auto_65796 ?auto_65808 ) ) ( not ( = ?auto_65797 ?auto_65808 ) ) ( not ( = ?auto_65799 ?auto_65808 ) ) ( AVAILABLE ?auto_65804 ) ( SURFACE-AT ?auto_65797 ?auto_65812 ) ( ON ?auto_65797 ?auto_65810 ) ( CLEAR ?auto_65797 ) ( not ( = ?auto_65796 ?auto_65810 ) ) ( not ( = ?auto_65797 ?auto_65810 ) ) ( not ( = ?auto_65799 ?auto_65810 ) ) ( not ( = ?auto_65808 ?auto_65810 ) ) ( IS-CRATE ?auto_65808 ) ( not ( = ?auto_65796 ?auto_65798 ) ) ( not ( = ?auto_65797 ?auto_65798 ) ) ( not ( = ?auto_65799 ?auto_65798 ) ) ( not ( = ?auto_65808 ?auto_65798 ) ) ( not ( = ?auto_65810 ?auto_65798 ) ) ( not ( = ?auto_65809 ?auto_65803 ) ) ( not ( = ?auto_65812 ?auto_65809 ) ) ( HOIST-AT ?auto_65802 ?auto_65809 ) ( not ( = ?auto_65800 ?auto_65802 ) ) ( not ( = ?auto_65804 ?auto_65802 ) ) ( AVAILABLE ?auto_65802 ) ( SURFACE-AT ?auto_65808 ?auto_65809 ) ( ON ?auto_65808 ?auto_65807 ) ( CLEAR ?auto_65808 ) ( not ( = ?auto_65796 ?auto_65807 ) ) ( not ( = ?auto_65797 ?auto_65807 ) ) ( not ( = ?auto_65799 ?auto_65807 ) ) ( not ( = ?auto_65808 ?auto_65807 ) ) ( not ( = ?auto_65810 ?auto_65807 ) ) ( not ( = ?auto_65798 ?auto_65807 ) ) ( SURFACE-AT ?auto_65801 ?auto_65803 ) ( CLEAR ?auto_65801 ) ( IS-CRATE ?auto_65798 ) ( not ( = ?auto_65796 ?auto_65801 ) ) ( not ( = ?auto_65797 ?auto_65801 ) ) ( not ( = ?auto_65799 ?auto_65801 ) ) ( not ( = ?auto_65808 ?auto_65801 ) ) ( not ( = ?auto_65810 ?auto_65801 ) ) ( not ( = ?auto_65798 ?auto_65801 ) ) ( not ( = ?auto_65807 ?auto_65801 ) ) ( AVAILABLE ?auto_65800 ) ( TRUCK-AT ?auto_65806 ?auto_65811 ) ( not ( = ?auto_65811 ?auto_65803 ) ) ( not ( = ?auto_65812 ?auto_65811 ) ) ( not ( = ?auto_65809 ?auto_65811 ) ) ( HOIST-AT ?auto_65805 ?auto_65811 ) ( not ( = ?auto_65800 ?auto_65805 ) ) ( not ( = ?auto_65804 ?auto_65805 ) ) ( not ( = ?auto_65802 ?auto_65805 ) ) ( AVAILABLE ?auto_65805 ) ( SURFACE-AT ?auto_65798 ?auto_65811 ) ( ON ?auto_65798 ?auto_65813 ) ( CLEAR ?auto_65798 ) ( not ( = ?auto_65796 ?auto_65813 ) ) ( not ( = ?auto_65797 ?auto_65813 ) ) ( not ( = ?auto_65799 ?auto_65813 ) ) ( not ( = ?auto_65808 ?auto_65813 ) ) ( not ( = ?auto_65810 ?auto_65813 ) ) ( not ( = ?auto_65798 ?auto_65813 ) ) ( not ( = ?auto_65807 ?auto_65813 ) ) ( not ( = ?auto_65801 ?auto_65813 ) ) )
    :subtasks
    ( ( !LIFT ?auto_65805 ?auto_65798 ?auto_65813 ?auto_65811 )
      ( MAKE-ON ?auto_65796 ?auto_65797 )
      ( MAKE-ON-VERIFY ?auto_65796 ?auto_65797 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_65814 - SURFACE
      ?auto_65815 - SURFACE
    )
    :vars
    (
      ?auto_65817 - HOIST
      ?auto_65821 - PLACE
      ?auto_65831 - PLACE
      ?auto_65830 - HOIST
      ?auto_65828 - SURFACE
      ?auto_65816 - SURFACE
      ?auto_65822 - SURFACE
      ?auto_65820 - SURFACE
      ?auto_65824 - PLACE
      ?auto_65827 - HOIST
      ?auto_65825 - SURFACE
      ?auto_65818 - SURFACE
      ?auto_65823 - PLACE
      ?auto_65819 - HOIST
      ?auto_65829 - SURFACE
      ?auto_65826 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_65817 ?auto_65821 ) ( IS-CRATE ?auto_65814 ) ( not ( = ?auto_65814 ?auto_65815 ) ) ( not ( = ?auto_65831 ?auto_65821 ) ) ( HOIST-AT ?auto_65830 ?auto_65831 ) ( not ( = ?auto_65817 ?auto_65830 ) ) ( SURFACE-AT ?auto_65814 ?auto_65831 ) ( ON ?auto_65814 ?auto_65828 ) ( CLEAR ?auto_65814 ) ( not ( = ?auto_65814 ?auto_65828 ) ) ( not ( = ?auto_65815 ?auto_65828 ) ) ( IS-CRATE ?auto_65815 ) ( not ( = ?auto_65814 ?auto_65816 ) ) ( not ( = ?auto_65815 ?auto_65816 ) ) ( not ( = ?auto_65828 ?auto_65816 ) ) ( AVAILABLE ?auto_65830 ) ( SURFACE-AT ?auto_65815 ?auto_65831 ) ( ON ?auto_65815 ?auto_65822 ) ( CLEAR ?auto_65815 ) ( not ( = ?auto_65814 ?auto_65822 ) ) ( not ( = ?auto_65815 ?auto_65822 ) ) ( not ( = ?auto_65828 ?auto_65822 ) ) ( not ( = ?auto_65816 ?auto_65822 ) ) ( IS-CRATE ?auto_65816 ) ( not ( = ?auto_65814 ?auto_65820 ) ) ( not ( = ?auto_65815 ?auto_65820 ) ) ( not ( = ?auto_65828 ?auto_65820 ) ) ( not ( = ?auto_65816 ?auto_65820 ) ) ( not ( = ?auto_65822 ?auto_65820 ) ) ( not ( = ?auto_65824 ?auto_65821 ) ) ( not ( = ?auto_65831 ?auto_65824 ) ) ( HOIST-AT ?auto_65827 ?auto_65824 ) ( not ( = ?auto_65817 ?auto_65827 ) ) ( not ( = ?auto_65830 ?auto_65827 ) ) ( AVAILABLE ?auto_65827 ) ( SURFACE-AT ?auto_65816 ?auto_65824 ) ( ON ?auto_65816 ?auto_65825 ) ( CLEAR ?auto_65816 ) ( not ( = ?auto_65814 ?auto_65825 ) ) ( not ( = ?auto_65815 ?auto_65825 ) ) ( not ( = ?auto_65828 ?auto_65825 ) ) ( not ( = ?auto_65816 ?auto_65825 ) ) ( not ( = ?auto_65822 ?auto_65825 ) ) ( not ( = ?auto_65820 ?auto_65825 ) ) ( SURFACE-AT ?auto_65818 ?auto_65821 ) ( CLEAR ?auto_65818 ) ( IS-CRATE ?auto_65820 ) ( not ( = ?auto_65814 ?auto_65818 ) ) ( not ( = ?auto_65815 ?auto_65818 ) ) ( not ( = ?auto_65828 ?auto_65818 ) ) ( not ( = ?auto_65816 ?auto_65818 ) ) ( not ( = ?auto_65822 ?auto_65818 ) ) ( not ( = ?auto_65820 ?auto_65818 ) ) ( not ( = ?auto_65825 ?auto_65818 ) ) ( AVAILABLE ?auto_65817 ) ( not ( = ?auto_65823 ?auto_65821 ) ) ( not ( = ?auto_65831 ?auto_65823 ) ) ( not ( = ?auto_65824 ?auto_65823 ) ) ( HOIST-AT ?auto_65819 ?auto_65823 ) ( not ( = ?auto_65817 ?auto_65819 ) ) ( not ( = ?auto_65830 ?auto_65819 ) ) ( not ( = ?auto_65827 ?auto_65819 ) ) ( AVAILABLE ?auto_65819 ) ( SURFACE-AT ?auto_65820 ?auto_65823 ) ( ON ?auto_65820 ?auto_65829 ) ( CLEAR ?auto_65820 ) ( not ( = ?auto_65814 ?auto_65829 ) ) ( not ( = ?auto_65815 ?auto_65829 ) ) ( not ( = ?auto_65828 ?auto_65829 ) ) ( not ( = ?auto_65816 ?auto_65829 ) ) ( not ( = ?auto_65822 ?auto_65829 ) ) ( not ( = ?auto_65820 ?auto_65829 ) ) ( not ( = ?auto_65825 ?auto_65829 ) ) ( not ( = ?auto_65818 ?auto_65829 ) ) ( TRUCK-AT ?auto_65826 ?auto_65821 ) )
    :subtasks
    ( ( !DRIVE ?auto_65826 ?auto_65821 ?auto_65823 )
      ( MAKE-ON ?auto_65814 ?auto_65815 )
      ( MAKE-ON-VERIFY ?auto_65814 ?auto_65815 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_65832 - SURFACE
      ?auto_65833 - SURFACE
    )
    :vars
    (
      ?auto_65849 - HOIST
      ?auto_65838 - PLACE
      ?auto_65837 - PLACE
      ?auto_65836 - HOIST
      ?auto_65834 - SURFACE
      ?auto_65846 - SURFACE
      ?auto_65847 - SURFACE
      ?auto_65835 - SURFACE
      ?auto_65844 - PLACE
      ?auto_65848 - HOIST
      ?auto_65843 - SURFACE
      ?auto_65841 - SURFACE
      ?auto_65845 - PLACE
      ?auto_65839 - HOIST
      ?auto_65840 - SURFACE
      ?auto_65842 - TRUCK
      ?auto_65850 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_65849 ?auto_65838 ) ( IS-CRATE ?auto_65832 ) ( not ( = ?auto_65832 ?auto_65833 ) ) ( not ( = ?auto_65837 ?auto_65838 ) ) ( HOIST-AT ?auto_65836 ?auto_65837 ) ( not ( = ?auto_65849 ?auto_65836 ) ) ( SURFACE-AT ?auto_65832 ?auto_65837 ) ( ON ?auto_65832 ?auto_65834 ) ( CLEAR ?auto_65832 ) ( not ( = ?auto_65832 ?auto_65834 ) ) ( not ( = ?auto_65833 ?auto_65834 ) ) ( IS-CRATE ?auto_65833 ) ( not ( = ?auto_65832 ?auto_65846 ) ) ( not ( = ?auto_65833 ?auto_65846 ) ) ( not ( = ?auto_65834 ?auto_65846 ) ) ( AVAILABLE ?auto_65836 ) ( SURFACE-AT ?auto_65833 ?auto_65837 ) ( ON ?auto_65833 ?auto_65847 ) ( CLEAR ?auto_65833 ) ( not ( = ?auto_65832 ?auto_65847 ) ) ( not ( = ?auto_65833 ?auto_65847 ) ) ( not ( = ?auto_65834 ?auto_65847 ) ) ( not ( = ?auto_65846 ?auto_65847 ) ) ( IS-CRATE ?auto_65846 ) ( not ( = ?auto_65832 ?auto_65835 ) ) ( not ( = ?auto_65833 ?auto_65835 ) ) ( not ( = ?auto_65834 ?auto_65835 ) ) ( not ( = ?auto_65846 ?auto_65835 ) ) ( not ( = ?auto_65847 ?auto_65835 ) ) ( not ( = ?auto_65844 ?auto_65838 ) ) ( not ( = ?auto_65837 ?auto_65844 ) ) ( HOIST-AT ?auto_65848 ?auto_65844 ) ( not ( = ?auto_65849 ?auto_65848 ) ) ( not ( = ?auto_65836 ?auto_65848 ) ) ( AVAILABLE ?auto_65848 ) ( SURFACE-AT ?auto_65846 ?auto_65844 ) ( ON ?auto_65846 ?auto_65843 ) ( CLEAR ?auto_65846 ) ( not ( = ?auto_65832 ?auto_65843 ) ) ( not ( = ?auto_65833 ?auto_65843 ) ) ( not ( = ?auto_65834 ?auto_65843 ) ) ( not ( = ?auto_65846 ?auto_65843 ) ) ( not ( = ?auto_65847 ?auto_65843 ) ) ( not ( = ?auto_65835 ?auto_65843 ) ) ( IS-CRATE ?auto_65835 ) ( not ( = ?auto_65832 ?auto_65841 ) ) ( not ( = ?auto_65833 ?auto_65841 ) ) ( not ( = ?auto_65834 ?auto_65841 ) ) ( not ( = ?auto_65846 ?auto_65841 ) ) ( not ( = ?auto_65847 ?auto_65841 ) ) ( not ( = ?auto_65835 ?auto_65841 ) ) ( not ( = ?auto_65843 ?auto_65841 ) ) ( not ( = ?auto_65845 ?auto_65838 ) ) ( not ( = ?auto_65837 ?auto_65845 ) ) ( not ( = ?auto_65844 ?auto_65845 ) ) ( HOIST-AT ?auto_65839 ?auto_65845 ) ( not ( = ?auto_65849 ?auto_65839 ) ) ( not ( = ?auto_65836 ?auto_65839 ) ) ( not ( = ?auto_65848 ?auto_65839 ) ) ( AVAILABLE ?auto_65839 ) ( SURFACE-AT ?auto_65835 ?auto_65845 ) ( ON ?auto_65835 ?auto_65840 ) ( CLEAR ?auto_65835 ) ( not ( = ?auto_65832 ?auto_65840 ) ) ( not ( = ?auto_65833 ?auto_65840 ) ) ( not ( = ?auto_65834 ?auto_65840 ) ) ( not ( = ?auto_65846 ?auto_65840 ) ) ( not ( = ?auto_65847 ?auto_65840 ) ) ( not ( = ?auto_65835 ?auto_65840 ) ) ( not ( = ?auto_65843 ?auto_65840 ) ) ( not ( = ?auto_65841 ?auto_65840 ) ) ( TRUCK-AT ?auto_65842 ?auto_65838 ) ( SURFACE-AT ?auto_65850 ?auto_65838 ) ( CLEAR ?auto_65850 ) ( LIFTING ?auto_65849 ?auto_65841 ) ( IS-CRATE ?auto_65841 ) ( not ( = ?auto_65832 ?auto_65850 ) ) ( not ( = ?auto_65833 ?auto_65850 ) ) ( not ( = ?auto_65834 ?auto_65850 ) ) ( not ( = ?auto_65846 ?auto_65850 ) ) ( not ( = ?auto_65847 ?auto_65850 ) ) ( not ( = ?auto_65835 ?auto_65850 ) ) ( not ( = ?auto_65843 ?auto_65850 ) ) ( not ( = ?auto_65841 ?auto_65850 ) ) ( not ( = ?auto_65840 ?auto_65850 ) ) )
    :subtasks
    ( ( !DROP ?auto_65849 ?auto_65841 ?auto_65850 ?auto_65838 )
      ( MAKE-ON ?auto_65832 ?auto_65833 )
      ( MAKE-ON-VERIFY ?auto_65832 ?auto_65833 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_65851 - SURFACE
      ?auto_65852 - SURFACE
    )
    :vars
    (
      ?auto_65856 - HOIST
      ?auto_65855 - PLACE
      ?auto_65863 - PLACE
      ?auto_65862 - HOIST
      ?auto_65865 - SURFACE
      ?auto_65866 - SURFACE
      ?auto_65857 - SURFACE
      ?auto_65861 - SURFACE
      ?auto_65853 - PLACE
      ?auto_65868 - HOIST
      ?auto_65867 - SURFACE
      ?auto_65858 - SURFACE
      ?auto_65859 - PLACE
      ?auto_65854 - HOIST
      ?auto_65860 - SURFACE
      ?auto_65864 - TRUCK
      ?auto_65869 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_65856 ?auto_65855 ) ( IS-CRATE ?auto_65851 ) ( not ( = ?auto_65851 ?auto_65852 ) ) ( not ( = ?auto_65863 ?auto_65855 ) ) ( HOIST-AT ?auto_65862 ?auto_65863 ) ( not ( = ?auto_65856 ?auto_65862 ) ) ( SURFACE-AT ?auto_65851 ?auto_65863 ) ( ON ?auto_65851 ?auto_65865 ) ( CLEAR ?auto_65851 ) ( not ( = ?auto_65851 ?auto_65865 ) ) ( not ( = ?auto_65852 ?auto_65865 ) ) ( IS-CRATE ?auto_65852 ) ( not ( = ?auto_65851 ?auto_65866 ) ) ( not ( = ?auto_65852 ?auto_65866 ) ) ( not ( = ?auto_65865 ?auto_65866 ) ) ( AVAILABLE ?auto_65862 ) ( SURFACE-AT ?auto_65852 ?auto_65863 ) ( ON ?auto_65852 ?auto_65857 ) ( CLEAR ?auto_65852 ) ( not ( = ?auto_65851 ?auto_65857 ) ) ( not ( = ?auto_65852 ?auto_65857 ) ) ( not ( = ?auto_65865 ?auto_65857 ) ) ( not ( = ?auto_65866 ?auto_65857 ) ) ( IS-CRATE ?auto_65866 ) ( not ( = ?auto_65851 ?auto_65861 ) ) ( not ( = ?auto_65852 ?auto_65861 ) ) ( not ( = ?auto_65865 ?auto_65861 ) ) ( not ( = ?auto_65866 ?auto_65861 ) ) ( not ( = ?auto_65857 ?auto_65861 ) ) ( not ( = ?auto_65853 ?auto_65855 ) ) ( not ( = ?auto_65863 ?auto_65853 ) ) ( HOIST-AT ?auto_65868 ?auto_65853 ) ( not ( = ?auto_65856 ?auto_65868 ) ) ( not ( = ?auto_65862 ?auto_65868 ) ) ( AVAILABLE ?auto_65868 ) ( SURFACE-AT ?auto_65866 ?auto_65853 ) ( ON ?auto_65866 ?auto_65867 ) ( CLEAR ?auto_65866 ) ( not ( = ?auto_65851 ?auto_65867 ) ) ( not ( = ?auto_65852 ?auto_65867 ) ) ( not ( = ?auto_65865 ?auto_65867 ) ) ( not ( = ?auto_65866 ?auto_65867 ) ) ( not ( = ?auto_65857 ?auto_65867 ) ) ( not ( = ?auto_65861 ?auto_65867 ) ) ( IS-CRATE ?auto_65861 ) ( not ( = ?auto_65851 ?auto_65858 ) ) ( not ( = ?auto_65852 ?auto_65858 ) ) ( not ( = ?auto_65865 ?auto_65858 ) ) ( not ( = ?auto_65866 ?auto_65858 ) ) ( not ( = ?auto_65857 ?auto_65858 ) ) ( not ( = ?auto_65861 ?auto_65858 ) ) ( not ( = ?auto_65867 ?auto_65858 ) ) ( not ( = ?auto_65859 ?auto_65855 ) ) ( not ( = ?auto_65863 ?auto_65859 ) ) ( not ( = ?auto_65853 ?auto_65859 ) ) ( HOIST-AT ?auto_65854 ?auto_65859 ) ( not ( = ?auto_65856 ?auto_65854 ) ) ( not ( = ?auto_65862 ?auto_65854 ) ) ( not ( = ?auto_65868 ?auto_65854 ) ) ( AVAILABLE ?auto_65854 ) ( SURFACE-AT ?auto_65861 ?auto_65859 ) ( ON ?auto_65861 ?auto_65860 ) ( CLEAR ?auto_65861 ) ( not ( = ?auto_65851 ?auto_65860 ) ) ( not ( = ?auto_65852 ?auto_65860 ) ) ( not ( = ?auto_65865 ?auto_65860 ) ) ( not ( = ?auto_65866 ?auto_65860 ) ) ( not ( = ?auto_65857 ?auto_65860 ) ) ( not ( = ?auto_65861 ?auto_65860 ) ) ( not ( = ?auto_65867 ?auto_65860 ) ) ( not ( = ?auto_65858 ?auto_65860 ) ) ( TRUCK-AT ?auto_65864 ?auto_65855 ) ( SURFACE-AT ?auto_65869 ?auto_65855 ) ( CLEAR ?auto_65869 ) ( IS-CRATE ?auto_65858 ) ( not ( = ?auto_65851 ?auto_65869 ) ) ( not ( = ?auto_65852 ?auto_65869 ) ) ( not ( = ?auto_65865 ?auto_65869 ) ) ( not ( = ?auto_65866 ?auto_65869 ) ) ( not ( = ?auto_65857 ?auto_65869 ) ) ( not ( = ?auto_65861 ?auto_65869 ) ) ( not ( = ?auto_65867 ?auto_65869 ) ) ( not ( = ?auto_65858 ?auto_65869 ) ) ( not ( = ?auto_65860 ?auto_65869 ) ) ( AVAILABLE ?auto_65856 ) ( IN ?auto_65858 ?auto_65864 ) )
    :subtasks
    ( ( !UNLOAD ?auto_65856 ?auto_65858 ?auto_65864 ?auto_65855 )
      ( MAKE-ON ?auto_65851 ?auto_65852 )
      ( MAKE-ON-VERIFY ?auto_65851 ?auto_65852 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_65870 - SURFACE
      ?auto_65871 - SURFACE
    )
    :vars
    (
      ?auto_65872 - HOIST
      ?auto_65879 - PLACE
      ?auto_65878 - PLACE
      ?auto_65881 - HOIST
      ?auto_65886 - SURFACE
      ?auto_65873 - SURFACE
      ?auto_65875 - SURFACE
      ?auto_65887 - SURFACE
      ?auto_65882 - PLACE
      ?auto_65885 - HOIST
      ?auto_65880 - SURFACE
      ?auto_65883 - SURFACE
      ?auto_65877 - PLACE
      ?auto_65874 - HOIST
      ?auto_65884 - SURFACE
      ?auto_65876 - SURFACE
      ?auto_65888 - TRUCK
      ?auto_65889 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_65872 ?auto_65879 ) ( IS-CRATE ?auto_65870 ) ( not ( = ?auto_65870 ?auto_65871 ) ) ( not ( = ?auto_65878 ?auto_65879 ) ) ( HOIST-AT ?auto_65881 ?auto_65878 ) ( not ( = ?auto_65872 ?auto_65881 ) ) ( SURFACE-AT ?auto_65870 ?auto_65878 ) ( ON ?auto_65870 ?auto_65886 ) ( CLEAR ?auto_65870 ) ( not ( = ?auto_65870 ?auto_65886 ) ) ( not ( = ?auto_65871 ?auto_65886 ) ) ( IS-CRATE ?auto_65871 ) ( not ( = ?auto_65870 ?auto_65873 ) ) ( not ( = ?auto_65871 ?auto_65873 ) ) ( not ( = ?auto_65886 ?auto_65873 ) ) ( AVAILABLE ?auto_65881 ) ( SURFACE-AT ?auto_65871 ?auto_65878 ) ( ON ?auto_65871 ?auto_65875 ) ( CLEAR ?auto_65871 ) ( not ( = ?auto_65870 ?auto_65875 ) ) ( not ( = ?auto_65871 ?auto_65875 ) ) ( not ( = ?auto_65886 ?auto_65875 ) ) ( not ( = ?auto_65873 ?auto_65875 ) ) ( IS-CRATE ?auto_65873 ) ( not ( = ?auto_65870 ?auto_65887 ) ) ( not ( = ?auto_65871 ?auto_65887 ) ) ( not ( = ?auto_65886 ?auto_65887 ) ) ( not ( = ?auto_65873 ?auto_65887 ) ) ( not ( = ?auto_65875 ?auto_65887 ) ) ( not ( = ?auto_65882 ?auto_65879 ) ) ( not ( = ?auto_65878 ?auto_65882 ) ) ( HOIST-AT ?auto_65885 ?auto_65882 ) ( not ( = ?auto_65872 ?auto_65885 ) ) ( not ( = ?auto_65881 ?auto_65885 ) ) ( AVAILABLE ?auto_65885 ) ( SURFACE-AT ?auto_65873 ?auto_65882 ) ( ON ?auto_65873 ?auto_65880 ) ( CLEAR ?auto_65873 ) ( not ( = ?auto_65870 ?auto_65880 ) ) ( not ( = ?auto_65871 ?auto_65880 ) ) ( not ( = ?auto_65886 ?auto_65880 ) ) ( not ( = ?auto_65873 ?auto_65880 ) ) ( not ( = ?auto_65875 ?auto_65880 ) ) ( not ( = ?auto_65887 ?auto_65880 ) ) ( IS-CRATE ?auto_65887 ) ( not ( = ?auto_65870 ?auto_65883 ) ) ( not ( = ?auto_65871 ?auto_65883 ) ) ( not ( = ?auto_65886 ?auto_65883 ) ) ( not ( = ?auto_65873 ?auto_65883 ) ) ( not ( = ?auto_65875 ?auto_65883 ) ) ( not ( = ?auto_65887 ?auto_65883 ) ) ( not ( = ?auto_65880 ?auto_65883 ) ) ( not ( = ?auto_65877 ?auto_65879 ) ) ( not ( = ?auto_65878 ?auto_65877 ) ) ( not ( = ?auto_65882 ?auto_65877 ) ) ( HOIST-AT ?auto_65874 ?auto_65877 ) ( not ( = ?auto_65872 ?auto_65874 ) ) ( not ( = ?auto_65881 ?auto_65874 ) ) ( not ( = ?auto_65885 ?auto_65874 ) ) ( AVAILABLE ?auto_65874 ) ( SURFACE-AT ?auto_65887 ?auto_65877 ) ( ON ?auto_65887 ?auto_65884 ) ( CLEAR ?auto_65887 ) ( not ( = ?auto_65870 ?auto_65884 ) ) ( not ( = ?auto_65871 ?auto_65884 ) ) ( not ( = ?auto_65886 ?auto_65884 ) ) ( not ( = ?auto_65873 ?auto_65884 ) ) ( not ( = ?auto_65875 ?auto_65884 ) ) ( not ( = ?auto_65887 ?auto_65884 ) ) ( not ( = ?auto_65880 ?auto_65884 ) ) ( not ( = ?auto_65883 ?auto_65884 ) ) ( SURFACE-AT ?auto_65876 ?auto_65879 ) ( CLEAR ?auto_65876 ) ( IS-CRATE ?auto_65883 ) ( not ( = ?auto_65870 ?auto_65876 ) ) ( not ( = ?auto_65871 ?auto_65876 ) ) ( not ( = ?auto_65886 ?auto_65876 ) ) ( not ( = ?auto_65873 ?auto_65876 ) ) ( not ( = ?auto_65875 ?auto_65876 ) ) ( not ( = ?auto_65887 ?auto_65876 ) ) ( not ( = ?auto_65880 ?auto_65876 ) ) ( not ( = ?auto_65883 ?auto_65876 ) ) ( not ( = ?auto_65884 ?auto_65876 ) ) ( AVAILABLE ?auto_65872 ) ( IN ?auto_65883 ?auto_65888 ) ( TRUCK-AT ?auto_65888 ?auto_65889 ) ( not ( = ?auto_65889 ?auto_65879 ) ) ( not ( = ?auto_65878 ?auto_65889 ) ) ( not ( = ?auto_65882 ?auto_65889 ) ) ( not ( = ?auto_65877 ?auto_65889 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_65888 ?auto_65889 ?auto_65879 )
      ( MAKE-ON ?auto_65870 ?auto_65871 )
      ( MAKE-ON-VERIFY ?auto_65870 ?auto_65871 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_65890 - SURFACE
      ?auto_65891 - SURFACE
    )
    :vars
    (
      ?auto_65906 - HOIST
      ?auto_65904 - PLACE
      ?auto_65900 - PLACE
      ?auto_65898 - HOIST
      ?auto_65899 - SURFACE
      ?auto_65896 - SURFACE
      ?auto_65908 - SURFACE
      ?auto_65902 - SURFACE
      ?auto_65893 - PLACE
      ?auto_65892 - HOIST
      ?auto_65895 - SURFACE
      ?auto_65897 - SURFACE
      ?auto_65909 - PLACE
      ?auto_65894 - HOIST
      ?auto_65905 - SURFACE
      ?auto_65907 - SURFACE
      ?auto_65903 - TRUCK
      ?auto_65901 - PLACE
      ?auto_65910 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_65906 ?auto_65904 ) ( IS-CRATE ?auto_65890 ) ( not ( = ?auto_65890 ?auto_65891 ) ) ( not ( = ?auto_65900 ?auto_65904 ) ) ( HOIST-AT ?auto_65898 ?auto_65900 ) ( not ( = ?auto_65906 ?auto_65898 ) ) ( SURFACE-AT ?auto_65890 ?auto_65900 ) ( ON ?auto_65890 ?auto_65899 ) ( CLEAR ?auto_65890 ) ( not ( = ?auto_65890 ?auto_65899 ) ) ( not ( = ?auto_65891 ?auto_65899 ) ) ( IS-CRATE ?auto_65891 ) ( not ( = ?auto_65890 ?auto_65896 ) ) ( not ( = ?auto_65891 ?auto_65896 ) ) ( not ( = ?auto_65899 ?auto_65896 ) ) ( AVAILABLE ?auto_65898 ) ( SURFACE-AT ?auto_65891 ?auto_65900 ) ( ON ?auto_65891 ?auto_65908 ) ( CLEAR ?auto_65891 ) ( not ( = ?auto_65890 ?auto_65908 ) ) ( not ( = ?auto_65891 ?auto_65908 ) ) ( not ( = ?auto_65899 ?auto_65908 ) ) ( not ( = ?auto_65896 ?auto_65908 ) ) ( IS-CRATE ?auto_65896 ) ( not ( = ?auto_65890 ?auto_65902 ) ) ( not ( = ?auto_65891 ?auto_65902 ) ) ( not ( = ?auto_65899 ?auto_65902 ) ) ( not ( = ?auto_65896 ?auto_65902 ) ) ( not ( = ?auto_65908 ?auto_65902 ) ) ( not ( = ?auto_65893 ?auto_65904 ) ) ( not ( = ?auto_65900 ?auto_65893 ) ) ( HOIST-AT ?auto_65892 ?auto_65893 ) ( not ( = ?auto_65906 ?auto_65892 ) ) ( not ( = ?auto_65898 ?auto_65892 ) ) ( AVAILABLE ?auto_65892 ) ( SURFACE-AT ?auto_65896 ?auto_65893 ) ( ON ?auto_65896 ?auto_65895 ) ( CLEAR ?auto_65896 ) ( not ( = ?auto_65890 ?auto_65895 ) ) ( not ( = ?auto_65891 ?auto_65895 ) ) ( not ( = ?auto_65899 ?auto_65895 ) ) ( not ( = ?auto_65896 ?auto_65895 ) ) ( not ( = ?auto_65908 ?auto_65895 ) ) ( not ( = ?auto_65902 ?auto_65895 ) ) ( IS-CRATE ?auto_65902 ) ( not ( = ?auto_65890 ?auto_65897 ) ) ( not ( = ?auto_65891 ?auto_65897 ) ) ( not ( = ?auto_65899 ?auto_65897 ) ) ( not ( = ?auto_65896 ?auto_65897 ) ) ( not ( = ?auto_65908 ?auto_65897 ) ) ( not ( = ?auto_65902 ?auto_65897 ) ) ( not ( = ?auto_65895 ?auto_65897 ) ) ( not ( = ?auto_65909 ?auto_65904 ) ) ( not ( = ?auto_65900 ?auto_65909 ) ) ( not ( = ?auto_65893 ?auto_65909 ) ) ( HOIST-AT ?auto_65894 ?auto_65909 ) ( not ( = ?auto_65906 ?auto_65894 ) ) ( not ( = ?auto_65898 ?auto_65894 ) ) ( not ( = ?auto_65892 ?auto_65894 ) ) ( AVAILABLE ?auto_65894 ) ( SURFACE-AT ?auto_65902 ?auto_65909 ) ( ON ?auto_65902 ?auto_65905 ) ( CLEAR ?auto_65902 ) ( not ( = ?auto_65890 ?auto_65905 ) ) ( not ( = ?auto_65891 ?auto_65905 ) ) ( not ( = ?auto_65899 ?auto_65905 ) ) ( not ( = ?auto_65896 ?auto_65905 ) ) ( not ( = ?auto_65908 ?auto_65905 ) ) ( not ( = ?auto_65902 ?auto_65905 ) ) ( not ( = ?auto_65895 ?auto_65905 ) ) ( not ( = ?auto_65897 ?auto_65905 ) ) ( SURFACE-AT ?auto_65907 ?auto_65904 ) ( CLEAR ?auto_65907 ) ( IS-CRATE ?auto_65897 ) ( not ( = ?auto_65890 ?auto_65907 ) ) ( not ( = ?auto_65891 ?auto_65907 ) ) ( not ( = ?auto_65899 ?auto_65907 ) ) ( not ( = ?auto_65896 ?auto_65907 ) ) ( not ( = ?auto_65908 ?auto_65907 ) ) ( not ( = ?auto_65902 ?auto_65907 ) ) ( not ( = ?auto_65895 ?auto_65907 ) ) ( not ( = ?auto_65897 ?auto_65907 ) ) ( not ( = ?auto_65905 ?auto_65907 ) ) ( AVAILABLE ?auto_65906 ) ( TRUCK-AT ?auto_65903 ?auto_65901 ) ( not ( = ?auto_65901 ?auto_65904 ) ) ( not ( = ?auto_65900 ?auto_65901 ) ) ( not ( = ?auto_65893 ?auto_65901 ) ) ( not ( = ?auto_65909 ?auto_65901 ) ) ( HOIST-AT ?auto_65910 ?auto_65901 ) ( LIFTING ?auto_65910 ?auto_65897 ) ( not ( = ?auto_65906 ?auto_65910 ) ) ( not ( = ?auto_65898 ?auto_65910 ) ) ( not ( = ?auto_65892 ?auto_65910 ) ) ( not ( = ?auto_65894 ?auto_65910 ) ) )
    :subtasks
    ( ( !LOAD ?auto_65910 ?auto_65897 ?auto_65903 ?auto_65901 )
      ( MAKE-ON ?auto_65890 ?auto_65891 )
      ( MAKE-ON-VERIFY ?auto_65890 ?auto_65891 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_65911 - SURFACE
      ?auto_65912 - SURFACE
    )
    :vars
    (
      ?auto_65925 - HOIST
      ?auto_65930 - PLACE
      ?auto_65913 - PLACE
      ?auto_65931 - HOIST
      ?auto_65926 - SURFACE
      ?auto_65917 - SURFACE
      ?auto_65923 - SURFACE
      ?auto_65918 - SURFACE
      ?auto_65915 - PLACE
      ?auto_65919 - HOIST
      ?auto_65927 - SURFACE
      ?auto_65929 - SURFACE
      ?auto_65924 - PLACE
      ?auto_65928 - HOIST
      ?auto_65920 - SURFACE
      ?auto_65922 - SURFACE
      ?auto_65916 - TRUCK
      ?auto_65921 - PLACE
      ?auto_65914 - HOIST
      ?auto_65932 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_65925 ?auto_65930 ) ( IS-CRATE ?auto_65911 ) ( not ( = ?auto_65911 ?auto_65912 ) ) ( not ( = ?auto_65913 ?auto_65930 ) ) ( HOIST-AT ?auto_65931 ?auto_65913 ) ( not ( = ?auto_65925 ?auto_65931 ) ) ( SURFACE-AT ?auto_65911 ?auto_65913 ) ( ON ?auto_65911 ?auto_65926 ) ( CLEAR ?auto_65911 ) ( not ( = ?auto_65911 ?auto_65926 ) ) ( not ( = ?auto_65912 ?auto_65926 ) ) ( IS-CRATE ?auto_65912 ) ( not ( = ?auto_65911 ?auto_65917 ) ) ( not ( = ?auto_65912 ?auto_65917 ) ) ( not ( = ?auto_65926 ?auto_65917 ) ) ( AVAILABLE ?auto_65931 ) ( SURFACE-AT ?auto_65912 ?auto_65913 ) ( ON ?auto_65912 ?auto_65923 ) ( CLEAR ?auto_65912 ) ( not ( = ?auto_65911 ?auto_65923 ) ) ( not ( = ?auto_65912 ?auto_65923 ) ) ( not ( = ?auto_65926 ?auto_65923 ) ) ( not ( = ?auto_65917 ?auto_65923 ) ) ( IS-CRATE ?auto_65917 ) ( not ( = ?auto_65911 ?auto_65918 ) ) ( not ( = ?auto_65912 ?auto_65918 ) ) ( not ( = ?auto_65926 ?auto_65918 ) ) ( not ( = ?auto_65917 ?auto_65918 ) ) ( not ( = ?auto_65923 ?auto_65918 ) ) ( not ( = ?auto_65915 ?auto_65930 ) ) ( not ( = ?auto_65913 ?auto_65915 ) ) ( HOIST-AT ?auto_65919 ?auto_65915 ) ( not ( = ?auto_65925 ?auto_65919 ) ) ( not ( = ?auto_65931 ?auto_65919 ) ) ( AVAILABLE ?auto_65919 ) ( SURFACE-AT ?auto_65917 ?auto_65915 ) ( ON ?auto_65917 ?auto_65927 ) ( CLEAR ?auto_65917 ) ( not ( = ?auto_65911 ?auto_65927 ) ) ( not ( = ?auto_65912 ?auto_65927 ) ) ( not ( = ?auto_65926 ?auto_65927 ) ) ( not ( = ?auto_65917 ?auto_65927 ) ) ( not ( = ?auto_65923 ?auto_65927 ) ) ( not ( = ?auto_65918 ?auto_65927 ) ) ( IS-CRATE ?auto_65918 ) ( not ( = ?auto_65911 ?auto_65929 ) ) ( not ( = ?auto_65912 ?auto_65929 ) ) ( not ( = ?auto_65926 ?auto_65929 ) ) ( not ( = ?auto_65917 ?auto_65929 ) ) ( not ( = ?auto_65923 ?auto_65929 ) ) ( not ( = ?auto_65918 ?auto_65929 ) ) ( not ( = ?auto_65927 ?auto_65929 ) ) ( not ( = ?auto_65924 ?auto_65930 ) ) ( not ( = ?auto_65913 ?auto_65924 ) ) ( not ( = ?auto_65915 ?auto_65924 ) ) ( HOIST-AT ?auto_65928 ?auto_65924 ) ( not ( = ?auto_65925 ?auto_65928 ) ) ( not ( = ?auto_65931 ?auto_65928 ) ) ( not ( = ?auto_65919 ?auto_65928 ) ) ( AVAILABLE ?auto_65928 ) ( SURFACE-AT ?auto_65918 ?auto_65924 ) ( ON ?auto_65918 ?auto_65920 ) ( CLEAR ?auto_65918 ) ( not ( = ?auto_65911 ?auto_65920 ) ) ( not ( = ?auto_65912 ?auto_65920 ) ) ( not ( = ?auto_65926 ?auto_65920 ) ) ( not ( = ?auto_65917 ?auto_65920 ) ) ( not ( = ?auto_65923 ?auto_65920 ) ) ( not ( = ?auto_65918 ?auto_65920 ) ) ( not ( = ?auto_65927 ?auto_65920 ) ) ( not ( = ?auto_65929 ?auto_65920 ) ) ( SURFACE-AT ?auto_65922 ?auto_65930 ) ( CLEAR ?auto_65922 ) ( IS-CRATE ?auto_65929 ) ( not ( = ?auto_65911 ?auto_65922 ) ) ( not ( = ?auto_65912 ?auto_65922 ) ) ( not ( = ?auto_65926 ?auto_65922 ) ) ( not ( = ?auto_65917 ?auto_65922 ) ) ( not ( = ?auto_65923 ?auto_65922 ) ) ( not ( = ?auto_65918 ?auto_65922 ) ) ( not ( = ?auto_65927 ?auto_65922 ) ) ( not ( = ?auto_65929 ?auto_65922 ) ) ( not ( = ?auto_65920 ?auto_65922 ) ) ( AVAILABLE ?auto_65925 ) ( TRUCK-AT ?auto_65916 ?auto_65921 ) ( not ( = ?auto_65921 ?auto_65930 ) ) ( not ( = ?auto_65913 ?auto_65921 ) ) ( not ( = ?auto_65915 ?auto_65921 ) ) ( not ( = ?auto_65924 ?auto_65921 ) ) ( HOIST-AT ?auto_65914 ?auto_65921 ) ( not ( = ?auto_65925 ?auto_65914 ) ) ( not ( = ?auto_65931 ?auto_65914 ) ) ( not ( = ?auto_65919 ?auto_65914 ) ) ( not ( = ?auto_65928 ?auto_65914 ) ) ( AVAILABLE ?auto_65914 ) ( SURFACE-AT ?auto_65929 ?auto_65921 ) ( ON ?auto_65929 ?auto_65932 ) ( CLEAR ?auto_65929 ) ( not ( = ?auto_65911 ?auto_65932 ) ) ( not ( = ?auto_65912 ?auto_65932 ) ) ( not ( = ?auto_65926 ?auto_65932 ) ) ( not ( = ?auto_65917 ?auto_65932 ) ) ( not ( = ?auto_65923 ?auto_65932 ) ) ( not ( = ?auto_65918 ?auto_65932 ) ) ( not ( = ?auto_65927 ?auto_65932 ) ) ( not ( = ?auto_65929 ?auto_65932 ) ) ( not ( = ?auto_65920 ?auto_65932 ) ) ( not ( = ?auto_65922 ?auto_65932 ) ) )
    :subtasks
    ( ( !LIFT ?auto_65914 ?auto_65929 ?auto_65932 ?auto_65921 )
      ( MAKE-ON ?auto_65911 ?auto_65912 )
      ( MAKE-ON-VERIFY ?auto_65911 ?auto_65912 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_65933 - SURFACE
      ?auto_65934 - SURFACE
    )
    :vars
    (
      ?auto_65946 - HOIST
      ?auto_65951 - PLACE
      ?auto_65936 - PLACE
      ?auto_65952 - HOIST
      ?auto_65938 - SURFACE
      ?auto_65937 - SURFACE
      ?auto_65943 - SURFACE
      ?auto_65939 - SURFACE
      ?auto_65949 - PLACE
      ?auto_65942 - HOIST
      ?auto_65948 - SURFACE
      ?auto_65950 - SURFACE
      ?auto_65941 - PLACE
      ?auto_65953 - HOIST
      ?auto_65947 - SURFACE
      ?auto_65944 - SURFACE
      ?auto_65935 - PLACE
      ?auto_65940 - HOIST
      ?auto_65954 - SURFACE
      ?auto_65945 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_65946 ?auto_65951 ) ( IS-CRATE ?auto_65933 ) ( not ( = ?auto_65933 ?auto_65934 ) ) ( not ( = ?auto_65936 ?auto_65951 ) ) ( HOIST-AT ?auto_65952 ?auto_65936 ) ( not ( = ?auto_65946 ?auto_65952 ) ) ( SURFACE-AT ?auto_65933 ?auto_65936 ) ( ON ?auto_65933 ?auto_65938 ) ( CLEAR ?auto_65933 ) ( not ( = ?auto_65933 ?auto_65938 ) ) ( not ( = ?auto_65934 ?auto_65938 ) ) ( IS-CRATE ?auto_65934 ) ( not ( = ?auto_65933 ?auto_65937 ) ) ( not ( = ?auto_65934 ?auto_65937 ) ) ( not ( = ?auto_65938 ?auto_65937 ) ) ( AVAILABLE ?auto_65952 ) ( SURFACE-AT ?auto_65934 ?auto_65936 ) ( ON ?auto_65934 ?auto_65943 ) ( CLEAR ?auto_65934 ) ( not ( = ?auto_65933 ?auto_65943 ) ) ( not ( = ?auto_65934 ?auto_65943 ) ) ( not ( = ?auto_65938 ?auto_65943 ) ) ( not ( = ?auto_65937 ?auto_65943 ) ) ( IS-CRATE ?auto_65937 ) ( not ( = ?auto_65933 ?auto_65939 ) ) ( not ( = ?auto_65934 ?auto_65939 ) ) ( not ( = ?auto_65938 ?auto_65939 ) ) ( not ( = ?auto_65937 ?auto_65939 ) ) ( not ( = ?auto_65943 ?auto_65939 ) ) ( not ( = ?auto_65949 ?auto_65951 ) ) ( not ( = ?auto_65936 ?auto_65949 ) ) ( HOIST-AT ?auto_65942 ?auto_65949 ) ( not ( = ?auto_65946 ?auto_65942 ) ) ( not ( = ?auto_65952 ?auto_65942 ) ) ( AVAILABLE ?auto_65942 ) ( SURFACE-AT ?auto_65937 ?auto_65949 ) ( ON ?auto_65937 ?auto_65948 ) ( CLEAR ?auto_65937 ) ( not ( = ?auto_65933 ?auto_65948 ) ) ( not ( = ?auto_65934 ?auto_65948 ) ) ( not ( = ?auto_65938 ?auto_65948 ) ) ( not ( = ?auto_65937 ?auto_65948 ) ) ( not ( = ?auto_65943 ?auto_65948 ) ) ( not ( = ?auto_65939 ?auto_65948 ) ) ( IS-CRATE ?auto_65939 ) ( not ( = ?auto_65933 ?auto_65950 ) ) ( not ( = ?auto_65934 ?auto_65950 ) ) ( not ( = ?auto_65938 ?auto_65950 ) ) ( not ( = ?auto_65937 ?auto_65950 ) ) ( not ( = ?auto_65943 ?auto_65950 ) ) ( not ( = ?auto_65939 ?auto_65950 ) ) ( not ( = ?auto_65948 ?auto_65950 ) ) ( not ( = ?auto_65941 ?auto_65951 ) ) ( not ( = ?auto_65936 ?auto_65941 ) ) ( not ( = ?auto_65949 ?auto_65941 ) ) ( HOIST-AT ?auto_65953 ?auto_65941 ) ( not ( = ?auto_65946 ?auto_65953 ) ) ( not ( = ?auto_65952 ?auto_65953 ) ) ( not ( = ?auto_65942 ?auto_65953 ) ) ( AVAILABLE ?auto_65953 ) ( SURFACE-AT ?auto_65939 ?auto_65941 ) ( ON ?auto_65939 ?auto_65947 ) ( CLEAR ?auto_65939 ) ( not ( = ?auto_65933 ?auto_65947 ) ) ( not ( = ?auto_65934 ?auto_65947 ) ) ( not ( = ?auto_65938 ?auto_65947 ) ) ( not ( = ?auto_65937 ?auto_65947 ) ) ( not ( = ?auto_65943 ?auto_65947 ) ) ( not ( = ?auto_65939 ?auto_65947 ) ) ( not ( = ?auto_65948 ?auto_65947 ) ) ( not ( = ?auto_65950 ?auto_65947 ) ) ( SURFACE-AT ?auto_65944 ?auto_65951 ) ( CLEAR ?auto_65944 ) ( IS-CRATE ?auto_65950 ) ( not ( = ?auto_65933 ?auto_65944 ) ) ( not ( = ?auto_65934 ?auto_65944 ) ) ( not ( = ?auto_65938 ?auto_65944 ) ) ( not ( = ?auto_65937 ?auto_65944 ) ) ( not ( = ?auto_65943 ?auto_65944 ) ) ( not ( = ?auto_65939 ?auto_65944 ) ) ( not ( = ?auto_65948 ?auto_65944 ) ) ( not ( = ?auto_65950 ?auto_65944 ) ) ( not ( = ?auto_65947 ?auto_65944 ) ) ( AVAILABLE ?auto_65946 ) ( not ( = ?auto_65935 ?auto_65951 ) ) ( not ( = ?auto_65936 ?auto_65935 ) ) ( not ( = ?auto_65949 ?auto_65935 ) ) ( not ( = ?auto_65941 ?auto_65935 ) ) ( HOIST-AT ?auto_65940 ?auto_65935 ) ( not ( = ?auto_65946 ?auto_65940 ) ) ( not ( = ?auto_65952 ?auto_65940 ) ) ( not ( = ?auto_65942 ?auto_65940 ) ) ( not ( = ?auto_65953 ?auto_65940 ) ) ( AVAILABLE ?auto_65940 ) ( SURFACE-AT ?auto_65950 ?auto_65935 ) ( ON ?auto_65950 ?auto_65954 ) ( CLEAR ?auto_65950 ) ( not ( = ?auto_65933 ?auto_65954 ) ) ( not ( = ?auto_65934 ?auto_65954 ) ) ( not ( = ?auto_65938 ?auto_65954 ) ) ( not ( = ?auto_65937 ?auto_65954 ) ) ( not ( = ?auto_65943 ?auto_65954 ) ) ( not ( = ?auto_65939 ?auto_65954 ) ) ( not ( = ?auto_65948 ?auto_65954 ) ) ( not ( = ?auto_65950 ?auto_65954 ) ) ( not ( = ?auto_65947 ?auto_65954 ) ) ( not ( = ?auto_65944 ?auto_65954 ) ) ( TRUCK-AT ?auto_65945 ?auto_65951 ) )
    :subtasks
    ( ( !DRIVE ?auto_65945 ?auto_65951 ?auto_65935 )
      ( MAKE-ON ?auto_65933 ?auto_65934 )
      ( MAKE-ON-VERIFY ?auto_65933 ?auto_65934 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_65955 - SURFACE
      ?auto_65956 - SURFACE
    )
    :vars
    (
      ?auto_65963 - HOIST
      ?auto_65966 - PLACE
      ?auto_65973 - PLACE
      ?auto_65967 - HOIST
      ?auto_65957 - SURFACE
      ?auto_65974 - SURFACE
      ?auto_65970 - SURFACE
      ?auto_65971 - SURFACE
      ?auto_65958 - PLACE
      ?auto_65972 - HOIST
      ?auto_65960 - SURFACE
      ?auto_65969 - SURFACE
      ?auto_65976 - PLACE
      ?auto_65968 - HOIST
      ?auto_65964 - SURFACE
      ?auto_65975 - SURFACE
      ?auto_65959 - PLACE
      ?auto_65965 - HOIST
      ?auto_65961 - SURFACE
      ?auto_65962 - TRUCK
      ?auto_65977 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_65963 ?auto_65966 ) ( IS-CRATE ?auto_65955 ) ( not ( = ?auto_65955 ?auto_65956 ) ) ( not ( = ?auto_65973 ?auto_65966 ) ) ( HOIST-AT ?auto_65967 ?auto_65973 ) ( not ( = ?auto_65963 ?auto_65967 ) ) ( SURFACE-AT ?auto_65955 ?auto_65973 ) ( ON ?auto_65955 ?auto_65957 ) ( CLEAR ?auto_65955 ) ( not ( = ?auto_65955 ?auto_65957 ) ) ( not ( = ?auto_65956 ?auto_65957 ) ) ( IS-CRATE ?auto_65956 ) ( not ( = ?auto_65955 ?auto_65974 ) ) ( not ( = ?auto_65956 ?auto_65974 ) ) ( not ( = ?auto_65957 ?auto_65974 ) ) ( AVAILABLE ?auto_65967 ) ( SURFACE-AT ?auto_65956 ?auto_65973 ) ( ON ?auto_65956 ?auto_65970 ) ( CLEAR ?auto_65956 ) ( not ( = ?auto_65955 ?auto_65970 ) ) ( not ( = ?auto_65956 ?auto_65970 ) ) ( not ( = ?auto_65957 ?auto_65970 ) ) ( not ( = ?auto_65974 ?auto_65970 ) ) ( IS-CRATE ?auto_65974 ) ( not ( = ?auto_65955 ?auto_65971 ) ) ( not ( = ?auto_65956 ?auto_65971 ) ) ( not ( = ?auto_65957 ?auto_65971 ) ) ( not ( = ?auto_65974 ?auto_65971 ) ) ( not ( = ?auto_65970 ?auto_65971 ) ) ( not ( = ?auto_65958 ?auto_65966 ) ) ( not ( = ?auto_65973 ?auto_65958 ) ) ( HOIST-AT ?auto_65972 ?auto_65958 ) ( not ( = ?auto_65963 ?auto_65972 ) ) ( not ( = ?auto_65967 ?auto_65972 ) ) ( AVAILABLE ?auto_65972 ) ( SURFACE-AT ?auto_65974 ?auto_65958 ) ( ON ?auto_65974 ?auto_65960 ) ( CLEAR ?auto_65974 ) ( not ( = ?auto_65955 ?auto_65960 ) ) ( not ( = ?auto_65956 ?auto_65960 ) ) ( not ( = ?auto_65957 ?auto_65960 ) ) ( not ( = ?auto_65974 ?auto_65960 ) ) ( not ( = ?auto_65970 ?auto_65960 ) ) ( not ( = ?auto_65971 ?auto_65960 ) ) ( IS-CRATE ?auto_65971 ) ( not ( = ?auto_65955 ?auto_65969 ) ) ( not ( = ?auto_65956 ?auto_65969 ) ) ( not ( = ?auto_65957 ?auto_65969 ) ) ( not ( = ?auto_65974 ?auto_65969 ) ) ( not ( = ?auto_65970 ?auto_65969 ) ) ( not ( = ?auto_65971 ?auto_65969 ) ) ( not ( = ?auto_65960 ?auto_65969 ) ) ( not ( = ?auto_65976 ?auto_65966 ) ) ( not ( = ?auto_65973 ?auto_65976 ) ) ( not ( = ?auto_65958 ?auto_65976 ) ) ( HOIST-AT ?auto_65968 ?auto_65976 ) ( not ( = ?auto_65963 ?auto_65968 ) ) ( not ( = ?auto_65967 ?auto_65968 ) ) ( not ( = ?auto_65972 ?auto_65968 ) ) ( AVAILABLE ?auto_65968 ) ( SURFACE-AT ?auto_65971 ?auto_65976 ) ( ON ?auto_65971 ?auto_65964 ) ( CLEAR ?auto_65971 ) ( not ( = ?auto_65955 ?auto_65964 ) ) ( not ( = ?auto_65956 ?auto_65964 ) ) ( not ( = ?auto_65957 ?auto_65964 ) ) ( not ( = ?auto_65974 ?auto_65964 ) ) ( not ( = ?auto_65970 ?auto_65964 ) ) ( not ( = ?auto_65971 ?auto_65964 ) ) ( not ( = ?auto_65960 ?auto_65964 ) ) ( not ( = ?auto_65969 ?auto_65964 ) ) ( IS-CRATE ?auto_65969 ) ( not ( = ?auto_65955 ?auto_65975 ) ) ( not ( = ?auto_65956 ?auto_65975 ) ) ( not ( = ?auto_65957 ?auto_65975 ) ) ( not ( = ?auto_65974 ?auto_65975 ) ) ( not ( = ?auto_65970 ?auto_65975 ) ) ( not ( = ?auto_65971 ?auto_65975 ) ) ( not ( = ?auto_65960 ?auto_65975 ) ) ( not ( = ?auto_65969 ?auto_65975 ) ) ( not ( = ?auto_65964 ?auto_65975 ) ) ( not ( = ?auto_65959 ?auto_65966 ) ) ( not ( = ?auto_65973 ?auto_65959 ) ) ( not ( = ?auto_65958 ?auto_65959 ) ) ( not ( = ?auto_65976 ?auto_65959 ) ) ( HOIST-AT ?auto_65965 ?auto_65959 ) ( not ( = ?auto_65963 ?auto_65965 ) ) ( not ( = ?auto_65967 ?auto_65965 ) ) ( not ( = ?auto_65972 ?auto_65965 ) ) ( not ( = ?auto_65968 ?auto_65965 ) ) ( AVAILABLE ?auto_65965 ) ( SURFACE-AT ?auto_65969 ?auto_65959 ) ( ON ?auto_65969 ?auto_65961 ) ( CLEAR ?auto_65969 ) ( not ( = ?auto_65955 ?auto_65961 ) ) ( not ( = ?auto_65956 ?auto_65961 ) ) ( not ( = ?auto_65957 ?auto_65961 ) ) ( not ( = ?auto_65974 ?auto_65961 ) ) ( not ( = ?auto_65970 ?auto_65961 ) ) ( not ( = ?auto_65971 ?auto_65961 ) ) ( not ( = ?auto_65960 ?auto_65961 ) ) ( not ( = ?auto_65969 ?auto_65961 ) ) ( not ( = ?auto_65964 ?auto_65961 ) ) ( not ( = ?auto_65975 ?auto_65961 ) ) ( TRUCK-AT ?auto_65962 ?auto_65966 ) ( SURFACE-AT ?auto_65977 ?auto_65966 ) ( CLEAR ?auto_65977 ) ( LIFTING ?auto_65963 ?auto_65975 ) ( IS-CRATE ?auto_65975 ) ( not ( = ?auto_65955 ?auto_65977 ) ) ( not ( = ?auto_65956 ?auto_65977 ) ) ( not ( = ?auto_65957 ?auto_65977 ) ) ( not ( = ?auto_65974 ?auto_65977 ) ) ( not ( = ?auto_65970 ?auto_65977 ) ) ( not ( = ?auto_65971 ?auto_65977 ) ) ( not ( = ?auto_65960 ?auto_65977 ) ) ( not ( = ?auto_65969 ?auto_65977 ) ) ( not ( = ?auto_65964 ?auto_65977 ) ) ( not ( = ?auto_65975 ?auto_65977 ) ) ( not ( = ?auto_65961 ?auto_65977 ) ) )
    :subtasks
    ( ( !DROP ?auto_65963 ?auto_65975 ?auto_65977 ?auto_65966 )
      ( MAKE-ON ?auto_65955 ?auto_65956 )
      ( MAKE-ON-VERIFY ?auto_65955 ?auto_65956 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_65978 - SURFACE
      ?auto_65979 - SURFACE
    )
    :vars
    (
      ?auto_65988 - HOIST
      ?auto_65991 - PLACE
      ?auto_65998 - PLACE
      ?auto_65990 - HOIST
      ?auto_65995 - SURFACE
      ?auto_65997 - SURFACE
      ?auto_65981 - SURFACE
      ?auto_65987 - SURFACE
      ?auto_66000 - PLACE
      ?auto_65982 - HOIST
      ?auto_65984 - SURFACE
      ?auto_65994 - SURFACE
      ?auto_65989 - PLACE
      ?auto_65999 - HOIST
      ?auto_65992 - SURFACE
      ?auto_65996 - SURFACE
      ?auto_65985 - PLACE
      ?auto_65983 - HOIST
      ?auto_65980 - SURFACE
      ?auto_65993 - TRUCK
      ?auto_65986 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_65988 ?auto_65991 ) ( IS-CRATE ?auto_65978 ) ( not ( = ?auto_65978 ?auto_65979 ) ) ( not ( = ?auto_65998 ?auto_65991 ) ) ( HOIST-AT ?auto_65990 ?auto_65998 ) ( not ( = ?auto_65988 ?auto_65990 ) ) ( SURFACE-AT ?auto_65978 ?auto_65998 ) ( ON ?auto_65978 ?auto_65995 ) ( CLEAR ?auto_65978 ) ( not ( = ?auto_65978 ?auto_65995 ) ) ( not ( = ?auto_65979 ?auto_65995 ) ) ( IS-CRATE ?auto_65979 ) ( not ( = ?auto_65978 ?auto_65997 ) ) ( not ( = ?auto_65979 ?auto_65997 ) ) ( not ( = ?auto_65995 ?auto_65997 ) ) ( AVAILABLE ?auto_65990 ) ( SURFACE-AT ?auto_65979 ?auto_65998 ) ( ON ?auto_65979 ?auto_65981 ) ( CLEAR ?auto_65979 ) ( not ( = ?auto_65978 ?auto_65981 ) ) ( not ( = ?auto_65979 ?auto_65981 ) ) ( not ( = ?auto_65995 ?auto_65981 ) ) ( not ( = ?auto_65997 ?auto_65981 ) ) ( IS-CRATE ?auto_65997 ) ( not ( = ?auto_65978 ?auto_65987 ) ) ( not ( = ?auto_65979 ?auto_65987 ) ) ( not ( = ?auto_65995 ?auto_65987 ) ) ( not ( = ?auto_65997 ?auto_65987 ) ) ( not ( = ?auto_65981 ?auto_65987 ) ) ( not ( = ?auto_66000 ?auto_65991 ) ) ( not ( = ?auto_65998 ?auto_66000 ) ) ( HOIST-AT ?auto_65982 ?auto_66000 ) ( not ( = ?auto_65988 ?auto_65982 ) ) ( not ( = ?auto_65990 ?auto_65982 ) ) ( AVAILABLE ?auto_65982 ) ( SURFACE-AT ?auto_65997 ?auto_66000 ) ( ON ?auto_65997 ?auto_65984 ) ( CLEAR ?auto_65997 ) ( not ( = ?auto_65978 ?auto_65984 ) ) ( not ( = ?auto_65979 ?auto_65984 ) ) ( not ( = ?auto_65995 ?auto_65984 ) ) ( not ( = ?auto_65997 ?auto_65984 ) ) ( not ( = ?auto_65981 ?auto_65984 ) ) ( not ( = ?auto_65987 ?auto_65984 ) ) ( IS-CRATE ?auto_65987 ) ( not ( = ?auto_65978 ?auto_65994 ) ) ( not ( = ?auto_65979 ?auto_65994 ) ) ( not ( = ?auto_65995 ?auto_65994 ) ) ( not ( = ?auto_65997 ?auto_65994 ) ) ( not ( = ?auto_65981 ?auto_65994 ) ) ( not ( = ?auto_65987 ?auto_65994 ) ) ( not ( = ?auto_65984 ?auto_65994 ) ) ( not ( = ?auto_65989 ?auto_65991 ) ) ( not ( = ?auto_65998 ?auto_65989 ) ) ( not ( = ?auto_66000 ?auto_65989 ) ) ( HOIST-AT ?auto_65999 ?auto_65989 ) ( not ( = ?auto_65988 ?auto_65999 ) ) ( not ( = ?auto_65990 ?auto_65999 ) ) ( not ( = ?auto_65982 ?auto_65999 ) ) ( AVAILABLE ?auto_65999 ) ( SURFACE-AT ?auto_65987 ?auto_65989 ) ( ON ?auto_65987 ?auto_65992 ) ( CLEAR ?auto_65987 ) ( not ( = ?auto_65978 ?auto_65992 ) ) ( not ( = ?auto_65979 ?auto_65992 ) ) ( not ( = ?auto_65995 ?auto_65992 ) ) ( not ( = ?auto_65997 ?auto_65992 ) ) ( not ( = ?auto_65981 ?auto_65992 ) ) ( not ( = ?auto_65987 ?auto_65992 ) ) ( not ( = ?auto_65984 ?auto_65992 ) ) ( not ( = ?auto_65994 ?auto_65992 ) ) ( IS-CRATE ?auto_65994 ) ( not ( = ?auto_65978 ?auto_65996 ) ) ( not ( = ?auto_65979 ?auto_65996 ) ) ( not ( = ?auto_65995 ?auto_65996 ) ) ( not ( = ?auto_65997 ?auto_65996 ) ) ( not ( = ?auto_65981 ?auto_65996 ) ) ( not ( = ?auto_65987 ?auto_65996 ) ) ( not ( = ?auto_65984 ?auto_65996 ) ) ( not ( = ?auto_65994 ?auto_65996 ) ) ( not ( = ?auto_65992 ?auto_65996 ) ) ( not ( = ?auto_65985 ?auto_65991 ) ) ( not ( = ?auto_65998 ?auto_65985 ) ) ( not ( = ?auto_66000 ?auto_65985 ) ) ( not ( = ?auto_65989 ?auto_65985 ) ) ( HOIST-AT ?auto_65983 ?auto_65985 ) ( not ( = ?auto_65988 ?auto_65983 ) ) ( not ( = ?auto_65990 ?auto_65983 ) ) ( not ( = ?auto_65982 ?auto_65983 ) ) ( not ( = ?auto_65999 ?auto_65983 ) ) ( AVAILABLE ?auto_65983 ) ( SURFACE-AT ?auto_65994 ?auto_65985 ) ( ON ?auto_65994 ?auto_65980 ) ( CLEAR ?auto_65994 ) ( not ( = ?auto_65978 ?auto_65980 ) ) ( not ( = ?auto_65979 ?auto_65980 ) ) ( not ( = ?auto_65995 ?auto_65980 ) ) ( not ( = ?auto_65997 ?auto_65980 ) ) ( not ( = ?auto_65981 ?auto_65980 ) ) ( not ( = ?auto_65987 ?auto_65980 ) ) ( not ( = ?auto_65984 ?auto_65980 ) ) ( not ( = ?auto_65994 ?auto_65980 ) ) ( not ( = ?auto_65992 ?auto_65980 ) ) ( not ( = ?auto_65996 ?auto_65980 ) ) ( TRUCK-AT ?auto_65993 ?auto_65991 ) ( SURFACE-AT ?auto_65986 ?auto_65991 ) ( CLEAR ?auto_65986 ) ( IS-CRATE ?auto_65996 ) ( not ( = ?auto_65978 ?auto_65986 ) ) ( not ( = ?auto_65979 ?auto_65986 ) ) ( not ( = ?auto_65995 ?auto_65986 ) ) ( not ( = ?auto_65997 ?auto_65986 ) ) ( not ( = ?auto_65981 ?auto_65986 ) ) ( not ( = ?auto_65987 ?auto_65986 ) ) ( not ( = ?auto_65984 ?auto_65986 ) ) ( not ( = ?auto_65994 ?auto_65986 ) ) ( not ( = ?auto_65992 ?auto_65986 ) ) ( not ( = ?auto_65996 ?auto_65986 ) ) ( not ( = ?auto_65980 ?auto_65986 ) ) ( AVAILABLE ?auto_65988 ) ( IN ?auto_65996 ?auto_65993 ) )
    :subtasks
    ( ( !UNLOAD ?auto_65988 ?auto_65996 ?auto_65993 ?auto_65991 )
      ( MAKE-ON ?auto_65978 ?auto_65979 )
      ( MAKE-ON-VERIFY ?auto_65978 ?auto_65979 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_66001 - SURFACE
      ?auto_66002 - SURFACE
    )
    :vars
    (
      ?auto_66003 - HOIST
      ?auto_66016 - PLACE
      ?auto_66008 - PLACE
      ?auto_66022 - HOIST
      ?auto_66019 - SURFACE
      ?auto_66011 - SURFACE
      ?auto_66013 - SURFACE
      ?auto_66017 - SURFACE
      ?auto_66012 - PLACE
      ?auto_66009 - HOIST
      ?auto_66010 - SURFACE
      ?auto_66006 - SURFACE
      ?auto_66005 - PLACE
      ?auto_66004 - HOIST
      ?auto_66007 - SURFACE
      ?auto_66015 - SURFACE
      ?auto_66021 - PLACE
      ?auto_66020 - HOIST
      ?auto_66014 - SURFACE
      ?auto_66023 - SURFACE
      ?auto_66018 - TRUCK
      ?auto_66024 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_66003 ?auto_66016 ) ( IS-CRATE ?auto_66001 ) ( not ( = ?auto_66001 ?auto_66002 ) ) ( not ( = ?auto_66008 ?auto_66016 ) ) ( HOIST-AT ?auto_66022 ?auto_66008 ) ( not ( = ?auto_66003 ?auto_66022 ) ) ( SURFACE-AT ?auto_66001 ?auto_66008 ) ( ON ?auto_66001 ?auto_66019 ) ( CLEAR ?auto_66001 ) ( not ( = ?auto_66001 ?auto_66019 ) ) ( not ( = ?auto_66002 ?auto_66019 ) ) ( IS-CRATE ?auto_66002 ) ( not ( = ?auto_66001 ?auto_66011 ) ) ( not ( = ?auto_66002 ?auto_66011 ) ) ( not ( = ?auto_66019 ?auto_66011 ) ) ( AVAILABLE ?auto_66022 ) ( SURFACE-AT ?auto_66002 ?auto_66008 ) ( ON ?auto_66002 ?auto_66013 ) ( CLEAR ?auto_66002 ) ( not ( = ?auto_66001 ?auto_66013 ) ) ( not ( = ?auto_66002 ?auto_66013 ) ) ( not ( = ?auto_66019 ?auto_66013 ) ) ( not ( = ?auto_66011 ?auto_66013 ) ) ( IS-CRATE ?auto_66011 ) ( not ( = ?auto_66001 ?auto_66017 ) ) ( not ( = ?auto_66002 ?auto_66017 ) ) ( not ( = ?auto_66019 ?auto_66017 ) ) ( not ( = ?auto_66011 ?auto_66017 ) ) ( not ( = ?auto_66013 ?auto_66017 ) ) ( not ( = ?auto_66012 ?auto_66016 ) ) ( not ( = ?auto_66008 ?auto_66012 ) ) ( HOIST-AT ?auto_66009 ?auto_66012 ) ( not ( = ?auto_66003 ?auto_66009 ) ) ( not ( = ?auto_66022 ?auto_66009 ) ) ( AVAILABLE ?auto_66009 ) ( SURFACE-AT ?auto_66011 ?auto_66012 ) ( ON ?auto_66011 ?auto_66010 ) ( CLEAR ?auto_66011 ) ( not ( = ?auto_66001 ?auto_66010 ) ) ( not ( = ?auto_66002 ?auto_66010 ) ) ( not ( = ?auto_66019 ?auto_66010 ) ) ( not ( = ?auto_66011 ?auto_66010 ) ) ( not ( = ?auto_66013 ?auto_66010 ) ) ( not ( = ?auto_66017 ?auto_66010 ) ) ( IS-CRATE ?auto_66017 ) ( not ( = ?auto_66001 ?auto_66006 ) ) ( not ( = ?auto_66002 ?auto_66006 ) ) ( not ( = ?auto_66019 ?auto_66006 ) ) ( not ( = ?auto_66011 ?auto_66006 ) ) ( not ( = ?auto_66013 ?auto_66006 ) ) ( not ( = ?auto_66017 ?auto_66006 ) ) ( not ( = ?auto_66010 ?auto_66006 ) ) ( not ( = ?auto_66005 ?auto_66016 ) ) ( not ( = ?auto_66008 ?auto_66005 ) ) ( not ( = ?auto_66012 ?auto_66005 ) ) ( HOIST-AT ?auto_66004 ?auto_66005 ) ( not ( = ?auto_66003 ?auto_66004 ) ) ( not ( = ?auto_66022 ?auto_66004 ) ) ( not ( = ?auto_66009 ?auto_66004 ) ) ( AVAILABLE ?auto_66004 ) ( SURFACE-AT ?auto_66017 ?auto_66005 ) ( ON ?auto_66017 ?auto_66007 ) ( CLEAR ?auto_66017 ) ( not ( = ?auto_66001 ?auto_66007 ) ) ( not ( = ?auto_66002 ?auto_66007 ) ) ( not ( = ?auto_66019 ?auto_66007 ) ) ( not ( = ?auto_66011 ?auto_66007 ) ) ( not ( = ?auto_66013 ?auto_66007 ) ) ( not ( = ?auto_66017 ?auto_66007 ) ) ( not ( = ?auto_66010 ?auto_66007 ) ) ( not ( = ?auto_66006 ?auto_66007 ) ) ( IS-CRATE ?auto_66006 ) ( not ( = ?auto_66001 ?auto_66015 ) ) ( not ( = ?auto_66002 ?auto_66015 ) ) ( not ( = ?auto_66019 ?auto_66015 ) ) ( not ( = ?auto_66011 ?auto_66015 ) ) ( not ( = ?auto_66013 ?auto_66015 ) ) ( not ( = ?auto_66017 ?auto_66015 ) ) ( not ( = ?auto_66010 ?auto_66015 ) ) ( not ( = ?auto_66006 ?auto_66015 ) ) ( not ( = ?auto_66007 ?auto_66015 ) ) ( not ( = ?auto_66021 ?auto_66016 ) ) ( not ( = ?auto_66008 ?auto_66021 ) ) ( not ( = ?auto_66012 ?auto_66021 ) ) ( not ( = ?auto_66005 ?auto_66021 ) ) ( HOIST-AT ?auto_66020 ?auto_66021 ) ( not ( = ?auto_66003 ?auto_66020 ) ) ( not ( = ?auto_66022 ?auto_66020 ) ) ( not ( = ?auto_66009 ?auto_66020 ) ) ( not ( = ?auto_66004 ?auto_66020 ) ) ( AVAILABLE ?auto_66020 ) ( SURFACE-AT ?auto_66006 ?auto_66021 ) ( ON ?auto_66006 ?auto_66014 ) ( CLEAR ?auto_66006 ) ( not ( = ?auto_66001 ?auto_66014 ) ) ( not ( = ?auto_66002 ?auto_66014 ) ) ( not ( = ?auto_66019 ?auto_66014 ) ) ( not ( = ?auto_66011 ?auto_66014 ) ) ( not ( = ?auto_66013 ?auto_66014 ) ) ( not ( = ?auto_66017 ?auto_66014 ) ) ( not ( = ?auto_66010 ?auto_66014 ) ) ( not ( = ?auto_66006 ?auto_66014 ) ) ( not ( = ?auto_66007 ?auto_66014 ) ) ( not ( = ?auto_66015 ?auto_66014 ) ) ( SURFACE-AT ?auto_66023 ?auto_66016 ) ( CLEAR ?auto_66023 ) ( IS-CRATE ?auto_66015 ) ( not ( = ?auto_66001 ?auto_66023 ) ) ( not ( = ?auto_66002 ?auto_66023 ) ) ( not ( = ?auto_66019 ?auto_66023 ) ) ( not ( = ?auto_66011 ?auto_66023 ) ) ( not ( = ?auto_66013 ?auto_66023 ) ) ( not ( = ?auto_66017 ?auto_66023 ) ) ( not ( = ?auto_66010 ?auto_66023 ) ) ( not ( = ?auto_66006 ?auto_66023 ) ) ( not ( = ?auto_66007 ?auto_66023 ) ) ( not ( = ?auto_66015 ?auto_66023 ) ) ( not ( = ?auto_66014 ?auto_66023 ) ) ( AVAILABLE ?auto_66003 ) ( IN ?auto_66015 ?auto_66018 ) ( TRUCK-AT ?auto_66018 ?auto_66024 ) ( not ( = ?auto_66024 ?auto_66016 ) ) ( not ( = ?auto_66008 ?auto_66024 ) ) ( not ( = ?auto_66012 ?auto_66024 ) ) ( not ( = ?auto_66005 ?auto_66024 ) ) ( not ( = ?auto_66021 ?auto_66024 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_66018 ?auto_66024 ?auto_66016 )
      ( MAKE-ON ?auto_66001 ?auto_66002 )
      ( MAKE-ON-VERIFY ?auto_66001 ?auto_66002 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_66025 - SURFACE
      ?auto_66026 - SURFACE
    )
    :vars
    (
      ?auto_66042 - HOIST
      ?auto_66037 - PLACE
      ?auto_66034 - PLACE
      ?auto_66039 - HOIST
      ?auto_66046 - SURFACE
      ?auto_66041 - SURFACE
      ?auto_66027 - SURFACE
      ?auto_66043 - SURFACE
      ?auto_66028 - PLACE
      ?auto_66036 - HOIST
      ?auto_66045 - SURFACE
      ?auto_66029 - SURFACE
      ?auto_66033 - PLACE
      ?auto_66044 - HOIST
      ?auto_66038 - SURFACE
      ?auto_66032 - SURFACE
      ?auto_66048 - PLACE
      ?auto_66047 - HOIST
      ?auto_66031 - SURFACE
      ?auto_66040 - SURFACE
      ?auto_66035 - TRUCK
      ?auto_66030 - PLACE
      ?auto_66049 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_66042 ?auto_66037 ) ( IS-CRATE ?auto_66025 ) ( not ( = ?auto_66025 ?auto_66026 ) ) ( not ( = ?auto_66034 ?auto_66037 ) ) ( HOIST-AT ?auto_66039 ?auto_66034 ) ( not ( = ?auto_66042 ?auto_66039 ) ) ( SURFACE-AT ?auto_66025 ?auto_66034 ) ( ON ?auto_66025 ?auto_66046 ) ( CLEAR ?auto_66025 ) ( not ( = ?auto_66025 ?auto_66046 ) ) ( not ( = ?auto_66026 ?auto_66046 ) ) ( IS-CRATE ?auto_66026 ) ( not ( = ?auto_66025 ?auto_66041 ) ) ( not ( = ?auto_66026 ?auto_66041 ) ) ( not ( = ?auto_66046 ?auto_66041 ) ) ( AVAILABLE ?auto_66039 ) ( SURFACE-AT ?auto_66026 ?auto_66034 ) ( ON ?auto_66026 ?auto_66027 ) ( CLEAR ?auto_66026 ) ( not ( = ?auto_66025 ?auto_66027 ) ) ( not ( = ?auto_66026 ?auto_66027 ) ) ( not ( = ?auto_66046 ?auto_66027 ) ) ( not ( = ?auto_66041 ?auto_66027 ) ) ( IS-CRATE ?auto_66041 ) ( not ( = ?auto_66025 ?auto_66043 ) ) ( not ( = ?auto_66026 ?auto_66043 ) ) ( not ( = ?auto_66046 ?auto_66043 ) ) ( not ( = ?auto_66041 ?auto_66043 ) ) ( not ( = ?auto_66027 ?auto_66043 ) ) ( not ( = ?auto_66028 ?auto_66037 ) ) ( not ( = ?auto_66034 ?auto_66028 ) ) ( HOIST-AT ?auto_66036 ?auto_66028 ) ( not ( = ?auto_66042 ?auto_66036 ) ) ( not ( = ?auto_66039 ?auto_66036 ) ) ( AVAILABLE ?auto_66036 ) ( SURFACE-AT ?auto_66041 ?auto_66028 ) ( ON ?auto_66041 ?auto_66045 ) ( CLEAR ?auto_66041 ) ( not ( = ?auto_66025 ?auto_66045 ) ) ( not ( = ?auto_66026 ?auto_66045 ) ) ( not ( = ?auto_66046 ?auto_66045 ) ) ( not ( = ?auto_66041 ?auto_66045 ) ) ( not ( = ?auto_66027 ?auto_66045 ) ) ( not ( = ?auto_66043 ?auto_66045 ) ) ( IS-CRATE ?auto_66043 ) ( not ( = ?auto_66025 ?auto_66029 ) ) ( not ( = ?auto_66026 ?auto_66029 ) ) ( not ( = ?auto_66046 ?auto_66029 ) ) ( not ( = ?auto_66041 ?auto_66029 ) ) ( not ( = ?auto_66027 ?auto_66029 ) ) ( not ( = ?auto_66043 ?auto_66029 ) ) ( not ( = ?auto_66045 ?auto_66029 ) ) ( not ( = ?auto_66033 ?auto_66037 ) ) ( not ( = ?auto_66034 ?auto_66033 ) ) ( not ( = ?auto_66028 ?auto_66033 ) ) ( HOIST-AT ?auto_66044 ?auto_66033 ) ( not ( = ?auto_66042 ?auto_66044 ) ) ( not ( = ?auto_66039 ?auto_66044 ) ) ( not ( = ?auto_66036 ?auto_66044 ) ) ( AVAILABLE ?auto_66044 ) ( SURFACE-AT ?auto_66043 ?auto_66033 ) ( ON ?auto_66043 ?auto_66038 ) ( CLEAR ?auto_66043 ) ( not ( = ?auto_66025 ?auto_66038 ) ) ( not ( = ?auto_66026 ?auto_66038 ) ) ( not ( = ?auto_66046 ?auto_66038 ) ) ( not ( = ?auto_66041 ?auto_66038 ) ) ( not ( = ?auto_66027 ?auto_66038 ) ) ( not ( = ?auto_66043 ?auto_66038 ) ) ( not ( = ?auto_66045 ?auto_66038 ) ) ( not ( = ?auto_66029 ?auto_66038 ) ) ( IS-CRATE ?auto_66029 ) ( not ( = ?auto_66025 ?auto_66032 ) ) ( not ( = ?auto_66026 ?auto_66032 ) ) ( not ( = ?auto_66046 ?auto_66032 ) ) ( not ( = ?auto_66041 ?auto_66032 ) ) ( not ( = ?auto_66027 ?auto_66032 ) ) ( not ( = ?auto_66043 ?auto_66032 ) ) ( not ( = ?auto_66045 ?auto_66032 ) ) ( not ( = ?auto_66029 ?auto_66032 ) ) ( not ( = ?auto_66038 ?auto_66032 ) ) ( not ( = ?auto_66048 ?auto_66037 ) ) ( not ( = ?auto_66034 ?auto_66048 ) ) ( not ( = ?auto_66028 ?auto_66048 ) ) ( not ( = ?auto_66033 ?auto_66048 ) ) ( HOIST-AT ?auto_66047 ?auto_66048 ) ( not ( = ?auto_66042 ?auto_66047 ) ) ( not ( = ?auto_66039 ?auto_66047 ) ) ( not ( = ?auto_66036 ?auto_66047 ) ) ( not ( = ?auto_66044 ?auto_66047 ) ) ( AVAILABLE ?auto_66047 ) ( SURFACE-AT ?auto_66029 ?auto_66048 ) ( ON ?auto_66029 ?auto_66031 ) ( CLEAR ?auto_66029 ) ( not ( = ?auto_66025 ?auto_66031 ) ) ( not ( = ?auto_66026 ?auto_66031 ) ) ( not ( = ?auto_66046 ?auto_66031 ) ) ( not ( = ?auto_66041 ?auto_66031 ) ) ( not ( = ?auto_66027 ?auto_66031 ) ) ( not ( = ?auto_66043 ?auto_66031 ) ) ( not ( = ?auto_66045 ?auto_66031 ) ) ( not ( = ?auto_66029 ?auto_66031 ) ) ( not ( = ?auto_66038 ?auto_66031 ) ) ( not ( = ?auto_66032 ?auto_66031 ) ) ( SURFACE-AT ?auto_66040 ?auto_66037 ) ( CLEAR ?auto_66040 ) ( IS-CRATE ?auto_66032 ) ( not ( = ?auto_66025 ?auto_66040 ) ) ( not ( = ?auto_66026 ?auto_66040 ) ) ( not ( = ?auto_66046 ?auto_66040 ) ) ( not ( = ?auto_66041 ?auto_66040 ) ) ( not ( = ?auto_66027 ?auto_66040 ) ) ( not ( = ?auto_66043 ?auto_66040 ) ) ( not ( = ?auto_66045 ?auto_66040 ) ) ( not ( = ?auto_66029 ?auto_66040 ) ) ( not ( = ?auto_66038 ?auto_66040 ) ) ( not ( = ?auto_66032 ?auto_66040 ) ) ( not ( = ?auto_66031 ?auto_66040 ) ) ( AVAILABLE ?auto_66042 ) ( TRUCK-AT ?auto_66035 ?auto_66030 ) ( not ( = ?auto_66030 ?auto_66037 ) ) ( not ( = ?auto_66034 ?auto_66030 ) ) ( not ( = ?auto_66028 ?auto_66030 ) ) ( not ( = ?auto_66033 ?auto_66030 ) ) ( not ( = ?auto_66048 ?auto_66030 ) ) ( HOIST-AT ?auto_66049 ?auto_66030 ) ( LIFTING ?auto_66049 ?auto_66032 ) ( not ( = ?auto_66042 ?auto_66049 ) ) ( not ( = ?auto_66039 ?auto_66049 ) ) ( not ( = ?auto_66036 ?auto_66049 ) ) ( not ( = ?auto_66044 ?auto_66049 ) ) ( not ( = ?auto_66047 ?auto_66049 ) ) )
    :subtasks
    ( ( !LOAD ?auto_66049 ?auto_66032 ?auto_66035 ?auto_66030 )
      ( MAKE-ON ?auto_66025 ?auto_66026 )
      ( MAKE-ON-VERIFY ?auto_66025 ?auto_66026 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_66050 - SURFACE
      ?auto_66051 - SURFACE
    )
    :vars
    (
      ?auto_66066 - HOIST
      ?auto_66055 - PLACE
      ?auto_66069 - PLACE
      ?auto_66065 - HOIST
      ?auto_66052 - SURFACE
      ?auto_66058 - SURFACE
      ?auto_66057 - SURFACE
      ?auto_66063 - SURFACE
      ?auto_66073 - PLACE
      ?auto_66053 - HOIST
      ?auto_66062 - SURFACE
      ?auto_66070 - SURFACE
      ?auto_66056 - PLACE
      ?auto_66061 - HOIST
      ?auto_66064 - SURFACE
      ?auto_66068 - SURFACE
      ?auto_66071 - PLACE
      ?auto_66054 - HOIST
      ?auto_66074 - SURFACE
      ?auto_66060 - SURFACE
      ?auto_66067 - TRUCK
      ?auto_66072 - PLACE
      ?auto_66059 - HOIST
      ?auto_66075 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_66066 ?auto_66055 ) ( IS-CRATE ?auto_66050 ) ( not ( = ?auto_66050 ?auto_66051 ) ) ( not ( = ?auto_66069 ?auto_66055 ) ) ( HOIST-AT ?auto_66065 ?auto_66069 ) ( not ( = ?auto_66066 ?auto_66065 ) ) ( SURFACE-AT ?auto_66050 ?auto_66069 ) ( ON ?auto_66050 ?auto_66052 ) ( CLEAR ?auto_66050 ) ( not ( = ?auto_66050 ?auto_66052 ) ) ( not ( = ?auto_66051 ?auto_66052 ) ) ( IS-CRATE ?auto_66051 ) ( not ( = ?auto_66050 ?auto_66058 ) ) ( not ( = ?auto_66051 ?auto_66058 ) ) ( not ( = ?auto_66052 ?auto_66058 ) ) ( AVAILABLE ?auto_66065 ) ( SURFACE-AT ?auto_66051 ?auto_66069 ) ( ON ?auto_66051 ?auto_66057 ) ( CLEAR ?auto_66051 ) ( not ( = ?auto_66050 ?auto_66057 ) ) ( not ( = ?auto_66051 ?auto_66057 ) ) ( not ( = ?auto_66052 ?auto_66057 ) ) ( not ( = ?auto_66058 ?auto_66057 ) ) ( IS-CRATE ?auto_66058 ) ( not ( = ?auto_66050 ?auto_66063 ) ) ( not ( = ?auto_66051 ?auto_66063 ) ) ( not ( = ?auto_66052 ?auto_66063 ) ) ( not ( = ?auto_66058 ?auto_66063 ) ) ( not ( = ?auto_66057 ?auto_66063 ) ) ( not ( = ?auto_66073 ?auto_66055 ) ) ( not ( = ?auto_66069 ?auto_66073 ) ) ( HOIST-AT ?auto_66053 ?auto_66073 ) ( not ( = ?auto_66066 ?auto_66053 ) ) ( not ( = ?auto_66065 ?auto_66053 ) ) ( AVAILABLE ?auto_66053 ) ( SURFACE-AT ?auto_66058 ?auto_66073 ) ( ON ?auto_66058 ?auto_66062 ) ( CLEAR ?auto_66058 ) ( not ( = ?auto_66050 ?auto_66062 ) ) ( not ( = ?auto_66051 ?auto_66062 ) ) ( not ( = ?auto_66052 ?auto_66062 ) ) ( not ( = ?auto_66058 ?auto_66062 ) ) ( not ( = ?auto_66057 ?auto_66062 ) ) ( not ( = ?auto_66063 ?auto_66062 ) ) ( IS-CRATE ?auto_66063 ) ( not ( = ?auto_66050 ?auto_66070 ) ) ( not ( = ?auto_66051 ?auto_66070 ) ) ( not ( = ?auto_66052 ?auto_66070 ) ) ( not ( = ?auto_66058 ?auto_66070 ) ) ( not ( = ?auto_66057 ?auto_66070 ) ) ( not ( = ?auto_66063 ?auto_66070 ) ) ( not ( = ?auto_66062 ?auto_66070 ) ) ( not ( = ?auto_66056 ?auto_66055 ) ) ( not ( = ?auto_66069 ?auto_66056 ) ) ( not ( = ?auto_66073 ?auto_66056 ) ) ( HOIST-AT ?auto_66061 ?auto_66056 ) ( not ( = ?auto_66066 ?auto_66061 ) ) ( not ( = ?auto_66065 ?auto_66061 ) ) ( not ( = ?auto_66053 ?auto_66061 ) ) ( AVAILABLE ?auto_66061 ) ( SURFACE-AT ?auto_66063 ?auto_66056 ) ( ON ?auto_66063 ?auto_66064 ) ( CLEAR ?auto_66063 ) ( not ( = ?auto_66050 ?auto_66064 ) ) ( not ( = ?auto_66051 ?auto_66064 ) ) ( not ( = ?auto_66052 ?auto_66064 ) ) ( not ( = ?auto_66058 ?auto_66064 ) ) ( not ( = ?auto_66057 ?auto_66064 ) ) ( not ( = ?auto_66063 ?auto_66064 ) ) ( not ( = ?auto_66062 ?auto_66064 ) ) ( not ( = ?auto_66070 ?auto_66064 ) ) ( IS-CRATE ?auto_66070 ) ( not ( = ?auto_66050 ?auto_66068 ) ) ( not ( = ?auto_66051 ?auto_66068 ) ) ( not ( = ?auto_66052 ?auto_66068 ) ) ( not ( = ?auto_66058 ?auto_66068 ) ) ( not ( = ?auto_66057 ?auto_66068 ) ) ( not ( = ?auto_66063 ?auto_66068 ) ) ( not ( = ?auto_66062 ?auto_66068 ) ) ( not ( = ?auto_66070 ?auto_66068 ) ) ( not ( = ?auto_66064 ?auto_66068 ) ) ( not ( = ?auto_66071 ?auto_66055 ) ) ( not ( = ?auto_66069 ?auto_66071 ) ) ( not ( = ?auto_66073 ?auto_66071 ) ) ( not ( = ?auto_66056 ?auto_66071 ) ) ( HOIST-AT ?auto_66054 ?auto_66071 ) ( not ( = ?auto_66066 ?auto_66054 ) ) ( not ( = ?auto_66065 ?auto_66054 ) ) ( not ( = ?auto_66053 ?auto_66054 ) ) ( not ( = ?auto_66061 ?auto_66054 ) ) ( AVAILABLE ?auto_66054 ) ( SURFACE-AT ?auto_66070 ?auto_66071 ) ( ON ?auto_66070 ?auto_66074 ) ( CLEAR ?auto_66070 ) ( not ( = ?auto_66050 ?auto_66074 ) ) ( not ( = ?auto_66051 ?auto_66074 ) ) ( not ( = ?auto_66052 ?auto_66074 ) ) ( not ( = ?auto_66058 ?auto_66074 ) ) ( not ( = ?auto_66057 ?auto_66074 ) ) ( not ( = ?auto_66063 ?auto_66074 ) ) ( not ( = ?auto_66062 ?auto_66074 ) ) ( not ( = ?auto_66070 ?auto_66074 ) ) ( not ( = ?auto_66064 ?auto_66074 ) ) ( not ( = ?auto_66068 ?auto_66074 ) ) ( SURFACE-AT ?auto_66060 ?auto_66055 ) ( CLEAR ?auto_66060 ) ( IS-CRATE ?auto_66068 ) ( not ( = ?auto_66050 ?auto_66060 ) ) ( not ( = ?auto_66051 ?auto_66060 ) ) ( not ( = ?auto_66052 ?auto_66060 ) ) ( not ( = ?auto_66058 ?auto_66060 ) ) ( not ( = ?auto_66057 ?auto_66060 ) ) ( not ( = ?auto_66063 ?auto_66060 ) ) ( not ( = ?auto_66062 ?auto_66060 ) ) ( not ( = ?auto_66070 ?auto_66060 ) ) ( not ( = ?auto_66064 ?auto_66060 ) ) ( not ( = ?auto_66068 ?auto_66060 ) ) ( not ( = ?auto_66074 ?auto_66060 ) ) ( AVAILABLE ?auto_66066 ) ( TRUCK-AT ?auto_66067 ?auto_66072 ) ( not ( = ?auto_66072 ?auto_66055 ) ) ( not ( = ?auto_66069 ?auto_66072 ) ) ( not ( = ?auto_66073 ?auto_66072 ) ) ( not ( = ?auto_66056 ?auto_66072 ) ) ( not ( = ?auto_66071 ?auto_66072 ) ) ( HOIST-AT ?auto_66059 ?auto_66072 ) ( not ( = ?auto_66066 ?auto_66059 ) ) ( not ( = ?auto_66065 ?auto_66059 ) ) ( not ( = ?auto_66053 ?auto_66059 ) ) ( not ( = ?auto_66061 ?auto_66059 ) ) ( not ( = ?auto_66054 ?auto_66059 ) ) ( AVAILABLE ?auto_66059 ) ( SURFACE-AT ?auto_66068 ?auto_66072 ) ( ON ?auto_66068 ?auto_66075 ) ( CLEAR ?auto_66068 ) ( not ( = ?auto_66050 ?auto_66075 ) ) ( not ( = ?auto_66051 ?auto_66075 ) ) ( not ( = ?auto_66052 ?auto_66075 ) ) ( not ( = ?auto_66058 ?auto_66075 ) ) ( not ( = ?auto_66057 ?auto_66075 ) ) ( not ( = ?auto_66063 ?auto_66075 ) ) ( not ( = ?auto_66062 ?auto_66075 ) ) ( not ( = ?auto_66070 ?auto_66075 ) ) ( not ( = ?auto_66064 ?auto_66075 ) ) ( not ( = ?auto_66068 ?auto_66075 ) ) ( not ( = ?auto_66074 ?auto_66075 ) ) ( not ( = ?auto_66060 ?auto_66075 ) ) )
    :subtasks
    ( ( !LIFT ?auto_66059 ?auto_66068 ?auto_66075 ?auto_66072 )
      ( MAKE-ON ?auto_66050 ?auto_66051 )
      ( MAKE-ON-VERIFY ?auto_66050 ?auto_66051 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_66076 - SURFACE
      ?auto_66077 - SURFACE
    )
    :vars
    (
      ?auto_66099 - HOIST
      ?auto_66087 - PLACE
      ?auto_66079 - PLACE
      ?auto_66098 - HOIST
      ?auto_66090 - SURFACE
      ?auto_66088 - SURFACE
      ?auto_66095 - SURFACE
      ?auto_66096 - SURFACE
      ?auto_66083 - PLACE
      ?auto_66093 - HOIST
      ?auto_66092 - SURFACE
      ?auto_66078 - SURFACE
      ?auto_66086 - PLACE
      ?auto_66091 - HOIST
      ?auto_66097 - SURFACE
      ?auto_66080 - SURFACE
      ?auto_66084 - PLACE
      ?auto_66085 - HOIST
      ?auto_66082 - SURFACE
      ?auto_66100 - SURFACE
      ?auto_66094 - PLACE
      ?auto_66101 - HOIST
      ?auto_66089 - SURFACE
      ?auto_66081 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_66099 ?auto_66087 ) ( IS-CRATE ?auto_66076 ) ( not ( = ?auto_66076 ?auto_66077 ) ) ( not ( = ?auto_66079 ?auto_66087 ) ) ( HOIST-AT ?auto_66098 ?auto_66079 ) ( not ( = ?auto_66099 ?auto_66098 ) ) ( SURFACE-AT ?auto_66076 ?auto_66079 ) ( ON ?auto_66076 ?auto_66090 ) ( CLEAR ?auto_66076 ) ( not ( = ?auto_66076 ?auto_66090 ) ) ( not ( = ?auto_66077 ?auto_66090 ) ) ( IS-CRATE ?auto_66077 ) ( not ( = ?auto_66076 ?auto_66088 ) ) ( not ( = ?auto_66077 ?auto_66088 ) ) ( not ( = ?auto_66090 ?auto_66088 ) ) ( AVAILABLE ?auto_66098 ) ( SURFACE-AT ?auto_66077 ?auto_66079 ) ( ON ?auto_66077 ?auto_66095 ) ( CLEAR ?auto_66077 ) ( not ( = ?auto_66076 ?auto_66095 ) ) ( not ( = ?auto_66077 ?auto_66095 ) ) ( not ( = ?auto_66090 ?auto_66095 ) ) ( not ( = ?auto_66088 ?auto_66095 ) ) ( IS-CRATE ?auto_66088 ) ( not ( = ?auto_66076 ?auto_66096 ) ) ( not ( = ?auto_66077 ?auto_66096 ) ) ( not ( = ?auto_66090 ?auto_66096 ) ) ( not ( = ?auto_66088 ?auto_66096 ) ) ( not ( = ?auto_66095 ?auto_66096 ) ) ( not ( = ?auto_66083 ?auto_66087 ) ) ( not ( = ?auto_66079 ?auto_66083 ) ) ( HOIST-AT ?auto_66093 ?auto_66083 ) ( not ( = ?auto_66099 ?auto_66093 ) ) ( not ( = ?auto_66098 ?auto_66093 ) ) ( AVAILABLE ?auto_66093 ) ( SURFACE-AT ?auto_66088 ?auto_66083 ) ( ON ?auto_66088 ?auto_66092 ) ( CLEAR ?auto_66088 ) ( not ( = ?auto_66076 ?auto_66092 ) ) ( not ( = ?auto_66077 ?auto_66092 ) ) ( not ( = ?auto_66090 ?auto_66092 ) ) ( not ( = ?auto_66088 ?auto_66092 ) ) ( not ( = ?auto_66095 ?auto_66092 ) ) ( not ( = ?auto_66096 ?auto_66092 ) ) ( IS-CRATE ?auto_66096 ) ( not ( = ?auto_66076 ?auto_66078 ) ) ( not ( = ?auto_66077 ?auto_66078 ) ) ( not ( = ?auto_66090 ?auto_66078 ) ) ( not ( = ?auto_66088 ?auto_66078 ) ) ( not ( = ?auto_66095 ?auto_66078 ) ) ( not ( = ?auto_66096 ?auto_66078 ) ) ( not ( = ?auto_66092 ?auto_66078 ) ) ( not ( = ?auto_66086 ?auto_66087 ) ) ( not ( = ?auto_66079 ?auto_66086 ) ) ( not ( = ?auto_66083 ?auto_66086 ) ) ( HOIST-AT ?auto_66091 ?auto_66086 ) ( not ( = ?auto_66099 ?auto_66091 ) ) ( not ( = ?auto_66098 ?auto_66091 ) ) ( not ( = ?auto_66093 ?auto_66091 ) ) ( AVAILABLE ?auto_66091 ) ( SURFACE-AT ?auto_66096 ?auto_66086 ) ( ON ?auto_66096 ?auto_66097 ) ( CLEAR ?auto_66096 ) ( not ( = ?auto_66076 ?auto_66097 ) ) ( not ( = ?auto_66077 ?auto_66097 ) ) ( not ( = ?auto_66090 ?auto_66097 ) ) ( not ( = ?auto_66088 ?auto_66097 ) ) ( not ( = ?auto_66095 ?auto_66097 ) ) ( not ( = ?auto_66096 ?auto_66097 ) ) ( not ( = ?auto_66092 ?auto_66097 ) ) ( not ( = ?auto_66078 ?auto_66097 ) ) ( IS-CRATE ?auto_66078 ) ( not ( = ?auto_66076 ?auto_66080 ) ) ( not ( = ?auto_66077 ?auto_66080 ) ) ( not ( = ?auto_66090 ?auto_66080 ) ) ( not ( = ?auto_66088 ?auto_66080 ) ) ( not ( = ?auto_66095 ?auto_66080 ) ) ( not ( = ?auto_66096 ?auto_66080 ) ) ( not ( = ?auto_66092 ?auto_66080 ) ) ( not ( = ?auto_66078 ?auto_66080 ) ) ( not ( = ?auto_66097 ?auto_66080 ) ) ( not ( = ?auto_66084 ?auto_66087 ) ) ( not ( = ?auto_66079 ?auto_66084 ) ) ( not ( = ?auto_66083 ?auto_66084 ) ) ( not ( = ?auto_66086 ?auto_66084 ) ) ( HOIST-AT ?auto_66085 ?auto_66084 ) ( not ( = ?auto_66099 ?auto_66085 ) ) ( not ( = ?auto_66098 ?auto_66085 ) ) ( not ( = ?auto_66093 ?auto_66085 ) ) ( not ( = ?auto_66091 ?auto_66085 ) ) ( AVAILABLE ?auto_66085 ) ( SURFACE-AT ?auto_66078 ?auto_66084 ) ( ON ?auto_66078 ?auto_66082 ) ( CLEAR ?auto_66078 ) ( not ( = ?auto_66076 ?auto_66082 ) ) ( not ( = ?auto_66077 ?auto_66082 ) ) ( not ( = ?auto_66090 ?auto_66082 ) ) ( not ( = ?auto_66088 ?auto_66082 ) ) ( not ( = ?auto_66095 ?auto_66082 ) ) ( not ( = ?auto_66096 ?auto_66082 ) ) ( not ( = ?auto_66092 ?auto_66082 ) ) ( not ( = ?auto_66078 ?auto_66082 ) ) ( not ( = ?auto_66097 ?auto_66082 ) ) ( not ( = ?auto_66080 ?auto_66082 ) ) ( SURFACE-AT ?auto_66100 ?auto_66087 ) ( CLEAR ?auto_66100 ) ( IS-CRATE ?auto_66080 ) ( not ( = ?auto_66076 ?auto_66100 ) ) ( not ( = ?auto_66077 ?auto_66100 ) ) ( not ( = ?auto_66090 ?auto_66100 ) ) ( not ( = ?auto_66088 ?auto_66100 ) ) ( not ( = ?auto_66095 ?auto_66100 ) ) ( not ( = ?auto_66096 ?auto_66100 ) ) ( not ( = ?auto_66092 ?auto_66100 ) ) ( not ( = ?auto_66078 ?auto_66100 ) ) ( not ( = ?auto_66097 ?auto_66100 ) ) ( not ( = ?auto_66080 ?auto_66100 ) ) ( not ( = ?auto_66082 ?auto_66100 ) ) ( AVAILABLE ?auto_66099 ) ( not ( = ?auto_66094 ?auto_66087 ) ) ( not ( = ?auto_66079 ?auto_66094 ) ) ( not ( = ?auto_66083 ?auto_66094 ) ) ( not ( = ?auto_66086 ?auto_66094 ) ) ( not ( = ?auto_66084 ?auto_66094 ) ) ( HOIST-AT ?auto_66101 ?auto_66094 ) ( not ( = ?auto_66099 ?auto_66101 ) ) ( not ( = ?auto_66098 ?auto_66101 ) ) ( not ( = ?auto_66093 ?auto_66101 ) ) ( not ( = ?auto_66091 ?auto_66101 ) ) ( not ( = ?auto_66085 ?auto_66101 ) ) ( AVAILABLE ?auto_66101 ) ( SURFACE-AT ?auto_66080 ?auto_66094 ) ( ON ?auto_66080 ?auto_66089 ) ( CLEAR ?auto_66080 ) ( not ( = ?auto_66076 ?auto_66089 ) ) ( not ( = ?auto_66077 ?auto_66089 ) ) ( not ( = ?auto_66090 ?auto_66089 ) ) ( not ( = ?auto_66088 ?auto_66089 ) ) ( not ( = ?auto_66095 ?auto_66089 ) ) ( not ( = ?auto_66096 ?auto_66089 ) ) ( not ( = ?auto_66092 ?auto_66089 ) ) ( not ( = ?auto_66078 ?auto_66089 ) ) ( not ( = ?auto_66097 ?auto_66089 ) ) ( not ( = ?auto_66080 ?auto_66089 ) ) ( not ( = ?auto_66082 ?auto_66089 ) ) ( not ( = ?auto_66100 ?auto_66089 ) ) ( TRUCK-AT ?auto_66081 ?auto_66087 ) )
    :subtasks
    ( ( !DRIVE ?auto_66081 ?auto_66087 ?auto_66094 )
      ( MAKE-ON ?auto_66076 ?auto_66077 )
      ( MAKE-ON-VERIFY ?auto_66076 ?auto_66077 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_66102 - SURFACE
      ?auto_66103 - SURFACE
    )
    :vars
    (
      ?auto_66123 - HOIST
      ?auto_66110 - PLACE
      ?auto_66126 - PLACE
      ?auto_66124 - HOIST
      ?auto_66112 - SURFACE
      ?auto_66106 - SURFACE
      ?auto_66119 - SURFACE
      ?auto_66115 - SURFACE
      ?auto_66127 - PLACE
      ?auto_66122 - HOIST
      ?auto_66121 - SURFACE
      ?auto_66111 - SURFACE
      ?auto_66105 - PLACE
      ?auto_66113 - HOIST
      ?auto_66116 - SURFACE
      ?auto_66125 - SURFACE
      ?auto_66120 - PLACE
      ?auto_66109 - HOIST
      ?auto_66108 - SURFACE
      ?auto_66104 - SURFACE
      ?auto_66118 - PLACE
      ?auto_66117 - HOIST
      ?auto_66114 - SURFACE
      ?auto_66107 - TRUCK
      ?auto_66128 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_66123 ?auto_66110 ) ( IS-CRATE ?auto_66102 ) ( not ( = ?auto_66102 ?auto_66103 ) ) ( not ( = ?auto_66126 ?auto_66110 ) ) ( HOIST-AT ?auto_66124 ?auto_66126 ) ( not ( = ?auto_66123 ?auto_66124 ) ) ( SURFACE-AT ?auto_66102 ?auto_66126 ) ( ON ?auto_66102 ?auto_66112 ) ( CLEAR ?auto_66102 ) ( not ( = ?auto_66102 ?auto_66112 ) ) ( not ( = ?auto_66103 ?auto_66112 ) ) ( IS-CRATE ?auto_66103 ) ( not ( = ?auto_66102 ?auto_66106 ) ) ( not ( = ?auto_66103 ?auto_66106 ) ) ( not ( = ?auto_66112 ?auto_66106 ) ) ( AVAILABLE ?auto_66124 ) ( SURFACE-AT ?auto_66103 ?auto_66126 ) ( ON ?auto_66103 ?auto_66119 ) ( CLEAR ?auto_66103 ) ( not ( = ?auto_66102 ?auto_66119 ) ) ( not ( = ?auto_66103 ?auto_66119 ) ) ( not ( = ?auto_66112 ?auto_66119 ) ) ( not ( = ?auto_66106 ?auto_66119 ) ) ( IS-CRATE ?auto_66106 ) ( not ( = ?auto_66102 ?auto_66115 ) ) ( not ( = ?auto_66103 ?auto_66115 ) ) ( not ( = ?auto_66112 ?auto_66115 ) ) ( not ( = ?auto_66106 ?auto_66115 ) ) ( not ( = ?auto_66119 ?auto_66115 ) ) ( not ( = ?auto_66127 ?auto_66110 ) ) ( not ( = ?auto_66126 ?auto_66127 ) ) ( HOIST-AT ?auto_66122 ?auto_66127 ) ( not ( = ?auto_66123 ?auto_66122 ) ) ( not ( = ?auto_66124 ?auto_66122 ) ) ( AVAILABLE ?auto_66122 ) ( SURFACE-AT ?auto_66106 ?auto_66127 ) ( ON ?auto_66106 ?auto_66121 ) ( CLEAR ?auto_66106 ) ( not ( = ?auto_66102 ?auto_66121 ) ) ( not ( = ?auto_66103 ?auto_66121 ) ) ( not ( = ?auto_66112 ?auto_66121 ) ) ( not ( = ?auto_66106 ?auto_66121 ) ) ( not ( = ?auto_66119 ?auto_66121 ) ) ( not ( = ?auto_66115 ?auto_66121 ) ) ( IS-CRATE ?auto_66115 ) ( not ( = ?auto_66102 ?auto_66111 ) ) ( not ( = ?auto_66103 ?auto_66111 ) ) ( not ( = ?auto_66112 ?auto_66111 ) ) ( not ( = ?auto_66106 ?auto_66111 ) ) ( not ( = ?auto_66119 ?auto_66111 ) ) ( not ( = ?auto_66115 ?auto_66111 ) ) ( not ( = ?auto_66121 ?auto_66111 ) ) ( not ( = ?auto_66105 ?auto_66110 ) ) ( not ( = ?auto_66126 ?auto_66105 ) ) ( not ( = ?auto_66127 ?auto_66105 ) ) ( HOIST-AT ?auto_66113 ?auto_66105 ) ( not ( = ?auto_66123 ?auto_66113 ) ) ( not ( = ?auto_66124 ?auto_66113 ) ) ( not ( = ?auto_66122 ?auto_66113 ) ) ( AVAILABLE ?auto_66113 ) ( SURFACE-AT ?auto_66115 ?auto_66105 ) ( ON ?auto_66115 ?auto_66116 ) ( CLEAR ?auto_66115 ) ( not ( = ?auto_66102 ?auto_66116 ) ) ( not ( = ?auto_66103 ?auto_66116 ) ) ( not ( = ?auto_66112 ?auto_66116 ) ) ( not ( = ?auto_66106 ?auto_66116 ) ) ( not ( = ?auto_66119 ?auto_66116 ) ) ( not ( = ?auto_66115 ?auto_66116 ) ) ( not ( = ?auto_66121 ?auto_66116 ) ) ( not ( = ?auto_66111 ?auto_66116 ) ) ( IS-CRATE ?auto_66111 ) ( not ( = ?auto_66102 ?auto_66125 ) ) ( not ( = ?auto_66103 ?auto_66125 ) ) ( not ( = ?auto_66112 ?auto_66125 ) ) ( not ( = ?auto_66106 ?auto_66125 ) ) ( not ( = ?auto_66119 ?auto_66125 ) ) ( not ( = ?auto_66115 ?auto_66125 ) ) ( not ( = ?auto_66121 ?auto_66125 ) ) ( not ( = ?auto_66111 ?auto_66125 ) ) ( not ( = ?auto_66116 ?auto_66125 ) ) ( not ( = ?auto_66120 ?auto_66110 ) ) ( not ( = ?auto_66126 ?auto_66120 ) ) ( not ( = ?auto_66127 ?auto_66120 ) ) ( not ( = ?auto_66105 ?auto_66120 ) ) ( HOIST-AT ?auto_66109 ?auto_66120 ) ( not ( = ?auto_66123 ?auto_66109 ) ) ( not ( = ?auto_66124 ?auto_66109 ) ) ( not ( = ?auto_66122 ?auto_66109 ) ) ( not ( = ?auto_66113 ?auto_66109 ) ) ( AVAILABLE ?auto_66109 ) ( SURFACE-AT ?auto_66111 ?auto_66120 ) ( ON ?auto_66111 ?auto_66108 ) ( CLEAR ?auto_66111 ) ( not ( = ?auto_66102 ?auto_66108 ) ) ( not ( = ?auto_66103 ?auto_66108 ) ) ( not ( = ?auto_66112 ?auto_66108 ) ) ( not ( = ?auto_66106 ?auto_66108 ) ) ( not ( = ?auto_66119 ?auto_66108 ) ) ( not ( = ?auto_66115 ?auto_66108 ) ) ( not ( = ?auto_66121 ?auto_66108 ) ) ( not ( = ?auto_66111 ?auto_66108 ) ) ( not ( = ?auto_66116 ?auto_66108 ) ) ( not ( = ?auto_66125 ?auto_66108 ) ) ( IS-CRATE ?auto_66125 ) ( not ( = ?auto_66102 ?auto_66104 ) ) ( not ( = ?auto_66103 ?auto_66104 ) ) ( not ( = ?auto_66112 ?auto_66104 ) ) ( not ( = ?auto_66106 ?auto_66104 ) ) ( not ( = ?auto_66119 ?auto_66104 ) ) ( not ( = ?auto_66115 ?auto_66104 ) ) ( not ( = ?auto_66121 ?auto_66104 ) ) ( not ( = ?auto_66111 ?auto_66104 ) ) ( not ( = ?auto_66116 ?auto_66104 ) ) ( not ( = ?auto_66125 ?auto_66104 ) ) ( not ( = ?auto_66108 ?auto_66104 ) ) ( not ( = ?auto_66118 ?auto_66110 ) ) ( not ( = ?auto_66126 ?auto_66118 ) ) ( not ( = ?auto_66127 ?auto_66118 ) ) ( not ( = ?auto_66105 ?auto_66118 ) ) ( not ( = ?auto_66120 ?auto_66118 ) ) ( HOIST-AT ?auto_66117 ?auto_66118 ) ( not ( = ?auto_66123 ?auto_66117 ) ) ( not ( = ?auto_66124 ?auto_66117 ) ) ( not ( = ?auto_66122 ?auto_66117 ) ) ( not ( = ?auto_66113 ?auto_66117 ) ) ( not ( = ?auto_66109 ?auto_66117 ) ) ( AVAILABLE ?auto_66117 ) ( SURFACE-AT ?auto_66125 ?auto_66118 ) ( ON ?auto_66125 ?auto_66114 ) ( CLEAR ?auto_66125 ) ( not ( = ?auto_66102 ?auto_66114 ) ) ( not ( = ?auto_66103 ?auto_66114 ) ) ( not ( = ?auto_66112 ?auto_66114 ) ) ( not ( = ?auto_66106 ?auto_66114 ) ) ( not ( = ?auto_66119 ?auto_66114 ) ) ( not ( = ?auto_66115 ?auto_66114 ) ) ( not ( = ?auto_66121 ?auto_66114 ) ) ( not ( = ?auto_66111 ?auto_66114 ) ) ( not ( = ?auto_66116 ?auto_66114 ) ) ( not ( = ?auto_66125 ?auto_66114 ) ) ( not ( = ?auto_66108 ?auto_66114 ) ) ( not ( = ?auto_66104 ?auto_66114 ) ) ( TRUCK-AT ?auto_66107 ?auto_66110 ) ( SURFACE-AT ?auto_66128 ?auto_66110 ) ( CLEAR ?auto_66128 ) ( LIFTING ?auto_66123 ?auto_66104 ) ( IS-CRATE ?auto_66104 ) ( not ( = ?auto_66102 ?auto_66128 ) ) ( not ( = ?auto_66103 ?auto_66128 ) ) ( not ( = ?auto_66112 ?auto_66128 ) ) ( not ( = ?auto_66106 ?auto_66128 ) ) ( not ( = ?auto_66119 ?auto_66128 ) ) ( not ( = ?auto_66115 ?auto_66128 ) ) ( not ( = ?auto_66121 ?auto_66128 ) ) ( not ( = ?auto_66111 ?auto_66128 ) ) ( not ( = ?auto_66116 ?auto_66128 ) ) ( not ( = ?auto_66125 ?auto_66128 ) ) ( not ( = ?auto_66108 ?auto_66128 ) ) ( not ( = ?auto_66104 ?auto_66128 ) ) ( not ( = ?auto_66114 ?auto_66128 ) ) )
    :subtasks
    ( ( !DROP ?auto_66123 ?auto_66104 ?auto_66128 ?auto_66110 )
      ( MAKE-ON ?auto_66102 ?auto_66103 )
      ( MAKE-ON-VERIFY ?auto_66102 ?auto_66103 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_66129 - SURFACE
      ?auto_66130 - SURFACE
    )
    :vars
    (
      ?auto_66149 - HOIST
      ?auto_66135 - PLACE
      ?auto_66152 - PLACE
      ?auto_66150 - HOIST
      ?auto_66145 - SURFACE
      ?auto_66141 - SURFACE
      ?auto_66153 - SURFACE
      ?auto_66137 - SURFACE
      ?auto_66131 - PLACE
      ?auto_66148 - HOIST
      ?auto_66155 - SURFACE
      ?auto_66139 - SURFACE
      ?auto_66132 - PLACE
      ?auto_66140 - HOIST
      ?auto_66136 - SURFACE
      ?auto_66151 - SURFACE
      ?auto_66154 - PLACE
      ?auto_66142 - HOIST
      ?auto_66133 - SURFACE
      ?auto_66146 - SURFACE
      ?auto_66134 - PLACE
      ?auto_66138 - HOIST
      ?auto_66143 - SURFACE
      ?auto_66144 - TRUCK
      ?auto_66147 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_66149 ?auto_66135 ) ( IS-CRATE ?auto_66129 ) ( not ( = ?auto_66129 ?auto_66130 ) ) ( not ( = ?auto_66152 ?auto_66135 ) ) ( HOIST-AT ?auto_66150 ?auto_66152 ) ( not ( = ?auto_66149 ?auto_66150 ) ) ( SURFACE-AT ?auto_66129 ?auto_66152 ) ( ON ?auto_66129 ?auto_66145 ) ( CLEAR ?auto_66129 ) ( not ( = ?auto_66129 ?auto_66145 ) ) ( not ( = ?auto_66130 ?auto_66145 ) ) ( IS-CRATE ?auto_66130 ) ( not ( = ?auto_66129 ?auto_66141 ) ) ( not ( = ?auto_66130 ?auto_66141 ) ) ( not ( = ?auto_66145 ?auto_66141 ) ) ( AVAILABLE ?auto_66150 ) ( SURFACE-AT ?auto_66130 ?auto_66152 ) ( ON ?auto_66130 ?auto_66153 ) ( CLEAR ?auto_66130 ) ( not ( = ?auto_66129 ?auto_66153 ) ) ( not ( = ?auto_66130 ?auto_66153 ) ) ( not ( = ?auto_66145 ?auto_66153 ) ) ( not ( = ?auto_66141 ?auto_66153 ) ) ( IS-CRATE ?auto_66141 ) ( not ( = ?auto_66129 ?auto_66137 ) ) ( not ( = ?auto_66130 ?auto_66137 ) ) ( not ( = ?auto_66145 ?auto_66137 ) ) ( not ( = ?auto_66141 ?auto_66137 ) ) ( not ( = ?auto_66153 ?auto_66137 ) ) ( not ( = ?auto_66131 ?auto_66135 ) ) ( not ( = ?auto_66152 ?auto_66131 ) ) ( HOIST-AT ?auto_66148 ?auto_66131 ) ( not ( = ?auto_66149 ?auto_66148 ) ) ( not ( = ?auto_66150 ?auto_66148 ) ) ( AVAILABLE ?auto_66148 ) ( SURFACE-AT ?auto_66141 ?auto_66131 ) ( ON ?auto_66141 ?auto_66155 ) ( CLEAR ?auto_66141 ) ( not ( = ?auto_66129 ?auto_66155 ) ) ( not ( = ?auto_66130 ?auto_66155 ) ) ( not ( = ?auto_66145 ?auto_66155 ) ) ( not ( = ?auto_66141 ?auto_66155 ) ) ( not ( = ?auto_66153 ?auto_66155 ) ) ( not ( = ?auto_66137 ?auto_66155 ) ) ( IS-CRATE ?auto_66137 ) ( not ( = ?auto_66129 ?auto_66139 ) ) ( not ( = ?auto_66130 ?auto_66139 ) ) ( not ( = ?auto_66145 ?auto_66139 ) ) ( not ( = ?auto_66141 ?auto_66139 ) ) ( not ( = ?auto_66153 ?auto_66139 ) ) ( not ( = ?auto_66137 ?auto_66139 ) ) ( not ( = ?auto_66155 ?auto_66139 ) ) ( not ( = ?auto_66132 ?auto_66135 ) ) ( not ( = ?auto_66152 ?auto_66132 ) ) ( not ( = ?auto_66131 ?auto_66132 ) ) ( HOIST-AT ?auto_66140 ?auto_66132 ) ( not ( = ?auto_66149 ?auto_66140 ) ) ( not ( = ?auto_66150 ?auto_66140 ) ) ( not ( = ?auto_66148 ?auto_66140 ) ) ( AVAILABLE ?auto_66140 ) ( SURFACE-AT ?auto_66137 ?auto_66132 ) ( ON ?auto_66137 ?auto_66136 ) ( CLEAR ?auto_66137 ) ( not ( = ?auto_66129 ?auto_66136 ) ) ( not ( = ?auto_66130 ?auto_66136 ) ) ( not ( = ?auto_66145 ?auto_66136 ) ) ( not ( = ?auto_66141 ?auto_66136 ) ) ( not ( = ?auto_66153 ?auto_66136 ) ) ( not ( = ?auto_66137 ?auto_66136 ) ) ( not ( = ?auto_66155 ?auto_66136 ) ) ( not ( = ?auto_66139 ?auto_66136 ) ) ( IS-CRATE ?auto_66139 ) ( not ( = ?auto_66129 ?auto_66151 ) ) ( not ( = ?auto_66130 ?auto_66151 ) ) ( not ( = ?auto_66145 ?auto_66151 ) ) ( not ( = ?auto_66141 ?auto_66151 ) ) ( not ( = ?auto_66153 ?auto_66151 ) ) ( not ( = ?auto_66137 ?auto_66151 ) ) ( not ( = ?auto_66155 ?auto_66151 ) ) ( not ( = ?auto_66139 ?auto_66151 ) ) ( not ( = ?auto_66136 ?auto_66151 ) ) ( not ( = ?auto_66154 ?auto_66135 ) ) ( not ( = ?auto_66152 ?auto_66154 ) ) ( not ( = ?auto_66131 ?auto_66154 ) ) ( not ( = ?auto_66132 ?auto_66154 ) ) ( HOIST-AT ?auto_66142 ?auto_66154 ) ( not ( = ?auto_66149 ?auto_66142 ) ) ( not ( = ?auto_66150 ?auto_66142 ) ) ( not ( = ?auto_66148 ?auto_66142 ) ) ( not ( = ?auto_66140 ?auto_66142 ) ) ( AVAILABLE ?auto_66142 ) ( SURFACE-AT ?auto_66139 ?auto_66154 ) ( ON ?auto_66139 ?auto_66133 ) ( CLEAR ?auto_66139 ) ( not ( = ?auto_66129 ?auto_66133 ) ) ( not ( = ?auto_66130 ?auto_66133 ) ) ( not ( = ?auto_66145 ?auto_66133 ) ) ( not ( = ?auto_66141 ?auto_66133 ) ) ( not ( = ?auto_66153 ?auto_66133 ) ) ( not ( = ?auto_66137 ?auto_66133 ) ) ( not ( = ?auto_66155 ?auto_66133 ) ) ( not ( = ?auto_66139 ?auto_66133 ) ) ( not ( = ?auto_66136 ?auto_66133 ) ) ( not ( = ?auto_66151 ?auto_66133 ) ) ( IS-CRATE ?auto_66151 ) ( not ( = ?auto_66129 ?auto_66146 ) ) ( not ( = ?auto_66130 ?auto_66146 ) ) ( not ( = ?auto_66145 ?auto_66146 ) ) ( not ( = ?auto_66141 ?auto_66146 ) ) ( not ( = ?auto_66153 ?auto_66146 ) ) ( not ( = ?auto_66137 ?auto_66146 ) ) ( not ( = ?auto_66155 ?auto_66146 ) ) ( not ( = ?auto_66139 ?auto_66146 ) ) ( not ( = ?auto_66136 ?auto_66146 ) ) ( not ( = ?auto_66151 ?auto_66146 ) ) ( not ( = ?auto_66133 ?auto_66146 ) ) ( not ( = ?auto_66134 ?auto_66135 ) ) ( not ( = ?auto_66152 ?auto_66134 ) ) ( not ( = ?auto_66131 ?auto_66134 ) ) ( not ( = ?auto_66132 ?auto_66134 ) ) ( not ( = ?auto_66154 ?auto_66134 ) ) ( HOIST-AT ?auto_66138 ?auto_66134 ) ( not ( = ?auto_66149 ?auto_66138 ) ) ( not ( = ?auto_66150 ?auto_66138 ) ) ( not ( = ?auto_66148 ?auto_66138 ) ) ( not ( = ?auto_66140 ?auto_66138 ) ) ( not ( = ?auto_66142 ?auto_66138 ) ) ( AVAILABLE ?auto_66138 ) ( SURFACE-AT ?auto_66151 ?auto_66134 ) ( ON ?auto_66151 ?auto_66143 ) ( CLEAR ?auto_66151 ) ( not ( = ?auto_66129 ?auto_66143 ) ) ( not ( = ?auto_66130 ?auto_66143 ) ) ( not ( = ?auto_66145 ?auto_66143 ) ) ( not ( = ?auto_66141 ?auto_66143 ) ) ( not ( = ?auto_66153 ?auto_66143 ) ) ( not ( = ?auto_66137 ?auto_66143 ) ) ( not ( = ?auto_66155 ?auto_66143 ) ) ( not ( = ?auto_66139 ?auto_66143 ) ) ( not ( = ?auto_66136 ?auto_66143 ) ) ( not ( = ?auto_66151 ?auto_66143 ) ) ( not ( = ?auto_66133 ?auto_66143 ) ) ( not ( = ?auto_66146 ?auto_66143 ) ) ( TRUCK-AT ?auto_66144 ?auto_66135 ) ( SURFACE-AT ?auto_66147 ?auto_66135 ) ( CLEAR ?auto_66147 ) ( IS-CRATE ?auto_66146 ) ( not ( = ?auto_66129 ?auto_66147 ) ) ( not ( = ?auto_66130 ?auto_66147 ) ) ( not ( = ?auto_66145 ?auto_66147 ) ) ( not ( = ?auto_66141 ?auto_66147 ) ) ( not ( = ?auto_66153 ?auto_66147 ) ) ( not ( = ?auto_66137 ?auto_66147 ) ) ( not ( = ?auto_66155 ?auto_66147 ) ) ( not ( = ?auto_66139 ?auto_66147 ) ) ( not ( = ?auto_66136 ?auto_66147 ) ) ( not ( = ?auto_66151 ?auto_66147 ) ) ( not ( = ?auto_66133 ?auto_66147 ) ) ( not ( = ?auto_66146 ?auto_66147 ) ) ( not ( = ?auto_66143 ?auto_66147 ) ) ( AVAILABLE ?auto_66149 ) ( IN ?auto_66146 ?auto_66144 ) )
    :subtasks
    ( ( !UNLOAD ?auto_66149 ?auto_66146 ?auto_66144 ?auto_66135 )
      ( MAKE-ON ?auto_66129 ?auto_66130 )
      ( MAKE-ON-VERIFY ?auto_66129 ?auto_66130 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_66156 - SURFACE
      ?auto_66157 - SURFACE
    )
    :vars
    (
      ?auto_66170 - HOIST
      ?auto_66176 - PLACE
      ?auto_66173 - PLACE
      ?auto_66171 - HOIST
      ?auto_66165 - SURFACE
      ?auto_66160 - SURFACE
      ?auto_66174 - SURFACE
      ?auto_66181 - SURFACE
      ?auto_66164 - PLACE
      ?auto_66169 - HOIST
      ?auto_66180 - SURFACE
      ?auto_66177 - SURFACE
      ?auto_66163 - PLACE
      ?auto_66166 - HOIST
      ?auto_66158 - SURFACE
      ?auto_66172 - SURFACE
      ?auto_66167 - PLACE
      ?auto_66179 - HOIST
      ?auto_66161 - SURFACE
      ?auto_66175 - SURFACE
      ?auto_66178 - PLACE
      ?auto_66182 - HOIST
      ?auto_66159 - SURFACE
      ?auto_66168 - SURFACE
      ?auto_66162 - TRUCK
      ?auto_66183 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_66170 ?auto_66176 ) ( IS-CRATE ?auto_66156 ) ( not ( = ?auto_66156 ?auto_66157 ) ) ( not ( = ?auto_66173 ?auto_66176 ) ) ( HOIST-AT ?auto_66171 ?auto_66173 ) ( not ( = ?auto_66170 ?auto_66171 ) ) ( SURFACE-AT ?auto_66156 ?auto_66173 ) ( ON ?auto_66156 ?auto_66165 ) ( CLEAR ?auto_66156 ) ( not ( = ?auto_66156 ?auto_66165 ) ) ( not ( = ?auto_66157 ?auto_66165 ) ) ( IS-CRATE ?auto_66157 ) ( not ( = ?auto_66156 ?auto_66160 ) ) ( not ( = ?auto_66157 ?auto_66160 ) ) ( not ( = ?auto_66165 ?auto_66160 ) ) ( AVAILABLE ?auto_66171 ) ( SURFACE-AT ?auto_66157 ?auto_66173 ) ( ON ?auto_66157 ?auto_66174 ) ( CLEAR ?auto_66157 ) ( not ( = ?auto_66156 ?auto_66174 ) ) ( not ( = ?auto_66157 ?auto_66174 ) ) ( not ( = ?auto_66165 ?auto_66174 ) ) ( not ( = ?auto_66160 ?auto_66174 ) ) ( IS-CRATE ?auto_66160 ) ( not ( = ?auto_66156 ?auto_66181 ) ) ( not ( = ?auto_66157 ?auto_66181 ) ) ( not ( = ?auto_66165 ?auto_66181 ) ) ( not ( = ?auto_66160 ?auto_66181 ) ) ( not ( = ?auto_66174 ?auto_66181 ) ) ( not ( = ?auto_66164 ?auto_66176 ) ) ( not ( = ?auto_66173 ?auto_66164 ) ) ( HOIST-AT ?auto_66169 ?auto_66164 ) ( not ( = ?auto_66170 ?auto_66169 ) ) ( not ( = ?auto_66171 ?auto_66169 ) ) ( AVAILABLE ?auto_66169 ) ( SURFACE-AT ?auto_66160 ?auto_66164 ) ( ON ?auto_66160 ?auto_66180 ) ( CLEAR ?auto_66160 ) ( not ( = ?auto_66156 ?auto_66180 ) ) ( not ( = ?auto_66157 ?auto_66180 ) ) ( not ( = ?auto_66165 ?auto_66180 ) ) ( not ( = ?auto_66160 ?auto_66180 ) ) ( not ( = ?auto_66174 ?auto_66180 ) ) ( not ( = ?auto_66181 ?auto_66180 ) ) ( IS-CRATE ?auto_66181 ) ( not ( = ?auto_66156 ?auto_66177 ) ) ( not ( = ?auto_66157 ?auto_66177 ) ) ( not ( = ?auto_66165 ?auto_66177 ) ) ( not ( = ?auto_66160 ?auto_66177 ) ) ( not ( = ?auto_66174 ?auto_66177 ) ) ( not ( = ?auto_66181 ?auto_66177 ) ) ( not ( = ?auto_66180 ?auto_66177 ) ) ( not ( = ?auto_66163 ?auto_66176 ) ) ( not ( = ?auto_66173 ?auto_66163 ) ) ( not ( = ?auto_66164 ?auto_66163 ) ) ( HOIST-AT ?auto_66166 ?auto_66163 ) ( not ( = ?auto_66170 ?auto_66166 ) ) ( not ( = ?auto_66171 ?auto_66166 ) ) ( not ( = ?auto_66169 ?auto_66166 ) ) ( AVAILABLE ?auto_66166 ) ( SURFACE-AT ?auto_66181 ?auto_66163 ) ( ON ?auto_66181 ?auto_66158 ) ( CLEAR ?auto_66181 ) ( not ( = ?auto_66156 ?auto_66158 ) ) ( not ( = ?auto_66157 ?auto_66158 ) ) ( not ( = ?auto_66165 ?auto_66158 ) ) ( not ( = ?auto_66160 ?auto_66158 ) ) ( not ( = ?auto_66174 ?auto_66158 ) ) ( not ( = ?auto_66181 ?auto_66158 ) ) ( not ( = ?auto_66180 ?auto_66158 ) ) ( not ( = ?auto_66177 ?auto_66158 ) ) ( IS-CRATE ?auto_66177 ) ( not ( = ?auto_66156 ?auto_66172 ) ) ( not ( = ?auto_66157 ?auto_66172 ) ) ( not ( = ?auto_66165 ?auto_66172 ) ) ( not ( = ?auto_66160 ?auto_66172 ) ) ( not ( = ?auto_66174 ?auto_66172 ) ) ( not ( = ?auto_66181 ?auto_66172 ) ) ( not ( = ?auto_66180 ?auto_66172 ) ) ( not ( = ?auto_66177 ?auto_66172 ) ) ( not ( = ?auto_66158 ?auto_66172 ) ) ( not ( = ?auto_66167 ?auto_66176 ) ) ( not ( = ?auto_66173 ?auto_66167 ) ) ( not ( = ?auto_66164 ?auto_66167 ) ) ( not ( = ?auto_66163 ?auto_66167 ) ) ( HOIST-AT ?auto_66179 ?auto_66167 ) ( not ( = ?auto_66170 ?auto_66179 ) ) ( not ( = ?auto_66171 ?auto_66179 ) ) ( not ( = ?auto_66169 ?auto_66179 ) ) ( not ( = ?auto_66166 ?auto_66179 ) ) ( AVAILABLE ?auto_66179 ) ( SURFACE-AT ?auto_66177 ?auto_66167 ) ( ON ?auto_66177 ?auto_66161 ) ( CLEAR ?auto_66177 ) ( not ( = ?auto_66156 ?auto_66161 ) ) ( not ( = ?auto_66157 ?auto_66161 ) ) ( not ( = ?auto_66165 ?auto_66161 ) ) ( not ( = ?auto_66160 ?auto_66161 ) ) ( not ( = ?auto_66174 ?auto_66161 ) ) ( not ( = ?auto_66181 ?auto_66161 ) ) ( not ( = ?auto_66180 ?auto_66161 ) ) ( not ( = ?auto_66177 ?auto_66161 ) ) ( not ( = ?auto_66158 ?auto_66161 ) ) ( not ( = ?auto_66172 ?auto_66161 ) ) ( IS-CRATE ?auto_66172 ) ( not ( = ?auto_66156 ?auto_66175 ) ) ( not ( = ?auto_66157 ?auto_66175 ) ) ( not ( = ?auto_66165 ?auto_66175 ) ) ( not ( = ?auto_66160 ?auto_66175 ) ) ( not ( = ?auto_66174 ?auto_66175 ) ) ( not ( = ?auto_66181 ?auto_66175 ) ) ( not ( = ?auto_66180 ?auto_66175 ) ) ( not ( = ?auto_66177 ?auto_66175 ) ) ( not ( = ?auto_66158 ?auto_66175 ) ) ( not ( = ?auto_66172 ?auto_66175 ) ) ( not ( = ?auto_66161 ?auto_66175 ) ) ( not ( = ?auto_66178 ?auto_66176 ) ) ( not ( = ?auto_66173 ?auto_66178 ) ) ( not ( = ?auto_66164 ?auto_66178 ) ) ( not ( = ?auto_66163 ?auto_66178 ) ) ( not ( = ?auto_66167 ?auto_66178 ) ) ( HOIST-AT ?auto_66182 ?auto_66178 ) ( not ( = ?auto_66170 ?auto_66182 ) ) ( not ( = ?auto_66171 ?auto_66182 ) ) ( not ( = ?auto_66169 ?auto_66182 ) ) ( not ( = ?auto_66166 ?auto_66182 ) ) ( not ( = ?auto_66179 ?auto_66182 ) ) ( AVAILABLE ?auto_66182 ) ( SURFACE-AT ?auto_66172 ?auto_66178 ) ( ON ?auto_66172 ?auto_66159 ) ( CLEAR ?auto_66172 ) ( not ( = ?auto_66156 ?auto_66159 ) ) ( not ( = ?auto_66157 ?auto_66159 ) ) ( not ( = ?auto_66165 ?auto_66159 ) ) ( not ( = ?auto_66160 ?auto_66159 ) ) ( not ( = ?auto_66174 ?auto_66159 ) ) ( not ( = ?auto_66181 ?auto_66159 ) ) ( not ( = ?auto_66180 ?auto_66159 ) ) ( not ( = ?auto_66177 ?auto_66159 ) ) ( not ( = ?auto_66158 ?auto_66159 ) ) ( not ( = ?auto_66172 ?auto_66159 ) ) ( not ( = ?auto_66161 ?auto_66159 ) ) ( not ( = ?auto_66175 ?auto_66159 ) ) ( SURFACE-AT ?auto_66168 ?auto_66176 ) ( CLEAR ?auto_66168 ) ( IS-CRATE ?auto_66175 ) ( not ( = ?auto_66156 ?auto_66168 ) ) ( not ( = ?auto_66157 ?auto_66168 ) ) ( not ( = ?auto_66165 ?auto_66168 ) ) ( not ( = ?auto_66160 ?auto_66168 ) ) ( not ( = ?auto_66174 ?auto_66168 ) ) ( not ( = ?auto_66181 ?auto_66168 ) ) ( not ( = ?auto_66180 ?auto_66168 ) ) ( not ( = ?auto_66177 ?auto_66168 ) ) ( not ( = ?auto_66158 ?auto_66168 ) ) ( not ( = ?auto_66172 ?auto_66168 ) ) ( not ( = ?auto_66161 ?auto_66168 ) ) ( not ( = ?auto_66175 ?auto_66168 ) ) ( not ( = ?auto_66159 ?auto_66168 ) ) ( AVAILABLE ?auto_66170 ) ( IN ?auto_66175 ?auto_66162 ) ( TRUCK-AT ?auto_66162 ?auto_66183 ) ( not ( = ?auto_66183 ?auto_66176 ) ) ( not ( = ?auto_66173 ?auto_66183 ) ) ( not ( = ?auto_66164 ?auto_66183 ) ) ( not ( = ?auto_66163 ?auto_66183 ) ) ( not ( = ?auto_66167 ?auto_66183 ) ) ( not ( = ?auto_66178 ?auto_66183 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_66162 ?auto_66183 ?auto_66176 )
      ( MAKE-ON ?auto_66156 ?auto_66157 )
      ( MAKE-ON-VERIFY ?auto_66156 ?auto_66157 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_66184 - SURFACE
      ?auto_66185 - SURFACE
    )
    :vars
    (
      ?auto_66186 - HOIST
      ?auto_66191 - PLACE
      ?auto_66190 - PLACE
      ?auto_66205 - HOIST
      ?auto_66207 - SURFACE
      ?auto_66192 - SURFACE
      ?auto_66210 - SURFACE
      ?auto_66209 - SURFACE
      ?auto_66199 - PLACE
      ?auto_66204 - HOIST
      ?auto_66189 - SURFACE
      ?auto_66193 - SURFACE
      ?auto_66202 - PLACE
      ?auto_66203 - HOIST
      ?auto_66208 - SURFACE
      ?auto_66198 - SURFACE
      ?auto_66206 - PLACE
      ?auto_66188 - HOIST
      ?auto_66195 - SURFACE
      ?auto_66211 - SURFACE
      ?auto_66187 - PLACE
      ?auto_66200 - HOIST
      ?auto_66196 - SURFACE
      ?auto_66194 - SURFACE
      ?auto_66197 - TRUCK
      ?auto_66201 - PLACE
      ?auto_66212 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_66186 ?auto_66191 ) ( IS-CRATE ?auto_66184 ) ( not ( = ?auto_66184 ?auto_66185 ) ) ( not ( = ?auto_66190 ?auto_66191 ) ) ( HOIST-AT ?auto_66205 ?auto_66190 ) ( not ( = ?auto_66186 ?auto_66205 ) ) ( SURFACE-AT ?auto_66184 ?auto_66190 ) ( ON ?auto_66184 ?auto_66207 ) ( CLEAR ?auto_66184 ) ( not ( = ?auto_66184 ?auto_66207 ) ) ( not ( = ?auto_66185 ?auto_66207 ) ) ( IS-CRATE ?auto_66185 ) ( not ( = ?auto_66184 ?auto_66192 ) ) ( not ( = ?auto_66185 ?auto_66192 ) ) ( not ( = ?auto_66207 ?auto_66192 ) ) ( AVAILABLE ?auto_66205 ) ( SURFACE-AT ?auto_66185 ?auto_66190 ) ( ON ?auto_66185 ?auto_66210 ) ( CLEAR ?auto_66185 ) ( not ( = ?auto_66184 ?auto_66210 ) ) ( not ( = ?auto_66185 ?auto_66210 ) ) ( not ( = ?auto_66207 ?auto_66210 ) ) ( not ( = ?auto_66192 ?auto_66210 ) ) ( IS-CRATE ?auto_66192 ) ( not ( = ?auto_66184 ?auto_66209 ) ) ( not ( = ?auto_66185 ?auto_66209 ) ) ( not ( = ?auto_66207 ?auto_66209 ) ) ( not ( = ?auto_66192 ?auto_66209 ) ) ( not ( = ?auto_66210 ?auto_66209 ) ) ( not ( = ?auto_66199 ?auto_66191 ) ) ( not ( = ?auto_66190 ?auto_66199 ) ) ( HOIST-AT ?auto_66204 ?auto_66199 ) ( not ( = ?auto_66186 ?auto_66204 ) ) ( not ( = ?auto_66205 ?auto_66204 ) ) ( AVAILABLE ?auto_66204 ) ( SURFACE-AT ?auto_66192 ?auto_66199 ) ( ON ?auto_66192 ?auto_66189 ) ( CLEAR ?auto_66192 ) ( not ( = ?auto_66184 ?auto_66189 ) ) ( not ( = ?auto_66185 ?auto_66189 ) ) ( not ( = ?auto_66207 ?auto_66189 ) ) ( not ( = ?auto_66192 ?auto_66189 ) ) ( not ( = ?auto_66210 ?auto_66189 ) ) ( not ( = ?auto_66209 ?auto_66189 ) ) ( IS-CRATE ?auto_66209 ) ( not ( = ?auto_66184 ?auto_66193 ) ) ( not ( = ?auto_66185 ?auto_66193 ) ) ( not ( = ?auto_66207 ?auto_66193 ) ) ( not ( = ?auto_66192 ?auto_66193 ) ) ( not ( = ?auto_66210 ?auto_66193 ) ) ( not ( = ?auto_66209 ?auto_66193 ) ) ( not ( = ?auto_66189 ?auto_66193 ) ) ( not ( = ?auto_66202 ?auto_66191 ) ) ( not ( = ?auto_66190 ?auto_66202 ) ) ( not ( = ?auto_66199 ?auto_66202 ) ) ( HOIST-AT ?auto_66203 ?auto_66202 ) ( not ( = ?auto_66186 ?auto_66203 ) ) ( not ( = ?auto_66205 ?auto_66203 ) ) ( not ( = ?auto_66204 ?auto_66203 ) ) ( AVAILABLE ?auto_66203 ) ( SURFACE-AT ?auto_66209 ?auto_66202 ) ( ON ?auto_66209 ?auto_66208 ) ( CLEAR ?auto_66209 ) ( not ( = ?auto_66184 ?auto_66208 ) ) ( not ( = ?auto_66185 ?auto_66208 ) ) ( not ( = ?auto_66207 ?auto_66208 ) ) ( not ( = ?auto_66192 ?auto_66208 ) ) ( not ( = ?auto_66210 ?auto_66208 ) ) ( not ( = ?auto_66209 ?auto_66208 ) ) ( not ( = ?auto_66189 ?auto_66208 ) ) ( not ( = ?auto_66193 ?auto_66208 ) ) ( IS-CRATE ?auto_66193 ) ( not ( = ?auto_66184 ?auto_66198 ) ) ( not ( = ?auto_66185 ?auto_66198 ) ) ( not ( = ?auto_66207 ?auto_66198 ) ) ( not ( = ?auto_66192 ?auto_66198 ) ) ( not ( = ?auto_66210 ?auto_66198 ) ) ( not ( = ?auto_66209 ?auto_66198 ) ) ( not ( = ?auto_66189 ?auto_66198 ) ) ( not ( = ?auto_66193 ?auto_66198 ) ) ( not ( = ?auto_66208 ?auto_66198 ) ) ( not ( = ?auto_66206 ?auto_66191 ) ) ( not ( = ?auto_66190 ?auto_66206 ) ) ( not ( = ?auto_66199 ?auto_66206 ) ) ( not ( = ?auto_66202 ?auto_66206 ) ) ( HOIST-AT ?auto_66188 ?auto_66206 ) ( not ( = ?auto_66186 ?auto_66188 ) ) ( not ( = ?auto_66205 ?auto_66188 ) ) ( not ( = ?auto_66204 ?auto_66188 ) ) ( not ( = ?auto_66203 ?auto_66188 ) ) ( AVAILABLE ?auto_66188 ) ( SURFACE-AT ?auto_66193 ?auto_66206 ) ( ON ?auto_66193 ?auto_66195 ) ( CLEAR ?auto_66193 ) ( not ( = ?auto_66184 ?auto_66195 ) ) ( not ( = ?auto_66185 ?auto_66195 ) ) ( not ( = ?auto_66207 ?auto_66195 ) ) ( not ( = ?auto_66192 ?auto_66195 ) ) ( not ( = ?auto_66210 ?auto_66195 ) ) ( not ( = ?auto_66209 ?auto_66195 ) ) ( not ( = ?auto_66189 ?auto_66195 ) ) ( not ( = ?auto_66193 ?auto_66195 ) ) ( not ( = ?auto_66208 ?auto_66195 ) ) ( not ( = ?auto_66198 ?auto_66195 ) ) ( IS-CRATE ?auto_66198 ) ( not ( = ?auto_66184 ?auto_66211 ) ) ( not ( = ?auto_66185 ?auto_66211 ) ) ( not ( = ?auto_66207 ?auto_66211 ) ) ( not ( = ?auto_66192 ?auto_66211 ) ) ( not ( = ?auto_66210 ?auto_66211 ) ) ( not ( = ?auto_66209 ?auto_66211 ) ) ( not ( = ?auto_66189 ?auto_66211 ) ) ( not ( = ?auto_66193 ?auto_66211 ) ) ( not ( = ?auto_66208 ?auto_66211 ) ) ( not ( = ?auto_66198 ?auto_66211 ) ) ( not ( = ?auto_66195 ?auto_66211 ) ) ( not ( = ?auto_66187 ?auto_66191 ) ) ( not ( = ?auto_66190 ?auto_66187 ) ) ( not ( = ?auto_66199 ?auto_66187 ) ) ( not ( = ?auto_66202 ?auto_66187 ) ) ( not ( = ?auto_66206 ?auto_66187 ) ) ( HOIST-AT ?auto_66200 ?auto_66187 ) ( not ( = ?auto_66186 ?auto_66200 ) ) ( not ( = ?auto_66205 ?auto_66200 ) ) ( not ( = ?auto_66204 ?auto_66200 ) ) ( not ( = ?auto_66203 ?auto_66200 ) ) ( not ( = ?auto_66188 ?auto_66200 ) ) ( AVAILABLE ?auto_66200 ) ( SURFACE-AT ?auto_66198 ?auto_66187 ) ( ON ?auto_66198 ?auto_66196 ) ( CLEAR ?auto_66198 ) ( not ( = ?auto_66184 ?auto_66196 ) ) ( not ( = ?auto_66185 ?auto_66196 ) ) ( not ( = ?auto_66207 ?auto_66196 ) ) ( not ( = ?auto_66192 ?auto_66196 ) ) ( not ( = ?auto_66210 ?auto_66196 ) ) ( not ( = ?auto_66209 ?auto_66196 ) ) ( not ( = ?auto_66189 ?auto_66196 ) ) ( not ( = ?auto_66193 ?auto_66196 ) ) ( not ( = ?auto_66208 ?auto_66196 ) ) ( not ( = ?auto_66198 ?auto_66196 ) ) ( not ( = ?auto_66195 ?auto_66196 ) ) ( not ( = ?auto_66211 ?auto_66196 ) ) ( SURFACE-AT ?auto_66194 ?auto_66191 ) ( CLEAR ?auto_66194 ) ( IS-CRATE ?auto_66211 ) ( not ( = ?auto_66184 ?auto_66194 ) ) ( not ( = ?auto_66185 ?auto_66194 ) ) ( not ( = ?auto_66207 ?auto_66194 ) ) ( not ( = ?auto_66192 ?auto_66194 ) ) ( not ( = ?auto_66210 ?auto_66194 ) ) ( not ( = ?auto_66209 ?auto_66194 ) ) ( not ( = ?auto_66189 ?auto_66194 ) ) ( not ( = ?auto_66193 ?auto_66194 ) ) ( not ( = ?auto_66208 ?auto_66194 ) ) ( not ( = ?auto_66198 ?auto_66194 ) ) ( not ( = ?auto_66195 ?auto_66194 ) ) ( not ( = ?auto_66211 ?auto_66194 ) ) ( not ( = ?auto_66196 ?auto_66194 ) ) ( AVAILABLE ?auto_66186 ) ( TRUCK-AT ?auto_66197 ?auto_66201 ) ( not ( = ?auto_66201 ?auto_66191 ) ) ( not ( = ?auto_66190 ?auto_66201 ) ) ( not ( = ?auto_66199 ?auto_66201 ) ) ( not ( = ?auto_66202 ?auto_66201 ) ) ( not ( = ?auto_66206 ?auto_66201 ) ) ( not ( = ?auto_66187 ?auto_66201 ) ) ( HOIST-AT ?auto_66212 ?auto_66201 ) ( LIFTING ?auto_66212 ?auto_66211 ) ( not ( = ?auto_66186 ?auto_66212 ) ) ( not ( = ?auto_66205 ?auto_66212 ) ) ( not ( = ?auto_66204 ?auto_66212 ) ) ( not ( = ?auto_66203 ?auto_66212 ) ) ( not ( = ?auto_66188 ?auto_66212 ) ) ( not ( = ?auto_66200 ?auto_66212 ) ) )
    :subtasks
    ( ( !LOAD ?auto_66212 ?auto_66211 ?auto_66197 ?auto_66201 )
      ( MAKE-ON ?auto_66184 ?auto_66185 )
      ( MAKE-ON-VERIFY ?auto_66184 ?auto_66185 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_66213 - SURFACE
      ?auto_66214 - SURFACE
    )
    :vars
    (
      ?auto_66241 - HOIST
      ?auto_66232 - PLACE
      ?auto_66234 - PLACE
      ?auto_66216 - HOIST
      ?auto_66227 - SURFACE
      ?auto_66222 - SURFACE
      ?auto_66225 - SURFACE
      ?auto_66221 - SURFACE
      ?auto_66237 - PLACE
      ?auto_66226 - HOIST
      ?auto_66240 - SURFACE
      ?auto_66215 - SURFACE
      ?auto_66235 - PLACE
      ?auto_66219 - HOIST
      ?auto_66228 - SURFACE
      ?auto_66239 - SURFACE
      ?auto_66218 - PLACE
      ?auto_66217 - HOIST
      ?auto_66238 - SURFACE
      ?auto_66224 - SURFACE
      ?auto_66233 - PLACE
      ?auto_66230 - HOIST
      ?auto_66231 - SURFACE
      ?auto_66223 - SURFACE
      ?auto_66236 - TRUCK
      ?auto_66229 - PLACE
      ?auto_66220 - HOIST
      ?auto_66242 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_66241 ?auto_66232 ) ( IS-CRATE ?auto_66213 ) ( not ( = ?auto_66213 ?auto_66214 ) ) ( not ( = ?auto_66234 ?auto_66232 ) ) ( HOIST-AT ?auto_66216 ?auto_66234 ) ( not ( = ?auto_66241 ?auto_66216 ) ) ( SURFACE-AT ?auto_66213 ?auto_66234 ) ( ON ?auto_66213 ?auto_66227 ) ( CLEAR ?auto_66213 ) ( not ( = ?auto_66213 ?auto_66227 ) ) ( not ( = ?auto_66214 ?auto_66227 ) ) ( IS-CRATE ?auto_66214 ) ( not ( = ?auto_66213 ?auto_66222 ) ) ( not ( = ?auto_66214 ?auto_66222 ) ) ( not ( = ?auto_66227 ?auto_66222 ) ) ( AVAILABLE ?auto_66216 ) ( SURFACE-AT ?auto_66214 ?auto_66234 ) ( ON ?auto_66214 ?auto_66225 ) ( CLEAR ?auto_66214 ) ( not ( = ?auto_66213 ?auto_66225 ) ) ( not ( = ?auto_66214 ?auto_66225 ) ) ( not ( = ?auto_66227 ?auto_66225 ) ) ( not ( = ?auto_66222 ?auto_66225 ) ) ( IS-CRATE ?auto_66222 ) ( not ( = ?auto_66213 ?auto_66221 ) ) ( not ( = ?auto_66214 ?auto_66221 ) ) ( not ( = ?auto_66227 ?auto_66221 ) ) ( not ( = ?auto_66222 ?auto_66221 ) ) ( not ( = ?auto_66225 ?auto_66221 ) ) ( not ( = ?auto_66237 ?auto_66232 ) ) ( not ( = ?auto_66234 ?auto_66237 ) ) ( HOIST-AT ?auto_66226 ?auto_66237 ) ( not ( = ?auto_66241 ?auto_66226 ) ) ( not ( = ?auto_66216 ?auto_66226 ) ) ( AVAILABLE ?auto_66226 ) ( SURFACE-AT ?auto_66222 ?auto_66237 ) ( ON ?auto_66222 ?auto_66240 ) ( CLEAR ?auto_66222 ) ( not ( = ?auto_66213 ?auto_66240 ) ) ( not ( = ?auto_66214 ?auto_66240 ) ) ( not ( = ?auto_66227 ?auto_66240 ) ) ( not ( = ?auto_66222 ?auto_66240 ) ) ( not ( = ?auto_66225 ?auto_66240 ) ) ( not ( = ?auto_66221 ?auto_66240 ) ) ( IS-CRATE ?auto_66221 ) ( not ( = ?auto_66213 ?auto_66215 ) ) ( not ( = ?auto_66214 ?auto_66215 ) ) ( not ( = ?auto_66227 ?auto_66215 ) ) ( not ( = ?auto_66222 ?auto_66215 ) ) ( not ( = ?auto_66225 ?auto_66215 ) ) ( not ( = ?auto_66221 ?auto_66215 ) ) ( not ( = ?auto_66240 ?auto_66215 ) ) ( not ( = ?auto_66235 ?auto_66232 ) ) ( not ( = ?auto_66234 ?auto_66235 ) ) ( not ( = ?auto_66237 ?auto_66235 ) ) ( HOIST-AT ?auto_66219 ?auto_66235 ) ( not ( = ?auto_66241 ?auto_66219 ) ) ( not ( = ?auto_66216 ?auto_66219 ) ) ( not ( = ?auto_66226 ?auto_66219 ) ) ( AVAILABLE ?auto_66219 ) ( SURFACE-AT ?auto_66221 ?auto_66235 ) ( ON ?auto_66221 ?auto_66228 ) ( CLEAR ?auto_66221 ) ( not ( = ?auto_66213 ?auto_66228 ) ) ( not ( = ?auto_66214 ?auto_66228 ) ) ( not ( = ?auto_66227 ?auto_66228 ) ) ( not ( = ?auto_66222 ?auto_66228 ) ) ( not ( = ?auto_66225 ?auto_66228 ) ) ( not ( = ?auto_66221 ?auto_66228 ) ) ( not ( = ?auto_66240 ?auto_66228 ) ) ( not ( = ?auto_66215 ?auto_66228 ) ) ( IS-CRATE ?auto_66215 ) ( not ( = ?auto_66213 ?auto_66239 ) ) ( not ( = ?auto_66214 ?auto_66239 ) ) ( not ( = ?auto_66227 ?auto_66239 ) ) ( not ( = ?auto_66222 ?auto_66239 ) ) ( not ( = ?auto_66225 ?auto_66239 ) ) ( not ( = ?auto_66221 ?auto_66239 ) ) ( not ( = ?auto_66240 ?auto_66239 ) ) ( not ( = ?auto_66215 ?auto_66239 ) ) ( not ( = ?auto_66228 ?auto_66239 ) ) ( not ( = ?auto_66218 ?auto_66232 ) ) ( not ( = ?auto_66234 ?auto_66218 ) ) ( not ( = ?auto_66237 ?auto_66218 ) ) ( not ( = ?auto_66235 ?auto_66218 ) ) ( HOIST-AT ?auto_66217 ?auto_66218 ) ( not ( = ?auto_66241 ?auto_66217 ) ) ( not ( = ?auto_66216 ?auto_66217 ) ) ( not ( = ?auto_66226 ?auto_66217 ) ) ( not ( = ?auto_66219 ?auto_66217 ) ) ( AVAILABLE ?auto_66217 ) ( SURFACE-AT ?auto_66215 ?auto_66218 ) ( ON ?auto_66215 ?auto_66238 ) ( CLEAR ?auto_66215 ) ( not ( = ?auto_66213 ?auto_66238 ) ) ( not ( = ?auto_66214 ?auto_66238 ) ) ( not ( = ?auto_66227 ?auto_66238 ) ) ( not ( = ?auto_66222 ?auto_66238 ) ) ( not ( = ?auto_66225 ?auto_66238 ) ) ( not ( = ?auto_66221 ?auto_66238 ) ) ( not ( = ?auto_66240 ?auto_66238 ) ) ( not ( = ?auto_66215 ?auto_66238 ) ) ( not ( = ?auto_66228 ?auto_66238 ) ) ( not ( = ?auto_66239 ?auto_66238 ) ) ( IS-CRATE ?auto_66239 ) ( not ( = ?auto_66213 ?auto_66224 ) ) ( not ( = ?auto_66214 ?auto_66224 ) ) ( not ( = ?auto_66227 ?auto_66224 ) ) ( not ( = ?auto_66222 ?auto_66224 ) ) ( not ( = ?auto_66225 ?auto_66224 ) ) ( not ( = ?auto_66221 ?auto_66224 ) ) ( not ( = ?auto_66240 ?auto_66224 ) ) ( not ( = ?auto_66215 ?auto_66224 ) ) ( not ( = ?auto_66228 ?auto_66224 ) ) ( not ( = ?auto_66239 ?auto_66224 ) ) ( not ( = ?auto_66238 ?auto_66224 ) ) ( not ( = ?auto_66233 ?auto_66232 ) ) ( not ( = ?auto_66234 ?auto_66233 ) ) ( not ( = ?auto_66237 ?auto_66233 ) ) ( not ( = ?auto_66235 ?auto_66233 ) ) ( not ( = ?auto_66218 ?auto_66233 ) ) ( HOIST-AT ?auto_66230 ?auto_66233 ) ( not ( = ?auto_66241 ?auto_66230 ) ) ( not ( = ?auto_66216 ?auto_66230 ) ) ( not ( = ?auto_66226 ?auto_66230 ) ) ( not ( = ?auto_66219 ?auto_66230 ) ) ( not ( = ?auto_66217 ?auto_66230 ) ) ( AVAILABLE ?auto_66230 ) ( SURFACE-AT ?auto_66239 ?auto_66233 ) ( ON ?auto_66239 ?auto_66231 ) ( CLEAR ?auto_66239 ) ( not ( = ?auto_66213 ?auto_66231 ) ) ( not ( = ?auto_66214 ?auto_66231 ) ) ( not ( = ?auto_66227 ?auto_66231 ) ) ( not ( = ?auto_66222 ?auto_66231 ) ) ( not ( = ?auto_66225 ?auto_66231 ) ) ( not ( = ?auto_66221 ?auto_66231 ) ) ( not ( = ?auto_66240 ?auto_66231 ) ) ( not ( = ?auto_66215 ?auto_66231 ) ) ( not ( = ?auto_66228 ?auto_66231 ) ) ( not ( = ?auto_66239 ?auto_66231 ) ) ( not ( = ?auto_66238 ?auto_66231 ) ) ( not ( = ?auto_66224 ?auto_66231 ) ) ( SURFACE-AT ?auto_66223 ?auto_66232 ) ( CLEAR ?auto_66223 ) ( IS-CRATE ?auto_66224 ) ( not ( = ?auto_66213 ?auto_66223 ) ) ( not ( = ?auto_66214 ?auto_66223 ) ) ( not ( = ?auto_66227 ?auto_66223 ) ) ( not ( = ?auto_66222 ?auto_66223 ) ) ( not ( = ?auto_66225 ?auto_66223 ) ) ( not ( = ?auto_66221 ?auto_66223 ) ) ( not ( = ?auto_66240 ?auto_66223 ) ) ( not ( = ?auto_66215 ?auto_66223 ) ) ( not ( = ?auto_66228 ?auto_66223 ) ) ( not ( = ?auto_66239 ?auto_66223 ) ) ( not ( = ?auto_66238 ?auto_66223 ) ) ( not ( = ?auto_66224 ?auto_66223 ) ) ( not ( = ?auto_66231 ?auto_66223 ) ) ( AVAILABLE ?auto_66241 ) ( TRUCK-AT ?auto_66236 ?auto_66229 ) ( not ( = ?auto_66229 ?auto_66232 ) ) ( not ( = ?auto_66234 ?auto_66229 ) ) ( not ( = ?auto_66237 ?auto_66229 ) ) ( not ( = ?auto_66235 ?auto_66229 ) ) ( not ( = ?auto_66218 ?auto_66229 ) ) ( not ( = ?auto_66233 ?auto_66229 ) ) ( HOIST-AT ?auto_66220 ?auto_66229 ) ( not ( = ?auto_66241 ?auto_66220 ) ) ( not ( = ?auto_66216 ?auto_66220 ) ) ( not ( = ?auto_66226 ?auto_66220 ) ) ( not ( = ?auto_66219 ?auto_66220 ) ) ( not ( = ?auto_66217 ?auto_66220 ) ) ( not ( = ?auto_66230 ?auto_66220 ) ) ( AVAILABLE ?auto_66220 ) ( SURFACE-AT ?auto_66224 ?auto_66229 ) ( ON ?auto_66224 ?auto_66242 ) ( CLEAR ?auto_66224 ) ( not ( = ?auto_66213 ?auto_66242 ) ) ( not ( = ?auto_66214 ?auto_66242 ) ) ( not ( = ?auto_66227 ?auto_66242 ) ) ( not ( = ?auto_66222 ?auto_66242 ) ) ( not ( = ?auto_66225 ?auto_66242 ) ) ( not ( = ?auto_66221 ?auto_66242 ) ) ( not ( = ?auto_66240 ?auto_66242 ) ) ( not ( = ?auto_66215 ?auto_66242 ) ) ( not ( = ?auto_66228 ?auto_66242 ) ) ( not ( = ?auto_66239 ?auto_66242 ) ) ( not ( = ?auto_66238 ?auto_66242 ) ) ( not ( = ?auto_66224 ?auto_66242 ) ) ( not ( = ?auto_66231 ?auto_66242 ) ) ( not ( = ?auto_66223 ?auto_66242 ) ) )
    :subtasks
    ( ( !LIFT ?auto_66220 ?auto_66224 ?auto_66242 ?auto_66229 )
      ( MAKE-ON ?auto_66213 ?auto_66214 )
      ( MAKE-ON-VERIFY ?auto_66213 ?auto_66214 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_66243 - SURFACE
      ?auto_66244 - SURFACE
    )
    :vars
    (
      ?auto_66249 - HOIST
      ?auto_66245 - PLACE
      ?auto_66257 - PLACE
      ?auto_66246 - HOIST
      ?auto_66269 - SURFACE
      ?auto_66271 - SURFACE
      ?auto_66262 - SURFACE
      ?auto_66266 - SURFACE
      ?auto_66264 - PLACE
      ?auto_66253 - HOIST
      ?auto_66250 - SURFACE
      ?auto_66260 - SURFACE
      ?auto_66258 - PLACE
      ?auto_66255 - HOIST
      ?auto_66247 - SURFACE
      ?auto_66251 - SURFACE
      ?auto_66270 - PLACE
      ?auto_66267 - HOIST
      ?auto_66248 - SURFACE
      ?auto_66268 - SURFACE
      ?auto_66256 - PLACE
      ?auto_66265 - HOIST
      ?auto_66254 - SURFACE
      ?auto_66259 - SURFACE
      ?auto_66252 - PLACE
      ?auto_66272 - HOIST
      ?auto_66261 - SURFACE
      ?auto_66263 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_66249 ?auto_66245 ) ( IS-CRATE ?auto_66243 ) ( not ( = ?auto_66243 ?auto_66244 ) ) ( not ( = ?auto_66257 ?auto_66245 ) ) ( HOIST-AT ?auto_66246 ?auto_66257 ) ( not ( = ?auto_66249 ?auto_66246 ) ) ( SURFACE-AT ?auto_66243 ?auto_66257 ) ( ON ?auto_66243 ?auto_66269 ) ( CLEAR ?auto_66243 ) ( not ( = ?auto_66243 ?auto_66269 ) ) ( not ( = ?auto_66244 ?auto_66269 ) ) ( IS-CRATE ?auto_66244 ) ( not ( = ?auto_66243 ?auto_66271 ) ) ( not ( = ?auto_66244 ?auto_66271 ) ) ( not ( = ?auto_66269 ?auto_66271 ) ) ( AVAILABLE ?auto_66246 ) ( SURFACE-AT ?auto_66244 ?auto_66257 ) ( ON ?auto_66244 ?auto_66262 ) ( CLEAR ?auto_66244 ) ( not ( = ?auto_66243 ?auto_66262 ) ) ( not ( = ?auto_66244 ?auto_66262 ) ) ( not ( = ?auto_66269 ?auto_66262 ) ) ( not ( = ?auto_66271 ?auto_66262 ) ) ( IS-CRATE ?auto_66271 ) ( not ( = ?auto_66243 ?auto_66266 ) ) ( not ( = ?auto_66244 ?auto_66266 ) ) ( not ( = ?auto_66269 ?auto_66266 ) ) ( not ( = ?auto_66271 ?auto_66266 ) ) ( not ( = ?auto_66262 ?auto_66266 ) ) ( not ( = ?auto_66264 ?auto_66245 ) ) ( not ( = ?auto_66257 ?auto_66264 ) ) ( HOIST-AT ?auto_66253 ?auto_66264 ) ( not ( = ?auto_66249 ?auto_66253 ) ) ( not ( = ?auto_66246 ?auto_66253 ) ) ( AVAILABLE ?auto_66253 ) ( SURFACE-AT ?auto_66271 ?auto_66264 ) ( ON ?auto_66271 ?auto_66250 ) ( CLEAR ?auto_66271 ) ( not ( = ?auto_66243 ?auto_66250 ) ) ( not ( = ?auto_66244 ?auto_66250 ) ) ( not ( = ?auto_66269 ?auto_66250 ) ) ( not ( = ?auto_66271 ?auto_66250 ) ) ( not ( = ?auto_66262 ?auto_66250 ) ) ( not ( = ?auto_66266 ?auto_66250 ) ) ( IS-CRATE ?auto_66266 ) ( not ( = ?auto_66243 ?auto_66260 ) ) ( not ( = ?auto_66244 ?auto_66260 ) ) ( not ( = ?auto_66269 ?auto_66260 ) ) ( not ( = ?auto_66271 ?auto_66260 ) ) ( not ( = ?auto_66262 ?auto_66260 ) ) ( not ( = ?auto_66266 ?auto_66260 ) ) ( not ( = ?auto_66250 ?auto_66260 ) ) ( not ( = ?auto_66258 ?auto_66245 ) ) ( not ( = ?auto_66257 ?auto_66258 ) ) ( not ( = ?auto_66264 ?auto_66258 ) ) ( HOIST-AT ?auto_66255 ?auto_66258 ) ( not ( = ?auto_66249 ?auto_66255 ) ) ( not ( = ?auto_66246 ?auto_66255 ) ) ( not ( = ?auto_66253 ?auto_66255 ) ) ( AVAILABLE ?auto_66255 ) ( SURFACE-AT ?auto_66266 ?auto_66258 ) ( ON ?auto_66266 ?auto_66247 ) ( CLEAR ?auto_66266 ) ( not ( = ?auto_66243 ?auto_66247 ) ) ( not ( = ?auto_66244 ?auto_66247 ) ) ( not ( = ?auto_66269 ?auto_66247 ) ) ( not ( = ?auto_66271 ?auto_66247 ) ) ( not ( = ?auto_66262 ?auto_66247 ) ) ( not ( = ?auto_66266 ?auto_66247 ) ) ( not ( = ?auto_66250 ?auto_66247 ) ) ( not ( = ?auto_66260 ?auto_66247 ) ) ( IS-CRATE ?auto_66260 ) ( not ( = ?auto_66243 ?auto_66251 ) ) ( not ( = ?auto_66244 ?auto_66251 ) ) ( not ( = ?auto_66269 ?auto_66251 ) ) ( not ( = ?auto_66271 ?auto_66251 ) ) ( not ( = ?auto_66262 ?auto_66251 ) ) ( not ( = ?auto_66266 ?auto_66251 ) ) ( not ( = ?auto_66250 ?auto_66251 ) ) ( not ( = ?auto_66260 ?auto_66251 ) ) ( not ( = ?auto_66247 ?auto_66251 ) ) ( not ( = ?auto_66270 ?auto_66245 ) ) ( not ( = ?auto_66257 ?auto_66270 ) ) ( not ( = ?auto_66264 ?auto_66270 ) ) ( not ( = ?auto_66258 ?auto_66270 ) ) ( HOIST-AT ?auto_66267 ?auto_66270 ) ( not ( = ?auto_66249 ?auto_66267 ) ) ( not ( = ?auto_66246 ?auto_66267 ) ) ( not ( = ?auto_66253 ?auto_66267 ) ) ( not ( = ?auto_66255 ?auto_66267 ) ) ( AVAILABLE ?auto_66267 ) ( SURFACE-AT ?auto_66260 ?auto_66270 ) ( ON ?auto_66260 ?auto_66248 ) ( CLEAR ?auto_66260 ) ( not ( = ?auto_66243 ?auto_66248 ) ) ( not ( = ?auto_66244 ?auto_66248 ) ) ( not ( = ?auto_66269 ?auto_66248 ) ) ( not ( = ?auto_66271 ?auto_66248 ) ) ( not ( = ?auto_66262 ?auto_66248 ) ) ( not ( = ?auto_66266 ?auto_66248 ) ) ( not ( = ?auto_66250 ?auto_66248 ) ) ( not ( = ?auto_66260 ?auto_66248 ) ) ( not ( = ?auto_66247 ?auto_66248 ) ) ( not ( = ?auto_66251 ?auto_66248 ) ) ( IS-CRATE ?auto_66251 ) ( not ( = ?auto_66243 ?auto_66268 ) ) ( not ( = ?auto_66244 ?auto_66268 ) ) ( not ( = ?auto_66269 ?auto_66268 ) ) ( not ( = ?auto_66271 ?auto_66268 ) ) ( not ( = ?auto_66262 ?auto_66268 ) ) ( not ( = ?auto_66266 ?auto_66268 ) ) ( not ( = ?auto_66250 ?auto_66268 ) ) ( not ( = ?auto_66260 ?auto_66268 ) ) ( not ( = ?auto_66247 ?auto_66268 ) ) ( not ( = ?auto_66251 ?auto_66268 ) ) ( not ( = ?auto_66248 ?auto_66268 ) ) ( not ( = ?auto_66256 ?auto_66245 ) ) ( not ( = ?auto_66257 ?auto_66256 ) ) ( not ( = ?auto_66264 ?auto_66256 ) ) ( not ( = ?auto_66258 ?auto_66256 ) ) ( not ( = ?auto_66270 ?auto_66256 ) ) ( HOIST-AT ?auto_66265 ?auto_66256 ) ( not ( = ?auto_66249 ?auto_66265 ) ) ( not ( = ?auto_66246 ?auto_66265 ) ) ( not ( = ?auto_66253 ?auto_66265 ) ) ( not ( = ?auto_66255 ?auto_66265 ) ) ( not ( = ?auto_66267 ?auto_66265 ) ) ( AVAILABLE ?auto_66265 ) ( SURFACE-AT ?auto_66251 ?auto_66256 ) ( ON ?auto_66251 ?auto_66254 ) ( CLEAR ?auto_66251 ) ( not ( = ?auto_66243 ?auto_66254 ) ) ( not ( = ?auto_66244 ?auto_66254 ) ) ( not ( = ?auto_66269 ?auto_66254 ) ) ( not ( = ?auto_66271 ?auto_66254 ) ) ( not ( = ?auto_66262 ?auto_66254 ) ) ( not ( = ?auto_66266 ?auto_66254 ) ) ( not ( = ?auto_66250 ?auto_66254 ) ) ( not ( = ?auto_66260 ?auto_66254 ) ) ( not ( = ?auto_66247 ?auto_66254 ) ) ( not ( = ?auto_66251 ?auto_66254 ) ) ( not ( = ?auto_66248 ?auto_66254 ) ) ( not ( = ?auto_66268 ?auto_66254 ) ) ( SURFACE-AT ?auto_66259 ?auto_66245 ) ( CLEAR ?auto_66259 ) ( IS-CRATE ?auto_66268 ) ( not ( = ?auto_66243 ?auto_66259 ) ) ( not ( = ?auto_66244 ?auto_66259 ) ) ( not ( = ?auto_66269 ?auto_66259 ) ) ( not ( = ?auto_66271 ?auto_66259 ) ) ( not ( = ?auto_66262 ?auto_66259 ) ) ( not ( = ?auto_66266 ?auto_66259 ) ) ( not ( = ?auto_66250 ?auto_66259 ) ) ( not ( = ?auto_66260 ?auto_66259 ) ) ( not ( = ?auto_66247 ?auto_66259 ) ) ( not ( = ?auto_66251 ?auto_66259 ) ) ( not ( = ?auto_66248 ?auto_66259 ) ) ( not ( = ?auto_66268 ?auto_66259 ) ) ( not ( = ?auto_66254 ?auto_66259 ) ) ( AVAILABLE ?auto_66249 ) ( not ( = ?auto_66252 ?auto_66245 ) ) ( not ( = ?auto_66257 ?auto_66252 ) ) ( not ( = ?auto_66264 ?auto_66252 ) ) ( not ( = ?auto_66258 ?auto_66252 ) ) ( not ( = ?auto_66270 ?auto_66252 ) ) ( not ( = ?auto_66256 ?auto_66252 ) ) ( HOIST-AT ?auto_66272 ?auto_66252 ) ( not ( = ?auto_66249 ?auto_66272 ) ) ( not ( = ?auto_66246 ?auto_66272 ) ) ( not ( = ?auto_66253 ?auto_66272 ) ) ( not ( = ?auto_66255 ?auto_66272 ) ) ( not ( = ?auto_66267 ?auto_66272 ) ) ( not ( = ?auto_66265 ?auto_66272 ) ) ( AVAILABLE ?auto_66272 ) ( SURFACE-AT ?auto_66268 ?auto_66252 ) ( ON ?auto_66268 ?auto_66261 ) ( CLEAR ?auto_66268 ) ( not ( = ?auto_66243 ?auto_66261 ) ) ( not ( = ?auto_66244 ?auto_66261 ) ) ( not ( = ?auto_66269 ?auto_66261 ) ) ( not ( = ?auto_66271 ?auto_66261 ) ) ( not ( = ?auto_66262 ?auto_66261 ) ) ( not ( = ?auto_66266 ?auto_66261 ) ) ( not ( = ?auto_66250 ?auto_66261 ) ) ( not ( = ?auto_66260 ?auto_66261 ) ) ( not ( = ?auto_66247 ?auto_66261 ) ) ( not ( = ?auto_66251 ?auto_66261 ) ) ( not ( = ?auto_66248 ?auto_66261 ) ) ( not ( = ?auto_66268 ?auto_66261 ) ) ( not ( = ?auto_66254 ?auto_66261 ) ) ( not ( = ?auto_66259 ?auto_66261 ) ) ( TRUCK-AT ?auto_66263 ?auto_66245 ) )
    :subtasks
    ( ( !DRIVE ?auto_66263 ?auto_66245 ?auto_66252 )
      ( MAKE-ON ?auto_66243 ?auto_66244 )
      ( MAKE-ON-VERIFY ?auto_66243 ?auto_66244 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_66275 - SURFACE
      ?auto_66276 - SURFACE
    )
    :vars
    (
      ?auto_66277 - HOIST
      ?auto_66278 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_66277 ?auto_66278 ) ( SURFACE-AT ?auto_66276 ?auto_66278 ) ( CLEAR ?auto_66276 ) ( LIFTING ?auto_66277 ?auto_66275 ) ( IS-CRATE ?auto_66275 ) ( not ( = ?auto_66275 ?auto_66276 ) ) )
    :subtasks
    ( ( !DROP ?auto_66277 ?auto_66275 ?auto_66276 ?auto_66278 )
      ( MAKE-ON-VERIFY ?auto_66275 ?auto_66276 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_66279 - SURFACE
      ?auto_66280 - SURFACE
    )
    :vars
    (
      ?auto_66282 - HOIST
      ?auto_66281 - PLACE
      ?auto_66283 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_66282 ?auto_66281 ) ( SURFACE-AT ?auto_66280 ?auto_66281 ) ( CLEAR ?auto_66280 ) ( IS-CRATE ?auto_66279 ) ( not ( = ?auto_66279 ?auto_66280 ) ) ( TRUCK-AT ?auto_66283 ?auto_66281 ) ( AVAILABLE ?auto_66282 ) ( IN ?auto_66279 ?auto_66283 ) )
    :subtasks
    ( ( !UNLOAD ?auto_66282 ?auto_66279 ?auto_66283 ?auto_66281 )
      ( MAKE-ON ?auto_66279 ?auto_66280 )
      ( MAKE-ON-VERIFY ?auto_66279 ?auto_66280 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_66284 - SURFACE
      ?auto_66285 - SURFACE
    )
    :vars
    (
      ?auto_66288 - HOIST
      ?auto_66286 - PLACE
      ?auto_66287 - TRUCK
      ?auto_66289 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_66288 ?auto_66286 ) ( SURFACE-AT ?auto_66285 ?auto_66286 ) ( CLEAR ?auto_66285 ) ( IS-CRATE ?auto_66284 ) ( not ( = ?auto_66284 ?auto_66285 ) ) ( AVAILABLE ?auto_66288 ) ( IN ?auto_66284 ?auto_66287 ) ( TRUCK-AT ?auto_66287 ?auto_66289 ) ( not ( = ?auto_66289 ?auto_66286 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_66287 ?auto_66289 ?auto_66286 )
      ( MAKE-ON ?auto_66284 ?auto_66285 )
      ( MAKE-ON-VERIFY ?auto_66284 ?auto_66285 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_66290 - SURFACE
      ?auto_66291 - SURFACE
    )
    :vars
    (
      ?auto_66293 - HOIST
      ?auto_66294 - PLACE
      ?auto_66295 - TRUCK
      ?auto_66292 - PLACE
      ?auto_66296 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_66293 ?auto_66294 ) ( SURFACE-AT ?auto_66291 ?auto_66294 ) ( CLEAR ?auto_66291 ) ( IS-CRATE ?auto_66290 ) ( not ( = ?auto_66290 ?auto_66291 ) ) ( AVAILABLE ?auto_66293 ) ( TRUCK-AT ?auto_66295 ?auto_66292 ) ( not ( = ?auto_66292 ?auto_66294 ) ) ( HOIST-AT ?auto_66296 ?auto_66292 ) ( LIFTING ?auto_66296 ?auto_66290 ) ( not ( = ?auto_66293 ?auto_66296 ) ) )
    :subtasks
    ( ( !LOAD ?auto_66296 ?auto_66290 ?auto_66295 ?auto_66292 )
      ( MAKE-ON ?auto_66290 ?auto_66291 )
      ( MAKE-ON-VERIFY ?auto_66290 ?auto_66291 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_66297 - SURFACE
      ?auto_66298 - SURFACE
    )
    :vars
    (
      ?auto_66303 - HOIST
      ?auto_66300 - PLACE
      ?auto_66302 - TRUCK
      ?auto_66301 - PLACE
      ?auto_66299 - HOIST
      ?auto_66304 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_66303 ?auto_66300 ) ( SURFACE-AT ?auto_66298 ?auto_66300 ) ( CLEAR ?auto_66298 ) ( IS-CRATE ?auto_66297 ) ( not ( = ?auto_66297 ?auto_66298 ) ) ( AVAILABLE ?auto_66303 ) ( TRUCK-AT ?auto_66302 ?auto_66301 ) ( not ( = ?auto_66301 ?auto_66300 ) ) ( HOIST-AT ?auto_66299 ?auto_66301 ) ( not ( = ?auto_66303 ?auto_66299 ) ) ( AVAILABLE ?auto_66299 ) ( SURFACE-AT ?auto_66297 ?auto_66301 ) ( ON ?auto_66297 ?auto_66304 ) ( CLEAR ?auto_66297 ) ( not ( = ?auto_66297 ?auto_66304 ) ) ( not ( = ?auto_66298 ?auto_66304 ) ) )
    :subtasks
    ( ( !LIFT ?auto_66299 ?auto_66297 ?auto_66304 ?auto_66301 )
      ( MAKE-ON ?auto_66297 ?auto_66298 )
      ( MAKE-ON-VERIFY ?auto_66297 ?auto_66298 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_66305 - SURFACE
      ?auto_66306 - SURFACE
    )
    :vars
    (
      ?auto_66308 - HOIST
      ?auto_66310 - PLACE
      ?auto_66309 - PLACE
      ?auto_66312 - HOIST
      ?auto_66307 - SURFACE
      ?auto_66311 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_66308 ?auto_66310 ) ( SURFACE-AT ?auto_66306 ?auto_66310 ) ( CLEAR ?auto_66306 ) ( IS-CRATE ?auto_66305 ) ( not ( = ?auto_66305 ?auto_66306 ) ) ( AVAILABLE ?auto_66308 ) ( not ( = ?auto_66309 ?auto_66310 ) ) ( HOIST-AT ?auto_66312 ?auto_66309 ) ( not ( = ?auto_66308 ?auto_66312 ) ) ( AVAILABLE ?auto_66312 ) ( SURFACE-AT ?auto_66305 ?auto_66309 ) ( ON ?auto_66305 ?auto_66307 ) ( CLEAR ?auto_66305 ) ( not ( = ?auto_66305 ?auto_66307 ) ) ( not ( = ?auto_66306 ?auto_66307 ) ) ( TRUCK-AT ?auto_66311 ?auto_66310 ) )
    :subtasks
    ( ( !DRIVE ?auto_66311 ?auto_66310 ?auto_66309 )
      ( MAKE-ON ?auto_66305 ?auto_66306 )
      ( MAKE-ON-VERIFY ?auto_66305 ?auto_66306 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_66313 - SURFACE
      ?auto_66314 - SURFACE
    )
    :vars
    (
      ?auto_66317 - HOIST
      ?auto_66318 - PLACE
      ?auto_66315 - PLACE
      ?auto_66320 - HOIST
      ?auto_66316 - SURFACE
      ?auto_66319 - TRUCK
      ?auto_66321 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_66317 ?auto_66318 ) ( IS-CRATE ?auto_66313 ) ( not ( = ?auto_66313 ?auto_66314 ) ) ( not ( = ?auto_66315 ?auto_66318 ) ) ( HOIST-AT ?auto_66320 ?auto_66315 ) ( not ( = ?auto_66317 ?auto_66320 ) ) ( AVAILABLE ?auto_66320 ) ( SURFACE-AT ?auto_66313 ?auto_66315 ) ( ON ?auto_66313 ?auto_66316 ) ( CLEAR ?auto_66313 ) ( not ( = ?auto_66313 ?auto_66316 ) ) ( not ( = ?auto_66314 ?auto_66316 ) ) ( TRUCK-AT ?auto_66319 ?auto_66318 ) ( SURFACE-AT ?auto_66321 ?auto_66318 ) ( CLEAR ?auto_66321 ) ( LIFTING ?auto_66317 ?auto_66314 ) ( IS-CRATE ?auto_66314 ) ( not ( = ?auto_66313 ?auto_66321 ) ) ( not ( = ?auto_66314 ?auto_66321 ) ) ( not ( = ?auto_66316 ?auto_66321 ) ) )
    :subtasks
    ( ( !DROP ?auto_66317 ?auto_66314 ?auto_66321 ?auto_66318 )
      ( MAKE-ON ?auto_66313 ?auto_66314 )
      ( MAKE-ON-VERIFY ?auto_66313 ?auto_66314 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_66322 - SURFACE
      ?auto_66323 - SURFACE
    )
    :vars
    (
      ?auto_66330 - HOIST
      ?auto_66324 - PLACE
      ?auto_66326 - PLACE
      ?auto_66328 - HOIST
      ?auto_66329 - SURFACE
      ?auto_66327 - TRUCK
      ?auto_66325 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_66330 ?auto_66324 ) ( IS-CRATE ?auto_66322 ) ( not ( = ?auto_66322 ?auto_66323 ) ) ( not ( = ?auto_66326 ?auto_66324 ) ) ( HOIST-AT ?auto_66328 ?auto_66326 ) ( not ( = ?auto_66330 ?auto_66328 ) ) ( AVAILABLE ?auto_66328 ) ( SURFACE-AT ?auto_66322 ?auto_66326 ) ( ON ?auto_66322 ?auto_66329 ) ( CLEAR ?auto_66322 ) ( not ( = ?auto_66322 ?auto_66329 ) ) ( not ( = ?auto_66323 ?auto_66329 ) ) ( TRUCK-AT ?auto_66327 ?auto_66324 ) ( SURFACE-AT ?auto_66325 ?auto_66324 ) ( CLEAR ?auto_66325 ) ( IS-CRATE ?auto_66323 ) ( not ( = ?auto_66322 ?auto_66325 ) ) ( not ( = ?auto_66323 ?auto_66325 ) ) ( not ( = ?auto_66329 ?auto_66325 ) ) ( AVAILABLE ?auto_66330 ) ( IN ?auto_66323 ?auto_66327 ) )
    :subtasks
    ( ( !UNLOAD ?auto_66330 ?auto_66323 ?auto_66327 ?auto_66324 )
      ( MAKE-ON ?auto_66322 ?auto_66323 )
      ( MAKE-ON-VERIFY ?auto_66322 ?auto_66323 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_66331 - SURFACE
      ?auto_66332 - SURFACE
    )
    :vars
    (
      ?auto_66339 - HOIST
      ?auto_66336 - PLACE
      ?auto_66338 - PLACE
      ?auto_66333 - HOIST
      ?auto_66337 - SURFACE
      ?auto_66335 - SURFACE
      ?auto_66334 - TRUCK
      ?auto_66340 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_66339 ?auto_66336 ) ( IS-CRATE ?auto_66331 ) ( not ( = ?auto_66331 ?auto_66332 ) ) ( not ( = ?auto_66338 ?auto_66336 ) ) ( HOIST-AT ?auto_66333 ?auto_66338 ) ( not ( = ?auto_66339 ?auto_66333 ) ) ( AVAILABLE ?auto_66333 ) ( SURFACE-AT ?auto_66331 ?auto_66338 ) ( ON ?auto_66331 ?auto_66337 ) ( CLEAR ?auto_66331 ) ( not ( = ?auto_66331 ?auto_66337 ) ) ( not ( = ?auto_66332 ?auto_66337 ) ) ( SURFACE-AT ?auto_66335 ?auto_66336 ) ( CLEAR ?auto_66335 ) ( IS-CRATE ?auto_66332 ) ( not ( = ?auto_66331 ?auto_66335 ) ) ( not ( = ?auto_66332 ?auto_66335 ) ) ( not ( = ?auto_66337 ?auto_66335 ) ) ( AVAILABLE ?auto_66339 ) ( IN ?auto_66332 ?auto_66334 ) ( TRUCK-AT ?auto_66334 ?auto_66340 ) ( not ( = ?auto_66340 ?auto_66336 ) ) ( not ( = ?auto_66338 ?auto_66340 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_66334 ?auto_66340 ?auto_66336 )
      ( MAKE-ON ?auto_66331 ?auto_66332 )
      ( MAKE-ON-VERIFY ?auto_66331 ?auto_66332 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_66341 - SURFACE
      ?auto_66342 - SURFACE
    )
    :vars
    (
      ?auto_66344 - HOIST
      ?auto_66350 - PLACE
      ?auto_66345 - PLACE
      ?auto_66343 - HOIST
      ?auto_66347 - SURFACE
      ?auto_66349 - SURFACE
      ?auto_66346 - TRUCK
      ?auto_66348 - PLACE
      ?auto_66351 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_66344 ?auto_66350 ) ( IS-CRATE ?auto_66341 ) ( not ( = ?auto_66341 ?auto_66342 ) ) ( not ( = ?auto_66345 ?auto_66350 ) ) ( HOIST-AT ?auto_66343 ?auto_66345 ) ( not ( = ?auto_66344 ?auto_66343 ) ) ( AVAILABLE ?auto_66343 ) ( SURFACE-AT ?auto_66341 ?auto_66345 ) ( ON ?auto_66341 ?auto_66347 ) ( CLEAR ?auto_66341 ) ( not ( = ?auto_66341 ?auto_66347 ) ) ( not ( = ?auto_66342 ?auto_66347 ) ) ( SURFACE-AT ?auto_66349 ?auto_66350 ) ( CLEAR ?auto_66349 ) ( IS-CRATE ?auto_66342 ) ( not ( = ?auto_66341 ?auto_66349 ) ) ( not ( = ?auto_66342 ?auto_66349 ) ) ( not ( = ?auto_66347 ?auto_66349 ) ) ( AVAILABLE ?auto_66344 ) ( TRUCK-AT ?auto_66346 ?auto_66348 ) ( not ( = ?auto_66348 ?auto_66350 ) ) ( not ( = ?auto_66345 ?auto_66348 ) ) ( HOIST-AT ?auto_66351 ?auto_66348 ) ( LIFTING ?auto_66351 ?auto_66342 ) ( not ( = ?auto_66344 ?auto_66351 ) ) ( not ( = ?auto_66343 ?auto_66351 ) ) )
    :subtasks
    ( ( !LOAD ?auto_66351 ?auto_66342 ?auto_66346 ?auto_66348 )
      ( MAKE-ON ?auto_66341 ?auto_66342 )
      ( MAKE-ON-VERIFY ?auto_66341 ?auto_66342 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_66352 - SURFACE
      ?auto_66353 - SURFACE
    )
    :vars
    (
      ?auto_66359 - HOIST
      ?auto_66356 - PLACE
      ?auto_66361 - PLACE
      ?auto_66357 - HOIST
      ?auto_66358 - SURFACE
      ?auto_66354 - SURFACE
      ?auto_66360 - TRUCK
      ?auto_66362 - PLACE
      ?auto_66355 - HOIST
      ?auto_66363 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_66359 ?auto_66356 ) ( IS-CRATE ?auto_66352 ) ( not ( = ?auto_66352 ?auto_66353 ) ) ( not ( = ?auto_66361 ?auto_66356 ) ) ( HOIST-AT ?auto_66357 ?auto_66361 ) ( not ( = ?auto_66359 ?auto_66357 ) ) ( AVAILABLE ?auto_66357 ) ( SURFACE-AT ?auto_66352 ?auto_66361 ) ( ON ?auto_66352 ?auto_66358 ) ( CLEAR ?auto_66352 ) ( not ( = ?auto_66352 ?auto_66358 ) ) ( not ( = ?auto_66353 ?auto_66358 ) ) ( SURFACE-AT ?auto_66354 ?auto_66356 ) ( CLEAR ?auto_66354 ) ( IS-CRATE ?auto_66353 ) ( not ( = ?auto_66352 ?auto_66354 ) ) ( not ( = ?auto_66353 ?auto_66354 ) ) ( not ( = ?auto_66358 ?auto_66354 ) ) ( AVAILABLE ?auto_66359 ) ( TRUCK-AT ?auto_66360 ?auto_66362 ) ( not ( = ?auto_66362 ?auto_66356 ) ) ( not ( = ?auto_66361 ?auto_66362 ) ) ( HOIST-AT ?auto_66355 ?auto_66362 ) ( not ( = ?auto_66359 ?auto_66355 ) ) ( not ( = ?auto_66357 ?auto_66355 ) ) ( AVAILABLE ?auto_66355 ) ( SURFACE-AT ?auto_66353 ?auto_66362 ) ( ON ?auto_66353 ?auto_66363 ) ( CLEAR ?auto_66353 ) ( not ( = ?auto_66352 ?auto_66363 ) ) ( not ( = ?auto_66353 ?auto_66363 ) ) ( not ( = ?auto_66358 ?auto_66363 ) ) ( not ( = ?auto_66354 ?auto_66363 ) ) )
    :subtasks
    ( ( !LIFT ?auto_66355 ?auto_66353 ?auto_66363 ?auto_66362 )
      ( MAKE-ON ?auto_66352 ?auto_66353 )
      ( MAKE-ON-VERIFY ?auto_66352 ?auto_66353 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_66364 - SURFACE
      ?auto_66365 - SURFACE
    )
    :vars
    (
      ?auto_66374 - HOIST
      ?auto_66370 - PLACE
      ?auto_66368 - PLACE
      ?auto_66375 - HOIST
      ?auto_66367 - SURFACE
      ?auto_66373 - SURFACE
      ?auto_66366 - PLACE
      ?auto_66369 - HOIST
      ?auto_66371 - SURFACE
      ?auto_66372 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_66374 ?auto_66370 ) ( IS-CRATE ?auto_66364 ) ( not ( = ?auto_66364 ?auto_66365 ) ) ( not ( = ?auto_66368 ?auto_66370 ) ) ( HOIST-AT ?auto_66375 ?auto_66368 ) ( not ( = ?auto_66374 ?auto_66375 ) ) ( AVAILABLE ?auto_66375 ) ( SURFACE-AT ?auto_66364 ?auto_66368 ) ( ON ?auto_66364 ?auto_66367 ) ( CLEAR ?auto_66364 ) ( not ( = ?auto_66364 ?auto_66367 ) ) ( not ( = ?auto_66365 ?auto_66367 ) ) ( SURFACE-AT ?auto_66373 ?auto_66370 ) ( CLEAR ?auto_66373 ) ( IS-CRATE ?auto_66365 ) ( not ( = ?auto_66364 ?auto_66373 ) ) ( not ( = ?auto_66365 ?auto_66373 ) ) ( not ( = ?auto_66367 ?auto_66373 ) ) ( AVAILABLE ?auto_66374 ) ( not ( = ?auto_66366 ?auto_66370 ) ) ( not ( = ?auto_66368 ?auto_66366 ) ) ( HOIST-AT ?auto_66369 ?auto_66366 ) ( not ( = ?auto_66374 ?auto_66369 ) ) ( not ( = ?auto_66375 ?auto_66369 ) ) ( AVAILABLE ?auto_66369 ) ( SURFACE-AT ?auto_66365 ?auto_66366 ) ( ON ?auto_66365 ?auto_66371 ) ( CLEAR ?auto_66365 ) ( not ( = ?auto_66364 ?auto_66371 ) ) ( not ( = ?auto_66365 ?auto_66371 ) ) ( not ( = ?auto_66367 ?auto_66371 ) ) ( not ( = ?auto_66373 ?auto_66371 ) ) ( TRUCK-AT ?auto_66372 ?auto_66370 ) )
    :subtasks
    ( ( !DRIVE ?auto_66372 ?auto_66370 ?auto_66366 )
      ( MAKE-ON ?auto_66364 ?auto_66365 )
      ( MAKE-ON-VERIFY ?auto_66364 ?auto_66365 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_66376 - SURFACE
      ?auto_66377 - SURFACE
    )
    :vars
    (
      ?auto_66387 - HOIST
      ?auto_66384 - PLACE
      ?auto_66379 - PLACE
      ?auto_66382 - HOIST
      ?auto_66381 - SURFACE
      ?auto_66380 - SURFACE
      ?auto_66383 - PLACE
      ?auto_66385 - HOIST
      ?auto_66378 - SURFACE
      ?auto_66386 - TRUCK
      ?auto_66388 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_66387 ?auto_66384 ) ( IS-CRATE ?auto_66376 ) ( not ( = ?auto_66376 ?auto_66377 ) ) ( not ( = ?auto_66379 ?auto_66384 ) ) ( HOIST-AT ?auto_66382 ?auto_66379 ) ( not ( = ?auto_66387 ?auto_66382 ) ) ( AVAILABLE ?auto_66382 ) ( SURFACE-AT ?auto_66376 ?auto_66379 ) ( ON ?auto_66376 ?auto_66381 ) ( CLEAR ?auto_66376 ) ( not ( = ?auto_66376 ?auto_66381 ) ) ( not ( = ?auto_66377 ?auto_66381 ) ) ( IS-CRATE ?auto_66377 ) ( not ( = ?auto_66376 ?auto_66380 ) ) ( not ( = ?auto_66377 ?auto_66380 ) ) ( not ( = ?auto_66381 ?auto_66380 ) ) ( not ( = ?auto_66383 ?auto_66384 ) ) ( not ( = ?auto_66379 ?auto_66383 ) ) ( HOIST-AT ?auto_66385 ?auto_66383 ) ( not ( = ?auto_66387 ?auto_66385 ) ) ( not ( = ?auto_66382 ?auto_66385 ) ) ( AVAILABLE ?auto_66385 ) ( SURFACE-AT ?auto_66377 ?auto_66383 ) ( ON ?auto_66377 ?auto_66378 ) ( CLEAR ?auto_66377 ) ( not ( = ?auto_66376 ?auto_66378 ) ) ( not ( = ?auto_66377 ?auto_66378 ) ) ( not ( = ?auto_66381 ?auto_66378 ) ) ( not ( = ?auto_66380 ?auto_66378 ) ) ( TRUCK-AT ?auto_66386 ?auto_66384 ) ( SURFACE-AT ?auto_66388 ?auto_66384 ) ( CLEAR ?auto_66388 ) ( LIFTING ?auto_66387 ?auto_66380 ) ( IS-CRATE ?auto_66380 ) ( not ( = ?auto_66376 ?auto_66388 ) ) ( not ( = ?auto_66377 ?auto_66388 ) ) ( not ( = ?auto_66381 ?auto_66388 ) ) ( not ( = ?auto_66380 ?auto_66388 ) ) ( not ( = ?auto_66378 ?auto_66388 ) ) )
    :subtasks
    ( ( !DROP ?auto_66387 ?auto_66380 ?auto_66388 ?auto_66384 )
      ( MAKE-ON ?auto_66376 ?auto_66377 )
      ( MAKE-ON-VERIFY ?auto_66376 ?auto_66377 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_66389 - SURFACE
      ?auto_66390 - SURFACE
    )
    :vars
    (
      ?auto_66394 - HOIST
      ?auto_66393 - PLACE
      ?auto_66401 - PLACE
      ?auto_66391 - HOIST
      ?auto_66400 - SURFACE
      ?auto_66398 - SURFACE
      ?auto_66399 - PLACE
      ?auto_66395 - HOIST
      ?auto_66396 - SURFACE
      ?auto_66397 - TRUCK
      ?auto_66392 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_66394 ?auto_66393 ) ( IS-CRATE ?auto_66389 ) ( not ( = ?auto_66389 ?auto_66390 ) ) ( not ( = ?auto_66401 ?auto_66393 ) ) ( HOIST-AT ?auto_66391 ?auto_66401 ) ( not ( = ?auto_66394 ?auto_66391 ) ) ( AVAILABLE ?auto_66391 ) ( SURFACE-AT ?auto_66389 ?auto_66401 ) ( ON ?auto_66389 ?auto_66400 ) ( CLEAR ?auto_66389 ) ( not ( = ?auto_66389 ?auto_66400 ) ) ( not ( = ?auto_66390 ?auto_66400 ) ) ( IS-CRATE ?auto_66390 ) ( not ( = ?auto_66389 ?auto_66398 ) ) ( not ( = ?auto_66390 ?auto_66398 ) ) ( not ( = ?auto_66400 ?auto_66398 ) ) ( not ( = ?auto_66399 ?auto_66393 ) ) ( not ( = ?auto_66401 ?auto_66399 ) ) ( HOIST-AT ?auto_66395 ?auto_66399 ) ( not ( = ?auto_66394 ?auto_66395 ) ) ( not ( = ?auto_66391 ?auto_66395 ) ) ( AVAILABLE ?auto_66395 ) ( SURFACE-AT ?auto_66390 ?auto_66399 ) ( ON ?auto_66390 ?auto_66396 ) ( CLEAR ?auto_66390 ) ( not ( = ?auto_66389 ?auto_66396 ) ) ( not ( = ?auto_66390 ?auto_66396 ) ) ( not ( = ?auto_66400 ?auto_66396 ) ) ( not ( = ?auto_66398 ?auto_66396 ) ) ( TRUCK-AT ?auto_66397 ?auto_66393 ) ( SURFACE-AT ?auto_66392 ?auto_66393 ) ( CLEAR ?auto_66392 ) ( IS-CRATE ?auto_66398 ) ( not ( = ?auto_66389 ?auto_66392 ) ) ( not ( = ?auto_66390 ?auto_66392 ) ) ( not ( = ?auto_66400 ?auto_66392 ) ) ( not ( = ?auto_66398 ?auto_66392 ) ) ( not ( = ?auto_66396 ?auto_66392 ) ) ( AVAILABLE ?auto_66394 ) ( IN ?auto_66398 ?auto_66397 ) )
    :subtasks
    ( ( !UNLOAD ?auto_66394 ?auto_66398 ?auto_66397 ?auto_66393 )
      ( MAKE-ON ?auto_66389 ?auto_66390 )
      ( MAKE-ON-VERIFY ?auto_66389 ?auto_66390 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_66402 - SURFACE
      ?auto_66403 - SURFACE
    )
    :vars
    (
      ?auto_66405 - HOIST
      ?auto_66408 - PLACE
      ?auto_66404 - PLACE
      ?auto_66409 - HOIST
      ?auto_66406 - SURFACE
      ?auto_66407 - SURFACE
      ?auto_66412 - PLACE
      ?auto_66414 - HOIST
      ?auto_66413 - SURFACE
      ?auto_66411 - SURFACE
      ?auto_66410 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_66405 ?auto_66408 ) ( IS-CRATE ?auto_66402 ) ( not ( = ?auto_66402 ?auto_66403 ) ) ( not ( = ?auto_66404 ?auto_66408 ) ) ( HOIST-AT ?auto_66409 ?auto_66404 ) ( not ( = ?auto_66405 ?auto_66409 ) ) ( AVAILABLE ?auto_66409 ) ( SURFACE-AT ?auto_66402 ?auto_66404 ) ( ON ?auto_66402 ?auto_66406 ) ( CLEAR ?auto_66402 ) ( not ( = ?auto_66402 ?auto_66406 ) ) ( not ( = ?auto_66403 ?auto_66406 ) ) ( IS-CRATE ?auto_66403 ) ( not ( = ?auto_66402 ?auto_66407 ) ) ( not ( = ?auto_66403 ?auto_66407 ) ) ( not ( = ?auto_66406 ?auto_66407 ) ) ( not ( = ?auto_66412 ?auto_66408 ) ) ( not ( = ?auto_66404 ?auto_66412 ) ) ( HOIST-AT ?auto_66414 ?auto_66412 ) ( not ( = ?auto_66405 ?auto_66414 ) ) ( not ( = ?auto_66409 ?auto_66414 ) ) ( AVAILABLE ?auto_66414 ) ( SURFACE-AT ?auto_66403 ?auto_66412 ) ( ON ?auto_66403 ?auto_66413 ) ( CLEAR ?auto_66403 ) ( not ( = ?auto_66402 ?auto_66413 ) ) ( not ( = ?auto_66403 ?auto_66413 ) ) ( not ( = ?auto_66406 ?auto_66413 ) ) ( not ( = ?auto_66407 ?auto_66413 ) ) ( SURFACE-AT ?auto_66411 ?auto_66408 ) ( CLEAR ?auto_66411 ) ( IS-CRATE ?auto_66407 ) ( not ( = ?auto_66402 ?auto_66411 ) ) ( not ( = ?auto_66403 ?auto_66411 ) ) ( not ( = ?auto_66406 ?auto_66411 ) ) ( not ( = ?auto_66407 ?auto_66411 ) ) ( not ( = ?auto_66413 ?auto_66411 ) ) ( AVAILABLE ?auto_66405 ) ( IN ?auto_66407 ?auto_66410 ) ( TRUCK-AT ?auto_66410 ?auto_66412 ) )
    :subtasks
    ( ( !DRIVE ?auto_66410 ?auto_66412 ?auto_66408 )
      ( MAKE-ON ?auto_66402 ?auto_66403 )
      ( MAKE-ON-VERIFY ?auto_66402 ?auto_66403 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_66415 - SURFACE
      ?auto_66416 - SURFACE
    )
    :vars
    (
      ?auto_66423 - HOIST
      ?auto_66424 - PLACE
      ?auto_66426 - PLACE
      ?auto_66418 - HOIST
      ?auto_66421 - SURFACE
      ?auto_66422 - SURFACE
      ?auto_66417 - PLACE
      ?auto_66427 - HOIST
      ?auto_66420 - SURFACE
      ?auto_66419 - SURFACE
      ?auto_66425 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_66423 ?auto_66424 ) ( IS-CRATE ?auto_66415 ) ( not ( = ?auto_66415 ?auto_66416 ) ) ( not ( = ?auto_66426 ?auto_66424 ) ) ( HOIST-AT ?auto_66418 ?auto_66426 ) ( not ( = ?auto_66423 ?auto_66418 ) ) ( AVAILABLE ?auto_66418 ) ( SURFACE-AT ?auto_66415 ?auto_66426 ) ( ON ?auto_66415 ?auto_66421 ) ( CLEAR ?auto_66415 ) ( not ( = ?auto_66415 ?auto_66421 ) ) ( not ( = ?auto_66416 ?auto_66421 ) ) ( IS-CRATE ?auto_66416 ) ( not ( = ?auto_66415 ?auto_66422 ) ) ( not ( = ?auto_66416 ?auto_66422 ) ) ( not ( = ?auto_66421 ?auto_66422 ) ) ( not ( = ?auto_66417 ?auto_66424 ) ) ( not ( = ?auto_66426 ?auto_66417 ) ) ( HOIST-AT ?auto_66427 ?auto_66417 ) ( not ( = ?auto_66423 ?auto_66427 ) ) ( not ( = ?auto_66418 ?auto_66427 ) ) ( SURFACE-AT ?auto_66416 ?auto_66417 ) ( ON ?auto_66416 ?auto_66420 ) ( CLEAR ?auto_66416 ) ( not ( = ?auto_66415 ?auto_66420 ) ) ( not ( = ?auto_66416 ?auto_66420 ) ) ( not ( = ?auto_66421 ?auto_66420 ) ) ( not ( = ?auto_66422 ?auto_66420 ) ) ( SURFACE-AT ?auto_66419 ?auto_66424 ) ( CLEAR ?auto_66419 ) ( IS-CRATE ?auto_66422 ) ( not ( = ?auto_66415 ?auto_66419 ) ) ( not ( = ?auto_66416 ?auto_66419 ) ) ( not ( = ?auto_66421 ?auto_66419 ) ) ( not ( = ?auto_66422 ?auto_66419 ) ) ( not ( = ?auto_66420 ?auto_66419 ) ) ( AVAILABLE ?auto_66423 ) ( TRUCK-AT ?auto_66425 ?auto_66417 ) ( LIFTING ?auto_66427 ?auto_66422 ) )
    :subtasks
    ( ( !LOAD ?auto_66427 ?auto_66422 ?auto_66425 ?auto_66417 )
      ( MAKE-ON ?auto_66415 ?auto_66416 )
      ( MAKE-ON-VERIFY ?auto_66415 ?auto_66416 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_66428 - SURFACE
      ?auto_66429 - SURFACE
    )
    :vars
    (
      ?auto_66433 - HOIST
      ?auto_66437 - PLACE
      ?auto_66440 - PLACE
      ?auto_66430 - HOIST
      ?auto_66435 - SURFACE
      ?auto_66432 - SURFACE
      ?auto_66438 - PLACE
      ?auto_66436 - HOIST
      ?auto_66439 - SURFACE
      ?auto_66431 - SURFACE
      ?auto_66434 - TRUCK
      ?auto_66441 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_66433 ?auto_66437 ) ( IS-CRATE ?auto_66428 ) ( not ( = ?auto_66428 ?auto_66429 ) ) ( not ( = ?auto_66440 ?auto_66437 ) ) ( HOIST-AT ?auto_66430 ?auto_66440 ) ( not ( = ?auto_66433 ?auto_66430 ) ) ( AVAILABLE ?auto_66430 ) ( SURFACE-AT ?auto_66428 ?auto_66440 ) ( ON ?auto_66428 ?auto_66435 ) ( CLEAR ?auto_66428 ) ( not ( = ?auto_66428 ?auto_66435 ) ) ( not ( = ?auto_66429 ?auto_66435 ) ) ( IS-CRATE ?auto_66429 ) ( not ( = ?auto_66428 ?auto_66432 ) ) ( not ( = ?auto_66429 ?auto_66432 ) ) ( not ( = ?auto_66435 ?auto_66432 ) ) ( not ( = ?auto_66438 ?auto_66437 ) ) ( not ( = ?auto_66440 ?auto_66438 ) ) ( HOIST-AT ?auto_66436 ?auto_66438 ) ( not ( = ?auto_66433 ?auto_66436 ) ) ( not ( = ?auto_66430 ?auto_66436 ) ) ( SURFACE-AT ?auto_66429 ?auto_66438 ) ( ON ?auto_66429 ?auto_66439 ) ( CLEAR ?auto_66429 ) ( not ( = ?auto_66428 ?auto_66439 ) ) ( not ( = ?auto_66429 ?auto_66439 ) ) ( not ( = ?auto_66435 ?auto_66439 ) ) ( not ( = ?auto_66432 ?auto_66439 ) ) ( SURFACE-AT ?auto_66431 ?auto_66437 ) ( CLEAR ?auto_66431 ) ( IS-CRATE ?auto_66432 ) ( not ( = ?auto_66428 ?auto_66431 ) ) ( not ( = ?auto_66429 ?auto_66431 ) ) ( not ( = ?auto_66435 ?auto_66431 ) ) ( not ( = ?auto_66432 ?auto_66431 ) ) ( not ( = ?auto_66439 ?auto_66431 ) ) ( AVAILABLE ?auto_66433 ) ( TRUCK-AT ?auto_66434 ?auto_66438 ) ( AVAILABLE ?auto_66436 ) ( SURFACE-AT ?auto_66432 ?auto_66438 ) ( ON ?auto_66432 ?auto_66441 ) ( CLEAR ?auto_66432 ) ( not ( = ?auto_66428 ?auto_66441 ) ) ( not ( = ?auto_66429 ?auto_66441 ) ) ( not ( = ?auto_66435 ?auto_66441 ) ) ( not ( = ?auto_66432 ?auto_66441 ) ) ( not ( = ?auto_66439 ?auto_66441 ) ) ( not ( = ?auto_66431 ?auto_66441 ) ) )
    :subtasks
    ( ( !LIFT ?auto_66436 ?auto_66432 ?auto_66441 ?auto_66438 )
      ( MAKE-ON ?auto_66428 ?auto_66429 )
      ( MAKE-ON-VERIFY ?auto_66428 ?auto_66429 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_66442 - SURFACE
      ?auto_66443 - SURFACE
    )
    :vars
    (
      ?auto_66447 - HOIST
      ?auto_66445 - PLACE
      ?auto_66455 - PLACE
      ?auto_66451 - HOIST
      ?auto_66452 - SURFACE
      ?auto_66450 - SURFACE
      ?auto_66449 - PLACE
      ?auto_66444 - HOIST
      ?auto_66448 - SURFACE
      ?auto_66446 - SURFACE
      ?auto_66453 - SURFACE
      ?auto_66454 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_66447 ?auto_66445 ) ( IS-CRATE ?auto_66442 ) ( not ( = ?auto_66442 ?auto_66443 ) ) ( not ( = ?auto_66455 ?auto_66445 ) ) ( HOIST-AT ?auto_66451 ?auto_66455 ) ( not ( = ?auto_66447 ?auto_66451 ) ) ( AVAILABLE ?auto_66451 ) ( SURFACE-AT ?auto_66442 ?auto_66455 ) ( ON ?auto_66442 ?auto_66452 ) ( CLEAR ?auto_66442 ) ( not ( = ?auto_66442 ?auto_66452 ) ) ( not ( = ?auto_66443 ?auto_66452 ) ) ( IS-CRATE ?auto_66443 ) ( not ( = ?auto_66442 ?auto_66450 ) ) ( not ( = ?auto_66443 ?auto_66450 ) ) ( not ( = ?auto_66452 ?auto_66450 ) ) ( not ( = ?auto_66449 ?auto_66445 ) ) ( not ( = ?auto_66455 ?auto_66449 ) ) ( HOIST-AT ?auto_66444 ?auto_66449 ) ( not ( = ?auto_66447 ?auto_66444 ) ) ( not ( = ?auto_66451 ?auto_66444 ) ) ( SURFACE-AT ?auto_66443 ?auto_66449 ) ( ON ?auto_66443 ?auto_66448 ) ( CLEAR ?auto_66443 ) ( not ( = ?auto_66442 ?auto_66448 ) ) ( not ( = ?auto_66443 ?auto_66448 ) ) ( not ( = ?auto_66452 ?auto_66448 ) ) ( not ( = ?auto_66450 ?auto_66448 ) ) ( SURFACE-AT ?auto_66446 ?auto_66445 ) ( CLEAR ?auto_66446 ) ( IS-CRATE ?auto_66450 ) ( not ( = ?auto_66442 ?auto_66446 ) ) ( not ( = ?auto_66443 ?auto_66446 ) ) ( not ( = ?auto_66452 ?auto_66446 ) ) ( not ( = ?auto_66450 ?auto_66446 ) ) ( not ( = ?auto_66448 ?auto_66446 ) ) ( AVAILABLE ?auto_66447 ) ( AVAILABLE ?auto_66444 ) ( SURFACE-AT ?auto_66450 ?auto_66449 ) ( ON ?auto_66450 ?auto_66453 ) ( CLEAR ?auto_66450 ) ( not ( = ?auto_66442 ?auto_66453 ) ) ( not ( = ?auto_66443 ?auto_66453 ) ) ( not ( = ?auto_66452 ?auto_66453 ) ) ( not ( = ?auto_66450 ?auto_66453 ) ) ( not ( = ?auto_66448 ?auto_66453 ) ) ( not ( = ?auto_66446 ?auto_66453 ) ) ( TRUCK-AT ?auto_66454 ?auto_66445 ) )
    :subtasks
    ( ( !DRIVE ?auto_66454 ?auto_66445 ?auto_66449 )
      ( MAKE-ON ?auto_66442 ?auto_66443 )
      ( MAKE-ON-VERIFY ?auto_66442 ?auto_66443 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_66456 - SURFACE
      ?auto_66457 - SURFACE
    )
    :vars
    (
      ?auto_66460 - HOIST
      ?auto_66459 - PLACE
      ?auto_66458 - PLACE
      ?auto_66464 - HOIST
      ?auto_66465 - SURFACE
      ?auto_66468 - SURFACE
      ?auto_66469 - PLACE
      ?auto_66466 - HOIST
      ?auto_66461 - SURFACE
      ?auto_66467 - SURFACE
      ?auto_66462 - SURFACE
      ?auto_66463 - TRUCK
      ?auto_66470 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_66460 ?auto_66459 ) ( IS-CRATE ?auto_66456 ) ( not ( = ?auto_66456 ?auto_66457 ) ) ( not ( = ?auto_66458 ?auto_66459 ) ) ( HOIST-AT ?auto_66464 ?auto_66458 ) ( not ( = ?auto_66460 ?auto_66464 ) ) ( AVAILABLE ?auto_66464 ) ( SURFACE-AT ?auto_66456 ?auto_66458 ) ( ON ?auto_66456 ?auto_66465 ) ( CLEAR ?auto_66456 ) ( not ( = ?auto_66456 ?auto_66465 ) ) ( not ( = ?auto_66457 ?auto_66465 ) ) ( IS-CRATE ?auto_66457 ) ( not ( = ?auto_66456 ?auto_66468 ) ) ( not ( = ?auto_66457 ?auto_66468 ) ) ( not ( = ?auto_66465 ?auto_66468 ) ) ( not ( = ?auto_66469 ?auto_66459 ) ) ( not ( = ?auto_66458 ?auto_66469 ) ) ( HOIST-AT ?auto_66466 ?auto_66469 ) ( not ( = ?auto_66460 ?auto_66466 ) ) ( not ( = ?auto_66464 ?auto_66466 ) ) ( SURFACE-AT ?auto_66457 ?auto_66469 ) ( ON ?auto_66457 ?auto_66461 ) ( CLEAR ?auto_66457 ) ( not ( = ?auto_66456 ?auto_66461 ) ) ( not ( = ?auto_66457 ?auto_66461 ) ) ( not ( = ?auto_66465 ?auto_66461 ) ) ( not ( = ?auto_66468 ?auto_66461 ) ) ( IS-CRATE ?auto_66468 ) ( not ( = ?auto_66456 ?auto_66467 ) ) ( not ( = ?auto_66457 ?auto_66467 ) ) ( not ( = ?auto_66465 ?auto_66467 ) ) ( not ( = ?auto_66468 ?auto_66467 ) ) ( not ( = ?auto_66461 ?auto_66467 ) ) ( AVAILABLE ?auto_66466 ) ( SURFACE-AT ?auto_66468 ?auto_66469 ) ( ON ?auto_66468 ?auto_66462 ) ( CLEAR ?auto_66468 ) ( not ( = ?auto_66456 ?auto_66462 ) ) ( not ( = ?auto_66457 ?auto_66462 ) ) ( not ( = ?auto_66465 ?auto_66462 ) ) ( not ( = ?auto_66468 ?auto_66462 ) ) ( not ( = ?auto_66461 ?auto_66462 ) ) ( not ( = ?auto_66467 ?auto_66462 ) ) ( TRUCK-AT ?auto_66463 ?auto_66459 ) ( SURFACE-AT ?auto_66470 ?auto_66459 ) ( CLEAR ?auto_66470 ) ( LIFTING ?auto_66460 ?auto_66467 ) ( IS-CRATE ?auto_66467 ) ( not ( = ?auto_66456 ?auto_66470 ) ) ( not ( = ?auto_66457 ?auto_66470 ) ) ( not ( = ?auto_66465 ?auto_66470 ) ) ( not ( = ?auto_66468 ?auto_66470 ) ) ( not ( = ?auto_66461 ?auto_66470 ) ) ( not ( = ?auto_66467 ?auto_66470 ) ) ( not ( = ?auto_66462 ?auto_66470 ) ) )
    :subtasks
    ( ( !DROP ?auto_66460 ?auto_66467 ?auto_66470 ?auto_66459 )
      ( MAKE-ON ?auto_66456 ?auto_66457 )
      ( MAKE-ON-VERIFY ?auto_66456 ?auto_66457 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_66471 - SURFACE
      ?auto_66472 - SURFACE
    )
    :vars
    (
      ?auto_66480 - HOIST
      ?auto_66473 - PLACE
      ?auto_66479 - PLACE
      ?auto_66482 - HOIST
      ?auto_66483 - SURFACE
      ?auto_66485 - SURFACE
      ?auto_66478 - PLACE
      ?auto_66484 - HOIST
      ?auto_66474 - SURFACE
      ?auto_66481 - SURFACE
      ?auto_66476 - SURFACE
      ?auto_66475 - TRUCK
      ?auto_66477 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_66480 ?auto_66473 ) ( IS-CRATE ?auto_66471 ) ( not ( = ?auto_66471 ?auto_66472 ) ) ( not ( = ?auto_66479 ?auto_66473 ) ) ( HOIST-AT ?auto_66482 ?auto_66479 ) ( not ( = ?auto_66480 ?auto_66482 ) ) ( AVAILABLE ?auto_66482 ) ( SURFACE-AT ?auto_66471 ?auto_66479 ) ( ON ?auto_66471 ?auto_66483 ) ( CLEAR ?auto_66471 ) ( not ( = ?auto_66471 ?auto_66483 ) ) ( not ( = ?auto_66472 ?auto_66483 ) ) ( IS-CRATE ?auto_66472 ) ( not ( = ?auto_66471 ?auto_66485 ) ) ( not ( = ?auto_66472 ?auto_66485 ) ) ( not ( = ?auto_66483 ?auto_66485 ) ) ( not ( = ?auto_66478 ?auto_66473 ) ) ( not ( = ?auto_66479 ?auto_66478 ) ) ( HOIST-AT ?auto_66484 ?auto_66478 ) ( not ( = ?auto_66480 ?auto_66484 ) ) ( not ( = ?auto_66482 ?auto_66484 ) ) ( SURFACE-AT ?auto_66472 ?auto_66478 ) ( ON ?auto_66472 ?auto_66474 ) ( CLEAR ?auto_66472 ) ( not ( = ?auto_66471 ?auto_66474 ) ) ( not ( = ?auto_66472 ?auto_66474 ) ) ( not ( = ?auto_66483 ?auto_66474 ) ) ( not ( = ?auto_66485 ?auto_66474 ) ) ( IS-CRATE ?auto_66485 ) ( not ( = ?auto_66471 ?auto_66481 ) ) ( not ( = ?auto_66472 ?auto_66481 ) ) ( not ( = ?auto_66483 ?auto_66481 ) ) ( not ( = ?auto_66485 ?auto_66481 ) ) ( not ( = ?auto_66474 ?auto_66481 ) ) ( AVAILABLE ?auto_66484 ) ( SURFACE-AT ?auto_66485 ?auto_66478 ) ( ON ?auto_66485 ?auto_66476 ) ( CLEAR ?auto_66485 ) ( not ( = ?auto_66471 ?auto_66476 ) ) ( not ( = ?auto_66472 ?auto_66476 ) ) ( not ( = ?auto_66483 ?auto_66476 ) ) ( not ( = ?auto_66485 ?auto_66476 ) ) ( not ( = ?auto_66474 ?auto_66476 ) ) ( not ( = ?auto_66481 ?auto_66476 ) ) ( TRUCK-AT ?auto_66475 ?auto_66473 ) ( SURFACE-AT ?auto_66477 ?auto_66473 ) ( CLEAR ?auto_66477 ) ( IS-CRATE ?auto_66481 ) ( not ( = ?auto_66471 ?auto_66477 ) ) ( not ( = ?auto_66472 ?auto_66477 ) ) ( not ( = ?auto_66483 ?auto_66477 ) ) ( not ( = ?auto_66485 ?auto_66477 ) ) ( not ( = ?auto_66474 ?auto_66477 ) ) ( not ( = ?auto_66481 ?auto_66477 ) ) ( not ( = ?auto_66476 ?auto_66477 ) ) ( AVAILABLE ?auto_66480 ) ( IN ?auto_66481 ?auto_66475 ) )
    :subtasks
    ( ( !UNLOAD ?auto_66480 ?auto_66481 ?auto_66475 ?auto_66473 )
      ( MAKE-ON ?auto_66471 ?auto_66472 )
      ( MAKE-ON-VERIFY ?auto_66471 ?auto_66472 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_66486 - SURFACE
      ?auto_66487 - SURFACE
    )
    :vars
    (
      ?auto_66495 - HOIST
      ?auto_66488 - PLACE
      ?auto_66498 - PLACE
      ?auto_66494 - HOIST
      ?auto_66489 - SURFACE
      ?auto_66497 - SURFACE
      ?auto_66493 - PLACE
      ?auto_66496 - HOIST
      ?auto_66491 - SURFACE
      ?auto_66499 - SURFACE
      ?auto_66500 - SURFACE
      ?auto_66490 - SURFACE
      ?auto_66492 - TRUCK
      ?auto_66501 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_66495 ?auto_66488 ) ( IS-CRATE ?auto_66486 ) ( not ( = ?auto_66486 ?auto_66487 ) ) ( not ( = ?auto_66498 ?auto_66488 ) ) ( HOIST-AT ?auto_66494 ?auto_66498 ) ( not ( = ?auto_66495 ?auto_66494 ) ) ( AVAILABLE ?auto_66494 ) ( SURFACE-AT ?auto_66486 ?auto_66498 ) ( ON ?auto_66486 ?auto_66489 ) ( CLEAR ?auto_66486 ) ( not ( = ?auto_66486 ?auto_66489 ) ) ( not ( = ?auto_66487 ?auto_66489 ) ) ( IS-CRATE ?auto_66487 ) ( not ( = ?auto_66486 ?auto_66497 ) ) ( not ( = ?auto_66487 ?auto_66497 ) ) ( not ( = ?auto_66489 ?auto_66497 ) ) ( not ( = ?auto_66493 ?auto_66488 ) ) ( not ( = ?auto_66498 ?auto_66493 ) ) ( HOIST-AT ?auto_66496 ?auto_66493 ) ( not ( = ?auto_66495 ?auto_66496 ) ) ( not ( = ?auto_66494 ?auto_66496 ) ) ( SURFACE-AT ?auto_66487 ?auto_66493 ) ( ON ?auto_66487 ?auto_66491 ) ( CLEAR ?auto_66487 ) ( not ( = ?auto_66486 ?auto_66491 ) ) ( not ( = ?auto_66487 ?auto_66491 ) ) ( not ( = ?auto_66489 ?auto_66491 ) ) ( not ( = ?auto_66497 ?auto_66491 ) ) ( IS-CRATE ?auto_66497 ) ( not ( = ?auto_66486 ?auto_66499 ) ) ( not ( = ?auto_66487 ?auto_66499 ) ) ( not ( = ?auto_66489 ?auto_66499 ) ) ( not ( = ?auto_66497 ?auto_66499 ) ) ( not ( = ?auto_66491 ?auto_66499 ) ) ( AVAILABLE ?auto_66496 ) ( SURFACE-AT ?auto_66497 ?auto_66493 ) ( ON ?auto_66497 ?auto_66500 ) ( CLEAR ?auto_66497 ) ( not ( = ?auto_66486 ?auto_66500 ) ) ( not ( = ?auto_66487 ?auto_66500 ) ) ( not ( = ?auto_66489 ?auto_66500 ) ) ( not ( = ?auto_66497 ?auto_66500 ) ) ( not ( = ?auto_66491 ?auto_66500 ) ) ( not ( = ?auto_66499 ?auto_66500 ) ) ( SURFACE-AT ?auto_66490 ?auto_66488 ) ( CLEAR ?auto_66490 ) ( IS-CRATE ?auto_66499 ) ( not ( = ?auto_66486 ?auto_66490 ) ) ( not ( = ?auto_66487 ?auto_66490 ) ) ( not ( = ?auto_66489 ?auto_66490 ) ) ( not ( = ?auto_66497 ?auto_66490 ) ) ( not ( = ?auto_66491 ?auto_66490 ) ) ( not ( = ?auto_66499 ?auto_66490 ) ) ( not ( = ?auto_66500 ?auto_66490 ) ) ( AVAILABLE ?auto_66495 ) ( IN ?auto_66499 ?auto_66492 ) ( TRUCK-AT ?auto_66492 ?auto_66501 ) ( not ( = ?auto_66501 ?auto_66488 ) ) ( not ( = ?auto_66498 ?auto_66501 ) ) ( not ( = ?auto_66493 ?auto_66501 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_66492 ?auto_66501 ?auto_66488 )
      ( MAKE-ON ?auto_66486 ?auto_66487 )
      ( MAKE-ON-VERIFY ?auto_66486 ?auto_66487 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_66502 - SURFACE
      ?auto_66503 - SURFACE
    )
    :vars
    (
      ?auto_66506 - HOIST
      ?auto_66514 - PLACE
      ?auto_66509 - PLACE
      ?auto_66516 - HOIST
      ?auto_66517 - SURFACE
      ?auto_66504 - SURFACE
      ?auto_66507 - PLACE
      ?auto_66511 - HOIST
      ?auto_66510 - SURFACE
      ?auto_66512 - SURFACE
      ?auto_66505 - SURFACE
      ?auto_66508 - SURFACE
      ?auto_66513 - TRUCK
      ?auto_66515 - PLACE
      ?auto_66518 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_66506 ?auto_66514 ) ( IS-CRATE ?auto_66502 ) ( not ( = ?auto_66502 ?auto_66503 ) ) ( not ( = ?auto_66509 ?auto_66514 ) ) ( HOIST-AT ?auto_66516 ?auto_66509 ) ( not ( = ?auto_66506 ?auto_66516 ) ) ( AVAILABLE ?auto_66516 ) ( SURFACE-AT ?auto_66502 ?auto_66509 ) ( ON ?auto_66502 ?auto_66517 ) ( CLEAR ?auto_66502 ) ( not ( = ?auto_66502 ?auto_66517 ) ) ( not ( = ?auto_66503 ?auto_66517 ) ) ( IS-CRATE ?auto_66503 ) ( not ( = ?auto_66502 ?auto_66504 ) ) ( not ( = ?auto_66503 ?auto_66504 ) ) ( not ( = ?auto_66517 ?auto_66504 ) ) ( not ( = ?auto_66507 ?auto_66514 ) ) ( not ( = ?auto_66509 ?auto_66507 ) ) ( HOIST-AT ?auto_66511 ?auto_66507 ) ( not ( = ?auto_66506 ?auto_66511 ) ) ( not ( = ?auto_66516 ?auto_66511 ) ) ( SURFACE-AT ?auto_66503 ?auto_66507 ) ( ON ?auto_66503 ?auto_66510 ) ( CLEAR ?auto_66503 ) ( not ( = ?auto_66502 ?auto_66510 ) ) ( not ( = ?auto_66503 ?auto_66510 ) ) ( not ( = ?auto_66517 ?auto_66510 ) ) ( not ( = ?auto_66504 ?auto_66510 ) ) ( IS-CRATE ?auto_66504 ) ( not ( = ?auto_66502 ?auto_66512 ) ) ( not ( = ?auto_66503 ?auto_66512 ) ) ( not ( = ?auto_66517 ?auto_66512 ) ) ( not ( = ?auto_66504 ?auto_66512 ) ) ( not ( = ?auto_66510 ?auto_66512 ) ) ( AVAILABLE ?auto_66511 ) ( SURFACE-AT ?auto_66504 ?auto_66507 ) ( ON ?auto_66504 ?auto_66505 ) ( CLEAR ?auto_66504 ) ( not ( = ?auto_66502 ?auto_66505 ) ) ( not ( = ?auto_66503 ?auto_66505 ) ) ( not ( = ?auto_66517 ?auto_66505 ) ) ( not ( = ?auto_66504 ?auto_66505 ) ) ( not ( = ?auto_66510 ?auto_66505 ) ) ( not ( = ?auto_66512 ?auto_66505 ) ) ( SURFACE-AT ?auto_66508 ?auto_66514 ) ( CLEAR ?auto_66508 ) ( IS-CRATE ?auto_66512 ) ( not ( = ?auto_66502 ?auto_66508 ) ) ( not ( = ?auto_66503 ?auto_66508 ) ) ( not ( = ?auto_66517 ?auto_66508 ) ) ( not ( = ?auto_66504 ?auto_66508 ) ) ( not ( = ?auto_66510 ?auto_66508 ) ) ( not ( = ?auto_66512 ?auto_66508 ) ) ( not ( = ?auto_66505 ?auto_66508 ) ) ( AVAILABLE ?auto_66506 ) ( TRUCK-AT ?auto_66513 ?auto_66515 ) ( not ( = ?auto_66515 ?auto_66514 ) ) ( not ( = ?auto_66509 ?auto_66515 ) ) ( not ( = ?auto_66507 ?auto_66515 ) ) ( HOIST-AT ?auto_66518 ?auto_66515 ) ( LIFTING ?auto_66518 ?auto_66512 ) ( not ( = ?auto_66506 ?auto_66518 ) ) ( not ( = ?auto_66516 ?auto_66518 ) ) ( not ( = ?auto_66511 ?auto_66518 ) ) )
    :subtasks
    ( ( !LOAD ?auto_66518 ?auto_66512 ?auto_66513 ?auto_66515 )
      ( MAKE-ON ?auto_66502 ?auto_66503 )
      ( MAKE-ON-VERIFY ?auto_66502 ?auto_66503 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_66519 - SURFACE
      ?auto_66520 - SURFACE
    )
    :vars
    (
      ?auto_66533 - HOIST
      ?auto_66531 - PLACE
      ?auto_66525 - PLACE
      ?auto_66529 - HOIST
      ?auto_66534 - SURFACE
      ?auto_66527 - SURFACE
      ?auto_66526 - PLACE
      ?auto_66532 - HOIST
      ?auto_66530 - SURFACE
      ?auto_66535 - SURFACE
      ?auto_66528 - SURFACE
      ?auto_66521 - SURFACE
      ?auto_66522 - TRUCK
      ?auto_66523 - PLACE
      ?auto_66524 - HOIST
      ?auto_66536 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_66533 ?auto_66531 ) ( IS-CRATE ?auto_66519 ) ( not ( = ?auto_66519 ?auto_66520 ) ) ( not ( = ?auto_66525 ?auto_66531 ) ) ( HOIST-AT ?auto_66529 ?auto_66525 ) ( not ( = ?auto_66533 ?auto_66529 ) ) ( AVAILABLE ?auto_66529 ) ( SURFACE-AT ?auto_66519 ?auto_66525 ) ( ON ?auto_66519 ?auto_66534 ) ( CLEAR ?auto_66519 ) ( not ( = ?auto_66519 ?auto_66534 ) ) ( not ( = ?auto_66520 ?auto_66534 ) ) ( IS-CRATE ?auto_66520 ) ( not ( = ?auto_66519 ?auto_66527 ) ) ( not ( = ?auto_66520 ?auto_66527 ) ) ( not ( = ?auto_66534 ?auto_66527 ) ) ( not ( = ?auto_66526 ?auto_66531 ) ) ( not ( = ?auto_66525 ?auto_66526 ) ) ( HOIST-AT ?auto_66532 ?auto_66526 ) ( not ( = ?auto_66533 ?auto_66532 ) ) ( not ( = ?auto_66529 ?auto_66532 ) ) ( SURFACE-AT ?auto_66520 ?auto_66526 ) ( ON ?auto_66520 ?auto_66530 ) ( CLEAR ?auto_66520 ) ( not ( = ?auto_66519 ?auto_66530 ) ) ( not ( = ?auto_66520 ?auto_66530 ) ) ( not ( = ?auto_66534 ?auto_66530 ) ) ( not ( = ?auto_66527 ?auto_66530 ) ) ( IS-CRATE ?auto_66527 ) ( not ( = ?auto_66519 ?auto_66535 ) ) ( not ( = ?auto_66520 ?auto_66535 ) ) ( not ( = ?auto_66534 ?auto_66535 ) ) ( not ( = ?auto_66527 ?auto_66535 ) ) ( not ( = ?auto_66530 ?auto_66535 ) ) ( AVAILABLE ?auto_66532 ) ( SURFACE-AT ?auto_66527 ?auto_66526 ) ( ON ?auto_66527 ?auto_66528 ) ( CLEAR ?auto_66527 ) ( not ( = ?auto_66519 ?auto_66528 ) ) ( not ( = ?auto_66520 ?auto_66528 ) ) ( not ( = ?auto_66534 ?auto_66528 ) ) ( not ( = ?auto_66527 ?auto_66528 ) ) ( not ( = ?auto_66530 ?auto_66528 ) ) ( not ( = ?auto_66535 ?auto_66528 ) ) ( SURFACE-AT ?auto_66521 ?auto_66531 ) ( CLEAR ?auto_66521 ) ( IS-CRATE ?auto_66535 ) ( not ( = ?auto_66519 ?auto_66521 ) ) ( not ( = ?auto_66520 ?auto_66521 ) ) ( not ( = ?auto_66534 ?auto_66521 ) ) ( not ( = ?auto_66527 ?auto_66521 ) ) ( not ( = ?auto_66530 ?auto_66521 ) ) ( not ( = ?auto_66535 ?auto_66521 ) ) ( not ( = ?auto_66528 ?auto_66521 ) ) ( AVAILABLE ?auto_66533 ) ( TRUCK-AT ?auto_66522 ?auto_66523 ) ( not ( = ?auto_66523 ?auto_66531 ) ) ( not ( = ?auto_66525 ?auto_66523 ) ) ( not ( = ?auto_66526 ?auto_66523 ) ) ( HOIST-AT ?auto_66524 ?auto_66523 ) ( not ( = ?auto_66533 ?auto_66524 ) ) ( not ( = ?auto_66529 ?auto_66524 ) ) ( not ( = ?auto_66532 ?auto_66524 ) ) ( AVAILABLE ?auto_66524 ) ( SURFACE-AT ?auto_66535 ?auto_66523 ) ( ON ?auto_66535 ?auto_66536 ) ( CLEAR ?auto_66535 ) ( not ( = ?auto_66519 ?auto_66536 ) ) ( not ( = ?auto_66520 ?auto_66536 ) ) ( not ( = ?auto_66534 ?auto_66536 ) ) ( not ( = ?auto_66527 ?auto_66536 ) ) ( not ( = ?auto_66530 ?auto_66536 ) ) ( not ( = ?auto_66535 ?auto_66536 ) ) ( not ( = ?auto_66528 ?auto_66536 ) ) ( not ( = ?auto_66521 ?auto_66536 ) ) )
    :subtasks
    ( ( !LIFT ?auto_66524 ?auto_66535 ?auto_66536 ?auto_66523 )
      ( MAKE-ON ?auto_66519 ?auto_66520 )
      ( MAKE-ON-VERIFY ?auto_66519 ?auto_66520 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_66537 - SURFACE
      ?auto_66538 - SURFACE
    )
    :vars
    (
      ?auto_66549 - HOIST
      ?auto_66551 - PLACE
      ?auto_66554 - PLACE
      ?auto_66553 - HOIST
      ?auto_66550 - SURFACE
      ?auto_66540 - SURFACE
      ?auto_66545 - PLACE
      ?auto_66548 - HOIST
      ?auto_66552 - SURFACE
      ?auto_66541 - SURFACE
      ?auto_66544 - SURFACE
      ?auto_66543 - SURFACE
      ?auto_66546 - PLACE
      ?auto_66539 - HOIST
      ?auto_66542 - SURFACE
      ?auto_66547 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_66549 ?auto_66551 ) ( IS-CRATE ?auto_66537 ) ( not ( = ?auto_66537 ?auto_66538 ) ) ( not ( = ?auto_66554 ?auto_66551 ) ) ( HOIST-AT ?auto_66553 ?auto_66554 ) ( not ( = ?auto_66549 ?auto_66553 ) ) ( AVAILABLE ?auto_66553 ) ( SURFACE-AT ?auto_66537 ?auto_66554 ) ( ON ?auto_66537 ?auto_66550 ) ( CLEAR ?auto_66537 ) ( not ( = ?auto_66537 ?auto_66550 ) ) ( not ( = ?auto_66538 ?auto_66550 ) ) ( IS-CRATE ?auto_66538 ) ( not ( = ?auto_66537 ?auto_66540 ) ) ( not ( = ?auto_66538 ?auto_66540 ) ) ( not ( = ?auto_66550 ?auto_66540 ) ) ( not ( = ?auto_66545 ?auto_66551 ) ) ( not ( = ?auto_66554 ?auto_66545 ) ) ( HOIST-AT ?auto_66548 ?auto_66545 ) ( not ( = ?auto_66549 ?auto_66548 ) ) ( not ( = ?auto_66553 ?auto_66548 ) ) ( SURFACE-AT ?auto_66538 ?auto_66545 ) ( ON ?auto_66538 ?auto_66552 ) ( CLEAR ?auto_66538 ) ( not ( = ?auto_66537 ?auto_66552 ) ) ( not ( = ?auto_66538 ?auto_66552 ) ) ( not ( = ?auto_66550 ?auto_66552 ) ) ( not ( = ?auto_66540 ?auto_66552 ) ) ( IS-CRATE ?auto_66540 ) ( not ( = ?auto_66537 ?auto_66541 ) ) ( not ( = ?auto_66538 ?auto_66541 ) ) ( not ( = ?auto_66550 ?auto_66541 ) ) ( not ( = ?auto_66540 ?auto_66541 ) ) ( not ( = ?auto_66552 ?auto_66541 ) ) ( AVAILABLE ?auto_66548 ) ( SURFACE-AT ?auto_66540 ?auto_66545 ) ( ON ?auto_66540 ?auto_66544 ) ( CLEAR ?auto_66540 ) ( not ( = ?auto_66537 ?auto_66544 ) ) ( not ( = ?auto_66538 ?auto_66544 ) ) ( not ( = ?auto_66550 ?auto_66544 ) ) ( not ( = ?auto_66540 ?auto_66544 ) ) ( not ( = ?auto_66552 ?auto_66544 ) ) ( not ( = ?auto_66541 ?auto_66544 ) ) ( SURFACE-AT ?auto_66543 ?auto_66551 ) ( CLEAR ?auto_66543 ) ( IS-CRATE ?auto_66541 ) ( not ( = ?auto_66537 ?auto_66543 ) ) ( not ( = ?auto_66538 ?auto_66543 ) ) ( not ( = ?auto_66550 ?auto_66543 ) ) ( not ( = ?auto_66540 ?auto_66543 ) ) ( not ( = ?auto_66552 ?auto_66543 ) ) ( not ( = ?auto_66541 ?auto_66543 ) ) ( not ( = ?auto_66544 ?auto_66543 ) ) ( AVAILABLE ?auto_66549 ) ( not ( = ?auto_66546 ?auto_66551 ) ) ( not ( = ?auto_66554 ?auto_66546 ) ) ( not ( = ?auto_66545 ?auto_66546 ) ) ( HOIST-AT ?auto_66539 ?auto_66546 ) ( not ( = ?auto_66549 ?auto_66539 ) ) ( not ( = ?auto_66553 ?auto_66539 ) ) ( not ( = ?auto_66548 ?auto_66539 ) ) ( AVAILABLE ?auto_66539 ) ( SURFACE-AT ?auto_66541 ?auto_66546 ) ( ON ?auto_66541 ?auto_66542 ) ( CLEAR ?auto_66541 ) ( not ( = ?auto_66537 ?auto_66542 ) ) ( not ( = ?auto_66538 ?auto_66542 ) ) ( not ( = ?auto_66550 ?auto_66542 ) ) ( not ( = ?auto_66540 ?auto_66542 ) ) ( not ( = ?auto_66552 ?auto_66542 ) ) ( not ( = ?auto_66541 ?auto_66542 ) ) ( not ( = ?auto_66544 ?auto_66542 ) ) ( not ( = ?auto_66543 ?auto_66542 ) ) ( TRUCK-AT ?auto_66547 ?auto_66551 ) )
    :subtasks
    ( ( !DRIVE ?auto_66547 ?auto_66551 ?auto_66546 )
      ( MAKE-ON ?auto_66537 ?auto_66538 )
      ( MAKE-ON-VERIFY ?auto_66537 ?auto_66538 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_66555 - SURFACE
      ?auto_66556 - SURFACE
    )
    :vars
    (
      ?auto_66566 - HOIST
      ?auto_66560 - PLACE
      ?auto_66572 - PLACE
      ?auto_66562 - HOIST
      ?auto_66558 - SURFACE
      ?auto_66570 - SURFACE
      ?auto_66559 - PLACE
      ?auto_66568 - HOIST
      ?auto_66564 - SURFACE
      ?auto_66565 - SURFACE
      ?auto_66569 - SURFACE
      ?auto_66557 - SURFACE
      ?auto_66561 - PLACE
      ?auto_66571 - HOIST
      ?auto_66563 - SURFACE
      ?auto_66567 - TRUCK
      ?auto_66573 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_66566 ?auto_66560 ) ( IS-CRATE ?auto_66555 ) ( not ( = ?auto_66555 ?auto_66556 ) ) ( not ( = ?auto_66572 ?auto_66560 ) ) ( HOIST-AT ?auto_66562 ?auto_66572 ) ( not ( = ?auto_66566 ?auto_66562 ) ) ( AVAILABLE ?auto_66562 ) ( SURFACE-AT ?auto_66555 ?auto_66572 ) ( ON ?auto_66555 ?auto_66558 ) ( CLEAR ?auto_66555 ) ( not ( = ?auto_66555 ?auto_66558 ) ) ( not ( = ?auto_66556 ?auto_66558 ) ) ( IS-CRATE ?auto_66556 ) ( not ( = ?auto_66555 ?auto_66570 ) ) ( not ( = ?auto_66556 ?auto_66570 ) ) ( not ( = ?auto_66558 ?auto_66570 ) ) ( not ( = ?auto_66559 ?auto_66560 ) ) ( not ( = ?auto_66572 ?auto_66559 ) ) ( HOIST-AT ?auto_66568 ?auto_66559 ) ( not ( = ?auto_66566 ?auto_66568 ) ) ( not ( = ?auto_66562 ?auto_66568 ) ) ( SURFACE-AT ?auto_66556 ?auto_66559 ) ( ON ?auto_66556 ?auto_66564 ) ( CLEAR ?auto_66556 ) ( not ( = ?auto_66555 ?auto_66564 ) ) ( not ( = ?auto_66556 ?auto_66564 ) ) ( not ( = ?auto_66558 ?auto_66564 ) ) ( not ( = ?auto_66570 ?auto_66564 ) ) ( IS-CRATE ?auto_66570 ) ( not ( = ?auto_66555 ?auto_66565 ) ) ( not ( = ?auto_66556 ?auto_66565 ) ) ( not ( = ?auto_66558 ?auto_66565 ) ) ( not ( = ?auto_66570 ?auto_66565 ) ) ( not ( = ?auto_66564 ?auto_66565 ) ) ( AVAILABLE ?auto_66568 ) ( SURFACE-AT ?auto_66570 ?auto_66559 ) ( ON ?auto_66570 ?auto_66569 ) ( CLEAR ?auto_66570 ) ( not ( = ?auto_66555 ?auto_66569 ) ) ( not ( = ?auto_66556 ?auto_66569 ) ) ( not ( = ?auto_66558 ?auto_66569 ) ) ( not ( = ?auto_66570 ?auto_66569 ) ) ( not ( = ?auto_66564 ?auto_66569 ) ) ( not ( = ?auto_66565 ?auto_66569 ) ) ( IS-CRATE ?auto_66565 ) ( not ( = ?auto_66555 ?auto_66557 ) ) ( not ( = ?auto_66556 ?auto_66557 ) ) ( not ( = ?auto_66558 ?auto_66557 ) ) ( not ( = ?auto_66570 ?auto_66557 ) ) ( not ( = ?auto_66564 ?auto_66557 ) ) ( not ( = ?auto_66565 ?auto_66557 ) ) ( not ( = ?auto_66569 ?auto_66557 ) ) ( not ( = ?auto_66561 ?auto_66560 ) ) ( not ( = ?auto_66572 ?auto_66561 ) ) ( not ( = ?auto_66559 ?auto_66561 ) ) ( HOIST-AT ?auto_66571 ?auto_66561 ) ( not ( = ?auto_66566 ?auto_66571 ) ) ( not ( = ?auto_66562 ?auto_66571 ) ) ( not ( = ?auto_66568 ?auto_66571 ) ) ( AVAILABLE ?auto_66571 ) ( SURFACE-AT ?auto_66565 ?auto_66561 ) ( ON ?auto_66565 ?auto_66563 ) ( CLEAR ?auto_66565 ) ( not ( = ?auto_66555 ?auto_66563 ) ) ( not ( = ?auto_66556 ?auto_66563 ) ) ( not ( = ?auto_66558 ?auto_66563 ) ) ( not ( = ?auto_66570 ?auto_66563 ) ) ( not ( = ?auto_66564 ?auto_66563 ) ) ( not ( = ?auto_66565 ?auto_66563 ) ) ( not ( = ?auto_66569 ?auto_66563 ) ) ( not ( = ?auto_66557 ?auto_66563 ) ) ( TRUCK-AT ?auto_66567 ?auto_66560 ) ( SURFACE-AT ?auto_66573 ?auto_66560 ) ( CLEAR ?auto_66573 ) ( LIFTING ?auto_66566 ?auto_66557 ) ( IS-CRATE ?auto_66557 ) ( not ( = ?auto_66555 ?auto_66573 ) ) ( not ( = ?auto_66556 ?auto_66573 ) ) ( not ( = ?auto_66558 ?auto_66573 ) ) ( not ( = ?auto_66570 ?auto_66573 ) ) ( not ( = ?auto_66564 ?auto_66573 ) ) ( not ( = ?auto_66565 ?auto_66573 ) ) ( not ( = ?auto_66569 ?auto_66573 ) ) ( not ( = ?auto_66557 ?auto_66573 ) ) ( not ( = ?auto_66563 ?auto_66573 ) ) )
    :subtasks
    ( ( !DROP ?auto_66566 ?auto_66557 ?auto_66573 ?auto_66560 )
      ( MAKE-ON ?auto_66555 ?auto_66556 )
      ( MAKE-ON-VERIFY ?auto_66555 ?auto_66556 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_66574 - SURFACE
      ?auto_66575 - SURFACE
    )
    :vars
    (
      ?auto_66585 - HOIST
      ?auto_66579 - PLACE
      ?auto_66588 - PLACE
      ?auto_66581 - HOIST
      ?auto_66590 - SURFACE
      ?auto_66583 - SURFACE
      ?auto_66578 - PLACE
      ?auto_66592 - HOIST
      ?auto_66591 - SURFACE
      ?auto_66576 - SURFACE
      ?auto_66584 - SURFACE
      ?auto_66577 - SURFACE
      ?auto_66580 - PLACE
      ?auto_66586 - HOIST
      ?auto_66589 - SURFACE
      ?auto_66582 - TRUCK
      ?auto_66587 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_66585 ?auto_66579 ) ( IS-CRATE ?auto_66574 ) ( not ( = ?auto_66574 ?auto_66575 ) ) ( not ( = ?auto_66588 ?auto_66579 ) ) ( HOIST-AT ?auto_66581 ?auto_66588 ) ( not ( = ?auto_66585 ?auto_66581 ) ) ( AVAILABLE ?auto_66581 ) ( SURFACE-AT ?auto_66574 ?auto_66588 ) ( ON ?auto_66574 ?auto_66590 ) ( CLEAR ?auto_66574 ) ( not ( = ?auto_66574 ?auto_66590 ) ) ( not ( = ?auto_66575 ?auto_66590 ) ) ( IS-CRATE ?auto_66575 ) ( not ( = ?auto_66574 ?auto_66583 ) ) ( not ( = ?auto_66575 ?auto_66583 ) ) ( not ( = ?auto_66590 ?auto_66583 ) ) ( not ( = ?auto_66578 ?auto_66579 ) ) ( not ( = ?auto_66588 ?auto_66578 ) ) ( HOIST-AT ?auto_66592 ?auto_66578 ) ( not ( = ?auto_66585 ?auto_66592 ) ) ( not ( = ?auto_66581 ?auto_66592 ) ) ( SURFACE-AT ?auto_66575 ?auto_66578 ) ( ON ?auto_66575 ?auto_66591 ) ( CLEAR ?auto_66575 ) ( not ( = ?auto_66574 ?auto_66591 ) ) ( not ( = ?auto_66575 ?auto_66591 ) ) ( not ( = ?auto_66590 ?auto_66591 ) ) ( not ( = ?auto_66583 ?auto_66591 ) ) ( IS-CRATE ?auto_66583 ) ( not ( = ?auto_66574 ?auto_66576 ) ) ( not ( = ?auto_66575 ?auto_66576 ) ) ( not ( = ?auto_66590 ?auto_66576 ) ) ( not ( = ?auto_66583 ?auto_66576 ) ) ( not ( = ?auto_66591 ?auto_66576 ) ) ( AVAILABLE ?auto_66592 ) ( SURFACE-AT ?auto_66583 ?auto_66578 ) ( ON ?auto_66583 ?auto_66584 ) ( CLEAR ?auto_66583 ) ( not ( = ?auto_66574 ?auto_66584 ) ) ( not ( = ?auto_66575 ?auto_66584 ) ) ( not ( = ?auto_66590 ?auto_66584 ) ) ( not ( = ?auto_66583 ?auto_66584 ) ) ( not ( = ?auto_66591 ?auto_66584 ) ) ( not ( = ?auto_66576 ?auto_66584 ) ) ( IS-CRATE ?auto_66576 ) ( not ( = ?auto_66574 ?auto_66577 ) ) ( not ( = ?auto_66575 ?auto_66577 ) ) ( not ( = ?auto_66590 ?auto_66577 ) ) ( not ( = ?auto_66583 ?auto_66577 ) ) ( not ( = ?auto_66591 ?auto_66577 ) ) ( not ( = ?auto_66576 ?auto_66577 ) ) ( not ( = ?auto_66584 ?auto_66577 ) ) ( not ( = ?auto_66580 ?auto_66579 ) ) ( not ( = ?auto_66588 ?auto_66580 ) ) ( not ( = ?auto_66578 ?auto_66580 ) ) ( HOIST-AT ?auto_66586 ?auto_66580 ) ( not ( = ?auto_66585 ?auto_66586 ) ) ( not ( = ?auto_66581 ?auto_66586 ) ) ( not ( = ?auto_66592 ?auto_66586 ) ) ( AVAILABLE ?auto_66586 ) ( SURFACE-AT ?auto_66576 ?auto_66580 ) ( ON ?auto_66576 ?auto_66589 ) ( CLEAR ?auto_66576 ) ( not ( = ?auto_66574 ?auto_66589 ) ) ( not ( = ?auto_66575 ?auto_66589 ) ) ( not ( = ?auto_66590 ?auto_66589 ) ) ( not ( = ?auto_66583 ?auto_66589 ) ) ( not ( = ?auto_66591 ?auto_66589 ) ) ( not ( = ?auto_66576 ?auto_66589 ) ) ( not ( = ?auto_66584 ?auto_66589 ) ) ( not ( = ?auto_66577 ?auto_66589 ) ) ( TRUCK-AT ?auto_66582 ?auto_66579 ) ( SURFACE-AT ?auto_66587 ?auto_66579 ) ( CLEAR ?auto_66587 ) ( IS-CRATE ?auto_66577 ) ( not ( = ?auto_66574 ?auto_66587 ) ) ( not ( = ?auto_66575 ?auto_66587 ) ) ( not ( = ?auto_66590 ?auto_66587 ) ) ( not ( = ?auto_66583 ?auto_66587 ) ) ( not ( = ?auto_66591 ?auto_66587 ) ) ( not ( = ?auto_66576 ?auto_66587 ) ) ( not ( = ?auto_66584 ?auto_66587 ) ) ( not ( = ?auto_66577 ?auto_66587 ) ) ( not ( = ?auto_66589 ?auto_66587 ) ) ( AVAILABLE ?auto_66585 ) ( IN ?auto_66577 ?auto_66582 ) )
    :subtasks
    ( ( !UNLOAD ?auto_66585 ?auto_66577 ?auto_66582 ?auto_66579 )
      ( MAKE-ON ?auto_66574 ?auto_66575 )
      ( MAKE-ON-VERIFY ?auto_66574 ?auto_66575 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_66593 - SURFACE
      ?auto_66594 - SURFACE
    )
    :vars
    (
      ?auto_66598 - HOIST
      ?auto_66608 - PLACE
      ?auto_66603 - PLACE
      ?auto_66609 - HOIST
      ?auto_66601 - SURFACE
      ?auto_66599 - SURFACE
      ?auto_66610 - PLACE
      ?auto_66605 - HOIST
      ?auto_66602 - SURFACE
      ?auto_66600 - SURFACE
      ?auto_66604 - SURFACE
      ?auto_66596 - SURFACE
      ?auto_66597 - PLACE
      ?auto_66607 - HOIST
      ?auto_66595 - SURFACE
      ?auto_66606 - SURFACE
      ?auto_66611 - TRUCK
      ?auto_66612 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_66598 ?auto_66608 ) ( IS-CRATE ?auto_66593 ) ( not ( = ?auto_66593 ?auto_66594 ) ) ( not ( = ?auto_66603 ?auto_66608 ) ) ( HOIST-AT ?auto_66609 ?auto_66603 ) ( not ( = ?auto_66598 ?auto_66609 ) ) ( AVAILABLE ?auto_66609 ) ( SURFACE-AT ?auto_66593 ?auto_66603 ) ( ON ?auto_66593 ?auto_66601 ) ( CLEAR ?auto_66593 ) ( not ( = ?auto_66593 ?auto_66601 ) ) ( not ( = ?auto_66594 ?auto_66601 ) ) ( IS-CRATE ?auto_66594 ) ( not ( = ?auto_66593 ?auto_66599 ) ) ( not ( = ?auto_66594 ?auto_66599 ) ) ( not ( = ?auto_66601 ?auto_66599 ) ) ( not ( = ?auto_66610 ?auto_66608 ) ) ( not ( = ?auto_66603 ?auto_66610 ) ) ( HOIST-AT ?auto_66605 ?auto_66610 ) ( not ( = ?auto_66598 ?auto_66605 ) ) ( not ( = ?auto_66609 ?auto_66605 ) ) ( SURFACE-AT ?auto_66594 ?auto_66610 ) ( ON ?auto_66594 ?auto_66602 ) ( CLEAR ?auto_66594 ) ( not ( = ?auto_66593 ?auto_66602 ) ) ( not ( = ?auto_66594 ?auto_66602 ) ) ( not ( = ?auto_66601 ?auto_66602 ) ) ( not ( = ?auto_66599 ?auto_66602 ) ) ( IS-CRATE ?auto_66599 ) ( not ( = ?auto_66593 ?auto_66600 ) ) ( not ( = ?auto_66594 ?auto_66600 ) ) ( not ( = ?auto_66601 ?auto_66600 ) ) ( not ( = ?auto_66599 ?auto_66600 ) ) ( not ( = ?auto_66602 ?auto_66600 ) ) ( AVAILABLE ?auto_66605 ) ( SURFACE-AT ?auto_66599 ?auto_66610 ) ( ON ?auto_66599 ?auto_66604 ) ( CLEAR ?auto_66599 ) ( not ( = ?auto_66593 ?auto_66604 ) ) ( not ( = ?auto_66594 ?auto_66604 ) ) ( not ( = ?auto_66601 ?auto_66604 ) ) ( not ( = ?auto_66599 ?auto_66604 ) ) ( not ( = ?auto_66602 ?auto_66604 ) ) ( not ( = ?auto_66600 ?auto_66604 ) ) ( IS-CRATE ?auto_66600 ) ( not ( = ?auto_66593 ?auto_66596 ) ) ( not ( = ?auto_66594 ?auto_66596 ) ) ( not ( = ?auto_66601 ?auto_66596 ) ) ( not ( = ?auto_66599 ?auto_66596 ) ) ( not ( = ?auto_66602 ?auto_66596 ) ) ( not ( = ?auto_66600 ?auto_66596 ) ) ( not ( = ?auto_66604 ?auto_66596 ) ) ( not ( = ?auto_66597 ?auto_66608 ) ) ( not ( = ?auto_66603 ?auto_66597 ) ) ( not ( = ?auto_66610 ?auto_66597 ) ) ( HOIST-AT ?auto_66607 ?auto_66597 ) ( not ( = ?auto_66598 ?auto_66607 ) ) ( not ( = ?auto_66609 ?auto_66607 ) ) ( not ( = ?auto_66605 ?auto_66607 ) ) ( AVAILABLE ?auto_66607 ) ( SURFACE-AT ?auto_66600 ?auto_66597 ) ( ON ?auto_66600 ?auto_66595 ) ( CLEAR ?auto_66600 ) ( not ( = ?auto_66593 ?auto_66595 ) ) ( not ( = ?auto_66594 ?auto_66595 ) ) ( not ( = ?auto_66601 ?auto_66595 ) ) ( not ( = ?auto_66599 ?auto_66595 ) ) ( not ( = ?auto_66602 ?auto_66595 ) ) ( not ( = ?auto_66600 ?auto_66595 ) ) ( not ( = ?auto_66604 ?auto_66595 ) ) ( not ( = ?auto_66596 ?auto_66595 ) ) ( SURFACE-AT ?auto_66606 ?auto_66608 ) ( CLEAR ?auto_66606 ) ( IS-CRATE ?auto_66596 ) ( not ( = ?auto_66593 ?auto_66606 ) ) ( not ( = ?auto_66594 ?auto_66606 ) ) ( not ( = ?auto_66601 ?auto_66606 ) ) ( not ( = ?auto_66599 ?auto_66606 ) ) ( not ( = ?auto_66602 ?auto_66606 ) ) ( not ( = ?auto_66600 ?auto_66606 ) ) ( not ( = ?auto_66604 ?auto_66606 ) ) ( not ( = ?auto_66596 ?auto_66606 ) ) ( not ( = ?auto_66595 ?auto_66606 ) ) ( AVAILABLE ?auto_66598 ) ( IN ?auto_66596 ?auto_66611 ) ( TRUCK-AT ?auto_66611 ?auto_66612 ) ( not ( = ?auto_66612 ?auto_66608 ) ) ( not ( = ?auto_66603 ?auto_66612 ) ) ( not ( = ?auto_66610 ?auto_66612 ) ) ( not ( = ?auto_66597 ?auto_66612 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_66611 ?auto_66612 ?auto_66608 )
      ( MAKE-ON ?auto_66593 ?auto_66594 )
      ( MAKE-ON-VERIFY ?auto_66593 ?auto_66594 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_66613 - SURFACE
      ?auto_66614 - SURFACE
    )
    :vars
    (
      ?auto_66621 - HOIST
      ?auto_66632 - PLACE
      ?auto_66630 - PLACE
      ?auto_66615 - HOIST
      ?auto_66616 - SURFACE
      ?auto_66620 - SURFACE
      ?auto_66618 - PLACE
      ?auto_66623 - HOIST
      ?auto_66627 - SURFACE
      ?auto_66622 - SURFACE
      ?auto_66629 - SURFACE
      ?auto_66624 - SURFACE
      ?auto_66631 - PLACE
      ?auto_66617 - HOIST
      ?auto_66619 - SURFACE
      ?auto_66626 - SURFACE
      ?auto_66625 - TRUCK
      ?auto_66628 - PLACE
      ?auto_66633 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_66621 ?auto_66632 ) ( IS-CRATE ?auto_66613 ) ( not ( = ?auto_66613 ?auto_66614 ) ) ( not ( = ?auto_66630 ?auto_66632 ) ) ( HOIST-AT ?auto_66615 ?auto_66630 ) ( not ( = ?auto_66621 ?auto_66615 ) ) ( AVAILABLE ?auto_66615 ) ( SURFACE-AT ?auto_66613 ?auto_66630 ) ( ON ?auto_66613 ?auto_66616 ) ( CLEAR ?auto_66613 ) ( not ( = ?auto_66613 ?auto_66616 ) ) ( not ( = ?auto_66614 ?auto_66616 ) ) ( IS-CRATE ?auto_66614 ) ( not ( = ?auto_66613 ?auto_66620 ) ) ( not ( = ?auto_66614 ?auto_66620 ) ) ( not ( = ?auto_66616 ?auto_66620 ) ) ( not ( = ?auto_66618 ?auto_66632 ) ) ( not ( = ?auto_66630 ?auto_66618 ) ) ( HOIST-AT ?auto_66623 ?auto_66618 ) ( not ( = ?auto_66621 ?auto_66623 ) ) ( not ( = ?auto_66615 ?auto_66623 ) ) ( SURFACE-AT ?auto_66614 ?auto_66618 ) ( ON ?auto_66614 ?auto_66627 ) ( CLEAR ?auto_66614 ) ( not ( = ?auto_66613 ?auto_66627 ) ) ( not ( = ?auto_66614 ?auto_66627 ) ) ( not ( = ?auto_66616 ?auto_66627 ) ) ( not ( = ?auto_66620 ?auto_66627 ) ) ( IS-CRATE ?auto_66620 ) ( not ( = ?auto_66613 ?auto_66622 ) ) ( not ( = ?auto_66614 ?auto_66622 ) ) ( not ( = ?auto_66616 ?auto_66622 ) ) ( not ( = ?auto_66620 ?auto_66622 ) ) ( not ( = ?auto_66627 ?auto_66622 ) ) ( AVAILABLE ?auto_66623 ) ( SURFACE-AT ?auto_66620 ?auto_66618 ) ( ON ?auto_66620 ?auto_66629 ) ( CLEAR ?auto_66620 ) ( not ( = ?auto_66613 ?auto_66629 ) ) ( not ( = ?auto_66614 ?auto_66629 ) ) ( not ( = ?auto_66616 ?auto_66629 ) ) ( not ( = ?auto_66620 ?auto_66629 ) ) ( not ( = ?auto_66627 ?auto_66629 ) ) ( not ( = ?auto_66622 ?auto_66629 ) ) ( IS-CRATE ?auto_66622 ) ( not ( = ?auto_66613 ?auto_66624 ) ) ( not ( = ?auto_66614 ?auto_66624 ) ) ( not ( = ?auto_66616 ?auto_66624 ) ) ( not ( = ?auto_66620 ?auto_66624 ) ) ( not ( = ?auto_66627 ?auto_66624 ) ) ( not ( = ?auto_66622 ?auto_66624 ) ) ( not ( = ?auto_66629 ?auto_66624 ) ) ( not ( = ?auto_66631 ?auto_66632 ) ) ( not ( = ?auto_66630 ?auto_66631 ) ) ( not ( = ?auto_66618 ?auto_66631 ) ) ( HOIST-AT ?auto_66617 ?auto_66631 ) ( not ( = ?auto_66621 ?auto_66617 ) ) ( not ( = ?auto_66615 ?auto_66617 ) ) ( not ( = ?auto_66623 ?auto_66617 ) ) ( AVAILABLE ?auto_66617 ) ( SURFACE-AT ?auto_66622 ?auto_66631 ) ( ON ?auto_66622 ?auto_66619 ) ( CLEAR ?auto_66622 ) ( not ( = ?auto_66613 ?auto_66619 ) ) ( not ( = ?auto_66614 ?auto_66619 ) ) ( not ( = ?auto_66616 ?auto_66619 ) ) ( not ( = ?auto_66620 ?auto_66619 ) ) ( not ( = ?auto_66627 ?auto_66619 ) ) ( not ( = ?auto_66622 ?auto_66619 ) ) ( not ( = ?auto_66629 ?auto_66619 ) ) ( not ( = ?auto_66624 ?auto_66619 ) ) ( SURFACE-AT ?auto_66626 ?auto_66632 ) ( CLEAR ?auto_66626 ) ( IS-CRATE ?auto_66624 ) ( not ( = ?auto_66613 ?auto_66626 ) ) ( not ( = ?auto_66614 ?auto_66626 ) ) ( not ( = ?auto_66616 ?auto_66626 ) ) ( not ( = ?auto_66620 ?auto_66626 ) ) ( not ( = ?auto_66627 ?auto_66626 ) ) ( not ( = ?auto_66622 ?auto_66626 ) ) ( not ( = ?auto_66629 ?auto_66626 ) ) ( not ( = ?auto_66624 ?auto_66626 ) ) ( not ( = ?auto_66619 ?auto_66626 ) ) ( AVAILABLE ?auto_66621 ) ( TRUCK-AT ?auto_66625 ?auto_66628 ) ( not ( = ?auto_66628 ?auto_66632 ) ) ( not ( = ?auto_66630 ?auto_66628 ) ) ( not ( = ?auto_66618 ?auto_66628 ) ) ( not ( = ?auto_66631 ?auto_66628 ) ) ( HOIST-AT ?auto_66633 ?auto_66628 ) ( LIFTING ?auto_66633 ?auto_66624 ) ( not ( = ?auto_66621 ?auto_66633 ) ) ( not ( = ?auto_66615 ?auto_66633 ) ) ( not ( = ?auto_66623 ?auto_66633 ) ) ( not ( = ?auto_66617 ?auto_66633 ) ) )
    :subtasks
    ( ( !LOAD ?auto_66633 ?auto_66624 ?auto_66625 ?auto_66628 )
      ( MAKE-ON ?auto_66613 ?auto_66614 )
      ( MAKE-ON-VERIFY ?auto_66613 ?auto_66614 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_66634 - SURFACE
      ?auto_66635 - SURFACE
    )
    :vars
    (
      ?auto_66646 - HOIST
      ?auto_66648 - PLACE
      ?auto_66639 - PLACE
      ?auto_66643 - HOIST
      ?auto_66636 - SURFACE
      ?auto_66638 - SURFACE
      ?auto_66652 - PLACE
      ?auto_66647 - HOIST
      ?auto_66650 - SURFACE
      ?auto_66644 - SURFACE
      ?auto_66640 - SURFACE
      ?auto_66649 - SURFACE
      ?auto_66641 - PLACE
      ?auto_66651 - HOIST
      ?auto_66654 - SURFACE
      ?auto_66637 - SURFACE
      ?auto_66642 - TRUCK
      ?auto_66645 - PLACE
      ?auto_66653 - HOIST
      ?auto_66655 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_66646 ?auto_66648 ) ( IS-CRATE ?auto_66634 ) ( not ( = ?auto_66634 ?auto_66635 ) ) ( not ( = ?auto_66639 ?auto_66648 ) ) ( HOIST-AT ?auto_66643 ?auto_66639 ) ( not ( = ?auto_66646 ?auto_66643 ) ) ( AVAILABLE ?auto_66643 ) ( SURFACE-AT ?auto_66634 ?auto_66639 ) ( ON ?auto_66634 ?auto_66636 ) ( CLEAR ?auto_66634 ) ( not ( = ?auto_66634 ?auto_66636 ) ) ( not ( = ?auto_66635 ?auto_66636 ) ) ( IS-CRATE ?auto_66635 ) ( not ( = ?auto_66634 ?auto_66638 ) ) ( not ( = ?auto_66635 ?auto_66638 ) ) ( not ( = ?auto_66636 ?auto_66638 ) ) ( not ( = ?auto_66652 ?auto_66648 ) ) ( not ( = ?auto_66639 ?auto_66652 ) ) ( HOIST-AT ?auto_66647 ?auto_66652 ) ( not ( = ?auto_66646 ?auto_66647 ) ) ( not ( = ?auto_66643 ?auto_66647 ) ) ( SURFACE-AT ?auto_66635 ?auto_66652 ) ( ON ?auto_66635 ?auto_66650 ) ( CLEAR ?auto_66635 ) ( not ( = ?auto_66634 ?auto_66650 ) ) ( not ( = ?auto_66635 ?auto_66650 ) ) ( not ( = ?auto_66636 ?auto_66650 ) ) ( not ( = ?auto_66638 ?auto_66650 ) ) ( IS-CRATE ?auto_66638 ) ( not ( = ?auto_66634 ?auto_66644 ) ) ( not ( = ?auto_66635 ?auto_66644 ) ) ( not ( = ?auto_66636 ?auto_66644 ) ) ( not ( = ?auto_66638 ?auto_66644 ) ) ( not ( = ?auto_66650 ?auto_66644 ) ) ( AVAILABLE ?auto_66647 ) ( SURFACE-AT ?auto_66638 ?auto_66652 ) ( ON ?auto_66638 ?auto_66640 ) ( CLEAR ?auto_66638 ) ( not ( = ?auto_66634 ?auto_66640 ) ) ( not ( = ?auto_66635 ?auto_66640 ) ) ( not ( = ?auto_66636 ?auto_66640 ) ) ( not ( = ?auto_66638 ?auto_66640 ) ) ( not ( = ?auto_66650 ?auto_66640 ) ) ( not ( = ?auto_66644 ?auto_66640 ) ) ( IS-CRATE ?auto_66644 ) ( not ( = ?auto_66634 ?auto_66649 ) ) ( not ( = ?auto_66635 ?auto_66649 ) ) ( not ( = ?auto_66636 ?auto_66649 ) ) ( not ( = ?auto_66638 ?auto_66649 ) ) ( not ( = ?auto_66650 ?auto_66649 ) ) ( not ( = ?auto_66644 ?auto_66649 ) ) ( not ( = ?auto_66640 ?auto_66649 ) ) ( not ( = ?auto_66641 ?auto_66648 ) ) ( not ( = ?auto_66639 ?auto_66641 ) ) ( not ( = ?auto_66652 ?auto_66641 ) ) ( HOIST-AT ?auto_66651 ?auto_66641 ) ( not ( = ?auto_66646 ?auto_66651 ) ) ( not ( = ?auto_66643 ?auto_66651 ) ) ( not ( = ?auto_66647 ?auto_66651 ) ) ( AVAILABLE ?auto_66651 ) ( SURFACE-AT ?auto_66644 ?auto_66641 ) ( ON ?auto_66644 ?auto_66654 ) ( CLEAR ?auto_66644 ) ( not ( = ?auto_66634 ?auto_66654 ) ) ( not ( = ?auto_66635 ?auto_66654 ) ) ( not ( = ?auto_66636 ?auto_66654 ) ) ( not ( = ?auto_66638 ?auto_66654 ) ) ( not ( = ?auto_66650 ?auto_66654 ) ) ( not ( = ?auto_66644 ?auto_66654 ) ) ( not ( = ?auto_66640 ?auto_66654 ) ) ( not ( = ?auto_66649 ?auto_66654 ) ) ( SURFACE-AT ?auto_66637 ?auto_66648 ) ( CLEAR ?auto_66637 ) ( IS-CRATE ?auto_66649 ) ( not ( = ?auto_66634 ?auto_66637 ) ) ( not ( = ?auto_66635 ?auto_66637 ) ) ( not ( = ?auto_66636 ?auto_66637 ) ) ( not ( = ?auto_66638 ?auto_66637 ) ) ( not ( = ?auto_66650 ?auto_66637 ) ) ( not ( = ?auto_66644 ?auto_66637 ) ) ( not ( = ?auto_66640 ?auto_66637 ) ) ( not ( = ?auto_66649 ?auto_66637 ) ) ( not ( = ?auto_66654 ?auto_66637 ) ) ( AVAILABLE ?auto_66646 ) ( TRUCK-AT ?auto_66642 ?auto_66645 ) ( not ( = ?auto_66645 ?auto_66648 ) ) ( not ( = ?auto_66639 ?auto_66645 ) ) ( not ( = ?auto_66652 ?auto_66645 ) ) ( not ( = ?auto_66641 ?auto_66645 ) ) ( HOIST-AT ?auto_66653 ?auto_66645 ) ( not ( = ?auto_66646 ?auto_66653 ) ) ( not ( = ?auto_66643 ?auto_66653 ) ) ( not ( = ?auto_66647 ?auto_66653 ) ) ( not ( = ?auto_66651 ?auto_66653 ) ) ( AVAILABLE ?auto_66653 ) ( SURFACE-AT ?auto_66649 ?auto_66645 ) ( ON ?auto_66649 ?auto_66655 ) ( CLEAR ?auto_66649 ) ( not ( = ?auto_66634 ?auto_66655 ) ) ( not ( = ?auto_66635 ?auto_66655 ) ) ( not ( = ?auto_66636 ?auto_66655 ) ) ( not ( = ?auto_66638 ?auto_66655 ) ) ( not ( = ?auto_66650 ?auto_66655 ) ) ( not ( = ?auto_66644 ?auto_66655 ) ) ( not ( = ?auto_66640 ?auto_66655 ) ) ( not ( = ?auto_66649 ?auto_66655 ) ) ( not ( = ?auto_66654 ?auto_66655 ) ) ( not ( = ?auto_66637 ?auto_66655 ) ) )
    :subtasks
    ( ( !LIFT ?auto_66653 ?auto_66649 ?auto_66655 ?auto_66645 )
      ( MAKE-ON ?auto_66634 ?auto_66635 )
      ( MAKE-ON-VERIFY ?auto_66634 ?auto_66635 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_66656 - SURFACE
      ?auto_66657 - SURFACE
    )
    :vars
    (
      ?auto_66667 - HOIST
      ?auto_66677 - PLACE
      ?auto_66676 - PLACE
      ?auto_66659 - HOIST
      ?auto_66660 - SURFACE
      ?auto_66674 - SURFACE
      ?auto_66662 - PLACE
      ?auto_66672 - HOIST
      ?auto_66675 - SURFACE
      ?auto_66661 - SURFACE
      ?auto_66673 - SURFACE
      ?auto_66664 - SURFACE
      ?auto_66668 - PLACE
      ?auto_66669 - HOIST
      ?auto_66665 - SURFACE
      ?auto_66671 - SURFACE
      ?auto_66670 - PLACE
      ?auto_66658 - HOIST
      ?auto_66663 - SURFACE
      ?auto_66666 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_66667 ?auto_66677 ) ( IS-CRATE ?auto_66656 ) ( not ( = ?auto_66656 ?auto_66657 ) ) ( not ( = ?auto_66676 ?auto_66677 ) ) ( HOIST-AT ?auto_66659 ?auto_66676 ) ( not ( = ?auto_66667 ?auto_66659 ) ) ( AVAILABLE ?auto_66659 ) ( SURFACE-AT ?auto_66656 ?auto_66676 ) ( ON ?auto_66656 ?auto_66660 ) ( CLEAR ?auto_66656 ) ( not ( = ?auto_66656 ?auto_66660 ) ) ( not ( = ?auto_66657 ?auto_66660 ) ) ( IS-CRATE ?auto_66657 ) ( not ( = ?auto_66656 ?auto_66674 ) ) ( not ( = ?auto_66657 ?auto_66674 ) ) ( not ( = ?auto_66660 ?auto_66674 ) ) ( not ( = ?auto_66662 ?auto_66677 ) ) ( not ( = ?auto_66676 ?auto_66662 ) ) ( HOIST-AT ?auto_66672 ?auto_66662 ) ( not ( = ?auto_66667 ?auto_66672 ) ) ( not ( = ?auto_66659 ?auto_66672 ) ) ( SURFACE-AT ?auto_66657 ?auto_66662 ) ( ON ?auto_66657 ?auto_66675 ) ( CLEAR ?auto_66657 ) ( not ( = ?auto_66656 ?auto_66675 ) ) ( not ( = ?auto_66657 ?auto_66675 ) ) ( not ( = ?auto_66660 ?auto_66675 ) ) ( not ( = ?auto_66674 ?auto_66675 ) ) ( IS-CRATE ?auto_66674 ) ( not ( = ?auto_66656 ?auto_66661 ) ) ( not ( = ?auto_66657 ?auto_66661 ) ) ( not ( = ?auto_66660 ?auto_66661 ) ) ( not ( = ?auto_66674 ?auto_66661 ) ) ( not ( = ?auto_66675 ?auto_66661 ) ) ( AVAILABLE ?auto_66672 ) ( SURFACE-AT ?auto_66674 ?auto_66662 ) ( ON ?auto_66674 ?auto_66673 ) ( CLEAR ?auto_66674 ) ( not ( = ?auto_66656 ?auto_66673 ) ) ( not ( = ?auto_66657 ?auto_66673 ) ) ( not ( = ?auto_66660 ?auto_66673 ) ) ( not ( = ?auto_66674 ?auto_66673 ) ) ( not ( = ?auto_66675 ?auto_66673 ) ) ( not ( = ?auto_66661 ?auto_66673 ) ) ( IS-CRATE ?auto_66661 ) ( not ( = ?auto_66656 ?auto_66664 ) ) ( not ( = ?auto_66657 ?auto_66664 ) ) ( not ( = ?auto_66660 ?auto_66664 ) ) ( not ( = ?auto_66674 ?auto_66664 ) ) ( not ( = ?auto_66675 ?auto_66664 ) ) ( not ( = ?auto_66661 ?auto_66664 ) ) ( not ( = ?auto_66673 ?auto_66664 ) ) ( not ( = ?auto_66668 ?auto_66677 ) ) ( not ( = ?auto_66676 ?auto_66668 ) ) ( not ( = ?auto_66662 ?auto_66668 ) ) ( HOIST-AT ?auto_66669 ?auto_66668 ) ( not ( = ?auto_66667 ?auto_66669 ) ) ( not ( = ?auto_66659 ?auto_66669 ) ) ( not ( = ?auto_66672 ?auto_66669 ) ) ( AVAILABLE ?auto_66669 ) ( SURFACE-AT ?auto_66661 ?auto_66668 ) ( ON ?auto_66661 ?auto_66665 ) ( CLEAR ?auto_66661 ) ( not ( = ?auto_66656 ?auto_66665 ) ) ( not ( = ?auto_66657 ?auto_66665 ) ) ( not ( = ?auto_66660 ?auto_66665 ) ) ( not ( = ?auto_66674 ?auto_66665 ) ) ( not ( = ?auto_66675 ?auto_66665 ) ) ( not ( = ?auto_66661 ?auto_66665 ) ) ( not ( = ?auto_66673 ?auto_66665 ) ) ( not ( = ?auto_66664 ?auto_66665 ) ) ( SURFACE-AT ?auto_66671 ?auto_66677 ) ( CLEAR ?auto_66671 ) ( IS-CRATE ?auto_66664 ) ( not ( = ?auto_66656 ?auto_66671 ) ) ( not ( = ?auto_66657 ?auto_66671 ) ) ( not ( = ?auto_66660 ?auto_66671 ) ) ( not ( = ?auto_66674 ?auto_66671 ) ) ( not ( = ?auto_66675 ?auto_66671 ) ) ( not ( = ?auto_66661 ?auto_66671 ) ) ( not ( = ?auto_66673 ?auto_66671 ) ) ( not ( = ?auto_66664 ?auto_66671 ) ) ( not ( = ?auto_66665 ?auto_66671 ) ) ( AVAILABLE ?auto_66667 ) ( not ( = ?auto_66670 ?auto_66677 ) ) ( not ( = ?auto_66676 ?auto_66670 ) ) ( not ( = ?auto_66662 ?auto_66670 ) ) ( not ( = ?auto_66668 ?auto_66670 ) ) ( HOIST-AT ?auto_66658 ?auto_66670 ) ( not ( = ?auto_66667 ?auto_66658 ) ) ( not ( = ?auto_66659 ?auto_66658 ) ) ( not ( = ?auto_66672 ?auto_66658 ) ) ( not ( = ?auto_66669 ?auto_66658 ) ) ( AVAILABLE ?auto_66658 ) ( SURFACE-AT ?auto_66664 ?auto_66670 ) ( ON ?auto_66664 ?auto_66663 ) ( CLEAR ?auto_66664 ) ( not ( = ?auto_66656 ?auto_66663 ) ) ( not ( = ?auto_66657 ?auto_66663 ) ) ( not ( = ?auto_66660 ?auto_66663 ) ) ( not ( = ?auto_66674 ?auto_66663 ) ) ( not ( = ?auto_66675 ?auto_66663 ) ) ( not ( = ?auto_66661 ?auto_66663 ) ) ( not ( = ?auto_66673 ?auto_66663 ) ) ( not ( = ?auto_66664 ?auto_66663 ) ) ( not ( = ?auto_66665 ?auto_66663 ) ) ( not ( = ?auto_66671 ?auto_66663 ) ) ( TRUCK-AT ?auto_66666 ?auto_66677 ) )
    :subtasks
    ( ( !DRIVE ?auto_66666 ?auto_66677 ?auto_66670 )
      ( MAKE-ON ?auto_66656 ?auto_66657 )
      ( MAKE-ON-VERIFY ?auto_66656 ?auto_66657 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_66678 - SURFACE
      ?auto_66679 - SURFACE
    )
    :vars
    (
      ?auto_66681 - HOIST
      ?auto_66696 - PLACE
      ?auto_66684 - PLACE
      ?auto_66686 - HOIST
      ?auto_66699 - SURFACE
      ?auto_66682 - SURFACE
      ?auto_66685 - PLACE
      ?auto_66691 - HOIST
      ?auto_66683 - SURFACE
      ?auto_66680 - SURFACE
      ?auto_66688 - SURFACE
      ?auto_66697 - SURFACE
      ?auto_66698 - PLACE
      ?auto_66692 - HOIST
      ?auto_66687 - SURFACE
      ?auto_66693 - SURFACE
      ?auto_66695 - PLACE
      ?auto_66690 - HOIST
      ?auto_66694 - SURFACE
      ?auto_66689 - TRUCK
      ?auto_66700 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_66681 ?auto_66696 ) ( IS-CRATE ?auto_66678 ) ( not ( = ?auto_66678 ?auto_66679 ) ) ( not ( = ?auto_66684 ?auto_66696 ) ) ( HOIST-AT ?auto_66686 ?auto_66684 ) ( not ( = ?auto_66681 ?auto_66686 ) ) ( AVAILABLE ?auto_66686 ) ( SURFACE-AT ?auto_66678 ?auto_66684 ) ( ON ?auto_66678 ?auto_66699 ) ( CLEAR ?auto_66678 ) ( not ( = ?auto_66678 ?auto_66699 ) ) ( not ( = ?auto_66679 ?auto_66699 ) ) ( IS-CRATE ?auto_66679 ) ( not ( = ?auto_66678 ?auto_66682 ) ) ( not ( = ?auto_66679 ?auto_66682 ) ) ( not ( = ?auto_66699 ?auto_66682 ) ) ( not ( = ?auto_66685 ?auto_66696 ) ) ( not ( = ?auto_66684 ?auto_66685 ) ) ( HOIST-AT ?auto_66691 ?auto_66685 ) ( not ( = ?auto_66681 ?auto_66691 ) ) ( not ( = ?auto_66686 ?auto_66691 ) ) ( SURFACE-AT ?auto_66679 ?auto_66685 ) ( ON ?auto_66679 ?auto_66683 ) ( CLEAR ?auto_66679 ) ( not ( = ?auto_66678 ?auto_66683 ) ) ( not ( = ?auto_66679 ?auto_66683 ) ) ( not ( = ?auto_66699 ?auto_66683 ) ) ( not ( = ?auto_66682 ?auto_66683 ) ) ( IS-CRATE ?auto_66682 ) ( not ( = ?auto_66678 ?auto_66680 ) ) ( not ( = ?auto_66679 ?auto_66680 ) ) ( not ( = ?auto_66699 ?auto_66680 ) ) ( not ( = ?auto_66682 ?auto_66680 ) ) ( not ( = ?auto_66683 ?auto_66680 ) ) ( AVAILABLE ?auto_66691 ) ( SURFACE-AT ?auto_66682 ?auto_66685 ) ( ON ?auto_66682 ?auto_66688 ) ( CLEAR ?auto_66682 ) ( not ( = ?auto_66678 ?auto_66688 ) ) ( not ( = ?auto_66679 ?auto_66688 ) ) ( not ( = ?auto_66699 ?auto_66688 ) ) ( not ( = ?auto_66682 ?auto_66688 ) ) ( not ( = ?auto_66683 ?auto_66688 ) ) ( not ( = ?auto_66680 ?auto_66688 ) ) ( IS-CRATE ?auto_66680 ) ( not ( = ?auto_66678 ?auto_66697 ) ) ( not ( = ?auto_66679 ?auto_66697 ) ) ( not ( = ?auto_66699 ?auto_66697 ) ) ( not ( = ?auto_66682 ?auto_66697 ) ) ( not ( = ?auto_66683 ?auto_66697 ) ) ( not ( = ?auto_66680 ?auto_66697 ) ) ( not ( = ?auto_66688 ?auto_66697 ) ) ( not ( = ?auto_66698 ?auto_66696 ) ) ( not ( = ?auto_66684 ?auto_66698 ) ) ( not ( = ?auto_66685 ?auto_66698 ) ) ( HOIST-AT ?auto_66692 ?auto_66698 ) ( not ( = ?auto_66681 ?auto_66692 ) ) ( not ( = ?auto_66686 ?auto_66692 ) ) ( not ( = ?auto_66691 ?auto_66692 ) ) ( AVAILABLE ?auto_66692 ) ( SURFACE-AT ?auto_66680 ?auto_66698 ) ( ON ?auto_66680 ?auto_66687 ) ( CLEAR ?auto_66680 ) ( not ( = ?auto_66678 ?auto_66687 ) ) ( not ( = ?auto_66679 ?auto_66687 ) ) ( not ( = ?auto_66699 ?auto_66687 ) ) ( not ( = ?auto_66682 ?auto_66687 ) ) ( not ( = ?auto_66683 ?auto_66687 ) ) ( not ( = ?auto_66680 ?auto_66687 ) ) ( not ( = ?auto_66688 ?auto_66687 ) ) ( not ( = ?auto_66697 ?auto_66687 ) ) ( IS-CRATE ?auto_66697 ) ( not ( = ?auto_66678 ?auto_66693 ) ) ( not ( = ?auto_66679 ?auto_66693 ) ) ( not ( = ?auto_66699 ?auto_66693 ) ) ( not ( = ?auto_66682 ?auto_66693 ) ) ( not ( = ?auto_66683 ?auto_66693 ) ) ( not ( = ?auto_66680 ?auto_66693 ) ) ( not ( = ?auto_66688 ?auto_66693 ) ) ( not ( = ?auto_66697 ?auto_66693 ) ) ( not ( = ?auto_66687 ?auto_66693 ) ) ( not ( = ?auto_66695 ?auto_66696 ) ) ( not ( = ?auto_66684 ?auto_66695 ) ) ( not ( = ?auto_66685 ?auto_66695 ) ) ( not ( = ?auto_66698 ?auto_66695 ) ) ( HOIST-AT ?auto_66690 ?auto_66695 ) ( not ( = ?auto_66681 ?auto_66690 ) ) ( not ( = ?auto_66686 ?auto_66690 ) ) ( not ( = ?auto_66691 ?auto_66690 ) ) ( not ( = ?auto_66692 ?auto_66690 ) ) ( AVAILABLE ?auto_66690 ) ( SURFACE-AT ?auto_66697 ?auto_66695 ) ( ON ?auto_66697 ?auto_66694 ) ( CLEAR ?auto_66697 ) ( not ( = ?auto_66678 ?auto_66694 ) ) ( not ( = ?auto_66679 ?auto_66694 ) ) ( not ( = ?auto_66699 ?auto_66694 ) ) ( not ( = ?auto_66682 ?auto_66694 ) ) ( not ( = ?auto_66683 ?auto_66694 ) ) ( not ( = ?auto_66680 ?auto_66694 ) ) ( not ( = ?auto_66688 ?auto_66694 ) ) ( not ( = ?auto_66697 ?auto_66694 ) ) ( not ( = ?auto_66687 ?auto_66694 ) ) ( not ( = ?auto_66693 ?auto_66694 ) ) ( TRUCK-AT ?auto_66689 ?auto_66696 ) ( SURFACE-AT ?auto_66700 ?auto_66696 ) ( CLEAR ?auto_66700 ) ( LIFTING ?auto_66681 ?auto_66693 ) ( IS-CRATE ?auto_66693 ) ( not ( = ?auto_66678 ?auto_66700 ) ) ( not ( = ?auto_66679 ?auto_66700 ) ) ( not ( = ?auto_66699 ?auto_66700 ) ) ( not ( = ?auto_66682 ?auto_66700 ) ) ( not ( = ?auto_66683 ?auto_66700 ) ) ( not ( = ?auto_66680 ?auto_66700 ) ) ( not ( = ?auto_66688 ?auto_66700 ) ) ( not ( = ?auto_66697 ?auto_66700 ) ) ( not ( = ?auto_66687 ?auto_66700 ) ) ( not ( = ?auto_66693 ?auto_66700 ) ) ( not ( = ?auto_66694 ?auto_66700 ) ) )
    :subtasks
    ( ( !DROP ?auto_66681 ?auto_66693 ?auto_66700 ?auto_66696 )
      ( MAKE-ON ?auto_66678 ?auto_66679 )
      ( MAKE-ON-VERIFY ?auto_66678 ?auto_66679 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_66701 - SURFACE
      ?auto_66702 - SURFACE
    )
    :vars
    (
      ?auto_66721 - HOIST
      ?auto_66705 - PLACE
      ?auto_66722 - PLACE
      ?auto_66712 - HOIST
      ?auto_66706 - SURFACE
      ?auto_66715 - SURFACE
      ?auto_66718 - PLACE
      ?auto_66720 - HOIST
      ?auto_66714 - SURFACE
      ?auto_66717 - SURFACE
      ?auto_66713 - SURFACE
      ?auto_66704 - SURFACE
      ?auto_66703 - PLACE
      ?auto_66719 - HOIST
      ?auto_66710 - SURFACE
      ?auto_66707 - SURFACE
      ?auto_66716 - PLACE
      ?auto_66708 - HOIST
      ?auto_66711 - SURFACE
      ?auto_66709 - TRUCK
      ?auto_66723 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_66721 ?auto_66705 ) ( IS-CRATE ?auto_66701 ) ( not ( = ?auto_66701 ?auto_66702 ) ) ( not ( = ?auto_66722 ?auto_66705 ) ) ( HOIST-AT ?auto_66712 ?auto_66722 ) ( not ( = ?auto_66721 ?auto_66712 ) ) ( AVAILABLE ?auto_66712 ) ( SURFACE-AT ?auto_66701 ?auto_66722 ) ( ON ?auto_66701 ?auto_66706 ) ( CLEAR ?auto_66701 ) ( not ( = ?auto_66701 ?auto_66706 ) ) ( not ( = ?auto_66702 ?auto_66706 ) ) ( IS-CRATE ?auto_66702 ) ( not ( = ?auto_66701 ?auto_66715 ) ) ( not ( = ?auto_66702 ?auto_66715 ) ) ( not ( = ?auto_66706 ?auto_66715 ) ) ( not ( = ?auto_66718 ?auto_66705 ) ) ( not ( = ?auto_66722 ?auto_66718 ) ) ( HOIST-AT ?auto_66720 ?auto_66718 ) ( not ( = ?auto_66721 ?auto_66720 ) ) ( not ( = ?auto_66712 ?auto_66720 ) ) ( SURFACE-AT ?auto_66702 ?auto_66718 ) ( ON ?auto_66702 ?auto_66714 ) ( CLEAR ?auto_66702 ) ( not ( = ?auto_66701 ?auto_66714 ) ) ( not ( = ?auto_66702 ?auto_66714 ) ) ( not ( = ?auto_66706 ?auto_66714 ) ) ( not ( = ?auto_66715 ?auto_66714 ) ) ( IS-CRATE ?auto_66715 ) ( not ( = ?auto_66701 ?auto_66717 ) ) ( not ( = ?auto_66702 ?auto_66717 ) ) ( not ( = ?auto_66706 ?auto_66717 ) ) ( not ( = ?auto_66715 ?auto_66717 ) ) ( not ( = ?auto_66714 ?auto_66717 ) ) ( AVAILABLE ?auto_66720 ) ( SURFACE-AT ?auto_66715 ?auto_66718 ) ( ON ?auto_66715 ?auto_66713 ) ( CLEAR ?auto_66715 ) ( not ( = ?auto_66701 ?auto_66713 ) ) ( not ( = ?auto_66702 ?auto_66713 ) ) ( not ( = ?auto_66706 ?auto_66713 ) ) ( not ( = ?auto_66715 ?auto_66713 ) ) ( not ( = ?auto_66714 ?auto_66713 ) ) ( not ( = ?auto_66717 ?auto_66713 ) ) ( IS-CRATE ?auto_66717 ) ( not ( = ?auto_66701 ?auto_66704 ) ) ( not ( = ?auto_66702 ?auto_66704 ) ) ( not ( = ?auto_66706 ?auto_66704 ) ) ( not ( = ?auto_66715 ?auto_66704 ) ) ( not ( = ?auto_66714 ?auto_66704 ) ) ( not ( = ?auto_66717 ?auto_66704 ) ) ( not ( = ?auto_66713 ?auto_66704 ) ) ( not ( = ?auto_66703 ?auto_66705 ) ) ( not ( = ?auto_66722 ?auto_66703 ) ) ( not ( = ?auto_66718 ?auto_66703 ) ) ( HOIST-AT ?auto_66719 ?auto_66703 ) ( not ( = ?auto_66721 ?auto_66719 ) ) ( not ( = ?auto_66712 ?auto_66719 ) ) ( not ( = ?auto_66720 ?auto_66719 ) ) ( AVAILABLE ?auto_66719 ) ( SURFACE-AT ?auto_66717 ?auto_66703 ) ( ON ?auto_66717 ?auto_66710 ) ( CLEAR ?auto_66717 ) ( not ( = ?auto_66701 ?auto_66710 ) ) ( not ( = ?auto_66702 ?auto_66710 ) ) ( not ( = ?auto_66706 ?auto_66710 ) ) ( not ( = ?auto_66715 ?auto_66710 ) ) ( not ( = ?auto_66714 ?auto_66710 ) ) ( not ( = ?auto_66717 ?auto_66710 ) ) ( not ( = ?auto_66713 ?auto_66710 ) ) ( not ( = ?auto_66704 ?auto_66710 ) ) ( IS-CRATE ?auto_66704 ) ( not ( = ?auto_66701 ?auto_66707 ) ) ( not ( = ?auto_66702 ?auto_66707 ) ) ( not ( = ?auto_66706 ?auto_66707 ) ) ( not ( = ?auto_66715 ?auto_66707 ) ) ( not ( = ?auto_66714 ?auto_66707 ) ) ( not ( = ?auto_66717 ?auto_66707 ) ) ( not ( = ?auto_66713 ?auto_66707 ) ) ( not ( = ?auto_66704 ?auto_66707 ) ) ( not ( = ?auto_66710 ?auto_66707 ) ) ( not ( = ?auto_66716 ?auto_66705 ) ) ( not ( = ?auto_66722 ?auto_66716 ) ) ( not ( = ?auto_66718 ?auto_66716 ) ) ( not ( = ?auto_66703 ?auto_66716 ) ) ( HOIST-AT ?auto_66708 ?auto_66716 ) ( not ( = ?auto_66721 ?auto_66708 ) ) ( not ( = ?auto_66712 ?auto_66708 ) ) ( not ( = ?auto_66720 ?auto_66708 ) ) ( not ( = ?auto_66719 ?auto_66708 ) ) ( AVAILABLE ?auto_66708 ) ( SURFACE-AT ?auto_66704 ?auto_66716 ) ( ON ?auto_66704 ?auto_66711 ) ( CLEAR ?auto_66704 ) ( not ( = ?auto_66701 ?auto_66711 ) ) ( not ( = ?auto_66702 ?auto_66711 ) ) ( not ( = ?auto_66706 ?auto_66711 ) ) ( not ( = ?auto_66715 ?auto_66711 ) ) ( not ( = ?auto_66714 ?auto_66711 ) ) ( not ( = ?auto_66717 ?auto_66711 ) ) ( not ( = ?auto_66713 ?auto_66711 ) ) ( not ( = ?auto_66704 ?auto_66711 ) ) ( not ( = ?auto_66710 ?auto_66711 ) ) ( not ( = ?auto_66707 ?auto_66711 ) ) ( TRUCK-AT ?auto_66709 ?auto_66705 ) ( SURFACE-AT ?auto_66723 ?auto_66705 ) ( CLEAR ?auto_66723 ) ( IS-CRATE ?auto_66707 ) ( not ( = ?auto_66701 ?auto_66723 ) ) ( not ( = ?auto_66702 ?auto_66723 ) ) ( not ( = ?auto_66706 ?auto_66723 ) ) ( not ( = ?auto_66715 ?auto_66723 ) ) ( not ( = ?auto_66714 ?auto_66723 ) ) ( not ( = ?auto_66717 ?auto_66723 ) ) ( not ( = ?auto_66713 ?auto_66723 ) ) ( not ( = ?auto_66704 ?auto_66723 ) ) ( not ( = ?auto_66710 ?auto_66723 ) ) ( not ( = ?auto_66707 ?auto_66723 ) ) ( not ( = ?auto_66711 ?auto_66723 ) ) ( AVAILABLE ?auto_66721 ) ( IN ?auto_66707 ?auto_66709 ) )
    :subtasks
    ( ( !UNLOAD ?auto_66721 ?auto_66707 ?auto_66709 ?auto_66705 )
      ( MAKE-ON ?auto_66701 ?auto_66702 )
      ( MAKE-ON-VERIFY ?auto_66701 ?auto_66702 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_66724 - SURFACE
      ?auto_66725 - SURFACE
    )
    :vars
    (
      ?auto_66732 - HOIST
      ?auto_66746 - PLACE
      ?auto_66733 - PLACE
      ?auto_66737 - HOIST
      ?auto_66743 - SURFACE
      ?auto_66745 - SURFACE
      ?auto_66742 - PLACE
      ?auto_66729 - HOIST
      ?auto_66738 - SURFACE
      ?auto_66744 - SURFACE
      ?auto_66727 - SURFACE
      ?auto_66735 - SURFACE
      ?auto_66736 - PLACE
      ?auto_66741 - HOIST
      ?auto_66739 - SURFACE
      ?auto_66728 - SURFACE
      ?auto_66740 - PLACE
      ?auto_66734 - HOIST
      ?auto_66730 - SURFACE
      ?auto_66731 - SURFACE
      ?auto_66726 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_66732 ?auto_66746 ) ( IS-CRATE ?auto_66724 ) ( not ( = ?auto_66724 ?auto_66725 ) ) ( not ( = ?auto_66733 ?auto_66746 ) ) ( HOIST-AT ?auto_66737 ?auto_66733 ) ( not ( = ?auto_66732 ?auto_66737 ) ) ( AVAILABLE ?auto_66737 ) ( SURFACE-AT ?auto_66724 ?auto_66733 ) ( ON ?auto_66724 ?auto_66743 ) ( CLEAR ?auto_66724 ) ( not ( = ?auto_66724 ?auto_66743 ) ) ( not ( = ?auto_66725 ?auto_66743 ) ) ( IS-CRATE ?auto_66725 ) ( not ( = ?auto_66724 ?auto_66745 ) ) ( not ( = ?auto_66725 ?auto_66745 ) ) ( not ( = ?auto_66743 ?auto_66745 ) ) ( not ( = ?auto_66742 ?auto_66746 ) ) ( not ( = ?auto_66733 ?auto_66742 ) ) ( HOIST-AT ?auto_66729 ?auto_66742 ) ( not ( = ?auto_66732 ?auto_66729 ) ) ( not ( = ?auto_66737 ?auto_66729 ) ) ( SURFACE-AT ?auto_66725 ?auto_66742 ) ( ON ?auto_66725 ?auto_66738 ) ( CLEAR ?auto_66725 ) ( not ( = ?auto_66724 ?auto_66738 ) ) ( not ( = ?auto_66725 ?auto_66738 ) ) ( not ( = ?auto_66743 ?auto_66738 ) ) ( not ( = ?auto_66745 ?auto_66738 ) ) ( IS-CRATE ?auto_66745 ) ( not ( = ?auto_66724 ?auto_66744 ) ) ( not ( = ?auto_66725 ?auto_66744 ) ) ( not ( = ?auto_66743 ?auto_66744 ) ) ( not ( = ?auto_66745 ?auto_66744 ) ) ( not ( = ?auto_66738 ?auto_66744 ) ) ( AVAILABLE ?auto_66729 ) ( SURFACE-AT ?auto_66745 ?auto_66742 ) ( ON ?auto_66745 ?auto_66727 ) ( CLEAR ?auto_66745 ) ( not ( = ?auto_66724 ?auto_66727 ) ) ( not ( = ?auto_66725 ?auto_66727 ) ) ( not ( = ?auto_66743 ?auto_66727 ) ) ( not ( = ?auto_66745 ?auto_66727 ) ) ( not ( = ?auto_66738 ?auto_66727 ) ) ( not ( = ?auto_66744 ?auto_66727 ) ) ( IS-CRATE ?auto_66744 ) ( not ( = ?auto_66724 ?auto_66735 ) ) ( not ( = ?auto_66725 ?auto_66735 ) ) ( not ( = ?auto_66743 ?auto_66735 ) ) ( not ( = ?auto_66745 ?auto_66735 ) ) ( not ( = ?auto_66738 ?auto_66735 ) ) ( not ( = ?auto_66744 ?auto_66735 ) ) ( not ( = ?auto_66727 ?auto_66735 ) ) ( not ( = ?auto_66736 ?auto_66746 ) ) ( not ( = ?auto_66733 ?auto_66736 ) ) ( not ( = ?auto_66742 ?auto_66736 ) ) ( HOIST-AT ?auto_66741 ?auto_66736 ) ( not ( = ?auto_66732 ?auto_66741 ) ) ( not ( = ?auto_66737 ?auto_66741 ) ) ( not ( = ?auto_66729 ?auto_66741 ) ) ( AVAILABLE ?auto_66741 ) ( SURFACE-AT ?auto_66744 ?auto_66736 ) ( ON ?auto_66744 ?auto_66739 ) ( CLEAR ?auto_66744 ) ( not ( = ?auto_66724 ?auto_66739 ) ) ( not ( = ?auto_66725 ?auto_66739 ) ) ( not ( = ?auto_66743 ?auto_66739 ) ) ( not ( = ?auto_66745 ?auto_66739 ) ) ( not ( = ?auto_66738 ?auto_66739 ) ) ( not ( = ?auto_66744 ?auto_66739 ) ) ( not ( = ?auto_66727 ?auto_66739 ) ) ( not ( = ?auto_66735 ?auto_66739 ) ) ( IS-CRATE ?auto_66735 ) ( not ( = ?auto_66724 ?auto_66728 ) ) ( not ( = ?auto_66725 ?auto_66728 ) ) ( not ( = ?auto_66743 ?auto_66728 ) ) ( not ( = ?auto_66745 ?auto_66728 ) ) ( not ( = ?auto_66738 ?auto_66728 ) ) ( not ( = ?auto_66744 ?auto_66728 ) ) ( not ( = ?auto_66727 ?auto_66728 ) ) ( not ( = ?auto_66735 ?auto_66728 ) ) ( not ( = ?auto_66739 ?auto_66728 ) ) ( not ( = ?auto_66740 ?auto_66746 ) ) ( not ( = ?auto_66733 ?auto_66740 ) ) ( not ( = ?auto_66742 ?auto_66740 ) ) ( not ( = ?auto_66736 ?auto_66740 ) ) ( HOIST-AT ?auto_66734 ?auto_66740 ) ( not ( = ?auto_66732 ?auto_66734 ) ) ( not ( = ?auto_66737 ?auto_66734 ) ) ( not ( = ?auto_66729 ?auto_66734 ) ) ( not ( = ?auto_66741 ?auto_66734 ) ) ( AVAILABLE ?auto_66734 ) ( SURFACE-AT ?auto_66735 ?auto_66740 ) ( ON ?auto_66735 ?auto_66730 ) ( CLEAR ?auto_66735 ) ( not ( = ?auto_66724 ?auto_66730 ) ) ( not ( = ?auto_66725 ?auto_66730 ) ) ( not ( = ?auto_66743 ?auto_66730 ) ) ( not ( = ?auto_66745 ?auto_66730 ) ) ( not ( = ?auto_66738 ?auto_66730 ) ) ( not ( = ?auto_66744 ?auto_66730 ) ) ( not ( = ?auto_66727 ?auto_66730 ) ) ( not ( = ?auto_66735 ?auto_66730 ) ) ( not ( = ?auto_66739 ?auto_66730 ) ) ( not ( = ?auto_66728 ?auto_66730 ) ) ( SURFACE-AT ?auto_66731 ?auto_66746 ) ( CLEAR ?auto_66731 ) ( IS-CRATE ?auto_66728 ) ( not ( = ?auto_66724 ?auto_66731 ) ) ( not ( = ?auto_66725 ?auto_66731 ) ) ( not ( = ?auto_66743 ?auto_66731 ) ) ( not ( = ?auto_66745 ?auto_66731 ) ) ( not ( = ?auto_66738 ?auto_66731 ) ) ( not ( = ?auto_66744 ?auto_66731 ) ) ( not ( = ?auto_66727 ?auto_66731 ) ) ( not ( = ?auto_66735 ?auto_66731 ) ) ( not ( = ?auto_66739 ?auto_66731 ) ) ( not ( = ?auto_66728 ?auto_66731 ) ) ( not ( = ?auto_66730 ?auto_66731 ) ) ( AVAILABLE ?auto_66732 ) ( IN ?auto_66728 ?auto_66726 ) ( TRUCK-AT ?auto_66726 ?auto_66733 ) )
    :subtasks
    ( ( !DRIVE ?auto_66726 ?auto_66733 ?auto_66746 )
      ( MAKE-ON ?auto_66724 ?auto_66725 )
      ( MAKE-ON-VERIFY ?auto_66724 ?auto_66725 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_66747 - SURFACE
      ?auto_66748 - SURFACE
    )
    :vars
    (
      ?auto_66763 - HOIST
      ?auto_66755 - PLACE
      ?auto_66751 - PLACE
      ?auto_66761 - HOIST
      ?auto_66758 - SURFACE
      ?auto_66760 - SURFACE
      ?auto_66757 - PLACE
      ?auto_66764 - HOIST
      ?auto_66768 - SURFACE
      ?auto_66759 - SURFACE
      ?auto_66752 - SURFACE
      ?auto_66766 - SURFACE
      ?auto_66767 - PLACE
      ?auto_66756 - HOIST
      ?auto_66749 - SURFACE
      ?auto_66769 - SURFACE
      ?auto_66750 - PLACE
      ?auto_66753 - HOIST
      ?auto_66762 - SURFACE
      ?auto_66765 - SURFACE
      ?auto_66754 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_66763 ?auto_66755 ) ( IS-CRATE ?auto_66747 ) ( not ( = ?auto_66747 ?auto_66748 ) ) ( not ( = ?auto_66751 ?auto_66755 ) ) ( HOIST-AT ?auto_66761 ?auto_66751 ) ( not ( = ?auto_66763 ?auto_66761 ) ) ( SURFACE-AT ?auto_66747 ?auto_66751 ) ( ON ?auto_66747 ?auto_66758 ) ( CLEAR ?auto_66747 ) ( not ( = ?auto_66747 ?auto_66758 ) ) ( not ( = ?auto_66748 ?auto_66758 ) ) ( IS-CRATE ?auto_66748 ) ( not ( = ?auto_66747 ?auto_66760 ) ) ( not ( = ?auto_66748 ?auto_66760 ) ) ( not ( = ?auto_66758 ?auto_66760 ) ) ( not ( = ?auto_66757 ?auto_66755 ) ) ( not ( = ?auto_66751 ?auto_66757 ) ) ( HOIST-AT ?auto_66764 ?auto_66757 ) ( not ( = ?auto_66763 ?auto_66764 ) ) ( not ( = ?auto_66761 ?auto_66764 ) ) ( SURFACE-AT ?auto_66748 ?auto_66757 ) ( ON ?auto_66748 ?auto_66768 ) ( CLEAR ?auto_66748 ) ( not ( = ?auto_66747 ?auto_66768 ) ) ( not ( = ?auto_66748 ?auto_66768 ) ) ( not ( = ?auto_66758 ?auto_66768 ) ) ( not ( = ?auto_66760 ?auto_66768 ) ) ( IS-CRATE ?auto_66760 ) ( not ( = ?auto_66747 ?auto_66759 ) ) ( not ( = ?auto_66748 ?auto_66759 ) ) ( not ( = ?auto_66758 ?auto_66759 ) ) ( not ( = ?auto_66760 ?auto_66759 ) ) ( not ( = ?auto_66768 ?auto_66759 ) ) ( AVAILABLE ?auto_66764 ) ( SURFACE-AT ?auto_66760 ?auto_66757 ) ( ON ?auto_66760 ?auto_66752 ) ( CLEAR ?auto_66760 ) ( not ( = ?auto_66747 ?auto_66752 ) ) ( not ( = ?auto_66748 ?auto_66752 ) ) ( not ( = ?auto_66758 ?auto_66752 ) ) ( not ( = ?auto_66760 ?auto_66752 ) ) ( not ( = ?auto_66768 ?auto_66752 ) ) ( not ( = ?auto_66759 ?auto_66752 ) ) ( IS-CRATE ?auto_66759 ) ( not ( = ?auto_66747 ?auto_66766 ) ) ( not ( = ?auto_66748 ?auto_66766 ) ) ( not ( = ?auto_66758 ?auto_66766 ) ) ( not ( = ?auto_66760 ?auto_66766 ) ) ( not ( = ?auto_66768 ?auto_66766 ) ) ( not ( = ?auto_66759 ?auto_66766 ) ) ( not ( = ?auto_66752 ?auto_66766 ) ) ( not ( = ?auto_66767 ?auto_66755 ) ) ( not ( = ?auto_66751 ?auto_66767 ) ) ( not ( = ?auto_66757 ?auto_66767 ) ) ( HOIST-AT ?auto_66756 ?auto_66767 ) ( not ( = ?auto_66763 ?auto_66756 ) ) ( not ( = ?auto_66761 ?auto_66756 ) ) ( not ( = ?auto_66764 ?auto_66756 ) ) ( AVAILABLE ?auto_66756 ) ( SURFACE-AT ?auto_66759 ?auto_66767 ) ( ON ?auto_66759 ?auto_66749 ) ( CLEAR ?auto_66759 ) ( not ( = ?auto_66747 ?auto_66749 ) ) ( not ( = ?auto_66748 ?auto_66749 ) ) ( not ( = ?auto_66758 ?auto_66749 ) ) ( not ( = ?auto_66760 ?auto_66749 ) ) ( not ( = ?auto_66768 ?auto_66749 ) ) ( not ( = ?auto_66759 ?auto_66749 ) ) ( not ( = ?auto_66752 ?auto_66749 ) ) ( not ( = ?auto_66766 ?auto_66749 ) ) ( IS-CRATE ?auto_66766 ) ( not ( = ?auto_66747 ?auto_66769 ) ) ( not ( = ?auto_66748 ?auto_66769 ) ) ( not ( = ?auto_66758 ?auto_66769 ) ) ( not ( = ?auto_66760 ?auto_66769 ) ) ( not ( = ?auto_66768 ?auto_66769 ) ) ( not ( = ?auto_66759 ?auto_66769 ) ) ( not ( = ?auto_66752 ?auto_66769 ) ) ( not ( = ?auto_66766 ?auto_66769 ) ) ( not ( = ?auto_66749 ?auto_66769 ) ) ( not ( = ?auto_66750 ?auto_66755 ) ) ( not ( = ?auto_66751 ?auto_66750 ) ) ( not ( = ?auto_66757 ?auto_66750 ) ) ( not ( = ?auto_66767 ?auto_66750 ) ) ( HOIST-AT ?auto_66753 ?auto_66750 ) ( not ( = ?auto_66763 ?auto_66753 ) ) ( not ( = ?auto_66761 ?auto_66753 ) ) ( not ( = ?auto_66764 ?auto_66753 ) ) ( not ( = ?auto_66756 ?auto_66753 ) ) ( AVAILABLE ?auto_66753 ) ( SURFACE-AT ?auto_66766 ?auto_66750 ) ( ON ?auto_66766 ?auto_66762 ) ( CLEAR ?auto_66766 ) ( not ( = ?auto_66747 ?auto_66762 ) ) ( not ( = ?auto_66748 ?auto_66762 ) ) ( not ( = ?auto_66758 ?auto_66762 ) ) ( not ( = ?auto_66760 ?auto_66762 ) ) ( not ( = ?auto_66768 ?auto_66762 ) ) ( not ( = ?auto_66759 ?auto_66762 ) ) ( not ( = ?auto_66752 ?auto_66762 ) ) ( not ( = ?auto_66766 ?auto_66762 ) ) ( not ( = ?auto_66749 ?auto_66762 ) ) ( not ( = ?auto_66769 ?auto_66762 ) ) ( SURFACE-AT ?auto_66765 ?auto_66755 ) ( CLEAR ?auto_66765 ) ( IS-CRATE ?auto_66769 ) ( not ( = ?auto_66747 ?auto_66765 ) ) ( not ( = ?auto_66748 ?auto_66765 ) ) ( not ( = ?auto_66758 ?auto_66765 ) ) ( not ( = ?auto_66760 ?auto_66765 ) ) ( not ( = ?auto_66768 ?auto_66765 ) ) ( not ( = ?auto_66759 ?auto_66765 ) ) ( not ( = ?auto_66752 ?auto_66765 ) ) ( not ( = ?auto_66766 ?auto_66765 ) ) ( not ( = ?auto_66749 ?auto_66765 ) ) ( not ( = ?auto_66769 ?auto_66765 ) ) ( not ( = ?auto_66762 ?auto_66765 ) ) ( AVAILABLE ?auto_66763 ) ( TRUCK-AT ?auto_66754 ?auto_66751 ) ( LIFTING ?auto_66761 ?auto_66769 ) )
    :subtasks
    ( ( !LOAD ?auto_66761 ?auto_66769 ?auto_66754 ?auto_66751 )
      ( MAKE-ON ?auto_66747 ?auto_66748 )
      ( MAKE-ON-VERIFY ?auto_66747 ?auto_66748 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_66770 - SURFACE
      ?auto_66771 - SURFACE
    )
    :vars
    (
      ?auto_66772 - HOIST
      ?auto_66775 - PLACE
      ?auto_66778 - PLACE
      ?auto_66789 - HOIST
      ?auto_66776 - SURFACE
      ?auto_66790 - SURFACE
      ?auto_66784 - PLACE
      ?auto_66779 - HOIST
      ?auto_66783 - SURFACE
      ?auto_66791 - SURFACE
      ?auto_66787 - SURFACE
      ?auto_66774 - SURFACE
      ?auto_66782 - PLACE
      ?auto_66785 - HOIST
      ?auto_66773 - SURFACE
      ?auto_66792 - SURFACE
      ?auto_66786 - PLACE
      ?auto_66788 - HOIST
      ?auto_66777 - SURFACE
      ?auto_66781 - SURFACE
      ?auto_66780 - TRUCK
      ?auto_66793 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_66772 ?auto_66775 ) ( IS-CRATE ?auto_66770 ) ( not ( = ?auto_66770 ?auto_66771 ) ) ( not ( = ?auto_66778 ?auto_66775 ) ) ( HOIST-AT ?auto_66789 ?auto_66778 ) ( not ( = ?auto_66772 ?auto_66789 ) ) ( SURFACE-AT ?auto_66770 ?auto_66778 ) ( ON ?auto_66770 ?auto_66776 ) ( CLEAR ?auto_66770 ) ( not ( = ?auto_66770 ?auto_66776 ) ) ( not ( = ?auto_66771 ?auto_66776 ) ) ( IS-CRATE ?auto_66771 ) ( not ( = ?auto_66770 ?auto_66790 ) ) ( not ( = ?auto_66771 ?auto_66790 ) ) ( not ( = ?auto_66776 ?auto_66790 ) ) ( not ( = ?auto_66784 ?auto_66775 ) ) ( not ( = ?auto_66778 ?auto_66784 ) ) ( HOIST-AT ?auto_66779 ?auto_66784 ) ( not ( = ?auto_66772 ?auto_66779 ) ) ( not ( = ?auto_66789 ?auto_66779 ) ) ( SURFACE-AT ?auto_66771 ?auto_66784 ) ( ON ?auto_66771 ?auto_66783 ) ( CLEAR ?auto_66771 ) ( not ( = ?auto_66770 ?auto_66783 ) ) ( not ( = ?auto_66771 ?auto_66783 ) ) ( not ( = ?auto_66776 ?auto_66783 ) ) ( not ( = ?auto_66790 ?auto_66783 ) ) ( IS-CRATE ?auto_66790 ) ( not ( = ?auto_66770 ?auto_66791 ) ) ( not ( = ?auto_66771 ?auto_66791 ) ) ( not ( = ?auto_66776 ?auto_66791 ) ) ( not ( = ?auto_66790 ?auto_66791 ) ) ( not ( = ?auto_66783 ?auto_66791 ) ) ( AVAILABLE ?auto_66779 ) ( SURFACE-AT ?auto_66790 ?auto_66784 ) ( ON ?auto_66790 ?auto_66787 ) ( CLEAR ?auto_66790 ) ( not ( = ?auto_66770 ?auto_66787 ) ) ( not ( = ?auto_66771 ?auto_66787 ) ) ( not ( = ?auto_66776 ?auto_66787 ) ) ( not ( = ?auto_66790 ?auto_66787 ) ) ( not ( = ?auto_66783 ?auto_66787 ) ) ( not ( = ?auto_66791 ?auto_66787 ) ) ( IS-CRATE ?auto_66791 ) ( not ( = ?auto_66770 ?auto_66774 ) ) ( not ( = ?auto_66771 ?auto_66774 ) ) ( not ( = ?auto_66776 ?auto_66774 ) ) ( not ( = ?auto_66790 ?auto_66774 ) ) ( not ( = ?auto_66783 ?auto_66774 ) ) ( not ( = ?auto_66791 ?auto_66774 ) ) ( not ( = ?auto_66787 ?auto_66774 ) ) ( not ( = ?auto_66782 ?auto_66775 ) ) ( not ( = ?auto_66778 ?auto_66782 ) ) ( not ( = ?auto_66784 ?auto_66782 ) ) ( HOIST-AT ?auto_66785 ?auto_66782 ) ( not ( = ?auto_66772 ?auto_66785 ) ) ( not ( = ?auto_66789 ?auto_66785 ) ) ( not ( = ?auto_66779 ?auto_66785 ) ) ( AVAILABLE ?auto_66785 ) ( SURFACE-AT ?auto_66791 ?auto_66782 ) ( ON ?auto_66791 ?auto_66773 ) ( CLEAR ?auto_66791 ) ( not ( = ?auto_66770 ?auto_66773 ) ) ( not ( = ?auto_66771 ?auto_66773 ) ) ( not ( = ?auto_66776 ?auto_66773 ) ) ( not ( = ?auto_66790 ?auto_66773 ) ) ( not ( = ?auto_66783 ?auto_66773 ) ) ( not ( = ?auto_66791 ?auto_66773 ) ) ( not ( = ?auto_66787 ?auto_66773 ) ) ( not ( = ?auto_66774 ?auto_66773 ) ) ( IS-CRATE ?auto_66774 ) ( not ( = ?auto_66770 ?auto_66792 ) ) ( not ( = ?auto_66771 ?auto_66792 ) ) ( not ( = ?auto_66776 ?auto_66792 ) ) ( not ( = ?auto_66790 ?auto_66792 ) ) ( not ( = ?auto_66783 ?auto_66792 ) ) ( not ( = ?auto_66791 ?auto_66792 ) ) ( not ( = ?auto_66787 ?auto_66792 ) ) ( not ( = ?auto_66774 ?auto_66792 ) ) ( not ( = ?auto_66773 ?auto_66792 ) ) ( not ( = ?auto_66786 ?auto_66775 ) ) ( not ( = ?auto_66778 ?auto_66786 ) ) ( not ( = ?auto_66784 ?auto_66786 ) ) ( not ( = ?auto_66782 ?auto_66786 ) ) ( HOIST-AT ?auto_66788 ?auto_66786 ) ( not ( = ?auto_66772 ?auto_66788 ) ) ( not ( = ?auto_66789 ?auto_66788 ) ) ( not ( = ?auto_66779 ?auto_66788 ) ) ( not ( = ?auto_66785 ?auto_66788 ) ) ( AVAILABLE ?auto_66788 ) ( SURFACE-AT ?auto_66774 ?auto_66786 ) ( ON ?auto_66774 ?auto_66777 ) ( CLEAR ?auto_66774 ) ( not ( = ?auto_66770 ?auto_66777 ) ) ( not ( = ?auto_66771 ?auto_66777 ) ) ( not ( = ?auto_66776 ?auto_66777 ) ) ( not ( = ?auto_66790 ?auto_66777 ) ) ( not ( = ?auto_66783 ?auto_66777 ) ) ( not ( = ?auto_66791 ?auto_66777 ) ) ( not ( = ?auto_66787 ?auto_66777 ) ) ( not ( = ?auto_66774 ?auto_66777 ) ) ( not ( = ?auto_66773 ?auto_66777 ) ) ( not ( = ?auto_66792 ?auto_66777 ) ) ( SURFACE-AT ?auto_66781 ?auto_66775 ) ( CLEAR ?auto_66781 ) ( IS-CRATE ?auto_66792 ) ( not ( = ?auto_66770 ?auto_66781 ) ) ( not ( = ?auto_66771 ?auto_66781 ) ) ( not ( = ?auto_66776 ?auto_66781 ) ) ( not ( = ?auto_66790 ?auto_66781 ) ) ( not ( = ?auto_66783 ?auto_66781 ) ) ( not ( = ?auto_66791 ?auto_66781 ) ) ( not ( = ?auto_66787 ?auto_66781 ) ) ( not ( = ?auto_66774 ?auto_66781 ) ) ( not ( = ?auto_66773 ?auto_66781 ) ) ( not ( = ?auto_66792 ?auto_66781 ) ) ( not ( = ?auto_66777 ?auto_66781 ) ) ( AVAILABLE ?auto_66772 ) ( TRUCK-AT ?auto_66780 ?auto_66778 ) ( AVAILABLE ?auto_66789 ) ( SURFACE-AT ?auto_66792 ?auto_66778 ) ( ON ?auto_66792 ?auto_66793 ) ( CLEAR ?auto_66792 ) ( not ( = ?auto_66770 ?auto_66793 ) ) ( not ( = ?auto_66771 ?auto_66793 ) ) ( not ( = ?auto_66776 ?auto_66793 ) ) ( not ( = ?auto_66790 ?auto_66793 ) ) ( not ( = ?auto_66783 ?auto_66793 ) ) ( not ( = ?auto_66791 ?auto_66793 ) ) ( not ( = ?auto_66787 ?auto_66793 ) ) ( not ( = ?auto_66774 ?auto_66793 ) ) ( not ( = ?auto_66773 ?auto_66793 ) ) ( not ( = ?auto_66792 ?auto_66793 ) ) ( not ( = ?auto_66777 ?auto_66793 ) ) ( not ( = ?auto_66781 ?auto_66793 ) ) )
    :subtasks
    ( ( !LIFT ?auto_66789 ?auto_66792 ?auto_66793 ?auto_66778 )
      ( MAKE-ON ?auto_66770 ?auto_66771 )
      ( MAKE-ON-VERIFY ?auto_66770 ?auto_66771 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_66794 - SURFACE
      ?auto_66795 - SURFACE
    )
    :vars
    (
      ?auto_66797 - HOIST
      ?auto_66814 - PLACE
      ?auto_66807 - PLACE
      ?auto_66816 - HOIST
      ?auto_66808 - SURFACE
      ?auto_66817 - SURFACE
      ?auto_66810 - PLACE
      ?auto_66804 - HOIST
      ?auto_66809 - SURFACE
      ?auto_66800 - SURFACE
      ?auto_66798 - SURFACE
      ?auto_66815 - SURFACE
      ?auto_66812 - PLACE
      ?auto_66803 - HOIST
      ?auto_66796 - SURFACE
      ?auto_66799 - SURFACE
      ?auto_66806 - PLACE
      ?auto_66801 - HOIST
      ?auto_66805 - SURFACE
      ?auto_66811 - SURFACE
      ?auto_66813 - SURFACE
      ?auto_66802 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_66797 ?auto_66814 ) ( IS-CRATE ?auto_66794 ) ( not ( = ?auto_66794 ?auto_66795 ) ) ( not ( = ?auto_66807 ?auto_66814 ) ) ( HOIST-AT ?auto_66816 ?auto_66807 ) ( not ( = ?auto_66797 ?auto_66816 ) ) ( SURFACE-AT ?auto_66794 ?auto_66807 ) ( ON ?auto_66794 ?auto_66808 ) ( CLEAR ?auto_66794 ) ( not ( = ?auto_66794 ?auto_66808 ) ) ( not ( = ?auto_66795 ?auto_66808 ) ) ( IS-CRATE ?auto_66795 ) ( not ( = ?auto_66794 ?auto_66817 ) ) ( not ( = ?auto_66795 ?auto_66817 ) ) ( not ( = ?auto_66808 ?auto_66817 ) ) ( not ( = ?auto_66810 ?auto_66814 ) ) ( not ( = ?auto_66807 ?auto_66810 ) ) ( HOIST-AT ?auto_66804 ?auto_66810 ) ( not ( = ?auto_66797 ?auto_66804 ) ) ( not ( = ?auto_66816 ?auto_66804 ) ) ( SURFACE-AT ?auto_66795 ?auto_66810 ) ( ON ?auto_66795 ?auto_66809 ) ( CLEAR ?auto_66795 ) ( not ( = ?auto_66794 ?auto_66809 ) ) ( not ( = ?auto_66795 ?auto_66809 ) ) ( not ( = ?auto_66808 ?auto_66809 ) ) ( not ( = ?auto_66817 ?auto_66809 ) ) ( IS-CRATE ?auto_66817 ) ( not ( = ?auto_66794 ?auto_66800 ) ) ( not ( = ?auto_66795 ?auto_66800 ) ) ( not ( = ?auto_66808 ?auto_66800 ) ) ( not ( = ?auto_66817 ?auto_66800 ) ) ( not ( = ?auto_66809 ?auto_66800 ) ) ( AVAILABLE ?auto_66804 ) ( SURFACE-AT ?auto_66817 ?auto_66810 ) ( ON ?auto_66817 ?auto_66798 ) ( CLEAR ?auto_66817 ) ( not ( = ?auto_66794 ?auto_66798 ) ) ( not ( = ?auto_66795 ?auto_66798 ) ) ( not ( = ?auto_66808 ?auto_66798 ) ) ( not ( = ?auto_66817 ?auto_66798 ) ) ( not ( = ?auto_66809 ?auto_66798 ) ) ( not ( = ?auto_66800 ?auto_66798 ) ) ( IS-CRATE ?auto_66800 ) ( not ( = ?auto_66794 ?auto_66815 ) ) ( not ( = ?auto_66795 ?auto_66815 ) ) ( not ( = ?auto_66808 ?auto_66815 ) ) ( not ( = ?auto_66817 ?auto_66815 ) ) ( not ( = ?auto_66809 ?auto_66815 ) ) ( not ( = ?auto_66800 ?auto_66815 ) ) ( not ( = ?auto_66798 ?auto_66815 ) ) ( not ( = ?auto_66812 ?auto_66814 ) ) ( not ( = ?auto_66807 ?auto_66812 ) ) ( not ( = ?auto_66810 ?auto_66812 ) ) ( HOIST-AT ?auto_66803 ?auto_66812 ) ( not ( = ?auto_66797 ?auto_66803 ) ) ( not ( = ?auto_66816 ?auto_66803 ) ) ( not ( = ?auto_66804 ?auto_66803 ) ) ( AVAILABLE ?auto_66803 ) ( SURFACE-AT ?auto_66800 ?auto_66812 ) ( ON ?auto_66800 ?auto_66796 ) ( CLEAR ?auto_66800 ) ( not ( = ?auto_66794 ?auto_66796 ) ) ( not ( = ?auto_66795 ?auto_66796 ) ) ( not ( = ?auto_66808 ?auto_66796 ) ) ( not ( = ?auto_66817 ?auto_66796 ) ) ( not ( = ?auto_66809 ?auto_66796 ) ) ( not ( = ?auto_66800 ?auto_66796 ) ) ( not ( = ?auto_66798 ?auto_66796 ) ) ( not ( = ?auto_66815 ?auto_66796 ) ) ( IS-CRATE ?auto_66815 ) ( not ( = ?auto_66794 ?auto_66799 ) ) ( not ( = ?auto_66795 ?auto_66799 ) ) ( not ( = ?auto_66808 ?auto_66799 ) ) ( not ( = ?auto_66817 ?auto_66799 ) ) ( not ( = ?auto_66809 ?auto_66799 ) ) ( not ( = ?auto_66800 ?auto_66799 ) ) ( not ( = ?auto_66798 ?auto_66799 ) ) ( not ( = ?auto_66815 ?auto_66799 ) ) ( not ( = ?auto_66796 ?auto_66799 ) ) ( not ( = ?auto_66806 ?auto_66814 ) ) ( not ( = ?auto_66807 ?auto_66806 ) ) ( not ( = ?auto_66810 ?auto_66806 ) ) ( not ( = ?auto_66812 ?auto_66806 ) ) ( HOIST-AT ?auto_66801 ?auto_66806 ) ( not ( = ?auto_66797 ?auto_66801 ) ) ( not ( = ?auto_66816 ?auto_66801 ) ) ( not ( = ?auto_66804 ?auto_66801 ) ) ( not ( = ?auto_66803 ?auto_66801 ) ) ( AVAILABLE ?auto_66801 ) ( SURFACE-AT ?auto_66815 ?auto_66806 ) ( ON ?auto_66815 ?auto_66805 ) ( CLEAR ?auto_66815 ) ( not ( = ?auto_66794 ?auto_66805 ) ) ( not ( = ?auto_66795 ?auto_66805 ) ) ( not ( = ?auto_66808 ?auto_66805 ) ) ( not ( = ?auto_66817 ?auto_66805 ) ) ( not ( = ?auto_66809 ?auto_66805 ) ) ( not ( = ?auto_66800 ?auto_66805 ) ) ( not ( = ?auto_66798 ?auto_66805 ) ) ( not ( = ?auto_66815 ?auto_66805 ) ) ( not ( = ?auto_66796 ?auto_66805 ) ) ( not ( = ?auto_66799 ?auto_66805 ) ) ( SURFACE-AT ?auto_66811 ?auto_66814 ) ( CLEAR ?auto_66811 ) ( IS-CRATE ?auto_66799 ) ( not ( = ?auto_66794 ?auto_66811 ) ) ( not ( = ?auto_66795 ?auto_66811 ) ) ( not ( = ?auto_66808 ?auto_66811 ) ) ( not ( = ?auto_66817 ?auto_66811 ) ) ( not ( = ?auto_66809 ?auto_66811 ) ) ( not ( = ?auto_66800 ?auto_66811 ) ) ( not ( = ?auto_66798 ?auto_66811 ) ) ( not ( = ?auto_66815 ?auto_66811 ) ) ( not ( = ?auto_66796 ?auto_66811 ) ) ( not ( = ?auto_66799 ?auto_66811 ) ) ( not ( = ?auto_66805 ?auto_66811 ) ) ( AVAILABLE ?auto_66797 ) ( AVAILABLE ?auto_66816 ) ( SURFACE-AT ?auto_66799 ?auto_66807 ) ( ON ?auto_66799 ?auto_66813 ) ( CLEAR ?auto_66799 ) ( not ( = ?auto_66794 ?auto_66813 ) ) ( not ( = ?auto_66795 ?auto_66813 ) ) ( not ( = ?auto_66808 ?auto_66813 ) ) ( not ( = ?auto_66817 ?auto_66813 ) ) ( not ( = ?auto_66809 ?auto_66813 ) ) ( not ( = ?auto_66800 ?auto_66813 ) ) ( not ( = ?auto_66798 ?auto_66813 ) ) ( not ( = ?auto_66815 ?auto_66813 ) ) ( not ( = ?auto_66796 ?auto_66813 ) ) ( not ( = ?auto_66799 ?auto_66813 ) ) ( not ( = ?auto_66805 ?auto_66813 ) ) ( not ( = ?auto_66811 ?auto_66813 ) ) ( TRUCK-AT ?auto_66802 ?auto_66814 ) )
    :subtasks
    ( ( !DRIVE ?auto_66802 ?auto_66814 ?auto_66807 )
      ( MAKE-ON ?auto_66794 ?auto_66795 )
      ( MAKE-ON-VERIFY ?auto_66794 ?auto_66795 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_66818 - SURFACE
      ?auto_66819 - SURFACE
    )
    :vars
    (
      ?auto_66824 - HOIST
      ?auto_66832 - PLACE
      ?auto_66827 - PLACE
      ?auto_66841 - HOIST
      ?auto_66820 - SURFACE
      ?auto_66840 - SURFACE
      ?auto_66838 - PLACE
      ?auto_66823 - HOIST
      ?auto_66830 - SURFACE
      ?auto_66829 - SURFACE
      ?auto_66836 - SURFACE
      ?auto_66839 - SURFACE
      ?auto_66833 - PLACE
      ?auto_66826 - HOIST
      ?auto_66835 - SURFACE
      ?auto_66825 - SURFACE
      ?auto_66828 - PLACE
      ?auto_66831 - HOIST
      ?auto_66834 - SURFACE
      ?auto_66821 - SURFACE
      ?auto_66837 - SURFACE
      ?auto_66822 - TRUCK
      ?auto_66842 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_66824 ?auto_66832 ) ( IS-CRATE ?auto_66818 ) ( not ( = ?auto_66818 ?auto_66819 ) ) ( not ( = ?auto_66827 ?auto_66832 ) ) ( HOIST-AT ?auto_66841 ?auto_66827 ) ( not ( = ?auto_66824 ?auto_66841 ) ) ( SURFACE-AT ?auto_66818 ?auto_66827 ) ( ON ?auto_66818 ?auto_66820 ) ( CLEAR ?auto_66818 ) ( not ( = ?auto_66818 ?auto_66820 ) ) ( not ( = ?auto_66819 ?auto_66820 ) ) ( IS-CRATE ?auto_66819 ) ( not ( = ?auto_66818 ?auto_66840 ) ) ( not ( = ?auto_66819 ?auto_66840 ) ) ( not ( = ?auto_66820 ?auto_66840 ) ) ( not ( = ?auto_66838 ?auto_66832 ) ) ( not ( = ?auto_66827 ?auto_66838 ) ) ( HOIST-AT ?auto_66823 ?auto_66838 ) ( not ( = ?auto_66824 ?auto_66823 ) ) ( not ( = ?auto_66841 ?auto_66823 ) ) ( SURFACE-AT ?auto_66819 ?auto_66838 ) ( ON ?auto_66819 ?auto_66830 ) ( CLEAR ?auto_66819 ) ( not ( = ?auto_66818 ?auto_66830 ) ) ( not ( = ?auto_66819 ?auto_66830 ) ) ( not ( = ?auto_66820 ?auto_66830 ) ) ( not ( = ?auto_66840 ?auto_66830 ) ) ( IS-CRATE ?auto_66840 ) ( not ( = ?auto_66818 ?auto_66829 ) ) ( not ( = ?auto_66819 ?auto_66829 ) ) ( not ( = ?auto_66820 ?auto_66829 ) ) ( not ( = ?auto_66840 ?auto_66829 ) ) ( not ( = ?auto_66830 ?auto_66829 ) ) ( AVAILABLE ?auto_66823 ) ( SURFACE-AT ?auto_66840 ?auto_66838 ) ( ON ?auto_66840 ?auto_66836 ) ( CLEAR ?auto_66840 ) ( not ( = ?auto_66818 ?auto_66836 ) ) ( not ( = ?auto_66819 ?auto_66836 ) ) ( not ( = ?auto_66820 ?auto_66836 ) ) ( not ( = ?auto_66840 ?auto_66836 ) ) ( not ( = ?auto_66830 ?auto_66836 ) ) ( not ( = ?auto_66829 ?auto_66836 ) ) ( IS-CRATE ?auto_66829 ) ( not ( = ?auto_66818 ?auto_66839 ) ) ( not ( = ?auto_66819 ?auto_66839 ) ) ( not ( = ?auto_66820 ?auto_66839 ) ) ( not ( = ?auto_66840 ?auto_66839 ) ) ( not ( = ?auto_66830 ?auto_66839 ) ) ( not ( = ?auto_66829 ?auto_66839 ) ) ( not ( = ?auto_66836 ?auto_66839 ) ) ( not ( = ?auto_66833 ?auto_66832 ) ) ( not ( = ?auto_66827 ?auto_66833 ) ) ( not ( = ?auto_66838 ?auto_66833 ) ) ( HOIST-AT ?auto_66826 ?auto_66833 ) ( not ( = ?auto_66824 ?auto_66826 ) ) ( not ( = ?auto_66841 ?auto_66826 ) ) ( not ( = ?auto_66823 ?auto_66826 ) ) ( AVAILABLE ?auto_66826 ) ( SURFACE-AT ?auto_66829 ?auto_66833 ) ( ON ?auto_66829 ?auto_66835 ) ( CLEAR ?auto_66829 ) ( not ( = ?auto_66818 ?auto_66835 ) ) ( not ( = ?auto_66819 ?auto_66835 ) ) ( not ( = ?auto_66820 ?auto_66835 ) ) ( not ( = ?auto_66840 ?auto_66835 ) ) ( not ( = ?auto_66830 ?auto_66835 ) ) ( not ( = ?auto_66829 ?auto_66835 ) ) ( not ( = ?auto_66836 ?auto_66835 ) ) ( not ( = ?auto_66839 ?auto_66835 ) ) ( IS-CRATE ?auto_66839 ) ( not ( = ?auto_66818 ?auto_66825 ) ) ( not ( = ?auto_66819 ?auto_66825 ) ) ( not ( = ?auto_66820 ?auto_66825 ) ) ( not ( = ?auto_66840 ?auto_66825 ) ) ( not ( = ?auto_66830 ?auto_66825 ) ) ( not ( = ?auto_66829 ?auto_66825 ) ) ( not ( = ?auto_66836 ?auto_66825 ) ) ( not ( = ?auto_66839 ?auto_66825 ) ) ( not ( = ?auto_66835 ?auto_66825 ) ) ( not ( = ?auto_66828 ?auto_66832 ) ) ( not ( = ?auto_66827 ?auto_66828 ) ) ( not ( = ?auto_66838 ?auto_66828 ) ) ( not ( = ?auto_66833 ?auto_66828 ) ) ( HOIST-AT ?auto_66831 ?auto_66828 ) ( not ( = ?auto_66824 ?auto_66831 ) ) ( not ( = ?auto_66841 ?auto_66831 ) ) ( not ( = ?auto_66823 ?auto_66831 ) ) ( not ( = ?auto_66826 ?auto_66831 ) ) ( AVAILABLE ?auto_66831 ) ( SURFACE-AT ?auto_66839 ?auto_66828 ) ( ON ?auto_66839 ?auto_66834 ) ( CLEAR ?auto_66839 ) ( not ( = ?auto_66818 ?auto_66834 ) ) ( not ( = ?auto_66819 ?auto_66834 ) ) ( not ( = ?auto_66820 ?auto_66834 ) ) ( not ( = ?auto_66840 ?auto_66834 ) ) ( not ( = ?auto_66830 ?auto_66834 ) ) ( not ( = ?auto_66829 ?auto_66834 ) ) ( not ( = ?auto_66836 ?auto_66834 ) ) ( not ( = ?auto_66839 ?auto_66834 ) ) ( not ( = ?auto_66835 ?auto_66834 ) ) ( not ( = ?auto_66825 ?auto_66834 ) ) ( IS-CRATE ?auto_66825 ) ( not ( = ?auto_66818 ?auto_66821 ) ) ( not ( = ?auto_66819 ?auto_66821 ) ) ( not ( = ?auto_66820 ?auto_66821 ) ) ( not ( = ?auto_66840 ?auto_66821 ) ) ( not ( = ?auto_66830 ?auto_66821 ) ) ( not ( = ?auto_66829 ?auto_66821 ) ) ( not ( = ?auto_66836 ?auto_66821 ) ) ( not ( = ?auto_66839 ?auto_66821 ) ) ( not ( = ?auto_66835 ?auto_66821 ) ) ( not ( = ?auto_66825 ?auto_66821 ) ) ( not ( = ?auto_66834 ?auto_66821 ) ) ( AVAILABLE ?auto_66841 ) ( SURFACE-AT ?auto_66825 ?auto_66827 ) ( ON ?auto_66825 ?auto_66837 ) ( CLEAR ?auto_66825 ) ( not ( = ?auto_66818 ?auto_66837 ) ) ( not ( = ?auto_66819 ?auto_66837 ) ) ( not ( = ?auto_66820 ?auto_66837 ) ) ( not ( = ?auto_66840 ?auto_66837 ) ) ( not ( = ?auto_66830 ?auto_66837 ) ) ( not ( = ?auto_66829 ?auto_66837 ) ) ( not ( = ?auto_66836 ?auto_66837 ) ) ( not ( = ?auto_66839 ?auto_66837 ) ) ( not ( = ?auto_66835 ?auto_66837 ) ) ( not ( = ?auto_66825 ?auto_66837 ) ) ( not ( = ?auto_66834 ?auto_66837 ) ) ( not ( = ?auto_66821 ?auto_66837 ) ) ( TRUCK-AT ?auto_66822 ?auto_66832 ) ( SURFACE-AT ?auto_66842 ?auto_66832 ) ( CLEAR ?auto_66842 ) ( LIFTING ?auto_66824 ?auto_66821 ) ( IS-CRATE ?auto_66821 ) ( not ( = ?auto_66818 ?auto_66842 ) ) ( not ( = ?auto_66819 ?auto_66842 ) ) ( not ( = ?auto_66820 ?auto_66842 ) ) ( not ( = ?auto_66840 ?auto_66842 ) ) ( not ( = ?auto_66830 ?auto_66842 ) ) ( not ( = ?auto_66829 ?auto_66842 ) ) ( not ( = ?auto_66836 ?auto_66842 ) ) ( not ( = ?auto_66839 ?auto_66842 ) ) ( not ( = ?auto_66835 ?auto_66842 ) ) ( not ( = ?auto_66825 ?auto_66842 ) ) ( not ( = ?auto_66834 ?auto_66842 ) ) ( not ( = ?auto_66821 ?auto_66842 ) ) ( not ( = ?auto_66837 ?auto_66842 ) ) )
    :subtasks
    ( ( !DROP ?auto_66824 ?auto_66821 ?auto_66842 ?auto_66832 )
      ( MAKE-ON ?auto_66818 ?auto_66819 )
      ( MAKE-ON-VERIFY ?auto_66818 ?auto_66819 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_66843 - SURFACE
      ?auto_66844 - SURFACE
    )
    :vars
    (
      ?auto_66863 - HOIST
      ?auto_66855 - PLACE
      ?auto_66858 - PLACE
      ?auto_66849 - HOIST
      ?auto_66866 - SURFACE
      ?auto_66848 - SURFACE
      ?auto_66846 - PLACE
      ?auto_66853 - HOIST
      ?auto_66852 - SURFACE
      ?auto_66859 - SURFACE
      ?auto_66850 - SURFACE
      ?auto_66854 - SURFACE
      ?auto_66857 - PLACE
      ?auto_66861 - HOIST
      ?auto_66860 - SURFACE
      ?auto_66851 - SURFACE
      ?auto_66865 - PLACE
      ?auto_66856 - HOIST
      ?auto_66864 - SURFACE
      ?auto_66862 - SURFACE
      ?auto_66845 - SURFACE
      ?auto_66847 - TRUCK
      ?auto_66867 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_66863 ?auto_66855 ) ( IS-CRATE ?auto_66843 ) ( not ( = ?auto_66843 ?auto_66844 ) ) ( not ( = ?auto_66858 ?auto_66855 ) ) ( HOIST-AT ?auto_66849 ?auto_66858 ) ( not ( = ?auto_66863 ?auto_66849 ) ) ( SURFACE-AT ?auto_66843 ?auto_66858 ) ( ON ?auto_66843 ?auto_66866 ) ( CLEAR ?auto_66843 ) ( not ( = ?auto_66843 ?auto_66866 ) ) ( not ( = ?auto_66844 ?auto_66866 ) ) ( IS-CRATE ?auto_66844 ) ( not ( = ?auto_66843 ?auto_66848 ) ) ( not ( = ?auto_66844 ?auto_66848 ) ) ( not ( = ?auto_66866 ?auto_66848 ) ) ( not ( = ?auto_66846 ?auto_66855 ) ) ( not ( = ?auto_66858 ?auto_66846 ) ) ( HOIST-AT ?auto_66853 ?auto_66846 ) ( not ( = ?auto_66863 ?auto_66853 ) ) ( not ( = ?auto_66849 ?auto_66853 ) ) ( SURFACE-AT ?auto_66844 ?auto_66846 ) ( ON ?auto_66844 ?auto_66852 ) ( CLEAR ?auto_66844 ) ( not ( = ?auto_66843 ?auto_66852 ) ) ( not ( = ?auto_66844 ?auto_66852 ) ) ( not ( = ?auto_66866 ?auto_66852 ) ) ( not ( = ?auto_66848 ?auto_66852 ) ) ( IS-CRATE ?auto_66848 ) ( not ( = ?auto_66843 ?auto_66859 ) ) ( not ( = ?auto_66844 ?auto_66859 ) ) ( not ( = ?auto_66866 ?auto_66859 ) ) ( not ( = ?auto_66848 ?auto_66859 ) ) ( not ( = ?auto_66852 ?auto_66859 ) ) ( AVAILABLE ?auto_66853 ) ( SURFACE-AT ?auto_66848 ?auto_66846 ) ( ON ?auto_66848 ?auto_66850 ) ( CLEAR ?auto_66848 ) ( not ( = ?auto_66843 ?auto_66850 ) ) ( not ( = ?auto_66844 ?auto_66850 ) ) ( not ( = ?auto_66866 ?auto_66850 ) ) ( not ( = ?auto_66848 ?auto_66850 ) ) ( not ( = ?auto_66852 ?auto_66850 ) ) ( not ( = ?auto_66859 ?auto_66850 ) ) ( IS-CRATE ?auto_66859 ) ( not ( = ?auto_66843 ?auto_66854 ) ) ( not ( = ?auto_66844 ?auto_66854 ) ) ( not ( = ?auto_66866 ?auto_66854 ) ) ( not ( = ?auto_66848 ?auto_66854 ) ) ( not ( = ?auto_66852 ?auto_66854 ) ) ( not ( = ?auto_66859 ?auto_66854 ) ) ( not ( = ?auto_66850 ?auto_66854 ) ) ( not ( = ?auto_66857 ?auto_66855 ) ) ( not ( = ?auto_66858 ?auto_66857 ) ) ( not ( = ?auto_66846 ?auto_66857 ) ) ( HOIST-AT ?auto_66861 ?auto_66857 ) ( not ( = ?auto_66863 ?auto_66861 ) ) ( not ( = ?auto_66849 ?auto_66861 ) ) ( not ( = ?auto_66853 ?auto_66861 ) ) ( AVAILABLE ?auto_66861 ) ( SURFACE-AT ?auto_66859 ?auto_66857 ) ( ON ?auto_66859 ?auto_66860 ) ( CLEAR ?auto_66859 ) ( not ( = ?auto_66843 ?auto_66860 ) ) ( not ( = ?auto_66844 ?auto_66860 ) ) ( not ( = ?auto_66866 ?auto_66860 ) ) ( not ( = ?auto_66848 ?auto_66860 ) ) ( not ( = ?auto_66852 ?auto_66860 ) ) ( not ( = ?auto_66859 ?auto_66860 ) ) ( not ( = ?auto_66850 ?auto_66860 ) ) ( not ( = ?auto_66854 ?auto_66860 ) ) ( IS-CRATE ?auto_66854 ) ( not ( = ?auto_66843 ?auto_66851 ) ) ( not ( = ?auto_66844 ?auto_66851 ) ) ( not ( = ?auto_66866 ?auto_66851 ) ) ( not ( = ?auto_66848 ?auto_66851 ) ) ( not ( = ?auto_66852 ?auto_66851 ) ) ( not ( = ?auto_66859 ?auto_66851 ) ) ( not ( = ?auto_66850 ?auto_66851 ) ) ( not ( = ?auto_66854 ?auto_66851 ) ) ( not ( = ?auto_66860 ?auto_66851 ) ) ( not ( = ?auto_66865 ?auto_66855 ) ) ( not ( = ?auto_66858 ?auto_66865 ) ) ( not ( = ?auto_66846 ?auto_66865 ) ) ( not ( = ?auto_66857 ?auto_66865 ) ) ( HOIST-AT ?auto_66856 ?auto_66865 ) ( not ( = ?auto_66863 ?auto_66856 ) ) ( not ( = ?auto_66849 ?auto_66856 ) ) ( not ( = ?auto_66853 ?auto_66856 ) ) ( not ( = ?auto_66861 ?auto_66856 ) ) ( AVAILABLE ?auto_66856 ) ( SURFACE-AT ?auto_66854 ?auto_66865 ) ( ON ?auto_66854 ?auto_66864 ) ( CLEAR ?auto_66854 ) ( not ( = ?auto_66843 ?auto_66864 ) ) ( not ( = ?auto_66844 ?auto_66864 ) ) ( not ( = ?auto_66866 ?auto_66864 ) ) ( not ( = ?auto_66848 ?auto_66864 ) ) ( not ( = ?auto_66852 ?auto_66864 ) ) ( not ( = ?auto_66859 ?auto_66864 ) ) ( not ( = ?auto_66850 ?auto_66864 ) ) ( not ( = ?auto_66854 ?auto_66864 ) ) ( not ( = ?auto_66860 ?auto_66864 ) ) ( not ( = ?auto_66851 ?auto_66864 ) ) ( IS-CRATE ?auto_66851 ) ( not ( = ?auto_66843 ?auto_66862 ) ) ( not ( = ?auto_66844 ?auto_66862 ) ) ( not ( = ?auto_66866 ?auto_66862 ) ) ( not ( = ?auto_66848 ?auto_66862 ) ) ( not ( = ?auto_66852 ?auto_66862 ) ) ( not ( = ?auto_66859 ?auto_66862 ) ) ( not ( = ?auto_66850 ?auto_66862 ) ) ( not ( = ?auto_66854 ?auto_66862 ) ) ( not ( = ?auto_66860 ?auto_66862 ) ) ( not ( = ?auto_66851 ?auto_66862 ) ) ( not ( = ?auto_66864 ?auto_66862 ) ) ( AVAILABLE ?auto_66849 ) ( SURFACE-AT ?auto_66851 ?auto_66858 ) ( ON ?auto_66851 ?auto_66845 ) ( CLEAR ?auto_66851 ) ( not ( = ?auto_66843 ?auto_66845 ) ) ( not ( = ?auto_66844 ?auto_66845 ) ) ( not ( = ?auto_66866 ?auto_66845 ) ) ( not ( = ?auto_66848 ?auto_66845 ) ) ( not ( = ?auto_66852 ?auto_66845 ) ) ( not ( = ?auto_66859 ?auto_66845 ) ) ( not ( = ?auto_66850 ?auto_66845 ) ) ( not ( = ?auto_66854 ?auto_66845 ) ) ( not ( = ?auto_66860 ?auto_66845 ) ) ( not ( = ?auto_66851 ?auto_66845 ) ) ( not ( = ?auto_66864 ?auto_66845 ) ) ( not ( = ?auto_66862 ?auto_66845 ) ) ( TRUCK-AT ?auto_66847 ?auto_66855 ) ( SURFACE-AT ?auto_66867 ?auto_66855 ) ( CLEAR ?auto_66867 ) ( IS-CRATE ?auto_66862 ) ( not ( = ?auto_66843 ?auto_66867 ) ) ( not ( = ?auto_66844 ?auto_66867 ) ) ( not ( = ?auto_66866 ?auto_66867 ) ) ( not ( = ?auto_66848 ?auto_66867 ) ) ( not ( = ?auto_66852 ?auto_66867 ) ) ( not ( = ?auto_66859 ?auto_66867 ) ) ( not ( = ?auto_66850 ?auto_66867 ) ) ( not ( = ?auto_66854 ?auto_66867 ) ) ( not ( = ?auto_66860 ?auto_66867 ) ) ( not ( = ?auto_66851 ?auto_66867 ) ) ( not ( = ?auto_66864 ?auto_66867 ) ) ( not ( = ?auto_66862 ?auto_66867 ) ) ( not ( = ?auto_66845 ?auto_66867 ) ) ( AVAILABLE ?auto_66863 ) ( IN ?auto_66862 ?auto_66847 ) )
    :subtasks
    ( ( !UNLOAD ?auto_66863 ?auto_66862 ?auto_66847 ?auto_66855 )
      ( MAKE-ON ?auto_66843 ?auto_66844 )
      ( MAKE-ON-VERIFY ?auto_66843 ?auto_66844 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_66868 - SURFACE
      ?auto_66869 - SURFACE
    )
    :vars
    (
      ?auto_66874 - HOIST
      ?auto_66872 - PLACE
      ?auto_66891 - PLACE
      ?auto_66880 - HOIST
      ?auto_66886 - SURFACE
      ?auto_66882 - SURFACE
      ?auto_66883 - PLACE
      ?auto_66881 - HOIST
      ?auto_66889 - SURFACE
      ?auto_66877 - SURFACE
      ?auto_66887 - SURFACE
      ?auto_66870 - SURFACE
      ?auto_66888 - PLACE
      ?auto_66875 - HOIST
      ?auto_66879 - SURFACE
      ?auto_66884 - SURFACE
      ?auto_66871 - PLACE
      ?auto_66890 - HOIST
      ?auto_66892 - SURFACE
      ?auto_66873 - SURFACE
      ?auto_66876 - SURFACE
      ?auto_66878 - SURFACE
      ?auto_66885 - TRUCK
      ?auto_66893 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_66874 ?auto_66872 ) ( IS-CRATE ?auto_66868 ) ( not ( = ?auto_66868 ?auto_66869 ) ) ( not ( = ?auto_66891 ?auto_66872 ) ) ( HOIST-AT ?auto_66880 ?auto_66891 ) ( not ( = ?auto_66874 ?auto_66880 ) ) ( SURFACE-AT ?auto_66868 ?auto_66891 ) ( ON ?auto_66868 ?auto_66886 ) ( CLEAR ?auto_66868 ) ( not ( = ?auto_66868 ?auto_66886 ) ) ( not ( = ?auto_66869 ?auto_66886 ) ) ( IS-CRATE ?auto_66869 ) ( not ( = ?auto_66868 ?auto_66882 ) ) ( not ( = ?auto_66869 ?auto_66882 ) ) ( not ( = ?auto_66886 ?auto_66882 ) ) ( not ( = ?auto_66883 ?auto_66872 ) ) ( not ( = ?auto_66891 ?auto_66883 ) ) ( HOIST-AT ?auto_66881 ?auto_66883 ) ( not ( = ?auto_66874 ?auto_66881 ) ) ( not ( = ?auto_66880 ?auto_66881 ) ) ( SURFACE-AT ?auto_66869 ?auto_66883 ) ( ON ?auto_66869 ?auto_66889 ) ( CLEAR ?auto_66869 ) ( not ( = ?auto_66868 ?auto_66889 ) ) ( not ( = ?auto_66869 ?auto_66889 ) ) ( not ( = ?auto_66886 ?auto_66889 ) ) ( not ( = ?auto_66882 ?auto_66889 ) ) ( IS-CRATE ?auto_66882 ) ( not ( = ?auto_66868 ?auto_66877 ) ) ( not ( = ?auto_66869 ?auto_66877 ) ) ( not ( = ?auto_66886 ?auto_66877 ) ) ( not ( = ?auto_66882 ?auto_66877 ) ) ( not ( = ?auto_66889 ?auto_66877 ) ) ( AVAILABLE ?auto_66881 ) ( SURFACE-AT ?auto_66882 ?auto_66883 ) ( ON ?auto_66882 ?auto_66887 ) ( CLEAR ?auto_66882 ) ( not ( = ?auto_66868 ?auto_66887 ) ) ( not ( = ?auto_66869 ?auto_66887 ) ) ( not ( = ?auto_66886 ?auto_66887 ) ) ( not ( = ?auto_66882 ?auto_66887 ) ) ( not ( = ?auto_66889 ?auto_66887 ) ) ( not ( = ?auto_66877 ?auto_66887 ) ) ( IS-CRATE ?auto_66877 ) ( not ( = ?auto_66868 ?auto_66870 ) ) ( not ( = ?auto_66869 ?auto_66870 ) ) ( not ( = ?auto_66886 ?auto_66870 ) ) ( not ( = ?auto_66882 ?auto_66870 ) ) ( not ( = ?auto_66889 ?auto_66870 ) ) ( not ( = ?auto_66877 ?auto_66870 ) ) ( not ( = ?auto_66887 ?auto_66870 ) ) ( not ( = ?auto_66888 ?auto_66872 ) ) ( not ( = ?auto_66891 ?auto_66888 ) ) ( not ( = ?auto_66883 ?auto_66888 ) ) ( HOIST-AT ?auto_66875 ?auto_66888 ) ( not ( = ?auto_66874 ?auto_66875 ) ) ( not ( = ?auto_66880 ?auto_66875 ) ) ( not ( = ?auto_66881 ?auto_66875 ) ) ( AVAILABLE ?auto_66875 ) ( SURFACE-AT ?auto_66877 ?auto_66888 ) ( ON ?auto_66877 ?auto_66879 ) ( CLEAR ?auto_66877 ) ( not ( = ?auto_66868 ?auto_66879 ) ) ( not ( = ?auto_66869 ?auto_66879 ) ) ( not ( = ?auto_66886 ?auto_66879 ) ) ( not ( = ?auto_66882 ?auto_66879 ) ) ( not ( = ?auto_66889 ?auto_66879 ) ) ( not ( = ?auto_66877 ?auto_66879 ) ) ( not ( = ?auto_66887 ?auto_66879 ) ) ( not ( = ?auto_66870 ?auto_66879 ) ) ( IS-CRATE ?auto_66870 ) ( not ( = ?auto_66868 ?auto_66884 ) ) ( not ( = ?auto_66869 ?auto_66884 ) ) ( not ( = ?auto_66886 ?auto_66884 ) ) ( not ( = ?auto_66882 ?auto_66884 ) ) ( not ( = ?auto_66889 ?auto_66884 ) ) ( not ( = ?auto_66877 ?auto_66884 ) ) ( not ( = ?auto_66887 ?auto_66884 ) ) ( not ( = ?auto_66870 ?auto_66884 ) ) ( not ( = ?auto_66879 ?auto_66884 ) ) ( not ( = ?auto_66871 ?auto_66872 ) ) ( not ( = ?auto_66891 ?auto_66871 ) ) ( not ( = ?auto_66883 ?auto_66871 ) ) ( not ( = ?auto_66888 ?auto_66871 ) ) ( HOIST-AT ?auto_66890 ?auto_66871 ) ( not ( = ?auto_66874 ?auto_66890 ) ) ( not ( = ?auto_66880 ?auto_66890 ) ) ( not ( = ?auto_66881 ?auto_66890 ) ) ( not ( = ?auto_66875 ?auto_66890 ) ) ( AVAILABLE ?auto_66890 ) ( SURFACE-AT ?auto_66870 ?auto_66871 ) ( ON ?auto_66870 ?auto_66892 ) ( CLEAR ?auto_66870 ) ( not ( = ?auto_66868 ?auto_66892 ) ) ( not ( = ?auto_66869 ?auto_66892 ) ) ( not ( = ?auto_66886 ?auto_66892 ) ) ( not ( = ?auto_66882 ?auto_66892 ) ) ( not ( = ?auto_66889 ?auto_66892 ) ) ( not ( = ?auto_66877 ?auto_66892 ) ) ( not ( = ?auto_66887 ?auto_66892 ) ) ( not ( = ?auto_66870 ?auto_66892 ) ) ( not ( = ?auto_66879 ?auto_66892 ) ) ( not ( = ?auto_66884 ?auto_66892 ) ) ( IS-CRATE ?auto_66884 ) ( not ( = ?auto_66868 ?auto_66873 ) ) ( not ( = ?auto_66869 ?auto_66873 ) ) ( not ( = ?auto_66886 ?auto_66873 ) ) ( not ( = ?auto_66882 ?auto_66873 ) ) ( not ( = ?auto_66889 ?auto_66873 ) ) ( not ( = ?auto_66877 ?auto_66873 ) ) ( not ( = ?auto_66887 ?auto_66873 ) ) ( not ( = ?auto_66870 ?auto_66873 ) ) ( not ( = ?auto_66879 ?auto_66873 ) ) ( not ( = ?auto_66884 ?auto_66873 ) ) ( not ( = ?auto_66892 ?auto_66873 ) ) ( AVAILABLE ?auto_66880 ) ( SURFACE-AT ?auto_66884 ?auto_66891 ) ( ON ?auto_66884 ?auto_66876 ) ( CLEAR ?auto_66884 ) ( not ( = ?auto_66868 ?auto_66876 ) ) ( not ( = ?auto_66869 ?auto_66876 ) ) ( not ( = ?auto_66886 ?auto_66876 ) ) ( not ( = ?auto_66882 ?auto_66876 ) ) ( not ( = ?auto_66889 ?auto_66876 ) ) ( not ( = ?auto_66877 ?auto_66876 ) ) ( not ( = ?auto_66887 ?auto_66876 ) ) ( not ( = ?auto_66870 ?auto_66876 ) ) ( not ( = ?auto_66879 ?auto_66876 ) ) ( not ( = ?auto_66884 ?auto_66876 ) ) ( not ( = ?auto_66892 ?auto_66876 ) ) ( not ( = ?auto_66873 ?auto_66876 ) ) ( SURFACE-AT ?auto_66878 ?auto_66872 ) ( CLEAR ?auto_66878 ) ( IS-CRATE ?auto_66873 ) ( not ( = ?auto_66868 ?auto_66878 ) ) ( not ( = ?auto_66869 ?auto_66878 ) ) ( not ( = ?auto_66886 ?auto_66878 ) ) ( not ( = ?auto_66882 ?auto_66878 ) ) ( not ( = ?auto_66889 ?auto_66878 ) ) ( not ( = ?auto_66877 ?auto_66878 ) ) ( not ( = ?auto_66887 ?auto_66878 ) ) ( not ( = ?auto_66870 ?auto_66878 ) ) ( not ( = ?auto_66879 ?auto_66878 ) ) ( not ( = ?auto_66884 ?auto_66878 ) ) ( not ( = ?auto_66892 ?auto_66878 ) ) ( not ( = ?auto_66873 ?auto_66878 ) ) ( not ( = ?auto_66876 ?auto_66878 ) ) ( AVAILABLE ?auto_66874 ) ( IN ?auto_66873 ?auto_66885 ) ( TRUCK-AT ?auto_66885 ?auto_66893 ) ( not ( = ?auto_66893 ?auto_66872 ) ) ( not ( = ?auto_66891 ?auto_66893 ) ) ( not ( = ?auto_66883 ?auto_66893 ) ) ( not ( = ?auto_66888 ?auto_66893 ) ) ( not ( = ?auto_66871 ?auto_66893 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_66885 ?auto_66893 ?auto_66872 )
      ( MAKE-ON ?auto_66868 ?auto_66869 )
      ( MAKE-ON-VERIFY ?auto_66868 ?auto_66869 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_66894 - SURFACE
      ?auto_66895 - SURFACE
    )
    :vars
    (
      ?auto_66899 - HOIST
      ?auto_66897 - PLACE
      ?auto_66908 - PLACE
      ?auto_66898 - HOIST
      ?auto_66914 - SURFACE
      ?auto_66900 - SURFACE
      ?auto_66913 - PLACE
      ?auto_66905 - HOIST
      ?auto_66906 - SURFACE
      ?auto_66912 - SURFACE
      ?auto_66915 - SURFACE
      ?auto_66911 - SURFACE
      ?auto_66916 - PLACE
      ?auto_66904 - HOIST
      ?auto_66896 - SURFACE
      ?auto_66918 - SURFACE
      ?auto_66902 - PLACE
      ?auto_66907 - HOIST
      ?auto_66909 - SURFACE
      ?auto_66901 - SURFACE
      ?auto_66919 - SURFACE
      ?auto_66903 - SURFACE
      ?auto_66910 - TRUCK
      ?auto_66917 - PLACE
      ?auto_66920 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_66899 ?auto_66897 ) ( IS-CRATE ?auto_66894 ) ( not ( = ?auto_66894 ?auto_66895 ) ) ( not ( = ?auto_66908 ?auto_66897 ) ) ( HOIST-AT ?auto_66898 ?auto_66908 ) ( not ( = ?auto_66899 ?auto_66898 ) ) ( SURFACE-AT ?auto_66894 ?auto_66908 ) ( ON ?auto_66894 ?auto_66914 ) ( CLEAR ?auto_66894 ) ( not ( = ?auto_66894 ?auto_66914 ) ) ( not ( = ?auto_66895 ?auto_66914 ) ) ( IS-CRATE ?auto_66895 ) ( not ( = ?auto_66894 ?auto_66900 ) ) ( not ( = ?auto_66895 ?auto_66900 ) ) ( not ( = ?auto_66914 ?auto_66900 ) ) ( not ( = ?auto_66913 ?auto_66897 ) ) ( not ( = ?auto_66908 ?auto_66913 ) ) ( HOIST-AT ?auto_66905 ?auto_66913 ) ( not ( = ?auto_66899 ?auto_66905 ) ) ( not ( = ?auto_66898 ?auto_66905 ) ) ( SURFACE-AT ?auto_66895 ?auto_66913 ) ( ON ?auto_66895 ?auto_66906 ) ( CLEAR ?auto_66895 ) ( not ( = ?auto_66894 ?auto_66906 ) ) ( not ( = ?auto_66895 ?auto_66906 ) ) ( not ( = ?auto_66914 ?auto_66906 ) ) ( not ( = ?auto_66900 ?auto_66906 ) ) ( IS-CRATE ?auto_66900 ) ( not ( = ?auto_66894 ?auto_66912 ) ) ( not ( = ?auto_66895 ?auto_66912 ) ) ( not ( = ?auto_66914 ?auto_66912 ) ) ( not ( = ?auto_66900 ?auto_66912 ) ) ( not ( = ?auto_66906 ?auto_66912 ) ) ( AVAILABLE ?auto_66905 ) ( SURFACE-AT ?auto_66900 ?auto_66913 ) ( ON ?auto_66900 ?auto_66915 ) ( CLEAR ?auto_66900 ) ( not ( = ?auto_66894 ?auto_66915 ) ) ( not ( = ?auto_66895 ?auto_66915 ) ) ( not ( = ?auto_66914 ?auto_66915 ) ) ( not ( = ?auto_66900 ?auto_66915 ) ) ( not ( = ?auto_66906 ?auto_66915 ) ) ( not ( = ?auto_66912 ?auto_66915 ) ) ( IS-CRATE ?auto_66912 ) ( not ( = ?auto_66894 ?auto_66911 ) ) ( not ( = ?auto_66895 ?auto_66911 ) ) ( not ( = ?auto_66914 ?auto_66911 ) ) ( not ( = ?auto_66900 ?auto_66911 ) ) ( not ( = ?auto_66906 ?auto_66911 ) ) ( not ( = ?auto_66912 ?auto_66911 ) ) ( not ( = ?auto_66915 ?auto_66911 ) ) ( not ( = ?auto_66916 ?auto_66897 ) ) ( not ( = ?auto_66908 ?auto_66916 ) ) ( not ( = ?auto_66913 ?auto_66916 ) ) ( HOIST-AT ?auto_66904 ?auto_66916 ) ( not ( = ?auto_66899 ?auto_66904 ) ) ( not ( = ?auto_66898 ?auto_66904 ) ) ( not ( = ?auto_66905 ?auto_66904 ) ) ( AVAILABLE ?auto_66904 ) ( SURFACE-AT ?auto_66912 ?auto_66916 ) ( ON ?auto_66912 ?auto_66896 ) ( CLEAR ?auto_66912 ) ( not ( = ?auto_66894 ?auto_66896 ) ) ( not ( = ?auto_66895 ?auto_66896 ) ) ( not ( = ?auto_66914 ?auto_66896 ) ) ( not ( = ?auto_66900 ?auto_66896 ) ) ( not ( = ?auto_66906 ?auto_66896 ) ) ( not ( = ?auto_66912 ?auto_66896 ) ) ( not ( = ?auto_66915 ?auto_66896 ) ) ( not ( = ?auto_66911 ?auto_66896 ) ) ( IS-CRATE ?auto_66911 ) ( not ( = ?auto_66894 ?auto_66918 ) ) ( not ( = ?auto_66895 ?auto_66918 ) ) ( not ( = ?auto_66914 ?auto_66918 ) ) ( not ( = ?auto_66900 ?auto_66918 ) ) ( not ( = ?auto_66906 ?auto_66918 ) ) ( not ( = ?auto_66912 ?auto_66918 ) ) ( not ( = ?auto_66915 ?auto_66918 ) ) ( not ( = ?auto_66911 ?auto_66918 ) ) ( not ( = ?auto_66896 ?auto_66918 ) ) ( not ( = ?auto_66902 ?auto_66897 ) ) ( not ( = ?auto_66908 ?auto_66902 ) ) ( not ( = ?auto_66913 ?auto_66902 ) ) ( not ( = ?auto_66916 ?auto_66902 ) ) ( HOIST-AT ?auto_66907 ?auto_66902 ) ( not ( = ?auto_66899 ?auto_66907 ) ) ( not ( = ?auto_66898 ?auto_66907 ) ) ( not ( = ?auto_66905 ?auto_66907 ) ) ( not ( = ?auto_66904 ?auto_66907 ) ) ( AVAILABLE ?auto_66907 ) ( SURFACE-AT ?auto_66911 ?auto_66902 ) ( ON ?auto_66911 ?auto_66909 ) ( CLEAR ?auto_66911 ) ( not ( = ?auto_66894 ?auto_66909 ) ) ( not ( = ?auto_66895 ?auto_66909 ) ) ( not ( = ?auto_66914 ?auto_66909 ) ) ( not ( = ?auto_66900 ?auto_66909 ) ) ( not ( = ?auto_66906 ?auto_66909 ) ) ( not ( = ?auto_66912 ?auto_66909 ) ) ( not ( = ?auto_66915 ?auto_66909 ) ) ( not ( = ?auto_66911 ?auto_66909 ) ) ( not ( = ?auto_66896 ?auto_66909 ) ) ( not ( = ?auto_66918 ?auto_66909 ) ) ( IS-CRATE ?auto_66918 ) ( not ( = ?auto_66894 ?auto_66901 ) ) ( not ( = ?auto_66895 ?auto_66901 ) ) ( not ( = ?auto_66914 ?auto_66901 ) ) ( not ( = ?auto_66900 ?auto_66901 ) ) ( not ( = ?auto_66906 ?auto_66901 ) ) ( not ( = ?auto_66912 ?auto_66901 ) ) ( not ( = ?auto_66915 ?auto_66901 ) ) ( not ( = ?auto_66911 ?auto_66901 ) ) ( not ( = ?auto_66896 ?auto_66901 ) ) ( not ( = ?auto_66918 ?auto_66901 ) ) ( not ( = ?auto_66909 ?auto_66901 ) ) ( AVAILABLE ?auto_66898 ) ( SURFACE-AT ?auto_66918 ?auto_66908 ) ( ON ?auto_66918 ?auto_66919 ) ( CLEAR ?auto_66918 ) ( not ( = ?auto_66894 ?auto_66919 ) ) ( not ( = ?auto_66895 ?auto_66919 ) ) ( not ( = ?auto_66914 ?auto_66919 ) ) ( not ( = ?auto_66900 ?auto_66919 ) ) ( not ( = ?auto_66906 ?auto_66919 ) ) ( not ( = ?auto_66912 ?auto_66919 ) ) ( not ( = ?auto_66915 ?auto_66919 ) ) ( not ( = ?auto_66911 ?auto_66919 ) ) ( not ( = ?auto_66896 ?auto_66919 ) ) ( not ( = ?auto_66918 ?auto_66919 ) ) ( not ( = ?auto_66909 ?auto_66919 ) ) ( not ( = ?auto_66901 ?auto_66919 ) ) ( SURFACE-AT ?auto_66903 ?auto_66897 ) ( CLEAR ?auto_66903 ) ( IS-CRATE ?auto_66901 ) ( not ( = ?auto_66894 ?auto_66903 ) ) ( not ( = ?auto_66895 ?auto_66903 ) ) ( not ( = ?auto_66914 ?auto_66903 ) ) ( not ( = ?auto_66900 ?auto_66903 ) ) ( not ( = ?auto_66906 ?auto_66903 ) ) ( not ( = ?auto_66912 ?auto_66903 ) ) ( not ( = ?auto_66915 ?auto_66903 ) ) ( not ( = ?auto_66911 ?auto_66903 ) ) ( not ( = ?auto_66896 ?auto_66903 ) ) ( not ( = ?auto_66918 ?auto_66903 ) ) ( not ( = ?auto_66909 ?auto_66903 ) ) ( not ( = ?auto_66901 ?auto_66903 ) ) ( not ( = ?auto_66919 ?auto_66903 ) ) ( AVAILABLE ?auto_66899 ) ( TRUCK-AT ?auto_66910 ?auto_66917 ) ( not ( = ?auto_66917 ?auto_66897 ) ) ( not ( = ?auto_66908 ?auto_66917 ) ) ( not ( = ?auto_66913 ?auto_66917 ) ) ( not ( = ?auto_66916 ?auto_66917 ) ) ( not ( = ?auto_66902 ?auto_66917 ) ) ( HOIST-AT ?auto_66920 ?auto_66917 ) ( LIFTING ?auto_66920 ?auto_66901 ) ( not ( = ?auto_66899 ?auto_66920 ) ) ( not ( = ?auto_66898 ?auto_66920 ) ) ( not ( = ?auto_66905 ?auto_66920 ) ) ( not ( = ?auto_66904 ?auto_66920 ) ) ( not ( = ?auto_66907 ?auto_66920 ) ) )
    :subtasks
    ( ( !LOAD ?auto_66920 ?auto_66901 ?auto_66910 ?auto_66917 )
      ( MAKE-ON ?auto_66894 ?auto_66895 )
      ( MAKE-ON-VERIFY ?auto_66894 ?auto_66895 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_66921 - SURFACE
      ?auto_66922 - SURFACE
    )
    :vars
    (
      ?auto_66941 - HOIST
      ?auto_66933 - PLACE
      ?auto_66940 - PLACE
      ?auto_66943 - HOIST
      ?auto_66925 - SURFACE
      ?auto_66934 - SURFACE
      ?auto_66923 - PLACE
      ?auto_66939 - HOIST
      ?auto_66931 - SURFACE
      ?auto_66924 - SURFACE
      ?auto_66926 - SURFACE
      ?auto_66929 - SURFACE
      ?auto_66947 - PLACE
      ?auto_66946 - HOIST
      ?auto_66944 - SURFACE
      ?auto_66928 - SURFACE
      ?auto_66945 - PLACE
      ?auto_66935 - HOIST
      ?auto_66936 - SURFACE
      ?auto_66932 - SURFACE
      ?auto_66938 - SURFACE
      ?auto_66942 - SURFACE
      ?auto_66930 - TRUCK
      ?auto_66937 - PLACE
      ?auto_66927 - HOIST
      ?auto_66948 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_66941 ?auto_66933 ) ( IS-CRATE ?auto_66921 ) ( not ( = ?auto_66921 ?auto_66922 ) ) ( not ( = ?auto_66940 ?auto_66933 ) ) ( HOIST-AT ?auto_66943 ?auto_66940 ) ( not ( = ?auto_66941 ?auto_66943 ) ) ( SURFACE-AT ?auto_66921 ?auto_66940 ) ( ON ?auto_66921 ?auto_66925 ) ( CLEAR ?auto_66921 ) ( not ( = ?auto_66921 ?auto_66925 ) ) ( not ( = ?auto_66922 ?auto_66925 ) ) ( IS-CRATE ?auto_66922 ) ( not ( = ?auto_66921 ?auto_66934 ) ) ( not ( = ?auto_66922 ?auto_66934 ) ) ( not ( = ?auto_66925 ?auto_66934 ) ) ( not ( = ?auto_66923 ?auto_66933 ) ) ( not ( = ?auto_66940 ?auto_66923 ) ) ( HOIST-AT ?auto_66939 ?auto_66923 ) ( not ( = ?auto_66941 ?auto_66939 ) ) ( not ( = ?auto_66943 ?auto_66939 ) ) ( SURFACE-AT ?auto_66922 ?auto_66923 ) ( ON ?auto_66922 ?auto_66931 ) ( CLEAR ?auto_66922 ) ( not ( = ?auto_66921 ?auto_66931 ) ) ( not ( = ?auto_66922 ?auto_66931 ) ) ( not ( = ?auto_66925 ?auto_66931 ) ) ( not ( = ?auto_66934 ?auto_66931 ) ) ( IS-CRATE ?auto_66934 ) ( not ( = ?auto_66921 ?auto_66924 ) ) ( not ( = ?auto_66922 ?auto_66924 ) ) ( not ( = ?auto_66925 ?auto_66924 ) ) ( not ( = ?auto_66934 ?auto_66924 ) ) ( not ( = ?auto_66931 ?auto_66924 ) ) ( AVAILABLE ?auto_66939 ) ( SURFACE-AT ?auto_66934 ?auto_66923 ) ( ON ?auto_66934 ?auto_66926 ) ( CLEAR ?auto_66934 ) ( not ( = ?auto_66921 ?auto_66926 ) ) ( not ( = ?auto_66922 ?auto_66926 ) ) ( not ( = ?auto_66925 ?auto_66926 ) ) ( not ( = ?auto_66934 ?auto_66926 ) ) ( not ( = ?auto_66931 ?auto_66926 ) ) ( not ( = ?auto_66924 ?auto_66926 ) ) ( IS-CRATE ?auto_66924 ) ( not ( = ?auto_66921 ?auto_66929 ) ) ( not ( = ?auto_66922 ?auto_66929 ) ) ( not ( = ?auto_66925 ?auto_66929 ) ) ( not ( = ?auto_66934 ?auto_66929 ) ) ( not ( = ?auto_66931 ?auto_66929 ) ) ( not ( = ?auto_66924 ?auto_66929 ) ) ( not ( = ?auto_66926 ?auto_66929 ) ) ( not ( = ?auto_66947 ?auto_66933 ) ) ( not ( = ?auto_66940 ?auto_66947 ) ) ( not ( = ?auto_66923 ?auto_66947 ) ) ( HOIST-AT ?auto_66946 ?auto_66947 ) ( not ( = ?auto_66941 ?auto_66946 ) ) ( not ( = ?auto_66943 ?auto_66946 ) ) ( not ( = ?auto_66939 ?auto_66946 ) ) ( AVAILABLE ?auto_66946 ) ( SURFACE-AT ?auto_66924 ?auto_66947 ) ( ON ?auto_66924 ?auto_66944 ) ( CLEAR ?auto_66924 ) ( not ( = ?auto_66921 ?auto_66944 ) ) ( not ( = ?auto_66922 ?auto_66944 ) ) ( not ( = ?auto_66925 ?auto_66944 ) ) ( not ( = ?auto_66934 ?auto_66944 ) ) ( not ( = ?auto_66931 ?auto_66944 ) ) ( not ( = ?auto_66924 ?auto_66944 ) ) ( not ( = ?auto_66926 ?auto_66944 ) ) ( not ( = ?auto_66929 ?auto_66944 ) ) ( IS-CRATE ?auto_66929 ) ( not ( = ?auto_66921 ?auto_66928 ) ) ( not ( = ?auto_66922 ?auto_66928 ) ) ( not ( = ?auto_66925 ?auto_66928 ) ) ( not ( = ?auto_66934 ?auto_66928 ) ) ( not ( = ?auto_66931 ?auto_66928 ) ) ( not ( = ?auto_66924 ?auto_66928 ) ) ( not ( = ?auto_66926 ?auto_66928 ) ) ( not ( = ?auto_66929 ?auto_66928 ) ) ( not ( = ?auto_66944 ?auto_66928 ) ) ( not ( = ?auto_66945 ?auto_66933 ) ) ( not ( = ?auto_66940 ?auto_66945 ) ) ( not ( = ?auto_66923 ?auto_66945 ) ) ( not ( = ?auto_66947 ?auto_66945 ) ) ( HOIST-AT ?auto_66935 ?auto_66945 ) ( not ( = ?auto_66941 ?auto_66935 ) ) ( not ( = ?auto_66943 ?auto_66935 ) ) ( not ( = ?auto_66939 ?auto_66935 ) ) ( not ( = ?auto_66946 ?auto_66935 ) ) ( AVAILABLE ?auto_66935 ) ( SURFACE-AT ?auto_66929 ?auto_66945 ) ( ON ?auto_66929 ?auto_66936 ) ( CLEAR ?auto_66929 ) ( not ( = ?auto_66921 ?auto_66936 ) ) ( not ( = ?auto_66922 ?auto_66936 ) ) ( not ( = ?auto_66925 ?auto_66936 ) ) ( not ( = ?auto_66934 ?auto_66936 ) ) ( not ( = ?auto_66931 ?auto_66936 ) ) ( not ( = ?auto_66924 ?auto_66936 ) ) ( not ( = ?auto_66926 ?auto_66936 ) ) ( not ( = ?auto_66929 ?auto_66936 ) ) ( not ( = ?auto_66944 ?auto_66936 ) ) ( not ( = ?auto_66928 ?auto_66936 ) ) ( IS-CRATE ?auto_66928 ) ( not ( = ?auto_66921 ?auto_66932 ) ) ( not ( = ?auto_66922 ?auto_66932 ) ) ( not ( = ?auto_66925 ?auto_66932 ) ) ( not ( = ?auto_66934 ?auto_66932 ) ) ( not ( = ?auto_66931 ?auto_66932 ) ) ( not ( = ?auto_66924 ?auto_66932 ) ) ( not ( = ?auto_66926 ?auto_66932 ) ) ( not ( = ?auto_66929 ?auto_66932 ) ) ( not ( = ?auto_66944 ?auto_66932 ) ) ( not ( = ?auto_66928 ?auto_66932 ) ) ( not ( = ?auto_66936 ?auto_66932 ) ) ( AVAILABLE ?auto_66943 ) ( SURFACE-AT ?auto_66928 ?auto_66940 ) ( ON ?auto_66928 ?auto_66938 ) ( CLEAR ?auto_66928 ) ( not ( = ?auto_66921 ?auto_66938 ) ) ( not ( = ?auto_66922 ?auto_66938 ) ) ( not ( = ?auto_66925 ?auto_66938 ) ) ( not ( = ?auto_66934 ?auto_66938 ) ) ( not ( = ?auto_66931 ?auto_66938 ) ) ( not ( = ?auto_66924 ?auto_66938 ) ) ( not ( = ?auto_66926 ?auto_66938 ) ) ( not ( = ?auto_66929 ?auto_66938 ) ) ( not ( = ?auto_66944 ?auto_66938 ) ) ( not ( = ?auto_66928 ?auto_66938 ) ) ( not ( = ?auto_66936 ?auto_66938 ) ) ( not ( = ?auto_66932 ?auto_66938 ) ) ( SURFACE-AT ?auto_66942 ?auto_66933 ) ( CLEAR ?auto_66942 ) ( IS-CRATE ?auto_66932 ) ( not ( = ?auto_66921 ?auto_66942 ) ) ( not ( = ?auto_66922 ?auto_66942 ) ) ( not ( = ?auto_66925 ?auto_66942 ) ) ( not ( = ?auto_66934 ?auto_66942 ) ) ( not ( = ?auto_66931 ?auto_66942 ) ) ( not ( = ?auto_66924 ?auto_66942 ) ) ( not ( = ?auto_66926 ?auto_66942 ) ) ( not ( = ?auto_66929 ?auto_66942 ) ) ( not ( = ?auto_66944 ?auto_66942 ) ) ( not ( = ?auto_66928 ?auto_66942 ) ) ( not ( = ?auto_66936 ?auto_66942 ) ) ( not ( = ?auto_66932 ?auto_66942 ) ) ( not ( = ?auto_66938 ?auto_66942 ) ) ( AVAILABLE ?auto_66941 ) ( TRUCK-AT ?auto_66930 ?auto_66937 ) ( not ( = ?auto_66937 ?auto_66933 ) ) ( not ( = ?auto_66940 ?auto_66937 ) ) ( not ( = ?auto_66923 ?auto_66937 ) ) ( not ( = ?auto_66947 ?auto_66937 ) ) ( not ( = ?auto_66945 ?auto_66937 ) ) ( HOIST-AT ?auto_66927 ?auto_66937 ) ( not ( = ?auto_66941 ?auto_66927 ) ) ( not ( = ?auto_66943 ?auto_66927 ) ) ( not ( = ?auto_66939 ?auto_66927 ) ) ( not ( = ?auto_66946 ?auto_66927 ) ) ( not ( = ?auto_66935 ?auto_66927 ) ) ( AVAILABLE ?auto_66927 ) ( SURFACE-AT ?auto_66932 ?auto_66937 ) ( ON ?auto_66932 ?auto_66948 ) ( CLEAR ?auto_66932 ) ( not ( = ?auto_66921 ?auto_66948 ) ) ( not ( = ?auto_66922 ?auto_66948 ) ) ( not ( = ?auto_66925 ?auto_66948 ) ) ( not ( = ?auto_66934 ?auto_66948 ) ) ( not ( = ?auto_66931 ?auto_66948 ) ) ( not ( = ?auto_66924 ?auto_66948 ) ) ( not ( = ?auto_66926 ?auto_66948 ) ) ( not ( = ?auto_66929 ?auto_66948 ) ) ( not ( = ?auto_66944 ?auto_66948 ) ) ( not ( = ?auto_66928 ?auto_66948 ) ) ( not ( = ?auto_66936 ?auto_66948 ) ) ( not ( = ?auto_66932 ?auto_66948 ) ) ( not ( = ?auto_66938 ?auto_66948 ) ) ( not ( = ?auto_66942 ?auto_66948 ) ) )
    :subtasks
    ( ( !LIFT ?auto_66927 ?auto_66932 ?auto_66948 ?auto_66937 )
      ( MAKE-ON ?auto_66921 ?auto_66922 )
      ( MAKE-ON-VERIFY ?auto_66921 ?auto_66922 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_66949 - SURFACE
      ?auto_66950 - SURFACE
    )
    :vars
    (
      ?auto_66962 - HOIST
      ?auto_66969 - PLACE
      ?auto_66961 - PLACE
      ?auto_66973 - HOIST
      ?auto_66972 - SURFACE
      ?auto_66976 - SURFACE
      ?auto_66960 - PLACE
      ?auto_66958 - HOIST
      ?auto_66959 - SURFACE
      ?auto_66951 - SURFACE
      ?auto_66966 - SURFACE
      ?auto_66971 - SURFACE
      ?auto_66967 - PLACE
      ?auto_66956 - HOIST
      ?auto_66974 - SURFACE
      ?auto_66952 - SURFACE
      ?auto_66975 - PLACE
      ?auto_66965 - HOIST
      ?auto_66954 - SURFACE
      ?auto_66964 - SURFACE
      ?auto_66970 - SURFACE
      ?auto_66963 - SURFACE
      ?auto_66968 - PLACE
      ?auto_66957 - HOIST
      ?auto_66955 - SURFACE
      ?auto_66953 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_66962 ?auto_66969 ) ( IS-CRATE ?auto_66949 ) ( not ( = ?auto_66949 ?auto_66950 ) ) ( not ( = ?auto_66961 ?auto_66969 ) ) ( HOIST-AT ?auto_66973 ?auto_66961 ) ( not ( = ?auto_66962 ?auto_66973 ) ) ( SURFACE-AT ?auto_66949 ?auto_66961 ) ( ON ?auto_66949 ?auto_66972 ) ( CLEAR ?auto_66949 ) ( not ( = ?auto_66949 ?auto_66972 ) ) ( not ( = ?auto_66950 ?auto_66972 ) ) ( IS-CRATE ?auto_66950 ) ( not ( = ?auto_66949 ?auto_66976 ) ) ( not ( = ?auto_66950 ?auto_66976 ) ) ( not ( = ?auto_66972 ?auto_66976 ) ) ( not ( = ?auto_66960 ?auto_66969 ) ) ( not ( = ?auto_66961 ?auto_66960 ) ) ( HOIST-AT ?auto_66958 ?auto_66960 ) ( not ( = ?auto_66962 ?auto_66958 ) ) ( not ( = ?auto_66973 ?auto_66958 ) ) ( SURFACE-AT ?auto_66950 ?auto_66960 ) ( ON ?auto_66950 ?auto_66959 ) ( CLEAR ?auto_66950 ) ( not ( = ?auto_66949 ?auto_66959 ) ) ( not ( = ?auto_66950 ?auto_66959 ) ) ( not ( = ?auto_66972 ?auto_66959 ) ) ( not ( = ?auto_66976 ?auto_66959 ) ) ( IS-CRATE ?auto_66976 ) ( not ( = ?auto_66949 ?auto_66951 ) ) ( not ( = ?auto_66950 ?auto_66951 ) ) ( not ( = ?auto_66972 ?auto_66951 ) ) ( not ( = ?auto_66976 ?auto_66951 ) ) ( not ( = ?auto_66959 ?auto_66951 ) ) ( AVAILABLE ?auto_66958 ) ( SURFACE-AT ?auto_66976 ?auto_66960 ) ( ON ?auto_66976 ?auto_66966 ) ( CLEAR ?auto_66976 ) ( not ( = ?auto_66949 ?auto_66966 ) ) ( not ( = ?auto_66950 ?auto_66966 ) ) ( not ( = ?auto_66972 ?auto_66966 ) ) ( not ( = ?auto_66976 ?auto_66966 ) ) ( not ( = ?auto_66959 ?auto_66966 ) ) ( not ( = ?auto_66951 ?auto_66966 ) ) ( IS-CRATE ?auto_66951 ) ( not ( = ?auto_66949 ?auto_66971 ) ) ( not ( = ?auto_66950 ?auto_66971 ) ) ( not ( = ?auto_66972 ?auto_66971 ) ) ( not ( = ?auto_66976 ?auto_66971 ) ) ( not ( = ?auto_66959 ?auto_66971 ) ) ( not ( = ?auto_66951 ?auto_66971 ) ) ( not ( = ?auto_66966 ?auto_66971 ) ) ( not ( = ?auto_66967 ?auto_66969 ) ) ( not ( = ?auto_66961 ?auto_66967 ) ) ( not ( = ?auto_66960 ?auto_66967 ) ) ( HOIST-AT ?auto_66956 ?auto_66967 ) ( not ( = ?auto_66962 ?auto_66956 ) ) ( not ( = ?auto_66973 ?auto_66956 ) ) ( not ( = ?auto_66958 ?auto_66956 ) ) ( AVAILABLE ?auto_66956 ) ( SURFACE-AT ?auto_66951 ?auto_66967 ) ( ON ?auto_66951 ?auto_66974 ) ( CLEAR ?auto_66951 ) ( not ( = ?auto_66949 ?auto_66974 ) ) ( not ( = ?auto_66950 ?auto_66974 ) ) ( not ( = ?auto_66972 ?auto_66974 ) ) ( not ( = ?auto_66976 ?auto_66974 ) ) ( not ( = ?auto_66959 ?auto_66974 ) ) ( not ( = ?auto_66951 ?auto_66974 ) ) ( not ( = ?auto_66966 ?auto_66974 ) ) ( not ( = ?auto_66971 ?auto_66974 ) ) ( IS-CRATE ?auto_66971 ) ( not ( = ?auto_66949 ?auto_66952 ) ) ( not ( = ?auto_66950 ?auto_66952 ) ) ( not ( = ?auto_66972 ?auto_66952 ) ) ( not ( = ?auto_66976 ?auto_66952 ) ) ( not ( = ?auto_66959 ?auto_66952 ) ) ( not ( = ?auto_66951 ?auto_66952 ) ) ( not ( = ?auto_66966 ?auto_66952 ) ) ( not ( = ?auto_66971 ?auto_66952 ) ) ( not ( = ?auto_66974 ?auto_66952 ) ) ( not ( = ?auto_66975 ?auto_66969 ) ) ( not ( = ?auto_66961 ?auto_66975 ) ) ( not ( = ?auto_66960 ?auto_66975 ) ) ( not ( = ?auto_66967 ?auto_66975 ) ) ( HOIST-AT ?auto_66965 ?auto_66975 ) ( not ( = ?auto_66962 ?auto_66965 ) ) ( not ( = ?auto_66973 ?auto_66965 ) ) ( not ( = ?auto_66958 ?auto_66965 ) ) ( not ( = ?auto_66956 ?auto_66965 ) ) ( AVAILABLE ?auto_66965 ) ( SURFACE-AT ?auto_66971 ?auto_66975 ) ( ON ?auto_66971 ?auto_66954 ) ( CLEAR ?auto_66971 ) ( not ( = ?auto_66949 ?auto_66954 ) ) ( not ( = ?auto_66950 ?auto_66954 ) ) ( not ( = ?auto_66972 ?auto_66954 ) ) ( not ( = ?auto_66976 ?auto_66954 ) ) ( not ( = ?auto_66959 ?auto_66954 ) ) ( not ( = ?auto_66951 ?auto_66954 ) ) ( not ( = ?auto_66966 ?auto_66954 ) ) ( not ( = ?auto_66971 ?auto_66954 ) ) ( not ( = ?auto_66974 ?auto_66954 ) ) ( not ( = ?auto_66952 ?auto_66954 ) ) ( IS-CRATE ?auto_66952 ) ( not ( = ?auto_66949 ?auto_66964 ) ) ( not ( = ?auto_66950 ?auto_66964 ) ) ( not ( = ?auto_66972 ?auto_66964 ) ) ( not ( = ?auto_66976 ?auto_66964 ) ) ( not ( = ?auto_66959 ?auto_66964 ) ) ( not ( = ?auto_66951 ?auto_66964 ) ) ( not ( = ?auto_66966 ?auto_66964 ) ) ( not ( = ?auto_66971 ?auto_66964 ) ) ( not ( = ?auto_66974 ?auto_66964 ) ) ( not ( = ?auto_66952 ?auto_66964 ) ) ( not ( = ?auto_66954 ?auto_66964 ) ) ( AVAILABLE ?auto_66973 ) ( SURFACE-AT ?auto_66952 ?auto_66961 ) ( ON ?auto_66952 ?auto_66970 ) ( CLEAR ?auto_66952 ) ( not ( = ?auto_66949 ?auto_66970 ) ) ( not ( = ?auto_66950 ?auto_66970 ) ) ( not ( = ?auto_66972 ?auto_66970 ) ) ( not ( = ?auto_66976 ?auto_66970 ) ) ( not ( = ?auto_66959 ?auto_66970 ) ) ( not ( = ?auto_66951 ?auto_66970 ) ) ( not ( = ?auto_66966 ?auto_66970 ) ) ( not ( = ?auto_66971 ?auto_66970 ) ) ( not ( = ?auto_66974 ?auto_66970 ) ) ( not ( = ?auto_66952 ?auto_66970 ) ) ( not ( = ?auto_66954 ?auto_66970 ) ) ( not ( = ?auto_66964 ?auto_66970 ) ) ( SURFACE-AT ?auto_66963 ?auto_66969 ) ( CLEAR ?auto_66963 ) ( IS-CRATE ?auto_66964 ) ( not ( = ?auto_66949 ?auto_66963 ) ) ( not ( = ?auto_66950 ?auto_66963 ) ) ( not ( = ?auto_66972 ?auto_66963 ) ) ( not ( = ?auto_66976 ?auto_66963 ) ) ( not ( = ?auto_66959 ?auto_66963 ) ) ( not ( = ?auto_66951 ?auto_66963 ) ) ( not ( = ?auto_66966 ?auto_66963 ) ) ( not ( = ?auto_66971 ?auto_66963 ) ) ( not ( = ?auto_66974 ?auto_66963 ) ) ( not ( = ?auto_66952 ?auto_66963 ) ) ( not ( = ?auto_66954 ?auto_66963 ) ) ( not ( = ?auto_66964 ?auto_66963 ) ) ( not ( = ?auto_66970 ?auto_66963 ) ) ( AVAILABLE ?auto_66962 ) ( not ( = ?auto_66968 ?auto_66969 ) ) ( not ( = ?auto_66961 ?auto_66968 ) ) ( not ( = ?auto_66960 ?auto_66968 ) ) ( not ( = ?auto_66967 ?auto_66968 ) ) ( not ( = ?auto_66975 ?auto_66968 ) ) ( HOIST-AT ?auto_66957 ?auto_66968 ) ( not ( = ?auto_66962 ?auto_66957 ) ) ( not ( = ?auto_66973 ?auto_66957 ) ) ( not ( = ?auto_66958 ?auto_66957 ) ) ( not ( = ?auto_66956 ?auto_66957 ) ) ( not ( = ?auto_66965 ?auto_66957 ) ) ( AVAILABLE ?auto_66957 ) ( SURFACE-AT ?auto_66964 ?auto_66968 ) ( ON ?auto_66964 ?auto_66955 ) ( CLEAR ?auto_66964 ) ( not ( = ?auto_66949 ?auto_66955 ) ) ( not ( = ?auto_66950 ?auto_66955 ) ) ( not ( = ?auto_66972 ?auto_66955 ) ) ( not ( = ?auto_66976 ?auto_66955 ) ) ( not ( = ?auto_66959 ?auto_66955 ) ) ( not ( = ?auto_66951 ?auto_66955 ) ) ( not ( = ?auto_66966 ?auto_66955 ) ) ( not ( = ?auto_66971 ?auto_66955 ) ) ( not ( = ?auto_66974 ?auto_66955 ) ) ( not ( = ?auto_66952 ?auto_66955 ) ) ( not ( = ?auto_66954 ?auto_66955 ) ) ( not ( = ?auto_66964 ?auto_66955 ) ) ( not ( = ?auto_66970 ?auto_66955 ) ) ( not ( = ?auto_66963 ?auto_66955 ) ) ( TRUCK-AT ?auto_66953 ?auto_66969 ) )
    :subtasks
    ( ( !DRIVE ?auto_66953 ?auto_66969 ?auto_66968 )
      ( MAKE-ON ?auto_66949 ?auto_66950 )
      ( MAKE-ON-VERIFY ?auto_66949 ?auto_66950 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_66977 - SURFACE
      ?auto_66978 - SURFACE
    )
    :vars
    (
      ?auto_66997 - HOIST
      ?auto_66993 - PLACE
      ?auto_66989 - PLACE
      ?auto_66999 - HOIST
      ?auto_66996 - SURFACE
      ?auto_66986 - SURFACE
      ?auto_66980 - PLACE
      ?auto_66987 - HOIST
      ?auto_67001 - SURFACE
      ?auto_67002 - SURFACE
      ?auto_67000 - SURFACE
      ?auto_66995 - SURFACE
      ?auto_66991 - PLACE
      ?auto_66983 - HOIST
      ?auto_66990 - SURFACE
      ?auto_66998 - SURFACE
      ?auto_66981 - PLACE
      ?auto_67003 - HOIST
      ?auto_66985 - SURFACE
      ?auto_67004 - SURFACE
      ?auto_66994 - SURFACE
      ?auto_66988 - SURFACE
      ?auto_66992 - PLACE
      ?auto_66984 - HOIST
      ?auto_66979 - SURFACE
      ?auto_66982 - TRUCK
      ?auto_67005 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_66997 ?auto_66993 ) ( IS-CRATE ?auto_66977 ) ( not ( = ?auto_66977 ?auto_66978 ) ) ( not ( = ?auto_66989 ?auto_66993 ) ) ( HOIST-AT ?auto_66999 ?auto_66989 ) ( not ( = ?auto_66997 ?auto_66999 ) ) ( SURFACE-AT ?auto_66977 ?auto_66989 ) ( ON ?auto_66977 ?auto_66996 ) ( CLEAR ?auto_66977 ) ( not ( = ?auto_66977 ?auto_66996 ) ) ( not ( = ?auto_66978 ?auto_66996 ) ) ( IS-CRATE ?auto_66978 ) ( not ( = ?auto_66977 ?auto_66986 ) ) ( not ( = ?auto_66978 ?auto_66986 ) ) ( not ( = ?auto_66996 ?auto_66986 ) ) ( not ( = ?auto_66980 ?auto_66993 ) ) ( not ( = ?auto_66989 ?auto_66980 ) ) ( HOIST-AT ?auto_66987 ?auto_66980 ) ( not ( = ?auto_66997 ?auto_66987 ) ) ( not ( = ?auto_66999 ?auto_66987 ) ) ( SURFACE-AT ?auto_66978 ?auto_66980 ) ( ON ?auto_66978 ?auto_67001 ) ( CLEAR ?auto_66978 ) ( not ( = ?auto_66977 ?auto_67001 ) ) ( not ( = ?auto_66978 ?auto_67001 ) ) ( not ( = ?auto_66996 ?auto_67001 ) ) ( not ( = ?auto_66986 ?auto_67001 ) ) ( IS-CRATE ?auto_66986 ) ( not ( = ?auto_66977 ?auto_67002 ) ) ( not ( = ?auto_66978 ?auto_67002 ) ) ( not ( = ?auto_66996 ?auto_67002 ) ) ( not ( = ?auto_66986 ?auto_67002 ) ) ( not ( = ?auto_67001 ?auto_67002 ) ) ( AVAILABLE ?auto_66987 ) ( SURFACE-AT ?auto_66986 ?auto_66980 ) ( ON ?auto_66986 ?auto_67000 ) ( CLEAR ?auto_66986 ) ( not ( = ?auto_66977 ?auto_67000 ) ) ( not ( = ?auto_66978 ?auto_67000 ) ) ( not ( = ?auto_66996 ?auto_67000 ) ) ( not ( = ?auto_66986 ?auto_67000 ) ) ( not ( = ?auto_67001 ?auto_67000 ) ) ( not ( = ?auto_67002 ?auto_67000 ) ) ( IS-CRATE ?auto_67002 ) ( not ( = ?auto_66977 ?auto_66995 ) ) ( not ( = ?auto_66978 ?auto_66995 ) ) ( not ( = ?auto_66996 ?auto_66995 ) ) ( not ( = ?auto_66986 ?auto_66995 ) ) ( not ( = ?auto_67001 ?auto_66995 ) ) ( not ( = ?auto_67002 ?auto_66995 ) ) ( not ( = ?auto_67000 ?auto_66995 ) ) ( not ( = ?auto_66991 ?auto_66993 ) ) ( not ( = ?auto_66989 ?auto_66991 ) ) ( not ( = ?auto_66980 ?auto_66991 ) ) ( HOIST-AT ?auto_66983 ?auto_66991 ) ( not ( = ?auto_66997 ?auto_66983 ) ) ( not ( = ?auto_66999 ?auto_66983 ) ) ( not ( = ?auto_66987 ?auto_66983 ) ) ( AVAILABLE ?auto_66983 ) ( SURFACE-AT ?auto_67002 ?auto_66991 ) ( ON ?auto_67002 ?auto_66990 ) ( CLEAR ?auto_67002 ) ( not ( = ?auto_66977 ?auto_66990 ) ) ( not ( = ?auto_66978 ?auto_66990 ) ) ( not ( = ?auto_66996 ?auto_66990 ) ) ( not ( = ?auto_66986 ?auto_66990 ) ) ( not ( = ?auto_67001 ?auto_66990 ) ) ( not ( = ?auto_67002 ?auto_66990 ) ) ( not ( = ?auto_67000 ?auto_66990 ) ) ( not ( = ?auto_66995 ?auto_66990 ) ) ( IS-CRATE ?auto_66995 ) ( not ( = ?auto_66977 ?auto_66998 ) ) ( not ( = ?auto_66978 ?auto_66998 ) ) ( not ( = ?auto_66996 ?auto_66998 ) ) ( not ( = ?auto_66986 ?auto_66998 ) ) ( not ( = ?auto_67001 ?auto_66998 ) ) ( not ( = ?auto_67002 ?auto_66998 ) ) ( not ( = ?auto_67000 ?auto_66998 ) ) ( not ( = ?auto_66995 ?auto_66998 ) ) ( not ( = ?auto_66990 ?auto_66998 ) ) ( not ( = ?auto_66981 ?auto_66993 ) ) ( not ( = ?auto_66989 ?auto_66981 ) ) ( not ( = ?auto_66980 ?auto_66981 ) ) ( not ( = ?auto_66991 ?auto_66981 ) ) ( HOIST-AT ?auto_67003 ?auto_66981 ) ( not ( = ?auto_66997 ?auto_67003 ) ) ( not ( = ?auto_66999 ?auto_67003 ) ) ( not ( = ?auto_66987 ?auto_67003 ) ) ( not ( = ?auto_66983 ?auto_67003 ) ) ( AVAILABLE ?auto_67003 ) ( SURFACE-AT ?auto_66995 ?auto_66981 ) ( ON ?auto_66995 ?auto_66985 ) ( CLEAR ?auto_66995 ) ( not ( = ?auto_66977 ?auto_66985 ) ) ( not ( = ?auto_66978 ?auto_66985 ) ) ( not ( = ?auto_66996 ?auto_66985 ) ) ( not ( = ?auto_66986 ?auto_66985 ) ) ( not ( = ?auto_67001 ?auto_66985 ) ) ( not ( = ?auto_67002 ?auto_66985 ) ) ( not ( = ?auto_67000 ?auto_66985 ) ) ( not ( = ?auto_66995 ?auto_66985 ) ) ( not ( = ?auto_66990 ?auto_66985 ) ) ( not ( = ?auto_66998 ?auto_66985 ) ) ( IS-CRATE ?auto_66998 ) ( not ( = ?auto_66977 ?auto_67004 ) ) ( not ( = ?auto_66978 ?auto_67004 ) ) ( not ( = ?auto_66996 ?auto_67004 ) ) ( not ( = ?auto_66986 ?auto_67004 ) ) ( not ( = ?auto_67001 ?auto_67004 ) ) ( not ( = ?auto_67002 ?auto_67004 ) ) ( not ( = ?auto_67000 ?auto_67004 ) ) ( not ( = ?auto_66995 ?auto_67004 ) ) ( not ( = ?auto_66990 ?auto_67004 ) ) ( not ( = ?auto_66998 ?auto_67004 ) ) ( not ( = ?auto_66985 ?auto_67004 ) ) ( AVAILABLE ?auto_66999 ) ( SURFACE-AT ?auto_66998 ?auto_66989 ) ( ON ?auto_66998 ?auto_66994 ) ( CLEAR ?auto_66998 ) ( not ( = ?auto_66977 ?auto_66994 ) ) ( not ( = ?auto_66978 ?auto_66994 ) ) ( not ( = ?auto_66996 ?auto_66994 ) ) ( not ( = ?auto_66986 ?auto_66994 ) ) ( not ( = ?auto_67001 ?auto_66994 ) ) ( not ( = ?auto_67002 ?auto_66994 ) ) ( not ( = ?auto_67000 ?auto_66994 ) ) ( not ( = ?auto_66995 ?auto_66994 ) ) ( not ( = ?auto_66990 ?auto_66994 ) ) ( not ( = ?auto_66998 ?auto_66994 ) ) ( not ( = ?auto_66985 ?auto_66994 ) ) ( not ( = ?auto_67004 ?auto_66994 ) ) ( IS-CRATE ?auto_67004 ) ( not ( = ?auto_66977 ?auto_66988 ) ) ( not ( = ?auto_66978 ?auto_66988 ) ) ( not ( = ?auto_66996 ?auto_66988 ) ) ( not ( = ?auto_66986 ?auto_66988 ) ) ( not ( = ?auto_67001 ?auto_66988 ) ) ( not ( = ?auto_67002 ?auto_66988 ) ) ( not ( = ?auto_67000 ?auto_66988 ) ) ( not ( = ?auto_66995 ?auto_66988 ) ) ( not ( = ?auto_66990 ?auto_66988 ) ) ( not ( = ?auto_66998 ?auto_66988 ) ) ( not ( = ?auto_66985 ?auto_66988 ) ) ( not ( = ?auto_67004 ?auto_66988 ) ) ( not ( = ?auto_66994 ?auto_66988 ) ) ( not ( = ?auto_66992 ?auto_66993 ) ) ( not ( = ?auto_66989 ?auto_66992 ) ) ( not ( = ?auto_66980 ?auto_66992 ) ) ( not ( = ?auto_66991 ?auto_66992 ) ) ( not ( = ?auto_66981 ?auto_66992 ) ) ( HOIST-AT ?auto_66984 ?auto_66992 ) ( not ( = ?auto_66997 ?auto_66984 ) ) ( not ( = ?auto_66999 ?auto_66984 ) ) ( not ( = ?auto_66987 ?auto_66984 ) ) ( not ( = ?auto_66983 ?auto_66984 ) ) ( not ( = ?auto_67003 ?auto_66984 ) ) ( AVAILABLE ?auto_66984 ) ( SURFACE-AT ?auto_67004 ?auto_66992 ) ( ON ?auto_67004 ?auto_66979 ) ( CLEAR ?auto_67004 ) ( not ( = ?auto_66977 ?auto_66979 ) ) ( not ( = ?auto_66978 ?auto_66979 ) ) ( not ( = ?auto_66996 ?auto_66979 ) ) ( not ( = ?auto_66986 ?auto_66979 ) ) ( not ( = ?auto_67001 ?auto_66979 ) ) ( not ( = ?auto_67002 ?auto_66979 ) ) ( not ( = ?auto_67000 ?auto_66979 ) ) ( not ( = ?auto_66995 ?auto_66979 ) ) ( not ( = ?auto_66990 ?auto_66979 ) ) ( not ( = ?auto_66998 ?auto_66979 ) ) ( not ( = ?auto_66985 ?auto_66979 ) ) ( not ( = ?auto_67004 ?auto_66979 ) ) ( not ( = ?auto_66994 ?auto_66979 ) ) ( not ( = ?auto_66988 ?auto_66979 ) ) ( TRUCK-AT ?auto_66982 ?auto_66993 ) ( SURFACE-AT ?auto_67005 ?auto_66993 ) ( CLEAR ?auto_67005 ) ( LIFTING ?auto_66997 ?auto_66988 ) ( IS-CRATE ?auto_66988 ) ( not ( = ?auto_66977 ?auto_67005 ) ) ( not ( = ?auto_66978 ?auto_67005 ) ) ( not ( = ?auto_66996 ?auto_67005 ) ) ( not ( = ?auto_66986 ?auto_67005 ) ) ( not ( = ?auto_67001 ?auto_67005 ) ) ( not ( = ?auto_67002 ?auto_67005 ) ) ( not ( = ?auto_67000 ?auto_67005 ) ) ( not ( = ?auto_66995 ?auto_67005 ) ) ( not ( = ?auto_66990 ?auto_67005 ) ) ( not ( = ?auto_66998 ?auto_67005 ) ) ( not ( = ?auto_66985 ?auto_67005 ) ) ( not ( = ?auto_67004 ?auto_67005 ) ) ( not ( = ?auto_66994 ?auto_67005 ) ) ( not ( = ?auto_66988 ?auto_67005 ) ) ( not ( = ?auto_66979 ?auto_67005 ) ) )
    :subtasks
    ( ( !DROP ?auto_66997 ?auto_66988 ?auto_67005 ?auto_66993 )
      ( MAKE-ON ?auto_66977 ?auto_66978 )
      ( MAKE-ON-VERIFY ?auto_66977 ?auto_66978 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_67006 - SURFACE
      ?auto_67007 - SURFACE
    )
    :vars
    (
      ?auto_67018 - HOIST
      ?auto_67030 - PLACE
      ?auto_67011 - PLACE
      ?auto_67020 - HOIST
      ?auto_67017 - SURFACE
      ?auto_67027 - SURFACE
      ?auto_67033 - PLACE
      ?auto_67034 - HOIST
      ?auto_67022 - SURFACE
      ?auto_67015 - SURFACE
      ?auto_67021 - SURFACE
      ?auto_67016 - SURFACE
      ?auto_67026 - PLACE
      ?auto_67032 - HOIST
      ?auto_67010 - SURFACE
      ?auto_67019 - SURFACE
      ?auto_67029 - PLACE
      ?auto_67013 - HOIST
      ?auto_67031 - SURFACE
      ?auto_67014 - SURFACE
      ?auto_67023 - SURFACE
      ?auto_67008 - SURFACE
      ?auto_67009 - PLACE
      ?auto_67028 - HOIST
      ?auto_67024 - SURFACE
      ?auto_67025 - TRUCK
      ?auto_67012 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_67018 ?auto_67030 ) ( IS-CRATE ?auto_67006 ) ( not ( = ?auto_67006 ?auto_67007 ) ) ( not ( = ?auto_67011 ?auto_67030 ) ) ( HOIST-AT ?auto_67020 ?auto_67011 ) ( not ( = ?auto_67018 ?auto_67020 ) ) ( SURFACE-AT ?auto_67006 ?auto_67011 ) ( ON ?auto_67006 ?auto_67017 ) ( CLEAR ?auto_67006 ) ( not ( = ?auto_67006 ?auto_67017 ) ) ( not ( = ?auto_67007 ?auto_67017 ) ) ( IS-CRATE ?auto_67007 ) ( not ( = ?auto_67006 ?auto_67027 ) ) ( not ( = ?auto_67007 ?auto_67027 ) ) ( not ( = ?auto_67017 ?auto_67027 ) ) ( not ( = ?auto_67033 ?auto_67030 ) ) ( not ( = ?auto_67011 ?auto_67033 ) ) ( HOIST-AT ?auto_67034 ?auto_67033 ) ( not ( = ?auto_67018 ?auto_67034 ) ) ( not ( = ?auto_67020 ?auto_67034 ) ) ( SURFACE-AT ?auto_67007 ?auto_67033 ) ( ON ?auto_67007 ?auto_67022 ) ( CLEAR ?auto_67007 ) ( not ( = ?auto_67006 ?auto_67022 ) ) ( not ( = ?auto_67007 ?auto_67022 ) ) ( not ( = ?auto_67017 ?auto_67022 ) ) ( not ( = ?auto_67027 ?auto_67022 ) ) ( IS-CRATE ?auto_67027 ) ( not ( = ?auto_67006 ?auto_67015 ) ) ( not ( = ?auto_67007 ?auto_67015 ) ) ( not ( = ?auto_67017 ?auto_67015 ) ) ( not ( = ?auto_67027 ?auto_67015 ) ) ( not ( = ?auto_67022 ?auto_67015 ) ) ( AVAILABLE ?auto_67034 ) ( SURFACE-AT ?auto_67027 ?auto_67033 ) ( ON ?auto_67027 ?auto_67021 ) ( CLEAR ?auto_67027 ) ( not ( = ?auto_67006 ?auto_67021 ) ) ( not ( = ?auto_67007 ?auto_67021 ) ) ( not ( = ?auto_67017 ?auto_67021 ) ) ( not ( = ?auto_67027 ?auto_67021 ) ) ( not ( = ?auto_67022 ?auto_67021 ) ) ( not ( = ?auto_67015 ?auto_67021 ) ) ( IS-CRATE ?auto_67015 ) ( not ( = ?auto_67006 ?auto_67016 ) ) ( not ( = ?auto_67007 ?auto_67016 ) ) ( not ( = ?auto_67017 ?auto_67016 ) ) ( not ( = ?auto_67027 ?auto_67016 ) ) ( not ( = ?auto_67022 ?auto_67016 ) ) ( not ( = ?auto_67015 ?auto_67016 ) ) ( not ( = ?auto_67021 ?auto_67016 ) ) ( not ( = ?auto_67026 ?auto_67030 ) ) ( not ( = ?auto_67011 ?auto_67026 ) ) ( not ( = ?auto_67033 ?auto_67026 ) ) ( HOIST-AT ?auto_67032 ?auto_67026 ) ( not ( = ?auto_67018 ?auto_67032 ) ) ( not ( = ?auto_67020 ?auto_67032 ) ) ( not ( = ?auto_67034 ?auto_67032 ) ) ( AVAILABLE ?auto_67032 ) ( SURFACE-AT ?auto_67015 ?auto_67026 ) ( ON ?auto_67015 ?auto_67010 ) ( CLEAR ?auto_67015 ) ( not ( = ?auto_67006 ?auto_67010 ) ) ( not ( = ?auto_67007 ?auto_67010 ) ) ( not ( = ?auto_67017 ?auto_67010 ) ) ( not ( = ?auto_67027 ?auto_67010 ) ) ( not ( = ?auto_67022 ?auto_67010 ) ) ( not ( = ?auto_67015 ?auto_67010 ) ) ( not ( = ?auto_67021 ?auto_67010 ) ) ( not ( = ?auto_67016 ?auto_67010 ) ) ( IS-CRATE ?auto_67016 ) ( not ( = ?auto_67006 ?auto_67019 ) ) ( not ( = ?auto_67007 ?auto_67019 ) ) ( not ( = ?auto_67017 ?auto_67019 ) ) ( not ( = ?auto_67027 ?auto_67019 ) ) ( not ( = ?auto_67022 ?auto_67019 ) ) ( not ( = ?auto_67015 ?auto_67019 ) ) ( not ( = ?auto_67021 ?auto_67019 ) ) ( not ( = ?auto_67016 ?auto_67019 ) ) ( not ( = ?auto_67010 ?auto_67019 ) ) ( not ( = ?auto_67029 ?auto_67030 ) ) ( not ( = ?auto_67011 ?auto_67029 ) ) ( not ( = ?auto_67033 ?auto_67029 ) ) ( not ( = ?auto_67026 ?auto_67029 ) ) ( HOIST-AT ?auto_67013 ?auto_67029 ) ( not ( = ?auto_67018 ?auto_67013 ) ) ( not ( = ?auto_67020 ?auto_67013 ) ) ( not ( = ?auto_67034 ?auto_67013 ) ) ( not ( = ?auto_67032 ?auto_67013 ) ) ( AVAILABLE ?auto_67013 ) ( SURFACE-AT ?auto_67016 ?auto_67029 ) ( ON ?auto_67016 ?auto_67031 ) ( CLEAR ?auto_67016 ) ( not ( = ?auto_67006 ?auto_67031 ) ) ( not ( = ?auto_67007 ?auto_67031 ) ) ( not ( = ?auto_67017 ?auto_67031 ) ) ( not ( = ?auto_67027 ?auto_67031 ) ) ( not ( = ?auto_67022 ?auto_67031 ) ) ( not ( = ?auto_67015 ?auto_67031 ) ) ( not ( = ?auto_67021 ?auto_67031 ) ) ( not ( = ?auto_67016 ?auto_67031 ) ) ( not ( = ?auto_67010 ?auto_67031 ) ) ( not ( = ?auto_67019 ?auto_67031 ) ) ( IS-CRATE ?auto_67019 ) ( not ( = ?auto_67006 ?auto_67014 ) ) ( not ( = ?auto_67007 ?auto_67014 ) ) ( not ( = ?auto_67017 ?auto_67014 ) ) ( not ( = ?auto_67027 ?auto_67014 ) ) ( not ( = ?auto_67022 ?auto_67014 ) ) ( not ( = ?auto_67015 ?auto_67014 ) ) ( not ( = ?auto_67021 ?auto_67014 ) ) ( not ( = ?auto_67016 ?auto_67014 ) ) ( not ( = ?auto_67010 ?auto_67014 ) ) ( not ( = ?auto_67019 ?auto_67014 ) ) ( not ( = ?auto_67031 ?auto_67014 ) ) ( AVAILABLE ?auto_67020 ) ( SURFACE-AT ?auto_67019 ?auto_67011 ) ( ON ?auto_67019 ?auto_67023 ) ( CLEAR ?auto_67019 ) ( not ( = ?auto_67006 ?auto_67023 ) ) ( not ( = ?auto_67007 ?auto_67023 ) ) ( not ( = ?auto_67017 ?auto_67023 ) ) ( not ( = ?auto_67027 ?auto_67023 ) ) ( not ( = ?auto_67022 ?auto_67023 ) ) ( not ( = ?auto_67015 ?auto_67023 ) ) ( not ( = ?auto_67021 ?auto_67023 ) ) ( not ( = ?auto_67016 ?auto_67023 ) ) ( not ( = ?auto_67010 ?auto_67023 ) ) ( not ( = ?auto_67019 ?auto_67023 ) ) ( not ( = ?auto_67031 ?auto_67023 ) ) ( not ( = ?auto_67014 ?auto_67023 ) ) ( IS-CRATE ?auto_67014 ) ( not ( = ?auto_67006 ?auto_67008 ) ) ( not ( = ?auto_67007 ?auto_67008 ) ) ( not ( = ?auto_67017 ?auto_67008 ) ) ( not ( = ?auto_67027 ?auto_67008 ) ) ( not ( = ?auto_67022 ?auto_67008 ) ) ( not ( = ?auto_67015 ?auto_67008 ) ) ( not ( = ?auto_67021 ?auto_67008 ) ) ( not ( = ?auto_67016 ?auto_67008 ) ) ( not ( = ?auto_67010 ?auto_67008 ) ) ( not ( = ?auto_67019 ?auto_67008 ) ) ( not ( = ?auto_67031 ?auto_67008 ) ) ( not ( = ?auto_67014 ?auto_67008 ) ) ( not ( = ?auto_67023 ?auto_67008 ) ) ( not ( = ?auto_67009 ?auto_67030 ) ) ( not ( = ?auto_67011 ?auto_67009 ) ) ( not ( = ?auto_67033 ?auto_67009 ) ) ( not ( = ?auto_67026 ?auto_67009 ) ) ( not ( = ?auto_67029 ?auto_67009 ) ) ( HOIST-AT ?auto_67028 ?auto_67009 ) ( not ( = ?auto_67018 ?auto_67028 ) ) ( not ( = ?auto_67020 ?auto_67028 ) ) ( not ( = ?auto_67034 ?auto_67028 ) ) ( not ( = ?auto_67032 ?auto_67028 ) ) ( not ( = ?auto_67013 ?auto_67028 ) ) ( AVAILABLE ?auto_67028 ) ( SURFACE-AT ?auto_67014 ?auto_67009 ) ( ON ?auto_67014 ?auto_67024 ) ( CLEAR ?auto_67014 ) ( not ( = ?auto_67006 ?auto_67024 ) ) ( not ( = ?auto_67007 ?auto_67024 ) ) ( not ( = ?auto_67017 ?auto_67024 ) ) ( not ( = ?auto_67027 ?auto_67024 ) ) ( not ( = ?auto_67022 ?auto_67024 ) ) ( not ( = ?auto_67015 ?auto_67024 ) ) ( not ( = ?auto_67021 ?auto_67024 ) ) ( not ( = ?auto_67016 ?auto_67024 ) ) ( not ( = ?auto_67010 ?auto_67024 ) ) ( not ( = ?auto_67019 ?auto_67024 ) ) ( not ( = ?auto_67031 ?auto_67024 ) ) ( not ( = ?auto_67014 ?auto_67024 ) ) ( not ( = ?auto_67023 ?auto_67024 ) ) ( not ( = ?auto_67008 ?auto_67024 ) ) ( TRUCK-AT ?auto_67025 ?auto_67030 ) ( SURFACE-AT ?auto_67012 ?auto_67030 ) ( CLEAR ?auto_67012 ) ( IS-CRATE ?auto_67008 ) ( not ( = ?auto_67006 ?auto_67012 ) ) ( not ( = ?auto_67007 ?auto_67012 ) ) ( not ( = ?auto_67017 ?auto_67012 ) ) ( not ( = ?auto_67027 ?auto_67012 ) ) ( not ( = ?auto_67022 ?auto_67012 ) ) ( not ( = ?auto_67015 ?auto_67012 ) ) ( not ( = ?auto_67021 ?auto_67012 ) ) ( not ( = ?auto_67016 ?auto_67012 ) ) ( not ( = ?auto_67010 ?auto_67012 ) ) ( not ( = ?auto_67019 ?auto_67012 ) ) ( not ( = ?auto_67031 ?auto_67012 ) ) ( not ( = ?auto_67014 ?auto_67012 ) ) ( not ( = ?auto_67023 ?auto_67012 ) ) ( not ( = ?auto_67008 ?auto_67012 ) ) ( not ( = ?auto_67024 ?auto_67012 ) ) ( AVAILABLE ?auto_67018 ) ( IN ?auto_67008 ?auto_67025 ) )
    :subtasks
    ( ( !UNLOAD ?auto_67018 ?auto_67008 ?auto_67025 ?auto_67030 )
      ( MAKE-ON ?auto_67006 ?auto_67007 )
      ( MAKE-ON-VERIFY ?auto_67006 ?auto_67007 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_67035 - SURFACE
      ?auto_67036 - SURFACE
    )
    :vars
    (
      ?auto_67047 - HOIST
      ?auto_67056 - PLACE
      ?auto_67044 - PLACE
      ?auto_67062 - HOIST
      ?auto_67039 - SURFACE
      ?auto_67053 - SURFACE
      ?auto_67041 - PLACE
      ?auto_67038 - HOIST
      ?auto_67059 - SURFACE
      ?auto_67045 - SURFACE
      ?auto_67058 - SURFACE
      ?auto_67037 - SURFACE
      ?auto_67052 - PLACE
      ?auto_67042 - HOIST
      ?auto_67043 - SURFACE
      ?auto_67040 - SURFACE
      ?auto_67055 - PLACE
      ?auto_67048 - HOIST
      ?auto_67049 - SURFACE
      ?auto_67063 - SURFACE
      ?auto_67057 - SURFACE
      ?auto_67046 - SURFACE
      ?auto_67061 - PLACE
      ?auto_67054 - HOIST
      ?auto_67050 - SURFACE
      ?auto_67060 - SURFACE
      ?auto_67051 - TRUCK
      ?auto_67064 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_67047 ?auto_67056 ) ( IS-CRATE ?auto_67035 ) ( not ( = ?auto_67035 ?auto_67036 ) ) ( not ( = ?auto_67044 ?auto_67056 ) ) ( HOIST-AT ?auto_67062 ?auto_67044 ) ( not ( = ?auto_67047 ?auto_67062 ) ) ( SURFACE-AT ?auto_67035 ?auto_67044 ) ( ON ?auto_67035 ?auto_67039 ) ( CLEAR ?auto_67035 ) ( not ( = ?auto_67035 ?auto_67039 ) ) ( not ( = ?auto_67036 ?auto_67039 ) ) ( IS-CRATE ?auto_67036 ) ( not ( = ?auto_67035 ?auto_67053 ) ) ( not ( = ?auto_67036 ?auto_67053 ) ) ( not ( = ?auto_67039 ?auto_67053 ) ) ( not ( = ?auto_67041 ?auto_67056 ) ) ( not ( = ?auto_67044 ?auto_67041 ) ) ( HOIST-AT ?auto_67038 ?auto_67041 ) ( not ( = ?auto_67047 ?auto_67038 ) ) ( not ( = ?auto_67062 ?auto_67038 ) ) ( SURFACE-AT ?auto_67036 ?auto_67041 ) ( ON ?auto_67036 ?auto_67059 ) ( CLEAR ?auto_67036 ) ( not ( = ?auto_67035 ?auto_67059 ) ) ( not ( = ?auto_67036 ?auto_67059 ) ) ( not ( = ?auto_67039 ?auto_67059 ) ) ( not ( = ?auto_67053 ?auto_67059 ) ) ( IS-CRATE ?auto_67053 ) ( not ( = ?auto_67035 ?auto_67045 ) ) ( not ( = ?auto_67036 ?auto_67045 ) ) ( not ( = ?auto_67039 ?auto_67045 ) ) ( not ( = ?auto_67053 ?auto_67045 ) ) ( not ( = ?auto_67059 ?auto_67045 ) ) ( AVAILABLE ?auto_67038 ) ( SURFACE-AT ?auto_67053 ?auto_67041 ) ( ON ?auto_67053 ?auto_67058 ) ( CLEAR ?auto_67053 ) ( not ( = ?auto_67035 ?auto_67058 ) ) ( not ( = ?auto_67036 ?auto_67058 ) ) ( not ( = ?auto_67039 ?auto_67058 ) ) ( not ( = ?auto_67053 ?auto_67058 ) ) ( not ( = ?auto_67059 ?auto_67058 ) ) ( not ( = ?auto_67045 ?auto_67058 ) ) ( IS-CRATE ?auto_67045 ) ( not ( = ?auto_67035 ?auto_67037 ) ) ( not ( = ?auto_67036 ?auto_67037 ) ) ( not ( = ?auto_67039 ?auto_67037 ) ) ( not ( = ?auto_67053 ?auto_67037 ) ) ( not ( = ?auto_67059 ?auto_67037 ) ) ( not ( = ?auto_67045 ?auto_67037 ) ) ( not ( = ?auto_67058 ?auto_67037 ) ) ( not ( = ?auto_67052 ?auto_67056 ) ) ( not ( = ?auto_67044 ?auto_67052 ) ) ( not ( = ?auto_67041 ?auto_67052 ) ) ( HOIST-AT ?auto_67042 ?auto_67052 ) ( not ( = ?auto_67047 ?auto_67042 ) ) ( not ( = ?auto_67062 ?auto_67042 ) ) ( not ( = ?auto_67038 ?auto_67042 ) ) ( AVAILABLE ?auto_67042 ) ( SURFACE-AT ?auto_67045 ?auto_67052 ) ( ON ?auto_67045 ?auto_67043 ) ( CLEAR ?auto_67045 ) ( not ( = ?auto_67035 ?auto_67043 ) ) ( not ( = ?auto_67036 ?auto_67043 ) ) ( not ( = ?auto_67039 ?auto_67043 ) ) ( not ( = ?auto_67053 ?auto_67043 ) ) ( not ( = ?auto_67059 ?auto_67043 ) ) ( not ( = ?auto_67045 ?auto_67043 ) ) ( not ( = ?auto_67058 ?auto_67043 ) ) ( not ( = ?auto_67037 ?auto_67043 ) ) ( IS-CRATE ?auto_67037 ) ( not ( = ?auto_67035 ?auto_67040 ) ) ( not ( = ?auto_67036 ?auto_67040 ) ) ( not ( = ?auto_67039 ?auto_67040 ) ) ( not ( = ?auto_67053 ?auto_67040 ) ) ( not ( = ?auto_67059 ?auto_67040 ) ) ( not ( = ?auto_67045 ?auto_67040 ) ) ( not ( = ?auto_67058 ?auto_67040 ) ) ( not ( = ?auto_67037 ?auto_67040 ) ) ( not ( = ?auto_67043 ?auto_67040 ) ) ( not ( = ?auto_67055 ?auto_67056 ) ) ( not ( = ?auto_67044 ?auto_67055 ) ) ( not ( = ?auto_67041 ?auto_67055 ) ) ( not ( = ?auto_67052 ?auto_67055 ) ) ( HOIST-AT ?auto_67048 ?auto_67055 ) ( not ( = ?auto_67047 ?auto_67048 ) ) ( not ( = ?auto_67062 ?auto_67048 ) ) ( not ( = ?auto_67038 ?auto_67048 ) ) ( not ( = ?auto_67042 ?auto_67048 ) ) ( AVAILABLE ?auto_67048 ) ( SURFACE-AT ?auto_67037 ?auto_67055 ) ( ON ?auto_67037 ?auto_67049 ) ( CLEAR ?auto_67037 ) ( not ( = ?auto_67035 ?auto_67049 ) ) ( not ( = ?auto_67036 ?auto_67049 ) ) ( not ( = ?auto_67039 ?auto_67049 ) ) ( not ( = ?auto_67053 ?auto_67049 ) ) ( not ( = ?auto_67059 ?auto_67049 ) ) ( not ( = ?auto_67045 ?auto_67049 ) ) ( not ( = ?auto_67058 ?auto_67049 ) ) ( not ( = ?auto_67037 ?auto_67049 ) ) ( not ( = ?auto_67043 ?auto_67049 ) ) ( not ( = ?auto_67040 ?auto_67049 ) ) ( IS-CRATE ?auto_67040 ) ( not ( = ?auto_67035 ?auto_67063 ) ) ( not ( = ?auto_67036 ?auto_67063 ) ) ( not ( = ?auto_67039 ?auto_67063 ) ) ( not ( = ?auto_67053 ?auto_67063 ) ) ( not ( = ?auto_67059 ?auto_67063 ) ) ( not ( = ?auto_67045 ?auto_67063 ) ) ( not ( = ?auto_67058 ?auto_67063 ) ) ( not ( = ?auto_67037 ?auto_67063 ) ) ( not ( = ?auto_67043 ?auto_67063 ) ) ( not ( = ?auto_67040 ?auto_67063 ) ) ( not ( = ?auto_67049 ?auto_67063 ) ) ( AVAILABLE ?auto_67062 ) ( SURFACE-AT ?auto_67040 ?auto_67044 ) ( ON ?auto_67040 ?auto_67057 ) ( CLEAR ?auto_67040 ) ( not ( = ?auto_67035 ?auto_67057 ) ) ( not ( = ?auto_67036 ?auto_67057 ) ) ( not ( = ?auto_67039 ?auto_67057 ) ) ( not ( = ?auto_67053 ?auto_67057 ) ) ( not ( = ?auto_67059 ?auto_67057 ) ) ( not ( = ?auto_67045 ?auto_67057 ) ) ( not ( = ?auto_67058 ?auto_67057 ) ) ( not ( = ?auto_67037 ?auto_67057 ) ) ( not ( = ?auto_67043 ?auto_67057 ) ) ( not ( = ?auto_67040 ?auto_67057 ) ) ( not ( = ?auto_67049 ?auto_67057 ) ) ( not ( = ?auto_67063 ?auto_67057 ) ) ( IS-CRATE ?auto_67063 ) ( not ( = ?auto_67035 ?auto_67046 ) ) ( not ( = ?auto_67036 ?auto_67046 ) ) ( not ( = ?auto_67039 ?auto_67046 ) ) ( not ( = ?auto_67053 ?auto_67046 ) ) ( not ( = ?auto_67059 ?auto_67046 ) ) ( not ( = ?auto_67045 ?auto_67046 ) ) ( not ( = ?auto_67058 ?auto_67046 ) ) ( not ( = ?auto_67037 ?auto_67046 ) ) ( not ( = ?auto_67043 ?auto_67046 ) ) ( not ( = ?auto_67040 ?auto_67046 ) ) ( not ( = ?auto_67049 ?auto_67046 ) ) ( not ( = ?auto_67063 ?auto_67046 ) ) ( not ( = ?auto_67057 ?auto_67046 ) ) ( not ( = ?auto_67061 ?auto_67056 ) ) ( not ( = ?auto_67044 ?auto_67061 ) ) ( not ( = ?auto_67041 ?auto_67061 ) ) ( not ( = ?auto_67052 ?auto_67061 ) ) ( not ( = ?auto_67055 ?auto_67061 ) ) ( HOIST-AT ?auto_67054 ?auto_67061 ) ( not ( = ?auto_67047 ?auto_67054 ) ) ( not ( = ?auto_67062 ?auto_67054 ) ) ( not ( = ?auto_67038 ?auto_67054 ) ) ( not ( = ?auto_67042 ?auto_67054 ) ) ( not ( = ?auto_67048 ?auto_67054 ) ) ( AVAILABLE ?auto_67054 ) ( SURFACE-AT ?auto_67063 ?auto_67061 ) ( ON ?auto_67063 ?auto_67050 ) ( CLEAR ?auto_67063 ) ( not ( = ?auto_67035 ?auto_67050 ) ) ( not ( = ?auto_67036 ?auto_67050 ) ) ( not ( = ?auto_67039 ?auto_67050 ) ) ( not ( = ?auto_67053 ?auto_67050 ) ) ( not ( = ?auto_67059 ?auto_67050 ) ) ( not ( = ?auto_67045 ?auto_67050 ) ) ( not ( = ?auto_67058 ?auto_67050 ) ) ( not ( = ?auto_67037 ?auto_67050 ) ) ( not ( = ?auto_67043 ?auto_67050 ) ) ( not ( = ?auto_67040 ?auto_67050 ) ) ( not ( = ?auto_67049 ?auto_67050 ) ) ( not ( = ?auto_67063 ?auto_67050 ) ) ( not ( = ?auto_67057 ?auto_67050 ) ) ( not ( = ?auto_67046 ?auto_67050 ) ) ( SURFACE-AT ?auto_67060 ?auto_67056 ) ( CLEAR ?auto_67060 ) ( IS-CRATE ?auto_67046 ) ( not ( = ?auto_67035 ?auto_67060 ) ) ( not ( = ?auto_67036 ?auto_67060 ) ) ( not ( = ?auto_67039 ?auto_67060 ) ) ( not ( = ?auto_67053 ?auto_67060 ) ) ( not ( = ?auto_67059 ?auto_67060 ) ) ( not ( = ?auto_67045 ?auto_67060 ) ) ( not ( = ?auto_67058 ?auto_67060 ) ) ( not ( = ?auto_67037 ?auto_67060 ) ) ( not ( = ?auto_67043 ?auto_67060 ) ) ( not ( = ?auto_67040 ?auto_67060 ) ) ( not ( = ?auto_67049 ?auto_67060 ) ) ( not ( = ?auto_67063 ?auto_67060 ) ) ( not ( = ?auto_67057 ?auto_67060 ) ) ( not ( = ?auto_67046 ?auto_67060 ) ) ( not ( = ?auto_67050 ?auto_67060 ) ) ( AVAILABLE ?auto_67047 ) ( IN ?auto_67046 ?auto_67051 ) ( TRUCK-AT ?auto_67051 ?auto_67064 ) ( not ( = ?auto_67064 ?auto_67056 ) ) ( not ( = ?auto_67044 ?auto_67064 ) ) ( not ( = ?auto_67041 ?auto_67064 ) ) ( not ( = ?auto_67052 ?auto_67064 ) ) ( not ( = ?auto_67055 ?auto_67064 ) ) ( not ( = ?auto_67061 ?auto_67064 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_67051 ?auto_67064 ?auto_67056 )
      ( MAKE-ON ?auto_67035 ?auto_67036 )
      ( MAKE-ON-VERIFY ?auto_67035 ?auto_67036 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_67065 - SURFACE
      ?auto_67066 - SURFACE
    )
    :vars
    (
      ?auto_67074 - HOIST
      ?auto_67082 - PLACE
      ?auto_67089 - PLACE
      ?auto_67068 - HOIST
      ?auto_67090 - SURFACE
      ?auto_67079 - SURFACE
      ?auto_67093 - PLACE
      ?auto_67091 - HOIST
      ?auto_67085 - SURFACE
      ?auto_67072 - SURFACE
      ?auto_67084 - SURFACE
      ?auto_67071 - SURFACE
      ?auto_67086 - PLACE
      ?auto_67088 - HOIST
      ?auto_67087 - SURFACE
      ?auto_67092 - SURFACE
      ?auto_67081 - PLACE
      ?auto_67094 - HOIST
      ?auto_67075 - SURFACE
      ?auto_67069 - SURFACE
      ?auto_67083 - SURFACE
      ?auto_67077 - SURFACE
      ?auto_67067 - PLACE
      ?auto_67080 - HOIST
      ?auto_67078 - SURFACE
      ?auto_67070 - SURFACE
      ?auto_67076 - TRUCK
      ?auto_67073 - PLACE
      ?auto_67095 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_67074 ?auto_67082 ) ( IS-CRATE ?auto_67065 ) ( not ( = ?auto_67065 ?auto_67066 ) ) ( not ( = ?auto_67089 ?auto_67082 ) ) ( HOIST-AT ?auto_67068 ?auto_67089 ) ( not ( = ?auto_67074 ?auto_67068 ) ) ( SURFACE-AT ?auto_67065 ?auto_67089 ) ( ON ?auto_67065 ?auto_67090 ) ( CLEAR ?auto_67065 ) ( not ( = ?auto_67065 ?auto_67090 ) ) ( not ( = ?auto_67066 ?auto_67090 ) ) ( IS-CRATE ?auto_67066 ) ( not ( = ?auto_67065 ?auto_67079 ) ) ( not ( = ?auto_67066 ?auto_67079 ) ) ( not ( = ?auto_67090 ?auto_67079 ) ) ( not ( = ?auto_67093 ?auto_67082 ) ) ( not ( = ?auto_67089 ?auto_67093 ) ) ( HOIST-AT ?auto_67091 ?auto_67093 ) ( not ( = ?auto_67074 ?auto_67091 ) ) ( not ( = ?auto_67068 ?auto_67091 ) ) ( SURFACE-AT ?auto_67066 ?auto_67093 ) ( ON ?auto_67066 ?auto_67085 ) ( CLEAR ?auto_67066 ) ( not ( = ?auto_67065 ?auto_67085 ) ) ( not ( = ?auto_67066 ?auto_67085 ) ) ( not ( = ?auto_67090 ?auto_67085 ) ) ( not ( = ?auto_67079 ?auto_67085 ) ) ( IS-CRATE ?auto_67079 ) ( not ( = ?auto_67065 ?auto_67072 ) ) ( not ( = ?auto_67066 ?auto_67072 ) ) ( not ( = ?auto_67090 ?auto_67072 ) ) ( not ( = ?auto_67079 ?auto_67072 ) ) ( not ( = ?auto_67085 ?auto_67072 ) ) ( AVAILABLE ?auto_67091 ) ( SURFACE-AT ?auto_67079 ?auto_67093 ) ( ON ?auto_67079 ?auto_67084 ) ( CLEAR ?auto_67079 ) ( not ( = ?auto_67065 ?auto_67084 ) ) ( not ( = ?auto_67066 ?auto_67084 ) ) ( not ( = ?auto_67090 ?auto_67084 ) ) ( not ( = ?auto_67079 ?auto_67084 ) ) ( not ( = ?auto_67085 ?auto_67084 ) ) ( not ( = ?auto_67072 ?auto_67084 ) ) ( IS-CRATE ?auto_67072 ) ( not ( = ?auto_67065 ?auto_67071 ) ) ( not ( = ?auto_67066 ?auto_67071 ) ) ( not ( = ?auto_67090 ?auto_67071 ) ) ( not ( = ?auto_67079 ?auto_67071 ) ) ( not ( = ?auto_67085 ?auto_67071 ) ) ( not ( = ?auto_67072 ?auto_67071 ) ) ( not ( = ?auto_67084 ?auto_67071 ) ) ( not ( = ?auto_67086 ?auto_67082 ) ) ( not ( = ?auto_67089 ?auto_67086 ) ) ( not ( = ?auto_67093 ?auto_67086 ) ) ( HOIST-AT ?auto_67088 ?auto_67086 ) ( not ( = ?auto_67074 ?auto_67088 ) ) ( not ( = ?auto_67068 ?auto_67088 ) ) ( not ( = ?auto_67091 ?auto_67088 ) ) ( AVAILABLE ?auto_67088 ) ( SURFACE-AT ?auto_67072 ?auto_67086 ) ( ON ?auto_67072 ?auto_67087 ) ( CLEAR ?auto_67072 ) ( not ( = ?auto_67065 ?auto_67087 ) ) ( not ( = ?auto_67066 ?auto_67087 ) ) ( not ( = ?auto_67090 ?auto_67087 ) ) ( not ( = ?auto_67079 ?auto_67087 ) ) ( not ( = ?auto_67085 ?auto_67087 ) ) ( not ( = ?auto_67072 ?auto_67087 ) ) ( not ( = ?auto_67084 ?auto_67087 ) ) ( not ( = ?auto_67071 ?auto_67087 ) ) ( IS-CRATE ?auto_67071 ) ( not ( = ?auto_67065 ?auto_67092 ) ) ( not ( = ?auto_67066 ?auto_67092 ) ) ( not ( = ?auto_67090 ?auto_67092 ) ) ( not ( = ?auto_67079 ?auto_67092 ) ) ( not ( = ?auto_67085 ?auto_67092 ) ) ( not ( = ?auto_67072 ?auto_67092 ) ) ( not ( = ?auto_67084 ?auto_67092 ) ) ( not ( = ?auto_67071 ?auto_67092 ) ) ( not ( = ?auto_67087 ?auto_67092 ) ) ( not ( = ?auto_67081 ?auto_67082 ) ) ( not ( = ?auto_67089 ?auto_67081 ) ) ( not ( = ?auto_67093 ?auto_67081 ) ) ( not ( = ?auto_67086 ?auto_67081 ) ) ( HOIST-AT ?auto_67094 ?auto_67081 ) ( not ( = ?auto_67074 ?auto_67094 ) ) ( not ( = ?auto_67068 ?auto_67094 ) ) ( not ( = ?auto_67091 ?auto_67094 ) ) ( not ( = ?auto_67088 ?auto_67094 ) ) ( AVAILABLE ?auto_67094 ) ( SURFACE-AT ?auto_67071 ?auto_67081 ) ( ON ?auto_67071 ?auto_67075 ) ( CLEAR ?auto_67071 ) ( not ( = ?auto_67065 ?auto_67075 ) ) ( not ( = ?auto_67066 ?auto_67075 ) ) ( not ( = ?auto_67090 ?auto_67075 ) ) ( not ( = ?auto_67079 ?auto_67075 ) ) ( not ( = ?auto_67085 ?auto_67075 ) ) ( not ( = ?auto_67072 ?auto_67075 ) ) ( not ( = ?auto_67084 ?auto_67075 ) ) ( not ( = ?auto_67071 ?auto_67075 ) ) ( not ( = ?auto_67087 ?auto_67075 ) ) ( not ( = ?auto_67092 ?auto_67075 ) ) ( IS-CRATE ?auto_67092 ) ( not ( = ?auto_67065 ?auto_67069 ) ) ( not ( = ?auto_67066 ?auto_67069 ) ) ( not ( = ?auto_67090 ?auto_67069 ) ) ( not ( = ?auto_67079 ?auto_67069 ) ) ( not ( = ?auto_67085 ?auto_67069 ) ) ( not ( = ?auto_67072 ?auto_67069 ) ) ( not ( = ?auto_67084 ?auto_67069 ) ) ( not ( = ?auto_67071 ?auto_67069 ) ) ( not ( = ?auto_67087 ?auto_67069 ) ) ( not ( = ?auto_67092 ?auto_67069 ) ) ( not ( = ?auto_67075 ?auto_67069 ) ) ( AVAILABLE ?auto_67068 ) ( SURFACE-AT ?auto_67092 ?auto_67089 ) ( ON ?auto_67092 ?auto_67083 ) ( CLEAR ?auto_67092 ) ( not ( = ?auto_67065 ?auto_67083 ) ) ( not ( = ?auto_67066 ?auto_67083 ) ) ( not ( = ?auto_67090 ?auto_67083 ) ) ( not ( = ?auto_67079 ?auto_67083 ) ) ( not ( = ?auto_67085 ?auto_67083 ) ) ( not ( = ?auto_67072 ?auto_67083 ) ) ( not ( = ?auto_67084 ?auto_67083 ) ) ( not ( = ?auto_67071 ?auto_67083 ) ) ( not ( = ?auto_67087 ?auto_67083 ) ) ( not ( = ?auto_67092 ?auto_67083 ) ) ( not ( = ?auto_67075 ?auto_67083 ) ) ( not ( = ?auto_67069 ?auto_67083 ) ) ( IS-CRATE ?auto_67069 ) ( not ( = ?auto_67065 ?auto_67077 ) ) ( not ( = ?auto_67066 ?auto_67077 ) ) ( not ( = ?auto_67090 ?auto_67077 ) ) ( not ( = ?auto_67079 ?auto_67077 ) ) ( not ( = ?auto_67085 ?auto_67077 ) ) ( not ( = ?auto_67072 ?auto_67077 ) ) ( not ( = ?auto_67084 ?auto_67077 ) ) ( not ( = ?auto_67071 ?auto_67077 ) ) ( not ( = ?auto_67087 ?auto_67077 ) ) ( not ( = ?auto_67092 ?auto_67077 ) ) ( not ( = ?auto_67075 ?auto_67077 ) ) ( not ( = ?auto_67069 ?auto_67077 ) ) ( not ( = ?auto_67083 ?auto_67077 ) ) ( not ( = ?auto_67067 ?auto_67082 ) ) ( not ( = ?auto_67089 ?auto_67067 ) ) ( not ( = ?auto_67093 ?auto_67067 ) ) ( not ( = ?auto_67086 ?auto_67067 ) ) ( not ( = ?auto_67081 ?auto_67067 ) ) ( HOIST-AT ?auto_67080 ?auto_67067 ) ( not ( = ?auto_67074 ?auto_67080 ) ) ( not ( = ?auto_67068 ?auto_67080 ) ) ( not ( = ?auto_67091 ?auto_67080 ) ) ( not ( = ?auto_67088 ?auto_67080 ) ) ( not ( = ?auto_67094 ?auto_67080 ) ) ( AVAILABLE ?auto_67080 ) ( SURFACE-AT ?auto_67069 ?auto_67067 ) ( ON ?auto_67069 ?auto_67078 ) ( CLEAR ?auto_67069 ) ( not ( = ?auto_67065 ?auto_67078 ) ) ( not ( = ?auto_67066 ?auto_67078 ) ) ( not ( = ?auto_67090 ?auto_67078 ) ) ( not ( = ?auto_67079 ?auto_67078 ) ) ( not ( = ?auto_67085 ?auto_67078 ) ) ( not ( = ?auto_67072 ?auto_67078 ) ) ( not ( = ?auto_67084 ?auto_67078 ) ) ( not ( = ?auto_67071 ?auto_67078 ) ) ( not ( = ?auto_67087 ?auto_67078 ) ) ( not ( = ?auto_67092 ?auto_67078 ) ) ( not ( = ?auto_67075 ?auto_67078 ) ) ( not ( = ?auto_67069 ?auto_67078 ) ) ( not ( = ?auto_67083 ?auto_67078 ) ) ( not ( = ?auto_67077 ?auto_67078 ) ) ( SURFACE-AT ?auto_67070 ?auto_67082 ) ( CLEAR ?auto_67070 ) ( IS-CRATE ?auto_67077 ) ( not ( = ?auto_67065 ?auto_67070 ) ) ( not ( = ?auto_67066 ?auto_67070 ) ) ( not ( = ?auto_67090 ?auto_67070 ) ) ( not ( = ?auto_67079 ?auto_67070 ) ) ( not ( = ?auto_67085 ?auto_67070 ) ) ( not ( = ?auto_67072 ?auto_67070 ) ) ( not ( = ?auto_67084 ?auto_67070 ) ) ( not ( = ?auto_67071 ?auto_67070 ) ) ( not ( = ?auto_67087 ?auto_67070 ) ) ( not ( = ?auto_67092 ?auto_67070 ) ) ( not ( = ?auto_67075 ?auto_67070 ) ) ( not ( = ?auto_67069 ?auto_67070 ) ) ( not ( = ?auto_67083 ?auto_67070 ) ) ( not ( = ?auto_67077 ?auto_67070 ) ) ( not ( = ?auto_67078 ?auto_67070 ) ) ( AVAILABLE ?auto_67074 ) ( TRUCK-AT ?auto_67076 ?auto_67073 ) ( not ( = ?auto_67073 ?auto_67082 ) ) ( not ( = ?auto_67089 ?auto_67073 ) ) ( not ( = ?auto_67093 ?auto_67073 ) ) ( not ( = ?auto_67086 ?auto_67073 ) ) ( not ( = ?auto_67081 ?auto_67073 ) ) ( not ( = ?auto_67067 ?auto_67073 ) ) ( HOIST-AT ?auto_67095 ?auto_67073 ) ( LIFTING ?auto_67095 ?auto_67077 ) ( not ( = ?auto_67074 ?auto_67095 ) ) ( not ( = ?auto_67068 ?auto_67095 ) ) ( not ( = ?auto_67091 ?auto_67095 ) ) ( not ( = ?auto_67088 ?auto_67095 ) ) ( not ( = ?auto_67094 ?auto_67095 ) ) ( not ( = ?auto_67080 ?auto_67095 ) ) )
    :subtasks
    ( ( !LOAD ?auto_67095 ?auto_67077 ?auto_67076 ?auto_67073 )
      ( MAKE-ON ?auto_67065 ?auto_67066 )
      ( MAKE-ON-VERIFY ?auto_67065 ?auto_67066 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_67096 - SURFACE
      ?auto_67097 - SURFACE
    )
    :vars
    (
      ?auto_67121 - HOIST
      ?auto_67114 - PLACE
      ?auto_67113 - PLACE
      ?auto_67123 - HOIST
      ?auto_67105 - SURFACE
      ?auto_67120 - SURFACE
      ?auto_67124 - PLACE
      ?auto_67106 - HOIST
      ?auto_67109 - SURFACE
      ?auto_67101 - SURFACE
      ?auto_67108 - SURFACE
      ?auto_67104 - SURFACE
      ?auto_67110 - PLACE
      ?auto_67112 - HOIST
      ?auto_67111 - SURFACE
      ?auto_67125 - SURFACE
      ?auto_67099 - PLACE
      ?auto_67122 - HOIST
      ?auto_67115 - SURFACE
      ?auto_67103 - SURFACE
      ?auto_67107 - SURFACE
      ?auto_67117 - SURFACE
      ?auto_67098 - PLACE
      ?auto_67119 - HOIST
      ?auto_67118 - SURFACE
      ?auto_67102 - SURFACE
      ?auto_67116 - TRUCK
      ?auto_67126 - PLACE
      ?auto_67100 - HOIST
      ?auto_67127 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_67121 ?auto_67114 ) ( IS-CRATE ?auto_67096 ) ( not ( = ?auto_67096 ?auto_67097 ) ) ( not ( = ?auto_67113 ?auto_67114 ) ) ( HOIST-AT ?auto_67123 ?auto_67113 ) ( not ( = ?auto_67121 ?auto_67123 ) ) ( SURFACE-AT ?auto_67096 ?auto_67113 ) ( ON ?auto_67096 ?auto_67105 ) ( CLEAR ?auto_67096 ) ( not ( = ?auto_67096 ?auto_67105 ) ) ( not ( = ?auto_67097 ?auto_67105 ) ) ( IS-CRATE ?auto_67097 ) ( not ( = ?auto_67096 ?auto_67120 ) ) ( not ( = ?auto_67097 ?auto_67120 ) ) ( not ( = ?auto_67105 ?auto_67120 ) ) ( not ( = ?auto_67124 ?auto_67114 ) ) ( not ( = ?auto_67113 ?auto_67124 ) ) ( HOIST-AT ?auto_67106 ?auto_67124 ) ( not ( = ?auto_67121 ?auto_67106 ) ) ( not ( = ?auto_67123 ?auto_67106 ) ) ( SURFACE-AT ?auto_67097 ?auto_67124 ) ( ON ?auto_67097 ?auto_67109 ) ( CLEAR ?auto_67097 ) ( not ( = ?auto_67096 ?auto_67109 ) ) ( not ( = ?auto_67097 ?auto_67109 ) ) ( not ( = ?auto_67105 ?auto_67109 ) ) ( not ( = ?auto_67120 ?auto_67109 ) ) ( IS-CRATE ?auto_67120 ) ( not ( = ?auto_67096 ?auto_67101 ) ) ( not ( = ?auto_67097 ?auto_67101 ) ) ( not ( = ?auto_67105 ?auto_67101 ) ) ( not ( = ?auto_67120 ?auto_67101 ) ) ( not ( = ?auto_67109 ?auto_67101 ) ) ( AVAILABLE ?auto_67106 ) ( SURFACE-AT ?auto_67120 ?auto_67124 ) ( ON ?auto_67120 ?auto_67108 ) ( CLEAR ?auto_67120 ) ( not ( = ?auto_67096 ?auto_67108 ) ) ( not ( = ?auto_67097 ?auto_67108 ) ) ( not ( = ?auto_67105 ?auto_67108 ) ) ( not ( = ?auto_67120 ?auto_67108 ) ) ( not ( = ?auto_67109 ?auto_67108 ) ) ( not ( = ?auto_67101 ?auto_67108 ) ) ( IS-CRATE ?auto_67101 ) ( not ( = ?auto_67096 ?auto_67104 ) ) ( not ( = ?auto_67097 ?auto_67104 ) ) ( not ( = ?auto_67105 ?auto_67104 ) ) ( not ( = ?auto_67120 ?auto_67104 ) ) ( not ( = ?auto_67109 ?auto_67104 ) ) ( not ( = ?auto_67101 ?auto_67104 ) ) ( not ( = ?auto_67108 ?auto_67104 ) ) ( not ( = ?auto_67110 ?auto_67114 ) ) ( not ( = ?auto_67113 ?auto_67110 ) ) ( not ( = ?auto_67124 ?auto_67110 ) ) ( HOIST-AT ?auto_67112 ?auto_67110 ) ( not ( = ?auto_67121 ?auto_67112 ) ) ( not ( = ?auto_67123 ?auto_67112 ) ) ( not ( = ?auto_67106 ?auto_67112 ) ) ( AVAILABLE ?auto_67112 ) ( SURFACE-AT ?auto_67101 ?auto_67110 ) ( ON ?auto_67101 ?auto_67111 ) ( CLEAR ?auto_67101 ) ( not ( = ?auto_67096 ?auto_67111 ) ) ( not ( = ?auto_67097 ?auto_67111 ) ) ( not ( = ?auto_67105 ?auto_67111 ) ) ( not ( = ?auto_67120 ?auto_67111 ) ) ( not ( = ?auto_67109 ?auto_67111 ) ) ( not ( = ?auto_67101 ?auto_67111 ) ) ( not ( = ?auto_67108 ?auto_67111 ) ) ( not ( = ?auto_67104 ?auto_67111 ) ) ( IS-CRATE ?auto_67104 ) ( not ( = ?auto_67096 ?auto_67125 ) ) ( not ( = ?auto_67097 ?auto_67125 ) ) ( not ( = ?auto_67105 ?auto_67125 ) ) ( not ( = ?auto_67120 ?auto_67125 ) ) ( not ( = ?auto_67109 ?auto_67125 ) ) ( not ( = ?auto_67101 ?auto_67125 ) ) ( not ( = ?auto_67108 ?auto_67125 ) ) ( not ( = ?auto_67104 ?auto_67125 ) ) ( not ( = ?auto_67111 ?auto_67125 ) ) ( not ( = ?auto_67099 ?auto_67114 ) ) ( not ( = ?auto_67113 ?auto_67099 ) ) ( not ( = ?auto_67124 ?auto_67099 ) ) ( not ( = ?auto_67110 ?auto_67099 ) ) ( HOIST-AT ?auto_67122 ?auto_67099 ) ( not ( = ?auto_67121 ?auto_67122 ) ) ( not ( = ?auto_67123 ?auto_67122 ) ) ( not ( = ?auto_67106 ?auto_67122 ) ) ( not ( = ?auto_67112 ?auto_67122 ) ) ( AVAILABLE ?auto_67122 ) ( SURFACE-AT ?auto_67104 ?auto_67099 ) ( ON ?auto_67104 ?auto_67115 ) ( CLEAR ?auto_67104 ) ( not ( = ?auto_67096 ?auto_67115 ) ) ( not ( = ?auto_67097 ?auto_67115 ) ) ( not ( = ?auto_67105 ?auto_67115 ) ) ( not ( = ?auto_67120 ?auto_67115 ) ) ( not ( = ?auto_67109 ?auto_67115 ) ) ( not ( = ?auto_67101 ?auto_67115 ) ) ( not ( = ?auto_67108 ?auto_67115 ) ) ( not ( = ?auto_67104 ?auto_67115 ) ) ( not ( = ?auto_67111 ?auto_67115 ) ) ( not ( = ?auto_67125 ?auto_67115 ) ) ( IS-CRATE ?auto_67125 ) ( not ( = ?auto_67096 ?auto_67103 ) ) ( not ( = ?auto_67097 ?auto_67103 ) ) ( not ( = ?auto_67105 ?auto_67103 ) ) ( not ( = ?auto_67120 ?auto_67103 ) ) ( not ( = ?auto_67109 ?auto_67103 ) ) ( not ( = ?auto_67101 ?auto_67103 ) ) ( not ( = ?auto_67108 ?auto_67103 ) ) ( not ( = ?auto_67104 ?auto_67103 ) ) ( not ( = ?auto_67111 ?auto_67103 ) ) ( not ( = ?auto_67125 ?auto_67103 ) ) ( not ( = ?auto_67115 ?auto_67103 ) ) ( AVAILABLE ?auto_67123 ) ( SURFACE-AT ?auto_67125 ?auto_67113 ) ( ON ?auto_67125 ?auto_67107 ) ( CLEAR ?auto_67125 ) ( not ( = ?auto_67096 ?auto_67107 ) ) ( not ( = ?auto_67097 ?auto_67107 ) ) ( not ( = ?auto_67105 ?auto_67107 ) ) ( not ( = ?auto_67120 ?auto_67107 ) ) ( not ( = ?auto_67109 ?auto_67107 ) ) ( not ( = ?auto_67101 ?auto_67107 ) ) ( not ( = ?auto_67108 ?auto_67107 ) ) ( not ( = ?auto_67104 ?auto_67107 ) ) ( not ( = ?auto_67111 ?auto_67107 ) ) ( not ( = ?auto_67125 ?auto_67107 ) ) ( not ( = ?auto_67115 ?auto_67107 ) ) ( not ( = ?auto_67103 ?auto_67107 ) ) ( IS-CRATE ?auto_67103 ) ( not ( = ?auto_67096 ?auto_67117 ) ) ( not ( = ?auto_67097 ?auto_67117 ) ) ( not ( = ?auto_67105 ?auto_67117 ) ) ( not ( = ?auto_67120 ?auto_67117 ) ) ( not ( = ?auto_67109 ?auto_67117 ) ) ( not ( = ?auto_67101 ?auto_67117 ) ) ( not ( = ?auto_67108 ?auto_67117 ) ) ( not ( = ?auto_67104 ?auto_67117 ) ) ( not ( = ?auto_67111 ?auto_67117 ) ) ( not ( = ?auto_67125 ?auto_67117 ) ) ( not ( = ?auto_67115 ?auto_67117 ) ) ( not ( = ?auto_67103 ?auto_67117 ) ) ( not ( = ?auto_67107 ?auto_67117 ) ) ( not ( = ?auto_67098 ?auto_67114 ) ) ( not ( = ?auto_67113 ?auto_67098 ) ) ( not ( = ?auto_67124 ?auto_67098 ) ) ( not ( = ?auto_67110 ?auto_67098 ) ) ( not ( = ?auto_67099 ?auto_67098 ) ) ( HOIST-AT ?auto_67119 ?auto_67098 ) ( not ( = ?auto_67121 ?auto_67119 ) ) ( not ( = ?auto_67123 ?auto_67119 ) ) ( not ( = ?auto_67106 ?auto_67119 ) ) ( not ( = ?auto_67112 ?auto_67119 ) ) ( not ( = ?auto_67122 ?auto_67119 ) ) ( AVAILABLE ?auto_67119 ) ( SURFACE-AT ?auto_67103 ?auto_67098 ) ( ON ?auto_67103 ?auto_67118 ) ( CLEAR ?auto_67103 ) ( not ( = ?auto_67096 ?auto_67118 ) ) ( not ( = ?auto_67097 ?auto_67118 ) ) ( not ( = ?auto_67105 ?auto_67118 ) ) ( not ( = ?auto_67120 ?auto_67118 ) ) ( not ( = ?auto_67109 ?auto_67118 ) ) ( not ( = ?auto_67101 ?auto_67118 ) ) ( not ( = ?auto_67108 ?auto_67118 ) ) ( not ( = ?auto_67104 ?auto_67118 ) ) ( not ( = ?auto_67111 ?auto_67118 ) ) ( not ( = ?auto_67125 ?auto_67118 ) ) ( not ( = ?auto_67115 ?auto_67118 ) ) ( not ( = ?auto_67103 ?auto_67118 ) ) ( not ( = ?auto_67107 ?auto_67118 ) ) ( not ( = ?auto_67117 ?auto_67118 ) ) ( SURFACE-AT ?auto_67102 ?auto_67114 ) ( CLEAR ?auto_67102 ) ( IS-CRATE ?auto_67117 ) ( not ( = ?auto_67096 ?auto_67102 ) ) ( not ( = ?auto_67097 ?auto_67102 ) ) ( not ( = ?auto_67105 ?auto_67102 ) ) ( not ( = ?auto_67120 ?auto_67102 ) ) ( not ( = ?auto_67109 ?auto_67102 ) ) ( not ( = ?auto_67101 ?auto_67102 ) ) ( not ( = ?auto_67108 ?auto_67102 ) ) ( not ( = ?auto_67104 ?auto_67102 ) ) ( not ( = ?auto_67111 ?auto_67102 ) ) ( not ( = ?auto_67125 ?auto_67102 ) ) ( not ( = ?auto_67115 ?auto_67102 ) ) ( not ( = ?auto_67103 ?auto_67102 ) ) ( not ( = ?auto_67107 ?auto_67102 ) ) ( not ( = ?auto_67117 ?auto_67102 ) ) ( not ( = ?auto_67118 ?auto_67102 ) ) ( AVAILABLE ?auto_67121 ) ( TRUCK-AT ?auto_67116 ?auto_67126 ) ( not ( = ?auto_67126 ?auto_67114 ) ) ( not ( = ?auto_67113 ?auto_67126 ) ) ( not ( = ?auto_67124 ?auto_67126 ) ) ( not ( = ?auto_67110 ?auto_67126 ) ) ( not ( = ?auto_67099 ?auto_67126 ) ) ( not ( = ?auto_67098 ?auto_67126 ) ) ( HOIST-AT ?auto_67100 ?auto_67126 ) ( not ( = ?auto_67121 ?auto_67100 ) ) ( not ( = ?auto_67123 ?auto_67100 ) ) ( not ( = ?auto_67106 ?auto_67100 ) ) ( not ( = ?auto_67112 ?auto_67100 ) ) ( not ( = ?auto_67122 ?auto_67100 ) ) ( not ( = ?auto_67119 ?auto_67100 ) ) ( AVAILABLE ?auto_67100 ) ( SURFACE-AT ?auto_67117 ?auto_67126 ) ( ON ?auto_67117 ?auto_67127 ) ( CLEAR ?auto_67117 ) ( not ( = ?auto_67096 ?auto_67127 ) ) ( not ( = ?auto_67097 ?auto_67127 ) ) ( not ( = ?auto_67105 ?auto_67127 ) ) ( not ( = ?auto_67120 ?auto_67127 ) ) ( not ( = ?auto_67109 ?auto_67127 ) ) ( not ( = ?auto_67101 ?auto_67127 ) ) ( not ( = ?auto_67108 ?auto_67127 ) ) ( not ( = ?auto_67104 ?auto_67127 ) ) ( not ( = ?auto_67111 ?auto_67127 ) ) ( not ( = ?auto_67125 ?auto_67127 ) ) ( not ( = ?auto_67115 ?auto_67127 ) ) ( not ( = ?auto_67103 ?auto_67127 ) ) ( not ( = ?auto_67107 ?auto_67127 ) ) ( not ( = ?auto_67117 ?auto_67127 ) ) ( not ( = ?auto_67118 ?auto_67127 ) ) ( not ( = ?auto_67102 ?auto_67127 ) ) )
    :subtasks
    ( ( !LIFT ?auto_67100 ?auto_67117 ?auto_67127 ?auto_67126 )
      ( MAKE-ON ?auto_67096 ?auto_67097 )
      ( MAKE-ON-VERIFY ?auto_67096 ?auto_67097 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_67128 - SURFACE
      ?auto_67129 - SURFACE
    )
    :vars
    (
      ?auto_67152 - HOIST
      ?auto_67153 - PLACE
      ?auto_67136 - PLACE
      ?auto_67142 - HOIST
      ?auto_67138 - SURFACE
      ?auto_67135 - SURFACE
      ?auto_67150 - PLACE
      ?auto_67144 - HOIST
      ?auto_67139 - SURFACE
      ?auto_67156 - SURFACE
      ?auto_67130 - SURFACE
      ?auto_67148 - SURFACE
      ?auto_67143 - PLACE
      ?auto_67147 - HOIST
      ?auto_67140 - SURFACE
      ?auto_67146 - SURFACE
      ?auto_67158 - PLACE
      ?auto_67141 - HOIST
      ?auto_67159 - SURFACE
      ?auto_67154 - SURFACE
      ?auto_67145 - SURFACE
      ?auto_67132 - SURFACE
      ?auto_67137 - PLACE
      ?auto_67134 - HOIST
      ?auto_67133 - SURFACE
      ?auto_67155 - SURFACE
      ?auto_67151 - PLACE
      ?auto_67157 - HOIST
      ?auto_67149 - SURFACE
      ?auto_67131 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_67152 ?auto_67153 ) ( IS-CRATE ?auto_67128 ) ( not ( = ?auto_67128 ?auto_67129 ) ) ( not ( = ?auto_67136 ?auto_67153 ) ) ( HOIST-AT ?auto_67142 ?auto_67136 ) ( not ( = ?auto_67152 ?auto_67142 ) ) ( SURFACE-AT ?auto_67128 ?auto_67136 ) ( ON ?auto_67128 ?auto_67138 ) ( CLEAR ?auto_67128 ) ( not ( = ?auto_67128 ?auto_67138 ) ) ( not ( = ?auto_67129 ?auto_67138 ) ) ( IS-CRATE ?auto_67129 ) ( not ( = ?auto_67128 ?auto_67135 ) ) ( not ( = ?auto_67129 ?auto_67135 ) ) ( not ( = ?auto_67138 ?auto_67135 ) ) ( not ( = ?auto_67150 ?auto_67153 ) ) ( not ( = ?auto_67136 ?auto_67150 ) ) ( HOIST-AT ?auto_67144 ?auto_67150 ) ( not ( = ?auto_67152 ?auto_67144 ) ) ( not ( = ?auto_67142 ?auto_67144 ) ) ( SURFACE-AT ?auto_67129 ?auto_67150 ) ( ON ?auto_67129 ?auto_67139 ) ( CLEAR ?auto_67129 ) ( not ( = ?auto_67128 ?auto_67139 ) ) ( not ( = ?auto_67129 ?auto_67139 ) ) ( not ( = ?auto_67138 ?auto_67139 ) ) ( not ( = ?auto_67135 ?auto_67139 ) ) ( IS-CRATE ?auto_67135 ) ( not ( = ?auto_67128 ?auto_67156 ) ) ( not ( = ?auto_67129 ?auto_67156 ) ) ( not ( = ?auto_67138 ?auto_67156 ) ) ( not ( = ?auto_67135 ?auto_67156 ) ) ( not ( = ?auto_67139 ?auto_67156 ) ) ( AVAILABLE ?auto_67144 ) ( SURFACE-AT ?auto_67135 ?auto_67150 ) ( ON ?auto_67135 ?auto_67130 ) ( CLEAR ?auto_67135 ) ( not ( = ?auto_67128 ?auto_67130 ) ) ( not ( = ?auto_67129 ?auto_67130 ) ) ( not ( = ?auto_67138 ?auto_67130 ) ) ( not ( = ?auto_67135 ?auto_67130 ) ) ( not ( = ?auto_67139 ?auto_67130 ) ) ( not ( = ?auto_67156 ?auto_67130 ) ) ( IS-CRATE ?auto_67156 ) ( not ( = ?auto_67128 ?auto_67148 ) ) ( not ( = ?auto_67129 ?auto_67148 ) ) ( not ( = ?auto_67138 ?auto_67148 ) ) ( not ( = ?auto_67135 ?auto_67148 ) ) ( not ( = ?auto_67139 ?auto_67148 ) ) ( not ( = ?auto_67156 ?auto_67148 ) ) ( not ( = ?auto_67130 ?auto_67148 ) ) ( not ( = ?auto_67143 ?auto_67153 ) ) ( not ( = ?auto_67136 ?auto_67143 ) ) ( not ( = ?auto_67150 ?auto_67143 ) ) ( HOIST-AT ?auto_67147 ?auto_67143 ) ( not ( = ?auto_67152 ?auto_67147 ) ) ( not ( = ?auto_67142 ?auto_67147 ) ) ( not ( = ?auto_67144 ?auto_67147 ) ) ( AVAILABLE ?auto_67147 ) ( SURFACE-AT ?auto_67156 ?auto_67143 ) ( ON ?auto_67156 ?auto_67140 ) ( CLEAR ?auto_67156 ) ( not ( = ?auto_67128 ?auto_67140 ) ) ( not ( = ?auto_67129 ?auto_67140 ) ) ( not ( = ?auto_67138 ?auto_67140 ) ) ( not ( = ?auto_67135 ?auto_67140 ) ) ( not ( = ?auto_67139 ?auto_67140 ) ) ( not ( = ?auto_67156 ?auto_67140 ) ) ( not ( = ?auto_67130 ?auto_67140 ) ) ( not ( = ?auto_67148 ?auto_67140 ) ) ( IS-CRATE ?auto_67148 ) ( not ( = ?auto_67128 ?auto_67146 ) ) ( not ( = ?auto_67129 ?auto_67146 ) ) ( not ( = ?auto_67138 ?auto_67146 ) ) ( not ( = ?auto_67135 ?auto_67146 ) ) ( not ( = ?auto_67139 ?auto_67146 ) ) ( not ( = ?auto_67156 ?auto_67146 ) ) ( not ( = ?auto_67130 ?auto_67146 ) ) ( not ( = ?auto_67148 ?auto_67146 ) ) ( not ( = ?auto_67140 ?auto_67146 ) ) ( not ( = ?auto_67158 ?auto_67153 ) ) ( not ( = ?auto_67136 ?auto_67158 ) ) ( not ( = ?auto_67150 ?auto_67158 ) ) ( not ( = ?auto_67143 ?auto_67158 ) ) ( HOIST-AT ?auto_67141 ?auto_67158 ) ( not ( = ?auto_67152 ?auto_67141 ) ) ( not ( = ?auto_67142 ?auto_67141 ) ) ( not ( = ?auto_67144 ?auto_67141 ) ) ( not ( = ?auto_67147 ?auto_67141 ) ) ( AVAILABLE ?auto_67141 ) ( SURFACE-AT ?auto_67148 ?auto_67158 ) ( ON ?auto_67148 ?auto_67159 ) ( CLEAR ?auto_67148 ) ( not ( = ?auto_67128 ?auto_67159 ) ) ( not ( = ?auto_67129 ?auto_67159 ) ) ( not ( = ?auto_67138 ?auto_67159 ) ) ( not ( = ?auto_67135 ?auto_67159 ) ) ( not ( = ?auto_67139 ?auto_67159 ) ) ( not ( = ?auto_67156 ?auto_67159 ) ) ( not ( = ?auto_67130 ?auto_67159 ) ) ( not ( = ?auto_67148 ?auto_67159 ) ) ( not ( = ?auto_67140 ?auto_67159 ) ) ( not ( = ?auto_67146 ?auto_67159 ) ) ( IS-CRATE ?auto_67146 ) ( not ( = ?auto_67128 ?auto_67154 ) ) ( not ( = ?auto_67129 ?auto_67154 ) ) ( not ( = ?auto_67138 ?auto_67154 ) ) ( not ( = ?auto_67135 ?auto_67154 ) ) ( not ( = ?auto_67139 ?auto_67154 ) ) ( not ( = ?auto_67156 ?auto_67154 ) ) ( not ( = ?auto_67130 ?auto_67154 ) ) ( not ( = ?auto_67148 ?auto_67154 ) ) ( not ( = ?auto_67140 ?auto_67154 ) ) ( not ( = ?auto_67146 ?auto_67154 ) ) ( not ( = ?auto_67159 ?auto_67154 ) ) ( AVAILABLE ?auto_67142 ) ( SURFACE-AT ?auto_67146 ?auto_67136 ) ( ON ?auto_67146 ?auto_67145 ) ( CLEAR ?auto_67146 ) ( not ( = ?auto_67128 ?auto_67145 ) ) ( not ( = ?auto_67129 ?auto_67145 ) ) ( not ( = ?auto_67138 ?auto_67145 ) ) ( not ( = ?auto_67135 ?auto_67145 ) ) ( not ( = ?auto_67139 ?auto_67145 ) ) ( not ( = ?auto_67156 ?auto_67145 ) ) ( not ( = ?auto_67130 ?auto_67145 ) ) ( not ( = ?auto_67148 ?auto_67145 ) ) ( not ( = ?auto_67140 ?auto_67145 ) ) ( not ( = ?auto_67146 ?auto_67145 ) ) ( not ( = ?auto_67159 ?auto_67145 ) ) ( not ( = ?auto_67154 ?auto_67145 ) ) ( IS-CRATE ?auto_67154 ) ( not ( = ?auto_67128 ?auto_67132 ) ) ( not ( = ?auto_67129 ?auto_67132 ) ) ( not ( = ?auto_67138 ?auto_67132 ) ) ( not ( = ?auto_67135 ?auto_67132 ) ) ( not ( = ?auto_67139 ?auto_67132 ) ) ( not ( = ?auto_67156 ?auto_67132 ) ) ( not ( = ?auto_67130 ?auto_67132 ) ) ( not ( = ?auto_67148 ?auto_67132 ) ) ( not ( = ?auto_67140 ?auto_67132 ) ) ( not ( = ?auto_67146 ?auto_67132 ) ) ( not ( = ?auto_67159 ?auto_67132 ) ) ( not ( = ?auto_67154 ?auto_67132 ) ) ( not ( = ?auto_67145 ?auto_67132 ) ) ( not ( = ?auto_67137 ?auto_67153 ) ) ( not ( = ?auto_67136 ?auto_67137 ) ) ( not ( = ?auto_67150 ?auto_67137 ) ) ( not ( = ?auto_67143 ?auto_67137 ) ) ( not ( = ?auto_67158 ?auto_67137 ) ) ( HOIST-AT ?auto_67134 ?auto_67137 ) ( not ( = ?auto_67152 ?auto_67134 ) ) ( not ( = ?auto_67142 ?auto_67134 ) ) ( not ( = ?auto_67144 ?auto_67134 ) ) ( not ( = ?auto_67147 ?auto_67134 ) ) ( not ( = ?auto_67141 ?auto_67134 ) ) ( AVAILABLE ?auto_67134 ) ( SURFACE-AT ?auto_67154 ?auto_67137 ) ( ON ?auto_67154 ?auto_67133 ) ( CLEAR ?auto_67154 ) ( not ( = ?auto_67128 ?auto_67133 ) ) ( not ( = ?auto_67129 ?auto_67133 ) ) ( not ( = ?auto_67138 ?auto_67133 ) ) ( not ( = ?auto_67135 ?auto_67133 ) ) ( not ( = ?auto_67139 ?auto_67133 ) ) ( not ( = ?auto_67156 ?auto_67133 ) ) ( not ( = ?auto_67130 ?auto_67133 ) ) ( not ( = ?auto_67148 ?auto_67133 ) ) ( not ( = ?auto_67140 ?auto_67133 ) ) ( not ( = ?auto_67146 ?auto_67133 ) ) ( not ( = ?auto_67159 ?auto_67133 ) ) ( not ( = ?auto_67154 ?auto_67133 ) ) ( not ( = ?auto_67145 ?auto_67133 ) ) ( not ( = ?auto_67132 ?auto_67133 ) ) ( SURFACE-AT ?auto_67155 ?auto_67153 ) ( CLEAR ?auto_67155 ) ( IS-CRATE ?auto_67132 ) ( not ( = ?auto_67128 ?auto_67155 ) ) ( not ( = ?auto_67129 ?auto_67155 ) ) ( not ( = ?auto_67138 ?auto_67155 ) ) ( not ( = ?auto_67135 ?auto_67155 ) ) ( not ( = ?auto_67139 ?auto_67155 ) ) ( not ( = ?auto_67156 ?auto_67155 ) ) ( not ( = ?auto_67130 ?auto_67155 ) ) ( not ( = ?auto_67148 ?auto_67155 ) ) ( not ( = ?auto_67140 ?auto_67155 ) ) ( not ( = ?auto_67146 ?auto_67155 ) ) ( not ( = ?auto_67159 ?auto_67155 ) ) ( not ( = ?auto_67154 ?auto_67155 ) ) ( not ( = ?auto_67145 ?auto_67155 ) ) ( not ( = ?auto_67132 ?auto_67155 ) ) ( not ( = ?auto_67133 ?auto_67155 ) ) ( AVAILABLE ?auto_67152 ) ( not ( = ?auto_67151 ?auto_67153 ) ) ( not ( = ?auto_67136 ?auto_67151 ) ) ( not ( = ?auto_67150 ?auto_67151 ) ) ( not ( = ?auto_67143 ?auto_67151 ) ) ( not ( = ?auto_67158 ?auto_67151 ) ) ( not ( = ?auto_67137 ?auto_67151 ) ) ( HOIST-AT ?auto_67157 ?auto_67151 ) ( not ( = ?auto_67152 ?auto_67157 ) ) ( not ( = ?auto_67142 ?auto_67157 ) ) ( not ( = ?auto_67144 ?auto_67157 ) ) ( not ( = ?auto_67147 ?auto_67157 ) ) ( not ( = ?auto_67141 ?auto_67157 ) ) ( not ( = ?auto_67134 ?auto_67157 ) ) ( AVAILABLE ?auto_67157 ) ( SURFACE-AT ?auto_67132 ?auto_67151 ) ( ON ?auto_67132 ?auto_67149 ) ( CLEAR ?auto_67132 ) ( not ( = ?auto_67128 ?auto_67149 ) ) ( not ( = ?auto_67129 ?auto_67149 ) ) ( not ( = ?auto_67138 ?auto_67149 ) ) ( not ( = ?auto_67135 ?auto_67149 ) ) ( not ( = ?auto_67139 ?auto_67149 ) ) ( not ( = ?auto_67156 ?auto_67149 ) ) ( not ( = ?auto_67130 ?auto_67149 ) ) ( not ( = ?auto_67148 ?auto_67149 ) ) ( not ( = ?auto_67140 ?auto_67149 ) ) ( not ( = ?auto_67146 ?auto_67149 ) ) ( not ( = ?auto_67159 ?auto_67149 ) ) ( not ( = ?auto_67154 ?auto_67149 ) ) ( not ( = ?auto_67145 ?auto_67149 ) ) ( not ( = ?auto_67132 ?auto_67149 ) ) ( not ( = ?auto_67133 ?auto_67149 ) ) ( not ( = ?auto_67155 ?auto_67149 ) ) ( TRUCK-AT ?auto_67131 ?auto_67153 ) )
    :subtasks
    ( ( !DRIVE ?auto_67131 ?auto_67153 ?auto_67151 )
      ( MAKE-ON ?auto_67128 ?auto_67129 )
      ( MAKE-ON-VERIFY ?auto_67128 ?auto_67129 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_67162 - SURFACE
      ?auto_67163 - SURFACE
    )
    :vars
    (
      ?auto_67164 - HOIST
      ?auto_67165 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_67164 ?auto_67165 ) ( SURFACE-AT ?auto_67163 ?auto_67165 ) ( CLEAR ?auto_67163 ) ( LIFTING ?auto_67164 ?auto_67162 ) ( IS-CRATE ?auto_67162 ) ( not ( = ?auto_67162 ?auto_67163 ) ) )
    :subtasks
    ( ( !DROP ?auto_67164 ?auto_67162 ?auto_67163 ?auto_67165 )
      ( MAKE-ON-VERIFY ?auto_67162 ?auto_67163 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_67166 - SURFACE
      ?auto_67167 - SURFACE
    )
    :vars
    (
      ?auto_67168 - HOIST
      ?auto_67169 - PLACE
      ?auto_67170 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_67168 ?auto_67169 ) ( SURFACE-AT ?auto_67167 ?auto_67169 ) ( CLEAR ?auto_67167 ) ( IS-CRATE ?auto_67166 ) ( not ( = ?auto_67166 ?auto_67167 ) ) ( TRUCK-AT ?auto_67170 ?auto_67169 ) ( AVAILABLE ?auto_67168 ) ( IN ?auto_67166 ?auto_67170 ) )
    :subtasks
    ( ( !UNLOAD ?auto_67168 ?auto_67166 ?auto_67170 ?auto_67169 )
      ( MAKE-ON ?auto_67166 ?auto_67167 )
      ( MAKE-ON-VERIFY ?auto_67166 ?auto_67167 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_67171 - SURFACE
      ?auto_67172 - SURFACE
    )
    :vars
    (
      ?auto_67174 - HOIST
      ?auto_67175 - PLACE
      ?auto_67173 - TRUCK
      ?auto_67176 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_67174 ?auto_67175 ) ( SURFACE-AT ?auto_67172 ?auto_67175 ) ( CLEAR ?auto_67172 ) ( IS-CRATE ?auto_67171 ) ( not ( = ?auto_67171 ?auto_67172 ) ) ( AVAILABLE ?auto_67174 ) ( IN ?auto_67171 ?auto_67173 ) ( TRUCK-AT ?auto_67173 ?auto_67176 ) ( not ( = ?auto_67176 ?auto_67175 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_67173 ?auto_67176 ?auto_67175 )
      ( MAKE-ON ?auto_67171 ?auto_67172 )
      ( MAKE-ON-VERIFY ?auto_67171 ?auto_67172 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_67177 - SURFACE
      ?auto_67178 - SURFACE
    )
    :vars
    (
      ?auto_67180 - HOIST
      ?auto_67179 - PLACE
      ?auto_67182 - TRUCK
      ?auto_67181 - PLACE
      ?auto_67183 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_67180 ?auto_67179 ) ( SURFACE-AT ?auto_67178 ?auto_67179 ) ( CLEAR ?auto_67178 ) ( IS-CRATE ?auto_67177 ) ( not ( = ?auto_67177 ?auto_67178 ) ) ( AVAILABLE ?auto_67180 ) ( TRUCK-AT ?auto_67182 ?auto_67181 ) ( not ( = ?auto_67181 ?auto_67179 ) ) ( HOIST-AT ?auto_67183 ?auto_67181 ) ( LIFTING ?auto_67183 ?auto_67177 ) ( not ( = ?auto_67180 ?auto_67183 ) ) )
    :subtasks
    ( ( !LOAD ?auto_67183 ?auto_67177 ?auto_67182 ?auto_67181 )
      ( MAKE-ON ?auto_67177 ?auto_67178 )
      ( MAKE-ON-VERIFY ?auto_67177 ?auto_67178 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_67184 - SURFACE
      ?auto_67185 - SURFACE
    )
    :vars
    (
      ?auto_67188 - HOIST
      ?auto_67190 - PLACE
      ?auto_67186 - TRUCK
      ?auto_67187 - PLACE
      ?auto_67189 - HOIST
      ?auto_67191 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_67188 ?auto_67190 ) ( SURFACE-AT ?auto_67185 ?auto_67190 ) ( CLEAR ?auto_67185 ) ( IS-CRATE ?auto_67184 ) ( not ( = ?auto_67184 ?auto_67185 ) ) ( AVAILABLE ?auto_67188 ) ( TRUCK-AT ?auto_67186 ?auto_67187 ) ( not ( = ?auto_67187 ?auto_67190 ) ) ( HOIST-AT ?auto_67189 ?auto_67187 ) ( not ( = ?auto_67188 ?auto_67189 ) ) ( AVAILABLE ?auto_67189 ) ( SURFACE-AT ?auto_67184 ?auto_67187 ) ( ON ?auto_67184 ?auto_67191 ) ( CLEAR ?auto_67184 ) ( not ( = ?auto_67184 ?auto_67191 ) ) ( not ( = ?auto_67185 ?auto_67191 ) ) )
    :subtasks
    ( ( !LIFT ?auto_67189 ?auto_67184 ?auto_67191 ?auto_67187 )
      ( MAKE-ON ?auto_67184 ?auto_67185 )
      ( MAKE-ON-VERIFY ?auto_67184 ?auto_67185 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_67192 - SURFACE
      ?auto_67193 - SURFACE
    )
    :vars
    (
      ?auto_67198 - HOIST
      ?auto_67194 - PLACE
      ?auto_67195 - PLACE
      ?auto_67199 - HOIST
      ?auto_67197 - SURFACE
      ?auto_67196 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_67198 ?auto_67194 ) ( SURFACE-AT ?auto_67193 ?auto_67194 ) ( CLEAR ?auto_67193 ) ( IS-CRATE ?auto_67192 ) ( not ( = ?auto_67192 ?auto_67193 ) ) ( AVAILABLE ?auto_67198 ) ( not ( = ?auto_67195 ?auto_67194 ) ) ( HOIST-AT ?auto_67199 ?auto_67195 ) ( not ( = ?auto_67198 ?auto_67199 ) ) ( AVAILABLE ?auto_67199 ) ( SURFACE-AT ?auto_67192 ?auto_67195 ) ( ON ?auto_67192 ?auto_67197 ) ( CLEAR ?auto_67192 ) ( not ( = ?auto_67192 ?auto_67197 ) ) ( not ( = ?auto_67193 ?auto_67197 ) ) ( TRUCK-AT ?auto_67196 ?auto_67194 ) )
    :subtasks
    ( ( !DRIVE ?auto_67196 ?auto_67194 ?auto_67195 )
      ( MAKE-ON ?auto_67192 ?auto_67193 )
      ( MAKE-ON-VERIFY ?auto_67192 ?auto_67193 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_67200 - SURFACE
      ?auto_67201 - SURFACE
    )
    :vars
    (
      ?auto_67204 - HOIST
      ?auto_67203 - PLACE
      ?auto_67207 - PLACE
      ?auto_67206 - HOIST
      ?auto_67205 - SURFACE
      ?auto_67202 - TRUCK
      ?auto_67208 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_67204 ?auto_67203 ) ( IS-CRATE ?auto_67200 ) ( not ( = ?auto_67200 ?auto_67201 ) ) ( not ( = ?auto_67207 ?auto_67203 ) ) ( HOIST-AT ?auto_67206 ?auto_67207 ) ( not ( = ?auto_67204 ?auto_67206 ) ) ( AVAILABLE ?auto_67206 ) ( SURFACE-AT ?auto_67200 ?auto_67207 ) ( ON ?auto_67200 ?auto_67205 ) ( CLEAR ?auto_67200 ) ( not ( = ?auto_67200 ?auto_67205 ) ) ( not ( = ?auto_67201 ?auto_67205 ) ) ( TRUCK-AT ?auto_67202 ?auto_67203 ) ( SURFACE-AT ?auto_67208 ?auto_67203 ) ( CLEAR ?auto_67208 ) ( LIFTING ?auto_67204 ?auto_67201 ) ( IS-CRATE ?auto_67201 ) ( not ( = ?auto_67200 ?auto_67208 ) ) ( not ( = ?auto_67201 ?auto_67208 ) ) ( not ( = ?auto_67205 ?auto_67208 ) ) )
    :subtasks
    ( ( !DROP ?auto_67204 ?auto_67201 ?auto_67208 ?auto_67203 )
      ( MAKE-ON ?auto_67200 ?auto_67201 )
      ( MAKE-ON-VERIFY ?auto_67200 ?auto_67201 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_67209 - SURFACE
      ?auto_67210 - SURFACE
    )
    :vars
    (
      ?auto_67214 - HOIST
      ?auto_67213 - PLACE
      ?auto_67212 - PLACE
      ?auto_67217 - HOIST
      ?auto_67211 - SURFACE
      ?auto_67216 - TRUCK
      ?auto_67215 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_67214 ?auto_67213 ) ( IS-CRATE ?auto_67209 ) ( not ( = ?auto_67209 ?auto_67210 ) ) ( not ( = ?auto_67212 ?auto_67213 ) ) ( HOIST-AT ?auto_67217 ?auto_67212 ) ( not ( = ?auto_67214 ?auto_67217 ) ) ( AVAILABLE ?auto_67217 ) ( SURFACE-AT ?auto_67209 ?auto_67212 ) ( ON ?auto_67209 ?auto_67211 ) ( CLEAR ?auto_67209 ) ( not ( = ?auto_67209 ?auto_67211 ) ) ( not ( = ?auto_67210 ?auto_67211 ) ) ( TRUCK-AT ?auto_67216 ?auto_67213 ) ( SURFACE-AT ?auto_67215 ?auto_67213 ) ( CLEAR ?auto_67215 ) ( IS-CRATE ?auto_67210 ) ( not ( = ?auto_67209 ?auto_67215 ) ) ( not ( = ?auto_67210 ?auto_67215 ) ) ( not ( = ?auto_67211 ?auto_67215 ) ) ( AVAILABLE ?auto_67214 ) ( IN ?auto_67210 ?auto_67216 ) )
    :subtasks
    ( ( !UNLOAD ?auto_67214 ?auto_67210 ?auto_67216 ?auto_67213 )
      ( MAKE-ON ?auto_67209 ?auto_67210 )
      ( MAKE-ON-VERIFY ?auto_67209 ?auto_67210 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_67218 - SURFACE
      ?auto_67219 - SURFACE
    )
    :vars
    (
      ?auto_67221 - HOIST
      ?auto_67225 - PLACE
      ?auto_67224 - PLACE
      ?auto_67223 - HOIST
      ?auto_67226 - SURFACE
      ?auto_67222 - SURFACE
      ?auto_67220 - TRUCK
      ?auto_67227 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_67221 ?auto_67225 ) ( IS-CRATE ?auto_67218 ) ( not ( = ?auto_67218 ?auto_67219 ) ) ( not ( = ?auto_67224 ?auto_67225 ) ) ( HOIST-AT ?auto_67223 ?auto_67224 ) ( not ( = ?auto_67221 ?auto_67223 ) ) ( AVAILABLE ?auto_67223 ) ( SURFACE-AT ?auto_67218 ?auto_67224 ) ( ON ?auto_67218 ?auto_67226 ) ( CLEAR ?auto_67218 ) ( not ( = ?auto_67218 ?auto_67226 ) ) ( not ( = ?auto_67219 ?auto_67226 ) ) ( SURFACE-AT ?auto_67222 ?auto_67225 ) ( CLEAR ?auto_67222 ) ( IS-CRATE ?auto_67219 ) ( not ( = ?auto_67218 ?auto_67222 ) ) ( not ( = ?auto_67219 ?auto_67222 ) ) ( not ( = ?auto_67226 ?auto_67222 ) ) ( AVAILABLE ?auto_67221 ) ( IN ?auto_67219 ?auto_67220 ) ( TRUCK-AT ?auto_67220 ?auto_67227 ) ( not ( = ?auto_67227 ?auto_67225 ) ) ( not ( = ?auto_67224 ?auto_67227 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_67220 ?auto_67227 ?auto_67225 )
      ( MAKE-ON ?auto_67218 ?auto_67219 )
      ( MAKE-ON-VERIFY ?auto_67218 ?auto_67219 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_67228 - SURFACE
      ?auto_67229 - SURFACE
    )
    :vars
    (
      ?auto_67232 - HOIST
      ?auto_67237 - PLACE
      ?auto_67231 - PLACE
      ?auto_67234 - HOIST
      ?auto_67236 - SURFACE
      ?auto_67235 - SURFACE
      ?auto_67233 - TRUCK
      ?auto_67230 - PLACE
      ?auto_67238 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_67232 ?auto_67237 ) ( IS-CRATE ?auto_67228 ) ( not ( = ?auto_67228 ?auto_67229 ) ) ( not ( = ?auto_67231 ?auto_67237 ) ) ( HOIST-AT ?auto_67234 ?auto_67231 ) ( not ( = ?auto_67232 ?auto_67234 ) ) ( AVAILABLE ?auto_67234 ) ( SURFACE-AT ?auto_67228 ?auto_67231 ) ( ON ?auto_67228 ?auto_67236 ) ( CLEAR ?auto_67228 ) ( not ( = ?auto_67228 ?auto_67236 ) ) ( not ( = ?auto_67229 ?auto_67236 ) ) ( SURFACE-AT ?auto_67235 ?auto_67237 ) ( CLEAR ?auto_67235 ) ( IS-CRATE ?auto_67229 ) ( not ( = ?auto_67228 ?auto_67235 ) ) ( not ( = ?auto_67229 ?auto_67235 ) ) ( not ( = ?auto_67236 ?auto_67235 ) ) ( AVAILABLE ?auto_67232 ) ( TRUCK-AT ?auto_67233 ?auto_67230 ) ( not ( = ?auto_67230 ?auto_67237 ) ) ( not ( = ?auto_67231 ?auto_67230 ) ) ( HOIST-AT ?auto_67238 ?auto_67230 ) ( LIFTING ?auto_67238 ?auto_67229 ) ( not ( = ?auto_67232 ?auto_67238 ) ) ( not ( = ?auto_67234 ?auto_67238 ) ) )
    :subtasks
    ( ( !LOAD ?auto_67238 ?auto_67229 ?auto_67233 ?auto_67230 )
      ( MAKE-ON ?auto_67228 ?auto_67229 )
      ( MAKE-ON-VERIFY ?auto_67228 ?auto_67229 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_67239 - SURFACE
      ?auto_67240 - SURFACE
    )
    :vars
    (
      ?auto_67248 - HOIST
      ?auto_67243 - PLACE
      ?auto_67246 - PLACE
      ?auto_67245 - HOIST
      ?auto_67241 - SURFACE
      ?auto_67249 - SURFACE
      ?auto_67247 - TRUCK
      ?auto_67242 - PLACE
      ?auto_67244 - HOIST
      ?auto_67250 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_67248 ?auto_67243 ) ( IS-CRATE ?auto_67239 ) ( not ( = ?auto_67239 ?auto_67240 ) ) ( not ( = ?auto_67246 ?auto_67243 ) ) ( HOIST-AT ?auto_67245 ?auto_67246 ) ( not ( = ?auto_67248 ?auto_67245 ) ) ( AVAILABLE ?auto_67245 ) ( SURFACE-AT ?auto_67239 ?auto_67246 ) ( ON ?auto_67239 ?auto_67241 ) ( CLEAR ?auto_67239 ) ( not ( = ?auto_67239 ?auto_67241 ) ) ( not ( = ?auto_67240 ?auto_67241 ) ) ( SURFACE-AT ?auto_67249 ?auto_67243 ) ( CLEAR ?auto_67249 ) ( IS-CRATE ?auto_67240 ) ( not ( = ?auto_67239 ?auto_67249 ) ) ( not ( = ?auto_67240 ?auto_67249 ) ) ( not ( = ?auto_67241 ?auto_67249 ) ) ( AVAILABLE ?auto_67248 ) ( TRUCK-AT ?auto_67247 ?auto_67242 ) ( not ( = ?auto_67242 ?auto_67243 ) ) ( not ( = ?auto_67246 ?auto_67242 ) ) ( HOIST-AT ?auto_67244 ?auto_67242 ) ( not ( = ?auto_67248 ?auto_67244 ) ) ( not ( = ?auto_67245 ?auto_67244 ) ) ( AVAILABLE ?auto_67244 ) ( SURFACE-AT ?auto_67240 ?auto_67242 ) ( ON ?auto_67240 ?auto_67250 ) ( CLEAR ?auto_67240 ) ( not ( = ?auto_67239 ?auto_67250 ) ) ( not ( = ?auto_67240 ?auto_67250 ) ) ( not ( = ?auto_67241 ?auto_67250 ) ) ( not ( = ?auto_67249 ?auto_67250 ) ) )
    :subtasks
    ( ( !LIFT ?auto_67244 ?auto_67240 ?auto_67250 ?auto_67242 )
      ( MAKE-ON ?auto_67239 ?auto_67240 )
      ( MAKE-ON-VERIFY ?auto_67239 ?auto_67240 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_67251 - SURFACE
      ?auto_67252 - SURFACE
    )
    :vars
    (
      ?auto_67259 - HOIST
      ?auto_67255 - PLACE
      ?auto_67258 - PLACE
      ?auto_67253 - HOIST
      ?auto_67261 - SURFACE
      ?auto_67260 - SURFACE
      ?auto_67254 - PLACE
      ?auto_67257 - HOIST
      ?auto_67262 - SURFACE
      ?auto_67256 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_67259 ?auto_67255 ) ( IS-CRATE ?auto_67251 ) ( not ( = ?auto_67251 ?auto_67252 ) ) ( not ( = ?auto_67258 ?auto_67255 ) ) ( HOIST-AT ?auto_67253 ?auto_67258 ) ( not ( = ?auto_67259 ?auto_67253 ) ) ( AVAILABLE ?auto_67253 ) ( SURFACE-AT ?auto_67251 ?auto_67258 ) ( ON ?auto_67251 ?auto_67261 ) ( CLEAR ?auto_67251 ) ( not ( = ?auto_67251 ?auto_67261 ) ) ( not ( = ?auto_67252 ?auto_67261 ) ) ( SURFACE-AT ?auto_67260 ?auto_67255 ) ( CLEAR ?auto_67260 ) ( IS-CRATE ?auto_67252 ) ( not ( = ?auto_67251 ?auto_67260 ) ) ( not ( = ?auto_67252 ?auto_67260 ) ) ( not ( = ?auto_67261 ?auto_67260 ) ) ( AVAILABLE ?auto_67259 ) ( not ( = ?auto_67254 ?auto_67255 ) ) ( not ( = ?auto_67258 ?auto_67254 ) ) ( HOIST-AT ?auto_67257 ?auto_67254 ) ( not ( = ?auto_67259 ?auto_67257 ) ) ( not ( = ?auto_67253 ?auto_67257 ) ) ( AVAILABLE ?auto_67257 ) ( SURFACE-AT ?auto_67252 ?auto_67254 ) ( ON ?auto_67252 ?auto_67262 ) ( CLEAR ?auto_67252 ) ( not ( = ?auto_67251 ?auto_67262 ) ) ( not ( = ?auto_67252 ?auto_67262 ) ) ( not ( = ?auto_67261 ?auto_67262 ) ) ( not ( = ?auto_67260 ?auto_67262 ) ) ( TRUCK-AT ?auto_67256 ?auto_67255 ) )
    :subtasks
    ( ( !DRIVE ?auto_67256 ?auto_67255 ?auto_67254 )
      ( MAKE-ON ?auto_67251 ?auto_67252 )
      ( MAKE-ON-VERIFY ?auto_67251 ?auto_67252 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_67263 - SURFACE
      ?auto_67264 - SURFACE
    )
    :vars
    (
      ?auto_67265 - HOIST
      ?auto_67266 - PLACE
      ?auto_67274 - PLACE
      ?auto_67271 - HOIST
      ?auto_67270 - SURFACE
      ?auto_67269 - SURFACE
      ?auto_67273 - PLACE
      ?auto_67267 - HOIST
      ?auto_67272 - SURFACE
      ?auto_67268 - TRUCK
      ?auto_67275 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_67265 ?auto_67266 ) ( IS-CRATE ?auto_67263 ) ( not ( = ?auto_67263 ?auto_67264 ) ) ( not ( = ?auto_67274 ?auto_67266 ) ) ( HOIST-AT ?auto_67271 ?auto_67274 ) ( not ( = ?auto_67265 ?auto_67271 ) ) ( AVAILABLE ?auto_67271 ) ( SURFACE-AT ?auto_67263 ?auto_67274 ) ( ON ?auto_67263 ?auto_67270 ) ( CLEAR ?auto_67263 ) ( not ( = ?auto_67263 ?auto_67270 ) ) ( not ( = ?auto_67264 ?auto_67270 ) ) ( IS-CRATE ?auto_67264 ) ( not ( = ?auto_67263 ?auto_67269 ) ) ( not ( = ?auto_67264 ?auto_67269 ) ) ( not ( = ?auto_67270 ?auto_67269 ) ) ( not ( = ?auto_67273 ?auto_67266 ) ) ( not ( = ?auto_67274 ?auto_67273 ) ) ( HOIST-AT ?auto_67267 ?auto_67273 ) ( not ( = ?auto_67265 ?auto_67267 ) ) ( not ( = ?auto_67271 ?auto_67267 ) ) ( AVAILABLE ?auto_67267 ) ( SURFACE-AT ?auto_67264 ?auto_67273 ) ( ON ?auto_67264 ?auto_67272 ) ( CLEAR ?auto_67264 ) ( not ( = ?auto_67263 ?auto_67272 ) ) ( not ( = ?auto_67264 ?auto_67272 ) ) ( not ( = ?auto_67270 ?auto_67272 ) ) ( not ( = ?auto_67269 ?auto_67272 ) ) ( TRUCK-AT ?auto_67268 ?auto_67266 ) ( SURFACE-AT ?auto_67275 ?auto_67266 ) ( CLEAR ?auto_67275 ) ( LIFTING ?auto_67265 ?auto_67269 ) ( IS-CRATE ?auto_67269 ) ( not ( = ?auto_67263 ?auto_67275 ) ) ( not ( = ?auto_67264 ?auto_67275 ) ) ( not ( = ?auto_67270 ?auto_67275 ) ) ( not ( = ?auto_67269 ?auto_67275 ) ) ( not ( = ?auto_67272 ?auto_67275 ) ) )
    :subtasks
    ( ( !DROP ?auto_67265 ?auto_67269 ?auto_67275 ?auto_67266 )
      ( MAKE-ON ?auto_67263 ?auto_67264 )
      ( MAKE-ON-VERIFY ?auto_67263 ?auto_67264 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_67276 - SURFACE
      ?auto_67277 - SURFACE
    )
    :vars
    (
      ?auto_67284 - HOIST
      ?auto_67279 - PLACE
      ?auto_67287 - PLACE
      ?auto_67286 - HOIST
      ?auto_67280 - SURFACE
      ?auto_67282 - SURFACE
      ?auto_67283 - PLACE
      ?auto_67281 - HOIST
      ?auto_67288 - SURFACE
      ?auto_67278 - TRUCK
      ?auto_67285 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_67284 ?auto_67279 ) ( IS-CRATE ?auto_67276 ) ( not ( = ?auto_67276 ?auto_67277 ) ) ( not ( = ?auto_67287 ?auto_67279 ) ) ( HOIST-AT ?auto_67286 ?auto_67287 ) ( not ( = ?auto_67284 ?auto_67286 ) ) ( AVAILABLE ?auto_67286 ) ( SURFACE-AT ?auto_67276 ?auto_67287 ) ( ON ?auto_67276 ?auto_67280 ) ( CLEAR ?auto_67276 ) ( not ( = ?auto_67276 ?auto_67280 ) ) ( not ( = ?auto_67277 ?auto_67280 ) ) ( IS-CRATE ?auto_67277 ) ( not ( = ?auto_67276 ?auto_67282 ) ) ( not ( = ?auto_67277 ?auto_67282 ) ) ( not ( = ?auto_67280 ?auto_67282 ) ) ( not ( = ?auto_67283 ?auto_67279 ) ) ( not ( = ?auto_67287 ?auto_67283 ) ) ( HOIST-AT ?auto_67281 ?auto_67283 ) ( not ( = ?auto_67284 ?auto_67281 ) ) ( not ( = ?auto_67286 ?auto_67281 ) ) ( AVAILABLE ?auto_67281 ) ( SURFACE-AT ?auto_67277 ?auto_67283 ) ( ON ?auto_67277 ?auto_67288 ) ( CLEAR ?auto_67277 ) ( not ( = ?auto_67276 ?auto_67288 ) ) ( not ( = ?auto_67277 ?auto_67288 ) ) ( not ( = ?auto_67280 ?auto_67288 ) ) ( not ( = ?auto_67282 ?auto_67288 ) ) ( TRUCK-AT ?auto_67278 ?auto_67279 ) ( SURFACE-AT ?auto_67285 ?auto_67279 ) ( CLEAR ?auto_67285 ) ( IS-CRATE ?auto_67282 ) ( not ( = ?auto_67276 ?auto_67285 ) ) ( not ( = ?auto_67277 ?auto_67285 ) ) ( not ( = ?auto_67280 ?auto_67285 ) ) ( not ( = ?auto_67282 ?auto_67285 ) ) ( not ( = ?auto_67288 ?auto_67285 ) ) ( AVAILABLE ?auto_67284 ) ( IN ?auto_67282 ?auto_67278 ) )
    :subtasks
    ( ( !UNLOAD ?auto_67284 ?auto_67282 ?auto_67278 ?auto_67279 )
      ( MAKE-ON ?auto_67276 ?auto_67277 )
      ( MAKE-ON-VERIFY ?auto_67276 ?auto_67277 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_67289 - SURFACE
      ?auto_67290 - SURFACE
    )
    :vars
    (
      ?auto_67298 - HOIST
      ?auto_67296 - PLACE
      ?auto_67299 - PLACE
      ?auto_67297 - HOIST
      ?auto_67301 - SURFACE
      ?auto_67291 - SURFACE
      ?auto_67292 - PLACE
      ?auto_67295 - HOIST
      ?auto_67293 - SURFACE
      ?auto_67300 - SURFACE
      ?auto_67294 - TRUCK
      ?auto_67302 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_67298 ?auto_67296 ) ( IS-CRATE ?auto_67289 ) ( not ( = ?auto_67289 ?auto_67290 ) ) ( not ( = ?auto_67299 ?auto_67296 ) ) ( HOIST-AT ?auto_67297 ?auto_67299 ) ( not ( = ?auto_67298 ?auto_67297 ) ) ( AVAILABLE ?auto_67297 ) ( SURFACE-AT ?auto_67289 ?auto_67299 ) ( ON ?auto_67289 ?auto_67301 ) ( CLEAR ?auto_67289 ) ( not ( = ?auto_67289 ?auto_67301 ) ) ( not ( = ?auto_67290 ?auto_67301 ) ) ( IS-CRATE ?auto_67290 ) ( not ( = ?auto_67289 ?auto_67291 ) ) ( not ( = ?auto_67290 ?auto_67291 ) ) ( not ( = ?auto_67301 ?auto_67291 ) ) ( not ( = ?auto_67292 ?auto_67296 ) ) ( not ( = ?auto_67299 ?auto_67292 ) ) ( HOIST-AT ?auto_67295 ?auto_67292 ) ( not ( = ?auto_67298 ?auto_67295 ) ) ( not ( = ?auto_67297 ?auto_67295 ) ) ( AVAILABLE ?auto_67295 ) ( SURFACE-AT ?auto_67290 ?auto_67292 ) ( ON ?auto_67290 ?auto_67293 ) ( CLEAR ?auto_67290 ) ( not ( = ?auto_67289 ?auto_67293 ) ) ( not ( = ?auto_67290 ?auto_67293 ) ) ( not ( = ?auto_67301 ?auto_67293 ) ) ( not ( = ?auto_67291 ?auto_67293 ) ) ( SURFACE-AT ?auto_67300 ?auto_67296 ) ( CLEAR ?auto_67300 ) ( IS-CRATE ?auto_67291 ) ( not ( = ?auto_67289 ?auto_67300 ) ) ( not ( = ?auto_67290 ?auto_67300 ) ) ( not ( = ?auto_67301 ?auto_67300 ) ) ( not ( = ?auto_67291 ?auto_67300 ) ) ( not ( = ?auto_67293 ?auto_67300 ) ) ( AVAILABLE ?auto_67298 ) ( IN ?auto_67291 ?auto_67294 ) ( TRUCK-AT ?auto_67294 ?auto_67302 ) ( not ( = ?auto_67302 ?auto_67296 ) ) ( not ( = ?auto_67299 ?auto_67302 ) ) ( not ( = ?auto_67292 ?auto_67302 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_67294 ?auto_67302 ?auto_67296 )
      ( MAKE-ON ?auto_67289 ?auto_67290 )
      ( MAKE-ON-VERIFY ?auto_67289 ?auto_67290 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_67303 - SURFACE
      ?auto_67304 - SURFACE
    )
    :vars
    (
      ?auto_67307 - HOIST
      ?auto_67313 - PLACE
      ?auto_67311 - PLACE
      ?auto_67305 - HOIST
      ?auto_67314 - SURFACE
      ?auto_67310 - SURFACE
      ?auto_67316 - PLACE
      ?auto_67312 - HOIST
      ?auto_67309 - SURFACE
      ?auto_67308 - SURFACE
      ?auto_67315 - TRUCK
      ?auto_67306 - PLACE
      ?auto_67317 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_67307 ?auto_67313 ) ( IS-CRATE ?auto_67303 ) ( not ( = ?auto_67303 ?auto_67304 ) ) ( not ( = ?auto_67311 ?auto_67313 ) ) ( HOIST-AT ?auto_67305 ?auto_67311 ) ( not ( = ?auto_67307 ?auto_67305 ) ) ( AVAILABLE ?auto_67305 ) ( SURFACE-AT ?auto_67303 ?auto_67311 ) ( ON ?auto_67303 ?auto_67314 ) ( CLEAR ?auto_67303 ) ( not ( = ?auto_67303 ?auto_67314 ) ) ( not ( = ?auto_67304 ?auto_67314 ) ) ( IS-CRATE ?auto_67304 ) ( not ( = ?auto_67303 ?auto_67310 ) ) ( not ( = ?auto_67304 ?auto_67310 ) ) ( not ( = ?auto_67314 ?auto_67310 ) ) ( not ( = ?auto_67316 ?auto_67313 ) ) ( not ( = ?auto_67311 ?auto_67316 ) ) ( HOIST-AT ?auto_67312 ?auto_67316 ) ( not ( = ?auto_67307 ?auto_67312 ) ) ( not ( = ?auto_67305 ?auto_67312 ) ) ( AVAILABLE ?auto_67312 ) ( SURFACE-AT ?auto_67304 ?auto_67316 ) ( ON ?auto_67304 ?auto_67309 ) ( CLEAR ?auto_67304 ) ( not ( = ?auto_67303 ?auto_67309 ) ) ( not ( = ?auto_67304 ?auto_67309 ) ) ( not ( = ?auto_67314 ?auto_67309 ) ) ( not ( = ?auto_67310 ?auto_67309 ) ) ( SURFACE-AT ?auto_67308 ?auto_67313 ) ( CLEAR ?auto_67308 ) ( IS-CRATE ?auto_67310 ) ( not ( = ?auto_67303 ?auto_67308 ) ) ( not ( = ?auto_67304 ?auto_67308 ) ) ( not ( = ?auto_67314 ?auto_67308 ) ) ( not ( = ?auto_67310 ?auto_67308 ) ) ( not ( = ?auto_67309 ?auto_67308 ) ) ( AVAILABLE ?auto_67307 ) ( TRUCK-AT ?auto_67315 ?auto_67306 ) ( not ( = ?auto_67306 ?auto_67313 ) ) ( not ( = ?auto_67311 ?auto_67306 ) ) ( not ( = ?auto_67316 ?auto_67306 ) ) ( HOIST-AT ?auto_67317 ?auto_67306 ) ( LIFTING ?auto_67317 ?auto_67310 ) ( not ( = ?auto_67307 ?auto_67317 ) ) ( not ( = ?auto_67305 ?auto_67317 ) ) ( not ( = ?auto_67312 ?auto_67317 ) ) )
    :subtasks
    ( ( !LOAD ?auto_67317 ?auto_67310 ?auto_67315 ?auto_67306 )
      ( MAKE-ON ?auto_67303 ?auto_67304 )
      ( MAKE-ON-VERIFY ?auto_67303 ?auto_67304 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_67318 - SURFACE
      ?auto_67319 - SURFACE
    )
    :vars
    (
      ?auto_67320 - HOIST
      ?auto_67324 - PLACE
      ?auto_67323 - PLACE
      ?auto_67332 - HOIST
      ?auto_67322 - SURFACE
      ?auto_67325 - SURFACE
      ?auto_67331 - PLACE
      ?auto_67330 - HOIST
      ?auto_67326 - SURFACE
      ?auto_67328 - SURFACE
      ?auto_67327 - TRUCK
      ?auto_67329 - PLACE
      ?auto_67321 - HOIST
      ?auto_67333 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_67320 ?auto_67324 ) ( IS-CRATE ?auto_67318 ) ( not ( = ?auto_67318 ?auto_67319 ) ) ( not ( = ?auto_67323 ?auto_67324 ) ) ( HOIST-AT ?auto_67332 ?auto_67323 ) ( not ( = ?auto_67320 ?auto_67332 ) ) ( AVAILABLE ?auto_67332 ) ( SURFACE-AT ?auto_67318 ?auto_67323 ) ( ON ?auto_67318 ?auto_67322 ) ( CLEAR ?auto_67318 ) ( not ( = ?auto_67318 ?auto_67322 ) ) ( not ( = ?auto_67319 ?auto_67322 ) ) ( IS-CRATE ?auto_67319 ) ( not ( = ?auto_67318 ?auto_67325 ) ) ( not ( = ?auto_67319 ?auto_67325 ) ) ( not ( = ?auto_67322 ?auto_67325 ) ) ( not ( = ?auto_67331 ?auto_67324 ) ) ( not ( = ?auto_67323 ?auto_67331 ) ) ( HOIST-AT ?auto_67330 ?auto_67331 ) ( not ( = ?auto_67320 ?auto_67330 ) ) ( not ( = ?auto_67332 ?auto_67330 ) ) ( AVAILABLE ?auto_67330 ) ( SURFACE-AT ?auto_67319 ?auto_67331 ) ( ON ?auto_67319 ?auto_67326 ) ( CLEAR ?auto_67319 ) ( not ( = ?auto_67318 ?auto_67326 ) ) ( not ( = ?auto_67319 ?auto_67326 ) ) ( not ( = ?auto_67322 ?auto_67326 ) ) ( not ( = ?auto_67325 ?auto_67326 ) ) ( SURFACE-AT ?auto_67328 ?auto_67324 ) ( CLEAR ?auto_67328 ) ( IS-CRATE ?auto_67325 ) ( not ( = ?auto_67318 ?auto_67328 ) ) ( not ( = ?auto_67319 ?auto_67328 ) ) ( not ( = ?auto_67322 ?auto_67328 ) ) ( not ( = ?auto_67325 ?auto_67328 ) ) ( not ( = ?auto_67326 ?auto_67328 ) ) ( AVAILABLE ?auto_67320 ) ( TRUCK-AT ?auto_67327 ?auto_67329 ) ( not ( = ?auto_67329 ?auto_67324 ) ) ( not ( = ?auto_67323 ?auto_67329 ) ) ( not ( = ?auto_67331 ?auto_67329 ) ) ( HOIST-AT ?auto_67321 ?auto_67329 ) ( not ( = ?auto_67320 ?auto_67321 ) ) ( not ( = ?auto_67332 ?auto_67321 ) ) ( not ( = ?auto_67330 ?auto_67321 ) ) ( AVAILABLE ?auto_67321 ) ( SURFACE-AT ?auto_67325 ?auto_67329 ) ( ON ?auto_67325 ?auto_67333 ) ( CLEAR ?auto_67325 ) ( not ( = ?auto_67318 ?auto_67333 ) ) ( not ( = ?auto_67319 ?auto_67333 ) ) ( not ( = ?auto_67322 ?auto_67333 ) ) ( not ( = ?auto_67325 ?auto_67333 ) ) ( not ( = ?auto_67326 ?auto_67333 ) ) ( not ( = ?auto_67328 ?auto_67333 ) ) )
    :subtasks
    ( ( !LIFT ?auto_67321 ?auto_67325 ?auto_67333 ?auto_67329 )
      ( MAKE-ON ?auto_67318 ?auto_67319 )
      ( MAKE-ON-VERIFY ?auto_67318 ?auto_67319 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_67334 - SURFACE
      ?auto_67335 - SURFACE
    )
    :vars
    (
      ?auto_67338 - HOIST
      ?auto_67347 - PLACE
      ?auto_67349 - PLACE
      ?auto_67341 - HOIST
      ?auto_67342 - SURFACE
      ?auto_67346 - SURFACE
      ?auto_67344 - PLACE
      ?auto_67348 - HOIST
      ?auto_67336 - SURFACE
      ?auto_67339 - SURFACE
      ?auto_67340 - PLACE
      ?auto_67345 - HOIST
      ?auto_67337 - SURFACE
      ?auto_67343 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_67338 ?auto_67347 ) ( IS-CRATE ?auto_67334 ) ( not ( = ?auto_67334 ?auto_67335 ) ) ( not ( = ?auto_67349 ?auto_67347 ) ) ( HOIST-AT ?auto_67341 ?auto_67349 ) ( not ( = ?auto_67338 ?auto_67341 ) ) ( AVAILABLE ?auto_67341 ) ( SURFACE-AT ?auto_67334 ?auto_67349 ) ( ON ?auto_67334 ?auto_67342 ) ( CLEAR ?auto_67334 ) ( not ( = ?auto_67334 ?auto_67342 ) ) ( not ( = ?auto_67335 ?auto_67342 ) ) ( IS-CRATE ?auto_67335 ) ( not ( = ?auto_67334 ?auto_67346 ) ) ( not ( = ?auto_67335 ?auto_67346 ) ) ( not ( = ?auto_67342 ?auto_67346 ) ) ( not ( = ?auto_67344 ?auto_67347 ) ) ( not ( = ?auto_67349 ?auto_67344 ) ) ( HOIST-AT ?auto_67348 ?auto_67344 ) ( not ( = ?auto_67338 ?auto_67348 ) ) ( not ( = ?auto_67341 ?auto_67348 ) ) ( AVAILABLE ?auto_67348 ) ( SURFACE-AT ?auto_67335 ?auto_67344 ) ( ON ?auto_67335 ?auto_67336 ) ( CLEAR ?auto_67335 ) ( not ( = ?auto_67334 ?auto_67336 ) ) ( not ( = ?auto_67335 ?auto_67336 ) ) ( not ( = ?auto_67342 ?auto_67336 ) ) ( not ( = ?auto_67346 ?auto_67336 ) ) ( SURFACE-AT ?auto_67339 ?auto_67347 ) ( CLEAR ?auto_67339 ) ( IS-CRATE ?auto_67346 ) ( not ( = ?auto_67334 ?auto_67339 ) ) ( not ( = ?auto_67335 ?auto_67339 ) ) ( not ( = ?auto_67342 ?auto_67339 ) ) ( not ( = ?auto_67346 ?auto_67339 ) ) ( not ( = ?auto_67336 ?auto_67339 ) ) ( AVAILABLE ?auto_67338 ) ( not ( = ?auto_67340 ?auto_67347 ) ) ( not ( = ?auto_67349 ?auto_67340 ) ) ( not ( = ?auto_67344 ?auto_67340 ) ) ( HOIST-AT ?auto_67345 ?auto_67340 ) ( not ( = ?auto_67338 ?auto_67345 ) ) ( not ( = ?auto_67341 ?auto_67345 ) ) ( not ( = ?auto_67348 ?auto_67345 ) ) ( AVAILABLE ?auto_67345 ) ( SURFACE-AT ?auto_67346 ?auto_67340 ) ( ON ?auto_67346 ?auto_67337 ) ( CLEAR ?auto_67346 ) ( not ( = ?auto_67334 ?auto_67337 ) ) ( not ( = ?auto_67335 ?auto_67337 ) ) ( not ( = ?auto_67342 ?auto_67337 ) ) ( not ( = ?auto_67346 ?auto_67337 ) ) ( not ( = ?auto_67336 ?auto_67337 ) ) ( not ( = ?auto_67339 ?auto_67337 ) ) ( TRUCK-AT ?auto_67343 ?auto_67347 ) )
    :subtasks
    ( ( !DRIVE ?auto_67343 ?auto_67347 ?auto_67340 )
      ( MAKE-ON ?auto_67334 ?auto_67335 )
      ( MAKE-ON-VERIFY ?auto_67334 ?auto_67335 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_67350 - SURFACE
      ?auto_67351 - SURFACE
    )
    :vars
    (
      ?auto_67358 - HOIST
      ?auto_67360 - PLACE
      ?auto_67361 - PLACE
      ?auto_67365 - HOIST
      ?auto_67357 - SURFACE
      ?auto_67353 - SURFACE
      ?auto_67363 - PLACE
      ?auto_67356 - HOIST
      ?auto_67364 - SURFACE
      ?auto_67362 - SURFACE
      ?auto_67355 - PLACE
      ?auto_67354 - HOIST
      ?auto_67359 - SURFACE
      ?auto_67352 - TRUCK
      ?auto_67366 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_67358 ?auto_67360 ) ( IS-CRATE ?auto_67350 ) ( not ( = ?auto_67350 ?auto_67351 ) ) ( not ( = ?auto_67361 ?auto_67360 ) ) ( HOIST-AT ?auto_67365 ?auto_67361 ) ( not ( = ?auto_67358 ?auto_67365 ) ) ( AVAILABLE ?auto_67365 ) ( SURFACE-AT ?auto_67350 ?auto_67361 ) ( ON ?auto_67350 ?auto_67357 ) ( CLEAR ?auto_67350 ) ( not ( = ?auto_67350 ?auto_67357 ) ) ( not ( = ?auto_67351 ?auto_67357 ) ) ( IS-CRATE ?auto_67351 ) ( not ( = ?auto_67350 ?auto_67353 ) ) ( not ( = ?auto_67351 ?auto_67353 ) ) ( not ( = ?auto_67357 ?auto_67353 ) ) ( not ( = ?auto_67363 ?auto_67360 ) ) ( not ( = ?auto_67361 ?auto_67363 ) ) ( HOIST-AT ?auto_67356 ?auto_67363 ) ( not ( = ?auto_67358 ?auto_67356 ) ) ( not ( = ?auto_67365 ?auto_67356 ) ) ( AVAILABLE ?auto_67356 ) ( SURFACE-AT ?auto_67351 ?auto_67363 ) ( ON ?auto_67351 ?auto_67364 ) ( CLEAR ?auto_67351 ) ( not ( = ?auto_67350 ?auto_67364 ) ) ( not ( = ?auto_67351 ?auto_67364 ) ) ( not ( = ?auto_67357 ?auto_67364 ) ) ( not ( = ?auto_67353 ?auto_67364 ) ) ( IS-CRATE ?auto_67353 ) ( not ( = ?auto_67350 ?auto_67362 ) ) ( not ( = ?auto_67351 ?auto_67362 ) ) ( not ( = ?auto_67357 ?auto_67362 ) ) ( not ( = ?auto_67353 ?auto_67362 ) ) ( not ( = ?auto_67364 ?auto_67362 ) ) ( not ( = ?auto_67355 ?auto_67360 ) ) ( not ( = ?auto_67361 ?auto_67355 ) ) ( not ( = ?auto_67363 ?auto_67355 ) ) ( HOIST-AT ?auto_67354 ?auto_67355 ) ( not ( = ?auto_67358 ?auto_67354 ) ) ( not ( = ?auto_67365 ?auto_67354 ) ) ( not ( = ?auto_67356 ?auto_67354 ) ) ( AVAILABLE ?auto_67354 ) ( SURFACE-AT ?auto_67353 ?auto_67355 ) ( ON ?auto_67353 ?auto_67359 ) ( CLEAR ?auto_67353 ) ( not ( = ?auto_67350 ?auto_67359 ) ) ( not ( = ?auto_67351 ?auto_67359 ) ) ( not ( = ?auto_67357 ?auto_67359 ) ) ( not ( = ?auto_67353 ?auto_67359 ) ) ( not ( = ?auto_67364 ?auto_67359 ) ) ( not ( = ?auto_67362 ?auto_67359 ) ) ( TRUCK-AT ?auto_67352 ?auto_67360 ) ( SURFACE-AT ?auto_67366 ?auto_67360 ) ( CLEAR ?auto_67366 ) ( LIFTING ?auto_67358 ?auto_67362 ) ( IS-CRATE ?auto_67362 ) ( not ( = ?auto_67350 ?auto_67366 ) ) ( not ( = ?auto_67351 ?auto_67366 ) ) ( not ( = ?auto_67357 ?auto_67366 ) ) ( not ( = ?auto_67353 ?auto_67366 ) ) ( not ( = ?auto_67364 ?auto_67366 ) ) ( not ( = ?auto_67362 ?auto_67366 ) ) ( not ( = ?auto_67359 ?auto_67366 ) ) )
    :subtasks
    ( ( !DROP ?auto_67358 ?auto_67362 ?auto_67366 ?auto_67360 )
      ( MAKE-ON ?auto_67350 ?auto_67351 )
      ( MAKE-ON-VERIFY ?auto_67350 ?auto_67351 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_67367 - SURFACE
      ?auto_67368 - SURFACE
    )
    :vars
    (
      ?auto_67371 - HOIST
      ?auto_67374 - PLACE
      ?auto_67375 - PLACE
      ?auto_67382 - HOIST
      ?auto_67381 - SURFACE
      ?auto_67383 - SURFACE
      ?auto_67373 - PLACE
      ?auto_67379 - HOIST
      ?auto_67378 - SURFACE
      ?auto_67370 - SURFACE
      ?auto_67369 - PLACE
      ?auto_67377 - HOIST
      ?auto_67380 - SURFACE
      ?auto_67376 - TRUCK
      ?auto_67372 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_67371 ?auto_67374 ) ( IS-CRATE ?auto_67367 ) ( not ( = ?auto_67367 ?auto_67368 ) ) ( not ( = ?auto_67375 ?auto_67374 ) ) ( HOIST-AT ?auto_67382 ?auto_67375 ) ( not ( = ?auto_67371 ?auto_67382 ) ) ( AVAILABLE ?auto_67382 ) ( SURFACE-AT ?auto_67367 ?auto_67375 ) ( ON ?auto_67367 ?auto_67381 ) ( CLEAR ?auto_67367 ) ( not ( = ?auto_67367 ?auto_67381 ) ) ( not ( = ?auto_67368 ?auto_67381 ) ) ( IS-CRATE ?auto_67368 ) ( not ( = ?auto_67367 ?auto_67383 ) ) ( not ( = ?auto_67368 ?auto_67383 ) ) ( not ( = ?auto_67381 ?auto_67383 ) ) ( not ( = ?auto_67373 ?auto_67374 ) ) ( not ( = ?auto_67375 ?auto_67373 ) ) ( HOIST-AT ?auto_67379 ?auto_67373 ) ( not ( = ?auto_67371 ?auto_67379 ) ) ( not ( = ?auto_67382 ?auto_67379 ) ) ( AVAILABLE ?auto_67379 ) ( SURFACE-AT ?auto_67368 ?auto_67373 ) ( ON ?auto_67368 ?auto_67378 ) ( CLEAR ?auto_67368 ) ( not ( = ?auto_67367 ?auto_67378 ) ) ( not ( = ?auto_67368 ?auto_67378 ) ) ( not ( = ?auto_67381 ?auto_67378 ) ) ( not ( = ?auto_67383 ?auto_67378 ) ) ( IS-CRATE ?auto_67383 ) ( not ( = ?auto_67367 ?auto_67370 ) ) ( not ( = ?auto_67368 ?auto_67370 ) ) ( not ( = ?auto_67381 ?auto_67370 ) ) ( not ( = ?auto_67383 ?auto_67370 ) ) ( not ( = ?auto_67378 ?auto_67370 ) ) ( not ( = ?auto_67369 ?auto_67374 ) ) ( not ( = ?auto_67375 ?auto_67369 ) ) ( not ( = ?auto_67373 ?auto_67369 ) ) ( HOIST-AT ?auto_67377 ?auto_67369 ) ( not ( = ?auto_67371 ?auto_67377 ) ) ( not ( = ?auto_67382 ?auto_67377 ) ) ( not ( = ?auto_67379 ?auto_67377 ) ) ( AVAILABLE ?auto_67377 ) ( SURFACE-AT ?auto_67383 ?auto_67369 ) ( ON ?auto_67383 ?auto_67380 ) ( CLEAR ?auto_67383 ) ( not ( = ?auto_67367 ?auto_67380 ) ) ( not ( = ?auto_67368 ?auto_67380 ) ) ( not ( = ?auto_67381 ?auto_67380 ) ) ( not ( = ?auto_67383 ?auto_67380 ) ) ( not ( = ?auto_67378 ?auto_67380 ) ) ( not ( = ?auto_67370 ?auto_67380 ) ) ( TRUCK-AT ?auto_67376 ?auto_67374 ) ( SURFACE-AT ?auto_67372 ?auto_67374 ) ( CLEAR ?auto_67372 ) ( IS-CRATE ?auto_67370 ) ( not ( = ?auto_67367 ?auto_67372 ) ) ( not ( = ?auto_67368 ?auto_67372 ) ) ( not ( = ?auto_67381 ?auto_67372 ) ) ( not ( = ?auto_67383 ?auto_67372 ) ) ( not ( = ?auto_67378 ?auto_67372 ) ) ( not ( = ?auto_67370 ?auto_67372 ) ) ( not ( = ?auto_67380 ?auto_67372 ) ) ( AVAILABLE ?auto_67371 ) ( IN ?auto_67370 ?auto_67376 ) )
    :subtasks
    ( ( !UNLOAD ?auto_67371 ?auto_67370 ?auto_67376 ?auto_67374 )
      ( MAKE-ON ?auto_67367 ?auto_67368 )
      ( MAKE-ON-VERIFY ?auto_67367 ?auto_67368 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_67384 - SURFACE
      ?auto_67385 - SURFACE
    )
    :vars
    (
      ?auto_67390 - HOIST
      ?auto_67391 - PLACE
      ?auto_67398 - PLACE
      ?auto_67394 - HOIST
      ?auto_67397 - SURFACE
      ?auto_67389 - SURFACE
      ?auto_67396 - PLACE
      ?auto_67400 - HOIST
      ?auto_67395 - SURFACE
      ?auto_67388 - SURFACE
      ?auto_67392 - PLACE
      ?auto_67399 - HOIST
      ?auto_67386 - SURFACE
      ?auto_67393 - SURFACE
      ?auto_67387 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_67390 ?auto_67391 ) ( IS-CRATE ?auto_67384 ) ( not ( = ?auto_67384 ?auto_67385 ) ) ( not ( = ?auto_67398 ?auto_67391 ) ) ( HOIST-AT ?auto_67394 ?auto_67398 ) ( not ( = ?auto_67390 ?auto_67394 ) ) ( AVAILABLE ?auto_67394 ) ( SURFACE-AT ?auto_67384 ?auto_67398 ) ( ON ?auto_67384 ?auto_67397 ) ( CLEAR ?auto_67384 ) ( not ( = ?auto_67384 ?auto_67397 ) ) ( not ( = ?auto_67385 ?auto_67397 ) ) ( IS-CRATE ?auto_67385 ) ( not ( = ?auto_67384 ?auto_67389 ) ) ( not ( = ?auto_67385 ?auto_67389 ) ) ( not ( = ?auto_67397 ?auto_67389 ) ) ( not ( = ?auto_67396 ?auto_67391 ) ) ( not ( = ?auto_67398 ?auto_67396 ) ) ( HOIST-AT ?auto_67400 ?auto_67396 ) ( not ( = ?auto_67390 ?auto_67400 ) ) ( not ( = ?auto_67394 ?auto_67400 ) ) ( AVAILABLE ?auto_67400 ) ( SURFACE-AT ?auto_67385 ?auto_67396 ) ( ON ?auto_67385 ?auto_67395 ) ( CLEAR ?auto_67385 ) ( not ( = ?auto_67384 ?auto_67395 ) ) ( not ( = ?auto_67385 ?auto_67395 ) ) ( not ( = ?auto_67397 ?auto_67395 ) ) ( not ( = ?auto_67389 ?auto_67395 ) ) ( IS-CRATE ?auto_67389 ) ( not ( = ?auto_67384 ?auto_67388 ) ) ( not ( = ?auto_67385 ?auto_67388 ) ) ( not ( = ?auto_67397 ?auto_67388 ) ) ( not ( = ?auto_67389 ?auto_67388 ) ) ( not ( = ?auto_67395 ?auto_67388 ) ) ( not ( = ?auto_67392 ?auto_67391 ) ) ( not ( = ?auto_67398 ?auto_67392 ) ) ( not ( = ?auto_67396 ?auto_67392 ) ) ( HOIST-AT ?auto_67399 ?auto_67392 ) ( not ( = ?auto_67390 ?auto_67399 ) ) ( not ( = ?auto_67394 ?auto_67399 ) ) ( not ( = ?auto_67400 ?auto_67399 ) ) ( AVAILABLE ?auto_67399 ) ( SURFACE-AT ?auto_67389 ?auto_67392 ) ( ON ?auto_67389 ?auto_67386 ) ( CLEAR ?auto_67389 ) ( not ( = ?auto_67384 ?auto_67386 ) ) ( not ( = ?auto_67385 ?auto_67386 ) ) ( not ( = ?auto_67397 ?auto_67386 ) ) ( not ( = ?auto_67389 ?auto_67386 ) ) ( not ( = ?auto_67395 ?auto_67386 ) ) ( not ( = ?auto_67388 ?auto_67386 ) ) ( SURFACE-AT ?auto_67393 ?auto_67391 ) ( CLEAR ?auto_67393 ) ( IS-CRATE ?auto_67388 ) ( not ( = ?auto_67384 ?auto_67393 ) ) ( not ( = ?auto_67385 ?auto_67393 ) ) ( not ( = ?auto_67397 ?auto_67393 ) ) ( not ( = ?auto_67389 ?auto_67393 ) ) ( not ( = ?auto_67395 ?auto_67393 ) ) ( not ( = ?auto_67388 ?auto_67393 ) ) ( not ( = ?auto_67386 ?auto_67393 ) ) ( AVAILABLE ?auto_67390 ) ( IN ?auto_67388 ?auto_67387 ) ( TRUCK-AT ?auto_67387 ?auto_67392 ) )
    :subtasks
    ( ( !DRIVE ?auto_67387 ?auto_67392 ?auto_67391 )
      ( MAKE-ON ?auto_67384 ?auto_67385 )
      ( MAKE-ON-VERIFY ?auto_67384 ?auto_67385 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_67401 - SURFACE
      ?auto_67402 - SURFACE
    )
    :vars
    (
      ?auto_67414 - HOIST
      ?auto_67406 - PLACE
      ?auto_67412 - PLACE
      ?auto_67403 - HOIST
      ?auto_67416 - SURFACE
      ?auto_67410 - SURFACE
      ?auto_67409 - PLACE
      ?auto_67413 - HOIST
      ?auto_67415 - SURFACE
      ?auto_67408 - SURFACE
      ?auto_67411 - PLACE
      ?auto_67404 - HOIST
      ?auto_67417 - SURFACE
      ?auto_67405 - SURFACE
      ?auto_67407 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_67414 ?auto_67406 ) ( IS-CRATE ?auto_67401 ) ( not ( = ?auto_67401 ?auto_67402 ) ) ( not ( = ?auto_67412 ?auto_67406 ) ) ( HOIST-AT ?auto_67403 ?auto_67412 ) ( not ( = ?auto_67414 ?auto_67403 ) ) ( AVAILABLE ?auto_67403 ) ( SURFACE-AT ?auto_67401 ?auto_67412 ) ( ON ?auto_67401 ?auto_67416 ) ( CLEAR ?auto_67401 ) ( not ( = ?auto_67401 ?auto_67416 ) ) ( not ( = ?auto_67402 ?auto_67416 ) ) ( IS-CRATE ?auto_67402 ) ( not ( = ?auto_67401 ?auto_67410 ) ) ( not ( = ?auto_67402 ?auto_67410 ) ) ( not ( = ?auto_67416 ?auto_67410 ) ) ( not ( = ?auto_67409 ?auto_67406 ) ) ( not ( = ?auto_67412 ?auto_67409 ) ) ( HOIST-AT ?auto_67413 ?auto_67409 ) ( not ( = ?auto_67414 ?auto_67413 ) ) ( not ( = ?auto_67403 ?auto_67413 ) ) ( AVAILABLE ?auto_67413 ) ( SURFACE-AT ?auto_67402 ?auto_67409 ) ( ON ?auto_67402 ?auto_67415 ) ( CLEAR ?auto_67402 ) ( not ( = ?auto_67401 ?auto_67415 ) ) ( not ( = ?auto_67402 ?auto_67415 ) ) ( not ( = ?auto_67416 ?auto_67415 ) ) ( not ( = ?auto_67410 ?auto_67415 ) ) ( IS-CRATE ?auto_67410 ) ( not ( = ?auto_67401 ?auto_67408 ) ) ( not ( = ?auto_67402 ?auto_67408 ) ) ( not ( = ?auto_67416 ?auto_67408 ) ) ( not ( = ?auto_67410 ?auto_67408 ) ) ( not ( = ?auto_67415 ?auto_67408 ) ) ( not ( = ?auto_67411 ?auto_67406 ) ) ( not ( = ?auto_67412 ?auto_67411 ) ) ( not ( = ?auto_67409 ?auto_67411 ) ) ( HOIST-AT ?auto_67404 ?auto_67411 ) ( not ( = ?auto_67414 ?auto_67404 ) ) ( not ( = ?auto_67403 ?auto_67404 ) ) ( not ( = ?auto_67413 ?auto_67404 ) ) ( SURFACE-AT ?auto_67410 ?auto_67411 ) ( ON ?auto_67410 ?auto_67417 ) ( CLEAR ?auto_67410 ) ( not ( = ?auto_67401 ?auto_67417 ) ) ( not ( = ?auto_67402 ?auto_67417 ) ) ( not ( = ?auto_67416 ?auto_67417 ) ) ( not ( = ?auto_67410 ?auto_67417 ) ) ( not ( = ?auto_67415 ?auto_67417 ) ) ( not ( = ?auto_67408 ?auto_67417 ) ) ( SURFACE-AT ?auto_67405 ?auto_67406 ) ( CLEAR ?auto_67405 ) ( IS-CRATE ?auto_67408 ) ( not ( = ?auto_67401 ?auto_67405 ) ) ( not ( = ?auto_67402 ?auto_67405 ) ) ( not ( = ?auto_67416 ?auto_67405 ) ) ( not ( = ?auto_67410 ?auto_67405 ) ) ( not ( = ?auto_67415 ?auto_67405 ) ) ( not ( = ?auto_67408 ?auto_67405 ) ) ( not ( = ?auto_67417 ?auto_67405 ) ) ( AVAILABLE ?auto_67414 ) ( TRUCK-AT ?auto_67407 ?auto_67411 ) ( LIFTING ?auto_67404 ?auto_67408 ) )
    :subtasks
    ( ( !LOAD ?auto_67404 ?auto_67408 ?auto_67407 ?auto_67411 )
      ( MAKE-ON ?auto_67401 ?auto_67402 )
      ( MAKE-ON-VERIFY ?auto_67401 ?auto_67402 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_67418 - SURFACE
      ?auto_67419 - SURFACE
    )
    :vars
    (
      ?auto_67427 - HOIST
      ?auto_67432 - PLACE
      ?auto_67426 - PLACE
      ?auto_67422 - HOIST
      ?auto_67423 - SURFACE
      ?auto_67434 - SURFACE
      ?auto_67431 - PLACE
      ?auto_67425 - HOIST
      ?auto_67428 - SURFACE
      ?auto_67430 - SURFACE
      ?auto_67421 - PLACE
      ?auto_67429 - HOIST
      ?auto_67420 - SURFACE
      ?auto_67433 - SURFACE
      ?auto_67424 - TRUCK
      ?auto_67435 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_67427 ?auto_67432 ) ( IS-CRATE ?auto_67418 ) ( not ( = ?auto_67418 ?auto_67419 ) ) ( not ( = ?auto_67426 ?auto_67432 ) ) ( HOIST-AT ?auto_67422 ?auto_67426 ) ( not ( = ?auto_67427 ?auto_67422 ) ) ( AVAILABLE ?auto_67422 ) ( SURFACE-AT ?auto_67418 ?auto_67426 ) ( ON ?auto_67418 ?auto_67423 ) ( CLEAR ?auto_67418 ) ( not ( = ?auto_67418 ?auto_67423 ) ) ( not ( = ?auto_67419 ?auto_67423 ) ) ( IS-CRATE ?auto_67419 ) ( not ( = ?auto_67418 ?auto_67434 ) ) ( not ( = ?auto_67419 ?auto_67434 ) ) ( not ( = ?auto_67423 ?auto_67434 ) ) ( not ( = ?auto_67431 ?auto_67432 ) ) ( not ( = ?auto_67426 ?auto_67431 ) ) ( HOIST-AT ?auto_67425 ?auto_67431 ) ( not ( = ?auto_67427 ?auto_67425 ) ) ( not ( = ?auto_67422 ?auto_67425 ) ) ( AVAILABLE ?auto_67425 ) ( SURFACE-AT ?auto_67419 ?auto_67431 ) ( ON ?auto_67419 ?auto_67428 ) ( CLEAR ?auto_67419 ) ( not ( = ?auto_67418 ?auto_67428 ) ) ( not ( = ?auto_67419 ?auto_67428 ) ) ( not ( = ?auto_67423 ?auto_67428 ) ) ( not ( = ?auto_67434 ?auto_67428 ) ) ( IS-CRATE ?auto_67434 ) ( not ( = ?auto_67418 ?auto_67430 ) ) ( not ( = ?auto_67419 ?auto_67430 ) ) ( not ( = ?auto_67423 ?auto_67430 ) ) ( not ( = ?auto_67434 ?auto_67430 ) ) ( not ( = ?auto_67428 ?auto_67430 ) ) ( not ( = ?auto_67421 ?auto_67432 ) ) ( not ( = ?auto_67426 ?auto_67421 ) ) ( not ( = ?auto_67431 ?auto_67421 ) ) ( HOIST-AT ?auto_67429 ?auto_67421 ) ( not ( = ?auto_67427 ?auto_67429 ) ) ( not ( = ?auto_67422 ?auto_67429 ) ) ( not ( = ?auto_67425 ?auto_67429 ) ) ( SURFACE-AT ?auto_67434 ?auto_67421 ) ( ON ?auto_67434 ?auto_67420 ) ( CLEAR ?auto_67434 ) ( not ( = ?auto_67418 ?auto_67420 ) ) ( not ( = ?auto_67419 ?auto_67420 ) ) ( not ( = ?auto_67423 ?auto_67420 ) ) ( not ( = ?auto_67434 ?auto_67420 ) ) ( not ( = ?auto_67428 ?auto_67420 ) ) ( not ( = ?auto_67430 ?auto_67420 ) ) ( SURFACE-AT ?auto_67433 ?auto_67432 ) ( CLEAR ?auto_67433 ) ( IS-CRATE ?auto_67430 ) ( not ( = ?auto_67418 ?auto_67433 ) ) ( not ( = ?auto_67419 ?auto_67433 ) ) ( not ( = ?auto_67423 ?auto_67433 ) ) ( not ( = ?auto_67434 ?auto_67433 ) ) ( not ( = ?auto_67428 ?auto_67433 ) ) ( not ( = ?auto_67430 ?auto_67433 ) ) ( not ( = ?auto_67420 ?auto_67433 ) ) ( AVAILABLE ?auto_67427 ) ( TRUCK-AT ?auto_67424 ?auto_67421 ) ( AVAILABLE ?auto_67429 ) ( SURFACE-AT ?auto_67430 ?auto_67421 ) ( ON ?auto_67430 ?auto_67435 ) ( CLEAR ?auto_67430 ) ( not ( = ?auto_67418 ?auto_67435 ) ) ( not ( = ?auto_67419 ?auto_67435 ) ) ( not ( = ?auto_67423 ?auto_67435 ) ) ( not ( = ?auto_67434 ?auto_67435 ) ) ( not ( = ?auto_67428 ?auto_67435 ) ) ( not ( = ?auto_67430 ?auto_67435 ) ) ( not ( = ?auto_67420 ?auto_67435 ) ) ( not ( = ?auto_67433 ?auto_67435 ) ) )
    :subtasks
    ( ( !LIFT ?auto_67429 ?auto_67430 ?auto_67435 ?auto_67421 )
      ( MAKE-ON ?auto_67418 ?auto_67419 )
      ( MAKE-ON-VERIFY ?auto_67418 ?auto_67419 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_67436 - SURFACE
      ?auto_67437 - SURFACE
    )
    :vars
    (
      ?auto_67444 - HOIST
      ?auto_67443 - PLACE
      ?auto_67449 - PLACE
      ?auto_67451 - HOIST
      ?auto_67453 - SURFACE
      ?auto_67448 - SURFACE
      ?auto_67442 - PLACE
      ?auto_67446 - HOIST
      ?auto_67445 - SURFACE
      ?auto_67441 - SURFACE
      ?auto_67452 - PLACE
      ?auto_67438 - HOIST
      ?auto_67439 - SURFACE
      ?auto_67440 - SURFACE
      ?auto_67450 - SURFACE
      ?auto_67447 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_67444 ?auto_67443 ) ( IS-CRATE ?auto_67436 ) ( not ( = ?auto_67436 ?auto_67437 ) ) ( not ( = ?auto_67449 ?auto_67443 ) ) ( HOIST-AT ?auto_67451 ?auto_67449 ) ( not ( = ?auto_67444 ?auto_67451 ) ) ( AVAILABLE ?auto_67451 ) ( SURFACE-AT ?auto_67436 ?auto_67449 ) ( ON ?auto_67436 ?auto_67453 ) ( CLEAR ?auto_67436 ) ( not ( = ?auto_67436 ?auto_67453 ) ) ( not ( = ?auto_67437 ?auto_67453 ) ) ( IS-CRATE ?auto_67437 ) ( not ( = ?auto_67436 ?auto_67448 ) ) ( not ( = ?auto_67437 ?auto_67448 ) ) ( not ( = ?auto_67453 ?auto_67448 ) ) ( not ( = ?auto_67442 ?auto_67443 ) ) ( not ( = ?auto_67449 ?auto_67442 ) ) ( HOIST-AT ?auto_67446 ?auto_67442 ) ( not ( = ?auto_67444 ?auto_67446 ) ) ( not ( = ?auto_67451 ?auto_67446 ) ) ( AVAILABLE ?auto_67446 ) ( SURFACE-AT ?auto_67437 ?auto_67442 ) ( ON ?auto_67437 ?auto_67445 ) ( CLEAR ?auto_67437 ) ( not ( = ?auto_67436 ?auto_67445 ) ) ( not ( = ?auto_67437 ?auto_67445 ) ) ( not ( = ?auto_67453 ?auto_67445 ) ) ( not ( = ?auto_67448 ?auto_67445 ) ) ( IS-CRATE ?auto_67448 ) ( not ( = ?auto_67436 ?auto_67441 ) ) ( not ( = ?auto_67437 ?auto_67441 ) ) ( not ( = ?auto_67453 ?auto_67441 ) ) ( not ( = ?auto_67448 ?auto_67441 ) ) ( not ( = ?auto_67445 ?auto_67441 ) ) ( not ( = ?auto_67452 ?auto_67443 ) ) ( not ( = ?auto_67449 ?auto_67452 ) ) ( not ( = ?auto_67442 ?auto_67452 ) ) ( HOIST-AT ?auto_67438 ?auto_67452 ) ( not ( = ?auto_67444 ?auto_67438 ) ) ( not ( = ?auto_67451 ?auto_67438 ) ) ( not ( = ?auto_67446 ?auto_67438 ) ) ( SURFACE-AT ?auto_67448 ?auto_67452 ) ( ON ?auto_67448 ?auto_67439 ) ( CLEAR ?auto_67448 ) ( not ( = ?auto_67436 ?auto_67439 ) ) ( not ( = ?auto_67437 ?auto_67439 ) ) ( not ( = ?auto_67453 ?auto_67439 ) ) ( not ( = ?auto_67448 ?auto_67439 ) ) ( not ( = ?auto_67445 ?auto_67439 ) ) ( not ( = ?auto_67441 ?auto_67439 ) ) ( SURFACE-AT ?auto_67440 ?auto_67443 ) ( CLEAR ?auto_67440 ) ( IS-CRATE ?auto_67441 ) ( not ( = ?auto_67436 ?auto_67440 ) ) ( not ( = ?auto_67437 ?auto_67440 ) ) ( not ( = ?auto_67453 ?auto_67440 ) ) ( not ( = ?auto_67448 ?auto_67440 ) ) ( not ( = ?auto_67445 ?auto_67440 ) ) ( not ( = ?auto_67441 ?auto_67440 ) ) ( not ( = ?auto_67439 ?auto_67440 ) ) ( AVAILABLE ?auto_67444 ) ( AVAILABLE ?auto_67438 ) ( SURFACE-AT ?auto_67441 ?auto_67452 ) ( ON ?auto_67441 ?auto_67450 ) ( CLEAR ?auto_67441 ) ( not ( = ?auto_67436 ?auto_67450 ) ) ( not ( = ?auto_67437 ?auto_67450 ) ) ( not ( = ?auto_67453 ?auto_67450 ) ) ( not ( = ?auto_67448 ?auto_67450 ) ) ( not ( = ?auto_67445 ?auto_67450 ) ) ( not ( = ?auto_67441 ?auto_67450 ) ) ( not ( = ?auto_67439 ?auto_67450 ) ) ( not ( = ?auto_67440 ?auto_67450 ) ) ( TRUCK-AT ?auto_67447 ?auto_67443 ) )
    :subtasks
    ( ( !DRIVE ?auto_67447 ?auto_67443 ?auto_67452 )
      ( MAKE-ON ?auto_67436 ?auto_67437 )
      ( MAKE-ON-VERIFY ?auto_67436 ?auto_67437 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_67454 - SURFACE
      ?auto_67455 - SURFACE
    )
    :vars
    (
      ?auto_67469 - HOIST
      ?auto_67456 - PLACE
      ?auto_67467 - PLACE
      ?auto_67458 - HOIST
      ?auto_67463 - SURFACE
      ?auto_67457 - SURFACE
      ?auto_67471 - PLACE
      ?auto_67470 - HOIST
      ?auto_67460 - SURFACE
      ?auto_67461 - SURFACE
      ?auto_67466 - PLACE
      ?auto_67462 - HOIST
      ?auto_67459 - SURFACE
      ?auto_67464 - SURFACE
      ?auto_67468 - SURFACE
      ?auto_67465 - TRUCK
      ?auto_67472 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_67469 ?auto_67456 ) ( IS-CRATE ?auto_67454 ) ( not ( = ?auto_67454 ?auto_67455 ) ) ( not ( = ?auto_67467 ?auto_67456 ) ) ( HOIST-AT ?auto_67458 ?auto_67467 ) ( not ( = ?auto_67469 ?auto_67458 ) ) ( AVAILABLE ?auto_67458 ) ( SURFACE-AT ?auto_67454 ?auto_67467 ) ( ON ?auto_67454 ?auto_67463 ) ( CLEAR ?auto_67454 ) ( not ( = ?auto_67454 ?auto_67463 ) ) ( not ( = ?auto_67455 ?auto_67463 ) ) ( IS-CRATE ?auto_67455 ) ( not ( = ?auto_67454 ?auto_67457 ) ) ( not ( = ?auto_67455 ?auto_67457 ) ) ( not ( = ?auto_67463 ?auto_67457 ) ) ( not ( = ?auto_67471 ?auto_67456 ) ) ( not ( = ?auto_67467 ?auto_67471 ) ) ( HOIST-AT ?auto_67470 ?auto_67471 ) ( not ( = ?auto_67469 ?auto_67470 ) ) ( not ( = ?auto_67458 ?auto_67470 ) ) ( AVAILABLE ?auto_67470 ) ( SURFACE-AT ?auto_67455 ?auto_67471 ) ( ON ?auto_67455 ?auto_67460 ) ( CLEAR ?auto_67455 ) ( not ( = ?auto_67454 ?auto_67460 ) ) ( not ( = ?auto_67455 ?auto_67460 ) ) ( not ( = ?auto_67463 ?auto_67460 ) ) ( not ( = ?auto_67457 ?auto_67460 ) ) ( IS-CRATE ?auto_67457 ) ( not ( = ?auto_67454 ?auto_67461 ) ) ( not ( = ?auto_67455 ?auto_67461 ) ) ( not ( = ?auto_67463 ?auto_67461 ) ) ( not ( = ?auto_67457 ?auto_67461 ) ) ( not ( = ?auto_67460 ?auto_67461 ) ) ( not ( = ?auto_67466 ?auto_67456 ) ) ( not ( = ?auto_67467 ?auto_67466 ) ) ( not ( = ?auto_67471 ?auto_67466 ) ) ( HOIST-AT ?auto_67462 ?auto_67466 ) ( not ( = ?auto_67469 ?auto_67462 ) ) ( not ( = ?auto_67458 ?auto_67462 ) ) ( not ( = ?auto_67470 ?auto_67462 ) ) ( SURFACE-AT ?auto_67457 ?auto_67466 ) ( ON ?auto_67457 ?auto_67459 ) ( CLEAR ?auto_67457 ) ( not ( = ?auto_67454 ?auto_67459 ) ) ( not ( = ?auto_67455 ?auto_67459 ) ) ( not ( = ?auto_67463 ?auto_67459 ) ) ( not ( = ?auto_67457 ?auto_67459 ) ) ( not ( = ?auto_67460 ?auto_67459 ) ) ( not ( = ?auto_67461 ?auto_67459 ) ) ( IS-CRATE ?auto_67461 ) ( not ( = ?auto_67454 ?auto_67464 ) ) ( not ( = ?auto_67455 ?auto_67464 ) ) ( not ( = ?auto_67463 ?auto_67464 ) ) ( not ( = ?auto_67457 ?auto_67464 ) ) ( not ( = ?auto_67460 ?auto_67464 ) ) ( not ( = ?auto_67461 ?auto_67464 ) ) ( not ( = ?auto_67459 ?auto_67464 ) ) ( AVAILABLE ?auto_67462 ) ( SURFACE-AT ?auto_67461 ?auto_67466 ) ( ON ?auto_67461 ?auto_67468 ) ( CLEAR ?auto_67461 ) ( not ( = ?auto_67454 ?auto_67468 ) ) ( not ( = ?auto_67455 ?auto_67468 ) ) ( not ( = ?auto_67463 ?auto_67468 ) ) ( not ( = ?auto_67457 ?auto_67468 ) ) ( not ( = ?auto_67460 ?auto_67468 ) ) ( not ( = ?auto_67461 ?auto_67468 ) ) ( not ( = ?auto_67459 ?auto_67468 ) ) ( not ( = ?auto_67464 ?auto_67468 ) ) ( TRUCK-AT ?auto_67465 ?auto_67456 ) ( SURFACE-AT ?auto_67472 ?auto_67456 ) ( CLEAR ?auto_67472 ) ( LIFTING ?auto_67469 ?auto_67464 ) ( IS-CRATE ?auto_67464 ) ( not ( = ?auto_67454 ?auto_67472 ) ) ( not ( = ?auto_67455 ?auto_67472 ) ) ( not ( = ?auto_67463 ?auto_67472 ) ) ( not ( = ?auto_67457 ?auto_67472 ) ) ( not ( = ?auto_67460 ?auto_67472 ) ) ( not ( = ?auto_67461 ?auto_67472 ) ) ( not ( = ?auto_67459 ?auto_67472 ) ) ( not ( = ?auto_67464 ?auto_67472 ) ) ( not ( = ?auto_67468 ?auto_67472 ) ) )
    :subtasks
    ( ( !DROP ?auto_67469 ?auto_67464 ?auto_67472 ?auto_67456 )
      ( MAKE-ON ?auto_67454 ?auto_67455 )
      ( MAKE-ON-VERIFY ?auto_67454 ?auto_67455 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_67473 - SURFACE
      ?auto_67474 - SURFACE
    )
    :vars
    (
      ?auto_67483 - HOIST
      ?auto_67488 - PLACE
      ?auto_67481 - PLACE
      ?auto_67479 - HOIST
      ?auto_67480 - SURFACE
      ?auto_67475 - SURFACE
      ?auto_67490 - PLACE
      ?auto_67486 - HOIST
      ?auto_67477 - SURFACE
      ?auto_67476 - SURFACE
      ?auto_67482 - PLACE
      ?auto_67491 - HOIST
      ?auto_67478 - SURFACE
      ?auto_67487 - SURFACE
      ?auto_67484 - SURFACE
      ?auto_67485 - TRUCK
      ?auto_67489 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_67483 ?auto_67488 ) ( IS-CRATE ?auto_67473 ) ( not ( = ?auto_67473 ?auto_67474 ) ) ( not ( = ?auto_67481 ?auto_67488 ) ) ( HOIST-AT ?auto_67479 ?auto_67481 ) ( not ( = ?auto_67483 ?auto_67479 ) ) ( AVAILABLE ?auto_67479 ) ( SURFACE-AT ?auto_67473 ?auto_67481 ) ( ON ?auto_67473 ?auto_67480 ) ( CLEAR ?auto_67473 ) ( not ( = ?auto_67473 ?auto_67480 ) ) ( not ( = ?auto_67474 ?auto_67480 ) ) ( IS-CRATE ?auto_67474 ) ( not ( = ?auto_67473 ?auto_67475 ) ) ( not ( = ?auto_67474 ?auto_67475 ) ) ( not ( = ?auto_67480 ?auto_67475 ) ) ( not ( = ?auto_67490 ?auto_67488 ) ) ( not ( = ?auto_67481 ?auto_67490 ) ) ( HOIST-AT ?auto_67486 ?auto_67490 ) ( not ( = ?auto_67483 ?auto_67486 ) ) ( not ( = ?auto_67479 ?auto_67486 ) ) ( AVAILABLE ?auto_67486 ) ( SURFACE-AT ?auto_67474 ?auto_67490 ) ( ON ?auto_67474 ?auto_67477 ) ( CLEAR ?auto_67474 ) ( not ( = ?auto_67473 ?auto_67477 ) ) ( not ( = ?auto_67474 ?auto_67477 ) ) ( not ( = ?auto_67480 ?auto_67477 ) ) ( not ( = ?auto_67475 ?auto_67477 ) ) ( IS-CRATE ?auto_67475 ) ( not ( = ?auto_67473 ?auto_67476 ) ) ( not ( = ?auto_67474 ?auto_67476 ) ) ( not ( = ?auto_67480 ?auto_67476 ) ) ( not ( = ?auto_67475 ?auto_67476 ) ) ( not ( = ?auto_67477 ?auto_67476 ) ) ( not ( = ?auto_67482 ?auto_67488 ) ) ( not ( = ?auto_67481 ?auto_67482 ) ) ( not ( = ?auto_67490 ?auto_67482 ) ) ( HOIST-AT ?auto_67491 ?auto_67482 ) ( not ( = ?auto_67483 ?auto_67491 ) ) ( not ( = ?auto_67479 ?auto_67491 ) ) ( not ( = ?auto_67486 ?auto_67491 ) ) ( SURFACE-AT ?auto_67475 ?auto_67482 ) ( ON ?auto_67475 ?auto_67478 ) ( CLEAR ?auto_67475 ) ( not ( = ?auto_67473 ?auto_67478 ) ) ( not ( = ?auto_67474 ?auto_67478 ) ) ( not ( = ?auto_67480 ?auto_67478 ) ) ( not ( = ?auto_67475 ?auto_67478 ) ) ( not ( = ?auto_67477 ?auto_67478 ) ) ( not ( = ?auto_67476 ?auto_67478 ) ) ( IS-CRATE ?auto_67476 ) ( not ( = ?auto_67473 ?auto_67487 ) ) ( not ( = ?auto_67474 ?auto_67487 ) ) ( not ( = ?auto_67480 ?auto_67487 ) ) ( not ( = ?auto_67475 ?auto_67487 ) ) ( not ( = ?auto_67477 ?auto_67487 ) ) ( not ( = ?auto_67476 ?auto_67487 ) ) ( not ( = ?auto_67478 ?auto_67487 ) ) ( AVAILABLE ?auto_67491 ) ( SURFACE-AT ?auto_67476 ?auto_67482 ) ( ON ?auto_67476 ?auto_67484 ) ( CLEAR ?auto_67476 ) ( not ( = ?auto_67473 ?auto_67484 ) ) ( not ( = ?auto_67474 ?auto_67484 ) ) ( not ( = ?auto_67480 ?auto_67484 ) ) ( not ( = ?auto_67475 ?auto_67484 ) ) ( not ( = ?auto_67477 ?auto_67484 ) ) ( not ( = ?auto_67476 ?auto_67484 ) ) ( not ( = ?auto_67478 ?auto_67484 ) ) ( not ( = ?auto_67487 ?auto_67484 ) ) ( TRUCK-AT ?auto_67485 ?auto_67488 ) ( SURFACE-AT ?auto_67489 ?auto_67488 ) ( CLEAR ?auto_67489 ) ( IS-CRATE ?auto_67487 ) ( not ( = ?auto_67473 ?auto_67489 ) ) ( not ( = ?auto_67474 ?auto_67489 ) ) ( not ( = ?auto_67480 ?auto_67489 ) ) ( not ( = ?auto_67475 ?auto_67489 ) ) ( not ( = ?auto_67477 ?auto_67489 ) ) ( not ( = ?auto_67476 ?auto_67489 ) ) ( not ( = ?auto_67478 ?auto_67489 ) ) ( not ( = ?auto_67487 ?auto_67489 ) ) ( not ( = ?auto_67484 ?auto_67489 ) ) ( AVAILABLE ?auto_67483 ) ( IN ?auto_67487 ?auto_67485 ) )
    :subtasks
    ( ( !UNLOAD ?auto_67483 ?auto_67487 ?auto_67485 ?auto_67488 )
      ( MAKE-ON ?auto_67473 ?auto_67474 )
      ( MAKE-ON-VERIFY ?auto_67473 ?auto_67474 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_67492 - SURFACE
      ?auto_67493 - SURFACE
    )
    :vars
    (
      ?auto_67497 - HOIST
      ?auto_67507 - PLACE
      ?auto_67500 - PLACE
      ?auto_67499 - HOIST
      ?auto_67502 - SURFACE
      ?auto_67510 - SURFACE
      ?auto_67495 - PLACE
      ?auto_67498 - HOIST
      ?auto_67501 - SURFACE
      ?auto_67508 - SURFACE
      ?auto_67509 - PLACE
      ?auto_67504 - HOIST
      ?auto_67506 - SURFACE
      ?auto_67496 - SURFACE
      ?auto_67505 - SURFACE
      ?auto_67494 - SURFACE
      ?auto_67503 - TRUCK
      ?auto_67511 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_67497 ?auto_67507 ) ( IS-CRATE ?auto_67492 ) ( not ( = ?auto_67492 ?auto_67493 ) ) ( not ( = ?auto_67500 ?auto_67507 ) ) ( HOIST-AT ?auto_67499 ?auto_67500 ) ( not ( = ?auto_67497 ?auto_67499 ) ) ( AVAILABLE ?auto_67499 ) ( SURFACE-AT ?auto_67492 ?auto_67500 ) ( ON ?auto_67492 ?auto_67502 ) ( CLEAR ?auto_67492 ) ( not ( = ?auto_67492 ?auto_67502 ) ) ( not ( = ?auto_67493 ?auto_67502 ) ) ( IS-CRATE ?auto_67493 ) ( not ( = ?auto_67492 ?auto_67510 ) ) ( not ( = ?auto_67493 ?auto_67510 ) ) ( not ( = ?auto_67502 ?auto_67510 ) ) ( not ( = ?auto_67495 ?auto_67507 ) ) ( not ( = ?auto_67500 ?auto_67495 ) ) ( HOIST-AT ?auto_67498 ?auto_67495 ) ( not ( = ?auto_67497 ?auto_67498 ) ) ( not ( = ?auto_67499 ?auto_67498 ) ) ( AVAILABLE ?auto_67498 ) ( SURFACE-AT ?auto_67493 ?auto_67495 ) ( ON ?auto_67493 ?auto_67501 ) ( CLEAR ?auto_67493 ) ( not ( = ?auto_67492 ?auto_67501 ) ) ( not ( = ?auto_67493 ?auto_67501 ) ) ( not ( = ?auto_67502 ?auto_67501 ) ) ( not ( = ?auto_67510 ?auto_67501 ) ) ( IS-CRATE ?auto_67510 ) ( not ( = ?auto_67492 ?auto_67508 ) ) ( not ( = ?auto_67493 ?auto_67508 ) ) ( not ( = ?auto_67502 ?auto_67508 ) ) ( not ( = ?auto_67510 ?auto_67508 ) ) ( not ( = ?auto_67501 ?auto_67508 ) ) ( not ( = ?auto_67509 ?auto_67507 ) ) ( not ( = ?auto_67500 ?auto_67509 ) ) ( not ( = ?auto_67495 ?auto_67509 ) ) ( HOIST-AT ?auto_67504 ?auto_67509 ) ( not ( = ?auto_67497 ?auto_67504 ) ) ( not ( = ?auto_67499 ?auto_67504 ) ) ( not ( = ?auto_67498 ?auto_67504 ) ) ( SURFACE-AT ?auto_67510 ?auto_67509 ) ( ON ?auto_67510 ?auto_67506 ) ( CLEAR ?auto_67510 ) ( not ( = ?auto_67492 ?auto_67506 ) ) ( not ( = ?auto_67493 ?auto_67506 ) ) ( not ( = ?auto_67502 ?auto_67506 ) ) ( not ( = ?auto_67510 ?auto_67506 ) ) ( not ( = ?auto_67501 ?auto_67506 ) ) ( not ( = ?auto_67508 ?auto_67506 ) ) ( IS-CRATE ?auto_67508 ) ( not ( = ?auto_67492 ?auto_67496 ) ) ( not ( = ?auto_67493 ?auto_67496 ) ) ( not ( = ?auto_67502 ?auto_67496 ) ) ( not ( = ?auto_67510 ?auto_67496 ) ) ( not ( = ?auto_67501 ?auto_67496 ) ) ( not ( = ?auto_67508 ?auto_67496 ) ) ( not ( = ?auto_67506 ?auto_67496 ) ) ( AVAILABLE ?auto_67504 ) ( SURFACE-AT ?auto_67508 ?auto_67509 ) ( ON ?auto_67508 ?auto_67505 ) ( CLEAR ?auto_67508 ) ( not ( = ?auto_67492 ?auto_67505 ) ) ( not ( = ?auto_67493 ?auto_67505 ) ) ( not ( = ?auto_67502 ?auto_67505 ) ) ( not ( = ?auto_67510 ?auto_67505 ) ) ( not ( = ?auto_67501 ?auto_67505 ) ) ( not ( = ?auto_67508 ?auto_67505 ) ) ( not ( = ?auto_67506 ?auto_67505 ) ) ( not ( = ?auto_67496 ?auto_67505 ) ) ( SURFACE-AT ?auto_67494 ?auto_67507 ) ( CLEAR ?auto_67494 ) ( IS-CRATE ?auto_67496 ) ( not ( = ?auto_67492 ?auto_67494 ) ) ( not ( = ?auto_67493 ?auto_67494 ) ) ( not ( = ?auto_67502 ?auto_67494 ) ) ( not ( = ?auto_67510 ?auto_67494 ) ) ( not ( = ?auto_67501 ?auto_67494 ) ) ( not ( = ?auto_67508 ?auto_67494 ) ) ( not ( = ?auto_67506 ?auto_67494 ) ) ( not ( = ?auto_67496 ?auto_67494 ) ) ( not ( = ?auto_67505 ?auto_67494 ) ) ( AVAILABLE ?auto_67497 ) ( IN ?auto_67496 ?auto_67503 ) ( TRUCK-AT ?auto_67503 ?auto_67511 ) ( not ( = ?auto_67511 ?auto_67507 ) ) ( not ( = ?auto_67500 ?auto_67511 ) ) ( not ( = ?auto_67495 ?auto_67511 ) ) ( not ( = ?auto_67509 ?auto_67511 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_67503 ?auto_67511 ?auto_67507 )
      ( MAKE-ON ?auto_67492 ?auto_67493 )
      ( MAKE-ON-VERIFY ?auto_67492 ?auto_67493 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_67512 - SURFACE
      ?auto_67513 - SURFACE
    )
    :vars
    (
      ?auto_67524 - HOIST
      ?auto_67520 - PLACE
      ?auto_67530 - PLACE
      ?auto_67525 - HOIST
      ?auto_67521 - SURFACE
      ?auto_67522 - SURFACE
      ?auto_67514 - PLACE
      ?auto_67523 - HOIST
      ?auto_67528 - SURFACE
      ?auto_67529 - SURFACE
      ?auto_67526 - PLACE
      ?auto_67516 - HOIST
      ?auto_67517 - SURFACE
      ?auto_67519 - SURFACE
      ?auto_67515 - SURFACE
      ?auto_67527 - SURFACE
      ?auto_67518 - TRUCK
      ?auto_67531 - PLACE
      ?auto_67532 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_67524 ?auto_67520 ) ( IS-CRATE ?auto_67512 ) ( not ( = ?auto_67512 ?auto_67513 ) ) ( not ( = ?auto_67530 ?auto_67520 ) ) ( HOIST-AT ?auto_67525 ?auto_67530 ) ( not ( = ?auto_67524 ?auto_67525 ) ) ( AVAILABLE ?auto_67525 ) ( SURFACE-AT ?auto_67512 ?auto_67530 ) ( ON ?auto_67512 ?auto_67521 ) ( CLEAR ?auto_67512 ) ( not ( = ?auto_67512 ?auto_67521 ) ) ( not ( = ?auto_67513 ?auto_67521 ) ) ( IS-CRATE ?auto_67513 ) ( not ( = ?auto_67512 ?auto_67522 ) ) ( not ( = ?auto_67513 ?auto_67522 ) ) ( not ( = ?auto_67521 ?auto_67522 ) ) ( not ( = ?auto_67514 ?auto_67520 ) ) ( not ( = ?auto_67530 ?auto_67514 ) ) ( HOIST-AT ?auto_67523 ?auto_67514 ) ( not ( = ?auto_67524 ?auto_67523 ) ) ( not ( = ?auto_67525 ?auto_67523 ) ) ( AVAILABLE ?auto_67523 ) ( SURFACE-AT ?auto_67513 ?auto_67514 ) ( ON ?auto_67513 ?auto_67528 ) ( CLEAR ?auto_67513 ) ( not ( = ?auto_67512 ?auto_67528 ) ) ( not ( = ?auto_67513 ?auto_67528 ) ) ( not ( = ?auto_67521 ?auto_67528 ) ) ( not ( = ?auto_67522 ?auto_67528 ) ) ( IS-CRATE ?auto_67522 ) ( not ( = ?auto_67512 ?auto_67529 ) ) ( not ( = ?auto_67513 ?auto_67529 ) ) ( not ( = ?auto_67521 ?auto_67529 ) ) ( not ( = ?auto_67522 ?auto_67529 ) ) ( not ( = ?auto_67528 ?auto_67529 ) ) ( not ( = ?auto_67526 ?auto_67520 ) ) ( not ( = ?auto_67530 ?auto_67526 ) ) ( not ( = ?auto_67514 ?auto_67526 ) ) ( HOIST-AT ?auto_67516 ?auto_67526 ) ( not ( = ?auto_67524 ?auto_67516 ) ) ( not ( = ?auto_67525 ?auto_67516 ) ) ( not ( = ?auto_67523 ?auto_67516 ) ) ( SURFACE-AT ?auto_67522 ?auto_67526 ) ( ON ?auto_67522 ?auto_67517 ) ( CLEAR ?auto_67522 ) ( not ( = ?auto_67512 ?auto_67517 ) ) ( not ( = ?auto_67513 ?auto_67517 ) ) ( not ( = ?auto_67521 ?auto_67517 ) ) ( not ( = ?auto_67522 ?auto_67517 ) ) ( not ( = ?auto_67528 ?auto_67517 ) ) ( not ( = ?auto_67529 ?auto_67517 ) ) ( IS-CRATE ?auto_67529 ) ( not ( = ?auto_67512 ?auto_67519 ) ) ( not ( = ?auto_67513 ?auto_67519 ) ) ( not ( = ?auto_67521 ?auto_67519 ) ) ( not ( = ?auto_67522 ?auto_67519 ) ) ( not ( = ?auto_67528 ?auto_67519 ) ) ( not ( = ?auto_67529 ?auto_67519 ) ) ( not ( = ?auto_67517 ?auto_67519 ) ) ( AVAILABLE ?auto_67516 ) ( SURFACE-AT ?auto_67529 ?auto_67526 ) ( ON ?auto_67529 ?auto_67515 ) ( CLEAR ?auto_67529 ) ( not ( = ?auto_67512 ?auto_67515 ) ) ( not ( = ?auto_67513 ?auto_67515 ) ) ( not ( = ?auto_67521 ?auto_67515 ) ) ( not ( = ?auto_67522 ?auto_67515 ) ) ( not ( = ?auto_67528 ?auto_67515 ) ) ( not ( = ?auto_67529 ?auto_67515 ) ) ( not ( = ?auto_67517 ?auto_67515 ) ) ( not ( = ?auto_67519 ?auto_67515 ) ) ( SURFACE-AT ?auto_67527 ?auto_67520 ) ( CLEAR ?auto_67527 ) ( IS-CRATE ?auto_67519 ) ( not ( = ?auto_67512 ?auto_67527 ) ) ( not ( = ?auto_67513 ?auto_67527 ) ) ( not ( = ?auto_67521 ?auto_67527 ) ) ( not ( = ?auto_67522 ?auto_67527 ) ) ( not ( = ?auto_67528 ?auto_67527 ) ) ( not ( = ?auto_67529 ?auto_67527 ) ) ( not ( = ?auto_67517 ?auto_67527 ) ) ( not ( = ?auto_67519 ?auto_67527 ) ) ( not ( = ?auto_67515 ?auto_67527 ) ) ( AVAILABLE ?auto_67524 ) ( TRUCK-AT ?auto_67518 ?auto_67531 ) ( not ( = ?auto_67531 ?auto_67520 ) ) ( not ( = ?auto_67530 ?auto_67531 ) ) ( not ( = ?auto_67514 ?auto_67531 ) ) ( not ( = ?auto_67526 ?auto_67531 ) ) ( HOIST-AT ?auto_67532 ?auto_67531 ) ( LIFTING ?auto_67532 ?auto_67519 ) ( not ( = ?auto_67524 ?auto_67532 ) ) ( not ( = ?auto_67525 ?auto_67532 ) ) ( not ( = ?auto_67523 ?auto_67532 ) ) ( not ( = ?auto_67516 ?auto_67532 ) ) )
    :subtasks
    ( ( !LOAD ?auto_67532 ?auto_67519 ?auto_67518 ?auto_67531 )
      ( MAKE-ON ?auto_67512 ?auto_67513 )
      ( MAKE-ON-VERIFY ?auto_67512 ?auto_67513 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_67533 - SURFACE
      ?auto_67534 - SURFACE
    )
    :vars
    (
      ?auto_67546 - HOIST
      ?auto_67545 - PLACE
      ?auto_67540 - PLACE
      ?auto_67541 - HOIST
      ?auto_67551 - SURFACE
      ?auto_67547 - SURFACE
      ?auto_67544 - PLACE
      ?auto_67553 - HOIST
      ?auto_67550 - SURFACE
      ?auto_67549 - SURFACE
      ?auto_67535 - PLACE
      ?auto_67536 - HOIST
      ?auto_67537 - SURFACE
      ?auto_67542 - SURFACE
      ?auto_67543 - SURFACE
      ?auto_67552 - SURFACE
      ?auto_67539 - TRUCK
      ?auto_67538 - PLACE
      ?auto_67548 - HOIST
      ?auto_67554 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_67546 ?auto_67545 ) ( IS-CRATE ?auto_67533 ) ( not ( = ?auto_67533 ?auto_67534 ) ) ( not ( = ?auto_67540 ?auto_67545 ) ) ( HOIST-AT ?auto_67541 ?auto_67540 ) ( not ( = ?auto_67546 ?auto_67541 ) ) ( AVAILABLE ?auto_67541 ) ( SURFACE-AT ?auto_67533 ?auto_67540 ) ( ON ?auto_67533 ?auto_67551 ) ( CLEAR ?auto_67533 ) ( not ( = ?auto_67533 ?auto_67551 ) ) ( not ( = ?auto_67534 ?auto_67551 ) ) ( IS-CRATE ?auto_67534 ) ( not ( = ?auto_67533 ?auto_67547 ) ) ( not ( = ?auto_67534 ?auto_67547 ) ) ( not ( = ?auto_67551 ?auto_67547 ) ) ( not ( = ?auto_67544 ?auto_67545 ) ) ( not ( = ?auto_67540 ?auto_67544 ) ) ( HOIST-AT ?auto_67553 ?auto_67544 ) ( not ( = ?auto_67546 ?auto_67553 ) ) ( not ( = ?auto_67541 ?auto_67553 ) ) ( AVAILABLE ?auto_67553 ) ( SURFACE-AT ?auto_67534 ?auto_67544 ) ( ON ?auto_67534 ?auto_67550 ) ( CLEAR ?auto_67534 ) ( not ( = ?auto_67533 ?auto_67550 ) ) ( not ( = ?auto_67534 ?auto_67550 ) ) ( not ( = ?auto_67551 ?auto_67550 ) ) ( not ( = ?auto_67547 ?auto_67550 ) ) ( IS-CRATE ?auto_67547 ) ( not ( = ?auto_67533 ?auto_67549 ) ) ( not ( = ?auto_67534 ?auto_67549 ) ) ( not ( = ?auto_67551 ?auto_67549 ) ) ( not ( = ?auto_67547 ?auto_67549 ) ) ( not ( = ?auto_67550 ?auto_67549 ) ) ( not ( = ?auto_67535 ?auto_67545 ) ) ( not ( = ?auto_67540 ?auto_67535 ) ) ( not ( = ?auto_67544 ?auto_67535 ) ) ( HOIST-AT ?auto_67536 ?auto_67535 ) ( not ( = ?auto_67546 ?auto_67536 ) ) ( not ( = ?auto_67541 ?auto_67536 ) ) ( not ( = ?auto_67553 ?auto_67536 ) ) ( SURFACE-AT ?auto_67547 ?auto_67535 ) ( ON ?auto_67547 ?auto_67537 ) ( CLEAR ?auto_67547 ) ( not ( = ?auto_67533 ?auto_67537 ) ) ( not ( = ?auto_67534 ?auto_67537 ) ) ( not ( = ?auto_67551 ?auto_67537 ) ) ( not ( = ?auto_67547 ?auto_67537 ) ) ( not ( = ?auto_67550 ?auto_67537 ) ) ( not ( = ?auto_67549 ?auto_67537 ) ) ( IS-CRATE ?auto_67549 ) ( not ( = ?auto_67533 ?auto_67542 ) ) ( not ( = ?auto_67534 ?auto_67542 ) ) ( not ( = ?auto_67551 ?auto_67542 ) ) ( not ( = ?auto_67547 ?auto_67542 ) ) ( not ( = ?auto_67550 ?auto_67542 ) ) ( not ( = ?auto_67549 ?auto_67542 ) ) ( not ( = ?auto_67537 ?auto_67542 ) ) ( AVAILABLE ?auto_67536 ) ( SURFACE-AT ?auto_67549 ?auto_67535 ) ( ON ?auto_67549 ?auto_67543 ) ( CLEAR ?auto_67549 ) ( not ( = ?auto_67533 ?auto_67543 ) ) ( not ( = ?auto_67534 ?auto_67543 ) ) ( not ( = ?auto_67551 ?auto_67543 ) ) ( not ( = ?auto_67547 ?auto_67543 ) ) ( not ( = ?auto_67550 ?auto_67543 ) ) ( not ( = ?auto_67549 ?auto_67543 ) ) ( not ( = ?auto_67537 ?auto_67543 ) ) ( not ( = ?auto_67542 ?auto_67543 ) ) ( SURFACE-AT ?auto_67552 ?auto_67545 ) ( CLEAR ?auto_67552 ) ( IS-CRATE ?auto_67542 ) ( not ( = ?auto_67533 ?auto_67552 ) ) ( not ( = ?auto_67534 ?auto_67552 ) ) ( not ( = ?auto_67551 ?auto_67552 ) ) ( not ( = ?auto_67547 ?auto_67552 ) ) ( not ( = ?auto_67550 ?auto_67552 ) ) ( not ( = ?auto_67549 ?auto_67552 ) ) ( not ( = ?auto_67537 ?auto_67552 ) ) ( not ( = ?auto_67542 ?auto_67552 ) ) ( not ( = ?auto_67543 ?auto_67552 ) ) ( AVAILABLE ?auto_67546 ) ( TRUCK-AT ?auto_67539 ?auto_67538 ) ( not ( = ?auto_67538 ?auto_67545 ) ) ( not ( = ?auto_67540 ?auto_67538 ) ) ( not ( = ?auto_67544 ?auto_67538 ) ) ( not ( = ?auto_67535 ?auto_67538 ) ) ( HOIST-AT ?auto_67548 ?auto_67538 ) ( not ( = ?auto_67546 ?auto_67548 ) ) ( not ( = ?auto_67541 ?auto_67548 ) ) ( not ( = ?auto_67553 ?auto_67548 ) ) ( not ( = ?auto_67536 ?auto_67548 ) ) ( AVAILABLE ?auto_67548 ) ( SURFACE-AT ?auto_67542 ?auto_67538 ) ( ON ?auto_67542 ?auto_67554 ) ( CLEAR ?auto_67542 ) ( not ( = ?auto_67533 ?auto_67554 ) ) ( not ( = ?auto_67534 ?auto_67554 ) ) ( not ( = ?auto_67551 ?auto_67554 ) ) ( not ( = ?auto_67547 ?auto_67554 ) ) ( not ( = ?auto_67550 ?auto_67554 ) ) ( not ( = ?auto_67549 ?auto_67554 ) ) ( not ( = ?auto_67537 ?auto_67554 ) ) ( not ( = ?auto_67542 ?auto_67554 ) ) ( not ( = ?auto_67543 ?auto_67554 ) ) ( not ( = ?auto_67552 ?auto_67554 ) ) )
    :subtasks
    ( ( !LIFT ?auto_67548 ?auto_67542 ?auto_67554 ?auto_67538 )
      ( MAKE-ON ?auto_67533 ?auto_67534 )
      ( MAKE-ON-VERIFY ?auto_67533 ?auto_67534 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_67555 - SURFACE
      ?auto_67556 - SURFACE
    )
    :vars
    (
      ?auto_67561 - HOIST
      ?auto_67574 - PLACE
      ?auto_67567 - PLACE
      ?auto_67573 - HOIST
      ?auto_67576 - SURFACE
      ?auto_67565 - SURFACE
      ?auto_67563 - PLACE
      ?auto_67571 - HOIST
      ?auto_67562 - SURFACE
      ?auto_67559 - SURFACE
      ?auto_67570 - PLACE
      ?auto_67568 - HOIST
      ?auto_67557 - SURFACE
      ?auto_67558 - SURFACE
      ?auto_67569 - SURFACE
      ?auto_67575 - SURFACE
      ?auto_67564 - PLACE
      ?auto_67566 - HOIST
      ?auto_67572 - SURFACE
      ?auto_67560 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_67561 ?auto_67574 ) ( IS-CRATE ?auto_67555 ) ( not ( = ?auto_67555 ?auto_67556 ) ) ( not ( = ?auto_67567 ?auto_67574 ) ) ( HOIST-AT ?auto_67573 ?auto_67567 ) ( not ( = ?auto_67561 ?auto_67573 ) ) ( AVAILABLE ?auto_67573 ) ( SURFACE-AT ?auto_67555 ?auto_67567 ) ( ON ?auto_67555 ?auto_67576 ) ( CLEAR ?auto_67555 ) ( not ( = ?auto_67555 ?auto_67576 ) ) ( not ( = ?auto_67556 ?auto_67576 ) ) ( IS-CRATE ?auto_67556 ) ( not ( = ?auto_67555 ?auto_67565 ) ) ( not ( = ?auto_67556 ?auto_67565 ) ) ( not ( = ?auto_67576 ?auto_67565 ) ) ( not ( = ?auto_67563 ?auto_67574 ) ) ( not ( = ?auto_67567 ?auto_67563 ) ) ( HOIST-AT ?auto_67571 ?auto_67563 ) ( not ( = ?auto_67561 ?auto_67571 ) ) ( not ( = ?auto_67573 ?auto_67571 ) ) ( AVAILABLE ?auto_67571 ) ( SURFACE-AT ?auto_67556 ?auto_67563 ) ( ON ?auto_67556 ?auto_67562 ) ( CLEAR ?auto_67556 ) ( not ( = ?auto_67555 ?auto_67562 ) ) ( not ( = ?auto_67556 ?auto_67562 ) ) ( not ( = ?auto_67576 ?auto_67562 ) ) ( not ( = ?auto_67565 ?auto_67562 ) ) ( IS-CRATE ?auto_67565 ) ( not ( = ?auto_67555 ?auto_67559 ) ) ( not ( = ?auto_67556 ?auto_67559 ) ) ( not ( = ?auto_67576 ?auto_67559 ) ) ( not ( = ?auto_67565 ?auto_67559 ) ) ( not ( = ?auto_67562 ?auto_67559 ) ) ( not ( = ?auto_67570 ?auto_67574 ) ) ( not ( = ?auto_67567 ?auto_67570 ) ) ( not ( = ?auto_67563 ?auto_67570 ) ) ( HOIST-AT ?auto_67568 ?auto_67570 ) ( not ( = ?auto_67561 ?auto_67568 ) ) ( not ( = ?auto_67573 ?auto_67568 ) ) ( not ( = ?auto_67571 ?auto_67568 ) ) ( SURFACE-AT ?auto_67565 ?auto_67570 ) ( ON ?auto_67565 ?auto_67557 ) ( CLEAR ?auto_67565 ) ( not ( = ?auto_67555 ?auto_67557 ) ) ( not ( = ?auto_67556 ?auto_67557 ) ) ( not ( = ?auto_67576 ?auto_67557 ) ) ( not ( = ?auto_67565 ?auto_67557 ) ) ( not ( = ?auto_67562 ?auto_67557 ) ) ( not ( = ?auto_67559 ?auto_67557 ) ) ( IS-CRATE ?auto_67559 ) ( not ( = ?auto_67555 ?auto_67558 ) ) ( not ( = ?auto_67556 ?auto_67558 ) ) ( not ( = ?auto_67576 ?auto_67558 ) ) ( not ( = ?auto_67565 ?auto_67558 ) ) ( not ( = ?auto_67562 ?auto_67558 ) ) ( not ( = ?auto_67559 ?auto_67558 ) ) ( not ( = ?auto_67557 ?auto_67558 ) ) ( AVAILABLE ?auto_67568 ) ( SURFACE-AT ?auto_67559 ?auto_67570 ) ( ON ?auto_67559 ?auto_67569 ) ( CLEAR ?auto_67559 ) ( not ( = ?auto_67555 ?auto_67569 ) ) ( not ( = ?auto_67556 ?auto_67569 ) ) ( not ( = ?auto_67576 ?auto_67569 ) ) ( not ( = ?auto_67565 ?auto_67569 ) ) ( not ( = ?auto_67562 ?auto_67569 ) ) ( not ( = ?auto_67559 ?auto_67569 ) ) ( not ( = ?auto_67557 ?auto_67569 ) ) ( not ( = ?auto_67558 ?auto_67569 ) ) ( SURFACE-AT ?auto_67575 ?auto_67574 ) ( CLEAR ?auto_67575 ) ( IS-CRATE ?auto_67558 ) ( not ( = ?auto_67555 ?auto_67575 ) ) ( not ( = ?auto_67556 ?auto_67575 ) ) ( not ( = ?auto_67576 ?auto_67575 ) ) ( not ( = ?auto_67565 ?auto_67575 ) ) ( not ( = ?auto_67562 ?auto_67575 ) ) ( not ( = ?auto_67559 ?auto_67575 ) ) ( not ( = ?auto_67557 ?auto_67575 ) ) ( not ( = ?auto_67558 ?auto_67575 ) ) ( not ( = ?auto_67569 ?auto_67575 ) ) ( AVAILABLE ?auto_67561 ) ( not ( = ?auto_67564 ?auto_67574 ) ) ( not ( = ?auto_67567 ?auto_67564 ) ) ( not ( = ?auto_67563 ?auto_67564 ) ) ( not ( = ?auto_67570 ?auto_67564 ) ) ( HOIST-AT ?auto_67566 ?auto_67564 ) ( not ( = ?auto_67561 ?auto_67566 ) ) ( not ( = ?auto_67573 ?auto_67566 ) ) ( not ( = ?auto_67571 ?auto_67566 ) ) ( not ( = ?auto_67568 ?auto_67566 ) ) ( AVAILABLE ?auto_67566 ) ( SURFACE-AT ?auto_67558 ?auto_67564 ) ( ON ?auto_67558 ?auto_67572 ) ( CLEAR ?auto_67558 ) ( not ( = ?auto_67555 ?auto_67572 ) ) ( not ( = ?auto_67556 ?auto_67572 ) ) ( not ( = ?auto_67576 ?auto_67572 ) ) ( not ( = ?auto_67565 ?auto_67572 ) ) ( not ( = ?auto_67562 ?auto_67572 ) ) ( not ( = ?auto_67559 ?auto_67572 ) ) ( not ( = ?auto_67557 ?auto_67572 ) ) ( not ( = ?auto_67558 ?auto_67572 ) ) ( not ( = ?auto_67569 ?auto_67572 ) ) ( not ( = ?auto_67575 ?auto_67572 ) ) ( TRUCK-AT ?auto_67560 ?auto_67574 ) )
    :subtasks
    ( ( !DRIVE ?auto_67560 ?auto_67574 ?auto_67564 )
      ( MAKE-ON ?auto_67555 ?auto_67556 )
      ( MAKE-ON-VERIFY ?auto_67555 ?auto_67556 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_67577 - SURFACE
      ?auto_67578 - SURFACE
    )
    :vars
    (
      ?auto_67585 - HOIST
      ?auto_67589 - PLACE
      ?auto_67582 - PLACE
      ?auto_67588 - HOIST
      ?auto_67591 - SURFACE
      ?auto_67592 - SURFACE
      ?auto_67583 - PLACE
      ?auto_67597 - HOIST
      ?auto_67598 - SURFACE
      ?auto_67595 - SURFACE
      ?auto_67581 - PLACE
      ?auto_67584 - HOIST
      ?auto_67593 - SURFACE
      ?auto_67586 - SURFACE
      ?auto_67579 - SURFACE
      ?auto_67590 - SURFACE
      ?auto_67587 - PLACE
      ?auto_67594 - HOIST
      ?auto_67596 - SURFACE
      ?auto_67580 - TRUCK
      ?auto_67599 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_67585 ?auto_67589 ) ( IS-CRATE ?auto_67577 ) ( not ( = ?auto_67577 ?auto_67578 ) ) ( not ( = ?auto_67582 ?auto_67589 ) ) ( HOIST-AT ?auto_67588 ?auto_67582 ) ( not ( = ?auto_67585 ?auto_67588 ) ) ( AVAILABLE ?auto_67588 ) ( SURFACE-AT ?auto_67577 ?auto_67582 ) ( ON ?auto_67577 ?auto_67591 ) ( CLEAR ?auto_67577 ) ( not ( = ?auto_67577 ?auto_67591 ) ) ( not ( = ?auto_67578 ?auto_67591 ) ) ( IS-CRATE ?auto_67578 ) ( not ( = ?auto_67577 ?auto_67592 ) ) ( not ( = ?auto_67578 ?auto_67592 ) ) ( not ( = ?auto_67591 ?auto_67592 ) ) ( not ( = ?auto_67583 ?auto_67589 ) ) ( not ( = ?auto_67582 ?auto_67583 ) ) ( HOIST-AT ?auto_67597 ?auto_67583 ) ( not ( = ?auto_67585 ?auto_67597 ) ) ( not ( = ?auto_67588 ?auto_67597 ) ) ( AVAILABLE ?auto_67597 ) ( SURFACE-AT ?auto_67578 ?auto_67583 ) ( ON ?auto_67578 ?auto_67598 ) ( CLEAR ?auto_67578 ) ( not ( = ?auto_67577 ?auto_67598 ) ) ( not ( = ?auto_67578 ?auto_67598 ) ) ( not ( = ?auto_67591 ?auto_67598 ) ) ( not ( = ?auto_67592 ?auto_67598 ) ) ( IS-CRATE ?auto_67592 ) ( not ( = ?auto_67577 ?auto_67595 ) ) ( not ( = ?auto_67578 ?auto_67595 ) ) ( not ( = ?auto_67591 ?auto_67595 ) ) ( not ( = ?auto_67592 ?auto_67595 ) ) ( not ( = ?auto_67598 ?auto_67595 ) ) ( not ( = ?auto_67581 ?auto_67589 ) ) ( not ( = ?auto_67582 ?auto_67581 ) ) ( not ( = ?auto_67583 ?auto_67581 ) ) ( HOIST-AT ?auto_67584 ?auto_67581 ) ( not ( = ?auto_67585 ?auto_67584 ) ) ( not ( = ?auto_67588 ?auto_67584 ) ) ( not ( = ?auto_67597 ?auto_67584 ) ) ( SURFACE-AT ?auto_67592 ?auto_67581 ) ( ON ?auto_67592 ?auto_67593 ) ( CLEAR ?auto_67592 ) ( not ( = ?auto_67577 ?auto_67593 ) ) ( not ( = ?auto_67578 ?auto_67593 ) ) ( not ( = ?auto_67591 ?auto_67593 ) ) ( not ( = ?auto_67592 ?auto_67593 ) ) ( not ( = ?auto_67598 ?auto_67593 ) ) ( not ( = ?auto_67595 ?auto_67593 ) ) ( IS-CRATE ?auto_67595 ) ( not ( = ?auto_67577 ?auto_67586 ) ) ( not ( = ?auto_67578 ?auto_67586 ) ) ( not ( = ?auto_67591 ?auto_67586 ) ) ( not ( = ?auto_67592 ?auto_67586 ) ) ( not ( = ?auto_67598 ?auto_67586 ) ) ( not ( = ?auto_67595 ?auto_67586 ) ) ( not ( = ?auto_67593 ?auto_67586 ) ) ( AVAILABLE ?auto_67584 ) ( SURFACE-AT ?auto_67595 ?auto_67581 ) ( ON ?auto_67595 ?auto_67579 ) ( CLEAR ?auto_67595 ) ( not ( = ?auto_67577 ?auto_67579 ) ) ( not ( = ?auto_67578 ?auto_67579 ) ) ( not ( = ?auto_67591 ?auto_67579 ) ) ( not ( = ?auto_67592 ?auto_67579 ) ) ( not ( = ?auto_67598 ?auto_67579 ) ) ( not ( = ?auto_67595 ?auto_67579 ) ) ( not ( = ?auto_67593 ?auto_67579 ) ) ( not ( = ?auto_67586 ?auto_67579 ) ) ( IS-CRATE ?auto_67586 ) ( not ( = ?auto_67577 ?auto_67590 ) ) ( not ( = ?auto_67578 ?auto_67590 ) ) ( not ( = ?auto_67591 ?auto_67590 ) ) ( not ( = ?auto_67592 ?auto_67590 ) ) ( not ( = ?auto_67598 ?auto_67590 ) ) ( not ( = ?auto_67595 ?auto_67590 ) ) ( not ( = ?auto_67593 ?auto_67590 ) ) ( not ( = ?auto_67586 ?auto_67590 ) ) ( not ( = ?auto_67579 ?auto_67590 ) ) ( not ( = ?auto_67587 ?auto_67589 ) ) ( not ( = ?auto_67582 ?auto_67587 ) ) ( not ( = ?auto_67583 ?auto_67587 ) ) ( not ( = ?auto_67581 ?auto_67587 ) ) ( HOIST-AT ?auto_67594 ?auto_67587 ) ( not ( = ?auto_67585 ?auto_67594 ) ) ( not ( = ?auto_67588 ?auto_67594 ) ) ( not ( = ?auto_67597 ?auto_67594 ) ) ( not ( = ?auto_67584 ?auto_67594 ) ) ( AVAILABLE ?auto_67594 ) ( SURFACE-AT ?auto_67586 ?auto_67587 ) ( ON ?auto_67586 ?auto_67596 ) ( CLEAR ?auto_67586 ) ( not ( = ?auto_67577 ?auto_67596 ) ) ( not ( = ?auto_67578 ?auto_67596 ) ) ( not ( = ?auto_67591 ?auto_67596 ) ) ( not ( = ?auto_67592 ?auto_67596 ) ) ( not ( = ?auto_67598 ?auto_67596 ) ) ( not ( = ?auto_67595 ?auto_67596 ) ) ( not ( = ?auto_67593 ?auto_67596 ) ) ( not ( = ?auto_67586 ?auto_67596 ) ) ( not ( = ?auto_67579 ?auto_67596 ) ) ( not ( = ?auto_67590 ?auto_67596 ) ) ( TRUCK-AT ?auto_67580 ?auto_67589 ) ( SURFACE-AT ?auto_67599 ?auto_67589 ) ( CLEAR ?auto_67599 ) ( LIFTING ?auto_67585 ?auto_67590 ) ( IS-CRATE ?auto_67590 ) ( not ( = ?auto_67577 ?auto_67599 ) ) ( not ( = ?auto_67578 ?auto_67599 ) ) ( not ( = ?auto_67591 ?auto_67599 ) ) ( not ( = ?auto_67592 ?auto_67599 ) ) ( not ( = ?auto_67598 ?auto_67599 ) ) ( not ( = ?auto_67595 ?auto_67599 ) ) ( not ( = ?auto_67593 ?auto_67599 ) ) ( not ( = ?auto_67586 ?auto_67599 ) ) ( not ( = ?auto_67579 ?auto_67599 ) ) ( not ( = ?auto_67590 ?auto_67599 ) ) ( not ( = ?auto_67596 ?auto_67599 ) ) )
    :subtasks
    ( ( !DROP ?auto_67585 ?auto_67590 ?auto_67599 ?auto_67589 )
      ( MAKE-ON ?auto_67577 ?auto_67578 )
      ( MAKE-ON-VERIFY ?auto_67577 ?auto_67578 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_67600 - SURFACE
      ?auto_67601 - SURFACE
    )
    :vars
    (
      ?auto_67618 - HOIST
      ?auto_67607 - PLACE
      ?auto_67615 - PLACE
      ?auto_67608 - HOIST
      ?auto_67611 - SURFACE
      ?auto_67606 - SURFACE
      ?auto_67602 - PLACE
      ?auto_67619 - HOIST
      ?auto_67620 - SURFACE
      ?auto_67605 - SURFACE
      ?auto_67613 - PLACE
      ?auto_67610 - HOIST
      ?auto_67617 - SURFACE
      ?auto_67609 - SURFACE
      ?auto_67621 - SURFACE
      ?auto_67622 - SURFACE
      ?auto_67614 - PLACE
      ?auto_67612 - HOIST
      ?auto_67604 - SURFACE
      ?auto_67603 - TRUCK
      ?auto_67616 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_67618 ?auto_67607 ) ( IS-CRATE ?auto_67600 ) ( not ( = ?auto_67600 ?auto_67601 ) ) ( not ( = ?auto_67615 ?auto_67607 ) ) ( HOIST-AT ?auto_67608 ?auto_67615 ) ( not ( = ?auto_67618 ?auto_67608 ) ) ( AVAILABLE ?auto_67608 ) ( SURFACE-AT ?auto_67600 ?auto_67615 ) ( ON ?auto_67600 ?auto_67611 ) ( CLEAR ?auto_67600 ) ( not ( = ?auto_67600 ?auto_67611 ) ) ( not ( = ?auto_67601 ?auto_67611 ) ) ( IS-CRATE ?auto_67601 ) ( not ( = ?auto_67600 ?auto_67606 ) ) ( not ( = ?auto_67601 ?auto_67606 ) ) ( not ( = ?auto_67611 ?auto_67606 ) ) ( not ( = ?auto_67602 ?auto_67607 ) ) ( not ( = ?auto_67615 ?auto_67602 ) ) ( HOIST-AT ?auto_67619 ?auto_67602 ) ( not ( = ?auto_67618 ?auto_67619 ) ) ( not ( = ?auto_67608 ?auto_67619 ) ) ( AVAILABLE ?auto_67619 ) ( SURFACE-AT ?auto_67601 ?auto_67602 ) ( ON ?auto_67601 ?auto_67620 ) ( CLEAR ?auto_67601 ) ( not ( = ?auto_67600 ?auto_67620 ) ) ( not ( = ?auto_67601 ?auto_67620 ) ) ( not ( = ?auto_67611 ?auto_67620 ) ) ( not ( = ?auto_67606 ?auto_67620 ) ) ( IS-CRATE ?auto_67606 ) ( not ( = ?auto_67600 ?auto_67605 ) ) ( not ( = ?auto_67601 ?auto_67605 ) ) ( not ( = ?auto_67611 ?auto_67605 ) ) ( not ( = ?auto_67606 ?auto_67605 ) ) ( not ( = ?auto_67620 ?auto_67605 ) ) ( not ( = ?auto_67613 ?auto_67607 ) ) ( not ( = ?auto_67615 ?auto_67613 ) ) ( not ( = ?auto_67602 ?auto_67613 ) ) ( HOIST-AT ?auto_67610 ?auto_67613 ) ( not ( = ?auto_67618 ?auto_67610 ) ) ( not ( = ?auto_67608 ?auto_67610 ) ) ( not ( = ?auto_67619 ?auto_67610 ) ) ( SURFACE-AT ?auto_67606 ?auto_67613 ) ( ON ?auto_67606 ?auto_67617 ) ( CLEAR ?auto_67606 ) ( not ( = ?auto_67600 ?auto_67617 ) ) ( not ( = ?auto_67601 ?auto_67617 ) ) ( not ( = ?auto_67611 ?auto_67617 ) ) ( not ( = ?auto_67606 ?auto_67617 ) ) ( not ( = ?auto_67620 ?auto_67617 ) ) ( not ( = ?auto_67605 ?auto_67617 ) ) ( IS-CRATE ?auto_67605 ) ( not ( = ?auto_67600 ?auto_67609 ) ) ( not ( = ?auto_67601 ?auto_67609 ) ) ( not ( = ?auto_67611 ?auto_67609 ) ) ( not ( = ?auto_67606 ?auto_67609 ) ) ( not ( = ?auto_67620 ?auto_67609 ) ) ( not ( = ?auto_67605 ?auto_67609 ) ) ( not ( = ?auto_67617 ?auto_67609 ) ) ( AVAILABLE ?auto_67610 ) ( SURFACE-AT ?auto_67605 ?auto_67613 ) ( ON ?auto_67605 ?auto_67621 ) ( CLEAR ?auto_67605 ) ( not ( = ?auto_67600 ?auto_67621 ) ) ( not ( = ?auto_67601 ?auto_67621 ) ) ( not ( = ?auto_67611 ?auto_67621 ) ) ( not ( = ?auto_67606 ?auto_67621 ) ) ( not ( = ?auto_67620 ?auto_67621 ) ) ( not ( = ?auto_67605 ?auto_67621 ) ) ( not ( = ?auto_67617 ?auto_67621 ) ) ( not ( = ?auto_67609 ?auto_67621 ) ) ( IS-CRATE ?auto_67609 ) ( not ( = ?auto_67600 ?auto_67622 ) ) ( not ( = ?auto_67601 ?auto_67622 ) ) ( not ( = ?auto_67611 ?auto_67622 ) ) ( not ( = ?auto_67606 ?auto_67622 ) ) ( not ( = ?auto_67620 ?auto_67622 ) ) ( not ( = ?auto_67605 ?auto_67622 ) ) ( not ( = ?auto_67617 ?auto_67622 ) ) ( not ( = ?auto_67609 ?auto_67622 ) ) ( not ( = ?auto_67621 ?auto_67622 ) ) ( not ( = ?auto_67614 ?auto_67607 ) ) ( not ( = ?auto_67615 ?auto_67614 ) ) ( not ( = ?auto_67602 ?auto_67614 ) ) ( not ( = ?auto_67613 ?auto_67614 ) ) ( HOIST-AT ?auto_67612 ?auto_67614 ) ( not ( = ?auto_67618 ?auto_67612 ) ) ( not ( = ?auto_67608 ?auto_67612 ) ) ( not ( = ?auto_67619 ?auto_67612 ) ) ( not ( = ?auto_67610 ?auto_67612 ) ) ( AVAILABLE ?auto_67612 ) ( SURFACE-AT ?auto_67609 ?auto_67614 ) ( ON ?auto_67609 ?auto_67604 ) ( CLEAR ?auto_67609 ) ( not ( = ?auto_67600 ?auto_67604 ) ) ( not ( = ?auto_67601 ?auto_67604 ) ) ( not ( = ?auto_67611 ?auto_67604 ) ) ( not ( = ?auto_67606 ?auto_67604 ) ) ( not ( = ?auto_67620 ?auto_67604 ) ) ( not ( = ?auto_67605 ?auto_67604 ) ) ( not ( = ?auto_67617 ?auto_67604 ) ) ( not ( = ?auto_67609 ?auto_67604 ) ) ( not ( = ?auto_67621 ?auto_67604 ) ) ( not ( = ?auto_67622 ?auto_67604 ) ) ( TRUCK-AT ?auto_67603 ?auto_67607 ) ( SURFACE-AT ?auto_67616 ?auto_67607 ) ( CLEAR ?auto_67616 ) ( IS-CRATE ?auto_67622 ) ( not ( = ?auto_67600 ?auto_67616 ) ) ( not ( = ?auto_67601 ?auto_67616 ) ) ( not ( = ?auto_67611 ?auto_67616 ) ) ( not ( = ?auto_67606 ?auto_67616 ) ) ( not ( = ?auto_67620 ?auto_67616 ) ) ( not ( = ?auto_67605 ?auto_67616 ) ) ( not ( = ?auto_67617 ?auto_67616 ) ) ( not ( = ?auto_67609 ?auto_67616 ) ) ( not ( = ?auto_67621 ?auto_67616 ) ) ( not ( = ?auto_67622 ?auto_67616 ) ) ( not ( = ?auto_67604 ?auto_67616 ) ) ( AVAILABLE ?auto_67618 ) ( IN ?auto_67622 ?auto_67603 ) )
    :subtasks
    ( ( !UNLOAD ?auto_67618 ?auto_67622 ?auto_67603 ?auto_67607 )
      ( MAKE-ON ?auto_67600 ?auto_67601 )
      ( MAKE-ON-VERIFY ?auto_67600 ?auto_67601 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_67623 - SURFACE
      ?auto_67624 - SURFACE
    )
    :vars
    (
      ?auto_67625 - HOIST
      ?auto_67642 - PLACE
      ?auto_67630 - PLACE
      ?auto_67632 - HOIST
      ?auto_67638 - SURFACE
      ?auto_67640 - SURFACE
      ?auto_67635 - PLACE
      ?auto_67626 - HOIST
      ?auto_67631 - SURFACE
      ?auto_67627 - SURFACE
      ?auto_67628 - PLACE
      ?auto_67633 - HOIST
      ?auto_67637 - SURFACE
      ?auto_67629 - SURFACE
      ?auto_67644 - SURFACE
      ?auto_67645 - SURFACE
      ?auto_67634 - PLACE
      ?auto_67639 - HOIST
      ?auto_67641 - SURFACE
      ?auto_67636 - SURFACE
      ?auto_67643 - TRUCK
      ?auto_67646 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_67625 ?auto_67642 ) ( IS-CRATE ?auto_67623 ) ( not ( = ?auto_67623 ?auto_67624 ) ) ( not ( = ?auto_67630 ?auto_67642 ) ) ( HOIST-AT ?auto_67632 ?auto_67630 ) ( not ( = ?auto_67625 ?auto_67632 ) ) ( AVAILABLE ?auto_67632 ) ( SURFACE-AT ?auto_67623 ?auto_67630 ) ( ON ?auto_67623 ?auto_67638 ) ( CLEAR ?auto_67623 ) ( not ( = ?auto_67623 ?auto_67638 ) ) ( not ( = ?auto_67624 ?auto_67638 ) ) ( IS-CRATE ?auto_67624 ) ( not ( = ?auto_67623 ?auto_67640 ) ) ( not ( = ?auto_67624 ?auto_67640 ) ) ( not ( = ?auto_67638 ?auto_67640 ) ) ( not ( = ?auto_67635 ?auto_67642 ) ) ( not ( = ?auto_67630 ?auto_67635 ) ) ( HOIST-AT ?auto_67626 ?auto_67635 ) ( not ( = ?auto_67625 ?auto_67626 ) ) ( not ( = ?auto_67632 ?auto_67626 ) ) ( AVAILABLE ?auto_67626 ) ( SURFACE-AT ?auto_67624 ?auto_67635 ) ( ON ?auto_67624 ?auto_67631 ) ( CLEAR ?auto_67624 ) ( not ( = ?auto_67623 ?auto_67631 ) ) ( not ( = ?auto_67624 ?auto_67631 ) ) ( not ( = ?auto_67638 ?auto_67631 ) ) ( not ( = ?auto_67640 ?auto_67631 ) ) ( IS-CRATE ?auto_67640 ) ( not ( = ?auto_67623 ?auto_67627 ) ) ( not ( = ?auto_67624 ?auto_67627 ) ) ( not ( = ?auto_67638 ?auto_67627 ) ) ( not ( = ?auto_67640 ?auto_67627 ) ) ( not ( = ?auto_67631 ?auto_67627 ) ) ( not ( = ?auto_67628 ?auto_67642 ) ) ( not ( = ?auto_67630 ?auto_67628 ) ) ( not ( = ?auto_67635 ?auto_67628 ) ) ( HOIST-AT ?auto_67633 ?auto_67628 ) ( not ( = ?auto_67625 ?auto_67633 ) ) ( not ( = ?auto_67632 ?auto_67633 ) ) ( not ( = ?auto_67626 ?auto_67633 ) ) ( SURFACE-AT ?auto_67640 ?auto_67628 ) ( ON ?auto_67640 ?auto_67637 ) ( CLEAR ?auto_67640 ) ( not ( = ?auto_67623 ?auto_67637 ) ) ( not ( = ?auto_67624 ?auto_67637 ) ) ( not ( = ?auto_67638 ?auto_67637 ) ) ( not ( = ?auto_67640 ?auto_67637 ) ) ( not ( = ?auto_67631 ?auto_67637 ) ) ( not ( = ?auto_67627 ?auto_67637 ) ) ( IS-CRATE ?auto_67627 ) ( not ( = ?auto_67623 ?auto_67629 ) ) ( not ( = ?auto_67624 ?auto_67629 ) ) ( not ( = ?auto_67638 ?auto_67629 ) ) ( not ( = ?auto_67640 ?auto_67629 ) ) ( not ( = ?auto_67631 ?auto_67629 ) ) ( not ( = ?auto_67627 ?auto_67629 ) ) ( not ( = ?auto_67637 ?auto_67629 ) ) ( AVAILABLE ?auto_67633 ) ( SURFACE-AT ?auto_67627 ?auto_67628 ) ( ON ?auto_67627 ?auto_67644 ) ( CLEAR ?auto_67627 ) ( not ( = ?auto_67623 ?auto_67644 ) ) ( not ( = ?auto_67624 ?auto_67644 ) ) ( not ( = ?auto_67638 ?auto_67644 ) ) ( not ( = ?auto_67640 ?auto_67644 ) ) ( not ( = ?auto_67631 ?auto_67644 ) ) ( not ( = ?auto_67627 ?auto_67644 ) ) ( not ( = ?auto_67637 ?auto_67644 ) ) ( not ( = ?auto_67629 ?auto_67644 ) ) ( IS-CRATE ?auto_67629 ) ( not ( = ?auto_67623 ?auto_67645 ) ) ( not ( = ?auto_67624 ?auto_67645 ) ) ( not ( = ?auto_67638 ?auto_67645 ) ) ( not ( = ?auto_67640 ?auto_67645 ) ) ( not ( = ?auto_67631 ?auto_67645 ) ) ( not ( = ?auto_67627 ?auto_67645 ) ) ( not ( = ?auto_67637 ?auto_67645 ) ) ( not ( = ?auto_67629 ?auto_67645 ) ) ( not ( = ?auto_67644 ?auto_67645 ) ) ( not ( = ?auto_67634 ?auto_67642 ) ) ( not ( = ?auto_67630 ?auto_67634 ) ) ( not ( = ?auto_67635 ?auto_67634 ) ) ( not ( = ?auto_67628 ?auto_67634 ) ) ( HOIST-AT ?auto_67639 ?auto_67634 ) ( not ( = ?auto_67625 ?auto_67639 ) ) ( not ( = ?auto_67632 ?auto_67639 ) ) ( not ( = ?auto_67626 ?auto_67639 ) ) ( not ( = ?auto_67633 ?auto_67639 ) ) ( AVAILABLE ?auto_67639 ) ( SURFACE-AT ?auto_67629 ?auto_67634 ) ( ON ?auto_67629 ?auto_67641 ) ( CLEAR ?auto_67629 ) ( not ( = ?auto_67623 ?auto_67641 ) ) ( not ( = ?auto_67624 ?auto_67641 ) ) ( not ( = ?auto_67638 ?auto_67641 ) ) ( not ( = ?auto_67640 ?auto_67641 ) ) ( not ( = ?auto_67631 ?auto_67641 ) ) ( not ( = ?auto_67627 ?auto_67641 ) ) ( not ( = ?auto_67637 ?auto_67641 ) ) ( not ( = ?auto_67629 ?auto_67641 ) ) ( not ( = ?auto_67644 ?auto_67641 ) ) ( not ( = ?auto_67645 ?auto_67641 ) ) ( SURFACE-AT ?auto_67636 ?auto_67642 ) ( CLEAR ?auto_67636 ) ( IS-CRATE ?auto_67645 ) ( not ( = ?auto_67623 ?auto_67636 ) ) ( not ( = ?auto_67624 ?auto_67636 ) ) ( not ( = ?auto_67638 ?auto_67636 ) ) ( not ( = ?auto_67640 ?auto_67636 ) ) ( not ( = ?auto_67631 ?auto_67636 ) ) ( not ( = ?auto_67627 ?auto_67636 ) ) ( not ( = ?auto_67637 ?auto_67636 ) ) ( not ( = ?auto_67629 ?auto_67636 ) ) ( not ( = ?auto_67644 ?auto_67636 ) ) ( not ( = ?auto_67645 ?auto_67636 ) ) ( not ( = ?auto_67641 ?auto_67636 ) ) ( AVAILABLE ?auto_67625 ) ( IN ?auto_67645 ?auto_67643 ) ( TRUCK-AT ?auto_67643 ?auto_67646 ) ( not ( = ?auto_67646 ?auto_67642 ) ) ( not ( = ?auto_67630 ?auto_67646 ) ) ( not ( = ?auto_67635 ?auto_67646 ) ) ( not ( = ?auto_67628 ?auto_67646 ) ) ( not ( = ?auto_67634 ?auto_67646 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_67643 ?auto_67646 ?auto_67642 )
      ( MAKE-ON ?auto_67623 ?auto_67624 )
      ( MAKE-ON-VERIFY ?auto_67623 ?auto_67624 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_67647 - SURFACE
      ?auto_67648 - SURFACE
    )
    :vars
    (
      ?auto_67663 - HOIST
      ?auto_67655 - PLACE
      ?auto_67670 - PLACE
      ?auto_67666 - HOIST
      ?auto_67651 - SURFACE
      ?auto_67658 - SURFACE
      ?auto_67650 - PLACE
      ?auto_67660 - HOIST
      ?auto_67659 - SURFACE
      ?auto_67668 - SURFACE
      ?auto_67665 - PLACE
      ?auto_67662 - HOIST
      ?auto_67667 - SURFACE
      ?auto_67649 - SURFACE
      ?auto_67657 - SURFACE
      ?auto_67669 - SURFACE
      ?auto_67653 - PLACE
      ?auto_67661 - HOIST
      ?auto_67652 - SURFACE
      ?auto_67654 - SURFACE
      ?auto_67656 - TRUCK
      ?auto_67664 - PLACE
      ?auto_67671 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_67663 ?auto_67655 ) ( IS-CRATE ?auto_67647 ) ( not ( = ?auto_67647 ?auto_67648 ) ) ( not ( = ?auto_67670 ?auto_67655 ) ) ( HOIST-AT ?auto_67666 ?auto_67670 ) ( not ( = ?auto_67663 ?auto_67666 ) ) ( AVAILABLE ?auto_67666 ) ( SURFACE-AT ?auto_67647 ?auto_67670 ) ( ON ?auto_67647 ?auto_67651 ) ( CLEAR ?auto_67647 ) ( not ( = ?auto_67647 ?auto_67651 ) ) ( not ( = ?auto_67648 ?auto_67651 ) ) ( IS-CRATE ?auto_67648 ) ( not ( = ?auto_67647 ?auto_67658 ) ) ( not ( = ?auto_67648 ?auto_67658 ) ) ( not ( = ?auto_67651 ?auto_67658 ) ) ( not ( = ?auto_67650 ?auto_67655 ) ) ( not ( = ?auto_67670 ?auto_67650 ) ) ( HOIST-AT ?auto_67660 ?auto_67650 ) ( not ( = ?auto_67663 ?auto_67660 ) ) ( not ( = ?auto_67666 ?auto_67660 ) ) ( AVAILABLE ?auto_67660 ) ( SURFACE-AT ?auto_67648 ?auto_67650 ) ( ON ?auto_67648 ?auto_67659 ) ( CLEAR ?auto_67648 ) ( not ( = ?auto_67647 ?auto_67659 ) ) ( not ( = ?auto_67648 ?auto_67659 ) ) ( not ( = ?auto_67651 ?auto_67659 ) ) ( not ( = ?auto_67658 ?auto_67659 ) ) ( IS-CRATE ?auto_67658 ) ( not ( = ?auto_67647 ?auto_67668 ) ) ( not ( = ?auto_67648 ?auto_67668 ) ) ( not ( = ?auto_67651 ?auto_67668 ) ) ( not ( = ?auto_67658 ?auto_67668 ) ) ( not ( = ?auto_67659 ?auto_67668 ) ) ( not ( = ?auto_67665 ?auto_67655 ) ) ( not ( = ?auto_67670 ?auto_67665 ) ) ( not ( = ?auto_67650 ?auto_67665 ) ) ( HOIST-AT ?auto_67662 ?auto_67665 ) ( not ( = ?auto_67663 ?auto_67662 ) ) ( not ( = ?auto_67666 ?auto_67662 ) ) ( not ( = ?auto_67660 ?auto_67662 ) ) ( SURFACE-AT ?auto_67658 ?auto_67665 ) ( ON ?auto_67658 ?auto_67667 ) ( CLEAR ?auto_67658 ) ( not ( = ?auto_67647 ?auto_67667 ) ) ( not ( = ?auto_67648 ?auto_67667 ) ) ( not ( = ?auto_67651 ?auto_67667 ) ) ( not ( = ?auto_67658 ?auto_67667 ) ) ( not ( = ?auto_67659 ?auto_67667 ) ) ( not ( = ?auto_67668 ?auto_67667 ) ) ( IS-CRATE ?auto_67668 ) ( not ( = ?auto_67647 ?auto_67649 ) ) ( not ( = ?auto_67648 ?auto_67649 ) ) ( not ( = ?auto_67651 ?auto_67649 ) ) ( not ( = ?auto_67658 ?auto_67649 ) ) ( not ( = ?auto_67659 ?auto_67649 ) ) ( not ( = ?auto_67668 ?auto_67649 ) ) ( not ( = ?auto_67667 ?auto_67649 ) ) ( AVAILABLE ?auto_67662 ) ( SURFACE-AT ?auto_67668 ?auto_67665 ) ( ON ?auto_67668 ?auto_67657 ) ( CLEAR ?auto_67668 ) ( not ( = ?auto_67647 ?auto_67657 ) ) ( not ( = ?auto_67648 ?auto_67657 ) ) ( not ( = ?auto_67651 ?auto_67657 ) ) ( not ( = ?auto_67658 ?auto_67657 ) ) ( not ( = ?auto_67659 ?auto_67657 ) ) ( not ( = ?auto_67668 ?auto_67657 ) ) ( not ( = ?auto_67667 ?auto_67657 ) ) ( not ( = ?auto_67649 ?auto_67657 ) ) ( IS-CRATE ?auto_67649 ) ( not ( = ?auto_67647 ?auto_67669 ) ) ( not ( = ?auto_67648 ?auto_67669 ) ) ( not ( = ?auto_67651 ?auto_67669 ) ) ( not ( = ?auto_67658 ?auto_67669 ) ) ( not ( = ?auto_67659 ?auto_67669 ) ) ( not ( = ?auto_67668 ?auto_67669 ) ) ( not ( = ?auto_67667 ?auto_67669 ) ) ( not ( = ?auto_67649 ?auto_67669 ) ) ( not ( = ?auto_67657 ?auto_67669 ) ) ( not ( = ?auto_67653 ?auto_67655 ) ) ( not ( = ?auto_67670 ?auto_67653 ) ) ( not ( = ?auto_67650 ?auto_67653 ) ) ( not ( = ?auto_67665 ?auto_67653 ) ) ( HOIST-AT ?auto_67661 ?auto_67653 ) ( not ( = ?auto_67663 ?auto_67661 ) ) ( not ( = ?auto_67666 ?auto_67661 ) ) ( not ( = ?auto_67660 ?auto_67661 ) ) ( not ( = ?auto_67662 ?auto_67661 ) ) ( AVAILABLE ?auto_67661 ) ( SURFACE-AT ?auto_67649 ?auto_67653 ) ( ON ?auto_67649 ?auto_67652 ) ( CLEAR ?auto_67649 ) ( not ( = ?auto_67647 ?auto_67652 ) ) ( not ( = ?auto_67648 ?auto_67652 ) ) ( not ( = ?auto_67651 ?auto_67652 ) ) ( not ( = ?auto_67658 ?auto_67652 ) ) ( not ( = ?auto_67659 ?auto_67652 ) ) ( not ( = ?auto_67668 ?auto_67652 ) ) ( not ( = ?auto_67667 ?auto_67652 ) ) ( not ( = ?auto_67649 ?auto_67652 ) ) ( not ( = ?auto_67657 ?auto_67652 ) ) ( not ( = ?auto_67669 ?auto_67652 ) ) ( SURFACE-AT ?auto_67654 ?auto_67655 ) ( CLEAR ?auto_67654 ) ( IS-CRATE ?auto_67669 ) ( not ( = ?auto_67647 ?auto_67654 ) ) ( not ( = ?auto_67648 ?auto_67654 ) ) ( not ( = ?auto_67651 ?auto_67654 ) ) ( not ( = ?auto_67658 ?auto_67654 ) ) ( not ( = ?auto_67659 ?auto_67654 ) ) ( not ( = ?auto_67668 ?auto_67654 ) ) ( not ( = ?auto_67667 ?auto_67654 ) ) ( not ( = ?auto_67649 ?auto_67654 ) ) ( not ( = ?auto_67657 ?auto_67654 ) ) ( not ( = ?auto_67669 ?auto_67654 ) ) ( not ( = ?auto_67652 ?auto_67654 ) ) ( AVAILABLE ?auto_67663 ) ( TRUCK-AT ?auto_67656 ?auto_67664 ) ( not ( = ?auto_67664 ?auto_67655 ) ) ( not ( = ?auto_67670 ?auto_67664 ) ) ( not ( = ?auto_67650 ?auto_67664 ) ) ( not ( = ?auto_67665 ?auto_67664 ) ) ( not ( = ?auto_67653 ?auto_67664 ) ) ( HOIST-AT ?auto_67671 ?auto_67664 ) ( LIFTING ?auto_67671 ?auto_67669 ) ( not ( = ?auto_67663 ?auto_67671 ) ) ( not ( = ?auto_67666 ?auto_67671 ) ) ( not ( = ?auto_67660 ?auto_67671 ) ) ( not ( = ?auto_67662 ?auto_67671 ) ) ( not ( = ?auto_67661 ?auto_67671 ) ) )
    :subtasks
    ( ( !LOAD ?auto_67671 ?auto_67669 ?auto_67656 ?auto_67664 )
      ( MAKE-ON ?auto_67647 ?auto_67648 )
      ( MAKE-ON-VERIFY ?auto_67647 ?auto_67648 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_67672 - SURFACE
      ?auto_67673 - SURFACE
    )
    :vars
    (
      ?auto_67691 - HOIST
      ?auto_67674 - PLACE
      ?auto_67683 - PLACE
      ?auto_67679 - HOIST
      ?auto_67685 - SURFACE
      ?auto_67696 - SURFACE
      ?auto_67687 - PLACE
      ?auto_67681 - HOIST
      ?auto_67680 - SURFACE
      ?auto_67684 - SURFACE
      ?auto_67678 - PLACE
      ?auto_67675 - HOIST
      ?auto_67676 - SURFACE
      ?auto_67690 - SURFACE
      ?auto_67693 - SURFACE
      ?auto_67677 - SURFACE
      ?auto_67688 - PLACE
      ?auto_67682 - HOIST
      ?auto_67686 - SURFACE
      ?auto_67694 - SURFACE
      ?auto_67695 - TRUCK
      ?auto_67692 - PLACE
      ?auto_67689 - HOIST
      ?auto_67697 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_67691 ?auto_67674 ) ( IS-CRATE ?auto_67672 ) ( not ( = ?auto_67672 ?auto_67673 ) ) ( not ( = ?auto_67683 ?auto_67674 ) ) ( HOIST-AT ?auto_67679 ?auto_67683 ) ( not ( = ?auto_67691 ?auto_67679 ) ) ( AVAILABLE ?auto_67679 ) ( SURFACE-AT ?auto_67672 ?auto_67683 ) ( ON ?auto_67672 ?auto_67685 ) ( CLEAR ?auto_67672 ) ( not ( = ?auto_67672 ?auto_67685 ) ) ( not ( = ?auto_67673 ?auto_67685 ) ) ( IS-CRATE ?auto_67673 ) ( not ( = ?auto_67672 ?auto_67696 ) ) ( not ( = ?auto_67673 ?auto_67696 ) ) ( not ( = ?auto_67685 ?auto_67696 ) ) ( not ( = ?auto_67687 ?auto_67674 ) ) ( not ( = ?auto_67683 ?auto_67687 ) ) ( HOIST-AT ?auto_67681 ?auto_67687 ) ( not ( = ?auto_67691 ?auto_67681 ) ) ( not ( = ?auto_67679 ?auto_67681 ) ) ( AVAILABLE ?auto_67681 ) ( SURFACE-AT ?auto_67673 ?auto_67687 ) ( ON ?auto_67673 ?auto_67680 ) ( CLEAR ?auto_67673 ) ( not ( = ?auto_67672 ?auto_67680 ) ) ( not ( = ?auto_67673 ?auto_67680 ) ) ( not ( = ?auto_67685 ?auto_67680 ) ) ( not ( = ?auto_67696 ?auto_67680 ) ) ( IS-CRATE ?auto_67696 ) ( not ( = ?auto_67672 ?auto_67684 ) ) ( not ( = ?auto_67673 ?auto_67684 ) ) ( not ( = ?auto_67685 ?auto_67684 ) ) ( not ( = ?auto_67696 ?auto_67684 ) ) ( not ( = ?auto_67680 ?auto_67684 ) ) ( not ( = ?auto_67678 ?auto_67674 ) ) ( not ( = ?auto_67683 ?auto_67678 ) ) ( not ( = ?auto_67687 ?auto_67678 ) ) ( HOIST-AT ?auto_67675 ?auto_67678 ) ( not ( = ?auto_67691 ?auto_67675 ) ) ( not ( = ?auto_67679 ?auto_67675 ) ) ( not ( = ?auto_67681 ?auto_67675 ) ) ( SURFACE-AT ?auto_67696 ?auto_67678 ) ( ON ?auto_67696 ?auto_67676 ) ( CLEAR ?auto_67696 ) ( not ( = ?auto_67672 ?auto_67676 ) ) ( not ( = ?auto_67673 ?auto_67676 ) ) ( not ( = ?auto_67685 ?auto_67676 ) ) ( not ( = ?auto_67696 ?auto_67676 ) ) ( not ( = ?auto_67680 ?auto_67676 ) ) ( not ( = ?auto_67684 ?auto_67676 ) ) ( IS-CRATE ?auto_67684 ) ( not ( = ?auto_67672 ?auto_67690 ) ) ( not ( = ?auto_67673 ?auto_67690 ) ) ( not ( = ?auto_67685 ?auto_67690 ) ) ( not ( = ?auto_67696 ?auto_67690 ) ) ( not ( = ?auto_67680 ?auto_67690 ) ) ( not ( = ?auto_67684 ?auto_67690 ) ) ( not ( = ?auto_67676 ?auto_67690 ) ) ( AVAILABLE ?auto_67675 ) ( SURFACE-AT ?auto_67684 ?auto_67678 ) ( ON ?auto_67684 ?auto_67693 ) ( CLEAR ?auto_67684 ) ( not ( = ?auto_67672 ?auto_67693 ) ) ( not ( = ?auto_67673 ?auto_67693 ) ) ( not ( = ?auto_67685 ?auto_67693 ) ) ( not ( = ?auto_67696 ?auto_67693 ) ) ( not ( = ?auto_67680 ?auto_67693 ) ) ( not ( = ?auto_67684 ?auto_67693 ) ) ( not ( = ?auto_67676 ?auto_67693 ) ) ( not ( = ?auto_67690 ?auto_67693 ) ) ( IS-CRATE ?auto_67690 ) ( not ( = ?auto_67672 ?auto_67677 ) ) ( not ( = ?auto_67673 ?auto_67677 ) ) ( not ( = ?auto_67685 ?auto_67677 ) ) ( not ( = ?auto_67696 ?auto_67677 ) ) ( not ( = ?auto_67680 ?auto_67677 ) ) ( not ( = ?auto_67684 ?auto_67677 ) ) ( not ( = ?auto_67676 ?auto_67677 ) ) ( not ( = ?auto_67690 ?auto_67677 ) ) ( not ( = ?auto_67693 ?auto_67677 ) ) ( not ( = ?auto_67688 ?auto_67674 ) ) ( not ( = ?auto_67683 ?auto_67688 ) ) ( not ( = ?auto_67687 ?auto_67688 ) ) ( not ( = ?auto_67678 ?auto_67688 ) ) ( HOIST-AT ?auto_67682 ?auto_67688 ) ( not ( = ?auto_67691 ?auto_67682 ) ) ( not ( = ?auto_67679 ?auto_67682 ) ) ( not ( = ?auto_67681 ?auto_67682 ) ) ( not ( = ?auto_67675 ?auto_67682 ) ) ( AVAILABLE ?auto_67682 ) ( SURFACE-AT ?auto_67690 ?auto_67688 ) ( ON ?auto_67690 ?auto_67686 ) ( CLEAR ?auto_67690 ) ( not ( = ?auto_67672 ?auto_67686 ) ) ( not ( = ?auto_67673 ?auto_67686 ) ) ( not ( = ?auto_67685 ?auto_67686 ) ) ( not ( = ?auto_67696 ?auto_67686 ) ) ( not ( = ?auto_67680 ?auto_67686 ) ) ( not ( = ?auto_67684 ?auto_67686 ) ) ( not ( = ?auto_67676 ?auto_67686 ) ) ( not ( = ?auto_67690 ?auto_67686 ) ) ( not ( = ?auto_67693 ?auto_67686 ) ) ( not ( = ?auto_67677 ?auto_67686 ) ) ( SURFACE-AT ?auto_67694 ?auto_67674 ) ( CLEAR ?auto_67694 ) ( IS-CRATE ?auto_67677 ) ( not ( = ?auto_67672 ?auto_67694 ) ) ( not ( = ?auto_67673 ?auto_67694 ) ) ( not ( = ?auto_67685 ?auto_67694 ) ) ( not ( = ?auto_67696 ?auto_67694 ) ) ( not ( = ?auto_67680 ?auto_67694 ) ) ( not ( = ?auto_67684 ?auto_67694 ) ) ( not ( = ?auto_67676 ?auto_67694 ) ) ( not ( = ?auto_67690 ?auto_67694 ) ) ( not ( = ?auto_67693 ?auto_67694 ) ) ( not ( = ?auto_67677 ?auto_67694 ) ) ( not ( = ?auto_67686 ?auto_67694 ) ) ( AVAILABLE ?auto_67691 ) ( TRUCK-AT ?auto_67695 ?auto_67692 ) ( not ( = ?auto_67692 ?auto_67674 ) ) ( not ( = ?auto_67683 ?auto_67692 ) ) ( not ( = ?auto_67687 ?auto_67692 ) ) ( not ( = ?auto_67678 ?auto_67692 ) ) ( not ( = ?auto_67688 ?auto_67692 ) ) ( HOIST-AT ?auto_67689 ?auto_67692 ) ( not ( = ?auto_67691 ?auto_67689 ) ) ( not ( = ?auto_67679 ?auto_67689 ) ) ( not ( = ?auto_67681 ?auto_67689 ) ) ( not ( = ?auto_67675 ?auto_67689 ) ) ( not ( = ?auto_67682 ?auto_67689 ) ) ( AVAILABLE ?auto_67689 ) ( SURFACE-AT ?auto_67677 ?auto_67692 ) ( ON ?auto_67677 ?auto_67697 ) ( CLEAR ?auto_67677 ) ( not ( = ?auto_67672 ?auto_67697 ) ) ( not ( = ?auto_67673 ?auto_67697 ) ) ( not ( = ?auto_67685 ?auto_67697 ) ) ( not ( = ?auto_67696 ?auto_67697 ) ) ( not ( = ?auto_67680 ?auto_67697 ) ) ( not ( = ?auto_67684 ?auto_67697 ) ) ( not ( = ?auto_67676 ?auto_67697 ) ) ( not ( = ?auto_67690 ?auto_67697 ) ) ( not ( = ?auto_67693 ?auto_67697 ) ) ( not ( = ?auto_67677 ?auto_67697 ) ) ( not ( = ?auto_67686 ?auto_67697 ) ) ( not ( = ?auto_67694 ?auto_67697 ) ) )
    :subtasks
    ( ( !LIFT ?auto_67689 ?auto_67677 ?auto_67697 ?auto_67692 )
      ( MAKE-ON ?auto_67672 ?auto_67673 )
      ( MAKE-ON-VERIFY ?auto_67672 ?auto_67673 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_67698 - SURFACE
      ?auto_67699 - SURFACE
    )
    :vars
    (
      ?auto_67708 - HOIST
      ?auto_67700 - PLACE
      ?auto_67706 - PLACE
      ?auto_67723 - HOIST
      ?auto_67717 - SURFACE
      ?auto_67712 - SURFACE
      ?auto_67719 - PLACE
      ?auto_67720 - HOIST
      ?auto_67710 - SURFACE
      ?auto_67707 - SURFACE
      ?auto_67715 - PLACE
      ?auto_67702 - HOIST
      ?auto_67714 - SURFACE
      ?auto_67713 - SURFACE
      ?auto_67704 - SURFACE
      ?auto_67716 - SURFACE
      ?auto_67721 - PLACE
      ?auto_67722 - HOIST
      ?auto_67718 - SURFACE
      ?auto_67703 - SURFACE
      ?auto_67709 - PLACE
      ?auto_67701 - HOIST
      ?auto_67705 - SURFACE
      ?auto_67711 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_67708 ?auto_67700 ) ( IS-CRATE ?auto_67698 ) ( not ( = ?auto_67698 ?auto_67699 ) ) ( not ( = ?auto_67706 ?auto_67700 ) ) ( HOIST-AT ?auto_67723 ?auto_67706 ) ( not ( = ?auto_67708 ?auto_67723 ) ) ( AVAILABLE ?auto_67723 ) ( SURFACE-AT ?auto_67698 ?auto_67706 ) ( ON ?auto_67698 ?auto_67717 ) ( CLEAR ?auto_67698 ) ( not ( = ?auto_67698 ?auto_67717 ) ) ( not ( = ?auto_67699 ?auto_67717 ) ) ( IS-CRATE ?auto_67699 ) ( not ( = ?auto_67698 ?auto_67712 ) ) ( not ( = ?auto_67699 ?auto_67712 ) ) ( not ( = ?auto_67717 ?auto_67712 ) ) ( not ( = ?auto_67719 ?auto_67700 ) ) ( not ( = ?auto_67706 ?auto_67719 ) ) ( HOIST-AT ?auto_67720 ?auto_67719 ) ( not ( = ?auto_67708 ?auto_67720 ) ) ( not ( = ?auto_67723 ?auto_67720 ) ) ( AVAILABLE ?auto_67720 ) ( SURFACE-AT ?auto_67699 ?auto_67719 ) ( ON ?auto_67699 ?auto_67710 ) ( CLEAR ?auto_67699 ) ( not ( = ?auto_67698 ?auto_67710 ) ) ( not ( = ?auto_67699 ?auto_67710 ) ) ( not ( = ?auto_67717 ?auto_67710 ) ) ( not ( = ?auto_67712 ?auto_67710 ) ) ( IS-CRATE ?auto_67712 ) ( not ( = ?auto_67698 ?auto_67707 ) ) ( not ( = ?auto_67699 ?auto_67707 ) ) ( not ( = ?auto_67717 ?auto_67707 ) ) ( not ( = ?auto_67712 ?auto_67707 ) ) ( not ( = ?auto_67710 ?auto_67707 ) ) ( not ( = ?auto_67715 ?auto_67700 ) ) ( not ( = ?auto_67706 ?auto_67715 ) ) ( not ( = ?auto_67719 ?auto_67715 ) ) ( HOIST-AT ?auto_67702 ?auto_67715 ) ( not ( = ?auto_67708 ?auto_67702 ) ) ( not ( = ?auto_67723 ?auto_67702 ) ) ( not ( = ?auto_67720 ?auto_67702 ) ) ( SURFACE-AT ?auto_67712 ?auto_67715 ) ( ON ?auto_67712 ?auto_67714 ) ( CLEAR ?auto_67712 ) ( not ( = ?auto_67698 ?auto_67714 ) ) ( not ( = ?auto_67699 ?auto_67714 ) ) ( not ( = ?auto_67717 ?auto_67714 ) ) ( not ( = ?auto_67712 ?auto_67714 ) ) ( not ( = ?auto_67710 ?auto_67714 ) ) ( not ( = ?auto_67707 ?auto_67714 ) ) ( IS-CRATE ?auto_67707 ) ( not ( = ?auto_67698 ?auto_67713 ) ) ( not ( = ?auto_67699 ?auto_67713 ) ) ( not ( = ?auto_67717 ?auto_67713 ) ) ( not ( = ?auto_67712 ?auto_67713 ) ) ( not ( = ?auto_67710 ?auto_67713 ) ) ( not ( = ?auto_67707 ?auto_67713 ) ) ( not ( = ?auto_67714 ?auto_67713 ) ) ( AVAILABLE ?auto_67702 ) ( SURFACE-AT ?auto_67707 ?auto_67715 ) ( ON ?auto_67707 ?auto_67704 ) ( CLEAR ?auto_67707 ) ( not ( = ?auto_67698 ?auto_67704 ) ) ( not ( = ?auto_67699 ?auto_67704 ) ) ( not ( = ?auto_67717 ?auto_67704 ) ) ( not ( = ?auto_67712 ?auto_67704 ) ) ( not ( = ?auto_67710 ?auto_67704 ) ) ( not ( = ?auto_67707 ?auto_67704 ) ) ( not ( = ?auto_67714 ?auto_67704 ) ) ( not ( = ?auto_67713 ?auto_67704 ) ) ( IS-CRATE ?auto_67713 ) ( not ( = ?auto_67698 ?auto_67716 ) ) ( not ( = ?auto_67699 ?auto_67716 ) ) ( not ( = ?auto_67717 ?auto_67716 ) ) ( not ( = ?auto_67712 ?auto_67716 ) ) ( not ( = ?auto_67710 ?auto_67716 ) ) ( not ( = ?auto_67707 ?auto_67716 ) ) ( not ( = ?auto_67714 ?auto_67716 ) ) ( not ( = ?auto_67713 ?auto_67716 ) ) ( not ( = ?auto_67704 ?auto_67716 ) ) ( not ( = ?auto_67721 ?auto_67700 ) ) ( not ( = ?auto_67706 ?auto_67721 ) ) ( not ( = ?auto_67719 ?auto_67721 ) ) ( not ( = ?auto_67715 ?auto_67721 ) ) ( HOIST-AT ?auto_67722 ?auto_67721 ) ( not ( = ?auto_67708 ?auto_67722 ) ) ( not ( = ?auto_67723 ?auto_67722 ) ) ( not ( = ?auto_67720 ?auto_67722 ) ) ( not ( = ?auto_67702 ?auto_67722 ) ) ( AVAILABLE ?auto_67722 ) ( SURFACE-AT ?auto_67713 ?auto_67721 ) ( ON ?auto_67713 ?auto_67718 ) ( CLEAR ?auto_67713 ) ( not ( = ?auto_67698 ?auto_67718 ) ) ( not ( = ?auto_67699 ?auto_67718 ) ) ( not ( = ?auto_67717 ?auto_67718 ) ) ( not ( = ?auto_67712 ?auto_67718 ) ) ( not ( = ?auto_67710 ?auto_67718 ) ) ( not ( = ?auto_67707 ?auto_67718 ) ) ( not ( = ?auto_67714 ?auto_67718 ) ) ( not ( = ?auto_67713 ?auto_67718 ) ) ( not ( = ?auto_67704 ?auto_67718 ) ) ( not ( = ?auto_67716 ?auto_67718 ) ) ( SURFACE-AT ?auto_67703 ?auto_67700 ) ( CLEAR ?auto_67703 ) ( IS-CRATE ?auto_67716 ) ( not ( = ?auto_67698 ?auto_67703 ) ) ( not ( = ?auto_67699 ?auto_67703 ) ) ( not ( = ?auto_67717 ?auto_67703 ) ) ( not ( = ?auto_67712 ?auto_67703 ) ) ( not ( = ?auto_67710 ?auto_67703 ) ) ( not ( = ?auto_67707 ?auto_67703 ) ) ( not ( = ?auto_67714 ?auto_67703 ) ) ( not ( = ?auto_67713 ?auto_67703 ) ) ( not ( = ?auto_67704 ?auto_67703 ) ) ( not ( = ?auto_67716 ?auto_67703 ) ) ( not ( = ?auto_67718 ?auto_67703 ) ) ( AVAILABLE ?auto_67708 ) ( not ( = ?auto_67709 ?auto_67700 ) ) ( not ( = ?auto_67706 ?auto_67709 ) ) ( not ( = ?auto_67719 ?auto_67709 ) ) ( not ( = ?auto_67715 ?auto_67709 ) ) ( not ( = ?auto_67721 ?auto_67709 ) ) ( HOIST-AT ?auto_67701 ?auto_67709 ) ( not ( = ?auto_67708 ?auto_67701 ) ) ( not ( = ?auto_67723 ?auto_67701 ) ) ( not ( = ?auto_67720 ?auto_67701 ) ) ( not ( = ?auto_67702 ?auto_67701 ) ) ( not ( = ?auto_67722 ?auto_67701 ) ) ( AVAILABLE ?auto_67701 ) ( SURFACE-AT ?auto_67716 ?auto_67709 ) ( ON ?auto_67716 ?auto_67705 ) ( CLEAR ?auto_67716 ) ( not ( = ?auto_67698 ?auto_67705 ) ) ( not ( = ?auto_67699 ?auto_67705 ) ) ( not ( = ?auto_67717 ?auto_67705 ) ) ( not ( = ?auto_67712 ?auto_67705 ) ) ( not ( = ?auto_67710 ?auto_67705 ) ) ( not ( = ?auto_67707 ?auto_67705 ) ) ( not ( = ?auto_67714 ?auto_67705 ) ) ( not ( = ?auto_67713 ?auto_67705 ) ) ( not ( = ?auto_67704 ?auto_67705 ) ) ( not ( = ?auto_67716 ?auto_67705 ) ) ( not ( = ?auto_67718 ?auto_67705 ) ) ( not ( = ?auto_67703 ?auto_67705 ) ) ( TRUCK-AT ?auto_67711 ?auto_67700 ) )
    :subtasks
    ( ( !DRIVE ?auto_67711 ?auto_67700 ?auto_67709 )
      ( MAKE-ON ?auto_67698 ?auto_67699 )
      ( MAKE-ON-VERIFY ?auto_67698 ?auto_67699 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_67724 - SURFACE
      ?auto_67725 - SURFACE
    )
    :vars
    (
      ?auto_67748 - HOIST
      ?auto_67729 - PLACE
      ?auto_67747 - PLACE
      ?auto_67742 - HOIST
      ?auto_67744 - SURFACE
      ?auto_67732 - SURFACE
      ?auto_67746 - PLACE
      ?auto_67728 - HOIST
      ?auto_67749 - SURFACE
      ?auto_67730 - SURFACE
      ?auto_67734 - PLACE
      ?auto_67738 - HOIST
      ?auto_67735 - SURFACE
      ?auto_67739 - SURFACE
      ?auto_67731 - SURFACE
      ?auto_67743 - SURFACE
      ?auto_67727 - PLACE
      ?auto_67733 - HOIST
      ?auto_67745 - SURFACE
      ?auto_67726 - SURFACE
      ?auto_67737 - PLACE
      ?auto_67736 - HOIST
      ?auto_67741 - SURFACE
      ?auto_67740 - TRUCK
      ?auto_67750 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_67748 ?auto_67729 ) ( IS-CRATE ?auto_67724 ) ( not ( = ?auto_67724 ?auto_67725 ) ) ( not ( = ?auto_67747 ?auto_67729 ) ) ( HOIST-AT ?auto_67742 ?auto_67747 ) ( not ( = ?auto_67748 ?auto_67742 ) ) ( AVAILABLE ?auto_67742 ) ( SURFACE-AT ?auto_67724 ?auto_67747 ) ( ON ?auto_67724 ?auto_67744 ) ( CLEAR ?auto_67724 ) ( not ( = ?auto_67724 ?auto_67744 ) ) ( not ( = ?auto_67725 ?auto_67744 ) ) ( IS-CRATE ?auto_67725 ) ( not ( = ?auto_67724 ?auto_67732 ) ) ( not ( = ?auto_67725 ?auto_67732 ) ) ( not ( = ?auto_67744 ?auto_67732 ) ) ( not ( = ?auto_67746 ?auto_67729 ) ) ( not ( = ?auto_67747 ?auto_67746 ) ) ( HOIST-AT ?auto_67728 ?auto_67746 ) ( not ( = ?auto_67748 ?auto_67728 ) ) ( not ( = ?auto_67742 ?auto_67728 ) ) ( AVAILABLE ?auto_67728 ) ( SURFACE-AT ?auto_67725 ?auto_67746 ) ( ON ?auto_67725 ?auto_67749 ) ( CLEAR ?auto_67725 ) ( not ( = ?auto_67724 ?auto_67749 ) ) ( not ( = ?auto_67725 ?auto_67749 ) ) ( not ( = ?auto_67744 ?auto_67749 ) ) ( not ( = ?auto_67732 ?auto_67749 ) ) ( IS-CRATE ?auto_67732 ) ( not ( = ?auto_67724 ?auto_67730 ) ) ( not ( = ?auto_67725 ?auto_67730 ) ) ( not ( = ?auto_67744 ?auto_67730 ) ) ( not ( = ?auto_67732 ?auto_67730 ) ) ( not ( = ?auto_67749 ?auto_67730 ) ) ( not ( = ?auto_67734 ?auto_67729 ) ) ( not ( = ?auto_67747 ?auto_67734 ) ) ( not ( = ?auto_67746 ?auto_67734 ) ) ( HOIST-AT ?auto_67738 ?auto_67734 ) ( not ( = ?auto_67748 ?auto_67738 ) ) ( not ( = ?auto_67742 ?auto_67738 ) ) ( not ( = ?auto_67728 ?auto_67738 ) ) ( SURFACE-AT ?auto_67732 ?auto_67734 ) ( ON ?auto_67732 ?auto_67735 ) ( CLEAR ?auto_67732 ) ( not ( = ?auto_67724 ?auto_67735 ) ) ( not ( = ?auto_67725 ?auto_67735 ) ) ( not ( = ?auto_67744 ?auto_67735 ) ) ( not ( = ?auto_67732 ?auto_67735 ) ) ( not ( = ?auto_67749 ?auto_67735 ) ) ( not ( = ?auto_67730 ?auto_67735 ) ) ( IS-CRATE ?auto_67730 ) ( not ( = ?auto_67724 ?auto_67739 ) ) ( not ( = ?auto_67725 ?auto_67739 ) ) ( not ( = ?auto_67744 ?auto_67739 ) ) ( not ( = ?auto_67732 ?auto_67739 ) ) ( not ( = ?auto_67749 ?auto_67739 ) ) ( not ( = ?auto_67730 ?auto_67739 ) ) ( not ( = ?auto_67735 ?auto_67739 ) ) ( AVAILABLE ?auto_67738 ) ( SURFACE-AT ?auto_67730 ?auto_67734 ) ( ON ?auto_67730 ?auto_67731 ) ( CLEAR ?auto_67730 ) ( not ( = ?auto_67724 ?auto_67731 ) ) ( not ( = ?auto_67725 ?auto_67731 ) ) ( not ( = ?auto_67744 ?auto_67731 ) ) ( not ( = ?auto_67732 ?auto_67731 ) ) ( not ( = ?auto_67749 ?auto_67731 ) ) ( not ( = ?auto_67730 ?auto_67731 ) ) ( not ( = ?auto_67735 ?auto_67731 ) ) ( not ( = ?auto_67739 ?auto_67731 ) ) ( IS-CRATE ?auto_67739 ) ( not ( = ?auto_67724 ?auto_67743 ) ) ( not ( = ?auto_67725 ?auto_67743 ) ) ( not ( = ?auto_67744 ?auto_67743 ) ) ( not ( = ?auto_67732 ?auto_67743 ) ) ( not ( = ?auto_67749 ?auto_67743 ) ) ( not ( = ?auto_67730 ?auto_67743 ) ) ( not ( = ?auto_67735 ?auto_67743 ) ) ( not ( = ?auto_67739 ?auto_67743 ) ) ( not ( = ?auto_67731 ?auto_67743 ) ) ( not ( = ?auto_67727 ?auto_67729 ) ) ( not ( = ?auto_67747 ?auto_67727 ) ) ( not ( = ?auto_67746 ?auto_67727 ) ) ( not ( = ?auto_67734 ?auto_67727 ) ) ( HOIST-AT ?auto_67733 ?auto_67727 ) ( not ( = ?auto_67748 ?auto_67733 ) ) ( not ( = ?auto_67742 ?auto_67733 ) ) ( not ( = ?auto_67728 ?auto_67733 ) ) ( not ( = ?auto_67738 ?auto_67733 ) ) ( AVAILABLE ?auto_67733 ) ( SURFACE-AT ?auto_67739 ?auto_67727 ) ( ON ?auto_67739 ?auto_67745 ) ( CLEAR ?auto_67739 ) ( not ( = ?auto_67724 ?auto_67745 ) ) ( not ( = ?auto_67725 ?auto_67745 ) ) ( not ( = ?auto_67744 ?auto_67745 ) ) ( not ( = ?auto_67732 ?auto_67745 ) ) ( not ( = ?auto_67749 ?auto_67745 ) ) ( not ( = ?auto_67730 ?auto_67745 ) ) ( not ( = ?auto_67735 ?auto_67745 ) ) ( not ( = ?auto_67739 ?auto_67745 ) ) ( not ( = ?auto_67731 ?auto_67745 ) ) ( not ( = ?auto_67743 ?auto_67745 ) ) ( IS-CRATE ?auto_67743 ) ( not ( = ?auto_67724 ?auto_67726 ) ) ( not ( = ?auto_67725 ?auto_67726 ) ) ( not ( = ?auto_67744 ?auto_67726 ) ) ( not ( = ?auto_67732 ?auto_67726 ) ) ( not ( = ?auto_67749 ?auto_67726 ) ) ( not ( = ?auto_67730 ?auto_67726 ) ) ( not ( = ?auto_67735 ?auto_67726 ) ) ( not ( = ?auto_67739 ?auto_67726 ) ) ( not ( = ?auto_67731 ?auto_67726 ) ) ( not ( = ?auto_67743 ?auto_67726 ) ) ( not ( = ?auto_67745 ?auto_67726 ) ) ( not ( = ?auto_67737 ?auto_67729 ) ) ( not ( = ?auto_67747 ?auto_67737 ) ) ( not ( = ?auto_67746 ?auto_67737 ) ) ( not ( = ?auto_67734 ?auto_67737 ) ) ( not ( = ?auto_67727 ?auto_67737 ) ) ( HOIST-AT ?auto_67736 ?auto_67737 ) ( not ( = ?auto_67748 ?auto_67736 ) ) ( not ( = ?auto_67742 ?auto_67736 ) ) ( not ( = ?auto_67728 ?auto_67736 ) ) ( not ( = ?auto_67738 ?auto_67736 ) ) ( not ( = ?auto_67733 ?auto_67736 ) ) ( AVAILABLE ?auto_67736 ) ( SURFACE-AT ?auto_67743 ?auto_67737 ) ( ON ?auto_67743 ?auto_67741 ) ( CLEAR ?auto_67743 ) ( not ( = ?auto_67724 ?auto_67741 ) ) ( not ( = ?auto_67725 ?auto_67741 ) ) ( not ( = ?auto_67744 ?auto_67741 ) ) ( not ( = ?auto_67732 ?auto_67741 ) ) ( not ( = ?auto_67749 ?auto_67741 ) ) ( not ( = ?auto_67730 ?auto_67741 ) ) ( not ( = ?auto_67735 ?auto_67741 ) ) ( not ( = ?auto_67739 ?auto_67741 ) ) ( not ( = ?auto_67731 ?auto_67741 ) ) ( not ( = ?auto_67743 ?auto_67741 ) ) ( not ( = ?auto_67745 ?auto_67741 ) ) ( not ( = ?auto_67726 ?auto_67741 ) ) ( TRUCK-AT ?auto_67740 ?auto_67729 ) ( SURFACE-AT ?auto_67750 ?auto_67729 ) ( CLEAR ?auto_67750 ) ( LIFTING ?auto_67748 ?auto_67726 ) ( IS-CRATE ?auto_67726 ) ( not ( = ?auto_67724 ?auto_67750 ) ) ( not ( = ?auto_67725 ?auto_67750 ) ) ( not ( = ?auto_67744 ?auto_67750 ) ) ( not ( = ?auto_67732 ?auto_67750 ) ) ( not ( = ?auto_67749 ?auto_67750 ) ) ( not ( = ?auto_67730 ?auto_67750 ) ) ( not ( = ?auto_67735 ?auto_67750 ) ) ( not ( = ?auto_67739 ?auto_67750 ) ) ( not ( = ?auto_67731 ?auto_67750 ) ) ( not ( = ?auto_67743 ?auto_67750 ) ) ( not ( = ?auto_67745 ?auto_67750 ) ) ( not ( = ?auto_67726 ?auto_67750 ) ) ( not ( = ?auto_67741 ?auto_67750 ) ) )
    :subtasks
    ( ( !DROP ?auto_67748 ?auto_67726 ?auto_67750 ?auto_67729 )
      ( MAKE-ON ?auto_67724 ?auto_67725 )
      ( MAKE-ON-VERIFY ?auto_67724 ?auto_67725 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_67751 - SURFACE
      ?auto_67752 - SURFACE
    )
    :vars
    (
      ?auto_67756 - HOIST
      ?auto_67765 - PLACE
      ?auto_67759 - PLACE
      ?auto_67763 - HOIST
      ?auto_67760 - SURFACE
      ?auto_67754 - SURFACE
      ?auto_67758 - PLACE
      ?auto_67775 - HOIST
      ?auto_67762 - SURFACE
      ?auto_67768 - SURFACE
      ?auto_67769 - PLACE
      ?auto_67753 - HOIST
      ?auto_67774 - SURFACE
      ?auto_67772 - SURFACE
      ?auto_67776 - SURFACE
      ?auto_67764 - SURFACE
      ?auto_67766 - PLACE
      ?auto_67773 - HOIST
      ?auto_67761 - SURFACE
      ?auto_67770 - SURFACE
      ?auto_67757 - PLACE
      ?auto_67777 - HOIST
      ?auto_67755 - SURFACE
      ?auto_67767 - TRUCK
      ?auto_67771 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_67756 ?auto_67765 ) ( IS-CRATE ?auto_67751 ) ( not ( = ?auto_67751 ?auto_67752 ) ) ( not ( = ?auto_67759 ?auto_67765 ) ) ( HOIST-AT ?auto_67763 ?auto_67759 ) ( not ( = ?auto_67756 ?auto_67763 ) ) ( AVAILABLE ?auto_67763 ) ( SURFACE-AT ?auto_67751 ?auto_67759 ) ( ON ?auto_67751 ?auto_67760 ) ( CLEAR ?auto_67751 ) ( not ( = ?auto_67751 ?auto_67760 ) ) ( not ( = ?auto_67752 ?auto_67760 ) ) ( IS-CRATE ?auto_67752 ) ( not ( = ?auto_67751 ?auto_67754 ) ) ( not ( = ?auto_67752 ?auto_67754 ) ) ( not ( = ?auto_67760 ?auto_67754 ) ) ( not ( = ?auto_67758 ?auto_67765 ) ) ( not ( = ?auto_67759 ?auto_67758 ) ) ( HOIST-AT ?auto_67775 ?auto_67758 ) ( not ( = ?auto_67756 ?auto_67775 ) ) ( not ( = ?auto_67763 ?auto_67775 ) ) ( AVAILABLE ?auto_67775 ) ( SURFACE-AT ?auto_67752 ?auto_67758 ) ( ON ?auto_67752 ?auto_67762 ) ( CLEAR ?auto_67752 ) ( not ( = ?auto_67751 ?auto_67762 ) ) ( not ( = ?auto_67752 ?auto_67762 ) ) ( not ( = ?auto_67760 ?auto_67762 ) ) ( not ( = ?auto_67754 ?auto_67762 ) ) ( IS-CRATE ?auto_67754 ) ( not ( = ?auto_67751 ?auto_67768 ) ) ( not ( = ?auto_67752 ?auto_67768 ) ) ( not ( = ?auto_67760 ?auto_67768 ) ) ( not ( = ?auto_67754 ?auto_67768 ) ) ( not ( = ?auto_67762 ?auto_67768 ) ) ( not ( = ?auto_67769 ?auto_67765 ) ) ( not ( = ?auto_67759 ?auto_67769 ) ) ( not ( = ?auto_67758 ?auto_67769 ) ) ( HOIST-AT ?auto_67753 ?auto_67769 ) ( not ( = ?auto_67756 ?auto_67753 ) ) ( not ( = ?auto_67763 ?auto_67753 ) ) ( not ( = ?auto_67775 ?auto_67753 ) ) ( SURFACE-AT ?auto_67754 ?auto_67769 ) ( ON ?auto_67754 ?auto_67774 ) ( CLEAR ?auto_67754 ) ( not ( = ?auto_67751 ?auto_67774 ) ) ( not ( = ?auto_67752 ?auto_67774 ) ) ( not ( = ?auto_67760 ?auto_67774 ) ) ( not ( = ?auto_67754 ?auto_67774 ) ) ( not ( = ?auto_67762 ?auto_67774 ) ) ( not ( = ?auto_67768 ?auto_67774 ) ) ( IS-CRATE ?auto_67768 ) ( not ( = ?auto_67751 ?auto_67772 ) ) ( not ( = ?auto_67752 ?auto_67772 ) ) ( not ( = ?auto_67760 ?auto_67772 ) ) ( not ( = ?auto_67754 ?auto_67772 ) ) ( not ( = ?auto_67762 ?auto_67772 ) ) ( not ( = ?auto_67768 ?auto_67772 ) ) ( not ( = ?auto_67774 ?auto_67772 ) ) ( AVAILABLE ?auto_67753 ) ( SURFACE-AT ?auto_67768 ?auto_67769 ) ( ON ?auto_67768 ?auto_67776 ) ( CLEAR ?auto_67768 ) ( not ( = ?auto_67751 ?auto_67776 ) ) ( not ( = ?auto_67752 ?auto_67776 ) ) ( not ( = ?auto_67760 ?auto_67776 ) ) ( not ( = ?auto_67754 ?auto_67776 ) ) ( not ( = ?auto_67762 ?auto_67776 ) ) ( not ( = ?auto_67768 ?auto_67776 ) ) ( not ( = ?auto_67774 ?auto_67776 ) ) ( not ( = ?auto_67772 ?auto_67776 ) ) ( IS-CRATE ?auto_67772 ) ( not ( = ?auto_67751 ?auto_67764 ) ) ( not ( = ?auto_67752 ?auto_67764 ) ) ( not ( = ?auto_67760 ?auto_67764 ) ) ( not ( = ?auto_67754 ?auto_67764 ) ) ( not ( = ?auto_67762 ?auto_67764 ) ) ( not ( = ?auto_67768 ?auto_67764 ) ) ( not ( = ?auto_67774 ?auto_67764 ) ) ( not ( = ?auto_67772 ?auto_67764 ) ) ( not ( = ?auto_67776 ?auto_67764 ) ) ( not ( = ?auto_67766 ?auto_67765 ) ) ( not ( = ?auto_67759 ?auto_67766 ) ) ( not ( = ?auto_67758 ?auto_67766 ) ) ( not ( = ?auto_67769 ?auto_67766 ) ) ( HOIST-AT ?auto_67773 ?auto_67766 ) ( not ( = ?auto_67756 ?auto_67773 ) ) ( not ( = ?auto_67763 ?auto_67773 ) ) ( not ( = ?auto_67775 ?auto_67773 ) ) ( not ( = ?auto_67753 ?auto_67773 ) ) ( AVAILABLE ?auto_67773 ) ( SURFACE-AT ?auto_67772 ?auto_67766 ) ( ON ?auto_67772 ?auto_67761 ) ( CLEAR ?auto_67772 ) ( not ( = ?auto_67751 ?auto_67761 ) ) ( not ( = ?auto_67752 ?auto_67761 ) ) ( not ( = ?auto_67760 ?auto_67761 ) ) ( not ( = ?auto_67754 ?auto_67761 ) ) ( not ( = ?auto_67762 ?auto_67761 ) ) ( not ( = ?auto_67768 ?auto_67761 ) ) ( not ( = ?auto_67774 ?auto_67761 ) ) ( not ( = ?auto_67772 ?auto_67761 ) ) ( not ( = ?auto_67776 ?auto_67761 ) ) ( not ( = ?auto_67764 ?auto_67761 ) ) ( IS-CRATE ?auto_67764 ) ( not ( = ?auto_67751 ?auto_67770 ) ) ( not ( = ?auto_67752 ?auto_67770 ) ) ( not ( = ?auto_67760 ?auto_67770 ) ) ( not ( = ?auto_67754 ?auto_67770 ) ) ( not ( = ?auto_67762 ?auto_67770 ) ) ( not ( = ?auto_67768 ?auto_67770 ) ) ( not ( = ?auto_67774 ?auto_67770 ) ) ( not ( = ?auto_67772 ?auto_67770 ) ) ( not ( = ?auto_67776 ?auto_67770 ) ) ( not ( = ?auto_67764 ?auto_67770 ) ) ( not ( = ?auto_67761 ?auto_67770 ) ) ( not ( = ?auto_67757 ?auto_67765 ) ) ( not ( = ?auto_67759 ?auto_67757 ) ) ( not ( = ?auto_67758 ?auto_67757 ) ) ( not ( = ?auto_67769 ?auto_67757 ) ) ( not ( = ?auto_67766 ?auto_67757 ) ) ( HOIST-AT ?auto_67777 ?auto_67757 ) ( not ( = ?auto_67756 ?auto_67777 ) ) ( not ( = ?auto_67763 ?auto_67777 ) ) ( not ( = ?auto_67775 ?auto_67777 ) ) ( not ( = ?auto_67753 ?auto_67777 ) ) ( not ( = ?auto_67773 ?auto_67777 ) ) ( AVAILABLE ?auto_67777 ) ( SURFACE-AT ?auto_67764 ?auto_67757 ) ( ON ?auto_67764 ?auto_67755 ) ( CLEAR ?auto_67764 ) ( not ( = ?auto_67751 ?auto_67755 ) ) ( not ( = ?auto_67752 ?auto_67755 ) ) ( not ( = ?auto_67760 ?auto_67755 ) ) ( not ( = ?auto_67754 ?auto_67755 ) ) ( not ( = ?auto_67762 ?auto_67755 ) ) ( not ( = ?auto_67768 ?auto_67755 ) ) ( not ( = ?auto_67774 ?auto_67755 ) ) ( not ( = ?auto_67772 ?auto_67755 ) ) ( not ( = ?auto_67776 ?auto_67755 ) ) ( not ( = ?auto_67764 ?auto_67755 ) ) ( not ( = ?auto_67761 ?auto_67755 ) ) ( not ( = ?auto_67770 ?auto_67755 ) ) ( TRUCK-AT ?auto_67767 ?auto_67765 ) ( SURFACE-AT ?auto_67771 ?auto_67765 ) ( CLEAR ?auto_67771 ) ( IS-CRATE ?auto_67770 ) ( not ( = ?auto_67751 ?auto_67771 ) ) ( not ( = ?auto_67752 ?auto_67771 ) ) ( not ( = ?auto_67760 ?auto_67771 ) ) ( not ( = ?auto_67754 ?auto_67771 ) ) ( not ( = ?auto_67762 ?auto_67771 ) ) ( not ( = ?auto_67768 ?auto_67771 ) ) ( not ( = ?auto_67774 ?auto_67771 ) ) ( not ( = ?auto_67772 ?auto_67771 ) ) ( not ( = ?auto_67776 ?auto_67771 ) ) ( not ( = ?auto_67764 ?auto_67771 ) ) ( not ( = ?auto_67761 ?auto_67771 ) ) ( not ( = ?auto_67770 ?auto_67771 ) ) ( not ( = ?auto_67755 ?auto_67771 ) ) ( AVAILABLE ?auto_67756 ) ( IN ?auto_67770 ?auto_67767 ) )
    :subtasks
    ( ( !UNLOAD ?auto_67756 ?auto_67770 ?auto_67767 ?auto_67765 )
      ( MAKE-ON ?auto_67751 ?auto_67752 )
      ( MAKE-ON-VERIFY ?auto_67751 ?auto_67752 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_67778 - SURFACE
      ?auto_67779 - SURFACE
    )
    :vars
    (
      ?auto_67797 - HOIST
      ?auto_67800 - PLACE
      ?auto_67804 - PLACE
      ?auto_67782 - HOIST
      ?auto_67802 - SURFACE
      ?auto_67803 - SURFACE
      ?auto_67801 - PLACE
      ?auto_67793 - HOIST
      ?auto_67784 - SURFACE
      ?auto_67794 - SURFACE
      ?auto_67787 - PLACE
      ?auto_67783 - HOIST
      ?auto_67792 - SURFACE
      ?auto_67790 - SURFACE
      ?auto_67798 - SURFACE
      ?auto_67781 - SURFACE
      ?auto_67785 - PLACE
      ?auto_67791 - HOIST
      ?auto_67796 - SURFACE
      ?auto_67788 - SURFACE
      ?auto_67795 - PLACE
      ?auto_67799 - HOIST
      ?auto_67780 - SURFACE
      ?auto_67789 - SURFACE
      ?auto_67786 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_67797 ?auto_67800 ) ( IS-CRATE ?auto_67778 ) ( not ( = ?auto_67778 ?auto_67779 ) ) ( not ( = ?auto_67804 ?auto_67800 ) ) ( HOIST-AT ?auto_67782 ?auto_67804 ) ( not ( = ?auto_67797 ?auto_67782 ) ) ( AVAILABLE ?auto_67782 ) ( SURFACE-AT ?auto_67778 ?auto_67804 ) ( ON ?auto_67778 ?auto_67802 ) ( CLEAR ?auto_67778 ) ( not ( = ?auto_67778 ?auto_67802 ) ) ( not ( = ?auto_67779 ?auto_67802 ) ) ( IS-CRATE ?auto_67779 ) ( not ( = ?auto_67778 ?auto_67803 ) ) ( not ( = ?auto_67779 ?auto_67803 ) ) ( not ( = ?auto_67802 ?auto_67803 ) ) ( not ( = ?auto_67801 ?auto_67800 ) ) ( not ( = ?auto_67804 ?auto_67801 ) ) ( HOIST-AT ?auto_67793 ?auto_67801 ) ( not ( = ?auto_67797 ?auto_67793 ) ) ( not ( = ?auto_67782 ?auto_67793 ) ) ( AVAILABLE ?auto_67793 ) ( SURFACE-AT ?auto_67779 ?auto_67801 ) ( ON ?auto_67779 ?auto_67784 ) ( CLEAR ?auto_67779 ) ( not ( = ?auto_67778 ?auto_67784 ) ) ( not ( = ?auto_67779 ?auto_67784 ) ) ( not ( = ?auto_67802 ?auto_67784 ) ) ( not ( = ?auto_67803 ?auto_67784 ) ) ( IS-CRATE ?auto_67803 ) ( not ( = ?auto_67778 ?auto_67794 ) ) ( not ( = ?auto_67779 ?auto_67794 ) ) ( not ( = ?auto_67802 ?auto_67794 ) ) ( not ( = ?auto_67803 ?auto_67794 ) ) ( not ( = ?auto_67784 ?auto_67794 ) ) ( not ( = ?auto_67787 ?auto_67800 ) ) ( not ( = ?auto_67804 ?auto_67787 ) ) ( not ( = ?auto_67801 ?auto_67787 ) ) ( HOIST-AT ?auto_67783 ?auto_67787 ) ( not ( = ?auto_67797 ?auto_67783 ) ) ( not ( = ?auto_67782 ?auto_67783 ) ) ( not ( = ?auto_67793 ?auto_67783 ) ) ( SURFACE-AT ?auto_67803 ?auto_67787 ) ( ON ?auto_67803 ?auto_67792 ) ( CLEAR ?auto_67803 ) ( not ( = ?auto_67778 ?auto_67792 ) ) ( not ( = ?auto_67779 ?auto_67792 ) ) ( not ( = ?auto_67802 ?auto_67792 ) ) ( not ( = ?auto_67803 ?auto_67792 ) ) ( not ( = ?auto_67784 ?auto_67792 ) ) ( not ( = ?auto_67794 ?auto_67792 ) ) ( IS-CRATE ?auto_67794 ) ( not ( = ?auto_67778 ?auto_67790 ) ) ( not ( = ?auto_67779 ?auto_67790 ) ) ( not ( = ?auto_67802 ?auto_67790 ) ) ( not ( = ?auto_67803 ?auto_67790 ) ) ( not ( = ?auto_67784 ?auto_67790 ) ) ( not ( = ?auto_67794 ?auto_67790 ) ) ( not ( = ?auto_67792 ?auto_67790 ) ) ( AVAILABLE ?auto_67783 ) ( SURFACE-AT ?auto_67794 ?auto_67787 ) ( ON ?auto_67794 ?auto_67798 ) ( CLEAR ?auto_67794 ) ( not ( = ?auto_67778 ?auto_67798 ) ) ( not ( = ?auto_67779 ?auto_67798 ) ) ( not ( = ?auto_67802 ?auto_67798 ) ) ( not ( = ?auto_67803 ?auto_67798 ) ) ( not ( = ?auto_67784 ?auto_67798 ) ) ( not ( = ?auto_67794 ?auto_67798 ) ) ( not ( = ?auto_67792 ?auto_67798 ) ) ( not ( = ?auto_67790 ?auto_67798 ) ) ( IS-CRATE ?auto_67790 ) ( not ( = ?auto_67778 ?auto_67781 ) ) ( not ( = ?auto_67779 ?auto_67781 ) ) ( not ( = ?auto_67802 ?auto_67781 ) ) ( not ( = ?auto_67803 ?auto_67781 ) ) ( not ( = ?auto_67784 ?auto_67781 ) ) ( not ( = ?auto_67794 ?auto_67781 ) ) ( not ( = ?auto_67792 ?auto_67781 ) ) ( not ( = ?auto_67790 ?auto_67781 ) ) ( not ( = ?auto_67798 ?auto_67781 ) ) ( not ( = ?auto_67785 ?auto_67800 ) ) ( not ( = ?auto_67804 ?auto_67785 ) ) ( not ( = ?auto_67801 ?auto_67785 ) ) ( not ( = ?auto_67787 ?auto_67785 ) ) ( HOIST-AT ?auto_67791 ?auto_67785 ) ( not ( = ?auto_67797 ?auto_67791 ) ) ( not ( = ?auto_67782 ?auto_67791 ) ) ( not ( = ?auto_67793 ?auto_67791 ) ) ( not ( = ?auto_67783 ?auto_67791 ) ) ( AVAILABLE ?auto_67791 ) ( SURFACE-AT ?auto_67790 ?auto_67785 ) ( ON ?auto_67790 ?auto_67796 ) ( CLEAR ?auto_67790 ) ( not ( = ?auto_67778 ?auto_67796 ) ) ( not ( = ?auto_67779 ?auto_67796 ) ) ( not ( = ?auto_67802 ?auto_67796 ) ) ( not ( = ?auto_67803 ?auto_67796 ) ) ( not ( = ?auto_67784 ?auto_67796 ) ) ( not ( = ?auto_67794 ?auto_67796 ) ) ( not ( = ?auto_67792 ?auto_67796 ) ) ( not ( = ?auto_67790 ?auto_67796 ) ) ( not ( = ?auto_67798 ?auto_67796 ) ) ( not ( = ?auto_67781 ?auto_67796 ) ) ( IS-CRATE ?auto_67781 ) ( not ( = ?auto_67778 ?auto_67788 ) ) ( not ( = ?auto_67779 ?auto_67788 ) ) ( not ( = ?auto_67802 ?auto_67788 ) ) ( not ( = ?auto_67803 ?auto_67788 ) ) ( not ( = ?auto_67784 ?auto_67788 ) ) ( not ( = ?auto_67794 ?auto_67788 ) ) ( not ( = ?auto_67792 ?auto_67788 ) ) ( not ( = ?auto_67790 ?auto_67788 ) ) ( not ( = ?auto_67798 ?auto_67788 ) ) ( not ( = ?auto_67781 ?auto_67788 ) ) ( not ( = ?auto_67796 ?auto_67788 ) ) ( not ( = ?auto_67795 ?auto_67800 ) ) ( not ( = ?auto_67804 ?auto_67795 ) ) ( not ( = ?auto_67801 ?auto_67795 ) ) ( not ( = ?auto_67787 ?auto_67795 ) ) ( not ( = ?auto_67785 ?auto_67795 ) ) ( HOIST-AT ?auto_67799 ?auto_67795 ) ( not ( = ?auto_67797 ?auto_67799 ) ) ( not ( = ?auto_67782 ?auto_67799 ) ) ( not ( = ?auto_67793 ?auto_67799 ) ) ( not ( = ?auto_67783 ?auto_67799 ) ) ( not ( = ?auto_67791 ?auto_67799 ) ) ( AVAILABLE ?auto_67799 ) ( SURFACE-AT ?auto_67781 ?auto_67795 ) ( ON ?auto_67781 ?auto_67780 ) ( CLEAR ?auto_67781 ) ( not ( = ?auto_67778 ?auto_67780 ) ) ( not ( = ?auto_67779 ?auto_67780 ) ) ( not ( = ?auto_67802 ?auto_67780 ) ) ( not ( = ?auto_67803 ?auto_67780 ) ) ( not ( = ?auto_67784 ?auto_67780 ) ) ( not ( = ?auto_67794 ?auto_67780 ) ) ( not ( = ?auto_67792 ?auto_67780 ) ) ( not ( = ?auto_67790 ?auto_67780 ) ) ( not ( = ?auto_67798 ?auto_67780 ) ) ( not ( = ?auto_67781 ?auto_67780 ) ) ( not ( = ?auto_67796 ?auto_67780 ) ) ( not ( = ?auto_67788 ?auto_67780 ) ) ( SURFACE-AT ?auto_67789 ?auto_67800 ) ( CLEAR ?auto_67789 ) ( IS-CRATE ?auto_67788 ) ( not ( = ?auto_67778 ?auto_67789 ) ) ( not ( = ?auto_67779 ?auto_67789 ) ) ( not ( = ?auto_67802 ?auto_67789 ) ) ( not ( = ?auto_67803 ?auto_67789 ) ) ( not ( = ?auto_67784 ?auto_67789 ) ) ( not ( = ?auto_67794 ?auto_67789 ) ) ( not ( = ?auto_67792 ?auto_67789 ) ) ( not ( = ?auto_67790 ?auto_67789 ) ) ( not ( = ?auto_67798 ?auto_67789 ) ) ( not ( = ?auto_67781 ?auto_67789 ) ) ( not ( = ?auto_67796 ?auto_67789 ) ) ( not ( = ?auto_67788 ?auto_67789 ) ) ( not ( = ?auto_67780 ?auto_67789 ) ) ( AVAILABLE ?auto_67797 ) ( IN ?auto_67788 ?auto_67786 ) ( TRUCK-AT ?auto_67786 ?auto_67801 ) )
    :subtasks
    ( ( !DRIVE ?auto_67786 ?auto_67801 ?auto_67800 )
      ( MAKE-ON ?auto_67778 ?auto_67779 )
      ( MAKE-ON-VERIFY ?auto_67778 ?auto_67779 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_67805 - SURFACE
      ?auto_67806 - SURFACE
    )
    :vars
    (
      ?auto_67828 - HOIST
      ?auto_67814 - PLACE
      ?auto_67824 - PLACE
      ?auto_67812 - HOIST
      ?auto_67813 - SURFACE
      ?auto_67825 - SURFACE
      ?auto_67810 - PLACE
      ?auto_67807 - HOIST
      ?auto_67823 - SURFACE
      ?auto_67829 - SURFACE
      ?auto_67808 - PLACE
      ?auto_67827 - HOIST
      ?auto_67819 - SURFACE
      ?auto_67822 - SURFACE
      ?auto_67811 - SURFACE
      ?auto_67826 - SURFACE
      ?auto_67820 - PLACE
      ?auto_67818 - HOIST
      ?auto_67809 - SURFACE
      ?auto_67821 - SURFACE
      ?auto_67831 - PLACE
      ?auto_67817 - HOIST
      ?auto_67815 - SURFACE
      ?auto_67816 - SURFACE
      ?auto_67830 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_67828 ?auto_67814 ) ( IS-CRATE ?auto_67805 ) ( not ( = ?auto_67805 ?auto_67806 ) ) ( not ( = ?auto_67824 ?auto_67814 ) ) ( HOIST-AT ?auto_67812 ?auto_67824 ) ( not ( = ?auto_67828 ?auto_67812 ) ) ( AVAILABLE ?auto_67812 ) ( SURFACE-AT ?auto_67805 ?auto_67824 ) ( ON ?auto_67805 ?auto_67813 ) ( CLEAR ?auto_67805 ) ( not ( = ?auto_67805 ?auto_67813 ) ) ( not ( = ?auto_67806 ?auto_67813 ) ) ( IS-CRATE ?auto_67806 ) ( not ( = ?auto_67805 ?auto_67825 ) ) ( not ( = ?auto_67806 ?auto_67825 ) ) ( not ( = ?auto_67813 ?auto_67825 ) ) ( not ( = ?auto_67810 ?auto_67814 ) ) ( not ( = ?auto_67824 ?auto_67810 ) ) ( HOIST-AT ?auto_67807 ?auto_67810 ) ( not ( = ?auto_67828 ?auto_67807 ) ) ( not ( = ?auto_67812 ?auto_67807 ) ) ( SURFACE-AT ?auto_67806 ?auto_67810 ) ( ON ?auto_67806 ?auto_67823 ) ( CLEAR ?auto_67806 ) ( not ( = ?auto_67805 ?auto_67823 ) ) ( not ( = ?auto_67806 ?auto_67823 ) ) ( not ( = ?auto_67813 ?auto_67823 ) ) ( not ( = ?auto_67825 ?auto_67823 ) ) ( IS-CRATE ?auto_67825 ) ( not ( = ?auto_67805 ?auto_67829 ) ) ( not ( = ?auto_67806 ?auto_67829 ) ) ( not ( = ?auto_67813 ?auto_67829 ) ) ( not ( = ?auto_67825 ?auto_67829 ) ) ( not ( = ?auto_67823 ?auto_67829 ) ) ( not ( = ?auto_67808 ?auto_67814 ) ) ( not ( = ?auto_67824 ?auto_67808 ) ) ( not ( = ?auto_67810 ?auto_67808 ) ) ( HOIST-AT ?auto_67827 ?auto_67808 ) ( not ( = ?auto_67828 ?auto_67827 ) ) ( not ( = ?auto_67812 ?auto_67827 ) ) ( not ( = ?auto_67807 ?auto_67827 ) ) ( SURFACE-AT ?auto_67825 ?auto_67808 ) ( ON ?auto_67825 ?auto_67819 ) ( CLEAR ?auto_67825 ) ( not ( = ?auto_67805 ?auto_67819 ) ) ( not ( = ?auto_67806 ?auto_67819 ) ) ( not ( = ?auto_67813 ?auto_67819 ) ) ( not ( = ?auto_67825 ?auto_67819 ) ) ( not ( = ?auto_67823 ?auto_67819 ) ) ( not ( = ?auto_67829 ?auto_67819 ) ) ( IS-CRATE ?auto_67829 ) ( not ( = ?auto_67805 ?auto_67822 ) ) ( not ( = ?auto_67806 ?auto_67822 ) ) ( not ( = ?auto_67813 ?auto_67822 ) ) ( not ( = ?auto_67825 ?auto_67822 ) ) ( not ( = ?auto_67823 ?auto_67822 ) ) ( not ( = ?auto_67829 ?auto_67822 ) ) ( not ( = ?auto_67819 ?auto_67822 ) ) ( AVAILABLE ?auto_67827 ) ( SURFACE-AT ?auto_67829 ?auto_67808 ) ( ON ?auto_67829 ?auto_67811 ) ( CLEAR ?auto_67829 ) ( not ( = ?auto_67805 ?auto_67811 ) ) ( not ( = ?auto_67806 ?auto_67811 ) ) ( not ( = ?auto_67813 ?auto_67811 ) ) ( not ( = ?auto_67825 ?auto_67811 ) ) ( not ( = ?auto_67823 ?auto_67811 ) ) ( not ( = ?auto_67829 ?auto_67811 ) ) ( not ( = ?auto_67819 ?auto_67811 ) ) ( not ( = ?auto_67822 ?auto_67811 ) ) ( IS-CRATE ?auto_67822 ) ( not ( = ?auto_67805 ?auto_67826 ) ) ( not ( = ?auto_67806 ?auto_67826 ) ) ( not ( = ?auto_67813 ?auto_67826 ) ) ( not ( = ?auto_67825 ?auto_67826 ) ) ( not ( = ?auto_67823 ?auto_67826 ) ) ( not ( = ?auto_67829 ?auto_67826 ) ) ( not ( = ?auto_67819 ?auto_67826 ) ) ( not ( = ?auto_67822 ?auto_67826 ) ) ( not ( = ?auto_67811 ?auto_67826 ) ) ( not ( = ?auto_67820 ?auto_67814 ) ) ( not ( = ?auto_67824 ?auto_67820 ) ) ( not ( = ?auto_67810 ?auto_67820 ) ) ( not ( = ?auto_67808 ?auto_67820 ) ) ( HOIST-AT ?auto_67818 ?auto_67820 ) ( not ( = ?auto_67828 ?auto_67818 ) ) ( not ( = ?auto_67812 ?auto_67818 ) ) ( not ( = ?auto_67807 ?auto_67818 ) ) ( not ( = ?auto_67827 ?auto_67818 ) ) ( AVAILABLE ?auto_67818 ) ( SURFACE-AT ?auto_67822 ?auto_67820 ) ( ON ?auto_67822 ?auto_67809 ) ( CLEAR ?auto_67822 ) ( not ( = ?auto_67805 ?auto_67809 ) ) ( not ( = ?auto_67806 ?auto_67809 ) ) ( not ( = ?auto_67813 ?auto_67809 ) ) ( not ( = ?auto_67825 ?auto_67809 ) ) ( not ( = ?auto_67823 ?auto_67809 ) ) ( not ( = ?auto_67829 ?auto_67809 ) ) ( not ( = ?auto_67819 ?auto_67809 ) ) ( not ( = ?auto_67822 ?auto_67809 ) ) ( not ( = ?auto_67811 ?auto_67809 ) ) ( not ( = ?auto_67826 ?auto_67809 ) ) ( IS-CRATE ?auto_67826 ) ( not ( = ?auto_67805 ?auto_67821 ) ) ( not ( = ?auto_67806 ?auto_67821 ) ) ( not ( = ?auto_67813 ?auto_67821 ) ) ( not ( = ?auto_67825 ?auto_67821 ) ) ( not ( = ?auto_67823 ?auto_67821 ) ) ( not ( = ?auto_67829 ?auto_67821 ) ) ( not ( = ?auto_67819 ?auto_67821 ) ) ( not ( = ?auto_67822 ?auto_67821 ) ) ( not ( = ?auto_67811 ?auto_67821 ) ) ( not ( = ?auto_67826 ?auto_67821 ) ) ( not ( = ?auto_67809 ?auto_67821 ) ) ( not ( = ?auto_67831 ?auto_67814 ) ) ( not ( = ?auto_67824 ?auto_67831 ) ) ( not ( = ?auto_67810 ?auto_67831 ) ) ( not ( = ?auto_67808 ?auto_67831 ) ) ( not ( = ?auto_67820 ?auto_67831 ) ) ( HOIST-AT ?auto_67817 ?auto_67831 ) ( not ( = ?auto_67828 ?auto_67817 ) ) ( not ( = ?auto_67812 ?auto_67817 ) ) ( not ( = ?auto_67807 ?auto_67817 ) ) ( not ( = ?auto_67827 ?auto_67817 ) ) ( not ( = ?auto_67818 ?auto_67817 ) ) ( AVAILABLE ?auto_67817 ) ( SURFACE-AT ?auto_67826 ?auto_67831 ) ( ON ?auto_67826 ?auto_67815 ) ( CLEAR ?auto_67826 ) ( not ( = ?auto_67805 ?auto_67815 ) ) ( not ( = ?auto_67806 ?auto_67815 ) ) ( not ( = ?auto_67813 ?auto_67815 ) ) ( not ( = ?auto_67825 ?auto_67815 ) ) ( not ( = ?auto_67823 ?auto_67815 ) ) ( not ( = ?auto_67829 ?auto_67815 ) ) ( not ( = ?auto_67819 ?auto_67815 ) ) ( not ( = ?auto_67822 ?auto_67815 ) ) ( not ( = ?auto_67811 ?auto_67815 ) ) ( not ( = ?auto_67826 ?auto_67815 ) ) ( not ( = ?auto_67809 ?auto_67815 ) ) ( not ( = ?auto_67821 ?auto_67815 ) ) ( SURFACE-AT ?auto_67816 ?auto_67814 ) ( CLEAR ?auto_67816 ) ( IS-CRATE ?auto_67821 ) ( not ( = ?auto_67805 ?auto_67816 ) ) ( not ( = ?auto_67806 ?auto_67816 ) ) ( not ( = ?auto_67813 ?auto_67816 ) ) ( not ( = ?auto_67825 ?auto_67816 ) ) ( not ( = ?auto_67823 ?auto_67816 ) ) ( not ( = ?auto_67829 ?auto_67816 ) ) ( not ( = ?auto_67819 ?auto_67816 ) ) ( not ( = ?auto_67822 ?auto_67816 ) ) ( not ( = ?auto_67811 ?auto_67816 ) ) ( not ( = ?auto_67826 ?auto_67816 ) ) ( not ( = ?auto_67809 ?auto_67816 ) ) ( not ( = ?auto_67821 ?auto_67816 ) ) ( not ( = ?auto_67815 ?auto_67816 ) ) ( AVAILABLE ?auto_67828 ) ( TRUCK-AT ?auto_67830 ?auto_67810 ) ( LIFTING ?auto_67807 ?auto_67821 ) )
    :subtasks
    ( ( !LOAD ?auto_67807 ?auto_67821 ?auto_67830 ?auto_67810 )
      ( MAKE-ON ?auto_67805 ?auto_67806 )
      ( MAKE-ON-VERIFY ?auto_67805 ?auto_67806 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_67832 - SURFACE
      ?auto_67833 - SURFACE
    )
    :vars
    (
      ?auto_67842 - HOIST
      ?auto_67856 - PLACE
      ?auto_67838 - PLACE
      ?auto_67847 - HOIST
      ?auto_67836 - SURFACE
      ?auto_67839 - SURFACE
      ?auto_67852 - PLACE
      ?auto_67857 - HOIST
      ?auto_67837 - SURFACE
      ?auto_67843 - SURFACE
      ?auto_67848 - PLACE
      ?auto_67841 - HOIST
      ?auto_67853 - SURFACE
      ?auto_67844 - SURFACE
      ?auto_67850 - SURFACE
      ?auto_67840 - SURFACE
      ?auto_67851 - PLACE
      ?auto_67849 - HOIST
      ?auto_67855 - SURFACE
      ?auto_67845 - SURFACE
      ?auto_67858 - PLACE
      ?auto_67846 - HOIST
      ?auto_67834 - SURFACE
      ?auto_67854 - SURFACE
      ?auto_67835 - TRUCK
      ?auto_67859 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_67842 ?auto_67856 ) ( IS-CRATE ?auto_67832 ) ( not ( = ?auto_67832 ?auto_67833 ) ) ( not ( = ?auto_67838 ?auto_67856 ) ) ( HOIST-AT ?auto_67847 ?auto_67838 ) ( not ( = ?auto_67842 ?auto_67847 ) ) ( AVAILABLE ?auto_67847 ) ( SURFACE-AT ?auto_67832 ?auto_67838 ) ( ON ?auto_67832 ?auto_67836 ) ( CLEAR ?auto_67832 ) ( not ( = ?auto_67832 ?auto_67836 ) ) ( not ( = ?auto_67833 ?auto_67836 ) ) ( IS-CRATE ?auto_67833 ) ( not ( = ?auto_67832 ?auto_67839 ) ) ( not ( = ?auto_67833 ?auto_67839 ) ) ( not ( = ?auto_67836 ?auto_67839 ) ) ( not ( = ?auto_67852 ?auto_67856 ) ) ( not ( = ?auto_67838 ?auto_67852 ) ) ( HOIST-AT ?auto_67857 ?auto_67852 ) ( not ( = ?auto_67842 ?auto_67857 ) ) ( not ( = ?auto_67847 ?auto_67857 ) ) ( SURFACE-AT ?auto_67833 ?auto_67852 ) ( ON ?auto_67833 ?auto_67837 ) ( CLEAR ?auto_67833 ) ( not ( = ?auto_67832 ?auto_67837 ) ) ( not ( = ?auto_67833 ?auto_67837 ) ) ( not ( = ?auto_67836 ?auto_67837 ) ) ( not ( = ?auto_67839 ?auto_67837 ) ) ( IS-CRATE ?auto_67839 ) ( not ( = ?auto_67832 ?auto_67843 ) ) ( not ( = ?auto_67833 ?auto_67843 ) ) ( not ( = ?auto_67836 ?auto_67843 ) ) ( not ( = ?auto_67839 ?auto_67843 ) ) ( not ( = ?auto_67837 ?auto_67843 ) ) ( not ( = ?auto_67848 ?auto_67856 ) ) ( not ( = ?auto_67838 ?auto_67848 ) ) ( not ( = ?auto_67852 ?auto_67848 ) ) ( HOIST-AT ?auto_67841 ?auto_67848 ) ( not ( = ?auto_67842 ?auto_67841 ) ) ( not ( = ?auto_67847 ?auto_67841 ) ) ( not ( = ?auto_67857 ?auto_67841 ) ) ( SURFACE-AT ?auto_67839 ?auto_67848 ) ( ON ?auto_67839 ?auto_67853 ) ( CLEAR ?auto_67839 ) ( not ( = ?auto_67832 ?auto_67853 ) ) ( not ( = ?auto_67833 ?auto_67853 ) ) ( not ( = ?auto_67836 ?auto_67853 ) ) ( not ( = ?auto_67839 ?auto_67853 ) ) ( not ( = ?auto_67837 ?auto_67853 ) ) ( not ( = ?auto_67843 ?auto_67853 ) ) ( IS-CRATE ?auto_67843 ) ( not ( = ?auto_67832 ?auto_67844 ) ) ( not ( = ?auto_67833 ?auto_67844 ) ) ( not ( = ?auto_67836 ?auto_67844 ) ) ( not ( = ?auto_67839 ?auto_67844 ) ) ( not ( = ?auto_67837 ?auto_67844 ) ) ( not ( = ?auto_67843 ?auto_67844 ) ) ( not ( = ?auto_67853 ?auto_67844 ) ) ( AVAILABLE ?auto_67841 ) ( SURFACE-AT ?auto_67843 ?auto_67848 ) ( ON ?auto_67843 ?auto_67850 ) ( CLEAR ?auto_67843 ) ( not ( = ?auto_67832 ?auto_67850 ) ) ( not ( = ?auto_67833 ?auto_67850 ) ) ( not ( = ?auto_67836 ?auto_67850 ) ) ( not ( = ?auto_67839 ?auto_67850 ) ) ( not ( = ?auto_67837 ?auto_67850 ) ) ( not ( = ?auto_67843 ?auto_67850 ) ) ( not ( = ?auto_67853 ?auto_67850 ) ) ( not ( = ?auto_67844 ?auto_67850 ) ) ( IS-CRATE ?auto_67844 ) ( not ( = ?auto_67832 ?auto_67840 ) ) ( not ( = ?auto_67833 ?auto_67840 ) ) ( not ( = ?auto_67836 ?auto_67840 ) ) ( not ( = ?auto_67839 ?auto_67840 ) ) ( not ( = ?auto_67837 ?auto_67840 ) ) ( not ( = ?auto_67843 ?auto_67840 ) ) ( not ( = ?auto_67853 ?auto_67840 ) ) ( not ( = ?auto_67844 ?auto_67840 ) ) ( not ( = ?auto_67850 ?auto_67840 ) ) ( not ( = ?auto_67851 ?auto_67856 ) ) ( not ( = ?auto_67838 ?auto_67851 ) ) ( not ( = ?auto_67852 ?auto_67851 ) ) ( not ( = ?auto_67848 ?auto_67851 ) ) ( HOIST-AT ?auto_67849 ?auto_67851 ) ( not ( = ?auto_67842 ?auto_67849 ) ) ( not ( = ?auto_67847 ?auto_67849 ) ) ( not ( = ?auto_67857 ?auto_67849 ) ) ( not ( = ?auto_67841 ?auto_67849 ) ) ( AVAILABLE ?auto_67849 ) ( SURFACE-AT ?auto_67844 ?auto_67851 ) ( ON ?auto_67844 ?auto_67855 ) ( CLEAR ?auto_67844 ) ( not ( = ?auto_67832 ?auto_67855 ) ) ( not ( = ?auto_67833 ?auto_67855 ) ) ( not ( = ?auto_67836 ?auto_67855 ) ) ( not ( = ?auto_67839 ?auto_67855 ) ) ( not ( = ?auto_67837 ?auto_67855 ) ) ( not ( = ?auto_67843 ?auto_67855 ) ) ( not ( = ?auto_67853 ?auto_67855 ) ) ( not ( = ?auto_67844 ?auto_67855 ) ) ( not ( = ?auto_67850 ?auto_67855 ) ) ( not ( = ?auto_67840 ?auto_67855 ) ) ( IS-CRATE ?auto_67840 ) ( not ( = ?auto_67832 ?auto_67845 ) ) ( not ( = ?auto_67833 ?auto_67845 ) ) ( not ( = ?auto_67836 ?auto_67845 ) ) ( not ( = ?auto_67839 ?auto_67845 ) ) ( not ( = ?auto_67837 ?auto_67845 ) ) ( not ( = ?auto_67843 ?auto_67845 ) ) ( not ( = ?auto_67853 ?auto_67845 ) ) ( not ( = ?auto_67844 ?auto_67845 ) ) ( not ( = ?auto_67850 ?auto_67845 ) ) ( not ( = ?auto_67840 ?auto_67845 ) ) ( not ( = ?auto_67855 ?auto_67845 ) ) ( not ( = ?auto_67858 ?auto_67856 ) ) ( not ( = ?auto_67838 ?auto_67858 ) ) ( not ( = ?auto_67852 ?auto_67858 ) ) ( not ( = ?auto_67848 ?auto_67858 ) ) ( not ( = ?auto_67851 ?auto_67858 ) ) ( HOIST-AT ?auto_67846 ?auto_67858 ) ( not ( = ?auto_67842 ?auto_67846 ) ) ( not ( = ?auto_67847 ?auto_67846 ) ) ( not ( = ?auto_67857 ?auto_67846 ) ) ( not ( = ?auto_67841 ?auto_67846 ) ) ( not ( = ?auto_67849 ?auto_67846 ) ) ( AVAILABLE ?auto_67846 ) ( SURFACE-AT ?auto_67840 ?auto_67858 ) ( ON ?auto_67840 ?auto_67834 ) ( CLEAR ?auto_67840 ) ( not ( = ?auto_67832 ?auto_67834 ) ) ( not ( = ?auto_67833 ?auto_67834 ) ) ( not ( = ?auto_67836 ?auto_67834 ) ) ( not ( = ?auto_67839 ?auto_67834 ) ) ( not ( = ?auto_67837 ?auto_67834 ) ) ( not ( = ?auto_67843 ?auto_67834 ) ) ( not ( = ?auto_67853 ?auto_67834 ) ) ( not ( = ?auto_67844 ?auto_67834 ) ) ( not ( = ?auto_67850 ?auto_67834 ) ) ( not ( = ?auto_67840 ?auto_67834 ) ) ( not ( = ?auto_67855 ?auto_67834 ) ) ( not ( = ?auto_67845 ?auto_67834 ) ) ( SURFACE-AT ?auto_67854 ?auto_67856 ) ( CLEAR ?auto_67854 ) ( IS-CRATE ?auto_67845 ) ( not ( = ?auto_67832 ?auto_67854 ) ) ( not ( = ?auto_67833 ?auto_67854 ) ) ( not ( = ?auto_67836 ?auto_67854 ) ) ( not ( = ?auto_67839 ?auto_67854 ) ) ( not ( = ?auto_67837 ?auto_67854 ) ) ( not ( = ?auto_67843 ?auto_67854 ) ) ( not ( = ?auto_67853 ?auto_67854 ) ) ( not ( = ?auto_67844 ?auto_67854 ) ) ( not ( = ?auto_67850 ?auto_67854 ) ) ( not ( = ?auto_67840 ?auto_67854 ) ) ( not ( = ?auto_67855 ?auto_67854 ) ) ( not ( = ?auto_67845 ?auto_67854 ) ) ( not ( = ?auto_67834 ?auto_67854 ) ) ( AVAILABLE ?auto_67842 ) ( TRUCK-AT ?auto_67835 ?auto_67852 ) ( AVAILABLE ?auto_67857 ) ( SURFACE-AT ?auto_67845 ?auto_67852 ) ( ON ?auto_67845 ?auto_67859 ) ( CLEAR ?auto_67845 ) ( not ( = ?auto_67832 ?auto_67859 ) ) ( not ( = ?auto_67833 ?auto_67859 ) ) ( not ( = ?auto_67836 ?auto_67859 ) ) ( not ( = ?auto_67839 ?auto_67859 ) ) ( not ( = ?auto_67837 ?auto_67859 ) ) ( not ( = ?auto_67843 ?auto_67859 ) ) ( not ( = ?auto_67853 ?auto_67859 ) ) ( not ( = ?auto_67844 ?auto_67859 ) ) ( not ( = ?auto_67850 ?auto_67859 ) ) ( not ( = ?auto_67840 ?auto_67859 ) ) ( not ( = ?auto_67855 ?auto_67859 ) ) ( not ( = ?auto_67845 ?auto_67859 ) ) ( not ( = ?auto_67834 ?auto_67859 ) ) ( not ( = ?auto_67854 ?auto_67859 ) ) )
    :subtasks
    ( ( !LIFT ?auto_67857 ?auto_67845 ?auto_67859 ?auto_67852 )
      ( MAKE-ON ?auto_67832 ?auto_67833 )
      ( MAKE-ON-VERIFY ?auto_67832 ?auto_67833 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_67860 - SURFACE
      ?auto_67861 - SURFACE
    )
    :vars
    (
      ?auto_67862 - HOIST
      ?auto_67882 - PLACE
      ?auto_67873 - PLACE
      ?auto_67872 - HOIST
      ?auto_67885 - SURFACE
      ?auto_67871 - SURFACE
      ?auto_67878 - PLACE
      ?auto_67875 - HOIST
      ?auto_67869 - SURFACE
      ?auto_67886 - SURFACE
      ?auto_67867 - PLACE
      ?auto_67870 - HOIST
      ?auto_67879 - SURFACE
      ?auto_67865 - SURFACE
      ?auto_67876 - SURFACE
      ?auto_67884 - SURFACE
      ?auto_67877 - PLACE
      ?auto_67883 - HOIST
      ?auto_67881 - SURFACE
      ?auto_67887 - SURFACE
      ?auto_67863 - PLACE
      ?auto_67868 - HOIST
      ?auto_67866 - SURFACE
      ?auto_67880 - SURFACE
      ?auto_67864 - SURFACE
      ?auto_67874 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_67862 ?auto_67882 ) ( IS-CRATE ?auto_67860 ) ( not ( = ?auto_67860 ?auto_67861 ) ) ( not ( = ?auto_67873 ?auto_67882 ) ) ( HOIST-AT ?auto_67872 ?auto_67873 ) ( not ( = ?auto_67862 ?auto_67872 ) ) ( AVAILABLE ?auto_67872 ) ( SURFACE-AT ?auto_67860 ?auto_67873 ) ( ON ?auto_67860 ?auto_67885 ) ( CLEAR ?auto_67860 ) ( not ( = ?auto_67860 ?auto_67885 ) ) ( not ( = ?auto_67861 ?auto_67885 ) ) ( IS-CRATE ?auto_67861 ) ( not ( = ?auto_67860 ?auto_67871 ) ) ( not ( = ?auto_67861 ?auto_67871 ) ) ( not ( = ?auto_67885 ?auto_67871 ) ) ( not ( = ?auto_67878 ?auto_67882 ) ) ( not ( = ?auto_67873 ?auto_67878 ) ) ( HOIST-AT ?auto_67875 ?auto_67878 ) ( not ( = ?auto_67862 ?auto_67875 ) ) ( not ( = ?auto_67872 ?auto_67875 ) ) ( SURFACE-AT ?auto_67861 ?auto_67878 ) ( ON ?auto_67861 ?auto_67869 ) ( CLEAR ?auto_67861 ) ( not ( = ?auto_67860 ?auto_67869 ) ) ( not ( = ?auto_67861 ?auto_67869 ) ) ( not ( = ?auto_67885 ?auto_67869 ) ) ( not ( = ?auto_67871 ?auto_67869 ) ) ( IS-CRATE ?auto_67871 ) ( not ( = ?auto_67860 ?auto_67886 ) ) ( not ( = ?auto_67861 ?auto_67886 ) ) ( not ( = ?auto_67885 ?auto_67886 ) ) ( not ( = ?auto_67871 ?auto_67886 ) ) ( not ( = ?auto_67869 ?auto_67886 ) ) ( not ( = ?auto_67867 ?auto_67882 ) ) ( not ( = ?auto_67873 ?auto_67867 ) ) ( not ( = ?auto_67878 ?auto_67867 ) ) ( HOIST-AT ?auto_67870 ?auto_67867 ) ( not ( = ?auto_67862 ?auto_67870 ) ) ( not ( = ?auto_67872 ?auto_67870 ) ) ( not ( = ?auto_67875 ?auto_67870 ) ) ( SURFACE-AT ?auto_67871 ?auto_67867 ) ( ON ?auto_67871 ?auto_67879 ) ( CLEAR ?auto_67871 ) ( not ( = ?auto_67860 ?auto_67879 ) ) ( not ( = ?auto_67861 ?auto_67879 ) ) ( not ( = ?auto_67885 ?auto_67879 ) ) ( not ( = ?auto_67871 ?auto_67879 ) ) ( not ( = ?auto_67869 ?auto_67879 ) ) ( not ( = ?auto_67886 ?auto_67879 ) ) ( IS-CRATE ?auto_67886 ) ( not ( = ?auto_67860 ?auto_67865 ) ) ( not ( = ?auto_67861 ?auto_67865 ) ) ( not ( = ?auto_67885 ?auto_67865 ) ) ( not ( = ?auto_67871 ?auto_67865 ) ) ( not ( = ?auto_67869 ?auto_67865 ) ) ( not ( = ?auto_67886 ?auto_67865 ) ) ( not ( = ?auto_67879 ?auto_67865 ) ) ( AVAILABLE ?auto_67870 ) ( SURFACE-AT ?auto_67886 ?auto_67867 ) ( ON ?auto_67886 ?auto_67876 ) ( CLEAR ?auto_67886 ) ( not ( = ?auto_67860 ?auto_67876 ) ) ( not ( = ?auto_67861 ?auto_67876 ) ) ( not ( = ?auto_67885 ?auto_67876 ) ) ( not ( = ?auto_67871 ?auto_67876 ) ) ( not ( = ?auto_67869 ?auto_67876 ) ) ( not ( = ?auto_67886 ?auto_67876 ) ) ( not ( = ?auto_67879 ?auto_67876 ) ) ( not ( = ?auto_67865 ?auto_67876 ) ) ( IS-CRATE ?auto_67865 ) ( not ( = ?auto_67860 ?auto_67884 ) ) ( not ( = ?auto_67861 ?auto_67884 ) ) ( not ( = ?auto_67885 ?auto_67884 ) ) ( not ( = ?auto_67871 ?auto_67884 ) ) ( not ( = ?auto_67869 ?auto_67884 ) ) ( not ( = ?auto_67886 ?auto_67884 ) ) ( not ( = ?auto_67879 ?auto_67884 ) ) ( not ( = ?auto_67865 ?auto_67884 ) ) ( not ( = ?auto_67876 ?auto_67884 ) ) ( not ( = ?auto_67877 ?auto_67882 ) ) ( not ( = ?auto_67873 ?auto_67877 ) ) ( not ( = ?auto_67878 ?auto_67877 ) ) ( not ( = ?auto_67867 ?auto_67877 ) ) ( HOIST-AT ?auto_67883 ?auto_67877 ) ( not ( = ?auto_67862 ?auto_67883 ) ) ( not ( = ?auto_67872 ?auto_67883 ) ) ( not ( = ?auto_67875 ?auto_67883 ) ) ( not ( = ?auto_67870 ?auto_67883 ) ) ( AVAILABLE ?auto_67883 ) ( SURFACE-AT ?auto_67865 ?auto_67877 ) ( ON ?auto_67865 ?auto_67881 ) ( CLEAR ?auto_67865 ) ( not ( = ?auto_67860 ?auto_67881 ) ) ( not ( = ?auto_67861 ?auto_67881 ) ) ( not ( = ?auto_67885 ?auto_67881 ) ) ( not ( = ?auto_67871 ?auto_67881 ) ) ( not ( = ?auto_67869 ?auto_67881 ) ) ( not ( = ?auto_67886 ?auto_67881 ) ) ( not ( = ?auto_67879 ?auto_67881 ) ) ( not ( = ?auto_67865 ?auto_67881 ) ) ( not ( = ?auto_67876 ?auto_67881 ) ) ( not ( = ?auto_67884 ?auto_67881 ) ) ( IS-CRATE ?auto_67884 ) ( not ( = ?auto_67860 ?auto_67887 ) ) ( not ( = ?auto_67861 ?auto_67887 ) ) ( not ( = ?auto_67885 ?auto_67887 ) ) ( not ( = ?auto_67871 ?auto_67887 ) ) ( not ( = ?auto_67869 ?auto_67887 ) ) ( not ( = ?auto_67886 ?auto_67887 ) ) ( not ( = ?auto_67879 ?auto_67887 ) ) ( not ( = ?auto_67865 ?auto_67887 ) ) ( not ( = ?auto_67876 ?auto_67887 ) ) ( not ( = ?auto_67884 ?auto_67887 ) ) ( not ( = ?auto_67881 ?auto_67887 ) ) ( not ( = ?auto_67863 ?auto_67882 ) ) ( not ( = ?auto_67873 ?auto_67863 ) ) ( not ( = ?auto_67878 ?auto_67863 ) ) ( not ( = ?auto_67867 ?auto_67863 ) ) ( not ( = ?auto_67877 ?auto_67863 ) ) ( HOIST-AT ?auto_67868 ?auto_67863 ) ( not ( = ?auto_67862 ?auto_67868 ) ) ( not ( = ?auto_67872 ?auto_67868 ) ) ( not ( = ?auto_67875 ?auto_67868 ) ) ( not ( = ?auto_67870 ?auto_67868 ) ) ( not ( = ?auto_67883 ?auto_67868 ) ) ( AVAILABLE ?auto_67868 ) ( SURFACE-AT ?auto_67884 ?auto_67863 ) ( ON ?auto_67884 ?auto_67866 ) ( CLEAR ?auto_67884 ) ( not ( = ?auto_67860 ?auto_67866 ) ) ( not ( = ?auto_67861 ?auto_67866 ) ) ( not ( = ?auto_67885 ?auto_67866 ) ) ( not ( = ?auto_67871 ?auto_67866 ) ) ( not ( = ?auto_67869 ?auto_67866 ) ) ( not ( = ?auto_67886 ?auto_67866 ) ) ( not ( = ?auto_67879 ?auto_67866 ) ) ( not ( = ?auto_67865 ?auto_67866 ) ) ( not ( = ?auto_67876 ?auto_67866 ) ) ( not ( = ?auto_67884 ?auto_67866 ) ) ( not ( = ?auto_67881 ?auto_67866 ) ) ( not ( = ?auto_67887 ?auto_67866 ) ) ( SURFACE-AT ?auto_67880 ?auto_67882 ) ( CLEAR ?auto_67880 ) ( IS-CRATE ?auto_67887 ) ( not ( = ?auto_67860 ?auto_67880 ) ) ( not ( = ?auto_67861 ?auto_67880 ) ) ( not ( = ?auto_67885 ?auto_67880 ) ) ( not ( = ?auto_67871 ?auto_67880 ) ) ( not ( = ?auto_67869 ?auto_67880 ) ) ( not ( = ?auto_67886 ?auto_67880 ) ) ( not ( = ?auto_67879 ?auto_67880 ) ) ( not ( = ?auto_67865 ?auto_67880 ) ) ( not ( = ?auto_67876 ?auto_67880 ) ) ( not ( = ?auto_67884 ?auto_67880 ) ) ( not ( = ?auto_67881 ?auto_67880 ) ) ( not ( = ?auto_67887 ?auto_67880 ) ) ( not ( = ?auto_67866 ?auto_67880 ) ) ( AVAILABLE ?auto_67862 ) ( AVAILABLE ?auto_67875 ) ( SURFACE-AT ?auto_67887 ?auto_67878 ) ( ON ?auto_67887 ?auto_67864 ) ( CLEAR ?auto_67887 ) ( not ( = ?auto_67860 ?auto_67864 ) ) ( not ( = ?auto_67861 ?auto_67864 ) ) ( not ( = ?auto_67885 ?auto_67864 ) ) ( not ( = ?auto_67871 ?auto_67864 ) ) ( not ( = ?auto_67869 ?auto_67864 ) ) ( not ( = ?auto_67886 ?auto_67864 ) ) ( not ( = ?auto_67879 ?auto_67864 ) ) ( not ( = ?auto_67865 ?auto_67864 ) ) ( not ( = ?auto_67876 ?auto_67864 ) ) ( not ( = ?auto_67884 ?auto_67864 ) ) ( not ( = ?auto_67881 ?auto_67864 ) ) ( not ( = ?auto_67887 ?auto_67864 ) ) ( not ( = ?auto_67866 ?auto_67864 ) ) ( not ( = ?auto_67880 ?auto_67864 ) ) ( TRUCK-AT ?auto_67874 ?auto_67882 ) )
    :subtasks
    ( ( !DRIVE ?auto_67874 ?auto_67882 ?auto_67878 )
      ( MAKE-ON ?auto_67860 ?auto_67861 )
      ( MAKE-ON-VERIFY ?auto_67860 ?auto_67861 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_67888 - SURFACE
      ?auto_67889 - SURFACE
    )
    :vars
    (
      ?auto_67897 - HOIST
      ?auto_67907 - PLACE
      ?auto_67911 - PLACE
      ?auto_67891 - HOIST
      ?auto_67894 - SURFACE
      ?auto_67900 - SURFACE
      ?auto_67895 - PLACE
      ?auto_67901 - HOIST
      ?auto_67914 - SURFACE
      ?auto_67893 - SURFACE
      ?auto_67902 - PLACE
      ?auto_67912 - HOIST
      ?auto_67896 - SURFACE
      ?auto_67905 - SURFACE
      ?auto_67915 - SURFACE
      ?auto_67909 - SURFACE
      ?auto_67910 - PLACE
      ?auto_67908 - HOIST
      ?auto_67906 - SURFACE
      ?auto_67892 - SURFACE
      ?auto_67913 - PLACE
      ?auto_67904 - HOIST
      ?auto_67898 - SURFACE
      ?auto_67899 - SURFACE
      ?auto_67903 - SURFACE
      ?auto_67890 - TRUCK
      ?auto_67916 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_67897 ?auto_67907 ) ( IS-CRATE ?auto_67888 ) ( not ( = ?auto_67888 ?auto_67889 ) ) ( not ( = ?auto_67911 ?auto_67907 ) ) ( HOIST-AT ?auto_67891 ?auto_67911 ) ( not ( = ?auto_67897 ?auto_67891 ) ) ( AVAILABLE ?auto_67891 ) ( SURFACE-AT ?auto_67888 ?auto_67911 ) ( ON ?auto_67888 ?auto_67894 ) ( CLEAR ?auto_67888 ) ( not ( = ?auto_67888 ?auto_67894 ) ) ( not ( = ?auto_67889 ?auto_67894 ) ) ( IS-CRATE ?auto_67889 ) ( not ( = ?auto_67888 ?auto_67900 ) ) ( not ( = ?auto_67889 ?auto_67900 ) ) ( not ( = ?auto_67894 ?auto_67900 ) ) ( not ( = ?auto_67895 ?auto_67907 ) ) ( not ( = ?auto_67911 ?auto_67895 ) ) ( HOIST-AT ?auto_67901 ?auto_67895 ) ( not ( = ?auto_67897 ?auto_67901 ) ) ( not ( = ?auto_67891 ?auto_67901 ) ) ( SURFACE-AT ?auto_67889 ?auto_67895 ) ( ON ?auto_67889 ?auto_67914 ) ( CLEAR ?auto_67889 ) ( not ( = ?auto_67888 ?auto_67914 ) ) ( not ( = ?auto_67889 ?auto_67914 ) ) ( not ( = ?auto_67894 ?auto_67914 ) ) ( not ( = ?auto_67900 ?auto_67914 ) ) ( IS-CRATE ?auto_67900 ) ( not ( = ?auto_67888 ?auto_67893 ) ) ( not ( = ?auto_67889 ?auto_67893 ) ) ( not ( = ?auto_67894 ?auto_67893 ) ) ( not ( = ?auto_67900 ?auto_67893 ) ) ( not ( = ?auto_67914 ?auto_67893 ) ) ( not ( = ?auto_67902 ?auto_67907 ) ) ( not ( = ?auto_67911 ?auto_67902 ) ) ( not ( = ?auto_67895 ?auto_67902 ) ) ( HOIST-AT ?auto_67912 ?auto_67902 ) ( not ( = ?auto_67897 ?auto_67912 ) ) ( not ( = ?auto_67891 ?auto_67912 ) ) ( not ( = ?auto_67901 ?auto_67912 ) ) ( SURFACE-AT ?auto_67900 ?auto_67902 ) ( ON ?auto_67900 ?auto_67896 ) ( CLEAR ?auto_67900 ) ( not ( = ?auto_67888 ?auto_67896 ) ) ( not ( = ?auto_67889 ?auto_67896 ) ) ( not ( = ?auto_67894 ?auto_67896 ) ) ( not ( = ?auto_67900 ?auto_67896 ) ) ( not ( = ?auto_67914 ?auto_67896 ) ) ( not ( = ?auto_67893 ?auto_67896 ) ) ( IS-CRATE ?auto_67893 ) ( not ( = ?auto_67888 ?auto_67905 ) ) ( not ( = ?auto_67889 ?auto_67905 ) ) ( not ( = ?auto_67894 ?auto_67905 ) ) ( not ( = ?auto_67900 ?auto_67905 ) ) ( not ( = ?auto_67914 ?auto_67905 ) ) ( not ( = ?auto_67893 ?auto_67905 ) ) ( not ( = ?auto_67896 ?auto_67905 ) ) ( AVAILABLE ?auto_67912 ) ( SURFACE-AT ?auto_67893 ?auto_67902 ) ( ON ?auto_67893 ?auto_67915 ) ( CLEAR ?auto_67893 ) ( not ( = ?auto_67888 ?auto_67915 ) ) ( not ( = ?auto_67889 ?auto_67915 ) ) ( not ( = ?auto_67894 ?auto_67915 ) ) ( not ( = ?auto_67900 ?auto_67915 ) ) ( not ( = ?auto_67914 ?auto_67915 ) ) ( not ( = ?auto_67893 ?auto_67915 ) ) ( not ( = ?auto_67896 ?auto_67915 ) ) ( not ( = ?auto_67905 ?auto_67915 ) ) ( IS-CRATE ?auto_67905 ) ( not ( = ?auto_67888 ?auto_67909 ) ) ( not ( = ?auto_67889 ?auto_67909 ) ) ( not ( = ?auto_67894 ?auto_67909 ) ) ( not ( = ?auto_67900 ?auto_67909 ) ) ( not ( = ?auto_67914 ?auto_67909 ) ) ( not ( = ?auto_67893 ?auto_67909 ) ) ( not ( = ?auto_67896 ?auto_67909 ) ) ( not ( = ?auto_67905 ?auto_67909 ) ) ( not ( = ?auto_67915 ?auto_67909 ) ) ( not ( = ?auto_67910 ?auto_67907 ) ) ( not ( = ?auto_67911 ?auto_67910 ) ) ( not ( = ?auto_67895 ?auto_67910 ) ) ( not ( = ?auto_67902 ?auto_67910 ) ) ( HOIST-AT ?auto_67908 ?auto_67910 ) ( not ( = ?auto_67897 ?auto_67908 ) ) ( not ( = ?auto_67891 ?auto_67908 ) ) ( not ( = ?auto_67901 ?auto_67908 ) ) ( not ( = ?auto_67912 ?auto_67908 ) ) ( AVAILABLE ?auto_67908 ) ( SURFACE-AT ?auto_67905 ?auto_67910 ) ( ON ?auto_67905 ?auto_67906 ) ( CLEAR ?auto_67905 ) ( not ( = ?auto_67888 ?auto_67906 ) ) ( not ( = ?auto_67889 ?auto_67906 ) ) ( not ( = ?auto_67894 ?auto_67906 ) ) ( not ( = ?auto_67900 ?auto_67906 ) ) ( not ( = ?auto_67914 ?auto_67906 ) ) ( not ( = ?auto_67893 ?auto_67906 ) ) ( not ( = ?auto_67896 ?auto_67906 ) ) ( not ( = ?auto_67905 ?auto_67906 ) ) ( not ( = ?auto_67915 ?auto_67906 ) ) ( not ( = ?auto_67909 ?auto_67906 ) ) ( IS-CRATE ?auto_67909 ) ( not ( = ?auto_67888 ?auto_67892 ) ) ( not ( = ?auto_67889 ?auto_67892 ) ) ( not ( = ?auto_67894 ?auto_67892 ) ) ( not ( = ?auto_67900 ?auto_67892 ) ) ( not ( = ?auto_67914 ?auto_67892 ) ) ( not ( = ?auto_67893 ?auto_67892 ) ) ( not ( = ?auto_67896 ?auto_67892 ) ) ( not ( = ?auto_67905 ?auto_67892 ) ) ( not ( = ?auto_67915 ?auto_67892 ) ) ( not ( = ?auto_67909 ?auto_67892 ) ) ( not ( = ?auto_67906 ?auto_67892 ) ) ( not ( = ?auto_67913 ?auto_67907 ) ) ( not ( = ?auto_67911 ?auto_67913 ) ) ( not ( = ?auto_67895 ?auto_67913 ) ) ( not ( = ?auto_67902 ?auto_67913 ) ) ( not ( = ?auto_67910 ?auto_67913 ) ) ( HOIST-AT ?auto_67904 ?auto_67913 ) ( not ( = ?auto_67897 ?auto_67904 ) ) ( not ( = ?auto_67891 ?auto_67904 ) ) ( not ( = ?auto_67901 ?auto_67904 ) ) ( not ( = ?auto_67912 ?auto_67904 ) ) ( not ( = ?auto_67908 ?auto_67904 ) ) ( AVAILABLE ?auto_67904 ) ( SURFACE-AT ?auto_67909 ?auto_67913 ) ( ON ?auto_67909 ?auto_67898 ) ( CLEAR ?auto_67909 ) ( not ( = ?auto_67888 ?auto_67898 ) ) ( not ( = ?auto_67889 ?auto_67898 ) ) ( not ( = ?auto_67894 ?auto_67898 ) ) ( not ( = ?auto_67900 ?auto_67898 ) ) ( not ( = ?auto_67914 ?auto_67898 ) ) ( not ( = ?auto_67893 ?auto_67898 ) ) ( not ( = ?auto_67896 ?auto_67898 ) ) ( not ( = ?auto_67905 ?auto_67898 ) ) ( not ( = ?auto_67915 ?auto_67898 ) ) ( not ( = ?auto_67909 ?auto_67898 ) ) ( not ( = ?auto_67906 ?auto_67898 ) ) ( not ( = ?auto_67892 ?auto_67898 ) ) ( IS-CRATE ?auto_67892 ) ( not ( = ?auto_67888 ?auto_67899 ) ) ( not ( = ?auto_67889 ?auto_67899 ) ) ( not ( = ?auto_67894 ?auto_67899 ) ) ( not ( = ?auto_67900 ?auto_67899 ) ) ( not ( = ?auto_67914 ?auto_67899 ) ) ( not ( = ?auto_67893 ?auto_67899 ) ) ( not ( = ?auto_67896 ?auto_67899 ) ) ( not ( = ?auto_67905 ?auto_67899 ) ) ( not ( = ?auto_67915 ?auto_67899 ) ) ( not ( = ?auto_67909 ?auto_67899 ) ) ( not ( = ?auto_67906 ?auto_67899 ) ) ( not ( = ?auto_67892 ?auto_67899 ) ) ( not ( = ?auto_67898 ?auto_67899 ) ) ( AVAILABLE ?auto_67901 ) ( SURFACE-AT ?auto_67892 ?auto_67895 ) ( ON ?auto_67892 ?auto_67903 ) ( CLEAR ?auto_67892 ) ( not ( = ?auto_67888 ?auto_67903 ) ) ( not ( = ?auto_67889 ?auto_67903 ) ) ( not ( = ?auto_67894 ?auto_67903 ) ) ( not ( = ?auto_67900 ?auto_67903 ) ) ( not ( = ?auto_67914 ?auto_67903 ) ) ( not ( = ?auto_67893 ?auto_67903 ) ) ( not ( = ?auto_67896 ?auto_67903 ) ) ( not ( = ?auto_67905 ?auto_67903 ) ) ( not ( = ?auto_67915 ?auto_67903 ) ) ( not ( = ?auto_67909 ?auto_67903 ) ) ( not ( = ?auto_67906 ?auto_67903 ) ) ( not ( = ?auto_67892 ?auto_67903 ) ) ( not ( = ?auto_67898 ?auto_67903 ) ) ( not ( = ?auto_67899 ?auto_67903 ) ) ( TRUCK-AT ?auto_67890 ?auto_67907 ) ( SURFACE-AT ?auto_67916 ?auto_67907 ) ( CLEAR ?auto_67916 ) ( LIFTING ?auto_67897 ?auto_67899 ) ( IS-CRATE ?auto_67899 ) ( not ( = ?auto_67888 ?auto_67916 ) ) ( not ( = ?auto_67889 ?auto_67916 ) ) ( not ( = ?auto_67894 ?auto_67916 ) ) ( not ( = ?auto_67900 ?auto_67916 ) ) ( not ( = ?auto_67914 ?auto_67916 ) ) ( not ( = ?auto_67893 ?auto_67916 ) ) ( not ( = ?auto_67896 ?auto_67916 ) ) ( not ( = ?auto_67905 ?auto_67916 ) ) ( not ( = ?auto_67915 ?auto_67916 ) ) ( not ( = ?auto_67909 ?auto_67916 ) ) ( not ( = ?auto_67906 ?auto_67916 ) ) ( not ( = ?auto_67892 ?auto_67916 ) ) ( not ( = ?auto_67898 ?auto_67916 ) ) ( not ( = ?auto_67899 ?auto_67916 ) ) ( not ( = ?auto_67903 ?auto_67916 ) ) )
    :subtasks
    ( ( !DROP ?auto_67897 ?auto_67899 ?auto_67916 ?auto_67907 )
      ( MAKE-ON ?auto_67888 ?auto_67889 )
      ( MAKE-ON-VERIFY ?auto_67888 ?auto_67889 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_67917 - SURFACE
      ?auto_67918 - SURFACE
    )
    :vars
    (
      ?auto_67933 - HOIST
      ?auto_67937 - PLACE
      ?auto_67927 - PLACE
      ?auto_67923 - HOIST
      ?auto_67926 - SURFACE
      ?auto_67924 - SURFACE
      ?auto_67934 - PLACE
      ?auto_67921 - HOIST
      ?auto_67941 - SURFACE
      ?auto_67931 - SURFACE
      ?auto_67932 - PLACE
      ?auto_67928 - HOIST
      ?auto_67944 - SURFACE
      ?auto_67929 - SURFACE
      ?auto_67942 - SURFACE
      ?auto_67939 - SURFACE
      ?auto_67940 - PLACE
      ?auto_67938 - HOIST
      ?auto_67936 - SURFACE
      ?auto_67919 - SURFACE
      ?auto_67935 - PLACE
      ?auto_67943 - HOIST
      ?auto_67922 - SURFACE
      ?auto_67925 - SURFACE
      ?auto_67920 - SURFACE
      ?auto_67930 - TRUCK
      ?auto_67945 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_67933 ?auto_67937 ) ( IS-CRATE ?auto_67917 ) ( not ( = ?auto_67917 ?auto_67918 ) ) ( not ( = ?auto_67927 ?auto_67937 ) ) ( HOIST-AT ?auto_67923 ?auto_67927 ) ( not ( = ?auto_67933 ?auto_67923 ) ) ( AVAILABLE ?auto_67923 ) ( SURFACE-AT ?auto_67917 ?auto_67927 ) ( ON ?auto_67917 ?auto_67926 ) ( CLEAR ?auto_67917 ) ( not ( = ?auto_67917 ?auto_67926 ) ) ( not ( = ?auto_67918 ?auto_67926 ) ) ( IS-CRATE ?auto_67918 ) ( not ( = ?auto_67917 ?auto_67924 ) ) ( not ( = ?auto_67918 ?auto_67924 ) ) ( not ( = ?auto_67926 ?auto_67924 ) ) ( not ( = ?auto_67934 ?auto_67937 ) ) ( not ( = ?auto_67927 ?auto_67934 ) ) ( HOIST-AT ?auto_67921 ?auto_67934 ) ( not ( = ?auto_67933 ?auto_67921 ) ) ( not ( = ?auto_67923 ?auto_67921 ) ) ( SURFACE-AT ?auto_67918 ?auto_67934 ) ( ON ?auto_67918 ?auto_67941 ) ( CLEAR ?auto_67918 ) ( not ( = ?auto_67917 ?auto_67941 ) ) ( not ( = ?auto_67918 ?auto_67941 ) ) ( not ( = ?auto_67926 ?auto_67941 ) ) ( not ( = ?auto_67924 ?auto_67941 ) ) ( IS-CRATE ?auto_67924 ) ( not ( = ?auto_67917 ?auto_67931 ) ) ( not ( = ?auto_67918 ?auto_67931 ) ) ( not ( = ?auto_67926 ?auto_67931 ) ) ( not ( = ?auto_67924 ?auto_67931 ) ) ( not ( = ?auto_67941 ?auto_67931 ) ) ( not ( = ?auto_67932 ?auto_67937 ) ) ( not ( = ?auto_67927 ?auto_67932 ) ) ( not ( = ?auto_67934 ?auto_67932 ) ) ( HOIST-AT ?auto_67928 ?auto_67932 ) ( not ( = ?auto_67933 ?auto_67928 ) ) ( not ( = ?auto_67923 ?auto_67928 ) ) ( not ( = ?auto_67921 ?auto_67928 ) ) ( SURFACE-AT ?auto_67924 ?auto_67932 ) ( ON ?auto_67924 ?auto_67944 ) ( CLEAR ?auto_67924 ) ( not ( = ?auto_67917 ?auto_67944 ) ) ( not ( = ?auto_67918 ?auto_67944 ) ) ( not ( = ?auto_67926 ?auto_67944 ) ) ( not ( = ?auto_67924 ?auto_67944 ) ) ( not ( = ?auto_67941 ?auto_67944 ) ) ( not ( = ?auto_67931 ?auto_67944 ) ) ( IS-CRATE ?auto_67931 ) ( not ( = ?auto_67917 ?auto_67929 ) ) ( not ( = ?auto_67918 ?auto_67929 ) ) ( not ( = ?auto_67926 ?auto_67929 ) ) ( not ( = ?auto_67924 ?auto_67929 ) ) ( not ( = ?auto_67941 ?auto_67929 ) ) ( not ( = ?auto_67931 ?auto_67929 ) ) ( not ( = ?auto_67944 ?auto_67929 ) ) ( AVAILABLE ?auto_67928 ) ( SURFACE-AT ?auto_67931 ?auto_67932 ) ( ON ?auto_67931 ?auto_67942 ) ( CLEAR ?auto_67931 ) ( not ( = ?auto_67917 ?auto_67942 ) ) ( not ( = ?auto_67918 ?auto_67942 ) ) ( not ( = ?auto_67926 ?auto_67942 ) ) ( not ( = ?auto_67924 ?auto_67942 ) ) ( not ( = ?auto_67941 ?auto_67942 ) ) ( not ( = ?auto_67931 ?auto_67942 ) ) ( not ( = ?auto_67944 ?auto_67942 ) ) ( not ( = ?auto_67929 ?auto_67942 ) ) ( IS-CRATE ?auto_67929 ) ( not ( = ?auto_67917 ?auto_67939 ) ) ( not ( = ?auto_67918 ?auto_67939 ) ) ( not ( = ?auto_67926 ?auto_67939 ) ) ( not ( = ?auto_67924 ?auto_67939 ) ) ( not ( = ?auto_67941 ?auto_67939 ) ) ( not ( = ?auto_67931 ?auto_67939 ) ) ( not ( = ?auto_67944 ?auto_67939 ) ) ( not ( = ?auto_67929 ?auto_67939 ) ) ( not ( = ?auto_67942 ?auto_67939 ) ) ( not ( = ?auto_67940 ?auto_67937 ) ) ( not ( = ?auto_67927 ?auto_67940 ) ) ( not ( = ?auto_67934 ?auto_67940 ) ) ( not ( = ?auto_67932 ?auto_67940 ) ) ( HOIST-AT ?auto_67938 ?auto_67940 ) ( not ( = ?auto_67933 ?auto_67938 ) ) ( not ( = ?auto_67923 ?auto_67938 ) ) ( not ( = ?auto_67921 ?auto_67938 ) ) ( not ( = ?auto_67928 ?auto_67938 ) ) ( AVAILABLE ?auto_67938 ) ( SURFACE-AT ?auto_67929 ?auto_67940 ) ( ON ?auto_67929 ?auto_67936 ) ( CLEAR ?auto_67929 ) ( not ( = ?auto_67917 ?auto_67936 ) ) ( not ( = ?auto_67918 ?auto_67936 ) ) ( not ( = ?auto_67926 ?auto_67936 ) ) ( not ( = ?auto_67924 ?auto_67936 ) ) ( not ( = ?auto_67941 ?auto_67936 ) ) ( not ( = ?auto_67931 ?auto_67936 ) ) ( not ( = ?auto_67944 ?auto_67936 ) ) ( not ( = ?auto_67929 ?auto_67936 ) ) ( not ( = ?auto_67942 ?auto_67936 ) ) ( not ( = ?auto_67939 ?auto_67936 ) ) ( IS-CRATE ?auto_67939 ) ( not ( = ?auto_67917 ?auto_67919 ) ) ( not ( = ?auto_67918 ?auto_67919 ) ) ( not ( = ?auto_67926 ?auto_67919 ) ) ( not ( = ?auto_67924 ?auto_67919 ) ) ( not ( = ?auto_67941 ?auto_67919 ) ) ( not ( = ?auto_67931 ?auto_67919 ) ) ( not ( = ?auto_67944 ?auto_67919 ) ) ( not ( = ?auto_67929 ?auto_67919 ) ) ( not ( = ?auto_67942 ?auto_67919 ) ) ( not ( = ?auto_67939 ?auto_67919 ) ) ( not ( = ?auto_67936 ?auto_67919 ) ) ( not ( = ?auto_67935 ?auto_67937 ) ) ( not ( = ?auto_67927 ?auto_67935 ) ) ( not ( = ?auto_67934 ?auto_67935 ) ) ( not ( = ?auto_67932 ?auto_67935 ) ) ( not ( = ?auto_67940 ?auto_67935 ) ) ( HOIST-AT ?auto_67943 ?auto_67935 ) ( not ( = ?auto_67933 ?auto_67943 ) ) ( not ( = ?auto_67923 ?auto_67943 ) ) ( not ( = ?auto_67921 ?auto_67943 ) ) ( not ( = ?auto_67928 ?auto_67943 ) ) ( not ( = ?auto_67938 ?auto_67943 ) ) ( AVAILABLE ?auto_67943 ) ( SURFACE-AT ?auto_67939 ?auto_67935 ) ( ON ?auto_67939 ?auto_67922 ) ( CLEAR ?auto_67939 ) ( not ( = ?auto_67917 ?auto_67922 ) ) ( not ( = ?auto_67918 ?auto_67922 ) ) ( not ( = ?auto_67926 ?auto_67922 ) ) ( not ( = ?auto_67924 ?auto_67922 ) ) ( not ( = ?auto_67941 ?auto_67922 ) ) ( not ( = ?auto_67931 ?auto_67922 ) ) ( not ( = ?auto_67944 ?auto_67922 ) ) ( not ( = ?auto_67929 ?auto_67922 ) ) ( not ( = ?auto_67942 ?auto_67922 ) ) ( not ( = ?auto_67939 ?auto_67922 ) ) ( not ( = ?auto_67936 ?auto_67922 ) ) ( not ( = ?auto_67919 ?auto_67922 ) ) ( IS-CRATE ?auto_67919 ) ( not ( = ?auto_67917 ?auto_67925 ) ) ( not ( = ?auto_67918 ?auto_67925 ) ) ( not ( = ?auto_67926 ?auto_67925 ) ) ( not ( = ?auto_67924 ?auto_67925 ) ) ( not ( = ?auto_67941 ?auto_67925 ) ) ( not ( = ?auto_67931 ?auto_67925 ) ) ( not ( = ?auto_67944 ?auto_67925 ) ) ( not ( = ?auto_67929 ?auto_67925 ) ) ( not ( = ?auto_67942 ?auto_67925 ) ) ( not ( = ?auto_67939 ?auto_67925 ) ) ( not ( = ?auto_67936 ?auto_67925 ) ) ( not ( = ?auto_67919 ?auto_67925 ) ) ( not ( = ?auto_67922 ?auto_67925 ) ) ( AVAILABLE ?auto_67921 ) ( SURFACE-AT ?auto_67919 ?auto_67934 ) ( ON ?auto_67919 ?auto_67920 ) ( CLEAR ?auto_67919 ) ( not ( = ?auto_67917 ?auto_67920 ) ) ( not ( = ?auto_67918 ?auto_67920 ) ) ( not ( = ?auto_67926 ?auto_67920 ) ) ( not ( = ?auto_67924 ?auto_67920 ) ) ( not ( = ?auto_67941 ?auto_67920 ) ) ( not ( = ?auto_67931 ?auto_67920 ) ) ( not ( = ?auto_67944 ?auto_67920 ) ) ( not ( = ?auto_67929 ?auto_67920 ) ) ( not ( = ?auto_67942 ?auto_67920 ) ) ( not ( = ?auto_67939 ?auto_67920 ) ) ( not ( = ?auto_67936 ?auto_67920 ) ) ( not ( = ?auto_67919 ?auto_67920 ) ) ( not ( = ?auto_67922 ?auto_67920 ) ) ( not ( = ?auto_67925 ?auto_67920 ) ) ( TRUCK-AT ?auto_67930 ?auto_67937 ) ( SURFACE-AT ?auto_67945 ?auto_67937 ) ( CLEAR ?auto_67945 ) ( IS-CRATE ?auto_67925 ) ( not ( = ?auto_67917 ?auto_67945 ) ) ( not ( = ?auto_67918 ?auto_67945 ) ) ( not ( = ?auto_67926 ?auto_67945 ) ) ( not ( = ?auto_67924 ?auto_67945 ) ) ( not ( = ?auto_67941 ?auto_67945 ) ) ( not ( = ?auto_67931 ?auto_67945 ) ) ( not ( = ?auto_67944 ?auto_67945 ) ) ( not ( = ?auto_67929 ?auto_67945 ) ) ( not ( = ?auto_67942 ?auto_67945 ) ) ( not ( = ?auto_67939 ?auto_67945 ) ) ( not ( = ?auto_67936 ?auto_67945 ) ) ( not ( = ?auto_67919 ?auto_67945 ) ) ( not ( = ?auto_67922 ?auto_67945 ) ) ( not ( = ?auto_67925 ?auto_67945 ) ) ( not ( = ?auto_67920 ?auto_67945 ) ) ( AVAILABLE ?auto_67933 ) ( IN ?auto_67925 ?auto_67930 ) )
    :subtasks
    ( ( !UNLOAD ?auto_67933 ?auto_67925 ?auto_67930 ?auto_67937 )
      ( MAKE-ON ?auto_67917 ?auto_67918 )
      ( MAKE-ON-VERIFY ?auto_67917 ?auto_67918 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_67946 - SURFACE
      ?auto_67947 - SURFACE
    )
    :vars
    (
      ?auto_67968 - HOIST
      ?auto_67961 - PLACE
      ?auto_67954 - PLACE
      ?auto_67969 - HOIST
      ?auto_67948 - SURFACE
      ?auto_67974 - SURFACE
      ?auto_67966 - PLACE
      ?auto_67953 - HOIST
      ?auto_67965 - SURFACE
      ?auto_67950 - SURFACE
      ?auto_67967 - PLACE
      ?auto_67952 - HOIST
      ?auto_67956 - SURFACE
      ?auto_67973 - SURFACE
      ?auto_67958 - SURFACE
      ?auto_67963 - SURFACE
      ?auto_67964 - PLACE
      ?auto_67962 - HOIST
      ?auto_67960 - SURFACE
      ?auto_67971 - SURFACE
      ?auto_67959 - PLACE
      ?auto_67955 - HOIST
      ?auto_67972 - SURFACE
      ?auto_67951 - SURFACE
      ?auto_67970 - SURFACE
      ?auto_67957 - SURFACE
      ?auto_67949 - TRUCK
      ?auto_67975 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_67968 ?auto_67961 ) ( IS-CRATE ?auto_67946 ) ( not ( = ?auto_67946 ?auto_67947 ) ) ( not ( = ?auto_67954 ?auto_67961 ) ) ( HOIST-AT ?auto_67969 ?auto_67954 ) ( not ( = ?auto_67968 ?auto_67969 ) ) ( AVAILABLE ?auto_67969 ) ( SURFACE-AT ?auto_67946 ?auto_67954 ) ( ON ?auto_67946 ?auto_67948 ) ( CLEAR ?auto_67946 ) ( not ( = ?auto_67946 ?auto_67948 ) ) ( not ( = ?auto_67947 ?auto_67948 ) ) ( IS-CRATE ?auto_67947 ) ( not ( = ?auto_67946 ?auto_67974 ) ) ( not ( = ?auto_67947 ?auto_67974 ) ) ( not ( = ?auto_67948 ?auto_67974 ) ) ( not ( = ?auto_67966 ?auto_67961 ) ) ( not ( = ?auto_67954 ?auto_67966 ) ) ( HOIST-AT ?auto_67953 ?auto_67966 ) ( not ( = ?auto_67968 ?auto_67953 ) ) ( not ( = ?auto_67969 ?auto_67953 ) ) ( SURFACE-AT ?auto_67947 ?auto_67966 ) ( ON ?auto_67947 ?auto_67965 ) ( CLEAR ?auto_67947 ) ( not ( = ?auto_67946 ?auto_67965 ) ) ( not ( = ?auto_67947 ?auto_67965 ) ) ( not ( = ?auto_67948 ?auto_67965 ) ) ( not ( = ?auto_67974 ?auto_67965 ) ) ( IS-CRATE ?auto_67974 ) ( not ( = ?auto_67946 ?auto_67950 ) ) ( not ( = ?auto_67947 ?auto_67950 ) ) ( not ( = ?auto_67948 ?auto_67950 ) ) ( not ( = ?auto_67974 ?auto_67950 ) ) ( not ( = ?auto_67965 ?auto_67950 ) ) ( not ( = ?auto_67967 ?auto_67961 ) ) ( not ( = ?auto_67954 ?auto_67967 ) ) ( not ( = ?auto_67966 ?auto_67967 ) ) ( HOIST-AT ?auto_67952 ?auto_67967 ) ( not ( = ?auto_67968 ?auto_67952 ) ) ( not ( = ?auto_67969 ?auto_67952 ) ) ( not ( = ?auto_67953 ?auto_67952 ) ) ( SURFACE-AT ?auto_67974 ?auto_67967 ) ( ON ?auto_67974 ?auto_67956 ) ( CLEAR ?auto_67974 ) ( not ( = ?auto_67946 ?auto_67956 ) ) ( not ( = ?auto_67947 ?auto_67956 ) ) ( not ( = ?auto_67948 ?auto_67956 ) ) ( not ( = ?auto_67974 ?auto_67956 ) ) ( not ( = ?auto_67965 ?auto_67956 ) ) ( not ( = ?auto_67950 ?auto_67956 ) ) ( IS-CRATE ?auto_67950 ) ( not ( = ?auto_67946 ?auto_67973 ) ) ( not ( = ?auto_67947 ?auto_67973 ) ) ( not ( = ?auto_67948 ?auto_67973 ) ) ( not ( = ?auto_67974 ?auto_67973 ) ) ( not ( = ?auto_67965 ?auto_67973 ) ) ( not ( = ?auto_67950 ?auto_67973 ) ) ( not ( = ?auto_67956 ?auto_67973 ) ) ( AVAILABLE ?auto_67952 ) ( SURFACE-AT ?auto_67950 ?auto_67967 ) ( ON ?auto_67950 ?auto_67958 ) ( CLEAR ?auto_67950 ) ( not ( = ?auto_67946 ?auto_67958 ) ) ( not ( = ?auto_67947 ?auto_67958 ) ) ( not ( = ?auto_67948 ?auto_67958 ) ) ( not ( = ?auto_67974 ?auto_67958 ) ) ( not ( = ?auto_67965 ?auto_67958 ) ) ( not ( = ?auto_67950 ?auto_67958 ) ) ( not ( = ?auto_67956 ?auto_67958 ) ) ( not ( = ?auto_67973 ?auto_67958 ) ) ( IS-CRATE ?auto_67973 ) ( not ( = ?auto_67946 ?auto_67963 ) ) ( not ( = ?auto_67947 ?auto_67963 ) ) ( not ( = ?auto_67948 ?auto_67963 ) ) ( not ( = ?auto_67974 ?auto_67963 ) ) ( not ( = ?auto_67965 ?auto_67963 ) ) ( not ( = ?auto_67950 ?auto_67963 ) ) ( not ( = ?auto_67956 ?auto_67963 ) ) ( not ( = ?auto_67973 ?auto_67963 ) ) ( not ( = ?auto_67958 ?auto_67963 ) ) ( not ( = ?auto_67964 ?auto_67961 ) ) ( not ( = ?auto_67954 ?auto_67964 ) ) ( not ( = ?auto_67966 ?auto_67964 ) ) ( not ( = ?auto_67967 ?auto_67964 ) ) ( HOIST-AT ?auto_67962 ?auto_67964 ) ( not ( = ?auto_67968 ?auto_67962 ) ) ( not ( = ?auto_67969 ?auto_67962 ) ) ( not ( = ?auto_67953 ?auto_67962 ) ) ( not ( = ?auto_67952 ?auto_67962 ) ) ( AVAILABLE ?auto_67962 ) ( SURFACE-AT ?auto_67973 ?auto_67964 ) ( ON ?auto_67973 ?auto_67960 ) ( CLEAR ?auto_67973 ) ( not ( = ?auto_67946 ?auto_67960 ) ) ( not ( = ?auto_67947 ?auto_67960 ) ) ( not ( = ?auto_67948 ?auto_67960 ) ) ( not ( = ?auto_67974 ?auto_67960 ) ) ( not ( = ?auto_67965 ?auto_67960 ) ) ( not ( = ?auto_67950 ?auto_67960 ) ) ( not ( = ?auto_67956 ?auto_67960 ) ) ( not ( = ?auto_67973 ?auto_67960 ) ) ( not ( = ?auto_67958 ?auto_67960 ) ) ( not ( = ?auto_67963 ?auto_67960 ) ) ( IS-CRATE ?auto_67963 ) ( not ( = ?auto_67946 ?auto_67971 ) ) ( not ( = ?auto_67947 ?auto_67971 ) ) ( not ( = ?auto_67948 ?auto_67971 ) ) ( not ( = ?auto_67974 ?auto_67971 ) ) ( not ( = ?auto_67965 ?auto_67971 ) ) ( not ( = ?auto_67950 ?auto_67971 ) ) ( not ( = ?auto_67956 ?auto_67971 ) ) ( not ( = ?auto_67973 ?auto_67971 ) ) ( not ( = ?auto_67958 ?auto_67971 ) ) ( not ( = ?auto_67963 ?auto_67971 ) ) ( not ( = ?auto_67960 ?auto_67971 ) ) ( not ( = ?auto_67959 ?auto_67961 ) ) ( not ( = ?auto_67954 ?auto_67959 ) ) ( not ( = ?auto_67966 ?auto_67959 ) ) ( not ( = ?auto_67967 ?auto_67959 ) ) ( not ( = ?auto_67964 ?auto_67959 ) ) ( HOIST-AT ?auto_67955 ?auto_67959 ) ( not ( = ?auto_67968 ?auto_67955 ) ) ( not ( = ?auto_67969 ?auto_67955 ) ) ( not ( = ?auto_67953 ?auto_67955 ) ) ( not ( = ?auto_67952 ?auto_67955 ) ) ( not ( = ?auto_67962 ?auto_67955 ) ) ( AVAILABLE ?auto_67955 ) ( SURFACE-AT ?auto_67963 ?auto_67959 ) ( ON ?auto_67963 ?auto_67972 ) ( CLEAR ?auto_67963 ) ( not ( = ?auto_67946 ?auto_67972 ) ) ( not ( = ?auto_67947 ?auto_67972 ) ) ( not ( = ?auto_67948 ?auto_67972 ) ) ( not ( = ?auto_67974 ?auto_67972 ) ) ( not ( = ?auto_67965 ?auto_67972 ) ) ( not ( = ?auto_67950 ?auto_67972 ) ) ( not ( = ?auto_67956 ?auto_67972 ) ) ( not ( = ?auto_67973 ?auto_67972 ) ) ( not ( = ?auto_67958 ?auto_67972 ) ) ( not ( = ?auto_67963 ?auto_67972 ) ) ( not ( = ?auto_67960 ?auto_67972 ) ) ( not ( = ?auto_67971 ?auto_67972 ) ) ( IS-CRATE ?auto_67971 ) ( not ( = ?auto_67946 ?auto_67951 ) ) ( not ( = ?auto_67947 ?auto_67951 ) ) ( not ( = ?auto_67948 ?auto_67951 ) ) ( not ( = ?auto_67974 ?auto_67951 ) ) ( not ( = ?auto_67965 ?auto_67951 ) ) ( not ( = ?auto_67950 ?auto_67951 ) ) ( not ( = ?auto_67956 ?auto_67951 ) ) ( not ( = ?auto_67973 ?auto_67951 ) ) ( not ( = ?auto_67958 ?auto_67951 ) ) ( not ( = ?auto_67963 ?auto_67951 ) ) ( not ( = ?auto_67960 ?auto_67951 ) ) ( not ( = ?auto_67971 ?auto_67951 ) ) ( not ( = ?auto_67972 ?auto_67951 ) ) ( AVAILABLE ?auto_67953 ) ( SURFACE-AT ?auto_67971 ?auto_67966 ) ( ON ?auto_67971 ?auto_67970 ) ( CLEAR ?auto_67971 ) ( not ( = ?auto_67946 ?auto_67970 ) ) ( not ( = ?auto_67947 ?auto_67970 ) ) ( not ( = ?auto_67948 ?auto_67970 ) ) ( not ( = ?auto_67974 ?auto_67970 ) ) ( not ( = ?auto_67965 ?auto_67970 ) ) ( not ( = ?auto_67950 ?auto_67970 ) ) ( not ( = ?auto_67956 ?auto_67970 ) ) ( not ( = ?auto_67973 ?auto_67970 ) ) ( not ( = ?auto_67958 ?auto_67970 ) ) ( not ( = ?auto_67963 ?auto_67970 ) ) ( not ( = ?auto_67960 ?auto_67970 ) ) ( not ( = ?auto_67971 ?auto_67970 ) ) ( not ( = ?auto_67972 ?auto_67970 ) ) ( not ( = ?auto_67951 ?auto_67970 ) ) ( SURFACE-AT ?auto_67957 ?auto_67961 ) ( CLEAR ?auto_67957 ) ( IS-CRATE ?auto_67951 ) ( not ( = ?auto_67946 ?auto_67957 ) ) ( not ( = ?auto_67947 ?auto_67957 ) ) ( not ( = ?auto_67948 ?auto_67957 ) ) ( not ( = ?auto_67974 ?auto_67957 ) ) ( not ( = ?auto_67965 ?auto_67957 ) ) ( not ( = ?auto_67950 ?auto_67957 ) ) ( not ( = ?auto_67956 ?auto_67957 ) ) ( not ( = ?auto_67973 ?auto_67957 ) ) ( not ( = ?auto_67958 ?auto_67957 ) ) ( not ( = ?auto_67963 ?auto_67957 ) ) ( not ( = ?auto_67960 ?auto_67957 ) ) ( not ( = ?auto_67971 ?auto_67957 ) ) ( not ( = ?auto_67972 ?auto_67957 ) ) ( not ( = ?auto_67951 ?auto_67957 ) ) ( not ( = ?auto_67970 ?auto_67957 ) ) ( AVAILABLE ?auto_67968 ) ( IN ?auto_67951 ?auto_67949 ) ( TRUCK-AT ?auto_67949 ?auto_67975 ) ( not ( = ?auto_67975 ?auto_67961 ) ) ( not ( = ?auto_67954 ?auto_67975 ) ) ( not ( = ?auto_67966 ?auto_67975 ) ) ( not ( = ?auto_67967 ?auto_67975 ) ) ( not ( = ?auto_67964 ?auto_67975 ) ) ( not ( = ?auto_67959 ?auto_67975 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_67949 ?auto_67975 ?auto_67961 )
      ( MAKE-ON ?auto_67946 ?auto_67947 )
      ( MAKE-ON-VERIFY ?auto_67946 ?auto_67947 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_67976 - SURFACE
      ?auto_67977 - SURFACE
    )
    :vars
    (
      ?auto_68002 - HOIST
      ?auto_67986 - PLACE
      ?auto_67987 - PLACE
      ?auto_67980 - HOIST
      ?auto_68005 - SURFACE
      ?auto_67996 - SURFACE
      ?auto_68000 - PLACE
      ?auto_67988 - HOIST
      ?auto_67999 - SURFACE
      ?auto_67979 - SURFACE
      ?auto_68001 - PLACE
      ?auto_67982 - HOIST
      ?auto_68004 - SURFACE
      ?auto_67995 - SURFACE
      ?auto_67991 - SURFACE
      ?auto_67993 - SURFACE
      ?auto_67998 - PLACE
      ?auto_67990 - HOIST
      ?auto_67989 - SURFACE
      ?auto_67997 - SURFACE
      ?auto_67983 - PLACE
      ?auto_67978 - HOIST
      ?auto_67994 - SURFACE
      ?auto_67985 - SURFACE
      ?auto_67992 - SURFACE
      ?auto_67981 - SURFACE
      ?auto_67984 - TRUCK
      ?auto_68003 - PLACE
      ?auto_68006 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_68002 ?auto_67986 ) ( IS-CRATE ?auto_67976 ) ( not ( = ?auto_67976 ?auto_67977 ) ) ( not ( = ?auto_67987 ?auto_67986 ) ) ( HOIST-AT ?auto_67980 ?auto_67987 ) ( not ( = ?auto_68002 ?auto_67980 ) ) ( AVAILABLE ?auto_67980 ) ( SURFACE-AT ?auto_67976 ?auto_67987 ) ( ON ?auto_67976 ?auto_68005 ) ( CLEAR ?auto_67976 ) ( not ( = ?auto_67976 ?auto_68005 ) ) ( not ( = ?auto_67977 ?auto_68005 ) ) ( IS-CRATE ?auto_67977 ) ( not ( = ?auto_67976 ?auto_67996 ) ) ( not ( = ?auto_67977 ?auto_67996 ) ) ( not ( = ?auto_68005 ?auto_67996 ) ) ( not ( = ?auto_68000 ?auto_67986 ) ) ( not ( = ?auto_67987 ?auto_68000 ) ) ( HOIST-AT ?auto_67988 ?auto_68000 ) ( not ( = ?auto_68002 ?auto_67988 ) ) ( not ( = ?auto_67980 ?auto_67988 ) ) ( SURFACE-AT ?auto_67977 ?auto_68000 ) ( ON ?auto_67977 ?auto_67999 ) ( CLEAR ?auto_67977 ) ( not ( = ?auto_67976 ?auto_67999 ) ) ( not ( = ?auto_67977 ?auto_67999 ) ) ( not ( = ?auto_68005 ?auto_67999 ) ) ( not ( = ?auto_67996 ?auto_67999 ) ) ( IS-CRATE ?auto_67996 ) ( not ( = ?auto_67976 ?auto_67979 ) ) ( not ( = ?auto_67977 ?auto_67979 ) ) ( not ( = ?auto_68005 ?auto_67979 ) ) ( not ( = ?auto_67996 ?auto_67979 ) ) ( not ( = ?auto_67999 ?auto_67979 ) ) ( not ( = ?auto_68001 ?auto_67986 ) ) ( not ( = ?auto_67987 ?auto_68001 ) ) ( not ( = ?auto_68000 ?auto_68001 ) ) ( HOIST-AT ?auto_67982 ?auto_68001 ) ( not ( = ?auto_68002 ?auto_67982 ) ) ( not ( = ?auto_67980 ?auto_67982 ) ) ( not ( = ?auto_67988 ?auto_67982 ) ) ( SURFACE-AT ?auto_67996 ?auto_68001 ) ( ON ?auto_67996 ?auto_68004 ) ( CLEAR ?auto_67996 ) ( not ( = ?auto_67976 ?auto_68004 ) ) ( not ( = ?auto_67977 ?auto_68004 ) ) ( not ( = ?auto_68005 ?auto_68004 ) ) ( not ( = ?auto_67996 ?auto_68004 ) ) ( not ( = ?auto_67999 ?auto_68004 ) ) ( not ( = ?auto_67979 ?auto_68004 ) ) ( IS-CRATE ?auto_67979 ) ( not ( = ?auto_67976 ?auto_67995 ) ) ( not ( = ?auto_67977 ?auto_67995 ) ) ( not ( = ?auto_68005 ?auto_67995 ) ) ( not ( = ?auto_67996 ?auto_67995 ) ) ( not ( = ?auto_67999 ?auto_67995 ) ) ( not ( = ?auto_67979 ?auto_67995 ) ) ( not ( = ?auto_68004 ?auto_67995 ) ) ( AVAILABLE ?auto_67982 ) ( SURFACE-AT ?auto_67979 ?auto_68001 ) ( ON ?auto_67979 ?auto_67991 ) ( CLEAR ?auto_67979 ) ( not ( = ?auto_67976 ?auto_67991 ) ) ( not ( = ?auto_67977 ?auto_67991 ) ) ( not ( = ?auto_68005 ?auto_67991 ) ) ( not ( = ?auto_67996 ?auto_67991 ) ) ( not ( = ?auto_67999 ?auto_67991 ) ) ( not ( = ?auto_67979 ?auto_67991 ) ) ( not ( = ?auto_68004 ?auto_67991 ) ) ( not ( = ?auto_67995 ?auto_67991 ) ) ( IS-CRATE ?auto_67995 ) ( not ( = ?auto_67976 ?auto_67993 ) ) ( not ( = ?auto_67977 ?auto_67993 ) ) ( not ( = ?auto_68005 ?auto_67993 ) ) ( not ( = ?auto_67996 ?auto_67993 ) ) ( not ( = ?auto_67999 ?auto_67993 ) ) ( not ( = ?auto_67979 ?auto_67993 ) ) ( not ( = ?auto_68004 ?auto_67993 ) ) ( not ( = ?auto_67995 ?auto_67993 ) ) ( not ( = ?auto_67991 ?auto_67993 ) ) ( not ( = ?auto_67998 ?auto_67986 ) ) ( not ( = ?auto_67987 ?auto_67998 ) ) ( not ( = ?auto_68000 ?auto_67998 ) ) ( not ( = ?auto_68001 ?auto_67998 ) ) ( HOIST-AT ?auto_67990 ?auto_67998 ) ( not ( = ?auto_68002 ?auto_67990 ) ) ( not ( = ?auto_67980 ?auto_67990 ) ) ( not ( = ?auto_67988 ?auto_67990 ) ) ( not ( = ?auto_67982 ?auto_67990 ) ) ( AVAILABLE ?auto_67990 ) ( SURFACE-AT ?auto_67995 ?auto_67998 ) ( ON ?auto_67995 ?auto_67989 ) ( CLEAR ?auto_67995 ) ( not ( = ?auto_67976 ?auto_67989 ) ) ( not ( = ?auto_67977 ?auto_67989 ) ) ( not ( = ?auto_68005 ?auto_67989 ) ) ( not ( = ?auto_67996 ?auto_67989 ) ) ( not ( = ?auto_67999 ?auto_67989 ) ) ( not ( = ?auto_67979 ?auto_67989 ) ) ( not ( = ?auto_68004 ?auto_67989 ) ) ( not ( = ?auto_67995 ?auto_67989 ) ) ( not ( = ?auto_67991 ?auto_67989 ) ) ( not ( = ?auto_67993 ?auto_67989 ) ) ( IS-CRATE ?auto_67993 ) ( not ( = ?auto_67976 ?auto_67997 ) ) ( not ( = ?auto_67977 ?auto_67997 ) ) ( not ( = ?auto_68005 ?auto_67997 ) ) ( not ( = ?auto_67996 ?auto_67997 ) ) ( not ( = ?auto_67999 ?auto_67997 ) ) ( not ( = ?auto_67979 ?auto_67997 ) ) ( not ( = ?auto_68004 ?auto_67997 ) ) ( not ( = ?auto_67995 ?auto_67997 ) ) ( not ( = ?auto_67991 ?auto_67997 ) ) ( not ( = ?auto_67993 ?auto_67997 ) ) ( not ( = ?auto_67989 ?auto_67997 ) ) ( not ( = ?auto_67983 ?auto_67986 ) ) ( not ( = ?auto_67987 ?auto_67983 ) ) ( not ( = ?auto_68000 ?auto_67983 ) ) ( not ( = ?auto_68001 ?auto_67983 ) ) ( not ( = ?auto_67998 ?auto_67983 ) ) ( HOIST-AT ?auto_67978 ?auto_67983 ) ( not ( = ?auto_68002 ?auto_67978 ) ) ( not ( = ?auto_67980 ?auto_67978 ) ) ( not ( = ?auto_67988 ?auto_67978 ) ) ( not ( = ?auto_67982 ?auto_67978 ) ) ( not ( = ?auto_67990 ?auto_67978 ) ) ( AVAILABLE ?auto_67978 ) ( SURFACE-AT ?auto_67993 ?auto_67983 ) ( ON ?auto_67993 ?auto_67994 ) ( CLEAR ?auto_67993 ) ( not ( = ?auto_67976 ?auto_67994 ) ) ( not ( = ?auto_67977 ?auto_67994 ) ) ( not ( = ?auto_68005 ?auto_67994 ) ) ( not ( = ?auto_67996 ?auto_67994 ) ) ( not ( = ?auto_67999 ?auto_67994 ) ) ( not ( = ?auto_67979 ?auto_67994 ) ) ( not ( = ?auto_68004 ?auto_67994 ) ) ( not ( = ?auto_67995 ?auto_67994 ) ) ( not ( = ?auto_67991 ?auto_67994 ) ) ( not ( = ?auto_67993 ?auto_67994 ) ) ( not ( = ?auto_67989 ?auto_67994 ) ) ( not ( = ?auto_67997 ?auto_67994 ) ) ( IS-CRATE ?auto_67997 ) ( not ( = ?auto_67976 ?auto_67985 ) ) ( not ( = ?auto_67977 ?auto_67985 ) ) ( not ( = ?auto_68005 ?auto_67985 ) ) ( not ( = ?auto_67996 ?auto_67985 ) ) ( not ( = ?auto_67999 ?auto_67985 ) ) ( not ( = ?auto_67979 ?auto_67985 ) ) ( not ( = ?auto_68004 ?auto_67985 ) ) ( not ( = ?auto_67995 ?auto_67985 ) ) ( not ( = ?auto_67991 ?auto_67985 ) ) ( not ( = ?auto_67993 ?auto_67985 ) ) ( not ( = ?auto_67989 ?auto_67985 ) ) ( not ( = ?auto_67997 ?auto_67985 ) ) ( not ( = ?auto_67994 ?auto_67985 ) ) ( AVAILABLE ?auto_67988 ) ( SURFACE-AT ?auto_67997 ?auto_68000 ) ( ON ?auto_67997 ?auto_67992 ) ( CLEAR ?auto_67997 ) ( not ( = ?auto_67976 ?auto_67992 ) ) ( not ( = ?auto_67977 ?auto_67992 ) ) ( not ( = ?auto_68005 ?auto_67992 ) ) ( not ( = ?auto_67996 ?auto_67992 ) ) ( not ( = ?auto_67999 ?auto_67992 ) ) ( not ( = ?auto_67979 ?auto_67992 ) ) ( not ( = ?auto_68004 ?auto_67992 ) ) ( not ( = ?auto_67995 ?auto_67992 ) ) ( not ( = ?auto_67991 ?auto_67992 ) ) ( not ( = ?auto_67993 ?auto_67992 ) ) ( not ( = ?auto_67989 ?auto_67992 ) ) ( not ( = ?auto_67997 ?auto_67992 ) ) ( not ( = ?auto_67994 ?auto_67992 ) ) ( not ( = ?auto_67985 ?auto_67992 ) ) ( SURFACE-AT ?auto_67981 ?auto_67986 ) ( CLEAR ?auto_67981 ) ( IS-CRATE ?auto_67985 ) ( not ( = ?auto_67976 ?auto_67981 ) ) ( not ( = ?auto_67977 ?auto_67981 ) ) ( not ( = ?auto_68005 ?auto_67981 ) ) ( not ( = ?auto_67996 ?auto_67981 ) ) ( not ( = ?auto_67999 ?auto_67981 ) ) ( not ( = ?auto_67979 ?auto_67981 ) ) ( not ( = ?auto_68004 ?auto_67981 ) ) ( not ( = ?auto_67995 ?auto_67981 ) ) ( not ( = ?auto_67991 ?auto_67981 ) ) ( not ( = ?auto_67993 ?auto_67981 ) ) ( not ( = ?auto_67989 ?auto_67981 ) ) ( not ( = ?auto_67997 ?auto_67981 ) ) ( not ( = ?auto_67994 ?auto_67981 ) ) ( not ( = ?auto_67985 ?auto_67981 ) ) ( not ( = ?auto_67992 ?auto_67981 ) ) ( AVAILABLE ?auto_68002 ) ( TRUCK-AT ?auto_67984 ?auto_68003 ) ( not ( = ?auto_68003 ?auto_67986 ) ) ( not ( = ?auto_67987 ?auto_68003 ) ) ( not ( = ?auto_68000 ?auto_68003 ) ) ( not ( = ?auto_68001 ?auto_68003 ) ) ( not ( = ?auto_67998 ?auto_68003 ) ) ( not ( = ?auto_67983 ?auto_68003 ) ) ( HOIST-AT ?auto_68006 ?auto_68003 ) ( LIFTING ?auto_68006 ?auto_67985 ) ( not ( = ?auto_68002 ?auto_68006 ) ) ( not ( = ?auto_67980 ?auto_68006 ) ) ( not ( = ?auto_67988 ?auto_68006 ) ) ( not ( = ?auto_67982 ?auto_68006 ) ) ( not ( = ?auto_67990 ?auto_68006 ) ) ( not ( = ?auto_67978 ?auto_68006 ) ) )
    :subtasks
    ( ( !LOAD ?auto_68006 ?auto_67985 ?auto_67984 ?auto_68003 )
      ( MAKE-ON ?auto_67976 ?auto_67977 )
      ( MAKE-ON-VERIFY ?auto_67976 ?auto_67977 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_68007 - SURFACE
      ?auto_68008 - SURFACE
    )
    :vars
    (
      ?auto_68012 - HOIST
      ?auto_68031 - PLACE
      ?auto_68032 - PLACE
      ?auto_68017 - HOIST
      ?auto_68014 - SURFACE
      ?auto_68025 - SURFACE
      ?auto_68029 - PLACE
      ?auto_68033 - HOIST
      ?auto_68028 - SURFACE
      ?auto_68013 - SURFACE
      ?auto_68022 - PLACE
      ?auto_68018 - HOIST
      ?auto_68009 - SURFACE
      ?auto_68024 - SURFACE
      ?auto_68035 - SURFACE
      ?auto_68030 - SURFACE
      ?auto_68027 - PLACE
      ?auto_68036 - HOIST
      ?auto_68034 - SURFACE
      ?auto_68026 - SURFACE
      ?auto_68015 - PLACE
      ?auto_68020 - HOIST
      ?auto_68023 - SURFACE
      ?auto_68037 - SURFACE
      ?auto_68021 - SURFACE
      ?auto_68016 - SURFACE
      ?auto_68010 - TRUCK
      ?auto_68011 - PLACE
      ?auto_68019 - HOIST
      ?auto_68038 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_68012 ?auto_68031 ) ( IS-CRATE ?auto_68007 ) ( not ( = ?auto_68007 ?auto_68008 ) ) ( not ( = ?auto_68032 ?auto_68031 ) ) ( HOIST-AT ?auto_68017 ?auto_68032 ) ( not ( = ?auto_68012 ?auto_68017 ) ) ( AVAILABLE ?auto_68017 ) ( SURFACE-AT ?auto_68007 ?auto_68032 ) ( ON ?auto_68007 ?auto_68014 ) ( CLEAR ?auto_68007 ) ( not ( = ?auto_68007 ?auto_68014 ) ) ( not ( = ?auto_68008 ?auto_68014 ) ) ( IS-CRATE ?auto_68008 ) ( not ( = ?auto_68007 ?auto_68025 ) ) ( not ( = ?auto_68008 ?auto_68025 ) ) ( not ( = ?auto_68014 ?auto_68025 ) ) ( not ( = ?auto_68029 ?auto_68031 ) ) ( not ( = ?auto_68032 ?auto_68029 ) ) ( HOIST-AT ?auto_68033 ?auto_68029 ) ( not ( = ?auto_68012 ?auto_68033 ) ) ( not ( = ?auto_68017 ?auto_68033 ) ) ( SURFACE-AT ?auto_68008 ?auto_68029 ) ( ON ?auto_68008 ?auto_68028 ) ( CLEAR ?auto_68008 ) ( not ( = ?auto_68007 ?auto_68028 ) ) ( not ( = ?auto_68008 ?auto_68028 ) ) ( not ( = ?auto_68014 ?auto_68028 ) ) ( not ( = ?auto_68025 ?auto_68028 ) ) ( IS-CRATE ?auto_68025 ) ( not ( = ?auto_68007 ?auto_68013 ) ) ( not ( = ?auto_68008 ?auto_68013 ) ) ( not ( = ?auto_68014 ?auto_68013 ) ) ( not ( = ?auto_68025 ?auto_68013 ) ) ( not ( = ?auto_68028 ?auto_68013 ) ) ( not ( = ?auto_68022 ?auto_68031 ) ) ( not ( = ?auto_68032 ?auto_68022 ) ) ( not ( = ?auto_68029 ?auto_68022 ) ) ( HOIST-AT ?auto_68018 ?auto_68022 ) ( not ( = ?auto_68012 ?auto_68018 ) ) ( not ( = ?auto_68017 ?auto_68018 ) ) ( not ( = ?auto_68033 ?auto_68018 ) ) ( SURFACE-AT ?auto_68025 ?auto_68022 ) ( ON ?auto_68025 ?auto_68009 ) ( CLEAR ?auto_68025 ) ( not ( = ?auto_68007 ?auto_68009 ) ) ( not ( = ?auto_68008 ?auto_68009 ) ) ( not ( = ?auto_68014 ?auto_68009 ) ) ( not ( = ?auto_68025 ?auto_68009 ) ) ( not ( = ?auto_68028 ?auto_68009 ) ) ( not ( = ?auto_68013 ?auto_68009 ) ) ( IS-CRATE ?auto_68013 ) ( not ( = ?auto_68007 ?auto_68024 ) ) ( not ( = ?auto_68008 ?auto_68024 ) ) ( not ( = ?auto_68014 ?auto_68024 ) ) ( not ( = ?auto_68025 ?auto_68024 ) ) ( not ( = ?auto_68028 ?auto_68024 ) ) ( not ( = ?auto_68013 ?auto_68024 ) ) ( not ( = ?auto_68009 ?auto_68024 ) ) ( AVAILABLE ?auto_68018 ) ( SURFACE-AT ?auto_68013 ?auto_68022 ) ( ON ?auto_68013 ?auto_68035 ) ( CLEAR ?auto_68013 ) ( not ( = ?auto_68007 ?auto_68035 ) ) ( not ( = ?auto_68008 ?auto_68035 ) ) ( not ( = ?auto_68014 ?auto_68035 ) ) ( not ( = ?auto_68025 ?auto_68035 ) ) ( not ( = ?auto_68028 ?auto_68035 ) ) ( not ( = ?auto_68013 ?auto_68035 ) ) ( not ( = ?auto_68009 ?auto_68035 ) ) ( not ( = ?auto_68024 ?auto_68035 ) ) ( IS-CRATE ?auto_68024 ) ( not ( = ?auto_68007 ?auto_68030 ) ) ( not ( = ?auto_68008 ?auto_68030 ) ) ( not ( = ?auto_68014 ?auto_68030 ) ) ( not ( = ?auto_68025 ?auto_68030 ) ) ( not ( = ?auto_68028 ?auto_68030 ) ) ( not ( = ?auto_68013 ?auto_68030 ) ) ( not ( = ?auto_68009 ?auto_68030 ) ) ( not ( = ?auto_68024 ?auto_68030 ) ) ( not ( = ?auto_68035 ?auto_68030 ) ) ( not ( = ?auto_68027 ?auto_68031 ) ) ( not ( = ?auto_68032 ?auto_68027 ) ) ( not ( = ?auto_68029 ?auto_68027 ) ) ( not ( = ?auto_68022 ?auto_68027 ) ) ( HOIST-AT ?auto_68036 ?auto_68027 ) ( not ( = ?auto_68012 ?auto_68036 ) ) ( not ( = ?auto_68017 ?auto_68036 ) ) ( not ( = ?auto_68033 ?auto_68036 ) ) ( not ( = ?auto_68018 ?auto_68036 ) ) ( AVAILABLE ?auto_68036 ) ( SURFACE-AT ?auto_68024 ?auto_68027 ) ( ON ?auto_68024 ?auto_68034 ) ( CLEAR ?auto_68024 ) ( not ( = ?auto_68007 ?auto_68034 ) ) ( not ( = ?auto_68008 ?auto_68034 ) ) ( not ( = ?auto_68014 ?auto_68034 ) ) ( not ( = ?auto_68025 ?auto_68034 ) ) ( not ( = ?auto_68028 ?auto_68034 ) ) ( not ( = ?auto_68013 ?auto_68034 ) ) ( not ( = ?auto_68009 ?auto_68034 ) ) ( not ( = ?auto_68024 ?auto_68034 ) ) ( not ( = ?auto_68035 ?auto_68034 ) ) ( not ( = ?auto_68030 ?auto_68034 ) ) ( IS-CRATE ?auto_68030 ) ( not ( = ?auto_68007 ?auto_68026 ) ) ( not ( = ?auto_68008 ?auto_68026 ) ) ( not ( = ?auto_68014 ?auto_68026 ) ) ( not ( = ?auto_68025 ?auto_68026 ) ) ( not ( = ?auto_68028 ?auto_68026 ) ) ( not ( = ?auto_68013 ?auto_68026 ) ) ( not ( = ?auto_68009 ?auto_68026 ) ) ( not ( = ?auto_68024 ?auto_68026 ) ) ( not ( = ?auto_68035 ?auto_68026 ) ) ( not ( = ?auto_68030 ?auto_68026 ) ) ( not ( = ?auto_68034 ?auto_68026 ) ) ( not ( = ?auto_68015 ?auto_68031 ) ) ( not ( = ?auto_68032 ?auto_68015 ) ) ( not ( = ?auto_68029 ?auto_68015 ) ) ( not ( = ?auto_68022 ?auto_68015 ) ) ( not ( = ?auto_68027 ?auto_68015 ) ) ( HOIST-AT ?auto_68020 ?auto_68015 ) ( not ( = ?auto_68012 ?auto_68020 ) ) ( not ( = ?auto_68017 ?auto_68020 ) ) ( not ( = ?auto_68033 ?auto_68020 ) ) ( not ( = ?auto_68018 ?auto_68020 ) ) ( not ( = ?auto_68036 ?auto_68020 ) ) ( AVAILABLE ?auto_68020 ) ( SURFACE-AT ?auto_68030 ?auto_68015 ) ( ON ?auto_68030 ?auto_68023 ) ( CLEAR ?auto_68030 ) ( not ( = ?auto_68007 ?auto_68023 ) ) ( not ( = ?auto_68008 ?auto_68023 ) ) ( not ( = ?auto_68014 ?auto_68023 ) ) ( not ( = ?auto_68025 ?auto_68023 ) ) ( not ( = ?auto_68028 ?auto_68023 ) ) ( not ( = ?auto_68013 ?auto_68023 ) ) ( not ( = ?auto_68009 ?auto_68023 ) ) ( not ( = ?auto_68024 ?auto_68023 ) ) ( not ( = ?auto_68035 ?auto_68023 ) ) ( not ( = ?auto_68030 ?auto_68023 ) ) ( not ( = ?auto_68034 ?auto_68023 ) ) ( not ( = ?auto_68026 ?auto_68023 ) ) ( IS-CRATE ?auto_68026 ) ( not ( = ?auto_68007 ?auto_68037 ) ) ( not ( = ?auto_68008 ?auto_68037 ) ) ( not ( = ?auto_68014 ?auto_68037 ) ) ( not ( = ?auto_68025 ?auto_68037 ) ) ( not ( = ?auto_68028 ?auto_68037 ) ) ( not ( = ?auto_68013 ?auto_68037 ) ) ( not ( = ?auto_68009 ?auto_68037 ) ) ( not ( = ?auto_68024 ?auto_68037 ) ) ( not ( = ?auto_68035 ?auto_68037 ) ) ( not ( = ?auto_68030 ?auto_68037 ) ) ( not ( = ?auto_68034 ?auto_68037 ) ) ( not ( = ?auto_68026 ?auto_68037 ) ) ( not ( = ?auto_68023 ?auto_68037 ) ) ( AVAILABLE ?auto_68033 ) ( SURFACE-AT ?auto_68026 ?auto_68029 ) ( ON ?auto_68026 ?auto_68021 ) ( CLEAR ?auto_68026 ) ( not ( = ?auto_68007 ?auto_68021 ) ) ( not ( = ?auto_68008 ?auto_68021 ) ) ( not ( = ?auto_68014 ?auto_68021 ) ) ( not ( = ?auto_68025 ?auto_68021 ) ) ( not ( = ?auto_68028 ?auto_68021 ) ) ( not ( = ?auto_68013 ?auto_68021 ) ) ( not ( = ?auto_68009 ?auto_68021 ) ) ( not ( = ?auto_68024 ?auto_68021 ) ) ( not ( = ?auto_68035 ?auto_68021 ) ) ( not ( = ?auto_68030 ?auto_68021 ) ) ( not ( = ?auto_68034 ?auto_68021 ) ) ( not ( = ?auto_68026 ?auto_68021 ) ) ( not ( = ?auto_68023 ?auto_68021 ) ) ( not ( = ?auto_68037 ?auto_68021 ) ) ( SURFACE-AT ?auto_68016 ?auto_68031 ) ( CLEAR ?auto_68016 ) ( IS-CRATE ?auto_68037 ) ( not ( = ?auto_68007 ?auto_68016 ) ) ( not ( = ?auto_68008 ?auto_68016 ) ) ( not ( = ?auto_68014 ?auto_68016 ) ) ( not ( = ?auto_68025 ?auto_68016 ) ) ( not ( = ?auto_68028 ?auto_68016 ) ) ( not ( = ?auto_68013 ?auto_68016 ) ) ( not ( = ?auto_68009 ?auto_68016 ) ) ( not ( = ?auto_68024 ?auto_68016 ) ) ( not ( = ?auto_68035 ?auto_68016 ) ) ( not ( = ?auto_68030 ?auto_68016 ) ) ( not ( = ?auto_68034 ?auto_68016 ) ) ( not ( = ?auto_68026 ?auto_68016 ) ) ( not ( = ?auto_68023 ?auto_68016 ) ) ( not ( = ?auto_68037 ?auto_68016 ) ) ( not ( = ?auto_68021 ?auto_68016 ) ) ( AVAILABLE ?auto_68012 ) ( TRUCK-AT ?auto_68010 ?auto_68011 ) ( not ( = ?auto_68011 ?auto_68031 ) ) ( not ( = ?auto_68032 ?auto_68011 ) ) ( not ( = ?auto_68029 ?auto_68011 ) ) ( not ( = ?auto_68022 ?auto_68011 ) ) ( not ( = ?auto_68027 ?auto_68011 ) ) ( not ( = ?auto_68015 ?auto_68011 ) ) ( HOIST-AT ?auto_68019 ?auto_68011 ) ( not ( = ?auto_68012 ?auto_68019 ) ) ( not ( = ?auto_68017 ?auto_68019 ) ) ( not ( = ?auto_68033 ?auto_68019 ) ) ( not ( = ?auto_68018 ?auto_68019 ) ) ( not ( = ?auto_68036 ?auto_68019 ) ) ( not ( = ?auto_68020 ?auto_68019 ) ) ( AVAILABLE ?auto_68019 ) ( SURFACE-AT ?auto_68037 ?auto_68011 ) ( ON ?auto_68037 ?auto_68038 ) ( CLEAR ?auto_68037 ) ( not ( = ?auto_68007 ?auto_68038 ) ) ( not ( = ?auto_68008 ?auto_68038 ) ) ( not ( = ?auto_68014 ?auto_68038 ) ) ( not ( = ?auto_68025 ?auto_68038 ) ) ( not ( = ?auto_68028 ?auto_68038 ) ) ( not ( = ?auto_68013 ?auto_68038 ) ) ( not ( = ?auto_68009 ?auto_68038 ) ) ( not ( = ?auto_68024 ?auto_68038 ) ) ( not ( = ?auto_68035 ?auto_68038 ) ) ( not ( = ?auto_68030 ?auto_68038 ) ) ( not ( = ?auto_68034 ?auto_68038 ) ) ( not ( = ?auto_68026 ?auto_68038 ) ) ( not ( = ?auto_68023 ?auto_68038 ) ) ( not ( = ?auto_68037 ?auto_68038 ) ) ( not ( = ?auto_68021 ?auto_68038 ) ) ( not ( = ?auto_68016 ?auto_68038 ) ) )
    :subtasks
    ( ( !LIFT ?auto_68019 ?auto_68037 ?auto_68038 ?auto_68011 )
      ( MAKE-ON ?auto_68007 ?auto_68008 )
      ( MAKE-ON-VERIFY ?auto_68007 ?auto_68008 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_68039 - SURFACE
      ?auto_68040 - SURFACE
    )
    :vars
    (
      ?auto_68064 - HOIST
      ?auto_68059 - PLACE
      ?auto_68052 - PLACE
      ?auto_68046 - HOIST
      ?auto_68069 - SURFACE
      ?auto_68053 - SURFACE
      ?auto_68057 - PLACE
      ?auto_68042 - HOIST
      ?auto_68056 - SURFACE
      ?auto_68068 - SURFACE
      ?auto_68043 - PLACE
      ?auto_68048 - HOIST
      ?auto_68061 - SURFACE
      ?auto_68060 - SURFACE
      ?auto_68050 - SURFACE
      ?auto_68058 - SURFACE
      ?auto_68055 - PLACE
      ?auto_68049 - HOIST
      ?auto_68041 - SURFACE
      ?auto_68054 - SURFACE
      ?auto_68066 - PLACE
      ?auto_68044 - HOIST
      ?auto_68065 - SURFACE
      ?auto_68051 - SURFACE
      ?auto_68047 - SURFACE
      ?auto_68045 - SURFACE
      ?auto_68063 - PLACE
      ?auto_68070 - HOIST
      ?auto_68067 - SURFACE
      ?auto_68062 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_68064 ?auto_68059 ) ( IS-CRATE ?auto_68039 ) ( not ( = ?auto_68039 ?auto_68040 ) ) ( not ( = ?auto_68052 ?auto_68059 ) ) ( HOIST-AT ?auto_68046 ?auto_68052 ) ( not ( = ?auto_68064 ?auto_68046 ) ) ( AVAILABLE ?auto_68046 ) ( SURFACE-AT ?auto_68039 ?auto_68052 ) ( ON ?auto_68039 ?auto_68069 ) ( CLEAR ?auto_68039 ) ( not ( = ?auto_68039 ?auto_68069 ) ) ( not ( = ?auto_68040 ?auto_68069 ) ) ( IS-CRATE ?auto_68040 ) ( not ( = ?auto_68039 ?auto_68053 ) ) ( not ( = ?auto_68040 ?auto_68053 ) ) ( not ( = ?auto_68069 ?auto_68053 ) ) ( not ( = ?auto_68057 ?auto_68059 ) ) ( not ( = ?auto_68052 ?auto_68057 ) ) ( HOIST-AT ?auto_68042 ?auto_68057 ) ( not ( = ?auto_68064 ?auto_68042 ) ) ( not ( = ?auto_68046 ?auto_68042 ) ) ( SURFACE-AT ?auto_68040 ?auto_68057 ) ( ON ?auto_68040 ?auto_68056 ) ( CLEAR ?auto_68040 ) ( not ( = ?auto_68039 ?auto_68056 ) ) ( not ( = ?auto_68040 ?auto_68056 ) ) ( not ( = ?auto_68069 ?auto_68056 ) ) ( not ( = ?auto_68053 ?auto_68056 ) ) ( IS-CRATE ?auto_68053 ) ( not ( = ?auto_68039 ?auto_68068 ) ) ( not ( = ?auto_68040 ?auto_68068 ) ) ( not ( = ?auto_68069 ?auto_68068 ) ) ( not ( = ?auto_68053 ?auto_68068 ) ) ( not ( = ?auto_68056 ?auto_68068 ) ) ( not ( = ?auto_68043 ?auto_68059 ) ) ( not ( = ?auto_68052 ?auto_68043 ) ) ( not ( = ?auto_68057 ?auto_68043 ) ) ( HOIST-AT ?auto_68048 ?auto_68043 ) ( not ( = ?auto_68064 ?auto_68048 ) ) ( not ( = ?auto_68046 ?auto_68048 ) ) ( not ( = ?auto_68042 ?auto_68048 ) ) ( SURFACE-AT ?auto_68053 ?auto_68043 ) ( ON ?auto_68053 ?auto_68061 ) ( CLEAR ?auto_68053 ) ( not ( = ?auto_68039 ?auto_68061 ) ) ( not ( = ?auto_68040 ?auto_68061 ) ) ( not ( = ?auto_68069 ?auto_68061 ) ) ( not ( = ?auto_68053 ?auto_68061 ) ) ( not ( = ?auto_68056 ?auto_68061 ) ) ( not ( = ?auto_68068 ?auto_68061 ) ) ( IS-CRATE ?auto_68068 ) ( not ( = ?auto_68039 ?auto_68060 ) ) ( not ( = ?auto_68040 ?auto_68060 ) ) ( not ( = ?auto_68069 ?auto_68060 ) ) ( not ( = ?auto_68053 ?auto_68060 ) ) ( not ( = ?auto_68056 ?auto_68060 ) ) ( not ( = ?auto_68068 ?auto_68060 ) ) ( not ( = ?auto_68061 ?auto_68060 ) ) ( AVAILABLE ?auto_68048 ) ( SURFACE-AT ?auto_68068 ?auto_68043 ) ( ON ?auto_68068 ?auto_68050 ) ( CLEAR ?auto_68068 ) ( not ( = ?auto_68039 ?auto_68050 ) ) ( not ( = ?auto_68040 ?auto_68050 ) ) ( not ( = ?auto_68069 ?auto_68050 ) ) ( not ( = ?auto_68053 ?auto_68050 ) ) ( not ( = ?auto_68056 ?auto_68050 ) ) ( not ( = ?auto_68068 ?auto_68050 ) ) ( not ( = ?auto_68061 ?auto_68050 ) ) ( not ( = ?auto_68060 ?auto_68050 ) ) ( IS-CRATE ?auto_68060 ) ( not ( = ?auto_68039 ?auto_68058 ) ) ( not ( = ?auto_68040 ?auto_68058 ) ) ( not ( = ?auto_68069 ?auto_68058 ) ) ( not ( = ?auto_68053 ?auto_68058 ) ) ( not ( = ?auto_68056 ?auto_68058 ) ) ( not ( = ?auto_68068 ?auto_68058 ) ) ( not ( = ?auto_68061 ?auto_68058 ) ) ( not ( = ?auto_68060 ?auto_68058 ) ) ( not ( = ?auto_68050 ?auto_68058 ) ) ( not ( = ?auto_68055 ?auto_68059 ) ) ( not ( = ?auto_68052 ?auto_68055 ) ) ( not ( = ?auto_68057 ?auto_68055 ) ) ( not ( = ?auto_68043 ?auto_68055 ) ) ( HOIST-AT ?auto_68049 ?auto_68055 ) ( not ( = ?auto_68064 ?auto_68049 ) ) ( not ( = ?auto_68046 ?auto_68049 ) ) ( not ( = ?auto_68042 ?auto_68049 ) ) ( not ( = ?auto_68048 ?auto_68049 ) ) ( AVAILABLE ?auto_68049 ) ( SURFACE-AT ?auto_68060 ?auto_68055 ) ( ON ?auto_68060 ?auto_68041 ) ( CLEAR ?auto_68060 ) ( not ( = ?auto_68039 ?auto_68041 ) ) ( not ( = ?auto_68040 ?auto_68041 ) ) ( not ( = ?auto_68069 ?auto_68041 ) ) ( not ( = ?auto_68053 ?auto_68041 ) ) ( not ( = ?auto_68056 ?auto_68041 ) ) ( not ( = ?auto_68068 ?auto_68041 ) ) ( not ( = ?auto_68061 ?auto_68041 ) ) ( not ( = ?auto_68060 ?auto_68041 ) ) ( not ( = ?auto_68050 ?auto_68041 ) ) ( not ( = ?auto_68058 ?auto_68041 ) ) ( IS-CRATE ?auto_68058 ) ( not ( = ?auto_68039 ?auto_68054 ) ) ( not ( = ?auto_68040 ?auto_68054 ) ) ( not ( = ?auto_68069 ?auto_68054 ) ) ( not ( = ?auto_68053 ?auto_68054 ) ) ( not ( = ?auto_68056 ?auto_68054 ) ) ( not ( = ?auto_68068 ?auto_68054 ) ) ( not ( = ?auto_68061 ?auto_68054 ) ) ( not ( = ?auto_68060 ?auto_68054 ) ) ( not ( = ?auto_68050 ?auto_68054 ) ) ( not ( = ?auto_68058 ?auto_68054 ) ) ( not ( = ?auto_68041 ?auto_68054 ) ) ( not ( = ?auto_68066 ?auto_68059 ) ) ( not ( = ?auto_68052 ?auto_68066 ) ) ( not ( = ?auto_68057 ?auto_68066 ) ) ( not ( = ?auto_68043 ?auto_68066 ) ) ( not ( = ?auto_68055 ?auto_68066 ) ) ( HOIST-AT ?auto_68044 ?auto_68066 ) ( not ( = ?auto_68064 ?auto_68044 ) ) ( not ( = ?auto_68046 ?auto_68044 ) ) ( not ( = ?auto_68042 ?auto_68044 ) ) ( not ( = ?auto_68048 ?auto_68044 ) ) ( not ( = ?auto_68049 ?auto_68044 ) ) ( AVAILABLE ?auto_68044 ) ( SURFACE-AT ?auto_68058 ?auto_68066 ) ( ON ?auto_68058 ?auto_68065 ) ( CLEAR ?auto_68058 ) ( not ( = ?auto_68039 ?auto_68065 ) ) ( not ( = ?auto_68040 ?auto_68065 ) ) ( not ( = ?auto_68069 ?auto_68065 ) ) ( not ( = ?auto_68053 ?auto_68065 ) ) ( not ( = ?auto_68056 ?auto_68065 ) ) ( not ( = ?auto_68068 ?auto_68065 ) ) ( not ( = ?auto_68061 ?auto_68065 ) ) ( not ( = ?auto_68060 ?auto_68065 ) ) ( not ( = ?auto_68050 ?auto_68065 ) ) ( not ( = ?auto_68058 ?auto_68065 ) ) ( not ( = ?auto_68041 ?auto_68065 ) ) ( not ( = ?auto_68054 ?auto_68065 ) ) ( IS-CRATE ?auto_68054 ) ( not ( = ?auto_68039 ?auto_68051 ) ) ( not ( = ?auto_68040 ?auto_68051 ) ) ( not ( = ?auto_68069 ?auto_68051 ) ) ( not ( = ?auto_68053 ?auto_68051 ) ) ( not ( = ?auto_68056 ?auto_68051 ) ) ( not ( = ?auto_68068 ?auto_68051 ) ) ( not ( = ?auto_68061 ?auto_68051 ) ) ( not ( = ?auto_68060 ?auto_68051 ) ) ( not ( = ?auto_68050 ?auto_68051 ) ) ( not ( = ?auto_68058 ?auto_68051 ) ) ( not ( = ?auto_68041 ?auto_68051 ) ) ( not ( = ?auto_68054 ?auto_68051 ) ) ( not ( = ?auto_68065 ?auto_68051 ) ) ( AVAILABLE ?auto_68042 ) ( SURFACE-AT ?auto_68054 ?auto_68057 ) ( ON ?auto_68054 ?auto_68047 ) ( CLEAR ?auto_68054 ) ( not ( = ?auto_68039 ?auto_68047 ) ) ( not ( = ?auto_68040 ?auto_68047 ) ) ( not ( = ?auto_68069 ?auto_68047 ) ) ( not ( = ?auto_68053 ?auto_68047 ) ) ( not ( = ?auto_68056 ?auto_68047 ) ) ( not ( = ?auto_68068 ?auto_68047 ) ) ( not ( = ?auto_68061 ?auto_68047 ) ) ( not ( = ?auto_68060 ?auto_68047 ) ) ( not ( = ?auto_68050 ?auto_68047 ) ) ( not ( = ?auto_68058 ?auto_68047 ) ) ( not ( = ?auto_68041 ?auto_68047 ) ) ( not ( = ?auto_68054 ?auto_68047 ) ) ( not ( = ?auto_68065 ?auto_68047 ) ) ( not ( = ?auto_68051 ?auto_68047 ) ) ( SURFACE-AT ?auto_68045 ?auto_68059 ) ( CLEAR ?auto_68045 ) ( IS-CRATE ?auto_68051 ) ( not ( = ?auto_68039 ?auto_68045 ) ) ( not ( = ?auto_68040 ?auto_68045 ) ) ( not ( = ?auto_68069 ?auto_68045 ) ) ( not ( = ?auto_68053 ?auto_68045 ) ) ( not ( = ?auto_68056 ?auto_68045 ) ) ( not ( = ?auto_68068 ?auto_68045 ) ) ( not ( = ?auto_68061 ?auto_68045 ) ) ( not ( = ?auto_68060 ?auto_68045 ) ) ( not ( = ?auto_68050 ?auto_68045 ) ) ( not ( = ?auto_68058 ?auto_68045 ) ) ( not ( = ?auto_68041 ?auto_68045 ) ) ( not ( = ?auto_68054 ?auto_68045 ) ) ( not ( = ?auto_68065 ?auto_68045 ) ) ( not ( = ?auto_68051 ?auto_68045 ) ) ( not ( = ?auto_68047 ?auto_68045 ) ) ( AVAILABLE ?auto_68064 ) ( not ( = ?auto_68063 ?auto_68059 ) ) ( not ( = ?auto_68052 ?auto_68063 ) ) ( not ( = ?auto_68057 ?auto_68063 ) ) ( not ( = ?auto_68043 ?auto_68063 ) ) ( not ( = ?auto_68055 ?auto_68063 ) ) ( not ( = ?auto_68066 ?auto_68063 ) ) ( HOIST-AT ?auto_68070 ?auto_68063 ) ( not ( = ?auto_68064 ?auto_68070 ) ) ( not ( = ?auto_68046 ?auto_68070 ) ) ( not ( = ?auto_68042 ?auto_68070 ) ) ( not ( = ?auto_68048 ?auto_68070 ) ) ( not ( = ?auto_68049 ?auto_68070 ) ) ( not ( = ?auto_68044 ?auto_68070 ) ) ( AVAILABLE ?auto_68070 ) ( SURFACE-AT ?auto_68051 ?auto_68063 ) ( ON ?auto_68051 ?auto_68067 ) ( CLEAR ?auto_68051 ) ( not ( = ?auto_68039 ?auto_68067 ) ) ( not ( = ?auto_68040 ?auto_68067 ) ) ( not ( = ?auto_68069 ?auto_68067 ) ) ( not ( = ?auto_68053 ?auto_68067 ) ) ( not ( = ?auto_68056 ?auto_68067 ) ) ( not ( = ?auto_68068 ?auto_68067 ) ) ( not ( = ?auto_68061 ?auto_68067 ) ) ( not ( = ?auto_68060 ?auto_68067 ) ) ( not ( = ?auto_68050 ?auto_68067 ) ) ( not ( = ?auto_68058 ?auto_68067 ) ) ( not ( = ?auto_68041 ?auto_68067 ) ) ( not ( = ?auto_68054 ?auto_68067 ) ) ( not ( = ?auto_68065 ?auto_68067 ) ) ( not ( = ?auto_68051 ?auto_68067 ) ) ( not ( = ?auto_68047 ?auto_68067 ) ) ( not ( = ?auto_68045 ?auto_68067 ) ) ( TRUCK-AT ?auto_68062 ?auto_68059 ) )
    :subtasks
    ( ( !DRIVE ?auto_68062 ?auto_68059 ?auto_68063 )
      ( MAKE-ON ?auto_68039 ?auto_68040 )
      ( MAKE-ON-VERIFY ?auto_68039 ?auto_68040 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_68071 - SURFACE
      ?auto_68072 - SURFACE
    )
    :vars
    (
      ?auto_68079 - HOIST
      ?auto_68089 - PLACE
      ?auto_68073 - PLACE
      ?auto_68095 - HOIST
      ?auto_68101 - SURFACE
      ?auto_68074 - SURFACE
      ?auto_68085 - PLACE
      ?auto_68082 - HOIST
      ?auto_68076 - SURFACE
      ?auto_68100 - SURFACE
      ?auto_68077 - PLACE
      ?auto_68080 - HOIST
      ?auto_68091 - SURFACE
      ?auto_68090 - SURFACE
      ?auto_68097 - SURFACE
      ?auto_68086 - SURFACE
      ?auto_68075 - PLACE
      ?auto_68088 - HOIST
      ?auto_68083 - SURFACE
      ?auto_68078 - SURFACE
      ?auto_68098 - PLACE
      ?auto_68096 - HOIST
      ?auto_68094 - SURFACE
      ?auto_68081 - SURFACE
      ?auto_68087 - SURFACE
      ?auto_68084 - SURFACE
      ?auto_68093 - PLACE
      ?auto_68102 - HOIST
      ?auto_68099 - SURFACE
      ?auto_68092 - TRUCK
      ?auto_68103 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_68079 ?auto_68089 ) ( IS-CRATE ?auto_68071 ) ( not ( = ?auto_68071 ?auto_68072 ) ) ( not ( = ?auto_68073 ?auto_68089 ) ) ( HOIST-AT ?auto_68095 ?auto_68073 ) ( not ( = ?auto_68079 ?auto_68095 ) ) ( AVAILABLE ?auto_68095 ) ( SURFACE-AT ?auto_68071 ?auto_68073 ) ( ON ?auto_68071 ?auto_68101 ) ( CLEAR ?auto_68071 ) ( not ( = ?auto_68071 ?auto_68101 ) ) ( not ( = ?auto_68072 ?auto_68101 ) ) ( IS-CRATE ?auto_68072 ) ( not ( = ?auto_68071 ?auto_68074 ) ) ( not ( = ?auto_68072 ?auto_68074 ) ) ( not ( = ?auto_68101 ?auto_68074 ) ) ( not ( = ?auto_68085 ?auto_68089 ) ) ( not ( = ?auto_68073 ?auto_68085 ) ) ( HOIST-AT ?auto_68082 ?auto_68085 ) ( not ( = ?auto_68079 ?auto_68082 ) ) ( not ( = ?auto_68095 ?auto_68082 ) ) ( SURFACE-AT ?auto_68072 ?auto_68085 ) ( ON ?auto_68072 ?auto_68076 ) ( CLEAR ?auto_68072 ) ( not ( = ?auto_68071 ?auto_68076 ) ) ( not ( = ?auto_68072 ?auto_68076 ) ) ( not ( = ?auto_68101 ?auto_68076 ) ) ( not ( = ?auto_68074 ?auto_68076 ) ) ( IS-CRATE ?auto_68074 ) ( not ( = ?auto_68071 ?auto_68100 ) ) ( not ( = ?auto_68072 ?auto_68100 ) ) ( not ( = ?auto_68101 ?auto_68100 ) ) ( not ( = ?auto_68074 ?auto_68100 ) ) ( not ( = ?auto_68076 ?auto_68100 ) ) ( not ( = ?auto_68077 ?auto_68089 ) ) ( not ( = ?auto_68073 ?auto_68077 ) ) ( not ( = ?auto_68085 ?auto_68077 ) ) ( HOIST-AT ?auto_68080 ?auto_68077 ) ( not ( = ?auto_68079 ?auto_68080 ) ) ( not ( = ?auto_68095 ?auto_68080 ) ) ( not ( = ?auto_68082 ?auto_68080 ) ) ( SURFACE-AT ?auto_68074 ?auto_68077 ) ( ON ?auto_68074 ?auto_68091 ) ( CLEAR ?auto_68074 ) ( not ( = ?auto_68071 ?auto_68091 ) ) ( not ( = ?auto_68072 ?auto_68091 ) ) ( not ( = ?auto_68101 ?auto_68091 ) ) ( not ( = ?auto_68074 ?auto_68091 ) ) ( not ( = ?auto_68076 ?auto_68091 ) ) ( not ( = ?auto_68100 ?auto_68091 ) ) ( IS-CRATE ?auto_68100 ) ( not ( = ?auto_68071 ?auto_68090 ) ) ( not ( = ?auto_68072 ?auto_68090 ) ) ( not ( = ?auto_68101 ?auto_68090 ) ) ( not ( = ?auto_68074 ?auto_68090 ) ) ( not ( = ?auto_68076 ?auto_68090 ) ) ( not ( = ?auto_68100 ?auto_68090 ) ) ( not ( = ?auto_68091 ?auto_68090 ) ) ( AVAILABLE ?auto_68080 ) ( SURFACE-AT ?auto_68100 ?auto_68077 ) ( ON ?auto_68100 ?auto_68097 ) ( CLEAR ?auto_68100 ) ( not ( = ?auto_68071 ?auto_68097 ) ) ( not ( = ?auto_68072 ?auto_68097 ) ) ( not ( = ?auto_68101 ?auto_68097 ) ) ( not ( = ?auto_68074 ?auto_68097 ) ) ( not ( = ?auto_68076 ?auto_68097 ) ) ( not ( = ?auto_68100 ?auto_68097 ) ) ( not ( = ?auto_68091 ?auto_68097 ) ) ( not ( = ?auto_68090 ?auto_68097 ) ) ( IS-CRATE ?auto_68090 ) ( not ( = ?auto_68071 ?auto_68086 ) ) ( not ( = ?auto_68072 ?auto_68086 ) ) ( not ( = ?auto_68101 ?auto_68086 ) ) ( not ( = ?auto_68074 ?auto_68086 ) ) ( not ( = ?auto_68076 ?auto_68086 ) ) ( not ( = ?auto_68100 ?auto_68086 ) ) ( not ( = ?auto_68091 ?auto_68086 ) ) ( not ( = ?auto_68090 ?auto_68086 ) ) ( not ( = ?auto_68097 ?auto_68086 ) ) ( not ( = ?auto_68075 ?auto_68089 ) ) ( not ( = ?auto_68073 ?auto_68075 ) ) ( not ( = ?auto_68085 ?auto_68075 ) ) ( not ( = ?auto_68077 ?auto_68075 ) ) ( HOIST-AT ?auto_68088 ?auto_68075 ) ( not ( = ?auto_68079 ?auto_68088 ) ) ( not ( = ?auto_68095 ?auto_68088 ) ) ( not ( = ?auto_68082 ?auto_68088 ) ) ( not ( = ?auto_68080 ?auto_68088 ) ) ( AVAILABLE ?auto_68088 ) ( SURFACE-AT ?auto_68090 ?auto_68075 ) ( ON ?auto_68090 ?auto_68083 ) ( CLEAR ?auto_68090 ) ( not ( = ?auto_68071 ?auto_68083 ) ) ( not ( = ?auto_68072 ?auto_68083 ) ) ( not ( = ?auto_68101 ?auto_68083 ) ) ( not ( = ?auto_68074 ?auto_68083 ) ) ( not ( = ?auto_68076 ?auto_68083 ) ) ( not ( = ?auto_68100 ?auto_68083 ) ) ( not ( = ?auto_68091 ?auto_68083 ) ) ( not ( = ?auto_68090 ?auto_68083 ) ) ( not ( = ?auto_68097 ?auto_68083 ) ) ( not ( = ?auto_68086 ?auto_68083 ) ) ( IS-CRATE ?auto_68086 ) ( not ( = ?auto_68071 ?auto_68078 ) ) ( not ( = ?auto_68072 ?auto_68078 ) ) ( not ( = ?auto_68101 ?auto_68078 ) ) ( not ( = ?auto_68074 ?auto_68078 ) ) ( not ( = ?auto_68076 ?auto_68078 ) ) ( not ( = ?auto_68100 ?auto_68078 ) ) ( not ( = ?auto_68091 ?auto_68078 ) ) ( not ( = ?auto_68090 ?auto_68078 ) ) ( not ( = ?auto_68097 ?auto_68078 ) ) ( not ( = ?auto_68086 ?auto_68078 ) ) ( not ( = ?auto_68083 ?auto_68078 ) ) ( not ( = ?auto_68098 ?auto_68089 ) ) ( not ( = ?auto_68073 ?auto_68098 ) ) ( not ( = ?auto_68085 ?auto_68098 ) ) ( not ( = ?auto_68077 ?auto_68098 ) ) ( not ( = ?auto_68075 ?auto_68098 ) ) ( HOIST-AT ?auto_68096 ?auto_68098 ) ( not ( = ?auto_68079 ?auto_68096 ) ) ( not ( = ?auto_68095 ?auto_68096 ) ) ( not ( = ?auto_68082 ?auto_68096 ) ) ( not ( = ?auto_68080 ?auto_68096 ) ) ( not ( = ?auto_68088 ?auto_68096 ) ) ( AVAILABLE ?auto_68096 ) ( SURFACE-AT ?auto_68086 ?auto_68098 ) ( ON ?auto_68086 ?auto_68094 ) ( CLEAR ?auto_68086 ) ( not ( = ?auto_68071 ?auto_68094 ) ) ( not ( = ?auto_68072 ?auto_68094 ) ) ( not ( = ?auto_68101 ?auto_68094 ) ) ( not ( = ?auto_68074 ?auto_68094 ) ) ( not ( = ?auto_68076 ?auto_68094 ) ) ( not ( = ?auto_68100 ?auto_68094 ) ) ( not ( = ?auto_68091 ?auto_68094 ) ) ( not ( = ?auto_68090 ?auto_68094 ) ) ( not ( = ?auto_68097 ?auto_68094 ) ) ( not ( = ?auto_68086 ?auto_68094 ) ) ( not ( = ?auto_68083 ?auto_68094 ) ) ( not ( = ?auto_68078 ?auto_68094 ) ) ( IS-CRATE ?auto_68078 ) ( not ( = ?auto_68071 ?auto_68081 ) ) ( not ( = ?auto_68072 ?auto_68081 ) ) ( not ( = ?auto_68101 ?auto_68081 ) ) ( not ( = ?auto_68074 ?auto_68081 ) ) ( not ( = ?auto_68076 ?auto_68081 ) ) ( not ( = ?auto_68100 ?auto_68081 ) ) ( not ( = ?auto_68091 ?auto_68081 ) ) ( not ( = ?auto_68090 ?auto_68081 ) ) ( not ( = ?auto_68097 ?auto_68081 ) ) ( not ( = ?auto_68086 ?auto_68081 ) ) ( not ( = ?auto_68083 ?auto_68081 ) ) ( not ( = ?auto_68078 ?auto_68081 ) ) ( not ( = ?auto_68094 ?auto_68081 ) ) ( AVAILABLE ?auto_68082 ) ( SURFACE-AT ?auto_68078 ?auto_68085 ) ( ON ?auto_68078 ?auto_68087 ) ( CLEAR ?auto_68078 ) ( not ( = ?auto_68071 ?auto_68087 ) ) ( not ( = ?auto_68072 ?auto_68087 ) ) ( not ( = ?auto_68101 ?auto_68087 ) ) ( not ( = ?auto_68074 ?auto_68087 ) ) ( not ( = ?auto_68076 ?auto_68087 ) ) ( not ( = ?auto_68100 ?auto_68087 ) ) ( not ( = ?auto_68091 ?auto_68087 ) ) ( not ( = ?auto_68090 ?auto_68087 ) ) ( not ( = ?auto_68097 ?auto_68087 ) ) ( not ( = ?auto_68086 ?auto_68087 ) ) ( not ( = ?auto_68083 ?auto_68087 ) ) ( not ( = ?auto_68078 ?auto_68087 ) ) ( not ( = ?auto_68094 ?auto_68087 ) ) ( not ( = ?auto_68081 ?auto_68087 ) ) ( IS-CRATE ?auto_68081 ) ( not ( = ?auto_68071 ?auto_68084 ) ) ( not ( = ?auto_68072 ?auto_68084 ) ) ( not ( = ?auto_68101 ?auto_68084 ) ) ( not ( = ?auto_68074 ?auto_68084 ) ) ( not ( = ?auto_68076 ?auto_68084 ) ) ( not ( = ?auto_68100 ?auto_68084 ) ) ( not ( = ?auto_68091 ?auto_68084 ) ) ( not ( = ?auto_68090 ?auto_68084 ) ) ( not ( = ?auto_68097 ?auto_68084 ) ) ( not ( = ?auto_68086 ?auto_68084 ) ) ( not ( = ?auto_68083 ?auto_68084 ) ) ( not ( = ?auto_68078 ?auto_68084 ) ) ( not ( = ?auto_68094 ?auto_68084 ) ) ( not ( = ?auto_68081 ?auto_68084 ) ) ( not ( = ?auto_68087 ?auto_68084 ) ) ( not ( = ?auto_68093 ?auto_68089 ) ) ( not ( = ?auto_68073 ?auto_68093 ) ) ( not ( = ?auto_68085 ?auto_68093 ) ) ( not ( = ?auto_68077 ?auto_68093 ) ) ( not ( = ?auto_68075 ?auto_68093 ) ) ( not ( = ?auto_68098 ?auto_68093 ) ) ( HOIST-AT ?auto_68102 ?auto_68093 ) ( not ( = ?auto_68079 ?auto_68102 ) ) ( not ( = ?auto_68095 ?auto_68102 ) ) ( not ( = ?auto_68082 ?auto_68102 ) ) ( not ( = ?auto_68080 ?auto_68102 ) ) ( not ( = ?auto_68088 ?auto_68102 ) ) ( not ( = ?auto_68096 ?auto_68102 ) ) ( AVAILABLE ?auto_68102 ) ( SURFACE-AT ?auto_68081 ?auto_68093 ) ( ON ?auto_68081 ?auto_68099 ) ( CLEAR ?auto_68081 ) ( not ( = ?auto_68071 ?auto_68099 ) ) ( not ( = ?auto_68072 ?auto_68099 ) ) ( not ( = ?auto_68101 ?auto_68099 ) ) ( not ( = ?auto_68074 ?auto_68099 ) ) ( not ( = ?auto_68076 ?auto_68099 ) ) ( not ( = ?auto_68100 ?auto_68099 ) ) ( not ( = ?auto_68091 ?auto_68099 ) ) ( not ( = ?auto_68090 ?auto_68099 ) ) ( not ( = ?auto_68097 ?auto_68099 ) ) ( not ( = ?auto_68086 ?auto_68099 ) ) ( not ( = ?auto_68083 ?auto_68099 ) ) ( not ( = ?auto_68078 ?auto_68099 ) ) ( not ( = ?auto_68094 ?auto_68099 ) ) ( not ( = ?auto_68081 ?auto_68099 ) ) ( not ( = ?auto_68087 ?auto_68099 ) ) ( not ( = ?auto_68084 ?auto_68099 ) ) ( TRUCK-AT ?auto_68092 ?auto_68089 ) ( SURFACE-AT ?auto_68103 ?auto_68089 ) ( CLEAR ?auto_68103 ) ( LIFTING ?auto_68079 ?auto_68084 ) ( IS-CRATE ?auto_68084 ) ( not ( = ?auto_68071 ?auto_68103 ) ) ( not ( = ?auto_68072 ?auto_68103 ) ) ( not ( = ?auto_68101 ?auto_68103 ) ) ( not ( = ?auto_68074 ?auto_68103 ) ) ( not ( = ?auto_68076 ?auto_68103 ) ) ( not ( = ?auto_68100 ?auto_68103 ) ) ( not ( = ?auto_68091 ?auto_68103 ) ) ( not ( = ?auto_68090 ?auto_68103 ) ) ( not ( = ?auto_68097 ?auto_68103 ) ) ( not ( = ?auto_68086 ?auto_68103 ) ) ( not ( = ?auto_68083 ?auto_68103 ) ) ( not ( = ?auto_68078 ?auto_68103 ) ) ( not ( = ?auto_68094 ?auto_68103 ) ) ( not ( = ?auto_68081 ?auto_68103 ) ) ( not ( = ?auto_68087 ?auto_68103 ) ) ( not ( = ?auto_68084 ?auto_68103 ) ) ( not ( = ?auto_68099 ?auto_68103 ) ) )
    :subtasks
    ( ( !DROP ?auto_68079 ?auto_68084 ?auto_68103 ?auto_68089 )
      ( MAKE-ON ?auto_68071 ?auto_68072 )
      ( MAKE-ON-VERIFY ?auto_68071 ?auto_68072 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_68104 - SURFACE
      ?auto_68105 - SURFACE
    )
    :vars
    (
      ?auto_68107 - HOIST
      ?auto_68128 - PLACE
      ?auto_68124 - PLACE
      ?auto_68109 - HOIST
      ?auto_68122 - SURFACE
      ?auto_68113 - SURFACE
      ?auto_68136 - PLACE
      ?auto_68115 - HOIST
      ?auto_68110 - SURFACE
      ?auto_68121 - SURFACE
      ?auto_68106 - PLACE
      ?auto_68134 - HOIST
      ?auto_68130 - SURFACE
      ?auto_68129 - SURFACE
      ?auto_68118 - SURFACE
      ?auto_68117 - SURFACE
      ?auto_68116 - PLACE
      ?auto_68108 - HOIST
      ?auto_68112 - SURFACE
      ?auto_68111 - SURFACE
      ?auto_68119 - PLACE
      ?auto_68127 - HOIST
      ?auto_68133 - SURFACE
      ?auto_68123 - SURFACE
      ?auto_68135 - SURFACE
      ?auto_68114 - SURFACE
      ?auto_68132 - PLACE
      ?auto_68126 - HOIST
      ?auto_68120 - SURFACE
      ?auto_68131 - TRUCK
      ?auto_68125 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_68107 ?auto_68128 ) ( IS-CRATE ?auto_68104 ) ( not ( = ?auto_68104 ?auto_68105 ) ) ( not ( = ?auto_68124 ?auto_68128 ) ) ( HOIST-AT ?auto_68109 ?auto_68124 ) ( not ( = ?auto_68107 ?auto_68109 ) ) ( AVAILABLE ?auto_68109 ) ( SURFACE-AT ?auto_68104 ?auto_68124 ) ( ON ?auto_68104 ?auto_68122 ) ( CLEAR ?auto_68104 ) ( not ( = ?auto_68104 ?auto_68122 ) ) ( not ( = ?auto_68105 ?auto_68122 ) ) ( IS-CRATE ?auto_68105 ) ( not ( = ?auto_68104 ?auto_68113 ) ) ( not ( = ?auto_68105 ?auto_68113 ) ) ( not ( = ?auto_68122 ?auto_68113 ) ) ( not ( = ?auto_68136 ?auto_68128 ) ) ( not ( = ?auto_68124 ?auto_68136 ) ) ( HOIST-AT ?auto_68115 ?auto_68136 ) ( not ( = ?auto_68107 ?auto_68115 ) ) ( not ( = ?auto_68109 ?auto_68115 ) ) ( SURFACE-AT ?auto_68105 ?auto_68136 ) ( ON ?auto_68105 ?auto_68110 ) ( CLEAR ?auto_68105 ) ( not ( = ?auto_68104 ?auto_68110 ) ) ( not ( = ?auto_68105 ?auto_68110 ) ) ( not ( = ?auto_68122 ?auto_68110 ) ) ( not ( = ?auto_68113 ?auto_68110 ) ) ( IS-CRATE ?auto_68113 ) ( not ( = ?auto_68104 ?auto_68121 ) ) ( not ( = ?auto_68105 ?auto_68121 ) ) ( not ( = ?auto_68122 ?auto_68121 ) ) ( not ( = ?auto_68113 ?auto_68121 ) ) ( not ( = ?auto_68110 ?auto_68121 ) ) ( not ( = ?auto_68106 ?auto_68128 ) ) ( not ( = ?auto_68124 ?auto_68106 ) ) ( not ( = ?auto_68136 ?auto_68106 ) ) ( HOIST-AT ?auto_68134 ?auto_68106 ) ( not ( = ?auto_68107 ?auto_68134 ) ) ( not ( = ?auto_68109 ?auto_68134 ) ) ( not ( = ?auto_68115 ?auto_68134 ) ) ( SURFACE-AT ?auto_68113 ?auto_68106 ) ( ON ?auto_68113 ?auto_68130 ) ( CLEAR ?auto_68113 ) ( not ( = ?auto_68104 ?auto_68130 ) ) ( not ( = ?auto_68105 ?auto_68130 ) ) ( not ( = ?auto_68122 ?auto_68130 ) ) ( not ( = ?auto_68113 ?auto_68130 ) ) ( not ( = ?auto_68110 ?auto_68130 ) ) ( not ( = ?auto_68121 ?auto_68130 ) ) ( IS-CRATE ?auto_68121 ) ( not ( = ?auto_68104 ?auto_68129 ) ) ( not ( = ?auto_68105 ?auto_68129 ) ) ( not ( = ?auto_68122 ?auto_68129 ) ) ( not ( = ?auto_68113 ?auto_68129 ) ) ( not ( = ?auto_68110 ?auto_68129 ) ) ( not ( = ?auto_68121 ?auto_68129 ) ) ( not ( = ?auto_68130 ?auto_68129 ) ) ( AVAILABLE ?auto_68134 ) ( SURFACE-AT ?auto_68121 ?auto_68106 ) ( ON ?auto_68121 ?auto_68118 ) ( CLEAR ?auto_68121 ) ( not ( = ?auto_68104 ?auto_68118 ) ) ( not ( = ?auto_68105 ?auto_68118 ) ) ( not ( = ?auto_68122 ?auto_68118 ) ) ( not ( = ?auto_68113 ?auto_68118 ) ) ( not ( = ?auto_68110 ?auto_68118 ) ) ( not ( = ?auto_68121 ?auto_68118 ) ) ( not ( = ?auto_68130 ?auto_68118 ) ) ( not ( = ?auto_68129 ?auto_68118 ) ) ( IS-CRATE ?auto_68129 ) ( not ( = ?auto_68104 ?auto_68117 ) ) ( not ( = ?auto_68105 ?auto_68117 ) ) ( not ( = ?auto_68122 ?auto_68117 ) ) ( not ( = ?auto_68113 ?auto_68117 ) ) ( not ( = ?auto_68110 ?auto_68117 ) ) ( not ( = ?auto_68121 ?auto_68117 ) ) ( not ( = ?auto_68130 ?auto_68117 ) ) ( not ( = ?auto_68129 ?auto_68117 ) ) ( not ( = ?auto_68118 ?auto_68117 ) ) ( not ( = ?auto_68116 ?auto_68128 ) ) ( not ( = ?auto_68124 ?auto_68116 ) ) ( not ( = ?auto_68136 ?auto_68116 ) ) ( not ( = ?auto_68106 ?auto_68116 ) ) ( HOIST-AT ?auto_68108 ?auto_68116 ) ( not ( = ?auto_68107 ?auto_68108 ) ) ( not ( = ?auto_68109 ?auto_68108 ) ) ( not ( = ?auto_68115 ?auto_68108 ) ) ( not ( = ?auto_68134 ?auto_68108 ) ) ( AVAILABLE ?auto_68108 ) ( SURFACE-AT ?auto_68129 ?auto_68116 ) ( ON ?auto_68129 ?auto_68112 ) ( CLEAR ?auto_68129 ) ( not ( = ?auto_68104 ?auto_68112 ) ) ( not ( = ?auto_68105 ?auto_68112 ) ) ( not ( = ?auto_68122 ?auto_68112 ) ) ( not ( = ?auto_68113 ?auto_68112 ) ) ( not ( = ?auto_68110 ?auto_68112 ) ) ( not ( = ?auto_68121 ?auto_68112 ) ) ( not ( = ?auto_68130 ?auto_68112 ) ) ( not ( = ?auto_68129 ?auto_68112 ) ) ( not ( = ?auto_68118 ?auto_68112 ) ) ( not ( = ?auto_68117 ?auto_68112 ) ) ( IS-CRATE ?auto_68117 ) ( not ( = ?auto_68104 ?auto_68111 ) ) ( not ( = ?auto_68105 ?auto_68111 ) ) ( not ( = ?auto_68122 ?auto_68111 ) ) ( not ( = ?auto_68113 ?auto_68111 ) ) ( not ( = ?auto_68110 ?auto_68111 ) ) ( not ( = ?auto_68121 ?auto_68111 ) ) ( not ( = ?auto_68130 ?auto_68111 ) ) ( not ( = ?auto_68129 ?auto_68111 ) ) ( not ( = ?auto_68118 ?auto_68111 ) ) ( not ( = ?auto_68117 ?auto_68111 ) ) ( not ( = ?auto_68112 ?auto_68111 ) ) ( not ( = ?auto_68119 ?auto_68128 ) ) ( not ( = ?auto_68124 ?auto_68119 ) ) ( not ( = ?auto_68136 ?auto_68119 ) ) ( not ( = ?auto_68106 ?auto_68119 ) ) ( not ( = ?auto_68116 ?auto_68119 ) ) ( HOIST-AT ?auto_68127 ?auto_68119 ) ( not ( = ?auto_68107 ?auto_68127 ) ) ( not ( = ?auto_68109 ?auto_68127 ) ) ( not ( = ?auto_68115 ?auto_68127 ) ) ( not ( = ?auto_68134 ?auto_68127 ) ) ( not ( = ?auto_68108 ?auto_68127 ) ) ( AVAILABLE ?auto_68127 ) ( SURFACE-AT ?auto_68117 ?auto_68119 ) ( ON ?auto_68117 ?auto_68133 ) ( CLEAR ?auto_68117 ) ( not ( = ?auto_68104 ?auto_68133 ) ) ( not ( = ?auto_68105 ?auto_68133 ) ) ( not ( = ?auto_68122 ?auto_68133 ) ) ( not ( = ?auto_68113 ?auto_68133 ) ) ( not ( = ?auto_68110 ?auto_68133 ) ) ( not ( = ?auto_68121 ?auto_68133 ) ) ( not ( = ?auto_68130 ?auto_68133 ) ) ( not ( = ?auto_68129 ?auto_68133 ) ) ( not ( = ?auto_68118 ?auto_68133 ) ) ( not ( = ?auto_68117 ?auto_68133 ) ) ( not ( = ?auto_68112 ?auto_68133 ) ) ( not ( = ?auto_68111 ?auto_68133 ) ) ( IS-CRATE ?auto_68111 ) ( not ( = ?auto_68104 ?auto_68123 ) ) ( not ( = ?auto_68105 ?auto_68123 ) ) ( not ( = ?auto_68122 ?auto_68123 ) ) ( not ( = ?auto_68113 ?auto_68123 ) ) ( not ( = ?auto_68110 ?auto_68123 ) ) ( not ( = ?auto_68121 ?auto_68123 ) ) ( not ( = ?auto_68130 ?auto_68123 ) ) ( not ( = ?auto_68129 ?auto_68123 ) ) ( not ( = ?auto_68118 ?auto_68123 ) ) ( not ( = ?auto_68117 ?auto_68123 ) ) ( not ( = ?auto_68112 ?auto_68123 ) ) ( not ( = ?auto_68111 ?auto_68123 ) ) ( not ( = ?auto_68133 ?auto_68123 ) ) ( AVAILABLE ?auto_68115 ) ( SURFACE-AT ?auto_68111 ?auto_68136 ) ( ON ?auto_68111 ?auto_68135 ) ( CLEAR ?auto_68111 ) ( not ( = ?auto_68104 ?auto_68135 ) ) ( not ( = ?auto_68105 ?auto_68135 ) ) ( not ( = ?auto_68122 ?auto_68135 ) ) ( not ( = ?auto_68113 ?auto_68135 ) ) ( not ( = ?auto_68110 ?auto_68135 ) ) ( not ( = ?auto_68121 ?auto_68135 ) ) ( not ( = ?auto_68130 ?auto_68135 ) ) ( not ( = ?auto_68129 ?auto_68135 ) ) ( not ( = ?auto_68118 ?auto_68135 ) ) ( not ( = ?auto_68117 ?auto_68135 ) ) ( not ( = ?auto_68112 ?auto_68135 ) ) ( not ( = ?auto_68111 ?auto_68135 ) ) ( not ( = ?auto_68133 ?auto_68135 ) ) ( not ( = ?auto_68123 ?auto_68135 ) ) ( IS-CRATE ?auto_68123 ) ( not ( = ?auto_68104 ?auto_68114 ) ) ( not ( = ?auto_68105 ?auto_68114 ) ) ( not ( = ?auto_68122 ?auto_68114 ) ) ( not ( = ?auto_68113 ?auto_68114 ) ) ( not ( = ?auto_68110 ?auto_68114 ) ) ( not ( = ?auto_68121 ?auto_68114 ) ) ( not ( = ?auto_68130 ?auto_68114 ) ) ( not ( = ?auto_68129 ?auto_68114 ) ) ( not ( = ?auto_68118 ?auto_68114 ) ) ( not ( = ?auto_68117 ?auto_68114 ) ) ( not ( = ?auto_68112 ?auto_68114 ) ) ( not ( = ?auto_68111 ?auto_68114 ) ) ( not ( = ?auto_68133 ?auto_68114 ) ) ( not ( = ?auto_68123 ?auto_68114 ) ) ( not ( = ?auto_68135 ?auto_68114 ) ) ( not ( = ?auto_68132 ?auto_68128 ) ) ( not ( = ?auto_68124 ?auto_68132 ) ) ( not ( = ?auto_68136 ?auto_68132 ) ) ( not ( = ?auto_68106 ?auto_68132 ) ) ( not ( = ?auto_68116 ?auto_68132 ) ) ( not ( = ?auto_68119 ?auto_68132 ) ) ( HOIST-AT ?auto_68126 ?auto_68132 ) ( not ( = ?auto_68107 ?auto_68126 ) ) ( not ( = ?auto_68109 ?auto_68126 ) ) ( not ( = ?auto_68115 ?auto_68126 ) ) ( not ( = ?auto_68134 ?auto_68126 ) ) ( not ( = ?auto_68108 ?auto_68126 ) ) ( not ( = ?auto_68127 ?auto_68126 ) ) ( AVAILABLE ?auto_68126 ) ( SURFACE-AT ?auto_68123 ?auto_68132 ) ( ON ?auto_68123 ?auto_68120 ) ( CLEAR ?auto_68123 ) ( not ( = ?auto_68104 ?auto_68120 ) ) ( not ( = ?auto_68105 ?auto_68120 ) ) ( not ( = ?auto_68122 ?auto_68120 ) ) ( not ( = ?auto_68113 ?auto_68120 ) ) ( not ( = ?auto_68110 ?auto_68120 ) ) ( not ( = ?auto_68121 ?auto_68120 ) ) ( not ( = ?auto_68130 ?auto_68120 ) ) ( not ( = ?auto_68129 ?auto_68120 ) ) ( not ( = ?auto_68118 ?auto_68120 ) ) ( not ( = ?auto_68117 ?auto_68120 ) ) ( not ( = ?auto_68112 ?auto_68120 ) ) ( not ( = ?auto_68111 ?auto_68120 ) ) ( not ( = ?auto_68133 ?auto_68120 ) ) ( not ( = ?auto_68123 ?auto_68120 ) ) ( not ( = ?auto_68135 ?auto_68120 ) ) ( not ( = ?auto_68114 ?auto_68120 ) ) ( TRUCK-AT ?auto_68131 ?auto_68128 ) ( SURFACE-AT ?auto_68125 ?auto_68128 ) ( CLEAR ?auto_68125 ) ( IS-CRATE ?auto_68114 ) ( not ( = ?auto_68104 ?auto_68125 ) ) ( not ( = ?auto_68105 ?auto_68125 ) ) ( not ( = ?auto_68122 ?auto_68125 ) ) ( not ( = ?auto_68113 ?auto_68125 ) ) ( not ( = ?auto_68110 ?auto_68125 ) ) ( not ( = ?auto_68121 ?auto_68125 ) ) ( not ( = ?auto_68130 ?auto_68125 ) ) ( not ( = ?auto_68129 ?auto_68125 ) ) ( not ( = ?auto_68118 ?auto_68125 ) ) ( not ( = ?auto_68117 ?auto_68125 ) ) ( not ( = ?auto_68112 ?auto_68125 ) ) ( not ( = ?auto_68111 ?auto_68125 ) ) ( not ( = ?auto_68133 ?auto_68125 ) ) ( not ( = ?auto_68123 ?auto_68125 ) ) ( not ( = ?auto_68135 ?auto_68125 ) ) ( not ( = ?auto_68114 ?auto_68125 ) ) ( not ( = ?auto_68120 ?auto_68125 ) ) ( AVAILABLE ?auto_68107 ) ( IN ?auto_68114 ?auto_68131 ) )
    :subtasks
    ( ( !UNLOAD ?auto_68107 ?auto_68114 ?auto_68131 ?auto_68128 )
      ( MAKE-ON ?auto_68104 ?auto_68105 )
      ( MAKE-ON-VERIFY ?auto_68104 ?auto_68105 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_68137 - SURFACE
      ?auto_68138 - SURFACE
    )
    :vars
    (
      ?auto_68140 - HOIST
      ?auto_68165 - PLACE
      ?auto_68161 - PLACE
      ?auto_68146 - HOIST
      ?auto_68159 - SURFACE
      ?auto_68167 - SURFACE
      ?auto_68157 - PLACE
      ?auto_68150 - HOIST
      ?auto_68151 - SURFACE
      ?auto_68166 - SURFACE
      ?auto_68153 - PLACE
      ?auto_68155 - HOIST
      ?auto_68143 - SURFACE
      ?auto_68158 - SURFACE
      ?auto_68148 - SURFACE
      ?auto_68142 - SURFACE
      ?auto_68152 - PLACE
      ?auto_68147 - HOIST
      ?auto_68141 - SURFACE
      ?auto_68139 - SURFACE
      ?auto_68169 - PLACE
      ?auto_68164 - HOIST
      ?auto_68149 - SURFACE
      ?auto_68160 - SURFACE
      ?auto_68156 - SURFACE
      ?auto_68168 - SURFACE
      ?auto_68145 - PLACE
      ?auto_68163 - HOIST
      ?auto_68154 - SURFACE
      ?auto_68162 - SURFACE
      ?auto_68144 - TRUCK
      ?auto_68170 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_68140 ?auto_68165 ) ( IS-CRATE ?auto_68137 ) ( not ( = ?auto_68137 ?auto_68138 ) ) ( not ( = ?auto_68161 ?auto_68165 ) ) ( HOIST-AT ?auto_68146 ?auto_68161 ) ( not ( = ?auto_68140 ?auto_68146 ) ) ( AVAILABLE ?auto_68146 ) ( SURFACE-AT ?auto_68137 ?auto_68161 ) ( ON ?auto_68137 ?auto_68159 ) ( CLEAR ?auto_68137 ) ( not ( = ?auto_68137 ?auto_68159 ) ) ( not ( = ?auto_68138 ?auto_68159 ) ) ( IS-CRATE ?auto_68138 ) ( not ( = ?auto_68137 ?auto_68167 ) ) ( not ( = ?auto_68138 ?auto_68167 ) ) ( not ( = ?auto_68159 ?auto_68167 ) ) ( not ( = ?auto_68157 ?auto_68165 ) ) ( not ( = ?auto_68161 ?auto_68157 ) ) ( HOIST-AT ?auto_68150 ?auto_68157 ) ( not ( = ?auto_68140 ?auto_68150 ) ) ( not ( = ?auto_68146 ?auto_68150 ) ) ( SURFACE-AT ?auto_68138 ?auto_68157 ) ( ON ?auto_68138 ?auto_68151 ) ( CLEAR ?auto_68138 ) ( not ( = ?auto_68137 ?auto_68151 ) ) ( not ( = ?auto_68138 ?auto_68151 ) ) ( not ( = ?auto_68159 ?auto_68151 ) ) ( not ( = ?auto_68167 ?auto_68151 ) ) ( IS-CRATE ?auto_68167 ) ( not ( = ?auto_68137 ?auto_68166 ) ) ( not ( = ?auto_68138 ?auto_68166 ) ) ( not ( = ?auto_68159 ?auto_68166 ) ) ( not ( = ?auto_68167 ?auto_68166 ) ) ( not ( = ?auto_68151 ?auto_68166 ) ) ( not ( = ?auto_68153 ?auto_68165 ) ) ( not ( = ?auto_68161 ?auto_68153 ) ) ( not ( = ?auto_68157 ?auto_68153 ) ) ( HOIST-AT ?auto_68155 ?auto_68153 ) ( not ( = ?auto_68140 ?auto_68155 ) ) ( not ( = ?auto_68146 ?auto_68155 ) ) ( not ( = ?auto_68150 ?auto_68155 ) ) ( SURFACE-AT ?auto_68167 ?auto_68153 ) ( ON ?auto_68167 ?auto_68143 ) ( CLEAR ?auto_68167 ) ( not ( = ?auto_68137 ?auto_68143 ) ) ( not ( = ?auto_68138 ?auto_68143 ) ) ( not ( = ?auto_68159 ?auto_68143 ) ) ( not ( = ?auto_68167 ?auto_68143 ) ) ( not ( = ?auto_68151 ?auto_68143 ) ) ( not ( = ?auto_68166 ?auto_68143 ) ) ( IS-CRATE ?auto_68166 ) ( not ( = ?auto_68137 ?auto_68158 ) ) ( not ( = ?auto_68138 ?auto_68158 ) ) ( not ( = ?auto_68159 ?auto_68158 ) ) ( not ( = ?auto_68167 ?auto_68158 ) ) ( not ( = ?auto_68151 ?auto_68158 ) ) ( not ( = ?auto_68166 ?auto_68158 ) ) ( not ( = ?auto_68143 ?auto_68158 ) ) ( AVAILABLE ?auto_68155 ) ( SURFACE-AT ?auto_68166 ?auto_68153 ) ( ON ?auto_68166 ?auto_68148 ) ( CLEAR ?auto_68166 ) ( not ( = ?auto_68137 ?auto_68148 ) ) ( not ( = ?auto_68138 ?auto_68148 ) ) ( not ( = ?auto_68159 ?auto_68148 ) ) ( not ( = ?auto_68167 ?auto_68148 ) ) ( not ( = ?auto_68151 ?auto_68148 ) ) ( not ( = ?auto_68166 ?auto_68148 ) ) ( not ( = ?auto_68143 ?auto_68148 ) ) ( not ( = ?auto_68158 ?auto_68148 ) ) ( IS-CRATE ?auto_68158 ) ( not ( = ?auto_68137 ?auto_68142 ) ) ( not ( = ?auto_68138 ?auto_68142 ) ) ( not ( = ?auto_68159 ?auto_68142 ) ) ( not ( = ?auto_68167 ?auto_68142 ) ) ( not ( = ?auto_68151 ?auto_68142 ) ) ( not ( = ?auto_68166 ?auto_68142 ) ) ( not ( = ?auto_68143 ?auto_68142 ) ) ( not ( = ?auto_68158 ?auto_68142 ) ) ( not ( = ?auto_68148 ?auto_68142 ) ) ( not ( = ?auto_68152 ?auto_68165 ) ) ( not ( = ?auto_68161 ?auto_68152 ) ) ( not ( = ?auto_68157 ?auto_68152 ) ) ( not ( = ?auto_68153 ?auto_68152 ) ) ( HOIST-AT ?auto_68147 ?auto_68152 ) ( not ( = ?auto_68140 ?auto_68147 ) ) ( not ( = ?auto_68146 ?auto_68147 ) ) ( not ( = ?auto_68150 ?auto_68147 ) ) ( not ( = ?auto_68155 ?auto_68147 ) ) ( AVAILABLE ?auto_68147 ) ( SURFACE-AT ?auto_68158 ?auto_68152 ) ( ON ?auto_68158 ?auto_68141 ) ( CLEAR ?auto_68158 ) ( not ( = ?auto_68137 ?auto_68141 ) ) ( not ( = ?auto_68138 ?auto_68141 ) ) ( not ( = ?auto_68159 ?auto_68141 ) ) ( not ( = ?auto_68167 ?auto_68141 ) ) ( not ( = ?auto_68151 ?auto_68141 ) ) ( not ( = ?auto_68166 ?auto_68141 ) ) ( not ( = ?auto_68143 ?auto_68141 ) ) ( not ( = ?auto_68158 ?auto_68141 ) ) ( not ( = ?auto_68148 ?auto_68141 ) ) ( not ( = ?auto_68142 ?auto_68141 ) ) ( IS-CRATE ?auto_68142 ) ( not ( = ?auto_68137 ?auto_68139 ) ) ( not ( = ?auto_68138 ?auto_68139 ) ) ( not ( = ?auto_68159 ?auto_68139 ) ) ( not ( = ?auto_68167 ?auto_68139 ) ) ( not ( = ?auto_68151 ?auto_68139 ) ) ( not ( = ?auto_68166 ?auto_68139 ) ) ( not ( = ?auto_68143 ?auto_68139 ) ) ( not ( = ?auto_68158 ?auto_68139 ) ) ( not ( = ?auto_68148 ?auto_68139 ) ) ( not ( = ?auto_68142 ?auto_68139 ) ) ( not ( = ?auto_68141 ?auto_68139 ) ) ( not ( = ?auto_68169 ?auto_68165 ) ) ( not ( = ?auto_68161 ?auto_68169 ) ) ( not ( = ?auto_68157 ?auto_68169 ) ) ( not ( = ?auto_68153 ?auto_68169 ) ) ( not ( = ?auto_68152 ?auto_68169 ) ) ( HOIST-AT ?auto_68164 ?auto_68169 ) ( not ( = ?auto_68140 ?auto_68164 ) ) ( not ( = ?auto_68146 ?auto_68164 ) ) ( not ( = ?auto_68150 ?auto_68164 ) ) ( not ( = ?auto_68155 ?auto_68164 ) ) ( not ( = ?auto_68147 ?auto_68164 ) ) ( AVAILABLE ?auto_68164 ) ( SURFACE-AT ?auto_68142 ?auto_68169 ) ( ON ?auto_68142 ?auto_68149 ) ( CLEAR ?auto_68142 ) ( not ( = ?auto_68137 ?auto_68149 ) ) ( not ( = ?auto_68138 ?auto_68149 ) ) ( not ( = ?auto_68159 ?auto_68149 ) ) ( not ( = ?auto_68167 ?auto_68149 ) ) ( not ( = ?auto_68151 ?auto_68149 ) ) ( not ( = ?auto_68166 ?auto_68149 ) ) ( not ( = ?auto_68143 ?auto_68149 ) ) ( not ( = ?auto_68158 ?auto_68149 ) ) ( not ( = ?auto_68148 ?auto_68149 ) ) ( not ( = ?auto_68142 ?auto_68149 ) ) ( not ( = ?auto_68141 ?auto_68149 ) ) ( not ( = ?auto_68139 ?auto_68149 ) ) ( IS-CRATE ?auto_68139 ) ( not ( = ?auto_68137 ?auto_68160 ) ) ( not ( = ?auto_68138 ?auto_68160 ) ) ( not ( = ?auto_68159 ?auto_68160 ) ) ( not ( = ?auto_68167 ?auto_68160 ) ) ( not ( = ?auto_68151 ?auto_68160 ) ) ( not ( = ?auto_68166 ?auto_68160 ) ) ( not ( = ?auto_68143 ?auto_68160 ) ) ( not ( = ?auto_68158 ?auto_68160 ) ) ( not ( = ?auto_68148 ?auto_68160 ) ) ( not ( = ?auto_68142 ?auto_68160 ) ) ( not ( = ?auto_68141 ?auto_68160 ) ) ( not ( = ?auto_68139 ?auto_68160 ) ) ( not ( = ?auto_68149 ?auto_68160 ) ) ( AVAILABLE ?auto_68150 ) ( SURFACE-AT ?auto_68139 ?auto_68157 ) ( ON ?auto_68139 ?auto_68156 ) ( CLEAR ?auto_68139 ) ( not ( = ?auto_68137 ?auto_68156 ) ) ( not ( = ?auto_68138 ?auto_68156 ) ) ( not ( = ?auto_68159 ?auto_68156 ) ) ( not ( = ?auto_68167 ?auto_68156 ) ) ( not ( = ?auto_68151 ?auto_68156 ) ) ( not ( = ?auto_68166 ?auto_68156 ) ) ( not ( = ?auto_68143 ?auto_68156 ) ) ( not ( = ?auto_68158 ?auto_68156 ) ) ( not ( = ?auto_68148 ?auto_68156 ) ) ( not ( = ?auto_68142 ?auto_68156 ) ) ( not ( = ?auto_68141 ?auto_68156 ) ) ( not ( = ?auto_68139 ?auto_68156 ) ) ( not ( = ?auto_68149 ?auto_68156 ) ) ( not ( = ?auto_68160 ?auto_68156 ) ) ( IS-CRATE ?auto_68160 ) ( not ( = ?auto_68137 ?auto_68168 ) ) ( not ( = ?auto_68138 ?auto_68168 ) ) ( not ( = ?auto_68159 ?auto_68168 ) ) ( not ( = ?auto_68167 ?auto_68168 ) ) ( not ( = ?auto_68151 ?auto_68168 ) ) ( not ( = ?auto_68166 ?auto_68168 ) ) ( not ( = ?auto_68143 ?auto_68168 ) ) ( not ( = ?auto_68158 ?auto_68168 ) ) ( not ( = ?auto_68148 ?auto_68168 ) ) ( not ( = ?auto_68142 ?auto_68168 ) ) ( not ( = ?auto_68141 ?auto_68168 ) ) ( not ( = ?auto_68139 ?auto_68168 ) ) ( not ( = ?auto_68149 ?auto_68168 ) ) ( not ( = ?auto_68160 ?auto_68168 ) ) ( not ( = ?auto_68156 ?auto_68168 ) ) ( not ( = ?auto_68145 ?auto_68165 ) ) ( not ( = ?auto_68161 ?auto_68145 ) ) ( not ( = ?auto_68157 ?auto_68145 ) ) ( not ( = ?auto_68153 ?auto_68145 ) ) ( not ( = ?auto_68152 ?auto_68145 ) ) ( not ( = ?auto_68169 ?auto_68145 ) ) ( HOIST-AT ?auto_68163 ?auto_68145 ) ( not ( = ?auto_68140 ?auto_68163 ) ) ( not ( = ?auto_68146 ?auto_68163 ) ) ( not ( = ?auto_68150 ?auto_68163 ) ) ( not ( = ?auto_68155 ?auto_68163 ) ) ( not ( = ?auto_68147 ?auto_68163 ) ) ( not ( = ?auto_68164 ?auto_68163 ) ) ( AVAILABLE ?auto_68163 ) ( SURFACE-AT ?auto_68160 ?auto_68145 ) ( ON ?auto_68160 ?auto_68154 ) ( CLEAR ?auto_68160 ) ( not ( = ?auto_68137 ?auto_68154 ) ) ( not ( = ?auto_68138 ?auto_68154 ) ) ( not ( = ?auto_68159 ?auto_68154 ) ) ( not ( = ?auto_68167 ?auto_68154 ) ) ( not ( = ?auto_68151 ?auto_68154 ) ) ( not ( = ?auto_68166 ?auto_68154 ) ) ( not ( = ?auto_68143 ?auto_68154 ) ) ( not ( = ?auto_68158 ?auto_68154 ) ) ( not ( = ?auto_68148 ?auto_68154 ) ) ( not ( = ?auto_68142 ?auto_68154 ) ) ( not ( = ?auto_68141 ?auto_68154 ) ) ( not ( = ?auto_68139 ?auto_68154 ) ) ( not ( = ?auto_68149 ?auto_68154 ) ) ( not ( = ?auto_68160 ?auto_68154 ) ) ( not ( = ?auto_68156 ?auto_68154 ) ) ( not ( = ?auto_68168 ?auto_68154 ) ) ( SURFACE-AT ?auto_68162 ?auto_68165 ) ( CLEAR ?auto_68162 ) ( IS-CRATE ?auto_68168 ) ( not ( = ?auto_68137 ?auto_68162 ) ) ( not ( = ?auto_68138 ?auto_68162 ) ) ( not ( = ?auto_68159 ?auto_68162 ) ) ( not ( = ?auto_68167 ?auto_68162 ) ) ( not ( = ?auto_68151 ?auto_68162 ) ) ( not ( = ?auto_68166 ?auto_68162 ) ) ( not ( = ?auto_68143 ?auto_68162 ) ) ( not ( = ?auto_68158 ?auto_68162 ) ) ( not ( = ?auto_68148 ?auto_68162 ) ) ( not ( = ?auto_68142 ?auto_68162 ) ) ( not ( = ?auto_68141 ?auto_68162 ) ) ( not ( = ?auto_68139 ?auto_68162 ) ) ( not ( = ?auto_68149 ?auto_68162 ) ) ( not ( = ?auto_68160 ?auto_68162 ) ) ( not ( = ?auto_68156 ?auto_68162 ) ) ( not ( = ?auto_68168 ?auto_68162 ) ) ( not ( = ?auto_68154 ?auto_68162 ) ) ( AVAILABLE ?auto_68140 ) ( IN ?auto_68168 ?auto_68144 ) ( TRUCK-AT ?auto_68144 ?auto_68170 ) ( not ( = ?auto_68170 ?auto_68165 ) ) ( not ( = ?auto_68161 ?auto_68170 ) ) ( not ( = ?auto_68157 ?auto_68170 ) ) ( not ( = ?auto_68153 ?auto_68170 ) ) ( not ( = ?auto_68152 ?auto_68170 ) ) ( not ( = ?auto_68169 ?auto_68170 ) ) ( not ( = ?auto_68145 ?auto_68170 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_68144 ?auto_68170 ?auto_68165 )
      ( MAKE-ON ?auto_68137 ?auto_68138 )
      ( MAKE-ON-VERIFY ?auto_68137 ?auto_68138 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_68171 - SURFACE
      ?auto_68172 - SURFACE
    )
    :vars
    (
      ?auto_68194 - HOIST
      ?auto_68173 - PLACE
      ?auto_68199 - PLACE
      ?auto_68203 - HOIST
      ?auto_68188 - SURFACE
      ?auto_68177 - SURFACE
      ?auto_68186 - PLACE
      ?auto_68183 - HOIST
      ?auto_68201 - SURFACE
      ?auto_68174 - SURFACE
      ?auto_68197 - PLACE
      ?auto_68179 - HOIST
      ?auto_68184 - SURFACE
      ?auto_68187 - SURFACE
      ?auto_68192 - SURFACE
      ?auto_68190 - SURFACE
      ?auto_68185 - PLACE
      ?auto_68191 - HOIST
      ?auto_68202 - SURFACE
      ?auto_68195 - SURFACE
      ?auto_68181 - PLACE
      ?auto_68175 - HOIST
      ?auto_68196 - SURFACE
      ?auto_68189 - SURFACE
      ?auto_68180 - SURFACE
      ?auto_68178 - SURFACE
      ?auto_68198 - PLACE
      ?auto_68176 - HOIST
      ?auto_68200 - SURFACE
      ?auto_68182 - SURFACE
      ?auto_68193 - TRUCK
      ?auto_68204 - PLACE
      ?auto_68205 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_68194 ?auto_68173 ) ( IS-CRATE ?auto_68171 ) ( not ( = ?auto_68171 ?auto_68172 ) ) ( not ( = ?auto_68199 ?auto_68173 ) ) ( HOIST-AT ?auto_68203 ?auto_68199 ) ( not ( = ?auto_68194 ?auto_68203 ) ) ( AVAILABLE ?auto_68203 ) ( SURFACE-AT ?auto_68171 ?auto_68199 ) ( ON ?auto_68171 ?auto_68188 ) ( CLEAR ?auto_68171 ) ( not ( = ?auto_68171 ?auto_68188 ) ) ( not ( = ?auto_68172 ?auto_68188 ) ) ( IS-CRATE ?auto_68172 ) ( not ( = ?auto_68171 ?auto_68177 ) ) ( not ( = ?auto_68172 ?auto_68177 ) ) ( not ( = ?auto_68188 ?auto_68177 ) ) ( not ( = ?auto_68186 ?auto_68173 ) ) ( not ( = ?auto_68199 ?auto_68186 ) ) ( HOIST-AT ?auto_68183 ?auto_68186 ) ( not ( = ?auto_68194 ?auto_68183 ) ) ( not ( = ?auto_68203 ?auto_68183 ) ) ( SURFACE-AT ?auto_68172 ?auto_68186 ) ( ON ?auto_68172 ?auto_68201 ) ( CLEAR ?auto_68172 ) ( not ( = ?auto_68171 ?auto_68201 ) ) ( not ( = ?auto_68172 ?auto_68201 ) ) ( not ( = ?auto_68188 ?auto_68201 ) ) ( not ( = ?auto_68177 ?auto_68201 ) ) ( IS-CRATE ?auto_68177 ) ( not ( = ?auto_68171 ?auto_68174 ) ) ( not ( = ?auto_68172 ?auto_68174 ) ) ( not ( = ?auto_68188 ?auto_68174 ) ) ( not ( = ?auto_68177 ?auto_68174 ) ) ( not ( = ?auto_68201 ?auto_68174 ) ) ( not ( = ?auto_68197 ?auto_68173 ) ) ( not ( = ?auto_68199 ?auto_68197 ) ) ( not ( = ?auto_68186 ?auto_68197 ) ) ( HOIST-AT ?auto_68179 ?auto_68197 ) ( not ( = ?auto_68194 ?auto_68179 ) ) ( not ( = ?auto_68203 ?auto_68179 ) ) ( not ( = ?auto_68183 ?auto_68179 ) ) ( SURFACE-AT ?auto_68177 ?auto_68197 ) ( ON ?auto_68177 ?auto_68184 ) ( CLEAR ?auto_68177 ) ( not ( = ?auto_68171 ?auto_68184 ) ) ( not ( = ?auto_68172 ?auto_68184 ) ) ( not ( = ?auto_68188 ?auto_68184 ) ) ( not ( = ?auto_68177 ?auto_68184 ) ) ( not ( = ?auto_68201 ?auto_68184 ) ) ( not ( = ?auto_68174 ?auto_68184 ) ) ( IS-CRATE ?auto_68174 ) ( not ( = ?auto_68171 ?auto_68187 ) ) ( not ( = ?auto_68172 ?auto_68187 ) ) ( not ( = ?auto_68188 ?auto_68187 ) ) ( not ( = ?auto_68177 ?auto_68187 ) ) ( not ( = ?auto_68201 ?auto_68187 ) ) ( not ( = ?auto_68174 ?auto_68187 ) ) ( not ( = ?auto_68184 ?auto_68187 ) ) ( AVAILABLE ?auto_68179 ) ( SURFACE-AT ?auto_68174 ?auto_68197 ) ( ON ?auto_68174 ?auto_68192 ) ( CLEAR ?auto_68174 ) ( not ( = ?auto_68171 ?auto_68192 ) ) ( not ( = ?auto_68172 ?auto_68192 ) ) ( not ( = ?auto_68188 ?auto_68192 ) ) ( not ( = ?auto_68177 ?auto_68192 ) ) ( not ( = ?auto_68201 ?auto_68192 ) ) ( not ( = ?auto_68174 ?auto_68192 ) ) ( not ( = ?auto_68184 ?auto_68192 ) ) ( not ( = ?auto_68187 ?auto_68192 ) ) ( IS-CRATE ?auto_68187 ) ( not ( = ?auto_68171 ?auto_68190 ) ) ( not ( = ?auto_68172 ?auto_68190 ) ) ( not ( = ?auto_68188 ?auto_68190 ) ) ( not ( = ?auto_68177 ?auto_68190 ) ) ( not ( = ?auto_68201 ?auto_68190 ) ) ( not ( = ?auto_68174 ?auto_68190 ) ) ( not ( = ?auto_68184 ?auto_68190 ) ) ( not ( = ?auto_68187 ?auto_68190 ) ) ( not ( = ?auto_68192 ?auto_68190 ) ) ( not ( = ?auto_68185 ?auto_68173 ) ) ( not ( = ?auto_68199 ?auto_68185 ) ) ( not ( = ?auto_68186 ?auto_68185 ) ) ( not ( = ?auto_68197 ?auto_68185 ) ) ( HOIST-AT ?auto_68191 ?auto_68185 ) ( not ( = ?auto_68194 ?auto_68191 ) ) ( not ( = ?auto_68203 ?auto_68191 ) ) ( not ( = ?auto_68183 ?auto_68191 ) ) ( not ( = ?auto_68179 ?auto_68191 ) ) ( AVAILABLE ?auto_68191 ) ( SURFACE-AT ?auto_68187 ?auto_68185 ) ( ON ?auto_68187 ?auto_68202 ) ( CLEAR ?auto_68187 ) ( not ( = ?auto_68171 ?auto_68202 ) ) ( not ( = ?auto_68172 ?auto_68202 ) ) ( not ( = ?auto_68188 ?auto_68202 ) ) ( not ( = ?auto_68177 ?auto_68202 ) ) ( not ( = ?auto_68201 ?auto_68202 ) ) ( not ( = ?auto_68174 ?auto_68202 ) ) ( not ( = ?auto_68184 ?auto_68202 ) ) ( not ( = ?auto_68187 ?auto_68202 ) ) ( not ( = ?auto_68192 ?auto_68202 ) ) ( not ( = ?auto_68190 ?auto_68202 ) ) ( IS-CRATE ?auto_68190 ) ( not ( = ?auto_68171 ?auto_68195 ) ) ( not ( = ?auto_68172 ?auto_68195 ) ) ( not ( = ?auto_68188 ?auto_68195 ) ) ( not ( = ?auto_68177 ?auto_68195 ) ) ( not ( = ?auto_68201 ?auto_68195 ) ) ( not ( = ?auto_68174 ?auto_68195 ) ) ( not ( = ?auto_68184 ?auto_68195 ) ) ( not ( = ?auto_68187 ?auto_68195 ) ) ( not ( = ?auto_68192 ?auto_68195 ) ) ( not ( = ?auto_68190 ?auto_68195 ) ) ( not ( = ?auto_68202 ?auto_68195 ) ) ( not ( = ?auto_68181 ?auto_68173 ) ) ( not ( = ?auto_68199 ?auto_68181 ) ) ( not ( = ?auto_68186 ?auto_68181 ) ) ( not ( = ?auto_68197 ?auto_68181 ) ) ( not ( = ?auto_68185 ?auto_68181 ) ) ( HOIST-AT ?auto_68175 ?auto_68181 ) ( not ( = ?auto_68194 ?auto_68175 ) ) ( not ( = ?auto_68203 ?auto_68175 ) ) ( not ( = ?auto_68183 ?auto_68175 ) ) ( not ( = ?auto_68179 ?auto_68175 ) ) ( not ( = ?auto_68191 ?auto_68175 ) ) ( AVAILABLE ?auto_68175 ) ( SURFACE-AT ?auto_68190 ?auto_68181 ) ( ON ?auto_68190 ?auto_68196 ) ( CLEAR ?auto_68190 ) ( not ( = ?auto_68171 ?auto_68196 ) ) ( not ( = ?auto_68172 ?auto_68196 ) ) ( not ( = ?auto_68188 ?auto_68196 ) ) ( not ( = ?auto_68177 ?auto_68196 ) ) ( not ( = ?auto_68201 ?auto_68196 ) ) ( not ( = ?auto_68174 ?auto_68196 ) ) ( not ( = ?auto_68184 ?auto_68196 ) ) ( not ( = ?auto_68187 ?auto_68196 ) ) ( not ( = ?auto_68192 ?auto_68196 ) ) ( not ( = ?auto_68190 ?auto_68196 ) ) ( not ( = ?auto_68202 ?auto_68196 ) ) ( not ( = ?auto_68195 ?auto_68196 ) ) ( IS-CRATE ?auto_68195 ) ( not ( = ?auto_68171 ?auto_68189 ) ) ( not ( = ?auto_68172 ?auto_68189 ) ) ( not ( = ?auto_68188 ?auto_68189 ) ) ( not ( = ?auto_68177 ?auto_68189 ) ) ( not ( = ?auto_68201 ?auto_68189 ) ) ( not ( = ?auto_68174 ?auto_68189 ) ) ( not ( = ?auto_68184 ?auto_68189 ) ) ( not ( = ?auto_68187 ?auto_68189 ) ) ( not ( = ?auto_68192 ?auto_68189 ) ) ( not ( = ?auto_68190 ?auto_68189 ) ) ( not ( = ?auto_68202 ?auto_68189 ) ) ( not ( = ?auto_68195 ?auto_68189 ) ) ( not ( = ?auto_68196 ?auto_68189 ) ) ( AVAILABLE ?auto_68183 ) ( SURFACE-AT ?auto_68195 ?auto_68186 ) ( ON ?auto_68195 ?auto_68180 ) ( CLEAR ?auto_68195 ) ( not ( = ?auto_68171 ?auto_68180 ) ) ( not ( = ?auto_68172 ?auto_68180 ) ) ( not ( = ?auto_68188 ?auto_68180 ) ) ( not ( = ?auto_68177 ?auto_68180 ) ) ( not ( = ?auto_68201 ?auto_68180 ) ) ( not ( = ?auto_68174 ?auto_68180 ) ) ( not ( = ?auto_68184 ?auto_68180 ) ) ( not ( = ?auto_68187 ?auto_68180 ) ) ( not ( = ?auto_68192 ?auto_68180 ) ) ( not ( = ?auto_68190 ?auto_68180 ) ) ( not ( = ?auto_68202 ?auto_68180 ) ) ( not ( = ?auto_68195 ?auto_68180 ) ) ( not ( = ?auto_68196 ?auto_68180 ) ) ( not ( = ?auto_68189 ?auto_68180 ) ) ( IS-CRATE ?auto_68189 ) ( not ( = ?auto_68171 ?auto_68178 ) ) ( not ( = ?auto_68172 ?auto_68178 ) ) ( not ( = ?auto_68188 ?auto_68178 ) ) ( not ( = ?auto_68177 ?auto_68178 ) ) ( not ( = ?auto_68201 ?auto_68178 ) ) ( not ( = ?auto_68174 ?auto_68178 ) ) ( not ( = ?auto_68184 ?auto_68178 ) ) ( not ( = ?auto_68187 ?auto_68178 ) ) ( not ( = ?auto_68192 ?auto_68178 ) ) ( not ( = ?auto_68190 ?auto_68178 ) ) ( not ( = ?auto_68202 ?auto_68178 ) ) ( not ( = ?auto_68195 ?auto_68178 ) ) ( not ( = ?auto_68196 ?auto_68178 ) ) ( not ( = ?auto_68189 ?auto_68178 ) ) ( not ( = ?auto_68180 ?auto_68178 ) ) ( not ( = ?auto_68198 ?auto_68173 ) ) ( not ( = ?auto_68199 ?auto_68198 ) ) ( not ( = ?auto_68186 ?auto_68198 ) ) ( not ( = ?auto_68197 ?auto_68198 ) ) ( not ( = ?auto_68185 ?auto_68198 ) ) ( not ( = ?auto_68181 ?auto_68198 ) ) ( HOIST-AT ?auto_68176 ?auto_68198 ) ( not ( = ?auto_68194 ?auto_68176 ) ) ( not ( = ?auto_68203 ?auto_68176 ) ) ( not ( = ?auto_68183 ?auto_68176 ) ) ( not ( = ?auto_68179 ?auto_68176 ) ) ( not ( = ?auto_68191 ?auto_68176 ) ) ( not ( = ?auto_68175 ?auto_68176 ) ) ( AVAILABLE ?auto_68176 ) ( SURFACE-AT ?auto_68189 ?auto_68198 ) ( ON ?auto_68189 ?auto_68200 ) ( CLEAR ?auto_68189 ) ( not ( = ?auto_68171 ?auto_68200 ) ) ( not ( = ?auto_68172 ?auto_68200 ) ) ( not ( = ?auto_68188 ?auto_68200 ) ) ( not ( = ?auto_68177 ?auto_68200 ) ) ( not ( = ?auto_68201 ?auto_68200 ) ) ( not ( = ?auto_68174 ?auto_68200 ) ) ( not ( = ?auto_68184 ?auto_68200 ) ) ( not ( = ?auto_68187 ?auto_68200 ) ) ( not ( = ?auto_68192 ?auto_68200 ) ) ( not ( = ?auto_68190 ?auto_68200 ) ) ( not ( = ?auto_68202 ?auto_68200 ) ) ( not ( = ?auto_68195 ?auto_68200 ) ) ( not ( = ?auto_68196 ?auto_68200 ) ) ( not ( = ?auto_68189 ?auto_68200 ) ) ( not ( = ?auto_68180 ?auto_68200 ) ) ( not ( = ?auto_68178 ?auto_68200 ) ) ( SURFACE-AT ?auto_68182 ?auto_68173 ) ( CLEAR ?auto_68182 ) ( IS-CRATE ?auto_68178 ) ( not ( = ?auto_68171 ?auto_68182 ) ) ( not ( = ?auto_68172 ?auto_68182 ) ) ( not ( = ?auto_68188 ?auto_68182 ) ) ( not ( = ?auto_68177 ?auto_68182 ) ) ( not ( = ?auto_68201 ?auto_68182 ) ) ( not ( = ?auto_68174 ?auto_68182 ) ) ( not ( = ?auto_68184 ?auto_68182 ) ) ( not ( = ?auto_68187 ?auto_68182 ) ) ( not ( = ?auto_68192 ?auto_68182 ) ) ( not ( = ?auto_68190 ?auto_68182 ) ) ( not ( = ?auto_68202 ?auto_68182 ) ) ( not ( = ?auto_68195 ?auto_68182 ) ) ( not ( = ?auto_68196 ?auto_68182 ) ) ( not ( = ?auto_68189 ?auto_68182 ) ) ( not ( = ?auto_68180 ?auto_68182 ) ) ( not ( = ?auto_68178 ?auto_68182 ) ) ( not ( = ?auto_68200 ?auto_68182 ) ) ( AVAILABLE ?auto_68194 ) ( TRUCK-AT ?auto_68193 ?auto_68204 ) ( not ( = ?auto_68204 ?auto_68173 ) ) ( not ( = ?auto_68199 ?auto_68204 ) ) ( not ( = ?auto_68186 ?auto_68204 ) ) ( not ( = ?auto_68197 ?auto_68204 ) ) ( not ( = ?auto_68185 ?auto_68204 ) ) ( not ( = ?auto_68181 ?auto_68204 ) ) ( not ( = ?auto_68198 ?auto_68204 ) ) ( HOIST-AT ?auto_68205 ?auto_68204 ) ( LIFTING ?auto_68205 ?auto_68178 ) ( not ( = ?auto_68194 ?auto_68205 ) ) ( not ( = ?auto_68203 ?auto_68205 ) ) ( not ( = ?auto_68183 ?auto_68205 ) ) ( not ( = ?auto_68179 ?auto_68205 ) ) ( not ( = ?auto_68191 ?auto_68205 ) ) ( not ( = ?auto_68175 ?auto_68205 ) ) ( not ( = ?auto_68176 ?auto_68205 ) ) )
    :subtasks
    ( ( !LOAD ?auto_68205 ?auto_68178 ?auto_68193 ?auto_68204 )
      ( MAKE-ON ?auto_68171 ?auto_68172 )
      ( MAKE-ON-VERIFY ?auto_68171 ?auto_68172 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_68206 - SURFACE
      ?auto_68207 - SURFACE
    )
    :vars
    (
      ?auto_68231 - HOIST
      ?auto_68210 - PLACE
      ?auto_68220 - PLACE
      ?auto_68224 - HOIST
      ?auto_68233 - SURFACE
      ?auto_68217 - SURFACE
      ?auto_68219 - PLACE
      ?auto_68212 - HOIST
      ?auto_68222 - SURFACE
      ?auto_68218 - SURFACE
      ?auto_68208 - PLACE
      ?auto_68214 - HOIST
      ?auto_68211 - SURFACE
      ?auto_68234 - SURFACE
      ?auto_68229 - SURFACE
      ?auto_68227 - SURFACE
      ?auto_68237 - PLACE
      ?auto_68228 - HOIST
      ?auto_68223 - SURFACE
      ?auto_68232 - SURFACE
      ?auto_68215 - PLACE
      ?auto_68235 - HOIST
      ?auto_68225 - SURFACE
      ?auto_68226 - SURFACE
      ?auto_68238 - SURFACE
      ?auto_68240 - SURFACE
      ?auto_68213 - PLACE
      ?auto_68239 - HOIST
      ?auto_68221 - SURFACE
      ?auto_68236 - SURFACE
      ?auto_68230 - TRUCK
      ?auto_68209 - PLACE
      ?auto_68216 - HOIST
      ?auto_68241 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_68231 ?auto_68210 ) ( IS-CRATE ?auto_68206 ) ( not ( = ?auto_68206 ?auto_68207 ) ) ( not ( = ?auto_68220 ?auto_68210 ) ) ( HOIST-AT ?auto_68224 ?auto_68220 ) ( not ( = ?auto_68231 ?auto_68224 ) ) ( AVAILABLE ?auto_68224 ) ( SURFACE-AT ?auto_68206 ?auto_68220 ) ( ON ?auto_68206 ?auto_68233 ) ( CLEAR ?auto_68206 ) ( not ( = ?auto_68206 ?auto_68233 ) ) ( not ( = ?auto_68207 ?auto_68233 ) ) ( IS-CRATE ?auto_68207 ) ( not ( = ?auto_68206 ?auto_68217 ) ) ( not ( = ?auto_68207 ?auto_68217 ) ) ( not ( = ?auto_68233 ?auto_68217 ) ) ( not ( = ?auto_68219 ?auto_68210 ) ) ( not ( = ?auto_68220 ?auto_68219 ) ) ( HOIST-AT ?auto_68212 ?auto_68219 ) ( not ( = ?auto_68231 ?auto_68212 ) ) ( not ( = ?auto_68224 ?auto_68212 ) ) ( SURFACE-AT ?auto_68207 ?auto_68219 ) ( ON ?auto_68207 ?auto_68222 ) ( CLEAR ?auto_68207 ) ( not ( = ?auto_68206 ?auto_68222 ) ) ( not ( = ?auto_68207 ?auto_68222 ) ) ( not ( = ?auto_68233 ?auto_68222 ) ) ( not ( = ?auto_68217 ?auto_68222 ) ) ( IS-CRATE ?auto_68217 ) ( not ( = ?auto_68206 ?auto_68218 ) ) ( not ( = ?auto_68207 ?auto_68218 ) ) ( not ( = ?auto_68233 ?auto_68218 ) ) ( not ( = ?auto_68217 ?auto_68218 ) ) ( not ( = ?auto_68222 ?auto_68218 ) ) ( not ( = ?auto_68208 ?auto_68210 ) ) ( not ( = ?auto_68220 ?auto_68208 ) ) ( not ( = ?auto_68219 ?auto_68208 ) ) ( HOIST-AT ?auto_68214 ?auto_68208 ) ( not ( = ?auto_68231 ?auto_68214 ) ) ( not ( = ?auto_68224 ?auto_68214 ) ) ( not ( = ?auto_68212 ?auto_68214 ) ) ( SURFACE-AT ?auto_68217 ?auto_68208 ) ( ON ?auto_68217 ?auto_68211 ) ( CLEAR ?auto_68217 ) ( not ( = ?auto_68206 ?auto_68211 ) ) ( not ( = ?auto_68207 ?auto_68211 ) ) ( not ( = ?auto_68233 ?auto_68211 ) ) ( not ( = ?auto_68217 ?auto_68211 ) ) ( not ( = ?auto_68222 ?auto_68211 ) ) ( not ( = ?auto_68218 ?auto_68211 ) ) ( IS-CRATE ?auto_68218 ) ( not ( = ?auto_68206 ?auto_68234 ) ) ( not ( = ?auto_68207 ?auto_68234 ) ) ( not ( = ?auto_68233 ?auto_68234 ) ) ( not ( = ?auto_68217 ?auto_68234 ) ) ( not ( = ?auto_68222 ?auto_68234 ) ) ( not ( = ?auto_68218 ?auto_68234 ) ) ( not ( = ?auto_68211 ?auto_68234 ) ) ( AVAILABLE ?auto_68214 ) ( SURFACE-AT ?auto_68218 ?auto_68208 ) ( ON ?auto_68218 ?auto_68229 ) ( CLEAR ?auto_68218 ) ( not ( = ?auto_68206 ?auto_68229 ) ) ( not ( = ?auto_68207 ?auto_68229 ) ) ( not ( = ?auto_68233 ?auto_68229 ) ) ( not ( = ?auto_68217 ?auto_68229 ) ) ( not ( = ?auto_68222 ?auto_68229 ) ) ( not ( = ?auto_68218 ?auto_68229 ) ) ( not ( = ?auto_68211 ?auto_68229 ) ) ( not ( = ?auto_68234 ?auto_68229 ) ) ( IS-CRATE ?auto_68234 ) ( not ( = ?auto_68206 ?auto_68227 ) ) ( not ( = ?auto_68207 ?auto_68227 ) ) ( not ( = ?auto_68233 ?auto_68227 ) ) ( not ( = ?auto_68217 ?auto_68227 ) ) ( not ( = ?auto_68222 ?auto_68227 ) ) ( not ( = ?auto_68218 ?auto_68227 ) ) ( not ( = ?auto_68211 ?auto_68227 ) ) ( not ( = ?auto_68234 ?auto_68227 ) ) ( not ( = ?auto_68229 ?auto_68227 ) ) ( not ( = ?auto_68237 ?auto_68210 ) ) ( not ( = ?auto_68220 ?auto_68237 ) ) ( not ( = ?auto_68219 ?auto_68237 ) ) ( not ( = ?auto_68208 ?auto_68237 ) ) ( HOIST-AT ?auto_68228 ?auto_68237 ) ( not ( = ?auto_68231 ?auto_68228 ) ) ( not ( = ?auto_68224 ?auto_68228 ) ) ( not ( = ?auto_68212 ?auto_68228 ) ) ( not ( = ?auto_68214 ?auto_68228 ) ) ( AVAILABLE ?auto_68228 ) ( SURFACE-AT ?auto_68234 ?auto_68237 ) ( ON ?auto_68234 ?auto_68223 ) ( CLEAR ?auto_68234 ) ( not ( = ?auto_68206 ?auto_68223 ) ) ( not ( = ?auto_68207 ?auto_68223 ) ) ( not ( = ?auto_68233 ?auto_68223 ) ) ( not ( = ?auto_68217 ?auto_68223 ) ) ( not ( = ?auto_68222 ?auto_68223 ) ) ( not ( = ?auto_68218 ?auto_68223 ) ) ( not ( = ?auto_68211 ?auto_68223 ) ) ( not ( = ?auto_68234 ?auto_68223 ) ) ( not ( = ?auto_68229 ?auto_68223 ) ) ( not ( = ?auto_68227 ?auto_68223 ) ) ( IS-CRATE ?auto_68227 ) ( not ( = ?auto_68206 ?auto_68232 ) ) ( not ( = ?auto_68207 ?auto_68232 ) ) ( not ( = ?auto_68233 ?auto_68232 ) ) ( not ( = ?auto_68217 ?auto_68232 ) ) ( not ( = ?auto_68222 ?auto_68232 ) ) ( not ( = ?auto_68218 ?auto_68232 ) ) ( not ( = ?auto_68211 ?auto_68232 ) ) ( not ( = ?auto_68234 ?auto_68232 ) ) ( not ( = ?auto_68229 ?auto_68232 ) ) ( not ( = ?auto_68227 ?auto_68232 ) ) ( not ( = ?auto_68223 ?auto_68232 ) ) ( not ( = ?auto_68215 ?auto_68210 ) ) ( not ( = ?auto_68220 ?auto_68215 ) ) ( not ( = ?auto_68219 ?auto_68215 ) ) ( not ( = ?auto_68208 ?auto_68215 ) ) ( not ( = ?auto_68237 ?auto_68215 ) ) ( HOIST-AT ?auto_68235 ?auto_68215 ) ( not ( = ?auto_68231 ?auto_68235 ) ) ( not ( = ?auto_68224 ?auto_68235 ) ) ( not ( = ?auto_68212 ?auto_68235 ) ) ( not ( = ?auto_68214 ?auto_68235 ) ) ( not ( = ?auto_68228 ?auto_68235 ) ) ( AVAILABLE ?auto_68235 ) ( SURFACE-AT ?auto_68227 ?auto_68215 ) ( ON ?auto_68227 ?auto_68225 ) ( CLEAR ?auto_68227 ) ( not ( = ?auto_68206 ?auto_68225 ) ) ( not ( = ?auto_68207 ?auto_68225 ) ) ( not ( = ?auto_68233 ?auto_68225 ) ) ( not ( = ?auto_68217 ?auto_68225 ) ) ( not ( = ?auto_68222 ?auto_68225 ) ) ( not ( = ?auto_68218 ?auto_68225 ) ) ( not ( = ?auto_68211 ?auto_68225 ) ) ( not ( = ?auto_68234 ?auto_68225 ) ) ( not ( = ?auto_68229 ?auto_68225 ) ) ( not ( = ?auto_68227 ?auto_68225 ) ) ( not ( = ?auto_68223 ?auto_68225 ) ) ( not ( = ?auto_68232 ?auto_68225 ) ) ( IS-CRATE ?auto_68232 ) ( not ( = ?auto_68206 ?auto_68226 ) ) ( not ( = ?auto_68207 ?auto_68226 ) ) ( not ( = ?auto_68233 ?auto_68226 ) ) ( not ( = ?auto_68217 ?auto_68226 ) ) ( not ( = ?auto_68222 ?auto_68226 ) ) ( not ( = ?auto_68218 ?auto_68226 ) ) ( not ( = ?auto_68211 ?auto_68226 ) ) ( not ( = ?auto_68234 ?auto_68226 ) ) ( not ( = ?auto_68229 ?auto_68226 ) ) ( not ( = ?auto_68227 ?auto_68226 ) ) ( not ( = ?auto_68223 ?auto_68226 ) ) ( not ( = ?auto_68232 ?auto_68226 ) ) ( not ( = ?auto_68225 ?auto_68226 ) ) ( AVAILABLE ?auto_68212 ) ( SURFACE-AT ?auto_68232 ?auto_68219 ) ( ON ?auto_68232 ?auto_68238 ) ( CLEAR ?auto_68232 ) ( not ( = ?auto_68206 ?auto_68238 ) ) ( not ( = ?auto_68207 ?auto_68238 ) ) ( not ( = ?auto_68233 ?auto_68238 ) ) ( not ( = ?auto_68217 ?auto_68238 ) ) ( not ( = ?auto_68222 ?auto_68238 ) ) ( not ( = ?auto_68218 ?auto_68238 ) ) ( not ( = ?auto_68211 ?auto_68238 ) ) ( not ( = ?auto_68234 ?auto_68238 ) ) ( not ( = ?auto_68229 ?auto_68238 ) ) ( not ( = ?auto_68227 ?auto_68238 ) ) ( not ( = ?auto_68223 ?auto_68238 ) ) ( not ( = ?auto_68232 ?auto_68238 ) ) ( not ( = ?auto_68225 ?auto_68238 ) ) ( not ( = ?auto_68226 ?auto_68238 ) ) ( IS-CRATE ?auto_68226 ) ( not ( = ?auto_68206 ?auto_68240 ) ) ( not ( = ?auto_68207 ?auto_68240 ) ) ( not ( = ?auto_68233 ?auto_68240 ) ) ( not ( = ?auto_68217 ?auto_68240 ) ) ( not ( = ?auto_68222 ?auto_68240 ) ) ( not ( = ?auto_68218 ?auto_68240 ) ) ( not ( = ?auto_68211 ?auto_68240 ) ) ( not ( = ?auto_68234 ?auto_68240 ) ) ( not ( = ?auto_68229 ?auto_68240 ) ) ( not ( = ?auto_68227 ?auto_68240 ) ) ( not ( = ?auto_68223 ?auto_68240 ) ) ( not ( = ?auto_68232 ?auto_68240 ) ) ( not ( = ?auto_68225 ?auto_68240 ) ) ( not ( = ?auto_68226 ?auto_68240 ) ) ( not ( = ?auto_68238 ?auto_68240 ) ) ( not ( = ?auto_68213 ?auto_68210 ) ) ( not ( = ?auto_68220 ?auto_68213 ) ) ( not ( = ?auto_68219 ?auto_68213 ) ) ( not ( = ?auto_68208 ?auto_68213 ) ) ( not ( = ?auto_68237 ?auto_68213 ) ) ( not ( = ?auto_68215 ?auto_68213 ) ) ( HOIST-AT ?auto_68239 ?auto_68213 ) ( not ( = ?auto_68231 ?auto_68239 ) ) ( not ( = ?auto_68224 ?auto_68239 ) ) ( not ( = ?auto_68212 ?auto_68239 ) ) ( not ( = ?auto_68214 ?auto_68239 ) ) ( not ( = ?auto_68228 ?auto_68239 ) ) ( not ( = ?auto_68235 ?auto_68239 ) ) ( AVAILABLE ?auto_68239 ) ( SURFACE-AT ?auto_68226 ?auto_68213 ) ( ON ?auto_68226 ?auto_68221 ) ( CLEAR ?auto_68226 ) ( not ( = ?auto_68206 ?auto_68221 ) ) ( not ( = ?auto_68207 ?auto_68221 ) ) ( not ( = ?auto_68233 ?auto_68221 ) ) ( not ( = ?auto_68217 ?auto_68221 ) ) ( not ( = ?auto_68222 ?auto_68221 ) ) ( not ( = ?auto_68218 ?auto_68221 ) ) ( not ( = ?auto_68211 ?auto_68221 ) ) ( not ( = ?auto_68234 ?auto_68221 ) ) ( not ( = ?auto_68229 ?auto_68221 ) ) ( not ( = ?auto_68227 ?auto_68221 ) ) ( not ( = ?auto_68223 ?auto_68221 ) ) ( not ( = ?auto_68232 ?auto_68221 ) ) ( not ( = ?auto_68225 ?auto_68221 ) ) ( not ( = ?auto_68226 ?auto_68221 ) ) ( not ( = ?auto_68238 ?auto_68221 ) ) ( not ( = ?auto_68240 ?auto_68221 ) ) ( SURFACE-AT ?auto_68236 ?auto_68210 ) ( CLEAR ?auto_68236 ) ( IS-CRATE ?auto_68240 ) ( not ( = ?auto_68206 ?auto_68236 ) ) ( not ( = ?auto_68207 ?auto_68236 ) ) ( not ( = ?auto_68233 ?auto_68236 ) ) ( not ( = ?auto_68217 ?auto_68236 ) ) ( not ( = ?auto_68222 ?auto_68236 ) ) ( not ( = ?auto_68218 ?auto_68236 ) ) ( not ( = ?auto_68211 ?auto_68236 ) ) ( not ( = ?auto_68234 ?auto_68236 ) ) ( not ( = ?auto_68229 ?auto_68236 ) ) ( not ( = ?auto_68227 ?auto_68236 ) ) ( not ( = ?auto_68223 ?auto_68236 ) ) ( not ( = ?auto_68232 ?auto_68236 ) ) ( not ( = ?auto_68225 ?auto_68236 ) ) ( not ( = ?auto_68226 ?auto_68236 ) ) ( not ( = ?auto_68238 ?auto_68236 ) ) ( not ( = ?auto_68240 ?auto_68236 ) ) ( not ( = ?auto_68221 ?auto_68236 ) ) ( AVAILABLE ?auto_68231 ) ( TRUCK-AT ?auto_68230 ?auto_68209 ) ( not ( = ?auto_68209 ?auto_68210 ) ) ( not ( = ?auto_68220 ?auto_68209 ) ) ( not ( = ?auto_68219 ?auto_68209 ) ) ( not ( = ?auto_68208 ?auto_68209 ) ) ( not ( = ?auto_68237 ?auto_68209 ) ) ( not ( = ?auto_68215 ?auto_68209 ) ) ( not ( = ?auto_68213 ?auto_68209 ) ) ( HOIST-AT ?auto_68216 ?auto_68209 ) ( not ( = ?auto_68231 ?auto_68216 ) ) ( not ( = ?auto_68224 ?auto_68216 ) ) ( not ( = ?auto_68212 ?auto_68216 ) ) ( not ( = ?auto_68214 ?auto_68216 ) ) ( not ( = ?auto_68228 ?auto_68216 ) ) ( not ( = ?auto_68235 ?auto_68216 ) ) ( not ( = ?auto_68239 ?auto_68216 ) ) ( AVAILABLE ?auto_68216 ) ( SURFACE-AT ?auto_68240 ?auto_68209 ) ( ON ?auto_68240 ?auto_68241 ) ( CLEAR ?auto_68240 ) ( not ( = ?auto_68206 ?auto_68241 ) ) ( not ( = ?auto_68207 ?auto_68241 ) ) ( not ( = ?auto_68233 ?auto_68241 ) ) ( not ( = ?auto_68217 ?auto_68241 ) ) ( not ( = ?auto_68222 ?auto_68241 ) ) ( not ( = ?auto_68218 ?auto_68241 ) ) ( not ( = ?auto_68211 ?auto_68241 ) ) ( not ( = ?auto_68234 ?auto_68241 ) ) ( not ( = ?auto_68229 ?auto_68241 ) ) ( not ( = ?auto_68227 ?auto_68241 ) ) ( not ( = ?auto_68223 ?auto_68241 ) ) ( not ( = ?auto_68232 ?auto_68241 ) ) ( not ( = ?auto_68225 ?auto_68241 ) ) ( not ( = ?auto_68226 ?auto_68241 ) ) ( not ( = ?auto_68238 ?auto_68241 ) ) ( not ( = ?auto_68240 ?auto_68241 ) ) ( not ( = ?auto_68221 ?auto_68241 ) ) ( not ( = ?auto_68236 ?auto_68241 ) ) )
    :subtasks
    ( ( !LIFT ?auto_68216 ?auto_68240 ?auto_68241 ?auto_68209 )
      ( MAKE-ON ?auto_68206 ?auto_68207 )
      ( MAKE-ON-VERIFY ?auto_68206 ?auto_68207 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_68242 - SURFACE
      ?auto_68243 - SURFACE
    )
    :vars
    (
      ?auto_68262 - HOIST
      ?auto_68253 - PLACE
      ?auto_68244 - PLACE
      ?auto_68263 - HOIST
      ?auto_68256 - SURFACE
      ?auto_68246 - SURFACE
      ?auto_68272 - PLACE
      ?auto_68274 - HOIST
      ?auto_68252 - SURFACE
      ?auto_68247 - SURFACE
      ?auto_68276 - PLACE
      ?auto_68271 - HOIST
      ?auto_68251 - SURFACE
      ?auto_68257 - SURFACE
      ?auto_68268 - SURFACE
      ?auto_68266 - SURFACE
      ?auto_68260 - PLACE
      ?auto_68267 - HOIST
      ?auto_68270 - SURFACE
      ?auto_68254 - SURFACE
      ?auto_68250 - PLACE
      ?auto_68258 - HOIST
      ?auto_68264 - SURFACE
      ?auto_68265 - SURFACE
      ?auto_68261 - SURFACE
      ?auto_68249 - SURFACE
      ?auto_68245 - PLACE
      ?auto_68255 - HOIST
      ?auto_68248 - SURFACE
      ?auto_68259 - SURFACE
      ?auto_68273 - PLACE
      ?auto_68275 - HOIST
      ?auto_68277 - SURFACE
      ?auto_68269 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_68262 ?auto_68253 ) ( IS-CRATE ?auto_68242 ) ( not ( = ?auto_68242 ?auto_68243 ) ) ( not ( = ?auto_68244 ?auto_68253 ) ) ( HOIST-AT ?auto_68263 ?auto_68244 ) ( not ( = ?auto_68262 ?auto_68263 ) ) ( AVAILABLE ?auto_68263 ) ( SURFACE-AT ?auto_68242 ?auto_68244 ) ( ON ?auto_68242 ?auto_68256 ) ( CLEAR ?auto_68242 ) ( not ( = ?auto_68242 ?auto_68256 ) ) ( not ( = ?auto_68243 ?auto_68256 ) ) ( IS-CRATE ?auto_68243 ) ( not ( = ?auto_68242 ?auto_68246 ) ) ( not ( = ?auto_68243 ?auto_68246 ) ) ( not ( = ?auto_68256 ?auto_68246 ) ) ( not ( = ?auto_68272 ?auto_68253 ) ) ( not ( = ?auto_68244 ?auto_68272 ) ) ( HOIST-AT ?auto_68274 ?auto_68272 ) ( not ( = ?auto_68262 ?auto_68274 ) ) ( not ( = ?auto_68263 ?auto_68274 ) ) ( SURFACE-AT ?auto_68243 ?auto_68272 ) ( ON ?auto_68243 ?auto_68252 ) ( CLEAR ?auto_68243 ) ( not ( = ?auto_68242 ?auto_68252 ) ) ( not ( = ?auto_68243 ?auto_68252 ) ) ( not ( = ?auto_68256 ?auto_68252 ) ) ( not ( = ?auto_68246 ?auto_68252 ) ) ( IS-CRATE ?auto_68246 ) ( not ( = ?auto_68242 ?auto_68247 ) ) ( not ( = ?auto_68243 ?auto_68247 ) ) ( not ( = ?auto_68256 ?auto_68247 ) ) ( not ( = ?auto_68246 ?auto_68247 ) ) ( not ( = ?auto_68252 ?auto_68247 ) ) ( not ( = ?auto_68276 ?auto_68253 ) ) ( not ( = ?auto_68244 ?auto_68276 ) ) ( not ( = ?auto_68272 ?auto_68276 ) ) ( HOIST-AT ?auto_68271 ?auto_68276 ) ( not ( = ?auto_68262 ?auto_68271 ) ) ( not ( = ?auto_68263 ?auto_68271 ) ) ( not ( = ?auto_68274 ?auto_68271 ) ) ( SURFACE-AT ?auto_68246 ?auto_68276 ) ( ON ?auto_68246 ?auto_68251 ) ( CLEAR ?auto_68246 ) ( not ( = ?auto_68242 ?auto_68251 ) ) ( not ( = ?auto_68243 ?auto_68251 ) ) ( not ( = ?auto_68256 ?auto_68251 ) ) ( not ( = ?auto_68246 ?auto_68251 ) ) ( not ( = ?auto_68252 ?auto_68251 ) ) ( not ( = ?auto_68247 ?auto_68251 ) ) ( IS-CRATE ?auto_68247 ) ( not ( = ?auto_68242 ?auto_68257 ) ) ( not ( = ?auto_68243 ?auto_68257 ) ) ( not ( = ?auto_68256 ?auto_68257 ) ) ( not ( = ?auto_68246 ?auto_68257 ) ) ( not ( = ?auto_68252 ?auto_68257 ) ) ( not ( = ?auto_68247 ?auto_68257 ) ) ( not ( = ?auto_68251 ?auto_68257 ) ) ( AVAILABLE ?auto_68271 ) ( SURFACE-AT ?auto_68247 ?auto_68276 ) ( ON ?auto_68247 ?auto_68268 ) ( CLEAR ?auto_68247 ) ( not ( = ?auto_68242 ?auto_68268 ) ) ( not ( = ?auto_68243 ?auto_68268 ) ) ( not ( = ?auto_68256 ?auto_68268 ) ) ( not ( = ?auto_68246 ?auto_68268 ) ) ( not ( = ?auto_68252 ?auto_68268 ) ) ( not ( = ?auto_68247 ?auto_68268 ) ) ( not ( = ?auto_68251 ?auto_68268 ) ) ( not ( = ?auto_68257 ?auto_68268 ) ) ( IS-CRATE ?auto_68257 ) ( not ( = ?auto_68242 ?auto_68266 ) ) ( not ( = ?auto_68243 ?auto_68266 ) ) ( not ( = ?auto_68256 ?auto_68266 ) ) ( not ( = ?auto_68246 ?auto_68266 ) ) ( not ( = ?auto_68252 ?auto_68266 ) ) ( not ( = ?auto_68247 ?auto_68266 ) ) ( not ( = ?auto_68251 ?auto_68266 ) ) ( not ( = ?auto_68257 ?auto_68266 ) ) ( not ( = ?auto_68268 ?auto_68266 ) ) ( not ( = ?auto_68260 ?auto_68253 ) ) ( not ( = ?auto_68244 ?auto_68260 ) ) ( not ( = ?auto_68272 ?auto_68260 ) ) ( not ( = ?auto_68276 ?auto_68260 ) ) ( HOIST-AT ?auto_68267 ?auto_68260 ) ( not ( = ?auto_68262 ?auto_68267 ) ) ( not ( = ?auto_68263 ?auto_68267 ) ) ( not ( = ?auto_68274 ?auto_68267 ) ) ( not ( = ?auto_68271 ?auto_68267 ) ) ( AVAILABLE ?auto_68267 ) ( SURFACE-AT ?auto_68257 ?auto_68260 ) ( ON ?auto_68257 ?auto_68270 ) ( CLEAR ?auto_68257 ) ( not ( = ?auto_68242 ?auto_68270 ) ) ( not ( = ?auto_68243 ?auto_68270 ) ) ( not ( = ?auto_68256 ?auto_68270 ) ) ( not ( = ?auto_68246 ?auto_68270 ) ) ( not ( = ?auto_68252 ?auto_68270 ) ) ( not ( = ?auto_68247 ?auto_68270 ) ) ( not ( = ?auto_68251 ?auto_68270 ) ) ( not ( = ?auto_68257 ?auto_68270 ) ) ( not ( = ?auto_68268 ?auto_68270 ) ) ( not ( = ?auto_68266 ?auto_68270 ) ) ( IS-CRATE ?auto_68266 ) ( not ( = ?auto_68242 ?auto_68254 ) ) ( not ( = ?auto_68243 ?auto_68254 ) ) ( not ( = ?auto_68256 ?auto_68254 ) ) ( not ( = ?auto_68246 ?auto_68254 ) ) ( not ( = ?auto_68252 ?auto_68254 ) ) ( not ( = ?auto_68247 ?auto_68254 ) ) ( not ( = ?auto_68251 ?auto_68254 ) ) ( not ( = ?auto_68257 ?auto_68254 ) ) ( not ( = ?auto_68268 ?auto_68254 ) ) ( not ( = ?auto_68266 ?auto_68254 ) ) ( not ( = ?auto_68270 ?auto_68254 ) ) ( not ( = ?auto_68250 ?auto_68253 ) ) ( not ( = ?auto_68244 ?auto_68250 ) ) ( not ( = ?auto_68272 ?auto_68250 ) ) ( not ( = ?auto_68276 ?auto_68250 ) ) ( not ( = ?auto_68260 ?auto_68250 ) ) ( HOIST-AT ?auto_68258 ?auto_68250 ) ( not ( = ?auto_68262 ?auto_68258 ) ) ( not ( = ?auto_68263 ?auto_68258 ) ) ( not ( = ?auto_68274 ?auto_68258 ) ) ( not ( = ?auto_68271 ?auto_68258 ) ) ( not ( = ?auto_68267 ?auto_68258 ) ) ( AVAILABLE ?auto_68258 ) ( SURFACE-AT ?auto_68266 ?auto_68250 ) ( ON ?auto_68266 ?auto_68264 ) ( CLEAR ?auto_68266 ) ( not ( = ?auto_68242 ?auto_68264 ) ) ( not ( = ?auto_68243 ?auto_68264 ) ) ( not ( = ?auto_68256 ?auto_68264 ) ) ( not ( = ?auto_68246 ?auto_68264 ) ) ( not ( = ?auto_68252 ?auto_68264 ) ) ( not ( = ?auto_68247 ?auto_68264 ) ) ( not ( = ?auto_68251 ?auto_68264 ) ) ( not ( = ?auto_68257 ?auto_68264 ) ) ( not ( = ?auto_68268 ?auto_68264 ) ) ( not ( = ?auto_68266 ?auto_68264 ) ) ( not ( = ?auto_68270 ?auto_68264 ) ) ( not ( = ?auto_68254 ?auto_68264 ) ) ( IS-CRATE ?auto_68254 ) ( not ( = ?auto_68242 ?auto_68265 ) ) ( not ( = ?auto_68243 ?auto_68265 ) ) ( not ( = ?auto_68256 ?auto_68265 ) ) ( not ( = ?auto_68246 ?auto_68265 ) ) ( not ( = ?auto_68252 ?auto_68265 ) ) ( not ( = ?auto_68247 ?auto_68265 ) ) ( not ( = ?auto_68251 ?auto_68265 ) ) ( not ( = ?auto_68257 ?auto_68265 ) ) ( not ( = ?auto_68268 ?auto_68265 ) ) ( not ( = ?auto_68266 ?auto_68265 ) ) ( not ( = ?auto_68270 ?auto_68265 ) ) ( not ( = ?auto_68254 ?auto_68265 ) ) ( not ( = ?auto_68264 ?auto_68265 ) ) ( AVAILABLE ?auto_68274 ) ( SURFACE-AT ?auto_68254 ?auto_68272 ) ( ON ?auto_68254 ?auto_68261 ) ( CLEAR ?auto_68254 ) ( not ( = ?auto_68242 ?auto_68261 ) ) ( not ( = ?auto_68243 ?auto_68261 ) ) ( not ( = ?auto_68256 ?auto_68261 ) ) ( not ( = ?auto_68246 ?auto_68261 ) ) ( not ( = ?auto_68252 ?auto_68261 ) ) ( not ( = ?auto_68247 ?auto_68261 ) ) ( not ( = ?auto_68251 ?auto_68261 ) ) ( not ( = ?auto_68257 ?auto_68261 ) ) ( not ( = ?auto_68268 ?auto_68261 ) ) ( not ( = ?auto_68266 ?auto_68261 ) ) ( not ( = ?auto_68270 ?auto_68261 ) ) ( not ( = ?auto_68254 ?auto_68261 ) ) ( not ( = ?auto_68264 ?auto_68261 ) ) ( not ( = ?auto_68265 ?auto_68261 ) ) ( IS-CRATE ?auto_68265 ) ( not ( = ?auto_68242 ?auto_68249 ) ) ( not ( = ?auto_68243 ?auto_68249 ) ) ( not ( = ?auto_68256 ?auto_68249 ) ) ( not ( = ?auto_68246 ?auto_68249 ) ) ( not ( = ?auto_68252 ?auto_68249 ) ) ( not ( = ?auto_68247 ?auto_68249 ) ) ( not ( = ?auto_68251 ?auto_68249 ) ) ( not ( = ?auto_68257 ?auto_68249 ) ) ( not ( = ?auto_68268 ?auto_68249 ) ) ( not ( = ?auto_68266 ?auto_68249 ) ) ( not ( = ?auto_68270 ?auto_68249 ) ) ( not ( = ?auto_68254 ?auto_68249 ) ) ( not ( = ?auto_68264 ?auto_68249 ) ) ( not ( = ?auto_68265 ?auto_68249 ) ) ( not ( = ?auto_68261 ?auto_68249 ) ) ( not ( = ?auto_68245 ?auto_68253 ) ) ( not ( = ?auto_68244 ?auto_68245 ) ) ( not ( = ?auto_68272 ?auto_68245 ) ) ( not ( = ?auto_68276 ?auto_68245 ) ) ( not ( = ?auto_68260 ?auto_68245 ) ) ( not ( = ?auto_68250 ?auto_68245 ) ) ( HOIST-AT ?auto_68255 ?auto_68245 ) ( not ( = ?auto_68262 ?auto_68255 ) ) ( not ( = ?auto_68263 ?auto_68255 ) ) ( not ( = ?auto_68274 ?auto_68255 ) ) ( not ( = ?auto_68271 ?auto_68255 ) ) ( not ( = ?auto_68267 ?auto_68255 ) ) ( not ( = ?auto_68258 ?auto_68255 ) ) ( AVAILABLE ?auto_68255 ) ( SURFACE-AT ?auto_68265 ?auto_68245 ) ( ON ?auto_68265 ?auto_68248 ) ( CLEAR ?auto_68265 ) ( not ( = ?auto_68242 ?auto_68248 ) ) ( not ( = ?auto_68243 ?auto_68248 ) ) ( not ( = ?auto_68256 ?auto_68248 ) ) ( not ( = ?auto_68246 ?auto_68248 ) ) ( not ( = ?auto_68252 ?auto_68248 ) ) ( not ( = ?auto_68247 ?auto_68248 ) ) ( not ( = ?auto_68251 ?auto_68248 ) ) ( not ( = ?auto_68257 ?auto_68248 ) ) ( not ( = ?auto_68268 ?auto_68248 ) ) ( not ( = ?auto_68266 ?auto_68248 ) ) ( not ( = ?auto_68270 ?auto_68248 ) ) ( not ( = ?auto_68254 ?auto_68248 ) ) ( not ( = ?auto_68264 ?auto_68248 ) ) ( not ( = ?auto_68265 ?auto_68248 ) ) ( not ( = ?auto_68261 ?auto_68248 ) ) ( not ( = ?auto_68249 ?auto_68248 ) ) ( SURFACE-AT ?auto_68259 ?auto_68253 ) ( CLEAR ?auto_68259 ) ( IS-CRATE ?auto_68249 ) ( not ( = ?auto_68242 ?auto_68259 ) ) ( not ( = ?auto_68243 ?auto_68259 ) ) ( not ( = ?auto_68256 ?auto_68259 ) ) ( not ( = ?auto_68246 ?auto_68259 ) ) ( not ( = ?auto_68252 ?auto_68259 ) ) ( not ( = ?auto_68247 ?auto_68259 ) ) ( not ( = ?auto_68251 ?auto_68259 ) ) ( not ( = ?auto_68257 ?auto_68259 ) ) ( not ( = ?auto_68268 ?auto_68259 ) ) ( not ( = ?auto_68266 ?auto_68259 ) ) ( not ( = ?auto_68270 ?auto_68259 ) ) ( not ( = ?auto_68254 ?auto_68259 ) ) ( not ( = ?auto_68264 ?auto_68259 ) ) ( not ( = ?auto_68265 ?auto_68259 ) ) ( not ( = ?auto_68261 ?auto_68259 ) ) ( not ( = ?auto_68249 ?auto_68259 ) ) ( not ( = ?auto_68248 ?auto_68259 ) ) ( AVAILABLE ?auto_68262 ) ( not ( = ?auto_68273 ?auto_68253 ) ) ( not ( = ?auto_68244 ?auto_68273 ) ) ( not ( = ?auto_68272 ?auto_68273 ) ) ( not ( = ?auto_68276 ?auto_68273 ) ) ( not ( = ?auto_68260 ?auto_68273 ) ) ( not ( = ?auto_68250 ?auto_68273 ) ) ( not ( = ?auto_68245 ?auto_68273 ) ) ( HOIST-AT ?auto_68275 ?auto_68273 ) ( not ( = ?auto_68262 ?auto_68275 ) ) ( not ( = ?auto_68263 ?auto_68275 ) ) ( not ( = ?auto_68274 ?auto_68275 ) ) ( not ( = ?auto_68271 ?auto_68275 ) ) ( not ( = ?auto_68267 ?auto_68275 ) ) ( not ( = ?auto_68258 ?auto_68275 ) ) ( not ( = ?auto_68255 ?auto_68275 ) ) ( AVAILABLE ?auto_68275 ) ( SURFACE-AT ?auto_68249 ?auto_68273 ) ( ON ?auto_68249 ?auto_68277 ) ( CLEAR ?auto_68249 ) ( not ( = ?auto_68242 ?auto_68277 ) ) ( not ( = ?auto_68243 ?auto_68277 ) ) ( not ( = ?auto_68256 ?auto_68277 ) ) ( not ( = ?auto_68246 ?auto_68277 ) ) ( not ( = ?auto_68252 ?auto_68277 ) ) ( not ( = ?auto_68247 ?auto_68277 ) ) ( not ( = ?auto_68251 ?auto_68277 ) ) ( not ( = ?auto_68257 ?auto_68277 ) ) ( not ( = ?auto_68268 ?auto_68277 ) ) ( not ( = ?auto_68266 ?auto_68277 ) ) ( not ( = ?auto_68270 ?auto_68277 ) ) ( not ( = ?auto_68254 ?auto_68277 ) ) ( not ( = ?auto_68264 ?auto_68277 ) ) ( not ( = ?auto_68265 ?auto_68277 ) ) ( not ( = ?auto_68261 ?auto_68277 ) ) ( not ( = ?auto_68249 ?auto_68277 ) ) ( not ( = ?auto_68248 ?auto_68277 ) ) ( not ( = ?auto_68259 ?auto_68277 ) ) ( TRUCK-AT ?auto_68269 ?auto_68253 ) )
    :subtasks
    ( ( !DRIVE ?auto_68269 ?auto_68253 ?auto_68273 )
      ( MAKE-ON ?auto_68242 ?auto_68243 )
      ( MAKE-ON-VERIFY ?auto_68242 ?auto_68243 ) )
  )

)

