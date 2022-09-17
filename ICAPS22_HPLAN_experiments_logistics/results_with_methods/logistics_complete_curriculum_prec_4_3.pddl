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

  ( :method DELIVER-3PKG-VERIFY
    :parameters
    (
      ?obj1 - OBJ
      ?obj2 - OBJ
      ?obj3 - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj1 ?dst ) ( OBJ-AT ?obj2 ?dst ) ( OBJ-AT ?obj3 ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-4PKG-VERIFY
    :parameters
    (
      ?obj1 - OBJ
      ?obj2 - OBJ
      ?obj3 - OBJ
      ?obj4 - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj1 ?dst ) ( OBJ-AT ?obj2 ?dst ) ( OBJ-AT ?obj3 ?dst ) ( OBJ-AT ?obj4 ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1050 - OBJ
      ?auto_1051 - LOCATION
    )
    :vars
    (
      ?auto_1052 - TRUCK
      ?auto_1053 - LOCATION
      ?auto_1054 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_1052 ?auto_1053 ) ( IN-CITY ?auto_1053 ?auto_1054 ) ( IN-CITY ?auto_1051 ?auto_1054 ) ( not ( = ?auto_1051 ?auto_1053 ) ) ( OBJ-AT ?auto_1050 ?auto_1053 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_1050 ?auto_1052 ?auto_1053 )
      ( !DRIVE-TRUCK ?auto_1052 ?auto_1053 ?auto_1051 ?auto_1054 )
      ( !UNLOAD-TRUCK ?auto_1050 ?auto_1052 ?auto_1051 )
      ( DELIVER-1PKG-VERIFY ?auto_1050 ?auto_1051 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1057 - OBJ
      ?auto_1058 - LOCATION
    )
    :vars
    (
      ?auto_1060 - LOCATION
      ?auto_1061 - CITY
      ?auto_1059 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1060 ?auto_1061 ) ( IN-CITY ?auto_1058 ?auto_1061 ) ( not ( = ?auto_1058 ?auto_1060 ) ) ( OBJ-AT ?auto_1057 ?auto_1060 ) ( TRUCK-AT ?auto_1059 ?auto_1058 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1059 ?auto_1058 ?auto_1060 ?auto_1061 )
      ( DELIVER-1PKG ?auto_1057 ?auto_1058 )
      ( DELIVER-1PKG-VERIFY ?auto_1057 ?auto_1058 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1064 - OBJ
      ?auto_1065 - LOCATION
    )
    :vars
    (
      ?auto_1066 - TRUCK
      ?auto_1067 - LOCATION
      ?auto_1068 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_1066 ?auto_1067 ) ( IN-CITY ?auto_1067 ?auto_1068 ) ( IN-CITY ?auto_1065 ?auto_1068 ) ( not ( = ?auto_1065 ?auto_1067 ) ) ( OBJ-AT ?auto_1064 ?auto_1067 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_1064 ?auto_1066 ?auto_1067 )
      ( !DRIVE-TRUCK ?auto_1066 ?auto_1067 ?auto_1065 ?auto_1068 )
      ( !UNLOAD-TRUCK ?auto_1064 ?auto_1066 ?auto_1065 )
      ( DELIVER-1PKG-VERIFY ?auto_1064 ?auto_1065 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1071 - OBJ
      ?auto_1072 - LOCATION
    )
    :vars
    (
      ?auto_1073 - LOCATION
      ?auto_1075 - CITY
      ?auto_1074 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1073 ?auto_1075 ) ( IN-CITY ?auto_1072 ?auto_1075 ) ( not ( = ?auto_1072 ?auto_1073 ) ) ( OBJ-AT ?auto_1071 ?auto_1073 ) ( TRUCK-AT ?auto_1074 ?auto_1072 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1074 ?auto_1072 ?auto_1073 ?auto_1075 )
      ( DELIVER-1PKG ?auto_1071 ?auto_1072 )
      ( DELIVER-1PKG-VERIFY ?auto_1071 ?auto_1072 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1079 - OBJ
      ?auto_1081 - OBJ
      ?auto_1080 - LOCATION
    )
    :vars
    (
      ?auto_1084 - LOCATION
      ?auto_1083 - CITY
      ?auto_1082 - TRUCK
      ?auto_1085 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1081 ?auto_1079 ) ( IN-CITY ?auto_1084 ?auto_1083 ) ( IN-CITY ?auto_1080 ?auto_1083 ) ( not ( = ?auto_1080 ?auto_1084 ) ) ( OBJ-AT ?auto_1081 ?auto_1084 ) ( TRUCK-AT ?auto_1082 ?auto_1085 ) ( IN-CITY ?auto_1085 ?auto_1083 ) ( not ( = ?auto_1080 ?auto_1085 ) ) ( OBJ-AT ?auto_1079 ?auto_1085 ) ( not ( = ?auto_1079 ?auto_1081 ) ) ( not ( = ?auto_1084 ?auto_1085 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1079 ?auto_1080 )
      ( DELIVER-1PKG ?auto_1081 ?auto_1080 )
      ( DELIVER-2PKG-VERIFY ?auto_1079 ?auto_1081 ?auto_1080 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1089 - OBJ
      ?auto_1091 - OBJ
      ?auto_1090 - LOCATION
    )
    :vars
    (
      ?auto_1094 - LOCATION
      ?auto_1093 - CITY
      ?auto_1092 - LOCATION
      ?auto_1095 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1091 ?auto_1089 ) ( IN-CITY ?auto_1094 ?auto_1093 ) ( IN-CITY ?auto_1090 ?auto_1093 ) ( not ( = ?auto_1090 ?auto_1094 ) ) ( OBJ-AT ?auto_1091 ?auto_1094 ) ( IN-CITY ?auto_1092 ?auto_1093 ) ( not ( = ?auto_1090 ?auto_1092 ) ) ( OBJ-AT ?auto_1089 ?auto_1092 ) ( not ( = ?auto_1089 ?auto_1091 ) ) ( not ( = ?auto_1094 ?auto_1092 ) ) ( TRUCK-AT ?auto_1095 ?auto_1090 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1095 ?auto_1090 ?auto_1092 ?auto_1093 )
      ( DELIVER-2PKG ?auto_1089 ?auto_1091 ?auto_1090 )
      ( DELIVER-2PKG-VERIFY ?auto_1089 ?auto_1091 ?auto_1090 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1098 - OBJ
      ?auto_1099 - LOCATION
    )
    :vars
    (
      ?auto_1100 - TRUCK
      ?auto_1101 - LOCATION
      ?auto_1102 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_1100 ?auto_1101 ) ( IN-CITY ?auto_1101 ?auto_1102 ) ( IN-CITY ?auto_1099 ?auto_1102 ) ( not ( = ?auto_1099 ?auto_1101 ) ) ( OBJ-AT ?auto_1098 ?auto_1101 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_1098 ?auto_1100 ?auto_1101 )
      ( !DRIVE-TRUCK ?auto_1100 ?auto_1101 ?auto_1099 ?auto_1102 )
      ( !UNLOAD-TRUCK ?auto_1098 ?auto_1100 ?auto_1099 )
      ( DELIVER-1PKG-VERIFY ?auto_1098 ?auto_1099 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1105 - OBJ
      ?auto_1106 - LOCATION
    )
    :vars
    (
      ?auto_1108 - LOCATION
      ?auto_1109 - CITY
      ?auto_1107 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1108 ?auto_1109 ) ( IN-CITY ?auto_1106 ?auto_1109 ) ( not ( = ?auto_1106 ?auto_1108 ) ) ( OBJ-AT ?auto_1105 ?auto_1108 ) ( TRUCK-AT ?auto_1107 ?auto_1106 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1107 ?auto_1106 ?auto_1108 ?auto_1109 )
      ( DELIVER-1PKG ?auto_1105 ?auto_1106 )
      ( DELIVER-1PKG-VERIFY ?auto_1105 ?auto_1106 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1114 - OBJ
      ?auto_1116 - OBJ
      ?auto_1117 - OBJ
      ?auto_1115 - LOCATION
    )
    :vars
    (
      ?auto_1118 - LOCATION
      ?auto_1120 - CITY
      ?auto_1122 - LOCATION
      ?auto_1119 - TRUCK
      ?auto_1121 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1116 ?auto_1114 ) ( GREATER-THAN ?auto_1117 ?auto_1114 ) ( GREATER-THAN ?auto_1117 ?auto_1116 ) ( IN-CITY ?auto_1118 ?auto_1120 ) ( IN-CITY ?auto_1115 ?auto_1120 ) ( not ( = ?auto_1115 ?auto_1118 ) ) ( OBJ-AT ?auto_1117 ?auto_1118 ) ( IN-CITY ?auto_1122 ?auto_1120 ) ( not ( = ?auto_1115 ?auto_1122 ) ) ( OBJ-AT ?auto_1116 ?auto_1122 ) ( TRUCK-AT ?auto_1119 ?auto_1121 ) ( IN-CITY ?auto_1121 ?auto_1120 ) ( not ( = ?auto_1115 ?auto_1121 ) ) ( OBJ-AT ?auto_1114 ?auto_1121 ) ( not ( = ?auto_1114 ?auto_1116 ) ) ( not ( = ?auto_1122 ?auto_1121 ) ) ( not ( = ?auto_1114 ?auto_1117 ) ) ( not ( = ?auto_1116 ?auto_1117 ) ) ( not ( = ?auto_1118 ?auto_1122 ) ) ( not ( = ?auto_1118 ?auto_1121 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1114 ?auto_1116 ?auto_1115 )
      ( DELIVER-1PKG ?auto_1117 ?auto_1115 )
      ( DELIVER-3PKG-VERIFY ?auto_1114 ?auto_1116 ?auto_1117 ?auto_1115 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1127 - OBJ
      ?auto_1129 - OBJ
      ?auto_1130 - OBJ
      ?auto_1128 - LOCATION
    )
    :vars
    (
      ?auto_1132 - LOCATION
      ?auto_1134 - CITY
      ?auto_1131 - LOCATION
      ?auto_1133 - LOCATION
      ?auto_1135 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1129 ?auto_1127 ) ( GREATER-THAN ?auto_1130 ?auto_1127 ) ( GREATER-THAN ?auto_1130 ?auto_1129 ) ( IN-CITY ?auto_1132 ?auto_1134 ) ( IN-CITY ?auto_1128 ?auto_1134 ) ( not ( = ?auto_1128 ?auto_1132 ) ) ( OBJ-AT ?auto_1130 ?auto_1132 ) ( IN-CITY ?auto_1131 ?auto_1134 ) ( not ( = ?auto_1128 ?auto_1131 ) ) ( OBJ-AT ?auto_1129 ?auto_1131 ) ( IN-CITY ?auto_1133 ?auto_1134 ) ( not ( = ?auto_1128 ?auto_1133 ) ) ( OBJ-AT ?auto_1127 ?auto_1133 ) ( not ( = ?auto_1127 ?auto_1129 ) ) ( not ( = ?auto_1131 ?auto_1133 ) ) ( not ( = ?auto_1127 ?auto_1130 ) ) ( not ( = ?auto_1129 ?auto_1130 ) ) ( not ( = ?auto_1132 ?auto_1131 ) ) ( not ( = ?auto_1132 ?auto_1133 ) ) ( TRUCK-AT ?auto_1135 ?auto_1128 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1135 ?auto_1128 ?auto_1133 ?auto_1134 )
      ( DELIVER-3PKG ?auto_1127 ?auto_1129 ?auto_1130 ?auto_1128 )
      ( DELIVER-3PKG-VERIFY ?auto_1127 ?auto_1129 ?auto_1130 ?auto_1128 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1138 - OBJ
      ?auto_1139 - LOCATION
    )
    :vars
    (
      ?auto_1140 - TRUCK
      ?auto_1141 - LOCATION
      ?auto_1142 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_1140 ?auto_1141 ) ( IN-CITY ?auto_1141 ?auto_1142 ) ( IN-CITY ?auto_1139 ?auto_1142 ) ( not ( = ?auto_1139 ?auto_1141 ) ) ( OBJ-AT ?auto_1138 ?auto_1141 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_1138 ?auto_1140 ?auto_1141 )
      ( !DRIVE-TRUCK ?auto_1140 ?auto_1141 ?auto_1139 ?auto_1142 )
      ( !UNLOAD-TRUCK ?auto_1138 ?auto_1140 ?auto_1139 )
      ( DELIVER-1PKG-VERIFY ?auto_1138 ?auto_1139 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1145 - OBJ
      ?auto_1146 - LOCATION
    )
    :vars
    (
      ?auto_1147 - LOCATION
      ?auto_1148 - CITY
      ?auto_1149 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1147 ?auto_1148 ) ( IN-CITY ?auto_1146 ?auto_1148 ) ( not ( = ?auto_1146 ?auto_1147 ) ) ( OBJ-AT ?auto_1145 ?auto_1147 ) ( TRUCK-AT ?auto_1149 ?auto_1146 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1149 ?auto_1146 ?auto_1147 ?auto_1148 )
      ( DELIVER-1PKG ?auto_1145 ?auto_1146 )
      ( DELIVER-1PKG-VERIFY ?auto_1145 ?auto_1146 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_1155 - OBJ
      ?auto_1157 - OBJ
      ?auto_1158 - OBJ
      ?auto_1159 - OBJ
      ?auto_1156 - LOCATION
    )
    :vars
    (
      ?auto_1161 - LOCATION
      ?auto_1160 - CITY
      ?auto_1164 - LOCATION
      ?auto_1163 - LOCATION
      ?auto_1162 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1157 ?auto_1155 ) ( GREATER-THAN ?auto_1158 ?auto_1155 ) ( GREATER-THAN ?auto_1158 ?auto_1157 ) ( GREATER-THAN ?auto_1159 ?auto_1155 ) ( GREATER-THAN ?auto_1159 ?auto_1157 ) ( GREATER-THAN ?auto_1159 ?auto_1158 ) ( IN-CITY ?auto_1161 ?auto_1160 ) ( IN-CITY ?auto_1156 ?auto_1160 ) ( not ( = ?auto_1156 ?auto_1161 ) ) ( OBJ-AT ?auto_1159 ?auto_1161 ) ( IN-CITY ?auto_1164 ?auto_1160 ) ( not ( = ?auto_1156 ?auto_1164 ) ) ( OBJ-AT ?auto_1158 ?auto_1164 ) ( IN-CITY ?auto_1163 ?auto_1160 ) ( not ( = ?auto_1156 ?auto_1163 ) ) ( OBJ-AT ?auto_1157 ?auto_1163 ) ( TRUCK-AT ?auto_1162 ?auto_1161 ) ( OBJ-AT ?auto_1155 ?auto_1161 ) ( not ( = ?auto_1155 ?auto_1157 ) ) ( not ( = ?auto_1163 ?auto_1161 ) ) ( not ( = ?auto_1155 ?auto_1158 ) ) ( not ( = ?auto_1157 ?auto_1158 ) ) ( not ( = ?auto_1164 ?auto_1163 ) ) ( not ( = ?auto_1164 ?auto_1161 ) ) ( not ( = ?auto_1155 ?auto_1159 ) ) ( not ( = ?auto_1157 ?auto_1159 ) ) ( not ( = ?auto_1158 ?auto_1159 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_1155 ?auto_1157 ?auto_1158 ?auto_1156 )
      ( DELIVER-1PKG ?auto_1159 ?auto_1156 )
      ( DELIVER-4PKG-VERIFY ?auto_1155 ?auto_1157 ?auto_1158 ?auto_1159 ?auto_1156 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_1170 - OBJ
      ?auto_1172 - OBJ
      ?auto_1173 - OBJ
      ?auto_1174 - OBJ
      ?auto_1171 - LOCATION
    )
    :vars
    (
      ?auto_1178 - LOCATION
      ?auto_1177 - CITY
      ?auto_1179 - LOCATION
      ?auto_1175 - LOCATION
      ?auto_1176 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1172 ?auto_1170 ) ( GREATER-THAN ?auto_1173 ?auto_1170 ) ( GREATER-THAN ?auto_1173 ?auto_1172 ) ( GREATER-THAN ?auto_1174 ?auto_1170 ) ( GREATER-THAN ?auto_1174 ?auto_1172 ) ( GREATER-THAN ?auto_1174 ?auto_1173 ) ( IN-CITY ?auto_1178 ?auto_1177 ) ( IN-CITY ?auto_1171 ?auto_1177 ) ( not ( = ?auto_1171 ?auto_1178 ) ) ( OBJ-AT ?auto_1174 ?auto_1178 ) ( IN-CITY ?auto_1179 ?auto_1177 ) ( not ( = ?auto_1171 ?auto_1179 ) ) ( OBJ-AT ?auto_1173 ?auto_1179 ) ( IN-CITY ?auto_1175 ?auto_1177 ) ( not ( = ?auto_1171 ?auto_1175 ) ) ( OBJ-AT ?auto_1172 ?auto_1175 ) ( OBJ-AT ?auto_1170 ?auto_1178 ) ( not ( = ?auto_1170 ?auto_1172 ) ) ( not ( = ?auto_1175 ?auto_1178 ) ) ( not ( = ?auto_1170 ?auto_1173 ) ) ( not ( = ?auto_1172 ?auto_1173 ) ) ( not ( = ?auto_1179 ?auto_1175 ) ) ( not ( = ?auto_1179 ?auto_1178 ) ) ( not ( = ?auto_1170 ?auto_1174 ) ) ( not ( = ?auto_1172 ?auto_1174 ) ) ( not ( = ?auto_1173 ?auto_1174 ) ) ( TRUCK-AT ?auto_1176 ?auto_1171 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1176 ?auto_1171 ?auto_1178 ?auto_1177 )
      ( DELIVER-4PKG ?auto_1170 ?auto_1172 ?auto_1173 ?auto_1174 ?auto_1171 )
      ( DELIVER-4PKG-VERIFY ?auto_1170 ?auto_1172 ?auto_1173 ?auto_1174 ?auto_1171 ) )
  )

)

