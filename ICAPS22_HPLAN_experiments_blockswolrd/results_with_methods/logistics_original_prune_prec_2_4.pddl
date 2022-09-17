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
      ?auto_972 - OBJ
      ?auto_971 - LOCATION
    )
    :vars
    (
      ?auto_973 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_973 ?auto_971 ) ( IN-TRUCK ?auto_972 ?auto_973 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_972 ?auto_973 ?auto_971 )
      ( DELIVER-1PKG-VERIFY ?auto_972 ?auto_971 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_979 - OBJ
      ?auto_978 - LOCATION
    )
    :vars
    (
      ?auto_980 - TRUCK
      ?auto_981 - LOCATION
      ?auto_982 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_979 ?auto_980 ) ( TRUCK-AT ?auto_980 ?auto_981 ) ( IN-CITY ?auto_981 ?auto_982 ) ( IN-CITY ?auto_978 ?auto_982 ) ( not ( = ?auto_978 ?auto_981 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_980 ?auto_981 ?auto_978 ?auto_982 )
      ( DELIVER-1PKG ?auto_979 ?auto_978 )
      ( DELIVER-1PKG-VERIFY ?auto_979 ?auto_978 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_990 - OBJ
      ?auto_989 - LOCATION
    )
    :vars
    (
      ?auto_991 - TRUCK
      ?auto_993 - LOCATION
      ?auto_992 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_991 ?auto_993 ) ( IN-CITY ?auto_993 ?auto_992 ) ( IN-CITY ?auto_989 ?auto_992 ) ( not ( = ?auto_989 ?auto_993 ) ) ( OBJ-AT ?auto_990 ?auto_993 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_990 ?auto_991 ?auto_993 )
      ( DELIVER-1PKG ?auto_990 ?auto_989 )
      ( DELIVER-1PKG-VERIFY ?auto_990 ?auto_989 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1001 - OBJ
      ?auto_1000 - LOCATION
    )
    :vars
    (
      ?auto_1004 - LOCATION
      ?auto_1003 - CITY
      ?auto_1002 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1004 ?auto_1003 ) ( IN-CITY ?auto_1000 ?auto_1003 ) ( not ( = ?auto_1000 ?auto_1004 ) ) ( OBJ-AT ?auto_1001 ?auto_1004 ) ( TRUCK-AT ?auto_1002 ?auto_1000 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1002 ?auto_1000 ?auto_1004 ?auto_1003 )
      ( DELIVER-1PKG ?auto_1001 ?auto_1000 )
      ( DELIVER-1PKG-VERIFY ?auto_1001 ?auto_1000 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1026 - OBJ
      ?auto_1027 - OBJ
      ?auto_1025 - LOCATION
    )
    :vars
    (
      ?auto_1028 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_1027 ?auto_1026 ) ) ( TRUCK-AT ?auto_1028 ?auto_1025 ) ( IN-TRUCK ?auto_1027 ?auto_1028 ) ( OBJ-AT ?auto_1026 ?auto_1025 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1027 ?auto_1025 )
      ( DELIVER-2PKG-VERIFY ?auto_1026 ?auto_1027 ?auto_1025 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1030 - OBJ
      ?auto_1031 - OBJ
      ?auto_1029 - LOCATION
    )
    :vars
    (
      ?auto_1032 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_1031 ?auto_1030 ) ) ( TRUCK-AT ?auto_1032 ?auto_1029 ) ( IN-TRUCK ?auto_1030 ?auto_1032 ) ( OBJ-AT ?auto_1031 ?auto_1029 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1030 ?auto_1029 )
      ( DELIVER-2PKG-VERIFY ?auto_1030 ?auto_1031 ?auto_1029 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1043 - OBJ
      ?auto_1044 - OBJ
      ?auto_1042 - LOCATION
    )
    :vars
    (
      ?auto_1046 - TRUCK
      ?auto_1047 - LOCATION
      ?auto_1045 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_1044 ?auto_1043 ) ) ( IN-TRUCK ?auto_1044 ?auto_1046 ) ( TRUCK-AT ?auto_1046 ?auto_1047 ) ( IN-CITY ?auto_1047 ?auto_1045 ) ( IN-CITY ?auto_1042 ?auto_1045 ) ( not ( = ?auto_1042 ?auto_1047 ) ) ( OBJ-AT ?auto_1043 ?auto_1042 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1044 ?auto_1042 )
      ( DELIVER-2PKG-VERIFY ?auto_1043 ?auto_1044 ?auto_1042 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1049 - OBJ
      ?auto_1050 - OBJ
      ?auto_1048 - LOCATION
    )
    :vars
    (
      ?auto_1051 - TRUCK
      ?auto_1052 - LOCATION
      ?auto_1053 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_1050 ?auto_1049 ) ) ( IN-TRUCK ?auto_1049 ?auto_1051 ) ( TRUCK-AT ?auto_1051 ?auto_1052 ) ( IN-CITY ?auto_1052 ?auto_1053 ) ( IN-CITY ?auto_1048 ?auto_1053 ) ( not ( = ?auto_1048 ?auto_1052 ) ) ( OBJ-AT ?auto_1050 ?auto_1048 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1050 ?auto_1049 ?auto_1048 )
      ( DELIVER-2PKG-VERIFY ?auto_1049 ?auto_1050 ?auto_1048 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1062 - OBJ
      ?auto_1061 - LOCATION
    )
    :vars
    (
      ?auto_1065 - OBJ
      ?auto_1063 - TRUCK
      ?auto_1064 - LOCATION
      ?auto_1066 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_1062 ?auto_1065 ) ) ( TRUCK-AT ?auto_1063 ?auto_1064 ) ( IN-CITY ?auto_1064 ?auto_1066 ) ( IN-CITY ?auto_1061 ?auto_1066 ) ( not ( = ?auto_1061 ?auto_1064 ) ) ( OBJ-AT ?auto_1065 ?auto_1061 ) ( OBJ-AT ?auto_1062 ?auto_1064 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_1062 ?auto_1063 ?auto_1064 )
      ( DELIVER-2PKG ?auto_1065 ?auto_1062 ?auto_1061 )
      ( DELIVER-1PKG-VERIFY ?auto_1062 ?auto_1061 ) )
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
      ?auto_1071 - TRUCK
      ?auto_1070 - LOCATION
      ?auto_1072 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_1069 ?auto_1068 ) ) ( TRUCK-AT ?auto_1071 ?auto_1070 ) ( IN-CITY ?auto_1070 ?auto_1072 ) ( IN-CITY ?auto_1067 ?auto_1072 ) ( not ( = ?auto_1067 ?auto_1070 ) ) ( OBJ-AT ?auto_1068 ?auto_1067 ) ( OBJ-AT ?auto_1069 ?auto_1070 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1069 ?auto_1067 )
      ( DELIVER-2PKG-VERIFY ?auto_1068 ?auto_1069 ?auto_1067 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1074 - OBJ
      ?auto_1075 - OBJ
      ?auto_1073 - LOCATION
    )
    :vars
    (
      ?auto_1077 - TRUCK
      ?auto_1078 - LOCATION
      ?auto_1076 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_1075 ?auto_1074 ) ) ( TRUCK-AT ?auto_1077 ?auto_1078 ) ( IN-CITY ?auto_1078 ?auto_1076 ) ( IN-CITY ?auto_1073 ?auto_1076 ) ( not ( = ?auto_1073 ?auto_1078 ) ) ( OBJ-AT ?auto_1075 ?auto_1073 ) ( OBJ-AT ?auto_1074 ?auto_1078 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1075 ?auto_1074 ?auto_1073 )
      ( DELIVER-2PKG-VERIFY ?auto_1074 ?auto_1075 ?auto_1073 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1087 - OBJ
      ?auto_1086 - LOCATION
    )
    :vars
    (
      ?auto_1090 - OBJ
      ?auto_1091 - LOCATION
      ?auto_1088 - CITY
      ?auto_1089 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_1087 ?auto_1090 ) ) ( IN-CITY ?auto_1091 ?auto_1088 ) ( IN-CITY ?auto_1086 ?auto_1088 ) ( not ( = ?auto_1086 ?auto_1091 ) ) ( OBJ-AT ?auto_1090 ?auto_1086 ) ( OBJ-AT ?auto_1087 ?auto_1091 ) ( TRUCK-AT ?auto_1089 ?auto_1086 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1089 ?auto_1086 ?auto_1091 ?auto_1088 )
      ( DELIVER-2PKG ?auto_1090 ?auto_1087 ?auto_1086 )
      ( DELIVER-1PKG-VERIFY ?auto_1087 ?auto_1086 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1093 - OBJ
      ?auto_1094 - OBJ
      ?auto_1092 - LOCATION
    )
    :vars
    (
      ?auto_1095 - LOCATION
      ?auto_1096 - CITY
      ?auto_1097 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_1094 ?auto_1093 ) ) ( IN-CITY ?auto_1095 ?auto_1096 ) ( IN-CITY ?auto_1092 ?auto_1096 ) ( not ( = ?auto_1092 ?auto_1095 ) ) ( OBJ-AT ?auto_1093 ?auto_1092 ) ( OBJ-AT ?auto_1094 ?auto_1095 ) ( TRUCK-AT ?auto_1097 ?auto_1092 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1094 ?auto_1092 )
      ( DELIVER-2PKG-VERIFY ?auto_1093 ?auto_1094 ?auto_1092 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1099 - OBJ
      ?auto_1100 - OBJ
      ?auto_1098 - LOCATION
    )
    :vars
    (
      ?auto_1101 - LOCATION
      ?auto_1103 - CITY
      ?auto_1102 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_1100 ?auto_1099 ) ) ( IN-CITY ?auto_1101 ?auto_1103 ) ( IN-CITY ?auto_1098 ?auto_1103 ) ( not ( = ?auto_1098 ?auto_1101 ) ) ( OBJ-AT ?auto_1100 ?auto_1098 ) ( OBJ-AT ?auto_1099 ?auto_1101 ) ( TRUCK-AT ?auto_1102 ?auto_1098 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1100 ?auto_1099 ?auto_1098 )
      ( DELIVER-2PKG-VERIFY ?auto_1099 ?auto_1100 ?auto_1098 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1112 - OBJ
      ?auto_1111 - LOCATION
    )
    :vars
    (
      ?auto_1116 - OBJ
      ?auto_1113 - LOCATION
      ?auto_1115 - CITY
      ?auto_1114 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_1112 ?auto_1116 ) ) ( IN-CITY ?auto_1113 ?auto_1115 ) ( IN-CITY ?auto_1111 ?auto_1115 ) ( not ( = ?auto_1111 ?auto_1113 ) ) ( OBJ-AT ?auto_1112 ?auto_1113 ) ( TRUCK-AT ?auto_1114 ?auto_1111 ) ( IN-TRUCK ?auto_1116 ?auto_1114 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1116 ?auto_1111 )
      ( DELIVER-2PKG ?auto_1116 ?auto_1112 ?auto_1111 )
      ( DELIVER-1PKG-VERIFY ?auto_1112 ?auto_1111 ) )
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
    )
    :precondition
    ( and ( not ( = ?auto_1119 ?auto_1118 ) ) ( IN-CITY ?auto_1121 ?auto_1120 ) ( IN-CITY ?auto_1117 ?auto_1120 ) ( not ( = ?auto_1117 ?auto_1121 ) ) ( OBJ-AT ?auto_1119 ?auto_1121 ) ( TRUCK-AT ?auto_1122 ?auto_1117 ) ( IN-TRUCK ?auto_1118 ?auto_1122 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1119 ?auto_1117 )
      ( DELIVER-2PKG-VERIFY ?auto_1118 ?auto_1119 ?auto_1117 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1124 - OBJ
      ?auto_1125 - OBJ
      ?auto_1123 - LOCATION
    )
    :vars
    (
      ?auto_1127 - LOCATION
      ?auto_1126 - CITY
      ?auto_1128 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_1125 ?auto_1124 ) ) ( IN-CITY ?auto_1127 ?auto_1126 ) ( IN-CITY ?auto_1123 ?auto_1126 ) ( not ( = ?auto_1123 ?auto_1127 ) ) ( OBJ-AT ?auto_1124 ?auto_1127 ) ( TRUCK-AT ?auto_1128 ?auto_1123 ) ( IN-TRUCK ?auto_1125 ?auto_1128 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1125 ?auto_1124 ?auto_1123 )
      ( DELIVER-2PKG-VERIFY ?auto_1124 ?auto_1125 ?auto_1123 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1137 - OBJ
      ?auto_1136 - LOCATION
    )
    :vars
    (
      ?auto_1140 - OBJ
      ?auto_1139 - LOCATION
      ?auto_1138 - CITY
      ?auto_1141 - TRUCK
      ?auto_1142 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_1137 ?auto_1140 ) ) ( IN-CITY ?auto_1139 ?auto_1138 ) ( IN-CITY ?auto_1136 ?auto_1138 ) ( not ( = ?auto_1136 ?auto_1139 ) ) ( OBJ-AT ?auto_1137 ?auto_1139 ) ( IN-TRUCK ?auto_1140 ?auto_1141 ) ( TRUCK-AT ?auto_1141 ?auto_1142 ) ( IN-CITY ?auto_1142 ?auto_1138 ) ( not ( = ?auto_1136 ?auto_1142 ) ) ( not ( = ?auto_1139 ?auto_1142 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1141 ?auto_1142 ?auto_1136 ?auto_1138 )
      ( DELIVER-2PKG ?auto_1140 ?auto_1137 ?auto_1136 )
      ( DELIVER-1PKG-VERIFY ?auto_1137 ?auto_1136 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1144 - OBJ
      ?auto_1145 - OBJ
      ?auto_1143 - LOCATION
    )
    :vars
    (
      ?auto_1147 - LOCATION
      ?auto_1149 - CITY
      ?auto_1146 - TRUCK
      ?auto_1148 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_1145 ?auto_1144 ) ) ( IN-CITY ?auto_1147 ?auto_1149 ) ( IN-CITY ?auto_1143 ?auto_1149 ) ( not ( = ?auto_1143 ?auto_1147 ) ) ( OBJ-AT ?auto_1145 ?auto_1147 ) ( IN-TRUCK ?auto_1144 ?auto_1146 ) ( TRUCK-AT ?auto_1146 ?auto_1148 ) ( IN-CITY ?auto_1148 ?auto_1149 ) ( not ( = ?auto_1143 ?auto_1148 ) ) ( not ( = ?auto_1147 ?auto_1148 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1145 ?auto_1143 )
      ( DELIVER-2PKG-VERIFY ?auto_1144 ?auto_1145 ?auto_1143 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1151 - OBJ
      ?auto_1152 - OBJ
      ?auto_1150 - LOCATION
    )
    :vars
    (
      ?auto_1154 - LOCATION
      ?auto_1153 - CITY
      ?auto_1155 - TRUCK
      ?auto_1156 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_1152 ?auto_1151 ) ) ( IN-CITY ?auto_1154 ?auto_1153 ) ( IN-CITY ?auto_1150 ?auto_1153 ) ( not ( = ?auto_1150 ?auto_1154 ) ) ( OBJ-AT ?auto_1151 ?auto_1154 ) ( IN-TRUCK ?auto_1152 ?auto_1155 ) ( TRUCK-AT ?auto_1155 ?auto_1156 ) ( IN-CITY ?auto_1156 ?auto_1153 ) ( not ( = ?auto_1150 ?auto_1156 ) ) ( not ( = ?auto_1154 ?auto_1156 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1152 ?auto_1151 ?auto_1150 )
      ( DELIVER-2PKG-VERIFY ?auto_1151 ?auto_1152 ?auto_1150 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1166 - OBJ
      ?auto_1165 - LOCATION
    )
    :vars
    (
      ?auto_1171 - OBJ
      ?auto_1168 - LOCATION
      ?auto_1167 - CITY
      ?auto_1169 - TRUCK
      ?auto_1170 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_1166 ?auto_1171 ) ) ( IN-CITY ?auto_1168 ?auto_1167 ) ( IN-CITY ?auto_1165 ?auto_1167 ) ( not ( = ?auto_1165 ?auto_1168 ) ) ( OBJ-AT ?auto_1166 ?auto_1168 ) ( TRUCK-AT ?auto_1169 ?auto_1170 ) ( IN-CITY ?auto_1170 ?auto_1167 ) ( not ( = ?auto_1165 ?auto_1170 ) ) ( not ( = ?auto_1168 ?auto_1170 ) ) ( OBJ-AT ?auto_1171 ?auto_1170 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_1171 ?auto_1169 ?auto_1170 )
      ( DELIVER-2PKG ?auto_1171 ?auto_1166 ?auto_1165 )
      ( DELIVER-1PKG-VERIFY ?auto_1166 ?auto_1165 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1173 - OBJ
      ?auto_1174 - OBJ
      ?auto_1172 - LOCATION
    )
    :vars
    (
      ?auto_1177 - LOCATION
      ?auto_1176 - CITY
      ?auto_1175 - TRUCK
      ?auto_1178 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_1174 ?auto_1173 ) ) ( IN-CITY ?auto_1177 ?auto_1176 ) ( IN-CITY ?auto_1172 ?auto_1176 ) ( not ( = ?auto_1172 ?auto_1177 ) ) ( OBJ-AT ?auto_1174 ?auto_1177 ) ( TRUCK-AT ?auto_1175 ?auto_1178 ) ( IN-CITY ?auto_1178 ?auto_1176 ) ( not ( = ?auto_1172 ?auto_1178 ) ) ( not ( = ?auto_1177 ?auto_1178 ) ) ( OBJ-AT ?auto_1173 ?auto_1178 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1174 ?auto_1172 )
      ( DELIVER-2PKG-VERIFY ?auto_1173 ?auto_1174 ?auto_1172 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1180 - OBJ
      ?auto_1181 - OBJ
      ?auto_1179 - LOCATION
    )
    :vars
    (
      ?auto_1183 - LOCATION
      ?auto_1182 - CITY
      ?auto_1185 - TRUCK
      ?auto_1184 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_1181 ?auto_1180 ) ) ( IN-CITY ?auto_1183 ?auto_1182 ) ( IN-CITY ?auto_1179 ?auto_1182 ) ( not ( = ?auto_1179 ?auto_1183 ) ) ( OBJ-AT ?auto_1180 ?auto_1183 ) ( TRUCK-AT ?auto_1185 ?auto_1184 ) ( IN-CITY ?auto_1184 ?auto_1182 ) ( not ( = ?auto_1179 ?auto_1184 ) ) ( not ( = ?auto_1183 ?auto_1184 ) ) ( OBJ-AT ?auto_1181 ?auto_1184 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1181 ?auto_1180 ?auto_1179 )
      ( DELIVER-2PKG-VERIFY ?auto_1180 ?auto_1181 ?auto_1179 ) )
  )

)

