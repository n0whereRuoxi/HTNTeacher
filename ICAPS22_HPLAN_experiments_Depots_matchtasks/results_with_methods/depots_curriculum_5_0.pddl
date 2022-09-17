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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_968 - SURFACE
      ?auto_969 - SURFACE
    )
    :vars
    (
      ?auto_970 - HOIST
      ?auto_971 - PLACE
      ?auto_973 - PLACE
      ?auto_974 - HOIST
      ?auto_975 - SURFACE
      ?auto_972 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_970 ?auto_971 ) ( SURFACE-AT ?auto_968 ?auto_971 ) ( CLEAR ?auto_968 ) ( IS-CRATE ?auto_969 ) ( AVAILABLE ?auto_970 ) ( not ( = ?auto_973 ?auto_971 ) ) ( HOIST-AT ?auto_974 ?auto_973 ) ( AVAILABLE ?auto_974 ) ( SURFACE-AT ?auto_969 ?auto_973 ) ( ON ?auto_969 ?auto_975 ) ( CLEAR ?auto_969 ) ( TRUCK-AT ?auto_972 ?auto_971 ) ( not ( = ?auto_968 ?auto_969 ) ) ( not ( = ?auto_968 ?auto_975 ) ) ( not ( = ?auto_969 ?auto_975 ) ) ( not ( = ?auto_970 ?auto_974 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_972 ?auto_971 ?auto_973 )
      ( !LIFT ?auto_974 ?auto_969 ?auto_975 ?auto_973 )
      ( !LOAD ?auto_974 ?auto_969 ?auto_972 ?auto_973 )
      ( !DRIVE ?auto_972 ?auto_973 ?auto_971 )
      ( !UNLOAD ?auto_970 ?auto_969 ?auto_972 ?auto_971 )
      ( !DROP ?auto_970 ?auto_969 ?auto_968 ?auto_971 )
      ( MAKE-1CRATE-VERIFY ?auto_968 ?auto_969 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_978 - SURFACE
      ?auto_979 - SURFACE
    )
    :vars
    (
      ?auto_980 - HOIST
      ?auto_981 - PLACE
      ?auto_983 - PLACE
      ?auto_984 - HOIST
      ?auto_985 - SURFACE
      ?auto_982 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_980 ?auto_981 ) ( SURFACE-AT ?auto_978 ?auto_981 ) ( CLEAR ?auto_978 ) ( IS-CRATE ?auto_979 ) ( AVAILABLE ?auto_980 ) ( not ( = ?auto_983 ?auto_981 ) ) ( HOIST-AT ?auto_984 ?auto_983 ) ( AVAILABLE ?auto_984 ) ( SURFACE-AT ?auto_979 ?auto_983 ) ( ON ?auto_979 ?auto_985 ) ( CLEAR ?auto_979 ) ( TRUCK-AT ?auto_982 ?auto_981 ) ( not ( = ?auto_978 ?auto_979 ) ) ( not ( = ?auto_978 ?auto_985 ) ) ( not ( = ?auto_979 ?auto_985 ) ) ( not ( = ?auto_980 ?auto_984 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_982 ?auto_981 ?auto_983 )
      ( !LIFT ?auto_984 ?auto_979 ?auto_985 ?auto_983 )
      ( !LOAD ?auto_984 ?auto_979 ?auto_982 ?auto_983 )
      ( !DRIVE ?auto_982 ?auto_983 ?auto_981 )
      ( !UNLOAD ?auto_980 ?auto_979 ?auto_982 ?auto_981 )
      ( !DROP ?auto_980 ?auto_979 ?auto_978 ?auto_981 )
      ( MAKE-1CRATE-VERIFY ?auto_978 ?auto_979 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_989 - SURFACE
      ?auto_990 - SURFACE
      ?auto_991 - SURFACE
    )
    :vars
    (
      ?auto_997 - HOIST
      ?auto_992 - PLACE
      ?auto_994 - PLACE
      ?auto_995 - HOIST
      ?auto_996 - SURFACE
      ?auto_998 - PLACE
      ?auto_999 - HOIST
      ?auto_1000 - SURFACE
      ?auto_993 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_997 ?auto_992 ) ( IS-CRATE ?auto_991 ) ( not ( = ?auto_994 ?auto_992 ) ) ( HOIST-AT ?auto_995 ?auto_994 ) ( AVAILABLE ?auto_995 ) ( SURFACE-AT ?auto_991 ?auto_994 ) ( ON ?auto_991 ?auto_996 ) ( CLEAR ?auto_991 ) ( not ( = ?auto_990 ?auto_991 ) ) ( not ( = ?auto_990 ?auto_996 ) ) ( not ( = ?auto_991 ?auto_996 ) ) ( not ( = ?auto_997 ?auto_995 ) ) ( SURFACE-AT ?auto_989 ?auto_992 ) ( CLEAR ?auto_989 ) ( IS-CRATE ?auto_990 ) ( AVAILABLE ?auto_997 ) ( not ( = ?auto_998 ?auto_992 ) ) ( HOIST-AT ?auto_999 ?auto_998 ) ( AVAILABLE ?auto_999 ) ( SURFACE-AT ?auto_990 ?auto_998 ) ( ON ?auto_990 ?auto_1000 ) ( CLEAR ?auto_990 ) ( TRUCK-AT ?auto_993 ?auto_992 ) ( not ( = ?auto_989 ?auto_990 ) ) ( not ( = ?auto_989 ?auto_1000 ) ) ( not ( = ?auto_990 ?auto_1000 ) ) ( not ( = ?auto_997 ?auto_999 ) ) ( not ( = ?auto_989 ?auto_991 ) ) ( not ( = ?auto_989 ?auto_996 ) ) ( not ( = ?auto_991 ?auto_1000 ) ) ( not ( = ?auto_994 ?auto_998 ) ) ( not ( = ?auto_995 ?auto_999 ) ) ( not ( = ?auto_996 ?auto_1000 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_989 ?auto_990 )
      ( MAKE-1CRATE ?auto_990 ?auto_991 )
      ( MAKE-2CRATE-VERIFY ?auto_989 ?auto_990 ?auto_991 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1003 - SURFACE
      ?auto_1004 - SURFACE
    )
    :vars
    (
      ?auto_1005 - HOIST
      ?auto_1006 - PLACE
      ?auto_1008 - PLACE
      ?auto_1009 - HOIST
      ?auto_1010 - SURFACE
      ?auto_1007 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1005 ?auto_1006 ) ( SURFACE-AT ?auto_1003 ?auto_1006 ) ( CLEAR ?auto_1003 ) ( IS-CRATE ?auto_1004 ) ( AVAILABLE ?auto_1005 ) ( not ( = ?auto_1008 ?auto_1006 ) ) ( HOIST-AT ?auto_1009 ?auto_1008 ) ( AVAILABLE ?auto_1009 ) ( SURFACE-AT ?auto_1004 ?auto_1008 ) ( ON ?auto_1004 ?auto_1010 ) ( CLEAR ?auto_1004 ) ( TRUCK-AT ?auto_1007 ?auto_1006 ) ( not ( = ?auto_1003 ?auto_1004 ) ) ( not ( = ?auto_1003 ?auto_1010 ) ) ( not ( = ?auto_1004 ?auto_1010 ) ) ( not ( = ?auto_1005 ?auto_1009 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1007 ?auto_1006 ?auto_1008 )
      ( !LIFT ?auto_1009 ?auto_1004 ?auto_1010 ?auto_1008 )
      ( !LOAD ?auto_1009 ?auto_1004 ?auto_1007 ?auto_1008 )
      ( !DRIVE ?auto_1007 ?auto_1008 ?auto_1006 )
      ( !UNLOAD ?auto_1005 ?auto_1004 ?auto_1007 ?auto_1006 )
      ( !DROP ?auto_1005 ?auto_1004 ?auto_1003 ?auto_1006 )
      ( MAKE-1CRATE-VERIFY ?auto_1003 ?auto_1004 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1015 - SURFACE
      ?auto_1016 - SURFACE
      ?auto_1017 - SURFACE
      ?auto_1018 - SURFACE
    )
    :vars
    (
      ?auto_1023 - HOIST
      ?auto_1019 - PLACE
      ?auto_1024 - PLACE
      ?auto_1022 - HOIST
      ?auto_1020 - SURFACE
      ?auto_1028 - PLACE
      ?auto_1027 - HOIST
      ?auto_1026 - SURFACE
      ?auto_1029 - PLACE
      ?auto_1030 - HOIST
      ?auto_1025 - SURFACE
      ?auto_1021 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1023 ?auto_1019 ) ( IS-CRATE ?auto_1018 ) ( not ( = ?auto_1024 ?auto_1019 ) ) ( HOIST-AT ?auto_1022 ?auto_1024 ) ( AVAILABLE ?auto_1022 ) ( SURFACE-AT ?auto_1018 ?auto_1024 ) ( ON ?auto_1018 ?auto_1020 ) ( CLEAR ?auto_1018 ) ( not ( = ?auto_1017 ?auto_1018 ) ) ( not ( = ?auto_1017 ?auto_1020 ) ) ( not ( = ?auto_1018 ?auto_1020 ) ) ( not ( = ?auto_1023 ?auto_1022 ) ) ( IS-CRATE ?auto_1017 ) ( not ( = ?auto_1028 ?auto_1019 ) ) ( HOIST-AT ?auto_1027 ?auto_1028 ) ( AVAILABLE ?auto_1027 ) ( SURFACE-AT ?auto_1017 ?auto_1028 ) ( ON ?auto_1017 ?auto_1026 ) ( CLEAR ?auto_1017 ) ( not ( = ?auto_1016 ?auto_1017 ) ) ( not ( = ?auto_1016 ?auto_1026 ) ) ( not ( = ?auto_1017 ?auto_1026 ) ) ( not ( = ?auto_1023 ?auto_1027 ) ) ( SURFACE-AT ?auto_1015 ?auto_1019 ) ( CLEAR ?auto_1015 ) ( IS-CRATE ?auto_1016 ) ( AVAILABLE ?auto_1023 ) ( not ( = ?auto_1029 ?auto_1019 ) ) ( HOIST-AT ?auto_1030 ?auto_1029 ) ( AVAILABLE ?auto_1030 ) ( SURFACE-AT ?auto_1016 ?auto_1029 ) ( ON ?auto_1016 ?auto_1025 ) ( CLEAR ?auto_1016 ) ( TRUCK-AT ?auto_1021 ?auto_1019 ) ( not ( = ?auto_1015 ?auto_1016 ) ) ( not ( = ?auto_1015 ?auto_1025 ) ) ( not ( = ?auto_1016 ?auto_1025 ) ) ( not ( = ?auto_1023 ?auto_1030 ) ) ( not ( = ?auto_1015 ?auto_1017 ) ) ( not ( = ?auto_1015 ?auto_1026 ) ) ( not ( = ?auto_1017 ?auto_1025 ) ) ( not ( = ?auto_1028 ?auto_1029 ) ) ( not ( = ?auto_1027 ?auto_1030 ) ) ( not ( = ?auto_1026 ?auto_1025 ) ) ( not ( = ?auto_1015 ?auto_1018 ) ) ( not ( = ?auto_1015 ?auto_1020 ) ) ( not ( = ?auto_1016 ?auto_1018 ) ) ( not ( = ?auto_1016 ?auto_1020 ) ) ( not ( = ?auto_1018 ?auto_1026 ) ) ( not ( = ?auto_1018 ?auto_1025 ) ) ( not ( = ?auto_1024 ?auto_1028 ) ) ( not ( = ?auto_1024 ?auto_1029 ) ) ( not ( = ?auto_1022 ?auto_1027 ) ) ( not ( = ?auto_1022 ?auto_1030 ) ) ( not ( = ?auto_1020 ?auto_1026 ) ) ( not ( = ?auto_1020 ?auto_1025 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1015 ?auto_1016 ?auto_1017 )
      ( MAKE-1CRATE ?auto_1017 ?auto_1018 )
      ( MAKE-3CRATE-VERIFY ?auto_1015 ?auto_1016 ?auto_1017 ?auto_1018 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1033 - SURFACE
      ?auto_1034 - SURFACE
    )
    :vars
    (
      ?auto_1035 - HOIST
      ?auto_1036 - PLACE
      ?auto_1038 - PLACE
      ?auto_1039 - HOIST
      ?auto_1040 - SURFACE
      ?auto_1037 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1035 ?auto_1036 ) ( SURFACE-AT ?auto_1033 ?auto_1036 ) ( CLEAR ?auto_1033 ) ( IS-CRATE ?auto_1034 ) ( AVAILABLE ?auto_1035 ) ( not ( = ?auto_1038 ?auto_1036 ) ) ( HOIST-AT ?auto_1039 ?auto_1038 ) ( AVAILABLE ?auto_1039 ) ( SURFACE-AT ?auto_1034 ?auto_1038 ) ( ON ?auto_1034 ?auto_1040 ) ( CLEAR ?auto_1034 ) ( TRUCK-AT ?auto_1037 ?auto_1036 ) ( not ( = ?auto_1033 ?auto_1034 ) ) ( not ( = ?auto_1033 ?auto_1040 ) ) ( not ( = ?auto_1034 ?auto_1040 ) ) ( not ( = ?auto_1035 ?auto_1039 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1037 ?auto_1036 ?auto_1038 )
      ( !LIFT ?auto_1039 ?auto_1034 ?auto_1040 ?auto_1038 )
      ( !LOAD ?auto_1039 ?auto_1034 ?auto_1037 ?auto_1038 )
      ( !DRIVE ?auto_1037 ?auto_1038 ?auto_1036 )
      ( !UNLOAD ?auto_1035 ?auto_1034 ?auto_1037 ?auto_1036 )
      ( !DROP ?auto_1035 ?auto_1034 ?auto_1033 ?auto_1036 )
      ( MAKE-1CRATE-VERIFY ?auto_1033 ?auto_1034 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1046 - SURFACE
      ?auto_1047 - SURFACE
      ?auto_1048 - SURFACE
      ?auto_1049 - SURFACE
      ?auto_1050 - SURFACE
    )
    :vars
    (
      ?auto_1054 - HOIST
      ?auto_1055 - PLACE
      ?auto_1053 - PLACE
      ?auto_1052 - HOIST
      ?auto_1056 - SURFACE
      ?auto_1059 - PLACE
      ?auto_1057 - HOIST
      ?auto_1058 - SURFACE
      ?auto_1061 - PLACE
      ?auto_1060 - HOIST
      ?auto_1063 - SURFACE
      ?auto_1062 - SURFACE
      ?auto_1051 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1054 ?auto_1055 ) ( IS-CRATE ?auto_1050 ) ( not ( = ?auto_1053 ?auto_1055 ) ) ( HOIST-AT ?auto_1052 ?auto_1053 ) ( SURFACE-AT ?auto_1050 ?auto_1053 ) ( ON ?auto_1050 ?auto_1056 ) ( CLEAR ?auto_1050 ) ( not ( = ?auto_1049 ?auto_1050 ) ) ( not ( = ?auto_1049 ?auto_1056 ) ) ( not ( = ?auto_1050 ?auto_1056 ) ) ( not ( = ?auto_1054 ?auto_1052 ) ) ( IS-CRATE ?auto_1049 ) ( not ( = ?auto_1059 ?auto_1055 ) ) ( HOIST-AT ?auto_1057 ?auto_1059 ) ( AVAILABLE ?auto_1057 ) ( SURFACE-AT ?auto_1049 ?auto_1059 ) ( ON ?auto_1049 ?auto_1058 ) ( CLEAR ?auto_1049 ) ( not ( = ?auto_1048 ?auto_1049 ) ) ( not ( = ?auto_1048 ?auto_1058 ) ) ( not ( = ?auto_1049 ?auto_1058 ) ) ( not ( = ?auto_1054 ?auto_1057 ) ) ( IS-CRATE ?auto_1048 ) ( not ( = ?auto_1061 ?auto_1055 ) ) ( HOIST-AT ?auto_1060 ?auto_1061 ) ( AVAILABLE ?auto_1060 ) ( SURFACE-AT ?auto_1048 ?auto_1061 ) ( ON ?auto_1048 ?auto_1063 ) ( CLEAR ?auto_1048 ) ( not ( = ?auto_1047 ?auto_1048 ) ) ( not ( = ?auto_1047 ?auto_1063 ) ) ( not ( = ?auto_1048 ?auto_1063 ) ) ( not ( = ?auto_1054 ?auto_1060 ) ) ( SURFACE-AT ?auto_1046 ?auto_1055 ) ( CLEAR ?auto_1046 ) ( IS-CRATE ?auto_1047 ) ( AVAILABLE ?auto_1054 ) ( AVAILABLE ?auto_1052 ) ( SURFACE-AT ?auto_1047 ?auto_1053 ) ( ON ?auto_1047 ?auto_1062 ) ( CLEAR ?auto_1047 ) ( TRUCK-AT ?auto_1051 ?auto_1055 ) ( not ( = ?auto_1046 ?auto_1047 ) ) ( not ( = ?auto_1046 ?auto_1062 ) ) ( not ( = ?auto_1047 ?auto_1062 ) ) ( not ( = ?auto_1046 ?auto_1048 ) ) ( not ( = ?auto_1046 ?auto_1063 ) ) ( not ( = ?auto_1048 ?auto_1062 ) ) ( not ( = ?auto_1061 ?auto_1053 ) ) ( not ( = ?auto_1060 ?auto_1052 ) ) ( not ( = ?auto_1063 ?auto_1062 ) ) ( not ( = ?auto_1046 ?auto_1049 ) ) ( not ( = ?auto_1046 ?auto_1058 ) ) ( not ( = ?auto_1047 ?auto_1049 ) ) ( not ( = ?auto_1047 ?auto_1058 ) ) ( not ( = ?auto_1049 ?auto_1063 ) ) ( not ( = ?auto_1049 ?auto_1062 ) ) ( not ( = ?auto_1059 ?auto_1061 ) ) ( not ( = ?auto_1059 ?auto_1053 ) ) ( not ( = ?auto_1057 ?auto_1060 ) ) ( not ( = ?auto_1057 ?auto_1052 ) ) ( not ( = ?auto_1058 ?auto_1063 ) ) ( not ( = ?auto_1058 ?auto_1062 ) ) ( not ( = ?auto_1046 ?auto_1050 ) ) ( not ( = ?auto_1046 ?auto_1056 ) ) ( not ( = ?auto_1047 ?auto_1050 ) ) ( not ( = ?auto_1047 ?auto_1056 ) ) ( not ( = ?auto_1048 ?auto_1050 ) ) ( not ( = ?auto_1048 ?auto_1056 ) ) ( not ( = ?auto_1050 ?auto_1058 ) ) ( not ( = ?auto_1050 ?auto_1063 ) ) ( not ( = ?auto_1050 ?auto_1062 ) ) ( not ( = ?auto_1056 ?auto_1058 ) ) ( not ( = ?auto_1056 ?auto_1063 ) ) ( not ( = ?auto_1056 ?auto_1062 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_1046 ?auto_1047 ?auto_1048 ?auto_1049 )
      ( MAKE-1CRATE ?auto_1049 ?auto_1050 )
      ( MAKE-4CRATE-VERIFY ?auto_1046 ?auto_1047 ?auto_1048 ?auto_1049 ?auto_1050 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1066 - SURFACE
      ?auto_1067 - SURFACE
    )
    :vars
    (
      ?auto_1068 - HOIST
      ?auto_1069 - PLACE
      ?auto_1071 - PLACE
      ?auto_1072 - HOIST
      ?auto_1073 - SURFACE
      ?auto_1070 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1068 ?auto_1069 ) ( SURFACE-AT ?auto_1066 ?auto_1069 ) ( CLEAR ?auto_1066 ) ( IS-CRATE ?auto_1067 ) ( AVAILABLE ?auto_1068 ) ( not ( = ?auto_1071 ?auto_1069 ) ) ( HOIST-AT ?auto_1072 ?auto_1071 ) ( AVAILABLE ?auto_1072 ) ( SURFACE-AT ?auto_1067 ?auto_1071 ) ( ON ?auto_1067 ?auto_1073 ) ( CLEAR ?auto_1067 ) ( TRUCK-AT ?auto_1070 ?auto_1069 ) ( not ( = ?auto_1066 ?auto_1067 ) ) ( not ( = ?auto_1066 ?auto_1073 ) ) ( not ( = ?auto_1067 ?auto_1073 ) ) ( not ( = ?auto_1068 ?auto_1072 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1070 ?auto_1069 ?auto_1071 )
      ( !LIFT ?auto_1072 ?auto_1067 ?auto_1073 ?auto_1071 )
      ( !LOAD ?auto_1072 ?auto_1067 ?auto_1070 ?auto_1071 )
      ( !DRIVE ?auto_1070 ?auto_1071 ?auto_1069 )
      ( !UNLOAD ?auto_1068 ?auto_1067 ?auto_1070 ?auto_1069 )
      ( !DROP ?auto_1068 ?auto_1067 ?auto_1066 ?auto_1069 )
      ( MAKE-1CRATE-VERIFY ?auto_1066 ?auto_1067 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1080 - SURFACE
      ?auto_1081 - SURFACE
      ?auto_1082 - SURFACE
      ?auto_1083 - SURFACE
      ?auto_1084 - SURFACE
      ?auto_1085 - SURFACE
    )
    :vars
    (
      ?auto_1090 - HOIST
      ?auto_1088 - PLACE
      ?auto_1089 - PLACE
      ?auto_1087 - HOIST
      ?auto_1086 - SURFACE
      ?auto_1093 - PLACE
      ?auto_1097 - HOIST
      ?auto_1096 - SURFACE
      ?auto_1094 - PLACE
      ?auto_1095 - HOIST
      ?auto_1098 - SURFACE
      ?auto_1099 - PLACE
      ?auto_1092 - HOIST
      ?auto_1101 - SURFACE
      ?auto_1100 - SURFACE
      ?auto_1091 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1090 ?auto_1088 ) ( IS-CRATE ?auto_1085 ) ( not ( = ?auto_1089 ?auto_1088 ) ) ( HOIST-AT ?auto_1087 ?auto_1089 ) ( AVAILABLE ?auto_1087 ) ( SURFACE-AT ?auto_1085 ?auto_1089 ) ( ON ?auto_1085 ?auto_1086 ) ( CLEAR ?auto_1085 ) ( not ( = ?auto_1084 ?auto_1085 ) ) ( not ( = ?auto_1084 ?auto_1086 ) ) ( not ( = ?auto_1085 ?auto_1086 ) ) ( not ( = ?auto_1090 ?auto_1087 ) ) ( IS-CRATE ?auto_1084 ) ( not ( = ?auto_1093 ?auto_1088 ) ) ( HOIST-AT ?auto_1097 ?auto_1093 ) ( SURFACE-AT ?auto_1084 ?auto_1093 ) ( ON ?auto_1084 ?auto_1096 ) ( CLEAR ?auto_1084 ) ( not ( = ?auto_1083 ?auto_1084 ) ) ( not ( = ?auto_1083 ?auto_1096 ) ) ( not ( = ?auto_1084 ?auto_1096 ) ) ( not ( = ?auto_1090 ?auto_1097 ) ) ( IS-CRATE ?auto_1083 ) ( not ( = ?auto_1094 ?auto_1088 ) ) ( HOIST-AT ?auto_1095 ?auto_1094 ) ( AVAILABLE ?auto_1095 ) ( SURFACE-AT ?auto_1083 ?auto_1094 ) ( ON ?auto_1083 ?auto_1098 ) ( CLEAR ?auto_1083 ) ( not ( = ?auto_1082 ?auto_1083 ) ) ( not ( = ?auto_1082 ?auto_1098 ) ) ( not ( = ?auto_1083 ?auto_1098 ) ) ( not ( = ?auto_1090 ?auto_1095 ) ) ( IS-CRATE ?auto_1082 ) ( not ( = ?auto_1099 ?auto_1088 ) ) ( HOIST-AT ?auto_1092 ?auto_1099 ) ( AVAILABLE ?auto_1092 ) ( SURFACE-AT ?auto_1082 ?auto_1099 ) ( ON ?auto_1082 ?auto_1101 ) ( CLEAR ?auto_1082 ) ( not ( = ?auto_1081 ?auto_1082 ) ) ( not ( = ?auto_1081 ?auto_1101 ) ) ( not ( = ?auto_1082 ?auto_1101 ) ) ( not ( = ?auto_1090 ?auto_1092 ) ) ( SURFACE-AT ?auto_1080 ?auto_1088 ) ( CLEAR ?auto_1080 ) ( IS-CRATE ?auto_1081 ) ( AVAILABLE ?auto_1090 ) ( AVAILABLE ?auto_1097 ) ( SURFACE-AT ?auto_1081 ?auto_1093 ) ( ON ?auto_1081 ?auto_1100 ) ( CLEAR ?auto_1081 ) ( TRUCK-AT ?auto_1091 ?auto_1088 ) ( not ( = ?auto_1080 ?auto_1081 ) ) ( not ( = ?auto_1080 ?auto_1100 ) ) ( not ( = ?auto_1081 ?auto_1100 ) ) ( not ( = ?auto_1080 ?auto_1082 ) ) ( not ( = ?auto_1080 ?auto_1101 ) ) ( not ( = ?auto_1082 ?auto_1100 ) ) ( not ( = ?auto_1099 ?auto_1093 ) ) ( not ( = ?auto_1092 ?auto_1097 ) ) ( not ( = ?auto_1101 ?auto_1100 ) ) ( not ( = ?auto_1080 ?auto_1083 ) ) ( not ( = ?auto_1080 ?auto_1098 ) ) ( not ( = ?auto_1081 ?auto_1083 ) ) ( not ( = ?auto_1081 ?auto_1098 ) ) ( not ( = ?auto_1083 ?auto_1101 ) ) ( not ( = ?auto_1083 ?auto_1100 ) ) ( not ( = ?auto_1094 ?auto_1099 ) ) ( not ( = ?auto_1094 ?auto_1093 ) ) ( not ( = ?auto_1095 ?auto_1092 ) ) ( not ( = ?auto_1095 ?auto_1097 ) ) ( not ( = ?auto_1098 ?auto_1101 ) ) ( not ( = ?auto_1098 ?auto_1100 ) ) ( not ( = ?auto_1080 ?auto_1084 ) ) ( not ( = ?auto_1080 ?auto_1096 ) ) ( not ( = ?auto_1081 ?auto_1084 ) ) ( not ( = ?auto_1081 ?auto_1096 ) ) ( not ( = ?auto_1082 ?auto_1084 ) ) ( not ( = ?auto_1082 ?auto_1096 ) ) ( not ( = ?auto_1084 ?auto_1098 ) ) ( not ( = ?auto_1084 ?auto_1101 ) ) ( not ( = ?auto_1084 ?auto_1100 ) ) ( not ( = ?auto_1096 ?auto_1098 ) ) ( not ( = ?auto_1096 ?auto_1101 ) ) ( not ( = ?auto_1096 ?auto_1100 ) ) ( not ( = ?auto_1080 ?auto_1085 ) ) ( not ( = ?auto_1080 ?auto_1086 ) ) ( not ( = ?auto_1081 ?auto_1085 ) ) ( not ( = ?auto_1081 ?auto_1086 ) ) ( not ( = ?auto_1082 ?auto_1085 ) ) ( not ( = ?auto_1082 ?auto_1086 ) ) ( not ( = ?auto_1083 ?auto_1085 ) ) ( not ( = ?auto_1083 ?auto_1086 ) ) ( not ( = ?auto_1085 ?auto_1096 ) ) ( not ( = ?auto_1085 ?auto_1098 ) ) ( not ( = ?auto_1085 ?auto_1101 ) ) ( not ( = ?auto_1085 ?auto_1100 ) ) ( not ( = ?auto_1089 ?auto_1093 ) ) ( not ( = ?auto_1089 ?auto_1094 ) ) ( not ( = ?auto_1089 ?auto_1099 ) ) ( not ( = ?auto_1087 ?auto_1097 ) ) ( not ( = ?auto_1087 ?auto_1095 ) ) ( not ( = ?auto_1087 ?auto_1092 ) ) ( not ( = ?auto_1086 ?auto_1096 ) ) ( not ( = ?auto_1086 ?auto_1098 ) ) ( not ( = ?auto_1086 ?auto_1101 ) ) ( not ( = ?auto_1086 ?auto_1100 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_1080 ?auto_1081 ?auto_1082 ?auto_1083 ?auto_1084 )
      ( MAKE-1CRATE ?auto_1084 ?auto_1085 )
      ( MAKE-5CRATE-VERIFY ?auto_1080 ?auto_1081 ?auto_1082 ?auto_1083 ?auto_1084 ?auto_1085 ) )
  )

)

