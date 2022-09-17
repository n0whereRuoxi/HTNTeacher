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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1259 - SURFACE
      ?auto_1260 - SURFACE
    )
    :vars
    (
      ?auto_1261 - HOIST
      ?auto_1262 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1261 ?auto_1262 ) ( SURFACE-AT ?auto_1259 ?auto_1262 ) ( CLEAR ?auto_1259 ) ( LIFTING ?auto_1261 ?auto_1260 ) ( IS-CRATE ?auto_1260 ) ( not ( = ?auto_1259 ?auto_1260 ) ) )
    :subtasks
    ( ( !DROP ?auto_1261 ?auto_1260 ?auto_1259 ?auto_1262 )
      ( MAKE-1CRATE-VERIFY ?auto_1259 ?auto_1260 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1263 - SURFACE
      ?auto_1264 - SURFACE
    )
    :vars
    (
      ?auto_1266 - HOIST
      ?auto_1265 - PLACE
      ?auto_1267 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1266 ?auto_1265 ) ( SURFACE-AT ?auto_1263 ?auto_1265 ) ( CLEAR ?auto_1263 ) ( IS-CRATE ?auto_1264 ) ( not ( = ?auto_1263 ?auto_1264 ) ) ( TRUCK-AT ?auto_1267 ?auto_1265 ) ( AVAILABLE ?auto_1266 ) ( IN ?auto_1264 ?auto_1267 ) )
    :subtasks
    ( ( !UNLOAD ?auto_1266 ?auto_1264 ?auto_1267 ?auto_1265 )
      ( MAKE-1CRATE ?auto_1263 ?auto_1264 )
      ( MAKE-1CRATE-VERIFY ?auto_1263 ?auto_1264 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1268 - SURFACE
      ?auto_1269 - SURFACE
    )
    :vars
    (
      ?auto_1271 - HOIST
      ?auto_1272 - PLACE
      ?auto_1270 - TRUCK
      ?auto_1273 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1271 ?auto_1272 ) ( SURFACE-AT ?auto_1268 ?auto_1272 ) ( CLEAR ?auto_1268 ) ( IS-CRATE ?auto_1269 ) ( not ( = ?auto_1268 ?auto_1269 ) ) ( AVAILABLE ?auto_1271 ) ( IN ?auto_1269 ?auto_1270 ) ( TRUCK-AT ?auto_1270 ?auto_1273 ) ( not ( = ?auto_1273 ?auto_1272 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1270 ?auto_1273 ?auto_1272 )
      ( MAKE-1CRATE ?auto_1268 ?auto_1269 )
      ( MAKE-1CRATE-VERIFY ?auto_1268 ?auto_1269 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1274 - SURFACE
      ?auto_1275 - SURFACE
    )
    :vars
    (
      ?auto_1278 - HOIST
      ?auto_1277 - PLACE
      ?auto_1276 - TRUCK
      ?auto_1279 - PLACE
      ?auto_1280 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1278 ?auto_1277 ) ( SURFACE-AT ?auto_1274 ?auto_1277 ) ( CLEAR ?auto_1274 ) ( IS-CRATE ?auto_1275 ) ( not ( = ?auto_1274 ?auto_1275 ) ) ( AVAILABLE ?auto_1278 ) ( TRUCK-AT ?auto_1276 ?auto_1279 ) ( not ( = ?auto_1279 ?auto_1277 ) ) ( HOIST-AT ?auto_1280 ?auto_1279 ) ( LIFTING ?auto_1280 ?auto_1275 ) ( not ( = ?auto_1278 ?auto_1280 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1280 ?auto_1275 ?auto_1276 ?auto_1279 )
      ( MAKE-1CRATE ?auto_1274 ?auto_1275 )
      ( MAKE-1CRATE-VERIFY ?auto_1274 ?auto_1275 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1281 - SURFACE
      ?auto_1282 - SURFACE
    )
    :vars
    (
      ?auto_1287 - HOIST
      ?auto_1285 - PLACE
      ?auto_1286 - TRUCK
      ?auto_1284 - PLACE
      ?auto_1283 - HOIST
      ?auto_1288 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1287 ?auto_1285 ) ( SURFACE-AT ?auto_1281 ?auto_1285 ) ( CLEAR ?auto_1281 ) ( IS-CRATE ?auto_1282 ) ( not ( = ?auto_1281 ?auto_1282 ) ) ( AVAILABLE ?auto_1287 ) ( TRUCK-AT ?auto_1286 ?auto_1284 ) ( not ( = ?auto_1284 ?auto_1285 ) ) ( HOIST-AT ?auto_1283 ?auto_1284 ) ( not ( = ?auto_1287 ?auto_1283 ) ) ( AVAILABLE ?auto_1283 ) ( SURFACE-AT ?auto_1282 ?auto_1284 ) ( ON ?auto_1282 ?auto_1288 ) ( CLEAR ?auto_1282 ) ( not ( = ?auto_1281 ?auto_1288 ) ) ( not ( = ?auto_1282 ?auto_1288 ) ) )
    :subtasks
    ( ( !LIFT ?auto_1283 ?auto_1282 ?auto_1288 ?auto_1284 )
      ( MAKE-1CRATE ?auto_1281 ?auto_1282 )
      ( MAKE-1CRATE-VERIFY ?auto_1281 ?auto_1282 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1289 - SURFACE
      ?auto_1290 - SURFACE
    )
    :vars
    (
      ?auto_1296 - HOIST
      ?auto_1291 - PLACE
      ?auto_1295 - PLACE
      ?auto_1293 - HOIST
      ?auto_1292 - SURFACE
      ?auto_1294 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1296 ?auto_1291 ) ( SURFACE-AT ?auto_1289 ?auto_1291 ) ( CLEAR ?auto_1289 ) ( IS-CRATE ?auto_1290 ) ( not ( = ?auto_1289 ?auto_1290 ) ) ( AVAILABLE ?auto_1296 ) ( not ( = ?auto_1295 ?auto_1291 ) ) ( HOIST-AT ?auto_1293 ?auto_1295 ) ( not ( = ?auto_1296 ?auto_1293 ) ) ( AVAILABLE ?auto_1293 ) ( SURFACE-AT ?auto_1290 ?auto_1295 ) ( ON ?auto_1290 ?auto_1292 ) ( CLEAR ?auto_1290 ) ( not ( = ?auto_1289 ?auto_1292 ) ) ( not ( = ?auto_1290 ?auto_1292 ) ) ( TRUCK-AT ?auto_1294 ?auto_1291 ) )
    :subtasks
    ( ( !DRIVE ?auto_1294 ?auto_1291 ?auto_1295 )
      ( MAKE-1CRATE ?auto_1289 ?auto_1290 )
      ( MAKE-1CRATE-VERIFY ?auto_1289 ?auto_1290 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1302 - SURFACE
      ?auto_1303 - SURFACE
    )
    :vars
    (
      ?auto_1304 - HOIST
      ?auto_1305 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1304 ?auto_1305 ) ( SURFACE-AT ?auto_1302 ?auto_1305 ) ( CLEAR ?auto_1302 ) ( LIFTING ?auto_1304 ?auto_1303 ) ( IS-CRATE ?auto_1303 ) ( not ( = ?auto_1302 ?auto_1303 ) ) )
    :subtasks
    ( ( !DROP ?auto_1304 ?auto_1303 ?auto_1302 ?auto_1305 )
      ( MAKE-1CRATE-VERIFY ?auto_1302 ?auto_1303 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1306 - SURFACE
      ?auto_1307 - SURFACE
      ?auto_1308 - SURFACE
    )
    :vars
    (
      ?auto_1309 - HOIST
      ?auto_1310 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1309 ?auto_1310 ) ( SURFACE-AT ?auto_1307 ?auto_1310 ) ( CLEAR ?auto_1307 ) ( LIFTING ?auto_1309 ?auto_1308 ) ( IS-CRATE ?auto_1308 ) ( not ( = ?auto_1307 ?auto_1308 ) ) ( ON ?auto_1307 ?auto_1306 ) ( not ( = ?auto_1306 ?auto_1307 ) ) ( not ( = ?auto_1306 ?auto_1308 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1307 ?auto_1308 )
      ( MAKE-2CRATE-VERIFY ?auto_1306 ?auto_1307 ?auto_1308 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1311 - SURFACE
      ?auto_1312 - SURFACE
    )
    :vars
    (
      ?auto_1313 - HOIST
      ?auto_1314 - PLACE
      ?auto_1315 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1313 ?auto_1314 ) ( SURFACE-AT ?auto_1311 ?auto_1314 ) ( CLEAR ?auto_1311 ) ( IS-CRATE ?auto_1312 ) ( not ( = ?auto_1311 ?auto_1312 ) ) ( TRUCK-AT ?auto_1315 ?auto_1314 ) ( AVAILABLE ?auto_1313 ) ( IN ?auto_1312 ?auto_1315 ) )
    :subtasks
    ( ( !UNLOAD ?auto_1313 ?auto_1312 ?auto_1315 ?auto_1314 )
      ( MAKE-1CRATE ?auto_1311 ?auto_1312 )
      ( MAKE-1CRATE-VERIFY ?auto_1311 ?auto_1312 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1316 - SURFACE
      ?auto_1317 - SURFACE
      ?auto_1318 - SURFACE
    )
    :vars
    (
      ?auto_1321 - HOIST
      ?auto_1319 - PLACE
      ?auto_1320 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1321 ?auto_1319 ) ( SURFACE-AT ?auto_1317 ?auto_1319 ) ( CLEAR ?auto_1317 ) ( IS-CRATE ?auto_1318 ) ( not ( = ?auto_1317 ?auto_1318 ) ) ( TRUCK-AT ?auto_1320 ?auto_1319 ) ( AVAILABLE ?auto_1321 ) ( IN ?auto_1318 ?auto_1320 ) ( ON ?auto_1317 ?auto_1316 ) ( not ( = ?auto_1316 ?auto_1317 ) ) ( not ( = ?auto_1316 ?auto_1318 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1317 ?auto_1318 )
      ( MAKE-2CRATE-VERIFY ?auto_1316 ?auto_1317 ?auto_1318 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1322 - SURFACE
      ?auto_1323 - SURFACE
    )
    :vars
    (
      ?auto_1326 - HOIST
      ?auto_1324 - PLACE
      ?auto_1325 - TRUCK
      ?auto_1327 - SURFACE
      ?auto_1328 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1326 ?auto_1324 ) ( SURFACE-AT ?auto_1322 ?auto_1324 ) ( CLEAR ?auto_1322 ) ( IS-CRATE ?auto_1323 ) ( not ( = ?auto_1322 ?auto_1323 ) ) ( AVAILABLE ?auto_1326 ) ( IN ?auto_1323 ?auto_1325 ) ( ON ?auto_1322 ?auto_1327 ) ( not ( = ?auto_1327 ?auto_1322 ) ) ( not ( = ?auto_1327 ?auto_1323 ) ) ( TRUCK-AT ?auto_1325 ?auto_1328 ) ( not ( = ?auto_1328 ?auto_1324 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1325 ?auto_1328 ?auto_1324 )
      ( MAKE-2CRATE ?auto_1327 ?auto_1322 ?auto_1323 )
      ( MAKE-1CRATE-VERIFY ?auto_1322 ?auto_1323 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1329 - SURFACE
      ?auto_1330 - SURFACE
      ?auto_1331 - SURFACE
    )
    :vars
    (
      ?auto_1335 - HOIST
      ?auto_1332 - PLACE
      ?auto_1333 - TRUCK
      ?auto_1334 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1335 ?auto_1332 ) ( SURFACE-AT ?auto_1330 ?auto_1332 ) ( CLEAR ?auto_1330 ) ( IS-CRATE ?auto_1331 ) ( not ( = ?auto_1330 ?auto_1331 ) ) ( AVAILABLE ?auto_1335 ) ( IN ?auto_1331 ?auto_1333 ) ( ON ?auto_1330 ?auto_1329 ) ( not ( = ?auto_1329 ?auto_1330 ) ) ( not ( = ?auto_1329 ?auto_1331 ) ) ( TRUCK-AT ?auto_1333 ?auto_1334 ) ( not ( = ?auto_1334 ?auto_1332 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1330 ?auto_1331 )
      ( MAKE-2CRATE-VERIFY ?auto_1329 ?auto_1330 ?auto_1331 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1336 - SURFACE
      ?auto_1337 - SURFACE
    )
    :vars
    (
      ?auto_1338 - HOIST
      ?auto_1340 - PLACE
      ?auto_1342 - SURFACE
      ?auto_1339 - TRUCK
      ?auto_1341 - PLACE
      ?auto_1343 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1338 ?auto_1340 ) ( SURFACE-AT ?auto_1336 ?auto_1340 ) ( CLEAR ?auto_1336 ) ( IS-CRATE ?auto_1337 ) ( not ( = ?auto_1336 ?auto_1337 ) ) ( AVAILABLE ?auto_1338 ) ( ON ?auto_1336 ?auto_1342 ) ( not ( = ?auto_1342 ?auto_1336 ) ) ( not ( = ?auto_1342 ?auto_1337 ) ) ( TRUCK-AT ?auto_1339 ?auto_1341 ) ( not ( = ?auto_1341 ?auto_1340 ) ) ( HOIST-AT ?auto_1343 ?auto_1341 ) ( LIFTING ?auto_1343 ?auto_1337 ) ( not ( = ?auto_1338 ?auto_1343 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1343 ?auto_1337 ?auto_1339 ?auto_1341 )
      ( MAKE-2CRATE ?auto_1342 ?auto_1336 ?auto_1337 )
      ( MAKE-1CRATE-VERIFY ?auto_1336 ?auto_1337 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1344 - SURFACE
      ?auto_1345 - SURFACE
      ?auto_1346 - SURFACE
    )
    :vars
    (
      ?auto_1348 - HOIST
      ?auto_1347 - PLACE
      ?auto_1351 - TRUCK
      ?auto_1349 - PLACE
      ?auto_1350 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1348 ?auto_1347 ) ( SURFACE-AT ?auto_1345 ?auto_1347 ) ( CLEAR ?auto_1345 ) ( IS-CRATE ?auto_1346 ) ( not ( = ?auto_1345 ?auto_1346 ) ) ( AVAILABLE ?auto_1348 ) ( ON ?auto_1345 ?auto_1344 ) ( not ( = ?auto_1344 ?auto_1345 ) ) ( not ( = ?auto_1344 ?auto_1346 ) ) ( TRUCK-AT ?auto_1351 ?auto_1349 ) ( not ( = ?auto_1349 ?auto_1347 ) ) ( HOIST-AT ?auto_1350 ?auto_1349 ) ( LIFTING ?auto_1350 ?auto_1346 ) ( not ( = ?auto_1348 ?auto_1350 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1345 ?auto_1346 )
      ( MAKE-2CRATE-VERIFY ?auto_1344 ?auto_1345 ?auto_1346 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1352 - SURFACE
      ?auto_1353 - SURFACE
    )
    :vars
    (
      ?auto_1359 - HOIST
      ?auto_1356 - PLACE
      ?auto_1354 - SURFACE
      ?auto_1358 - TRUCK
      ?auto_1357 - PLACE
      ?auto_1355 - HOIST
      ?auto_1360 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1359 ?auto_1356 ) ( SURFACE-AT ?auto_1352 ?auto_1356 ) ( CLEAR ?auto_1352 ) ( IS-CRATE ?auto_1353 ) ( not ( = ?auto_1352 ?auto_1353 ) ) ( AVAILABLE ?auto_1359 ) ( ON ?auto_1352 ?auto_1354 ) ( not ( = ?auto_1354 ?auto_1352 ) ) ( not ( = ?auto_1354 ?auto_1353 ) ) ( TRUCK-AT ?auto_1358 ?auto_1357 ) ( not ( = ?auto_1357 ?auto_1356 ) ) ( HOIST-AT ?auto_1355 ?auto_1357 ) ( not ( = ?auto_1359 ?auto_1355 ) ) ( AVAILABLE ?auto_1355 ) ( SURFACE-AT ?auto_1353 ?auto_1357 ) ( ON ?auto_1353 ?auto_1360 ) ( CLEAR ?auto_1353 ) ( not ( = ?auto_1352 ?auto_1360 ) ) ( not ( = ?auto_1353 ?auto_1360 ) ) ( not ( = ?auto_1354 ?auto_1360 ) ) )
    :subtasks
    ( ( !LIFT ?auto_1355 ?auto_1353 ?auto_1360 ?auto_1357 )
      ( MAKE-2CRATE ?auto_1354 ?auto_1352 ?auto_1353 )
      ( MAKE-1CRATE-VERIFY ?auto_1352 ?auto_1353 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1361 - SURFACE
      ?auto_1362 - SURFACE
      ?auto_1363 - SURFACE
    )
    :vars
    (
      ?auto_1366 - HOIST
      ?auto_1367 - PLACE
      ?auto_1365 - TRUCK
      ?auto_1364 - PLACE
      ?auto_1369 - HOIST
      ?auto_1368 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1366 ?auto_1367 ) ( SURFACE-AT ?auto_1362 ?auto_1367 ) ( CLEAR ?auto_1362 ) ( IS-CRATE ?auto_1363 ) ( not ( = ?auto_1362 ?auto_1363 ) ) ( AVAILABLE ?auto_1366 ) ( ON ?auto_1362 ?auto_1361 ) ( not ( = ?auto_1361 ?auto_1362 ) ) ( not ( = ?auto_1361 ?auto_1363 ) ) ( TRUCK-AT ?auto_1365 ?auto_1364 ) ( not ( = ?auto_1364 ?auto_1367 ) ) ( HOIST-AT ?auto_1369 ?auto_1364 ) ( not ( = ?auto_1366 ?auto_1369 ) ) ( AVAILABLE ?auto_1369 ) ( SURFACE-AT ?auto_1363 ?auto_1364 ) ( ON ?auto_1363 ?auto_1368 ) ( CLEAR ?auto_1363 ) ( not ( = ?auto_1362 ?auto_1368 ) ) ( not ( = ?auto_1363 ?auto_1368 ) ) ( not ( = ?auto_1361 ?auto_1368 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1362 ?auto_1363 )
      ( MAKE-2CRATE-VERIFY ?auto_1361 ?auto_1362 ?auto_1363 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1370 - SURFACE
      ?auto_1371 - SURFACE
    )
    :vars
    (
      ?auto_1377 - HOIST
      ?auto_1375 - PLACE
      ?auto_1376 - SURFACE
      ?auto_1374 - PLACE
      ?auto_1372 - HOIST
      ?auto_1373 - SURFACE
      ?auto_1378 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1377 ?auto_1375 ) ( SURFACE-AT ?auto_1370 ?auto_1375 ) ( CLEAR ?auto_1370 ) ( IS-CRATE ?auto_1371 ) ( not ( = ?auto_1370 ?auto_1371 ) ) ( AVAILABLE ?auto_1377 ) ( ON ?auto_1370 ?auto_1376 ) ( not ( = ?auto_1376 ?auto_1370 ) ) ( not ( = ?auto_1376 ?auto_1371 ) ) ( not ( = ?auto_1374 ?auto_1375 ) ) ( HOIST-AT ?auto_1372 ?auto_1374 ) ( not ( = ?auto_1377 ?auto_1372 ) ) ( AVAILABLE ?auto_1372 ) ( SURFACE-AT ?auto_1371 ?auto_1374 ) ( ON ?auto_1371 ?auto_1373 ) ( CLEAR ?auto_1371 ) ( not ( = ?auto_1370 ?auto_1373 ) ) ( not ( = ?auto_1371 ?auto_1373 ) ) ( not ( = ?auto_1376 ?auto_1373 ) ) ( TRUCK-AT ?auto_1378 ?auto_1375 ) )
    :subtasks
    ( ( !DRIVE ?auto_1378 ?auto_1375 ?auto_1374 )
      ( MAKE-2CRATE ?auto_1376 ?auto_1370 ?auto_1371 )
      ( MAKE-1CRATE-VERIFY ?auto_1370 ?auto_1371 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1379 - SURFACE
      ?auto_1380 - SURFACE
      ?auto_1381 - SURFACE
    )
    :vars
    (
      ?auto_1382 - HOIST
      ?auto_1383 - PLACE
      ?auto_1387 - PLACE
      ?auto_1385 - HOIST
      ?auto_1386 - SURFACE
      ?auto_1384 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1382 ?auto_1383 ) ( SURFACE-AT ?auto_1380 ?auto_1383 ) ( CLEAR ?auto_1380 ) ( IS-CRATE ?auto_1381 ) ( not ( = ?auto_1380 ?auto_1381 ) ) ( AVAILABLE ?auto_1382 ) ( ON ?auto_1380 ?auto_1379 ) ( not ( = ?auto_1379 ?auto_1380 ) ) ( not ( = ?auto_1379 ?auto_1381 ) ) ( not ( = ?auto_1387 ?auto_1383 ) ) ( HOIST-AT ?auto_1385 ?auto_1387 ) ( not ( = ?auto_1382 ?auto_1385 ) ) ( AVAILABLE ?auto_1385 ) ( SURFACE-AT ?auto_1381 ?auto_1387 ) ( ON ?auto_1381 ?auto_1386 ) ( CLEAR ?auto_1381 ) ( not ( = ?auto_1380 ?auto_1386 ) ) ( not ( = ?auto_1381 ?auto_1386 ) ) ( not ( = ?auto_1379 ?auto_1386 ) ) ( TRUCK-AT ?auto_1384 ?auto_1383 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1380 ?auto_1381 )
      ( MAKE-2CRATE-VERIFY ?auto_1379 ?auto_1380 ?auto_1381 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1388 - SURFACE
      ?auto_1389 - SURFACE
    )
    :vars
    (
      ?auto_1395 - HOIST
      ?auto_1390 - PLACE
      ?auto_1393 - SURFACE
      ?auto_1396 - PLACE
      ?auto_1392 - HOIST
      ?auto_1394 - SURFACE
      ?auto_1391 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1395 ?auto_1390 ) ( IS-CRATE ?auto_1389 ) ( not ( = ?auto_1388 ?auto_1389 ) ) ( not ( = ?auto_1393 ?auto_1388 ) ) ( not ( = ?auto_1393 ?auto_1389 ) ) ( not ( = ?auto_1396 ?auto_1390 ) ) ( HOIST-AT ?auto_1392 ?auto_1396 ) ( not ( = ?auto_1395 ?auto_1392 ) ) ( AVAILABLE ?auto_1392 ) ( SURFACE-AT ?auto_1389 ?auto_1396 ) ( ON ?auto_1389 ?auto_1394 ) ( CLEAR ?auto_1389 ) ( not ( = ?auto_1388 ?auto_1394 ) ) ( not ( = ?auto_1389 ?auto_1394 ) ) ( not ( = ?auto_1393 ?auto_1394 ) ) ( TRUCK-AT ?auto_1391 ?auto_1390 ) ( SURFACE-AT ?auto_1393 ?auto_1390 ) ( CLEAR ?auto_1393 ) ( LIFTING ?auto_1395 ?auto_1388 ) ( IS-CRATE ?auto_1388 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1393 ?auto_1388 )
      ( MAKE-2CRATE ?auto_1393 ?auto_1388 ?auto_1389 )
      ( MAKE-1CRATE-VERIFY ?auto_1388 ?auto_1389 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1397 - SURFACE
      ?auto_1398 - SURFACE
      ?auto_1399 - SURFACE
    )
    :vars
    (
      ?auto_1401 - HOIST
      ?auto_1404 - PLACE
      ?auto_1402 - PLACE
      ?auto_1400 - HOIST
      ?auto_1405 - SURFACE
      ?auto_1403 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1401 ?auto_1404 ) ( IS-CRATE ?auto_1399 ) ( not ( = ?auto_1398 ?auto_1399 ) ) ( not ( = ?auto_1397 ?auto_1398 ) ) ( not ( = ?auto_1397 ?auto_1399 ) ) ( not ( = ?auto_1402 ?auto_1404 ) ) ( HOIST-AT ?auto_1400 ?auto_1402 ) ( not ( = ?auto_1401 ?auto_1400 ) ) ( AVAILABLE ?auto_1400 ) ( SURFACE-AT ?auto_1399 ?auto_1402 ) ( ON ?auto_1399 ?auto_1405 ) ( CLEAR ?auto_1399 ) ( not ( = ?auto_1398 ?auto_1405 ) ) ( not ( = ?auto_1399 ?auto_1405 ) ) ( not ( = ?auto_1397 ?auto_1405 ) ) ( TRUCK-AT ?auto_1403 ?auto_1404 ) ( SURFACE-AT ?auto_1397 ?auto_1404 ) ( CLEAR ?auto_1397 ) ( LIFTING ?auto_1401 ?auto_1398 ) ( IS-CRATE ?auto_1398 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1398 ?auto_1399 )
      ( MAKE-2CRATE-VERIFY ?auto_1397 ?auto_1398 ?auto_1399 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1406 - SURFACE
      ?auto_1407 - SURFACE
    )
    :vars
    (
      ?auto_1410 - HOIST
      ?auto_1409 - PLACE
      ?auto_1412 - SURFACE
      ?auto_1413 - PLACE
      ?auto_1414 - HOIST
      ?auto_1408 - SURFACE
      ?auto_1411 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1410 ?auto_1409 ) ( IS-CRATE ?auto_1407 ) ( not ( = ?auto_1406 ?auto_1407 ) ) ( not ( = ?auto_1412 ?auto_1406 ) ) ( not ( = ?auto_1412 ?auto_1407 ) ) ( not ( = ?auto_1413 ?auto_1409 ) ) ( HOIST-AT ?auto_1414 ?auto_1413 ) ( not ( = ?auto_1410 ?auto_1414 ) ) ( AVAILABLE ?auto_1414 ) ( SURFACE-AT ?auto_1407 ?auto_1413 ) ( ON ?auto_1407 ?auto_1408 ) ( CLEAR ?auto_1407 ) ( not ( = ?auto_1406 ?auto_1408 ) ) ( not ( = ?auto_1407 ?auto_1408 ) ) ( not ( = ?auto_1412 ?auto_1408 ) ) ( TRUCK-AT ?auto_1411 ?auto_1409 ) ( SURFACE-AT ?auto_1412 ?auto_1409 ) ( CLEAR ?auto_1412 ) ( IS-CRATE ?auto_1406 ) ( AVAILABLE ?auto_1410 ) ( IN ?auto_1406 ?auto_1411 ) )
    :subtasks
    ( ( !UNLOAD ?auto_1410 ?auto_1406 ?auto_1411 ?auto_1409 )
      ( MAKE-2CRATE ?auto_1412 ?auto_1406 ?auto_1407 )
      ( MAKE-1CRATE-VERIFY ?auto_1406 ?auto_1407 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1415 - SURFACE
      ?auto_1416 - SURFACE
      ?auto_1417 - SURFACE
    )
    :vars
    (
      ?auto_1422 - HOIST
      ?auto_1420 - PLACE
      ?auto_1423 - PLACE
      ?auto_1419 - HOIST
      ?auto_1418 - SURFACE
      ?auto_1421 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1422 ?auto_1420 ) ( IS-CRATE ?auto_1417 ) ( not ( = ?auto_1416 ?auto_1417 ) ) ( not ( = ?auto_1415 ?auto_1416 ) ) ( not ( = ?auto_1415 ?auto_1417 ) ) ( not ( = ?auto_1423 ?auto_1420 ) ) ( HOIST-AT ?auto_1419 ?auto_1423 ) ( not ( = ?auto_1422 ?auto_1419 ) ) ( AVAILABLE ?auto_1419 ) ( SURFACE-AT ?auto_1417 ?auto_1423 ) ( ON ?auto_1417 ?auto_1418 ) ( CLEAR ?auto_1417 ) ( not ( = ?auto_1416 ?auto_1418 ) ) ( not ( = ?auto_1417 ?auto_1418 ) ) ( not ( = ?auto_1415 ?auto_1418 ) ) ( TRUCK-AT ?auto_1421 ?auto_1420 ) ( SURFACE-AT ?auto_1415 ?auto_1420 ) ( CLEAR ?auto_1415 ) ( IS-CRATE ?auto_1416 ) ( AVAILABLE ?auto_1422 ) ( IN ?auto_1416 ?auto_1421 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1416 ?auto_1417 )
      ( MAKE-2CRATE-VERIFY ?auto_1415 ?auto_1416 ?auto_1417 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1424 - SURFACE
      ?auto_1425 - SURFACE
    )
    :vars
    (
      ?auto_1431 - HOIST
      ?auto_1426 - PLACE
      ?auto_1430 - SURFACE
      ?auto_1432 - PLACE
      ?auto_1427 - HOIST
      ?auto_1428 - SURFACE
      ?auto_1429 - TRUCK
      ?auto_1433 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1431 ?auto_1426 ) ( IS-CRATE ?auto_1425 ) ( not ( = ?auto_1424 ?auto_1425 ) ) ( not ( = ?auto_1430 ?auto_1424 ) ) ( not ( = ?auto_1430 ?auto_1425 ) ) ( not ( = ?auto_1432 ?auto_1426 ) ) ( HOIST-AT ?auto_1427 ?auto_1432 ) ( not ( = ?auto_1431 ?auto_1427 ) ) ( AVAILABLE ?auto_1427 ) ( SURFACE-AT ?auto_1425 ?auto_1432 ) ( ON ?auto_1425 ?auto_1428 ) ( CLEAR ?auto_1425 ) ( not ( = ?auto_1424 ?auto_1428 ) ) ( not ( = ?auto_1425 ?auto_1428 ) ) ( not ( = ?auto_1430 ?auto_1428 ) ) ( SURFACE-AT ?auto_1430 ?auto_1426 ) ( CLEAR ?auto_1430 ) ( IS-CRATE ?auto_1424 ) ( AVAILABLE ?auto_1431 ) ( IN ?auto_1424 ?auto_1429 ) ( TRUCK-AT ?auto_1429 ?auto_1433 ) ( not ( = ?auto_1433 ?auto_1426 ) ) ( not ( = ?auto_1432 ?auto_1433 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1429 ?auto_1433 ?auto_1426 )
      ( MAKE-2CRATE ?auto_1430 ?auto_1424 ?auto_1425 )
      ( MAKE-1CRATE-VERIFY ?auto_1424 ?auto_1425 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1434 - SURFACE
      ?auto_1435 - SURFACE
      ?auto_1436 - SURFACE
    )
    :vars
    (
      ?auto_1441 - HOIST
      ?auto_1443 - PLACE
      ?auto_1442 - PLACE
      ?auto_1440 - HOIST
      ?auto_1438 - SURFACE
      ?auto_1437 - TRUCK
      ?auto_1439 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1441 ?auto_1443 ) ( IS-CRATE ?auto_1436 ) ( not ( = ?auto_1435 ?auto_1436 ) ) ( not ( = ?auto_1434 ?auto_1435 ) ) ( not ( = ?auto_1434 ?auto_1436 ) ) ( not ( = ?auto_1442 ?auto_1443 ) ) ( HOIST-AT ?auto_1440 ?auto_1442 ) ( not ( = ?auto_1441 ?auto_1440 ) ) ( AVAILABLE ?auto_1440 ) ( SURFACE-AT ?auto_1436 ?auto_1442 ) ( ON ?auto_1436 ?auto_1438 ) ( CLEAR ?auto_1436 ) ( not ( = ?auto_1435 ?auto_1438 ) ) ( not ( = ?auto_1436 ?auto_1438 ) ) ( not ( = ?auto_1434 ?auto_1438 ) ) ( SURFACE-AT ?auto_1434 ?auto_1443 ) ( CLEAR ?auto_1434 ) ( IS-CRATE ?auto_1435 ) ( AVAILABLE ?auto_1441 ) ( IN ?auto_1435 ?auto_1437 ) ( TRUCK-AT ?auto_1437 ?auto_1439 ) ( not ( = ?auto_1439 ?auto_1443 ) ) ( not ( = ?auto_1442 ?auto_1439 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1435 ?auto_1436 )
      ( MAKE-2CRATE-VERIFY ?auto_1434 ?auto_1435 ?auto_1436 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1444 - SURFACE
      ?auto_1445 - SURFACE
    )
    :vars
    (
      ?auto_1447 - HOIST
      ?auto_1451 - PLACE
      ?auto_1446 - SURFACE
      ?auto_1452 - PLACE
      ?auto_1453 - HOIST
      ?auto_1450 - SURFACE
      ?auto_1448 - TRUCK
      ?auto_1449 - PLACE
      ?auto_1454 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1447 ?auto_1451 ) ( IS-CRATE ?auto_1445 ) ( not ( = ?auto_1444 ?auto_1445 ) ) ( not ( = ?auto_1446 ?auto_1444 ) ) ( not ( = ?auto_1446 ?auto_1445 ) ) ( not ( = ?auto_1452 ?auto_1451 ) ) ( HOIST-AT ?auto_1453 ?auto_1452 ) ( not ( = ?auto_1447 ?auto_1453 ) ) ( AVAILABLE ?auto_1453 ) ( SURFACE-AT ?auto_1445 ?auto_1452 ) ( ON ?auto_1445 ?auto_1450 ) ( CLEAR ?auto_1445 ) ( not ( = ?auto_1444 ?auto_1450 ) ) ( not ( = ?auto_1445 ?auto_1450 ) ) ( not ( = ?auto_1446 ?auto_1450 ) ) ( SURFACE-AT ?auto_1446 ?auto_1451 ) ( CLEAR ?auto_1446 ) ( IS-CRATE ?auto_1444 ) ( AVAILABLE ?auto_1447 ) ( TRUCK-AT ?auto_1448 ?auto_1449 ) ( not ( = ?auto_1449 ?auto_1451 ) ) ( not ( = ?auto_1452 ?auto_1449 ) ) ( HOIST-AT ?auto_1454 ?auto_1449 ) ( LIFTING ?auto_1454 ?auto_1444 ) ( not ( = ?auto_1447 ?auto_1454 ) ) ( not ( = ?auto_1453 ?auto_1454 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1454 ?auto_1444 ?auto_1448 ?auto_1449 )
      ( MAKE-2CRATE ?auto_1446 ?auto_1444 ?auto_1445 )
      ( MAKE-1CRATE-VERIFY ?auto_1444 ?auto_1445 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1455 - SURFACE
      ?auto_1456 - SURFACE
      ?auto_1457 - SURFACE
    )
    :vars
    (
      ?auto_1458 - HOIST
      ?auto_1465 - PLACE
      ?auto_1462 - PLACE
      ?auto_1461 - HOIST
      ?auto_1460 - SURFACE
      ?auto_1463 - TRUCK
      ?auto_1464 - PLACE
      ?auto_1459 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1458 ?auto_1465 ) ( IS-CRATE ?auto_1457 ) ( not ( = ?auto_1456 ?auto_1457 ) ) ( not ( = ?auto_1455 ?auto_1456 ) ) ( not ( = ?auto_1455 ?auto_1457 ) ) ( not ( = ?auto_1462 ?auto_1465 ) ) ( HOIST-AT ?auto_1461 ?auto_1462 ) ( not ( = ?auto_1458 ?auto_1461 ) ) ( AVAILABLE ?auto_1461 ) ( SURFACE-AT ?auto_1457 ?auto_1462 ) ( ON ?auto_1457 ?auto_1460 ) ( CLEAR ?auto_1457 ) ( not ( = ?auto_1456 ?auto_1460 ) ) ( not ( = ?auto_1457 ?auto_1460 ) ) ( not ( = ?auto_1455 ?auto_1460 ) ) ( SURFACE-AT ?auto_1455 ?auto_1465 ) ( CLEAR ?auto_1455 ) ( IS-CRATE ?auto_1456 ) ( AVAILABLE ?auto_1458 ) ( TRUCK-AT ?auto_1463 ?auto_1464 ) ( not ( = ?auto_1464 ?auto_1465 ) ) ( not ( = ?auto_1462 ?auto_1464 ) ) ( HOIST-AT ?auto_1459 ?auto_1464 ) ( LIFTING ?auto_1459 ?auto_1456 ) ( not ( = ?auto_1458 ?auto_1459 ) ) ( not ( = ?auto_1461 ?auto_1459 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1456 ?auto_1457 )
      ( MAKE-2CRATE-VERIFY ?auto_1455 ?auto_1456 ?auto_1457 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1466 - SURFACE
      ?auto_1467 - SURFACE
    )
    :vars
    (
      ?auto_1473 - HOIST
      ?auto_1476 - PLACE
      ?auto_1474 - SURFACE
      ?auto_1472 - PLACE
      ?auto_1470 - HOIST
      ?auto_1469 - SURFACE
      ?auto_1475 - TRUCK
      ?auto_1471 - PLACE
      ?auto_1468 - HOIST
      ?auto_1477 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1473 ?auto_1476 ) ( IS-CRATE ?auto_1467 ) ( not ( = ?auto_1466 ?auto_1467 ) ) ( not ( = ?auto_1474 ?auto_1466 ) ) ( not ( = ?auto_1474 ?auto_1467 ) ) ( not ( = ?auto_1472 ?auto_1476 ) ) ( HOIST-AT ?auto_1470 ?auto_1472 ) ( not ( = ?auto_1473 ?auto_1470 ) ) ( AVAILABLE ?auto_1470 ) ( SURFACE-AT ?auto_1467 ?auto_1472 ) ( ON ?auto_1467 ?auto_1469 ) ( CLEAR ?auto_1467 ) ( not ( = ?auto_1466 ?auto_1469 ) ) ( not ( = ?auto_1467 ?auto_1469 ) ) ( not ( = ?auto_1474 ?auto_1469 ) ) ( SURFACE-AT ?auto_1474 ?auto_1476 ) ( CLEAR ?auto_1474 ) ( IS-CRATE ?auto_1466 ) ( AVAILABLE ?auto_1473 ) ( TRUCK-AT ?auto_1475 ?auto_1471 ) ( not ( = ?auto_1471 ?auto_1476 ) ) ( not ( = ?auto_1472 ?auto_1471 ) ) ( HOIST-AT ?auto_1468 ?auto_1471 ) ( not ( = ?auto_1473 ?auto_1468 ) ) ( not ( = ?auto_1470 ?auto_1468 ) ) ( AVAILABLE ?auto_1468 ) ( SURFACE-AT ?auto_1466 ?auto_1471 ) ( ON ?auto_1466 ?auto_1477 ) ( CLEAR ?auto_1466 ) ( not ( = ?auto_1466 ?auto_1477 ) ) ( not ( = ?auto_1467 ?auto_1477 ) ) ( not ( = ?auto_1474 ?auto_1477 ) ) ( not ( = ?auto_1469 ?auto_1477 ) ) )
    :subtasks
    ( ( !LIFT ?auto_1468 ?auto_1466 ?auto_1477 ?auto_1471 )
      ( MAKE-2CRATE ?auto_1474 ?auto_1466 ?auto_1467 )
      ( MAKE-1CRATE-VERIFY ?auto_1466 ?auto_1467 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1478 - SURFACE
      ?auto_1479 - SURFACE
      ?auto_1480 - SURFACE
    )
    :vars
    (
      ?auto_1483 - HOIST
      ?auto_1488 - PLACE
      ?auto_1487 - PLACE
      ?auto_1482 - HOIST
      ?auto_1485 - SURFACE
      ?auto_1486 - TRUCK
      ?auto_1484 - PLACE
      ?auto_1481 - HOIST
      ?auto_1489 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1483 ?auto_1488 ) ( IS-CRATE ?auto_1480 ) ( not ( = ?auto_1479 ?auto_1480 ) ) ( not ( = ?auto_1478 ?auto_1479 ) ) ( not ( = ?auto_1478 ?auto_1480 ) ) ( not ( = ?auto_1487 ?auto_1488 ) ) ( HOIST-AT ?auto_1482 ?auto_1487 ) ( not ( = ?auto_1483 ?auto_1482 ) ) ( AVAILABLE ?auto_1482 ) ( SURFACE-AT ?auto_1480 ?auto_1487 ) ( ON ?auto_1480 ?auto_1485 ) ( CLEAR ?auto_1480 ) ( not ( = ?auto_1479 ?auto_1485 ) ) ( not ( = ?auto_1480 ?auto_1485 ) ) ( not ( = ?auto_1478 ?auto_1485 ) ) ( SURFACE-AT ?auto_1478 ?auto_1488 ) ( CLEAR ?auto_1478 ) ( IS-CRATE ?auto_1479 ) ( AVAILABLE ?auto_1483 ) ( TRUCK-AT ?auto_1486 ?auto_1484 ) ( not ( = ?auto_1484 ?auto_1488 ) ) ( not ( = ?auto_1487 ?auto_1484 ) ) ( HOIST-AT ?auto_1481 ?auto_1484 ) ( not ( = ?auto_1483 ?auto_1481 ) ) ( not ( = ?auto_1482 ?auto_1481 ) ) ( AVAILABLE ?auto_1481 ) ( SURFACE-AT ?auto_1479 ?auto_1484 ) ( ON ?auto_1479 ?auto_1489 ) ( CLEAR ?auto_1479 ) ( not ( = ?auto_1479 ?auto_1489 ) ) ( not ( = ?auto_1480 ?auto_1489 ) ) ( not ( = ?auto_1478 ?auto_1489 ) ) ( not ( = ?auto_1485 ?auto_1489 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1479 ?auto_1480 )
      ( MAKE-2CRATE-VERIFY ?auto_1478 ?auto_1479 ?auto_1480 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1490 - SURFACE
      ?auto_1491 - SURFACE
    )
    :vars
    (
      ?auto_1495 - HOIST
      ?auto_1494 - PLACE
      ?auto_1501 - SURFACE
      ?auto_1497 - PLACE
      ?auto_1493 - HOIST
      ?auto_1500 - SURFACE
      ?auto_1492 - PLACE
      ?auto_1496 - HOIST
      ?auto_1499 - SURFACE
      ?auto_1498 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1495 ?auto_1494 ) ( IS-CRATE ?auto_1491 ) ( not ( = ?auto_1490 ?auto_1491 ) ) ( not ( = ?auto_1501 ?auto_1490 ) ) ( not ( = ?auto_1501 ?auto_1491 ) ) ( not ( = ?auto_1497 ?auto_1494 ) ) ( HOIST-AT ?auto_1493 ?auto_1497 ) ( not ( = ?auto_1495 ?auto_1493 ) ) ( AVAILABLE ?auto_1493 ) ( SURFACE-AT ?auto_1491 ?auto_1497 ) ( ON ?auto_1491 ?auto_1500 ) ( CLEAR ?auto_1491 ) ( not ( = ?auto_1490 ?auto_1500 ) ) ( not ( = ?auto_1491 ?auto_1500 ) ) ( not ( = ?auto_1501 ?auto_1500 ) ) ( SURFACE-AT ?auto_1501 ?auto_1494 ) ( CLEAR ?auto_1501 ) ( IS-CRATE ?auto_1490 ) ( AVAILABLE ?auto_1495 ) ( not ( = ?auto_1492 ?auto_1494 ) ) ( not ( = ?auto_1497 ?auto_1492 ) ) ( HOIST-AT ?auto_1496 ?auto_1492 ) ( not ( = ?auto_1495 ?auto_1496 ) ) ( not ( = ?auto_1493 ?auto_1496 ) ) ( AVAILABLE ?auto_1496 ) ( SURFACE-AT ?auto_1490 ?auto_1492 ) ( ON ?auto_1490 ?auto_1499 ) ( CLEAR ?auto_1490 ) ( not ( = ?auto_1490 ?auto_1499 ) ) ( not ( = ?auto_1491 ?auto_1499 ) ) ( not ( = ?auto_1501 ?auto_1499 ) ) ( not ( = ?auto_1500 ?auto_1499 ) ) ( TRUCK-AT ?auto_1498 ?auto_1494 ) )
    :subtasks
    ( ( !DRIVE ?auto_1498 ?auto_1494 ?auto_1492 )
      ( MAKE-2CRATE ?auto_1501 ?auto_1490 ?auto_1491 )
      ( MAKE-1CRATE-VERIFY ?auto_1490 ?auto_1491 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1502 - SURFACE
      ?auto_1503 - SURFACE
      ?auto_1504 - SURFACE
    )
    :vars
    (
      ?auto_1507 - HOIST
      ?auto_1512 - PLACE
      ?auto_1513 - PLACE
      ?auto_1506 - HOIST
      ?auto_1505 - SURFACE
      ?auto_1508 - PLACE
      ?auto_1511 - HOIST
      ?auto_1509 - SURFACE
      ?auto_1510 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1507 ?auto_1512 ) ( IS-CRATE ?auto_1504 ) ( not ( = ?auto_1503 ?auto_1504 ) ) ( not ( = ?auto_1502 ?auto_1503 ) ) ( not ( = ?auto_1502 ?auto_1504 ) ) ( not ( = ?auto_1513 ?auto_1512 ) ) ( HOIST-AT ?auto_1506 ?auto_1513 ) ( not ( = ?auto_1507 ?auto_1506 ) ) ( AVAILABLE ?auto_1506 ) ( SURFACE-AT ?auto_1504 ?auto_1513 ) ( ON ?auto_1504 ?auto_1505 ) ( CLEAR ?auto_1504 ) ( not ( = ?auto_1503 ?auto_1505 ) ) ( not ( = ?auto_1504 ?auto_1505 ) ) ( not ( = ?auto_1502 ?auto_1505 ) ) ( SURFACE-AT ?auto_1502 ?auto_1512 ) ( CLEAR ?auto_1502 ) ( IS-CRATE ?auto_1503 ) ( AVAILABLE ?auto_1507 ) ( not ( = ?auto_1508 ?auto_1512 ) ) ( not ( = ?auto_1513 ?auto_1508 ) ) ( HOIST-AT ?auto_1511 ?auto_1508 ) ( not ( = ?auto_1507 ?auto_1511 ) ) ( not ( = ?auto_1506 ?auto_1511 ) ) ( AVAILABLE ?auto_1511 ) ( SURFACE-AT ?auto_1503 ?auto_1508 ) ( ON ?auto_1503 ?auto_1509 ) ( CLEAR ?auto_1503 ) ( not ( = ?auto_1503 ?auto_1509 ) ) ( not ( = ?auto_1504 ?auto_1509 ) ) ( not ( = ?auto_1502 ?auto_1509 ) ) ( not ( = ?auto_1505 ?auto_1509 ) ) ( TRUCK-AT ?auto_1510 ?auto_1512 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1503 ?auto_1504 )
      ( MAKE-2CRATE-VERIFY ?auto_1502 ?auto_1503 ?auto_1504 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1523 - SURFACE
      ?auto_1524 - SURFACE
    )
    :vars
    (
      ?auto_1525 - HOIST
      ?auto_1526 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1525 ?auto_1526 ) ( SURFACE-AT ?auto_1523 ?auto_1526 ) ( CLEAR ?auto_1523 ) ( LIFTING ?auto_1525 ?auto_1524 ) ( IS-CRATE ?auto_1524 ) ( not ( = ?auto_1523 ?auto_1524 ) ) )
    :subtasks
    ( ( !DROP ?auto_1525 ?auto_1524 ?auto_1523 ?auto_1526 )
      ( MAKE-1CRATE-VERIFY ?auto_1523 ?auto_1524 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1527 - SURFACE
      ?auto_1528 - SURFACE
      ?auto_1529 - SURFACE
    )
    :vars
    (
      ?auto_1530 - HOIST
      ?auto_1531 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1530 ?auto_1531 ) ( SURFACE-AT ?auto_1528 ?auto_1531 ) ( CLEAR ?auto_1528 ) ( LIFTING ?auto_1530 ?auto_1529 ) ( IS-CRATE ?auto_1529 ) ( not ( = ?auto_1528 ?auto_1529 ) ) ( ON ?auto_1528 ?auto_1527 ) ( not ( = ?auto_1527 ?auto_1528 ) ) ( not ( = ?auto_1527 ?auto_1529 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1528 ?auto_1529 )
      ( MAKE-2CRATE-VERIFY ?auto_1527 ?auto_1528 ?auto_1529 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1532 - SURFACE
      ?auto_1533 - SURFACE
      ?auto_1534 - SURFACE
      ?auto_1535 - SURFACE
    )
    :vars
    (
      ?auto_1536 - HOIST
      ?auto_1537 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1536 ?auto_1537 ) ( SURFACE-AT ?auto_1534 ?auto_1537 ) ( CLEAR ?auto_1534 ) ( LIFTING ?auto_1536 ?auto_1535 ) ( IS-CRATE ?auto_1535 ) ( not ( = ?auto_1534 ?auto_1535 ) ) ( ON ?auto_1533 ?auto_1532 ) ( ON ?auto_1534 ?auto_1533 ) ( not ( = ?auto_1532 ?auto_1533 ) ) ( not ( = ?auto_1532 ?auto_1534 ) ) ( not ( = ?auto_1532 ?auto_1535 ) ) ( not ( = ?auto_1533 ?auto_1534 ) ) ( not ( = ?auto_1533 ?auto_1535 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1534 ?auto_1535 )
      ( MAKE-3CRATE-VERIFY ?auto_1532 ?auto_1533 ?auto_1534 ?auto_1535 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1538 - SURFACE
      ?auto_1539 - SURFACE
    )
    :vars
    (
      ?auto_1540 - HOIST
      ?auto_1541 - PLACE
      ?auto_1542 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1540 ?auto_1541 ) ( SURFACE-AT ?auto_1538 ?auto_1541 ) ( CLEAR ?auto_1538 ) ( IS-CRATE ?auto_1539 ) ( not ( = ?auto_1538 ?auto_1539 ) ) ( TRUCK-AT ?auto_1542 ?auto_1541 ) ( AVAILABLE ?auto_1540 ) ( IN ?auto_1539 ?auto_1542 ) )
    :subtasks
    ( ( !UNLOAD ?auto_1540 ?auto_1539 ?auto_1542 ?auto_1541 )
      ( MAKE-1CRATE ?auto_1538 ?auto_1539 )
      ( MAKE-1CRATE-VERIFY ?auto_1538 ?auto_1539 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1543 - SURFACE
      ?auto_1544 - SURFACE
      ?auto_1545 - SURFACE
    )
    :vars
    (
      ?auto_1546 - HOIST
      ?auto_1548 - PLACE
      ?auto_1547 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1546 ?auto_1548 ) ( SURFACE-AT ?auto_1544 ?auto_1548 ) ( CLEAR ?auto_1544 ) ( IS-CRATE ?auto_1545 ) ( not ( = ?auto_1544 ?auto_1545 ) ) ( TRUCK-AT ?auto_1547 ?auto_1548 ) ( AVAILABLE ?auto_1546 ) ( IN ?auto_1545 ?auto_1547 ) ( ON ?auto_1544 ?auto_1543 ) ( not ( = ?auto_1543 ?auto_1544 ) ) ( not ( = ?auto_1543 ?auto_1545 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1544 ?auto_1545 )
      ( MAKE-2CRATE-VERIFY ?auto_1543 ?auto_1544 ?auto_1545 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1549 - SURFACE
      ?auto_1550 - SURFACE
      ?auto_1551 - SURFACE
      ?auto_1552 - SURFACE
    )
    :vars
    (
      ?auto_1554 - HOIST
      ?auto_1555 - PLACE
      ?auto_1553 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1554 ?auto_1555 ) ( SURFACE-AT ?auto_1551 ?auto_1555 ) ( CLEAR ?auto_1551 ) ( IS-CRATE ?auto_1552 ) ( not ( = ?auto_1551 ?auto_1552 ) ) ( TRUCK-AT ?auto_1553 ?auto_1555 ) ( AVAILABLE ?auto_1554 ) ( IN ?auto_1552 ?auto_1553 ) ( ON ?auto_1551 ?auto_1550 ) ( not ( = ?auto_1550 ?auto_1551 ) ) ( not ( = ?auto_1550 ?auto_1552 ) ) ( ON ?auto_1550 ?auto_1549 ) ( not ( = ?auto_1549 ?auto_1550 ) ) ( not ( = ?auto_1549 ?auto_1551 ) ) ( not ( = ?auto_1549 ?auto_1552 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1550 ?auto_1551 ?auto_1552 )
      ( MAKE-3CRATE-VERIFY ?auto_1549 ?auto_1550 ?auto_1551 ?auto_1552 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1556 - SURFACE
      ?auto_1557 - SURFACE
    )
    :vars
    (
      ?auto_1559 - HOIST
      ?auto_1560 - PLACE
      ?auto_1558 - TRUCK
      ?auto_1561 - SURFACE
      ?auto_1562 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1559 ?auto_1560 ) ( SURFACE-AT ?auto_1556 ?auto_1560 ) ( CLEAR ?auto_1556 ) ( IS-CRATE ?auto_1557 ) ( not ( = ?auto_1556 ?auto_1557 ) ) ( AVAILABLE ?auto_1559 ) ( IN ?auto_1557 ?auto_1558 ) ( ON ?auto_1556 ?auto_1561 ) ( not ( = ?auto_1561 ?auto_1556 ) ) ( not ( = ?auto_1561 ?auto_1557 ) ) ( TRUCK-AT ?auto_1558 ?auto_1562 ) ( not ( = ?auto_1562 ?auto_1560 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1558 ?auto_1562 ?auto_1560 )
      ( MAKE-2CRATE ?auto_1561 ?auto_1556 ?auto_1557 )
      ( MAKE-1CRATE-VERIFY ?auto_1556 ?auto_1557 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1563 - SURFACE
      ?auto_1564 - SURFACE
      ?auto_1565 - SURFACE
    )
    :vars
    (
      ?auto_1569 - HOIST
      ?auto_1566 - PLACE
      ?auto_1567 - TRUCK
      ?auto_1568 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1569 ?auto_1566 ) ( SURFACE-AT ?auto_1564 ?auto_1566 ) ( CLEAR ?auto_1564 ) ( IS-CRATE ?auto_1565 ) ( not ( = ?auto_1564 ?auto_1565 ) ) ( AVAILABLE ?auto_1569 ) ( IN ?auto_1565 ?auto_1567 ) ( ON ?auto_1564 ?auto_1563 ) ( not ( = ?auto_1563 ?auto_1564 ) ) ( not ( = ?auto_1563 ?auto_1565 ) ) ( TRUCK-AT ?auto_1567 ?auto_1568 ) ( not ( = ?auto_1568 ?auto_1566 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1564 ?auto_1565 )
      ( MAKE-2CRATE-VERIFY ?auto_1563 ?auto_1564 ?auto_1565 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1570 - SURFACE
      ?auto_1571 - SURFACE
      ?auto_1572 - SURFACE
      ?auto_1573 - SURFACE
    )
    :vars
    (
      ?auto_1576 - HOIST
      ?auto_1577 - PLACE
      ?auto_1575 - TRUCK
      ?auto_1574 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1576 ?auto_1577 ) ( SURFACE-AT ?auto_1572 ?auto_1577 ) ( CLEAR ?auto_1572 ) ( IS-CRATE ?auto_1573 ) ( not ( = ?auto_1572 ?auto_1573 ) ) ( AVAILABLE ?auto_1576 ) ( IN ?auto_1573 ?auto_1575 ) ( ON ?auto_1572 ?auto_1571 ) ( not ( = ?auto_1571 ?auto_1572 ) ) ( not ( = ?auto_1571 ?auto_1573 ) ) ( TRUCK-AT ?auto_1575 ?auto_1574 ) ( not ( = ?auto_1574 ?auto_1577 ) ) ( ON ?auto_1571 ?auto_1570 ) ( not ( = ?auto_1570 ?auto_1571 ) ) ( not ( = ?auto_1570 ?auto_1572 ) ) ( not ( = ?auto_1570 ?auto_1573 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1571 ?auto_1572 ?auto_1573 )
      ( MAKE-3CRATE-VERIFY ?auto_1570 ?auto_1571 ?auto_1572 ?auto_1573 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1578 - SURFACE
      ?auto_1579 - SURFACE
    )
    :vars
    (
      ?auto_1582 - HOIST
      ?auto_1583 - PLACE
      ?auto_1584 - SURFACE
      ?auto_1581 - TRUCK
      ?auto_1580 - PLACE
      ?auto_1585 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1582 ?auto_1583 ) ( SURFACE-AT ?auto_1578 ?auto_1583 ) ( CLEAR ?auto_1578 ) ( IS-CRATE ?auto_1579 ) ( not ( = ?auto_1578 ?auto_1579 ) ) ( AVAILABLE ?auto_1582 ) ( ON ?auto_1578 ?auto_1584 ) ( not ( = ?auto_1584 ?auto_1578 ) ) ( not ( = ?auto_1584 ?auto_1579 ) ) ( TRUCK-AT ?auto_1581 ?auto_1580 ) ( not ( = ?auto_1580 ?auto_1583 ) ) ( HOIST-AT ?auto_1585 ?auto_1580 ) ( LIFTING ?auto_1585 ?auto_1579 ) ( not ( = ?auto_1582 ?auto_1585 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1585 ?auto_1579 ?auto_1581 ?auto_1580 )
      ( MAKE-2CRATE ?auto_1584 ?auto_1578 ?auto_1579 )
      ( MAKE-1CRATE-VERIFY ?auto_1578 ?auto_1579 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1586 - SURFACE
      ?auto_1587 - SURFACE
      ?auto_1588 - SURFACE
    )
    :vars
    (
      ?auto_1593 - HOIST
      ?auto_1589 - PLACE
      ?auto_1590 - TRUCK
      ?auto_1591 - PLACE
      ?auto_1592 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1593 ?auto_1589 ) ( SURFACE-AT ?auto_1587 ?auto_1589 ) ( CLEAR ?auto_1587 ) ( IS-CRATE ?auto_1588 ) ( not ( = ?auto_1587 ?auto_1588 ) ) ( AVAILABLE ?auto_1593 ) ( ON ?auto_1587 ?auto_1586 ) ( not ( = ?auto_1586 ?auto_1587 ) ) ( not ( = ?auto_1586 ?auto_1588 ) ) ( TRUCK-AT ?auto_1590 ?auto_1591 ) ( not ( = ?auto_1591 ?auto_1589 ) ) ( HOIST-AT ?auto_1592 ?auto_1591 ) ( LIFTING ?auto_1592 ?auto_1588 ) ( not ( = ?auto_1593 ?auto_1592 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1587 ?auto_1588 )
      ( MAKE-2CRATE-VERIFY ?auto_1586 ?auto_1587 ?auto_1588 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1594 - SURFACE
      ?auto_1595 - SURFACE
      ?auto_1596 - SURFACE
      ?auto_1597 - SURFACE
    )
    :vars
    (
      ?auto_1601 - HOIST
      ?auto_1599 - PLACE
      ?auto_1598 - TRUCK
      ?auto_1602 - PLACE
      ?auto_1600 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1601 ?auto_1599 ) ( SURFACE-AT ?auto_1596 ?auto_1599 ) ( CLEAR ?auto_1596 ) ( IS-CRATE ?auto_1597 ) ( not ( = ?auto_1596 ?auto_1597 ) ) ( AVAILABLE ?auto_1601 ) ( ON ?auto_1596 ?auto_1595 ) ( not ( = ?auto_1595 ?auto_1596 ) ) ( not ( = ?auto_1595 ?auto_1597 ) ) ( TRUCK-AT ?auto_1598 ?auto_1602 ) ( not ( = ?auto_1602 ?auto_1599 ) ) ( HOIST-AT ?auto_1600 ?auto_1602 ) ( LIFTING ?auto_1600 ?auto_1597 ) ( not ( = ?auto_1601 ?auto_1600 ) ) ( ON ?auto_1595 ?auto_1594 ) ( not ( = ?auto_1594 ?auto_1595 ) ) ( not ( = ?auto_1594 ?auto_1596 ) ) ( not ( = ?auto_1594 ?auto_1597 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1595 ?auto_1596 ?auto_1597 )
      ( MAKE-3CRATE-VERIFY ?auto_1594 ?auto_1595 ?auto_1596 ?auto_1597 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1603 - SURFACE
      ?auto_1604 - SURFACE
    )
    :vars
    (
      ?auto_1608 - HOIST
      ?auto_1606 - PLACE
      ?auto_1610 - SURFACE
      ?auto_1605 - TRUCK
      ?auto_1609 - PLACE
      ?auto_1607 - HOIST
      ?auto_1611 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1608 ?auto_1606 ) ( SURFACE-AT ?auto_1603 ?auto_1606 ) ( CLEAR ?auto_1603 ) ( IS-CRATE ?auto_1604 ) ( not ( = ?auto_1603 ?auto_1604 ) ) ( AVAILABLE ?auto_1608 ) ( ON ?auto_1603 ?auto_1610 ) ( not ( = ?auto_1610 ?auto_1603 ) ) ( not ( = ?auto_1610 ?auto_1604 ) ) ( TRUCK-AT ?auto_1605 ?auto_1609 ) ( not ( = ?auto_1609 ?auto_1606 ) ) ( HOIST-AT ?auto_1607 ?auto_1609 ) ( not ( = ?auto_1608 ?auto_1607 ) ) ( AVAILABLE ?auto_1607 ) ( SURFACE-AT ?auto_1604 ?auto_1609 ) ( ON ?auto_1604 ?auto_1611 ) ( CLEAR ?auto_1604 ) ( not ( = ?auto_1603 ?auto_1611 ) ) ( not ( = ?auto_1604 ?auto_1611 ) ) ( not ( = ?auto_1610 ?auto_1611 ) ) )
    :subtasks
    ( ( !LIFT ?auto_1607 ?auto_1604 ?auto_1611 ?auto_1609 )
      ( MAKE-2CRATE ?auto_1610 ?auto_1603 ?auto_1604 )
      ( MAKE-1CRATE-VERIFY ?auto_1603 ?auto_1604 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1612 - SURFACE
      ?auto_1613 - SURFACE
      ?auto_1614 - SURFACE
    )
    :vars
    (
      ?auto_1615 - HOIST
      ?auto_1619 - PLACE
      ?auto_1616 - TRUCK
      ?auto_1617 - PLACE
      ?auto_1618 - HOIST
      ?auto_1620 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1615 ?auto_1619 ) ( SURFACE-AT ?auto_1613 ?auto_1619 ) ( CLEAR ?auto_1613 ) ( IS-CRATE ?auto_1614 ) ( not ( = ?auto_1613 ?auto_1614 ) ) ( AVAILABLE ?auto_1615 ) ( ON ?auto_1613 ?auto_1612 ) ( not ( = ?auto_1612 ?auto_1613 ) ) ( not ( = ?auto_1612 ?auto_1614 ) ) ( TRUCK-AT ?auto_1616 ?auto_1617 ) ( not ( = ?auto_1617 ?auto_1619 ) ) ( HOIST-AT ?auto_1618 ?auto_1617 ) ( not ( = ?auto_1615 ?auto_1618 ) ) ( AVAILABLE ?auto_1618 ) ( SURFACE-AT ?auto_1614 ?auto_1617 ) ( ON ?auto_1614 ?auto_1620 ) ( CLEAR ?auto_1614 ) ( not ( = ?auto_1613 ?auto_1620 ) ) ( not ( = ?auto_1614 ?auto_1620 ) ) ( not ( = ?auto_1612 ?auto_1620 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1613 ?auto_1614 )
      ( MAKE-2CRATE-VERIFY ?auto_1612 ?auto_1613 ?auto_1614 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1621 - SURFACE
      ?auto_1622 - SURFACE
      ?auto_1623 - SURFACE
      ?auto_1624 - SURFACE
    )
    :vars
    (
      ?auto_1625 - HOIST
      ?auto_1629 - PLACE
      ?auto_1627 - TRUCK
      ?auto_1630 - PLACE
      ?auto_1626 - HOIST
      ?auto_1628 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1625 ?auto_1629 ) ( SURFACE-AT ?auto_1623 ?auto_1629 ) ( CLEAR ?auto_1623 ) ( IS-CRATE ?auto_1624 ) ( not ( = ?auto_1623 ?auto_1624 ) ) ( AVAILABLE ?auto_1625 ) ( ON ?auto_1623 ?auto_1622 ) ( not ( = ?auto_1622 ?auto_1623 ) ) ( not ( = ?auto_1622 ?auto_1624 ) ) ( TRUCK-AT ?auto_1627 ?auto_1630 ) ( not ( = ?auto_1630 ?auto_1629 ) ) ( HOIST-AT ?auto_1626 ?auto_1630 ) ( not ( = ?auto_1625 ?auto_1626 ) ) ( AVAILABLE ?auto_1626 ) ( SURFACE-AT ?auto_1624 ?auto_1630 ) ( ON ?auto_1624 ?auto_1628 ) ( CLEAR ?auto_1624 ) ( not ( = ?auto_1623 ?auto_1628 ) ) ( not ( = ?auto_1624 ?auto_1628 ) ) ( not ( = ?auto_1622 ?auto_1628 ) ) ( ON ?auto_1622 ?auto_1621 ) ( not ( = ?auto_1621 ?auto_1622 ) ) ( not ( = ?auto_1621 ?auto_1623 ) ) ( not ( = ?auto_1621 ?auto_1624 ) ) ( not ( = ?auto_1621 ?auto_1628 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1622 ?auto_1623 ?auto_1624 )
      ( MAKE-3CRATE-VERIFY ?auto_1621 ?auto_1622 ?auto_1623 ?auto_1624 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1631 - SURFACE
      ?auto_1632 - SURFACE
    )
    :vars
    (
      ?auto_1633 - HOIST
      ?auto_1637 - PLACE
      ?auto_1639 - SURFACE
      ?auto_1638 - PLACE
      ?auto_1634 - HOIST
      ?auto_1636 - SURFACE
      ?auto_1635 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1633 ?auto_1637 ) ( SURFACE-AT ?auto_1631 ?auto_1637 ) ( CLEAR ?auto_1631 ) ( IS-CRATE ?auto_1632 ) ( not ( = ?auto_1631 ?auto_1632 ) ) ( AVAILABLE ?auto_1633 ) ( ON ?auto_1631 ?auto_1639 ) ( not ( = ?auto_1639 ?auto_1631 ) ) ( not ( = ?auto_1639 ?auto_1632 ) ) ( not ( = ?auto_1638 ?auto_1637 ) ) ( HOIST-AT ?auto_1634 ?auto_1638 ) ( not ( = ?auto_1633 ?auto_1634 ) ) ( AVAILABLE ?auto_1634 ) ( SURFACE-AT ?auto_1632 ?auto_1638 ) ( ON ?auto_1632 ?auto_1636 ) ( CLEAR ?auto_1632 ) ( not ( = ?auto_1631 ?auto_1636 ) ) ( not ( = ?auto_1632 ?auto_1636 ) ) ( not ( = ?auto_1639 ?auto_1636 ) ) ( TRUCK-AT ?auto_1635 ?auto_1637 ) )
    :subtasks
    ( ( !DRIVE ?auto_1635 ?auto_1637 ?auto_1638 )
      ( MAKE-2CRATE ?auto_1639 ?auto_1631 ?auto_1632 )
      ( MAKE-1CRATE-VERIFY ?auto_1631 ?auto_1632 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1640 - SURFACE
      ?auto_1641 - SURFACE
      ?auto_1642 - SURFACE
    )
    :vars
    (
      ?auto_1648 - HOIST
      ?auto_1643 - PLACE
      ?auto_1645 - PLACE
      ?auto_1646 - HOIST
      ?auto_1647 - SURFACE
      ?auto_1644 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1648 ?auto_1643 ) ( SURFACE-AT ?auto_1641 ?auto_1643 ) ( CLEAR ?auto_1641 ) ( IS-CRATE ?auto_1642 ) ( not ( = ?auto_1641 ?auto_1642 ) ) ( AVAILABLE ?auto_1648 ) ( ON ?auto_1641 ?auto_1640 ) ( not ( = ?auto_1640 ?auto_1641 ) ) ( not ( = ?auto_1640 ?auto_1642 ) ) ( not ( = ?auto_1645 ?auto_1643 ) ) ( HOIST-AT ?auto_1646 ?auto_1645 ) ( not ( = ?auto_1648 ?auto_1646 ) ) ( AVAILABLE ?auto_1646 ) ( SURFACE-AT ?auto_1642 ?auto_1645 ) ( ON ?auto_1642 ?auto_1647 ) ( CLEAR ?auto_1642 ) ( not ( = ?auto_1641 ?auto_1647 ) ) ( not ( = ?auto_1642 ?auto_1647 ) ) ( not ( = ?auto_1640 ?auto_1647 ) ) ( TRUCK-AT ?auto_1644 ?auto_1643 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1641 ?auto_1642 )
      ( MAKE-2CRATE-VERIFY ?auto_1640 ?auto_1641 ?auto_1642 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1649 - SURFACE
      ?auto_1650 - SURFACE
      ?auto_1651 - SURFACE
      ?auto_1652 - SURFACE
    )
    :vars
    (
      ?auto_1654 - HOIST
      ?auto_1656 - PLACE
      ?auto_1655 - PLACE
      ?auto_1653 - HOIST
      ?auto_1657 - SURFACE
      ?auto_1658 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1654 ?auto_1656 ) ( SURFACE-AT ?auto_1651 ?auto_1656 ) ( CLEAR ?auto_1651 ) ( IS-CRATE ?auto_1652 ) ( not ( = ?auto_1651 ?auto_1652 ) ) ( AVAILABLE ?auto_1654 ) ( ON ?auto_1651 ?auto_1650 ) ( not ( = ?auto_1650 ?auto_1651 ) ) ( not ( = ?auto_1650 ?auto_1652 ) ) ( not ( = ?auto_1655 ?auto_1656 ) ) ( HOIST-AT ?auto_1653 ?auto_1655 ) ( not ( = ?auto_1654 ?auto_1653 ) ) ( AVAILABLE ?auto_1653 ) ( SURFACE-AT ?auto_1652 ?auto_1655 ) ( ON ?auto_1652 ?auto_1657 ) ( CLEAR ?auto_1652 ) ( not ( = ?auto_1651 ?auto_1657 ) ) ( not ( = ?auto_1652 ?auto_1657 ) ) ( not ( = ?auto_1650 ?auto_1657 ) ) ( TRUCK-AT ?auto_1658 ?auto_1656 ) ( ON ?auto_1650 ?auto_1649 ) ( not ( = ?auto_1649 ?auto_1650 ) ) ( not ( = ?auto_1649 ?auto_1651 ) ) ( not ( = ?auto_1649 ?auto_1652 ) ) ( not ( = ?auto_1649 ?auto_1657 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1650 ?auto_1651 ?auto_1652 )
      ( MAKE-3CRATE-VERIFY ?auto_1649 ?auto_1650 ?auto_1651 ?auto_1652 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1659 - SURFACE
      ?auto_1660 - SURFACE
    )
    :vars
    (
      ?auto_1662 - HOIST
      ?auto_1664 - PLACE
      ?auto_1667 - SURFACE
      ?auto_1663 - PLACE
      ?auto_1661 - HOIST
      ?auto_1665 - SURFACE
      ?auto_1666 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1662 ?auto_1664 ) ( IS-CRATE ?auto_1660 ) ( not ( = ?auto_1659 ?auto_1660 ) ) ( not ( = ?auto_1667 ?auto_1659 ) ) ( not ( = ?auto_1667 ?auto_1660 ) ) ( not ( = ?auto_1663 ?auto_1664 ) ) ( HOIST-AT ?auto_1661 ?auto_1663 ) ( not ( = ?auto_1662 ?auto_1661 ) ) ( AVAILABLE ?auto_1661 ) ( SURFACE-AT ?auto_1660 ?auto_1663 ) ( ON ?auto_1660 ?auto_1665 ) ( CLEAR ?auto_1660 ) ( not ( = ?auto_1659 ?auto_1665 ) ) ( not ( = ?auto_1660 ?auto_1665 ) ) ( not ( = ?auto_1667 ?auto_1665 ) ) ( TRUCK-AT ?auto_1666 ?auto_1664 ) ( SURFACE-AT ?auto_1667 ?auto_1664 ) ( CLEAR ?auto_1667 ) ( LIFTING ?auto_1662 ?auto_1659 ) ( IS-CRATE ?auto_1659 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1667 ?auto_1659 )
      ( MAKE-2CRATE ?auto_1667 ?auto_1659 ?auto_1660 )
      ( MAKE-1CRATE-VERIFY ?auto_1659 ?auto_1660 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1668 - SURFACE
      ?auto_1669 - SURFACE
      ?auto_1670 - SURFACE
    )
    :vars
    (
      ?auto_1675 - HOIST
      ?auto_1672 - PLACE
      ?auto_1673 - PLACE
      ?auto_1671 - HOIST
      ?auto_1676 - SURFACE
      ?auto_1674 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1675 ?auto_1672 ) ( IS-CRATE ?auto_1670 ) ( not ( = ?auto_1669 ?auto_1670 ) ) ( not ( = ?auto_1668 ?auto_1669 ) ) ( not ( = ?auto_1668 ?auto_1670 ) ) ( not ( = ?auto_1673 ?auto_1672 ) ) ( HOIST-AT ?auto_1671 ?auto_1673 ) ( not ( = ?auto_1675 ?auto_1671 ) ) ( AVAILABLE ?auto_1671 ) ( SURFACE-AT ?auto_1670 ?auto_1673 ) ( ON ?auto_1670 ?auto_1676 ) ( CLEAR ?auto_1670 ) ( not ( = ?auto_1669 ?auto_1676 ) ) ( not ( = ?auto_1670 ?auto_1676 ) ) ( not ( = ?auto_1668 ?auto_1676 ) ) ( TRUCK-AT ?auto_1674 ?auto_1672 ) ( SURFACE-AT ?auto_1668 ?auto_1672 ) ( CLEAR ?auto_1668 ) ( LIFTING ?auto_1675 ?auto_1669 ) ( IS-CRATE ?auto_1669 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1669 ?auto_1670 )
      ( MAKE-2CRATE-VERIFY ?auto_1668 ?auto_1669 ?auto_1670 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1677 - SURFACE
      ?auto_1678 - SURFACE
      ?auto_1679 - SURFACE
      ?auto_1680 - SURFACE
    )
    :vars
    (
      ?auto_1686 - HOIST
      ?auto_1684 - PLACE
      ?auto_1682 - PLACE
      ?auto_1683 - HOIST
      ?auto_1681 - SURFACE
      ?auto_1685 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1686 ?auto_1684 ) ( IS-CRATE ?auto_1680 ) ( not ( = ?auto_1679 ?auto_1680 ) ) ( not ( = ?auto_1678 ?auto_1679 ) ) ( not ( = ?auto_1678 ?auto_1680 ) ) ( not ( = ?auto_1682 ?auto_1684 ) ) ( HOIST-AT ?auto_1683 ?auto_1682 ) ( not ( = ?auto_1686 ?auto_1683 ) ) ( AVAILABLE ?auto_1683 ) ( SURFACE-AT ?auto_1680 ?auto_1682 ) ( ON ?auto_1680 ?auto_1681 ) ( CLEAR ?auto_1680 ) ( not ( = ?auto_1679 ?auto_1681 ) ) ( not ( = ?auto_1680 ?auto_1681 ) ) ( not ( = ?auto_1678 ?auto_1681 ) ) ( TRUCK-AT ?auto_1685 ?auto_1684 ) ( SURFACE-AT ?auto_1678 ?auto_1684 ) ( CLEAR ?auto_1678 ) ( LIFTING ?auto_1686 ?auto_1679 ) ( IS-CRATE ?auto_1679 ) ( ON ?auto_1678 ?auto_1677 ) ( not ( = ?auto_1677 ?auto_1678 ) ) ( not ( = ?auto_1677 ?auto_1679 ) ) ( not ( = ?auto_1677 ?auto_1680 ) ) ( not ( = ?auto_1677 ?auto_1681 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1678 ?auto_1679 ?auto_1680 )
      ( MAKE-3CRATE-VERIFY ?auto_1677 ?auto_1678 ?auto_1679 ?auto_1680 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1687 - SURFACE
      ?auto_1688 - SURFACE
    )
    :vars
    (
      ?auto_1694 - HOIST
      ?auto_1692 - PLACE
      ?auto_1695 - SURFACE
      ?auto_1690 - PLACE
      ?auto_1691 - HOIST
      ?auto_1689 - SURFACE
      ?auto_1693 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1694 ?auto_1692 ) ( IS-CRATE ?auto_1688 ) ( not ( = ?auto_1687 ?auto_1688 ) ) ( not ( = ?auto_1695 ?auto_1687 ) ) ( not ( = ?auto_1695 ?auto_1688 ) ) ( not ( = ?auto_1690 ?auto_1692 ) ) ( HOIST-AT ?auto_1691 ?auto_1690 ) ( not ( = ?auto_1694 ?auto_1691 ) ) ( AVAILABLE ?auto_1691 ) ( SURFACE-AT ?auto_1688 ?auto_1690 ) ( ON ?auto_1688 ?auto_1689 ) ( CLEAR ?auto_1688 ) ( not ( = ?auto_1687 ?auto_1689 ) ) ( not ( = ?auto_1688 ?auto_1689 ) ) ( not ( = ?auto_1695 ?auto_1689 ) ) ( TRUCK-AT ?auto_1693 ?auto_1692 ) ( SURFACE-AT ?auto_1695 ?auto_1692 ) ( CLEAR ?auto_1695 ) ( IS-CRATE ?auto_1687 ) ( AVAILABLE ?auto_1694 ) ( IN ?auto_1687 ?auto_1693 ) )
    :subtasks
    ( ( !UNLOAD ?auto_1694 ?auto_1687 ?auto_1693 ?auto_1692 )
      ( MAKE-2CRATE ?auto_1695 ?auto_1687 ?auto_1688 )
      ( MAKE-1CRATE-VERIFY ?auto_1687 ?auto_1688 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1696 - SURFACE
      ?auto_1697 - SURFACE
      ?auto_1698 - SURFACE
    )
    :vars
    (
      ?auto_1701 - HOIST
      ?auto_1702 - PLACE
      ?auto_1700 - PLACE
      ?auto_1704 - HOIST
      ?auto_1699 - SURFACE
      ?auto_1703 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1701 ?auto_1702 ) ( IS-CRATE ?auto_1698 ) ( not ( = ?auto_1697 ?auto_1698 ) ) ( not ( = ?auto_1696 ?auto_1697 ) ) ( not ( = ?auto_1696 ?auto_1698 ) ) ( not ( = ?auto_1700 ?auto_1702 ) ) ( HOIST-AT ?auto_1704 ?auto_1700 ) ( not ( = ?auto_1701 ?auto_1704 ) ) ( AVAILABLE ?auto_1704 ) ( SURFACE-AT ?auto_1698 ?auto_1700 ) ( ON ?auto_1698 ?auto_1699 ) ( CLEAR ?auto_1698 ) ( not ( = ?auto_1697 ?auto_1699 ) ) ( not ( = ?auto_1698 ?auto_1699 ) ) ( not ( = ?auto_1696 ?auto_1699 ) ) ( TRUCK-AT ?auto_1703 ?auto_1702 ) ( SURFACE-AT ?auto_1696 ?auto_1702 ) ( CLEAR ?auto_1696 ) ( IS-CRATE ?auto_1697 ) ( AVAILABLE ?auto_1701 ) ( IN ?auto_1697 ?auto_1703 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1697 ?auto_1698 )
      ( MAKE-2CRATE-VERIFY ?auto_1696 ?auto_1697 ?auto_1698 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1705 - SURFACE
      ?auto_1706 - SURFACE
      ?auto_1707 - SURFACE
      ?auto_1708 - SURFACE
    )
    :vars
    (
      ?auto_1713 - HOIST
      ?auto_1710 - PLACE
      ?auto_1712 - PLACE
      ?auto_1709 - HOIST
      ?auto_1711 - SURFACE
      ?auto_1714 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1713 ?auto_1710 ) ( IS-CRATE ?auto_1708 ) ( not ( = ?auto_1707 ?auto_1708 ) ) ( not ( = ?auto_1706 ?auto_1707 ) ) ( not ( = ?auto_1706 ?auto_1708 ) ) ( not ( = ?auto_1712 ?auto_1710 ) ) ( HOIST-AT ?auto_1709 ?auto_1712 ) ( not ( = ?auto_1713 ?auto_1709 ) ) ( AVAILABLE ?auto_1709 ) ( SURFACE-AT ?auto_1708 ?auto_1712 ) ( ON ?auto_1708 ?auto_1711 ) ( CLEAR ?auto_1708 ) ( not ( = ?auto_1707 ?auto_1711 ) ) ( not ( = ?auto_1708 ?auto_1711 ) ) ( not ( = ?auto_1706 ?auto_1711 ) ) ( TRUCK-AT ?auto_1714 ?auto_1710 ) ( SURFACE-AT ?auto_1706 ?auto_1710 ) ( CLEAR ?auto_1706 ) ( IS-CRATE ?auto_1707 ) ( AVAILABLE ?auto_1713 ) ( IN ?auto_1707 ?auto_1714 ) ( ON ?auto_1706 ?auto_1705 ) ( not ( = ?auto_1705 ?auto_1706 ) ) ( not ( = ?auto_1705 ?auto_1707 ) ) ( not ( = ?auto_1705 ?auto_1708 ) ) ( not ( = ?auto_1705 ?auto_1711 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1706 ?auto_1707 ?auto_1708 )
      ( MAKE-3CRATE-VERIFY ?auto_1705 ?auto_1706 ?auto_1707 ?auto_1708 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1715 - SURFACE
      ?auto_1716 - SURFACE
    )
    :vars
    (
      ?auto_1721 - HOIST
      ?auto_1718 - PLACE
      ?auto_1723 - SURFACE
      ?auto_1720 - PLACE
      ?auto_1717 - HOIST
      ?auto_1719 - SURFACE
      ?auto_1722 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1721 ?auto_1718 ) ( IS-CRATE ?auto_1716 ) ( not ( = ?auto_1715 ?auto_1716 ) ) ( not ( = ?auto_1723 ?auto_1715 ) ) ( not ( = ?auto_1723 ?auto_1716 ) ) ( not ( = ?auto_1720 ?auto_1718 ) ) ( HOIST-AT ?auto_1717 ?auto_1720 ) ( not ( = ?auto_1721 ?auto_1717 ) ) ( AVAILABLE ?auto_1717 ) ( SURFACE-AT ?auto_1716 ?auto_1720 ) ( ON ?auto_1716 ?auto_1719 ) ( CLEAR ?auto_1716 ) ( not ( = ?auto_1715 ?auto_1719 ) ) ( not ( = ?auto_1716 ?auto_1719 ) ) ( not ( = ?auto_1723 ?auto_1719 ) ) ( SURFACE-AT ?auto_1723 ?auto_1718 ) ( CLEAR ?auto_1723 ) ( IS-CRATE ?auto_1715 ) ( AVAILABLE ?auto_1721 ) ( IN ?auto_1715 ?auto_1722 ) ( TRUCK-AT ?auto_1722 ?auto_1720 ) )
    :subtasks
    ( ( !DRIVE ?auto_1722 ?auto_1720 ?auto_1718 )
      ( MAKE-2CRATE ?auto_1723 ?auto_1715 ?auto_1716 )
      ( MAKE-1CRATE-VERIFY ?auto_1715 ?auto_1716 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1724 - SURFACE
      ?auto_1725 - SURFACE
      ?auto_1726 - SURFACE
    )
    :vars
    (
      ?auto_1731 - HOIST
      ?auto_1728 - PLACE
      ?auto_1727 - PLACE
      ?auto_1730 - HOIST
      ?auto_1732 - SURFACE
      ?auto_1729 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1731 ?auto_1728 ) ( IS-CRATE ?auto_1726 ) ( not ( = ?auto_1725 ?auto_1726 ) ) ( not ( = ?auto_1724 ?auto_1725 ) ) ( not ( = ?auto_1724 ?auto_1726 ) ) ( not ( = ?auto_1727 ?auto_1728 ) ) ( HOIST-AT ?auto_1730 ?auto_1727 ) ( not ( = ?auto_1731 ?auto_1730 ) ) ( AVAILABLE ?auto_1730 ) ( SURFACE-AT ?auto_1726 ?auto_1727 ) ( ON ?auto_1726 ?auto_1732 ) ( CLEAR ?auto_1726 ) ( not ( = ?auto_1725 ?auto_1732 ) ) ( not ( = ?auto_1726 ?auto_1732 ) ) ( not ( = ?auto_1724 ?auto_1732 ) ) ( SURFACE-AT ?auto_1724 ?auto_1728 ) ( CLEAR ?auto_1724 ) ( IS-CRATE ?auto_1725 ) ( AVAILABLE ?auto_1731 ) ( IN ?auto_1725 ?auto_1729 ) ( TRUCK-AT ?auto_1729 ?auto_1727 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1725 ?auto_1726 )
      ( MAKE-2CRATE-VERIFY ?auto_1724 ?auto_1725 ?auto_1726 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1733 - SURFACE
      ?auto_1734 - SURFACE
      ?auto_1735 - SURFACE
      ?auto_1736 - SURFACE
    )
    :vars
    (
      ?auto_1742 - HOIST
      ?auto_1737 - PLACE
      ?auto_1739 - PLACE
      ?auto_1741 - HOIST
      ?auto_1738 - SURFACE
      ?auto_1740 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1742 ?auto_1737 ) ( IS-CRATE ?auto_1736 ) ( not ( = ?auto_1735 ?auto_1736 ) ) ( not ( = ?auto_1734 ?auto_1735 ) ) ( not ( = ?auto_1734 ?auto_1736 ) ) ( not ( = ?auto_1739 ?auto_1737 ) ) ( HOIST-AT ?auto_1741 ?auto_1739 ) ( not ( = ?auto_1742 ?auto_1741 ) ) ( AVAILABLE ?auto_1741 ) ( SURFACE-AT ?auto_1736 ?auto_1739 ) ( ON ?auto_1736 ?auto_1738 ) ( CLEAR ?auto_1736 ) ( not ( = ?auto_1735 ?auto_1738 ) ) ( not ( = ?auto_1736 ?auto_1738 ) ) ( not ( = ?auto_1734 ?auto_1738 ) ) ( SURFACE-AT ?auto_1734 ?auto_1737 ) ( CLEAR ?auto_1734 ) ( IS-CRATE ?auto_1735 ) ( AVAILABLE ?auto_1742 ) ( IN ?auto_1735 ?auto_1740 ) ( TRUCK-AT ?auto_1740 ?auto_1739 ) ( ON ?auto_1734 ?auto_1733 ) ( not ( = ?auto_1733 ?auto_1734 ) ) ( not ( = ?auto_1733 ?auto_1735 ) ) ( not ( = ?auto_1733 ?auto_1736 ) ) ( not ( = ?auto_1733 ?auto_1738 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1734 ?auto_1735 ?auto_1736 )
      ( MAKE-3CRATE-VERIFY ?auto_1733 ?auto_1734 ?auto_1735 ?auto_1736 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1743 - SURFACE
      ?auto_1744 - SURFACE
    )
    :vars
    (
      ?auto_1750 - HOIST
      ?auto_1745 - PLACE
      ?auto_1751 - SURFACE
      ?auto_1747 - PLACE
      ?auto_1749 - HOIST
      ?auto_1746 - SURFACE
      ?auto_1748 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1750 ?auto_1745 ) ( IS-CRATE ?auto_1744 ) ( not ( = ?auto_1743 ?auto_1744 ) ) ( not ( = ?auto_1751 ?auto_1743 ) ) ( not ( = ?auto_1751 ?auto_1744 ) ) ( not ( = ?auto_1747 ?auto_1745 ) ) ( HOIST-AT ?auto_1749 ?auto_1747 ) ( not ( = ?auto_1750 ?auto_1749 ) ) ( SURFACE-AT ?auto_1744 ?auto_1747 ) ( ON ?auto_1744 ?auto_1746 ) ( CLEAR ?auto_1744 ) ( not ( = ?auto_1743 ?auto_1746 ) ) ( not ( = ?auto_1744 ?auto_1746 ) ) ( not ( = ?auto_1751 ?auto_1746 ) ) ( SURFACE-AT ?auto_1751 ?auto_1745 ) ( CLEAR ?auto_1751 ) ( IS-CRATE ?auto_1743 ) ( AVAILABLE ?auto_1750 ) ( TRUCK-AT ?auto_1748 ?auto_1747 ) ( LIFTING ?auto_1749 ?auto_1743 ) )
    :subtasks
    ( ( !LOAD ?auto_1749 ?auto_1743 ?auto_1748 ?auto_1747 )
      ( MAKE-2CRATE ?auto_1751 ?auto_1743 ?auto_1744 )
      ( MAKE-1CRATE-VERIFY ?auto_1743 ?auto_1744 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1752 - SURFACE
      ?auto_1753 - SURFACE
      ?auto_1754 - SURFACE
    )
    :vars
    (
      ?auto_1757 - HOIST
      ?auto_1755 - PLACE
      ?auto_1760 - PLACE
      ?auto_1759 - HOIST
      ?auto_1758 - SURFACE
      ?auto_1756 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1757 ?auto_1755 ) ( IS-CRATE ?auto_1754 ) ( not ( = ?auto_1753 ?auto_1754 ) ) ( not ( = ?auto_1752 ?auto_1753 ) ) ( not ( = ?auto_1752 ?auto_1754 ) ) ( not ( = ?auto_1760 ?auto_1755 ) ) ( HOIST-AT ?auto_1759 ?auto_1760 ) ( not ( = ?auto_1757 ?auto_1759 ) ) ( SURFACE-AT ?auto_1754 ?auto_1760 ) ( ON ?auto_1754 ?auto_1758 ) ( CLEAR ?auto_1754 ) ( not ( = ?auto_1753 ?auto_1758 ) ) ( not ( = ?auto_1754 ?auto_1758 ) ) ( not ( = ?auto_1752 ?auto_1758 ) ) ( SURFACE-AT ?auto_1752 ?auto_1755 ) ( CLEAR ?auto_1752 ) ( IS-CRATE ?auto_1753 ) ( AVAILABLE ?auto_1757 ) ( TRUCK-AT ?auto_1756 ?auto_1760 ) ( LIFTING ?auto_1759 ?auto_1753 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1753 ?auto_1754 )
      ( MAKE-2CRATE-VERIFY ?auto_1752 ?auto_1753 ?auto_1754 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1761 - SURFACE
      ?auto_1762 - SURFACE
      ?auto_1763 - SURFACE
      ?auto_1764 - SURFACE
    )
    :vars
    (
      ?auto_1768 - HOIST
      ?auto_1766 - PLACE
      ?auto_1767 - PLACE
      ?auto_1765 - HOIST
      ?auto_1770 - SURFACE
      ?auto_1769 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1768 ?auto_1766 ) ( IS-CRATE ?auto_1764 ) ( not ( = ?auto_1763 ?auto_1764 ) ) ( not ( = ?auto_1762 ?auto_1763 ) ) ( not ( = ?auto_1762 ?auto_1764 ) ) ( not ( = ?auto_1767 ?auto_1766 ) ) ( HOIST-AT ?auto_1765 ?auto_1767 ) ( not ( = ?auto_1768 ?auto_1765 ) ) ( SURFACE-AT ?auto_1764 ?auto_1767 ) ( ON ?auto_1764 ?auto_1770 ) ( CLEAR ?auto_1764 ) ( not ( = ?auto_1763 ?auto_1770 ) ) ( not ( = ?auto_1764 ?auto_1770 ) ) ( not ( = ?auto_1762 ?auto_1770 ) ) ( SURFACE-AT ?auto_1762 ?auto_1766 ) ( CLEAR ?auto_1762 ) ( IS-CRATE ?auto_1763 ) ( AVAILABLE ?auto_1768 ) ( TRUCK-AT ?auto_1769 ?auto_1767 ) ( LIFTING ?auto_1765 ?auto_1763 ) ( ON ?auto_1762 ?auto_1761 ) ( not ( = ?auto_1761 ?auto_1762 ) ) ( not ( = ?auto_1761 ?auto_1763 ) ) ( not ( = ?auto_1761 ?auto_1764 ) ) ( not ( = ?auto_1761 ?auto_1770 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1762 ?auto_1763 ?auto_1764 )
      ( MAKE-3CRATE-VERIFY ?auto_1761 ?auto_1762 ?auto_1763 ?auto_1764 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1771 - SURFACE
      ?auto_1772 - SURFACE
    )
    :vars
    (
      ?auto_1776 - HOIST
      ?auto_1774 - PLACE
      ?auto_1779 - SURFACE
      ?auto_1775 - PLACE
      ?auto_1773 - HOIST
      ?auto_1778 - SURFACE
      ?auto_1777 - TRUCK
      ?auto_1780 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1776 ?auto_1774 ) ( IS-CRATE ?auto_1772 ) ( not ( = ?auto_1771 ?auto_1772 ) ) ( not ( = ?auto_1779 ?auto_1771 ) ) ( not ( = ?auto_1779 ?auto_1772 ) ) ( not ( = ?auto_1775 ?auto_1774 ) ) ( HOIST-AT ?auto_1773 ?auto_1775 ) ( not ( = ?auto_1776 ?auto_1773 ) ) ( SURFACE-AT ?auto_1772 ?auto_1775 ) ( ON ?auto_1772 ?auto_1778 ) ( CLEAR ?auto_1772 ) ( not ( = ?auto_1771 ?auto_1778 ) ) ( not ( = ?auto_1772 ?auto_1778 ) ) ( not ( = ?auto_1779 ?auto_1778 ) ) ( SURFACE-AT ?auto_1779 ?auto_1774 ) ( CLEAR ?auto_1779 ) ( IS-CRATE ?auto_1771 ) ( AVAILABLE ?auto_1776 ) ( TRUCK-AT ?auto_1777 ?auto_1775 ) ( AVAILABLE ?auto_1773 ) ( SURFACE-AT ?auto_1771 ?auto_1775 ) ( ON ?auto_1771 ?auto_1780 ) ( CLEAR ?auto_1771 ) ( not ( = ?auto_1771 ?auto_1780 ) ) ( not ( = ?auto_1772 ?auto_1780 ) ) ( not ( = ?auto_1779 ?auto_1780 ) ) ( not ( = ?auto_1778 ?auto_1780 ) ) )
    :subtasks
    ( ( !LIFT ?auto_1773 ?auto_1771 ?auto_1780 ?auto_1775 )
      ( MAKE-2CRATE ?auto_1779 ?auto_1771 ?auto_1772 )
      ( MAKE-1CRATE-VERIFY ?auto_1771 ?auto_1772 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1781 - SURFACE
      ?auto_1782 - SURFACE
      ?auto_1783 - SURFACE
    )
    :vars
    (
      ?auto_1785 - HOIST
      ?auto_1784 - PLACE
      ?auto_1788 - PLACE
      ?auto_1787 - HOIST
      ?auto_1786 - SURFACE
      ?auto_1789 - TRUCK
      ?auto_1790 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1785 ?auto_1784 ) ( IS-CRATE ?auto_1783 ) ( not ( = ?auto_1782 ?auto_1783 ) ) ( not ( = ?auto_1781 ?auto_1782 ) ) ( not ( = ?auto_1781 ?auto_1783 ) ) ( not ( = ?auto_1788 ?auto_1784 ) ) ( HOIST-AT ?auto_1787 ?auto_1788 ) ( not ( = ?auto_1785 ?auto_1787 ) ) ( SURFACE-AT ?auto_1783 ?auto_1788 ) ( ON ?auto_1783 ?auto_1786 ) ( CLEAR ?auto_1783 ) ( not ( = ?auto_1782 ?auto_1786 ) ) ( not ( = ?auto_1783 ?auto_1786 ) ) ( not ( = ?auto_1781 ?auto_1786 ) ) ( SURFACE-AT ?auto_1781 ?auto_1784 ) ( CLEAR ?auto_1781 ) ( IS-CRATE ?auto_1782 ) ( AVAILABLE ?auto_1785 ) ( TRUCK-AT ?auto_1789 ?auto_1788 ) ( AVAILABLE ?auto_1787 ) ( SURFACE-AT ?auto_1782 ?auto_1788 ) ( ON ?auto_1782 ?auto_1790 ) ( CLEAR ?auto_1782 ) ( not ( = ?auto_1782 ?auto_1790 ) ) ( not ( = ?auto_1783 ?auto_1790 ) ) ( not ( = ?auto_1781 ?auto_1790 ) ) ( not ( = ?auto_1786 ?auto_1790 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1782 ?auto_1783 )
      ( MAKE-2CRATE-VERIFY ?auto_1781 ?auto_1782 ?auto_1783 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1791 - SURFACE
      ?auto_1792 - SURFACE
      ?auto_1793 - SURFACE
      ?auto_1794 - SURFACE
    )
    :vars
    (
      ?auto_1800 - HOIST
      ?auto_1795 - PLACE
      ?auto_1799 - PLACE
      ?auto_1797 - HOIST
      ?auto_1798 - SURFACE
      ?auto_1796 - TRUCK
      ?auto_1801 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1800 ?auto_1795 ) ( IS-CRATE ?auto_1794 ) ( not ( = ?auto_1793 ?auto_1794 ) ) ( not ( = ?auto_1792 ?auto_1793 ) ) ( not ( = ?auto_1792 ?auto_1794 ) ) ( not ( = ?auto_1799 ?auto_1795 ) ) ( HOIST-AT ?auto_1797 ?auto_1799 ) ( not ( = ?auto_1800 ?auto_1797 ) ) ( SURFACE-AT ?auto_1794 ?auto_1799 ) ( ON ?auto_1794 ?auto_1798 ) ( CLEAR ?auto_1794 ) ( not ( = ?auto_1793 ?auto_1798 ) ) ( not ( = ?auto_1794 ?auto_1798 ) ) ( not ( = ?auto_1792 ?auto_1798 ) ) ( SURFACE-AT ?auto_1792 ?auto_1795 ) ( CLEAR ?auto_1792 ) ( IS-CRATE ?auto_1793 ) ( AVAILABLE ?auto_1800 ) ( TRUCK-AT ?auto_1796 ?auto_1799 ) ( AVAILABLE ?auto_1797 ) ( SURFACE-AT ?auto_1793 ?auto_1799 ) ( ON ?auto_1793 ?auto_1801 ) ( CLEAR ?auto_1793 ) ( not ( = ?auto_1793 ?auto_1801 ) ) ( not ( = ?auto_1794 ?auto_1801 ) ) ( not ( = ?auto_1792 ?auto_1801 ) ) ( not ( = ?auto_1798 ?auto_1801 ) ) ( ON ?auto_1792 ?auto_1791 ) ( not ( = ?auto_1791 ?auto_1792 ) ) ( not ( = ?auto_1791 ?auto_1793 ) ) ( not ( = ?auto_1791 ?auto_1794 ) ) ( not ( = ?auto_1791 ?auto_1798 ) ) ( not ( = ?auto_1791 ?auto_1801 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1792 ?auto_1793 ?auto_1794 )
      ( MAKE-3CRATE-VERIFY ?auto_1791 ?auto_1792 ?auto_1793 ?auto_1794 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1802 - SURFACE
      ?auto_1803 - SURFACE
    )
    :vars
    (
      ?auto_1809 - HOIST
      ?auto_1804 - PLACE
      ?auto_1811 - SURFACE
      ?auto_1808 - PLACE
      ?auto_1806 - HOIST
      ?auto_1807 - SURFACE
      ?auto_1810 - SURFACE
      ?auto_1805 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1809 ?auto_1804 ) ( IS-CRATE ?auto_1803 ) ( not ( = ?auto_1802 ?auto_1803 ) ) ( not ( = ?auto_1811 ?auto_1802 ) ) ( not ( = ?auto_1811 ?auto_1803 ) ) ( not ( = ?auto_1808 ?auto_1804 ) ) ( HOIST-AT ?auto_1806 ?auto_1808 ) ( not ( = ?auto_1809 ?auto_1806 ) ) ( SURFACE-AT ?auto_1803 ?auto_1808 ) ( ON ?auto_1803 ?auto_1807 ) ( CLEAR ?auto_1803 ) ( not ( = ?auto_1802 ?auto_1807 ) ) ( not ( = ?auto_1803 ?auto_1807 ) ) ( not ( = ?auto_1811 ?auto_1807 ) ) ( SURFACE-AT ?auto_1811 ?auto_1804 ) ( CLEAR ?auto_1811 ) ( IS-CRATE ?auto_1802 ) ( AVAILABLE ?auto_1809 ) ( AVAILABLE ?auto_1806 ) ( SURFACE-AT ?auto_1802 ?auto_1808 ) ( ON ?auto_1802 ?auto_1810 ) ( CLEAR ?auto_1802 ) ( not ( = ?auto_1802 ?auto_1810 ) ) ( not ( = ?auto_1803 ?auto_1810 ) ) ( not ( = ?auto_1811 ?auto_1810 ) ) ( not ( = ?auto_1807 ?auto_1810 ) ) ( TRUCK-AT ?auto_1805 ?auto_1804 ) )
    :subtasks
    ( ( !DRIVE ?auto_1805 ?auto_1804 ?auto_1808 )
      ( MAKE-2CRATE ?auto_1811 ?auto_1802 ?auto_1803 )
      ( MAKE-1CRATE-VERIFY ?auto_1802 ?auto_1803 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1812 - SURFACE
      ?auto_1813 - SURFACE
      ?auto_1814 - SURFACE
    )
    :vars
    (
      ?auto_1815 - HOIST
      ?auto_1821 - PLACE
      ?auto_1816 - PLACE
      ?auto_1819 - HOIST
      ?auto_1818 - SURFACE
      ?auto_1817 - SURFACE
      ?auto_1820 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1815 ?auto_1821 ) ( IS-CRATE ?auto_1814 ) ( not ( = ?auto_1813 ?auto_1814 ) ) ( not ( = ?auto_1812 ?auto_1813 ) ) ( not ( = ?auto_1812 ?auto_1814 ) ) ( not ( = ?auto_1816 ?auto_1821 ) ) ( HOIST-AT ?auto_1819 ?auto_1816 ) ( not ( = ?auto_1815 ?auto_1819 ) ) ( SURFACE-AT ?auto_1814 ?auto_1816 ) ( ON ?auto_1814 ?auto_1818 ) ( CLEAR ?auto_1814 ) ( not ( = ?auto_1813 ?auto_1818 ) ) ( not ( = ?auto_1814 ?auto_1818 ) ) ( not ( = ?auto_1812 ?auto_1818 ) ) ( SURFACE-AT ?auto_1812 ?auto_1821 ) ( CLEAR ?auto_1812 ) ( IS-CRATE ?auto_1813 ) ( AVAILABLE ?auto_1815 ) ( AVAILABLE ?auto_1819 ) ( SURFACE-AT ?auto_1813 ?auto_1816 ) ( ON ?auto_1813 ?auto_1817 ) ( CLEAR ?auto_1813 ) ( not ( = ?auto_1813 ?auto_1817 ) ) ( not ( = ?auto_1814 ?auto_1817 ) ) ( not ( = ?auto_1812 ?auto_1817 ) ) ( not ( = ?auto_1818 ?auto_1817 ) ) ( TRUCK-AT ?auto_1820 ?auto_1821 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1813 ?auto_1814 )
      ( MAKE-2CRATE-VERIFY ?auto_1812 ?auto_1813 ?auto_1814 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1822 - SURFACE
      ?auto_1823 - SURFACE
      ?auto_1824 - SURFACE
      ?auto_1825 - SURFACE
    )
    :vars
    (
      ?auto_1829 - HOIST
      ?auto_1832 - PLACE
      ?auto_1831 - PLACE
      ?auto_1828 - HOIST
      ?auto_1830 - SURFACE
      ?auto_1826 - SURFACE
      ?auto_1827 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1829 ?auto_1832 ) ( IS-CRATE ?auto_1825 ) ( not ( = ?auto_1824 ?auto_1825 ) ) ( not ( = ?auto_1823 ?auto_1824 ) ) ( not ( = ?auto_1823 ?auto_1825 ) ) ( not ( = ?auto_1831 ?auto_1832 ) ) ( HOIST-AT ?auto_1828 ?auto_1831 ) ( not ( = ?auto_1829 ?auto_1828 ) ) ( SURFACE-AT ?auto_1825 ?auto_1831 ) ( ON ?auto_1825 ?auto_1830 ) ( CLEAR ?auto_1825 ) ( not ( = ?auto_1824 ?auto_1830 ) ) ( not ( = ?auto_1825 ?auto_1830 ) ) ( not ( = ?auto_1823 ?auto_1830 ) ) ( SURFACE-AT ?auto_1823 ?auto_1832 ) ( CLEAR ?auto_1823 ) ( IS-CRATE ?auto_1824 ) ( AVAILABLE ?auto_1829 ) ( AVAILABLE ?auto_1828 ) ( SURFACE-AT ?auto_1824 ?auto_1831 ) ( ON ?auto_1824 ?auto_1826 ) ( CLEAR ?auto_1824 ) ( not ( = ?auto_1824 ?auto_1826 ) ) ( not ( = ?auto_1825 ?auto_1826 ) ) ( not ( = ?auto_1823 ?auto_1826 ) ) ( not ( = ?auto_1830 ?auto_1826 ) ) ( TRUCK-AT ?auto_1827 ?auto_1832 ) ( ON ?auto_1823 ?auto_1822 ) ( not ( = ?auto_1822 ?auto_1823 ) ) ( not ( = ?auto_1822 ?auto_1824 ) ) ( not ( = ?auto_1822 ?auto_1825 ) ) ( not ( = ?auto_1822 ?auto_1830 ) ) ( not ( = ?auto_1822 ?auto_1826 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1823 ?auto_1824 ?auto_1825 )
      ( MAKE-3CRATE-VERIFY ?auto_1822 ?auto_1823 ?auto_1824 ?auto_1825 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1833 - SURFACE
      ?auto_1834 - SURFACE
    )
    :vars
    (
      ?auto_1838 - HOIST
      ?auto_1841 - PLACE
      ?auto_1842 - SURFACE
      ?auto_1840 - PLACE
      ?auto_1837 - HOIST
      ?auto_1839 - SURFACE
      ?auto_1835 - SURFACE
      ?auto_1836 - TRUCK
      ?auto_1843 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1838 ?auto_1841 ) ( IS-CRATE ?auto_1834 ) ( not ( = ?auto_1833 ?auto_1834 ) ) ( not ( = ?auto_1842 ?auto_1833 ) ) ( not ( = ?auto_1842 ?auto_1834 ) ) ( not ( = ?auto_1840 ?auto_1841 ) ) ( HOIST-AT ?auto_1837 ?auto_1840 ) ( not ( = ?auto_1838 ?auto_1837 ) ) ( SURFACE-AT ?auto_1834 ?auto_1840 ) ( ON ?auto_1834 ?auto_1839 ) ( CLEAR ?auto_1834 ) ( not ( = ?auto_1833 ?auto_1839 ) ) ( not ( = ?auto_1834 ?auto_1839 ) ) ( not ( = ?auto_1842 ?auto_1839 ) ) ( IS-CRATE ?auto_1833 ) ( AVAILABLE ?auto_1837 ) ( SURFACE-AT ?auto_1833 ?auto_1840 ) ( ON ?auto_1833 ?auto_1835 ) ( CLEAR ?auto_1833 ) ( not ( = ?auto_1833 ?auto_1835 ) ) ( not ( = ?auto_1834 ?auto_1835 ) ) ( not ( = ?auto_1842 ?auto_1835 ) ) ( not ( = ?auto_1839 ?auto_1835 ) ) ( TRUCK-AT ?auto_1836 ?auto_1841 ) ( SURFACE-AT ?auto_1843 ?auto_1841 ) ( CLEAR ?auto_1843 ) ( LIFTING ?auto_1838 ?auto_1842 ) ( IS-CRATE ?auto_1842 ) ( not ( = ?auto_1843 ?auto_1842 ) ) ( not ( = ?auto_1833 ?auto_1843 ) ) ( not ( = ?auto_1834 ?auto_1843 ) ) ( not ( = ?auto_1839 ?auto_1843 ) ) ( not ( = ?auto_1835 ?auto_1843 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1843 ?auto_1842 )
      ( MAKE-2CRATE ?auto_1842 ?auto_1833 ?auto_1834 )
      ( MAKE-1CRATE-VERIFY ?auto_1833 ?auto_1834 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1844 - SURFACE
      ?auto_1845 - SURFACE
      ?auto_1846 - SURFACE
    )
    :vars
    (
      ?auto_1851 - HOIST
      ?auto_1853 - PLACE
      ?auto_1852 - PLACE
      ?auto_1848 - HOIST
      ?auto_1850 - SURFACE
      ?auto_1849 - SURFACE
      ?auto_1854 - TRUCK
      ?auto_1847 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1851 ?auto_1853 ) ( IS-CRATE ?auto_1846 ) ( not ( = ?auto_1845 ?auto_1846 ) ) ( not ( = ?auto_1844 ?auto_1845 ) ) ( not ( = ?auto_1844 ?auto_1846 ) ) ( not ( = ?auto_1852 ?auto_1853 ) ) ( HOIST-AT ?auto_1848 ?auto_1852 ) ( not ( = ?auto_1851 ?auto_1848 ) ) ( SURFACE-AT ?auto_1846 ?auto_1852 ) ( ON ?auto_1846 ?auto_1850 ) ( CLEAR ?auto_1846 ) ( not ( = ?auto_1845 ?auto_1850 ) ) ( not ( = ?auto_1846 ?auto_1850 ) ) ( not ( = ?auto_1844 ?auto_1850 ) ) ( IS-CRATE ?auto_1845 ) ( AVAILABLE ?auto_1848 ) ( SURFACE-AT ?auto_1845 ?auto_1852 ) ( ON ?auto_1845 ?auto_1849 ) ( CLEAR ?auto_1845 ) ( not ( = ?auto_1845 ?auto_1849 ) ) ( not ( = ?auto_1846 ?auto_1849 ) ) ( not ( = ?auto_1844 ?auto_1849 ) ) ( not ( = ?auto_1850 ?auto_1849 ) ) ( TRUCK-AT ?auto_1854 ?auto_1853 ) ( SURFACE-AT ?auto_1847 ?auto_1853 ) ( CLEAR ?auto_1847 ) ( LIFTING ?auto_1851 ?auto_1844 ) ( IS-CRATE ?auto_1844 ) ( not ( = ?auto_1847 ?auto_1844 ) ) ( not ( = ?auto_1845 ?auto_1847 ) ) ( not ( = ?auto_1846 ?auto_1847 ) ) ( not ( = ?auto_1850 ?auto_1847 ) ) ( not ( = ?auto_1849 ?auto_1847 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1845 ?auto_1846 )
      ( MAKE-2CRATE-VERIFY ?auto_1844 ?auto_1845 ?auto_1846 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1855 - SURFACE
      ?auto_1856 - SURFACE
      ?auto_1857 - SURFACE
      ?auto_1858 - SURFACE
    )
    :vars
    (
      ?auto_1860 - HOIST
      ?auto_1862 - PLACE
      ?auto_1859 - PLACE
      ?auto_1865 - HOIST
      ?auto_1861 - SURFACE
      ?auto_1863 - SURFACE
      ?auto_1864 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1860 ?auto_1862 ) ( IS-CRATE ?auto_1858 ) ( not ( = ?auto_1857 ?auto_1858 ) ) ( not ( = ?auto_1856 ?auto_1857 ) ) ( not ( = ?auto_1856 ?auto_1858 ) ) ( not ( = ?auto_1859 ?auto_1862 ) ) ( HOIST-AT ?auto_1865 ?auto_1859 ) ( not ( = ?auto_1860 ?auto_1865 ) ) ( SURFACE-AT ?auto_1858 ?auto_1859 ) ( ON ?auto_1858 ?auto_1861 ) ( CLEAR ?auto_1858 ) ( not ( = ?auto_1857 ?auto_1861 ) ) ( not ( = ?auto_1858 ?auto_1861 ) ) ( not ( = ?auto_1856 ?auto_1861 ) ) ( IS-CRATE ?auto_1857 ) ( AVAILABLE ?auto_1865 ) ( SURFACE-AT ?auto_1857 ?auto_1859 ) ( ON ?auto_1857 ?auto_1863 ) ( CLEAR ?auto_1857 ) ( not ( = ?auto_1857 ?auto_1863 ) ) ( not ( = ?auto_1858 ?auto_1863 ) ) ( not ( = ?auto_1856 ?auto_1863 ) ) ( not ( = ?auto_1861 ?auto_1863 ) ) ( TRUCK-AT ?auto_1864 ?auto_1862 ) ( SURFACE-AT ?auto_1855 ?auto_1862 ) ( CLEAR ?auto_1855 ) ( LIFTING ?auto_1860 ?auto_1856 ) ( IS-CRATE ?auto_1856 ) ( not ( = ?auto_1855 ?auto_1856 ) ) ( not ( = ?auto_1857 ?auto_1855 ) ) ( not ( = ?auto_1858 ?auto_1855 ) ) ( not ( = ?auto_1861 ?auto_1855 ) ) ( not ( = ?auto_1863 ?auto_1855 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1856 ?auto_1857 ?auto_1858 )
      ( MAKE-3CRATE-VERIFY ?auto_1855 ?auto_1856 ?auto_1857 ?auto_1858 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1866 - SURFACE
      ?auto_1867 - SURFACE
    )
    :vars
    (
      ?auto_1869 - HOIST
      ?auto_1873 - PLACE
      ?auto_1870 - SURFACE
      ?auto_1868 - PLACE
      ?auto_1876 - HOIST
      ?auto_1871 - SURFACE
      ?auto_1874 - SURFACE
      ?auto_1875 - TRUCK
      ?auto_1872 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1869 ?auto_1873 ) ( IS-CRATE ?auto_1867 ) ( not ( = ?auto_1866 ?auto_1867 ) ) ( not ( = ?auto_1870 ?auto_1866 ) ) ( not ( = ?auto_1870 ?auto_1867 ) ) ( not ( = ?auto_1868 ?auto_1873 ) ) ( HOIST-AT ?auto_1876 ?auto_1868 ) ( not ( = ?auto_1869 ?auto_1876 ) ) ( SURFACE-AT ?auto_1867 ?auto_1868 ) ( ON ?auto_1867 ?auto_1871 ) ( CLEAR ?auto_1867 ) ( not ( = ?auto_1866 ?auto_1871 ) ) ( not ( = ?auto_1867 ?auto_1871 ) ) ( not ( = ?auto_1870 ?auto_1871 ) ) ( IS-CRATE ?auto_1866 ) ( AVAILABLE ?auto_1876 ) ( SURFACE-AT ?auto_1866 ?auto_1868 ) ( ON ?auto_1866 ?auto_1874 ) ( CLEAR ?auto_1866 ) ( not ( = ?auto_1866 ?auto_1874 ) ) ( not ( = ?auto_1867 ?auto_1874 ) ) ( not ( = ?auto_1870 ?auto_1874 ) ) ( not ( = ?auto_1871 ?auto_1874 ) ) ( TRUCK-AT ?auto_1875 ?auto_1873 ) ( SURFACE-AT ?auto_1872 ?auto_1873 ) ( CLEAR ?auto_1872 ) ( IS-CRATE ?auto_1870 ) ( not ( = ?auto_1872 ?auto_1870 ) ) ( not ( = ?auto_1866 ?auto_1872 ) ) ( not ( = ?auto_1867 ?auto_1872 ) ) ( not ( = ?auto_1871 ?auto_1872 ) ) ( not ( = ?auto_1874 ?auto_1872 ) ) ( AVAILABLE ?auto_1869 ) ( IN ?auto_1870 ?auto_1875 ) )
    :subtasks
    ( ( !UNLOAD ?auto_1869 ?auto_1870 ?auto_1875 ?auto_1873 )
      ( MAKE-2CRATE ?auto_1870 ?auto_1866 ?auto_1867 )
      ( MAKE-1CRATE-VERIFY ?auto_1866 ?auto_1867 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1877 - SURFACE
      ?auto_1878 - SURFACE
      ?auto_1879 - SURFACE
    )
    :vars
    (
      ?auto_1882 - HOIST
      ?auto_1883 - PLACE
      ?auto_1884 - PLACE
      ?auto_1887 - HOIST
      ?auto_1881 - SURFACE
      ?auto_1885 - SURFACE
      ?auto_1886 - TRUCK
      ?auto_1880 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1882 ?auto_1883 ) ( IS-CRATE ?auto_1879 ) ( not ( = ?auto_1878 ?auto_1879 ) ) ( not ( = ?auto_1877 ?auto_1878 ) ) ( not ( = ?auto_1877 ?auto_1879 ) ) ( not ( = ?auto_1884 ?auto_1883 ) ) ( HOIST-AT ?auto_1887 ?auto_1884 ) ( not ( = ?auto_1882 ?auto_1887 ) ) ( SURFACE-AT ?auto_1879 ?auto_1884 ) ( ON ?auto_1879 ?auto_1881 ) ( CLEAR ?auto_1879 ) ( not ( = ?auto_1878 ?auto_1881 ) ) ( not ( = ?auto_1879 ?auto_1881 ) ) ( not ( = ?auto_1877 ?auto_1881 ) ) ( IS-CRATE ?auto_1878 ) ( AVAILABLE ?auto_1887 ) ( SURFACE-AT ?auto_1878 ?auto_1884 ) ( ON ?auto_1878 ?auto_1885 ) ( CLEAR ?auto_1878 ) ( not ( = ?auto_1878 ?auto_1885 ) ) ( not ( = ?auto_1879 ?auto_1885 ) ) ( not ( = ?auto_1877 ?auto_1885 ) ) ( not ( = ?auto_1881 ?auto_1885 ) ) ( TRUCK-AT ?auto_1886 ?auto_1883 ) ( SURFACE-AT ?auto_1880 ?auto_1883 ) ( CLEAR ?auto_1880 ) ( IS-CRATE ?auto_1877 ) ( not ( = ?auto_1880 ?auto_1877 ) ) ( not ( = ?auto_1878 ?auto_1880 ) ) ( not ( = ?auto_1879 ?auto_1880 ) ) ( not ( = ?auto_1881 ?auto_1880 ) ) ( not ( = ?auto_1885 ?auto_1880 ) ) ( AVAILABLE ?auto_1882 ) ( IN ?auto_1877 ?auto_1886 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1878 ?auto_1879 )
      ( MAKE-2CRATE-VERIFY ?auto_1877 ?auto_1878 ?auto_1879 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1888 - SURFACE
      ?auto_1889 - SURFACE
      ?auto_1890 - SURFACE
      ?auto_1891 - SURFACE
    )
    :vars
    (
      ?auto_1892 - HOIST
      ?auto_1893 - PLACE
      ?auto_1895 - PLACE
      ?auto_1898 - HOIST
      ?auto_1897 - SURFACE
      ?auto_1896 - SURFACE
      ?auto_1894 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1892 ?auto_1893 ) ( IS-CRATE ?auto_1891 ) ( not ( = ?auto_1890 ?auto_1891 ) ) ( not ( = ?auto_1889 ?auto_1890 ) ) ( not ( = ?auto_1889 ?auto_1891 ) ) ( not ( = ?auto_1895 ?auto_1893 ) ) ( HOIST-AT ?auto_1898 ?auto_1895 ) ( not ( = ?auto_1892 ?auto_1898 ) ) ( SURFACE-AT ?auto_1891 ?auto_1895 ) ( ON ?auto_1891 ?auto_1897 ) ( CLEAR ?auto_1891 ) ( not ( = ?auto_1890 ?auto_1897 ) ) ( not ( = ?auto_1891 ?auto_1897 ) ) ( not ( = ?auto_1889 ?auto_1897 ) ) ( IS-CRATE ?auto_1890 ) ( AVAILABLE ?auto_1898 ) ( SURFACE-AT ?auto_1890 ?auto_1895 ) ( ON ?auto_1890 ?auto_1896 ) ( CLEAR ?auto_1890 ) ( not ( = ?auto_1890 ?auto_1896 ) ) ( not ( = ?auto_1891 ?auto_1896 ) ) ( not ( = ?auto_1889 ?auto_1896 ) ) ( not ( = ?auto_1897 ?auto_1896 ) ) ( TRUCK-AT ?auto_1894 ?auto_1893 ) ( SURFACE-AT ?auto_1888 ?auto_1893 ) ( CLEAR ?auto_1888 ) ( IS-CRATE ?auto_1889 ) ( not ( = ?auto_1888 ?auto_1889 ) ) ( not ( = ?auto_1890 ?auto_1888 ) ) ( not ( = ?auto_1891 ?auto_1888 ) ) ( not ( = ?auto_1897 ?auto_1888 ) ) ( not ( = ?auto_1896 ?auto_1888 ) ) ( AVAILABLE ?auto_1892 ) ( IN ?auto_1889 ?auto_1894 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1889 ?auto_1890 ?auto_1891 )
      ( MAKE-3CRATE-VERIFY ?auto_1888 ?auto_1889 ?auto_1890 ?auto_1891 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1899 - SURFACE
      ?auto_1900 - SURFACE
    )
    :vars
    (
      ?auto_1901 - HOIST
      ?auto_1902 - PLACE
      ?auto_1909 - SURFACE
      ?auto_1904 - PLACE
      ?auto_1907 - HOIST
      ?auto_1906 - SURFACE
      ?auto_1905 - SURFACE
      ?auto_1908 - SURFACE
      ?auto_1903 - TRUCK
      ?auto_1910 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1901 ?auto_1902 ) ( IS-CRATE ?auto_1900 ) ( not ( = ?auto_1899 ?auto_1900 ) ) ( not ( = ?auto_1909 ?auto_1899 ) ) ( not ( = ?auto_1909 ?auto_1900 ) ) ( not ( = ?auto_1904 ?auto_1902 ) ) ( HOIST-AT ?auto_1907 ?auto_1904 ) ( not ( = ?auto_1901 ?auto_1907 ) ) ( SURFACE-AT ?auto_1900 ?auto_1904 ) ( ON ?auto_1900 ?auto_1906 ) ( CLEAR ?auto_1900 ) ( not ( = ?auto_1899 ?auto_1906 ) ) ( not ( = ?auto_1900 ?auto_1906 ) ) ( not ( = ?auto_1909 ?auto_1906 ) ) ( IS-CRATE ?auto_1899 ) ( AVAILABLE ?auto_1907 ) ( SURFACE-AT ?auto_1899 ?auto_1904 ) ( ON ?auto_1899 ?auto_1905 ) ( CLEAR ?auto_1899 ) ( not ( = ?auto_1899 ?auto_1905 ) ) ( not ( = ?auto_1900 ?auto_1905 ) ) ( not ( = ?auto_1909 ?auto_1905 ) ) ( not ( = ?auto_1906 ?auto_1905 ) ) ( SURFACE-AT ?auto_1908 ?auto_1902 ) ( CLEAR ?auto_1908 ) ( IS-CRATE ?auto_1909 ) ( not ( = ?auto_1908 ?auto_1909 ) ) ( not ( = ?auto_1899 ?auto_1908 ) ) ( not ( = ?auto_1900 ?auto_1908 ) ) ( not ( = ?auto_1906 ?auto_1908 ) ) ( not ( = ?auto_1905 ?auto_1908 ) ) ( AVAILABLE ?auto_1901 ) ( IN ?auto_1909 ?auto_1903 ) ( TRUCK-AT ?auto_1903 ?auto_1910 ) ( not ( = ?auto_1910 ?auto_1902 ) ) ( not ( = ?auto_1904 ?auto_1910 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1903 ?auto_1910 ?auto_1902 )
      ( MAKE-2CRATE ?auto_1909 ?auto_1899 ?auto_1900 )
      ( MAKE-1CRATE-VERIFY ?auto_1899 ?auto_1900 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1911 - SURFACE
      ?auto_1912 - SURFACE
      ?auto_1913 - SURFACE
    )
    :vars
    (
      ?auto_1915 - HOIST
      ?auto_1922 - PLACE
      ?auto_1917 - PLACE
      ?auto_1914 - HOIST
      ?auto_1919 - SURFACE
      ?auto_1916 - SURFACE
      ?auto_1918 - SURFACE
      ?auto_1920 - TRUCK
      ?auto_1921 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1915 ?auto_1922 ) ( IS-CRATE ?auto_1913 ) ( not ( = ?auto_1912 ?auto_1913 ) ) ( not ( = ?auto_1911 ?auto_1912 ) ) ( not ( = ?auto_1911 ?auto_1913 ) ) ( not ( = ?auto_1917 ?auto_1922 ) ) ( HOIST-AT ?auto_1914 ?auto_1917 ) ( not ( = ?auto_1915 ?auto_1914 ) ) ( SURFACE-AT ?auto_1913 ?auto_1917 ) ( ON ?auto_1913 ?auto_1919 ) ( CLEAR ?auto_1913 ) ( not ( = ?auto_1912 ?auto_1919 ) ) ( not ( = ?auto_1913 ?auto_1919 ) ) ( not ( = ?auto_1911 ?auto_1919 ) ) ( IS-CRATE ?auto_1912 ) ( AVAILABLE ?auto_1914 ) ( SURFACE-AT ?auto_1912 ?auto_1917 ) ( ON ?auto_1912 ?auto_1916 ) ( CLEAR ?auto_1912 ) ( not ( = ?auto_1912 ?auto_1916 ) ) ( not ( = ?auto_1913 ?auto_1916 ) ) ( not ( = ?auto_1911 ?auto_1916 ) ) ( not ( = ?auto_1919 ?auto_1916 ) ) ( SURFACE-AT ?auto_1918 ?auto_1922 ) ( CLEAR ?auto_1918 ) ( IS-CRATE ?auto_1911 ) ( not ( = ?auto_1918 ?auto_1911 ) ) ( not ( = ?auto_1912 ?auto_1918 ) ) ( not ( = ?auto_1913 ?auto_1918 ) ) ( not ( = ?auto_1919 ?auto_1918 ) ) ( not ( = ?auto_1916 ?auto_1918 ) ) ( AVAILABLE ?auto_1915 ) ( IN ?auto_1911 ?auto_1920 ) ( TRUCK-AT ?auto_1920 ?auto_1921 ) ( not ( = ?auto_1921 ?auto_1922 ) ) ( not ( = ?auto_1917 ?auto_1921 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1912 ?auto_1913 )
      ( MAKE-2CRATE-VERIFY ?auto_1911 ?auto_1912 ?auto_1913 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1923 - SURFACE
      ?auto_1924 - SURFACE
      ?auto_1925 - SURFACE
      ?auto_1926 - SURFACE
    )
    :vars
    (
      ?auto_1930 - HOIST
      ?auto_1931 - PLACE
      ?auto_1928 - PLACE
      ?auto_1929 - HOIST
      ?auto_1934 - SURFACE
      ?auto_1927 - SURFACE
      ?auto_1932 - TRUCK
      ?auto_1933 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1930 ?auto_1931 ) ( IS-CRATE ?auto_1926 ) ( not ( = ?auto_1925 ?auto_1926 ) ) ( not ( = ?auto_1924 ?auto_1925 ) ) ( not ( = ?auto_1924 ?auto_1926 ) ) ( not ( = ?auto_1928 ?auto_1931 ) ) ( HOIST-AT ?auto_1929 ?auto_1928 ) ( not ( = ?auto_1930 ?auto_1929 ) ) ( SURFACE-AT ?auto_1926 ?auto_1928 ) ( ON ?auto_1926 ?auto_1934 ) ( CLEAR ?auto_1926 ) ( not ( = ?auto_1925 ?auto_1934 ) ) ( not ( = ?auto_1926 ?auto_1934 ) ) ( not ( = ?auto_1924 ?auto_1934 ) ) ( IS-CRATE ?auto_1925 ) ( AVAILABLE ?auto_1929 ) ( SURFACE-AT ?auto_1925 ?auto_1928 ) ( ON ?auto_1925 ?auto_1927 ) ( CLEAR ?auto_1925 ) ( not ( = ?auto_1925 ?auto_1927 ) ) ( not ( = ?auto_1926 ?auto_1927 ) ) ( not ( = ?auto_1924 ?auto_1927 ) ) ( not ( = ?auto_1934 ?auto_1927 ) ) ( SURFACE-AT ?auto_1923 ?auto_1931 ) ( CLEAR ?auto_1923 ) ( IS-CRATE ?auto_1924 ) ( not ( = ?auto_1923 ?auto_1924 ) ) ( not ( = ?auto_1925 ?auto_1923 ) ) ( not ( = ?auto_1926 ?auto_1923 ) ) ( not ( = ?auto_1934 ?auto_1923 ) ) ( not ( = ?auto_1927 ?auto_1923 ) ) ( AVAILABLE ?auto_1930 ) ( IN ?auto_1924 ?auto_1932 ) ( TRUCK-AT ?auto_1932 ?auto_1933 ) ( not ( = ?auto_1933 ?auto_1931 ) ) ( not ( = ?auto_1928 ?auto_1933 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1924 ?auto_1925 ?auto_1926 )
      ( MAKE-3CRATE-VERIFY ?auto_1923 ?auto_1924 ?auto_1925 ?auto_1926 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1935 - SURFACE
      ?auto_1936 - SURFACE
    )
    :vars
    (
      ?auto_1941 - HOIST
      ?auto_1942 - PLACE
      ?auto_1946 - SURFACE
      ?auto_1938 - PLACE
      ?auto_1939 - HOIST
      ?auto_1945 - SURFACE
      ?auto_1937 - SURFACE
      ?auto_1940 - SURFACE
      ?auto_1943 - TRUCK
      ?auto_1944 - PLACE
      ?auto_1947 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1941 ?auto_1942 ) ( IS-CRATE ?auto_1936 ) ( not ( = ?auto_1935 ?auto_1936 ) ) ( not ( = ?auto_1946 ?auto_1935 ) ) ( not ( = ?auto_1946 ?auto_1936 ) ) ( not ( = ?auto_1938 ?auto_1942 ) ) ( HOIST-AT ?auto_1939 ?auto_1938 ) ( not ( = ?auto_1941 ?auto_1939 ) ) ( SURFACE-AT ?auto_1936 ?auto_1938 ) ( ON ?auto_1936 ?auto_1945 ) ( CLEAR ?auto_1936 ) ( not ( = ?auto_1935 ?auto_1945 ) ) ( not ( = ?auto_1936 ?auto_1945 ) ) ( not ( = ?auto_1946 ?auto_1945 ) ) ( IS-CRATE ?auto_1935 ) ( AVAILABLE ?auto_1939 ) ( SURFACE-AT ?auto_1935 ?auto_1938 ) ( ON ?auto_1935 ?auto_1937 ) ( CLEAR ?auto_1935 ) ( not ( = ?auto_1935 ?auto_1937 ) ) ( not ( = ?auto_1936 ?auto_1937 ) ) ( not ( = ?auto_1946 ?auto_1937 ) ) ( not ( = ?auto_1945 ?auto_1937 ) ) ( SURFACE-AT ?auto_1940 ?auto_1942 ) ( CLEAR ?auto_1940 ) ( IS-CRATE ?auto_1946 ) ( not ( = ?auto_1940 ?auto_1946 ) ) ( not ( = ?auto_1935 ?auto_1940 ) ) ( not ( = ?auto_1936 ?auto_1940 ) ) ( not ( = ?auto_1945 ?auto_1940 ) ) ( not ( = ?auto_1937 ?auto_1940 ) ) ( AVAILABLE ?auto_1941 ) ( TRUCK-AT ?auto_1943 ?auto_1944 ) ( not ( = ?auto_1944 ?auto_1942 ) ) ( not ( = ?auto_1938 ?auto_1944 ) ) ( HOIST-AT ?auto_1947 ?auto_1944 ) ( LIFTING ?auto_1947 ?auto_1946 ) ( not ( = ?auto_1941 ?auto_1947 ) ) ( not ( = ?auto_1939 ?auto_1947 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1947 ?auto_1946 ?auto_1943 ?auto_1944 )
      ( MAKE-2CRATE ?auto_1946 ?auto_1935 ?auto_1936 )
      ( MAKE-1CRATE-VERIFY ?auto_1935 ?auto_1936 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1948 - SURFACE
      ?auto_1949 - SURFACE
      ?auto_1950 - SURFACE
    )
    :vars
    (
      ?auto_1958 - HOIST
      ?auto_1955 - PLACE
      ?auto_1954 - PLACE
      ?auto_1952 - HOIST
      ?auto_1957 - SURFACE
      ?auto_1960 - SURFACE
      ?auto_1953 - SURFACE
      ?auto_1956 - TRUCK
      ?auto_1951 - PLACE
      ?auto_1959 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1958 ?auto_1955 ) ( IS-CRATE ?auto_1950 ) ( not ( = ?auto_1949 ?auto_1950 ) ) ( not ( = ?auto_1948 ?auto_1949 ) ) ( not ( = ?auto_1948 ?auto_1950 ) ) ( not ( = ?auto_1954 ?auto_1955 ) ) ( HOIST-AT ?auto_1952 ?auto_1954 ) ( not ( = ?auto_1958 ?auto_1952 ) ) ( SURFACE-AT ?auto_1950 ?auto_1954 ) ( ON ?auto_1950 ?auto_1957 ) ( CLEAR ?auto_1950 ) ( not ( = ?auto_1949 ?auto_1957 ) ) ( not ( = ?auto_1950 ?auto_1957 ) ) ( not ( = ?auto_1948 ?auto_1957 ) ) ( IS-CRATE ?auto_1949 ) ( AVAILABLE ?auto_1952 ) ( SURFACE-AT ?auto_1949 ?auto_1954 ) ( ON ?auto_1949 ?auto_1960 ) ( CLEAR ?auto_1949 ) ( not ( = ?auto_1949 ?auto_1960 ) ) ( not ( = ?auto_1950 ?auto_1960 ) ) ( not ( = ?auto_1948 ?auto_1960 ) ) ( not ( = ?auto_1957 ?auto_1960 ) ) ( SURFACE-AT ?auto_1953 ?auto_1955 ) ( CLEAR ?auto_1953 ) ( IS-CRATE ?auto_1948 ) ( not ( = ?auto_1953 ?auto_1948 ) ) ( not ( = ?auto_1949 ?auto_1953 ) ) ( not ( = ?auto_1950 ?auto_1953 ) ) ( not ( = ?auto_1957 ?auto_1953 ) ) ( not ( = ?auto_1960 ?auto_1953 ) ) ( AVAILABLE ?auto_1958 ) ( TRUCK-AT ?auto_1956 ?auto_1951 ) ( not ( = ?auto_1951 ?auto_1955 ) ) ( not ( = ?auto_1954 ?auto_1951 ) ) ( HOIST-AT ?auto_1959 ?auto_1951 ) ( LIFTING ?auto_1959 ?auto_1948 ) ( not ( = ?auto_1958 ?auto_1959 ) ) ( not ( = ?auto_1952 ?auto_1959 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1949 ?auto_1950 )
      ( MAKE-2CRATE-VERIFY ?auto_1948 ?auto_1949 ?auto_1950 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1961 - SURFACE
      ?auto_1962 - SURFACE
      ?auto_1963 - SURFACE
      ?auto_1964 - SURFACE
    )
    :vars
    (
      ?auto_1966 - HOIST
      ?auto_1972 - PLACE
      ?auto_1970 - PLACE
      ?auto_1969 - HOIST
      ?auto_1973 - SURFACE
      ?auto_1967 - SURFACE
      ?auto_1965 - TRUCK
      ?auto_1971 - PLACE
      ?auto_1968 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1966 ?auto_1972 ) ( IS-CRATE ?auto_1964 ) ( not ( = ?auto_1963 ?auto_1964 ) ) ( not ( = ?auto_1962 ?auto_1963 ) ) ( not ( = ?auto_1962 ?auto_1964 ) ) ( not ( = ?auto_1970 ?auto_1972 ) ) ( HOIST-AT ?auto_1969 ?auto_1970 ) ( not ( = ?auto_1966 ?auto_1969 ) ) ( SURFACE-AT ?auto_1964 ?auto_1970 ) ( ON ?auto_1964 ?auto_1973 ) ( CLEAR ?auto_1964 ) ( not ( = ?auto_1963 ?auto_1973 ) ) ( not ( = ?auto_1964 ?auto_1973 ) ) ( not ( = ?auto_1962 ?auto_1973 ) ) ( IS-CRATE ?auto_1963 ) ( AVAILABLE ?auto_1969 ) ( SURFACE-AT ?auto_1963 ?auto_1970 ) ( ON ?auto_1963 ?auto_1967 ) ( CLEAR ?auto_1963 ) ( not ( = ?auto_1963 ?auto_1967 ) ) ( not ( = ?auto_1964 ?auto_1967 ) ) ( not ( = ?auto_1962 ?auto_1967 ) ) ( not ( = ?auto_1973 ?auto_1967 ) ) ( SURFACE-AT ?auto_1961 ?auto_1972 ) ( CLEAR ?auto_1961 ) ( IS-CRATE ?auto_1962 ) ( not ( = ?auto_1961 ?auto_1962 ) ) ( not ( = ?auto_1963 ?auto_1961 ) ) ( not ( = ?auto_1964 ?auto_1961 ) ) ( not ( = ?auto_1973 ?auto_1961 ) ) ( not ( = ?auto_1967 ?auto_1961 ) ) ( AVAILABLE ?auto_1966 ) ( TRUCK-AT ?auto_1965 ?auto_1971 ) ( not ( = ?auto_1971 ?auto_1972 ) ) ( not ( = ?auto_1970 ?auto_1971 ) ) ( HOIST-AT ?auto_1968 ?auto_1971 ) ( LIFTING ?auto_1968 ?auto_1962 ) ( not ( = ?auto_1966 ?auto_1968 ) ) ( not ( = ?auto_1969 ?auto_1968 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1962 ?auto_1963 ?auto_1964 )
      ( MAKE-3CRATE-VERIFY ?auto_1961 ?auto_1962 ?auto_1963 ?auto_1964 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1974 - SURFACE
      ?auto_1975 - SURFACE
    )
    :vars
    (
      ?auto_1977 - HOIST
      ?auto_1983 - PLACE
      ?auto_1986 - SURFACE
      ?auto_1981 - PLACE
      ?auto_1980 - HOIST
      ?auto_1984 - SURFACE
      ?auto_1978 - SURFACE
      ?auto_1985 - SURFACE
      ?auto_1976 - TRUCK
      ?auto_1982 - PLACE
      ?auto_1979 - HOIST
      ?auto_1987 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1977 ?auto_1983 ) ( IS-CRATE ?auto_1975 ) ( not ( = ?auto_1974 ?auto_1975 ) ) ( not ( = ?auto_1986 ?auto_1974 ) ) ( not ( = ?auto_1986 ?auto_1975 ) ) ( not ( = ?auto_1981 ?auto_1983 ) ) ( HOIST-AT ?auto_1980 ?auto_1981 ) ( not ( = ?auto_1977 ?auto_1980 ) ) ( SURFACE-AT ?auto_1975 ?auto_1981 ) ( ON ?auto_1975 ?auto_1984 ) ( CLEAR ?auto_1975 ) ( not ( = ?auto_1974 ?auto_1984 ) ) ( not ( = ?auto_1975 ?auto_1984 ) ) ( not ( = ?auto_1986 ?auto_1984 ) ) ( IS-CRATE ?auto_1974 ) ( AVAILABLE ?auto_1980 ) ( SURFACE-AT ?auto_1974 ?auto_1981 ) ( ON ?auto_1974 ?auto_1978 ) ( CLEAR ?auto_1974 ) ( not ( = ?auto_1974 ?auto_1978 ) ) ( not ( = ?auto_1975 ?auto_1978 ) ) ( not ( = ?auto_1986 ?auto_1978 ) ) ( not ( = ?auto_1984 ?auto_1978 ) ) ( SURFACE-AT ?auto_1985 ?auto_1983 ) ( CLEAR ?auto_1985 ) ( IS-CRATE ?auto_1986 ) ( not ( = ?auto_1985 ?auto_1986 ) ) ( not ( = ?auto_1974 ?auto_1985 ) ) ( not ( = ?auto_1975 ?auto_1985 ) ) ( not ( = ?auto_1984 ?auto_1985 ) ) ( not ( = ?auto_1978 ?auto_1985 ) ) ( AVAILABLE ?auto_1977 ) ( TRUCK-AT ?auto_1976 ?auto_1982 ) ( not ( = ?auto_1982 ?auto_1983 ) ) ( not ( = ?auto_1981 ?auto_1982 ) ) ( HOIST-AT ?auto_1979 ?auto_1982 ) ( not ( = ?auto_1977 ?auto_1979 ) ) ( not ( = ?auto_1980 ?auto_1979 ) ) ( AVAILABLE ?auto_1979 ) ( SURFACE-AT ?auto_1986 ?auto_1982 ) ( ON ?auto_1986 ?auto_1987 ) ( CLEAR ?auto_1986 ) ( not ( = ?auto_1974 ?auto_1987 ) ) ( not ( = ?auto_1975 ?auto_1987 ) ) ( not ( = ?auto_1986 ?auto_1987 ) ) ( not ( = ?auto_1984 ?auto_1987 ) ) ( not ( = ?auto_1978 ?auto_1987 ) ) ( not ( = ?auto_1985 ?auto_1987 ) ) )
    :subtasks
    ( ( !LIFT ?auto_1979 ?auto_1986 ?auto_1987 ?auto_1982 )
      ( MAKE-2CRATE ?auto_1986 ?auto_1974 ?auto_1975 )
      ( MAKE-1CRATE-VERIFY ?auto_1974 ?auto_1975 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1988 - SURFACE
      ?auto_1989 - SURFACE
      ?auto_1990 - SURFACE
    )
    :vars
    (
      ?auto_2000 - HOIST
      ?auto_1992 - PLACE
      ?auto_1997 - PLACE
      ?auto_1993 - HOIST
      ?auto_2001 - SURFACE
      ?auto_1994 - SURFACE
      ?auto_1998 - SURFACE
      ?auto_1995 - TRUCK
      ?auto_1991 - PLACE
      ?auto_1996 - HOIST
      ?auto_1999 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2000 ?auto_1992 ) ( IS-CRATE ?auto_1990 ) ( not ( = ?auto_1989 ?auto_1990 ) ) ( not ( = ?auto_1988 ?auto_1989 ) ) ( not ( = ?auto_1988 ?auto_1990 ) ) ( not ( = ?auto_1997 ?auto_1992 ) ) ( HOIST-AT ?auto_1993 ?auto_1997 ) ( not ( = ?auto_2000 ?auto_1993 ) ) ( SURFACE-AT ?auto_1990 ?auto_1997 ) ( ON ?auto_1990 ?auto_2001 ) ( CLEAR ?auto_1990 ) ( not ( = ?auto_1989 ?auto_2001 ) ) ( not ( = ?auto_1990 ?auto_2001 ) ) ( not ( = ?auto_1988 ?auto_2001 ) ) ( IS-CRATE ?auto_1989 ) ( AVAILABLE ?auto_1993 ) ( SURFACE-AT ?auto_1989 ?auto_1997 ) ( ON ?auto_1989 ?auto_1994 ) ( CLEAR ?auto_1989 ) ( not ( = ?auto_1989 ?auto_1994 ) ) ( not ( = ?auto_1990 ?auto_1994 ) ) ( not ( = ?auto_1988 ?auto_1994 ) ) ( not ( = ?auto_2001 ?auto_1994 ) ) ( SURFACE-AT ?auto_1998 ?auto_1992 ) ( CLEAR ?auto_1998 ) ( IS-CRATE ?auto_1988 ) ( not ( = ?auto_1998 ?auto_1988 ) ) ( not ( = ?auto_1989 ?auto_1998 ) ) ( not ( = ?auto_1990 ?auto_1998 ) ) ( not ( = ?auto_2001 ?auto_1998 ) ) ( not ( = ?auto_1994 ?auto_1998 ) ) ( AVAILABLE ?auto_2000 ) ( TRUCK-AT ?auto_1995 ?auto_1991 ) ( not ( = ?auto_1991 ?auto_1992 ) ) ( not ( = ?auto_1997 ?auto_1991 ) ) ( HOIST-AT ?auto_1996 ?auto_1991 ) ( not ( = ?auto_2000 ?auto_1996 ) ) ( not ( = ?auto_1993 ?auto_1996 ) ) ( AVAILABLE ?auto_1996 ) ( SURFACE-AT ?auto_1988 ?auto_1991 ) ( ON ?auto_1988 ?auto_1999 ) ( CLEAR ?auto_1988 ) ( not ( = ?auto_1989 ?auto_1999 ) ) ( not ( = ?auto_1990 ?auto_1999 ) ) ( not ( = ?auto_1988 ?auto_1999 ) ) ( not ( = ?auto_2001 ?auto_1999 ) ) ( not ( = ?auto_1994 ?auto_1999 ) ) ( not ( = ?auto_1998 ?auto_1999 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1989 ?auto_1990 )
      ( MAKE-2CRATE-VERIFY ?auto_1988 ?auto_1989 ?auto_1990 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2002 - SURFACE
      ?auto_2003 - SURFACE
      ?auto_2004 - SURFACE
      ?auto_2005 - SURFACE
    )
    :vars
    (
      ?auto_2010 - HOIST
      ?auto_2009 - PLACE
      ?auto_2015 - PLACE
      ?auto_2006 - HOIST
      ?auto_2008 - SURFACE
      ?auto_2013 - SURFACE
      ?auto_2011 - TRUCK
      ?auto_2012 - PLACE
      ?auto_2014 - HOIST
      ?auto_2007 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2010 ?auto_2009 ) ( IS-CRATE ?auto_2005 ) ( not ( = ?auto_2004 ?auto_2005 ) ) ( not ( = ?auto_2003 ?auto_2004 ) ) ( not ( = ?auto_2003 ?auto_2005 ) ) ( not ( = ?auto_2015 ?auto_2009 ) ) ( HOIST-AT ?auto_2006 ?auto_2015 ) ( not ( = ?auto_2010 ?auto_2006 ) ) ( SURFACE-AT ?auto_2005 ?auto_2015 ) ( ON ?auto_2005 ?auto_2008 ) ( CLEAR ?auto_2005 ) ( not ( = ?auto_2004 ?auto_2008 ) ) ( not ( = ?auto_2005 ?auto_2008 ) ) ( not ( = ?auto_2003 ?auto_2008 ) ) ( IS-CRATE ?auto_2004 ) ( AVAILABLE ?auto_2006 ) ( SURFACE-AT ?auto_2004 ?auto_2015 ) ( ON ?auto_2004 ?auto_2013 ) ( CLEAR ?auto_2004 ) ( not ( = ?auto_2004 ?auto_2013 ) ) ( not ( = ?auto_2005 ?auto_2013 ) ) ( not ( = ?auto_2003 ?auto_2013 ) ) ( not ( = ?auto_2008 ?auto_2013 ) ) ( SURFACE-AT ?auto_2002 ?auto_2009 ) ( CLEAR ?auto_2002 ) ( IS-CRATE ?auto_2003 ) ( not ( = ?auto_2002 ?auto_2003 ) ) ( not ( = ?auto_2004 ?auto_2002 ) ) ( not ( = ?auto_2005 ?auto_2002 ) ) ( not ( = ?auto_2008 ?auto_2002 ) ) ( not ( = ?auto_2013 ?auto_2002 ) ) ( AVAILABLE ?auto_2010 ) ( TRUCK-AT ?auto_2011 ?auto_2012 ) ( not ( = ?auto_2012 ?auto_2009 ) ) ( not ( = ?auto_2015 ?auto_2012 ) ) ( HOIST-AT ?auto_2014 ?auto_2012 ) ( not ( = ?auto_2010 ?auto_2014 ) ) ( not ( = ?auto_2006 ?auto_2014 ) ) ( AVAILABLE ?auto_2014 ) ( SURFACE-AT ?auto_2003 ?auto_2012 ) ( ON ?auto_2003 ?auto_2007 ) ( CLEAR ?auto_2003 ) ( not ( = ?auto_2004 ?auto_2007 ) ) ( not ( = ?auto_2005 ?auto_2007 ) ) ( not ( = ?auto_2003 ?auto_2007 ) ) ( not ( = ?auto_2008 ?auto_2007 ) ) ( not ( = ?auto_2013 ?auto_2007 ) ) ( not ( = ?auto_2002 ?auto_2007 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2003 ?auto_2004 ?auto_2005 )
      ( MAKE-3CRATE-VERIFY ?auto_2002 ?auto_2003 ?auto_2004 ?auto_2005 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2016 - SURFACE
      ?auto_2017 - SURFACE
    )
    :vars
    (
      ?auto_2023 - HOIST
      ?auto_2021 - PLACE
      ?auto_2029 - SURFACE
      ?auto_2028 - PLACE
      ?auto_2018 - HOIST
      ?auto_2020 - SURFACE
      ?auto_2026 - SURFACE
      ?auto_2022 - SURFACE
      ?auto_2025 - PLACE
      ?auto_2027 - HOIST
      ?auto_2019 - SURFACE
      ?auto_2024 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2023 ?auto_2021 ) ( IS-CRATE ?auto_2017 ) ( not ( = ?auto_2016 ?auto_2017 ) ) ( not ( = ?auto_2029 ?auto_2016 ) ) ( not ( = ?auto_2029 ?auto_2017 ) ) ( not ( = ?auto_2028 ?auto_2021 ) ) ( HOIST-AT ?auto_2018 ?auto_2028 ) ( not ( = ?auto_2023 ?auto_2018 ) ) ( SURFACE-AT ?auto_2017 ?auto_2028 ) ( ON ?auto_2017 ?auto_2020 ) ( CLEAR ?auto_2017 ) ( not ( = ?auto_2016 ?auto_2020 ) ) ( not ( = ?auto_2017 ?auto_2020 ) ) ( not ( = ?auto_2029 ?auto_2020 ) ) ( IS-CRATE ?auto_2016 ) ( AVAILABLE ?auto_2018 ) ( SURFACE-AT ?auto_2016 ?auto_2028 ) ( ON ?auto_2016 ?auto_2026 ) ( CLEAR ?auto_2016 ) ( not ( = ?auto_2016 ?auto_2026 ) ) ( not ( = ?auto_2017 ?auto_2026 ) ) ( not ( = ?auto_2029 ?auto_2026 ) ) ( not ( = ?auto_2020 ?auto_2026 ) ) ( SURFACE-AT ?auto_2022 ?auto_2021 ) ( CLEAR ?auto_2022 ) ( IS-CRATE ?auto_2029 ) ( not ( = ?auto_2022 ?auto_2029 ) ) ( not ( = ?auto_2016 ?auto_2022 ) ) ( not ( = ?auto_2017 ?auto_2022 ) ) ( not ( = ?auto_2020 ?auto_2022 ) ) ( not ( = ?auto_2026 ?auto_2022 ) ) ( AVAILABLE ?auto_2023 ) ( not ( = ?auto_2025 ?auto_2021 ) ) ( not ( = ?auto_2028 ?auto_2025 ) ) ( HOIST-AT ?auto_2027 ?auto_2025 ) ( not ( = ?auto_2023 ?auto_2027 ) ) ( not ( = ?auto_2018 ?auto_2027 ) ) ( AVAILABLE ?auto_2027 ) ( SURFACE-AT ?auto_2029 ?auto_2025 ) ( ON ?auto_2029 ?auto_2019 ) ( CLEAR ?auto_2029 ) ( not ( = ?auto_2016 ?auto_2019 ) ) ( not ( = ?auto_2017 ?auto_2019 ) ) ( not ( = ?auto_2029 ?auto_2019 ) ) ( not ( = ?auto_2020 ?auto_2019 ) ) ( not ( = ?auto_2026 ?auto_2019 ) ) ( not ( = ?auto_2022 ?auto_2019 ) ) ( TRUCK-AT ?auto_2024 ?auto_2021 ) )
    :subtasks
    ( ( !DRIVE ?auto_2024 ?auto_2021 ?auto_2025 )
      ( MAKE-2CRATE ?auto_2029 ?auto_2016 ?auto_2017 )
      ( MAKE-1CRATE-VERIFY ?auto_2016 ?auto_2017 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2030 - SURFACE
      ?auto_2031 - SURFACE
      ?auto_2032 - SURFACE
    )
    :vars
    (
      ?auto_2038 - HOIST
      ?auto_2035 - PLACE
      ?auto_2042 - PLACE
      ?auto_2043 - HOIST
      ?auto_2041 - SURFACE
      ?auto_2033 - SURFACE
      ?auto_2036 - SURFACE
      ?auto_2040 - PLACE
      ?auto_2037 - HOIST
      ?auto_2039 - SURFACE
      ?auto_2034 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2038 ?auto_2035 ) ( IS-CRATE ?auto_2032 ) ( not ( = ?auto_2031 ?auto_2032 ) ) ( not ( = ?auto_2030 ?auto_2031 ) ) ( not ( = ?auto_2030 ?auto_2032 ) ) ( not ( = ?auto_2042 ?auto_2035 ) ) ( HOIST-AT ?auto_2043 ?auto_2042 ) ( not ( = ?auto_2038 ?auto_2043 ) ) ( SURFACE-AT ?auto_2032 ?auto_2042 ) ( ON ?auto_2032 ?auto_2041 ) ( CLEAR ?auto_2032 ) ( not ( = ?auto_2031 ?auto_2041 ) ) ( not ( = ?auto_2032 ?auto_2041 ) ) ( not ( = ?auto_2030 ?auto_2041 ) ) ( IS-CRATE ?auto_2031 ) ( AVAILABLE ?auto_2043 ) ( SURFACE-AT ?auto_2031 ?auto_2042 ) ( ON ?auto_2031 ?auto_2033 ) ( CLEAR ?auto_2031 ) ( not ( = ?auto_2031 ?auto_2033 ) ) ( not ( = ?auto_2032 ?auto_2033 ) ) ( not ( = ?auto_2030 ?auto_2033 ) ) ( not ( = ?auto_2041 ?auto_2033 ) ) ( SURFACE-AT ?auto_2036 ?auto_2035 ) ( CLEAR ?auto_2036 ) ( IS-CRATE ?auto_2030 ) ( not ( = ?auto_2036 ?auto_2030 ) ) ( not ( = ?auto_2031 ?auto_2036 ) ) ( not ( = ?auto_2032 ?auto_2036 ) ) ( not ( = ?auto_2041 ?auto_2036 ) ) ( not ( = ?auto_2033 ?auto_2036 ) ) ( AVAILABLE ?auto_2038 ) ( not ( = ?auto_2040 ?auto_2035 ) ) ( not ( = ?auto_2042 ?auto_2040 ) ) ( HOIST-AT ?auto_2037 ?auto_2040 ) ( not ( = ?auto_2038 ?auto_2037 ) ) ( not ( = ?auto_2043 ?auto_2037 ) ) ( AVAILABLE ?auto_2037 ) ( SURFACE-AT ?auto_2030 ?auto_2040 ) ( ON ?auto_2030 ?auto_2039 ) ( CLEAR ?auto_2030 ) ( not ( = ?auto_2031 ?auto_2039 ) ) ( not ( = ?auto_2032 ?auto_2039 ) ) ( not ( = ?auto_2030 ?auto_2039 ) ) ( not ( = ?auto_2041 ?auto_2039 ) ) ( not ( = ?auto_2033 ?auto_2039 ) ) ( not ( = ?auto_2036 ?auto_2039 ) ) ( TRUCK-AT ?auto_2034 ?auto_2035 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2031 ?auto_2032 )
      ( MAKE-2CRATE-VERIFY ?auto_2030 ?auto_2031 ?auto_2032 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2044 - SURFACE
      ?auto_2045 - SURFACE
      ?auto_2046 - SURFACE
      ?auto_2047 - SURFACE
    )
    :vars
    (
      ?auto_2048 - HOIST
      ?auto_2050 - PLACE
      ?auto_2051 - PLACE
      ?auto_2052 - HOIST
      ?auto_2053 - SURFACE
      ?auto_2057 - SURFACE
      ?auto_2049 - PLACE
      ?auto_2054 - HOIST
      ?auto_2055 - SURFACE
      ?auto_2056 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2048 ?auto_2050 ) ( IS-CRATE ?auto_2047 ) ( not ( = ?auto_2046 ?auto_2047 ) ) ( not ( = ?auto_2045 ?auto_2046 ) ) ( not ( = ?auto_2045 ?auto_2047 ) ) ( not ( = ?auto_2051 ?auto_2050 ) ) ( HOIST-AT ?auto_2052 ?auto_2051 ) ( not ( = ?auto_2048 ?auto_2052 ) ) ( SURFACE-AT ?auto_2047 ?auto_2051 ) ( ON ?auto_2047 ?auto_2053 ) ( CLEAR ?auto_2047 ) ( not ( = ?auto_2046 ?auto_2053 ) ) ( not ( = ?auto_2047 ?auto_2053 ) ) ( not ( = ?auto_2045 ?auto_2053 ) ) ( IS-CRATE ?auto_2046 ) ( AVAILABLE ?auto_2052 ) ( SURFACE-AT ?auto_2046 ?auto_2051 ) ( ON ?auto_2046 ?auto_2057 ) ( CLEAR ?auto_2046 ) ( not ( = ?auto_2046 ?auto_2057 ) ) ( not ( = ?auto_2047 ?auto_2057 ) ) ( not ( = ?auto_2045 ?auto_2057 ) ) ( not ( = ?auto_2053 ?auto_2057 ) ) ( SURFACE-AT ?auto_2044 ?auto_2050 ) ( CLEAR ?auto_2044 ) ( IS-CRATE ?auto_2045 ) ( not ( = ?auto_2044 ?auto_2045 ) ) ( not ( = ?auto_2046 ?auto_2044 ) ) ( not ( = ?auto_2047 ?auto_2044 ) ) ( not ( = ?auto_2053 ?auto_2044 ) ) ( not ( = ?auto_2057 ?auto_2044 ) ) ( AVAILABLE ?auto_2048 ) ( not ( = ?auto_2049 ?auto_2050 ) ) ( not ( = ?auto_2051 ?auto_2049 ) ) ( HOIST-AT ?auto_2054 ?auto_2049 ) ( not ( = ?auto_2048 ?auto_2054 ) ) ( not ( = ?auto_2052 ?auto_2054 ) ) ( AVAILABLE ?auto_2054 ) ( SURFACE-AT ?auto_2045 ?auto_2049 ) ( ON ?auto_2045 ?auto_2055 ) ( CLEAR ?auto_2045 ) ( not ( = ?auto_2046 ?auto_2055 ) ) ( not ( = ?auto_2047 ?auto_2055 ) ) ( not ( = ?auto_2045 ?auto_2055 ) ) ( not ( = ?auto_2053 ?auto_2055 ) ) ( not ( = ?auto_2057 ?auto_2055 ) ) ( not ( = ?auto_2044 ?auto_2055 ) ) ( TRUCK-AT ?auto_2056 ?auto_2050 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2045 ?auto_2046 ?auto_2047 )
      ( MAKE-3CRATE-VERIFY ?auto_2044 ?auto_2045 ?auto_2046 ?auto_2047 ) )
  )

)

