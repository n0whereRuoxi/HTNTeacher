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
      ?auto_1240 - SURFACE
      ?auto_1241 - SURFACE
    )
    :vars
    (
      ?auto_1242 - HOIST
      ?auto_1243 - PLACE
      ?auto_1245 - PLACE
      ?auto_1246 - HOIST
      ?auto_1247 - SURFACE
      ?auto_1244 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1242 ?auto_1243 ) ( SURFACE-AT ?auto_1240 ?auto_1243 ) ( CLEAR ?auto_1240 ) ( IS-CRATE ?auto_1241 ) ( AVAILABLE ?auto_1242 ) ( not ( = ?auto_1245 ?auto_1243 ) ) ( HOIST-AT ?auto_1246 ?auto_1245 ) ( AVAILABLE ?auto_1246 ) ( SURFACE-AT ?auto_1241 ?auto_1245 ) ( ON ?auto_1241 ?auto_1247 ) ( CLEAR ?auto_1241 ) ( TRUCK-AT ?auto_1244 ?auto_1243 ) ( not ( = ?auto_1240 ?auto_1241 ) ) ( not ( = ?auto_1240 ?auto_1247 ) ) ( not ( = ?auto_1241 ?auto_1247 ) ) ( not ( = ?auto_1242 ?auto_1246 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1244 ?auto_1243 ?auto_1245 )
      ( !LIFT ?auto_1246 ?auto_1241 ?auto_1247 ?auto_1245 )
      ( !LOAD ?auto_1246 ?auto_1241 ?auto_1244 ?auto_1245 )
      ( !DRIVE ?auto_1244 ?auto_1245 ?auto_1243 )
      ( !UNLOAD ?auto_1242 ?auto_1241 ?auto_1244 ?auto_1243 )
      ( !DROP ?auto_1242 ?auto_1241 ?auto_1240 ?auto_1243 )
      ( MAKE-1CRATE-VERIFY ?auto_1240 ?auto_1241 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1250 - SURFACE
      ?auto_1251 - SURFACE
    )
    :vars
    (
      ?auto_1252 - HOIST
      ?auto_1253 - PLACE
      ?auto_1255 - PLACE
      ?auto_1256 - HOIST
      ?auto_1257 - SURFACE
      ?auto_1254 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1252 ?auto_1253 ) ( SURFACE-AT ?auto_1250 ?auto_1253 ) ( CLEAR ?auto_1250 ) ( IS-CRATE ?auto_1251 ) ( AVAILABLE ?auto_1252 ) ( not ( = ?auto_1255 ?auto_1253 ) ) ( HOIST-AT ?auto_1256 ?auto_1255 ) ( AVAILABLE ?auto_1256 ) ( SURFACE-AT ?auto_1251 ?auto_1255 ) ( ON ?auto_1251 ?auto_1257 ) ( CLEAR ?auto_1251 ) ( TRUCK-AT ?auto_1254 ?auto_1253 ) ( not ( = ?auto_1250 ?auto_1251 ) ) ( not ( = ?auto_1250 ?auto_1257 ) ) ( not ( = ?auto_1251 ?auto_1257 ) ) ( not ( = ?auto_1252 ?auto_1256 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1254 ?auto_1253 ?auto_1255 )
      ( !LIFT ?auto_1256 ?auto_1251 ?auto_1257 ?auto_1255 )
      ( !LOAD ?auto_1256 ?auto_1251 ?auto_1254 ?auto_1255 )
      ( !DRIVE ?auto_1254 ?auto_1255 ?auto_1253 )
      ( !UNLOAD ?auto_1252 ?auto_1251 ?auto_1254 ?auto_1253 )
      ( !DROP ?auto_1252 ?auto_1251 ?auto_1250 ?auto_1253 )
      ( MAKE-1CRATE-VERIFY ?auto_1250 ?auto_1251 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1261 - SURFACE
      ?auto_1262 - SURFACE
      ?auto_1263 - SURFACE
    )
    :vars
    (
      ?auto_1265 - HOIST
      ?auto_1268 - PLACE
      ?auto_1267 - PLACE
      ?auto_1269 - HOIST
      ?auto_1266 - SURFACE
      ?auto_1272 - PLACE
      ?auto_1270 - HOIST
      ?auto_1271 - SURFACE
      ?auto_1264 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1265 ?auto_1268 ) ( IS-CRATE ?auto_1263 ) ( not ( = ?auto_1267 ?auto_1268 ) ) ( HOIST-AT ?auto_1269 ?auto_1267 ) ( AVAILABLE ?auto_1269 ) ( SURFACE-AT ?auto_1263 ?auto_1267 ) ( ON ?auto_1263 ?auto_1266 ) ( CLEAR ?auto_1263 ) ( not ( = ?auto_1262 ?auto_1263 ) ) ( not ( = ?auto_1262 ?auto_1266 ) ) ( not ( = ?auto_1263 ?auto_1266 ) ) ( not ( = ?auto_1265 ?auto_1269 ) ) ( SURFACE-AT ?auto_1261 ?auto_1268 ) ( CLEAR ?auto_1261 ) ( IS-CRATE ?auto_1262 ) ( AVAILABLE ?auto_1265 ) ( not ( = ?auto_1272 ?auto_1268 ) ) ( HOIST-AT ?auto_1270 ?auto_1272 ) ( AVAILABLE ?auto_1270 ) ( SURFACE-AT ?auto_1262 ?auto_1272 ) ( ON ?auto_1262 ?auto_1271 ) ( CLEAR ?auto_1262 ) ( TRUCK-AT ?auto_1264 ?auto_1268 ) ( not ( = ?auto_1261 ?auto_1262 ) ) ( not ( = ?auto_1261 ?auto_1271 ) ) ( not ( = ?auto_1262 ?auto_1271 ) ) ( not ( = ?auto_1265 ?auto_1270 ) ) ( not ( = ?auto_1261 ?auto_1263 ) ) ( not ( = ?auto_1261 ?auto_1266 ) ) ( not ( = ?auto_1263 ?auto_1271 ) ) ( not ( = ?auto_1267 ?auto_1272 ) ) ( not ( = ?auto_1269 ?auto_1270 ) ) ( not ( = ?auto_1266 ?auto_1271 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1261 ?auto_1262 )
      ( MAKE-1CRATE ?auto_1262 ?auto_1263 )
      ( MAKE-2CRATE-VERIFY ?auto_1261 ?auto_1262 ?auto_1263 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1275 - SURFACE
      ?auto_1276 - SURFACE
    )
    :vars
    (
      ?auto_1277 - HOIST
      ?auto_1278 - PLACE
      ?auto_1280 - PLACE
      ?auto_1281 - HOIST
      ?auto_1282 - SURFACE
      ?auto_1279 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1277 ?auto_1278 ) ( SURFACE-AT ?auto_1275 ?auto_1278 ) ( CLEAR ?auto_1275 ) ( IS-CRATE ?auto_1276 ) ( AVAILABLE ?auto_1277 ) ( not ( = ?auto_1280 ?auto_1278 ) ) ( HOIST-AT ?auto_1281 ?auto_1280 ) ( AVAILABLE ?auto_1281 ) ( SURFACE-AT ?auto_1276 ?auto_1280 ) ( ON ?auto_1276 ?auto_1282 ) ( CLEAR ?auto_1276 ) ( TRUCK-AT ?auto_1279 ?auto_1278 ) ( not ( = ?auto_1275 ?auto_1276 ) ) ( not ( = ?auto_1275 ?auto_1282 ) ) ( not ( = ?auto_1276 ?auto_1282 ) ) ( not ( = ?auto_1277 ?auto_1281 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1279 ?auto_1278 ?auto_1280 )
      ( !LIFT ?auto_1281 ?auto_1276 ?auto_1282 ?auto_1280 )
      ( !LOAD ?auto_1281 ?auto_1276 ?auto_1279 ?auto_1280 )
      ( !DRIVE ?auto_1279 ?auto_1280 ?auto_1278 )
      ( !UNLOAD ?auto_1277 ?auto_1276 ?auto_1279 ?auto_1278 )
      ( !DROP ?auto_1277 ?auto_1276 ?auto_1275 ?auto_1278 )
      ( MAKE-1CRATE-VERIFY ?auto_1275 ?auto_1276 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1287 - SURFACE
      ?auto_1288 - SURFACE
      ?auto_1289 - SURFACE
      ?auto_1290 - SURFACE
    )
    :vars
    (
      ?auto_1296 - HOIST
      ?auto_1291 - PLACE
      ?auto_1295 - PLACE
      ?auto_1294 - HOIST
      ?auto_1292 - SURFACE
      ?auto_1297 - PLACE
      ?auto_1298 - HOIST
      ?auto_1299 - SURFACE
      ?auto_1301 - PLACE
      ?auto_1302 - HOIST
      ?auto_1300 - SURFACE
      ?auto_1293 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1296 ?auto_1291 ) ( IS-CRATE ?auto_1290 ) ( not ( = ?auto_1295 ?auto_1291 ) ) ( HOIST-AT ?auto_1294 ?auto_1295 ) ( AVAILABLE ?auto_1294 ) ( SURFACE-AT ?auto_1290 ?auto_1295 ) ( ON ?auto_1290 ?auto_1292 ) ( CLEAR ?auto_1290 ) ( not ( = ?auto_1289 ?auto_1290 ) ) ( not ( = ?auto_1289 ?auto_1292 ) ) ( not ( = ?auto_1290 ?auto_1292 ) ) ( not ( = ?auto_1296 ?auto_1294 ) ) ( IS-CRATE ?auto_1289 ) ( not ( = ?auto_1297 ?auto_1291 ) ) ( HOIST-AT ?auto_1298 ?auto_1297 ) ( AVAILABLE ?auto_1298 ) ( SURFACE-AT ?auto_1289 ?auto_1297 ) ( ON ?auto_1289 ?auto_1299 ) ( CLEAR ?auto_1289 ) ( not ( = ?auto_1288 ?auto_1289 ) ) ( not ( = ?auto_1288 ?auto_1299 ) ) ( not ( = ?auto_1289 ?auto_1299 ) ) ( not ( = ?auto_1296 ?auto_1298 ) ) ( SURFACE-AT ?auto_1287 ?auto_1291 ) ( CLEAR ?auto_1287 ) ( IS-CRATE ?auto_1288 ) ( AVAILABLE ?auto_1296 ) ( not ( = ?auto_1301 ?auto_1291 ) ) ( HOIST-AT ?auto_1302 ?auto_1301 ) ( AVAILABLE ?auto_1302 ) ( SURFACE-AT ?auto_1288 ?auto_1301 ) ( ON ?auto_1288 ?auto_1300 ) ( CLEAR ?auto_1288 ) ( TRUCK-AT ?auto_1293 ?auto_1291 ) ( not ( = ?auto_1287 ?auto_1288 ) ) ( not ( = ?auto_1287 ?auto_1300 ) ) ( not ( = ?auto_1288 ?auto_1300 ) ) ( not ( = ?auto_1296 ?auto_1302 ) ) ( not ( = ?auto_1287 ?auto_1289 ) ) ( not ( = ?auto_1287 ?auto_1299 ) ) ( not ( = ?auto_1289 ?auto_1300 ) ) ( not ( = ?auto_1297 ?auto_1301 ) ) ( not ( = ?auto_1298 ?auto_1302 ) ) ( not ( = ?auto_1299 ?auto_1300 ) ) ( not ( = ?auto_1287 ?auto_1290 ) ) ( not ( = ?auto_1287 ?auto_1292 ) ) ( not ( = ?auto_1288 ?auto_1290 ) ) ( not ( = ?auto_1288 ?auto_1292 ) ) ( not ( = ?auto_1290 ?auto_1299 ) ) ( not ( = ?auto_1290 ?auto_1300 ) ) ( not ( = ?auto_1295 ?auto_1297 ) ) ( not ( = ?auto_1295 ?auto_1301 ) ) ( not ( = ?auto_1294 ?auto_1298 ) ) ( not ( = ?auto_1294 ?auto_1302 ) ) ( not ( = ?auto_1292 ?auto_1299 ) ) ( not ( = ?auto_1292 ?auto_1300 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1287 ?auto_1288 ?auto_1289 )
      ( MAKE-1CRATE ?auto_1289 ?auto_1290 )
      ( MAKE-3CRATE-VERIFY ?auto_1287 ?auto_1288 ?auto_1289 ?auto_1290 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1305 - SURFACE
      ?auto_1306 - SURFACE
    )
    :vars
    (
      ?auto_1307 - HOIST
      ?auto_1308 - PLACE
      ?auto_1310 - PLACE
      ?auto_1311 - HOIST
      ?auto_1312 - SURFACE
      ?auto_1309 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1307 ?auto_1308 ) ( SURFACE-AT ?auto_1305 ?auto_1308 ) ( CLEAR ?auto_1305 ) ( IS-CRATE ?auto_1306 ) ( AVAILABLE ?auto_1307 ) ( not ( = ?auto_1310 ?auto_1308 ) ) ( HOIST-AT ?auto_1311 ?auto_1310 ) ( AVAILABLE ?auto_1311 ) ( SURFACE-AT ?auto_1306 ?auto_1310 ) ( ON ?auto_1306 ?auto_1312 ) ( CLEAR ?auto_1306 ) ( TRUCK-AT ?auto_1309 ?auto_1308 ) ( not ( = ?auto_1305 ?auto_1306 ) ) ( not ( = ?auto_1305 ?auto_1312 ) ) ( not ( = ?auto_1306 ?auto_1312 ) ) ( not ( = ?auto_1307 ?auto_1311 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1309 ?auto_1308 ?auto_1310 )
      ( !LIFT ?auto_1311 ?auto_1306 ?auto_1312 ?auto_1310 )
      ( !LOAD ?auto_1311 ?auto_1306 ?auto_1309 ?auto_1310 )
      ( !DRIVE ?auto_1309 ?auto_1310 ?auto_1308 )
      ( !UNLOAD ?auto_1307 ?auto_1306 ?auto_1309 ?auto_1308 )
      ( !DROP ?auto_1307 ?auto_1306 ?auto_1305 ?auto_1308 )
      ( MAKE-1CRATE-VERIFY ?auto_1305 ?auto_1306 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1318 - SURFACE
      ?auto_1319 - SURFACE
      ?auto_1320 - SURFACE
      ?auto_1321 - SURFACE
      ?auto_1322 - SURFACE
    )
    :vars
    (
      ?auto_1324 - HOIST
      ?auto_1327 - PLACE
      ?auto_1328 - PLACE
      ?auto_1326 - HOIST
      ?auto_1325 - SURFACE
      ?auto_1331 - PLACE
      ?auto_1337 - HOIST
      ?auto_1332 - SURFACE
      ?auto_1335 - PLACE
      ?auto_1336 - HOIST
      ?auto_1333 - SURFACE
      ?auto_1334 - PLACE
      ?auto_1330 - HOIST
      ?auto_1329 - SURFACE
      ?auto_1323 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1324 ?auto_1327 ) ( IS-CRATE ?auto_1322 ) ( not ( = ?auto_1328 ?auto_1327 ) ) ( HOIST-AT ?auto_1326 ?auto_1328 ) ( AVAILABLE ?auto_1326 ) ( SURFACE-AT ?auto_1322 ?auto_1328 ) ( ON ?auto_1322 ?auto_1325 ) ( CLEAR ?auto_1322 ) ( not ( = ?auto_1321 ?auto_1322 ) ) ( not ( = ?auto_1321 ?auto_1325 ) ) ( not ( = ?auto_1322 ?auto_1325 ) ) ( not ( = ?auto_1324 ?auto_1326 ) ) ( IS-CRATE ?auto_1321 ) ( not ( = ?auto_1331 ?auto_1327 ) ) ( HOIST-AT ?auto_1337 ?auto_1331 ) ( AVAILABLE ?auto_1337 ) ( SURFACE-AT ?auto_1321 ?auto_1331 ) ( ON ?auto_1321 ?auto_1332 ) ( CLEAR ?auto_1321 ) ( not ( = ?auto_1320 ?auto_1321 ) ) ( not ( = ?auto_1320 ?auto_1332 ) ) ( not ( = ?auto_1321 ?auto_1332 ) ) ( not ( = ?auto_1324 ?auto_1337 ) ) ( IS-CRATE ?auto_1320 ) ( not ( = ?auto_1335 ?auto_1327 ) ) ( HOIST-AT ?auto_1336 ?auto_1335 ) ( AVAILABLE ?auto_1336 ) ( SURFACE-AT ?auto_1320 ?auto_1335 ) ( ON ?auto_1320 ?auto_1333 ) ( CLEAR ?auto_1320 ) ( not ( = ?auto_1319 ?auto_1320 ) ) ( not ( = ?auto_1319 ?auto_1333 ) ) ( not ( = ?auto_1320 ?auto_1333 ) ) ( not ( = ?auto_1324 ?auto_1336 ) ) ( SURFACE-AT ?auto_1318 ?auto_1327 ) ( CLEAR ?auto_1318 ) ( IS-CRATE ?auto_1319 ) ( AVAILABLE ?auto_1324 ) ( not ( = ?auto_1334 ?auto_1327 ) ) ( HOIST-AT ?auto_1330 ?auto_1334 ) ( AVAILABLE ?auto_1330 ) ( SURFACE-AT ?auto_1319 ?auto_1334 ) ( ON ?auto_1319 ?auto_1329 ) ( CLEAR ?auto_1319 ) ( TRUCK-AT ?auto_1323 ?auto_1327 ) ( not ( = ?auto_1318 ?auto_1319 ) ) ( not ( = ?auto_1318 ?auto_1329 ) ) ( not ( = ?auto_1319 ?auto_1329 ) ) ( not ( = ?auto_1324 ?auto_1330 ) ) ( not ( = ?auto_1318 ?auto_1320 ) ) ( not ( = ?auto_1318 ?auto_1333 ) ) ( not ( = ?auto_1320 ?auto_1329 ) ) ( not ( = ?auto_1335 ?auto_1334 ) ) ( not ( = ?auto_1336 ?auto_1330 ) ) ( not ( = ?auto_1333 ?auto_1329 ) ) ( not ( = ?auto_1318 ?auto_1321 ) ) ( not ( = ?auto_1318 ?auto_1332 ) ) ( not ( = ?auto_1319 ?auto_1321 ) ) ( not ( = ?auto_1319 ?auto_1332 ) ) ( not ( = ?auto_1321 ?auto_1333 ) ) ( not ( = ?auto_1321 ?auto_1329 ) ) ( not ( = ?auto_1331 ?auto_1335 ) ) ( not ( = ?auto_1331 ?auto_1334 ) ) ( not ( = ?auto_1337 ?auto_1336 ) ) ( not ( = ?auto_1337 ?auto_1330 ) ) ( not ( = ?auto_1332 ?auto_1333 ) ) ( not ( = ?auto_1332 ?auto_1329 ) ) ( not ( = ?auto_1318 ?auto_1322 ) ) ( not ( = ?auto_1318 ?auto_1325 ) ) ( not ( = ?auto_1319 ?auto_1322 ) ) ( not ( = ?auto_1319 ?auto_1325 ) ) ( not ( = ?auto_1320 ?auto_1322 ) ) ( not ( = ?auto_1320 ?auto_1325 ) ) ( not ( = ?auto_1322 ?auto_1332 ) ) ( not ( = ?auto_1322 ?auto_1333 ) ) ( not ( = ?auto_1322 ?auto_1329 ) ) ( not ( = ?auto_1328 ?auto_1331 ) ) ( not ( = ?auto_1328 ?auto_1335 ) ) ( not ( = ?auto_1328 ?auto_1334 ) ) ( not ( = ?auto_1326 ?auto_1337 ) ) ( not ( = ?auto_1326 ?auto_1336 ) ) ( not ( = ?auto_1326 ?auto_1330 ) ) ( not ( = ?auto_1325 ?auto_1332 ) ) ( not ( = ?auto_1325 ?auto_1333 ) ) ( not ( = ?auto_1325 ?auto_1329 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_1318 ?auto_1319 ?auto_1320 ?auto_1321 )
      ( MAKE-1CRATE ?auto_1321 ?auto_1322 )
      ( MAKE-4CRATE-VERIFY ?auto_1318 ?auto_1319 ?auto_1320 ?auto_1321 ?auto_1322 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1340 - SURFACE
      ?auto_1341 - SURFACE
    )
    :vars
    (
      ?auto_1342 - HOIST
      ?auto_1343 - PLACE
      ?auto_1345 - PLACE
      ?auto_1346 - HOIST
      ?auto_1347 - SURFACE
      ?auto_1344 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1342 ?auto_1343 ) ( SURFACE-AT ?auto_1340 ?auto_1343 ) ( CLEAR ?auto_1340 ) ( IS-CRATE ?auto_1341 ) ( AVAILABLE ?auto_1342 ) ( not ( = ?auto_1345 ?auto_1343 ) ) ( HOIST-AT ?auto_1346 ?auto_1345 ) ( AVAILABLE ?auto_1346 ) ( SURFACE-AT ?auto_1341 ?auto_1345 ) ( ON ?auto_1341 ?auto_1347 ) ( CLEAR ?auto_1341 ) ( TRUCK-AT ?auto_1344 ?auto_1343 ) ( not ( = ?auto_1340 ?auto_1341 ) ) ( not ( = ?auto_1340 ?auto_1347 ) ) ( not ( = ?auto_1341 ?auto_1347 ) ) ( not ( = ?auto_1342 ?auto_1346 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1344 ?auto_1343 ?auto_1345 )
      ( !LIFT ?auto_1346 ?auto_1341 ?auto_1347 ?auto_1345 )
      ( !LOAD ?auto_1346 ?auto_1341 ?auto_1344 ?auto_1345 )
      ( !DRIVE ?auto_1344 ?auto_1345 ?auto_1343 )
      ( !UNLOAD ?auto_1342 ?auto_1341 ?auto_1344 ?auto_1343 )
      ( !DROP ?auto_1342 ?auto_1341 ?auto_1340 ?auto_1343 )
      ( MAKE-1CRATE-VERIFY ?auto_1340 ?auto_1341 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1354 - SURFACE
      ?auto_1355 - SURFACE
      ?auto_1356 - SURFACE
      ?auto_1357 - SURFACE
      ?auto_1358 - SURFACE
      ?auto_1359 - SURFACE
    )
    :vars
    (
      ?auto_1365 - HOIST
      ?auto_1363 - PLACE
      ?auto_1364 - PLACE
      ?auto_1362 - HOIST
      ?auto_1361 - SURFACE
      ?auto_1368 - PLACE
      ?auto_1372 - HOIST
      ?auto_1369 - SURFACE
      ?auto_1371 - PLACE
      ?auto_1370 - HOIST
      ?auto_1374 - SURFACE
      ?auto_1366 - PLACE
      ?auto_1367 - HOIST
      ?auto_1375 - SURFACE
      ?auto_1376 - PLACE
      ?auto_1373 - HOIST
      ?auto_1377 - SURFACE
      ?auto_1360 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1365 ?auto_1363 ) ( IS-CRATE ?auto_1359 ) ( not ( = ?auto_1364 ?auto_1363 ) ) ( HOIST-AT ?auto_1362 ?auto_1364 ) ( AVAILABLE ?auto_1362 ) ( SURFACE-AT ?auto_1359 ?auto_1364 ) ( ON ?auto_1359 ?auto_1361 ) ( CLEAR ?auto_1359 ) ( not ( = ?auto_1358 ?auto_1359 ) ) ( not ( = ?auto_1358 ?auto_1361 ) ) ( not ( = ?auto_1359 ?auto_1361 ) ) ( not ( = ?auto_1365 ?auto_1362 ) ) ( IS-CRATE ?auto_1358 ) ( not ( = ?auto_1368 ?auto_1363 ) ) ( HOIST-AT ?auto_1372 ?auto_1368 ) ( AVAILABLE ?auto_1372 ) ( SURFACE-AT ?auto_1358 ?auto_1368 ) ( ON ?auto_1358 ?auto_1369 ) ( CLEAR ?auto_1358 ) ( not ( = ?auto_1357 ?auto_1358 ) ) ( not ( = ?auto_1357 ?auto_1369 ) ) ( not ( = ?auto_1358 ?auto_1369 ) ) ( not ( = ?auto_1365 ?auto_1372 ) ) ( IS-CRATE ?auto_1357 ) ( not ( = ?auto_1371 ?auto_1363 ) ) ( HOIST-AT ?auto_1370 ?auto_1371 ) ( AVAILABLE ?auto_1370 ) ( SURFACE-AT ?auto_1357 ?auto_1371 ) ( ON ?auto_1357 ?auto_1374 ) ( CLEAR ?auto_1357 ) ( not ( = ?auto_1356 ?auto_1357 ) ) ( not ( = ?auto_1356 ?auto_1374 ) ) ( not ( = ?auto_1357 ?auto_1374 ) ) ( not ( = ?auto_1365 ?auto_1370 ) ) ( IS-CRATE ?auto_1356 ) ( not ( = ?auto_1366 ?auto_1363 ) ) ( HOIST-AT ?auto_1367 ?auto_1366 ) ( AVAILABLE ?auto_1367 ) ( SURFACE-AT ?auto_1356 ?auto_1366 ) ( ON ?auto_1356 ?auto_1375 ) ( CLEAR ?auto_1356 ) ( not ( = ?auto_1355 ?auto_1356 ) ) ( not ( = ?auto_1355 ?auto_1375 ) ) ( not ( = ?auto_1356 ?auto_1375 ) ) ( not ( = ?auto_1365 ?auto_1367 ) ) ( SURFACE-AT ?auto_1354 ?auto_1363 ) ( CLEAR ?auto_1354 ) ( IS-CRATE ?auto_1355 ) ( AVAILABLE ?auto_1365 ) ( not ( = ?auto_1376 ?auto_1363 ) ) ( HOIST-AT ?auto_1373 ?auto_1376 ) ( AVAILABLE ?auto_1373 ) ( SURFACE-AT ?auto_1355 ?auto_1376 ) ( ON ?auto_1355 ?auto_1377 ) ( CLEAR ?auto_1355 ) ( TRUCK-AT ?auto_1360 ?auto_1363 ) ( not ( = ?auto_1354 ?auto_1355 ) ) ( not ( = ?auto_1354 ?auto_1377 ) ) ( not ( = ?auto_1355 ?auto_1377 ) ) ( not ( = ?auto_1365 ?auto_1373 ) ) ( not ( = ?auto_1354 ?auto_1356 ) ) ( not ( = ?auto_1354 ?auto_1375 ) ) ( not ( = ?auto_1356 ?auto_1377 ) ) ( not ( = ?auto_1366 ?auto_1376 ) ) ( not ( = ?auto_1367 ?auto_1373 ) ) ( not ( = ?auto_1375 ?auto_1377 ) ) ( not ( = ?auto_1354 ?auto_1357 ) ) ( not ( = ?auto_1354 ?auto_1374 ) ) ( not ( = ?auto_1355 ?auto_1357 ) ) ( not ( = ?auto_1355 ?auto_1374 ) ) ( not ( = ?auto_1357 ?auto_1375 ) ) ( not ( = ?auto_1357 ?auto_1377 ) ) ( not ( = ?auto_1371 ?auto_1366 ) ) ( not ( = ?auto_1371 ?auto_1376 ) ) ( not ( = ?auto_1370 ?auto_1367 ) ) ( not ( = ?auto_1370 ?auto_1373 ) ) ( not ( = ?auto_1374 ?auto_1375 ) ) ( not ( = ?auto_1374 ?auto_1377 ) ) ( not ( = ?auto_1354 ?auto_1358 ) ) ( not ( = ?auto_1354 ?auto_1369 ) ) ( not ( = ?auto_1355 ?auto_1358 ) ) ( not ( = ?auto_1355 ?auto_1369 ) ) ( not ( = ?auto_1356 ?auto_1358 ) ) ( not ( = ?auto_1356 ?auto_1369 ) ) ( not ( = ?auto_1358 ?auto_1374 ) ) ( not ( = ?auto_1358 ?auto_1375 ) ) ( not ( = ?auto_1358 ?auto_1377 ) ) ( not ( = ?auto_1368 ?auto_1371 ) ) ( not ( = ?auto_1368 ?auto_1366 ) ) ( not ( = ?auto_1368 ?auto_1376 ) ) ( not ( = ?auto_1372 ?auto_1370 ) ) ( not ( = ?auto_1372 ?auto_1367 ) ) ( not ( = ?auto_1372 ?auto_1373 ) ) ( not ( = ?auto_1369 ?auto_1374 ) ) ( not ( = ?auto_1369 ?auto_1375 ) ) ( not ( = ?auto_1369 ?auto_1377 ) ) ( not ( = ?auto_1354 ?auto_1359 ) ) ( not ( = ?auto_1354 ?auto_1361 ) ) ( not ( = ?auto_1355 ?auto_1359 ) ) ( not ( = ?auto_1355 ?auto_1361 ) ) ( not ( = ?auto_1356 ?auto_1359 ) ) ( not ( = ?auto_1356 ?auto_1361 ) ) ( not ( = ?auto_1357 ?auto_1359 ) ) ( not ( = ?auto_1357 ?auto_1361 ) ) ( not ( = ?auto_1359 ?auto_1369 ) ) ( not ( = ?auto_1359 ?auto_1374 ) ) ( not ( = ?auto_1359 ?auto_1375 ) ) ( not ( = ?auto_1359 ?auto_1377 ) ) ( not ( = ?auto_1364 ?auto_1368 ) ) ( not ( = ?auto_1364 ?auto_1371 ) ) ( not ( = ?auto_1364 ?auto_1366 ) ) ( not ( = ?auto_1364 ?auto_1376 ) ) ( not ( = ?auto_1362 ?auto_1372 ) ) ( not ( = ?auto_1362 ?auto_1370 ) ) ( not ( = ?auto_1362 ?auto_1367 ) ) ( not ( = ?auto_1362 ?auto_1373 ) ) ( not ( = ?auto_1361 ?auto_1369 ) ) ( not ( = ?auto_1361 ?auto_1374 ) ) ( not ( = ?auto_1361 ?auto_1375 ) ) ( not ( = ?auto_1361 ?auto_1377 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_1354 ?auto_1355 ?auto_1356 ?auto_1357 ?auto_1358 )
      ( MAKE-1CRATE ?auto_1358 ?auto_1359 )
      ( MAKE-5CRATE-VERIFY ?auto_1354 ?auto_1355 ?auto_1356 ?auto_1357 ?auto_1358 ?auto_1359 ) )
  )

)

