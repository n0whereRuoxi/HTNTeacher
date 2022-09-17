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

  ( :method MAKE-10CRATE-VERIFY
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
      ?c10 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( CLEAR ?c10 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-11CRATE-VERIFY
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
      ?c10 - SURFACE
      ?c11 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( ON ?c11 ?c10 ) ( CLEAR ?c11 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-12CRATE-VERIFY
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
      ?c10 - SURFACE
      ?c11 - SURFACE
      ?c12 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( ON ?c11 ?c10 ) ( ON ?c12 ?c11 ) ( CLEAR ?c12 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_794891 - SURFACE
      ?auto_794892 - SURFACE
    )
    :vars
    (
      ?auto_794893 - HOIST
      ?auto_794894 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_794893 ?auto_794894 ) ( SURFACE-AT ?auto_794891 ?auto_794894 ) ( CLEAR ?auto_794891 ) ( LIFTING ?auto_794893 ?auto_794892 ) ( IS-CRATE ?auto_794892 ) ( not ( = ?auto_794891 ?auto_794892 ) ) )
    :subtasks
    ( ( !DROP ?auto_794893 ?auto_794892 ?auto_794891 ?auto_794894 )
      ( MAKE-1CRATE-VERIFY ?auto_794891 ?auto_794892 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_794895 - SURFACE
      ?auto_794896 - SURFACE
    )
    :vars
    (
      ?auto_794898 - HOIST
      ?auto_794897 - PLACE
      ?auto_794899 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_794898 ?auto_794897 ) ( SURFACE-AT ?auto_794895 ?auto_794897 ) ( CLEAR ?auto_794895 ) ( IS-CRATE ?auto_794896 ) ( not ( = ?auto_794895 ?auto_794896 ) ) ( TRUCK-AT ?auto_794899 ?auto_794897 ) ( AVAILABLE ?auto_794898 ) ( IN ?auto_794896 ?auto_794899 ) )
    :subtasks
    ( ( !UNLOAD ?auto_794898 ?auto_794896 ?auto_794899 ?auto_794897 )
      ( MAKE-1CRATE ?auto_794895 ?auto_794896 )
      ( MAKE-1CRATE-VERIFY ?auto_794895 ?auto_794896 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_794900 - SURFACE
      ?auto_794901 - SURFACE
    )
    :vars
    (
      ?auto_794902 - HOIST
      ?auto_794904 - PLACE
      ?auto_794903 - TRUCK
      ?auto_794905 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_794902 ?auto_794904 ) ( SURFACE-AT ?auto_794900 ?auto_794904 ) ( CLEAR ?auto_794900 ) ( IS-CRATE ?auto_794901 ) ( not ( = ?auto_794900 ?auto_794901 ) ) ( AVAILABLE ?auto_794902 ) ( IN ?auto_794901 ?auto_794903 ) ( TRUCK-AT ?auto_794903 ?auto_794905 ) ( not ( = ?auto_794905 ?auto_794904 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_794903 ?auto_794905 ?auto_794904 )
      ( MAKE-1CRATE ?auto_794900 ?auto_794901 )
      ( MAKE-1CRATE-VERIFY ?auto_794900 ?auto_794901 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_794906 - SURFACE
      ?auto_794907 - SURFACE
    )
    :vars
    (
      ?auto_794911 - HOIST
      ?auto_794909 - PLACE
      ?auto_794910 - TRUCK
      ?auto_794908 - PLACE
      ?auto_794912 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_794911 ?auto_794909 ) ( SURFACE-AT ?auto_794906 ?auto_794909 ) ( CLEAR ?auto_794906 ) ( IS-CRATE ?auto_794907 ) ( not ( = ?auto_794906 ?auto_794907 ) ) ( AVAILABLE ?auto_794911 ) ( TRUCK-AT ?auto_794910 ?auto_794908 ) ( not ( = ?auto_794908 ?auto_794909 ) ) ( HOIST-AT ?auto_794912 ?auto_794908 ) ( LIFTING ?auto_794912 ?auto_794907 ) ( not ( = ?auto_794911 ?auto_794912 ) ) )
    :subtasks
    ( ( !LOAD ?auto_794912 ?auto_794907 ?auto_794910 ?auto_794908 )
      ( MAKE-1CRATE ?auto_794906 ?auto_794907 )
      ( MAKE-1CRATE-VERIFY ?auto_794906 ?auto_794907 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_794913 - SURFACE
      ?auto_794914 - SURFACE
    )
    :vars
    (
      ?auto_794919 - HOIST
      ?auto_794918 - PLACE
      ?auto_794915 - TRUCK
      ?auto_794916 - PLACE
      ?auto_794917 - HOIST
      ?auto_794920 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_794919 ?auto_794918 ) ( SURFACE-AT ?auto_794913 ?auto_794918 ) ( CLEAR ?auto_794913 ) ( IS-CRATE ?auto_794914 ) ( not ( = ?auto_794913 ?auto_794914 ) ) ( AVAILABLE ?auto_794919 ) ( TRUCK-AT ?auto_794915 ?auto_794916 ) ( not ( = ?auto_794916 ?auto_794918 ) ) ( HOIST-AT ?auto_794917 ?auto_794916 ) ( not ( = ?auto_794919 ?auto_794917 ) ) ( AVAILABLE ?auto_794917 ) ( SURFACE-AT ?auto_794914 ?auto_794916 ) ( ON ?auto_794914 ?auto_794920 ) ( CLEAR ?auto_794914 ) ( not ( = ?auto_794913 ?auto_794920 ) ) ( not ( = ?auto_794914 ?auto_794920 ) ) )
    :subtasks
    ( ( !LIFT ?auto_794917 ?auto_794914 ?auto_794920 ?auto_794916 )
      ( MAKE-1CRATE ?auto_794913 ?auto_794914 )
      ( MAKE-1CRATE-VERIFY ?auto_794913 ?auto_794914 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_794921 - SURFACE
      ?auto_794922 - SURFACE
    )
    :vars
    (
      ?auto_794928 - HOIST
      ?auto_794927 - PLACE
      ?auto_794926 - PLACE
      ?auto_794924 - HOIST
      ?auto_794923 - SURFACE
      ?auto_794925 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_794928 ?auto_794927 ) ( SURFACE-AT ?auto_794921 ?auto_794927 ) ( CLEAR ?auto_794921 ) ( IS-CRATE ?auto_794922 ) ( not ( = ?auto_794921 ?auto_794922 ) ) ( AVAILABLE ?auto_794928 ) ( not ( = ?auto_794926 ?auto_794927 ) ) ( HOIST-AT ?auto_794924 ?auto_794926 ) ( not ( = ?auto_794928 ?auto_794924 ) ) ( AVAILABLE ?auto_794924 ) ( SURFACE-AT ?auto_794922 ?auto_794926 ) ( ON ?auto_794922 ?auto_794923 ) ( CLEAR ?auto_794922 ) ( not ( = ?auto_794921 ?auto_794923 ) ) ( not ( = ?auto_794922 ?auto_794923 ) ) ( TRUCK-AT ?auto_794925 ?auto_794927 ) )
    :subtasks
    ( ( !DRIVE ?auto_794925 ?auto_794927 ?auto_794926 )
      ( MAKE-1CRATE ?auto_794921 ?auto_794922 )
      ( MAKE-1CRATE-VERIFY ?auto_794921 ?auto_794922 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_794938 - SURFACE
      ?auto_794939 - SURFACE
      ?auto_794940 - SURFACE
    )
    :vars
    (
      ?auto_794941 - HOIST
      ?auto_794942 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_794941 ?auto_794942 ) ( SURFACE-AT ?auto_794939 ?auto_794942 ) ( CLEAR ?auto_794939 ) ( LIFTING ?auto_794941 ?auto_794940 ) ( IS-CRATE ?auto_794940 ) ( not ( = ?auto_794939 ?auto_794940 ) ) ( ON ?auto_794939 ?auto_794938 ) ( not ( = ?auto_794938 ?auto_794939 ) ) ( not ( = ?auto_794938 ?auto_794940 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_794939 ?auto_794940 )
      ( MAKE-2CRATE-VERIFY ?auto_794938 ?auto_794939 ?auto_794940 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_794948 - SURFACE
      ?auto_794949 - SURFACE
      ?auto_794950 - SURFACE
    )
    :vars
    (
      ?auto_794951 - HOIST
      ?auto_794952 - PLACE
      ?auto_794953 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_794951 ?auto_794952 ) ( SURFACE-AT ?auto_794949 ?auto_794952 ) ( CLEAR ?auto_794949 ) ( IS-CRATE ?auto_794950 ) ( not ( = ?auto_794949 ?auto_794950 ) ) ( TRUCK-AT ?auto_794953 ?auto_794952 ) ( AVAILABLE ?auto_794951 ) ( IN ?auto_794950 ?auto_794953 ) ( ON ?auto_794949 ?auto_794948 ) ( not ( = ?auto_794948 ?auto_794949 ) ) ( not ( = ?auto_794948 ?auto_794950 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_794949 ?auto_794950 )
      ( MAKE-2CRATE-VERIFY ?auto_794948 ?auto_794949 ?auto_794950 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_794954 - SURFACE
      ?auto_794955 - SURFACE
    )
    :vars
    (
      ?auto_794956 - HOIST
      ?auto_794957 - PLACE
      ?auto_794958 - TRUCK
      ?auto_794959 - SURFACE
      ?auto_794960 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_794956 ?auto_794957 ) ( SURFACE-AT ?auto_794954 ?auto_794957 ) ( CLEAR ?auto_794954 ) ( IS-CRATE ?auto_794955 ) ( not ( = ?auto_794954 ?auto_794955 ) ) ( AVAILABLE ?auto_794956 ) ( IN ?auto_794955 ?auto_794958 ) ( ON ?auto_794954 ?auto_794959 ) ( not ( = ?auto_794959 ?auto_794954 ) ) ( not ( = ?auto_794959 ?auto_794955 ) ) ( TRUCK-AT ?auto_794958 ?auto_794960 ) ( not ( = ?auto_794960 ?auto_794957 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_794958 ?auto_794960 ?auto_794957 )
      ( MAKE-2CRATE ?auto_794959 ?auto_794954 ?auto_794955 )
      ( MAKE-1CRATE-VERIFY ?auto_794954 ?auto_794955 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_794961 - SURFACE
      ?auto_794962 - SURFACE
      ?auto_794963 - SURFACE
    )
    :vars
    (
      ?auto_794966 - HOIST
      ?auto_794964 - PLACE
      ?auto_794967 - TRUCK
      ?auto_794965 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_794966 ?auto_794964 ) ( SURFACE-AT ?auto_794962 ?auto_794964 ) ( CLEAR ?auto_794962 ) ( IS-CRATE ?auto_794963 ) ( not ( = ?auto_794962 ?auto_794963 ) ) ( AVAILABLE ?auto_794966 ) ( IN ?auto_794963 ?auto_794967 ) ( ON ?auto_794962 ?auto_794961 ) ( not ( = ?auto_794961 ?auto_794962 ) ) ( not ( = ?auto_794961 ?auto_794963 ) ) ( TRUCK-AT ?auto_794967 ?auto_794965 ) ( not ( = ?auto_794965 ?auto_794964 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_794962 ?auto_794963 )
      ( MAKE-2CRATE-VERIFY ?auto_794961 ?auto_794962 ?auto_794963 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_794968 - SURFACE
      ?auto_794969 - SURFACE
    )
    :vars
    (
      ?auto_794973 - HOIST
      ?auto_794974 - PLACE
      ?auto_794972 - SURFACE
      ?auto_794970 - TRUCK
      ?auto_794971 - PLACE
      ?auto_794975 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_794973 ?auto_794974 ) ( SURFACE-AT ?auto_794968 ?auto_794974 ) ( CLEAR ?auto_794968 ) ( IS-CRATE ?auto_794969 ) ( not ( = ?auto_794968 ?auto_794969 ) ) ( AVAILABLE ?auto_794973 ) ( ON ?auto_794968 ?auto_794972 ) ( not ( = ?auto_794972 ?auto_794968 ) ) ( not ( = ?auto_794972 ?auto_794969 ) ) ( TRUCK-AT ?auto_794970 ?auto_794971 ) ( not ( = ?auto_794971 ?auto_794974 ) ) ( HOIST-AT ?auto_794975 ?auto_794971 ) ( LIFTING ?auto_794975 ?auto_794969 ) ( not ( = ?auto_794973 ?auto_794975 ) ) )
    :subtasks
    ( ( !LOAD ?auto_794975 ?auto_794969 ?auto_794970 ?auto_794971 )
      ( MAKE-2CRATE ?auto_794972 ?auto_794968 ?auto_794969 )
      ( MAKE-1CRATE-VERIFY ?auto_794968 ?auto_794969 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_794976 - SURFACE
      ?auto_794977 - SURFACE
      ?auto_794978 - SURFACE
    )
    :vars
    (
      ?auto_794982 - HOIST
      ?auto_794979 - PLACE
      ?auto_794983 - TRUCK
      ?auto_794981 - PLACE
      ?auto_794980 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_794982 ?auto_794979 ) ( SURFACE-AT ?auto_794977 ?auto_794979 ) ( CLEAR ?auto_794977 ) ( IS-CRATE ?auto_794978 ) ( not ( = ?auto_794977 ?auto_794978 ) ) ( AVAILABLE ?auto_794982 ) ( ON ?auto_794977 ?auto_794976 ) ( not ( = ?auto_794976 ?auto_794977 ) ) ( not ( = ?auto_794976 ?auto_794978 ) ) ( TRUCK-AT ?auto_794983 ?auto_794981 ) ( not ( = ?auto_794981 ?auto_794979 ) ) ( HOIST-AT ?auto_794980 ?auto_794981 ) ( LIFTING ?auto_794980 ?auto_794978 ) ( not ( = ?auto_794982 ?auto_794980 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_794977 ?auto_794978 )
      ( MAKE-2CRATE-VERIFY ?auto_794976 ?auto_794977 ?auto_794978 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_794984 - SURFACE
      ?auto_794985 - SURFACE
    )
    :vars
    (
      ?auto_794989 - HOIST
      ?auto_794991 - PLACE
      ?auto_794986 - SURFACE
      ?auto_794990 - TRUCK
      ?auto_794987 - PLACE
      ?auto_794988 - HOIST
      ?auto_794992 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_794989 ?auto_794991 ) ( SURFACE-AT ?auto_794984 ?auto_794991 ) ( CLEAR ?auto_794984 ) ( IS-CRATE ?auto_794985 ) ( not ( = ?auto_794984 ?auto_794985 ) ) ( AVAILABLE ?auto_794989 ) ( ON ?auto_794984 ?auto_794986 ) ( not ( = ?auto_794986 ?auto_794984 ) ) ( not ( = ?auto_794986 ?auto_794985 ) ) ( TRUCK-AT ?auto_794990 ?auto_794987 ) ( not ( = ?auto_794987 ?auto_794991 ) ) ( HOIST-AT ?auto_794988 ?auto_794987 ) ( not ( = ?auto_794989 ?auto_794988 ) ) ( AVAILABLE ?auto_794988 ) ( SURFACE-AT ?auto_794985 ?auto_794987 ) ( ON ?auto_794985 ?auto_794992 ) ( CLEAR ?auto_794985 ) ( not ( = ?auto_794984 ?auto_794992 ) ) ( not ( = ?auto_794985 ?auto_794992 ) ) ( not ( = ?auto_794986 ?auto_794992 ) ) )
    :subtasks
    ( ( !LIFT ?auto_794988 ?auto_794985 ?auto_794992 ?auto_794987 )
      ( MAKE-2CRATE ?auto_794986 ?auto_794984 ?auto_794985 )
      ( MAKE-1CRATE-VERIFY ?auto_794984 ?auto_794985 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_794993 - SURFACE
      ?auto_794994 - SURFACE
      ?auto_794995 - SURFACE
    )
    :vars
    (
      ?auto_794997 - HOIST
      ?auto_794998 - PLACE
      ?auto_795001 - TRUCK
      ?auto_795000 - PLACE
      ?auto_794999 - HOIST
      ?auto_794996 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_794997 ?auto_794998 ) ( SURFACE-AT ?auto_794994 ?auto_794998 ) ( CLEAR ?auto_794994 ) ( IS-CRATE ?auto_794995 ) ( not ( = ?auto_794994 ?auto_794995 ) ) ( AVAILABLE ?auto_794997 ) ( ON ?auto_794994 ?auto_794993 ) ( not ( = ?auto_794993 ?auto_794994 ) ) ( not ( = ?auto_794993 ?auto_794995 ) ) ( TRUCK-AT ?auto_795001 ?auto_795000 ) ( not ( = ?auto_795000 ?auto_794998 ) ) ( HOIST-AT ?auto_794999 ?auto_795000 ) ( not ( = ?auto_794997 ?auto_794999 ) ) ( AVAILABLE ?auto_794999 ) ( SURFACE-AT ?auto_794995 ?auto_795000 ) ( ON ?auto_794995 ?auto_794996 ) ( CLEAR ?auto_794995 ) ( not ( = ?auto_794994 ?auto_794996 ) ) ( not ( = ?auto_794995 ?auto_794996 ) ) ( not ( = ?auto_794993 ?auto_794996 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_794994 ?auto_794995 )
      ( MAKE-2CRATE-VERIFY ?auto_794993 ?auto_794994 ?auto_794995 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_795002 - SURFACE
      ?auto_795003 - SURFACE
    )
    :vars
    (
      ?auto_795010 - HOIST
      ?auto_795004 - PLACE
      ?auto_795009 - SURFACE
      ?auto_795007 - PLACE
      ?auto_795006 - HOIST
      ?auto_795008 - SURFACE
      ?auto_795005 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_795010 ?auto_795004 ) ( SURFACE-AT ?auto_795002 ?auto_795004 ) ( CLEAR ?auto_795002 ) ( IS-CRATE ?auto_795003 ) ( not ( = ?auto_795002 ?auto_795003 ) ) ( AVAILABLE ?auto_795010 ) ( ON ?auto_795002 ?auto_795009 ) ( not ( = ?auto_795009 ?auto_795002 ) ) ( not ( = ?auto_795009 ?auto_795003 ) ) ( not ( = ?auto_795007 ?auto_795004 ) ) ( HOIST-AT ?auto_795006 ?auto_795007 ) ( not ( = ?auto_795010 ?auto_795006 ) ) ( AVAILABLE ?auto_795006 ) ( SURFACE-AT ?auto_795003 ?auto_795007 ) ( ON ?auto_795003 ?auto_795008 ) ( CLEAR ?auto_795003 ) ( not ( = ?auto_795002 ?auto_795008 ) ) ( not ( = ?auto_795003 ?auto_795008 ) ) ( not ( = ?auto_795009 ?auto_795008 ) ) ( TRUCK-AT ?auto_795005 ?auto_795004 ) )
    :subtasks
    ( ( !DRIVE ?auto_795005 ?auto_795004 ?auto_795007 )
      ( MAKE-2CRATE ?auto_795009 ?auto_795002 ?auto_795003 )
      ( MAKE-1CRATE-VERIFY ?auto_795002 ?auto_795003 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_795011 - SURFACE
      ?auto_795012 - SURFACE
      ?auto_795013 - SURFACE
    )
    :vars
    (
      ?auto_795014 - HOIST
      ?auto_795015 - PLACE
      ?auto_795016 - PLACE
      ?auto_795018 - HOIST
      ?auto_795019 - SURFACE
      ?auto_795017 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_795014 ?auto_795015 ) ( SURFACE-AT ?auto_795012 ?auto_795015 ) ( CLEAR ?auto_795012 ) ( IS-CRATE ?auto_795013 ) ( not ( = ?auto_795012 ?auto_795013 ) ) ( AVAILABLE ?auto_795014 ) ( ON ?auto_795012 ?auto_795011 ) ( not ( = ?auto_795011 ?auto_795012 ) ) ( not ( = ?auto_795011 ?auto_795013 ) ) ( not ( = ?auto_795016 ?auto_795015 ) ) ( HOIST-AT ?auto_795018 ?auto_795016 ) ( not ( = ?auto_795014 ?auto_795018 ) ) ( AVAILABLE ?auto_795018 ) ( SURFACE-AT ?auto_795013 ?auto_795016 ) ( ON ?auto_795013 ?auto_795019 ) ( CLEAR ?auto_795013 ) ( not ( = ?auto_795012 ?auto_795019 ) ) ( not ( = ?auto_795013 ?auto_795019 ) ) ( not ( = ?auto_795011 ?auto_795019 ) ) ( TRUCK-AT ?auto_795017 ?auto_795015 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_795012 ?auto_795013 )
      ( MAKE-2CRATE-VERIFY ?auto_795011 ?auto_795012 ?auto_795013 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_795020 - SURFACE
      ?auto_795021 - SURFACE
    )
    :vars
    (
      ?auto_795028 - HOIST
      ?auto_795026 - PLACE
      ?auto_795024 - SURFACE
      ?auto_795027 - PLACE
      ?auto_795025 - HOIST
      ?auto_795023 - SURFACE
      ?auto_795022 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_795028 ?auto_795026 ) ( IS-CRATE ?auto_795021 ) ( not ( = ?auto_795020 ?auto_795021 ) ) ( not ( = ?auto_795024 ?auto_795020 ) ) ( not ( = ?auto_795024 ?auto_795021 ) ) ( not ( = ?auto_795027 ?auto_795026 ) ) ( HOIST-AT ?auto_795025 ?auto_795027 ) ( not ( = ?auto_795028 ?auto_795025 ) ) ( AVAILABLE ?auto_795025 ) ( SURFACE-AT ?auto_795021 ?auto_795027 ) ( ON ?auto_795021 ?auto_795023 ) ( CLEAR ?auto_795021 ) ( not ( = ?auto_795020 ?auto_795023 ) ) ( not ( = ?auto_795021 ?auto_795023 ) ) ( not ( = ?auto_795024 ?auto_795023 ) ) ( TRUCK-AT ?auto_795022 ?auto_795026 ) ( SURFACE-AT ?auto_795024 ?auto_795026 ) ( CLEAR ?auto_795024 ) ( LIFTING ?auto_795028 ?auto_795020 ) ( IS-CRATE ?auto_795020 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_795024 ?auto_795020 )
      ( MAKE-2CRATE ?auto_795024 ?auto_795020 ?auto_795021 )
      ( MAKE-1CRATE-VERIFY ?auto_795020 ?auto_795021 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_795029 - SURFACE
      ?auto_795030 - SURFACE
      ?auto_795031 - SURFACE
    )
    :vars
    (
      ?auto_795035 - HOIST
      ?auto_795033 - PLACE
      ?auto_795034 - PLACE
      ?auto_795036 - HOIST
      ?auto_795037 - SURFACE
      ?auto_795032 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_795035 ?auto_795033 ) ( IS-CRATE ?auto_795031 ) ( not ( = ?auto_795030 ?auto_795031 ) ) ( not ( = ?auto_795029 ?auto_795030 ) ) ( not ( = ?auto_795029 ?auto_795031 ) ) ( not ( = ?auto_795034 ?auto_795033 ) ) ( HOIST-AT ?auto_795036 ?auto_795034 ) ( not ( = ?auto_795035 ?auto_795036 ) ) ( AVAILABLE ?auto_795036 ) ( SURFACE-AT ?auto_795031 ?auto_795034 ) ( ON ?auto_795031 ?auto_795037 ) ( CLEAR ?auto_795031 ) ( not ( = ?auto_795030 ?auto_795037 ) ) ( not ( = ?auto_795031 ?auto_795037 ) ) ( not ( = ?auto_795029 ?auto_795037 ) ) ( TRUCK-AT ?auto_795032 ?auto_795033 ) ( SURFACE-AT ?auto_795029 ?auto_795033 ) ( CLEAR ?auto_795029 ) ( LIFTING ?auto_795035 ?auto_795030 ) ( IS-CRATE ?auto_795030 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_795030 ?auto_795031 )
      ( MAKE-2CRATE-VERIFY ?auto_795029 ?auto_795030 ?auto_795031 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_795038 - SURFACE
      ?auto_795039 - SURFACE
    )
    :vars
    (
      ?auto_795043 - HOIST
      ?auto_795045 - PLACE
      ?auto_795040 - SURFACE
      ?auto_795044 - PLACE
      ?auto_795046 - HOIST
      ?auto_795041 - SURFACE
      ?auto_795042 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_795043 ?auto_795045 ) ( IS-CRATE ?auto_795039 ) ( not ( = ?auto_795038 ?auto_795039 ) ) ( not ( = ?auto_795040 ?auto_795038 ) ) ( not ( = ?auto_795040 ?auto_795039 ) ) ( not ( = ?auto_795044 ?auto_795045 ) ) ( HOIST-AT ?auto_795046 ?auto_795044 ) ( not ( = ?auto_795043 ?auto_795046 ) ) ( AVAILABLE ?auto_795046 ) ( SURFACE-AT ?auto_795039 ?auto_795044 ) ( ON ?auto_795039 ?auto_795041 ) ( CLEAR ?auto_795039 ) ( not ( = ?auto_795038 ?auto_795041 ) ) ( not ( = ?auto_795039 ?auto_795041 ) ) ( not ( = ?auto_795040 ?auto_795041 ) ) ( TRUCK-AT ?auto_795042 ?auto_795045 ) ( SURFACE-AT ?auto_795040 ?auto_795045 ) ( CLEAR ?auto_795040 ) ( IS-CRATE ?auto_795038 ) ( AVAILABLE ?auto_795043 ) ( IN ?auto_795038 ?auto_795042 ) )
    :subtasks
    ( ( !UNLOAD ?auto_795043 ?auto_795038 ?auto_795042 ?auto_795045 )
      ( MAKE-2CRATE ?auto_795040 ?auto_795038 ?auto_795039 )
      ( MAKE-1CRATE-VERIFY ?auto_795038 ?auto_795039 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_795047 - SURFACE
      ?auto_795048 - SURFACE
      ?auto_795049 - SURFACE
    )
    :vars
    (
      ?auto_795050 - HOIST
      ?auto_795053 - PLACE
      ?auto_795054 - PLACE
      ?auto_795055 - HOIST
      ?auto_795051 - SURFACE
      ?auto_795052 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_795050 ?auto_795053 ) ( IS-CRATE ?auto_795049 ) ( not ( = ?auto_795048 ?auto_795049 ) ) ( not ( = ?auto_795047 ?auto_795048 ) ) ( not ( = ?auto_795047 ?auto_795049 ) ) ( not ( = ?auto_795054 ?auto_795053 ) ) ( HOIST-AT ?auto_795055 ?auto_795054 ) ( not ( = ?auto_795050 ?auto_795055 ) ) ( AVAILABLE ?auto_795055 ) ( SURFACE-AT ?auto_795049 ?auto_795054 ) ( ON ?auto_795049 ?auto_795051 ) ( CLEAR ?auto_795049 ) ( not ( = ?auto_795048 ?auto_795051 ) ) ( not ( = ?auto_795049 ?auto_795051 ) ) ( not ( = ?auto_795047 ?auto_795051 ) ) ( TRUCK-AT ?auto_795052 ?auto_795053 ) ( SURFACE-AT ?auto_795047 ?auto_795053 ) ( CLEAR ?auto_795047 ) ( IS-CRATE ?auto_795048 ) ( AVAILABLE ?auto_795050 ) ( IN ?auto_795048 ?auto_795052 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_795048 ?auto_795049 )
      ( MAKE-2CRATE-VERIFY ?auto_795047 ?auto_795048 ?auto_795049 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_795092 - SURFACE
      ?auto_795093 - SURFACE
    )
    :vars
    (
      ?auto_795100 - HOIST
      ?auto_795094 - PLACE
      ?auto_795096 - SURFACE
      ?auto_795095 - PLACE
      ?auto_795097 - HOIST
      ?auto_795098 - SURFACE
      ?auto_795099 - TRUCK
      ?auto_795101 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_795100 ?auto_795094 ) ( SURFACE-AT ?auto_795092 ?auto_795094 ) ( CLEAR ?auto_795092 ) ( IS-CRATE ?auto_795093 ) ( not ( = ?auto_795092 ?auto_795093 ) ) ( AVAILABLE ?auto_795100 ) ( ON ?auto_795092 ?auto_795096 ) ( not ( = ?auto_795096 ?auto_795092 ) ) ( not ( = ?auto_795096 ?auto_795093 ) ) ( not ( = ?auto_795095 ?auto_795094 ) ) ( HOIST-AT ?auto_795097 ?auto_795095 ) ( not ( = ?auto_795100 ?auto_795097 ) ) ( AVAILABLE ?auto_795097 ) ( SURFACE-AT ?auto_795093 ?auto_795095 ) ( ON ?auto_795093 ?auto_795098 ) ( CLEAR ?auto_795093 ) ( not ( = ?auto_795092 ?auto_795098 ) ) ( not ( = ?auto_795093 ?auto_795098 ) ) ( not ( = ?auto_795096 ?auto_795098 ) ) ( TRUCK-AT ?auto_795099 ?auto_795101 ) ( not ( = ?auto_795101 ?auto_795094 ) ) ( not ( = ?auto_795095 ?auto_795101 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_795099 ?auto_795101 ?auto_795094 )
      ( MAKE-1CRATE ?auto_795092 ?auto_795093 )
      ( MAKE-1CRATE-VERIFY ?auto_795092 ?auto_795093 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_795132 - SURFACE
      ?auto_795133 - SURFACE
      ?auto_795134 - SURFACE
      ?auto_795131 - SURFACE
    )
    :vars
    (
      ?auto_795135 - HOIST
      ?auto_795136 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_795135 ?auto_795136 ) ( SURFACE-AT ?auto_795134 ?auto_795136 ) ( CLEAR ?auto_795134 ) ( LIFTING ?auto_795135 ?auto_795131 ) ( IS-CRATE ?auto_795131 ) ( not ( = ?auto_795134 ?auto_795131 ) ) ( ON ?auto_795133 ?auto_795132 ) ( ON ?auto_795134 ?auto_795133 ) ( not ( = ?auto_795132 ?auto_795133 ) ) ( not ( = ?auto_795132 ?auto_795134 ) ) ( not ( = ?auto_795132 ?auto_795131 ) ) ( not ( = ?auto_795133 ?auto_795134 ) ) ( not ( = ?auto_795133 ?auto_795131 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_795134 ?auto_795131 )
      ( MAKE-3CRATE-VERIFY ?auto_795132 ?auto_795133 ?auto_795134 ?auto_795131 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_795149 - SURFACE
      ?auto_795150 - SURFACE
      ?auto_795151 - SURFACE
      ?auto_795148 - SURFACE
    )
    :vars
    (
      ?auto_795154 - HOIST
      ?auto_795153 - PLACE
      ?auto_795152 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_795154 ?auto_795153 ) ( SURFACE-AT ?auto_795151 ?auto_795153 ) ( CLEAR ?auto_795151 ) ( IS-CRATE ?auto_795148 ) ( not ( = ?auto_795151 ?auto_795148 ) ) ( TRUCK-AT ?auto_795152 ?auto_795153 ) ( AVAILABLE ?auto_795154 ) ( IN ?auto_795148 ?auto_795152 ) ( ON ?auto_795151 ?auto_795150 ) ( not ( = ?auto_795150 ?auto_795151 ) ) ( not ( = ?auto_795150 ?auto_795148 ) ) ( ON ?auto_795150 ?auto_795149 ) ( not ( = ?auto_795149 ?auto_795150 ) ) ( not ( = ?auto_795149 ?auto_795151 ) ) ( not ( = ?auto_795149 ?auto_795148 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_795150 ?auto_795151 ?auto_795148 )
      ( MAKE-3CRATE-VERIFY ?auto_795149 ?auto_795150 ?auto_795151 ?auto_795148 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_795170 - SURFACE
      ?auto_795171 - SURFACE
      ?auto_795172 - SURFACE
      ?auto_795169 - SURFACE
    )
    :vars
    (
      ?auto_795174 - HOIST
      ?auto_795176 - PLACE
      ?auto_795173 - TRUCK
      ?auto_795175 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_795174 ?auto_795176 ) ( SURFACE-AT ?auto_795172 ?auto_795176 ) ( CLEAR ?auto_795172 ) ( IS-CRATE ?auto_795169 ) ( not ( = ?auto_795172 ?auto_795169 ) ) ( AVAILABLE ?auto_795174 ) ( IN ?auto_795169 ?auto_795173 ) ( ON ?auto_795172 ?auto_795171 ) ( not ( = ?auto_795171 ?auto_795172 ) ) ( not ( = ?auto_795171 ?auto_795169 ) ) ( TRUCK-AT ?auto_795173 ?auto_795175 ) ( not ( = ?auto_795175 ?auto_795176 ) ) ( ON ?auto_795171 ?auto_795170 ) ( not ( = ?auto_795170 ?auto_795171 ) ) ( not ( = ?auto_795170 ?auto_795172 ) ) ( not ( = ?auto_795170 ?auto_795169 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_795171 ?auto_795172 ?auto_795169 )
      ( MAKE-3CRATE-VERIFY ?auto_795170 ?auto_795171 ?auto_795172 ?auto_795169 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_795194 - SURFACE
      ?auto_795195 - SURFACE
      ?auto_795196 - SURFACE
      ?auto_795193 - SURFACE
    )
    :vars
    (
      ?auto_795201 - HOIST
      ?auto_795200 - PLACE
      ?auto_795198 - TRUCK
      ?auto_795199 - PLACE
      ?auto_795197 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_795201 ?auto_795200 ) ( SURFACE-AT ?auto_795196 ?auto_795200 ) ( CLEAR ?auto_795196 ) ( IS-CRATE ?auto_795193 ) ( not ( = ?auto_795196 ?auto_795193 ) ) ( AVAILABLE ?auto_795201 ) ( ON ?auto_795196 ?auto_795195 ) ( not ( = ?auto_795195 ?auto_795196 ) ) ( not ( = ?auto_795195 ?auto_795193 ) ) ( TRUCK-AT ?auto_795198 ?auto_795199 ) ( not ( = ?auto_795199 ?auto_795200 ) ) ( HOIST-AT ?auto_795197 ?auto_795199 ) ( LIFTING ?auto_795197 ?auto_795193 ) ( not ( = ?auto_795201 ?auto_795197 ) ) ( ON ?auto_795195 ?auto_795194 ) ( not ( = ?auto_795194 ?auto_795195 ) ) ( not ( = ?auto_795194 ?auto_795196 ) ) ( not ( = ?auto_795194 ?auto_795193 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_795195 ?auto_795196 ?auto_795193 )
      ( MAKE-3CRATE-VERIFY ?auto_795194 ?auto_795195 ?auto_795196 ?auto_795193 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_795221 - SURFACE
      ?auto_795222 - SURFACE
      ?auto_795223 - SURFACE
      ?auto_795220 - SURFACE
    )
    :vars
    (
      ?auto_795225 - HOIST
      ?auto_795226 - PLACE
      ?auto_795228 - TRUCK
      ?auto_795227 - PLACE
      ?auto_795224 - HOIST
      ?auto_795229 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_795225 ?auto_795226 ) ( SURFACE-AT ?auto_795223 ?auto_795226 ) ( CLEAR ?auto_795223 ) ( IS-CRATE ?auto_795220 ) ( not ( = ?auto_795223 ?auto_795220 ) ) ( AVAILABLE ?auto_795225 ) ( ON ?auto_795223 ?auto_795222 ) ( not ( = ?auto_795222 ?auto_795223 ) ) ( not ( = ?auto_795222 ?auto_795220 ) ) ( TRUCK-AT ?auto_795228 ?auto_795227 ) ( not ( = ?auto_795227 ?auto_795226 ) ) ( HOIST-AT ?auto_795224 ?auto_795227 ) ( not ( = ?auto_795225 ?auto_795224 ) ) ( AVAILABLE ?auto_795224 ) ( SURFACE-AT ?auto_795220 ?auto_795227 ) ( ON ?auto_795220 ?auto_795229 ) ( CLEAR ?auto_795220 ) ( not ( = ?auto_795223 ?auto_795229 ) ) ( not ( = ?auto_795220 ?auto_795229 ) ) ( not ( = ?auto_795222 ?auto_795229 ) ) ( ON ?auto_795222 ?auto_795221 ) ( not ( = ?auto_795221 ?auto_795222 ) ) ( not ( = ?auto_795221 ?auto_795223 ) ) ( not ( = ?auto_795221 ?auto_795220 ) ) ( not ( = ?auto_795221 ?auto_795229 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_795222 ?auto_795223 ?auto_795220 )
      ( MAKE-3CRATE-VERIFY ?auto_795221 ?auto_795222 ?auto_795223 ?auto_795220 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_795249 - SURFACE
      ?auto_795250 - SURFACE
      ?auto_795251 - SURFACE
      ?auto_795248 - SURFACE
    )
    :vars
    (
      ?auto_795253 - HOIST
      ?auto_795252 - PLACE
      ?auto_795256 - PLACE
      ?auto_795257 - HOIST
      ?auto_795254 - SURFACE
      ?auto_795255 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_795253 ?auto_795252 ) ( SURFACE-AT ?auto_795251 ?auto_795252 ) ( CLEAR ?auto_795251 ) ( IS-CRATE ?auto_795248 ) ( not ( = ?auto_795251 ?auto_795248 ) ) ( AVAILABLE ?auto_795253 ) ( ON ?auto_795251 ?auto_795250 ) ( not ( = ?auto_795250 ?auto_795251 ) ) ( not ( = ?auto_795250 ?auto_795248 ) ) ( not ( = ?auto_795256 ?auto_795252 ) ) ( HOIST-AT ?auto_795257 ?auto_795256 ) ( not ( = ?auto_795253 ?auto_795257 ) ) ( AVAILABLE ?auto_795257 ) ( SURFACE-AT ?auto_795248 ?auto_795256 ) ( ON ?auto_795248 ?auto_795254 ) ( CLEAR ?auto_795248 ) ( not ( = ?auto_795251 ?auto_795254 ) ) ( not ( = ?auto_795248 ?auto_795254 ) ) ( not ( = ?auto_795250 ?auto_795254 ) ) ( TRUCK-AT ?auto_795255 ?auto_795252 ) ( ON ?auto_795250 ?auto_795249 ) ( not ( = ?auto_795249 ?auto_795250 ) ) ( not ( = ?auto_795249 ?auto_795251 ) ) ( not ( = ?auto_795249 ?auto_795248 ) ) ( not ( = ?auto_795249 ?auto_795254 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_795250 ?auto_795251 ?auto_795248 )
      ( MAKE-3CRATE-VERIFY ?auto_795249 ?auto_795250 ?auto_795251 ?auto_795248 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_795277 - SURFACE
      ?auto_795278 - SURFACE
      ?auto_795279 - SURFACE
      ?auto_795276 - SURFACE
    )
    :vars
    (
      ?auto_795281 - HOIST
      ?auto_795280 - PLACE
      ?auto_795283 - PLACE
      ?auto_795285 - HOIST
      ?auto_795282 - SURFACE
      ?auto_795284 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_795281 ?auto_795280 ) ( IS-CRATE ?auto_795276 ) ( not ( = ?auto_795279 ?auto_795276 ) ) ( not ( = ?auto_795278 ?auto_795279 ) ) ( not ( = ?auto_795278 ?auto_795276 ) ) ( not ( = ?auto_795283 ?auto_795280 ) ) ( HOIST-AT ?auto_795285 ?auto_795283 ) ( not ( = ?auto_795281 ?auto_795285 ) ) ( AVAILABLE ?auto_795285 ) ( SURFACE-AT ?auto_795276 ?auto_795283 ) ( ON ?auto_795276 ?auto_795282 ) ( CLEAR ?auto_795276 ) ( not ( = ?auto_795279 ?auto_795282 ) ) ( not ( = ?auto_795276 ?auto_795282 ) ) ( not ( = ?auto_795278 ?auto_795282 ) ) ( TRUCK-AT ?auto_795284 ?auto_795280 ) ( SURFACE-AT ?auto_795278 ?auto_795280 ) ( CLEAR ?auto_795278 ) ( LIFTING ?auto_795281 ?auto_795279 ) ( IS-CRATE ?auto_795279 ) ( ON ?auto_795278 ?auto_795277 ) ( not ( = ?auto_795277 ?auto_795278 ) ) ( not ( = ?auto_795277 ?auto_795279 ) ) ( not ( = ?auto_795277 ?auto_795276 ) ) ( not ( = ?auto_795277 ?auto_795282 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_795278 ?auto_795279 ?auto_795276 )
      ( MAKE-3CRATE-VERIFY ?auto_795277 ?auto_795278 ?auto_795279 ?auto_795276 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_795305 - SURFACE
      ?auto_795306 - SURFACE
      ?auto_795307 - SURFACE
      ?auto_795304 - SURFACE
    )
    :vars
    (
      ?auto_795312 - HOIST
      ?auto_795313 - PLACE
      ?auto_795310 - PLACE
      ?auto_795308 - HOIST
      ?auto_795309 - SURFACE
      ?auto_795311 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_795312 ?auto_795313 ) ( IS-CRATE ?auto_795304 ) ( not ( = ?auto_795307 ?auto_795304 ) ) ( not ( = ?auto_795306 ?auto_795307 ) ) ( not ( = ?auto_795306 ?auto_795304 ) ) ( not ( = ?auto_795310 ?auto_795313 ) ) ( HOIST-AT ?auto_795308 ?auto_795310 ) ( not ( = ?auto_795312 ?auto_795308 ) ) ( AVAILABLE ?auto_795308 ) ( SURFACE-AT ?auto_795304 ?auto_795310 ) ( ON ?auto_795304 ?auto_795309 ) ( CLEAR ?auto_795304 ) ( not ( = ?auto_795307 ?auto_795309 ) ) ( not ( = ?auto_795304 ?auto_795309 ) ) ( not ( = ?auto_795306 ?auto_795309 ) ) ( TRUCK-AT ?auto_795311 ?auto_795313 ) ( SURFACE-AT ?auto_795306 ?auto_795313 ) ( CLEAR ?auto_795306 ) ( IS-CRATE ?auto_795307 ) ( AVAILABLE ?auto_795312 ) ( IN ?auto_795307 ?auto_795311 ) ( ON ?auto_795306 ?auto_795305 ) ( not ( = ?auto_795305 ?auto_795306 ) ) ( not ( = ?auto_795305 ?auto_795307 ) ) ( not ( = ?auto_795305 ?auto_795304 ) ) ( not ( = ?auto_795305 ?auto_795309 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_795306 ?auto_795307 ?auto_795304 )
      ( MAKE-3CRATE-VERIFY ?auto_795305 ?auto_795306 ?auto_795307 ?auto_795304 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_795596 - SURFACE
      ?auto_795597 - SURFACE
      ?auto_795598 - SURFACE
      ?auto_795595 - SURFACE
      ?auto_795599 - SURFACE
    )
    :vars
    (
      ?auto_795600 - HOIST
      ?auto_795601 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_795600 ?auto_795601 ) ( SURFACE-AT ?auto_795595 ?auto_795601 ) ( CLEAR ?auto_795595 ) ( LIFTING ?auto_795600 ?auto_795599 ) ( IS-CRATE ?auto_795599 ) ( not ( = ?auto_795595 ?auto_795599 ) ) ( ON ?auto_795597 ?auto_795596 ) ( ON ?auto_795598 ?auto_795597 ) ( ON ?auto_795595 ?auto_795598 ) ( not ( = ?auto_795596 ?auto_795597 ) ) ( not ( = ?auto_795596 ?auto_795598 ) ) ( not ( = ?auto_795596 ?auto_795595 ) ) ( not ( = ?auto_795596 ?auto_795599 ) ) ( not ( = ?auto_795597 ?auto_795598 ) ) ( not ( = ?auto_795597 ?auto_795595 ) ) ( not ( = ?auto_795597 ?auto_795599 ) ) ( not ( = ?auto_795598 ?auto_795595 ) ) ( not ( = ?auto_795598 ?auto_795599 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_795595 ?auto_795599 )
      ( MAKE-4CRATE-VERIFY ?auto_795596 ?auto_795597 ?auto_795598 ?auto_795595 ?auto_795599 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_795621 - SURFACE
      ?auto_795622 - SURFACE
      ?auto_795623 - SURFACE
      ?auto_795620 - SURFACE
      ?auto_795624 - SURFACE
    )
    :vars
    (
      ?auto_795626 - HOIST
      ?auto_795625 - PLACE
      ?auto_795627 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_795626 ?auto_795625 ) ( SURFACE-AT ?auto_795620 ?auto_795625 ) ( CLEAR ?auto_795620 ) ( IS-CRATE ?auto_795624 ) ( not ( = ?auto_795620 ?auto_795624 ) ) ( TRUCK-AT ?auto_795627 ?auto_795625 ) ( AVAILABLE ?auto_795626 ) ( IN ?auto_795624 ?auto_795627 ) ( ON ?auto_795620 ?auto_795623 ) ( not ( = ?auto_795623 ?auto_795620 ) ) ( not ( = ?auto_795623 ?auto_795624 ) ) ( ON ?auto_795622 ?auto_795621 ) ( ON ?auto_795623 ?auto_795622 ) ( not ( = ?auto_795621 ?auto_795622 ) ) ( not ( = ?auto_795621 ?auto_795623 ) ) ( not ( = ?auto_795621 ?auto_795620 ) ) ( not ( = ?auto_795621 ?auto_795624 ) ) ( not ( = ?auto_795622 ?auto_795623 ) ) ( not ( = ?auto_795622 ?auto_795620 ) ) ( not ( = ?auto_795622 ?auto_795624 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_795623 ?auto_795620 ?auto_795624 )
      ( MAKE-4CRATE-VERIFY ?auto_795621 ?auto_795622 ?auto_795623 ?auto_795620 ?auto_795624 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_795651 - SURFACE
      ?auto_795652 - SURFACE
      ?auto_795653 - SURFACE
      ?auto_795650 - SURFACE
      ?auto_795654 - SURFACE
    )
    :vars
    (
      ?auto_795657 - HOIST
      ?auto_795658 - PLACE
      ?auto_795656 - TRUCK
      ?auto_795655 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_795657 ?auto_795658 ) ( SURFACE-AT ?auto_795650 ?auto_795658 ) ( CLEAR ?auto_795650 ) ( IS-CRATE ?auto_795654 ) ( not ( = ?auto_795650 ?auto_795654 ) ) ( AVAILABLE ?auto_795657 ) ( IN ?auto_795654 ?auto_795656 ) ( ON ?auto_795650 ?auto_795653 ) ( not ( = ?auto_795653 ?auto_795650 ) ) ( not ( = ?auto_795653 ?auto_795654 ) ) ( TRUCK-AT ?auto_795656 ?auto_795655 ) ( not ( = ?auto_795655 ?auto_795658 ) ) ( ON ?auto_795652 ?auto_795651 ) ( ON ?auto_795653 ?auto_795652 ) ( not ( = ?auto_795651 ?auto_795652 ) ) ( not ( = ?auto_795651 ?auto_795653 ) ) ( not ( = ?auto_795651 ?auto_795650 ) ) ( not ( = ?auto_795651 ?auto_795654 ) ) ( not ( = ?auto_795652 ?auto_795653 ) ) ( not ( = ?auto_795652 ?auto_795650 ) ) ( not ( = ?auto_795652 ?auto_795654 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_795653 ?auto_795650 ?auto_795654 )
      ( MAKE-4CRATE-VERIFY ?auto_795651 ?auto_795652 ?auto_795653 ?auto_795650 ?auto_795654 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_795685 - SURFACE
      ?auto_795686 - SURFACE
      ?auto_795687 - SURFACE
      ?auto_795684 - SURFACE
      ?auto_795688 - SURFACE
    )
    :vars
    (
      ?auto_795693 - HOIST
      ?auto_795692 - PLACE
      ?auto_795690 - TRUCK
      ?auto_795689 - PLACE
      ?auto_795691 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_795693 ?auto_795692 ) ( SURFACE-AT ?auto_795684 ?auto_795692 ) ( CLEAR ?auto_795684 ) ( IS-CRATE ?auto_795688 ) ( not ( = ?auto_795684 ?auto_795688 ) ) ( AVAILABLE ?auto_795693 ) ( ON ?auto_795684 ?auto_795687 ) ( not ( = ?auto_795687 ?auto_795684 ) ) ( not ( = ?auto_795687 ?auto_795688 ) ) ( TRUCK-AT ?auto_795690 ?auto_795689 ) ( not ( = ?auto_795689 ?auto_795692 ) ) ( HOIST-AT ?auto_795691 ?auto_795689 ) ( LIFTING ?auto_795691 ?auto_795688 ) ( not ( = ?auto_795693 ?auto_795691 ) ) ( ON ?auto_795686 ?auto_795685 ) ( ON ?auto_795687 ?auto_795686 ) ( not ( = ?auto_795685 ?auto_795686 ) ) ( not ( = ?auto_795685 ?auto_795687 ) ) ( not ( = ?auto_795685 ?auto_795684 ) ) ( not ( = ?auto_795685 ?auto_795688 ) ) ( not ( = ?auto_795686 ?auto_795687 ) ) ( not ( = ?auto_795686 ?auto_795684 ) ) ( not ( = ?auto_795686 ?auto_795688 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_795687 ?auto_795684 ?auto_795688 )
      ( MAKE-4CRATE-VERIFY ?auto_795685 ?auto_795686 ?auto_795687 ?auto_795684 ?auto_795688 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_795723 - SURFACE
      ?auto_795724 - SURFACE
      ?auto_795725 - SURFACE
      ?auto_795722 - SURFACE
      ?auto_795726 - SURFACE
    )
    :vars
    (
      ?auto_795730 - HOIST
      ?auto_795727 - PLACE
      ?auto_795732 - TRUCK
      ?auto_795731 - PLACE
      ?auto_795728 - HOIST
      ?auto_795729 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_795730 ?auto_795727 ) ( SURFACE-AT ?auto_795722 ?auto_795727 ) ( CLEAR ?auto_795722 ) ( IS-CRATE ?auto_795726 ) ( not ( = ?auto_795722 ?auto_795726 ) ) ( AVAILABLE ?auto_795730 ) ( ON ?auto_795722 ?auto_795725 ) ( not ( = ?auto_795725 ?auto_795722 ) ) ( not ( = ?auto_795725 ?auto_795726 ) ) ( TRUCK-AT ?auto_795732 ?auto_795731 ) ( not ( = ?auto_795731 ?auto_795727 ) ) ( HOIST-AT ?auto_795728 ?auto_795731 ) ( not ( = ?auto_795730 ?auto_795728 ) ) ( AVAILABLE ?auto_795728 ) ( SURFACE-AT ?auto_795726 ?auto_795731 ) ( ON ?auto_795726 ?auto_795729 ) ( CLEAR ?auto_795726 ) ( not ( = ?auto_795722 ?auto_795729 ) ) ( not ( = ?auto_795726 ?auto_795729 ) ) ( not ( = ?auto_795725 ?auto_795729 ) ) ( ON ?auto_795724 ?auto_795723 ) ( ON ?auto_795725 ?auto_795724 ) ( not ( = ?auto_795723 ?auto_795724 ) ) ( not ( = ?auto_795723 ?auto_795725 ) ) ( not ( = ?auto_795723 ?auto_795722 ) ) ( not ( = ?auto_795723 ?auto_795726 ) ) ( not ( = ?auto_795723 ?auto_795729 ) ) ( not ( = ?auto_795724 ?auto_795725 ) ) ( not ( = ?auto_795724 ?auto_795722 ) ) ( not ( = ?auto_795724 ?auto_795726 ) ) ( not ( = ?auto_795724 ?auto_795729 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_795725 ?auto_795722 ?auto_795726 )
      ( MAKE-4CRATE-VERIFY ?auto_795723 ?auto_795724 ?auto_795725 ?auto_795722 ?auto_795726 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_795762 - SURFACE
      ?auto_795763 - SURFACE
      ?auto_795764 - SURFACE
      ?auto_795761 - SURFACE
      ?auto_795765 - SURFACE
    )
    :vars
    (
      ?auto_795770 - HOIST
      ?auto_795768 - PLACE
      ?auto_795769 - PLACE
      ?auto_795771 - HOIST
      ?auto_795767 - SURFACE
      ?auto_795766 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_795770 ?auto_795768 ) ( SURFACE-AT ?auto_795761 ?auto_795768 ) ( CLEAR ?auto_795761 ) ( IS-CRATE ?auto_795765 ) ( not ( = ?auto_795761 ?auto_795765 ) ) ( AVAILABLE ?auto_795770 ) ( ON ?auto_795761 ?auto_795764 ) ( not ( = ?auto_795764 ?auto_795761 ) ) ( not ( = ?auto_795764 ?auto_795765 ) ) ( not ( = ?auto_795769 ?auto_795768 ) ) ( HOIST-AT ?auto_795771 ?auto_795769 ) ( not ( = ?auto_795770 ?auto_795771 ) ) ( AVAILABLE ?auto_795771 ) ( SURFACE-AT ?auto_795765 ?auto_795769 ) ( ON ?auto_795765 ?auto_795767 ) ( CLEAR ?auto_795765 ) ( not ( = ?auto_795761 ?auto_795767 ) ) ( not ( = ?auto_795765 ?auto_795767 ) ) ( not ( = ?auto_795764 ?auto_795767 ) ) ( TRUCK-AT ?auto_795766 ?auto_795768 ) ( ON ?auto_795763 ?auto_795762 ) ( ON ?auto_795764 ?auto_795763 ) ( not ( = ?auto_795762 ?auto_795763 ) ) ( not ( = ?auto_795762 ?auto_795764 ) ) ( not ( = ?auto_795762 ?auto_795761 ) ) ( not ( = ?auto_795762 ?auto_795765 ) ) ( not ( = ?auto_795762 ?auto_795767 ) ) ( not ( = ?auto_795763 ?auto_795764 ) ) ( not ( = ?auto_795763 ?auto_795761 ) ) ( not ( = ?auto_795763 ?auto_795765 ) ) ( not ( = ?auto_795763 ?auto_795767 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_795764 ?auto_795761 ?auto_795765 )
      ( MAKE-4CRATE-VERIFY ?auto_795762 ?auto_795763 ?auto_795764 ?auto_795761 ?auto_795765 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_795801 - SURFACE
      ?auto_795802 - SURFACE
      ?auto_795803 - SURFACE
      ?auto_795800 - SURFACE
      ?auto_795804 - SURFACE
    )
    :vars
    (
      ?auto_795808 - HOIST
      ?auto_795809 - PLACE
      ?auto_795805 - PLACE
      ?auto_795807 - HOIST
      ?auto_795806 - SURFACE
      ?auto_795810 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_795808 ?auto_795809 ) ( IS-CRATE ?auto_795804 ) ( not ( = ?auto_795800 ?auto_795804 ) ) ( not ( = ?auto_795803 ?auto_795800 ) ) ( not ( = ?auto_795803 ?auto_795804 ) ) ( not ( = ?auto_795805 ?auto_795809 ) ) ( HOIST-AT ?auto_795807 ?auto_795805 ) ( not ( = ?auto_795808 ?auto_795807 ) ) ( AVAILABLE ?auto_795807 ) ( SURFACE-AT ?auto_795804 ?auto_795805 ) ( ON ?auto_795804 ?auto_795806 ) ( CLEAR ?auto_795804 ) ( not ( = ?auto_795800 ?auto_795806 ) ) ( not ( = ?auto_795804 ?auto_795806 ) ) ( not ( = ?auto_795803 ?auto_795806 ) ) ( TRUCK-AT ?auto_795810 ?auto_795809 ) ( SURFACE-AT ?auto_795803 ?auto_795809 ) ( CLEAR ?auto_795803 ) ( LIFTING ?auto_795808 ?auto_795800 ) ( IS-CRATE ?auto_795800 ) ( ON ?auto_795802 ?auto_795801 ) ( ON ?auto_795803 ?auto_795802 ) ( not ( = ?auto_795801 ?auto_795802 ) ) ( not ( = ?auto_795801 ?auto_795803 ) ) ( not ( = ?auto_795801 ?auto_795800 ) ) ( not ( = ?auto_795801 ?auto_795804 ) ) ( not ( = ?auto_795801 ?auto_795806 ) ) ( not ( = ?auto_795802 ?auto_795803 ) ) ( not ( = ?auto_795802 ?auto_795800 ) ) ( not ( = ?auto_795802 ?auto_795804 ) ) ( not ( = ?auto_795802 ?auto_795806 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_795803 ?auto_795800 ?auto_795804 )
      ( MAKE-4CRATE-VERIFY ?auto_795801 ?auto_795802 ?auto_795803 ?auto_795800 ?auto_795804 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_795840 - SURFACE
      ?auto_795841 - SURFACE
      ?auto_795842 - SURFACE
      ?auto_795839 - SURFACE
      ?auto_795843 - SURFACE
    )
    :vars
    (
      ?auto_795848 - HOIST
      ?auto_795845 - PLACE
      ?auto_795849 - PLACE
      ?auto_795847 - HOIST
      ?auto_795844 - SURFACE
      ?auto_795846 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_795848 ?auto_795845 ) ( IS-CRATE ?auto_795843 ) ( not ( = ?auto_795839 ?auto_795843 ) ) ( not ( = ?auto_795842 ?auto_795839 ) ) ( not ( = ?auto_795842 ?auto_795843 ) ) ( not ( = ?auto_795849 ?auto_795845 ) ) ( HOIST-AT ?auto_795847 ?auto_795849 ) ( not ( = ?auto_795848 ?auto_795847 ) ) ( AVAILABLE ?auto_795847 ) ( SURFACE-AT ?auto_795843 ?auto_795849 ) ( ON ?auto_795843 ?auto_795844 ) ( CLEAR ?auto_795843 ) ( not ( = ?auto_795839 ?auto_795844 ) ) ( not ( = ?auto_795843 ?auto_795844 ) ) ( not ( = ?auto_795842 ?auto_795844 ) ) ( TRUCK-AT ?auto_795846 ?auto_795845 ) ( SURFACE-AT ?auto_795842 ?auto_795845 ) ( CLEAR ?auto_795842 ) ( IS-CRATE ?auto_795839 ) ( AVAILABLE ?auto_795848 ) ( IN ?auto_795839 ?auto_795846 ) ( ON ?auto_795841 ?auto_795840 ) ( ON ?auto_795842 ?auto_795841 ) ( not ( = ?auto_795840 ?auto_795841 ) ) ( not ( = ?auto_795840 ?auto_795842 ) ) ( not ( = ?auto_795840 ?auto_795839 ) ) ( not ( = ?auto_795840 ?auto_795843 ) ) ( not ( = ?auto_795840 ?auto_795844 ) ) ( not ( = ?auto_795841 ?auto_795842 ) ) ( not ( = ?auto_795841 ?auto_795839 ) ) ( not ( = ?auto_795841 ?auto_795843 ) ) ( not ( = ?auto_795841 ?auto_795844 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_795842 ?auto_795839 ?auto_795843 )
      ( MAKE-4CRATE-VERIFY ?auto_795840 ?auto_795841 ?auto_795842 ?auto_795839 ?auto_795843 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_796340 - SURFACE
      ?auto_796341 - SURFACE
    )
    :vars
    (
      ?auto_796342 - HOIST
      ?auto_796345 - PLACE
      ?auto_796343 - SURFACE
      ?auto_796344 - TRUCK
      ?auto_796347 - PLACE
      ?auto_796346 - HOIST
      ?auto_796348 - SURFACE
      ?auto_796349 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_796342 ?auto_796345 ) ( SURFACE-AT ?auto_796340 ?auto_796345 ) ( CLEAR ?auto_796340 ) ( IS-CRATE ?auto_796341 ) ( not ( = ?auto_796340 ?auto_796341 ) ) ( AVAILABLE ?auto_796342 ) ( ON ?auto_796340 ?auto_796343 ) ( not ( = ?auto_796343 ?auto_796340 ) ) ( not ( = ?auto_796343 ?auto_796341 ) ) ( TRUCK-AT ?auto_796344 ?auto_796347 ) ( not ( = ?auto_796347 ?auto_796345 ) ) ( HOIST-AT ?auto_796346 ?auto_796347 ) ( not ( = ?auto_796342 ?auto_796346 ) ) ( SURFACE-AT ?auto_796341 ?auto_796347 ) ( ON ?auto_796341 ?auto_796348 ) ( CLEAR ?auto_796341 ) ( not ( = ?auto_796340 ?auto_796348 ) ) ( not ( = ?auto_796341 ?auto_796348 ) ) ( not ( = ?auto_796343 ?auto_796348 ) ) ( LIFTING ?auto_796346 ?auto_796349 ) ( IS-CRATE ?auto_796349 ) ( not ( = ?auto_796340 ?auto_796349 ) ) ( not ( = ?auto_796341 ?auto_796349 ) ) ( not ( = ?auto_796343 ?auto_796349 ) ) ( not ( = ?auto_796348 ?auto_796349 ) ) )
    :subtasks
    ( ( !LOAD ?auto_796346 ?auto_796349 ?auto_796344 ?auto_796347 )
      ( MAKE-1CRATE ?auto_796340 ?auto_796341 )
      ( MAKE-1CRATE-VERIFY ?auto_796340 ?auto_796341 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_796500 - SURFACE
      ?auto_796501 - SURFACE
      ?auto_796502 - SURFACE
      ?auto_796499 - SURFACE
      ?auto_796503 - SURFACE
      ?auto_796504 - SURFACE
    )
    :vars
    (
      ?auto_796506 - HOIST
      ?auto_796505 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_796506 ?auto_796505 ) ( SURFACE-AT ?auto_796503 ?auto_796505 ) ( CLEAR ?auto_796503 ) ( LIFTING ?auto_796506 ?auto_796504 ) ( IS-CRATE ?auto_796504 ) ( not ( = ?auto_796503 ?auto_796504 ) ) ( ON ?auto_796501 ?auto_796500 ) ( ON ?auto_796502 ?auto_796501 ) ( ON ?auto_796499 ?auto_796502 ) ( ON ?auto_796503 ?auto_796499 ) ( not ( = ?auto_796500 ?auto_796501 ) ) ( not ( = ?auto_796500 ?auto_796502 ) ) ( not ( = ?auto_796500 ?auto_796499 ) ) ( not ( = ?auto_796500 ?auto_796503 ) ) ( not ( = ?auto_796500 ?auto_796504 ) ) ( not ( = ?auto_796501 ?auto_796502 ) ) ( not ( = ?auto_796501 ?auto_796499 ) ) ( not ( = ?auto_796501 ?auto_796503 ) ) ( not ( = ?auto_796501 ?auto_796504 ) ) ( not ( = ?auto_796502 ?auto_796499 ) ) ( not ( = ?auto_796502 ?auto_796503 ) ) ( not ( = ?auto_796502 ?auto_796504 ) ) ( not ( = ?auto_796499 ?auto_796503 ) ) ( not ( = ?auto_796499 ?auto_796504 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_796503 ?auto_796504 )
      ( MAKE-5CRATE-VERIFY ?auto_796500 ?auto_796501 ?auto_796502 ?auto_796499 ?auto_796503 ?auto_796504 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_796534 - SURFACE
      ?auto_796535 - SURFACE
      ?auto_796536 - SURFACE
      ?auto_796533 - SURFACE
      ?auto_796537 - SURFACE
      ?auto_796538 - SURFACE
    )
    :vars
    (
      ?auto_796541 - HOIST
      ?auto_796540 - PLACE
      ?auto_796539 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_796541 ?auto_796540 ) ( SURFACE-AT ?auto_796537 ?auto_796540 ) ( CLEAR ?auto_796537 ) ( IS-CRATE ?auto_796538 ) ( not ( = ?auto_796537 ?auto_796538 ) ) ( TRUCK-AT ?auto_796539 ?auto_796540 ) ( AVAILABLE ?auto_796541 ) ( IN ?auto_796538 ?auto_796539 ) ( ON ?auto_796537 ?auto_796533 ) ( not ( = ?auto_796533 ?auto_796537 ) ) ( not ( = ?auto_796533 ?auto_796538 ) ) ( ON ?auto_796535 ?auto_796534 ) ( ON ?auto_796536 ?auto_796535 ) ( ON ?auto_796533 ?auto_796536 ) ( not ( = ?auto_796534 ?auto_796535 ) ) ( not ( = ?auto_796534 ?auto_796536 ) ) ( not ( = ?auto_796534 ?auto_796533 ) ) ( not ( = ?auto_796534 ?auto_796537 ) ) ( not ( = ?auto_796534 ?auto_796538 ) ) ( not ( = ?auto_796535 ?auto_796536 ) ) ( not ( = ?auto_796535 ?auto_796533 ) ) ( not ( = ?auto_796535 ?auto_796537 ) ) ( not ( = ?auto_796535 ?auto_796538 ) ) ( not ( = ?auto_796536 ?auto_796533 ) ) ( not ( = ?auto_796536 ?auto_796537 ) ) ( not ( = ?auto_796536 ?auto_796538 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_796533 ?auto_796537 ?auto_796538 )
      ( MAKE-5CRATE-VERIFY ?auto_796534 ?auto_796535 ?auto_796536 ?auto_796533 ?auto_796537 ?auto_796538 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_796574 - SURFACE
      ?auto_796575 - SURFACE
      ?auto_796576 - SURFACE
      ?auto_796573 - SURFACE
      ?auto_796577 - SURFACE
      ?auto_796578 - SURFACE
    )
    :vars
    (
      ?auto_796580 - HOIST
      ?auto_796579 - PLACE
      ?auto_796581 - TRUCK
      ?auto_796582 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_796580 ?auto_796579 ) ( SURFACE-AT ?auto_796577 ?auto_796579 ) ( CLEAR ?auto_796577 ) ( IS-CRATE ?auto_796578 ) ( not ( = ?auto_796577 ?auto_796578 ) ) ( AVAILABLE ?auto_796580 ) ( IN ?auto_796578 ?auto_796581 ) ( ON ?auto_796577 ?auto_796573 ) ( not ( = ?auto_796573 ?auto_796577 ) ) ( not ( = ?auto_796573 ?auto_796578 ) ) ( TRUCK-AT ?auto_796581 ?auto_796582 ) ( not ( = ?auto_796582 ?auto_796579 ) ) ( ON ?auto_796575 ?auto_796574 ) ( ON ?auto_796576 ?auto_796575 ) ( ON ?auto_796573 ?auto_796576 ) ( not ( = ?auto_796574 ?auto_796575 ) ) ( not ( = ?auto_796574 ?auto_796576 ) ) ( not ( = ?auto_796574 ?auto_796573 ) ) ( not ( = ?auto_796574 ?auto_796577 ) ) ( not ( = ?auto_796574 ?auto_796578 ) ) ( not ( = ?auto_796575 ?auto_796576 ) ) ( not ( = ?auto_796575 ?auto_796573 ) ) ( not ( = ?auto_796575 ?auto_796577 ) ) ( not ( = ?auto_796575 ?auto_796578 ) ) ( not ( = ?auto_796576 ?auto_796573 ) ) ( not ( = ?auto_796576 ?auto_796577 ) ) ( not ( = ?auto_796576 ?auto_796578 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_796573 ?auto_796577 ?auto_796578 )
      ( MAKE-5CRATE-VERIFY ?auto_796574 ?auto_796575 ?auto_796576 ?auto_796573 ?auto_796577 ?auto_796578 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_796619 - SURFACE
      ?auto_796620 - SURFACE
      ?auto_796621 - SURFACE
      ?auto_796618 - SURFACE
      ?auto_796622 - SURFACE
      ?auto_796623 - SURFACE
    )
    :vars
    (
      ?auto_796627 - HOIST
      ?auto_796624 - PLACE
      ?auto_796625 - TRUCK
      ?auto_796628 - PLACE
      ?auto_796626 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_796627 ?auto_796624 ) ( SURFACE-AT ?auto_796622 ?auto_796624 ) ( CLEAR ?auto_796622 ) ( IS-CRATE ?auto_796623 ) ( not ( = ?auto_796622 ?auto_796623 ) ) ( AVAILABLE ?auto_796627 ) ( ON ?auto_796622 ?auto_796618 ) ( not ( = ?auto_796618 ?auto_796622 ) ) ( not ( = ?auto_796618 ?auto_796623 ) ) ( TRUCK-AT ?auto_796625 ?auto_796628 ) ( not ( = ?auto_796628 ?auto_796624 ) ) ( HOIST-AT ?auto_796626 ?auto_796628 ) ( LIFTING ?auto_796626 ?auto_796623 ) ( not ( = ?auto_796627 ?auto_796626 ) ) ( ON ?auto_796620 ?auto_796619 ) ( ON ?auto_796621 ?auto_796620 ) ( ON ?auto_796618 ?auto_796621 ) ( not ( = ?auto_796619 ?auto_796620 ) ) ( not ( = ?auto_796619 ?auto_796621 ) ) ( not ( = ?auto_796619 ?auto_796618 ) ) ( not ( = ?auto_796619 ?auto_796622 ) ) ( not ( = ?auto_796619 ?auto_796623 ) ) ( not ( = ?auto_796620 ?auto_796621 ) ) ( not ( = ?auto_796620 ?auto_796618 ) ) ( not ( = ?auto_796620 ?auto_796622 ) ) ( not ( = ?auto_796620 ?auto_796623 ) ) ( not ( = ?auto_796621 ?auto_796618 ) ) ( not ( = ?auto_796621 ?auto_796622 ) ) ( not ( = ?auto_796621 ?auto_796623 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_796618 ?auto_796622 ?auto_796623 )
      ( MAKE-5CRATE-VERIFY ?auto_796619 ?auto_796620 ?auto_796621 ?auto_796618 ?auto_796622 ?auto_796623 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_796669 - SURFACE
      ?auto_796670 - SURFACE
      ?auto_796671 - SURFACE
      ?auto_796668 - SURFACE
      ?auto_796672 - SURFACE
      ?auto_796673 - SURFACE
    )
    :vars
    (
      ?auto_796674 - HOIST
      ?auto_796679 - PLACE
      ?auto_796676 - TRUCK
      ?auto_796678 - PLACE
      ?auto_796677 - HOIST
      ?auto_796675 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_796674 ?auto_796679 ) ( SURFACE-AT ?auto_796672 ?auto_796679 ) ( CLEAR ?auto_796672 ) ( IS-CRATE ?auto_796673 ) ( not ( = ?auto_796672 ?auto_796673 ) ) ( AVAILABLE ?auto_796674 ) ( ON ?auto_796672 ?auto_796668 ) ( not ( = ?auto_796668 ?auto_796672 ) ) ( not ( = ?auto_796668 ?auto_796673 ) ) ( TRUCK-AT ?auto_796676 ?auto_796678 ) ( not ( = ?auto_796678 ?auto_796679 ) ) ( HOIST-AT ?auto_796677 ?auto_796678 ) ( not ( = ?auto_796674 ?auto_796677 ) ) ( AVAILABLE ?auto_796677 ) ( SURFACE-AT ?auto_796673 ?auto_796678 ) ( ON ?auto_796673 ?auto_796675 ) ( CLEAR ?auto_796673 ) ( not ( = ?auto_796672 ?auto_796675 ) ) ( not ( = ?auto_796673 ?auto_796675 ) ) ( not ( = ?auto_796668 ?auto_796675 ) ) ( ON ?auto_796670 ?auto_796669 ) ( ON ?auto_796671 ?auto_796670 ) ( ON ?auto_796668 ?auto_796671 ) ( not ( = ?auto_796669 ?auto_796670 ) ) ( not ( = ?auto_796669 ?auto_796671 ) ) ( not ( = ?auto_796669 ?auto_796668 ) ) ( not ( = ?auto_796669 ?auto_796672 ) ) ( not ( = ?auto_796669 ?auto_796673 ) ) ( not ( = ?auto_796669 ?auto_796675 ) ) ( not ( = ?auto_796670 ?auto_796671 ) ) ( not ( = ?auto_796670 ?auto_796668 ) ) ( not ( = ?auto_796670 ?auto_796672 ) ) ( not ( = ?auto_796670 ?auto_796673 ) ) ( not ( = ?auto_796670 ?auto_796675 ) ) ( not ( = ?auto_796671 ?auto_796668 ) ) ( not ( = ?auto_796671 ?auto_796672 ) ) ( not ( = ?auto_796671 ?auto_796673 ) ) ( not ( = ?auto_796671 ?auto_796675 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_796668 ?auto_796672 ?auto_796673 )
      ( MAKE-5CRATE-VERIFY ?auto_796669 ?auto_796670 ?auto_796671 ?auto_796668 ?auto_796672 ?auto_796673 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_796720 - SURFACE
      ?auto_796721 - SURFACE
      ?auto_796722 - SURFACE
      ?auto_796719 - SURFACE
      ?auto_796723 - SURFACE
      ?auto_796724 - SURFACE
    )
    :vars
    (
      ?auto_796729 - HOIST
      ?auto_796725 - PLACE
      ?auto_796726 - PLACE
      ?auto_796728 - HOIST
      ?auto_796727 - SURFACE
      ?auto_796730 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_796729 ?auto_796725 ) ( SURFACE-AT ?auto_796723 ?auto_796725 ) ( CLEAR ?auto_796723 ) ( IS-CRATE ?auto_796724 ) ( not ( = ?auto_796723 ?auto_796724 ) ) ( AVAILABLE ?auto_796729 ) ( ON ?auto_796723 ?auto_796719 ) ( not ( = ?auto_796719 ?auto_796723 ) ) ( not ( = ?auto_796719 ?auto_796724 ) ) ( not ( = ?auto_796726 ?auto_796725 ) ) ( HOIST-AT ?auto_796728 ?auto_796726 ) ( not ( = ?auto_796729 ?auto_796728 ) ) ( AVAILABLE ?auto_796728 ) ( SURFACE-AT ?auto_796724 ?auto_796726 ) ( ON ?auto_796724 ?auto_796727 ) ( CLEAR ?auto_796724 ) ( not ( = ?auto_796723 ?auto_796727 ) ) ( not ( = ?auto_796724 ?auto_796727 ) ) ( not ( = ?auto_796719 ?auto_796727 ) ) ( TRUCK-AT ?auto_796730 ?auto_796725 ) ( ON ?auto_796721 ?auto_796720 ) ( ON ?auto_796722 ?auto_796721 ) ( ON ?auto_796719 ?auto_796722 ) ( not ( = ?auto_796720 ?auto_796721 ) ) ( not ( = ?auto_796720 ?auto_796722 ) ) ( not ( = ?auto_796720 ?auto_796719 ) ) ( not ( = ?auto_796720 ?auto_796723 ) ) ( not ( = ?auto_796720 ?auto_796724 ) ) ( not ( = ?auto_796720 ?auto_796727 ) ) ( not ( = ?auto_796721 ?auto_796722 ) ) ( not ( = ?auto_796721 ?auto_796719 ) ) ( not ( = ?auto_796721 ?auto_796723 ) ) ( not ( = ?auto_796721 ?auto_796724 ) ) ( not ( = ?auto_796721 ?auto_796727 ) ) ( not ( = ?auto_796722 ?auto_796719 ) ) ( not ( = ?auto_796722 ?auto_796723 ) ) ( not ( = ?auto_796722 ?auto_796724 ) ) ( not ( = ?auto_796722 ?auto_796727 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_796719 ?auto_796723 ?auto_796724 )
      ( MAKE-5CRATE-VERIFY ?auto_796720 ?auto_796721 ?auto_796722 ?auto_796719 ?auto_796723 ?auto_796724 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_796771 - SURFACE
      ?auto_796772 - SURFACE
      ?auto_796773 - SURFACE
      ?auto_796770 - SURFACE
      ?auto_796774 - SURFACE
      ?auto_796775 - SURFACE
    )
    :vars
    (
      ?auto_796779 - HOIST
      ?auto_796776 - PLACE
      ?auto_796778 - PLACE
      ?auto_796780 - HOIST
      ?auto_796777 - SURFACE
      ?auto_796781 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_796779 ?auto_796776 ) ( IS-CRATE ?auto_796775 ) ( not ( = ?auto_796774 ?auto_796775 ) ) ( not ( = ?auto_796770 ?auto_796774 ) ) ( not ( = ?auto_796770 ?auto_796775 ) ) ( not ( = ?auto_796778 ?auto_796776 ) ) ( HOIST-AT ?auto_796780 ?auto_796778 ) ( not ( = ?auto_796779 ?auto_796780 ) ) ( AVAILABLE ?auto_796780 ) ( SURFACE-AT ?auto_796775 ?auto_796778 ) ( ON ?auto_796775 ?auto_796777 ) ( CLEAR ?auto_796775 ) ( not ( = ?auto_796774 ?auto_796777 ) ) ( not ( = ?auto_796775 ?auto_796777 ) ) ( not ( = ?auto_796770 ?auto_796777 ) ) ( TRUCK-AT ?auto_796781 ?auto_796776 ) ( SURFACE-AT ?auto_796770 ?auto_796776 ) ( CLEAR ?auto_796770 ) ( LIFTING ?auto_796779 ?auto_796774 ) ( IS-CRATE ?auto_796774 ) ( ON ?auto_796772 ?auto_796771 ) ( ON ?auto_796773 ?auto_796772 ) ( ON ?auto_796770 ?auto_796773 ) ( not ( = ?auto_796771 ?auto_796772 ) ) ( not ( = ?auto_796771 ?auto_796773 ) ) ( not ( = ?auto_796771 ?auto_796770 ) ) ( not ( = ?auto_796771 ?auto_796774 ) ) ( not ( = ?auto_796771 ?auto_796775 ) ) ( not ( = ?auto_796771 ?auto_796777 ) ) ( not ( = ?auto_796772 ?auto_796773 ) ) ( not ( = ?auto_796772 ?auto_796770 ) ) ( not ( = ?auto_796772 ?auto_796774 ) ) ( not ( = ?auto_796772 ?auto_796775 ) ) ( not ( = ?auto_796772 ?auto_796777 ) ) ( not ( = ?auto_796773 ?auto_796770 ) ) ( not ( = ?auto_796773 ?auto_796774 ) ) ( not ( = ?auto_796773 ?auto_796775 ) ) ( not ( = ?auto_796773 ?auto_796777 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_796770 ?auto_796774 ?auto_796775 )
      ( MAKE-5CRATE-VERIFY ?auto_796771 ?auto_796772 ?auto_796773 ?auto_796770 ?auto_796774 ?auto_796775 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_796822 - SURFACE
      ?auto_796823 - SURFACE
      ?auto_796824 - SURFACE
      ?auto_796821 - SURFACE
      ?auto_796825 - SURFACE
      ?auto_796826 - SURFACE
    )
    :vars
    (
      ?auto_796832 - HOIST
      ?auto_796830 - PLACE
      ?auto_796828 - PLACE
      ?auto_796829 - HOIST
      ?auto_796827 - SURFACE
      ?auto_796831 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_796832 ?auto_796830 ) ( IS-CRATE ?auto_796826 ) ( not ( = ?auto_796825 ?auto_796826 ) ) ( not ( = ?auto_796821 ?auto_796825 ) ) ( not ( = ?auto_796821 ?auto_796826 ) ) ( not ( = ?auto_796828 ?auto_796830 ) ) ( HOIST-AT ?auto_796829 ?auto_796828 ) ( not ( = ?auto_796832 ?auto_796829 ) ) ( AVAILABLE ?auto_796829 ) ( SURFACE-AT ?auto_796826 ?auto_796828 ) ( ON ?auto_796826 ?auto_796827 ) ( CLEAR ?auto_796826 ) ( not ( = ?auto_796825 ?auto_796827 ) ) ( not ( = ?auto_796826 ?auto_796827 ) ) ( not ( = ?auto_796821 ?auto_796827 ) ) ( TRUCK-AT ?auto_796831 ?auto_796830 ) ( SURFACE-AT ?auto_796821 ?auto_796830 ) ( CLEAR ?auto_796821 ) ( IS-CRATE ?auto_796825 ) ( AVAILABLE ?auto_796832 ) ( IN ?auto_796825 ?auto_796831 ) ( ON ?auto_796823 ?auto_796822 ) ( ON ?auto_796824 ?auto_796823 ) ( ON ?auto_796821 ?auto_796824 ) ( not ( = ?auto_796822 ?auto_796823 ) ) ( not ( = ?auto_796822 ?auto_796824 ) ) ( not ( = ?auto_796822 ?auto_796821 ) ) ( not ( = ?auto_796822 ?auto_796825 ) ) ( not ( = ?auto_796822 ?auto_796826 ) ) ( not ( = ?auto_796822 ?auto_796827 ) ) ( not ( = ?auto_796823 ?auto_796824 ) ) ( not ( = ?auto_796823 ?auto_796821 ) ) ( not ( = ?auto_796823 ?auto_796825 ) ) ( not ( = ?auto_796823 ?auto_796826 ) ) ( not ( = ?auto_796823 ?auto_796827 ) ) ( not ( = ?auto_796824 ?auto_796821 ) ) ( not ( = ?auto_796824 ?auto_796825 ) ) ( not ( = ?auto_796824 ?auto_796826 ) ) ( not ( = ?auto_796824 ?auto_796827 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_796821 ?auto_796825 ?auto_796826 )
      ( MAKE-5CRATE-VERIFY ?auto_796822 ?auto_796823 ?auto_796824 ?auto_796821 ?auto_796825 ?auto_796826 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_797813 - SURFACE
      ?auto_797814 - SURFACE
    )
    :vars
    (
      ?auto_797820 - HOIST
      ?auto_797817 - PLACE
      ?auto_797821 - SURFACE
      ?auto_797815 - PLACE
      ?auto_797816 - HOIST
      ?auto_797819 - SURFACE
      ?auto_797818 - TRUCK
      ?auto_797822 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_797820 ?auto_797817 ) ( SURFACE-AT ?auto_797813 ?auto_797817 ) ( CLEAR ?auto_797813 ) ( IS-CRATE ?auto_797814 ) ( not ( = ?auto_797813 ?auto_797814 ) ) ( ON ?auto_797813 ?auto_797821 ) ( not ( = ?auto_797821 ?auto_797813 ) ) ( not ( = ?auto_797821 ?auto_797814 ) ) ( not ( = ?auto_797815 ?auto_797817 ) ) ( HOIST-AT ?auto_797816 ?auto_797815 ) ( not ( = ?auto_797820 ?auto_797816 ) ) ( AVAILABLE ?auto_797816 ) ( SURFACE-AT ?auto_797814 ?auto_797815 ) ( ON ?auto_797814 ?auto_797819 ) ( CLEAR ?auto_797814 ) ( not ( = ?auto_797813 ?auto_797819 ) ) ( not ( = ?auto_797814 ?auto_797819 ) ) ( not ( = ?auto_797821 ?auto_797819 ) ) ( TRUCK-AT ?auto_797818 ?auto_797817 ) ( LIFTING ?auto_797820 ?auto_797822 ) ( IS-CRATE ?auto_797822 ) ( not ( = ?auto_797813 ?auto_797822 ) ) ( not ( = ?auto_797814 ?auto_797822 ) ) ( not ( = ?auto_797821 ?auto_797822 ) ) ( not ( = ?auto_797819 ?auto_797822 ) ) )
    :subtasks
    ( ( !LOAD ?auto_797820 ?auto_797822 ?auto_797818 ?auto_797817 )
      ( MAKE-1CRATE ?auto_797813 ?auto_797814 )
      ( MAKE-1CRATE-VERIFY ?auto_797813 ?auto_797814 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_798029 - SURFACE
      ?auto_798030 - SURFACE
      ?auto_798031 - SURFACE
      ?auto_798028 - SURFACE
      ?auto_798032 - SURFACE
      ?auto_798034 - SURFACE
      ?auto_798033 - SURFACE
    )
    :vars
    (
      ?auto_798035 - HOIST
      ?auto_798036 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_798035 ?auto_798036 ) ( SURFACE-AT ?auto_798034 ?auto_798036 ) ( CLEAR ?auto_798034 ) ( LIFTING ?auto_798035 ?auto_798033 ) ( IS-CRATE ?auto_798033 ) ( not ( = ?auto_798034 ?auto_798033 ) ) ( ON ?auto_798030 ?auto_798029 ) ( ON ?auto_798031 ?auto_798030 ) ( ON ?auto_798028 ?auto_798031 ) ( ON ?auto_798032 ?auto_798028 ) ( ON ?auto_798034 ?auto_798032 ) ( not ( = ?auto_798029 ?auto_798030 ) ) ( not ( = ?auto_798029 ?auto_798031 ) ) ( not ( = ?auto_798029 ?auto_798028 ) ) ( not ( = ?auto_798029 ?auto_798032 ) ) ( not ( = ?auto_798029 ?auto_798034 ) ) ( not ( = ?auto_798029 ?auto_798033 ) ) ( not ( = ?auto_798030 ?auto_798031 ) ) ( not ( = ?auto_798030 ?auto_798028 ) ) ( not ( = ?auto_798030 ?auto_798032 ) ) ( not ( = ?auto_798030 ?auto_798034 ) ) ( not ( = ?auto_798030 ?auto_798033 ) ) ( not ( = ?auto_798031 ?auto_798028 ) ) ( not ( = ?auto_798031 ?auto_798032 ) ) ( not ( = ?auto_798031 ?auto_798034 ) ) ( not ( = ?auto_798031 ?auto_798033 ) ) ( not ( = ?auto_798028 ?auto_798032 ) ) ( not ( = ?auto_798028 ?auto_798034 ) ) ( not ( = ?auto_798028 ?auto_798033 ) ) ( not ( = ?auto_798032 ?auto_798034 ) ) ( not ( = ?auto_798032 ?auto_798033 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_798034 ?auto_798033 )
      ( MAKE-6CRATE-VERIFY ?auto_798029 ?auto_798030 ?auto_798031 ?auto_798028 ?auto_798032 ?auto_798034 ?auto_798033 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_798073 - SURFACE
      ?auto_798074 - SURFACE
      ?auto_798075 - SURFACE
      ?auto_798072 - SURFACE
      ?auto_798076 - SURFACE
      ?auto_798078 - SURFACE
      ?auto_798077 - SURFACE
    )
    :vars
    (
      ?auto_798081 - HOIST
      ?auto_798079 - PLACE
      ?auto_798080 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_798081 ?auto_798079 ) ( SURFACE-AT ?auto_798078 ?auto_798079 ) ( CLEAR ?auto_798078 ) ( IS-CRATE ?auto_798077 ) ( not ( = ?auto_798078 ?auto_798077 ) ) ( TRUCK-AT ?auto_798080 ?auto_798079 ) ( AVAILABLE ?auto_798081 ) ( IN ?auto_798077 ?auto_798080 ) ( ON ?auto_798078 ?auto_798076 ) ( not ( = ?auto_798076 ?auto_798078 ) ) ( not ( = ?auto_798076 ?auto_798077 ) ) ( ON ?auto_798074 ?auto_798073 ) ( ON ?auto_798075 ?auto_798074 ) ( ON ?auto_798072 ?auto_798075 ) ( ON ?auto_798076 ?auto_798072 ) ( not ( = ?auto_798073 ?auto_798074 ) ) ( not ( = ?auto_798073 ?auto_798075 ) ) ( not ( = ?auto_798073 ?auto_798072 ) ) ( not ( = ?auto_798073 ?auto_798076 ) ) ( not ( = ?auto_798073 ?auto_798078 ) ) ( not ( = ?auto_798073 ?auto_798077 ) ) ( not ( = ?auto_798074 ?auto_798075 ) ) ( not ( = ?auto_798074 ?auto_798072 ) ) ( not ( = ?auto_798074 ?auto_798076 ) ) ( not ( = ?auto_798074 ?auto_798078 ) ) ( not ( = ?auto_798074 ?auto_798077 ) ) ( not ( = ?auto_798075 ?auto_798072 ) ) ( not ( = ?auto_798075 ?auto_798076 ) ) ( not ( = ?auto_798075 ?auto_798078 ) ) ( not ( = ?auto_798075 ?auto_798077 ) ) ( not ( = ?auto_798072 ?auto_798076 ) ) ( not ( = ?auto_798072 ?auto_798078 ) ) ( not ( = ?auto_798072 ?auto_798077 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_798076 ?auto_798078 ?auto_798077 )
      ( MAKE-6CRATE-VERIFY ?auto_798073 ?auto_798074 ?auto_798075 ?auto_798072 ?auto_798076 ?auto_798078 ?auto_798077 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_798124 - SURFACE
      ?auto_798125 - SURFACE
      ?auto_798126 - SURFACE
      ?auto_798123 - SURFACE
      ?auto_798127 - SURFACE
      ?auto_798129 - SURFACE
      ?auto_798128 - SURFACE
    )
    :vars
    (
      ?auto_798130 - HOIST
      ?auto_798131 - PLACE
      ?auto_798132 - TRUCK
      ?auto_798133 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_798130 ?auto_798131 ) ( SURFACE-AT ?auto_798129 ?auto_798131 ) ( CLEAR ?auto_798129 ) ( IS-CRATE ?auto_798128 ) ( not ( = ?auto_798129 ?auto_798128 ) ) ( AVAILABLE ?auto_798130 ) ( IN ?auto_798128 ?auto_798132 ) ( ON ?auto_798129 ?auto_798127 ) ( not ( = ?auto_798127 ?auto_798129 ) ) ( not ( = ?auto_798127 ?auto_798128 ) ) ( TRUCK-AT ?auto_798132 ?auto_798133 ) ( not ( = ?auto_798133 ?auto_798131 ) ) ( ON ?auto_798125 ?auto_798124 ) ( ON ?auto_798126 ?auto_798125 ) ( ON ?auto_798123 ?auto_798126 ) ( ON ?auto_798127 ?auto_798123 ) ( not ( = ?auto_798124 ?auto_798125 ) ) ( not ( = ?auto_798124 ?auto_798126 ) ) ( not ( = ?auto_798124 ?auto_798123 ) ) ( not ( = ?auto_798124 ?auto_798127 ) ) ( not ( = ?auto_798124 ?auto_798129 ) ) ( not ( = ?auto_798124 ?auto_798128 ) ) ( not ( = ?auto_798125 ?auto_798126 ) ) ( not ( = ?auto_798125 ?auto_798123 ) ) ( not ( = ?auto_798125 ?auto_798127 ) ) ( not ( = ?auto_798125 ?auto_798129 ) ) ( not ( = ?auto_798125 ?auto_798128 ) ) ( not ( = ?auto_798126 ?auto_798123 ) ) ( not ( = ?auto_798126 ?auto_798127 ) ) ( not ( = ?auto_798126 ?auto_798129 ) ) ( not ( = ?auto_798126 ?auto_798128 ) ) ( not ( = ?auto_798123 ?auto_798127 ) ) ( not ( = ?auto_798123 ?auto_798129 ) ) ( not ( = ?auto_798123 ?auto_798128 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_798127 ?auto_798129 ?auto_798128 )
      ( MAKE-6CRATE-VERIFY ?auto_798124 ?auto_798125 ?auto_798126 ?auto_798123 ?auto_798127 ?auto_798129 ?auto_798128 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_798181 - SURFACE
      ?auto_798182 - SURFACE
      ?auto_798183 - SURFACE
      ?auto_798180 - SURFACE
      ?auto_798184 - SURFACE
      ?auto_798186 - SURFACE
      ?auto_798185 - SURFACE
    )
    :vars
    (
      ?auto_798189 - HOIST
      ?auto_798191 - PLACE
      ?auto_798190 - TRUCK
      ?auto_798187 - PLACE
      ?auto_798188 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_798189 ?auto_798191 ) ( SURFACE-AT ?auto_798186 ?auto_798191 ) ( CLEAR ?auto_798186 ) ( IS-CRATE ?auto_798185 ) ( not ( = ?auto_798186 ?auto_798185 ) ) ( AVAILABLE ?auto_798189 ) ( ON ?auto_798186 ?auto_798184 ) ( not ( = ?auto_798184 ?auto_798186 ) ) ( not ( = ?auto_798184 ?auto_798185 ) ) ( TRUCK-AT ?auto_798190 ?auto_798187 ) ( not ( = ?auto_798187 ?auto_798191 ) ) ( HOIST-AT ?auto_798188 ?auto_798187 ) ( LIFTING ?auto_798188 ?auto_798185 ) ( not ( = ?auto_798189 ?auto_798188 ) ) ( ON ?auto_798182 ?auto_798181 ) ( ON ?auto_798183 ?auto_798182 ) ( ON ?auto_798180 ?auto_798183 ) ( ON ?auto_798184 ?auto_798180 ) ( not ( = ?auto_798181 ?auto_798182 ) ) ( not ( = ?auto_798181 ?auto_798183 ) ) ( not ( = ?auto_798181 ?auto_798180 ) ) ( not ( = ?auto_798181 ?auto_798184 ) ) ( not ( = ?auto_798181 ?auto_798186 ) ) ( not ( = ?auto_798181 ?auto_798185 ) ) ( not ( = ?auto_798182 ?auto_798183 ) ) ( not ( = ?auto_798182 ?auto_798180 ) ) ( not ( = ?auto_798182 ?auto_798184 ) ) ( not ( = ?auto_798182 ?auto_798186 ) ) ( not ( = ?auto_798182 ?auto_798185 ) ) ( not ( = ?auto_798183 ?auto_798180 ) ) ( not ( = ?auto_798183 ?auto_798184 ) ) ( not ( = ?auto_798183 ?auto_798186 ) ) ( not ( = ?auto_798183 ?auto_798185 ) ) ( not ( = ?auto_798180 ?auto_798184 ) ) ( not ( = ?auto_798180 ?auto_798186 ) ) ( not ( = ?auto_798180 ?auto_798185 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_798184 ?auto_798186 ?auto_798185 )
      ( MAKE-6CRATE-VERIFY ?auto_798181 ?auto_798182 ?auto_798183 ?auto_798180 ?auto_798184 ?auto_798186 ?auto_798185 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_798244 - SURFACE
      ?auto_798245 - SURFACE
      ?auto_798246 - SURFACE
      ?auto_798243 - SURFACE
      ?auto_798247 - SURFACE
      ?auto_798249 - SURFACE
      ?auto_798248 - SURFACE
    )
    :vars
    (
      ?auto_798254 - HOIST
      ?auto_798250 - PLACE
      ?auto_798255 - TRUCK
      ?auto_798252 - PLACE
      ?auto_798253 - HOIST
      ?auto_798251 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_798254 ?auto_798250 ) ( SURFACE-AT ?auto_798249 ?auto_798250 ) ( CLEAR ?auto_798249 ) ( IS-CRATE ?auto_798248 ) ( not ( = ?auto_798249 ?auto_798248 ) ) ( AVAILABLE ?auto_798254 ) ( ON ?auto_798249 ?auto_798247 ) ( not ( = ?auto_798247 ?auto_798249 ) ) ( not ( = ?auto_798247 ?auto_798248 ) ) ( TRUCK-AT ?auto_798255 ?auto_798252 ) ( not ( = ?auto_798252 ?auto_798250 ) ) ( HOIST-AT ?auto_798253 ?auto_798252 ) ( not ( = ?auto_798254 ?auto_798253 ) ) ( AVAILABLE ?auto_798253 ) ( SURFACE-AT ?auto_798248 ?auto_798252 ) ( ON ?auto_798248 ?auto_798251 ) ( CLEAR ?auto_798248 ) ( not ( = ?auto_798249 ?auto_798251 ) ) ( not ( = ?auto_798248 ?auto_798251 ) ) ( not ( = ?auto_798247 ?auto_798251 ) ) ( ON ?auto_798245 ?auto_798244 ) ( ON ?auto_798246 ?auto_798245 ) ( ON ?auto_798243 ?auto_798246 ) ( ON ?auto_798247 ?auto_798243 ) ( not ( = ?auto_798244 ?auto_798245 ) ) ( not ( = ?auto_798244 ?auto_798246 ) ) ( not ( = ?auto_798244 ?auto_798243 ) ) ( not ( = ?auto_798244 ?auto_798247 ) ) ( not ( = ?auto_798244 ?auto_798249 ) ) ( not ( = ?auto_798244 ?auto_798248 ) ) ( not ( = ?auto_798244 ?auto_798251 ) ) ( not ( = ?auto_798245 ?auto_798246 ) ) ( not ( = ?auto_798245 ?auto_798243 ) ) ( not ( = ?auto_798245 ?auto_798247 ) ) ( not ( = ?auto_798245 ?auto_798249 ) ) ( not ( = ?auto_798245 ?auto_798248 ) ) ( not ( = ?auto_798245 ?auto_798251 ) ) ( not ( = ?auto_798246 ?auto_798243 ) ) ( not ( = ?auto_798246 ?auto_798247 ) ) ( not ( = ?auto_798246 ?auto_798249 ) ) ( not ( = ?auto_798246 ?auto_798248 ) ) ( not ( = ?auto_798246 ?auto_798251 ) ) ( not ( = ?auto_798243 ?auto_798247 ) ) ( not ( = ?auto_798243 ?auto_798249 ) ) ( not ( = ?auto_798243 ?auto_798248 ) ) ( not ( = ?auto_798243 ?auto_798251 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_798247 ?auto_798249 ?auto_798248 )
      ( MAKE-6CRATE-VERIFY ?auto_798244 ?auto_798245 ?auto_798246 ?auto_798243 ?auto_798247 ?auto_798249 ?auto_798248 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_798308 - SURFACE
      ?auto_798309 - SURFACE
      ?auto_798310 - SURFACE
      ?auto_798307 - SURFACE
      ?auto_798311 - SURFACE
      ?auto_798313 - SURFACE
      ?auto_798312 - SURFACE
    )
    :vars
    (
      ?auto_798316 - HOIST
      ?auto_798317 - PLACE
      ?auto_798314 - PLACE
      ?auto_798319 - HOIST
      ?auto_798315 - SURFACE
      ?auto_798318 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_798316 ?auto_798317 ) ( SURFACE-AT ?auto_798313 ?auto_798317 ) ( CLEAR ?auto_798313 ) ( IS-CRATE ?auto_798312 ) ( not ( = ?auto_798313 ?auto_798312 ) ) ( AVAILABLE ?auto_798316 ) ( ON ?auto_798313 ?auto_798311 ) ( not ( = ?auto_798311 ?auto_798313 ) ) ( not ( = ?auto_798311 ?auto_798312 ) ) ( not ( = ?auto_798314 ?auto_798317 ) ) ( HOIST-AT ?auto_798319 ?auto_798314 ) ( not ( = ?auto_798316 ?auto_798319 ) ) ( AVAILABLE ?auto_798319 ) ( SURFACE-AT ?auto_798312 ?auto_798314 ) ( ON ?auto_798312 ?auto_798315 ) ( CLEAR ?auto_798312 ) ( not ( = ?auto_798313 ?auto_798315 ) ) ( not ( = ?auto_798312 ?auto_798315 ) ) ( not ( = ?auto_798311 ?auto_798315 ) ) ( TRUCK-AT ?auto_798318 ?auto_798317 ) ( ON ?auto_798309 ?auto_798308 ) ( ON ?auto_798310 ?auto_798309 ) ( ON ?auto_798307 ?auto_798310 ) ( ON ?auto_798311 ?auto_798307 ) ( not ( = ?auto_798308 ?auto_798309 ) ) ( not ( = ?auto_798308 ?auto_798310 ) ) ( not ( = ?auto_798308 ?auto_798307 ) ) ( not ( = ?auto_798308 ?auto_798311 ) ) ( not ( = ?auto_798308 ?auto_798313 ) ) ( not ( = ?auto_798308 ?auto_798312 ) ) ( not ( = ?auto_798308 ?auto_798315 ) ) ( not ( = ?auto_798309 ?auto_798310 ) ) ( not ( = ?auto_798309 ?auto_798307 ) ) ( not ( = ?auto_798309 ?auto_798311 ) ) ( not ( = ?auto_798309 ?auto_798313 ) ) ( not ( = ?auto_798309 ?auto_798312 ) ) ( not ( = ?auto_798309 ?auto_798315 ) ) ( not ( = ?auto_798310 ?auto_798307 ) ) ( not ( = ?auto_798310 ?auto_798311 ) ) ( not ( = ?auto_798310 ?auto_798313 ) ) ( not ( = ?auto_798310 ?auto_798312 ) ) ( not ( = ?auto_798310 ?auto_798315 ) ) ( not ( = ?auto_798307 ?auto_798311 ) ) ( not ( = ?auto_798307 ?auto_798313 ) ) ( not ( = ?auto_798307 ?auto_798312 ) ) ( not ( = ?auto_798307 ?auto_798315 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_798311 ?auto_798313 ?auto_798312 )
      ( MAKE-6CRATE-VERIFY ?auto_798308 ?auto_798309 ?auto_798310 ?auto_798307 ?auto_798311 ?auto_798313 ?auto_798312 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_798372 - SURFACE
      ?auto_798373 - SURFACE
      ?auto_798374 - SURFACE
      ?auto_798371 - SURFACE
      ?auto_798375 - SURFACE
      ?auto_798377 - SURFACE
      ?auto_798376 - SURFACE
    )
    :vars
    (
      ?auto_798380 - HOIST
      ?auto_798383 - PLACE
      ?auto_798381 - PLACE
      ?auto_798379 - HOIST
      ?auto_798382 - SURFACE
      ?auto_798378 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_798380 ?auto_798383 ) ( IS-CRATE ?auto_798376 ) ( not ( = ?auto_798377 ?auto_798376 ) ) ( not ( = ?auto_798375 ?auto_798377 ) ) ( not ( = ?auto_798375 ?auto_798376 ) ) ( not ( = ?auto_798381 ?auto_798383 ) ) ( HOIST-AT ?auto_798379 ?auto_798381 ) ( not ( = ?auto_798380 ?auto_798379 ) ) ( AVAILABLE ?auto_798379 ) ( SURFACE-AT ?auto_798376 ?auto_798381 ) ( ON ?auto_798376 ?auto_798382 ) ( CLEAR ?auto_798376 ) ( not ( = ?auto_798377 ?auto_798382 ) ) ( not ( = ?auto_798376 ?auto_798382 ) ) ( not ( = ?auto_798375 ?auto_798382 ) ) ( TRUCK-AT ?auto_798378 ?auto_798383 ) ( SURFACE-AT ?auto_798375 ?auto_798383 ) ( CLEAR ?auto_798375 ) ( LIFTING ?auto_798380 ?auto_798377 ) ( IS-CRATE ?auto_798377 ) ( ON ?auto_798373 ?auto_798372 ) ( ON ?auto_798374 ?auto_798373 ) ( ON ?auto_798371 ?auto_798374 ) ( ON ?auto_798375 ?auto_798371 ) ( not ( = ?auto_798372 ?auto_798373 ) ) ( not ( = ?auto_798372 ?auto_798374 ) ) ( not ( = ?auto_798372 ?auto_798371 ) ) ( not ( = ?auto_798372 ?auto_798375 ) ) ( not ( = ?auto_798372 ?auto_798377 ) ) ( not ( = ?auto_798372 ?auto_798376 ) ) ( not ( = ?auto_798372 ?auto_798382 ) ) ( not ( = ?auto_798373 ?auto_798374 ) ) ( not ( = ?auto_798373 ?auto_798371 ) ) ( not ( = ?auto_798373 ?auto_798375 ) ) ( not ( = ?auto_798373 ?auto_798377 ) ) ( not ( = ?auto_798373 ?auto_798376 ) ) ( not ( = ?auto_798373 ?auto_798382 ) ) ( not ( = ?auto_798374 ?auto_798371 ) ) ( not ( = ?auto_798374 ?auto_798375 ) ) ( not ( = ?auto_798374 ?auto_798377 ) ) ( not ( = ?auto_798374 ?auto_798376 ) ) ( not ( = ?auto_798374 ?auto_798382 ) ) ( not ( = ?auto_798371 ?auto_798375 ) ) ( not ( = ?auto_798371 ?auto_798377 ) ) ( not ( = ?auto_798371 ?auto_798376 ) ) ( not ( = ?auto_798371 ?auto_798382 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_798375 ?auto_798377 ?auto_798376 )
      ( MAKE-6CRATE-VERIFY ?auto_798372 ?auto_798373 ?auto_798374 ?auto_798371 ?auto_798375 ?auto_798377 ?auto_798376 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_798436 - SURFACE
      ?auto_798437 - SURFACE
      ?auto_798438 - SURFACE
      ?auto_798435 - SURFACE
      ?auto_798439 - SURFACE
      ?auto_798441 - SURFACE
      ?auto_798440 - SURFACE
    )
    :vars
    (
      ?auto_798442 - HOIST
      ?auto_798447 - PLACE
      ?auto_798446 - PLACE
      ?auto_798445 - HOIST
      ?auto_798443 - SURFACE
      ?auto_798444 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_798442 ?auto_798447 ) ( IS-CRATE ?auto_798440 ) ( not ( = ?auto_798441 ?auto_798440 ) ) ( not ( = ?auto_798439 ?auto_798441 ) ) ( not ( = ?auto_798439 ?auto_798440 ) ) ( not ( = ?auto_798446 ?auto_798447 ) ) ( HOIST-AT ?auto_798445 ?auto_798446 ) ( not ( = ?auto_798442 ?auto_798445 ) ) ( AVAILABLE ?auto_798445 ) ( SURFACE-AT ?auto_798440 ?auto_798446 ) ( ON ?auto_798440 ?auto_798443 ) ( CLEAR ?auto_798440 ) ( not ( = ?auto_798441 ?auto_798443 ) ) ( not ( = ?auto_798440 ?auto_798443 ) ) ( not ( = ?auto_798439 ?auto_798443 ) ) ( TRUCK-AT ?auto_798444 ?auto_798447 ) ( SURFACE-AT ?auto_798439 ?auto_798447 ) ( CLEAR ?auto_798439 ) ( IS-CRATE ?auto_798441 ) ( AVAILABLE ?auto_798442 ) ( IN ?auto_798441 ?auto_798444 ) ( ON ?auto_798437 ?auto_798436 ) ( ON ?auto_798438 ?auto_798437 ) ( ON ?auto_798435 ?auto_798438 ) ( ON ?auto_798439 ?auto_798435 ) ( not ( = ?auto_798436 ?auto_798437 ) ) ( not ( = ?auto_798436 ?auto_798438 ) ) ( not ( = ?auto_798436 ?auto_798435 ) ) ( not ( = ?auto_798436 ?auto_798439 ) ) ( not ( = ?auto_798436 ?auto_798441 ) ) ( not ( = ?auto_798436 ?auto_798440 ) ) ( not ( = ?auto_798436 ?auto_798443 ) ) ( not ( = ?auto_798437 ?auto_798438 ) ) ( not ( = ?auto_798437 ?auto_798435 ) ) ( not ( = ?auto_798437 ?auto_798439 ) ) ( not ( = ?auto_798437 ?auto_798441 ) ) ( not ( = ?auto_798437 ?auto_798440 ) ) ( not ( = ?auto_798437 ?auto_798443 ) ) ( not ( = ?auto_798438 ?auto_798435 ) ) ( not ( = ?auto_798438 ?auto_798439 ) ) ( not ( = ?auto_798438 ?auto_798441 ) ) ( not ( = ?auto_798438 ?auto_798440 ) ) ( not ( = ?auto_798438 ?auto_798443 ) ) ( not ( = ?auto_798435 ?auto_798439 ) ) ( not ( = ?auto_798435 ?auto_798441 ) ) ( not ( = ?auto_798435 ?auto_798440 ) ) ( not ( = ?auto_798435 ?auto_798443 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_798439 ?auto_798441 ?auto_798440 )
      ( MAKE-6CRATE-VERIFY ?auto_798436 ?auto_798437 ?auto_798438 ?auto_798435 ?auto_798439 ?auto_798441 ?auto_798440 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_800392 - SURFACE
      ?auto_800393 - SURFACE
      ?auto_800394 - SURFACE
      ?auto_800391 - SURFACE
      ?auto_800395 - SURFACE
      ?auto_800397 - SURFACE
      ?auto_800396 - SURFACE
      ?auto_800398 - SURFACE
    )
    :vars
    (
      ?auto_800399 - HOIST
      ?auto_800400 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_800399 ?auto_800400 ) ( SURFACE-AT ?auto_800396 ?auto_800400 ) ( CLEAR ?auto_800396 ) ( LIFTING ?auto_800399 ?auto_800398 ) ( IS-CRATE ?auto_800398 ) ( not ( = ?auto_800396 ?auto_800398 ) ) ( ON ?auto_800393 ?auto_800392 ) ( ON ?auto_800394 ?auto_800393 ) ( ON ?auto_800391 ?auto_800394 ) ( ON ?auto_800395 ?auto_800391 ) ( ON ?auto_800397 ?auto_800395 ) ( ON ?auto_800396 ?auto_800397 ) ( not ( = ?auto_800392 ?auto_800393 ) ) ( not ( = ?auto_800392 ?auto_800394 ) ) ( not ( = ?auto_800392 ?auto_800391 ) ) ( not ( = ?auto_800392 ?auto_800395 ) ) ( not ( = ?auto_800392 ?auto_800397 ) ) ( not ( = ?auto_800392 ?auto_800396 ) ) ( not ( = ?auto_800392 ?auto_800398 ) ) ( not ( = ?auto_800393 ?auto_800394 ) ) ( not ( = ?auto_800393 ?auto_800391 ) ) ( not ( = ?auto_800393 ?auto_800395 ) ) ( not ( = ?auto_800393 ?auto_800397 ) ) ( not ( = ?auto_800393 ?auto_800396 ) ) ( not ( = ?auto_800393 ?auto_800398 ) ) ( not ( = ?auto_800394 ?auto_800391 ) ) ( not ( = ?auto_800394 ?auto_800395 ) ) ( not ( = ?auto_800394 ?auto_800397 ) ) ( not ( = ?auto_800394 ?auto_800396 ) ) ( not ( = ?auto_800394 ?auto_800398 ) ) ( not ( = ?auto_800391 ?auto_800395 ) ) ( not ( = ?auto_800391 ?auto_800397 ) ) ( not ( = ?auto_800391 ?auto_800396 ) ) ( not ( = ?auto_800391 ?auto_800398 ) ) ( not ( = ?auto_800395 ?auto_800397 ) ) ( not ( = ?auto_800395 ?auto_800396 ) ) ( not ( = ?auto_800395 ?auto_800398 ) ) ( not ( = ?auto_800397 ?auto_800396 ) ) ( not ( = ?auto_800397 ?auto_800398 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_800396 ?auto_800398 )
      ( MAKE-7CRATE-VERIFY ?auto_800392 ?auto_800393 ?auto_800394 ?auto_800391 ?auto_800395 ?auto_800397 ?auto_800396 ?auto_800398 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_800447 - SURFACE
      ?auto_800448 - SURFACE
      ?auto_800449 - SURFACE
      ?auto_800446 - SURFACE
      ?auto_800450 - SURFACE
      ?auto_800452 - SURFACE
      ?auto_800451 - SURFACE
      ?auto_800453 - SURFACE
    )
    :vars
    (
      ?auto_800455 - HOIST
      ?auto_800456 - PLACE
      ?auto_800454 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_800455 ?auto_800456 ) ( SURFACE-AT ?auto_800451 ?auto_800456 ) ( CLEAR ?auto_800451 ) ( IS-CRATE ?auto_800453 ) ( not ( = ?auto_800451 ?auto_800453 ) ) ( TRUCK-AT ?auto_800454 ?auto_800456 ) ( AVAILABLE ?auto_800455 ) ( IN ?auto_800453 ?auto_800454 ) ( ON ?auto_800451 ?auto_800452 ) ( not ( = ?auto_800452 ?auto_800451 ) ) ( not ( = ?auto_800452 ?auto_800453 ) ) ( ON ?auto_800448 ?auto_800447 ) ( ON ?auto_800449 ?auto_800448 ) ( ON ?auto_800446 ?auto_800449 ) ( ON ?auto_800450 ?auto_800446 ) ( ON ?auto_800452 ?auto_800450 ) ( not ( = ?auto_800447 ?auto_800448 ) ) ( not ( = ?auto_800447 ?auto_800449 ) ) ( not ( = ?auto_800447 ?auto_800446 ) ) ( not ( = ?auto_800447 ?auto_800450 ) ) ( not ( = ?auto_800447 ?auto_800452 ) ) ( not ( = ?auto_800447 ?auto_800451 ) ) ( not ( = ?auto_800447 ?auto_800453 ) ) ( not ( = ?auto_800448 ?auto_800449 ) ) ( not ( = ?auto_800448 ?auto_800446 ) ) ( not ( = ?auto_800448 ?auto_800450 ) ) ( not ( = ?auto_800448 ?auto_800452 ) ) ( not ( = ?auto_800448 ?auto_800451 ) ) ( not ( = ?auto_800448 ?auto_800453 ) ) ( not ( = ?auto_800449 ?auto_800446 ) ) ( not ( = ?auto_800449 ?auto_800450 ) ) ( not ( = ?auto_800449 ?auto_800452 ) ) ( not ( = ?auto_800449 ?auto_800451 ) ) ( not ( = ?auto_800449 ?auto_800453 ) ) ( not ( = ?auto_800446 ?auto_800450 ) ) ( not ( = ?auto_800446 ?auto_800452 ) ) ( not ( = ?auto_800446 ?auto_800451 ) ) ( not ( = ?auto_800446 ?auto_800453 ) ) ( not ( = ?auto_800450 ?auto_800452 ) ) ( not ( = ?auto_800450 ?auto_800451 ) ) ( not ( = ?auto_800450 ?auto_800453 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_800452 ?auto_800451 ?auto_800453 )
      ( MAKE-7CRATE-VERIFY ?auto_800447 ?auto_800448 ?auto_800449 ?auto_800446 ?auto_800450 ?auto_800452 ?auto_800451 ?auto_800453 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_800510 - SURFACE
      ?auto_800511 - SURFACE
      ?auto_800512 - SURFACE
      ?auto_800509 - SURFACE
      ?auto_800513 - SURFACE
      ?auto_800515 - SURFACE
      ?auto_800514 - SURFACE
      ?auto_800516 - SURFACE
    )
    :vars
    (
      ?auto_800518 - HOIST
      ?auto_800520 - PLACE
      ?auto_800517 - TRUCK
      ?auto_800519 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_800518 ?auto_800520 ) ( SURFACE-AT ?auto_800514 ?auto_800520 ) ( CLEAR ?auto_800514 ) ( IS-CRATE ?auto_800516 ) ( not ( = ?auto_800514 ?auto_800516 ) ) ( AVAILABLE ?auto_800518 ) ( IN ?auto_800516 ?auto_800517 ) ( ON ?auto_800514 ?auto_800515 ) ( not ( = ?auto_800515 ?auto_800514 ) ) ( not ( = ?auto_800515 ?auto_800516 ) ) ( TRUCK-AT ?auto_800517 ?auto_800519 ) ( not ( = ?auto_800519 ?auto_800520 ) ) ( ON ?auto_800511 ?auto_800510 ) ( ON ?auto_800512 ?auto_800511 ) ( ON ?auto_800509 ?auto_800512 ) ( ON ?auto_800513 ?auto_800509 ) ( ON ?auto_800515 ?auto_800513 ) ( not ( = ?auto_800510 ?auto_800511 ) ) ( not ( = ?auto_800510 ?auto_800512 ) ) ( not ( = ?auto_800510 ?auto_800509 ) ) ( not ( = ?auto_800510 ?auto_800513 ) ) ( not ( = ?auto_800510 ?auto_800515 ) ) ( not ( = ?auto_800510 ?auto_800514 ) ) ( not ( = ?auto_800510 ?auto_800516 ) ) ( not ( = ?auto_800511 ?auto_800512 ) ) ( not ( = ?auto_800511 ?auto_800509 ) ) ( not ( = ?auto_800511 ?auto_800513 ) ) ( not ( = ?auto_800511 ?auto_800515 ) ) ( not ( = ?auto_800511 ?auto_800514 ) ) ( not ( = ?auto_800511 ?auto_800516 ) ) ( not ( = ?auto_800512 ?auto_800509 ) ) ( not ( = ?auto_800512 ?auto_800513 ) ) ( not ( = ?auto_800512 ?auto_800515 ) ) ( not ( = ?auto_800512 ?auto_800514 ) ) ( not ( = ?auto_800512 ?auto_800516 ) ) ( not ( = ?auto_800509 ?auto_800513 ) ) ( not ( = ?auto_800509 ?auto_800515 ) ) ( not ( = ?auto_800509 ?auto_800514 ) ) ( not ( = ?auto_800509 ?auto_800516 ) ) ( not ( = ?auto_800513 ?auto_800515 ) ) ( not ( = ?auto_800513 ?auto_800514 ) ) ( not ( = ?auto_800513 ?auto_800516 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_800515 ?auto_800514 ?auto_800516 )
      ( MAKE-7CRATE-VERIFY ?auto_800510 ?auto_800511 ?auto_800512 ?auto_800509 ?auto_800513 ?auto_800515 ?auto_800514 ?auto_800516 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_800580 - SURFACE
      ?auto_800581 - SURFACE
      ?auto_800582 - SURFACE
      ?auto_800579 - SURFACE
      ?auto_800583 - SURFACE
      ?auto_800585 - SURFACE
      ?auto_800584 - SURFACE
      ?auto_800586 - SURFACE
    )
    :vars
    (
      ?auto_800587 - HOIST
      ?auto_800589 - PLACE
      ?auto_800591 - TRUCK
      ?auto_800588 - PLACE
      ?auto_800590 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_800587 ?auto_800589 ) ( SURFACE-AT ?auto_800584 ?auto_800589 ) ( CLEAR ?auto_800584 ) ( IS-CRATE ?auto_800586 ) ( not ( = ?auto_800584 ?auto_800586 ) ) ( AVAILABLE ?auto_800587 ) ( ON ?auto_800584 ?auto_800585 ) ( not ( = ?auto_800585 ?auto_800584 ) ) ( not ( = ?auto_800585 ?auto_800586 ) ) ( TRUCK-AT ?auto_800591 ?auto_800588 ) ( not ( = ?auto_800588 ?auto_800589 ) ) ( HOIST-AT ?auto_800590 ?auto_800588 ) ( LIFTING ?auto_800590 ?auto_800586 ) ( not ( = ?auto_800587 ?auto_800590 ) ) ( ON ?auto_800581 ?auto_800580 ) ( ON ?auto_800582 ?auto_800581 ) ( ON ?auto_800579 ?auto_800582 ) ( ON ?auto_800583 ?auto_800579 ) ( ON ?auto_800585 ?auto_800583 ) ( not ( = ?auto_800580 ?auto_800581 ) ) ( not ( = ?auto_800580 ?auto_800582 ) ) ( not ( = ?auto_800580 ?auto_800579 ) ) ( not ( = ?auto_800580 ?auto_800583 ) ) ( not ( = ?auto_800580 ?auto_800585 ) ) ( not ( = ?auto_800580 ?auto_800584 ) ) ( not ( = ?auto_800580 ?auto_800586 ) ) ( not ( = ?auto_800581 ?auto_800582 ) ) ( not ( = ?auto_800581 ?auto_800579 ) ) ( not ( = ?auto_800581 ?auto_800583 ) ) ( not ( = ?auto_800581 ?auto_800585 ) ) ( not ( = ?auto_800581 ?auto_800584 ) ) ( not ( = ?auto_800581 ?auto_800586 ) ) ( not ( = ?auto_800582 ?auto_800579 ) ) ( not ( = ?auto_800582 ?auto_800583 ) ) ( not ( = ?auto_800582 ?auto_800585 ) ) ( not ( = ?auto_800582 ?auto_800584 ) ) ( not ( = ?auto_800582 ?auto_800586 ) ) ( not ( = ?auto_800579 ?auto_800583 ) ) ( not ( = ?auto_800579 ?auto_800585 ) ) ( not ( = ?auto_800579 ?auto_800584 ) ) ( not ( = ?auto_800579 ?auto_800586 ) ) ( not ( = ?auto_800583 ?auto_800585 ) ) ( not ( = ?auto_800583 ?auto_800584 ) ) ( not ( = ?auto_800583 ?auto_800586 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_800585 ?auto_800584 ?auto_800586 )
      ( MAKE-7CRATE-VERIFY ?auto_800580 ?auto_800581 ?auto_800582 ?auto_800579 ?auto_800583 ?auto_800585 ?auto_800584 ?auto_800586 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_800657 - SURFACE
      ?auto_800658 - SURFACE
      ?auto_800659 - SURFACE
      ?auto_800656 - SURFACE
      ?auto_800660 - SURFACE
      ?auto_800662 - SURFACE
      ?auto_800661 - SURFACE
      ?auto_800663 - SURFACE
    )
    :vars
    (
      ?auto_800666 - HOIST
      ?auto_800669 - PLACE
      ?auto_800665 - TRUCK
      ?auto_800667 - PLACE
      ?auto_800664 - HOIST
      ?auto_800668 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_800666 ?auto_800669 ) ( SURFACE-AT ?auto_800661 ?auto_800669 ) ( CLEAR ?auto_800661 ) ( IS-CRATE ?auto_800663 ) ( not ( = ?auto_800661 ?auto_800663 ) ) ( AVAILABLE ?auto_800666 ) ( ON ?auto_800661 ?auto_800662 ) ( not ( = ?auto_800662 ?auto_800661 ) ) ( not ( = ?auto_800662 ?auto_800663 ) ) ( TRUCK-AT ?auto_800665 ?auto_800667 ) ( not ( = ?auto_800667 ?auto_800669 ) ) ( HOIST-AT ?auto_800664 ?auto_800667 ) ( not ( = ?auto_800666 ?auto_800664 ) ) ( AVAILABLE ?auto_800664 ) ( SURFACE-AT ?auto_800663 ?auto_800667 ) ( ON ?auto_800663 ?auto_800668 ) ( CLEAR ?auto_800663 ) ( not ( = ?auto_800661 ?auto_800668 ) ) ( not ( = ?auto_800663 ?auto_800668 ) ) ( not ( = ?auto_800662 ?auto_800668 ) ) ( ON ?auto_800658 ?auto_800657 ) ( ON ?auto_800659 ?auto_800658 ) ( ON ?auto_800656 ?auto_800659 ) ( ON ?auto_800660 ?auto_800656 ) ( ON ?auto_800662 ?auto_800660 ) ( not ( = ?auto_800657 ?auto_800658 ) ) ( not ( = ?auto_800657 ?auto_800659 ) ) ( not ( = ?auto_800657 ?auto_800656 ) ) ( not ( = ?auto_800657 ?auto_800660 ) ) ( not ( = ?auto_800657 ?auto_800662 ) ) ( not ( = ?auto_800657 ?auto_800661 ) ) ( not ( = ?auto_800657 ?auto_800663 ) ) ( not ( = ?auto_800657 ?auto_800668 ) ) ( not ( = ?auto_800658 ?auto_800659 ) ) ( not ( = ?auto_800658 ?auto_800656 ) ) ( not ( = ?auto_800658 ?auto_800660 ) ) ( not ( = ?auto_800658 ?auto_800662 ) ) ( not ( = ?auto_800658 ?auto_800661 ) ) ( not ( = ?auto_800658 ?auto_800663 ) ) ( not ( = ?auto_800658 ?auto_800668 ) ) ( not ( = ?auto_800659 ?auto_800656 ) ) ( not ( = ?auto_800659 ?auto_800660 ) ) ( not ( = ?auto_800659 ?auto_800662 ) ) ( not ( = ?auto_800659 ?auto_800661 ) ) ( not ( = ?auto_800659 ?auto_800663 ) ) ( not ( = ?auto_800659 ?auto_800668 ) ) ( not ( = ?auto_800656 ?auto_800660 ) ) ( not ( = ?auto_800656 ?auto_800662 ) ) ( not ( = ?auto_800656 ?auto_800661 ) ) ( not ( = ?auto_800656 ?auto_800663 ) ) ( not ( = ?auto_800656 ?auto_800668 ) ) ( not ( = ?auto_800660 ?auto_800662 ) ) ( not ( = ?auto_800660 ?auto_800661 ) ) ( not ( = ?auto_800660 ?auto_800663 ) ) ( not ( = ?auto_800660 ?auto_800668 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_800662 ?auto_800661 ?auto_800663 )
      ( MAKE-7CRATE-VERIFY ?auto_800657 ?auto_800658 ?auto_800659 ?auto_800656 ?auto_800660 ?auto_800662 ?auto_800661 ?auto_800663 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_800735 - SURFACE
      ?auto_800736 - SURFACE
      ?auto_800737 - SURFACE
      ?auto_800734 - SURFACE
      ?auto_800738 - SURFACE
      ?auto_800740 - SURFACE
      ?auto_800739 - SURFACE
      ?auto_800741 - SURFACE
    )
    :vars
    (
      ?auto_800745 - HOIST
      ?auto_800746 - PLACE
      ?auto_800747 - PLACE
      ?auto_800743 - HOIST
      ?auto_800744 - SURFACE
      ?auto_800742 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_800745 ?auto_800746 ) ( SURFACE-AT ?auto_800739 ?auto_800746 ) ( CLEAR ?auto_800739 ) ( IS-CRATE ?auto_800741 ) ( not ( = ?auto_800739 ?auto_800741 ) ) ( AVAILABLE ?auto_800745 ) ( ON ?auto_800739 ?auto_800740 ) ( not ( = ?auto_800740 ?auto_800739 ) ) ( not ( = ?auto_800740 ?auto_800741 ) ) ( not ( = ?auto_800747 ?auto_800746 ) ) ( HOIST-AT ?auto_800743 ?auto_800747 ) ( not ( = ?auto_800745 ?auto_800743 ) ) ( AVAILABLE ?auto_800743 ) ( SURFACE-AT ?auto_800741 ?auto_800747 ) ( ON ?auto_800741 ?auto_800744 ) ( CLEAR ?auto_800741 ) ( not ( = ?auto_800739 ?auto_800744 ) ) ( not ( = ?auto_800741 ?auto_800744 ) ) ( not ( = ?auto_800740 ?auto_800744 ) ) ( TRUCK-AT ?auto_800742 ?auto_800746 ) ( ON ?auto_800736 ?auto_800735 ) ( ON ?auto_800737 ?auto_800736 ) ( ON ?auto_800734 ?auto_800737 ) ( ON ?auto_800738 ?auto_800734 ) ( ON ?auto_800740 ?auto_800738 ) ( not ( = ?auto_800735 ?auto_800736 ) ) ( not ( = ?auto_800735 ?auto_800737 ) ) ( not ( = ?auto_800735 ?auto_800734 ) ) ( not ( = ?auto_800735 ?auto_800738 ) ) ( not ( = ?auto_800735 ?auto_800740 ) ) ( not ( = ?auto_800735 ?auto_800739 ) ) ( not ( = ?auto_800735 ?auto_800741 ) ) ( not ( = ?auto_800735 ?auto_800744 ) ) ( not ( = ?auto_800736 ?auto_800737 ) ) ( not ( = ?auto_800736 ?auto_800734 ) ) ( not ( = ?auto_800736 ?auto_800738 ) ) ( not ( = ?auto_800736 ?auto_800740 ) ) ( not ( = ?auto_800736 ?auto_800739 ) ) ( not ( = ?auto_800736 ?auto_800741 ) ) ( not ( = ?auto_800736 ?auto_800744 ) ) ( not ( = ?auto_800737 ?auto_800734 ) ) ( not ( = ?auto_800737 ?auto_800738 ) ) ( not ( = ?auto_800737 ?auto_800740 ) ) ( not ( = ?auto_800737 ?auto_800739 ) ) ( not ( = ?auto_800737 ?auto_800741 ) ) ( not ( = ?auto_800737 ?auto_800744 ) ) ( not ( = ?auto_800734 ?auto_800738 ) ) ( not ( = ?auto_800734 ?auto_800740 ) ) ( not ( = ?auto_800734 ?auto_800739 ) ) ( not ( = ?auto_800734 ?auto_800741 ) ) ( not ( = ?auto_800734 ?auto_800744 ) ) ( not ( = ?auto_800738 ?auto_800740 ) ) ( not ( = ?auto_800738 ?auto_800739 ) ) ( not ( = ?auto_800738 ?auto_800741 ) ) ( not ( = ?auto_800738 ?auto_800744 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_800740 ?auto_800739 ?auto_800741 )
      ( MAKE-7CRATE-VERIFY ?auto_800735 ?auto_800736 ?auto_800737 ?auto_800734 ?auto_800738 ?auto_800740 ?auto_800739 ?auto_800741 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_800813 - SURFACE
      ?auto_800814 - SURFACE
      ?auto_800815 - SURFACE
      ?auto_800812 - SURFACE
      ?auto_800816 - SURFACE
      ?auto_800818 - SURFACE
      ?auto_800817 - SURFACE
      ?auto_800819 - SURFACE
    )
    :vars
    (
      ?auto_800821 - HOIST
      ?auto_800825 - PLACE
      ?auto_800820 - PLACE
      ?auto_800822 - HOIST
      ?auto_800824 - SURFACE
      ?auto_800823 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_800821 ?auto_800825 ) ( IS-CRATE ?auto_800819 ) ( not ( = ?auto_800817 ?auto_800819 ) ) ( not ( = ?auto_800818 ?auto_800817 ) ) ( not ( = ?auto_800818 ?auto_800819 ) ) ( not ( = ?auto_800820 ?auto_800825 ) ) ( HOIST-AT ?auto_800822 ?auto_800820 ) ( not ( = ?auto_800821 ?auto_800822 ) ) ( AVAILABLE ?auto_800822 ) ( SURFACE-AT ?auto_800819 ?auto_800820 ) ( ON ?auto_800819 ?auto_800824 ) ( CLEAR ?auto_800819 ) ( not ( = ?auto_800817 ?auto_800824 ) ) ( not ( = ?auto_800819 ?auto_800824 ) ) ( not ( = ?auto_800818 ?auto_800824 ) ) ( TRUCK-AT ?auto_800823 ?auto_800825 ) ( SURFACE-AT ?auto_800818 ?auto_800825 ) ( CLEAR ?auto_800818 ) ( LIFTING ?auto_800821 ?auto_800817 ) ( IS-CRATE ?auto_800817 ) ( ON ?auto_800814 ?auto_800813 ) ( ON ?auto_800815 ?auto_800814 ) ( ON ?auto_800812 ?auto_800815 ) ( ON ?auto_800816 ?auto_800812 ) ( ON ?auto_800818 ?auto_800816 ) ( not ( = ?auto_800813 ?auto_800814 ) ) ( not ( = ?auto_800813 ?auto_800815 ) ) ( not ( = ?auto_800813 ?auto_800812 ) ) ( not ( = ?auto_800813 ?auto_800816 ) ) ( not ( = ?auto_800813 ?auto_800818 ) ) ( not ( = ?auto_800813 ?auto_800817 ) ) ( not ( = ?auto_800813 ?auto_800819 ) ) ( not ( = ?auto_800813 ?auto_800824 ) ) ( not ( = ?auto_800814 ?auto_800815 ) ) ( not ( = ?auto_800814 ?auto_800812 ) ) ( not ( = ?auto_800814 ?auto_800816 ) ) ( not ( = ?auto_800814 ?auto_800818 ) ) ( not ( = ?auto_800814 ?auto_800817 ) ) ( not ( = ?auto_800814 ?auto_800819 ) ) ( not ( = ?auto_800814 ?auto_800824 ) ) ( not ( = ?auto_800815 ?auto_800812 ) ) ( not ( = ?auto_800815 ?auto_800816 ) ) ( not ( = ?auto_800815 ?auto_800818 ) ) ( not ( = ?auto_800815 ?auto_800817 ) ) ( not ( = ?auto_800815 ?auto_800819 ) ) ( not ( = ?auto_800815 ?auto_800824 ) ) ( not ( = ?auto_800812 ?auto_800816 ) ) ( not ( = ?auto_800812 ?auto_800818 ) ) ( not ( = ?auto_800812 ?auto_800817 ) ) ( not ( = ?auto_800812 ?auto_800819 ) ) ( not ( = ?auto_800812 ?auto_800824 ) ) ( not ( = ?auto_800816 ?auto_800818 ) ) ( not ( = ?auto_800816 ?auto_800817 ) ) ( not ( = ?auto_800816 ?auto_800819 ) ) ( not ( = ?auto_800816 ?auto_800824 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_800818 ?auto_800817 ?auto_800819 )
      ( MAKE-7CRATE-VERIFY ?auto_800813 ?auto_800814 ?auto_800815 ?auto_800812 ?auto_800816 ?auto_800818 ?auto_800817 ?auto_800819 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_800891 - SURFACE
      ?auto_800892 - SURFACE
      ?auto_800893 - SURFACE
      ?auto_800890 - SURFACE
      ?auto_800894 - SURFACE
      ?auto_800896 - SURFACE
      ?auto_800895 - SURFACE
      ?auto_800897 - SURFACE
    )
    :vars
    (
      ?auto_800902 - HOIST
      ?auto_800898 - PLACE
      ?auto_800901 - PLACE
      ?auto_800903 - HOIST
      ?auto_800900 - SURFACE
      ?auto_800899 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_800902 ?auto_800898 ) ( IS-CRATE ?auto_800897 ) ( not ( = ?auto_800895 ?auto_800897 ) ) ( not ( = ?auto_800896 ?auto_800895 ) ) ( not ( = ?auto_800896 ?auto_800897 ) ) ( not ( = ?auto_800901 ?auto_800898 ) ) ( HOIST-AT ?auto_800903 ?auto_800901 ) ( not ( = ?auto_800902 ?auto_800903 ) ) ( AVAILABLE ?auto_800903 ) ( SURFACE-AT ?auto_800897 ?auto_800901 ) ( ON ?auto_800897 ?auto_800900 ) ( CLEAR ?auto_800897 ) ( not ( = ?auto_800895 ?auto_800900 ) ) ( not ( = ?auto_800897 ?auto_800900 ) ) ( not ( = ?auto_800896 ?auto_800900 ) ) ( TRUCK-AT ?auto_800899 ?auto_800898 ) ( SURFACE-AT ?auto_800896 ?auto_800898 ) ( CLEAR ?auto_800896 ) ( IS-CRATE ?auto_800895 ) ( AVAILABLE ?auto_800902 ) ( IN ?auto_800895 ?auto_800899 ) ( ON ?auto_800892 ?auto_800891 ) ( ON ?auto_800893 ?auto_800892 ) ( ON ?auto_800890 ?auto_800893 ) ( ON ?auto_800894 ?auto_800890 ) ( ON ?auto_800896 ?auto_800894 ) ( not ( = ?auto_800891 ?auto_800892 ) ) ( not ( = ?auto_800891 ?auto_800893 ) ) ( not ( = ?auto_800891 ?auto_800890 ) ) ( not ( = ?auto_800891 ?auto_800894 ) ) ( not ( = ?auto_800891 ?auto_800896 ) ) ( not ( = ?auto_800891 ?auto_800895 ) ) ( not ( = ?auto_800891 ?auto_800897 ) ) ( not ( = ?auto_800891 ?auto_800900 ) ) ( not ( = ?auto_800892 ?auto_800893 ) ) ( not ( = ?auto_800892 ?auto_800890 ) ) ( not ( = ?auto_800892 ?auto_800894 ) ) ( not ( = ?auto_800892 ?auto_800896 ) ) ( not ( = ?auto_800892 ?auto_800895 ) ) ( not ( = ?auto_800892 ?auto_800897 ) ) ( not ( = ?auto_800892 ?auto_800900 ) ) ( not ( = ?auto_800893 ?auto_800890 ) ) ( not ( = ?auto_800893 ?auto_800894 ) ) ( not ( = ?auto_800893 ?auto_800896 ) ) ( not ( = ?auto_800893 ?auto_800895 ) ) ( not ( = ?auto_800893 ?auto_800897 ) ) ( not ( = ?auto_800893 ?auto_800900 ) ) ( not ( = ?auto_800890 ?auto_800894 ) ) ( not ( = ?auto_800890 ?auto_800896 ) ) ( not ( = ?auto_800890 ?auto_800895 ) ) ( not ( = ?auto_800890 ?auto_800897 ) ) ( not ( = ?auto_800890 ?auto_800900 ) ) ( not ( = ?auto_800894 ?auto_800896 ) ) ( not ( = ?auto_800894 ?auto_800895 ) ) ( not ( = ?auto_800894 ?auto_800897 ) ) ( not ( = ?auto_800894 ?auto_800900 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_800896 ?auto_800895 ?auto_800897 )
      ( MAKE-7CRATE-VERIFY ?auto_800891 ?auto_800892 ?auto_800893 ?auto_800890 ?auto_800894 ?auto_800896 ?auto_800895 ?auto_800897 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_803810 - SURFACE
      ?auto_803811 - SURFACE
      ?auto_803812 - SURFACE
      ?auto_803809 - SURFACE
      ?auto_803813 - SURFACE
      ?auto_803815 - SURFACE
      ?auto_803814 - SURFACE
      ?auto_803816 - SURFACE
      ?auto_803817 - SURFACE
    )
    :vars
    (
      ?auto_803818 - HOIST
      ?auto_803819 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_803818 ?auto_803819 ) ( SURFACE-AT ?auto_803816 ?auto_803819 ) ( CLEAR ?auto_803816 ) ( LIFTING ?auto_803818 ?auto_803817 ) ( IS-CRATE ?auto_803817 ) ( not ( = ?auto_803816 ?auto_803817 ) ) ( ON ?auto_803811 ?auto_803810 ) ( ON ?auto_803812 ?auto_803811 ) ( ON ?auto_803809 ?auto_803812 ) ( ON ?auto_803813 ?auto_803809 ) ( ON ?auto_803815 ?auto_803813 ) ( ON ?auto_803814 ?auto_803815 ) ( ON ?auto_803816 ?auto_803814 ) ( not ( = ?auto_803810 ?auto_803811 ) ) ( not ( = ?auto_803810 ?auto_803812 ) ) ( not ( = ?auto_803810 ?auto_803809 ) ) ( not ( = ?auto_803810 ?auto_803813 ) ) ( not ( = ?auto_803810 ?auto_803815 ) ) ( not ( = ?auto_803810 ?auto_803814 ) ) ( not ( = ?auto_803810 ?auto_803816 ) ) ( not ( = ?auto_803810 ?auto_803817 ) ) ( not ( = ?auto_803811 ?auto_803812 ) ) ( not ( = ?auto_803811 ?auto_803809 ) ) ( not ( = ?auto_803811 ?auto_803813 ) ) ( not ( = ?auto_803811 ?auto_803815 ) ) ( not ( = ?auto_803811 ?auto_803814 ) ) ( not ( = ?auto_803811 ?auto_803816 ) ) ( not ( = ?auto_803811 ?auto_803817 ) ) ( not ( = ?auto_803812 ?auto_803809 ) ) ( not ( = ?auto_803812 ?auto_803813 ) ) ( not ( = ?auto_803812 ?auto_803815 ) ) ( not ( = ?auto_803812 ?auto_803814 ) ) ( not ( = ?auto_803812 ?auto_803816 ) ) ( not ( = ?auto_803812 ?auto_803817 ) ) ( not ( = ?auto_803809 ?auto_803813 ) ) ( not ( = ?auto_803809 ?auto_803815 ) ) ( not ( = ?auto_803809 ?auto_803814 ) ) ( not ( = ?auto_803809 ?auto_803816 ) ) ( not ( = ?auto_803809 ?auto_803817 ) ) ( not ( = ?auto_803813 ?auto_803815 ) ) ( not ( = ?auto_803813 ?auto_803814 ) ) ( not ( = ?auto_803813 ?auto_803816 ) ) ( not ( = ?auto_803813 ?auto_803817 ) ) ( not ( = ?auto_803815 ?auto_803814 ) ) ( not ( = ?auto_803815 ?auto_803816 ) ) ( not ( = ?auto_803815 ?auto_803817 ) ) ( not ( = ?auto_803814 ?auto_803816 ) ) ( not ( = ?auto_803814 ?auto_803817 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_803816 ?auto_803817 )
      ( MAKE-8CRATE-VERIFY ?auto_803810 ?auto_803811 ?auto_803812 ?auto_803809 ?auto_803813 ?auto_803815 ?auto_803814 ?auto_803816 ?auto_803817 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_803877 - SURFACE
      ?auto_803878 - SURFACE
      ?auto_803879 - SURFACE
      ?auto_803876 - SURFACE
      ?auto_803880 - SURFACE
      ?auto_803882 - SURFACE
      ?auto_803881 - SURFACE
      ?auto_803883 - SURFACE
      ?auto_803884 - SURFACE
    )
    :vars
    (
      ?auto_803887 - HOIST
      ?auto_803886 - PLACE
      ?auto_803885 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_803887 ?auto_803886 ) ( SURFACE-AT ?auto_803883 ?auto_803886 ) ( CLEAR ?auto_803883 ) ( IS-CRATE ?auto_803884 ) ( not ( = ?auto_803883 ?auto_803884 ) ) ( TRUCK-AT ?auto_803885 ?auto_803886 ) ( AVAILABLE ?auto_803887 ) ( IN ?auto_803884 ?auto_803885 ) ( ON ?auto_803883 ?auto_803881 ) ( not ( = ?auto_803881 ?auto_803883 ) ) ( not ( = ?auto_803881 ?auto_803884 ) ) ( ON ?auto_803878 ?auto_803877 ) ( ON ?auto_803879 ?auto_803878 ) ( ON ?auto_803876 ?auto_803879 ) ( ON ?auto_803880 ?auto_803876 ) ( ON ?auto_803882 ?auto_803880 ) ( ON ?auto_803881 ?auto_803882 ) ( not ( = ?auto_803877 ?auto_803878 ) ) ( not ( = ?auto_803877 ?auto_803879 ) ) ( not ( = ?auto_803877 ?auto_803876 ) ) ( not ( = ?auto_803877 ?auto_803880 ) ) ( not ( = ?auto_803877 ?auto_803882 ) ) ( not ( = ?auto_803877 ?auto_803881 ) ) ( not ( = ?auto_803877 ?auto_803883 ) ) ( not ( = ?auto_803877 ?auto_803884 ) ) ( not ( = ?auto_803878 ?auto_803879 ) ) ( not ( = ?auto_803878 ?auto_803876 ) ) ( not ( = ?auto_803878 ?auto_803880 ) ) ( not ( = ?auto_803878 ?auto_803882 ) ) ( not ( = ?auto_803878 ?auto_803881 ) ) ( not ( = ?auto_803878 ?auto_803883 ) ) ( not ( = ?auto_803878 ?auto_803884 ) ) ( not ( = ?auto_803879 ?auto_803876 ) ) ( not ( = ?auto_803879 ?auto_803880 ) ) ( not ( = ?auto_803879 ?auto_803882 ) ) ( not ( = ?auto_803879 ?auto_803881 ) ) ( not ( = ?auto_803879 ?auto_803883 ) ) ( not ( = ?auto_803879 ?auto_803884 ) ) ( not ( = ?auto_803876 ?auto_803880 ) ) ( not ( = ?auto_803876 ?auto_803882 ) ) ( not ( = ?auto_803876 ?auto_803881 ) ) ( not ( = ?auto_803876 ?auto_803883 ) ) ( not ( = ?auto_803876 ?auto_803884 ) ) ( not ( = ?auto_803880 ?auto_803882 ) ) ( not ( = ?auto_803880 ?auto_803881 ) ) ( not ( = ?auto_803880 ?auto_803883 ) ) ( not ( = ?auto_803880 ?auto_803884 ) ) ( not ( = ?auto_803882 ?auto_803881 ) ) ( not ( = ?auto_803882 ?auto_803883 ) ) ( not ( = ?auto_803882 ?auto_803884 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_803881 ?auto_803883 ?auto_803884 )
      ( MAKE-8CRATE-VERIFY ?auto_803877 ?auto_803878 ?auto_803879 ?auto_803876 ?auto_803880 ?auto_803882 ?auto_803881 ?auto_803883 ?auto_803884 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_803953 - SURFACE
      ?auto_803954 - SURFACE
      ?auto_803955 - SURFACE
      ?auto_803952 - SURFACE
      ?auto_803956 - SURFACE
      ?auto_803958 - SURFACE
      ?auto_803957 - SURFACE
      ?auto_803959 - SURFACE
      ?auto_803960 - SURFACE
    )
    :vars
    (
      ?auto_803962 - HOIST
      ?auto_803961 - PLACE
      ?auto_803964 - TRUCK
      ?auto_803963 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_803962 ?auto_803961 ) ( SURFACE-AT ?auto_803959 ?auto_803961 ) ( CLEAR ?auto_803959 ) ( IS-CRATE ?auto_803960 ) ( not ( = ?auto_803959 ?auto_803960 ) ) ( AVAILABLE ?auto_803962 ) ( IN ?auto_803960 ?auto_803964 ) ( ON ?auto_803959 ?auto_803957 ) ( not ( = ?auto_803957 ?auto_803959 ) ) ( not ( = ?auto_803957 ?auto_803960 ) ) ( TRUCK-AT ?auto_803964 ?auto_803963 ) ( not ( = ?auto_803963 ?auto_803961 ) ) ( ON ?auto_803954 ?auto_803953 ) ( ON ?auto_803955 ?auto_803954 ) ( ON ?auto_803952 ?auto_803955 ) ( ON ?auto_803956 ?auto_803952 ) ( ON ?auto_803958 ?auto_803956 ) ( ON ?auto_803957 ?auto_803958 ) ( not ( = ?auto_803953 ?auto_803954 ) ) ( not ( = ?auto_803953 ?auto_803955 ) ) ( not ( = ?auto_803953 ?auto_803952 ) ) ( not ( = ?auto_803953 ?auto_803956 ) ) ( not ( = ?auto_803953 ?auto_803958 ) ) ( not ( = ?auto_803953 ?auto_803957 ) ) ( not ( = ?auto_803953 ?auto_803959 ) ) ( not ( = ?auto_803953 ?auto_803960 ) ) ( not ( = ?auto_803954 ?auto_803955 ) ) ( not ( = ?auto_803954 ?auto_803952 ) ) ( not ( = ?auto_803954 ?auto_803956 ) ) ( not ( = ?auto_803954 ?auto_803958 ) ) ( not ( = ?auto_803954 ?auto_803957 ) ) ( not ( = ?auto_803954 ?auto_803959 ) ) ( not ( = ?auto_803954 ?auto_803960 ) ) ( not ( = ?auto_803955 ?auto_803952 ) ) ( not ( = ?auto_803955 ?auto_803956 ) ) ( not ( = ?auto_803955 ?auto_803958 ) ) ( not ( = ?auto_803955 ?auto_803957 ) ) ( not ( = ?auto_803955 ?auto_803959 ) ) ( not ( = ?auto_803955 ?auto_803960 ) ) ( not ( = ?auto_803952 ?auto_803956 ) ) ( not ( = ?auto_803952 ?auto_803958 ) ) ( not ( = ?auto_803952 ?auto_803957 ) ) ( not ( = ?auto_803952 ?auto_803959 ) ) ( not ( = ?auto_803952 ?auto_803960 ) ) ( not ( = ?auto_803956 ?auto_803958 ) ) ( not ( = ?auto_803956 ?auto_803957 ) ) ( not ( = ?auto_803956 ?auto_803959 ) ) ( not ( = ?auto_803956 ?auto_803960 ) ) ( not ( = ?auto_803958 ?auto_803957 ) ) ( not ( = ?auto_803958 ?auto_803959 ) ) ( not ( = ?auto_803958 ?auto_803960 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_803957 ?auto_803959 ?auto_803960 )
      ( MAKE-8CRATE-VERIFY ?auto_803953 ?auto_803954 ?auto_803955 ?auto_803952 ?auto_803956 ?auto_803958 ?auto_803957 ?auto_803959 ?auto_803960 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_804037 - SURFACE
      ?auto_804038 - SURFACE
      ?auto_804039 - SURFACE
      ?auto_804036 - SURFACE
      ?auto_804040 - SURFACE
      ?auto_804042 - SURFACE
      ?auto_804041 - SURFACE
      ?auto_804043 - SURFACE
      ?auto_804044 - SURFACE
    )
    :vars
    (
      ?auto_804045 - HOIST
      ?auto_804049 - PLACE
      ?auto_804046 - TRUCK
      ?auto_804048 - PLACE
      ?auto_804047 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_804045 ?auto_804049 ) ( SURFACE-AT ?auto_804043 ?auto_804049 ) ( CLEAR ?auto_804043 ) ( IS-CRATE ?auto_804044 ) ( not ( = ?auto_804043 ?auto_804044 ) ) ( AVAILABLE ?auto_804045 ) ( ON ?auto_804043 ?auto_804041 ) ( not ( = ?auto_804041 ?auto_804043 ) ) ( not ( = ?auto_804041 ?auto_804044 ) ) ( TRUCK-AT ?auto_804046 ?auto_804048 ) ( not ( = ?auto_804048 ?auto_804049 ) ) ( HOIST-AT ?auto_804047 ?auto_804048 ) ( LIFTING ?auto_804047 ?auto_804044 ) ( not ( = ?auto_804045 ?auto_804047 ) ) ( ON ?auto_804038 ?auto_804037 ) ( ON ?auto_804039 ?auto_804038 ) ( ON ?auto_804036 ?auto_804039 ) ( ON ?auto_804040 ?auto_804036 ) ( ON ?auto_804042 ?auto_804040 ) ( ON ?auto_804041 ?auto_804042 ) ( not ( = ?auto_804037 ?auto_804038 ) ) ( not ( = ?auto_804037 ?auto_804039 ) ) ( not ( = ?auto_804037 ?auto_804036 ) ) ( not ( = ?auto_804037 ?auto_804040 ) ) ( not ( = ?auto_804037 ?auto_804042 ) ) ( not ( = ?auto_804037 ?auto_804041 ) ) ( not ( = ?auto_804037 ?auto_804043 ) ) ( not ( = ?auto_804037 ?auto_804044 ) ) ( not ( = ?auto_804038 ?auto_804039 ) ) ( not ( = ?auto_804038 ?auto_804036 ) ) ( not ( = ?auto_804038 ?auto_804040 ) ) ( not ( = ?auto_804038 ?auto_804042 ) ) ( not ( = ?auto_804038 ?auto_804041 ) ) ( not ( = ?auto_804038 ?auto_804043 ) ) ( not ( = ?auto_804038 ?auto_804044 ) ) ( not ( = ?auto_804039 ?auto_804036 ) ) ( not ( = ?auto_804039 ?auto_804040 ) ) ( not ( = ?auto_804039 ?auto_804042 ) ) ( not ( = ?auto_804039 ?auto_804041 ) ) ( not ( = ?auto_804039 ?auto_804043 ) ) ( not ( = ?auto_804039 ?auto_804044 ) ) ( not ( = ?auto_804036 ?auto_804040 ) ) ( not ( = ?auto_804036 ?auto_804042 ) ) ( not ( = ?auto_804036 ?auto_804041 ) ) ( not ( = ?auto_804036 ?auto_804043 ) ) ( not ( = ?auto_804036 ?auto_804044 ) ) ( not ( = ?auto_804040 ?auto_804042 ) ) ( not ( = ?auto_804040 ?auto_804041 ) ) ( not ( = ?auto_804040 ?auto_804043 ) ) ( not ( = ?auto_804040 ?auto_804044 ) ) ( not ( = ?auto_804042 ?auto_804041 ) ) ( not ( = ?auto_804042 ?auto_804043 ) ) ( not ( = ?auto_804042 ?auto_804044 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_804041 ?auto_804043 ?auto_804044 )
      ( MAKE-8CRATE-VERIFY ?auto_804037 ?auto_804038 ?auto_804039 ?auto_804036 ?auto_804040 ?auto_804042 ?auto_804041 ?auto_804043 ?auto_804044 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_804129 - SURFACE
      ?auto_804130 - SURFACE
      ?auto_804131 - SURFACE
      ?auto_804128 - SURFACE
      ?auto_804132 - SURFACE
      ?auto_804134 - SURFACE
      ?auto_804133 - SURFACE
      ?auto_804135 - SURFACE
      ?auto_804136 - SURFACE
    )
    :vars
    (
      ?auto_804139 - HOIST
      ?auto_804140 - PLACE
      ?auto_804142 - TRUCK
      ?auto_804138 - PLACE
      ?auto_804141 - HOIST
      ?auto_804137 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_804139 ?auto_804140 ) ( SURFACE-AT ?auto_804135 ?auto_804140 ) ( CLEAR ?auto_804135 ) ( IS-CRATE ?auto_804136 ) ( not ( = ?auto_804135 ?auto_804136 ) ) ( AVAILABLE ?auto_804139 ) ( ON ?auto_804135 ?auto_804133 ) ( not ( = ?auto_804133 ?auto_804135 ) ) ( not ( = ?auto_804133 ?auto_804136 ) ) ( TRUCK-AT ?auto_804142 ?auto_804138 ) ( not ( = ?auto_804138 ?auto_804140 ) ) ( HOIST-AT ?auto_804141 ?auto_804138 ) ( not ( = ?auto_804139 ?auto_804141 ) ) ( AVAILABLE ?auto_804141 ) ( SURFACE-AT ?auto_804136 ?auto_804138 ) ( ON ?auto_804136 ?auto_804137 ) ( CLEAR ?auto_804136 ) ( not ( = ?auto_804135 ?auto_804137 ) ) ( not ( = ?auto_804136 ?auto_804137 ) ) ( not ( = ?auto_804133 ?auto_804137 ) ) ( ON ?auto_804130 ?auto_804129 ) ( ON ?auto_804131 ?auto_804130 ) ( ON ?auto_804128 ?auto_804131 ) ( ON ?auto_804132 ?auto_804128 ) ( ON ?auto_804134 ?auto_804132 ) ( ON ?auto_804133 ?auto_804134 ) ( not ( = ?auto_804129 ?auto_804130 ) ) ( not ( = ?auto_804129 ?auto_804131 ) ) ( not ( = ?auto_804129 ?auto_804128 ) ) ( not ( = ?auto_804129 ?auto_804132 ) ) ( not ( = ?auto_804129 ?auto_804134 ) ) ( not ( = ?auto_804129 ?auto_804133 ) ) ( not ( = ?auto_804129 ?auto_804135 ) ) ( not ( = ?auto_804129 ?auto_804136 ) ) ( not ( = ?auto_804129 ?auto_804137 ) ) ( not ( = ?auto_804130 ?auto_804131 ) ) ( not ( = ?auto_804130 ?auto_804128 ) ) ( not ( = ?auto_804130 ?auto_804132 ) ) ( not ( = ?auto_804130 ?auto_804134 ) ) ( not ( = ?auto_804130 ?auto_804133 ) ) ( not ( = ?auto_804130 ?auto_804135 ) ) ( not ( = ?auto_804130 ?auto_804136 ) ) ( not ( = ?auto_804130 ?auto_804137 ) ) ( not ( = ?auto_804131 ?auto_804128 ) ) ( not ( = ?auto_804131 ?auto_804132 ) ) ( not ( = ?auto_804131 ?auto_804134 ) ) ( not ( = ?auto_804131 ?auto_804133 ) ) ( not ( = ?auto_804131 ?auto_804135 ) ) ( not ( = ?auto_804131 ?auto_804136 ) ) ( not ( = ?auto_804131 ?auto_804137 ) ) ( not ( = ?auto_804128 ?auto_804132 ) ) ( not ( = ?auto_804128 ?auto_804134 ) ) ( not ( = ?auto_804128 ?auto_804133 ) ) ( not ( = ?auto_804128 ?auto_804135 ) ) ( not ( = ?auto_804128 ?auto_804136 ) ) ( not ( = ?auto_804128 ?auto_804137 ) ) ( not ( = ?auto_804132 ?auto_804134 ) ) ( not ( = ?auto_804132 ?auto_804133 ) ) ( not ( = ?auto_804132 ?auto_804135 ) ) ( not ( = ?auto_804132 ?auto_804136 ) ) ( not ( = ?auto_804132 ?auto_804137 ) ) ( not ( = ?auto_804134 ?auto_804133 ) ) ( not ( = ?auto_804134 ?auto_804135 ) ) ( not ( = ?auto_804134 ?auto_804136 ) ) ( not ( = ?auto_804134 ?auto_804137 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_804133 ?auto_804135 ?auto_804136 )
      ( MAKE-8CRATE-VERIFY ?auto_804129 ?auto_804130 ?auto_804131 ?auto_804128 ?auto_804132 ?auto_804134 ?auto_804133 ?auto_804135 ?auto_804136 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_804222 - SURFACE
      ?auto_804223 - SURFACE
      ?auto_804224 - SURFACE
      ?auto_804221 - SURFACE
      ?auto_804225 - SURFACE
      ?auto_804227 - SURFACE
      ?auto_804226 - SURFACE
      ?auto_804228 - SURFACE
      ?auto_804229 - SURFACE
    )
    :vars
    (
      ?auto_804233 - HOIST
      ?auto_804232 - PLACE
      ?auto_804235 - PLACE
      ?auto_804230 - HOIST
      ?auto_804231 - SURFACE
      ?auto_804234 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_804233 ?auto_804232 ) ( SURFACE-AT ?auto_804228 ?auto_804232 ) ( CLEAR ?auto_804228 ) ( IS-CRATE ?auto_804229 ) ( not ( = ?auto_804228 ?auto_804229 ) ) ( AVAILABLE ?auto_804233 ) ( ON ?auto_804228 ?auto_804226 ) ( not ( = ?auto_804226 ?auto_804228 ) ) ( not ( = ?auto_804226 ?auto_804229 ) ) ( not ( = ?auto_804235 ?auto_804232 ) ) ( HOIST-AT ?auto_804230 ?auto_804235 ) ( not ( = ?auto_804233 ?auto_804230 ) ) ( AVAILABLE ?auto_804230 ) ( SURFACE-AT ?auto_804229 ?auto_804235 ) ( ON ?auto_804229 ?auto_804231 ) ( CLEAR ?auto_804229 ) ( not ( = ?auto_804228 ?auto_804231 ) ) ( not ( = ?auto_804229 ?auto_804231 ) ) ( not ( = ?auto_804226 ?auto_804231 ) ) ( TRUCK-AT ?auto_804234 ?auto_804232 ) ( ON ?auto_804223 ?auto_804222 ) ( ON ?auto_804224 ?auto_804223 ) ( ON ?auto_804221 ?auto_804224 ) ( ON ?auto_804225 ?auto_804221 ) ( ON ?auto_804227 ?auto_804225 ) ( ON ?auto_804226 ?auto_804227 ) ( not ( = ?auto_804222 ?auto_804223 ) ) ( not ( = ?auto_804222 ?auto_804224 ) ) ( not ( = ?auto_804222 ?auto_804221 ) ) ( not ( = ?auto_804222 ?auto_804225 ) ) ( not ( = ?auto_804222 ?auto_804227 ) ) ( not ( = ?auto_804222 ?auto_804226 ) ) ( not ( = ?auto_804222 ?auto_804228 ) ) ( not ( = ?auto_804222 ?auto_804229 ) ) ( not ( = ?auto_804222 ?auto_804231 ) ) ( not ( = ?auto_804223 ?auto_804224 ) ) ( not ( = ?auto_804223 ?auto_804221 ) ) ( not ( = ?auto_804223 ?auto_804225 ) ) ( not ( = ?auto_804223 ?auto_804227 ) ) ( not ( = ?auto_804223 ?auto_804226 ) ) ( not ( = ?auto_804223 ?auto_804228 ) ) ( not ( = ?auto_804223 ?auto_804229 ) ) ( not ( = ?auto_804223 ?auto_804231 ) ) ( not ( = ?auto_804224 ?auto_804221 ) ) ( not ( = ?auto_804224 ?auto_804225 ) ) ( not ( = ?auto_804224 ?auto_804227 ) ) ( not ( = ?auto_804224 ?auto_804226 ) ) ( not ( = ?auto_804224 ?auto_804228 ) ) ( not ( = ?auto_804224 ?auto_804229 ) ) ( not ( = ?auto_804224 ?auto_804231 ) ) ( not ( = ?auto_804221 ?auto_804225 ) ) ( not ( = ?auto_804221 ?auto_804227 ) ) ( not ( = ?auto_804221 ?auto_804226 ) ) ( not ( = ?auto_804221 ?auto_804228 ) ) ( not ( = ?auto_804221 ?auto_804229 ) ) ( not ( = ?auto_804221 ?auto_804231 ) ) ( not ( = ?auto_804225 ?auto_804227 ) ) ( not ( = ?auto_804225 ?auto_804226 ) ) ( not ( = ?auto_804225 ?auto_804228 ) ) ( not ( = ?auto_804225 ?auto_804229 ) ) ( not ( = ?auto_804225 ?auto_804231 ) ) ( not ( = ?auto_804227 ?auto_804226 ) ) ( not ( = ?auto_804227 ?auto_804228 ) ) ( not ( = ?auto_804227 ?auto_804229 ) ) ( not ( = ?auto_804227 ?auto_804231 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_804226 ?auto_804228 ?auto_804229 )
      ( MAKE-8CRATE-VERIFY ?auto_804222 ?auto_804223 ?auto_804224 ?auto_804221 ?auto_804225 ?auto_804227 ?auto_804226 ?auto_804228 ?auto_804229 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_804315 - SURFACE
      ?auto_804316 - SURFACE
      ?auto_804317 - SURFACE
      ?auto_804314 - SURFACE
      ?auto_804318 - SURFACE
      ?auto_804320 - SURFACE
      ?auto_804319 - SURFACE
      ?auto_804321 - SURFACE
      ?auto_804322 - SURFACE
    )
    :vars
    (
      ?auto_804328 - HOIST
      ?auto_804325 - PLACE
      ?auto_804327 - PLACE
      ?auto_804324 - HOIST
      ?auto_804326 - SURFACE
      ?auto_804323 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_804328 ?auto_804325 ) ( IS-CRATE ?auto_804322 ) ( not ( = ?auto_804321 ?auto_804322 ) ) ( not ( = ?auto_804319 ?auto_804321 ) ) ( not ( = ?auto_804319 ?auto_804322 ) ) ( not ( = ?auto_804327 ?auto_804325 ) ) ( HOIST-AT ?auto_804324 ?auto_804327 ) ( not ( = ?auto_804328 ?auto_804324 ) ) ( AVAILABLE ?auto_804324 ) ( SURFACE-AT ?auto_804322 ?auto_804327 ) ( ON ?auto_804322 ?auto_804326 ) ( CLEAR ?auto_804322 ) ( not ( = ?auto_804321 ?auto_804326 ) ) ( not ( = ?auto_804322 ?auto_804326 ) ) ( not ( = ?auto_804319 ?auto_804326 ) ) ( TRUCK-AT ?auto_804323 ?auto_804325 ) ( SURFACE-AT ?auto_804319 ?auto_804325 ) ( CLEAR ?auto_804319 ) ( LIFTING ?auto_804328 ?auto_804321 ) ( IS-CRATE ?auto_804321 ) ( ON ?auto_804316 ?auto_804315 ) ( ON ?auto_804317 ?auto_804316 ) ( ON ?auto_804314 ?auto_804317 ) ( ON ?auto_804318 ?auto_804314 ) ( ON ?auto_804320 ?auto_804318 ) ( ON ?auto_804319 ?auto_804320 ) ( not ( = ?auto_804315 ?auto_804316 ) ) ( not ( = ?auto_804315 ?auto_804317 ) ) ( not ( = ?auto_804315 ?auto_804314 ) ) ( not ( = ?auto_804315 ?auto_804318 ) ) ( not ( = ?auto_804315 ?auto_804320 ) ) ( not ( = ?auto_804315 ?auto_804319 ) ) ( not ( = ?auto_804315 ?auto_804321 ) ) ( not ( = ?auto_804315 ?auto_804322 ) ) ( not ( = ?auto_804315 ?auto_804326 ) ) ( not ( = ?auto_804316 ?auto_804317 ) ) ( not ( = ?auto_804316 ?auto_804314 ) ) ( not ( = ?auto_804316 ?auto_804318 ) ) ( not ( = ?auto_804316 ?auto_804320 ) ) ( not ( = ?auto_804316 ?auto_804319 ) ) ( not ( = ?auto_804316 ?auto_804321 ) ) ( not ( = ?auto_804316 ?auto_804322 ) ) ( not ( = ?auto_804316 ?auto_804326 ) ) ( not ( = ?auto_804317 ?auto_804314 ) ) ( not ( = ?auto_804317 ?auto_804318 ) ) ( not ( = ?auto_804317 ?auto_804320 ) ) ( not ( = ?auto_804317 ?auto_804319 ) ) ( not ( = ?auto_804317 ?auto_804321 ) ) ( not ( = ?auto_804317 ?auto_804322 ) ) ( not ( = ?auto_804317 ?auto_804326 ) ) ( not ( = ?auto_804314 ?auto_804318 ) ) ( not ( = ?auto_804314 ?auto_804320 ) ) ( not ( = ?auto_804314 ?auto_804319 ) ) ( not ( = ?auto_804314 ?auto_804321 ) ) ( not ( = ?auto_804314 ?auto_804322 ) ) ( not ( = ?auto_804314 ?auto_804326 ) ) ( not ( = ?auto_804318 ?auto_804320 ) ) ( not ( = ?auto_804318 ?auto_804319 ) ) ( not ( = ?auto_804318 ?auto_804321 ) ) ( not ( = ?auto_804318 ?auto_804322 ) ) ( not ( = ?auto_804318 ?auto_804326 ) ) ( not ( = ?auto_804320 ?auto_804319 ) ) ( not ( = ?auto_804320 ?auto_804321 ) ) ( not ( = ?auto_804320 ?auto_804322 ) ) ( not ( = ?auto_804320 ?auto_804326 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_804319 ?auto_804321 ?auto_804322 )
      ( MAKE-8CRATE-VERIFY ?auto_804315 ?auto_804316 ?auto_804317 ?auto_804314 ?auto_804318 ?auto_804320 ?auto_804319 ?auto_804321 ?auto_804322 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_804408 - SURFACE
      ?auto_804409 - SURFACE
      ?auto_804410 - SURFACE
      ?auto_804407 - SURFACE
      ?auto_804411 - SURFACE
      ?auto_804413 - SURFACE
      ?auto_804412 - SURFACE
      ?auto_804414 - SURFACE
      ?auto_804415 - SURFACE
    )
    :vars
    (
      ?auto_804419 - HOIST
      ?auto_804416 - PLACE
      ?auto_804417 - PLACE
      ?auto_804420 - HOIST
      ?auto_804418 - SURFACE
      ?auto_804421 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_804419 ?auto_804416 ) ( IS-CRATE ?auto_804415 ) ( not ( = ?auto_804414 ?auto_804415 ) ) ( not ( = ?auto_804412 ?auto_804414 ) ) ( not ( = ?auto_804412 ?auto_804415 ) ) ( not ( = ?auto_804417 ?auto_804416 ) ) ( HOIST-AT ?auto_804420 ?auto_804417 ) ( not ( = ?auto_804419 ?auto_804420 ) ) ( AVAILABLE ?auto_804420 ) ( SURFACE-AT ?auto_804415 ?auto_804417 ) ( ON ?auto_804415 ?auto_804418 ) ( CLEAR ?auto_804415 ) ( not ( = ?auto_804414 ?auto_804418 ) ) ( not ( = ?auto_804415 ?auto_804418 ) ) ( not ( = ?auto_804412 ?auto_804418 ) ) ( TRUCK-AT ?auto_804421 ?auto_804416 ) ( SURFACE-AT ?auto_804412 ?auto_804416 ) ( CLEAR ?auto_804412 ) ( IS-CRATE ?auto_804414 ) ( AVAILABLE ?auto_804419 ) ( IN ?auto_804414 ?auto_804421 ) ( ON ?auto_804409 ?auto_804408 ) ( ON ?auto_804410 ?auto_804409 ) ( ON ?auto_804407 ?auto_804410 ) ( ON ?auto_804411 ?auto_804407 ) ( ON ?auto_804413 ?auto_804411 ) ( ON ?auto_804412 ?auto_804413 ) ( not ( = ?auto_804408 ?auto_804409 ) ) ( not ( = ?auto_804408 ?auto_804410 ) ) ( not ( = ?auto_804408 ?auto_804407 ) ) ( not ( = ?auto_804408 ?auto_804411 ) ) ( not ( = ?auto_804408 ?auto_804413 ) ) ( not ( = ?auto_804408 ?auto_804412 ) ) ( not ( = ?auto_804408 ?auto_804414 ) ) ( not ( = ?auto_804408 ?auto_804415 ) ) ( not ( = ?auto_804408 ?auto_804418 ) ) ( not ( = ?auto_804409 ?auto_804410 ) ) ( not ( = ?auto_804409 ?auto_804407 ) ) ( not ( = ?auto_804409 ?auto_804411 ) ) ( not ( = ?auto_804409 ?auto_804413 ) ) ( not ( = ?auto_804409 ?auto_804412 ) ) ( not ( = ?auto_804409 ?auto_804414 ) ) ( not ( = ?auto_804409 ?auto_804415 ) ) ( not ( = ?auto_804409 ?auto_804418 ) ) ( not ( = ?auto_804410 ?auto_804407 ) ) ( not ( = ?auto_804410 ?auto_804411 ) ) ( not ( = ?auto_804410 ?auto_804413 ) ) ( not ( = ?auto_804410 ?auto_804412 ) ) ( not ( = ?auto_804410 ?auto_804414 ) ) ( not ( = ?auto_804410 ?auto_804415 ) ) ( not ( = ?auto_804410 ?auto_804418 ) ) ( not ( = ?auto_804407 ?auto_804411 ) ) ( not ( = ?auto_804407 ?auto_804413 ) ) ( not ( = ?auto_804407 ?auto_804412 ) ) ( not ( = ?auto_804407 ?auto_804414 ) ) ( not ( = ?auto_804407 ?auto_804415 ) ) ( not ( = ?auto_804407 ?auto_804418 ) ) ( not ( = ?auto_804411 ?auto_804413 ) ) ( not ( = ?auto_804411 ?auto_804412 ) ) ( not ( = ?auto_804411 ?auto_804414 ) ) ( not ( = ?auto_804411 ?auto_804415 ) ) ( not ( = ?auto_804411 ?auto_804418 ) ) ( not ( = ?auto_804413 ?auto_804412 ) ) ( not ( = ?auto_804413 ?auto_804414 ) ) ( not ( = ?auto_804413 ?auto_804415 ) ) ( not ( = ?auto_804413 ?auto_804418 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_804412 ?auto_804414 ?auto_804415 )
      ( MAKE-8CRATE-VERIFY ?auto_804408 ?auto_804409 ?auto_804410 ?auto_804407 ?auto_804411 ?auto_804413 ?auto_804412 ?auto_804414 ?auto_804415 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_808524 - SURFACE
      ?auto_808525 - SURFACE
      ?auto_808526 - SURFACE
      ?auto_808523 - SURFACE
      ?auto_808527 - SURFACE
      ?auto_808529 - SURFACE
      ?auto_808528 - SURFACE
      ?auto_808530 - SURFACE
      ?auto_808531 - SURFACE
      ?auto_808532 - SURFACE
    )
    :vars
    (
      ?auto_808533 - HOIST
      ?auto_808534 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_808533 ?auto_808534 ) ( SURFACE-AT ?auto_808531 ?auto_808534 ) ( CLEAR ?auto_808531 ) ( LIFTING ?auto_808533 ?auto_808532 ) ( IS-CRATE ?auto_808532 ) ( not ( = ?auto_808531 ?auto_808532 ) ) ( ON ?auto_808525 ?auto_808524 ) ( ON ?auto_808526 ?auto_808525 ) ( ON ?auto_808523 ?auto_808526 ) ( ON ?auto_808527 ?auto_808523 ) ( ON ?auto_808529 ?auto_808527 ) ( ON ?auto_808528 ?auto_808529 ) ( ON ?auto_808530 ?auto_808528 ) ( ON ?auto_808531 ?auto_808530 ) ( not ( = ?auto_808524 ?auto_808525 ) ) ( not ( = ?auto_808524 ?auto_808526 ) ) ( not ( = ?auto_808524 ?auto_808523 ) ) ( not ( = ?auto_808524 ?auto_808527 ) ) ( not ( = ?auto_808524 ?auto_808529 ) ) ( not ( = ?auto_808524 ?auto_808528 ) ) ( not ( = ?auto_808524 ?auto_808530 ) ) ( not ( = ?auto_808524 ?auto_808531 ) ) ( not ( = ?auto_808524 ?auto_808532 ) ) ( not ( = ?auto_808525 ?auto_808526 ) ) ( not ( = ?auto_808525 ?auto_808523 ) ) ( not ( = ?auto_808525 ?auto_808527 ) ) ( not ( = ?auto_808525 ?auto_808529 ) ) ( not ( = ?auto_808525 ?auto_808528 ) ) ( not ( = ?auto_808525 ?auto_808530 ) ) ( not ( = ?auto_808525 ?auto_808531 ) ) ( not ( = ?auto_808525 ?auto_808532 ) ) ( not ( = ?auto_808526 ?auto_808523 ) ) ( not ( = ?auto_808526 ?auto_808527 ) ) ( not ( = ?auto_808526 ?auto_808529 ) ) ( not ( = ?auto_808526 ?auto_808528 ) ) ( not ( = ?auto_808526 ?auto_808530 ) ) ( not ( = ?auto_808526 ?auto_808531 ) ) ( not ( = ?auto_808526 ?auto_808532 ) ) ( not ( = ?auto_808523 ?auto_808527 ) ) ( not ( = ?auto_808523 ?auto_808529 ) ) ( not ( = ?auto_808523 ?auto_808528 ) ) ( not ( = ?auto_808523 ?auto_808530 ) ) ( not ( = ?auto_808523 ?auto_808531 ) ) ( not ( = ?auto_808523 ?auto_808532 ) ) ( not ( = ?auto_808527 ?auto_808529 ) ) ( not ( = ?auto_808527 ?auto_808528 ) ) ( not ( = ?auto_808527 ?auto_808530 ) ) ( not ( = ?auto_808527 ?auto_808531 ) ) ( not ( = ?auto_808527 ?auto_808532 ) ) ( not ( = ?auto_808529 ?auto_808528 ) ) ( not ( = ?auto_808529 ?auto_808530 ) ) ( not ( = ?auto_808529 ?auto_808531 ) ) ( not ( = ?auto_808529 ?auto_808532 ) ) ( not ( = ?auto_808528 ?auto_808530 ) ) ( not ( = ?auto_808528 ?auto_808531 ) ) ( not ( = ?auto_808528 ?auto_808532 ) ) ( not ( = ?auto_808530 ?auto_808531 ) ) ( not ( = ?auto_808530 ?auto_808532 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_808531 ?auto_808532 )
      ( MAKE-9CRATE-VERIFY ?auto_808524 ?auto_808525 ?auto_808526 ?auto_808523 ?auto_808527 ?auto_808529 ?auto_808528 ?auto_808530 ?auto_808531 ?auto_808532 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_808604 - SURFACE
      ?auto_808605 - SURFACE
      ?auto_808606 - SURFACE
      ?auto_808603 - SURFACE
      ?auto_808607 - SURFACE
      ?auto_808609 - SURFACE
      ?auto_808608 - SURFACE
      ?auto_808610 - SURFACE
      ?auto_808611 - SURFACE
      ?auto_808612 - SURFACE
    )
    :vars
    (
      ?auto_808614 - HOIST
      ?auto_808615 - PLACE
      ?auto_808613 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_808614 ?auto_808615 ) ( SURFACE-AT ?auto_808611 ?auto_808615 ) ( CLEAR ?auto_808611 ) ( IS-CRATE ?auto_808612 ) ( not ( = ?auto_808611 ?auto_808612 ) ) ( TRUCK-AT ?auto_808613 ?auto_808615 ) ( AVAILABLE ?auto_808614 ) ( IN ?auto_808612 ?auto_808613 ) ( ON ?auto_808611 ?auto_808610 ) ( not ( = ?auto_808610 ?auto_808611 ) ) ( not ( = ?auto_808610 ?auto_808612 ) ) ( ON ?auto_808605 ?auto_808604 ) ( ON ?auto_808606 ?auto_808605 ) ( ON ?auto_808603 ?auto_808606 ) ( ON ?auto_808607 ?auto_808603 ) ( ON ?auto_808609 ?auto_808607 ) ( ON ?auto_808608 ?auto_808609 ) ( ON ?auto_808610 ?auto_808608 ) ( not ( = ?auto_808604 ?auto_808605 ) ) ( not ( = ?auto_808604 ?auto_808606 ) ) ( not ( = ?auto_808604 ?auto_808603 ) ) ( not ( = ?auto_808604 ?auto_808607 ) ) ( not ( = ?auto_808604 ?auto_808609 ) ) ( not ( = ?auto_808604 ?auto_808608 ) ) ( not ( = ?auto_808604 ?auto_808610 ) ) ( not ( = ?auto_808604 ?auto_808611 ) ) ( not ( = ?auto_808604 ?auto_808612 ) ) ( not ( = ?auto_808605 ?auto_808606 ) ) ( not ( = ?auto_808605 ?auto_808603 ) ) ( not ( = ?auto_808605 ?auto_808607 ) ) ( not ( = ?auto_808605 ?auto_808609 ) ) ( not ( = ?auto_808605 ?auto_808608 ) ) ( not ( = ?auto_808605 ?auto_808610 ) ) ( not ( = ?auto_808605 ?auto_808611 ) ) ( not ( = ?auto_808605 ?auto_808612 ) ) ( not ( = ?auto_808606 ?auto_808603 ) ) ( not ( = ?auto_808606 ?auto_808607 ) ) ( not ( = ?auto_808606 ?auto_808609 ) ) ( not ( = ?auto_808606 ?auto_808608 ) ) ( not ( = ?auto_808606 ?auto_808610 ) ) ( not ( = ?auto_808606 ?auto_808611 ) ) ( not ( = ?auto_808606 ?auto_808612 ) ) ( not ( = ?auto_808603 ?auto_808607 ) ) ( not ( = ?auto_808603 ?auto_808609 ) ) ( not ( = ?auto_808603 ?auto_808608 ) ) ( not ( = ?auto_808603 ?auto_808610 ) ) ( not ( = ?auto_808603 ?auto_808611 ) ) ( not ( = ?auto_808603 ?auto_808612 ) ) ( not ( = ?auto_808607 ?auto_808609 ) ) ( not ( = ?auto_808607 ?auto_808608 ) ) ( not ( = ?auto_808607 ?auto_808610 ) ) ( not ( = ?auto_808607 ?auto_808611 ) ) ( not ( = ?auto_808607 ?auto_808612 ) ) ( not ( = ?auto_808609 ?auto_808608 ) ) ( not ( = ?auto_808609 ?auto_808610 ) ) ( not ( = ?auto_808609 ?auto_808611 ) ) ( not ( = ?auto_808609 ?auto_808612 ) ) ( not ( = ?auto_808608 ?auto_808610 ) ) ( not ( = ?auto_808608 ?auto_808611 ) ) ( not ( = ?auto_808608 ?auto_808612 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_808610 ?auto_808611 ?auto_808612 )
      ( MAKE-9CRATE-VERIFY ?auto_808604 ?auto_808605 ?auto_808606 ?auto_808603 ?auto_808607 ?auto_808609 ?auto_808608 ?auto_808610 ?auto_808611 ?auto_808612 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_808694 - SURFACE
      ?auto_808695 - SURFACE
      ?auto_808696 - SURFACE
      ?auto_808693 - SURFACE
      ?auto_808697 - SURFACE
      ?auto_808699 - SURFACE
      ?auto_808698 - SURFACE
      ?auto_808700 - SURFACE
      ?auto_808701 - SURFACE
      ?auto_808702 - SURFACE
    )
    :vars
    (
      ?auto_808706 - HOIST
      ?auto_808705 - PLACE
      ?auto_808703 - TRUCK
      ?auto_808704 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_808706 ?auto_808705 ) ( SURFACE-AT ?auto_808701 ?auto_808705 ) ( CLEAR ?auto_808701 ) ( IS-CRATE ?auto_808702 ) ( not ( = ?auto_808701 ?auto_808702 ) ) ( AVAILABLE ?auto_808706 ) ( IN ?auto_808702 ?auto_808703 ) ( ON ?auto_808701 ?auto_808700 ) ( not ( = ?auto_808700 ?auto_808701 ) ) ( not ( = ?auto_808700 ?auto_808702 ) ) ( TRUCK-AT ?auto_808703 ?auto_808704 ) ( not ( = ?auto_808704 ?auto_808705 ) ) ( ON ?auto_808695 ?auto_808694 ) ( ON ?auto_808696 ?auto_808695 ) ( ON ?auto_808693 ?auto_808696 ) ( ON ?auto_808697 ?auto_808693 ) ( ON ?auto_808699 ?auto_808697 ) ( ON ?auto_808698 ?auto_808699 ) ( ON ?auto_808700 ?auto_808698 ) ( not ( = ?auto_808694 ?auto_808695 ) ) ( not ( = ?auto_808694 ?auto_808696 ) ) ( not ( = ?auto_808694 ?auto_808693 ) ) ( not ( = ?auto_808694 ?auto_808697 ) ) ( not ( = ?auto_808694 ?auto_808699 ) ) ( not ( = ?auto_808694 ?auto_808698 ) ) ( not ( = ?auto_808694 ?auto_808700 ) ) ( not ( = ?auto_808694 ?auto_808701 ) ) ( not ( = ?auto_808694 ?auto_808702 ) ) ( not ( = ?auto_808695 ?auto_808696 ) ) ( not ( = ?auto_808695 ?auto_808693 ) ) ( not ( = ?auto_808695 ?auto_808697 ) ) ( not ( = ?auto_808695 ?auto_808699 ) ) ( not ( = ?auto_808695 ?auto_808698 ) ) ( not ( = ?auto_808695 ?auto_808700 ) ) ( not ( = ?auto_808695 ?auto_808701 ) ) ( not ( = ?auto_808695 ?auto_808702 ) ) ( not ( = ?auto_808696 ?auto_808693 ) ) ( not ( = ?auto_808696 ?auto_808697 ) ) ( not ( = ?auto_808696 ?auto_808699 ) ) ( not ( = ?auto_808696 ?auto_808698 ) ) ( not ( = ?auto_808696 ?auto_808700 ) ) ( not ( = ?auto_808696 ?auto_808701 ) ) ( not ( = ?auto_808696 ?auto_808702 ) ) ( not ( = ?auto_808693 ?auto_808697 ) ) ( not ( = ?auto_808693 ?auto_808699 ) ) ( not ( = ?auto_808693 ?auto_808698 ) ) ( not ( = ?auto_808693 ?auto_808700 ) ) ( not ( = ?auto_808693 ?auto_808701 ) ) ( not ( = ?auto_808693 ?auto_808702 ) ) ( not ( = ?auto_808697 ?auto_808699 ) ) ( not ( = ?auto_808697 ?auto_808698 ) ) ( not ( = ?auto_808697 ?auto_808700 ) ) ( not ( = ?auto_808697 ?auto_808701 ) ) ( not ( = ?auto_808697 ?auto_808702 ) ) ( not ( = ?auto_808699 ?auto_808698 ) ) ( not ( = ?auto_808699 ?auto_808700 ) ) ( not ( = ?auto_808699 ?auto_808701 ) ) ( not ( = ?auto_808699 ?auto_808702 ) ) ( not ( = ?auto_808698 ?auto_808700 ) ) ( not ( = ?auto_808698 ?auto_808701 ) ) ( not ( = ?auto_808698 ?auto_808702 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_808700 ?auto_808701 ?auto_808702 )
      ( MAKE-9CRATE-VERIFY ?auto_808694 ?auto_808695 ?auto_808696 ?auto_808693 ?auto_808697 ?auto_808699 ?auto_808698 ?auto_808700 ?auto_808701 ?auto_808702 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_808793 - SURFACE
      ?auto_808794 - SURFACE
      ?auto_808795 - SURFACE
      ?auto_808792 - SURFACE
      ?auto_808796 - SURFACE
      ?auto_808798 - SURFACE
      ?auto_808797 - SURFACE
      ?auto_808799 - SURFACE
      ?auto_808800 - SURFACE
      ?auto_808801 - SURFACE
    )
    :vars
    (
      ?auto_808802 - HOIST
      ?auto_808805 - PLACE
      ?auto_808804 - TRUCK
      ?auto_808806 - PLACE
      ?auto_808803 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_808802 ?auto_808805 ) ( SURFACE-AT ?auto_808800 ?auto_808805 ) ( CLEAR ?auto_808800 ) ( IS-CRATE ?auto_808801 ) ( not ( = ?auto_808800 ?auto_808801 ) ) ( AVAILABLE ?auto_808802 ) ( ON ?auto_808800 ?auto_808799 ) ( not ( = ?auto_808799 ?auto_808800 ) ) ( not ( = ?auto_808799 ?auto_808801 ) ) ( TRUCK-AT ?auto_808804 ?auto_808806 ) ( not ( = ?auto_808806 ?auto_808805 ) ) ( HOIST-AT ?auto_808803 ?auto_808806 ) ( LIFTING ?auto_808803 ?auto_808801 ) ( not ( = ?auto_808802 ?auto_808803 ) ) ( ON ?auto_808794 ?auto_808793 ) ( ON ?auto_808795 ?auto_808794 ) ( ON ?auto_808792 ?auto_808795 ) ( ON ?auto_808796 ?auto_808792 ) ( ON ?auto_808798 ?auto_808796 ) ( ON ?auto_808797 ?auto_808798 ) ( ON ?auto_808799 ?auto_808797 ) ( not ( = ?auto_808793 ?auto_808794 ) ) ( not ( = ?auto_808793 ?auto_808795 ) ) ( not ( = ?auto_808793 ?auto_808792 ) ) ( not ( = ?auto_808793 ?auto_808796 ) ) ( not ( = ?auto_808793 ?auto_808798 ) ) ( not ( = ?auto_808793 ?auto_808797 ) ) ( not ( = ?auto_808793 ?auto_808799 ) ) ( not ( = ?auto_808793 ?auto_808800 ) ) ( not ( = ?auto_808793 ?auto_808801 ) ) ( not ( = ?auto_808794 ?auto_808795 ) ) ( not ( = ?auto_808794 ?auto_808792 ) ) ( not ( = ?auto_808794 ?auto_808796 ) ) ( not ( = ?auto_808794 ?auto_808798 ) ) ( not ( = ?auto_808794 ?auto_808797 ) ) ( not ( = ?auto_808794 ?auto_808799 ) ) ( not ( = ?auto_808794 ?auto_808800 ) ) ( not ( = ?auto_808794 ?auto_808801 ) ) ( not ( = ?auto_808795 ?auto_808792 ) ) ( not ( = ?auto_808795 ?auto_808796 ) ) ( not ( = ?auto_808795 ?auto_808798 ) ) ( not ( = ?auto_808795 ?auto_808797 ) ) ( not ( = ?auto_808795 ?auto_808799 ) ) ( not ( = ?auto_808795 ?auto_808800 ) ) ( not ( = ?auto_808795 ?auto_808801 ) ) ( not ( = ?auto_808792 ?auto_808796 ) ) ( not ( = ?auto_808792 ?auto_808798 ) ) ( not ( = ?auto_808792 ?auto_808797 ) ) ( not ( = ?auto_808792 ?auto_808799 ) ) ( not ( = ?auto_808792 ?auto_808800 ) ) ( not ( = ?auto_808792 ?auto_808801 ) ) ( not ( = ?auto_808796 ?auto_808798 ) ) ( not ( = ?auto_808796 ?auto_808797 ) ) ( not ( = ?auto_808796 ?auto_808799 ) ) ( not ( = ?auto_808796 ?auto_808800 ) ) ( not ( = ?auto_808796 ?auto_808801 ) ) ( not ( = ?auto_808798 ?auto_808797 ) ) ( not ( = ?auto_808798 ?auto_808799 ) ) ( not ( = ?auto_808798 ?auto_808800 ) ) ( not ( = ?auto_808798 ?auto_808801 ) ) ( not ( = ?auto_808797 ?auto_808799 ) ) ( not ( = ?auto_808797 ?auto_808800 ) ) ( not ( = ?auto_808797 ?auto_808801 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_808799 ?auto_808800 ?auto_808801 )
      ( MAKE-9CRATE-VERIFY ?auto_808793 ?auto_808794 ?auto_808795 ?auto_808792 ?auto_808796 ?auto_808798 ?auto_808797 ?auto_808799 ?auto_808800 ?auto_808801 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_808901 - SURFACE
      ?auto_808902 - SURFACE
      ?auto_808903 - SURFACE
      ?auto_808900 - SURFACE
      ?auto_808904 - SURFACE
      ?auto_808906 - SURFACE
      ?auto_808905 - SURFACE
      ?auto_808907 - SURFACE
      ?auto_808908 - SURFACE
      ?auto_808909 - SURFACE
    )
    :vars
    (
      ?auto_808914 - HOIST
      ?auto_808912 - PLACE
      ?auto_808915 - TRUCK
      ?auto_808911 - PLACE
      ?auto_808910 - HOIST
      ?auto_808913 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_808914 ?auto_808912 ) ( SURFACE-AT ?auto_808908 ?auto_808912 ) ( CLEAR ?auto_808908 ) ( IS-CRATE ?auto_808909 ) ( not ( = ?auto_808908 ?auto_808909 ) ) ( AVAILABLE ?auto_808914 ) ( ON ?auto_808908 ?auto_808907 ) ( not ( = ?auto_808907 ?auto_808908 ) ) ( not ( = ?auto_808907 ?auto_808909 ) ) ( TRUCK-AT ?auto_808915 ?auto_808911 ) ( not ( = ?auto_808911 ?auto_808912 ) ) ( HOIST-AT ?auto_808910 ?auto_808911 ) ( not ( = ?auto_808914 ?auto_808910 ) ) ( AVAILABLE ?auto_808910 ) ( SURFACE-AT ?auto_808909 ?auto_808911 ) ( ON ?auto_808909 ?auto_808913 ) ( CLEAR ?auto_808909 ) ( not ( = ?auto_808908 ?auto_808913 ) ) ( not ( = ?auto_808909 ?auto_808913 ) ) ( not ( = ?auto_808907 ?auto_808913 ) ) ( ON ?auto_808902 ?auto_808901 ) ( ON ?auto_808903 ?auto_808902 ) ( ON ?auto_808900 ?auto_808903 ) ( ON ?auto_808904 ?auto_808900 ) ( ON ?auto_808906 ?auto_808904 ) ( ON ?auto_808905 ?auto_808906 ) ( ON ?auto_808907 ?auto_808905 ) ( not ( = ?auto_808901 ?auto_808902 ) ) ( not ( = ?auto_808901 ?auto_808903 ) ) ( not ( = ?auto_808901 ?auto_808900 ) ) ( not ( = ?auto_808901 ?auto_808904 ) ) ( not ( = ?auto_808901 ?auto_808906 ) ) ( not ( = ?auto_808901 ?auto_808905 ) ) ( not ( = ?auto_808901 ?auto_808907 ) ) ( not ( = ?auto_808901 ?auto_808908 ) ) ( not ( = ?auto_808901 ?auto_808909 ) ) ( not ( = ?auto_808901 ?auto_808913 ) ) ( not ( = ?auto_808902 ?auto_808903 ) ) ( not ( = ?auto_808902 ?auto_808900 ) ) ( not ( = ?auto_808902 ?auto_808904 ) ) ( not ( = ?auto_808902 ?auto_808906 ) ) ( not ( = ?auto_808902 ?auto_808905 ) ) ( not ( = ?auto_808902 ?auto_808907 ) ) ( not ( = ?auto_808902 ?auto_808908 ) ) ( not ( = ?auto_808902 ?auto_808909 ) ) ( not ( = ?auto_808902 ?auto_808913 ) ) ( not ( = ?auto_808903 ?auto_808900 ) ) ( not ( = ?auto_808903 ?auto_808904 ) ) ( not ( = ?auto_808903 ?auto_808906 ) ) ( not ( = ?auto_808903 ?auto_808905 ) ) ( not ( = ?auto_808903 ?auto_808907 ) ) ( not ( = ?auto_808903 ?auto_808908 ) ) ( not ( = ?auto_808903 ?auto_808909 ) ) ( not ( = ?auto_808903 ?auto_808913 ) ) ( not ( = ?auto_808900 ?auto_808904 ) ) ( not ( = ?auto_808900 ?auto_808906 ) ) ( not ( = ?auto_808900 ?auto_808905 ) ) ( not ( = ?auto_808900 ?auto_808907 ) ) ( not ( = ?auto_808900 ?auto_808908 ) ) ( not ( = ?auto_808900 ?auto_808909 ) ) ( not ( = ?auto_808900 ?auto_808913 ) ) ( not ( = ?auto_808904 ?auto_808906 ) ) ( not ( = ?auto_808904 ?auto_808905 ) ) ( not ( = ?auto_808904 ?auto_808907 ) ) ( not ( = ?auto_808904 ?auto_808908 ) ) ( not ( = ?auto_808904 ?auto_808909 ) ) ( not ( = ?auto_808904 ?auto_808913 ) ) ( not ( = ?auto_808906 ?auto_808905 ) ) ( not ( = ?auto_808906 ?auto_808907 ) ) ( not ( = ?auto_808906 ?auto_808908 ) ) ( not ( = ?auto_808906 ?auto_808909 ) ) ( not ( = ?auto_808906 ?auto_808913 ) ) ( not ( = ?auto_808905 ?auto_808907 ) ) ( not ( = ?auto_808905 ?auto_808908 ) ) ( not ( = ?auto_808905 ?auto_808909 ) ) ( not ( = ?auto_808905 ?auto_808913 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_808907 ?auto_808908 ?auto_808909 )
      ( MAKE-9CRATE-VERIFY ?auto_808901 ?auto_808902 ?auto_808903 ?auto_808900 ?auto_808904 ?auto_808906 ?auto_808905 ?auto_808907 ?auto_808908 ?auto_808909 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_809010 - SURFACE
      ?auto_809011 - SURFACE
      ?auto_809012 - SURFACE
      ?auto_809009 - SURFACE
      ?auto_809013 - SURFACE
      ?auto_809015 - SURFACE
      ?auto_809014 - SURFACE
      ?auto_809016 - SURFACE
      ?auto_809017 - SURFACE
      ?auto_809018 - SURFACE
    )
    :vars
    (
      ?auto_809022 - HOIST
      ?auto_809023 - PLACE
      ?auto_809019 - PLACE
      ?auto_809020 - HOIST
      ?auto_809021 - SURFACE
      ?auto_809024 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_809022 ?auto_809023 ) ( SURFACE-AT ?auto_809017 ?auto_809023 ) ( CLEAR ?auto_809017 ) ( IS-CRATE ?auto_809018 ) ( not ( = ?auto_809017 ?auto_809018 ) ) ( AVAILABLE ?auto_809022 ) ( ON ?auto_809017 ?auto_809016 ) ( not ( = ?auto_809016 ?auto_809017 ) ) ( not ( = ?auto_809016 ?auto_809018 ) ) ( not ( = ?auto_809019 ?auto_809023 ) ) ( HOIST-AT ?auto_809020 ?auto_809019 ) ( not ( = ?auto_809022 ?auto_809020 ) ) ( AVAILABLE ?auto_809020 ) ( SURFACE-AT ?auto_809018 ?auto_809019 ) ( ON ?auto_809018 ?auto_809021 ) ( CLEAR ?auto_809018 ) ( not ( = ?auto_809017 ?auto_809021 ) ) ( not ( = ?auto_809018 ?auto_809021 ) ) ( not ( = ?auto_809016 ?auto_809021 ) ) ( TRUCK-AT ?auto_809024 ?auto_809023 ) ( ON ?auto_809011 ?auto_809010 ) ( ON ?auto_809012 ?auto_809011 ) ( ON ?auto_809009 ?auto_809012 ) ( ON ?auto_809013 ?auto_809009 ) ( ON ?auto_809015 ?auto_809013 ) ( ON ?auto_809014 ?auto_809015 ) ( ON ?auto_809016 ?auto_809014 ) ( not ( = ?auto_809010 ?auto_809011 ) ) ( not ( = ?auto_809010 ?auto_809012 ) ) ( not ( = ?auto_809010 ?auto_809009 ) ) ( not ( = ?auto_809010 ?auto_809013 ) ) ( not ( = ?auto_809010 ?auto_809015 ) ) ( not ( = ?auto_809010 ?auto_809014 ) ) ( not ( = ?auto_809010 ?auto_809016 ) ) ( not ( = ?auto_809010 ?auto_809017 ) ) ( not ( = ?auto_809010 ?auto_809018 ) ) ( not ( = ?auto_809010 ?auto_809021 ) ) ( not ( = ?auto_809011 ?auto_809012 ) ) ( not ( = ?auto_809011 ?auto_809009 ) ) ( not ( = ?auto_809011 ?auto_809013 ) ) ( not ( = ?auto_809011 ?auto_809015 ) ) ( not ( = ?auto_809011 ?auto_809014 ) ) ( not ( = ?auto_809011 ?auto_809016 ) ) ( not ( = ?auto_809011 ?auto_809017 ) ) ( not ( = ?auto_809011 ?auto_809018 ) ) ( not ( = ?auto_809011 ?auto_809021 ) ) ( not ( = ?auto_809012 ?auto_809009 ) ) ( not ( = ?auto_809012 ?auto_809013 ) ) ( not ( = ?auto_809012 ?auto_809015 ) ) ( not ( = ?auto_809012 ?auto_809014 ) ) ( not ( = ?auto_809012 ?auto_809016 ) ) ( not ( = ?auto_809012 ?auto_809017 ) ) ( not ( = ?auto_809012 ?auto_809018 ) ) ( not ( = ?auto_809012 ?auto_809021 ) ) ( not ( = ?auto_809009 ?auto_809013 ) ) ( not ( = ?auto_809009 ?auto_809015 ) ) ( not ( = ?auto_809009 ?auto_809014 ) ) ( not ( = ?auto_809009 ?auto_809016 ) ) ( not ( = ?auto_809009 ?auto_809017 ) ) ( not ( = ?auto_809009 ?auto_809018 ) ) ( not ( = ?auto_809009 ?auto_809021 ) ) ( not ( = ?auto_809013 ?auto_809015 ) ) ( not ( = ?auto_809013 ?auto_809014 ) ) ( not ( = ?auto_809013 ?auto_809016 ) ) ( not ( = ?auto_809013 ?auto_809017 ) ) ( not ( = ?auto_809013 ?auto_809018 ) ) ( not ( = ?auto_809013 ?auto_809021 ) ) ( not ( = ?auto_809015 ?auto_809014 ) ) ( not ( = ?auto_809015 ?auto_809016 ) ) ( not ( = ?auto_809015 ?auto_809017 ) ) ( not ( = ?auto_809015 ?auto_809018 ) ) ( not ( = ?auto_809015 ?auto_809021 ) ) ( not ( = ?auto_809014 ?auto_809016 ) ) ( not ( = ?auto_809014 ?auto_809017 ) ) ( not ( = ?auto_809014 ?auto_809018 ) ) ( not ( = ?auto_809014 ?auto_809021 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_809016 ?auto_809017 ?auto_809018 )
      ( MAKE-9CRATE-VERIFY ?auto_809010 ?auto_809011 ?auto_809012 ?auto_809009 ?auto_809013 ?auto_809015 ?auto_809014 ?auto_809016 ?auto_809017 ?auto_809018 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_809119 - SURFACE
      ?auto_809120 - SURFACE
      ?auto_809121 - SURFACE
      ?auto_809118 - SURFACE
      ?auto_809122 - SURFACE
      ?auto_809124 - SURFACE
      ?auto_809123 - SURFACE
      ?auto_809125 - SURFACE
      ?auto_809126 - SURFACE
      ?auto_809127 - SURFACE
    )
    :vars
    (
      ?auto_809131 - HOIST
      ?auto_809128 - PLACE
      ?auto_809133 - PLACE
      ?auto_809129 - HOIST
      ?auto_809132 - SURFACE
      ?auto_809130 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_809131 ?auto_809128 ) ( IS-CRATE ?auto_809127 ) ( not ( = ?auto_809126 ?auto_809127 ) ) ( not ( = ?auto_809125 ?auto_809126 ) ) ( not ( = ?auto_809125 ?auto_809127 ) ) ( not ( = ?auto_809133 ?auto_809128 ) ) ( HOIST-AT ?auto_809129 ?auto_809133 ) ( not ( = ?auto_809131 ?auto_809129 ) ) ( AVAILABLE ?auto_809129 ) ( SURFACE-AT ?auto_809127 ?auto_809133 ) ( ON ?auto_809127 ?auto_809132 ) ( CLEAR ?auto_809127 ) ( not ( = ?auto_809126 ?auto_809132 ) ) ( not ( = ?auto_809127 ?auto_809132 ) ) ( not ( = ?auto_809125 ?auto_809132 ) ) ( TRUCK-AT ?auto_809130 ?auto_809128 ) ( SURFACE-AT ?auto_809125 ?auto_809128 ) ( CLEAR ?auto_809125 ) ( LIFTING ?auto_809131 ?auto_809126 ) ( IS-CRATE ?auto_809126 ) ( ON ?auto_809120 ?auto_809119 ) ( ON ?auto_809121 ?auto_809120 ) ( ON ?auto_809118 ?auto_809121 ) ( ON ?auto_809122 ?auto_809118 ) ( ON ?auto_809124 ?auto_809122 ) ( ON ?auto_809123 ?auto_809124 ) ( ON ?auto_809125 ?auto_809123 ) ( not ( = ?auto_809119 ?auto_809120 ) ) ( not ( = ?auto_809119 ?auto_809121 ) ) ( not ( = ?auto_809119 ?auto_809118 ) ) ( not ( = ?auto_809119 ?auto_809122 ) ) ( not ( = ?auto_809119 ?auto_809124 ) ) ( not ( = ?auto_809119 ?auto_809123 ) ) ( not ( = ?auto_809119 ?auto_809125 ) ) ( not ( = ?auto_809119 ?auto_809126 ) ) ( not ( = ?auto_809119 ?auto_809127 ) ) ( not ( = ?auto_809119 ?auto_809132 ) ) ( not ( = ?auto_809120 ?auto_809121 ) ) ( not ( = ?auto_809120 ?auto_809118 ) ) ( not ( = ?auto_809120 ?auto_809122 ) ) ( not ( = ?auto_809120 ?auto_809124 ) ) ( not ( = ?auto_809120 ?auto_809123 ) ) ( not ( = ?auto_809120 ?auto_809125 ) ) ( not ( = ?auto_809120 ?auto_809126 ) ) ( not ( = ?auto_809120 ?auto_809127 ) ) ( not ( = ?auto_809120 ?auto_809132 ) ) ( not ( = ?auto_809121 ?auto_809118 ) ) ( not ( = ?auto_809121 ?auto_809122 ) ) ( not ( = ?auto_809121 ?auto_809124 ) ) ( not ( = ?auto_809121 ?auto_809123 ) ) ( not ( = ?auto_809121 ?auto_809125 ) ) ( not ( = ?auto_809121 ?auto_809126 ) ) ( not ( = ?auto_809121 ?auto_809127 ) ) ( not ( = ?auto_809121 ?auto_809132 ) ) ( not ( = ?auto_809118 ?auto_809122 ) ) ( not ( = ?auto_809118 ?auto_809124 ) ) ( not ( = ?auto_809118 ?auto_809123 ) ) ( not ( = ?auto_809118 ?auto_809125 ) ) ( not ( = ?auto_809118 ?auto_809126 ) ) ( not ( = ?auto_809118 ?auto_809127 ) ) ( not ( = ?auto_809118 ?auto_809132 ) ) ( not ( = ?auto_809122 ?auto_809124 ) ) ( not ( = ?auto_809122 ?auto_809123 ) ) ( not ( = ?auto_809122 ?auto_809125 ) ) ( not ( = ?auto_809122 ?auto_809126 ) ) ( not ( = ?auto_809122 ?auto_809127 ) ) ( not ( = ?auto_809122 ?auto_809132 ) ) ( not ( = ?auto_809124 ?auto_809123 ) ) ( not ( = ?auto_809124 ?auto_809125 ) ) ( not ( = ?auto_809124 ?auto_809126 ) ) ( not ( = ?auto_809124 ?auto_809127 ) ) ( not ( = ?auto_809124 ?auto_809132 ) ) ( not ( = ?auto_809123 ?auto_809125 ) ) ( not ( = ?auto_809123 ?auto_809126 ) ) ( not ( = ?auto_809123 ?auto_809127 ) ) ( not ( = ?auto_809123 ?auto_809132 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_809125 ?auto_809126 ?auto_809127 )
      ( MAKE-9CRATE-VERIFY ?auto_809119 ?auto_809120 ?auto_809121 ?auto_809118 ?auto_809122 ?auto_809124 ?auto_809123 ?auto_809125 ?auto_809126 ?auto_809127 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_809228 - SURFACE
      ?auto_809229 - SURFACE
      ?auto_809230 - SURFACE
      ?auto_809227 - SURFACE
      ?auto_809231 - SURFACE
      ?auto_809233 - SURFACE
      ?auto_809232 - SURFACE
      ?auto_809234 - SURFACE
      ?auto_809235 - SURFACE
      ?auto_809236 - SURFACE
    )
    :vars
    (
      ?auto_809240 - HOIST
      ?auto_809238 - PLACE
      ?auto_809242 - PLACE
      ?auto_809237 - HOIST
      ?auto_809239 - SURFACE
      ?auto_809241 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_809240 ?auto_809238 ) ( IS-CRATE ?auto_809236 ) ( not ( = ?auto_809235 ?auto_809236 ) ) ( not ( = ?auto_809234 ?auto_809235 ) ) ( not ( = ?auto_809234 ?auto_809236 ) ) ( not ( = ?auto_809242 ?auto_809238 ) ) ( HOIST-AT ?auto_809237 ?auto_809242 ) ( not ( = ?auto_809240 ?auto_809237 ) ) ( AVAILABLE ?auto_809237 ) ( SURFACE-AT ?auto_809236 ?auto_809242 ) ( ON ?auto_809236 ?auto_809239 ) ( CLEAR ?auto_809236 ) ( not ( = ?auto_809235 ?auto_809239 ) ) ( not ( = ?auto_809236 ?auto_809239 ) ) ( not ( = ?auto_809234 ?auto_809239 ) ) ( TRUCK-AT ?auto_809241 ?auto_809238 ) ( SURFACE-AT ?auto_809234 ?auto_809238 ) ( CLEAR ?auto_809234 ) ( IS-CRATE ?auto_809235 ) ( AVAILABLE ?auto_809240 ) ( IN ?auto_809235 ?auto_809241 ) ( ON ?auto_809229 ?auto_809228 ) ( ON ?auto_809230 ?auto_809229 ) ( ON ?auto_809227 ?auto_809230 ) ( ON ?auto_809231 ?auto_809227 ) ( ON ?auto_809233 ?auto_809231 ) ( ON ?auto_809232 ?auto_809233 ) ( ON ?auto_809234 ?auto_809232 ) ( not ( = ?auto_809228 ?auto_809229 ) ) ( not ( = ?auto_809228 ?auto_809230 ) ) ( not ( = ?auto_809228 ?auto_809227 ) ) ( not ( = ?auto_809228 ?auto_809231 ) ) ( not ( = ?auto_809228 ?auto_809233 ) ) ( not ( = ?auto_809228 ?auto_809232 ) ) ( not ( = ?auto_809228 ?auto_809234 ) ) ( not ( = ?auto_809228 ?auto_809235 ) ) ( not ( = ?auto_809228 ?auto_809236 ) ) ( not ( = ?auto_809228 ?auto_809239 ) ) ( not ( = ?auto_809229 ?auto_809230 ) ) ( not ( = ?auto_809229 ?auto_809227 ) ) ( not ( = ?auto_809229 ?auto_809231 ) ) ( not ( = ?auto_809229 ?auto_809233 ) ) ( not ( = ?auto_809229 ?auto_809232 ) ) ( not ( = ?auto_809229 ?auto_809234 ) ) ( not ( = ?auto_809229 ?auto_809235 ) ) ( not ( = ?auto_809229 ?auto_809236 ) ) ( not ( = ?auto_809229 ?auto_809239 ) ) ( not ( = ?auto_809230 ?auto_809227 ) ) ( not ( = ?auto_809230 ?auto_809231 ) ) ( not ( = ?auto_809230 ?auto_809233 ) ) ( not ( = ?auto_809230 ?auto_809232 ) ) ( not ( = ?auto_809230 ?auto_809234 ) ) ( not ( = ?auto_809230 ?auto_809235 ) ) ( not ( = ?auto_809230 ?auto_809236 ) ) ( not ( = ?auto_809230 ?auto_809239 ) ) ( not ( = ?auto_809227 ?auto_809231 ) ) ( not ( = ?auto_809227 ?auto_809233 ) ) ( not ( = ?auto_809227 ?auto_809232 ) ) ( not ( = ?auto_809227 ?auto_809234 ) ) ( not ( = ?auto_809227 ?auto_809235 ) ) ( not ( = ?auto_809227 ?auto_809236 ) ) ( not ( = ?auto_809227 ?auto_809239 ) ) ( not ( = ?auto_809231 ?auto_809233 ) ) ( not ( = ?auto_809231 ?auto_809232 ) ) ( not ( = ?auto_809231 ?auto_809234 ) ) ( not ( = ?auto_809231 ?auto_809235 ) ) ( not ( = ?auto_809231 ?auto_809236 ) ) ( not ( = ?auto_809231 ?auto_809239 ) ) ( not ( = ?auto_809233 ?auto_809232 ) ) ( not ( = ?auto_809233 ?auto_809234 ) ) ( not ( = ?auto_809233 ?auto_809235 ) ) ( not ( = ?auto_809233 ?auto_809236 ) ) ( not ( = ?auto_809233 ?auto_809239 ) ) ( not ( = ?auto_809232 ?auto_809234 ) ) ( not ( = ?auto_809232 ?auto_809235 ) ) ( not ( = ?auto_809232 ?auto_809236 ) ) ( not ( = ?auto_809232 ?auto_809239 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_809234 ?auto_809235 ?auto_809236 )
      ( MAKE-9CRATE-VERIFY ?auto_809228 ?auto_809229 ?auto_809230 ?auto_809227 ?auto_809231 ?auto_809233 ?auto_809232 ?auto_809234 ?auto_809235 ?auto_809236 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_814793 - SURFACE
      ?auto_814794 - SURFACE
      ?auto_814795 - SURFACE
      ?auto_814792 - SURFACE
      ?auto_814796 - SURFACE
      ?auto_814798 - SURFACE
      ?auto_814797 - SURFACE
      ?auto_814799 - SURFACE
      ?auto_814800 - SURFACE
      ?auto_814801 - SURFACE
      ?auto_814802 - SURFACE
    )
    :vars
    (
      ?auto_814803 - HOIST
      ?auto_814804 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_814803 ?auto_814804 ) ( SURFACE-AT ?auto_814801 ?auto_814804 ) ( CLEAR ?auto_814801 ) ( LIFTING ?auto_814803 ?auto_814802 ) ( IS-CRATE ?auto_814802 ) ( not ( = ?auto_814801 ?auto_814802 ) ) ( ON ?auto_814794 ?auto_814793 ) ( ON ?auto_814795 ?auto_814794 ) ( ON ?auto_814792 ?auto_814795 ) ( ON ?auto_814796 ?auto_814792 ) ( ON ?auto_814798 ?auto_814796 ) ( ON ?auto_814797 ?auto_814798 ) ( ON ?auto_814799 ?auto_814797 ) ( ON ?auto_814800 ?auto_814799 ) ( ON ?auto_814801 ?auto_814800 ) ( not ( = ?auto_814793 ?auto_814794 ) ) ( not ( = ?auto_814793 ?auto_814795 ) ) ( not ( = ?auto_814793 ?auto_814792 ) ) ( not ( = ?auto_814793 ?auto_814796 ) ) ( not ( = ?auto_814793 ?auto_814798 ) ) ( not ( = ?auto_814793 ?auto_814797 ) ) ( not ( = ?auto_814793 ?auto_814799 ) ) ( not ( = ?auto_814793 ?auto_814800 ) ) ( not ( = ?auto_814793 ?auto_814801 ) ) ( not ( = ?auto_814793 ?auto_814802 ) ) ( not ( = ?auto_814794 ?auto_814795 ) ) ( not ( = ?auto_814794 ?auto_814792 ) ) ( not ( = ?auto_814794 ?auto_814796 ) ) ( not ( = ?auto_814794 ?auto_814798 ) ) ( not ( = ?auto_814794 ?auto_814797 ) ) ( not ( = ?auto_814794 ?auto_814799 ) ) ( not ( = ?auto_814794 ?auto_814800 ) ) ( not ( = ?auto_814794 ?auto_814801 ) ) ( not ( = ?auto_814794 ?auto_814802 ) ) ( not ( = ?auto_814795 ?auto_814792 ) ) ( not ( = ?auto_814795 ?auto_814796 ) ) ( not ( = ?auto_814795 ?auto_814798 ) ) ( not ( = ?auto_814795 ?auto_814797 ) ) ( not ( = ?auto_814795 ?auto_814799 ) ) ( not ( = ?auto_814795 ?auto_814800 ) ) ( not ( = ?auto_814795 ?auto_814801 ) ) ( not ( = ?auto_814795 ?auto_814802 ) ) ( not ( = ?auto_814792 ?auto_814796 ) ) ( not ( = ?auto_814792 ?auto_814798 ) ) ( not ( = ?auto_814792 ?auto_814797 ) ) ( not ( = ?auto_814792 ?auto_814799 ) ) ( not ( = ?auto_814792 ?auto_814800 ) ) ( not ( = ?auto_814792 ?auto_814801 ) ) ( not ( = ?auto_814792 ?auto_814802 ) ) ( not ( = ?auto_814796 ?auto_814798 ) ) ( not ( = ?auto_814796 ?auto_814797 ) ) ( not ( = ?auto_814796 ?auto_814799 ) ) ( not ( = ?auto_814796 ?auto_814800 ) ) ( not ( = ?auto_814796 ?auto_814801 ) ) ( not ( = ?auto_814796 ?auto_814802 ) ) ( not ( = ?auto_814798 ?auto_814797 ) ) ( not ( = ?auto_814798 ?auto_814799 ) ) ( not ( = ?auto_814798 ?auto_814800 ) ) ( not ( = ?auto_814798 ?auto_814801 ) ) ( not ( = ?auto_814798 ?auto_814802 ) ) ( not ( = ?auto_814797 ?auto_814799 ) ) ( not ( = ?auto_814797 ?auto_814800 ) ) ( not ( = ?auto_814797 ?auto_814801 ) ) ( not ( = ?auto_814797 ?auto_814802 ) ) ( not ( = ?auto_814799 ?auto_814800 ) ) ( not ( = ?auto_814799 ?auto_814801 ) ) ( not ( = ?auto_814799 ?auto_814802 ) ) ( not ( = ?auto_814800 ?auto_814801 ) ) ( not ( = ?auto_814800 ?auto_814802 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_814801 ?auto_814802 )
      ( MAKE-10CRATE-VERIFY ?auto_814793 ?auto_814794 ?auto_814795 ?auto_814792 ?auto_814796 ?auto_814798 ?auto_814797 ?auto_814799 ?auto_814800 ?auto_814801 ?auto_814802 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_814887 - SURFACE
      ?auto_814888 - SURFACE
      ?auto_814889 - SURFACE
      ?auto_814886 - SURFACE
      ?auto_814890 - SURFACE
      ?auto_814892 - SURFACE
      ?auto_814891 - SURFACE
      ?auto_814893 - SURFACE
      ?auto_814894 - SURFACE
      ?auto_814895 - SURFACE
      ?auto_814896 - SURFACE
    )
    :vars
    (
      ?auto_814898 - HOIST
      ?auto_814897 - PLACE
      ?auto_814899 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_814898 ?auto_814897 ) ( SURFACE-AT ?auto_814895 ?auto_814897 ) ( CLEAR ?auto_814895 ) ( IS-CRATE ?auto_814896 ) ( not ( = ?auto_814895 ?auto_814896 ) ) ( TRUCK-AT ?auto_814899 ?auto_814897 ) ( AVAILABLE ?auto_814898 ) ( IN ?auto_814896 ?auto_814899 ) ( ON ?auto_814895 ?auto_814894 ) ( not ( = ?auto_814894 ?auto_814895 ) ) ( not ( = ?auto_814894 ?auto_814896 ) ) ( ON ?auto_814888 ?auto_814887 ) ( ON ?auto_814889 ?auto_814888 ) ( ON ?auto_814886 ?auto_814889 ) ( ON ?auto_814890 ?auto_814886 ) ( ON ?auto_814892 ?auto_814890 ) ( ON ?auto_814891 ?auto_814892 ) ( ON ?auto_814893 ?auto_814891 ) ( ON ?auto_814894 ?auto_814893 ) ( not ( = ?auto_814887 ?auto_814888 ) ) ( not ( = ?auto_814887 ?auto_814889 ) ) ( not ( = ?auto_814887 ?auto_814886 ) ) ( not ( = ?auto_814887 ?auto_814890 ) ) ( not ( = ?auto_814887 ?auto_814892 ) ) ( not ( = ?auto_814887 ?auto_814891 ) ) ( not ( = ?auto_814887 ?auto_814893 ) ) ( not ( = ?auto_814887 ?auto_814894 ) ) ( not ( = ?auto_814887 ?auto_814895 ) ) ( not ( = ?auto_814887 ?auto_814896 ) ) ( not ( = ?auto_814888 ?auto_814889 ) ) ( not ( = ?auto_814888 ?auto_814886 ) ) ( not ( = ?auto_814888 ?auto_814890 ) ) ( not ( = ?auto_814888 ?auto_814892 ) ) ( not ( = ?auto_814888 ?auto_814891 ) ) ( not ( = ?auto_814888 ?auto_814893 ) ) ( not ( = ?auto_814888 ?auto_814894 ) ) ( not ( = ?auto_814888 ?auto_814895 ) ) ( not ( = ?auto_814888 ?auto_814896 ) ) ( not ( = ?auto_814889 ?auto_814886 ) ) ( not ( = ?auto_814889 ?auto_814890 ) ) ( not ( = ?auto_814889 ?auto_814892 ) ) ( not ( = ?auto_814889 ?auto_814891 ) ) ( not ( = ?auto_814889 ?auto_814893 ) ) ( not ( = ?auto_814889 ?auto_814894 ) ) ( not ( = ?auto_814889 ?auto_814895 ) ) ( not ( = ?auto_814889 ?auto_814896 ) ) ( not ( = ?auto_814886 ?auto_814890 ) ) ( not ( = ?auto_814886 ?auto_814892 ) ) ( not ( = ?auto_814886 ?auto_814891 ) ) ( not ( = ?auto_814886 ?auto_814893 ) ) ( not ( = ?auto_814886 ?auto_814894 ) ) ( not ( = ?auto_814886 ?auto_814895 ) ) ( not ( = ?auto_814886 ?auto_814896 ) ) ( not ( = ?auto_814890 ?auto_814892 ) ) ( not ( = ?auto_814890 ?auto_814891 ) ) ( not ( = ?auto_814890 ?auto_814893 ) ) ( not ( = ?auto_814890 ?auto_814894 ) ) ( not ( = ?auto_814890 ?auto_814895 ) ) ( not ( = ?auto_814890 ?auto_814896 ) ) ( not ( = ?auto_814892 ?auto_814891 ) ) ( not ( = ?auto_814892 ?auto_814893 ) ) ( not ( = ?auto_814892 ?auto_814894 ) ) ( not ( = ?auto_814892 ?auto_814895 ) ) ( not ( = ?auto_814892 ?auto_814896 ) ) ( not ( = ?auto_814891 ?auto_814893 ) ) ( not ( = ?auto_814891 ?auto_814894 ) ) ( not ( = ?auto_814891 ?auto_814895 ) ) ( not ( = ?auto_814891 ?auto_814896 ) ) ( not ( = ?auto_814893 ?auto_814894 ) ) ( not ( = ?auto_814893 ?auto_814895 ) ) ( not ( = ?auto_814893 ?auto_814896 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_814894 ?auto_814895 ?auto_814896 )
      ( MAKE-10CRATE-VERIFY ?auto_814887 ?auto_814888 ?auto_814889 ?auto_814886 ?auto_814890 ?auto_814892 ?auto_814891 ?auto_814893 ?auto_814894 ?auto_814895 ?auto_814896 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_814992 - SURFACE
      ?auto_814993 - SURFACE
      ?auto_814994 - SURFACE
      ?auto_814991 - SURFACE
      ?auto_814995 - SURFACE
      ?auto_814997 - SURFACE
      ?auto_814996 - SURFACE
      ?auto_814998 - SURFACE
      ?auto_814999 - SURFACE
      ?auto_815000 - SURFACE
      ?auto_815001 - SURFACE
    )
    :vars
    (
      ?auto_815002 - HOIST
      ?auto_815005 - PLACE
      ?auto_815004 - TRUCK
      ?auto_815003 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_815002 ?auto_815005 ) ( SURFACE-AT ?auto_815000 ?auto_815005 ) ( CLEAR ?auto_815000 ) ( IS-CRATE ?auto_815001 ) ( not ( = ?auto_815000 ?auto_815001 ) ) ( AVAILABLE ?auto_815002 ) ( IN ?auto_815001 ?auto_815004 ) ( ON ?auto_815000 ?auto_814999 ) ( not ( = ?auto_814999 ?auto_815000 ) ) ( not ( = ?auto_814999 ?auto_815001 ) ) ( TRUCK-AT ?auto_815004 ?auto_815003 ) ( not ( = ?auto_815003 ?auto_815005 ) ) ( ON ?auto_814993 ?auto_814992 ) ( ON ?auto_814994 ?auto_814993 ) ( ON ?auto_814991 ?auto_814994 ) ( ON ?auto_814995 ?auto_814991 ) ( ON ?auto_814997 ?auto_814995 ) ( ON ?auto_814996 ?auto_814997 ) ( ON ?auto_814998 ?auto_814996 ) ( ON ?auto_814999 ?auto_814998 ) ( not ( = ?auto_814992 ?auto_814993 ) ) ( not ( = ?auto_814992 ?auto_814994 ) ) ( not ( = ?auto_814992 ?auto_814991 ) ) ( not ( = ?auto_814992 ?auto_814995 ) ) ( not ( = ?auto_814992 ?auto_814997 ) ) ( not ( = ?auto_814992 ?auto_814996 ) ) ( not ( = ?auto_814992 ?auto_814998 ) ) ( not ( = ?auto_814992 ?auto_814999 ) ) ( not ( = ?auto_814992 ?auto_815000 ) ) ( not ( = ?auto_814992 ?auto_815001 ) ) ( not ( = ?auto_814993 ?auto_814994 ) ) ( not ( = ?auto_814993 ?auto_814991 ) ) ( not ( = ?auto_814993 ?auto_814995 ) ) ( not ( = ?auto_814993 ?auto_814997 ) ) ( not ( = ?auto_814993 ?auto_814996 ) ) ( not ( = ?auto_814993 ?auto_814998 ) ) ( not ( = ?auto_814993 ?auto_814999 ) ) ( not ( = ?auto_814993 ?auto_815000 ) ) ( not ( = ?auto_814993 ?auto_815001 ) ) ( not ( = ?auto_814994 ?auto_814991 ) ) ( not ( = ?auto_814994 ?auto_814995 ) ) ( not ( = ?auto_814994 ?auto_814997 ) ) ( not ( = ?auto_814994 ?auto_814996 ) ) ( not ( = ?auto_814994 ?auto_814998 ) ) ( not ( = ?auto_814994 ?auto_814999 ) ) ( not ( = ?auto_814994 ?auto_815000 ) ) ( not ( = ?auto_814994 ?auto_815001 ) ) ( not ( = ?auto_814991 ?auto_814995 ) ) ( not ( = ?auto_814991 ?auto_814997 ) ) ( not ( = ?auto_814991 ?auto_814996 ) ) ( not ( = ?auto_814991 ?auto_814998 ) ) ( not ( = ?auto_814991 ?auto_814999 ) ) ( not ( = ?auto_814991 ?auto_815000 ) ) ( not ( = ?auto_814991 ?auto_815001 ) ) ( not ( = ?auto_814995 ?auto_814997 ) ) ( not ( = ?auto_814995 ?auto_814996 ) ) ( not ( = ?auto_814995 ?auto_814998 ) ) ( not ( = ?auto_814995 ?auto_814999 ) ) ( not ( = ?auto_814995 ?auto_815000 ) ) ( not ( = ?auto_814995 ?auto_815001 ) ) ( not ( = ?auto_814997 ?auto_814996 ) ) ( not ( = ?auto_814997 ?auto_814998 ) ) ( not ( = ?auto_814997 ?auto_814999 ) ) ( not ( = ?auto_814997 ?auto_815000 ) ) ( not ( = ?auto_814997 ?auto_815001 ) ) ( not ( = ?auto_814996 ?auto_814998 ) ) ( not ( = ?auto_814996 ?auto_814999 ) ) ( not ( = ?auto_814996 ?auto_815000 ) ) ( not ( = ?auto_814996 ?auto_815001 ) ) ( not ( = ?auto_814998 ?auto_814999 ) ) ( not ( = ?auto_814998 ?auto_815000 ) ) ( not ( = ?auto_814998 ?auto_815001 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_814999 ?auto_815000 ?auto_815001 )
      ( MAKE-10CRATE-VERIFY ?auto_814992 ?auto_814993 ?auto_814994 ?auto_814991 ?auto_814995 ?auto_814997 ?auto_814996 ?auto_814998 ?auto_814999 ?auto_815000 ?auto_815001 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_815107 - SURFACE
      ?auto_815108 - SURFACE
      ?auto_815109 - SURFACE
      ?auto_815106 - SURFACE
      ?auto_815110 - SURFACE
      ?auto_815112 - SURFACE
      ?auto_815111 - SURFACE
      ?auto_815113 - SURFACE
      ?auto_815114 - SURFACE
      ?auto_815115 - SURFACE
      ?auto_815116 - SURFACE
    )
    :vars
    (
      ?auto_815118 - HOIST
      ?auto_815119 - PLACE
      ?auto_815117 - TRUCK
      ?auto_815121 - PLACE
      ?auto_815120 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_815118 ?auto_815119 ) ( SURFACE-AT ?auto_815115 ?auto_815119 ) ( CLEAR ?auto_815115 ) ( IS-CRATE ?auto_815116 ) ( not ( = ?auto_815115 ?auto_815116 ) ) ( AVAILABLE ?auto_815118 ) ( ON ?auto_815115 ?auto_815114 ) ( not ( = ?auto_815114 ?auto_815115 ) ) ( not ( = ?auto_815114 ?auto_815116 ) ) ( TRUCK-AT ?auto_815117 ?auto_815121 ) ( not ( = ?auto_815121 ?auto_815119 ) ) ( HOIST-AT ?auto_815120 ?auto_815121 ) ( LIFTING ?auto_815120 ?auto_815116 ) ( not ( = ?auto_815118 ?auto_815120 ) ) ( ON ?auto_815108 ?auto_815107 ) ( ON ?auto_815109 ?auto_815108 ) ( ON ?auto_815106 ?auto_815109 ) ( ON ?auto_815110 ?auto_815106 ) ( ON ?auto_815112 ?auto_815110 ) ( ON ?auto_815111 ?auto_815112 ) ( ON ?auto_815113 ?auto_815111 ) ( ON ?auto_815114 ?auto_815113 ) ( not ( = ?auto_815107 ?auto_815108 ) ) ( not ( = ?auto_815107 ?auto_815109 ) ) ( not ( = ?auto_815107 ?auto_815106 ) ) ( not ( = ?auto_815107 ?auto_815110 ) ) ( not ( = ?auto_815107 ?auto_815112 ) ) ( not ( = ?auto_815107 ?auto_815111 ) ) ( not ( = ?auto_815107 ?auto_815113 ) ) ( not ( = ?auto_815107 ?auto_815114 ) ) ( not ( = ?auto_815107 ?auto_815115 ) ) ( not ( = ?auto_815107 ?auto_815116 ) ) ( not ( = ?auto_815108 ?auto_815109 ) ) ( not ( = ?auto_815108 ?auto_815106 ) ) ( not ( = ?auto_815108 ?auto_815110 ) ) ( not ( = ?auto_815108 ?auto_815112 ) ) ( not ( = ?auto_815108 ?auto_815111 ) ) ( not ( = ?auto_815108 ?auto_815113 ) ) ( not ( = ?auto_815108 ?auto_815114 ) ) ( not ( = ?auto_815108 ?auto_815115 ) ) ( not ( = ?auto_815108 ?auto_815116 ) ) ( not ( = ?auto_815109 ?auto_815106 ) ) ( not ( = ?auto_815109 ?auto_815110 ) ) ( not ( = ?auto_815109 ?auto_815112 ) ) ( not ( = ?auto_815109 ?auto_815111 ) ) ( not ( = ?auto_815109 ?auto_815113 ) ) ( not ( = ?auto_815109 ?auto_815114 ) ) ( not ( = ?auto_815109 ?auto_815115 ) ) ( not ( = ?auto_815109 ?auto_815116 ) ) ( not ( = ?auto_815106 ?auto_815110 ) ) ( not ( = ?auto_815106 ?auto_815112 ) ) ( not ( = ?auto_815106 ?auto_815111 ) ) ( not ( = ?auto_815106 ?auto_815113 ) ) ( not ( = ?auto_815106 ?auto_815114 ) ) ( not ( = ?auto_815106 ?auto_815115 ) ) ( not ( = ?auto_815106 ?auto_815116 ) ) ( not ( = ?auto_815110 ?auto_815112 ) ) ( not ( = ?auto_815110 ?auto_815111 ) ) ( not ( = ?auto_815110 ?auto_815113 ) ) ( not ( = ?auto_815110 ?auto_815114 ) ) ( not ( = ?auto_815110 ?auto_815115 ) ) ( not ( = ?auto_815110 ?auto_815116 ) ) ( not ( = ?auto_815112 ?auto_815111 ) ) ( not ( = ?auto_815112 ?auto_815113 ) ) ( not ( = ?auto_815112 ?auto_815114 ) ) ( not ( = ?auto_815112 ?auto_815115 ) ) ( not ( = ?auto_815112 ?auto_815116 ) ) ( not ( = ?auto_815111 ?auto_815113 ) ) ( not ( = ?auto_815111 ?auto_815114 ) ) ( not ( = ?auto_815111 ?auto_815115 ) ) ( not ( = ?auto_815111 ?auto_815116 ) ) ( not ( = ?auto_815113 ?auto_815114 ) ) ( not ( = ?auto_815113 ?auto_815115 ) ) ( not ( = ?auto_815113 ?auto_815116 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_815114 ?auto_815115 ?auto_815116 )
      ( MAKE-10CRATE-VERIFY ?auto_815107 ?auto_815108 ?auto_815109 ?auto_815106 ?auto_815110 ?auto_815112 ?auto_815111 ?auto_815113 ?auto_815114 ?auto_815115 ?auto_815116 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_815232 - SURFACE
      ?auto_815233 - SURFACE
      ?auto_815234 - SURFACE
      ?auto_815231 - SURFACE
      ?auto_815235 - SURFACE
      ?auto_815237 - SURFACE
      ?auto_815236 - SURFACE
      ?auto_815238 - SURFACE
      ?auto_815239 - SURFACE
      ?auto_815240 - SURFACE
      ?auto_815241 - SURFACE
    )
    :vars
    (
      ?auto_815245 - HOIST
      ?auto_815246 - PLACE
      ?auto_815242 - TRUCK
      ?auto_815247 - PLACE
      ?auto_815244 - HOIST
      ?auto_815243 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_815245 ?auto_815246 ) ( SURFACE-AT ?auto_815240 ?auto_815246 ) ( CLEAR ?auto_815240 ) ( IS-CRATE ?auto_815241 ) ( not ( = ?auto_815240 ?auto_815241 ) ) ( AVAILABLE ?auto_815245 ) ( ON ?auto_815240 ?auto_815239 ) ( not ( = ?auto_815239 ?auto_815240 ) ) ( not ( = ?auto_815239 ?auto_815241 ) ) ( TRUCK-AT ?auto_815242 ?auto_815247 ) ( not ( = ?auto_815247 ?auto_815246 ) ) ( HOIST-AT ?auto_815244 ?auto_815247 ) ( not ( = ?auto_815245 ?auto_815244 ) ) ( AVAILABLE ?auto_815244 ) ( SURFACE-AT ?auto_815241 ?auto_815247 ) ( ON ?auto_815241 ?auto_815243 ) ( CLEAR ?auto_815241 ) ( not ( = ?auto_815240 ?auto_815243 ) ) ( not ( = ?auto_815241 ?auto_815243 ) ) ( not ( = ?auto_815239 ?auto_815243 ) ) ( ON ?auto_815233 ?auto_815232 ) ( ON ?auto_815234 ?auto_815233 ) ( ON ?auto_815231 ?auto_815234 ) ( ON ?auto_815235 ?auto_815231 ) ( ON ?auto_815237 ?auto_815235 ) ( ON ?auto_815236 ?auto_815237 ) ( ON ?auto_815238 ?auto_815236 ) ( ON ?auto_815239 ?auto_815238 ) ( not ( = ?auto_815232 ?auto_815233 ) ) ( not ( = ?auto_815232 ?auto_815234 ) ) ( not ( = ?auto_815232 ?auto_815231 ) ) ( not ( = ?auto_815232 ?auto_815235 ) ) ( not ( = ?auto_815232 ?auto_815237 ) ) ( not ( = ?auto_815232 ?auto_815236 ) ) ( not ( = ?auto_815232 ?auto_815238 ) ) ( not ( = ?auto_815232 ?auto_815239 ) ) ( not ( = ?auto_815232 ?auto_815240 ) ) ( not ( = ?auto_815232 ?auto_815241 ) ) ( not ( = ?auto_815232 ?auto_815243 ) ) ( not ( = ?auto_815233 ?auto_815234 ) ) ( not ( = ?auto_815233 ?auto_815231 ) ) ( not ( = ?auto_815233 ?auto_815235 ) ) ( not ( = ?auto_815233 ?auto_815237 ) ) ( not ( = ?auto_815233 ?auto_815236 ) ) ( not ( = ?auto_815233 ?auto_815238 ) ) ( not ( = ?auto_815233 ?auto_815239 ) ) ( not ( = ?auto_815233 ?auto_815240 ) ) ( not ( = ?auto_815233 ?auto_815241 ) ) ( not ( = ?auto_815233 ?auto_815243 ) ) ( not ( = ?auto_815234 ?auto_815231 ) ) ( not ( = ?auto_815234 ?auto_815235 ) ) ( not ( = ?auto_815234 ?auto_815237 ) ) ( not ( = ?auto_815234 ?auto_815236 ) ) ( not ( = ?auto_815234 ?auto_815238 ) ) ( not ( = ?auto_815234 ?auto_815239 ) ) ( not ( = ?auto_815234 ?auto_815240 ) ) ( not ( = ?auto_815234 ?auto_815241 ) ) ( not ( = ?auto_815234 ?auto_815243 ) ) ( not ( = ?auto_815231 ?auto_815235 ) ) ( not ( = ?auto_815231 ?auto_815237 ) ) ( not ( = ?auto_815231 ?auto_815236 ) ) ( not ( = ?auto_815231 ?auto_815238 ) ) ( not ( = ?auto_815231 ?auto_815239 ) ) ( not ( = ?auto_815231 ?auto_815240 ) ) ( not ( = ?auto_815231 ?auto_815241 ) ) ( not ( = ?auto_815231 ?auto_815243 ) ) ( not ( = ?auto_815235 ?auto_815237 ) ) ( not ( = ?auto_815235 ?auto_815236 ) ) ( not ( = ?auto_815235 ?auto_815238 ) ) ( not ( = ?auto_815235 ?auto_815239 ) ) ( not ( = ?auto_815235 ?auto_815240 ) ) ( not ( = ?auto_815235 ?auto_815241 ) ) ( not ( = ?auto_815235 ?auto_815243 ) ) ( not ( = ?auto_815237 ?auto_815236 ) ) ( not ( = ?auto_815237 ?auto_815238 ) ) ( not ( = ?auto_815237 ?auto_815239 ) ) ( not ( = ?auto_815237 ?auto_815240 ) ) ( not ( = ?auto_815237 ?auto_815241 ) ) ( not ( = ?auto_815237 ?auto_815243 ) ) ( not ( = ?auto_815236 ?auto_815238 ) ) ( not ( = ?auto_815236 ?auto_815239 ) ) ( not ( = ?auto_815236 ?auto_815240 ) ) ( not ( = ?auto_815236 ?auto_815241 ) ) ( not ( = ?auto_815236 ?auto_815243 ) ) ( not ( = ?auto_815238 ?auto_815239 ) ) ( not ( = ?auto_815238 ?auto_815240 ) ) ( not ( = ?auto_815238 ?auto_815241 ) ) ( not ( = ?auto_815238 ?auto_815243 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_815239 ?auto_815240 ?auto_815241 )
      ( MAKE-10CRATE-VERIFY ?auto_815232 ?auto_815233 ?auto_815234 ?auto_815231 ?auto_815235 ?auto_815237 ?auto_815236 ?auto_815238 ?auto_815239 ?auto_815240 ?auto_815241 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_815358 - SURFACE
      ?auto_815359 - SURFACE
      ?auto_815360 - SURFACE
      ?auto_815357 - SURFACE
      ?auto_815361 - SURFACE
      ?auto_815363 - SURFACE
      ?auto_815362 - SURFACE
      ?auto_815364 - SURFACE
      ?auto_815365 - SURFACE
      ?auto_815366 - SURFACE
      ?auto_815367 - SURFACE
    )
    :vars
    (
      ?auto_815369 - HOIST
      ?auto_815368 - PLACE
      ?auto_815372 - PLACE
      ?auto_815370 - HOIST
      ?auto_815371 - SURFACE
      ?auto_815373 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_815369 ?auto_815368 ) ( SURFACE-AT ?auto_815366 ?auto_815368 ) ( CLEAR ?auto_815366 ) ( IS-CRATE ?auto_815367 ) ( not ( = ?auto_815366 ?auto_815367 ) ) ( AVAILABLE ?auto_815369 ) ( ON ?auto_815366 ?auto_815365 ) ( not ( = ?auto_815365 ?auto_815366 ) ) ( not ( = ?auto_815365 ?auto_815367 ) ) ( not ( = ?auto_815372 ?auto_815368 ) ) ( HOIST-AT ?auto_815370 ?auto_815372 ) ( not ( = ?auto_815369 ?auto_815370 ) ) ( AVAILABLE ?auto_815370 ) ( SURFACE-AT ?auto_815367 ?auto_815372 ) ( ON ?auto_815367 ?auto_815371 ) ( CLEAR ?auto_815367 ) ( not ( = ?auto_815366 ?auto_815371 ) ) ( not ( = ?auto_815367 ?auto_815371 ) ) ( not ( = ?auto_815365 ?auto_815371 ) ) ( TRUCK-AT ?auto_815373 ?auto_815368 ) ( ON ?auto_815359 ?auto_815358 ) ( ON ?auto_815360 ?auto_815359 ) ( ON ?auto_815357 ?auto_815360 ) ( ON ?auto_815361 ?auto_815357 ) ( ON ?auto_815363 ?auto_815361 ) ( ON ?auto_815362 ?auto_815363 ) ( ON ?auto_815364 ?auto_815362 ) ( ON ?auto_815365 ?auto_815364 ) ( not ( = ?auto_815358 ?auto_815359 ) ) ( not ( = ?auto_815358 ?auto_815360 ) ) ( not ( = ?auto_815358 ?auto_815357 ) ) ( not ( = ?auto_815358 ?auto_815361 ) ) ( not ( = ?auto_815358 ?auto_815363 ) ) ( not ( = ?auto_815358 ?auto_815362 ) ) ( not ( = ?auto_815358 ?auto_815364 ) ) ( not ( = ?auto_815358 ?auto_815365 ) ) ( not ( = ?auto_815358 ?auto_815366 ) ) ( not ( = ?auto_815358 ?auto_815367 ) ) ( not ( = ?auto_815358 ?auto_815371 ) ) ( not ( = ?auto_815359 ?auto_815360 ) ) ( not ( = ?auto_815359 ?auto_815357 ) ) ( not ( = ?auto_815359 ?auto_815361 ) ) ( not ( = ?auto_815359 ?auto_815363 ) ) ( not ( = ?auto_815359 ?auto_815362 ) ) ( not ( = ?auto_815359 ?auto_815364 ) ) ( not ( = ?auto_815359 ?auto_815365 ) ) ( not ( = ?auto_815359 ?auto_815366 ) ) ( not ( = ?auto_815359 ?auto_815367 ) ) ( not ( = ?auto_815359 ?auto_815371 ) ) ( not ( = ?auto_815360 ?auto_815357 ) ) ( not ( = ?auto_815360 ?auto_815361 ) ) ( not ( = ?auto_815360 ?auto_815363 ) ) ( not ( = ?auto_815360 ?auto_815362 ) ) ( not ( = ?auto_815360 ?auto_815364 ) ) ( not ( = ?auto_815360 ?auto_815365 ) ) ( not ( = ?auto_815360 ?auto_815366 ) ) ( not ( = ?auto_815360 ?auto_815367 ) ) ( not ( = ?auto_815360 ?auto_815371 ) ) ( not ( = ?auto_815357 ?auto_815361 ) ) ( not ( = ?auto_815357 ?auto_815363 ) ) ( not ( = ?auto_815357 ?auto_815362 ) ) ( not ( = ?auto_815357 ?auto_815364 ) ) ( not ( = ?auto_815357 ?auto_815365 ) ) ( not ( = ?auto_815357 ?auto_815366 ) ) ( not ( = ?auto_815357 ?auto_815367 ) ) ( not ( = ?auto_815357 ?auto_815371 ) ) ( not ( = ?auto_815361 ?auto_815363 ) ) ( not ( = ?auto_815361 ?auto_815362 ) ) ( not ( = ?auto_815361 ?auto_815364 ) ) ( not ( = ?auto_815361 ?auto_815365 ) ) ( not ( = ?auto_815361 ?auto_815366 ) ) ( not ( = ?auto_815361 ?auto_815367 ) ) ( not ( = ?auto_815361 ?auto_815371 ) ) ( not ( = ?auto_815363 ?auto_815362 ) ) ( not ( = ?auto_815363 ?auto_815364 ) ) ( not ( = ?auto_815363 ?auto_815365 ) ) ( not ( = ?auto_815363 ?auto_815366 ) ) ( not ( = ?auto_815363 ?auto_815367 ) ) ( not ( = ?auto_815363 ?auto_815371 ) ) ( not ( = ?auto_815362 ?auto_815364 ) ) ( not ( = ?auto_815362 ?auto_815365 ) ) ( not ( = ?auto_815362 ?auto_815366 ) ) ( not ( = ?auto_815362 ?auto_815367 ) ) ( not ( = ?auto_815362 ?auto_815371 ) ) ( not ( = ?auto_815364 ?auto_815365 ) ) ( not ( = ?auto_815364 ?auto_815366 ) ) ( not ( = ?auto_815364 ?auto_815367 ) ) ( not ( = ?auto_815364 ?auto_815371 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_815365 ?auto_815366 ?auto_815367 )
      ( MAKE-10CRATE-VERIFY ?auto_815358 ?auto_815359 ?auto_815360 ?auto_815357 ?auto_815361 ?auto_815363 ?auto_815362 ?auto_815364 ?auto_815365 ?auto_815366 ?auto_815367 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_815484 - SURFACE
      ?auto_815485 - SURFACE
      ?auto_815486 - SURFACE
      ?auto_815483 - SURFACE
      ?auto_815487 - SURFACE
      ?auto_815489 - SURFACE
      ?auto_815488 - SURFACE
      ?auto_815490 - SURFACE
      ?auto_815491 - SURFACE
      ?auto_815492 - SURFACE
      ?auto_815493 - SURFACE
    )
    :vars
    (
      ?auto_815499 - HOIST
      ?auto_815494 - PLACE
      ?auto_815495 - PLACE
      ?auto_815497 - HOIST
      ?auto_815498 - SURFACE
      ?auto_815496 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_815499 ?auto_815494 ) ( IS-CRATE ?auto_815493 ) ( not ( = ?auto_815492 ?auto_815493 ) ) ( not ( = ?auto_815491 ?auto_815492 ) ) ( not ( = ?auto_815491 ?auto_815493 ) ) ( not ( = ?auto_815495 ?auto_815494 ) ) ( HOIST-AT ?auto_815497 ?auto_815495 ) ( not ( = ?auto_815499 ?auto_815497 ) ) ( AVAILABLE ?auto_815497 ) ( SURFACE-AT ?auto_815493 ?auto_815495 ) ( ON ?auto_815493 ?auto_815498 ) ( CLEAR ?auto_815493 ) ( not ( = ?auto_815492 ?auto_815498 ) ) ( not ( = ?auto_815493 ?auto_815498 ) ) ( not ( = ?auto_815491 ?auto_815498 ) ) ( TRUCK-AT ?auto_815496 ?auto_815494 ) ( SURFACE-AT ?auto_815491 ?auto_815494 ) ( CLEAR ?auto_815491 ) ( LIFTING ?auto_815499 ?auto_815492 ) ( IS-CRATE ?auto_815492 ) ( ON ?auto_815485 ?auto_815484 ) ( ON ?auto_815486 ?auto_815485 ) ( ON ?auto_815483 ?auto_815486 ) ( ON ?auto_815487 ?auto_815483 ) ( ON ?auto_815489 ?auto_815487 ) ( ON ?auto_815488 ?auto_815489 ) ( ON ?auto_815490 ?auto_815488 ) ( ON ?auto_815491 ?auto_815490 ) ( not ( = ?auto_815484 ?auto_815485 ) ) ( not ( = ?auto_815484 ?auto_815486 ) ) ( not ( = ?auto_815484 ?auto_815483 ) ) ( not ( = ?auto_815484 ?auto_815487 ) ) ( not ( = ?auto_815484 ?auto_815489 ) ) ( not ( = ?auto_815484 ?auto_815488 ) ) ( not ( = ?auto_815484 ?auto_815490 ) ) ( not ( = ?auto_815484 ?auto_815491 ) ) ( not ( = ?auto_815484 ?auto_815492 ) ) ( not ( = ?auto_815484 ?auto_815493 ) ) ( not ( = ?auto_815484 ?auto_815498 ) ) ( not ( = ?auto_815485 ?auto_815486 ) ) ( not ( = ?auto_815485 ?auto_815483 ) ) ( not ( = ?auto_815485 ?auto_815487 ) ) ( not ( = ?auto_815485 ?auto_815489 ) ) ( not ( = ?auto_815485 ?auto_815488 ) ) ( not ( = ?auto_815485 ?auto_815490 ) ) ( not ( = ?auto_815485 ?auto_815491 ) ) ( not ( = ?auto_815485 ?auto_815492 ) ) ( not ( = ?auto_815485 ?auto_815493 ) ) ( not ( = ?auto_815485 ?auto_815498 ) ) ( not ( = ?auto_815486 ?auto_815483 ) ) ( not ( = ?auto_815486 ?auto_815487 ) ) ( not ( = ?auto_815486 ?auto_815489 ) ) ( not ( = ?auto_815486 ?auto_815488 ) ) ( not ( = ?auto_815486 ?auto_815490 ) ) ( not ( = ?auto_815486 ?auto_815491 ) ) ( not ( = ?auto_815486 ?auto_815492 ) ) ( not ( = ?auto_815486 ?auto_815493 ) ) ( not ( = ?auto_815486 ?auto_815498 ) ) ( not ( = ?auto_815483 ?auto_815487 ) ) ( not ( = ?auto_815483 ?auto_815489 ) ) ( not ( = ?auto_815483 ?auto_815488 ) ) ( not ( = ?auto_815483 ?auto_815490 ) ) ( not ( = ?auto_815483 ?auto_815491 ) ) ( not ( = ?auto_815483 ?auto_815492 ) ) ( not ( = ?auto_815483 ?auto_815493 ) ) ( not ( = ?auto_815483 ?auto_815498 ) ) ( not ( = ?auto_815487 ?auto_815489 ) ) ( not ( = ?auto_815487 ?auto_815488 ) ) ( not ( = ?auto_815487 ?auto_815490 ) ) ( not ( = ?auto_815487 ?auto_815491 ) ) ( not ( = ?auto_815487 ?auto_815492 ) ) ( not ( = ?auto_815487 ?auto_815493 ) ) ( not ( = ?auto_815487 ?auto_815498 ) ) ( not ( = ?auto_815489 ?auto_815488 ) ) ( not ( = ?auto_815489 ?auto_815490 ) ) ( not ( = ?auto_815489 ?auto_815491 ) ) ( not ( = ?auto_815489 ?auto_815492 ) ) ( not ( = ?auto_815489 ?auto_815493 ) ) ( not ( = ?auto_815489 ?auto_815498 ) ) ( not ( = ?auto_815488 ?auto_815490 ) ) ( not ( = ?auto_815488 ?auto_815491 ) ) ( not ( = ?auto_815488 ?auto_815492 ) ) ( not ( = ?auto_815488 ?auto_815493 ) ) ( not ( = ?auto_815488 ?auto_815498 ) ) ( not ( = ?auto_815490 ?auto_815491 ) ) ( not ( = ?auto_815490 ?auto_815492 ) ) ( not ( = ?auto_815490 ?auto_815493 ) ) ( not ( = ?auto_815490 ?auto_815498 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_815491 ?auto_815492 ?auto_815493 )
      ( MAKE-10CRATE-VERIFY ?auto_815484 ?auto_815485 ?auto_815486 ?auto_815483 ?auto_815487 ?auto_815489 ?auto_815488 ?auto_815490 ?auto_815491 ?auto_815492 ?auto_815493 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_815610 - SURFACE
      ?auto_815611 - SURFACE
      ?auto_815612 - SURFACE
      ?auto_815609 - SURFACE
      ?auto_815613 - SURFACE
      ?auto_815615 - SURFACE
      ?auto_815614 - SURFACE
      ?auto_815616 - SURFACE
      ?auto_815617 - SURFACE
      ?auto_815618 - SURFACE
      ?auto_815619 - SURFACE
    )
    :vars
    (
      ?auto_815623 - HOIST
      ?auto_815621 - PLACE
      ?auto_815624 - PLACE
      ?auto_815620 - HOIST
      ?auto_815625 - SURFACE
      ?auto_815622 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_815623 ?auto_815621 ) ( IS-CRATE ?auto_815619 ) ( not ( = ?auto_815618 ?auto_815619 ) ) ( not ( = ?auto_815617 ?auto_815618 ) ) ( not ( = ?auto_815617 ?auto_815619 ) ) ( not ( = ?auto_815624 ?auto_815621 ) ) ( HOIST-AT ?auto_815620 ?auto_815624 ) ( not ( = ?auto_815623 ?auto_815620 ) ) ( AVAILABLE ?auto_815620 ) ( SURFACE-AT ?auto_815619 ?auto_815624 ) ( ON ?auto_815619 ?auto_815625 ) ( CLEAR ?auto_815619 ) ( not ( = ?auto_815618 ?auto_815625 ) ) ( not ( = ?auto_815619 ?auto_815625 ) ) ( not ( = ?auto_815617 ?auto_815625 ) ) ( TRUCK-AT ?auto_815622 ?auto_815621 ) ( SURFACE-AT ?auto_815617 ?auto_815621 ) ( CLEAR ?auto_815617 ) ( IS-CRATE ?auto_815618 ) ( AVAILABLE ?auto_815623 ) ( IN ?auto_815618 ?auto_815622 ) ( ON ?auto_815611 ?auto_815610 ) ( ON ?auto_815612 ?auto_815611 ) ( ON ?auto_815609 ?auto_815612 ) ( ON ?auto_815613 ?auto_815609 ) ( ON ?auto_815615 ?auto_815613 ) ( ON ?auto_815614 ?auto_815615 ) ( ON ?auto_815616 ?auto_815614 ) ( ON ?auto_815617 ?auto_815616 ) ( not ( = ?auto_815610 ?auto_815611 ) ) ( not ( = ?auto_815610 ?auto_815612 ) ) ( not ( = ?auto_815610 ?auto_815609 ) ) ( not ( = ?auto_815610 ?auto_815613 ) ) ( not ( = ?auto_815610 ?auto_815615 ) ) ( not ( = ?auto_815610 ?auto_815614 ) ) ( not ( = ?auto_815610 ?auto_815616 ) ) ( not ( = ?auto_815610 ?auto_815617 ) ) ( not ( = ?auto_815610 ?auto_815618 ) ) ( not ( = ?auto_815610 ?auto_815619 ) ) ( not ( = ?auto_815610 ?auto_815625 ) ) ( not ( = ?auto_815611 ?auto_815612 ) ) ( not ( = ?auto_815611 ?auto_815609 ) ) ( not ( = ?auto_815611 ?auto_815613 ) ) ( not ( = ?auto_815611 ?auto_815615 ) ) ( not ( = ?auto_815611 ?auto_815614 ) ) ( not ( = ?auto_815611 ?auto_815616 ) ) ( not ( = ?auto_815611 ?auto_815617 ) ) ( not ( = ?auto_815611 ?auto_815618 ) ) ( not ( = ?auto_815611 ?auto_815619 ) ) ( not ( = ?auto_815611 ?auto_815625 ) ) ( not ( = ?auto_815612 ?auto_815609 ) ) ( not ( = ?auto_815612 ?auto_815613 ) ) ( not ( = ?auto_815612 ?auto_815615 ) ) ( not ( = ?auto_815612 ?auto_815614 ) ) ( not ( = ?auto_815612 ?auto_815616 ) ) ( not ( = ?auto_815612 ?auto_815617 ) ) ( not ( = ?auto_815612 ?auto_815618 ) ) ( not ( = ?auto_815612 ?auto_815619 ) ) ( not ( = ?auto_815612 ?auto_815625 ) ) ( not ( = ?auto_815609 ?auto_815613 ) ) ( not ( = ?auto_815609 ?auto_815615 ) ) ( not ( = ?auto_815609 ?auto_815614 ) ) ( not ( = ?auto_815609 ?auto_815616 ) ) ( not ( = ?auto_815609 ?auto_815617 ) ) ( not ( = ?auto_815609 ?auto_815618 ) ) ( not ( = ?auto_815609 ?auto_815619 ) ) ( not ( = ?auto_815609 ?auto_815625 ) ) ( not ( = ?auto_815613 ?auto_815615 ) ) ( not ( = ?auto_815613 ?auto_815614 ) ) ( not ( = ?auto_815613 ?auto_815616 ) ) ( not ( = ?auto_815613 ?auto_815617 ) ) ( not ( = ?auto_815613 ?auto_815618 ) ) ( not ( = ?auto_815613 ?auto_815619 ) ) ( not ( = ?auto_815613 ?auto_815625 ) ) ( not ( = ?auto_815615 ?auto_815614 ) ) ( not ( = ?auto_815615 ?auto_815616 ) ) ( not ( = ?auto_815615 ?auto_815617 ) ) ( not ( = ?auto_815615 ?auto_815618 ) ) ( not ( = ?auto_815615 ?auto_815619 ) ) ( not ( = ?auto_815615 ?auto_815625 ) ) ( not ( = ?auto_815614 ?auto_815616 ) ) ( not ( = ?auto_815614 ?auto_815617 ) ) ( not ( = ?auto_815614 ?auto_815618 ) ) ( not ( = ?auto_815614 ?auto_815619 ) ) ( not ( = ?auto_815614 ?auto_815625 ) ) ( not ( = ?auto_815616 ?auto_815617 ) ) ( not ( = ?auto_815616 ?auto_815618 ) ) ( not ( = ?auto_815616 ?auto_815619 ) ) ( not ( = ?auto_815616 ?auto_815625 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_815617 ?auto_815618 ?auto_815619 )
      ( MAKE-10CRATE-VERIFY ?auto_815610 ?auto_815611 ?auto_815612 ?auto_815609 ?auto_815613 ?auto_815615 ?auto_815614 ?auto_815616 ?auto_815617 ?auto_815618 ?auto_815619 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_822894 - SURFACE
      ?auto_822895 - SURFACE
      ?auto_822896 - SURFACE
      ?auto_822893 - SURFACE
      ?auto_822897 - SURFACE
      ?auto_822899 - SURFACE
      ?auto_822898 - SURFACE
      ?auto_822900 - SURFACE
      ?auto_822901 - SURFACE
      ?auto_822902 - SURFACE
      ?auto_822903 - SURFACE
      ?auto_822904 - SURFACE
    )
    :vars
    (
      ?auto_822905 - HOIST
      ?auto_822906 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_822905 ?auto_822906 ) ( SURFACE-AT ?auto_822903 ?auto_822906 ) ( CLEAR ?auto_822903 ) ( LIFTING ?auto_822905 ?auto_822904 ) ( IS-CRATE ?auto_822904 ) ( not ( = ?auto_822903 ?auto_822904 ) ) ( ON ?auto_822895 ?auto_822894 ) ( ON ?auto_822896 ?auto_822895 ) ( ON ?auto_822893 ?auto_822896 ) ( ON ?auto_822897 ?auto_822893 ) ( ON ?auto_822899 ?auto_822897 ) ( ON ?auto_822898 ?auto_822899 ) ( ON ?auto_822900 ?auto_822898 ) ( ON ?auto_822901 ?auto_822900 ) ( ON ?auto_822902 ?auto_822901 ) ( ON ?auto_822903 ?auto_822902 ) ( not ( = ?auto_822894 ?auto_822895 ) ) ( not ( = ?auto_822894 ?auto_822896 ) ) ( not ( = ?auto_822894 ?auto_822893 ) ) ( not ( = ?auto_822894 ?auto_822897 ) ) ( not ( = ?auto_822894 ?auto_822899 ) ) ( not ( = ?auto_822894 ?auto_822898 ) ) ( not ( = ?auto_822894 ?auto_822900 ) ) ( not ( = ?auto_822894 ?auto_822901 ) ) ( not ( = ?auto_822894 ?auto_822902 ) ) ( not ( = ?auto_822894 ?auto_822903 ) ) ( not ( = ?auto_822894 ?auto_822904 ) ) ( not ( = ?auto_822895 ?auto_822896 ) ) ( not ( = ?auto_822895 ?auto_822893 ) ) ( not ( = ?auto_822895 ?auto_822897 ) ) ( not ( = ?auto_822895 ?auto_822899 ) ) ( not ( = ?auto_822895 ?auto_822898 ) ) ( not ( = ?auto_822895 ?auto_822900 ) ) ( not ( = ?auto_822895 ?auto_822901 ) ) ( not ( = ?auto_822895 ?auto_822902 ) ) ( not ( = ?auto_822895 ?auto_822903 ) ) ( not ( = ?auto_822895 ?auto_822904 ) ) ( not ( = ?auto_822896 ?auto_822893 ) ) ( not ( = ?auto_822896 ?auto_822897 ) ) ( not ( = ?auto_822896 ?auto_822899 ) ) ( not ( = ?auto_822896 ?auto_822898 ) ) ( not ( = ?auto_822896 ?auto_822900 ) ) ( not ( = ?auto_822896 ?auto_822901 ) ) ( not ( = ?auto_822896 ?auto_822902 ) ) ( not ( = ?auto_822896 ?auto_822903 ) ) ( not ( = ?auto_822896 ?auto_822904 ) ) ( not ( = ?auto_822893 ?auto_822897 ) ) ( not ( = ?auto_822893 ?auto_822899 ) ) ( not ( = ?auto_822893 ?auto_822898 ) ) ( not ( = ?auto_822893 ?auto_822900 ) ) ( not ( = ?auto_822893 ?auto_822901 ) ) ( not ( = ?auto_822893 ?auto_822902 ) ) ( not ( = ?auto_822893 ?auto_822903 ) ) ( not ( = ?auto_822893 ?auto_822904 ) ) ( not ( = ?auto_822897 ?auto_822899 ) ) ( not ( = ?auto_822897 ?auto_822898 ) ) ( not ( = ?auto_822897 ?auto_822900 ) ) ( not ( = ?auto_822897 ?auto_822901 ) ) ( not ( = ?auto_822897 ?auto_822902 ) ) ( not ( = ?auto_822897 ?auto_822903 ) ) ( not ( = ?auto_822897 ?auto_822904 ) ) ( not ( = ?auto_822899 ?auto_822898 ) ) ( not ( = ?auto_822899 ?auto_822900 ) ) ( not ( = ?auto_822899 ?auto_822901 ) ) ( not ( = ?auto_822899 ?auto_822902 ) ) ( not ( = ?auto_822899 ?auto_822903 ) ) ( not ( = ?auto_822899 ?auto_822904 ) ) ( not ( = ?auto_822898 ?auto_822900 ) ) ( not ( = ?auto_822898 ?auto_822901 ) ) ( not ( = ?auto_822898 ?auto_822902 ) ) ( not ( = ?auto_822898 ?auto_822903 ) ) ( not ( = ?auto_822898 ?auto_822904 ) ) ( not ( = ?auto_822900 ?auto_822901 ) ) ( not ( = ?auto_822900 ?auto_822902 ) ) ( not ( = ?auto_822900 ?auto_822903 ) ) ( not ( = ?auto_822900 ?auto_822904 ) ) ( not ( = ?auto_822901 ?auto_822902 ) ) ( not ( = ?auto_822901 ?auto_822903 ) ) ( not ( = ?auto_822901 ?auto_822904 ) ) ( not ( = ?auto_822902 ?auto_822903 ) ) ( not ( = ?auto_822902 ?auto_822904 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_822903 ?auto_822904 )
      ( MAKE-11CRATE-VERIFY ?auto_822894 ?auto_822895 ?auto_822896 ?auto_822893 ?auto_822897 ?auto_822899 ?auto_822898 ?auto_822900 ?auto_822901 ?auto_822902 ?auto_822903 ?auto_822904 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_823003 - SURFACE
      ?auto_823004 - SURFACE
      ?auto_823005 - SURFACE
      ?auto_823002 - SURFACE
      ?auto_823006 - SURFACE
      ?auto_823008 - SURFACE
      ?auto_823007 - SURFACE
      ?auto_823009 - SURFACE
      ?auto_823010 - SURFACE
      ?auto_823011 - SURFACE
      ?auto_823012 - SURFACE
      ?auto_823013 - SURFACE
    )
    :vars
    (
      ?auto_823015 - HOIST
      ?auto_823014 - PLACE
      ?auto_823016 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_823015 ?auto_823014 ) ( SURFACE-AT ?auto_823012 ?auto_823014 ) ( CLEAR ?auto_823012 ) ( IS-CRATE ?auto_823013 ) ( not ( = ?auto_823012 ?auto_823013 ) ) ( TRUCK-AT ?auto_823016 ?auto_823014 ) ( AVAILABLE ?auto_823015 ) ( IN ?auto_823013 ?auto_823016 ) ( ON ?auto_823012 ?auto_823011 ) ( not ( = ?auto_823011 ?auto_823012 ) ) ( not ( = ?auto_823011 ?auto_823013 ) ) ( ON ?auto_823004 ?auto_823003 ) ( ON ?auto_823005 ?auto_823004 ) ( ON ?auto_823002 ?auto_823005 ) ( ON ?auto_823006 ?auto_823002 ) ( ON ?auto_823008 ?auto_823006 ) ( ON ?auto_823007 ?auto_823008 ) ( ON ?auto_823009 ?auto_823007 ) ( ON ?auto_823010 ?auto_823009 ) ( ON ?auto_823011 ?auto_823010 ) ( not ( = ?auto_823003 ?auto_823004 ) ) ( not ( = ?auto_823003 ?auto_823005 ) ) ( not ( = ?auto_823003 ?auto_823002 ) ) ( not ( = ?auto_823003 ?auto_823006 ) ) ( not ( = ?auto_823003 ?auto_823008 ) ) ( not ( = ?auto_823003 ?auto_823007 ) ) ( not ( = ?auto_823003 ?auto_823009 ) ) ( not ( = ?auto_823003 ?auto_823010 ) ) ( not ( = ?auto_823003 ?auto_823011 ) ) ( not ( = ?auto_823003 ?auto_823012 ) ) ( not ( = ?auto_823003 ?auto_823013 ) ) ( not ( = ?auto_823004 ?auto_823005 ) ) ( not ( = ?auto_823004 ?auto_823002 ) ) ( not ( = ?auto_823004 ?auto_823006 ) ) ( not ( = ?auto_823004 ?auto_823008 ) ) ( not ( = ?auto_823004 ?auto_823007 ) ) ( not ( = ?auto_823004 ?auto_823009 ) ) ( not ( = ?auto_823004 ?auto_823010 ) ) ( not ( = ?auto_823004 ?auto_823011 ) ) ( not ( = ?auto_823004 ?auto_823012 ) ) ( not ( = ?auto_823004 ?auto_823013 ) ) ( not ( = ?auto_823005 ?auto_823002 ) ) ( not ( = ?auto_823005 ?auto_823006 ) ) ( not ( = ?auto_823005 ?auto_823008 ) ) ( not ( = ?auto_823005 ?auto_823007 ) ) ( not ( = ?auto_823005 ?auto_823009 ) ) ( not ( = ?auto_823005 ?auto_823010 ) ) ( not ( = ?auto_823005 ?auto_823011 ) ) ( not ( = ?auto_823005 ?auto_823012 ) ) ( not ( = ?auto_823005 ?auto_823013 ) ) ( not ( = ?auto_823002 ?auto_823006 ) ) ( not ( = ?auto_823002 ?auto_823008 ) ) ( not ( = ?auto_823002 ?auto_823007 ) ) ( not ( = ?auto_823002 ?auto_823009 ) ) ( not ( = ?auto_823002 ?auto_823010 ) ) ( not ( = ?auto_823002 ?auto_823011 ) ) ( not ( = ?auto_823002 ?auto_823012 ) ) ( not ( = ?auto_823002 ?auto_823013 ) ) ( not ( = ?auto_823006 ?auto_823008 ) ) ( not ( = ?auto_823006 ?auto_823007 ) ) ( not ( = ?auto_823006 ?auto_823009 ) ) ( not ( = ?auto_823006 ?auto_823010 ) ) ( not ( = ?auto_823006 ?auto_823011 ) ) ( not ( = ?auto_823006 ?auto_823012 ) ) ( not ( = ?auto_823006 ?auto_823013 ) ) ( not ( = ?auto_823008 ?auto_823007 ) ) ( not ( = ?auto_823008 ?auto_823009 ) ) ( not ( = ?auto_823008 ?auto_823010 ) ) ( not ( = ?auto_823008 ?auto_823011 ) ) ( not ( = ?auto_823008 ?auto_823012 ) ) ( not ( = ?auto_823008 ?auto_823013 ) ) ( not ( = ?auto_823007 ?auto_823009 ) ) ( not ( = ?auto_823007 ?auto_823010 ) ) ( not ( = ?auto_823007 ?auto_823011 ) ) ( not ( = ?auto_823007 ?auto_823012 ) ) ( not ( = ?auto_823007 ?auto_823013 ) ) ( not ( = ?auto_823009 ?auto_823010 ) ) ( not ( = ?auto_823009 ?auto_823011 ) ) ( not ( = ?auto_823009 ?auto_823012 ) ) ( not ( = ?auto_823009 ?auto_823013 ) ) ( not ( = ?auto_823010 ?auto_823011 ) ) ( not ( = ?auto_823010 ?auto_823012 ) ) ( not ( = ?auto_823010 ?auto_823013 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_823011 ?auto_823012 ?auto_823013 )
      ( MAKE-11CRATE-VERIFY ?auto_823003 ?auto_823004 ?auto_823005 ?auto_823002 ?auto_823006 ?auto_823008 ?auto_823007 ?auto_823009 ?auto_823010 ?auto_823011 ?auto_823012 ?auto_823013 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_823124 - SURFACE
      ?auto_823125 - SURFACE
      ?auto_823126 - SURFACE
      ?auto_823123 - SURFACE
      ?auto_823127 - SURFACE
      ?auto_823129 - SURFACE
      ?auto_823128 - SURFACE
      ?auto_823130 - SURFACE
      ?auto_823131 - SURFACE
      ?auto_823132 - SURFACE
      ?auto_823133 - SURFACE
      ?auto_823134 - SURFACE
    )
    :vars
    (
      ?auto_823137 - HOIST
      ?auto_823135 - PLACE
      ?auto_823138 - TRUCK
      ?auto_823136 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_823137 ?auto_823135 ) ( SURFACE-AT ?auto_823133 ?auto_823135 ) ( CLEAR ?auto_823133 ) ( IS-CRATE ?auto_823134 ) ( not ( = ?auto_823133 ?auto_823134 ) ) ( AVAILABLE ?auto_823137 ) ( IN ?auto_823134 ?auto_823138 ) ( ON ?auto_823133 ?auto_823132 ) ( not ( = ?auto_823132 ?auto_823133 ) ) ( not ( = ?auto_823132 ?auto_823134 ) ) ( TRUCK-AT ?auto_823138 ?auto_823136 ) ( not ( = ?auto_823136 ?auto_823135 ) ) ( ON ?auto_823125 ?auto_823124 ) ( ON ?auto_823126 ?auto_823125 ) ( ON ?auto_823123 ?auto_823126 ) ( ON ?auto_823127 ?auto_823123 ) ( ON ?auto_823129 ?auto_823127 ) ( ON ?auto_823128 ?auto_823129 ) ( ON ?auto_823130 ?auto_823128 ) ( ON ?auto_823131 ?auto_823130 ) ( ON ?auto_823132 ?auto_823131 ) ( not ( = ?auto_823124 ?auto_823125 ) ) ( not ( = ?auto_823124 ?auto_823126 ) ) ( not ( = ?auto_823124 ?auto_823123 ) ) ( not ( = ?auto_823124 ?auto_823127 ) ) ( not ( = ?auto_823124 ?auto_823129 ) ) ( not ( = ?auto_823124 ?auto_823128 ) ) ( not ( = ?auto_823124 ?auto_823130 ) ) ( not ( = ?auto_823124 ?auto_823131 ) ) ( not ( = ?auto_823124 ?auto_823132 ) ) ( not ( = ?auto_823124 ?auto_823133 ) ) ( not ( = ?auto_823124 ?auto_823134 ) ) ( not ( = ?auto_823125 ?auto_823126 ) ) ( not ( = ?auto_823125 ?auto_823123 ) ) ( not ( = ?auto_823125 ?auto_823127 ) ) ( not ( = ?auto_823125 ?auto_823129 ) ) ( not ( = ?auto_823125 ?auto_823128 ) ) ( not ( = ?auto_823125 ?auto_823130 ) ) ( not ( = ?auto_823125 ?auto_823131 ) ) ( not ( = ?auto_823125 ?auto_823132 ) ) ( not ( = ?auto_823125 ?auto_823133 ) ) ( not ( = ?auto_823125 ?auto_823134 ) ) ( not ( = ?auto_823126 ?auto_823123 ) ) ( not ( = ?auto_823126 ?auto_823127 ) ) ( not ( = ?auto_823126 ?auto_823129 ) ) ( not ( = ?auto_823126 ?auto_823128 ) ) ( not ( = ?auto_823126 ?auto_823130 ) ) ( not ( = ?auto_823126 ?auto_823131 ) ) ( not ( = ?auto_823126 ?auto_823132 ) ) ( not ( = ?auto_823126 ?auto_823133 ) ) ( not ( = ?auto_823126 ?auto_823134 ) ) ( not ( = ?auto_823123 ?auto_823127 ) ) ( not ( = ?auto_823123 ?auto_823129 ) ) ( not ( = ?auto_823123 ?auto_823128 ) ) ( not ( = ?auto_823123 ?auto_823130 ) ) ( not ( = ?auto_823123 ?auto_823131 ) ) ( not ( = ?auto_823123 ?auto_823132 ) ) ( not ( = ?auto_823123 ?auto_823133 ) ) ( not ( = ?auto_823123 ?auto_823134 ) ) ( not ( = ?auto_823127 ?auto_823129 ) ) ( not ( = ?auto_823127 ?auto_823128 ) ) ( not ( = ?auto_823127 ?auto_823130 ) ) ( not ( = ?auto_823127 ?auto_823131 ) ) ( not ( = ?auto_823127 ?auto_823132 ) ) ( not ( = ?auto_823127 ?auto_823133 ) ) ( not ( = ?auto_823127 ?auto_823134 ) ) ( not ( = ?auto_823129 ?auto_823128 ) ) ( not ( = ?auto_823129 ?auto_823130 ) ) ( not ( = ?auto_823129 ?auto_823131 ) ) ( not ( = ?auto_823129 ?auto_823132 ) ) ( not ( = ?auto_823129 ?auto_823133 ) ) ( not ( = ?auto_823129 ?auto_823134 ) ) ( not ( = ?auto_823128 ?auto_823130 ) ) ( not ( = ?auto_823128 ?auto_823131 ) ) ( not ( = ?auto_823128 ?auto_823132 ) ) ( not ( = ?auto_823128 ?auto_823133 ) ) ( not ( = ?auto_823128 ?auto_823134 ) ) ( not ( = ?auto_823130 ?auto_823131 ) ) ( not ( = ?auto_823130 ?auto_823132 ) ) ( not ( = ?auto_823130 ?auto_823133 ) ) ( not ( = ?auto_823130 ?auto_823134 ) ) ( not ( = ?auto_823131 ?auto_823132 ) ) ( not ( = ?auto_823131 ?auto_823133 ) ) ( not ( = ?auto_823131 ?auto_823134 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_823132 ?auto_823133 ?auto_823134 )
      ( MAKE-11CRATE-VERIFY ?auto_823124 ?auto_823125 ?auto_823126 ?auto_823123 ?auto_823127 ?auto_823129 ?auto_823128 ?auto_823130 ?auto_823131 ?auto_823132 ?auto_823133 ?auto_823134 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_823256 - SURFACE
      ?auto_823257 - SURFACE
      ?auto_823258 - SURFACE
      ?auto_823255 - SURFACE
      ?auto_823259 - SURFACE
      ?auto_823261 - SURFACE
      ?auto_823260 - SURFACE
      ?auto_823262 - SURFACE
      ?auto_823263 - SURFACE
      ?auto_823264 - SURFACE
      ?auto_823265 - SURFACE
      ?auto_823266 - SURFACE
    )
    :vars
    (
      ?auto_823270 - HOIST
      ?auto_823268 - PLACE
      ?auto_823267 - TRUCK
      ?auto_823269 - PLACE
      ?auto_823271 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_823270 ?auto_823268 ) ( SURFACE-AT ?auto_823265 ?auto_823268 ) ( CLEAR ?auto_823265 ) ( IS-CRATE ?auto_823266 ) ( not ( = ?auto_823265 ?auto_823266 ) ) ( AVAILABLE ?auto_823270 ) ( ON ?auto_823265 ?auto_823264 ) ( not ( = ?auto_823264 ?auto_823265 ) ) ( not ( = ?auto_823264 ?auto_823266 ) ) ( TRUCK-AT ?auto_823267 ?auto_823269 ) ( not ( = ?auto_823269 ?auto_823268 ) ) ( HOIST-AT ?auto_823271 ?auto_823269 ) ( LIFTING ?auto_823271 ?auto_823266 ) ( not ( = ?auto_823270 ?auto_823271 ) ) ( ON ?auto_823257 ?auto_823256 ) ( ON ?auto_823258 ?auto_823257 ) ( ON ?auto_823255 ?auto_823258 ) ( ON ?auto_823259 ?auto_823255 ) ( ON ?auto_823261 ?auto_823259 ) ( ON ?auto_823260 ?auto_823261 ) ( ON ?auto_823262 ?auto_823260 ) ( ON ?auto_823263 ?auto_823262 ) ( ON ?auto_823264 ?auto_823263 ) ( not ( = ?auto_823256 ?auto_823257 ) ) ( not ( = ?auto_823256 ?auto_823258 ) ) ( not ( = ?auto_823256 ?auto_823255 ) ) ( not ( = ?auto_823256 ?auto_823259 ) ) ( not ( = ?auto_823256 ?auto_823261 ) ) ( not ( = ?auto_823256 ?auto_823260 ) ) ( not ( = ?auto_823256 ?auto_823262 ) ) ( not ( = ?auto_823256 ?auto_823263 ) ) ( not ( = ?auto_823256 ?auto_823264 ) ) ( not ( = ?auto_823256 ?auto_823265 ) ) ( not ( = ?auto_823256 ?auto_823266 ) ) ( not ( = ?auto_823257 ?auto_823258 ) ) ( not ( = ?auto_823257 ?auto_823255 ) ) ( not ( = ?auto_823257 ?auto_823259 ) ) ( not ( = ?auto_823257 ?auto_823261 ) ) ( not ( = ?auto_823257 ?auto_823260 ) ) ( not ( = ?auto_823257 ?auto_823262 ) ) ( not ( = ?auto_823257 ?auto_823263 ) ) ( not ( = ?auto_823257 ?auto_823264 ) ) ( not ( = ?auto_823257 ?auto_823265 ) ) ( not ( = ?auto_823257 ?auto_823266 ) ) ( not ( = ?auto_823258 ?auto_823255 ) ) ( not ( = ?auto_823258 ?auto_823259 ) ) ( not ( = ?auto_823258 ?auto_823261 ) ) ( not ( = ?auto_823258 ?auto_823260 ) ) ( not ( = ?auto_823258 ?auto_823262 ) ) ( not ( = ?auto_823258 ?auto_823263 ) ) ( not ( = ?auto_823258 ?auto_823264 ) ) ( not ( = ?auto_823258 ?auto_823265 ) ) ( not ( = ?auto_823258 ?auto_823266 ) ) ( not ( = ?auto_823255 ?auto_823259 ) ) ( not ( = ?auto_823255 ?auto_823261 ) ) ( not ( = ?auto_823255 ?auto_823260 ) ) ( not ( = ?auto_823255 ?auto_823262 ) ) ( not ( = ?auto_823255 ?auto_823263 ) ) ( not ( = ?auto_823255 ?auto_823264 ) ) ( not ( = ?auto_823255 ?auto_823265 ) ) ( not ( = ?auto_823255 ?auto_823266 ) ) ( not ( = ?auto_823259 ?auto_823261 ) ) ( not ( = ?auto_823259 ?auto_823260 ) ) ( not ( = ?auto_823259 ?auto_823262 ) ) ( not ( = ?auto_823259 ?auto_823263 ) ) ( not ( = ?auto_823259 ?auto_823264 ) ) ( not ( = ?auto_823259 ?auto_823265 ) ) ( not ( = ?auto_823259 ?auto_823266 ) ) ( not ( = ?auto_823261 ?auto_823260 ) ) ( not ( = ?auto_823261 ?auto_823262 ) ) ( not ( = ?auto_823261 ?auto_823263 ) ) ( not ( = ?auto_823261 ?auto_823264 ) ) ( not ( = ?auto_823261 ?auto_823265 ) ) ( not ( = ?auto_823261 ?auto_823266 ) ) ( not ( = ?auto_823260 ?auto_823262 ) ) ( not ( = ?auto_823260 ?auto_823263 ) ) ( not ( = ?auto_823260 ?auto_823264 ) ) ( not ( = ?auto_823260 ?auto_823265 ) ) ( not ( = ?auto_823260 ?auto_823266 ) ) ( not ( = ?auto_823262 ?auto_823263 ) ) ( not ( = ?auto_823262 ?auto_823264 ) ) ( not ( = ?auto_823262 ?auto_823265 ) ) ( not ( = ?auto_823262 ?auto_823266 ) ) ( not ( = ?auto_823263 ?auto_823264 ) ) ( not ( = ?auto_823263 ?auto_823265 ) ) ( not ( = ?auto_823263 ?auto_823266 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_823264 ?auto_823265 ?auto_823266 )
      ( MAKE-11CRATE-VERIFY ?auto_823256 ?auto_823257 ?auto_823258 ?auto_823255 ?auto_823259 ?auto_823261 ?auto_823260 ?auto_823262 ?auto_823263 ?auto_823264 ?auto_823265 ?auto_823266 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_823399 - SURFACE
      ?auto_823400 - SURFACE
      ?auto_823401 - SURFACE
      ?auto_823398 - SURFACE
      ?auto_823402 - SURFACE
      ?auto_823404 - SURFACE
      ?auto_823403 - SURFACE
      ?auto_823405 - SURFACE
      ?auto_823406 - SURFACE
      ?auto_823407 - SURFACE
      ?auto_823408 - SURFACE
      ?auto_823409 - SURFACE
    )
    :vars
    (
      ?auto_823415 - HOIST
      ?auto_823413 - PLACE
      ?auto_823411 - TRUCK
      ?auto_823414 - PLACE
      ?auto_823410 - HOIST
      ?auto_823412 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_823415 ?auto_823413 ) ( SURFACE-AT ?auto_823408 ?auto_823413 ) ( CLEAR ?auto_823408 ) ( IS-CRATE ?auto_823409 ) ( not ( = ?auto_823408 ?auto_823409 ) ) ( AVAILABLE ?auto_823415 ) ( ON ?auto_823408 ?auto_823407 ) ( not ( = ?auto_823407 ?auto_823408 ) ) ( not ( = ?auto_823407 ?auto_823409 ) ) ( TRUCK-AT ?auto_823411 ?auto_823414 ) ( not ( = ?auto_823414 ?auto_823413 ) ) ( HOIST-AT ?auto_823410 ?auto_823414 ) ( not ( = ?auto_823415 ?auto_823410 ) ) ( AVAILABLE ?auto_823410 ) ( SURFACE-AT ?auto_823409 ?auto_823414 ) ( ON ?auto_823409 ?auto_823412 ) ( CLEAR ?auto_823409 ) ( not ( = ?auto_823408 ?auto_823412 ) ) ( not ( = ?auto_823409 ?auto_823412 ) ) ( not ( = ?auto_823407 ?auto_823412 ) ) ( ON ?auto_823400 ?auto_823399 ) ( ON ?auto_823401 ?auto_823400 ) ( ON ?auto_823398 ?auto_823401 ) ( ON ?auto_823402 ?auto_823398 ) ( ON ?auto_823404 ?auto_823402 ) ( ON ?auto_823403 ?auto_823404 ) ( ON ?auto_823405 ?auto_823403 ) ( ON ?auto_823406 ?auto_823405 ) ( ON ?auto_823407 ?auto_823406 ) ( not ( = ?auto_823399 ?auto_823400 ) ) ( not ( = ?auto_823399 ?auto_823401 ) ) ( not ( = ?auto_823399 ?auto_823398 ) ) ( not ( = ?auto_823399 ?auto_823402 ) ) ( not ( = ?auto_823399 ?auto_823404 ) ) ( not ( = ?auto_823399 ?auto_823403 ) ) ( not ( = ?auto_823399 ?auto_823405 ) ) ( not ( = ?auto_823399 ?auto_823406 ) ) ( not ( = ?auto_823399 ?auto_823407 ) ) ( not ( = ?auto_823399 ?auto_823408 ) ) ( not ( = ?auto_823399 ?auto_823409 ) ) ( not ( = ?auto_823399 ?auto_823412 ) ) ( not ( = ?auto_823400 ?auto_823401 ) ) ( not ( = ?auto_823400 ?auto_823398 ) ) ( not ( = ?auto_823400 ?auto_823402 ) ) ( not ( = ?auto_823400 ?auto_823404 ) ) ( not ( = ?auto_823400 ?auto_823403 ) ) ( not ( = ?auto_823400 ?auto_823405 ) ) ( not ( = ?auto_823400 ?auto_823406 ) ) ( not ( = ?auto_823400 ?auto_823407 ) ) ( not ( = ?auto_823400 ?auto_823408 ) ) ( not ( = ?auto_823400 ?auto_823409 ) ) ( not ( = ?auto_823400 ?auto_823412 ) ) ( not ( = ?auto_823401 ?auto_823398 ) ) ( not ( = ?auto_823401 ?auto_823402 ) ) ( not ( = ?auto_823401 ?auto_823404 ) ) ( not ( = ?auto_823401 ?auto_823403 ) ) ( not ( = ?auto_823401 ?auto_823405 ) ) ( not ( = ?auto_823401 ?auto_823406 ) ) ( not ( = ?auto_823401 ?auto_823407 ) ) ( not ( = ?auto_823401 ?auto_823408 ) ) ( not ( = ?auto_823401 ?auto_823409 ) ) ( not ( = ?auto_823401 ?auto_823412 ) ) ( not ( = ?auto_823398 ?auto_823402 ) ) ( not ( = ?auto_823398 ?auto_823404 ) ) ( not ( = ?auto_823398 ?auto_823403 ) ) ( not ( = ?auto_823398 ?auto_823405 ) ) ( not ( = ?auto_823398 ?auto_823406 ) ) ( not ( = ?auto_823398 ?auto_823407 ) ) ( not ( = ?auto_823398 ?auto_823408 ) ) ( not ( = ?auto_823398 ?auto_823409 ) ) ( not ( = ?auto_823398 ?auto_823412 ) ) ( not ( = ?auto_823402 ?auto_823404 ) ) ( not ( = ?auto_823402 ?auto_823403 ) ) ( not ( = ?auto_823402 ?auto_823405 ) ) ( not ( = ?auto_823402 ?auto_823406 ) ) ( not ( = ?auto_823402 ?auto_823407 ) ) ( not ( = ?auto_823402 ?auto_823408 ) ) ( not ( = ?auto_823402 ?auto_823409 ) ) ( not ( = ?auto_823402 ?auto_823412 ) ) ( not ( = ?auto_823404 ?auto_823403 ) ) ( not ( = ?auto_823404 ?auto_823405 ) ) ( not ( = ?auto_823404 ?auto_823406 ) ) ( not ( = ?auto_823404 ?auto_823407 ) ) ( not ( = ?auto_823404 ?auto_823408 ) ) ( not ( = ?auto_823404 ?auto_823409 ) ) ( not ( = ?auto_823404 ?auto_823412 ) ) ( not ( = ?auto_823403 ?auto_823405 ) ) ( not ( = ?auto_823403 ?auto_823406 ) ) ( not ( = ?auto_823403 ?auto_823407 ) ) ( not ( = ?auto_823403 ?auto_823408 ) ) ( not ( = ?auto_823403 ?auto_823409 ) ) ( not ( = ?auto_823403 ?auto_823412 ) ) ( not ( = ?auto_823405 ?auto_823406 ) ) ( not ( = ?auto_823405 ?auto_823407 ) ) ( not ( = ?auto_823405 ?auto_823408 ) ) ( not ( = ?auto_823405 ?auto_823409 ) ) ( not ( = ?auto_823405 ?auto_823412 ) ) ( not ( = ?auto_823406 ?auto_823407 ) ) ( not ( = ?auto_823406 ?auto_823408 ) ) ( not ( = ?auto_823406 ?auto_823409 ) ) ( not ( = ?auto_823406 ?auto_823412 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_823407 ?auto_823408 ?auto_823409 )
      ( MAKE-11CRATE-VERIFY ?auto_823399 ?auto_823400 ?auto_823401 ?auto_823398 ?auto_823402 ?auto_823404 ?auto_823403 ?auto_823405 ?auto_823406 ?auto_823407 ?auto_823408 ?auto_823409 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_823543 - SURFACE
      ?auto_823544 - SURFACE
      ?auto_823545 - SURFACE
      ?auto_823542 - SURFACE
      ?auto_823546 - SURFACE
      ?auto_823548 - SURFACE
      ?auto_823547 - SURFACE
      ?auto_823549 - SURFACE
      ?auto_823550 - SURFACE
      ?auto_823551 - SURFACE
      ?auto_823552 - SURFACE
      ?auto_823553 - SURFACE
    )
    :vars
    (
      ?auto_823556 - HOIST
      ?auto_823558 - PLACE
      ?auto_823554 - PLACE
      ?auto_823557 - HOIST
      ?auto_823555 - SURFACE
      ?auto_823559 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_823556 ?auto_823558 ) ( SURFACE-AT ?auto_823552 ?auto_823558 ) ( CLEAR ?auto_823552 ) ( IS-CRATE ?auto_823553 ) ( not ( = ?auto_823552 ?auto_823553 ) ) ( AVAILABLE ?auto_823556 ) ( ON ?auto_823552 ?auto_823551 ) ( not ( = ?auto_823551 ?auto_823552 ) ) ( not ( = ?auto_823551 ?auto_823553 ) ) ( not ( = ?auto_823554 ?auto_823558 ) ) ( HOIST-AT ?auto_823557 ?auto_823554 ) ( not ( = ?auto_823556 ?auto_823557 ) ) ( AVAILABLE ?auto_823557 ) ( SURFACE-AT ?auto_823553 ?auto_823554 ) ( ON ?auto_823553 ?auto_823555 ) ( CLEAR ?auto_823553 ) ( not ( = ?auto_823552 ?auto_823555 ) ) ( not ( = ?auto_823553 ?auto_823555 ) ) ( not ( = ?auto_823551 ?auto_823555 ) ) ( TRUCK-AT ?auto_823559 ?auto_823558 ) ( ON ?auto_823544 ?auto_823543 ) ( ON ?auto_823545 ?auto_823544 ) ( ON ?auto_823542 ?auto_823545 ) ( ON ?auto_823546 ?auto_823542 ) ( ON ?auto_823548 ?auto_823546 ) ( ON ?auto_823547 ?auto_823548 ) ( ON ?auto_823549 ?auto_823547 ) ( ON ?auto_823550 ?auto_823549 ) ( ON ?auto_823551 ?auto_823550 ) ( not ( = ?auto_823543 ?auto_823544 ) ) ( not ( = ?auto_823543 ?auto_823545 ) ) ( not ( = ?auto_823543 ?auto_823542 ) ) ( not ( = ?auto_823543 ?auto_823546 ) ) ( not ( = ?auto_823543 ?auto_823548 ) ) ( not ( = ?auto_823543 ?auto_823547 ) ) ( not ( = ?auto_823543 ?auto_823549 ) ) ( not ( = ?auto_823543 ?auto_823550 ) ) ( not ( = ?auto_823543 ?auto_823551 ) ) ( not ( = ?auto_823543 ?auto_823552 ) ) ( not ( = ?auto_823543 ?auto_823553 ) ) ( not ( = ?auto_823543 ?auto_823555 ) ) ( not ( = ?auto_823544 ?auto_823545 ) ) ( not ( = ?auto_823544 ?auto_823542 ) ) ( not ( = ?auto_823544 ?auto_823546 ) ) ( not ( = ?auto_823544 ?auto_823548 ) ) ( not ( = ?auto_823544 ?auto_823547 ) ) ( not ( = ?auto_823544 ?auto_823549 ) ) ( not ( = ?auto_823544 ?auto_823550 ) ) ( not ( = ?auto_823544 ?auto_823551 ) ) ( not ( = ?auto_823544 ?auto_823552 ) ) ( not ( = ?auto_823544 ?auto_823553 ) ) ( not ( = ?auto_823544 ?auto_823555 ) ) ( not ( = ?auto_823545 ?auto_823542 ) ) ( not ( = ?auto_823545 ?auto_823546 ) ) ( not ( = ?auto_823545 ?auto_823548 ) ) ( not ( = ?auto_823545 ?auto_823547 ) ) ( not ( = ?auto_823545 ?auto_823549 ) ) ( not ( = ?auto_823545 ?auto_823550 ) ) ( not ( = ?auto_823545 ?auto_823551 ) ) ( not ( = ?auto_823545 ?auto_823552 ) ) ( not ( = ?auto_823545 ?auto_823553 ) ) ( not ( = ?auto_823545 ?auto_823555 ) ) ( not ( = ?auto_823542 ?auto_823546 ) ) ( not ( = ?auto_823542 ?auto_823548 ) ) ( not ( = ?auto_823542 ?auto_823547 ) ) ( not ( = ?auto_823542 ?auto_823549 ) ) ( not ( = ?auto_823542 ?auto_823550 ) ) ( not ( = ?auto_823542 ?auto_823551 ) ) ( not ( = ?auto_823542 ?auto_823552 ) ) ( not ( = ?auto_823542 ?auto_823553 ) ) ( not ( = ?auto_823542 ?auto_823555 ) ) ( not ( = ?auto_823546 ?auto_823548 ) ) ( not ( = ?auto_823546 ?auto_823547 ) ) ( not ( = ?auto_823546 ?auto_823549 ) ) ( not ( = ?auto_823546 ?auto_823550 ) ) ( not ( = ?auto_823546 ?auto_823551 ) ) ( not ( = ?auto_823546 ?auto_823552 ) ) ( not ( = ?auto_823546 ?auto_823553 ) ) ( not ( = ?auto_823546 ?auto_823555 ) ) ( not ( = ?auto_823548 ?auto_823547 ) ) ( not ( = ?auto_823548 ?auto_823549 ) ) ( not ( = ?auto_823548 ?auto_823550 ) ) ( not ( = ?auto_823548 ?auto_823551 ) ) ( not ( = ?auto_823548 ?auto_823552 ) ) ( not ( = ?auto_823548 ?auto_823553 ) ) ( not ( = ?auto_823548 ?auto_823555 ) ) ( not ( = ?auto_823547 ?auto_823549 ) ) ( not ( = ?auto_823547 ?auto_823550 ) ) ( not ( = ?auto_823547 ?auto_823551 ) ) ( not ( = ?auto_823547 ?auto_823552 ) ) ( not ( = ?auto_823547 ?auto_823553 ) ) ( not ( = ?auto_823547 ?auto_823555 ) ) ( not ( = ?auto_823549 ?auto_823550 ) ) ( not ( = ?auto_823549 ?auto_823551 ) ) ( not ( = ?auto_823549 ?auto_823552 ) ) ( not ( = ?auto_823549 ?auto_823553 ) ) ( not ( = ?auto_823549 ?auto_823555 ) ) ( not ( = ?auto_823550 ?auto_823551 ) ) ( not ( = ?auto_823550 ?auto_823552 ) ) ( not ( = ?auto_823550 ?auto_823553 ) ) ( not ( = ?auto_823550 ?auto_823555 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_823551 ?auto_823552 ?auto_823553 )
      ( MAKE-11CRATE-VERIFY ?auto_823543 ?auto_823544 ?auto_823545 ?auto_823542 ?auto_823546 ?auto_823548 ?auto_823547 ?auto_823549 ?auto_823550 ?auto_823551 ?auto_823552 ?auto_823553 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_823687 - SURFACE
      ?auto_823688 - SURFACE
      ?auto_823689 - SURFACE
      ?auto_823686 - SURFACE
      ?auto_823690 - SURFACE
      ?auto_823692 - SURFACE
      ?auto_823691 - SURFACE
      ?auto_823693 - SURFACE
      ?auto_823694 - SURFACE
      ?auto_823695 - SURFACE
      ?auto_823696 - SURFACE
      ?auto_823697 - SURFACE
    )
    :vars
    (
      ?auto_823703 - HOIST
      ?auto_823702 - PLACE
      ?auto_823698 - PLACE
      ?auto_823701 - HOIST
      ?auto_823699 - SURFACE
      ?auto_823700 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_823703 ?auto_823702 ) ( IS-CRATE ?auto_823697 ) ( not ( = ?auto_823696 ?auto_823697 ) ) ( not ( = ?auto_823695 ?auto_823696 ) ) ( not ( = ?auto_823695 ?auto_823697 ) ) ( not ( = ?auto_823698 ?auto_823702 ) ) ( HOIST-AT ?auto_823701 ?auto_823698 ) ( not ( = ?auto_823703 ?auto_823701 ) ) ( AVAILABLE ?auto_823701 ) ( SURFACE-AT ?auto_823697 ?auto_823698 ) ( ON ?auto_823697 ?auto_823699 ) ( CLEAR ?auto_823697 ) ( not ( = ?auto_823696 ?auto_823699 ) ) ( not ( = ?auto_823697 ?auto_823699 ) ) ( not ( = ?auto_823695 ?auto_823699 ) ) ( TRUCK-AT ?auto_823700 ?auto_823702 ) ( SURFACE-AT ?auto_823695 ?auto_823702 ) ( CLEAR ?auto_823695 ) ( LIFTING ?auto_823703 ?auto_823696 ) ( IS-CRATE ?auto_823696 ) ( ON ?auto_823688 ?auto_823687 ) ( ON ?auto_823689 ?auto_823688 ) ( ON ?auto_823686 ?auto_823689 ) ( ON ?auto_823690 ?auto_823686 ) ( ON ?auto_823692 ?auto_823690 ) ( ON ?auto_823691 ?auto_823692 ) ( ON ?auto_823693 ?auto_823691 ) ( ON ?auto_823694 ?auto_823693 ) ( ON ?auto_823695 ?auto_823694 ) ( not ( = ?auto_823687 ?auto_823688 ) ) ( not ( = ?auto_823687 ?auto_823689 ) ) ( not ( = ?auto_823687 ?auto_823686 ) ) ( not ( = ?auto_823687 ?auto_823690 ) ) ( not ( = ?auto_823687 ?auto_823692 ) ) ( not ( = ?auto_823687 ?auto_823691 ) ) ( not ( = ?auto_823687 ?auto_823693 ) ) ( not ( = ?auto_823687 ?auto_823694 ) ) ( not ( = ?auto_823687 ?auto_823695 ) ) ( not ( = ?auto_823687 ?auto_823696 ) ) ( not ( = ?auto_823687 ?auto_823697 ) ) ( not ( = ?auto_823687 ?auto_823699 ) ) ( not ( = ?auto_823688 ?auto_823689 ) ) ( not ( = ?auto_823688 ?auto_823686 ) ) ( not ( = ?auto_823688 ?auto_823690 ) ) ( not ( = ?auto_823688 ?auto_823692 ) ) ( not ( = ?auto_823688 ?auto_823691 ) ) ( not ( = ?auto_823688 ?auto_823693 ) ) ( not ( = ?auto_823688 ?auto_823694 ) ) ( not ( = ?auto_823688 ?auto_823695 ) ) ( not ( = ?auto_823688 ?auto_823696 ) ) ( not ( = ?auto_823688 ?auto_823697 ) ) ( not ( = ?auto_823688 ?auto_823699 ) ) ( not ( = ?auto_823689 ?auto_823686 ) ) ( not ( = ?auto_823689 ?auto_823690 ) ) ( not ( = ?auto_823689 ?auto_823692 ) ) ( not ( = ?auto_823689 ?auto_823691 ) ) ( not ( = ?auto_823689 ?auto_823693 ) ) ( not ( = ?auto_823689 ?auto_823694 ) ) ( not ( = ?auto_823689 ?auto_823695 ) ) ( not ( = ?auto_823689 ?auto_823696 ) ) ( not ( = ?auto_823689 ?auto_823697 ) ) ( not ( = ?auto_823689 ?auto_823699 ) ) ( not ( = ?auto_823686 ?auto_823690 ) ) ( not ( = ?auto_823686 ?auto_823692 ) ) ( not ( = ?auto_823686 ?auto_823691 ) ) ( not ( = ?auto_823686 ?auto_823693 ) ) ( not ( = ?auto_823686 ?auto_823694 ) ) ( not ( = ?auto_823686 ?auto_823695 ) ) ( not ( = ?auto_823686 ?auto_823696 ) ) ( not ( = ?auto_823686 ?auto_823697 ) ) ( not ( = ?auto_823686 ?auto_823699 ) ) ( not ( = ?auto_823690 ?auto_823692 ) ) ( not ( = ?auto_823690 ?auto_823691 ) ) ( not ( = ?auto_823690 ?auto_823693 ) ) ( not ( = ?auto_823690 ?auto_823694 ) ) ( not ( = ?auto_823690 ?auto_823695 ) ) ( not ( = ?auto_823690 ?auto_823696 ) ) ( not ( = ?auto_823690 ?auto_823697 ) ) ( not ( = ?auto_823690 ?auto_823699 ) ) ( not ( = ?auto_823692 ?auto_823691 ) ) ( not ( = ?auto_823692 ?auto_823693 ) ) ( not ( = ?auto_823692 ?auto_823694 ) ) ( not ( = ?auto_823692 ?auto_823695 ) ) ( not ( = ?auto_823692 ?auto_823696 ) ) ( not ( = ?auto_823692 ?auto_823697 ) ) ( not ( = ?auto_823692 ?auto_823699 ) ) ( not ( = ?auto_823691 ?auto_823693 ) ) ( not ( = ?auto_823691 ?auto_823694 ) ) ( not ( = ?auto_823691 ?auto_823695 ) ) ( not ( = ?auto_823691 ?auto_823696 ) ) ( not ( = ?auto_823691 ?auto_823697 ) ) ( not ( = ?auto_823691 ?auto_823699 ) ) ( not ( = ?auto_823693 ?auto_823694 ) ) ( not ( = ?auto_823693 ?auto_823695 ) ) ( not ( = ?auto_823693 ?auto_823696 ) ) ( not ( = ?auto_823693 ?auto_823697 ) ) ( not ( = ?auto_823693 ?auto_823699 ) ) ( not ( = ?auto_823694 ?auto_823695 ) ) ( not ( = ?auto_823694 ?auto_823696 ) ) ( not ( = ?auto_823694 ?auto_823697 ) ) ( not ( = ?auto_823694 ?auto_823699 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_823695 ?auto_823696 ?auto_823697 )
      ( MAKE-11CRATE-VERIFY ?auto_823687 ?auto_823688 ?auto_823689 ?auto_823686 ?auto_823690 ?auto_823692 ?auto_823691 ?auto_823693 ?auto_823694 ?auto_823695 ?auto_823696 ?auto_823697 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_823831 - SURFACE
      ?auto_823832 - SURFACE
      ?auto_823833 - SURFACE
      ?auto_823830 - SURFACE
      ?auto_823834 - SURFACE
      ?auto_823836 - SURFACE
      ?auto_823835 - SURFACE
      ?auto_823837 - SURFACE
      ?auto_823838 - SURFACE
      ?auto_823839 - SURFACE
      ?auto_823840 - SURFACE
      ?auto_823841 - SURFACE
    )
    :vars
    (
      ?auto_823844 - HOIST
      ?auto_823842 - PLACE
      ?auto_823847 - PLACE
      ?auto_823845 - HOIST
      ?auto_823843 - SURFACE
      ?auto_823846 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_823844 ?auto_823842 ) ( IS-CRATE ?auto_823841 ) ( not ( = ?auto_823840 ?auto_823841 ) ) ( not ( = ?auto_823839 ?auto_823840 ) ) ( not ( = ?auto_823839 ?auto_823841 ) ) ( not ( = ?auto_823847 ?auto_823842 ) ) ( HOIST-AT ?auto_823845 ?auto_823847 ) ( not ( = ?auto_823844 ?auto_823845 ) ) ( AVAILABLE ?auto_823845 ) ( SURFACE-AT ?auto_823841 ?auto_823847 ) ( ON ?auto_823841 ?auto_823843 ) ( CLEAR ?auto_823841 ) ( not ( = ?auto_823840 ?auto_823843 ) ) ( not ( = ?auto_823841 ?auto_823843 ) ) ( not ( = ?auto_823839 ?auto_823843 ) ) ( TRUCK-AT ?auto_823846 ?auto_823842 ) ( SURFACE-AT ?auto_823839 ?auto_823842 ) ( CLEAR ?auto_823839 ) ( IS-CRATE ?auto_823840 ) ( AVAILABLE ?auto_823844 ) ( IN ?auto_823840 ?auto_823846 ) ( ON ?auto_823832 ?auto_823831 ) ( ON ?auto_823833 ?auto_823832 ) ( ON ?auto_823830 ?auto_823833 ) ( ON ?auto_823834 ?auto_823830 ) ( ON ?auto_823836 ?auto_823834 ) ( ON ?auto_823835 ?auto_823836 ) ( ON ?auto_823837 ?auto_823835 ) ( ON ?auto_823838 ?auto_823837 ) ( ON ?auto_823839 ?auto_823838 ) ( not ( = ?auto_823831 ?auto_823832 ) ) ( not ( = ?auto_823831 ?auto_823833 ) ) ( not ( = ?auto_823831 ?auto_823830 ) ) ( not ( = ?auto_823831 ?auto_823834 ) ) ( not ( = ?auto_823831 ?auto_823836 ) ) ( not ( = ?auto_823831 ?auto_823835 ) ) ( not ( = ?auto_823831 ?auto_823837 ) ) ( not ( = ?auto_823831 ?auto_823838 ) ) ( not ( = ?auto_823831 ?auto_823839 ) ) ( not ( = ?auto_823831 ?auto_823840 ) ) ( not ( = ?auto_823831 ?auto_823841 ) ) ( not ( = ?auto_823831 ?auto_823843 ) ) ( not ( = ?auto_823832 ?auto_823833 ) ) ( not ( = ?auto_823832 ?auto_823830 ) ) ( not ( = ?auto_823832 ?auto_823834 ) ) ( not ( = ?auto_823832 ?auto_823836 ) ) ( not ( = ?auto_823832 ?auto_823835 ) ) ( not ( = ?auto_823832 ?auto_823837 ) ) ( not ( = ?auto_823832 ?auto_823838 ) ) ( not ( = ?auto_823832 ?auto_823839 ) ) ( not ( = ?auto_823832 ?auto_823840 ) ) ( not ( = ?auto_823832 ?auto_823841 ) ) ( not ( = ?auto_823832 ?auto_823843 ) ) ( not ( = ?auto_823833 ?auto_823830 ) ) ( not ( = ?auto_823833 ?auto_823834 ) ) ( not ( = ?auto_823833 ?auto_823836 ) ) ( not ( = ?auto_823833 ?auto_823835 ) ) ( not ( = ?auto_823833 ?auto_823837 ) ) ( not ( = ?auto_823833 ?auto_823838 ) ) ( not ( = ?auto_823833 ?auto_823839 ) ) ( not ( = ?auto_823833 ?auto_823840 ) ) ( not ( = ?auto_823833 ?auto_823841 ) ) ( not ( = ?auto_823833 ?auto_823843 ) ) ( not ( = ?auto_823830 ?auto_823834 ) ) ( not ( = ?auto_823830 ?auto_823836 ) ) ( not ( = ?auto_823830 ?auto_823835 ) ) ( not ( = ?auto_823830 ?auto_823837 ) ) ( not ( = ?auto_823830 ?auto_823838 ) ) ( not ( = ?auto_823830 ?auto_823839 ) ) ( not ( = ?auto_823830 ?auto_823840 ) ) ( not ( = ?auto_823830 ?auto_823841 ) ) ( not ( = ?auto_823830 ?auto_823843 ) ) ( not ( = ?auto_823834 ?auto_823836 ) ) ( not ( = ?auto_823834 ?auto_823835 ) ) ( not ( = ?auto_823834 ?auto_823837 ) ) ( not ( = ?auto_823834 ?auto_823838 ) ) ( not ( = ?auto_823834 ?auto_823839 ) ) ( not ( = ?auto_823834 ?auto_823840 ) ) ( not ( = ?auto_823834 ?auto_823841 ) ) ( not ( = ?auto_823834 ?auto_823843 ) ) ( not ( = ?auto_823836 ?auto_823835 ) ) ( not ( = ?auto_823836 ?auto_823837 ) ) ( not ( = ?auto_823836 ?auto_823838 ) ) ( not ( = ?auto_823836 ?auto_823839 ) ) ( not ( = ?auto_823836 ?auto_823840 ) ) ( not ( = ?auto_823836 ?auto_823841 ) ) ( not ( = ?auto_823836 ?auto_823843 ) ) ( not ( = ?auto_823835 ?auto_823837 ) ) ( not ( = ?auto_823835 ?auto_823838 ) ) ( not ( = ?auto_823835 ?auto_823839 ) ) ( not ( = ?auto_823835 ?auto_823840 ) ) ( not ( = ?auto_823835 ?auto_823841 ) ) ( not ( = ?auto_823835 ?auto_823843 ) ) ( not ( = ?auto_823837 ?auto_823838 ) ) ( not ( = ?auto_823837 ?auto_823839 ) ) ( not ( = ?auto_823837 ?auto_823840 ) ) ( not ( = ?auto_823837 ?auto_823841 ) ) ( not ( = ?auto_823837 ?auto_823843 ) ) ( not ( = ?auto_823838 ?auto_823839 ) ) ( not ( = ?auto_823838 ?auto_823840 ) ) ( not ( = ?auto_823838 ?auto_823841 ) ) ( not ( = ?auto_823838 ?auto_823843 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_823839 ?auto_823840 ?auto_823841 )
      ( MAKE-11CRATE-VERIFY ?auto_823831 ?auto_823832 ?auto_823833 ?auto_823830 ?auto_823834 ?auto_823836 ?auto_823835 ?auto_823837 ?auto_823838 ?auto_823839 ?auto_823840 ?auto_823841 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_833106 - SURFACE
      ?auto_833107 - SURFACE
      ?auto_833108 - SURFACE
      ?auto_833105 - SURFACE
      ?auto_833109 - SURFACE
      ?auto_833111 - SURFACE
      ?auto_833110 - SURFACE
      ?auto_833112 - SURFACE
      ?auto_833113 - SURFACE
      ?auto_833114 - SURFACE
      ?auto_833115 - SURFACE
      ?auto_833116 - SURFACE
      ?auto_833117 - SURFACE
    )
    :vars
    (
      ?auto_833118 - HOIST
      ?auto_833119 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_833118 ?auto_833119 ) ( SURFACE-AT ?auto_833116 ?auto_833119 ) ( CLEAR ?auto_833116 ) ( LIFTING ?auto_833118 ?auto_833117 ) ( IS-CRATE ?auto_833117 ) ( not ( = ?auto_833116 ?auto_833117 ) ) ( ON ?auto_833107 ?auto_833106 ) ( ON ?auto_833108 ?auto_833107 ) ( ON ?auto_833105 ?auto_833108 ) ( ON ?auto_833109 ?auto_833105 ) ( ON ?auto_833111 ?auto_833109 ) ( ON ?auto_833110 ?auto_833111 ) ( ON ?auto_833112 ?auto_833110 ) ( ON ?auto_833113 ?auto_833112 ) ( ON ?auto_833114 ?auto_833113 ) ( ON ?auto_833115 ?auto_833114 ) ( ON ?auto_833116 ?auto_833115 ) ( not ( = ?auto_833106 ?auto_833107 ) ) ( not ( = ?auto_833106 ?auto_833108 ) ) ( not ( = ?auto_833106 ?auto_833105 ) ) ( not ( = ?auto_833106 ?auto_833109 ) ) ( not ( = ?auto_833106 ?auto_833111 ) ) ( not ( = ?auto_833106 ?auto_833110 ) ) ( not ( = ?auto_833106 ?auto_833112 ) ) ( not ( = ?auto_833106 ?auto_833113 ) ) ( not ( = ?auto_833106 ?auto_833114 ) ) ( not ( = ?auto_833106 ?auto_833115 ) ) ( not ( = ?auto_833106 ?auto_833116 ) ) ( not ( = ?auto_833106 ?auto_833117 ) ) ( not ( = ?auto_833107 ?auto_833108 ) ) ( not ( = ?auto_833107 ?auto_833105 ) ) ( not ( = ?auto_833107 ?auto_833109 ) ) ( not ( = ?auto_833107 ?auto_833111 ) ) ( not ( = ?auto_833107 ?auto_833110 ) ) ( not ( = ?auto_833107 ?auto_833112 ) ) ( not ( = ?auto_833107 ?auto_833113 ) ) ( not ( = ?auto_833107 ?auto_833114 ) ) ( not ( = ?auto_833107 ?auto_833115 ) ) ( not ( = ?auto_833107 ?auto_833116 ) ) ( not ( = ?auto_833107 ?auto_833117 ) ) ( not ( = ?auto_833108 ?auto_833105 ) ) ( not ( = ?auto_833108 ?auto_833109 ) ) ( not ( = ?auto_833108 ?auto_833111 ) ) ( not ( = ?auto_833108 ?auto_833110 ) ) ( not ( = ?auto_833108 ?auto_833112 ) ) ( not ( = ?auto_833108 ?auto_833113 ) ) ( not ( = ?auto_833108 ?auto_833114 ) ) ( not ( = ?auto_833108 ?auto_833115 ) ) ( not ( = ?auto_833108 ?auto_833116 ) ) ( not ( = ?auto_833108 ?auto_833117 ) ) ( not ( = ?auto_833105 ?auto_833109 ) ) ( not ( = ?auto_833105 ?auto_833111 ) ) ( not ( = ?auto_833105 ?auto_833110 ) ) ( not ( = ?auto_833105 ?auto_833112 ) ) ( not ( = ?auto_833105 ?auto_833113 ) ) ( not ( = ?auto_833105 ?auto_833114 ) ) ( not ( = ?auto_833105 ?auto_833115 ) ) ( not ( = ?auto_833105 ?auto_833116 ) ) ( not ( = ?auto_833105 ?auto_833117 ) ) ( not ( = ?auto_833109 ?auto_833111 ) ) ( not ( = ?auto_833109 ?auto_833110 ) ) ( not ( = ?auto_833109 ?auto_833112 ) ) ( not ( = ?auto_833109 ?auto_833113 ) ) ( not ( = ?auto_833109 ?auto_833114 ) ) ( not ( = ?auto_833109 ?auto_833115 ) ) ( not ( = ?auto_833109 ?auto_833116 ) ) ( not ( = ?auto_833109 ?auto_833117 ) ) ( not ( = ?auto_833111 ?auto_833110 ) ) ( not ( = ?auto_833111 ?auto_833112 ) ) ( not ( = ?auto_833111 ?auto_833113 ) ) ( not ( = ?auto_833111 ?auto_833114 ) ) ( not ( = ?auto_833111 ?auto_833115 ) ) ( not ( = ?auto_833111 ?auto_833116 ) ) ( not ( = ?auto_833111 ?auto_833117 ) ) ( not ( = ?auto_833110 ?auto_833112 ) ) ( not ( = ?auto_833110 ?auto_833113 ) ) ( not ( = ?auto_833110 ?auto_833114 ) ) ( not ( = ?auto_833110 ?auto_833115 ) ) ( not ( = ?auto_833110 ?auto_833116 ) ) ( not ( = ?auto_833110 ?auto_833117 ) ) ( not ( = ?auto_833112 ?auto_833113 ) ) ( not ( = ?auto_833112 ?auto_833114 ) ) ( not ( = ?auto_833112 ?auto_833115 ) ) ( not ( = ?auto_833112 ?auto_833116 ) ) ( not ( = ?auto_833112 ?auto_833117 ) ) ( not ( = ?auto_833113 ?auto_833114 ) ) ( not ( = ?auto_833113 ?auto_833115 ) ) ( not ( = ?auto_833113 ?auto_833116 ) ) ( not ( = ?auto_833113 ?auto_833117 ) ) ( not ( = ?auto_833114 ?auto_833115 ) ) ( not ( = ?auto_833114 ?auto_833116 ) ) ( not ( = ?auto_833114 ?auto_833117 ) ) ( not ( = ?auto_833115 ?auto_833116 ) ) ( not ( = ?auto_833115 ?auto_833117 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_833116 ?auto_833117 )
      ( MAKE-12CRATE-VERIFY ?auto_833106 ?auto_833107 ?auto_833108 ?auto_833105 ?auto_833109 ?auto_833111 ?auto_833110 ?auto_833112 ?auto_833113 ?auto_833114 ?auto_833115 ?auto_833116 ?auto_833117 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_833231 - SURFACE
      ?auto_833232 - SURFACE
      ?auto_833233 - SURFACE
      ?auto_833230 - SURFACE
      ?auto_833234 - SURFACE
      ?auto_833236 - SURFACE
      ?auto_833235 - SURFACE
      ?auto_833237 - SURFACE
      ?auto_833238 - SURFACE
      ?auto_833239 - SURFACE
      ?auto_833240 - SURFACE
      ?auto_833241 - SURFACE
      ?auto_833242 - SURFACE
    )
    :vars
    (
      ?auto_833245 - HOIST
      ?auto_833243 - PLACE
      ?auto_833244 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_833245 ?auto_833243 ) ( SURFACE-AT ?auto_833241 ?auto_833243 ) ( CLEAR ?auto_833241 ) ( IS-CRATE ?auto_833242 ) ( not ( = ?auto_833241 ?auto_833242 ) ) ( TRUCK-AT ?auto_833244 ?auto_833243 ) ( AVAILABLE ?auto_833245 ) ( IN ?auto_833242 ?auto_833244 ) ( ON ?auto_833241 ?auto_833240 ) ( not ( = ?auto_833240 ?auto_833241 ) ) ( not ( = ?auto_833240 ?auto_833242 ) ) ( ON ?auto_833232 ?auto_833231 ) ( ON ?auto_833233 ?auto_833232 ) ( ON ?auto_833230 ?auto_833233 ) ( ON ?auto_833234 ?auto_833230 ) ( ON ?auto_833236 ?auto_833234 ) ( ON ?auto_833235 ?auto_833236 ) ( ON ?auto_833237 ?auto_833235 ) ( ON ?auto_833238 ?auto_833237 ) ( ON ?auto_833239 ?auto_833238 ) ( ON ?auto_833240 ?auto_833239 ) ( not ( = ?auto_833231 ?auto_833232 ) ) ( not ( = ?auto_833231 ?auto_833233 ) ) ( not ( = ?auto_833231 ?auto_833230 ) ) ( not ( = ?auto_833231 ?auto_833234 ) ) ( not ( = ?auto_833231 ?auto_833236 ) ) ( not ( = ?auto_833231 ?auto_833235 ) ) ( not ( = ?auto_833231 ?auto_833237 ) ) ( not ( = ?auto_833231 ?auto_833238 ) ) ( not ( = ?auto_833231 ?auto_833239 ) ) ( not ( = ?auto_833231 ?auto_833240 ) ) ( not ( = ?auto_833231 ?auto_833241 ) ) ( not ( = ?auto_833231 ?auto_833242 ) ) ( not ( = ?auto_833232 ?auto_833233 ) ) ( not ( = ?auto_833232 ?auto_833230 ) ) ( not ( = ?auto_833232 ?auto_833234 ) ) ( not ( = ?auto_833232 ?auto_833236 ) ) ( not ( = ?auto_833232 ?auto_833235 ) ) ( not ( = ?auto_833232 ?auto_833237 ) ) ( not ( = ?auto_833232 ?auto_833238 ) ) ( not ( = ?auto_833232 ?auto_833239 ) ) ( not ( = ?auto_833232 ?auto_833240 ) ) ( not ( = ?auto_833232 ?auto_833241 ) ) ( not ( = ?auto_833232 ?auto_833242 ) ) ( not ( = ?auto_833233 ?auto_833230 ) ) ( not ( = ?auto_833233 ?auto_833234 ) ) ( not ( = ?auto_833233 ?auto_833236 ) ) ( not ( = ?auto_833233 ?auto_833235 ) ) ( not ( = ?auto_833233 ?auto_833237 ) ) ( not ( = ?auto_833233 ?auto_833238 ) ) ( not ( = ?auto_833233 ?auto_833239 ) ) ( not ( = ?auto_833233 ?auto_833240 ) ) ( not ( = ?auto_833233 ?auto_833241 ) ) ( not ( = ?auto_833233 ?auto_833242 ) ) ( not ( = ?auto_833230 ?auto_833234 ) ) ( not ( = ?auto_833230 ?auto_833236 ) ) ( not ( = ?auto_833230 ?auto_833235 ) ) ( not ( = ?auto_833230 ?auto_833237 ) ) ( not ( = ?auto_833230 ?auto_833238 ) ) ( not ( = ?auto_833230 ?auto_833239 ) ) ( not ( = ?auto_833230 ?auto_833240 ) ) ( not ( = ?auto_833230 ?auto_833241 ) ) ( not ( = ?auto_833230 ?auto_833242 ) ) ( not ( = ?auto_833234 ?auto_833236 ) ) ( not ( = ?auto_833234 ?auto_833235 ) ) ( not ( = ?auto_833234 ?auto_833237 ) ) ( not ( = ?auto_833234 ?auto_833238 ) ) ( not ( = ?auto_833234 ?auto_833239 ) ) ( not ( = ?auto_833234 ?auto_833240 ) ) ( not ( = ?auto_833234 ?auto_833241 ) ) ( not ( = ?auto_833234 ?auto_833242 ) ) ( not ( = ?auto_833236 ?auto_833235 ) ) ( not ( = ?auto_833236 ?auto_833237 ) ) ( not ( = ?auto_833236 ?auto_833238 ) ) ( not ( = ?auto_833236 ?auto_833239 ) ) ( not ( = ?auto_833236 ?auto_833240 ) ) ( not ( = ?auto_833236 ?auto_833241 ) ) ( not ( = ?auto_833236 ?auto_833242 ) ) ( not ( = ?auto_833235 ?auto_833237 ) ) ( not ( = ?auto_833235 ?auto_833238 ) ) ( not ( = ?auto_833235 ?auto_833239 ) ) ( not ( = ?auto_833235 ?auto_833240 ) ) ( not ( = ?auto_833235 ?auto_833241 ) ) ( not ( = ?auto_833235 ?auto_833242 ) ) ( not ( = ?auto_833237 ?auto_833238 ) ) ( not ( = ?auto_833237 ?auto_833239 ) ) ( not ( = ?auto_833237 ?auto_833240 ) ) ( not ( = ?auto_833237 ?auto_833241 ) ) ( not ( = ?auto_833237 ?auto_833242 ) ) ( not ( = ?auto_833238 ?auto_833239 ) ) ( not ( = ?auto_833238 ?auto_833240 ) ) ( not ( = ?auto_833238 ?auto_833241 ) ) ( not ( = ?auto_833238 ?auto_833242 ) ) ( not ( = ?auto_833239 ?auto_833240 ) ) ( not ( = ?auto_833239 ?auto_833241 ) ) ( not ( = ?auto_833239 ?auto_833242 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_833240 ?auto_833241 ?auto_833242 )
      ( MAKE-12CRATE-VERIFY ?auto_833231 ?auto_833232 ?auto_833233 ?auto_833230 ?auto_833234 ?auto_833236 ?auto_833235 ?auto_833237 ?auto_833238 ?auto_833239 ?auto_833240 ?auto_833241 ?auto_833242 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_833369 - SURFACE
      ?auto_833370 - SURFACE
      ?auto_833371 - SURFACE
      ?auto_833368 - SURFACE
      ?auto_833372 - SURFACE
      ?auto_833374 - SURFACE
      ?auto_833373 - SURFACE
      ?auto_833375 - SURFACE
      ?auto_833376 - SURFACE
      ?auto_833377 - SURFACE
      ?auto_833378 - SURFACE
      ?auto_833379 - SURFACE
      ?auto_833380 - SURFACE
    )
    :vars
    (
      ?auto_833383 - HOIST
      ?auto_833381 - PLACE
      ?auto_833382 - TRUCK
      ?auto_833384 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_833383 ?auto_833381 ) ( SURFACE-AT ?auto_833379 ?auto_833381 ) ( CLEAR ?auto_833379 ) ( IS-CRATE ?auto_833380 ) ( not ( = ?auto_833379 ?auto_833380 ) ) ( AVAILABLE ?auto_833383 ) ( IN ?auto_833380 ?auto_833382 ) ( ON ?auto_833379 ?auto_833378 ) ( not ( = ?auto_833378 ?auto_833379 ) ) ( not ( = ?auto_833378 ?auto_833380 ) ) ( TRUCK-AT ?auto_833382 ?auto_833384 ) ( not ( = ?auto_833384 ?auto_833381 ) ) ( ON ?auto_833370 ?auto_833369 ) ( ON ?auto_833371 ?auto_833370 ) ( ON ?auto_833368 ?auto_833371 ) ( ON ?auto_833372 ?auto_833368 ) ( ON ?auto_833374 ?auto_833372 ) ( ON ?auto_833373 ?auto_833374 ) ( ON ?auto_833375 ?auto_833373 ) ( ON ?auto_833376 ?auto_833375 ) ( ON ?auto_833377 ?auto_833376 ) ( ON ?auto_833378 ?auto_833377 ) ( not ( = ?auto_833369 ?auto_833370 ) ) ( not ( = ?auto_833369 ?auto_833371 ) ) ( not ( = ?auto_833369 ?auto_833368 ) ) ( not ( = ?auto_833369 ?auto_833372 ) ) ( not ( = ?auto_833369 ?auto_833374 ) ) ( not ( = ?auto_833369 ?auto_833373 ) ) ( not ( = ?auto_833369 ?auto_833375 ) ) ( not ( = ?auto_833369 ?auto_833376 ) ) ( not ( = ?auto_833369 ?auto_833377 ) ) ( not ( = ?auto_833369 ?auto_833378 ) ) ( not ( = ?auto_833369 ?auto_833379 ) ) ( not ( = ?auto_833369 ?auto_833380 ) ) ( not ( = ?auto_833370 ?auto_833371 ) ) ( not ( = ?auto_833370 ?auto_833368 ) ) ( not ( = ?auto_833370 ?auto_833372 ) ) ( not ( = ?auto_833370 ?auto_833374 ) ) ( not ( = ?auto_833370 ?auto_833373 ) ) ( not ( = ?auto_833370 ?auto_833375 ) ) ( not ( = ?auto_833370 ?auto_833376 ) ) ( not ( = ?auto_833370 ?auto_833377 ) ) ( not ( = ?auto_833370 ?auto_833378 ) ) ( not ( = ?auto_833370 ?auto_833379 ) ) ( not ( = ?auto_833370 ?auto_833380 ) ) ( not ( = ?auto_833371 ?auto_833368 ) ) ( not ( = ?auto_833371 ?auto_833372 ) ) ( not ( = ?auto_833371 ?auto_833374 ) ) ( not ( = ?auto_833371 ?auto_833373 ) ) ( not ( = ?auto_833371 ?auto_833375 ) ) ( not ( = ?auto_833371 ?auto_833376 ) ) ( not ( = ?auto_833371 ?auto_833377 ) ) ( not ( = ?auto_833371 ?auto_833378 ) ) ( not ( = ?auto_833371 ?auto_833379 ) ) ( not ( = ?auto_833371 ?auto_833380 ) ) ( not ( = ?auto_833368 ?auto_833372 ) ) ( not ( = ?auto_833368 ?auto_833374 ) ) ( not ( = ?auto_833368 ?auto_833373 ) ) ( not ( = ?auto_833368 ?auto_833375 ) ) ( not ( = ?auto_833368 ?auto_833376 ) ) ( not ( = ?auto_833368 ?auto_833377 ) ) ( not ( = ?auto_833368 ?auto_833378 ) ) ( not ( = ?auto_833368 ?auto_833379 ) ) ( not ( = ?auto_833368 ?auto_833380 ) ) ( not ( = ?auto_833372 ?auto_833374 ) ) ( not ( = ?auto_833372 ?auto_833373 ) ) ( not ( = ?auto_833372 ?auto_833375 ) ) ( not ( = ?auto_833372 ?auto_833376 ) ) ( not ( = ?auto_833372 ?auto_833377 ) ) ( not ( = ?auto_833372 ?auto_833378 ) ) ( not ( = ?auto_833372 ?auto_833379 ) ) ( not ( = ?auto_833372 ?auto_833380 ) ) ( not ( = ?auto_833374 ?auto_833373 ) ) ( not ( = ?auto_833374 ?auto_833375 ) ) ( not ( = ?auto_833374 ?auto_833376 ) ) ( not ( = ?auto_833374 ?auto_833377 ) ) ( not ( = ?auto_833374 ?auto_833378 ) ) ( not ( = ?auto_833374 ?auto_833379 ) ) ( not ( = ?auto_833374 ?auto_833380 ) ) ( not ( = ?auto_833373 ?auto_833375 ) ) ( not ( = ?auto_833373 ?auto_833376 ) ) ( not ( = ?auto_833373 ?auto_833377 ) ) ( not ( = ?auto_833373 ?auto_833378 ) ) ( not ( = ?auto_833373 ?auto_833379 ) ) ( not ( = ?auto_833373 ?auto_833380 ) ) ( not ( = ?auto_833375 ?auto_833376 ) ) ( not ( = ?auto_833375 ?auto_833377 ) ) ( not ( = ?auto_833375 ?auto_833378 ) ) ( not ( = ?auto_833375 ?auto_833379 ) ) ( not ( = ?auto_833375 ?auto_833380 ) ) ( not ( = ?auto_833376 ?auto_833377 ) ) ( not ( = ?auto_833376 ?auto_833378 ) ) ( not ( = ?auto_833376 ?auto_833379 ) ) ( not ( = ?auto_833376 ?auto_833380 ) ) ( not ( = ?auto_833377 ?auto_833378 ) ) ( not ( = ?auto_833377 ?auto_833379 ) ) ( not ( = ?auto_833377 ?auto_833380 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_833378 ?auto_833379 ?auto_833380 )
      ( MAKE-12CRATE-VERIFY ?auto_833369 ?auto_833370 ?auto_833371 ?auto_833368 ?auto_833372 ?auto_833374 ?auto_833373 ?auto_833375 ?auto_833376 ?auto_833377 ?auto_833378 ?auto_833379 ?auto_833380 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_833519 - SURFACE
      ?auto_833520 - SURFACE
      ?auto_833521 - SURFACE
      ?auto_833518 - SURFACE
      ?auto_833522 - SURFACE
      ?auto_833524 - SURFACE
      ?auto_833523 - SURFACE
      ?auto_833525 - SURFACE
      ?auto_833526 - SURFACE
      ?auto_833527 - SURFACE
      ?auto_833528 - SURFACE
      ?auto_833529 - SURFACE
      ?auto_833530 - SURFACE
    )
    :vars
    (
      ?auto_833532 - HOIST
      ?auto_833534 - PLACE
      ?auto_833535 - TRUCK
      ?auto_833533 - PLACE
      ?auto_833531 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_833532 ?auto_833534 ) ( SURFACE-AT ?auto_833529 ?auto_833534 ) ( CLEAR ?auto_833529 ) ( IS-CRATE ?auto_833530 ) ( not ( = ?auto_833529 ?auto_833530 ) ) ( AVAILABLE ?auto_833532 ) ( ON ?auto_833529 ?auto_833528 ) ( not ( = ?auto_833528 ?auto_833529 ) ) ( not ( = ?auto_833528 ?auto_833530 ) ) ( TRUCK-AT ?auto_833535 ?auto_833533 ) ( not ( = ?auto_833533 ?auto_833534 ) ) ( HOIST-AT ?auto_833531 ?auto_833533 ) ( LIFTING ?auto_833531 ?auto_833530 ) ( not ( = ?auto_833532 ?auto_833531 ) ) ( ON ?auto_833520 ?auto_833519 ) ( ON ?auto_833521 ?auto_833520 ) ( ON ?auto_833518 ?auto_833521 ) ( ON ?auto_833522 ?auto_833518 ) ( ON ?auto_833524 ?auto_833522 ) ( ON ?auto_833523 ?auto_833524 ) ( ON ?auto_833525 ?auto_833523 ) ( ON ?auto_833526 ?auto_833525 ) ( ON ?auto_833527 ?auto_833526 ) ( ON ?auto_833528 ?auto_833527 ) ( not ( = ?auto_833519 ?auto_833520 ) ) ( not ( = ?auto_833519 ?auto_833521 ) ) ( not ( = ?auto_833519 ?auto_833518 ) ) ( not ( = ?auto_833519 ?auto_833522 ) ) ( not ( = ?auto_833519 ?auto_833524 ) ) ( not ( = ?auto_833519 ?auto_833523 ) ) ( not ( = ?auto_833519 ?auto_833525 ) ) ( not ( = ?auto_833519 ?auto_833526 ) ) ( not ( = ?auto_833519 ?auto_833527 ) ) ( not ( = ?auto_833519 ?auto_833528 ) ) ( not ( = ?auto_833519 ?auto_833529 ) ) ( not ( = ?auto_833519 ?auto_833530 ) ) ( not ( = ?auto_833520 ?auto_833521 ) ) ( not ( = ?auto_833520 ?auto_833518 ) ) ( not ( = ?auto_833520 ?auto_833522 ) ) ( not ( = ?auto_833520 ?auto_833524 ) ) ( not ( = ?auto_833520 ?auto_833523 ) ) ( not ( = ?auto_833520 ?auto_833525 ) ) ( not ( = ?auto_833520 ?auto_833526 ) ) ( not ( = ?auto_833520 ?auto_833527 ) ) ( not ( = ?auto_833520 ?auto_833528 ) ) ( not ( = ?auto_833520 ?auto_833529 ) ) ( not ( = ?auto_833520 ?auto_833530 ) ) ( not ( = ?auto_833521 ?auto_833518 ) ) ( not ( = ?auto_833521 ?auto_833522 ) ) ( not ( = ?auto_833521 ?auto_833524 ) ) ( not ( = ?auto_833521 ?auto_833523 ) ) ( not ( = ?auto_833521 ?auto_833525 ) ) ( not ( = ?auto_833521 ?auto_833526 ) ) ( not ( = ?auto_833521 ?auto_833527 ) ) ( not ( = ?auto_833521 ?auto_833528 ) ) ( not ( = ?auto_833521 ?auto_833529 ) ) ( not ( = ?auto_833521 ?auto_833530 ) ) ( not ( = ?auto_833518 ?auto_833522 ) ) ( not ( = ?auto_833518 ?auto_833524 ) ) ( not ( = ?auto_833518 ?auto_833523 ) ) ( not ( = ?auto_833518 ?auto_833525 ) ) ( not ( = ?auto_833518 ?auto_833526 ) ) ( not ( = ?auto_833518 ?auto_833527 ) ) ( not ( = ?auto_833518 ?auto_833528 ) ) ( not ( = ?auto_833518 ?auto_833529 ) ) ( not ( = ?auto_833518 ?auto_833530 ) ) ( not ( = ?auto_833522 ?auto_833524 ) ) ( not ( = ?auto_833522 ?auto_833523 ) ) ( not ( = ?auto_833522 ?auto_833525 ) ) ( not ( = ?auto_833522 ?auto_833526 ) ) ( not ( = ?auto_833522 ?auto_833527 ) ) ( not ( = ?auto_833522 ?auto_833528 ) ) ( not ( = ?auto_833522 ?auto_833529 ) ) ( not ( = ?auto_833522 ?auto_833530 ) ) ( not ( = ?auto_833524 ?auto_833523 ) ) ( not ( = ?auto_833524 ?auto_833525 ) ) ( not ( = ?auto_833524 ?auto_833526 ) ) ( not ( = ?auto_833524 ?auto_833527 ) ) ( not ( = ?auto_833524 ?auto_833528 ) ) ( not ( = ?auto_833524 ?auto_833529 ) ) ( not ( = ?auto_833524 ?auto_833530 ) ) ( not ( = ?auto_833523 ?auto_833525 ) ) ( not ( = ?auto_833523 ?auto_833526 ) ) ( not ( = ?auto_833523 ?auto_833527 ) ) ( not ( = ?auto_833523 ?auto_833528 ) ) ( not ( = ?auto_833523 ?auto_833529 ) ) ( not ( = ?auto_833523 ?auto_833530 ) ) ( not ( = ?auto_833525 ?auto_833526 ) ) ( not ( = ?auto_833525 ?auto_833527 ) ) ( not ( = ?auto_833525 ?auto_833528 ) ) ( not ( = ?auto_833525 ?auto_833529 ) ) ( not ( = ?auto_833525 ?auto_833530 ) ) ( not ( = ?auto_833526 ?auto_833527 ) ) ( not ( = ?auto_833526 ?auto_833528 ) ) ( not ( = ?auto_833526 ?auto_833529 ) ) ( not ( = ?auto_833526 ?auto_833530 ) ) ( not ( = ?auto_833527 ?auto_833528 ) ) ( not ( = ?auto_833527 ?auto_833529 ) ) ( not ( = ?auto_833527 ?auto_833530 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_833528 ?auto_833529 ?auto_833530 )
      ( MAKE-12CRATE-VERIFY ?auto_833519 ?auto_833520 ?auto_833521 ?auto_833518 ?auto_833522 ?auto_833524 ?auto_833523 ?auto_833525 ?auto_833526 ?auto_833527 ?auto_833528 ?auto_833529 ?auto_833530 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_833681 - SURFACE
      ?auto_833682 - SURFACE
      ?auto_833683 - SURFACE
      ?auto_833680 - SURFACE
      ?auto_833684 - SURFACE
      ?auto_833686 - SURFACE
      ?auto_833685 - SURFACE
      ?auto_833687 - SURFACE
      ?auto_833688 - SURFACE
      ?auto_833689 - SURFACE
      ?auto_833690 - SURFACE
      ?auto_833691 - SURFACE
      ?auto_833692 - SURFACE
    )
    :vars
    (
      ?auto_833696 - HOIST
      ?auto_833693 - PLACE
      ?auto_833698 - TRUCK
      ?auto_833697 - PLACE
      ?auto_833695 - HOIST
      ?auto_833694 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_833696 ?auto_833693 ) ( SURFACE-AT ?auto_833691 ?auto_833693 ) ( CLEAR ?auto_833691 ) ( IS-CRATE ?auto_833692 ) ( not ( = ?auto_833691 ?auto_833692 ) ) ( AVAILABLE ?auto_833696 ) ( ON ?auto_833691 ?auto_833690 ) ( not ( = ?auto_833690 ?auto_833691 ) ) ( not ( = ?auto_833690 ?auto_833692 ) ) ( TRUCK-AT ?auto_833698 ?auto_833697 ) ( not ( = ?auto_833697 ?auto_833693 ) ) ( HOIST-AT ?auto_833695 ?auto_833697 ) ( not ( = ?auto_833696 ?auto_833695 ) ) ( AVAILABLE ?auto_833695 ) ( SURFACE-AT ?auto_833692 ?auto_833697 ) ( ON ?auto_833692 ?auto_833694 ) ( CLEAR ?auto_833692 ) ( not ( = ?auto_833691 ?auto_833694 ) ) ( not ( = ?auto_833692 ?auto_833694 ) ) ( not ( = ?auto_833690 ?auto_833694 ) ) ( ON ?auto_833682 ?auto_833681 ) ( ON ?auto_833683 ?auto_833682 ) ( ON ?auto_833680 ?auto_833683 ) ( ON ?auto_833684 ?auto_833680 ) ( ON ?auto_833686 ?auto_833684 ) ( ON ?auto_833685 ?auto_833686 ) ( ON ?auto_833687 ?auto_833685 ) ( ON ?auto_833688 ?auto_833687 ) ( ON ?auto_833689 ?auto_833688 ) ( ON ?auto_833690 ?auto_833689 ) ( not ( = ?auto_833681 ?auto_833682 ) ) ( not ( = ?auto_833681 ?auto_833683 ) ) ( not ( = ?auto_833681 ?auto_833680 ) ) ( not ( = ?auto_833681 ?auto_833684 ) ) ( not ( = ?auto_833681 ?auto_833686 ) ) ( not ( = ?auto_833681 ?auto_833685 ) ) ( not ( = ?auto_833681 ?auto_833687 ) ) ( not ( = ?auto_833681 ?auto_833688 ) ) ( not ( = ?auto_833681 ?auto_833689 ) ) ( not ( = ?auto_833681 ?auto_833690 ) ) ( not ( = ?auto_833681 ?auto_833691 ) ) ( not ( = ?auto_833681 ?auto_833692 ) ) ( not ( = ?auto_833681 ?auto_833694 ) ) ( not ( = ?auto_833682 ?auto_833683 ) ) ( not ( = ?auto_833682 ?auto_833680 ) ) ( not ( = ?auto_833682 ?auto_833684 ) ) ( not ( = ?auto_833682 ?auto_833686 ) ) ( not ( = ?auto_833682 ?auto_833685 ) ) ( not ( = ?auto_833682 ?auto_833687 ) ) ( not ( = ?auto_833682 ?auto_833688 ) ) ( not ( = ?auto_833682 ?auto_833689 ) ) ( not ( = ?auto_833682 ?auto_833690 ) ) ( not ( = ?auto_833682 ?auto_833691 ) ) ( not ( = ?auto_833682 ?auto_833692 ) ) ( not ( = ?auto_833682 ?auto_833694 ) ) ( not ( = ?auto_833683 ?auto_833680 ) ) ( not ( = ?auto_833683 ?auto_833684 ) ) ( not ( = ?auto_833683 ?auto_833686 ) ) ( not ( = ?auto_833683 ?auto_833685 ) ) ( not ( = ?auto_833683 ?auto_833687 ) ) ( not ( = ?auto_833683 ?auto_833688 ) ) ( not ( = ?auto_833683 ?auto_833689 ) ) ( not ( = ?auto_833683 ?auto_833690 ) ) ( not ( = ?auto_833683 ?auto_833691 ) ) ( not ( = ?auto_833683 ?auto_833692 ) ) ( not ( = ?auto_833683 ?auto_833694 ) ) ( not ( = ?auto_833680 ?auto_833684 ) ) ( not ( = ?auto_833680 ?auto_833686 ) ) ( not ( = ?auto_833680 ?auto_833685 ) ) ( not ( = ?auto_833680 ?auto_833687 ) ) ( not ( = ?auto_833680 ?auto_833688 ) ) ( not ( = ?auto_833680 ?auto_833689 ) ) ( not ( = ?auto_833680 ?auto_833690 ) ) ( not ( = ?auto_833680 ?auto_833691 ) ) ( not ( = ?auto_833680 ?auto_833692 ) ) ( not ( = ?auto_833680 ?auto_833694 ) ) ( not ( = ?auto_833684 ?auto_833686 ) ) ( not ( = ?auto_833684 ?auto_833685 ) ) ( not ( = ?auto_833684 ?auto_833687 ) ) ( not ( = ?auto_833684 ?auto_833688 ) ) ( not ( = ?auto_833684 ?auto_833689 ) ) ( not ( = ?auto_833684 ?auto_833690 ) ) ( not ( = ?auto_833684 ?auto_833691 ) ) ( not ( = ?auto_833684 ?auto_833692 ) ) ( not ( = ?auto_833684 ?auto_833694 ) ) ( not ( = ?auto_833686 ?auto_833685 ) ) ( not ( = ?auto_833686 ?auto_833687 ) ) ( not ( = ?auto_833686 ?auto_833688 ) ) ( not ( = ?auto_833686 ?auto_833689 ) ) ( not ( = ?auto_833686 ?auto_833690 ) ) ( not ( = ?auto_833686 ?auto_833691 ) ) ( not ( = ?auto_833686 ?auto_833692 ) ) ( not ( = ?auto_833686 ?auto_833694 ) ) ( not ( = ?auto_833685 ?auto_833687 ) ) ( not ( = ?auto_833685 ?auto_833688 ) ) ( not ( = ?auto_833685 ?auto_833689 ) ) ( not ( = ?auto_833685 ?auto_833690 ) ) ( not ( = ?auto_833685 ?auto_833691 ) ) ( not ( = ?auto_833685 ?auto_833692 ) ) ( not ( = ?auto_833685 ?auto_833694 ) ) ( not ( = ?auto_833687 ?auto_833688 ) ) ( not ( = ?auto_833687 ?auto_833689 ) ) ( not ( = ?auto_833687 ?auto_833690 ) ) ( not ( = ?auto_833687 ?auto_833691 ) ) ( not ( = ?auto_833687 ?auto_833692 ) ) ( not ( = ?auto_833687 ?auto_833694 ) ) ( not ( = ?auto_833688 ?auto_833689 ) ) ( not ( = ?auto_833688 ?auto_833690 ) ) ( not ( = ?auto_833688 ?auto_833691 ) ) ( not ( = ?auto_833688 ?auto_833692 ) ) ( not ( = ?auto_833688 ?auto_833694 ) ) ( not ( = ?auto_833689 ?auto_833690 ) ) ( not ( = ?auto_833689 ?auto_833691 ) ) ( not ( = ?auto_833689 ?auto_833692 ) ) ( not ( = ?auto_833689 ?auto_833694 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_833690 ?auto_833691 ?auto_833692 )
      ( MAKE-12CRATE-VERIFY ?auto_833681 ?auto_833682 ?auto_833683 ?auto_833680 ?auto_833684 ?auto_833686 ?auto_833685 ?auto_833687 ?auto_833688 ?auto_833689 ?auto_833690 ?auto_833691 ?auto_833692 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_833844 - SURFACE
      ?auto_833845 - SURFACE
      ?auto_833846 - SURFACE
      ?auto_833843 - SURFACE
      ?auto_833847 - SURFACE
      ?auto_833849 - SURFACE
      ?auto_833848 - SURFACE
      ?auto_833850 - SURFACE
      ?auto_833851 - SURFACE
      ?auto_833852 - SURFACE
      ?auto_833853 - SURFACE
      ?auto_833854 - SURFACE
      ?auto_833855 - SURFACE
    )
    :vars
    (
      ?auto_833856 - HOIST
      ?auto_833859 - PLACE
      ?auto_833861 - PLACE
      ?auto_833860 - HOIST
      ?auto_833858 - SURFACE
      ?auto_833857 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_833856 ?auto_833859 ) ( SURFACE-AT ?auto_833854 ?auto_833859 ) ( CLEAR ?auto_833854 ) ( IS-CRATE ?auto_833855 ) ( not ( = ?auto_833854 ?auto_833855 ) ) ( AVAILABLE ?auto_833856 ) ( ON ?auto_833854 ?auto_833853 ) ( not ( = ?auto_833853 ?auto_833854 ) ) ( not ( = ?auto_833853 ?auto_833855 ) ) ( not ( = ?auto_833861 ?auto_833859 ) ) ( HOIST-AT ?auto_833860 ?auto_833861 ) ( not ( = ?auto_833856 ?auto_833860 ) ) ( AVAILABLE ?auto_833860 ) ( SURFACE-AT ?auto_833855 ?auto_833861 ) ( ON ?auto_833855 ?auto_833858 ) ( CLEAR ?auto_833855 ) ( not ( = ?auto_833854 ?auto_833858 ) ) ( not ( = ?auto_833855 ?auto_833858 ) ) ( not ( = ?auto_833853 ?auto_833858 ) ) ( TRUCK-AT ?auto_833857 ?auto_833859 ) ( ON ?auto_833845 ?auto_833844 ) ( ON ?auto_833846 ?auto_833845 ) ( ON ?auto_833843 ?auto_833846 ) ( ON ?auto_833847 ?auto_833843 ) ( ON ?auto_833849 ?auto_833847 ) ( ON ?auto_833848 ?auto_833849 ) ( ON ?auto_833850 ?auto_833848 ) ( ON ?auto_833851 ?auto_833850 ) ( ON ?auto_833852 ?auto_833851 ) ( ON ?auto_833853 ?auto_833852 ) ( not ( = ?auto_833844 ?auto_833845 ) ) ( not ( = ?auto_833844 ?auto_833846 ) ) ( not ( = ?auto_833844 ?auto_833843 ) ) ( not ( = ?auto_833844 ?auto_833847 ) ) ( not ( = ?auto_833844 ?auto_833849 ) ) ( not ( = ?auto_833844 ?auto_833848 ) ) ( not ( = ?auto_833844 ?auto_833850 ) ) ( not ( = ?auto_833844 ?auto_833851 ) ) ( not ( = ?auto_833844 ?auto_833852 ) ) ( not ( = ?auto_833844 ?auto_833853 ) ) ( not ( = ?auto_833844 ?auto_833854 ) ) ( not ( = ?auto_833844 ?auto_833855 ) ) ( not ( = ?auto_833844 ?auto_833858 ) ) ( not ( = ?auto_833845 ?auto_833846 ) ) ( not ( = ?auto_833845 ?auto_833843 ) ) ( not ( = ?auto_833845 ?auto_833847 ) ) ( not ( = ?auto_833845 ?auto_833849 ) ) ( not ( = ?auto_833845 ?auto_833848 ) ) ( not ( = ?auto_833845 ?auto_833850 ) ) ( not ( = ?auto_833845 ?auto_833851 ) ) ( not ( = ?auto_833845 ?auto_833852 ) ) ( not ( = ?auto_833845 ?auto_833853 ) ) ( not ( = ?auto_833845 ?auto_833854 ) ) ( not ( = ?auto_833845 ?auto_833855 ) ) ( not ( = ?auto_833845 ?auto_833858 ) ) ( not ( = ?auto_833846 ?auto_833843 ) ) ( not ( = ?auto_833846 ?auto_833847 ) ) ( not ( = ?auto_833846 ?auto_833849 ) ) ( not ( = ?auto_833846 ?auto_833848 ) ) ( not ( = ?auto_833846 ?auto_833850 ) ) ( not ( = ?auto_833846 ?auto_833851 ) ) ( not ( = ?auto_833846 ?auto_833852 ) ) ( not ( = ?auto_833846 ?auto_833853 ) ) ( not ( = ?auto_833846 ?auto_833854 ) ) ( not ( = ?auto_833846 ?auto_833855 ) ) ( not ( = ?auto_833846 ?auto_833858 ) ) ( not ( = ?auto_833843 ?auto_833847 ) ) ( not ( = ?auto_833843 ?auto_833849 ) ) ( not ( = ?auto_833843 ?auto_833848 ) ) ( not ( = ?auto_833843 ?auto_833850 ) ) ( not ( = ?auto_833843 ?auto_833851 ) ) ( not ( = ?auto_833843 ?auto_833852 ) ) ( not ( = ?auto_833843 ?auto_833853 ) ) ( not ( = ?auto_833843 ?auto_833854 ) ) ( not ( = ?auto_833843 ?auto_833855 ) ) ( not ( = ?auto_833843 ?auto_833858 ) ) ( not ( = ?auto_833847 ?auto_833849 ) ) ( not ( = ?auto_833847 ?auto_833848 ) ) ( not ( = ?auto_833847 ?auto_833850 ) ) ( not ( = ?auto_833847 ?auto_833851 ) ) ( not ( = ?auto_833847 ?auto_833852 ) ) ( not ( = ?auto_833847 ?auto_833853 ) ) ( not ( = ?auto_833847 ?auto_833854 ) ) ( not ( = ?auto_833847 ?auto_833855 ) ) ( not ( = ?auto_833847 ?auto_833858 ) ) ( not ( = ?auto_833849 ?auto_833848 ) ) ( not ( = ?auto_833849 ?auto_833850 ) ) ( not ( = ?auto_833849 ?auto_833851 ) ) ( not ( = ?auto_833849 ?auto_833852 ) ) ( not ( = ?auto_833849 ?auto_833853 ) ) ( not ( = ?auto_833849 ?auto_833854 ) ) ( not ( = ?auto_833849 ?auto_833855 ) ) ( not ( = ?auto_833849 ?auto_833858 ) ) ( not ( = ?auto_833848 ?auto_833850 ) ) ( not ( = ?auto_833848 ?auto_833851 ) ) ( not ( = ?auto_833848 ?auto_833852 ) ) ( not ( = ?auto_833848 ?auto_833853 ) ) ( not ( = ?auto_833848 ?auto_833854 ) ) ( not ( = ?auto_833848 ?auto_833855 ) ) ( not ( = ?auto_833848 ?auto_833858 ) ) ( not ( = ?auto_833850 ?auto_833851 ) ) ( not ( = ?auto_833850 ?auto_833852 ) ) ( not ( = ?auto_833850 ?auto_833853 ) ) ( not ( = ?auto_833850 ?auto_833854 ) ) ( not ( = ?auto_833850 ?auto_833855 ) ) ( not ( = ?auto_833850 ?auto_833858 ) ) ( not ( = ?auto_833851 ?auto_833852 ) ) ( not ( = ?auto_833851 ?auto_833853 ) ) ( not ( = ?auto_833851 ?auto_833854 ) ) ( not ( = ?auto_833851 ?auto_833855 ) ) ( not ( = ?auto_833851 ?auto_833858 ) ) ( not ( = ?auto_833852 ?auto_833853 ) ) ( not ( = ?auto_833852 ?auto_833854 ) ) ( not ( = ?auto_833852 ?auto_833855 ) ) ( not ( = ?auto_833852 ?auto_833858 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_833853 ?auto_833854 ?auto_833855 )
      ( MAKE-12CRATE-VERIFY ?auto_833844 ?auto_833845 ?auto_833846 ?auto_833843 ?auto_833847 ?auto_833849 ?auto_833848 ?auto_833850 ?auto_833851 ?auto_833852 ?auto_833853 ?auto_833854 ?auto_833855 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_834007 - SURFACE
      ?auto_834008 - SURFACE
      ?auto_834009 - SURFACE
      ?auto_834006 - SURFACE
      ?auto_834010 - SURFACE
      ?auto_834012 - SURFACE
      ?auto_834011 - SURFACE
      ?auto_834013 - SURFACE
      ?auto_834014 - SURFACE
      ?auto_834015 - SURFACE
      ?auto_834016 - SURFACE
      ?auto_834017 - SURFACE
      ?auto_834018 - SURFACE
    )
    :vars
    (
      ?auto_834024 - HOIST
      ?auto_834021 - PLACE
      ?auto_834023 - PLACE
      ?auto_834019 - HOIST
      ?auto_834020 - SURFACE
      ?auto_834022 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_834024 ?auto_834021 ) ( IS-CRATE ?auto_834018 ) ( not ( = ?auto_834017 ?auto_834018 ) ) ( not ( = ?auto_834016 ?auto_834017 ) ) ( not ( = ?auto_834016 ?auto_834018 ) ) ( not ( = ?auto_834023 ?auto_834021 ) ) ( HOIST-AT ?auto_834019 ?auto_834023 ) ( not ( = ?auto_834024 ?auto_834019 ) ) ( AVAILABLE ?auto_834019 ) ( SURFACE-AT ?auto_834018 ?auto_834023 ) ( ON ?auto_834018 ?auto_834020 ) ( CLEAR ?auto_834018 ) ( not ( = ?auto_834017 ?auto_834020 ) ) ( not ( = ?auto_834018 ?auto_834020 ) ) ( not ( = ?auto_834016 ?auto_834020 ) ) ( TRUCK-AT ?auto_834022 ?auto_834021 ) ( SURFACE-AT ?auto_834016 ?auto_834021 ) ( CLEAR ?auto_834016 ) ( LIFTING ?auto_834024 ?auto_834017 ) ( IS-CRATE ?auto_834017 ) ( ON ?auto_834008 ?auto_834007 ) ( ON ?auto_834009 ?auto_834008 ) ( ON ?auto_834006 ?auto_834009 ) ( ON ?auto_834010 ?auto_834006 ) ( ON ?auto_834012 ?auto_834010 ) ( ON ?auto_834011 ?auto_834012 ) ( ON ?auto_834013 ?auto_834011 ) ( ON ?auto_834014 ?auto_834013 ) ( ON ?auto_834015 ?auto_834014 ) ( ON ?auto_834016 ?auto_834015 ) ( not ( = ?auto_834007 ?auto_834008 ) ) ( not ( = ?auto_834007 ?auto_834009 ) ) ( not ( = ?auto_834007 ?auto_834006 ) ) ( not ( = ?auto_834007 ?auto_834010 ) ) ( not ( = ?auto_834007 ?auto_834012 ) ) ( not ( = ?auto_834007 ?auto_834011 ) ) ( not ( = ?auto_834007 ?auto_834013 ) ) ( not ( = ?auto_834007 ?auto_834014 ) ) ( not ( = ?auto_834007 ?auto_834015 ) ) ( not ( = ?auto_834007 ?auto_834016 ) ) ( not ( = ?auto_834007 ?auto_834017 ) ) ( not ( = ?auto_834007 ?auto_834018 ) ) ( not ( = ?auto_834007 ?auto_834020 ) ) ( not ( = ?auto_834008 ?auto_834009 ) ) ( not ( = ?auto_834008 ?auto_834006 ) ) ( not ( = ?auto_834008 ?auto_834010 ) ) ( not ( = ?auto_834008 ?auto_834012 ) ) ( not ( = ?auto_834008 ?auto_834011 ) ) ( not ( = ?auto_834008 ?auto_834013 ) ) ( not ( = ?auto_834008 ?auto_834014 ) ) ( not ( = ?auto_834008 ?auto_834015 ) ) ( not ( = ?auto_834008 ?auto_834016 ) ) ( not ( = ?auto_834008 ?auto_834017 ) ) ( not ( = ?auto_834008 ?auto_834018 ) ) ( not ( = ?auto_834008 ?auto_834020 ) ) ( not ( = ?auto_834009 ?auto_834006 ) ) ( not ( = ?auto_834009 ?auto_834010 ) ) ( not ( = ?auto_834009 ?auto_834012 ) ) ( not ( = ?auto_834009 ?auto_834011 ) ) ( not ( = ?auto_834009 ?auto_834013 ) ) ( not ( = ?auto_834009 ?auto_834014 ) ) ( not ( = ?auto_834009 ?auto_834015 ) ) ( not ( = ?auto_834009 ?auto_834016 ) ) ( not ( = ?auto_834009 ?auto_834017 ) ) ( not ( = ?auto_834009 ?auto_834018 ) ) ( not ( = ?auto_834009 ?auto_834020 ) ) ( not ( = ?auto_834006 ?auto_834010 ) ) ( not ( = ?auto_834006 ?auto_834012 ) ) ( not ( = ?auto_834006 ?auto_834011 ) ) ( not ( = ?auto_834006 ?auto_834013 ) ) ( not ( = ?auto_834006 ?auto_834014 ) ) ( not ( = ?auto_834006 ?auto_834015 ) ) ( not ( = ?auto_834006 ?auto_834016 ) ) ( not ( = ?auto_834006 ?auto_834017 ) ) ( not ( = ?auto_834006 ?auto_834018 ) ) ( not ( = ?auto_834006 ?auto_834020 ) ) ( not ( = ?auto_834010 ?auto_834012 ) ) ( not ( = ?auto_834010 ?auto_834011 ) ) ( not ( = ?auto_834010 ?auto_834013 ) ) ( not ( = ?auto_834010 ?auto_834014 ) ) ( not ( = ?auto_834010 ?auto_834015 ) ) ( not ( = ?auto_834010 ?auto_834016 ) ) ( not ( = ?auto_834010 ?auto_834017 ) ) ( not ( = ?auto_834010 ?auto_834018 ) ) ( not ( = ?auto_834010 ?auto_834020 ) ) ( not ( = ?auto_834012 ?auto_834011 ) ) ( not ( = ?auto_834012 ?auto_834013 ) ) ( not ( = ?auto_834012 ?auto_834014 ) ) ( not ( = ?auto_834012 ?auto_834015 ) ) ( not ( = ?auto_834012 ?auto_834016 ) ) ( not ( = ?auto_834012 ?auto_834017 ) ) ( not ( = ?auto_834012 ?auto_834018 ) ) ( not ( = ?auto_834012 ?auto_834020 ) ) ( not ( = ?auto_834011 ?auto_834013 ) ) ( not ( = ?auto_834011 ?auto_834014 ) ) ( not ( = ?auto_834011 ?auto_834015 ) ) ( not ( = ?auto_834011 ?auto_834016 ) ) ( not ( = ?auto_834011 ?auto_834017 ) ) ( not ( = ?auto_834011 ?auto_834018 ) ) ( not ( = ?auto_834011 ?auto_834020 ) ) ( not ( = ?auto_834013 ?auto_834014 ) ) ( not ( = ?auto_834013 ?auto_834015 ) ) ( not ( = ?auto_834013 ?auto_834016 ) ) ( not ( = ?auto_834013 ?auto_834017 ) ) ( not ( = ?auto_834013 ?auto_834018 ) ) ( not ( = ?auto_834013 ?auto_834020 ) ) ( not ( = ?auto_834014 ?auto_834015 ) ) ( not ( = ?auto_834014 ?auto_834016 ) ) ( not ( = ?auto_834014 ?auto_834017 ) ) ( not ( = ?auto_834014 ?auto_834018 ) ) ( not ( = ?auto_834014 ?auto_834020 ) ) ( not ( = ?auto_834015 ?auto_834016 ) ) ( not ( = ?auto_834015 ?auto_834017 ) ) ( not ( = ?auto_834015 ?auto_834018 ) ) ( not ( = ?auto_834015 ?auto_834020 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_834016 ?auto_834017 ?auto_834018 )
      ( MAKE-12CRATE-VERIFY ?auto_834007 ?auto_834008 ?auto_834009 ?auto_834006 ?auto_834010 ?auto_834012 ?auto_834011 ?auto_834013 ?auto_834014 ?auto_834015 ?auto_834016 ?auto_834017 ?auto_834018 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_834170 - SURFACE
      ?auto_834171 - SURFACE
      ?auto_834172 - SURFACE
      ?auto_834169 - SURFACE
      ?auto_834173 - SURFACE
      ?auto_834175 - SURFACE
      ?auto_834174 - SURFACE
      ?auto_834176 - SURFACE
      ?auto_834177 - SURFACE
      ?auto_834178 - SURFACE
      ?auto_834179 - SURFACE
      ?auto_834180 - SURFACE
      ?auto_834181 - SURFACE
    )
    :vars
    (
      ?auto_834183 - HOIST
      ?auto_834185 - PLACE
      ?auto_834187 - PLACE
      ?auto_834184 - HOIST
      ?auto_834186 - SURFACE
      ?auto_834182 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_834183 ?auto_834185 ) ( IS-CRATE ?auto_834181 ) ( not ( = ?auto_834180 ?auto_834181 ) ) ( not ( = ?auto_834179 ?auto_834180 ) ) ( not ( = ?auto_834179 ?auto_834181 ) ) ( not ( = ?auto_834187 ?auto_834185 ) ) ( HOIST-AT ?auto_834184 ?auto_834187 ) ( not ( = ?auto_834183 ?auto_834184 ) ) ( AVAILABLE ?auto_834184 ) ( SURFACE-AT ?auto_834181 ?auto_834187 ) ( ON ?auto_834181 ?auto_834186 ) ( CLEAR ?auto_834181 ) ( not ( = ?auto_834180 ?auto_834186 ) ) ( not ( = ?auto_834181 ?auto_834186 ) ) ( not ( = ?auto_834179 ?auto_834186 ) ) ( TRUCK-AT ?auto_834182 ?auto_834185 ) ( SURFACE-AT ?auto_834179 ?auto_834185 ) ( CLEAR ?auto_834179 ) ( IS-CRATE ?auto_834180 ) ( AVAILABLE ?auto_834183 ) ( IN ?auto_834180 ?auto_834182 ) ( ON ?auto_834171 ?auto_834170 ) ( ON ?auto_834172 ?auto_834171 ) ( ON ?auto_834169 ?auto_834172 ) ( ON ?auto_834173 ?auto_834169 ) ( ON ?auto_834175 ?auto_834173 ) ( ON ?auto_834174 ?auto_834175 ) ( ON ?auto_834176 ?auto_834174 ) ( ON ?auto_834177 ?auto_834176 ) ( ON ?auto_834178 ?auto_834177 ) ( ON ?auto_834179 ?auto_834178 ) ( not ( = ?auto_834170 ?auto_834171 ) ) ( not ( = ?auto_834170 ?auto_834172 ) ) ( not ( = ?auto_834170 ?auto_834169 ) ) ( not ( = ?auto_834170 ?auto_834173 ) ) ( not ( = ?auto_834170 ?auto_834175 ) ) ( not ( = ?auto_834170 ?auto_834174 ) ) ( not ( = ?auto_834170 ?auto_834176 ) ) ( not ( = ?auto_834170 ?auto_834177 ) ) ( not ( = ?auto_834170 ?auto_834178 ) ) ( not ( = ?auto_834170 ?auto_834179 ) ) ( not ( = ?auto_834170 ?auto_834180 ) ) ( not ( = ?auto_834170 ?auto_834181 ) ) ( not ( = ?auto_834170 ?auto_834186 ) ) ( not ( = ?auto_834171 ?auto_834172 ) ) ( not ( = ?auto_834171 ?auto_834169 ) ) ( not ( = ?auto_834171 ?auto_834173 ) ) ( not ( = ?auto_834171 ?auto_834175 ) ) ( not ( = ?auto_834171 ?auto_834174 ) ) ( not ( = ?auto_834171 ?auto_834176 ) ) ( not ( = ?auto_834171 ?auto_834177 ) ) ( not ( = ?auto_834171 ?auto_834178 ) ) ( not ( = ?auto_834171 ?auto_834179 ) ) ( not ( = ?auto_834171 ?auto_834180 ) ) ( not ( = ?auto_834171 ?auto_834181 ) ) ( not ( = ?auto_834171 ?auto_834186 ) ) ( not ( = ?auto_834172 ?auto_834169 ) ) ( not ( = ?auto_834172 ?auto_834173 ) ) ( not ( = ?auto_834172 ?auto_834175 ) ) ( not ( = ?auto_834172 ?auto_834174 ) ) ( not ( = ?auto_834172 ?auto_834176 ) ) ( not ( = ?auto_834172 ?auto_834177 ) ) ( not ( = ?auto_834172 ?auto_834178 ) ) ( not ( = ?auto_834172 ?auto_834179 ) ) ( not ( = ?auto_834172 ?auto_834180 ) ) ( not ( = ?auto_834172 ?auto_834181 ) ) ( not ( = ?auto_834172 ?auto_834186 ) ) ( not ( = ?auto_834169 ?auto_834173 ) ) ( not ( = ?auto_834169 ?auto_834175 ) ) ( not ( = ?auto_834169 ?auto_834174 ) ) ( not ( = ?auto_834169 ?auto_834176 ) ) ( not ( = ?auto_834169 ?auto_834177 ) ) ( not ( = ?auto_834169 ?auto_834178 ) ) ( not ( = ?auto_834169 ?auto_834179 ) ) ( not ( = ?auto_834169 ?auto_834180 ) ) ( not ( = ?auto_834169 ?auto_834181 ) ) ( not ( = ?auto_834169 ?auto_834186 ) ) ( not ( = ?auto_834173 ?auto_834175 ) ) ( not ( = ?auto_834173 ?auto_834174 ) ) ( not ( = ?auto_834173 ?auto_834176 ) ) ( not ( = ?auto_834173 ?auto_834177 ) ) ( not ( = ?auto_834173 ?auto_834178 ) ) ( not ( = ?auto_834173 ?auto_834179 ) ) ( not ( = ?auto_834173 ?auto_834180 ) ) ( not ( = ?auto_834173 ?auto_834181 ) ) ( not ( = ?auto_834173 ?auto_834186 ) ) ( not ( = ?auto_834175 ?auto_834174 ) ) ( not ( = ?auto_834175 ?auto_834176 ) ) ( not ( = ?auto_834175 ?auto_834177 ) ) ( not ( = ?auto_834175 ?auto_834178 ) ) ( not ( = ?auto_834175 ?auto_834179 ) ) ( not ( = ?auto_834175 ?auto_834180 ) ) ( not ( = ?auto_834175 ?auto_834181 ) ) ( not ( = ?auto_834175 ?auto_834186 ) ) ( not ( = ?auto_834174 ?auto_834176 ) ) ( not ( = ?auto_834174 ?auto_834177 ) ) ( not ( = ?auto_834174 ?auto_834178 ) ) ( not ( = ?auto_834174 ?auto_834179 ) ) ( not ( = ?auto_834174 ?auto_834180 ) ) ( not ( = ?auto_834174 ?auto_834181 ) ) ( not ( = ?auto_834174 ?auto_834186 ) ) ( not ( = ?auto_834176 ?auto_834177 ) ) ( not ( = ?auto_834176 ?auto_834178 ) ) ( not ( = ?auto_834176 ?auto_834179 ) ) ( not ( = ?auto_834176 ?auto_834180 ) ) ( not ( = ?auto_834176 ?auto_834181 ) ) ( not ( = ?auto_834176 ?auto_834186 ) ) ( not ( = ?auto_834177 ?auto_834178 ) ) ( not ( = ?auto_834177 ?auto_834179 ) ) ( not ( = ?auto_834177 ?auto_834180 ) ) ( not ( = ?auto_834177 ?auto_834181 ) ) ( not ( = ?auto_834177 ?auto_834186 ) ) ( not ( = ?auto_834178 ?auto_834179 ) ) ( not ( = ?auto_834178 ?auto_834180 ) ) ( not ( = ?auto_834178 ?auto_834181 ) ) ( not ( = ?auto_834178 ?auto_834186 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_834179 ?auto_834180 ?auto_834181 )
      ( MAKE-12CRATE-VERIFY ?auto_834170 ?auto_834171 ?auto_834172 ?auto_834169 ?auto_834173 ?auto_834175 ?auto_834174 ?auto_834176 ?auto_834177 ?auto_834178 ?auto_834179 ?auto_834180 ?auto_834181 ) )
  )

)

