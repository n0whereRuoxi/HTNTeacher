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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_917 - SURFACE
      ?auto_918 - SURFACE
    )
    :vars
    (
      ?auto_919 - HOIST
      ?auto_920 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_919 ?auto_920 ) ( SURFACE-AT ?auto_917 ?auto_920 ) ( CLEAR ?auto_917 ) ( LIFTING ?auto_919 ?auto_918 ) ( IS-CRATE ?auto_918 ) ( not ( = ?auto_917 ?auto_918 ) ) )
    :subtasks
    ( ( !DROP ?auto_919 ?auto_918 ?auto_917 ?auto_920 )
      ( MAKE-1CRATE-VERIFY ?auto_917 ?auto_918 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_921 - SURFACE
      ?auto_922 - SURFACE
    )
    :vars
    (
      ?auto_924 - HOIST
      ?auto_923 - PLACE
      ?auto_925 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_924 ?auto_923 ) ( SURFACE-AT ?auto_921 ?auto_923 ) ( CLEAR ?auto_921 ) ( IS-CRATE ?auto_922 ) ( not ( = ?auto_921 ?auto_922 ) ) ( TRUCK-AT ?auto_925 ?auto_923 ) ( AVAILABLE ?auto_924 ) ( IN ?auto_922 ?auto_925 ) )
    :subtasks
    ( ( !UNLOAD ?auto_924 ?auto_922 ?auto_925 ?auto_923 )
      ( MAKE-1CRATE ?auto_921 ?auto_922 )
      ( MAKE-1CRATE-VERIFY ?auto_921 ?auto_922 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_926 - SURFACE
      ?auto_927 - SURFACE
    )
    :vars
    (
      ?auto_930 - HOIST
      ?auto_928 - PLACE
      ?auto_929 - TRUCK
      ?auto_931 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_930 ?auto_928 ) ( SURFACE-AT ?auto_926 ?auto_928 ) ( CLEAR ?auto_926 ) ( IS-CRATE ?auto_927 ) ( not ( = ?auto_926 ?auto_927 ) ) ( AVAILABLE ?auto_930 ) ( IN ?auto_927 ?auto_929 ) ( TRUCK-AT ?auto_929 ?auto_931 ) ( not ( = ?auto_931 ?auto_928 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_929 ?auto_931 ?auto_928 )
      ( MAKE-1CRATE ?auto_926 ?auto_927 )
      ( MAKE-1CRATE-VERIFY ?auto_926 ?auto_927 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_932 - SURFACE
      ?auto_933 - SURFACE
    )
    :vars
    (
      ?auto_936 - HOIST
      ?auto_937 - PLACE
      ?auto_935 - TRUCK
      ?auto_934 - PLACE
      ?auto_938 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_936 ?auto_937 ) ( SURFACE-AT ?auto_932 ?auto_937 ) ( CLEAR ?auto_932 ) ( IS-CRATE ?auto_933 ) ( not ( = ?auto_932 ?auto_933 ) ) ( AVAILABLE ?auto_936 ) ( TRUCK-AT ?auto_935 ?auto_934 ) ( not ( = ?auto_934 ?auto_937 ) ) ( HOIST-AT ?auto_938 ?auto_934 ) ( LIFTING ?auto_938 ?auto_933 ) ( not ( = ?auto_936 ?auto_938 ) ) )
    :subtasks
    ( ( !LOAD ?auto_938 ?auto_933 ?auto_935 ?auto_934 )
      ( MAKE-1CRATE ?auto_932 ?auto_933 )
      ( MAKE-1CRATE-VERIFY ?auto_932 ?auto_933 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_939 - SURFACE
      ?auto_940 - SURFACE
    )
    :vars
    (
      ?auto_945 - HOIST
      ?auto_942 - PLACE
      ?auto_944 - TRUCK
      ?auto_943 - PLACE
      ?auto_941 - HOIST
      ?auto_946 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_945 ?auto_942 ) ( SURFACE-AT ?auto_939 ?auto_942 ) ( CLEAR ?auto_939 ) ( IS-CRATE ?auto_940 ) ( not ( = ?auto_939 ?auto_940 ) ) ( AVAILABLE ?auto_945 ) ( TRUCK-AT ?auto_944 ?auto_943 ) ( not ( = ?auto_943 ?auto_942 ) ) ( HOIST-AT ?auto_941 ?auto_943 ) ( not ( = ?auto_945 ?auto_941 ) ) ( AVAILABLE ?auto_941 ) ( SURFACE-AT ?auto_940 ?auto_943 ) ( ON ?auto_940 ?auto_946 ) ( CLEAR ?auto_940 ) ( not ( = ?auto_939 ?auto_946 ) ) ( not ( = ?auto_940 ?auto_946 ) ) )
    :subtasks
    ( ( !LIFT ?auto_941 ?auto_940 ?auto_946 ?auto_943 )
      ( MAKE-1CRATE ?auto_939 ?auto_940 )
      ( MAKE-1CRATE-VERIFY ?auto_939 ?auto_940 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_947 - SURFACE
      ?auto_948 - SURFACE
    )
    :vars
    (
      ?auto_950 - HOIST
      ?auto_951 - PLACE
      ?auto_953 - PLACE
      ?auto_952 - HOIST
      ?auto_954 - SURFACE
      ?auto_949 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_950 ?auto_951 ) ( SURFACE-AT ?auto_947 ?auto_951 ) ( CLEAR ?auto_947 ) ( IS-CRATE ?auto_948 ) ( not ( = ?auto_947 ?auto_948 ) ) ( AVAILABLE ?auto_950 ) ( not ( = ?auto_953 ?auto_951 ) ) ( HOIST-AT ?auto_952 ?auto_953 ) ( not ( = ?auto_950 ?auto_952 ) ) ( AVAILABLE ?auto_952 ) ( SURFACE-AT ?auto_948 ?auto_953 ) ( ON ?auto_948 ?auto_954 ) ( CLEAR ?auto_948 ) ( not ( = ?auto_947 ?auto_954 ) ) ( not ( = ?auto_948 ?auto_954 ) ) ( TRUCK-AT ?auto_949 ?auto_951 ) )
    :subtasks
    ( ( !DRIVE ?auto_949 ?auto_951 ?auto_953 )
      ( MAKE-1CRATE ?auto_947 ?auto_948 )
      ( MAKE-1CRATE-VERIFY ?auto_947 ?auto_948 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_964 - SURFACE
      ?auto_965 - SURFACE
      ?auto_966 - SURFACE
    )
    :vars
    (
      ?auto_967 - HOIST
      ?auto_968 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_967 ?auto_968 ) ( SURFACE-AT ?auto_965 ?auto_968 ) ( CLEAR ?auto_965 ) ( LIFTING ?auto_967 ?auto_966 ) ( IS-CRATE ?auto_966 ) ( not ( = ?auto_965 ?auto_966 ) ) ( ON ?auto_965 ?auto_964 ) ( not ( = ?auto_964 ?auto_965 ) ) ( not ( = ?auto_964 ?auto_966 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_965 ?auto_966 )
      ( MAKE-2CRATE-VERIFY ?auto_964 ?auto_965 ?auto_966 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_974 - SURFACE
      ?auto_975 - SURFACE
      ?auto_976 - SURFACE
    )
    :vars
    (
      ?auto_977 - HOIST
      ?auto_978 - PLACE
      ?auto_979 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_977 ?auto_978 ) ( SURFACE-AT ?auto_975 ?auto_978 ) ( CLEAR ?auto_975 ) ( IS-CRATE ?auto_976 ) ( not ( = ?auto_975 ?auto_976 ) ) ( TRUCK-AT ?auto_979 ?auto_978 ) ( AVAILABLE ?auto_977 ) ( IN ?auto_976 ?auto_979 ) ( ON ?auto_975 ?auto_974 ) ( not ( = ?auto_974 ?auto_975 ) ) ( not ( = ?auto_974 ?auto_976 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_975 ?auto_976 )
      ( MAKE-2CRATE-VERIFY ?auto_974 ?auto_975 ?auto_976 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_980 - SURFACE
      ?auto_981 - SURFACE
    )
    :vars
    (
      ?auto_985 - HOIST
      ?auto_984 - PLACE
      ?auto_983 - TRUCK
      ?auto_982 - SURFACE
      ?auto_986 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_985 ?auto_984 ) ( SURFACE-AT ?auto_980 ?auto_984 ) ( CLEAR ?auto_980 ) ( IS-CRATE ?auto_981 ) ( not ( = ?auto_980 ?auto_981 ) ) ( AVAILABLE ?auto_985 ) ( IN ?auto_981 ?auto_983 ) ( ON ?auto_980 ?auto_982 ) ( not ( = ?auto_982 ?auto_980 ) ) ( not ( = ?auto_982 ?auto_981 ) ) ( TRUCK-AT ?auto_983 ?auto_986 ) ( not ( = ?auto_986 ?auto_984 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_983 ?auto_986 ?auto_984 )
      ( MAKE-2CRATE ?auto_982 ?auto_980 ?auto_981 )
      ( MAKE-1CRATE-VERIFY ?auto_980 ?auto_981 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_987 - SURFACE
      ?auto_988 - SURFACE
      ?auto_989 - SURFACE
    )
    :vars
    (
      ?auto_991 - HOIST
      ?auto_990 - PLACE
      ?auto_993 - TRUCK
      ?auto_992 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_991 ?auto_990 ) ( SURFACE-AT ?auto_988 ?auto_990 ) ( CLEAR ?auto_988 ) ( IS-CRATE ?auto_989 ) ( not ( = ?auto_988 ?auto_989 ) ) ( AVAILABLE ?auto_991 ) ( IN ?auto_989 ?auto_993 ) ( ON ?auto_988 ?auto_987 ) ( not ( = ?auto_987 ?auto_988 ) ) ( not ( = ?auto_987 ?auto_989 ) ) ( TRUCK-AT ?auto_993 ?auto_992 ) ( not ( = ?auto_992 ?auto_990 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_988 ?auto_989 )
      ( MAKE-2CRATE-VERIFY ?auto_987 ?auto_988 ?auto_989 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_994 - SURFACE
      ?auto_995 - SURFACE
    )
    :vars
    (
      ?auto_1000 - HOIST
      ?auto_998 - PLACE
      ?auto_997 - SURFACE
      ?auto_999 - TRUCK
      ?auto_996 - PLACE
      ?auto_1001 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1000 ?auto_998 ) ( SURFACE-AT ?auto_994 ?auto_998 ) ( CLEAR ?auto_994 ) ( IS-CRATE ?auto_995 ) ( not ( = ?auto_994 ?auto_995 ) ) ( AVAILABLE ?auto_1000 ) ( ON ?auto_994 ?auto_997 ) ( not ( = ?auto_997 ?auto_994 ) ) ( not ( = ?auto_997 ?auto_995 ) ) ( TRUCK-AT ?auto_999 ?auto_996 ) ( not ( = ?auto_996 ?auto_998 ) ) ( HOIST-AT ?auto_1001 ?auto_996 ) ( LIFTING ?auto_1001 ?auto_995 ) ( not ( = ?auto_1000 ?auto_1001 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1001 ?auto_995 ?auto_999 ?auto_996 )
      ( MAKE-2CRATE ?auto_997 ?auto_994 ?auto_995 )
      ( MAKE-1CRATE-VERIFY ?auto_994 ?auto_995 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1002 - SURFACE
      ?auto_1003 - SURFACE
      ?auto_1004 - SURFACE
    )
    :vars
    (
      ?auto_1007 - HOIST
      ?auto_1009 - PLACE
      ?auto_1005 - TRUCK
      ?auto_1008 - PLACE
      ?auto_1006 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1007 ?auto_1009 ) ( SURFACE-AT ?auto_1003 ?auto_1009 ) ( CLEAR ?auto_1003 ) ( IS-CRATE ?auto_1004 ) ( not ( = ?auto_1003 ?auto_1004 ) ) ( AVAILABLE ?auto_1007 ) ( ON ?auto_1003 ?auto_1002 ) ( not ( = ?auto_1002 ?auto_1003 ) ) ( not ( = ?auto_1002 ?auto_1004 ) ) ( TRUCK-AT ?auto_1005 ?auto_1008 ) ( not ( = ?auto_1008 ?auto_1009 ) ) ( HOIST-AT ?auto_1006 ?auto_1008 ) ( LIFTING ?auto_1006 ?auto_1004 ) ( not ( = ?auto_1007 ?auto_1006 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1003 ?auto_1004 )
      ( MAKE-2CRATE-VERIFY ?auto_1002 ?auto_1003 ?auto_1004 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1010 - SURFACE
      ?auto_1011 - SURFACE
    )
    :vars
    (
      ?auto_1014 - HOIST
      ?auto_1015 - PLACE
      ?auto_1017 - SURFACE
      ?auto_1016 - TRUCK
      ?auto_1013 - PLACE
      ?auto_1012 - HOIST
      ?auto_1018 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1014 ?auto_1015 ) ( SURFACE-AT ?auto_1010 ?auto_1015 ) ( CLEAR ?auto_1010 ) ( IS-CRATE ?auto_1011 ) ( not ( = ?auto_1010 ?auto_1011 ) ) ( AVAILABLE ?auto_1014 ) ( ON ?auto_1010 ?auto_1017 ) ( not ( = ?auto_1017 ?auto_1010 ) ) ( not ( = ?auto_1017 ?auto_1011 ) ) ( TRUCK-AT ?auto_1016 ?auto_1013 ) ( not ( = ?auto_1013 ?auto_1015 ) ) ( HOIST-AT ?auto_1012 ?auto_1013 ) ( not ( = ?auto_1014 ?auto_1012 ) ) ( AVAILABLE ?auto_1012 ) ( SURFACE-AT ?auto_1011 ?auto_1013 ) ( ON ?auto_1011 ?auto_1018 ) ( CLEAR ?auto_1011 ) ( not ( = ?auto_1010 ?auto_1018 ) ) ( not ( = ?auto_1011 ?auto_1018 ) ) ( not ( = ?auto_1017 ?auto_1018 ) ) )
    :subtasks
    ( ( !LIFT ?auto_1012 ?auto_1011 ?auto_1018 ?auto_1013 )
      ( MAKE-2CRATE ?auto_1017 ?auto_1010 ?auto_1011 )
      ( MAKE-1CRATE-VERIFY ?auto_1010 ?auto_1011 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1019 - SURFACE
      ?auto_1020 - SURFACE
      ?auto_1021 - SURFACE
    )
    :vars
    (
      ?auto_1026 - HOIST
      ?auto_1022 - PLACE
      ?auto_1027 - TRUCK
      ?auto_1023 - PLACE
      ?auto_1025 - HOIST
      ?auto_1024 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1026 ?auto_1022 ) ( SURFACE-AT ?auto_1020 ?auto_1022 ) ( CLEAR ?auto_1020 ) ( IS-CRATE ?auto_1021 ) ( not ( = ?auto_1020 ?auto_1021 ) ) ( AVAILABLE ?auto_1026 ) ( ON ?auto_1020 ?auto_1019 ) ( not ( = ?auto_1019 ?auto_1020 ) ) ( not ( = ?auto_1019 ?auto_1021 ) ) ( TRUCK-AT ?auto_1027 ?auto_1023 ) ( not ( = ?auto_1023 ?auto_1022 ) ) ( HOIST-AT ?auto_1025 ?auto_1023 ) ( not ( = ?auto_1026 ?auto_1025 ) ) ( AVAILABLE ?auto_1025 ) ( SURFACE-AT ?auto_1021 ?auto_1023 ) ( ON ?auto_1021 ?auto_1024 ) ( CLEAR ?auto_1021 ) ( not ( = ?auto_1020 ?auto_1024 ) ) ( not ( = ?auto_1021 ?auto_1024 ) ) ( not ( = ?auto_1019 ?auto_1024 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1020 ?auto_1021 )
      ( MAKE-2CRATE-VERIFY ?auto_1019 ?auto_1020 ?auto_1021 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1028 - SURFACE
      ?auto_1029 - SURFACE
    )
    :vars
    (
      ?auto_1034 - HOIST
      ?auto_1035 - PLACE
      ?auto_1032 - SURFACE
      ?auto_1031 - PLACE
      ?auto_1030 - HOIST
      ?auto_1033 - SURFACE
      ?auto_1036 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1034 ?auto_1035 ) ( SURFACE-AT ?auto_1028 ?auto_1035 ) ( CLEAR ?auto_1028 ) ( IS-CRATE ?auto_1029 ) ( not ( = ?auto_1028 ?auto_1029 ) ) ( AVAILABLE ?auto_1034 ) ( ON ?auto_1028 ?auto_1032 ) ( not ( = ?auto_1032 ?auto_1028 ) ) ( not ( = ?auto_1032 ?auto_1029 ) ) ( not ( = ?auto_1031 ?auto_1035 ) ) ( HOIST-AT ?auto_1030 ?auto_1031 ) ( not ( = ?auto_1034 ?auto_1030 ) ) ( AVAILABLE ?auto_1030 ) ( SURFACE-AT ?auto_1029 ?auto_1031 ) ( ON ?auto_1029 ?auto_1033 ) ( CLEAR ?auto_1029 ) ( not ( = ?auto_1028 ?auto_1033 ) ) ( not ( = ?auto_1029 ?auto_1033 ) ) ( not ( = ?auto_1032 ?auto_1033 ) ) ( TRUCK-AT ?auto_1036 ?auto_1035 ) )
    :subtasks
    ( ( !DRIVE ?auto_1036 ?auto_1035 ?auto_1031 )
      ( MAKE-2CRATE ?auto_1032 ?auto_1028 ?auto_1029 )
      ( MAKE-1CRATE-VERIFY ?auto_1028 ?auto_1029 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1037 - SURFACE
      ?auto_1038 - SURFACE
      ?auto_1039 - SURFACE
    )
    :vars
    (
      ?auto_1045 - HOIST
      ?auto_1040 - PLACE
      ?auto_1044 - PLACE
      ?auto_1041 - HOIST
      ?auto_1042 - SURFACE
      ?auto_1043 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1045 ?auto_1040 ) ( SURFACE-AT ?auto_1038 ?auto_1040 ) ( CLEAR ?auto_1038 ) ( IS-CRATE ?auto_1039 ) ( not ( = ?auto_1038 ?auto_1039 ) ) ( AVAILABLE ?auto_1045 ) ( ON ?auto_1038 ?auto_1037 ) ( not ( = ?auto_1037 ?auto_1038 ) ) ( not ( = ?auto_1037 ?auto_1039 ) ) ( not ( = ?auto_1044 ?auto_1040 ) ) ( HOIST-AT ?auto_1041 ?auto_1044 ) ( not ( = ?auto_1045 ?auto_1041 ) ) ( AVAILABLE ?auto_1041 ) ( SURFACE-AT ?auto_1039 ?auto_1044 ) ( ON ?auto_1039 ?auto_1042 ) ( CLEAR ?auto_1039 ) ( not ( = ?auto_1038 ?auto_1042 ) ) ( not ( = ?auto_1039 ?auto_1042 ) ) ( not ( = ?auto_1037 ?auto_1042 ) ) ( TRUCK-AT ?auto_1043 ?auto_1040 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1038 ?auto_1039 )
      ( MAKE-2CRATE-VERIFY ?auto_1037 ?auto_1038 ?auto_1039 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1046 - SURFACE
      ?auto_1047 - SURFACE
    )
    :vars
    (
      ?auto_1048 - HOIST
      ?auto_1053 - PLACE
      ?auto_1050 - SURFACE
      ?auto_1049 - PLACE
      ?auto_1052 - HOIST
      ?auto_1054 - SURFACE
      ?auto_1051 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1048 ?auto_1053 ) ( IS-CRATE ?auto_1047 ) ( not ( = ?auto_1046 ?auto_1047 ) ) ( not ( = ?auto_1050 ?auto_1046 ) ) ( not ( = ?auto_1050 ?auto_1047 ) ) ( not ( = ?auto_1049 ?auto_1053 ) ) ( HOIST-AT ?auto_1052 ?auto_1049 ) ( not ( = ?auto_1048 ?auto_1052 ) ) ( AVAILABLE ?auto_1052 ) ( SURFACE-AT ?auto_1047 ?auto_1049 ) ( ON ?auto_1047 ?auto_1054 ) ( CLEAR ?auto_1047 ) ( not ( = ?auto_1046 ?auto_1054 ) ) ( not ( = ?auto_1047 ?auto_1054 ) ) ( not ( = ?auto_1050 ?auto_1054 ) ) ( TRUCK-AT ?auto_1051 ?auto_1053 ) ( SURFACE-AT ?auto_1050 ?auto_1053 ) ( CLEAR ?auto_1050 ) ( LIFTING ?auto_1048 ?auto_1046 ) ( IS-CRATE ?auto_1046 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1050 ?auto_1046 )
      ( MAKE-2CRATE ?auto_1050 ?auto_1046 ?auto_1047 )
      ( MAKE-1CRATE-VERIFY ?auto_1046 ?auto_1047 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1055 - SURFACE
      ?auto_1056 - SURFACE
      ?auto_1057 - SURFACE
    )
    :vars
    (
      ?auto_1061 - HOIST
      ?auto_1063 - PLACE
      ?auto_1062 - PLACE
      ?auto_1060 - HOIST
      ?auto_1059 - SURFACE
      ?auto_1058 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1061 ?auto_1063 ) ( IS-CRATE ?auto_1057 ) ( not ( = ?auto_1056 ?auto_1057 ) ) ( not ( = ?auto_1055 ?auto_1056 ) ) ( not ( = ?auto_1055 ?auto_1057 ) ) ( not ( = ?auto_1062 ?auto_1063 ) ) ( HOIST-AT ?auto_1060 ?auto_1062 ) ( not ( = ?auto_1061 ?auto_1060 ) ) ( AVAILABLE ?auto_1060 ) ( SURFACE-AT ?auto_1057 ?auto_1062 ) ( ON ?auto_1057 ?auto_1059 ) ( CLEAR ?auto_1057 ) ( not ( = ?auto_1056 ?auto_1059 ) ) ( not ( = ?auto_1057 ?auto_1059 ) ) ( not ( = ?auto_1055 ?auto_1059 ) ) ( TRUCK-AT ?auto_1058 ?auto_1063 ) ( SURFACE-AT ?auto_1055 ?auto_1063 ) ( CLEAR ?auto_1055 ) ( LIFTING ?auto_1061 ?auto_1056 ) ( IS-CRATE ?auto_1056 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1056 ?auto_1057 )
      ( MAKE-2CRATE-VERIFY ?auto_1055 ?auto_1056 ?auto_1057 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1064 - SURFACE
      ?auto_1065 - SURFACE
    )
    :vars
    (
      ?auto_1072 - HOIST
      ?auto_1069 - PLACE
      ?auto_1068 - SURFACE
      ?auto_1071 - PLACE
      ?auto_1066 - HOIST
      ?auto_1070 - SURFACE
      ?auto_1067 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1072 ?auto_1069 ) ( IS-CRATE ?auto_1065 ) ( not ( = ?auto_1064 ?auto_1065 ) ) ( not ( = ?auto_1068 ?auto_1064 ) ) ( not ( = ?auto_1068 ?auto_1065 ) ) ( not ( = ?auto_1071 ?auto_1069 ) ) ( HOIST-AT ?auto_1066 ?auto_1071 ) ( not ( = ?auto_1072 ?auto_1066 ) ) ( AVAILABLE ?auto_1066 ) ( SURFACE-AT ?auto_1065 ?auto_1071 ) ( ON ?auto_1065 ?auto_1070 ) ( CLEAR ?auto_1065 ) ( not ( = ?auto_1064 ?auto_1070 ) ) ( not ( = ?auto_1065 ?auto_1070 ) ) ( not ( = ?auto_1068 ?auto_1070 ) ) ( TRUCK-AT ?auto_1067 ?auto_1069 ) ( SURFACE-AT ?auto_1068 ?auto_1069 ) ( CLEAR ?auto_1068 ) ( IS-CRATE ?auto_1064 ) ( AVAILABLE ?auto_1072 ) ( IN ?auto_1064 ?auto_1067 ) )
    :subtasks
    ( ( !UNLOAD ?auto_1072 ?auto_1064 ?auto_1067 ?auto_1069 )
      ( MAKE-2CRATE ?auto_1068 ?auto_1064 ?auto_1065 )
      ( MAKE-1CRATE-VERIFY ?auto_1064 ?auto_1065 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1073 - SURFACE
      ?auto_1074 - SURFACE
      ?auto_1075 - SURFACE
    )
    :vars
    (
      ?auto_1076 - HOIST
      ?auto_1079 - PLACE
      ?auto_1081 - PLACE
      ?auto_1078 - HOIST
      ?auto_1077 - SURFACE
      ?auto_1080 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1076 ?auto_1079 ) ( IS-CRATE ?auto_1075 ) ( not ( = ?auto_1074 ?auto_1075 ) ) ( not ( = ?auto_1073 ?auto_1074 ) ) ( not ( = ?auto_1073 ?auto_1075 ) ) ( not ( = ?auto_1081 ?auto_1079 ) ) ( HOIST-AT ?auto_1078 ?auto_1081 ) ( not ( = ?auto_1076 ?auto_1078 ) ) ( AVAILABLE ?auto_1078 ) ( SURFACE-AT ?auto_1075 ?auto_1081 ) ( ON ?auto_1075 ?auto_1077 ) ( CLEAR ?auto_1075 ) ( not ( = ?auto_1074 ?auto_1077 ) ) ( not ( = ?auto_1075 ?auto_1077 ) ) ( not ( = ?auto_1073 ?auto_1077 ) ) ( TRUCK-AT ?auto_1080 ?auto_1079 ) ( SURFACE-AT ?auto_1073 ?auto_1079 ) ( CLEAR ?auto_1073 ) ( IS-CRATE ?auto_1074 ) ( AVAILABLE ?auto_1076 ) ( IN ?auto_1074 ?auto_1080 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1074 ?auto_1075 )
      ( MAKE-2CRATE-VERIFY ?auto_1073 ?auto_1074 ?auto_1075 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1082 - SURFACE
      ?auto_1083 - SURFACE
    )
    :vars
    (
      ?auto_1086 - HOIST
      ?auto_1087 - PLACE
      ?auto_1090 - SURFACE
      ?auto_1088 - PLACE
      ?auto_1084 - HOIST
      ?auto_1089 - SURFACE
      ?auto_1085 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1086 ?auto_1087 ) ( IS-CRATE ?auto_1083 ) ( not ( = ?auto_1082 ?auto_1083 ) ) ( not ( = ?auto_1090 ?auto_1082 ) ) ( not ( = ?auto_1090 ?auto_1083 ) ) ( not ( = ?auto_1088 ?auto_1087 ) ) ( HOIST-AT ?auto_1084 ?auto_1088 ) ( not ( = ?auto_1086 ?auto_1084 ) ) ( AVAILABLE ?auto_1084 ) ( SURFACE-AT ?auto_1083 ?auto_1088 ) ( ON ?auto_1083 ?auto_1089 ) ( CLEAR ?auto_1083 ) ( not ( = ?auto_1082 ?auto_1089 ) ) ( not ( = ?auto_1083 ?auto_1089 ) ) ( not ( = ?auto_1090 ?auto_1089 ) ) ( SURFACE-AT ?auto_1090 ?auto_1087 ) ( CLEAR ?auto_1090 ) ( IS-CRATE ?auto_1082 ) ( AVAILABLE ?auto_1086 ) ( IN ?auto_1082 ?auto_1085 ) ( TRUCK-AT ?auto_1085 ?auto_1088 ) )
    :subtasks
    ( ( !DRIVE ?auto_1085 ?auto_1088 ?auto_1087 )
      ( MAKE-2CRATE ?auto_1090 ?auto_1082 ?auto_1083 )
      ( MAKE-1CRATE-VERIFY ?auto_1082 ?auto_1083 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1091 - SURFACE
      ?auto_1092 - SURFACE
      ?auto_1093 - SURFACE
    )
    :vars
    (
      ?auto_1096 - HOIST
      ?auto_1099 - PLACE
      ?auto_1097 - PLACE
      ?auto_1094 - HOIST
      ?auto_1095 - SURFACE
      ?auto_1098 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1096 ?auto_1099 ) ( IS-CRATE ?auto_1093 ) ( not ( = ?auto_1092 ?auto_1093 ) ) ( not ( = ?auto_1091 ?auto_1092 ) ) ( not ( = ?auto_1091 ?auto_1093 ) ) ( not ( = ?auto_1097 ?auto_1099 ) ) ( HOIST-AT ?auto_1094 ?auto_1097 ) ( not ( = ?auto_1096 ?auto_1094 ) ) ( AVAILABLE ?auto_1094 ) ( SURFACE-AT ?auto_1093 ?auto_1097 ) ( ON ?auto_1093 ?auto_1095 ) ( CLEAR ?auto_1093 ) ( not ( = ?auto_1092 ?auto_1095 ) ) ( not ( = ?auto_1093 ?auto_1095 ) ) ( not ( = ?auto_1091 ?auto_1095 ) ) ( SURFACE-AT ?auto_1091 ?auto_1099 ) ( CLEAR ?auto_1091 ) ( IS-CRATE ?auto_1092 ) ( AVAILABLE ?auto_1096 ) ( IN ?auto_1092 ?auto_1098 ) ( TRUCK-AT ?auto_1098 ?auto_1097 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1092 ?auto_1093 )
      ( MAKE-2CRATE-VERIFY ?auto_1091 ?auto_1092 ?auto_1093 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1100 - SURFACE
      ?auto_1101 - SURFACE
    )
    :vars
    (
      ?auto_1106 - HOIST
      ?auto_1103 - PLACE
      ?auto_1107 - SURFACE
      ?auto_1108 - PLACE
      ?auto_1105 - HOIST
      ?auto_1104 - SURFACE
      ?auto_1102 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1106 ?auto_1103 ) ( IS-CRATE ?auto_1101 ) ( not ( = ?auto_1100 ?auto_1101 ) ) ( not ( = ?auto_1107 ?auto_1100 ) ) ( not ( = ?auto_1107 ?auto_1101 ) ) ( not ( = ?auto_1108 ?auto_1103 ) ) ( HOIST-AT ?auto_1105 ?auto_1108 ) ( not ( = ?auto_1106 ?auto_1105 ) ) ( SURFACE-AT ?auto_1101 ?auto_1108 ) ( ON ?auto_1101 ?auto_1104 ) ( CLEAR ?auto_1101 ) ( not ( = ?auto_1100 ?auto_1104 ) ) ( not ( = ?auto_1101 ?auto_1104 ) ) ( not ( = ?auto_1107 ?auto_1104 ) ) ( SURFACE-AT ?auto_1107 ?auto_1103 ) ( CLEAR ?auto_1107 ) ( IS-CRATE ?auto_1100 ) ( AVAILABLE ?auto_1106 ) ( TRUCK-AT ?auto_1102 ?auto_1108 ) ( LIFTING ?auto_1105 ?auto_1100 ) )
    :subtasks
    ( ( !LOAD ?auto_1105 ?auto_1100 ?auto_1102 ?auto_1108 )
      ( MAKE-2CRATE ?auto_1107 ?auto_1100 ?auto_1101 )
      ( MAKE-1CRATE-VERIFY ?auto_1100 ?auto_1101 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1109 - SURFACE
      ?auto_1110 - SURFACE
      ?auto_1111 - SURFACE
    )
    :vars
    (
      ?auto_1112 - HOIST
      ?auto_1114 - PLACE
      ?auto_1116 - PLACE
      ?auto_1115 - HOIST
      ?auto_1113 - SURFACE
      ?auto_1117 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1112 ?auto_1114 ) ( IS-CRATE ?auto_1111 ) ( not ( = ?auto_1110 ?auto_1111 ) ) ( not ( = ?auto_1109 ?auto_1110 ) ) ( not ( = ?auto_1109 ?auto_1111 ) ) ( not ( = ?auto_1116 ?auto_1114 ) ) ( HOIST-AT ?auto_1115 ?auto_1116 ) ( not ( = ?auto_1112 ?auto_1115 ) ) ( SURFACE-AT ?auto_1111 ?auto_1116 ) ( ON ?auto_1111 ?auto_1113 ) ( CLEAR ?auto_1111 ) ( not ( = ?auto_1110 ?auto_1113 ) ) ( not ( = ?auto_1111 ?auto_1113 ) ) ( not ( = ?auto_1109 ?auto_1113 ) ) ( SURFACE-AT ?auto_1109 ?auto_1114 ) ( CLEAR ?auto_1109 ) ( IS-CRATE ?auto_1110 ) ( AVAILABLE ?auto_1112 ) ( TRUCK-AT ?auto_1117 ?auto_1116 ) ( LIFTING ?auto_1115 ?auto_1110 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1110 ?auto_1111 )
      ( MAKE-2CRATE-VERIFY ?auto_1109 ?auto_1110 ?auto_1111 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1118 - SURFACE
      ?auto_1119 - SURFACE
    )
    :vars
    (
      ?auto_1122 - HOIST
      ?auto_1121 - PLACE
      ?auto_1124 - SURFACE
      ?auto_1125 - PLACE
      ?auto_1123 - HOIST
      ?auto_1126 - SURFACE
      ?auto_1120 - TRUCK
      ?auto_1127 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1122 ?auto_1121 ) ( IS-CRATE ?auto_1119 ) ( not ( = ?auto_1118 ?auto_1119 ) ) ( not ( = ?auto_1124 ?auto_1118 ) ) ( not ( = ?auto_1124 ?auto_1119 ) ) ( not ( = ?auto_1125 ?auto_1121 ) ) ( HOIST-AT ?auto_1123 ?auto_1125 ) ( not ( = ?auto_1122 ?auto_1123 ) ) ( SURFACE-AT ?auto_1119 ?auto_1125 ) ( ON ?auto_1119 ?auto_1126 ) ( CLEAR ?auto_1119 ) ( not ( = ?auto_1118 ?auto_1126 ) ) ( not ( = ?auto_1119 ?auto_1126 ) ) ( not ( = ?auto_1124 ?auto_1126 ) ) ( SURFACE-AT ?auto_1124 ?auto_1121 ) ( CLEAR ?auto_1124 ) ( IS-CRATE ?auto_1118 ) ( AVAILABLE ?auto_1122 ) ( TRUCK-AT ?auto_1120 ?auto_1125 ) ( AVAILABLE ?auto_1123 ) ( SURFACE-AT ?auto_1118 ?auto_1125 ) ( ON ?auto_1118 ?auto_1127 ) ( CLEAR ?auto_1118 ) ( not ( = ?auto_1118 ?auto_1127 ) ) ( not ( = ?auto_1119 ?auto_1127 ) ) ( not ( = ?auto_1124 ?auto_1127 ) ) ( not ( = ?auto_1126 ?auto_1127 ) ) )
    :subtasks
    ( ( !LIFT ?auto_1123 ?auto_1118 ?auto_1127 ?auto_1125 )
      ( MAKE-2CRATE ?auto_1124 ?auto_1118 ?auto_1119 )
      ( MAKE-1CRATE-VERIFY ?auto_1118 ?auto_1119 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1128 - SURFACE
      ?auto_1129 - SURFACE
      ?auto_1130 - SURFACE
    )
    :vars
    (
      ?auto_1133 - HOIST
      ?auto_1134 - PLACE
      ?auto_1132 - PLACE
      ?auto_1136 - HOIST
      ?auto_1137 - SURFACE
      ?auto_1135 - TRUCK
      ?auto_1131 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1133 ?auto_1134 ) ( IS-CRATE ?auto_1130 ) ( not ( = ?auto_1129 ?auto_1130 ) ) ( not ( = ?auto_1128 ?auto_1129 ) ) ( not ( = ?auto_1128 ?auto_1130 ) ) ( not ( = ?auto_1132 ?auto_1134 ) ) ( HOIST-AT ?auto_1136 ?auto_1132 ) ( not ( = ?auto_1133 ?auto_1136 ) ) ( SURFACE-AT ?auto_1130 ?auto_1132 ) ( ON ?auto_1130 ?auto_1137 ) ( CLEAR ?auto_1130 ) ( not ( = ?auto_1129 ?auto_1137 ) ) ( not ( = ?auto_1130 ?auto_1137 ) ) ( not ( = ?auto_1128 ?auto_1137 ) ) ( SURFACE-AT ?auto_1128 ?auto_1134 ) ( CLEAR ?auto_1128 ) ( IS-CRATE ?auto_1129 ) ( AVAILABLE ?auto_1133 ) ( TRUCK-AT ?auto_1135 ?auto_1132 ) ( AVAILABLE ?auto_1136 ) ( SURFACE-AT ?auto_1129 ?auto_1132 ) ( ON ?auto_1129 ?auto_1131 ) ( CLEAR ?auto_1129 ) ( not ( = ?auto_1129 ?auto_1131 ) ) ( not ( = ?auto_1130 ?auto_1131 ) ) ( not ( = ?auto_1128 ?auto_1131 ) ) ( not ( = ?auto_1137 ?auto_1131 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1129 ?auto_1130 )
      ( MAKE-2CRATE-VERIFY ?auto_1128 ?auto_1129 ?auto_1130 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1138 - SURFACE
      ?auto_1139 - SURFACE
    )
    :vars
    (
      ?auto_1141 - HOIST
      ?auto_1140 - PLACE
      ?auto_1145 - SURFACE
      ?auto_1144 - PLACE
      ?auto_1142 - HOIST
      ?auto_1146 - SURFACE
      ?auto_1143 - SURFACE
      ?auto_1147 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1141 ?auto_1140 ) ( IS-CRATE ?auto_1139 ) ( not ( = ?auto_1138 ?auto_1139 ) ) ( not ( = ?auto_1145 ?auto_1138 ) ) ( not ( = ?auto_1145 ?auto_1139 ) ) ( not ( = ?auto_1144 ?auto_1140 ) ) ( HOIST-AT ?auto_1142 ?auto_1144 ) ( not ( = ?auto_1141 ?auto_1142 ) ) ( SURFACE-AT ?auto_1139 ?auto_1144 ) ( ON ?auto_1139 ?auto_1146 ) ( CLEAR ?auto_1139 ) ( not ( = ?auto_1138 ?auto_1146 ) ) ( not ( = ?auto_1139 ?auto_1146 ) ) ( not ( = ?auto_1145 ?auto_1146 ) ) ( SURFACE-AT ?auto_1145 ?auto_1140 ) ( CLEAR ?auto_1145 ) ( IS-CRATE ?auto_1138 ) ( AVAILABLE ?auto_1141 ) ( AVAILABLE ?auto_1142 ) ( SURFACE-AT ?auto_1138 ?auto_1144 ) ( ON ?auto_1138 ?auto_1143 ) ( CLEAR ?auto_1138 ) ( not ( = ?auto_1138 ?auto_1143 ) ) ( not ( = ?auto_1139 ?auto_1143 ) ) ( not ( = ?auto_1145 ?auto_1143 ) ) ( not ( = ?auto_1146 ?auto_1143 ) ) ( TRUCK-AT ?auto_1147 ?auto_1140 ) )
    :subtasks
    ( ( !DRIVE ?auto_1147 ?auto_1140 ?auto_1144 )
      ( MAKE-2CRATE ?auto_1145 ?auto_1138 ?auto_1139 )
      ( MAKE-1CRATE-VERIFY ?auto_1138 ?auto_1139 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1148 - SURFACE
      ?auto_1149 - SURFACE
      ?auto_1150 - SURFACE
    )
    :vars
    (
      ?auto_1152 - HOIST
      ?auto_1155 - PLACE
      ?auto_1157 - PLACE
      ?auto_1151 - HOIST
      ?auto_1154 - SURFACE
      ?auto_1153 - SURFACE
      ?auto_1156 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1152 ?auto_1155 ) ( IS-CRATE ?auto_1150 ) ( not ( = ?auto_1149 ?auto_1150 ) ) ( not ( = ?auto_1148 ?auto_1149 ) ) ( not ( = ?auto_1148 ?auto_1150 ) ) ( not ( = ?auto_1157 ?auto_1155 ) ) ( HOIST-AT ?auto_1151 ?auto_1157 ) ( not ( = ?auto_1152 ?auto_1151 ) ) ( SURFACE-AT ?auto_1150 ?auto_1157 ) ( ON ?auto_1150 ?auto_1154 ) ( CLEAR ?auto_1150 ) ( not ( = ?auto_1149 ?auto_1154 ) ) ( not ( = ?auto_1150 ?auto_1154 ) ) ( not ( = ?auto_1148 ?auto_1154 ) ) ( SURFACE-AT ?auto_1148 ?auto_1155 ) ( CLEAR ?auto_1148 ) ( IS-CRATE ?auto_1149 ) ( AVAILABLE ?auto_1152 ) ( AVAILABLE ?auto_1151 ) ( SURFACE-AT ?auto_1149 ?auto_1157 ) ( ON ?auto_1149 ?auto_1153 ) ( CLEAR ?auto_1149 ) ( not ( = ?auto_1149 ?auto_1153 ) ) ( not ( = ?auto_1150 ?auto_1153 ) ) ( not ( = ?auto_1148 ?auto_1153 ) ) ( not ( = ?auto_1154 ?auto_1153 ) ) ( TRUCK-AT ?auto_1156 ?auto_1155 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1149 ?auto_1150 )
      ( MAKE-2CRATE-VERIFY ?auto_1148 ?auto_1149 ?auto_1150 ) )
  )

)

