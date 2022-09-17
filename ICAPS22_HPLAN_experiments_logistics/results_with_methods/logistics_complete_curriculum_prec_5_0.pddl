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

  ( :method DELIVER-5PKG-VERIFY
    :parameters
    (
      ?obj1 - OBJ
      ?obj2 - OBJ
      ?obj3 - OBJ
      ?obj4 - OBJ
      ?obj5 - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj1 ?dst ) ( OBJ-AT ?obj2 ?dst ) ( OBJ-AT ?obj3 ?dst ) ( OBJ-AT ?obj4 ?dst ) ( OBJ-AT ?obj5 ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1308 - OBJ
      ?auto_1309 - LOCATION
    )
    :vars
    (
      ?auto_1310 - TRUCK
      ?auto_1311 - LOCATION
      ?auto_1312 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_1310 ?auto_1311 ) ( IN-CITY ?auto_1311 ?auto_1312 ) ( IN-CITY ?auto_1309 ?auto_1312 ) ( not ( = ?auto_1309 ?auto_1311 ) ) ( OBJ-AT ?auto_1308 ?auto_1311 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_1308 ?auto_1310 ?auto_1311 )
      ( !DRIVE-TRUCK ?auto_1310 ?auto_1311 ?auto_1309 ?auto_1312 )
      ( !UNLOAD-TRUCK ?auto_1308 ?auto_1310 ?auto_1309 )
      ( DELIVER-1PKG-VERIFY ?auto_1308 ?auto_1309 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1315 - OBJ
      ?auto_1316 - LOCATION
    )
    :vars
    (
      ?auto_1317 - LOCATION
      ?auto_1319 - CITY
      ?auto_1318 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1317 ?auto_1319 ) ( IN-CITY ?auto_1316 ?auto_1319 ) ( not ( = ?auto_1316 ?auto_1317 ) ) ( OBJ-AT ?auto_1315 ?auto_1317 ) ( TRUCK-AT ?auto_1318 ?auto_1316 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1318 ?auto_1316 ?auto_1317 ?auto_1319 )
      ( DELIVER-1PKG ?auto_1315 ?auto_1316 )
      ( DELIVER-1PKG-VERIFY ?auto_1315 ?auto_1316 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1322 - OBJ
      ?auto_1323 - LOCATION
    )
    :vars
    (
      ?auto_1324 - TRUCK
      ?auto_1325 - LOCATION
      ?auto_1326 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_1324 ?auto_1325 ) ( IN-CITY ?auto_1325 ?auto_1326 ) ( IN-CITY ?auto_1323 ?auto_1326 ) ( not ( = ?auto_1323 ?auto_1325 ) ) ( OBJ-AT ?auto_1322 ?auto_1325 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_1322 ?auto_1324 ?auto_1325 )
      ( !DRIVE-TRUCK ?auto_1324 ?auto_1325 ?auto_1323 ?auto_1326 )
      ( !UNLOAD-TRUCK ?auto_1322 ?auto_1324 ?auto_1323 )
      ( DELIVER-1PKG-VERIFY ?auto_1322 ?auto_1323 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1329 - OBJ
      ?auto_1330 - LOCATION
    )
    :vars
    (
      ?auto_1332 - LOCATION
      ?auto_1331 - CITY
      ?auto_1333 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1332 ?auto_1331 ) ( IN-CITY ?auto_1330 ?auto_1331 ) ( not ( = ?auto_1330 ?auto_1332 ) ) ( OBJ-AT ?auto_1329 ?auto_1332 ) ( TRUCK-AT ?auto_1333 ?auto_1330 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1333 ?auto_1330 ?auto_1332 ?auto_1331 )
      ( DELIVER-1PKG ?auto_1329 ?auto_1330 )
      ( DELIVER-1PKG-VERIFY ?auto_1329 ?auto_1330 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1337 - OBJ
      ?auto_1339 - OBJ
      ?auto_1338 - LOCATION
    )
    :vars
    (
      ?auto_1342 - LOCATION
      ?auto_1341 - CITY
      ?auto_1340 - TRUCK
      ?auto_1343 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1339 ?auto_1337 ) ( IN-CITY ?auto_1342 ?auto_1341 ) ( IN-CITY ?auto_1338 ?auto_1341 ) ( not ( = ?auto_1338 ?auto_1342 ) ) ( OBJ-AT ?auto_1339 ?auto_1342 ) ( TRUCK-AT ?auto_1340 ?auto_1343 ) ( IN-CITY ?auto_1343 ?auto_1341 ) ( not ( = ?auto_1338 ?auto_1343 ) ) ( OBJ-AT ?auto_1337 ?auto_1343 ) ( not ( = ?auto_1337 ?auto_1339 ) ) ( not ( = ?auto_1342 ?auto_1343 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1337 ?auto_1338 )
      ( DELIVER-1PKG ?auto_1339 ?auto_1338 )
      ( DELIVER-2PKG-VERIFY ?auto_1337 ?auto_1339 ?auto_1338 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1347 - OBJ
      ?auto_1349 - OBJ
      ?auto_1348 - LOCATION
    )
    :vars
    (
      ?auto_1351 - LOCATION
      ?auto_1353 - CITY
      ?auto_1350 - LOCATION
      ?auto_1352 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1349 ?auto_1347 ) ( IN-CITY ?auto_1351 ?auto_1353 ) ( IN-CITY ?auto_1348 ?auto_1353 ) ( not ( = ?auto_1348 ?auto_1351 ) ) ( OBJ-AT ?auto_1349 ?auto_1351 ) ( IN-CITY ?auto_1350 ?auto_1353 ) ( not ( = ?auto_1348 ?auto_1350 ) ) ( OBJ-AT ?auto_1347 ?auto_1350 ) ( not ( = ?auto_1347 ?auto_1349 ) ) ( not ( = ?auto_1351 ?auto_1350 ) ) ( TRUCK-AT ?auto_1352 ?auto_1348 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1352 ?auto_1348 ?auto_1350 ?auto_1353 )
      ( DELIVER-2PKG ?auto_1347 ?auto_1349 ?auto_1348 )
      ( DELIVER-2PKG-VERIFY ?auto_1347 ?auto_1349 ?auto_1348 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1356 - OBJ
      ?auto_1357 - LOCATION
    )
    :vars
    (
      ?auto_1358 - TRUCK
      ?auto_1359 - LOCATION
      ?auto_1360 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_1358 ?auto_1359 ) ( IN-CITY ?auto_1359 ?auto_1360 ) ( IN-CITY ?auto_1357 ?auto_1360 ) ( not ( = ?auto_1357 ?auto_1359 ) ) ( OBJ-AT ?auto_1356 ?auto_1359 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_1356 ?auto_1358 ?auto_1359 )
      ( !DRIVE-TRUCK ?auto_1358 ?auto_1359 ?auto_1357 ?auto_1360 )
      ( !UNLOAD-TRUCK ?auto_1356 ?auto_1358 ?auto_1357 )
      ( DELIVER-1PKG-VERIFY ?auto_1356 ?auto_1357 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1363 - OBJ
      ?auto_1364 - LOCATION
    )
    :vars
    (
      ?auto_1365 - LOCATION
      ?auto_1366 - CITY
      ?auto_1367 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1365 ?auto_1366 ) ( IN-CITY ?auto_1364 ?auto_1366 ) ( not ( = ?auto_1364 ?auto_1365 ) ) ( OBJ-AT ?auto_1363 ?auto_1365 ) ( TRUCK-AT ?auto_1367 ?auto_1364 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1367 ?auto_1364 ?auto_1365 ?auto_1366 )
      ( DELIVER-1PKG ?auto_1363 ?auto_1364 )
      ( DELIVER-1PKG-VERIFY ?auto_1363 ?auto_1364 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1372 - OBJ
      ?auto_1374 - OBJ
      ?auto_1375 - OBJ
      ?auto_1373 - LOCATION
    )
    :vars
    (
      ?auto_1378 - LOCATION
      ?auto_1376 - CITY
      ?auto_1380 - LOCATION
      ?auto_1377 - TRUCK
      ?auto_1379 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1374 ?auto_1372 ) ( GREATER-THAN ?auto_1375 ?auto_1372 ) ( GREATER-THAN ?auto_1375 ?auto_1374 ) ( IN-CITY ?auto_1378 ?auto_1376 ) ( IN-CITY ?auto_1373 ?auto_1376 ) ( not ( = ?auto_1373 ?auto_1378 ) ) ( OBJ-AT ?auto_1375 ?auto_1378 ) ( IN-CITY ?auto_1380 ?auto_1376 ) ( not ( = ?auto_1373 ?auto_1380 ) ) ( OBJ-AT ?auto_1374 ?auto_1380 ) ( TRUCK-AT ?auto_1377 ?auto_1379 ) ( IN-CITY ?auto_1379 ?auto_1376 ) ( not ( = ?auto_1373 ?auto_1379 ) ) ( OBJ-AT ?auto_1372 ?auto_1379 ) ( not ( = ?auto_1372 ?auto_1374 ) ) ( not ( = ?auto_1380 ?auto_1379 ) ) ( not ( = ?auto_1372 ?auto_1375 ) ) ( not ( = ?auto_1374 ?auto_1375 ) ) ( not ( = ?auto_1378 ?auto_1380 ) ) ( not ( = ?auto_1378 ?auto_1379 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1372 ?auto_1374 ?auto_1373 )
      ( DELIVER-1PKG ?auto_1375 ?auto_1373 )
      ( DELIVER-3PKG-VERIFY ?auto_1372 ?auto_1374 ?auto_1375 ?auto_1373 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1385 - OBJ
      ?auto_1387 - OBJ
      ?auto_1388 - OBJ
      ?auto_1386 - LOCATION
    )
    :vars
    (
      ?auto_1392 - LOCATION
      ?auto_1390 - CITY
      ?auto_1389 - LOCATION
      ?auto_1393 - LOCATION
      ?auto_1391 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1387 ?auto_1385 ) ( GREATER-THAN ?auto_1388 ?auto_1385 ) ( GREATER-THAN ?auto_1388 ?auto_1387 ) ( IN-CITY ?auto_1392 ?auto_1390 ) ( IN-CITY ?auto_1386 ?auto_1390 ) ( not ( = ?auto_1386 ?auto_1392 ) ) ( OBJ-AT ?auto_1388 ?auto_1392 ) ( IN-CITY ?auto_1389 ?auto_1390 ) ( not ( = ?auto_1386 ?auto_1389 ) ) ( OBJ-AT ?auto_1387 ?auto_1389 ) ( IN-CITY ?auto_1393 ?auto_1390 ) ( not ( = ?auto_1386 ?auto_1393 ) ) ( OBJ-AT ?auto_1385 ?auto_1393 ) ( not ( = ?auto_1385 ?auto_1387 ) ) ( not ( = ?auto_1389 ?auto_1393 ) ) ( not ( = ?auto_1385 ?auto_1388 ) ) ( not ( = ?auto_1387 ?auto_1388 ) ) ( not ( = ?auto_1392 ?auto_1389 ) ) ( not ( = ?auto_1392 ?auto_1393 ) ) ( TRUCK-AT ?auto_1391 ?auto_1386 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1391 ?auto_1386 ?auto_1393 ?auto_1390 )
      ( DELIVER-3PKG ?auto_1385 ?auto_1387 ?auto_1388 ?auto_1386 )
      ( DELIVER-3PKG-VERIFY ?auto_1385 ?auto_1387 ?auto_1388 ?auto_1386 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1396 - OBJ
      ?auto_1397 - LOCATION
    )
    :vars
    (
      ?auto_1398 - TRUCK
      ?auto_1399 - LOCATION
      ?auto_1400 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_1398 ?auto_1399 ) ( IN-CITY ?auto_1399 ?auto_1400 ) ( IN-CITY ?auto_1397 ?auto_1400 ) ( not ( = ?auto_1397 ?auto_1399 ) ) ( OBJ-AT ?auto_1396 ?auto_1399 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_1396 ?auto_1398 ?auto_1399 )
      ( !DRIVE-TRUCK ?auto_1398 ?auto_1399 ?auto_1397 ?auto_1400 )
      ( !UNLOAD-TRUCK ?auto_1396 ?auto_1398 ?auto_1397 )
      ( DELIVER-1PKG-VERIFY ?auto_1396 ?auto_1397 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1403 - OBJ
      ?auto_1404 - LOCATION
    )
    :vars
    (
      ?auto_1407 - LOCATION
      ?auto_1405 - CITY
      ?auto_1406 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1407 ?auto_1405 ) ( IN-CITY ?auto_1404 ?auto_1405 ) ( not ( = ?auto_1404 ?auto_1407 ) ) ( OBJ-AT ?auto_1403 ?auto_1407 ) ( TRUCK-AT ?auto_1406 ?auto_1404 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1406 ?auto_1404 ?auto_1407 ?auto_1405 )
      ( DELIVER-1PKG ?auto_1403 ?auto_1404 )
      ( DELIVER-1PKG-VERIFY ?auto_1403 ?auto_1404 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_1413 - OBJ
      ?auto_1415 - OBJ
      ?auto_1416 - OBJ
      ?auto_1417 - OBJ
      ?auto_1414 - LOCATION
    )
    :vars
    (
      ?auto_1420 - LOCATION
      ?auto_1418 - CITY
      ?auto_1422 - LOCATION
      ?auto_1421 - LOCATION
      ?auto_1419 - TRUCK
      ?auto_1423 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1415 ?auto_1413 ) ( GREATER-THAN ?auto_1416 ?auto_1413 ) ( GREATER-THAN ?auto_1416 ?auto_1415 ) ( GREATER-THAN ?auto_1417 ?auto_1413 ) ( GREATER-THAN ?auto_1417 ?auto_1415 ) ( GREATER-THAN ?auto_1417 ?auto_1416 ) ( IN-CITY ?auto_1420 ?auto_1418 ) ( IN-CITY ?auto_1414 ?auto_1418 ) ( not ( = ?auto_1414 ?auto_1420 ) ) ( OBJ-AT ?auto_1417 ?auto_1420 ) ( IN-CITY ?auto_1422 ?auto_1418 ) ( not ( = ?auto_1414 ?auto_1422 ) ) ( OBJ-AT ?auto_1416 ?auto_1422 ) ( IN-CITY ?auto_1421 ?auto_1418 ) ( not ( = ?auto_1414 ?auto_1421 ) ) ( OBJ-AT ?auto_1415 ?auto_1421 ) ( TRUCK-AT ?auto_1419 ?auto_1423 ) ( IN-CITY ?auto_1423 ?auto_1418 ) ( not ( = ?auto_1414 ?auto_1423 ) ) ( OBJ-AT ?auto_1413 ?auto_1423 ) ( not ( = ?auto_1413 ?auto_1415 ) ) ( not ( = ?auto_1421 ?auto_1423 ) ) ( not ( = ?auto_1413 ?auto_1416 ) ) ( not ( = ?auto_1415 ?auto_1416 ) ) ( not ( = ?auto_1422 ?auto_1421 ) ) ( not ( = ?auto_1422 ?auto_1423 ) ) ( not ( = ?auto_1413 ?auto_1417 ) ) ( not ( = ?auto_1415 ?auto_1417 ) ) ( not ( = ?auto_1416 ?auto_1417 ) ) ( not ( = ?auto_1420 ?auto_1422 ) ) ( not ( = ?auto_1420 ?auto_1421 ) ) ( not ( = ?auto_1420 ?auto_1423 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_1413 ?auto_1415 ?auto_1416 ?auto_1414 )
      ( DELIVER-1PKG ?auto_1417 ?auto_1414 )
      ( DELIVER-4PKG-VERIFY ?auto_1413 ?auto_1415 ?auto_1416 ?auto_1417 ?auto_1414 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_1429 - OBJ
      ?auto_1431 - OBJ
      ?auto_1432 - OBJ
      ?auto_1433 - OBJ
      ?auto_1430 - LOCATION
    )
    :vars
    (
      ?auto_1436 - LOCATION
      ?auto_1438 - CITY
      ?auto_1437 - LOCATION
      ?auto_1439 - LOCATION
      ?auto_1434 - LOCATION
      ?auto_1435 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1431 ?auto_1429 ) ( GREATER-THAN ?auto_1432 ?auto_1429 ) ( GREATER-THAN ?auto_1432 ?auto_1431 ) ( GREATER-THAN ?auto_1433 ?auto_1429 ) ( GREATER-THAN ?auto_1433 ?auto_1431 ) ( GREATER-THAN ?auto_1433 ?auto_1432 ) ( IN-CITY ?auto_1436 ?auto_1438 ) ( IN-CITY ?auto_1430 ?auto_1438 ) ( not ( = ?auto_1430 ?auto_1436 ) ) ( OBJ-AT ?auto_1433 ?auto_1436 ) ( IN-CITY ?auto_1437 ?auto_1438 ) ( not ( = ?auto_1430 ?auto_1437 ) ) ( OBJ-AT ?auto_1432 ?auto_1437 ) ( IN-CITY ?auto_1439 ?auto_1438 ) ( not ( = ?auto_1430 ?auto_1439 ) ) ( OBJ-AT ?auto_1431 ?auto_1439 ) ( IN-CITY ?auto_1434 ?auto_1438 ) ( not ( = ?auto_1430 ?auto_1434 ) ) ( OBJ-AT ?auto_1429 ?auto_1434 ) ( not ( = ?auto_1429 ?auto_1431 ) ) ( not ( = ?auto_1439 ?auto_1434 ) ) ( not ( = ?auto_1429 ?auto_1432 ) ) ( not ( = ?auto_1431 ?auto_1432 ) ) ( not ( = ?auto_1437 ?auto_1439 ) ) ( not ( = ?auto_1437 ?auto_1434 ) ) ( not ( = ?auto_1429 ?auto_1433 ) ) ( not ( = ?auto_1431 ?auto_1433 ) ) ( not ( = ?auto_1432 ?auto_1433 ) ) ( not ( = ?auto_1436 ?auto_1437 ) ) ( not ( = ?auto_1436 ?auto_1439 ) ) ( not ( = ?auto_1436 ?auto_1434 ) ) ( TRUCK-AT ?auto_1435 ?auto_1430 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1435 ?auto_1430 ?auto_1434 ?auto_1438 )
      ( DELIVER-4PKG ?auto_1429 ?auto_1431 ?auto_1432 ?auto_1433 ?auto_1430 )
      ( DELIVER-4PKG-VERIFY ?auto_1429 ?auto_1431 ?auto_1432 ?auto_1433 ?auto_1430 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1442 - OBJ
      ?auto_1443 - LOCATION
    )
    :vars
    (
      ?auto_1444 - TRUCK
      ?auto_1445 - LOCATION
      ?auto_1446 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_1444 ?auto_1445 ) ( IN-CITY ?auto_1445 ?auto_1446 ) ( IN-CITY ?auto_1443 ?auto_1446 ) ( not ( = ?auto_1443 ?auto_1445 ) ) ( OBJ-AT ?auto_1442 ?auto_1445 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_1442 ?auto_1444 ?auto_1445 )
      ( !DRIVE-TRUCK ?auto_1444 ?auto_1445 ?auto_1443 ?auto_1446 )
      ( !UNLOAD-TRUCK ?auto_1442 ?auto_1444 ?auto_1443 )
      ( DELIVER-1PKG-VERIFY ?auto_1442 ?auto_1443 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1449 - OBJ
      ?auto_1450 - LOCATION
    )
    :vars
    (
      ?auto_1453 - LOCATION
      ?auto_1451 - CITY
      ?auto_1452 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1453 ?auto_1451 ) ( IN-CITY ?auto_1450 ?auto_1451 ) ( not ( = ?auto_1450 ?auto_1453 ) ) ( OBJ-AT ?auto_1449 ?auto_1453 ) ( TRUCK-AT ?auto_1452 ?auto_1450 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1452 ?auto_1450 ?auto_1453 ?auto_1451 )
      ( DELIVER-1PKG ?auto_1449 ?auto_1450 )
      ( DELIVER-1PKG-VERIFY ?auto_1449 ?auto_1450 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_1460 - OBJ
      ?auto_1462 - OBJ
      ?auto_1463 - OBJ
      ?auto_1465 - OBJ
      ?auto_1464 - OBJ
      ?auto_1461 - LOCATION
    )
    :vars
    (
      ?auto_1468 - LOCATION
      ?auto_1466 - CITY
      ?auto_1470 - LOCATION
      ?auto_1471 - LOCATION
      ?auto_1472 - LOCATION
      ?auto_1467 - TRUCK
      ?auto_1469 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1462 ?auto_1460 ) ( GREATER-THAN ?auto_1463 ?auto_1460 ) ( GREATER-THAN ?auto_1463 ?auto_1462 ) ( GREATER-THAN ?auto_1465 ?auto_1460 ) ( GREATER-THAN ?auto_1465 ?auto_1462 ) ( GREATER-THAN ?auto_1465 ?auto_1463 ) ( GREATER-THAN ?auto_1464 ?auto_1460 ) ( GREATER-THAN ?auto_1464 ?auto_1462 ) ( GREATER-THAN ?auto_1464 ?auto_1463 ) ( GREATER-THAN ?auto_1464 ?auto_1465 ) ( IN-CITY ?auto_1468 ?auto_1466 ) ( IN-CITY ?auto_1461 ?auto_1466 ) ( not ( = ?auto_1461 ?auto_1468 ) ) ( OBJ-AT ?auto_1464 ?auto_1468 ) ( IN-CITY ?auto_1470 ?auto_1466 ) ( not ( = ?auto_1461 ?auto_1470 ) ) ( OBJ-AT ?auto_1465 ?auto_1470 ) ( IN-CITY ?auto_1471 ?auto_1466 ) ( not ( = ?auto_1461 ?auto_1471 ) ) ( OBJ-AT ?auto_1463 ?auto_1471 ) ( IN-CITY ?auto_1472 ?auto_1466 ) ( not ( = ?auto_1461 ?auto_1472 ) ) ( OBJ-AT ?auto_1462 ?auto_1472 ) ( TRUCK-AT ?auto_1467 ?auto_1469 ) ( IN-CITY ?auto_1469 ?auto_1466 ) ( not ( = ?auto_1461 ?auto_1469 ) ) ( OBJ-AT ?auto_1460 ?auto_1469 ) ( not ( = ?auto_1460 ?auto_1462 ) ) ( not ( = ?auto_1472 ?auto_1469 ) ) ( not ( = ?auto_1460 ?auto_1463 ) ) ( not ( = ?auto_1462 ?auto_1463 ) ) ( not ( = ?auto_1471 ?auto_1472 ) ) ( not ( = ?auto_1471 ?auto_1469 ) ) ( not ( = ?auto_1460 ?auto_1465 ) ) ( not ( = ?auto_1462 ?auto_1465 ) ) ( not ( = ?auto_1463 ?auto_1465 ) ) ( not ( = ?auto_1470 ?auto_1471 ) ) ( not ( = ?auto_1470 ?auto_1472 ) ) ( not ( = ?auto_1470 ?auto_1469 ) ) ( not ( = ?auto_1460 ?auto_1464 ) ) ( not ( = ?auto_1462 ?auto_1464 ) ) ( not ( = ?auto_1463 ?auto_1464 ) ) ( not ( = ?auto_1465 ?auto_1464 ) ) ( not ( = ?auto_1468 ?auto_1470 ) ) ( not ( = ?auto_1468 ?auto_1471 ) ) ( not ( = ?auto_1468 ?auto_1472 ) ) ( not ( = ?auto_1468 ?auto_1469 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_1460 ?auto_1462 ?auto_1463 ?auto_1465 ?auto_1461 )
      ( DELIVER-1PKG ?auto_1464 ?auto_1461 )
      ( DELIVER-5PKG-VERIFY ?auto_1460 ?auto_1462 ?auto_1463 ?auto_1465 ?auto_1464 ?auto_1461 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_1479 - OBJ
      ?auto_1481 - OBJ
      ?auto_1482 - OBJ
      ?auto_1484 - OBJ
      ?auto_1483 - OBJ
      ?auto_1480 - LOCATION
    )
    :vars
    (
      ?auto_1489 - LOCATION
      ?auto_1485 - CITY
      ?auto_1490 - LOCATION
      ?auto_1486 - LOCATION
      ?auto_1487 - LOCATION
      ?auto_1488 - LOCATION
      ?auto_1491 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1481 ?auto_1479 ) ( GREATER-THAN ?auto_1482 ?auto_1479 ) ( GREATER-THAN ?auto_1482 ?auto_1481 ) ( GREATER-THAN ?auto_1484 ?auto_1479 ) ( GREATER-THAN ?auto_1484 ?auto_1481 ) ( GREATER-THAN ?auto_1484 ?auto_1482 ) ( GREATER-THAN ?auto_1483 ?auto_1479 ) ( GREATER-THAN ?auto_1483 ?auto_1481 ) ( GREATER-THAN ?auto_1483 ?auto_1482 ) ( GREATER-THAN ?auto_1483 ?auto_1484 ) ( IN-CITY ?auto_1489 ?auto_1485 ) ( IN-CITY ?auto_1480 ?auto_1485 ) ( not ( = ?auto_1480 ?auto_1489 ) ) ( OBJ-AT ?auto_1483 ?auto_1489 ) ( IN-CITY ?auto_1490 ?auto_1485 ) ( not ( = ?auto_1480 ?auto_1490 ) ) ( OBJ-AT ?auto_1484 ?auto_1490 ) ( IN-CITY ?auto_1486 ?auto_1485 ) ( not ( = ?auto_1480 ?auto_1486 ) ) ( OBJ-AT ?auto_1482 ?auto_1486 ) ( IN-CITY ?auto_1487 ?auto_1485 ) ( not ( = ?auto_1480 ?auto_1487 ) ) ( OBJ-AT ?auto_1481 ?auto_1487 ) ( IN-CITY ?auto_1488 ?auto_1485 ) ( not ( = ?auto_1480 ?auto_1488 ) ) ( OBJ-AT ?auto_1479 ?auto_1488 ) ( not ( = ?auto_1479 ?auto_1481 ) ) ( not ( = ?auto_1487 ?auto_1488 ) ) ( not ( = ?auto_1479 ?auto_1482 ) ) ( not ( = ?auto_1481 ?auto_1482 ) ) ( not ( = ?auto_1486 ?auto_1487 ) ) ( not ( = ?auto_1486 ?auto_1488 ) ) ( not ( = ?auto_1479 ?auto_1484 ) ) ( not ( = ?auto_1481 ?auto_1484 ) ) ( not ( = ?auto_1482 ?auto_1484 ) ) ( not ( = ?auto_1490 ?auto_1486 ) ) ( not ( = ?auto_1490 ?auto_1487 ) ) ( not ( = ?auto_1490 ?auto_1488 ) ) ( not ( = ?auto_1479 ?auto_1483 ) ) ( not ( = ?auto_1481 ?auto_1483 ) ) ( not ( = ?auto_1482 ?auto_1483 ) ) ( not ( = ?auto_1484 ?auto_1483 ) ) ( not ( = ?auto_1489 ?auto_1490 ) ) ( not ( = ?auto_1489 ?auto_1486 ) ) ( not ( = ?auto_1489 ?auto_1487 ) ) ( not ( = ?auto_1489 ?auto_1488 ) ) ( TRUCK-AT ?auto_1491 ?auto_1480 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1491 ?auto_1480 ?auto_1488 ?auto_1485 )
      ( DELIVER-5PKG ?auto_1479 ?auto_1481 ?auto_1482 ?auto_1484 ?auto_1483 ?auto_1480 )
      ( DELIVER-5PKG-VERIFY ?auto_1479 ?auto_1481 ?auto_1482 ?auto_1484 ?auto_1483 ?auto_1480 ) )
  )

)

