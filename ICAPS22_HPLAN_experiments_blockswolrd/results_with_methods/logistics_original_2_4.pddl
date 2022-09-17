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
      ?auto_1010 - OBJ
      ?auto_1009 - LOCATION
    )
    :vars
    (
      ?auto_1011 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_1011 ?auto_1009 ) ( IN-TRUCK ?auto_1010 ?auto_1011 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_1010 ?auto_1011 ?auto_1009 )
      ( DELIVER-1PKG-VERIFY ?auto_1010 ?auto_1009 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1017 - OBJ
      ?auto_1016 - LOCATION
    )
    :vars
    (
      ?auto_1018 - TRUCK
      ?auto_1019 - LOCATION
      ?auto_1020 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_1017 ?auto_1018 ) ( TRUCK-AT ?auto_1018 ?auto_1019 ) ( IN-CITY ?auto_1019 ?auto_1020 ) ( IN-CITY ?auto_1016 ?auto_1020 ) ( not ( = ?auto_1016 ?auto_1019 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1018 ?auto_1019 ?auto_1016 ?auto_1020 )
      ( DELIVER-1PKG ?auto_1017 ?auto_1016 )
      ( DELIVER-1PKG-VERIFY ?auto_1017 ?auto_1016 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1028 - OBJ
      ?auto_1027 - LOCATION
    )
    :vars
    (
      ?auto_1029 - TRUCK
      ?auto_1030 - LOCATION
      ?auto_1031 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_1029 ?auto_1030 ) ( IN-CITY ?auto_1030 ?auto_1031 ) ( IN-CITY ?auto_1027 ?auto_1031 ) ( not ( = ?auto_1027 ?auto_1030 ) ) ( OBJ-AT ?auto_1028 ?auto_1030 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_1028 ?auto_1029 ?auto_1030 )
      ( DELIVER-1PKG ?auto_1028 ?auto_1027 )
      ( DELIVER-1PKG-VERIFY ?auto_1028 ?auto_1027 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1039 - OBJ
      ?auto_1038 - LOCATION
    )
    :vars
    (
      ?auto_1040 - LOCATION
      ?auto_1041 - CITY
      ?auto_1042 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1040 ?auto_1041 ) ( IN-CITY ?auto_1038 ?auto_1041 ) ( not ( = ?auto_1038 ?auto_1040 ) ) ( OBJ-AT ?auto_1039 ?auto_1040 ) ( TRUCK-AT ?auto_1042 ?auto_1038 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1042 ?auto_1038 ?auto_1040 ?auto_1041 )
      ( DELIVER-1PKG ?auto_1039 ?auto_1038 )
      ( DELIVER-1PKG-VERIFY ?auto_1039 ?auto_1038 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1061 - OBJ
      ?auto_1060 - LOCATION
    )
    :vars
    (
      ?auto_1062 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_1062 ?auto_1060 ) ( IN-TRUCK ?auto_1061 ?auto_1062 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_1061 ?auto_1062 ?auto_1060 )
      ( DELIVER-1PKG-VERIFY ?auto_1061 ?auto_1060 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1064 - OBJ
      ?auto_1065 - OBJ
      ?auto_1063 - LOCATION
    )
    :vars
    (
      ?auto_1066 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_1066 ?auto_1063 ) ( IN-TRUCK ?auto_1065 ?auto_1066 ) ( OBJ-AT ?auto_1064 ?auto_1063 ) ( not ( = ?auto_1064 ?auto_1065 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1065 ?auto_1063 )
      ( DELIVER-2PKG-VERIFY ?auto_1064 ?auto_1065 ?auto_1063 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1068 - OBJ
      ?auto_1069 - OBJ
      ?auto_1067 - LOCATION
    )
    :vars
    (
      ?auto_1070 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_1070 ?auto_1067 ) ( IN-TRUCK ?auto_1068 ?auto_1070 ) ( OBJ-AT ?auto_1069 ?auto_1067 ) ( not ( = ?auto_1068 ?auto_1069 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1068 ?auto_1067 )
      ( DELIVER-2PKG-VERIFY ?auto_1068 ?auto_1069 ?auto_1067 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1076 - OBJ
      ?auto_1075 - LOCATION
    )
    :vars
    (
      ?auto_1077 - TRUCK
      ?auto_1078 - LOCATION
      ?auto_1079 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_1076 ?auto_1077 ) ( TRUCK-AT ?auto_1077 ?auto_1078 ) ( IN-CITY ?auto_1078 ?auto_1079 ) ( IN-CITY ?auto_1075 ?auto_1079 ) ( not ( = ?auto_1075 ?auto_1078 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1077 ?auto_1078 ?auto_1075 ?auto_1079 )
      ( DELIVER-1PKG ?auto_1076 ?auto_1075 )
      ( DELIVER-1PKG-VERIFY ?auto_1076 ?auto_1075 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1081 - OBJ
      ?auto_1082 - OBJ
      ?auto_1080 - LOCATION
    )
    :vars
    (
      ?auto_1083 - TRUCK
      ?auto_1085 - LOCATION
      ?auto_1084 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_1082 ?auto_1083 ) ( TRUCK-AT ?auto_1083 ?auto_1085 ) ( IN-CITY ?auto_1085 ?auto_1084 ) ( IN-CITY ?auto_1080 ?auto_1084 ) ( not ( = ?auto_1080 ?auto_1085 ) ) ( OBJ-AT ?auto_1081 ?auto_1080 ) ( not ( = ?auto_1081 ?auto_1082 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1082 ?auto_1080 )
      ( DELIVER-2PKG-VERIFY ?auto_1081 ?auto_1082 ?auto_1080 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1087 - OBJ
      ?auto_1088 - OBJ
      ?auto_1086 - LOCATION
    )
    :vars
    (
      ?auto_1090 - TRUCK
      ?auto_1091 - LOCATION
      ?auto_1089 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_1087 ?auto_1090 ) ( TRUCK-AT ?auto_1090 ?auto_1091 ) ( IN-CITY ?auto_1091 ?auto_1089 ) ( IN-CITY ?auto_1086 ?auto_1089 ) ( not ( = ?auto_1086 ?auto_1091 ) ) ( OBJ-AT ?auto_1088 ?auto_1086 ) ( not ( = ?auto_1088 ?auto_1087 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1088 ?auto_1087 ?auto_1086 )
      ( DELIVER-2PKG-VERIFY ?auto_1087 ?auto_1088 ?auto_1086 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1100 - OBJ
      ?auto_1099 - LOCATION
    )
    :vars
    (
      ?auto_1102 - TRUCK
      ?auto_1103 - LOCATION
      ?auto_1101 - CITY
      ?auto_1104 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_1102 ?auto_1103 ) ( IN-CITY ?auto_1103 ?auto_1101 ) ( IN-CITY ?auto_1099 ?auto_1101 ) ( not ( = ?auto_1099 ?auto_1103 ) ) ( OBJ-AT ?auto_1104 ?auto_1099 ) ( not ( = ?auto_1104 ?auto_1100 ) ) ( OBJ-AT ?auto_1100 ?auto_1103 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_1100 ?auto_1102 ?auto_1103 )
      ( DELIVER-2PKG ?auto_1104 ?auto_1100 ?auto_1099 )
      ( DELIVER-1PKG-VERIFY ?auto_1100 ?auto_1099 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1106 - OBJ
      ?auto_1107 - OBJ
      ?auto_1105 - LOCATION
    )
    :vars
    (
      ?auto_1108 - TRUCK
      ?auto_1110 - LOCATION
      ?auto_1109 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_1108 ?auto_1110 ) ( IN-CITY ?auto_1110 ?auto_1109 ) ( IN-CITY ?auto_1105 ?auto_1109 ) ( not ( = ?auto_1105 ?auto_1110 ) ) ( OBJ-AT ?auto_1106 ?auto_1105 ) ( not ( = ?auto_1106 ?auto_1107 ) ) ( OBJ-AT ?auto_1107 ?auto_1110 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1107 ?auto_1105 )
      ( DELIVER-2PKG-VERIFY ?auto_1106 ?auto_1107 ?auto_1105 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1112 - OBJ
      ?auto_1113 - OBJ
      ?auto_1111 - LOCATION
    )
    :vars
    (
      ?auto_1115 - TRUCK
      ?auto_1114 - LOCATION
      ?auto_1116 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_1115 ?auto_1114 ) ( IN-CITY ?auto_1114 ?auto_1116 ) ( IN-CITY ?auto_1111 ?auto_1116 ) ( not ( = ?auto_1111 ?auto_1114 ) ) ( OBJ-AT ?auto_1113 ?auto_1111 ) ( not ( = ?auto_1113 ?auto_1112 ) ) ( OBJ-AT ?auto_1112 ?auto_1114 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1113 ?auto_1112 ?auto_1111 )
      ( DELIVER-2PKG-VERIFY ?auto_1112 ?auto_1113 ?auto_1111 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1125 - OBJ
      ?auto_1124 - LOCATION
    )
    :vars
    (
      ?auto_1126 - LOCATION
      ?auto_1128 - CITY
      ?auto_1129 - OBJ
      ?auto_1127 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1126 ?auto_1128 ) ( IN-CITY ?auto_1124 ?auto_1128 ) ( not ( = ?auto_1124 ?auto_1126 ) ) ( OBJ-AT ?auto_1129 ?auto_1124 ) ( not ( = ?auto_1129 ?auto_1125 ) ) ( OBJ-AT ?auto_1125 ?auto_1126 ) ( TRUCK-AT ?auto_1127 ?auto_1124 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1127 ?auto_1124 ?auto_1126 ?auto_1128 )
      ( DELIVER-2PKG ?auto_1129 ?auto_1125 ?auto_1124 )
      ( DELIVER-1PKG-VERIFY ?auto_1125 ?auto_1124 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1131 - OBJ
      ?auto_1132 - OBJ
      ?auto_1130 - LOCATION
    )
    :vars
    (
      ?auto_1134 - LOCATION
      ?auto_1133 - CITY
      ?auto_1135 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1134 ?auto_1133 ) ( IN-CITY ?auto_1130 ?auto_1133 ) ( not ( = ?auto_1130 ?auto_1134 ) ) ( OBJ-AT ?auto_1131 ?auto_1130 ) ( not ( = ?auto_1131 ?auto_1132 ) ) ( OBJ-AT ?auto_1132 ?auto_1134 ) ( TRUCK-AT ?auto_1135 ?auto_1130 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1132 ?auto_1130 )
      ( DELIVER-2PKG-VERIFY ?auto_1131 ?auto_1132 ?auto_1130 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1137 - OBJ
      ?auto_1138 - OBJ
      ?auto_1136 - LOCATION
    )
    :vars
    (
      ?auto_1140 - LOCATION
      ?auto_1141 - CITY
      ?auto_1139 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1140 ?auto_1141 ) ( IN-CITY ?auto_1136 ?auto_1141 ) ( not ( = ?auto_1136 ?auto_1140 ) ) ( OBJ-AT ?auto_1138 ?auto_1136 ) ( not ( = ?auto_1138 ?auto_1137 ) ) ( OBJ-AT ?auto_1137 ?auto_1140 ) ( TRUCK-AT ?auto_1139 ?auto_1136 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1138 ?auto_1137 ?auto_1136 )
      ( DELIVER-2PKG-VERIFY ?auto_1137 ?auto_1138 ?auto_1136 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1150 - OBJ
      ?auto_1149 - LOCATION
    )
    :vars
    (
      ?auto_1152 - LOCATION
      ?auto_1154 - CITY
      ?auto_1153 - OBJ
      ?auto_1151 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1152 ?auto_1154 ) ( IN-CITY ?auto_1149 ?auto_1154 ) ( not ( = ?auto_1149 ?auto_1152 ) ) ( not ( = ?auto_1153 ?auto_1150 ) ) ( OBJ-AT ?auto_1150 ?auto_1152 ) ( TRUCK-AT ?auto_1151 ?auto_1149 ) ( IN-TRUCK ?auto_1153 ?auto_1151 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1153 ?auto_1149 )
      ( DELIVER-2PKG ?auto_1153 ?auto_1150 ?auto_1149 )
      ( DELIVER-1PKG-VERIFY ?auto_1150 ?auto_1149 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1156 - OBJ
      ?auto_1157 - OBJ
      ?auto_1155 - LOCATION
    )
    :vars
    (
      ?auto_1158 - LOCATION
      ?auto_1159 - CITY
      ?auto_1160 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1158 ?auto_1159 ) ( IN-CITY ?auto_1155 ?auto_1159 ) ( not ( = ?auto_1155 ?auto_1158 ) ) ( not ( = ?auto_1156 ?auto_1157 ) ) ( OBJ-AT ?auto_1157 ?auto_1158 ) ( TRUCK-AT ?auto_1160 ?auto_1155 ) ( IN-TRUCK ?auto_1156 ?auto_1160 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1157 ?auto_1155 )
      ( DELIVER-2PKG-VERIFY ?auto_1156 ?auto_1157 ?auto_1155 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1162 - OBJ
      ?auto_1163 - OBJ
      ?auto_1161 - LOCATION
    )
    :vars
    (
      ?auto_1166 - LOCATION
      ?auto_1165 - CITY
      ?auto_1164 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1166 ?auto_1165 ) ( IN-CITY ?auto_1161 ?auto_1165 ) ( not ( = ?auto_1161 ?auto_1166 ) ) ( not ( = ?auto_1163 ?auto_1162 ) ) ( OBJ-AT ?auto_1162 ?auto_1166 ) ( TRUCK-AT ?auto_1164 ?auto_1161 ) ( IN-TRUCK ?auto_1163 ?auto_1164 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1163 ?auto_1162 ?auto_1161 )
      ( DELIVER-2PKG-VERIFY ?auto_1162 ?auto_1163 ?auto_1161 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1175 - OBJ
      ?auto_1174 - LOCATION
    )
    :vars
    (
      ?auto_1178 - LOCATION
      ?auto_1177 - CITY
      ?auto_1179 - OBJ
      ?auto_1176 - TRUCK
      ?auto_1180 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_1178 ?auto_1177 ) ( IN-CITY ?auto_1174 ?auto_1177 ) ( not ( = ?auto_1174 ?auto_1178 ) ) ( not ( = ?auto_1179 ?auto_1175 ) ) ( OBJ-AT ?auto_1175 ?auto_1178 ) ( IN-TRUCK ?auto_1179 ?auto_1176 ) ( TRUCK-AT ?auto_1176 ?auto_1180 ) ( IN-CITY ?auto_1180 ?auto_1177 ) ( not ( = ?auto_1174 ?auto_1180 ) ) ( not ( = ?auto_1178 ?auto_1180 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1176 ?auto_1180 ?auto_1174 ?auto_1177 )
      ( DELIVER-2PKG ?auto_1179 ?auto_1175 ?auto_1174 )
      ( DELIVER-1PKG-VERIFY ?auto_1175 ?auto_1174 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1182 - OBJ
      ?auto_1183 - OBJ
      ?auto_1181 - LOCATION
    )
    :vars
    (
      ?auto_1184 - LOCATION
      ?auto_1187 - CITY
      ?auto_1186 - TRUCK
      ?auto_1185 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_1184 ?auto_1187 ) ( IN-CITY ?auto_1181 ?auto_1187 ) ( not ( = ?auto_1181 ?auto_1184 ) ) ( not ( = ?auto_1182 ?auto_1183 ) ) ( OBJ-AT ?auto_1183 ?auto_1184 ) ( IN-TRUCK ?auto_1182 ?auto_1186 ) ( TRUCK-AT ?auto_1186 ?auto_1185 ) ( IN-CITY ?auto_1185 ?auto_1187 ) ( not ( = ?auto_1181 ?auto_1185 ) ) ( not ( = ?auto_1184 ?auto_1185 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1183 ?auto_1181 )
      ( DELIVER-2PKG-VERIFY ?auto_1182 ?auto_1183 ?auto_1181 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1189 - OBJ
      ?auto_1190 - OBJ
      ?auto_1188 - LOCATION
    )
    :vars
    (
      ?auto_1193 - LOCATION
      ?auto_1192 - CITY
      ?auto_1191 - TRUCK
      ?auto_1194 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_1193 ?auto_1192 ) ( IN-CITY ?auto_1188 ?auto_1192 ) ( not ( = ?auto_1188 ?auto_1193 ) ) ( not ( = ?auto_1190 ?auto_1189 ) ) ( OBJ-AT ?auto_1189 ?auto_1193 ) ( IN-TRUCK ?auto_1190 ?auto_1191 ) ( TRUCK-AT ?auto_1191 ?auto_1194 ) ( IN-CITY ?auto_1194 ?auto_1192 ) ( not ( = ?auto_1188 ?auto_1194 ) ) ( not ( = ?auto_1193 ?auto_1194 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1190 ?auto_1189 ?auto_1188 )
      ( DELIVER-2PKG-VERIFY ?auto_1189 ?auto_1190 ?auto_1188 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1204 - OBJ
      ?auto_1203 - LOCATION
    )
    :vars
    (
      ?auto_1207 - LOCATION
      ?auto_1206 - CITY
      ?auto_1209 - OBJ
      ?auto_1205 - TRUCK
      ?auto_1208 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_1207 ?auto_1206 ) ( IN-CITY ?auto_1203 ?auto_1206 ) ( not ( = ?auto_1203 ?auto_1207 ) ) ( not ( = ?auto_1209 ?auto_1204 ) ) ( OBJ-AT ?auto_1204 ?auto_1207 ) ( TRUCK-AT ?auto_1205 ?auto_1208 ) ( IN-CITY ?auto_1208 ?auto_1206 ) ( not ( = ?auto_1203 ?auto_1208 ) ) ( not ( = ?auto_1207 ?auto_1208 ) ) ( OBJ-AT ?auto_1209 ?auto_1208 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_1209 ?auto_1205 ?auto_1208 )
      ( DELIVER-2PKG ?auto_1209 ?auto_1204 ?auto_1203 )
      ( DELIVER-1PKG-VERIFY ?auto_1204 ?auto_1203 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1211 - OBJ
      ?auto_1212 - OBJ
      ?auto_1210 - LOCATION
    )
    :vars
    (
      ?auto_1213 - LOCATION
      ?auto_1215 - CITY
      ?auto_1214 - TRUCK
      ?auto_1216 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_1213 ?auto_1215 ) ( IN-CITY ?auto_1210 ?auto_1215 ) ( not ( = ?auto_1210 ?auto_1213 ) ) ( not ( = ?auto_1211 ?auto_1212 ) ) ( OBJ-AT ?auto_1212 ?auto_1213 ) ( TRUCK-AT ?auto_1214 ?auto_1216 ) ( IN-CITY ?auto_1216 ?auto_1215 ) ( not ( = ?auto_1210 ?auto_1216 ) ) ( not ( = ?auto_1213 ?auto_1216 ) ) ( OBJ-AT ?auto_1211 ?auto_1216 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1212 ?auto_1210 )
      ( DELIVER-2PKG-VERIFY ?auto_1211 ?auto_1212 ?auto_1210 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1218 - OBJ
      ?auto_1219 - OBJ
      ?auto_1217 - LOCATION
    )
    :vars
    (
      ?auto_1221 - LOCATION
      ?auto_1222 - CITY
      ?auto_1220 - TRUCK
      ?auto_1223 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_1221 ?auto_1222 ) ( IN-CITY ?auto_1217 ?auto_1222 ) ( not ( = ?auto_1217 ?auto_1221 ) ) ( not ( = ?auto_1219 ?auto_1218 ) ) ( OBJ-AT ?auto_1218 ?auto_1221 ) ( TRUCK-AT ?auto_1220 ?auto_1223 ) ( IN-CITY ?auto_1223 ?auto_1222 ) ( not ( = ?auto_1217 ?auto_1223 ) ) ( not ( = ?auto_1221 ?auto_1223 ) ) ( OBJ-AT ?auto_1219 ?auto_1223 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1219 ?auto_1218 ?auto_1217 )
      ( DELIVER-2PKG-VERIFY ?auto_1218 ?auto_1219 ?auto_1217 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1233 - OBJ
      ?auto_1232 - LOCATION
    )
    :vars
    (
      ?auto_1236 - LOCATION
      ?auto_1237 - CITY
      ?auto_1234 - OBJ
      ?auto_1238 - LOCATION
      ?auto_1235 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1236 ?auto_1237 ) ( IN-CITY ?auto_1232 ?auto_1237 ) ( not ( = ?auto_1232 ?auto_1236 ) ) ( not ( = ?auto_1234 ?auto_1233 ) ) ( OBJ-AT ?auto_1233 ?auto_1236 ) ( IN-CITY ?auto_1238 ?auto_1237 ) ( not ( = ?auto_1232 ?auto_1238 ) ) ( not ( = ?auto_1236 ?auto_1238 ) ) ( OBJ-AT ?auto_1234 ?auto_1238 ) ( TRUCK-AT ?auto_1235 ?auto_1232 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1235 ?auto_1232 ?auto_1238 ?auto_1237 )
      ( DELIVER-2PKG ?auto_1234 ?auto_1233 ?auto_1232 )
      ( DELIVER-1PKG-VERIFY ?auto_1233 ?auto_1232 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1240 - OBJ
      ?auto_1241 - OBJ
      ?auto_1239 - LOCATION
    )
    :vars
    (
      ?auto_1243 - LOCATION
      ?auto_1244 - CITY
      ?auto_1242 - LOCATION
      ?auto_1245 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1243 ?auto_1244 ) ( IN-CITY ?auto_1239 ?auto_1244 ) ( not ( = ?auto_1239 ?auto_1243 ) ) ( not ( = ?auto_1240 ?auto_1241 ) ) ( OBJ-AT ?auto_1241 ?auto_1243 ) ( IN-CITY ?auto_1242 ?auto_1244 ) ( not ( = ?auto_1239 ?auto_1242 ) ) ( not ( = ?auto_1243 ?auto_1242 ) ) ( OBJ-AT ?auto_1240 ?auto_1242 ) ( TRUCK-AT ?auto_1245 ?auto_1239 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1241 ?auto_1239 )
      ( DELIVER-2PKG-VERIFY ?auto_1240 ?auto_1241 ?auto_1239 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1247 - OBJ
      ?auto_1248 - OBJ
      ?auto_1246 - LOCATION
    )
    :vars
    (
      ?auto_1251 - LOCATION
      ?auto_1252 - CITY
      ?auto_1249 - LOCATION
      ?auto_1250 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1251 ?auto_1252 ) ( IN-CITY ?auto_1246 ?auto_1252 ) ( not ( = ?auto_1246 ?auto_1251 ) ) ( not ( = ?auto_1248 ?auto_1247 ) ) ( OBJ-AT ?auto_1247 ?auto_1251 ) ( IN-CITY ?auto_1249 ?auto_1252 ) ( not ( = ?auto_1246 ?auto_1249 ) ) ( not ( = ?auto_1251 ?auto_1249 ) ) ( OBJ-AT ?auto_1248 ?auto_1249 ) ( TRUCK-AT ?auto_1250 ?auto_1246 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1248 ?auto_1247 ?auto_1246 )
      ( DELIVER-2PKG-VERIFY ?auto_1247 ?auto_1248 ?auto_1246 ) )
  )

)

