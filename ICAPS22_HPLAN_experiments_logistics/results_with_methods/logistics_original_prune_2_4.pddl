( define ( domain logistics )
  ( :requirements :strips :typing :equality :htn )
  ( :types airplane city location obj truck )
  ( :predicates
    ( OBJ-AT ?a - OBJ ?b - LOCATION )
    ( TRUCK-AT ?c - TRUCK ?d - LOCATION )
    ( AIRPLANE-AT ?e - AIRPLANE ?f - LOCATION )
    ( IN-TRUCK ?g - OBJ ?h - TRUCK )
    ( IN-AIRPLANE ?i - OBJ ?j - AIRPLANE )
    ( IN-CITY ?k - LOCATION ?l - CITY )
    ( AIRPORT ?o - LOCATION )
    ( GREATER-THAN ?p - OBJ ?q - OBJ )
  )
  ( :action !LOAD-TRUCK
    :parameters
    (
      ?obj - OBJ
      ?truck - TRUCK
      ?loc - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?truck ?loc ) ( OBJ-AT ?obj ?loc ) )
    :effect
    ( and ( not ( OBJ-AT ?obj ?loc ) ) ( IN-TRUCK ?obj ?truck ) )
  )
  ( :action !LOAD-AIRPLANE
    :parameters
    (
      ?obj - OBJ
      ?airplane - AIRPLANE
      ?loc - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj ?loc ) ( AIRPLANE-AT ?airplane ?loc ) )
    :effect
    ( and ( not ( OBJ-AT ?obj ?loc ) ) ( IN-AIRPLANE ?obj ?airplane ) )
  )
  ( :action !UNLOAD-TRUCK
    :parameters
    (
      ?obj - OBJ
      ?truck - TRUCK
      ?loc - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?truck ?loc ) ( IN-TRUCK ?obj ?truck ) )
    :effect
    ( and ( not ( IN-TRUCK ?obj ?truck ) ) ( OBJ-AT ?obj ?loc ) )
  )
  ( :action !UNLOAD-AIRPLANE
    :parameters
    (
      ?obj - OBJ
      ?airplane - AIRPLANE
      ?loc - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?obj ?airplane ) ( AIRPLANE-AT ?airplane ?loc ) )
    :effect
    ( and ( not ( IN-AIRPLANE ?obj ?airplane ) ) ( OBJ-AT ?obj ?loc ) )
  )
  ( :action !DRIVE-TRUCK
    :parameters
    (
      ?truck - TRUCK
      ?loc-from - LOCATION
      ?loc-to - LOCATION
      ?city - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?truck ?loc-from ) ( IN-CITY ?loc-from ?city ) ( IN-CITY ?loc-to ?city ) ( not ( = ?loc-from ?loc-to ) ) )
    :effect
    ( and ( not ( TRUCK-AT ?truck ?loc-from ) ) ( TRUCK-AT ?truck ?loc-to ) )
  )
  ( :action !FLY-AIRPLANE
    :parameters
    (
      ?airplane - AIRPLANE
      ?loc-from - LOCATION
      ?loc-to - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?loc-from ) ( AIRPORT ?loc-to ) ( AIRPLANE-AT ?airplane ?loc-from ) ( not ( = ?loc-from ?loc-to ) ) )
    :effect
    ( and ( not ( AIRPLANE-AT ?airplane ?loc-from ) ) ( AIRPLANE-AT ?airplane ?loc-to ) )
  )
  ( :method DELIVER-PKG
    :parameters
    (
      ?obj - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-1PKG-VERIFY
    :parameters
    (
      ?obj1 - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj1 ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-2PKG-VERIFY
    :parameters
    (
      ?obj1 - OBJ
      ?obj2 - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj1 ?dst ) ( OBJ-AT ?obj2 ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_946 - OBJ
      ?auto_945 - LOCATION
    )
    :vars
    (
      ?auto_947 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_947 ?auto_945 ) ( IN-TRUCK ?auto_946 ?auto_947 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_946 ?auto_947 ?auto_945 )
      ( DELIVER-1PKG-VERIFY ?auto_946 ?auto_945 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_953 - OBJ
      ?auto_952 - LOCATION
    )
    :vars
    (
      ?auto_954 - TRUCK
      ?auto_955 - LOCATION
      ?auto_956 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_953 ?auto_954 ) ( TRUCK-AT ?auto_954 ?auto_955 ) ( IN-CITY ?auto_955 ?auto_956 ) ( IN-CITY ?auto_952 ?auto_956 ) ( not ( = ?auto_952 ?auto_955 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_954 ?auto_955 ?auto_952 ?auto_956 )
      ( DELIVER-1PKG ?auto_953 ?auto_952 )
      ( DELIVER-1PKG-VERIFY ?auto_953 ?auto_952 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_964 - OBJ
      ?auto_963 - LOCATION
    )
    :vars
    (
      ?auto_965 - TRUCK
      ?auto_967 - LOCATION
      ?auto_966 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_965 ?auto_967 ) ( IN-CITY ?auto_967 ?auto_966 ) ( IN-CITY ?auto_963 ?auto_966 ) ( not ( = ?auto_963 ?auto_967 ) ) ( OBJ-AT ?auto_964 ?auto_967 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_964 ?auto_965 ?auto_967 )
      ( DELIVER-1PKG ?auto_964 ?auto_963 )
      ( DELIVER-1PKG-VERIFY ?auto_964 ?auto_963 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_975 - OBJ
      ?auto_974 - LOCATION
    )
    :vars
    (
      ?auto_976 - LOCATION
      ?auto_977 - CITY
      ?auto_978 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_976 ?auto_977 ) ( IN-CITY ?auto_974 ?auto_977 ) ( not ( = ?auto_974 ?auto_976 ) ) ( OBJ-AT ?auto_975 ?auto_976 ) ( TRUCK-AT ?auto_978 ?auto_974 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_978 ?auto_974 ?auto_976 ?auto_977 )
      ( DELIVER-1PKG ?auto_975 ?auto_974 )
      ( DELIVER-1PKG-VERIFY ?auto_975 ?auto_974 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1000 - OBJ
      ?auto_1001 - OBJ
      ?auto_999 - LOCATION
    )
    :vars
    (
      ?auto_1002 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_1002 ?auto_999 ) ( IN-TRUCK ?auto_1001 ?auto_1002 ) ( OBJ-AT ?auto_1000 ?auto_999 ) ( not ( = ?auto_1000 ?auto_1001 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1001 ?auto_999 )
      ( DELIVER-2PKG-VERIFY ?auto_1000 ?auto_1001 ?auto_999 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1004 - OBJ
      ?auto_1005 - OBJ
      ?auto_1003 - LOCATION
    )
    :vars
    (
      ?auto_1006 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_1006 ?auto_1003 ) ( IN-TRUCK ?auto_1004 ?auto_1006 ) ( OBJ-AT ?auto_1005 ?auto_1003 ) ( not ( = ?auto_1004 ?auto_1005 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1004 ?auto_1003 )
      ( DELIVER-2PKG-VERIFY ?auto_1004 ?auto_1005 ?auto_1003 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1017 - OBJ
      ?auto_1018 - OBJ
      ?auto_1016 - LOCATION
    )
    :vars
    (
      ?auto_1019 - TRUCK
      ?auto_1020 - LOCATION
      ?auto_1021 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_1018 ?auto_1019 ) ( TRUCK-AT ?auto_1019 ?auto_1020 ) ( IN-CITY ?auto_1020 ?auto_1021 ) ( IN-CITY ?auto_1016 ?auto_1021 ) ( not ( = ?auto_1016 ?auto_1020 ) ) ( OBJ-AT ?auto_1017 ?auto_1016 ) ( not ( = ?auto_1017 ?auto_1018 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1018 ?auto_1016 )
      ( DELIVER-2PKG-VERIFY ?auto_1017 ?auto_1018 ?auto_1016 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1023 - OBJ
      ?auto_1024 - OBJ
      ?auto_1022 - LOCATION
    )
    :vars
    (
      ?auto_1027 - TRUCK
      ?auto_1026 - LOCATION
      ?auto_1025 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_1023 ?auto_1027 ) ( TRUCK-AT ?auto_1027 ?auto_1026 ) ( IN-CITY ?auto_1026 ?auto_1025 ) ( IN-CITY ?auto_1022 ?auto_1025 ) ( not ( = ?auto_1022 ?auto_1026 ) ) ( OBJ-AT ?auto_1024 ?auto_1022 ) ( not ( = ?auto_1024 ?auto_1023 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1024 ?auto_1023 ?auto_1022 )
      ( DELIVER-2PKG-VERIFY ?auto_1023 ?auto_1024 ?auto_1022 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1036 - OBJ
      ?auto_1035 - LOCATION
    )
    :vars
    (
      ?auto_1039 - TRUCK
      ?auto_1038 - LOCATION
      ?auto_1037 - CITY
      ?auto_1040 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_1039 ?auto_1038 ) ( IN-CITY ?auto_1038 ?auto_1037 ) ( IN-CITY ?auto_1035 ?auto_1037 ) ( not ( = ?auto_1035 ?auto_1038 ) ) ( OBJ-AT ?auto_1040 ?auto_1035 ) ( not ( = ?auto_1040 ?auto_1036 ) ) ( OBJ-AT ?auto_1036 ?auto_1038 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_1036 ?auto_1039 ?auto_1038 )
      ( DELIVER-2PKG ?auto_1040 ?auto_1036 ?auto_1035 )
      ( DELIVER-1PKG-VERIFY ?auto_1036 ?auto_1035 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1042 - OBJ
      ?auto_1043 - OBJ
      ?auto_1041 - LOCATION
    )
    :vars
    (
      ?auto_1045 - TRUCK
      ?auto_1046 - LOCATION
      ?auto_1044 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_1045 ?auto_1046 ) ( IN-CITY ?auto_1046 ?auto_1044 ) ( IN-CITY ?auto_1041 ?auto_1044 ) ( not ( = ?auto_1041 ?auto_1046 ) ) ( OBJ-AT ?auto_1042 ?auto_1041 ) ( not ( = ?auto_1042 ?auto_1043 ) ) ( OBJ-AT ?auto_1043 ?auto_1046 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1043 ?auto_1041 )
      ( DELIVER-2PKG-VERIFY ?auto_1042 ?auto_1043 ?auto_1041 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1048 - OBJ
      ?auto_1049 - OBJ
      ?auto_1047 - LOCATION
    )
    :vars
    (
      ?auto_1050 - TRUCK
      ?auto_1052 - LOCATION
      ?auto_1051 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_1050 ?auto_1052 ) ( IN-CITY ?auto_1052 ?auto_1051 ) ( IN-CITY ?auto_1047 ?auto_1051 ) ( not ( = ?auto_1047 ?auto_1052 ) ) ( OBJ-AT ?auto_1049 ?auto_1047 ) ( not ( = ?auto_1049 ?auto_1048 ) ) ( OBJ-AT ?auto_1048 ?auto_1052 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1049 ?auto_1048 ?auto_1047 )
      ( DELIVER-2PKG-VERIFY ?auto_1048 ?auto_1049 ?auto_1047 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1061 - OBJ
      ?auto_1060 - LOCATION
    )
    :vars
    (
      ?auto_1064 - LOCATION
      ?auto_1063 - CITY
      ?auto_1065 - OBJ
      ?auto_1062 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1064 ?auto_1063 ) ( IN-CITY ?auto_1060 ?auto_1063 ) ( not ( = ?auto_1060 ?auto_1064 ) ) ( OBJ-AT ?auto_1065 ?auto_1060 ) ( not ( = ?auto_1065 ?auto_1061 ) ) ( OBJ-AT ?auto_1061 ?auto_1064 ) ( TRUCK-AT ?auto_1062 ?auto_1060 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1062 ?auto_1060 ?auto_1064 ?auto_1063 )
      ( DELIVER-2PKG ?auto_1065 ?auto_1061 ?auto_1060 )
      ( DELIVER-1PKG-VERIFY ?auto_1061 ?auto_1060 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1067 - OBJ
      ?auto_1068 - OBJ
      ?auto_1066 - LOCATION
    )
    :vars
    (
      ?auto_1071 - LOCATION
      ?auto_1069 - CITY
      ?auto_1070 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1071 ?auto_1069 ) ( IN-CITY ?auto_1066 ?auto_1069 ) ( not ( = ?auto_1066 ?auto_1071 ) ) ( OBJ-AT ?auto_1067 ?auto_1066 ) ( not ( = ?auto_1067 ?auto_1068 ) ) ( OBJ-AT ?auto_1068 ?auto_1071 ) ( TRUCK-AT ?auto_1070 ?auto_1066 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1068 ?auto_1066 )
      ( DELIVER-2PKG-VERIFY ?auto_1067 ?auto_1068 ?auto_1066 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1073 - OBJ
      ?auto_1074 - OBJ
      ?auto_1072 - LOCATION
    )
    :vars
    (
      ?auto_1075 - LOCATION
      ?auto_1077 - CITY
      ?auto_1076 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1075 ?auto_1077 ) ( IN-CITY ?auto_1072 ?auto_1077 ) ( not ( = ?auto_1072 ?auto_1075 ) ) ( OBJ-AT ?auto_1074 ?auto_1072 ) ( not ( = ?auto_1074 ?auto_1073 ) ) ( OBJ-AT ?auto_1073 ?auto_1075 ) ( TRUCK-AT ?auto_1076 ?auto_1072 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1074 ?auto_1073 ?auto_1072 )
      ( DELIVER-2PKG-VERIFY ?auto_1073 ?auto_1074 ?auto_1072 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1086 - OBJ
      ?auto_1085 - LOCATION
    )
    :vars
    (
      ?auto_1087 - LOCATION
      ?auto_1089 - CITY
      ?auto_1090 - OBJ
      ?auto_1088 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1087 ?auto_1089 ) ( IN-CITY ?auto_1085 ?auto_1089 ) ( not ( = ?auto_1085 ?auto_1087 ) ) ( not ( = ?auto_1090 ?auto_1086 ) ) ( OBJ-AT ?auto_1086 ?auto_1087 ) ( TRUCK-AT ?auto_1088 ?auto_1085 ) ( IN-TRUCK ?auto_1090 ?auto_1088 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1090 ?auto_1085 )
      ( DELIVER-2PKG ?auto_1090 ?auto_1086 ?auto_1085 )
      ( DELIVER-1PKG-VERIFY ?auto_1086 ?auto_1085 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1092 - OBJ
      ?auto_1093 - OBJ
      ?auto_1091 - LOCATION
    )
    :vars
    (
      ?auto_1096 - LOCATION
      ?auto_1094 - CITY
      ?auto_1095 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1096 ?auto_1094 ) ( IN-CITY ?auto_1091 ?auto_1094 ) ( not ( = ?auto_1091 ?auto_1096 ) ) ( not ( = ?auto_1092 ?auto_1093 ) ) ( OBJ-AT ?auto_1093 ?auto_1096 ) ( TRUCK-AT ?auto_1095 ?auto_1091 ) ( IN-TRUCK ?auto_1092 ?auto_1095 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1093 ?auto_1091 )
      ( DELIVER-2PKG-VERIFY ?auto_1092 ?auto_1093 ?auto_1091 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1098 - OBJ
      ?auto_1099 - OBJ
      ?auto_1097 - LOCATION
    )
    :vars
    (
      ?auto_1100 - LOCATION
      ?auto_1101 - CITY
      ?auto_1102 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1100 ?auto_1101 ) ( IN-CITY ?auto_1097 ?auto_1101 ) ( not ( = ?auto_1097 ?auto_1100 ) ) ( not ( = ?auto_1099 ?auto_1098 ) ) ( OBJ-AT ?auto_1098 ?auto_1100 ) ( TRUCK-AT ?auto_1102 ?auto_1097 ) ( IN-TRUCK ?auto_1099 ?auto_1102 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1099 ?auto_1098 ?auto_1097 )
      ( DELIVER-2PKG-VERIFY ?auto_1098 ?auto_1099 ?auto_1097 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1111 - OBJ
      ?auto_1110 - LOCATION
    )
    :vars
    (
      ?auto_1112 - LOCATION
      ?auto_1114 - CITY
      ?auto_1113 - OBJ
      ?auto_1115 - TRUCK
      ?auto_1116 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_1112 ?auto_1114 ) ( IN-CITY ?auto_1110 ?auto_1114 ) ( not ( = ?auto_1110 ?auto_1112 ) ) ( not ( = ?auto_1113 ?auto_1111 ) ) ( OBJ-AT ?auto_1111 ?auto_1112 ) ( IN-TRUCK ?auto_1113 ?auto_1115 ) ( TRUCK-AT ?auto_1115 ?auto_1116 ) ( IN-CITY ?auto_1116 ?auto_1114 ) ( not ( = ?auto_1110 ?auto_1116 ) ) ( not ( = ?auto_1112 ?auto_1116 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1115 ?auto_1116 ?auto_1110 ?auto_1114 )
      ( DELIVER-2PKG ?auto_1113 ?auto_1111 ?auto_1110 )
      ( DELIVER-1PKG-VERIFY ?auto_1111 ?auto_1110 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1118 - OBJ
      ?auto_1119 - OBJ
      ?auto_1117 - LOCATION
    )
    :vars
    (
      ?auto_1121 - LOCATION
      ?auto_1120 - CITY
      ?auto_1122 - TRUCK
      ?auto_1123 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_1121 ?auto_1120 ) ( IN-CITY ?auto_1117 ?auto_1120 ) ( not ( = ?auto_1117 ?auto_1121 ) ) ( not ( = ?auto_1118 ?auto_1119 ) ) ( OBJ-AT ?auto_1119 ?auto_1121 ) ( IN-TRUCK ?auto_1118 ?auto_1122 ) ( TRUCK-AT ?auto_1122 ?auto_1123 ) ( IN-CITY ?auto_1123 ?auto_1120 ) ( not ( = ?auto_1117 ?auto_1123 ) ) ( not ( = ?auto_1121 ?auto_1123 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1119 ?auto_1117 )
      ( DELIVER-2PKG-VERIFY ?auto_1118 ?auto_1119 ?auto_1117 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1125 - OBJ
      ?auto_1126 - OBJ
      ?auto_1124 - LOCATION
    )
    :vars
    (
      ?auto_1127 - LOCATION
      ?auto_1128 - CITY
      ?auto_1129 - TRUCK
      ?auto_1130 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_1127 ?auto_1128 ) ( IN-CITY ?auto_1124 ?auto_1128 ) ( not ( = ?auto_1124 ?auto_1127 ) ) ( not ( = ?auto_1126 ?auto_1125 ) ) ( OBJ-AT ?auto_1125 ?auto_1127 ) ( IN-TRUCK ?auto_1126 ?auto_1129 ) ( TRUCK-AT ?auto_1129 ?auto_1130 ) ( IN-CITY ?auto_1130 ?auto_1128 ) ( not ( = ?auto_1124 ?auto_1130 ) ) ( not ( = ?auto_1127 ?auto_1130 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1126 ?auto_1125 ?auto_1124 )
      ( DELIVER-2PKG-VERIFY ?auto_1125 ?auto_1126 ?auto_1124 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1140 - OBJ
      ?auto_1139 - LOCATION
    )
    :vars
    (
      ?auto_1141 - LOCATION
      ?auto_1142 - CITY
      ?auto_1144 - OBJ
      ?auto_1143 - TRUCK
      ?auto_1145 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_1141 ?auto_1142 ) ( IN-CITY ?auto_1139 ?auto_1142 ) ( not ( = ?auto_1139 ?auto_1141 ) ) ( not ( = ?auto_1144 ?auto_1140 ) ) ( OBJ-AT ?auto_1140 ?auto_1141 ) ( TRUCK-AT ?auto_1143 ?auto_1145 ) ( IN-CITY ?auto_1145 ?auto_1142 ) ( not ( = ?auto_1139 ?auto_1145 ) ) ( not ( = ?auto_1141 ?auto_1145 ) ) ( OBJ-AT ?auto_1144 ?auto_1145 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_1144 ?auto_1143 ?auto_1145 )
      ( DELIVER-2PKG ?auto_1144 ?auto_1140 ?auto_1139 )
      ( DELIVER-1PKG-VERIFY ?auto_1140 ?auto_1139 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1147 - OBJ
      ?auto_1148 - OBJ
      ?auto_1146 - LOCATION
    )
    :vars
    (
      ?auto_1149 - LOCATION
      ?auto_1152 - CITY
      ?auto_1150 - TRUCK
      ?auto_1151 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_1149 ?auto_1152 ) ( IN-CITY ?auto_1146 ?auto_1152 ) ( not ( = ?auto_1146 ?auto_1149 ) ) ( not ( = ?auto_1147 ?auto_1148 ) ) ( OBJ-AT ?auto_1148 ?auto_1149 ) ( TRUCK-AT ?auto_1150 ?auto_1151 ) ( IN-CITY ?auto_1151 ?auto_1152 ) ( not ( = ?auto_1146 ?auto_1151 ) ) ( not ( = ?auto_1149 ?auto_1151 ) ) ( OBJ-AT ?auto_1147 ?auto_1151 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1148 ?auto_1146 )
      ( DELIVER-2PKG-VERIFY ?auto_1147 ?auto_1148 ?auto_1146 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1154 - OBJ
      ?auto_1155 - OBJ
      ?auto_1153 - LOCATION
    )
    :vars
    (
      ?auto_1159 - LOCATION
      ?auto_1158 - CITY
      ?auto_1156 - TRUCK
      ?auto_1157 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_1159 ?auto_1158 ) ( IN-CITY ?auto_1153 ?auto_1158 ) ( not ( = ?auto_1153 ?auto_1159 ) ) ( not ( = ?auto_1155 ?auto_1154 ) ) ( OBJ-AT ?auto_1154 ?auto_1159 ) ( TRUCK-AT ?auto_1156 ?auto_1157 ) ( IN-CITY ?auto_1157 ?auto_1158 ) ( not ( = ?auto_1153 ?auto_1157 ) ) ( not ( = ?auto_1159 ?auto_1157 ) ) ( OBJ-AT ?auto_1155 ?auto_1157 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1155 ?auto_1154 ?auto_1153 )
      ( DELIVER-2PKG-VERIFY ?auto_1154 ?auto_1155 ?auto_1153 ) )
  )

)

