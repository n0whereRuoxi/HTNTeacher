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
      ?auto_1198 - OBJ
      ?auto_1197 - LOCATION
    )
    :vars
    (
      ?auto_1199 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_1199 ?auto_1197 ) ( IN-TRUCK ?auto_1198 ?auto_1199 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_1198 ?auto_1199 ?auto_1197 )
      ( DELIVER-1PKG-VERIFY ?auto_1198 ?auto_1197 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1210 - OBJ
      ?auto_1209 - LOCATION
    )
    :vars
    (
      ?auto_1211 - TRUCK
      ?auto_1212 - LOCATION
      ?auto_1213 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_1210 ?auto_1211 ) ( TRUCK-AT ?auto_1211 ?auto_1212 ) ( IN-CITY ?auto_1212 ?auto_1213 ) ( IN-CITY ?auto_1209 ?auto_1213 ) ( not ( = ?auto_1209 ?auto_1212 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1211 ?auto_1212 ?auto_1209 ?auto_1213 )
      ( DELIVER-1PKG ?auto_1210 ?auto_1209 )
      ( DELIVER-1PKG-VERIFY ?auto_1210 ?auto_1209 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1228 - OBJ
      ?auto_1227 - LOCATION
    )
    :vars
    (
      ?auto_1231 - TRUCK
      ?auto_1229 - LOCATION
      ?auto_1230 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_1231 ?auto_1229 ) ( IN-CITY ?auto_1229 ?auto_1230 ) ( IN-CITY ?auto_1227 ?auto_1230 ) ( not ( = ?auto_1227 ?auto_1229 ) ) ( OBJ-AT ?auto_1228 ?auto_1229 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_1228 ?auto_1231 ?auto_1229 )
      ( DELIVER-1PKG ?auto_1228 ?auto_1227 )
      ( DELIVER-1PKG-VERIFY ?auto_1228 ?auto_1227 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1246 - OBJ
      ?auto_1245 - LOCATION
    )
    :vars
    (
      ?auto_1248 - LOCATION
      ?auto_1247 - CITY
      ?auto_1249 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1248 ?auto_1247 ) ( IN-CITY ?auto_1245 ?auto_1247 ) ( not ( = ?auto_1245 ?auto_1248 ) ) ( OBJ-AT ?auto_1246 ?auto_1248 ) ( TRUCK-AT ?auto_1249 ?auto_1245 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1249 ?auto_1245 ?auto_1248 ?auto_1247 )
      ( DELIVER-1PKG ?auto_1246 ?auto_1245 )
      ( DELIVER-1PKG-VERIFY ?auto_1246 ?auto_1245 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1306 - OBJ
      ?auto_1307 - OBJ
      ?auto_1305 - LOCATION
    )
    :vars
    (
      ?auto_1308 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_1308 ?auto_1305 ) ( IN-TRUCK ?auto_1307 ?auto_1308 ) ( OBJ-AT ?auto_1306 ?auto_1305 ) ( not ( = ?auto_1306 ?auto_1307 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1307 ?auto_1305 )
      ( DELIVER-2PKG-VERIFY ?auto_1306 ?auto_1307 ?auto_1305 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1310 - OBJ
      ?auto_1311 - OBJ
      ?auto_1309 - LOCATION
    )
    :vars
    (
      ?auto_1312 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_1312 ?auto_1309 ) ( IN-TRUCK ?auto_1310 ?auto_1312 ) ( OBJ-AT ?auto_1311 ?auto_1309 ) ( not ( = ?auto_1310 ?auto_1311 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1310 ?auto_1309 )
      ( DELIVER-2PKG-VERIFY ?auto_1310 ?auto_1311 ?auto_1309 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1318 - OBJ
      ?auto_1319 - OBJ
      ?auto_1320 - OBJ
      ?auto_1317 - LOCATION
    )
    :vars
    (
      ?auto_1321 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_1321 ?auto_1317 ) ( IN-TRUCK ?auto_1320 ?auto_1321 ) ( OBJ-AT ?auto_1318 ?auto_1317 ) ( OBJ-AT ?auto_1319 ?auto_1317 ) ( not ( = ?auto_1318 ?auto_1319 ) ) ( not ( = ?auto_1318 ?auto_1320 ) ) ( not ( = ?auto_1319 ?auto_1320 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1320 ?auto_1317 )
      ( DELIVER-3PKG-VERIFY ?auto_1318 ?auto_1319 ?auto_1320 ?auto_1317 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1323 - OBJ
      ?auto_1324 - OBJ
      ?auto_1325 - OBJ
      ?auto_1322 - LOCATION
    )
    :vars
    (
      ?auto_1326 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_1326 ?auto_1322 ) ( IN-TRUCK ?auto_1324 ?auto_1326 ) ( OBJ-AT ?auto_1323 ?auto_1322 ) ( OBJ-AT ?auto_1325 ?auto_1322 ) ( not ( = ?auto_1323 ?auto_1324 ) ) ( not ( = ?auto_1323 ?auto_1325 ) ) ( not ( = ?auto_1324 ?auto_1325 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1324 ?auto_1322 )
      ( DELIVER-3PKG-VERIFY ?auto_1323 ?auto_1324 ?auto_1325 ?auto_1322 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1333 - OBJ
      ?auto_1334 - OBJ
      ?auto_1335 - OBJ
      ?auto_1332 - LOCATION
    )
    :vars
    (
      ?auto_1336 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_1336 ?auto_1332 ) ( IN-TRUCK ?auto_1333 ?auto_1336 ) ( OBJ-AT ?auto_1334 ?auto_1332 ) ( OBJ-AT ?auto_1335 ?auto_1332 ) ( not ( = ?auto_1333 ?auto_1334 ) ) ( not ( = ?auto_1333 ?auto_1335 ) ) ( not ( = ?auto_1334 ?auto_1335 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1333 ?auto_1332 )
      ( DELIVER-3PKG-VERIFY ?auto_1333 ?auto_1334 ?auto_1335 ?auto_1332 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1358 - OBJ
      ?auto_1359 - OBJ
      ?auto_1357 - LOCATION
    )
    :vars
    (
      ?auto_1361 - TRUCK
      ?auto_1360 - LOCATION
      ?auto_1362 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_1359 ?auto_1361 ) ( TRUCK-AT ?auto_1361 ?auto_1360 ) ( IN-CITY ?auto_1360 ?auto_1362 ) ( IN-CITY ?auto_1357 ?auto_1362 ) ( not ( = ?auto_1357 ?auto_1360 ) ) ( OBJ-AT ?auto_1358 ?auto_1357 ) ( not ( = ?auto_1358 ?auto_1359 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1359 ?auto_1357 )
      ( DELIVER-2PKG-VERIFY ?auto_1358 ?auto_1359 ?auto_1357 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1364 - OBJ
      ?auto_1365 - OBJ
      ?auto_1363 - LOCATION
    )
    :vars
    (
      ?auto_1366 - TRUCK
      ?auto_1368 - LOCATION
      ?auto_1367 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_1364 ?auto_1366 ) ( TRUCK-AT ?auto_1366 ?auto_1368 ) ( IN-CITY ?auto_1368 ?auto_1367 ) ( IN-CITY ?auto_1363 ?auto_1367 ) ( not ( = ?auto_1363 ?auto_1368 ) ) ( OBJ-AT ?auto_1365 ?auto_1363 ) ( not ( = ?auto_1365 ?auto_1364 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1365 ?auto_1364 ?auto_1363 )
      ( DELIVER-2PKG-VERIFY ?auto_1364 ?auto_1365 ?auto_1363 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1377 - OBJ
      ?auto_1378 - OBJ
      ?auto_1379 - OBJ
      ?auto_1376 - LOCATION
    )
    :vars
    (
      ?auto_1380 - TRUCK
      ?auto_1382 - LOCATION
      ?auto_1381 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_1379 ?auto_1380 ) ( TRUCK-AT ?auto_1380 ?auto_1382 ) ( IN-CITY ?auto_1382 ?auto_1381 ) ( IN-CITY ?auto_1376 ?auto_1381 ) ( not ( = ?auto_1376 ?auto_1382 ) ) ( OBJ-AT ?auto_1378 ?auto_1376 ) ( not ( = ?auto_1378 ?auto_1379 ) ) ( OBJ-AT ?auto_1377 ?auto_1376 ) ( not ( = ?auto_1377 ?auto_1378 ) ) ( not ( = ?auto_1377 ?auto_1379 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1378 ?auto_1379 ?auto_1376 )
      ( DELIVER-3PKG-VERIFY ?auto_1377 ?auto_1378 ?auto_1379 ?auto_1376 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1384 - OBJ
      ?auto_1385 - OBJ
      ?auto_1386 - OBJ
      ?auto_1383 - LOCATION
    )
    :vars
    (
      ?auto_1387 - TRUCK
      ?auto_1389 - LOCATION
      ?auto_1388 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_1385 ?auto_1387 ) ( TRUCK-AT ?auto_1387 ?auto_1389 ) ( IN-CITY ?auto_1389 ?auto_1388 ) ( IN-CITY ?auto_1383 ?auto_1388 ) ( not ( = ?auto_1383 ?auto_1389 ) ) ( OBJ-AT ?auto_1386 ?auto_1383 ) ( not ( = ?auto_1386 ?auto_1385 ) ) ( OBJ-AT ?auto_1384 ?auto_1383 ) ( not ( = ?auto_1384 ?auto_1385 ) ) ( not ( = ?auto_1384 ?auto_1386 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1386 ?auto_1385 ?auto_1383 )
      ( DELIVER-3PKG-VERIFY ?auto_1384 ?auto_1385 ?auto_1386 ?auto_1383 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1398 - OBJ
      ?auto_1399 - OBJ
      ?auto_1400 - OBJ
      ?auto_1397 - LOCATION
    )
    :vars
    (
      ?auto_1401 - TRUCK
      ?auto_1403 - LOCATION
      ?auto_1402 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_1398 ?auto_1401 ) ( TRUCK-AT ?auto_1401 ?auto_1403 ) ( IN-CITY ?auto_1403 ?auto_1402 ) ( IN-CITY ?auto_1397 ?auto_1402 ) ( not ( = ?auto_1397 ?auto_1403 ) ) ( OBJ-AT ?auto_1399 ?auto_1397 ) ( not ( = ?auto_1399 ?auto_1398 ) ) ( OBJ-AT ?auto_1400 ?auto_1397 ) ( not ( = ?auto_1398 ?auto_1400 ) ) ( not ( = ?auto_1399 ?auto_1400 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1399 ?auto_1398 ?auto_1397 )
      ( DELIVER-3PKG-VERIFY ?auto_1398 ?auto_1399 ?auto_1400 ?auto_1397 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1427 - OBJ
      ?auto_1426 - LOCATION
    )
    :vars
    (
      ?auto_1428 - TRUCK
      ?auto_1430 - LOCATION
      ?auto_1429 - CITY
      ?auto_1431 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_1428 ?auto_1430 ) ( IN-CITY ?auto_1430 ?auto_1429 ) ( IN-CITY ?auto_1426 ?auto_1429 ) ( not ( = ?auto_1426 ?auto_1430 ) ) ( OBJ-AT ?auto_1431 ?auto_1426 ) ( not ( = ?auto_1431 ?auto_1427 ) ) ( OBJ-AT ?auto_1427 ?auto_1430 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_1427 ?auto_1428 ?auto_1430 )
      ( DELIVER-2PKG ?auto_1431 ?auto_1427 ?auto_1426 )
      ( DELIVER-1PKG-VERIFY ?auto_1427 ?auto_1426 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1433 - OBJ
      ?auto_1434 - OBJ
      ?auto_1432 - LOCATION
    )
    :vars
    (
      ?auto_1437 - TRUCK
      ?auto_1435 - LOCATION
      ?auto_1436 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_1437 ?auto_1435 ) ( IN-CITY ?auto_1435 ?auto_1436 ) ( IN-CITY ?auto_1432 ?auto_1436 ) ( not ( = ?auto_1432 ?auto_1435 ) ) ( OBJ-AT ?auto_1433 ?auto_1432 ) ( not ( = ?auto_1433 ?auto_1434 ) ) ( OBJ-AT ?auto_1434 ?auto_1435 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1434 ?auto_1432 )
      ( DELIVER-2PKG-VERIFY ?auto_1433 ?auto_1434 ?auto_1432 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1439 - OBJ
      ?auto_1440 - OBJ
      ?auto_1438 - LOCATION
    )
    :vars
    (
      ?auto_1443 - TRUCK
      ?auto_1441 - LOCATION
      ?auto_1442 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_1443 ?auto_1441 ) ( IN-CITY ?auto_1441 ?auto_1442 ) ( IN-CITY ?auto_1438 ?auto_1442 ) ( not ( = ?auto_1438 ?auto_1441 ) ) ( OBJ-AT ?auto_1440 ?auto_1438 ) ( not ( = ?auto_1440 ?auto_1439 ) ) ( OBJ-AT ?auto_1439 ?auto_1441 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1440 ?auto_1439 ?auto_1438 )
      ( DELIVER-2PKG-VERIFY ?auto_1439 ?auto_1440 ?auto_1438 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1452 - OBJ
      ?auto_1453 - OBJ
      ?auto_1454 - OBJ
      ?auto_1451 - LOCATION
    )
    :vars
    (
      ?auto_1457 - TRUCK
      ?auto_1455 - LOCATION
      ?auto_1456 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_1457 ?auto_1455 ) ( IN-CITY ?auto_1455 ?auto_1456 ) ( IN-CITY ?auto_1451 ?auto_1456 ) ( not ( = ?auto_1451 ?auto_1455 ) ) ( OBJ-AT ?auto_1453 ?auto_1451 ) ( not ( = ?auto_1453 ?auto_1454 ) ) ( OBJ-AT ?auto_1454 ?auto_1455 ) ( OBJ-AT ?auto_1452 ?auto_1451 ) ( not ( = ?auto_1452 ?auto_1453 ) ) ( not ( = ?auto_1452 ?auto_1454 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1453 ?auto_1454 ?auto_1451 )
      ( DELIVER-3PKG-VERIFY ?auto_1452 ?auto_1453 ?auto_1454 ?auto_1451 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1459 - OBJ
      ?auto_1460 - OBJ
      ?auto_1461 - OBJ
      ?auto_1458 - LOCATION
    )
    :vars
    (
      ?auto_1464 - TRUCK
      ?auto_1462 - LOCATION
      ?auto_1463 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_1464 ?auto_1462 ) ( IN-CITY ?auto_1462 ?auto_1463 ) ( IN-CITY ?auto_1458 ?auto_1463 ) ( not ( = ?auto_1458 ?auto_1462 ) ) ( OBJ-AT ?auto_1461 ?auto_1458 ) ( not ( = ?auto_1461 ?auto_1460 ) ) ( OBJ-AT ?auto_1460 ?auto_1462 ) ( OBJ-AT ?auto_1459 ?auto_1458 ) ( not ( = ?auto_1459 ?auto_1460 ) ) ( not ( = ?auto_1459 ?auto_1461 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1461 ?auto_1460 ?auto_1458 )
      ( DELIVER-3PKG-VERIFY ?auto_1459 ?auto_1460 ?auto_1461 ?auto_1458 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1473 - OBJ
      ?auto_1474 - OBJ
      ?auto_1475 - OBJ
      ?auto_1472 - LOCATION
    )
    :vars
    (
      ?auto_1478 - TRUCK
      ?auto_1476 - LOCATION
      ?auto_1477 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_1478 ?auto_1476 ) ( IN-CITY ?auto_1476 ?auto_1477 ) ( IN-CITY ?auto_1472 ?auto_1477 ) ( not ( = ?auto_1472 ?auto_1476 ) ) ( OBJ-AT ?auto_1475 ?auto_1472 ) ( not ( = ?auto_1475 ?auto_1473 ) ) ( OBJ-AT ?auto_1473 ?auto_1476 ) ( OBJ-AT ?auto_1474 ?auto_1472 ) ( not ( = ?auto_1473 ?auto_1474 ) ) ( not ( = ?auto_1474 ?auto_1475 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1475 ?auto_1473 ?auto_1472 )
      ( DELIVER-3PKG-VERIFY ?auto_1473 ?auto_1474 ?auto_1475 ?auto_1472 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1502 - OBJ
      ?auto_1501 - LOCATION
    )
    :vars
    (
      ?auto_1503 - LOCATION
      ?auto_1504 - CITY
      ?auto_1506 - OBJ
      ?auto_1505 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1503 ?auto_1504 ) ( IN-CITY ?auto_1501 ?auto_1504 ) ( not ( = ?auto_1501 ?auto_1503 ) ) ( OBJ-AT ?auto_1506 ?auto_1501 ) ( not ( = ?auto_1506 ?auto_1502 ) ) ( OBJ-AT ?auto_1502 ?auto_1503 ) ( TRUCK-AT ?auto_1505 ?auto_1501 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1505 ?auto_1501 ?auto_1503 ?auto_1504 )
      ( DELIVER-2PKG ?auto_1506 ?auto_1502 ?auto_1501 )
      ( DELIVER-1PKG-VERIFY ?auto_1502 ?auto_1501 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1508 - OBJ
      ?auto_1509 - OBJ
      ?auto_1507 - LOCATION
    )
    :vars
    (
      ?auto_1510 - LOCATION
      ?auto_1512 - CITY
      ?auto_1511 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1510 ?auto_1512 ) ( IN-CITY ?auto_1507 ?auto_1512 ) ( not ( = ?auto_1507 ?auto_1510 ) ) ( OBJ-AT ?auto_1508 ?auto_1507 ) ( not ( = ?auto_1508 ?auto_1509 ) ) ( OBJ-AT ?auto_1509 ?auto_1510 ) ( TRUCK-AT ?auto_1511 ?auto_1507 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1509 ?auto_1507 )
      ( DELIVER-2PKG-VERIFY ?auto_1508 ?auto_1509 ?auto_1507 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1514 - OBJ
      ?auto_1515 - OBJ
      ?auto_1513 - LOCATION
    )
    :vars
    (
      ?auto_1518 - LOCATION
      ?auto_1516 - CITY
      ?auto_1517 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1518 ?auto_1516 ) ( IN-CITY ?auto_1513 ?auto_1516 ) ( not ( = ?auto_1513 ?auto_1518 ) ) ( OBJ-AT ?auto_1515 ?auto_1513 ) ( not ( = ?auto_1515 ?auto_1514 ) ) ( OBJ-AT ?auto_1514 ?auto_1518 ) ( TRUCK-AT ?auto_1517 ?auto_1513 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1515 ?auto_1514 ?auto_1513 )
      ( DELIVER-2PKG-VERIFY ?auto_1514 ?auto_1515 ?auto_1513 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1527 - OBJ
      ?auto_1528 - OBJ
      ?auto_1529 - OBJ
      ?auto_1526 - LOCATION
    )
    :vars
    (
      ?auto_1532 - LOCATION
      ?auto_1530 - CITY
      ?auto_1531 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1532 ?auto_1530 ) ( IN-CITY ?auto_1526 ?auto_1530 ) ( not ( = ?auto_1526 ?auto_1532 ) ) ( OBJ-AT ?auto_1528 ?auto_1526 ) ( not ( = ?auto_1528 ?auto_1529 ) ) ( OBJ-AT ?auto_1529 ?auto_1532 ) ( TRUCK-AT ?auto_1531 ?auto_1526 ) ( OBJ-AT ?auto_1527 ?auto_1526 ) ( not ( = ?auto_1527 ?auto_1528 ) ) ( not ( = ?auto_1527 ?auto_1529 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1528 ?auto_1529 ?auto_1526 )
      ( DELIVER-3PKG-VERIFY ?auto_1527 ?auto_1528 ?auto_1529 ?auto_1526 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1534 - OBJ
      ?auto_1535 - OBJ
      ?auto_1536 - OBJ
      ?auto_1533 - LOCATION
    )
    :vars
    (
      ?auto_1539 - LOCATION
      ?auto_1537 - CITY
      ?auto_1538 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1539 ?auto_1537 ) ( IN-CITY ?auto_1533 ?auto_1537 ) ( not ( = ?auto_1533 ?auto_1539 ) ) ( OBJ-AT ?auto_1534 ?auto_1533 ) ( not ( = ?auto_1534 ?auto_1535 ) ) ( OBJ-AT ?auto_1535 ?auto_1539 ) ( TRUCK-AT ?auto_1538 ?auto_1533 ) ( OBJ-AT ?auto_1536 ?auto_1533 ) ( not ( = ?auto_1534 ?auto_1536 ) ) ( not ( = ?auto_1535 ?auto_1536 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1534 ?auto_1535 ?auto_1533 )
      ( DELIVER-3PKG-VERIFY ?auto_1534 ?auto_1535 ?auto_1536 ?auto_1533 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1548 - OBJ
      ?auto_1549 - OBJ
      ?auto_1550 - OBJ
      ?auto_1547 - LOCATION
    )
    :vars
    (
      ?auto_1553 - LOCATION
      ?auto_1551 - CITY
      ?auto_1552 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1553 ?auto_1551 ) ( IN-CITY ?auto_1547 ?auto_1551 ) ( not ( = ?auto_1547 ?auto_1553 ) ) ( OBJ-AT ?auto_1550 ?auto_1547 ) ( not ( = ?auto_1550 ?auto_1548 ) ) ( OBJ-AT ?auto_1548 ?auto_1553 ) ( TRUCK-AT ?auto_1552 ?auto_1547 ) ( OBJ-AT ?auto_1549 ?auto_1547 ) ( not ( = ?auto_1548 ?auto_1549 ) ) ( not ( = ?auto_1549 ?auto_1550 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1550 ?auto_1548 ?auto_1547 )
      ( DELIVER-3PKG-VERIFY ?auto_1548 ?auto_1549 ?auto_1550 ?auto_1547 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1577 - OBJ
      ?auto_1576 - LOCATION
    )
    :vars
    (
      ?auto_1580 - LOCATION
      ?auto_1578 - CITY
      ?auto_1581 - OBJ
      ?auto_1579 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1580 ?auto_1578 ) ( IN-CITY ?auto_1576 ?auto_1578 ) ( not ( = ?auto_1576 ?auto_1580 ) ) ( not ( = ?auto_1581 ?auto_1577 ) ) ( OBJ-AT ?auto_1577 ?auto_1580 ) ( TRUCK-AT ?auto_1579 ?auto_1576 ) ( IN-TRUCK ?auto_1581 ?auto_1579 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1581 ?auto_1576 )
      ( DELIVER-2PKG ?auto_1581 ?auto_1577 ?auto_1576 )
      ( DELIVER-1PKG-VERIFY ?auto_1577 ?auto_1576 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1583 - OBJ
      ?auto_1584 - OBJ
      ?auto_1582 - LOCATION
    )
    :vars
    (
      ?auto_1587 - LOCATION
      ?auto_1585 - CITY
      ?auto_1586 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1587 ?auto_1585 ) ( IN-CITY ?auto_1582 ?auto_1585 ) ( not ( = ?auto_1582 ?auto_1587 ) ) ( not ( = ?auto_1583 ?auto_1584 ) ) ( OBJ-AT ?auto_1584 ?auto_1587 ) ( TRUCK-AT ?auto_1586 ?auto_1582 ) ( IN-TRUCK ?auto_1583 ?auto_1586 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1584 ?auto_1582 )
      ( DELIVER-2PKG-VERIFY ?auto_1583 ?auto_1584 ?auto_1582 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1589 - OBJ
      ?auto_1590 - OBJ
      ?auto_1588 - LOCATION
    )
    :vars
    (
      ?auto_1592 - LOCATION
      ?auto_1593 - CITY
      ?auto_1591 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1592 ?auto_1593 ) ( IN-CITY ?auto_1588 ?auto_1593 ) ( not ( = ?auto_1588 ?auto_1592 ) ) ( not ( = ?auto_1590 ?auto_1589 ) ) ( OBJ-AT ?auto_1589 ?auto_1592 ) ( TRUCK-AT ?auto_1591 ?auto_1588 ) ( IN-TRUCK ?auto_1590 ?auto_1591 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1590 ?auto_1589 ?auto_1588 )
      ( DELIVER-2PKG-VERIFY ?auto_1589 ?auto_1590 ?auto_1588 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1652 - OBJ
      ?auto_1651 - LOCATION
    )
    :vars
    (
      ?auto_1654 - LOCATION
      ?auto_1655 - CITY
      ?auto_1656 - OBJ
      ?auto_1653 - TRUCK
      ?auto_1657 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_1654 ?auto_1655 ) ( IN-CITY ?auto_1651 ?auto_1655 ) ( not ( = ?auto_1651 ?auto_1654 ) ) ( not ( = ?auto_1656 ?auto_1652 ) ) ( OBJ-AT ?auto_1652 ?auto_1654 ) ( IN-TRUCK ?auto_1656 ?auto_1653 ) ( TRUCK-AT ?auto_1653 ?auto_1657 ) ( IN-CITY ?auto_1657 ?auto_1655 ) ( not ( = ?auto_1651 ?auto_1657 ) ) ( not ( = ?auto_1654 ?auto_1657 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1653 ?auto_1657 ?auto_1651 ?auto_1655 )
      ( DELIVER-2PKG ?auto_1656 ?auto_1652 ?auto_1651 )
      ( DELIVER-1PKG-VERIFY ?auto_1652 ?auto_1651 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1659 - OBJ
      ?auto_1660 - OBJ
      ?auto_1658 - LOCATION
    )
    :vars
    (
      ?auto_1661 - LOCATION
      ?auto_1662 - CITY
      ?auto_1663 - TRUCK
      ?auto_1664 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_1661 ?auto_1662 ) ( IN-CITY ?auto_1658 ?auto_1662 ) ( not ( = ?auto_1658 ?auto_1661 ) ) ( not ( = ?auto_1659 ?auto_1660 ) ) ( OBJ-AT ?auto_1660 ?auto_1661 ) ( IN-TRUCK ?auto_1659 ?auto_1663 ) ( TRUCK-AT ?auto_1663 ?auto_1664 ) ( IN-CITY ?auto_1664 ?auto_1662 ) ( not ( = ?auto_1658 ?auto_1664 ) ) ( not ( = ?auto_1661 ?auto_1664 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1660 ?auto_1658 )
      ( DELIVER-2PKG-VERIFY ?auto_1659 ?auto_1660 ?auto_1658 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1666 - OBJ
      ?auto_1667 - OBJ
      ?auto_1665 - LOCATION
    )
    :vars
    (
      ?auto_1668 - LOCATION
      ?auto_1671 - CITY
      ?auto_1669 - TRUCK
      ?auto_1670 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_1668 ?auto_1671 ) ( IN-CITY ?auto_1665 ?auto_1671 ) ( not ( = ?auto_1665 ?auto_1668 ) ) ( not ( = ?auto_1667 ?auto_1666 ) ) ( OBJ-AT ?auto_1666 ?auto_1668 ) ( IN-TRUCK ?auto_1667 ?auto_1669 ) ( TRUCK-AT ?auto_1669 ?auto_1670 ) ( IN-CITY ?auto_1670 ?auto_1671 ) ( not ( = ?auto_1665 ?auto_1670 ) ) ( not ( = ?auto_1668 ?auto_1670 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1667 ?auto_1666 ?auto_1665 )
      ( DELIVER-2PKG-VERIFY ?auto_1666 ?auto_1667 ?auto_1665 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1738 - OBJ
      ?auto_1737 - LOCATION
    )
    :vars
    (
      ?auto_1739 - LOCATION
      ?auto_1742 - CITY
      ?auto_1743 - OBJ
      ?auto_1740 - TRUCK
      ?auto_1741 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_1739 ?auto_1742 ) ( IN-CITY ?auto_1737 ?auto_1742 ) ( not ( = ?auto_1737 ?auto_1739 ) ) ( not ( = ?auto_1743 ?auto_1738 ) ) ( OBJ-AT ?auto_1738 ?auto_1739 ) ( TRUCK-AT ?auto_1740 ?auto_1741 ) ( IN-CITY ?auto_1741 ?auto_1742 ) ( not ( = ?auto_1737 ?auto_1741 ) ) ( not ( = ?auto_1739 ?auto_1741 ) ) ( OBJ-AT ?auto_1743 ?auto_1741 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_1743 ?auto_1740 ?auto_1741 )
      ( DELIVER-2PKG ?auto_1743 ?auto_1738 ?auto_1737 )
      ( DELIVER-1PKG-VERIFY ?auto_1738 ?auto_1737 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1745 - OBJ
      ?auto_1746 - OBJ
      ?auto_1744 - LOCATION
    )
    :vars
    (
      ?auto_1748 - LOCATION
      ?auto_1749 - CITY
      ?auto_1747 - TRUCK
      ?auto_1750 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_1748 ?auto_1749 ) ( IN-CITY ?auto_1744 ?auto_1749 ) ( not ( = ?auto_1744 ?auto_1748 ) ) ( not ( = ?auto_1745 ?auto_1746 ) ) ( OBJ-AT ?auto_1746 ?auto_1748 ) ( TRUCK-AT ?auto_1747 ?auto_1750 ) ( IN-CITY ?auto_1750 ?auto_1749 ) ( not ( = ?auto_1744 ?auto_1750 ) ) ( not ( = ?auto_1748 ?auto_1750 ) ) ( OBJ-AT ?auto_1745 ?auto_1750 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1746 ?auto_1744 )
      ( DELIVER-2PKG-VERIFY ?auto_1745 ?auto_1746 ?auto_1744 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1752 - OBJ
      ?auto_1753 - OBJ
      ?auto_1751 - LOCATION
    )
    :vars
    (
      ?auto_1755 - LOCATION
      ?auto_1754 - CITY
      ?auto_1756 - TRUCK
      ?auto_1757 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_1755 ?auto_1754 ) ( IN-CITY ?auto_1751 ?auto_1754 ) ( not ( = ?auto_1751 ?auto_1755 ) ) ( not ( = ?auto_1753 ?auto_1752 ) ) ( OBJ-AT ?auto_1752 ?auto_1755 ) ( TRUCK-AT ?auto_1756 ?auto_1757 ) ( IN-CITY ?auto_1757 ?auto_1754 ) ( not ( = ?auto_1751 ?auto_1757 ) ) ( not ( = ?auto_1755 ?auto_1757 ) ) ( OBJ-AT ?auto_1753 ?auto_1757 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1753 ?auto_1752 ?auto_1751 )
      ( DELIVER-2PKG-VERIFY ?auto_1752 ?auto_1753 ?auto_1751 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2137 - OBJ
      ?auto_2138 - OBJ
      ?auto_2139 - OBJ
      ?auto_2136 - LOCATION
    )
    :vars
    (
      ?auto_2142 - TRUCK
      ?auto_2141 - LOCATION
      ?auto_2140 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_2138 ?auto_2142 ) ( TRUCK-AT ?auto_2142 ?auto_2141 ) ( IN-CITY ?auto_2141 ?auto_2140 ) ( IN-CITY ?auto_2136 ?auto_2140 ) ( not ( = ?auto_2136 ?auto_2141 ) ) ( OBJ-AT ?auto_2137 ?auto_2136 ) ( not ( = ?auto_2137 ?auto_2138 ) ) ( OBJ-AT ?auto_2139 ?auto_2136 ) ( not ( = ?auto_2137 ?auto_2139 ) ) ( not ( = ?auto_2138 ?auto_2139 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2137 ?auto_2138 ?auto_2136 )
      ( DELIVER-3PKG-VERIFY ?auto_2137 ?auto_2138 ?auto_2139 ?auto_2136 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2159 - OBJ
      ?auto_2160 - OBJ
      ?auto_2161 - OBJ
      ?auto_2158 - LOCATION
    )
    :vars
    (
      ?auto_2165 - TRUCK
      ?auto_2163 - LOCATION
      ?auto_2162 - CITY
      ?auto_2164 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_2161 ?auto_2165 ) ( TRUCK-AT ?auto_2165 ?auto_2163 ) ( IN-CITY ?auto_2163 ?auto_2162 ) ( IN-CITY ?auto_2158 ?auto_2162 ) ( not ( = ?auto_2158 ?auto_2163 ) ) ( OBJ-AT ?auto_2164 ?auto_2158 ) ( not ( = ?auto_2164 ?auto_2161 ) ) ( OBJ-AT ?auto_2159 ?auto_2158 ) ( OBJ-AT ?auto_2160 ?auto_2158 ) ( not ( = ?auto_2159 ?auto_2160 ) ) ( not ( = ?auto_2159 ?auto_2161 ) ) ( not ( = ?auto_2159 ?auto_2164 ) ) ( not ( = ?auto_2160 ?auto_2161 ) ) ( not ( = ?auto_2160 ?auto_2164 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2164 ?auto_2161 ?auto_2158 )
      ( DELIVER-3PKG-VERIFY ?auto_2159 ?auto_2160 ?auto_2161 ?auto_2158 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2171 - OBJ
      ?auto_2172 - OBJ
      ?auto_2173 - OBJ
      ?auto_2170 - LOCATION
    )
    :vars
    (
      ?auto_2177 - TRUCK
      ?auto_2175 - LOCATION
      ?auto_2174 - CITY
      ?auto_2176 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_2172 ?auto_2177 ) ( TRUCK-AT ?auto_2177 ?auto_2175 ) ( IN-CITY ?auto_2175 ?auto_2174 ) ( IN-CITY ?auto_2170 ?auto_2174 ) ( not ( = ?auto_2170 ?auto_2175 ) ) ( OBJ-AT ?auto_2176 ?auto_2170 ) ( not ( = ?auto_2176 ?auto_2172 ) ) ( OBJ-AT ?auto_2171 ?auto_2170 ) ( OBJ-AT ?auto_2173 ?auto_2170 ) ( not ( = ?auto_2171 ?auto_2172 ) ) ( not ( = ?auto_2171 ?auto_2173 ) ) ( not ( = ?auto_2171 ?auto_2176 ) ) ( not ( = ?auto_2172 ?auto_2173 ) ) ( not ( = ?auto_2173 ?auto_2176 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2176 ?auto_2172 ?auto_2170 )
      ( DELIVER-3PKG-VERIFY ?auto_2171 ?auto_2172 ?auto_2173 ?auto_2170 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2209 - OBJ
      ?auto_2210 - OBJ
      ?auto_2211 - OBJ
      ?auto_2208 - LOCATION
    )
    :vars
    (
      ?auto_2215 - TRUCK
      ?auto_2213 - LOCATION
      ?auto_2212 - CITY
      ?auto_2214 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_2209 ?auto_2215 ) ( TRUCK-AT ?auto_2215 ?auto_2213 ) ( IN-CITY ?auto_2213 ?auto_2212 ) ( IN-CITY ?auto_2208 ?auto_2212 ) ( not ( = ?auto_2208 ?auto_2213 ) ) ( OBJ-AT ?auto_2214 ?auto_2208 ) ( not ( = ?auto_2214 ?auto_2209 ) ) ( OBJ-AT ?auto_2210 ?auto_2208 ) ( OBJ-AT ?auto_2211 ?auto_2208 ) ( not ( = ?auto_2209 ?auto_2210 ) ) ( not ( = ?auto_2209 ?auto_2211 ) ) ( not ( = ?auto_2210 ?auto_2211 ) ) ( not ( = ?auto_2210 ?auto_2214 ) ) ( not ( = ?auto_2211 ?auto_2214 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2214 ?auto_2209 ?auto_2208 )
      ( DELIVER-3PKG-VERIFY ?auto_2209 ?auto_2210 ?auto_2211 ?auto_2208 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2279 - OBJ
      ?auto_2280 - OBJ
      ?auto_2281 - OBJ
      ?auto_2278 - LOCATION
    )
    :vars
    (
      ?auto_2282 - TRUCK
      ?auto_2283 - LOCATION
      ?auto_2284 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_2282 ?auto_2283 ) ( IN-CITY ?auto_2283 ?auto_2284 ) ( IN-CITY ?auto_2278 ?auto_2284 ) ( not ( = ?auto_2278 ?auto_2283 ) ) ( OBJ-AT ?auto_2279 ?auto_2278 ) ( not ( = ?auto_2279 ?auto_2281 ) ) ( OBJ-AT ?auto_2281 ?auto_2283 ) ( OBJ-AT ?auto_2280 ?auto_2278 ) ( not ( = ?auto_2279 ?auto_2280 ) ) ( not ( = ?auto_2280 ?auto_2281 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2279 ?auto_2281 ?auto_2278 )
      ( DELIVER-3PKG-VERIFY ?auto_2279 ?auto_2280 ?auto_2281 ?auto_2278 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2312 - OBJ
      ?auto_2313 - OBJ
      ?auto_2314 - OBJ
      ?auto_2311 - LOCATION
    )
    :vars
    (
      ?auto_2315 - TRUCK
      ?auto_2316 - LOCATION
      ?auto_2317 - CITY
      ?auto_2318 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_2315 ?auto_2316 ) ( IN-CITY ?auto_2316 ?auto_2317 ) ( IN-CITY ?auto_2311 ?auto_2317 ) ( not ( = ?auto_2311 ?auto_2316 ) ) ( OBJ-AT ?auto_2318 ?auto_2311 ) ( not ( = ?auto_2318 ?auto_2314 ) ) ( OBJ-AT ?auto_2314 ?auto_2316 ) ( OBJ-AT ?auto_2312 ?auto_2311 ) ( OBJ-AT ?auto_2313 ?auto_2311 ) ( not ( = ?auto_2312 ?auto_2313 ) ) ( not ( = ?auto_2312 ?auto_2314 ) ) ( not ( = ?auto_2312 ?auto_2318 ) ) ( not ( = ?auto_2313 ?auto_2314 ) ) ( not ( = ?auto_2313 ?auto_2318 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2318 ?auto_2314 ?auto_2311 )
      ( DELIVER-3PKG-VERIFY ?auto_2312 ?auto_2313 ?auto_2314 ?auto_2311 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2324 - OBJ
      ?auto_2325 - OBJ
      ?auto_2326 - OBJ
      ?auto_2323 - LOCATION
    )
    :vars
    (
      ?auto_2327 - TRUCK
      ?auto_2328 - LOCATION
      ?auto_2329 - CITY
      ?auto_2330 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_2327 ?auto_2328 ) ( IN-CITY ?auto_2328 ?auto_2329 ) ( IN-CITY ?auto_2323 ?auto_2329 ) ( not ( = ?auto_2323 ?auto_2328 ) ) ( OBJ-AT ?auto_2330 ?auto_2323 ) ( not ( = ?auto_2330 ?auto_2325 ) ) ( OBJ-AT ?auto_2325 ?auto_2328 ) ( OBJ-AT ?auto_2324 ?auto_2323 ) ( OBJ-AT ?auto_2326 ?auto_2323 ) ( not ( = ?auto_2324 ?auto_2325 ) ) ( not ( = ?auto_2324 ?auto_2326 ) ) ( not ( = ?auto_2324 ?auto_2330 ) ) ( not ( = ?auto_2325 ?auto_2326 ) ) ( not ( = ?auto_2326 ?auto_2330 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2330 ?auto_2325 ?auto_2323 )
      ( DELIVER-3PKG-VERIFY ?auto_2324 ?auto_2325 ?auto_2326 ?auto_2323 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2340 - OBJ
      ?auto_2341 - OBJ
      ?auto_2342 - OBJ
      ?auto_2339 - LOCATION
    )
    :vars
    (
      ?auto_2343 - TRUCK
      ?auto_2344 - LOCATION
      ?auto_2345 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_2343 ?auto_2344 ) ( IN-CITY ?auto_2344 ?auto_2345 ) ( IN-CITY ?auto_2339 ?auto_2345 ) ( not ( = ?auto_2339 ?auto_2344 ) ) ( OBJ-AT ?auto_2341 ?auto_2339 ) ( not ( = ?auto_2341 ?auto_2340 ) ) ( OBJ-AT ?auto_2340 ?auto_2344 ) ( OBJ-AT ?auto_2342 ?auto_2339 ) ( not ( = ?auto_2340 ?auto_2342 ) ) ( not ( = ?auto_2341 ?auto_2342 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2341 ?auto_2340 ?auto_2339 )
      ( DELIVER-3PKG-VERIFY ?auto_2340 ?auto_2341 ?auto_2342 ?auto_2339 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2362 - OBJ
      ?auto_2363 - OBJ
      ?auto_2364 - OBJ
      ?auto_2361 - LOCATION
    )
    :vars
    (
      ?auto_2365 - TRUCK
      ?auto_2366 - LOCATION
      ?auto_2367 - CITY
      ?auto_2368 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_2365 ?auto_2366 ) ( IN-CITY ?auto_2366 ?auto_2367 ) ( IN-CITY ?auto_2361 ?auto_2367 ) ( not ( = ?auto_2361 ?auto_2366 ) ) ( OBJ-AT ?auto_2368 ?auto_2361 ) ( not ( = ?auto_2368 ?auto_2362 ) ) ( OBJ-AT ?auto_2362 ?auto_2366 ) ( OBJ-AT ?auto_2363 ?auto_2361 ) ( OBJ-AT ?auto_2364 ?auto_2361 ) ( not ( = ?auto_2362 ?auto_2363 ) ) ( not ( = ?auto_2362 ?auto_2364 ) ) ( not ( = ?auto_2363 ?auto_2364 ) ) ( not ( = ?auto_2363 ?auto_2368 ) ) ( not ( = ?auto_2364 ?auto_2368 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2368 ?auto_2362 ?auto_2361 )
      ( DELIVER-3PKG-VERIFY ?auto_2362 ?auto_2363 ?auto_2364 ?auto_2361 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2432 - OBJ
      ?auto_2433 - OBJ
      ?auto_2434 - OBJ
      ?auto_2431 - LOCATION
    )
    :vars
    (
      ?auto_2436 - LOCATION
      ?auto_2435 - CITY
      ?auto_2437 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2436 ?auto_2435 ) ( IN-CITY ?auto_2431 ?auto_2435 ) ( not ( = ?auto_2431 ?auto_2436 ) ) ( OBJ-AT ?auto_2432 ?auto_2431 ) ( not ( = ?auto_2432 ?auto_2434 ) ) ( OBJ-AT ?auto_2434 ?auto_2436 ) ( TRUCK-AT ?auto_2437 ?auto_2431 ) ( OBJ-AT ?auto_2433 ?auto_2431 ) ( not ( = ?auto_2432 ?auto_2433 ) ) ( not ( = ?auto_2433 ?auto_2434 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2432 ?auto_2434 ?auto_2431 )
      ( DELIVER-3PKG-VERIFY ?auto_2432 ?auto_2433 ?auto_2434 ?auto_2431 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2443 - OBJ
      ?auto_2444 - OBJ
      ?auto_2445 - OBJ
      ?auto_2442 - LOCATION
    )
    :vars
    (
      ?auto_2447 - LOCATION
      ?auto_2446 - CITY
      ?auto_2448 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2447 ?auto_2446 ) ( IN-CITY ?auto_2442 ?auto_2446 ) ( not ( = ?auto_2442 ?auto_2447 ) ) ( OBJ-AT ?auto_2445 ?auto_2442 ) ( not ( = ?auto_2445 ?auto_2444 ) ) ( OBJ-AT ?auto_2444 ?auto_2447 ) ( TRUCK-AT ?auto_2448 ?auto_2442 ) ( OBJ-AT ?auto_2443 ?auto_2442 ) ( not ( = ?auto_2443 ?auto_2444 ) ) ( not ( = ?auto_2443 ?auto_2445 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2445 ?auto_2444 ?auto_2442 )
      ( DELIVER-3PKG-VERIFY ?auto_2443 ?auto_2444 ?auto_2445 ?auto_2442 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2465 - OBJ
      ?auto_2466 - OBJ
      ?auto_2467 - OBJ
      ?auto_2464 - LOCATION
    )
    :vars
    (
      ?auto_2469 - LOCATION
      ?auto_2468 - CITY
      ?auto_2471 - OBJ
      ?auto_2470 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2469 ?auto_2468 ) ( IN-CITY ?auto_2464 ?auto_2468 ) ( not ( = ?auto_2464 ?auto_2469 ) ) ( OBJ-AT ?auto_2471 ?auto_2464 ) ( not ( = ?auto_2471 ?auto_2467 ) ) ( OBJ-AT ?auto_2467 ?auto_2469 ) ( TRUCK-AT ?auto_2470 ?auto_2464 ) ( OBJ-AT ?auto_2465 ?auto_2464 ) ( OBJ-AT ?auto_2466 ?auto_2464 ) ( not ( = ?auto_2465 ?auto_2466 ) ) ( not ( = ?auto_2465 ?auto_2467 ) ) ( not ( = ?auto_2465 ?auto_2471 ) ) ( not ( = ?auto_2466 ?auto_2467 ) ) ( not ( = ?auto_2466 ?auto_2471 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2471 ?auto_2467 ?auto_2464 )
      ( DELIVER-3PKG-VERIFY ?auto_2465 ?auto_2466 ?auto_2467 ?auto_2464 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2477 - OBJ
      ?auto_2478 - OBJ
      ?auto_2479 - OBJ
      ?auto_2476 - LOCATION
    )
    :vars
    (
      ?auto_2481 - LOCATION
      ?auto_2480 - CITY
      ?auto_2483 - OBJ
      ?auto_2482 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2481 ?auto_2480 ) ( IN-CITY ?auto_2476 ?auto_2480 ) ( not ( = ?auto_2476 ?auto_2481 ) ) ( OBJ-AT ?auto_2483 ?auto_2476 ) ( not ( = ?auto_2483 ?auto_2478 ) ) ( OBJ-AT ?auto_2478 ?auto_2481 ) ( TRUCK-AT ?auto_2482 ?auto_2476 ) ( OBJ-AT ?auto_2477 ?auto_2476 ) ( OBJ-AT ?auto_2479 ?auto_2476 ) ( not ( = ?auto_2477 ?auto_2478 ) ) ( not ( = ?auto_2477 ?auto_2479 ) ) ( not ( = ?auto_2477 ?auto_2483 ) ) ( not ( = ?auto_2478 ?auto_2479 ) ) ( not ( = ?auto_2479 ?auto_2483 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2483 ?auto_2478 ?auto_2476 )
      ( DELIVER-3PKG-VERIFY ?auto_2477 ?auto_2478 ?auto_2479 ?auto_2476 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2493 - OBJ
      ?auto_2494 - OBJ
      ?auto_2495 - OBJ
      ?auto_2492 - LOCATION
    )
    :vars
    (
      ?auto_2497 - LOCATION
      ?auto_2496 - CITY
      ?auto_2498 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2497 ?auto_2496 ) ( IN-CITY ?auto_2492 ?auto_2496 ) ( not ( = ?auto_2492 ?auto_2497 ) ) ( OBJ-AT ?auto_2494 ?auto_2492 ) ( not ( = ?auto_2494 ?auto_2493 ) ) ( OBJ-AT ?auto_2493 ?auto_2497 ) ( TRUCK-AT ?auto_2498 ?auto_2492 ) ( OBJ-AT ?auto_2495 ?auto_2492 ) ( not ( = ?auto_2493 ?auto_2495 ) ) ( not ( = ?auto_2494 ?auto_2495 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2494 ?auto_2493 ?auto_2492 )
      ( DELIVER-3PKG-VERIFY ?auto_2493 ?auto_2494 ?auto_2495 ?auto_2492 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2515 - OBJ
      ?auto_2516 - OBJ
      ?auto_2517 - OBJ
      ?auto_2514 - LOCATION
    )
    :vars
    (
      ?auto_2519 - LOCATION
      ?auto_2518 - CITY
      ?auto_2521 - OBJ
      ?auto_2520 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2519 ?auto_2518 ) ( IN-CITY ?auto_2514 ?auto_2518 ) ( not ( = ?auto_2514 ?auto_2519 ) ) ( OBJ-AT ?auto_2521 ?auto_2514 ) ( not ( = ?auto_2521 ?auto_2515 ) ) ( OBJ-AT ?auto_2515 ?auto_2519 ) ( TRUCK-AT ?auto_2520 ?auto_2514 ) ( OBJ-AT ?auto_2516 ?auto_2514 ) ( OBJ-AT ?auto_2517 ?auto_2514 ) ( not ( = ?auto_2515 ?auto_2516 ) ) ( not ( = ?auto_2515 ?auto_2517 ) ) ( not ( = ?auto_2516 ?auto_2517 ) ) ( not ( = ?auto_2516 ?auto_2521 ) ) ( not ( = ?auto_2517 ?auto_2521 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2521 ?auto_2515 ?auto_2514 )
      ( DELIVER-3PKG-VERIFY ?auto_2515 ?auto_2516 ?auto_2517 ?auto_2514 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2766 - OBJ
      ?auto_2767 - OBJ
      ?auto_2768 - OBJ
      ?auto_2765 - LOCATION
    )
    :vars
    (
      ?auto_2771 - TRUCK
      ?auto_2770 - LOCATION
      ?auto_2769 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_2771 ?auto_2770 ) ( IN-CITY ?auto_2770 ?auto_2769 ) ( IN-CITY ?auto_2765 ?auto_2769 ) ( not ( = ?auto_2765 ?auto_2770 ) ) ( OBJ-AT ?auto_2766 ?auto_2765 ) ( not ( = ?auto_2766 ?auto_2767 ) ) ( OBJ-AT ?auto_2767 ?auto_2770 ) ( OBJ-AT ?auto_2768 ?auto_2765 ) ( not ( = ?auto_2766 ?auto_2768 ) ) ( not ( = ?auto_2767 ?auto_2768 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2766 ?auto_2767 ?auto_2765 )
      ( DELIVER-3PKG-VERIFY ?auto_2766 ?auto_2767 ?auto_2768 ?auto_2765 ) )
  )

)

