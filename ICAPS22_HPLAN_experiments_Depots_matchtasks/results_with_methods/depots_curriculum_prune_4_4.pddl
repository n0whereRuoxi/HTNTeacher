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
      ?auto_870 - SURFACE
      ?auto_871 - SURFACE
    )
    :vars
    (
      ?auto_872 - HOIST
      ?auto_873 - PLACE
      ?auto_875 - PLACE
      ?auto_876 - HOIST
      ?auto_877 - SURFACE
      ?auto_874 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_872 ?auto_873 ) ( SURFACE-AT ?auto_870 ?auto_873 ) ( CLEAR ?auto_870 ) ( IS-CRATE ?auto_871 ) ( AVAILABLE ?auto_872 ) ( not ( = ?auto_875 ?auto_873 ) ) ( HOIST-AT ?auto_876 ?auto_875 ) ( AVAILABLE ?auto_876 ) ( SURFACE-AT ?auto_871 ?auto_875 ) ( ON ?auto_871 ?auto_877 ) ( CLEAR ?auto_871 ) ( TRUCK-AT ?auto_874 ?auto_873 ) ( not ( = ?auto_870 ?auto_871 ) ) ( not ( = ?auto_870 ?auto_877 ) ) ( not ( = ?auto_871 ?auto_877 ) ) ( not ( = ?auto_872 ?auto_876 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_874 ?auto_873 ?auto_875 )
      ( !LIFT ?auto_876 ?auto_871 ?auto_877 ?auto_875 )
      ( !LOAD ?auto_876 ?auto_871 ?auto_874 ?auto_875 )
      ( !DRIVE ?auto_874 ?auto_875 ?auto_873 )
      ( !UNLOAD ?auto_872 ?auto_871 ?auto_874 ?auto_873 )
      ( !DROP ?auto_872 ?auto_871 ?auto_870 ?auto_873 )
      ( MAKE-1CRATE-VERIFY ?auto_870 ?auto_871 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_891 - SURFACE
      ?auto_892 - SURFACE
      ?auto_893 - SURFACE
    )
    :vars
    (
      ?auto_894 - HOIST
      ?auto_898 - PLACE
      ?auto_896 - PLACE
      ?auto_899 - HOIST
      ?auto_895 - SURFACE
      ?auto_900 - PLACE
      ?auto_901 - HOIST
      ?auto_902 - SURFACE
      ?auto_897 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_894 ?auto_898 ) ( IS-CRATE ?auto_893 ) ( not ( = ?auto_896 ?auto_898 ) ) ( HOIST-AT ?auto_899 ?auto_896 ) ( AVAILABLE ?auto_899 ) ( SURFACE-AT ?auto_893 ?auto_896 ) ( ON ?auto_893 ?auto_895 ) ( CLEAR ?auto_893 ) ( not ( = ?auto_892 ?auto_893 ) ) ( not ( = ?auto_892 ?auto_895 ) ) ( not ( = ?auto_893 ?auto_895 ) ) ( not ( = ?auto_894 ?auto_899 ) ) ( SURFACE-AT ?auto_891 ?auto_898 ) ( CLEAR ?auto_891 ) ( IS-CRATE ?auto_892 ) ( AVAILABLE ?auto_894 ) ( not ( = ?auto_900 ?auto_898 ) ) ( HOIST-AT ?auto_901 ?auto_900 ) ( AVAILABLE ?auto_901 ) ( SURFACE-AT ?auto_892 ?auto_900 ) ( ON ?auto_892 ?auto_902 ) ( CLEAR ?auto_892 ) ( TRUCK-AT ?auto_897 ?auto_898 ) ( not ( = ?auto_891 ?auto_892 ) ) ( not ( = ?auto_891 ?auto_902 ) ) ( not ( = ?auto_892 ?auto_902 ) ) ( not ( = ?auto_894 ?auto_901 ) ) ( not ( = ?auto_891 ?auto_893 ) ) ( not ( = ?auto_891 ?auto_895 ) ) ( not ( = ?auto_893 ?auto_902 ) ) ( not ( = ?auto_896 ?auto_900 ) ) ( not ( = ?auto_899 ?auto_901 ) ) ( not ( = ?auto_895 ?auto_902 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_891 ?auto_892 )
      ( MAKE-1CRATE ?auto_892 ?auto_893 )
      ( MAKE-2CRATE-VERIFY ?auto_891 ?auto_892 ?auto_893 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_917 - SURFACE
      ?auto_918 - SURFACE
      ?auto_919 - SURFACE
      ?auto_920 - SURFACE
    )
    :vars
    (
      ?auto_921 - HOIST
      ?auto_925 - PLACE
      ?auto_924 - PLACE
      ?auto_922 - HOIST
      ?auto_926 - SURFACE
      ?auto_932 - PLACE
      ?auto_929 - HOIST
      ?auto_931 - SURFACE
      ?auto_930 - PLACE
      ?auto_928 - HOIST
      ?auto_927 - SURFACE
      ?auto_923 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_921 ?auto_925 ) ( IS-CRATE ?auto_920 ) ( not ( = ?auto_924 ?auto_925 ) ) ( HOIST-AT ?auto_922 ?auto_924 ) ( AVAILABLE ?auto_922 ) ( SURFACE-AT ?auto_920 ?auto_924 ) ( ON ?auto_920 ?auto_926 ) ( CLEAR ?auto_920 ) ( not ( = ?auto_919 ?auto_920 ) ) ( not ( = ?auto_919 ?auto_926 ) ) ( not ( = ?auto_920 ?auto_926 ) ) ( not ( = ?auto_921 ?auto_922 ) ) ( IS-CRATE ?auto_919 ) ( not ( = ?auto_932 ?auto_925 ) ) ( HOIST-AT ?auto_929 ?auto_932 ) ( AVAILABLE ?auto_929 ) ( SURFACE-AT ?auto_919 ?auto_932 ) ( ON ?auto_919 ?auto_931 ) ( CLEAR ?auto_919 ) ( not ( = ?auto_918 ?auto_919 ) ) ( not ( = ?auto_918 ?auto_931 ) ) ( not ( = ?auto_919 ?auto_931 ) ) ( not ( = ?auto_921 ?auto_929 ) ) ( SURFACE-AT ?auto_917 ?auto_925 ) ( CLEAR ?auto_917 ) ( IS-CRATE ?auto_918 ) ( AVAILABLE ?auto_921 ) ( not ( = ?auto_930 ?auto_925 ) ) ( HOIST-AT ?auto_928 ?auto_930 ) ( AVAILABLE ?auto_928 ) ( SURFACE-AT ?auto_918 ?auto_930 ) ( ON ?auto_918 ?auto_927 ) ( CLEAR ?auto_918 ) ( TRUCK-AT ?auto_923 ?auto_925 ) ( not ( = ?auto_917 ?auto_918 ) ) ( not ( = ?auto_917 ?auto_927 ) ) ( not ( = ?auto_918 ?auto_927 ) ) ( not ( = ?auto_921 ?auto_928 ) ) ( not ( = ?auto_917 ?auto_919 ) ) ( not ( = ?auto_917 ?auto_931 ) ) ( not ( = ?auto_919 ?auto_927 ) ) ( not ( = ?auto_932 ?auto_930 ) ) ( not ( = ?auto_929 ?auto_928 ) ) ( not ( = ?auto_931 ?auto_927 ) ) ( not ( = ?auto_917 ?auto_920 ) ) ( not ( = ?auto_917 ?auto_926 ) ) ( not ( = ?auto_918 ?auto_920 ) ) ( not ( = ?auto_918 ?auto_926 ) ) ( not ( = ?auto_920 ?auto_931 ) ) ( not ( = ?auto_920 ?auto_927 ) ) ( not ( = ?auto_924 ?auto_932 ) ) ( not ( = ?auto_924 ?auto_930 ) ) ( not ( = ?auto_922 ?auto_929 ) ) ( not ( = ?auto_922 ?auto_928 ) ) ( not ( = ?auto_926 ?auto_931 ) ) ( not ( = ?auto_926 ?auto_927 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_917 ?auto_918 ?auto_919 )
      ( MAKE-1CRATE ?auto_919 ?auto_920 )
      ( MAKE-3CRATE-VERIFY ?auto_917 ?auto_918 ?auto_919 ?auto_920 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_948 - SURFACE
      ?auto_949 - SURFACE
      ?auto_950 - SURFACE
      ?auto_951 - SURFACE
      ?auto_952 - SURFACE
    )
    :vars
    (
      ?auto_955 - HOIST
      ?auto_958 - PLACE
      ?auto_957 - PLACE
      ?auto_953 - HOIST
      ?auto_956 - SURFACE
      ?auto_960 - PLACE
      ?auto_961 - HOIST
      ?auto_959 - SURFACE
      ?auto_962 - PLACE
      ?auto_963 - HOIST
      ?auto_964 - SURFACE
      ?auto_965 - SURFACE
      ?auto_954 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_955 ?auto_958 ) ( IS-CRATE ?auto_952 ) ( not ( = ?auto_957 ?auto_958 ) ) ( HOIST-AT ?auto_953 ?auto_957 ) ( SURFACE-AT ?auto_952 ?auto_957 ) ( ON ?auto_952 ?auto_956 ) ( CLEAR ?auto_952 ) ( not ( = ?auto_951 ?auto_952 ) ) ( not ( = ?auto_951 ?auto_956 ) ) ( not ( = ?auto_952 ?auto_956 ) ) ( not ( = ?auto_955 ?auto_953 ) ) ( IS-CRATE ?auto_951 ) ( not ( = ?auto_960 ?auto_958 ) ) ( HOIST-AT ?auto_961 ?auto_960 ) ( AVAILABLE ?auto_961 ) ( SURFACE-AT ?auto_951 ?auto_960 ) ( ON ?auto_951 ?auto_959 ) ( CLEAR ?auto_951 ) ( not ( = ?auto_950 ?auto_951 ) ) ( not ( = ?auto_950 ?auto_959 ) ) ( not ( = ?auto_951 ?auto_959 ) ) ( not ( = ?auto_955 ?auto_961 ) ) ( IS-CRATE ?auto_950 ) ( not ( = ?auto_962 ?auto_958 ) ) ( HOIST-AT ?auto_963 ?auto_962 ) ( AVAILABLE ?auto_963 ) ( SURFACE-AT ?auto_950 ?auto_962 ) ( ON ?auto_950 ?auto_964 ) ( CLEAR ?auto_950 ) ( not ( = ?auto_949 ?auto_950 ) ) ( not ( = ?auto_949 ?auto_964 ) ) ( not ( = ?auto_950 ?auto_964 ) ) ( not ( = ?auto_955 ?auto_963 ) ) ( SURFACE-AT ?auto_948 ?auto_958 ) ( CLEAR ?auto_948 ) ( IS-CRATE ?auto_949 ) ( AVAILABLE ?auto_955 ) ( AVAILABLE ?auto_953 ) ( SURFACE-AT ?auto_949 ?auto_957 ) ( ON ?auto_949 ?auto_965 ) ( CLEAR ?auto_949 ) ( TRUCK-AT ?auto_954 ?auto_958 ) ( not ( = ?auto_948 ?auto_949 ) ) ( not ( = ?auto_948 ?auto_965 ) ) ( not ( = ?auto_949 ?auto_965 ) ) ( not ( = ?auto_948 ?auto_950 ) ) ( not ( = ?auto_948 ?auto_964 ) ) ( not ( = ?auto_950 ?auto_965 ) ) ( not ( = ?auto_962 ?auto_957 ) ) ( not ( = ?auto_963 ?auto_953 ) ) ( not ( = ?auto_964 ?auto_965 ) ) ( not ( = ?auto_948 ?auto_951 ) ) ( not ( = ?auto_948 ?auto_959 ) ) ( not ( = ?auto_949 ?auto_951 ) ) ( not ( = ?auto_949 ?auto_959 ) ) ( not ( = ?auto_951 ?auto_964 ) ) ( not ( = ?auto_951 ?auto_965 ) ) ( not ( = ?auto_960 ?auto_962 ) ) ( not ( = ?auto_960 ?auto_957 ) ) ( not ( = ?auto_961 ?auto_963 ) ) ( not ( = ?auto_961 ?auto_953 ) ) ( not ( = ?auto_959 ?auto_964 ) ) ( not ( = ?auto_959 ?auto_965 ) ) ( not ( = ?auto_948 ?auto_952 ) ) ( not ( = ?auto_948 ?auto_956 ) ) ( not ( = ?auto_949 ?auto_952 ) ) ( not ( = ?auto_949 ?auto_956 ) ) ( not ( = ?auto_950 ?auto_952 ) ) ( not ( = ?auto_950 ?auto_956 ) ) ( not ( = ?auto_952 ?auto_959 ) ) ( not ( = ?auto_952 ?auto_964 ) ) ( not ( = ?auto_952 ?auto_965 ) ) ( not ( = ?auto_956 ?auto_959 ) ) ( not ( = ?auto_956 ?auto_964 ) ) ( not ( = ?auto_956 ?auto_965 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_948 ?auto_949 ?auto_950 ?auto_951 )
      ( MAKE-1CRATE ?auto_951 ?auto_952 )
      ( MAKE-4CRATE-VERIFY ?auto_948 ?auto_949 ?auto_950 ?auto_951 ?auto_952 ) )
  )

)

