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

  ( :method FLY-3PPL-VERIFY
    :parameters
    (
      ?p1 - PERSON
      ?p2 - PERSON
      ?p3 - PERSON
      ?c - CITY
    )
    :precondition
    ( and ( PERSON-AT ?p1 ?c ) ( PERSON-AT ?p2 ?c ) ( PERSON-AT ?p3 ?c ) )
    :subtasks
    (  )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_1223 - PERSON
      ?auto_1222 - CITY
    )
    :vars
    (
      ?auto_1226 - FLEVEL
      ?auto_1225 - FLEVEL
      ?auto_1227 - CITY
      ?auto_1224 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1226 ?auto_1225 ) ( PERSON-AT ?auto_1223 ?auto_1227 ) ( AIRCRAFT-AT ?auto_1224 ?auto_1222 ) ( FUEL-LEVEL ?auto_1224 ?auto_1226 ) ( not ( = ?auto_1222 ?auto_1227 ) ) ( not ( = ?auto_1226 ?auto_1225 ) ) )
    :subtasks
    ( ( !REFUEL ?auto_1224 ?auto_1222 ?auto_1226 ?auto_1225 )
      ( !FLY ?auto_1224 ?auto_1222 ?auto_1227 ?auto_1225 ?auto_1226 )
      ( !REFUEL ?auto_1224 ?auto_1227 ?auto_1226 ?auto_1225 )
      ( !BOARD ?auto_1223 ?auto_1224 ?auto_1227 )
      ( !FLY ?auto_1224 ?auto_1227 ?auto_1222 ?auto_1225 ?auto_1226 )
      ( !DEBARK ?auto_1223 ?auto_1224 ?auto_1222 )
      ( FLY-1PPL-VERIFY ?auto_1223 ?auto_1222 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_1231 - PERSON
      ?auto_1230 - CITY
    )
    :vars
    (
      ?auto_1234 - FLEVEL
      ?auto_1233 - FLEVEL
      ?auto_1235 - CITY
      ?auto_1232 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1234 ?auto_1233 ) ( PERSON-AT ?auto_1231 ?auto_1235 ) ( AIRCRAFT-AT ?auto_1232 ?auto_1230 ) ( FUEL-LEVEL ?auto_1232 ?auto_1234 ) ( not ( = ?auto_1230 ?auto_1235 ) ) ( not ( = ?auto_1234 ?auto_1233 ) ) )
    :subtasks
    ( ( !REFUEL ?auto_1232 ?auto_1230 ?auto_1234 ?auto_1233 )
      ( !FLY ?auto_1232 ?auto_1230 ?auto_1235 ?auto_1233 ?auto_1234 )
      ( !REFUEL ?auto_1232 ?auto_1235 ?auto_1234 ?auto_1233 )
      ( !BOARD ?auto_1231 ?auto_1232 ?auto_1235 )
      ( !FLY ?auto_1232 ?auto_1235 ?auto_1230 ?auto_1233 ?auto_1234 )
      ( !DEBARK ?auto_1231 ?auto_1232 ?auto_1230 )
      ( FLY-1PPL-VERIFY ?auto_1231 ?auto_1230 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_1246 - PERSON
      ?auto_1247 - PERSON
      ?auto_1245 - CITY
    )
    :vars
    (
      ?auto_1250 - FLEVEL
      ?auto_1249 - FLEVEL
      ?auto_1251 - CITY
      ?auto_1252 - CITY
      ?auto_1248 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1250 ?auto_1249 ) ( PERSON-AT ?auto_1247 ?auto_1251 ) ( not ( = ?auto_1245 ?auto_1251 ) ) ( not ( = ?auto_1250 ?auto_1249 ) ) ( PERSON-AT ?auto_1246 ?auto_1252 ) ( AIRCRAFT-AT ?auto_1248 ?auto_1245 ) ( FUEL-LEVEL ?auto_1248 ?auto_1250 ) ( not ( = ?auto_1245 ?auto_1252 ) ) ( not ( = ?auto_1246 ?auto_1247 ) ) ( not ( = ?auto_1251 ?auto_1252 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_1246 ?auto_1245 )
      ( FLY-1PPL ?auto_1247 ?auto_1245 )
      ( FLY-2PPL-VERIFY ?auto_1246 ?auto_1247 ?auto_1245 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_1254 - PERSON
      ?auto_1255 - PERSON
      ?auto_1253 - CITY
    )
    :vars
    (
      ?auto_1260 - FLEVEL
      ?auto_1256 - FLEVEL
      ?auto_1259 - CITY
      ?auto_1257 - CITY
      ?auto_1258 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1260 ?auto_1256 ) ( PERSON-AT ?auto_1254 ?auto_1259 ) ( not ( = ?auto_1253 ?auto_1259 ) ) ( not ( = ?auto_1260 ?auto_1256 ) ) ( PERSON-AT ?auto_1255 ?auto_1257 ) ( AIRCRAFT-AT ?auto_1258 ?auto_1253 ) ( FUEL-LEVEL ?auto_1258 ?auto_1260 ) ( not ( = ?auto_1253 ?auto_1257 ) ) ( not ( = ?auto_1255 ?auto_1254 ) ) ( not ( = ?auto_1259 ?auto_1257 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_1255 ?auto_1254 ?auto_1253 )
      ( FLY-2PPL-VERIFY ?auto_1254 ?auto_1255 ?auto_1253 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_1273 - PERSON
      ?auto_1272 - CITY
    )
    :vars
    (
      ?auto_1276 - FLEVEL
      ?auto_1275 - FLEVEL
      ?auto_1277 - CITY
      ?auto_1274 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1276 ?auto_1275 ) ( PERSON-AT ?auto_1273 ?auto_1277 ) ( AIRCRAFT-AT ?auto_1274 ?auto_1272 ) ( FUEL-LEVEL ?auto_1274 ?auto_1276 ) ( not ( = ?auto_1272 ?auto_1277 ) ) ( not ( = ?auto_1276 ?auto_1275 ) ) )
    :subtasks
    ( ( !REFUEL ?auto_1274 ?auto_1272 ?auto_1276 ?auto_1275 )
      ( !FLY ?auto_1274 ?auto_1272 ?auto_1277 ?auto_1275 ?auto_1276 )
      ( !REFUEL ?auto_1274 ?auto_1277 ?auto_1276 ?auto_1275 )
      ( !BOARD ?auto_1273 ?auto_1274 ?auto_1277 )
      ( !FLY ?auto_1274 ?auto_1277 ?auto_1272 ?auto_1275 ?auto_1276 )
      ( !DEBARK ?auto_1273 ?auto_1274 ?auto_1272 )
      ( FLY-1PPL-VERIFY ?auto_1273 ?auto_1272 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_1366 - PERSON
      ?auto_1367 - PERSON
      ?auto_1368 - PERSON
      ?auto_1365 - CITY
    )
    :vars
    (
      ?auto_1370 - FLEVEL
      ?auto_1371 - FLEVEL
      ?auto_1369 - CITY
      ?auto_1374 - CITY
      ?auto_1373 - CITY
      ?auto_1372 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1370 ?auto_1371 ) ( PERSON-AT ?auto_1368 ?auto_1369 ) ( not ( = ?auto_1365 ?auto_1369 ) ) ( not ( = ?auto_1370 ?auto_1371 ) ) ( PERSON-AT ?auto_1367 ?auto_1374 ) ( not ( = ?auto_1365 ?auto_1374 ) ) ( PERSON-AT ?auto_1366 ?auto_1373 ) ( AIRCRAFT-AT ?auto_1372 ?auto_1365 ) ( FUEL-LEVEL ?auto_1372 ?auto_1370 ) ( not ( = ?auto_1365 ?auto_1373 ) ) ( not ( = ?auto_1366 ?auto_1367 ) ) ( not ( = ?auto_1374 ?auto_1373 ) ) ( not ( = ?auto_1366 ?auto_1368 ) ) ( not ( = ?auto_1367 ?auto_1368 ) ) ( not ( = ?auto_1369 ?auto_1374 ) ) ( not ( = ?auto_1369 ?auto_1373 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_1367 ?auto_1366 ?auto_1365 )
      ( FLY-1PPL ?auto_1368 ?auto_1365 )
      ( FLY-3PPL-VERIFY ?auto_1366 ?auto_1367 ?auto_1368 ?auto_1365 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_1387 - PERSON
      ?auto_1388 - PERSON
      ?auto_1389 - PERSON
      ?auto_1386 - CITY
    )
    :vars
    (
      ?auto_1395 - FLEVEL
      ?auto_1391 - FLEVEL
      ?auto_1393 - CITY
      ?auto_1390 - CITY
      ?auto_1394 - CITY
      ?auto_1392 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1395 ?auto_1391 ) ( PERSON-AT ?auto_1388 ?auto_1393 ) ( not ( = ?auto_1386 ?auto_1393 ) ) ( not ( = ?auto_1395 ?auto_1391 ) ) ( PERSON-AT ?auto_1389 ?auto_1390 ) ( not ( = ?auto_1386 ?auto_1390 ) ) ( PERSON-AT ?auto_1387 ?auto_1394 ) ( AIRCRAFT-AT ?auto_1392 ?auto_1386 ) ( FUEL-LEVEL ?auto_1392 ?auto_1395 ) ( not ( = ?auto_1386 ?auto_1394 ) ) ( not ( = ?auto_1387 ?auto_1389 ) ) ( not ( = ?auto_1390 ?auto_1394 ) ) ( not ( = ?auto_1387 ?auto_1388 ) ) ( not ( = ?auto_1389 ?auto_1388 ) ) ( not ( = ?auto_1393 ?auto_1390 ) ) ( not ( = ?auto_1393 ?auto_1394 ) ) )
    :subtasks
    ( ( FLY-3PPL ?auto_1387 ?auto_1389 ?auto_1388 ?auto_1386 )
      ( FLY-3PPL-VERIFY ?auto_1387 ?auto_1388 ?auto_1389 ?auto_1386 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_1408 - PERSON
      ?auto_1409 - PERSON
      ?auto_1410 - PERSON
      ?auto_1407 - CITY
    )
    :vars
    (
      ?auto_1411 - FLEVEL
      ?auto_1414 - FLEVEL
      ?auto_1413 - CITY
      ?auto_1416 - CITY
      ?auto_1412 - CITY
      ?auto_1415 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1411 ?auto_1414 ) ( PERSON-AT ?auto_1410 ?auto_1413 ) ( not ( = ?auto_1407 ?auto_1413 ) ) ( not ( = ?auto_1411 ?auto_1414 ) ) ( PERSON-AT ?auto_1408 ?auto_1416 ) ( not ( = ?auto_1407 ?auto_1416 ) ) ( PERSON-AT ?auto_1409 ?auto_1412 ) ( AIRCRAFT-AT ?auto_1415 ?auto_1407 ) ( FUEL-LEVEL ?auto_1415 ?auto_1411 ) ( not ( = ?auto_1407 ?auto_1412 ) ) ( not ( = ?auto_1409 ?auto_1408 ) ) ( not ( = ?auto_1416 ?auto_1412 ) ) ( not ( = ?auto_1409 ?auto_1410 ) ) ( not ( = ?auto_1408 ?auto_1410 ) ) ( not ( = ?auto_1413 ?auto_1416 ) ) ( not ( = ?auto_1413 ?auto_1412 ) ) )
    :subtasks
    ( ( FLY-3PPL ?auto_1409 ?auto_1410 ?auto_1408 ?auto_1407 )
      ( FLY-3PPL-VERIFY ?auto_1408 ?auto_1409 ?auto_1410 ?auto_1407 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_1429 - PERSON
      ?auto_1430 - PERSON
      ?auto_1431 - PERSON
      ?auto_1428 - CITY
    )
    :vars
    (
      ?auto_1432 - FLEVEL
      ?auto_1435 - FLEVEL
      ?auto_1434 - CITY
      ?auto_1437 - CITY
      ?auto_1433 - CITY
      ?auto_1436 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1432 ?auto_1435 ) ( PERSON-AT ?auto_1430 ?auto_1434 ) ( not ( = ?auto_1428 ?auto_1434 ) ) ( not ( = ?auto_1432 ?auto_1435 ) ) ( PERSON-AT ?auto_1429 ?auto_1437 ) ( not ( = ?auto_1428 ?auto_1437 ) ) ( PERSON-AT ?auto_1431 ?auto_1433 ) ( AIRCRAFT-AT ?auto_1436 ?auto_1428 ) ( FUEL-LEVEL ?auto_1436 ?auto_1432 ) ( not ( = ?auto_1428 ?auto_1433 ) ) ( not ( = ?auto_1431 ?auto_1429 ) ) ( not ( = ?auto_1437 ?auto_1433 ) ) ( not ( = ?auto_1431 ?auto_1430 ) ) ( not ( = ?auto_1429 ?auto_1430 ) ) ( not ( = ?auto_1434 ?auto_1437 ) ) ( not ( = ?auto_1434 ?auto_1433 ) ) )
    :subtasks
    ( ( FLY-3PPL ?auto_1431 ?auto_1430 ?auto_1429 ?auto_1428 )
      ( FLY-3PPL-VERIFY ?auto_1429 ?auto_1430 ?auto_1431 ?auto_1428 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_1472 - PERSON
      ?auto_1473 - PERSON
      ?auto_1474 - PERSON
      ?auto_1471 - CITY
    )
    :vars
    (
      ?auto_1475 - FLEVEL
      ?auto_1478 - FLEVEL
      ?auto_1477 - CITY
      ?auto_1480 - CITY
      ?auto_1476 - CITY
      ?auto_1479 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1475 ?auto_1478 ) ( PERSON-AT ?auto_1472 ?auto_1477 ) ( not ( = ?auto_1471 ?auto_1477 ) ) ( not ( = ?auto_1475 ?auto_1478 ) ) ( PERSON-AT ?auto_1474 ?auto_1480 ) ( not ( = ?auto_1471 ?auto_1480 ) ) ( PERSON-AT ?auto_1473 ?auto_1476 ) ( AIRCRAFT-AT ?auto_1479 ?auto_1471 ) ( FUEL-LEVEL ?auto_1479 ?auto_1475 ) ( not ( = ?auto_1471 ?auto_1476 ) ) ( not ( = ?auto_1473 ?auto_1474 ) ) ( not ( = ?auto_1480 ?auto_1476 ) ) ( not ( = ?auto_1473 ?auto_1472 ) ) ( not ( = ?auto_1474 ?auto_1472 ) ) ( not ( = ?auto_1477 ?auto_1480 ) ) ( not ( = ?auto_1477 ?auto_1476 ) ) )
    :subtasks
    ( ( FLY-3PPL ?auto_1473 ?auto_1472 ?auto_1474 ?auto_1471 )
      ( FLY-3PPL-VERIFY ?auto_1472 ?auto_1473 ?auto_1474 ?auto_1471 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_1493 - PERSON
      ?auto_1494 - PERSON
      ?auto_1495 - PERSON
      ?auto_1492 - CITY
    )
    :vars
    (
      ?auto_1496 - FLEVEL
      ?auto_1499 - FLEVEL
      ?auto_1498 - CITY
      ?auto_1501 - CITY
      ?auto_1497 - CITY
      ?auto_1500 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1496 ?auto_1499 ) ( PERSON-AT ?auto_1493 ?auto_1498 ) ( not ( = ?auto_1492 ?auto_1498 ) ) ( not ( = ?auto_1496 ?auto_1499 ) ) ( PERSON-AT ?auto_1494 ?auto_1501 ) ( not ( = ?auto_1492 ?auto_1501 ) ) ( PERSON-AT ?auto_1495 ?auto_1497 ) ( AIRCRAFT-AT ?auto_1500 ?auto_1492 ) ( FUEL-LEVEL ?auto_1500 ?auto_1496 ) ( not ( = ?auto_1492 ?auto_1497 ) ) ( not ( = ?auto_1495 ?auto_1494 ) ) ( not ( = ?auto_1501 ?auto_1497 ) ) ( not ( = ?auto_1495 ?auto_1493 ) ) ( not ( = ?auto_1494 ?auto_1493 ) ) ( not ( = ?auto_1498 ?auto_1501 ) ) ( not ( = ?auto_1498 ?auto_1497 ) ) )
    :subtasks
    ( ( FLY-3PPL ?auto_1495 ?auto_1493 ?auto_1494 ?auto_1492 )
      ( FLY-3PPL-VERIFY ?auto_1493 ?auto_1494 ?auto_1495 ?auto_1492 ) )
  )

)

