( define ( domain zenotravel )
  ( :requirements :strips :typing :htn )
  ( :types aircraft city flevel person )
  ( :predicates
    ( PERSON-AT ?x - PERSON ?c - CITY )
    ( AIRCRAFT-AT ?y - AIRCRAFT ?c - CITY )
    ( IN ?p - PERSON ?a - AIRCRAFT )
    ( FUEL-LEVEL ?a - AIRCRAFT ?l - FLEVEL )
    ( NEXT ?l1 - FLEVEL ?l2 - FLEVEL )
  )
  ( :action !BOARD
    :parameters
    (
      ?p - PERSON
      ?a - AIRCRAFT
      ?c - CITY
    )
    :precondition
    ( and ( PERSON-AT ?p ?c ) ( AIRCRAFT-AT ?a ?c ) )
    :effect
    ( and ( not ( PERSON-AT ?p ?c ) ) ( IN ?p ?a ) )
  )
  ( :action !DEBARK
    :parameters
    (
      ?p - PERSON
      ?a - AIRCRAFT
      ?c - CITY
    )
    :precondition
    ( and ( IN ?p ?a ) ( AIRCRAFT-AT ?a ?c ) )
    :effect
    ( and ( not ( IN ?p ?a ) ) ( PERSON-AT ?p ?c ) )
  )
  ( :action !FLY
    :parameters
    (
      ?a - AIRCRAFT
      ?c1 - CITY
      ?c2 - CITY
      ?l1 - FLEVEL
      ?l2 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?a ?c1 ) ( FUEL-LEVEL ?a ?l1 ) ( NEXT ?l2 ?l1 ) )
    :effect
    ( and ( not ( AIRCRAFT-AT ?a ?c1 ) ) ( AIRCRAFT-AT ?a ?c2 ) ( not ( FUEL-LEVEL ?a ?l1 ) ) ( FUEL-LEVEL ?a ?l2 ) )
  )
  ( :action !ZOOM
    :parameters
    (
      ?a - AIRCRAFT
      ?c1 - CITY
      ?c2 - CITY
      ?l1 - FLEVEL
      ?l2 - FLEVEL
      ?l3 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?a ?c1 ) ( FUEL-LEVEL ?a ?l1 ) ( NEXT ?l2 ?l1 ) ( NEXT ?l3 ?l2 ) )
    :effect
    ( and ( not ( AIRCRAFT-AT ?a ?c1 ) ) ( AIRCRAFT-AT ?a ?c2 ) ( not ( FUEL-LEVEL ?a ?l1 ) ) ( FUEL-LEVEL ?a ?l3 ) )
  )
  ( :action !REFUEL
    :parameters
    (
      ?a - AIRCRAFT
      ?c - CITY
      ?l - FLEVEL
      ?l1 - FLEVEL
    )
    :precondition
    ( and ( FUEL-LEVEL ?a ?l ) ( NEXT ?l ?l1 ) ( AIRCRAFT-AT ?a ?c ) )
    :effect
    ( and ( FUEL-LEVEL ?a ?l1 ) ( not ( FUEL-LEVEL ?a ?l ) ) )
  )
  ( :method TRAVEL
    :parameters
    (
      ?p - PERSON
      ?c - CITY
    )
    :precondition
    ( and ( PERSON-AT ?p ?c ) )
    :subtasks
    (  )
  )

  ( :method FLY-1PPL-VERIFY
    :parameters
    (
      ?p1 - PERSON
      ?c - CITY
    )
    :precondition
    ( and ( PERSON-AT ?p1 ?c ) )
    :subtasks
    (  )
  )

  ( :method FLY-2PPL-VERIFY
    :parameters
    (
      ?p1 - PERSON
      ?p2 - PERSON
      ?c - CITY
    )
    :precondition
    ( and ( PERSON-AT ?p1 ?c ) ( PERSON-AT ?p2 ?c ) )
    :subtasks
    (  )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_1245 - PERSON
      ?auto_1244 - CITY
    )
    :vars
    (
      ?auto_1246 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_1245 ?auto_1246 ) ( AIRCRAFT-AT ?auto_1246 ?auto_1244 ) )
    :subtasks
    ( ( !DEBARK ?auto_1245 ?auto_1246 ?auto_1244 )
      ( FLY-1PPL-VERIFY ?auto_1245 ?auto_1244 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_1252 - PERSON
      ?auto_1251 - CITY
    )
    :vars
    (
      ?auto_1253 - AIRCRAFT
      ?auto_1256 - CITY
      ?auto_1254 - FLEVEL
      ?auto_1255 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_1252 ?auto_1253 ) ( AIRCRAFT-AT ?auto_1253 ?auto_1256 ) ( FUEL-LEVEL ?auto_1253 ?auto_1254 ) ( NEXT ?auto_1255 ?auto_1254 ) ( not ( = ?auto_1251 ?auto_1256 ) ) ( not ( = ?auto_1254 ?auto_1255 ) ) )
    :subtasks
    ( ( !FLY ?auto_1253 ?auto_1256 ?auto_1251 ?auto_1254 ?auto_1255 )
      ( FLY-1PPL ?auto_1252 ?auto_1251 )
      ( FLY-1PPL-VERIFY ?auto_1252 ?auto_1251 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_1265 - PERSON
      ?auto_1264 - CITY
    )
    :vars
    (
      ?auto_1269 - AIRCRAFT
      ?auto_1268 - CITY
      ?auto_1266 - FLEVEL
      ?auto_1267 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_1269 ?auto_1268 ) ( FUEL-LEVEL ?auto_1269 ?auto_1266 ) ( NEXT ?auto_1267 ?auto_1266 ) ( not ( = ?auto_1264 ?auto_1268 ) ) ( not ( = ?auto_1266 ?auto_1267 ) ) ( PERSON-AT ?auto_1265 ?auto_1268 ) )
    :subtasks
    ( ( !BOARD ?auto_1265 ?auto_1269 ?auto_1268 )
      ( FLY-1PPL ?auto_1265 ?auto_1264 )
      ( FLY-1PPL-VERIFY ?auto_1265 ?auto_1264 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_1278 - PERSON
      ?auto_1277 - CITY
    )
    :vars
    (
      ?auto_1281 - AIRCRAFT
      ?auto_1282 - CITY
      ?auto_1280 - FLEVEL
      ?auto_1279 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_1281 ?auto_1282 ) ( NEXT ?auto_1280 ?auto_1279 ) ( not ( = ?auto_1277 ?auto_1282 ) ) ( not ( = ?auto_1279 ?auto_1280 ) ) ( PERSON-AT ?auto_1278 ?auto_1282 ) ( FUEL-LEVEL ?auto_1281 ?auto_1280 ) )
    :subtasks
    ( ( !REFUEL ?auto_1281 ?auto_1282 ?auto_1280 ?auto_1279 )
      ( FLY-1PPL ?auto_1278 ?auto_1277 )
      ( FLY-1PPL-VERIFY ?auto_1278 ?auto_1277 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_1291 - PERSON
      ?auto_1290 - CITY
    )
    :vars
    (
      ?auto_1293 - FLEVEL
      ?auto_1295 - FLEVEL
      ?auto_1292 - CITY
      ?auto_1294 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1293 ?auto_1295 ) ( not ( = ?auto_1290 ?auto_1292 ) ) ( not ( = ?auto_1295 ?auto_1293 ) ) ( PERSON-AT ?auto_1291 ?auto_1292 ) ( AIRCRAFT-AT ?auto_1294 ?auto_1290 ) ( FUEL-LEVEL ?auto_1294 ?auto_1295 ) )
    :subtasks
    ( ( !FLY ?auto_1294 ?auto_1290 ?auto_1292 ?auto_1295 ?auto_1293 )
      ( FLY-1PPL ?auto_1291 ?auto_1290 )
      ( FLY-1PPL-VERIFY ?auto_1291 ?auto_1290 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_1304 - PERSON
      ?auto_1303 - CITY
    )
    :vars
    (
      ?auto_1307 - FLEVEL
      ?auto_1308 - FLEVEL
      ?auto_1305 - CITY
      ?auto_1306 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1307 ?auto_1308 ) ( not ( = ?auto_1303 ?auto_1305 ) ) ( not ( = ?auto_1308 ?auto_1307 ) ) ( PERSON-AT ?auto_1304 ?auto_1305 ) ( AIRCRAFT-AT ?auto_1306 ?auto_1303 ) ( FUEL-LEVEL ?auto_1306 ?auto_1307 ) )
    :subtasks
    ( ( !REFUEL ?auto_1306 ?auto_1303 ?auto_1307 ?auto_1308 )
      ( FLY-1PPL ?auto_1304 ?auto_1303 )
      ( FLY-1PPL-VERIFY ?auto_1304 ?auto_1303 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_1331 - PERSON
      ?auto_1332 - PERSON
      ?auto_1330 - CITY
    )
    :vars
    (
      ?auto_1333 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_1332 ?auto_1333 ) ( AIRCRAFT-AT ?auto_1333 ?auto_1330 ) ( PERSON-AT ?auto_1331 ?auto_1330 ) ( not ( = ?auto_1331 ?auto_1332 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_1332 ?auto_1330 )
      ( FLY-2PPL-VERIFY ?auto_1331 ?auto_1332 ?auto_1330 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_1335 - PERSON
      ?auto_1336 - PERSON
      ?auto_1334 - CITY
    )
    :vars
    (
      ?auto_1337 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_1335 ?auto_1337 ) ( AIRCRAFT-AT ?auto_1337 ?auto_1334 ) ( PERSON-AT ?auto_1336 ?auto_1334 ) ( not ( = ?auto_1335 ?auto_1336 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_1335 ?auto_1334 )
      ( FLY-2PPL-VERIFY ?auto_1335 ?auto_1336 ?auto_1334 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_1349 - PERSON
      ?auto_1350 - PERSON
      ?auto_1348 - CITY
    )
    :vars
    (
      ?auto_1353 - AIRCRAFT
      ?auto_1354 - CITY
      ?auto_1352 - FLEVEL
      ?auto_1351 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_1350 ?auto_1353 ) ( AIRCRAFT-AT ?auto_1353 ?auto_1354 ) ( FUEL-LEVEL ?auto_1353 ?auto_1352 ) ( NEXT ?auto_1351 ?auto_1352 ) ( not ( = ?auto_1348 ?auto_1354 ) ) ( not ( = ?auto_1352 ?auto_1351 ) ) ( PERSON-AT ?auto_1349 ?auto_1348 ) ( not ( = ?auto_1349 ?auto_1350 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_1350 ?auto_1348 )
      ( FLY-2PPL-VERIFY ?auto_1349 ?auto_1350 ?auto_1348 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_1356 - PERSON
      ?auto_1357 - PERSON
      ?auto_1355 - CITY
    )
    :vars
    (
      ?auto_1359 - AIRCRAFT
      ?auto_1358 - CITY
      ?auto_1360 - FLEVEL
      ?auto_1361 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_1356 ?auto_1359 ) ( AIRCRAFT-AT ?auto_1359 ?auto_1358 ) ( FUEL-LEVEL ?auto_1359 ?auto_1360 ) ( NEXT ?auto_1361 ?auto_1360 ) ( not ( = ?auto_1355 ?auto_1358 ) ) ( not ( = ?auto_1360 ?auto_1361 ) ) ( PERSON-AT ?auto_1357 ?auto_1355 ) ( not ( = ?auto_1357 ?auto_1356 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_1357 ?auto_1356 ?auto_1355 )
      ( FLY-2PPL-VERIFY ?auto_1356 ?auto_1357 ?auto_1355 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_1371 - PERSON
      ?auto_1370 - CITY
    )
    :vars
    (
      ?auto_1373 - AIRCRAFT
      ?auto_1372 - CITY
      ?auto_1374 - FLEVEL
      ?auto_1375 - FLEVEL
      ?auto_1376 - PERSON
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_1373 ?auto_1372 ) ( FUEL-LEVEL ?auto_1373 ?auto_1374 ) ( NEXT ?auto_1375 ?auto_1374 ) ( not ( = ?auto_1370 ?auto_1372 ) ) ( not ( = ?auto_1374 ?auto_1375 ) ) ( PERSON-AT ?auto_1376 ?auto_1370 ) ( not ( = ?auto_1376 ?auto_1371 ) ) ( PERSON-AT ?auto_1371 ?auto_1372 ) )
    :subtasks
    ( ( !BOARD ?auto_1371 ?auto_1373 ?auto_1372 )
      ( FLY-2PPL ?auto_1376 ?auto_1371 ?auto_1370 )
      ( FLY-1PPL-VERIFY ?auto_1371 ?auto_1370 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_1378 - PERSON
      ?auto_1379 - PERSON
      ?auto_1377 - CITY
    )
    :vars
    (
      ?auto_1381 - AIRCRAFT
      ?auto_1382 - CITY
      ?auto_1380 - FLEVEL
      ?auto_1383 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_1381 ?auto_1382 ) ( FUEL-LEVEL ?auto_1381 ?auto_1380 ) ( NEXT ?auto_1383 ?auto_1380 ) ( not ( = ?auto_1377 ?auto_1382 ) ) ( not ( = ?auto_1380 ?auto_1383 ) ) ( PERSON-AT ?auto_1378 ?auto_1377 ) ( not ( = ?auto_1378 ?auto_1379 ) ) ( PERSON-AT ?auto_1379 ?auto_1382 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_1379 ?auto_1377 )
      ( FLY-2PPL-VERIFY ?auto_1378 ?auto_1379 ?auto_1377 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_1385 - PERSON
      ?auto_1386 - PERSON
      ?auto_1384 - CITY
    )
    :vars
    (
      ?auto_1390 - AIRCRAFT
      ?auto_1387 - CITY
      ?auto_1389 - FLEVEL
      ?auto_1388 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_1390 ?auto_1387 ) ( FUEL-LEVEL ?auto_1390 ?auto_1389 ) ( NEXT ?auto_1388 ?auto_1389 ) ( not ( = ?auto_1384 ?auto_1387 ) ) ( not ( = ?auto_1389 ?auto_1388 ) ) ( PERSON-AT ?auto_1386 ?auto_1384 ) ( not ( = ?auto_1386 ?auto_1385 ) ) ( PERSON-AT ?auto_1385 ?auto_1387 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_1386 ?auto_1385 ?auto_1384 )
      ( FLY-2PPL-VERIFY ?auto_1385 ?auto_1386 ?auto_1384 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_1400 - PERSON
      ?auto_1399 - CITY
    )
    :vars
    (
      ?auto_1404 - AIRCRAFT
      ?auto_1401 - CITY
      ?auto_1402 - FLEVEL
      ?auto_1403 - FLEVEL
      ?auto_1405 - PERSON
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_1404 ?auto_1401 ) ( NEXT ?auto_1402 ?auto_1403 ) ( not ( = ?auto_1399 ?auto_1401 ) ) ( not ( = ?auto_1403 ?auto_1402 ) ) ( PERSON-AT ?auto_1405 ?auto_1399 ) ( not ( = ?auto_1405 ?auto_1400 ) ) ( PERSON-AT ?auto_1400 ?auto_1401 ) ( FUEL-LEVEL ?auto_1404 ?auto_1402 ) )
    :subtasks
    ( ( !REFUEL ?auto_1404 ?auto_1401 ?auto_1402 ?auto_1403 )
      ( FLY-2PPL ?auto_1405 ?auto_1400 ?auto_1399 )
      ( FLY-1PPL-VERIFY ?auto_1400 ?auto_1399 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_1407 - PERSON
      ?auto_1408 - PERSON
      ?auto_1406 - CITY
    )
    :vars
    (
      ?auto_1412 - AIRCRAFT
      ?auto_1409 - CITY
      ?auto_1411 - FLEVEL
      ?auto_1410 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_1412 ?auto_1409 ) ( NEXT ?auto_1411 ?auto_1410 ) ( not ( = ?auto_1406 ?auto_1409 ) ) ( not ( = ?auto_1410 ?auto_1411 ) ) ( PERSON-AT ?auto_1407 ?auto_1406 ) ( not ( = ?auto_1407 ?auto_1408 ) ) ( PERSON-AT ?auto_1408 ?auto_1409 ) ( FUEL-LEVEL ?auto_1412 ?auto_1411 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_1408 ?auto_1406 )
      ( FLY-2PPL-VERIFY ?auto_1407 ?auto_1408 ?auto_1406 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_1414 - PERSON
      ?auto_1415 - PERSON
      ?auto_1413 - CITY
    )
    :vars
    (
      ?auto_1419 - AIRCRAFT
      ?auto_1416 - CITY
      ?auto_1418 - FLEVEL
      ?auto_1417 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_1419 ?auto_1416 ) ( NEXT ?auto_1418 ?auto_1417 ) ( not ( = ?auto_1413 ?auto_1416 ) ) ( not ( = ?auto_1417 ?auto_1418 ) ) ( PERSON-AT ?auto_1415 ?auto_1413 ) ( not ( = ?auto_1415 ?auto_1414 ) ) ( PERSON-AT ?auto_1414 ?auto_1416 ) ( FUEL-LEVEL ?auto_1419 ?auto_1418 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_1415 ?auto_1414 ?auto_1413 )
      ( FLY-2PPL-VERIFY ?auto_1414 ?auto_1415 ?auto_1413 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_1429 - PERSON
      ?auto_1428 - CITY
    )
    :vars
    (
      ?auto_1433 - FLEVEL
      ?auto_1432 - FLEVEL
      ?auto_1431 - CITY
      ?auto_1430 - PERSON
      ?auto_1434 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1433 ?auto_1432 ) ( not ( = ?auto_1428 ?auto_1431 ) ) ( not ( = ?auto_1432 ?auto_1433 ) ) ( PERSON-AT ?auto_1430 ?auto_1428 ) ( not ( = ?auto_1430 ?auto_1429 ) ) ( PERSON-AT ?auto_1429 ?auto_1431 ) ( AIRCRAFT-AT ?auto_1434 ?auto_1428 ) ( FUEL-LEVEL ?auto_1434 ?auto_1432 ) )
    :subtasks
    ( ( !FLY ?auto_1434 ?auto_1428 ?auto_1431 ?auto_1432 ?auto_1433 )
      ( FLY-2PPL ?auto_1430 ?auto_1429 ?auto_1428 )
      ( FLY-1PPL-VERIFY ?auto_1429 ?auto_1428 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_1436 - PERSON
      ?auto_1437 - PERSON
      ?auto_1435 - CITY
    )
    :vars
    (
      ?auto_1441 - FLEVEL
      ?auto_1438 - FLEVEL
      ?auto_1439 - CITY
      ?auto_1440 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1441 ?auto_1438 ) ( not ( = ?auto_1435 ?auto_1439 ) ) ( not ( = ?auto_1438 ?auto_1441 ) ) ( PERSON-AT ?auto_1436 ?auto_1435 ) ( not ( = ?auto_1436 ?auto_1437 ) ) ( PERSON-AT ?auto_1437 ?auto_1439 ) ( AIRCRAFT-AT ?auto_1440 ?auto_1435 ) ( FUEL-LEVEL ?auto_1440 ?auto_1438 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_1437 ?auto_1435 )
      ( FLY-2PPL-VERIFY ?auto_1436 ?auto_1437 ?auto_1435 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_1443 - PERSON
      ?auto_1444 - PERSON
      ?auto_1442 - CITY
    )
    :vars
    (
      ?auto_1445 - FLEVEL
      ?auto_1448 - FLEVEL
      ?auto_1447 - CITY
      ?auto_1446 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1445 ?auto_1448 ) ( not ( = ?auto_1442 ?auto_1447 ) ) ( not ( = ?auto_1448 ?auto_1445 ) ) ( PERSON-AT ?auto_1444 ?auto_1442 ) ( not ( = ?auto_1444 ?auto_1443 ) ) ( PERSON-AT ?auto_1443 ?auto_1447 ) ( AIRCRAFT-AT ?auto_1446 ?auto_1442 ) ( FUEL-LEVEL ?auto_1446 ?auto_1448 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_1444 ?auto_1443 ?auto_1442 )
      ( FLY-2PPL-VERIFY ?auto_1443 ?auto_1444 ?auto_1442 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_1458 - PERSON
      ?auto_1457 - CITY
    )
    :vars
    (
      ?auto_1459 - FLEVEL
      ?auto_1463 - FLEVEL
      ?auto_1462 - CITY
      ?auto_1461 - PERSON
      ?auto_1460 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1459 ?auto_1463 ) ( not ( = ?auto_1457 ?auto_1462 ) ) ( not ( = ?auto_1463 ?auto_1459 ) ) ( PERSON-AT ?auto_1461 ?auto_1457 ) ( not ( = ?auto_1461 ?auto_1458 ) ) ( PERSON-AT ?auto_1458 ?auto_1462 ) ( AIRCRAFT-AT ?auto_1460 ?auto_1457 ) ( FUEL-LEVEL ?auto_1460 ?auto_1459 ) )
    :subtasks
    ( ( !REFUEL ?auto_1460 ?auto_1457 ?auto_1459 ?auto_1463 )
      ( FLY-2PPL ?auto_1461 ?auto_1458 ?auto_1457 )
      ( FLY-1PPL-VERIFY ?auto_1458 ?auto_1457 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_1465 - PERSON
      ?auto_1466 - PERSON
      ?auto_1464 - CITY
    )
    :vars
    (
      ?auto_1470 - FLEVEL
      ?auto_1469 - FLEVEL
      ?auto_1467 - CITY
      ?auto_1468 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1470 ?auto_1469 ) ( not ( = ?auto_1464 ?auto_1467 ) ) ( not ( = ?auto_1469 ?auto_1470 ) ) ( PERSON-AT ?auto_1465 ?auto_1464 ) ( not ( = ?auto_1465 ?auto_1466 ) ) ( PERSON-AT ?auto_1466 ?auto_1467 ) ( AIRCRAFT-AT ?auto_1468 ?auto_1464 ) ( FUEL-LEVEL ?auto_1468 ?auto_1470 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_1466 ?auto_1464 )
      ( FLY-2PPL-VERIFY ?auto_1465 ?auto_1466 ?auto_1464 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_1472 - PERSON
      ?auto_1473 - PERSON
      ?auto_1471 - CITY
    )
    :vars
    (
      ?auto_1474 - FLEVEL
      ?auto_1476 - FLEVEL
      ?auto_1475 - CITY
      ?auto_1477 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1474 ?auto_1476 ) ( not ( = ?auto_1471 ?auto_1475 ) ) ( not ( = ?auto_1476 ?auto_1474 ) ) ( PERSON-AT ?auto_1473 ?auto_1471 ) ( not ( = ?auto_1473 ?auto_1472 ) ) ( PERSON-AT ?auto_1472 ?auto_1475 ) ( AIRCRAFT-AT ?auto_1477 ?auto_1471 ) ( FUEL-LEVEL ?auto_1477 ?auto_1474 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_1473 ?auto_1472 ?auto_1471 )
      ( FLY-2PPL-VERIFY ?auto_1472 ?auto_1473 ?auto_1471 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_1487 - PERSON
      ?auto_1486 - CITY
    )
    :vars
    (
      ?auto_1489 - FLEVEL
      ?auto_1491 - FLEVEL
      ?auto_1490 - CITY
      ?auto_1488 - PERSON
      ?auto_1492 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1489 ?auto_1491 ) ( not ( = ?auto_1486 ?auto_1490 ) ) ( not ( = ?auto_1491 ?auto_1489 ) ) ( not ( = ?auto_1488 ?auto_1487 ) ) ( PERSON-AT ?auto_1487 ?auto_1490 ) ( AIRCRAFT-AT ?auto_1492 ?auto_1486 ) ( FUEL-LEVEL ?auto_1492 ?auto_1489 ) ( IN ?auto_1488 ?auto_1492 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_1488 ?auto_1486 )
      ( FLY-2PPL ?auto_1488 ?auto_1487 ?auto_1486 )
      ( FLY-1PPL-VERIFY ?auto_1487 ?auto_1486 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_1494 - PERSON
      ?auto_1495 - PERSON
      ?auto_1493 - CITY
    )
    :vars
    (
      ?auto_1499 - FLEVEL
      ?auto_1496 - FLEVEL
      ?auto_1498 - CITY
      ?auto_1497 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1499 ?auto_1496 ) ( not ( = ?auto_1493 ?auto_1498 ) ) ( not ( = ?auto_1496 ?auto_1499 ) ) ( not ( = ?auto_1494 ?auto_1495 ) ) ( PERSON-AT ?auto_1495 ?auto_1498 ) ( AIRCRAFT-AT ?auto_1497 ?auto_1493 ) ( FUEL-LEVEL ?auto_1497 ?auto_1499 ) ( IN ?auto_1494 ?auto_1497 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_1495 ?auto_1493 )
      ( FLY-2PPL-VERIFY ?auto_1494 ?auto_1495 ?auto_1493 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_1501 - PERSON
      ?auto_1502 - PERSON
      ?auto_1500 - CITY
    )
    :vars
    (
      ?auto_1506 - FLEVEL
      ?auto_1503 - FLEVEL
      ?auto_1505 - CITY
      ?auto_1504 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1506 ?auto_1503 ) ( not ( = ?auto_1500 ?auto_1505 ) ) ( not ( = ?auto_1503 ?auto_1506 ) ) ( not ( = ?auto_1502 ?auto_1501 ) ) ( PERSON-AT ?auto_1501 ?auto_1505 ) ( AIRCRAFT-AT ?auto_1504 ?auto_1500 ) ( FUEL-LEVEL ?auto_1504 ?auto_1506 ) ( IN ?auto_1502 ?auto_1504 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_1502 ?auto_1501 ?auto_1500 )
      ( FLY-2PPL-VERIFY ?auto_1501 ?auto_1502 ?auto_1500 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_1516 - PERSON
      ?auto_1515 - CITY
    )
    :vars
    (
      ?auto_1521 - FLEVEL
      ?auto_1517 - FLEVEL
      ?auto_1520 - CITY
      ?auto_1519 - PERSON
      ?auto_1518 - AIRCRAFT
      ?auto_1522 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_1521 ?auto_1517 ) ( not ( = ?auto_1515 ?auto_1520 ) ) ( not ( = ?auto_1517 ?auto_1521 ) ) ( not ( = ?auto_1519 ?auto_1516 ) ) ( PERSON-AT ?auto_1516 ?auto_1520 ) ( IN ?auto_1519 ?auto_1518 ) ( AIRCRAFT-AT ?auto_1518 ?auto_1522 ) ( FUEL-LEVEL ?auto_1518 ?auto_1517 ) ( not ( = ?auto_1515 ?auto_1522 ) ) ( not ( = ?auto_1520 ?auto_1522 ) ) )
    :subtasks
    ( ( !FLY ?auto_1518 ?auto_1522 ?auto_1515 ?auto_1517 ?auto_1521 )
      ( FLY-2PPL ?auto_1519 ?auto_1516 ?auto_1515 )
      ( FLY-1PPL-VERIFY ?auto_1516 ?auto_1515 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_1524 - PERSON
      ?auto_1525 - PERSON
      ?auto_1523 - CITY
    )
    :vars
    (
      ?auto_1526 - FLEVEL
      ?auto_1530 - FLEVEL
      ?auto_1527 - CITY
      ?auto_1528 - AIRCRAFT
      ?auto_1529 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_1526 ?auto_1530 ) ( not ( = ?auto_1523 ?auto_1527 ) ) ( not ( = ?auto_1530 ?auto_1526 ) ) ( not ( = ?auto_1524 ?auto_1525 ) ) ( PERSON-AT ?auto_1525 ?auto_1527 ) ( IN ?auto_1524 ?auto_1528 ) ( AIRCRAFT-AT ?auto_1528 ?auto_1529 ) ( FUEL-LEVEL ?auto_1528 ?auto_1530 ) ( not ( = ?auto_1523 ?auto_1529 ) ) ( not ( = ?auto_1527 ?auto_1529 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_1525 ?auto_1523 )
      ( FLY-2PPL-VERIFY ?auto_1524 ?auto_1525 ?auto_1523 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_1532 - PERSON
      ?auto_1533 - PERSON
      ?auto_1531 - CITY
    )
    :vars
    (
      ?auto_1536 - FLEVEL
      ?auto_1534 - FLEVEL
      ?auto_1535 - CITY
      ?auto_1538 - AIRCRAFT
      ?auto_1537 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_1536 ?auto_1534 ) ( not ( = ?auto_1531 ?auto_1535 ) ) ( not ( = ?auto_1534 ?auto_1536 ) ) ( not ( = ?auto_1533 ?auto_1532 ) ) ( PERSON-AT ?auto_1532 ?auto_1535 ) ( IN ?auto_1533 ?auto_1538 ) ( AIRCRAFT-AT ?auto_1538 ?auto_1537 ) ( FUEL-LEVEL ?auto_1538 ?auto_1534 ) ( not ( = ?auto_1531 ?auto_1537 ) ) ( not ( = ?auto_1535 ?auto_1537 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_1533 ?auto_1532 ?auto_1531 )
      ( FLY-2PPL-VERIFY ?auto_1532 ?auto_1533 ?auto_1531 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_1549 - PERSON
      ?auto_1548 - CITY
    )
    :vars
    (
      ?auto_1552 - FLEVEL
      ?auto_1550 - FLEVEL
      ?auto_1551 - CITY
      ?auto_1555 - PERSON
      ?auto_1554 - AIRCRAFT
      ?auto_1553 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_1552 ?auto_1550 ) ( not ( = ?auto_1548 ?auto_1551 ) ) ( not ( = ?auto_1550 ?auto_1552 ) ) ( not ( = ?auto_1555 ?auto_1549 ) ) ( PERSON-AT ?auto_1549 ?auto_1551 ) ( AIRCRAFT-AT ?auto_1554 ?auto_1553 ) ( FUEL-LEVEL ?auto_1554 ?auto_1550 ) ( not ( = ?auto_1548 ?auto_1553 ) ) ( not ( = ?auto_1551 ?auto_1553 ) ) ( PERSON-AT ?auto_1555 ?auto_1553 ) )
    :subtasks
    ( ( !BOARD ?auto_1555 ?auto_1554 ?auto_1553 )
      ( FLY-2PPL ?auto_1555 ?auto_1549 ?auto_1548 )
      ( FLY-1PPL-VERIFY ?auto_1549 ?auto_1548 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_1557 - PERSON
      ?auto_1558 - PERSON
      ?auto_1556 - CITY
    )
    :vars
    (
      ?auto_1562 - FLEVEL
      ?auto_1559 - FLEVEL
      ?auto_1560 - CITY
      ?auto_1563 - AIRCRAFT
      ?auto_1561 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_1562 ?auto_1559 ) ( not ( = ?auto_1556 ?auto_1560 ) ) ( not ( = ?auto_1559 ?auto_1562 ) ) ( not ( = ?auto_1557 ?auto_1558 ) ) ( PERSON-AT ?auto_1558 ?auto_1560 ) ( AIRCRAFT-AT ?auto_1563 ?auto_1561 ) ( FUEL-LEVEL ?auto_1563 ?auto_1559 ) ( not ( = ?auto_1556 ?auto_1561 ) ) ( not ( = ?auto_1560 ?auto_1561 ) ) ( PERSON-AT ?auto_1557 ?auto_1561 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_1558 ?auto_1556 )
      ( FLY-2PPL-VERIFY ?auto_1557 ?auto_1558 ?auto_1556 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_1565 - PERSON
      ?auto_1566 - PERSON
      ?auto_1564 - CITY
    )
    :vars
    (
      ?auto_1569 - FLEVEL
      ?auto_1568 - FLEVEL
      ?auto_1567 - CITY
      ?auto_1570 - AIRCRAFT
      ?auto_1571 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_1569 ?auto_1568 ) ( not ( = ?auto_1564 ?auto_1567 ) ) ( not ( = ?auto_1568 ?auto_1569 ) ) ( not ( = ?auto_1566 ?auto_1565 ) ) ( PERSON-AT ?auto_1565 ?auto_1567 ) ( AIRCRAFT-AT ?auto_1570 ?auto_1571 ) ( FUEL-LEVEL ?auto_1570 ?auto_1568 ) ( not ( = ?auto_1564 ?auto_1571 ) ) ( not ( = ?auto_1567 ?auto_1571 ) ) ( PERSON-AT ?auto_1566 ?auto_1571 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_1566 ?auto_1565 ?auto_1564 )
      ( FLY-2PPL-VERIFY ?auto_1565 ?auto_1566 ?auto_1564 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_1582 - PERSON
      ?auto_1581 - CITY
    )
    :vars
    (
      ?auto_1585 - FLEVEL
      ?auto_1584 - FLEVEL
      ?auto_1583 - CITY
      ?auto_1588 - PERSON
      ?auto_1586 - AIRCRAFT
      ?auto_1587 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_1585 ?auto_1584 ) ( not ( = ?auto_1581 ?auto_1583 ) ) ( not ( = ?auto_1584 ?auto_1585 ) ) ( not ( = ?auto_1588 ?auto_1582 ) ) ( PERSON-AT ?auto_1582 ?auto_1583 ) ( AIRCRAFT-AT ?auto_1586 ?auto_1587 ) ( not ( = ?auto_1581 ?auto_1587 ) ) ( not ( = ?auto_1583 ?auto_1587 ) ) ( PERSON-AT ?auto_1588 ?auto_1587 ) ( FUEL-LEVEL ?auto_1586 ?auto_1585 ) )
    :subtasks
    ( ( !REFUEL ?auto_1586 ?auto_1587 ?auto_1585 ?auto_1584 )
      ( FLY-2PPL ?auto_1588 ?auto_1582 ?auto_1581 )
      ( FLY-1PPL-VERIFY ?auto_1582 ?auto_1581 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_1590 - PERSON
      ?auto_1591 - PERSON
      ?auto_1589 - CITY
    )
    :vars
    (
      ?auto_1596 - FLEVEL
      ?auto_1593 - FLEVEL
      ?auto_1594 - CITY
      ?auto_1595 - AIRCRAFT
      ?auto_1592 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_1596 ?auto_1593 ) ( not ( = ?auto_1589 ?auto_1594 ) ) ( not ( = ?auto_1593 ?auto_1596 ) ) ( not ( = ?auto_1590 ?auto_1591 ) ) ( PERSON-AT ?auto_1591 ?auto_1594 ) ( AIRCRAFT-AT ?auto_1595 ?auto_1592 ) ( not ( = ?auto_1589 ?auto_1592 ) ) ( not ( = ?auto_1594 ?auto_1592 ) ) ( PERSON-AT ?auto_1590 ?auto_1592 ) ( FUEL-LEVEL ?auto_1595 ?auto_1596 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_1591 ?auto_1589 )
      ( FLY-2PPL-VERIFY ?auto_1590 ?auto_1591 ?auto_1589 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_1598 - PERSON
      ?auto_1599 - PERSON
      ?auto_1597 - CITY
    )
    :vars
    (
      ?auto_1601 - FLEVEL
      ?auto_1603 - FLEVEL
      ?auto_1600 - CITY
      ?auto_1602 - AIRCRAFT
      ?auto_1604 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_1601 ?auto_1603 ) ( not ( = ?auto_1597 ?auto_1600 ) ) ( not ( = ?auto_1603 ?auto_1601 ) ) ( not ( = ?auto_1599 ?auto_1598 ) ) ( PERSON-AT ?auto_1598 ?auto_1600 ) ( AIRCRAFT-AT ?auto_1602 ?auto_1604 ) ( not ( = ?auto_1597 ?auto_1604 ) ) ( not ( = ?auto_1600 ?auto_1604 ) ) ( PERSON-AT ?auto_1599 ?auto_1604 ) ( FUEL-LEVEL ?auto_1602 ?auto_1601 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_1599 ?auto_1598 ?auto_1597 )
      ( FLY-2PPL-VERIFY ?auto_1598 ?auto_1599 ?auto_1597 ) )
  )

)

