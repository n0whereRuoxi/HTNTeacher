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

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_15078 - OBJ
      ?auto_15077 - LOCATION
    )
    :vars
    (
      ?auto_15079 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_15079 ?auto_15077 ) ( IN-TRUCK ?auto_15078 ?auto_15079 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_15078 ?auto_15079 ?auto_15077 )
      ( DELIVER-1PKG-VERIFY ?auto_15078 ?auto_15077 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_15096 - OBJ
      ?auto_15095 - LOCATION
    )
    :vars
    (
      ?auto_15097 - TRUCK
      ?auto_15098 - LOCATION
      ?auto_15099 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_15096 ?auto_15097 ) ( TRUCK-AT ?auto_15097 ?auto_15098 ) ( IN-CITY ?auto_15098 ?auto_15099 ) ( IN-CITY ?auto_15095 ?auto_15099 ) ( not ( = ?auto_15095 ?auto_15098 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_15097 ?auto_15098 ?auto_15095 ?auto_15099 )
      ( DELIVER-1PKG ?auto_15096 ?auto_15095 )
      ( DELIVER-1PKG-VERIFY ?auto_15096 ?auto_15095 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_15122 - OBJ
      ?auto_15121 - LOCATION
    )
    :vars
    (
      ?auto_15123 - TRUCK
      ?auto_15125 - LOCATION
      ?auto_15124 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_15123 ?auto_15125 ) ( IN-CITY ?auto_15125 ?auto_15124 ) ( IN-CITY ?auto_15121 ?auto_15124 ) ( not ( = ?auto_15121 ?auto_15125 ) ) ( OBJ-AT ?auto_15122 ?auto_15125 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_15122 ?auto_15123 ?auto_15125 )
      ( DELIVER-1PKG ?auto_15122 ?auto_15121 )
      ( DELIVER-1PKG-VERIFY ?auto_15122 ?auto_15121 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_15148 - OBJ
      ?auto_15147 - LOCATION
    )
    :vars
    (
      ?auto_15150 - LOCATION
      ?auto_15151 - CITY
      ?auto_15149 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15150 ?auto_15151 ) ( IN-CITY ?auto_15147 ?auto_15151 ) ( not ( = ?auto_15147 ?auto_15150 ) ) ( OBJ-AT ?auto_15148 ?auto_15150 ) ( TRUCK-AT ?auto_15149 ?auto_15147 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_15149 ?auto_15147 ?auto_15150 ?auto_15151 )
      ( DELIVER-1PKG ?auto_15148 ?auto_15147 )
      ( DELIVER-1PKG-VERIFY ?auto_15148 ?auto_15147 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_15291 - OBJ
      ?auto_15292 - OBJ
      ?auto_15290 - LOCATION
    )
    :vars
    (
      ?auto_15293 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_15293 ?auto_15290 ) ( IN-TRUCK ?auto_15292 ?auto_15293 ) ( OBJ-AT ?auto_15291 ?auto_15290 ) ( not ( = ?auto_15291 ?auto_15292 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_15292 ?auto_15290 )
      ( DELIVER-2PKG-VERIFY ?auto_15291 ?auto_15292 ?auto_15290 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_15295 - OBJ
      ?auto_15296 - OBJ
      ?auto_15294 - LOCATION
    )
    :vars
    (
      ?auto_15297 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_15297 ?auto_15294 ) ( IN-TRUCK ?auto_15295 ?auto_15297 ) ( OBJ-AT ?auto_15296 ?auto_15294 ) ( not ( = ?auto_15295 ?auto_15296 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_15295 ?auto_15294 )
      ( DELIVER-2PKG-VERIFY ?auto_15295 ?auto_15296 ?auto_15294 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15303 - OBJ
      ?auto_15304 - OBJ
      ?auto_15305 - OBJ
      ?auto_15302 - LOCATION
    )
    :vars
    (
      ?auto_15306 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_15306 ?auto_15302 ) ( IN-TRUCK ?auto_15305 ?auto_15306 ) ( OBJ-AT ?auto_15303 ?auto_15302 ) ( OBJ-AT ?auto_15304 ?auto_15302 ) ( not ( = ?auto_15303 ?auto_15304 ) ) ( not ( = ?auto_15303 ?auto_15305 ) ) ( not ( = ?auto_15304 ?auto_15305 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_15305 ?auto_15302 )
      ( DELIVER-3PKG-VERIFY ?auto_15303 ?auto_15304 ?auto_15305 ?auto_15302 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15308 - OBJ
      ?auto_15309 - OBJ
      ?auto_15310 - OBJ
      ?auto_15307 - LOCATION
    )
    :vars
    (
      ?auto_15311 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_15311 ?auto_15307 ) ( IN-TRUCK ?auto_15309 ?auto_15311 ) ( OBJ-AT ?auto_15308 ?auto_15307 ) ( OBJ-AT ?auto_15310 ?auto_15307 ) ( not ( = ?auto_15308 ?auto_15309 ) ) ( not ( = ?auto_15308 ?auto_15310 ) ) ( not ( = ?auto_15309 ?auto_15310 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_15309 ?auto_15307 )
      ( DELIVER-3PKG-VERIFY ?auto_15308 ?auto_15309 ?auto_15310 ?auto_15307 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15318 - OBJ
      ?auto_15319 - OBJ
      ?auto_15320 - OBJ
      ?auto_15317 - LOCATION
    )
    :vars
    (
      ?auto_15321 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_15321 ?auto_15317 ) ( IN-TRUCK ?auto_15318 ?auto_15321 ) ( OBJ-AT ?auto_15319 ?auto_15317 ) ( OBJ-AT ?auto_15320 ?auto_15317 ) ( not ( = ?auto_15318 ?auto_15319 ) ) ( not ( = ?auto_15318 ?auto_15320 ) ) ( not ( = ?auto_15319 ?auto_15320 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_15318 ?auto_15317 )
      ( DELIVER-3PKG-VERIFY ?auto_15318 ?auto_15319 ?auto_15320 ?auto_15317 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_15338 - OBJ
      ?auto_15339 - OBJ
      ?auto_15341 - OBJ
      ?auto_15340 - OBJ
      ?auto_15337 - LOCATION
    )
    :vars
    (
      ?auto_15342 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_15342 ?auto_15337 ) ( IN-TRUCK ?auto_15340 ?auto_15342 ) ( OBJ-AT ?auto_15338 ?auto_15337 ) ( OBJ-AT ?auto_15339 ?auto_15337 ) ( OBJ-AT ?auto_15341 ?auto_15337 ) ( not ( = ?auto_15338 ?auto_15339 ) ) ( not ( = ?auto_15338 ?auto_15341 ) ) ( not ( = ?auto_15338 ?auto_15340 ) ) ( not ( = ?auto_15339 ?auto_15341 ) ) ( not ( = ?auto_15339 ?auto_15340 ) ) ( not ( = ?auto_15341 ?auto_15340 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_15340 ?auto_15337 )
      ( DELIVER-4PKG-VERIFY ?auto_15338 ?auto_15339 ?auto_15341 ?auto_15340 ?auto_15337 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_15344 - OBJ
      ?auto_15345 - OBJ
      ?auto_15347 - OBJ
      ?auto_15346 - OBJ
      ?auto_15343 - LOCATION
    )
    :vars
    (
      ?auto_15348 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_15348 ?auto_15343 ) ( IN-TRUCK ?auto_15347 ?auto_15348 ) ( OBJ-AT ?auto_15344 ?auto_15343 ) ( OBJ-AT ?auto_15345 ?auto_15343 ) ( OBJ-AT ?auto_15346 ?auto_15343 ) ( not ( = ?auto_15344 ?auto_15345 ) ) ( not ( = ?auto_15344 ?auto_15347 ) ) ( not ( = ?auto_15344 ?auto_15346 ) ) ( not ( = ?auto_15345 ?auto_15347 ) ) ( not ( = ?auto_15345 ?auto_15346 ) ) ( not ( = ?auto_15347 ?auto_15346 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_15347 ?auto_15343 )
      ( DELIVER-4PKG-VERIFY ?auto_15344 ?auto_15345 ?auto_15347 ?auto_15346 ?auto_15343 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_15356 - OBJ
      ?auto_15357 - OBJ
      ?auto_15359 - OBJ
      ?auto_15358 - OBJ
      ?auto_15355 - LOCATION
    )
    :vars
    (
      ?auto_15360 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_15360 ?auto_15355 ) ( IN-TRUCK ?auto_15357 ?auto_15360 ) ( OBJ-AT ?auto_15356 ?auto_15355 ) ( OBJ-AT ?auto_15359 ?auto_15355 ) ( OBJ-AT ?auto_15358 ?auto_15355 ) ( not ( = ?auto_15356 ?auto_15357 ) ) ( not ( = ?auto_15356 ?auto_15359 ) ) ( not ( = ?auto_15356 ?auto_15358 ) ) ( not ( = ?auto_15357 ?auto_15359 ) ) ( not ( = ?auto_15357 ?auto_15358 ) ) ( not ( = ?auto_15359 ?auto_15358 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_15357 ?auto_15355 )
      ( DELIVER-4PKG-VERIFY ?auto_15356 ?auto_15357 ?auto_15359 ?auto_15358 ?auto_15355 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_15380 - OBJ
      ?auto_15381 - OBJ
      ?auto_15383 - OBJ
      ?auto_15382 - OBJ
      ?auto_15379 - LOCATION
    )
    :vars
    (
      ?auto_15384 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_15384 ?auto_15379 ) ( IN-TRUCK ?auto_15380 ?auto_15384 ) ( OBJ-AT ?auto_15381 ?auto_15379 ) ( OBJ-AT ?auto_15383 ?auto_15379 ) ( OBJ-AT ?auto_15382 ?auto_15379 ) ( not ( = ?auto_15380 ?auto_15381 ) ) ( not ( = ?auto_15380 ?auto_15383 ) ) ( not ( = ?auto_15380 ?auto_15382 ) ) ( not ( = ?auto_15381 ?auto_15383 ) ) ( not ( = ?auto_15381 ?auto_15382 ) ) ( not ( = ?auto_15383 ?auto_15382 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_15380 ?auto_15379 )
      ( DELIVER-4PKG-VERIFY ?auto_15380 ?auto_15381 ?auto_15383 ?auto_15382 ?auto_15379 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_15433 - OBJ
      ?auto_15434 - OBJ
      ?auto_15432 - LOCATION
    )
    :vars
    (
      ?auto_15435 - TRUCK
      ?auto_15436 - LOCATION
      ?auto_15437 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_15434 ?auto_15435 ) ( TRUCK-AT ?auto_15435 ?auto_15436 ) ( IN-CITY ?auto_15436 ?auto_15437 ) ( IN-CITY ?auto_15432 ?auto_15437 ) ( not ( = ?auto_15432 ?auto_15436 ) ) ( OBJ-AT ?auto_15433 ?auto_15432 ) ( not ( = ?auto_15433 ?auto_15434 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_15434 ?auto_15432 )
      ( DELIVER-2PKG-VERIFY ?auto_15433 ?auto_15434 ?auto_15432 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_15439 - OBJ
      ?auto_15440 - OBJ
      ?auto_15438 - LOCATION
    )
    :vars
    (
      ?auto_15441 - TRUCK
      ?auto_15443 - LOCATION
      ?auto_15442 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_15439 ?auto_15441 ) ( TRUCK-AT ?auto_15441 ?auto_15443 ) ( IN-CITY ?auto_15443 ?auto_15442 ) ( IN-CITY ?auto_15438 ?auto_15442 ) ( not ( = ?auto_15438 ?auto_15443 ) ) ( OBJ-AT ?auto_15440 ?auto_15438 ) ( not ( = ?auto_15440 ?auto_15439 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15440 ?auto_15439 ?auto_15438 )
      ( DELIVER-2PKG-VERIFY ?auto_15439 ?auto_15440 ?auto_15438 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15452 - OBJ
      ?auto_15453 - OBJ
      ?auto_15454 - OBJ
      ?auto_15451 - LOCATION
    )
    :vars
    (
      ?auto_15455 - TRUCK
      ?auto_15457 - LOCATION
      ?auto_15456 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_15454 ?auto_15455 ) ( TRUCK-AT ?auto_15455 ?auto_15457 ) ( IN-CITY ?auto_15457 ?auto_15456 ) ( IN-CITY ?auto_15451 ?auto_15456 ) ( not ( = ?auto_15451 ?auto_15457 ) ) ( OBJ-AT ?auto_15453 ?auto_15451 ) ( not ( = ?auto_15453 ?auto_15454 ) ) ( OBJ-AT ?auto_15452 ?auto_15451 ) ( not ( = ?auto_15452 ?auto_15453 ) ) ( not ( = ?auto_15452 ?auto_15454 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15453 ?auto_15454 ?auto_15451 )
      ( DELIVER-3PKG-VERIFY ?auto_15452 ?auto_15453 ?auto_15454 ?auto_15451 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15459 - OBJ
      ?auto_15460 - OBJ
      ?auto_15461 - OBJ
      ?auto_15458 - LOCATION
    )
    :vars
    (
      ?auto_15462 - TRUCK
      ?auto_15464 - LOCATION
      ?auto_15463 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_15460 ?auto_15462 ) ( TRUCK-AT ?auto_15462 ?auto_15464 ) ( IN-CITY ?auto_15464 ?auto_15463 ) ( IN-CITY ?auto_15458 ?auto_15463 ) ( not ( = ?auto_15458 ?auto_15464 ) ) ( OBJ-AT ?auto_15461 ?auto_15458 ) ( not ( = ?auto_15461 ?auto_15460 ) ) ( OBJ-AT ?auto_15459 ?auto_15458 ) ( not ( = ?auto_15459 ?auto_15460 ) ) ( not ( = ?auto_15459 ?auto_15461 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15461 ?auto_15460 ?auto_15458 )
      ( DELIVER-3PKG-VERIFY ?auto_15459 ?auto_15460 ?auto_15461 ?auto_15458 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15473 - OBJ
      ?auto_15474 - OBJ
      ?auto_15475 - OBJ
      ?auto_15472 - LOCATION
    )
    :vars
    (
      ?auto_15476 - TRUCK
      ?auto_15478 - LOCATION
      ?auto_15477 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_15473 ?auto_15476 ) ( TRUCK-AT ?auto_15476 ?auto_15478 ) ( IN-CITY ?auto_15478 ?auto_15477 ) ( IN-CITY ?auto_15472 ?auto_15477 ) ( not ( = ?auto_15472 ?auto_15478 ) ) ( OBJ-AT ?auto_15475 ?auto_15472 ) ( not ( = ?auto_15475 ?auto_15473 ) ) ( OBJ-AT ?auto_15474 ?auto_15472 ) ( not ( = ?auto_15473 ?auto_15474 ) ) ( not ( = ?auto_15474 ?auto_15475 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15475 ?auto_15473 ?auto_15472 )
      ( DELIVER-3PKG-VERIFY ?auto_15473 ?auto_15474 ?auto_15475 ?auto_15472 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_15502 - OBJ
      ?auto_15503 - OBJ
      ?auto_15505 - OBJ
      ?auto_15504 - OBJ
      ?auto_15501 - LOCATION
    )
    :vars
    (
      ?auto_15506 - TRUCK
      ?auto_15508 - LOCATION
      ?auto_15507 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_15504 ?auto_15506 ) ( TRUCK-AT ?auto_15506 ?auto_15508 ) ( IN-CITY ?auto_15508 ?auto_15507 ) ( IN-CITY ?auto_15501 ?auto_15507 ) ( not ( = ?auto_15501 ?auto_15508 ) ) ( OBJ-AT ?auto_15505 ?auto_15501 ) ( not ( = ?auto_15505 ?auto_15504 ) ) ( OBJ-AT ?auto_15502 ?auto_15501 ) ( OBJ-AT ?auto_15503 ?auto_15501 ) ( not ( = ?auto_15502 ?auto_15503 ) ) ( not ( = ?auto_15502 ?auto_15505 ) ) ( not ( = ?auto_15502 ?auto_15504 ) ) ( not ( = ?auto_15503 ?auto_15505 ) ) ( not ( = ?auto_15503 ?auto_15504 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15505 ?auto_15504 ?auto_15501 )
      ( DELIVER-4PKG-VERIFY ?auto_15502 ?auto_15503 ?auto_15505 ?auto_15504 ?auto_15501 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_15510 - OBJ
      ?auto_15511 - OBJ
      ?auto_15513 - OBJ
      ?auto_15512 - OBJ
      ?auto_15509 - LOCATION
    )
    :vars
    (
      ?auto_15514 - TRUCK
      ?auto_15516 - LOCATION
      ?auto_15515 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_15513 ?auto_15514 ) ( TRUCK-AT ?auto_15514 ?auto_15516 ) ( IN-CITY ?auto_15516 ?auto_15515 ) ( IN-CITY ?auto_15509 ?auto_15515 ) ( not ( = ?auto_15509 ?auto_15516 ) ) ( OBJ-AT ?auto_15510 ?auto_15509 ) ( not ( = ?auto_15510 ?auto_15513 ) ) ( OBJ-AT ?auto_15511 ?auto_15509 ) ( OBJ-AT ?auto_15512 ?auto_15509 ) ( not ( = ?auto_15510 ?auto_15511 ) ) ( not ( = ?auto_15510 ?auto_15512 ) ) ( not ( = ?auto_15511 ?auto_15513 ) ) ( not ( = ?auto_15511 ?auto_15512 ) ) ( not ( = ?auto_15513 ?auto_15512 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15510 ?auto_15513 ?auto_15509 )
      ( DELIVER-4PKG-VERIFY ?auto_15510 ?auto_15511 ?auto_15513 ?auto_15512 ?auto_15509 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_15526 - OBJ
      ?auto_15527 - OBJ
      ?auto_15529 - OBJ
      ?auto_15528 - OBJ
      ?auto_15525 - LOCATION
    )
    :vars
    (
      ?auto_15530 - TRUCK
      ?auto_15532 - LOCATION
      ?auto_15531 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_15527 ?auto_15530 ) ( TRUCK-AT ?auto_15530 ?auto_15532 ) ( IN-CITY ?auto_15532 ?auto_15531 ) ( IN-CITY ?auto_15525 ?auto_15531 ) ( not ( = ?auto_15525 ?auto_15532 ) ) ( OBJ-AT ?auto_15526 ?auto_15525 ) ( not ( = ?auto_15526 ?auto_15527 ) ) ( OBJ-AT ?auto_15529 ?auto_15525 ) ( OBJ-AT ?auto_15528 ?auto_15525 ) ( not ( = ?auto_15526 ?auto_15529 ) ) ( not ( = ?auto_15526 ?auto_15528 ) ) ( not ( = ?auto_15527 ?auto_15529 ) ) ( not ( = ?auto_15527 ?auto_15528 ) ) ( not ( = ?auto_15529 ?auto_15528 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15526 ?auto_15527 ?auto_15525 )
      ( DELIVER-4PKG-VERIFY ?auto_15526 ?auto_15527 ?auto_15529 ?auto_15528 ?auto_15525 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_15558 - OBJ
      ?auto_15559 - OBJ
      ?auto_15561 - OBJ
      ?auto_15560 - OBJ
      ?auto_15557 - LOCATION
    )
    :vars
    (
      ?auto_15562 - TRUCK
      ?auto_15564 - LOCATION
      ?auto_15563 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_15558 ?auto_15562 ) ( TRUCK-AT ?auto_15562 ?auto_15564 ) ( IN-CITY ?auto_15564 ?auto_15563 ) ( IN-CITY ?auto_15557 ?auto_15563 ) ( not ( = ?auto_15557 ?auto_15564 ) ) ( OBJ-AT ?auto_15560 ?auto_15557 ) ( not ( = ?auto_15560 ?auto_15558 ) ) ( OBJ-AT ?auto_15559 ?auto_15557 ) ( OBJ-AT ?auto_15561 ?auto_15557 ) ( not ( = ?auto_15558 ?auto_15559 ) ) ( not ( = ?auto_15558 ?auto_15561 ) ) ( not ( = ?auto_15559 ?auto_15561 ) ) ( not ( = ?auto_15559 ?auto_15560 ) ) ( not ( = ?auto_15561 ?auto_15560 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15560 ?auto_15558 ?auto_15557 )
      ( DELIVER-4PKG-VERIFY ?auto_15558 ?auto_15559 ?auto_15561 ?auto_15560 ?auto_15557 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_15623 - OBJ
      ?auto_15622 - LOCATION
    )
    :vars
    (
      ?auto_15625 - TRUCK
      ?auto_15627 - LOCATION
      ?auto_15626 - CITY
      ?auto_15624 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_15625 ?auto_15627 ) ( IN-CITY ?auto_15627 ?auto_15626 ) ( IN-CITY ?auto_15622 ?auto_15626 ) ( not ( = ?auto_15622 ?auto_15627 ) ) ( OBJ-AT ?auto_15624 ?auto_15622 ) ( not ( = ?auto_15624 ?auto_15623 ) ) ( OBJ-AT ?auto_15623 ?auto_15627 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_15623 ?auto_15625 ?auto_15627 )
      ( DELIVER-2PKG ?auto_15624 ?auto_15623 ?auto_15622 )
      ( DELIVER-1PKG-VERIFY ?auto_15623 ?auto_15622 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_15629 - OBJ
      ?auto_15630 - OBJ
      ?auto_15628 - LOCATION
    )
    :vars
    (
      ?auto_15632 - TRUCK
      ?auto_15631 - LOCATION
      ?auto_15633 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_15632 ?auto_15631 ) ( IN-CITY ?auto_15631 ?auto_15633 ) ( IN-CITY ?auto_15628 ?auto_15633 ) ( not ( = ?auto_15628 ?auto_15631 ) ) ( OBJ-AT ?auto_15629 ?auto_15628 ) ( not ( = ?auto_15629 ?auto_15630 ) ) ( OBJ-AT ?auto_15630 ?auto_15631 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_15630 ?auto_15628 )
      ( DELIVER-2PKG-VERIFY ?auto_15629 ?auto_15630 ?auto_15628 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_15635 - OBJ
      ?auto_15636 - OBJ
      ?auto_15634 - LOCATION
    )
    :vars
    (
      ?auto_15637 - TRUCK
      ?auto_15638 - LOCATION
      ?auto_15639 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_15637 ?auto_15638 ) ( IN-CITY ?auto_15638 ?auto_15639 ) ( IN-CITY ?auto_15634 ?auto_15639 ) ( not ( = ?auto_15634 ?auto_15638 ) ) ( OBJ-AT ?auto_15636 ?auto_15634 ) ( not ( = ?auto_15636 ?auto_15635 ) ) ( OBJ-AT ?auto_15635 ?auto_15638 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15636 ?auto_15635 ?auto_15634 )
      ( DELIVER-2PKG-VERIFY ?auto_15635 ?auto_15636 ?auto_15634 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15648 - OBJ
      ?auto_15649 - OBJ
      ?auto_15650 - OBJ
      ?auto_15647 - LOCATION
    )
    :vars
    (
      ?auto_15651 - TRUCK
      ?auto_15652 - LOCATION
      ?auto_15653 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_15651 ?auto_15652 ) ( IN-CITY ?auto_15652 ?auto_15653 ) ( IN-CITY ?auto_15647 ?auto_15653 ) ( not ( = ?auto_15647 ?auto_15652 ) ) ( OBJ-AT ?auto_15649 ?auto_15647 ) ( not ( = ?auto_15649 ?auto_15650 ) ) ( OBJ-AT ?auto_15650 ?auto_15652 ) ( OBJ-AT ?auto_15648 ?auto_15647 ) ( not ( = ?auto_15648 ?auto_15649 ) ) ( not ( = ?auto_15648 ?auto_15650 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15649 ?auto_15650 ?auto_15647 )
      ( DELIVER-3PKG-VERIFY ?auto_15648 ?auto_15649 ?auto_15650 ?auto_15647 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15655 - OBJ
      ?auto_15656 - OBJ
      ?auto_15657 - OBJ
      ?auto_15654 - LOCATION
    )
    :vars
    (
      ?auto_15658 - TRUCK
      ?auto_15659 - LOCATION
      ?auto_15660 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_15658 ?auto_15659 ) ( IN-CITY ?auto_15659 ?auto_15660 ) ( IN-CITY ?auto_15654 ?auto_15660 ) ( not ( = ?auto_15654 ?auto_15659 ) ) ( OBJ-AT ?auto_15655 ?auto_15654 ) ( not ( = ?auto_15655 ?auto_15656 ) ) ( OBJ-AT ?auto_15656 ?auto_15659 ) ( OBJ-AT ?auto_15657 ?auto_15654 ) ( not ( = ?auto_15655 ?auto_15657 ) ) ( not ( = ?auto_15656 ?auto_15657 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15655 ?auto_15656 ?auto_15654 )
      ( DELIVER-3PKG-VERIFY ?auto_15655 ?auto_15656 ?auto_15657 ?auto_15654 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15669 - OBJ
      ?auto_15670 - OBJ
      ?auto_15671 - OBJ
      ?auto_15668 - LOCATION
    )
    :vars
    (
      ?auto_15672 - TRUCK
      ?auto_15673 - LOCATION
      ?auto_15674 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_15672 ?auto_15673 ) ( IN-CITY ?auto_15673 ?auto_15674 ) ( IN-CITY ?auto_15668 ?auto_15674 ) ( not ( = ?auto_15668 ?auto_15673 ) ) ( OBJ-AT ?auto_15671 ?auto_15668 ) ( not ( = ?auto_15671 ?auto_15669 ) ) ( OBJ-AT ?auto_15669 ?auto_15673 ) ( OBJ-AT ?auto_15670 ?auto_15668 ) ( not ( = ?auto_15669 ?auto_15670 ) ) ( not ( = ?auto_15670 ?auto_15671 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15671 ?auto_15669 ?auto_15668 )
      ( DELIVER-3PKG-VERIFY ?auto_15669 ?auto_15670 ?auto_15671 ?auto_15668 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_15698 - OBJ
      ?auto_15699 - OBJ
      ?auto_15701 - OBJ
      ?auto_15700 - OBJ
      ?auto_15697 - LOCATION
    )
    :vars
    (
      ?auto_15702 - TRUCK
      ?auto_15703 - LOCATION
      ?auto_15704 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_15702 ?auto_15703 ) ( IN-CITY ?auto_15703 ?auto_15704 ) ( IN-CITY ?auto_15697 ?auto_15704 ) ( not ( = ?auto_15697 ?auto_15703 ) ) ( OBJ-AT ?auto_15698 ?auto_15697 ) ( not ( = ?auto_15698 ?auto_15700 ) ) ( OBJ-AT ?auto_15700 ?auto_15703 ) ( OBJ-AT ?auto_15699 ?auto_15697 ) ( OBJ-AT ?auto_15701 ?auto_15697 ) ( not ( = ?auto_15698 ?auto_15699 ) ) ( not ( = ?auto_15698 ?auto_15701 ) ) ( not ( = ?auto_15699 ?auto_15701 ) ) ( not ( = ?auto_15699 ?auto_15700 ) ) ( not ( = ?auto_15701 ?auto_15700 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15698 ?auto_15700 ?auto_15697 )
      ( DELIVER-4PKG-VERIFY ?auto_15698 ?auto_15699 ?auto_15701 ?auto_15700 ?auto_15697 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_15706 - OBJ
      ?auto_15707 - OBJ
      ?auto_15709 - OBJ
      ?auto_15708 - OBJ
      ?auto_15705 - LOCATION
    )
    :vars
    (
      ?auto_15710 - TRUCK
      ?auto_15711 - LOCATION
      ?auto_15712 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_15710 ?auto_15711 ) ( IN-CITY ?auto_15711 ?auto_15712 ) ( IN-CITY ?auto_15705 ?auto_15712 ) ( not ( = ?auto_15705 ?auto_15711 ) ) ( OBJ-AT ?auto_15707 ?auto_15705 ) ( not ( = ?auto_15707 ?auto_15709 ) ) ( OBJ-AT ?auto_15709 ?auto_15711 ) ( OBJ-AT ?auto_15706 ?auto_15705 ) ( OBJ-AT ?auto_15708 ?auto_15705 ) ( not ( = ?auto_15706 ?auto_15707 ) ) ( not ( = ?auto_15706 ?auto_15709 ) ) ( not ( = ?auto_15706 ?auto_15708 ) ) ( not ( = ?auto_15707 ?auto_15708 ) ) ( not ( = ?auto_15709 ?auto_15708 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15707 ?auto_15709 ?auto_15705 )
      ( DELIVER-4PKG-VERIFY ?auto_15706 ?auto_15707 ?auto_15709 ?auto_15708 ?auto_15705 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_15722 - OBJ
      ?auto_15723 - OBJ
      ?auto_15725 - OBJ
      ?auto_15724 - OBJ
      ?auto_15721 - LOCATION
    )
    :vars
    (
      ?auto_15726 - TRUCK
      ?auto_15727 - LOCATION
      ?auto_15728 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_15726 ?auto_15727 ) ( IN-CITY ?auto_15727 ?auto_15728 ) ( IN-CITY ?auto_15721 ?auto_15728 ) ( not ( = ?auto_15721 ?auto_15727 ) ) ( OBJ-AT ?auto_15725 ?auto_15721 ) ( not ( = ?auto_15725 ?auto_15723 ) ) ( OBJ-AT ?auto_15723 ?auto_15727 ) ( OBJ-AT ?auto_15722 ?auto_15721 ) ( OBJ-AT ?auto_15724 ?auto_15721 ) ( not ( = ?auto_15722 ?auto_15723 ) ) ( not ( = ?auto_15722 ?auto_15725 ) ) ( not ( = ?auto_15722 ?auto_15724 ) ) ( not ( = ?auto_15723 ?auto_15724 ) ) ( not ( = ?auto_15725 ?auto_15724 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15725 ?auto_15723 ?auto_15721 )
      ( DELIVER-4PKG-VERIFY ?auto_15722 ?auto_15723 ?auto_15725 ?auto_15724 ?auto_15721 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_15754 - OBJ
      ?auto_15755 - OBJ
      ?auto_15757 - OBJ
      ?auto_15756 - OBJ
      ?auto_15753 - LOCATION
    )
    :vars
    (
      ?auto_15758 - TRUCK
      ?auto_15759 - LOCATION
      ?auto_15760 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_15758 ?auto_15759 ) ( IN-CITY ?auto_15759 ?auto_15760 ) ( IN-CITY ?auto_15753 ?auto_15760 ) ( not ( = ?auto_15753 ?auto_15759 ) ) ( OBJ-AT ?auto_15756 ?auto_15753 ) ( not ( = ?auto_15756 ?auto_15754 ) ) ( OBJ-AT ?auto_15754 ?auto_15759 ) ( OBJ-AT ?auto_15755 ?auto_15753 ) ( OBJ-AT ?auto_15757 ?auto_15753 ) ( not ( = ?auto_15754 ?auto_15755 ) ) ( not ( = ?auto_15754 ?auto_15757 ) ) ( not ( = ?auto_15755 ?auto_15757 ) ) ( not ( = ?auto_15755 ?auto_15756 ) ) ( not ( = ?auto_15757 ?auto_15756 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15756 ?auto_15754 ?auto_15753 )
      ( DELIVER-4PKG-VERIFY ?auto_15754 ?auto_15755 ?auto_15757 ?auto_15756 ?auto_15753 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_15819 - OBJ
      ?auto_15818 - LOCATION
    )
    :vars
    (
      ?auto_15821 - LOCATION
      ?auto_15822 - CITY
      ?auto_15823 - OBJ
      ?auto_15820 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15821 ?auto_15822 ) ( IN-CITY ?auto_15818 ?auto_15822 ) ( not ( = ?auto_15818 ?auto_15821 ) ) ( OBJ-AT ?auto_15823 ?auto_15818 ) ( not ( = ?auto_15823 ?auto_15819 ) ) ( OBJ-AT ?auto_15819 ?auto_15821 ) ( TRUCK-AT ?auto_15820 ?auto_15818 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_15820 ?auto_15818 ?auto_15821 ?auto_15822 )
      ( DELIVER-2PKG ?auto_15823 ?auto_15819 ?auto_15818 )
      ( DELIVER-1PKG-VERIFY ?auto_15819 ?auto_15818 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_15825 - OBJ
      ?auto_15826 - OBJ
      ?auto_15824 - LOCATION
    )
    :vars
    (
      ?auto_15828 - LOCATION
      ?auto_15829 - CITY
      ?auto_15827 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15828 ?auto_15829 ) ( IN-CITY ?auto_15824 ?auto_15829 ) ( not ( = ?auto_15824 ?auto_15828 ) ) ( OBJ-AT ?auto_15825 ?auto_15824 ) ( not ( = ?auto_15825 ?auto_15826 ) ) ( OBJ-AT ?auto_15826 ?auto_15828 ) ( TRUCK-AT ?auto_15827 ?auto_15824 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_15826 ?auto_15824 )
      ( DELIVER-2PKG-VERIFY ?auto_15825 ?auto_15826 ?auto_15824 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_15831 - OBJ
      ?auto_15832 - OBJ
      ?auto_15830 - LOCATION
    )
    :vars
    (
      ?auto_15835 - LOCATION
      ?auto_15833 - CITY
      ?auto_15834 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15835 ?auto_15833 ) ( IN-CITY ?auto_15830 ?auto_15833 ) ( not ( = ?auto_15830 ?auto_15835 ) ) ( OBJ-AT ?auto_15832 ?auto_15830 ) ( not ( = ?auto_15832 ?auto_15831 ) ) ( OBJ-AT ?auto_15831 ?auto_15835 ) ( TRUCK-AT ?auto_15834 ?auto_15830 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15832 ?auto_15831 ?auto_15830 )
      ( DELIVER-2PKG-VERIFY ?auto_15831 ?auto_15832 ?auto_15830 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15844 - OBJ
      ?auto_15845 - OBJ
      ?auto_15846 - OBJ
      ?auto_15843 - LOCATION
    )
    :vars
    (
      ?auto_15849 - LOCATION
      ?auto_15847 - CITY
      ?auto_15848 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15849 ?auto_15847 ) ( IN-CITY ?auto_15843 ?auto_15847 ) ( not ( = ?auto_15843 ?auto_15849 ) ) ( OBJ-AT ?auto_15845 ?auto_15843 ) ( not ( = ?auto_15845 ?auto_15846 ) ) ( OBJ-AT ?auto_15846 ?auto_15849 ) ( TRUCK-AT ?auto_15848 ?auto_15843 ) ( OBJ-AT ?auto_15844 ?auto_15843 ) ( not ( = ?auto_15844 ?auto_15845 ) ) ( not ( = ?auto_15844 ?auto_15846 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15845 ?auto_15846 ?auto_15843 )
      ( DELIVER-3PKG-VERIFY ?auto_15844 ?auto_15845 ?auto_15846 ?auto_15843 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15851 - OBJ
      ?auto_15852 - OBJ
      ?auto_15853 - OBJ
      ?auto_15850 - LOCATION
    )
    :vars
    (
      ?auto_15856 - LOCATION
      ?auto_15854 - CITY
      ?auto_15855 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15856 ?auto_15854 ) ( IN-CITY ?auto_15850 ?auto_15854 ) ( not ( = ?auto_15850 ?auto_15856 ) ) ( OBJ-AT ?auto_15851 ?auto_15850 ) ( not ( = ?auto_15851 ?auto_15852 ) ) ( OBJ-AT ?auto_15852 ?auto_15856 ) ( TRUCK-AT ?auto_15855 ?auto_15850 ) ( OBJ-AT ?auto_15853 ?auto_15850 ) ( not ( = ?auto_15851 ?auto_15853 ) ) ( not ( = ?auto_15852 ?auto_15853 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15851 ?auto_15852 ?auto_15850 )
      ( DELIVER-3PKG-VERIFY ?auto_15851 ?auto_15852 ?auto_15853 ?auto_15850 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15865 - OBJ
      ?auto_15866 - OBJ
      ?auto_15867 - OBJ
      ?auto_15864 - LOCATION
    )
    :vars
    (
      ?auto_15870 - LOCATION
      ?auto_15868 - CITY
      ?auto_15869 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15870 ?auto_15868 ) ( IN-CITY ?auto_15864 ?auto_15868 ) ( not ( = ?auto_15864 ?auto_15870 ) ) ( OBJ-AT ?auto_15867 ?auto_15864 ) ( not ( = ?auto_15867 ?auto_15865 ) ) ( OBJ-AT ?auto_15865 ?auto_15870 ) ( TRUCK-AT ?auto_15869 ?auto_15864 ) ( OBJ-AT ?auto_15866 ?auto_15864 ) ( not ( = ?auto_15865 ?auto_15866 ) ) ( not ( = ?auto_15866 ?auto_15867 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15867 ?auto_15865 ?auto_15864 )
      ( DELIVER-3PKG-VERIFY ?auto_15865 ?auto_15866 ?auto_15867 ?auto_15864 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_15894 - OBJ
      ?auto_15895 - OBJ
      ?auto_15897 - OBJ
      ?auto_15896 - OBJ
      ?auto_15893 - LOCATION
    )
    :vars
    (
      ?auto_15900 - LOCATION
      ?auto_15898 - CITY
      ?auto_15899 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15900 ?auto_15898 ) ( IN-CITY ?auto_15893 ?auto_15898 ) ( not ( = ?auto_15893 ?auto_15900 ) ) ( OBJ-AT ?auto_15897 ?auto_15893 ) ( not ( = ?auto_15897 ?auto_15896 ) ) ( OBJ-AT ?auto_15896 ?auto_15900 ) ( TRUCK-AT ?auto_15899 ?auto_15893 ) ( OBJ-AT ?auto_15894 ?auto_15893 ) ( OBJ-AT ?auto_15895 ?auto_15893 ) ( not ( = ?auto_15894 ?auto_15895 ) ) ( not ( = ?auto_15894 ?auto_15897 ) ) ( not ( = ?auto_15894 ?auto_15896 ) ) ( not ( = ?auto_15895 ?auto_15897 ) ) ( not ( = ?auto_15895 ?auto_15896 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15897 ?auto_15896 ?auto_15893 )
      ( DELIVER-4PKG-VERIFY ?auto_15894 ?auto_15895 ?auto_15897 ?auto_15896 ?auto_15893 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_15902 - OBJ
      ?auto_15903 - OBJ
      ?auto_15905 - OBJ
      ?auto_15904 - OBJ
      ?auto_15901 - LOCATION
    )
    :vars
    (
      ?auto_15908 - LOCATION
      ?auto_15906 - CITY
      ?auto_15907 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15908 ?auto_15906 ) ( IN-CITY ?auto_15901 ?auto_15906 ) ( not ( = ?auto_15901 ?auto_15908 ) ) ( OBJ-AT ?auto_15904 ?auto_15901 ) ( not ( = ?auto_15904 ?auto_15905 ) ) ( OBJ-AT ?auto_15905 ?auto_15908 ) ( TRUCK-AT ?auto_15907 ?auto_15901 ) ( OBJ-AT ?auto_15902 ?auto_15901 ) ( OBJ-AT ?auto_15903 ?auto_15901 ) ( not ( = ?auto_15902 ?auto_15903 ) ) ( not ( = ?auto_15902 ?auto_15905 ) ) ( not ( = ?auto_15902 ?auto_15904 ) ) ( not ( = ?auto_15903 ?auto_15905 ) ) ( not ( = ?auto_15903 ?auto_15904 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15904 ?auto_15905 ?auto_15901 )
      ( DELIVER-4PKG-VERIFY ?auto_15902 ?auto_15903 ?auto_15905 ?auto_15904 ?auto_15901 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_15918 - OBJ
      ?auto_15919 - OBJ
      ?auto_15921 - OBJ
      ?auto_15920 - OBJ
      ?auto_15917 - LOCATION
    )
    :vars
    (
      ?auto_15924 - LOCATION
      ?auto_15922 - CITY
      ?auto_15923 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15924 ?auto_15922 ) ( IN-CITY ?auto_15917 ?auto_15922 ) ( not ( = ?auto_15917 ?auto_15924 ) ) ( OBJ-AT ?auto_15921 ?auto_15917 ) ( not ( = ?auto_15921 ?auto_15919 ) ) ( OBJ-AT ?auto_15919 ?auto_15924 ) ( TRUCK-AT ?auto_15923 ?auto_15917 ) ( OBJ-AT ?auto_15918 ?auto_15917 ) ( OBJ-AT ?auto_15920 ?auto_15917 ) ( not ( = ?auto_15918 ?auto_15919 ) ) ( not ( = ?auto_15918 ?auto_15921 ) ) ( not ( = ?auto_15918 ?auto_15920 ) ) ( not ( = ?auto_15919 ?auto_15920 ) ) ( not ( = ?auto_15921 ?auto_15920 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15921 ?auto_15919 ?auto_15917 )
      ( DELIVER-4PKG-VERIFY ?auto_15918 ?auto_15919 ?auto_15921 ?auto_15920 ?auto_15917 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_15950 - OBJ
      ?auto_15951 - OBJ
      ?auto_15953 - OBJ
      ?auto_15952 - OBJ
      ?auto_15949 - LOCATION
    )
    :vars
    (
      ?auto_15956 - LOCATION
      ?auto_15954 - CITY
      ?auto_15955 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15956 ?auto_15954 ) ( IN-CITY ?auto_15949 ?auto_15954 ) ( not ( = ?auto_15949 ?auto_15956 ) ) ( OBJ-AT ?auto_15952 ?auto_15949 ) ( not ( = ?auto_15952 ?auto_15950 ) ) ( OBJ-AT ?auto_15950 ?auto_15956 ) ( TRUCK-AT ?auto_15955 ?auto_15949 ) ( OBJ-AT ?auto_15951 ?auto_15949 ) ( OBJ-AT ?auto_15953 ?auto_15949 ) ( not ( = ?auto_15950 ?auto_15951 ) ) ( not ( = ?auto_15950 ?auto_15953 ) ) ( not ( = ?auto_15951 ?auto_15953 ) ) ( not ( = ?auto_15951 ?auto_15952 ) ) ( not ( = ?auto_15953 ?auto_15952 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15952 ?auto_15950 ?auto_15949 )
      ( DELIVER-4PKG-VERIFY ?auto_15950 ?auto_15951 ?auto_15953 ?auto_15952 ?auto_15949 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_16015 - OBJ
      ?auto_16014 - LOCATION
    )
    :vars
    (
      ?auto_16019 - LOCATION
      ?auto_16017 - CITY
      ?auto_16016 - OBJ
      ?auto_16018 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16019 ?auto_16017 ) ( IN-CITY ?auto_16014 ?auto_16017 ) ( not ( = ?auto_16014 ?auto_16019 ) ) ( not ( = ?auto_16016 ?auto_16015 ) ) ( OBJ-AT ?auto_16015 ?auto_16019 ) ( TRUCK-AT ?auto_16018 ?auto_16014 ) ( IN-TRUCK ?auto_16016 ?auto_16018 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_16016 ?auto_16014 )
      ( DELIVER-2PKG ?auto_16016 ?auto_16015 ?auto_16014 )
      ( DELIVER-1PKG-VERIFY ?auto_16015 ?auto_16014 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_16021 - OBJ
      ?auto_16022 - OBJ
      ?auto_16020 - LOCATION
    )
    :vars
    (
      ?auto_16023 - LOCATION
      ?auto_16024 - CITY
      ?auto_16025 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16023 ?auto_16024 ) ( IN-CITY ?auto_16020 ?auto_16024 ) ( not ( = ?auto_16020 ?auto_16023 ) ) ( not ( = ?auto_16021 ?auto_16022 ) ) ( OBJ-AT ?auto_16022 ?auto_16023 ) ( TRUCK-AT ?auto_16025 ?auto_16020 ) ( IN-TRUCK ?auto_16021 ?auto_16025 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_16022 ?auto_16020 )
      ( DELIVER-2PKG-VERIFY ?auto_16021 ?auto_16022 ?auto_16020 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_16027 - OBJ
      ?auto_16028 - OBJ
      ?auto_16026 - LOCATION
    )
    :vars
    (
      ?auto_16030 - LOCATION
      ?auto_16031 - CITY
      ?auto_16029 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16030 ?auto_16031 ) ( IN-CITY ?auto_16026 ?auto_16031 ) ( not ( = ?auto_16026 ?auto_16030 ) ) ( not ( = ?auto_16028 ?auto_16027 ) ) ( OBJ-AT ?auto_16027 ?auto_16030 ) ( TRUCK-AT ?auto_16029 ?auto_16026 ) ( IN-TRUCK ?auto_16028 ?auto_16029 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16028 ?auto_16027 ?auto_16026 )
      ( DELIVER-2PKG-VERIFY ?auto_16027 ?auto_16028 ?auto_16026 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_16211 - OBJ
      ?auto_16210 - LOCATION
    )
    :vars
    (
      ?auto_16213 - LOCATION
      ?auto_16214 - CITY
      ?auto_16215 - OBJ
      ?auto_16212 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16213 ?auto_16214 ) ( IN-CITY ?auto_16210 ?auto_16214 ) ( not ( = ?auto_16210 ?auto_16213 ) ) ( not ( = ?auto_16215 ?auto_16211 ) ) ( OBJ-AT ?auto_16211 ?auto_16213 ) ( IN-TRUCK ?auto_16215 ?auto_16212 ) ( TRUCK-AT ?auto_16212 ?auto_16213 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_16212 ?auto_16213 ?auto_16210 ?auto_16214 )
      ( DELIVER-2PKG ?auto_16215 ?auto_16211 ?auto_16210 )
      ( DELIVER-1PKG-VERIFY ?auto_16211 ?auto_16210 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_16217 - OBJ
      ?auto_16218 - OBJ
      ?auto_16216 - LOCATION
    )
    :vars
    (
      ?auto_16220 - LOCATION
      ?auto_16219 - CITY
      ?auto_16221 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16220 ?auto_16219 ) ( IN-CITY ?auto_16216 ?auto_16219 ) ( not ( = ?auto_16216 ?auto_16220 ) ) ( not ( = ?auto_16217 ?auto_16218 ) ) ( OBJ-AT ?auto_16218 ?auto_16220 ) ( IN-TRUCK ?auto_16217 ?auto_16221 ) ( TRUCK-AT ?auto_16221 ?auto_16220 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_16218 ?auto_16216 )
      ( DELIVER-2PKG-VERIFY ?auto_16217 ?auto_16218 ?auto_16216 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_16223 - OBJ
      ?auto_16224 - OBJ
      ?auto_16222 - LOCATION
    )
    :vars
    (
      ?auto_16226 - LOCATION
      ?auto_16227 - CITY
      ?auto_16225 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16226 ?auto_16227 ) ( IN-CITY ?auto_16222 ?auto_16227 ) ( not ( = ?auto_16222 ?auto_16226 ) ) ( not ( = ?auto_16224 ?auto_16223 ) ) ( OBJ-AT ?auto_16223 ?auto_16226 ) ( IN-TRUCK ?auto_16224 ?auto_16225 ) ( TRUCK-AT ?auto_16225 ?auto_16226 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16224 ?auto_16223 ?auto_16222 )
      ( DELIVER-2PKG-VERIFY ?auto_16223 ?auto_16224 ?auto_16222 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_17744 - OBJ
      ?auto_17745 - OBJ
      ?auto_17746 - OBJ
      ?auto_17743 - LOCATION
    )
    :vars
    (
      ?auto_17749 - TRUCK
      ?auto_17748 - LOCATION
      ?auto_17747 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_17745 ?auto_17749 ) ( TRUCK-AT ?auto_17749 ?auto_17748 ) ( IN-CITY ?auto_17748 ?auto_17747 ) ( IN-CITY ?auto_17743 ?auto_17747 ) ( not ( = ?auto_17743 ?auto_17748 ) ) ( OBJ-AT ?auto_17744 ?auto_17743 ) ( not ( = ?auto_17744 ?auto_17745 ) ) ( OBJ-AT ?auto_17746 ?auto_17743 ) ( not ( = ?auto_17744 ?auto_17746 ) ) ( not ( = ?auto_17745 ?auto_17746 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_17744 ?auto_17745 ?auto_17743 )
      ( DELIVER-3PKG-VERIFY ?auto_17744 ?auto_17745 ?auto_17746 ?auto_17743 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_17766 - OBJ
      ?auto_17767 - OBJ
      ?auto_17768 - OBJ
      ?auto_17765 - LOCATION
    )
    :vars
    (
      ?auto_17772 - TRUCK
      ?auto_17771 - LOCATION
      ?auto_17770 - CITY
      ?auto_17769 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_17768 ?auto_17772 ) ( TRUCK-AT ?auto_17772 ?auto_17771 ) ( IN-CITY ?auto_17771 ?auto_17770 ) ( IN-CITY ?auto_17765 ?auto_17770 ) ( not ( = ?auto_17765 ?auto_17771 ) ) ( OBJ-AT ?auto_17769 ?auto_17765 ) ( not ( = ?auto_17769 ?auto_17768 ) ) ( OBJ-AT ?auto_17766 ?auto_17765 ) ( OBJ-AT ?auto_17767 ?auto_17765 ) ( not ( = ?auto_17766 ?auto_17767 ) ) ( not ( = ?auto_17766 ?auto_17768 ) ) ( not ( = ?auto_17766 ?auto_17769 ) ) ( not ( = ?auto_17767 ?auto_17768 ) ) ( not ( = ?auto_17767 ?auto_17769 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_17769 ?auto_17768 ?auto_17765 )
      ( DELIVER-3PKG-VERIFY ?auto_17766 ?auto_17767 ?auto_17768 ?auto_17765 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_17778 - OBJ
      ?auto_17779 - OBJ
      ?auto_17780 - OBJ
      ?auto_17777 - LOCATION
    )
    :vars
    (
      ?auto_17784 - TRUCK
      ?auto_17783 - LOCATION
      ?auto_17782 - CITY
      ?auto_17781 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_17779 ?auto_17784 ) ( TRUCK-AT ?auto_17784 ?auto_17783 ) ( IN-CITY ?auto_17783 ?auto_17782 ) ( IN-CITY ?auto_17777 ?auto_17782 ) ( not ( = ?auto_17777 ?auto_17783 ) ) ( OBJ-AT ?auto_17781 ?auto_17777 ) ( not ( = ?auto_17781 ?auto_17779 ) ) ( OBJ-AT ?auto_17778 ?auto_17777 ) ( OBJ-AT ?auto_17780 ?auto_17777 ) ( not ( = ?auto_17778 ?auto_17779 ) ) ( not ( = ?auto_17778 ?auto_17780 ) ) ( not ( = ?auto_17778 ?auto_17781 ) ) ( not ( = ?auto_17779 ?auto_17780 ) ) ( not ( = ?auto_17780 ?auto_17781 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_17781 ?auto_17779 ?auto_17777 )
      ( DELIVER-3PKG-VERIFY ?auto_17778 ?auto_17779 ?auto_17780 ?auto_17777 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_17816 - OBJ
      ?auto_17817 - OBJ
      ?auto_17818 - OBJ
      ?auto_17815 - LOCATION
    )
    :vars
    (
      ?auto_17822 - TRUCK
      ?auto_17821 - LOCATION
      ?auto_17820 - CITY
      ?auto_17819 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_17816 ?auto_17822 ) ( TRUCK-AT ?auto_17822 ?auto_17821 ) ( IN-CITY ?auto_17821 ?auto_17820 ) ( IN-CITY ?auto_17815 ?auto_17820 ) ( not ( = ?auto_17815 ?auto_17821 ) ) ( OBJ-AT ?auto_17819 ?auto_17815 ) ( not ( = ?auto_17819 ?auto_17816 ) ) ( OBJ-AT ?auto_17817 ?auto_17815 ) ( OBJ-AT ?auto_17818 ?auto_17815 ) ( not ( = ?auto_17816 ?auto_17817 ) ) ( not ( = ?auto_17816 ?auto_17818 ) ) ( not ( = ?auto_17817 ?auto_17818 ) ) ( not ( = ?auto_17817 ?auto_17819 ) ) ( not ( = ?auto_17818 ?auto_17819 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_17819 ?auto_17816 ?auto_17815 )
      ( DELIVER-3PKG-VERIFY ?auto_17816 ?auto_17817 ?auto_17818 ?auto_17815 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_17863 - OBJ
      ?auto_17864 - OBJ
      ?auto_17866 - OBJ
      ?auto_17865 - OBJ
      ?auto_17862 - LOCATION
    )
    :vars
    (
      ?auto_17869 - TRUCK
      ?auto_17868 - LOCATION
      ?auto_17867 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_17865 ?auto_17869 ) ( TRUCK-AT ?auto_17869 ?auto_17868 ) ( IN-CITY ?auto_17868 ?auto_17867 ) ( IN-CITY ?auto_17862 ?auto_17867 ) ( not ( = ?auto_17862 ?auto_17868 ) ) ( OBJ-AT ?auto_17864 ?auto_17862 ) ( not ( = ?auto_17864 ?auto_17865 ) ) ( OBJ-AT ?auto_17863 ?auto_17862 ) ( OBJ-AT ?auto_17866 ?auto_17862 ) ( not ( = ?auto_17863 ?auto_17864 ) ) ( not ( = ?auto_17863 ?auto_17866 ) ) ( not ( = ?auto_17863 ?auto_17865 ) ) ( not ( = ?auto_17864 ?auto_17866 ) ) ( not ( = ?auto_17866 ?auto_17865 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_17864 ?auto_17865 ?auto_17862 )
      ( DELIVER-4PKG-VERIFY ?auto_17863 ?auto_17864 ?auto_17866 ?auto_17865 ?auto_17862 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_17871 - OBJ
      ?auto_17872 - OBJ
      ?auto_17874 - OBJ
      ?auto_17873 - OBJ
      ?auto_17870 - LOCATION
    )
    :vars
    (
      ?auto_17877 - TRUCK
      ?auto_17876 - LOCATION
      ?auto_17875 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_17874 ?auto_17877 ) ( TRUCK-AT ?auto_17877 ?auto_17876 ) ( IN-CITY ?auto_17876 ?auto_17875 ) ( IN-CITY ?auto_17870 ?auto_17875 ) ( not ( = ?auto_17870 ?auto_17876 ) ) ( OBJ-AT ?auto_17872 ?auto_17870 ) ( not ( = ?auto_17872 ?auto_17874 ) ) ( OBJ-AT ?auto_17871 ?auto_17870 ) ( OBJ-AT ?auto_17873 ?auto_17870 ) ( not ( = ?auto_17871 ?auto_17872 ) ) ( not ( = ?auto_17871 ?auto_17874 ) ) ( not ( = ?auto_17871 ?auto_17873 ) ) ( not ( = ?auto_17872 ?auto_17873 ) ) ( not ( = ?auto_17874 ?auto_17873 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_17872 ?auto_17874 ?auto_17870 )
      ( DELIVER-4PKG-VERIFY ?auto_17871 ?auto_17872 ?auto_17874 ?auto_17873 ?auto_17870 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_17903 - OBJ
      ?auto_17904 - OBJ
      ?auto_17906 - OBJ
      ?auto_17905 - OBJ
      ?auto_17902 - LOCATION
    )
    :vars
    (
      ?auto_17909 - TRUCK
      ?auto_17908 - LOCATION
      ?auto_17907 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_17905 ?auto_17909 ) ( TRUCK-AT ?auto_17909 ?auto_17908 ) ( IN-CITY ?auto_17908 ?auto_17907 ) ( IN-CITY ?auto_17902 ?auto_17907 ) ( not ( = ?auto_17902 ?auto_17908 ) ) ( OBJ-AT ?auto_17903 ?auto_17902 ) ( not ( = ?auto_17903 ?auto_17905 ) ) ( OBJ-AT ?auto_17904 ?auto_17902 ) ( OBJ-AT ?auto_17906 ?auto_17902 ) ( not ( = ?auto_17903 ?auto_17904 ) ) ( not ( = ?auto_17903 ?auto_17906 ) ) ( not ( = ?auto_17904 ?auto_17906 ) ) ( not ( = ?auto_17904 ?auto_17905 ) ) ( not ( = ?auto_17906 ?auto_17905 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_17903 ?auto_17905 ?auto_17902 )
      ( DELIVER-4PKG-VERIFY ?auto_17903 ?auto_17904 ?auto_17906 ?auto_17905 ?auto_17902 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_17911 - OBJ
      ?auto_17912 - OBJ
      ?auto_17914 - OBJ
      ?auto_17913 - OBJ
      ?auto_17910 - LOCATION
    )
    :vars
    (
      ?auto_17917 - TRUCK
      ?auto_17916 - LOCATION
      ?auto_17915 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_17914 ?auto_17917 ) ( TRUCK-AT ?auto_17917 ?auto_17916 ) ( IN-CITY ?auto_17916 ?auto_17915 ) ( IN-CITY ?auto_17910 ?auto_17915 ) ( not ( = ?auto_17910 ?auto_17916 ) ) ( OBJ-AT ?auto_17913 ?auto_17910 ) ( not ( = ?auto_17913 ?auto_17914 ) ) ( OBJ-AT ?auto_17911 ?auto_17910 ) ( OBJ-AT ?auto_17912 ?auto_17910 ) ( not ( = ?auto_17911 ?auto_17912 ) ) ( not ( = ?auto_17911 ?auto_17914 ) ) ( not ( = ?auto_17911 ?auto_17913 ) ) ( not ( = ?auto_17912 ?auto_17914 ) ) ( not ( = ?auto_17912 ?auto_17913 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_17913 ?auto_17914 ?auto_17910 )
      ( DELIVER-4PKG-VERIFY ?auto_17911 ?auto_17912 ?auto_17914 ?auto_17913 ?auto_17910 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_17935 - OBJ
      ?auto_17936 - OBJ
      ?auto_17938 - OBJ
      ?auto_17937 - OBJ
      ?auto_17934 - LOCATION
    )
    :vars
    (
      ?auto_17941 - TRUCK
      ?auto_17940 - LOCATION
      ?auto_17939 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_17936 ?auto_17941 ) ( TRUCK-AT ?auto_17941 ?auto_17940 ) ( IN-CITY ?auto_17940 ?auto_17939 ) ( IN-CITY ?auto_17934 ?auto_17939 ) ( not ( = ?auto_17934 ?auto_17940 ) ) ( OBJ-AT ?auto_17938 ?auto_17934 ) ( not ( = ?auto_17938 ?auto_17936 ) ) ( OBJ-AT ?auto_17935 ?auto_17934 ) ( OBJ-AT ?auto_17937 ?auto_17934 ) ( not ( = ?auto_17935 ?auto_17936 ) ) ( not ( = ?auto_17935 ?auto_17938 ) ) ( not ( = ?auto_17935 ?auto_17937 ) ) ( not ( = ?auto_17936 ?auto_17937 ) ) ( not ( = ?auto_17938 ?auto_17937 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_17938 ?auto_17936 ?auto_17934 )
      ( DELIVER-4PKG-VERIFY ?auto_17935 ?auto_17936 ?auto_17938 ?auto_17937 ?auto_17934 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_18055 - OBJ
      ?auto_18056 - OBJ
      ?auto_18058 - OBJ
      ?auto_18057 - OBJ
      ?auto_18054 - LOCATION
    )
    :vars
    (
      ?auto_18062 - TRUCK
      ?auto_18061 - LOCATION
      ?auto_18060 - CITY
      ?auto_18059 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_18057 ?auto_18062 ) ( TRUCK-AT ?auto_18062 ?auto_18061 ) ( IN-CITY ?auto_18061 ?auto_18060 ) ( IN-CITY ?auto_18054 ?auto_18060 ) ( not ( = ?auto_18054 ?auto_18061 ) ) ( OBJ-AT ?auto_18059 ?auto_18054 ) ( not ( = ?auto_18059 ?auto_18057 ) ) ( OBJ-AT ?auto_18055 ?auto_18054 ) ( OBJ-AT ?auto_18056 ?auto_18054 ) ( OBJ-AT ?auto_18058 ?auto_18054 ) ( not ( = ?auto_18055 ?auto_18056 ) ) ( not ( = ?auto_18055 ?auto_18058 ) ) ( not ( = ?auto_18055 ?auto_18057 ) ) ( not ( = ?auto_18055 ?auto_18059 ) ) ( not ( = ?auto_18056 ?auto_18058 ) ) ( not ( = ?auto_18056 ?auto_18057 ) ) ( not ( = ?auto_18056 ?auto_18059 ) ) ( not ( = ?auto_18058 ?auto_18057 ) ) ( not ( = ?auto_18058 ?auto_18059 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_18059 ?auto_18057 ?auto_18054 )
      ( DELIVER-4PKG-VERIFY ?auto_18055 ?auto_18056 ?auto_18058 ?auto_18057 ?auto_18054 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_18072 - OBJ
      ?auto_18073 - OBJ
      ?auto_18075 - OBJ
      ?auto_18074 - OBJ
      ?auto_18071 - LOCATION
    )
    :vars
    (
      ?auto_18079 - TRUCK
      ?auto_18078 - LOCATION
      ?auto_18077 - CITY
      ?auto_18076 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_18075 ?auto_18079 ) ( TRUCK-AT ?auto_18079 ?auto_18078 ) ( IN-CITY ?auto_18078 ?auto_18077 ) ( IN-CITY ?auto_18071 ?auto_18077 ) ( not ( = ?auto_18071 ?auto_18078 ) ) ( OBJ-AT ?auto_18076 ?auto_18071 ) ( not ( = ?auto_18076 ?auto_18075 ) ) ( OBJ-AT ?auto_18072 ?auto_18071 ) ( OBJ-AT ?auto_18073 ?auto_18071 ) ( OBJ-AT ?auto_18074 ?auto_18071 ) ( not ( = ?auto_18072 ?auto_18073 ) ) ( not ( = ?auto_18072 ?auto_18075 ) ) ( not ( = ?auto_18072 ?auto_18074 ) ) ( not ( = ?auto_18072 ?auto_18076 ) ) ( not ( = ?auto_18073 ?auto_18075 ) ) ( not ( = ?auto_18073 ?auto_18074 ) ) ( not ( = ?auto_18073 ?auto_18076 ) ) ( not ( = ?auto_18075 ?auto_18074 ) ) ( not ( = ?auto_18074 ?auto_18076 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_18076 ?auto_18075 ?auto_18071 )
      ( DELIVER-4PKG-VERIFY ?auto_18072 ?auto_18073 ?auto_18075 ?auto_18074 ?auto_18071 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_18114 - OBJ
      ?auto_18115 - OBJ
      ?auto_18117 - OBJ
      ?auto_18116 - OBJ
      ?auto_18113 - LOCATION
    )
    :vars
    (
      ?auto_18120 - TRUCK
      ?auto_18119 - LOCATION
      ?auto_18118 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_18115 ?auto_18120 ) ( TRUCK-AT ?auto_18120 ?auto_18119 ) ( IN-CITY ?auto_18119 ?auto_18118 ) ( IN-CITY ?auto_18113 ?auto_18118 ) ( not ( = ?auto_18113 ?auto_18119 ) ) ( OBJ-AT ?auto_18116 ?auto_18113 ) ( not ( = ?auto_18116 ?auto_18115 ) ) ( OBJ-AT ?auto_18114 ?auto_18113 ) ( OBJ-AT ?auto_18117 ?auto_18113 ) ( not ( = ?auto_18114 ?auto_18115 ) ) ( not ( = ?auto_18114 ?auto_18117 ) ) ( not ( = ?auto_18114 ?auto_18116 ) ) ( not ( = ?auto_18115 ?auto_18117 ) ) ( not ( = ?auto_18117 ?auto_18116 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_18116 ?auto_18115 ?auto_18113 )
      ( DELIVER-4PKG-VERIFY ?auto_18114 ?auto_18115 ?auto_18117 ?auto_18116 ?auto_18113 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_18122 - OBJ
      ?auto_18123 - OBJ
      ?auto_18125 - OBJ
      ?auto_18124 - OBJ
      ?auto_18121 - LOCATION
    )
    :vars
    (
      ?auto_18129 - TRUCK
      ?auto_18128 - LOCATION
      ?auto_18127 - CITY
      ?auto_18126 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_18123 ?auto_18129 ) ( TRUCK-AT ?auto_18129 ?auto_18128 ) ( IN-CITY ?auto_18128 ?auto_18127 ) ( IN-CITY ?auto_18121 ?auto_18127 ) ( not ( = ?auto_18121 ?auto_18128 ) ) ( OBJ-AT ?auto_18126 ?auto_18121 ) ( not ( = ?auto_18126 ?auto_18123 ) ) ( OBJ-AT ?auto_18122 ?auto_18121 ) ( OBJ-AT ?auto_18125 ?auto_18121 ) ( OBJ-AT ?auto_18124 ?auto_18121 ) ( not ( = ?auto_18122 ?auto_18123 ) ) ( not ( = ?auto_18122 ?auto_18125 ) ) ( not ( = ?auto_18122 ?auto_18124 ) ) ( not ( = ?auto_18122 ?auto_18126 ) ) ( not ( = ?auto_18123 ?auto_18125 ) ) ( not ( = ?auto_18123 ?auto_18124 ) ) ( not ( = ?auto_18125 ?auto_18124 ) ) ( not ( = ?auto_18125 ?auto_18126 ) ) ( not ( = ?auto_18124 ?auto_18126 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_18126 ?auto_18123 ?auto_18121 )
      ( DELIVER-4PKG-VERIFY ?auto_18122 ?auto_18123 ?auto_18125 ?auto_18124 ?auto_18121 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_18166 - OBJ
      ?auto_18167 - OBJ
      ?auto_18169 - OBJ
      ?auto_18168 - OBJ
      ?auto_18165 - LOCATION
    )
    :vars
    (
      ?auto_18172 - TRUCK
      ?auto_18171 - LOCATION
      ?auto_18170 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_18166 ?auto_18172 ) ( TRUCK-AT ?auto_18172 ?auto_18171 ) ( IN-CITY ?auto_18171 ?auto_18170 ) ( IN-CITY ?auto_18165 ?auto_18170 ) ( not ( = ?auto_18165 ?auto_18171 ) ) ( OBJ-AT ?auto_18169 ?auto_18165 ) ( not ( = ?auto_18169 ?auto_18166 ) ) ( OBJ-AT ?auto_18167 ?auto_18165 ) ( OBJ-AT ?auto_18168 ?auto_18165 ) ( not ( = ?auto_18166 ?auto_18167 ) ) ( not ( = ?auto_18166 ?auto_18168 ) ) ( not ( = ?auto_18167 ?auto_18169 ) ) ( not ( = ?auto_18167 ?auto_18168 ) ) ( not ( = ?auto_18169 ?auto_18168 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_18169 ?auto_18166 ?auto_18165 )
      ( DELIVER-4PKG-VERIFY ?auto_18166 ?auto_18167 ?auto_18169 ?auto_18168 ?auto_18165 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_18190 - OBJ
      ?auto_18191 - OBJ
      ?auto_18193 - OBJ
      ?auto_18192 - OBJ
      ?auto_18189 - LOCATION
    )
    :vars
    (
      ?auto_18196 - TRUCK
      ?auto_18195 - LOCATION
      ?auto_18194 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_18190 ?auto_18196 ) ( TRUCK-AT ?auto_18196 ?auto_18195 ) ( IN-CITY ?auto_18195 ?auto_18194 ) ( IN-CITY ?auto_18189 ?auto_18194 ) ( not ( = ?auto_18189 ?auto_18195 ) ) ( OBJ-AT ?auto_18191 ?auto_18189 ) ( not ( = ?auto_18191 ?auto_18190 ) ) ( OBJ-AT ?auto_18193 ?auto_18189 ) ( OBJ-AT ?auto_18192 ?auto_18189 ) ( not ( = ?auto_18190 ?auto_18193 ) ) ( not ( = ?auto_18190 ?auto_18192 ) ) ( not ( = ?auto_18191 ?auto_18193 ) ) ( not ( = ?auto_18191 ?auto_18192 ) ) ( not ( = ?auto_18193 ?auto_18192 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_18191 ?auto_18190 ?auto_18189 )
      ( DELIVER-4PKG-VERIFY ?auto_18190 ?auto_18191 ?auto_18193 ?auto_18192 ?auto_18189 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_18270 - OBJ
      ?auto_18271 - OBJ
      ?auto_18273 - OBJ
      ?auto_18272 - OBJ
      ?auto_18269 - LOCATION
    )
    :vars
    (
      ?auto_18277 - TRUCK
      ?auto_18276 - LOCATION
      ?auto_18275 - CITY
      ?auto_18274 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_18270 ?auto_18277 ) ( TRUCK-AT ?auto_18277 ?auto_18276 ) ( IN-CITY ?auto_18276 ?auto_18275 ) ( IN-CITY ?auto_18269 ?auto_18275 ) ( not ( = ?auto_18269 ?auto_18276 ) ) ( OBJ-AT ?auto_18274 ?auto_18269 ) ( not ( = ?auto_18274 ?auto_18270 ) ) ( OBJ-AT ?auto_18271 ?auto_18269 ) ( OBJ-AT ?auto_18273 ?auto_18269 ) ( OBJ-AT ?auto_18272 ?auto_18269 ) ( not ( = ?auto_18270 ?auto_18271 ) ) ( not ( = ?auto_18270 ?auto_18273 ) ) ( not ( = ?auto_18270 ?auto_18272 ) ) ( not ( = ?auto_18271 ?auto_18273 ) ) ( not ( = ?auto_18271 ?auto_18272 ) ) ( not ( = ?auto_18271 ?auto_18274 ) ) ( not ( = ?auto_18273 ?auto_18272 ) ) ( not ( = ?auto_18273 ?auto_18274 ) ) ( not ( = ?auto_18272 ?auto_18274 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_18274 ?auto_18270 ?auto_18269 )
      ( DELIVER-4PKG-VERIFY ?auto_18270 ?auto_18271 ?auto_18273 ?auto_18272 ?auto_18269 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_18421 - OBJ
      ?auto_18422 - OBJ
      ?auto_18423 - OBJ
      ?auto_18420 - LOCATION
    )
    :vars
    (
      ?auto_18426 - TRUCK
      ?auto_18425 - LOCATION
      ?auto_18424 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_18426 ?auto_18425 ) ( IN-CITY ?auto_18425 ?auto_18424 ) ( IN-CITY ?auto_18420 ?auto_18424 ) ( not ( = ?auto_18420 ?auto_18425 ) ) ( OBJ-AT ?auto_18421 ?auto_18420 ) ( not ( = ?auto_18421 ?auto_18423 ) ) ( OBJ-AT ?auto_18423 ?auto_18425 ) ( OBJ-AT ?auto_18422 ?auto_18420 ) ( not ( = ?auto_18421 ?auto_18422 ) ) ( not ( = ?auto_18422 ?auto_18423 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_18421 ?auto_18423 ?auto_18420 )
      ( DELIVER-3PKG-VERIFY ?auto_18421 ?auto_18422 ?auto_18423 ?auto_18420 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_18432 - OBJ
      ?auto_18433 - OBJ
      ?auto_18434 - OBJ
      ?auto_18431 - LOCATION
    )
    :vars
    (
      ?auto_18437 - TRUCK
      ?auto_18436 - LOCATION
      ?auto_18435 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_18437 ?auto_18436 ) ( IN-CITY ?auto_18436 ?auto_18435 ) ( IN-CITY ?auto_18431 ?auto_18435 ) ( not ( = ?auto_18431 ?auto_18436 ) ) ( OBJ-AT ?auto_18434 ?auto_18431 ) ( not ( = ?auto_18434 ?auto_18433 ) ) ( OBJ-AT ?auto_18433 ?auto_18436 ) ( OBJ-AT ?auto_18432 ?auto_18431 ) ( not ( = ?auto_18432 ?auto_18433 ) ) ( not ( = ?auto_18432 ?auto_18434 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_18434 ?auto_18433 ?auto_18431 )
      ( DELIVER-3PKG-VERIFY ?auto_18432 ?auto_18433 ?auto_18434 ?auto_18431 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_18454 - OBJ
      ?auto_18455 - OBJ
      ?auto_18456 - OBJ
      ?auto_18453 - LOCATION
    )
    :vars
    (
      ?auto_18459 - TRUCK
      ?auto_18458 - LOCATION
      ?auto_18457 - CITY
      ?auto_18460 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_18459 ?auto_18458 ) ( IN-CITY ?auto_18458 ?auto_18457 ) ( IN-CITY ?auto_18453 ?auto_18457 ) ( not ( = ?auto_18453 ?auto_18458 ) ) ( OBJ-AT ?auto_18460 ?auto_18453 ) ( not ( = ?auto_18460 ?auto_18456 ) ) ( OBJ-AT ?auto_18456 ?auto_18458 ) ( OBJ-AT ?auto_18454 ?auto_18453 ) ( OBJ-AT ?auto_18455 ?auto_18453 ) ( not ( = ?auto_18454 ?auto_18455 ) ) ( not ( = ?auto_18454 ?auto_18456 ) ) ( not ( = ?auto_18454 ?auto_18460 ) ) ( not ( = ?auto_18455 ?auto_18456 ) ) ( not ( = ?auto_18455 ?auto_18460 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_18460 ?auto_18456 ?auto_18453 )
      ( DELIVER-3PKG-VERIFY ?auto_18454 ?auto_18455 ?auto_18456 ?auto_18453 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_18466 - OBJ
      ?auto_18467 - OBJ
      ?auto_18468 - OBJ
      ?auto_18465 - LOCATION
    )
    :vars
    (
      ?auto_18471 - TRUCK
      ?auto_18470 - LOCATION
      ?auto_18469 - CITY
      ?auto_18472 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_18471 ?auto_18470 ) ( IN-CITY ?auto_18470 ?auto_18469 ) ( IN-CITY ?auto_18465 ?auto_18469 ) ( not ( = ?auto_18465 ?auto_18470 ) ) ( OBJ-AT ?auto_18472 ?auto_18465 ) ( not ( = ?auto_18472 ?auto_18467 ) ) ( OBJ-AT ?auto_18467 ?auto_18470 ) ( OBJ-AT ?auto_18466 ?auto_18465 ) ( OBJ-AT ?auto_18468 ?auto_18465 ) ( not ( = ?auto_18466 ?auto_18467 ) ) ( not ( = ?auto_18466 ?auto_18468 ) ) ( not ( = ?auto_18466 ?auto_18472 ) ) ( not ( = ?auto_18467 ?auto_18468 ) ) ( not ( = ?auto_18468 ?auto_18472 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_18472 ?auto_18467 ?auto_18465 )
      ( DELIVER-3PKG-VERIFY ?auto_18466 ?auto_18467 ?auto_18468 ?auto_18465 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_18482 - OBJ
      ?auto_18483 - OBJ
      ?auto_18484 - OBJ
      ?auto_18481 - LOCATION
    )
    :vars
    (
      ?auto_18487 - TRUCK
      ?auto_18486 - LOCATION
      ?auto_18485 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_18487 ?auto_18486 ) ( IN-CITY ?auto_18486 ?auto_18485 ) ( IN-CITY ?auto_18481 ?auto_18485 ) ( not ( = ?auto_18481 ?auto_18486 ) ) ( OBJ-AT ?auto_18483 ?auto_18481 ) ( not ( = ?auto_18483 ?auto_18482 ) ) ( OBJ-AT ?auto_18482 ?auto_18486 ) ( OBJ-AT ?auto_18484 ?auto_18481 ) ( not ( = ?auto_18482 ?auto_18484 ) ) ( not ( = ?auto_18483 ?auto_18484 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_18483 ?auto_18482 ?auto_18481 )
      ( DELIVER-3PKG-VERIFY ?auto_18482 ?auto_18483 ?auto_18484 ?auto_18481 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_18504 - OBJ
      ?auto_18505 - OBJ
      ?auto_18506 - OBJ
      ?auto_18503 - LOCATION
    )
    :vars
    (
      ?auto_18509 - TRUCK
      ?auto_18508 - LOCATION
      ?auto_18507 - CITY
      ?auto_18510 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_18509 ?auto_18508 ) ( IN-CITY ?auto_18508 ?auto_18507 ) ( IN-CITY ?auto_18503 ?auto_18507 ) ( not ( = ?auto_18503 ?auto_18508 ) ) ( OBJ-AT ?auto_18510 ?auto_18503 ) ( not ( = ?auto_18510 ?auto_18504 ) ) ( OBJ-AT ?auto_18504 ?auto_18508 ) ( OBJ-AT ?auto_18505 ?auto_18503 ) ( OBJ-AT ?auto_18506 ?auto_18503 ) ( not ( = ?auto_18504 ?auto_18505 ) ) ( not ( = ?auto_18504 ?auto_18506 ) ) ( not ( = ?auto_18505 ?auto_18506 ) ) ( not ( = ?auto_18505 ?auto_18510 ) ) ( not ( = ?auto_18506 ?auto_18510 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_18510 ?auto_18504 ?auto_18503 )
      ( DELIVER-3PKG-VERIFY ?auto_18504 ?auto_18505 ?auto_18506 ?auto_18503 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_18543 - OBJ
      ?auto_18544 - OBJ
      ?auto_18546 - OBJ
      ?auto_18545 - OBJ
      ?auto_18542 - LOCATION
    )
    :vars
    (
      ?auto_18549 - TRUCK
      ?auto_18548 - LOCATION
      ?auto_18547 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_18549 ?auto_18548 ) ( IN-CITY ?auto_18548 ?auto_18547 ) ( IN-CITY ?auto_18542 ?auto_18547 ) ( not ( = ?auto_18542 ?auto_18548 ) ) ( OBJ-AT ?auto_18544 ?auto_18542 ) ( not ( = ?auto_18544 ?auto_18545 ) ) ( OBJ-AT ?auto_18545 ?auto_18548 ) ( OBJ-AT ?auto_18543 ?auto_18542 ) ( OBJ-AT ?auto_18546 ?auto_18542 ) ( not ( = ?auto_18543 ?auto_18544 ) ) ( not ( = ?auto_18543 ?auto_18546 ) ) ( not ( = ?auto_18543 ?auto_18545 ) ) ( not ( = ?auto_18544 ?auto_18546 ) ) ( not ( = ?auto_18546 ?auto_18545 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_18544 ?auto_18545 ?auto_18542 )
      ( DELIVER-4PKG-VERIFY ?auto_18543 ?auto_18544 ?auto_18546 ?auto_18545 ?auto_18542 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_18559 - OBJ
      ?auto_18560 - OBJ
      ?auto_18562 - OBJ
      ?auto_18561 - OBJ
      ?auto_18558 - LOCATION
    )
    :vars
    (
      ?auto_18565 - TRUCK
      ?auto_18564 - LOCATION
      ?auto_18563 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_18565 ?auto_18564 ) ( IN-CITY ?auto_18564 ?auto_18563 ) ( IN-CITY ?auto_18558 ?auto_18563 ) ( not ( = ?auto_18558 ?auto_18564 ) ) ( OBJ-AT ?auto_18559 ?auto_18558 ) ( not ( = ?auto_18559 ?auto_18562 ) ) ( OBJ-AT ?auto_18562 ?auto_18564 ) ( OBJ-AT ?auto_18560 ?auto_18558 ) ( OBJ-AT ?auto_18561 ?auto_18558 ) ( not ( = ?auto_18559 ?auto_18560 ) ) ( not ( = ?auto_18559 ?auto_18561 ) ) ( not ( = ?auto_18560 ?auto_18562 ) ) ( not ( = ?auto_18560 ?auto_18561 ) ) ( not ( = ?auto_18562 ?auto_18561 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_18559 ?auto_18562 ?auto_18558 )
      ( DELIVER-4PKG-VERIFY ?auto_18559 ?auto_18560 ?auto_18562 ?auto_18561 ?auto_18558 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_18623 - OBJ
      ?auto_18624 - OBJ
      ?auto_18626 - OBJ
      ?auto_18625 - OBJ
      ?auto_18622 - LOCATION
    )
    :vars
    (
      ?auto_18629 - TRUCK
      ?auto_18628 - LOCATION
      ?auto_18627 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_18629 ?auto_18628 ) ( IN-CITY ?auto_18628 ?auto_18627 ) ( IN-CITY ?auto_18622 ?auto_18627 ) ( not ( = ?auto_18622 ?auto_18628 ) ) ( OBJ-AT ?auto_18623 ?auto_18622 ) ( not ( = ?auto_18623 ?auto_18624 ) ) ( OBJ-AT ?auto_18624 ?auto_18628 ) ( OBJ-AT ?auto_18626 ?auto_18622 ) ( OBJ-AT ?auto_18625 ?auto_18622 ) ( not ( = ?auto_18623 ?auto_18626 ) ) ( not ( = ?auto_18623 ?auto_18625 ) ) ( not ( = ?auto_18624 ?auto_18626 ) ) ( not ( = ?auto_18624 ?auto_18625 ) ) ( not ( = ?auto_18626 ?auto_18625 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_18623 ?auto_18624 ?auto_18622 )
      ( DELIVER-4PKG-VERIFY ?auto_18623 ?auto_18624 ?auto_18626 ?auto_18625 ?auto_18622 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_18647 - OBJ
      ?auto_18648 - OBJ
      ?auto_18650 - OBJ
      ?auto_18649 - OBJ
      ?auto_18646 - LOCATION
    )
    :vars
    (
      ?auto_18653 - TRUCK
      ?auto_18652 - LOCATION
      ?auto_18651 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_18653 ?auto_18652 ) ( IN-CITY ?auto_18652 ?auto_18651 ) ( IN-CITY ?auto_18646 ?auto_18651 ) ( not ( = ?auto_18646 ?auto_18652 ) ) ( OBJ-AT ?auto_18649 ?auto_18646 ) ( not ( = ?auto_18649 ?auto_18648 ) ) ( OBJ-AT ?auto_18648 ?auto_18652 ) ( OBJ-AT ?auto_18647 ?auto_18646 ) ( OBJ-AT ?auto_18650 ?auto_18646 ) ( not ( = ?auto_18647 ?auto_18648 ) ) ( not ( = ?auto_18647 ?auto_18650 ) ) ( not ( = ?auto_18647 ?auto_18649 ) ) ( not ( = ?auto_18648 ?auto_18650 ) ) ( not ( = ?auto_18650 ?auto_18649 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_18649 ?auto_18648 ?auto_18646 )
      ( DELIVER-4PKG-VERIFY ?auto_18647 ?auto_18648 ?auto_18650 ?auto_18649 ?auto_18646 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_18735 - OBJ
      ?auto_18736 - OBJ
      ?auto_18738 - OBJ
      ?auto_18737 - OBJ
      ?auto_18734 - LOCATION
    )
    :vars
    (
      ?auto_18741 - TRUCK
      ?auto_18740 - LOCATION
      ?auto_18739 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_18741 ?auto_18740 ) ( IN-CITY ?auto_18740 ?auto_18739 ) ( IN-CITY ?auto_18734 ?auto_18739 ) ( not ( = ?auto_18734 ?auto_18740 ) ) ( OBJ-AT ?auto_18738 ?auto_18734 ) ( not ( = ?auto_18738 ?auto_18737 ) ) ( OBJ-AT ?auto_18737 ?auto_18740 ) ( OBJ-AT ?auto_18735 ?auto_18734 ) ( OBJ-AT ?auto_18736 ?auto_18734 ) ( not ( = ?auto_18735 ?auto_18736 ) ) ( not ( = ?auto_18735 ?auto_18738 ) ) ( not ( = ?auto_18735 ?auto_18737 ) ) ( not ( = ?auto_18736 ?auto_18738 ) ) ( not ( = ?auto_18736 ?auto_18737 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_18738 ?auto_18737 ?auto_18734 )
      ( DELIVER-4PKG-VERIFY ?auto_18735 ?auto_18736 ?auto_18738 ?auto_18737 ?auto_18734 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_18743 - OBJ
      ?auto_18744 - OBJ
      ?auto_18746 - OBJ
      ?auto_18745 - OBJ
      ?auto_18742 - LOCATION
    )
    :vars
    (
      ?auto_18749 - TRUCK
      ?auto_18748 - LOCATION
      ?auto_18747 - CITY
      ?auto_18750 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_18749 ?auto_18748 ) ( IN-CITY ?auto_18748 ?auto_18747 ) ( IN-CITY ?auto_18742 ?auto_18747 ) ( not ( = ?auto_18742 ?auto_18748 ) ) ( OBJ-AT ?auto_18750 ?auto_18742 ) ( not ( = ?auto_18750 ?auto_18745 ) ) ( OBJ-AT ?auto_18745 ?auto_18748 ) ( OBJ-AT ?auto_18743 ?auto_18742 ) ( OBJ-AT ?auto_18744 ?auto_18742 ) ( OBJ-AT ?auto_18746 ?auto_18742 ) ( not ( = ?auto_18743 ?auto_18744 ) ) ( not ( = ?auto_18743 ?auto_18746 ) ) ( not ( = ?auto_18743 ?auto_18745 ) ) ( not ( = ?auto_18743 ?auto_18750 ) ) ( not ( = ?auto_18744 ?auto_18746 ) ) ( not ( = ?auto_18744 ?auto_18745 ) ) ( not ( = ?auto_18744 ?auto_18750 ) ) ( not ( = ?auto_18746 ?auto_18745 ) ) ( not ( = ?auto_18746 ?auto_18750 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_18750 ?auto_18745 ?auto_18742 )
      ( DELIVER-4PKG-VERIFY ?auto_18743 ?auto_18744 ?auto_18746 ?auto_18745 ?auto_18742 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_18752 - OBJ
      ?auto_18753 - OBJ
      ?auto_18755 - OBJ
      ?auto_18754 - OBJ
      ?auto_18751 - LOCATION
    )
    :vars
    (
      ?auto_18758 - TRUCK
      ?auto_18757 - LOCATION
      ?auto_18756 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_18758 ?auto_18757 ) ( IN-CITY ?auto_18757 ?auto_18756 ) ( IN-CITY ?auto_18751 ?auto_18756 ) ( not ( = ?auto_18751 ?auto_18757 ) ) ( OBJ-AT ?auto_18754 ?auto_18751 ) ( not ( = ?auto_18754 ?auto_18755 ) ) ( OBJ-AT ?auto_18755 ?auto_18757 ) ( OBJ-AT ?auto_18752 ?auto_18751 ) ( OBJ-AT ?auto_18753 ?auto_18751 ) ( not ( = ?auto_18752 ?auto_18753 ) ) ( not ( = ?auto_18752 ?auto_18755 ) ) ( not ( = ?auto_18752 ?auto_18754 ) ) ( not ( = ?auto_18753 ?auto_18755 ) ) ( not ( = ?auto_18753 ?auto_18754 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_18754 ?auto_18755 ?auto_18751 )
      ( DELIVER-4PKG-VERIFY ?auto_18752 ?auto_18753 ?auto_18755 ?auto_18754 ?auto_18751 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_18760 - OBJ
      ?auto_18761 - OBJ
      ?auto_18763 - OBJ
      ?auto_18762 - OBJ
      ?auto_18759 - LOCATION
    )
    :vars
    (
      ?auto_18766 - TRUCK
      ?auto_18765 - LOCATION
      ?auto_18764 - CITY
      ?auto_18767 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_18766 ?auto_18765 ) ( IN-CITY ?auto_18765 ?auto_18764 ) ( IN-CITY ?auto_18759 ?auto_18764 ) ( not ( = ?auto_18759 ?auto_18765 ) ) ( OBJ-AT ?auto_18767 ?auto_18759 ) ( not ( = ?auto_18767 ?auto_18763 ) ) ( OBJ-AT ?auto_18763 ?auto_18765 ) ( OBJ-AT ?auto_18760 ?auto_18759 ) ( OBJ-AT ?auto_18761 ?auto_18759 ) ( OBJ-AT ?auto_18762 ?auto_18759 ) ( not ( = ?auto_18760 ?auto_18761 ) ) ( not ( = ?auto_18760 ?auto_18763 ) ) ( not ( = ?auto_18760 ?auto_18762 ) ) ( not ( = ?auto_18760 ?auto_18767 ) ) ( not ( = ?auto_18761 ?auto_18763 ) ) ( not ( = ?auto_18761 ?auto_18762 ) ) ( not ( = ?auto_18761 ?auto_18767 ) ) ( not ( = ?auto_18763 ?auto_18762 ) ) ( not ( = ?auto_18762 ?auto_18767 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_18767 ?auto_18763 ?auto_18759 )
      ( DELIVER-4PKG-VERIFY ?auto_18760 ?auto_18761 ?auto_18763 ?auto_18762 ?auto_18759 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_18810 - OBJ
      ?auto_18811 - OBJ
      ?auto_18813 - OBJ
      ?auto_18812 - OBJ
      ?auto_18809 - LOCATION
    )
    :vars
    (
      ?auto_18816 - TRUCK
      ?auto_18815 - LOCATION
      ?auto_18814 - CITY
      ?auto_18817 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_18816 ?auto_18815 ) ( IN-CITY ?auto_18815 ?auto_18814 ) ( IN-CITY ?auto_18809 ?auto_18814 ) ( not ( = ?auto_18809 ?auto_18815 ) ) ( OBJ-AT ?auto_18817 ?auto_18809 ) ( not ( = ?auto_18817 ?auto_18811 ) ) ( OBJ-AT ?auto_18811 ?auto_18815 ) ( OBJ-AT ?auto_18810 ?auto_18809 ) ( OBJ-AT ?auto_18813 ?auto_18809 ) ( OBJ-AT ?auto_18812 ?auto_18809 ) ( not ( = ?auto_18810 ?auto_18811 ) ) ( not ( = ?auto_18810 ?auto_18813 ) ) ( not ( = ?auto_18810 ?auto_18812 ) ) ( not ( = ?auto_18810 ?auto_18817 ) ) ( not ( = ?auto_18811 ?auto_18813 ) ) ( not ( = ?auto_18811 ?auto_18812 ) ) ( not ( = ?auto_18813 ?auto_18812 ) ) ( not ( = ?auto_18813 ?auto_18817 ) ) ( not ( = ?auto_18812 ?auto_18817 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_18817 ?auto_18811 ?auto_18809 )
      ( DELIVER-4PKG-VERIFY ?auto_18810 ?auto_18811 ?auto_18813 ?auto_18812 ?auto_18809 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_18862 - OBJ
      ?auto_18863 - OBJ
      ?auto_18865 - OBJ
      ?auto_18864 - OBJ
      ?auto_18861 - LOCATION
    )
    :vars
    (
      ?auto_18868 - TRUCK
      ?auto_18867 - LOCATION
      ?auto_18866 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_18868 ?auto_18867 ) ( IN-CITY ?auto_18867 ?auto_18866 ) ( IN-CITY ?auto_18861 ?auto_18866 ) ( not ( = ?auto_18861 ?auto_18867 ) ) ( OBJ-AT ?auto_18863 ?auto_18861 ) ( not ( = ?auto_18863 ?auto_18862 ) ) ( OBJ-AT ?auto_18862 ?auto_18867 ) ( OBJ-AT ?auto_18865 ?auto_18861 ) ( OBJ-AT ?auto_18864 ?auto_18861 ) ( not ( = ?auto_18862 ?auto_18865 ) ) ( not ( = ?auto_18862 ?auto_18864 ) ) ( not ( = ?auto_18863 ?auto_18865 ) ) ( not ( = ?auto_18863 ?auto_18864 ) ) ( not ( = ?auto_18865 ?auto_18864 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_18863 ?auto_18862 ?auto_18861 )
      ( DELIVER-4PKG-VERIFY ?auto_18862 ?auto_18863 ?auto_18865 ?auto_18864 ?auto_18861 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_18926 - OBJ
      ?auto_18927 - OBJ
      ?auto_18929 - OBJ
      ?auto_18928 - OBJ
      ?auto_18925 - LOCATION
    )
    :vars
    (
      ?auto_18932 - TRUCK
      ?auto_18931 - LOCATION
      ?auto_18930 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_18932 ?auto_18931 ) ( IN-CITY ?auto_18931 ?auto_18930 ) ( IN-CITY ?auto_18925 ?auto_18930 ) ( not ( = ?auto_18925 ?auto_18931 ) ) ( OBJ-AT ?auto_18929 ?auto_18925 ) ( not ( = ?auto_18929 ?auto_18926 ) ) ( OBJ-AT ?auto_18926 ?auto_18931 ) ( OBJ-AT ?auto_18927 ?auto_18925 ) ( OBJ-AT ?auto_18928 ?auto_18925 ) ( not ( = ?auto_18926 ?auto_18927 ) ) ( not ( = ?auto_18926 ?auto_18928 ) ) ( not ( = ?auto_18927 ?auto_18929 ) ) ( not ( = ?auto_18927 ?auto_18928 ) ) ( not ( = ?auto_18929 ?auto_18928 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_18929 ?auto_18926 ?auto_18925 )
      ( DELIVER-4PKG-VERIFY ?auto_18926 ?auto_18927 ?auto_18929 ?auto_18928 ?auto_18925 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_18958 - OBJ
      ?auto_18959 - OBJ
      ?auto_18961 - OBJ
      ?auto_18960 - OBJ
      ?auto_18957 - LOCATION
    )
    :vars
    (
      ?auto_18964 - TRUCK
      ?auto_18963 - LOCATION
      ?auto_18962 - CITY
      ?auto_18965 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_18964 ?auto_18963 ) ( IN-CITY ?auto_18963 ?auto_18962 ) ( IN-CITY ?auto_18957 ?auto_18962 ) ( not ( = ?auto_18957 ?auto_18963 ) ) ( OBJ-AT ?auto_18965 ?auto_18957 ) ( not ( = ?auto_18965 ?auto_18958 ) ) ( OBJ-AT ?auto_18958 ?auto_18963 ) ( OBJ-AT ?auto_18959 ?auto_18957 ) ( OBJ-AT ?auto_18961 ?auto_18957 ) ( OBJ-AT ?auto_18960 ?auto_18957 ) ( not ( = ?auto_18958 ?auto_18959 ) ) ( not ( = ?auto_18958 ?auto_18961 ) ) ( not ( = ?auto_18958 ?auto_18960 ) ) ( not ( = ?auto_18959 ?auto_18961 ) ) ( not ( = ?auto_18959 ?auto_18960 ) ) ( not ( = ?auto_18959 ?auto_18965 ) ) ( not ( = ?auto_18961 ?auto_18960 ) ) ( not ( = ?auto_18961 ?auto_18965 ) ) ( not ( = ?auto_18960 ?auto_18965 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_18965 ?auto_18958 ?auto_18957 )
      ( DELIVER-4PKG-VERIFY ?auto_18958 ?auto_18959 ?auto_18961 ?auto_18960 ?auto_18957 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_19109 - OBJ
      ?auto_19110 - OBJ
      ?auto_19111 - OBJ
      ?auto_19108 - LOCATION
    )
    :vars
    (
      ?auto_19112 - LOCATION
      ?auto_19114 - CITY
      ?auto_19113 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_19112 ?auto_19114 ) ( IN-CITY ?auto_19108 ?auto_19114 ) ( not ( = ?auto_19108 ?auto_19112 ) ) ( OBJ-AT ?auto_19109 ?auto_19108 ) ( not ( = ?auto_19109 ?auto_19111 ) ) ( OBJ-AT ?auto_19111 ?auto_19112 ) ( TRUCK-AT ?auto_19113 ?auto_19108 ) ( OBJ-AT ?auto_19110 ?auto_19108 ) ( not ( = ?auto_19109 ?auto_19110 ) ) ( not ( = ?auto_19110 ?auto_19111 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_19109 ?auto_19111 ?auto_19108 )
      ( DELIVER-3PKG-VERIFY ?auto_19109 ?auto_19110 ?auto_19111 ?auto_19108 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_19142 - OBJ
      ?auto_19143 - OBJ
      ?auto_19144 - OBJ
      ?auto_19141 - LOCATION
    )
    :vars
    (
      ?auto_19145 - LOCATION
      ?auto_19147 - CITY
      ?auto_19148 - OBJ
      ?auto_19146 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_19145 ?auto_19147 ) ( IN-CITY ?auto_19141 ?auto_19147 ) ( not ( = ?auto_19141 ?auto_19145 ) ) ( OBJ-AT ?auto_19148 ?auto_19141 ) ( not ( = ?auto_19148 ?auto_19144 ) ) ( OBJ-AT ?auto_19144 ?auto_19145 ) ( TRUCK-AT ?auto_19146 ?auto_19141 ) ( OBJ-AT ?auto_19142 ?auto_19141 ) ( OBJ-AT ?auto_19143 ?auto_19141 ) ( not ( = ?auto_19142 ?auto_19143 ) ) ( not ( = ?auto_19142 ?auto_19144 ) ) ( not ( = ?auto_19142 ?auto_19148 ) ) ( not ( = ?auto_19143 ?auto_19144 ) ) ( not ( = ?auto_19143 ?auto_19148 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_19148 ?auto_19144 ?auto_19141 )
      ( DELIVER-3PKG-VERIFY ?auto_19142 ?auto_19143 ?auto_19144 ?auto_19141 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_19154 - OBJ
      ?auto_19155 - OBJ
      ?auto_19156 - OBJ
      ?auto_19153 - LOCATION
    )
    :vars
    (
      ?auto_19157 - LOCATION
      ?auto_19159 - CITY
      ?auto_19160 - OBJ
      ?auto_19158 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_19157 ?auto_19159 ) ( IN-CITY ?auto_19153 ?auto_19159 ) ( not ( = ?auto_19153 ?auto_19157 ) ) ( OBJ-AT ?auto_19160 ?auto_19153 ) ( not ( = ?auto_19160 ?auto_19155 ) ) ( OBJ-AT ?auto_19155 ?auto_19157 ) ( TRUCK-AT ?auto_19158 ?auto_19153 ) ( OBJ-AT ?auto_19154 ?auto_19153 ) ( OBJ-AT ?auto_19156 ?auto_19153 ) ( not ( = ?auto_19154 ?auto_19155 ) ) ( not ( = ?auto_19154 ?auto_19156 ) ) ( not ( = ?auto_19154 ?auto_19160 ) ) ( not ( = ?auto_19155 ?auto_19156 ) ) ( not ( = ?auto_19156 ?auto_19160 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_19160 ?auto_19155 ?auto_19153 )
      ( DELIVER-3PKG-VERIFY ?auto_19154 ?auto_19155 ?auto_19156 ?auto_19153 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_19192 - OBJ
      ?auto_19193 - OBJ
      ?auto_19194 - OBJ
      ?auto_19191 - LOCATION
    )
    :vars
    (
      ?auto_19195 - LOCATION
      ?auto_19197 - CITY
      ?auto_19198 - OBJ
      ?auto_19196 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_19195 ?auto_19197 ) ( IN-CITY ?auto_19191 ?auto_19197 ) ( not ( = ?auto_19191 ?auto_19195 ) ) ( OBJ-AT ?auto_19198 ?auto_19191 ) ( not ( = ?auto_19198 ?auto_19192 ) ) ( OBJ-AT ?auto_19192 ?auto_19195 ) ( TRUCK-AT ?auto_19196 ?auto_19191 ) ( OBJ-AT ?auto_19193 ?auto_19191 ) ( OBJ-AT ?auto_19194 ?auto_19191 ) ( not ( = ?auto_19192 ?auto_19193 ) ) ( not ( = ?auto_19192 ?auto_19194 ) ) ( not ( = ?auto_19193 ?auto_19194 ) ) ( not ( = ?auto_19193 ?auto_19198 ) ) ( not ( = ?auto_19194 ?auto_19198 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_19198 ?auto_19192 ?auto_19191 )
      ( DELIVER-3PKG-VERIFY ?auto_19192 ?auto_19193 ?auto_19194 ?auto_19191 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_19231 - OBJ
      ?auto_19232 - OBJ
      ?auto_19234 - OBJ
      ?auto_19233 - OBJ
      ?auto_19230 - LOCATION
    )
    :vars
    (
      ?auto_19235 - LOCATION
      ?auto_19237 - CITY
      ?auto_19236 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_19235 ?auto_19237 ) ( IN-CITY ?auto_19230 ?auto_19237 ) ( not ( = ?auto_19230 ?auto_19235 ) ) ( OBJ-AT ?auto_19231 ?auto_19230 ) ( not ( = ?auto_19231 ?auto_19233 ) ) ( OBJ-AT ?auto_19233 ?auto_19235 ) ( TRUCK-AT ?auto_19236 ?auto_19230 ) ( OBJ-AT ?auto_19232 ?auto_19230 ) ( OBJ-AT ?auto_19234 ?auto_19230 ) ( not ( = ?auto_19231 ?auto_19232 ) ) ( not ( = ?auto_19231 ?auto_19234 ) ) ( not ( = ?auto_19232 ?auto_19234 ) ) ( not ( = ?auto_19232 ?auto_19233 ) ) ( not ( = ?auto_19234 ?auto_19233 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_19231 ?auto_19233 ?auto_19230 )
      ( DELIVER-4PKG-VERIFY ?auto_19231 ?auto_19232 ?auto_19234 ?auto_19233 ?auto_19230 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_19239 - OBJ
      ?auto_19240 - OBJ
      ?auto_19242 - OBJ
      ?auto_19241 - OBJ
      ?auto_19238 - LOCATION
    )
    :vars
    (
      ?auto_19243 - LOCATION
      ?auto_19245 - CITY
      ?auto_19244 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_19243 ?auto_19245 ) ( IN-CITY ?auto_19238 ?auto_19245 ) ( not ( = ?auto_19238 ?auto_19243 ) ) ( OBJ-AT ?auto_19240 ?auto_19238 ) ( not ( = ?auto_19240 ?auto_19241 ) ) ( OBJ-AT ?auto_19241 ?auto_19243 ) ( TRUCK-AT ?auto_19244 ?auto_19238 ) ( OBJ-AT ?auto_19239 ?auto_19238 ) ( OBJ-AT ?auto_19242 ?auto_19238 ) ( not ( = ?auto_19239 ?auto_19240 ) ) ( not ( = ?auto_19239 ?auto_19242 ) ) ( not ( = ?auto_19239 ?auto_19241 ) ) ( not ( = ?auto_19240 ?auto_19242 ) ) ( not ( = ?auto_19242 ?auto_19241 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_19240 ?auto_19241 ?auto_19238 )
      ( DELIVER-4PKG-VERIFY ?auto_19239 ?auto_19240 ?auto_19242 ?auto_19241 ?auto_19238 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_19247 - OBJ
      ?auto_19248 - OBJ
      ?auto_19250 - OBJ
      ?auto_19249 - OBJ
      ?auto_19246 - LOCATION
    )
    :vars
    (
      ?auto_19251 - LOCATION
      ?auto_19253 - CITY
      ?auto_19252 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_19251 ?auto_19253 ) ( IN-CITY ?auto_19246 ?auto_19253 ) ( not ( = ?auto_19246 ?auto_19251 ) ) ( OBJ-AT ?auto_19248 ?auto_19246 ) ( not ( = ?auto_19248 ?auto_19250 ) ) ( OBJ-AT ?auto_19250 ?auto_19251 ) ( TRUCK-AT ?auto_19252 ?auto_19246 ) ( OBJ-AT ?auto_19247 ?auto_19246 ) ( OBJ-AT ?auto_19249 ?auto_19246 ) ( not ( = ?auto_19247 ?auto_19248 ) ) ( not ( = ?auto_19247 ?auto_19250 ) ) ( not ( = ?auto_19247 ?auto_19249 ) ) ( not ( = ?auto_19248 ?auto_19249 ) ) ( not ( = ?auto_19250 ?auto_19249 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_19248 ?auto_19250 ?auto_19246 )
      ( DELIVER-4PKG-VERIFY ?auto_19247 ?auto_19248 ?auto_19250 ?auto_19249 ?auto_19246 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_19287 - OBJ
      ?auto_19288 - OBJ
      ?auto_19290 - OBJ
      ?auto_19289 - OBJ
      ?auto_19286 - LOCATION
    )
    :vars
    (
      ?auto_19291 - LOCATION
      ?auto_19293 - CITY
      ?auto_19292 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_19291 ?auto_19293 ) ( IN-CITY ?auto_19286 ?auto_19293 ) ( not ( = ?auto_19286 ?auto_19291 ) ) ( OBJ-AT ?auto_19287 ?auto_19286 ) ( not ( = ?auto_19287 ?auto_19290 ) ) ( OBJ-AT ?auto_19290 ?auto_19291 ) ( TRUCK-AT ?auto_19292 ?auto_19286 ) ( OBJ-AT ?auto_19288 ?auto_19286 ) ( OBJ-AT ?auto_19289 ?auto_19286 ) ( not ( = ?auto_19287 ?auto_19288 ) ) ( not ( = ?auto_19287 ?auto_19289 ) ) ( not ( = ?auto_19288 ?auto_19290 ) ) ( not ( = ?auto_19288 ?auto_19289 ) ) ( not ( = ?auto_19290 ?auto_19289 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_19287 ?auto_19290 ?auto_19286 )
      ( DELIVER-4PKG-VERIFY ?auto_19287 ?auto_19288 ?auto_19290 ?auto_19289 ?auto_19286 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_19319 - OBJ
      ?auto_19320 - OBJ
      ?auto_19322 - OBJ
      ?auto_19321 - OBJ
      ?auto_19318 - LOCATION
    )
    :vars
    (
      ?auto_19323 - LOCATION
      ?auto_19325 - CITY
      ?auto_19324 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_19323 ?auto_19325 ) ( IN-CITY ?auto_19318 ?auto_19325 ) ( not ( = ?auto_19318 ?auto_19323 ) ) ( OBJ-AT ?auto_19319 ?auto_19318 ) ( not ( = ?auto_19319 ?auto_19320 ) ) ( OBJ-AT ?auto_19320 ?auto_19323 ) ( TRUCK-AT ?auto_19324 ?auto_19318 ) ( OBJ-AT ?auto_19322 ?auto_19318 ) ( OBJ-AT ?auto_19321 ?auto_19318 ) ( not ( = ?auto_19319 ?auto_19322 ) ) ( not ( = ?auto_19319 ?auto_19321 ) ) ( not ( = ?auto_19320 ?auto_19322 ) ) ( not ( = ?auto_19320 ?auto_19321 ) ) ( not ( = ?auto_19322 ?auto_19321 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_19319 ?auto_19320 ?auto_19318 )
      ( DELIVER-4PKG-VERIFY ?auto_19319 ?auto_19320 ?auto_19322 ?auto_19321 ?auto_19318 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_19431 - OBJ
      ?auto_19432 - OBJ
      ?auto_19434 - OBJ
      ?auto_19433 - OBJ
      ?auto_19430 - LOCATION
    )
    :vars
    (
      ?auto_19435 - LOCATION
      ?auto_19437 - CITY
      ?auto_19438 - OBJ
      ?auto_19436 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_19435 ?auto_19437 ) ( IN-CITY ?auto_19430 ?auto_19437 ) ( not ( = ?auto_19430 ?auto_19435 ) ) ( OBJ-AT ?auto_19438 ?auto_19430 ) ( not ( = ?auto_19438 ?auto_19433 ) ) ( OBJ-AT ?auto_19433 ?auto_19435 ) ( TRUCK-AT ?auto_19436 ?auto_19430 ) ( OBJ-AT ?auto_19431 ?auto_19430 ) ( OBJ-AT ?auto_19432 ?auto_19430 ) ( OBJ-AT ?auto_19434 ?auto_19430 ) ( not ( = ?auto_19431 ?auto_19432 ) ) ( not ( = ?auto_19431 ?auto_19434 ) ) ( not ( = ?auto_19431 ?auto_19433 ) ) ( not ( = ?auto_19431 ?auto_19438 ) ) ( not ( = ?auto_19432 ?auto_19434 ) ) ( not ( = ?auto_19432 ?auto_19433 ) ) ( not ( = ?auto_19432 ?auto_19438 ) ) ( not ( = ?auto_19434 ?auto_19433 ) ) ( not ( = ?auto_19434 ?auto_19438 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_19438 ?auto_19433 ?auto_19430 )
      ( DELIVER-4PKG-VERIFY ?auto_19431 ?auto_19432 ?auto_19434 ?auto_19433 ?auto_19430 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_19448 - OBJ
      ?auto_19449 - OBJ
      ?auto_19451 - OBJ
      ?auto_19450 - OBJ
      ?auto_19447 - LOCATION
    )
    :vars
    (
      ?auto_19452 - LOCATION
      ?auto_19454 - CITY
      ?auto_19455 - OBJ
      ?auto_19453 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_19452 ?auto_19454 ) ( IN-CITY ?auto_19447 ?auto_19454 ) ( not ( = ?auto_19447 ?auto_19452 ) ) ( OBJ-AT ?auto_19455 ?auto_19447 ) ( not ( = ?auto_19455 ?auto_19451 ) ) ( OBJ-AT ?auto_19451 ?auto_19452 ) ( TRUCK-AT ?auto_19453 ?auto_19447 ) ( OBJ-AT ?auto_19448 ?auto_19447 ) ( OBJ-AT ?auto_19449 ?auto_19447 ) ( OBJ-AT ?auto_19450 ?auto_19447 ) ( not ( = ?auto_19448 ?auto_19449 ) ) ( not ( = ?auto_19448 ?auto_19451 ) ) ( not ( = ?auto_19448 ?auto_19450 ) ) ( not ( = ?auto_19448 ?auto_19455 ) ) ( not ( = ?auto_19449 ?auto_19451 ) ) ( not ( = ?auto_19449 ?auto_19450 ) ) ( not ( = ?auto_19449 ?auto_19455 ) ) ( not ( = ?auto_19451 ?auto_19450 ) ) ( not ( = ?auto_19450 ?auto_19455 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_19455 ?auto_19451 ?auto_19447 )
      ( DELIVER-4PKG-VERIFY ?auto_19448 ?auto_19449 ?auto_19451 ?auto_19450 ?auto_19447 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_19490 - OBJ
      ?auto_19491 - OBJ
      ?auto_19493 - OBJ
      ?auto_19492 - OBJ
      ?auto_19489 - LOCATION
    )
    :vars
    (
      ?auto_19494 - LOCATION
      ?auto_19496 - CITY
      ?auto_19495 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_19494 ?auto_19496 ) ( IN-CITY ?auto_19489 ?auto_19496 ) ( not ( = ?auto_19489 ?auto_19494 ) ) ( OBJ-AT ?auto_19492 ?auto_19489 ) ( not ( = ?auto_19492 ?auto_19491 ) ) ( OBJ-AT ?auto_19491 ?auto_19494 ) ( TRUCK-AT ?auto_19495 ?auto_19489 ) ( OBJ-AT ?auto_19490 ?auto_19489 ) ( OBJ-AT ?auto_19493 ?auto_19489 ) ( not ( = ?auto_19490 ?auto_19491 ) ) ( not ( = ?auto_19490 ?auto_19493 ) ) ( not ( = ?auto_19490 ?auto_19492 ) ) ( not ( = ?auto_19491 ?auto_19493 ) ) ( not ( = ?auto_19493 ?auto_19492 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_19492 ?auto_19491 ?auto_19489 )
      ( DELIVER-4PKG-VERIFY ?auto_19490 ?auto_19491 ?auto_19493 ?auto_19492 ?auto_19489 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_19498 - OBJ
      ?auto_19499 - OBJ
      ?auto_19501 - OBJ
      ?auto_19500 - OBJ
      ?auto_19497 - LOCATION
    )
    :vars
    (
      ?auto_19502 - LOCATION
      ?auto_19504 - CITY
      ?auto_19505 - OBJ
      ?auto_19503 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_19502 ?auto_19504 ) ( IN-CITY ?auto_19497 ?auto_19504 ) ( not ( = ?auto_19497 ?auto_19502 ) ) ( OBJ-AT ?auto_19505 ?auto_19497 ) ( not ( = ?auto_19505 ?auto_19499 ) ) ( OBJ-AT ?auto_19499 ?auto_19502 ) ( TRUCK-AT ?auto_19503 ?auto_19497 ) ( OBJ-AT ?auto_19498 ?auto_19497 ) ( OBJ-AT ?auto_19501 ?auto_19497 ) ( OBJ-AT ?auto_19500 ?auto_19497 ) ( not ( = ?auto_19498 ?auto_19499 ) ) ( not ( = ?auto_19498 ?auto_19501 ) ) ( not ( = ?auto_19498 ?auto_19500 ) ) ( not ( = ?auto_19498 ?auto_19505 ) ) ( not ( = ?auto_19499 ?auto_19501 ) ) ( not ( = ?auto_19499 ?auto_19500 ) ) ( not ( = ?auto_19501 ?auto_19500 ) ) ( not ( = ?auto_19501 ?auto_19505 ) ) ( not ( = ?auto_19500 ?auto_19505 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_19505 ?auto_19499 ?auto_19497 )
      ( DELIVER-4PKG-VERIFY ?auto_19498 ?auto_19499 ?auto_19501 ?auto_19500 ?auto_19497 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_19542 - OBJ
      ?auto_19543 - OBJ
      ?auto_19545 - OBJ
      ?auto_19544 - OBJ
      ?auto_19541 - LOCATION
    )
    :vars
    (
      ?auto_19546 - LOCATION
      ?auto_19548 - CITY
      ?auto_19547 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_19546 ?auto_19548 ) ( IN-CITY ?auto_19541 ?auto_19548 ) ( not ( = ?auto_19541 ?auto_19546 ) ) ( OBJ-AT ?auto_19543 ?auto_19541 ) ( not ( = ?auto_19543 ?auto_19542 ) ) ( OBJ-AT ?auto_19542 ?auto_19546 ) ( TRUCK-AT ?auto_19547 ?auto_19541 ) ( OBJ-AT ?auto_19545 ?auto_19541 ) ( OBJ-AT ?auto_19544 ?auto_19541 ) ( not ( = ?auto_19542 ?auto_19545 ) ) ( not ( = ?auto_19542 ?auto_19544 ) ) ( not ( = ?auto_19543 ?auto_19545 ) ) ( not ( = ?auto_19543 ?auto_19544 ) ) ( not ( = ?auto_19545 ?auto_19544 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_19543 ?auto_19542 ?auto_19541 )
      ( DELIVER-4PKG-VERIFY ?auto_19542 ?auto_19543 ?auto_19545 ?auto_19544 ?auto_19541 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_19614 - OBJ
      ?auto_19615 - OBJ
      ?auto_19617 - OBJ
      ?auto_19616 - OBJ
      ?auto_19613 - LOCATION
    )
    :vars
    (
      ?auto_19618 - LOCATION
      ?auto_19620 - CITY
      ?auto_19619 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_19618 ?auto_19620 ) ( IN-CITY ?auto_19613 ?auto_19620 ) ( not ( = ?auto_19613 ?auto_19618 ) ) ( OBJ-AT ?auto_19617 ?auto_19613 ) ( not ( = ?auto_19617 ?auto_19614 ) ) ( OBJ-AT ?auto_19614 ?auto_19618 ) ( TRUCK-AT ?auto_19619 ?auto_19613 ) ( OBJ-AT ?auto_19615 ?auto_19613 ) ( OBJ-AT ?auto_19616 ?auto_19613 ) ( not ( = ?auto_19614 ?auto_19615 ) ) ( not ( = ?auto_19614 ?auto_19616 ) ) ( not ( = ?auto_19615 ?auto_19617 ) ) ( not ( = ?auto_19615 ?auto_19616 ) ) ( not ( = ?auto_19617 ?auto_19616 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_19617 ?auto_19614 ?auto_19613 )
      ( DELIVER-4PKG-VERIFY ?auto_19614 ?auto_19615 ?auto_19617 ?auto_19616 ?auto_19613 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_19646 - OBJ
      ?auto_19647 - OBJ
      ?auto_19649 - OBJ
      ?auto_19648 - OBJ
      ?auto_19645 - LOCATION
    )
    :vars
    (
      ?auto_19650 - LOCATION
      ?auto_19652 - CITY
      ?auto_19653 - OBJ
      ?auto_19651 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_19650 ?auto_19652 ) ( IN-CITY ?auto_19645 ?auto_19652 ) ( not ( = ?auto_19645 ?auto_19650 ) ) ( OBJ-AT ?auto_19653 ?auto_19645 ) ( not ( = ?auto_19653 ?auto_19646 ) ) ( OBJ-AT ?auto_19646 ?auto_19650 ) ( TRUCK-AT ?auto_19651 ?auto_19645 ) ( OBJ-AT ?auto_19647 ?auto_19645 ) ( OBJ-AT ?auto_19649 ?auto_19645 ) ( OBJ-AT ?auto_19648 ?auto_19645 ) ( not ( = ?auto_19646 ?auto_19647 ) ) ( not ( = ?auto_19646 ?auto_19649 ) ) ( not ( = ?auto_19646 ?auto_19648 ) ) ( not ( = ?auto_19647 ?auto_19649 ) ) ( not ( = ?auto_19647 ?auto_19648 ) ) ( not ( = ?auto_19647 ?auto_19653 ) ) ( not ( = ?auto_19649 ?auto_19648 ) ) ( not ( = ?auto_19649 ?auto_19653 ) ) ( not ( = ?auto_19648 ?auto_19653 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_19653 ?auto_19646 ?auto_19645 )
      ( DELIVER-4PKG-VERIFY ?auto_19646 ?auto_19647 ?auto_19649 ?auto_19648 ?auto_19645 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_19809 - OBJ
      ?auto_19810 - OBJ
      ?auto_19811 - OBJ
      ?auto_19808 - LOCATION
    )
    :vars
    (
      ?auto_19814 - LOCATION
      ?auto_19812 - CITY
      ?auto_19813 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_19814 ?auto_19812 ) ( IN-CITY ?auto_19808 ?auto_19812 ) ( not ( = ?auto_19808 ?auto_19814 ) ) ( OBJ-AT ?auto_19811 ?auto_19808 ) ( not ( = ?auto_19811 ?auto_19810 ) ) ( OBJ-AT ?auto_19810 ?auto_19814 ) ( TRUCK-AT ?auto_19813 ?auto_19808 ) ( OBJ-AT ?auto_19809 ?auto_19808 ) ( not ( = ?auto_19809 ?auto_19810 ) ) ( not ( = ?auto_19809 ?auto_19811 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_19811 ?auto_19810 ?auto_19808 )
      ( DELIVER-3PKG-VERIFY ?auto_19809 ?auto_19810 ?auto_19811 ?auto_19808 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_20470 - OBJ
      ?auto_20469 - LOCATION
    )
    :vars
    (
      ?auto_20474 - LOCATION
      ?auto_20471 - CITY
      ?auto_20473 - OBJ
      ?auto_20472 - TRUCK
      ?auto_20475 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_20474 ?auto_20471 ) ( IN-CITY ?auto_20469 ?auto_20471 ) ( not ( = ?auto_20469 ?auto_20474 ) ) ( OBJ-AT ?auto_20473 ?auto_20469 ) ( not ( = ?auto_20473 ?auto_20470 ) ) ( OBJ-AT ?auto_20470 ?auto_20474 ) ( TRUCK-AT ?auto_20472 ?auto_20475 ) ( IN-CITY ?auto_20475 ?auto_20471 ) ( not ( = ?auto_20469 ?auto_20475 ) ) ( not ( = ?auto_20474 ?auto_20475 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_20472 ?auto_20475 ?auto_20469 ?auto_20471 )
      ( DELIVER-2PKG ?auto_20473 ?auto_20470 ?auto_20469 )
      ( DELIVER-1PKG-VERIFY ?auto_20470 ?auto_20469 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_20477 - OBJ
      ?auto_20478 - OBJ
      ?auto_20476 - LOCATION
    )
    :vars
    (
      ?auto_20479 - LOCATION
      ?auto_20482 - CITY
      ?auto_20481 - TRUCK
      ?auto_20480 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_20479 ?auto_20482 ) ( IN-CITY ?auto_20476 ?auto_20482 ) ( not ( = ?auto_20476 ?auto_20479 ) ) ( OBJ-AT ?auto_20477 ?auto_20476 ) ( not ( = ?auto_20477 ?auto_20478 ) ) ( OBJ-AT ?auto_20478 ?auto_20479 ) ( TRUCK-AT ?auto_20481 ?auto_20480 ) ( IN-CITY ?auto_20480 ?auto_20482 ) ( not ( = ?auto_20476 ?auto_20480 ) ) ( not ( = ?auto_20479 ?auto_20480 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_20478 ?auto_20476 )
      ( DELIVER-2PKG-VERIFY ?auto_20477 ?auto_20478 ?auto_20476 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_20492 - OBJ
      ?auto_20493 - OBJ
      ?auto_20491 - LOCATION
    )
    :vars
    (
      ?auto_20494 - LOCATION
      ?auto_20497 - CITY
      ?auto_20496 - TRUCK
      ?auto_20495 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_20494 ?auto_20497 ) ( IN-CITY ?auto_20491 ?auto_20497 ) ( not ( = ?auto_20491 ?auto_20494 ) ) ( OBJ-AT ?auto_20493 ?auto_20491 ) ( not ( = ?auto_20493 ?auto_20492 ) ) ( OBJ-AT ?auto_20492 ?auto_20494 ) ( TRUCK-AT ?auto_20496 ?auto_20495 ) ( IN-CITY ?auto_20495 ?auto_20497 ) ( not ( = ?auto_20491 ?auto_20495 ) ) ( not ( = ?auto_20494 ?auto_20495 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_20493 ?auto_20492 ?auto_20491 )
      ( DELIVER-2PKG-VERIFY ?auto_20492 ?auto_20493 ?auto_20491 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_20515 - OBJ
      ?auto_20516 - OBJ
      ?auto_20517 - OBJ
      ?auto_20514 - LOCATION
    )
    :vars
    (
      ?auto_20518 - LOCATION
      ?auto_20521 - CITY
      ?auto_20520 - TRUCK
      ?auto_20519 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_20518 ?auto_20521 ) ( IN-CITY ?auto_20514 ?auto_20521 ) ( not ( = ?auto_20514 ?auto_20518 ) ) ( OBJ-AT ?auto_20515 ?auto_20514 ) ( not ( = ?auto_20515 ?auto_20517 ) ) ( OBJ-AT ?auto_20517 ?auto_20518 ) ( TRUCK-AT ?auto_20520 ?auto_20519 ) ( IN-CITY ?auto_20519 ?auto_20521 ) ( not ( = ?auto_20514 ?auto_20519 ) ) ( not ( = ?auto_20518 ?auto_20519 ) ) ( OBJ-AT ?auto_20516 ?auto_20514 ) ( not ( = ?auto_20515 ?auto_20516 ) ) ( not ( = ?auto_20516 ?auto_20517 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_20515 ?auto_20517 ?auto_20514 )
      ( DELIVER-3PKG-VERIFY ?auto_20515 ?auto_20516 ?auto_20517 ?auto_20514 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_20531 - OBJ
      ?auto_20532 - OBJ
      ?auto_20533 - OBJ
      ?auto_20530 - LOCATION
    )
    :vars
    (
      ?auto_20534 - LOCATION
      ?auto_20537 - CITY
      ?auto_20536 - TRUCK
      ?auto_20535 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_20534 ?auto_20537 ) ( IN-CITY ?auto_20530 ?auto_20537 ) ( not ( = ?auto_20530 ?auto_20534 ) ) ( OBJ-AT ?auto_20533 ?auto_20530 ) ( not ( = ?auto_20533 ?auto_20532 ) ) ( OBJ-AT ?auto_20532 ?auto_20534 ) ( TRUCK-AT ?auto_20536 ?auto_20535 ) ( IN-CITY ?auto_20535 ?auto_20537 ) ( not ( = ?auto_20530 ?auto_20535 ) ) ( not ( = ?auto_20534 ?auto_20535 ) ) ( OBJ-AT ?auto_20531 ?auto_20530 ) ( not ( = ?auto_20531 ?auto_20532 ) ) ( not ( = ?auto_20531 ?auto_20533 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_20533 ?auto_20532 ?auto_20530 )
      ( DELIVER-3PKG-VERIFY ?auto_20531 ?auto_20532 ?auto_20533 ?auto_20530 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_20598 - OBJ
      ?auto_20599 - OBJ
      ?auto_20600 - OBJ
      ?auto_20597 - LOCATION
    )
    :vars
    (
      ?auto_20601 - LOCATION
      ?auto_20604 - CITY
      ?auto_20603 - TRUCK
      ?auto_20602 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_20601 ?auto_20604 ) ( IN-CITY ?auto_20597 ?auto_20604 ) ( not ( = ?auto_20597 ?auto_20601 ) ) ( OBJ-AT ?auto_20600 ?auto_20597 ) ( not ( = ?auto_20600 ?auto_20598 ) ) ( OBJ-AT ?auto_20598 ?auto_20601 ) ( TRUCK-AT ?auto_20603 ?auto_20602 ) ( IN-CITY ?auto_20602 ?auto_20604 ) ( not ( = ?auto_20597 ?auto_20602 ) ) ( not ( = ?auto_20601 ?auto_20602 ) ) ( OBJ-AT ?auto_20599 ?auto_20597 ) ( not ( = ?auto_20598 ?auto_20599 ) ) ( not ( = ?auto_20599 ?auto_20600 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_20600 ?auto_20598 ?auto_20597 )
      ( DELIVER-3PKG-VERIFY ?auto_20598 ?auto_20599 ?auto_20600 ?auto_20597 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_20674 - OBJ
      ?auto_20675 - OBJ
      ?auto_20677 - OBJ
      ?auto_20676 - OBJ
      ?auto_20673 - LOCATION
    )
    :vars
    (
      ?auto_20678 - LOCATION
      ?auto_20681 - CITY
      ?auto_20680 - TRUCK
      ?auto_20679 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_20678 ?auto_20681 ) ( IN-CITY ?auto_20673 ?auto_20681 ) ( not ( = ?auto_20673 ?auto_20678 ) ) ( OBJ-AT ?auto_20674 ?auto_20673 ) ( not ( = ?auto_20674 ?auto_20676 ) ) ( OBJ-AT ?auto_20676 ?auto_20678 ) ( TRUCK-AT ?auto_20680 ?auto_20679 ) ( IN-CITY ?auto_20679 ?auto_20681 ) ( not ( = ?auto_20673 ?auto_20679 ) ) ( not ( = ?auto_20678 ?auto_20679 ) ) ( OBJ-AT ?auto_20675 ?auto_20673 ) ( OBJ-AT ?auto_20677 ?auto_20673 ) ( not ( = ?auto_20674 ?auto_20675 ) ) ( not ( = ?auto_20674 ?auto_20677 ) ) ( not ( = ?auto_20675 ?auto_20677 ) ) ( not ( = ?auto_20675 ?auto_20676 ) ) ( not ( = ?auto_20677 ?auto_20676 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_20674 ?auto_20676 ?auto_20673 )
      ( DELIVER-4PKG-VERIFY ?auto_20674 ?auto_20675 ?auto_20677 ?auto_20676 ?auto_20673 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_20692 - OBJ
      ?auto_20693 - OBJ
      ?auto_20695 - OBJ
      ?auto_20694 - OBJ
      ?auto_20691 - LOCATION
    )
    :vars
    (
      ?auto_20696 - LOCATION
      ?auto_20699 - CITY
      ?auto_20698 - TRUCK
      ?auto_20697 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_20696 ?auto_20699 ) ( IN-CITY ?auto_20691 ?auto_20699 ) ( not ( = ?auto_20691 ?auto_20696 ) ) ( OBJ-AT ?auto_20694 ?auto_20691 ) ( not ( = ?auto_20694 ?auto_20695 ) ) ( OBJ-AT ?auto_20695 ?auto_20696 ) ( TRUCK-AT ?auto_20698 ?auto_20697 ) ( IN-CITY ?auto_20697 ?auto_20699 ) ( not ( = ?auto_20691 ?auto_20697 ) ) ( not ( = ?auto_20696 ?auto_20697 ) ) ( OBJ-AT ?auto_20692 ?auto_20691 ) ( OBJ-AT ?auto_20693 ?auto_20691 ) ( not ( = ?auto_20692 ?auto_20693 ) ) ( not ( = ?auto_20692 ?auto_20695 ) ) ( not ( = ?auto_20692 ?auto_20694 ) ) ( not ( = ?auto_20693 ?auto_20695 ) ) ( not ( = ?auto_20693 ?auto_20694 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_20694 ?auto_20695 ?auto_20691 )
      ( DELIVER-4PKG-VERIFY ?auto_20692 ?auto_20693 ?auto_20695 ?auto_20694 ?auto_20691 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_20764 - OBJ
      ?auto_20765 - OBJ
      ?auto_20767 - OBJ
      ?auto_20766 - OBJ
      ?auto_20763 - LOCATION
    )
    :vars
    (
      ?auto_20768 - LOCATION
      ?auto_20771 - CITY
      ?auto_20770 - TRUCK
      ?auto_20769 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_20768 ?auto_20771 ) ( IN-CITY ?auto_20763 ?auto_20771 ) ( not ( = ?auto_20763 ?auto_20768 ) ) ( OBJ-AT ?auto_20764 ?auto_20763 ) ( not ( = ?auto_20764 ?auto_20765 ) ) ( OBJ-AT ?auto_20765 ?auto_20768 ) ( TRUCK-AT ?auto_20770 ?auto_20769 ) ( IN-CITY ?auto_20769 ?auto_20771 ) ( not ( = ?auto_20763 ?auto_20769 ) ) ( not ( = ?auto_20768 ?auto_20769 ) ) ( OBJ-AT ?auto_20767 ?auto_20763 ) ( OBJ-AT ?auto_20766 ?auto_20763 ) ( not ( = ?auto_20764 ?auto_20767 ) ) ( not ( = ?auto_20764 ?auto_20766 ) ) ( not ( = ?auto_20765 ?auto_20767 ) ) ( not ( = ?auto_20765 ?auto_20766 ) ) ( not ( = ?auto_20767 ?auto_20766 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_20764 ?auto_20765 ?auto_20763 )
      ( DELIVER-4PKG-VERIFY ?auto_20764 ?auto_20765 ?auto_20767 ?auto_20766 ?auto_20763 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_21023 - OBJ
      ?auto_21024 - OBJ
      ?auto_21026 - OBJ
      ?auto_21025 - OBJ
      ?auto_21022 - LOCATION
    )
    :vars
    (
      ?auto_21027 - LOCATION
      ?auto_21030 - CITY
      ?auto_21029 - TRUCK
      ?auto_21028 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_21027 ?auto_21030 ) ( IN-CITY ?auto_21022 ?auto_21030 ) ( not ( = ?auto_21022 ?auto_21027 ) ) ( OBJ-AT ?auto_21025 ?auto_21022 ) ( not ( = ?auto_21025 ?auto_21023 ) ) ( OBJ-AT ?auto_21023 ?auto_21027 ) ( TRUCK-AT ?auto_21029 ?auto_21028 ) ( IN-CITY ?auto_21028 ?auto_21030 ) ( not ( = ?auto_21022 ?auto_21028 ) ) ( not ( = ?auto_21027 ?auto_21028 ) ) ( OBJ-AT ?auto_21024 ?auto_21022 ) ( OBJ-AT ?auto_21026 ?auto_21022 ) ( not ( = ?auto_21023 ?auto_21024 ) ) ( not ( = ?auto_21023 ?auto_21026 ) ) ( not ( = ?auto_21024 ?auto_21026 ) ) ( not ( = ?auto_21024 ?auto_21025 ) ) ( not ( = ?auto_21026 ?auto_21025 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_21025 ?auto_21023 ?auto_21022 )
      ( DELIVER-4PKG-VERIFY ?auto_21023 ?auto_21024 ?auto_21026 ?auto_21025 ?auto_21022 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_21465 - OBJ
      ?auto_21466 - OBJ
      ?auto_21468 - OBJ
      ?auto_21467 - OBJ
      ?auto_21464 - LOCATION
    )
    :vars
    (
      ?auto_21470 - LOCATION
      ?auto_21472 - CITY
      ?auto_21471 - TRUCK
      ?auto_21469 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_21470 ?auto_21472 ) ( IN-CITY ?auto_21464 ?auto_21472 ) ( not ( = ?auto_21464 ?auto_21470 ) ) ( OBJ-AT ?auto_21466 ?auto_21464 ) ( not ( = ?auto_21466 ?auto_21467 ) ) ( OBJ-AT ?auto_21467 ?auto_21470 ) ( TRUCK-AT ?auto_21471 ?auto_21469 ) ( IN-CITY ?auto_21469 ?auto_21472 ) ( not ( = ?auto_21464 ?auto_21469 ) ) ( not ( = ?auto_21470 ?auto_21469 ) ) ( OBJ-AT ?auto_21465 ?auto_21464 ) ( OBJ-AT ?auto_21468 ?auto_21464 ) ( not ( = ?auto_21465 ?auto_21466 ) ) ( not ( = ?auto_21465 ?auto_21468 ) ) ( not ( = ?auto_21465 ?auto_21467 ) ) ( not ( = ?auto_21466 ?auto_21468 ) ) ( not ( = ?auto_21468 ?auto_21467 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_21466 ?auto_21467 ?auto_21464 )
      ( DELIVER-4PKG-VERIFY ?auto_21465 ?auto_21466 ?auto_21468 ?auto_21467 ?auto_21464 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_21814 - OBJ
      ?auto_21815 - OBJ
      ?auto_21817 - OBJ
      ?auto_21816 - OBJ
      ?auto_21813 - LOCATION
    )
    :vars
    (
      ?auto_21819 - LOCATION
      ?auto_21821 - CITY
      ?auto_21820 - TRUCK
      ?auto_21818 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_21819 ?auto_21821 ) ( IN-CITY ?auto_21813 ?auto_21821 ) ( not ( = ?auto_21813 ?auto_21819 ) ) ( OBJ-AT ?auto_21815 ?auto_21813 ) ( not ( = ?auto_21815 ?auto_21814 ) ) ( OBJ-AT ?auto_21814 ?auto_21819 ) ( TRUCK-AT ?auto_21820 ?auto_21818 ) ( IN-CITY ?auto_21818 ?auto_21821 ) ( not ( = ?auto_21813 ?auto_21818 ) ) ( not ( = ?auto_21819 ?auto_21818 ) ) ( OBJ-AT ?auto_21817 ?auto_21813 ) ( OBJ-AT ?auto_21816 ?auto_21813 ) ( not ( = ?auto_21814 ?auto_21817 ) ) ( not ( = ?auto_21814 ?auto_21816 ) ) ( not ( = ?auto_21815 ?auto_21817 ) ) ( not ( = ?auto_21815 ?auto_21816 ) ) ( not ( = ?auto_21817 ?auto_21816 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_21815 ?auto_21814 ?auto_21813 )
      ( DELIVER-4PKG-VERIFY ?auto_21814 ?auto_21815 ?auto_21817 ?auto_21816 ?auto_21813 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_23473 - OBJ
      ?auto_23472 - LOCATION
    )
    :vars
    (
      ?auto_23475 - LOCATION
      ?auto_23476 - CITY
      ?auto_23474 - OBJ
      ?auto_23477 - TRUCK
      ?auto_23478 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_23475 ?auto_23476 ) ( IN-CITY ?auto_23472 ?auto_23476 ) ( not ( = ?auto_23472 ?auto_23475 ) ) ( not ( = ?auto_23474 ?auto_23473 ) ) ( OBJ-AT ?auto_23473 ?auto_23475 ) ( IN-TRUCK ?auto_23474 ?auto_23477 ) ( TRUCK-AT ?auto_23477 ?auto_23478 ) ( IN-CITY ?auto_23478 ?auto_23476 ) ( not ( = ?auto_23472 ?auto_23478 ) ) ( not ( = ?auto_23475 ?auto_23478 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_23477 ?auto_23478 ?auto_23472 ?auto_23476 )
      ( DELIVER-2PKG ?auto_23474 ?auto_23473 ?auto_23472 )
      ( DELIVER-1PKG-VERIFY ?auto_23473 ?auto_23472 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_23480 - OBJ
      ?auto_23481 - OBJ
      ?auto_23479 - LOCATION
    )
    :vars
    (
      ?auto_23485 - LOCATION
      ?auto_23484 - CITY
      ?auto_23483 - TRUCK
      ?auto_23482 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_23485 ?auto_23484 ) ( IN-CITY ?auto_23479 ?auto_23484 ) ( not ( = ?auto_23479 ?auto_23485 ) ) ( not ( = ?auto_23480 ?auto_23481 ) ) ( OBJ-AT ?auto_23481 ?auto_23485 ) ( IN-TRUCK ?auto_23480 ?auto_23483 ) ( TRUCK-AT ?auto_23483 ?auto_23482 ) ( IN-CITY ?auto_23482 ?auto_23484 ) ( not ( = ?auto_23479 ?auto_23482 ) ) ( not ( = ?auto_23485 ?auto_23482 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_23481 ?auto_23479 )
      ( DELIVER-2PKG-VERIFY ?auto_23480 ?auto_23481 ?auto_23479 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_23495 - OBJ
      ?auto_23496 - OBJ
      ?auto_23494 - LOCATION
    )
    :vars
    (
      ?auto_23500 - LOCATION
      ?auto_23499 - CITY
      ?auto_23498 - TRUCK
      ?auto_23497 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_23500 ?auto_23499 ) ( IN-CITY ?auto_23494 ?auto_23499 ) ( not ( = ?auto_23494 ?auto_23500 ) ) ( not ( = ?auto_23496 ?auto_23495 ) ) ( OBJ-AT ?auto_23495 ?auto_23500 ) ( IN-TRUCK ?auto_23496 ?auto_23498 ) ( TRUCK-AT ?auto_23498 ?auto_23497 ) ( IN-CITY ?auto_23497 ?auto_23499 ) ( not ( = ?auto_23494 ?auto_23497 ) ) ( not ( = ?auto_23500 ?auto_23497 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_23496 ?auto_23495 ?auto_23494 )
      ( DELIVER-2PKG-VERIFY ?auto_23495 ?auto_23496 ?auto_23494 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_24277 - OBJ
      ?auto_24276 - LOCATION
    )
    :vars
    (
      ?auto_24282 - LOCATION
      ?auto_24281 - CITY
      ?auto_24278 - OBJ
      ?auto_24280 - TRUCK
      ?auto_24279 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_24282 ?auto_24281 ) ( IN-CITY ?auto_24276 ?auto_24281 ) ( not ( = ?auto_24276 ?auto_24282 ) ) ( not ( = ?auto_24278 ?auto_24277 ) ) ( OBJ-AT ?auto_24277 ?auto_24282 ) ( TRUCK-AT ?auto_24280 ?auto_24279 ) ( IN-CITY ?auto_24279 ?auto_24281 ) ( not ( = ?auto_24276 ?auto_24279 ) ) ( not ( = ?auto_24282 ?auto_24279 ) ) ( OBJ-AT ?auto_24278 ?auto_24279 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_24278 ?auto_24280 ?auto_24279 )
      ( DELIVER-2PKG ?auto_24278 ?auto_24277 ?auto_24276 )
      ( DELIVER-1PKG-VERIFY ?auto_24277 ?auto_24276 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_24284 - OBJ
      ?auto_24285 - OBJ
      ?auto_24283 - LOCATION
    )
    :vars
    (
      ?auto_24286 - LOCATION
      ?auto_24287 - CITY
      ?auto_24288 - TRUCK
      ?auto_24289 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_24286 ?auto_24287 ) ( IN-CITY ?auto_24283 ?auto_24287 ) ( not ( = ?auto_24283 ?auto_24286 ) ) ( not ( = ?auto_24284 ?auto_24285 ) ) ( OBJ-AT ?auto_24285 ?auto_24286 ) ( TRUCK-AT ?auto_24288 ?auto_24289 ) ( IN-CITY ?auto_24289 ?auto_24287 ) ( not ( = ?auto_24283 ?auto_24289 ) ) ( not ( = ?auto_24286 ?auto_24289 ) ) ( OBJ-AT ?auto_24284 ?auto_24289 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_24285 ?auto_24283 )
      ( DELIVER-2PKG-VERIFY ?auto_24284 ?auto_24285 ?auto_24283 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_24294 - OBJ
      ?auto_24295 - OBJ
      ?auto_24293 - LOCATION
    )
    :vars
    (
      ?auto_24297 - LOCATION
      ?auto_24296 - CITY
      ?auto_24298 - TRUCK
      ?auto_24299 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_24297 ?auto_24296 ) ( IN-CITY ?auto_24293 ?auto_24296 ) ( not ( = ?auto_24293 ?auto_24297 ) ) ( not ( = ?auto_24295 ?auto_24294 ) ) ( OBJ-AT ?auto_24294 ?auto_24297 ) ( TRUCK-AT ?auto_24298 ?auto_24299 ) ( IN-CITY ?auto_24299 ?auto_24296 ) ( not ( = ?auto_24293 ?auto_24299 ) ) ( not ( = ?auto_24297 ?auto_24299 ) ) ( OBJ-AT ?auto_24295 ?auto_24299 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_24295 ?auto_24294 ?auto_24293 )
      ( DELIVER-2PKG-VERIFY ?auto_24294 ?auto_24295 ?auto_24293 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_28175 - OBJ
      ?auto_28176 - OBJ
      ?auto_28177 - OBJ
      ?auto_28174 - LOCATION
    )
    :vars
    (
      ?auto_28178 - TRUCK
      ?auto_28179 - LOCATION
      ?auto_28180 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_28175 ?auto_28178 ) ( TRUCK-AT ?auto_28178 ?auto_28179 ) ( IN-CITY ?auto_28179 ?auto_28180 ) ( IN-CITY ?auto_28174 ?auto_28180 ) ( not ( = ?auto_28174 ?auto_28179 ) ) ( OBJ-AT ?auto_28176 ?auto_28174 ) ( not ( = ?auto_28176 ?auto_28175 ) ) ( OBJ-AT ?auto_28177 ?auto_28174 ) ( not ( = ?auto_28175 ?auto_28177 ) ) ( not ( = ?auto_28176 ?auto_28177 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_28176 ?auto_28175 ?auto_28174 )
      ( DELIVER-3PKG-VERIFY ?auto_28175 ?auto_28176 ?auto_28177 ?auto_28174 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_33145 - OBJ
      ?auto_33146 - OBJ
      ?auto_33147 - OBJ
      ?auto_33144 - LOCATION
    )
    :vars
    (
      ?auto_33148 - LOCATION
      ?auto_33149 - CITY
      ?auto_33150 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_33148 ?auto_33149 ) ( IN-CITY ?auto_33144 ?auto_33149 ) ( not ( = ?auto_33144 ?auto_33148 ) ) ( OBJ-AT ?auto_33146 ?auto_33144 ) ( not ( = ?auto_33146 ?auto_33145 ) ) ( OBJ-AT ?auto_33145 ?auto_33148 ) ( TRUCK-AT ?auto_33150 ?auto_33144 ) ( OBJ-AT ?auto_33147 ?auto_33144 ) ( not ( = ?auto_33145 ?auto_33147 ) ) ( not ( = ?auto_33146 ?auto_33147 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_33146 ?auto_33145 ?auto_33144 )
      ( DELIVER-3PKG-VERIFY ?auto_33145 ?auto_33146 ?auto_33147 ?auto_33144 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_42017 - OBJ
      ?auto_42018 - OBJ
      ?auto_42019 - OBJ
      ?auto_42016 - LOCATION
    )
    :vars
    (
      ?auto_42021 - LOCATION
      ?auto_42023 - CITY
      ?auto_42022 - TRUCK
      ?auto_42020 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_42021 ?auto_42023 ) ( IN-CITY ?auto_42016 ?auto_42023 ) ( not ( = ?auto_42016 ?auto_42021 ) ) ( OBJ-AT ?auto_42018 ?auto_42016 ) ( not ( = ?auto_42018 ?auto_42017 ) ) ( OBJ-AT ?auto_42017 ?auto_42021 ) ( TRUCK-AT ?auto_42022 ?auto_42020 ) ( IN-CITY ?auto_42020 ?auto_42023 ) ( not ( = ?auto_42016 ?auto_42020 ) ) ( not ( = ?auto_42021 ?auto_42020 ) ) ( OBJ-AT ?auto_42019 ?auto_42016 ) ( not ( = ?auto_42017 ?auto_42019 ) ) ( not ( = ?auto_42018 ?auto_42019 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_42018 ?auto_42017 ?auto_42016 )
      ( DELIVER-3PKG-VERIFY ?auto_42017 ?auto_42018 ?auto_42019 ?auto_42016 ) )
  )

)

