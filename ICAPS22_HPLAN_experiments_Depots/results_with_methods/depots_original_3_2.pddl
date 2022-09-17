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
      ?auto_1343 - SURFACE
      ?auto_1344 - SURFACE
    )
    :vars
    (
      ?auto_1345 - HOIST
      ?auto_1346 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1345 ?auto_1346 ) ( SURFACE-AT ?auto_1344 ?auto_1346 ) ( CLEAR ?auto_1344 ) ( LIFTING ?auto_1345 ?auto_1343 ) ( IS-CRATE ?auto_1343 ) ( not ( = ?auto_1343 ?auto_1344 ) ) )
    :subtasks
    ( ( !DROP ?auto_1345 ?auto_1343 ?auto_1344 ?auto_1346 )
      ( MAKE-ON-VERIFY ?auto_1343 ?auto_1344 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1347 - SURFACE
      ?auto_1348 - SURFACE
    )
    :vars
    (
      ?auto_1349 - HOIST
      ?auto_1350 - PLACE
      ?auto_1351 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1349 ?auto_1350 ) ( SURFACE-AT ?auto_1348 ?auto_1350 ) ( CLEAR ?auto_1348 ) ( IS-CRATE ?auto_1347 ) ( not ( = ?auto_1347 ?auto_1348 ) ) ( TRUCK-AT ?auto_1351 ?auto_1350 ) ( AVAILABLE ?auto_1349 ) ( IN ?auto_1347 ?auto_1351 ) )
    :subtasks
    ( ( !UNLOAD ?auto_1349 ?auto_1347 ?auto_1351 ?auto_1350 )
      ( MAKE-ON ?auto_1347 ?auto_1348 )
      ( MAKE-ON-VERIFY ?auto_1347 ?auto_1348 ) )
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
      ?auto_1356 - PLACE
      ?auto_1355 - TRUCK
      ?auto_1357 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1354 ?auto_1356 ) ( SURFACE-AT ?auto_1353 ?auto_1356 ) ( CLEAR ?auto_1353 ) ( IS-CRATE ?auto_1352 ) ( not ( = ?auto_1352 ?auto_1353 ) ) ( AVAILABLE ?auto_1354 ) ( IN ?auto_1352 ?auto_1355 ) ( TRUCK-AT ?auto_1355 ?auto_1357 ) ( not ( = ?auto_1357 ?auto_1356 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1355 ?auto_1357 ?auto_1356 )
      ( MAKE-ON ?auto_1352 ?auto_1353 )
      ( MAKE-ON-VERIFY ?auto_1352 ?auto_1353 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1358 - SURFACE
      ?auto_1359 - SURFACE
    )
    :vars
    (
      ?auto_1360 - HOIST
      ?auto_1362 - PLACE
      ?auto_1363 - TRUCK
      ?auto_1361 - PLACE
      ?auto_1364 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1360 ?auto_1362 ) ( SURFACE-AT ?auto_1359 ?auto_1362 ) ( CLEAR ?auto_1359 ) ( IS-CRATE ?auto_1358 ) ( not ( = ?auto_1358 ?auto_1359 ) ) ( AVAILABLE ?auto_1360 ) ( TRUCK-AT ?auto_1363 ?auto_1361 ) ( not ( = ?auto_1361 ?auto_1362 ) ) ( HOIST-AT ?auto_1364 ?auto_1361 ) ( LIFTING ?auto_1364 ?auto_1358 ) ( not ( = ?auto_1360 ?auto_1364 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1364 ?auto_1358 ?auto_1363 ?auto_1361 )
      ( MAKE-ON ?auto_1358 ?auto_1359 )
      ( MAKE-ON-VERIFY ?auto_1358 ?auto_1359 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1365 - SURFACE
      ?auto_1366 - SURFACE
    )
    :vars
    (
      ?auto_1367 - HOIST
      ?auto_1368 - PLACE
      ?auto_1371 - TRUCK
      ?auto_1369 - PLACE
      ?auto_1370 - HOIST
      ?auto_1372 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1367 ?auto_1368 ) ( SURFACE-AT ?auto_1366 ?auto_1368 ) ( CLEAR ?auto_1366 ) ( IS-CRATE ?auto_1365 ) ( not ( = ?auto_1365 ?auto_1366 ) ) ( AVAILABLE ?auto_1367 ) ( TRUCK-AT ?auto_1371 ?auto_1369 ) ( not ( = ?auto_1369 ?auto_1368 ) ) ( HOIST-AT ?auto_1370 ?auto_1369 ) ( not ( = ?auto_1367 ?auto_1370 ) ) ( AVAILABLE ?auto_1370 ) ( SURFACE-AT ?auto_1365 ?auto_1369 ) ( ON ?auto_1365 ?auto_1372 ) ( CLEAR ?auto_1365 ) ( not ( = ?auto_1365 ?auto_1372 ) ) ( not ( = ?auto_1366 ?auto_1372 ) ) )
    :subtasks
    ( ( !LIFT ?auto_1370 ?auto_1365 ?auto_1372 ?auto_1369 )
      ( MAKE-ON ?auto_1365 ?auto_1366 )
      ( MAKE-ON-VERIFY ?auto_1365 ?auto_1366 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1373 - SURFACE
      ?auto_1374 - SURFACE
    )
    :vars
    (
      ?auto_1377 - HOIST
      ?auto_1379 - PLACE
      ?auto_1378 - PLACE
      ?auto_1375 - HOIST
      ?auto_1376 - SURFACE
      ?auto_1380 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1377 ?auto_1379 ) ( SURFACE-AT ?auto_1374 ?auto_1379 ) ( CLEAR ?auto_1374 ) ( IS-CRATE ?auto_1373 ) ( not ( = ?auto_1373 ?auto_1374 ) ) ( AVAILABLE ?auto_1377 ) ( not ( = ?auto_1378 ?auto_1379 ) ) ( HOIST-AT ?auto_1375 ?auto_1378 ) ( not ( = ?auto_1377 ?auto_1375 ) ) ( AVAILABLE ?auto_1375 ) ( SURFACE-AT ?auto_1373 ?auto_1378 ) ( ON ?auto_1373 ?auto_1376 ) ( CLEAR ?auto_1373 ) ( not ( = ?auto_1373 ?auto_1376 ) ) ( not ( = ?auto_1374 ?auto_1376 ) ) ( TRUCK-AT ?auto_1380 ?auto_1379 ) )
    :subtasks
    ( ( !DRIVE ?auto_1380 ?auto_1379 ?auto_1378 )
      ( MAKE-ON ?auto_1373 ?auto_1374 )
      ( MAKE-ON-VERIFY ?auto_1373 ?auto_1374 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1383 - SURFACE
      ?auto_1384 - SURFACE
    )
    :vars
    (
      ?auto_1385 - HOIST
      ?auto_1386 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1385 ?auto_1386 ) ( SURFACE-AT ?auto_1384 ?auto_1386 ) ( CLEAR ?auto_1384 ) ( LIFTING ?auto_1385 ?auto_1383 ) ( IS-CRATE ?auto_1383 ) ( not ( = ?auto_1383 ?auto_1384 ) ) )
    :subtasks
    ( ( !DROP ?auto_1385 ?auto_1383 ?auto_1384 ?auto_1386 )
      ( MAKE-ON-VERIFY ?auto_1383 ?auto_1384 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1387 - SURFACE
      ?auto_1388 - SURFACE
    )
    :vars
    (
      ?auto_1390 - HOIST
      ?auto_1389 - PLACE
      ?auto_1391 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1390 ?auto_1389 ) ( SURFACE-AT ?auto_1388 ?auto_1389 ) ( CLEAR ?auto_1388 ) ( IS-CRATE ?auto_1387 ) ( not ( = ?auto_1387 ?auto_1388 ) ) ( TRUCK-AT ?auto_1391 ?auto_1389 ) ( AVAILABLE ?auto_1390 ) ( IN ?auto_1387 ?auto_1391 ) )
    :subtasks
    ( ( !UNLOAD ?auto_1390 ?auto_1387 ?auto_1391 ?auto_1389 )
      ( MAKE-ON ?auto_1387 ?auto_1388 )
      ( MAKE-ON-VERIFY ?auto_1387 ?auto_1388 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1392 - SURFACE
      ?auto_1393 - SURFACE
    )
    :vars
    (
      ?auto_1395 - HOIST
      ?auto_1394 - PLACE
      ?auto_1396 - TRUCK
      ?auto_1397 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1395 ?auto_1394 ) ( SURFACE-AT ?auto_1393 ?auto_1394 ) ( CLEAR ?auto_1393 ) ( IS-CRATE ?auto_1392 ) ( not ( = ?auto_1392 ?auto_1393 ) ) ( AVAILABLE ?auto_1395 ) ( IN ?auto_1392 ?auto_1396 ) ( TRUCK-AT ?auto_1396 ?auto_1397 ) ( not ( = ?auto_1397 ?auto_1394 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1396 ?auto_1397 ?auto_1394 )
      ( MAKE-ON ?auto_1392 ?auto_1393 )
      ( MAKE-ON-VERIFY ?auto_1392 ?auto_1393 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1398 - SURFACE
      ?auto_1399 - SURFACE
    )
    :vars
    (
      ?auto_1403 - HOIST
      ?auto_1400 - PLACE
      ?auto_1402 - TRUCK
      ?auto_1401 - PLACE
      ?auto_1404 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1403 ?auto_1400 ) ( SURFACE-AT ?auto_1399 ?auto_1400 ) ( CLEAR ?auto_1399 ) ( IS-CRATE ?auto_1398 ) ( not ( = ?auto_1398 ?auto_1399 ) ) ( AVAILABLE ?auto_1403 ) ( TRUCK-AT ?auto_1402 ?auto_1401 ) ( not ( = ?auto_1401 ?auto_1400 ) ) ( HOIST-AT ?auto_1404 ?auto_1401 ) ( LIFTING ?auto_1404 ?auto_1398 ) ( not ( = ?auto_1403 ?auto_1404 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1404 ?auto_1398 ?auto_1402 ?auto_1401 )
      ( MAKE-ON ?auto_1398 ?auto_1399 )
      ( MAKE-ON-VERIFY ?auto_1398 ?auto_1399 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1405 - SURFACE
      ?auto_1406 - SURFACE
    )
    :vars
    (
      ?auto_1411 - HOIST
      ?auto_1407 - PLACE
      ?auto_1408 - TRUCK
      ?auto_1410 - PLACE
      ?auto_1409 - HOIST
      ?auto_1412 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1411 ?auto_1407 ) ( SURFACE-AT ?auto_1406 ?auto_1407 ) ( CLEAR ?auto_1406 ) ( IS-CRATE ?auto_1405 ) ( not ( = ?auto_1405 ?auto_1406 ) ) ( AVAILABLE ?auto_1411 ) ( TRUCK-AT ?auto_1408 ?auto_1410 ) ( not ( = ?auto_1410 ?auto_1407 ) ) ( HOIST-AT ?auto_1409 ?auto_1410 ) ( not ( = ?auto_1411 ?auto_1409 ) ) ( AVAILABLE ?auto_1409 ) ( SURFACE-AT ?auto_1405 ?auto_1410 ) ( ON ?auto_1405 ?auto_1412 ) ( CLEAR ?auto_1405 ) ( not ( = ?auto_1405 ?auto_1412 ) ) ( not ( = ?auto_1406 ?auto_1412 ) ) )
    :subtasks
    ( ( !LIFT ?auto_1409 ?auto_1405 ?auto_1412 ?auto_1410 )
      ( MAKE-ON ?auto_1405 ?auto_1406 )
      ( MAKE-ON-VERIFY ?auto_1405 ?auto_1406 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1413 - SURFACE
      ?auto_1414 - SURFACE
    )
    :vars
    (
      ?auto_1417 - HOIST
      ?auto_1420 - PLACE
      ?auto_1419 - PLACE
      ?auto_1415 - HOIST
      ?auto_1418 - SURFACE
      ?auto_1416 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1417 ?auto_1420 ) ( SURFACE-AT ?auto_1414 ?auto_1420 ) ( CLEAR ?auto_1414 ) ( IS-CRATE ?auto_1413 ) ( not ( = ?auto_1413 ?auto_1414 ) ) ( AVAILABLE ?auto_1417 ) ( not ( = ?auto_1419 ?auto_1420 ) ) ( HOIST-AT ?auto_1415 ?auto_1419 ) ( not ( = ?auto_1417 ?auto_1415 ) ) ( AVAILABLE ?auto_1415 ) ( SURFACE-AT ?auto_1413 ?auto_1419 ) ( ON ?auto_1413 ?auto_1418 ) ( CLEAR ?auto_1413 ) ( not ( = ?auto_1413 ?auto_1418 ) ) ( not ( = ?auto_1414 ?auto_1418 ) ) ( TRUCK-AT ?auto_1416 ?auto_1420 ) )
    :subtasks
    ( ( !DRIVE ?auto_1416 ?auto_1420 ?auto_1419 )
      ( MAKE-ON ?auto_1413 ?auto_1414 )
      ( MAKE-ON-VERIFY ?auto_1413 ?auto_1414 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1421 - SURFACE
      ?auto_1422 - SURFACE
    )
    :vars
    (
      ?auto_1424 - HOIST
      ?auto_1426 - PLACE
      ?auto_1425 - PLACE
      ?auto_1428 - HOIST
      ?auto_1423 - SURFACE
      ?auto_1427 - TRUCK
      ?auto_1429 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1424 ?auto_1426 ) ( IS-CRATE ?auto_1421 ) ( not ( = ?auto_1421 ?auto_1422 ) ) ( not ( = ?auto_1425 ?auto_1426 ) ) ( HOIST-AT ?auto_1428 ?auto_1425 ) ( not ( = ?auto_1424 ?auto_1428 ) ) ( AVAILABLE ?auto_1428 ) ( SURFACE-AT ?auto_1421 ?auto_1425 ) ( ON ?auto_1421 ?auto_1423 ) ( CLEAR ?auto_1421 ) ( not ( = ?auto_1421 ?auto_1423 ) ) ( not ( = ?auto_1422 ?auto_1423 ) ) ( TRUCK-AT ?auto_1427 ?auto_1426 ) ( SURFACE-AT ?auto_1429 ?auto_1426 ) ( CLEAR ?auto_1429 ) ( LIFTING ?auto_1424 ?auto_1422 ) ( IS-CRATE ?auto_1422 ) ( not ( = ?auto_1421 ?auto_1429 ) ) ( not ( = ?auto_1422 ?auto_1429 ) ) ( not ( = ?auto_1423 ?auto_1429 ) ) )
    :subtasks
    ( ( !DROP ?auto_1424 ?auto_1422 ?auto_1429 ?auto_1426 )
      ( MAKE-ON ?auto_1421 ?auto_1422 )
      ( MAKE-ON-VERIFY ?auto_1421 ?auto_1422 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1430 - SURFACE
      ?auto_1431 - SURFACE
    )
    :vars
    (
      ?auto_1433 - HOIST
      ?auto_1435 - PLACE
      ?auto_1434 - PLACE
      ?auto_1432 - HOIST
      ?auto_1438 - SURFACE
      ?auto_1437 - TRUCK
      ?auto_1436 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1433 ?auto_1435 ) ( IS-CRATE ?auto_1430 ) ( not ( = ?auto_1430 ?auto_1431 ) ) ( not ( = ?auto_1434 ?auto_1435 ) ) ( HOIST-AT ?auto_1432 ?auto_1434 ) ( not ( = ?auto_1433 ?auto_1432 ) ) ( AVAILABLE ?auto_1432 ) ( SURFACE-AT ?auto_1430 ?auto_1434 ) ( ON ?auto_1430 ?auto_1438 ) ( CLEAR ?auto_1430 ) ( not ( = ?auto_1430 ?auto_1438 ) ) ( not ( = ?auto_1431 ?auto_1438 ) ) ( TRUCK-AT ?auto_1437 ?auto_1435 ) ( SURFACE-AT ?auto_1436 ?auto_1435 ) ( CLEAR ?auto_1436 ) ( IS-CRATE ?auto_1431 ) ( not ( = ?auto_1430 ?auto_1436 ) ) ( not ( = ?auto_1431 ?auto_1436 ) ) ( not ( = ?auto_1438 ?auto_1436 ) ) ( AVAILABLE ?auto_1433 ) ( IN ?auto_1431 ?auto_1437 ) )
    :subtasks
    ( ( !UNLOAD ?auto_1433 ?auto_1431 ?auto_1437 ?auto_1435 )
      ( MAKE-ON ?auto_1430 ?auto_1431 )
      ( MAKE-ON-VERIFY ?auto_1430 ?auto_1431 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1439 - SURFACE
      ?auto_1440 - SURFACE
    )
    :vars
    (
      ?auto_1447 - HOIST
      ?auto_1445 - PLACE
      ?auto_1442 - PLACE
      ?auto_1441 - HOIST
      ?auto_1443 - SURFACE
      ?auto_1444 - SURFACE
      ?auto_1446 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1447 ?auto_1445 ) ( IS-CRATE ?auto_1439 ) ( not ( = ?auto_1439 ?auto_1440 ) ) ( not ( = ?auto_1442 ?auto_1445 ) ) ( HOIST-AT ?auto_1441 ?auto_1442 ) ( not ( = ?auto_1447 ?auto_1441 ) ) ( AVAILABLE ?auto_1441 ) ( SURFACE-AT ?auto_1439 ?auto_1442 ) ( ON ?auto_1439 ?auto_1443 ) ( CLEAR ?auto_1439 ) ( not ( = ?auto_1439 ?auto_1443 ) ) ( not ( = ?auto_1440 ?auto_1443 ) ) ( SURFACE-AT ?auto_1444 ?auto_1445 ) ( CLEAR ?auto_1444 ) ( IS-CRATE ?auto_1440 ) ( not ( = ?auto_1439 ?auto_1444 ) ) ( not ( = ?auto_1440 ?auto_1444 ) ) ( not ( = ?auto_1443 ?auto_1444 ) ) ( AVAILABLE ?auto_1447 ) ( IN ?auto_1440 ?auto_1446 ) ( TRUCK-AT ?auto_1446 ?auto_1442 ) )
    :subtasks
    ( ( !DRIVE ?auto_1446 ?auto_1442 ?auto_1445 )
      ( MAKE-ON ?auto_1439 ?auto_1440 )
      ( MAKE-ON-VERIFY ?auto_1439 ?auto_1440 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1448 - SURFACE
      ?auto_1449 - SURFACE
    )
    :vars
    (
      ?auto_1456 - HOIST
      ?auto_1453 - PLACE
      ?auto_1454 - PLACE
      ?auto_1455 - HOIST
      ?auto_1450 - SURFACE
      ?auto_1452 - SURFACE
      ?auto_1451 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1456 ?auto_1453 ) ( IS-CRATE ?auto_1448 ) ( not ( = ?auto_1448 ?auto_1449 ) ) ( not ( = ?auto_1454 ?auto_1453 ) ) ( HOIST-AT ?auto_1455 ?auto_1454 ) ( not ( = ?auto_1456 ?auto_1455 ) ) ( SURFACE-AT ?auto_1448 ?auto_1454 ) ( ON ?auto_1448 ?auto_1450 ) ( CLEAR ?auto_1448 ) ( not ( = ?auto_1448 ?auto_1450 ) ) ( not ( = ?auto_1449 ?auto_1450 ) ) ( SURFACE-AT ?auto_1452 ?auto_1453 ) ( CLEAR ?auto_1452 ) ( IS-CRATE ?auto_1449 ) ( not ( = ?auto_1448 ?auto_1452 ) ) ( not ( = ?auto_1449 ?auto_1452 ) ) ( not ( = ?auto_1450 ?auto_1452 ) ) ( AVAILABLE ?auto_1456 ) ( TRUCK-AT ?auto_1451 ?auto_1454 ) ( LIFTING ?auto_1455 ?auto_1449 ) )
    :subtasks
    ( ( !LOAD ?auto_1455 ?auto_1449 ?auto_1451 ?auto_1454 )
      ( MAKE-ON ?auto_1448 ?auto_1449 )
      ( MAKE-ON-VERIFY ?auto_1448 ?auto_1449 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1457 - SURFACE
      ?auto_1458 - SURFACE
    )
    :vars
    (
      ?auto_1460 - HOIST
      ?auto_1459 - PLACE
      ?auto_1461 - PLACE
      ?auto_1462 - HOIST
      ?auto_1464 - SURFACE
      ?auto_1463 - SURFACE
      ?auto_1465 - TRUCK
      ?auto_1466 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1460 ?auto_1459 ) ( IS-CRATE ?auto_1457 ) ( not ( = ?auto_1457 ?auto_1458 ) ) ( not ( = ?auto_1461 ?auto_1459 ) ) ( HOIST-AT ?auto_1462 ?auto_1461 ) ( not ( = ?auto_1460 ?auto_1462 ) ) ( SURFACE-AT ?auto_1457 ?auto_1461 ) ( ON ?auto_1457 ?auto_1464 ) ( CLEAR ?auto_1457 ) ( not ( = ?auto_1457 ?auto_1464 ) ) ( not ( = ?auto_1458 ?auto_1464 ) ) ( SURFACE-AT ?auto_1463 ?auto_1459 ) ( CLEAR ?auto_1463 ) ( IS-CRATE ?auto_1458 ) ( not ( = ?auto_1457 ?auto_1463 ) ) ( not ( = ?auto_1458 ?auto_1463 ) ) ( not ( = ?auto_1464 ?auto_1463 ) ) ( AVAILABLE ?auto_1460 ) ( TRUCK-AT ?auto_1465 ?auto_1461 ) ( AVAILABLE ?auto_1462 ) ( SURFACE-AT ?auto_1458 ?auto_1461 ) ( ON ?auto_1458 ?auto_1466 ) ( CLEAR ?auto_1458 ) ( not ( = ?auto_1457 ?auto_1466 ) ) ( not ( = ?auto_1458 ?auto_1466 ) ) ( not ( = ?auto_1464 ?auto_1466 ) ) ( not ( = ?auto_1463 ?auto_1466 ) ) )
    :subtasks
    ( ( !LIFT ?auto_1462 ?auto_1458 ?auto_1466 ?auto_1461 )
      ( MAKE-ON ?auto_1457 ?auto_1458 )
      ( MAKE-ON-VERIFY ?auto_1457 ?auto_1458 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1467 - SURFACE
      ?auto_1468 - SURFACE
    )
    :vars
    (
      ?auto_1476 - HOIST
      ?auto_1471 - PLACE
      ?auto_1473 - PLACE
      ?auto_1470 - HOIST
      ?auto_1474 - SURFACE
      ?auto_1475 - SURFACE
      ?auto_1472 - SURFACE
      ?auto_1469 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1476 ?auto_1471 ) ( IS-CRATE ?auto_1467 ) ( not ( = ?auto_1467 ?auto_1468 ) ) ( not ( = ?auto_1473 ?auto_1471 ) ) ( HOIST-AT ?auto_1470 ?auto_1473 ) ( not ( = ?auto_1476 ?auto_1470 ) ) ( SURFACE-AT ?auto_1467 ?auto_1473 ) ( ON ?auto_1467 ?auto_1474 ) ( CLEAR ?auto_1467 ) ( not ( = ?auto_1467 ?auto_1474 ) ) ( not ( = ?auto_1468 ?auto_1474 ) ) ( SURFACE-AT ?auto_1475 ?auto_1471 ) ( CLEAR ?auto_1475 ) ( IS-CRATE ?auto_1468 ) ( not ( = ?auto_1467 ?auto_1475 ) ) ( not ( = ?auto_1468 ?auto_1475 ) ) ( not ( = ?auto_1474 ?auto_1475 ) ) ( AVAILABLE ?auto_1476 ) ( AVAILABLE ?auto_1470 ) ( SURFACE-AT ?auto_1468 ?auto_1473 ) ( ON ?auto_1468 ?auto_1472 ) ( CLEAR ?auto_1468 ) ( not ( = ?auto_1467 ?auto_1472 ) ) ( not ( = ?auto_1468 ?auto_1472 ) ) ( not ( = ?auto_1474 ?auto_1472 ) ) ( not ( = ?auto_1475 ?auto_1472 ) ) ( TRUCK-AT ?auto_1469 ?auto_1471 ) )
    :subtasks
    ( ( !DRIVE ?auto_1469 ?auto_1471 ?auto_1473 )
      ( MAKE-ON ?auto_1467 ?auto_1468 )
      ( MAKE-ON-VERIFY ?auto_1467 ?auto_1468 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1479 - SURFACE
      ?auto_1480 - SURFACE
    )
    :vars
    (
      ?auto_1481 - HOIST
      ?auto_1482 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1481 ?auto_1482 ) ( SURFACE-AT ?auto_1480 ?auto_1482 ) ( CLEAR ?auto_1480 ) ( LIFTING ?auto_1481 ?auto_1479 ) ( IS-CRATE ?auto_1479 ) ( not ( = ?auto_1479 ?auto_1480 ) ) )
    :subtasks
    ( ( !DROP ?auto_1481 ?auto_1479 ?auto_1480 ?auto_1482 )
      ( MAKE-ON-VERIFY ?auto_1479 ?auto_1480 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1483 - SURFACE
      ?auto_1484 - SURFACE
    )
    :vars
    (
      ?auto_1486 - HOIST
      ?auto_1485 - PLACE
      ?auto_1487 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1486 ?auto_1485 ) ( SURFACE-AT ?auto_1484 ?auto_1485 ) ( CLEAR ?auto_1484 ) ( IS-CRATE ?auto_1483 ) ( not ( = ?auto_1483 ?auto_1484 ) ) ( TRUCK-AT ?auto_1487 ?auto_1485 ) ( AVAILABLE ?auto_1486 ) ( IN ?auto_1483 ?auto_1487 ) )
    :subtasks
    ( ( !UNLOAD ?auto_1486 ?auto_1483 ?auto_1487 ?auto_1485 )
      ( MAKE-ON ?auto_1483 ?auto_1484 )
      ( MAKE-ON-VERIFY ?auto_1483 ?auto_1484 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1488 - SURFACE
      ?auto_1489 - SURFACE
    )
    :vars
    (
      ?auto_1490 - HOIST
      ?auto_1492 - PLACE
      ?auto_1491 - TRUCK
      ?auto_1493 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1490 ?auto_1492 ) ( SURFACE-AT ?auto_1489 ?auto_1492 ) ( CLEAR ?auto_1489 ) ( IS-CRATE ?auto_1488 ) ( not ( = ?auto_1488 ?auto_1489 ) ) ( AVAILABLE ?auto_1490 ) ( IN ?auto_1488 ?auto_1491 ) ( TRUCK-AT ?auto_1491 ?auto_1493 ) ( not ( = ?auto_1493 ?auto_1492 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1491 ?auto_1493 ?auto_1492 )
      ( MAKE-ON ?auto_1488 ?auto_1489 )
      ( MAKE-ON-VERIFY ?auto_1488 ?auto_1489 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1494 - SURFACE
      ?auto_1495 - SURFACE
    )
    :vars
    (
      ?auto_1499 - HOIST
      ?auto_1496 - PLACE
      ?auto_1498 - TRUCK
      ?auto_1497 - PLACE
      ?auto_1500 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1499 ?auto_1496 ) ( SURFACE-AT ?auto_1495 ?auto_1496 ) ( CLEAR ?auto_1495 ) ( IS-CRATE ?auto_1494 ) ( not ( = ?auto_1494 ?auto_1495 ) ) ( AVAILABLE ?auto_1499 ) ( TRUCK-AT ?auto_1498 ?auto_1497 ) ( not ( = ?auto_1497 ?auto_1496 ) ) ( HOIST-AT ?auto_1500 ?auto_1497 ) ( LIFTING ?auto_1500 ?auto_1494 ) ( not ( = ?auto_1499 ?auto_1500 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1500 ?auto_1494 ?auto_1498 ?auto_1497 )
      ( MAKE-ON ?auto_1494 ?auto_1495 )
      ( MAKE-ON-VERIFY ?auto_1494 ?auto_1495 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1501 - SURFACE
      ?auto_1502 - SURFACE
    )
    :vars
    (
      ?auto_1505 - HOIST
      ?auto_1503 - PLACE
      ?auto_1506 - TRUCK
      ?auto_1507 - PLACE
      ?auto_1504 - HOIST
      ?auto_1508 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1505 ?auto_1503 ) ( SURFACE-AT ?auto_1502 ?auto_1503 ) ( CLEAR ?auto_1502 ) ( IS-CRATE ?auto_1501 ) ( not ( = ?auto_1501 ?auto_1502 ) ) ( AVAILABLE ?auto_1505 ) ( TRUCK-AT ?auto_1506 ?auto_1507 ) ( not ( = ?auto_1507 ?auto_1503 ) ) ( HOIST-AT ?auto_1504 ?auto_1507 ) ( not ( = ?auto_1505 ?auto_1504 ) ) ( AVAILABLE ?auto_1504 ) ( SURFACE-AT ?auto_1501 ?auto_1507 ) ( ON ?auto_1501 ?auto_1508 ) ( CLEAR ?auto_1501 ) ( not ( = ?auto_1501 ?auto_1508 ) ) ( not ( = ?auto_1502 ?auto_1508 ) ) )
    :subtasks
    ( ( !LIFT ?auto_1504 ?auto_1501 ?auto_1508 ?auto_1507 )
      ( MAKE-ON ?auto_1501 ?auto_1502 )
      ( MAKE-ON-VERIFY ?auto_1501 ?auto_1502 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1509 - SURFACE
      ?auto_1510 - SURFACE
    )
    :vars
    (
      ?auto_1515 - HOIST
      ?auto_1516 - PLACE
      ?auto_1511 - PLACE
      ?auto_1513 - HOIST
      ?auto_1514 - SURFACE
      ?auto_1512 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1515 ?auto_1516 ) ( SURFACE-AT ?auto_1510 ?auto_1516 ) ( CLEAR ?auto_1510 ) ( IS-CRATE ?auto_1509 ) ( not ( = ?auto_1509 ?auto_1510 ) ) ( AVAILABLE ?auto_1515 ) ( not ( = ?auto_1511 ?auto_1516 ) ) ( HOIST-AT ?auto_1513 ?auto_1511 ) ( not ( = ?auto_1515 ?auto_1513 ) ) ( AVAILABLE ?auto_1513 ) ( SURFACE-AT ?auto_1509 ?auto_1511 ) ( ON ?auto_1509 ?auto_1514 ) ( CLEAR ?auto_1509 ) ( not ( = ?auto_1509 ?auto_1514 ) ) ( not ( = ?auto_1510 ?auto_1514 ) ) ( TRUCK-AT ?auto_1512 ?auto_1516 ) )
    :subtasks
    ( ( !DRIVE ?auto_1512 ?auto_1516 ?auto_1511 )
      ( MAKE-ON ?auto_1509 ?auto_1510 )
      ( MAKE-ON-VERIFY ?auto_1509 ?auto_1510 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1517 - SURFACE
      ?auto_1518 - SURFACE
    )
    :vars
    (
      ?auto_1524 - HOIST
      ?auto_1520 - PLACE
      ?auto_1521 - PLACE
      ?auto_1519 - HOIST
      ?auto_1523 - SURFACE
      ?auto_1522 - TRUCK
      ?auto_1525 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1524 ?auto_1520 ) ( IS-CRATE ?auto_1517 ) ( not ( = ?auto_1517 ?auto_1518 ) ) ( not ( = ?auto_1521 ?auto_1520 ) ) ( HOIST-AT ?auto_1519 ?auto_1521 ) ( not ( = ?auto_1524 ?auto_1519 ) ) ( AVAILABLE ?auto_1519 ) ( SURFACE-AT ?auto_1517 ?auto_1521 ) ( ON ?auto_1517 ?auto_1523 ) ( CLEAR ?auto_1517 ) ( not ( = ?auto_1517 ?auto_1523 ) ) ( not ( = ?auto_1518 ?auto_1523 ) ) ( TRUCK-AT ?auto_1522 ?auto_1520 ) ( SURFACE-AT ?auto_1525 ?auto_1520 ) ( CLEAR ?auto_1525 ) ( LIFTING ?auto_1524 ?auto_1518 ) ( IS-CRATE ?auto_1518 ) ( not ( = ?auto_1517 ?auto_1525 ) ) ( not ( = ?auto_1518 ?auto_1525 ) ) ( not ( = ?auto_1523 ?auto_1525 ) ) )
    :subtasks
    ( ( !DROP ?auto_1524 ?auto_1518 ?auto_1525 ?auto_1520 )
      ( MAKE-ON ?auto_1517 ?auto_1518 )
      ( MAKE-ON-VERIFY ?auto_1517 ?auto_1518 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1526 - SURFACE
      ?auto_1527 - SURFACE
    )
    :vars
    (
      ?auto_1532 - HOIST
      ?auto_1531 - PLACE
      ?auto_1530 - PLACE
      ?auto_1529 - HOIST
      ?auto_1533 - SURFACE
      ?auto_1528 - TRUCK
      ?auto_1534 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1532 ?auto_1531 ) ( IS-CRATE ?auto_1526 ) ( not ( = ?auto_1526 ?auto_1527 ) ) ( not ( = ?auto_1530 ?auto_1531 ) ) ( HOIST-AT ?auto_1529 ?auto_1530 ) ( not ( = ?auto_1532 ?auto_1529 ) ) ( AVAILABLE ?auto_1529 ) ( SURFACE-AT ?auto_1526 ?auto_1530 ) ( ON ?auto_1526 ?auto_1533 ) ( CLEAR ?auto_1526 ) ( not ( = ?auto_1526 ?auto_1533 ) ) ( not ( = ?auto_1527 ?auto_1533 ) ) ( TRUCK-AT ?auto_1528 ?auto_1531 ) ( SURFACE-AT ?auto_1534 ?auto_1531 ) ( CLEAR ?auto_1534 ) ( IS-CRATE ?auto_1527 ) ( not ( = ?auto_1526 ?auto_1534 ) ) ( not ( = ?auto_1527 ?auto_1534 ) ) ( not ( = ?auto_1533 ?auto_1534 ) ) ( AVAILABLE ?auto_1532 ) ( IN ?auto_1527 ?auto_1528 ) )
    :subtasks
    ( ( !UNLOAD ?auto_1532 ?auto_1527 ?auto_1528 ?auto_1531 )
      ( MAKE-ON ?auto_1526 ?auto_1527 )
      ( MAKE-ON-VERIFY ?auto_1526 ?auto_1527 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1535 - SURFACE
      ?auto_1536 - SURFACE
    )
    :vars
    (
      ?auto_1541 - HOIST
      ?auto_1542 - PLACE
      ?auto_1537 - PLACE
      ?auto_1539 - HOIST
      ?auto_1540 - SURFACE
      ?auto_1543 - SURFACE
      ?auto_1538 - TRUCK
      ?auto_1544 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1541 ?auto_1542 ) ( IS-CRATE ?auto_1535 ) ( not ( = ?auto_1535 ?auto_1536 ) ) ( not ( = ?auto_1537 ?auto_1542 ) ) ( HOIST-AT ?auto_1539 ?auto_1537 ) ( not ( = ?auto_1541 ?auto_1539 ) ) ( AVAILABLE ?auto_1539 ) ( SURFACE-AT ?auto_1535 ?auto_1537 ) ( ON ?auto_1535 ?auto_1540 ) ( CLEAR ?auto_1535 ) ( not ( = ?auto_1535 ?auto_1540 ) ) ( not ( = ?auto_1536 ?auto_1540 ) ) ( SURFACE-AT ?auto_1543 ?auto_1542 ) ( CLEAR ?auto_1543 ) ( IS-CRATE ?auto_1536 ) ( not ( = ?auto_1535 ?auto_1543 ) ) ( not ( = ?auto_1536 ?auto_1543 ) ) ( not ( = ?auto_1540 ?auto_1543 ) ) ( AVAILABLE ?auto_1541 ) ( IN ?auto_1536 ?auto_1538 ) ( TRUCK-AT ?auto_1538 ?auto_1544 ) ( not ( = ?auto_1544 ?auto_1542 ) ) ( not ( = ?auto_1537 ?auto_1544 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1538 ?auto_1544 ?auto_1542 )
      ( MAKE-ON ?auto_1535 ?auto_1536 )
      ( MAKE-ON-VERIFY ?auto_1535 ?auto_1536 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1545 - SURFACE
      ?auto_1546 - SURFACE
    )
    :vars
    (
      ?auto_1554 - HOIST
      ?auto_1549 - PLACE
      ?auto_1547 - PLACE
      ?auto_1551 - HOIST
      ?auto_1552 - SURFACE
      ?auto_1550 - SURFACE
      ?auto_1553 - TRUCK
      ?auto_1548 - PLACE
      ?auto_1555 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1554 ?auto_1549 ) ( IS-CRATE ?auto_1545 ) ( not ( = ?auto_1545 ?auto_1546 ) ) ( not ( = ?auto_1547 ?auto_1549 ) ) ( HOIST-AT ?auto_1551 ?auto_1547 ) ( not ( = ?auto_1554 ?auto_1551 ) ) ( AVAILABLE ?auto_1551 ) ( SURFACE-AT ?auto_1545 ?auto_1547 ) ( ON ?auto_1545 ?auto_1552 ) ( CLEAR ?auto_1545 ) ( not ( = ?auto_1545 ?auto_1552 ) ) ( not ( = ?auto_1546 ?auto_1552 ) ) ( SURFACE-AT ?auto_1550 ?auto_1549 ) ( CLEAR ?auto_1550 ) ( IS-CRATE ?auto_1546 ) ( not ( = ?auto_1545 ?auto_1550 ) ) ( not ( = ?auto_1546 ?auto_1550 ) ) ( not ( = ?auto_1552 ?auto_1550 ) ) ( AVAILABLE ?auto_1554 ) ( TRUCK-AT ?auto_1553 ?auto_1548 ) ( not ( = ?auto_1548 ?auto_1549 ) ) ( not ( = ?auto_1547 ?auto_1548 ) ) ( HOIST-AT ?auto_1555 ?auto_1548 ) ( LIFTING ?auto_1555 ?auto_1546 ) ( not ( = ?auto_1554 ?auto_1555 ) ) ( not ( = ?auto_1551 ?auto_1555 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1555 ?auto_1546 ?auto_1553 ?auto_1548 )
      ( MAKE-ON ?auto_1545 ?auto_1546 )
      ( MAKE-ON-VERIFY ?auto_1545 ?auto_1546 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1556 - SURFACE
      ?auto_1557 - SURFACE
    )
    :vars
    (
      ?auto_1565 - HOIST
      ?auto_1562 - PLACE
      ?auto_1564 - PLACE
      ?auto_1560 - HOIST
      ?auto_1559 - SURFACE
      ?auto_1561 - SURFACE
      ?auto_1566 - TRUCK
      ?auto_1558 - PLACE
      ?auto_1563 - HOIST
      ?auto_1567 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1565 ?auto_1562 ) ( IS-CRATE ?auto_1556 ) ( not ( = ?auto_1556 ?auto_1557 ) ) ( not ( = ?auto_1564 ?auto_1562 ) ) ( HOIST-AT ?auto_1560 ?auto_1564 ) ( not ( = ?auto_1565 ?auto_1560 ) ) ( AVAILABLE ?auto_1560 ) ( SURFACE-AT ?auto_1556 ?auto_1564 ) ( ON ?auto_1556 ?auto_1559 ) ( CLEAR ?auto_1556 ) ( not ( = ?auto_1556 ?auto_1559 ) ) ( not ( = ?auto_1557 ?auto_1559 ) ) ( SURFACE-AT ?auto_1561 ?auto_1562 ) ( CLEAR ?auto_1561 ) ( IS-CRATE ?auto_1557 ) ( not ( = ?auto_1556 ?auto_1561 ) ) ( not ( = ?auto_1557 ?auto_1561 ) ) ( not ( = ?auto_1559 ?auto_1561 ) ) ( AVAILABLE ?auto_1565 ) ( TRUCK-AT ?auto_1566 ?auto_1558 ) ( not ( = ?auto_1558 ?auto_1562 ) ) ( not ( = ?auto_1564 ?auto_1558 ) ) ( HOIST-AT ?auto_1563 ?auto_1558 ) ( not ( = ?auto_1565 ?auto_1563 ) ) ( not ( = ?auto_1560 ?auto_1563 ) ) ( AVAILABLE ?auto_1563 ) ( SURFACE-AT ?auto_1557 ?auto_1558 ) ( ON ?auto_1557 ?auto_1567 ) ( CLEAR ?auto_1557 ) ( not ( = ?auto_1556 ?auto_1567 ) ) ( not ( = ?auto_1557 ?auto_1567 ) ) ( not ( = ?auto_1559 ?auto_1567 ) ) ( not ( = ?auto_1561 ?auto_1567 ) ) )
    :subtasks
    ( ( !LIFT ?auto_1563 ?auto_1557 ?auto_1567 ?auto_1558 )
      ( MAKE-ON ?auto_1556 ?auto_1557 )
      ( MAKE-ON-VERIFY ?auto_1556 ?auto_1557 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1568 - SURFACE
      ?auto_1569 - SURFACE
    )
    :vars
    (
      ?auto_1570 - HOIST
      ?auto_1579 - PLACE
      ?auto_1572 - PLACE
      ?auto_1578 - HOIST
      ?auto_1571 - SURFACE
      ?auto_1574 - SURFACE
      ?auto_1576 - PLACE
      ?auto_1577 - HOIST
      ?auto_1573 - SURFACE
      ?auto_1575 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1570 ?auto_1579 ) ( IS-CRATE ?auto_1568 ) ( not ( = ?auto_1568 ?auto_1569 ) ) ( not ( = ?auto_1572 ?auto_1579 ) ) ( HOIST-AT ?auto_1578 ?auto_1572 ) ( not ( = ?auto_1570 ?auto_1578 ) ) ( AVAILABLE ?auto_1578 ) ( SURFACE-AT ?auto_1568 ?auto_1572 ) ( ON ?auto_1568 ?auto_1571 ) ( CLEAR ?auto_1568 ) ( not ( = ?auto_1568 ?auto_1571 ) ) ( not ( = ?auto_1569 ?auto_1571 ) ) ( SURFACE-AT ?auto_1574 ?auto_1579 ) ( CLEAR ?auto_1574 ) ( IS-CRATE ?auto_1569 ) ( not ( = ?auto_1568 ?auto_1574 ) ) ( not ( = ?auto_1569 ?auto_1574 ) ) ( not ( = ?auto_1571 ?auto_1574 ) ) ( AVAILABLE ?auto_1570 ) ( not ( = ?auto_1576 ?auto_1579 ) ) ( not ( = ?auto_1572 ?auto_1576 ) ) ( HOIST-AT ?auto_1577 ?auto_1576 ) ( not ( = ?auto_1570 ?auto_1577 ) ) ( not ( = ?auto_1578 ?auto_1577 ) ) ( AVAILABLE ?auto_1577 ) ( SURFACE-AT ?auto_1569 ?auto_1576 ) ( ON ?auto_1569 ?auto_1573 ) ( CLEAR ?auto_1569 ) ( not ( = ?auto_1568 ?auto_1573 ) ) ( not ( = ?auto_1569 ?auto_1573 ) ) ( not ( = ?auto_1571 ?auto_1573 ) ) ( not ( = ?auto_1574 ?auto_1573 ) ) ( TRUCK-AT ?auto_1575 ?auto_1579 ) )
    :subtasks
    ( ( !DRIVE ?auto_1575 ?auto_1579 ?auto_1576 )
      ( MAKE-ON ?auto_1568 ?auto_1569 )
      ( MAKE-ON-VERIFY ?auto_1568 ?auto_1569 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1580 - SURFACE
      ?auto_1581 - SURFACE
    )
    :vars
    (
      ?auto_1589 - HOIST
      ?auto_1588 - PLACE
      ?auto_1586 - PLACE
      ?auto_1591 - HOIST
      ?auto_1583 - SURFACE
      ?auto_1584 - SURFACE
      ?auto_1590 - PLACE
      ?auto_1585 - HOIST
      ?auto_1582 - SURFACE
      ?auto_1587 - TRUCK
      ?auto_1592 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1589 ?auto_1588 ) ( IS-CRATE ?auto_1580 ) ( not ( = ?auto_1580 ?auto_1581 ) ) ( not ( = ?auto_1586 ?auto_1588 ) ) ( HOIST-AT ?auto_1591 ?auto_1586 ) ( not ( = ?auto_1589 ?auto_1591 ) ) ( AVAILABLE ?auto_1591 ) ( SURFACE-AT ?auto_1580 ?auto_1586 ) ( ON ?auto_1580 ?auto_1583 ) ( CLEAR ?auto_1580 ) ( not ( = ?auto_1580 ?auto_1583 ) ) ( not ( = ?auto_1581 ?auto_1583 ) ) ( IS-CRATE ?auto_1581 ) ( not ( = ?auto_1580 ?auto_1584 ) ) ( not ( = ?auto_1581 ?auto_1584 ) ) ( not ( = ?auto_1583 ?auto_1584 ) ) ( not ( = ?auto_1590 ?auto_1588 ) ) ( not ( = ?auto_1586 ?auto_1590 ) ) ( HOIST-AT ?auto_1585 ?auto_1590 ) ( not ( = ?auto_1589 ?auto_1585 ) ) ( not ( = ?auto_1591 ?auto_1585 ) ) ( AVAILABLE ?auto_1585 ) ( SURFACE-AT ?auto_1581 ?auto_1590 ) ( ON ?auto_1581 ?auto_1582 ) ( CLEAR ?auto_1581 ) ( not ( = ?auto_1580 ?auto_1582 ) ) ( not ( = ?auto_1581 ?auto_1582 ) ) ( not ( = ?auto_1583 ?auto_1582 ) ) ( not ( = ?auto_1584 ?auto_1582 ) ) ( TRUCK-AT ?auto_1587 ?auto_1588 ) ( SURFACE-AT ?auto_1592 ?auto_1588 ) ( CLEAR ?auto_1592 ) ( LIFTING ?auto_1589 ?auto_1584 ) ( IS-CRATE ?auto_1584 ) ( not ( = ?auto_1580 ?auto_1592 ) ) ( not ( = ?auto_1581 ?auto_1592 ) ) ( not ( = ?auto_1583 ?auto_1592 ) ) ( not ( = ?auto_1584 ?auto_1592 ) ) ( not ( = ?auto_1582 ?auto_1592 ) ) )
    :subtasks
    ( ( !DROP ?auto_1589 ?auto_1584 ?auto_1592 ?auto_1588 )
      ( MAKE-ON ?auto_1580 ?auto_1581 )
      ( MAKE-ON-VERIFY ?auto_1580 ?auto_1581 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1593 - SURFACE
      ?auto_1594 - SURFACE
    )
    :vars
    (
      ?auto_1597 - HOIST
      ?auto_1603 - PLACE
      ?auto_1600 - PLACE
      ?auto_1604 - HOIST
      ?auto_1599 - SURFACE
      ?auto_1598 - SURFACE
      ?auto_1605 - PLACE
      ?auto_1602 - HOIST
      ?auto_1595 - SURFACE
      ?auto_1601 - TRUCK
      ?auto_1596 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1597 ?auto_1603 ) ( IS-CRATE ?auto_1593 ) ( not ( = ?auto_1593 ?auto_1594 ) ) ( not ( = ?auto_1600 ?auto_1603 ) ) ( HOIST-AT ?auto_1604 ?auto_1600 ) ( not ( = ?auto_1597 ?auto_1604 ) ) ( AVAILABLE ?auto_1604 ) ( SURFACE-AT ?auto_1593 ?auto_1600 ) ( ON ?auto_1593 ?auto_1599 ) ( CLEAR ?auto_1593 ) ( not ( = ?auto_1593 ?auto_1599 ) ) ( not ( = ?auto_1594 ?auto_1599 ) ) ( IS-CRATE ?auto_1594 ) ( not ( = ?auto_1593 ?auto_1598 ) ) ( not ( = ?auto_1594 ?auto_1598 ) ) ( not ( = ?auto_1599 ?auto_1598 ) ) ( not ( = ?auto_1605 ?auto_1603 ) ) ( not ( = ?auto_1600 ?auto_1605 ) ) ( HOIST-AT ?auto_1602 ?auto_1605 ) ( not ( = ?auto_1597 ?auto_1602 ) ) ( not ( = ?auto_1604 ?auto_1602 ) ) ( AVAILABLE ?auto_1602 ) ( SURFACE-AT ?auto_1594 ?auto_1605 ) ( ON ?auto_1594 ?auto_1595 ) ( CLEAR ?auto_1594 ) ( not ( = ?auto_1593 ?auto_1595 ) ) ( not ( = ?auto_1594 ?auto_1595 ) ) ( not ( = ?auto_1599 ?auto_1595 ) ) ( not ( = ?auto_1598 ?auto_1595 ) ) ( TRUCK-AT ?auto_1601 ?auto_1603 ) ( SURFACE-AT ?auto_1596 ?auto_1603 ) ( CLEAR ?auto_1596 ) ( IS-CRATE ?auto_1598 ) ( not ( = ?auto_1593 ?auto_1596 ) ) ( not ( = ?auto_1594 ?auto_1596 ) ) ( not ( = ?auto_1599 ?auto_1596 ) ) ( not ( = ?auto_1598 ?auto_1596 ) ) ( not ( = ?auto_1595 ?auto_1596 ) ) ( AVAILABLE ?auto_1597 ) ( IN ?auto_1598 ?auto_1601 ) )
    :subtasks
    ( ( !UNLOAD ?auto_1597 ?auto_1598 ?auto_1601 ?auto_1603 )
      ( MAKE-ON ?auto_1593 ?auto_1594 )
      ( MAKE-ON-VERIFY ?auto_1593 ?auto_1594 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1606 - SURFACE
      ?auto_1607 - SURFACE
    )
    :vars
    (
      ?auto_1608 - HOIST
      ?auto_1614 - PLACE
      ?auto_1612 - PLACE
      ?auto_1616 - HOIST
      ?auto_1609 - SURFACE
      ?auto_1610 - SURFACE
      ?auto_1613 - PLACE
      ?auto_1617 - HOIST
      ?auto_1618 - SURFACE
      ?auto_1611 - SURFACE
      ?auto_1615 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1608 ?auto_1614 ) ( IS-CRATE ?auto_1606 ) ( not ( = ?auto_1606 ?auto_1607 ) ) ( not ( = ?auto_1612 ?auto_1614 ) ) ( HOIST-AT ?auto_1616 ?auto_1612 ) ( not ( = ?auto_1608 ?auto_1616 ) ) ( AVAILABLE ?auto_1616 ) ( SURFACE-AT ?auto_1606 ?auto_1612 ) ( ON ?auto_1606 ?auto_1609 ) ( CLEAR ?auto_1606 ) ( not ( = ?auto_1606 ?auto_1609 ) ) ( not ( = ?auto_1607 ?auto_1609 ) ) ( IS-CRATE ?auto_1607 ) ( not ( = ?auto_1606 ?auto_1610 ) ) ( not ( = ?auto_1607 ?auto_1610 ) ) ( not ( = ?auto_1609 ?auto_1610 ) ) ( not ( = ?auto_1613 ?auto_1614 ) ) ( not ( = ?auto_1612 ?auto_1613 ) ) ( HOIST-AT ?auto_1617 ?auto_1613 ) ( not ( = ?auto_1608 ?auto_1617 ) ) ( not ( = ?auto_1616 ?auto_1617 ) ) ( AVAILABLE ?auto_1617 ) ( SURFACE-AT ?auto_1607 ?auto_1613 ) ( ON ?auto_1607 ?auto_1618 ) ( CLEAR ?auto_1607 ) ( not ( = ?auto_1606 ?auto_1618 ) ) ( not ( = ?auto_1607 ?auto_1618 ) ) ( not ( = ?auto_1609 ?auto_1618 ) ) ( not ( = ?auto_1610 ?auto_1618 ) ) ( SURFACE-AT ?auto_1611 ?auto_1614 ) ( CLEAR ?auto_1611 ) ( IS-CRATE ?auto_1610 ) ( not ( = ?auto_1606 ?auto_1611 ) ) ( not ( = ?auto_1607 ?auto_1611 ) ) ( not ( = ?auto_1609 ?auto_1611 ) ) ( not ( = ?auto_1610 ?auto_1611 ) ) ( not ( = ?auto_1618 ?auto_1611 ) ) ( AVAILABLE ?auto_1608 ) ( IN ?auto_1610 ?auto_1615 ) ( TRUCK-AT ?auto_1615 ?auto_1613 ) )
    :subtasks
    ( ( !DRIVE ?auto_1615 ?auto_1613 ?auto_1614 )
      ( MAKE-ON ?auto_1606 ?auto_1607 )
      ( MAKE-ON-VERIFY ?auto_1606 ?auto_1607 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1619 - SURFACE
      ?auto_1620 - SURFACE
    )
    :vars
    (
      ?auto_1625 - HOIST
      ?auto_1631 - PLACE
      ?auto_1626 - PLACE
      ?auto_1630 - HOIST
      ?auto_1627 - SURFACE
      ?auto_1624 - SURFACE
      ?auto_1621 - PLACE
      ?auto_1623 - HOIST
      ?auto_1629 - SURFACE
      ?auto_1628 - SURFACE
      ?auto_1622 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1625 ?auto_1631 ) ( IS-CRATE ?auto_1619 ) ( not ( = ?auto_1619 ?auto_1620 ) ) ( not ( = ?auto_1626 ?auto_1631 ) ) ( HOIST-AT ?auto_1630 ?auto_1626 ) ( not ( = ?auto_1625 ?auto_1630 ) ) ( AVAILABLE ?auto_1630 ) ( SURFACE-AT ?auto_1619 ?auto_1626 ) ( ON ?auto_1619 ?auto_1627 ) ( CLEAR ?auto_1619 ) ( not ( = ?auto_1619 ?auto_1627 ) ) ( not ( = ?auto_1620 ?auto_1627 ) ) ( IS-CRATE ?auto_1620 ) ( not ( = ?auto_1619 ?auto_1624 ) ) ( not ( = ?auto_1620 ?auto_1624 ) ) ( not ( = ?auto_1627 ?auto_1624 ) ) ( not ( = ?auto_1621 ?auto_1631 ) ) ( not ( = ?auto_1626 ?auto_1621 ) ) ( HOIST-AT ?auto_1623 ?auto_1621 ) ( not ( = ?auto_1625 ?auto_1623 ) ) ( not ( = ?auto_1630 ?auto_1623 ) ) ( SURFACE-AT ?auto_1620 ?auto_1621 ) ( ON ?auto_1620 ?auto_1629 ) ( CLEAR ?auto_1620 ) ( not ( = ?auto_1619 ?auto_1629 ) ) ( not ( = ?auto_1620 ?auto_1629 ) ) ( not ( = ?auto_1627 ?auto_1629 ) ) ( not ( = ?auto_1624 ?auto_1629 ) ) ( SURFACE-AT ?auto_1628 ?auto_1631 ) ( CLEAR ?auto_1628 ) ( IS-CRATE ?auto_1624 ) ( not ( = ?auto_1619 ?auto_1628 ) ) ( not ( = ?auto_1620 ?auto_1628 ) ) ( not ( = ?auto_1627 ?auto_1628 ) ) ( not ( = ?auto_1624 ?auto_1628 ) ) ( not ( = ?auto_1629 ?auto_1628 ) ) ( AVAILABLE ?auto_1625 ) ( TRUCK-AT ?auto_1622 ?auto_1621 ) ( LIFTING ?auto_1623 ?auto_1624 ) )
    :subtasks
    ( ( !LOAD ?auto_1623 ?auto_1624 ?auto_1622 ?auto_1621 )
      ( MAKE-ON ?auto_1619 ?auto_1620 )
      ( MAKE-ON-VERIFY ?auto_1619 ?auto_1620 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1632 - SURFACE
      ?auto_1633 - SURFACE
    )
    :vars
    (
      ?auto_1642 - HOIST
      ?auto_1634 - PLACE
      ?auto_1641 - PLACE
      ?auto_1635 - HOIST
      ?auto_1643 - SURFACE
      ?auto_1637 - SURFACE
      ?auto_1636 - PLACE
      ?auto_1640 - HOIST
      ?auto_1644 - SURFACE
      ?auto_1638 - SURFACE
      ?auto_1639 - TRUCK
      ?auto_1645 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1642 ?auto_1634 ) ( IS-CRATE ?auto_1632 ) ( not ( = ?auto_1632 ?auto_1633 ) ) ( not ( = ?auto_1641 ?auto_1634 ) ) ( HOIST-AT ?auto_1635 ?auto_1641 ) ( not ( = ?auto_1642 ?auto_1635 ) ) ( AVAILABLE ?auto_1635 ) ( SURFACE-AT ?auto_1632 ?auto_1641 ) ( ON ?auto_1632 ?auto_1643 ) ( CLEAR ?auto_1632 ) ( not ( = ?auto_1632 ?auto_1643 ) ) ( not ( = ?auto_1633 ?auto_1643 ) ) ( IS-CRATE ?auto_1633 ) ( not ( = ?auto_1632 ?auto_1637 ) ) ( not ( = ?auto_1633 ?auto_1637 ) ) ( not ( = ?auto_1643 ?auto_1637 ) ) ( not ( = ?auto_1636 ?auto_1634 ) ) ( not ( = ?auto_1641 ?auto_1636 ) ) ( HOIST-AT ?auto_1640 ?auto_1636 ) ( not ( = ?auto_1642 ?auto_1640 ) ) ( not ( = ?auto_1635 ?auto_1640 ) ) ( SURFACE-AT ?auto_1633 ?auto_1636 ) ( ON ?auto_1633 ?auto_1644 ) ( CLEAR ?auto_1633 ) ( not ( = ?auto_1632 ?auto_1644 ) ) ( not ( = ?auto_1633 ?auto_1644 ) ) ( not ( = ?auto_1643 ?auto_1644 ) ) ( not ( = ?auto_1637 ?auto_1644 ) ) ( SURFACE-AT ?auto_1638 ?auto_1634 ) ( CLEAR ?auto_1638 ) ( IS-CRATE ?auto_1637 ) ( not ( = ?auto_1632 ?auto_1638 ) ) ( not ( = ?auto_1633 ?auto_1638 ) ) ( not ( = ?auto_1643 ?auto_1638 ) ) ( not ( = ?auto_1637 ?auto_1638 ) ) ( not ( = ?auto_1644 ?auto_1638 ) ) ( AVAILABLE ?auto_1642 ) ( TRUCK-AT ?auto_1639 ?auto_1636 ) ( AVAILABLE ?auto_1640 ) ( SURFACE-AT ?auto_1637 ?auto_1636 ) ( ON ?auto_1637 ?auto_1645 ) ( CLEAR ?auto_1637 ) ( not ( = ?auto_1632 ?auto_1645 ) ) ( not ( = ?auto_1633 ?auto_1645 ) ) ( not ( = ?auto_1643 ?auto_1645 ) ) ( not ( = ?auto_1637 ?auto_1645 ) ) ( not ( = ?auto_1644 ?auto_1645 ) ) ( not ( = ?auto_1638 ?auto_1645 ) ) )
    :subtasks
    ( ( !LIFT ?auto_1640 ?auto_1637 ?auto_1645 ?auto_1636 )
      ( MAKE-ON ?auto_1632 ?auto_1633 )
      ( MAKE-ON-VERIFY ?auto_1632 ?auto_1633 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1646 - SURFACE
      ?auto_1647 - SURFACE
    )
    :vars
    (
      ?auto_1648 - HOIST
      ?auto_1657 - PLACE
      ?auto_1649 - PLACE
      ?auto_1650 - HOIST
      ?auto_1651 - SURFACE
      ?auto_1652 - SURFACE
      ?auto_1654 - PLACE
      ?auto_1656 - HOIST
      ?auto_1653 - SURFACE
      ?auto_1658 - SURFACE
      ?auto_1659 - SURFACE
      ?auto_1655 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1648 ?auto_1657 ) ( IS-CRATE ?auto_1646 ) ( not ( = ?auto_1646 ?auto_1647 ) ) ( not ( = ?auto_1649 ?auto_1657 ) ) ( HOIST-AT ?auto_1650 ?auto_1649 ) ( not ( = ?auto_1648 ?auto_1650 ) ) ( AVAILABLE ?auto_1650 ) ( SURFACE-AT ?auto_1646 ?auto_1649 ) ( ON ?auto_1646 ?auto_1651 ) ( CLEAR ?auto_1646 ) ( not ( = ?auto_1646 ?auto_1651 ) ) ( not ( = ?auto_1647 ?auto_1651 ) ) ( IS-CRATE ?auto_1647 ) ( not ( = ?auto_1646 ?auto_1652 ) ) ( not ( = ?auto_1647 ?auto_1652 ) ) ( not ( = ?auto_1651 ?auto_1652 ) ) ( not ( = ?auto_1654 ?auto_1657 ) ) ( not ( = ?auto_1649 ?auto_1654 ) ) ( HOIST-AT ?auto_1656 ?auto_1654 ) ( not ( = ?auto_1648 ?auto_1656 ) ) ( not ( = ?auto_1650 ?auto_1656 ) ) ( SURFACE-AT ?auto_1647 ?auto_1654 ) ( ON ?auto_1647 ?auto_1653 ) ( CLEAR ?auto_1647 ) ( not ( = ?auto_1646 ?auto_1653 ) ) ( not ( = ?auto_1647 ?auto_1653 ) ) ( not ( = ?auto_1651 ?auto_1653 ) ) ( not ( = ?auto_1652 ?auto_1653 ) ) ( SURFACE-AT ?auto_1658 ?auto_1657 ) ( CLEAR ?auto_1658 ) ( IS-CRATE ?auto_1652 ) ( not ( = ?auto_1646 ?auto_1658 ) ) ( not ( = ?auto_1647 ?auto_1658 ) ) ( not ( = ?auto_1651 ?auto_1658 ) ) ( not ( = ?auto_1652 ?auto_1658 ) ) ( not ( = ?auto_1653 ?auto_1658 ) ) ( AVAILABLE ?auto_1648 ) ( AVAILABLE ?auto_1656 ) ( SURFACE-AT ?auto_1652 ?auto_1654 ) ( ON ?auto_1652 ?auto_1659 ) ( CLEAR ?auto_1652 ) ( not ( = ?auto_1646 ?auto_1659 ) ) ( not ( = ?auto_1647 ?auto_1659 ) ) ( not ( = ?auto_1651 ?auto_1659 ) ) ( not ( = ?auto_1652 ?auto_1659 ) ) ( not ( = ?auto_1653 ?auto_1659 ) ) ( not ( = ?auto_1658 ?auto_1659 ) ) ( TRUCK-AT ?auto_1655 ?auto_1657 ) )
    :subtasks
    ( ( !DRIVE ?auto_1655 ?auto_1657 ?auto_1654 )
      ( MAKE-ON ?auto_1646 ?auto_1647 )
      ( MAKE-ON-VERIFY ?auto_1646 ?auto_1647 ) )
  )

)

