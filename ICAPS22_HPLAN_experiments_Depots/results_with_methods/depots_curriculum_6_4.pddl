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
      ?auto_942 - SURFACE
      ?auto_943 - SURFACE
    )
    :vars
    (
      ?auto_944 - HOIST
      ?auto_945 - PLACE
      ?auto_947 - PLACE
      ?auto_948 - HOIST
      ?auto_949 - SURFACE
      ?auto_946 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_944 ?auto_945 ) ( SURFACE-AT ?auto_943 ?auto_945 ) ( CLEAR ?auto_943 ) ( IS-CRATE ?auto_942 ) ( AVAILABLE ?auto_944 ) ( not ( = ?auto_947 ?auto_945 ) ) ( HOIST-AT ?auto_948 ?auto_947 ) ( AVAILABLE ?auto_948 ) ( SURFACE-AT ?auto_942 ?auto_947 ) ( ON ?auto_942 ?auto_949 ) ( CLEAR ?auto_942 ) ( TRUCK-AT ?auto_946 ?auto_945 ) ( not ( = ?auto_942 ?auto_943 ) ) ( not ( = ?auto_942 ?auto_949 ) ) ( not ( = ?auto_943 ?auto_949 ) ) ( not ( = ?auto_944 ?auto_948 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_946 ?auto_945 ?auto_947 )
      ( !LIFT ?auto_948 ?auto_942 ?auto_949 ?auto_947 )
      ( !LOAD ?auto_948 ?auto_942 ?auto_946 ?auto_947 )
      ( !DRIVE ?auto_946 ?auto_947 ?auto_945 )
      ( !UNLOAD ?auto_944 ?auto_942 ?auto_946 ?auto_945 )
      ( !DROP ?auto_944 ?auto_942 ?auto_943 ?auto_945 )
      ( MAKE-ON-VERIFY ?auto_942 ?auto_943 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_952 - SURFACE
      ?auto_953 - SURFACE
    )
    :vars
    (
      ?auto_954 - HOIST
      ?auto_955 - PLACE
      ?auto_957 - PLACE
      ?auto_958 - HOIST
      ?auto_959 - SURFACE
      ?auto_956 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_954 ?auto_955 ) ( SURFACE-AT ?auto_953 ?auto_955 ) ( CLEAR ?auto_953 ) ( IS-CRATE ?auto_952 ) ( AVAILABLE ?auto_954 ) ( not ( = ?auto_957 ?auto_955 ) ) ( HOIST-AT ?auto_958 ?auto_957 ) ( AVAILABLE ?auto_958 ) ( SURFACE-AT ?auto_952 ?auto_957 ) ( ON ?auto_952 ?auto_959 ) ( CLEAR ?auto_952 ) ( TRUCK-AT ?auto_956 ?auto_955 ) ( not ( = ?auto_952 ?auto_953 ) ) ( not ( = ?auto_952 ?auto_959 ) ) ( not ( = ?auto_953 ?auto_959 ) ) ( not ( = ?auto_954 ?auto_958 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_956 ?auto_955 ?auto_957 )
      ( !LIFT ?auto_958 ?auto_952 ?auto_959 ?auto_957 )
      ( !LOAD ?auto_958 ?auto_952 ?auto_956 ?auto_957 )
      ( !DRIVE ?auto_956 ?auto_957 ?auto_955 )
      ( !UNLOAD ?auto_954 ?auto_952 ?auto_956 ?auto_955 )
      ( !DROP ?auto_954 ?auto_952 ?auto_953 ?auto_955 )
      ( MAKE-ON-VERIFY ?auto_952 ?auto_953 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_962 - SURFACE
      ?auto_963 - SURFACE
    )
    :vars
    (
      ?auto_964 - HOIST
      ?auto_965 - PLACE
      ?auto_967 - PLACE
      ?auto_968 - HOIST
      ?auto_969 - SURFACE
      ?auto_966 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_964 ?auto_965 ) ( SURFACE-AT ?auto_963 ?auto_965 ) ( CLEAR ?auto_963 ) ( IS-CRATE ?auto_962 ) ( AVAILABLE ?auto_964 ) ( not ( = ?auto_967 ?auto_965 ) ) ( HOIST-AT ?auto_968 ?auto_967 ) ( AVAILABLE ?auto_968 ) ( SURFACE-AT ?auto_962 ?auto_967 ) ( ON ?auto_962 ?auto_969 ) ( CLEAR ?auto_962 ) ( TRUCK-AT ?auto_966 ?auto_965 ) ( not ( = ?auto_962 ?auto_963 ) ) ( not ( = ?auto_962 ?auto_969 ) ) ( not ( = ?auto_963 ?auto_969 ) ) ( not ( = ?auto_964 ?auto_968 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_966 ?auto_965 ?auto_967 )
      ( !LIFT ?auto_968 ?auto_962 ?auto_969 ?auto_967 )
      ( !LOAD ?auto_968 ?auto_962 ?auto_966 ?auto_967 )
      ( !DRIVE ?auto_966 ?auto_967 ?auto_965 )
      ( !UNLOAD ?auto_964 ?auto_962 ?auto_966 ?auto_965 )
      ( !DROP ?auto_964 ?auto_962 ?auto_963 ?auto_965 )
      ( MAKE-ON-VERIFY ?auto_962 ?auto_963 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_972 - SURFACE
      ?auto_973 - SURFACE
    )
    :vars
    (
      ?auto_974 - HOIST
      ?auto_975 - PLACE
      ?auto_977 - PLACE
      ?auto_978 - HOIST
      ?auto_979 - SURFACE
      ?auto_976 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_974 ?auto_975 ) ( SURFACE-AT ?auto_973 ?auto_975 ) ( CLEAR ?auto_973 ) ( IS-CRATE ?auto_972 ) ( AVAILABLE ?auto_974 ) ( not ( = ?auto_977 ?auto_975 ) ) ( HOIST-AT ?auto_978 ?auto_977 ) ( AVAILABLE ?auto_978 ) ( SURFACE-AT ?auto_972 ?auto_977 ) ( ON ?auto_972 ?auto_979 ) ( CLEAR ?auto_972 ) ( TRUCK-AT ?auto_976 ?auto_975 ) ( not ( = ?auto_972 ?auto_973 ) ) ( not ( = ?auto_972 ?auto_979 ) ) ( not ( = ?auto_973 ?auto_979 ) ) ( not ( = ?auto_974 ?auto_978 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_976 ?auto_975 ?auto_977 )
      ( !LIFT ?auto_978 ?auto_972 ?auto_979 ?auto_977 )
      ( !LOAD ?auto_978 ?auto_972 ?auto_976 ?auto_977 )
      ( !DRIVE ?auto_976 ?auto_977 ?auto_975 )
      ( !UNLOAD ?auto_974 ?auto_972 ?auto_976 ?auto_975 )
      ( !DROP ?auto_974 ?auto_972 ?auto_973 ?auto_975 )
      ( MAKE-ON-VERIFY ?auto_972 ?auto_973 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_982 - SURFACE
      ?auto_983 - SURFACE
    )
    :vars
    (
      ?auto_984 - HOIST
      ?auto_985 - PLACE
      ?auto_987 - PLACE
      ?auto_988 - HOIST
      ?auto_989 - SURFACE
      ?auto_986 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_984 ?auto_985 ) ( SURFACE-AT ?auto_983 ?auto_985 ) ( CLEAR ?auto_983 ) ( IS-CRATE ?auto_982 ) ( AVAILABLE ?auto_984 ) ( not ( = ?auto_987 ?auto_985 ) ) ( HOIST-AT ?auto_988 ?auto_987 ) ( AVAILABLE ?auto_988 ) ( SURFACE-AT ?auto_982 ?auto_987 ) ( ON ?auto_982 ?auto_989 ) ( CLEAR ?auto_982 ) ( TRUCK-AT ?auto_986 ?auto_985 ) ( not ( = ?auto_982 ?auto_983 ) ) ( not ( = ?auto_982 ?auto_989 ) ) ( not ( = ?auto_983 ?auto_989 ) ) ( not ( = ?auto_984 ?auto_988 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_986 ?auto_985 ?auto_987 )
      ( !LIFT ?auto_988 ?auto_982 ?auto_989 ?auto_987 )
      ( !LOAD ?auto_988 ?auto_982 ?auto_986 ?auto_987 )
      ( !DRIVE ?auto_986 ?auto_987 ?auto_985 )
      ( !UNLOAD ?auto_984 ?auto_982 ?auto_986 ?auto_985 )
      ( !DROP ?auto_984 ?auto_982 ?auto_983 ?auto_985 )
      ( MAKE-ON-VERIFY ?auto_982 ?auto_983 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_992 - SURFACE
      ?auto_993 - SURFACE
    )
    :vars
    (
      ?auto_994 - HOIST
      ?auto_995 - PLACE
      ?auto_997 - PLACE
      ?auto_998 - HOIST
      ?auto_999 - SURFACE
      ?auto_996 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_994 ?auto_995 ) ( SURFACE-AT ?auto_993 ?auto_995 ) ( CLEAR ?auto_993 ) ( IS-CRATE ?auto_992 ) ( AVAILABLE ?auto_994 ) ( not ( = ?auto_997 ?auto_995 ) ) ( HOIST-AT ?auto_998 ?auto_997 ) ( AVAILABLE ?auto_998 ) ( SURFACE-AT ?auto_992 ?auto_997 ) ( ON ?auto_992 ?auto_999 ) ( CLEAR ?auto_992 ) ( TRUCK-AT ?auto_996 ?auto_995 ) ( not ( = ?auto_992 ?auto_993 ) ) ( not ( = ?auto_992 ?auto_999 ) ) ( not ( = ?auto_993 ?auto_999 ) ) ( not ( = ?auto_994 ?auto_998 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_996 ?auto_995 ?auto_997 )
      ( !LIFT ?auto_998 ?auto_992 ?auto_999 ?auto_997 )
      ( !LOAD ?auto_998 ?auto_992 ?auto_996 ?auto_997 )
      ( !DRIVE ?auto_996 ?auto_997 ?auto_995 )
      ( !UNLOAD ?auto_994 ?auto_992 ?auto_996 ?auto_995 )
      ( !DROP ?auto_994 ?auto_992 ?auto_993 ?auto_995 )
      ( MAKE-ON-VERIFY ?auto_992 ?auto_993 ) )
  )

)

