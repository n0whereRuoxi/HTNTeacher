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
      ?auto_41871 - SURFACE
      ?auto_41872 - SURFACE
    )
    :vars
    (
      ?auto_41873 - HOIST
      ?auto_41874 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_41873 ?auto_41874 ) ( SURFACE-AT ?auto_41872 ?auto_41874 ) ( CLEAR ?auto_41872 ) ( LIFTING ?auto_41873 ?auto_41871 ) ( IS-CRATE ?auto_41871 ) ( not ( = ?auto_41871 ?auto_41872 ) ) )
    :subtasks
    ( ( !DROP ?auto_41873 ?auto_41871 ?auto_41872 ?auto_41874 )
      ( MAKE-ON-VERIFY ?auto_41871 ?auto_41872 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_41875 - SURFACE
      ?auto_41876 - SURFACE
    )
    :vars
    (
      ?auto_41877 - HOIST
      ?auto_41878 - PLACE
      ?auto_41879 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_41877 ?auto_41878 ) ( SURFACE-AT ?auto_41876 ?auto_41878 ) ( CLEAR ?auto_41876 ) ( IS-CRATE ?auto_41875 ) ( not ( = ?auto_41875 ?auto_41876 ) ) ( TRUCK-AT ?auto_41879 ?auto_41878 ) ( AVAILABLE ?auto_41877 ) ( IN ?auto_41875 ?auto_41879 ) )
    :subtasks
    ( ( !UNLOAD ?auto_41877 ?auto_41875 ?auto_41879 ?auto_41878 )
      ( MAKE-ON ?auto_41875 ?auto_41876 )
      ( MAKE-ON-VERIFY ?auto_41875 ?auto_41876 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_41880 - SURFACE
      ?auto_41881 - SURFACE
    )
    :vars
    (
      ?auto_41882 - HOIST
      ?auto_41884 - PLACE
      ?auto_41883 - TRUCK
      ?auto_41885 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_41882 ?auto_41884 ) ( SURFACE-AT ?auto_41881 ?auto_41884 ) ( CLEAR ?auto_41881 ) ( IS-CRATE ?auto_41880 ) ( not ( = ?auto_41880 ?auto_41881 ) ) ( AVAILABLE ?auto_41882 ) ( IN ?auto_41880 ?auto_41883 ) ( TRUCK-AT ?auto_41883 ?auto_41885 ) ( not ( = ?auto_41885 ?auto_41884 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_41883 ?auto_41885 ?auto_41884 )
      ( MAKE-ON ?auto_41880 ?auto_41881 )
      ( MAKE-ON-VERIFY ?auto_41880 ?auto_41881 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_41886 - SURFACE
      ?auto_41887 - SURFACE
    )
    :vars
    (
      ?auto_41890 - HOIST
      ?auto_41888 - PLACE
      ?auto_41891 - TRUCK
      ?auto_41889 - PLACE
      ?auto_41892 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_41890 ?auto_41888 ) ( SURFACE-AT ?auto_41887 ?auto_41888 ) ( CLEAR ?auto_41887 ) ( IS-CRATE ?auto_41886 ) ( not ( = ?auto_41886 ?auto_41887 ) ) ( AVAILABLE ?auto_41890 ) ( TRUCK-AT ?auto_41891 ?auto_41889 ) ( not ( = ?auto_41889 ?auto_41888 ) ) ( HOIST-AT ?auto_41892 ?auto_41889 ) ( LIFTING ?auto_41892 ?auto_41886 ) ( not ( = ?auto_41890 ?auto_41892 ) ) )
    :subtasks
    ( ( !LOAD ?auto_41892 ?auto_41886 ?auto_41891 ?auto_41889 )
      ( MAKE-ON ?auto_41886 ?auto_41887 )
      ( MAKE-ON-VERIFY ?auto_41886 ?auto_41887 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_41893 - SURFACE
      ?auto_41894 - SURFACE
    )
    :vars
    (
      ?auto_41896 - HOIST
      ?auto_41895 - PLACE
      ?auto_41898 - TRUCK
      ?auto_41897 - PLACE
      ?auto_41899 - HOIST
      ?auto_41900 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_41896 ?auto_41895 ) ( SURFACE-AT ?auto_41894 ?auto_41895 ) ( CLEAR ?auto_41894 ) ( IS-CRATE ?auto_41893 ) ( not ( = ?auto_41893 ?auto_41894 ) ) ( AVAILABLE ?auto_41896 ) ( TRUCK-AT ?auto_41898 ?auto_41897 ) ( not ( = ?auto_41897 ?auto_41895 ) ) ( HOIST-AT ?auto_41899 ?auto_41897 ) ( not ( = ?auto_41896 ?auto_41899 ) ) ( AVAILABLE ?auto_41899 ) ( SURFACE-AT ?auto_41893 ?auto_41897 ) ( ON ?auto_41893 ?auto_41900 ) ( CLEAR ?auto_41893 ) ( not ( = ?auto_41893 ?auto_41900 ) ) ( not ( = ?auto_41894 ?auto_41900 ) ) )
    :subtasks
    ( ( !LIFT ?auto_41899 ?auto_41893 ?auto_41900 ?auto_41897 )
      ( MAKE-ON ?auto_41893 ?auto_41894 )
      ( MAKE-ON-VERIFY ?auto_41893 ?auto_41894 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_41901 - SURFACE
      ?auto_41902 - SURFACE
    )
    :vars
    (
      ?auto_41905 - HOIST
      ?auto_41908 - PLACE
      ?auto_41907 - PLACE
      ?auto_41903 - HOIST
      ?auto_41904 - SURFACE
      ?auto_41906 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_41905 ?auto_41908 ) ( SURFACE-AT ?auto_41902 ?auto_41908 ) ( CLEAR ?auto_41902 ) ( IS-CRATE ?auto_41901 ) ( not ( = ?auto_41901 ?auto_41902 ) ) ( AVAILABLE ?auto_41905 ) ( not ( = ?auto_41907 ?auto_41908 ) ) ( HOIST-AT ?auto_41903 ?auto_41907 ) ( not ( = ?auto_41905 ?auto_41903 ) ) ( AVAILABLE ?auto_41903 ) ( SURFACE-AT ?auto_41901 ?auto_41907 ) ( ON ?auto_41901 ?auto_41904 ) ( CLEAR ?auto_41901 ) ( not ( = ?auto_41901 ?auto_41904 ) ) ( not ( = ?auto_41902 ?auto_41904 ) ) ( TRUCK-AT ?auto_41906 ?auto_41908 ) )
    :subtasks
    ( ( !DRIVE ?auto_41906 ?auto_41908 ?auto_41907 )
      ( MAKE-ON ?auto_41901 ?auto_41902 )
      ( MAKE-ON-VERIFY ?auto_41901 ?auto_41902 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_41949 - SURFACE
      ?auto_41950 - SURFACE
    )
    :vars
    (
      ?auto_41956 - HOIST
      ?auto_41952 - PLACE
      ?auto_41955 - PLACE
      ?auto_41954 - HOIST
      ?auto_41953 - SURFACE
      ?auto_41951 - TRUCK
      ?auto_41957 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_41956 ?auto_41952 ) ( IS-CRATE ?auto_41949 ) ( not ( = ?auto_41949 ?auto_41950 ) ) ( not ( = ?auto_41955 ?auto_41952 ) ) ( HOIST-AT ?auto_41954 ?auto_41955 ) ( not ( = ?auto_41956 ?auto_41954 ) ) ( AVAILABLE ?auto_41954 ) ( SURFACE-AT ?auto_41949 ?auto_41955 ) ( ON ?auto_41949 ?auto_41953 ) ( CLEAR ?auto_41949 ) ( not ( = ?auto_41949 ?auto_41953 ) ) ( not ( = ?auto_41950 ?auto_41953 ) ) ( TRUCK-AT ?auto_41951 ?auto_41952 ) ( SURFACE-AT ?auto_41957 ?auto_41952 ) ( CLEAR ?auto_41957 ) ( LIFTING ?auto_41956 ?auto_41950 ) ( IS-CRATE ?auto_41950 ) ( not ( = ?auto_41949 ?auto_41957 ) ) ( not ( = ?auto_41950 ?auto_41957 ) ) ( not ( = ?auto_41953 ?auto_41957 ) ) )
    :subtasks
    ( ( !DROP ?auto_41956 ?auto_41950 ?auto_41957 ?auto_41952 )
      ( MAKE-ON ?auto_41949 ?auto_41950 )
      ( MAKE-ON-VERIFY ?auto_41949 ?auto_41950 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_41958 - SURFACE
      ?auto_41959 - SURFACE
    )
    :vars
    (
      ?auto_41966 - HOIST
      ?auto_41964 - PLACE
      ?auto_41963 - PLACE
      ?auto_41965 - HOIST
      ?auto_41961 - SURFACE
      ?auto_41960 - TRUCK
      ?auto_41962 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_41966 ?auto_41964 ) ( IS-CRATE ?auto_41958 ) ( not ( = ?auto_41958 ?auto_41959 ) ) ( not ( = ?auto_41963 ?auto_41964 ) ) ( HOIST-AT ?auto_41965 ?auto_41963 ) ( not ( = ?auto_41966 ?auto_41965 ) ) ( AVAILABLE ?auto_41965 ) ( SURFACE-AT ?auto_41958 ?auto_41963 ) ( ON ?auto_41958 ?auto_41961 ) ( CLEAR ?auto_41958 ) ( not ( = ?auto_41958 ?auto_41961 ) ) ( not ( = ?auto_41959 ?auto_41961 ) ) ( TRUCK-AT ?auto_41960 ?auto_41964 ) ( SURFACE-AT ?auto_41962 ?auto_41964 ) ( CLEAR ?auto_41962 ) ( IS-CRATE ?auto_41959 ) ( not ( = ?auto_41958 ?auto_41962 ) ) ( not ( = ?auto_41959 ?auto_41962 ) ) ( not ( = ?auto_41961 ?auto_41962 ) ) ( AVAILABLE ?auto_41966 ) ( IN ?auto_41959 ?auto_41960 ) )
    :subtasks
    ( ( !UNLOAD ?auto_41966 ?auto_41959 ?auto_41960 ?auto_41964 )
      ( MAKE-ON ?auto_41958 ?auto_41959 )
      ( MAKE-ON-VERIFY ?auto_41958 ?auto_41959 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_41973 - SURFACE
      ?auto_41974 - SURFACE
    )
    :vars
    (
      ?auto_41980 - HOIST
      ?auto_41976 - PLACE
      ?auto_41975 - PLACE
      ?auto_41977 - HOIST
      ?auto_41978 - SURFACE
      ?auto_41979 - TRUCK
      ?auto_41981 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_41980 ?auto_41976 ) ( SURFACE-AT ?auto_41974 ?auto_41976 ) ( CLEAR ?auto_41974 ) ( IS-CRATE ?auto_41973 ) ( not ( = ?auto_41973 ?auto_41974 ) ) ( AVAILABLE ?auto_41980 ) ( not ( = ?auto_41975 ?auto_41976 ) ) ( HOIST-AT ?auto_41977 ?auto_41975 ) ( not ( = ?auto_41980 ?auto_41977 ) ) ( AVAILABLE ?auto_41977 ) ( SURFACE-AT ?auto_41973 ?auto_41975 ) ( ON ?auto_41973 ?auto_41978 ) ( CLEAR ?auto_41973 ) ( not ( = ?auto_41973 ?auto_41978 ) ) ( not ( = ?auto_41974 ?auto_41978 ) ) ( TRUCK-AT ?auto_41979 ?auto_41981 ) ( not ( = ?auto_41981 ?auto_41976 ) ) ( not ( = ?auto_41975 ?auto_41981 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_41979 ?auto_41981 ?auto_41976 )
      ( MAKE-ON ?auto_41973 ?auto_41974 )
      ( MAKE-ON-VERIFY ?auto_41973 ?auto_41974 ) )
  )

)

