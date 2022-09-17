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
      ?auto_90283 - OBJ
      ?auto_90284 - LOCATION
    )
    :vars
    (
      ?auto_90285 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_90285 ?auto_90284 ) ( IN-TRUCK ?auto_90283 ?auto_90285 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_90283 ?auto_90285 ?auto_90284 )
      ( DELIVER-1PKG-VERIFY ?auto_90283 ?auto_90284 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_90309 - OBJ
      ?auto_90310 - LOCATION
    )
    :vars
    (
      ?auto_90312 - TRUCK
      ?auto_90315 - LOCATION
      ?auto_90316 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_90309 ?auto_90312 ) ( TRUCK-AT ?auto_90312 ?auto_90315 ) ( IN-CITY ?auto_90315 ?auto_90316 ) ( IN-CITY ?auto_90310 ?auto_90316 ) ( not ( = ?auto_90310 ?auto_90315 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_90312 ?auto_90315 ?auto_90310 ?auto_90316 )
      ( DELIVER-1PKG ?auto_90309 ?auto_90310 )
      ( DELIVER-1PKG-VERIFY ?auto_90309 ?auto_90310 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_90345 - OBJ
      ?auto_90346 - LOCATION
    )
    :vars
    (
      ?auto_90351 - TRUCK
      ?auto_90350 - LOCATION
      ?auto_90347 - CITY
      ?auto_90353 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?auto_90351 ?auto_90350 ) ( IN-CITY ?auto_90350 ?auto_90347 ) ( IN-CITY ?auto_90346 ?auto_90347 ) ( not ( = ?auto_90346 ?auto_90350 ) ) ( TRUCK-AT ?auto_90351 ?auto_90353 ) ( OBJ-AT ?auto_90345 ?auto_90353 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_90345 ?auto_90351 ?auto_90353 )
      ( DELIVER-1PKG ?auto_90345 ?auto_90346 )
      ( DELIVER-1PKG-VERIFY ?auto_90345 ?auto_90346 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_90385 - OBJ
      ?auto_90386 - LOCATION
    )
    :vars
    (
      ?auto_90388 - LOCATION
      ?auto_90392 - CITY
      ?auto_90391 - TRUCK
      ?auto_90394 - LOCATION
      ?auto_90395 - CITY
    )
    :precondition
    ( and ( IN-CITY ?auto_90388 ?auto_90392 ) ( IN-CITY ?auto_90386 ?auto_90392 ) ( not ( = ?auto_90386 ?auto_90388 ) ) ( OBJ-AT ?auto_90385 ?auto_90388 ) ( TRUCK-AT ?auto_90391 ?auto_90394 ) ( IN-CITY ?auto_90394 ?auto_90395 ) ( IN-CITY ?auto_90388 ?auto_90395 ) ( not ( = ?auto_90388 ?auto_90394 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_90391 ?auto_90394 ?auto_90388 ?auto_90395 )
      ( DELIVER-1PKG ?auto_90385 ?auto_90386 )
      ( DELIVER-1PKG-VERIFY ?auto_90385 ?auto_90386 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_90549 - OBJ
      ?auto_90551 - OBJ
      ?auto_90550 - LOCATION
    )
    :vars
    (
      ?auto_90553 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_90551 ?auto_90549 ) ( TRUCK-AT ?auto_90553 ?auto_90550 ) ( IN-TRUCK ?auto_90551 ?auto_90553 ) ( OBJ-AT ?auto_90549 ?auto_90550 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_90551 ?auto_90550 )
      ( DELIVER-2PKG-VERIFY ?auto_90549 ?auto_90551 ?auto_90550 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_90745 - OBJ
      ?auto_90747 - OBJ
      ?auto_90746 - LOCATION
    )
    :vars
    (
      ?auto_90750 - TRUCK
      ?auto_90751 - LOCATION
      ?auto_90748 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_90747 ?auto_90745 ) ( IN-TRUCK ?auto_90747 ?auto_90750 ) ( TRUCK-AT ?auto_90750 ?auto_90751 ) ( IN-CITY ?auto_90751 ?auto_90748 ) ( IN-CITY ?auto_90746 ?auto_90748 ) ( not ( = ?auto_90746 ?auto_90751 ) ) ( OBJ-AT ?auto_90745 ?auto_90746 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_90747 ?auto_90746 )
      ( DELIVER-2PKG-VERIFY ?auto_90745 ?auto_90747 ?auto_90746 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_91006 - OBJ
      ?auto_91007 - LOCATION
    )
    :vars
    (
      ?auto_91009 - OBJ
      ?auto_91008 - TRUCK
      ?auto_91011 - LOCATION
      ?auto_91013 - CITY
      ?auto_91015 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_91006 ?auto_91009 ) ( TRUCK-AT ?auto_91008 ?auto_91011 ) ( IN-CITY ?auto_91011 ?auto_91013 ) ( IN-CITY ?auto_91007 ?auto_91013 ) ( not ( = ?auto_91007 ?auto_91011 ) ) ( OBJ-AT ?auto_91009 ?auto_91007 ) ( TRUCK-AT ?auto_91008 ?auto_91015 ) ( OBJ-AT ?auto_91006 ?auto_91015 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_91006 ?auto_91008 ?auto_91015 )
      ( DELIVER-2PKG ?auto_91009 ?auto_91006 ?auto_91007 )
      ( DELIVER-1PKG-VERIFY ?auto_91006 ?auto_91007 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_91017 - OBJ
      ?auto_91019 - OBJ
      ?auto_91018 - LOCATION
    )
    :vars
    (
      ?auto_91021 - OBJ
      ?auto_91024 - TRUCK
      ?auto_91020 - LOCATION
      ?auto_91022 - CITY
      ?auto_91025 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_91019 ?auto_91017 ) ( GREATER-THAN ?auto_91019 ?auto_91021 ) ( TRUCK-AT ?auto_91024 ?auto_91020 ) ( IN-CITY ?auto_91020 ?auto_91022 ) ( IN-CITY ?auto_91018 ?auto_91022 ) ( not ( = ?auto_91018 ?auto_91020 ) ) ( OBJ-AT ?auto_91021 ?auto_91018 ) ( TRUCK-AT ?auto_91024 ?auto_91025 ) ( OBJ-AT ?auto_91019 ?auto_91025 ) ( OBJ-AT ?auto_91017 ?auto_91018 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_91019 ?auto_91018 )
      ( DELIVER-2PKG-VERIFY ?auto_91017 ?auto_91019 ?auto_91018 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_91328 - OBJ
      ?auto_91329 - LOCATION
    )
    :vars
    (
      ?auto_91335 - OBJ
      ?auto_91332 - OBJ
      ?auto_91333 - LOCATION
      ?auto_91331 - CITY
      ?auto_91330 - TRUCK
      ?auto_91339 - LOCATION
      ?auto_91340 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_91328 ?auto_91335 ) ( GREATER-THAN ?auto_91328 ?auto_91332 ) ( IN-CITY ?auto_91333 ?auto_91331 ) ( IN-CITY ?auto_91329 ?auto_91331 ) ( not ( = ?auto_91329 ?auto_91333 ) ) ( OBJ-AT ?auto_91332 ?auto_91329 ) ( OBJ-AT ?auto_91328 ?auto_91333 ) ( OBJ-AT ?auto_91335 ?auto_91329 ) ( TRUCK-AT ?auto_91330 ?auto_91339 ) ( IN-CITY ?auto_91339 ?auto_91340 ) ( IN-CITY ?auto_91333 ?auto_91340 ) ( not ( = ?auto_91333 ?auto_91339 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_91330 ?auto_91339 ?auto_91333 ?auto_91340 )
      ( DELIVER-2PKG ?auto_91335 ?auto_91328 ?auto_91329 )
      ( DELIVER-1PKG-VERIFY ?auto_91328 ?auto_91329 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_91342 - OBJ
      ?auto_91344 - OBJ
      ?auto_91343 - LOCATION
    )
    :vars
    (
      ?auto_91351 - OBJ
      ?auto_91350 - OBJ
      ?auto_91348 - LOCATION
      ?auto_91345 - CITY
      ?auto_91353 - TRUCK
      ?auto_91346 - LOCATION
      ?auto_91352 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_91344 ?auto_91342 ) ( GREATER-THAN ?auto_91344 ?auto_91351 ) ( GREATER-THAN ?auto_91344 ?auto_91350 ) ( IN-CITY ?auto_91348 ?auto_91345 ) ( IN-CITY ?auto_91343 ?auto_91345 ) ( not ( = ?auto_91343 ?auto_91348 ) ) ( OBJ-AT ?auto_91350 ?auto_91343 ) ( OBJ-AT ?auto_91344 ?auto_91348 ) ( OBJ-AT ?auto_91351 ?auto_91343 ) ( TRUCK-AT ?auto_91353 ?auto_91346 ) ( IN-CITY ?auto_91346 ?auto_91352 ) ( IN-CITY ?auto_91348 ?auto_91352 ) ( not ( = ?auto_91348 ?auto_91346 ) ) ( OBJ-AT ?auto_91342 ?auto_91343 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_91344 ?auto_91343 )
      ( DELIVER-2PKG-VERIFY ?auto_91342 ?auto_91344 ?auto_91343 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_91703 - OBJ
      ?auto_91704 - LOCATION
    )
    :vars
    (
      ?auto_91711 - OBJ
      ?auto_91707 - LOCATION
      ?auto_91709 - CITY
      ?auto_91706 - TRUCK
      ?auto_91705 - LOCATION
      ?auto_91712 - CITY
      ?auto_91716 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_91703 ?auto_91711 ) ( IN-CITY ?auto_91707 ?auto_91709 ) ( IN-CITY ?auto_91704 ?auto_91709 ) ( not ( = ?auto_91704 ?auto_91707 ) ) ( OBJ-AT ?auto_91703 ?auto_91707 ) ( TRUCK-AT ?auto_91706 ?auto_91705 ) ( IN-CITY ?auto_91705 ?auto_91712 ) ( IN-CITY ?auto_91707 ?auto_91712 ) ( not ( = ?auto_91707 ?auto_91705 ) ) ( TRUCK-AT ?auto_91716 ?auto_91704 ) ( IN-TRUCK ?auto_91711 ?auto_91716 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_91711 ?auto_91704 )
      ( DELIVER-2PKG ?auto_91711 ?auto_91703 ?auto_91704 )
      ( DELIVER-1PKG-VERIFY ?auto_91703 ?auto_91704 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_91718 - OBJ
      ?auto_91720 - OBJ
      ?auto_91719 - LOCATION
    )
    :vars
    (
      ?auto_91723 - LOCATION
      ?auto_91729 - CITY
      ?auto_91726 - TRUCK
      ?auto_91722 - LOCATION
      ?auto_91728 - CITY
      ?auto_91724 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_91720 ?auto_91718 ) ( IN-CITY ?auto_91723 ?auto_91729 ) ( IN-CITY ?auto_91719 ?auto_91729 ) ( not ( = ?auto_91719 ?auto_91723 ) ) ( OBJ-AT ?auto_91720 ?auto_91723 ) ( TRUCK-AT ?auto_91726 ?auto_91722 ) ( IN-CITY ?auto_91722 ?auto_91728 ) ( IN-CITY ?auto_91723 ?auto_91728 ) ( not ( = ?auto_91723 ?auto_91722 ) ) ( TRUCK-AT ?auto_91724 ?auto_91719 ) ( IN-TRUCK ?auto_91718 ?auto_91724 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_91720 ?auto_91719 )
      ( DELIVER-2PKG-VERIFY ?auto_91718 ?auto_91720 ?auto_91719 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_92055 - OBJ
      ?auto_92056 - LOCATION
    )
    :vars
    (
      ?auto_92065 - OBJ
      ?auto_92062 - LOCATION
      ?auto_92059 - CITY
      ?auto_92058 - CITY
      ?auto_92061 - TRUCK
      ?auto_92067 - LOCATION
      ?auto_92068 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_92055 ?auto_92065 ) ( IN-CITY ?auto_92062 ?auto_92059 ) ( IN-CITY ?auto_92056 ?auto_92059 ) ( not ( = ?auto_92056 ?auto_92062 ) ) ( OBJ-AT ?auto_92055 ?auto_92062 ) ( IN-CITY ?auto_92056 ?auto_92058 ) ( IN-CITY ?auto_92062 ?auto_92058 ) ( IN-TRUCK ?auto_92065 ?auto_92061 ) ( TRUCK-AT ?auto_92061 ?auto_92067 ) ( IN-CITY ?auto_92067 ?auto_92068 ) ( IN-CITY ?auto_92056 ?auto_92068 ) ( not ( = ?auto_92056 ?auto_92067 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_92061 ?auto_92067 ?auto_92056 ?auto_92068 )
      ( DELIVER-2PKG ?auto_92065 ?auto_92055 ?auto_92056 )
      ( DELIVER-1PKG-VERIFY ?auto_92055 ?auto_92056 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_92070 - OBJ
      ?auto_92072 - OBJ
      ?auto_92071 - LOCATION
    )
    :vars
    (
      ?auto_92073 - LOCATION
      ?auto_92076 - CITY
      ?auto_92077 - CITY
      ?auto_92081 - TRUCK
      ?auto_92079 - LOCATION
      ?auto_92078 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_92072 ?auto_92070 ) ( IN-CITY ?auto_92073 ?auto_92076 ) ( IN-CITY ?auto_92071 ?auto_92076 ) ( not ( = ?auto_92071 ?auto_92073 ) ) ( OBJ-AT ?auto_92072 ?auto_92073 ) ( IN-CITY ?auto_92071 ?auto_92077 ) ( IN-CITY ?auto_92073 ?auto_92077 ) ( IN-TRUCK ?auto_92070 ?auto_92081 ) ( TRUCK-AT ?auto_92081 ?auto_92079 ) ( IN-CITY ?auto_92079 ?auto_92078 ) ( IN-CITY ?auto_92071 ?auto_92078 ) ( not ( = ?auto_92071 ?auto_92079 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_92072 ?auto_92071 )
      ( DELIVER-2PKG-VERIFY ?auto_92070 ?auto_92072 ?auto_92071 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_92407 - OBJ
      ?auto_92408 - LOCATION
    )
    :vars
    (
      ?auto_92413 - OBJ
      ?auto_92417 - LOCATION
      ?auto_92414 - CITY
      ?auto_92415 - CITY
      ?auto_92409 - TRUCK
      ?auto_92416 - LOCATION
      ?auto_92411 - CITY
      ?auto_92419 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_92407 ?auto_92413 ) ( IN-CITY ?auto_92417 ?auto_92414 ) ( IN-CITY ?auto_92408 ?auto_92414 ) ( not ( = ?auto_92408 ?auto_92417 ) ) ( OBJ-AT ?auto_92407 ?auto_92417 ) ( IN-CITY ?auto_92408 ?auto_92415 ) ( IN-CITY ?auto_92417 ?auto_92415 ) ( TRUCK-AT ?auto_92409 ?auto_92416 ) ( IN-CITY ?auto_92416 ?auto_92411 ) ( IN-CITY ?auto_92408 ?auto_92411 ) ( not ( = ?auto_92408 ?auto_92416 ) ) ( TRUCK-AT ?auto_92409 ?auto_92419 ) ( OBJ-AT ?auto_92413 ?auto_92419 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_92413 ?auto_92409 ?auto_92419 )
      ( DELIVER-2PKG ?auto_92413 ?auto_92407 ?auto_92408 )
      ( DELIVER-1PKG-VERIFY ?auto_92407 ?auto_92408 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_92421 - OBJ
      ?auto_92423 - OBJ
      ?auto_92422 - LOCATION
    )
    :vars
    (
      ?auto_92433 - LOCATION
      ?auto_92432 - CITY
      ?auto_92431 - CITY
      ?auto_92429 - TRUCK
      ?auto_92424 - LOCATION
      ?auto_92427 - CITY
      ?auto_92428 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_92423 ?auto_92421 ) ( IN-CITY ?auto_92433 ?auto_92432 ) ( IN-CITY ?auto_92422 ?auto_92432 ) ( not ( = ?auto_92422 ?auto_92433 ) ) ( OBJ-AT ?auto_92423 ?auto_92433 ) ( IN-CITY ?auto_92422 ?auto_92431 ) ( IN-CITY ?auto_92433 ?auto_92431 ) ( TRUCK-AT ?auto_92429 ?auto_92424 ) ( IN-CITY ?auto_92424 ?auto_92427 ) ( IN-CITY ?auto_92422 ?auto_92427 ) ( not ( = ?auto_92422 ?auto_92424 ) ) ( TRUCK-AT ?auto_92429 ?auto_92428 ) ( OBJ-AT ?auto_92421 ?auto_92428 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_92423 ?auto_92422 )
      ( DELIVER-2PKG-VERIFY ?auto_92421 ?auto_92423 ?auto_92422 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_93529 - OBJ
      ?auto_93531 - OBJ
      ?auto_93532 - OBJ
      ?auto_93530 - LOCATION
    )
    :vars
    (
      ?auto_93534 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_93531 ?auto_93529 ) ( GREATER-THAN ?auto_93532 ?auto_93529 ) ( GREATER-THAN ?auto_93532 ?auto_93531 ) ( TRUCK-AT ?auto_93534 ?auto_93530 ) ( IN-TRUCK ?auto_93532 ?auto_93534 ) ( OBJ-AT ?auto_93529 ?auto_93530 ) ( OBJ-AT ?auto_93531 ?auto_93530 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_93532 ?auto_93530 )
      ( DELIVER-3PKG-VERIFY ?auto_93529 ?auto_93531 ?auto_93532 ?auto_93530 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_94232 - OBJ
      ?auto_94234 - OBJ
      ?auto_94235 - OBJ
      ?auto_94233 - LOCATION
    )
    :vars
    (
      ?auto_94237 - OBJ
      ?auto_94238 - TRUCK
      ?auto_94240 - LOCATION
      ?auto_94239 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_94234 ?auto_94232 ) ( GREATER-THAN ?auto_94235 ?auto_94232 ) ( GREATER-THAN ?auto_94235 ?auto_94234 ) ( GREATER-THAN ?auto_94235 ?auto_94237 ) ( IN-TRUCK ?auto_94235 ?auto_94238 ) ( TRUCK-AT ?auto_94238 ?auto_94240 ) ( IN-CITY ?auto_94240 ?auto_94239 ) ( IN-CITY ?auto_94233 ?auto_94239 ) ( not ( = ?auto_94233 ?auto_94240 ) ) ( OBJ-AT ?auto_94237 ?auto_94233 ) ( OBJ-AT ?auto_94232 ?auto_94233 ) ( OBJ-AT ?auto_94234 ?auto_94233 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_94237 ?auto_94235 ?auto_94233 )
      ( DELIVER-3PKG-VERIFY ?auto_94232 ?auto_94234 ?auto_94235 ?auto_94233 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_95196 - OBJ
      ?auto_95198 - OBJ
      ?auto_95199 - OBJ
      ?auto_95197 - LOCATION
    )
    :vars
    (
      ?auto_95205 - OBJ
      ?auto_95207 - OBJ
      ?auto_95200 - TRUCK
      ?auto_95203 - LOCATION
      ?auto_95201 - CITY
      ?auto_95204 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_95198 ?auto_95196 ) ( GREATER-THAN ?auto_95199 ?auto_95196 ) ( GREATER-THAN ?auto_95199 ?auto_95198 ) ( GREATER-THAN ?auto_95199 ?auto_95205 ) ( GREATER-THAN ?auto_95199 ?auto_95207 ) ( TRUCK-AT ?auto_95200 ?auto_95203 ) ( IN-CITY ?auto_95203 ?auto_95201 ) ( IN-CITY ?auto_95197 ?auto_95201 ) ( not ( = ?auto_95197 ?auto_95203 ) ) ( OBJ-AT ?auto_95207 ?auto_95197 ) ( TRUCK-AT ?auto_95200 ?auto_95204 ) ( OBJ-AT ?auto_95199 ?auto_95204 ) ( OBJ-AT ?auto_95205 ?auto_95197 ) ( OBJ-AT ?auto_95196 ?auto_95197 ) ( OBJ-AT ?auto_95198 ?auto_95197 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_95205 ?auto_95199 ?auto_95197 )
      ( DELIVER-3PKG-VERIFY ?auto_95196 ?auto_95198 ?auto_95199 ?auto_95197 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_96339 - OBJ
      ?auto_96341 - OBJ
      ?auto_96342 - OBJ
      ?auto_96340 - LOCATION
    )
    :vars
    (
      ?auto_96348 - OBJ
      ?auto_96345 - OBJ
      ?auto_96351 - OBJ
      ?auto_96346 - LOCATION
      ?auto_96350 - CITY
      ?auto_96352 - TRUCK
      ?auto_96343 - LOCATION
      ?auto_96344 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_96341 ?auto_96339 ) ( GREATER-THAN ?auto_96342 ?auto_96339 ) ( GREATER-THAN ?auto_96342 ?auto_96341 ) ( GREATER-THAN ?auto_96342 ?auto_96348 ) ( GREATER-THAN ?auto_96342 ?auto_96345 ) ( GREATER-THAN ?auto_96342 ?auto_96351 ) ( IN-CITY ?auto_96346 ?auto_96350 ) ( IN-CITY ?auto_96340 ?auto_96350 ) ( not ( = ?auto_96340 ?auto_96346 ) ) ( OBJ-AT ?auto_96351 ?auto_96340 ) ( OBJ-AT ?auto_96342 ?auto_96346 ) ( OBJ-AT ?auto_96345 ?auto_96340 ) ( TRUCK-AT ?auto_96352 ?auto_96343 ) ( IN-CITY ?auto_96343 ?auto_96344 ) ( IN-CITY ?auto_96346 ?auto_96344 ) ( not ( = ?auto_96346 ?auto_96343 ) ) ( OBJ-AT ?auto_96348 ?auto_96340 ) ( OBJ-AT ?auto_96339 ?auto_96340 ) ( OBJ-AT ?auto_96341 ?auto_96340 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_96348 ?auto_96342 ?auto_96340 )
      ( DELIVER-3PKG-VERIFY ?auto_96339 ?auto_96341 ?auto_96342 ?auto_96340 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_108929 - OBJ
      ?auto_108931 - OBJ
      ?auto_108932 - OBJ
      ?auto_108933 - OBJ
      ?auto_108930 - LOCATION
    )
    :vars
    (
      ?auto_108935 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_108931 ?auto_108929 ) ( GREATER-THAN ?auto_108932 ?auto_108929 ) ( GREATER-THAN ?auto_108932 ?auto_108931 ) ( GREATER-THAN ?auto_108933 ?auto_108929 ) ( GREATER-THAN ?auto_108933 ?auto_108931 ) ( GREATER-THAN ?auto_108933 ?auto_108932 ) ( TRUCK-AT ?auto_108935 ?auto_108930 ) ( IN-TRUCK ?auto_108933 ?auto_108935 ) ( OBJ-AT ?auto_108929 ?auto_108930 ) ( OBJ-AT ?auto_108931 ?auto_108930 ) ( OBJ-AT ?auto_108932 ?auto_108930 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_108933 ?auto_108930 )
      ( DELIVER-4PKG-VERIFY ?auto_108929 ?auto_108931 ?auto_108932 ?auto_108933 ?auto_108930 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_110773 - OBJ
      ?auto_110775 - OBJ
      ?auto_110776 - OBJ
      ?auto_110777 - OBJ
      ?auto_110774 - LOCATION
    )
    :vars
    (
      ?auto_110781 - OBJ
      ?auto_110779 - TRUCK
      ?auto_110778 - LOCATION
      ?auto_110783 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_110775 ?auto_110773 ) ( GREATER-THAN ?auto_110776 ?auto_110773 ) ( GREATER-THAN ?auto_110776 ?auto_110775 ) ( GREATER-THAN ?auto_110777 ?auto_110773 ) ( GREATER-THAN ?auto_110777 ?auto_110775 ) ( GREATER-THAN ?auto_110777 ?auto_110776 ) ( GREATER-THAN ?auto_110777 ?auto_110781 ) ( IN-TRUCK ?auto_110777 ?auto_110779 ) ( TRUCK-AT ?auto_110779 ?auto_110778 ) ( IN-CITY ?auto_110778 ?auto_110783 ) ( IN-CITY ?auto_110774 ?auto_110783 ) ( not ( = ?auto_110774 ?auto_110778 ) ) ( OBJ-AT ?auto_110781 ?auto_110774 ) ( OBJ-AT ?auto_110773 ?auto_110774 ) ( OBJ-AT ?auto_110775 ?auto_110774 ) ( OBJ-AT ?auto_110776 ?auto_110774 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_110781 ?auto_110777 ?auto_110774 )
      ( DELIVER-4PKG-VERIFY ?auto_110773 ?auto_110775 ?auto_110776 ?auto_110777 ?auto_110774 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_113215 - OBJ
      ?auto_113217 - OBJ
      ?auto_113218 - OBJ
      ?auto_113219 - OBJ
      ?auto_113216 - LOCATION
    )
    :vars
    (
      ?auto_113221 - OBJ
      ?auto_113223 - OBJ
      ?auto_113222 - TRUCK
      ?auto_113226 - LOCATION
      ?auto_113227 - CITY
      ?auto_113225 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_113217 ?auto_113215 ) ( GREATER-THAN ?auto_113218 ?auto_113215 ) ( GREATER-THAN ?auto_113218 ?auto_113217 ) ( GREATER-THAN ?auto_113219 ?auto_113215 ) ( GREATER-THAN ?auto_113219 ?auto_113217 ) ( GREATER-THAN ?auto_113219 ?auto_113218 ) ( GREATER-THAN ?auto_113219 ?auto_113221 ) ( GREATER-THAN ?auto_113219 ?auto_113223 ) ( TRUCK-AT ?auto_113222 ?auto_113226 ) ( IN-CITY ?auto_113226 ?auto_113227 ) ( IN-CITY ?auto_113216 ?auto_113227 ) ( not ( = ?auto_113216 ?auto_113226 ) ) ( OBJ-AT ?auto_113223 ?auto_113216 ) ( TRUCK-AT ?auto_113222 ?auto_113225 ) ( OBJ-AT ?auto_113219 ?auto_113225 ) ( OBJ-AT ?auto_113221 ?auto_113216 ) ( OBJ-AT ?auto_113215 ?auto_113216 ) ( OBJ-AT ?auto_113217 ?auto_113216 ) ( OBJ-AT ?auto_113218 ?auto_113216 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_113221 ?auto_113219 ?auto_113216 )
      ( DELIVER-4PKG-VERIFY ?auto_113215 ?auto_113217 ?auto_113218 ?auto_113219 ?auto_113216 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_116090 - OBJ
      ?auto_116092 - OBJ
      ?auto_116093 - OBJ
      ?auto_116094 - OBJ
      ?auto_116091 - LOCATION
    )
    :vars
    (
      ?auto_116099 - OBJ
      ?auto_116102 - OBJ
      ?auto_116095 - OBJ
      ?auto_116101 - LOCATION
      ?auto_116104 - CITY
      ?auto_116097 - TRUCK
      ?auto_116096 - LOCATION
      ?auto_116103 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_116092 ?auto_116090 ) ( GREATER-THAN ?auto_116093 ?auto_116090 ) ( GREATER-THAN ?auto_116093 ?auto_116092 ) ( GREATER-THAN ?auto_116094 ?auto_116090 ) ( GREATER-THAN ?auto_116094 ?auto_116092 ) ( GREATER-THAN ?auto_116094 ?auto_116093 ) ( GREATER-THAN ?auto_116094 ?auto_116099 ) ( GREATER-THAN ?auto_116094 ?auto_116102 ) ( GREATER-THAN ?auto_116094 ?auto_116095 ) ( IN-CITY ?auto_116101 ?auto_116104 ) ( IN-CITY ?auto_116091 ?auto_116104 ) ( not ( = ?auto_116091 ?auto_116101 ) ) ( OBJ-AT ?auto_116095 ?auto_116091 ) ( OBJ-AT ?auto_116094 ?auto_116101 ) ( OBJ-AT ?auto_116102 ?auto_116091 ) ( TRUCK-AT ?auto_116097 ?auto_116096 ) ( IN-CITY ?auto_116096 ?auto_116103 ) ( IN-CITY ?auto_116101 ?auto_116103 ) ( not ( = ?auto_116101 ?auto_116096 ) ) ( OBJ-AT ?auto_116099 ?auto_116091 ) ( OBJ-AT ?auto_116090 ?auto_116091 ) ( OBJ-AT ?auto_116092 ?auto_116091 ) ( OBJ-AT ?auto_116093 ?auto_116091 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_116099 ?auto_116094 ?auto_116091 )
      ( DELIVER-4PKG-VERIFY ?auto_116090 ?auto_116092 ?auto_116093 ?auto_116094 ?auto_116091 ) )
  )

)

