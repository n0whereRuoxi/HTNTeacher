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
      ?auto_176140 - OBJ
      ?auto_176139 - LOCATION
    )
    :vars
    (
      ?auto_176141 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_176141 ?auto_176139 ) ( IN-TRUCK ?auto_176140 ?auto_176141 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_176140 ?auto_176141 ?auto_176139 )
      ( DELIVER-1PKG-VERIFY ?auto_176140 ?auto_176139 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_176158 - OBJ
      ?auto_176157 - LOCATION
    )
    :vars
    (
      ?auto_176159 - TRUCK
      ?auto_176160 - LOCATION
      ?auto_176161 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_176158 ?auto_176159 ) ( TRUCK-AT ?auto_176159 ?auto_176160 ) ( IN-CITY ?auto_176160 ?auto_176161 ) ( IN-CITY ?auto_176157 ?auto_176161 ) ( not ( = ?auto_176157 ?auto_176160 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_176159 ?auto_176160 ?auto_176157 ?auto_176161 )
      ( DELIVER-1PKG ?auto_176158 ?auto_176157 )
      ( DELIVER-1PKG-VERIFY ?auto_176158 ?auto_176157 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_176184 - OBJ
      ?auto_176183 - LOCATION
    )
    :vars
    (
      ?auto_176187 - TRUCK
      ?auto_176185 - LOCATION
      ?auto_176186 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_176187 ?auto_176185 ) ( IN-CITY ?auto_176185 ?auto_176186 ) ( IN-CITY ?auto_176183 ?auto_176186 ) ( not ( = ?auto_176183 ?auto_176185 ) ) ( OBJ-AT ?auto_176184 ?auto_176185 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_176184 ?auto_176187 ?auto_176185 )
      ( DELIVER-1PKG ?auto_176184 ?auto_176183 )
      ( DELIVER-1PKG-VERIFY ?auto_176184 ?auto_176183 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_176210 - OBJ
      ?auto_176209 - LOCATION
    )
    :vars
    (
      ?auto_176212 - LOCATION
      ?auto_176213 - CITY
      ?auto_176211 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_176212 ?auto_176213 ) ( IN-CITY ?auto_176209 ?auto_176213 ) ( not ( = ?auto_176209 ?auto_176212 ) ) ( OBJ-AT ?auto_176210 ?auto_176212 ) ( TRUCK-AT ?auto_176211 ?auto_176209 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_176211 ?auto_176209 ?auto_176212 ?auto_176213 )
      ( DELIVER-1PKG ?auto_176210 ?auto_176209 )
      ( DELIVER-1PKG-VERIFY ?auto_176210 ?auto_176209 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_176353 - OBJ
      ?auto_176354 - OBJ
      ?auto_176352 - LOCATION
    )
    :vars
    (
      ?auto_176355 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_176355 ?auto_176352 ) ( IN-TRUCK ?auto_176354 ?auto_176355 ) ( OBJ-AT ?auto_176353 ?auto_176352 ) ( not ( = ?auto_176353 ?auto_176354 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_176354 ?auto_176352 )
      ( DELIVER-2PKG-VERIFY ?auto_176353 ?auto_176354 ?auto_176352 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_176357 - OBJ
      ?auto_176358 - OBJ
      ?auto_176356 - LOCATION
    )
    :vars
    (
      ?auto_176359 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_176359 ?auto_176356 ) ( IN-TRUCK ?auto_176357 ?auto_176359 ) ( OBJ-AT ?auto_176358 ?auto_176356 ) ( not ( = ?auto_176357 ?auto_176358 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_176357 ?auto_176356 )
      ( DELIVER-2PKG-VERIFY ?auto_176357 ?auto_176358 ?auto_176356 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_176365 - OBJ
      ?auto_176366 - OBJ
      ?auto_176367 - OBJ
      ?auto_176364 - LOCATION
    )
    :vars
    (
      ?auto_176368 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_176368 ?auto_176364 ) ( IN-TRUCK ?auto_176367 ?auto_176368 ) ( OBJ-AT ?auto_176365 ?auto_176364 ) ( OBJ-AT ?auto_176366 ?auto_176364 ) ( not ( = ?auto_176365 ?auto_176366 ) ) ( not ( = ?auto_176365 ?auto_176367 ) ) ( not ( = ?auto_176366 ?auto_176367 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_176367 ?auto_176364 )
      ( DELIVER-3PKG-VERIFY ?auto_176365 ?auto_176366 ?auto_176367 ?auto_176364 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_176370 - OBJ
      ?auto_176371 - OBJ
      ?auto_176372 - OBJ
      ?auto_176369 - LOCATION
    )
    :vars
    (
      ?auto_176373 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_176373 ?auto_176369 ) ( IN-TRUCK ?auto_176371 ?auto_176373 ) ( OBJ-AT ?auto_176370 ?auto_176369 ) ( OBJ-AT ?auto_176372 ?auto_176369 ) ( not ( = ?auto_176370 ?auto_176371 ) ) ( not ( = ?auto_176370 ?auto_176372 ) ) ( not ( = ?auto_176371 ?auto_176372 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_176371 ?auto_176369 )
      ( DELIVER-3PKG-VERIFY ?auto_176370 ?auto_176371 ?auto_176372 ?auto_176369 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_176380 - OBJ
      ?auto_176381 - OBJ
      ?auto_176382 - OBJ
      ?auto_176379 - LOCATION
    )
    :vars
    (
      ?auto_176383 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_176383 ?auto_176379 ) ( IN-TRUCK ?auto_176380 ?auto_176383 ) ( OBJ-AT ?auto_176381 ?auto_176379 ) ( OBJ-AT ?auto_176382 ?auto_176379 ) ( not ( = ?auto_176380 ?auto_176381 ) ) ( not ( = ?auto_176380 ?auto_176382 ) ) ( not ( = ?auto_176381 ?auto_176382 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_176380 ?auto_176379 )
      ( DELIVER-3PKG-VERIFY ?auto_176380 ?auto_176381 ?auto_176382 ?auto_176379 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_176400 - OBJ
      ?auto_176401 - OBJ
      ?auto_176403 - OBJ
      ?auto_176402 - OBJ
      ?auto_176399 - LOCATION
    )
    :vars
    (
      ?auto_176404 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_176404 ?auto_176399 ) ( IN-TRUCK ?auto_176402 ?auto_176404 ) ( OBJ-AT ?auto_176400 ?auto_176399 ) ( OBJ-AT ?auto_176401 ?auto_176399 ) ( OBJ-AT ?auto_176403 ?auto_176399 ) ( not ( = ?auto_176400 ?auto_176401 ) ) ( not ( = ?auto_176400 ?auto_176403 ) ) ( not ( = ?auto_176400 ?auto_176402 ) ) ( not ( = ?auto_176401 ?auto_176403 ) ) ( not ( = ?auto_176401 ?auto_176402 ) ) ( not ( = ?auto_176403 ?auto_176402 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_176402 ?auto_176399 )
      ( DELIVER-4PKG-VERIFY ?auto_176400 ?auto_176401 ?auto_176403 ?auto_176402 ?auto_176399 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_176406 - OBJ
      ?auto_176407 - OBJ
      ?auto_176409 - OBJ
      ?auto_176408 - OBJ
      ?auto_176405 - LOCATION
    )
    :vars
    (
      ?auto_176410 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_176410 ?auto_176405 ) ( IN-TRUCK ?auto_176409 ?auto_176410 ) ( OBJ-AT ?auto_176406 ?auto_176405 ) ( OBJ-AT ?auto_176407 ?auto_176405 ) ( OBJ-AT ?auto_176408 ?auto_176405 ) ( not ( = ?auto_176406 ?auto_176407 ) ) ( not ( = ?auto_176406 ?auto_176409 ) ) ( not ( = ?auto_176406 ?auto_176408 ) ) ( not ( = ?auto_176407 ?auto_176409 ) ) ( not ( = ?auto_176407 ?auto_176408 ) ) ( not ( = ?auto_176409 ?auto_176408 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_176409 ?auto_176405 )
      ( DELIVER-4PKG-VERIFY ?auto_176406 ?auto_176407 ?auto_176409 ?auto_176408 ?auto_176405 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_176418 - OBJ
      ?auto_176419 - OBJ
      ?auto_176421 - OBJ
      ?auto_176420 - OBJ
      ?auto_176417 - LOCATION
    )
    :vars
    (
      ?auto_176422 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_176422 ?auto_176417 ) ( IN-TRUCK ?auto_176419 ?auto_176422 ) ( OBJ-AT ?auto_176418 ?auto_176417 ) ( OBJ-AT ?auto_176421 ?auto_176417 ) ( OBJ-AT ?auto_176420 ?auto_176417 ) ( not ( = ?auto_176418 ?auto_176419 ) ) ( not ( = ?auto_176418 ?auto_176421 ) ) ( not ( = ?auto_176418 ?auto_176420 ) ) ( not ( = ?auto_176419 ?auto_176421 ) ) ( not ( = ?auto_176419 ?auto_176420 ) ) ( not ( = ?auto_176421 ?auto_176420 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_176419 ?auto_176417 )
      ( DELIVER-4PKG-VERIFY ?auto_176418 ?auto_176419 ?auto_176421 ?auto_176420 ?auto_176417 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_176442 - OBJ
      ?auto_176443 - OBJ
      ?auto_176445 - OBJ
      ?auto_176444 - OBJ
      ?auto_176441 - LOCATION
    )
    :vars
    (
      ?auto_176446 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_176446 ?auto_176441 ) ( IN-TRUCK ?auto_176442 ?auto_176446 ) ( OBJ-AT ?auto_176443 ?auto_176441 ) ( OBJ-AT ?auto_176445 ?auto_176441 ) ( OBJ-AT ?auto_176444 ?auto_176441 ) ( not ( = ?auto_176442 ?auto_176443 ) ) ( not ( = ?auto_176442 ?auto_176445 ) ) ( not ( = ?auto_176442 ?auto_176444 ) ) ( not ( = ?auto_176443 ?auto_176445 ) ) ( not ( = ?auto_176443 ?auto_176444 ) ) ( not ( = ?auto_176445 ?auto_176444 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_176442 ?auto_176441 )
      ( DELIVER-4PKG-VERIFY ?auto_176442 ?auto_176443 ?auto_176445 ?auto_176444 ?auto_176441 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_176495 - OBJ
      ?auto_176496 - OBJ
      ?auto_176494 - LOCATION
    )
    :vars
    (
      ?auto_176497 - TRUCK
      ?auto_176498 - LOCATION
      ?auto_176499 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_176496 ?auto_176497 ) ( TRUCK-AT ?auto_176497 ?auto_176498 ) ( IN-CITY ?auto_176498 ?auto_176499 ) ( IN-CITY ?auto_176494 ?auto_176499 ) ( not ( = ?auto_176494 ?auto_176498 ) ) ( OBJ-AT ?auto_176495 ?auto_176494 ) ( not ( = ?auto_176495 ?auto_176496 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_176496 ?auto_176494 )
      ( DELIVER-2PKG-VERIFY ?auto_176495 ?auto_176496 ?auto_176494 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_176501 - OBJ
      ?auto_176502 - OBJ
      ?auto_176500 - LOCATION
    )
    :vars
    (
      ?auto_176503 - TRUCK
      ?auto_176504 - LOCATION
      ?auto_176505 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_176501 ?auto_176503 ) ( TRUCK-AT ?auto_176503 ?auto_176504 ) ( IN-CITY ?auto_176504 ?auto_176505 ) ( IN-CITY ?auto_176500 ?auto_176505 ) ( not ( = ?auto_176500 ?auto_176504 ) ) ( OBJ-AT ?auto_176502 ?auto_176500 ) ( not ( = ?auto_176502 ?auto_176501 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_176502 ?auto_176501 ?auto_176500 )
      ( DELIVER-2PKG-VERIFY ?auto_176501 ?auto_176502 ?auto_176500 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_176514 - OBJ
      ?auto_176515 - OBJ
      ?auto_176516 - OBJ
      ?auto_176513 - LOCATION
    )
    :vars
    (
      ?auto_176517 - TRUCK
      ?auto_176518 - LOCATION
      ?auto_176519 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_176516 ?auto_176517 ) ( TRUCK-AT ?auto_176517 ?auto_176518 ) ( IN-CITY ?auto_176518 ?auto_176519 ) ( IN-CITY ?auto_176513 ?auto_176519 ) ( not ( = ?auto_176513 ?auto_176518 ) ) ( OBJ-AT ?auto_176515 ?auto_176513 ) ( not ( = ?auto_176515 ?auto_176516 ) ) ( OBJ-AT ?auto_176514 ?auto_176513 ) ( not ( = ?auto_176514 ?auto_176515 ) ) ( not ( = ?auto_176514 ?auto_176516 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_176515 ?auto_176516 ?auto_176513 )
      ( DELIVER-3PKG-VERIFY ?auto_176514 ?auto_176515 ?auto_176516 ?auto_176513 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_176521 - OBJ
      ?auto_176522 - OBJ
      ?auto_176523 - OBJ
      ?auto_176520 - LOCATION
    )
    :vars
    (
      ?auto_176524 - TRUCK
      ?auto_176525 - LOCATION
      ?auto_176526 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_176522 ?auto_176524 ) ( TRUCK-AT ?auto_176524 ?auto_176525 ) ( IN-CITY ?auto_176525 ?auto_176526 ) ( IN-CITY ?auto_176520 ?auto_176526 ) ( not ( = ?auto_176520 ?auto_176525 ) ) ( OBJ-AT ?auto_176523 ?auto_176520 ) ( not ( = ?auto_176523 ?auto_176522 ) ) ( OBJ-AT ?auto_176521 ?auto_176520 ) ( not ( = ?auto_176521 ?auto_176522 ) ) ( not ( = ?auto_176521 ?auto_176523 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_176523 ?auto_176522 ?auto_176520 )
      ( DELIVER-3PKG-VERIFY ?auto_176521 ?auto_176522 ?auto_176523 ?auto_176520 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_176535 - OBJ
      ?auto_176536 - OBJ
      ?auto_176537 - OBJ
      ?auto_176534 - LOCATION
    )
    :vars
    (
      ?auto_176538 - TRUCK
      ?auto_176539 - LOCATION
      ?auto_176540 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_176535 ?auto_176538 ) ( TRUCK-AT ?auto_176538 ?auto_176539 ) ( IN-CITY ?auto_176539 ?auto_176540 ) ( IN-CITY ?auto_176534 ?auto_176540 ) ( not ( = ?auto_176534 ?auto_176539 ) ) ( OBJ-AT ?auto_176537 ?auto_176534 ) ( not ( = ?auto_176537 ?auto_176535 ) ) ( OBJ-AT ?auto_176536 ?auto_176534 ) ( not ( = ?auto_176535 ?auto_176536 ) ) ( not ( = ?auto_176536 ?auto_176537 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_176537 ?auto_176535 ?auto_176534 )
      ( DELIVER-3PKG-VERIFY ?auto_176535 ?auto_176536 ?auto_176537 ?auto_176534 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_176564 - OBJ
      ?auto_176565 - OBJ
      ?auto_176567 - OBJ
      ?auto_176566 - OBJ
      ?auto_176563 - LOCATION
    )
    :vars
    (
      ?auto_176568 - TRUCK
      ?auto_176569 - LOCATION
      ?auto_176570 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_176566 ?auto_176568 ) ( TRUCK-AT ?auto_176568 ?auto_176569 ) ( IN-CITY ?auto_176569 ?auto_176570 ) ( IN-CITY ?auto_176563 ?auto_176570 ) ( not ( = ?auto_176563 ?auto_176569 ) ) ( OBJ-AT ?auto_176567 ?auto_176563 ) ( not ( = ?auto_176567 ?auto_176566 ) ) ( OBJ-AT ?auto_176564 ?auto_176563 ) ( OBJ-AT ?auto_176565 ?auto_176563 ) ( not ( = ?auto_176564 ?auto_176565 ) ) ( not ( = ?auto_176564 ?auto_176567 ) ) ( not ( = ?auto_176564 ?auto_176566 ) ) ( not ( = ?auto_176565 ?auto_176567 ) ) ( not ( = ?auto_176565 ?auto_176566 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_176567 ?auto_176566 ?auto_176563 )
      ( DELIVER-4PKG-VERIFY ?auto_176564 ?auto_176565 ?auto_176567 ?auto_176566 ?auto_176563 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_176572 - OBJ
      ?auto_176573 - OBJ
      ?auto_176575 - OBJ
      ?auto_176574 - OBJ
      ?auto_176571 - LOCATION
    )
    :vars
    (
      ?auto_176576 - TRUCK
      ?auto_176577 - LOCATION
      ?auto_176578 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_176575 ?auto_176576 ) ( TRUCK-AT ?auto_176576 ?auto_176577 ) ( IN-CITY ?auto_176577 ?auto_176578 ) ( IN-CITY ?auto_176571 ?auto_176578 ) ( not ( = ?auto_176571 ?auto_176577 ) ) ( OBJ-AT ?auto_176574 ?auto_176571 ) ( not ( = ?auto_176574 ?auto_176575 ) ) ( OBJ-AT ?auto_176572 ?auto_176571 ) ( OBJ-AT ?auto_176573 ?auto_176571 ) ( not ( = ?auto_176572 ?auto_176573 ) ) ( not ( = ?auto_176572 ?auto_176575 ) ) ( not ( = ?auto_176572 ?auto_176574 ) ) ( not ( = ?auto_176573 ?auto_176575 ) ) ( not ( = ?auto_176573 ?auto_176574 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_176574 ?auto_176575 ?auto_176571 )
      ( DELIVER-4PKG-VERIFY ?auto_176572 ?auto_176573 ?auto_176575 ?auto_176574 ?auto_176571 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_176588 - OBJ
      ?auto_176589 - OBJ
      ?auto_176591 - OBJ
      ?auto_176590 - OBJ
      ?auto_176587 - LOCATION
    )
    :vars
    (
      ?auto_176592 - TRUCK
      ?auto_176593 - LOCATION
      ?auto_176594 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_176589 ?auto_176592 ) ( TRUCK-AT ?auto_176592 ?auto_176593 ) ( IN-CITY ?auto_176593 ?auto_176594 ) ( IN-CITY ?auto_176587 ?auto_176594 ) ( not ( = ?auto_176587 ?auto_176593 ) ) ( OBJ-AT ?auto_176591 ?auto_176587 ) ( not ( = ?auto_176591 ?auto_176589 ) ) ( OBJ-AT ?auto_176588 ?auto_176587 ) ( OBJ-AT ?auto_176590 ?auto_176587 ) ( not ( = ?auto_176588 ?auto_176589 ) ) ( not ( = ?auto_176588 ?auto_176591 ) ) ( not ( = ?auto_176588 ?auto_176590 ) ) ( not ( = ?auto_176589 ?auto_176590 ) ) ( not ( = ?auto_176591 ?auto_176590 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_176591 ?auto_176589 ?auto_176587 )
      ( DELIVER-4PKG-VERIFY ?auto_176588 ?auto_176589 ?auto_176591 ?auto_176590 ?auto_176587 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_176620 - OBJ
      ?auto_176621 - OBJ
      ?auto_176623 - OBJ
      ?auto_176622 - OBJ
      ?auto_176619 - LOCATION
    )
    :vars
    (
      ?auto_176624 - TRUCK
      ?auto_176625 - LOCATION
      ?auto_176626 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_176620 ?auto_176624 ) ( TRUCK-AT ?auto_176624 ?auto_176625 ) ( IN-CITY ?auto_176625 ?auto_176626 ) ( IN-CITY ?auto_176619 ?auto_176626 ) ( not ( = ?auto_176619 ?auto_176625 ) ) ( OBJ-AT ?auto_176623 ?auto_176619 ) ( not ( = ?auto_176623 ?auto_176620 ) ) ( OBJ-AT ?auto_176621 ?auto_176619 ) ( OBJ-AT ?auto_176622 ?auto_176619 ) ( not ( = ?auto_176620 ?auto_176621 ) ) ( not ( = ?auto_176620 ?auto_176622 ) ) ( not ( = ?auto_176621 ?auto_176623 ) ) ( not ( = ?auto_176621 ?auto_176622 ) ) ( not ( = ?auto_176623 ?auto_176622 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_176623 ?auto_176620 ?auto_176619 )
      ( DELIVER-4PKG-VERIFY ?auto_176620 ?auto_176621 ?auto_176623 ?auto_176622 ?auto_176619 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_176685 - OBJ
      ?auto_176684 - LOCATION
    )
    :vars
    (
      ?auto_176686 - TRUCK
      ?auto_176687 - LOCATION
      ?auto_176688 - CITY
      ?auto_176689 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_176686 ?auto_176687 ) ( IN-CITY ?auto_176687 ?auto_176688 ) ( IN-CITY ?auto_176684 ?auto_176688 ) ( not ( = ?auto_176684 ?auto_176687 ) ) ( OBJ-AT ?auto_176689 ?auto_176684 ) ( not ( = ?auto_176689 ?auto_176685 ) ) ( OBJ-AT ?auto_176685 ?auto_176687 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_176685 ?auto_176686 ?auto_176687 )
      ( DELIVER-2PKG ?auto_176689 ?auto_176685 ?auto_176684 )
      ( DELIVER-1PKG-VERIFY ?auto_176685 ?auto_176684 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_176691 - OBJ
      ?auto_176692 - OBJ
      ?auto_176690 - LOCATION
    )
    :vars
    (
      ?auto_176694 - TRUCK
      ?auto_176695 - LOCATION
      ?auto_176693 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_176694 ?auto_176695 ) ( IN-CITY ?auto_176695 ?auto_176693 ) ( IN-CITY ?auto_176690 ?auto_176693 ) ( not ( = ?auto_176690 ?auto_176695 ) ) ( OBJ-AT ?auto_176691 ?auto_176690 ) ( not ( = ?auto_176691 ?auto_176692 ) ) ( OBJ-AT ?auto_176692 ?auto_176695 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_176692 ?auto_176690 )
      ( DELIVER-2PKG-VERIFY ?auto_176691 ?auto_176692 ?auto_176690 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_176697 - OBJ
      ?auto_176698 - OBJ
      ?auto_176696 - LOCATION
    )
    :vars
    (
      ?auto_176700 - TRUCK
      ?auto_176701 - LOCATION
      ?auto_176699 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_176700 ?auto_176701 ) ( IN-CITY ?auto_176701 ?auto_176699 ) ( IN-CITY ?auto_176696 ?auto_176699 ) ( not ( = ?auto_176696 ?auto_176701 ) ) ( OBJ-AT ?auto_176698 ?auto_176696 ) ( not ( = ?auto_176698 ?auto_176697 ) ) ( OBJ-AT ?auto_176697 ?auto_176701 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_176698 ?auto_176697 ?auto_176696 )
      ( DELIVER-2PKG-VERIFY ?auto_176697 ?auto_176698 ?auto_176696 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_176710 - OBJ
      ?auto_176711 - OBJ
      ?auto_176712 - OBJ
      ?auto_176709 - LOCATION
    )
    :vars
    (
      ?auto_176714 - TRUCK
      ?auto_176715 - LOCATION
      ?auto_176713 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_176714 ?auto_176715 ) ( IN-CITY ?auto_176715 ?auto_176713 ) ( IN-CITY ?auto_176709 ?auto_176713 ) ( not ( = ?auto_176709 ?auto_176715 ) ) ( OBJ-AT ?auto_176710 ?auto_176709 ) ( not ( = ?auto_176710 ?auto_176712 ) ) ( OBJ-AT ?auto_176712 ?auto_176715 ) ( OBJ-AT ?auto_176711 ?auto_176709 ) ( not ( = ?auto_176710 ?auto_176711 ) ) ( not ( = ?auto_176711 ?auto_176712 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_176710 ?auto_176712 ?auto_176709 )
      ( DELIVER-3PKG-VERIFY ?auto_176710 ?auto_176711 ?auto_176712 ?auto_176709 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_176717 - OBJ
      ?auto_176718 - OBJ
      ?auto_176719 - OBJ
      ?auto_176716 - LOCATION
    )
    :vars
    (
      ?auto_176721 - TRUCK
      ?auto_176722 - LOCATION
      ?auto_176720 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_176721 ?auto_176722 ) ( IN-CITY ?auto_176722 ?auto_176720 ) ( IN-CITY ?auto_176716 ?auto_176720 ) ( not ( = ?auto_176716 ?auto_176722 ) ) ( OBJ-AT ?auto_176719 ?auto_176716 ) ( not ( = ?auto_176719 ?auto_176718 ) ) ( OBJ-AT ?auto_176718 ?auto_176722 ) ( OBJ-AT ?auto_176717 ?auto_176716 ) ( not ( = ?auto_176717 ?auto_176718 ) ) ( not ( = ?auto_176717 ?auto_176719 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_176719 ?auto_176718 ?auto_176716 )
      ( DELIVER-3PKG-VERIFY ?auto_176717 ?auto_176718 ?auto_176719 ?auto_176716 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_176731 - OBJ
      ?auto_176732 - OBJ
      ?auto_176733 - OBJ
      ?auto_176730 - LOCATION
    )
    :vars
    (
      ?auto_176735 - TRUCK
      ?auto_176736 - LOCATION
      ?auto_176734 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_176735 ?auto_176736 ) ( IN-CITY ?auto_176736 ?auto_176734 ) ( IN-CITY ?auto_176730 ?auto_176734 ) ( not ( = ?auto_176730 ?auto_176736 ) ) ( OBJ-AT ?auto_176732 ?auto_176730 ) ( not ( = ?auto_176732 ?auto_176731 ) ) ( OBJ-AT ?auto_176731 ?auto_176736 ) ( OBJ-AT ?auto_176733 ?auto_176730 ) ( not ( = ?auto_176731 ?auto_176733 ) ) ( not ( = ?auto_176732 ?auto_176733 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_176732 ?auto_176731 ?auto_176730 )
      ( DELIVER-3PKG-VERIFY ?auto_176731 ?auto_176732 ?auto_176733 ?auto_176730 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_176760 - OBJ
      ?auto_176761 - OBJ
      ?auto_176763 - OBJ
      ?auto_176762 - OBJ
      ?auto_176759 - LOCATION
    )
    :vars
    (
      ?auto_176765 - TRUCK
      ?auto_176766 - LOCATION
      ?auto_176764 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_176765 ?auto_176766 ) ( IN-CITY ?auto_176766 ?auto_176764 ) ( IN-CITY ?auto_176759 ?auto_176764 ) ( not ( = ?auto_176759 ?auto_176766 ) ) ( OBJ-AT ?auto_176763 ?auto_176759 ) ( not ( = ?auto_176763 ?auto_176762 ) ) ( OBJ-AT ?auto_176762 ?auto_176766 ) ( OBJ-AT ?auto_176760 ?auto_176759 ) ( OBJ-AT ?auto_176761 ?auto_176759 ) ( not ( = ?auto_176760 ?auto_176761 ) ) ( not ( = ?auto_176760 ?auto_176763 ) ) ( not ( = ?auto_176760 ?auto_176762 ) ) ( not ( = ?auto_176761 ?auto_176763 ) ) ( not ( = ?auto_176761 ?auto_176762 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_176763 ?auto_176762 ?auto_176759 )
      ( DELIVER-4PKG-VERIFY ?auto_176760 ?auto_176761 ?auto_176763 ?auto_176762 ?auto_176759 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_176768 - OBJ
      ?auto_176769 - OBJ
      ?auto_176771 - OBJ
      ?auto_176770 - OBJ
      ?auto_176767 - LOCATION
    )
    :vars
    (
      ?auto_176773 - TRUCK
      ?auto_176774 - LOCATION
      ?auto_176772 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_176773 ?auto_176774 ) ( IN-CITY ?auto_176774 ?auto_176772 ) ( IN-CITY ?auto_176767 ?auto_176772 ) ( not ( = ?auto_176767 ?auto_176774 ) ) ( OBJ-AT ?auto_176770 ?auto_176767 ) ( not ( = ?auto_176770 ?auto_176771 ) ) ( OBJ-AT ?auto_176771 ?auto_176774 ) ( OBJ-AT ?auto_176768 ?auto_176767 ) ( OBJ-AT ?auto_176769 ?auto_176767 ) ( not ( = ?auto_176768 ?auto_176769 ) ) ( not ( = ?auto_176768 ?auto_176771 ) ) ( not ( = ?auto_176768 ?auto_176770 ) ) ( not ( = ?auto_176769 ?auto_176771 ) ) ( not ( = ?auto_176769 ?auto_176770 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_176770 ?auto_176771 ?auto_176767 )
      ( DELIVER-4PKG-VERIFY ?auto_176768 ?auto_176769 ?auto_176771 ?auto_176770 ?auto_176767 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_176784 - OBJ
      ?auto_176785 - OBJ
      ?auto_176787 - OBJ
      ?auto_176786 - OBJ
      ?auto_176783 - LOCATION
    )
    :vars
    (
      ?auto_176789 - TRUCK
      ?auto_176790 - LOCATION
      ?auto_176788 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_176789 ?auto_176790 ) ( IN-CITY ?auto_176790 ?auto_176788 ) ( IN-CITY ?auto_176783 ?auto_176788 ) ( not ( = ?auto_176783 ?auto_176790 ) ) ( OBJ-AT ?auto_176787 ?auto_176783 ) ( not ( = ?auto_176787 ?auto_176785 ) ) ( OBJ-AT ?auto_176785 ?auto_176790 ) ( OBJ-AT ?auto_176784 ?auto_176783 ) ( OBJ-AT ?auto_176786 ?auto_176783 ) ( not ( = ?auto_176784 ?auto_176785 ) ) ( not ( = ?auto_176784 ?auto_176787 ) ) ( not ( = ?auto_176784 ?auto_176786 ) ) ( not ( = ?auto_176785 ?auto_176786 ) ) ( not ( = ?auto_176787 ?auto_176786 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_176787 ?auto_176785 ?auto_176783 )
      ( DELIVER-4PKG-VERIFY ?auto_176784 ?auto_176785 ?auto_176787 ?auto_176786 ?auto_176783 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_176816 - OBJ
      ?auto_176817 - OBJ
      ?auto_176819 - OBJ
      ?auto_176818 - OBJ
      ?auto_176815 - LOCATION
    )
    :vars
    (
      ?auto_176821 - TRUCK
      ?auto_176822 - LOCATION
      ?auto_176820 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_176821 ?auto_176822 ) ( IN-CITY ?auto_176822 ?auto_176820 ) ( IN-CITY ?auto_176815 ?auto_176820 ) ( not ( = ?auto_176815 ?auto_176822 ) ) ( OBJ-AT ?auto_176818 ?auto_176815 ) ( not ( = ?auto_176818 ?auto_176816 ) ) ( OBJ-AT ?auto_176816 ?auto_176822 ) ( OBJ-AT ?auto_176817 ?auto_176815 ) ( OBJ-AT ?auto_176819 ?auto_176815 ) ( not ( = ?auto_176816 ?auto_176817 ) ) ( not ( = ?auto_176816 ?auto_176819 ) ) ( not ( = ?auto_176817 ?auto_176819 ) ) ( not ( = ?auto_176817 ?auto_176818 ) ) ( not ( = ?auto_176819 ?auto_176818 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_176818 ?auto_176816 ?auto_176815 )
      ( DELIVER-4PKG-VERIFY ?auto_176816 ?auto_176817 ?auto_176819 ?auto_176818 ?auto_176815 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_176881 - OBJ
      ?auto_176880 - LOCATION
    )
    :vars
    (
      ?auto_176884 - LOCATION
      ?auto_176882 - CITY
      ?auto_176885 - OBJ
      ?auto_176883 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_176884 ?auto_176882 ) ( IN-CITY ?auto_176880 ?auto_176882 ) ( not ( = ?auto_176880 ?auto_176884 ) ) ( OBJ-AT ?auto_176885 ?auto_176880 ) ( not ( = ?auto_176885 ?auto_176881 ) ) ( OBJ-AT ?auto_176881 ?auto_176884 ) ( TRUCK-AT ?auto_176883 ?auto_176880 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_176883 ?auto_176880 ?auto_176884 ?auto_176882 )
      ( DELIVER-2PKG ?auto_176885 ?auto_176881 ?auto_176880 )
      ( DELIVER-1PKG-VERIFY ?auto_176881 ?auto_176880 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_176887 - OBJ
      ?auto_176888 - OBJ
      ?auto_176886 - LOCATION
    )
    :vars
    (
      ?auto_176891 - LOCATION
      ?auto_176890 - CITY
      ?auto_176889 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_176891 ?auto_176890 ) ( IN-CITY ?auto_176886 ?auto_176890 ) ( not ( = ?auto_176886 ?auto_176891 ) ) ( OBJ-AT ?auto_176887 ?auto_176886 ) ( not ( = ?auto_176887 ?auto_176888 ) ) ( OBJ-AT ?auto_176888 ?auto_176891 ) ( TRUCK-AT ?auto_176889 ?auto_176886 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_176888 ?auto_176886 )
      ( DELIVER-2PKG-VERIFY ?auto_176887 ?auto_176888 ?auto_176886 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_176893 - OBJ
      ?auto_176894 - OBJ
      ?auto_176892 - LOCATION
    )
    :vars
    (
      ?auto_176897 - LOCATION
      ?auto_176895 - CITY
      ?auto_176896 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_176897 ?auto_176895 ) ( IN-CITY ?auto_176892 ?auto_176895 ) ( not ( = ?auto_176892 ?auto_176897 ) ) ( OBJ-AT ?auto_176894 ?auto_176892 ) ( not ( = ?auto_176894 ?auto_176893 ) ) ( OBJ-AT ?auto_176893 ?auto_176897 ) ( TRUCK-AT ?auto_176896 ?auto_176892 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_176894 ?auto_176893 ?auto_176892 )
      ( DELIVER-2PKG-VERIFY ?auto_176893 ?auto_176894 ?auto_176892 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_176906 - OBJ
      ?auto_176907 - OBJ
      ?auto_176908 - OBJ
      ?auto_176905 - LOCATION
    )
    :vars
    (
      ?auto_176911 - LOCATION
      ?auto_176909 - CITY
      ?auto_176910 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_176911 ?auto_176909 ) ( IN-CITY ?auto_176905 ?auto_176909 ) ( not ( = ?auto_176905 ?auto_176911 ) ) ( OBJ-AT ?auto_176907 ?auto_176905 ) ( not ( = ?auto_176907 ?auto_176908 ) ) ( OBJ-AT ?auto_176908 ?auto_176911 ) ( TRUCK-AT ?auto_176910 ?auto_176905 ) ( OBJ-AT ?auto_176906 ?auto_176905 ) ( not ( = ?auto_176906 ?auto_176907 ) ) ( not ( = ?auto_176906 ?auto_176908 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_176907 ?auto_176908 ?auto_176905 )
      ( DELIVER-3PKG-VERIFY ?auto_176906 ?auto_176907 ?auto_176908 ?auto_176905 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_176913 - OBJ
      ?auto_176914 - OBJ
      ?auto_176915 - OBJ
      ?auto_176912 - LOCATION
    )
    :vars
    (
      ?auto_176918 - LOCATION
      ?auto_176916 - CITY
      ?auto_176917 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_176918 ?auto_176916 ) ( IN-CITY ?auto_176912 ?auto_176916 ) ( not ( = ?auto_176912 ?auto_176918 ) ) ( OBJ-AT ?auto_176913 ?auto_176912 ) ( not ( = ?auto_176913 ?auto_176914 ) ) ( OBJ-AT ?auto_176914 ?auto_176918 ) ( TRUCK-AT ?auto_176917 ?auto_176912 ) ( OBJ-AT ?auto_176915 ?auto_176912 ) ( not ( = ?auto_176913 ?auto_176915 ) ) ( not ( = ?auto_176914 ?auto_176915 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_176913 ?auto_176914 ?auto_176912 )
      ( DELIVER-3PKG-VERIFY ?auto_176913 ?auto_176914 ?auto_176915 ?auto_176912 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_176927 - OBJ
      ?auto_176928 - OBJ
      ?auto_176929 - OBJ
      ?auto_176926 - LOCATION
    )
    :vars
    (
      ?auto_176932 - LOCATION
      ?auto_176930 - CITY
      ?auto_176931 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_176932 ?auto_176930 ) ( IN-CITY ?auto_176926 ?auto_176930 ) ( not ( = ?auto_176926 ?auto_176932 ) ) ( OBJ-AT ?auto_176928 ?auto_176926 ) ( not ( = ?auto_176928 ?auto_176927 ) ) ( OBJ-AT ?auto_176927 ?auto_176932 ) ( TRUCK-AT ?auto_176931 ?auto_176926 ) ( OBJ-AT ?auto_176929 ?auto_176926 ) ( not ( = ?auto_176927 ?auto_176929 ) ) ( not ( = ?auto_176928 ?auto_176929 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_176928 ?auto_176927 ?auto_176926 )
      ( DELIVER-3PKG-VERIFY ?auto_176927 ?auto_176928 ?auto_176929 ?auto_176926 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_176956 - OBJ
      ?auto_176957 - OBJ
      ?auto_176959 - OBJ
      ?auto_176958 - OBJ
      ?auto_176955 - LOCATION
    )
    :vars
    (
      ?auto_176962 - LOCATION
      ?auto_176960 - CITY
      ?auto_176961 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_176962 ?auto_176960 ) ( IN-CITY ?auto_176955 ?auto_176960 ) ( not ( = ?auto_176955 ?auto_176962 ) ) ( OBJ-AT ?auto_176956 ?auto_176955 ) ( not ( = ?auto_176956 ?auto_176958 ) ) ( OBJ-AT ?auto_176958 ?auto_176962 ) ( TRUCK-AT ?auto_176961 ?auto_176955 ) ( OBJ-AT ?auto_176957 ?auto_176955 ) ( OBJ-AT ?auto_176959 ?auto_176955 ) ( not ( = ?auto_176956 ?auto_176957 ) ) ( not ( = ?auto_176956 ?auto_176959 ) ) ( not ( = ?auto_176957 ?auto_176959 ) ) ( not ( = ?auto_176957 ?auto_176958 ) ) ( not ( = ?auto_176959 ?auto_176958 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_176956 ?auto_176958 ?auto_176955 )
      ( DELIVER-4PKG-VERIFY ?auto_176956 ?auto_176957 ?auto_176959 ?auto_176958 ?auto_176955 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_176964 - OBJ
      ?auto_176965 - OBJ
      ?auto_176967 - OBJ
      ?auto_176966 - OBJ
      ?auto_176963 - LOCATION
    )
    :vars
    (
      ?auto_176970 - LOCATION
      ?auto_176968 - CITY
      ?auto_176969 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_176970 ?auto_176968 ) ( IN-CITY ?auto_176963 ?auto_176968 ) ( not ( = ?auto_176963 ?auto_176970 ) ) ( OBJ-AT ?auto_176966 ?auto_176963 ) ( not ( = ?auto_176966 ?auto_176967 ) ) ( OBJ-AT ?auto_176967 ?auto_176970 ) ( TRUCK-AT ?auto_176969 ?auto_176963 ) ( OBJ-AT ?auto_176964 ?auto_176963 ) ( OBJ-AT ?auto_176965 ?auto_176963 ) ( not ( = ?auto_176964 ?auto_176965 ) ) ( not ( = ?auto_176964 ?auto_176967 ) ) ( not ( = ?auto_176964 ?auto_176966 ) ) ( not ( = ?auto_176965 ?auto_176967 ) ) ( not ( = ?auto_176965 ?auto_176966 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_176966 ?auto_176967 ?auto_176963 )
      ( DELIVER-4PKG-VERIFY ?auto_176964 ?auto_176965 ?auto_176967 ?auto_176966 ?auto_176963 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_176980 - OBJ
      ?auto_176981 - OBJ
      ?auto_176983 - OBJ
      ?auto_176982 - OBJ
      ?auto_176979 - LOCATION
    )
    :vars
    (
      ?auto_176986 - LOCATION
      ?auto_176984 - CITY
      ?auto_176985 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_176986 ?auto_176984 ) ( IN-CITY ?auto_176979 ?auto_176984 ) ( not ( = ?auto_176979 ?auto_176986 ) ) ( OBJ-AT ?auto_176982 ?auto_176979 ) ( not ( = ?auto_176982 ?auto_176981 ) ) ( OBJ-AT ?auto_176981 ?auto_176986 ) ( TRUCK-AT ?auto_176985 ?auto_176979 ) ( OBJ-AT ?auto_176980 ?auto_176979 ) ( OBJ-AT ?auto_176983 ?auto_176979 ) ( not ( = ?auto_176980 ?auto_176981 ) ) ( not ( = ?auto_176980 ?auto_176983 ) ) ( not ( = ?auto_176980 ?auto_176982 ) ) ( not ( = ?auto_176981 ?auto_176983 ) ) ( not ( = ?auto_176983 ?auto_176982 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_176982 ?auto_176981 ?auto_176979 )
      ( DELIVER-4PKG-VERIFY ?auto_176980 ?auto_176981 ?auto_176983 ?auto_176982 ?auto_176979 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_177012 - OBJ
      ?auto_177013 - OBJ
      ?auto_177015 - OBJ
      ?auto_177014 - OBJ
      ?auto_177011 - LOCATION
    )
    :vars
    (
      ?auto_177018 - LOCATION
      ?auto_177016 - CITY
      ?auto_177017 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_177018 ?auto_177016 ) ( IN-CITY ?auto_177011 ?auto_177016 ) ( not ( = ?auto_177011 ?auto_177018 ) ) ( OBJ-AT ?auto_177014 ?auto_177011 ) ( not ( = ?auto_177014 ?auto_177012 ) ) ( OBJ-AT ?auto_177012 ?auto_177018 ) ( TRUCK-AT ?auto_177017 ?auto_177011 ) ( OBJ-AT ?auto_177013 ?auto_177011 ) ( OBJ-AT ?auto_177015 ?auto_177011 ) ( not ( = ?auto_177012 ?auto_177013 ) ) ( not ( = ?auto_177012 ?auto_177015 ) ) ( not ( = ?auto_177013 ?auto_177015 ) ) ( not ( = ?auto_177013 ?auto_177014 ) ) ( not ( = ?auto_177015 ?auto_177014 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_177014 ?auto_177012 ?auto_177011 )
      ( DELIVER-4PKG-VERIFY ?auto_177012 ?auto_177013 ?auto_177015 ?auto_177014 ?auto_177011 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_177077 - OBJ
      ?auto_177076 - LOCATION
    )
    :vars
    (
      ?auto_177081 - LOCATION
      ?auto_177079 - CITY
      ?auto_177078 - OBJ
      ?auto_177080 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_177081 ?auto_177079 ) ( IN-CITY ?auto_177076 ?auto_177079 ) ( not ( = ?auto_177076 ?auto_177081 ) ) ( not ( = ?auto_177078 ?auto_177077 ) ) ( OBJ-AT ?auto_177077 ?auto_177081 ) ( TRUCK-AT ?auto_177080 ?auto_177076 ) ( IN-TRUCK ?auto_177078 ?auto_177080 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_177078 ?auto_177076 )
      ( DELIVER-2PKG ?auto_177078 ?auto_177077 ?auto_177076 )
      ( DELIVER-1PKG-VERIFY ?auto_177077 ?auto_177076 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_177083 - OBJ
      ?auto_177084 - OBJ
      ?auto_177082 - LOCATION
    )
    :vars
    (
      ?auto_177086 - LOCATION
      ?auto_177085 - CITY
      ?auto_177087 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_177086 ?auto_177085 ) ( IN-CITY ?auto_177082 ?auto_177085 ) ( not ( = ?auto_177082 ?auto_177086 ) ) ( not ( = ?auto_177083 ?auto_177084 ) ) ( OBJ-AT ?auto_177084 ?auto_177086 ) ( TRUCK-AT ?auto_177087 ?auto_177082 ) ( IN-TRUCK ?auto_177083 ?auto_177087 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_177084 ?auto_177082 )
      ( DELIVER-2PKG-VERIFY ?auto_177083 ?auto_177084 ?auto_177082 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_177089 - OBJ
      ?auto_177090 - OBJ
      ?auto_177088 - LOCATION
    )
    :vars
    (
      ?auto_177092 - LOCATION
      ?auto_177091 - CITY
      ?auto_177093 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_177092 ?auto_177091 ) ( IN-CITY ?auto_177088 ?auto_177091 ) ( not ( = ?auto_177088 ?auto_177092 ) ) ( not ( = ?auto_177090 ?auto_177089 ) ) ( OBJ-AT ?auto_177089 ?auto_177092 ) ( TRUCK-AT ?auto_177093 ?auto_177088 ) ( IN-TRUCK ?auto_177090 ?auto_177093 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_177090 ?auto_177089 ?auto_177088 )
      ( DELIVER-2PKG-VERIFY ?auto_177089 ?auto_177090 ?auto_177088 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_177273 - OBJ
      ?auto_177272 - LOCATION
    )
    :vars
    (
      ?auto_177276 - LOCATION
      ?auto_177274 - CITY
      ?auto_177275 - OBJ
      ?auto_177277 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_177276 ?auto_177274 ) ( IN-CITY ?auto_177272 ?auto_177274 ) ( not ( = ?auto_177272 ?auto_177276 ) ) ( not ( = ?auto_177275 ?auto_177273 ) ) ( OBJ-AT ?auto_177273 ?auto_177276 ) ( IN-TRUCK ?auto_177275 ?auto_177277 ) ( TRUCK-AT ?auto_177277 ?auto_177276 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_177277 ?auto_177276 ?auto_177272 ?auto_177274 )
      ( DELIVER-2PKG ?auto_177275 ?auto_177273 ?auto_177272 )
      ( DELIVER-1PKG-VERIFY ?auto_177273 ?auto_177272 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_177279 - OBJ
      ?auto_177280 - OBJ
      ?auto_177278 - LOCATION
    )
    :vars
    (
      ?auto_177283 - LOCATION
      ?auto_177282 - CITY
      ?auto_177281 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_177283 ?auto_177282 ) ( IN-CITY ?auto_177278 ?auto_177282 ) ( not ( = ?auto_177278 ?auto_177283 ) ) ( not ( = ?auto_177279 ?auto_177280 ) ) ( OBJ-AT ?auto_177280 ?auto_177283 ) ( IN-TRUCK ?auto_177279 ?auto_177281 ) ( TRUCK-AT ?auto_177281 ?auto_177283 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_177280 ?auto_177278 )
      ( DELIVER-2PKG-VERIFY ?auto_177279 ?auto_177280 ?auto_177278 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_177285 - OBJ
      ?auto_177286 - OBJ
      ?auto_177284 - LOCATION
    )
    :vars
    (
      ?auto_177289 - LOCATION
      ?auto_177288 - CITY
      ?auto_177287 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_177289 ?auto_177288 ) ( IN-CITY ?auto_177284 ?auto_177288 ) ( not ( = ?auto_177284 ?auto_177289 ) ) ( not ( = ?auto_177286 ?auto_177285 ) ) ( OBJ-AT ?auto_177285 ?auto_177289 ) ( IN-TRUCK ?auto_177286 ?auto_177287 ) ( TRUCK-AT ?auto_177287 ?auto_177289 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_177286 ?auto_177285 ?auto_177284 )
      ( DELIVER-2PKG-VERIFY ?auto_177285 ?auto_177286 ?auto_177284 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_178828 - OBJ
      ?auto_178829 - OBJ
      ?auto_178830 - OBJ
      ?auto_178827 - LOCATION
    )
    :vars
    (
      ?auto_178834 - TRUCK
      ?auto_178833 - LOCATION
      ?auto_178831 - CITY
      ?auto_178832 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_178830 ?auto_178834 ) ( TRUCK-AT ?auto_178834 ?auto_178833 ) ( IN-CITY ?auto_178833 ?auto_178831 ) ( IN-CITY ?auto_178827 ?auto_178831 ) ( not ( = ?auto_178827 ?auto_178833 ) ) ( OBJ-AT ?auto_178832 ?auto_178827 ) ( not ( = ?auto_178832 ?auto_178830 ) ) ( OBJ-AT ?auto_178828 ?auto_178827 ) ( OBJ-AT ?auto_178829 ?auto_178827 ) ( not ( = ?auto_178828 ?auto_178829 ) ) ( not ( = ?auto_178828 ?auto_178830 ) ) ( not ( = ?auto_178828 ?auto_178832 ) ) ( not ( = ?auto_178829 ?auto_178830 ) ) ( not ( = ?auto_178829 ?auto_178832 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_178832 ?auto_178830 ?auto_178827 )
      ( DELIVER-3PKG-VERIFY ?auto_178828 ?auto_178829 ?auto_178830 ?auto_178827 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_178840 - OBJ
      ?auto_178841 - OBJ
      ?auto_178842 - OBJ
      ?auto_178839 - LOCATION
    )
    :vars
    (
      ?auto_178846 - TRUCK
      ?auto_178845 - LOCATION
      ?auto_178843 - CITY
      ?auto_178844 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_178841 ?auto_178846 ) ( TRUCK-AT ?auto_178846 ?auto_178845 ) ( IN-CITY ?auto_178845 ?auto_178843 ) ( IN-CITY ?auto_178839 ?auto_178843 ) ( not ( = ?auto_178839 ?auto_178845 ) ) ( OBJ-AT ?auto_178844 ?auto_178839 ) ( not ( = ?auto_178844 ?auto_178841 ) ) ( OBJ-AT ?auto_178840 ?auto_178839 ) ( OBJ-AT ?auto_178842 ?auto_178839 ) ( not ( = ?auto_178840 ?auto_178841 ) ) ( not ( = ?auto_178840 ?auto_178842 ) ) ( not ( = ?auto_178840 ?auto_178844 ) ) ( not ( = ?auto_178841 ?auto_178842 ) ) ( not ( = ?auto_178842 ?auto_178844 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_178844 ?auto_178841 ?auto_178839 )
      ( DELIVER-3PKG-VERIFY ?auto_178840 ?auto_178841 ?auto_178842 ?auto_178839 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_178878 - OBJ
      ?auto_178879 - OBJ
      ?auto_178880 - OBJ
      ?auto_178877 - LOCATION
    )
    :vars
    (
      ?auto_178884 - TRUCK
      ?auto_178883 - LOCATION
      ?auto_178881 - CITY
      ?auto_178882 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_178878 ?auto_178884 ) ( TRUCK-AT ?auto_178884 ?auto_178883 ) ( IN-CITY ?auto_178883 ?auto_178881 ) ( IN-CITY ?auto_178877 ?auto_178881 ) ( not ( = ?auto_178877 ?auto_178883 ) ) ( OBJ-AT ?auto_178882 ?auto_178877 ) ( not ( = ?auto_178882 ?auto_178878 ) ) ( OBJ-AT ?auto_178879 ?auto_178877 ) ( OBJ-AT ?auto_178880 ?auto_178877 ) ( not ( = ?auto_178878 ?auto_178879 ) ) ( not ( = ?auto_178878 ?auto_178880 ) ) ( not ( = ?auto_178879 ?auto_178880 ) ) ( not ( = ?auto_178879 ?auto_178882 ) ) ( not ( = ?auto_178880 ?auto_178882 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_178882 ?auto_178878 ?auto_178877 )
      ( DELIVER-3PKG-VERIFY ?auto_178878 ?auto_178879 ?auto_178880 ?auto_178877 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_178917 - OBJ
      ?auto_178918 - OBJ
      ?auto_178920 - OBJ
      ?auto_178919 - OBJ
      ?auto_178916 - LOCATION
    )
    :vars
    (
      ?auto_178923 - TRUCK
      ?auto_178922 - LOCATION
      ?auto_178921 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_178919 ?auto_178923 ) ( TRUCK-AT ?auto_178923 ?auto_178922 ) ( IN-CITY ?auto_178922 ?auto_178921 ) ( IN-CITY ?auto_178916 ?auto_178921 ) ( not ( = ?auto_178916 ?auto_178922 ) ) ( OBJ-AT ?auto_178917 ?auto_178916 ) ( not ( = ?auto_178917 ?auto_178919 ) ) ( OBJ-AT ?auto_178918 ?auto_178916 ) ( OBJ-AT ?auto_178920 ?auto_178916 ) ( not ( = ?auto_178917 ?auto_178918 ) ) ( not ( = ?auto_178917 ?auto_178920 ) ) ( not ( = ?auto_178918 ?auto_178920 ) ) ( not ( = ?auto_178918 ?auto_178919 ) ) ( not ( = ?auto_178920 ?auto_178919 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_178917 ?auto_178919 ?auto_178916 )
      ( DELIVER-4PKG-VERIFY ?auto_178917 ?auto_178918 ?auto_178920 ?auto_178919 ?auto_178916 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_178941 - OBJ
      ?auto_178942 - OBJ
      ?auto_178944 - OBJ
      ?auto_178943 - OBJ
      ?auto_178940 - LOCATION
    )
    :vars
    (
      ?auto_178947 - TRUCK
      ?auto_178946 - LOCATION
      ?auto_178945 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_178944 ?auto_178947 ) ( TRUCK-AT ?auto_178947 ?auto_178946 ) ( IN-CITY ?auto_178946 ?auto_178945 ) ( IN-CITY ?auto_178940 ?auto_178945 ) ( not ( = ?auto_178940 ?auto_178946 ) ) ( OBJ-AT ?auto_178941 ?auto_178940 ) ( not ( = ?auto_178941 ?auto_178944 ) ) ( OBJ-AT ?auto_178942 ?auto_178940 ) ( OBJ-AT ?auto_178943 ?auto_178940 ) ( not ( = ?auto_178941 ?auto_178942 ) ) ( not ( = ?auto_178941 ?auto_178943 ) ) ( not ( = ?auto_178942 ?auto_178944 ) ) ( not ( = ?auto_178942 ?auto_178943 ) ) ( not ( = ?auto_178944 ?auto_178943 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_178941 ?auto_178944 ?auto_178940 )
      ( DELIVER-4PKG-VERIFY ?auto_178941 ?auto_178942 ?auto_178944 ?auto_178943 ?auto_178940 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_179005 - OBJ
      ?auto_179006 - OBJ
      ?auto_179008 - OBJ
      ?auto_179007 - OBJ
      ?auto_179004 - LOCATION
    )
    :vars
    (
      ?auto_179011 - TRUCK
      ?auto_179010 - LOCATION
      ?auto_179009 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_179006 ?auto_179011 ) ( TRUCK-AT ?auto_179011 ?auto_179010 ) ( IN-CITY ?auto_179010 ?auto_179009 ) ( IN-CITY ?auto_179004 ?auto_179009 ) ( not ( = ?auto_179004 ?auto_179010 ) ) ( OBJ-AT ?auto_179005 ?auto_179004 ) ( not ( = ?auto_179005 ?auto_179006 ) ) ( OBJ-AT ?auto_179008 ?auto_179004 ) ( OBJ-AT ?auto_179007 ?auto_179004 ) ( not ( = ?auto_179005 ?auto_179008 ) ) ( not ( = ?auto_179005 ?auto_179007 ) ) ( not ( = ?auto_179006 ?auto_179008 ) ) ( not ( = ?auto_179006 ?auto_179007 ) ) ( not ( = ?auto_179008 ?auto_179007 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_179005 ?auto_179006 ?auto_179004 )
      ( DELIVER-4PKG-VERIFY ?auto_179005 ?auto_179006 ?auto_179008 ?auto_179007 ?auto_179004 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_179069 - OBJ
      ?auto_179070 - OBJ
      ?auto_179072 - OBJ
      ?auto_179071 - OBJ
      ?auto_179068 - LOCATION
    )
    :vars
    (
      ?auto_179075 - TRUCK
      ?auto_179074 - LOCATION
      ?auto_179073 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_179071 ?auto_179075 ) ( TRUCK-AT ?auto_179075 ?auto_179074 ) ( IN-CITY ?auto_179074 ?auto_179073 ) ( IN-CITY ?auto_179068 ?auto_179073 ) ( not ( = ?auto_179068 ?auto_179074 ) ) ( OBJ-AT ?auto_179070 ?auto_179068 ) ( not ( = ?auto_179070 ?auto_179071 ) ) ( OBJ-AT ?auto_179069 ?auto_179068 ) ( OBJ-AT ?auto_179072 ?auto_179068 ) ( not ( = ?auto_179069 ?auto_179070 ) ) ( not ( = ?auto_179069 ?auto_179072 ) ) ( not ( = ?auto_179069 ?auto_179071 ) ) ( not ( = ?auto_179070 ?auto_179072 ) ) ( not ( = ?auto_179072 ?auto_179071 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_179070 ?auto_179071 ?auto_179068 )
      ( DELIVER-4PKG-VERIFY ?auto_179069 ?auto_179070 ?auto_179072 ?auto_179071 ?auto_179068 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_179093 - OBJ
      ?auto_179094 - OBJ
      ?auto_179096 - OBJ
      ?auto_179095 - OBJ
      ?auto_179092 - LOCATION
    )
    :vars
    (
      ?auto_179099 - TRUCK
      ?auto_179098 - LOCATION
      ?auto_179097 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_179096 ?auto_179099 ) ( TRUCK-AT ?auto_179099 ?auto_179098 ) ( IN-CITY ?auto_179098 ?auto_179097 ) ( IN-CITY ?auto_179092 ?auto_179097 ) ( not ( = ?auto_179092 ?auto_179098 ) ) ( OBJ-AT ?auto_179094 ?auto_179092 ) ( not ( = ?auto_179094 ?auto_179096 ) ) ( OBJ-AT ?auto_179093 ?auto_179092 ) ( OBJ-AT ?auto_179095 ?auto_179092 ) ( not ( = ?auto_179093 ?auto_179094 ) ) ( not ( = ?auto_179093 ?auto_179096 ) ) ( not ( = ?auto_179093 ?auto_179095 ) ) ( not ( = ?auto_179094 ?auto_179095 ) ) ( not ( = ?auto_179096 ?auto_179095 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_179094 ?auto_179096 ?auto_179092 )
      ( DELIVER-4PKG-VERIFY ?auto_179093 ?auto_179094 ?auto_179096 ?auto_179095 ?auto_179092 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_179117 - OBJ
      ?auto_179118 - OBJ
      ?auto_179120 - OBJ
      ?auto_179119 - OBJ
      ?auto_179116 - LOCATION
    )
    :vars
    (
      ?auto_179124 - TRUCK
      ?auto_179123 - LOCATION
      ?auto_179121 - CITY
      ?auto_179122 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_179119 ?auto_179124 ) ( TRUCK-AT ?auto_179124 ?auto_179123 ) ( IN-CITY ?auto_179123 ?auto_179121 ) ( IN-CITY ?auto_179116 ?auto_179121 ) ( not ( = ?auto_179116 ?auto_179123 ) ) ( OBJ-AT ?auto_179122 ?auto_179116 ) ( not ( = ?auto_179122 ?auto_179119 ) ) ( OBJ-AT ?auto_179117 ?auto_179116 ) ( OBJ-AT ?auto_179118 ?auto_179116 ) ( OBJ-AT ?auto_179120 ?auto_179116 ) ( not ( = ?auto_179117 ?auto_179118 ) ) ( not ( = ?auto_179117 ?auto_179120 ) ) ( not ( = ?auto_179117 ?auto_179119 ) ) ( not ( = ?auto_179117 ?auto_179122 ) ) ( not ( = ?auto_179118 ?auto_179120 ) ) ( not ( = ?auto_179118 ?auto_179119 ) ) ( not ( = ?auto_179118 ?auto_179122 ) ) ( not ( = ?auto_179120 ?auto_179119 ) ) ( not ( = ?auto_179120 ?auto_179122 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_179122 ?auto_179119 ?auto_179116 )
      ( DELIVER-4PKG-VERIFY ?auto_179117 ?auto_179118 ?auto_179120 ?auto_179119 ?auto_179116 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_179134 - OBJ
      ?auto_179135 - OBJ
      ?auto_179137 - OBJ
      ?auto_179136 - OBJ
      ?auto_179133 - LOCATION
    )
    :vars
    (
      ?auto_179141 - TRUCK
      ?auto_179140 - LOCATION
      ?auto_179138 - CITY
      ?auto_179139 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_179137 ?auto_179141 ) ( TRUCK-AT ?auto_179141 ?auto_179140 ) ( IN-CITY ?auto_179140 ?auto_179138 ) ( IN-CITY ?auto_179133 ?auto_179138 ) ( not ( = ?auto_179133 ?auto_179140 ) ) ( OBJ-AT ?auto_179139 ?auto_179133 ) ( not ( = ?auto_179139 ?auto_179137 ) ) ( OBJ-AT ?auto_179134 ?auto_179133 ) ( OBJ-AT ?auto_179135 ?auto_179133 ) ( OBJ-AT ?auto_179136 ?auto_179133 ) ( not ( = ?auto_179134 ?auto_179135 ) ) ( not ( = ?auto_179134 ?auto_179137 ) ) ( not ( = ?auto_179134 ?auto_179136 ) ) ( not ( = ?auto_179134 ?auto_179139 ) ) ( not ( = ?auto_179135 ?auto_179137 ) ) ( not ( = ?auto_179135 ?auto_179136 ) ) ( not ( = ?auto_179135 ?auto_179139 ) ) ( not ( = ?auto_179137 ?auto_179136 ) ) ( not ( = ?auto_179136 ?auto_179139 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_179139 ?auto_179137 ?auto_179133 )
      ( DELIVER-4PKG-VERIFY ?auto_179134 ?auto_179135 ?auto_179137 ?auto_179136 ?auto_179133 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_179152 - OBJ
      ?auto_179153 - OBJ
      ?auto_179155 - OBJ
      ?auto_179154 - OBJ
      ?auto_179151 - LOCATION
    )
    :vars
    (
      ?auto_179158 - TRUCK
      ?auto_179157 - LOCATION
      ?auto_179156 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_179153 ?auto_179158 ) ( TRUCK-AT ?auto_179158 ?auto_179157 ) ( IN-CITY ?auto_179157 ?auto_179156 ) ( IN-CITY ?auto_179151 ?auto_179156 ) ( not ( = ?auto_179151 ?auto_179157 ) ) ( OBJ-AT ?auto_179154 ?auto_179151 ) ( not ( = ?auto_179154 ?auto_179153 ) ) ( OBJ-AT ?auto_179152 ?auto_179151 ) ( OBJ-AT ?auto_179155 ?auto_179151 ) ( not ( = ?auto_179152 ?auto_179153 ) ) ( not ( = ?auto_179152 ?auto_179155 ) ) ( not ( = ?auto_179152 ?auto_179154 ) ) ( not ( = ?auto_179153 ?auto_179155 ) ) ( not ( = ?auto_179155 ?auto_179154 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_179154 ?auto_179153 ?auto_179151 )
      ( DELIVER-4PKG-VERIFY ?auto_179152 ?auto_179153 ?auto_179155 ?auto_179154 ?auto_179151 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_179184 - OBJ
      ?auto_179185 - OBJ
      ?auto_179187 - OBJ
      ?auto_179186 - OBJ
      ?auto_179183 - LOCATION
    )
    :vars
    (
      ?auto_179191 - TRUCK
      ?auto_179190 - LOCATION
      ?auto_179188 - CITY
      ?auto_179189 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_179185 ?auto_179191 ) ( TRUCK-AT ?auto_179191 ?auto_179190 ) ( IN-CITY ?auto_179190 ?auto_179188 ) ( IN-CITY ?auto_179183 ?auto_179188 ) ( not ( = ?auto_179183 ?auto_179190 ) ) ( OBJ-AT ?auto_179189 ?auto_179183 ) ( not ( = ?auto_179189 ?auto_179185 ) ) ( OBJ-AT ?auto_179184 ?auto_179183 ) ( OBJ-AT ?auto_179187 ?auto_179183 ) ( OBJ-AT ?auto_179186 ?auto_179183 ) ( not ( = ?auto_179184 ?auto_179185 ) ) ( not ( = ?auto_179184 ?auto_179187 ) ) ( not ( = ?auto_179184 ?auto_179186 ) ) ( not ( = ?auto_179184 ?auto_179189 ) ) ( not ( = ?auto_179185 ?auto_179187 ) ) ( not ( = ?auto_179185 ?auto_179186 ) ) ( not ( = ?auto_179187 ?auto_179186 ) ) ( not ( = ?auto_179187 ?auto_179189 ) ) ( not ( = ?auto_179186 ?auto_179189 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_179189 ?auto_179185 ?auto_179183 )
      ( DELIVER-4PKG-VERIFY ?auto_179184 ?auto_179185 ?auto_179187 ?auto_179186 ?auto_179183 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_179236 - OBJ
      ?auto_179237 - OBJ
      ?auto_179239 - OBJ
      ?auto_179238 - OBJ
      ?auto_179235 - LOCATION
    )
    :vars
    (
      ?auto_179242 - TRUCK
      ?auto_179241 - LOCATION
      ?auto_179240 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_179236 ?auto_179242 ) ( TRUCK-AT ?auto_179242 ?auto_179241 ) ( IN-CITY ?auto_179241 ?auto_179240 ) ( IN-CITY ?auto_179235 ?auto_179240 ) ( not ( = ?auto_179235 ?auto_179241 ) ) ( OBJ-AT ?auto_179237 ?auto_179235 ) ( not ( = ?auto_179237 ?auto_179236 ) ) ( OBJ-AT ?auto_179239 ?auto_179235 ) ( OBJ-AT ?auto_179238 ?auto_179235 ) ( not ( = ?auto_179236 ?auto_179239 ) ) ( not ( = ?auto_179236 ?auto_179238 ) ) ( not ( = ?auto_179237 ?auto_179239 ) ) ( not ( = ?auto_179237 ?auto_179238 ) ) ( not ( = ?auto_179239 ?auto_179238 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_179237 ?auto_179236 ?auto_179235 )
      ( DELIVER-4PKG-VERIFY ?auto_179236 ?auto_179237 ?auto_179239 ?auto_179238 ?auto_179235 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_179252 - OBJ
      ?auto_179253 - OBJ
      ?auto_179255 - OBJ
      ?auto_179254 - OBJ
      ?auto_179251 - LOCATION
    )
    :vars
    (
      ?auto_179258 - TRUCK
      ?auto_179257 - LOCATION
      ?auto_179256 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_179252 ?auto_179258 ) ( TRUCK-AT ?auto_179258 ?auto_179257 ) ( IN-CITY ?auto_179257 ?auto_179256 ) ( IN-CITY ?auto_179251 ?auto_179256 ) ( not ( = ?auto_179251 ?auto_179257 ) ) ( OBJ-AT ?auto_179254 ?auto_179251 ) ( not ( = ?auto_179254 ?auto_179252 ) ) ( OBJ-AT ?auto_179253 ?auto_179251 ) ( OBJ-AT ?auto_179255 ?auto_179251 ) ( not ( = ?auto_179252 ?auto_179253 ) ) ( not ( = ?auto_179252 ?auto_179255 ) ) ( not ( = ?auto_179253 ?auto_179255 ) ) ( not ( = ?auto_179253 ?auto_179254 ) ) ( not ( = ?auto_179255 ?auto_179254 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_179254 ?auto_179252 ?auto_179251 )
      ( DELIVER-4PKG-VERIFY ?auto_179252 ?auto_179253 ?auto_179255 ?auto_179254 ?auto_179251 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_179332 - OBJ
      ?auto_179333 - OBJ
      ?auto_179335 - OBJ
      ?auto_179334 - OBJ
      ?auto_179331 - LOCATION
    )
    :vars
    (
      ?auto_179339 - TRUCK
      ?auto_179338 - LOCATION
      ?auto_179336 - CITY
      ?auto_179337 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_179332 ?auto_179339 ) ( TRUCK-AT ?auto_179339 ?auto_179338 ) ( IN-CITY ?auto_179338 ?auto_179336 ) ( IN-CITY ?auto_179331 ?auto_179336 ) ( not ( = ?auto_179331 ?auto_179338 ) ) ( OBJ-AT ?auto_179337 ?auto_179331 ) ( not ( = ?auto_179337 ?auto_179332 ) ) ( OBJ-AT ?auto_179333 ?auto_179331 ) ( OBJ-AT ?auto_179335 ?auto_179331 ) ( OBJ-AT ?auto_179334 ?auto_179331 ) ( not ( = ?auto_179332 ?auto_179333 ) ) ( not ( = ?auto_179332 ?auto_179335 ) ) ( not ( = ?auto_179332 ?auto_179334 ) ) ( not ( = ?auto_179333 ?auto_179335 ) ) ( not ( = ?auto_179333 ?auto_179334 ) ) ( not ( = ?auto_179333 ?auto_179337 ) ) ( not ( = ?auto_179335 ?auto_179334 ) ) ( not ( = ?auto_179335 ?auto_179337 ) ) ( not ( = ?auto_179334 ?auto_179337 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_179337 ?auto_179332 ?auto_179331 )
      ( DELIVER-4PKG-VERIFY ?auto_179332 ?auto_179333 ?auto_179335 ?auto_179334 ?auto_179331 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_179483 - OBJ
      ?auto_179484 - OBJ
      ?auto_179485 - OBJ
      ?auto_179482 - LOCATION
    )
    :vars
    (
      ?auto_179488 - TRUCK
      ?auto_179487 - LOCATION
      ?auto_179486 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_179488 ?auto_179487 ) ( IN-CITY ?auto_179487 ?auto_179486 ) ( IN-CITY ?auto_179482 ?auto_179486 ) ( not ( = ?auto_179482 ?auto_179487 ) ) ( OBJ-AT ?auto_179484 ?auto_179482 ) ( not ( = ?auto_179484 ?auto_179485 ) ) ( OBJ-AT ?auto_179485 ?auto_179487 ) ( OBJ-AT ?auto_179483 ?auto_179482 ) ( not ( = ?auto_179483 ?auto_179484 ) ) ( not ( = ?auto_179483 ?auto_179485 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_179484 ?auto_179485 ?auto_179482 )
      ( DELIVER-3PKG-VERIFY ?auto_179483 ?auto_179484 ?auto_179485 ?auto_179482 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_179516 - OBJ
      ?auto_179517 - OBJ
      ?auto_179518 - OBJ
      ?auto_179515 - LOCATION
    )
    :vars
    (
      ?auto_179522 - TRUCK
      ?auto_179521 - LOCATION
      ?auto_179519 - CITY
      ?auto_179520 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_179522 ?auto_179521 ) ( IN-CITY ?auto_179521 ?auto_179519 ) ( IN-CITY ?auto_179515 ?auto_179519 ) ( not ( = ?auto_179515 ?auto_179521 ) ) ( OBJ-AT ?auto_179520 ?auto_179515 ) ( not ( = ?auto_179520 ?auto_179518 ) ) ( OBJ-AT ?auto_179518 ?auto_179521 ) ( OBJ-AT ?auto_179516 ?auto_179515 ) ( OBJ-AT ?auto_179517 ?auto_179515 ) ( not ( = ?auto_179516 ?auto_179517 ) ) ( not ( = ?auto_179516 ?auto_179518 ) ) ( not ( = ?auto_179516 ?auto_179520 ) ) ( not ( = ?auto_179517 ?auto_179518 ) ) ( not ( = ?auto_179517 ?auto_179520 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_179520 ?auto_179518 ?auto_179515 )
      ( DELIVER-3PKG-VERIFY ?auto_179516 ?auto_179517 ?auto_179518 ?auto_179515 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_179528 - OBJ
      ?auto_179529 - OBJ
      ?auto_179530 - OBJ
      ?auto_179527 - LOCATION
    )
    :vars
    (
      ?auto_179534 - TRUCK
      ?auto_179533 - LOCATION
      ?auto_179531 - CITY
      ?auto_179532 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_179534 ?auto_179533 ) ( IN-CITY ?auto_179533 ?auto_179531 ) ( IN-CITY ?auto_179527 ?auto_179531 ) ( not ( = ?auto_179527 ?auto_179533 ) ) ( OBJ-AT ?auto_179532 ?auto_179527 ) ( not ( = ?auto_179532 ?auto_179529 ) ) ( OBJ-AT ?auto_179529 ?auto_179533 ) ( OBJ-AT ?auto_179528 ?auto_179527 ) ( OBJ-AT ?auto_179530 ?auto_179527 ) ( not ( = ?auto_179528 ?auto_179529 ) ) ( not ( = ?auto_179528 ?auto_179530 ) ) ( not ( = ?auto_179528 ?auto_179532 ) ) ( not ( = ?auto_179529 ?auto_179530 ) ) ( not ( = ?auto_179530 ?auto_179532 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_179532 ?auto_179529 ?auto_179527 )
      ( DELIVER-3PKG-VERIFY ?auto_179528 ?auto_179529 ?auto_179530 ?auto_179527 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_179544 - OBJ
      ?auto_179545 - OBJ
      ?auto_179546 - OBJ
      ?auto_179543 - LOCATION
    )
    :vars
    (
      ?auto_179549 - TRUCK
      ?auto_179548 - LOCATION
      ?auto_179547 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_179549 ?auto_179548 ) ( IN-CITY ?auto_179548 ?auto_179547 ) ( IN-CITY ?auto_179543 ?auto_179547 ) ( not ( = ?auto_179543 ?auto_179548 ) ) ( OBJ-AT ?auto_179546 ?auto_179543 ) ( not ( = ?auto_179546 ?auto_179544 ) ) ( OBJ-AT ?auto_179544 ?auto_179548 ) ( OBJ-AT ?auto_179545 ?auto_179543 ) ( not ( = ?auto_179544 ?auto_179545 ) ) ( not ( = ?auto_179545 ?auto_179546 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_179546 ?auto_179544 ?auto_179543 )
      ( DELIVER-3PKG-VERIFY ?auto_179544 ?auto_179545 ?auto_179546 ?auto_179543 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_179566 - OBJ
      ?auto_179567 - OBJ
      ?auto_179568 - OBJ
      ?auto_179565 - LOCATION
    )
    :vars
    (
      ?auto_179572 - TRUCK
      ?auto_179571 - LOCATION
      ?auto_179569 - CITY
      ?auto_179570 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_179572 ?auto_179571 ) ( IN-CITY ?auto_179571 ?auto_179569 ) ( IN-CITY ?auto_179565 ?auto_179569 ) ( not ( = ?auto_179565 ?auto_179571 ) ) ( OBJ-AT ?auto_179570 ?auto_179565 ) ( not ( = ?auto_179570 ?auto_179566 ) ) ( OBJ-AT ?auto_179566 ?auto_179571 ) ( OBJ-AT ?auto_179567 ?auto_179565 ) ( OBJ-AT ?auto_179568 ?auto_179565 ) ( not ( = ?auto_179566 ?auto_179567 ) ) ( not ( = ?auto_179566 ?auto_179568 ) ) ( not ( = ?auto_179567 ?auto_179568 ) ) ( not ( = ?auto_179567 ?auto_179570 ) ) ( not ( = ?auto_179568 ?auto_179570 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_179570 ?auto_179566 ?auto_179565 )
      ( DELIVER-3PKG-VERIFY ?auto_179566 ?auto_179567 ?auto_179568 ?auto_179565 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_179613 - OBJ
      ?auto_179614 - OBJ
      ?auto_179616 - OBJ
      ?auto_179615 - OBJ
      ?auto_179612 - LOCATION
    )
    :vars
    (
      ?auto_179619 - TRUCK
      ?auto_179618 - LOCATION
      ?auto_179617 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_179619 ?auto_179618 ) ( IN-CITY ?auto_179618 ?auto_179617 ) ( IN-CITY ?auto_179612 ?auto_179617 ) ( not ( = ?auto_179612 ?auto_179618 ) ) ( OBJ-AT ?auto_179613 ?auto_179612 ) ( not ( = ?auto_179613 ?auto_179615 ) ) ( OBJ-AT ?auto_179615 ?auto_179618 ) ( OBJ-AT ?auto_179614 ?auto_179612 ) ( OBJ-AT ?auto_179616 ?auto_179612 ) ( not ( = ?auto_179613 ?auto_179614 ) ) ( not ( = ?auto_179613 ?auto_179616 ) ) ( not ( = ?auto_179614 ?auto_179616 ) ) ( not ( = ?auto_179614 ?auto_179615 ) ) ( not ( = ?auto_179616 ?auto_179615 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_179613 ?auto_179615 ?auto_179612 )
      ( DELIVER-4PKG-VERIFY ?auto_179613 ?auto_179614 ?auto_179616 ?auto_179615 ?auto_179612 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_179629 - OBJ
      ?auto_179630 - OBJ
      ?auto_179632 - OBJ
      ?auto_179631 - OBJ
      ?auto_179628 - LOCATION
    )
    :vars
    (
      ?auto_179635 - TRUCK
      ?auto_179634 - LOCATION
      ?auto_179633 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_179635 ?auto_179634 ) ( IN-CITY ?auto_179634 ?auto_179633 ) ( IN-CITY ?auto_179628 ?auto_179633 ) ( not ( = ?auto_179628 ?auto_179634 ) ) ( OBJ-AT ?auto_179629 ?auto_179628 ) ( not ( = ?auto_179629 ?auto_179632 ) ) ( OBJ-AT ?auto_179632 ?auto_179634 ) ( OBJ-AT ?auto_179630 ?auto_179628 ) ( OBJ-AT ?auto_179631 ?auto_179628 ) ( not ( = ?auto_179629 ?auto_179630 ) ) ( not ( = ?auto_179629 ?auto_179631 ) ) ( not ( = ?auto_179630 ?auto_179632 ) ) ( not ( = ?auto_179630 ?auto_179631 ) ) ( not ( = ?auto_179632 ?auto_179631 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_179629 ?auto_179632 ?auto_179628 )
      ( DELIVER-4PKG-VERIFY ?auto_179629 ?auto_179630 ?auto_179632 ?auto_179631 ?auto_179628 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_179685 - OBJ
      ?auto_179686 - OBJ
      ?auto_179688 - OBJ
      ?auto_179687 - OBJ
      ?auto_179684 - LOCATION
    )
    :vars
    (
      ?auto_179691 - TRUCK
      ?auto_179690 - LOCATION
      ?auto_179689 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_179691 ?auto_179690 ) ( IN-CITY ?auto_179690 ?auto_179689 ) ( IN-CITY ?auto_179684 ?auto_179689 ) ( not ( = ?auto_179684 ?auto_179690 ) ) ( OBJ-AT ?auto_179687 ?auto_179684 ) ( not ( = ?auto_179687 ?auto_179686 ) ) ( OBJ-AT ?auto_179686 ?auto_179690 ) ( OBJ-AT ?auto_179685 ?auto_179684 ) ( OBJ-AT ?auto_179688 ?auto_179684 ) ( not ( = ?auto_179685 ?auto_179686 ) ) ( not ( = ?auto_179685 ?auto_179688 ) ) ( not ( = ?auto_179685 ?auto_179687 ) ) ( not ( = ?auto_179686 ?auto_179688 ) ) ( not ( = ?auto_179688 ?auto_179687 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_179687 ?auto_179686 ?auto_179684 )
      ( DELIVER-4PKG-VERIFY ?auto_179685 ?auto_179686 ?auto_179688 ?auto_179687 ?auto_179684 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_179709 - OBJ
      ?auto_179710 - OBJ
      ?auto_179712 - OBJ
      ?auto_179711 - OBJ
      ?auto_179708 - LOCATION
    )
    :vars
    (
      ?auto_179715 - TRUCK
      ?auto_179714 - LOCATION
      ?auto_179713 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_179715 ?auto_179714 ) ( IN-CITY ?auto_179714 ?auto_179713 ) ( IN-CITY ?auto_179708 ?auto_179713 ) ( not ( = ?auto_179708 ?auto_179714 ) ) ( OBJ-AT ?auto_179709 ?auto_179708 ) ( not ( = ?auto_179709 ?auto_179710 ) ) ( OBJ-AT ?auto_179710 ?auto_179714 ) ( OBJ-AT ?auto_179712 ?auto_179708 ) ( OBJ-AT ?auto_179711 ?auto_179708 ) ( not ( = ?auto_179709 ?auto_179712 ) ) ( not ( = ?auto_179709 ?auto_179711 ) ) ( not ( = ?auto_179710 ?auto_179712 ) ) ( not ( = ?auto_179710 ?auto_179711 ) ) ( not ( = ?auto_179712 ?auto_179711 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_179709 ?auto_179710 ?auto_179708 )
      ( DELIVER-4PKG-VERIFY ?auto_179709 ?auto_179710 ?auto_179712 ?auto_179711 ?auto_179708 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_179757 - OBJ
      ?auto_179758 - OBJ
      ?auto_179760 - OBJ
      ?auto_179759 - OBJ
      ?auto_179756 - LOCATION
    )
    :vars
    (
      ?auto_179763 - TRUCK
      ?auto_179762 - LOCATION
      ?auto_179761 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_179763 ?auto_179762 ) ( IN-CITY ?auto_179762 ?auto_179761 ) ( IN-CITY ?auto_179756 ?auto_179761 ) ( not ( = ?auto_179756 ?auto_179762 ) ) ( OBJ-AT ?auto_179758 ?auto_179756 ) ( not ( = ?auto_179758 ?auto_179759 ) ) ( OBJ-AT ?auto_179759 ?auto_179762 ) ( OBJ-AT ?auto_179757 ?auto_179756 ) ( OBJ-AT ?auto_179760 ?auto_179756 ) ( not ( = ?auto_179757 ?auto_179758 ) ) ( not ( = ?auto_179757 ?auto_179760 ) ) ( not ( = ?auto_179757 ?auto_179759 ) ) ( not ( = ?auto_179758 ?auto_179760 ) ) ( not ( = ?auto_179760 ?auto_179759 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_179758 ?auto_179759 ?auto_179756 )
      ( DELIVER-4PKG-VERIFY ?auto_179757 ?auto_179758 ?auto_179760 ?auto_179759 ?auto_179756 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_179773 - OBJ
      ?auto_179774 - OBJ
      ?auto_179776 - OBJ
      ?auto_179775 - OBJ
      ?auto_179772 - LOCATION
    )
    :vars
    (
      ?auto_179779 - TRUCK
      ?auto_179778 - LOCATION
      ?auto_179777 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_179779 ?auto_179778 ) ( IN-CITY ?auto_179778 ?auto_179777 ) ( IN-CITY ?auto_179772 ?auto_179777 ) ( not ( = ?auto_179772 ?auto_179778 ) ) ( OBJ-AT ?auto_179774 ?auto_179772 ) ( not ( = ?auto_179774 ?auto_179776 ) ) ( OBJ-AT ?auto_179776 ?auto_179778 ) ( OBJ-AT ?auto_179773 ?auto_179772 ) ( OBJ-AT ?auto_179775 ?auto_179772 ) ( not ( = ?auto_179773 ?auto_179774 ) ) ( not ( = ?auto_179773 ?auto_179776 ) ) ( not ( = ?auto_179773 ?auto_179775 ) ) ( not ( = ?auto_179774 ?auto_179775 ) ) ( not ( = ?auto_179776 ?auto_179775 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_179774 ?auto_179776 ?auto_179772 )
      ( DELIVER-4PKG-VERIFY ?auto_179773 ?auto_179774 ?auto_179776 ?auto_179775 ?auto_179772 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_179805 - OBJ
      ?auto_179806 - OBJ
      ?auto_179808 - OBJ
      ?auto_179807 - OBJ
      ?auto_179804 - LOCATION
    )
    :vars
    (
      ?auto_179812 - TRUCK
      ?auto_179811 - LOCATION
      ?auto_179809 - CITY
      ?auto_179810 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_179812 ?auto_179811 ) ( IN-CITY ?auto_179811 ?auto_179809 ) ( IN-CITY ?auto_179804 ?auto_179809 ) ( not ( = ?auto_179804 ?auto_179811 ) ) ( OBJ-AT ?auto_179810 ?auto_179804 ) ( not ( = ?auto_179810 ?auto_179807 ) ) ( OBJ-AT ?auto_179807 ?auto_179811 ) ( OBJ-AT ?auto_179805 ?auto_179804 ) ( OBJ-AT ?auto_179806 ?auto_179804 ) ( OBJ-AT ?auto_179808 ?auto_179804 ) ( not ( = ?auto_179805 ?auto_179806 ) ) ( not ( = ?auto_179805 ?auto_179808 ) ) ( not ( = ?auto_179805 ?auto_179807 ) ) ( not ( = ?auto_179805 ?auto_179810 ) ) ( not ( = ?auto_179806 ?auto_179808 ) ) ( not ( = ?auto_179806 ?auto_179807 ) ) ( not ( = ?auto_179806 ?auto_179810 ) ) ( not ( = ?auto_179808 ?auto_179807 ) ) ( not ( = ?auto_179808 ?auto_179810 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_179810 ?auto_179807 ?auto_179804 )
      ( DELIVER-4PKG-VERIFY ?auto_179805 ?auto_179806 ?auto_179808 ?auto_179807 ?auto_179804 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_179822 - OBJ
      ?auto_179823 - OBJ
      ?auto_179825 - OBJ
      ?auto_179824 - OBJ
      ?auto_179821 - LOCATION
    )
    :vars
    (
      ?auto_179829 - TRUCK
      ?auto_179828 - LOCATION
      ?auto_179826 - CITY
      ?auto_179827 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_179829 ?auto_179828 ) ( IN-CITY ?auto_179828 ?auto_179826 ) ( IN-CITY ?auto_179821 ?auto_179826 ) ( not ( = ?auto_179821 ?auto_179828 ) ) ( OBJ-AT ?auto_179827 ?auto_179821 ) ( not ( = ?auto_179827 ?auto_179825 ) ) ( OBJ-AT ?auto_179825 ?auto_179828 ) ( OBJ-AT ?auto_179822 ?auto_179821 ) ( OBJ-AT ?auto_179823 ?auto_179821 ) ( OBJ-AT ?auto_179824 ?auto_179821 ) ( not ( = ?auto_179822 ?auto_179823 ) ) ( not ( = ?auto_179822 ?auto_179825 ) ) ( not ( = ?auto_179822 ?auto_179824 ) ) ( not ( = ?auto_179822 ?auto_179827 ) ) ( not ( = ?auto_179823 ?auto_179825 ) ) ( not ( = ?auto_179823 ?auto_179824 ) ) ( not ( = ?auto_179823 ?auto_179827 ) ) ( not ( = ?auto_179825 ?auto_179824 ) ) ( not ( = ?auto_179824 ?auto_179827 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_179827 ?auto_179825 ?auto_179821 )
      ( DELIVER-4PKG-VERIFY ?auto_179822 ?auto_179823 ?auto_179825 ?auto_179824 ?auto_179821 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_179872 - OBJ
      ?auto_179873 - OBJ
      ?auto_179875 - OBJ
      ?auto_179874 - OBJ
      ?auto_179871 - LOCATION
    )
    :vars
    (
      ?auto_179879 - TRUCK
      ?auto_179878 - LOCATION
      ?auto_179876 - CITY
      ?auto_179877 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_179879 ?auto_179878 ) ( IN-CITY ?auto_179878 ?auto_179876 ) ( IN-CITY ?auto_179871 ?auto_179876 ) ( not ( = ?auto_179871 ?auto_179878 ) ) ( OBJ-AT ?auto_179877 ?auto_179871 ) ( not ( = ?auto_179877 ?auto_179873 ) ) ( OBJ-AT ?auto_179873 ?auto_179878 ) ( OBJ-AT ?auto_179872 ?auto_179871 ) ( OBJ-AT ?auto_179875 ?auto_179871 ) ( OBJ-AT ?auto_179874 ?auto_179871 ) ( not ( = ?auto_179872 ?auto_179873 ) ) ( not ( = ?auto_179872 ?auto_179875 ) ) ( not ( = ?auto_179872 ?auto_179874 ) ) ( not ( = ?auto_179872 ?auto_179877 ) ) ( not ( = ?auto_179873 ?auto_179875 ) ) ( not ( = ?auto_179873 ?auto_179874 ) ) ( not ( = ?auto_179875 ?auto_179874 ) ) ( not ( = ?auto_179875 ?auto_179877 ) ) ( not ( = ?auto_179874 ?auto_179877 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_179877 ?auto_179873 ?auto_179871 )
      ( DELIVER-4PKG-VERIFY ?auto_179872 ?auto_179873 ?auto_179875 ?auto_179874 ?auto_179871 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_179916 - OBJ
      ?auto_179917 - OBJ
      ?auto_179919 - OBJ
      ?auto_179918 - OBJ
      ?auto_179915 - LOCATION
    )
    :vars
    (
      ?auto_179922 - TRUCK
      ?auto_179921 - LOCATION
      ?auto_179920 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_179922 ?auto_179921 ) ( IN-CITY ?auto_179921 ?auto_179920 ) ( IN-CITY ?auto_179915 ?auto_179920 ) ( not ( = ?auto_179915 ?auto_179921 ) ) ( OBJ-AT ?auto_179917 ?auto_179915 ) ( not ( = ?auto_179917 ?auto_179916 ) ) ( OBJ-AT ?auto_179916 ?auto_179921 ) ( OBJ-AT ?auto_179919 ?auto_179915 ) ( OBJ-AT ?auto_179918 ?auto_179915 ) ( not ( = ?auto_179916 ?auto_179919 ) ) ( not ( = ?auto_179916 ?auto_179918 ) ) ( not ( = ?auto_179917 ?auto_179919 ) ) ( not ( = ?auto_179917 ?auto_179918 ) ) ( not ( = ?auto_179919 ?auto_179918 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_179917 ?auto_179916 ?auto_179915 )
      ( DELIVER-4PKG-VERIFY ?auto_179916 ?auto_179917 ?auto_179919 ?auto_179918 ?auto_179915 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_179924 - OBJ
      ?auto_179925 - OBJ
      ?auto_179927 - OBJ
      ?auto_179926 - OBJ
      ?auto_179923 - LOCATION
    )
    :vars
    (
      ?auto_179930 - TRUCK
      ?auto_179929 - LOCATION
      ?auto_179928 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_179930 ?auto_179929 ) ( IN-CITY ?auto_179929 ?auto_179928 ) ( IN-CITY ?auto_179923 ?auto_179928 ) ( not ( = ?auto_179923 ?auto_179929 ) ) ( OBJ-AT ?auto_179927 ?auto_179923 ) ( not ( = ?auto_179927 ?auto_179924 ) ) ( OBJ-AT ?auto_179924 ?auto_179929 ) ( OBJ-AT ?auto_179925 ?auto_179923 ) ( OBJ-AT ?auto_179926 ?auto_179923 ) ( not ( = ?auto_179924 ?auto_179925 ) ) ( not ( = ?auto_179924 ?auto_179926 ) ) ( not ( = ?auto_179925 ?auto_179927 ) ) ( not ( = ?auto_179925 ?auto_179926 ) ) ( not ( = ?auto_179927 ?auto_179926 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_179927 ?auto_179924 ?auto_179923 )
      ( DELIVER-4PKG-VERIFY ?auto_179924 ?auto_179925 ?auto_179927 ?auto_179926 ?auto_179923 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_180020 - OBJ
      ?auto_180021 - OBJ
      ?auto_180023 - OBJ
      ?auto_180022 - OBJ
      ?auto_180019 - LOCATION
    )
    :vars
    (
      ?auto_180027 - TRUCK
      ?auto_180026 - LOCATION
      ?auto_180024 - CITY
      ?auto_180025 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_180027 ?auto_180026 ) ( IN-CITY ?auto_180026 ?auto_180024 ) ( IN-CITY ?auto_180019 ?auto_180024 ) ( not ( = ?auto_180019 ?auto_180026 ) ) ( OBJ-AT ?auto_180025 ?auto_180019 ) ( not ( = ?auto_180025 ?auto_180020 ) ) ( OBJ-AT ?auto_180020 ?auto_180026 ) ( OBJ-AT ?auto_180021 ?auto_180019 ) ( OBJ-AT ?auto_180023 ?auto_180019 ) ( OBJ-AT ?auto_180022 ?auto_180019 ) ( not ( = ?auto_180020 ?auto_180021 ) ) ( not ( = ?auto_180020 ?auto_180023 ) ) ( not ( = ?auto_180020 ?auto_180022 ) ) ( not ( = ?auto_180021 ?auto_180023 ) ) ( not ( = ?auto_180021 ?auto_180022 ) ) ( not ( = ?auto_180021 ?auto_180025 ) ) ( not ( = ?auto_180023 ?auto_180022 ) ) ( not ( = ?auto_180023 ?auto_180025 ) ) ( not ( = ?auto_180022 ?auto_180025 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_180025 ?auto_180020 ?auto_180019 )
      ( DELIVER-4PKG-VERIFY ?auto_180020 ?auto_180021 ?auto_180023 ?auto_180022 ?auto_180019 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_180204 - OBJ
      ?auto_180205 - OBJ
      ?auto_180206 - OBJ
      ?auto_180203 - LOCATION
    )
    :vars
    (
      ?auto_180210 - LOCATION
      ?auto_180208 - CITY
      ?auto_180207 - OBJ
      ?auto_180209 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_180210 ?auto_180208 ) ( IN-CITY ?auto_180203 ?auto_180208 ) ( not ( = ?auto_180203 ?auto_180210 ) ) ( OBJ-AT ?auto_180207 ?auto_180203 ) ( not ( = ?auto_180207 ?auto_180206 ) ) ( OBJ-AT ?auto_180206 ?auto_180210 ) ( TRUCK-AT ?auto_180209 ?auto_180203 ) ( OBJ-AT ?auto_180204 ?auto_180203 ) ( OBJ-AT ?auto_180205 ?auto_180203 ) ( not ( = ?auto_180204 ?auto_180205 ) ) ( not ( = ?auto_180204 ?auto_180206 ) ) ( not ( = ?auto_180204 ?auto_180207 ) ) ( not ( = ?auto_180205 ?auto_180206 ) ) ( not ( = ?auto_180205 ?auto_180207 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_180207 ?auto_180206 ?auto_180203 )
      ( DELIVER-3PKG-VERIFY ?auto_180204 ?auto_180205 ?auto_180206 ?auto_180203 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_180216 - OBJ
      ?auto_180217 - OBJ
      ?auto_180218 - OBJ
      ?auto_180215 - LOCATION
    )
    :vars
    (
      ?auto_180222 - LOCATION
      ?auto_180220 - CITY
      ?auto_180219 - OBJ
      ?auto_180221 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_180222 ?auto_180220 ) ( IN-CITY ?auto_180215 ?auto_180220 ) ( not ( = ?auto_180215 ?auto_180222 ) ) ( OBJ-AT ?auto_180219 ?auto_180215 ) ( not ( = ?auto_180219 ?auto_180217 ) ) ( OBJ-AT ?auto_180217 ?auto_180222 ) ( TRUCK-AT ?auto_180221 ?auto_180215 ) ( OBJ-AT ?auto_180216 ?auto_180215 ) ( OBJ-AT ?auto_180218 ?auto_180215 ) ( not ( = ?auto_180216 ?auto_180217 ) ) ( not ( = ?auto_180216 ?auto_180218 ) ) ( not ( = ?auto_180216 ?auto_180219 ) ) ( not ( = ?auto_180217 ?auto_180218 ) ) ( not ( = ?auto_180218 ?auto_180219 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_180219 ?auto_180217 ?auto_180215 )
      ( DELIVER-3PKG-VERIFY ?auto_180216 ?auto_180217 ?auto_180218 ?auto_180215 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_180254 - OBJ
      ?auto_180255 - OBJ
      ?auto_180256 - OBJ
      ?auto_180253 - LOCATION
    )
    :vars
    (
      ?auto_180260 - LOCATION
      ?auto_180258 - CITY
      ?auto_180257 - OBJ
      ?auto_180259 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_180260 ?auto_180258 ) ( IN-CITY ?auto_180253 ?auto_180258 ) ( not ( = ?auto_180253 ?auto_180260 ) ) ( OBJ-AT ?auto_180257 ?auto_180253 ) ( not ( = ?auto_180257 ?auto_180254 ) ) ( OBJ-AT ?auto_180254 ?auto_180260 ) ( TRUCK-AT ?auto_180259 ?auto_180253 ) ( OBJ-AT ?auto_180255 ?auto_180253 ) ( OBJ-AT ?auto_180256 ?auto_180253 ) ( not ( = ?auto_180254 ?auto_180255 ) ) ( not ( = ?auto_180254 ?auto_180256 ) ) ( not ( = ?auto_180255 ?auto_180256 ) ) ( not ( = ?auto_180255 ?auto_180257 ) ) ( not ( = ?auto_180256 ?auto_180257 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_180257 ?auto_180254 ?auto_180253 )
      ( DELIVER-3PKG-VERIFY ?auto_180254 ?auto_180255 ?auto_180256 ?auto_180253 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_180309 - OBJ
      ?auto_180310 - OBJ
      ?auto_180312 - OBJ
      ?auto_180311 - OBJ
      ?auto_180308 - LOCATION
    )
    :vars
    (
      ?auto_180315 - LOCATION
      ?auto_180313 - CITY
      ?auto_180314 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_180315 ?auto_180313 ) ( IN-CITY ?auto_180308 ?auto_180313 ) ( not ( = ?auto_180308 ?auto_180315 ) ) ( OBJ-AT ?auto_180309 ?auto_180308 ) ( not ( = ?auto_180309 ?auto_180312 ) ) ( OBJ-AT ?auto_180312 ?auto_180315 ) ( TRUCK-AT ?auto_180314 ?auto_180308 ) ( OBJ-AT ?auto_180310 ?auto_180308 ) ( OBJ-AT ?auto_180311 ?auto_180308 ) ( not ( = ?auto_180309 ?auto_180310 ) ) ( not ( = ?auto_180309 ?auto_180311 ) ) ( not ( = ?auto_180310 ?auto_180312 ) ) ( not ( = ?auto_180310 ?auto_180311 ) ) ( not ( = ?auto_180312 ?auto_180311 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_180309 ?auto_180312 ?auto_180308 )
      ( DELIVER-4PKG-VERIFY ?auto_180309 ?auto_180310 ?auto_180312 ?auto_180311 ?auto_180308 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_180381 - OBJ
      ?auto_180382 - OBJ
      ?auto_180384 - OBJ
      ?auto_180383 - OBJ
      ?auto_180380 - LOCATION
    )
    :vars
    (
      ?auto_180387 - LOCATION
      ?auto_180385 - CITY
      ?auto_180386 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_180387 ?auto_180385 ) ( IN-CITY ?auto_180380 ?auto_180385 ) ( not ( = ?auto_180380 ?auto_180387 ) ) ( OBJ-AT ?auto_180381 ?auto_180380 ) ( not ( = ?auto_180381 ?auto_180382 ) ) ( OBJ-AT ?auto_180382 ?auto_180387 ) ( TRUCK-AT ?auto_180386 ?auto_180380 ) ( OBJ-AT ?auto_180384 ?auto_180380 ) ( OBJ-AT ?auto_180383 ?auto_180380 ) ( not ( = ?auto_180381 ?auto_180384 ) ) ( not ( = ?auto_180381 ?auto_180383 ) ) ( not ( = ?auto_180382 ?auto_180384 ) ) ( not ( = ?auto_180382 ?auto_180383 ) ) ( not ( = ?auto_180384 ?auto_180383 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_180381 ?auto_180382 ?auto_180380 )
      ( DELIVER-4PKG-VERIFY ?auto_180381 ?auto_180382 ?auto_180384 ?auto_180383 ?auto_180380 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_180445 - OBJ
      ?auto_180446 - OBJ
      ?auto_180448 - OBJ
      ?auto_180447 - OBJ
      ?auto_180444 - LOCATION
    )
    :vars
    (
      ?auto_180451 - LOCATION
      ?auto_180449 - CITY
      ?auto_180450 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_180451 ?auto_180449 ) ( IN-CITY ?auto_180444 ?auto_180449 ) ( not ( = ?auto_180444 ?auto_180451 ) ) ( OBJ-AT ?auto_180448 ?auto_180444 ) ( not ( = ?auto_180448 ?auto_180447 ) ) ( OBJ-AT ?auto_180447 ?auto_180451 ) ( TRUCK-AT ?auto_180450 ?auto_180444 ) ( OBJ-AT ?auto_180445 ?auto_180444 ) ( OBJ-AT ?auto_180446 ?auto_180444 ) ( not ( = ?auto_180445 ?auto_180446 ) ) ( not ( = ?auto_180445 ?auto_180448 ) ) ( not ( = ?auto_180445 ?auto_180447 ) ) ( not ( = ?auto_180446 ?auto_180448 ) ) ( not ( = ?auto_180446 ?auto_180447 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_180448 ?auto_180447 ?auto_180444 )
      ( DELIVER-4PKG-VERIFY ?auto_180445 ?auto_180446 ?auto_180448 ?auto_180447 ?auto_180444 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_180453 - OBJ
      ?auto_180454 - OBJ
      ?auto_180456 - OBJ
      ?auto_180455 - OBJ
      ?auto_180452 - LOCATION
    )
    :vars
    (
      ?auto_180459 - LOCATION
      ?auto_180457 - CITY
      ?auto_180458 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_180459 ?auto_180457 ) ( IN-CITY ?auto_180452 ?auto_180457 ) ( not ( = ?auto_180452 ?auto_180459 ) ) ( OBJ-AT ?auto_180454 ?auto_180452 ) ( not ( = ?auto_180454 ?auto_180455 ) ) ( OBJ-AT ?auto_180455 ?auto_180459 ) ( TRUCK-AT ?auto_180458 ?auto_180452 ) ( OBJ-AT ?auto_180453 ?auto_180452 ) ( OBJ-AT ?auto_180456 ?auto_180452 ) ( not ( = ?auto_180453 ?auto_180454 ) ) ( not ( = ?auto_180453 ?auto_180456 ) ) ( not ( = ?auto_180453 ?auto_180455 ) ) ( not ( = ?auto_180454 ?auto_180456 ) ) ( not ( = ?auto_180456 ?auto_180455 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_180454 ?auto_180455 ?auto_180452 )
      ( DELIVER-4PKG-VERIFY ?auto_180453 ?auto_180454 ?auto_180456 ?auto_180455 ?auto_180452 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_180469 - OBJ
      ?auto_180470 - OBJ
      ?auto_180472 - OBJ
      ?auto_180471 - OBJ
      ?auto_180468 - LOCATION
    )
    :vars
    (
      ?auto_180475 - LOCATION
      ?auto_180473 - CITY
      ?auto_180474 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_180475 ?auto_180473 ) ( IN-CITY ?auto_180468 ?auto_180473 ) ( not ( = ?auto_180468 ?auto_180475 ) ) ( OBJ-AT ?auto_180470 ?auto_180468 ) ( not ( = ?auto_180470 ?auto_180472 ) ) ( OBJ-AT ?auto_180472 ?auto_180475 ) ( TRUCK-AT ?auto_180474 ?auto_180468 ) ( OBJ-AT ?auto_180469 ?auto_180468 ) ( OBJ-AT ?auto_180471 ?auto_180468 ) ( not ( = ?auto_180469 ?auto_180470 ) ) ( not ( = ?auto_180469 ?auto_180472 ) ) ( not ( = ?auto_180469 ?auto_180471 ) ) ( not ( = ?auto_180470 ?auto_180471 ) ) ( not ( = ?auto_180472 ?auto_180471 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_180470 ?auto_180472 ?auto_180468 )
      ( DELIVER-4PKG-VERIFY ?auto_180469 ?auto_180470 ?auto_180472 ?auto_180471 ?auto_180468 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_180493 - OBJ
      ?auto_180494 - OBJ
      ?auto_180496 - OBJ
      ?auto_180495 - OBJ
      ?auto_180492 - LOCATION
    )
    :vars
    (
      ?auto_180500 - LOCATION
      ?auto_180498 - CITY
      ?auto_180497 - OBJ
      ?auto_180499 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_180500 ?auto_180498 ) ( IN-CITY ?auto_180492 ?auto_180498 ) ( not ( = ?auto_180492 ?auto_180500 ) ) ( OBJ-AT ?auto_180497 ?auto_180492 ) ( not ( = ?auto_180497 ?auto_180495 ) ) ( OBJ-AT ?auto_180495 ?auto_180500 ) ( TRUCK-AT ?auto_180499 ?auto_180492 ) ( OBJ-AT ?auto_180493 ?auto_180492 ) ( OBJ-AT ?auto_180494 ?auto_180492 ) ( OBJ-AT ?auto_180496 ?auto_180492 ) ( not ( = ?auto_180493 ?auto_180494 ) ) ( not ( = ?auto_180493 ?auto_180496 ) ) ( not ( = ?auto_180493 ?auto_180495 ) ) ( not ( = ?auto_180493 ?auto_180497 ) ) ( not ( = ?auto_180494 ?auto_180496 ) ) ( not ( = ?auto_180494 ?auto_180495 ) ) ( not ( = ?auto_180494 ?auto_180497 ) ) ( not ( = ?auto_180496 ?auto_180495 ) ) ( not ( = ?auto_180496 ?auto_180497 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_180497 ?auto_180495 ?auto_180492 )
      ( DELIVER-4PKG-VERIFY ?auto_180493 ?auto_180494 ?auto_180496 ?auto_180495 ?auto_180492 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_180510 - OBJ
      ?auto_180511 - OBJ
      ?auto_180513 - OBJ
      ?auto_180512 - OBJ
      ?auto_180509 - LOCATION
    )
    :vars
    (
      ?auto_180517 - LOCATION
      ?auto_180515 - CITY
      ?auto_180514 - OBJ
      ?auto_180516 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_180517 ?auto_180515 ) ( IN-CITY ?auto_180509 ?auto_180515 ) ( not ( = ?auto_180509 ?auto_180517 ) ) ( OBJ-AT ?auto_180514 ?auto_180509 ) ( not ( = ?auto_180514 ?auto_180513 ) ) ( OBJ-AT ?auto_180513 ?auto_180517 ) ( TRUCK-AT ?auto_180516 ?auto_180509 ) ( OBJ-AT ?auto_180510 ?auto_180509 ) ( OBJ-AT ?auto_180511 ?auto_180509 ) ( OBJ-AT ?auto_180512 ?auto_180509 ) ( not ( = ?auto_180510 ?auto_180511 ) ) ( not ( = ?auto_180510 ?auto_180513 ) ) ( not ( = ?auto_180510 ?auto_180512 ) ) ( not ( = ?auto_180510 ?auto_180514 ) ) ( not ( = ?auto_180511 ?auto_180513 ) ) ( not ( = ?auto_180511 ?auto_180512 ) ) ( not ( = ?auto_180511 ?auto_180514 ) ) ( not ( = ?auto_180513 ?auto_180512 ) ) ( not ( = ?auto_180512 ?auto_180514 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_180514 ?auto_180513 ?auto_180509 )
      ( DELIVER-4PKG-VERIFY ?auto_180510 ?auto_180511 ?auto_180513 ?auto_180512 ?auto_180509 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_180536 - OBJ
      ?auto_180537 - OBJ
      ?auto_180539 - OBJ
      ?auto_180538 - OBJ
      ?auto_180535 - LOCATION
    )
    :vars
    (
      ?auto_180542 - LOCATION
      ?auto_180540 - CITY
      ?auto_180541 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_180542 ?auto_180540 ) ( IN-CITY ?auto_180535 ?auto_180540 ) ( not ( = ?auto_180535 ?auto_180542 ) ) ( OBJ-AT ?auto_180539 ?auto_180535 ) ( not ( = ?auto_180539 ?auto_180537 ) ) ( OBJ-AT ?auto_180537 ?auto_180542 ) ( TRUCK-AT ?auto_180541 ?auto_180535 ) ( OBJ-AT ?auto_180536 ?auto_180535 ) ( OBJ-AT ?auto_180538 ?auto_180535 ) ( not ( = ?auto_180536 ?auto_180537 ) ) ( not ( = ?auto_180536 ?auto_180539 ) ) ( not ( = ?auto_180536 ?auto_180538 ) ) ( not ( = ?auto_180537 ?auto_180538 ) ) ( not ( = ?auto_180539 ?auto_180538 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_180539 ?auto_180537 ?auto_180535 )
      ( DELIVER-4PKG-VERIFY ?auto_180536 ?auto_180537 ?auto_180539 ?auto_180538 ?auto_180535 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_180560 - OBJ
      ?auto_180561 - OBJ
      ?auto_180563 - OBJ
      ?auto_180562 - OBJ
      ?auto_180559 - LOCATION
    )
    :vars
    (
      ?auto_180567 - LOCATION
      ?auto_180565 - CITY
      ?auto_180564 - OBJ
      ?auto_180566 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_180567 ?auto_180565 ) ( IN-CITY ?auto_180559 ?auto_180565 ) ( not ( = ?auto_180559 ?auto_180567 ) ) ( OBJ-AT ?auto_180564 ?auto_180559 ) ( not ( = ?auto_180564 ?auto_180561 ) ) ( OBJ-AT ?auto_180561 ?auto_180567 ) ( TRUCK-AT ?auto_180566 ?auto_180559 ) ( OBJ-AT ?auto_180560 ?auto_180559 ) ( OBJ-AT ?auto_180563 ?auto_180559 ) ( OBJ-AT ?auto_180562 ?auto_180559 ) ( not ( = ?auto_180560 ?auto_180561 ) ) ( not ( = ?auto_180560 ?auto_180563 ) ) ( not ( = ?auto_180560 ?auto_180562 ) ) ( not ( = ?auto_180560 ?auto_180564 ) ) ( not ( = ?auto_180561 ?auto_180563 ) ) ( not ( = ?auto_180561 ?auto_180562 ) ) ( not ( = ?auto_180563 ?auto_180562 ) ) ( not ( = ?auto_180563 ?auto_180564 ) ) ( not ( = ?auto_180562 ?auto_180564 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_180564 ?auto_180561 ?auto_180559 )
      ( DELIVER-4PKG-VERIFY ?auto_180560 ?auto_180561 ?auto_180563 ?auto_180562 ?auto_180559 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_180612 - OBJ
      ?auto_180613 - OBJ
      ?auto_180615 - OBJ
      ?auto_180614 - OBJ
      ?auto_180611 - LOCATION
    )
    :vars
    (
      ?auto_180618 - LOCATION
      ?auto_180616 - CITY
      ?auto_180617 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_180618 ?auto_180616 ) ( IN-CITY ?auto_180611 ?auto_180616 ) ( not ( = ?auto_180611 ?auto_180618 ) ) ( OBJ-AT ?auto_180613 ?auto_180611 ) ( not ( = ?auto_180613 ?auto_180612 ) ) ( OBJ-AT ?auto_180612 ?auto_180618 ) ( TRUCK-AT ?auto_180617 ?auto_180611 ) ( OBJ-AT ?auto_180615 ?auto_180611 ) ( OBJ-AT ?auto_180614 ?auto_180611 ) ( not ( = ?auto_180612 ?auto_180615 ) ) ( not ( = ?auto_180612 ?auto_180614 ) ) ( not ( = ?auto_180613 ?auto_180615 ) ) ( not ( = ?auto_180613 ?auto_180614 ) ) ( not ( = ?auto_180615 ?auto_180614 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_180613 ?auto_180612 ?auto_180611 )
      ( DELIVER-4PKG-VERIFY ?auto_180612 ?auto_180613 ?auto_180615 ?auto_180614 ?auto_180611 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_180684 - OBJ
      ?auto_180685 - OBJ
      ?auto_180687 - OBJ
      ?auto_180686 - OBJ
      ?auto_180683 - LOCATION
    )
    :vars
    (
      ?auto_180690 - LOCATION
      ?auto_180688 - CITY
      ?auto_180689 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_180690 ?auto_180688 ) ( IN-CITY ?auto_180683 ?auto_180688 ) ( not ( = ?auto_180683 ?auto_180690 ) ) ( OBJ-AT ?auto_180687 ?auto_180683 ) ( not ( = ?auto_180687 ?auto_180684 ) ) ( OBJ-AT ?auto_180684 ?auto_180690 ) ( TRUCK-AT ?auto_180689 ?auto_180683 ) ( OBJ-AT ?auto_180685 ?auto_180683 ) ( OBJ-AT ?auto_180686 ?auto_180683 ) ( not ( = ?auto_180684 ?auto_180685 ) ) ( not ( = ?auto_180684 ?auto_180686 ) ) ( not ( = ?auto_180685 ?auto_180687 ) ) ( not ( = ?auto_180685 ?auto_180686 ) ) ( not ( = ?auto_180687 ?auto_180686 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_180687 ?auto_180684 ?auto_180683 )
      ( DELIVER-4PKG-VERIFY ?auto_180684 ?auto_180685 ?auto_180687 ?auto_180686 ?auto_180683 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_180708 - OBJ
      ?auto_180709 - OBJ
      ?auto_180711 - OBJ
      ?auto_180710 - OBJ
      ?auto_180707 - LOCATION
    )
    :vars
    (
      ?auto_180715 - LOCATION
      ?auto_180713 - CITY
      ?auto_180712 - OBJ
      ?auto_180714 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_180715 ?auto_180713 ) ( IN-CITY ?auto_180707 ?auto_180713 ) ( not ( = ?auto_180707 ?auto_180715 ) ) ( OBJ-AT ?auto_180712 ?auto_180707 ) ( not ( = ?auto_180712 ?auto_180708 ) ) ( OBJ-AT ?auto_180708 ?auto_180715 ) ( TRUCK-AT ?auto_180714 ?auto_180707 ) ( OBJ-AT ?auto_180709 ?auto_180707 ) ( OBJ-AT ?auto_180711 ?auto_180707 ) ( OBJ-AT ?auto_180710 ?auto_180707 ) ( not ( = ?auto_180708 ?auto_180709 ) ) ( not ( = ?auto_180708 ?auto_180711 ) ) ( not ( = ?auto_180708 ?auto_180710 ) ) ( not ( = ?auto_180709 ?auto_180711 ) ) ( not ( = ?auto_180709 ?auto_180710 ) ) ( not ( = ?auto_180709 ?auto_180712 ) ) ( not ( = ?auto_180711 ?auto_180710 ) ) ( not ( = ?auto_180711 ?auto_180712 ) ) ( not ( = ?auto_180710 ?auto_180712 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_180712 ?auto_180708 ?auto_180707 )
      ( DELIVER-4PKG-VERIFY ?auto_180708 ?auto_180709 ?auto_180711 ?auto_180710 ?auto_180707 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_180857 - OBJ
      ?auto_180858 - OBJ
      ?auto_180859 - OBJ
      ?auto_180856 - LOCATION
    )
    :vars
    (
      ?auto_180862 - LOCATION
      ?auto_180861 - CITY
      ?auto_180860 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_180862 ?auto_180861 ) ( IN-CITY ?auto_180856 ?auto_180861 ) ( not ( = ?auto_180856 ?auto_180862 ) ) ( OBJ-AT ?auto_180857 ?auto_180856 ) ( not ( = ?auto_180857 ?auto_180859 ) ) ( OBJ-AT ?auto_180859 ?auto_180862 ) ( TRUCK-AT ?auto_180860 ?auto_180856 ) ( OBJ-AT ?auto_180858 ?auto_180856 ) ( not ( = ?auto_180857 ?auto_180858 ) ) ( not ( = ?auto_180858 ?auto_180859 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_180857 ?auto_180859 ?auto_180856 )
      ( DELIVER-3PKG-VERIFY ?auto_180857 ?auto_180858 ?auto_180859 ?auto_180856 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_180871 - OBJ
      ?auto_180872 - OBJ
      ?auto_180873 - OBJ
      ?auto_180870 - LOCATION
    )
    :vars
    (
      ?auto_180876 - LOCATION
      ?auto_180875 - CITY
      ?auto_180874 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_180876 ?auto_180875 ) ( IN-CITY ?auto_180870 ?auto_180875 ) ( not ( = ?auto_180870 ?auto_180876 ) ) ( OBJ-AT ?auto_180873 ?auto_180870 ) ( not ( = ?auto_180873 ?auto_180872 ) ) ( OBJ-AT ?auto_180872 ?auto_180876 ) ( TRUCK-AT ?auto_180874 ?auto_180870 ) ( OBJ-AT ?auto_180871 ?auto_180870 ) ( not ( = ?auto_180871 ?auto_180872 ) ) ( not ( = ?auto_180871 ?auto_180873 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_180873 ?auto_180872 ?auto_180870 )
      ( DELIVER-3PKG-VERIFY ?auto_180871 ?auto_180872 ?auto_180873 ?auto_180870 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_180930 - OBJ
      ?auto_180931 - OBJ
      ?auto_180932 - OBJ
      ?auto_180929 - LOCATION
    )
    :vars
    (
      ?auto_180935 - LOCATION
      ?auto_180934 - CITY
      ?auto_180933 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_180935 ?auto_180934 ) ( IN-CITY ?auto_180929 ?auto_180934 ) ( not ( = ?auto_180929 ?auto_180935 ) ) ( OBJ-AT ?auto_180932 ?auto_180929 ) ( not ( = ?auto_180932 ?auto_180930 ) ) ( OBJ-AT ?auto_180930 ?auto_180935 ) ( TRUCK-AT ?auto_180933 ?auto_180929 ) ( OBJ-AT ?auto_180931 ?auto_180929 ) ( not ( = ?auto_180930 ?auto_180931 ) ) ( not ( = ?auto_180931 ?auto_180932 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_180932 ?auto_180930 ?auto_180929 )
      ( DELIVER-3PKG-VERIFY ?auto_180930 ?auto_180931 ?auto_180932 ?auto_180929 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_181532 - OBJ
      ?auto_181531 - LOCATION
    )
    :vars
    (
      ?auto_181536 - LOCATION
      ?auto_181535 - CITY
      ?auto_181533 - OBJ
      ?auto_181534 - TRUCK
      ?auto_181537 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_181536 ?auto_181535 ) ( IN-CITY ?auto_181531 ?auto_181535 ) ( not ( = ?auto_181531 ?auto_181536 ) ) ( OBJ-AT ?auto_181533 ?auto_181531 ) ( not ( = ?auto_181533 ?auto_181532 ) ) ( OBJ-AT ?auto_181532 ?auto_181536 ) ( TRUCK-AT ?auto_181534 ?auto_181537 ) ( IN-CITY ?auto_181537 ?auto_181535 ) ( not ( = ?auto_181531 ?auto_181537 ) ) ( not ( = ?auto_181536 ?auto_181537 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_181534 ?auto_181537 ?auto_181531 ?auto_181535 )
      ( DELIVER-2PKG ?auto_181533 ?auto_181532 ?auto_181531 )
      ( DELIVER-1PKG-VERIFY ?auto_181532 ?auto_181531 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_181539 - OBJ
      ?auto_181540 - OBJ
      ?auto_181538 - LOCATION
    )
    :vars
    (
      ?auto_181542 - LOCATION
      ?auto_181541 - CITY
      ?auto_181544 - TRUCK
      ?auto_181543 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_181542 ?auto_181541 ) ( IN-CITY ?auto_181538 ?auto_181541 ) ( not ( = ?auto_181538 ?auto_181542 ) ) ( OBJ-AT ?auto_181539 ?auto_181538 ) ( not ( = ?auto_181539 ?auto_181540 ) ) ( OBJ-AT ?auto_181540 ?auto_181542 ) ( TRUCK-AT ?auto_181544 ?auto_181543 ) ( IN-CITY ?auto_181543 ?auto_181541 ) ( not ( = ?auto_181538 ?auto_181543 ) ) ( not ( = ?auto_181542 ?auto_181543 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_181540 ?auto_181538 )
      ( DELIVER-2PKG-VERIFY ?auto_181539 ?auto_181540 ?auto_181538 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_181554 - OBJ
      ?auto_181555 - OBJ
      ?auto_181553 - LOCATION
    )
    :vars
    (
      ?auto_181558 - LOCATION
      ?auto_181557 - CITY
      ?auto_181559 - TRUCK
      ?auto_181556 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_181558 ?auto_181557 ) ( IN-CITY ?auto_181553 ?auto_181557 ) ( not ( = ?auto_181553 ?auto_181558 ) ) ( OBJ-AT ?auto_181555 ?auto_181553 ) ( not ( = ?auto_181555 ?auto_181554 ) ) ( OBJ-AT ?auto_181554 ?auto_181558 ) ( TRUCK-AT ?auto_181559 ?auto_181556 ) ( IN-CITY ?auto_181556 ?auto_181557 ) ( not ( = ?auto_181553 ?auto_181556 ) ) ( not ( = ?auto_181558 ?auto_181556 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_181555 ?auto_181554 ?auto_181553 )
      ( DELIVER-2PKG-VERIFY ?auto_181554 ?auto_181555 ?auto_181553 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_181577 - OBJ
      ?auto_181578 - OBJ
      ?auto_181579 - OBJ
      ?auto_181576 - LOCATION
    )
    :vars
    (
      ?auto_181582 - LOCATION
      ?auto_181581 - CITY
      ?auto_181583 - TRUCK
      ?auto_181580 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_181582 ?auto_181581 ) ( IN-CITY ?auto_181576 ?auto_181581 ) ( not ( = ?auto_181576 ?auto_181582 ) ) ( OBJ-AT ?auto_181578 ?auto_181576 ) ( not ( = ?auto_181578 ?auto_181579 ) ) ( OBJ-AT ?auto_181579 ?auto_181582 ) ( TRUCK-AT ?auto_181583 ?auto_181580 ) ( IN-CITY ?auto_181580 ?auto_181581 ) ( not ( = ?auto_181576 ?auto_181580 ) ) ( not ( = ?auto_181582 ?auto_181580 ) ) ( OBJ-AT ?auto_181577 ?auto_181576 ) ( not ( = ?auto_181577 ?auto_181578 ) ) ( not ( = ?auto_181577 ?auto_181579 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_181578 ?auto_181579 ?auto_181576 )
      ( DELIVER-3PKG-VERIFY ?auto_181577 ?auto_181578 ?auto_181579 ?auto_181576 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_181593 - OBJ
      ?auto_181594 - OBJ
      ?auto_181595 - OBJ
      ?auto_181592 - LOCATION
    )
    :vars
    (
      ?auto_181598 - LOCATION
      ?auto_181597 - CITY
      ?auto_181599 - TRUCK
      ?auto_181596 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_181598 ?auto_181597 ) ( IN-CITY ?auto_181592 ?auto_181597 ) ( not ( = ?auto_181592 ?auto_181598 ) ) ( OBJ-AT ?auto_181595 ?auto_181592 ) ( not ( = ?auto_181595 ?auto_181594 ) ) ( OBJ-AT ?auto_181594 ?auto_181598 ) ( TRUCK-AT ?auto_181599 ?auto_181596 ) ( IN-CITY ?auto_181596 ?auto_181597 ) ( not ( = ?auto_181592 ?auto_181596 ) ) ( not ( = ?auto_181598 ?auto_181596 ) ) ( OBJ-AT ?auto_181593 ?auto_181592 ) ( not ( = ?auto_181593 ?auto_181594 ) ) ( not ( = ?auto_181593 ?auto_181595 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_181595 ?auto_181594 ?auto_181592 )
      ( DELIVER-3PKG-VERIFY ?auto_181593 ?auto_181594 ?auto_181595 ?auto_181592 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_181660 - OBJ
      ?auto_181661 - OBJ
      ?auto_181662 - OBJ
      ?auto_181659 - LOCATION
    )
    :vars
    (
      ?auto_181665 - LOCATION
      ?auto_181664 - CITY
      ?auto_181666 - TRUCK
      ?auto_181663 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_181665 ?auto_181664 ) ( IN-CITY ?auto_181659 ?auto_181664 ) ( not ( = ?auto_181659 ?auto_181665 ) ) ( OBJ-AT ?auto_181661 ?auto_181659 ) ( not ( = ?auto_181661 ?auto_181660 ) ) ( OBJ-AT ?auto_181660 ?auto_181665 ) ( TRUCK-AT ?auto_181666 ?auto_181663 ) ( IN-CITY ?auto_181663 ?auto_181664 ) ( not ( = ?auto_181659 ?auto_181663 ) ) ( not ( = ?auto_181665 ?auto_181663 ) ) ( OBJ-AT ?auto_181662 ?auto_181659 ) ( not ( = ?auto_181660 ?auto_181662 ) ) ( not ( = ?auto_181661 ?auto_181662 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_181661 ?auto_181660 ?auto_181659 )
      ( DELIVER-3PKG-VERIFY ?auto_181660 ?auto_181661 ?auto_181662 ?auto_181659 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_181736 - OBJ
      ?auto_181737 - OBJ
      ?auto_181739 - OBJ
      ?auto_181738 - OBJ
      ?auto_181735 - LOCATION
    )
    :vars
    (
      ?auto_181742 - LOCATION
      ?auto_181741 - CITY
      ?auto_181743 - TRUCK
      ?auto_181740 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_181742 ?auto_181741 ) ( IN-CITY ?auto_181735 ?auto_181741 ) ( not ( = ?auto_181735 ?auto_181742 ) ) ( OBJ-AT ?auto_181736 ?auto_181735 ) ( not ( = ?auto_181736 ?auto_181738 ) ) ( OBJ-AT ?auto_181738 ?auto_181742 ) ( TRUCK-AT ?auto_181743 ?auto_181740 ) ( IN-CITY ?auto_181740 ?auto_181741 ) ( not ( = ?auto_181735 ?auto_181740 ) ) ( not ( = ?auto_181742 ?auto_181740 ) ) ( OBJ-AT ?auto_181737 ?auto_181735 ) ( OBJ-AT ?auto_181739 ?auto_181735 ) ( not ( = ?auto_181736 ?auto_181737 ) ) ( not ( = ?auto_181736 ?auto_181739 ) ) ( not ( = ?auto_181737 ?auto_181739 ) ) ( not ( = ?auto_181737 ?auto_181738 ) ) ( not ( = ?auto_181739 ?auto_181738 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_181736 ?auto_181738 ?auto_181735 )
      ( DELIVER-4PKG-VERIFY ?auto_181736 ?auto_181737 ?auto_181739 ?auto_181738 ?auto_181735 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_181754 - OBJ
      ?auto_181755 - OBJ
      ?auto_181757 - OBJ
      ?auto_181756 - OBJ
      ?auto_181753 - LOCATION
    )
    :vars
    (
      ?auto_181760 - LOCATION
      ?auto_181759 - CITY
      ?auto_181761 - TRUCK
      ?auto_181758 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_181760 ?auto_181759 ) ( IN-CITY ?auto_181753 ?auto_181759 ) ( not ( = ?auto_181753 ?auto_181760 ) ) ( OBJ-AT ?auto_181756 ?auto_181753 ) ( not ( = ?auto_181756 ?auto_181757 ) ) ( OBJ-AT ?auto_181757 ?auto_181760 ) ( TRUCK-AT ?auto_181761 ?auto_181758 ) ( IN-CITY ?auto_181758 ?auto_181759 ) ( not ( = ?auto_181753 ?auto_181758 ) ) ( not ( = ?auto_181760 ?auto_181758 ) ) ( OBJ-AT ?auto_181754 ?auto_181753 ) ( OBJ-AT ?auto_181755 ?auto_181753 ) ( not ( = ?auto_181754 ?auto_181755 ) ) ( not ( = ?auto_181754 ?auto_181757 ) ) ( not ( = ?auto_181754 ?auto_181756 ) ) ( not ( = ?auto_181755 ?auto_181757 ) ) ( not ( = ?auto_181755 ?auto_181756 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_181756 ?auto_181757 ?auto_181753 )
      ( DELIVER-4PKG-VERIFY ?auto_181754 ?auto_181755 ?auto_181757 ?auto_181756 ?auto_181753 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_181826 - OBJ
      ?auto_181827 - OBJ
      ?auto_181829 - OBJ
      ?auto_181828 - OBJ
      ?auto_181825 - LOCATION
    )
    :vars
    (
      ?auto_181832 - LOCATION
      ?auto_181831 - CITY
      ?auto_181833 - TRUCK
      ?auto_181830 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_181832 ?auto_181831 ) ( IN-CITY ?auto_181825 ?auto_181831 ) ( not ( = ?auto_181825 ?auto_181832 ) ) ( OBJ-AT ?auto_181826 ?auto_181825 ) ( not ( = ?auto_181826 ?auto_181827 ) ) ( OBJ-AT ?auto_181827 ?auto_181832 ) ( TRUCK-AT ?auto_181833 ?auto_181830 ) ( IN-CITY ?auto_181830 ?auto_181831 ) ( not ( = ?auto_181825 ?auto_181830 ) ) ( not ( = ?auto_181832 ?auto_181830 ) ) ( OBJ-AT ?auto_181829 ?auto_181825 ) ( OBJ-AT ?auto_181828 ?auto_181825 ) ( not ( = ?auto_181826 ?auto_181829 ) ) ( not ( = ?auto_181826 ?auto_181828 ) ) ( not ( = ?auto_181827 ?auto_181829 ) ) ( not ( = ?auto_181827 ?auto_181828 ) ) ( not ( = ?auto_181829 ?auto_181828 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_181826 ?auto_181827 ?auto_181825 )
      ( DELIVER-4PKG-VERIFY ?auto_181826 ?auto_181827 ?auto_181829 ?auto_181828 ?auto_181825 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_182085 - OBJ
      ?auto_182086 - OBJ
      ?auto_182088 - OBJ
      ?auto_182087 - OBJ
      ?auto_182084 - LOCATION
    )
    :vars
    (
      ?auto_182091 - LOCATION
      ?auto_182090 - CITY
      ?auto_182092 - TRUCK
      ?auto_182089 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_182091 ?auto_182090 ) ( IN-CITY ?auto_182084 ?auto_182090 ) ( not ( = ?auto_182084 ?auto_182091 ) ) ( OBJ-AT ?auto_182087 ?auto_182084 ) ( not ( = ?auto_182087 ?auto_182085 ) ) ( OBJ-AT ?auto_182085 ?auto_182091 ) ( TRUCK-AT ?auto_182092 ?auto_182089 ) ( IN-CITY ?auto_182089 ?auto_182090 ) ( not ( = ?auto_182084 ?auto_182089 ) ) ( not ( = ?auto_182091 ?auto_182089 ) ) ( OBJ-AT ?auto_182086 ?auto_182084 ) ( OBJ-AT ?auto_182088 ?auto_182084 ) ( not ( = ?auto_182085 ?auto_182086 ) ) ( not ( = ?auto_182085 ?auto_182088 ) ) ( not ( = ?auto_182086 ?auto_182088 ) ) ( not ( = ?auto_182086 ?auto_182087 ) ) ( not ( = ?auto_182088 ?auto_182087 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_182087 ?auto_182085 ?auto_182084 )
      ( DELIVER-4PKG-VERIFY ?auto_182085 ?auto_182086 ?auto_182088 ?auto_182087 ?auto_182084 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_182368 - OBJ
      ?auto_182369 - OBJ
      ?auto_182370 - OBJ
      ?auto_182367 - LOCATION
    )
    :vars
    (
      ?auto_182373 - LOCATION
      ?auto_182371 - CITY
      ?auto_182374 - TRUCK
      ?auto_182372 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_182373 ?auto_182371 ) ( IN-CITY ?auto_182367 ?auto_182371 ) ( not ( = ?auto_182367 ?auto_182373 ) ) ( OBJ-AT ?auto_182368 ?auto_182367 ) ( not ( = ?auto_182368 ?auto_182370 ) ) ( OBJ-AT ?auto_182370 ?auto_182373 ) ( TRUCK-AT ?auto_182374 ?auto_182372 ) ( IN-CITY ?auto_182372 ?auto_182371 ) ( not ( = ?auto_182367 ?auto_182372 ) ) ( not ( = ?auto_182373 ?auto_182372 ) ) ( OBJ-AT ?auto_182369 ?auto_182367 ) ( not ( = ?auto_182368 ?auto_182369 ) ) ( not ( = ?auto_182369 ?auto_182370 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_182368 ?auto_182370 ?auto_182367 )
      ( DELIVER-3PKG-VERIFY ?auto_182368 ?auto_182369 ?auto_182370 ?auto_182367 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_182527 - OBJ
      ?auto_182528 - OBJ
      ?auto_182530 - OBJ
      ?auto_182529 - OBJ
      ?auto_182526 - LOCATION
    )
    :vars
    (
      ?auto_182533 - LOCATION
      ?auto_182531 - CITY
      ?auto_182534 - TRUCK
      ?auto_182532 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_182533 ?auto_182531 ) ( IN-CITY ?auto_182526 ?auto_182531 ) ( not ( = ?auto_182526 ?auto_182533 ) ) ( OBJ-AT ?auto_182528 ?auto_182526 ) ( not ( = ?auto_182528 ?auto_182529 ) ) ( OBJ-AT ?auto_182529 ?auto_182533 ) ( TRUCK-AT ?auto_182534 ?auto_182532 ) ( IN-CITY ?auto_182532 ?auto_182531 ) ( not ( = ?auto_182526 ?auto_182532 ) ) ( not ( = ?auto_182533 ?auto_182532 ) ) ( OBJ-AT ?auto_182527 ?auto_182526 ) ( OBJ-AT ?auto_182530 ?auto_182526 ) ( not ( = ?auto_182527 ?auto_182528 ) ) ( not ( = ?auto_182527 ?auto_182530 ) ) ( not ( = ?auto_182527 ?auto_182529 ) ) ( not ( = ?auto_182528 ?auto_182530 ) ) ( not ( = ?auto_182530 ?auto_182529 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_182528 ?auto_182529 ?auto_182526 )
      ( DELIVER-4PKG-VERIFY ?auto_182527 ?auto_182528 ?auto_182530 ?auto_182529 ?auto_182526 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_184535 - OBJ
      ?auto_184534 - LOCATION
    )
    :vars
    (
      ?auto_184536 - LOCATION
      ?auto_184537 - CITY
      ?auto_184538 - OBJ
      ?auto_184539 - TRUCK
      ?auto_184540 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_184536 ?auto_184537 ) ( IN-CITY ?auto_184534 ?auto_184537 ) ( not ( = ?auto_184534 ?auto_184536 ) ) ( not ( = ?auto_184538 ?auto_184535 ) ) ( OBJ-AT ?auto_184535 ?auto_184536 ) ( IN-TRUCK ?auto_184538 ?auto_184539 ) ( TRUCK-AT ?auto_184539 ?auto_184540 ) ( IN-CITY ?auto_184540 ?auto_184537 ) ( not ( = ?auto_184534 ?auto_184540 ) ) ( not ( = ?auto_184536 ?auto_184540 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_184539 ?auto_184540 ?auto_184534 ?auto_184537 )
      ( DELIVER-2PKG ?auto_184538 ?auto_184535 ?auto_184534 )
      ( DELIVER-1PKG-VERIFY ?auto_184535 ?auto_184534 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_184542 - OBJ
      ?auto_184543 - OBJ
      ?auto_184541 - LOCATION
    )
    :vars
    (
      ?auto_184547 - LOCATION
      ?auto_184546 - CITY
      ?auto_184545 - TRUCK
      ?auto_184544 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_184547 ?auto_184546 ) ( IN-CITY ?auto_184541 ?auto_184546 ) ( not ( = ?auto_184541 ?auto_184547 ) ) ( not ( = ?auto_184542 ?auto_184543 ) ) ( OBJ-AT ?auto_184543 ?auto_184547 ) ( IN-TRUCK ?auto_184542 ?auto_184545 ) ( TRUCK-AT ?auto_184545 ?auto_184544 ) ( IN-CITY ?auto_184544 ?auto_184546 ) ( not ( = ?auto_184541 ?auto_184544 ) ) ( not ( = ?auto_184547 ?auto_184544 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_184543 ?auto_184541 )
      ( DELIVER-2PKG-VERIFY ?auto_184542 ?auto_184543 ?auto_184541 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_184557 - OBJ
      ?auto_184558 - OBJ
      ?auto_184556 - LOCATION
    )
    :vars
    (
      ?auto_184562 - LOCATION
      ?auto_184560 - CITY
      ?auto_184561 - TRUCK
      ?auto_184559 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_184562 ?auto_184560 ) ( IN-CITY ?auto_184556 ?auto_184560 ) ( not ( = ?auto_184556 ?auto_184562 ) ) ( not ( = ?auto_184558 ?auto_184557 ) ) ( OBJ-AT ?auto_184557 ?auto_184562 ) ( IN-TRUCK ?auto_184558 ?auto_184561 ) ( TRUCK-AT ?auto_184561 ?auto_184559 ) ( IN-CITY ?auto_184559 ?auto_184560 ) ( not ( = ?auto_184556 ?auto_184559 ) ) ( not ( = ?auto_184562 ?auto_184559 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_184558 ?auto_184557 ?auto_184556 )
      ( DELIVER-2PKG-VERIFY ?auto_184557 ?auto_184558 ?auto_184556 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_185339 - OBJ
      ?auto_185338 - LOCATION
    )
    :vars
    (
      ?auto_185344 - LOCATION
      ?auto_185342 - CITY
      ?auto_185340 - OBJ
      ?auto_185343 - TRUCK
      ?auto_185341 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_185344 ?auto_185342 ) ( IN-CITY ?auto_185338 ?auto_185342 ) ( not ( = ?auto_185338 ?auto_185344 ) ) ( not ( = ?auto_185340 ?auto_185339 ) ) ( OBJ-AT ?auto_185339 ?auto_185344 ) ( TRUCK-AT ?auto_185343 ?auto_185341 ) ( IN-CITY ?auto_185341 ?auto_185342 ) ( not ( = ?auto_185338 ?auto_185341 ) ) ( not ( = ?auto_185344 ?auto_185341 ) ) ( OBJ-AT ?auto_185340 ?auto_185341 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_185340 ?auto_185343 ?auto_185341 )
      ( DELIVER-2PKG ?auto_185340 ?auto_185339 ?auto_185338 )
      ( DELIVER-1PKG-VERIFY ?auto_185339 ?auto_185338 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_185346 - OBJ
      ?auto_185347 - OBJ
      ?auto_185345 - LOCATION
    )
    :vars
    (
      ?auto_185348 - LOCATION
      ?auto_185350 - CITY
      ?auto_185349 - TRUCK
      ?auto_185351 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_185348 ?auto_185350 ) ( IN-CITY ?auto_185345 ?auto_185350 ) ( not ( = ?auto_185345 ?auto_185348 ) ) ( not ( = ?auto_185346 ?auto_185347 ) ) ( OBJ-AT ?auto_185347 ?auto_185348 ) ( TRUCK-AT ?auto_185349 ?auto_185351 ) ( IN-CITY ?auto_185351 ?auto_185350 ) ( not ( = ?auto_185345 ?auto_185351 ) ) ( not ( = ?auto_185348 ?auto_185351 ) ) ( OBJ-AT ?auto_185346 ?auto_185351 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_185347 ?auto_185345 )
      ( DELIVER-2PKG-VERIFY ?auto_185346 ?auto_185347 ?auto_185345 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_185356 - OBJ
      ?auto_185357 - OBJ
      ?auto_185355 - LOCATION
    )
    :vars
    (
      ?auto_185359 - LOCATION
      ?auto_185360 - CITY
      ?auto_185358 - TRUCK
      ?auto_185361 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_185359 ?auto_185360 ) ( IN-CITY ?auto_185355 ?auto_185360 ) ( not ( = ?auto_185355 ?auto_185359 ) ) ( not ( = ?auto_185357 ?auto_185356 ) ) ( OBJ-AT ?auto_185356 ?auto_185359 ) ( TRUCK-AT ?auto_185358 ?auto_185361 ) ( IN-CITY ?auto_185361 ?auto_185360 ) ( not ( = ?auto_185355 ?auto_185361 ) ) ( not ( = ?auto_185359 ?auto_185361 ) ) ( OBJ-AT ?auto_185357 ?auto_185361 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_185357 ?auto_185356 ?auto_185355 )
      ( DELIVER-2PKG-VERIFY ?auto_185356 ?auto_185357 ?auto_185355 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_189135 - OBJ
      ?auto_189136 - OBJ
      ?auto_189137 - OBJ
      ?auto_189134 - LOCATION
    )
    :vars
    (
      ?auto_189138 - TRUCK
      ?auto_189139 - LOCATION
      ?auto_189140 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_189136 ?auto_189138 ) ( TRUCK-AT ?auto_189138 ?auto_189139 ) ( IN-CITY ?auto_189139 ?auto_189140 ) ( IN-CITY ?auto_189134 ?auto_189140 ) ( not ( = ?auto_189134 ?auto_189139 ) ) ( OBJ-AT ?auto_189135 ?auto_189134 ) ( not ( = ?auto_189135 ?auto_189136 ) ) ( OBJ-AT ?auto_189137 ?auto_189134 ) ( not ( = ?auto_189135 ?auto_189137 ) ) ( not ( = ?auto_189136 ?auto_189137 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_189135 ?auto_189136 ?auto_189134 )
      ( DELIVER-3PKG-VERIFY ?auto_189135 ?auto_189136 ?auto_189137 ?auto_189134 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_189237 - OBJ
      ?auto_189238 - OBJ
      ?auto_189239 - OBJ
      ?auto_189236 - LOCATION
    )
    :vars
    (
      ?auto_189240 - TRUCK
      ?auto_189241 - LOCATION
      ?auto_189242 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_189237 ?auto_189240 ) ( TRUCK-AT ?auto_189240 ?auto_189241 ) ( IN-CITY ?auto_189241 ?auto_189242 ) ( IN-CITY ?auto_189236 ?auto_189242 ) ( not ( = ?auto_189236 ?auto_189241 ) ) ( OBJ-AT ?auto_189238 ?auto_189236 ) ( not ( = ?auto_189238 ?auto_189237 ) ) ( OBJ-AT ?auto_189239 ?auto_189236 ) ( not ( = ?auto_189237 ?auto_189239 ) ) ( not ( = ?auto_189238 ?auto_189239 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_189238 ?auto_189237 ?auto_189236 )
      ( DELIVER-3PKG-VERIFY ?auto_189237 ?auto_189238 ?auto_189239 ?auto_189236 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_195858 - OBJ
      ?auto_195859 - OBJ
      ?auto_195860 - OBJ
      ?auto_195857 - LOCATION
    )
    :vars
    (
      ?auto_195861 - LOCATION
      ?auto_195864 - CITY
      ?auto_195862 - TRUCK
      ?auto_195863 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_195861 ?auto_195864 ) ( IN-CITY ?auto_195857 ?auto_195864 ) ( not ( = ?auto_195857 ?auto_195861 ) ) ( OBJ-AT ?auto_195858 ?auto_195857 ) ( not ( = ?auto_195858 ?auto_195859 ) ) ( OBJ-AT ?auto_195859 ?auto_195861 ) ( TRUCK-AT ?auto_195862 ?auto_195863 ) ( IN-CITY ?auto_195863 ?auto_195864 ) ( not ( = ?auto_195857 ?auto_195863 ) ) ( not ( = ?auto_195861 ?auto_195863 ) ) ( OBJ-AT ?auto_195860 ?auto_195857 ) ( not ( = ?auto_195858 ?auto_195860 ) ) ( not ( = ?auto_195859 ?auto_195860 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_195858 ?auto_195859 ?auto_195857 )
      ( DELIVER-3PKG-VERIFY ?auto_195858 ?auto_195859 ?auto_195860 ?auto_195857 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_195890 - OBJ
      ?auto_195891 - OBJ
      ?auto_195892 - OBJ
      ?auto_195889 - LOCATION
    )
    :vars
    (
      ?auto_195894 - LOCATION
      ?auto_195897 - CITY
      ?auto_195893 - OBJ
      ?auto_195895 - TRUCK
      ?auto_195896 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_195894 ?auto_195897 ) ( IN-CITY ?auto_195889 ?auto_195897 ) ( not ( = ?auto_195889 ?auto_195894 ) ) ( OBJ-AT ?auto_195893 ?auto_195889 ) ( not ( = ?auto_195893 ?auto_195892 ) ) ( OBJ-AT ?auto_195892 ?auto_195894 ) ( TRUCK-AT ?auto_195895 ?auto_195896 ) ( IN-CITY ?auto_195896 ?auto_195897 ) ( not ( = ?auto_195889 ?auto_195896 ) ) ( not ( = ?auto_195894 ?auto_195896 ) ) ( OBJ-AT ?auto_195890 ?auto_195889 ) ( OBJ-AT ?auto_195891 ?auto_195889 ) ( not ( = ?auto_195890 ?auto_195891 ) ) ( not ( = ?auto_195890 ?auto_195892 ) ) ( not ( = ?auto_195890 ?auto_195893 ) ) ( not ( = ?auto_195891 ?auto_195892 ) ) ( not ( = ?auto_195891 ?auto_195893 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_195893 ?auto_195892 ?auto_195889 )
      ( DELIVER-3PKG-VERIFY ?auto_195890 ?auto_195891 ?auto_195892 ?auto_195889 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_195912 - OBJ
      ?auto_195913 - OBJ
      ?auto_195914 - OBJ
      ?auto_195911 - LOCATION
    )
    :vars
    (
      ?auto_195916 - LOCATION
      ?auto_195919 - CITY
      ?auto_195915 - OBJ
      ?auto_195917 - TRUCK
      ?auto_195918 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_195916 ?auto_195919 ) ( IN-CITY ?auto_195911 ?auto_195919 ) ( not ( = ?auto_195911 ?auto_195916 ) ) ( OBJ-AT ?auto_195915 ?auto_195911 ) ( not ( = ?auto_195915 ?auto_195913 ) ) ( OBJ-AT ?auto_195913 ?auto_195916 ) ( TRUCK-AT ?auto_195917 ?auto_195918 ) ( IN-CITY ?auto_195918 ?auto_195919 ) ( not ( = ?auto_195911 ?auto_195918 ) ) ( not ( = ?auto_195916 ?auto_195918 ) ) ( OBJ-AT ?auto_195912 ?auto_195911 ) ( OBJ-AT ?auto_195914 ?auto_195911 ) ( not ( = ?auto_195912 ?auto_195913 ) ) ( not ( = ?auto_195912 ?auto_195914 ) ) ( not ( = ?auto_195912 ?auto_195915 ) ) ( not ( = ?auto_195913 ?auto_195914 ) ) ( not ( = ?auto_195914 ?auto_195915 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_195915 ?auto_195913 ?auto_195911 )
      ( DELIVER-3PKG-VERIFY ?auto_195912 ?auto_195913 ?auto_195914 ?auto_195911 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_196000 - OBJ
      ?auto_196001 - OBJ
      ?auto_196002 - OBJ
      ?auto_195999 - LOCATION
    )
    :vars
    (
      ?auto_196003 - LOCATION
      ?auto_196006 - CITY
      ?auto_196004 - TRUCK
      ?auto_196005 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_196003 ?auto_196006 ) ( IN-CITY ?auto_195999 ?auto_196006 ) ( not ( = ?auto_195999 ?auto_196003 ) ) ( OBJ-AT ?auto_196002 ?auto_195999 ) ( not ( = ?auto_196002 ?auto_196000 ) ) ( OBJ-AT ?auto_196000 ?auto_196003 ) ( TRUCK-AT ?auto_196004 ?auto_196005 ) ( IN-CITY ?auto_196005 ?auto_196006 ) ( not ( = ?auto_195999 ?auto_196005 ) ) ( not ( = ?auto_196003 ?auto_196005 ) ) ( OBJ-AT ?auto_196001 ?auto_195999 ) ( not ( = ?auto_196000 ?auto_196001 ) ) ( not ( = ?auto_196001 ?auto_196002 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_196002 ?auto_196000 ?auto_195999 )
      ( DELIVER-3PKG-VERIFY ?auto_196000 ?auto_196001 ?auto_196002 ?auto_195999 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_196032 - OBJ
      ?auto_196033 - OBJ
      ?auto_196034 - OBJ
      ?auto_196031 - LOCATION
    )
    :vars
    (
      ?auto_196036 - LOCATION
      ?auto_196039 - CITY
      ?auto_196035 - OBJ
      ?auto_196037 - TRUCK
      ?auto_196038 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_196036 ?auto_196039 ) ( IN-CITY ?auto_196031 ?auto_196039 ) ( not ( = ?auto_196031 ?auto_196036 ) ) ( OBJ-AT ?auto_196035 ?auto_196031 ) ( not ( = ?auto_196035 ?auto_196032 ) ) ( OBJ-AT ?auto_196032 ?auto_196036 ) ( TRUCK-AT ?auto_196037 ?auto_196038 ) ( IN-CITY ?auto_196038 ?auto_196039 ) ( not ( = ?auto_196031 ?auto_196038 ) ) ( not ( = ?auto_196036 ?auto_196038 ) ) ( OBJ-AT ?auto_196033 ?auto_196031 ) ( OBJ-AT ?auto_196034 ?auto_196031 ) ( not ( = ?auto_196032 ?auto_196033 ) ) ( not ( = ?auto_196032 ?auto_196034 ) ) ( not ( = ?auto_196033 ?auto_196034 ) ) ( not ( = ?auto_196033 ?auto_196035 ) ) ( not ( = ?auto_196034 ?auto_196035 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_196035 ?auto_196032 ?auto_196031 )
      ( DELIVER-3PKG-VERIFY ?auto_196032 ?auto_196033 ?auto_196034 ?auto_196031 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_196156 - OBJ
      ?auto_196157 - OBJ
      ?auto_196159 - OBJ
      ?auto_196158 - OBJ
      ?auto_196155 - LOCATION
    )
    :vars
    (
      ?auto_196160 - LOCATION
      ?auto_196163 - CITY
      ?auto_196161 - TRUCK
      ?auto_196162 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_196160 ?auto_196163 ) ( IN-CITY ?auto_196155 ?auto_196163 ) ( not ( = ?auto_196155 ?auto_196160 ) ) ( OBJ-AT ?auto_196157 ?auto_196155 ) ( not ( = ?auto_196157 ?auto_196159 ) ) ( OBJ-AT ?auto_196159 ?auto_196160 ) ( TRUCK-AT ?auto_196161 ?auto_196162 ) ( IN-CITY ?auto_196162 ?auto_196163 ) ( not ( = ?auto_196155 ?auto_196162 ) ) ( not ( = ?auto_196160 ?auto_196162 ) ) ( OBJ-AT ?auto_196156 ?auto_196155 ) ( OBJ-AT ?auto_196158 ?auto_196155 ) ( not ( = ?auto_196156 ?auto_196157 ) ) ( not ( = ?auto_196156 ?auto_196159 ) ) ( not ( = ?auto_196156 ?auto_196158 ) ) ( not ( = ?auto_196157 ?auto_196158 ) ) ( not ( = ?auto_196159 ?auto_196158 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_196157 ?auto_196159 ?auto_196155 )
      ( DELIVER-4PKG-VERIFY ?auto_196156 ?auto_196157 ?auto_196159 ?auto_196158 ?auto_196155 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_196165 - OBJ
      ?auto_196166 - OBJ
      ?auto_196168 - OBJ
      ?auto_196167 - OBJ
      ?auto_196164 - LOCATION
    )
    :vars
    (
      ?auto_196169 - LOCATION
      ?auto_196172 - CITY
      ?auto_196170 - TRUCK
      ?auto_196171 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_196169 ?auto_196172 ) ( IN-CITY ?auto_196164 ?auto_196172 ) ( not ( = ?auto_196164 ?auto_196169 ) ) ( OBJ-AT ?auto_196165 ?auto_196164 ) ( not ( = ?auto_196165 ?auto_196168 ) ) ( OBJ-AT ?auto_196168 ?auto_196169 ) ( TRUCK-AT ?auto_196170 ?auto_196171 ) ( IN-CITY ?auto_196171 ?auto_196172 ) ( not ( = ?auto_196164 ?auto_196171 ) ) ( not ( = ?auto_196169 ?auto_196171 ) ) ( OBJ-AT ?auto_196166 ?auto_196164 ) ( OBJ-AT ?auto_196167 ?auto_196164 ) ( not ( = ?auto_196165 ?auto_196166 ) ) ( not ( = ?auto_196165 ?auto_196167 ) ) ( not ( = ?auto_196166 ?auto_196168 ) ) ( not ( = ?auto_196166 ?auto_196167 ) ) ( not ( = ?auto_196168 ?auto_196167 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_196165 ?auto_196168 ?auto_196164 )
      ( DELIVER-4PKG-VERIFY ?auto_196165 ?auto_196166 ?auto_196168 ?auto_196167 ?auto_196164 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_196192 - OBJ
      ?auto_196193 - OBJ
      ?auto_196195 - OBJ
      ?auto_196194 - OBJ
      ?auto_196191 - LOCATION
    )
    :vars
    (
      ?auto_196196 - LOCATION
      ?auto_196199 - CITY
      ?auto_196197 - TRUCK
      ?auto_196198 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_196196 ?auto_196199 ) ( IN-CITY ?auto_196191 ?auto_196199 ) ( not ( = ?auto_196191 ?auto_196196 ) ) ( OBJ-AT ?auto_196195 ?auto_196191 ) ( not ( = ?auto_196195 ?auto_196194 ) ) ( OBJ-AT ?auto_196194 ?auto_196196 ) ( TRUCK-AT ?auto_196197 ?auto_196198 ) ( IN-CITY ?auto_196198 ?auto_196199 ) ( not ( = ?auto_196191 ?auto_196198 ) ) ( not ( = ?auto_196196 ?auto_196198 ) ) ( OBJ-AT ?auto_196192 ?auto_196191 ) ( OBJ-AT ?auto_196193 ?auto_196191 ) ( not ( = ?auto_196192 ?auto_196193 ) ) ( not ( = ?auto_196192 ?auto_196195 ) ) ( not ( = ?auto_196192 ?auto_196194 ) ) ( not ( = ?auto_196193 ?auto_196195 ) ) ( not ( = ?auto_196193 ?auto_196194 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_196195 ?auto_196194 ?auto_196191 )
      ( DELIVER-4PKG-VERIFY ?auto_196192 ?auto_196193 ?auto_196195 ?auto_196194 ?auto_196191 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_196327 - OBJ
      ?auto_196328 - OBJ
      ?auto_196330 - OBJ
      ?auto_196329 - OBJ
      ?auto_196326 - LOCATION
    )
    :vars
    (
      ?auto_196331 - LOCATION
      ?auto_196334 - CITY
      ?auto_196332 - TRUCK
      ?auto_196333 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_196331 ?auto_196334 ) ( IN-CITY ?auto_196326 ?auto_196334 ) ( not ( = ?auto_196326 ?auto_196331 ) ) ( OBJ-AT ?auto_196330 ?auto_196326 ) ( not ( = ?auto_196330 ?auto_196328 ) ) ( OBJ-AT ?auto_196328 ?auto_196331 ) ( TRUCK-AT ?auto_196332 ?auto_196333 ) ( IN-CITY ?auto_196333 ?auto_196334 ) ( not ( = ?auto_196326 ?auto_196333 ) ) ( not ( = ?auto_196331 ?auto_196333 ) ) ( OBJ-AT ?auto_196327 ?auto_196326 ) ( OBJ-AT ?auto_196329 ?auto_196326 ) ( not ( = ?auto_196327 ?auto_196328 ) ) ( not ( = ?auto_196327 ?auto_196330 ) ) ( not ( = ?auto_196327 ?auto_196329 ) ) ( not ( = ?auto_196328 ?auto_196329 ) ) ( not ( = ?auto_196330 ?auto_196329 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_196330 ?auto_196328 ?auto_196326 )
      ( DELIVER-4PKG-VERIFY ?auto_196327 ?auto_196328 ?auto_196330 ?auto_196329 ?auto_196326 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_196354 - OBJ
      ?auto_196355 - OBJ
      ?auto_196357 - OBJ
      ?auto_196356 - OBJ
      ?auto_196353 - LOCATION
    )
    :vars
    (
      ?auto_196358 - LOCATION
      ?auto_196361 - CITY
      ?auto_196359 - TRUCK
      ?auto_196360 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_196358 ?auto_196361 ) ( IN-CITY ?auto_196353 ?auto_196361 ) ( not ( = ?auto_196353 ?auto_196358 ) ) ( OBJ-AT ?auto_196356 ?auto_196353 ) ( not ( = ?auto_196356 ?auto_196355 ) ) ( OBJ-AT ?auto_196355 ?auto_196358 ) ( TRUCK-AT ?auto_196359 ?auto_196360 ) ( IN-CITY ?auto_196360 ?auto_196361 ) ( not ( = ?auto_196353 ?auto_196360 ) ) ( not ( = ?auto_196358 ?auto_196360 ) ) ( OBJ-AT ?auto_196354 ?auto_196353 ) ( OBJ-AT ?auto_196357 ?auto_196353 ) ( not ( = ?auto_196354 ?auto_196355 ) ) ( not ( = ?auto_196354 ?auto_196357 ) ) ( not ( = ?auto_196354 ?auto_196356 ) ) ( not ( = ?auto_196355 ?auto_196357 ) ) ( not ( = ?auto_196357 ?auto_196356 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_196356 ?auto_196355 ?auto_196353 )
      ( DELIVER-4PKG-VERIFY ?auto_196354 ?auto_196355 ?auto_196357 ?auto_196356 ?auto_196353 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_196534 - OBJ
      ?auto_196535 - OBJ
      ?auto_196537 - OBJ
      ?auto_196536 - OBJ
      ?auto_196533 - LOCATION
    )
    :vars
    (
      ?auto_196539 - LOCATION
      ?auto_196542 - CITY
      ?auto_196538 - OBJ
      ?auto_196540 - TRUCK
      ?auto_196541 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_196539 ?auto_196542 ) ( IN-CITY ?auto_196533 ?auto_196542 ) ( not ( = ?auto_196533 ?auto_196539 ) ) ( OBJ-AT ?auto_196538 ?auto_196533 ) ( not ( = ?auto_196538 ?auto_196536 ) ) ( OBJ-AT ?auto_196536 ?auto_196539 ) ( TRUCK-AT ?auto_196540 ?auto_196541 ) ( IN-CITY ?auto_196541 ?auto_196542 ) ( not ( = ?auto_196533 ?auto_196541 ) ) ( not ( = ?auto_196539 ?auto_196541 ) ) ( OBJ-AT ?auto_196534 ?auto_196533 ) ( OBJ-AT ?auto_196535 ?auto_196533 ) ( OBJ-AT ?auto_196537 ?auto_196533 ) ( not ( = ?auto_196534 ?auto_196535 ) ) ( not ( = ?auto_196534 ?auto_196537 ) ) ( not ( = ?auto_196534 ?auto_196536 ) ) ( not ( = ?auto_196534 ?auto_196538 ) ) ( not ( = ?auto_196535 ?auto_196537 ) ) ( not ( = ?auto_196535 ?auto_196536 ) ) ( not ( = ?auto_196535 ?auto_196538 ) ) ( not ( = ?auto_196537 ?auto_196536 ) ) ( not ( = ?auto_196537 ?auto_196538 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_196538 ?auto_196536 ?auto_196533 )
      ( DELIVER-4PKG-VERIFY ?auto_196534 ?auto_196535 ?auto_196537 ?auto_196536 ?auto_196533 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_196563 - OBJ
      ?auto_196564 - OBJ
      ?auto_196566 - OBJ
      ?auto_196565 - OBJ
      ?auto_196562 - LOCATION
    )
    :vars
    (
      ?auto_196568 - LOCATION
      ?auto_196571 - CITY
      ?auto_196567 - OBJ
      ?auto_196569 - TRUCK
      ?auto_196570 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_196568 ?auto_196571 ) ( IN-CITY ?auto_196562 ?auto_196571 ) ( not ( = ?auto_196562 ?auto_196568 ) ) ( OBJ-AT ?auto_196567 ?auto_196562 ) ( not ( = ?auto_196567 ?auto_196566 ) ) ( OBJ-AT ?auto_196566 ?auto_196568 ) ( TRUCK-AT ?auto_196569 ?auto_196570 ) ( IN-CITY ?auto_196570 ?auto_196571 ) ( not ( = ?auto_196562 ?auto_196570 ) ) ( not ( = ?auto_196568 ?auto_196570 ) ) ( OBJ-AT ?auto_196563 ?auto_196562 ) ( OBJ-AT ?auto_196564 ?auto_196562 ) ( OBJ-AT ?auto_196565 ?auto_196562 ) ( not ( = ?auto_196563 ?auto_196564 ) ) ( not ( = ?auto_196563 ?auto_196566 ) ) ( not ( = ?auto_196563 ?auto_196565 ) ) ( not ( = ?auto_196563 ?auto_196567 ) ) ( not ( = ?auto_196564 ?auto_196566 ) ) ( not ( = ?auto_196564 ?auto_196565 ) ) ( not ( = ?auto_196564 ?auto_196567 ) ) ( not ( = ?auto_196566 ?auto_196565 ) ) ( not ( = ?auto_196565 ?auto_196567 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_196567 ?auto_196566 ?auto_196562 )
      ( DELIVER-4PKG-VERIFY ?auto_196563 ?auto_196564 ?auto_196566 ?auto_196565 ?auto_196562 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_196706 - OBJ
      ?auto_196707 - OBJ
      ?auto_196709 - OBJ
      ?auto_196708 - OBJ
      ?auto_196705 - LOCATION
    )
    :vars
    (
      ?auto_196711 - LOCATION
      ?auto_196714 - CITY
      ?auto_196710 - OBJ
      ?auto_196712 - TRUCK
      ?auto_196713 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_196711 ?auto_196714 ) ( IN-CITY ?auto_196705 ?auto_196714 ) ( not ( = ?auto_196705 ?auto_196711 ) ) ( OBJ-AT ?auto_196710 ?auto_196705 ) ( not ( = ?auto_196710 ?auto_196707 ) ) ( OBJ-AT ?auto_196707 ?auto_196711 ) ( TRUCK-AT ?auto_196712 ?auto_196713 ) ( IN-CITY ?auto_196713 ?auto_196714 ) ( not ( = ?auto_196705 ?auto_196713 ) ) ( not ( = ?auto_196711 ?auto_196713 ) ) ( OBJ-AT ?auto_196706 ?auto_196705 ) ( OBJ-AT ?auto_196709 ?auto_196705 ) ( OBJ-AT ?auto_196708 ?auto_196705 ) ( not ( = ?auto_196706 ?auto_196707 ) ) ( not ( = ?auto_196706 ?auto_196709 ) ) ( not ( = ?auto_196706 ?auto_196708 ) ) ( not ( = ?auto_196706 ?auto_196710 ) ) ( not ( = ?auto_196707 ?auto_196709 ) ) ( not ( = ?auto_196707 ?auto_196708 ) ) ( not ( = ?auto_196709 ?auto_196708 ) ) ( not ( = ?auto_196709 ?auto_196710 ) ) ( not ( = ?auto_196708 ?auto_196710 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_196710 ?auto_196707 ?auto_196705 )
      ( DELIVER-4PKG-VERIFY ?auto_196706 ?auto_196707 ?auto_196709 ?auto_196708 ?auto_196705 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_197175 - OBJ
      ?auto_197176 - OBJ
      ?auto_197178 - OBJ
      ?auto_197177 - OBJ
      ?auto_197174 - LOCATION
    )
    :vars
    (
      ?auto_197179 - LOCATION
      ?auto_197182 - CITY
      ?auto_197180 - TRUCK
      ?auto_197181 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_197179 ?auto_197182 ) ( IN-CITY ?auto_197174 ?auto_197182 ) ( not ( = ?auto_197174 ?auto_197179 ) ) ( OBJ-AT ?auto_197178 ?auto_197174 ) ( not ( = ?auto_197178 ?auto_197175 ) ) ( OBJ-AT ?auto_197175 ?auto_197179 ) ( TRUCK-AT ?auto_197180 ?auto_197181 ) ( IN-CITY ?auto_197181 ?auto_197182 ) ( not ( = ?auto_197174 ?auto_197181 ) ) ( not ( = ?auto_197179 ?auto_197181 ) ) ( OBJ-AT ?auto_197176 ?auto_197174 ) ( OBJ-AT ?auto_197177 ?auto_197174 ) ( not ( = ?auto_197175 ?auto_197176 ) ) ( not ( = ?auto_197175 ?auto_197177 ) ) ( not ( = ?auto_197176 ?auto_197178 ) ) ( not ( = ?auto_197176 ?auto_197177 ) ) ( not ( = ?auto_197178 ?auto_197177 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_197178 ?auto_197175 ?auto_197174 )
      ( DELIVER-4PKG-VERIFY ?auto_197175 ?auto_197176 ?auto_197178 ?auto_197177 ?auto_197174 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_197202 - OBJ
      ?auto_197203 - OBJ
      ?auto_197205 - OBJ
      ?auto_197204 - OBJ
      ?auto_197201 - LOCATION
    )
    :vars
    (
      ?auto_197206 - LOCATION
      ?auto_197209 - CITY
      ?auto_197207 - TRUCK
      ?auto_197208 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_197206 ?auto_197209 ) ( IN-CITY ?auto_197201 ?auto_197209 ) ( not ( = ?auto_197201 ?auto_197206 ) ) ( OBJ-AT ?auto_197203 ?auto_197201 ) ( not ( = ?auto_197203 ?auto_197202 ) ) ( OBJ-AT ?auto_197202 ?auto_197206 ) ( TRUCK-AT ?auto_197207 ?auto_197208 ) ( IN-CITY ?auto_197208 ?auto_197209 ) ( not ( = ?auto_197201 ?auto_197208 ) ) ( not ( = ?auto_197206 ?auto_197208 ) ) ( OBJ-AT ?auto_197205 ?auto_197201 ) ( OBJ-AT ?auto_197204 ?auto_197201 ) ( not ( = ?auto_197202 ?auto_197205 ) ) ( not ( = ?auto_197202 ?auto_197204 ) ) ( not ( = ?auto_197203 ?auto_197205 ) ) ( not ( = ?auto_197203 ?auto_197204 ) ) ( not ( = ?auto_197205 ?auto_197204 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_197203 ?auto_197202 ?auto_197201 )
      ( DELIVER-4PKG-VERIFY ?auto_197202 ?auto_197203 ?auto_197205 ?auto_197204 ?auto_197201 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_197355 - OBJ
      ?auto_197356 - OBJ
      ?auto_197358 - OBJ
      ?auto_197357 - OBJ
      ?auto_197354 - LOCATION
    )
    :vars
    (
      ?auto_197360 - LOCATION
      ?auto_197363 - CITY
      ?auto_197359 - OBJ
      ?auto_197361 - TRUCK
      ?auto_197362 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_197360 ?auto_197363 ) ( IN-CITY ?auto_197354 ?auto_197363 ) ( not ( = ?auto_197354 ?auto_197360 ) ) ( OBJ-AT ?auto_197359 ?auto_197354 ) ( not ( = ?auto_197359 ?auto_197355 ) ) ( OBJ-AT ?auto_197355 ?auto_197360 ) ( TRUCK-AT ?auto_197361 ?auto_197362 ) ( IN-CITY ?auto_197362 ?auto_197363 ) ( not ( = ?auto_197354 ?auto_197362 ) ) ( not ( = ?auto_197360 ?auto_197362 ) ) ( OBJ-AT ?auto_197356 ?auto_197354 ) ( OBJ-AT ?auto_197358 ?auto_197354 ) ( OBJ-AT ?auto_197357 ?auto_197354 ) ( not ( = ?auto_197355 ?auto_197356 ) ) ( not ( = ?auto_197355 ?auto_197358 ) ) ( not ( = ?auto_197355 ?auto_197357 ) ) ( not ( = ?auto_197356 ?auto_197358 ) ) ( not ( = ?auto_197356 ?auto_197357 ) ) ( not ( = ?auto_197356 ?auto_197359 ) ) ( not ( = ?auto_197358 ?auto_197357 ) ) ( not ( = ?auto_197358 ?auto_197359 ) ) ( not ( = ?auto_197357 ?auto_197359 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_197359 ?auto_197355 ?auto_197354 )
      ( DELIVER-4PKG-VERIFY ?auto_197355 ?auto_197356 ?auto_197358 ?auto_197357 ?auto_197354 ) )
  )

)

