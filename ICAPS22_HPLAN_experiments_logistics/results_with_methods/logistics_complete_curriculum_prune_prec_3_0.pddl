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

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1037 - OBJ
      ?auto_1038 - LOCATION
    )
    :vars
    (
      ?auto_1039 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_1039 ?auto_1038 ) ( IN-TRUCK ?auto_1037 ?auto_1039 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_1037 ?auto_1039 ?auto_1038 )
      ( DELIVER-1PKG-VERIFY ?auto_1037 ?auto_1038 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1044 - OBJ
      ?auto_1045 - LOCATION
    )
    :vars
    (
      ?auto_1046 - TRUCK
      ?auto_1050 - LOCATION
      ?auto_1051 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_1044 ?auto_1046 ) ( TRUCK-AT ?auto_1046 ?auto_1050 ) ( IN-CITY ?auto_1050 ?auto_1051 ) ( IN-CITY ?auto_1045 ?auto_1051 ) ( not ( = ?auto_1045 ?auto_1050 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1046 ?auto_1050 ?auto_1045 ?auto_1051 )
      ( DELIVER-1PKG ?auto_1044 ?auto_1045 )
      ( DELIVER-1PKG-VERIFY ?auto_1044 ?auto_1045 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1055 - OBJ
      ?auto_1056 - LOCATION
    )
    :vars
    (
      ?auto_1057 - TRUCK
      ?auto_1059 - LOCATION
      ?auto_1060 - CITY
      ?auto_1063 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?auto_1057 ?auto_1059 ) ( IN-CITY ?auto_1059 ?auto_1060 ) ( IN-CITY ?auto_1056 ?auto_1060 ) ( not ( = ?auto_1056 ?auto_1059 ) ) ( TRUCK-AT ?auto_1057 ?auto_1063 ) ( OBJ-AT ?auto_1055 ?auto_1063 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_1055 ?auto_1057 ?auto_1063 )
      ( DELIVER-1PKG ?auto_1055 ?auto_1056 )
      ( DELIVER-1PKG-VERIFY ?auto_1055 ?auto_1056 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1067 - OBJ
      ?auto_1068 - LOCATION
    )
    :vars
    (
      ?auto_1069 - LOCATION
      ?auto_1072 - CITY
      ?auto_1071 - TRUCK
      ?auto_1076 - LOCATION
      ?auto_1077 - CITY
    )
    :precondition
    ( and ( IN-CITY ?auto_1069 ?auto_1072 ) ( IN-CITY ?auto_1068 ?auto_1072 ) ( not ( = ?auto_1068 ?auto_1069 ) ) ( OBJ-AT ?auto_1067 ?auto_1069 ) ( TRUCK-AT ?auto_1071 ?auto_1076 ) ( IN-CITY ?auto_1076 ?auto_1077 ) ( IN-CITY ?auto_1069 ?auto_1077 ) ( not ( = ?auto_1069 ?auto_1076 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1071 ?auto_1076 ?auto_1069 ?auto_1077 )
      ( DELIVER-1PKG ?auto_1067 ?auto_1068 )
      ( DELIVER-1PKG-VERIFY ?auto_1067 ?auto_1068 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1126 - OBJ
      ?auto_1128 - OBJ
      ?auto_1127 - LOCATION
    )
    :vars
    (
      ?auto_1129 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1128 ?auto_1126 ) ( TRUCK-AT ?auto_1129 ?auto_1127 ) ( IN-TRUCK ?auto_1128 ?auto_1129 ) ( OBJ-AT ?auto_1126 ?auto_1127 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1128 ?auto_1127 )
      ( DELIVER-2PKG-VERIFY ?auto_1126 ?auto_1128 ?auto_1127 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1135 - OBJ
      ?auto_1137 - OBJ
      ?auto_1136 - LOCATION
    )
    :vars
    (
      ?auto_1142 - TRUCK
      ?auto_1139 - LOCATION
      ?auto_1141 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1137 ?auto_1135 ) ( IN-TRUCK ?auto_1137 ?auto_1142 ) ( TRUCK-AT ?auto_1142 ?auto_1139 ) ( IN-CITY ?auto_1139 ?auto_1141 ) ( IN-CITY ?auto_1136 ?auto_1141 ) ( not ( = ?auto_1136 ?auto_1139 ) ) ( OBJ-AT ?auto_1135 ?auto_1136 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1137 ?auto_1136 )
      ( DELIVER-2PKG-VERIFY ?auto_1135 ?auto_1137 ?auto_1136 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1146 - OBJ
      ?auto_1148 - OBJ
      ?auto_1147 - LOCATION
    )
    :vars
    (
      ?auto_1152 - TRUCK
      ?auto_1150 - LOCATION
      ?auto_1153 - CITY
      ?auto_1151 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1148 ?auto_1146 ) ( TRUCK-AT ?auto_1152 ?auto_1150 ) ( IN-CITY ?auto_1150 ?auto_1153 ) ( IN-CITY ?auto_1147 ?auto_1153 ) ( not ( = ?auto_1147 ?auto_1150 ) ) ( TRUCK-AT ?auto_1152 ?auto_1151 ) ( OBJ-AT ?auto_1148 ?auto_1151 ) ( OBJ-AT ?auto_1146 ?auto_1147 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1148 ?auto_1147 )
      ( DELIVER-2PKG-VERIFY ?auto_1146 ?auto_1148 ?auto_1147 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1158 - OBJ
      ?auto_1160 - OBJ
      ?auto_1159 - LOCATION
    )
    :vars
    (
      ?auto_1163 - LOCATION
      ?auto_1164 - CITY
      ?auto_1161 - TRUCK
      ?auto_1166 - LOCATION
      ?auto_1167 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1160 ?auto_1158 ) ( IN-CITY ?auto_1163 ?auto_1164 ) ( IN-CITY ?auto_1159 ?auto_1164 ) ( not ( = ?auto_1159 ?auto_1163 ) ) ( OBJ-AT ?auto_1160 ?auto_1163 ) ( TRUCK-AT ?auto_1161 ?auto_1166 ) ( IN-CITY ?auto_1166 ?auto_1167 ) ( IN-CITY ?auto_1163 ?auto_1167 ) ( not ( = ?auto_1163 ?auto_1166 ) ) ( OBJ-AT ?auto_1158 ?auto_1159 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1160 ?auto_1159 )
      ( DELIVER-2PKG-VERIFY ?auto_1158 ?auto_1160 ?auto_1159 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1174 - OBJ
      ?auto_1173 - OBJ
      ?auto_1172 - LOCATION
    )
    :vars
    (
      ?auto_1179 - LOCATION
      ?auto_1178 - CITY
      ?auto_1175 - TRUCK
      ?auto_1177 - LOCATION
      ?auto_1176 - CITY
      ?auto_1182 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1173 ?auto_1174 ) ( IN-CITY ?auto_1179 ?auto_1178 ) ( IN-CITY ?auto_1172 ?auto_1178 ) ( not ( = ?auto_1172 ?auto_1179 ) ) ( OBJ-AT ?auto_1173 ?auto_1179 ) ( TRUCK-AT ?auto_1175 ?auto_1177 ) ( IN-CITY ?auto_1177 ?auto_1176 ) ( IN-CITY ?auto_1179 ?auto_1176 ) ( not ( = ?auto_1179 ?auto_1177 ) ) ( TRUCK-AT ?auto_1182 ?auto_1172 ) ( IN-TRUCK ?auto_1174 ?auto_1182 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1174 ?auto_1172 )
      ( DELIVER-2PKG ?auto_1174 ?auto_1173 ?auto_1172 )
      ( DELIVER-2PKG-VERIFY ?auto_1174 ?auto_1173 ?auto_1172 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1188 - OBJ
      ?auto_1190 - OBJ
      ?auto_1189 - LOCATION
    )
    :vars
    (
      ?auto_1191 - LOCATION
      ?auto_1192 - CITY
      ?auto_1195 - CITY
      ?auto_1197 - TRUCK
      ?auto_1201 - LOCATION
      ?auto_1202 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1190 ?auto_1188 ) ( IN-CITY ?auto_1191 ?auto_1192 ) ( IN-CITY ?auto_1189 ?auto_1192 ) ( not ( = ?auto_1189 ?auto_1191 ) ) ( OBJ-AT ?auto_1190 ?auto_1191 ) ( IN-CITY ?auto_1189 ?auto_1195 ) ( IN-CITY ?auto_1191 ?auto_1195 ) ( IN-TRUCK ?auto_1188 ?auto_1197 ) ( TRUCK-AT ?auto_1197 ?auto_1201 ) ( IN-CITY ?auto_1201 ?auto_1202 ) ( IN-CITY ?auto_1189 ?auto_1202 ) ( not ( = ?auto_1189 ?auto_1201 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1197 ?auto_1201 ?auto_1189 ?auto_1202 )
      ( DELIVER-2PKG ?auto_1188 ?auto_1190 ?auto_1189 )
      ( DELIVER-2PKG-VERIFY ?auto_1188 ?auto_1190 ?auto_1189 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1207 - OBJ
      ?auto_1209 - OBJ
      ?auto_1208 - LOCATION
    )
    :vars
    (
      ?auto_1214 - LOCATION
      ?auto_1211 - CITY
      ?auto_1210 - CITY
      ?auto_1215 - TRUCK
      ?auto_1217 - LOCATION
      ?auto_1218 - CITY
      ?auto_1220 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1209 ?auto_1207 ) ( IN-CITY ?auto_1214 ?auto_1211 ) ( IN-CITY ?auto_1208 ?auto_1211 ) ( not ( = ?auto_1208 ?auto_1214 ) ) ( OBJ-AT ?auto_1209 ?auto_1214 ) ( IN-CITY ?auto_1208 ?auto_1210 ) ( IN-CITY ?auto_1214 ?auto_1210 ) ( TRUCK-AT ?auto_1215 ?auto_1217 ) ( IN-CITY ?auto_1217 ?auto_1218 ) ( IN-CITY ?auto_1208 ?auto_1218 ) ( not ( = ?auto_1208 ?auto_1217 ) ) ( TRUCK-AT ?auto_1215 ?auto_1220 ) ( OBJ-AT ?auto_1207 ?auto_1220 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_1207 ?auto_1215 ?auto_1220 )
      ( DELIVER-2PKG ?auto_1207 ?auto_1209 ?auto_1208 )
      ( DELIVER-2PKG-VERIFY ?auto_1207 ?auto_1209 ?auto_1208 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1225 - OBJ
      ?auto_1227 - OBJ
      ?auto_1226 - LOCATION
    )
    :vars
    (
      ?auto_1233 - LOCATION
      ?auto_1235 - CITY
      ?auto_1236 - CITY
      ?auto_1237 - LOCATION
      ?auto_1231 - CITY
      ?auto_1229 - TRUCK
      ?auto_1239 - LOCATION
      ?auto_1240 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1227 ?auto_1225 ) ( IN-CITY ?auto_1233 ?auto_1235 ) ( IN-CITY ?auto_1226 ?auto_1235 ) ( not ( = ?auto_1226 ?auto_1233 ) ) ( OBJ-AT ?auto_1227 ?auto_1233 ) ( IN-CITY ?auto_1226 ?auto_1236 ) ( IN-CITY ?auto_1233 ?auto_1236 ) ( IN-CITY ?auto_1237 ?auto_1231 ) ( IN-CITY ?auto_1226 ?auto_1231 ) ( not ( = ?auto_1226 ?auto_1237 ) ) ( OBJ-AT ?auto_1225 ?auto_1237 ) ( TRUCK-AT ?auto_1229 ?auto_1239 ) ( IN-CITY ?auto_1239 ?auto_1240 ) ( IN-CITY ?auto_1237 ?auto_1240 ) ( not ( = ?auto_1237 ?auto_1239 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1229 ?auto_1239 ?auto_1237 ?auto_1240 )
      ( DELIVER-2PKG ?auto_1225 ?auto_1227 ?auto_1226 )
      ( DELIVER-2PKG-VERIFY ?auto_1225 ?auto_1227 ?auto_1226 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1290 - OBJ
      ?auto_1292 - OBJ
      ?auto_1293 - OBJ
      ?auto_1291 - LOCATION
    )
    :vars
    (
      ?auto_1295 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1292 ?auto_1290 ) ( GREATER-THAN ?auto_1293 ?auto_1290 ) ( GREATER-THAN ?auto_1293 ?auto_1292 ) ( TRUCK-AT ?auto_1295 ?auto_1291 ) ( IN-TRUCK ?auto_1293 ?auto_1295 ) ( OBJ-AT ?auto_1290 ?auto_1291 ) ( OBJ-AT ?auto_1292 ?auto_1291 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1293 ?auto_1291 )
      ( DELIVER-3PKG-VERIFY ?auto_1290 ?auto_1292 ?auto_1293 ?auto_1291 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1301 - OBJ
      ?auto_1303 - OBJ
      ?auto_1304 - OBJ
      ?auto_1302 - LOCATION
    )
    :vars
    (
      ?auto_1305 - TRUCK
      ?auto_1306 - LOCATION
      ?auto_1307 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1303 ?auto_1301 ) ( GREATER-THAN ?auto_1304 ?auto_1301 ) ( GREATER-THAN ?auto_1304 ?auto_1303 ) ( IN-TRUCK ?auto_1304 ?auto_1305 ) ( TRUCK-AT ?auto_1305 ?auto_1306 ) ( IN-CITY ?auto_1306 ?auto_1307 ) ( IN-CITY ?auto_1302 ?auto_1307 ) ( not ( = ?auto_1302 ?auto_1306 ) ) ( OBJ-AT ?auto_1301 ?auto_1302 ) ( OBJ-AT ?auto_1303 ?auto_1302 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1304 ?auto_1302 )
      ( DELIVER-3PKG-VERIFY ?auto_1301 ?auto_1303 ?auto_1304 ?auto_1302 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1314 - OBJ
      ?auto_1316 - OBJ
      ?auto_1317 - OBJ
      ?auto_1315 - LOCATION
    )
    :vars
    (
      ?auto_1323 - TRUCK
      ?auto_1319 - LOCATION
      ?auto_1321 - CITY
      ?auto_1322 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1316 ?auto_1314 ) ( GREATER-THAN ?auto_1317 ?auto_1314 ) ( GREATER-THAN ?auto_1317 ?auto_1316 ) ( TRUCK-AT ?auto_1323 ?auto_1319 ) ( IN-CITY ?auto_1319 ?auto_1321 ) ( IN-CITY ?auto_1315 ?auto_1321 ) ( not ( = ?auto_1315 ?auto_1319 ) ) ( TRUCK-AT ?auto_1323 ?auto_1322 ) ( OBJ-AT ?auto_1317 ?auto_1322 ) ( OBJ-AT ?auto_1314 ?auto_1315 ) ( OBJ-AT ?auto_1316 ?auto_1315 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1317 ?auto_1315 )
      ( DELIVER-3PKG-VERIFY ?auto_1314 ?auto_1316 ?auto_1317 ?auto_1315 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1328 - OBJ
      ?auto_1330 - OBJ
      ?auto_1331 - OBJ
      ?auto_1329 - LOCATION
    )
    :vars
    (
      ?auto_1336 - LOCATION
      ?auto_1335 - CITY
      ?auto_1333 - TRUCK
      ?auto_1332 - LOCATION
      ?auto_1334 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1330 ?auto_1328 ) ( GREATER-THAN ?auto_1331 ?auto_1328 ) ( GREATER-THAN ?auto_1331 ?auto_1330 ) ( IN-CITY ?auto_1336 ?auto_1335 ) ( IN-CITY ?auto_1329 ?auto_1335 ) ( not ( = ?auto_1329 ?auto_1336 ) ) ( OBJ-AT ?auto_1331 ?auto_1336 ) ( TRUCK-AT ?auto_1333 ?auto_1332 ) ( IN-CITY ?auto_1332 ?auto_1334 ) ( IN-CITY ?auto_1336 ?auto_1334 ) ( not ( = ?auto_1336 ?auto_1332 ) ) ( OBJ-AT ?auto_1328 ?auto_1329 ) ( OBJ-AT ?auto_1330 ?auto_1329 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1331 ?auto_1329 )
      ( DELIVER-3PKG-VERIFY ?auto_1328 ?auto_1330 ?auto_1331 ?auto_1329 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1343 - OBJ
      ?auto_1349 - OBJ
      ?auto_1346 - OBJ
      ?auto_1344 - LOCATION
    )
    :vars
    (
      ?auto_1354 - OBJ
      ?auto_1353 - LOCATION
      ?auto_1348 - CITY
      ?auto_1347 - TRUCK
      ?auto_1350 - LOCATION
      ?auto_1351 - CITY
      ?auto_1356 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1349 ?auto_1343 ) ( GREATER-THAN ?auto_1346 ?auto_1343 ) ( GREATER-THAN ?auto_1346 ?auto_1349 ) ( GREATER-THAN ?auto_1349 ?auto_1354 ) ( GREATER-THAN ?auto_1346 ?auto_1354 ) ( IN-CITY ?auto_1353 ?auto_1348 ) ( IN-CITY ?auto_1344 ?auto_1348 ) ( not ( = ?auto_1344 ?auto_1353 ) ) ( OBJ-AT ?auto_1346 ?auto_1353 ) ( TRUCK-AT ?auto_1347 ?auto_1350 ) ( IN-CITY ?auto_1350 ?auto_1351 ) ( IN-CITY ?auto_1353 ?auto_1351 ) ( not ( = ?auto_1353 ?auto_1350 ) ) ( OBJ-AT ?auto_1354 ?auto_1344 ) ( TRUCK-AT ?auto_1356 ?auto_1344 ) ( IN-TRUCK ?auto_1349 ?auto_1356 ) ( OBJ-AT ?auto_1343 ?auto_1344 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1349 ?auto_1344 )
      ( DELIVER-3PKG ?auto_1354 ?auto_1349 ?auto_1346 ?auto_1344 )
      ( DELIVER-3PKG-VERIFY ?auto_1343 ?auto_1349 ?auto_1346 ?auto_1344 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1363 - OBJ
      ?auto_1365 - OBJ
      ?auto_1366 - OBJ
      ?auto_1364 - LOCATION
    )
    :vars
    (
      ?auto_1377 - OBJ
      ?auto_1369 - OBJ
      ?auto_1370 - LOCATION
      ?auto_1376 - CITY
      ?auto_1375 - CITY
      ?auto_1371 - TRUCK
      ?auto_1379 - LOCATION
      ?auto_1380 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1365 ?auto_1363 ) ( GREATER-THAN ?auto_1366 ?auto_1363 ) ( GREATER-THAN ?auto_1366 ?auto_1365 ) ( GREATER-THAN ?auto_1365 ?auto_1377 ) ( GREATER-THAN ?auto_1366 ?auto_1377 ) ( GREATER-THAN ?auto_1365 ?auto_1369 ) ( GREATER-THAN ?auto_1366 ?auto_1369 ) ( IN-CITY ?auto_1370 ?auto_1376 ) ( IN-CITY ?auto_1364 ?auto_1376 ) ( not ( = ?auto_1364 ?auto_1370 ) ) ( OBJ-AT ?auto_1366 ?auto_1370 ) ( IN-CITY ?auto_1364 ?auto_1375 ) ( IN-CITY ?auto_1370 ?auto_1375 ) ( OBJ-AT ?auto_1369 ?auto_1364 ) ( IN-TRUCK ?auto_1365 ?auto_1371 ) ( OBJ-AT ?auto_1377 ?auto_1364 ) ( TRUCK-AT ?auto_1371 ?auto_1379 ) ( IN-CITY ?auto_1379 ?auto_1380 ) ( IN-CITY ?auto_1364 ?auto_1380 ) ( not ( = ?auto_1364 ?auto_1379 ) ) ( OBJ-AT ?auto_1363 ?auto_1364 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1371 ?auto_1379 ?auto_1364 ?auto_1380 )
      ( DELIVER-3PKG ?auto_1377 ?auto_1365 ?auto_1366 ?auto_1364 )
      ( DELIVER-3PKG-VERIFY ?auto_1363 ?auto_1365 ?auto_1366 ?auto_1364 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1386 - OBJ
      ?auto_1388 - OBJ
      ?auto_1389 - OBJ
      ?auto_1387 - LOCATION
    )
    :vars
    (
      ?auto_1392 - OBJ
      ?auto_1399 - OBJ
      ?auto_1393 - OBJ
      ?auto_1401 - LOCATION
      ?auto_1395 - CITY
      ?auto_1391 - CITY
      ?auto_1390 - TRUCK
      ?auto_1400 - LOCATION
      ?auto_1398 - CITY
      ?auto_1403 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1388 ?auto_1386 ) ( GREATER-THAN ?auto_1389 ?auto_1386 ) ( GREATER-THAN ?auto_1389 ?auto_1388 ) ( GREATER-THAN ?auto_1388 ?auto_1392 ) ( GREATER-THAN ?auto_1389 ?auto_1392 ) ( GREATER-THAN ?auto_1388 ?auto_1399 ) ( GREATER-THAN ?auto_1389 ?auto_1399 ) ( GREATER-THAN ?auto_1388 ?auto_1393 ) ( GREATER-THAN ?auto_1389 ?auto_1393 ) ( IN-CITY ?auto_1401 ?auto_1395 ) ( IN-CITY ?auto_1387 ?auto_1395 ) ( not ( = ?auto_1387 ?auto_1401 ) ) ( OBJ-AT ?auto_1389 ?auto_1401 ) ( IN-CITY ?auto_1387 ?auto_1391 ) ( IN-CITY ?auto_1401 ?auto_1391 ) ( OBJ-AT ?auto_1393 ?auto_1387 ) ( OBJ-AT ?auto_1399 ?auto_1387 ) ( TRUCK-AT ?auto_1390 ?auto_1400 ) ( IN-CITY ?auto_1400 ?auto_1398 ) ( IN-CITY ?auto_1387 ?auto_1398 ) ( not ( = ?auto_1387 ?auto_1400 ) ) ( OBJ-AT ?auto_1392 ?auto_1387 ) ( TRUCK-AT ?auto_1390 ?auto_1403 ) ( OBJ-AT ?auto_1388 ?auto_1403 ) ( OBJ-AT ?auto_1386 ?auto_1387 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_1388 ?auto_1390 ?auto_1403 )
      ( DELIVER-3PKG ?auto_1392 ?auto_1388 ?auto_1389 ?auto_1387 )
      ( DELIVER-3PKG-VERIFY ?auto_1386 ?auto_1388 ?auto_1389 ?auto_1387 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1409 - OBJ
      ?auto_1411 - OBJ
      ?auto_1412 - OBJ
      ?auto_1410 - LOCATION
    )
    :vars
    (
      ?auto_1426 - OBJ
      ?auto_1422 - OBJ
      ?auto_1417 - OBJ
      ?auto_1414 - OBJ
      ?auto_1423 - LOCATION
      ?auto_1420 - CITY
      ?auto_1419 - CITY
      ?auto_1425 - LOCATION
      ?auto_1418 - CITY
      ?auto_1416 - TRUCK
      ?auto_1428 - LOCATION
      ?auto_1429 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1411 ?auto_1409 ) ( GREATER-THAN ?auto_1412 ?auto_1409 ) ( GREATER-THAN ?auto_1412 ?auto_1411 ) ( GREATER-THAN ?auto_1411 ?auto_1426 ) ( GREATER-THAN ?auto_1412 ?auto_1426 ) ( GREATER-THAN ?auto_1411 ?auto_1422 ) ( GREATER-THAN ?auto_1412 ?auto_1422 ) ( GREATER-THAN ?auto_1411 ?auto_1417 ) ( GREATER-THAN ?auto_1412 ?auto_1417 ) ( GREATER-THAN ?auto_1411 ?auto_1414 ) ( GREATER-THAN ?auto_1412 ?auto_1414 ) ( IN-CITY ?auto_1423 ?auto_1420 ) ( IN-CITY ?auto_1410 ?auto_1420 ) ( not ( = ?auto_1410 ?auto_1423 ) ) ( OBJ-AT ?auto_1412 ?auto_1423 ) ( IN-CITY ?auto_1410 ?auto_1419 ) ( IN-CITY ?auto_1423 ?auto_1419 ) ( OBJ-AT ?auto_1414 ?auto_1410 ) ( OBJ-AT ?auto_1417 ?auto_1410 ) ( IN-CITY ?auto_1425 ?auto_1418 ) ( IN-CITY ?auto_1410 ?auto_1418 ) ( not ( = ?auto_1410 ?auto_1425 ) ) ( OBJ-AT ?auto_1422 ?auto_1410 ) ( OBJ-AT ?auto_1411 ?auto_1425 ) ( OBJ-AT ?auto_1426 ?auto_1410 ) ( TRUCK-AT ?auto_1416 ?auto_1428 ) ( IN-CITY ?auto_1428 ?auto_1429 ) ( IN-CITY ?auto_1425 ?auto_1429 ) ( not ( = ?auto_1425 ?auto_1428 ) ) ( OBJ-AT ?auto_1409 ?auto_1410 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1416 ?auto_1428 ?auto_1425 ?auto_1429 )
      ( DELIVER-3PKG ?auto_1426 ?auto_1411 ?auto_1412 ?auto_1410 )
      ( DELIVER-3PKG-VERIFY ?auto_1409 ?auto_1411 ?auto_1412 ?auto_1410 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1453 - OBJ
      ?auto_1437 - OBJ
      ?auto_1438 - OBJ
      ?auto_1436 - LOCATION
    )
    :vars
    (
      ?auto_1454 - LOCATION
      ?auto_1451 - CITY
      ?auto_1450 - CITY
      ?auto_1445 - LOCATION
      ?auto_1447 - CITY
      ?auto_1446 - TRUCK
      ?auto_1444 - LOCATION
      ?auto_1440 - CITY
      ?auto_1455 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1437 ?auto_1453 ) ( GREATER-THAN ?auto_1438 ?auto_1453 ) ( GREATER-THAN ?auto_1438 ?auto_1437 ) ( IN-CITY ?auto_1454 ?auto_1451 ) ( IN-CITY ?auto_1436 ?auto_1451 ) ( not ( = ?auto_1436 ?auto_1454 ) ) ( OBJ-AT ?auto_1438 ?auto_1454 ) ( IN-CITY ?auto_1436 ?auto_1450 ) ( IN-CITY ?auto_1454 ?auto_1450 ) ( IN-CITY ?auto_1445 ?auto_1447 ) ( IN-CITY ?auto_1436 ?auto_1447 ) ( not ( = ?auto_1436 ?auto_1445 ) ) ( OBJ-AT ?auto_1437 ?auto_1445 ) ( TRUCK-AT ?auto_1446 ?auto_1444 ) ( IN-CITY ?auto_1444 ?auto_1440 ) ( IN-CITY ?auto_1445 ?auto_1440 ) ( not ( = ?auto_1445 ?auto_1444 ) ) ( TRUCK-AT ?auto_1455 ?auto_1436 ) ( IN-TRUCK ?auto_1453 ?auto_1455 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1453 ?auto_1436 )
      ( DELIVER-3PKG ?auto_1453 ?auto_1437 ?auto_1438 ?auto_1436 )
      ( DELIVER-3PKG-VERIFY ?auto_1453 ?auto_1437 ?auto_1438 ?auto_1436 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1462 - OBJ
      ?auto_1464 - OBJ
      ?auto_1465 - OBJ
      ?auto_1463 - LOCATION
    )
    :vars
    (
      ?auto_1478 - LOCATION
      ?auto_1469 - CITY
      ?auto_1473 - CITY
      ?auto_1475 - LOCATION
      ?auto_1470 - CITY
      ?auto_1472 - CITY
      ?auto_1474 - TRUCK
      ?auto_1480 - LOCATION
      ?auto_1481 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1464 ?auto_1462 ) ( GREATER-THAN ?auto_1465 ?auto_1462 ) ( GREATER-THAN ?auto_1465 ?auto_1464 ) ( IN-CITY ?auto_1478 ?auto_1469 ) ( IN-CITY ?auto_1463 ?auto_1469 ) ( not ( = ?auto_1463 ?auto_1478 ) ) ( OBJ-AT ?auto_1465 ?auto_1478 ) ( IN-CITY ?auto_1463 ?auto_1473 ) ( IN-CITY ?auto_1478 ?auto_1473 ) ( IN-CITY ?auto_1475 ?auto_1470 ) ( IN-CITY ?auto_1463 ?auto_1470 ) ( not ( = ?auto_1463 ?auto_1475 ) ) ( OBJ-AT ?auto_1464 ?auto_1475 ) ( IN-CITY ?auto_1463 ?auto_1472 ) ( IN-CITY ?auto_1475 ?auto_1472 ) ( IN-TRUCK ?auto_1462 ?auto_1474 ) ( TRUCK-AT ?auto_1474 ?auto_1480 ) ( IN-CITY ?auto_1480 ?auto_1481 ) ( IN-CITY ?auto_1463 ?auto_1481 ) ( not ( = ?auto_1463 ?auto_1480 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1474 ?auto_1480 ?auto_1463 ?auto_1481 )
      ( DELIVER-3PKG ?auto_1462 ?auto_1464 ?auto_1465 ?auto_1463 )
      ( DELIVER-3PKG-VERIFY ?auto_1462 ?auto_1464 ?auto_1465 ?auto_1463 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1487 - OBJ
      ?auto_1489 - OBJ
      ?auto_1490 - OBJ
      ?auto_1488 - LOCATION
    )
    :vars
    (
      ?auto_1492 - LOCATION
      ?auto_1498 - CITY
      ?auto_1494 - CITY
      ?auto_1499 - LOCATION
      ?auto_1502 - CITY
      ?auto_1493 - CITY
      ?auto_1500 - TRUCK
      ?auto_1503 - LOCATION
      ?auto_1491 - CITY
      ?auto_1505 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1489 ?auto_1487 ) ( GREATER-THAN ?auto_1490 ?auto_1487 ) ( GREATER-THAN ?auto_1490 ?auto_1489 ) ( IN-CITY ?auto_1492 ?auto_1498 ) ( IN-CITY ?auto_1488 ?auto_1498 ) ( not ( = ?auto_1488 ?auto_1492 ) ) ( OBJ-AT ?auto_1490 ?auto_1492 ) ( IN-CITY ?auto_1488 ?auto_1494 ) ( IN-CITY ?auto_1492 ?auto_1494 ) ( IN-CITY ?auto_1499 ?auto_1502 ) ( IN-CITY ?auto_1488 ?auto_1502 ) ( not ( = ?auto_1488 ?auto_1499 ) ) ( OBJ-AT ?auto_1489 ?auto_1499 ) ( IN-CITY ?auto_1488 ?auto_1493 ) ( IN-CITY ?auto_1499 ?auto_1493 ) ( TRUCK-AT ?auto_1500 ?auto_1503 ) ( IN-CITY ?auto_1503 ?auto_1491 ) ( IN-CITY ?auto_1488 ?auto_1491 ) ( not ( = ?auto_1488 ?auto_1503 ) ) ( TRUCK-AT ?auto_1500 ?auto_1505 ) ( OBJ-AT ?auto_1487 ?auto_1505 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_1487 ?auto_1500 ?auto_1505 )
      ( DELIVER-3PKG ?auto_1487 ?auto_1489 ?auto_1490 ?auto_1488 )
      ( DELIVER-3PKG-VERIFY ?auto_1487 ?auto_1489 ?auto_1490 ?auto_1488 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1511 - OBJ
      ?auto_1513 - OBJ
      ?auto_1514 - OBJ
      ?auto_1512 - LOCATION
    )
    :vars
    (
      ?auto_1518 - LOCATION
      ?auto_1522 - CITY
      ?auto_1521 - CITY
      ?auto_1528 - LOCATION
      ?auto_1520 - CITY
      ?auto_1519 - CITY
      ?auto_1515 - LOCATION
      ?auto_1517 - CITY
      ?auto_1526 - TRUCK
      ?auto_1530 - LOCATION
      ?auto_1531 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1513 ?auto_1511 ) ( GREATER-THAN ?auto_1514 ?auto_1511 ) ( GREATER-THAN ?auto_1514 ?auto_1513 ) ( IN-CITY ?auto_1518 ?auto_1522 ) ( IN-CITY ?auto_1512 ?auto_1522 ) ( not ( = ?auto_1512 ?auto_1518 ) ) ( OBJ-AT ?auto_1514 ?auto_1518 ) ( IN-CITY ?auto_1512 ?auto_1521 ) ( IN-CITY ?auto_1518 ?auto_1521 ) ( IN-CITY ?auto_1528 ?auto_1520 ) ( IN-CITY ?auto_1512 ?auto_1520 ) ( not ( = ?auto_1512 ?auto_1528 ) ) ( OBJ-AT ?auto_1513 ?auto_1528 ) ( IN-CITY ?auto_1512 ?auto_1519 ) ( IN-CITY ?auto_1528 ?auto_1519 ) ( IN-CITY ?auto_1515 ?auto_1517 ) ( IN-CITY ?auto_1512 ?auto_1517 ) ( not ( = ?auto_1512 ?auto_1515 ) ) ( OBJ-AT ?auto_1511 ?auto_1515 ) ( TRUCK-AT ?auto_1526 ?auto_1530 ) ( IN-CITY ?auto_1530 ?auto_1531 ) ( IN-CITY ?auto_1515 ?auto_1531 ) ( not ( = ?auto_1515 ?auto_1530 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1526 ?auto_1530 ?auto_1515 ?auto_1531 )
      ( DELIVER-3PKG ?auto_1511 ?auto_1513 ?auto_1514 ?auto_1512 )
      ( DELIVER-3PKG-VERIFY ?auto_1511 ?auto_1513 ?auto_1514 ?auto_1512 ) )
  )

)

