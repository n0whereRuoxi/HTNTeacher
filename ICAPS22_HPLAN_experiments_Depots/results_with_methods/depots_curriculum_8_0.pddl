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
      ?auto_1352 - SURFACE
      ?auto_1353 - SURFACE
    )
    :vars
    (
      ?auto_1354 - HOIST
      ?auto_1355 - PLACE
      ?auto_1357 - PLACE
      ?auto_1358 - HOIST
      ?auto_1359 - SURFACE
      ?auto_1356 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1354 ?auto_1355 ) ( SURFACE-AT ?auto_1353 ?auto_1355 ) ( CLEAR ?auto_1353 ) ( IS-CRATE ?auto_1352 ) ( AVAILABLE ?auto_1354 ) ( not ( = ?auto_1357 ?auto_1355 ) ) ( HOIST-AT ?auto_1358 ?auto_1357 ) ( AVAILABLE ?auto_1358 ) ( SURFACE-AT ?auto_1352 ?auto_1357 ) ( ON ?auto_1352 ?auto_1359 ) ( CLEAR ?auto_1352 ) ( TRUCK-AT ?auto_1356 ?auto_1355 ) ( not ( = ?auto_1352 ?auto_1353 ) ) ( not ( = ?auto_1352 ?auto_1359 ) ) ( not ( = ?auto_1353 ?auto_1359 ) ) ( not ( = ?auto_1354 ?auto_1358 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1356 ?auto_1355 ?auto_1357 )
      ( !LIFT ?auto_1358 ?auto_1352 ?auto_1359 ?auto_1357 )
      ( !LOAD ?auto_1358 ?auto_1352 ?auto_1356 ?auto_1357 )
      ( !DRIVE ?auto_1356 ?auto_1357 ?auto_1355 )
      ( !UNLOAD ?auto_1354 ?auto_1352 ?auto_1356 ?auto_1355 )
      ( !DROP ?auto_1354 ?auto_1352 ?auto_1353 ?auto_1355 )
      ( MAKE-ON-VERIFY ?auto_1352 ?auto_1353 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1362 - SURFACE
      ?auto_1363 - SURFACE
    )
    :vars
    (
      ?auto_1364 - HOIST
      ?auto_1365 - PLACE
      ?auto_1367 - PLACE
      ?auto_1368 - HOIST
      ?auto_1369 - SURFACE
      ?auto_1366 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1364 ?auto_1365 ) ( SURFACE-AT ?auto_1363 ?auto_1365 ) ( CLEAR ?auto_1363 ) ( IS-CRATE ?auto_1362 ) ( AVAILABLE ?auto_1364 ) ( not ( = ?auto_1367 ?auto_1365 ) ) ( HOIST-AT ?auto_1368 ?auto_1367 ) ( AVAILABLE ?auto_1368 ) ( SURFACE-AT ?auto_1362 ?auto_1367 ) ( ON ?auto_1362 ?auto_1369 ) ( CLEAR ?auto_1362 ) ( TRUCK-AT ?auto_1366 ?auto_1365 ) ( not ( = ?auto_1362 ?auto_1363 ) ) ( not ( = ?auto_1362 ?auto_1369 ) ) ( not ( = ?auto_1363 ?auto_1369 ) ) ( not ( = ?auto_1364 ?auto_1368 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1366 ?auto_1365 ?auto_1367 )
      ( !LIFT ?auto_1368 ?auto_1362 ?auto_1369 ?auto_1367 )
      ( !LOAD ?auto_1368 ?auto_1362 ?auto_1366 ?auto_1367 )
      ( !DRIVE ?auto_1366 ?auto_1367 ?auto_1365 )
      ( !UNLOAD ?auto_1364 ?auto_1362 ?auto_1366 ?auto_1365 )
      ( !DROP ?auto_1364 ?auto_1362 ?auto_1363 ?auto_1365 )
      ( MAKE-ON-VERIFY ?auto_1362 ?auto_1363 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1372 - SURFACE
      ?auto_1373 - SURFACE
    )
    :vars
    (
      ?auto_1374 - HOIST
      ?auto_1375 - PLACE
      ?auto_1377 - PLACE
      ?auto_1378 - HOIST
      ?auto_1379 - SURFACE
      ?auto_1376 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1374 ?auto_1375 ) ( SURFACE-AT ?auto_1373 ?auto_1375 ) ( CLEAR ?auto_1373 ) ( IS-CRATE ?auto_1372 ) ( AVAILABLE ?auto_1374 ) ( not ( = ?auto_1377 ?auto_1375 ) ) ( HOIST-AT ?auto_1378 ?auto_1377 ) ( AVAILABLE ?auto_1378 ) ( SURFACE-AT ?auto_1372 ?auto_1377 ) ( ON ?auto_1372 ?auto_1379 ) ( CLEAR ?auto_1372 ) ( TRUCK-AT ?auto_1376 ?auto_1375 ) ( not ( = ?auto_1372 ?auto_1373 ) ) ( not ( = ?auto_1372 ?auto_1379 ) ) ( not ( = ?auto_1373 ?auto_1379 ) ) ( not ( = ?auto_1374 ?auto_1378 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1376 ?auto_1375 ?auto_1377 )
      ( !LIFT ?auto_1378 ?auto_1372 ?auto_1379 ?auto_1377 )
      ( !LOAD ?auto_1378 ?auto_1372 ?auto_1376 ?auto_1377 )
      ( !DRIVE ?auto_1376 ?auto_1377 ?auto_1375 )
      ( !UNLOAD ?auto_1374 ?auto_1372 ?auto_1376 ?auto_1375 )
      ( !DROP ?auto_1374 ?auto_1372 ?auto_1373 ?auto_1375 )
      ( MAKE-ON-VERIFY ?auto_1372 ?auto_1373 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1382 - SURFACE
      ?auto_1383 - SURFACE
    )
    :vars
    (
      ?auto_1384 - HOIST
      ?auto_1385 - PLACE
      ?auto_1387 - PLACE
      ?auto_1388 - HOIST
      ?auto_1389 - SURFACE
      ?auto_1386 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1384 ?auto_1385 ) ( SURFACE-AT ?auto_1383 ?auto_1385 ) ( CLEAR ?auto_1383 ) ( IS-CRATE ?auto_1382 ) ( AVAILABLE ?auto_1384 ) ( not ( = ?auto_1387 ?auto_1385 ) ) ( HOIST-AT ?auto_1388 ?auto_1387 ) ( AVAILABLE ?auto_1388 ) ( SURFACE-AT ?auto_1382 ?auto_1387 ) ( ON ?auto_1382 ?auto_1389 ) ( CLEAR ?auto_1382 ) ( TRUCK-AT ?auto_1386 ?auto_1385 ) ( not ( = ?auto_1382 ?auto_1383 ) ) ( not ( = ?auto_1382 ?auto_1389 ) ) ( not ( = ?auto_1383 ?auto_1389 ) ) ( not ( = ?auto_1384 ?auto_1388 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1386 ?auto_1385 ?auto_1387 )
      ( !LIFT ?auto_1388 ?auto_1382 ?auto_1389 ?auto_1387 )
      ( !LOAD ?auto_1388 ?auto_1382 ?auto_1386 ?auto_1387 )
      ( !DRIVE ?auto_1386 ?auto_1387 ?auto_1385 )
      ( !UNLOAD ?auto_1384 ?auto_1382 ?auto_1386 ?auto_1385 )
      ( !DROP ?auto_1384 ?auto_1382 ?auto_1383 ?auto_1385 )
      ( MAKE-ON-VERIFY ?auto_1382 ?auto_1383 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1392 - SURFACE
      ?auto_1393 - SURFACE
    )
    :vars
    (
      ?auto_1394 - HOIST
      ?auto_1395 - PLACE
      ?auto_1397 - PLACE
      ?auto_1398 - HOIST
      ?auto_1399 - SURFACE
      ?auto_1396 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1394 ?auto_1395 ) ( SURFACE-AT ?auto_1393 ?auto_1395 ) ( CLEAR ?auto_1393 ) ( IS-CRATE ?auto_1392 ) ( AVAILABLE ?auto_1394 ) ( not ( = ?auto_1397 ?auto_1395 ) ) ( HOIST-AT ?auto_1398 ?auto_1397 ) ( AVAILABLE ?auto_1398 ) ( SURFACE-AT ?auto_1392 ?auto_1397 ) ( ON ?auto_1392 ?auto_1399 ) ( CLEAR ?auto_1392 ) ( TRUCK-AT ?auto_1396 ?auto_1395 ) ( not ( = ?auto_1392 ?auto_1393 ) ) ( not ( = ?auto_1392 ?auto_1399 ) ) ( not ( = ?auto_1393 ?auto_1399 ) ) ( not ( = ?auto_1394 ?auto_1398 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1396 ?auto_1395 ?auto_1397 )
      ( !LIFT ?auto_1398 ?auto_1392 ?auto_1399 ?auto_1397 )
      ( !LOAD ?auto_1398 ?auto_1392 ?auto_1396 ?auto_1397 )
      ( !DRIVE ?auto_1396 ?auto_1397 ?auto_1395 )
      ( !UNLOAD ?auto_1394 ?auto_1392 ?auto_1396 ?auto_1395 )
      ( !DROP ?auto_1394 ?auto_1392 ?auto_1393 ?auto_1395 )
      ( MAKE-ON-VERIFY ?auto_1392 ?auto_1393 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1402 - SURFACE
      ?auto_1403 - SURFACE
    )
    :vars
    (
      ?auto_1404 - HOIST
      ?auto_1405 - PLACE
      ?auto_1407 - PLACE
      ?auto_1408 - HOIST
      ?auto_1409 - SURFACE
      ?auto_1406 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1404 ?auto_1405 ) ( SURFACE-AT ?auto_1403 ?auto_1405 ) ( CLEAR ?auto_1403 ) ( IS-CRATE ?auto_1402 ) ( AVAILABLE ?auto_1404 ) ( not ( = ?auto_1407 ?auto_1405 ) ) ( HOIST-AT ?auto_1408 ?auto_1407 ) ( AVAILABLE ?auto_1408 ) ( SURFACE-AT ?auto_1402 ?auto_1407 ) ( ON ?auto_1402 ?auto_1409 ) ( CLEAR ?auto_1402 ) ( TRUCK-AT ?auto_1406 ?auto_1405 ) ( not ( = ?auto_1402 ?auto_1403 ) ) ( not ( = ?auto_1402 ?auto_1409 ) ) ( not ( = ?auto_1403 ?auto_1409 ) ) ( not ( = ?auto_1404 ?auto_1408 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1406 ?auto_1405 ?auto_1407 )
      ( !LIFT ?auto_1408 ?auto_1402 ?auto_1409 ?auto_1407 )
      ( !LOAD ?auto_1408 ?auto_1402 ?auto_1406 ?auto_1407 )
      ( !DRIVE ?auto_1406 ?auto_1407 ?auto_1405 )
      ( !UNLOAD ?auto_1404 ?auto_1402 ?auto_1406 ?auto_1405 )
      ( !DROP ?auto_1404 ?auto_1402 ?auto_1403 ?auto_1405 )
      ( MAKE-ON-VERIFY ?auto_1402 ?auto_1403 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1412 - SURFACE
      ?auto_1413 - SURFACE
    )
    :vars
    (
      ?auto_1414 - HOIST
      ?auto_1415 - PLACE
      ?auto_1417 - PLACE
      ?auto_1418 - HOIST
      ?auto_1419 - SURFACE
      ?auto_1416 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1414 ?auto_1415 ) ( SURFACE-AT ?auto_1413 ?auto_1415 ) ( CLEAR ?auto_1413 ) ( IS-CRATE ?auto_1412 ) ( AVAILABLE ?auto_1414 ) ( not ( = ?auto_1417 ?auto_1415 ) ) ( HOIST-AT ?auto_1418 ?auto_1417 ) ( AVAILABLE ?auto_1418 ) ( SURFACE-AT ?auto_1412 ?auto_1417 ) ( ON ?auto_1412 ?auto_1419 ) ( CLEAR ?auto_1412 ) ( TRUCK-AT ?auto_1416 ?auto_1415 ) ( not ( = ?auto_1412 ?auto_1413 ) ) ( not ( = ?auto_1412 ?auto_1419 ) ) ( not ( = ?auto_1413 ?auto_1419 ) ) ( not ( = ?auto_1414 ?auto_1418 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1416 ?auto_1415 ?auto_1417 )
      ( !LIFT ?auto_1418 ?auto_1412 ?auto_1419 ?auto_1417 )
      ( !LOAD ?auto_1418 ?auto_1412 ?auto_1416 ?auto_1417 )
      ( !DRIVE ?auto_1416 ?auto_1417 ?auto_1415 )
      ( !UNLOAD ?auto_1414 ?auto_1412 ?auto_1416 ?auto_1415 )
      ( !DROP ?auto_1414 ?auto_1412 ?auto_1413 ?auto_1415 )
      ( MAKE-ON-VERIFY ?auto_1412 ?auto_1413 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1422 - SURFACE
      ?auto_1423 - SURFACE
    )
    :vars
    (
      ?auto_1424 - HOIST
      ?auto_1425 - PLACE
      ?auto_1427 - PLACE
      ?auto_1428 - HOIST
      ?auto_1429 - SURFACE
      ?auto_1426 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1424 ?auto_1425 ) ( SURFACE-AT ?auto_1423 ?auto_1425 ) ( CLEAR ?auto_1423 ) ( IS-CRATE ?auto_1422 ) ( AVAILABLE ?auto_1424 ) ( not ( = ?auto_1427 ?auto_1425 ) ) ( HOIST-AT ?auto_1428 ?auto_1427 ) ( AVAILABLE ?auto_1428 ) ( SURFACE-AT ?auto_1422 ?auto_1427 ) ( ON ?auto_1422 ?auto_1429 ) ( CLEAR ?auto_1422 ) ( TRUCK-AT ?auto_1426 ?auto_1425 ) ( not ( = ?auto_1422 ?auto_1423 ) ) ( not ( = ?auto_1422 ?auto_1429 ) ) ( not ( = ?auto_1423 ?auto_1429 ) ) ( not ( = ?auto_1424 ?auto_1428 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1426 ?auto_1425 ?auto_1427 )
      ( !LIFT ?auto_1428 ?auto_1422 ?auto_1429 ?auto_1427 )
      ( !LOAD ?auto_1428 ?auto_1422 ?auto_1426 ?auto_1427 )
      ( !DRIVE ?auto_1426 ?auto_1427 ?auto_1425 )
      ( !UNLOAD ?auto_1424 ?auto_1422 ?auto_1426 ?auto_1425 )
      ( !DROP ?auto_1424 ?auto_1422 ?auto_1423 ?auto_1425 )
      ( MAKE-ON-VERIFY ?auto_1422 ?auto_1423 ) )
  )

)

