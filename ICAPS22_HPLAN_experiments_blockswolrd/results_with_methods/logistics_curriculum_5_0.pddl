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
      ?auto_17214 - OBJ
      ?auto_17213 - LOCATION
    )
    :vars
    (
      ?auto_17216 - LOCATION
      ?auto_17217 - CITY
      ?auto_17215 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_17216 ?auto_17217 ) ( IN-CITY ?auto_17213 ?auto_17217 ) ( not ( = ?auto_17213 ?auto_17216 ) ) ( OBJ-AT ?auto_17214 ?auto_17216 ) ( TRUCK-AT ?auto_17215 ?auto_17213 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_17215 ?auto_17213 ?auto_17216 ?auto_17217 )
      ( !LOAD-TRUCK ?auto_17214 ?auto_17215 ?auto_17216 )
      ( !DRIVE-TRUCK ?auto_17215 ?auto_17216 ?auto_17213 ?auto_17217 )
      ( !UNLOAD-TRUCK ?auto_17214 ?auto_17215 ?auto_17213 )
      ( DELIVER-1PKG-VERIFY ?auto_17214 ?auto_17213 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_17221 - OBJ
      ?auto_17220 - LOCATION
    )
    :vars
    (
      ?auto_17223 - LOCATION
      ?auto_17224 - CITY
      ?auto_17222 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_17223 ?auto_17224 ) ( IN-CITY ?auto_17220 ?auto_17224 ) ( not ( = ?auto_17220 ?auto_17223 ) ) ( OBJ-AT ?auto_17221 ?auto_17223 ) ( TRUCK-AT ?auto_17222 ?auto_17220 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_17222 ?auto_17220 ?auto_17223 ?auto_17224 )
      ( !LOAD-TRUCK ?auto_17221 ?auto_17222 ?auto_17223 )
      ( !DRIVE-TRUCK ?auto_17222 ?auto_17223 ?auto_17220 ?auto_17224 )
      ( !UNLOAD-TRUCK ?auto_17221 ?auto_17222 ?auto_17220 )
      ( DELIVER-1PKG-VERIFY ?auto_17221 ?auto_17220 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_17235 - OBJ
      ?auto_17236 - OBJ
      ?auto_17234 - LOCATION
    )
    :vars
    (
      ?auto_17239 - LOCATION
      ?auto_17237 - CITY
      ?auto_17238 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_17239 ?auto_17237 ) ( IN-CITY ?auto_17234 ?auto_17237 ) ( not ( = ?auto_17234 ?auto_17239 ) ) ( OBJ-AT ?auto_17236 ?auto_17239 ) ( OBJ-AT ?auto_17235 ?auto_17239 ) ( TRUCK-AT ?auto_17238 ?auto_17234 ) ( not ( = ?auto_17235 ?auto_17236 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_17235 ?auto_17234 )
      ( DELIVER-1PKG ?auto_17236 ?auto_17234 )
      ( DELIVER-2PKG-VERIFY ?auto_17235 ?auto_17236 ?auto_17234 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_17241 - OBJ
      ?auto_17242 - OBJ
      ?auto_17240 - LOCATION
    )
    :vars
    (
      ?auto_17245 - LOCATION
      ?auto_17244 - CITY
      ?auto_17243 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_17245 ?auto_17244 ) ( IN-CITY ?auto_17240 ?auto_17244 ) ( not ( = ?auto_17240 ?auto_17245 ) ) ( OBJ-AT ?auto_17241 ?auto_17245 ) ( OBJ-AT ?auto_17242 ?auto_17245 ) ( TRUCK-AT ?auto_17243 ?auto_17240 ) ( not ( = ?auto_17242 ?auto_17241 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_17242 ?auto_17241 ?auto_17240 )
      ( DELIVER-2PKG-VERIFY ?auto_17241 ?auto_17242 ?auto_17240 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_17256 - OBJ
      ?auto_17255 - LOCATION
    )
    :vars
    (
      ?auto_17258 - LOCATION
      ?auto_17259 - CITY
      ?auto_17257 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_17258 ?auto_17259 ) ( IN-CITY ?auto_17255 ?auto_17259 ) ( not ( = ?auto_17255 ?auto_17258 ) ) ( OBJ-AT ?auto_17256 ?auto_17258 ) ( TRUCK-AT ?auto_17257 ?auto_17255 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_17257 ?auto_17255 ?auto_17258 ?auto_17259 )
      ( !LOAD-TRUCK ?auto_17256 ?auto_17257 ?auto_17258 )
      ( !DRIVE-TRUCK ?auto_17257 ?auto_17258 ?auto_17255 ?auto_17259 )
      ( !UNLOAD-TRUCK ?auto_17256 ?auto_17257 ?auto_17255 )
      ( DELIVER-1PKG-VERIFY ?auto_17256 ?auto_17255 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_17346 - OBJ
      ?auto_17347 - OBJ
      ?auto_17348 - OBJ
      ?auto_17345 - LOCATION
    )
    :vars
    (
      ?auto_17351 - LOCATION
      ?auto_17350 - CITY
      ?auto_17352 - LOCATION
      ?auto_17349 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_17351 ?auto_17350 ) ( IN-CITY ?auto_17345 ?auto_17350 ) ( not ( = ?auto_17345 ?auto_17351 ) ) ( OBJ-AT ?auto_17348 ?auto_17351 ) ( IN-CITY ?auto_17352 ?auto_17350 ) ( not ( = ?auto_17345 ?auto_17352 ) ) ( OBJ-AT ?auto_17347 ?auto_17352 ) ( OBJ-AT ?auto_17346 ?auto_17352 ) ( TRUCK-AT ?auto_17349 ?auto_17345 ) ( not ( = ?auto_17346 ?auto_17347 ) ) ( not ( = ?auto_17346 ?auto_17348 ) ) ( not ( = ?auto_17347 ?auto_17348 ) ) ( not ( = ?auto_17351 ?auto_17352 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_17347 ?auto_17346 ?auto_17345 )
      ( DELIVER-1PKG ?auto_17348 ?auto_17345 )
      ( DELIVER-3PKG-VERIFY ?auto_17346 ?auto_17347 ?auto_17348 ?auto_17345 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_17363 - OBJ
      ?auto_17364 - OBJ
      ?auto_17365 - OBJ
      ?auto_17362 - LOCATION
    )
    :vars
    (
      ?auto_17366 - LOCATION
      ?auto_17367 - CITY
      ?auto_17369 - LOCATION
      ?auto_17368 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_17366 ?auto_17367 ) ( IN-CITY ?auto_17362 ?auto_17367 ) ( not ( = ?auto_17362 ?auto_17366 ) ) ( OBJ-AT ?auto_17364 ?auto_17366 ) ( IN-CITY ?auto_17369 ?auto_17367 ) ( not ( = ?auto_17362 ?auto_17369 ) ) ( OBJ-AT ?auto_17365 ?auto_17369 ) ( OBJ-AT ?auto_17363 ?auto_17369 ) ( TRUCK-AT ?auto_17368 ?auto_17362 ) ( not ( = ?auto_17363 ?auto_17365 ) ) ( not ( = ?auto_17363 ?auto_17364 ) ) ( not ( = ?auto_17365 ?auto_17364 ) ) ( not ( = ?auto_17366 ?auto_17369 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_17363 ?auto_17365 ?auto_17364 ?auto_17362 )
      ( DELIVER-3PKG-VERIFY ?auto_17363 ?auto_17364 ?auto_17365 ?auto_17362 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_17380 - OBJ
      ?auto_17381 - OBJ
      ?auto_17382 - OBJ
      ?auto_17379 - LOCATION
    )
    :vars
    (
      ?auto_17386 - LOCATION
      ?auto_17383 - CITY
      ?auto_17385 - LOCATION
      ?auto_17384 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_17386 ?auto_17383 ) ( IN-CITY ?auto_17379 ?auto_17383 ) ( not ( = ?auto_17379 ?auto_17386 ) ) ( OBJ-AT ?auto_17382 ?auto_17386 ) ( IN-CITY ?auto_17385 ?auto_17383 ) ( not ( = ?auto_17379 ?auto_17385 ) ) ( OBJ-AT ?auto_17380 ?auto_17385 ) ( OBJ-AT ?auto_17381 ?auto_17385 ) ( TRUCK-AT ?auto_17384 ?auto_17379 ) ( not ( = ?auto_17381 ?auto_17380 ) ) ( not ( = ?auto_17381 ?auto_17382 ) ) ( not ( = ?auto_17380 ?auto_17382 ) ) ( not ( = ?auto_17386 ?auto_17385 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_17381 ?auto_17382 ?auto_17380 ?auto_17379 )
      ( DELIVER-3PKG-VERIFY ?auto_17380 ?auto_17381 ?auto_17382 ?auto_17379 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_17397 - OBJ
      ?auto_17398 - OBJ
      ?auto_17399 - OBJ
      ?auto_17396 - LOCATION
    )
    :vars
    (
      ?auto_17403 - LOCATION
      ?auto_17400 - CITY
      ?auto_17402 - LOCATION
      ?auto_17401 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_17403 ?auto_17400 ) ( IN-CITY ?auto_17396 ?auto_17400 ) ( not ( = ?auto_17396 ?auto_17403 ) ) ( OBJ-AT ?auto_17398 ?auto_17403 ) ( IN-CITY ?auto_17402 ?auto_17400 ) ( not ( = ?auto_17396 ?auto_17402 ) ) ( OBJ-AT ?auto_17397 ?auto_17402 ) ( OBJ-AT ?auto_17399 ?auto_17402 ) ( TRUCK-AT ?auto_17401 ?auto_17396 ) ( not ( = ?auto_17399 ?auto_17397 ) ) ( not ( = ?auto_17399 ?auto_17398 ) ) ( not ( = ?auto_17397 ?auto_17398 ) ) ( not ( = ?auto_17403 ?auto_17402 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_17399 ?auto_17398 ?auto_17397 ?auto_17396 )
      ( DELIVER-3PKG-VERIFY ?auto_17397 ?auto_17398 ?auto_17399 ?auto_17396 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_17432 - OBJ
      ?auto_17433 - OBJ
      ?auto_17434 - OBJ
      ?auto_17431 - LOCATION
    )
    :vars
    (
      ?auto_17438 - LOCATION
      ?auto_17435 - CITY
      ?auto_17437 - LOCATION
      ?auto_17436 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_17438 ?auto_17435 ) ( IN-CITY ?auto_17431 ?auto_17435 ) ( not ( = ?auto_17431 ?auto_17438 ) ) ( OBJ-AT ?auto_17432 ?auto_17438 ) ( IN-CITY ?auto_17437 ?auto_17435 ) ( not ( = ?auto_17431 ?auto_17437 ) ) ( OBJ-AT ?auto_17434 ?auto_17437 ) ( OBJ-AT ?auto_17433 ?auto_17437 ) ( TRUCK-AT ?auto_17436 ?auto_17431 ) ( not ( = ?auto_17433 ?auto_17434 ) ) ( not ( = ?auto_17433 ?auto_17432 ) ) ( not ( = ?auto_17434 ?auto_17432 ) ) ( not ( = ?auto_17438 ?auto_17437 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_17433 ?auto_17432 ?auto_17434 ?auto_17431 )
      ( DELIVER-3PKG-VERIFY ?auto_17432 ?auto_17433 ?auto_17434 ?auto_17431 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_17449 - OBJ
      ?auto_17450 - OBJ
      ?auto_17451 - OBJ
      ?auto_17448 - LOCATION
    )
    :vars
    (
      ?auto_17455 - LOCATION
      ?auto_17452 - CITY
      ?auto_17454 - LOCATION
      ?auto_17453 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_17455 ?auto_17452 ) ( IN-CITY ?auto_17448 ?auto_17452 ) ( not ( = ?auto_17448 ?auto_17455 ) ) ( OBJ-AT ?auto_17449 ?auto_17455 ) ( IN-CITY ?auto_17454 ?auto_17452 ) ( not ( = ?auto_17448 ?auto_17454 ) ) ( OBJ-AT ?auto_17450 ?auto_17454 ) ( OBJ-AT ?auto_17451 ?auto_17454 ) ( TRUCK-AT ?auto_17453 ?auto_17448 ) ( not ( = ?auto_17451 ?auto_17450 ) ) ( not ( = ?auto_17451 ?auto_17449 ) ) ( not ( = ?auto_17450 ?auto_17449 ) ) ( not ( = ?auto_17455 ?auto_17454 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_17451 ?auto_17449 ?auto_17450 ?auto_17448 )
      ( DELIVER-3PKG-VERIFY ?auto_17449 ?auto_17450 ?auto_17451 ?auto_17448 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_17505 - OBJ
      ?auto_17504 - LOCATION
    )
    :vars
    (
      ?auto_17507 - LOCATION
      ?auto_17508 - CITY
      ?auto_17506 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_17507 ?auto_17508 ) ( IN-CITY ?auto_17504 ?auto_17508 ) ( not ( = ?auto_17504 ?auto_17507 ) ) ( OBJ-AT ?auto_17505 ?auto_17507 ) ( TRUCK-AT ?auto_17506 ?auto_17504 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_17506 ?auto_17504 ?auto_17507 ?auto_17508 )
      ( !LOAD-TRUCK ?auto_17505 ?auto_17506 ?auto_17507 )
      ( !DRIVE-TRUCK ?auto_17506 ?auto_17507 ?auto_17504 ?auto_17508 )
      ( !UNLOAD-TRUCK ?auto_17505 ?auto_17506 ?auto_17504 )
      ( DELIVER-1PKG-VERIFY ?auto_17505 ?auto_17504 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_18487 - OBJ
      ?auto_18488 - OBJ
      ?auto_18489 - OBJ
      ?auto_18490 - OBJ
      ?auto_18486 - LOCATION
    )
    :vars
    (
      ?auto_18493 - LOCATION
      ?auto_18491 - CITY
      ?auto_18495 - LOCATION
      ?auto_18494 - LOCATION
      ?auto_18492 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_18493 ?auto_18491 ) ( IN-CITY ?auto_18486 ?auto_18491 ) ( not ( = ?auto_18486 ?auto_18493 ) ) ( OBJ-AT ?auto_18490 ?auto_18493 ) ( IN-CITY ?auto_18495 ?auto_18491 ) ( not ( = ?auto_18486 ?auto_18495 ) ) ( OBJ-AT ?auto_18489 ?auto_18495 ) ( IN-CITY ?auto_18494 ?auto_18491 ) ( not ( = ?auto_18486 ?auto_18494 ) ) ( OBJ-AT ?auto_18488 ?auto_18494 ) ( OBJ-AT ?auto_18487 ?auto_18494 ) ( TRUCK-AT ?auto_18492 ?auto_18486 ) ( not ( = ?auto_18487 ?auto_18488 ) ) ( not ( = ?auto_18487 ?auto_18489 ) ) ( not ( = ?auto_18488 ?auto_18489 ) ) ( not ( = ?auto_18495 ?auto_18494 ) ) ( not ( = ?auto_18487 ?auto_18490 ) ) ( not ( = ?auto_18488 ?auto_18490 ) ) ( not ( = ?auto_18489 ?auto_18490 ) ) ( not ( = ?auto_18493 ?auto_18495 ) ) ( not ( = ?auto_18493 ?auto_18494 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_18487 ?auto_18489 ?auto_18488 ?auto_18486 )
      ( DELIVER-1PKG ?auto_18490 ?auto_18486 )
      ( DELIVER-4PKG-VERIFY ?auto_18487 ?auto_18488 ?auto_18489 ?auto_18490 ?auto_18486 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_18519 - OBJ
      ?auto_18520 - OBJ
      ?auto_18521 - OBJ
      ?auto_18522 - OBJ
      ?auto_18518 - LOCATION
    )
    :vars
    (
      ?auto_18527 - LOCATION
      ?auto_18523 - CITY
      ?auto_18524 - LOCATION
      ?auto_18526 - LOCATION
      ?auto_18525 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_18527 ?auto_18523 ) ( IN-CITY ?auto_18518 ?auto_18523 ) ( not ( = ?auto_18518 ?auto_18527 ) ) ( OBJ-AT ?auto_18521 ?auto_18527 ) ( IN-CITY ?auto_18524 ?auto_18523 ) ( not ( = ?auto_18518 ?auto_18524 ) ) ( OBJ-AT ?auto_18522 ?auto_18524 ) ( IN-CITY ?auto_18526 ?auto_18523 ) ( not ( = ?auto_18518 ?auto_18526 ) ) ( OBJ-AT ?auto_18520 ?auto_18526 ) ( OBJ-AT ?auto_18519 ?auto_18526 ) ( TRUCK-AT ?auto_18525 ?auto_18518 ) ( not ( = ?auto_18519 ?auto_18520 ) ) ( not ( = ?auto_18519 ?auto_18522 ) ) ( not ( = ?auto_18520 ?auto_18522 ) ) ( not ( = ?auto_18524 ?auto_18526 ) ) ( not ( = ?auto_18519 ?auto_18521 ) ) ( not ( = ?auto_18520 ?auto_18521 ) ) ( not ( = ?auto_18522 ?auto_18521 ) ) ( not ( = ?auto_18527 ?auto_18524 ) ) ( not ( = ?auto_18527 ?auto_18526 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_18519 ?auto_18520 ?auto_18522 ?auto_18521 ?auto_18518 )
      ( DELIVER-4PKG-VERIFY ?auto_18519 ?auto_18520 ?auto_18521 ?auto_18522 ?auto_18518 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_18551 - OBJ
      ?auto_18552 - OBJ
      ?auto_18553 - OBJ
      ?auto_18554 - OBJ
      ?auto_18550 - LOCATION
    )
    :vars
    (
      ?auto_18558 - LOCATION
      ?auto_18557 - CITY
      ?auto_18556 - LOCATION
      ?auto_18555 - LOCATION
      ?auto_18559 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_18558 ?auto_18557 ) ( IN-CITY ?auto_18550 ?auto_18557 ) ( not ( = ?auto_18550 ?auto_18558 ) ) ( OBJ-AT ?auto_18554 ?auto_18558 ) ( IN-CITY ?auto_18556 ?auto_18557 ) ( not ( = ?auto_18550 ?auto_18556 ) ) ( OBJ-AT ?auto_18552 ?auto_18556 ) ( IN-CITY ?auto_18555 ?auto_18557 ) ( not ( = ?auto_18550 ?auto_18555 ) ) ( OBJ-AT ?auto_18553 ?auto_18555 ) ( OBJ-AT ?auto_18551 ?auto_18555 ) ( TRUCK-AT ?auto_18559 ?auto_18550 ) ( not ( = ?auto_18551 ?auto_18553 ) ) ( not ( = ?auto_18551 ?auto_18552 ) ) ( not ( = ?auto_18553 ?auto_18552 ) ) ( not ( = ?auto_18556 ?auto_18555 ) ) ( not ( = ?auto_18551 ?auto_18554 ) ) ( not ( = ?auto_18553 ?auto_18554 ) ) ( not ( = ?auto_18552 ?auto_18554 ) ) ( not ( = ?auto_18558 ?auto_18556 ) ) ( not ( = ?auto_18558 ?auto_18555 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_18551 ?auto_18553 ?auto_18554 ?auto_18552 ?auto_18550 )
      ( DELIVER-4PKG-VERIFY ?auto_18551 ?auto_18552 ?auto_18553 ?auto_18554 ?auto_18550 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_18583 - OBJ
      ?auto_18584 - OBJ
      ?auto_18585 - OBJ
      ?auto_18586 - OBJ
      ?auto_18582 - LOCATION
    )
    :vars
    (
      ?auto_18590 - LOCATION
      ?auto_18589 - CITY
      ?auto_18588 - LOCATION
      ?auto_18587 - LOCATION
      ?auto_18591 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_18590 ?auto_18589 ) ( IN-CITY ?auto_18582 ?auto_18589 ) ( not ( = ?auto_18582 ?auto_18590 ) ) ( OBJ-AT ?auto_18585 ?auto_18590 ) ( IN-CITY ?auto_18588 ?auto_18589 ) ( not ( = ?auto_18582 ?auto_18588 ) ) ( OBJ-AT ?auto_18584 ?auto_18588 ) ( IN-CITY ?auto_18587 ?auto_18589 ) ( not ( = ?auto_18582 ?auto_18587 ) ) ( OBJ-AT ?auto_18586 ?auto_18587 ) ( OBJ-AT ?auto_18583 ?auto_18587 ) ( TRUCK-AT ?auto_18591 ?auto_18582 ) ( not ( = ?auto_18583 ?auto_18586 ) ) ( not ( = ?auto_18583 ?auto_18584 ) ) ( not ( = ?auto_18586 ?auto_18584 ) ) ( not ( = ?auto_18588 ?auto_18587 ) ) ( not ( = ?auto_18583 ?auto_18585 ) ) ( not ( = ?auto_18586 ?auto_18585 ) ) ( not ( = ?auto_18584 ?auto_18585 ) ) ( not ( = ?auto_18590 ?auto_18588 ) ) ( not ( = ?auto_18590 ?auto_18587 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_18583 ?auto_18586 ?auto_18585 ?auto_18584 ?auto_18582 )
      ( DELIVER-4PKG-VERIFY ?auto_18583 ?auto_18584 ?auto_18585 ?auto_18586 ?auto_18582 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_18683 - OBJ
      ?auto_18684 - OBJ
      ?auto_18685 - OBJ
      ?auto_18686 - OBJ
      ?auto_18682 - LOCATION
    )
    :vars
    (
      ?auto_18690 - LOCATION
      ?auto_18689 - CITY
      ?auto_18688 - LOCATION
      ?auto_18687 - LOCATION
      ?auto_18691 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_18690 ?auto_18689 ) ( IN-CITY ?auto_18682 ?auto_18689 ) ( not ( = ?auto_18682 ?auto_18690 ) ) ( OBJ-AT ?auto_18684 ?auto_18690 ) ( IN-CITY ?auto_18688 ?auto_18689 ) ( not ( = ?auto_18682 ?auto_18688 ) ) ( OBJ-AT ?auto_18686 ?auto_18688 ) ( IN-CITY ?auto_18687 ?auto_18689 ) ( not ( = ?auto_18682 ?auto_18687 ) ) ( OBJ-AT ?auto_18685 ?auto_18687 ) ( OBJ-AT ?auto_18683 ?auto_18687 ) ( TRUCK-AT ?auto_18691 ?auto_18682 ) ( not ( = ?auto_18683 ?auto_18685 ) ) ( not ( = ?auto_18683 ?auto_18686 ) ) ( not ( = ?auto_18685 ?auto_18686 ) ) ( not ( = ?auto_18688 ?auto_18687 ) ) ( not ( = ?auto_18683 ?auto_18684 ) ) ( not ( = ?auto_18685 ?auto_18684 ) ) ( not ( = ?auto_18686 ?auto_18684 ) ) ( not ( = ?auto_18690 ?auto_18688 ) ) ( not ( = ?auto_18690 ?auto_18687 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_18683 ?auto_18685 ?auto_18684 ?auto_18686 ?auto_18682 )
      ( DELIVER-4PKG-VERIFY ?auto_18683 ?auto_18684 ?auto_18685 ?auto_18686 ?auto_18682 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_18715 - OBJ
      ?auto_18716 - OBJ
      ?auto_18717 - OBJ
      ?auto_18718 - OBJ
      ?auto_18714 - LOCATION
    )
    :vars
    (
      ?auto_18722 - LOCATION
      ?auto_18721 - CITY
      ?auto_18720 - LOCATION
      ?auto_18719 - LOCATION
      ?auto_18723 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_18722 ?auto_18721 ) ( IN-CITY ?auto_18714 ?auto_18721 ) ( not ( = ?auto_18714 ?auto_18722 ) ) ( OBJ-AT ?auto_18716 ?auto_18722 ) ( IN-CITY ?auto_18720 ?auto_18721 ) ( not ( = ?auto_18714 ?auto_18720 ) ) ( OBJ-AT ?auto_18717 ?auto_18720 ) ( IN-CITY ?auto_18719 ?auto_18721 ) ( not ( = ?auto_18714 ?auto_18719 ) ) ( OBJ-AT ?auto_18718 ?auto_18719 ) ( OBJ-AT ?auto_18715 ?auto_18719 ) ( TRUCK-AT ?auto_18723 ?auto_18714 ) ( not ( = ?auto_18715 ?auto_18718 ) ) ( not ( = ?auto_18715 ?auto_18717 ) ) ( not ( = ?auto_18718 ?auto_18717 ) ) ( not ( = ?auto_18720 ?auto_18719 ) ) ( not ( = ?auto_18715 ?auto_18716 ) ) ( not ( = ?auto_18718 ?auto_18716 ) ) ( not ( = ?auto_18717 ?auto_18716 ) ) ( not ( = ?auto_18722 ?auto_18720 ) ) ( not ( = ?auto_18722 ?auto_18719 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_18715 ?auto_18718 ?auto_18716 ?auto_18717 ?auto_18714 )
      ( DELIVER-4PKG-VERIFY ?auto_18715 ?auto_18716 ?auto_18717 ?auto_18718 ?auto_18714 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_18815 - OBJ
      ?auto_18816 - OBJ
      ?auto_18817 - OBJ
      ?auto_18818 - OBJ
      ?auto_18814 - LOCATION
    )
    :vars
    (
      ?auto_18822 - LOCATION
      ?auto_18821 - CITY
      ?auto_18820 - LOCATION
      ?auto_18819 - LOCATION
      ?auto_18823 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_18822 ?auto_18821 ) ( IN-CITY ?auto_18814 ?auto_18821 ) ( not ( = ?auto_18814 ?auto_18822 ) ) ( OBJ-AT ?auto_18818 ?auto_18822 ) ( IN-CITY ?auto_18820 ?auto_18821 ) ( not ( = ?auto_18814 ?auto_18820 ) ) ( OBJ-AT ?auto_18817 ?auto_18820 ) ( IN-CITY ?auto_18819 ?auto_18821 ) ( not ( = ?auto_18814 ?auto_18819 ) ) ( OBJ-AT ?auto_18815 ?auto_18819 ) ( OBJ-AT ?auto_18816 ?auto_18819 ) ( TRUCK-AT ?auto_18823 ?auto_18814 ) ( not ( = ?auto_18816 ?auto_18815 ) ) ( not ( = ?auto_18816 ?auto_18817 ) ) ( not ( = ?auto_18815 ?auto_18817 ) ) ( not ( = ?auto_18820 ?auto_18819 ) ) ( not ( = ?auto_18816 ?auto_18818 ) ) ( not ( = ?auto_18815 ?auto_18818 ) ) ( not ( = ?auto_18817 ?auto_18818 ) ) ( not ( = ?auto_18822 ?auto_18820 ) ) ( not ( = ?auto_18822 ?auto_18819 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_18816 ?auto_18815 ?auto_18818 ?auto_18817 ?auto_18814 )
      ( DELIVER-4PKG-VERIFY ?auto_18815 ?auto_18816 ?auto_18817 ?auto_18818 ?auto_18814 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_18847 - OBJ
      ?auto_18848 - OBJ
      ?auto_18849 - OBJ
      ?auto_18850 - OBJ
      ?auto_18846 - LOCATION
    )
    :vars
    (
      ?auto_18854 - LOCATION
      ?auto_18853 - CITY
      ?auto_18852 - LOCATION
      ?auto_18851 - LOCATION
      ?auto_18855 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_18854 ?auto_18853 ) ( IN-CITY ?auto_18846 ?auto_18853 ) ( not ( = ?auto_18846 ?auto_18854 ) ) ( OBJ-AT ?auto_18849 ?auto_18854 ) ( IN-CITY ?auto_18852 ?auto_18853 ) ( not ( = ?auto_18846 ?auto_18852 ) ) ( OBJ-AT ?auto_18850 ?auto_18852 ) ( IN-CITY ?auto_18851 ?auto_18853 ) ( not ( = ?auto_18846 ?auto_18851 ) ) ( OBJ-AT ?auto_18847 ?auto_18851 ) ( OBJ-AT ?auto_18848 ?auto_18851 ) ( TRUCK-AT ?auto_18855 ?auto_18846 ) ( not ( = ?auto_18848 ?auto_18847 ) ) ( not ( = ?auto_18848 ?auto_18850 ) ) ( not ( = ?auto_18847 ?auto_18850 ) ) ( not ( = ?auto_18852 ?auto_18851 ) ) ( not ( = ?auto_18848 ?auto_18849 ) ) ( not ( = ?auto_18847 ?auto_18849 ) ) ( not ( = ?auto_18850 ?auto_18849 ) ) ( not ( = ?auto_18854 ?auto_18852 ) ) ( not ( = ?auto_18854 ?auto_18851 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_18848 ?auto_18847 ?auto_18849 ?auto_18850 ?auto_18846 )
      ( DELIVER-4PKG-VERIFY ?auto_18847 ?auto_18848 ?auto_18849 ?auto_18850 ?auto_18846 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_18948 - OBJ
      ?auto_18949 - OBJ
      ?auto_18950 - OBJ
      ?auto_18951 - OBJ
      ?auto_18947 - LOCATION
    )
    :vars
    (
      ?auto_18955 - LOCATION
      ?auto_18954 - CITY
      ?auto_18953 - LOCATION
      ?auto_18952 - LOCATION
      ?auto_18956 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_18955 ?auto_18954 ) ( IN-CITY ?auto_18947 ?auto_18954 ) ( not ( = ?auto_18947 ?auto_18955 ) ) ( OBJ-AT ?auto_18951 ?auto_18955 ) ( IN-CITY ?auto_18953 ?auto_18954 ) ( not ( = ?auto_18947 ?auto_18953 ) ) ( OBJ-AT ?auto_18949 ?auto_18953 ) ( IN-CITY ?auto_18952 ?auto_18954 ) ( not ( = ?auto_18947 ?auto_18952 ) ) ( OBJ-AT ?auto_18948 ?auto_18952 ) ( OBJ-AT ?auto_18950 ?auto_18952 ) ( TRUCK-AT ?auto_18956 ?auto_18947 ) ( not ( = ?auto_18950 ?auto_18948 ) ) ( not ( = ?auto_18950 ?auto_18949 ) ) ( not ( = ?auto_18948 ?auto_18949 ) ) ( not ( = ?auto_18953 ?auto_18952 ) ) ( not ( = ?auto_18950 ?auto_18951 ) ) ( not ( = ?auto_18948 ?auto_18951 ) ) ( not ( = ?auto_18949 ?auto_18951 ) ) ( not ( = ?auto_18955 ?auto_18953 ) ) ( not ( = ?auto_18955 ?auto_18952 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_18950 ?auto_18948 ?auto_18951 ?auto_18949 ?auto_18947 )
      ( DELIVER-4PKG-VERIFY ?auto_18948 ?auto_18949 ?auto_18950 ?auto_18951 ?auto_18947 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_18980 - OBJ
      ?auto_18981 - OBJ
      ?auto_18982 - OBJ
      ?auto_18983 - OBJ
      ?auto_18979 - LOCATION
    )
    :vars
    (
      ?auto_18987 - LOCATION
      ?auto_18986 - CITY
      ?auto_18985 - LOCATION
      ?auto_18984 - LOCATION
      ?auto_18988 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_18987 ?auto_18986 ) ( IN-CITY ?auto_18979 ?auto_18986 ) ( not ( = ?auto_18979 ?auto_18987 ) ) ( OBJ-AT ?auto_18982 ?auto_18987 ) ( IN-CITY ?auto_18985 ?auto_18986 ) ( not ( = ?auto_18979 ?auto_18985 ) ) ( OBJ-AT ?auto_18981 ?auto_18985 ) ( IN-CITY ?auto_18984 ?auto_18986 ) ( not ( = ?auto_18979 ?auto_18984 ) ) ( OBJ-AT ?auto_18980 ?auto_18984 ) ( OBJ-AT ?auto_18983 ?auto_18984 ) ( TRUCK-AT ?auto_18988 ?auto_18979 ) ( not ( = ?auto_18983 ?auto_18980 ) ) ( not ( = ?auto_18983 ?auto_18981 ) ) ( not ( = ?auto_18980 ?auto_18981 ) ) ( not ( = ?auto_18985 ?auto_18984 ) ) ( not ( = ?auto_18983 ?auto_18982 ) ) ( not ( = ?auto_18980 ?auto_18982 ) ) ( not ( = ?auto_18981 ?auto_18982 ) ) ( not ( = ?auto_18987 ?auto_18985 ) ) ( not ( = ?auto_18987 ?auto_18984 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_18983 ?auto_18980 ?auto_18982 ?auto_18981 ?auto_18979 )
      ( DELIVER-4PKG-VERIFY ?auto_18980 ?auto_18981 ?auto_18982 ?auto_18983 ?auto_18979 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_19045 - OBJ
      ?auto_19046 - OBJ
      ?auto_19047 - OBJ
      ?auto_19048 - OBJ
      ?auto_19044 - LOCATION
    )
    :vars
    (
      ?auto_19052 - LOCATION
      ?auto_19051 - CITY
      ?auto_19050 - LOCATION
      ?auto_19049 - LOCATION
      ?auto_19053 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_19052 ?auto_19051 ) ( IN-CITY ?auto_19044 ?auto_19051 ) ( not ( = ?auto_19044 ?auto_19052 ) ) ( OBJ-AT ?auto_19046 ?auto_19052 ) ( IN-CITY ?auto_19050 ?auto_19051 ) ( not ( = ?auto_19044 ?auto_19050 ) ) ( OBJ-AT ?auto_19048 ?auto_19050 ) ( IN-CITY ?auto_19049 ?auto_19051 ) ( not ( = ?auto_19044 ?auto_19049 ) ) ( OBJ-AT ?auto_19045 ?auto_19049 ) ( OBJ-AT ?auto_19047 ?auto_19049 ) ( TRUCK-AT ?auto_19053 ?auto_19044 ) ( not ( = ?auto_19047 ?auto_19045 ) ) ( not ( = ?auto_19047 ?auto_19048 ) ) ( not ( = ?auto_19045 ?auto_19048 ) ) ( not ( = ?auto_19050 ?auto_19049 ) ) ( not ( = ?auto_19047 ?auto_19046 ) ) ( not ( = ?auto_19045 ?auto_19046 ) ) ( not ( = ?auto_19048 ?auto_19046 ) ) ( not ( = ?auto_19052 ?auto_19050 ) ) ( not ( = ?auto_19052 ?auto_19049 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_19047 ?auto_19045 ?auto_19046 ?auto_19048 ?auto_19044 )
      ( DELIVER-4PKG-VERIFY ?auto_19045 ?auto_19046 ?auto_19047 ?auto_19048 ?auto_19044 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_19112 - OBJ
      ?auto_19113 - OBJ
      ?auto_19114 - OBJ
      ?auto_19115 - OBJ
      ?auto_19111 - LOCATION
    )
    :vars
    (
      ?auto_19119 - LOCATION
      ?auto_19118 - CITY
      ?auto_19117 - LOCATION
      ?auto_19116 - LOCATION
      ?auto_19120 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_19119 ?auto_19118 ) ( IN-CITY ?auto_19111 ?auto_19118 ) ( not ( = ?auto_19111 ?auto_19119 ) ) ( OBJ-AT ?auto_19113 ?auto_19119 ) ( IN-CITY ?auto_19117 ?auto_19118 ) ( not ( = ?auto_19111 ?auto_19117 ) ) ( OBJ-AT ?auto_19114 ?auto_19117 ) ( IN-CITY ?auto_19116 ?auto_19118 ) ( not ( = ?auto_19111 ?auto_19116 ) ) ( OBJ-AT ?auto_19112 ?auto_19116 ) ( OBJ-AT ?auto_19115 ?auto_19116 ) ( TRUCK-AT ?auto_19120 ?auto_19111 ) ( not ( = ?auto_19115 ?auto_19112 ) ) ( not ( = ?auto_19115 ?auto_19114 ) ) ( not ( = ?auto_19112 ?auto_19114 ) ) ( not ( = ?auto_19117 ?auto_19116 ) ) ( not ( = ?auto_19115 ?auto_19113 ) ) ( not ( = ?auto_19112 ?auto_19113 ) ) ( not ( = ?auto_19114 ?auto_19113 ) ) ( not ( = ?auto_19119 ?auto_19117 ) ) ( not ( = ?auto_19119 ?auto_19116 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_19115 ?auto_19112 ?auto_19113 ?auto_19114 ?auto_19111 )
      ( DELIVER-4PKG-VERIFY ?auto_19112 ?auto_19113 ?auto_19114 ?auto_19115 ?auto_19111 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_19212 - OBJ
      ?auto_19213 - OBJ
      ?auto_19214 - OBJ
      ?auto_19215 - OBJ
      ?auto_19211 - LOCATION
    )
    :vars
    (
      ?auto_19219 - LOCATION
      ?auto_19218 - CITY
      ?auto_19217 - LOCATION
      ?auto_19216 - LOCATION
      ?auto_19220 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_19219 ?auto_19218 ) ( IN-CITY ?auto_19211 ?auto_19218 ) ( not ( = ?auto_19211 ?auto_19219 ) ) ( OBJ-AT ?auto_19215 ?auto_19219 ) ( IN-CITY ?auto_19217 ?auto_19218 ) ( not ( = ?auto_19211 ?auto_19217 ) ) ( OBJ-AT ?auto_19212 ?auto_19217 ) ( IN-CITY ?auto_19216 ?auto_19218 ) ( not ( = ?auto_19211 ?auto_19216 ) ) ( OBJ-AT ?auto_19214 ?auto_19216 ) ( OBJ-AT ?auto_19213 ?auto_19216 ) ( TRUCK-AT ?auto_19220 ?auto_19211 ) ( not ( = ?auto_19213 ?auto_19214 ) ) ( not ( = ?auto_19213 ?auto_19212 ) ) ( not ( = ?auto_19214 ?auto_19212 ) ) ( not ( = ?auto_19217 ?auto_19216 ) ) ( not ( = ?auto_19213 ?auto_19215 ) ) ( not ( = ?auto_19214 ?auto_19215 ) ) ( not ( = ?auto_19212 ?auto_19215 ) ) ( not ( = ?auto_19219 ?auto_19217 ) ) ( not ( = ?auto_19219 ?auto_19216 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_19213 ?auto_19214 ?auto_19215 ?auto_19212 ?auto_19211 )
      ( DELIVER-4PKG-VERIFY ?auto_19212 ?auto_19213 ?auto_19214 ?auto_19215 ?auto_19211 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_19244 - OBJ
      ?auto_19245 - OBJ
      ?auto_19246 - OBJ
      ?auto_19247 - OBJ
      ?auto_19243 - LOCATION
    )
    :vars
    (
      ?auto_19251 - LOCATION
      ?auto_19250 - CITY
      ?auto_19249 - LOCATION
      ?auto_19248 - LOCATION
      ?auto_19252 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_19251 ?auto_19250 ) ( IN-CITY ?auto_19243 ?auto_19250 ) ( not ( = ?auto_19243 ?auto_19251 ) ) ( OBJ-AT ?auto_19246 ?auto_19251 ) ( IN-CITY ?auto_19249 ?auto_19250 ) ( not ( = ?auto_19243 ?auto_19249 ) ) ( OBJ-AT ?auto_19244 ?auto_19249 ) ( IN-CITY ?auto_19248 ?auto_19250 ) ( not ( = ?auto_19243 ?auto_19248 ) ) ( OBJ-AT ?auto_19247 ?auto_19248 ) ( OBJ-AT ?auto_19245 ?auto_19248 ) ( TRUCK-AT ?auto_19252 ?auto_19243 ) ( not ( = ?auto_19245 ?auto_19247 ) ) ( not ( = ?auto_19245 ?auto_19244 ) ) ( not ( = ?auto_19247 ?auto_19244 ) ) ( not ( = ?auto_19249 ?auto_19248 ) ) ( not ( = ?auto_19245 ?auto_19246 ) ) ( not ( = ?auto_19247 ?auto_19246 ) ) ( not ( = ?auto_19244 ?auto_19246 ) ) ( not ( = ?auto_19251 ?auto_19249 ) ) ( not ( = ?auto_19251 ?auto_19248 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_19245 ?auto_19247 ?auto_19246 ?auto_19244 ?auto_19243 )
      ( DELIVER-4PKG-VERIFY ?auto_19244 ?auto_19245 ?auto_19246 ?auto_19247 ?auto_19243 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_19276 - OBJ
      ?auto_19277 - OBJ
      ?auto_19278 - OBJ
      ?auto_19279 - OBJ
      ?auto_19275 - LOCATION
    )
    :vars
    (
      ?auto_19283 - LOCATION
      ?auto_19282 - CITY
      ?auto_19281 - LOCATION
      ?auto_19280 - LOCATION
      ?auto_19284 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_19283 ?auto_19282 ) ( IN-CITY ?auto_19275 ?auto_19282 ) ( not ( = ?auto_19275 ?auto_19283 ) ) ( OBJ-AT ?auto_19279 ?auto_19283 ) ( IN-CITY ?auto_19281 ?auto_19282 ) ( not ( = ?auto_19275 ?auto_19281 ) ) ( OBJ-AT ?auto_19276 ?auto_19281 ) ( IN-CITY ?auto_19280 ?auto_19282 ) ( not ( = ?auto_19275 ?auto_19280 ) ) ( OBJ-AT ?auto_19277 ?auto_19280 ) ( OBJ-AT ?auto_19278 ?auto_19280 ) ( TRUCK-AT ?auto_19284 ?auto_19275 ) ( not ( = ?auto_19278 ?auto_19277 ) ) ( not ( = ?auto_19278 ?auto_19276 ) ) ( not ( = ?auto_19277 ?auto_19276 ) ) ( not ( = ?auto_19281 ?auto_19280 ) ) ( not ( = ?auto_19278 ?auto_19279 ) ) ( not ( = ?auto_19277 ?auto_19279 ) ) ( not ( = ?auto_19276 ?auto_19279 ) ) ( not ( = ?auto_19283 ?auto_19281 ) ) ( not ( = ?auto_19283 ?auto_19280 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_19278 ?auto_19277 ?auto_19279 ?auto_19276 ?auto_19275 )
      ( DELIVER-4PKG-VERIFY ?auto_19276 ?auto_19277 ?auto_19278 ?auto_19279 ?auto_19275 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_19308 - OBJ
      ?auto_19309 - OBJ
      ?auto_19310 - OBJ
      ?auto_19311 - OBJ
      ?auto_19307 - LOCATION
    )
    :vars
    (
      ?auto_19315 - LOCATION
      ?auto_19314 - CITY
      ?auto_19313 - LOCATION
      ?auto_19312 - LOCATION
      ?auto_19316 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_19315 ?auto_19314 ) ( IN-CITY ?auto_19307 ?auto_19314 ) ( not ( = ?auto_19307 ?auto_19315 ) ) ( OBJ-AT ?auto_19310 ?auto_19315 ) ( IN-CITY ?auto_19313 ?auto_19314 ) ( not ( = ?auto_19307 ?auto_19313 ) ) ( OBJ-AT ?auto_19308 ?auto_19313 ) ( IN-CITY ?auto_19312 ?auto_19314 ) ( not ( = ?auto_19307 ?auto_19312 ) ) ( OBJ-AT ?auto_19309 ?auto_19312 ) ( OBJ-AT ?auto_19311 ?auto_19312 ) ( TRUCK-AT ?auto_19316 ?auto_19307 ) ( not ( = ?auto_19311 ?auto_19309 ) ) ( not ( = ?auto_19311 ?auto_19308 ) ) ( not ( = ?auto_19309 ?auto_19308 ) ) ( not ( = ?auto_19313 ?auto_19312 ) ) ( not ( = ?auto_19311 ?auto_19310 ) ) ( not ( = ?auto_19309 ?auto_19310 ) ) ( not ( = ?auto_19308 ?auto_19310 ) ) ( not ( = ?auto_19315 ?auto_19313 ) ) ( not ( = ?auto_19315 ?auto_19312 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_19311 ?auto_19309 ?auto_19310 ?auto_19308 ?auto_19307 )
      ( DELIVER-4PKG-VERIFY ?auto_19308 ?auto_19309 ?auto_19310 ?auto_19311 ?auto_19307 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_19442 - OBJ
      ?auto_19443 - OBJ
      ?auto_19444 - OBJ
      ?auto_19445 - OBJ
      ?auto_19441 - LOCATION
    )
    :vars
    (
      ?auto_19449 - LOCATION
      ?auto_19448 - CITY
      ?auto_19447 - LOCATION
      ?auto_19446 - LOCATION
      ?auto_19450 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_19449 ?auto_19448 ) ( IN-CITY ?auto_19441 ?auto_19448 ) ( not ( = ?auto_19441 ?auto_19449 ) ) ( OBJ-AT ?auto_19443 ?auto_19449 ) ( IN-CITY ?auto_19447 ?auto_19448 ) ( not ( = ?auto_19441 ?auto_19447 ) ) ( OBJ-AT ?auto_19442 ?auto_19447 ) ( IN-CITY ?auto_19446 ?auto_19448 ) ( not ( = ?auto_19441 ?auto_19446 ) ) ( OBJ-AT ?auto_19445 ?auto_19446 ) ( OBJ-AT ?auto_19444 ?auto_19446 ) ( TRUCK-AT ?auto_19450 ?auto_19441 ) ( not ( = ?auto_19444 ?auto_19445 ) ) ( not ( = ?auto_19444 ?auto_19442 ) ) ( not ( = ?auto_19445 ?auto_19442 ) ) ( not ( = ?auto_19447 ?auto_19446 ) ) ( not ( = ?auto_19444 ?auto_19443 ) ) ( not ( = ?auto_19445 ?auto_19443 ) ) ( not ( = ?auto_19442 ?auto_19443 ) ) ( not ( = ?auto_19449 ?auto_19447 ) ) ( not ( = ?auto_19449 ?auto_19446 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_19444 ?auto_19445 ?auto_19443 ?auto_19442 ?auto_19441 )
      ( DELIVER-4PKG-VERIFY ?auto_19442 ?auto_19443 ?auto_19444 ?auto_19445 ?auto_19441 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_19474 - OBJ
      ?auto_19475 - OBJ
      ?auto_19476 - OBJ
      ?auto_19477 - OBJ
      ?auto_19473 - LOCATION
    )
    :vars
    (
      ?auto_19481 - LOCATION
      ?auto_19480 - CITY
      ?auto_19479 - LOCATION
      ?auto_19478 - LOCATION
      ?auto_19482 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_19481 ?auto_19480 ) ( IN-CITY ?auto_19473 ?auto_19480 ) ( not ( = ?auto_19473 ?auto_19481 ) ) ( OBJ-AT ?auto_19475 ?auto_19481 ) ( IN-CITY ?auto_19479 ?auto_19480 ) ( not ( = ?auto_19473 ?auto_19479 ) ) ( OBJ-AT ?auto_19474 ?auto_19479 ) ( IN-CITY ?auto_19478 ?auto_19480 ) ( not ( = ?auto_19473 ?auto_19478 ) ) ( OBJ-AT ?auto_19476 ?auto_19478 ) ( OBJ-AT ?auto_19477 ?auto_19478 ) ( TRUCK-AT ?auto_19482 ?auto_19473 ) ( not ( = ?auto_19477 ?auto_19476 ) ) ( not ( = ?auto_19477 ?auto_19474 ) ) ( not ( = ?auto_19476 ?auto_19474 ) ) ( not ( = ?auto_19479 ?auto_19478 ) ) ( not ( = ?auto_19477 ?auto_19475 ) ) ( not ( = ?auto_19476 ?auto_19475 ) ) ( not ( = ?auto_19474 ?auto_19475 ) ) ( not ( = ?auto_19481 ?auto_19479 ) ) ( not ( = ?auto_19481 ?auto_19478 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_19477 ?auto_19476 ?auto_19475 ?auto_19474 ?auto_19473 )
      ( DELIVER-4PKG-VERIFY ?auto_19474 ?auto_19475 ?auto_19476 ?auto_19477 ?auto_19473 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_19677 - OBJ
      ?auto_19678 - OBJ
      ?auto_19679 - OBJ
      ?auto_19680 - OBJ
      ?auto_19676 - LOCATION
    )
    :vars
    (
      ?auto_19684 - LOCATION
      ?auto_19683 - CITY
      ?auto_19682 - LOCATION
      ?auto_19681 - LOCATION
      ?auto_19685 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_19684 ?auto_19683 ) ( IN-CITY ?auto_19676 ?auto_19683 ) ( not ( = ?auto_19676 ?auto_19684 ) ) ( OBJ-AT ?auto_19677 ?auto_19684 ) ( IN-CITY ?auto_19682 ?auto_19683 ) ( not ( = ?auto_19676 ?auto_19682 ) ) ( OBJ-AT ?auto_19680 ?auto_19682 ) ( IN-CITY ?auto_19681 ?auto_19683 ) ( not ( = ?auto_19676 ?auto_19681 ) ) ( OBJ-AT ?auto_19679 ?auto_19681 ) ( OBJ-AT ?auto_19678 ?auto_19681 ) ( TRUCK-AT ?auto_19685 ?auto_19676 ) ( not ( = ?auto_19678 ?auto_19679 ) ) ( not ( = ?auto_19678 ?auto_19680 ) ) ( not ( = ?auto_19679 ?auto_19680 ) ) ( not ( = ?auto_19682 ?auto_19681 ) ) ( not ( = ?auto_19678 ?auto_19677 ) ) ( not ( = ?auto_19679 ?auto_19677 ) ) ( not ( = ?auto_19680 ?auto_19677 ) ) ( not ( = ?auto_19684 ?auto_19682 ) ) ( not ( = ?auto_19684 ?auto_19681 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_19678 ?auto_19679 ?auto_19677 ?auto_19680 ?auto_19676 )
      ( DELIVER-4PKG-VERIFY ?auto_19677 ?auto_19678 ?auto_19679 ?auto_19680 ?auto_19676 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_19709 - OBJ
      ?auto_19710 - OBJ
      ?auto_19711 - OBJ
      ?auto_19712 - OBJ
      ?auto_19708 - LOCATION
    )
    :vars
    (
      ?auto_19716 - LOCATION
      ?auto_19715 - CITY
      ?auto_19714 - LOCATION
      ?auto_19713 - LOCATION
      ?auto_19717 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_19716 ?auto_19715 ) ( IN-CITY ?auto_19708 ?auto_19715 ) ( not ( = ?auto_19708 ?auto_19716 ) ) ( OBJ-AT ?auto_19709 ?auto_19716 ) ( IN-CITY ?auto_19714 ?auto_19715 ) ( not ( = ?auto_19708 ?auto_19714 ) ) ( OBJ-AT ?auto_19711 ?auto_19714 ) ( IN-CITY ?auto_19713 ?auto_19715 ) ( not ( = ?auto_19708 ?auto_19713 ) ) ( OBJ-AT ?auto_19712 ?auto_19713 ) ( OBJ-AT ?auto_19710 ?auto_19713 ) ( TRUCK-AT ?auto_19717 ?auto_19708 ) ( not ( = ?auto_19710 ?auto_19712 ) ) ( not ( = ?auto_19710 ?auto_19711 ) ) ( not ( = ?auto_19712 ?auto_19711 ) ) ( not ( = ?auto_19714 ?auto_19713 ) ) ( not ( = ?auto_19710 ?auto_19709 ) ) ( not ( = ?auto_19712 ?auto_19709 ) ) ( not ( = ?auto_19711 ?auto_19709 ) ) ( not ( = ?auto_19716 ?auto_19714 ) ) ( not ( = ?auto_19716 ?auto_19713 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_19710 ?auto_19712 ?auto_19709 ?auto_19711 ?auto_19708 )
      ( DELIVER-4PKG-VERIFY ?auto_19709 ?auto_19710 ?auto_19711 ?auto_19712 ?auto_19708 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_19809 - OBJ
      ?auto_19810 - OBJ
      ?auto_19811 - OBJ
      ?auto_19812 - OBJ
      ?auto_19808 - LOCATION
    )
    :vars
    (
      ?auto_19816 - LOCATION
      ?auto_19815 - CITY
      ?auto_19814 - LOCATION
      ?auto_19813 - LOCATION
      ?auto_19817 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_19816 ?auto_19815 ) ( IN-CITY ?auto_19808 ?auto_19815 ) ( not ( = ?auto_19808 ?auto_19816 ) ) ( OBJ-AT ?auto_19809 ?auto_19816 ) ( IN-CITY ?auto_19814 ?auto_19815 ) ( not ( = ?auto_19808 ?auto_19814 ) ) ( OBJ-AT ?auto_19812 ?auto_19814 ) ( IN-CITY ?auto_19813 ?auto_19815 ) ( not ( = ?auto_19808 ?auto_19813 ) ) ( OBJ-AT ?auto_19810 ?auto_19813 ) ( OBJ-AT ?auto_19811 ?auto_19813 ) ( TRUCK-AT ?auto_19817 ?auto_19808 ) ( not ( = ?auto_19811 ?auto_19810 ) ) ( not ( = ?auto_19811 ?auto_19812 ) ) ( not ( = ?auto_19810 ?auto_19812 ) ) ( not ( = ?auto_19814 ?auto_19813 ) ) ( not ( = ?auto_19811 ?auto_19809 ) ) ( not ( = ?auto_19810 ?auto_19809 ) ) ( not ( = ?auto_19812 ?auto_19809 ) ) ( not ( = ?auto_19816 ?auto_19814 ) ) ( not ( = ?auto_19816 ?auto_19813 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_19811 ?auto_19810 ?auto_19809 ?auto_19812 ?auto_19808 )
      ( DELIVER-4PKG-VERIFY ?auto_19809 ?auto_19810 ?auto_19811 ?auto_19812 ?auto_19808 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_19876 - OBJ
      ?auto_19877 - OBJ
      ?auto_19878 - OBJ
      ?auto_19879 - OBJ
      ?auto_19875 - LOCATION
    )
    :vars
    (
      ?auto_19883 - LOCATION
      ?auto_19882 - CITY
      ?auto_19881 - LOCATION
      ?auto_19880 - LOCATION
      ?auto_19884 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_19883 ?auto_19882 ) ( IN-CITY ?auto_19875 ?auto_19882 ) ( not ( = ?auto_19875 ?auto_19883 ) ) ( OBJ-AT ?auto_19876 ?auto_19883 ) ( IN-CITY ?auto_19881 ?auto_19882 ) ( not ( = ?auto_19875 ?auto_19881 ) ) ( OBJ-AT ?auto_19878 ?auto_19881 ) ( IN-CITY ?auto_19880 ?auto_19882 ) ( not ( = ?auto_19875 ?auto_19880 ) ) ( OBJ-AT ?auto_19877 ?auto_19880 ) ( OBJ-AT ?auto_19879 ?auto_19880 ) ( TRUCK-AT ?auto_19884 ?auto_19875 ) ( not ( = ?auto_19879 ?auto_19877 ) ) ( not ( = ?auto_19879 ?auto_19878 ) ) ( not ( = ?auto_19877 ?auto_19878 ) ) ( not ( = ?auto_19881 ?auto_19880 ) ) ( not ( = ?auto_19879 ?auto_19876 ) ) ( not ( = ?auto_19877 ?auto_19876 ) ) ( not ( = ?auto_19878 ?auto_19876 ) ) ( not ( = ?auto_19883 ?auto_19881 ) ) ( not ( = ?auto_19883 ?auto_19880 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_19879 ?auto_19877 ?auto_19876 ?auto_19878 ?auto_19875 )
      ( DELIVER-4PKG-VERIFY ?auto_19876 ?auto_19877 ?auto_19878 ?auto_19879 ?auto_19875 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_19976 - OBJ
      ?auto_19977 - OBJ
      ?auto_19978 - OBJ
      ?auto_19979 - OBJ
      ?auto_19975 - LOCATION
    )
    :vars
    (
      ?auto_19983 - LOCATION
      ?auto_19982 - CITY
      ?auto_19981 - LOCATION
      ?auto_19980 - LOCATION
      ?auto_19984 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_19983 ?auto_19982 ) ( IN-CITY ?auto_19975 ?auto_19982 ) ( not ( = ?auto_19975 ?auto_19983 ) ) ( OBJ-AT ?auto_19976 ?auto_19983 ) ( IN-CITY ?auto_19981 ?auto_19982 ) ( not ( = ?auto_19975 ?auto_19981 ) ) ( OBJ-AT ?auto_19977 ?auto_19981 ) ( IN-CITY ?auto_19980 ?auto_19982 ) ( not ( = ?auto_19975 ?auto_19980 ) ) ( OBJ-AT ?auto_19979 ?auto_19980 ) ( OBJ-AT ?auto_19978 ?auto_19980 ) ( TRUCK-AT ?auto_19984 ?auto_19975 ) ( not ( = ?auto_19978 ?auto_19979 ) ) ( not ( = ?auto_19978 ?auto_19977 ) ) ( not ( = ?auto_19979 ?auto_19977 ) ) ( not ( = ?auto_19981 ?auto_19980 ) ) ( not ( = ?auto_19978 ?auto_19976 ) ) ( not ( = ?auto_19979 ?auto_19976 ) ) ( not ( = ?auto_19977 ?auto_19976 ) ) ( not ( = ?auto_19983 ?auto_19981 ) ) ( not ( = ?auto_19983 ?auto_19980 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_19978 ?auto_19979 ?auto_19976 ?auto_19977 ?auto_19975 )
      ( DELIVER-4PKG-VERIFY ?auto_19976 ?auto_19977 ?auto_19978 ?auto_19979 ?auto_19975 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_20008 - OBJ
      ?auto_20009 - OBJ
      ?auto_20010 - OBJ
      ?auto_20011 - OBJ
      ?auto_20007 - LOCATION
    )
    :vars
    (
      ?auto_20015 - LOCATION
      ?auto_20014 - CITY
      ?auto_20013 - LOCATION
      ?auto_20012 - LOCATION
      ?auto_20016 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_20015 ?auto_20014 ) ( IN-CITY ?auto_20007 ?auto_20014 ) ( not ( = ?auto_20007 ?auto_20015 ) ) ( OBJ-AT ?auto_20008 ?auto_20015 ) ( IN-CITY ?auto_20013 ?auto_20014 ) ( not ( = ?auto_20007 ?auto_20013 ) ) ( OBJ-AT ?auto_20009 ?auto_20013 ) ( IN-CITY ?auto_20012 ?auto_20014 ) ( not ( = ?auto_20007 ?auto_20012 ) ) ( OBJ-AT ?auto_20010 ?auto_20012 ) ( OBJ-AT ?auto_20011 ?auto_20012 ) ( TRUCK-AT ?auto_20016 ?auto_20007 ) ( not ( = ?auto_20011 ?auto_20010 ) ) ( not ( = ?auto_20011 ?auto_20009 ) ) ( not ( = ?auto_20010 ?auto_20009 ) ) ( not ( = ?auto_20013 ?auto_20012 ) ) ( not ( = ?auto_20011 ?auto_20008 ) ) ( not ( = ?auto_20010 ?auto_20008 ) ) ( not ( = ?auto_20009 ?auto_20008 ) ) ( not ( = ?auto_20015 ?auto_20013 ) ) ( not ( = ?auto_20015 ?auto_20012 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_20011 ?auto_20010 ?auto_20008 ?auto_20009 ?auto_20007 )
      ( DELIVER-4PKG-VERIFY ?auto_20008 ?auto_20009 ?auto_20010 ?auto_20011 ?auto_20007 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_20332 - OBJ
      ?auto_20331 - LOCATION
    )
    :vars
    (
      ?auto_20334 - LOCATION
      ?auto_20335 - CITY
      ?auto_20333 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_20334 ?auto_20335 ) ( IN-CITY ?auto_20331 ?auto_20335 ) ( not ( = ?auto_20331 ?auto_20334 ) ) ( OBJ-AT ?auto_20332 ?auto_20334 ) ( TRUCK-AT ?auto_20333 ?auto_20331 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_20333 ?auto_20331 ?auto_20334 ?auto_20335 )
      ( !LOAD-TRUCK ?auto_20332 ?auto_20333 ?auto_20334 )
      ( !DRIVE-TRUCK ?auto_20333 ?auto_20334 ?auto_20331 ?auto_20335 )
      ( !UNLOAD-TRUCK ?auto_20332 ?auto_20333 ?auto_20331 )
      ( DELIVER-1PKG-VERIFY ?auto_20332 ?auto_20331 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_33987 - OBJ
      ?auto_33988 - OBJ
      ?auto_33989 - OBJ
      ?auto_33990 - OBJ
      ?auto_33991 - OBJ
      ?auto_33986 - LOCATION
    )
    :vars
    (
      ?auto_33992 - LOCATION
      ?auto_33994 - CITY
      ?auto_33996 - LOCATION
      ?auto_33995 - LOCATION
      ?auto_33993 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_33992 ?auto_33994 ) ( IN-CITY ?auto_33986 ?auto_33994 ) ( not ( = ?auto_33986 ?auto_33992 ) ) ( OBJ-AT ?auto_33991 ?auto_33992 ) ( OBJ-AT ?auto_33990 ?auto_33992 ) ( IN-CITY ?auto_33996 ?auto_33994 ) ( not ( = ?auto_33986 ?auto_33996 ) ) ( OBJ-AT ?auto_33989 ?auto_33996 ) ( IN-CITY ?auto_33995 ?auto_33994 ) ( not ( = ?auto_33986 ?auto_33995 ) ) ( OBJ-AT ?auto_33988 ?auto_33995 ) ( OBJ-AT ?auto_33987 ?auto_33995 ) ( TRUCK-AT ?auto_33993 ?auto_33986 ) ( not ( = ?auto_33987 ?auto_33988 ) ) ( not ( = ?auto_33987 ?auto_33989 ) ) ( not ( = ?auto_33988 ?auto_33989 ) ) ( not ( = ?auto_33996 ?auto_33995 ) ) ( not ( = ?auto_33987 ?auto_33990 ) ) ( not ( = ?auto_33988 ?auto_33990 ) ) ( not ( = ?auto_33989 ?auto_33990 ) ) ( not ( = ?auto_33992 ?auto_33996 ) ) ( not ( = ?auto_33992 ?auto_33995 ) ) ( not ( = ?auto_33987 ?auto_33991 ) ) ( not ( = ?auto_33988 ?auto_33991 ) ) ( not ( = ?auto_33989 ?auto_33991 ) ) ( not ( = ?auto_33990 ?auto_33991 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_33987 ?auto_33988 ?auto_33990 ?auto_33989 ?auto_33986 )
      ( DELIVER-1PKG ?auto_33991 ?auto_33986 )
      ( DELIVER-5PKG-VERIFY ?auto_33987 ?auto_33988 ?auto_33989 ?auto_33990 ?auto_33991 ?auto_33986 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_34034 - OBJ
      ?auto_34035 - OBJ
      ?auto_34036 - OBJ
      ?auto_34037 - OBJ
      ?auto_34038 - OBJ
      ?auto_34033 - LOCATION
    )
    :vars
    (
      ?auto_34040 - LOCATION
      ?auto_34041 - CITY
      ?auto_34042 - LOCATION
      ?auto_34039 - LOCATION
      ?auto_34043 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_34040 ?auto_34041 ) ( IN-CITY ?auto_34033 ?auto_34041 ) ( not ( = ?auto_34033 ?auto_34040 ) ) ( OBJ-AT ?auto_34037 ?auto_34040 ) ( OBJ-AT ?auto_34038 ?auto_34040 ) ( IN-CITY ?auto_34042 ?auto_34041 ) ( not ( = ?auto_34033 ?auto_34042 ) ) ( OBJ-AT ?auto_34036 ?auto_34042 ) ( IN-CITY ?auto_34039 ?auto_34041 ) ( not ( = ?auto_34033 ?auto_34039 ) ) ( OBJ-AT ?auto_34035 ?auto_34039 ) ( OBJ-AT ?auto_34034 ?auto_34039 ) ( TRUCK-AT ?auto_34043 ?auto_34033 ) ( not ( = ?auto_34034 ?auto_34035 ) ) ( not ( = ?auto_34034 ?auto_34036 ) ) ( not ( = ?auto_34035 ?auto_34036 ) ) ( not ( = ?auto_34042 ?auto_34039 ) ) ( not ( = ?auto_34034 ?auto_34038 ) ) ( not ( = ?auto_34035 ?auto_34038 ) ) ( not ( = ?auto_34036 ?auto_34038 ) ) ( not ( = ?auto_34040 ?auto_34042 ) ) ( not ( = ?auto_34040 ?auto_34039 ) ) ( not ( = ?auto_34034 ?auto_34037 ) ) ( not ( = ?auto_34035 ?auto_34037 ) ) ( not ( = ?auto_34036 ?auto_34037 ) ) ( not ( = ?auto_34038 ?auto_34037 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_34034 ?auto_34035 ?auto_34036 ?auto_34038 ?auto_34037 ?auto_34033 )
      ( DELIVER-5PKG-VERIFY ?auto_34034 ?auto_34035 ?auto_34036 ?auto_34037 ?auto_34038 ?auto_34033 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_34081 - OBJ
      ?auto_34082 - OBJ
      ?auto_34083 - OBJ
      ?auto_34084 - OBJ
      ?auto_34085 - OBJ
      ?auto_34080 - LOCATION
    )
    :vars
    (
      ?auto_34088 - LOCATION
      ?auto_34089 - CITY
      ?auto_34086 - LOCATION
      ?auto_34087 - LOCATION
      ?auto_34090 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_34088 ?auto_34089 ) ( IN-CITY ?auto_34080 ?auto_34089 ) ( not ( = ?auto_34080 ?auto_34088 ) ) ( OBJ-AT ?auto_34085 ?auto_34088 ) ( OBJ-AT ?auto_34083 ?auto_34088 ) ( IN-CITY ?auto_34086 ?auto_34089 ) ( not ( = ?auto_34080 ?auto_34086 ) ) ( OBJ-AT ?auto_34084 ?auto_34086 ) ( IN-CITY ?auto_34087 ?auto_34089 ) ( not ( = ?auto_34080 ?auto_34087 ) ) ( OBJ-AT ?auto_34082 ?auto_34087 ) ( OBJ-AT ?auto_34081 ?auto_34087 ) ( TRUCK-AT ?auto_34090 ?auto_34080 ) ( not ( = ?auto_34081 ?auto_34082 ) ) ( not ( = ?auto_34081 ?auto_34084 ) ) ( not ( = ?auto_34082 ?auto_34084 ) ) ( not ( = ?auto_34086 ?auto_34087 ) ) ( not ( = ?auto_34081 ?auto_34083 ) ) ( not ( = ?auto_34082 ?auto_34083 ) ) ( not ( = ?auto_34084 ?auto_34083 ) ) ( not ( = ?auto_34088 ?auto_34086 ) ) ( not ( = ?auto_34088 ?auto_34087 ) ) ( not ( = ?auto_34081 ?auto_34085 ) ) ( not ( = ?auto_34082 ?auto_34085 ) ) ( not ( = ?auto_34084 ?auto_34085 ) ) ( not ( = ?auto_34083 ?auto_34085 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_34081 ?auto_34082 ?auto_34084 ?auto_34085 ?auto_34083 ?auto_34080 )
      ( DELIVER-5PKG-VERIFY ?auto_34081 ?auto_34082 ?auto_34083 ?auto_34084 ?auto_34085 ?auto_34080 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_34128 - OBJ
      ?auto_34129 - OBJ
      ?auto_34130 - OBJ
      ?auto_34131 - OBJ
      ?auto_34132 - OBJ
      ?auto_34127 - LOCATION
    )
    :vars
    (
      ?auto_34135 - LOCATION
      ?auto_34136 - CITY
      ?auto_34133 - LOCATION
      ?auto_34134 - LOCATION
      ?auto_34137 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_34135 ?auto_34136 ) ( IN-CITY ?auto_34127 ?auto_34136 ) ( not ( = ?auto_34127 ?auto_34135 ) ) ( OBJ-AT ?auto_34131 ?auto_34135 ) ( OBJ-AT ?auto_34130 ?auto_34135 ) ( IN-CITY ?auto_34133 ?auto_34136 ) ( not ( = ?auto_34127 ?auto_34133 ) ) ( OBJ-AT ?auto_34132 ?auto_34133 ) ( IN-CITY ?auto_34134 ?auto_34136 ) ( not ( = ?auto_34127 ?auto_34134 ) ) ( OBJ-AT ?auto_34129 ?auto_34134 ) ( OBJ-AT ?auto_34128 ?auto_34134 ) ( TRUCK-AT ?auto_34137 ?auto_34127 ) ( not ( = ?auto_34128 ?auto_34129 ) ) ( not ( = ?auto_34128 ?auto_34132 ) ) ( not ( = ?auto_34129 ?auto_34132 ) ) ( not ( = ?auto_34133 ?auto_34134 ) ) ( not ( = ?auto_34128 ?auto_34130 ) ) ( not ( = ?auto_34129 ?auto_34130 ) ) ( not ( = ?auto_34132 ?auto_34130 ) ) ( not ( = ?auto_34135 ?auto_34133 ) ) ( not ( = ?auto_34135 ?auto_34134 ) ) ( not ( = ?auto_34128 ?auto_34131 ) ) ( not ( = ?auto_34129 ?auto_34131 ) ) ( not ( = ?auto_34132 ?auto_34131 ) ) ( not ( = ?auto_34130 ?auto_34131 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_34128 ?auto_34129 ?auto_34132 ?auto_34131 ?auto_34130 ?auto_34127 )
      ( DELIVER-5PKG-VERIFY ?auto_34128 ?auto_34129 ?auto_34130 ?auto_34131 ?auto_34132 ?auto_34127 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_34325 - OBJ
      ?auto_34326 - OBJ
      ?auto_34327 - OBJ
      ?auto_34328 - OBJ
      ?auto_34329 - OBJ
      ?auto_34324 - LOCATION
    )
    :vars
    (
      ?auto_34332 - LOCATION
      ?auto_34333 - CITY
      ?auto_34330 - LOCATION
      ?auto_34331 - LOCATION
      ?auto_34334 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_34332 ?auto_34333 ) ( IN-CITY ?auto_34324 ?auto_34333 ) ( not ( = ?auto_34324 ?auto_34332 ) ) ( OBJ-AT ?auto_34327 ?auto_34332 ) ( OBJ-AT ?auto_34329 ?auto_34332 ) ( IN-CITY ?auto_34330 ?auto_34333 ) ( not ( = ?auto_34324 ?auto_34330 ) ) ( OBJ-AT ?auto_34328 ?auto_34330 ) ( IN-CITY ?auto_34331 ?auto_34333 ) ( not ( = ?auto_34324 ?auto_34331 ) ) ( OBJ-AT ?auto_34326 ?auto_34331 ) ( OBJ-AT ?auto_34325 ?auto_34331 ) ( TRUCK-AT ?auto_34334 ?auto_34324 ) ( not ( = ?auto_34325 ?auto_34326 ) ) ( not ( = ?auto_34325 ?auto_34328 ) ) ( not ( = ?auto_34326 ?auto_34328 ) ) ( not ( = ?auto_34330 ?auto_34331 ) ) ( not ( = ?auto_34325 ?auto_34329 ) ) ( not ( = ?auto_34326 ?auto_34329 ) ) ( not ( = ?auto_34328 ?auto_34329 ) ) ( not ( = ?auto_34332 ?auto_34330 ) ) ( not ( = ?auto_34332 ?auto_34331 ) ) ( not ( = ?auto_34325 ?auto_34327 ) ) ( not ( = ?auto_34326 ?auto_34327 ) ) ( not ( = ?auto_34328 ?auto_34327 ) ) ( not ( = ?auto_34329 ?auto_34327 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_34325 ?auto_34326 ?auto_34328 ?auto_34327 ?auto_34329 ?auto_34324 )
      ( DELIVER-5PKG-VERIFY ?auto_34325 ?auto_34326 ?auto_34327 ?auto_34328 ?auto_34329 ?auto_34324 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_34372 - OBJ
      ?auto_34373 - OBJ
      ?auto_34374 - OBJ
      ?auto_34375 - OBJ
      ?auto_34376 - OBJ
      ?auto_34371 - LOCATION
    )
    :vars
    (
      ?auto_34379 - LOCATION
      ?auto_34380 - CITY
      ?auto_34377 - LOCATION
      ?auto_34378 - LOCATION
      ?auto_34381 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_34379 ?auto_34380 ) ( IN-CITY ?auto_34371 ?auto_34380 ) ( not ( = ?auto_34371 ?auto_34379 ) ) ( OBJ-AT ?auto_34374 ?auto_34379 ) ( OBJ-AT ?auto_34375 ?auto_34379 ) ( IN-CITY ?auto_34377 ?auto_34380 ) ( not ( = ?auto_34371 ?auto_34377 ) ) ( OBJ-AT ?auto_34376 ?auto_34377 ) ( IN-CITY ?auto_34378 ?auto_34380 ) ( not ( = ?auto_34371 ?auto_34378 ) ) ( OBJ-AT ?auto_34373 ?auto_34378 ) ( OBJ-AT ?auto_34372 ?auto_34378 ) ( TRUCK-AT ?auto_34381 ?auto_34371 ) ( not ( = ?auto_34372 ?auto_34373 ) ) ( not ( = ?auto_34372 ?auto_34376 ) ) ( not ( = ?auto_34373 ?auto_34376 ) ) ( not ( = ?auto_34377 ?auto_34378 ) ) ( not ( = ?auto_34372 ?auto_34375 ) ) ( not ( = ?auto_34373 ?auto_34375 ) ) ( not ( = ?auto_34376 ?auto_34375 ) ) ( not ( = ?auto_34379 ?auto_34377 ) ) ( not ( = ?auto_34379 ?auto_34378 ) ) ( not ( = ?auto_34372 ?auto_34374 ) ) ( not ( = ?auto_34373 ?auto_34374 ) ) ( not ( = ?auto_34376 ?auto_34374 ) ) ( not ( = ?auto_34375 ?auto_34374 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_34372 ?auto_34373 ?auto_34376 ?auto_34374 ?auto_34375 ?auto_34371 )
      ( DELIVER-5PKG-VERIFY ?auto_34372 ?auto_34373 ?auto_34374 ?auto_34375 ?auto_34376 ?auto_34371 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_34619 - OBJ
      ?auto_34620 - OBJ
      ?auto_34621 - OBJ
      ?auto_34622 - OBJ
      ?auto_34623 - OBJ
      ?auto_34618 - LOCATION
    )
    :vars
    (
      ?auto_34626 - LOCATION
      ?auto_34627 - CITY
      ?auto_34624 - LOCATION
      ?auto_34625 - LOCATION
      ?auto_34628 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_34626 ?auto_34627 ) ( IN-CITY ?auto_34618 ?auto_34627 ) ( not ( = ?auto_34618 ?auto_34626 ) ) ( OBJ-AT ?auto_34623 ?auto_34626 ) ( OBJ-AT ?auto_34622 ?auto_34626 ) ( IN-CITY ?auto_34624 ?auto_34627 ) ( not ( = ?auto_34618 ?auto_34624 ) ) ( OBJ-AT ?auto_34620 ?auto_34624 ) ( IN-CITY ?auto_34625 ?auto_34627 ) ( not ( = ?auto_34618 ?auto_34625 ) ) ( OBJ-AT ?auto_34621 ?auto_34625 ) ( OBJ-AT ?auto_34619 ?auto_34625 ) ( TRUCK-AT ?auto_34628 ?auto_34618 ) ( not ( = ?auto_34619 ?auto_34621 ) ) ( not ( = ?auto_34619 ?auto_34620 ) ) ( not ( = ?auto_34621 ?auto_34620 ) ) ( not ( = ?auto_34624 ?auto_34625 ) ) ( not ( = ?auto_34619 ?auto_34622 ) ) ( not ( = ?auto_34621 ?auto_34622 ) ) ( not ( = ?auto_34620 ?auto_34622 ) ) ( not ( = ?auto_34626 ?auto_34624 ) ) ( not ( = ?auto_34626 ?auto_34625 ) ) ( not ( = ?auto_34619 ?auto_34623 ) ) ( not ( = ?auto_34621 ?auto_34623 ) ) ( not ( = ?auto_34620 ?auto_34623 ) ) ( not ( = ?auto_34622 ?auto_34623 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_34619 ?auto_34621 ?auto_34620 ?auto_34623 ?auto_34622 ?auto_34618 )
      ( DELIVER-5PKG-VERIFY ?auto_34619 ?auto_34620 ?auto_34621 ?auto_34622 ?auto_34623 ?auto_34618 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_34666 - OBJ
      ?auto_34667 - OBJ
      ?auto_34668 - OBJ
      ?auto_34669 - OBJ
      ?auto_34670 - OBJ
      ?auto_34665 - LOCATION
    )
    :vars
    (
      ?auto_34673 - LOCATION
      ?auto_34674 - CITY
      ?auto_34671 - LOCATION
      ?auto_34672 - LOCATION
      ?auto_34675 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_34673 ?auto_34674 ) ( IN-CITY ?auto_34665 ?auto_34674 ) ( not ( = ?auto_34665 ?auto_34673 ) ) ( OBJ-AT ?auto_34669 ?auto_34673 ) ( OBJ-AT ?auto_34670 ?auto_34673 ) ( IN-CITY ?auto_34671 ?auto_34674 ) ( not ( = ?auto_34665 ?auto_34671 ) ) ( OBJ-AT ?auto_34667 ?auto_34671 ) ( IN-CITY ?auto_34672 ?auto_34674 ) ( not ( = ?auto_34665 ?auto_34672 ) ) ( OBJ-AT ?auto_34668 ?auto_34672 ) ( OBJ-AT ?auto_34666 ?auto_34672 ) ( TRUCK-AT ?auto_34675 ?auto_34665 ) ( not ( = ?auto_34666 ?auto_34668 ) ) ( not ( = ?auto_34666 ?auto_34667 ) ) ( not ( = ?auto_34668 ?auto_34667 ) ) ( not ( = ?auto_34671 ?auto_34672 ) ) ( not ( = ?auto_34666 ?auto_34670 ) ) ( not ( = ?auto_34668 ?auto_34670 ) ) ( not ( = ?auto_34667 ?auto_34670 ) ) ( not ( = ?auto_34673 ?auto_34671 ) ) ( not ( = ?auto_34673 ?auto_34672 ) ) ( not ( = ?auto_34666 ?auto_34669 ) ) ( not ( = ?auto_34668 ?auto_34669 ) ) ( not ( = ?auto_34667 ?auto_34669 ) ) ( not ( = ?auto_34670 ?auto_34669 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_34666 ?auto_34668 ?auto_34667 ?auto_34669 ?auto_34670 ?auto_34665 )
      ( DELIVER-5PKG-VERIFY ?auto_34666 ?auto_34667 ?auto_34668 ?auto_34669 ?auto_34670 ?auto_34665 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_34814 - OBJ
      ?auto_34815 - OBJ
      ?auto_34816 - OBJ
      ?auto_34817 - OBJ
      ?auto_34818 - OBJ
      ?auto_34813 - LOCATION
    )
    :vars
    (
      ?auto_34821 - LOCATION
      ?auto_34822 - CITY
      ?auto_34819 - LOCATION
      ?auto_34820 - LOCATION
      ?auto_34823 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_34821 ?auto_34822 ) ( IN-CITY ?auto_34813 ?auto_34822 ) ( not ( = ?auto_34813 ?auto_34821 ) ) ( OBJ-AT ?auto_34818 ?auto_34821 ) ( OBJ-AT ?auto_34816 ?auto_34821 ) ( IN-CITY ?auto_34819 ?auto_34822 ) ( not ( = ?auto_34813 ?auto_34819 ) ) ( OBJ-AT ?auto_34815 ?auto_34819 ) ( IN-CITY ?auto_34820 ?auto_34822 ) ( not ( = ?auto_34813 ?auto_34820 ) ) ( OBJ-AT ?auto_34817 ?auto_34820 ) ( OBJ-AT ?auto_34814 ?auto_34820 ) ( TRUCK-AT ?auto_34823 ?auto_34813 ) ( not ( = ?auto_34814 ?auto_34817 ) ) ( not ( = ?auto_34814 ?auto_34815 ) ) ( not ( = ?auto_34817 ?auto_34815 ) ) ( not ( = ?auto_34819 ?auto_34820 ) ) ( not ( = ?auto_34814 ?auto_34816 ) ) ( not ( = ?auto_34817 ?auto_34816 ) ) ( not ( = ?auto_34815 ?auto_34816 ) ) ( not ( = ?auto_34821 ?auto_34819 ) ) ( not ( = ?auto_34821 ?auto_34820 ) ) ( not ( = ?auto_34814 ?auto_34818 ) ) ( not ( = ?auto_34817 ?auto_34818 ) ) ( not ( = ?auto_34815 ?auto_34818 ) ) ( not ( = ?auto_34816 ?auto_34818 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_34814 ?auto_34817 ?auto_34815 ?auto_34818 ?auto_34816 ?auto_34813 )
      ( DELIVER-5PKG-VERIFY ?auto_34814 ?auto_34815 ?auto_34816 ?auto_34817 ?auto_34818 ?auto_34813 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_34861 - OBJ
      ?auto_34862 - OBJ
      ?auto_34863 - OBJ
      ?auto_34864 - OBJ
      ?auto_34865 - OBJ
      ?auto_34860 - LOCATION
    )
    :vars
    (
      ?auto_34868 - LOCATION
      ?auto_34869 - CITY
      ?auto_34866 - LOCATION
      ?auto_34867 - LOCATION
      ?auto_34870 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_34868 ?auto_34869 ) ( IN-CITY ?auto_34860 ?auto_34869 ) ( not ( = ?auto_34860 ?auto_34868 ) ) ( OBJ-AT ?auto_34864 ?auto_34868 ) ( OBJ-AT ?auto_34863 ?auto_34868 ) ( IN-CITY ?auto_34866 ?auto_34869 ) ( not ( = ?auto_34860 ?auto_34866 ) ) ( OBJ-AT ?auto_34862 ?auto_34866 ) ( IN-CITY ?auto_34867 ?auto_34869 ) ( not ( = ?auto_34860 ?auto_34867 ) ) ( OBJ-AT ?auto_34865 ?auto_34867 ) ( OBJ-AT ?auto_34861 ?auto_34867 ) ( TRUCK-AT ?auto_34870 ?auto_34860 ) ( not ( = ?auto_34861 ?auto_34865 ) ) ( not ( = ?auto_34861 ?auto_34862 ) ) ( not ( = ?auto_34865 ?auto_34862 ) ) ( not ( = ?auto_34866 ?auto_34867 ) ) ( not ( = ?auto_34861 ?auto_34863 ) ) ( not ( = ?auto_34865 ?auto_34863 ) ) ( not ( = ?auto_34862 ?auto_34863 ) ) ( not ( = ?auto_34868 ?auto_34866 ) ) ( not ( = ?auto_34868 ?auto_34867 ) ) ( not ( = ?auto_34861 ?auto_34864 ) ) ( not ( = ?auto_34865 ?auto_34864 ) ) ( not ( = ?auto_34862 ?auto_34864 ) ) ( not ( = ?auto_34863 ?auto_34864 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_34861 ?auto_34865 ?auto_34862 ?auto_34864 ?auto_34863 ?auto_34860 )
      ( DELIVER-5PKG-VERIFY ?auto_34861 ?auto_34862 ?auto_34863 ?auto_34864 ?auto_34865 ?auto_34860 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_35007 - OBJ
      ?auto_35008 - OBJ
      ?auto_35009 - OBJ
      ?auto_35010 - OBJ
      ?auto_35011 - OBJ
      ?auto_35006 - LOCATION
    )
    :vars
    (
      ?auto_35014 - LOCATION
      ?auto_35015 - CITY
      ?auto_35012 - LOCATION
      ?auto_35013 - LOCATION
      ?auto_35016 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_35014 ?auto_35015 ) ( IN-CITY ?auto_35006 ?auto_35015 ) ( not ( = ?auto_35006 ?auto_35014 ) ) ( OBJ-AT ?auto_35009 ?auto_35014 ) ( OBJ-AT ?auto_35011 ?auto_35014 ) ( IN-CITY ?auto_35012 ?auto_35015 ) ( not ( = ?auto_35006 ?auto_35012 ) ) ( OBJ-AT ?auto_35008 ?auto_35012 ) ( IN-CITY ?auto_35013 ?auto_35015 ) ( not ( = ?auto_35006 ?auto_35013 ) ) ( OBJ-AT ?auto_35010 ?auto_35013 ) ( OBJ-AT ?auto_35007 ?auto_35013 ) ( TRUCK-AT ?auto_35016 ?auto_35006 ) ( not ( = ?auto_35007 ?auto_35010 ) ) ( not ( = ?auto_35007 ?auto_35008 ) ) ( not ( = ?auto_35010 ?auto_35008 ) ) ( not ( = ?auto_35012 ?auto_35013 ) ) ( not ( = ?auto_35007 ?auto_35011 ) ) ( not ( = ?auto_35010 ?auto_35011 ) ) ( not ( = ?auto_35008 ?auto_35011 ) ) ( not ( = ?auto_35014 ?auto_35012 ) ) ( not ( = ?auto_35014 ?auto_35013 ) ) ( not ( = ?auto_35007 ?auto_35009 ) ) ( not ( = ?auto_35010 ?auto_35009 ) ) ( not ( = ?auto_35008 ?auto_35009 ) ) ( not ( = ?auto_35011 ?auto_35009 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_35007 ?auto_35010 ?auto_35008 ?auto_35009 ?auto_35011 ?auto_35006 )
      ( DELIVER-5PKG-VERIFY ?auto_35007 ?auto_35008 ?auto_35009 ?auto_35010 ?auto_35011 ?auto_35006 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_35105 - OBJ
      ?auto_35106 - OBJ
      ?auto_35107 - OBJ
      ?auto_35108 - OBJ
      ?auto_35109 - OBJ
      ?auto_35104 - LOCATION
    )
    :vars
    (
      ?auto_35112 - LOCATION
      ?auto_35113 - CITY
      ?auto_35110 - LOCATION
      ?auto_35111 - LOCATION
      ?auto_35114 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_35112 ?auto_35113 ) ( IN-CITY ?auto_35104 ?auto_35113 ) ( not ( = ?auto_35104 ?auto_35112 ) ) ( OBJ-AT ?auto_35107 ?auto_35112 ) ( OBJ-AT ?auto_35108 ?auto_35112 ) ( IN-CITY ?auto_35110 ?auto_35113 ) ( not ( = ?auto_35104 ?auto_35110 ) ) ( OBJ-AT ?auto_35106 ?auto_35110 ) ( IN-CITY ?auto_35111 ?auto_35113 ) ( not ( = ?auto_35104 ?auto_35111 ) ) ( OBJ-AT ?auto_35109 ?auto_35111 ) ( OBJ-AT ?auto_35105 ?auto_35111 ) ( TRUCK-AT ?auto_35114 ?auto_35104 ) ( not ( = ?auto_35105 ?auto_35109 ) ) ( not ( = ?auto_35105 ?auto_35106 ) ) ( not ( = ?auto_35109 ?auto_35106 ) ) ( not ( = ?auto_35110 ?auto_35111 ) ) ( not ( = ?auto_35105 ?auto_35108 ) ) ( not ( = ?auto_35109 ?auto_35108 ) ) ( not ( = ?auto_35106 ?auto_35108 ) ) ( not ( = ?auto_35112 ?auto_35110 ) ) ( not ( = ?auto_35112 ?auto_35111 ) ) ( not ( = ?auto_35105 ?auto_35107 ) ) ( not ( = ?auto_35109 ?auto_35107 ) ) ( not ( = ?auto_35106 ?auto_35107 ) ) ( not ( = ?auto_35108 ?auto_35107 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_35105 ?auto_35109 ?auto_35106 ?auto_35107 ?auto_35108 ?auto_35104 )
      ( DELIVER-5PKG-VERIFY ?auto_35105 ?auto_35106 ?auto_35107 ?auto_35108 ?auto_35109 ?auto_35104 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_35352 - OBJ
      ?auto_35353 - OBJ
      ?auto_35354 - OBJ
      ?auto_35355 - OBJ
      ?auto_35356 - OBJ
      ?auto_35351 - LOCATION
    )
    :vars
    (
      ?auto_35359 - LOCATION
      ?auto_35360 - CITY
      ?auto_35357 - LOCATION
      ?auto_35358 - LOCATION
      ?auto_35361 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_35359 ?auto_35360 ) ( IN-CITY ?auto_35351 ?auto_35360 ) ( not ( = ?auto_35351 ?auto_35359 ) ) ( OBJ-AT ?auto_35356 ?auto_35359 ) ( OBJ-AT ?auto_35353 ?auto_35359 ) ( IN-CITY ?auto_35357 ?auto_35360 ) ( not ( = ?auto_35351 ?auto_35357 ) ) ( OBJ-AT ?auto_35355 ?auto_35357 ) ( IN-CITY ?auto_35358 ?auto_35360 ) ( not ( = ?auto_35351 ?auto_35358 ) ) ( OBJ-AT ?auto_35354 ?auto_35358 ) ( OBJ-AT ?auto_35352 ?auto_35358 ) ( TRUCK-AT ?auto_35361 ?auto_35351 ) ( not ( = ?auto_35352 ?auto_35354 ) ) ( not ( = ?auto_35352 ?auto_35355 ) ) ( not ( = ?auto_35354 ?auto_35355 ) ) ( not ( = ?auto_35357 ?auto_35358 ) ) ( not ( = ?auto_35352 ?auto_35353 ) ) ( not ( = ?auto_35354 ?auto_35353 ) ) ( not ( = ?auto_35355 ?auto_35353 ) ) ( not ( = ?auto_35359 ?auto_35357 ) ) ( not ( = ?auto_35359 ?auto_35358 ) ) ( not ( = ?auto_35352 ?auto_35356 ) ) ( not ( = ?auto_35354 ?auto_35356 ) ) ( not ( = ?auto_35355 ?auto_35356 ) ) ( not ( = ?auto_35353 ?auto_35356 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_35352 ?auto_35354 ?auto_35355 ?auto_35356 ?auto_35353 ?auto_35351 )
      ( DELIVER-5PKG-VERIFY ?auto_35352 ?auto_35353 ?auto_35354 ?auto_35355 ?auto_35356 ?auto_35351 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_35399 - OBJ
      ?auto_35400 - OBJ
      ?auto_35401 - OBJ
      ?auto_35402 - OBJ
      ?auto_35403 - OBJ
      ?auto_35398 - LOCATION
    )
    :vars
    (
      ?auto_35406 - LOCATION
      ?auto_35407 - CITY
      ?auto_35404 - LOCATION
      ?auto_35405 - LOCATION
      ?auto_35408 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_35406 ?auto_35407 ) ( IN-CITY ?auto_35398 ?auto_35407 ) ( not ( = ?auto_35398 ?auto_35406 ) ) ( OBJ-AT ?auto_35402 ?auto_35406 ) ( OBJ-AT ?auto_35400 ?auto_35406 ) ( IN-CITY ?auto_35404 ?auto_35407 ) ( not ( = ?auto_35398 ?auto_35404 ) ) ( OBJ-AT ?auto_35403 ?auto_35404 ) ( IN-CITY ?auto_35405 ?auto_35407 ) ( not ( = ?auto_35398 ?auto_35405 ) ) ( OBJ-AT ?auto_35401 ?auto_35405 ) ( OBJ-AT ?auto_35399 ?auto_35405 ) ( TRUCK-AT ?auto_35408 ?auto_35398 ) ( not ( = ?auto_35399 ?auto_35401 ) ) ( not ( = ?auto_35399 ?auto_35403 ) ) ( not ( = ?auto_35401 ?auto_35403 ) ) ( not ( = ?auto_35404 ?auto_35405 ) ) ( not ( = ?auto_35399 ?auto_35400 ) ) ( not ( = ?auto_35401 ?auto_35400 ) ) ( not ( = ?auto_35403 ?auto_35400 ) ) ( not ( = ?auto_35406 ?auto_35404 ) ) ( not ( = ?auto_35406 ?auto_35405 ) ) ( not ( = ?auto_35399 ?auto_35402 ) ) ( not ( = ?auto_35401 ?auto_35402 ) ) ( not ( = ?auto_35403 ?auto_35402 ) ) ( not ( = ?auto_35400 ?auto_35402 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_35399 ?auto_35401 ?auto_35403 ?auto_35402 ?auto_35400 ?auto_35398 )
      ( DELIVER-5PKG-VERIFY ?auto_35399 ?auto_35400 ?auto_35401 ?auto_35402 ?auto_35403 ?auto_35398 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_35446 - OBJ
      ?auto_35447 - OBJ
      ?auto_35448 - OBJ
      ?auto_35449 - OBJ
      ?auto_35450 - OBJ
      ?auto_35445 - LOCATION
    )
    :vars
    (
      ?auto_35453 - LOCATION
      ?auto_35454 - CITY
      ?auto_35451 - LOCATION
      ?auto_35452 - LOCATION
      ?auto_35455 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_35453 ?auto_35454 ) ( IN-CITY ?auto_35445 ?auto_35454 ) ( not ( = ?auto_35445 ?auto_35453 ) ) ( OBJ-AT ?auto_35450 ?auto_35453 ) ( OBJ-AT ?auto_35447 ?auto_35453 ) ( IN-CITY ?auto_35451 ?auto_35454 ) ( not ( = ?auto_35445 ?auto_35451 ) ) ( OBJ-AT ?auto_35448 ?auto_35451 ) ( IN-CITY ?auto_35452 ?auto_35454 ) ( not ( = ?auto_35445 ?auto_35452 ) ) ( OBJ-AT ?auto_35449 ?auto_35452 ) ( OBJ-AT ?auto_35446 ?auto_35452 ) ( TRUCK-AT ?auto_35455 ?auto_35445 ) ( not ( = ?auto_35446 ?auto_35449 ) ) ( not ( = ?auto_35446 ?auto_35448 ) ) ( not ( = ?auto_35449 ?auto_35448 ) ) ( not ( = ?auto_35451 ?auto_35452 ) ) ( not ( = ?auto_35446 ?auto_35447 ) ) ( not ( = ?auto_35449 ?auto_35447 ) ) ( not ( = ?auto_35448 ?auto_35447 ) ) ( not ( = ?auto_35453 ?auto_35451 ) ) ( not ( = ?auto_35453 ?auto_35452 ) ) ( not ( = ?auto_35446 ?auto_35450 ) ) ( not ( = ?auto_35449 ?auto_35450 ) ) ( not ( = ?auto_35448 ?auto_35450 ) ) ( not ( = ?auto_35447 ?auto_35450 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_35446 ?auto_35449 ?auto_35448 ?auto_35450 ?auto_35447 ?auto_35445 )
      ( DELIVER-5PKG-VERIFY ?auto_35446 ?auto_35447 ?auto_35448 ?auto_35449 ?auto_35450 ?auto_35445 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_35493 - OBJ
      ?auto_35494 - OBJ
      ?auto_35495 - OBJ
      ?auto_35496 - OBJ
      ?auto_35497 - OBJ
      ?auto_35492 - LOCATION
    )
    :vars
    (
      ?auto_35500 - LOCATION
      ?auto_35501 - CITY
      ?auto_35498 - LOCATION
      ?auto_35499 - LOCATION
      ?auto_35502 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_35500 ?auto_35501 ) ( IN-CITY ?auto_35492 ?auto_35501 ) ( not ( = ?auto_35492 ?auto_35500 ) ) ( OBJ-AT ?auto_35496 ?auto_35500 ) ( OBJ-AT ?auto_35494 ?auto_35500 ) ( IN-CITY ?auto_35498 ?auto_35501 ) ( not ( = ?auto_35492 ?auto_35498 ) ) ( OBJ-AT ?auto_35495 ?auto_35498 ) ( IN-CITY ?auto_35499 ?auto_35501 ) ( not ( = ?auto_35492 ?auto_35499 ) ) ( OBJ-AT ?auto_35497 ?auto_35499 ) ( OBJ-AT ?auto_35493 ?auto_35499 ) ( TRUCK-AT ?auto_35502 ?auto_35492 ) ( not ( = ?auto_35493 ?auto_35497 ) ) ( not ( = ?auto_35493 ?auto_35495 ) ) ( not ( = ?auto_35497 ?auto_35495 ) ) ( not ( = ?auto_35498 ?auto_35499 ) ) ( not ( = ?auto_35493 ?auto_35494 ) ) ( not ( = ?auto_35497 ?auto_35494 ) ) ( not ( = ?auto_35495 ?auto_35494 ) ) ( not ( = ?auto_35500 ?auto_35498 ) ) ( not ( = ?auto_35500 ?auto_35499 ) ) ( not ( = ?auto_35493 ?auto_35496 ) ) ( not ( = ?auto_35497 ?auto_35496 ) ) ( not ( = ?auto_35495 ?auto_35496 ) ) ( not ( = ?auto_35494 ?auto_35496 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_35493 ?auto_35497 ?auto_35495 ?auto_35496 ?auto_35494 ?auto_35492 )
      ( DELIVER-5PKG-VERIFY ?auto_35493 ?auto_35494 ?auto_35495 ?auto_35496 ?auto_35497 ?auto_35492 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_35740 - OBJ
      ?auto_35741 - OBJ
      ?auto_35742 - OBJ
      ?auto_35743 - OBJ
      ?auto_35744 - OBJ
      ?auto_35739 - LOCATION
    )
    :vars
    (
      ?auto_35747 - LOCATION
      ?auto_35748 - CITY
      ?auto_35745 - LOCATION
      ?auto_35746 - LOCATION
      ?auto_35749 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_35747 ?auto_35748 ) ( IN-CITY ?auto_35739 ?auto_35748 ) ( not ( = ?auto_35739 ?auto_35747 ) ) ( OBJ-AT ?auto_35742 ?auto_35747 ) ( OBJ-AT ?auto_35741 ?auto_35747 ) ( IN-CITY ?auto_35745 ?auto_35748 ) ( not ( = ?auto_35739 ?auto_35745 ) ) ( OBJ-AT ?auto_35744 ?auto_35745 ) ( IN-CITY ?auto_35746 ?auto_35748 ) ( not ( = ?auto_35739 ?auto_35746 ) ) ( OBJ-AT ?auto_35743 ?auto_35746 ) ( OBJ-AT ?auto_35740 ?auto_35746 ) ( TRUCK-AT ?auto_35749 ?auto_35739 ) ( not ( = ?auto_35740 ?auto_35743 ) ) ( not ( = ?auto_35740 ?auto_35744 ) ) ( not ( = ?auto_35743 ?auto_35744 ) ) ( not ( = ?auto_35745 ?auto_35746 ) ) ( not ( = ?auto_35740 ?auto_35741 ) ) ( not ( = ?auto_35743 ?auto_35741 ) ) ( not ( = ?auto_35744 ?auto_35741 ) ) ( not ( = ?auto_35747 ?auto_35745 ) ) ( not ( = ?auto_35747 ?auto_35746 ) ) ( not ( = ?auto_35740 ?auto_35742 ) ) ( not ( = ?auto_35743 ?auto_35742 ) ) ( not ( = ?auto_35744 ?auto_35742 ) ) ( not ( = ?auto_35741 ?auto_35742 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_35740 ?auto_35743 ?auto_35744 ?auto_35742 ?auto_35741 ?auto_35739 )
      ( DELIVER-5PKG-VERIFY ?auto_35740 ?auto_35741 ?auto_35742 ?auto_35743 ?auto_35744 ?auto_35739 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_35787 - OBJ
      ?auto_35788 - OBJ
      ?auto_35789 - OBJ
      ?auto_35790 - OBJ
      ?auto_35791 - OBJ
      ?auto_35786 - LOCATION
    )
    :vars
    (
      ?auto_35794 - LOCATION
      ?auto_35795 - CITY
      ?auto_35792 - LOCATION
      ?auto_35793 - LOCATION
      ?auto_35796 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_35794 ?auto_35795 ) ( IN-CITY ?auto_35786 ?auto_35795 ) ( not ( = ?auto_35786 ?auto_35794 ) ) ( OBJ-AT ?auto_35789 ?auto_35794 ) ( OBJ-AT ?auto_35788 ?auto_35794 ) ( IN-CITY ?auto_35792 ?auto_35795 ) ( not ( = ?auto_35786 ?auto_35792 ) ) ( OBJ-AT ?auto_35790 ?auto_35792 ) ( IN-CITY ?auto_35793 ?auto_35795 ) ( not ( = ?auto_35786 ?auto_35793 ) ) ( OBJ-AT ?auto_35791 ?auto_35793 ) ( OBJ-AT ?auto_35787 ?auto_35793 ) ( TRUCK-AT ?auto_35796 ?auto_35786 ) ( not ( = ?auto_35787 ?auto_35791 ) ) ( not ( = ?auto_35787 ?auto_35790 ) ) ( not ( = ?auto_35791 ?auto_35790 ) ) ( not ( = ?auto_35792 ?auto_35793 ) ) ( not ( = ?auto_35787 ?auto_35788 ) ) ( not ( = ?auto_35791 ?auto_35788 ) ) ( not ( = ?auto_35790 ?auto_35788 ) ) ( not ( = ?auto_35794 ?auto_35792 ) ) ( not ( = ?auto_35794 ?auto_35793 ) ) ( not ( = ?auto_35787 ?auto_35789 ) ) ( not ( = ?auto_35791 ?auto_35789 ) ) ( not ( = ?auto_35790 ?auto_35789 ) ) ( not ( = ?auto_35788 ?auto_35789 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_35787 ?auto_35791 ?auto_35790 ?auto_35789 ?auto_35788 ?auto_35786 )
      ( DELIVER-5PKG-VERIFY ?auto_35787 ?auto_35788 ?auto_35789 ?auto_35790 ?auto_35791 ?auto_35786 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_36445 - OBJ
      ?auto_36446 - OBJ
      ?auto_36447 - OBJ
      ?auto_36448 - OBJ
      ?auto_36449 - OBJ
      ?auto_36444 - LOCATION
    )
    :vars
    (
      ?auto_36452 - LOCATION
      ?auto_36453 - CITY
      ?auto_36450 - LOCATION
      ?auto_36451 - LOCATION
      ?auto_36454 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_36452 ?auto_36453 ) ( IN-CITY ?auto_36444 ?auto_36453 ) ( not ( = ?auto_36444 ?auto_36452 ) ) ( OBJ-AT ?auto_36446 ?auto_36452 ) ( OBJ-AT ?auto_36449 ?auto_36452 ) ( IN-CITY ?auto_36450 ?auto_36453 ) ( not ( = ?auto_36444 ?auto_36450 ) ) ( OBJ-AT ?auto_36448 ?auto_36450 ) ( IN-CITY ?auto_36451 ?auto_36453 ) ( not ( = ?auto_36444 ?auto_36451 ) ) ( OBJ-AT ?auto_36447 ?auto_36451 ) ( OBJ-AT ?auto_36445 ?auto_36451 ) ( TRUCK-AT ?auto_36454 ?auto_36444 ) ( not ( = ?auto_36445 ?auto_36447 ) ) ( not ( = ?auto_36445 ?auto_36448 ) ) ( not ( = ?auto_36447 ?auto_36448 ) ) ( not ( = ?auto_36450 ?auto_36451 ) ) ( not ( = ?auto_36445 ?auto_36449 ) ) ( not ( = ?auto_36447 ?auto_36449 ) ) ( not ( = ?auto_36448 ?auto_36449 ) ) ( not ( = ?auto_36452 ?auto_36450 ) ) ( not ( = ?auto_36452 ?auto_36451 ) ) ( not ( = ?auto_36445 ?auto_36446 ) ) ( not ( = ?auto_36447 ?auto_36446 ) ) ( not ( = ?auto_36448 ?auto_36446 ) ) ( not ( = ?auto_36449 ?auto_36446 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_36445 ?auto_36447 ?auto_36448 ?auto_36446 ?auto_36449 ?auto_36444 )
      ( DELIVER-5PKG-VERIFY ?auto_36445 ?auto_36446 ?auto_36447 ?auto_36448 ?auto_36449 ?auto_36444 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_36492 - OBJ
      ?auto_36493 - OBJ
      ?auto_36494 - OBJ
      ?auto_36495 - OBJ
      ?auto_36496 - OBJ
      ?auto_36491 - LOCATION
    )
    :vars
    (
      ?auto_36499 - LOCATION
      ?auto_36500 - CITY
      ?auto_36497 - LOCATION
      ?auto_36498 - LOCATION
      ?auto_36501 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_36499 ?auto_36500 ) ( IN-CITY ?auto_36491 ?auto_36500 ) ( not ( = ?auto_36491 ?auto_36499 ) ) ( OBJ-AT ?auto_36493 ?auto_36499 ) ( OBJ-AT ?auto_36495 ?auto_36499 ) ( IN-CITY ?auto_36497 ?auto_36500 ) ( not ( = ?auto_36491 ?auto_36497 ) ) ( OBJ-AT ?auto_36496 ?auto_36497 ) ( IN-CITY ?auto_36498 ?auto_36500 ) ( not ( = ?auto_36491 ?auto_36498 ) ) ( OBJ-AT ?auto_36494 ?auto_36498 ) ( OBJ-AT ?auto_36492 ?auto_36498 ) ( TRUCK-AT ?auto_36501 ?auto_36491 ) ( not ( = ?auto_36492 ?auto_36494 ) ) ( not ( = ?auto_36492 ?auto_36496 ) ) ( not ( = ?auto_36494 ?auto_36496 ) ) ( not ( = ?auto_36497 ?auto_36498 ) ) ( not ( = ?auto_36492 ?auto_36495 ) ) ( not ( = ?auto_36494 ?auto_36495 ) ) ( not ( = ?auto_36496 ?auto_36495 ) ) ( not ( = ?auto_36499 ?auto_36497 ) ) ( not ( = ?auto_36499 ?auto_36498 ) ) ( not ( = ?auto_36492 ?auto_36493 ) ) ( not ( = ?auto_36494 ?auto_36493 ) ) ( not ( = ?auto_36496 ?auto_36493 ) ) ( not ( = ?auto_36495 ?auto_36493 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_36492 ?auto_36494 ?auto_36496 ?auto_36493 ?auto_36495 ?auto_36491 )
      ( DELIVER-5PKG-VERIFY ?auto_36492 ?auto_36493 ?auto_36494 ?auto_36495 ?auto_36496 ?auto_36491 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_36689 - OBJ
      ?auto_36690 - OBJ
      ?auto_36691 - OBJ
      ?auto_36692 - OBJ
      ?auto_36693 - OBJ
      ?auto_36688 - LOCATION
    )
    :vars
    (
      ?auto_36696 - LOCATION
      ?auto_36697 - CITY
      ?auto_36694 - LOCATION
      ?auto_36695 - LOCATION
      ?auto_36698 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_36696 ?auto_36697 ) ( IN-CITY ?auto_36688 ?auto_36697 ) ( not ( = ?auto_36688 ?auto_36696 ) ) ( OBJ-AT ?auto_36690 ?auto_36696 ) ( OBJ-AT ?auto_36693 ?auto_36696 ) ( IN-CITY ?auto_36694 ?auto_36697 ) ( not ( = ?auto_36688 ?auto_36694 ) ) ( OBJ-AT ?auto_36691 ?auto_36694 ) ( IN-CITY ?auto_36695 ?auto_36697 ) ( not ( = ?auto_36688 ?auto_36695 ) ) ( OBJ-AT ?auto_36692 ?auto_36695 ) ( OBJ-AT ?auto_36689 ?auto_36695 ) ( TRUCK-AT ?auto_36698 ?auto_36688 ) ( not ( = ?auto_36689 ?auto_36692 ) ) ( not ( = ?auto_36689 ?auto_36691 ) ) ( not ( = ?auto_36692 ?auto_36691 ) ) ( not ( = ?auto_36694 ?auto_36695 ) ) ( not ( = ?auto_36689 ?auto_36693 ) ) ( not ( = ?auto_36692 ?auto_36693 ) ) ( not ( = ?auto_36691 ?auto_36693 ) ) ( not ( = ?auto_36696 ?auto_36694 ) ) ( not ( = ?auto_36696 ?auto_36695 ) ) ( not ( = ?auto_36689 ?auto_36690 ) ) ( not ( = ?auto_36692 ?auto_36690 ) ) ( not ( = ?auto_36691 ?auto_36690 ) ) ( not ( = ?auto_36693 ?auto_36690 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_36689 ?auto_36692 ?auto_36691 ?auto_36690 ?auto_36693 ?auto_36688 )
      ( DELIVER-5PKG-VERIFY ?auto_36689 ?auto_36690 ?auto_36691 ?auto_36692 ?auto_36693 ?auto_36688 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_36787 - OBJ
      ?auto_36788 - OBJ
      ?auto_36789 - OBJ
      ?auto_36790 - OBJ
      ?auto_36791 - OBJ
      ?auto_36786 - LOCATION
    )
    :vars
    (
      ?auto_36794 - LOCATION
      ?auto_36795 - CITY
      ?auto_36792 - LOCATION
      ?auto_36793 - LOCATION
      ?auto_36796 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_36794 ?auto_36795 ) ( IN-CITY ?auto_36786 ?auto_36795 ) ( not ( = ?auto_36786 ?auto_36794 ) ) ( OBJ-AT ?auto_36788 ?auto_36794 ) ( OBJ-AT ?auto_36790 ?auto_36794 ) ( IN-CITY ?auto_36792 ?auto_36795 ) ( not ( = ?auto_36786 ?auto_36792 ) ) ( OBJ-AT ?auto_36789 ?auto_36792 ) ( IN-CITY ?auto_36793 ?auto_36795 ) ( not ( = ?auto_36786 ?auto_36793 ) ) ( OBJ-AT ?auto_36791 ?auto_36793 ) ( OBJ-AT ?auto_36787 ?auto_36793 ) ( TRUCK-AT ?auto_36796 ?auto_36786 ) ( not ( = ?auto_36787 ?auto_36791 ) ) ( not ( = ?auto_36787 ?auto_36789 ) ) ( not ( = ?auto_36791 ?auto_36789 ) ) ( not ( = ?auto_36792 ?auto_36793 ) ) ( not ( = ?auto_36787 ?auto_36790 ) ) ( not ( = ?auto_36791 ?auto_36790 ) ) ( not ( = ?auto_36789 ?auto_36790 ) ) ( not ( = ?auto_36794 ?auto_36792 ) ) ( not ( = ?auto_36794 ?auto_36793 ) ) ( not ( = ?auto_36787 ?auto_36788 ) ) ( not ( = ?auto_36791 ?auto_36788 ) ) ( not ( = ?auto_36789 ?auto_36788 ) ) ( not ( = ?auto_36790 ?auto_36788 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_36787 ?auto_36791 ?auto_36789 ?auto_36788 ?auto_36790 ?auto_36786 )
      ( DELIVER-5PKG-VERIFY ?auto_36787 ?auto_36788 ?auto_36789 ?auto_36790 ?auto_36791 ?auto_36786 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_36984 - OBJ
      ?auto_36985 - OBJ
      ?auto_36986 - OBJ
      ?auto_36987 - OBJ
      ?auto_36988 - OBJ
      ?auto_36983 - LOCATION
    )
    :vars
    (
      ?auto_36991 - LOCATION
      ?auto_36992 - CITY
      ?auto_36989 - LOCATION
      ?auto_36990 - LOCATION
      ?auto_36993 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_36991 ?auto_36992 ) ( IN-CITY ?auto_36983 ?auto_36992 ) ( not ( = ?auto_36983 ?auto_36991 ) ) ( OBJ-AT ?auto_36985 ?auto_36991 ) ( OBJ-AT ?auto_36986 ?auto_36991 ) ( IN-CITY ?auto_36989 ?auto_36992 ) ( not ( = ?auto_36983 ?auto_36989 ) ) ( OBJ-AT ?auto_36988 ?auto_36989 ) ( IN-CITY ?auto_36990 ?auto_36992 ) ( not ( = ?auto_36983 ?auto_36990 ) ) ( OBJ-AT ?auto_36987 ?auto_36990 ) ( OBJ-AT ?auto_36984 ?auto_36990 ) ( TRUCK-AT ?auto_36993 ?auto_36983 ) ( not ( = ?auto_36984 ?auto_36987 ) ) ( not ( = ?auto_36984 ?auto_36988 ) ) ( not ( = ?auto_36987 ?auto_36988 ) ) ( not ( = ?auto_36989 ?auto_36990 ) ) ( not ( = ?auto_36984 ?auto_36986 ) ) ( not ( = ?auto_36987 ?auto_36986 ) ) ( not ( = ?auto_36988 ?auto_36986 ) ) ( not ( = ?auto_36991 ?auto_36989 ) ) ( not ( = ?auto_36991 ?auto_36990 ) ) ( not ( = ?auto_36984 ?auto_36985 ) ) ( not ( = ?auto_36987 ?auto_36985 ) ) ( not ( = ?auto_36988 ?auto_36985 ) ) ( not ( = ?auto_36986 ?auto_36985 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_36984 ?auto_36987 ?auto_36988 ?auto_36985 ?auto_36986 ?auto_36983 )
      ( DELIVER-5PKG-VERIFY ?auto_36984 ?auto_36985 ?auto_36986 ?auto_36987 ?auto_36988 ?auto_36983 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_37031 - OBJ
      ?auto_37032 - OBJ
      ?auto_37033 - OBJ
      ?auto_37034 - OBJ
      ?auto_37035 - OBJ
      ?auto_37030 - LOCATION
    )
    :vars
    (
      ?auto_37038 - LOCATION
      ?auto_37039 - CITY
      ?auto_37036 - LOCATION
      ?auto_37037 - LOCATION
      ?auto_37040 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_37038 ?auto_37039 ) ( IN-CITY ?auto_37030 ?auto_37039 ) ( not ( = ?auto_37030 ?auto_37038 ) ) ( OBJ-AT ?auto_37032 ?auto_37038 ) ( OBJ-AT ?auto_37033 ?auto_37038 ) ( IN-CITY ?auto_37036 ?auto_37039 ) ( not ( = ?auto_37030 ?auto_37036 ) ) ( OBJ-AT ?auto_37034 ?auto_37036 ) ( IN-CITY ?auto_37037 ?auto_37039 ) ( not ( = ?auto_37030 ?auto_37037 ) ) ( OBJ-AT ?auto_37035 ?auto_37037 ) ( OBJ-AT ?auto_37031 ?auto_37037 ) ( TRUCK-AT ?auto_37040 ?auto_37030 ) ( not ( = ?auto_37031 ?auto_37035 ) ) ( not ( = ?auto_37031 ?auto_37034 ) ) ( not ( = ?auto_37035 ?auto_37034 ) ) ( not ( = ?auto_37036 ?auto_37037 ) ) ( not ( = ?auto_37031 ?auto_37033 ) ) ( not ( = ?auto_37035 ?auto_37033 ) ) ( not ( = ?auto_37034 ?auto_37033 ) ) ( not ( = ?auto_37038 ?auto_37036 ) ) ( not ( = ?auto_37038 ?auto_37037 ) ) ( not ( = ?auto_37031 ?auto_37032 ) ) ( not ( = ?auto_37035 ?auto_37032 ) ) ( not ( = ?auto_37034 ?auto_37032 ) ) ( not ( = ?auto_37033 ?auto_37032 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_37031 ?auto_37035 ?auto_37034 ?auto_37032 ?auto_37033 ?auto_37030 )
      ( DELIVER-5PKG-VERIFY ?auto_37031 ?auto_37032 ?auto_37033 ?auto_37034 ?auto_37035 ?auto_37030 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_37789 - OBJ
      ?auto_37790 - OBJ
      ?auto_37791 - OBJ
      ?auto_37792 - OBJ
      ?auto_37793 - OBJ
      ?auto_37788 - LOCATION
    )
    :vars
    (
      ?auto_37796 - LOCATION
      ?auto_37797 - CITY
      ?auto_37794 - LOCATION
      ?auto_37795 - LOCATION
      ?auto_37798 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_37796 ?auto_37797 ) ( IN-CITY ?auto_37788 ?auto_37797 ) ( not ( = ?auto_37788 ?auto_37796 ) ) ( OBJ-AT ?auto_37793 ?auto_37796 ) ( OBJ-AT ?auto_37792 ?auto_37796 ) ( IN-CITY ?auto_37794 ?auto_37797 ) ( not ( = ?auto_37788 ?auto_37794 ) ) ( OBJ-AT ?auto_37791 ?auto_37794 ) ( IN-CITY ?auto_37795 ?auto_37797 ) ( not ( = ?auto_37788 ?auto_37795 ) ) ( OBJ-AT ?auto_37789 ?auto_37795 ) ( OBJ-AT ?auto_37790 ?auto_37795 ) ( TRUCK-AT ?auto_37798 ?auto_37788 ) ( not ( = ?auto_37790 ?auto_37789 ) ) ( not ( = ?auto_37790 ?auto_37791 ) ) ( not ( = ?auto_37789 ?auto_37791 ) ) ( not ( = ?auto_37794 ?auto_37795 ) ) ( not ( = ?auto_37790 ?auto_37792 ) ) ( not ( = ?auto_37789 ?auto_37792 ) ) ( not ( = ?auto_37791 ?auto_37792 ) ) ( not ( = ?auto_37796 ?auto_37794 ) ) ( not ( = ?auto_37796 ?auto_37795 ) ) ( not ( = ?auto_37790 ?auto_37793 ) ) ( not ( = ?auto_37789 ?auto_37793 ) ) ( not ( = ?auto_37791 ?auto_37793 ) ) ( not ( = ?auto_37792 ?auto_37793 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_37790 ?auto_37789 ?auto_37791 ?auto_37793 ?auto_37792 ?auto_37788 )
      ( DELIVER-5PKG-VERIFY ?auto_37789 ?auto_37790 ?auto_37791 ?auto_37792 ?auto_37793 ?auto_37788 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_37836 - OBJ
      ?auto_37837 - OBJ
      ?auto_37838 - OBJ
      ?auto_37839 - OBJ
      ?auto_37840 - OBJ
      ?auto_37835 - LOCATION
    )
    :vars
    (
      ?auto_37843 - LOCATION
      ?auto_37844 - CITY
      ?auto_37841 - LOCATION
      ?auto_37842 - LOCATION
      ?auto_37845 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_37843 ?auto_37844 ) ( IN-CITY ?auto_37835 ?auto_37844 ) ( not ( = ?auto_37835 ?auto_37843 ) ) ( OBJ-AT ?auto_37839 ?auto_37843 ) ( OBJ-AT ?auto_37840 ?auto_37843 ) ( IN-CITY ?auto_37841 ?auto_37844 ) ( not ( = ?auto_37835 ?auto_37841 ) ) ( OBJ-AT ?auto_37838 ?auto_37841 ) ( IN-CITY ?auto_37842 ?auto_37844 ) ( not ( = ?auto_37835 ?auto_37842 ) ) ( OBJ-AT ?auto_37836 ?auto_37842 ) ( OBJ-AT ?auto_37837 ?auto_37842 ) ( TRUCK-AT ?auto_37845 ?auto_37835 ) ( not ( = ?auto_37837 ?auto_37836 ) ) ( not ( = ?auto_37837 ?auto_37838 ) ) ( not ( = ?auto_37836 ?auto_37838 ) ) ( not ( = ?auto_37841 ?auto_37842 ) ) ( not ( = ?auto_37837 ?auto_37840 ) ) ( not ( = ?auto_37836 ?auto_37840 ) ) ( not ( = ?auto_37838 ?auto_37840 ) ) ( not ( = ?auto_37843 ?auto_37841 ) ) ( not ( = ?auto_37843 ?auto_37842 ) ) ( not ( = ?auto_37837 ?auto_37839 ) ) ( not ( = ?auto_37836 ?auto_37839 ) ) ( not ( = ?auto_37838 ?auto_37839 ) ) ( not ( = ?auto_37840 ?auto_37839 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_37837 ?auto_37836 ?auto_37838 ?auto_37839 ?auto_37840 ?auto_37835 )
      ( DELIVER-5PKG-VERIFY ?auto_37836 ?auto_37837 ?auto_37838 ?auto_37839 ?auto_37840 ?auto_37835 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_37883 - OBJ
      ?auto_37884 - OBJ
      ?auto_37885 - OBJ
      ?auto_37886 - OBJ
      ?auto_37887 - OBJ
      ?auto_37882 - LOCATION
    )
    :vars
    (
      ?auto_37890 - LOCATION
      ?auto_37891 - CITY
      ?auto_37888 - LOCATION
      ?auto_37889 - LOCATION
      ?auto_37892 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_37890 ?auto_37891 ) ( IN-CITY ?auto_37882 ?auto_37891 ) ( not ( = ?auto_37882 ?auto_37890 ) ) ( OBJ-AT ?auto_37887 ?auto_37890 ) ( OBJ-AT ?auto_37885 ?auto_37890 ) ( IN-CITY ?auto_37888 ?auto_37891 ) ( not ( = ?auto_37882 ?auto_37888 ) ) ( OBJ-AT ?auto_37886 ?auto_37888 ) ( IN-CITY ?auto_37889 ?auto_37891 ) ( not ( = ?auto_37882 ?auto_37889 ) ) ( OBJ-AT ?auto_37883 ?auto_37889 ) ( OBJ-AT ?auto_37884 ?auto_37889 ) ( TRUCK-AT ?auto_37892 ?auto_37882 ) ( not ( = ?auto_37884 ?auto_37883 ) ) ( not ( = ?auto_37884 ?auto_37886 ) ) ( not ( = ?auto_37883 ?auto_37886 ) ) ( not ( = ?auto_37888 ?auto_37889 ) ) ( not ( = ?auto_37884 ?auto_37885 ) ) ( not ( = ?auto_37883 ?auto_37885 ) ) ( not ( = ?auto_37886 ?auto_37885 ) ) ( not ( = ?auto_37890 ?auto_37888 ) ) ( not ( = ?auto_37890 ?auto_37889 ) ) ( not ( = ?auto_37884 ?auto_37887 ) ) ( not ( = ?auto_37883 ?auto_37887 ) ) ( not ( = ?auto_37886 ?auto_37887 ) ) ( not ( = ?auto_37885 ?auto_37887 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_37884 ?auto_37883 ?auto_37886 ?auto_37887 ?auto_37885 ?auto_37882 )
      ( DELIVER-5PKG-VERIFY ?auto_37883 ?auto_37884 ?auto_37885 ?auto_37886 ?auto_37887 ?auto_37882 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_37930 - OBJ
      ?auto_37931 - OBJ
      ?auto_37932 - OBJ
      ?auto_37933 - OBJ
      ?auto_37934 - OBJ
      ?auto_37929 - LOCATION
    )
    :vars
    (
      ?auto_37937 - LOCATION
      ?auto_37938 - CITY
      ?auto_37935 - LOCATION
      ?auto_37936 - LOCATION
      ?auto_37939 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_37937 ?auto_37938 ) ( IN-CITY ?auto_37929 ?auto_37938 ) ( not ( = ?auto_37929 ?auto_37937 ) ) ( OBJ-AT ?auto_37933 ?auto_37937 ) ( OBJ-AT ?auto_37932 ?auto_37937 ) ( IN-CITY ?auto_37935 ?auto_37938 ) ( not ( = ?auto_37929 ?auto_37935 ) ) ( OBJ-AT ?auto_37934 ?auto_37935 ) ( IN-CITY ?auto_37936 ?auto_37938 ) ( not ( = ?auto_37929 ?auto_37936 ) ) ( OBJ-AT ?auto_37930 ?auto_37936 ) ( OBJ-AT ?auto_37931 ?auto_37936 ) ( TRUCK-AT ?auto_37939 ?auto_37929 ) ( not ( = ?auto_37931 ?auto_37930 ) ) ( not ( = ?auto_37931 ?auto_37934 ) ) ( not ( = ?auto_37930 ?auto_37934 ) ) ( not ( = ?auto_37935 ?auto_37936 ) ) ( not ( = ?auto_37931 ?auto_37932 ) ) ( not ( = ?auto_37930 ?auto_37932 ) ) ( not ( = ?auto_37934 ?auto_37932 ) ) ( not ( = ?auto_37937 ?auto_37935 ) ) ( not ( = ?auto_37937 ?auto_37936 ) ) ( not ( = ?auto_37931 ?auto_37933 ) ) ( not ( = ?auto_37930 ?auto_37933 ) ) ( not ( = ?auto_37934 ?auto_37933 ) ) ( not ( = ?auto_37932 ?auto_37933 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_37931 ?auto_37930 ?auto_37934 ?auto_37933 ?auto_37932 ?auto_37929 )
      ( DELIVER-5PKG-VERIFY ?auto_37930 ?auto_37931 ?auto_37932 ?auto_37933 ?auto_37934 ?auto_37929 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_38127 - OBJ
      ?auto_38128 - OBJ
      ?auto_38129 - OBJ
      ?auto_38130 - OBJ
      ?auto_38131 - OBJ
      ?auto_38126 - LOCATION
    )
    :vars
    (
      ?auto_38134 - LOCATION
      ?auto_38135 - CITY
      ?auto_38132 - LOCATION
      ?auto_38133 - LOCATION
      ?auto_38136 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_38134 ?auto_38135 ) ( IN-CITY ?auto_38126 ?auto_38135 ) ( not ( = ?auto_38126 ?auto_38134 ) ) ( OBJ-AT ?auto_38129 ?auto_38134 ) ( OBJ-AT ?auto_38131 ?auto_38134 ) ( IN-CITY ?auto_38132 ?auto_38135 ) ( not ( = ?auto_38126 ?auto_38132 ) ) ( OBJ-AT ?auto_38130 ?auto_38132 ) ( IN-CITY ?auto_38133 ?auto_38135 ) ( not ( = ?auto_38126 ?auto_38133 ) ) ( OBJ-AT ?auto_38127 ?auto_38133 ) ( OBJ-AT ?auto_38128 ?auto_38133 ) ( TRUCK-AT ?auto_38136 ?auto_38126 ) ( not ( = ?auto_38128 ?auto_38127 ) ) ( not ( = ?auto_38128 ?auto_38130 ) ) ( not ( = ?auto_38127 ?auto_38130 ) ) ( not ( = ?auto_38132 ?auto_38133 ) ) ( not ( = ?auto_38128 ?auto_38131 ) ) ( not ( = ?auto_38127 ?auto_38131 ) ) ( not ( = ?auto_38130 ?auto_38131 ) ) ( not ( = ?auto_38134 ?auto_38132 ) ) ( not ( = ?auto_38134 ?auto_38133 ) ) ( not ( = ?auto_38128 ?auto_38129 ) ) ( not ( = ?auto_38127 ?auto_38129 ) ) ( not ( = ?auto_38130 ?auto_38129 ) ) ( not ( = ?auto_38131 ?auto_38129 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_38128 ?auto_38127 ?auto_38130 ?auto_38129 ?auto_38131 ?auto_38126 )
      ( DELIVER-5PKG-VERIFY ?auto_38127 ?auto_38128 ?auto_38129 ?auto_38130 ?auto_38131 ?auto_38126 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_38174 - OBJ
      ?auto_38175 - OBJ
      ?auto_38176 - OBJ
      ?auto_38177 - OBJ
      ?auto_38178 - OBJ
      ?auto_38173 - LOCATION
    )
    :vars
    (
      ?auto_38181 - LOCATION
      ?auto_38182 - CITY
      ?auto_38179 - LOCATION
      ?auto_38180 - LOCATION
      ?auto_38183 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_38181 ?auto_38182 ) ( IN-CITY ?auto_38173 ?auto_38182 ) ( not ( = ?auto_38173 ?auto_38181 ) ) ( OBJ-AT ?auto_38176 ?auto_38181 ) ( OBJ-AT ?auto_38177 ?auto_38181 ) ( IN-CITY ?auto_38179 ?auto_38182 ) ( not ( = ?auto_38173 ?auto_38179 ) ) ( OBJ-AT ?auto_38178 ?auto_38179 ) ( IN-CITY ?auto_38180 ?auto_38182 ) ( not ( = ?auto_38173 ?auto_38180 ) ) ( OBJ-AT ?auto_38174 ?auto_38180 ) ( OBJ-AT ?auto_38175 ?auto_38180 ) ( TRUCK-AT ?auto_38183 ?auto_38173 ) ( not ( = ?auto_38175 ?auto_38174 ) ) ( not ( = ?auto_38175 ?auto_38178 ) ) ( not ( = ?auto_38174 ?auto_38178 ) ) ( not ( = ?auto_38179 ?auto_38180 ) ) ( not ( = ?auto_38175 ?auto_38177 ) ) ( not ( = ?auto_38174 ?auto_38177 ) ) ( not ( = ?auto_38178 ?auto_38177 ) ) ( not ( = ?auto_38181 ?auto_38179 ) ) ( not ( = ?auto_38181 ?auto_38180 ) ) ( not ( = ?auto_38175 ?auto_38176 ) ) ( not ( = ?auto_38174 ?auto_38176 ) ) ( not ( = ?auto_38178 ?auto_38176 ) ) ( not ( = ?auto_38177 ?auto_38176 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_38175 ?auto_38174 ?auto_38178 ?auto_38176 ?auto_38177 ?auto_38173 )
      ( DELIVER-5PKG-VERIFY ?auto_38174 ?auto_38175 ?auto_38176 ?auto_38177 ?auto_38178 ?auto_38173 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_39090 - OBJ
      ?auto_39091 - OBJ
      ?auto_39092 - OBJ
      ?auto_39093 - OBJ
      ?auto_39094 - OBJ
      ?auto_39089 - LOCATION
    )
    :vars
    (
      ?auto_39097 - LOCATION
      ?auto_39098 - CITY
      ?auto_39095 - LOCATION
      ?auto_39096 - LOCATION
      ?auto_39099 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_39097 ?auto_39098 ) ( IN-CITY ?auto_39089 ?auto_39098 ) ( not ( = ?auto_39089 ?auto_39097 ) ) ( OBJ-AT ?auto_39094 ?auto_39097 ) ( OBJ-AT ?auto_39093 ?auto_39097 ) ( IN-CITY ?auto_39095 ?auto_39098 ) ( not ( = ?auto_39089 ?auto_39095 ) ) ( OBJ-AT ?auto_39091 ?auto_39095 ) ( IN-CITY ?auto_39096 ?auto_39098 ) ( not ( = ?auto_39089 ?auto_39096 ) ) ( OBJ-AT ?auto_39090 ?auto_39096 ) ( OBJ-AT ?auto_39092 ?auto_39096 ) ( TRUCK-AT ?auto_39099 ?auto_39089 ) ( not ( = ?auto_39092 ?auto_39090 ) ) ( not ( = ?auto_39092 ?auto_39091 ) ) ( not ( = ?auto_39090 ?auto_39091 ) ) ( not ( = ?auto_39095 ?auto_39096 ) ) ( not ( = ?auto_39092 ?auto_39093 ) ) ( not ( = ?auto_39090 ?auto_39093 ) ) ( not ( = ?auto_39091 ?auto_39093 ) ) ( not ( = ?auto_39097 ?auto_39095 ) ) ( not ( = ?auto_39097 ?auto_39096 ) ) ( not ( = ?auto_39092 ?auto_39094 ) ) ( not ( = ?auto_39090 ?auto_39094 ) ) ( not ( = ?auto_39091 ?auto_39094 ) ) ( not ( = ?auto_39093 ?auto_39094 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_39092 ?auto_39090 ?auto_39091 ?auto_39094 ?auto_39093 ?auto_39089 )
      ( DELIVER-5PKG-VERIFY ?auto_39090 ?auto_39091 ?auto_39092 ?auto_39093 ?auto_39094 ?auto_39089 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_39137 - OBJ
      ?auto_39138 - OBJ
      ?auto_39139 - OBJ
      ?auto_39140 - OBJ
      ?auto_39141 - OBJ
      ?auto_39136 - LOCATION
    )
    :vars
    (
      ?auto_39144 - LOCATION
      ?auto_39145 - CITY
      ?auto_39142 - LOCATION
      ?auto_39143 - LOCATION
      ?auto_39146 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_39144 ?auto_39145 ) ( IN-CITY ?auto_39136 ?auto_39145 ) ( not ( = ?auto_39136 ?auto_39144 ) ) ( OBJ-AT ?auto_39140 ?auto_39144 ) ( OBJ-AT ?auto_39141 ?auto_39144 ) ( IN-CITY ?auto_39142 ?auto_39145 ) ( not ( = ?auto_39136 ?auto_39142 ) ) ( OBJ-AT ?auto_39138 ?auto_39142 ) ( IN-CITY ?auto_39143 ?auto_39145 ) ( not ( = ?auto_39136 ?auto_39143 ) ) ( OBJ-AT ?auto_39137 ?auto_39143 ) ( OBJ-AT ?auto_39139 ?auto_39143 ) ( TRUCK-AT ?auto_39146 ?auto_39136 ) ( not ( = ?auto_39139 ?auto_39137 ) ) ( not ( = ?auto_39139 ?auto_39138 ) ) ( not ( = ?auto_39137 ?auto_39138 ) ) ( not ( = ?auto_39142 ?auto_39143 ) ) ( not ( = ?auto_39139 ?auto_39141 ) ) ( not ( = ?auto_39137 ?auto_39141 ) ) ( not ( = ?auto_39138 ?auto_39141 ) ) ( not ( = ?auto_39144 ?auto_39142 ) ) ( not ( = ?auto_39144 ?auto_39143 ) ) ( not ( = ?auto_39139 ?auto_39140 ) ) ( not ( = ?auto_39137 ?auto_39140 ) ) ( not ( = ?auto_39138 ?auto_39140 ) ) ( not ( = ?auto_39141 ?auto_39140 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_39139 ?auto_39137 ?auto_39138 ?auto_39140 ?auto_39141 ?auto_39136 )
      ( DELIVER-5PKG-VERIFY ?auto_39137 ?auto_39138 ?auto_39139 ?auto_39140 ?auto_39141 ?auto_39136 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_39386 - OBJ
      ?auto_39387 - OBJ
      ?auto_39388 - OBJ
      ?auto_39389 - OBJ
      ?auto_39390 - OBJ
      ?auto_39385 - LOCATION
    )
    :vars
    (
      ?auto_39393 - LOCATION
      ?auto_39394 - CITY
      ?auto_39391 - LOCATION
      ?auto_39392 - LOCATION
      ?auto_39395 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_39393 ?auto_39394 ) ( IN-CITY ?auto_39385 ?auto_39394 ) ( not ( = ?auto_39385 ?auto_39393 ) ) ( OBJ-AT ?auto_39390 ?auto_39393 ) ( OBJ-AT ?auto_39388 ?auto_39393 ) ( IN-CITY ?auto_39391 ?auto_39394 ) ( not ( = ?auto_39385 ?auto_39391 ) ) ( OBJ-AT ?auto_39387 ?auto_39391 ) ( IN-CITY ?auto_39392 ?auto_39394 ) ( not ( = ?auto_39385 ?auto_39392 ) ) ( OBJ-AT ?auto_39386 ?auto_39392 ) ( OBJ-AT ?auto_39389 ?auto_39392 ) ( TRUCK-AT ?auto_39395 ?auto_39385 ) ( not ( = ?auto_39389 ?auto_39386 ) ) ( not ( = ?auto_39389 ?auto_39387 ) ) ( not ( = ?auto_39386 ?auto_39387 ) ) ( not ( = ?auto_39391 ?auto_39392 ) ) ( not ( = ?auto_39389 ?auto_39388 ) ) ( not ( = ?auto_39386 ?auto_39388 ) ) ( not ( = ?auto_39387 ?auto_39388 ) ) ( not ( = ?auto_39393 ?auto_39391 ) ) ( not ( = ?auto_39393 ?auto_39392 ) ) ( not ( = ?auto_39389 ?auto_39390 ) ) ( not ( = ?auto_39386 ?auto_39390 ) ) ( not ( = ?auto_39387 ?auto_39390 ) ) ( not ( = ?auto_39388 ?auto_39390 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_39389 ?auto_39386 ?auto_39387 ?auto_39390 ?auto_39388 ?auto_39385 )
      ( DELIVER-5PKG-VERIFY ?auto_39386 ?auto_39387 ?auto_39388 ?auto_39389 ?auto_39390 ?auto_39385 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_39433 - OBJ
      ?auto_39434 - OBJ
      ?auto_39435 - OBJ
      ?auto_39436 - OBJ
      ?auto_39437 - OBJ
      ?auto_39432 - LOCATION
    )
    :vars
    (
      ?auto_39440 - LOCATION
      ?auto_39441 - CITY
      ?auto_39438 - LOCATION
      ?auto_39439 - LOCATION
      ?auto_39442 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_39440 ?auto_39441 ) ( IN-CITY ?auto_39432 ?auto_39441 ) ( not ( = ?auto_39432 ?auto_39440 ) ) ( OBJ-AT ?auto_39436 ?auto_39440 ) ( OBJ-AT ?auto_39435 ?auto_39440 ) ( IN-CITY ?auto_39438 ?auto_39441 ) ( not ( = ?auto_39432 ?auto_39438 ) ) ( OBJ-AT ?auto_39434 ?auto_39438 ) ( IN-CITY ?auto_39439 ?auto_39441 ) ( not ( = ?auto_39432 ?auto_39439 ) ) ( OBJ-AT ?auto_39433 ?auto_39439 ) ( OBJ-AT ?auto_39437 ?auto_39439 ) ( TRUCK-AT ?auto_39442 ?auto_39432 ) ( not ( = ?auto_39437 ?auto_39433 ) ) ( not ( = ?auto_39437 ?auto_39434 ) ) ( not ( = ?auto_39433 ?auto_39434 ) ) ( not ( = ?auto_39438 ?auto_39439 ) ) ( not ( = ?auto_39437 ?auto_39435 ) ) ( not ( = ?auto_39433 ?auto_39435 ) ) ( not ( = ?auto_39434 ?auto_39435 ) ) ( not ( = ?auto_39440 ?auto_39438 ) ) ( not ( = ?auto_39440 ?auto_39439 ) ) ( not ( = ?auto_39437 ?auto_39436 ) ) ( not ( = ?auto_39433 ?auto_39436 ) ) ( not ( = ?auto_39434 ?auto_39436 ) ) ( not ( = ?auto_39435 ?auto_39436 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_39437 ?auto_39433 ?auto_39434 ?auto_39436 ?auto_39435 ?auto_39432 )
      ( DELIVER-5PKG-VERIFY ?auto_39433 ?auto_39434 ?auto_39435 ?auto_39436 ?auto_39437 ?auto_39432 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_39528 - OBJ
      ?auto_39529 - OBJ
      ?auto_39530 - OBJ
      ?auto_39531 - OBJ
      ?auto_39532 - OBJ
      ?auto_39527 - LOCATION
    )
    :vars
    (
      ?auto_39535 - LOCATION
      ?auto_39536 - CITY
      ?auto_39533 - LOCATION
      ?auto_39534 - LOCATION
      ?auto_39537 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_39535 ?auto_39536 ) ( IN-CITY ?auto_39527 ?auto_39536 ) ( not ( = ?auto_39527 ?auto_39535 ) ) ( OBJ-AT ?auto_39530 ?auto_39535 ) ( OBJ-AT ?auto_39532 ?auto_39535 ) ( IN-CITY ?auto_39533 ?auto_39536 ) ( not ( = ?auto_39527 ?auto_39533 ) ) ( OBJ-AT ?auto_39529 ?auto_39533 ) ( IN-CITY ?auto_39534 ?auto_39536 ) ( not ( = ?auto_39527 ?auto_39534 ) ) ( OBJ-AT ?auto_39528 ?auto_39534 ) ( OBJ-AT ?auto_39531 ?auto_39534 ) ( TRUCK-AT ?auto_39537 ?auto_39527 ) ( not ( = ?auto_39531 ?auto_39528 ) ) ( not ( = ?auto_39531 ?auto_39529 ) ) ( not ( = ?auto_39528 ?auto_39529 ) ) ( not ( = ?auto_39533 ?auto_39534 ) ) ( not ( = ?auto_39531 ?auto_39532 ) ) ( not ( = ?auto_39528 ?auto_39532 ) ) ( not ( = ?auto_39529 ?auto_39532 ) ) ( not ( = ?auto_39535 ?auto_39533 ) ) ( not ( = ?auto_39535 ?auto_39534 ) ) ( not ( = ?auto_39531 ?auto_39530 ) ) ( not ( = ?auto_39528 ?auto_39530 ) ) ( not ( = ?auto_39529 ?auto_39530 ) ) ( not ( = ?auto_39532 ?auto_39530 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_39531 ?auto_39528 ?auto_39529 ?auto_39530 ?auto_39532 ?auto_39527 )
      ( DELIVER-5PKG-VERIFY ?auto_39528 ?auto_39529 ?auto_39530 ?auto_39531 ?auto_39532 ?auto_39527 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_39677 - OBJ
      ?auto_39678 - OBJ
      ?auto_39679 - OBJ
      ?auto_39680 - OBJ
      ?auto_39681 - OBJ
      ?auto_39676 - LOCATION
    )
    :vars
    (
      ?auto_39684 - LOCATION
      ?auto_39685 - CITY
      ?auto_39682 - LOCATION
      ?auto_39683 - LOCATION
      ?auto_39686 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_39684 ?auto_39685 ) ( IN-CITY ?auto_39676 ?auto_39685 ) ( not ( = ?auto_39676 ?auto_39684 ) ) ( OBJ-AT ?auto_39679 ?auto_39684 ) ( OBJ-AT ?auto_39680 ?auto_39684 ) ( IN-CITY ?auto_39682 ?auto_39685 ) ( not ( = ?auto_39676 ?auto_39682 ) ) ( OBJ-AT ?auto_39678 ?auto_39682 ) ( IN-CITY ?auto_39683 ?auto_39685 ) ( not ( = ?auto_39676 ?auto_39683 ) ) ( OBJ-AT ?auto_39677 ?auto_39683 ) ( OBJ-AT ?auto_39681 ?auto_39683 ) ( TRUCK-AT ?auto_39686 ?auto_39676 ) ( not ( = ?auto_39681 ?auto_39677 ) ) ( not ( = ?auto_39681 ?auto_39678 ) ) ( not ( = ?auto_39677 ?auto_39678 ) ) ( not ( = ?auto_39682 ?auto_39683 ) ) ( not ( = ?auto_39681 ?auto_39680 ) ) ( not ( = ?auto_39677 ?auto_39680 ) ) ( not ( = ?auto_39678 ?auto_39680 ) ) ( not ( = ?auto_39684 ?auto_39682 ) ) ( not ( = ?auto_39684 ?auto_39683 ) ) ( not ( = ?auto_39681 ?auto_39679 ) ) ( not ( = ?auto_39677 ?auto_39679 ) ) ( not ( = ?auto_39678 ?auto_39679 ) ) ( not ( = ?auto_39680 ?auto_39679 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_39681 ?auto_39677 ?auto_39678 ?auto_39679 ?auto_39680 ?auto_39676 )
      ( DELIVER-5PKG-VERIFY ?auto_39677 ?auto_39678 ?auto_39679 ?auto_39680 ?auto_39681 ?auto_39676 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_39823 - OBJ
      ?auto_39824 - OBJ
      ?auto_39825 - OBJ
      ?auto_39826 - OBJ
      ?auto_39827 - OBJ
      ?auto_39822 - LOCATION
    )
    :vars
    (
      ?auto_39830 - LOCATION
      ?auto_39831 - CITY
      ?auto_39828 - LOCATION
      ?auto_39829 - LOCATION
      ?auto_39832 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_39830 ?auto_39831 ) ( IN-CITY ?auto_39822 ?auto_39831 ) ( not ( = ?auto_39822 ?auto_39830 ) ) ( OBJ-AT ?auto_39827 ?auto_39830 ) ( OBJ-AT ?auto_39824 ?auto_39830 ) ( IN-CITY ?auto_39828 ?auto_39831 ) ( not ( = ?auto_39822 ?auto_39828 ) ) ( OBJ-AT ?auto_39826 ?auto_39828 ) ( IN-CITY ?auto_39829 ?auto_39831 ) ( not ( = ?auto_39822 ?auto_39829 ) ) ( OBJ-AT ?auto_39823 ?auto_39829 ) ( OBJ-AT ?auto_39825 ?auto_39829 ) ( TRUCK-AT ?auto_39832 ?auto_39822 ) ( not ( = ?auto_39825 ?auto_39823 ) ) ( not ( = ?auto_39825 ?auto_39826 ) ) ( not ( = ?auto_39823 ?auto_39826 ) ) ( not ( = ?auto_39828 ?auto_39829 ) ) ( not ( = ?auto_39825 ?auto_39824 ) ) ( not ( = ?auto_39823 ?auto_39824 ) ) ( not ( = ?auto_39826 ?auto_39824 ) ) ( not ( = ?auto_39830 ?auto_39828 ) ) ( not ( = ?auto_39830 ?auto_39829 ) ) ( not ( = ?auto_39825 ?auto_39827 ) ) ( not ( = ?auto_39823 ?auto_39827 ) ) ( not ( = ?auto_39826 ?auto_39827 ) ) ( not ( = ?auto_39824 ?auto_39827 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_39825 ?auto_39823 ?auto_39826 ?auto_39827 ?auto_39824 ?auto_39822 )
      ( DELIVER-5PKG-VERIFY ?auto_39823 ?auto_39824 ?auto_39825 ?auto_39826 ?auto_39827 ?auto_39822 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_39870 - OBJ
      ?auto_39871 - OBJ
      ?auto_39872 - OBJ
      ?auto_39873 - OBJ
      ?auto_39874 - OBJ
      ?auto_39869 - LOCATION
    )
    :vars
    (
      ?auto_39877 - LOCATION
      ?auto_39878 - CITY
      ?auto_39875 - LOCATION
      ?auto_39876 - LOCATION
      ?auto_39879 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_39877 ?auto_39878 ) ( IN-CITY ?auto_39869 ?auto_39878 ) ( not ( = ?auto_39869 ?auto_39877 ) ) ( OBJ-AT ?auto_39873 ?auto_39877 ) ( OBJ-AT ?auto_39871 ?auto_39877 ) ( IN-CITY ?auto_39875 ?auto_39878 ) ( not ( = ?auto_39869 ?auto_39875 ) ) ( OBJ-AT ?auto_39874 ?auto_39875 ) ( IN-CITY ?auto_39876 ?auto_39878 ) ( not ( = ?auto_39869 ?auto_39876 ) ) ( OBJ-AT ?auto_39870 ?auto_39876 ) ( OBJ-AT ?auto_39872 ?auto_39876 ) ( TRUCK-AT ?auto_39879 ?auto_39869 ) ( not ( = ?auto_39872 ?auto_39870 ) ) ( not ( = ?auto_39872 ?auto_39874 ) ) ( not ( = ?auto_39870 ?auto_39874 ) ) ( not ( = ?auto_39875 ?auto_39876 ) ) ( not ( = ?auto_39872 ?auto_39871 ) ) ( not ( = ?auto_39870 ?auto_39871 ) ) ( not ( = ?auto_39874 ?auto_39871 ) ) ( not ( = ?auto_39877 ?auto_39875 ) ) ( not ( = ?auto_39877 ?auto_39876 ) ) ( not ( = ?auto_39872 ?auto_39873 ) ) ( not ( = ?auto_39870 ?auto_39873 ) ) ( not ( = ?auto_39874 ?auto_39873 ) ) ( not ( = ?auto_39871 ?auto_39873 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_39872 ?auto_39870 ?auto_39874 ?auto_39873 ?auto_39871 ?auto_39869 )
      ( DELIVER-5PKG-VERIFY ?auto_39870 ?auto_39871 ?auto_39872 ?auto_39873 ?auto_39874 ?auto_39869 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_40018 - OBJ
      ?auto_40019 - OBJ
      ?auto_40020 - OBJ
      ?auto_40021 - OBJ
      ?auto_40022 - OBJ
      ?auto_40017 - LOCATION
    )
    :vars
    (
      ?auto_40025 - LOCATION
      ?auto_40026 - CITY
      ?auto_40023 - LOCATION
      ?auto_40024 - LOCATION
      ?auto_40027 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_40025 ?auto_40026 ) ( IN-CITY ?auto_40017 ?auto_40026 ) ( not ( = ?auto_40017 ?auto_40025 ) ) ( OBJ-AT ?auto_40022 ?auto_40025 ) ( OBJ-AT ?auto_40019 ?auto_40025 ) ( IN-CITY ?auto_40023 ?auto_40026 ) ( not ( = ?auto_40017 ?auto_40023 ) ) ( OBJ-AT ?auto_40020 ?auto_40023 ) ( IN-CITY ?auto_40024 ?auto_40026 ) ( not ( = ?auto_40017 ?auto_40024 ) ) ( OBJ-AT ?auto_40018 ?auto_40024 ) ( OBJ-AT ?auto_40021 ?auto_40024 ) ( TRUCK-AT ?auto_40027 ?auto_40017 ) ( not ( = ?auto_40021 ?auto_40018 ) ) ( not ( = ?auto_40021 ?auto_40020 ) ) ( not ( = ?auto_40018 ?auto_40020 ) ) ( not ( = ?auto_40023 ?auto_40024 ) ) ( not ( = ?auto_40021 ?auto_40019 ) ) ( not ( = ?auto_40018 ?auto_40019 ) ) ( not ( = ?auto_40020 ?auto_40019 ) ) ( not ( = ?auto_40025 ?auto_40023 ) ) ( not ( = ?auto_40025 ?auto_40024 ) ) ( not ( = ?auto_40021 ?auto_40022 ) ) ( not ( = ?auto_40018 ?auto_40022 ) ) ( not ( = ?auto_40020 ?auto_40022 ) ) ( not ( = ?auto_40019 ?auto_40022 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_40021 ?auto_40018 ?auto_40020 ?auto_40022 ?auto_40019 ?auto_40017 )
      ( DELIVER-5PKG-VERIFY ?auto_40018 ?auto_40019 ?auto_40020 ?auto_40021 ?auto_40022 ?auto_40017 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_40065 - OBJ
      ?auto_40066 - OBJ
      ?auto_40067 - OBJ
      ?auto_40068 - OBJ
      ?auto_40069 - OBJ
      ?auto_40064 - LOCATION
    )
    :vars
    (
      ?auto_40072 - LOCATION
      ?auto_40073 - CITY
      ?auto_40070 - LOCATION
      ?auto_40071 - LOCATION
      ?auto_40074 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_40072 ?auto_40073 ) ( IN-CITY ?auto_40064 ?auto_40073 ) ( not ( = ?auto_40064 ?auto_40072 ) ) ( OBJ-AT ?auto_40068 ?auto_40072 ) ( OBJ-AT ?auto_40066 ?auto_40072 ) ( IN-CITY ?auto_40070 ?auto_40073 ) ( not ( = ?auto_40064 ?auto_40070 ) ) ( OBJ-AT ?auto_40067 ?auto_40070 ) ( IN-CITY ?auto_40071 ?auto_40073 ) ( not ( = ?auto_40064 ?auto_40071 ) ) ( OBJ-AT ?auto_40065 ?auto_40071 ) ( OBJ-AT ?auto_40069 ?auto_40071 ) ( TRUCK-AT ?auto_40074 ?auto_40064 ) ( not ( = ?auto_40069 ?auto_40065 ) ) ( not ( = ?auto_40069 ?auto_40067 ) ) ( not ( = ?auto_40065 ?auto_40067 ) ) ( not ( = ?auto_40070 ?auto_40071 ) ) ( not ( = ?auto_40069 ?auto_40066 ) ) ( not ( = ?auto_40065 ?auto_40066 ) ) ( not ( = ?auto_40067 ?auto_40066 ) ) ( not ( = ?auto_40072 ?auto_40070 ) ) ( not ( = ?auto_40072 ?auto_40071 ) ) ( not ( = ?auto_40069 ?auto_40068 ) ) ( not ( = ?auto_40065 ?auto_40068 ) ) ( not ( = ?auto_40067 ?auto_40068 ) ) ( not ( = ?auto_40066 ?auto_40068 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_40069 ?auto_40065 ?auto_40067 ?auto_40068 ?auto_40066 ?auto_40064 )
      ( DELIVER-5PKG-VERIFY ?auto_40065 ?auto_40066 ?auto_40067 ?auto_40068 ?auto_40069 ?auto_40064 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_40261 - OBJ
      ?auto_40262 - OBJ
      ?auto_40263 - OBJ
      ?auto_40264 - OBJ
      ?auto_40265 - OBJ
      ?auto_40260 - LOCATION
    )
    :vars
    (
      ?auto_40268 - LOCATION
      ?auto_40269 - CITY
      ?auto_40266 - LOCATION
      ?auto_40267 - LOCATION
      ?auto_40270 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_40268 ?auto_40269 ) ( IN-CITY ?auto_40260 ?auto_40269 ) ( not ( = ?auto_40260 ?auto_40268 ) ) ( OBJ-AT ?auto_40263 ?auto_40268 ) ( OBJ-AT ?auto_40262 ?auto_40268 ) ( IN-CITY ?auto_40266 ?auto_40269 ) ( not ( = ?auto_40260 ?auto_40266 ) ) ( OBJ-AT ?auto_40265 ?auto_40266 ) ( IN-CITY ?auto_40267 ?auto_40269 ) ( not ( = ?auto_40260 ?auto_40267 ) ) ( OBJ-AT ?auto_40261 ?auto_40267 ) ( OBJ-AT ?auto_40264 ?auto_40267 ) ( TRUCK-AT ?auto_40270 ?auto_40260 ) ( not ( = ?auto_40264 ?auto_40261 ) ) ( not ( = ?auto_40264 ?auto_40265 ) ) ( not ( = ?auto_40261 ?auto_40265 ) ) ( not ( = ?auto_40266 ?auto_40267 ) ) ( not ( = ?auto_40264 ?auto_40262 ) ) ( not ( = ?auto_40261 ?auto_40262 ) ) ( not ( = ?auto_40265 ?auto_40262 ) ) ( not ( = ?auto_40268 ?auto_40266 ) ) ( not ( = ?auto_40268 ?auto_40267 ) ) ( not ( = ?auto_40264 ?auto_40263 ) ) ( not ( = ?auto_40261 ?auto_40263 ) ) ( not ( = ?auto_40265 ?auto_40263 ) ) ( not ( = ?auto_40262 ?auto_40263 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_40264 ?auto_40261 ?auto_40265 ?auto_40263 ?auto_40262 ?auto_40260 )
      ( DELIVER-5PKG-VERIFY ?auto_40261 ?auto_40262 ?auto_40263 ?auto_40264 ?auto_40265 ?auto_40260 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_40359 - OBJ
      ?auto_40360 - OBJ
      ?auto_40361 - OBJ
      ?auto_40362 - OBJ
      ?auto_40363 - OBJ
      ?auto_40358 - LOCATION
    )
    :vars
    (
      ?auto_40366 - LOCATION
      ?auto_40367 - CITY
      ?auto_40364 - LOCATION
      ?auto_40365 - LOCATION
      ?auto_40368 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_40366 ?auto_40367 ) ( IN-CITY ?auto_40358 ?auto_40367 ) ( not ( = ?auto_40358 ?auto_40366 ) ) ( OBJ-AT ?auto_40361 ?auto_40366 ) ( OBJ-AT ?auto_40360 ?auto_40366 ) ( IN-CITY ?auto_40364 ?auto_40367 ) ( not ( = ?auto_40358 ?auto_40364 ) ) ( OBJ-AT ?auto_40362 ?auto_40364 ) ( IN-CITY ?auto_40365 ?auto_40367 ) ( not ( = ?auto_40358 ?auto_40365 ) ) ( OBJ-AT ?auto_40359 ?auto_40365 ) ( OBJ-AT ?auto_40363 ?auto_40365 ) ( TRUCK-AT ?auto_40368 ?auto_40358 ) ( not ( = ?auto_40363 ?auto_40359 ) ) ( not ( = ?auto_40363 ?auto_40362 ) ) ( not ( = ?auto_40359 ?auto_40362 ) ) ( not ( = ?auto_40364 ?auto_40365 ) ) ( not ( = ?auto_40363 ?auto_40360 ) ) ( not ( = ?auto_40359 ?auto_40360 ) ) ( not ( = ?auto_40362 ?auto_40360 ) ) ( not ( = ?auto_40366 ?auto_40364 ) ) ( not ( = ?auto_40366 ?auto_40365 ) ) ( not ( = ?auto_40363 ?auto_40361 ) ) ( not ( = ?auto_40359 ?auto_40361 ) ) ( not ( = ?auto_40362 ?auto_40361 ) ) ( not ( = ?auto_40360 ?auto_40361 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_40363 ?auto_40359 ?auto_40362 ?auto_40361 ?auto_40360 ?auto_40358 )
      ( DELIVER-5PKG-VERIFY ?auto_40359 ?auto_40360 ?auto_40361 ?auto_40362 ?auto_40363 ?auto_40358 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_40706 - OBJ
      ?auto_40707 - OBJ
      ?auto_40708 - OBJ
      ?auto_40709 - OBJ
      ?auto_40710 - OBJ
      ?auto_40705 - LOCATION
    )
    :vars
    (
      ?auto_40713 - LOCATION
      ?auto_40714 - CITY
      ?auto_40711 - LOCATION
      ?auto_40712 - LOCATION
      ?auto_40715 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_40713 ?auto_40714 ) ( IN-CITY ?auto_40705 ?auto_40714 ) ( not ( = ?auto_40705 ?auto_40713 ) ) ( OBJ-AT ?auto_40707 ?auto_40713 ) ( OBJ-AT ?auto_40710 ?auto_40713 ) ( IN-CITY ?auto_40711 ?auto_40714 ) ( not ( = ?auto_40705 ?auto_40711 ) ) ( OBJ-AT ?auto_40709 ?auto_40711 ) ( IN-CITY ?auto_40712 ?auto_40714 ) ( not ( = ?auto_40705 ?auto_40712 ) ) ( OBJ-AT ?auto_40706 ?auto_40712 ) ( OBJ-AT ?auto_40708 ?auto_40712 ) ( TRUCK-AT ?auto_40715 ?auto_40705 ) ( not ( = ?auto_40708 ?auto_40706 ) ) ( not ( = ?auto_40708 ?auto_40709 ) ) ( not ( = ?auto_40706 ?auto_40709 ) ) ( not ( = ?auto_40711 ?auto_40712 ) ) ( not ( = ?auto_40708 ?auto_40710 ) ) ( not ( = ?auto_40706 ?auto_40710 ) ) ( not ( = ?auto_40709 ?auto_40710 ) ) ( not ( = ?auto_40713 ?auto_40711 ) ) ( not ( = ?auto_40713 ?auto_40712 ) ) ( not ( = ?auto_40708 ?auto_40707 ) ) ( not ( = ?auto_40706 ?auto_40707 ) ) ( not ( = ?auto_40709 ?auto_40707 ) ) ( not ( = ?auto_40710 ?auto_40707 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_40708 ?auto_40706 ?auto_40709 ?auto_40707 ?auto_40710 ?auto_40705 )
      ( DELIVER-5PKG-VERIFY ?auto_40706 ?auto_40707 ?auto_40708 ?auto_40709 ?auto_40710 ?auto_40705 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_40753 - OBJ
      ?auto_40754 - OBJ
      ?auto_40755 - OBJ
      ?auto_40756 - OBJ
      ?auto_40757 - OBJ
      ?auto_40752 - LOCATION
    )
    :vars
    (
      ?auto_40760 - LOCATION
      ?auto_40761 - CITY
      ?auto_40758 - LOCATION
      ?auto_40759 - LOCATION
      ?auto_40762 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_40760 ?auto_40761 ) ( IN-CITY ?auto_40752 ?auto_40761 ) ( not ( = ?auto_40752 ?auto_40760 ) ) ( OBJ-AT ?auto_40754 ?auto_40760 ) ( OBJ-AT ?auto_40756 ?auto_40760 ) ( IN-CITY ?auto_40758 ?auto_40761 ) ( not ( = ?auto_40752 ?auto_40758 ) ) ( OBJ-AT ?auto_40757 ?auto_40758 ) ( IN-CITY ?auto_40759 ?auto_40761 ) ( not ( = ?auto_40752 ?auto_40759 ) ) ( OBJ-AT ?auto_40753 ?auto_40759 ) ( OBJ-AT ?auto_40755 ?auto_40759 ) ( TRUCK-AT ?auto_40762 ?auto_40752 ) ( not ( = ?auto_40755 ?auto_40753 ) ) ( not ( = ?auto_40755 ?auto_40757 ) ) ( not ( = ?auto_40753 ?auto_40757 ) ) ( not ( = ?auto_40758 ?auto_40759 ) ) ( not ( = ?auto_40755 ?auto_40756 ) ) ( not ( = ?auto_40753 ?auto_40756 ) ) ( not ( = ?auto_40757 ?auto_40756 ) ) ( not ( = ?auto_40760 ?auto_40758 ) ) ( not ( = ?auto_40760 ?auto_40759 ) ) ( not ( = ?auto_40755 ?auto_40754 ) ) ( not ( = ?auto_40753 ?auto_40754 ) ) ( not ( = ?auto_40757 ?auto_40754 ) ) ( not ( = ?auto_40756 ?auto_40754 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_40755 ?auto_40753 ?auto_40757 ?auto_40754 ?auto_40756 ?auto_40752 )
      ( DELIVER-5PKG-VERIFY ?auto_40753 ?auto_40754 ?auto_40755 ?auto_40756 ?auto_40757 ?auto_40752 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_41210 - OBJ
      ?auto_41211 - OBJ
      ?auto_41212 - OBJ
      ?auto_41213 - OBJ
      ?auto_41214 - OBJ
      ?auto_41209 - LOCATION
    )
    :vars
    (
      ?auto_41217 - LOCATION
      ?auto_41218 - CITY
      ?auto_41215 - LOCATION
      ?auto_41216 - LOCATION
      ?auto_41219 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_41217 ?auto_41218 ) ( IN-CITY ?auto_41209 ?auto_41218 ) ( not ( = ?auto_41209 ?auto_41217 ) ) ( OBJ-AT ?auto_41211 ?auto_41217 ) ( OBJ-AT ?auto_41214 ?auto_41217 ) ( IN-CITY ?auto_41215 ?auto_41218 ) ( not ( = ?auto_41209 ?auto_41215 ) ) ( OBJ-AT ?auto_41212 ?auto_41215 ) ( IN-CITY ?auto_41216 ?auto_41218 ) ( not ( = ?auto_41209 ?auto_41216 ) ) ( OBJ-AT ?auto_41210 ?auto_41216 ) ( OBJ-AT ?auto_41213 ?auto_41216 ) ( TRUCK-AT ?auto_41219 ?auto_41209 ) ( not ( = ?auto_41213 ?auto_41210 ) ) ( not ( = ?auto_41213 ?auto_41212 ) ) ( not ( = ?auto_41210 ?auto_41212 ) ) ( not ( = ?auto_41215 ?auto_41216 ) ) ( not ( = ?auto_41213 ?auto_41214 ) ) ( not ( = ?auto_41210 ?auto_41214 ) ) ( not ( = ?auto_41212 ?auto_41214 ) ) ( not ( = ?auto_41217 ?auto_41215 ) ) ( not ( = ?auto_41217 ?auto_41216 ) ) ( not ( = ?auto_41213 ?auto_41211 ) ) ( not ( = ?auto_41210 ?auto_41211 ) ) ( not ( = ?auto_41212 ?auto_41211 ) ) ( not ( = ?auto_41214 ?auto_41211 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_41213 ?auto_41210 ?auto_41212 ?auto_41211 ?auto_41214 ?auto_41209 )
      ( DELIVER-5PKG-VERIFY ?auto_41210 ?auto_41211 ?auto_41212 ?auto_41213 ?auto_41214 ?auto_41209 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_41359 - OBJ
      ?auto_41360 - OBJ
      ?auto_41361 - OBJ
      ?auto_41362 - OBJ
      ?auto_41363 - OBJ
      ?auto_41358 - LOCATION
    )
    :vars
    (
      ?auto_41366 - LOCATION
      ?auto_41367 - CITY
      ?auto_41364 - LOCATION
      ?auto_41365 - LOCATION
      ?auto_41368 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_41366 ?auto_41367 ) ( IN-CITY ?auto_41358 ?auto_41367 ) ( not ( = ?auto_41358 ?auto_41366 ) ) ( OBJ-AT ?auto_41360 ?auto_41366 ) ( OBJ-AT ?auto_41362 ?auto_41366 ) ( IN-CITY ?auto_41364 ?auto_41367 ) ( not ( = ?auto_41358 ?auto_41364 ) ) ( OBJ-AT ?auto_41361 ?auto_41364 ) ( IN-CITY ?auto_41365 ?auto_41367 ) ( not ( = ?auto_41358 ?auto_41365 ) ) ( OBJ-AT ?auto_41359 ?auto_41365 ) ( OBJ-AT ?auto_41363 ?auto_41365 ) ( TRUCK-AT ?auto_41368 ?auto_41358 ) ( not ( = ?auto_41363 ?auto_41359 ) ) ( not ( = ?auto_41363 ?auto_41361 ) ) ( not ( = ?auto_41359 ?auto_41361 ) ) ( not ( = ?auto_41364 ?auto_41365 ) ) ( not ( = ?auto_41363 ?auto_41362 ) ) ( not ( = ?auto_41359 ?auto_41362 ) ) ( not ( = ?auto_41361 ?auto_41362 ) ) ( not ( = ?auto_41366 ?auto_41364 ) ) ( not ( = ?auto_41366 ?auto_41365 ) ) ( not ( = ?auto_41363 ?auto_41360 ) ) ( not ( = ?auto_41359 ?auto_41360 ) ) ( not ( = ?auto_41361 ?auto_41360 ) ) ( not ( = ?auto_41362 ?auto_41360 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_41363 ?auto_41359 ?auto_41361 ?auto_41360 ?auto_41362 ?auto_41358 )
      ( DELIVER-5PKG-VERIFY ?auto_41359 ?auto_41360 ?auto_41361 ?auto_41362 ?auto_41363 ?auto_41358 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_41505 - OBJ
      ?auto_41506 - OBJ
      ?auto_41507 - OBJ
      ?auto_41508 - OBJ
      ?auto_41509 - OBJ
      ?auto_41504 - LOCATION
    )
    :vars
    (
      ?auto_41512 - LOCATION
      ?auto_41513 - CITY
      ?auto_41510 - LOCATION
      ?auto_41511 - LOCATION
      ?auto_41514 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_41512 ?auto_41513 ) ( IN-CITY ?auto_41504 ?auto_41513 ) ( not ( = ?auto_41504 ?auto_41512 ) ) ( OBJ-AT ?auto_41506 ?auto_41512 ) ( OBJ-AT ?auto_41507 ?auto_41512 ) ( IN-CITY ?auto_41510 ?auto_41513 ) ( not ( = ?auto_41504 ?auto_41510 ) ) ( OBJ-AT ?auto_41509 ?auto_41510 ) ( IN-CITY ?auto_41511 ?auto_41513 ) ( not ( = ?auto_41504 ?auto_41511 ) ) ( OBJ-AT ?auto_41505 ?auto_41511 ) ( OBJ-AT ?auto_41508 ?auto_41511 ) ( TRUCK-AT ?auto_41514 ?auto_41504 ) ( not ( = ?auto_41508 ?auto_41505 ) ) ( not ( = ?auto_41508 ?auto_41509 ) ) ( not ( = ?auto_41505 ?auto_41509 ) ) ( not ( = ?auto_41510 ?auto_41511 ) ) ( not ( = ?auto_41508 ?auto_41507 ) ) ( not ( = ?auto_41505 ?auto_41507 ) ) ( not ( = ?auto_41509 ?auto_41507 ) ) ( not ( = ?auto_41512 ?auto_41510 ) ) ( not ( = ?auto_41512 ?auto_41511 ) ) ( not ( = ?auto_41508 ?auto_41506 ) ) ( not ( = ?auto_41505 ?auto_41506 ) ) ( not ( = ?auto_41509 ?auto_41506 ) ) ( not ( = ?auto_41507 ?auto_41506 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_41508 ?auto_41505 ?auto_41509 ?auto_41506 ?auto_41507 ?auto_41504 )
      ( DELIVER-5PKG-VERIFY ?auto_41505 ?auto_41506 ?auto_41507 ?auto_41508 ?auto_41509 ?auto_41504 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_41603 - OBJ
      ?auto_41604 - OBJ
      ?auto_41605 - OBJ
      ?auto_41606 - OBJ
      ?auto_41607 - OBJ
      ?auto_41602 - LOCATION
    )
    :vars
    (
      ?auto_41610 - LOCATION
      ?auto_41611 - CITY
      ?auto_41608 - LOCATION
      ?auto_41609 - LOCATION
      ?auto_41612 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_41610 ?auto_41611 ) ( IN-CITY ?auto_41602 ?auto_41611 ) ( not ( = ?auto_41602 ?auto_41610 ) ) ( OBJ-AT ?auto_41604 ?auto_41610 ) ( OBJ-AT ?auto_41605 ?auto_41610 ) ( IN-CITY ?auto_41608 ?auto_41611 ) ( not ( = ?auto_41602 ?auto_41608 ) ) ( OBJ-AT ?auto_41606 ?auto_41608 ) ( IN-CITY ?auto_41609 ?auto_41611 ) ( not ( = ?auto_41602 ?auto_41609 ) ) ( OBJ-AT ?auto_41603 ?auto_41609 ) ( OBJ-AT ?auto_41607 ?auto_41609 ) ( TRUCK-AT ?auto_41612 ?auto_41602 ) ( not ( = ?auto_41607 ?auto_41603 ) ) ( not ( = ?auto_41607 ?auto_41606 ) ) ( not ( = ?auto_41603 ?auto_41606 ) ) ( not ( = ?auto_41608 ?auto_41609 ) ) ( not ( = ?auto_41607 ?auto_41605 ) ) ( not ( = ?auto_41603 ?auto_41605 ) ) ( not ( = ?auto_41606 ?auto_41605 ) ) ( not ( = ?auto_41610 ?auto_41608 ) ) ( not ( = ?auto_41610 ?auto_41609 ) ) ( not ( = ?auto_41607 ?auto_41604 ) ) ( not ( = ?auto_41603 ?auto_41604 ) ) ( not ( = ?auto_41606 ?auto_41604 ) ) ( not ( = ?auto_41605 ?auto_41604 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_41607 ?auto_41603 ?auto_41606 ?auto_41604 ?auto_41605 ?auto_41602 )
      ( DELIVER-5PKG-VERIFY ?auto_41603 ?auto_41604 ?auto_41605 ?auto_41606 ?auto_41607 ?auto_41602 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_42260 - OBJ
      ?auto_42261 - OBJ
      ?auto_42262 - OBJ
      ?auto_42263 - OBJ
      ?auto_42264 - OBJ
      ?auto_42259 - LOCATION
    )
    :vars
    (
      ?auto_42267 - LOCATION
      ?auto_42268 - CITY
      ?auto_42265 - LOCATION
      ?auto_42266 - LOCATION
      ?auto_42269 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_42267 ?auto_42268 ) ( IN-CITY ?auto_42259 ?auto_42268 ) ( not ( = ?auto_42259 ?auto_42267 ) ) ( OBJ-AT ?auto_42264 ?auto_42267 ) ( OBJ-AT ?auto_42263 ?auto_42267 ) ( IN-CITY ?auto_42265 ?auto_42268 ) ( not ( = ?auto_42259 ?auto_42265 ) ) ( OBJ-AT ?auto_42260 ?auto_42265 ) ( IN-CITY ?auto_42266 ?auto_42268 ) ( not ( = ?auto_42259 ?auto_42266 ) ) ( OBJ-AT ?auto_42262 ?auto_42266 ) ( OBJ-AT ?auto_42261 ?auto_42266 ) ( TRUCK-AT ?auto_42269 ?auto_42259 ) ( not ( = ?auto_42261 ?auto_42262 ) ) ( not ( = ?auto_42261 ?auto_42260 ) ) ( not ( = ?auto_42262 ?auto_42260 ) ) ( not ( = ?auto_42265 ?auto_42266 ) ) ( not ( = ?auto_42261 ?auto_42263 ) ) ( not ( = ?auto_42262 ?auto_42263 ) ) ( not ( = ?auto_42260 ?auto_42263 ) ) ( not ( = ?auto_42267 ?auto_42265 ) ) ( not ( = ?auto_42267 ?auto_42266 ) ) ( not ( = ?auto_42261 ?auto_42264 ) ) ( not ( = ?auto_42262 ?auto_42264 ) ) ( not ( = ?auto_42260 ?auto_42264 ) ) ( not ( = ?auto_42263 ?auto_42264 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_42261 ?auto_42262 ?auto_42260 ?auto_42264 ?auto_42263 ?auto_42259 )
      ( DELIVER-5PKG-VERIFY ?auto_42260 ?auto_42261 ?auto_42262 ?auto_42263 ?auto_42264 ?auto_42259 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_42307 - OBJ
      ?auto_42308 - OBJ
      ?auto_42309 - OBJ
      ?auto_42310 - OBJ
      ?auto_42311 - OBJ
      ?auto_42306 - LOCATION
    )
    :vars
    (
      ?auto_42314 - LOCATION
      ?auto_42315 - CITY
      ?auto_42312 - LOCATION
      ?auto_42313 - LOCATION
      ?auto_42316 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_42314 ?auto_42315 ) ( IN-CITY ?auto_42306 ?auto_42315 ) ( not ( = ?auto_42306 ?auto_42314 ) ) ( OBJ-AT ?auto_42310 ?auto_42314 ) ( OBJ-AT ?auto_42311 ?auto_42314 ) ( IN-CITY ?auto_42312 ?auto_42315 ) ( not ( = ?auto_42306 ?auto_42312 ) ) ( OBJ-AT ?auto_42307 ?auto_42312 ) ( IN-CITY ?auto_42313 ?auto_42315 ) ( not ( = ?auto_42306 ?auto_42313 ) ) ( OBJ-AT ?auto_42309 ?auto_42313 ) ( OBJ-AT ?auto_42308 ?auto_42313 ) ( TRUCK-AT ?auto_42316 ?auto_42306 ) ( not ( = ?auto_42308 ?auto_42309 ) ) ( not ( = ?auto_42308 ?auto_42307 ) ) ( not ( = ?auto_42309 ?auto_42307 ) ) ( not ( = ?auto_42312 ?auto_42313 ) ) ( not ( = ?auto_42308 ?auto_42311 ) ) ( not ( = ?auto_42309 ?auto_42311 ) ) ( not ( = ?auto_42307 ?auto_42311 ) ) ( not ( = ?auto_42314 ?auto_42312 ) ) ( not ( = ?auto_42314 ?auto_42313 ) ) ( not ( = ?auto_42308 ?auto_42310 ) ) ( not ( = ?auto_42309 ?auto_42310 ) ) ( not ( = ?auto_42307 ?auto_42310 ) ) ( not ( = ?auto_42311 ?auto_42310 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_42308 ?auto_42309 ?auto_42307 ?auto_42310 ?auto_42311 ?auto_42306 )
      ( DELIVER-5PKG-VERIFY ?auto_42307 ?auto_42308 ?auto_42309 ?auto_42310 ?auto_42311 ?auto_42306 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_42455 - OBJ
      ?auto_42456 - OBJ
      ?auto_42457 - OBJ
      ?auto_42458 - OBJ
      ?auto_42459 - OBJ
      ?auto_42454 - LOCATION
    )
    :vars
    (
      ?auto_42462 - LOCATION
      ?auto_42463 - CITY
      ?auto_42460 - LOCATION
      ?auto_42461 - LOCATION
      ?auto_42464 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_42462 ?auto_42463 ) ( IN-CITY ?auto_42454 ?auto_42463 ) ( not ( = ?auto_42454 ?auto_42462 ) ) ( OBJ-AT ?auto_42459 ?auto_42462 ) ( OBJ-AT ?auto_42457 ?auto_42462 ) ( IN-CITY ?auto_42460 ?auto_42463 ) ( not ( = ?auto_42454 ?auto_42460 ) ) ( OBJ-AT ?auto_42455 ?auto_42460 ) ( IN-CITY ?auto_42461 ?auto_42463 ) ( not ( = ?auto_42454 ?auto_42461 ) ) ( OBJ-AT ?auto_42458 ?auto_42461 ) ( OBJ-AT ?auto_42456 ?auto_42461 ) ( TRUCK-AT ?auto_42464 ?auto_42454 ) ( not ( = ?auto_42456 ?auto_42458 ) ) ( not ( = ?auto_42456 ?auto_42455 ) ) ( not ( = ?auto_42458 ?auto_42455 ) ) ( not ( = ?auto_42460 ?auto_42461 ) ) ( not ( = ?auto_42456 ?auto_42457 ) ) ( not ( = ?auto_42458 ?auto_42457 ) ) ( not ( = ?auto_42455 ?auto_42457 ) ) ( not ( = ?auto_42462 ?auto_42460 ) ) ( not ( = ?auto_42462 ?auto_42461 ) ) ( not ( = ?auto_42456 ?auto_42459 ) ) ( not ( = ?auto_42458 ?auto_42459 ) ) ( not ( = ?auto_42455 ?auto_42459 ) ) ( not ( = ?auto_42457 ?auto_42459 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_42456 ?auto_42458 ?auto_42455 ?auto_42459 ?auto_42457 ?auto_42454 )
      ( DELIVER-5PKG-VERIFY ?auto_42455 ?auto_42456 ?auto_42457 ?auto_42458 ?auto_42459 ?auto_42454 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_42502 - OBJ
      ?auto_42503 - OBJ
      ?auto_42504 - OBJ
      ?auto_42505 - OBJ
      ?auto_42506 - OBJ
      ?auto_42501 - LOCATION
    )
    :vars
    (
      ?auto_42509 - LOCATION
      ?auto_42510 - CITY
      ?auto_42507 - LOCATION
      ?auto_42508 - LOCATION
      ?auto_42511 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_42509 ?auto_42510 ) ( IN-CITY ?auto_42501 ?auto_42510 ) ( not ( = ?auto_42501 ?auto_42509 ) ) ( OBJ-AT ?auto_42505 ?auto_42509 ) ( OBJ-AT ?auto_42504 ?auto_42509 ) ( IN-CITY ?auto_42507 ?auto_42510 ) ( not ( = ?auto_42501 ?auto_42507 ) ) ( OBJ-AT ?auto_42502 ?auto_42507 ) ( IN-CITY ?auto_42508 ?auto_42510 ) ( not ( = ?auto_42501 ?auto_42508 ) ) ( OBJ-AT ?auto_42506 ?auto_42508 ) ( OBJ-AT ?auto_42503 ?auto_42508 ) ( TRUCK-AT ?auto_42511 ?auto_42501 ) ( not ( = ?auto_42503 ?auto_42506 ) ) ( not ( = ?auto_42503 ?auto_42502 ) ) ( not ( = ?auto_42506 ?auto_42502 ) ) ( not ( = ?auto_42507 ?auto_42508 ) ) ( not ( = ?auto_42503 ?auto_42504 ) ) ( not ( = ?auto_42506 ?auto_42504 ) ) ( not ( = ?auto_42502 ?auto_42504 ) ) ( not ( = ?auto_42509 ?auto_42507 ) ) ( not ( = ?auto_42509 ?auto_42508 ) ) ( not ( = ?auto_42503 ?auto_42505 ) ) ( not ( = ?auto_42506 ?auto_42505 ) ) ( not ( = ?auto_42502 ?auto_42505 ) ) ( not ( = ?auto_42504 ?auto_42505 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_42503 ?auto_42506 ?auto_42502 ?auto_42505 ?auto_42504 ?auto_42501 )
      ( DELIVER-5PKG-VERIFY ?auto_42502 ?auto_42503 ?auto_42504 ?auto_42505 ?auto_42506 ?auto_42501 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_42648 - OBJ
      ?auto_42649 - OBJ
      ?auto_42650 - OBJ
      ?auto_42651 - OBJ
      ?auto_42652 - OBJ
      ?auto_42647 - LOCATION
    )
    :vars
    (
      ?auto_42655 - LOCATION
      ?auto_42656 - CITY
      ?auto_42653 - LOCATION
      ?auto_42654 - LOCATION
      ?auto_42657 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_42655 ?auto_42656 ) ( IN-CITY ?auto_42647 ?auto_42656 ) ( not ( = ?auto_42647 ?auto_42655 ) ) ( OBJ-AT ?auto_42650 ?auto_42655 ) ( OBJ-AT ?auto_42652 ?auto_42655 ) ( IN-CITY ?auto_42653 ?auto_42656 ) ( not ( = ?auto_42647 ?auto_42653 ) ) ( OBJ-AT ?auto_42648 ?auto_42653 ) ( IN-CITY ?auto_42654 ?auto_42656 ) ( not ( = ?auto_42647 ?auto_42654 ) ) ( OBJ-AT ?auto_42651 ?auto_42654 ) ( OBJ-AT ?auto_42649 ?auto_42654 ) ( TRUCK-AT ?auto_42657 ?auto_42647 ) ( not ( = ?auto_42649 ?auto_42651 ) ) ( not ( = ?auto_42649 ?auto_42648 ) ) ( not ( = ?auto_42651 ?auto_42648 ) ) ( not ( = ?auto_42653 ?auto_42654 ) ) ( not ( = ?auto_42649 ?auto_42652 ) ) ( not ( = ?auto_42651 ?auto_42652 ) ) ( not ( = ?auto_42648 ?auto_42652 ) ) ( not ( = ?auto_42655 ?auto_42653 ) ) ( not ( = ?auto_42655 ?auto_42654 ) ) ( not ( = ?auto_42649 ?auto_42650 ) ) ( not ( = ?auto_42651 ?auto_42650 ) ) ( not ( = ?auto_42648 ?auto_42650 ) ) ( not ( = ?auto_42652 ?auto_42650 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_42649 ?auto_42651 ?auto_42648 ?auto_42650 ?auto_42652 ?auto_42647 )
      ( DELIVER-5PKG-VERIFY ?auto_42648 ?auto_42649 ?auto_42650 ?auto_42651 ?auto_42652 ?auto_42647 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_42746 - OBJ
      ?auto_42747 - OBJ
      ?auto_42748 - OBJ
      ?auto_42749 - OBJ
      ?auto_42750 - OBJ
      ?auto_42745 - LOCATION
    )
    :vars
    (
      ?auto_42753 - LOCATION
      ?auto_42754 - CITY
      ?auto_42751 - LOCATION
      ?auto_42752 - LOCATION
      ?auto_42755 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_42753 ?auto_42754 ) ( IN-CITY ?auto_42745 ?auto_42754 ) ( not ( = ?auto_42745 ?auto_42753 ) ) ( OBJ-AT ?auto_42748 ?auto_42753 ) ( OBJ-AT ?auto_42749 ?auto_42753 ) ( IN-CITY ?auto_42751 ?auto_42754 ) ( not ( = ?auto_42745 ?auto_42751 ) ) ( OBJ-AT ?auto_42746 ?auto_42751 ) ( IN-CITY ?auto_42752 ?auto_42754 ) ( not ( = ?auto_42745 ?auto_42752 ) ) ( OBJ-AT ?auto_42750 ?auto_42752 ) ( OBJ-AT ?auto_42747 ?auto_42752 ) ( TRUCK-AT ?auto_42755 ?auto_42745 ) ( not ( = ?auto_42747 ?auto_42750 ) ) ( not ( = ?auto_42747 ?auto_42746 ) ) ( not ( = ?auto_42750 ?auto_42746 ) ) ( not ( = ?auto_42751 ?auto_42752 ) ) ( not ( = ?auto_42747 ?auto_42749 ) ) ( not ( = ?auto_42750 ?auto_42749 ) ) ( not ( = ?auto_42746 ?auto_42749 ) ) ( not ( = ?auto_42753 ?auto_42751 ) ) ( not ( = ?auto_42753 ?auto_42752 ) ) ( not ( = ?auto_42747 ?auto_42748 ) ) ( not ( = ?auto_42750 ?auto_42748 ) ) ( not ( = ?auto_42746 ?auto_42748 ) ) ( not ( = ?auto_42749 ?auto_42748 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_42747 ?auto_42750 ?auto_42746 ?auto_42748 ?auto_42749 ?auto_42745 )
      ( DELIVER-5PKG-VERIFY ?auto_42746 ?auto_42747 ?auto_42748 ?auto_42749 ?auto_42750 ?auto_42745 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_42892 - OBJ
      ?auto_42893 - OBJ
      ?auto_42894 - OBJ
      ?auto_42895 - OBJ
      ?auto_42896 - OBJ
      ?auto_42891 - LOCATION
    )
    :vars
    (
      ?auto_42899 - LOCATION
      ?auto_42900 - CITY
      ?auto_42897 - LOCATION
      ?auto_42898 - LOCATION
      ?auto_42901 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_42899 ?auto_42900 ) ( IN-CITY ?auto_42891 ?auto_42900 ) ( not ( = ?auto_42891 ?auto_42899 ) ) ( OBJ-AT ?auto_42896 ?auto_42899 ) ( OBJ-AT ?auto_42895 ?auto_42899 ) ( IN-CITY ?auto_42897 ?auto_42900 ) ( not ( = ?auto_42891 ?auto_42897 ) ) ( OBJ-AT ?auto_42892 ?auto_42897 ) ( IN-CITY ?auto_42898 ?auto_42900 ) ( not ( = ?auto_42891 ?auto_42898 ) ) ( OBJ-AT ?auto_42893 ?auto_42898 ) ( OBJ-AT ?auto_42894 ?auto_42898 ) ( TRUCK-AT ?auto_42901 ?auto_42891 ) ( not ( = ?auto_42894 ?auto_42893 ) ) ( not ( = ?auto_42894 ?auto_42892 ) ) ( not ( = ?auto_42893 ?auto_42892 ) ) ( not ( = ?auto_42897 ?auto_42898 ) ) ( not ( = ?auto_42894 ?auto_42895 ) ) ( not ( = ?auto_42893 ?auto_42895 ) ) ( not ( = ?auto_42892 ?auto_42895 ) ) ( not ( = ?auto_42899 ?auto_42897 ) ) ( not ( = ?auto_42899 ?auto_42898 ) ) ( not ( = ?auto_42894 ?auto_42896 ) ) ( not ( = ?auto_42893 ?auto_42896 ) ) ( not ( = ?auto_42892 ?auto_42896 ) ) ( not ( = ?auto_42895 ?auto_42896 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_42894 ?auto_42893 ?auto_42892 ?auto_42896 ?auto_42895 ?auto_42891 )
      ( DELIVER-5PKG-VERIFY ?auto_42892 ?auto_42893 ?auto_42894 ?auto_42895 ?auto_42896 ?auto_42891 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_42939 - OBJ
      ?auto_42940 - OBJ
      ?auto_42941 - OBJ
      ?auto_42942 - OBJ
      ?auto_42943 - OBJ
      ?auto_42938 - LOCATION
    )
    :vars
    (
      ?auto_42946 - LOCATION
      ?auto_42947 - CITY
      ?auto_42944 - LOCATION
      ?auto_42945 - LOCATION
      ?auto_42948 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_42946 ?auto_42947 ) ( IN-CITY ?auto_42938 ?auto_42947 ) ( not ( = ?auto_42938 ?auto_42946 ) ) ( OBJ-AT ?auto_42942 ?auto_42946 ) ( OBJ-AT ?auto_42943 ?auto_42946 ) ( IN-CITY ?auto_42944 ?auto_42947 ) ( not ( = ?auto_42938 ?auto_42944 ) ) ( OBJ-AT ?auto_42939 ?auto_42944 ) ( IN-CITY ?auto_42945 ?auto_42947 ) ( not ( = ?auto_42938 ?auto_42945 ) ) ( OBJ-AT ?auto_42940 ?auto_42945 ) ( OBJ-AT ?auto_42941 ?auto_42945 ) ( TRUCK-AT ?auto_42948 ?auto_42938 ) ( not ( = ?auto_42941 ?auto_42940 ) ) ( not ( = ?auto_42941 ?auto_42939 ) ) ( not ( = ?auto_42940 ?auto_42939 ) ) ( not ( = ?auto_42944 ?auto_42945 ) ) ( not ( = ?auto_42941 ?auto_42943 ) ) ( not ( = ?auto_42940 ?auto_42943 ) ) ( not ( = ?auto_42939 ?auto_42943 ) ) ( not ( = ?auto_42946 ?auto_42944 ) ) ( not ( = ?auto_42946 ?auto_42945 ) ) ( not ( = ?auto_42941 ?auto_42942 ) ) ( not ( = ?auto_42940 ?auto_42942 ) ) ( not ( = ?auto_42939 ?auto_42942 ) ) ( not ( = ?auto_42943 ?auto_42942 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_42941 ?auto_42940 ?auto_42939 ?auto_42942 ?auto_42943 ?auto_42938 )
      ( DELIVER-5PKG-VERIFY ?auto_42939 ?auto_42940 ?auto_42941 ?auto_42942 ?auto_42943 ?auto_42938 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_43188 - OBJ
      ?auto_43189 - OBJ
      ?auto_43190 - OBJ
      ?auto_43191 - OBJ
      ?auto_43192 - OBJ
      ?auto_43187 - LOCATION
    )
    :vars
    (
      ?auto_43195 - LOCATION
      ?auto_43196 - CITY
      ?auto_43193 - LOCATION
      ?auto_43194 - LOCATION
      ?auto_43197 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_43195 ?auto_43196 ) ( IN-CITY ?auto_43187 ?auto_43196 ) ( not ( = ?auto_43187 ?auto_43195 ) ) ( OBJ-AT ?auto_43192 ?auto_43195 ) ( OBJ-AT ?auto_43190 ?auto_43195 ) ( IN-CITY ?auto_43193 ?auto_43196 ) ( not ( = ?auto_43187 ?auto_43193 ) ) ( OBJ-AT ?auto_43188 ?auto_43193 ) ( IN-CITY ?auto_43194 ?auto_43196 ) ( not ( = ?auto_43187 ?auto_43194 ) ) ( OBJ-AT ?auto_43189 ?auto_43194 ) ( OBJ-AT ?auto_43191 ?auto_43194 ) ( TRUCK-AT ?auto_43197 ?auto_43187 ) ( not ( = ?auto_43191 ?auto_43189 ) ) ( not ( = ?auto_43191 ?auto_43188 ) ) ( not ( = ?auto_43189 ?auto_43188 ) ) ( not ( = ?auto_43193 ?auto_43194 ) ) ( not ( = ?auto_43191 ?auto_43190 ) ) ( not ( = ?auto_43189 ?auto_43190 ) ) ( not ( = ?auto_43188 ?auto_43190 ) ) ( not ( = ?auto_43195 ?auto_43193 ) ) ( not ( = ?auto_43195 ?auto_43194 ) ) ( not ( = ?auto_43191 ?auto_43192 ) ) ( not ( = ?auto_43189 ?auto_43192 ) ) ( not ( = ?auto_43188 ?auto_43192 ) ) ( not ( = ?auto_43190 ?auto_43192 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_43191 ?auto_43189 ?auto_43188 ?auto_43192 ?auto_43190 ?auto_43187 )
      ( DELIVER-5PKG-VERIFY ?auto_43188 ?auto_43189 ?auto_43190 ?auto_43191 ?auto_43192 ?auto_43187 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_43235 - OBJ
      ?auto_43236 - OBJ
      ?auto_43237 - OBJ
      ?auto_43238 - OBJ
      ?auto_43239 - OBJ
      ?auto_43234 - LOCATION
    )
    :vars
    (
      ?auto_43242 - LOCATION
      ?auto_43243 - CITY
      ?auto_43240 - LOCATION
      ?auto_43241 - LOCATION
      ?auto_43244 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_43242 ?auto_43243 ) ( IN-CITY ?auto_43234 ?auto_43243 ) ( not ( = ?auto_43234 ?auto_43242 ) ) ( OBJ-AT ?auto_43238 ?auto_43242 ) ( OBJ-AT ?auto_43237 ?auto_43242 ) ( IN-CITY ?auto_43240 ?auto_43243 ) ( not ( = ?auto_43234 ?auto_43240 ) ) ( OBJ-AT ?auto_43235 ?auto_43240 ) ( IN-CITY ?auto_43241 ?auto_43243 ) ( not ( = ?auto_43234 ?auto_43241 ) ) ( OBJ-AT ?auto_43236 ?auto_43241 ) ( OBJ-AT ?auto_43239 ?auto_43241 ) ( TRUCK-AT ?auto_43244 ?auto_43234 ) ( not ( = ?auto_43239 ?auto_43236 ) ) ( not ( = ?auto_43239 ?auto_43235 ) ) ( not ( = ?auto_43236 ?auto_43235 ) ) ( not ( = ?auto_43240 ?auto_43241 ) ) ( not ( = ?auto_43239 ?auto_43237 ) ) ( not ( = ?auto_43236 ?auto_43237 ) ) ( not ( = ?auto_43235 ?auto_43237 ) ) ( not ( = ?auto_43242 ?auto_43240 ) ) ( not ( = ?auto_43242 ?auto_43241 ) ) ( not ( = ?auto_43239 ?auto_43238 ) ) ( not ( = ?auto_43236 ?auto_43238 ) ) ( not ( = ?auto_43235 ?auto_43238 ) ) ( not ( = ?auto_43237 ?auto_43238 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_43239 ?auto_43236 ?auto_43235 ?auto_43238 ?auto_43237 ?auto_43234 )
      ( DELIVER-5PKG-VERIFY ?auto_43235 ?auto_43236 ?auto_43237 ?auto_43238 ?auto_43239 ?auto_43234 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_43330 - OBJ
      ?auto_43331 - OBJ
      ?auto_43332 - OBJ
      ?auto_43333 - OBJ
      ?auto_43334 - OBJ
      ?auto_43329 - LOCATION
    )
    :vars
    (
      ?auto_43337 - LOCATION
      ?auto_43338 - CITY
      ?auto_43335 - LOCATION
      ?auto_43336 - LOCATION
      ?auto_43339 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_43337 ?auto_43338 ) ( IN-CITY ?auto_43329 ?auto_43338 ) ( not ( = ?auto_43329 ?auto_43337 ) ) ( OBJ-AT ?auto_43332 ?auto_43337 ) ( OBJ-AT ?auto_43334 ?auto_43337 ) ( IN-CITY ?auto_43335 ?auto_43338 ) ( not ( = ?auto_43329 ?auto_43335 ) ) ( OBJ-AT ?auto_43330 ?auto_43335 ) ( IN-CITY ?auto_43336 ?auto_43338 ) ( not ( = ?auto_43329 ?auto_43336 ) ) ( OBJ-AT ?auto_43331 ?auto_43336 ) ( OBJ-AT ?auto_43333 ?auto_43336 ) ( TRUCK-AT ?auto_43339 ?auto_43329 ) ( not ( = ?auto_43333 ?auto_43331 ) ) ( not ( = ?auto_43333 ?auto_43330 ) ) ( not ( = ?auto_43331 ?auto_43330 ) ) ( not ( = ?auto_43335 ?auto_43336 ) ) ( not ( = ?auto_43333 ?auto_43334 ) ) ( not ( = ?auto_43331 ?auto_43334 ) ) ( not ( = ?auto_43330 ?auto_43334 ) ) ( not ( = ?auto_43337 ?auto_43335 ) ) ( not ( = ?auto_43337 ?auto_43336 ) ) ( not ( = ?auto_43333 ?auto_43332 ) ) ( not ( = ?auto_43331 ?auto_43332 ) ) ( not ( = ?auto_43330 ?auto_43332 ) ) ( not ( = ?auto_43334 ?auto_43332 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_43333 ?auto_43331 ?auto_43330 ?auto_43332 ?auto_43334 ?auto_43329 )
      ( DELIVER-5PKG-VERIFY ?auto_43330 ?auto_43331 ?auto_43332 ?auto_43333 ?auto_43334 ?auto_43329 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_43479 - OBJ
      ?auto_43480 - OBJ
      ?auto_43481 - OBJ
      ?auto_43482 - OBJ
      ?auto_43483 - OBJ
      ?auto_43478 - LOCATION
    )
    :vars
    (
      ?auto_43486 - LOCATION
      ?auto_43487 - CITY
      ?auto_43484 - LOCATION
      ?auto_43485 - LOCATION
      ?auto_43488 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_43486 ?auto_43487 ) ( IN-CITY ?auto_43478 ?auto_43487 ) ( not ( = ?auto_43478 ?auto_43486 ) ) ( OBJ-AT ?auto_43481 ?auto_43486 ) ( OBJ-AT ?auto_43482 ?auto_43486 ) ( IN-CITY ?auto_43484 ?auto_43487 ) ( not ( = ?auto_43478 ?auto_43484 ) ) ( OBJ-AT ?auto_43479 ?auto_43484 ) ( IN-CITY ?auto_43485 ?auto_43487 ) ( not ( = ?auto_43478 ?auto_43485 ) ) ( OBJ-AT ?auto_43480 ?auto_43485 ) ( OBJ-AT ?auto_43483 ?auto_43485 ) ( TRUCK-AT ?auto_43488 ?auto_43478 ) ( not ( = ?auto_43483 ?auto_43480 ) ) ( not ( = ?auto_43483 ?auto_43479 ) ) ( not ( = ?auto_43480 ?auto_43479 ) ) ( not ( = ?auto_43484 ?auto_43485 ) ) ( not ( = ?auto_43483 ?auto_43482 ) ) ( not ( = ?auto_43480 ?auto_43482 ) ) ( not ( = ?auto_43479 ?auto_43482 ) ) ( not ( = ?auto_43486 ?auto_43484 ) ) ( not ( = ?auto_43486 ?auto_43485 ) ) ( not ( = ?auto_43483 ?auto_43481 ) ) ( not ( = ?auto_43480 ?auto_43481 ) ) ( not ( = ?auto_43479 ?auto_43481 ) ) ( not ( = ?auto_43482 ?auto_43481 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_43483 ?auto_43480 ?auto_43479 ?auto_43481 ?auto_43482 ?auto_43478 )
      ( DELIVER-5PKG-VERIFY ?auto_43479 ?auto_43480 ?auto_43481 ?auto_43482 ?auto_43483 ?auto_43478 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_44395 - OBJ
      ?auto_44396 - OBJ
      ?auto_44397 - OBJ
      ?auto_44398 - OBJ
      ?auto_44399 - OBJ
      ?auto_44394 - LOCATION
    )
    :vars
    (
      ?auto_44402 - LOCATION
      ?auto_44403 - CITY
      ?auto_44400 - LOCATION
      ?auto_44401 - LOCATION
      ?auto_44404 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_44402 ?auto_44403 ) ( IN-CITY ?auto_44394 ?auto_44403 ) ( not ( = ?auto_44394 ?auto_44402 ) ) ( OBJ-AT ?auto_44399 ?auto_44402 ) ( OBJ-AT ?auto_44396 ?auto_44402 ) ( IN-CITY ?auto_44400 ?auto_44403 ) ( not ( = ?auto_44394 ?auto_44400 ) ) ( OBJ-AT ?auto_44395 ?auto_44400 ) ( IN-CITY ?auto_44401 ?auto_44403 ) ( not ( = ?auto_44394 ?auto_44401 ) ) ( OBJ-AT ?auto_44398 ?auto_44401 ) ( OBJ-AT ?auto_44397 ?auto_44401 ) ( TRUCK-AT ?auto_44404 ?auto_44394 ) ( not ( = ?auto_44397 ?auto_44398 ) ) ( not ( = ?auto_44397 ?auto_44395 ) ) ( not ( = ?auto_44398 ?auto_44395 ) ) ( not ( = ?auto_44400 ?auto_44401 ) ) ( not ( = ?auto_44397 ?auto_44396 ) ) ( not ( = ?auto_44398 ?auto_44396 ) ) ( not ( = ?auto_44395 ?auto_44396 ) ) ( not ( = ?auto_44402 ?auto_44400 ) ) ( not ( = ?auto_44402 ?auto_44401 ) ) ( not ( = ?auto_44397 ?auto_44399 ) ) ( not ( = ?auto_44398 ?auto_44399 ) ) ( not ( = ?auto_44395 ?auto_44399 ) ) ( not ( = ?auto_44396 ?auto_44399 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_44397 ?auto_44398 ?auto_44395 ?auto_44399 ?auto_44396 ?auto_44394 )
      ( DELIVER-5PKG-VERIFY ?auto_44395 ?auto_44396 ?auto_44397 ?auto_44398 ?auto_44399 ?auto_44394 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_44442 - OBJ
      ?auto_44443 - OBJ
      ?auto_44444 - OBJ
      ?auto_44445 - OBJ
      ?auto_44446 - OBJ
      ?auto_44441 - LOCATION
    )
    :vars
    (
      ?auto_44449 - LOCATION
      ?auto_44450 - CITY
      ?auto_44447 - LOCATION
      ?auto_44448 - LOCATION
      ?auto_44451 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_44449 ?auto_44450 ) ( IN-CITY ?auto_44441 ?auto_44450 ) ( not ( = ?auto_44441 ?auto_44449 ) ) ( OBJ-AT ?auto_44445 ?auto_44449 ) ( OBJ-AT ?auto_44443 ?auto_44449 ) ( IN-CITY ?auto_44447 ?auto_44450 ) ( not ( = ?auto_44441 ?auto_44447 ) ) ( OBJ-AT ?auto_44442 ?auto_44447 ) ( IN-CITY ?auto_44448 ?auto_44450 ) ( not ( = ?auto_44441 ?auto_44448 ) ) ( OBJ-AT ?auto_44446 ?auto_44448 ) ( OBJ-AT ?auto_44444 ?auto_44448 ) ( TRUCK-AT ?auto_44451 ?auto_44441 ) ( not ( = ?auto_44444 ?auto_44446 ) ) ( not ( = ?auto_44444 ?auto_44442 ) ) ( not ( = ?auto_44446 ?auto_44442 ) ) ( not ( = ?auto_44447 ?auto_44448 ) ) ( not ( = ?auto_44444 ?auto_44443 ) ) ( not ( = ?auto_44446 ?auto_44443 ) ) ( not ( = ?auto_44442 ?auto_44443 ) ) ( not ( = ?auto_44449 ?auto_44447 ) ) ( not ( = ?auto_44449 ?auto_44448 ) ) ( not ( = ?auto_44444 ?auto_44445 ) ) ( not ( = ?auto_44446 ?auto_44445 ) ) ( not ( = ?auto_44442 ?auto_44445 ) ) ( not ( = ?auto_44443 ?auto_44445 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_44444 ?auto_44446 ?auto_44442 ?auto_44445 ?auto_44443 ?auto_44441 )
      ( DELIVER-5PKG-VERIFY ?auto_44442 ?auto_44443 ?auto_44444 ?auto_44445 ?auto_44446 ?auto_44441 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_44489 - OBJ
      ?auto_44490 - OBJ
      ?auto_44491 - OBJ
      ?auto_44492 - OBJ
      ?auto_44493 - OBJ
      ?auto_44488 - LOCATION
    )
    :vars
    (
      ?auto_44496 - LOCATION
      ?auto_44497 - CITY
      ?auto_44494 - LOCATION
      ?auto_44495 - LOCATION
      ?auto_44498 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_44496 ?auto_44497 ) ( IN-CITY ?auto_44488 ?auto_44497 ) ( not ( = ?auto_44488 ?auto_44496 ) ) ( OBJ-AT ?auto_44493 ?auto_44496 ) ( OBJ-AT ?auto_44490 ?auto_44496 ) ( IN-CITY ?auto_44494 ?auto_44497 ) ( not ( = ?auto_44488 ?auto_44494 ) ) ( OBJ-AT ?auto_44489 ?auto_44494 ) ( IN-CITY ?auto_44495 ?auto_44497 ) ( not ( = ?auto_44488 ?auto_44495 ) ) ( OBJ-AT ?auto_44491 ?auto_44495 ) ( OBJ-AT ?auto_44492 ?auto_44495 ) ( TRUCK-AT ?auto_44498 ?auto_44488 ) ( not ( = ?auto_44492 ?auto_44491 ) ) ( not ( = ?auto_44492 ?auto_44489 ) ) ( not ( = ?auto_44491 ?auto_44489 ) ) ( not ( = ?auto_44494 ?auto_44495 ) ) ( not ( = ?auto_44492 ?auto_44490 ) ) ( not ( = ?auto_44491 ?auto_44490 ) ) ( not ( = ?auto_44489 ?auto_44490 ) ) ( not ( = ?auto_44496 ?auto_44494 ) ) ( not ( = ?auto_44496 ?auto_44495 ) ) ( not ( = ?auto_44492 ?auto_44493 ) ) ( not ( = ?auto_44491 ?auto_44493 ) ) ( not ( = ?auto_44489 ?auto_44493 ) ) ( not ( = ?auto_44490 ?auto_44493 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_44492 ?auto_44491 ?auto_44489 ?auto_44493 ?auto_44490 ?auto_44488 )
      ( DELIVER-5PKG-VERIFY ?auto_44489 ?auto_44490 ?auto_44491 ?auto_44492 ?auto_44493 ?auto_44488 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_44536 - OBJ
      ?auto_44537 - OBJ
      ?auto_44538 - OBJ
      ?auto_44539 - OBJ
      ?auto_44540 - OBJ
      ?auto_44535 - LOCATION
    )
    :vars
    (
      ?auto_44543 - LOCATION
      ?auto_44544 - CITY
      ?auto_44541 - LOCATION
      ?auto_44542 - LOCATION
      ?auto_44545 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_44543 ?auto_44544 ) ( IN-CITY ?auto_44535 ?auto_44544 ) ( not ( = ?auto_44535 ?auto_44543 ) ) ( OBJ-AT ?auto_44539 ?auto_44543 ) ( OBJ-AT ?auto_44537 ?auto_44543 ) ( IN-CITY ?auto_44541 ?auto_44544 ) ( not ( = ?auto_44535 ?auto_44541 ) ) ( OBJ-AT ?auto_44536 ?auto_44541 ) ( IN-CITY ?auto_44542 ?auto_44544 ) ( not ( = ?auto_44535 ?auto_44542 ) ) ( OBJ-AT ?auto_44538 ?auto_44542 ) ( OBJ-AT ?auto_44540 ?auto_44542 ) ( TRUCK-AT ?auto_44545 ?auto_44535 ) ( not ( = ?auto_44540 ?auto_44538 ) ) ( not ( = ?auto_44540 ?auto_44536 ) ) ( not ( = ?auto_44538 ?auto_44536 ) ) ( not ( = ?auto_44541 ?auto_44542 ) ) ( not ( = ?auto_44540 ?auto_44537 ) ) ( not ( = ?auto_44538 ?auto_44537 ) ) ( not ( = ?auto_44536 ?auto_44537 ) ) ( not ( = ?auto_44543 ?auto_44541 ) ) ( not ( = ?auto_44543 ?auto_44542 ) ) ( not ( = ?auto_44540 ?auto_44539 ) ) ( not ( = ?auto_44538 ?auto_44539 ) ) ( not ( = ?auto_44536 ?auto_44539 ) ) ( not ( = ?auto_44537 ?auto_44539 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_44540 ?auto_44538 ?auto_44536 ?auto_44539 ?auto_44537 ?auto_44535 )
      ( DELIVER-5PKG-VERIFY ?auto_44536 ?auto_44537 ?auto_44538 ?auto_44539 ?auto_44540 ?auto_44535 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_44833 - OBJ
      ?auto_44834 - OBJ
      ?auto_44835 - OBJ
      ?auto_44836 - OBJ
      ?auto_44837 - OBJ
      ?auto_44832 - LOCATION
    )
    :vars
    (
      ?auto_44840 - LOCATION
      ?auto_44841 - CITY
      ?auto_44838 - LOCATION
      ?auto_44839 - LOCATION
      ?auto_44842 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_44840 ?auto_44841 ) ( IN-CITY ?auto_44832 ?auto_44841 ) ( not ( = ?auto_44832 ?auto_44840 ) ) ( OBJ-AT ?auto_44835 ?auto_44840 ) ( OBJ-AT ?auto_44834 ?auto_44840 ) ( IN-CITY ?auto_44838 ?auto_44841 ) ( not ( = ?auto_44832 ?auto_44838 ) ) ( OBJ-AT ?auto_44833 ?auto_44838 ) ( IN-CITY ?auto_44839 ?auto_44841 ) ( not ( = ?auto_44832 ?auto_44839 ) ) ( OBJ-AT ?auto_44837 ?auto_44839 ) ( OBJ-AT ?auto_44836 ?auto_44839 ) ( TRUCK-AT ?auto_44842 ?auto_44832 ) ( not ( = ?auto_44836 ?auto_44837 ) ) ( not ( = ?auto_44836 ?auto_44833 ) ) ( not ( = ?auto_44837 ?auto_44833 ) ) ( not ( = ?auto_44838 ?auto_44839 ) ) ( not ( = ?auto_44836 ?auto_44834 ) ) ( not ( = ?auto_44837 ?auto_44834 ) ) ( not ( = ?auto_44833 ?auto_44834 ) ) ( not ( = ?auto_44840 ?auto_44838 ) ) ( not ( = ?auto_44840 ?auto_44839 ) ) ( not ( = ?auto_44836 ?auto_44835 ) ) ( not ( = ?auto_44837 ?auto_44835 ) ) ( not ( = ?auto_44833 ?auto_44835 ) ) ( not ( = ?auto_44834 ?auto_44835 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_44836 ?auto_44837 ?auto_44833 ?auto_44835 ?auto_44834 ?auto_44832 )
      ( DELIVER-5PKG-VERIFY ?auto_44833 ?auto_44834 ?auto_44835 ?auto_44836 ?auto_44837 ?auto_44832 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_44880 - OBJ
      ?auto_44881 - OBJ
      ?auto_44882 - OBJ
      ?auto_44883 - OBJ
      ?auto_44884 - OBJ
      ?auto_44879 - LOCATION
    )
    :vars
    (
      ?auto_44887 - LOCATION
      ?auto_44888 - CITY
      ?auto_44885 - LOCATION
      ?auto_44886 - LOCATION
      ?auto_44889 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_44887 ?auto_44888 ) ( IN-CITY ?auto_44879 ?auto_44888 ) ( not ( = ?auto_44879 ?auto_44887 ) ) ( OBJ-AT ?auto_44882 ?auto_44887 ) ( OBJ-AT ?auto_44881 ?auto_44887 ) ( IN-CITY ?auto_44885 ?auto_44888 ) ( not ( = ?auto_44879 ?auto_44885 ) ) ( OBJ-AT ?auto_44880 ?auto_44885 ) ( IN-CITY ?auto_44886 ?auto_44888 ) ( not ( = ?auto_44879 ?auto_44886 ) ) ( OBJ-AT ?auto_44883 ?auto_44886 ) ( OBJ-AT ?auto_44884 ?auto_44886 ) ( TRUCK-AT ?auto_44889 ?auto_44879 ) ( not ( = ?auto_44884 ?auto_44883 ) ) ( not ( = ?auto_44884 ?auto_44880 ) ) ( not ( = ?auto_44883 ?auto_44880 ) ) ( not ( = ?auto_44885 ?auto_44886 ) ) ( not ( = ?auto_44884 ?auto_44881 ) ) ( not ( = ?auto_44883 ?auto_44881 ) ) ( not ( = ?auto_44880 ?auto_44881 ) ) ( not ( = ?auto_44887 ?auto_44885 ) ) ( not ( = ?auto_44887 ?auto_44886 ) ) ( not ( = ?auto_44884 ?auto_44882 ) ) ( not ( = ?auto_44883 ?auto_44882 ) ) ( not ( = ?auto_44880 ?auto_44882 ) ) ( not ( = ?auto_44881 ?auto_44882 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_44884 ?auto_44883 ?auto_44880 ?auto_44882 ?auto_44881 ?auto_44879 )
      ( DELIVER-5PKG-VERIFY ?auto_44880 ?auto_44881 ?auto_44882 ?auto_44883 ?auto_44884 ?auto_44879 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_45227 - OBJ
      ?auto_45228 - OBJ
      ?auto_45229 - OBJ
      ?auto_45230 - OBJ
      ?auto_45231 - OBJ
      ?auto_45226 - LOCATION
    )
    :vars
    (
      ?auto_45234 - LOCATION
      ?auto_45235 - CITY
      ?auto_45232 - LOCATION
      ?auto_45233 - LOCATION
      ?auto_45236 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_45234 ?auto_45235 ) ( IN-CITY ?auto_45226 ?auto_45235 ) ( not ( = ?auto_45226 ?auto_45234 ) ) ( OBJ-AT ?auto_45228 ?auto_45234 ) ( OBJ-AT ?auto_45231 ?auto_45234 ) ( IN-CITY ?auto_45232 ?auto_45235 ) ( not ( = ?auto_45226 ?auto_45232 ) ) ( OBJ-AT ?auto_45227 ?auto_45232 ) ( IN-CITY ?auto_45233 ?auto_45235 ) ( not ( = ?auto_45226 ?auto_45233 ) ) ( OBJ-AT ?auto_45230 ?auto_45233 ) ( OBJ-AT ?auto_45229 ?auto_45233 ) ( TRUCK-AT ?auto_45236 ?auto_45226 ) ( not ( = ?auto_45229 ?auto_45230 ) ) ( not ( = ?auto_45229 ?auto_45227 ) ) ( not ( = ?auto_45230 ?auto_45227 ) ) ( not ( = ?auto_45232 ?auto_45233 ) ) ( not ( = ?auto_45229 ?auto_45231 ) ) ( not ( = ?auto_45230 ?auto_45231 ) ) ( not ( = ?auto_45227 ?auto_45231 ) ) ( not ( = ?auto_45234 ?auto_45232 ) ) ( not ( = ?auto_45234 ?auto_45233 ) ) ( not ( = ?auto_45229 ?auto_45228 ) ) ( not ( = ?auto_45230 ?auto_45228 ) ) ( not ( = ?auto_45227 ?auto_45228 ) ) ( not ( = ?auto_45231 ?auto_45228 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_45229 ?auto_45230 ?auto_45227 ?auto_45228 ?auto_45231 ?auto_45226 )
      ( DELIVER-5PKG-VERIFY ?auto_45227 ?auto_45228 ?auto_45229 ?auto_45230 ?auto_45231 ?auto_45226 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_45325 - OBJ
      ?auto_45326 - OBJ
      ?auto_45327 - OBJ
      ?auto_45328 - OBJ
      ?auto_45329 - OBJ
      ?auto_45324 - LOCATION
    )
    :vars
    (
      ?auto_45332 - LOCATION
      ?auto_45333 - CITY
      ?auto_45330 - LOCATION
      ?auto_45331 - LOCATION
      ?auto_45334 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_45332 ?auto_45333 ) ( IN-CITY ?auto_45324 ?auto_45333 ) ( not ( = ?auto_45324 ?auto_45332 ) ) ( OBJ-AT ?auto_45326 ?auto_45332 ) ( OBJ-AT ?auto_45328 ?auto_45332 ) ( IN-CITY ?auto_45330 ?auto_45333 ) ( not ( = ?auto_45324 ?auto_45330 ) ) ( OBJ-AT ?auto_45325 ?auto_45330 ) ( IN-CITY ?auto_45331 ?auto_45333 ) ( not ( = ?auto_45324 ?auto_45331 ) ) ( OBJ-AT ?auto_45329 ?auto_45331 ) ( OBJ-AT ?auto_45327 ?auto_45331 ) ( TRUCK-AT ?auto_45334 ?auto_45324 ) ( not ( = ?auto_45327 ?auto_45329 ) ) ( not ( = ?auto_45327 ?auto_45325 ) ) ( not ( = ?auto_45329 ?auto_45325 ) ) ( not ( = ?auto_45330 ?auto_45331 ) ) ( not ( = ?auto_45327 ?auto_45328 ) ) ( not ( = ?auto_45329 ?auto_45328 ) ) ( not ( = ?auto_45325 ?auto_45328 ) ) ( not ( = ?auto_45332 ?auto_45330 ) ) ( not ( = ?auto_45332 ?auto_45331 ) ) ( not ( = ?auto_45327 ?auto_45326 ) ) ( not ( = ?auto_45329 ?auto_45326 ) ) ( not ( = ?auto_45325 ?auto_45326 ) ) ( not ( = ?auto_45328 ?auto_45326 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_45327 ?auto_45329 ?auto_45325 ?auto_45326 ?auto_45328 ?auto_45324 )
      ( DELIVER-5PKG-VERIFY ?auto_45325 ?auto_45326 ?auto_45327 ?auto_45328 ?auto_45329 ?auto_45324 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_45471 - OBJ
      ?auto_45472 - OBJ
      ?auto_45473 - OBJ
      ?auto_45474 - OBJ
      ?auto_45475 - OBJ
      ?auto_45470 - LOCATION
    )
    :vars
    (
      ?auto_45478 - LOCATION
      ?auto_45479 - CITY
      ?auto_45476 - LOCATION
      ?auto_45477 - LOCATION
      ?auto_45480 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_45478 ?auto_45479 ) ( IN-CITY ?auto_45470 ?auto_45479 ) ( not ( = ?auto_45470 ?auto_45478 ) ) ( OBJ-AT ?auto_45472 ?auto_45478 ) ( OBJ-AT ?auto_45475 ?auto_45478 ) ( IN-CITY ?auto_45476 ?auto_45479 ) ( not ( = ?auto_45470 ?auto_45476 ) ) ( OBJ-AT ?auto_45471 ?auto_45476 ) ( IN-CITY ?auto_45477 ?auto_45479 ) ( not ( = ?auto_45470 ?auto_45477 ) ) ( OBJ-AT ?auto_45473 ?auto_45477 ) ( OBJ-AT ?auto_45474 ?auto_45477 ) ( TRUCK-AT ?auto_45480 ?auto_45470 ) ( not ( = ?auto_45474 ?auto_45473 ) ) ( not ( = ?auto_45474 ?auto_45471 ) ) ( not ( = ?auto_45473 ?auto_45471 ) ) ( not ( = ?auto_45476 ?auto_45477 ) ) ( not ( = ?auto_45474 ?auto_45475 ) ) ( not ( = ?auto_45473 ?auto_45475 ) ) ( not ( = ?auto_45471 ?auto_45475 ) ) ( not ( = ?auto_45478 ?auto_45476 ) ) ( not ( = ?auto_45478 ?auto_45477 ) ) ( not ( = ?auto_45474 ?auto_45472 ) ) ( not ( = ?auto_45473 ?auto_45472 ) ) ( not ( = ?auto_45471 ?auto_45472 ) ) ( not ( = ?auto_45475 ?auto_45472 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_45474 ?auto_45473 ?auto_45471 ?auto_45472 ?auto_45475 ?auto_45470 )
      ( DELIVER-5PKG-VERIFY ?auto_45471 ?auto_45472 ?auto_45473 ?auto_45474 ?auto_45475 ?auto_45470 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_45620 - OBJ
      ?auto_45621 - OBJ
      ?auto_45622 - OBJ
      ?auto_45623 - OBJ
      ?auto_45624 - OBJ
      ?auto_45619 - LOCATION
    )
    :vars
    (
      ?auto_45627 - LOCATION
      ?auto_45628 - CITY
      ?auto_45625 - LOCATION
      ?auto_45626 - LOCATION
      ?auto_45629 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_45627 ?auto_45628 ) ( IN-CITY ?auto_45619 ?auto_45628 ) ( not ( = ?auto_45619 ?auto_45627 ) ) ( OBJ-AT ?auto_45621 ?auto_45627 ) ( OBJ-AT ?auto_45623 ?auto_45627 ) ( IN-CITY ?auto_45625 ?auto_45628 ) ( not ( = ?auto_45619 ?auto_45625 ) ) ( OBJ-AT ?auto_45620 ?auto_45625 ) ( IN-CITY ?auto_45626 ?auto_45628 ) ( not ( = ?auto_45619 ?auto_45626 ) ) ( OBJ-AT ?auto_45622 ?auto_45626 ) ( OBJ-AT ?auto_45624 ?auto_45626 ) ( TRUCK-AT ?auto_45629 ?auto_45619 ) ( not ( = ?auto_45624 ?auto_45622 ) ) ( not ( = ?auto_45624 ?auto_45620 ) ) ( not ( = ?auto_45622 ?auto_45620 ) ) ( not ( = ?auto_45625 ?auto_45626 ) ) ( not ( = ?auto_45624 ?auto_45623 ) ) ( not ( = ?auto_45622 ?auto_45623 ) ) ( not ( = ?auto_45620 ?auto_45623 ) ) ( not ( = ?auto_45627 ?auto_45625 ) ) ( not ( = ?auto_45627 ?auto_45626 ) ) ( not ( = ?auto_45624 ?auto_45621 ) ) ( not ( = ?auto_45622 ?auto_45621 ) ) ( not ( = ?auto_45620 ?auto_45621 ) ) ( not ( = ?auto_45623 ?auto_45621 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_45624 ?auto_45622 ?auto_45620 ?auto_45621 ?auto_45623 ?auto_45619 )
      ( DELIVER-5PKG-VERIFY ?auto_45620 ?auto_45621 ?auto_45622 ?auto_45623 ?auto_45624 ?auto_45619 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_46077 - OBJ
      ?auto_46078 - OBJ
      ?auto_46079 - OBJ
      ?auto_46080 - OBJ
      ?auto_46081 - OBJ
      ?auto_46076 - LOCATION
    )
    :vars
    (
      ?auto_46084 - LOCATION
      ?auto_46085 - CITY
      ?auto_46082 - LOCATION
      ?auto_46083 - LOCATION
      ?auto_46086 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_46084 ?auto_46085 ) ( IN-CITY ?auto_46076 ?auto_46085 ) ( not ( = ?auto_46076 ?auto_46084 ) ) ( OBJ-AT ?auto_46078 ?auto_46084 ) ( OBJ-AT ?auto_46079 ?auto_46084 ) ( IN-CITY ?auto_46082 ?auto_46085 ) ( not ( = ?auto_46076 ?auto_46082 ) ) ( OBJ-AT ?auto_46077 ?auto_46082 ) ( IN-CITY ?auto_46083 ?auto_46085 ) ( not ( = ?auto_46076 ?auto_46083 ) ) ( OBJ-AT ?auto_46081 ?auto_46083 ) ( OBJ-AT ?auto_46080 ?auto_46083 ) ( TRUCK-AT ?auto_46086 ?auto_46076 ) ( not ( = ?auto_46080 ?auto_46081 ) ) ( not ( = ?auto_46080 ?auto_46077 ) ) ( not ( = ?auto_46081 ?auto_46077 ) ) ( not ( = ?auto_46082 ?auto_46083 ) ) ( not ( = ?auto_46080 ?auto_46079 ) ) ( not ( = ?auto_46081 ?auto_46079 ) ) ( not ( = ?auto_46077 ?auto_46079 ) ) ( not ( = ?auto_46084 ?auto_46082 ) ) ( not ( = ?auto_46084 ?auto_46083 ) ) ( not ( = ?auto_46080 ?auto_46078 ) ) ( not ( = ?auto_46081 ?auto_46078 ) ) ( not ( = ?auto_46077 ?auto_46078 ) ) ( not ( = ?auto_46079 ?auto_46078 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_46080 ?auto_46081 ?auto_46077 ?auto_46078 ?auto_46079 ?auto_46076 )
      ( DELIVER-5PKG-VERIFY ?auto_46077 ?auto_46078 ?auto_46079 ?auto_46080 ?auto_46081 ?auto_46076 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_46124 - OBJ
      ?auto_46125 - OBJ
      ?auto_46126 - OBJ
      ?auto_46127 - OBJ
      ?auto_46128 - OBJ
      ?auto_46123 - LOCATION
    )
    :vars
    (
      ?auto_46131 - LOCATION
      ?auto_46132 - CITY
      ?auto_46129 - LOCATION
      ?auto_46130 - LOCATION
      ?auto_46133 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_46131 ?auto_46132 ) ( IN-CITY ?auto_46123 ?auto_46132 ) ( not ( = ?auto_46123 ?auto_46131 ) ) ( OBJ-AT ?auto_46125 ?auto_46131 ) ( OBJ-AT ?auto_46126 ?auto_46131 ) ( IN-CITY ?auto_46129 ?auto_46132 ) ( not ( = ?auto_46123 ?auto_46129 ) ) ( OBJ-AT ?auto_46124 ?auto_46129 ) ( IN-CITY ?auto_46130 ?auto_46132 ) ( not ( = ?auto_46123 ?auto_46130 ) ) ( OBJ-AT ?auto_46127 ?auto_46130 ) ( OBJ-AT ?auto_46128 ?auto_46130 ) ( TRUCK-AT ?auto_46133 ?auto_46123 ) ( not ( = ?auto_46128 ?auto_46127 ) ) ( not ( = ?auto_46128 ?auto_46124 ) ) ( not ( = ?auto_46127 ?auto_46124 ) ) ( not ( = ?auto_46129 ?auto_46130 ) ) ( not ( = ?auto_46128 ?auto_46126 ) ) ( not ( = ?auto_46127 ?auto_46126 ) ) ( not ( = ?auto_46124 ?auto_46126 ) ) ( not ( = ?auto_46131 ?auto_46129 ) ) ( not ( = ?auto_46131 ?auto_46130 ) ) ( not ( = ?auto_46128 ?auto_46125 ) ) ( not ( = ?auto_46127 ?auto_46125 ) ) ( not ( = ?auto_46124 ?auto_46125 ) ) ( not ( = ?auto_46126 ?auto_46125 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_46128 ?auto_46127 ?auto_46124 ?auto_46125 ?auto_46126 ?auto_46123 )
      ( DELIVER-5PKG-VERIFY ?auto_46124 ?auto_46125 ?auto_46126 ?auto_46127 ?auto_46128 ?auto_46123 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_46832 - OBJ
      ?auto_46833 - OBJ
      ?auto_46834 - OBJ
      ?auto_46835 - OBJ
      ?auto_46836 - OBJ
      ?auto_46831 - LOCATION
    )
    :vars
    (
      ?auto_46839 - LOCATION
      ?auto_46840 - CITY
      ?auto_46837 - LOCATION
      ?auto_46838 - LOCATION
      ?auto_46841 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_46839 ?auto_46840 ) ( IN-CITY ?auto_46831 ?auto_46840 ) ( not ( = ?auto_46831 ?auto_46839 ) ) ( OBJ-AT ?auto_46836 ?auto_46839 ) ( OBJ-AT ?auto_46832 ?auto_46839 ) ( IN-CITY ?auto_46837 ?auto_46840 ) ( not ( = ?auto_46831 ?auto_46837 ) ) ( OBJ-AT ?auto_46835 ?auto_46837 ) ( IN-CITY ?auto_46838 ?auto_46840 ) ( not ( = ?auto_46831 ?auto_46838 ) ) ( OBJ-AT ?auto_46834 ?auto_46838 ) ( OBJ-AT ?auto_46833 ?auto_46838 ) ( TRUCK-AT ?auto_46841 ?auto_46831 ) ( not ( = ?auto_46833 ?auto_46834 ) ) ( not ( = ?auto_46833 ?auto_46835 ) ) ( not ( = ?auto_46834 ?auto_46835 ) ) ( not ( = ?auto_46837 ?auto_46838 ) ) ( not ( = ?auto_46833 ?auto_46832 ) ) ( not ( = ?auto_46834 ?auto_46832 ) ) ( not ( = ?auto_46835 ?auto_46832 ) ) ( not ( = ?auto_46839 ?auto_46837 ) ) ( not ( = ?auto_46839 ?auto_46838 ) ) ( not ( = ?auto_46833 ?auto_46836 ) ) ( not ( = ?auto_46834 ?auto_46836 ) ) ( not ( = ?auto_46835 ?auto_46836 ) ) ( not ( = ?auto_46832 ?auto_46836 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_46833 ?auto_46834 ?auto_46835 ?auto_46836 ?auto_46832 ?auto_46831 )
      ( DELIVER-5PKG-VERIFY ?auto_46832 ?auto_46833 ?auto_46834 ?auto_46835 ?auto_46836 ?auto_46831 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_46879 - OBJ
      ?auto_46880 - OBJ
      ?auto_46881 - OBJ
      ?auto_46882 - OBJ
      ?auto_46883 - OBJ
      ?auto_46878 - LOCATION
    )
    :vars
    (
      ?auto_46886 - LOCATION
      ?auto_46887 - CITY
      ?auto_46884 - LOCATION
      ?auto_46885 - LOCATION
      ?auto_46888 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_46886 ?auto_46887 ) ( IN-CITY ?auto_46878 ?auto_46887 ) ( not ( = ?auto_46878 ?auto_46886 ) ) ( OBJ-AT ?auto_46882 ?auto_46886 ) ( OBJ-AT ?auto_46879 ?auto_46886 ) ( IN-CITY ?auto_46884 ?auto_46887 ) ( not ( = ?auto_46878 ?auto_46884 ) ) ( OBJ-AT ?auto_46883 ?auto_46884 ) ( IN-CITY ?auto_46885 ?auto_46887 ) ( not ( = ?auto_46878 ?auto_46885 ) ) ( OBJ-AT ?auto_46881 ?auto_46885 ) ( OBJ-AT ?auto_46880 ?auto_46885 ) ( TRUCK-AT ?auto_46888 ?auto_46878 ) ( not ( = ?auto_46880 ?auto_46881 ) ) ( not ( = ?auto_46880 ?auto_46883 ) ) ( not ( = ?auto_46881 ?auto_46883 ) ) ( not ( = ?auto_46884 ?auto_46885 ) ) ( not ( = ?auto_46880 ?auto_46879 ) ) ( not ( = ?auto_46881 ?auto_46879 ) ) ( not ( = ?auto_46883 ?auto_46879 ) ) ( not ( = ?auto_46886 ?auto_46884 ) ) ( not ( = ?auto_46886 ?auto_46885 ) ) ( not ( = ?auto_46880 ?auto_46882 ) ) ( not ( = ?auto_46881 ?auto_46882 ) ) ( not ( = ?auto_46883 ?auto_46882 ) ) ( not ( = ?auto_46879 ?auto_46882 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_46880 ?auto_46881 ?auto_46883 ?auto_46882 ?auto_46879 ?auto_46878 )
      ( DELIVER-5PKG-VERIFY ?auto_46879 ?auto_46880 ?auto_46881 ?auto_46882 ?auto_46883 ?auto_46878 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_46926 - OBJ
      ?auto_46927 - OBJ
      ?auto_46928 - OBJ
      ?auto_46929 - OBJ
      ?auto_46930 - OBJ
      ?auto_46925 - LOCATION
    )
    :vars
    (
      ?auto_46933 - LOCATION
      ?auto_46934 - CITY
      ?auto_46931 - LOCATION
      ?auto_46932 - LOCATION
      ?auto_46935 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_46933 ?auto_46934 ) ( IN-CITY ?auto_46925 ?auto_46934 ) ( not ( = ?auto_46925 ?auto_46933 ) ) ( OBJ-AT ?auto_46930 ?auto_46933 ) ( OBJ-AT ?auto_46926 ?auto_46933 ) ( IN-CITY ?auto_46931 ?auto_46934 ) ( not ( = ?auto_46925 ?auto_46931 ) ) ( OBJ-AT ?auto_46928 ?auto_46931 ) ( IN-CITY ?auto_46932 ?auto_46934 ) ( not ( = ?auto_46925 ?auto_46932 ) ) ( OBJ-AT ?auto_46929 ?auto_46932 ) ( OBJ-AT ?auto_46927 ?auto_46932 ) ( TRUCK-AT ?auto_46935 ?auto_46925 ) ( not ( = ?auto_46927 ?auto_46929 ) ) ( not ( = ?auto_46927 ?auto_46928 ) ) ( not ( = ?auto_46929 ?auto_46928 ) ) ( not ( = ?auto_46931 ?auto_46932 ) ) ( not ( = ?auto_46927 ?auto_46926 ) ) ( not ( = ?auto_46929 ?auto_46926 ) ) ( not ( = ?auto_46928 ?auto_46926 ) ) ( not ( = ?auto_46933 ?auto_46931 ) ) ( not ( = ?auto_46933 ?auto_46932 ) ) ( not ( = ?auto_46927 ?auto_46930 ) ) ( not ( = ?auto_46929 ?auto_46930 ) ) ( not ( = ?auto_46928 ?auto_46930 ) ) ( not ( = ?auto_46926 ?auto_46930 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_46927 ?auto_46929 ?auto_46928 ?auto_46930 ?auto_46926 ?auto_46925 )
      ( DELIVER-5PKG-VERIFY ?auto_46926 ?auto_46927 ?auto_46928 ?auto_46929 ?auto_46930 ?auto_46925 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_46973 - OBJ
      ?auto_46974 - OBJ
      ?auto_46975 - OBJ
      ?auto_46976 - OBJ
      ?auto_46977 - OBJ
      ?auto_46972 - LOCATION
    )
    :vars
    (
      ?auto_46980 - LOCATION
      ?auto_46981 - CITY
      ?auto_46978 - LOCATION
      ?auto_46979 - LOCATION
      ?auto_46982 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_46980 ?auto_46981 ) ( IN-CITY ?auto_46972 ?auto_46981 ) ( not ( = ?auto_46972 ?auto_46980 ) ) ( OBJ-AT ?auto_46976 ?auto_46980 ) ( OBJ-AT ?auto_46973 ?auto_46980 ) ( IN-CITY ?auto_46978 ?auto_46981 ) ( not ( = ?auto_46972 ?auto_46978 ) ) ( OBJ-AT ?auto_46975 ?auto_46978 ) ( IN-CITY ?auto_46979 ?auto_46981 ) ( not ( = ?auto_46972 ?auto_46979 ) ) ( OBJ-AT ?auto_46977 ?auto_46979 ) ( OBJ-AT ?auto_46974 ?auto_46979 ) ( TRUCK-AT ?auto_46982 ?auto_46972 ) ( not ( = ?auto_46974 ?auto_46977 ) ) ( not ( = ?auto_46974 ?auto_46975 ) ) ( not ( = ?auto_46977 ?auto_46975 ) ) ( not ( = ?auto_46978 ?auto_46979 ) ) ( not ( = ?auto_46974 ?auto_46973 ) ) ( not ( = ?auto_46977 ?auto_46973 ) ) ( not ( = ?auto_46975 ?auto_46973 ) ) ( not ( = ?auto_46980 ?auto_46978 ) ) ( not ( = ?auto_46980 ?auto_46979 ) ) ( not ( = ?auto_46974 ?auto_46976 ) ) ( not ( = ?auto_46977 ?auto_46976 ) ) ( not ( = ?auto_46975 ?auto_46976 ) ) ( not ( = ?auto_46973 ?auto_46976 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_46974 ?auto_46977 ?auto_46975 ?auto_46976 ?auto_46973 ?auto_46972 )
      ( DELIVER-5PKG-VERIFY ?auto_46973 ?auto_46974 ?auto_46975 ?auto_46976 ?auto_46977 ?auto_46972 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_47220 - OBJ
      ?auto_47221 - OBJ
      ?auto_47222 - OBJ
      ?auto_47223 - OBJ
      ?auto_47224 - OBJ
      ?auto_47219 - LOCATION
    )
    :vars
    (
      ?auto_47227 - LOCATION
      ?auto_47228 - CITY
      ?auto_47225 - LOCATION
      ?auto_47226 - LOCATION
      ?auto_47229 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_47227 ?auto_47228 ) ( IN-CITY ?auto_47219 ?auto_47228 ) ( not ( = ?auto_47219 ?auto_47227 ) ) ( OBJ-AT ?auto_47222 ?auto_47227 ) ( OBJ-AT ?auto_47220 ?auto_47227 ) ( IN-CITY ?auto_47225 ?auto_47228 ) ( not ( = ?auto_47219 ?auto_47225 ) ) ( OBJ-AT ?auto_47224 ?auto_47225 ) ( IN-CITY ?auto_47226 ?auto_47228 ) ( not ( = ?auto_47219 ?auto_47226 ) ) ( OBJ-AT ?auto_47223 ?auto_47226 ) ( OBJ-AT ?auto_47221 ?auto_47226 ) ( TRUCK-AT ?auto_47229 ?auto_47219 ) ( not ( = ?auto_47221 ?auto_47223 ) ) ( not ( = ?auto_47221 ?auto_47224 ) ) ( not ( = ?auto_47223 ?auto_47224 ) ) ( not ( = ?auto_47225 ?auto_47226 ) ) ( not ( = ?auto_47221 ?auto_47220 ) ) ( not ( = ?auto_47223 ?auto_47220 ) ) ( not ( = ?auto_47224 ?auto_47220 ) ) ( not ( = ?auto_47227 ?auto_47225 ) ) ( not ( = ?auto_47227 ?auto_47226 ) ) ( not ( = ?auto_47221 ?auto_47222 ) ) ( not ( = ?auto_47223 ?auto_47222 ) ) ( not ( = ?auto_47224 ?auto_47222 ) ) ( not ( = ?auto_47220 ?auto_47222 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_47221 ?auto_47223 ?auto_47224 ?auto_47222 ?auto_47220 ?auto_47219 )
      ( DELIVER-5PKG-VERIFY ?auto_47220 ?auto_47221 ?auto_47222 ?auto_47223 ?auto_47224 ?auto_47219 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_47267 - OBJ
      ?auto_47268 - OBJ
      ?auto_47269 - OBJ
      ?auto_47270 - OBJ
      ?auto_47271 - OBJ
      ?auto_47266 - LOCATION
    )
    :vars
    (
      ?auto_47274 - LOCATION
      ?auto_47275 - CITY
      ?auto_47272 - LOCATION
      ?auto_47273 - LOCATION
      ?auto_47276 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_47274 ?auto_47275 ) ( IN-CITY ?auto_47266 ?auto_47275 ) ( not ( = ?auto_47266 ?auto_47274 ) ) ( OBJ-AT ?auto_47269 ?auto_47274 ) ( OBJ-AT ?auto_47267 ?auto_47274 ) ( IN-CITY ?auto_47272 ?auto_47275 ) ( not ( = ?auto_47266 ?auto_47272 ) ) ( OBJ-AT ?auto_47270 ?auto_47272 ) ( IN-CITY ?auto_47273 ?auto_47275 ) ( not ( = ?auto_47266 ?auto_47273 ) ) ( OBJ-AT ?auto_47271 ?auto_47273 ) ( OBJ-AT ?auto_47268 ?auto_47273 ) ( TRUCK-AT ?auto_47276 ?auto_47266 ) ( not ( = ?auto_47268 ?auto_47271 ) ) ( not ( = ?auto_47268 ?auto_47270 ) ) ( not ( = ?auto_47271 ?auto_47270 ) ) ( not ( = ?auto_47272 ?auto_47273 ) ) ( not ( = ?auto_47268 ?auto_47267 ) ) ( not ( = ?auto_47271 ?auto_47267 ) ) ( not ( = ?auto_47270 ?auto_47267 ) ) ( not ( = ?auto_47274 ?auto_47272 ) ) ( not ( = ?auto_47274 ?auto_47273 ) ) ( not ( = ?auto_47268 ?auto_47269 ) ) ( not ( = ?auto_47271 ?auto_47269 ) ) ( not ( = ?auto_47270 ?auto_47269 ) ) ( not ( = ?auto_47267 ?auto_47269 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_47268 ?auto_47271 ?auto_47270 ?auto_47269 ?auto_47267 ?auto_47266 )
      ( DELIVER-5PKG-VERIFY ?auto_47267 ?auto_47268 ?auto_47269 ?auto_47270 ?auto_47271 ?auto_47266 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_47464 - OBJ
      ?auto_47465 - OBJ
      ?auto_47466 - OBJ
      ?auto_47467 - OBJ
      ?auto_47468 - OBJ
      ?auto_47463 - LOCATION
    )
    :vars
    (
      ?auto_47471 - LOCATION
      ?auto_47472 - CITY
      ?auto_47469 - LOCATION
      ?auto_47470 - LOCATION
      ?auto_47473 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_47471 ?auto_47472 ) ( IN-CITY ?auto_47463 ?auto_47472 ) ( not ( = ?auto_47463 ?auto_47471 ) ) ( OBJ-AT ?auto_47468 ?auto_47471 ) ( OBJ-AT ?auto_47464 ?auto_47471 ) ( IN-CITY ?auto_47469 ?auto_47472 ) ( not ( = ?auto_47463 ?auto_47469 ) ) ( OBJ-AT ?auto_47467 ?auto_47469 ) ( IN-CITY ?auto_47470 ?auto_47472 ) ( not ( = ?auto_47463 ?auto_47470 ) ) ( OBJ-AT ?auto_47465 ?auto_47470 ) ( OBJ-AT ?auto_47466 ?auto_47470 ) ( TRUCK-AT ?auto_47473 ?auto_47463 ) ( not ( = ?auto_47466 ?auto_47465 ) ) ( not ( = ?auto_47466 ?auto_47467 ) ) ( not ( = ?auto_47465 ?auto_47467 ) ) ( not ( = ?auto_47469 ?auto_47470 ) ) ( not ( = ?auto_47466 ?auto_47464 ) ) ( not ( = ?auto_47465 ?auto_47464 ) ) ( not ( = ?auto_47467 ?auto_47464 ) ) ( not ( = ?auto_47471 ?auto_47469 ) ) ( not ( = ?auto_47471 ?auto_47470 ) ) ( not ( = ?auto_47466 ?auto_47468 ) ) ( not ( = ?auto_47465 ?auto_47468 ) ) ( not ( = ?auto_47467 ?auto_47468 ) ) ( not ( = ?auto_47464 ?auto_47468 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_47466 ?auto_47465 ?auto_47467 ?auto_47468 ?auto_47464 ?auto_47463 )
      ( DELIVER-5PKG-VERIFY ?auto_47464 ?auto_47465 ?auto_47466 ?auto_47467 ?auto_47468 ?auto_47463 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_47511 - OBJ
      ?auto_47512 - OBJ
      ?auto_47513 - OBJ
      ?auto_47514 - OBJ
      ?auto_47515 - OBJ
      ?auto_47510 - LOCATION
    )
    :vars
    (
      ?auto_47518 - LOCATION
      ?auto_47519 - CITY
      ?auto_47516 - LOCATION
      ?auto_47517 - LOCATION
      ?auto_47520 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_47518 ?auto_47519 ) ( IN-CITY ?auto_47510 ?auto_47519 ) ( not ( = ?auto_47510 ?auto_47518 ) ) ( OBJ-AT ?auto_47514 ?auto_47518 ) ( OBJ-AT ?auto_47511 ?auto_47518 ) ( IN-CITY ?auto_47516 ?auto_47519 ) ( not ( = ?auto_47510 ?auto_47516 ) ) ( OBJ-AT ?auto_47515 ?auto_47516 ) ( IN-CITY ?auto_47517 ?auto_47519 ) ( not ( = ?auto_47510 ?auto_47517 ) ) ( OBJ-AT ?auto_47512 ?auto_47517 ) ( OBJ-AT ?auto_47513 ?auto_47517 ) ( TRUCK-AT ?auto_47520 ?auto_47510 ) ( not ( = ?auto_47513 ?auto_47512 ) ) ( not ( = ?auto_47513 ?auto_47515 ) ) ( not ( = ?auto_47512 ?auto_47515 ) ) ( not ( = ?auto_47516 ?auto_47517 ) ) ( not ( = ?auto_47513 ?auto_47511 ) ) ( not ( = ?auto_47512 ?auto_47511 ) ) ( not ( = ?auto_47515 ?auto_47511 ) ) ( not ( = ?auto_47518 ?auto_47516 ) ) ( not ( = ?auto_47518 ?auto_47517 ) ) ( not ( = ?auto_47513 ?auto_47514 ) ) ( not ( = ?auto_47512 ?auto_47514 ) ) ( not ( = ?auto_47515 ?auto_47514 ) ) ( not ( = ?auto_47511 ?auto_47514 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_47513 ?auto_47512 ?auto_47515 ?auto_47514 ?auto_47511 ?auto_47510 )
      ( DELIVER-5PKG-VERIFY ?auto_47511 ?auto_47512 ?auto_47513 ?auto_47514 ?auto_47515 ?auto_47510 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_47659 - OBJ
      ?auto_47660 - OBJ
      ?auto_47661 - OBJ
      ?auto_47662 - OBJ
      ?auto_47663 - OBJ
      ?auto_47658 - LOCATION
    )
    :vars
    (
      ?auto_47666 - LOCATION
      ?auto_47667 - CITY
      ?auto_47664 - LOCATION
      ?auto_47665 - LOCATION
      ?auto_47668 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_47666 ?auto_47667 ) ( IN-CITY ?auto_47658 ?auto_47667 ) ( not ( = ?auto_47658 ?auto_47666 ) ) ( OBJ-AT ?auto_47663 ?auto_47666 ) ( OBJ-AT ?auto_47659 ?auto_47666 ) ( IN-CITY ?auto_47664 ?auto_47667 ) ( not ( = ?auto_47658 ?auto_47664 ) ) ( OBJ-AT ?auto_47661 ?auto_47664 ) ( IN-CITY ?auto_47665 ?auto_47667 ) ( not ( = ?auto_47658 ?auto_47665 ) ) ( OBJ-AT ?auto_47660 ?auto_47665 ) ( OBJ-AT ?auto_47662 ?auto_47665 ) ( TRUCK-AT ?auto_47668 ?auto_47658 ) ( not ( = ?auto_47662 ?auto_47660 ) ) ( not ( = ?auto_47662 ?auto_47661 ) ) ( not ( = ?auto_47660 ?auto_47661 ) ) ( not ( = ?auto_47664 ?auto_47665 ) ) ( not ( = ?auto_47662 ?auto_47659 ) ) ( not ( = ?auto_47660 ?auto_47659 ) ) ( not ( = ?auto_47661 ?auto_47659 ) ) ( not ( = ?auto_47666 ?auto_47664 ) ) ( not ( = ?auto_47666 ?auto_47665 ) ) ( not ( = ?auto_47662 ?auto_47663 ) ) ( not ( = ?auto_47660 ?auto_47663 ) ) ( not ( = ?auto_47661 ?auto_47663 ) ) ( not ( = ?auto_47659 ?auto_47663 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_47662 ?auto_47660 ?auto_47661 ?auto_47663 ?auto_47659 ?auto_47658 )
      ( DELIVER-5PKG-VERIFY ?auto_47659 ?auto_47660 ?auto_47661 ?auto_47662 ?auto_47663 ?auto_47658 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_47706 - OBJ
      ?auto_47707 - OBJ
      ?auto_47708 - OBJ
      ?auto_47709 - OBJ
      ?auto_47710 - OBJ
      ?auto_47705 - LOCATION
    )
    :vars
    (
      ?auto_47713 - LOCATION
      ?auto_47714 - CITY
      ?auto_47711 - LOCATION
      ?auto_47712 - LOCATION
      ?auto_47715 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_47713 ?auto_47714 ) ( IN-CITY ?auto_47705 ?auto_47714 ) ( not ( = ?auto_47705 ?auto_47713 ) ) ( OBJ-AT ?auto_47709 ?auto_47713 ) ( OBJ-AT ?auto_47706 ?auto_47713 ) ( IN-CITY ?auto_47711 ?auto_47714 ) ( not ( = ?auto_47705 ?auto_47711 ) ) ( OBJ-AT ?auto_47708 ?auto_47711 ) ( IN-CITY ?auto_47712 ?auto_47714 ) ( not ( = ?auto_47705 ?auto_47712 ) ) ( OBJ-AT ?auto_47707 ?auto_47712 ) ( OBJ-AT ?auto_47710 ?auto_47712 ) ( TRUCK-AT ?auto_47715 ?auto_47705 ) ( not ( = ?auto_47710 ?auto_47707 ) ) ( not ( = ?auto_47710 ?auto_47708 ) ) ( not ( = ?auto_47707 ?auto_47708 ) ) ( not ( = ?auto_47711 ?auto_47712 ) ) ( not ( = ?auto_47710 ?auto_47706 ) ) ( not ( = ?auto_47707 ?auto_47706 ) ) ( not ( = ?auto_47708 ?auto_47706 ) ) ( not ( = ?auto_47713 ?auto_47711 ) ) ( not ( = ?auto_47713 ?auto_47712 ) ) ( not ( = ?auto_47710 ?auto_47709 ) ) ( not ( = ?auto_47707 ?auto_47709 ) ) ( not ( = ?auto_47708 ?auto_47709 ) ) ( not ( = ?auto_47706 ?auto_47709 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_47710 ?auto_47707 ?auto_47708 ?auto_47709 ?auto_47706 ?auto_47705 )
      ( DELIVER-5PKG-VERIFY ?auto_47706 ?auto_47707 ?auto_47708 ?auto_47709 ?auto_47710 ?auto_47705 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_47902 - OBJ
      ?auto_47903 - OBJ
      ?auto_47904 - OBJ
      ?auto_47905 - OBJ
      ?auto_47906 - OBJ
      ?auto_47901 - LOCATION
    )
    :vars
    (
      ?auto_47909 - LOCATION
      ?auto_47910 - CITY
      ?auto_47907 - LOCATION
      ?auto_47908 - LOCATION
      ?auto_47911 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_47909 ?auto_47910 ) ( IN-CITY ?auto_47901 ?auto_47910 ) ( not ( = ?auto_47901 ?auto_47909 ) ) ( OBJ-AT ?auto_47904 ?auto_47909 ) ( OBJ-AT ?auto_47902 ?auto_47909 ) ( IN-CITY ?auto_47907 ?auto_47910 ) ( not ( = ?auto_47901 ?auto_47907 ) ) ( OBJ-AT ?auto_47906 ?auto_47907 ) ( IN-CITY ?auto_47908 ?auto_47910 ) ( not ( = ?auto_47901 ?auto_47908 ) ) ( OBJ-AT ?auto_47903 ?auto_47908 ) ( OBJ-AT ?auto_47905 ?auto_47908 ) ( TRUCK-AT ?auto_47911 ?auto_47901 ) ( not ( = ?auto_47905 ?auto_47903 ) ) ( not ( = ?auto_47905 ?auto_47906 ) ) ( not ( = ?auto_47903 ?auto_47906 ) ) ( not ( = ?auto_47907 ?auto_47908 ) ) ( not ( = ?auto_47905 ?auto_47902 ) ) ( not ( = ?auto_47903 ?auto_47902 ) ) ( not ( = ?auto_47906 ?auto_47902 ) ) ( not ( = ?auto_47909 ?auto_47907 ) ) ( not ( = ?auto_47909 ?auto_47908 ) ) ( not ( = ?auto_47905 ?auto_47904 ) ) ( not ( = ?auto_47903 ?auto_47904 ) ) ( not ( = ?auto_47906 ?auto_47904 ) ) ( not ( = ?auto_47902 ?auto_47904 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_47905 ?auto_47903 ?auto_47906 ?auto_47904 ?auto_47902 ?auto_47901 )
      ( DELIVER-5PKG-VERIFY ?auto_47902 ?auto_47903 ?auto_47904 ?auto_47905 ?auto_47906 ?auto_47901 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_48000 - OBJ
      ?auto_48001 - OBJ
      ?auto_48002 - OBJ
      ?auto_48003 - OBJ
      ?auto_48004 - OBJ
      ?auto_47999 - LOCATION
    )
    :vars
    (
      ?auto_48007 - LOCATION
      ?auto_48008 - CITY
      ?auto_48005 - LOCATION
      ?auto_48006 - LOCATION
      ?auto_48009 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_48007 ?auto_48008 ) ( IN-CITY ?auto_47999 ?auto_48008 ) ( not ( = ?auto_47999 ?auto_48007 ) ) ( OBJ-AT ?auto_48002 ?auto_48007 ) ( OBJ-AT ?auto_48000 ?auto_48007 ) ( IN-CITY ?auto_48005 ?auto_48008 ) ( not ( = ?auto_47999 ?auto_48005 ) ) ( OBJ-AT ?auto_48003 ?auto_48005 ) ( IN-CITY ?auto_48006 ?auto_48008 ) ( not ( = ?auto_47999 ?auto_48006 ) ) ( OBJ-AT ?auto_48001 ?auto_48006 ) ( OBJ-AT ?auto_48004 ?auto_48006 ) ( TRUCK-AT ?auto_48009 ?auto_47999 ) ( not ( = ?auto_48004 ?auto_48001 ) ) ( not ( = ?auto_48004 ?auto_48003 ) ) ( not ( = ?auto_48001 ?auto_48003 ) ) ( not ( = ?auto_48005 ?auto_48006 ) ) ( not ( = ?auto_48004 ?auto_48000 ) ) ( not ( = ?auto_48001 ?auto_48000 ) ) ( not ( = ?auto_48003 ?auto_48000 ) ) ( not ( = ?auto_48007 ?auto_48005 ) ) ( not ( = ?auto_48007 ?auto_48006 ) ) ( not ( = ?auto_48004 ?auto_48002 ) ) ( not ( = ?auto_48001 ?auto_48002 ) ) ( not ( = ?auto_48003 ?auto_48002 ) ) ( not ( = ?auto_48000 ?auto_48002 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_48004 ?auto_48001 ?auto_48003 ?auto_48002 ?auto_48000 ?auto_47999 )
      ( DELIVER-5PKG-VERIFY ?auto_48000 ?auto_48001 ?auto_48002 ?auto_48003 ?auto_48004 ?auto_47999 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_48197 - OBJ
      ?auto_48198 - OBJ
      ?auto_48199 - OBJ
      ?auto_48200 - OBJ
      ?auto_48201 - OBJ
      ?auto_48196 - LOCATION
    )
    :vars
    (
      ?auto_48204 - LOCATION
      ?auto_48205 - CITY
      ?auto_48202 - LOCATION
      ?auto_48203 - LOCATION
      ?auto_48206 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_48204 ?auto_48205 ) ( IN-CITY ?auto_48196 ?auto_48205 ) ( not ( = ?auto_48196 ?auto_48204 ) ) ( OBJ-AT ?auto_48201 ?auto_48204 ) ( OBJ-AT ?auto_48197 ?auto_48204 ) ( IN-CITY ?auto_48202 ?auto_48205 ) ( not ( = ?auto_48196 ?auto_48202 ) ) ( OBJ-AT ?auto_48198 ?auto_48202 ) ( IN-CITY ?auto_48203 ?auto_48205 ) ( not ( = ?auto_48196 ?auto_48203 ) ) ( OBJ-AT ?auto_48200 ?auto_48203 ) ( OBJ-AT ?auto_48199 ?auto_48203 ) ( TRUCK-AT ?auto_48206 ?auto_48196 ) ( not ( = ?auto_48199 ?auto_48200 ) ) ( not ( = ?auto_48199 ?auto_48198 ) ) ( not ( = ?auto_48200 ?auto_48198 ) ) ( not ( = ?auto_48202 ?auto_48203 ) ) ( not ( = ?auto_48199 ?auto_48197 ) ) ( not ( = ?auto_48200 ?auto_48197 ) ) ( not ( = ?auto_48198 ?auto_48197 ) ) ( not ( = ?auto_48204 ?auto_48202 ) ) ( not ( = ?auto_48204 ?auto_48203 ) ) ( not ( = ?auto_48199 ?auto_48201 ) ) ( not ( = ?auto_48200 ?auto_48201 ) ) ( not ( = ?auto_48198 ?auto_48201 ) ) ( not ( = ?auto_48197 ?auto_48201 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_48199 ?auto_48200 ?auto_48198 ?auto_48201 ?auto_48197 ?auto_48196 )
      ( DELIVER-5PKG-VERIFY ?auto_48197 ?auto_48198 ?auto_48199 ?auto_48200 ?auto_48201 ?auto_48196 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_48244 - OBJ
      ?auto_48245 - OBJ
      ?auto_48246 - OBJ
      ?auto_48247 - OBJ
      ?auto_48248 - OBJ
      ?auto_48243 - LOCATION
    )
    :vars
    (
      ?auto_48251 - LOCATION
      ?auto_48252 - CITY
      ?auto_48249 - LOCATION
      ?auto_48250 - LOCATION
      ?auto_48253 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_48251 ?auto_48252 ) ( IN-CITY ?auto_48243 ?auto_48252 ) ( not ( = ?auto_48243 ?auto_48251 ) ) ( OBJ-AT ?auto_48247 ?auto_48251 ) ( OBJ-AT ?auto_48244 ?auto_48251 ) ( IN-CITY ?auto_48249 ?auto_48252 ) ( not ( = ?auto_48243 ?auto_48249 ) ) ( OBJ-AT ?auto_48245 ?auto_48249 ) ( IN-CITY ?auto_48250 ?auto_48252 ) ( not ( = ?auto_48243 ?auto_48250 ) ) ( OBJ-AT ?auto_48248 ?auto_48250 ) ( OBJ-AT ?auto_48246 ?auto_48250 ) ( TRUCK-AT ?auto_48253 ?auto_48243 ) ( not ( = ?auto_48246 ?auto_48248 ) ) ( not ( = ?auto_48246 ?auto_48245 ) ) ( not ( = ?auto_48248 ?auto_48245 ) ) ( not ( = ?auto_48249 ?auto_48250 ) ) ( not ( = ?auto_48246 ?auto_48244 ) ) ( not ( = ?auto_48248 ?auto_48244 ) ) ( not ( = ?auto_48245 ?auto_48244 ) ) ( not ( = ?auto_48251 ?auto_48249 ) ) ( not ( = ?auto_48251 ?auto_48250 ) ) ( not ( = ?auto_48246 ?auto_48247 ) ) ( not ( = ?auto_48248 ?auto_48247 ) ) ( not ( = ?auto_48245 ?auto_48247 ) ) ( not ( = ?auto_48244 ?auto_48247 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_48246 ?auto_48248 ?auto_48245 ?auto_48247 ?auto_48244 ?auto_48243 )
      ( DELIVER-5PKG-VERIFY ?auto_48244 ?auto_48245 ?auto_48246 ?auto_48247 ?auto_48248 ?auto_48243 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_48291 - OBJ
      ?auto_48292 - OBJ
      ?auto_48293 - OBJ
      ?auto_48294 - OBJ
      ?auto_48295 - OBJ
      ?auto_48290 - LOCATION
    )
    :vars
    (
      ?auto_48298 - LOCATION
      ?auto_48299 - CITY
      ?auto_48296 - LOCATION
      ?auto_48297 - LOCATION
      ?auto_48300 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_48298 ?auto_48299 ) ( IN-CITY ?auto_48290 ?auto_48299 ) ( not ( = ?auto_48290 ?auto_48298 ) ) ( OBJ-AT ?auto_48295 ?auto_48298 ) ( OBJ-AT ?auto_48291 ?auto_48298 ) ( IN-CITY ?auto_48296 ?auto_48299 ) ( not ( = ?auto_48290 ?auto_48296 ) ) ( OBJ-AT ?auto_48292 ?auto_48296 ) ( IN-CITY ?auto_48297 ?auto_48299 ) ( not ( = ?auto_48290 ?auto_48297 ) ) ( OBJ-AT ?auto_48293 ?auto_48297 ) ( OBJ-AT ?auto_48294 ?auto_48297 ) ( TRUCK-AT ?auto_48300 ?auto_48290 ) ( not ( = ?auto_48294 ?auto_48293 ) ) ( not ( = ?auto_48294 ?auto_48292 ) ) ( not ( = ?auto_48293 ?auto_48292 ) ) ( not ( = ?auto_48296 ?auto_48297 ) ) ( not ( = ?auto_48294 ?auto_48291 ) ) ( not ( = ?auto_48293 ?auto_48291 ) ) ( not ( = ?auto_48292 ?auto_48291 ) ) ( not ( = ?auto_48298 ?auto_48296 ) ) ( not ( = ?auto_48298 ?auto_48297 ) ) ( not ( = ?auto_48294 ?auto_48295 ) ) ( not ( = ?auto_48293 ?auto_48295 ) ) ( not ( = ?auto_48292 ?auto_48295 ) ) ( not ( = ?auto_48291 ?auto_48295 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_48294 ?auto_48293 ?auto_48292 ?auto_48295 ?auto_48291 ?auto_48290 )
      ( DELIVER-5PKG-VERIFY ?auto_48291 ?auto_48292 ?auto_48293 ?auto_48294 ?auto_48295 ?auto_48290 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_48338 - OBJ
      ?auto_48339 - OBJ
      ?auto_48340 - OBJ
      ?auto_48341 - OBJ
      ?auto_48342 - OBJ
      ?auto_48337 - LOCATION
    )
    :vars
    (
      ?auto_48345 - LOCATION
      ?auto_48346 - CITY
      ?auto_48343 - LOCATION
      ?auto_48344 - LOCATION
      ?auto_48347 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_48345 ?auto_48346 ) ( IN-CITY ?auto_48337 ?auto_48346 ) ( not ( = ?auto_48337 ?auto_48345 ) ) ( OBJ-AT ?auto_48341 ?auto_48345 ) ( OBJ-AT ?auto_48338 ?auto_48345 ) ( IN-CITY ?auto_48343 ?auto_48346 ) ( not ( = ?auto_48337 ?auto_48343 ) ) ( OBJ-AT ?auto_48339 ?auto_48343 ) ( IN-CITY ?auto_48344 ?auto_48346 ) ( not ( = ?auto_48337 ?auto_48344 ) ) ( OBJ-AT ?auto_48340 ?auto_48344 ) ( OBJ-AT ?auto_48342 ?auto_48344 ) ( TRUCK-AT ?auto_48347 ?auto_48337 ) ( not ( = ?auto_48342 ?auto_48340 ) ) ( not ( = ?auto_48342 ?auto_48339 ) ) ( not ( = ?auto_48340 ?auto_48339 ) ) ( not ( = ?auto_48343 ?auto_48344 ) ) ( not ( = ?auto_48342 ?auto_48338 ) ) ( not ( = ?auto_48340 ?auto_48338 ) ) ( not ( = ?auto_48339 ?auto_48338 ) ) ( not ( = ?auto_48345 ?auto_48343 ) ) ( not ( = ?auto_48345 ?auto_48344 ) ) ( not ( = ?auto_48342 ?auto_48341 ) ) ( not ( = ?auto_48340 ?auto_48341 ) ) ( not ( = ?auto_48339 ?auto_48341 ) ) ( not ( = ?auto_48338 ?auto_48341 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_48342 ?auto_48340 ?auto_48339 ?auto_48341 ?auto_48338 ?auto_48337 )
      ( DELIVER-5PKG-VERIFY ?auto_48338 ?auto_48339 ?auto_48340 ?auto_48341 ?auto_48342 ?auto_48337 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_48635 - OBJ
      ?auto_48636 - OBJ
      ?auto_48637 - OBJ
      ?auto_48638 - OBJ
      ?auto_48639 - OBJ
      ?auto_48634 - LOCATION
    )
    :vars
    (
      ?auto_48642 - LOCATION
      ?auto_48643 - CITY
      ?auto_48640 - LOCATION
      ?auto_48641 - LOCATION
      ?auto_48644 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_48642 ?auto_48643 ) ( IN-CITY ?auto_48634 ?auto_48643 ) ( not ( = ?auto_48634 ?auto_48642 ) ) ( OBJ-AT ?auto_48637 ?auto_48642 ) ( OBJ-AT ?auto_48635 ?auto_48642 ) ( IN-CITY ?auto_48640 ?auto_48643 ) ( not ( = ?auto_48634 ?auto_48640 ) ) ( OBJ-AT ?auto_48636 ?auto_48640 ) ( IN-CITY ?auto_48641 ?auto_48643 ) ( not ( = ?auto_48634 ?auto_48641 ) ) ( OBJ-AT ?auto_48639 ?auto_48641 ) ( OBJ-AT ?auto_48638 ?auto_48641 ) ( TRUCK-AT ?auto_48644 ?auto_48634 ) ( not ( = ?auto_48638 ?auto_48639 ) ) ( not ( = ?auto_48638 ?auto_48636 ) ) ( not ( = ?auto_48639 ?auto_48636 ) ) ( not ( = ?auto_48640 ?auto_48641 ) ) ( not ( = ?auto_48638 ?auto_48635 ) ) ( not ( = ?auto_48639 ?auto_48635 ) ) ( not ( = ?auto_48636 ?auto_48635 ) ) ( not ( = ?auto_48642 ?auto_48640 ) ) ( not ( = ?auto_48642 ?auto_48641 ) ) ( not ( = ?auto_48638 ?auto_48637 ) ) ( not ( = ?auto_48639 ?auto_48637 ) ) ( not ( = ?auto_48636 ?auto_48637 ) ) ( not ( = ?auto_48635 ?auto_48637 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_48638 ?auto_48639 ?auto_48636 ?auto_48637 ?auto_48635 ?auto_48634 )
      ( DELIVER-5PKG-VERIFY ?auto_48635 ?auto_48636 ?auto_48637 ?auto_48638 ?auto_48639 ?auto_48634 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_48682 - OBJ
      ?auto_48683 - OBJ
      ?auto_48684 - OBJ
      ?auto_48685 - OBJ
      ?auto_48686 - OBJ
      ?auto_48681 - LOCATION
    )
    :vars
    (
      ?auto_48689 - LOCATION
      ?auto_48690 - CITY
      ?auto_48687 - LOCATION
      ?auto_48688 - LOCATION
      ?auto_48691 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_48689 ?auto_48690 ) ( IN-CITY ?auto_48681 ?auto_48690 ) ( not ( = ?auto_48681 ?auto_48689 ) ) ( OBJ-AT ?auto_48684 ?auto_48689 ) ( OBJ-AT ?auto_48682 ?auto_48689 ) ( IN-CITY ?auto_48687 ?auto_48690 ) ( not ( = ?auto_48681 ?auto_48687 ) ) ( OBJ-AT ?auto_48683 ?auto_48687 ) ( IN-CITY ?auto_48688 ?auto_48690 ) ( not ( = ?auto_48681 ?auto_48688 ) ) ( OBJ-AT ?auto_48685 ?auto_48688 ) ( OBJ-AT ?auto_48686 ?auto_48688 ) ( TRUCK-AT ?auto_48691 ?auto_48681 ) ( not ( = ?auto_48686 ?auto_48685 ) ) ( not ( = ?auto_48686 ?auto_48683 ) ) ( not ( = ?auto_48685 ?auto_48683 ) ) ( not ( = ?auto_48687 ?auto_48688 ) ) ( not ( = ?auto_48686 ?auto_48682 ) ) ( not ( = ?auto_48685 ?auto_48682 ) ) ( not ( = ?auto_48683 ?auto_48682 ) ) ( not ( = ?auto_48689 ?auto_48687 ) ) ( not ( = ?auto_48689 ?auto_48688 ) ) ( not ( = ?auto_48686 ?auto_48684 ) ) ( not ( = ?auto_48685 ?auto_48684 ) ) ( not ( = ?auto_48683 ?auto_48684 ) ) ( not ( = ?auto_48682 ?auto_48684 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_48686 ?auto_48685 ?auto_48683 ?auto_48684 ?auto_48682 ?auto_48681 )
      ( DELIVER-5PKG-VERIFY ?auto_48682 ?auto_48683 ?auto_48684 ?auto_48685 ?auto_48686 ?auto_48681 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_49799 - OBJ
      ?auto_49800 - OBJ
      ?auto_49801 - OBJ
      ?auto_49802 - OBJ
      ?auto_49803 - OBJ
      ?auto_49798 - LOCATION
    )
    :vars
    (
      ?auto_49806 - LOCATION
      ?auto_49807 - CITY
      ?auto_49804 - LOCATION
      ?auto_49805 - LOCATION
      ?auto_49808 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_49806 ?auto_49807 ) ( IN-CITY ?auto_49798 ?auto_49807 ) ( not ( = ?auto_49798 ?auto_49806 ) ) ( OBJ-AT ?auto_49800 ?auto_49806 ) ( OBJ-AT ?auto_49799 ?auto_49806 ) ( IN-CITY ?auto_49804 ?auto_49807 ) ( not ( = ?auto_49798 ?auto_49804 ) ) ( OBJ-AT ?auto_49803 ?auto_49804 ) ( IN-CITY ?auto_49805 ?auto_49807 ) ( not ( = ?auto_49798 ?auto_49805 ) ) ( OBJ-AT ?auto_49802 ?auto_49805 ) ( OBJ-AT ?auto_49801 ?auto_49805 ) ( TRUCK-AT ?auto_49808 ?auto_49798 ) ( not ( = ?auto_49801 ?auto_49802 ) ) ( not ( = ?auto_49801 ?auto_49803 ) ) ( not ( = ?auto_49802 ?auto_49803 ) ) ( not ( = ?auto_49804 ?auto_49805 ) ) ( not ( = ?auto_49801 ?auto_49799 ) ) ( not ( = ?auto_49802 ?auto_49799 ) ) ( not ( = ?auto_49803 ?auto_49799 ) ) ( not ( = ?auto_49806 ?auto_49804 ) ) ( not ( = ?auto_49806 ?auto_49805 ) ) ( not ( = ?auto_49801 ?auto_49800 ) ) ( not ( = ?auto_49802 ?auto_49800 ) ) ( not ( = ?auto_49803 ?auto_49800 ) ) ( not ( = ?auto_49799 ?auto_49800 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_49801 ?auto_49802 ?auto_49803 ?auto_49800 ?auto_49799 ?auto_49798 )
      ( DELIVER-5PKG-VERIFY ?auto_49799 ?auto_49800 ?auto_49801 ?auto_49802 ?auto_49803 ?auto_49798 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_49846 - OBJ
      ?auto_49847 - OBJ
      ?auto_49848 - OBJ
      ?auto_49849 - OBJ
      ?auto_49850 - OBJ
      ?auto_49845 - LOCATION
    )
    :vars
    (
      ?auto_49853 - LOCATION
      ?auto_49854 - CITY
      ?auto_49851 - LOCATION
      ?auto_49852 - LOCATION
      ?auto_49855 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_49853 ?auto_49854 ) ( IN-CITY ?auto_49845 ?auto_49854 ) ( not ( = ?auto_49845 ?auto_49853 ) ) ( OBJ-AT ?auto_49847 ?auto_49853 ) ( OBJ-AT ?auto_49846 ?auto_49853 ) ( IN-CITY ?auto_49851 ?auto_49854 ) ( not ( = ?auto_49845 ?auto_49851 ) ) ( OBJ-AT ?auto_49849 ?auto_49851 ) ( IN-CITY ?auto_49852 ?auto_49854 ) ( not ( = ?auto_49845 ?auto_49852 ) ) ( OBJ-AT ?auto_49850 ?auto_49852 ) ( OBJ-AT ?auto_49848 ?auto_49852 ) ( TRUCK-AT ?auto_49855 ?auto_49845 ) ( not ( = ?auto_49848 ?auto_49850 ) ) ( not ( = ?auto_49848 ?auto_49849 ) ) ( not ( = ?auto_49850 ?auto_49849 ) ) ( not ( = ?auto_49851 ?auto_49852 ) ) ( not ( = ?auto_49848 ?auto_49846 ) ) ( not ( = ?auto_49850 ?auto_49846 ) ) ( not ( = ?auto_49849 ?auto_49846 ) ) ( not ( = ?auto_49853 ?auto_49851 ) ) ( not ( = ?auto_49853 ?auto_49852 ) ) ( not ( = ?auto_49848 ?auto_49847 ) ) ( not ( = ?auto_49850 ?auto_49847 ) ) ( not ( = ?auto_49849 ?auto_49847 ) ) ( not ( = ?auto_49846 ?auto_49847 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_49848 ?auto_49850 ?auto_49849 ?auto_49847 ?auto_49846 ?auto_49845 )
      ( DELIVER-5PKG-VERIFY ?auto_49846 ?auto_49847 ?auto_49848 ?auto_49849 ?auto_49850 ?auto_49845 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_50043 - OBJ
      ?auto_50044 - OBJ
      ?auto_50045 - OBJ
      ?auto_50046 - OBJ
      ?auto_50047 - OBJ
      ?auto_50042 - LOCATION
    )
    :vars
    (
      ?auto_50050 - LOCATION
      ?auto_50051 - CITY
      ?auto_50048 - LOCATION
      ?auto_50049 - LOCATION
      ?auto_50052 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_50050 ?auto_50051 ) ( IN-CITY ?auto_50042 ?auto_50051 ) ( not ( = ?auto_50042 ?auto_50050 ) ) ( OBJ-AT ?auto_50044 ?auto_50050 ) ( OBJ-AT ?auto_50043 ?auto_50050 ) ( IN-CITY ?auto_50048 ?auto_50051 ) ( not ( = ?auto_50042 ?auto_50048 ) ) ( OBJ-AT ?auto_50047 ?auto_50048 ) ( IN-CITY ?auto_50049 ?auto_50051 ) ( not ( = ?auto_50042 ?auto_50049 ) ) ( OBJ-AT ?auto_50045 ?auto_50049 ) ( OBJ-AT ?auto_50046 ?auto_50049 ) ( TRUCK-AT ?auto_50052 ?auto_50042 ) ( not ( = ?auto_50046 ?auto_50045 ) ) ( not ( = ?auto_50046 ?auto_50047 ) ) ( not ( = ?auto_50045 ?auto_50047 ) ) ( not ( = ?auto_50048 ?auto_50049 ) ) ( not ( = ?auto_50046 ?auto_50043 ) ) ( not ( = ?auto_50045 ?auto_50043 ) ) ( not ( = ?auto_50047 ?auto_50043 ) ) ( not ( = ?auto_50050 ?auto_50048 ) ) ( not ( = ?auto_50050 ?auto_50049 ) ) ( not ( = ?auto_50046 ?auto_50044 ) ) ( not ( = ?auto_50045 ?auto_50044 ) ) ( not ( = ?auto_50047 ?auto_50044 ) ) ( not ( = ?auto_50043 ?auto_50044 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_50046 ?auto_50045 ?auto_50047 ?auto_50044 ?auto_50043 ?auto_50042 )
      ( DELIVER-5PKG-VERIFY ?auto_50043 ?auto_50044 ?auto_50045 ?auto_50046 ?auto_50047 ?auto_50042 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_50141 - OBJ
      ?auto_50142 - OBJ
      ?auto_50143 - OBJ
      ?auto_50144 - OBJ
      ?auto_50145 - OBJ
      ?auto_50140 - LOCATION
    )
    :vars
    (
      ?auto_50148 - LOCATION
      ?auto_50149 - CITY
      ?auto_50146 - LOCATION
      ?auto_50147 - LOCATION
      ?auto_50150 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_50148 ?auto_50149 ) ( IN-CITY ?auto_50140 ?auto_50149 ) ( not ( = ?auto_50140 ?auto_50148 ) ) ( OBJ-AT ?auto_50142 ?auto_50148 ) ( OBJ-AT ?auto_50141 ?auto_50148 ) ( IN-CITY ?auto_50146 ?auto_50149 ) ( not ( = ?auto_50140 ?auto_50146 ) ) ( OBJ-AT ?auto_50144 ?auto_50146 ) ( IN-CITY ?auto_50147 ?auto_50149 ) ( not ( = ?auto_50140 ?auto_50147 ) ) ( OBJ-AT ?auto_50143 ?auto_50147 ) ( OBJ-AT ?auto_50145 ?auto_50147 ) ( TRUCK-AT ?auto_50150 ?auto_50140 ) ( not ( = ?auto_50145 ?auto_50143 ) ) ( not ( = ?auto_50145 ?auto_50144 ) ) ( not ( = ?auto_50143 ?auto_50144 ) ) ( not ( = ?auto_50146 ?auto_50147 ) ) ( not ( = ?auto_50145 ?auto_50141 ) ) ( not ( = ?auto_50143 ?auto_50141 ) ) ( not ( = ?auto_50144 ?auto_50141 ) ) ( not ( = ?auto_50148 ?auto_50146 ) ) ( not ( = ?auto_50148 ?auto_50147 ) ) ( not ( = ?auto_50145 ?auto_50142 ) ) ( not ( = ?auto_50143 ?auto_50142 ) ) ( not ( = ?auto_50144 ?auto_50142 ) ) ( not ( = ?auto_50141 ?auto_50142 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_50145 ?auto_50143 ?auto_50144 ?auto_50142 ?auto_50141 ?auto_50140 )
      ( DELIVER-5PKG-VERIFY ?auto_50141 ?auto_50142 ?auto_50143 ?auto_50144 ?auto_50145 ?auto_50140 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_50338 - OBJ
      ?auto_50339 - OBJ
      ?auto_50340 - OBJ
      ?auto_50341 - OBJ
      ?auto_50342 - OBJ
      ?auto_50337 - LOCATION
    )
    :vars
    (
      ?auto_50345 - LOCATION
      ?auto_50346 - CITY
      ?auto_50343 - LOCATION
      ?auto_50344 - LOCATION
      ?auto_50347 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_50345 ?auto_50346 ) ( IN-CITY ?auto_50337 ?auto_50346 ) ( not ( = ?auto_50337 ?auto_50345 ) ) ( OBJ-AT ?auto_50339 ?auto_50345 ) ( OBJ-AT ?auto_50338 ?auto_50345 ) ( IN-CITY ?auto_50343 ?auto_50346 ) ( not ( = ?auto_50337 ?auto_50343 ) ) ( OBJ-AT ?auto_50340 ?auto_50343 ) ( IN-CITY ?auto_50344 ?auto_50346 ) ( not ( = ?auto_50337 ?auto_50344 ) ) ( OBJ-AT ?auto_50342 ?auto_50344 ) ( OBJ-AT ?auto_50341 ?auto_50344 ) ( TRUCK-AT ?auto_50347 ?auto_50337 ) ( not ( = ?auto_50341 ?auto_50342 ) ) ( not ( = ?auto_50341 ?auto_50340 ) ) ( not ( = ?auto_50342 ?auto_50340 ) ) ( not ( = ?auto_50343 ?auto_50344 ) ) ( not ( = ?auto_50341 ?auto_50338 ) ) ( not ( = ?auto_50342 ?auto_50338 ) ) ( not ( = ?auto_50340 ?auto_50338 ) ) ( not ( = ?auto_50345 ?auto_50343 ) ) ( not ( = ?auto_50345 ?auto_50344 ) ) ( not ( = ?auto_50341 ?auto_50339 ) ) ( not ( = ?auto_50342 ?auto_50339 ) ) ( not ( = ?auto_50340 ?auto_50339 ) ) ( not ( = ?auto_50338 ?auto_50339 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_50341 ?auto_50342 ?auto_50340 ?auto_50339 ?auto_50338 ?auto_50337 )
      ( DELIVER-5PKG-VERIFY ?auto_50338 ?auto_50339 ?auto_50340 ?auto_50341 ?auto_50342 ?auto_50337 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_50385 - OBJ
      ?auto_50386 - OBJ
      ?auto_50387 - OBJ
      ?auto_50388 - OBJ
      ?auto_50389 - OBJ
      ?auto_50384 - LOCATION
    )
    :vars
    (
      ?auto_50392 - LOCATION
      ?auto_50393 - CITY
      ?auto_50390 - LOCATION
      ?auto_50391 - LOCATION
      ?auto_50394 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_50392 ?auto_50393 ) ( IN-CITY ?auto_50384 ?auto_50393 ) ( not ( = ?auto_50384 ?auto_50392 ) ) ( OBJ-AT ?auto_50386 ?auto_50392 ) ( OBJ-AT ?auto_50385 ?auto_50392 ) ( IN-CITY ?auto_50390 ?auto_50393 ) ( not ( = ?auto_50384 ?auto_50390 ) ) ( OBJ-AT ?auto_50387 ?auto_50390 ) ( IN-CITY ?auto_50391 ?auto_50393 ) ( not ( = ?auto_50384 ?auto_50391 ) ) ( OBJ-AT ?auto_50388 ?auto_50391 ) ( OBJ-AT ?auto_50389 ?auto_50391 ) ( TRUCK-AT ?auto_50394 ?auto_50384 ) ( not ( = ?auto_50389 ?auto_50388 ) ) ( not ( = ?auto_50389 ?auto_50387 ) ) ( not ( = ?auto_50388 ?auto_50387 ) ) ( not ( = ?auto_50390 ?auto_50391 ) ) ( not ( = ?auto_50389 ?auto_50385 ) ) ( not ( = ?auto_50388 ?auto_50385 ) ) ( not ( = ?auto_50387 ?auto_50385 ) ) ( not ( = ?auto_50392 ?auto_50390 ) ) ( not ( = ?auto_50392 ?auto_50391 ) ) ( not ( = ?auto_50389 ?auto_50386 ) ) ( not ( = ?auto_50388 ?auto_50386 ) ) ( not ( = ?auto_50387 ?auto_50386 ) ) ( not ( = ?auto_50385 ?auto_50386 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_50389 ?auto_50388 ?auto_50387 ?auto_50386 ?auto_50385 ?auto_50384 )
      ( DELIVER-5PKG-VERIFY ?auto_50385 ?auto_50386 ?auto_50387 ?auto_50388 ?auto_50389 ?auto_50384 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_51764 - OBJ
      ?auto_51765 - OBJ
      ?auto_51766 - OBJ
      ?auto_51767 - OBJ
      ?auto_51768 - OBJ
      ?auto_51763 - LOCATION
    )
    :vars
    (
      ?auto_51771 - LOCATION
      ?auto_51772 - CITY
      ?auto_51769 - LOCATION
      ?auto_51770 - LOCATION
      ?auto_51773 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_51771 ?auto_51772 ) ( IN-CITY ?auto_51763 ?auto_51772 ) ( not ( = ?auto_51763 ?auto_51771 ) ) ( OBJ-AT ?auto_51764 ?auto_51771 ) ( OBJ-AT ?auto_51768 ?auto_51771 ) ( IN-CITY ?auto_51769 ?auto_51772 ) ( not ( = ?auto_51763 ?auto_51769 ) ) ( OBJ-AT ?auto_51767 ?auto_51769 ) ( IN-CITY ?auto_51770 ?auto_51772 ) ( not ( = ?auto_51763 ?auto_51770 ) ) ( OBJ-AT ?auto_51766 ?auto_51770 ) ( OBJ-AT ?auto_51765 ?auto_51770 ) ( TRUCK-AT ?auto_51773 ?auto_51763 ) ( not ( = ?auto_51765 ?auto_51766 ) ) ( not ( = ?auto_51765 ?auto_51767 ) ) ( not ( = ?auto_51766 ?auto_51767 ) ) ( not ( = ?auto_51769 ?auto_51770 ) ) ( not ( = ?auto_51765 ?auto_51768 ) ) ( not ( = ?auto_51766 ?auto_51768 ) ) ( not ( = ?auto_51767 ?auto_51768 ) ) ( not ( = ?auto_51771 ?auto_51769 ) ) ( not ( = ?auto_51771 ?auto_51770 ) ) ( not ( = ?auto_51765 ?auto_51764 ) ) ( not ( = ?auto_51766 ?auto_51764 ) ) ( not ( = ?auto_51767 ?auto_51764 ) ) ( not ( = ?auto_51768 ?auto_51764 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_51765 ?auto_51766 ?auto_51767 ?auto_51764 ?auto_51768 ?auto_51763 )
      ( DELIVER-5PKG-VERIFY ?auto_51764 ?auto_51765 ?auto_51766 ?auto_51767 ?auto_51768 ?auto_51763 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_51811 - OBJ
      ?auto_51812 - OBJ
      ?auto_51813 - OBJ
      ?auto_51814 - OBJ
      ?auto_51815 - OBJ
      ?auto_51810 - LOCATION
    )
    :vars
    (
      ?auto_51818 - LOCATION
      ?auto_51819 - CITY
      ?auto_51816 - LOCATION
      ?auto_51817 - LOCATION
      ?auto_51820 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_51818 ?auto_51819 ) ( IN-CITY ?auto_51810 ?auto_51819 ) ( not ( = ?auto_51810 ?auto_51818 ) ) ( OBJ-AT ?auto_51811 ?auto_51818 ) ( OBJ-AT ?auto_51814 ?auto_51818 ) ( IN-CITY ?auto_51816 ?auto_51819 ) ( not ( = ?auto_51810 ?auto_51816 ) ) ( OBJ-AT ?auto_51815 ?auto_51816 ) ( IN-CITY ?auto_51817 ?auto_51819 ) ( not ( = ?auto_51810 ?auto_51817 ) ) ( OBJ-AT ?auto_51813 ?auto_51817 ) ( OBJ-AT ?auto_51812 ?auto_51817 ) ( TRUCK-AT ?auto_51820 ?auto_51810 ) ( not ( = ?auto_51812 ?auto_51813 ) ) ( not ( = ?auto_51812 ?auto_51815 ) ) ( not ( = ?auto_51813 ?auto_51815 ) ) ( not ( = ?auto_51816 ?auto_51817 ) ) ( not ( = ?auto_51812 ?auto_51814 ) ) ( not ( = ?auto_51813 ?auto_51814 ) ) ( not ( = ?auto_51815 ?auto_51814 ) ) ( not ( = ?auto_51818 ?auto_51816 ) ) ( not ( = ?auto_51818 ?auto_51817 ) ) ( not ( = ?auto_51812 ?auto_51811 ) ) ( not ( = ?auto_51813 ?auto_51811 ) ) ( not ( = ?auto_51815 ?auto_51811 ) ) ( not ( = ?auto_51814 ?auto_51811 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_51812 ?auto_51813 ?auto_51815 ?auto_51811 ?auto_51814 ?auto_51810 )
      ( DELIVER-5PKG-VERIFY ?auto_51811 ?auto_51812 ?auto_51813 ?auto_51814 ?auto_51815 ?auto_51810 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_52008 - OBJ
      ?auto_52009 - OBJ
      ?auto_52010 - OBJ
      ?auto_52011 - OBJ
      ?auto_52012 - OBJ
      ?auto_52007 - LOCATION
    )
    :vars
    (
      ?auto_52015 - LOCATION
      ?auto_52016 - CITY
      ?auto_52013 - LOCATION
      ?auto_52014 - LOCATION
      ?auto_52017 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_52015 ?auto_52016 ) ( IN-CITY ?auto_52007 ?auto_52016 ) ( not ( = ?auto_52007 ?auto_52015 ) ) ( OBJ-AT ?auto_52008 ?auto_52015 ) ( OBJ-AT ?auto_52012 ?auto_52015 ) ( IN-CITY ?auto_52013 ?auto_52016 ) ( not ( = ?auto_52007 ?auto_52013 ) ) ( OBJ-AT ?auto_52010 ?auto_52013 ) ( IN-CITY ?auto_52014 ?auto_52016 ) ( not ( = ?auto_52007 ?auto_52014 ) ) ( OBJ-AT ?auto_52011 ?auto_52014 ) ( OBJ-AT ?auto_52009 ?auto_52014 ) ( TRUCK-AT ?auto_52017 ?auto_52007 ) ( not ( = ?auto_52009 ?auto_52011 ) ) ( not ( = ?auto_52009 ?auto_52010 ) ) ( not ( = ?auto_52011 ?auto_52010 ) ) ( not ( = ?auto_52013 ?auto_52014 ) ) ( not ( = ?auto_52009 ?auto_52012 ) ) ( not ( = ?auto_52011 ?auto_52012 ) ) ( not ( = ?auto_52010 ?auto_52012 ) ) ( not ( = ?auto_52015 ?auto_52013 ) ) ( not ( = ?auto_52015 ?auto_52014 ) ) ( not ( = ?auto_52009 ?auto_52008 ) ) ( not ( = ?auto_52011 ?auto_52008 ) ) ( not ( = ?auto_52010 ?auto_52008 ) ) ( not ( = ?auto_52012 ?auto_52008 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_52009 ?auto_52011 ?auto_52010 ?auto_52008 ?auto_52012 ?auto_52007 )
      ( DELIVER-5PKG-VERIFY ?auto_52008 ?auto_52009 ?auto_52010 ?auto_52011 ?auto_52012 ?auto_52007 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_52106 - OBJ
      ?auto_52107 - OBJ
      ?auto_52108 - OBJ
      ?auto_52109 - OBJ
      ?auto_52110 - OBJ
      ?auto_52105 - LOCATION
    )
    :vars
    (
      ?auto_52113 - LOCATION
      ?auto_52114 - CITY
      ?auto_52111 - LOCATION
      ?auto_52112 - LOCATION
      ?auto_52115 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_52113 ?auto_52114 ) ( IN-CITY ?auto_52105 ?auto_52114 ) ( not ( = ?auto_52105 ?auto_52113 ) ) ( OBJ-AT ?auto_52106 ?auto_52113 ) ( OBJ-AT ?auto_52109 ?auto_52113 ) ( IN-CITY ?auto_52111 ?auto_52114 ) ( not ( = ?auto_52105 ?auto_52111 ) ) ( OBJ-AT ?auto_52108 ?auto_52111 ) ( IN-CITY ?auto_52112 ?auto_52114 ) ( not ( = ?auto_52105 ?auto_52112 ) ) ( OBJ-AT ?auto_52110 ?auto_52112 ) ( OBJ-AT ?auto_52107 ?auto_52112 ) ( TRUCK-AT ?auto_52115 ?auto_52105 ) ( not ( = ?auto_52107 ?auto_52110 ) ) ( not ( = ?auto_52107 ?auto_52108 ) ) ( not ( = ?auto_52110 ?auto_52108 ) ) ( not ( = ?auto_52111 ?auto_52112 ) ) ( not ( = ?auto_52107 ?auto_52109 ) ) ( not ( = ?auto_52110 ?auto_52109 ) ) ( not ( = ?auto_52108 ?auto_52109 ) ) ( not ( = ?auto_52113 ?auto_52111 ) ) ( not ( = ?auto_52113 ?auto_52112 ) ) ( not ( = ?auto_52107 ?auto_52106 ) ) ( not ( = ?auto_52110 ?auto_52106 ) ) ( not ( = ?auto_52108 ?auto_52106 ) ) ( not ( = ?auto_52109 ?auto_52106 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_52107 ?auto_52110 ?auto_52108 ?auto_52106 ?auto_52109 ?auto_52105 )
      ( DELIVER-5PKG-VERIFY ?auto_52106 ?auto_52107 ?auto_52108 ?auto_52109 ?auto_52110 ?auto_52105 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_52303 - OBJ
      ?auto_52304 - OBJ
      ?auto_52305 - OBJ
      ?auto_52306 - OBJ
      ?auto_52307 - OBJ
      ?auto_52302 - LOCATION
    )
    :vars
    (
      ?auto_52310 - LOCATION
      ?auto_52311 - CITY
      ?auto_52308 - LOCATION
      ?auto_52309 - LOCATION
      ?auto_52312 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_52310 ?auto_52311 ) ( IN-CITY ?auto_52302 ?auto_52311 ) ( not ( = ?auto_52302 ?auto_52310 ) ) ( OBJ-AT ?auto_52303 ?auto_52310 ) ( OBJ-AT ?auto_52305 ?auto_52310 ) ( IN-CITY ?auto_52308 ?auto_52311 ) ( not ( = ?auto_52302 ?auto_52308 ) ) ( OBJ-AT ?auto_52307 ?auto_52308 ) ( IN-CITY ?auto_52309 ?auto_52311 ) ( not ( = ?auto_52302 ?auto_52309 ) ) ( OBJ-AT ?auto_52306 ?auto_52309 ) ( OBJ-AT ?auto_52304 ?auto_52309 ) ( TRUCK-AT ?auto_52312 ?auto_52302 ) ( not ( = ?auto_52304 ?auto_52306 ) ) ( not ( = ?auto_52304 ?auto_52307 ) ) ( not ( = ?auto_52306 ?auto_52307 ) ) ( not ( = ?auto_52308 ?auto_52309 ) ) ( not ( = ?auto_52304 ?auto_52305 ) ) ( not ( = ?auto_52306 ?auto_52305 ) ) ( not ( = ?auto_52307 ?auto_52305 ) ) ( not ( = ?auto_52310 ?auto_52308 ) ) ( not ( = ?auto_52310 ?auto_52309 ) ) ( not ( = ?auto_52304 ?auto_52303 ) ) ( not ( = ?auto_52306 ?auto_52303 ) ) ( not ( = ?auto_52307 ?auto_52303 ) ) ( not ( = ?auto_52305 ?auto_52303 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_52304 ?auto_52306 ?auto_52307 ?auto_52303 ?auto_52305 ?auto_52302 )
      ( DELIVER-5PKG-VERIFY ?auto_52303 ?auto_52304 ?auto_52305 ?auto_52306 ?auto_52307 ?auto_52302 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_52350 - OBJ
      ?auto_52351 - OBJ
      ?auto_52352 - OBJ
      ?auto_52353 - OBJ
      ?auto_52354 - OBJ
      ?auto_52349 - LOCATION
    )
    :vars
    (
      ?auto_52357 - LOCATION
      ?auto_52358 - CITY
      ?auto_52355 - LOCATION
      ?auto_52356 - LOCATION
      ?auto_52359 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_52357 ?auto_52358 ) ( IN-CITY ?auto_52349 ?auto_52358 ) ( not ( = ?auto_52349 ?auto_52357 ) ) ( OBJ-AT ?auto_52350 ?auto_52357 ) ( OBJ-AT ?auto_52352 ?auto_52357 ) ( IN-CITY ?auto_52355 ?auto_52358 ) ( not ( = ?auto_52349 ?auto_52355 ) ) ( OBJ-AT ?auto_52353 ?auto_52355 ) ( IN-CITY ?auto_52356 ?auto_52358 ) ( not ( = ?auto_52349 ?auto_52356 ) ) ( OBJ-AT ?auto_52354 ?auto_52356 ) ( OBJ-AT ?auto_52351 ?auto_52356 ) ( TRUCK-AT ?auto_52359 ?auto_52349 ) ( not ( = ?auto_52351 ?auto_52354 ) ) ( not ( = ?auto_52351 ?auto_52353 ) ) ( not ( = ?auto_52354 ?auto_52353 ) ) ( not ( = ?auto_52355 ?auto_52356 ) ) ( not ( = ?auto_52351 ?auto_52352 ) ) ( not ( = ?auto_52354 ?auto_52352 ) ) ( not ( = ?auto_52353 ?auto_52352 ) ) ( not ( = ?auto_52357 ?auto_52355 ) ) ( not ( = ?auto_52357 ?auto_52356 ) ) ( not ( = ?auto_52351 ?auto_52350 ) ) ( not ( = ?auto_52354 ?auto_52350 ) ) ( not ( = ?auto_52353 ?auto_52350 ) ) ( not ( = ?auto_52352 ?auto_52350 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_52351 ?auto_52354 ?auto_52353 ?auto_52350 ?auto_52352 ?auto_52349 )
      ( DELIVER-5PKG-VERIFY ?auto_52350 ?auto_52351 ?auto_52352 ?auto_52353 ?auto_52354 ?auto_52349 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_53008 - OBJ
      ?auto_53009 - OBJ
      ?auto_53010 - OBJ
      ?auto_53011 - OBJ
      ?auto_53012 - OBJ
      ?auto_53007 - LOCATION
    )
    :vars
    (
      ?auto_53015 - LOCATION
      ?auto_53016 - CITY
      ?auto_53013 - LOCATION
      ?auto_53014 - LOCATION
      ?auto_53017 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_53015 ?auto_53016 ) ( IN-CITY ?auto_53007 ?auto_53016 ) ( not ( = ?auto_53007 ?auto_53015 ) ) ( OBJ-AT ?auto_53008 ?auto_53015 ) ( OBJ-AT ?auto_53012 ?auto_53015 ) ( IN-CITY ?auto_53013 ?auto_53016 ) ( not ( = ?auto_53007 ?auto_53013 ) ) ( OBJ-AT ?auto_53011 ?auto_53013 ) ( IN-CITY ?auto_53014 ?auto_53016 ) ( not ( = ?auto_53007 ?auto_53014 ) ) ( OBJ-AT ?auto_53009 ?auto_53014 ) ( OBJ-AT ?auto_53010 ?auto_53014 ) ( TRUCK-AT ?auto_53017 ?auto_53007 ) ( not ( = ?auto_53010 ?auto_53009 ) ) ( not ( = ?auto_53010 ?auto_53011 ) ) ( not ( = ?auto_53009 ?auto_53011 ) ) ( not ( = ?auto_53013 ?auto_53014 ) ) ( not ( = ?auto_53010 ?auto_53012 ) ) ( not ( = ?auto_53009 ?auto_53012 ) ) ( not ( = ?auto_53011 ?auto_53012 ) ) ( not ( = ?auto_53015 ?auto_53013 ) ) ( not ( = ?auto_53015 ?auto_53014 ) ) ( not ( = ?auto_53010 ?auto_53008 ) ) ( not ( = ?auto_53009 ?auto_53008 ) ) ( not ( = ?auto_53011 ?auto_53008 ) ) ( not ( = ?auto_53012 ?auto_53008 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_53010 ?auto_53009 ?auto_53011 ?auto_53008 ?auto_53012 ?auto_53007 )
      ( DELIVER-5PKG-VERIFY ?auto_53008 ?auto_53009 ?auto_53010 ?auto_53011 ?auto_53012 ?auto_53007 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_53055 - OBJ
      ?auto_53056 - OBJ
      ?auto_53057 - OBJ
      ?auto_53058 - OBJ
      ?auto_53059 - OBJ
      ?auto_53054 - LOCATION
    )
    :vars
    (
      ?auto_53062 - LOCATION
      ?auto_53063 - CITY
      ?auto_53060 - LOCATION
      ?auto_53061 - LOCATION
      ?auto_53064 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_53062 ?auto_53063 ) ( IN-CITY ?auto_53054 ?auto_53063 ) ( not ( = ?auto_53054 ?auto_53062 ) ) ( OBJ-AT ?auto_53055 ?auto_53062 ) ( OBJ-AT ?auto_53058 ?auto_53062 ) ( IN-CITY ?auto_53060 ?auto_53063 ) ( not ( = ?auto_53054 ?auto_53060 ) ) ( OBJ-AT ?auto_53059 ?auto_53060 ) ( IN-CITY ?auto_53061 ?auto_53063 ) ( not ( = ?auto_53054 ?auto_53061 ) ) ( OBJ-AT ?auto_53056 ?auto_53061 ) ( OBJ-AT ?auto_53057 ?auto_53061 ) ( TRUCK-AT ?auto_53064 ?auto_53054 ) ( not ( = ?auto_53057 ?auto_53056 ) ) ( not ( = ?auto_53057 ?auto_53059 ) ) ( not ( = ?auto_53056 ?auto_53059 ) ) ( not ( = ?auto_53060 ?auto_53061 ) ) ( not ( = ?auto_53057 ?auto_53058 ) ) ( not ( = ?auto_53056 ?auto_53058 ) ) ( not ( = ?auto_53059 ?auto_53058 ) ) ( not ( = ?auto_53062 ?auto_53060 ) ) ( not ( = ?auto_53062 ?auto_53061 ) ) ( not ( = ?auto_53057 ?auto_53055 ) ) ( not ( = ?auto_53056 ?auto_53055 ) ) ( not ( = ?auto_53059 ?auto_53055 ) ) ( not ( = ?auto_53058 ?auto_53055 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_53057 ?auto_53056 ?auto_53059 ?auto_53055 ?auto_53058 ?auto_53054 )
      ( DELIVER-5PKG-VERIFY ?auto_53055 ?auto_53056 ?auto_53057 ?auto_53058 ?auto_53059 ?auto_53054 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_53512 - OBJ
      ?auto_53513 - OBJ
      ?auto_53514 - OBJ
      ?auto_53515 - OBJ
      ?auto_53516 - OBJ
      ?auto_53511 - LOCATION
    )
    :vars
    (
      ?auto_53519 - LOCATION
      ?auto_53520 - CITY
      ?auto_53517 - LOCATION
      ?auto_53518 - LOCATION
      ?auto_53521 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_53519 ?auto_53520 ) ( IN-CITY ?auto_53511 ?auto_53520 ) ( not ( = ?auto_53511 ?auto_53519 ) ) ( OBJ-AT ?auto_53512 ?auto_53519 ) ( OBJ-AT ?auto_53516 ?auto_53519 ) ( IN-CITY ?auto_53517 ?auto_53520 ) ( not ( = ?auto_53511 ?auto_53517 ) ) ( OBJ-AT ?auto_53514 ?auto_53517 ) ( IN-CITY ?auto_53518 ?auto_53520 ) ( not ( = ?auto_53511 ?auto_53518 ) ) ( OBJ-AT ?auto_53513 ?auto_53518 ) ( OBJ-AT ?auto_53515 ?auto_53518 ) ( TRUCK-AT ?auto_53521 ?auto_53511 ) ( not ( = ?auto_53515 ?auto_53513 ) ) ( not ( = ?auto_53515 ?auto_53514 ) ) ( not ( = ?auto_53513 ?auto_53514 ) ) ( not ( = ?auto_53517 ?auto_53518 ) ) ( not ( = ?auto_53515 ?auto_53516 ) ) ( not ( = ?auto_53513 ?auto_53516 ) ) ( not ( = ?auto_53514 ?auto_53516 ) ) ( not ( = ?auto_53519 ?auto_53517 ) ) ( not ( = ?auto_53519 ?auto_53518 ) ) ( not ( = ?auto_53515 ?auto_53512 ) ) ( not ( = ?auto_53513 ?auto_53512 ) ) ( not ( = ?auto_53514 ?auto_53512 ) ) ( not ( = ?auto_53516 ?auto_53512 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_53515 ?auto_53513 ?auto_53514 ?auto_53512 ?auto_53516 ?auto_53511 )
      ( DELIVER-5PKG-VERIFY ?auto_53512 ?auto_53513 ?auto_53514 ?auto_53515 ?auto_53516 ?auto_53511 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_53661 - OBJ
      ?auto_53662 - OBJ
      ?auto_53663 - OBJ
      ?auto_53664 - OBJ
      ?auto_53665 - OBJ
      ?auto_53660 - LOCATION
    )
    :vars
    (
      ?auto_53668 - LOCATION
      ?auto_53669 - CITY
      ?auto_53666 - LOCATION
      ?auto_53667 - LOCATION
      ?auto_53670 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_53668 ?auto_53669 ) ( IN-CITY ?auto_53660 ?auto_53669 ) ( not ( = ?auto_53660 ?auto_53668 ) ) ( OBJ-AT ?auto_53661 ?auto_53668 ) ( OBJ-AT ?auto_53664 ?auto_53668 ) ( IN-CITY ?auto_53666 ?auto_53669 ) ( not ( = ?auto_53660 ?auto_53666 ) ) ( OBJ-AT ?auto_53663 ?auto_53666 ) ( IN-CITY ?auto_53667 ?auto_53669 ) ( not ( = ?auto_53660 ?auto_53667 ) ) ( OBJ-AT ?auto_53662 ?auto_53667 ) ( OBJ-AT ?auto_53665 ?auto_53667 ) ( TRUCK-AT ?auto_53670 ?auto_53660 ) ( not ( = ?auto_53665 ?auto_53662 ) ) ( not ( = ?auto_53665 ?auto_53663 ) ) ( not ( = ?auto_53662 ?auto_53663 ) ) ( not ( = ?auto_53666 ?auto_53667 ) ) ( not ( = ?auto_53665 ?auto_53664 ) ) ( not ( = ?auto_53662 ?auto_53664 ) ) ( not ( = ?auto_53663 ?auto_53664 ) ) ( not ( = ?auto_53668 ?auto_53666 ) ) ( not ( = ?auto_53668 ?auto_53667 ) ) ( not ( = ?auto_53665 ?auto_53661 ) ) ( not ( = ?auto_53662 ?auto_53661 ) ) ( not ( = ?auto_53663 ?auto_53661 ) ) ( not ( = ?auto_53664 ?auto_53661 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_53665 ?auto_53662 ?auto_53663 ?auto_53661 ?auto_53664 ?auto_53660 )
      ( DELIVER-5PKG-VERIFY ?auto_53661 ?auto_53662 ?auto_53663 ?auto_53664 ?auto_53665 ?auto_53660 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_53807 - OBJ
      ?auto_53808 - OBJ
      ?auto_53809 - OBJ
      ?auto_53810 - OBJ
      ?auto_53811 - OBJ
      ?auto_53806 - LOCATION
    )
    :vars
    (
      ?auto_53814 - LOCATION
      ?auto_53815 - CITY
      ?auto_53812 - LOCATION
      ?auto_53813 - LOCATION
      ?auto_53816 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_53814 ?auto_53815 ) ( IN-CITY ?auto_53806 ?auto_53815 ) ( not ( = ?auto_53806 ?auto_53814 ) ) ( OBJ-AT ?auto_53807 ?auto_53814 ) ( OBJ-AT ?auto_53809 ?auto_53814 ) ( IN-CITY ?auto_53812 ?auto_53815 ) ( not ( = ?auto_53806 ?auto_53812 ) ) ( OBJ-AT ?auto_53811 ?auto_53812 ) ( IN-CITY ?auto_53813 ?auto_53815 ) ( not ( = ?auto_53806 ?auto_53813 ) ) ( OBJ-AT ?auto_53808 ?auto_53813 ) ( OBJ-AT ?auto_53810 ?auto_53813 ) ( TRUCK-AT ?auto_53816 ?auto_53806 ) ( not ( = ?auto_53810 ?auto_53808 ) ) ( not ( = ?auto_53810 ?auto_53811 ) ) ( not ( = ?auto_53808 ?auto_53811 ) ) ( not ( = ?auto_53812 ?auto_53813 ) ) ( not ( = ?auto_53810 ?auto_53809 ) ) ( not ( = ?auto_53808 ?auto_53809 ) ) ( not ( = ?auto_53811 ?auto_53809 ) ) ( not ( = ?auto_53814 ?auto_53812 ) ) ( not ( = ?auto_53814 ?auto_53813 ) ) ( not ( = ?auto_53810 ?auto_53807 ) ) ( not ( = ?auto_53808 ?auto_53807 ) ) ( not ( = ?auto_53811 ?auto_53807 ) ) ( not ( = ?auto_53809 ?auto_53807 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_53810 ?auto_53808 ?auto_53811 ?auto_53807 ?auto_53809 ?auto_53806 )
      ( DELIVER-5PKG-VERIFY ?auto_53807 ?auto_53808 ?auto_53809 ?auto_53810 ?auto_53811 ?auto_53806 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_53905 - OBJ
      ?auto_53906 - OBJ
      ?auto_53907 - OBJ
      ?auto_53908 - OBJ
      ?auto_53909 - OBJ
      ?auto_53904 - LOCATION
    )
    :vars
    (
      ?auto_53912 - LOCATION
      ?auto_53913 - CITY
      ?auto_53910 - LOCATION
      ?auto_53911 - LOCATION
      ?auto_53914 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_53912 ?auto_53913 ) ( IN-CITY ?auto_53904 ?auto_53913 ) ( not ( = ?auto_53904 ?auto_53912 ) ) ( OBJ-AT ?auto_53905 ?auto_53912 ) ( OBJ-AT ?auto_53907 ?auto_53912 ) ( IN-CITY ?auto_53910 ?auto_53913 ) ( not ( = ?auto_53904 ?auto_53910 ) ) ( OBJ-AT ?auto_53908 ?auto_53910 ) ( IN-CITY ?auto_53911 ?auto_53913 ) ( not ( = ?auto_53904 ?auto_53911 ) ) ( OBJ-AT ?auto_53906 ?auto_53911 ) ( OBJ-AT ?auto_53909 ?auto_53911 ) ( TRUCK-AT ?auto_53914 ?auto_53904 ) ( not ( = ?auto_53909 ?auto_53906 ) ) ( not ( = ?auto_53909 ?auto_53908 ) ) ( not ( = ?auto_53906 ?auto_53908 ) ) ( not ( = ?auto_53910 ?auto_53911 ) ) ( not ( = ?auto_53909 ?auto_53907 ) ) ( not ( = ?auto_53906 ?auto_53907 ) ) ( not ( = ?auto_53908 ?auto_53907 ) ) ( not ( = ?auto_53912 ?auto_53910 ) ) ( not ( = ?auto_53912 ?auto_53911 ) ) ( not ( = ?auto_53909 ?auto_53905 ) ) ( not ( = ?auto_53906 ?auto_53905 ) ) ( not ( = ?auto_53908 ?auto_53905 ) ) ( not ( = ?auto_53907 ?auto_53905 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_53909 ?auto_53906 ?auto_53908 ?auto_53905 ?auto_53907 ?auto_53904 )
      ( DELIVER-5PKG-VERIFY ?auto_53905 ?auto_53906 ?auto_53907 ?auto_53908 ?auto_53909 ?auto_53904 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_54512 - OBJ
      ?auto_54513 - OBJ
      ?auto_54514 - OBJ
      ?auto_54515 - OBJ
      ?auto_54516 - OBJ
      ?auto_54511 - LOCATION
    )
    :vars
    (
      ?auto_54519 - LOCATION
      ?auto_54520 - CITY
      ?auto_54517 - LOCATION
      ?auto_54518 - LOCATION
      ?auto_54521 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_54519 ?auto_54520 ) ( IN-CITY ?auto_54511 ?auto_54520 ) ( not ( = ?auto_54511 ?auto_54519 ) ) ( OBJ-AT ?auto_54512 ?auto_54519 ) ( OBJ-AT ?auto_54516 ?auto_54519 ) ( IN-CITY ?auto_54517 ?auto_54520 ) ( not ( = ?auto_54511 ?auto_54517 ) ) ( OBJ-AT ?auto_54513 ?auto_54517 ) ( IN-CITY ?auto_54518 ?auto_54520 ) ( not ( = ?auto_54511 ?auto_54518 ) ) ( OBJ-AT ?auto_54515 ?auto_54518 ) ( OBJ-AT ?auto_54514 ?auto_54518 ) ( TRUCK-AT ?auto_54521 ?auto_54511 ) ( not ( = ?auto_54514 ?auto_54515 ) ) ( not ( = ?auto_54514 ?auto_54513 ) ) ( not ( = ?auto_54515 ?auto_54513 ) ) ( not ( = ?auto_54517 ?auto_54518 ) ) ( not ( = ?auto_54514 ?auto_54516 ) ) ( not ( = ?auto_54515 ?auto_54516 ) ) ( not ( = ?auto_54513 ?auto_54516 ) ) ( not ( = ?auto_54519 ?auto_54517 ) ) ( not ( = ?auto_54519 ?auto_54518 ) ) ( not ( = ?auto_54514 ?auto_54512 ) ) ( not ( = ?auto_54515 ?auto_54512 ) ) ( not ( = ?auto_54513 ?auto_54512 ) ) ( not ( = ?auto_54516 ?auto_54512 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_54514 ?auto_54515 ?auto_54513 ?auto_54512 ?auto_54516 ?auto_54511 )
      ( DELIVER-5PKG-VERIFY ?auto_54512 ?auto_54513 ?auto_54514 ?auto_54515 ?auto_54516 ?auto_54511 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_54610 - OBJ
      ?auto_54611 - OBJ
      ?auto_54612 - OBJ
      ?auto_54613 - OBJ
      ?auto_54614 - OBJ
      ?auto_54609 - LOCATION
    )
    :vars
    (
      ?auto_54617 - LOCATION
      ?auto_54618 - CITY
      ?auto_54615 - LOCATION
      ?auto_54616 - LOCATION
      ?auto_54619 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_54617 ?auto_54618 ) ( IN-CITY ?auto_54609 ?auto_54618 ) ( not ( = ?auto_54609 ?auto_54617 ) ) ( OBJ-AT ?auto_54610 ?auto_54617 ) ( OBJ-AT ?auto_54613 ?auto_54617 ) ( IN-CITY ?auto_54615 ?auto_54618 ) ( not ( = ?auto_54609 ?auto_54615 ) ) ( OBJ-AT ?auto_54611 ?auto_54615 ) ( IN-CITY ?auto_54616 ?auto_54618 ) ( not ( = ?auto_54609 ?auto_54616 ) ) ( OBJ-AT ?auto_54614 ?auto_54616 ) ( OBJ-AT ?auto_54612 ?auto_54616 ) ( TRUCK-AT ?auto_54619 ?auto_54609 ) ( not ( = ?auto_54612 ?auto_54614 ) ) ( not ( = ?auto_54612 ?auto_54611 ) ) ( not ( = ?auto_54614 ?auto_54611 ) ) ( not ( = ?auto_54615 ?auto_54616 ) ) ( not ( = ?auto_54612 ?auto_54613 ) ) ( not ( = ?auto_54614 ?auto_54613 ) ) ( not ( = ?auto_54611 ?auto_54613 ) ) ( not ( = ?auto_54617 ?auto_54615 ) ) ( not ( = ?auto_54617 ?auto_54616 ) ) ( not ( = ?auto_54612 ?auto_54610 ) ) ( not ( = ?auto_54614 ?auto_54610 ) ) ( not ( = ?auto_54611 ?auto_54610 ) ) ( not ( = ?auto_54613 ?auto_54610 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_54612 ?auto_54614 ?auto_54611 ?auto_54610 ?auto_54613 ?auto_54609 )
      ( DELIVER-5PKG-VERIFY ?auto_54610 ?auto_54611 ?auto_54612 ?auto_54613 ?auto_54614 ?auto_54609 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_54756 - OBJ
      ?auto_54757 - OBJ
      ?auto_54758 - OBJ
      ?auto_54759 - OBJ
      ?auto_54760 - OBJ
      ?auto_54755 - LOCATION
    )
    :vars
    (
      ?auto_54763 - LOCATION
      ?auto_54764 - CITY
      ?auto_54761 - LOCATION
      ?auto_54762 - LOCATION
      ?auto_54765 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_54763 ?auto_54764 ) ( IN-CITY ?auto_54755 ?auto_54764 ) ( not ( = ?auto_54755 ?auto_54763 ) ) ( OBJ-AT ?auto_54756 ?auto_54763 ) ( OBJ-AT ?auto_54760 ?auto_54763 ) ( IN-CITY ?auto_54761 ?auto_54764 ) ( not ( = ?auto_54755 ?auto_54761 ) ) ( OBJ-AT ?auto_54757 ?auto_54761 ) ( IN-CITY ?auto_54762 ?auto_54764 ) ( not ( = ?auto_54755 ?auto_54762 ) ) ( OBJ-AT ?auto_54758 ?auto_54762 ) ( OBJ-AT ?auto_54759 ?auto_54762 ) ( TRUCK-AT ?auto_54765 ?auto_54755 ) ( not ( = ?auto_54759 ?auto_54758 ) ) ( not ( = ?auto_54759 ?auto_54757 ) ) ( not ( = ?auto_54758 ?auto_54757 ) ) ( not ( = ?auto_54761 ?auto_54762 ) ) ( not ( = ?auto_54759 ?auto_54760 ) ) ( not ( = ?auto_54758 ?auto_54760 ) ) ( not ( = ?auto_54757 ?auto_54760 ) ) ( not ( = ?auto_54763 ?auto_54761 ) ) ( not ( = ?auto_54763 ?auto_54762 ) ) ( not ( = ?auto_54759 ?auto_54756 ) ) ( not ( = ?auto_54758 ?auto_54756 ) ) ( not ( = ?auto_54757 ?auto_54756 ) ) ( not ( = ?auto_54760 ?auto_54756 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_54759 ?auto_54758 ?auto_54757 ?auto_54756 ?auto_54760 ?auto_54755 )
      ( DELIVER-5PKG-VERIFY ?auto_54756 ?auto_54757 ?auto_54758 ?auto_54759 ?auto_54760 ?auto_54755 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_54905 - OBJ
      ?auto_54906 - OBJ
      ?auto_54907 - OBJ
      ?auto_54908 - OBJ
      ?auto_54909 - OBJ
      ?auto_54904 - LOCATION
    )
    :vars
    (
      ?auto_54912 - LOCATION
      ?auto_54913 - CITY
      ?auto_54910 - LOCATION
      ?auto_54911 - LOCATION
      ?auto_54914 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_54912 ?auto_54913 ) ( IN-CITY ?auto_54904 ?auto_54913 ) ( not ( = ?auto_54904 ?auto_54912 ) ) ( OBJ-AT ?auto_54905 ?auto_54912 ) ( OBJ-AT ?auto_54908 ?auto_54912 ) ( IN-CITY ?auto_54910 ?auto_54913 ) ( not ( = ?auto_54904 ?auto_54910 ) ) ( OBJ-AT ?auto_54906 ?auto_54910 ) ( IN-CITY ?auto_54911 ?auto_54913 ) ( not ( = ?auto_54904 ?auto_54911 ) ) ( OBJ-AT ?auto_54907 ?auto_54911 ) ( OBJ-AT ?auto_54909 ?auto_54911 ) ( TRUCK-AT ?auto_54914 ?auto_54904 ) ( not ( = ?auto_54909 ?auto_54907 ) ) ( not ( = ?auto_54909 ?auto_54906 ) ) ( not ( = ?auto_54907 ?auto_54906 ) ) ( not ( = ?auto_54910 ?auto_54911 ) ) ( not ( = ?auto_54909 ?auto_54908 ) ) ( not ( = ?auto_54907 ?auto_54908 ) ) ( not ( = ?auto_54906 ?auto_54908 ) ) ( not ( = ?auto_54912 ?auto_54910 ) ) ( not ( = ?auto_54912 ?auto_54911 ) ) ( not ( = ?auto_54909 ?auto_54905 ) ) ( not ( = ?auto_54907 ?auto_54905 ) ) ( not ( = ?auto_54906 ?auto_54905 ) ) ( not ( = ?auto_54908 ?auto_54905 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_54909 ?auto_54907 ?auto_54906 ?auto_54905 ?auto_54908 ?auto_54904 )
      ( DELIVER-5PKG-VERIFY ?auto_54905 ?auto_54906 ?auto_54907 ?auto_54908 ?auto_54909 ?auto_54904 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_55362 - OBJ
      ?auto_55363 - OBJ
      ?auto_55364 - OBJ
      ?auto_55365 - OBJ
      ?auto_55366 - OBJ
      ?auto_55361 - LOCATION
    )
    :vars
    (
      ?auto_55369 - LOCATION
      ?auto_55370 - CITY
      ?auto_55367 - LOCATION
      ?auto_55368 - LOCATION
      ?auto_55371 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_55369 ?auto_55370 ) ( IN-CITY ?auto_55361 ?auto_55370 ) ( not ( = ?auto_55361 ?auto_55369 ) ) ( OBJ-AT ?auto_55362 ?auto_55369 ) ( OBJ-AT ?auto_55364 ?auto_55369 ) ( IN-CITY ?auto_55367 ?auto_55370 ) ( not ( = ?auto_55361 ?auto_55367 ) ) ( OBJ-AT ?auto_55363 ?auto_55367 ) ( IN-CITY ?auto_55368 ?auto_55370 ) ( not ( = ?auto_55361 ?auto_55368 ) ) ( OBJ-AT ?auto_55366 ?auto_55368 ) ( OBJ-AT ?auto_55365 ?auto_55368 ) ( TRUCK-AT ?auto_55371 ?auto_55361 ) ( not ( = ?auto_55365 ?auto_55366 ) ) ( not ( = ?auto_55365 ?auto_55363 ) ) ( not ( = ?auto_55366 ?auto_55363 ) ) ( not ( = ?auto_55367 ?auto_55368 ) ) ( not ( = ?auto_55365 ?auto_55364 ) ) ( not ( = ?auto_55366 ?auto_55364 ) ) ( not ( = ?auto_55363 ?auto_55364 ) ) ( not ( = ?auto_55369 ?auto_55367 ) ) ( not ( = ?auto_55369 ?auto_55368 ) ) ( not ( = ?auto_55365 ?auto_55362 ) ) ( not ( = ?auto_55366 ?auto_55362 ) ) ( not ( = ?auto_55363 ?auto_55362 ) ) ( not ( = ?auto_55364 ?auto_55362 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_55365 ?auto_55366 ?auto_55363 ?auto_55362 ?auto_55364 ?auto_55361 )
      ( DELIVER-5PKG-VERIFY ?auto_55362 ?auto_55363 ?auto_55364 ?auto_55365 ?auto_55366 ?auto_55361 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_55409 - OBJ
      ?auto_55410 - OBJ
      ?auto_55411 - OBJ
      ?auto_55412 - OBJ
      ?auto_55413 - OBJ
      ?auto_55408 - LOCATION
    )
    :vars
    (
      ?auto_55416 - LOCATION
      ?auto_55417 - CITY
      ?auto_55414 - LOCATION
      ?auto_55415 - LOCATION
      ?auto_55418 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_55416 ?auto_55417 ) ( IN-CITY ?auto_55408 ?auto_55417 ) ( not ( = ?auto_55408 ?auto_55416 ) ) ( OBJ-AT ?auto_55409 ?auto_55416 ) ( OBJ-AT ?auto_55411 ?auto_55416 ) ( IN-CITY ?auto_55414 ?auto_55417 ) ( not ( = ?auto_55408 ?auto_55414 ) ) ( OBJ-AT ?auto_55410 ?auto_55414 ) ( IN-CITY ?auto_55415 ?auto_55417 ) ( not ( = ?auto_55408 ?auto_55415 ) ) ( OBJ-AT ?auto_55412 ?auto_55415 ) ( OBJ-AT ?auto_55413 ?auto_55415 ) ( TRUCK-AT ?auto_55418 ?auto_55408 ) ( not ( = ?auto_55413 ?auto_55412 ) ) ( not ( = ?auto_55413 ?auto_55410 ) ) ( not ( = ?auto_55412 ?auto_55410 ) ) ( not ( = ?auto_55414 ?auto_55415 ) ) ( not ( = ?auto_55413 ?auto_55411 ) ) ( not ( = ?auto_55412 ?auto_55411 ) ) ( not ( = ?auto_55410 ?auto_55411 ) ) ( not ( = ?auto_55416 ?auto_55414 ) ) ( not ( = ?auto_55416 ?auto_55415 ) ) ( not ( = ?auto_55413 ?auto_55409 ) ) ( not ( = ?auto_55412 ?auto_55409 ) ) ( not ( = ?auto_55410 ?auto_55409 ) ) ( not ( = ?auto_55411 ?auto_55409 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_55413 ?auto_55412 ?auto_55410 ?auto_55409 ?auto_55411 ?auto_55408 )
      ( DELIVER-5PKG-VERIFY ?auto_55409 ?auto_55410 ?auto_55411 ?auto_55412 ?auto_55413 ?auto_55408 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_56067 - OBJ
      ?auto_56068 - OBJ
      ?auto_56069 - OBJ
      ?auto_56070 - OBJ
      ?auto_56071 - OBJ
      ?auto_56066 - LOCATION
    )
    :vars
    (
      ?auto_56074 - LOCATION
      ?auto_56075 - CITY
      ?auto_56072 - LOCATION
      ?auto_56073 - LOCATION
      ?auto_56076 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_56074 ?auto_56075 ) ( IN-CITY ?auto_56066 ?auto_56075 ) ( not ( = ?auto_56066 ?auto_56074 ) ) ( OBJ-AT ?auto_56067 ?auto_56074 ) ( OBJ-AT ?auto_56068 ?auto_56074 ) ( IN-CITY ?auto_56072 ?auto_56075 ) ( not ( = ?auto_56066 ?auto_56072 ) ) ( OBJ-AT ?auto_56071 ?auto_56072 ) ( IN-CITY ?auto_56073 ?auto_56075 ) ( not ( = ?auto_56066 ?auto_56073 ) ) ( OBJ-AT ?auto_56070 ?auto_56073 ) ( OBJ-AT ?auto_56069 ?auto_56073 ) ( TRUCK-AT ?auto_56076 ?auto_56066 ) ( not ( = ?auto_56069 ?auto_56070 ) ) ( not ( = ?auto_56069 ?auto_56071 ) ) ( not ( = ?auto_56070 ?auto_56071 ) ) ( not ( = ?auto_56072 ?auto_56073 ) ) ( not ( = ?auto_56069 ?auto_56068 ) ) ( not ( = ?auto_56070 ?auto_56068 ) ) ( not ( = ?auto_56071 ?auto_56068 ) ) ( not ( = ?auto_56074 ?auto_56072 ) ) ( not ( = ?auto_56074 ?auto_56073 ) ) ( not ( = ?auto_56069 ?auto_56067 ) ) ( not ( = ?auto_56070 ?auto_56067 ) ) ( not ( = ?auto_56071 ?auto_56067 ) ) ( not ( = ?auto_56068 ?auto_56067 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_56069 ?auto_56070 ?auto_56071 ?auto_56067 ?auto_56068 ?auto_56066 )
      ( DELIVER-5PKG-VERIFY ?auto_56067 ?auto_56068 ?auto_56069 ?auto_56070 ?auto_56071 ?auto_56066 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_56114 - OBJ
      ?auto_56115 - OBJ
      ?auto_56116 - OBJ
      ?auto_56117 - OBJ
      ?auto_56118 - OBJ
      ?auto_56113 - LOCATION
    )
    :vars
    (
      ?auto_56121 - LOCATION
      ?auto_56122 - CITY
      ?auto_56119 - LOCATION
      ?auto_56120 - LOCATION
      ?auto_56123 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_56121 ?auto_56122 ) ( IN-CITY ?auto_56113 ?auto_56122 ) ( not ( = ?auto_56113 ?auto_56121 ) ) ( OBJ-AT ?auto_56114 ?auto_56121 ) ( OBJ-AT ?auto_56115 ?auto_56121 ) ( IN-CITY ?auto_56119 ?auto_56122 ) ( not ( = ?auto_56113 ?auto_56119 ) ) ( OBJ-AT ?auto_56117 ?auto_56119 ) ( IN-CITY ?auto_56120 ?auto_56122 ) ( not ( = ?auto_56113 ?auto_56120 ) ) ( OBJ-AT ?auto_56118 ?auto_56120 ) ( OBJ-AT ?auto_56116 ?auto_56120 ) ( TRUCK-AT ?auto_56123 ?auto_56113 ) ( not ( = ?auto_56116 ?auto_56118 ) ) ( not ( = ?auto_56116 ?auto_56117 ) ) ( not ( = ?auto_56118 ?auto_56117 ) ) ( not ( = ?auto_56119 ?auto_56120 ) ) ( not ( = ?auto_56116 ?auto_56115 ) ) ( not ( = ?auto_56118 ?auto_56115 ) ) ( not ( = ?auto_56117 ?auto_56115 ) ) ( not ( = ?auto_56121 ?auto_56119 ) ) ( not ( = ?auto_56121 ?auto_56120 ) ) ( not ( = ?auto_56116 ?auto_56114 ) ) ( not ( = ?auto_56118 ?auto_56114 ) ) ( not ( = ?auto_56117 ?auto_56114 ) ) ( not ( = ?auto_56115 ?auto_56114 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_56116 ?auto_56118 ?auto_56117 ?auto_56114 ?auto_56115 ?auto_56113 )
      ( DELIVER-5PKG-VERIFY ?auto_56114 ?auto_56115 ?auto_56116 ?auto_56117 ?auto_56118 ?auto_56113 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_56311 - OBJ
      ?auto_56312 - OBJ
      ?auto_56313 - OBJ
      ?auto_56314 - OBJ
      ?auto_56315 - OBJ
      ?auto_56310 - LOCATION
    )
    :vars
    (
      ?auto_56318 - LOCATION
      ?auto_56319 - CITY
      ?auto_56316 - LOCATION
      ?auto_56317 - LOCATION
      ?auto_56320 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_56318 ?auto_56319 ) ( IN-CITY ?auto_56310 ?auto_56319 ) ( not ( = ?auto_56310 ?auto_56318 ) ) ( OBJ-AT ?auto_56311 ?auto_56318 ) ( OBJ-AT ?auto_56312 ?auto_56318 ) ( IN-CITY ?auto_56316 ?auto_56319 ) ( not ( = ?auto_56310 ?auto_56316 ) ) ( OBJ-AT ?auto_56315 ?auto_56316 ) ( IN-CITY ?auto_56317 ?auto_56319 ) ( not ( = ?auto_56310 ?auto_56317 ) ) ( OBJ-AT ?auto_56313 ?auto_56317 ) ( OBJ-AT ?auto_56314 ?auto_56317 ) ( TRUCK-AT ?auto_56320 ?auto_56310 ) ( not ( = ?auto_56314 ?auto_56313 ) ) ( not ( = ?auto_56314 ?auto_56315 ) ) ( not ( = ?auto_56313 ?auto_56315 ) ) ( not ( = ?auto_56316 ?auto_56317 ) ) ( not ( = ?auto_56314 ?auto_56312 ) ) ( not ( = ?auto_56313 ?auto_56312 ) ) ( not ( = ?auto_56315 ?auto_56312 ) ) ( not ( = ?auto_56318 ?auto_56316 ) ) ( not ( = ?auto_56318 ?auto_56317 ) ) ( not ( = ?auto_56314 ?auto_56311 ) ) ( not ( = ?auto_56313 ?auto_56311 ) ) ( not ( = ?auto_56315 ?auto_56311 ) ) ( not ( = ?auto_56312 ?auto_56311 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_56314 ?auto_56313 ?auto_56315 ?auto_56311 ?auto_56312 ?auto_56310 )
      ( DELIVER-5PKG-VERIFY ?auto_56311 ?auto_56312 ?auto_56313 ?auto_56314 ?auto_56315 ?auto_56310 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_56409 - OBJ
      ?auto_56410 - OBJ
      ?auto_56411 - OBJ
      ?auto_56412 - OBJ
      ?auto_56413 - OBJ
      ?auto_56408 - LOCATION
    )
    :vars
    (
      ?auto_56416 - LOCATION
      ?auto_56417 - CITY
      ?auto_56414 - LOCATION
      ?auto_56415 - LOCATION
      ?auto_56418 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_56416 ?auto_56417 ) ( IN-CITY ?auto_56408 ?auto_56417 ) ( not ( = ?auto_56408 ?auto_56416 ) ) ( OBJ-AT ?auto_56409 ?auto_56416 ) ( OBJ-AT ?auto_56410 ?auto_56416 ) ( IN-CITY ?auto_56414 ?auto_56417 ) ( not ( = ?auto_56408 ?auto_56414 ) ) ( OBJ-AT ?auto_56412 ?auto_56414 ) ( IN-CITY ?auto_56415 ?auto_56417 ) ( not ( = ?auto_56408 ?auto_56415 ) ) ( OBJ-AT ?auto_56411 ?auto_56415 ) ( OBJ-AT ?auto_56413 ?auto_56415 ) ( TRUCK-AT ?auto_56418 ?auto_56408 ) ( not ( = ?auto_56413 ?auto_56411 ) ) ( not ( = ?auto_56413 ?auto_56412 ) ) ( not ( = ?auto_56411 ?auto_56412 ) ) ( not ( = ?auto_56414 ?auto_56415 ) ) ( not ( = ?auto_56413 ?auto_56410 ) ) ( not ( = ?auto_56411 ?auto_56410 ) ) ( not ( = ?auto_56412 ?auto_56410 ) ) ( not ( = ?auto_56416 ?auto_56414 ) ) ( not ( = ?auto_56416 ?auto_56415 ) ) ( not ( = ?auto_56413 ?auto_56409 ) ) ( not ( = ?auto_56411 ?auto_56409 ) ) ( not ( = ?auto_56412 ?auto_56409 ) ) ( not ( = ?auto_56410 ?auto_56409 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_56413 ?auto_56411 ?auto_56412 ?auto_56409 ?auto_56410 ?auto_56408 )
      ( DELIVER-5PKG-VERIFY ?auto_56409 ?auto_56410 ?auto_56411 ?auto_56412 ?auto_56413 ?auto_56408 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_56606 - OBJ
      ?auto_56607 - OBJ
      ?auto_56608 - OBJ
      ?auto_56609 - OBJ
      ?auto_56610 - OBJ
      ?auto_56605 - LOCATION
    )
    :vars
    (
      ?auto_56613 - LOCATION
      ?auto_56614 - CITY
      ?auto_56611 - LOCATION
      ?auto_56612 - LOCATION
      ?auto_56615 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_56613 ?auto_56614 ) ( IN-CITY ?auto_56605 ?auto_56614 ) ( not ( = ?auto_56605 ?auto_56613 ) ) ( OBJ-AT ?auto_56606 ?auto_56613 ) ( OBJ-AT ?auto_56607 ?auto_56613 ) ( IN-CITY ?auto_56611 ?auto_56614 ) ( not ( = ?auto_56605 ?auto_56611 ) ) ( OBJ-AT ?auto_56608 ?auto_56611 ) ( IN-CITY ?auto_56612 ?auto_56614 ) ( not ( = ?auto_56605 ?auto_56612 ) ) ( OBJ-AT ?auto_56610 ?auto_56612 ) ( OBJ-AT ?auto_56609 ?auto_56612 ) ( TRUCK-AT ?auto_56615 ?auto_56605 ) ( not ( = ?auto_56609 ?auto_56610 ) ) ( not ( = ?auto_56609 ?auto_56608 ) ) ( not ( = ?auto_56610 ?auto_56608 ) ) ( not ( = ?auto_56611 ?auto_56612 ) ) ( not ( = ?auto_56609 ?auto_56607 ) ) ( not ( = ?auto_56610 ?auto_56607 ) ) ( not ( = ?auto_56608 ?auto_56607 ) ) ( not ( = ?auto_56613 ?auto_56611 ) ) ( not ( = ?auto_56613 ?auto_56612 ) ) ( not ( = ?auto_56609 ?auto_56606 ) ) ( not ( = ?auto_56610 ?auto_56606 ) ) ( not ( = ?auto_56608 ?auto_56606 ) ) ( not ( = ?auto_56607 ?auto_56606 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_56609 ?auto_56610 ?auto_56608 ?auto_56606 ?auto_56607 ?auto_56605 )
      ( DELIVER-5PKG-VERIFY ?auto_56606 ?auto_56607 ?auto_56608 ?auto_56609 ?auto_56610 ?auto_56605 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_56653 - OBJ
      ?auto_56654 - OBJ
      ?auto_56655 - OBJ
      ?auto_56656 - OBJ
      ?auto_56657 - OBJ
      ?auto_56652 - LOCATION
    )
    :vars
    (
      ?auto_56660 - LOCATION
      ?auto_56661 - CITY
      ?auto_56658 - LOCATION
      ?auto_56659 - LOCATION
      ?auto_56662 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_56660 ?auto_56661 ) ( IN-CITY ?auto_56652 ?auto_56661 ) ( not ( = ?auto_56652 ?auto_56660 ) ) ( OBJ-AT ?auto_56653 ?auto_56660 ) ( OBJ-AT ?auto_56654 ?auto_56660 ) ( IN-CITY ?auto_56658 ?auto_56661 ) ( not ( = ?auto_56652 ?auto_56658 ) ) ( OBJ-AT ?auto_56655 ?auto_56658 ) ( IN-CITY ?auto_56659 ?auto_56661 ) ( not ( = ?auto_56652 ?auto_56659 ) ) ( OBJ-AT ?auto_56656 ?auto_56659 ) ( OBJ-AT ?auto_56657 ?auto_56659 ) ( TRUCK-AT ?auto_56662 ?auto_56652 ) ( not ( = ?auto_56657 ?auto_56656 ) ) ( not ( = ?auto_56657 ?auto_56655 ) ) ( not ( = ?auto_56656 ?auto_56655 ) ) ( not ( = ?auto_56658 ?auto_56659 ) ) ( not ( = ?auto_56657 ?auto_56654 ) ) ( not ( = ?auto_56656 ?auto_56654 ) ) ( not ( = ?auto_56655 ?auto_56654 ) ) ( not ( = ?auto_56660 ?auto_56658 ) ) ( not ( = ?auto_56660 ?auto_56659 ) ) ( not ( = ?auto_56657 ?auto_56653 ) ) ( not ( = ?auto_56656 ?auto_56653 ) ) ( not ( = ?auto_56655 ?auto_56653 ) ) ( not ( = ?auto_56654 ?auto_56653 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_56657 ?auto_56656 ?auto_56655 ?auto_56653 ?auto_56654 ?auto_56652 )
      ( DELIVER-5PKG-VERIFY ?auto_56653 ?auto_56654 ?auto_56655 ?auto_56656 ?auto_56657 ?auto_56652 ) )
  )

)

