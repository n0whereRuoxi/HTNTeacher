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

  ( :method MAKE-ON-VERIFY
    :parameters
    (
      ?c1 - SURFACE
      ?c2 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?c2 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1282 - SURFACE
      ?auto_1283 - SURFACE
    )
    :vars
    (
      ?auto_1284 - HOIST
      ?auto_1285 - PLACE
      ?auto_1287 - PLACE
      ?auto_1288 - HOIST
      ?auto_1289 - SURFACE
      ?auto_1286 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1284 ?auto_1285 ) ( SURFACE-AT ?auto_1283 ?auto_1285 ) ( CLEAR ?auto_1283 ) ( IS-CRATE ?auto_1282 ) ( AVAILABLE ?auto_1284 ) ( not ( = ?auto_1287 ?auto_1285 ) ) ( HOIST-AT ?auto_1288 ?auto_1287 ) ( AVAILABLE ?auto_1288 ) ( SURFACE-AT ?auto_1282 ?auto_1287 ) ( ON ?auto_1282 ?auto_1289 ) ( CLEAR ?auto_1282 ) ( TRUCK-AT ?auto_1286 ?auto_1285 ) ( not ( = ?auto_1282 ?auto_1283 ) ) ( not ( = ?auto_1282 ?auto_1289 ) ) ( not ( = ?auto_1283 ?auto_1289 ) ) ( not ( = ?auto_1284 ?auto_1288 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1286 ?auto_1285 ?auto_1287 )
      ( !LIFT ?auto_1288 ?auto_1282 ?auto_1289 ?auto_1287 )
      ( !LOAD ?auto_1288 ?auto_1282 ?auto_1286 ?auto_1287 )
      ( !DRIVE ?auto_1286 ?auto_1287 ?auto_1285 )
      ( !UNLOAD ?auto_1284 ?auto_1282 ?auto_1286 ?auto_1285 )
      ( !DROP ?auto_1284 ?auto_1282 ?auto_1283 ?auto_1285 )
      ( MAKE-ON-VERIFY ?auto_1282 ?auto_1283 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1292 - SURFACE
      ?auto_1293 - SURFACE
    )
    :vars
    (
      ?auto_1294 - HOIST
      ?auto_1295 - PLACE
      ?auto_1297 - PLACE
      ?auto_1298 - HOIST
      ?auto_1299 - SURFACE
      ?auto_1296 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1294 ?auto_1295 ) ( SURFACE-AT ?auto_1293 ?auto_1295 ) ( CLEAR ?auto_1293 ) ( IS-CRATE ?auto_1292 ) ( AVAILABLE ?auto_1294 ) ( not ( = ?auto_1297 ?auto_1295 ) ) ( HOIST-AT ?auto_1298 ?auto_1297 ) ( AVAILABLE ?auto_1298 ) ( SURFACE-AT ?auto_1292 ?auto_1297 ) ( ON ?auto_1292 ?auto_1299 ) ( CLEAR ?auto_1292 ) ( TRUCK-AT ?auto_1296 ?auto_1295 ) ( not ( = ?auto_1292 ?auto_1293 ) ) ( not ( = ?auto_1292 ?auto_1299 ) ) ( not ( = ?auto_1293 ?auto_1299 ) ) ( not ( = ?auto_1294 ?auto_1298 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1296 ?auto_1295 ?auto_1297 )
      ( !LIFT ?auto_1298 ?auto_1292 ?auto_1299 ?auto_1297 )
      ( !LOAD ?auto_1298 ?auto_1292 ?auto_1296 ?auto_1297 )
      ( !DRIVE ?auto_1296 ?auto_1297 ?auto_1295 )
      ( !UNLOAD ?auto_1294 ?auto_1292 ?auto_1296 ?auto_1295 )
      ( !DROP ?auto_1294 ?auto_1292 ?auto_1293 ?auto_1295 )
      ( MAKE-ON-VERIFY ?auto_1292 ?auto_1293 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1302 - SURFACE
      ?auto_1303 - SURFACE
    )
    :vars
    (
      ?auto_1304 - HOIST
      ?auto_1305 - PLACE
      ?auto_1307 - PLACE
      ?auto_1308 - HOIST
      ?auto_1309 - SURFACE
      ?auto_1306 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1304 ?auto_1305 ) ( SURFACE-AT ?auto_1303 ?auto_1305 ) ( CLEAR ?auto_1303 ) ( IS-CRATE ?auto_1302 ) ( AVAILABLE ?auto_1304 ) ( not ( = ?auto_1307 ?auto_1305 ) ) ( HOIST-AT ?auto_1308 ?auto_1307 ) ( AVAILABLE ?auto_1308 ) ( SURFACE-AT ?auto_1302 ?auto_1307 ) ( ON ?auto_1302 ?auto_1309 ) ( CLEAR ?auto_1302 ) ( TRUCK-AT ?auto_1306 ?auto_1305 ) ( not ( = ?auto_1302 ?auto_1303 ) ) ( not ( = ?auto_1302 ?auto_1309 ) ) ( not ( = ?auto_1303 ?auto_1309 ) ) ( not ( = ?auto_1304 ?auto_1308 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1306 ?auto_1305 ?auto_1307 )
      ( !LIFT ?auto_1308 ?auto_1302 ?auto_1309 ?auto_1307 )
      ( !LOAD ?auto_1308 ?auto_1302 ?auto_1306 ?auto_1307 )
      ( !DRIVE ?auto_1306 ?auto_1307 ?auto_1305 )
      ( !UNLOAD ?auto_1304 ?auto_1302 ?auto_1306 ?auto_1305 )
      ( !DROP ?auto_1304 ?auto_1302 ?auto_1303 ?auto_1305 )
      ( MAKE-ON-VERIFY ?auto_1302 ?auto_1303 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1312 - SURFACE
      ?auto_1313 - SURFACE
    )
    :vars
    (
      ?auto_1314 - HOIST
      ?auto_1315 - PLACE
      ?auto_1317 - PLACE
      ?auto_1318 - HOIST
      ?auto_1319 - SURFACE
      ?auto_1316 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1314 ?auto_1315 ) ( SURFACE-AT ?auto_1313 ?auto_1315 ) ( CLEAR ?auto_1313 ) ( IS-CRATE ?auto_1312 ) ( AVAILABLE ?auto_1314 ) ( not ( = ?auto_1317 ?auto_1315 ) ) ( HOIST-AT ?auto_1318 ?auto_1317 ) ( AVAILABLE ?auto_1318 ) ( SURFACE-AT ?auto_1312 ?auto_1317 ) ( ON ?auto_1312 ?auto_1319 ) ( CLEAR ?auto_1312 ) ( TRUCK-AT ?auto_1316 ?auto_1315 ) ( not ( = ?auto_1312 ?auto_1313 ) ) ( not ( = ?auto_1312 ?auto_1319 ) ) ( not ( = ?auto_1313 ?auto_1319 ) ) ( not ( = ?auto_1314 ?auto_1318 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1316 ?auto_1315 ?auto_1317 )
      ( !LIFT ?auto_1318 ?auto_1312 ?auto_1319 ?auto_1317 )
      ( !LOAD ?auto_1318 ?auto_1312 ?auto_1316 ?auto_1317 )
      ( !DRIVE ?auto_1316 ?auto_1317 ?auto_1315 )
      ( !UNLOAD ?auto_1314 ?auto_1312 ?auto_1316 ?auto_1315 )
      ( !DROP ?auto_1314 ?auto_1312 ?auto_1313 ?auto_1315 )
      ( MAKE-ON-VERIFY ?auto_1312 ?auto_1313 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1322 - SURFACE
      ?auto_1323 - SURFACE
    )
    :vars
    (
      ?auto_1324 - HOIST
      ?auto_1325 - PLACE
      ?auto_1327 - PLACE
      ?auto_1328 - HOIST
      ?auto_1329 - SURFACE
      ?auto_1326 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1324 ?auto_1325 ) ( SURFACE-AT ?auto_1323 ?auto_1325 ) ( CLEAR ?auto_1323 ) ( IS-CRATE ?auto_1322 ) ( AVAILABLE ?auto_1324 ) ( not ( = ?auto_1327 ?auto_1325 ) ) ( HOIST-AT ?auto_1328 ?auto_1327 ) ( AVAILABLE ?auto_1328 ) ( SURFACE-AT ?auto_1322 ?auto_1327 ) ( ON ?auto_1322 ?auto_1329 ) ( CLEAR ?auto_1322 ) ( TRUCK-AT ?auto_1326 ?auto_1325 ) ( not ( = ?auto_1322 ?auto_1323 ) ) ( not ( = ?auto_1322 ?auto_1329 ) ) ( not ( = ?auto_1323 ?auto_1329 ) ) ( not ( = ?auto_1324 ?auto_1328 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1326 ?auto_1325 ?auto_1327 )
      ( !LIFT ?auto_1328 ?auto_1322 ?auto_1329 ?auto_1327 )
      ( !LOAD ?auto_1328 ?auto_1322 ?auto_1326 ?auto_1327 )
      ( !DRIVE ?auto_1326 ?auto_1327 ?auto_1325 )
      ( !UNLOAD ?auto_1324 ?auto_1322 ?auto_1326 ?auto_1325 )
      ( !DROP ?auto_1324 ?auto_1322 ?auto_1323 ?auto_1325 )
      ( MAKE-ON-VERIFY ?auto_1322 ?auto_1323 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1332 - SURFACE
      ?auto_1333 - SURFACE
    )
    :vars
    (
      ?auto_1334 - HOIST
      ?auto_1335 - PLACE
      ?auto_1337 - PLACE
      ?auto_1338 - HOIST
      ?auto_1339 - SURFACE
      ?auto_1336 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1334 ?auto_1335 ) ( SURFACE-AT ?auto_1333 ?auto_1335 ) ( CLEAR ?auto_1333 ) ( IS-CRATE ?auto_1332 ) ( AVAILABLE ?auto_1334 ) ( not ( = ?auto_1337 ?auto_1335 ) ) ( HOIST-AT ?auto_1338 ?auto_1337 ) ( AVAILABLE ?auto_1338 ) ( SURFACE-AT ?auto_1332 ?auto_1337 ) ( ON ?auto_1332 ?auto_1339 ) ( CLEAR ?auto_1332 ) ( TRUCK-AT ?auto_1336 ?auto_1335 ) ( not ( = ?auto_1332 ?auto_1333 ) ) ( not ( = ?auto_1332 ?auto_1339 ) ) ( not ( = ?auto_1333 ?auto_1339 ) ) ( not ( = ?auto_1334 ?auto_1338 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1336 ?auto_1335 ?auto_1337 )
      ( !LIFT ?auto_1338 ?auto_1332 ?auto_1339 ?auto_1337 )
      ( !LOAD ?auto_1338 ?auto_1332 ?auto_1336 ?auto_1337 )
      ( !DRIVE ?auto_1336 ?auto_1337 ?auto_1335 )
      ( !UNLOAD ?auto_1334 ?auto_1332 ?auto_1336 ?auto_1335 )
      ( !DROP ?auto_1334 ?auto_1332 ?auto_1333 ?auto_1335 )
      ( MAKE-ON-VERIFY ?auto_1332 ?auto_1333 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1342 - SURFACE
      ?auto_1343 - SURFACE
    )
    :vars
    (
      ?auto_1344 - HOIST
      ?auto_1345 - PLACE
      ?auto_1347 - PLACE
      ?auto_1348 - HOIST
      ?auto_1349 - SURFACE
      ?auto_1346 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1344 ?auto_1345 ) ( SURFACE-AT ?auto_1343 ?auto_1345 ) ( CLEAR ?auto_1343 ) ( IS-CRATE ?auto_1342 ) ( AVAILABLE ?auto_1344 ) ( not ( = ?auto_1347 ?auto_1345 ) ) ( HOIST-AT ?auto_1348 ?auto_1347 ) ( AVAILABLE ?auto_1348 ) ( SURFACE-AT ?auto_1342 ?auto_1347 ) ( ON ?auto_1342 ?auto_1349 ) ( CLEAR ?auto_1342 ) ( TRUCK-AT ?auto_1346 ?auto_1345 ) ( not ( = ?auto_1342 ?auto_1343 ) ) ( not ( = ?auto_1342 ?auto_1349 ) ) ( not ( = ?auto_1343 ?auto_1349 ) ) ( not ( = ?auto_1344 ?auto_1348 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1346 ?auto_1345 ?auto_1347 )
      ( !LIFT ?auto_1348 ?auto_1342 ?auto_1349 ?auto_1347 )
      ( !LOAD ?auto_1348 ?auto_1342 ?auto_1346 ?auto_1347 )
      ( !DRIVE ?auto_1346 ?auto_1347 ?auto_1345 )
      ( !UNLOAD ?auto_1344 ?auto_1342 ?auto_1346 ?auto_1345 )
      ( !DROP ?auto_1344 ?auto_1342 ?auto_1343 ?auto_1345 )
      ( MAKE-ON-VERIFY ?auto_1342 ?auto_1343 ) )
  )

)

