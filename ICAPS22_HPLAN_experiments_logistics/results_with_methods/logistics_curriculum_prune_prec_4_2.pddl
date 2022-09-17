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
      ?auto_1082 - OBJ
      ?auto_1083 - LOCATION
    )
    :vars
    (
      ?auto_1092 - LOCATION
      ?auto_1089 - CITY
      ?auto_1084 - TRUCK
      ?auto_1095 - LOCATION
      ?auto_1096 - CITY
    )
    :precondition
    ( and ( IN-CITY ?auto_1092 ?auto_1089 ) ( IN-CITY ?auto_1083 ?auto_1089 ) ( not ( = ?auto_1083 ?auto_1092 ) ) ( OBJ-AT ?auto_1082 ?auto_1092 ) ( TRUCK-AT ?auto_1084 ?auto_1095 ) ( IN-CITY ?auto_1095 ?auto_1096 ) ( IN-CITY ?auto_1092 ?auto_1096 ) ( not ( = ?auto_1092 ?auto_1095 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1084 ?auto_1095 ?auto_1092 ?auto_1096 )
      ( !LOAD-TRUCK ?auto_1082 ?auto_1084 ?auto_1092 )
      ( !DRIVE-TRUCK ?auto_1084 ?auto_1092 ?auto_1083 ?auto_1089 )
      ( !UNLOAD-TRUCK ?auto_1082 ?auto_1084 ?auto_1083 )
      ( DELIVER-1PKG-VERIFY ?auto_1082 ?auto_1083 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1119 - OBJ
      ?auto_1121 - OBJ
      ?auto_1125 - LOCATION
    )
    :vars
    (
      ?auto_1127 - LOCATION
      ?auto_1122 - CITY
      ?auto_1128 - CITY
      ?auto_1132 - LOCATION
      ?auto_1133 - CITY
      ?auto_1124 - TRUCK
      ?auto_1134 - LOCATION
      ?auto_1130 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1121 ?auto_1119 ) ( IN-CITY ?auto_1127 ?auto_1122 ) ( IN-CITY ?auto_1125 ?auto_1122 ) ( not ( = ?auto_1125 ?auto_1127 ) ) ( OBJ-AT ?auto_1121 ?auto_1127 ) ( IN-CITY ?auto_1125 ?auto_1128 ) ( IN-CITY ?auto_1127 ?auto_1128 ) ( IN-CITY ?auto_1132 ?auto_1133 ) ( IN-CITY ?auto_1125 ?auto_1133 ) ( not ( = ?auto_1125 ?auto_1132 ) ) ( OBJ-AT ?auto_1119 ?auto_1132 ) ( TRUCK-AT ?auto_1124 ?auto_1134 ) ( IN-CITY ?auto_1134 ?auto_1130 ) ( IN-CITY ?auto_1132 ?auto_1130 ) ( not ( = ?auto_1132 ?auto_1134 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1119 ?auto_1125 )
      ( DELIVER-1PKG ?auto_1121 ?auto_1125 )
      ( DELIVER-2PKG-VERIFY ?auto_1119 ?auto_1121 ?auto_1125 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1158 - OBJ
      ?auto_1160 - OBJ
      ?auto_1161 - OBJ
      ?auto_1166 - LOCATION
    )
    :vars
    (
      ?auto_1167 - LOCATION
      ?auto_1165 - CITY
      ?auto_1164 - CITY
      ?auto_1175 - LOCATION
      ?auto_1172 - CITY
      ?auto_1173 - CITY
      ?auto_1178 - LOCATION
      ?auto_1176 - CITY
      ?auto_1163 - TRUCK
      ?auto_1177 - LOCATION
      ?auto_1179 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1160 ?auto_1158 ) ( GREATER-THAN ?auto_1161 ?auto_1158 ) ( GREATER-THAN ?auto_1161 ?auto_1160 ) ( IN-CITY ?auto_1167 ?auto_1165 ) ( IN-CITY ?auto_1166 ?auto_1165 ) ( not ( = ?auto_1166 ?auto_1167 ) ) ( OBJ-AT ?auto_1161 ?auto_1167 ) ( IN-CITY ?auto_1166 ?auto_1164 ) ( IN-CITY ?auto_1167 ?auto_1164 ) ( IN-CITY ?auto_1175 ?auto_1172 ) ( IN-CITY ?auto_1166 ?auto_1172 ) ( not ( = ?auto_1166 ?auto_1175 ) ) ( OBJ-AT ?auto_1160 ?auto_1175 ) ( IN-CITY ?auto_1166 ?auto_1173 ) ( IN-CITY ?auto_1175 ?auto_1173 ) ( IN-CITY ?auto_1178 ?auto_1176 ) ( IN-CITY ?auto_1166 ?auto_1176 ) ( not ( = ?auto_1166 ?auto_1178 ) ) ( OBJ-AT ?auto_1158 ?auto_1178 ) ( TRUCK-AT ?auto_1163 ?auto_1177 ) ( IN-CITY ?auto_1177 ?auto_1179 ) ( IN-CITY ?auto_1178 ?auto_1179 ) ( not ( = ?auto_1178 ?auto_1177 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1158 ?auto_1160 ?auto_1166 )
      ( DELIVER-1PKG ?auto_1161 ?auto_1166 )
      ( DELIVER-3PKG-VERIFY ?auto_1158 ?auto_1160 ?auto_1161 ?auto_1166 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_1203 - OBJ
      ?auto_1205 - OBJ
      ?auto_1206 - OBJ
      ?auto_1207 - OBJ
      ?auto_1213 - LOCATION
    )
    :vars
    (
      ?auto_1208 - LOCATION
      ?auto_1210 - CITY
      ?auto_1214 - CITY
      ?auto_1228 - LOCATION
      ?auto_1217 - CITY
      ?auto_1218 - CITY
      ?auto_1222 - LOCATION
      ?auto_1225 - CITY
      ?auto_1223 - CITY
      ?auto_1219 - LOCATION
      ?auto_1224 - CITY
      ?auto_1212 - TRUCK
      ?auto_1227 - LOCATION
      ?auto_1215 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1205 ?auto_1203 ) ( GREATER-THAN ?auto_1206 ?auto_1203 ) ( GREATER-THAN ?auto_1206 ?auto_1205 ) ( GREATER-THAN ?auto_1207 ?auto_1203 ) ( GREATER-THAN ?auto_1207 ?auto_1205 ) ( GREATER-THAN ?auto_1207 ?auto_1206 ) ( IN-CITY ?auto_1208 ?auto_1210 ) ( IN-CITY ?auto_1213 ?auto_1210 ) ( not ( = ?auto_1213 ?auto_1208 ) ) ( OBJ-AT ?auto_1207 ?auto_1208 ) ( IN-CITY ?auto_1213 ?auto_1214 ) ( IN-CITY ?auto_1208 ?auto_1214 ) ( IN-CITY ?auto_1228 ?auto_1217 ) ( IN-CITY ?auto_1213 ?auto_1217 ) ( not ( = ?auto_1213 ?auto_1228 ) ) ( OBJ-AT ?auto_1206 ?auto_1228 ) ( IN-CITY ?auto_1213 ?auto_1218 ) ( IN-CITY ?auto_1228 ?auto_1218 ) ( IN-CITY ?auto_1222 ?auto_1225 ) ( IN-CITY ?auto_1213 ?auto_1225 ) ( not ( = ?auto_1213 ?auto_1222 ) ) ( OBJ-AT ?auto_1205 ?auto_1222 ) ( IN-CITY ?auto_1213 ?auto_1223 ) ( IN-CITY ?auto_1222 ?auto_1223 ) ( IN-CITY ?auto_1219 ?auto_1224 ) ( IN-CITY ?auto_1213 ?auto_1224 ) ( not ( = ?auto_1213 ?auto_1219 ) ) ( OBJ-AT ?auto_1203 ?auto_1219 ) ( TRUCK-AT ?auto_1212 ?auto_1227 ) ( IN-CITY ?auto_1227 ?auto_1215 ) ( IN-CITY ?auto_1219 ?auto_1215 ) ( not ( = ?auto_1219 ?auto_1227 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_1203 ?auto_1205 ?auto_1206 ?auto_1213 )
      ( DELIVER-1PKG ?auto_1207 ?auto_1213 )
      ( DELIVER-4PKG-VERIFY ?auto_1203 ?auto_1205 ?auto_1206 ?auto_1207 ?auto_1213 ) )
  )

)

