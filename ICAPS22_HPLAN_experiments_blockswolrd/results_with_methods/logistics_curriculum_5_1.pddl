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
      ?auto_59180 - OBJ
      ?auto_59179 - LOCATION
    )
    :vars
    (
      ?auto_59182 - LOCATION
      ?auto_59183 - CITY
      ?auto_59181 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_59182 ?auto_59183 ) ( IN-CITY ?auto_59179 ?auto_59183 ) ( not ( = ?auto_59179 ?auto_59182 ) ) ( OBJ-AT ?auto_59180 ?auto_59182 ) ( TRUCK-AT ?auto_59181 ?auto_59179 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_59181 ?auto_59179 ?auto_59182 ?auto_59183 )
      ( !LOAD-TRUCK ?auto_59180 ?auto_59181 ?auto_59182 )
      ( !DRIVE-TRUCK ?auto_59181 ?auto_59182 ?auto_59179 ?auto_59183 )
      ( !UNLOAD-TRUCK ?auto_59180 ?auto_59181 ?auto_59179 )
      ( DELIVER-1PKG-VERIFY ?auto_59180 ?auto_59179 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_59187 - OBJ
      ?auto_59186 - LOCATION
    )
    :vars
    (
      ?auto_59189 - LOCATION
      ?auto_59190 - CITY
      ?auto_59188 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_59189 ?auto_59190 ) ( IN-CITY ?auto_59186 ?auto_59190 ) ( not ( = ?auto_59186 ?auto_59189 ) ) ( OBJ-AT ?auto_59187 ?auto_59189 ) ( TRUCK-AT ?auto_59188 ?auto_59186 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_59188 ?auto_59186 ?auto_59189 ?auto_59190 )
      ( !LOAD-TRUCK ?auto_59187 ?auto_59188 ?auto_59189 )
      ( !DRIVE-TRUCK ?auto_59188 ?auto_59189 ?auto_59186 ?auto_59190 )
      ( !UNLOAD-TRUCK ?auto_59187 ?auto_59188 ?auto_59186 )
      ( DELIVER-1PKG-VERIFY ?auto_59187 ?auto_59186 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_59201 - OBJ
      ?auto_59202 - OBJ
      ?auto_59200 - LOCATION
    )
    :vars
    (
      ?auto_59203 - LOCATION
      ?auto_59204 - CITY
      ?auto_59206 - LOCATION
      ?auto_59205 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_59203 ?auto_59204 ) ( IN-CITY ?auto_59200 ?auto_59204 ) ( not ( = ?auto_59200 ?auto_59203 ) ) ( OBJ-AT ?auto_59202 ?auto_59203 ) ( IN-CITY ?auto_59206 ?auto_59204 ) ( not ( = ?auto_59200 ?auto_59206 ) ) ( OBJ-AT ?auto_59201 ?auto_59206 ) ( TRUCK-AT ?auto_59205 ?auto_59200 ) ( not ( = ?auto_59201 ?auto_59202 ) ) ( not ( = ?auto_59203 ?auto_59206 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_59201 ?auto_59200 )
      ( DELIVER-1PKG ?auto_59202 ?auto_59200 )
      ( DELIVER-2PKG-VERIFY ?auto_59201 ?auto_59202 ?auto_59200 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_59208 - OBJ
      ?auto_59209 - OBJ
      ?auto_59207 - LOCATION
    )
    :vars
    (
      ?auto_59210 - LOCATION
      ?auto_59212 - CITY
      ?auto_59211 - LOCATION
      ?auto_59213 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_59210 ?auto_59212 ) ( IN-CITY ?auto_59207 ?auto_59212 ) ( not ( = ?auto_59207 ?auto_59210 ) ) ( OBJ-AT ?auto_59208 ?auto_59210 ) ( IN-CITY ?auto_59211 ?auto_59212 ) ( not ( = ?auto_59207 ?auto_59211 ) ) ( OBJ-AT ?auto_59209 ?auto_59211 ) ( TRUCK-AT ?auto_59213 ?auto_59207 ) ( not ( = ?auto_59209 ?auto_59208 ) ) ( not ( = ?auto_59210 ?auto_59211 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_59209 ?auto_59208 ?auto_59207 )
      ( DELIVER-2PKG-VERIFY ?auto_59208 ?auto_59209 ?auto_59207 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_59225 - OBJ
      ?auto_59224 - LOCATION
    )
    :vars
    (
      ?auto_59227 - LOCATION
      ?auto_59228 - CITY
      ?auto_59226 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_59227 ?auto_59228 ) ( IN-CITY ?auto_59224 ?auto_59228 ) ( not ( = ?auto_59224 ?auto_59227 ) ) ( OBJ-AT ?auto_59225 ?auto_59227 ) ( TRUCK-AT ?auto_59226 ?auto_59224 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_59226 ?auto_59224 ?auto_59227 ?auto_59228 )
      ( !LOAD-TRUCK ?auto_59225 ?auto_59226 ?auto_59227 )
      ( !DRIVE-TRUCK ?auto_59226 ?auto_59227 ?auto_59224 ?auto_59228 )
      ( !UNLOAD-TRUCK ?auto_59225 ?auto_59226 ?auto_59224 )
      ( DELIVER-1PKG-VERIFY ?auto_59225 ?auto_59224 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_59316 - OBJ
      ?auto_59317 - OBJ
      ?auto_59318 - OBJ
      ?auto_59315 - LOCATION
    )
    :vars
    (
      ?auto_59321 - LOCATION
      ?auto_59319 - CITY
      ?auto_59322 - LOCATION
      ?auto_59323 - LOCATION
      ?auto_59320 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_59321 ?auto_59319 ) ( IN-CITY ?auto_59315 ?auto_59319 ) ( not ( = ?auto_59315 ?auto_59321 ) ) ( OBJ-AT ?auto_59318 ?auto_59321 ) ( IN-CITY ?auto_59322 ?auto_59319 ) ( not ( = ?auto_59315 ?auto_59322 ) ) ( OBJ-AT ?auto_59317 ?auto_59322 ) ( IN-CITY ?auto_59323 ?auto_59319 ) ( not ( = ?auto_59315 ?auto_59323 ) ) ( OBJ-AT ?auto_59316 ?auto_59323 ) ( TRUCK-AT ?auto_59320 ?auto_59315 ) ( not ( = ?auto_59316 ?auto_59317 ) ) ( not ( = ?auto_59322 ?auto_59323 ) ) ( not ( = ?auto_59316 ?auto_59318 ) ) ( not ( = ?auto_59317 ?auto_59318 ) ) ( not ( = ?auto_59321 ?auto_59322 ) ) ( not ( = ?auto_59321 ?auto_59323 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_59317 ?auto_59316 ?auto_59315 )
      ( DELIVER-1PKG ?auto_59318 ?auto_59315 )
      ( DELIVER-3PKG-VERIFY ?auto_59316 ?auto_59317 ?auto_59318 ?auto_59315 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_59335 - OBJ
      ?auto_59336 - OBJ
      ?auto_59337 - OBJ
      ?auto_59334 - LOCATION
    )
    :vars
    (
      ?auto_59342 - LOCATION
      ?auto_59341 - CITY
      ?auto_59340 - LOCATION
      ?auto_59338 - LOCATION
      ?auto_59339 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_59342 ?auto_59341 ) ( IN-CITY ?auto_59334 ?auto_59341 ) ( not ( = ?auto_59334 ?auto_59342 ) ) ( OBJ-AT ?auto_59336 ?auto_59342 ) ( IN-CITY ?auto_59340 ?auto_59341 ) ( not ( = ?auto_59334 ?auto_59340 ) ) ( OBJ-AT ?auto_59337 ?auto_59340 ) ( IN-CITY ?auto_59338 ?auto_59341 ) ( not ( = ?auto_59334 ?auto_59338 ) ) ( OBJ-AT ?auto_59335 ?auto_59338 ) ( TRUCK-AT ?auto_59339 ?auto_59334 ) ( not ( = ?auto_59335 ?auto_59337 ) ) ( not ( = ?auto_59340 ?auto_59338 ) ) ( not ( = ?auto_59335 ?auto_59336 ) ) ( not ( = ?auto_59337 ?auto_59336 ) ) ( not ( = ?auto_59342 ?auto_59340 ) ) ( not ( = ?auto_59342 ?auto_59338 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_59335 ?auto_59337 ?auto_59336 ?auto_59334 )
      ( DELIVER-3PKG-VERIFY ?auto_59335 ?auto_59336 ?auto_59337 ?auto_59334 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_59354 - OBJ
      ?auto_59355 - OBJ
      ?auto_59356 - OBJ
      ?auto_59353 - LOCATION
    )
    :vars
    (
      ?auto_59358 - LOCATION
      ?auto_59357 - CITY
      ?auto_59359 - LOCATION
      ?auto_59361 - LOCATION
      ?auto_59360 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_59358 ?auto_59357 ) ( IN-CITY ?auto_59353 ?auto_59357 ) ( not ( = ?auto_59353 ?auto_59358 ) ) ( OBJ-AT ?auto_59356 ?auto_59358 ) ( IN-CITY ?auto_59359 ?auto_59357 ) ( not ( = ?auto_59353 ?auto_59359 ) ) ( OBJ-AT ?auto_59354 ?auto_59359 ) ( IN-CITY ?auto_59361 ?auto_59357 ) ( not ( = ?auto_59353 ?auto_59361 ) ) ( OBJ-AT ?auto_59355 ?auto_59361 ) ( TRUCK-AT ?auto_59360 ?auto_59353 ) ( not ( = ?auto_59355 ?auto_59354 ) ) ( not ( = ?auto_59359 ?auto_59361 ) ) ( not ( = ?auto_59355 ?auto_59356 ) ) ( not ( = ?auto_59354 ?auto_59356 ) ) ( not ( = ?auto_59358 ?auto_59359 ) ) ( not ( = ?auto_59358 ?auto_59361 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_59355 ?auto_59356 ?auto_59354 ?auto_59353 )
      ( DELIVER-3PKG-VERIFY ?auto_59354 ?auto_59355 ?auto_59356 ?auto_59353 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_59373 - OBJ
      ?auto_59374 - OBJ
      ?auto_59375 - OBJ
      ?auto_59372 - LOCATION
    )
    :vars
    (
      ?auto_59377 - LOCATION
      ?auto_59376 - CITY
      ?auto_59378 - LOCATION
      ?auto_59380 - LOCATION
      ?auto_59379 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_59377 ?auto_59376 ) ( IN-CITY ?auto_59372 ?auto_59376 ) ( not ( = ?auto_59372 ?auto_59377 ) ) ( OBJ-AT ?auto_59374 ?auto_59377 ) ( IN-CITY ?auto_59378 ?auto_59376 ) ( not ( = ?auto_59372 ?auto_59378 ) ) ( OBJ-AT ?auto_59373 ?auto_59378 ) ( IN-CITY ?auto_59380 ?auto_59376 ) ( not ( = ?auto_59372 ?auto_59380 ) ) ( OBJ-AT ?auto_59375 ?auto_59380 ) ( TRUCK-AT ?auto_59379 ?auto_59372 ) ( not ( = ?auto_59375 ?auto_59373 ) ) ( not ( = ?auto_59378 ?auto_59380 ) ) ( not ( = ?auto_59375 ?auto_59374 ) ) ( not ( = ?auto_59373 ?auto_59374 ) ) ( not ( = ?auto_59377 ?auto_59378 ) ) ( not ( = ?auto_59377 ?auto_59380 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_59375 ?auto_59374 ?auto_59373 ?auto_59372 )
      ( DELIVER-3PKG-VERIFY ?auto_59373 ?auto_59374 ?auto_59375 ?auto_59372 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_59412 - OBJ
      ?auto_59413 - OBJ
      ?auto_59414 - OBJ
      ?auto_59411 - LOCATION
    )
    :vars
    (
      ?auto_59416 - LOCATION
      ?auto_59415 - CITY
      ?auto_59417 - LOCATION
      ?auto_59419 - LOCATION
      ?auto_59418 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_59416 ?auto_59415 ) ( IN-CITY ?auto_59411 ?auto_59415 ) ( not ( = ?auto_59411 ?auto_59416 ) ) ( OBJ-AT ?auto_59412 ?auto_59416 ) ( IN-CITY ?auto_59417 ?auto_59415 ) ( not ( = ?auto_59411 ?auto_59417 ) ) ( OBJ-AT ?auto_59414 ?auto_59417 ) ( IN-CITY ?auto_59419 ?auto_59415 ) ( not ( = ?auto_59411 ?auto_59419 ) ) ( OBJ-AT ?auto_59413 ?auto_59419 ) ( TRUCK-AT ?auto_59418 ?auto_59411 ) ( not ( = ?auto_59413 ?auto_59414 ) ) ( not ( = ?auto_59417 ?auto_59419 ) ) ( not ( = ?auto_59413 ?auto_59412 ) ) ( not ( = ?auto_59414 ?auto_59412 ) ) ( not ( = ?auto_59416 ?auto_59417 ) ) ( not ( = ?auto_59416 ?auto_59419 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_59413 ?auto_59412 ?auto_59414 ?auto_59411 )
      ( DELIVER-3PKG-VERIFY ?auto_59412 ?auto_59413 ?auto_59414 ?auto_59411 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_59431 - OBJ
      ?auto_59432 - OBJ
      ?auto_59433 - OBJ
      ?auto_59430 - LOCATION
    )
    :vars
    (
      ?auto_59435 - LOCATION
      ?auto_59434 - CITY
      ?auto_59436 - LOCATION
      ?auto_59438 - LOCATION
      ?auto_59437 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_59435 ?auto_59434 ) ( IN-CITY ?auto_59430 ?auto_59434 ) ( not ( = ?auto_59430 ?auto_59435 ) ) ( OBJ-AT ?auto_59431 ?auto_59435 ) ( IN-CITY ?auto_59436 ?auto_59434 ) ( not ( = ?auto_59430 ?auto_59436 ) ) ( OBJ-AT ?auto_59432 ?auto_59436 ) ( IN-CITY ?auto_59438 ?auto_59434 ) ( not ( = ?auto_59430 ?auto_59438 ) ) ( OBJ-AT ?auto_59433 ?auto_59438 ) ( TRUCK-AT ?auto_59437 ?auto_59430 ) ( not ( = ?auto_59433 ?auto_59432 ) ) ( not ( = ?auto_59436 ?auto_59438 ) ) ( not ( = ?auto_59433 ?auto_59431 ) ) ( not ( = ?auto_59432 ?auto_59431 ) ) ( not ( = ?auto_59435 ?auto_59436 ) ) ( not ( = ?auto_59435 ?auto_59438 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_59433 ?auto_59431 ?auto_59432 ?auto_59430 )
      ( DELIVER-3PKG-VERIFY ?auto_59431 ?auto_59432 ?auto_59433 ?auto_59430 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_59493 - OBJ
      ?auto_59492 - LOCATION
    )
    :vars
    (
      ?auto_59495 - LOCATION
      ?auto_59496 - CITY
      ?auto_59494 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_59495 ?auto_59496 ) ( IN-CITY ?auto_59492 ?auto_59496 ) ( not ( = ?auto_59492 ?auto_59495 ) ) ( OBJ-AT ?auto_59493 ?auto_59495 ) ( TRUCK-AT ?auto_59494 ?auto_59492 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_59494 ?auto_59492 ?auto_59495 ?auto_59496 )
      ( !LOAD-TRUCK ?auto_59493 ?auto_59494 ?auto_59495 )
      ( !DRIVE-TRUCK ?auto_59494 ?auto_59495 ?auto_59492 ?auto_59496 )
      ( !UNLOAD-TRUCK ?auto_59493 ?auto_59494 ?auto_59492 )
      ( DELIVER-1PKG-VERIFY ?auto_59493 ?auto_59492 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_60484 - OBJ
      ?auto_60485 - OBJ
      ?auto_60486 - OBJ
      ?auto_60487 - OBJ
      ?auto_60483 - LOCATION
    )
    :vars
    (
      ?auto_60488 - LOCATION
      ?auto_60489 - CITY
      ?auto_60491 - LOCATION
      ?auto_60492 - LOCATION
      ?auto_60493 - LOCATION
      ?auto_60490 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_60488 ?auto_60489 ) ( IN-CITY ?auto_60483 ?auto_60489 ) ( not ( = ?auto_60483 ?auto_60488 ) ) ( OBJ-AT ?auto_60487 ?auto_60488 ) ( IN-CITY ?auto_60491 ?auto_60489 ) ( not ( = ?auto_60483 ?auto_60491 ) ) ( OBJ-AT ?auto_60486 ?auto_60491 ) ( IN-CITY ?auto_60492 ?auto_60489 ) ( not ( = ?auto_60483 ?auto_60492 ) ) ( OBJ-AT ?auto_60485 ?auto_60492 ) ( IN-CITY ?auto_60493 ?auto_60489 ) ( not ( = ?auto_60483 ?auto_60493 ) ) ( OBJ-AT ?auto_60484 ?auto_60493 ) ( TRUCK-AT ?auto_60490 ?auto_60483 ) ( not ( = ?auto_60484 ?auto_60485 ) ) ( not ( = ?auto_60492 ?auto_60493 ) ) ( not ( = ?auto_60484 ?auto_60486 ) ) ( not ( = ?auto_60485 ?auto_60486 ) ) ( not ( = ?auto_60491 ?auto_60492 ) ) ( not ( = ?auto_60491 ?auto_60493 ) ) ( not ( = ?auto_60484 ?auto_60487 ) ) ( not ( = ?auto_60485 ?auto_60487 ) ) ( not ( = ?auto_60486 ?auto_60487 ) ) ( not ( = ?auto_60488 ?auto_60491 ) ) ( not ( = ?auto_60488 ?auto_60492 ) ) ( not ( = ?auto_60488 ?auto_60493 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_60484 ?auto_60486 ?auto_60485 ?auto_60483 )
      ( DELIVER-1PKG ?auto_60487 ?auto_60483 )
      ( DELIVER-4PKG-VERIFY ?auto_60484 ?auto_60485 ?auto_60486 ?auto_60487 ?auto_60483 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_60519 - OBJ
      ?auto_60520 - OBJ
      ?auto_60521 - OBJ
      ?auto_60522 - OBJ
      ?auto_60518 - LOCATION
    )
    :vars
    (
      ?auto_60528 - LOCATION
      ?auto_60524 - CITY
      ?auto_60527 - LOCATION
      ?auto_60523 - LOCATION
      ?auto_60526 - LOCATION
      ?auto_60525 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_60528 ?auto_60524 ) ( IN-CITY ?auto_60518 ?auto_60524 ) ( not ( = ?auto_60518 ?auto_60528 ) ) ( OBJ-AT ?auto_60521 ?auto_60528 ) ( IN-CITY ?auto_60527 ?auto_60524 ) ( not ( = ?auto_60518 ?auto_60527 ) ) ( OBJ-AT ?auto_60522 ?auto_60527 ) ( IN-CITY ?auto_60523 ?auto_60524 ) ( not ( = ?auto_60518 ?auto_60523 ) ) ( OBJ-AT ?auto_60520 ?auto_60523 ) ( IN-CITY ?auto_60526 ?auto_60524 ) ( not ( = ?auto_60518 ?auto_60526 ) ) ( OBJ-AT ?auto_60519 ?auto_60526 ) ( TRUCK-AT ?auto_60525 ?auto_60518 ) ( not ( = ?auto_60519 ?auto_60520 ) ) ( not ( = ?auto_60523 ?auto_60526 ) ) ( not ( = ?auto_60519 ?auto_60522 ) ) ( not ( = ?auto_60520 ?auto_60522 ) ) ( not ( = ?auto_60527 ?auto_60523 ) ) ( not ( = ?auto_60527 ?auto_60526 ) ) ( not ( = ?auto_60519 ?auto_60521 ) ) ( not ( = ?auto_60520 ?auto_60521 ) ) ( not ( = ?auto_60522 ?auto_60521 ) ) ( not ( = ?auto_60528 ?auto_60527 ) ) ( not ( = ?auto_60528 ?auto_60523 ) ) ( not ( = ?auto_60528 ?auto_60526 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_60519 ?auto_60520 ?auto_60522 ?auto_60521 ?auto_60518 )
      ( DELIVER-4PKG-VERIFY ?auto_60519 ?auto_60520 ?auto_60521 ?auto_60522 ?auto_60518 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_60554 - OBJ
      ?auto_60555 - OBJ
      ?auto_60556 - OBJ
      ?auto_60557 - OBJ
      ?auto_60553 - LOCATION
    )
    :vars
    (
      ?auto_60559 - LOCATION
      ?auto_60558 - CITY
      ?auto_60561 - LOCATION
      ?auto_60563 - LOCATION
      ?auto_60562 - LOCATION
      ?auto_60560 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_60559 ?auto_60558 ) ( IN-CITY ?auto_60553 ?auto_60558 ) ( not ( = ?auto_60553 ?auto_60559 ) ) ( OBJ-AT ?auto_60557 ?auto_60559 ) ( IN-CITY ?auto_60561 ?auto_60558 ) ( not ( = ?auto_60553 ?auto_60561 ) ) ( OBJ-AT ?auto_60555 ?auto_60561 ) ( IN-CITY ?auto_60563 ?auto_60558 ) ( not ( = ?auto_60553 ?auto_60563 ) ) ( OBJ-AT ?auto_60556 ?auto_60563 ) ( IN-CITY ?auto_60562 ?auto_60558 ) ( not ( = ?auto_60553 ?auto_60562 ) ) ( OBJ-AT ?auto_60554 ?auto_60562 ) ( TRUCK-AT ?auto_60560 ?auto_60553 ) ( not ( = ?auto_60554 ?auto_60556 ) ) ( not ( = ?auto_60563 ?auto_60562 ) ) ( not ( = ?auto_60554 ?auto_60555 ) ) ( not ( = ?auto_60556 ?auto_60555 ) ) ( not ( = ?auto_60561 ?auto_60563 ) ) ( not ( = ?auto_60561 ?auto_60562 ) ) ( not ( = ?auto_60554 ?auto_60557 ) ) ( not ( = ?auto_60556 ?auto_60557 ) ) ( not ( = ?auto_60555 ?auto_60557 ) ) ( not ( = ?auto_60559 ?auto_60561 ) ) ( not ( = ?auto_60559 ?auto_60563 ) ) ( not ( = ?auto_60559 ?auto_60562 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_60554 ?auto_60556 ?auto_60557 ?auto_60555 ?auto_60553 )
      ( DELIVER-4PKG-VERIFY ?auto_60554 ?auto_60555 ?auto_60556 ?auto_60557 ?auto_60553 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_60589 - OBJ
      ?auto_60590 - OBJ
      ?auto_60591 - OBJ
      ?auto_60592 - OBJ
      ?auto_60588 - LOCATION
    )
    :vars
    (
      ?auto_60594 - LOCATION
      ?auto_60593 - CITY
      ?auto_60596 - LOCATION
      ?auto_60598 - LOCATION
      ?auto_60597 - LOCATION
      ?auto_60595 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_60594 ?auto_60593 ) ( IN-CITY ?auto_60588 ?auto_60593 ) ( not ( = ?auto_60588 ?auto_60594 ) ) ( OBJ-AT ?auto_60591 ?auto_60594 ) ( IN-CITY ?auto_60596 ?auto_60593 ) ( not ( = ?auto_60588 ?auto_60596 ) ) ( OBJ-AT ?auto_60590 ?auto_60596 ) ( IN-CITY ?auto_60598 ?auto_60593 ) ( not ( = ?auto_60588 ?auto_60598 ) ) ( OBJ-AT ?auto_60592 ?auto_60598 ) ( IN-CITY ?auto_60597 ?auto_60593 ) ( not ( = ?auto_60588 ?auto_60597 ) ) ( OBJ-AT ?auto_60589 ?auto_60597 ) ( TRUCK-AT ?auto_60595 ?auto_60588 ) ( not ( = ?auto_60589 ?auto_60592 ) ) ( not ( = ?auto_60598 ?auto_60597 ) ) ( not ( = ?auto_60589 ?auto_60590 ) ) ( not ( = ?auto_60592 ?auto_60590 ) ) ( not ( = ?auto_60596 ?auto_60598 ) ) ( not ( = ?auto_60596 ?auto_60597 ) ) ( not ( = ?auto_60589 ?auto_60591 ) ) ( not ( = ?auto_60592 ?auto_60591 ) ) ( not ( = ?auto_60590 ?auto_60591 ) ) ( not ( = ?auto_60594 ?auto_60596 ) ) ( not ( = ?auto_60594 ?auto_60598 ) ) ( not ( = ?auto_60594 ?auto_60597 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_60589 ?auto_60592 ?auto_60591 ?auto_60590 ?auto_60588 )
      ( DELIVER-4PKG-VERIFY ?auto_60589 ?auto_60590 ?auto_60591 ?auto_60592 ?auto_60588 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_60698 - OBJ
      ?auto_60699 - OBJ
      ?auto_60700 - OBJ
      ?auto_60701 - OBJ
      ?auto_60697 - LOCATION
    )
    :vars
    (
      ?auto_60703 - LOCATION
      ?auto_60702 - CITY
      ?auto_60705 - LOCATION
      ?auto_60707 - LOCATION
      ?auto_60706 - LOCATION
      ?auto_60704 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_60703 ?auto_60702 ) ( IN-CITY ?auto_60697 ?auto_60702 ) ( not ( = ?auto_60697 ?auto_60703 ) ) ( OBJ-AT ?auto_60699 ?auto_60703 ) ( IN-CITY ?auto_60705 ?auto_60702 ) ( not ( = ?auto_60697 ?auto_60705 ) ) ( OBJ-AT ?auto_60701 ?auto_60705 ) ( IN-CITY ?auto_60707 ?auto_60702 ) ( not ( = ?auto_60697 ?auto_60707 ) ) ( OBJ-AT ?auto_60700 ?auto_60707 ) ( IN-CITY ?auto_60706 ?auto_60702 ) ( not ( = ?auto_60697 ?auto_60706 ) ) ( OBJ-AT ?auto_60698 ?auto_60706 ) ( TRUCK-AT ?auto_60704 ?auto_60697 ) ( not ( = ?auto_60698 ?auto_60700 ) ) ( not ( = ?auto_60707 ?auto_60706 ) ) ( not ( = ?auto_60698 ?auto_60701 ) ) ( not ( = ?auto_60700 ?auto_60701 ) ) ( not ( = ?auto_60705 ?auto_60707 ) ) ( not ( = ?auto_60705 ?auto_60706 ) ) ( not ( = ?auto_60698 ?auto_60699 ) ) ( not ( = ?auto_60700 ?auto_60699 ) ) ( not ( = ?auto_60701 ?auto_60699 ) ) ( not ( = ?auto_60703 ?auto_60705 ) ) ( not ( = ?auto_60703 ?auto_60707 ) ) ( not ( = ?auto_60703 ?auto_60706 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_60698 ?auto_60700 ?auto_60699 ?auto_60701 ?auto_60697 )
      ( DELIVER-4PKG-VERIFY ?auto_60698 ?auto_60699 ?auto_60700 ?auto_60701 ?auto_60697 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_60733 - OBJ
      ?auto_60734 - OBJ
      ?auto_60735 - OBJ
      ?auto_60736 - OBJ
      ?auto_60732 - LOCATION
    )
    :vars
    (
      ?auto_60738 - LOCATION
      ?auto_60737 - CITY
      ?auto_60740 - LOCATION
      ?auto_60742 - LOCATION
      ?auto_60741 - LOCATION
      ?auto_60739 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_60738 ?auto_60737 ) ( IN-CITY ?auto_60732 ?auto_60737 ) ( not ( = ?auto_60732 ?auto_60738 ) ) ( OBJ-AT ?auto_60734 ?auto_60738 ) ( IN-CITY ?auto_60740 ?auto_60737 ) ( not ( = ?auto_60732 ?auto_60740 ) ) ( OBJ-AT ?auto_60735 ?auto_60740 ) ( IN-CITY ?auto_60742 ?auto_60737 ) ( not ( = ?auto_60732 ?auto_60742 ) ) ( OBJ-AT ?auto_60736 ?auto_60742 ) ( IN-CITY ?auto_60741 ?auto_60737 ) ( not ( = ?auto_60732 ?auto_60741 ) ) ( OBJ-AT ?auto_60733 ?auto_60741 ) ( TRUCK-AT ?auto_60739 ?auto_60732 ) ( not ( = ?auto_60733 ?auto_60736 ) ) ( not ( = ?auto_60742 ?auto_60741 ) ) ( not ( = ?auto_60733 ?auto_60735 ) ) ( not ( = ?auto_60736 ?auto_60735 ) ) ( not ( = ?auto_60740 ?auto_60742 ) ) ( not ( = ?auto_60740 ?auto_60741 ) ) ( not ( = ?auto_60733 ?auto_60734 ) ) ( not ( = ?auto_60736 ?auto_60734 ) ) ( not ( = ?auto_60735 ?auto_60734 ) ) ( not ( = ?auto_60738 ?auto_60740 ) ) ( not ( = ?auto_60738 ?auto_60742 ) ) ( not ( = ?auto_60738 ?auto_60741 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_60733 ?auto_60736 ?auto_60734 ?auto_60735 ?auto_60732 )
      ( DELIVER-4PKG-VERIFY ?auto_60733 ?auto_60734 ?auto_60735 ?auto_60736 ?auto_60732 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_60842 - OBJ
      ?auto_60843 - OBJ
      ?auto_60844 - OBJ
      ?auto_60845 - OBJ
      ?auto_60841 - LOCATION
    )
    :vars
    (
      ?auto_60847 - LOCATION
      ?auto_60846 - CITY
      ?auto_60849 - LOCATION
      ?auto_60851 - LOCATION
      ?auto_60850 - LOCATION
      ?auto_60848 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_60847 ?auto_60846 ) ( IN-CITY ?auto_60841 ?auto_60846 ) ( not ( = ?auto_60841 ?auto_60847 ) ) ( OBJ-AT ?auto_60845 ?auto_60847 ) ( IN-CITY ?auto_60849 ?auto_60846 ) ( not ( = ?auto_60841 ?auto_60849 ) ) ( OBJ-AT ?auto_60844 ?auto_60849 ) ( IN-CITY ?auto_60851 ?auto_60846 ) ( not ( = ?auto_60841 ?auto_60851 ) ) ( OBJ-AT ?auto_60842 ?auto_60851 ) ( IN-CITY ?auto_60850 ?auto_60846 ) ( not ( = ?auto_60841 ?auto_60850 ) ) ( OBJ-AT ?auto_60843 ?auto_60850 ) ( TRUCK-AT ?auto_60848 ?auto_60841 ) ( not ( = ?auto_60843 ?auto_60842 ) ) ( not ( = ?auto_60851 ?auto_60850 ) ) ( not ( = ?auto_60843 ?auto_60844 ) ) ( not ( = ?auto_60842 ?auto_60844 ) ) ( not ( = ?auto_60849 ?auto_60851 ) ) ( not ( = ?auto_60849 ?auto_60850 ) ) ( not ( = ?auto_60843 ?auto_60845 ) ) ( not ( = ?auto_60842 ?auto_60845 ) ) ( not ( = ?auto_60844 ?auto_60845 ) ) ( not ( = ?auto_60847 ?auto_60849 ) ) ( not ( = ?auto_60847 ?auto_60851 ) ) ( not ( = ?auto_60847 ?auto_60850 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_60843 ?auto_60842 ?auto_60845 ?auto_60844 ?auto_60841 )
      ( DELIVER-4PKG-VERIFY ?auto_60842 ?auto_60843 ?auto_60844 ?auto_60845 ?auto_60841 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_60877 - OBJ
      ?auto_60878 - OBJ
      ?auto_60879 - OBJ
      ?auto_60880 - OBJ
      ?auto_60876 - LOCATION
    )
    :vars
    (
      ?auto_60882 - LOCATION
      ?auto_60881 - CITY
      ?auto_60884 - LOCATION
      ?auto_60886 - LOCATION
      ?auto_60885 - LOCATION
      ?auto_60883 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_60882 ?auto_60881 ) ( IN-CITY ?auto_60876 ?auto_60881 ) ( not ( = ?auto_60876 ?auto_60882 ) ) ( OBJ-AT ?auto_60879 ?auto_60882 ) ( IN-CITY ?auto_60884 ?auto_60881 ) ( not ( = ?auto_60876 ?auto_60884 ) ) ( OBJ-AT ?auto_60880 ?auto_60884 ) ( IN-CITY ?auto_60886 ?auto_60881 ) ( not ( = ?auto_60876 ?auto_60886 ) ) ( OBJ-AT ?auto_60877 ?auto_60886 ) ( IN-CITY ?auto_60885 ?auto_60881 ) ( not ( = ?auto_60876 ?auto_60885 ) ) ( OBJ-AT ?auto_60878 ?auto_60885 ) ( TRUCK-AT ?auto_60883 ?auto_60876 ) ( not ( = ?auto_60878 ?auto_60877 ) ) ( not ( = ?auto_60886 ?auto_60885 ) ) ( not ( = ?auto_60878 ?auto_60880 ) ) ( not ( = ?auto_60877 ?auto_60880 ) ) ( not ( = ?auto_60884 ?auto_60886 ) ) ( not ( = ?auto_60884 ?auto_60885 ) ) ( not ( = ?auto_60878 ?auto_60879 ) ) ( not ( = ?auto_60877 ?auto_60879 ) ) ( not ( = ?auto_60880 ?auto_60879 ) ) ( not ( = ?auto_60882 ?auto_60884 ) ) ( not ( = ?auto_60882 ?auto_60886 ) ) ( not ( = ?auto_60882 ?auto_60885 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_60878 ?auto_60877 ?auto_60879 ?auto_60880 ?auto_60876 )
      ( DELIVER-4PKG-VERIFY ?auto_60877 ?auto_60878 ?auto_60879 ?auto_60880 ?auto_60876 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_60987 - OBJ
      ?auto_60988 - OBJ
      ?auto_60989 - OBJ
      ?auto_60990 - OBJ
      ?auto_60986 - LOCATION
    )
    :vars
    (
      ?auto_60992 - LOCATION
      ?auto_60991 - CITY
      ?auto_60994 - LOCATION
      ?auto_60996 - LOCATION
      ?auto_60995 - LOCATION
      ?auto_60993 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_60992 ?auto_60991 ) ( IN-CITY ?auto_60986 ?auto_60991 ) ( not ( = ?auto_60986 ?auto_60992 ) ) ( OBJ-AT ?auto_60990 ?auto_60992 ) ( IN-CITY ?auto_60994 ?auto_60991 ) ( not ( = ?auto_60986 ?auto_60994 ) ) ( OBJ-AT ?auto_60988 ?auto_60994 ) ( IN-CITY ?auto_60996 ?auto_60991 ) ( not ( = ?auto_60986 ?auto_60996 ) ) ( OBJ-AT ?auto_60987 ?auto_60996 ) ( IN-CITY ?auto_60995 ?auto_60991 ) ( not ( = ?auto_60986 ?auto_60995 ) ) ( OBJ-AT ?auto_60989 ?auto_60995 ) ( TRUCK-AT ?auto_60993 ?auto_60986 ) ( not ( = ?auto_60989 ?auto_60987 ) ) ( not ( = ?auto_60996 ?auto_60995 ) ) ( not ( = ?auto_60989 ?auto_60988 ) ) ( not ( = ?auto_60987 ?auto_60988 ) ) ( not ( = ?auto_60994 ?auto_60996 ) ) ( not ( = ?auto_60994 ?auto_60995 ) ) ( not ( = ?auto_60989 ?auto_60990 ) ) ( not ( = ?auto_60987 ?auto_60990 ) ) ( not ( = ?auto_60988 ?auto_60990 ) ) ( not ( = ?auto_60992 ?auto_60994 ) ) ( not ( = ?auto_60992 ?auto_60996 ) ) ( not ( = ?auto_60992 ?auto_60995 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_60989 ?auto_60987 ?auto_60990 ?auto_60988 ?auto_60986 )
      ( DELIVER-4PKG-VERIFY ?auto_60987 ?auto_60988 ?auto_60989 ?auto_60990 ?auto_60986 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_61022 - OBJ
      ?auto_61023 - OBJ
      ?auto_61024 - OBJ
      ?auto_61025 - OBJ
      ?auto_61021 - LOCATION
    )
    :vars
    (
      ?auto_61027 - LOCATION
      ?auto_61026 - CITY
      ?auto_61029 - LOCATION
      ?auto_61031 - LOCATION
      ?auto_61030 - LOCATION
      ?auto_61028 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_61027 ?auto_61026 ) ( IN-CITY ?auto_61021 ?auto_61026 ) ( not ( = ?auto_61021 ?auto_61027 ) ) ( OBJ-AT ?auto_61024 ?auto_61027 ) ( IN-CITY ?auto_61029 ?auto_61026 ) ( not ( = ?auto_61021 ?auto_61029 ) ) ( OBJ-AT ?auto_61023 ?auto_61029 ) ( IN-CITY ?auto_61031 ?auto_61026 ) ( not ( = ?auto_61021 ?auto_61031 ) ) ( OBJ-AT ?auto_61022 ?auto_61031 ) ( IN-CITY ?auto_61030 ?auto_61026 ) ( not ( = ?auto_61021 ?auto_61030 ) ) ( OBJ-AT ?auto_61025 ?auto_61030 ) ( TRUCK-AT ?auto_61028 ?auto_61021 ) ( not ( = ?auto_61025 ?auto_61022 ) ) ( not ( = ?auto_61031 ?auto_61030 ) ) ( not ( = ?auto_61025 ?auto_61023 ) ) ( not ( = ?auto_61022 ?auto_61023 ) ) ( not ( = ?auto_61029 ?auto_61031 ) ) ( not ( = ?auto_61029 ?auto_61030 ) ) ( not ( = ?auto_61025 ?auto_61024 ) ) ( not ( = ?auto_61022 ?auto_61024 ) ) ( not ( = ?auto_61023 ?auto_61024 ) ) ( not ( = ?auto_61027 ?auto_61029 ) ) ( not ( = ?auto_61027 ?auto_61031 ) ) ( not ( = ?auto_61027 ?auto_61030 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_61025 ?auto_61022 ?auto_61024 ?auto_61023 ?auto_61021 )
      ( DELIVER-4PKG-VERIFY ?auto_61022 ?auto_61023 ?auto_61024 ?auto_61025 ?auto_61021 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_61093 - OBJ
      ?auto_61094 - OBJ
      ?auto_61095 - OBJ
      ?auto_61096 - OBJ
      ?auto_61092 - LOCATION
    )
    :vars
    (
      ?auto_61098 - LOCATION
      ?auto_61097 - CITY
      ?auto_61100 - LOCATION
      ?auto_61102 - LOCATION
      ?auto_61101 - LOCATION
      ?auto_61099 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_61098 ?auto_61097 ) ( IN-CITY ?auto_61092 ?auto_61097 ) ( not ( = ?auto_61092 ?auto_61098 ) ) ( OBJ-AT ?auto_61094 ?auto_61098 ) ( IN-CITY ?auto_61100 ?auto_61097 ) ( not ( = ?auto_61092 ?auto_61100 ) ) ( OBJ-AT ?auto_61096 ?auto_61100 ) ( IN-CITY ?auto_61102 ?auto_61097 ) ( not ( = ?auto_61092 ?auto_61102 ) ) ( OBJ-AT ?auto_61093 ?auto_61102 ) ( IN-CITY ?auto_61101 ?auto_61097 ) ( not ( = ?auto_61092 ?auto_61101 ) ) ( OBJ-AT ?auto_61095 ?auto_61101 ) ( TRUCK-AT ?auto_61099 ?auto_61092 ) ( not ( = ?auto_61095 ?auto_61093 ) ) ( not ( = ?auto_61102 ?auto_61101 ) ) ( not ( = ?auto_61095 ?auto_61096 ) ) ( not ( = ?auto_61093 ?auto_61096 ) ) ( not ( = ?auto_61100 ?auto_61102 ) ) ( not ( = ?auto_61100 ?auto_61101 ) ) ( not ( = ?auto_61095 ?auto_61094 ) ) ( not ( = ?auto_61093 ?auto_61094 ) ) ( not ( = ?auto_61096 ?auto_61094 ) ) ( not ( = ?auto_61098 ?auto_61100 ) ) ( not ( = ?auto_61098 ?auto_61102 ) ) ( not ( = ?auto_61098 ?auto_61101 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_61095 ?auto_61093 ?auto_61094 ?auto_61096 ?auto_61092 )
      ( DELIVER-4PKG-VERIFY ?auto_61093 ?auto_61094 ?auto_61095 ?auto_61096 ?auto_61092 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_61166 - OBJ
      ?auto_61167 - OBJ
      ?auto_61168 - OBJ
      ?auto_61169 - OBJ
      ?auto_61165 - LOCATION
    )
    :vars
    (
      ?auto_61171 - LOCATION
      ?auto_61170 - CITY
      ?auto_61173 - LOCATION
      ?auto_61175 - LOCATION
      ?auto_61174 - LOCATION
      ?auto_61172 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_61171 ?auto_61170 ) ( IN-CITY ?auto_61165 ?auto_61170 ) ( not ( = ?auto_61165 ?auto_61171 ) ) ( OBJ-AT ?auto_61167 ?auto_61171 ) ( IN-CITY ?auto_61173 ?auto_61170 ) ( not ( = ?auto_61165 ?auto_61173 ) ) ( OBJ-AT ?auto_61168 ?auto_61173 ) ( IN-CITY ?auto_61175 ?auto_61170 ) ( not ( = ?auto_61165 ?auto_61175 ) ) ( OBJ-AT ?auto_61166 ?auto_61175 ) ( IN-CITY ?auto_61174 ?auto_61170 ) ( not ( = ?auto_61165 ?auto_61174 ) ) ( OBJ-AT ?auto_61169 ?auto_61174 ) ( TRUCK-AT ?auto_61172 ?auto_61165 ) ( not ( = ?auto_61169 ?auto_61166 ) ) ( not ( = ?auto_61175 ?auto_61174 ) ) ( not ( = ?auto_61169 ?auto_61168 ) ) ( not ( = ?auto_61166 ?auto_61168 ) ) ( not ( = ?auto_61173 ?auto_61175 ) ) ( not ( = ?auto_61173 ?auto_61174 ) ) ( not ( = ?auto_61169 ?auto_61167 ) ) ( not ( = ?auto_61166 ?auto_61167 ) ) ( not ( = ?auto_61168 ?auto_61167 ) ) ( not ( = ?auto_61171 ?auto_61173 ) ) ( not ( = ?auto_61171 ?auto_61175 ) ) ( not ( = ?auto_61171 ?auto_61174 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_61169 ?auto_61166 ?auto_61167 ?auto_61168 ?auto_61165 )
      ( DELIVER-4PKG-VERIFY ?auto_61166 ?auto_61167 ?auto_61168 ?auto_61169 ?auto_61165 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_61275 - OBJ
      ?auto_61276 - OBJ
      ?auto_61277 - OBJ
      ?auto_61278 - OBJ
      ?auto_61274 - LOCATION
    )
    :vars
    (
      ?auto_61280 - LOCATION
      ?auto_61279 - CITY
      ?auto_61282 - LOCATION
      ?auto_61284 - LOCATION
      ?auto_61283 - LOCATION
      ?auto_61281 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_61280 ?auto_61279 ) ( IN-CITY ?auto_61274 ?auto_61279 ) ( not ( = ?auto_61274 ?auto_61280 ) ) ( OBJ-AT ?auto_61278 ?auto_61280 ) ( IN-CITY ?auto_61282 ?auto_61279 ) ( not ( = ?auto_61274 ?auto_61282 ) ) ( OBJ-AT ?auto_61275 ?auto_61282 ) ( IN-CITY ?auto_61284 ?auto_61279 ) ( not ( = ?auto_61274 ?auto_61284 ) ) ( OBJ-AT ?auto_61277 ?auto_61284 ) ( IN-CITY ?auto_61283 ?auto_61279 ) ( not ( = ?auto_61274 ?auto_61283 ) ) ( OBJ-AT ?auto_61276 ?auto_61283 ) ( TRUCK-AT ?auto_61281 ?auto_61274 ) ( not ( = ?auto_61276 ?auto_61277 ) ) ( not ( = ?auto_61284 ?auto_61283 ) ) ( not ( = ?auto_61276 ?auto_61275 ) ) ( not ( = ?auto_61277 ?auto_61275 ) ) ( not ( = ?auto_61282 ?auto_61284 ) ) ( not ( = ?auto_61282 ?auto_61283 ) ) ( not ( = ?auto_61276 ?auto_61278 ) ) ( not ( = ?auto_61277 ?auto_61278 ) ) ( not ( = ?auto_61275 ?auto_61278 ) ) ( not ( = ?auto_61280 ?auto_61282 ) ) ( not ( = ?auto_61280 ?auto_61284 ) ) ( not ( = ?auto_61280 ?auto_61283 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_61276 ?auto_61277 ?auto_61278 ?auto_61275 ?auto_61274 )
      ( DELIVER-4PKG-VERIFY ?auto_61275 ?auto_61276 ?auto_61277 ?auto_61278 ?auto_61274 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_61310 - OBJ
      ?auto_61311 - OBJ
      ?auto_61312 - OBJ
      ?auto_61313 - OBJ
      ?auto_61309 - LOCATION
    )
    :vars
    (
      ?auto_61315 - LOCATION
      ?auto_61314 - CITY
      ?auto_61317 - LOCATION
      ?auto_61319 - LOCATION
      ?auto_61318 - LOCATION
      ?auto_61316 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_61315 ?auto_61314 ) ( IN-CITY ?auto_61309 ?auto_61314 ) ( not ( = ?auto_61309 ?auto_61315 ) ) ( OBJ-AT ?auto_61312 ?auto_61315 ) ( IN-CITY ?auto_61317 ?auto_61314 ) ( not ( = ?auto_61309 ?auto_61317 ) ) ( OBJ-AT ?auto_61310 ?auto_61317 ) ( IN-CITY ?auto_61319 ?auto_61314 ) ( not ( = ?auto_61309 ?auto_61319 ) ) ( OBJ-AT ?auto_61313 ?auto_61319 ) ( IN-CITY ?auto_61318 ?auto_61314 ) ( not ( = ?auto_61309 ?auto_61318 ) ) ( OBJ-AT ?auto_61311 ?auto_61318 ) ( TRUCK-AT ?auto_61316 ?auto_61309 ) ( not ( = ?auto_61311 ?auto_61313 ) ) ( not ( = ?auto_61319 ?auto_61318 ) ) ( not ( = ?auto_61311 ?auto_61310 ) ) ( not ( = ?auto_61313 ?auto_61310 ) ) ( not ( = ?auto_61317 ?auto_61319 ) ) ( not ( = ?auto_61317 ?auto_61318 ) ) ( not ( = ?auto_61311 ?auto_61312 ) ) ( not ( = ?auto_61313 ?auto_61312 ) ) ( not ( = ?auto_61310 ?auto_61312 ) ) ( not ( = ?auto_61315 ?auto_61317 ) ) ( not ( = ?auto_61315 ?auto_61319 ) ) ( not ( = ?auto_61315 ?auto_61318 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_61311 ?auto_61313 ?auto_61312 ?auto_61310 ?auto_61309 )
      ( DELIVER-4PKG-VERIFY ?auto_61310 ?auto_61311 ?auto_61312 ?auto_61313 ?auto_61309 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_61345 - OBJ
      ?auto_61346 - OBJ
      ?auto_61347 - OBJ
      ?auto_61348 - OBJ
      ?auto_61344 - LOCATION
    )
    :vars
    (
      ?auto_61350 - LOCATION
      ?auto_61349 - CITY
      ?auto_61352 - LOCATION
      ?auto_61354 - LOCATION
      ?auto_61353 - LOCATION
      ?auto_61351 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_61350 ?auto_61349 ) ( IN-CITY ?auto_61344 ?auto_61349 ) ( not ( = ?auto_61344 ?auto_61350 ) ) ( OBJ-AT ?auto_61348 ?auto_61350 ) ( IN-CITY ?auto_61352 ?auto_61349 ) ( not ( = ?auto_61344 ?auto_61352 ) ) ( OBJ-AT ?auto_61345 ?auto_61352 ) ( IN-CITY ?auto_61354 ?auto_61349 ) ( not ( = ?auto_61344 ?auto_61354 ) ) ( OBJ-AT ?auto_61346 ?auto_61354 ) ( IN-CITY ?auto_61353 ?auto_61349 ) ( not ( = ?auto_61344 ?auto_61353 ) ) ( OBJ-AT ?auto_61347 ?auto_61353 ) ( TRUCK-AT ?auto_61351 ?auto_61344 ) ( not ( = ?auto_61347 ?auto_61346 ) ) ( not ( = ?auto_61354 ?auto_61353 ) ) ( not ( = ?auto_61347 ?auto_61345 ) ) ( not ( = ?auto_61346 ?auto_61345 ) ) ( not ( = ?auto_61352 ?auto_61354 ) ) ( not ( = ?auto_61352 ?auto_61353 ) ) ( not ( = ?auto_61347 ?auto_61348 ) ) ( not ( = ?auto_61346 ?auto_61348 ) ) ( not ( = ?auto_61345 ?auto_61348 ) ) ( not ( = ?auto_61350 ?auto_61352 ) ) ( not ( = ?auto_61350 ?auto_61354 ) ) ( not ( = ?auto_61350 ?auto_61353 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_61347 ?auto_61346 ?auto_61348 ?auto_61345 ?auto_61344 )
      ( DELIVER-4PKG-VERIFY ?auto_61345 ?auto_61346 ?auto_61347 ?auto_61348 ?auto_61344 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_61380 - OBJ
      ?auto_61381 - OBJ
      ?auto_61382 - OBJ
      ?auto_61383 - OBJ
      ?auto_61379 - LOCATION
    )
    :vars
    (
      ?auto_61385 - LOCATION
      ?auto_61384 - CITY
      ?auto_61387 - LOCATION
      ?auto_61389 - LOCATION
      ?auto_61388 - LOCATION
      ?auto_61386 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_61385 ?auto_61384 ) ( IN-CITY ?auto_61379 ?auto_61384 ) ( not ( = ?auto_61379 ?auto_61385 ) ) ( OBJ-AT ?auto_61382 ?auto_61385 ) ( IN-CITY ?auto_61387 ?auto_61384 ) ( not ( = ?auto_61379 ?auto_61387 ) ) ( OBJ-AT ?auto_61380 ?auto_61387 ) ( IN-CITY ?auto_61389 ?auto_61384 ) ( not ( = ?auto_61379 ?auto_61389 ) ) ( OBJ-AT ?auto_61381 ?auto_61389 ) ( IN-CITY ?auto_61388 ?auto_61384 ) ( not ( = ?auto_61379 ?auto_61388 ) ) ( OBJ-AT ?auto_61383 ?auto_61388 ) ( TRUCK-AT ?auto_61386 ?auto_61379 ) ( not ( = ?auto_61383 ?auto_61381 ) ) ( not ( = ?auto_61389 ?auto_61388 ) ) ( not ( = ?auto_61383 ?auto_61380 ) ) ( not ( = ?auto_61381 ?auto_61380 ) ) ( not ( = ?auto_61387 ?auto_61389 ) ) ( not ( = ?auto_61387 ?auto_61388 ) ) ( not ( = ?auto_61383 ?auto_61382 ) ) ( not ( = ?auto_61381 ?auto_61382 ) ) ( not ( = ?auto_61380 ?auto_61382 ) ) ( not ( = ?auto_61385 ?auto_61387 ) ) ( not ( = ?auto_61385 ?auto_61389 ) ) ( not ( = ?auto_61385 ?auto_61388 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_61383 ?auto_61381 ?auto_61382 ?auto_61380 ?auto_61379 )
      ( DELIVER-4PKG-VERIFY ?auto_61380 ?auto_61381 ?auto_61382 ?auto_61383 ?auto_61379 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_61526 - OBJ
      ?auto_61527 - OBJ
      ?auto_61528 - OBJ
      ?auto_61529 - OBJ
      ?auto_61525 - LOCATION
    )
    :vars
    (
      ?auto_61531 - LOCATION
      ?auto_61530 - CITY
      ?auto_61533 - LOCATION
      ?auto_61535 - LOCATION
      ?auto_61534 - LOCATION
      ?auto_61532 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_61531 ?auto_61530 ) ( IN-CITY ?auto_61525 ?auto_61530 ) ( not ( = ?auto_61525 ?auto_61531 ) ) ( OBJ-AT ?auto_61527 ?auto_61531 ) ( IN-CITY ?auto_61533 ?auto_61530 ) ( not ( = ?auto_61525 ?auto_61533 ) ) ( OBJ-AT ?auto_61526 ?auto_61533 ) ( IN-CITY ?auto_61535 ?auto_61530 ) ( not ( = ?auto_61525 ?auto_61535 ) ) ( OBJ-AT ?auto_61529 ?auto_61535 ) ( IN-CITY ?auto_61534 ?auto_61530 ) ( not ( = ?auto_61525 ?auto_61534 ) ) ( OBJ-AT ?auto_61528 ?auto_61534 ) ( TRUCK-AT ?auto_61532 ?auto_61525 ) ( not ( = ?auto_61528 ?auto_61529 ) ) ( not ( = ?auto_61535 ?auto_61534 ) ) ( not ( = ?auto_61528 ?auto_61526 ) ) ( not ( = ?auto_61529 ?auto_61526 ) ) ( not ( = ?auto_61533 ?auto_61535 ) ) ( not ( = ?auto_61533 ?auto_61534 ) ) ( not ( = ?auto_61528 ?auto_61527 ) ) ( not ( = ?auto_61529 ?auto_61527 ) ) ( not ( = ?auto_61526 ?auto_61527 ) ) ( not ( = ?auto_61531 ?auto_61533 ) ) ( not ( = ?auto_61531 ?auto_61535 ) ) ( not ( = ?auto_61531 ?auto_61534 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_61528 ?auto_61529 ?auto_61527 ?auto_61526 ?auto_61525 )
      ( DELIVER-4PKG-VERIFY ?auto_61526 ?auto_61527 ?auto_61528 ?auto_61529 ?auto_61525 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_61561 - OBJ
      ?auto_61562 - OBJ
      ?auto_61563 - OBJ
      ?auto_61564 - OBJ
      ?auto_61560 - LOCATION
    )
    :vars
    (
      ?auto_61566 - LOCATION
      ?auto_61565 - CITY
      ?auto_61568 - LOCATION
      ?auto_61570 - LOCATION
      ?auto_61569 - LOCATION
      ?auto_61567 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_61566 ?auto_61565 ) ( IN-CITY ?auto_61560 ?auto_61565 ) ( not ( = ?auto_61560 ?auto_61566 ) ) ( OBJ-AT ?auto_61562 ?auto_61566 ) ( IN-CITY ?auto_61568 ?auto_61565 ) ( not ( = ?auto_61560 ?auto_61568 ) ) ( OBJ-AT ?auto_61561 ?auto_61568 ) ( IN-CITY ?auto_61570 ?auto_61565 ) ( not ( = ?auto_61560 ?auto_61570 ) ) ( OBJ-AT ?auto_61563 ?auto_61570 ) ( IN-CITY ?auto_61569 ?auto_61565 ) ( not ( = ?auto_61560 ?auto_61569 ) ) ( OBJ-AT ?auto_61564 ?auto_61569 ) ( TRUCK-AT ?auto_61567 ?auto_61560 ) ( not ( = ?auto_61564 ?auto_61563 ) ) ( not ( = ?auto_61570 ?auto_61569 ) ) ( not ( = ?auto_61564 ?auto_61561 ) ) ( not ( = ?auto_61563 ?auto_61561 ) ) ( not ( = ?auto_61568 ?auto_61570 ) ) ( not ( = ?auto_61568 ?auto_61569 ) ) ( not ( = ?auto_61564 ?auto_61562 ) ) ( not ( = ?auto_61563 ?auto_61562 ) ) ( not ( = ?auto_61561 ?auto_61562 ) ) ( not ( = ?auto_61566 ?auto_61568 ) ) ( not ( = ?auto_61566 ?auto_61570 ) ) ( not ( = ?auto_61566 ?auto_61569 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_61564 ?auto_61563 ?auto_61562 ?auto_61561 ?auto_61560 )
      ( DELIVER-4PKG-VERIFY ?auto_61561 ?auto_61562 ?auto_61563 ?auto_61564 ?auto_61560 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_61782 - OBJ
      ?auto_61783 - OBJ
      ?auto_61784 - OBJ
      ?auto_61785 - OBJ
      ?auto_61781 - LOCATION
    )
    :vars
    (
      ?auto_61787 - LOCATION
      ?auto_61786 - CITY
      ?auto_61789 - LOCATION
      ?auto_61791 - LOCATION
      ?auto_61790 - LOCATION
      ?auto_61788 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_61787 ?auto_61786 ) ( IN-CITY ?auto_61781 ?auto_61786 ) ( not ( = ?auto_61781 ?auto_61787 ) ) ( OBJ-AT ?auto_61782 ?auto_61787 ) ( IN-CITY ?auto_61789 ?auto_61786 ) ( not ( = ?auto_61781 ?auto_61789 ) ) ( OBJ-AT ?auto_61785 ?auto_61789 ) ( IN-CITY ?auto_61791 ?auto_61786 ) ( not ( = ?auto_61781 ?auto_61791 ) ) ( OBJ-AT ?auto_61784 ?auto_61791 ) ( IN-CITY ?auto_61790 ?auto_61786 ) ( not ( = ?auto_61781 ?auto_61790 ) ) ( OBJ-AT ?auto_61783 ?auto_61790 ) ( TRUCK-AT ?auto_61788 ?auto_61781 ) ( not ( = ?auto_61783 ?auto_61784 ) ) ( not ( = ?auto_61791 ?auto_61790 ) ) ( not ( = ?auto_61783 ?auto_61785 ) ) ( not ( = ?auto_61784 ?auto_61785 ) ) ( not ( = ?auto_61789 ?auto_61791 ) ) ( not ( = ?auto_61789 ?auto_61790 ) ) ( not ( = ?auto_61783 ?auto_61782 ) ) ( not ( = ?auto_61784 ?auto_61782 ) ) ( not ( = ?auto_61785 ?auto_61782 ) ) ( not ( = ?auto_61787 ?auto_61789 ) ) ( not ( = ?auto_61787 ?auto_61791 ) ) ( not ( = ?auto_61787 ?auto_61790 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_61783 ?auto_61784 ?auto_61782 ?auto_61785 ?auto_61781 )
      ( DELIVER-4PKG-VERIFY ?auto_61782 ?auto_61783 ?auto_61784 ?auto_61785 ?auto_61781 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_61817 - OBJ
      ?auto_61818 - OBJ
      ?auto_61819 - OBJ
      ?auto_61820 - OBJ
      ?auto_61816 - LOCATION
    )
    :vars
    (
      ?auto_61822 - LOCATION
      ?auto_61821 - CITY
      ?auto_61824 - LOCATION
      ?auto_61826 - LOCATION
      ?auto_61825 - LOCATION
      ?auto_61823 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_61822 ?auto_61821 ) ( IN-CITY ?auto_61816 ?auto_61821 ) ( not ( = ?auto_61816 ?auto_61822 ) ) ( OBJ-AT ?auto_61817 ?auto_61822 ) ( IN-CITY ?auto_61824 ?auto_61821 ) ( not ( = ?auto_61816 ?auto_61824 ) ) ( OBJ-AT ?auto_61819 ?auto_61824 ) ( IN-CITY ?auto_61826 ?auto_61821 ) ( not ( = ?auto_61816 ?auto_61826 ) ) ( OBJ-AT ?auto_61820 ?auto_61826 ) ( IN-CITY ?auto_61825 ?auto_61821 ) ( not ( = ?auto_61816 ?auto_61825 ) ) ( OBJ-AT ?auto_61818 ?auto_61825 ) ( TRUCK-AT ?auto_61823 ?auto_61816 ) ( not ( = ?auto_61818 ?auto_61820 ) ) ( not ( = ?auto_61826 ?auto_61825 ) ) ( not ( = ?auto_61818 ?auto_61819 ) ) ( not ( = ?auto_61820 ?auto_61819 ) ) ( not ( = ?auto_61824 ?auto_61826 ) ) ( not ( = ?auto_61824 ?auto_61825 ) ) ( not ( = ?auto_61818 ?auto_61817 ) ) ( not ( = ?auto_61820 ?auto_61817 ) ) ( not ( = ?auto_61819 ?auto_61817 ) ) ( not ( = ?auto_61822 ?auto_61824 ) ) ( not ( = ?auto_61822 ?auto_61826 ) ) ( not ( = ?auto_61822 ?auto_61825 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_61818 ?auto_61820 ?auto_61817 ?auto_61819 ?auto_61816 )
      ( DELIVER-4PKG-VERIFY ?auto_61817 ?auto_61818 ?auto_61819 ?auto_61820 ?auto_61816 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_61926 - OBJ
      ?auto_61927 - OBJ
      ?auto_61928 - OBJ
      ?auto_61929 - OBJ
      ?auto_61925 - LOCATION
    )
    :vars
    (
      ?auto_61931 - LOCATION
      ?auto_61930 - CITY
      ?auto_61933 - LOCATION
      ?auto_61935 - LOCATION
      ?auto_61934 - LOCATION
      ?auto_61932 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_61931 ?auto_61930 ) ( IN-CITY ?auto_61925 ?auto_61930 ) ( not ( = ?auto_61925 ?auto_61931 ) ) ( OBJ-AT ?auto_61926 ?auto_61931 ) ( IN-CITY ?auto_61933 ?auto_61930 ) ( not ( = ?auto_61925 ?auto_61933 ) ) ( OBJ-AT ?auto_61929 ?auto_61933 ) ( IN-CITY ?auto_61935 ?auto_61930 ) ( not ( = ?auto_61925 ?auto_61935 ) ) ( OBJ-AT ?auto_61927 ?auto_61935 ) ( IN-CITY ?auto_61934 ?auto_61930 ) ( not ( = ?auto_61925 ?auto_61934 ) ) ( OBJ-AT ?auto_61928 ?auto_61934 ) ( TRUCK-AT ?auto_61932 ?auto_61925 ) ( not ( = ?auto_61928 ?auto_61927 ) ) ( not ( = ?auto_61935 ?auto_61934 ) ) ( not ( = ?auto_61928 ?auto_61929 ) ) ( not ( = ?auto_61927 ?auto_61929 ) ) ( not ( = ?auto_61933 ?auto_61935 ) ) ( not ( = ?auto_61933 ?auto_61934 ) ) ( not ( = ?auto_61928 ?auto_61926 ) ) ( not ( = ?auto_61927 ?auto_61926 ) ) ( not ( = ?auto_61929 ?auto_61926 ) ) ( not ( = ?auto_61931 ?auto_61933 ) ) ( not ( = ?auto_61931 ?auto_61935 ) ) ( not ( = ?auto_61931 ?auto_61934 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_61928 ?auto_61927 ?auto_61926 ?auto_61929 ?auto_61925 )
      ( DELIVER-4PKG-VERIFY ?auto_61926 ?auto_61927 ?auto_61928 ?auto_61929 ?auto_61925 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_61999 - OBJ
      ?auto_62000 - OBJ
      ?auto_62001 - OBJ
      ?auto_62002 - OBJ
      ?auto_61998 - LOCATION
    )
    :vars
    (
      ?auto_62004 - LOCATION
      ?auto_62003 - CITY
      ?auto_62006 - LOCATION
      ?auto_62008 - LOCATION
      ?auto_62007 - LOCATION
      ?auto_62005 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_62004 ?auto_62003 ) ( IN-CITY ?auto_61998 ?auto_62003 ) ( not ( = ?auto_61998 ?auto_62004 ) ) ( OBJ-AT ?auto_61999 ?auto_62004 ) ( IN-CITY ?auto_62006 ?auto_62003 ) ( not ( = ?auto_61998 ?auto_62006 ) ) ( OBJ-AT ?auto_62001 ?auto_62006 ) ( IN-CITY ?auto_62008 ?auto_62003 ) ( not ( = ?auto_61998 ?auto_62008 ) ) ( OBJ-AT ?auto_62000 ?auto_62008 ) ( IN-CITY ?auto_62007 ?auto_62003 ) ( not ( = ?auto_61998 ?auto_62007 ) ) ( OBJ-AT ?auto_62002 ?auto_62007 ) ( TRUCK-AT ?auto_62005 ?auto_61998 ) ( not ( = ?auto_62002 ?auto_62000 ) ) ( not ( = ?auto_62008 ?auto_62007 ) ) ( not ( = ?auto_62002 ?auto_62001 ) ) ( not ( = ?auto_62000 ?auto_62001 ) ) ( not ( = ?auto_62006 ?auto_62008 ) ) ( not ( = ?auto_62006 ?auto_62007 ) ) ( not ( = ?auto_62002 ?auto_61999 ) ) ( not ( = ?auto_62000 ?auto_61999 ) ) ( not ( = ?auto_62001 ?auto_61999 ) ) ( not ( = ?auto_62004 ?auto_62006 ) ) ( not ( = ?auto_62004 ?auto_62008 ) ) ( not ( = ?auto_62004 ?auto_62007 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_62002 ?auto_62000 ?auto_61999 ?auto_62001 ?auto_61998 )
      ( DELIVER-4PKG-VERIFY ?auto_61999 ?auto_62000 ?auto_62001 ?auto_62002 ?auto_61998 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_62108 - OBJ
      ?auto_62109 - OBJ
      ?auto_62110 - OBJ
      ?auto_62111 - OBJ
      ?auto_62107 - LOCATION
    )
    :vars
    (
      ?auto_62113 - LOCATION
      ?auto_62112 - CITY
      ?auto_62115 - LOCATION
      ?auto_62117 - LOCATION
      ?auto_62116 - LOCATION
      ?auto_62114 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_62113 ?auto_62112 ) ( IN-CITY ?auto_62107 ?auto_62112 ) ( not ( = ?auto_62107 ?auto_62113 ) ) ( OBJ-AT ?auto_62108 ?auto_62113 ) ( IN-CITY ?auto_62115 ?auto_62112 ) ( not ( = ?auto_62107 ?auto_62115 ) ) ( OBJ-AT ?auto_62109 ?auto_62115 ) ( IN-CITY ?auto_62117 ?auto_62112 ) ( not ( = ?auto_62107 ?auto_62117 ) ) ( OBJ-AT ?auto_62111 ?auto_62117 ) ( IN-CITY ?auto_62116 ?auto_62112 ) ( not ( = ?auto_62107 ?auto_62116 ) ) ( OBJ-AT ?auto_62110 ?auto_62116 ) ( TRUCK-AT ?auto_62114 ?auto_62107 ) ( not ( = ?auto_62110 ?auto_62111 ) ) ( not ( = ?auto_62117 ?auto_62116 ) ) ( not ( = ?auto_62110 ?auto_62109 ) ) ( not ( = ?auto_62111 ?auto_62109 ) ) ( not ( = ?auto_62115 ?auto_62117 ) ) ( not ( = ?auto_62115 ?auto_62116 ) ) ( not ( = ?auto_62110 ?auto_62108 ) ) ( not ( = ?auto_62111 ?auto_62108 ) ) ( not ( = ?auto_62109 ?auto_62108 ) ) ( not ( = ?auto_62113 ?auto_62115 ) ) ( not ( = ?auto_62113 ?auto_62117 ) ) ( not ( = ?auto_62113 ?auto_62116 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_62110 ?auto_62111 ?auto_62108 ?auto_62109 ?auto_62107 )
      ( DELIVER-4PKG-VERIFY ?auto_62108 ?auto_62109 ?auto_62110 ?auto_62111 ?auto_62107 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_62143 - OBJ
      ?auto_62144 - OBJ
      ?auto_62145 - OBJ
      ?auto_62146 - OBJ
      ?auto_62142 - LOCATION
    )
    :vars
    (
      ?auto_62148 - LOCATION
      ?auto_62147 - CITY
      ?auto_62150 - LOCATION
      ?auto_62152 - LOCATION
      ?auto_62151 - LOCATION
      ?auto_62149 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_62148 ?auto_62147 ) ( IN-CITY ?auto_62142 ?auto_62147 ) ( not ( = ?auto_62142 ?auto_62148 ) ) ( OBJ-AT ?auto_62143 ?auto_62148 ) ( IN-CITY ?auto_62150 ?auto_62147 ) ( not ( = ?auto_62142 ?auto_62150 ) ) ( OBJ-AT ?auto_62144 ?auto_62150 ) ( IN-CITY ?auto_62152 ?auto_62147 ) ( not ( = ?auto_62142 ?auto_62152 ) ) ( OBJ-AT ?auto_62145 ?auto_62152 ) ( IN-CITY ?auto_62151 ?auto_62147 ) ( not ( = ?auto_62142 ?auto_62151 ) ) ( OBJ-AT ?auto_62146 ?auto_62151 ) ( TRUCK-AT ?auto_62149 ?auto_62142 ) ( not ( = ?auto_62146 ?auto_62145 ) ) ( not ( = ?auto_62152 ?auto_62151 ) ) ( not ( = ?auto_62146 ?auto_62144 ) ) ( not ( = ?auto_62145 ?auto_62144 ) ) ( not ( = ?auto_62150 ?auto_62152 ) ) ( not ( = ?auto_62150 ?auto_62151 ) ) ( not ( = ?auto_62146 ?auto_62143 ) ) ( not ( = ?auto_62145 ?auto_62143 ) ) ( not ( = ?auto_62144 ?auto_62143 ) ) ( not ( = ?auto_62148 ?auto_62150 ) ) ( not ( = ?auto_62148 ?auto_62152 ) ) ( not ( = ?auto_62148 ?auto_62151 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_62146 ?auto_62145 ?auto_62143 ?auto_62144 ?auto_62142 )
      ( DELIVER-4PKG-VERIFY ?auto_62143 ?auto_62144 ?auto_62145 ?auto_62146 ?auto_62142 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_62495 - OBJ
      ?auto_62494 - LOCATION
    )
    :vars
    (
      ?auto_62497 - LOCATION
      ?auto_62498 - CITY
      ?auto_62496 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_62497 ?auto_62498 ) ( IN-CITY ?auto_62494 ?auto_62498 ) ( not ( = ?auto_62494 ?auto_62497 ) ) ( OBJ-AT ?auto_62495 ?auto_62497 ) ( TRUCK-AT ?auto_62496 ?auto_62494 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_62496 ?auto_62494 ?auto_62497 ?auto_62498 )
      ( !LOAD-TRUCK ?auto_62495 ?auto_62496 ?auto_62497 )
      ( !DRIVE-TRUCK ?auto_62496 ?auto_62497 ?auto_62494 ?auto_62498 )
      ( !UNLOAD-TRUCK ?auto_62495 ?auto_62496 ?auto_62494 )
      ( DELIVER-1PKG-VERIFY ?auto_62495 ?auto_62494 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_76232 - OBJ
      ?auto_76233 - OBJ
      ?auto_76234 - OBJ
      ?auto_76235 - OBJ
      ?auto_76236 - OBJ
      ?auto_76231 - LOCATION
    )
    :vars
    (
      ?auto_76237 - LOCATION
      ?auto_76239 - CITY
      ?auto_76240 - LOCATION
      ?auto_76241 - LOCATION
      ?auto_76242 - LOCATION
      ?auto_76238 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_76237 ?auto_76239 ) ( IN-CITY ?auto_76231 ?auto_76239 ) ( not ( = ?auto_76231 ?auto_76237 ) ) ( OBJ-AT ?auto_76236 ?auto_76237 ) ( IN-CITY ?auto_76240 ?auto_76239 ) ( not ( = ?auto_76231 ?auto_76240 ) ) ( OBJ-AT ?auto_76235 ?auto_76240 ) ( IN-CITY ?auto_76241 ?auto_76239 ) ( not ( = ?auto_76231 ?auto_76241 ) ) ( OBJ-AT ?auto_76234 ?auto_76241 ) ( OBJ-AT ?auto_76233 ?auto_76237 ) ( IN-CITY ?auto_76242 ?auto_76239 ) ( not ( = ?auto_76231 ?auto_76242 ) ) ( OBJ-AT ?auto_76232 ?auto_76242 ) ( TRUCK-AT ?auto_76238 ?auto_76231 ) ( not ( = ?auto_76232 ?auto_76233 ) ) ( not ( = ?auto_76237 ?auto_76242 ) ) ( not ( = ?auto_76232 ?auto_76234 ) ) ( not ( = ?auto_76233 ?auto_76234 ) ) ( not ( = ?auto_76241 ?auto_76237 ) ) ( not ( = ?auto_76241 ?auto_76242 ) ) ( not ( = ?auto_76232 ?auto_76235 ) ) ( not ( = ?auto_76233 ?auto_76235 ) ) ( not ( = ?auto_76234 ?auto_76235 ) ) ( not ( = ?auto_76240 ?auto_76241 ) ) ( not ( = ?auto_76240 ?auto_76237 ) ) ( not ( = ?auto_76240 ?auto_76242 ) ) ( not ( = ?auto_76232 ?auto_76236 ) ) ( not ( = ?auto_76233 ?auto_76236 ) ) ( not ( = ?auto_76234 ?auto_76236 ) ) ( not ( = ?auto_76235 ?auto_76236 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_76232 ?auto_76233 ?auto_76235 ?auto_76234 ?auto_76231 )
      ( DELIVER-1PKG ?auto_76236 ?auto_76231 )
      ( DELIVER-5PKG-VERIFY ?auto_76232 ?auto_76233 ?auto_76234 ?auto_76235 ?auto_76236 ?auto_76231 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_76283 - OBJ
      ?auto_76284 - OBJ
      ?auto_76285 - OBJ
      ?auto_76286 - OBJ
      ?auto_76287 - OBJ
      ?auto_76282 - LOCATION
    )
    :vars
    (
      ?auto_76293 - LOCATION
      ?auto_76288 - CITY
      ?auto_76290 - LOCATION
      ?auto_76292 - LOCATION
      ?auto_76291 - LOCATION
      ?auto_76289 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_76293 ?auto_76288 ) ( IN-CITY ?auto_76282 ?auto_76288 ) ( not ( = ?auto_76282 ?auto_76293 ) ) ( OBJ-AT ?auto_76286 ?auto_76293 ) ( IN-CITY ?auto_76290 ?auto_76288 ) ( not ( = ?auto_76282 ?auto_76290 ) ) ( OBJ-AT ?auto_76287 ?auto_76290 ) ( IN-CITY ?auto_76292 ?auto_76288 ) ( not ( = ?auto_76282 ?auto_76292 ) ) ( OBJ-AT ?auto_76285 ?auto_76292 ) ( OBJ-AT ?auto_76284 ?auto_76293 ) ( IN-CITY ?auto_76291 ?auto_76288 ) ( not ( = ?auto_76282 ?auto_76291 ) ) ( OBJ-AT ?auto_76283 ?auto_76291 ) ( TRUCK-AT ?auto_76289 ?auto_76282 ) ( not ( = ?auto_76283 ?auto_76284 ) ) ( not ( = ?auto_76293 ?auto_76291 ) ) ( not ( = ?auto_76283 ?auto_76285 ) ) ( not ( = ?auto_76284 ?auto_76285 ) ) ( not ( = ?auto_76292 ?auto_76293 ) ) ( not ( = ?auto_76292 ?auto_76291 ) ) ( not ( = ?auto_76283 ?auto_76287 ) ) ( not ( = ?auto_76284 ?auto_76287 ) ) ( not ( = ?auto_76285 ?auto_76287 ) ) ( not ( = ?auto_76290 ?auto_76292 ) ) ( not ( = ?auto_76290 ?auto_76293 ) ) ( not ( = ?auto_76290 ?auto_76291 ) ) ( not ( = ?auto_76283 ?auto_76286 ) ) ( not ( = ?auto_76284 ?auto_76286 ) ) ( not ( = ?auto_76285 ?auto_76286 ) ) ( not ( = ?auto_76287 ?auto_76286 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_76283 ?auto_76284 ?auto_76285 ?auto_76287 ?auto_76286 ?auto_76282 )
      ( DELIVER-5PKG-VERIFY ?auto_76283 ?auto_76284 ?auto_76285 ?auto_76286 ?auto_76287 ?auto_76282 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_76334 - OBJ
      ?auto_76335 - OBJ
      ?auto_76336 - OBJ
      ?auto_76337 - OBJ
      ?auto_76338 - OBJ
      ?auto_76333 - LOCATION
    )
    :vars
    (
      ?auto_76339 - LOCATION
      ?auto_76343 - CITY
      ?auto_76344 - LOCATION
      ?auto_76342 - LOCATION
      ?auto_76341 - LOCATION
      ?auto_76340 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_76339 ?auto_76343 ) ( IN-CITY ?auto_76333 ?auto_76343 ) ( not ( = ?auto_76333 ?auto_76339 ) ) ( OBJ-AT ?auto_76338 ?auto_76339 ) ( IN-CITY ?auto_76344 ?auto_76343 ) ( not ( = ?auto_76333 ?auto_76344 ) ) ( OBJ-AT ?auto_76336 ?auto_76344 ) ( IN-CITY ?auto_76342 ?auto_76343 ) ( not ( = ?auto_76333 ?auto_76342 ) ) ( OBJ-AT ?auto_76337 ?auto_76342 ) ( OBJ-AT ?auto_76335 ?auto_76339 ) ( IN-CITY ?auto_76341 ?auto_76343 ) ( not ( = ?auto_76333 ?auto_76341 ) ) ( OBJ-AT ?auto_76334 ?auto_76341 ) ( TRUCK-AT ?auto_76340 ?auto_76333 ) ( not ( = ?auto_76334 ?auto_76335 ) ) ( not ( = ?auto_76339 ?auto_76341 ) ) ( not ( = ?auto_76334 ?auto_76337 ) ) ( not ( = ?auto_76335 ?auto_76337 ) ) ( not ( = ?auto_76342 ?auto_76339 ) ) ( not ( = ?auto_76342 ?auto_76341 ) ) ( not ( = ?auto_76334 ?auto_76336 ) ) ( not ( = ?auto_76335 ?auto_76336 ) ) ( not ( = ?auto_76337 ?auto_76336 ) ) ( not ( = ?auto_76344 ?auto_76342 ) ) ( not ( = ?auto_76344 ?auto_76339 ) ) ( not ( = ?auto_76344 ?auto_76341 ) ) ( not ( = ?auto_76334 ?auto_76338 ) ) ( not ( = ?auto_76335 ?auto_76338 ) ) ( not ( = ?auto_76337 ?auto_76338 ) ) ( not ( = ?auto_76336 ?auto_76338 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_76334 ?auto_76335 ?auto_76337 ?auto_76338 ?auto_76336 ?auto_76333 )
      ( DELIVER-5PKG-VERIFY ?auto_76334 ?auto_76335 ?auto_76336 ?auto_76337 ?auto_76338 ?auto_76333 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_76385 - OBJ
      ?auto_76386 - OBJ
      ?auto_76387 - OBJ
      ?auto_76388 - OBJ
      ?auto_76389 - OBJ
      ?auto_76384 - LOCATION
    )
    :vars
    (
      ?auto_76390 - LOCATION
      ?auto_76394 - CITY
      ?auto_76395 - LOCATION
      ?auto_76393 - LOCATION
      ?auto_76392 - LOCATION
      ?auto_76391 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_76390 ?auto_76394 ) ( IN-CITY ?auto_76384 ?auto_76394 ) ( not ( = ?auto_76384 ?auto_76390 ) ) ( OBJ-AT ?auto_76388 ?auto_76390 ) ( IN-CITY ?auto_76395 ?auto_76394 ) ( not ( = ?auto_76384 ?auto_76395 ) ) ( OBJ-AT ?auto_76387 ?auto_76395 ) ( IN-CITY ?auto_76393 ?auto_76394 ) ( not ( = ?auto_76384 ?auto_76393 ) ) ( OBJ-AT ?auto_76389 ?auto_76393 ) ( OBJ-AT ?auto_76386 ?auto_76390 ) ( IN-CITY ?auto_76392 ?auto_76394 ) ( not ( = ?auto_76384 ?auto_76392 ) ) ( OBJ-AT ?auto_76385 ?auto_76392 ) ( TRUCK-AT ?auto_76391 ?auto_76384 ) ( not ( = ?auto_76385 ?auto_76386 ) ) ( not ( = ?auto_76390 ?auto_76392 ) ) ( not ( = ?auto_76385 ?auto_76389 ) ) ( not ( = ?auto_76386 ?auto_76389 ) ) ( not ( = ?auto_76393 ?auto_76390 ) ) ( not ( = ?auto_76393 ?auto_76392 ) ) ( not ( = ?auto_76385 ?auto_76387 ) ) ( not ( = ?auto_76386 ?auto_76387 ) ) ( not ( = ?auto_76389 ?auto_76387 ) ) ( not ( = ?auto_76395 ?auto_76393 ) ) ( not ( = ?auto_76395 ?auto_76390 ) ) ( not ( = ?auto_76395 ?auto_76392 ) ) ( not ( = ?auto_76385 ?auto_76388 ) ) ( not ( = ?auto_76386 ?auto_76388 ) ) ( not ( = ?auto_76389 ?auto_76388 ) ) ( not ( = ?auto_76387 ?auto_76388 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_76385 ?auto_76386 ?auto_76389 ?auto_76388 ?auto_76387 ?auto_76384 )
      ( DELIVER-5PKG-VERIFY ?auto_76385 ?auto_76386 ?auto_76387 ?auto_76388 ?auto_76389 ?auto_76384 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_76598 - OBJ
      ?auto_76599 - OBJ
      ?auto_76600 - OBJ
      ?auto_76601 - OBJ
      ?auto_76602 - OBJ
      ?auto_76597 - LOCATION
    )
    :vars
    (
      ?auto_76603 - LOCATION
      ?auto_76607 - CITY
      ?auto_76608 - LOCATION
      ?auto_76606 - LOCATION
      ?auto_76605 - LOCATION
      ?auto_76604 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_76603 ?auto_76607 ) ( IN-CITY ?auto_76597 ?auto_76607 ) ( not ( = ?auto_76597 ?auto_76603 ) ) ( OBJ-AT ?auto_76600 ?auto_76603 ) ( IN-CITY ?auto_76608 ?auto_76607 ) ( not ( = ?auto_76597 ?auto_76608 ) ) ( OBJ-AT ?auto_76602 ?auto_76608 ) ( IN-CITY ?auto_76606 ?auto_76607 ) ( not ( = ?auto_76597 ?auto_76606 ) ) ( OBJ-AT ?auto_76601 ?auto_76606 ) ( OBJ-AT ?auto_76599 ?auto_76603 ) ( IN-CITY ?auto_76605 ?auto_76607 ) ( not ( = ?auto_76597 ?auto_76605 ) ) ( OBJ-AT ?auto_76598 ?auto_76605 ) ( TRUCK-AT ?auto_76604 ?auto_76597 ) ( not ( = ?auto_76598 ?auto_76599 ) ) ( not ( = ?auto_76603 ?auto_76605 ) ) ( not ( = ?auto_76598 ?auto_76601 ) ) ( not ( = ?auto_76599 ?auto_76601 ) ) ( not ( = ?auto_76606 ?auto_76603 ) ) ( not ( = ?auto_76606 ?auto_76605 ) ) ( not ( = ?auto_76598 ?auto_76602 ) ) ( not ( = ?auto_76599 ?auto_76602 ) ) ( not ( = ?auto_76601 ?auto_76602 ) ) ( not ( = ?auto_76608 ?auto_76606 ) ) ( not ( = ?auto_76608 ?auto_76603 ) ) ( not ( = ?auto_76608 ?auto_76605 ) ) ( not ( = ?auto_76598 ?auto_76600 ) ) ( not ( = ?auto_76599 ?auto_76600 ) ) ( not ( = ?auto_76601 ?auto_76600 ) ) ( not ( = ?auto_76602 ?auto_76600 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_76598 ?auto_76599 ?auto_76601 ?auto_76600 ?auto_76602 ?auto_76597 )
      ( DELIVER-5PKG-VERIFY ?auto_76598 ?auto_76599 ?auto_76600 ?auto_76601 ?auto_76602 ?auto_76597 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_76649 - OBJ
      ?auto_76650 - OBJ
      ?auto_76651 - OBJ
      ?auto_76652 - OBJ
      ?auto_76653 - OBJ
      ?auto_76648 - LOCATION
    )
    :vars
    (
      ?auto_76654 - LOCATION
      ?auto_76658 - CITY
      ?auto_76659 - LOCATION
      ?auto_76657 - LOCATION
      ?auto_76656 - LOCATION
      ?auto_76655 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_76654 ?auto_76658 ) ( IN-CITY ?auto_76648 ?auto_76658 ) ( not ( = ?auto_76648 ?auto_76654 ) ) ( OBJ-AT ?auto_76651 ?auto_76654 ) ( IN-CITY ?auto_76659 ?auto_76658 ) ( not ( = ?auto_76648 ?auto_76659 ) ) ( OBJ-AT ?auto_76652 ?auto_76659 ) ( IN-CITY ?auto_76657 ?auto_76658 ) ( not ( = ?auto_76648 ?auto_76657 ) ) ( OBJ-AT ?auto_76653 ?auto_76657 ) ( OBJ-AT ?auto_76650 ?auto_76654 ) ( IN-CITY ?auto_76656 ?auto_76658 ) ( not ( = ?auto_76648 ?auto_76656 ) ) ( OBJ-AT ?auto_76649 ?auto_76656 ) ( TRUCK-AT ?auto_76655 ?auto_76648 ) ( not ( = ?auto_76649 ?auto_76650 ) ) ( not ( = ?auto_76654 ?auto_76656 ) ) ( not ( = ?auto_76649 ?auto_76653 ) ) ( not ( = ?auto_76650 ?auto_76653 ) ) ( not ( = ?auto_76657 ?auto_76654 ) ) ( not ( = ?auto_76657 ?auto_76656 ) ) ( not ( = ?auto_76649 ?auto_76652 ) ) ( not ( = ?auto_76650 ?auto_76652 ) ) ( not ( = ?auto_76653 ?auto_76652 ) ) ( not ( = ?auto_76659 ?auto_76657 ) ) ( not ( = ?auto_76659 ?auto_76654 ) ) ( not ( = ?auto_76659 ?auto_76656 ) ) ( not ( = ?auto_76649 ?auto_76651 ) ) ( not ( = ?auto_76650 ?auto_76651 ) ) ( not ( = ?auto_76653 ?auto_76651 ) ) ( not ( = ?auto_76652 ?auto_76651 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_76649 ?auto_76650 ?auto_76653 ?auto_76651 ?auto_76652 ?auto_76648 )
      ( DELIVER-5PKG-VERIFY ?auto_76649 ?auto_76650 ?auto_76651 ?auto_76652 ?auto_76653 ?auto_76648 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_76916 - OBJ
      ?auto_76917 - OBJ
      ?auto_76918 - OBJ
      ?auto_76919 - OBJ
      ?auto_76920 - OBJ
      ?auto_76915 - LOCATION
    )
    :vars
    (
      ?auto_76921 - LOCATION
      ?auto_76925 - CITY
      ?auto_76926 - LOCATION
      ?auto_76924 - LOCATION
      ?auto_76923 - LOCATION
      ?auto_76922 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_76921 ?auto_76925 ) ( IN-CITY ?auto_76915 ?auto_76925 ) ( not ( = ?auto_76915 ?auto_76921 ) ) ( OBJ-AT ?auto_76920 ?auto_76921 ) ( IN-CITY ?auto_76926 ?auto_76925 ) ( not ( = ?auto_76915 ?auto_76926 ) ) ( OBJ-AT ?auto_76919 ?auto_76926 ) ( IN-CITY ?auto_76924 ?auto_76925 ) ( not ( = ?auto_76915 ?auto_76924 ) ) ( OBJ-AT ?auto_76917 ?auto_76924 ) ( OBJ-AT ?auto_76918 ?auto_76921 ) ( IN-CITY ?auto_76923 ?auto_76925 ) ( not ( = ?auto_76915 ?auto_76923 ) ) ( OBJ-AT ?auto_76916 ?auto_76923 ) ( TRUCK-AT ?auto_76922 ?auto_76915 ) ( not ( = ?auto_76916 ?auto_76918 ) ) ( not ( = ?auto_76921 ?auto_76923 ) ) ( not ( = ?auto_76916 ?auto_76917 ) ) ( not ( = ?auto_76918 ?auto_76917 ) ) ( not ( = ?auto_76924 ?auto_76921 ) ) ( not ( = ?auto_76924 ?auto_76923 ) ) ( not ( = ?auto_76916 ?auto_76919 ) ) ( not ( = ?auto_76918 ?auto_76919 ) ) ( not ( = ?auto_76917 ?auto_76919 ) ) ( not ( = ?auto_76926 ?auto_76924 ) ) ( not ( = ?auto_76926 ?auto_76921 ) ) ( not ( = ?auto_76926 ?auto_76923 ) ) ( not ( = ?auto_76916 ?auto_76920 ) ) ( not ( = ?auto_76918 ?auto_76920 ) ) ( not ( = ?auto_76917 ?auto_76920 ) ) ( not ( = ?auto_76919 ?auto_76920 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_76916 ?auto_76918 ?auto_76917 ?auto_76920 ?auto_76919 ?auto_76915 )
      ( DELIVER-5PKG-VERIFY ?auto_76916 ?auto_76917 ?auto_76918 ?auto_76919 ?auto_76920 ?auto_76915 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_76967 - OBJ
      ?auto_76968 - OBJ
      ?auto_76969 - OBJ
      ?auto_76970 - OBJ
      ?auto_76971 - OBJ
      ?auto_76966 - LOCATION
    )
    :vars
    (
      ?auto_76972 - LOCATION
      ?auto_76976 - CITY
      ?auto_76977 - LOCATION
      ?auto_76975 - LOCATION
      ?auto_76974 - LOCATION
      ?auto_76973 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_76972 ?auto_76976 ) ( IN-CITY ?auto_76966 ?auto_76976 ) ( not ( = ?auto_76966 ?auto_76972 ) ) ( OBJ-AT ?auto_76970 ?auto_76972 ) ( IN-CITY ?auto_76977 ?auto_76976 ) ( not ( = ?auto_76966 ?auto_76977 ) ) ( OBJ-AT ?auto_76971 ?auto_76977 ) ( IN-CITY ?auto_76975 ?auto_76976 ) ( not ( = ?auto_76966 ?auto_76975 ) ) ( OBJ-AT ?auto_76968 ?auto_76975 ) ( OBJ-AT ?auto_76969 ?auto_76972 ) ( IN-CITY ?auto_76974 ?auto_76976 ) ( not ( = ?auto_76966 ?auto_76974 ) ) ( OBJ-AT ?auto_76967 ?auto_76974 ) ( TRUCK-AT ?auto_76973 ?auto_76966 ) ( not ( = ?auto_76967 ?auto_76969 ) ) ( not ( = ?auto_76972 ?auto_76974 ) ) ( not ( = ?auto_76967 ?auto_76968 ) ) ( not ( = ?auto_76969 ?auto_76968 ) ) ( not ( = ?auto_76975 ?auto_76972 ) ) ( not ( = ?auto_76975 ?auto_76974 ) ) ( not ( = ?auto_76967 ?auto_76971 ) ) ( not ( = ?auto_76969 ?auto_76971 ) ) ( not ( = ?auto_76968 ?auto_76971 ) ) ( not ( = ?auto_76977 ?auto_76975 ) ) ( not ( = ?auto_76977 ?auto_76972 ) ) ( not ( = ?auto_76977 ?auto_76974 ) ) ( not ( = ?auto_76967 ?auto_76970 ) ) ( not ( = ?auto_76969 ?auto_76970 ) ) ( not ( = ?auto_76968 ?auto_76970 ) ) ( not ( = ?auto_76971 ?auto_76970 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_76967 ?auto_76969 ?auto_76968 ?auto_76970 ?auto_76971 ?auto_76966 )
      ( DELIVER-5PKG-VERIFY ?auto_76967 ?auto_76968 ?auto_76969 ?auto_76970 ?auto_76971 ?auto_76966 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_77127 - OBJ
      ?auto_77128 - OBJ
      ?auto_77129 - OBJ
      ?auto_77130 - OBJ
      ?auto_77131 - OBJ
      ?auto_77126 - LOCATION
    )
    :vars
    (
      ?auto_77132 - LOCATION
      ?auto_77136 - CITY
      ?auto_77137 - LOCATION
      ?auto_77135 - LOCATION
      ?auto_77134 - LOCATION
      ?auto_77133 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_77132 ?auto_77136 ) ( IN-CITY ?auto_77126 ?auto_77136 ) ( not ( = ?auto_77126 ?auto_77132 ) ) ( OBJ-AT ?auto_77131 ?auto_77132 ) ( IN-CITY ?auto_77137 ?auto_77136 ) ( not ( = ?auto_77126 ?auto_77137 ) ) ( OBJ-AT ?auto_77129 ?auto_77137 ) ( IN-CITY ?auto_77135 ?auto_77136 ) ( not ( = ?auto_77126 ?auto_77135 ) ) ( OBJ-AT ?auto_77128 ?auto_77135 ) ( OBJ-AT ?auto_77130 ?auto_77132 ) ( IN-CITY ?auto_77134 ?auto_77136 ) ( not ( = ?auto_77126 ?auto_77134 ) ) ( OBJ-AT ?auto_77127 ?auto_77134 ) ( TRUCK-AT ?auto_77133 ?auto_77126 ) ( not ( = ?auto_77127 ?auto_77130 ) ) ( not ( = ?auto_77132 ?auto_77134 ) ) ( not ( = ?auto_77127 ?auto_77128 ) ) ( not ( = ?auto_77130 ?auto_77128 ) ) ( not ( = ?auto_77135 ?auto_77132 ) ) ( not ( = ?auto_77135 ?auto_77134 ) ) ( not ( = ?auto_77127 ?auto_77129 ) ) ( not ( = ?auto_77130 ?auto_77129 ) ) ( not ( = ?auto_77128 ?auto_77129 ) ) ( not ( = ?auto_77137 ?auto_77135 ) ) ( not ( = ?auto_77137 ?auto_77132 ) ) ( not ( = ?auto_77137 ?auto_77134 ) ) ( not ( = ?auto_77127 ?auto_77131 ) ) ( not ( = ?auto_77130 ?auto_77131 ) ) ( not ( = ?auto_77128 ?auto_77131 ) ) ( not ( = ?auto_77129 ?auto_77131 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_77127 ?auto_77130 ?auto_77128 ?auto_77131 ?auto_77129 ?auto_77126 )
      ( DELIVER-5PKG-VERIFY ?auto_77127 ?auto_77128 ?auto_77129 ?auto_77130 ?auto_77131 ?auto_77126 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_77178 - OBJ
      ?auto_77179 - OBJ
      ?auto_77180 - OBJ
      ?auto_77181 - OBJ
      ?auto_77182 - OBJ
      ?auto_77177 - LOCATION
    )
    :vars
    (
      ?auto_77183 - LOCATION
      ?auto_77187 - CITY
      ?auto_77188 - LOCATION
      ?auto_77186 - LOCATION
      ?auto_77185 - LOCATION
      ?auto_77184 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_77183 ?auto_77187 ) ( IN-CITY ?auto_77177 ?auto_77187 ) ( not ( = ?auto_77177 ?auto_77183 ) ) ( OBJ-AT ?auto_77181 ?auto_77183 ) ( IN-CITY ?auto_77188 ?auto_77187 ) ( not ( = ?auto_77177 ?auto_77188 ) ) ( OBJ-AT ?auto_77180 ?auto_77188 ) ( IN-CITY ?auto_77186 ?auto_77187 ) ( not ( = ?auto_77177 ?auto_77186 ) ) ( OBJ-AT ?auto_77179 ?auto_77186 ) ( OBJ-AT ?auto_77182 ?auto_77183 ) ( IN-CITY ?auto_77185 ?auto_77187 ) ( not ( = ?auto_77177 ?auto_77185 ) ) ( OBJ-AT ?auto_77178 ?auto_77185 ) ( TRUCK-AT ?auto_77184 ?auto_77177 ) ( not ( = ?auto_77178 ?auto_77182 ) ) ( not ( = ?auto_77183 ?auto_77185 ) ) ( not ( = ?auto_77178 ?auto_77179 ) ) ( not ( = ?auto_77182 ?auto_77179 ) ) ( not ( = ?auto_77186 ?auto_77183 ) ) ( not ( = ?auto_77186 ?auto_77185 ) ) ( not ( = ?auto_77178 ?auto_77180 ) ) ( not ( = ?auto_77182 ?auto_77180 ) ) ( not ( = ?auto_77179 ?auto_77180 ) ) ( not ( = ?auto_77188 ?auto_77186 ) ) ( not ( = ?auto_77188 ?auto_77183 ) ) ( not ( = ?auto_77188 ?auto_77185 ) ) ( not ( = ?auto_77178 ?auto_77181 ) ) ( not ( = ?auto_77182 ?auto_77181 ) ) ( not ( = ?auto_77179 ?auto_77181 ) ) ( not ( = ?auto_77180 ?auto_77181 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_77178 ?auto_77182 ?auto_77179 ?auto_77181 ?auto_77180 ?auto_77177 )
      ( DELIVER-5PKG-VERIFY ?auto_77178 ?auto_77179 ?auto_77180 ?auto_77181 ?auto_77182 ?auto_77177 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_77336 - OBJ
      ?auto_77337 - OBJ
      ?auto_77338 - OBJ
      ?auto_77339 - OBJ
      ?auto_77340 - OBJ
      ?auto_77335 - LOCATION
    )
    :vars
    (
      ?auto_77341 - LOCATION
      ?auto_77345 - CITY
      ?auto_77346 - LOCATION
      ?auto_77344 - LOCATION
      ?auto_77343 - LOCATION
      ?auto_77342 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_77341 ?auto_77345 ) ( IN-CITY ?auto_77335 ?auto_77345 ) ( not ( = ?auto_77335 ?auto_77341 ) ) ( OBJ-AT ?auto_77338 ?auto_77341 ) ( IN-CITY ?auto_77346 ?auto_77345 ) ( not ( = ?auto_77335 ?auto_77346 ) ) ( OBJ-AT ?auto_77340 ?auto_77346 ) ( IN-CITY ?auto_77344 ?auto_77345 ) ( not ( = ?auto_77335 ?auto_77344 ) ) ( OBJ-AT ?auto_77337 ?auto_77344 ) ( OBJ-AT ?auto_77339 ?auto_77341 ) ( IN-CITY ?auto_77343 ?auto_77345 ) ( not ( = ?auto_77335 ?auto_77343 ) ) ( OBJ-AT ?auto_77336 ?auto_77343 ) ( TRUCK-AT ?auto_77342 ?auto_77335 ) ( not ( = ?auto_77336 ?auto_77339 ) ) ( not ( = ?auto_77341 ?auto_77343 ) ) ( not ( = ?auto_77336 ?auto_77337 ) ) ( not ( = ?auto_77339 ?auto_77337 ) ) ( not ( = ?auto_77344 ?auto_77341 ) ) ( not ( = ?auto_77344 ?auto_77343 ) ) ( not ( = ?auto_77336 ?auto_77340 ) ) ( not ( = ?auto_77339 ?auto_77340 ) ) ( not ( = ?auto_77337 ?auto_77340 ) ) ( not ( = ?auto_77346 ?auto_77344 ) ) ( not ( = ?auto_77346 ?auto_77341 ) ) ( not ( = ?auto_77346 ?auto_77343 ) ) ( not ( = ?auto_77336 ?auto_77338 ) ) ( not ( = ?auto_77339 ?auto_77338 ) ) ( not ( = ?auto_77337 ?auto_77338 ) ) ( not ( = ?auto_77340 ?auto_77338 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_77336 ?auto_77339 ?auto_77337 ?auto_77338 ?auto_77340 ?auto_77335 )
      ( DELIVER-5PKG-VERIFY ?auto_77336 ?auto_77337 ?auto_77338 ?auto_77339 ?auto_77340 ?auto_77335 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_77442 - OBJ
      ?auto_77443 - OBJ
      ?auto_77444 - OBJ
      ?auto_77445 - OBJ
      ?auto_77446 - OBJ
      ?auto_77441 - LOCATION
    )
    :vars
    (
      ?auto_77447 - LOCATION
      ?auto_77451 - CITY
      ?auto_77452 - LOCATION
      ?auto_77450 - LOCATION
      ?auto_77449 - LOCATION
      ?auto_77448 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_77447 ?auto_77451 ) ( IN-CITY ?auto_77441 ?auto_77451 ) ( not ( = ?auto_77441 ?auto_77447 ) ) ( OBJ-AT ?auto_77444 ?auto_77447 ) ( IN-CITY ?auto_77452 ?auto_77451 ) ( not ( = ?auto_77441 ?auto_77452 ) ) ( OBJ-AT ?auto_77445 ?auto_77452 ) ( IN-CITY ?auto_77450 ?auto_77451 ) ( not ( = ?auto_77441 ?auto_77450 ) ) ( OBJ-AT ?auto_77443 ?auto_77450 ) ( OBJ-AT ?auto_77446 ?auto_77447 ) ( IN-CITY ?auto_77449 ?auto_77451 ) ( not ( = ?auto_77441 ?auto_77449 ) ) ( OBJ-AT ?auto_77442 ?auto_77449 ) ( TRUCK-AT ?auto_77448 ?auto_77441 ) ( not ( = ?auto_77442 ?auto_77446 ) ) ( not ( = ?auto_77447 ?auto_77449 ) ) ( not ( = ?auto_77442 ?auto_77443 ) ) ( not ( = ?auto_77446 ?auto_77443 ) ) ( not ( = ?auto_77450 ?auto_77447 ) ) ( not ( = ?auto_77450 ?auto_77449 ) ) ( not ( = ?auto_77442 ?auto_77445 ) ) ( not ( = ?auto_77446 ?auto_77445 ) ) ( not ( = ?auto_77443 ?auto_77445 ) ) ( not ( = ?auto_77452 ?auto_77450 ) ) ( not ( = ?auto_77452 ?auto_77447 ) ) ( not ( = ?auto_77452 ?auto_77449 ) ) ( not ( = ?auto_77442 ?auto_77444 ) ) ( not ( = ?auto_77446 ?auto_77444 ) ) ( not ( = ?auto_77443 ?auto_77444 ) ) ( not ( = ?auto_77445 ?auto_77444 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_77442 ?auto_77446 ?auto_77443 ?auto_77444 ?auto_77445 ?auto_77441 )
      ( DELIVER-5PKG-VERIFY ?auto_77442 ?auto_77443 ?auto_77444 ?auto_77445 ?auto_77446 ?auto_77441 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_77709 - OBJ
      ?auto_77710 - OBJ
      ?auto_77711 - OBJ
      ?auto_77712 - OBJ
      ?auto_77713 - OBJ
      ?auto_77708 - LOCATION
    )
    :vars
    (
      ?auto_77714 - LOCATION
      ?auto_77718 - CITY
      ?auto_77719 - LOCATION
      ?auto_77717 - LOCATION
      ?auto_77716 - LOCATION
      ?auto_77715 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_77714 ?auto_77718 ) ( IN-CITY ?auto_77708 ?auto_77718 ) ( not ( = ?auto_77708 ?auto_77714 ) ) ( OBJ-AT ?auto_77713 ?auto_77714 ) ( IN-CITY ?auto_77719 ?auto_77718 ) ( not ( = ?auto_77708 ?auto_77719 ) ) ( OBJ-AT ?auto_77710 ?auto_77719 ) ( IN-CITY ?auto_77717 ?auto_77718 ) ( not ( = ?auto_77708 ?auto_77717 ) ) ( OBJ-AT ?auto_77712 ?auto_77717 ) ( OBJ-AT ?auto_77711 ?auto_77714 ) ( IN-CITY ?auto_77716 ?auto_77718 ) ( not ( = ?auto_77708 ?auto_77716 ) ) ( OBJ-AT ?auto_77709 ?auto_77716 ) ( TRUCK-AT ?auto_77715 ?auto_77708 ) ( not ( = ?auto_77709 ?auto_77711 ) ) ( not ( = ?auto_77714 ?auto_77716 ) ) ( not ( = ?auto_77709 ?auto_77712 ) ) ( not ( = ?auto_77711 ?auto_77712 ) ) ( not ( = ?auto_77717 ?auto_77714 ) ) ( not ( = ?auto_77717 ?auto_77716 ) ) ( not ( = ?auto_77709 ?auto_77710 ) ) ( not ( = ?auto_77711 ?auto_77710 ) ) ( not ( = ?auto_77712 ?auto_77710 ) ) ( not ( = ?auto_77719 ?auto_77717 ) ) ( not ( = ?auto_77719 ?auto_77714 ) ) ( not ( = ?auto_77719 ?auto_77716 ) ) ( not ( = ?auto_77709 ?auto_77713 ) ) ( not ( = ?auto_77711 ?auto_77713 ) ) ( not ( = ?auto_77712 ?auto_77713 ) ) ( not ( = ?auto_77710 ?auto_77713 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_77709 ?auto_77711 ?auto_77712 ?auto_77713 ?auto_77710 ?auto_77708 )
      ( DELIVER-5PKG-VERIFY ?auto_77709 ?auto_77710 ?auto_77711 ?auto_77712 ?auto_77713 ?auto_77708 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_77760 - OBJ
      ?auto_77761 - OBJ
      ?auto_77762 - OBJ
      ?auto_77763 - OBJ
      ?auto_77764 - OBJ
      ?auto_77759 - LOCATION
    )
    :vars
    (
      ?auto_77765 - LOCATION
      ?auto_77769 - CITY
      ?auto_77770 - LOCATION
      ?auto_77768 - LOCATION
      ?auto_77767 - LOCATION
      ?auto_77766 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_77765 ?auto_77769 ) ( IN-CITY ?auto_77759 ?auto_77769 ) ( not ( = ?auto_77759 ?auto_77765 ) ) ( OBJ-AT ?auto_77763 ?auto_77765 ) ( IN-CITY ?auto_77770 ?auto_77769 ) ( not ( = ?auto_77759 ?auto_77770 ) ) ( OBJ-AT ?auto_77761 ?auto_77770 ) ( IN-CITY ?auto_77768 ?auto_77769 ) ( not ( = ?auto_77759 ?auto_77768 ) ) ( OBJ-AT ?auto_77764 ?auto_77768 ) ( OBJ-AT ?auto_77762 ?auto_77765 ) ( IN-CITY ?auto_77767 ?auto_77769 ) ( not ( = ?auto_77759 ?auto_77767 ) ) ( OBJ-AT ?auto_77760 ?auto_77767 ) ( TRUCK-AT ?auto_77766 ?auto_77759 ) ( not ( = ?auto_77760 ?auto_77762 ) ) ( not ( = ?auto_77765 ?auto_77767 ) ) ( not ( = ?auto_77760 ?auto_77764 ) ) ( not ( = ?auto_77762 ?auto_77764 ) ) ( not ( = ?auto_77768 ?auto_77765 ) ) ( not ( = ?auto_77768 ?auto_77767 ) ) ( not ( = ?auto_77760 ?auto_77761 ) ) ( not ( = ?auto_77762 ?auto_77761 ) ) ( not ( = ?auto_77764 ?auto_77761 ) ) ( not ( = ?auto_77770 ?auto_77768 ) ) ( not ( = ?auto_77770 ?auto_77765 ) ) ( not ( = ?auto_77770 ?auto_77767 ) ) ( not ( = ?auto_77760 ?auto_77763 ) ) ( not ( = ?auto_77762 ?auto_77763 ) ) ( not ( = ?auto_77764 ?auto_77763 ) ) ( not ( = ?auto_77761 ?auto_77763 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_77760 ?auto_77762 ?auto_77764 ?auto_77763 ?auto_77761 ?auto_77759 )
      ( DELIVER-5PKG-VERIFY ?auto_77760 ?auto_77761 ?auto_77762 ?auto_77763 ?auto_77764 ?auto_77759 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_77811 - OBJ
      ?auto_77812 - OBJ
      ?auto_77813 - OBJ
      ?auto_77814 - OBJ
      ?auto_77815 - OBJ
      ?auto_77810 - LOCATION
    )
    :vars
    (
      ?auto_77816 - LOCATION
      ?auto_77820 - CITY
      ?auto_77821 - LOCATION
      ?auto_77819 - LOCATION
      ?auto_77818 - LOCATION
      ?auto_77817 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_77816 ?auto_77820 ) ( IN-CITY ?auto_77810 ?auto_77820 ) ( not ( = ?auto_77810 ?auto_77816 ) ) ( OBJ-AT ?auto_77815 ?auto_77816 ) ( IN-CITY ?auto_77821 ?auto_77820 ) ( not ( = ?auto_77810 ?auto_77821 ) ) ( OBJ-AT ?auto_77812 ?auto_77821 ) ( IN-CITY ?auto_77819 ?auto_77820 ) ( not ( = ?auto_77810 ?auto_77819 ) ) ( OBJ-AT ?auto_77813 ?auto_77819 ) ( OBJ-AT ?auto_77814 ?auto_77816 ) ( IN-CITY ?auto_77818 ?auto_77820 ) ( not ( = ?auto_77810 ?auto_77818 ) ) ( OBJ-AT ?auto_77811 ?auto_77818 ) ( TRUCK-AT ?auto_77817 ?auto_77810 ) ( not ( = ?auto_77811 ?auto_77814 ) ) ( not ( = ?auto_77816 ?auto_77818 ) ) ( not ( = ?auto_77811 ?auto_77813 ) ) ( not ( = ?auto_77814 ?auto_77813 ) ) ( not ( = ?auto_77819 ?auto_77816 ) ) ( not ( = ?auto_77819 ?auto_77818 ) ) ( not ( = ?auto_77811 ?auto_77812 ) ) ( not ( = ?auto_77814 ?auto_77812 ) ) ( not ( = ?auto_77813 ?auto_77812 ) ) ( not ( = ?auto_77821 ?auto_77819 ) ) ( not ( = ?auto_77821 ?auto_77816 ) ) ( not ( = ?auto_77821 ?auto_77818 ) ) ( not ( = ?auto_77811 ?auto_77815 ) ) ( not ( = ?auto_77814 ?auto_77815 ) ) ( not ( = ?auto_77813 ?auto_77815 ) ) ( not ( = ?auto_77812 ?auto_77815 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_77811 ?auto_77814 ?auto_77813 ?auto_77815 ?auto_77812 ?auto_77810 )
      ( DELIVER-5PKG-VERIFY ?auto_77811 ?auto_77812 ?auto_77813 ?auto_77814 ?auto_77815 ?auto_77810 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_77862 - OBJ
      ?auto_77863 - OBJ
      ?auto_77864 - OBJ
      ?auto_77865 - OBJ
      ?auto_77866 - OBJ
      ?auto_77861 - LOCATION
    )
    :vars
    (
      ?auto_77867 - LOCATION
      ?auto_77871 - CITY
      ?auto_77872 - LOCATION
      ?auto_77870 - LOCATION
      ?auto_77869 - LOCATION
      ?auto_77868 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_77867 ?auto_77871 ) ( IN-CITY ?auto_77861 ?auto_77871 ) ( not ( = ?auto_77861 ?auto_77867 ) ) ( OBJ-AT ?auto_77865 ?auto_77867 ) ( IN-CITY ?auto_77872 ?auto_77871 ) ( not ( = ?auto_77861 ?auto_77872 ) ) ( OBJ-AT ?auto_77863 ?auto_77872 ) ( IN-CITY ?auto_77870 ?auto_77871 ) ( not ( = ?auto_77861 ?auto_77870 ) ) ( OBJ-AT ?auto_77864 ?auto_77870 ) ( OBJ-AT ?auto_77866 ?auto_77867 ) ( IN-CITY ?auto_77869 ?auto_77871 ) ( not ( = ?auto_77861 ?auto_77869 ) ) ( OBJ-AT ?auto_77862 ?auto_77869 ) ( TRUCK-AT ?auto_77868 ?auto_77861 ) ( not ( = ?auto_77862 ?auto_77866 ) ) ( not ( = ?auto_77867 ?auto_77869 ) ) ( not ( = ?auto_77862 ?auto_77864 ) ) ( not ( = ?auto_77866 ?auto_77864 ) ) ( not ( = ?auto_77870 ?auto_77867 ) ) ( not ( = ?auto_77870 ?auto_77869 ) ) ( not ( = ?auto_77862 ?auto_77863 ) ) ( not ( = ?auto_77866 ?auto_77863 ) ) ( not ( = ?auto_77864 ?auto_77863 ) ) ( not ( = ?auto_77872 ?auto_77870 ) ) ( not ( = ?auto_77872 ?auto_77867 ) ) ( not ( = ?auto_77872 ?auto_77869 ) ) ( not ( = ?auto_77862 ?auto_77865 ) ) ( not ( = ?auto_77866 ?auto_77865 ) ) ( not ( = ?auto_77864 ?auto_77865 ) ) ( not ( = ?auto_77863 ?auto_77865 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_77862 ?auto_77866 ?auto_77864 ?auto_77865 ?auto_77863 ?auto_77861 )
      ( DELIVER-5PKG-VERIFY ?auto_77862 ?auto_77863 ?auto_77864 ?auto_77865 ?auto_77866 ?auto_77861 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_78129 - OBJ
      ?auto_78130 - OBJ
      ?auto_78131 - OBJ
      ?auto_78132 - OBJ
      ?auto_78133 - OBJ
      ?auto_78128 - LOCATION
    )
    :vars
    (
      ?auto_78134 - LOCATION
      ?auto_78138 - CITY
      ?auto_78139 - LOCATION
      ?auto_78137 - LOCATION
      ?auto_78136 - LOCATION
      ?auto_78135 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_78134 ?auto_78138 ) ( IN-CITY ?auto_78128 ?auto_78138 ) ( not ( = ?auto_78128 ?auto_78134 ) ) ( OBJ-AT ?auto_78131 ?auto_78134 ) ( IN-CITY ?auto_78139 ?auto_78138 ) ( not ( = ?auto_78128 ?auto_78139 ) ) ( OBJ-AT ?auto_78130 ?auto_78139 ) ( IN-CITY ?auto_78137 ?auto_78138 ) ( not ( = ?auto_78128 ?auto_78137 ) ) ( OBJ-AT ?auto_78133 ?auto_78137 ) ( OBJ-AT ?auto_78132 ?auto_78134 ) ( IN-CITY ?auto_78136 ?auto_78138 ) ( not ( = ?auto_78128 ?auto_78136 ) ) ( OBJ-AT ?auto_78129 ?auto_78136 ) ( TRUCK-AT ?auto_78135 ?auto_78128 ) ( not ( = ?auto_78129 ?auto_78132 ) ) ( not ( = ?auto_78134 ?auto_78136 ) ) ( not ( = ?auto_78129 ?auto_78133 ) ) ( not ( = ?auto_78132 ?auto_78133 ) ) ( not ( = ?auto_78137 ?auto_78134 ) ) ( not ( = ?auto_78137 ?auto_78136 ) ) ( not ( = ?auto_78129 ?auto_78130 ) ) ( not ( = ?auto_78132 ?auto_78130 ) ) ( not ( = ?auto_78133 ?auto_78130 ) ) ( not ( = ?auto_78139 ?auto_78137 ) ) ( not ( = ?auto_78139 ?auto_78134 ) ) ( not ( = ?auto_78139 ?auto_78136 ) ) ( not ( = ?auto_78129 ?auto_78131 ) ) ( not ( = ?auto_78132 ?auto_78131 ) ) ( not ( = ?auto_78133 ?auto_78131 ) ) ( not ( = ?auto_78130 ?auto_78131 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_78129 ?auto_78132 ?auto_78133 ?auto_78131 ?auto_78130 ?auto_78128 )
      ( DELIVER-5PKG-VERIFY ?auto_78129 ?auto_78130 ?auto_78131 ?auto_78132 ?auto_78133 ?auto_78128 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_78180 - OBJ
      ?auto_78181 - OBJ
      ?auto_78182 - OBJ
      ?auto_78183 - OBJ
      ?auto_78184 - OBJ
      ?auto_78179 - LOCATION
    )
    :vars
    (
      ?auto_78185 - LOCATION
      ?auto_78189 - CITY
      ?auto_78190 - LOCATION
      ?auto_78188 - LOCATION
      ?auto_78187 - LOCATION
      ?auto_78186 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_78185 ?auto_78189 ) ( IN-CITY ?auto_78179 ?auto_78189 ) ( not ( = ?auto_78179 ?auto_78185 ) ) ( OBJ-AT ?auto_78182 ?auto_78185 ) ( IN-CITY ?auto_78190 ?auto_78189 ) ( not ( = ?auto_78179 ?auto_78190 ) ) ( OBJ-AT ?auto_78181 ?auto_78190 ) ( IN-CITY ?auto_78188 ?auto_78189 ) ( not ( = ?auto_78179 ?auto_78188 ) ) ( OBJ-AT ?auto_78183 ?auto_78188 ) ( OBJ-AT ?auto_78184 ?auto_78185 ) ( IN-CITY ?auto_78187 ?auto_78189 ) ( not ( = ?auto_78179 ?auto_78187 ) ) ( OBJ-AT ?auto_78180 ?auto_78187 ) ( TRUCK-AT ?auto_78186 ?auto_78179 ) ( not ( = ?auto_78180 ?auto_78184 ) ) ( not ( = ?auto_78185 ?auto_78187 ) ) ( not ( = ?auto_78180 ?auto_78183 ) ) ( not ( = ?auto_78184 ?auto_78183 ) ) ( not ( = ?auto_78188 ?auto_78185 ) ) ( not ( = ?auto_78188 ?auto_78187 ) ) ( not ( = ?auto_78180 ?auto_78181 ) ) ( not ( = ?auto_78184 ?auto_78181 ) ) ( not ( = ?auto_78183 ?auto_78181 ) ) ( not ( = ?auto_78190 ?auto_78188 ) ) ( not ( = ?auto_78190 ?auto_78185 ) ) ( not ( = ?auto_78190 ?auto_78187 ) ) ( not ( = ?auto_78180 ?auto_78182 ) ) ( not ( = ?auto_78184 ?auto_78182 ) ) ( not ( = ?auto_78183 ?auto_78182 ) ) ( not ( = ?auto_78181 ?auto_78182 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_78180 ?auto_78184 ?auto_78183 ?auto_78182 ?auto_78181 ?auto_78179 )
      ( DELIVER-5PKG-VERIFY ?auto_78180 ?auto_78181 ?auto_78182 ?auto_78183 ?auto_78184 ?auto_78179 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_78890 - OBJ
      ?auto_78891 - OBJ
      ?auto_78892 - OBJ
      ?auto_78893 - OBJ
      ?auto_78894 - OBJ
      ?auto_78889 - LOCATION
    )
    :vars
    (
      ?auto_78895 - LOCATION
      ?auto_78899 - CITY
      ?auto_78900 - LOCATION
      ?auto_78898 - LOCATION
      ?auto_78897 - LOCATION
      ?auto_78896 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_78895 ?auto_78899 ) ( IN-CITY ?auto_78889 ?auto_78899 ) ( not ( = ?auto_78889 ?auto_78895 ) ) ( OBJ-AT ?auto_78891 ?auto_78895 ) ( IN-CITY ?auto_78900 ?auto_78899 ) ( not ( = ?auto_78889 ?auto_78900 ) ) ( OBJ-AT ?auto_78894 ?auto_78900 ) ( IN-CITY ?auto_78898 ?auto_78899 ) ( not ( = ?auto_78889 ?auto_78898 ) ) ( OBJ-AT ?auto_78893 ?auto_78898 ) ( OBJ-AT ?auto_78892 ?auto_78895 ) ( IN-CITY ?auto_78897 ?auto_78899 ) ( not ( = ?auto_78889 ?auto_78897 ) ) ( OBJ-AT ?auto_78890 ?auto_78897 ) ( TRUCK-AT ?auto_78896 ?auto_78889 ) ( not ( = ?auto_78890 ?auto_78892 ) ) ( not ( = ?auto_78895 ?auto_78897 ) ) ( not ( = ?auto_78890 ?auto_78893 ) ) ( not ( = ?auto_78892 ?auto_78893 ) ) ( not ( = ?auto_78898 ?auto_78895 ) ) ( not ( = ?auto_78898 ?auto_78897 ) ) ( not ( = ?auto_78890 ?auto_78894 ) ) ( not ( = ?auto_78892 ?auto_78894 ) ) ( not ( = ?auto_78893 ?auto_78894 ) ) ( not ( = ?auto_78900 ?auto_78898 ) ) ( not ( = ?auto_78900 ?auto_78895 ) ) ( not ( = ?auto_78900 ?auto_78897 ) ) ( not ( = ?auto_78890 ?auto_78891 ) ) ( not ( = ?auto_78892 ?auto_78891 ) ) ( not ( = ?auto_78893 ?auto_78891 ) ) ( not ( = ?auto_78894 ?auto_78891 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_78890 ?auto_78892 ?auto_78893 ?auto_78891 ?auto_78894 ?auto_78889 )
      ( DELIVER-5PKG-VERIFY ?auto_78890 ?auto_78891 ?auto_78892 ?auto_78893 ?auto_78894 ?auto_78889 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_78941 - OBJ
      ?auto_78942 - OBJ
      ?auto_78943 - OBJ
      ?auto_78944 - OBJ
      ?auto_78945 - OBJ
      ?auto_78940 - LOCATION
    )
    :vars
    (
      ?auto_78946 - LOCATION
      ?auto_78950 - CITY
      ?auto_78951 - LOCATION
      ?auto_78949 - LOCATION
      ?auto_78948 - LOCATION
      ?auto_78947 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_78946 ?auto_78950 ) ( IN-CITY ?auto_78940 ?auto_78950 ) ( not ( = ?auto_78940 ?auto_78946 ) ) ( OBJ-AT ?auto_78942 ?auto_78946 ) ( IN-CITY ?auto_78951 ?auto_78950 ) ( not ( = ?auto_78940 ?auto_78951 ) ) ( OBJ-AT ?auto_78944 ?auto_78951 ) ( IN-CITY ?auto_78949 ?auto_78950 ) ( not ( = ?auto_78940 ?auto_78949 ) ) ( OBJ-AT ?auto_78945 ?auto_78949 ) ( OBJ-AT ?auto_78943 ?auto_78946 ) ( IN-CITY ?auto_78948 ?auto_78950 ) ( not ( = ?auto_78940 ?auto_78948 ) ) ( OBJ-AT ?auto_78941 ?auto_78948 ) ( TRUCK-AT ?auto_78947 ?auto_78940 ) ( not ( = ?auto_78941 ?auto_78943 ) ) ( not ( = ?auto_78946 ?auto_78948 ) ) ( not ( = ?auto_78941 ?auto_78945 ) ) ( not ( = ?auto_78943 ?auto_78945 ) ) ( not ( = ?auto_78949 ?auto_78946 ) ) ( not ( = ?auto_78949 ?auto_78948 ) ) ( not ( = ?auto_78941 ?auto_78944 ) ) ( not ( = ?auto_78943 ?auto_78944 ) ) ( not ( = ?auto_78945 ?auto_78944 ) ) ( not ( = ?auto_78951 ?auto_78949 ) ) ( not ( = ?auto_78951 ?auto_78946 ) ) ( not ( = ?auto_78951 ?auto_78948 ) ) ( not ( = ?auto_78941 ?auto_78942 ) ) ( not ( = ?auto_78943 ?auto_78942 ) ) ( not ( = ?auto_78945 ?auto_78942 ) ) ( not ( = ?auto_78944 ?auto_78942 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_78941 ?auto_78943 ?auto_78945 ?auto_78942 ?auto_78944 ?auto_78940 )
      ( DELIVER-5PKG-VERIFY ?auto_78941 ?auto_78942 ?auto_78943 ?auto_78944 ?auto_78945 ?auto_78940 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_79154 - OBJ
      ?auto_79155 - OBJ
      ?auto_79156 - OBJ
      ?auto_79157 - OBJ
      ?auto_79158 - OBJ
      ?auto_79153 - LOCATION
    )
    :vars
    (
      ?auto_79159 - LOCATION
      ?auto_79163 - CITY
      ?auto_79164 - LOCATION
      ?auto_79162 - LOCATION
      ?auto_79161 - LOCATION
      ?auto_79160 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_79159 ?auto_79163 ) ( IN-CITY ?auto_79153 ?auto_79163 ) ( not ( = ?auto_79153 ?auto_79159 ) ) ( OBJ-AT ?auto_79155 ?auto_79159 ) ( IN-CITY ?auto_79164 ?auto_79163 ) ( not ( = ?auto_79153 ?auto_79164 ) ) ( OBJ-AT ?auto_79158 ?auto_79164 ) ( IN-CITY ?auto_79162 ?auto_79163 ) ( not ( = ?auto_79153 ?auto_79162 ) ) ( OBJ-AT ?auto_79156 ?auto_79162 ) ( OBJ-AT ?auto_79157 ?auto_79159 ) ( IN-CITY ?auto_79161 ?auto_79163 ) ( not ( = ?auto_79153 ?auto_79161 ) ) ( OBJ-AT ?auto_79154 ?auto_79161 ) ( TRUCK-AT ?auto_79160 ?auto_79153 ) ( not ( = ?auto_79154 ?auto_79157 ) ) ( not ( = ?auto_79159 ?auto_79161 ) ) ( not ( = ?auto_79154 ?auto_79156 ) ) ( not ( = ?auto_79157 ?auto_79156 ) ) ( not ( = ?auto_79162 ?auto_79159 ) ) ( not ( = ?auto_79162 ?auto_79161 ) ) ( not ( = ?auto_79154 ?auto_79158 ) ) ( not ( = ?auto_79157 ?auto_79158 ) ) ( not ( = ?auto_79156 ?auto_79158 ) ) ( not ( = ?auto_79164 ?auto_79162 ) ) ( not ( = ?auto_79164 ?auto_79159 ) ) ( not ( = ?auto_79164 ?auto_79161 ) ) ( not ( = ?auto_79154 ?auto_79155 ) ) ( not ( = ?auto_79157 ?auto_79155 ) ) ( not ( = ?auto_79156 ?auto_79155 ) ) ( not ( = ?auto_79158 ?auto_79155 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_79154 ?auto_79157 ?auto_79156 ?auto_79155 ?auto_79158 ?auto_79153 )
      ( DELIVER-5PKG-VERIFY ?auto_79154 ?auto_79155 ?auto_79156 ?auto_79157 ?auto_79158 ?auto_79153 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_79260 - OBJ
      ?auto_79261 - OBJ
      ?auto_79262 - OBJ
      ?auto_79263 - OBJ
      ?auto_79264 - OBJ
      ?auto_79259 - LOCATION
    )
    :vars
    (
      ?auto_79265 - LOCATION
      ?auto_79269 - CITY
      ?auto_79270 - LOCATION
      ?auto_79268 - LOCATION
      ?auto_79267 - LOCATION
      ?auto_79266 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_79265 ?auto_79269 ) ( IN-CITY ?auto_79259 ?auto_79269 ) ( not ( = ?auto_79259 ?auto_79265 ) ) ( OBJ-AT ?auto_79261 ?auto_79265 ) ( IN-CITY ?auto_79270 ?auto_79269 ) ( not ( = ?auto_79259 ?auto_79270 ) ) ( OBJ-AT ?auto_79263 ?auto_79270 ) ( IN-CITY ?auto_79268 ?auto_79269 ) ( not ( = ?auto_79259 ?auto_79268 ) ) ( OBJ-AT ?auto_79262 ?auto_79268 ) ( OBJ-AT ?auto_79264 ?auto_79265 ) ( IN-CITY ?auto_79267 ?auto_79269 ) ( not ( = ?auto_79259 ?auto_79267 ) ) ( OBJ-AT ?auto_79260 ?auto_79267 ) ( TRUCK-AT ?auto_79266 ?auto_79259 ) ( not ( = ?auto_79260 ?auto_79264 ) ) ( not ( = ?auto_79265 ?auto_79267 ) ) ( not ( = ?auto_79260 ?auto_79262 ) ) ( not ( = ?auto_79264 ?auto_79262 ) ) ( not ( = ?auto_79268 ?auto_79265 ) ) ( not ( = ?auto_79268 ?auto_79267 ) ) ( not ( = ?auto_79260 ?auto_79263 ) ) ( not ( = ?auto_79264 ?auto_79263 ) ) ( not ( = ?auto_79262 ?auto_79263 ) ) ( not ( = ?auto_79270 ?auto_79268 ) ) ( not ( = ?auto_79270 ?auto_79265 ) ) ( not ( = ?auto_79270 ?auto_79267 ) ) ( not ( = ?auto_79260 ?auto_79261 ) ) ( not ( = ?auto_79264 ?auto_79261 ) ) ( not ( = ?auto_79262 ?auto_79261 ) ) ( not ( = ?auto_79263 ?auto_79261 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_79260 ?auto_79264 ?auto_79262 ?auto_79261 ?auto_79263 ?auto_79259 )
      ( DELIVER-5PKG-VERIFY ?auto_79260 ?auto_79261 ?auto_79262 ?auto_79263 ?auto_79264 ?auto_79259 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_79473 - OBJ
      ?auto_79474 - OBJ
      ?auto_79475 - OBJ
      ?auto_79476 - OBJ
      ?auto_79477 - OBJ
      ?auto_79472 - LOCATION
    )
    :vars
    (
      ?auto_79478 - LOCATION
      ?auto_79482 - CITY
      ?auto_79483 - LOCATION
      ?auto_79481 - LOCATION
      ?auto_79480 - LOCATION
      ?auto_79479 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_79478 ?auto_79482 ) ( IN-CITY ?auto_79472 ?auto_79482 ) ( not ( = ?auto_79472 ?auto_79478 ) ) ( OBJ-AT ?auto_79474 ?auto_79478 ) ( IN-CITY ?auto_79483 ?auto_79482 ) ( not ( = ?auto_79472 ?auto_79483 ) ) ( OBJ-AT ?auto_79475 ?auto_79483 ) ( IN-CITY ?auto_79481 ?auto_79482 ) ( not ( = ?auto_79472 ?auto_79481 ) ) ( OBJ-AT ?auto_79477 ?auto_79481 ) ( OBJ-AT ?auto_79476 ?auto_79478 ) ( IN-CITY ?auto_79480 ?auto_79482 ) ( not ( = ?auto_79472 ?auto_79480 ) ) ( OBJ-AT ?auto_79473 ?auto_79480 ) ( TRUCK-AT ?auto_79479 ?auto_79472 ) ( not ( = ?auto_79473 ?auto_79476 ) ) ( not ( = ?auto_79478 ?auto_79480 ) ) ( not ( = ?auto_79473 ?auto_79477 ) ) ( not ( = ?auto_79476 ?auto_79477 ) ) ( not ( = ?auto_79481 ?auto_79478 ) ) ( not ( = ?auto_79481 ?auto_79480 ) ) ( not ( = ?auto_79473 ?auto_79475 ) ) ( not ( = ?auto_79476 ?auto_79475 ) ) ( not ( = ?auto_79477 ?auto_79475 ) ) ( not ( = ?auto_79483 ?auto_79481 ) ) ( not ( = ?auto_79483 ?auto_79478 ) ) ( not ( = ?auto_79483 ?auto_79480 ) ) ( not ( = ?auto_79473 ?auto_79474 ) ) ( not ( = ?auto_79476 ?auto_79474 ) ) ( not ( = ?auto_79477 ?auto_79474 ) ) ( not ( = ?auto_79475 ?auto_79474 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_79473 ?auto_79476 ?auto_79477 ?auto_79474 ?auto_79475 ?auto_79472 )
      ( DELIVER-5PKG-VERIFY ?auto_79473 ?auto_79474 ?auto_79475 ?auto_79476 ?auto_79477 ?auto_79472 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_79524 - OBJ
      ?auto_79525 - OBJ
      ?auto_79526 - OBJ
      ?auto_79527 - OBJ
      ?auto_79528 - OBJ
      ?auto_79523 - LOCATION
    )
    :vars
    (
      ?auto_79529 - LOCATION
      ?auto_79533 - CITY
      ?auto_79534 - LOCATION
      ?auto_79532 - LOCATION
      ?auto_79531 - LOCATION
      ?auto_79530 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_79529 ?auto_79533 ) ( IN-CITY ?auto_79523 ?auto_79533 ) ( not ( = ?auto_79523 ?auto_79529 ) ) ( OBJ-AT ?auto_79525 ?auto_79529 ) ( IN-CITY ?auto_79534 ?auto_79533 ) ( not ( = ?auto_79523 ?auto_79534 ) ) ( OBJ-AT ?auto_79526 ?auto_79534 ) ( IN-CITY ?auto_79532 ?auto_79533 ) ( not ( = ?auto_79523 ?auto_79532 ) ) ( OBJ-AT ?auto_79527 ?auto_79532 ) ( OBJ-AT ?auto_79528 ?auto_79529 ) ( IN-CITY ?auto_79531 ?auto_79533 ) ( not ( = ?auto_79523 ?auto_79531 ) ) ( OBJ-AT ?auto_79524 ?auto_79531 ) ( TRUCK-AT ?auto_79530 ?auto_79523 ) ( not ( = ?auto_79524 ?auto_79528 ) ) ( not ( = ?auto_79529 ?auto_79531 ) ) ( not ( = ?auto_79524 ?auto_79527 ) ) ( not ( = ?auto_79528 ?auto_79527 ) ) ( not ( = ?auto_79532 ?auto_79529 ) ) ( not ( = ?auto_79532 ?auto_79531 ) ) ( not ( = ?auto_79524 ?auto_79526 ) ) ( not ( = ?auto_79528 ?auto_79526 ) ) ( not ( = ?auto_79527 ?auto_79526 ) ) ( not ( = ?auto_79534 ?auto_79532 ) ) ( not ( = ?auto_79534 ?auto_79529 ) ) ( not ( = ?auto_79534 ?auto_79531 ) ) ( not ( = ?auto_79524 ?auto_79525 ) ) ( not ( = ?auto_79528 ?auto_79525 ) ) ( not ( = ?auto_79527 ?auto_79525 ) ) ( not ( = ?auto_79526 ?auto_79525 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_79524 ?auto_79528 ?auto_79527 ?auto_79525 ?auto_79526 ?auto_79523 )
      ( DELIVER-5PKG-VERIFY ?auto_79524 ?auto_79525 ?auto_79526 ?auto_79527 ?auto_79528 ?auto_79523 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_80342 - OBJ
      ?auto_80343 - OBJ
      ?auto_80344 - OBJ
      ?auto_80345 - OBJ
      ?auto_80346 - OBJ
      ?auto_80341 - LOCATION
    )
    :vars
    (
      ?auto_80347 - LOCATION
      ?auto_80351 - CITY
      ?auto_80352 - LOCATION
      ?auto_80350 - LOCATION
      ?auto_80349 - LOCATION
      ?auto_80348 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_80347 ?auto_80351 ) ( IN-CITY ?auto_80341 ?auto_80351 ) ( not ( = ?auto_80341 ?auto_80347 ) ) ( OBJ-AT ?auto_80346 ?auto_80347 ) ( IN-CITY ?auto_80352 ?auto_80351 ) ( not ( = ?auto_80341 ?auto_80352 ) ) ( OBJ-AT ?auto_80345 ?auto_80352 ) ( IN-CITY ?auto_80350 ?auto_80351 ) ( not ( = ?auto_80341 ?auto_80350 ) ) ( OBJ-AT ?auto_80344 ?auto_80350 ) ( OBJ-AT ?auto_80342 ?auto_80347 ) ( IN-CITY ?auto_80349 ?auto_80351 ) ( not ( = ?auto_80341 ?auto_80349 ) ) ( OBJ-AT ?auto_80343 ?auto_80349 ) ( TRUCK-AT ?auto_80348 ?auto_80341 ) ( not ( = ?auto_80343 ?auto_80342 ) ) ( not ( = ?auto_80347 ?auto_80349 ) ) ( not ( = ?auto_80343 ?auto_80344 ) ) ( not ( = ?auto_80342 ?auto_80344 ) ) ( not ( = ?auto_80350 ?auto_80347 ) ) ( not ( = ?auto_80350 ?auto_80349 ) ) ( not ( = ?auto_80343 ?auto_80345 ) ) ( not ( = ?auto_80342 ?auto_80345 ) ) ( not ( = ?auto_80344 ?auto_80345 ) ) ( not ( = ?auto_80352 ?auto_80350 ) ) ( not ( = ?auto_80352 ?auto_80347 ) ) ( not ( = ?auto_80352 ?auto_80349 ) ) ( not ( = ?auto_80343 ?auto_80346 ) ) ( not ( = ?auto_80342 ?auto_80346 ) ) ( not ( = ?auto_80344 ?auto_80346 ) ) ( not ( = ?auto_80345 ?auto_80346 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_80343 ?auto_80342 ?auto_80344 ?auto_80346 ?auto_80345 ?auto_80341 )
      ( DELIVER-5PKG-VERIFY ?auto_80342 ?auto_80343 ?auto_80344 ?auto_80345 ?auto_80346 ?auto_80341 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_80393 - OBJ
      ?auto_80394 - OBJ
      ?auto_80395 - OBJ
      ?auto_80396 - OBJ
      ?auto_80397 - OBJ
      ?auto_80392 - LOCATION
    )
    :vars
    (
      ?auto_80398 - LOCATION
      ?auto_80402 - CITY
      ?auto_80403 - LOCATION
      ?auto_80401 - LOCATION
      ?auto_80400 - LOCATION
      ?auto_80399 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_80398 ?auto_80402 ) ( IN-CITY ?auto_80392 ?auto_80402 ) ( not ( = ?auto_80392 ?auto_80398 ) ) ( OBJ-AT ?auto_80396 ?auto_80398 ) ( IN-CITY ?auto_80403 ?auto_80402 ) ( not ( = ?auto_80392 ?auto_80403 ) ) ( OBJ-AT ?auto_80397 ?auto_80403 ) ( IN-CITY ?auto_80401 ?auto_80402 ) ( not ( = ?auto_80392 ?auto_80401 ) ) ( OBJ-AT ?auto_80395 ?auto_80401 ) ( OBJ-AT ?auto_80393 ?auto_80398 ) ( IN-CITY ?auto_80400 ?auto_80402 ) ( not ( = ?auto_80392 ?auto_80400 ) ) ( OBJ-AT ?auto_80394 ?auto_80400 ) ( TRUCK-AT ?auto_80399 ?auto_80392 ) ( not ( = ?auto_80394 ?auto_80393 ) ) ( not ( = ?auto_80398 ?auto_80400 ) ) ( not ( = ?auto_80394 ?auto_80395 ) ) ( not ( = ?auto_80393 ?auto_80395 ) ) ( not ( = ?auto_80401 ?auto_80398 ) ) ( not ( = ?auto_80401 ?auto_80400 ) ) ( not ( = ?auto_80394 ?auto_80397 ) ) ( not ( = ?auto_80393 ?auto_80397 ) ) ( not ( = ?auto_80395 ?auto_80397 ) ) ( not ( = ?auto_80403 ?auto_80401 ) ) ( not ( = ?auto_80403 ?auto_80398 ) ) ( not ( = ?auto_80403 ?auto_80400 ) ) ( not ( = ?auto_80394 ?auto_80396 ) ) ( not ( = ?auto_80393 ?auto_80396 ) ) ( not ( = ?auto_80395 ?auto_80396 ) ) ( not ( = ?auto_80397 ?auto_80396 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_80394 ?auto_80393 ?auto_80395 ?auto_80396 ?auto_80397 ?auto_80392 )
      ( DELIVER-5PKG-VERIFY ?auto_80393 ?auto_80394 ?auto_80395 ?auto_80396 ?auto_80397 ?auto_80392 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_80444 - OBJ
      ?auto_80445 - OBJ
      ?auto_80446 - OBJ
      ?auto_80447 - OBJ
      ?auto_80448 - OBJ
      ?auto_80443 - LOCATION
    )
    :vars
    (
      ?auto_80449 - LOCATION
      ?auto_80453 - CITY
      ?auto_80454 - LOCATION
      ?auto_80452 - LOCATION
      ?auto_80451 - LOCATION
      ?auto_80450 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_80449 ?auto_80453 ) ( IN-CITY ?auto_80443 ?auto_80453 ) ( not ( = ?auto_80443 ?auto_80449 ) ) ( OBJ-AT ?auto_80448 ?auto_80449 ) ( IN-CITY ?auto_80454 ?auto_80453 ) ( not ( = ?auto_80443 ?auto_80454 ) ) ( OBJ-AT ?auto_80446 ?auto_80454 ) ( IN-CITY ?auto_80452 ?auto_80453 ) ( not ( = ?auto_80443 ?auto_80452 ) ) ( OBJ-AT ?auto_80447 ?auto_80452 ) ( OBJ-AT ?auto_80444 ?auto_80449 ) ( IN-CITY ?auto_80451 ?auto_80453 ) ( not ( = ?auto_80443 ?auto_80451 ) ) ( OBJ-AT ?auto_80445 ?auto_80451 ) ( TRUCK-AT ?auto_80450 ?auto_80443 ) ( not ( = ?auto_80445 ?auto_80444 ) ) ( not ( = ?auto_80449 ?auto_80451 ) ) ( not ( = ?auto_80445 ?auto_80447 ) ) ( not ( = ?auto_80444 ?auto_80447 ) ) ( not ( = ?auto_80452 ?auto_80449 ) ) ( not ( = ?auto_80452 ?auto_80451 ) ) ( not ( = ?auto_80445 ?auto_80446 ) ) ( not ( = ?auto_80444 ?auto_80446 ) ) ( not ( = ?auto_80447 ?auto_80446 ) ) ( not ( = ?auto_80454 ?auto_80452 ) ) ( not ( = ?auto_80454 ?auto_80449 ) ) ( not ( = ?auto_80454 ?auto_80451 ) ) ( not ( = ?auto_80445 ?auto_80448 ) ) ( not ( = ?auto_80444 ?auto_80448 ) ) ( not ( = ?auto_80447 ?auto_80448 ) ) ( not ( = ?auto_80446 ?auto_80448 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_80445 ?auto_80444 ?auto_80447 ?auto_80448 ?auto_80446 ?auto_80443 )
      ( DELIVER-5PKG-VERIFY ?auto_80444 ?auto_80445 ?auto_80446 ?auto_80447 ?auto_80448 ?auto_80443 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_80495 - OBJ
      ?auto_80496 - OBJ
      ?auto_80497 - OBJ
      ?auto_80498 - OBJ
      ?auto_80499 - OBJ
      ?auto_80494 - LOCATION
    )
    :vars
    (
      ?auto_80500 - LOCATION
      ?auto_80504 - CITY
      ?auto_80505 - LOCATION
      ?auto_80503 - LOCATION
      ?auto_80502 - LOCATION
      ?auto_80501 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_80500 ?auto_80504 ) ( IN-CITY ?auto_80494 ?auto_80504 ) ( not ( = ?auto_80494 ?auto_80500 ) ) ( OBJ-AT ?auto_80498 ?auto_80500 ) ( IN-CITY ?auto_80505 ?auto_80504 ) ( not ( = ?auto_80494 ?auto_80505 ) ) ( OBJ-AT ?auto_80497 ?auto_80505 ) ( IN-CITY ?auto_80503 ?auto_80504 ) ( not ( = ?auto_80494 ?auto_80503 ) ) ( OBJ-AT ?auto_80499 ?auto_80503 ) ( OBJ-AT ?auto_80495 ?auto_80500 ) ( IN-CITY ?auto_80502 ?auto_80504 ) ( not ( = ?auto_80494 ?auto_80502 ) ) ( OBJ-AT ?auto_80496 ?auto_80502 ) ( TRUCK-AT ?auto_80501 ?auto_80494 ) ( not ( = ?auto_80496 ?auto_80495 ) ) ( not ( = ?auto_80500 ?auto_80502 ) ) ( not ( = ?auto_80496 ?auto_80499 ) ) ( not ( = ?auto_80495 ?auto_80499 ) ) ( not ( = ?auto_80503 ?auto_80500 ) ) ( not ( = ?auto_80503 ?auto_80502 ) ) ( not ( = ?auto_80496 ?auto_80497 ) ) ( not ( = ?auto_80495 ?auto_80497 ) ) ( not ( = ?auto_80499 ?auto_80497 ) ) ( not ( = ?auto_80505 ?auto_80503 ) ) ( not ( = ?auto_80505 ?auto_80500 ) ) ( not ( = ?auto_80505 ?auto_80502 ) ) ( not ( = ?auto_80496 ?auto_80498 ) ) ( not ( = ?auto_80495 ?auto_80498 ) ) ( not ( = ?auto_80499 ?auto_80498 ) ) ( not ( = ?auto_80497 ?auto_80498 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_80496 ?auto_80495 ?auto_80499 ?auto_80498 ?auto_80497 ?auto_80494 )
      ( DELIVER-5PKG-VERIFY ?auto_80495 ?auto_80496 ?auto_80497 ?auto_80498 ?auto_80499 ?auto_80494 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_80708 - OBJ
      ?auto_80709 - OBJ
      ?auto_80710 - OBJ
      ?auto_80711 - OBJ
      ?auto_80712 - OBJ
      ?auto_80707 - LOCATION
    )
    :vars
    (
      ?auto_80713 - LOCATION
      ?auto_80717 - CITY
      ?auto_80718 - LOCATION
      ?auto_80716 - LOCATION
      ?auto_80715 - LOCATION
      ?auto_80714 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_80713 ?auto_80717 ) ( IN-CITY ?auto_80707 ?auto_80717 ) ( not ( = ?auto_80707 ?auto_80713 ) ) ( OBJ-AT ?auto_80710 ?auto_80713 ) ( IN-CITY ?auto_80718 ?auto_80717 ) ( not ( = ?auto_80707 ?auto_80718 ) ) ( OBJ-AT ?auto_80712 ?auto_80718 ) ( IN-CITY ?auto_80716 ?auto_80717 ) ( not ( = ?auto_80707 ?auto_80716 ) ) ( OBJ-AT ?auto_80711 ?auto_80716 ) ( OBJ-AT ?auto_80708 ?auto_80713 ) ( IN-CITY ?auto_80715 ?auto_80717 ) ( not ( = ?auto_80707 ?auto_80715 ) ) ( OBJ-AT ?auto_80709 ?auto_80715 ) ( TRUCK-AT ?auto_80714 ?auto_80707 ) ( not ( = ?auto_80709 ?auto_80708 ) ) ( not ( = ?auto_80713 ?auto_80715 ) ) ( not ( = ?auto_80709 ?auto_80711 ) ) ( not ( = ?auto_80708 ?auto_80711 ) ) ( not ( = ?auto_80716 ?auto_80713 ) ) ( not ( = ?auto_80716 ?auto_80715 ) ) ( not ( = ?auto_80709 ?auto_80712 ) ) ( not ( = ?auto_80708 ?auto_80712 ) ) ( not ( = ?auto_80711 ?auto_80712 ) ) ( not ( = ?auto_80718 ?auto_80716 ) ) ( not ( = ?auto_80718 ?auto_80713 ) ) ( not ( = ?auto_80718 ?auto_80715 ) ) ( not ( = ?auto_80709 ?auto_80710 ) ) ( not ( = ?auto_80708 ?auto_80710 ) ) ( not ( = ?auto_80711 ?auto_80710 ) ) ( not ( = ?auto_80712 ?auto_80710 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_80709 ?auto_80708 ?auto_80711 ?auto_80710 ?auto_80712 ?auto_80707 )
      ( DELIVER-5PKG-VERIFY ?auto_80708 ?auto_80709 ?auto_80710 ?auto_80711 ?auto_80712 ?auto_80707 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_80759 - OBJ
      ?auto_80760 - OBJ
      ?auto_80761 - OBJ
      ?auto_80762 - OBJ
      ?auto_80763 - OBJ
      ?auto_80758 - LOCATION
    )
    :vars
    (
      ?auto_80764 - LOCATION
      ?auto_80768 - CITY
      ?auto_80769 - LOCATION
      ?auto_80767 - LOCATION
      ?auto_80766 - LOCATION
      ?auto_80765 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_80764 ?auto_80768 ) ( IN-CITY ?auto_80758 ?auto_80768 ) ( not ( = ?auto_80758 ?auto_80764 ) ) ( OBJ-AT ?auto_80761 ?auto_80764 ) ( IN-CITY ?auto_80769 ?auto_80768 ) ( not ( = ?auto_80758 ?auto_80769 ) ) ( OBJ-AT ?auto_80762 ?auto_80769 ) ( IN-CITY ?auto_80767 ?auto_80768 ) ( not ( = ?auto_80758 ?auto_80767 ) ) ( OBJ-AT ?auto_80763 ?auto_80767 ) ( OBJ-AT ?auto_80759 ?auto_80764 ) ( IN-CITY ?auto_80766 ?auto_80768 ) ( not ( = ?auto_80758 ?auto_80766 ) ) ( OBJ-AT ?auto_80760 ?auto_80766 ) ( TRUCK-AT ?auto_80765 ?auto_80758 ) ( not ( = ?auto_80760 ?auto_80759 ) ) ( not ( = ?auto_80764 ?auto_80766 ) ) ( not ( = ?auto_80760 ?auto_80763 ) ) ( not ( = ?auto_80759 ?auto_80763 ) ) ( not ( = ?auto_80767 ?auto_80764 ) ) ( not ( = ?auto_80767 ?auto_80766 ) ) ( not ( = ?auto_80760 ?auto_80762 ) ) ( not ( = ?auto_80759 ?auto_80762 ) ) ( not ( = ?auto_80763 ?auto_80762 ) ) ( not ( = ?auto_80769 ?auto_80767 ) ) ( not ( = ?auto_80769 ?auto_80764 ) ) ( not ( = ?auto_80769 ?auto_80766 ) ) ( not ( = ?auto_80760 ?auto_80761 ) ) ( not ( = ?auto_80759 ?auto_80761 ) ) ( not ( = ?auto_80763 ?auto_80761 ) ) ( not ( = ?auto_80762 ?auto_80761 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_80760 ?auto_80759 ?auto_80763 ?auto_80761 ?auto_80762 ?auto_80758 )
      ( DELIVER-5PKG-VERIFY ?auto_80759 ?auto_80760 ?auto_80761 ?auto_80762 ?auto_80763 ?auto_80758 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_81747 - OBJ
      ?auto_81748 - OBJ
      ?auto_81749 - OBJ
      ?auto_81750 - OBJ
      ?auto_81751 - OBJ
      ?auto_81746 - LOCATION
    )
    :vars
    (
      ?auto_81752 - LOCATION
      ?auto_81756 - CITY
      ?auto_81757 - LOCATION
      ?auto_81755 - LOCATION
      ?auto_81754 - LOCATION
      ?auto_81753 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_81752 ?auto_81756 ) ( IN-CITY ?auto_81746 ?auto_81756 ) ( not ( = ?auto_81746 ?auto_81752 ) ) ( OBJ-AT ?auto_81751 ?auto_81752 ) ( IN-CITY ?auto_81757 ?auto_81756 ) ( not ( = ?auto_81746 ?auto_81757 ) ) ( OBJ-AT ?auto_81750 ?auto_81757 ) ( IN-CITY ?auto_81755 ?auto_81756 ) ( not ( = ?auto_81746 ?auto_81755 ) ) ( OBJ-AT ?auto_81748 ?auto_81755 ) ( OBJ-AT ?auto_81747 ?auto_81752 ) ( IN-CITY ?auto_81754 ?auto_81756 ) ( not ( = ?auto_81746 ?auto_81754 ) ) ( OBJ-AT ?auto_81749 ?auto_81754 ) ( TRUCK-AT ?auto_81753 ?auto_81746 ) ( not ( = ?auto_81749 ?auto_81747 ) ) ( not ( = ?auto_81752 ?auto_81754 ) ) ( not ( = ?auto_81749 ?auto_81748 ) ) ( not ( = ?auto_81747 ?auto_81748 ) ) ( not ( = ?auto_81755 ?auto_81752 ) ) ( not ( = ?auto_81755 ?auto_81754 ) ) ( not ( = ?auto_81749 ?auto_81750 ) ) ( not ( = ?auto_81747 ?auto_81750 ) ) ( not ( = ?auto_81748 ?auto_81750 ) ) ( not ( = ?auto_81757 ?auto_81755 ) ) ( not ( = ?auto_81757 ?auto_81752 ) ) ( not ( = ?auto_81757 ?auto_81754 ) ) ( not ( = ?auto_81749 ?auto_81751 ) ) ( not ( = ?auto_81747 ?auto_81751 ) ) ( not ( = ?auto_81748 ?auto_81751 ) ) ( not ( = ?auto_81750 ?auto_81751 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_81749 ?auto_81747 ?auto_81748 ?auto_81751 ?auto_81750 ?auto_81746 )
      ( DELIVER-5PKG-VERIFY ?auto_81747 ?auto_81748 ?auto_81749 ?auto_81750 ?auto_81751 ?auto_81746 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_81798 - OBJ
      ?auto_81799 - OBJ
      ?auto_81800 - OBJ
      ?auto_81801 - OBJ
      ?auto_81802 - OBJ
      ?auto_81797 - LOCATION
    )
    :vars
    (
      ?auto_81803 - LOCATION
      ?auto_81807 - CITY
      ?auto_81808 - LOCATION
      ?auto_81806 - LOCATION
      ?auto_81805 - LOCATION
      ?auto_81804 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_81803 ?auto_81807 ) ( IN-CITY ?auto_81797 ?auto_81807 ) ( not ( = ?auto_81797 ?auto_81803 ) ) ( OBJ-AT ?auto_81801 ?auto_81803 ) ( IN-CITY ?auto_81808 ?auto_81807 ) ( not ( = ?auto_81797 ?auto_81808 ) ) ( OBJ-AT ?auto_81802 ?auto_81808 ) ( IN-CITY ?auto_81806 ?auto_81807 ) ( not ( = ?auto_81797 ?auto_81806 ) ) ( OBJ-AT ?auto_81799 ?auto_81806 ) ( OBJ-AT ?auto_81798 ?auto_81803 ) ( IN-CITY ?auto_81805 ?auto_81807 ) ( not ( = ?auto_81797 ?auto_81805 ) ) ( OBJ-AT ?auto_81800 ?auto_81805 ) ( TRUCK-AT ?auto_81804 ?auto_81797 ) ( not ( = ?auto_81800 ?auto_81798 ) ) ( not ( = ?auto_81803 ?auto_81805 ) ) ( not ( = ?auto_81800 ?auto_81799 ) ) ( not ( = ?auto_81798 ?auto_81799 ) ) ( not ( = ?auto_81806 ?auto_81803 ) ) ( not ( = ?auto_81806 ?auto_81805 ) ) ( not ( = ?auto_81800 ?auto_81802 ) ) ( not ( = ?auto_81798 ?auto_81802 ) ) ( not ( = ?auto_81799 ?auto_81802 ) ) ( not ( = ?auto_81808 ?auto_81806 ) ) ( not ( = ?auto_81808 ?auto_81803 ) ) ( not ( = ?auto_81808 ?auto_81805 ) ) ( not ( = ?auto_81800 ?auto_81801 ) ) ( not ( = ?auto_81798 ?auto_81801 ) ) ( not ( = ?auto_81799 ?auto_81801 ) ) ( not ( = ?auto_81802 ?auto_81801 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_81800 ?auto_81798 ?auto_81799 ?auto_81801 ?auto_81802 ?auto_81797 )
      ( DELIVER-5PKG-VERIFY ?auto_81798 ?auto_81799 ?auto_81800 ?auto_81801 ?auto_81802 ?auto_81797 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_82067 - OBJ
      ?auto_82068 - OBJ
      ?auto_82069 - OBJ
      ?auto_82070 - OBJ
      ?auto_82071 - OBJ
      ?auto_82066 - LOCATION
    )
    :vars
    (
      ?auto_82072 - LOCATION
      ?auto_82076 - CITY
      ?auto_82077 - LOCATION
      ?auto_82075 - LOCATION
      ?auto_82074 - LOCATION
      ?auto_82073 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_82072 ?auto_82076 ) ( IN-CITY ?auto_82066 ?auto_82076 ) ( not ( = ?auto_82066 ?auto_82072 ) ) ( OBJ-AT ?auto_82071 ?auto_82072 ) ( IN-CITY ?auto_82077 ?auto_82076 ) ( not ( = ?auto_82066 ?auto_82077 ) ) ( OBJ-AT ?auto_82069 ?auto_82077 ) ( IN-CITY ?auto_82075 ?auto_82076 ) ( not ( = ?auto_82066 ?auto_82075 ) ) ( OBJ-AT ?auto_82068 ?auto_82075 ) ( OBJ-AT ?auto_82067 ?auto_82072 ) ( IN-CITY ?auto_82074 ?auto_82076 ) ( not ( = ?auto_82066 ?auto_82074 ) ) ( OBJ-AT ?auto_82070 ?auto_82074 ) ( TRUCK-AT ?auto_82073 ?auto_82066 ) ( not ( = ?auto_82070 ?auto_82067 ) ) ( not ( = ?auto_82072 ?auto_82074 ) ) ( not ( = ?auto_82070 ?auto_82068 ) ) ( not ( = ?auto_82067 ?auto_82068 ) ) ( not ( = ?auto_82075 ?auto_82072 ) ) ( not ( = ?auto_82075 ?auto_82074 ) ) ( not ( = ?auto_82070 ?auto_82069 ) ) ( not ( = ?auto_82067 ?auto_82069 ) ) ( not ( = ?auto_82068 ?auto_82069 ) ) ( not ( = ?auto_82077 ?auto_82075 ) ) ( not ( = ?auto_82077 ?auto_82072 ) ) ( not ( = ?auto_82077 ?auto_82074 ) ) ( not ( = ?auto_82070 ?auto_82071 ) ) ( not ( = ?auto_82067 ?auto_82071 ) ) ( not ( = ?auto_82068 ?auto_82071 ) ) ( not ( = ?auto_82069 ?auto_82071 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_82070 ?auto_82067 ?auto_82068 ?auto_82071 ?auto_82069 ?auto_82066 )
      ( DELIVER-5PKG-VERIFY ?auto_82067 ?auto_82068 ?auto_82069 ?auto_82070 ?auto_82071 ?auto_82066 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_82118 - OBJ
      ?auto_82119 - OBJ
      ?auto_82120 - OBJ
      ?auto_82121 - OBJ
      ?auto_82122 - OBJ
      ?auto_82117 - LOCATION
    )
    :vars
    (
      ?auto_82123 - LOCATION
      ?auto_82127 - CITY
      ?auto_82128 - LOCATION
      ?auto_82126 - LOCATION
      ?auto_82125 - LOCATION
      ?auto_82124 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_82123 ?auto_82127 ) ( IN-CITY ?auto_82117 ?auto_82127 ) ( not ( = ?auto_82117 ?auto_82123 ) ) ( OBJ-AT ?auto_82121 ?auto_82123 ) ( IN-CITY ?auto_82128 ?auto_82127 ) ( not ( = ?auto_82117 ?auto_82128 ) ) ( OBJ-AT ?auto_82120 ?auto_82128 ) ( IN-CITY ?auto_82126 ?auto_82127 ) ( not ( = ?auto_82117 ?auto_82126 ) ) ( OBJ-AT ?auto_82119 ?auto_82126 ) ( OBJ-AT ?auto_82118 ?auto_82123 ) ( IN-CITY ?auto_82125 ?auto_82127 ) ( not ( = ?auto_82117 ?auto_82125 ) ) ( OBJ-AT ?auto_82122 ?auto_82125 ) ( TRUCK-AT ?auto_82124 ?auto_82117 ) ( not ( = ?auto_82122 ?auto_82118 ) ) ( not ( = ?auto_82123 ?auto_82125 ) ) ( not ( = ?auto_82122 ?auto_82119 ) ) ( not ( = ?auto_82118 ?auto_82119 ) ) ( not ( = ?auto_82126 ?auto_82123 ) ) ( not ( = ?auto_82126 ?auto_82125 ) ) ( not ( = ?auto_82122 ?auto_82120 ) ) ( not ( = ?auto_82118 ?auto_82120 ) ) ( not ( = ?auto_82119 ?auto_82120 ) ) ( not ( = ?auto_82128 ?auto_82126 ) ) ( not ( = ?auto_82128 ?auto_82123 ) ) ( not ( = ?auto_82128 ?auto_82125 ) ) ( not ( = ?auto_82122 ?auto_82121 ) ) ( not ( = ?auto_82118 ?auto_82121 ) ) ( not ( = ?auto_82119 ?auto_82121 ) ) ( not ( = ?auto_82120 ?auto_82121 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_82122 ?auto_82118 ?auto_82119 ?auto_82121 ?auto_82120 ?auto_82117 )
      ( DELIVER-5PKG-VERIFY ?auto_82118 ?auto_82119 ?auto_82120 ?auto_82121 ?auto_82122 ?auto_82117 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_82221 - OBJ
      ?auto_82222 - OBJ
      ?auto_82223 - OBJ
      ?auto_82224 - OBJ
      ?auto_82225 - OBJ
      ?auto_82220 - LOCATION
    )
    :vars
    (
      ?auto_82226 - LOCATION
      ?auto_82230 - CITY
      ?auto_82231 - LOCATION
      ?auto_82229 - LOCATION
      ?auto_82228 - LOCATION
      ?auto_82227 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_82226 ?auto_82230 ) ( IN-CITY ?auto_82220 ?auto_82230 ) ( not ( = ?auto_82220 ?auto_82226 ) ) ( OBJ-AT ?auto_82223 ?auto_82226 ) ( IN-CITY ?auto_82231 ?auto_82230 ) ( not ( = ?auto_82220 ?auto_82231 ) ) ( OBJ-AT ?auto_82225 ?auto_82231 ) ( IN-CITY ?auto_82229 ?auto_82230 ) ( not ( = ?auto_82220 ?auto_82229 ) ) ( OBJ-AT ?auto_82222 ?auto_82229 ) ( OBJ-AT ?auto_82221 ?auto_82226 ) ( IN-CITY ?auto_82228 ?auto_82230 ) ( not ( = ?auto_82220 ?auto_82228 ) ) ( OBJ-AT ?auto_82224 ?auto_82228 ) ( TRUCK-AT ?auto_82227 ?auto_82220 ) ( not ( = ?auto_82224 ?auto_82221 ) ) ( not ( = ?auto_82226 ?auto_82228 ) ) ( not ( = ?auto_82224 ?auto_82222 ) ) ( not ( = ?auto_82221 ?auto_82222 ) ) ( not ( = ?auto_82229 ?auto_82226 ) ) ( not ( = ?auto_82229 ?auto_82228 ) ) ( not ( = ?auto_82224 ?auto_82225 ) ) ( not ( = ?auto_82221 ?auto_82225 ) ) ( not ( = ?auto_82222 ?auto_82225 ) ) ( not ( = ?auto_82231 ?auto_82229 ) ) ( not ( = ?auto_82231 ?auto_82226 ) ) ( not ( = ?auto_82231 ?auto_82228 ) ) ( not ( = ?auto_82224 ?auto_82223 ) ) ( not ( = ?auto_82221 ?auto_82223 ) ) ( not ( = ?auto_82222 ?auto_82223 ) ) ( not ( = ?auto_82225 ?auto_82223 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_82224 ?auto_82221 ?auto_82222 ?auto_82223 ?auto_82225 ?auto_82220 )
      ( DELIVER-5PKG-VERIFY ?auto_82221 ?auto_82222 ?auto_82223 ?auto_82224 ?auto_82225 ?auto_82220 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_82382 - OBJ
      ?auto_82383 - OBJ
      ?auto_82384 - OBJ
      ?auto_82385 - OBJ
      ?auto_82386 - OBJ
      ?auto_82381 - LOCATION
    )
    :vars
    (
      ?auto_82387 - LOCATION
      ?auto_82391 - CITY
      ?auto_82392 - LOCATION
      ?auto_82390 - LOCATION
      ?auto_82389 - LOCATION
      ?auto_82388 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_82387 ?auto_82391 ) ( IN-CITY ?auto_82381 ?auto_82391 ) ( not ( = ?auto_82381 ?auto_82387 ) ) ( OBJ-AT ?auto_82384 ?auto_82387 ) ( IN-CITY ?auto_82392 ?auto_82391 ) ( not ( = ?auto_82381 ?auto_82392 ) ) ( OBJ-AT ?auto_82385 ?auto_82392 ) ( IN-CITY ?auto_82390 ?auto_82391 ) ( not ( = ?auto_82381 ?auto_82390 ) ) ( OBJ-AT ?auto_82383 ?auto_82390 ) ( OBJ-AT ?auto_82382 ?auto_82387 ) ( IN-CITY ?auto_82389 ?auto_82391 ) ( not ( = ?auto_82381 ?auto_82389 ) ) ( OBJ-AT ?auto_82386 ?auto_82389 ) ( TRUCK-AT ?auto_82388 ?auto_82381 ) ( not ( = ?auto_82386 ?auto_82382 ) ) ( not ( = ?auto_82387 ?auto_82389 ) ) ( not ( = ?auto_82386 ?auto_82383 ) ) ( not ( = ?auto_82382 ?auto_82383 ) ) ( not ( = ?auto_82390 ?auto_82387 ) ) ( not ( = ?auto_82390 ?auto_82389 ) ) ( not ( = ?auto_82386 ?auto_82385 ) ) ( not ( = ?auto_82382 ?auto_82385 ) ) ( not ( = ?auto_82383 ?auto_82385 ) ) ( not ( = ?auto_82392 ?auto_82390 ) ) ( not ( = ?auto_82392 ?auto_82387 ) ) ( not ( = ?auto_82392 ?auto_82389 ) ) ( not ( = ?auto_82386 ?auto_82384 ) ) ( not ( = ?auto_82382 ?auto_82384 ) ) ( not ( = ?auto_82383 ?auto_82384 ) ) ( not ( = ?auto_82385 ?auto_82384 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_82386 ?auto_82382 ?auto_82383 ?auto_82384 ?auto_82385 ?auto_82381 )
      ( DELIVER-5PKG-VERIFY ?auto_82382 ?auto_82383 ?auto_82384 ?auto_82385 ?auto_82386 ?auto_82381 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_82540 - OBJ
      ?auto_82541 - OBJ
      ?auto_82542 - OBJ
      ?auto_82543 - OBJ
      ?auto_82544 - OBJ
      ?auto_82539 - LOCATION
    )
    :vars
    (
      ?auto_82545 - LOCATION
      ?auto_82549 - CITY
      ?auto_82550 - LOCATION
      ?auto_82548 - LOCATION
      ?auto_82547 - LOCATION
      ?auto_82546 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_82545 ?auto_82549 ) ( IN-CITY ?auto_82539 ?auto_82549 ) ( not ( = ?auto_82539 ?auto_82545 ) ) ( OBJ-AT ?auto_82544 ?auto_82545 ) ( IN-CITY ?auto_82550 ?auto_82549 ) ( not ( = ?auto_82539 ?auto_82550 ) ) ( OBJ-AT ?auto_82541 ?auto_82550 ) ( IN-CITY ?auto_82548 ?auto_82549 ) ( not ( = ?auto_82539 ?auto_82548 ) ) ( OBJ-AT ?auto_82543 ?auto_82548 ) ( OBJ-AT ?auto_82540 ?auto_82545 ) ( IN-CITY ?auto_82547 ?auto_82549 ) ( not ( = ?auto_82539 ?auto_82547 ) ) ( OBJ-AT ?auto_82542 ?auto_82547 ) ( TRUCK-AT ?auto_82546 ?auto_82539 ) ( not ( = ?auto_82542 ?auto_82540 ) ) ( not ( = ?auto_82545 ?auto_82547 ) ) ( not ( = ?auto_82542 ?auto_82543 ) ) ( not ( = ?auto_82540 ?auto_82543 ) ) ( not ( = ?auto_82548 ?auto_82545 ) ) ( not ( = ?auto_82548 ?auto_82547 ) ) ( not ( = ?auto_82542 ?auto_82541 ) ) ( not ( = ?auto_82540 ?auto_82541 ) ) ( not ( = ?auto_82543 ?auto_82541 ) ) ( not ( = ?auto_82550 ?auto_82548 ) ) ( not ( = ?auto_82550 ?auto_82545 ) ) ( not ( = ?auto_82550 ?auto_82547 ) ) ( not ( = ?auto_82542 ?auto_82544 ) ) ( not ( = ?auto_82540 ?auto_82544 ) ) ( not ( = ?auto_82543 ?auto_82544 ) ) ( not ( = ?auto_82541 ?auto_82544 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_82542 ?auto_82540 ?auto_82543 ?auto_82544 ?auto_82541 ?auto_82539 )
      ( DELIVER-5PKG-VERIFY ?auto_82540 ?auto_82541 ?auto_82542 ?auto_82543 ?auto_82544 ?auto_82539 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_82591 - OBJ
      ?auto_82592 - OBJ
      ?auto_82593 - OBJ
      ?auto_82594 - OBJ
      ?auto_82595 - OBJ
      ?auto_82590 - LOCATION
    )
    :vars
    (
      ?auto_82596 - LOCATION
      ?auto_82600 - CITY
      ?auto_82601 - LOCATION
      ?auto_82599 - LOCATION
      ?auto_82598 - LOCATION
      ?auto_82597 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_82596 ?auto_82600 ) ( IN-CITY ?auto_82590 ?auto_82600 ) ( not ( = ?auto_82590 ?auto_82596 ) ) ( OBJ-AT ?auto_82594 ?auto_82596 ) ( IN-CITY ?auto_82601 ?auto_82600 ) ( not ( = ?auto_82590 ?auto_82601 ) ) ( OBJ-AT ?auto_82592 ?auto_82601 ) ( IN-CITY ?auto_82599 ?auto_82600 ) ( not ( = ?auto_82590 ?auto_82599 ) ) ( OBJ-AT ?auto_82595 ?auto_82599 ) ( OBJ-AT ?auto_82591 ?auto_82596 ) ( IN-CITY ?auto_82598 ?auto_82600 ) ( not ( = ?auto_82590 ?auto_82598 ) ) ( OBJ-AT ?auto_82593 ?auto_82598 ) ( TRUCK-AT ?auto_82597 ?auto_82590 ) ( not ( = ?auto_82593 ?auto_82591 ) ) ( not ( = ?auto_82596 ?auto_82598 ) ) ( not ( = ?auto_82593 ?auto_82595 ) ) ( not ( = ?auto_82591 ?auto_82595 ) ) ( not ( = ?auto_82599 ?auto_82596 ) ) ( not ( = ?auto_82599 ?auto_82598 ) ) ( not ( = ?auto_82593 ?auto_82592 ) ) ( not ( = ?auto_82591 ?auto_82592 ) ) ( not ( = ?auto_82595 ?auto_82592 ) ) ( not ( = ?auto_82601 ?auto_82599 ) ) ( not ( = ?auto_82601 ?auto_82596 ) ) ( not ( = ?auto_82601 ?auto_82598 ) ) ( not ( = ?auto_82593 ?auto_82594 ) ) ( not ( = ?auto_82591 ?auto_82594 ) ) ( not ( = ?auto_82595 ?auto_82594 ) ) ( not ( = ?auto_82592 ?auto_82594 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_82593 ?auto_82591 ?auto_82595 ?auto_82594 ?auto_82592 ?auto_82590 )
      ( DELIVER-5PKG-VERIFY ?auto_82591 ?auto_82592 ?auto_82593 ?auto_82594 ?auto_82595 ?auto_82590 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_82751 - OBJ
      ?auto_82752 - OBJ
      ?auto_82753 - OBJ
      ?auto_82754 - OBJ
      ?auto_82755 - OBJ
      ?auto_82750 - LOCATION
    )
    :vars
    (
      ?auto_82756 - LOCATION
      ?auto_82760 - CITY
      ?auto_82761 - LOCATION
      ?auto_82759 - LOCATION
      ?auto_82758 - LOCATION
      ?auto_82757 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_82756 ?auto_82760 ) ( IN-CITY ?auto_82750 ?auto_82760 ) ( not ( = ?auto_82750 ?auto_82756 ) ) ( OBJ-AT ?auto_82755 ?auto_82756 ) ( IN-CITY ?auto_82761 ?auto_82760 ) ( not ( = ?auto_82750 ?auto_82761 ) ) ( OBJ-AT ?auto_82752 ?auto_82761 ) ( IN-CITY ?auto_82759 ?auto_82760 ) ( not ( = ?auto_82750 ?auto_82759 ) ) ( OBJ-AT ?auto_82753 ?auto_82759 ) ( OBJ-AT ?auto_82751 ?auto_82756 ) ( IN-CITY ?auto_82758 ?auto_82760 ) ( not ( = ?auto_82750 ?auto_82758 ) ) ( OBJ-AT ?auto_82754 ?auto_82758 ) ( TRUCK-AT ?auto_82757 ?auto_82750 ) ( not ( = ?auto_82754 ?auto_82751 ) ) ( not ( = ?auto_82756 ?auto_82758 ) ) ( not ( = ?auto_82754 ?auto_82753 ) ) ( not ( = ?auto_82751 ?auto_82753 ) ) ( not ( = ?auto_82759 ?auto_82756 ) ) ( not ( = ?auto_82759 ?auto_82758 ) ) ( not ( = ?auto_82754 ?auto_82752 ) ) ( not ( = ?auto_82751 ?auto_82752 ) ) ( not ( = ?auto_82753 ?auto_82752 ) ) ( not ( = ?auto_82761 ?auto_82759 ) ) ( not ( = ?auto_82761 ?auto_82756 ) ) ( not ( = ?auto_82761 ?auto_82758 ) ) ( not ( = ?auto_82754 ?auto_82755 ) ) ( not ( = ?auto_82751 ?auto_82755 ) ) ( not ( = ?auto_82753 ?auto_82755 ) ) ( not ( = ?auto_82752 ?auto_82755 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_82754 ?auto_82751 ?auto_82753 ?auto_82755 ?auto_82752 ?auto_82750 )
      ( DELIVER-5PKG-VERIFY ?auto_82751 ?auto_82752 ?auto_82753 ?auto_82754 ?auto_82755 ?auto_82750 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_82802 - OBJ
      ?auto_82803 - OBJ
      ?auto_82804 - OBJ
      ?auto_82805 - OBJ
      ?auto_82806 - OBJ
      ?auto_82801 - LOCATION
    )
    :vars
    (
      ?auto_82807 - LOCATION
      ?auto_82811 - CITY
      ?auto_82812 - LOCATION
      ?auto_82810 - LOCATION
      ?auto_82809 - LOCATION
      ?auto_82808 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_82807 ?auto_82811 ) ( IN-CITY ?auto_82801 ?auto_82811 ) ( not ( = ?auto_82801 ?auto_82807 ) ) ( OBJ-AT ?auto_82805 ?auto_82807 ) ( IN-CITY ?auto_82812 ?auto_82811 ) ( not ( = ?auto_82801 ?auto_82812 ) ) ( OBJ-AT ?auto_82803 ?auto_82812 ) ( IN-CITY ?auto_82810 ?auto_82811 ) ( not ( = ?auto_82801 ?auto_82810 ) ) ( OBJ-AT ?auto_82804 ?auto_82810 ) ( OBJ-AT ?auto_82802 ?auto_82807 ) ( IN-CITY ?auto_82809 ?auto_82811 ) ( not ( = ?auto_82801 ?auto_82809 ) ) ( OBJ-AT ?auto_82806 ?auto_82809 ) ( TRUCK-AT ?auto_82808 ?auto_82801 ) ( not ( = ?auto_82806 ?auto_82802 ) ) ( not ( = ?auto_82807 ?auto_82809 ) ) ( not ( = ?auto_82806 ?auto_82804 ) ) ( not ( = ?auto_82802 ?auto_82804 ) ) ( not ( = ?auto_82810 ?auto_82807 ) ) ( not ( = ?auto_82810 ?auto_82809 ) ) ( not ( = ?auto_82806 ?auto_82803 ) ) ( not ( = ?auto_82802 ?auto_82803 ) ) ( not ( = ?auto_82804 ?auto_82803 ) ) ( not ( = ?auto_82812 ?auto_82810 ) ) ( not ( = ?auto_82812 ?auto_82807 ) ) ( not ( = ?auto_82812 ?auto_82809 ) ) ( not ( = ?auto_82806 ?auto_82805 ) ) ( not ( = ?auto_82802 ?auto_82805 ) ) ( not ( = ?auto_82804 ?auto_82805 ) ) ( not ( = ?auto_82803 ?auto_82805 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_82806 ?auto_82802 ?auto_82804 ?auto_82805 ?auto_82803 ?auto_82801 )
      ( DELIVER-5PKG-VERIFY ?auto_82802 ?auto_82803 ?auto_82804 ?auto_82805 ?auto_82806 ?auto_82801 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_83014 - OBJ
      ?auto_83015 - OBJ
      ?auto_83016 - OBJ
      ?auto_83017 - OBJ
      ?auto_83018 - OBJ
      ?auto_83013 - LOCATION
    )
    :vars
    (
      ?auto_83019 - LOCATION
      ?auto_83023 - CITY
      ?auto_83024 - LOCATION
      ?auto_83022 - LOCATION
      ?auto_83021 - LOCATION
      ?auto_83020 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_83019 ?auto_83023 ) ( IN-CITY ?auto_83013 ?auto_83023 ) ( not ( = ?auto_83013 ?auto_83019 ) ) ( OBJ-AT ?auto_83016 ?auto_83019 ) ( IN-CITY ?auto_83024 ?auto_83023 ) ( not ( = ?auto_83013 ?auto_83024 ) ) ( OBJ-AT ?auto_83015 ?auto_83024 ) ( IN-CITY ?auto_83022 ?auto_83023 ) ( not ( = ?auto_83013 ?auto_83022 ) ) ( OBJ-AT ?auto_83018 ?auto_83022 ) ( OBJ-AT ?auto_83014 ?auto_83019 ) ( IN-CITY ?auto_83021 ?auto_83023 ) ( not ( = ?auto_83013 ?auto_83021 ) ) ( OBJ-AT ?auto_83017 ?auto_83021 ) ( TRUCK-AT ?auto_83020 ?auto_83013 ) ( not ( = ?auto_83017 ?auto_83014 ) ) ( not ( = ?auto_83019 ?auto_83021 ) ) ( not ( = ?auto_83017 ?auto_83018 ) ) ( not ( = ?auto_83014 ?auto_83018 ) ) ( not ( = ?auto_83022 ?auto_83019 ) ) ( not ( = ?auto_83022 ?auto_83021 ) ) ( not ( = ?auto_83017 ?auto_83015 ) ) ( not ( = ?auto_83014 ?auto_83015 ) ) ( not ( = ?auto_83018 ?auto_83015 ) ) ( not ( = ?auto_83024 ?auto_83022 ) ) ( not ( = ?auto_83024 ?auto_83019 ) ) ( not ( = ?auto_83024 ?auto_83021 ) ) ( not ( = ?auto_83017 ?auto_83016 ) ) ( not ( = ?auto_83014 ?auto_83016 ) ) ( not ( = ?auto_83018 ?auto_83016 ) ) ( not ( = ?auto_83015 ?auto_83016 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_83017 ?auto_83014 ?auto_83018 ?auto_83016 ?auto_83015 ?auto_83013 )
      ( DELIVER-5PKG-VERIFY ?auto_83014 ?auto_83015 ?auto_83016 ?auto_83017 ?auto_83018 ?auto_83013 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_83120 - OBJ
      ?auto_83121 - OBJ
      ?auto_83122 - OBJ
      ?auto_83123 - OBJ
      ?auto_83124 - OBJ
      ?auto_83119 - LOCATION
    )
    :vars
    (
      ?auto_83125 - LOCATION
      ?auto_83129 - CITY
      ?auto_83130 - LOCATION
      ?auto_83128 - LOCATION
      ?auto_83127 - LOCATION
      ?auto_83126 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_83125 ?auto_83129 ) ( IN-CITY ?auto_83119 ?auto_83129 ) ( not ( = ?auto_83119 ?auto_83125 ) ) ( OBJ-AT ?auto_83122 ?auto_83125 ) ( IN-CITY ?auto_83130 ?auto_83129 ) ( not ( = ?auto_83119 ?auto_83130 ) ) ( OBJ-AT ?auto_83121 ?auto_83130 ) ( IN-CITY ?auto_83128 ?auto_83129 ) ( not ( = ?auto_83119 ?auto_83128 ) ) ( OBJ-AT ?auto_83123 ?auto_83128 ) ( OBJ-AT ?auto_83120 ?auto_83125 ) ( IN-CITY ?auto_83127 ?auto_83129 ) ( not ( = ?auto_83119 ?auto_83127 ) ) ( OBJ-AT ?auto_83124 ?auto_83127 ) ( TRUCK-AT ?auto_83126 ?auto_83119 ) ( not ( = ?auto_83124 ?auto_83120 ) ) ( not ( = ?auto_83125 ?auto_83127 ) ) ( not ( = ?auto_83124 ?auto_83123 ) ) ( not ( = ?auto_83120 ?auto_83123 ) ) ( not ( = ?auto_83128 ?auto_83125 ) ) ( not ( = ?auto_83128 ?auto_83127 ) ) ( not ( = ?auto_83124 ?auto_83121 ) ) ( not ( = ?auto_83120 ?auto_83121 ) ) ( not ( = ?auto_83123 ?auto_83121 ) ) ( not ( = ?auto_83130 ?auto_83128 ) ) ( not ( = ?auto_83130 ?auto_83125 ) ) ( not ( = ?auto_83130 ?auto_83127 ) ) ( not ( = ?auto_83124 ?auto_83122 ) ) ( not ( = ?auto_83120 ?auto_83122 ) ) ( not ( = ?auto_83123 ?auto_83122 ) ) ( not ( = ?auto_83121 ?auto_83122 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_83124 ?auto_83120 ?auto_83123 ?auto_83122 ?auto_83121 ?auto_83119 )
      ( DELIVER-5PKG-VERIFY ?auto_83120 ?auto_83121 ?auto_83122 ?auto_83123 ?auto_83124 ?auto_83119 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_83495 - OBJ
      ?auto_83496 - OBJ
      ?auto_83497 - OBJ
      ?auto_83498 - OBJ
      ?auto_83499 - OBJ
      ?auto_83494 - LOCATION
    )
    :vars
    (
      ?auto_83500 - LOCATION
      ?auto_83504 - CITY
      ?auto_83505 - LOCATION
      ?auto_83503 - LOCATION
      ?auto_83502 - LOCATION
      ?auto_83501 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_83500 ?auto_83504 ) ( IN-CITY ?auto_83494 ?auto_83504 ) ( not ( = ?auto_83494 ?auto_83500 ) ) ( OBJ-AT ?auto_83496 ?auto_83500 ) ( IN-CITY ?auto_83505 ?auto_83504 ) ( not ( = ?auto_83494 ?auto_83505 ) ) ( OBJ-AT ?auto_83499 ?auto_83505 ) ( IN-CITY ?auto_83503 ?auto_83504 ) ( not ( = ?auto_83494 ?auto_83503 ) ) ( OBJ-AT ?auto_83498 ?auto_83503 ) ( OBJ-AT ?auto_83495 ?auto_83500 ) ( IN-CITY ?auto_83502 ?auto_83504 ) ( not ( = ?auto_83494 ?auto_83502 ) ) ( OBJ-AT ?auto_83497 ?auto_83502 ) ( TRUCK-AT ?auto_83501 ?auto_83494 ) ( not ( = ?auto_83497 ?auto_83495 ) ) ( not ( = ?auto_83500 ?auto_83502 ) ) ( not ( = ?auto_83497 ?auto_83498 ) ) ( not ( = ?auto_83495 ?auto_83498 ) ) ( not ( = ?auto_83503 ?auto_83500 ) ) ( not ( = ?auto_83503 ?auto_83502 ) ) ( not ( = ?auto_83497 ?auto_83499 ) ) ( not ( = ?auto_83495 ?auto_83499 ) ) ( not ( = ?auto_83498 ?auto_83499 ) ) ( not ( = ?auto_83505 ?auto_83503 ) ) ( not ( = ?auto_83505 ?auto_83500 ) ) ( not ( = ?auto_83505 ?auto_83502 ) ) ( not ( = ?auto_83497 ?auto_83496 ) ) ( not ( = ?auto_83495 ?auto_83496 ) ) ( not ( = ?auto_83498 ?auto_83496 ) ) ( not ( = ?auto_83499 ?auto_83496 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_83497 ?auto_83495 ?auto_83498 ?auto_83496 ?auto_83499 ?auto_83494 )
      ( DELIVER-5PKG-VERIFY ?auto_83495 ?auto_83496 ?auto_83497 ?auto_83498 ?auto_83499 ?auto_83494 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_83546 - OBJ
      ?auto_83547 - OBJ
      ?auto_83548 - OBJ
      ?auto_83549 - OBJ
      ?auto_83550 - OBJ
      ?auto_83545 - LOCATION
    )
    :vars
    (
      ?auto_83551 - LOCATION
      ?auto_83555 - CITY
      ?auto_83556 - LOCATION
      ?auto_83554 - LOCATION
      ?auto_83553 - LOCATION
      ?auto_83552 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_83551 ?auto_83555 ) ( IN-CITY ?auto_83545 ?auto_83555 ) ( not ( = ?auto_83545 ?auto_83551 ) ) ( OBJ-AT ?auto_83547 ?auto_83551 ) ( IN-CITY ?auto_83556 ?auto_83555 ) ( not ( = ?auto_83545 ?auto_83556 ) ) ( OBJ-AT ?auto_83549 ?auto_83556 ) ( IN-CITY ?auto_83554 ?auto_83555 ) ( not ( = ?auto_83545 ?auto_83554 ) ) ( OBJ-AT ?auto_83550 ?auto_83554 ) ( OBJ-AT ?auto_83546 ?auto_83551 ) ( IN-CITY ?auto_83553 ?auto_83555 ) ( not ( = ?auto_83545 ?auto_83553 ) ) ( OBJ-AT ?auto_83548 ?auto_83553 ) ( TRUCK-AT ?auto_83552 ?auto_83545 ) ( not ( = ?auto_83548 ?auto_83546 ) ) ( not ( = ?auto_83551 ?auto_83553 ) ) ( not ( = ?auto_83548 ?auto_83550 ) ) ( not ( = ?auto_83546 ?auto_83550 ) ) ( not ( = ?auto_83554 ?auto_83551 ) ) ( not ( = ?auto_83554 ?auto_83553 ) ) ( not ( = ?auto_83548 ?auto_83549 ) ) ( not ( = ?auto_83546 ?auto_83549 ) ) ( not ( = ?auto_83550 ?auto_83549 ) ) ( not ( = ?auto_83556 ?auto_83554 ) ) ( not ( = ?auto_83556 ?auto_83551 ) ) ( not ( = ?auto_83556 ?auto_83553 ) ) ( not ( = ?auto_83548 ?auto_83547 ) ) ( not ( = ?auto_83546 ?auto_83547 ) ) ( not ( = ?auto_83550 ?auto_83547 ) ) ( not ( = ?auto_83549 ?auto_83547 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_83548 ?auto_83546 ?auto_83550 ?auto_83547 ?auto_83549 ?auto_83545 )
      ( DELIVER-5PKG-VERIFY ?auto_83546 ?auto_83547 ?auto_83548 ?auto_83549 ?auto_83550 ?auto_83545 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_84039 - OBJ
      ?auto_84040 - OBJ
      ?auto_84041 - OBJ
      ?auto_84042 - OBJ
      ?auto_84043 - OBJ
      ?auto_84038 - LOCATION
    )
    :vars
    (
      ?auto_84044 - LOCATION
      ?auto_84048 - CITY
      ?auto_84049 - LOCATION
      ?auto_84047 - LOCATION
      ?auto_84046 - LOCATION
      ?auto_84045 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_84044 ?auto_84048 ) ( IN-CITY ?auto_84038 ?auto_84048 ) ( not ( = ?auto_84038 ?auto_84044 ) ) ( OBJ-AT ?auto_84040 ?auto_84044 ) ( IN-CITY ?auto_84049 ?auto_84048 ) ( not ( = ?auto_84038 ?auto_84049 ) ) ( OBJ-AT ?auto_84043 ?auto_84049 ) ( IN-CITY ?auto_84047 ?auto_84048 ) ( not ( = ?auto_84038 ?auto_84047 ) ) ( OBJ-AT ?auto_84041 ?auto_84047 ) ( OBJ-AT ?auto_84039 ?auto_84044 ) ( IN-CITY ?auto_84046 ?auto_84048 ) ( not ( = ?auto_84038 ?auto_84046 ) ) ( OBJ-AT ?auto_84042 ?auto_84046 ) ( TRUCK-AT ?auto_84045 ?auto_84038 ) ( not ( = ?auto_84042 ?auto_84039 ) ) ( not ( = ?auto_84044 ?auto_84046 ) ) ( not ( = ?auto_84042 ?auto_84041 ) ) ( not ( = ?auto_84039 ?auto_84041 ) ) ( not ( = ?auto_84047 ?auto_84044 ) ) ( not ( = ?auto_84047 ?auto_84046 ) ) ( not ( = ?auto_84042 ?auto_84043 ) ) ( not ( = ?auto_84039 ?auto_84043 ) ) ( not ( = ?auto_84041 ?auto_84043 ) ) ( not ( = ?auto_84049 ?auto_84047 ) ) ( not ( = ?auto_84049 ?auto_84044 ) ) ( not ( = ?auto_84049 ?auto_84046 ) ) ( not ( = ?auto_84042 ?auto_84040 ) ) ( not ( = ?auto_84039 ?auto_84040 ) ) ( not ( = ?auto_84041 ?auto_84040 ) ) ( not ( = ?auto_84043 ?auto_84040 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_84042 ?auto_84039 ?auto_84041 ?auto_84040 ?auto_84043 ?auto_84038 )
      ( DELIVER-5PKG-VERIFY ?auto_84039 ?auto_84040 ?auto_84041 ?auto_84042 ?auto_84043 ?auto_84038 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_84200 - OBJ
      ?auto_84201 - OBJ
      ?auto_84202 - OBJ
      ?auto_84203 - OBJ
      ?auto_84204 - OBJ
      ?auto_84199 - LOCATION
    )
    :vars
    (
      ?auto_84205 - LOCATION
      ?auto_84209 - CITY
      ?auto_84210 - LOCATION
      ?auto_84208 - LOCATION
      ?auto_84207 - LOCATION
      ?auto_84206 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_84205 ?auto_84209 ) ( IN-CITY ?auto_84199 ?auto_84209 ) ( not ( = ?auto_84199 ?auto_84205 ) ) ( OBJ-AT ?auto_84201 ?auto_84205 ) ( IN-CITY ?auto_84210 ?auto_84209 ) ( not ( = ?auto_84199 ?auto_84210 ) ) ( OBJ-AT ?auto_84203 ?auto_84210 ) ( IN-CITY ?auto_84208 ?auto_84209 ) ( not ( = ?auto_84199 ?auto_84208 ) ) ( OBJ-AT ?auto_84202 ?auto_84208 ) ( OBJ-AT ?auto_84200 ?auto_84205 ) ( IN-CITY ?auto_84207 ?auto_84209 ) ( not ( = ?auto_84199 ?auto_84207 ) ) ( OBJ-AT ?auto_84204 ?auto_84207 ) ( TRUCK-AT ?auto_84206 ?auto_84199 ) ( not ( = ?auto_84204 ?auto_84200 ) ) ( not ( = ?auto_84205 ?auto_84207 ) ) ( not ( = ?auto_84204 ?auto_84202 ) ) ( not ( = ?auto_84200 ?auto_84202 ) ) ( not ( = ?auto_84208 ?auto_84205 ) ) ( not ( = ?auto_84208 ?auto_84207 ) ) ( not ( = ?auto_84204 ?auto_84203 ) ) ( not ( = ?auto_84200 ?auto_84203 ) ) ( not ( = ?auto_84202 ?auto_84203 ) ) ( not ( = ?auto_84210 ?auto_84208 ) ) ( not ( = ?auto_84210 ?auto_84205 ) ) ( not ( = ?auto_84210 ?auto_84207 ) ) ( not ( = ?auto_84204 ?auto_84201 ) ) ( not ( = ?auto_84200 ?auto_84201 ) ) ( not ( = ?auto_84202 ?auto_84201 ) ) ( not ( = ?auto_84203 ?auto_84201 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_84204 ?auto_84200 ?auto_84202 ?auto_84201 ?auto_84203 ?auto_84199 )
      ( DELIVER-5PKG-VERIFY ?auto_84200 ?auto_84201 ?auto_84202 ?auto_84203 ?auto_84204 ?auto_84199 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_84358 - OBJ
      ?auto_84359 - OBJ
      ?auto_84360 - OBJ
      ?auto_84361 - OBJ
      ?auto_84362 - OBJ
      ?auto_84357 - LOCATION
    )
    :vars
    (
      ?auto_84363 - LOCATION
      ?auto_84367 - CITY
      ?auto_84368 - LOCATION
      ?auto_84366 - LOCATION
      ?auto_84365 - LOCATION
      ?auto_84364 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_84363 ?auto_84367 ) ( IN-CITY ?auto_84357 ?auto_84367 ) ( not ( = ?auto_84357 ?auto_84363 ) ) ( OBJ-AT ?auto_84359 ?auto_84363 ) ( IN-CITY ?auto_84368 ?auto_84367 ) ( not ( = ?auto_84357 ?auto_84368 ) ) ( OBJ-AT ?auto_84360 ?auto_84368 ) ( IN-CITY ?auto_84366 ?auto_84367 ) ( not ( = ?auto_84357 ?auto_84366 ) ) ( OBJ-AT ?auto_84362 ?auto_84366 ) ( OBJ-AT ?auto_84358 ?auto_84363 ) ( IN-CITY ?auto_84365 ?auto_84367 ) ( not ( = ?auto_84357 ?auto_84365 ) ) ( OBJ-AT ?auto_84361 ?auto_84365 ) ( TRUCK-AT ?auto_84364 ?auto_84357 ) ( not ( = ?auto_84361 ?auto_84358 ) ) ( not ( = ?auto_84363 ?auto_84365 ) ) ( not ( = ?auto_84361 ?auto_84362 ) ) ( not ( = ?auto_84358 ?auto_84362 ) ) ( not ( = ?auto_84366 ?auto_84363 ) ) ( not ( = ?auto_84366 ?auto_84365 ) ) ( not ( = ?auto_84361 ?auto_84360 ) ) ( not ( = ?auto_84358 ?auto_84360 ) ) ( not ( = ?auto_84362 ?auto_84360 ) ) ( not ( = ?auto_84368 ?auto_84366 ) ) ( not ( = ?auto_84368 ?auto_84363 ) ) ( not ( = ?auto_84368 ?auto_84365 ) ) ( not ( = ?auto_84361 ?auto_84359 ) ) ( not ( = ?auto_84358 ?auto_84359 ) ) ( not ( = ?auto_84362 ?auto_84359 ) ) ( not ( = ?auto_84360 ?auto_84359 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_84361 ?auto_84358 ?auto_84362 ?auto_84359 ?auto_84360 ?auto_84357 )
      ( DELIVER-5PKG-VERIFY ?auto_84358 ?auto_84359 ?auto_84360 ?auto_84361 ?auto_84362 ?auto_84357 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_84464 - OBJ
      ?auto_84465 - OBJ
      ?auto_84466 - OBJ
      ?auto_84467 - OBJ
      ?auto_84468 - OBJ
      ?auto_84463 - LOCATION
    )
    :vars
    (
      ?auto_84469 - LOCATION
      ?auto_84473 - CITY
      ?auto_84474 - LOCATION
      ?auto_84472 - LOCATION
      ?auto_84471 - LOCATION
      ?auto_84470 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_84469 ?auto_84473 ) ( IN-CITY ?auto_84463 ?auto_84473 ) ( not ( = ?auto_84463 ?auto_84469 ) ) ( OBJ-AT ?auto_84465 ?auto_84469 ) ( IN-CITY ?auto_84474 ?auto_84473 ) ( not ( = ?auto_84463 ?auto_84474 ) ) ( OBJ-AT ?auto_84466 ?auto_84474 ) ( IN-CITY ?auto_84472 ?auto_84473 ) ( not ( = ?auto_84463 ?auto_84472 ) ) ( OBJ-AT ?auto_84467 ?auto_84472 ) ( OBJ-AT ?auto_84464 ?auto_84469 ) ( IN-CITY ?auto_84471 ?auto_84473 ) ( not ( = ?auto_84463 ?auto_84471 ) ) ( OBJ-AT ?auto_84468 ?auto_84471 ) ( TRUCK-AT ?auto_84470 ?auto_84463 ) ( not ( = ?auto_84468 ?auto_84464 ) ) ( not ( = ?auto_84469 ?auto_84471 ) ) ( not ( = ?auto_84468 ?auto_84467 ) ) ( not ( = ?auto_84464 ?auto_84467 ) ) ( not ( = ?auto_84472 ?auto_84469 ) ) ( not ( = ?auto_84472 ?auto_84471 ) ) ( not ( = ?auto_84468 ?auto_84466 ) ) ( not ( = ?auto_84464 ?auto_84466 ) ) ( not ( = ?auto_84467 ?auto_84466 ) ) ( not ( = ?auto_84474 ?auto_84472 ) ) ( not ( = ?auto_84474 ?auto_84469 ) ) ( not ( = ?auto_84474 ?auto_84471 ) ) ( not ( = ?auto_84468 ?auto_84465 ) ) ( not ( = ?auto_84464 ?auto_84465 ) ) ( not ( = ?auto_84467 ?auto_84465 ) ) ( not ( = ?auto_84466 ?auto_84465 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_84468 ?auto_84464 ?auto_84467 ?auto_84465 ?auto_84466 ?auto_84463 )
      ( DELIVER-5PKG-VERIFY ?auto_84464 ?auto_84465 ?auto_84466 ?auto_84467 ?auto_84468 ?auto_84463 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_85173 - OBJ
      ?auto_85174 - OBJ
      ?auto_85175 - OBJ
      ?auto_85176 - OBJ
      ?auto_85177 - OBJ
      ?auto_85172 - LOCATION
    )
    :vars
    (
      ?auto_85178 - LOCATION
      ?auto_85182 - CITY
      ?auto_85183 - LOCATION
      ?auto_85181 - LOCATION
      ?auto_85180 - LOCATION
      ?auto_85179 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_85178 ?auto_85182 ) ( IN-CITY ?auto_85172 ?auto_85182 ) ( not ( = ?auto_85172 ?auto_85178 ) ) ( OBJ-AT ?auto_85177 ?auto_85178 ) ( IN-CITY ?auto_85183 ?auto_85182 ) ( not ( = ?auto_85172 ?auto_85183 ) ) ( OBJ-AT ?auto_85176 ?auto_85183 ) ( IN-CITY ?auto_85181 ?auto_85182 ) ( not ( = ?auto_85172 ?auto_85181 ) ) ( OBJ-AT ?auto_85173 ?auto_85181 ) ( OBJ-AT ?auto_85175 ?auto_85178 ) ( IN-CITY ?auto_85180 ?auto_85182 ) ( not ( = ?auto_85172 ?auto_85180 ) ) ( OBJ-AT ?auto_85174 ?auto_85180 ) ( TRUCK-AT ?auto_85179 ?auto_85172 ) ( not ( = ?auto_85174 ?auto_85175 ) ) ( not ( = ?auto_85178 ?auto_85180 ) ) ( not ( = ?auto_85174 ?auto_85173 ) ) ( not ( = ?auto_85175 ?auto_85173 ) ) ( not ( = ?auto_85181 ?auto_85178 ) ) ( not ( = ?auto_85181 ?auto_85180 ) ) ( not ( = ?auto_85174 ?auto_85176 ) ) ( not ( = ?auto_85175 ?auto_85176 ) ) ( not ( = ?auto_85173 ?auto_85176 ) ) ( not ( = ?auto_85183 ?auto_85181 ) ) ( not ( = ?auto_85183 ?auto_85178 ) ) ( not ( = ?auto_85183 ?auto_85180 ) ) ( not ( = ?auto_85174 ?auto_85177 ) ) ( not ( = ?auto_85175 ?auto_85177 ) ) ( not ( = ?auto_85173 ?auto_85177 ) ) ( not ( = ?auto_85176 ?auto_85177 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_85174 ?auto_85175 ?auto_85173 ?auto_85177 ?auto_85176 ?auto_85172 )
      ( DELIVER-5PKG-VERIFY ?auto_85173 ?auto_85174 ?auto_85175 ?auto_85176 ?auto_85177 ?auto_85172 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_85224 - OBJ
      ?auto_85225 - OBJ
      ?auto_85226 - OBJ
      ?auto_85227 - OBJ
      ?auto_85228 - OBJ
      ?auto_85223 - LOCATION
    )
    :vars
    (
      ?auto_85229 - LOCATION
      ?auto_85233 - CITY
      ?auto_85234 - LOCATION
      ?auto_85232 - LOCATION
      ?auto_85231 - LOCATION
      ?auto_85230 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_85229 ?auto_85233 ) ( IN-CITY ?auto_85223 ?auto_85233 ) ( not ( = ?auto_85223 ?auto_85229 ) ) ( OBJ-AT ?auto_85227 ?auto_85229 ) ( IN-CITY ?auto_85234 ?auto_85233 ) ( not ( = ?auto_85223 ?auto_85234 ) ) ( OBJ-AT ?auto_85228 ?auto_85234 ) ( IN-CITY ?auto_85232 ?auto_85233 ) ( not ( = ?auto_85223 ?auto_85232 ) ) ( OBJ-AT ?auto_85224 ?auto_85232 ) ( OBJ-AT ?auto_85226 ?auto_85229 ) ( IN-CITY ?auto_85231 ?auto_85233 ) ( not ( = ?auto_85223 ?auto_85231 ) ) ( OBJ-AT ?auto_85225 ?auto_85231 ) ( TRUCK-AT ?auto_85230 ?auto_85223 ) ( not ( = ?auto_85225 ?auto_85226 ) ) ( not ( = ?auto_85229 ?auto_85231 ) ) ( not ( = ?auto_85225 ?auto_85224 ) ) ( not ( = ?auto_85226 ?auto_85224 ) ) ( not ( = ?auto_85232 ?auto_85229 ) ) ( not ( = ?auto_85232 ?auto_85231 ) ) ( not ( = ?auto_85225 ?auto_85228 ) ) ( not ( = ?auto_85226 ?auto_85228 ) ) ( not ( = ?auto_85224 ?auto_85228 ) ) ( not ( = ?auto_85234 ?auto_85232 ) ) ( not ( = ?auto_85234 ?auto_85229 ) ) ( not ( = ?auto_85234 ?auto_85231 ) ) ( not ( = ?auto_85225 ?auto_85227 ) ) ( not ( = ?auto_85226 ?auto_85227 ) ) ( not ( = ?auto_85224 ?auto_85227 ) ) ( not ( = ?auto_85228 ?auto_85227 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_85225 ?auto_85226 ?auto_85224 ?auto_85227 ?auto_85228 ?auto_85223 )
      ( DELIVER-5PKG-VERIFY ?auto_85224 ?auto_85225 ?auto_85226 ?auto_85227 ?auto_85228 ?auto_85223 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_85384 - OBJ
      ?auto_85385 - OBJ
      ?auto_85386 - OBJ
      ?auto_85387 - OBJ
      ?auto_85388 - OBJ
      ?auto_85383 - LOCATION
    )
    :vars
    (
      ?auto_85389 - LOCATION
      ?auto_85393 - CITY
      ?auto_85394 - LOCATION
      ?auto_85392 - LOCATION
      ?auto_85391 - LOCATION
      ?auto_85390 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_85389 ?auto_85393 ) ( IN-CITY ?auto_85383 ?auto_85393 ) ( not ( = ?auto_85383 ?auto_85389 ) ) ( OBJ-AT ?auto_85388 ?auto_85389 ) ( IN-CITY ?auto_85394 ?auto_85393 ) ( not ( = ?auto_85383 ?auto_85394 ) ) ( OBJ-AT ?auto_85386 ?auto_85394 ) ( IN-CITY ?auto_85392 ?auto_85393 ) ( not ( = ?auto_85383 ?auto_85392 ) ) ( OBJ-AT ?auto_85384 ?auto_85392 ) ( OBJ-AT ?auto_85387 ?auto_85389 ) ( IN-CITY ?auto_85391 ?auto_85393 ) ( not ( = ?auto_85383 ?auto_85391 ) ) ( OBJ-AT ?auto_85385 ?auto_85391 ) ( TRUCK-AT ?auto_85390 ?auto_85383 ) ( not ( = ?auto_85385 ?auto_85387 ) ) ( not ( = ?auto_85389 ?auto_85391 ) ) ( not ( = ?auto_85385 ?auto_85384 ) ) ( not ( = ?auto_85387 ?auto_85384 ) ) ( not ( = ?auto_85392 ?auto_85389 ) ) ( not ( = ?auto_85392 ?auto_85391 ) ) ( not ( = ?auto_85385 ?auto_85386 ) ) ( not ( = ?auto_85387 ?auto_85386 ) ) ( not ( = ?auto_85384 ?auto_85386 ) ) ( not ( = ?auto_85394 ?auto_85392 ) ) ( not ( = ?auto_85394 ?auto_85389 ) ) ( not ( = ?auto_85394 ?auto_85391 ) ) ( not ( = ?auto_85385 ?auto_85388 ) ) ( not ( = ?auto_85387 ?auto_85388 ) ) ( not ( = ?auto_85384 ?auto_85388 ) ) ( not ( = ?auto_85386 ?auto_85388 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_85385 ?auto_85387 ?auto_85384 ?auto_85388 ?auto_85386 ?auto_85383 )
      ( DELIVER-5PKG-VERIFY ?auto_85384 ?auto_85385 ?auto_85386 ?auto_85387 ?auto_85388 ?auto_85383 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_85435 - OBJ
      ?auto_85436 - OBJ
      ?auto_85437 - OBJ
      ?auto_85438 - OBJ
      ?auto_85439 - OBJ
      ?auto_85434 - LOCATION
    )
    :vars
    (
      ?auto_85440 - LOCATION
      ?auto_85444 - CITY
      ?auto_85445 - LOCATION
      ?auto_85443 - LOCATION
      ?auto_85442 - LOCATION
      ?auto_85441 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_85440 ?auto_85444 ) ( IN-CITY ?auto_85434 ?auto_85444 ) ( not ( = ?auto_85434 ?auto_85440 ) ) ( OBJ-AT ?auto_85438 ?auto_85440 ) ( IN-CITY ?auto_85445 ?auto_85444 ) ( not ( = ?auto_85434 ?auto_85445 ) ) ( OBJ-AT ?auto_85437 ?auto_85445 ) ( IN-CITY ?auto_85443 ?auto_85444 ) ( not ( = ?auto_85434 ?auto_85443 ) ) ( OBJ-AT ?auto_85435 ?auto_85443 ) ( OBJ-AT ?auto_85439 ?auto_85440 ) ( IN-CITY ?auto_85442 ?auto_85444 ) ( not ( = ?auto_85434 ?auto_85442 ) ) ( OBJ-AT ?auto_85436 ?auto_85442 ) ( TRUCK-AT ?auto_85441 ?auto_85434 ) ( not ( = ?auto_85436 ?auto_85439 ) ) ( not ( = ?auto_85440 ?auto_85442 ) ) ( not ( = ?auto_85436 ?auto_85435 ) ) ( not ( = ?auto_85439 ?auto_85435 ) ) ( not ( = ?auto_85443 ?auto_85440 ) ) ( not ( = ?auto_85443 ?auto_85442 ) ) ( not ( = ?auto_85436 ?auto_85437 ) ) ( not ( = ?auto_85439 ?auto_85437 ) ) ( not ( = ?auto_85435 ?auto_85437 ) ) ( not ( = ?auto_85445 ?auto_85443 ) ) ( not ( = ?auto_85445 ?auto_85440 ) ) ( not ( = ?auto_85445 ?auto_85442 ) ) ( not ( = ?auto_85436 ?auto_85438 ) ) ( not ( = ?auto_85439 ?auto_85438 ) ) ( not ( = ?auto_85435 ?auto_85438 ) ) ( not ( = ?auto_85437 ?auto_85438 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_85436 ?auto_85439 ?auto_85435 ?auto_85438 ?auto_85437 ?auto_85434 )
      ( DELIVER-5PKG-VERIFY ?auto_85435 ?auto_85436 ?auto_85437 ?auto_85438 ?auto_85439 ?auto_85434 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_85593 - OBJ
      ?auto_85594 - OBJ
      ?auto_85595 - OBJ
      ?auto_85596 - OBJ
      ?auto_85597 - OBJ
      ?auto_85592 - LOCATION
    )
    :vars
    (
      ?auto_85598 - LOCATION
      ?auto_85602 - CITY
      ?auto_85603 - LOCATION
      ?auto_85601 - LOCATION
      ?auto_85600 - LOCATION
      ?auto_85599 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_85598 ?auto_85602 ) ( IN-CITY ?auto_85592 ?auto_85602 ) ( not ( = ?auto_85592 ?auto_85598 ) ) ( OBJ-AT ?auto_85595 ?auto_85598 ) ( IN-CITY ?auto_85603 ?auto_85602 ) ( not ( = ?auto_85592 ?auto_85603 ) ) ( OBJ-AT ?auto_85597 ?auto_85603 ) ( IN-CITY ?auto_85601 ?auto_85602 ) ( not ( = ?auto_85592 ?auto_85601 ) ) ( OBJ-AT ?auto_85593 ?auto_85601 ) ( OBJ-AT ?auto_85596 ?auto_85598 ) ( IN-CITY ?auto_85600 ?auto_85602 ) ( not ( = ?auto_85592 ?auto_85600 ) ) ( OBJ-AT ?auto_85594 ?auto_85600 ) ( TRUCK-AT ?auto_85599 ?auto_85592 ) ( not ( = ?auto_85594 ?auto_85596 ) ) ( not ( = ?auto_85598 ?auto_85600 ) ) ( not ( = ?auto_85594 ?auto_85593 ) ) ( not ( = ?auto_85596 ?auto_85593 ) ) ( not ( = ?auto_85601 ?auto_85598 ) ) ( not ( = ?auto_85601 ?auto_85600 ) ) ( not ( = ?auto_85594 ?auto_85597 ) ) ( not ( = ?auto_85596 ?auto_85597 ) ) ( not ( = ?auto_85593 ?auto_85597 ) ) ( not ( = ?auto_85603 ?auto_85601 ) ) ( not ( = ?auto_85603 ?auto_85598 ) ) ( not ( = ?auto_85603 ?auto_85600 ) ) ( not ( = ?auto_85594 ?auto_85595 ) ) ( not ( = ?auto_85596 ?auto_85595 ) ) ( not ( = ?auto_85593 ?auto_85595 ) ) ( not ( = ?auto_85597 ?auto_85595 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_85594 ?auto_85596 ?auto_85593 ?auto_85595 ?auto_85597 ?auto_85592 )
      ( DELIVER-5PKG-VERIFY ?auto_85593 ?auto_85594 ?auto_85595 ?auto_85596 ?auto_85597 ?auto_85592 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_85699 - OBJ
      ?auto_85700 - OBJ
      ?auto_85701 - OBJ
      ?auto_85702 - OBJ
      ?auto_85703 - OBJ
      ?auto_85698 - LOCATION
    )
    :vars
    (
      ?auto_85704 - LOCATION
      ?auto_85708 - CITY
      ?auto_85709 - LOCATION
      ?auto_85707 - LOCATION
      ?auto_85706 - LOCATION
      ?auto_85705 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_85704 ?auto_85708 ) ( IN-CITY ?auto_85698 ?auto_85708 ) ( not ( = ?auto_85698 ?auto_85704 ) ) ( OBJ-AT ?auto_85701 ?auto_85704 ) ( IN-CITY ?auto_85709 ?auto_85708 ) ( not ( = ?auto_85698 ?auto_85709 ) ) ( OBJ-AT ?auto_85702 ?auto_85709 ) ( IN-CITY ?auto_85707 ?auto_85708 ) ( not ( = ?auto_85698 ?auto_85707 ) ) ( OBJ-AT ?auto_85699 ?auto_85707 ) ( OBJ-AT ?auto_85703 ?auto_85704 ) ( IN-CITY ?auto_85706 ?auto_85708 ) ( not ( = ?auto_85698 ?auto_85706 ) ) ( OBJ-AT ?auto_85700 ?auto_85706 ) ( TRUCK-AT ?auto_85705 ?auto_85698 ) ( not ( = ?auto_85700 ?auto_85703 ) ) ( not ( = ?auto_85704 ?auto_85706 ) ) ( not ( = ?auto_85700 ?auto_85699 ) ) ( not ( = ?auto_85703 ?auto_85699 ) ) ( not ( = ?auto_85707 ?auto_85704 ) ) ( not ( = ?auto_85707 ?auto_85706 ) ) ( not ( = ?auto_85700 ?auto_85702 ) ) ( not ( = ?auto_85703 ?auto_85702 ) ) ( not ( = ?auto_85699 ?auto_85702 ) ) ( not ( = ?auto_85709 ?auto_85707 ) ) ( not ( = ?auto_85709 ?auto_85704 ) ) ( not ( = ?auto_85709 ?auto_85706 ) ) ( not ( = ?auto_85700 ?auto_85701 ) ) ( not ( = ?auto_85703 ?auto_85701 ) ) ( not ( = ?auto_85699 ?auto_85701 ) ) ( not ( = ?auto_85702 ?auto_85701 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_85700 ?auto_85703 ?auto_85699 ?auto_85701 ?auto_85702 ?auto_85698 )
      ( DELIVER-5PKG-VERIFY ?auto_85699 ?auto_85700 ?auto_85701 ?auto_85702 ?auto_85703 ?auto_85698 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_85857 - OBJ
      ?auto_85858 - OBJ
      ?auto_85859 - OBJ
      ?auto_85860 - OBJ
      ?auto_85861 - OBJ
      ?auto_85856 - LOCATION
    )
    :vars
    (
      ?auto_85862 - LOCATION
      ?auto_85866 - CITY
      ?auto_85867 - LOCATION
      ?auto_85865 - LOCATION
      ?auto_85864 - LOCATION
      ?auto_85863 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_85862 ?auto_85866 ) ( IN-CITY ?auto_85856 ?auto_85866 ) ( not ( = ?auto_85856 ?auto_85862 ) ) ( OBJ-AT ?auto_85861 ?auto_85862 ) ( IN-CITY ?auto_85867 ?auto_85866 ) ( not ( = ?auto_85856 ?auto_85867 ) ) ( OBJ-AT ?auto_85860 ?auto_85867 ) ( IN-CITY ?auto_85865 ?auto_85866 ) ( not ( = ?auto_85856 ?auto_85865 ) ) ( OBJ-AT ?auto_85857 ?auto_85865 ) ( OBJ-AT ?auto_85858 ?auto_85862 ) ( IN-CITY ?auto_85864 ?auto_85866 ) ( not ( = ?auto_85856 ?auto_85864 ) ) ( OBJ-AT ?auto_85859 ?auto_85864 ) ( TRUCK-AT ?auto_85863 ?auto_85856 ) ( not ( = ?auto_85859 ?auto_85858 ) ) ( not ( = ?auto_85862 ?auto_85864 ) ) ( not ( = ?auto_85859 ?auto_85857 ) ) ( not ( = ?auto_85858 ?auto_85857 ) ) ( not ( = ?auto_85865 ?auto_85862 ) ) ( not ( = ?auto_85865 ?auto_85864 ) ) ( not ( = ?auto_85859 ?auto_85860 ) ) ( not ( = ?auto_85858 ?auto_85860 ) ) ( not ( = ?auto_85857 ?auto_85860 ) ) ( not ( = ?auto_85867 ?auto_85865 ) ) ( not ( = ?auto_85867 ?auto_85862 ) ) ( not ( = ?auto_85867 ?auto_85864 ) ) ( not ( = ?auto_85859 ?auto_85861 ) ) ( not ( = ?auto_85858 ?auto_85861 ) ) ( not ( = ?auto_85857 ?auto_85861 ) ) ( not ( = ?auto_85860 ?auto_85861 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_85859 ?auto_85858 ?auto_85857 ?auto_85861 ?auto_85860 ?auto_85856 )
      ( DELIVER-5PKG-VERIFY ?auto_85857 ?auto_85858 ?auto_85859 ?auto_85860 ?auto_85861 ?auto_85856 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_85908 - OBJ
      ?auto_85909 - OBJ
      ?auto_85910 - OBJ
      ?auto_85911 - OBJ
      ?auto_85912 - OBJ
      ?auto_85907 - LOCATION
    )
    :vars
    (
      ?auto_85913 - LOCATION
      ?auto_85917 - CITY
      ?auto_85918 - LOCATION
      ?auto_85916 - LOCATION
      ?auto_85915 - LOCATION
      ?auto_85914 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_85913 ?auto_85917 ) ( IN-CITY ?auto_85907 ?auto_85917 ) ( not ( = ?auto_85907 ?auto_85913 ) ) ( OBJ-AT ?auto_85911 ?auto_85913 ) ( IN-CITY ?auto_85918 ?auto_85917 ) ( not ( = ?auto_85907 ?auto_85918 ) ) ( OBJ-AT ?auto_85912 ?auto_85918 ) ( IN-CITY ?auto_85916 ?auto_85917 ) ( not ( = ?auto_85907 ?auto_85916 ) ) ( OBJ-AT ?auto_85908 ?auto_85916 ) ( OBJ-AT ?auto_85909 ?auto_85913 ) ( IN-CITY ?auto_85915 ?auto_85917 ) ( not ( = ?auto_85907 ?auto_85915 ) ) ( OBJ-AT ?auto_85910 ?auto_85915 ) ( TRUCK-AT ?auto_85914 ?auto_85907 ) ( not ( = ?auto_85910 ?auto_85909 ) ) ( not ( = ?auto_85913 ?auto_85915 ) ) ( not ( = ?auto_85910 ?auto_85908 ) ) ( not ( = ?auto_85909 ?auto_85908 ) ) ( not ( = ?auto_85916 ?auto_85913 ) ) ( not ( = ?auto_85916 ?auto_85915 ) ) ( not ( = ?auto_85910 ?auto_85912 ) ) ( not ( = ?auto_85909 ?auto_85912 ) ) ( not ( = ?auto_85908 ?auto_85912 ) ) ( not ( = ?auto_85918 ?auto_85916 ) ) ( not ( = ?auto_85918 ?auto_85913 ) ) ( not ( = ?auto_85918 ?auto_85915 ) ) ( not ( = ?auto_85910 ?auto_85911 ) ) ( not ( = ?auto_85909 ?auto_85911 ) ) ( not ( = ?auto_85908 ?auto_85911 ) ) ( not ( = ?auto_85912 ?auto_85911 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_85910 ?auto_85909 ?auto_85908 ?auto_85911 ?auto_85912 ?auto_85907 )
      ( DELIVER-5PKG-VERIFY ?auto_85908 ?auto_85909 ?auto_85910 ?auto_85911 ?auto_85912 ?auto_85907 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_86177 - OBJ
      ?auto_86178 - OBJ
      ?auto_86179 - OBJ
      ?auto_86180 - OBJ
      ?auto_86181 - OBJ
      ?auto_86176 - LOCATION
    )
    :vars
    (
      ?auto_86182 - LOCATION
      ?auto_86186 - CITY
      ?auto_86187 - LOCATION
      ?auto_86185 - LOCATION
      ?auto_86184 - LOCATION
      ?auto_86183 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_86182 ?auto_86186 ) ( IN-CITY ?auto_86176 ?auto_86186 ) ( not ( = ?auto_86176 ?auto_86182 ) ) ( OBJ-AT ?auto_86181 ?auto_86182 ) ( IN-CITY ?auto_86187 ?auto_86186 ) ( not ( = ?auto_86176 ?auto_86187 ) ) ( OBJ-AT ?auto_86179 ?auto_86187 ) ( IN-CITY ?auto_86185 ?auto_86186 ) ( not ( = ?auto_86176 ?auto_86185 ) ) ( OBJ-AT ?auto_86177 ?auto_86185 ) ( OBJ-AT ?auto_86178 ?auto_86182 ) ( IN-CITY ?auto_86184 ?auto_86186 ) ( not ( = ?auto_86176 ?auto_86184 ) ) ( OBJ-AT ?auto_86180 ?auto_86184 ) ( TRUCK-AT ?auto_86183 ?auto_86176 ) ( not ( = ?auto_86180 ?auto_86178 ) ) ( not ( = ?auto_86182 ?auto_86184 ) ) ( not ( = ?auto_86180 ?auto_86177 ) ) ( not ( = ?auto_86178 ?auto_86177 ) ) ( not ( = ?auto_86185 ?auto_86182 ) ) ( not ( = ?auto_86185 ?auto_86184 ) ) ( not ( = ?auto_86180 ?auto_86179 ) ) ( not ( = ?auto_86178 ?auto_86179 ) ) ( not ( = ?auto_86177 ?auto_86179 ) ) ( not ( = ?auto_86187 ?auto_86185 ) ) ( not ( = ?auto_86187 ?auto_86182 ) ) ( not ( = ?auto_86187 ?auto_86184 ) ) ( not ( = ?auto_86180 ?auto_86181 ) ) ( not ( = ?auto_86178 ?auto_86181 ) ) ( not ( = ?auto_86177 ?auto_86181 ) ) ( not ( = ?auto_86179 ?auto_86181 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_86180 ?auto_86178 ?auto_86177 ?auto_86181 ?auto_86179 ?auto_86176 )
      ( DELIVER-5PKG-VERIFY ?auto_86177 ?auto_86178 ?auto_86179 ?auto_86180 ?auto_86181 ?auto_86176 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_86228 - OBJ
      ?auto_86229 - OBJ
      ?auto_86230 - OBJ
      ?auto_86231 - OBJ
      ?auto_86232 - OBJ
      ?auto_86227 - LOCATION
    )
    :vars
    (
      ?auto_86233 - LOCATION
      ?auto_86237 - CITY
      ?auto_86238 - LOCATION
      ?auto_86236 - LOCATION
      ?auto_86235 - LOCATION
      ?auto_86234 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_86233 ?auto_86237 ) ( IN-CITY ?auto_86227 ?auto_86237 ) ( not ( = ?auto_86227 ?auto_86233 ) ) ( OBJ-AT ?auto_86231 ?auto_86233 ) ( IN-CITY ?auto_86238 ?auto_86237 ) ( not ( = ?auto_86227 ?auto_86238 ) ) ( OBJ-AT ?auto_86230 ?auto_86238 ) ( IN-CITY ?auto_86236 ?auto_86237 ) ( not ( = ?auto_86227 ?auto_86236 ) ) ( OBJ-AT ?auto_86228 ?auto_86236 ) ( OBJ-AT ?auto_86229 ?auto_86233 ) ( IN-CITY ?auto_86235 ?auto_86237 ) ( not ( = ?auto_86227 ?auto_86235 ) ) ( OBJ-AT ?auto_86232 ?auto_86235 ) ( TRUCK-AT ?auto_86234 ?auto_86227 ) ( not ( = ?auto_86232 ?auto_86229 ) ) ( not ( = ?auto_86233 ?auto_86235 ) ) ( not ( = ?auto_86232 ?auto_86228 ) ) ( not ( = ?auto_86229 ?auto_86228 ) ) ( not ( = ?auto_86236 ?auto_86233 ) ) ( not ( = ?auto_86236 ?auto_86235 ) ) ( not ( = ?auto_86232 ?auto_86230 ) ) ( not ( = ?auto_86229 ?auto_86230 ) ) ( not ( = ?auto_86228 ?auto_86230 ) ) ( not ( = ?auto_86238 ?auto_86236 ) ) ( not ( = ?auto_86238 ?auto_86233 ) ) ( not ( = ?auto_86238 ?auto_86235 ) ) ( not ( = ?auto_86232 ?auto_86231 ) ) ( not ( = ?auto_86229 ?auto_86231 ) ) ( not ( = ?auto_86228 ?auto_86231 ) ) ( not ( = ?auto_86230 ?auto_86231 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_86232 ?auto_86229 ?auto_86228 ?auto_86231 ?auto_86230 ?auto_86227 )
      ( DELIVER-5PKG-VERIFY ?auto_86228 ?auto_86229 ?auto_86230 ?auto_86231 ?auto_86232 ?auto_86227 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_86331 - OBJ
      ?auto_86332 - OBJ
      ?auto_86333 - OBJ
      ?auto_86334 - OBJ
      ?auto_86335 - OBJ
      ?auto_86330 - LOCATION
    )
    :vars
    (
      ?auto_86336 - LOCATION
      ?auto_86340 - CITY
      ?auto_86341 - LOCATION
      ?auto_86339 - LOCATION
      ?auto_86338 - LOCATION
      ?auto_86337 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_86336 ?auto_86340 ) ( IN-CITY ?auto_86330 ?auto_86340 ) ( not ( = ?auto_86330 ?auto_86336 ) ) ( OBJ-AT ?auto_86333 ?auto_86336 ) ( IN-CITY ?auto_86341 ?auto_86340 ) ( not ( = ?auto_86330 ?auto_86341 ) ) ( OBJ-AT ?auto_86335 ?auto_86341 ) ( IN-CITY ?auto_86339 ?auto_86340 ) ( not ( = ?auto_86330 ?auto_86339 ) ) ( OBJ-AT ?auto_86331 ?auto_86339 ) ( OBJ-AT ?auto_86332 ?auto_86336 ) ( IN-CITY ?auto_86338 ?auto_86340 ) ( not ( = ?auto_86330 ?auto_86338 ) ) ( OBJ-AT ?auto_86334 ?auto_86338 ) ( TRUCK-AT ?auto_86337 ?auto_86330 ) ( not ( = ?auto_86334 ?auto_86332 ) ) ( not ( = ?auto_86336 ?auto_86338 ) ) ( not ( = ?auto_86334 ?auto_86331 ) ) ( not ( = ?auto_86332 ?auto_86331 ) ) ( not ( = ?auto_86339 ?auto_86336 ) ) ( not ( = ?auto_86339 ?auto_86338 ) ) ( not ( = ?auto_86334 ?auto_86335 ) ) ( not ( = ?auto_86332 ?auto_86335 ) ) ( not ( = ?auto_86331 ?auto_86335 ) ) ( not ( = ?auto_86341 ?auto_86339 ) ) ( not ( = ?auto_86341 ?auto_86336 ) ) ( not ( = ?auto_86341 ?auto_86338 ) ) ( not ( = ?auto_86334 ?auto_86333 ) ) ( not ( = ?auto_86332 ?auto_86333 ) ) ( not ( = ?auto_86331 ?auto_86333 ) ) ( not ( = ?auto_86335 ?auto_86333 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_86334 ?auto_86332 ?auto_86331 ?auto_86333 ?auto_86335 ?auto_86330 )
      ( DELIVER-5PKG-VERIFY ?auto_86331 ?auto_86332 ?auto_86333 ?auto_86334 ?auto_86335 ?auto_86330 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_86492 - OBJ
      ?auto_86493 - OBJ
      ?auto_86494 - OBJ
      ?auto_86495 - OBJ
      ?auto_86496 - OBJ
      ?auto_86491 - LOCATION
    )
    :vars
    (
      ?auto_86497 - LOCATION
      ?auto_86501 - CITY
      ?auto_86502 - LOCATION
      ?auto_86500 - LOCATION
      ?auto_86499 - LOCATION
      ?auto_86498 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_86497 ?auto_86501 ) ( IN-CITY ?auto_86491 ?auto_86501 ) ( not ( = ?auto_86491 ?auto_86497 ) ) ( OBJ-AT ?auto_86494 ?auto_86497 ) ( IN-CITY ?auto_86502 ?auto_86501 ) ( not ( = ?auto_86491 ?auto_86502 ) ) ( OBJ-AT ?auto_86495 ?auto_86502 ) ( IN-CITY ?auto_86500 ?auto_86501 ) ( not ( = ?auto_86491 ?auto_86500 ) ) ( OBJ-AT ?auto_86492 ?auto_86500 ) ( OBJ-AT ?auto_86493 ?auto_86497 ) ( IN-CITY ?auto_86499 ?auto_86501 ) ( not ( = ?auto_86491 ?auto_86499 ) ) ( OBJ-AT ?auto_86496 ?auto_86499 ) ( TRUCK-AT ?auto_86498 ?auto_86491 ) ( not ( = ?auto_86496 ?auto_86493 ) ) ( not ( = ?auto_86497 ?auto_86499 ) ) ( not ( = ?auto_86496 ?auto_86492 ) ) ( not ( = ?auto_86493 ?auto_86492 ) ) ( not ( = ?auto_86500 ?auto_86497 ) ) ( not ( = ?auto_86500 ?auto_86499 ) ) ( not ( = ?auto_86496 ?auto_86495 ) ) ( not ( = ?auto_86493 ?auto_86495 ) ) ( not ( = ?auto_86492 ?auto_86495 ) ) ( not ( = ?auto_86502 ?auto_86500 ) ) ( not ( = ?auto_86502 ?auto_86497 ) ) ( not ( = ?auto_86502 ?auto_86499 ) ) ( not ( = ?auto_86496 ?auto_86494 ) ) ( not ( = ?auto_86493 ?auto_86494 ) ) ( not ( = ?auto_86492 ?auto_86494 ) ) ( not ( = ?auto_86495 ?auto_86494 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_86496 ?auto_86493 ?auto_86492 ?auto_86494 ?auto_86495 ?auto_86491 )
      ( DELIVER-5PKG-VERIFY ?auto_86492 ?auto_86493 ?auto_86494 ?auto_86495 ?auto_86496 ?auto_86491 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_87480 - OBJ
      ?auto_87481 - OBJ
      ?auto_87482 - OBJ
      ?auto_87483 - OBJ
      ?auto_87484 - OBJ
      ?auto_87479 - LOCATION
    )
    :vars
    (
      ?auto_87485 - LOCATION
      ?auto_87489 - CITY
      ?auto_87490 - LOCATION
      ?auto_87488 - LOCATION
      ?auto_87487 - LOCATION
      ?auto_87486 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_87485 ?auto_87489 ) ( IN-CITY ?auto_87479 ?auto_87489 ) ( not ( = ?auto_87479 ?auto_87485 ) ) ( OBJ-AT ?auto_87484 ?auto_87485 ) ( IN-CITY ?auto_87490 ?auto_87489 ) ( not ( = ?auto_87479 ?auto_87490 ) ) ( OBJ-AT ?auto_87481 ?auto_87490 ) ( IN-CITY ?auto_87488 ?auto_87489 ) ( not ( = ?auto_87479 ?auto_87488 ) ) ( OBJ-AT ?auto_87480 ?auto_87488 ) ( OBJ-AT ?auto_87483 ?auto_87485 ) ( IN-CITY ?auto_87487 ?auto_87489 ) ( not ( = ?auto_87479 ?auto_87487 ) ) ( OBJ-AT ?auto_87482 ?auto_87487 ) ( TRUCK-AT ?auto_87486 ?auto_87479 ) ( not ( = ?auto_87482 ?auto_87483 ) ) ( not ( = ?auto_87485 ?auto_87487 ) ) ( not ( = ?auto_87482 ?auto_87480 ) ) ( not ( = ?auto_87483 ?auto_87480 ) ) ( not ( = ?auto_87488 ?auto_87485 ) ) ( not ( = ?auto_87488 ?auto_87487 ) ) ( not ( = ?auto_87482 ?auto_87481 ) ) ( not ( = ?auto_87483 ?auto_87481 ) ) ( not ( = ?auto_87480 ?auto_87481 ) ) ( not ( = ?auto_87490 ?auto_87488 ) ) ( not ( = ?auto_87490 ?auto_87485 ) ) ( not ( = ?auto_87490 ?auto_87487 ) ) ( not ( = ?auto_87482 ?auto_87484 ) ) ( not ( = ?auto_87483 ?auto_87484 ) ) ( not ( = ?auto_87480 ?auto_87484 ) ) ( not ( = ?auto_87481 ?auto_87484 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_87482 ?auto_87483 ?auto_87480 ?auto_87484 ?auto_87481 ?auto_87479 )
      ( DELIVER-5PKG-VERIFY ?auto_87480 ?auto_87481 ?auto_87482 ?auto_87483 ?auto_87484 ?auto_87479 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_87531 - OBJ
      ?auto_87532 - OBJ
      ?auto_87533 - OBJ
      ?auto_87534 - OBJ
      ?auto_87535 - OBJ
      ?auto_87530 - LOCATION
    )
    :vars
    (
      ?auto_87536 - LOCATION
      ?auto_87540 - CITY
      ?auto_87541 - LOCATION
      ?auto_87539 - LOCATION
      ?auto_87538 - LOCATION
      ?auto_87537 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_87536 ?auto_87540 ) ( IN-CITY ?auto_87530 ?auto_87540 ) ( not ( = ?auto_87530 ?auto_87536 ) ) ( OBJ-AT ?auto_87534 ?auto_87536 ) ( IN-CITY ?auto_87541 ?auto_87540 ) ( not ( = ?auto_87530 ?auto_87541 ) ) ( OBJ-AT ?auto_87532 ?auto_87541 ) ( IN-CITY ?auto_87539 ?auto_87540 ) ( not ( = ?auto_87530 ?auto_87539 ) ) ( OBJ-AT ?auto_87531 ?auto_87539 ) ( OBJ-AT ?auto_87535 ?auto_87536 ) ( IN-CITY ?auto_87538 ?auto_87540 ) ( not ( = ?auto_87530 ?auto_87538 ) ) ( OBJ-AT ?auto_87533 ?auto_87538 ) ( TRUCK-AT ?auto_87537 ?auto_87530 ) ( not ( = ?auto_87533 ?auto_87535 ) ) ( not ( = ?auto_87536 ?auto_87538 ) ) ( not ( = ?auto_87533 ?auto_87531 ) ) ( not ( = ?auto_87535 ?auto_87531 ) ) ( not ( = ?auto_87539 ?auto_87536 ) ) ( not ( = ?auto_87539 ?auto_87538 ) ) ( not ( = ?auto_87533 ?auto_87532 ) ) ( not ( = ?auto_87535 ?auto_87532 ) ) ( not ( = ?auto_87531 ?auto_87532 ) ) ( not ( = ?auto_87541 ?auto_87539 ) ) ( not ( = ?auto_87541 ?auto_87536 ) ) ( not ( = ?auto_87541 ?auto_87538 ) ) ( not ( = ?auto_87533 ?auto_87534 ) ) ( not ( = ?auto_87535 ?auto_87534 ) ) ( not ( = ?auto_87531 ?auto_87534 ) ) ( not ( = ?auto_87532 ?auto_87534 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_87533 ?auto_87535 ?auto_87531 ?auto_87534 ?auto_87532 ?auto_87530 )
      ( DELIVER-5PKG-VERIFY ?auto_87531 ?auto_87532 ?auto_87533 ?auto_87534 ?auto_87535 ?auto_87530 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_87582 - OBJ
      ?auto_87583 - OBJ
      ?auto_87584 - OBJ
      ?auto_87585 - OBJ
      ?auto_87586 - OBJ
      ?auto_87581 - LOCATION
    )
    :vars
    (
      ?auto_87587 - LOCATION
      ?auto_87591 - CITY
      ?auto_87592 - LOCATION
      ?auto_87590 - LOCATION
      ?auto_87589 - LOCATION
      ?auto_87588 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_87587 ?auto_87591 ) ( IN-CITY ?auto_87581 ?auto_87591 ) ( not ( = ?auto_87581 ?auto_87587 ) ) ( OBJ-AT ?auto_87586 ?auto_87587 ) ( IN-CITY ?auto_87592 ?auto_87591 ) ( not ( = ?auto_87581 ?auto_87592 ) ) ( OBJ-AT ?auto_87583 ?auto_87592 ) ( IN-CITY ?auto_87590 ?auto_87591 ) ( not ( = ?auto_87581 ?auto_87590 ) ) ( OBJ-AT ?auto_87582 ?auto_87590 ) ( OBJ-AT ?auto_87584 ?auto_87587 ) ( IN-CITY ?auto_87589 ?auto_87591 ) ( not ( = ?auto_87581 ?auto_87589 ) ) ( OBJ-AT ?auto_87585 ?auto_87589 ) ( TRUCK-AT ?auto_87588 ?auto_87581 ) ( not ( = ?auto_87585 ?auto_87584 ) ) ( not ( = ?auto_87587 ?auto_87589 ) ) ( not ( = ?auto_87585 ?auto_87582 ) ) ( not ( = ?auto_87584 ?auto_87582 ) ) ( not ( = ?auto_87590 ?auto_87587 ) ) ( not ( = ?auto_87590 ?auto_87589 ) ) ( not ( = ?auto_87585 ?auto_87583 ) ) ( not ( = ?auto_87584 ?auto_87583 ) ) ( not ( = ?auto_87582 ?auto_87583 ) ) ( not ( = ?auto_87592 ?auto_87590 ) ) ( not ( = ?auto_87592 ?auto_87587 ) ) ( not ( = ?auto_87592 ?auto_87589 ) ) ( not ( = ?auto_87585 ?auto_87586 ) ) ( not ( = ?auto_87584 ?auto_87586 ) ) ( not ( = ?auto_87582 ?auto_87586 ) ) ( not ( = ?auto_87583 ?auto_87586 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_87585 ?auto_87584 ?auto_87582 ?auto_87586 ?auto_87583 ?auto_87581 )
      ( DELIVER-5PKG-VERIFY ?auto_87582 ?auto_87583 ?auto_87584 ?auto_87585 ?auto_87586 ?auto_87581 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_87633 - OBJ
      ?auto_87634 - OBJ
      ?auto_87635 - OBJ
      ?auto_87636 - OBJ
      ?auto_87637 - OBJ
      ?auto_87632 - LOCATION
    )
    :vars
    (
      ?auto_87638 - LOCATION
      ?auto_87642 - CITY
      ?auto_87643 - LOCATION
      ?auto_87641 - LOCATION
      ?auto_87640 - LOCATION
      ?auto_87639 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_87638 ?auto_87642 ) ( IN-CITY ?auto_87632 ?auto_87642 ) ( not ( = ?auto_87632 ?auto_87638 ) ) ( OBJ-AT ?auto_87636 ?auto_87638 ) ( IN-CITY ?auto_87643 ?auto_87642 ) ( not ( = ?auto_87632 ?auto_87643 ) ) ( OBJ-AT ?auto_87634 ?auto_87643 ) ( IN-CITY ?auto_87641 ?auto_87642 ) ( not ( = ?auto_87632 ?auto_87641 ) ) ( OBJ-AT ?auto_87633 ?auto_87641 ) ( OBJ-AT ?auto_87635 ?auto_87638 ) ( IN-CITY ?auto_87640 ?auto_87642 ) ( not ( = ?auto_87632 ?auto_87640 ) ) ( OBJ-AT ?auto_87637 ?auto_87640 ) ( TRUCK-AT ?auto_87639 ?auto_87632 ) ( not ( = ?auto_87637 ?auto_87635 ) ) ( not ( = ?auto_87638 ?auto_87640 ) ) ( not ( = ?auto_87637 ?auto_87633 ) ) ( not ( = ?auto_87635 ?auto_87633 ) ) ( not ( = ?auto_87641 ?auto_87638 ) ) ( not ( = ?auto_87641 ?auto_87640 ) ) ( not ( = ?auto_87637 ?auto_87634 ) ) ( not ( = ?auto_87635 ?auto_87634 ) ) ( not ( = ?auto_87633 ?auto_87634 ) ) ( not ( = ?auto_87643 ?auto_87641 ) ) ( not ( = ?auto_87643 ?auto_87638 ) ) ( not ( = ?auto_87643 ?auto_87640 ) ) ( not ( = ?auto_87637 ?auto_87636 ) ) ( not ( = ?auto_87635 ?auto_87636 ) ) ( not ( = ?auto_87633 ?auto_87636 ) ) ( not ( = ?auto_87634 ?auto_87636 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_87637 ?auto_87635 ?auto_87633 ?auto_87636 ?auto_87634 ?auto_87632 )
      ( DELIVER-5PKG-VERIFY ?auto_87633 ?auto_87634 ?auto_87635 ?auto_87636 ?auto_87637 ?auto_87632 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_87954 - OBJ
      ?auto_87955 - OBJ
      ?auto_87956 - OBJ
      ?auto_87957 - OBJ
      ?auto_87958 - OBJ
      ?auto_87953 - LOCATION
    )
    :vars
    (
      ?auto_87959 - LOCATION
      ?auto_87963 - CITY
      ?auto_87964 - LOCATION
      ?auto_87962 - LOCATION
      ?auto_87961 - LOCATION
      ?auto_87960 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_87959 ?auto_87963 ) ( IN-CITY ?auto_87953 ?auto_87963 ) ( not ( = ?auto_87953 ?auto_87959 ) ) ( OBJ-AT ?auto_87956 ?auto_87959 ) ( IN-CITY ?auto_87964 ?auto_87963 ) ( not ( = ?auto_87953 ?auto_87964 ) ) ( OBJ-AT ?auto_87955 ?auto_87964 ) ( IN-CITY ?auto_87962 ?auto_87963 ) ( not ( = ?auto_87953 ?auto_87962 ) ) ( OBJ-AT ?auto_87954 ?auto_87962 ) ( OBJ-AT ?auto_87958 ?auto_87959 ) ( IN-CITY ?auto_87961 ?auto_87963 ) ( not ( = ?auto_87953 ?auto_87961 ) ) ( OBJ-AT ?auto_87957 ?auto_87961 ) ( TRUCK-AT ?auto_87960 ?auto_87953 ) ( not ( = ?auto_87957 ?auto_87958 ) ) ( not ( = ?auto_87959 ?auto_87961 ) ) ( not ( = ?auto_87957 ?auto_87954 ) ) ( not ( = ?auto_87958 ?auto_87954 ) ) ( not ( = ?auto_87962 ?auto_87959 ) ) ( not ( = ?auto_87962 ?auto_87961 ) ) ( not ( = ?auto_87957 ?auto_87955 ) ) ( not ( = ?auto_87958 ?auto_87955 ) ) ( not ( = ?auto_87954 ?auto_87955 ) ) ( not ( = ?auto_87964 ?auto_87962 ) ) ( not ( = ?auto_87964 ?auto_87959 ) ) ( not ( = ?auto_87964 ?auto_87961 ) ) ( not ( = ?auto_87957 ?auto_87956 ) ) ( not ( = ?auto_87958 ?auto_87956 ) ) ( not ( = ?auto_87954 ?auto_87956 ) ) ( not ( = ?auto_87955 ?auto_87956 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_87957 ?auto_87958 ?auto_87954 ?auto_87956 ?auto_87955 ?auto_87953 )
      ( DELIVER-5PKG-VERIFY ?auto_87954 ?auto_87955 ?auto_87956 ?auto_87957 ?auto_87958 ?auto_87953 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_88005 - OBJ
      ?auto_88006 - OBJ
      ?auto_88007 - OBJ
      ?auto_88008 - OBJ
      ?auto_88009 - OBJ
      ?auto_88004 - LOCATION
    )
    :vars
    (
      ?auto_88010 - LOCATION
      ?auto_88014 - CITY
      ?auto_88015 - LOCATION
      ?auto_88013 - LOCATION
      ?auto_88012 - LOCATION
      ?auto_88011 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_88010 ?auto_88014 ) ( IN-CITY ?auto_88004 ?auto_88014 ) ( not ( = ?auto_88004 ?auto_88010 ) ) ( OBJ-AT ?auto_88007 ?auto_88010 ) ( IN-CITY ?auto_88015 ?auto_88014 ) ( not ( = ?auto_88004 ?auto_88015 ) ) ( OBJ-AT ?auto_88006 ?auto_88015 ) ( IN-CITY ?auto_88013 ?auto_88014 ) ( not ( = ?auto_88004 ?auto_88013 ) ) ( OBJ-AT ?auto_88005 ?auto_88013 ) ( OBJ-AT ?auto_88008 ?auto_88010 ) ( IN-CITY ?auto_88012 ?auto_88014 ) ( not ( = ?auto_88004 ?auto_88012 ) ) ( OBJ-AT ?auto_88009 ?auto_88012 ) ( TRUCK-AT ?auto_88011 ?auto_88004 ) ( not ( = ?auto_88009 ?auto_88008 ) ) ( not ( = ?auto_88010 ?auto_88012 ) ) ( not ( = ?auto_88009 ?auto_88005 ) ) ( not ( = ?auto_88008 ?auto_88005 ) ) ( not ( = ?auto_88013 ?auto_88010 ) ) ( not ( = ?auto_88013 ?auto_88012 ) ) ( not ( = ?auto_88009 ?auto_88006 ) ) ( not ( = ?auto_88008 ?auto_88006 ) ) ( not ( = ?auto_88005 ?auto_88006 ) ) ( not ( = ?auto_88015 ?auto_88013 ) ) ( not ( = ?auto_88015 ?auto_88010 ) ) ( not ( = ?auto_88015 ?auto_88012 ) ) ( not ( = ?auto_88009 ?auto_88007 ) ) ( not ( = ?auto_88008 ?auto_88007 ) ) ( not ( = ?auto_88005 ?auto_88007 ) ) ( not ( = ?auto_88006 ?auto_88007 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_88009 ?auto_88008 ?auto_88005 ?auto_88007 ?auto_88006 ?auto_88004 )
      ( DELIVER-5PKG-VERIFY ?auto_88005 ?auto_88006 ?auto_88007 ?auto_88008 ?auto_88009 ?auto_88004 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_88380 - OBJ
      ?auto_88381 - OBJ
      ?auto_88382 - OBJ
      ?auto_88383 - OBJ
      ?auto_88384 - OBJ
      ?auto_88379 - LOCATION
    )
    :vars
    (
      ?auto_88385 - LOCATION
      ?auto_88389 - CITY
      ?auto_88390 - LOCATION
      ?auto_88388 - LOCATION
      ?auto_88387 - LOCATION
      ?auto_88386 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_88385 ?auto_88389 ) ( IN-CITY ?auto_88379 ?auto_88389 ) ( not ( = ?auto_88379 ?auto_88385 ) ) ( OBJ-AT ?auto_88381 ?auto_88385 ) ( IN-CITY ?auto_88390 ?auto_88389 ) ( not ( = ?auto_88379 ?auto_88390 ) ) ( OBJ-AT ?auto_88384 ?auto_88390 ) ( IN-CITY ?auto_88388 ?auto_88389 ) ( not ( = ?auto_88379 ?auto_88388 ) ) ( OBJ-AT ?auto_88380 ?auto_88388 ) ( OBJ-AT ?auto_88383 ?auto_88385 ) ( IN-CITY ?auto_88387 ?auto_88389 ) ( not ( = ?auto_88379 ?auto_88387 ) ) ( OBJ-AT ?auto_88382 ?auto_88387 ) ( TRUCK-AT ?auto_88386 ?auto_88379 ) ( not ( = ?auto_88382 ?auto_88383 ) ) ( not ( = ?auto_88385 ?auto_88387 ) ) ( not ( = ?auto_88382 ?auto_88380 ) ) ( not ( = ?auto_88383 ?auto_88380 ) ) ( not ( = ?auto_88388 ?auto_88385 ) ) ( not ( = ?auto_88388 ?auto_88387 ) ) ( not ( = ?auto_88382 ?auto_88384 ) ) ( not ( = ?auto_88383 ?auto_88384 ) ) ( not ( = ?auto_88380 ?auto_88384 ) ) ( not ( = ?auto_88390 ?auto_88388 ) ) ( not ( = ?auto_88390 ?auto_88385 ) ) ( not ( = ?auto_88390 ?auto_88387 ) ) ( not ( = ?auto_88382 ?auto_88381 ) ) ( not ( = ?auto_88383 ?auto_88381 ) ) ( not ( = ?auto_88380 ?auto_88381 ) ) ( not ( = ?auto_88384 ?auto_88381 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_88382 ?auto_88383 ?auto_88380 ?auto_88381 ?auto_88384 ?auto_88379 )
      ( DELIVER-5PKG-VERIFY ?auto_88380 ?auto_88381 ?auto_88382 ?auto_88383 ?auto_88384 ?auto_88379 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_88486 - OBJ
      ?auto_88487 - OBJ
      ?auto_88488 - OBJ
      ?auto_88489 - OBJ
      ?auto_88490 - OBJ
      ?auto_88485 - LOCATION
    )
    :vars
    (
      ?auto_88491 - LOCATION
      ?auto_88495 - CITY
      ?auto_88496 - LOCATION
      ?auto_88494 - LOCATION
      ?auto_88493 - LOCATION
      ?auto_88492 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_88491 ?auto_88495 ) ( IN-CITY ?auto_88485 ?auto_88495 ) ( not ( = ?auto_88485 ?auto_88491 ) ) ( OBJ-AT ?auto_88487 ?auto_88491 ) ( IN-CITY ?auto_88496 ?auto_88495 ) ( not ( = ?auto_88485 ?auto_88496 ) ) ( OBJ-AT ?auto_88489 ?auto_88496 ) ( IN-CITY ?auto_88494 ?auto_88495 ) ( not ( = ?auto_88485 ?auto_88494 ) ) ( OBJ-AT ?auto_88486 ?auto_88494 ) ( OBJ-AT ?auto_88490 ?auto_88491 ) ( IN-CITY ?auto_88493 ?auto_88495 ) ( not ( = ?auto_88485 ?auto_88493 ) ) ( OBJ-AT ?auto_88488 ?auto_88493 ) ( TRUCK-AT ?auto_88492 ?auto_88485 ) ( not ( = ?auto_88488 ?auto_88490 ) ) ( not ( = ?auto_88491 ?auto_88493 ) ) ( not ( = ?auto_88488 ?auto_88486 ) ) ( not ( = ?auto_88490 ?auto_88486 ) ) ( not ( = ?auto_88494 ?auto_88491 ) ) ( not ( = ?auto_88494 ?auto_88493 ) ) ( not ( = ?auto_88488 ?auto_88489 ) ) ( not ( = ?auto_88490 ?auto_88489 ) ) ( not ( = ?auto_88486 ?auto_88489 ) ) ( not ( = ?auto_88496 ?auto_88494 ) ) ( not ( = ?auto_88496 ?auto_88491 ) ) ( not ( = ?auto_88496 ?auto_88493 ) ) ( not ( = ?auto_88488 ?auto_88487 ) ) ( not ( = ?auto_88490 ?auto_88487 ) ) ( not ( = ?auto_88486 ?auto_88487 ) ) ( not ( = ?auto_88489 ?auto_88487 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_88488 ?auto_88490 ?auto_88486 ?auto_88487 ?auto_88489 ?auto_88485 )
      ( DELIVER-5PKG-VERIFY ?auto_88486 ?auto_88487 ?auto_88488 ?auto_88489 ?auto_88490 ?auto_88485 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_88644 - OBJ
      ?auto_88645 - OBJ
      ?auto_88646 - OBJ
      ?auto_88647 - OBJ
      ?auto_88648 - OBJ
      ?auto_88643 - LOCATION
    )
    :vars
    (
      ?auto_88649 - LOCATION
      ?auto_88653 - CITY
      ?auto_88654 - LOCATION
      ?auto_88652 - LOCATION
      ?auto_88651 - LOCATION
      ?auto_88650 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_88649 ?auto_88653 ) ( IN-CITY ?auto_88643 ?auto_88653 ) ( not ( = ?auto_88643 ?auto_88649 ) ) ( OBJ-AT ?auto_88645 ?auto_88649 ) ( IN-CITY ?auto_88654 ?auto_88653 ) ( not ( = ?auto_88643 ?auto_88654 ) ) ( OBJ-AT ?auto_88648 ?auto_88654 ) ( IN-CITY ?auto_88652 ?auto_88653 ) ( not ( = ?auto_88643 ?auto_88652 ) ) ( OBJ-AT ?auto_88644 ?auto_88652 ) ( OBJ-AT ?auto_88646 ?auto_88649 ) ( IN-CITY ?auto_88651 ?auto_88653 ) ( not ( = ?auto_88643 ?auto_88651 ) ) ( OBJ-AT ?auto_88647 ?auto_88651 ) ( TRUCK-AT ?auto_88650 ?auto_88643 ) ( not ( = ?auto_88647 ?auto_88646 ) ) ( not ( = ?auto_88649 ?auto_88651 ) ) ( not ( = ?auto_88647 ?auto_88644 ) ) ( not ( = ?auto_88646 ?auto_88644 ) ) ( not ( = ?auto_88652 ?auto_88649 ) ) ( not ( = ?auto_88652 ?auto_88651 ) ) ( not ( = ?auto_88647 ?auto_88648 ) ) ( not ( = ?auto_88646 ?auto_88648 ) ) ( not ( = ?auto_88644 ?auto_88648 ) ) ( not ( = ?auto_88654 ?auto_88652 ) ) ( not ( = ?auto_88654 ?auto_88649 ) ) ( not ( = ?auto_88654 ?auto_88651 ) ) ( not ( = ?auto_88647 ?auto_88645 ) ) ( not ( = ?auto_88646 ?auto_88645 ) ) ( not ( = ?auto_88644 ?auto_88645 ) ) ( not ( = ?auto_88648 ?auto_88645 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_88647 ?auto_88646 ?auto_88644 ?auto_88645 ?auto_88648 ?auto_88643 )
      ( DELIVER-5PKG-VERIFY ?auto_88644 ?auto_88645 ?auto_88646 ?auto_88647 ?auto_88648 ?auto_88643 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_88805 - OBJ
      ?auto_88806 - OBJ
      ?auto_88807 - OBJ
      ?auto_88808 - OBJ
      ?auto_88809 - OBJ
      ?auto_88804 - LOCATION
    )
    :vars
    (
      ?auto_88810 - LOCATION
      ?auto_88814 - CITY
      ?auto_88815 - LOCATION
      ?auto_88813 - LOCATION
      ?auto_88812 - LOCATION
      ?auto_88811 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_88810 ?auto_88814 ) ( IN-CITY ?auto_88804 ?auto_88814 ) ( not ( = ?auto_88804 ?auto_88810 ) ) ( OBJ-AT ?auto_88806 ?auto_88810 ) ( IN-CITY ?auto_88815 ?auto_88814 ) ( not ( = ?auto_88804 ?auto_88815 ) ) ( OBJ-AT ?auto_88808 ?auto_88815 ) ( IN-CITY ?auto_88813 ?auto_88814 ) ( not ( = ?auto_88804 ?auto_88813 ) ) ( OBJ-AT ?auto_88805 ?auto_88813 ) ( OBJ-AT ?auto_88807 ?auto_88810 ) ( IN-CITY ?auto_88812 ?auto_88814 ) ( not ( = ?auto_88804 ?auto_88812 ) ) ( OBJ-AT ?auto_88809 ?auto_88812 ) ( TRUCK-AT ?auto_88811 ?auto_88804 ) ( not ( = ?auto_88809 ?auto_88807 ) ) ( not ( = ?auto_88810 ?auto_88812 ) ) ( not ( = ?auto_88809 ?auto_88805 ) ) ( not ( = ?auto_88807 ?auto_88805 ) ) ( not ( = ?auto_88813 ?auto_88810 ) ) ( not ( = ?auto_88813 ?auto_88812 ) ) ( not ( = ?auto_88809 ?auto_88808 ) ) ( not ( = ?auto_88807 ?auto_88808 ) ) ( not ( = ?auto_88805 ?auto_88808 ) ) ( not ( = ?auto_88815 ?auto_88813 ) ) ( not ( = ?auto_88815 ?auto_88810 ) ) ( not ( = ?auto_88815 ?auto_88812 ) ) ( not ( = ?auto_88809 ?auto_88806 ) ) ( not ( = ?auto_88807 ?auto_88806 ) ) ( not ( = ?auto_88805 ?auto_88806 ) ) ( not ( = ?auto_88808 ?auto_88806 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_88809 ?auto_88807 ?auto_88805 ?auto_88806 ?auto_88808 ?auto_88804 )
      ( DELIVER-5PKG-VERIFY ?auto_88805 ?auto_88806 ?auto_88807 ?auto_88808 ?auto_88809 ?auto_88804 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_89298 - OBJ
      ?auto_89299 - OBJ
      ?auto_89300 - OBJ
      ?auto_89301 - OBJ
      ?auto_89302 - OBJ
      ?auto_89297 - LOCATION
    )
    :vars
    (
      ?auto_89303 - LOCATION
      ?auto_89307 - CITY
      ?auto_89308 - LOCATION
      ?auto_89306 - LOCATION
      ?auto_89305 - LOCATION
      ?auto_89304 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_89303 ?auto_89307 ) ( IN-CITY ?auto_89297 ?auto_89307 ) ( not ( = ?auto_89297 ?auto_89303 ) ) ( OBJ-AT ?auto_89299 ?auto_89303 ) ( IN-CITY ?auto_89308 ?auto_89307 ) ( not ( = ?auto_89297 ?auto_89308 ) ) ( OBJ-AT ?auto_89300 ?auto_89308 ) ( IN-CITY ?auto_89306 ?auto_89307 ) ( not ( = ?auto_89297 ?auto_89306 ) ) ( OBJ-AT ?auto_89298 ?auto_89306 ) ( OBJ-AT ?auto_89302 ?auto_89303 ) ( IN-CITY ?auto_89305 ?auto_89307 ) ( not ( = ?auto_89297 ?auto_89305 ) ) ( OBJ-AT ?auto_89301 ?auto_89305 ) ( TRUCK-AT ?auto_89304 ?auto_89297 ) ( not ( = ?auto_89301 ?auto_89302 ) ) ( not ( = ?auto_89303 ?auto_89305 ) ) ( not ( = ?auto_89301 ?auto_89298 ) ) ( not ( = ?auto_89302 ?auto_89298 ) ) ( not ( = ?auto_89306 ?auto_89303 ) ) ( not ( = ?auto_89306 ?auto_89305 ) ) ( not ( = ?auto_89301 ?auto_89300 ) ) ( not ( = ?auto_89302 ?auto_89300 ) ) ( not ( = ?auto_89298 ?auto_89300 ) ) ( not ( = ?auto_89308 ?auto_89306 ) ) ( not ( = ?auto_89308 ?auto_89303 ) ) ( not ( = ?auto_89308 ?auto_89305 ) ) ( not ( = ?auto_89301 ?auto_89299 ) ) ( not ( = ?auto_89302 ?auto_89299 ) ) ( not ( = ?auto_89298 ?auto_89299 ) ) ( not ( = ?auto_89300 ?auto_89299 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_89301 ?auto_89302 ?auto_89298 ?auto_89299 ?auto_89300 ?auto_89297 )
      ( DELIVER-5PKG-VERIFY ?auto_89298 ?auto_89299 ?auto_89300 ?auto_89301 ?auto_89302 ?auto_89297 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_89349 - OBJ
      ?auto_89350 - OBJ
      ?auto_89351 - OBJ
      ?auto_89352 - OBJ
      ?auto_89353 - OBJ
      ?auto_89348 - LOCATION
    )
    :vars
    (
      ?auto_89354 - LOCATION
      ?auto_89358 - CITY
      ?auto_89359 - LOCATION
      ?auto_89357 - LOCATION
      ?auto_89356 - LOCATION
      ?auto_89355 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_89354 ?auto_89358 ) ( IN-CITY ?auto_89348 ?auto_89358 ) ( not ( = ?auto_89348 ?auto_89354 ) ) ( OBJ-AT ?auto_89350 ?auto_89354 ) ( IN-CITY ?auto_89359 ?auto_89358 ) ( not ( = ?auto_89348 ?auto_89359 ) ) ( OBJ-AT ?auto_89351 ?auto_89359 ) ( IN-CITY ?auto_89357 ?auto_89358 ) ( not ( = ?auto_89348 ?auto_89357 ) ) ( OBJ-AT ?auto_89349 ?auto_89357 ) ( OBJ-AT ?auto_89352 ?auto_89354 ) ( IN-CITY ?auto_89356 ?auto_89358 ) ( not ( = ?auto_89348 ?auto_89356 ) ) ( OBJ-AT ?auto_89353 ?auto_89356 ) ( TRUCK-AT ?auto_89355 ?auto_89348 ) ( not ( = ?auto_89353 ?auto_89352 ) ) ( not ( = ?auto_89354 ?auto_89356 ) ) ( not ( = ?auto_89353 ?auto_89349 ) ) ( not ( = ?auto_89352 ?auto_89349 ) ) ( not ( = ?auto_89357 ?auto_89354 ) ) ( not ( = ?auto_89357 ?auto_89356 ) ) ( not ( = ?auto_89353 ?auto_89351 ) ) ( not ( = ?auto_89352 ?auto_89351 ) ) ( not ( = ?auto_89349 ?auto_89351 ) ) ( not ( = ?auto_89359 ?auto_89357 ) ) ( not ( = ?auto_89359 ?auto_89354 ) ) ( not ( = ?auto_89359 ?auto_89356 ) ) ( not ( = ?auto_89353 ?auto_89350 ) ) ( not ( = ?auto_89352 ?auto_89350 ) ) ( not ( = ?auto_89349 ?auto_89350 ) ) ( not ( = ?auto_89351 ?auto_89350 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_89353 ?auto_89352 ?auto_89349 ?auto_89350 ?auto_89351 ?auto_89348 )
      ( DELIVER-5PKG-VERIFY ?auto_89349 ?auto_89350 ?auto_89351 ?auto_89352 ?auto_89353 ?auto_89348 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_90113 - OBJ
      ?auto_90114 - OBJ
      ?auto_90115 - OBJ
      ?auto_90116 - OBJ
      ?auto_90117 - OBJ
      ?auto_90112 - LOCATION
    )
    :vars
    (
      ?auto_90118 - LOCATION
      ?auto_90122 - CITY
      ?auto_90123 - LOCATION
      ?auto_90121 - LOCATION
      ?auto_90120 - LOCATION
      ?auto_90119 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_90118 ?auto_90122 ) ( IN-CITY ?auto_90112 ?auto_90122 ) ( not ( = ?auto_90112 ?auto_90118 ) ) ( OBJ-AT ?auto_90117 ?auto_90118 ) ( IN-CITY ?auto_90123 ?auto_90122 ) ( not ( = ?auto_90112 ?auto_90123 ) ) ( OBJ-AT ?auto_90113 ?auto_90123 ) ( IN-CITY ?auto_90121 ?auto_90122 ) ( not ( = ?auto_90112 ?auto_90121 ) ) ( OBJ-AT ?auto_90116 ?auto_90121 ) ( OBJ-AT ?auto_90115 ?auto_90118 ) ( IN-CITY ?auto_90120 ?auto_90122 ) ( not ( = ?auto_90112 ?auto_90120 ) ) ( OBJ-AT ?auto_90114 ?auto_90120 ) ( TRUCK-AT ?auto_90119 ?auto_90112 ) ( not ( = ?auto_90114 ?auto_90115 ) ) ( not ( = ?auto_90118 ?auto_90120 ) ) ( not ( = ?auto_90114 ?auto_90116 ) ) ( not ( = ?auto_90115 ?auto_90116 ) ) ( not ( = ?auto_90121 ?auto_90118 ) ) ( not ( = ?auto_90121 ?auto_90120 ) ) ( not ( = ?auto_90114 ?auto_90113 ) ) ( not ( = ?auto_90115 ?auto_90113 ) ) ( not ( = ?auto_90116 ?auto_90113 ) ) ( not ( = ?auto_90123 ?auto_90121 ) ) ( not ( = ?auto_90123 ?auto_90118 ) ) ( not ( = ?auto_90123 ?auto_90120 ) ) ( not ( = ?auto_90114 ?auto_90117 ) ) ( not ( = ?auto_90115 ?auto_90117 ) ) ( not ( = ?auto_90116 ?auto_90117 ) ) ( not ( = ?auto_90113 ?auto_90117 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_90114 ?auto_90115 ?auto_90116 ?auto_90117 ?auto_90113 ?auto_90112 )
      ( DELIVER-5PKG-VERIFY ?auto_90113 ?auto_90114 ?auto_90115 ?auto_90116 ?auto_90117 ?auto_90112 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_90164 - OBJ
      ?auto_90165 - OBJ
      ?auto_90166 - OBJ
      ?auto_90167 - OBJ
      ?auto_90168 - OBJ
      ?auto_90163 - LOCATION
    )
    :vars
    (
      ?auto_90169 - LOCATION
      ?auto_90173 - CITY
      ?auto_90174 - LOCATION
      ?auto_90172 - LOCATION
      ?auto_90171 - LOCATION
      ?auto_90170 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_90169 ?auto_90173 ) ( IN-CITY ?auto_90163 ?auto_90173 ) ( not ( = ?auto_90163 ?auto_90169 ) ) ( OBJ-AT ?auto_90167 ?auto_90169 ) ( IN-CITY ?auto_90174 ?auto_90173 ) ( not ( = ?auto_90163 ?auto_90174 ) ) ( OBJ-AT ?auto_90164 ?auto_90174 ) ( IN-CITY ?auto_90172 ?auto_90173 ) ( not ( = ?auto_90163 ?auto_90172 ) ) ( OBJ-AT ?auto_90168 ?auto_90172 ) ( OBJ-AT ?auto_90166 ?auto_90169 ) ( IN-CITY ?auto_90171 ?auto_90173 ) ( not ( = ?auto_90163 ?auto_90171 ) ) ( OBJ-AT ?auto_90165 ?auto_90171 ) ( TRUCK-AT ?auto_90170 ?auto_90163 ) ( not ( = ?auto_90165 ?auto_90166 ) ) ( not ( = ?auto_90169 ?auto_90171 ) ) ( not ( = ?auto_90165 ?auto_90168 ) ) ( not ( = ?auto_90166 ?auto_90168 ) ) ( not ( = ?auto_90172 ?auto_90169 ) ) ( not ( = ?auto_90172 ?auto_90171 ) ) ( not ( = ?auto_90165 ?auto_90164 ) ) ( not ( = ?auto_90166 ?auto_90164 ) ) ( not ( = ?auto_90168 ?auto_90164 ) ) ( not ( = ?auto_90174 ?auto_90172 ) ) ( not ( = ?auto_90174 ?auto_90169 ) ) ( not ( = ?auto_90174 ?auto_90171 ) ) ( not ( = ?auto_90165 ?auto_90167 ) ) ( not ( = ?auto_90166 ?auto_90167 ) ) ( not ( = ?auto_90168 ?auto_90167 ) ) ( not ( = ?auto_90164 ?auto_90167 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_90165 ?auto_90166 ?auto_90168 ?auto_90167 ?auto_90164 ?auto_90163 )
      ( DELIVER-5PKG-VERIFY ?auto_90164 ?auto_90165 ?auto_90166 ?auto_90167 ?auto_90168 ?auto_90163 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_90215 - OBJ
      ?auto_90216 - OBJ
      ?auto_90217 - OBJ
      ?auto_90218 - OBJ
      ?auto_90219 - OBJ
      ?auto_90214 - LOCATION
    )
    :vars
    (
      ?auto_90220 - LOCATION
      ?auto_90224 - CITY
      ?auto_90225 - LOCATION
      ?auto_90223 - LOCATION
      ?auto_90222 - LOCATION
      ?auto_90221 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_90220 ?auto_90224 ) ( IN-CITY ?auto_90214 ?auto_90224 ) ( not ( = ?auto_90214 ?auto_90220 ) ) ( OBJ-AT ?auto_90219 ?auto_90220 ) ( IN-CITY ?auto_90225 ?auto_90224 ) ( not ( = ?auto_90214 ?auto_90225 ) ) ( OBJ-AT ?auto_90215 ?auto_90225 ) ( IN-CITY ?auto_90223 ?auto_90224 ) ( not ( = ?auto_90214 ?auto_90223 ) ) ( OBJ-AT ?auto_90217 ?auto_90223 ) ( OBJ-AT ?auto_90218 ?auto_90220 ) ( IN-CITY ?auto_90222 ?auto_90224 ) ( not ( = ?auto_90214 ?auto_90222 ) ) ( OBJ-AT ?auto_90216 ?auto_90222 ) ( TRUCK-AT ?auto_90221 ?auto_90214 ) ( not ( = ?auto_90216 ?auto_90218 ) ) ( not ( = ?auto_90220 ?auto_90222 ) ) ( not ( = ?auto_90216 ?auto_90217 ) ) ( not ( = ?auto_90218 ?auto_90217 ) ) ( not ( = ?auto_90223 ?auto_90220 ) ) ( not ( = ?auto_90223 ?auto_90222 ) ) ( not ( = ?auto_90216 ?auto_90215 ) ) ( not ( = ?auto_90218 ?auto_90215 ) ) ( not ( = ?auto_90217 ?auto_90215 ) ) ( not ( = ?auto_90225 ?auto_90223 ) ) ( not ( = ?auto_90225 ?auto_90220 ) ) ( not ( = ?auto_90225 ?auto_90222 ) ) ( not ( = ?auto_90216 ?auto_90219 ) ) ( not ( = ?auto_90218 ?auto_90219 ) ) ( not ( = ?auto_90217 ?auto_90219 ) ) ( not ( = ?auto_90215 ?auto_90219 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_90216 ?auto_90218 ?auto_90217 ?auto_90219 ?auto_90215 ?auto_90214 )
      ( DELIVER-5PKG-VERIFY ?auto_90215 ?auto_90216 ?auto_90217 ?auto_90218 ?auto_90219 ?auto_90214 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_90266 - OBJ
      ?auto_90267 - OBJ
      ?auto_90268 - OBJ
      ?auto_90269 - OBJ
      ?auto_90270 - OBJ
      ?auto_90265 - LOCATION
    )
    :vars
    (
      ?auto_90271 - LOCATION
      ?auto_90275 - CITY
      ?auto_90276 - LOCATION
      ?auto_90274 - LOCATION
      ?auto_90273 - LOCATION
      ?auto_90272 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_90271 ?auto_90275 ) ( IN-CITY ?auto_90265 ?auto_90275 ) ( not ( = ?auto_90265 ?auto_90271 ) ) ( OBJ-AT ?auto_90269 ?auto_90271 ) ( IN-CITY ?auto_90276 ?auto_90275 ) ( not ( = ?auto_90265 ?auto_90276 ) ) ( OBJ-AT ?auto_90266 ?auto_90276 ) ( IN-CITY ?auto_90274 ?auto_90275 ) ( not ( = ?auto_90265 ?auto_90274 ) ) ( OBJ-AT ?auto_90268 ?auto_90274 ) ( OBJ-AT ?auto_90270 ?auto_90271 ) ( IN-CITY ?auto_90273 ?auto_90275 ) ( not ( = ?auto_90265 ?auto_90273 ) ) ( OBJ-AT ?auto_90267 ?auto_90273 ) ( TRUCK-AT ?auto_90272 ?auto_90265 ) ( not ( = ?auto_90267 ?auto_90270 ) ) ( not ( = ?auto_90271 ?auto_90273 ) ) ( not ( = ?auto_90267 ?auto_90268 ) ) ( not ( = ?auto_90270 ?auto_90268 ) ) ( not ( = ?auto_90274 ?auto_90271 ) ) ( not ( = ?auto_90274 ?auto_90273 ) ) ( not ( = ?auto_90267 ?auto_90266 ) ) ( not ( = ?auto_90270 ?auto_90266 ) ) ( not ( = ?auto_90268 ?auto_90266 ) ) ( not ( = ?auto_90276 ?auto_90274 ) ) ( not ( = ?auto_90276 ?auto_90271 ) ) ( not ( = ?auto_90276 ?auto_90273 ) ) ( not ( = ?auto_90267 ?auto_90269 ) ) ( not ( = ?auto_90270 ?auto_90269 ) ) ( not ( = ?auto_90268 ?auto_90269 ) ) ( not ( = ?auto_90266 ?auto_90269 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_90267 ?auto_90270 ?auto_90268 ?auto_90269 ?auto_90266 ?auto_90265 )
      ( DELIVER-5PKG-VERIFY ?auto_90266 ?auto_90267 ?auto_90268 ?auto_90269 ?auto_90270 ?auto_90265 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_90533 - OBJ
      ?auto_90534 - OBJ
      ?auto_90535 - OBJ
      ?auto_90536 - OBJ
      ?auto_90537 - OBJ
      ?auto_90532 - LOCATION
    )
    :vars
    (
      ?auto_90538 - LOCATION
      ?auto_90542 - CITY
      ?auto_90543 - LOCATION
      ?auto_90541 - LOCATION
      ?auto_90540 - LOCATION
      ?auto_90539 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_90538 ?auto_90542 ) ( IN-CITY ?auto_90532 ?auto_90542 ) ( not ( = ?auto_90532 ?auto_90538 ) ) ( OBJ-AT ?auto_90535 ?auto_90538 ) ( IN-CITY ?auto_90543 ?auto_90542 ) ( not ( = ?auto_90532 ?auto_90543 ) ) ( OBJ-AT ?auto_90533 ?auto_90543 ) ( IN-CITY ?auto_90541 ?auto_90542 ) ( not ( = ?auto_90532 ?auto_90541 ) ) ( OBJ-AT ?auto_90537 ?auto_90541 ) ( OBJ-AT ?auto_90536 ?auto_90538 ) ( IN-CITY ?auto_90540 ?auto_90542 ) ( not ( = ?auto_90532 ?auto_90540 ) ) ( OBJ-AT ?auto_90534 ?auto_90540 ) ( TRUCK-AT ?auto_90539 ?auto_90532 ) ( not ( = ?auto_90534 ?auto_90536 ) ) ( not ( = ?auto_90538 ?auto_90540 ) ) ( not ( = ?auto_90534 ?auto_90537 ) ) ( not ( = ?auto_90536 ?auto_90537 ) ) ( not ( = ?auto_90541 ?auto_90538 ) ) ( not ( = ?auto_90541 ?auto_90540 ) ) ( not ( = ?auto_90534 ?auto_90533 ) ) ( not ( = ?auto_90536 ?auto_90533 ) ) ( not ( = ?auto_90537 ?auto_90533 ) ) ( not ( = ?auto_90543 ?auto_90541 ) ) ( not ( = ?auto_90543 ?auto_90538 ) ) ( not ( = ?auto_90543 ?auto_90540 ) ) ( not ( = ?auto_90534 ?auto_90535 ) ) ( not ( = ?auto_90536 ?auto_90535 ) ) ( not ( = ?auto_90537 ?auto_90535 ) ) ( not ( = ?auto_90533 ?auto_90535 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_90534 ?auto_90536 ?auto_90537 ?auto_90535 ?auto_90533 ?auto_90532 )
      ( DELIVER-5PKG-VERIFY ?auto_90533 ?auto_90534 ?auto_90535 ?auto_90536 ?auto_90537 ?auto_90532 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_90584 - OBJ
      ?auto_90585 - OBJ
      ?auto_90586 - OBJ
      ?auto_90587 - OBJ
      ?auto_90588 - OBJ
      ?auto_90583 - LOCATION
    )
    :vars
    (
      ?auto_90589 - LOCATION
      ?auto_90593 - CITY
      ?auto_90594 - LOCATION
      ?auto_90592 - LOCATION
      ?auto_90591 - LOCATION
      ?auto_90590 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_90589 ?auto_90593 ) ( IN-CITY ?auto_90583 ?auto_90593 ) ( not ( = ?auto_90583 ?auto_90589 ) ) ( OBJ-AT ?auto_90586 ?auto_90589 ) ( IN-CITY ?auto_90594 ?auto_90593 ) ( not ( = ?auto_90583 ?auto_90594 ) ) ( OBJ-AT ?auto_90584 ?auto_90594 ) ( IN-CITY ?auto_90592 ?auto_90593 ) ( not ( = ?auto_90583 ?auto_90592 ) ) ( OBJ-AT ?auto_90587 ?auto_90592 ) ( OBJ-AT ?auto_90588 ?auto_90589 ) ( IN-CITY ?auto_90591 ?auto_90593 ) ( not ( = ?auto_90583 ?auto_90591 ) ) ( OBJ-AT ?auto_90585 ?auto_90591 ) ( TRUCK-AT ?auto_90590 ?auto_90583 ) ( not ( = ?auto_90585 ?auto_90588 ) ) ( not ( = ?auto_90589 ?auto_90591 ) ) ( not ( = ?auto_90585 ?auto_90587 ) ) ( not ( = ?auto_90588 ?auto_90587 ) ) ( not ( = ?auto_90592 ?auto_90589 ) ) ( not ( = ?auto_90592 ?auto_90591 ) ) ( not ( = ?auto_90585 ?auto_90584 ) ) ( not ( = ?auto_90588 ?auto_90584 ) ) ( not ( = ?auto_90587 ?auto_90584 ) ) ( not ( = ?auto_90594 ?auto_90592 ) ) ( not ( = ?auto_90594 ?auto_90589 ) ) ( not ( = ?auto_90594 ?auto_90591 ) ) ( not ( = ?auto_90585 ?auto_90586 ) ) ( not ( = ?auto_90588 ?auto_90586 ) ) ( not ( = ?auto_90587 ?auto_90586 ) ) ( not ( = ?auto_90584 ?auto_90586 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_90585 ?auto_90588 ?auto_90587 ?auto_90586 ?auto_90584 ?auto_90583 )
      ( DELIVER-5PKG-VERIFY ?auto_90584 ?auto_90585 ?auto_90586 ?auto_90587 ?auto_90588 ?auto_90583 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_90797 - OBJ
      ?auto_90798 - OBJ
      ?auto_90799 - OBJ
      ?auto_90800 - OBJ
      ?auto_90801 - OBJ
      ?auto_90796 - LOCATION
    )
    :vars
    (
      ?auto_90802 - LOCATION
      ?auto_90806 - CITY
      ?auto_90807 - LOCATION
      ?auto_90805 - LOCATION
      ?auto_90804 - LOCATION
      ?auto_90803 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_90802 ?auto_90806 ) ( IN-CITY ?auto_90796 ?auto_90806 ) ( not ( = ?auto_90796 ?auto_90802 ) ) ( OBJ-AT ?auto_90801 ?auto_90802 ) ( IN-CITY ?auto_90807 ?auto_90806 ) ( not ( = ?auto_90796 ?auto_90807 ) ) ( OBJ-AT ?auto_90797 ?auto_90807 ) ( IN-CITY ?auto_90805 ?auto_90806 ) ( not ( = ?auto_90796 ?auto_90805 ) ) ( OBJ-AT ?auto_90800 ?auto_90805 ) ( OBJ-AT ?auto_90798 ?auto_90802 ) ( IN-CITY ?auto_90804 ?auto_90806 ) ( not ( = ?auto_90796 ?auto_90804 ) ) ( OBJ-AT ?auto_90799 ?auto_90804 ) ( TRUCK-AT ?auto_90803 ?auto_90796 ) ( not ( = ?auto_90799 ?auto_90798 ) ) ( not ( = ?auto_90802 ?auto_90804 ) ) ( not ( = ?auto_90799 ?auto_90800 ) ) ( not ( = ?auto_90798 ?auto_90800 ) ) ( not ( = ?auto_90805 ?auto_90802 ) ) ( not ( = ?auto_90805 ?auto_90804 ) ) ( not ( = ?auto_90799 ?auto_90797 ) ) ( not ( = ?auto_90798 ?auto_90797 ) ) ( not ( = ?auto_90800 ?auto_90797 ) ) ( not ( = ?auto_90807 ?auto_90805 ) ) ( not ( = ?auto_90807 ?auto_90802 ) ) ( not ( = ?auto_90807 ?auto_90804 ) ) ( not ( = ?auto_90799 ?auto_90801 ) ) ( not ( = ?auto_90798 ?auto_90801 ) ) ( not ( = ?auto_90800 ?auto_90801 ) ) ( not ( = ?auto_90797 ?auto_90801 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_90799 ?auto_90798 ?auto_90800 ?auto_90801 ?auto_90797 ?auto_90796 )
      ( DELIVER-5PKG-VERIFY ?auto_90797 ?auto_90798 ?auto_90799 ?auto_90800 ?auto_90801 ?auto_90796 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_90848 - OBJ
      ?auto_90849 - OBJ
      ?auto_90850 - OBJ
      ?auto_90851 - OBJ
      ?auto_90852 - OBJ
      ?auto_90847 - LOCATION
    )
    :vars
    (
      ?auto_90853 - LOCATION
      ?auto_90857 - CITY
      ?auto_90858 - LOCATION
      ?auto_90856 - LOCATION
      ?auto_90855 - LOCATION
      ?auto_90854 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_90853 ?auto_90857 ) ( IN-CITY ?auto_90847 ?auto_90857 ) ( not ( = ?auto_90847 ?auto_90853 ) ) ( OBJ-AT ?auto_90851 ?auto_90853 ) ( IN-CITY ?auto_90858 ?auto_90857 ) ( not ( = ?auto_90847 ?auto_90858 ) ) ( OBJ-AT ?auto_90848 ?auto_90858 ) ( IN-CITY ?auto_90856 ?auto_90857 ) ( not ( = ?auto_90847 ?auto_90856 ) ) ( OBJ-AT ?auto_90852 ?auto_90856 ) ( OBJ-AT ?auto_90849 ?auto_90853 ) ( IN-CITY ?auto_90855 ?auto_90857 ) ( not ( = ?auto_90847 ?auto_90855 ) ) ( OBJ-AT ?auto_90850 ?auto_90855 ) ( TRUCK-AT ?auto_90854 ?auto_90847 ) ( not ( = ?auto_90850 ?auto_90849 ) ) ( not ( = ?auto_90853 ?auto_90855 ) ) ( not ( = ?auto_90850 ?auto_90852 ) ) ( not ( = ?auto_90849 ?auto_90852 ) ) ( not ( = ?auto_90856 ?auto_90853 ) ) ( not ( = ?auto_90856 ?auto_90855 ) ) ( not ( = ?auto_90850 ?auto_90848 ) ) ( not ( = ?auto_90849 ?auto_90848 ) ) ( not ( = ?auto_90852 ?auto_90848 ) ) ( not ( = ?auto_90858 ?auto_90856 ) ) ( not ( = ?auto_90858 ?auto_90853 ) ) ( not ( = ?auto_90858 ?auto_90855 ) ) ( not ( = ?auto_90850 ?auto_90851 ) ) ( not ( = ?auto_90849 ?auto_90851 ) ) ( not ( = ?auto_90852 ?auto_90851 ) ) ( not ( = ?auto_90848 ?auto_90851 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_90850 ?auto_90849 ?auto_90852 ?auto_90851 ?auto_90848 ?auto_90847 )
      ( DELIVER-5PKG-VERIFY ?auto_90848 ?auto_90849 ?auto_90850 ?auto_90851 ?auto_90852 ?auto_90847 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_91008 - OBJ
      ?auto_91009 - OBJ
      ?auto_91010 - OBJ
      ?auto_91011 - OBJ
      ?auto_91012 - OBJ
      ?auto_91007 - LOCATION
    )
    :vars
    (
      ?auto_91013 - LOCATION
      ?auto_91017 - CITY
      ?auto_91018 - LOCATION
      ?auto_91016 - LOCATION
      ?auto_91015 - LOCATION
      ?auto_91014 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_91013 ?auto_91017 ) ( IN-CITY ?auto_91007 ?auto_91017 ) ( not ( = ?auto_91007 ?auto_91013 ) ) ( OBJ-AT ?auto_91012 ?auto_91013 ) ( IN-CITY ?auto_91018 ?auto_91017 ) ( not ( = ?auto_91007 ?auto_91018 ) ) ( OBJ-AT ?auto_91008 ?auto_91018 ) ( IN-CITY ?auto_91016 ?auto_91017 ) ( not ( = ?auto_91007 ?auto_91016 ) ) ( OBJ-AT ?auto_91010 ?auto_91016 ) ( OBJ-AT ?auto_91009 ?auto_91013 ) ( IN-CITY ?auto_91015 ?auto_91017 ) ( not ( = ?auto_91007 ?auto_91015 ) ) ( OBJ-AT ?auto_91011 ?auto_91015 ) ( TRUCK-AT ?auto_91014 ?auto_91007 ) ( not ( = ?auto_91011 ?auto_91009 ) ) ( not ( = ?auto_91013 ?auto_91015 ) ) ( not ( = ?auto_91011 ?auto_91010 ) ) ( not ( = ?auto_91009 ?auto_91010 ) ) ( not ( = ?auto_91016 ?auto_91013 ) ) ( not ( = ?auto_91016 ?auto_91015 ) ) ( not ( = ?auto_91011 ?auto_91008 ) ) ( not ( = ?auto_91009 ?auto_91008 ) ) ( not ( = ?auto_91010 ?auto_91008 ) ) ( not ( = ?auto_91018 ?auto_91016 ) ) ( not ( = ?auto_91018 ?auto_91013 ) ) ( not ( = ?auto_91018 ?auto_91015 ) ) ( not ( = ?auto_91011 ?auto_91012 ) ) ( not ( = ?auto_91009 ?auto_91012 ) ) ( not ( = ?auto_91010 ?auto_91012 ) ) ( not ( = ?auto_91008 ?auto_91012 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_91011 ?auto_91009 ?auto_91010 ?auto_91012 ?auto_91008 ?auto_91007 )
      ( DELIVER-5PKG-VERIFY ?auto_91008 ?auto_91009 ?auto_91010 ?auto_91011 ?auto_91012 ?auto_91007 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_91059 - OBJ
      ?auto_91060 - OBJ
      ?auto_91061 - OBJ
      ?auto_91062 - OBJ
      ?auto_91063 - OBJ
      ?auto_91058 - LOCATION
    )
    :vars
    (
      ?auto_91064 - LOCATION
      ?auto_91068 - CITY
      ?auto_91069 - LOCATION
      ?auto_91067 - LOCATION
      ?auto_91066 - LOCATION
      ?auto_91065 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_91064 ?auto_91068 ) ( IN-CITY ?auto_91058 ?auto_91068 ) ( not ( = ?auto_91058 ?auto_91064 ) ) ( OBJ-AT ?auto_91062 ?auto_91064 ) ( IN-CITY ?auto_91069 ?auto_91068 ) ( not ( = ?auto_91058 ?auto_91069 ) ) ( OBJ-AT ?auto_91059 ?auto_91069 ) ( IN-CITY ?auto_91067 ?auto_91068 ) ( not ( = ?auto_91058 ?auto_91067 ) ) ( OBJ-AT ?auto_91061 ?auto_91067 ) ( OBJ-AT ?auto_91060 ?auto_91064 ) ( IN-CITY ?auto_91066 ?auto_91068 ) ( not ( = ?auto_91058 ?auto_91066 ) ) ( OBJ-AT ?auto_91063 ?auto_91066 ) ( TRUCK-AT ?auto_91065 ?auto_91058 ) ( not ( = ?auto_91063 ?auto_91060 ) ) ( not ( = ?auto_91064 ?auto_91066 ) ) ( not ( = ?auto_91063 ?auto_91061 ) ) ( not ( = ?auto_91060 ?auto_91061 ) ) ( not ( = ?auto_91067 ?auto_91064 ) ) ( not ( = ?auto_91067 ?auto_91066 ) ) ( not ( = ?auto_91063 ?auto_91059 ) ) ( not ( = ?auto_91060 ?auto_91059 ) ) ( not ( = ?auto_91061 ?auto_91059 ) ) ( not ( = ?auto_91069 ?auto_91067 ) ) ( not ( = ?auto_91069 ?auto_91064 ) ) ( not ( = ?auto_91069 ?auto_91066 ) ) ( not ( = ?auto_91063 ?auto_91062 ) ) ( not ( = ?auto_91060 ?auto_91062 ) ) ( not ( = ?auto_91061 ?auto_91062 ) ) ( not ( = ?auto_91059 ?auto_91062 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_91063 ?auto_91060 ?auto_91061 ?auto_91062 ?auto_91059 ?auto_91058 )
      ( DELIVER-5PKG-VERIFY ?auto_91059 ?auto_91060 ?auto_91061 ?auto_91062 ?auto_91063 ?auto_91058 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_91271 - OBJ
      ?auto_91272 - OBJ
      ?auto_91273 - OBJ
      ?auto_91274 - OBJ
      ?auto_91275 - OBJ
      ?auto_91270 - LOCATION
    )
    :vars
    (
      ?auto_91276 - LOCATION
      ?auto_91280 - CITY
      ?auto_91281 - LOCATION
      ?auto_91279 - LOCATION
      ?auto_91278 - LOCATION
      ?auto_91277 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_91276 ?auto_91280 ) ( IN-CITY ?auto_91270 ?auto_91280 ) ( not ( = ?auto_91270 ?auto_91276 ) ) ( OBJ-AT ?auto_91273 ?auto_91276 ) ( IN-CITY ?auto_91281 ?auto_91280 ) ( not ( = ?auto_91270 ?auto_91281 ) ) ( OBJ-AT ?auto_91271 ?auto_91281 ) ( IN-CITY ?auto_91279 ?auto_91280 ) ( not ( = ?auto_91270 ?auto_91279 ) ) ( OBJ-AT ?auto_91275 ?auto_91279 ) ( OBJ-AT ?auto_91272 ?auto_91276 ) ( IN-CITY ?auto_91278 ?auto_91280 ) ( not ( = ?auto_91270 ?auto_91278 ) ) ( OBJ-AT ?auto_91274 ?auto_91278 ) ( TRUCK-AT ?auto_91277 ?auto_91270 ) ( not ( = ?auto_91274 ?auto_91272 ) ) ( not ( = ?auto_91276 ?auto_91278 ) ) ( not ( = ?auto_91274 ?auto_91275 ) ) ( not ( = ?auto_91272 ?auto_91275 ) ) ( not ( = ?auto_91279 ?auto_91276 ) ) ( not ( = ?auto_91279 ?auto_91278 ) ) ( not ( = ?auto_91274 ?auto_91271 ) ) ( not ( = ?auto_91272 ?auto_91271 ) ) ( not ( = ?auto_91275 ?auto_91271 ) ) ( not ( = ?auto_91281 ?auto_91279 ) ) ( not ( = ?auto_91281 ?auto_91276 ) ) ( not ( = ?auto_91281 ?auto_91278 ) ) ( not ( = ?auto_91274 ?auto_91273 ) ) ( not ( = ?auto_91272 ?auto_91273 ) ) ( not ( = ?auto_91275 ?auto_91273 ) ) ( not ( = ?auto_91271 ?auto_91273 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_91274 ?auto_91272 ?auto_91275 ?auto_91273 ?auto_91271 ?auto_91270 )
      ( DELIVER-5PKG-VERIFY ?auto_91271 ?auto_91272 ?auto_91273 ?auto_91274 ?auto_91275 ?auto_91270 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_91377 - OBJ
      ?auto_91378 - OBJ
      ?auto_91379 - OBJ
      ?auto_91380 - OBJ
      ?auto_91381 - OBJ
      ?auto_91376 - LOCATION
    )
    :vars
    (
      ?auto_91382 - LOCATION
      ?auto_91386 - CITY
      ?auto_91387 - LOCATION
      ?auto_91385 - LOCATION
      ?auto_91384 - LOCATION
      ?auto_91383 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_91382 ?auto_91386 ) ( IN-CITY ?auto_91376 ?auto_91386 ) ( not ( = ?auto_91376 ?auto_91382 ) ) ( OBJ-AT ?auto_91379 ?auto_91382 ) ( IN-CITY ?auto_91387 ?auto_91386 ) ( not ( = ?auto_91376 ?auto_91387 ) ) ( OBJ-AT ?auto_91377 ?auto_91387 ) ( IN-CITY ?auto_91385 ?auto_91386 ) ( not ( = ?auto_91376 ?auto_91385 ) ) ( OBJ-AT ?auto_91380 ?auto_91385 ) ( OBJ-AT ?auto_91378 ?auto_91382 ) ( IN-CITY ?auto_91384 ?auto_91386 ) ( not ( = ?auto_91376 ?auto_91384 ) ) ( OBJ-AT ?auto_91381 ?auto_91384 ) ( TRUCK-AT ?auto_91383 ?auto_91376 ) ( not ( = ?auto_91381 ?auto_91378 ) ) ( not ( = ?auto_91382 ?auto_91384 ) ) ( not ( = ?auto_91381 ?auto_91380 ) ) ( not ( = ?auto_91378 ?auto_91380 ) ) ( not ( = ?auto_91385 ?auto_91382 ) ) ( not ( = ?auto_91385 ?auto_91384 ) ) ( not ( = ?auto_91381 ?auto_91377 ) ) ( not ( = ?auto_91378 ?auto_91377 ) ) ( not ( = ?auto_91380 ?auto_91377 ) ) ( not ( = ?auto_91387 ?auto_91385 ) ) ( not ( = ?auto_91387 ?auto_91382 ) ) ( not ( = ?auto_91387 ?auto_91384 ) ) ( not ( = ?auto_91381 ?auto_91379 ) ) ( not ( = ?auto_91378 ?auto_91379 ) ) ( not ( = ?auto_91380 ?auto_91379 ) ) ( not ( = ?auto_91377 ?auto_91379 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_91381 ?auto_91378 ?auto_91380 ?auto_91379 ?auto_91377 ?auto_91376 )
      ( DELIVER-5PKG-VERIFY ?auto_91377 ?auto_91378 ?auto_91379 ?auto_91380 ?auto_91381 ?auto_91376 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_91590 - OBJ
      ?auto_91591 - OBJ
      ?auto_91592 - OBJ
      ?auto_91593 - OBJ
      ?auto_91594 - OBJ
      ?auto_91589 - LOCATION
    )
    :vars
    (
      ?auto_91595 - LOCATION
      ?auto_91599 - CITY
      ?auto_91600 - LOCATION
      ?auto_91598 - LOCATION
      ?auto_91597 - LOCATION
      ?auto_91596 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_91595 ?auto_91599 ) ( IN-CITY ?auto_91589 ?auto_91599 ) ( not ( = ?auto_91589 ?auto_91595 ) ) ( OBJ-AT ?auto_91594 ?auto_91595 ) ( IN-CITY ?auto_91600 ?auto_91599 ) ( not ( = ?auto_91589 ?auto_91600 ) ) ( OBJ-AT ?auto_91590 ?auto_91600 ) ( IN-CITY ?auto_91598 ?auto_91599 ) ( not ( = ?auto_91589 ?auto_91598 ) ) ( OBJ-AT ?auto_91591 ?auto_91598 ) ( OBJ-AT ?auto_91593 ?auto_91595 ) ( IN-CITY ?auto_91597 ?auto_91599 ) ( not ( = ?auto_91589 ?auto_91597 ) ) ( OBJ-AT ?auto_91592 ?auto_91597 ) ( TRUCK-AT ?auto_91596 ?auto_91589 ) ( not ( = ?auto_91592 ?auto_91593 ) ) ( not ( = ?auto_91595 ?auto_91597 ) ) ( not ( = ?auto_91592 ?auto_91591 ) ) ( not ( = ?auto_91593 ?auto_91591 ) ) ( not ( = ?auto_91598 ?auto_91595 ) ) ( not ( = ?auto_91598 ?auto_91597 ) ) ( not ( = ?auto_91592 ?auto_91590 ) ) ( not ( = ?auto_91593 ?auto_91590 ) ) ( not ( = ?auto_91591 ?auto_91590 ) ) ( not ( = ?auto_91600 ?auto_91598 ) ) ( not ( = ?auto_91600 ?auto_91595 ) ) ( not ( = ?auto_91600 ?auto_91597 ) ) ( not ( = ?auto_91592 ?auto_91594 ) ) ( not ( = ?auto_91593 ?auto_91594 ) ) ( not ( = ?auto_91591 ?auto_91594 ) ) ( not ( = ?auto_91590 ?auto_91594 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_91592 ?auto_91593 ?auto_91591 ?auto_91594 ?auto_91590 ?auto_91589 )
      ( DELIVER-5PKG-VERIFY ?auto_91590 ?auto_91591 ?auto_91592 ?auto_91593 ?auto_91594 ?auto_91589 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_91641 - OBJ
      ?auto_91642 - OBJ
      ?auto_91643 - OBJ
      ?auto_91644 - OBJ
      ?auto_91645 - OBJ
      ?auto_91640 - LOCATION
    )
    :vars
    (
      ?auto_91646 - LOCATION
      ?auto_91650 - CITY
      ?auto_91651 - LOCATION
      ?auto_91649 - LOCATION
      ?auto_91648 - LOCATION
      ?auto_91647 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_91646 ?auto_91650 ) ( IN-CITY ?auto_91640 ?auto_91650 ) ( not ( = ?auto_91640 ?auto_91646 ) ) ( OBJ-AT ?auto_91644 ?auto_91646 ) ( IN-CITY ?auto_91651 ?auto_91650 ) ( not ( = ?auto_91640 ?auto_91651 ) ) ( OBJ-AT ?auto_91641 ?auto_91651 ) ( IN-CITY ?auto_91649 ?auto_91650 ) ( not ( = ?auto_91640 ?auto_91649 ) ) ( OBJ-AT ?auto_91642 ?auto_91649 ) ( OBJ-AT ?auto_91645 ?auto_91646 ) ( IN-CITY ?auto_91648 ?auto_91650 ) ( not ( = ?auto_91640 ?auto_91648 ) ) ( OBJ-AT ?auto_91643 ?auto_91648 ) ( TRUCK-AT ?auto_91647 ?auto_91640 ) ( not ( = ?auto_91643 ?auto_91645 ) ) ( not ( = ?auto_91646 ?auto_91648 ) ) ( not ( = ?auto_91643 ?auto_91642 ) ) ( not ( = ?auto_91645 ?auto_91642 ) ) ( not ( = ?auto_91649 ?auto_91646 ) ) ( not ( = ?auto_91649 ?auto_91648 ) ) ( not ( = ?auto_91643 ?auto_91641 ) ) ( not ( = ?auto_91645 ?auto_91641 ) ) ( not ( = ?auto_91642 ?auto_91641 ) ) ( not ( = ?auto_91651 ?auto_91649 ) ) ( not ( = ?auto_91651 ?auto_91646 ) ) ( not ( = ?auto_91651 ?auto_91648 ) ) ( not ( = ?auto_91643 ?auto_91644 ) ) ( not ( = ?auto_91645 ?auto_91644 ) ) ( not ( = ?auto_91642 ?auto_91644 ) ) ( not ( = ?auto_91641 ?auto_91644 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_91643 ?auto_91645 ?auto_91642 ?auto_91644 ?auto_91641 ?auto_91640 )
      ( DELIVER-5PKG-VERIFY ?auto_91641 ?auto_91642 ?auto_91643 ?auto_91644 ?auto_91645 ?auto_91640 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_91692 - OBJ
      ?auto_91693 - OBJ
      ?auto_91694 - OBJ
      ?auto_91695 - OBJ
      ?auto_91696 - OBJ
      ?auto_91691 - LOCATION
    )
    :vars
    (
      ?auto_91697 - LOCATION
      ?auto_91701 - CITY
      ?auto_91702 - LOCATION
      ?auto_91700 - LOCATION
      ?auto_91699 - LOCATION
      ?auto_91698 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_91697 ?auto_91701 ) ( IN-CITY ?auto_91691 ?auto_91701 ) ( not ( = ?auto_91691 ?auto_91697 ) ) ( OBJ-AT ?auto_91696 ?auto_91697 ) ( IN-CITY ?auto_91702 ?auto_91701 ) ( not ( = ?auto_91691 ?auto_91702 ) ) ( OBJ-AT ?auto_91692 ?auto_91702 ) ( IN-CITY ?auto_91700 ?auto_91701 ) ( not ( = ?auto_91691 ?auto_91700 ) ) ( OBJ-AT ?auto_91693 ?auto_91700 ) ( OBJ-AT ?auto_91694 ?auto_91697 ) ( IN-CITY ?auto_91699 ?auto_91701 ) ( not ( = ?auto_91691 ?auto_91699 ) ) ( OBJ-AT ?auto_91695 ?auto_91699 ) ( TRUCK-AT ?auto_91698 ?auto_91691 ) ( not ( = ?auto_91695 ?auto_91694 ) ) ( not ( = ?auto_91697 ?auto_91699 ) ) ( not ( = ?auto_91695 ?auto_91693 ) ) ( not ( = ?auto_91694 ?auto_91693 ) ) ( not ( = ?auto_91700 ?auto_91697 ) ) ( not ( = ?auto_91700 ?auto_91699 ) ) ( not ( = ?auto_91695 ?auto_91692 ) ) ( not ( = ?auto_91694 ?auto_91692 ) ) ( not ( = ?auto_91693 ?auto_91692 ) ) ( not ( = ?auto_91702 ?auto_91700 ) ) ( not ( = ?auto_91702 ?auto_91697 ) ) ( not ( = ?auto_91702 ?auto_91699 ) ) ( not ( = ?auto_91695 ?auto_91696 ) ) ( not ( = ?auto_91694 ?auto_91696 ) ) ( not ( = ?auto_91693 ?auto_91696 ) ) ( not ( = ?auto_91692 ?auto_91696 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_91695 ?auto_91694 ?auto_91693 ?auto_91696 ?auto_91692 ?auto_91691 )
      ( DELIVER-5PKG-VERIFY ?auto_91692 ?auto_91693 ?auto_91694 ?auto_91695 ?auto_91696 ?auto_91691 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_91743 - OBJ
      ?auto_91744 - OBJ
      ?auto_91745 - OBJ
      ?auto_91746 - OBJ
      ?auto_91747 - OBJ
      ?auto_91742 - LOCATION
    )
    :vars
    (
      ?auto_91748 - LOCATION
      ?auto_91752 - CITY
      ?auto_91753 - LOCATION
      ?auto_91751 - LOCATION
      ?auto_91750 - LOCATION
      ?auto_91749 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_91748 ?auto_91752 ) ( IN-CITY ?auto_91742 ?auto_91752 ) ( not ( = ?auto_91742 ?auto_91748 ) ) ( OBJ-AT ?auto_91746 ?auto_91748 ) ( IN-CITY ?auto_91753 ?auto_91752 ) ( not ( = ?auto_91742 ?auto_91753 ) ) ( OBJ-AT ?auto_91743 ?auto_91753 ) ( IN-CITY ?auto_91751 ?auto_91752 ) ( not ( = ?auto_91742 ?auto_91751 ) ) ( OBJ-AT ?auto_91744 ?auto_91751 ) ( OBJ-AT ?auto_91745 ?auto_91748 ) ( IN-CITY ?auto_91750 ?auto_91752 ) ( not ( = ?auto_91742 ?auto_91750 ) ) ( OBJ-AT ?auto_91747 ?auto_91750 ) ( TRUCK-AT ?auto_91749 ?auto_91742 ) ( not ( = ?auto_91747 ?auto_91745 ) ) ( not ( = ?auto_91748 ?auto_91750 ) ) ( not ( = ?auto_91747 ?auto_91744 ) ) ( not ( = ?auto_91745 ?auto_91744 ) ) ( not ( = ?auto_91751 ?auto_91748 ) ) ( not ( = ?auto_91751 ?auto_91750 ) ) ( not ( = ?auto_91747 ?auto_91743 ) ) ( not ( = ?auto_91745 ?auto_91743 ) ) ( not ( = ?auto_91744 ?auto_91743 ) ) ( not ( = ?auto_91753 ?auto_91751 ) ) ( not ( = ?auto_91753 ?auto_91748 ) ) ( not ( = ?auto_91753 ?auto_91750 ) ) ( not ( = ?auto_91747 ?auto_91746 ) ) ( not ( = ?auto_91745 ?auto_91746 ) ) ( not ( = ?auto_91744 ?auto_91746 ) ) ( not ( = ?auto_91743 ?auto_91746 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_91747 ?auto_91745 ?auto_91744 ?auto_91746 ?auto_91743 ?auto_91742 )
      ( DELIVER-5PKG-VERIFY ?auto_91743 ?auto_91744 ?auto_91745 ?auto_91746 ?auto_91747 ?auto_91742 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_92064 - OBJ
      ?auto_92065 - OBJ
      ?auto_92066 - OBJ
      ?auto_92067 - OBJ
      ?auto_92068 - OBJ
      ?auto_92063 - LOCATION
    )
    :vars
    (
      ?auto_92069 - LOCATION
      ?auto_92073 - CITY
      ?auto_92074 - LOCATION
      ?auto_92072 - LOCATION
      ?auto_92071 - LOCATION
      ?auto_92070 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_92069 ?auto_92073 ) ( IN-CITY ?auto_92063 ?auto_92073 ) ( not ( = ?auto_92063 ?auto_92069 ) ) ( OBJ-AT ?auto_92066 ?auto_92069 ) ( IN-CITY ?auto_92074 ?auto_92073 ) ( not ( = ?auto_92063 ?auto_92074 ) ) ( OBJ-AT ?auto_92064 ?auto_92074 ) ( IN-CITY ?auto_92072 ?auto_92073 ) ( not ( = ?auto_92063 ?auto_92072 ) ) ( OBJ-AT ?auto_92065 ?auto_92072 ) ( OBJ-AT ?auto_92068 ?auto_92069 ) ( IN-CITY ?auto_92071 ?auto_92073 ) ( not ( = ?auto_92063 ?auto_92071 ) ) ( OBJ-AT ?auto_92067 ?auto_92071 ) ( TRUCK-AT ?auto_92070 ?auto_92063 ) ( not ( = ?auto_92067 ?auto_92068 ) ) ( not ( = ?auto_92069 ?auto_92071 ) ) ( not ( = ?auto_92067 ?auto_92065 ) ) ( not ( = ?auto_92068 ?auto_92065 ) ) ( not ( = ?auto_92072 ?auto_92069 ) ) ( not ( = ?auto_92072 ?auto_92071 ) ) ( not ( = ?auto_92067 ?auto_92064 ) ) ( not ( = ?auto_92068 ?auto_92064 ) ) ( not ( = ?auto_92065 ?auto_92064 ) ) ( not ( = ?auto_92074 ?auto_92072 ) ) ( not ( = ?auto_92074 ?auto_92069 ) ) ( not ( = ?auto_92074 ?auto_92071 ) ) ( not ( = ?auto_92067 ?auto_92066 ) ) ( not ( = ?auto_92068 ?auto_92066 ) ) ( not ( = ?auto_92065 ?auto_92066 ) ) ( not ( = ?auto_92064 ?auto_92066 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_92067 ?auto_92068 ?auto_92065 ?auto_92066 ?auto_92064 ?auto_92063 )
      ( DELIVER-5PKG-VERIFY ?auto_92064 ?auto_92065 ?auto_92066 ?auto_92067 ?auto_92068 ?auto_92063 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_92115 - OBJ
      ?auto_92116 - OBJ
      ?auto_92117 - OBJ
      ?auto_92118 - OBJ
      ?auto_92119 - OBJ
      ?auto_92114 - LOCATION
    )
    :vars
    (
      ?auto_92120 - LOCATION
      ?auto_92124 - CITY
      ?auto_92125 - LOCATION
      ?auto_92123 - LOCATION
      ?auto_92122 - LOCATION
      ?auto_92121 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_92120 ?auto_92124 ) ( IN-CITY ?auto_92114 ?auto_92124 ) ( not ( = ?auto_92114 ?auto_92120 ) ) ( OBJ-AT ?auto_92117 ?auto_92120 ) ( IN-CITY ?auto_92125 ?auto_92124 ) ( not ( = ?auto_92114 ?auto_92125 ) ) ( OBJ-AT ?auto_92115 ?auto_92125 ) ( IN-CITY ?auto_92123 ?auto_92124 ) ( not ( = ?auto_92114 ?auto_92123 ) ) ( OBJ-AT ?auto_92116 ?auto_92123 ) ( OBJ-AT ?auto_92118 ?auto_92120 ) ( IN-CITY ?auto_92122 ?auto_92124 ) ( not ( = ?auto_92114 ?auto_92122 ) ) ( OBJ-AT ?auto_92119 ?auto_92122 ) ( TRUCK-AT ?auto_92121 ?auto_92114 ) ( not ( = ?auto_92119 ?auto_92118 ) ) ( not ( = ?auto_92120 ?auto_92122 ) ) ( not ( = ?auto_92119 ?auto_92116 ) ) ( not ( = ?auto_92118 ?auto_92116 ) ) ( not ( = ?auto_92123 ?auto_92120 ) ) ( not ( = ?auto_92123 ?auto_92122 ) ) ( not ( = ?auto_92119 ?auto_92115 ) ) ( not ( = ?auto_92118 ?auto_92115 ) ) ( not ( = ?auto_92116 ?auto_92115 ) ) ( not ( = ?auto_92125 ?auto_92123 ) ) ( not ( = ?auto_92125 ?auto_92120 ) ) ( not ( = ?auto_92125 ?auto_92122 ) ) ( not ( = ?auto_92119 ?auto_92117 ) ) ( not ( = ?auto_92118 ?auto_92117 ) ) ( not ( = ?auto_92116 ?auto_92117 ) ) ( not ( = ?auto_92115 ?auto_92117 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_92119 ?auto_92118 ?auto_92116 ?auto_92117 ?auto_92115 ?auto_92114 )
      ( DELIVER-5PKG-VERIFY ?auto_92115 ?auto_92116 ?auto_92117 ?auto_92118 ?auto_92119 ?auto_92114 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_93320 - OBJ
      ?auto_93321 - OBJ
      ?auto_93322 - OBJ
      ?auto_93323 - OBJ
      ?auto_93324 - OBJ
      ?auto_93319 - LOCATION
    )
    :vars
    (
      ?auto_93325 - LOCATION
      ?auto_93329 - CITY
      ?auto_93330 - LOCATION
      ?auto_93328 - LOCATION
      ?auto_93327 - LOCATION
      ?auto_93326 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_93325 ?auto_93329 ) ( IN-CITY ?auto_93319 ?auto_93329 ) ( not ( = ?auto_93319 ?auto_93325 ) ) ( OBJ-AT ?auto_93321 ?auto_93325 ) ( IN-CITY ?auto_93330 ?auto_93329 ) ( not ( = ?auto_93319 ?auto_93330 ) ) ( OBJ-AT ?auto_93320 ?auto_93330 ) ( IN-CITY ?auto_93328 ?auto_93329 ) ( not ( = ?auto_93319 ?auto_93328 ) ) ( OBJ-AT ?auto_93324 ?auto_93328 ) ( OBJ-AT ?auto_93323 ?auto_93325 ) ( IN-CITY ?auto_93327 ?auto_93329 ) ( not ( = ?auto_93319 ?auto_93327 ) ) ( OBJ-AT ?auto_93322 ?auto_93327 ) ( TRUCK-AT ?auto_93326 ?auto_93319 ) ( not ( = ?auto_93322 ?auto_93323 ) ) ( not ( = ?auto_93325 ?auto_93327 ) ) ( not ( = ?auto_93322 ?auto_93324 ) ) ( not ( = ?auto_93323 ?auto_93324 ) ) ( not ( = ?auto_93328 ?auto_93325 ) ) ( not ( = ?auto_93328 ?auto_93327 ) ) ( not ( = ?auto_93322 ?auto_93320 ) ) ( not ( = ?auto_93323 ?auto_93320 ) ) ( not ( = ?auto_93324 ?auto_93320 ) ) ( not ( = ?auto_93330 ?auto_93328 ) ) ( not ( = ?auto_93330 ?auto_93325 ) ) ( not ( = ?auto_93330 ?auto_93327 ) ) ( not ( = ?auto_93322 ?auto_93321 ) ) ( not ( = ?auto_93323 ?auto_93321 ) ) ( not ( = ?auto_93324 ?auto_93321 ) ) ( not ( = ?auto_93320 ?auto_93321 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_93322 ?auto_93323 ?auto_93324 ?auto_93321 ?auto_93320 ?auto_93319 )
      ( DELIVER-5PKG-VERIFY ?auto_93320 ?auto_93321 ?auto_93322 ?auto_93323 ?auto_93324 ?auto_93319 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_93371 - OBJ
      ?auto_93372 - OBJ
      ?auto_93373 - OBJ
      ?auto_93374 - OBJ
      ?auto_93375 - OBJ
      ?auto_93370 - LOCATION
    )
    :vars
    (
      ?auto_93376 - LOCATION
      ?auto_93380 - CITY
      ?auto_93381 - LOCATION
      ?auto_93379 - LOCATION
      ?auto_93378 - LOCATION
      ?auto_93377 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_93376 ?auto_93380 ) ( IN-CITY ?auto_93370 ?auto_93380 ) ( not ( = ?auto_93370 ?auto_93376 ) ) ( OBJ-AT ?auto_93372 ?auto_93376 ) ( IN-CITY ?auto_93381 ?auto_93380 ) ( not ( = ?auto_93370 ?auto_93381 ) ) ( OBJ-AT ?auto_93371 ?auto_93381 ) ( IN-CITY ?auto_93379 ?auto_93380 ) ( not ( = ?auto_93370 ?auto_93379 ) ) ( OBJ-AT ?auto_93374 ?auto_93379 ) ( OBJ-AT ?auto_93375 ?auto_93376 ) ( IN-CITY ?auto_93378 ?auto_93380 ) ( not ( = ?auto_93370 ?auto_93378 ) ) ( OBJ-AT ?auto_93373 ?auto_93378 ) ( TRUCK-AT ?auto_93377 ?auto_93370 ) ( not ( = ?auto_93373 ?auto_93375 ) ) ( not ( = ?auto_93376 ?auto_93378 ) ) ( not ( = ?auto_93373 ?auto_93374 ) ) ( not ( = ?auto_93375 ?auto_93374 ) ) ( not ( = ?auto_93379 ?auto_93376 ) ) ( not ( = ?auto_93379 ?auto_93378 ) ) ( not ( = ?auto_93373 ?auto_93371 ) ) ( not ( = ?auto_93375 ?auto_93371 ) ) ( not ( = ?auto_93374 ?auto_93371 ) ) ( not ( = ?auto_93381 ?auto_93379 ) ) ( not ( = ?auto_93381 ?auto_93376 ) ) ( not ( = ?auto_93381 ?auto_93378 ) ) ( not ( = ?auto_93373 ?auto_93372 ) ) ( not ( = ?auto_93375 ?auto_93372 ) ) ( not ( = ?auto_93374 ?auto_93372 ) ) ( not ( = ?auto_93371 ?auto_93372 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_93373 ?auto_93375 ?auto_93374 ?auto_93372 ?auto_93371 ?auto_93370 )
      ( DELIVER-5PKG-VERIFY ?auto_93371 ?auto_93372 ?auto_93373 ?auto_93374 ?auto_93375 ?auto_93370 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_93584 - OBJ
      ?auto_93585 - OBJ
      ?auto_93586 - OBJ
      ?auto_93587 - OBJ
      ?auto_93588 - OBJ
      ?auto_93583 - LOCATION
    )
    :vars
    (
      ?auto_93589 - LOCATION
      ?auto_93593 - CITY
      ?auto_93594 - LOCATION
      ?auto_93592 - LOCATION
      ?auto_93591 - LOCATION
      ?auto_93590 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_93589 ?auto_93593 ) ( IN-CITY ?auto_93583 ?auto_93593 ) ( not ( = ?auto_93583 ?auto_93589 ) ) ( OBJ-AT ?auto_93585 ?auto_93589 ) ( IN-CITY ?auto_93594 ?auto_93593 ) ( not ( = ?auto_93583 ?auto_93594 ) ) ( OBJ-AT ?auto_93584 ?auto_93594 ) ( IN-CITY ?auto_93592 ?auto_93593 ) ( not ( = ?auto_93583 ?auto_93592 ) ) ( OBJ-AT ?auto_93588 ?auto_93592 ) ( OBJ-AT ?auto_93586 ?auto_93589 ) ( IN-CITY ?auto_93591 ?auto_93593 ) ( not ( = ?auto_93583 ?auto_93591 ) ) ( OBJ-AT ?auto_93587 ?auto_93591 ) ( TRUCK-AT ?auto_93590 ?auto_93583 ) ( not ( = ?auto_93587 ?auto_93586 ) ) ( not ( = ?auto_93589 ?auto_93591 ) ) ( not ( = ?auto_93587 ?auto_93588 ) ) ( not ( = ?auto_93586 ?auto_93588 ) ) ( not ( = ?auto_93592 ?auto_93589 ) ) ( not ( = ?auto_93592 ?auto_93591 ) ) ( not ( = ?auto_93587 ?auto_93584 ) ) ( not ( = ?auto_93586 ?auto_93584 ) ) ( not ( = ?auto_93588 ?auto_93584 ) ) ( not ( = ?auto_93594 ?auto_93592 ) ) ( not ( = ?auto_93594 ?auto_93589 ) ) ( not ( = ?auto_93594 ?auto_93591 ) ) ( not ( = ?auto_93587 ?auto_93585 ) ) ( not ( = ?auto_93586 ?auto_93585 ) ) ( not ( = ?auto_93588 ?auto_93585 ) ) ( not ( = ?auto_93584 ?auto_93585 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_93587 ?auto_93586 ?auto_93588 ?auto_93585 ?auto_93584 ?auto_93583 )
      ( DELIVER-5PKG-VERIFY ?auto_93584 ?auto_93585 ?auto_93586 ?auto_93587 ?auto_93588 ?auto_93583 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_93690 - OBJ
      ?auto_93691 - OBJ
      ?auto_93692 - OBJ
      ?auto_93693 - OBJ
      ?auto_93694 - OBJ
      ?auto_93689 - LOCATION
    )
    :vars
    (
      ?auto_93695 - LOCATION
      ?auto_93699 - CITY
      ?auto_93700 - LOCATION
      ?auto_93698 - LOCATION
      ?auto_93697 - LOCATION
      ?auto_93696 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_93695 ?auto_93699 ) ( IN-CITY ?auto_93689 ?auto_93699 ) ( not ( = ?auto_93689 ?auto_93695 ) ) ( OBJ-AT ?auto_93691 ?auto_93695 ) ( IN-CITY ?auto_93700 ?auto_93699 ) ( not ( = ?auto_93689 ?auto_93700 ) ) ( OBJ-AT ?auto_93690 ?auto_93700 ) ( IN-CITY ?auto_93698 ?auto_93699 ) ( not ( = ?auto_93689 ?auto_93698 ) ) ( OBJ-AT ?auto_93693 ?auto_93698 ) ( OBJ-AT ?auto_93692 ?auto_93695 ) ( IN-CITY ?auto_93697 ?auto_93699 ) ( not ( = ?auto_93689 ?auto_93697 ) ) ( OBJ-AT ?auto_93694 ?auto_93697 ) ( TRUCK-AT ?auto_93696 ?auto_93689 ) ( not ( = ?auto_93694 ?auto_93692 ) ) ( not ( = ?auto_93695 ?auto_93697 ) ) ( not ( = ?auto_93694 ?auto_93693 ) ) ( not ( = ?auto_93692 ?auto_93693 ) ) ( not ( = ?auto_93698 ?auto_93695 ) ) ( not ( = ?auto_93698 ?auto_93697 ) ) ( not ( = ?auto_93694 ?auto_93690 ) ) ( not ( = ?auto_93692 ?auto_93690 ) ) ( not ( = ?auto_93693 ?auto_93690 ) ) ( not ( = ?auto_93700 ?auto_93698 ) ) ( not ( = ?auto_93700 ?auto_93695 ) ) ( not ( = ?auto_93700 ?auto_93697 ) ) ( not ( = ?auto_93694 ?auto_93691 ) ) ( not ( = ?auto_93692 ?auto_93691 ) ) ( not ( = ?auto_93693 ?auto_93691 ) ) ( not ( = ?auto_93690 ?auto_93691 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_93694 ?auto_93692 ?auto_93693 ?auto_93691 ?auto_93690 ?auto_93689 )
      ( DELIVER-5PKG-VERIFY ?auto_93690 ?auto_93691 ?auto_93692 ?auto_93693 ?auto_93694 ?auto_93689 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_93903 - OBJ
      ?auto_93904 - OBJ
      ?auto_93905 - OBJ
      ?auto_93906 - OBJ
      ?auto_93907 - OBJ
      ?auto_93902 - LOCATION
    )
    :vars
    (
      ?auto_93908 - LOCATION
      ?auto_93912 - CITY
      ?auto_93913 - LOCATION
      ?auto_93911 - LOCATION
      ?auto_93910 - LOCATION
      ?auto_93909 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_93908 ?auto_93912 ) ( IN-CITY ?auto_93902 ?auto_93912 ) ( not ( = ?auto_93902 ?auto_93908 ) ) ( OBJ-AT ?auto_93904 ?auto_93908 ) ( IN-CITY ?auto_93913 ?auto_93912 ) ( not ( = ?auto_93902 ?auto_93913 ) ) ( OBJ-AT ?auto_93903 ?auto_93913 ) ( IN-CITY ?auto_93911 ?auto_93912 ) ( not ( = ?auto_93902 ?auto_93911 ) ) ( OBJ-AT ?auto_93905 ?auto_93911 ) ( OBJ-AT ?auto_93907 ?auto_93908 ) ( IN-CITY ?auto_93910 ?auto_93912 ) ( not ( = ?auto_93902 ?auto_93910 ) ) ( OBJ-AT ?auto_93906 ?auto_93910 ) ( TRUCK-AT ?auto_93909 ?auto_93902 ) ( not ( = ?auto_93906 ?auto_93907 ) ) ( not ( = ?auto_93908 ?auto_93910 ) ) ( not ( = ?auto_93906 ?auto_93905 ) ) ( not ( = ?auto_93907 ?auto_93905 ) ) ( not ( = ?auto_93911 ?auto_93908 ) ) ( not ( = ?auto_93911 ?auto_93910 ) ) ( not ( = ?auto_93906 ?auto_93903 ) ) ( not ( = ?auto_93907 ?auto_93903 ) ) ( not ( = ?auto_93905 ?auto_93903 ) ) ( not ( = ?auto_93913 ?auto_93911 ) ) ( not ( = ?auto_93913 ?auto_93908 ) ) ( not ( = ?auto_93913 ?auto_93910 ) ) ( not ( = ?auto_93906 ?auto_93904 ) ) ( not ( = ?auto_93907 ?auto_93904 ) ) ( not ( = ?auto_93905 ?auto_93904 ) ) ( not ( = ?auto_93903 ?auto_93904 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_93906 ?auto_93907 ?auto_93905 ?auto_93904 ?auto_93903 ?auto_93902 )
      ( DELIVER-5PKG-VERIFY ?auto_93903 ?auto_93904 ?auto_93905 ?auto_93906 ?auto_93907 ?auto_93902 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_93954 - OBJ
      ?auto_93955 - OBJ
      ?auto_93956 - OBJ
      ?auto_93957 - OBJ
      ?auto_93958 - OBJ
      ?auto_93953 - LOCATION
    )
    :vars
    (
      ?auto_93959 - LOCATION
      ?auto_93963 - CITY
      ?auto_93964 - LOCATION
      ?auto_93962 - LOCATION
      ?auto_93961 - LOCATION
      ?auto_93960 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_93959 ?auto_93963 ) ( IN-CITY ?auto_93953 ?auto_93963 ) ( not ( = ?auto_93953 ?auto_93959 ) ) ( OBJ-AT ?auto_93955 ?auto_93959 ) ( IN-CITY ?auto_93964 ?auto_93963 ) ( not ( = ?auto_93953 ?auto_93964 ) ) ( OBJ-AT ?auto_93954 ?auto_93964 ) ( IN-CITY ?auto_93962 ?auto_93963 ) ( not ( = ?auto_93953 ?auto_93962 ) ) ( OBJ-AT ?auto_93956 ?auto_93962 ) ( OBJ-AT ?auto_93957 ?auto_93959 ) ( IN-CITY ?auto_93961 ?auto_93963 ) ( not ( = ?auto_93953 ?auto_93961 ) ) ( OBJ-AT ?auto_93958 ?auto_93961 ) ( TRUCK-AT ?auto_93960 ?auto_93953 ) ( not ( = ?auto_93958 ?auto_93957 ) ) ( not ( = ?auto_93959 ?auto_93961 ) ) ( not ( = ?auto_93958 ?auto_93956 ) ) ( not ( = ?auto_93957 ?auto_93956 ) ) ( not ( = ?auto_93962 ?auto_93959 ) ) ( not ( = ?auto_93962 ?auto_93961 ) ) ( not ( = ?auto_93958 ?auto_93954 ) ) ( not ( = ?auto_93957 ?auto_93954 ) ) ( not ( = ?auto_93956 ?auto_93954 ) ) ( not ( = ?auto_93964 ?auto_93962 ) ) ( not ( = ?auto_93964 ?auto_93959 ) ) ( not ( = ?auto_93964 ?auto_93961 ) ) ( not ( = ?auto_93958 ?auto_93955 ) ) ( not ( = ?auto_93957 ?auto_93955 ) ) ( not ( = ?auto_93956 ?auto_93955 ) ) ( not ( = ?auto_93954 ?auto_93955 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_93958 ?auto_93957 ?auto_93956 ?auto_93955 ?auto_93954 ?auto_93953 )
      ( DELIVER-5PKG-VERIFY ?auto_93954 ?auto_93955 ?auto_93956 ?auto_93957 ?auto_93958 ?auto_93953 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_95441 - OBJ
      ?auto_95442 - OBJ
      ?auto_95443 - OBJ
      ?auto_95444 - OBJ
      ?auto_95445 - OBJ
      ?auto_95440 - LOCATION
    )
    :vars
    (
      ?auto_95446 - LOCATION
      ?auto_95450 - CITY
      ?auto_95451 - LOCATION
      ?auto_95449 - LOCATION
      ?auto_95448 - LOCATION
      ?auto_95447 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_95446 ?auto_95450 ) ( IN-CITY ?auto_95440 ?auto_95450 ) ( not ( = ?auto_95440 ?auto_95446 ) ) ( OBJ-AT ?auto_95441 ?auto_95446 ) ( IN-CITY ?auto_95451 ?auto_95450 ) ( not ( = ?auto_95440 ?auto_95451 ) ) ( OBJ-AT ?auto_95445 ?auto_95451 ) ( IN-CITY ?auto_95449 ?auto_95450 ) ( not ( = ?auto_95440 ?auto_95449 ) ) ( OBJ-AT ?auto_95444 ?auto_95449 ) ( OBJ-AT ?auto_95443 ?auto_95446 ) ( IN-CITY ?auto_95448 ?auto_95450 ) ( not ( = ?auto_95440 ?auto_95448 ) ) ( OBJ-AT ?auto_95442 ?auto_95448 ) ( TRUCK-AT ?auto_95447 ?auto_95440 ) ( not ( = ?auto_95442 ?auto_95443 ) ) ( not ( = ?auto_95446 ?auto_95448 ) ) ( not ( = ?auto_95442 ?auto_95444 ) ) ( not ( = ?auto_95443 ?auto_95444 ) ) ( not ( = ?auto_95449 ?auto_95446 ) ) ( not ( = ?auto_95449 ?auto_95448 ) ) ( not ( = ?auto_95442 ?auto_95445 ) ) ( not ( = ?auto_95443 ?auto_95445 ) ) ( not ( = ?auto_95444 ?auto_95445 ) ) ( not ( = ?auto_95451 ?auto_95449 ) ) ( not ( = ?auto_95451 ?auto_95446 ) ) ( not ( = ?auto_95451 ?auto_95448 ) ) ( not ( = ?auto_95442 ?auto_95441 ) ) ( not ( = ?auto_95443 ?auto_95441 ) ) ( not ( = ?auto_95444 ?auto_95441 ) ) ( not ( = ?auto_95445 ?auto_95441 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_95442 ?auto_95443 ?auto_95444 ?auto_95441 ?auto_95445 ?auto_95440 )
      ( DELIVER-5PKG-VERIFY ?auto_95441 ?auto_95442 ?auto_95443 ?auto_95444 ?auto_95445 ?auto_95440 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_95492 - OBJ
      ?auto_95493 - OBJ
      ?auto_95494 - OBJ
      ?auto_95495 - OBJ
      ?auto_95496 - OBJ
      ?auto_95491 - LOCATION
    )
    :vars
    (
      ?auto_95497 - LOCATION
      ?auto_95501 - CITY
      ?auto_95502 - LOCATION
      ?auto_95500 - LOCATION
      ?auto_95499 - LOCATION
      ?auto_95498 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_95497 ?auto_95501 ) ( IN-CITY ?auto_95491 ?auto_95501 ) ( not ( = ?auto_95491 ?auto_95497 ) ) ( OBJ-AT ?auto_95492 ?auto_95497 ) ( IN-CITY ?auto_95502 ?auto_95501 ) ( not ( = ?auto_95491 ?auto_95502 ) ) ( OBJ-AT ?auto_95495 ?auto_95502 ) ( IN-CITY ?auto_95500 ?auto_95501 ) ( not ( = ?auto_95491 ?auto_95500 ) ) ( OBJ-AT ?auto_95496 ?auto_95500 ) ( OBJ-AT ?auto_95494 ?auto_95497 ) ( IN-CITY ?auto_95499 ?auto_95501 ) ( not ( = ?auto_95491 ?auto_95499 ) ) ( OBJ-AT ?auto_95493 ?auto_95499 ) ( TRUCK-AT ?auto_95498 ?auto_95491 ) ( not ( = ?auto_95493 ?auto_95494 ) ) ( not ( = ?auto_95497 ?auto_95499 ) ) ( not ( = ?auto_95493 ?auto_95496 ) ) ( not ( = ?auto_95494 ?auto_95496 ) ) ( not ( = ?auto_95500 ?auto_95497 ) ) ( not ( = ?auto_95500 ?auto_95499 ) ) ( not ( = ?auto_95493 ?auto_95495 ) ) ( not ( = ?auto_95494 ?auto_95495 ) ) ( not ( = ?auto_95496 ?auto_95495 ) ) ( not ( = ?auto_95502 ?auto_95500 ) ) ( not ( = ?auto_95502 ?auto_95497 ) ) ( not ( = ?auto_95502 ?auto_95499 ) ) ( not ( = ?auto_95493 ?auto_95492 ) ) ( not ( = ?auto_95494 ?auto_95492 ) ) ( not ( = ?auto_95496 ?auto_95492 ) ) ( not ( = ?auto_95495 ?auto_95492 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_95493 ?auto_95494 ?auto_95496 ?auto_95492 ?auto_95495 ?auto_95491 )
      ( DELIVER-5PKG-VERIFY ?auto_95492 ?auto_95493 ?auto_95494 ?auto_95495 ?auto_95496 ?auto_95491 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_95705 - OBJ
      ?auto_95706 - OBJ
      ?auto_95707 - OBJ
      ?auto_95708 - OBJ
      ?auto_95709 - OBJ
      ?auto_95704 - LOCATION
    )
    :vars
    (
      ?auto_95710 - LOCATION
      ?auto_95714 - CITY
      ?auto_95715 - LOCATION
      ?auto_95713 - LOCATION
      ?auto_95712 - LOCATION
      ?auto_95711 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_95710 ?auto_95714 ) ( IN-CITY ?auto_95704 ?auto_95714 ) ( not ( = ?auto_95704 ?auto_95710 ) ) ( OBJ-AT ?auto_95705 ?auto_95710 ) ( IN-CITY ?auto_95715 ?auto_95714 ) ( not ( = ?auto_95704 ?auto_95715 ) ) ( OBJ-AT ?auto_95709 ?auto_95715 ) ( IN-CITY ?auto_95713 ?auto_95714 ) ( not ( = ?auto_95704 ?auto_95713 ) ) ( OBJ-AT ?auto_95707 ?auto_95713 ) ( OBJ-AT ?auto_95708 ?auto_95710 ) ( IN-CITY ?auto_95712 ?auto_95714 ) ( not ( = ?auto_95704 ?auto_95712 ) ) ( OBJ-AT ?auto_95706 ?auto_95712 ) ( TRUCK-AT ?auto_95711 ?auto_95704 ) ( not ( = ?auto_95706 ?auto_95708 ) ) ( not ( = ?auto_95710 ?auto_95712 ) ) ( not ( = ?auto_95706 ?auto_95707 ) ) ( not ( = ?auto_95708 ?auto_95707 ) ) ( not ( = ?auto_95713 ?auto_95710 ) ) ( not ( = ?auto_95713 ?auto_95712 ) ) ( not ( = ?auto_95706 ?auto_95709 ) ) ( not ( = ?auto_95708 ?auto_95709 ) ) ( not ( = ?auto_95707 ?auto_95709 ) ) ( not ( = ?auto_95715 ?auto_95713 ) ) ( not ( = ?auto_95715 ?auto_95710 ) ) ( not ( = ?auto_95715 ?auto_95712 ) ) ( not ( = ?auto_95706 ?auto_95705 ) ) ( not ( = ?auto_95708 ?auto_95705 ) ) ( not ( = ?auto_95707 ?auto_95705 ) ) ( not ( = ?auto_95709 ?auto_95705 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_95706 ?auto_95708 ?auto_95707 ?auto_95705 ?auto_95709 ?auto_95704 )
      ( DELIVER-5PKG-VERIFY ?auto_95705 ?auto_95706 ?auto_95707 ?auto_95708 ?auto_95709 ?auto_95704 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_95811 - OBJ
      ?auto_95812 - OBJ
      ?auto_95813 - OBJ
      ?auto_95814 - OBJ
      ?auto_95815 - OBJ
      ?auto_95810 - LOCATION
    )
    :vars
    (
      ?auto_95816 - LOCATION
      ?auto_95820 - CITY
      ?auto_95821 - LOCATION
      ?auto_95819 - LOCATION
      ?auto_95818 - LOCATION
      ?auto_95817 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_95816 ?auto_95820 ) ( IN-CITY ?auto_95810 ?auto_95820 ) ( not ( = ?auto_95810 ?auto_95816 ) ) ( OBJ-AT ?auto_95811 ?auto_95816 ) ( IN-CITY ?auto_95821 ?auto_95820 ) ( not ( = ?auto_95810 ?auto_95821 ) ) ( OBJ-AT ?auto_95814 ?auto_95821 ) ( IN-CITY ?auto_95819 ?auto_95820 ) ( not ( = ?auto_95810 ?auto_95819 ) ) ( OBJ-AT ?auto_95813 ?auto_95819 ) ( OBJ-AT ?auto_95815 ?auto_95816 ) ( IN-CITY ?auto_95818 ?auto_95820 ) ( not ( = ?auto_95810 ?auto_95818 ) ) ( OBJ-AT ?auto_95812 ?auto_95818 ) ( TRUCK-AT ?auto_95817 ?auto_95810 ) ( not ( = ?auto_95812 ?auto_95815 ) ) ( not ( = ?auto_95816 ?auto_95818 ) ) ( not ( = ?auto_95812 ?auto_95813 ) ) ( not ( = ?auto_95815 ?auto_95813 ) ) ( not ( = ?auto_95819 ?auto_95816 ) ) ( not ( = ?auto_95819 ?auto_95818 ) ) ( not ( = ?auto_95812 ?auto_95814 ) ) ( not ( = ?auto_95815 ?auto_95814 ) ) ( not ( = ?auto_95813 ?auto_95814 ) ) ( not ( = ?auto_95821 ?auto_95819 ) ) ( not ( = ?auto_95821 ?auto_95816 ) ) ( not ( = ?auto_95821 ?auto_95818 ) ) ( not ( = ?auto_95812 ?auto_95811 ) ) ( not ( = ?auto_95815 ?auto_95811 ) ) ( not ( = ?auto_95813 ?auto_95811 ) ) ( not ( = ?auto_95814 ?auto_95811 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_95812 ?auto_95815 ?auto_95813 ?auto_95811 ?auto_95814 ?auto_95810 )
      ( DELIVER-5PKG-VERIFY ?auto_95811 ?auto_95812 ?auto_95813 ?auto_95814 ?auto_95815 ?auto_95810 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_96024 - OBJ
      ?auto_96025 - OBJ
      ?auto_96026 - OBJ
      ?auto_96027 - OBJ
      ?auto_96028 - OBJ
      ?auto_96023 - LOCATION
    )
    :vars
    (
      ?auto_96029 - LOCATION
      ?auto_96033 - CITY
      ?auto_96034 - LOCATION
      ?auto_96032 - LOCATION
      ?auto_96031 - LOCATION
      ?auto_96030 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_96029 ?auto_96033 ) ( IN-CITY ?auto_96023 ?auto_96033 ) ( not ( = ?auto_96023 ?auto_96029 ) ) ( OBJ-AT ?auto_96024 ?auto_96029 ) ( IN-CITY ?auto_96034 ?auto_96033 ) ( not ( = ?auto_96023 ?auto_96034 ) ) ( OBJ-AT ?auto_96026 ?auto_96034 ) ( IN-CITY ?auto_96032 ?auto_96033 ) ( not ( = ?auto_96023 ?auto_96032 ) ) ( OBJ-AT ?auto_96028 ?auto_96032 ) ( OBJ-AT ?auto_96027 ?auto_96029 ) ( IN-CITY ?auto_96031 ?auto_96033 ) ( not ( = ?auto_96023 ?auto_96031 ) ) ( OBJ-AT ?auto_96025 ?auto_96031 ) ( TRUCK-AT ?auto_96030 ?auto_96023 ) ( not ( = ?auto_96025 ?auto_96027 ) ) ( not ( = ?auto_96029 ?auto_96031 ) ) ( not ( = ?auto_96025 ?auto_96028 ) ) ( not ( = ?auto_96027 ?auto_96028 ) ) ( not ( = ?auto_96032 ?auto_96029 ) ) ( not ( = ?auto_96032 ?auto_96031 ) ) ( not ( = ?auto_96025 ?auto_96026 ) ) ( not ( = ?auto_96027 ?auto_96026 ) ) ( not ( = ?auto_96028 ?auto_96026 ) ) ( not ( = ?auto_96034 ?auto_96032 ) ) ( not ( = ?auto_96034 ?auto_96029 ) ) ( not ( = ?auto_96034 ?auto_96031 ) ) ( not ( = ?auto_96025 ?auto_96024 ) ) ( not ( = ?auto_96027 ?auto_96024 ) ) ( not ( = ?auto_96028 ?auto_96024 ) ) ( not ( = ?auto_96026 ?auto_96024 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_96025 ?auto_96027 ?auto_96028 ?auto_96024 ?auto_96026 ?auto_96023 )
      ( DELIVER-5PKG-VERIFY ?auto_96024 ?auto_96025 ?auto_96026 ?auto_96027 ?auto_96028 ?auto_96023 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_96075 - OBJ
      ?auto_96076 - OBJ
      ?auto_96077 - OBJ
      ?auto_96078 - OBJ
      ?auto_96079 - OBJ
      ?auto_96074 - LOCATION
    )
    :vars
    (
      ?auto_96080 - LOCATION
      ?auto_96084 - CITY
      ?auto_96085 - LOCATION
      ?auto_96083 - LOCATION
      ?auto_96082 - LOCATION
      ?auto_96081 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_96080 ?auto_96084 ) ( IN-CITY ?auto_96074 ?auto_96084 ) ( not ( = ?auto_96074 ?auto_96080 ) ) ( OBJ-AT ?auto_96075 ?auto_96080 ) ( IN-CITY ?auto_96085 ?auto_96084 ) ( not ( = ?auto_96074 ?auto_96085 ) ) ( OBJ-AT ?auto_96077 ?auto_96085 ) ( IN-CITY ?auto_96083 ?auto_96084 ) ( not ( = ?auto_96074 ?auto_96083 ) ) ( OBJ-AT ?auto_96078 ?auto_96083 ) ( OBJ-AT ?auto_96079 ?auto_96080 ) ( IN-CITY ?auto_96082 ?auto_96084 ) ( not ( = ?auto_96074 ?auto_96082 ) ) ( OBJ-AT ?auto_96076 ?auto_96082 ) ( TRUCK-AT ?auto_96081 ?auto_96074 ) ( not ( = ?auto_96076 ?auto_96079 ) ) ( not ( = ?auto_96080 ?auto_96082 ) ) ( not ( = ?auto_96076 ?auto_96078 ) ) ( not ( = ?auto_96079 ?auto_96078 ) ) ( not ( = ?auto_96083 ?auto_96080 ) ) ( not ( = ?auto_96083 ?auto_96082 ) ) ( not ( = ?auto_96076 ?auto_96077 ) ) ( not ( = ?auto_96079 ?auto_96077 ) ) ( not ( = ?auto_96078 ?auto_96077 ) ) ( not ( = ?auto_96085 ?auto_96083 ) ) ( not ( = ?auto_96085 ?auto_96080 ) ) ( not ( = ?auto_96085 ?auto_96082 ) ) ( not ( = ?auto_96076 ?auto_96075 ) ) ( not ( = ?auto_96079 ?auto_96075 ) ) ( not ( = ?auto_96078 ?auto_96075 ) ) ( not ( = ?auto_96077 ?auto_96075 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_96076 ?auto_96079 ?auto_96078 ?auto_96075 ?auto_96077 ?auto_96074 )
      ( DELIVER-5PKG-VERIFY ?auto_96075 ?auto_96076 ?auto_96077 ?auto_96078 ?auto_96079 ?auto_96074 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_96785 - OBJ
      ?auto_96786 - OBJ
      ?auto_96787 - OBJ
      ?auto_96788 - OBJ
      ?auto_96789 - OBJ
      ?auto_96784 - LOCATION
    )
    :vars
    (
      ?auto_96790 - LOCATION
      ?auto_96794 - CITY
      ?auto_96795 - LOCATION
      ?auto_96793 - LOCATION
      ?auto_96792 - LOCATION
      ?auto_96791 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_96790 ?auto_96794 ) ( IN-CITY ?auto_96784 ?auto_96794 ) ( not ( = ?auto_96784 ?auto_96790 ) ) ( OBJ-AT ?auto_96785 ?auto_96790 ) ( IN-CITY ?auto_96795 ?auto_96794 ) ( not ( = ?auto_96784 ?auto_96795 ) ) ( OBJ-AT ?auto_96789 ?auto_96795 ) ( IN-CITY ?auto_96793 ?auto_96794 ) ( not ( = ?auto_96784 ?auto_96793 ) ) ( OBJ-AT ?auto_96788 ?auto_96793 ) ( OBJ-AT ?auto_96786 ?auto_96790 ) ( IN-CITY ?auto_96792 ?auto_96794 ) ( not ( = ?auto_96784 ?auto_96792 ) ) ( OBJ-AT ?auto_96787 ?auto_96792 ) ( TRUCK-AT ?auto_96791 ?auto_96784 ) ( not ( = ?auto_96787 ?auto_96786 ) ) ( not ( = ?auto_96790 ?auto_96792 ) ) ( not ( = ?auto_96787 ?auto_96788 ) ) ( not ( = ?auto_96786 ?auto_96788 ) ) ( not ( = ?auto_96793 ?auto_96790 ) ) ( not ( = ?auto_96793 ?auto_96792 ) ) ( not ( = ?auto_96787 ?auto_96789 ) ) ( not ( = ?auto_96786 ?auto_96789 ) ) ( not ( = ?auto_96788 ?auto_96789 ) ) ( not ( = ?auto_96795 ?auto_96793 ) ) ( not ( = ?auto_96795 ?auto_96790 ) ) ( not ( = ?auto_96795 ?auto_96792 ) ) ( not ( = ?auto_96787 ?auto_96785 ) ) ( not ( = ?auto_96786 ?auto_96785 ) ) ( not ( = ?auto_96788 ?auto_96785 ) ) ( not ( = ?auto_96789 ?auto_96785 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_96787 ?auto_96786 ?auto_96788 ?auto_96785 ?auto_96789 ?auto_96784 )
      ( DELIVER-5PKG-VERIFY ?auto_96785 ?auto_96786 ?auto_96787 ?auto_96788 ?auto_96789 ?auto_96784 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_96836 - OBJ
      ?auto_96837 - OBJ
      ?auto_96838 - OBJ
      ?auto_96839 - OBJ
      ?auto_96840 - OBJ
      ?auto_96835 - LOCATION
    )
    :vars
    (
      ?auto_96841 - LOCATION
      ?auto_96845 - CITY
      ?auto_96846 - LOCATION
      ?auto_96844 - LOCATION
      ?auto_96843 - LOCATION
      ?auto_96842 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_96841 ?auto_96845 ) ( IN-CITY ?auto_96835 ?auto_96845 ) ( not ( = ?auto_96835 ?auto_96841 ) ) ( OBJ-AT ?auto_96836 ?auto_96841 ) ( IN-CITY ?auto_96846 ?auto_96845 ) ( not ( = ?auto_96835 ?auto_96846 ) ) ( OBJ-AT ?auto_96839 ?auto_96846 ) ( IN-CITY ?auto_96844 ?auto_96845 ) ( not ( = ?auto_96835 ?auto_96844 ) ) ( OBJ-AT ?auto_96840 ?auto_96844 ) ( OBJ-AT ?auto_96837 ?auto_96841 ) ( IN-CITY ?auto_96843 ?auto_96845 ) ( not ( = ?auto_96835 ?auto_96843 ) ) ( OBJ-AT ?auto_96838 ?auto_96843 ) ( TRUCK-AT ?auto_96842 ?auto_96835 ) ( not ( = ?auto_96838 ?auto_96837 ) ) ( not ( = ?auto_96841 ?auto_96843 ) ) ( not ( = ?auto_96838 ?auto_96840 ) ) ( not ( = ?auto_96837 ?auto_96840 ) ) ( not ( = ?auto_96844 ?auto_96841 ) ) ( not ( = ?auto_96844 ?auto_96843 ) ) ( not ( = ?auto_96838 ?auto_96839 ) ) ( not ( = ?auto_96837 ?auto_96839 ) ) ( not ( = ?auto_96840 ?auto_96839 ) ) ( not ( = ?auto_96846 ?auto_96844 ) ) ( not ( = ?auto_96846 ?auto_96841 ) ) ( not ( = ?auto_96846 ?auto_96843 ) ) ( not ( = ?auto_96838 ?auto_96836 ) ) ( not ( = ?auto_96837 ?auto_96836 ) ) ( not ( = ?auto_96840 ?auto_96836 ) ) ( not ( = ?auto_96839 ?auto_96836 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_96838 ?auto_96837 ?auto_96840 ?auto_96836 ?auto_96839 ?auto_96835 )
      ( DELIVER-5PKG-VERIFY ?auto_96836 ?auto_96837 ?auto_96838 ?auto_96839 ?auto_96840 ?auto_96835 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_97329 - OBJ
      ?auto_97330 - OBJ
      ?auto_97331 - OBJ
      ?auto_97332 - OBJ
      ?auto_97333 - OBJ
      ?auto_97328 - LOCATION
    )
    :vars
    (
      ?auto_97334 - LOCATION
      ?auto_97338 - CITY
      ?auto_97339 - LOCATION
      ?auto_97337 - LOCATION
      ?auto_97336 - LOCATION
      ?auto_97335 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_97334 ?auto_97338 ) ( IN-CITY ?auto_97328 ?auto_97338 ) ( not ( = ?auto_97328 ?auto_97334 ) ) ( OBJ-AT ?auto_97329 ?auto_97334 ) ( IN-CITY ?auto_97339 ?auto_97338 ) ( not ( = ?auto_97328 ?auto_97339 ) ) ( OBJ-AT ?auto_97333 ?auto_97339 ) ( IN-CITY ?auto_97337 ?auto_97338 ) ( not ( = ?auto_97328 ?auto_97337 ) ) ( OBJ-AT ?auto_97331 ?auto_97337 ) ( OBJ-AT ?auto_97330 ?auto_97334 ) ( IN-CITY ?auto_97336 ?auto_97338 ) ( not ( = ?auto_97328 ?auto_97336 ) ) ( OBJ-AT ?auto_97332 ?auto_97336 ) ( TRUCK-AT ?auto_97335 ?auto_97328 ) ( not ( = ?auto_97332 ?auto_97330 ) ) ( not ( = ?auto_97334 ?auto_97336 ) ) ( not ( = ?auto_97332 ?auto_97331 ) ) ( not ( = ?auto_97330 ?auto_97331 ) ) ( not ( = ?auto_97337 ?auto_97334 ) ) ( not ( = ?auto_97337 ?auto_97336 ) ) ( not ( = ?auto_97332 ?auto_97333 ) ) ( not ( = ?auto_97330 ?auto_97333 ) ) ( not ( = ?auto_97331 ?auto_97333 ) ) ( not ( = ?auto_97339 ?auto_97337 ) ) ( not ( = ?auto_97339 ?auto_97334 ) ) ( not ( = ?auto_97339 ?auto_97336 ) ) ( not ( = ?auto_97332 ?auto_97329 ) ) ( not ( = ?auto_97330 ?auto_97329 ) ) ( not ( = ?auto_97331 ?auto_97329 ) ) ( not ( = ?auto_97333 ?auto_97329 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_97332 ?auto_97330 ?auto_97331 ?auto_97329 ?auto_97333 ?auto_97328 )
      ( DELIVER-5PKG-VERIFY ?auto_97329 ?auto_97330 ?auto_97331 ?auto_97332 ?auto_97333 ?auto_97328 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_97490 - OBJ
      ?auto_97491 - OBJ
      ?auto_97492 - OBJ
      ?auto_97493 - OBJ
      ?auto_97494 - OBJ
      ?auto_97489 - LOCATION
    )
    :vars
    (
      ?auto_97495 - LOCATION
      ?auto_97499 - CITY
      ?auto_97500 - LOCATION
      ?auto_97498 - LOCATION
      ?auto_97497 - LOCATION
      ?auto_97496 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_97495 ?auto_97499 ) ( IN-CITY ?auto_97489 ?auto_97499 ) ( not ( = ?auto_97489 ?auto_97495 ) ) ( OBJ-AT ?auto_97490 ?auto_97495 ) ( IN-CITY ?auto_97500 ?auto_97499 ) ( not ( = ?auto_97489 ?auto_97500 ) ) ( OBJ-AT ?auto_97493 ?auto_97500 ) ( IN-CITY ?auto_97498 ?auto_97499 ) ( not ( = ?auto_97489 ?auto_97498 ) ) ( OBJ-AT ?auto_97492 ?auto_97498 ) ( OBJ-AT ?auto_97491 ?auto_97495 ) ( IN-CITY ?auto_97497 ?auto_97499 ) ( not ( = ?auto_97489 ?auto_97497 ) ) ( OBJ-AT ?auto_97494 ?auto_97497 ) ( TRUCK-AT ?auto_97496 ?auto_97489 ) ( not ( = ?auto_97494 ?auto_97491 ) ) ( not ( = ?auto_97495 ?auto_97497 ) ) ( not ( = ?auto_97494 ?auto_97492 ) ) ( not ( = ?auto_97491 ?auto_97492 ) ) ( not ( = ?auto_97498 ?auto_97495 ) ) ( not ( = ?auto_97498 ?auto_97497 ) ) ( not ( = ?auto_97494 ?auto_97493 ) ) ( not ( = ?auto_97491 ?auto_97493 ) ) ( not ( = ?auto_97492 ?auto_97493 ) ) ( not ( = ?auto_97500 ?auto_97498 ) ) ( not ( = ?auto_97500 ?auto_97495 ) ) ( not ( = ?auto_97500 ?auto_97497 ) ) ( not ( = ?auto_97494 ?auto_97490 ) ) ( not ( = ?auto_97491 ?auto_97490 ) ) ( not ( = ?auto_97492 ?auto_97490 ) ) ( not ( = ?auto_97493 ?auto_97490 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_97494 ?auto_97491 ?auto_97492 ?auto_97490 ?auto_97493 ?auto_97489 )
      ( DELIVER-5PKG-VERIFY ?auto_97490 ?auto_97491 ?auto_97492 ?auto_97493 ?auto_97494 ?auto_97489 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_97648 - OBJ
      ?auto_97649 - OBJ
      ?auto_97650 - OBJ
      ?auto_97651 - OBJ
      ?auto_97652 - OBJ
      ?auto_97647 - LOCATION
    )
    :vars
    (
      ?auto_97653 - LOCATION
      ?auto_97657 - CITY
      ?auto_97658 - LOCATION
      ?auto_97656 - LOCATION
      ?auto_97655 - LOCATION
      ?auto_97654 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_97653 ?auto_97657 ) ( IN-CITY ?auto_97647 ?auto_97657 ) ( not ( = ?auto_97647 ?auto_97653 ) ) ( OBJ-AT ?auto_97648 ?auto_97653 ) ( IN-CITY ?auto_97658 ?auto_97657 ) ( not ( = ?auto_97647 ?auto_97658 ) ) ( OBJ-AT ?auto_97650 ?auto_97658 ) ( IN-CITY ?auto_97656 ?auto_97657 ) ( not ( = ?auto_97647 ?auto_97656 ) ) ( OBJ-AT ?auto_97652 ?auto_97656 ) ( OBJ-AT ?auto_97649 ?auto_97653 ) ( IN-CITY ?auto_97655 ?auto_97657 ) ( not ( = ?auto_97647 ?auto_97655 ) ) ( OBJ-AT ?auto_97651 ?auto_97655 ) ( TRUCK-AT ?auto_97654 ?auto_97647 ) ( not ( = ?auto_97651 ?auto_97649 ) ) ( not ( = ?auto_97653 ?auto_97655 ) ) ( not ( = ?auto_97651 ?auto_97652 ) ) ( not ( = ?auto_97649 ?auto_97652 ) ) ( not ( = ?auto_97656 ?auto_97653 ) ) ( not ( = ?auto_97656 ?auto_97655 ) ) ( not ( = ?auto_97651 ?auto_97650 ) ) ( not ( = ?auto_97649 ?auto_97650 ) ) ( not ( = ?auto_97652 ?auto_97650 ) ) ( not ( = ?auto_97658 ?auto_97656 ) ) ( not ( = ?auto_97658 ?auto_97653 ) ) ( not ( = ?auto_97658 ?auto_97655 ) ) ( not ( = ?auto_97651 ?auto_97648 ) ) ( not ( = ?auto_97649 ?auto_97648 ) ) ( not ( = ?auto_97652 ?auto_97648 ) ) ( not ( = ?auto_97650 ?auto_97648 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_97651 ?auto_97649 ?auto_97652 ?auto_97648 ?auto_97650 ?auto_97647 )
      ( DELIVER-5PKG-VERIFY ?auto_97648 ?auto_97649 ?auto_97650 ?auto_97651 ?auto_97652 ?auto_97647 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_97754 - OBJ
      ?auto_97755 - OBJ
      ?auto_97756 - OBJ
      ?auto_97757 - OBJ
      ?auto_97758 - OBJ
      ?auto_97753 - LOCATION
    )
    :vars
    (
      ?auto_97759 - LOCATION
      ?auto_97763 - CITY
      ?auto_97764 - LOCATION
      ?auto_97762 - LOCATION
      ?auto_97761 - LOCATION
      ?auto_97760 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_97759 ?auto_97763 ) ( IN-CITY ?auto_97753 ?auto_97763 ) ( not ( = ?auto_97753 ?auto_97759 ) ) ( OBJ-AT ?auto_97754 ?auto_97759 ) ( IN-CITY ?auto_97764 ?auto_97763 ) ( not ( = ?auto_97753 ?auto_97764 ) ) ( OBJ-AT ?auto_97756 ?auto_97764 ) ( IN-CITY ?auto_97762 ?auto_97763 ) ( not ( = ?auto_97753 ?auto_97762 ) ) ( OBJ-AT ?auto_97757 ?auto_97762 ) ( OBJ-AT ?auto_97755 ?auto_97759 ) ( IN-CITY ?auto_97761 ?auto_97763 ) ( not ( = ?auto_97753 ?auto_97761 ) ) ( OBJ-AT ?auto_97758 ?auto_97761 ) ( TRUCK-AT ?auto_97760 ?auto_97753 ) ( not ( = ?auto_97758 ?auto_97755 ) ) ( not ( = ?auto_97759 ?auto_97761 ) ) ( not ( = ?auto_97758 ?auto_97757 ) ) ( not ( = ?auto_97755 ?auto_97757 ) ) ( not ( = ?auto_97762 ?auto_97759 ) ) ( not ( = ?auto_97762 ?auto_97761 ) ) ( not ( = ?auto_97758 ?auto_97756 ) ) ( not ( = ?auto_97755 ?auto_97756 ) ) ( not ( = ?auto_97757 ?auto_97756 ) ) ( not ( = ?auto_97764 ?auto_97762 ) ) ( not ( = ?auto_97764 ?auto_97759 ) ) ( not ( = ?auto_97764 ?auto_97761 ) ) ( not ( = ?auto_97758 ?auto_97754 ) ) ( not ( = ?auto_97755 ?auto_97754 ) ) ( not ( = ?auto_97757 ?auto_97754 ) ) ( not ( = ?auto_97756 ?auto_97754 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_97758 ?auto_97755 ?auto_97757 ?auto_97754 ?auto_97756 ?auto_97753 )
      ( DELIVER-5PKG-VERIFY ?auto_97754 ?auto_97755 ?auto_97756 ?auto_97757 ?auto_97758 ?auto_97753 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_98409 - OBJ
      ?auto_98410 - OBJ
      ?auto_98411 - OBJ
      ?auto_98412 - OBJ
      ?auto_98413 - OBJ
      ?auto_98408 - LOCATION
    )
    :vars
    (
      ?auto_98414 - LOCATION
      ?auto_98418 - CITY
      ?auto_98419 - LOCATION
      ?auto_98417 - LOCATION
      ?auto_98416 - LOCATION
      ?auto_98415 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_98414 ?auto_98418 ) ( IN-CITY ?auto_98408 ?auto_98418 ) ( not ( = ?auto_98408 ?auto_98414 ) ) ( OBJ-AT ?auto_98409 ?auto_98414 ) ( IN-CITY ?auto_98419 ?auto_98418 ) ( not ( = ?auto_98408 ?auto_98419 ) ) ( OBJ-AT ?auto_98413 ?auto_98419 ) ( IN-CITY ?auto_98417 ?auto_98418 ) ( not ( = ?auto_98408 ?auto_98417 ) ) ( OBJ-AT ?auto_98410 ?auto_98417 ) ( OBJ-AT ?auto_98412 ?auto_98414 ) ( IN-CITY ?auto_98416 ?auto_98418 ) ( not ( = ?auto_98408 ?auto_98416 ) ) ( OBJ-AT ?auto_98411 ?auto_98416 ) ( TRUCK-AT ?auto_98415 ?auto_98408 ) ( not ( = ?auto_98411 ?auto_98412 ) ) ( not ( = ?auto_98414 ?auto_98416 ) ) ( not ( = ?auto_98411 ?auto_98410 ) ) ( not ( = ?auto_98412 ?auto_98410 ) ) ( not ( = ?auto_98417 ?auto_98414 ) ) ( not ( = ?auto_98417 ?auto_98416 ) ) ( not ( = ?auto_98411 ?auto_98413 ) ) ( not ( = ?auto_98412 ?auto_98413 ) ) ( not ( = ?auto_98410 ?auto_98413 ) ) ( not ( = ?auto_98419 ?auto_98417 ) ) ( not ( = ?auto_98419 ?auto_98414 ) ) ( not ( = ?auto_98419 ?auto_98416 ) ) ( not ( = ?auto_98411 ?auto_98409 ) ) ( not ( = ?auto_98412 ?auto_98409 ) ) ( not ( = ?auto_98410 ?auto_98409 ) ) ( not ( = ?auto_98413 ?auto_98409 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_98411 ?auto_98412 ?auto_98410 ?auto_98409 ?auto_98413 ?auto_98408 )
      ( DELIVER-5PKG-VERIFY ?auto_98409 ?auto_98410 ?auto_98411 ?auto_98412 ?auto_98413 ?auto_98408 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_98515 - OBJ
      ?auto_98516 - OBJ
      ?auto_98517 - OBJ
      ?auto_98518 - OBJ
      ?auto_98519 - OBJ
      ?auto_98514 - LOCATION
    )
    :vars
    (
      ?auto_98520 - LOCATION
      ?auto_98524 - CITY
      ?auto_98525 - LOCATION
      ?auto_98523 - LOCATION
      ?auto_98522 - LOCATION
      ?auto_98521 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_98520 ?auto_98524 ) ( IN-CITY ?auto_98514 ?auto_98524 ) ( not ( = ?auto_98514 ?auto_98520 ) ) ( OBJ-AT ?auto_98515 ?auto_98520 ) ( IN-CITY ?auto_98525 ?auto_98524 ) ( not ( = ?auto_98514 ?auto_98525 ) ) ( OBJ-AT ?auto_98518 ?auto_98525 ) ( IN-CITY ?auto_98523 ?auto_98524 ) ( not ( = ?auto_98514 ?auto_98523 ) ) ( OBJ-AT ?auto_98516 ?auto_98523 ) ( OBJ-AT ?auto_98519 ?auto_98520 ) ( IN-CITY ?auto_98522 ?auto_98524 ) ( not ( = ?auto_98514 ?auto_98522 ) ) ( OBJ-AT ?auto_98517 ?auto_98522 ) ( TRUCK-AT ?auto_98521 ?auto_98514 ) ( not ( = ?auto_98517 ?auto_98519 ) ) ( not ( = ?auto_98520 ?auto_98522 ) ) ( not ( = ?auto_98517 ?auto_98516 ) ) ( not ( = ?auto_98519 ?auto_98516 ) ) ( not ( = ?auto_98523 ?auto_98520 ) ) ( not ( = ?auto_98523 ?auto_98522 ) ) ( not ( = ?auto_98517 ?auto_98518 ) ) ( not ( = ?auto_98519 ?auto_98518 ) ) ( not ( = ?auto_98516 ?auto_98518 ) ) ( not ( = ?auto_98525 ?auto_98523 ) ) ( not ( = ?auto_98525 ?auto_98520 ) ) ( not ( = ?auto_98525 ?auto_98522 ) ) ( not ( = ?auto_98517 ?auto_98515 ) ) ( not ( = ?auto_98519 ?auto_98515 ) ) ( not ( = ?auto_98516 ?auto_98515 ) ) ( not ( = ?auto_98518 ?auto_98515 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_98517 ?auto_98519 ?auto_98516 ?auto_98515 ?auto_98518 ?auto_98514 )
      ( DELIVER-5PKG-VERIFY ?auto_98515 ?auto_98516 ?auto_98517 ?auto_98518 ?auto_98519 ?auto_98514 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_98673 - OBJ
      ?auto_98674 - OBJ
      ?auto_98675 - OBJ
      ?auto_98676 - OBJ
      ?auto_98677 - OBJ
      ?auto_98672 - LOCATION
    )
    :vars
    (
      ?auto_98678 - LOCATION
      ?auto_98682 - CITY
      ?auto_98683 - LOCATION
      ?auto_98681 - LOCATION
      ?auto_98680 - LOCATION
      ?auto_98679 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_98678 ?auto_98682 ) ( IN-CITY ?auto_98672 ?auto_98682 ) ( not ( = ?auto_98672 ?auto_98678 ) ) ( OBJ-AT ?auto_98673 ?auto_98678 ) ( IN-CITY ?auto_98683 ?auto_98682 ) ( not ( = ?auto_98672 ?auto_98683 ) ) ( OBJ-AT ?auto_98677 ?auto_98683 ) ( IN-CITY ?auto_98681 ?auto_98682 ) ( not ( = ?auto_98672 ?auto_98681 ) ) ( OBJ-AT ?auto_98674 ?auto_98681 ) ( OBJ-AT ?auto_98675 ?auto_98678 ) ( IN-CITY ?auto_98680 ?auto_98682 ) ( not ( = ?auto_98672 ?auto_98680 ) ) ( OBJ-AT ?auto_98676 ?auto_98680 ) ( TRUCK-AT ?auto_98679 ?auto_98672 ) ( not ( = ?auto_98676 ?auto_98675 ) ) ( not ( = ?auto_98678 ?auto_98680 ) ) ( not ( = ?auto_98676 ?auto_98674 ) ) ( not ( = ?auto_98675 ?auto_98674 ) ) ( not ( = ?auto_98681 ?auto_98678 ) ) ( not ( = ?auto_98681 ?auto_98680 ) ) ( not ( = ?auto_98676 ?auto_98677 ) ) ( not ( = ?auto_98675 ?auto_98677 ) ) ( not ( = ?auto_98674 ?auto_98677 ) ) ( not ( = ?auto_98683 ?auto_98681 ) ) ( not ( = ?auto_98683 ?auto_98678 ) ) ( not ( = ?auto_98683 ?auto_98680 ) ) ( not ( = ?auto_98676 ?auto_98673 ) ) ( not ( = ?auto_98675 ?auto_98673 ) ) ( not ( = ?auto_98674 ?auto_98673 ) ) ( not ( = ?auto_98677 ?auto_98673 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_98676 ?auto_98675 ?auto_98674 ?auto_98673 ?auto_98677 ?auto_98672 )
      ( DELIVER-5PKG-VERIFY ?auto_98673 ?auto_98674 ?auto_98675 ?auto_98676 ?auto_98677 ?auto_98672 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_98834 - OBJ
      ?auto_98835 - OBJ
      ?auto_98836 - OBJ
      ?auto_98837 - OBJ
      ?auto_98838 - OBJ
      ?auto_98833 - LOCATION
    )
    :vars
    (
      ?auto_98839 - LOCATION
      ?auto_98843 - CITY
      ?auto_98844 - LOCATION
      ?auto_98842 - LOCATION
      ?auto_98841 - LOCATION
      ?auto_98840 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_98839 ?auto_98843 ) ( IN-CITY ?auto_98833 ?auto_98843 ) ( not ( = ?auto_98833 ?auto_98839 ) ) ( OBJ-AT ?auto_98834 ?auto_98839 ) ( IN-CITY ?auto_98844 ?auto_98843 ) ( not ( = ?auto_98833 ?auto_98844 ) ) ( OBJ-AT ?auto_98837 ?auto_98844 ) ( IN-CITY ?auto_98842 ?auto_98843 ) ( not ( = ?auto_98833 ?auto_98842 ) ) ( OBJ-AT ?auto_98835 ?auto_98842 ) ( OBJ-AT ?auto_98836 ?auto_98839 ) ( IN-CITY ?auto_98841 ?auto_98843 ) ( not ( = ?auto_98833 ?auto_98841 ) ) ( OBJ-AT ?auto_98838 ?auto_98841 ) ( TRUCK-AT ?auto_98840 ?auto_98833 ) ( not ( = ?auto_98838 ?auto_98836 ) ) ( not ( = ?auto_98839 ?auto_98841 ) ) ( not ( = ?auto_98838 ?auto_98835 ) ) ( not ( = ?auto_98836 ?auto_98835 ) ) ( not ( = ?auto_98842 ?auto_98839 ) ) ( not ( = ?auto_98842 ?auto_98841 ) ) ( not ( = ?auto_98838 ?auto_98837 ) ) ( not ( = ?auto_98836 ?auto_98837 ) ) ( not ( = ?auto_98835 ?auto_98837 ) ) ( not ( = ?auto_98844 ?auto_98842 ) ) ( not ( = ?auto_98844 ?auto_98839 ) ) ( not ( = ?auto_98844 ?auto_98841 ) ) ( not ( = ?auto_98838 ?auto_98834 ) ) ( not ( = ?auto_98836 ?auto_98834 ) ) ( not ( = ?auto_98835 ?auto_98834 ) ) ( not ( = ?auto_98837 ?auto_98834 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_98838 ?auto_98836 ?auto_98835 ?auto_98834 ?auto_98837 ?auto_98833 )
      ( DELIVER-5PKG-VERIFY ?auto_98834 ?auto_98835 ?auto_98836 ?auto_98837 ?auto_98838 ?auto_98833 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_99327 - OBJ
      ?auto_99328 - OBJ
      ?auto_99329 - OBJ
      ?auto_99330 - OBJ
      ?auto_99331 - OBJ
      ?auto_99326 - LOCATION
    )
    :vars
    (
      ?auto_99332 - LOCATION
      ?auto_99336 - CITY
      ?auto_99337 - LOCATION
      ?auto_99335 - LOCATION
      ?auto_99334 - LOCATION
      ?auto_99333 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_99332 ?auto_99336 ) ( IN-CITY ?auto_99326 ?auto_99336 ) ( not ( = ?auto_99326 ?auto_99332 ) ) ( OBJ-AT ?auto_99327 ?auto_99332 ) ( IN-CITY ?auto_99337 ?auto_99336 ) ( not ( = ?auto_99326 ?auto_99337 ) ) ( OBJ-AT ?auto_99329 ?auto_99337 ) ( IN-CITY ?auto_99335 ?auto_99336 ) ( not ( = ?auto_99326 ?auto_99335 ) ) ( OBJ-AT ?auto_99328 ?auto_99335 ) ( OBJ-AT ?auto_99331 ?auto_99332 ) ( IN-CITY ?auto_99334 ?auto_99336 ) ( not ( = ?auto_99326 ?auto_99334 ) ) ( OBJ-AT ?auto_99330 ?auto_99334 ) ( TRUCK-AT ?auto_99333 ?auto_99326 ) ( not ( = ?auto_99330 ?auto_99331 ) ) ( not ( = ?auto_99332 ?auto_99334 ) ) ( not ( = ?auto_99330 ?auto_99328 ) ) ( not ( = ?auto_99331 ?auto_99328 ) ) ( not ( = ?auto_99335 ?auto_99332 ) ) ( not ( = ?auto_99335 ?auto_99334 ) ) ( not ( = ?auto_99330 ?auto_99329 ) ) ( not ( = ?auto_99331 ?auto_99329 ) ) ( not ( = ?auto_99328 ?auto_99329 ) ) ( not ( = ?auto_99337 ?auto_99335 ) ) ( not ( = ?auto_99337 ?auto_99332 ) ) ( not ( = ?auto_99337 ?auto_99334 ) ) ( not ( = ?auto_99330 ?auto_99327 ) ) ( not ( = ?auto_99331 ?auto_99327 ) ) ( not ( = ?auto_99328 ?auto_99327 ) ) ( not ( = ?auto_99329 ?auto_99327 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_99330 ?auto_99331 ?auto_99328 ?auto_99327 ?auto_99329 ?auto_99326 )
      ( DELIVER-5PKG-VERIFY ?auto_99327 ?auto_99328 ?auto_99329 ?auto_99330 ?auto_99331 ?auto_99326 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_99378 - OBJ
      ?auto_99379 - OBJ
      ?auto_99380 - OBJ
      ?auto_99381 - OBJ
      ?auto_99382 - OBJ
      ?auto_99377 - LOCATION
    )
    :vars
    (
      ?auto_99383 - LOCATION
      ?auto_99387 - CITY
      ?auto_99388 - LOCATION
      ?auto_99386 - LOCATION
      ?auto_99385 - LOCATION
      ?auto_99384 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_99383 ?auto_99387 ) ( IN-CITY ?auto_99377 ?auto_99387 ) ( not ( = ?auto_99377 ?auto_99383 ) ) ( OBJ-AT ?auto_99378 ?auto_99383 ) ( IN-CITY ?auto_99388 ?auto_99387 ) ( not ( = ?auto_99377 ?auto_99388 ) ) ( OBJ-AT ?auto_99380 ?auto_99388 ) ( IN-CITY ?auto_99386 ?auto_99387 ) ( not ( = ?auto_99377 ?auto_99386 ) ) ( OBJ-AT ?auto_99379 ?auto_99386 ) ( OBJ-AT ?auto_99381 ?auto_99383 ) ( IN-CITY ?auto_99385 ?auto_99387 ) ( not ( = ?auto_99377 ?auto_99385 ) ) ( OBJ-AT ?auto_99382 ?auto_99385 ) ( TRUCK-AT ?auto_99384 ?auto_99377 ) ( not ( = ?auto_99382 ?auto_99381 ) ) ( not ( = ?auto_99383 ?auto_99385 ) ) ( not ( = ?auto_99382 ?auto_99379 ) ) ( not ( = ?auto_99381 ?auto_99379 ) ) ( not ( = ?auto_99386 ?auto_99383 ) ) ( not ( = ?auto_99386 ?auto_99385 ) ) ( not ( = ?auto_99382 ?auto_99380 ) ) ( not ( = ?auto_99381 ?auto_99380 ) ) ( not ( = ?auto_99379 ?auto_99380 ) ) ( not ( = ?auto_99388 ?auto_99386 ) ) ( not ( = ?auto_99388 ?auto_99383 ) ) ( not ( = ?auto_99388 ?auto_99385 ) ) ( not ( = ?auto_99382 ?auto_99378 ) ) ( not ( = ?auto_99381 ?auto_99378 ) ) ( not ( = ?auto_99379 ?auto_99378 ) ) ( not ( = ?auto_99380 ?auto_99378 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_99382 ?auto_99381 ?auto_99379 ?auto_99378 ?auto_99380 ?auto_99377 )
      ( DELIVER-5PKG-VERIFY ?auto_99378 ?auto_99379 ?auto_99380 ?auto_99381 ?auto_99382 ?auto_99377 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_100088 - OBJ
      ?auto_100089 - OBJ
      ?auto_100090 - OBJ
      ?auto_100091 - OBJ
      ?auto_100092 - OBJ
      ?auto_100087 - LOCATION
    )
    :vars
    (
      ?auto_100093 - LOCATION
      ?auto_100097 - CITY
      ?auto_100098 - LOCATION
      ?auto_100096 - LOCATION
      ?auto_100095 - LOCATION
      ?auto_100094 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_100093 ?auto_100097 ) ( IN-CITY ?auto_100087 ?auto_100097 ) ( not ( = ?auto_100087 ?auto_100093 ) ) ( OBJ-AT ?auto_100088 ?auto_100093 ) ( IN-CITY ?auto_100098 ?auto_100097 ) ( not ( = ?auto_100087 ?auto_100098 ) ) ( OBJ-AT ?auto_100089 ?auto_100098 ) ( IN-CITY ?auto_100096 ?auto_100097 ) ( not ( = ?auto_100087 ?auto_100096 ) ) ( OBJ-AT ?auto_100092 ?auto_100096 ) ( OBJ-AT ?auto_100091 ?auto_100093 ) ( IN-CITY ?auto_100095 ?auto_100097 ) ( not ( = ?auto_100087 ?auto_100095 ) ) ( OBJ-AT ?auto_100090 ?auto_100095 ) ( TRUCK-AT ?auto_100094 ?auto_100087 ) ( not ( = ?auto_100090 ?auto_100091 ) ) ( not ( = ?auto_100093 ?auto_100095 ) ) ( not ( = ?auto_100090 ?auto_100092 ) ) ( not ( = ?auto_100091 ?auto_100092 ) ) ( not ( = ?auto_100096 ?auto_100093 ) ) ( not ( = ?auto_100096 ?auto_100095 ) ) ( not ( = ?auto_100090 ?auto_100089 ) ) ( not ( = ?auto_100091 ?auto_100089 ) ) ( not ( = ?auto_100092 ?auto_100089 ) ) ( not ( = ?auto_100098 ?auto_100096 ) ) ( not ( = ?auto_100098 ?auto_100093 ) ) ( not ( = ?auto_100098 ?auto_100095 ) ) ( not ( = ?auto_100090 ?auto_100088 ) ) ( not ( = ?auto_100091 ?auto_100088 ) ) ( not ( = ?auto_100092 ?auto_100088 ) ) ( not ( = ?auto_100089 ?auto_100088 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_100090 ?auto_100091 ?auto_100092 ?auto_100088 ?auto_100089 ?auto_100087 )
      ( DELIVER-5PKG-VERIFY ?auto_100088 ?auto_100089 ?auto_100090 ?auto_100091 ?auto_100092 ?auto_100087 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_100139 - OBJ
      ?auto_100140 - OBJ
      ?auto_100141 - OBJ
      ?auto_100142 - OBJ
      ?auto_100143 - OBJ
      ?auto_100138 - LOCATION
    )
    :vars
    (
      ?auto_100144 - LOCATION
      ?auto_100148 - CITY
      ?auto_100149 - LOCATION
      ?auto_100147 - LOCATION
      ?auto_100146 - LOCATION
      ?auto_100145 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_100144 ?auto_100148 ) ( IN-CITY ?auto_100138 ?auto_100148 ) ( not ( = ?auto_100138 ?auto_100144 ) ) ( OBJ-AT ?auto_100139 ?auto_100144 ) ( IN-CITY ?auto_100149 ?auto_100148 ) ( not ( = ?auto_100138 ?auto_100149 ) ) ( OBJ-AT ?auto_100140 ?auto_100149 ) ( IN-CITY ?auto_100147 ?auto_100148 ) ( not ( = ?auto_100138 ?auto_100147 ) ) ( OBJ-AT ?auto_100142 ?auto_100147 ) ( OBJ-AT ?auto_100143 ?auto_100144 ) ( IN-CITY ?auto_100146 ?auto_100148 ) ( not ( = ?auto_100138 ?auto_100146 ) ) ( OBJ-AT ?auto_100141 ?auto_100146 ) ( TRUCK-AT ?auto_100145 ?auto_100138 ) ( not ( = ?auto_100141 ?auto_100143 ) ) ( not ( = ?auto_100144 ?auto_100146 ) ) ( not ( = ?auto_100141 ?auto_100142 ) ) ( not ( = ?auto_100143 ?auto_100142 ) ) ( not ( = ?auto_100147 ?auto_100144 ) ) ( not ( = ?auto_100147 ?auto_100146 ) ) ( not ( = ?auto_100141 ?auto_100140 ) ) ( not ( = ?auto_100143 ?auto_100140 ) ) ( not ( = ?auto_100142 ?auto_100140 ) ) ( not ( = ?auto_100149 ?auto_100147 ) ) ( not ( = ?auto_100149 ?auto_100144 ) ) ( not ( = ?auto_100149 ?auto_100146 ) ) ( not ( = ?auto_100141 ?auto_100139 ) ) ( not ( = ?auto_100143 ?auto_100139 ) ) ( not ( = ?auto_100142 ?auto_100139 ) ) ( not ( = ?auto_100140 ?auto_100139 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_100141 ?auto_100143 ?auto_100142 ?auto_100139 ?auto_100140 ?auto_100138 )
      ( DELIVER-5PKG-VERIFY ?auto_100139 ?auto_100140 ?auto_100141 ?auto_100142 ?auto_100143 ?auto_100138 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_100352 - OBJ
      ?auto_100353 - OBJ
      ?auto_100354 - OBJ
      ?auto_100355 - OBJ
      ?auto_100356 - OBJ
      ?auto_100351 - LOCATION
    )
    :vars
    (
      ?auto_100357 - LOCATION
      ?auto_100361 - CITY
      ?auto_100362 - LOCATION
      ?auto_100360 - LOCATION
      ?auto_100359 - LOCATION
      ?auto_100358 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_100357 ?auto_100361 ) ( IN-CITY ?auto_100351 ?auto_100361 ) ( not ( = ?auto_100351 ?auto_100357 ) ) ( OBJ-AT ?auto_100352 ?auto_100357 ) ( IN-CITY ?auto_100362 ?auto_100361 ) ( not ( = ?auto_100351 ?auto_100362 ) ) ( OBJ-AT ?auto_100353 ?auto_100362 ) ( IN-CITY ?auto_100360 ?auto_100361 ) ( not ( = ?auto_100351 ?auto_100360 ) ) ( OBJ-AT ?auto_100356 ?auto_100360 ) ( OBJ-AT ?auto_100354 ?auto_100357 ) ( IN-CITY ?auto_100359 ?auto_100361 ) ( not ( = ?auto_100351 ?auto_100359 ) ) ( OBJ-AT ?auto_100355 ?auto_100359 ) ( TRUCK-AT ?auto_100358 ?auto_100351 ) ( not ( = ?auto_100355 ?auto_100354 ) ) ( not ( = ?auto_100357 ?auto_100359 ) ) ( not ( = ?auto_100355 ?auto_100356 ) ) ( not ( = ?auto_100354 ?auto_100356 ) ) ( not ( = ?auto_100360 ?auto_100357 ) ) ( not ( = ?auto_100360 ?auto_100359 ) ) ( not ( = ?auto_100355 ?auto_100353 ) ) ( not ( = ?auto_100354 ?auto_100353 ) ) ( not ( = ?auto_100356 ?auto_100353 ) ) ( not ( = ?auto_100362 ?auto_100360 ) ) ( not ( = ?auto_100362 ?auto_100357 ) ) ( not ( = ?auto_100362 ?auto_100359 ) ) ( not ( = ?auto_100355 ?auto_100352 ) ) ( not ( = ?auto_100354 ?auto_100352 ) ) ( not ( = ?auto_100356 ?auto_100352 ) ) ( not ( = ?auto_100353 ?auto_100352 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_100355 ?auto_100354 ?auto_100356 ?auto_100352 ?auto_100353 ?auto_100351 )
      ( DELIVER-5PKG-VERIFY ?auto_100352 ?auto_100353 ?auto_100354 ?auto_100355 ?auto_100356 ?auto_100351 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_100458 - OBJ
      ?auto_100459 - OBJ
      ?auto_100460 - OBJ
      ?auto_100461 - OBJ
      ?auto_100462 - OBJ
      ?auto_100457 - LOCATION
    )
    :vars
    (
      ?auto_100463 - LOCATION
      ?auto_100467 - CITY
      ?auto_100468 - LOCATION
      ?auto_100466 - LOCATION
      ?auto_100465 - LOCATION
      ?auto_100464 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_100463 ?auto_100467 ) ( IN-CITY ?auto_100457 ?auto_100467 ) ( not ( = ?auto_100457 ?auto_100463 ) ) ( OBJ-AT ?auto_100458 ?auto_100463 ) ( IN-CITY ?auto_100468 ?auto_100467 ) ( not ( = ?auto_100457 ?auto_100468 ) ) ( OBJ-AT ?auto_100459 ?auto_100468 ) ( IN-CITY ?auto_100466 ?auto_100467 ) ( not ( = ?auto_100457 ?auto_100466 ) ) ( OBJ-AT ?auto_100461 ?auto_100466 ) ( OBJ-AT ?auto_100460 ?auto_100463 ) ( IN-CITY ?auto_100465 ?auto_100467 ) ( not ( = ?auto_100457 ?auto_100465 ) ) ( OBJ-AT ?auto_100462 ?auto_100465 ) ( TRUCK-AT ?auto_100464 ?auto_100457 ) ( not ( = ?auto_100462 ?auto_100460 ) ) ( not ( = ?auto_100463 ?auto_100465 ) ) ( not ( = ?auto_100462 ?auto_100461 ) ) ( not ( = ?auto_100460 ?auto_100461 ) ) ( not ( = ?auto_100466 ?auto_100463 ) ) ( not ( = ?auto_100466 ?auto_100465 ) ) ( not ( = ?auto_100462 ?auto_100459 ) ) ( not ( = ?auto_100460 ?auto_100459 ) ) ( not ( = ?auto_100461 ?auto_100459 ) ) ( not ( = ?auto_100468 ?auto_100466 ) ) ( not ( = ?auto_100468 ?auto_100463 ) ) ( not ( = ?auto_100468 ?auto_100465 ) ) ( not ( = ?auto_100462 ?auto_100458 ) ) ( not ( = ?auto_100460 ?auto_100458 ) ) ( not ( = ?auto_100461 ?auto_100458 ) ) ( not ( = ?auto_100459 ?auto_100458 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_100462 ?auto_100460 ?auto_100461 ?auto_100458 ?auto_100459 ?auto_100457 )
      ( DELIVER-5PKG-VERIFY ?auto_100458 ?auto_100459 ?auto_100460 ?auto_100461 ?auto_100462 ?auto_100457 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_100671 - OBJ
      ?auto_100672 - OBJ
      ?auto_100673 - OBJ
      ?auto_100674 - OBJ
      ?auto_100675 - OBJ
      ?auto_100670 - LOCATION
    )
    :vars
    (
      ?auto_100676 - LOCATION
      ?auto_100680 - CITY
      ?auto_100681 - LOCATION
      ?auto_100679 - LOCATION
      ?auto_100678 - LOCATION
      ?auto_100677 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_100676 ?auto_100680 ) ( IN-CITY ?auto_100670 ?auto_100680 ) ( not ( = ?auto_100670 ?auto_100676 ) ) ( OBJ-AT ?auto_100671 ?auto_100676 ) ( IN-CITY ?auto_100681 ?auto_100680 ) ( not ( = ?auto_100670 ?auto_100681 ) ) ( OBJ-AT ?auto_100672 ?auto_100681 ) ( IN-CITY ?auto_100679 ?auto_100680 ) ( not ( = ?auto_100670 ?auto_100679 ) ) ( OBJ-AT ?auto_100673 ?auto_100679 ) ( OBJ-AT ?auto_100675 ?auto_100676 ) ( IN-CITY ?auto_100678 ?auto_100680 ) ( not ( = ?auto_100670 ?auto_100678 ) ) ( OBJ-AT ?auto_100674 ?auto_100678 ) ( TRUCK-AT ?auto_100677 ?auto_100670 ) ( not ( = ?auto_100674 ?auto_100675 ) ) ( not ( = ?auto_100676 ?auto_100678 ) ) ( not ( = ?auto_100674 ?auto_100673 ) ) ( not ( = ?auto_100675 ?auto_100673 ) ) ( not ( = ?auto_100679 ?auto_100676 ) ) ( not ( = ?auto_100679 ?auto_100678 ) ) ( not ( = ?auto_100674 ?auto_100672 ) ) ( not ( = ?auto_100675 ?auto_100672 ) ) ( not ( = ?auto_100673 ?auto_100672 ) ) ( not ( = ?auto_100681 ?auto_100679 ) ) ( not ( = ?auto_100681 ?auto_100676 ) ) ( not ( = ?auto_100681 ?auto_100678 ) ) ( not ( = ?auto_100674 ?auto_100671 ) ) ( not ( = ?auto_100675 ?auto_100671 ) ) ( not ( = ?auto_100673 ?auto_100671 ) ) ( not ( = ?auto_100672 ?auto_100671 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_100674 ?auto_100675 ?auto_100673 ?auto_100671 ?auto_100672 ?auto_100670 )
      ( DELIVER-5PKG-VERIFY ?auto_100671 ?auto_100672 ?auto_100673 ?auto_100674 ?auto_100675 ?auto_100670 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_100722 - OBJ
      ?auto_100723 - OBJ
      ?auto_100724 - OBJ
      ?auto_100725 - OBJ
      ?auto_100726 - OBJ
      ?auto_100721 - LOCATION
    )
    :vars
    (
      ?auto_100727 - LOCATION
      ?auto_100731 - CITY
      ?auto_100732 - LOCATION
      ?auto_100730 - LOCATION
      ?auto_100729 - LOCATION
      ?auto_100728 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_100727 ?auto_100731 ) ( IN-CITY ?auto_100721 ?auto_100731 ) ( not ( = ?auto_100721 ?auto_100727 ) ) ( OBJ-AT ?auto_100722 ?auto_100727 ) ( IN-CITY ?auto_100732 ?auto_100731 ) ( not ( = ?auto_100721 ?auto_100732 ) ) ( OBJ-AT ?auto_100723 ?auto_100732 ) ( IN-CITY ?auto_100730 ?auto_100731 ) ( not ( = ?auto_100721 ?auto_100730 ) ) ( OBJ-AT ?auto_100724 ?auto_100730 ) ( OBJ-AT ?auto_100725 ?auto_100727 ) ( IN-CITY ?auto_100729 ?auto_100731 ) ( not ( = ?auto_100721 ?auto_100729 ) ) ( OBJ-AT ?auto_100726 ?auto_100729 ) ( TRUCK-AT ?auto_100728 ?auto_100721 ) ( not ( = ?auto_100726 ?auto_100725 ) ) ( not ( = ?auto_100727 ?auto_100729 ) ) ( not ( = ?auto_100726 ?auto_100724 ) ) ( not ( = ?auto_100725 ?auto_100724 ) ) ( not ( = ?auto_100730 ?auto_100727 ) ) ( not ( = ?auto_100730 ?auto_100729 ) ) ( not ( = ?auto_100726 ?auto_100723 ) ) ( not ( = ?auto_100725 ?auto_100723 ) ) ( not ( = ?auto_100724 ?auto_100723 ) ) ( not ( = ?auto_100732 ?auto_100730 ) ) ( not ( = ?auto_100732 ?auto_100727 ) ) ( not ( = ?auto_100732 ?auto_100729 ) ) ( not ( = ?auto_100726 ?auto_100722 ) ) ( not ( = ?auto_100725 ?auto_100722 ) ) ( not ( = ?auto_100724 ?auto_100722 ) ) ( not ( = ?auto_100723 ?auto_100722 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_100726 ?auto_100725 ?auto_100724 ?auto_100722 ?auto_100723 ?auto_100721 )
      ( DELIVER-5PKG-VERIFY ?auto_100722 ?auto_100723 ?auto_100724 ?auto_100725 ?auto_100726 ?auto_100721 ) )
  )

)

