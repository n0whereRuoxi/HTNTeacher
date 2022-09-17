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

  ( :method DELIVER-6PKG-VERIFY
    :parameters
    (
      ?obj1 - OBJ
      ?obj2 - OBJ
      ?obj3 - OBJ
      ?obj4 - OBJ
      ?obj5 - OBJ
      ?obj6 - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj1 ?dst ) ( OBJ-AT ?obj2 ?dst ) ( OBJ-AT ?obj3 ?dst ) ( OBJ-AT ?obj4 ?dst ) ( OBJ-AT ?obj5 ?dst ) ( OBJ-AT ?obj6 ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-7PKG-VERIFY
    :parameters
    (
      ?obj1 - OBJ
      ?obj2 - OBJ
      ?obj3 - OBJ
      ?obj4 - OBJ
      ?obj5 - OBJ
      ?obj6 - OBJ
      ?obj7 - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj1 ?dst ) ( OBJ-AT ?obj2 ?dst ) ( OBJ-AT ?obj3 ?dst ) ( OBJ-AT ?obj4 ?dst ) ( OBJ-AT ?obj5 ?dst ) ( OBJ-AT ?obj6 ?dst ) ( OBJ-AT ?obj7 ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_3372 - OBJ
      ?auto_3373 - LOCATION
    )
    :vars
    (
      ?auto_3374 - TRUCK
      ?auto_3375 - LOCATION
      ?auto_3376 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_3374 ?auto_3375 ) ( IN-CITY ?auto_3375 ?auto_3376 ) ( IN-CITY ?auto_3373 ?auto_3376 ) ( not ( = ?auto_3373 ?auto_3375 ) ) ( OBJ-AT ?auto_3372 ?auto_3375 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_3372 ?auto_3374 ?auto_3375 )
      ( !DRIVE-TRUCK ?auto_3374 ?auto_3375 ?auto_3373 ?auto_3376 )
      ( !UNLOAD-TRUCK ?auto_3372 ?auto_3374 ?auto_3373 )
      ( DELIVER-1PKG-VERIFY ?auto_3372 ?auto_3373 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_3379 - OBJ
      ?auto_3380 - LOCATION
    )
    :vars
    (
      ?auto_3382 - LOCATION
      ?auto_3383 - CITY
      ?auto_3381 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3382 ?auto_3383 ) ( IN-CITY ?auto_3380 ?auto_3383 ) ( not ( = ?auto_3380 ?auto_3382 ) ) ( OBJ-AT ?auto_3379 ?auto_3382 ) ( TRUCK-AT ?auto_3381 ?auto_3380 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_3381 ?auto_3380 ?auto_3382 ?auto_3383 )
      ( DELIVER-1PKG ?auto_3379 ?auto_3380 )
      ( DELIVER-1PKG-VERIFY ?auto_3379 ?auto_3380 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_3401 - OBJ
      ?auto_3403 - OBJ
      ?auto_3402 - LOCATION
    )
    :vars
    (
      ?auto_3404 - LOCATION
      ?auto_3405 - CITY
      ?auto_3406 - TRUCK
      ?auto_3407 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3403 ?auto_3401 ) ( IN-CITY ?auto_3404 ?auto_3405 ) ( IN-CITY ?auto_3402 ?auto_3405 ) ( not ( = ?auto_3402 ?auto_3404 ) ) ( OBJ-AT ?auto_3403 ?auto_3404 ) ( TRUCK-AT ?auto_3406 ?auto_3407 ) ( IN-CITY ?auto_3407 ?auto_3405 ) ( not ( = ?auto_3402 ?auto_3407 ) ) ( OBJ-AT ?auto_3401 ?auto_3407 ) ( not ( = ?auto_3401 ?auto_3403 ) ) ( not ( = ?auto_3404 ?auto_3407 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_3401 ?auto_3402 )
      ( DELIVER-1PKG ?auto_3403 ?auto_3402 )
      ( DELIVER-2PKG-VERIFY ?auto_3401 ?auto_3403 ?auto_3402 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_3411 - OBJ
      ?auto_3413 - OBJ
      ?auto_3412 - LOCATION
    )
    :vars
    (
      ?auto_3415 - LOCATION
      ?auto_3416 - CITY
      ?auto_3414 - LOCATION
      ?auto_3417 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3413 ?auto_3411 ) ( IN-CITY ?auto_3415 ?auto_3416 ) ( IN-CITY ?auto_3412 ?auto_3416 ) ( not ( = ?auto_3412 ?auto_3415 ) ) ( OBJ-AT ?auto_3413 ?auto_3415 ) ( IN-CITY ?auto_3414 ?auto_3416 ) ( not ( = ?auto_3412 ?auto_3414 ) ) ( OBJ-AT ?auto_3411 ?auto_3414 ) ( not ( = ?auto_3411 ?auto_3413 ) ) ( not ( = ?auto_3415 ?auto_3414 ) ) ( TRUCK-AT ?auto_3417 ?auto_3412 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_3417 ?auto_3412 ?auto_3414 ?auto_3416 )
      ( DELIVER-2PKG ?auto_3411 ?auto_3413 ?auto_3412 )
      ( DELIVER-2PKG-VERIFY ?auto_3411 ?auto_3413 ?auto_3412 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3437 - OBJ
      ?auto_3439 - OBJ
      ?auto_3436 - OBJ
      ?auto_3438 - LOCATION
    )
    :vars
    (
      ?auto_3441 - LOCATION
      ?auto_3440 - CITY
      ?auto_3444 - LOCATION
      ?auto_3442 - TRUCK
      ?auto_3443 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3439 ?auto_3437 ) ( GREATER-THAN ?auto_3436 ?auto_3437 ) ( GREATER-THAN ?auto_3436 ?auto_3439 ) ( IN-CITY ?auto_3441 ?auto_3440 ) ( IN-CITY ?auto_3438 ?auto_3440 ) ( not ( = ?auto_3438 ?auto_3441 ) ) ( OBJ-AT ?auto_3436 ?auto_3441 ) ( IN-CITY ?auto_3444 ?auto_3440 ) ( not ( = ?auto_3438 ?auto_3444 ) ) ( OBJ-AT ?auto_3439 ?auto_3444 ) ( TRUCK-AT ?auto_3442 ?auto_3443 ) ( IN-CITY ?auto_3443 ?auto_3440 ) ( not ( = ?auto_3438 ?auto_3443 ) ) ( OBJ-AT ?auto_3437 ?auto_3443 ) ( not ( = ?auto_3437 ?auto_3439 ) ) ( not ( = ?auto_3444 ?auto_3443 ) ) ( not ( = ?auto_3437 ?auto_3436 ) ) ( not ( = ?auto_3439 ?auto_3436 ) ) ( not ( = ?auto_3441 ?auto_3444 ) ) ( not ( = ?auto_3441 ?auto_3443 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3437 ?auto_3439 ?auto_3438 )
      ( DELIVER-1PKG ?auto_3436 ?auto_3438 )
      ( DELIVER-3PKG-VERIFY ?auto_3437 ?auto_3439 ?auto_3436 ?auto_3438 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3450 - OBJ
      ?auto_3452 - OBJ
      ?auto_3449 - OBJ
      ?auto_3451 - LOCATION
    )
    :vars
    (
      ?auto_3457 - LOCATION
      ?auto_3454 - CITY
      ?auto_3456 - LOCATION
      ?auto_3455 - LOCATION
      ?auto_3453 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3452 ?auto_3450 ) ( GREATER-THAN ?auto_3449 ?auto_3450 ) ( GREATER-THAN ?auto_3449 ?auto_3452 ) ( IN-CITY ?auto_3457 ?auto_3454 ) ( IN-CITY ?auto_3451 ?auto_3454 ) ( not ( = ?auto_3451 ?auto_3457 ) ) ( OBJ-AT ?auto_3449 ?auto_3457 ) ( IN-CITY ?auto_3456 ?auto_3454 ) ( not ( = ?auto_3451 ?auto_3456 ) ) ( OBJ-AT ?auto_3452 ?auto_3456 ) ( IN-CITY ?auto_3455 ?auto_3454 ) ( not ( = ?auto_3451 ?auto_3455 ) ) ( OBJ-AT ?auto_3450 ?auto_3455 ) ( not ( = ?auto_3450 ?auto_3452 ) ) ( not ( = ?auto_3456 ?auto_3455 ) ) ( not ( = ?auto_3450 ?auto_3449 ) ) ( not ( = ?auto_3452 ?auto_3449 ) ) ( not ( = ?auto_3457 ?auto_3456 ) ) ( not ( = ?auto_3457 ?auto_3455 ) ) ( TRUCK-AT ?auto_3453 ?auto_3451 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_3453 ?auto_3451 ?auto_3455 ?auto_3454 )
      ( DELIVER-3PKG ?auto_3450 ?auto_3452 ?auto_3449 ?auto_3451 )
      ( DELIVER-3PKG-VERIFY ?auto_3450 ?auto_3452 ?auto_3449 ?auto_3451 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_3478 - OBJ
      ?auto_3480 - OBJ
      ?auto_3477 - OBJ
      ?auto_3481 - OBJ
      ?auto_3479 - LOCATION
    )
    :vars
    (
      ?auto_3482 - LOCATION
      ?auto_3484 - CITY
      ?auto_3486 - LOCATION
      ?auto_3485 - LOCATION
      ?auto_3483 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3480 ?auto_3478 ) ( GREATER-THAN ?auto_3477 ?auto_3478 ) ( GREATER-THAN ?auto_3477 ?auto_3480 ) ( GREATER-THAN ?auto_3481 ?auto_3478 ) ( GREATER-THAN ?auto_3481 ?auto_3480 ) ( GREATER-THAN ?auto_3481 ?auto_3477 ) ( IN-CITY ?auto_3482 ?auto_3484 ) ( IN-CITY ?auto_3479 ?auto_3484 ) ( not ( = ?auto_3479 ?auto_3482 ) ) ( OBJ-AT ?auto_3481 ?auto_3482 ) ( IN-CITY ?auto_3486 ?auto_3484 ) ( not ( = ?auto_3479 ?auto_3486 ) ) ( OBJ-AT ?auto_3477 ?auto_3486 ) ( IN-CITY ?auto_3485 ?auto_3484 ) ( not ( = ?auto_3479 ?auto_3485 ) ) ( OBJ-AT ?auto_3480 ?auto_3485 ) ( TRUCK-AT ?auto_3483 ?auto_3482 ) ( OBJ-AT ?auto_3478 ?auto_3482 ) ( not ( = ?auto_3478 ?auto_3480 ) ) ( not ( = ?auto_3485 ?auto_3482 ) ) ( not ( = ?auto_3478 ?auto_3477 ) ) ( not ( = ?auto_3480 ?auto_3477 ) ) ( not ( = ?auto_3486 ?auto_3485 ) ) ( not ( = ?auto_3486 ?auto_3482 ) ) ( not ( = ?auto_3478 ?auto_3481 ) ) ( not ( = ?auto_3480 ?auto_3481 ) ) ( not ( = ?auto_3477 ?auto_3481 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_3478 ?auto_3480 ?auto_3477 ?auto_3479 )
      ( DELIVER-1PKG ?auto_3481 ?auto_3479 )
      ( DELIVER-4PKG-VERIFY ?auto_3478 ?auto_3480 ?auto_3477 ?auto_3481 ?auto_3479 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_3493 - OBJ
      ?auto_3495 - OBJ
      ?auto_3492 - OBJ
      ?auto_3496 - OBJ
      ?auto_3494 - LOCATION
    )
    :vars
    (
      ?auto_3500 - LOCATION
      ?auto_3497 - CITY
      ?auto_3499 - LOCATION
      ?auto_3501 - LOCATION
      ?auto_3498 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3495 ?auto_3493 ) ( GREATER-THAN ?auto_3492 ?auto_3493 ) ( GREATER-THAN ?auto_3492 ?auto_3495 ) ( GREATER-THAN ?auto_3496 ?auto_3493 ) ( GREATER-THAN ?auto_3496 ?auto_3495 ) ( GREATER-THAN ?auto_3496 ?auto_3492 ) ( IN-CITY ?auto_3500 ?auto_3497 ) ( IN-CITY ?auto_3494 ?auto_3497 ) ( not ( = ?auto_3494 ?auto_3500 ) ) ( OBJ-AT ?auto_3496 ?auto_3500 ) ( IN-CITY ?auto_3499 ?auto_3497 ) ( not ( = ?auto_3494 ?auto_3499 ) ) ( OBJ-AT ?auto_3492 ?auto_3499 ) ( IN-CITY ?auto_3501 ?auto_3497 ) ( not ( = ?auto_3494 ?auto_3501 ) ) ( OBJ-AT ?auto_3495 ?auto_3501 ) ( OBJ-AT ?auto_3493 ?auto_3500 ) ( not ( = ?auto_3493 ?auto_3495 ) ) ( not ( = ?auto_3501 ?auto_3500 ) ) ( not ( = ?auto_3493 ?auto_3492 ) ) ( not ( = ?auto_3495 ?auto_3492 ) ) ( not ( = ?auto_3499 ?auto_3501 ) ) ( not ( = ?auto_3499 ?auto_3500 ) ) ( not ( = ?auto_3493 ?auto_3496 ) ) ( not ( = ?auto_3495 ?auto_3496 ) ) ( not ( = ?auto_3492 ?auto_3496 ) ) ( TRUCK-AT ?auto_3498 ?auto_3494 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_3498 ?auto_3494 ?auto_3500 ?auto_3497 )
      ( DELIVER-4PKG ?auto_3493 ?auto_3495 ?auto_3492 ?auto_3496 ?auto_3494 )
      ( DELIVER-4PKG-VERIFY ?auto_3493 ?auto_3495 ?auto_3492 ?auto_3496 ?auto_3494 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_3523 - OBJ
      ?auto_3525 - OBJ
      ?auto_3522 - OBJ
      ?auto_3526 - OBJ
      ?auto_3527 - OBJ
      ?auto_3524 - LOCATION
    )
    :vars
    (
      ?auto_3529 - LOCATION
      ?auto_3528 - CITY
      ?auto_3531 - LOCATION
      ?auto_3532 - LOCATION
      ?auto_3530 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3525 ?auto_3523 ) ( GREATER-THAN ?auto_3522 ?auto_3523 ) ( GREATER-THAN ?auto_3522 ?auto_3525 ) ( GREATER-THAN ?auto_3526 ?auto_3523 ) ( GREATER-THAN ?auto_3526 ?auto_3525 ) ( GREATER-THAN ?auto_3526 ?auto_3522 ) ( GREATER-THAN ?auto_3527 ?auto_3523 ) ( GREATER-THAN ?auto_3527 ?auto_3525 ) ( GREATER-THAN ?auto_3527 ?auto_3522 ) ( GREATER-THAN ?auto_3527 ?auto_3526 ) ( IN-CITY ?auto_3529 ?auto_3528 ) ( IN-CITY ?auto_3524 ?auto_3528 ) ( not ( = ?auto_3524 ?auto_3529 ) ) ( OBJ-AT ?auto_3527 ?auto_3529 ) ( OBJ-AT ?auto_3526 ?auto_3529 ) ( IN-CITY ?auto_3531 ?auto_3528 ) ( not ( = ?auto_3524 ?auto_3531 ) ) ( OBJ-AT ?auto_3522 ?auto_3531 ) ( IN-CITY ?auto_3532 ?auto_3528 ) ( not ( = ?auto_3524 ?auto_3532 ) ) ( OBJ-AT ?auto_3525 ?auto_3532 ) ( TRUCK-AT ?auto_3530 ?auto_3529 ) ( OBJ-AT ?auto_3523 ?auto_3529 ) ( not ( = ?auto_3523 ?auto_3525 ) ) ( not ( = ?auto_3532 ?auto_3529 ) ) ( not ( = ?auto_3523 ?auto_3522 ) ) ( not ( = ?auto_3525 ?auto_3522 ) ) ( not ( = ?auto_3531 ?auto_3532 ) ) ( not ( = ?auto_3531 ?auto_3529 ) ) ( not ( = ?auto_3523 ?auto_3526 ) ) ( not ( = ?auto_3525 ?auto_3526 ) ) ( not ( = ?auto_3522 ?auto_3526 ) ) ( not ( = ?auto_3523 ?auto_3527 ) ) ( not ( = ?auto_3525 ?auto_3527 ) ) ( not ( = ?auto_3522 ?auto_3527 ) ) ( not ( = ?auto_3526 ?auto_3527 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_3523 ?auto_3525 ?auto_3522 ?auto_3526 ?auto_3524 )
      ( DELIVER-1PKG ?auto_3527 ?auto_3524 )
      ( DELIVER-5PKG-VERIFY ?auto_3523 ?auto_3525 ?auto_3522 ?auto_3526 ?auto_3527 ?auto_3524 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_3540 - OBJ
      ?auto_3542 - OBJ
      ?auto_3539 - OBJ
      ?auto_3543 - OBJ
      ?auto_3544 - OBJ
      ?auto_3541 - LOCATION
    )
    :vars
    (
      ?auto_3549 - LOCATION
      ?auto_3546 - CITY
      ?auto_3548 - LOCATION
      ?auto_3547 - LOCATION
      ?auto_3545 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3542 ?auto_3540 ) ( GREATER-THAN ?auto_3539 ?auto_3540 ) ( GREATER-THAN ?auto_3539 ?auto_3542 ) ( GREATER-THAN ?auto_3543 ?auto_3540 ) ( GREATER-THAN ?auto_3543 ?auto_3542 ) ( GREATER-THAN ?auto_3543 ?auto_3539 ) ( GREATER-THAN ?auto_3544 ?auto_3540 ) ( GREATER-THAN ?auto_3544 ?auto_3542 ) ( GREATER-THAN ?auto_3544 ?auto_3539 ) ( GREATER-THAN ?auto_3544 ?auto_3543 ) ( IN-CITY ?auto_3549 ?auto_3546 ) ( IN-CITY ?auto_3541 ?auto_3546 ) ( not ( = ?auto_3541 ?auto_3549 ) ) ( OBJ-AT ?auto_3544 ?auto_3549 ) ( OBJ-AT ?auto_3543 ?auto_3549 ) ( IN-CITY ?auto_3548 ?auto_3546 ) ( not ( = ?auto_3541 ?auto_3548 ) ) ( OBJ-AT ?auto_3539 ?auto_3548 ) ( IN-CITY ?auto_3547 ?auto_3546 ) ( not ( = ?auto_3541 ?auto_3547 ) ) ( OBJ-AT ?auto_3542 ?auto_3547 ) ( OBJ-AT ?auto_3540 ?auto_3549 ) ( not ( = ?auto_3540 ?auto_3542 ) ) ( not ( = ?auto_3547 ?auto_3549 ) ) ( not ( = ?auto_3540 ?auto_3539 ) ) ( not ( = ?auto_3542 ?auto_3539 ) ) ( not ( = ?auto_3548 ?auto_3547 ) ) ( not ( = ?auto_3548 ?auto_3549 ) ) ( not ( = ?auto_3540 ?auto_3543 ) ) ( not ( = ?auto_3542 ?auto_3543 ) ) ( not ( = ?auto_3539 ?auto_3543 ) ) ( not ( = ?auto_3540 ?auto_3544 ) ) ( not ( = ?auto_3542 ?auto_3544 ) ) ( not ( = ?auto_3539 ?auto_3544 ) ) ( not ( = ?auto_3543 ?auto_3544 ) ) ( TRUCK-AT ?auto_3545 ?auto_3541 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_3545 ?auto_3541 ?auto_3549 ?auto_3546 )
      ( DELIVER-5PKG ?auto_3540 ?auto_3542 ?auto_3539 ?auto_3543 ?auto_3544 ?auto_3541 )
      ( DELIVER-5PKG-VERIFY ?auto_3540 ?auto_3542 ?auto_3539 ?auto_3543 ?auto_3544 ?auto_3541 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_3572 - OBJ
      ?auto_3574 - OBJ
      ?auto_3571 - OBJ
      ?auto_3575 - OBJ
      ?auto_3577 - OBJ
      ?auto_3576 - OBJ
      ?auto_3573 - LOCATION
    )
    :vars
    (
      ?auto_3579 - LOCATION
      ?auto_3580 - CITY
      ?auto_3582 - LOCATION
      ?auto_3581 - LOCATION
      ?auto_3578 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3574 ?auto_3572 ) ( GREATER-THAN ?auto_3571 ?auto_3572 ) ( GREATER-THAN ?auto_3571 ?auto_3574 ) ( GREATER-THAN ?auto_3575 ?auto_3572 ) ( GREATER-THAN ?auto_3575 ?auto_3574 ) ( GREATER-THAN ?auto_3575 ?auto_3571 ) ( GREATER-THAN ?auto_3577 ?auto_3572 ) ( GREATER-THAN ?auto_3577 ?auto_3574 ) ( GREATER-THAN ?auto_3577 ?auto_3571 ) ( GREATER-THAN ?auto_3577 ?auto_3575 ) ( GREATER-THAN ?auto_3576 ?auto_3572 ) ( GREATER-THAN ?auto_3576 ?auto_3574 ) ( GREATER-THAN ?auto_3576 ?auto_3571 ) ( GREATER-THAN ?auto_3576 ?auto_3575 ) ( GREATER-THAN ?auto_3576 ?auto_3577 ) ( IN-CITY ?auto_3579 ?auto_3580 ) ( IN-CITY ?auto_3573 ?auto_3580 ) ( not ( = ?auto_3573 ?auto_3579 ) ) ( OBJ-AT ?auto_3576 ?auto_3579 ) ( OBJ-AT ?auto_3577 ?auto_3579 ) ( OBJ-AT ?auto_3575 ?auto_3579 ) ( IN-CITY ?auto_3582 ?auto_3580 ) ( not ( = ?auto_3573 ?auto_3582 ) ) ( OBJ-AT ?auto_3571 ?auto_3582 ) ( IN-CITY ?auto_3581 ?auto_3580 ) ( not ( = ?auto_3573 ?auto_3581 ) ) ( OBJ-AT ?auto_3574 ?auto_3581 ) ( TRUCK-AT ?auto_3578 ?auto_3579 ) ( OBJ-AT ?auto_3572 ?auto_3579 ) ( not ( = ?auto_3572 ?auto_3574 ) ) ( not ( = ?auto_3581 ?auto_3579 ) ) ( not ( = ?auto_3572 ?auto_3571 ) ) ( not ( = ?auto_3574 ?auto_3571 ) ) ( not ( = ?auto_3582 ?auto_3581 ) ) ( not ( = ?auto_3582 ?auto_3579 ) ) ( not ( = ?auto_3572 ?auto_3575 ) ) ( not ( = ?auto_3574 ?auto_3575 ) ) ( not ( = ?auto_3571 ?auto_3575 ) ) ( not ( = ?auto_3572 ?auto_3577 ) ) ( not ( = ?auto_3574 ?auto_3577 ) ) ( not ( = ?auto_3571 ?auto_3577 ) ) ( not ( = ?auto_3575 ?auto_3577 ) ) ( not ( = ?auto_3572 ?auto_3576 ) ) ( not ( = ?auto_3574 ?auto_3576 ) ) ( not ( = ?auto_3571 ?auto_3576 ) ) ( not ( = ?auto_3575 ?auto_3576 ) ) ( not ( = ?auto_3577 ?auto_3576 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_3572 ?auto_3574 ?auto_3571 ?auto_3575 ?auto_3577 ?auto_3573 )
      ( DELIVER-1PKG ?auto_3576 ?auto_3573 )
      ( DELIVER-6PKG-VERIFY ?auto_3572 ?auto_3574 ?auto_3571 ?auto_3575 ?auto_3577 ?auto_3576 ?auto_3573 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_3591 - OBJ
      ?auto_3593 - OBJ
      ?auto_3590 - OBJ
      ?auto_3594 - OBJ
      ?auto_3596 - OBJ
      ?auto_3595 - OBJ
      ?auto_3592 - LOCATION
    )
    :vars
    (
      ?auto_3598 - LOCATION
      ?auto_3600 - CITY
      ?auto_3601 - LOCATION
      ?auto_3599 - LOCATION
      ?auto_3597 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3593 ?auto_3591 ) ( GREATER-THAN ?auto_3590 ?auto_3591 ) ( GREATER-THAN ?auto_3590 ?auto_3593 ) ( GREATER-THAN ?auto_3594 ?auto_3591 ) ( GREATER-THAN ?auto_3594 ?auto_3593 ) ( GREATER-THAN ?auto_3594 ?auto_3590 ) ( GREATER-THAN ?auto_3596 ?auto_3591 ) ( GREATER-THAN ?auto_3596 ?auto_3593 ) ( GREATER-THAN ?auto_3596 ?auto_3590 ) ( GREATER-THAN ?auto_3596 ?auto_3594 ) ( GREATER-THAN ?auto_3595 ?auto_3591 ) ( GREATER-THAN ?auto_3595 ?auto_3593 ) ( GREATER-THAN ?auto_3595 ?auto_3590 ) ( GREATER-THAN ?auto_3595 ?auto_3594 ) ( GREATER-THAN ?auto_3595 ?auto_3596 ) ( IN-CITY ?auto_3598 ?auto_3600 ) ( IN-CITY ?auto_3592 ?auto_3600 ) ( not ( = ?auto_3592 ?auto_3598 ) ) ( OBJ-AT ?auto_3595 ?auto_3598 ) ( OBJ-AT ?auto_3596 ?auto_3598 ) ( OBJ-AT ?auto_3594 ?auto_3598 ) ( IN-CITY ?auto_3601 ?auto_3600 ) ( not ( = ?auto_3592 ?auto_3601 ) ) ( OBJ-AT ?auto_3590 ?auto_3601 ) ( IN-CITY ?auto_3599 ?auto_3600 ) ( not ( = ?auto_3592 ?auto_3599 ) ) ( OBJ-AT ?auto_3593 ?auto_3599 ) ( OBJ-AT ?auto_3591 ?auto_3598 ) ( not ( = ?auto_3591 ?auto_3593 ) ) ( not ( = ?auto_3599 ?auto_3598 ) ) ( not ( = ?auto_3591 ?auto_3590 ) ) ( not ( = ?auto_3593 ?auto_3590 ) ) ( not ( = ?auto_3601 ?auto_3599 ) ) ( not ( = ?auto_3601 ?auto_3598 ) ) ( not ( = ?auto_3591 ?auto_3594 ) ) ( not ( = ?auto_3593 ?auto_3594 ) ) ( not ( = ?auto_3590 ?auto_3594 ) ) ( not ( = ?auto_3591 ?auto_3596 ) ) ( not ( = ?auto_3593 ?auto_3596 ) ) ( not ( = ?auto_3590 ?auto_3596 ) ) ( not ( = ?auto_3594 ?auto_3596 ) ) ( not ( = ?auto_3591 ?auto_3595 ) ) ( not ( = ?auto_3593 ?auto_3595 ) ) ( not ( = ?auto_3590 ?auto_3595 ) ) ( not ( = ?auto_3594 ?auto_3595 ) ) ( not ( = ?auto_3596 ?auto_3595 ) ) ( TRUCK-AT ?auto_3597 ?auto_3592 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_3597 ?auto_3592 ?auto_3598 ?auto_3600 )
      ( DELIVER-6PKG ?auto_3591 ?auto_3593 ?auto_3590 ?auto_3594 ?auto_3596 ?auto_3595 ?auto_3592 )
      ( DELIVER-6PKG-VERIFY ?auto_3591 ?auto_3593 ?auto_3590 ?auto_3594 ?auto_3596 ?auto_3595 ?auto_3592 ) )
  )

  ( :method DELIVER-7PKG
    :parameters
    (
      ?auto_3625 - OBJ
      ?auto_3627 - OBJ
      ?auto_3624 - OBJ
      ?auto_3628 - OBJ
      ?auto_3630 - OBJ
      ?auto_3629 - OBJ
      ?auto_3631 - OBJ
      ?auto_3626 - LOCATION
    )
    :vars
    (
      ?auto_3633 - LOCATION
      ?auto_3632 - CITY
      ?auto_3635 - LOCATION
      ?auto_3636 - LOCATION
      ?auto_3634 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3627 ?auto_3625 ) ( GREATER-THAN ?auto_3624 ?auto_3625 ) ( GREATER-THAN ?auto_3624 ?auto_3627 ) ( GREATER-THAN ?auto_3628 ?auto_3625 ) ( GREATER-THAN ?auto_3628 ?auto_3627 ) ( GREATER-THAN ?auto_3628 ?auto_3624 ) ( GREATER-THAN ?auto_3630 ?auto_3625 ) ( GREATER-THAN ?auto_3630 ?auto_3627 ) ( GREATER-THAN ?auto_3630 ?auto_3624 ) ( GREATER-THAN ?auto_3630 ?auto_3628 ) ( GREATER-THAN ?auto_3629 ?auto_3625 ) ( GREATER-THAN ?auto_3629 ?auto_3627 ) ( GREATER-THAN ?auto_3629 ?auto_3624 ) ( GREATER-THAN ?auto_3629 ?auto_3628 ) ( GREATER-THAN ?auto_3629 ?auto_3630 ) ( GREATER-THAN ?auto_3631 ?auto_3625 ) ( GREATER-THAN ?auto_3631 ?auto_3627 ) ( GREATER-THAN ?auto_3631 ?auto_3624 ) ( GREATER-THAN ?auto_3631 ?auto_3628 ) ( GREATER-THAN ?auto_3631 ?auto_3630 ) ( GREATER-THAN ?auto_3631 ?auto_3629 ) ( IN-CITY ?auto_3633 ?auto_3632 ) ( IN-CITY ?auto_3626 ?auto_3632 ) ( not ( = ?auto_3626 ?auto_3633 ) ) ( OBJ-AT ?auto_3631 ?auto_3633 ) ( IN-CITY ?auto_3635 ?auto_3632 ) ( not ( = ?auto_3626 ?auto_3635 ) ) ( OBJ-AT ?auto_3629 ?auto_3635 ) ( OBJ-AT ?auto_3630 ?auto_3635 ) ( OBJ-AT ?auto_3628 ?auto_3635 ) ( OBJ-AT ?auto_3624 ?auto_3633 ) ( IN-CITY ?auto_3636 ?auto_3632 ) ( not ( = ?auto_3626 ?auto_3636 ) ) ( OBJ-AT ?auto_3627 ?auto_3636 ) ( TRUCK-AT ?auto_3634 ?auto_3635 ) ( OBJ-AT ?auto_3625 ?auto_3635 ) ( not ( = ?auto_3625 ?auto_3627 ) ) ( not ( = ?auto_3636 ?auto_3635 ) ) ( not ( = ?auto_3625 ?auto_3624 ) ) ( not ( = ?auto_3627 ?auto_3624 ) ) ( not ( = ?auto_3633 ?auto_3636 ) ) ( not ( = ?auto_3633 ?auto_3635 ) ) ( not ( = ?auto_3625 ?auto_3628 ) ) ( not ( = ?auto_3627 ?auto_3628 ) ) ( not ( = ?auto_3624 ?auto_3628 ) ) ( not ( = ?auto_3625 ?auto_3630 ) ) ( not ( = ?auto_3627 ?auto_3630 ) ) ( not ( = ?auto_3624 ?auto_3630 ) ) ( not ( = ?auto_3628 ?auto_3630 ) ) ( not ( = ?auto_3625 ?auto_3629 ) ) ( not ( = ?auto_3627 ?auto_3629 ) ) ( not ( = ?auto_3624 ?auto_3629 ) ) ( not ( = ?auto_3628 ?auto_3629 ) ) ( not ( = ?auto_3630 ?auto_3629 ) ) ( not ( = ?auto_3625 ?auto_3631 ) ) ( not ( = ?auto_3627 ?auto_3631 ) ) ( not ( = ?auto_3624 ?auto_3631 ) ) ( not ( = ?auto_3628 ?auto_3631 ) ) ( not ( = ?auto_3630 ?auto_3631 ) ) ( not ( = ?auto_3629 ?auto_3631 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_3625 ?auto_3627 ?auto_3624 ?auto_3628 ?auto_3630 ?auto_3629 ?auto_3626 )
      ( DELIVER-1PKG ?auto_3631 ?auto_3626 )
      ( DELIVER-7PKG-VERIFY ?auto_3625 ?auto_3627 ?auto_3624 ?auto_3628 ?auto_3630 ?auto_3629 ?auto_3631 ?auto_3626 ) )
  )

  ( :method DELIVER-7PKG
    :parameters
    (
      ?auto_3646 - OBJ
      ?auto_3648 - OBJ
      ?auto_3645 - OBJ
      ?auto_3649 - OBJ
      ?auto_3651 - OBJ
      ?auto_3650 - OBJ
      ?auto_3652 - OBJ
      ?auto_3647 - LOCATION
    )
    :vars
    (
      ?auto_3657 - LOCATION
      ?auto_3653 - CITY
      ?auto_3655 - LOCATION
      ?auto_3656 - LOCATION
      ?auto_3654 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3648 ?auto_3646 ) ( GREATER-THAN ?auto_3645 ?auto_3646 ) ( GREATER-THAN ?auto_3645 ?auto_3648 ) ( GREATER-THAN ?auto_3649 ?auto_3646 ) ( GREATER-THAN ?auto_3649 ?auto_3648 ) ( GREATER-THAN ?auto_3649 ?auto_3645 ) ( GREATER-THAN ?auto_3651 ?auto_3646 ) ( GREATER-THAN ?auto_3651 ?auto_3648 ) ( GREATER-THAN ?auto_3651 ?auto_3645 ) ( GREATER-THAN ?auto_3651 ?auto_3649 ) ( GREATER-THAN ?auto_3650 ?auto_3646 ) ( GREATER-THAN ?auto_3650 ?auto_3648 ) ( GREATER-THAN ?auto_3650 ?auto_3645 ) ( GREATER-THAN ?auto_3650 ?auto_3649 ) ( GREATER-THAN ?auto_3650 ?auto_3651 ) ( GREATER-THAN ?auto_3652 ?auto_3646 ) ( GREATER-THAN ?auto_3652 ?auto_3648 ) ( GREATER-THAN ?auto_3652 ?auto_3645 ) ( GREATER-THAN ?auto_3652 ?auto_3649 ) ( GREATER-THAN ?auto_3652 ?auto_3651 ) ( GREATER-THAN ?auto_3652 ?auto_3650 ) ( IN-CITY ?auto_3657 ?auto_3653 ) ( IN-CITY ?auto_3647 ?auto_3653 ) ( not ( = ?auto_3647 ?auto_3657 ) ) ( OBJ-AT ?auto_3652 ?auto_3657 ) ( IN-CITY ?auto_3655 ?auto_3653 ) ( not ( = ?auto_3647 ?auto_3655 ) ) ( OBJ-AT ?auto_3650 ?auto_3655 ) ( OBJ-AT ?auto_3651 ?auto_3655 ) ( OBJ-AT ?auto_3649 ?auto_3655 ) ( OBJ-AT ?auto_3645 ?auto_3657 ) ( IN-CITY ?auto_3656 ?auto_3653 ) ( not ( = ?auto_3647 ?auto_3656 ) ) ( OBJ-AT ?auto_3648 ?auto_3656 ) ( OBJ-AT ?auto_3646 ?auto_3655 ) ( not ( = ?auto_3646 ?auto_3648 ) ) ( not ( = ?auto_3656 ?auto_3655 ) ) ( not ( = ?auto_3646 ?auto_3645 ) ) ( not ( = ?auto_3648 ?auto_3645 ) ) ( not ( = ?auto_3657 ?auto_3656 ) ) ( not ( = ?auto_3657 ?auto_3655 ) ) ( not ( = ?auto_3646 ?auto_3649 ) ) ( not ( = ?auto_3648 ?auto_3649 ) ) ( not ( = ?auto_3645 ?auto_3649 ) ) ( not ( = ?auto_3646 ?auto_3651 ) ) ( not ( = ?auto_3648 ?auto_3651 ) ) ( not ( = ?auto_3645 ?auto_3651 ) ) ( not ( = ?auto_3649 ?auto_3651 ) ) ( not ( = ?auto_3646 ?auto_3650 ) ) ( not ( = ?auto_3648 ?auto_3650 ) ) ( not ( = ?auto_3645 ?auto_3650 ) ) ( not ( = ?auto_3649 ?auto_3650 ) ) ( not ( = ?auto_3651 ?auto_3650 ) ) ( not ( = ?auto_3646 ?auto_3652 ) ) ( not ( = ?auto_3648 ?auto_3652 ) ) ( not ( = ?auto_3645 ?auto_3652 ) ) ( not ( = ?auto_3649 ?auto_3652 ) ) ( not ( = ?auto_3651 ?auto_3652 ) ) ( not ( = ?auto_3650 ?auto_3652 ) ) ( TRUCK-AT ?auto_3654 ?auto_3647 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_3654 ?auto_3647 ?auto_3655 ?auto_3653 )
      ( DELIVER-7PKG ?auto_3646 ?auto_3648 ?auto_3645 ?auto_3649 ?auto_3651 ?auto_3650 ?auto_3652 ?auto_3647 )
      ( DELIVER-7PKG-VERIFY ?auto_3646 ?auto_3648 ?auto_3645 ?auto_3649 ?auto_3651 ?auto_3650 ?auto_3652 ?auto_3647 ) )
  )

)

