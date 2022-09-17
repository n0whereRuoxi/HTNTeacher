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

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_3366 - OBJ
      ?auto_3367 - LOCATION
    )
    :vars
    (
      ?auto_3376 - LOCATION
      ?auto_3373 - CITY
      ?auto_3368 - TRUCK
      ?auto_3379 - LOCATION
      ?auto_3380 - CITY
    )
    :precondition
    ( and ( IN-CITY ?auto_3376 ?auto_3373 ) ( IN-CITY ?auto_3367 ?auto_3373 ) ( not ( = ?auto_3367 ?auto_3376 ) ) ( OBJ-AT ?auto_3366 ?auto_3376 ) ( TRUCK-AT ?auto_3368 ?auto_3379 ) ( IN-CITY ?auto_3379 ?auto_3380 ) ( IN-CITY ?auto_3376 ?auto_3380 ) ( not ( = ?auto_3376 ?auto_3379 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_3368 ?auto_3379 ?auto_3376 ?auto_3380 )
      ( !LOAD-TRUCK ?auto_3366 ?auto_3368 ?auto_3376 )
      ( !DRIVE-TRUCK ?auto_3368 ?auto_3376 ?auto_3367 ?auto_3373 )
      ( !UNLOAD-TRUCK ?auto_3366 ?auto_3368 ?auto_3367 )
      ( DELIVER-1PKG-VERIFY ?auto_3366 ?auto_3367 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_3403 - OBJ
      ?auto_3405 - OBJ
      ?auto_3408 - LOCATION
    )
    :vars
    (
      ?auto_3406 - LOCATION
      ?auto_3407 - CITY
      ?auto_3410 - CITY
      ?auto_3419 - LOCATION
      ?auto_3418 - CITY
      ?auto_3411 - TRUCK
      ?auto_3415 - LOCATION
      ?auto_3414 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3405 ?auto_3403 ) ( IN-CITY ?auto_3406 ?auto_3407 ) ( IN-CITY ?auto_3408 ?auto_3407 ) ( not ( = ?auto_3408 ?auto_3406 ) ) ( OBJ-AT ?auto_3405 ?auto_3406 ) ( IN-CITY ?auto_3408 ?auto_3410 ) ( IN-CITY ?auto_3406 ?auto_3410 ) ( IN-CITY ?auto_3419 ?auto_3418 ) ( IN-CITY ?auto_3408 ?auto_3418 ) ( not ( = ?auto_3408 ?auto_3419 ) ) ( OBJ-AT ?auto_3403 ?auto_3419 ) ( TRUCK-AT ?auto_3411 ?auto_3415 ) ( IN-CITY ?auto_3415 ?auto_3414 ) ( IN-CITY ?auto_3419 ?auto_3414 ) ( not ( = ?auto_3419 ?auto_3415 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_3403 ?auto_3408 )
      ( DELIVER-1PKG ?auto_3405 ?auto_3408 )
      ( DELIVER-2PKG-VERIFY ?auto_3403 ?auto_3405 ?auto_3408 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3442 - OBJ
      ?auto_3444 - OBJ
      ?auto_3445 - OBJ
      ?auto_3447 - LOCATION
    )
    :vars
    (
      ?auto_3451 - LOCATION
      ?auto_3446 - CITY
      ?auto_3450 - CITY
      ?auto_3456 - LOCATION
      ?auto_3458 - CITY
      ?auto_3454 - CITY
      ?auto_3460 - LOCATION
      ?auto_3461 - CITY
      ?auto_3452 - TRUCK
      ?auto_3459 - LOCATION
      ?auto_3457 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3444 ?auto_3442 ) ( GREATER-THAN ?auto_3445 ?auto_3442 ) ( GREATER-THAN ?auto_3445 ?auto_3444 ) ( IN-CITY ?auto_3451 ?auto_3446 ) ( IN-CITY ?auto_3447 ?auto_3446 ) ( not ( = ?auto_3447 ?auto_3451 ) ) ( OBJ-AT ?auto_3445 ?auto_3451 ) ( IN-CITY ?auto_3447 ?auto_3450 ) ( IN-CITY ?auto_3451 ?auto_3450 ) ( IN-CITY ?auto_3456 ?auto_3458 ) ( IN-CITY ?auto_3447 ?auto_3458 ) ( not ( = ?auto_3447 ?auto_3456 ) ) ( OBJ-AT ?auto_3444 ?auto_3456 ) ( IN-CITY ?auto_3447 ?auto_3454 ) ( IN-CITY ?auto_3456 ?auto_3454 ) ( IN-CITY ?auto_3460 ?auto_3461 ) ( IN-CITY ?auto_3447 ?auto_3461 ) ( not ( = ?auto_3447 ?auto_3460 ) ) ( OBJ-AT ?auto_3442 ?auto_3460 ) ( TRUCK-AT ?auto_3452 ?auto_3459 ) ( IN-CITY ?auto_3459 ?auto_3457 ) ( IN-CITY ?auto_3460 ?auto_3457 ) ( not ( = ?auto_3460 ?auto_3459 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3442 ?auto_3444 ?auto_3447 )
      ( DELIVER-1PKG ?auto_3445 ?auto_3447 )
      ( DELIVER-3PKG-VERIFY ?auto_3442 ?auto_3444 ?auto_3445 ?auto_3447 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_3487 - OBJ
      ?auto_3489 - OBJ
      ?auto_3490 - OBJ
      ?auto_3491 - OBJ
      ?auto_3496 - LOCATION
    )
    :vars
    (
      ?auto_3493 - LOCATION
      ?auto_3497 - CITY
      ?auto_3498 - CITY
      ?auto_3501 - LOCATION
      ?auto_3500 - CITY
      ?auto_3512 - CITY
      ?auto_3507 - LOCATION
      ?auto_3504 - CITY
      ?auto_3513 - CITY
      ?auto_3506 - LOCATION
      ?auto_3508 - CITY
      ?auto_3494 - TRUCK
      ?auto_3503 - LOCATION
      ?auto_3505 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3489 ?auto_3487 ) ( GREATER-THAN ?auto_3490 ?auto_3487 ) ( GREATER-THAN ?auto_3490 ?auto_3489 ) ( GREATER-THAN ?auto_3491 ?auto_3487 ) ( GREATER-THAN ?auto_3491 ?auto_3489 ) ( GREATER-THAN ?auto_3491 ?auto_3490 ) ( IN-CITY ?auto_3493 ?auto_3497 ) ( IN-CITY ?auto_3496 ?auto_3497 ) ( not ( = ?auto_3496 ?auto_3493 ) ) ( OBJ-AT ?auto_3491 ?auto_3493 ) ( IN-CITY ?auto_3496 ?auto_3498 ) ( IN-CITY ?auto_3493 ?auto_3498 ) ( IN-CITY ?auto_3501 ?auto_3500 ) ( IN-CITY ?auto_3496 ?auto_3500 ) ( not ( = ?auto_3496 ?auto_3501 ) ) ( OBJ-AT ?auto_3490 ?auto_3501 ) ( IN-CITY ?auto_3496 ?auto_3512 ) ( IN-CITY ?auto_3501 ?auto_3512 ) ( IN-CITY ?auto_3507 ?auto_3504 ) ( IN-CITY ?auto_3496 ?auto_3504 ) ( not ( = ?auto_3496 ?auto_3507 ) ) ( OBJ-AT ?auto_3489 ?auto_3507 ) ( IN-CITY ?auto_3496 ?auto_3513 ) ( IN-CITY ?auto_3507 ?auto_3513 ) ( IN-CITY ?auto_3506 ?auto_3508 ) ( IN-CITY ?auto_3496 ?auto_3508 ) ( not ( = ?auto_3496 ?auto_3506 ) ) ( OBJ-AT ?auto_3487 ?auto_3506 ) ( TRUCK-AT ?auto_3494 ?auto_3503 ) ( IN-CITY ?auto_3503 ?auto_3505 ) ( IN-CITY ?auto_3506 ?auto_3505 ) ( not ( = ?auto_3506 ?auto_3503 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_3487 ?auto_3489 ?auto_3490 ?auto_3496 )
      ( DELIVER-1PKG ?auto_3491 ?auto_3496 )
      ( DELIVER-4PKG-VERIFY ?auto_3487 ?auto_3489 ?auto_3490 ?auto_3491 ?auto_3496 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_3538 - OBJ
      ?auto_3540 - OBJ
      ?auto_3541 - OBJ
      ?auto_3542 - OBJ
      ?auto_3543 - OBJ
      ?auto_3547 - LOCATION
    )
    :vars
    (
      ?auto_3544 - LOCATION
      ?auto_3550 - CITY
      ?auto_3549 - CITY
      ?auto_3560 - LOCATION
      ?auto_3555 - CITY
      ?auto_3566 - CITY
      ?auto_3569 - LOCATION
      ?auto_3568 - CITY
      ?auto_3567 - CITY
      ?auto_3561 - LOCATION
      ?auto_3557 - CITY
      ?auto_3558 - CITY
      ?auto_3563 - LOCATION
      ?auto_3564 - CITY
      ?auto_3548 - TRUCK
      ?auto_3556 - LOCATION
      ?auto_3562 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3540 ?auto_3538 ) ( GREATER-THAN ?auto_3541 ?auto_3538 ) ( GREATER-THAN ?auto_3541 ?auto_3540 ) ( GREATER-THAN ?auto_3542 ?auto_3538 ) ( GREATER-THAN ?auto_3542 ?auto_3540 ) ( GREATER-THAN ?auto_3542 ?auto_3541 ) ( GREATER-THAN ?auto_3543 ?auto_3538 ) ( GREATER-THAN ?auto_3543 ?auto_3540 ) ( GREATER-THAN ?auto_3543 ?auto_3541 ) ( GREATER-THAN ?auto_3543 ?auto_3542 ) ( IN-CITY ?auto_3544 ?auto_3550 ) ( IN-CITY ?auto_3547 ?auto_3550 ) ( not ( = ?auto_3547 ?auto_3544 ) ) ( OBJ-AT ?auto_3543 ?auto_3544 ) ( IN-CITY ?auto_3547 ?auto_3549 ) ( IN-CITY ?auto_3544 ?auto_3549 ) ( IN-CITY ?auto_3560 ?auto_3555 ) ( IN-CITY ?auto_3547 ?auto_3555 ) ( not ( = ?auto_3547 ?auto_3560 ) ) ( OBJ-AT ?auto_3542 ?auto_3560 ) ( IN-CITY ?auto_3547 ?auto_3566 ) ( IN-CITY ?auto_3560 ?auto_3566 ) ( IN-CITY ?auto_3569 ?auto_3568 ) ( IN-CITY ?auto_3547 ?auto_3568 ) ( not ( = ?auto_3547 ?auto_3569 ) ) ( OBJ-AT ?auto_3541 ?auto_3569 ) ( IN-CITY ?auto_3547 ?auto_3567 ) ( IN-CITY ?auto_3569 ?auto_3567 ) ( IN-CITY ?auto_3561 ?auto_3557 ) ( IN-CITY ?auto_3547 ?auto_3557 ) ( not ( = ?auto_3547 ?auto_3561 ) ) ( OBJ-AT ?auto_3540 ?auto_3561 ) ( IN-CITY ?auto_3547 ?auto_3558 ) ( IN-CITY ?auto_3561 ?auto_3558 ) ( IN-CITY ?auto_3563 ?auto_3564 ) ( IN-CITY ?auto_3547 ?auto_3564 ) ( not ( = ?auto_3547 ?auto_3563 ) ) ( OBJ-AT ?auto_3538 ?auto_3563 ) ( TRUCK-AT ?auto_3548 ?auto_3556 ) ( IN-CITY ?auto_3556 ?auto_3562 ) ( IN-CITY ?auto_3563 ?auto_3562 ) ( not ( = ?auto_3563 ?auto_3556 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_3538 ?auto_3540 ?auto_3541 ?auto_3542 ?auto_3547 )
      ( DELIVER-1PKG ?auto_3543 ?auto_3547 )
      ( DELIVER-5PKG-VERIFY ?auto_3538 ?auto_3540 ?auto_3541 ?auto_3542 ?auto_3543 ?auto_3547 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_3595 - OBJ
      ?auto_3597 - OBJ
      ?auto_3598 - OBJ
      ?auto_3599 - OBJ
      ?auto_3600 - OBJ
      ?auto_3601 - OBJ
      ?auto_3602 - LOCATION
    )
    :vars
    (
      ?auto_3606 - LOCATION
      ?auto_3607 - CITY
      ?auto_3608 - CITY
      ?auto_3629 - LOCATION
      ?auto_3620 - CITY
      ?auto_3613 - CITY
      ?auto_3611 - LOCATION
      ?auto_3615 - CITY
      ?auto_3623 - CITY
      ?auto_3618 - LOCATION
      ?auto_3627 - CITY
      ?auto_3609 - CITY
      ?auto_3612 - LOCATION
      ?auto_3614 - CITY
      ?auto_3626 - CITY
      ?auto_3610 - LOCATION
      ?auto_3625 - CITY
      ?auto_3603 - TRUCK
      ?auto_3616 - LOCATION
      ?auto_3624 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3597 ?auto_3595 ) ( GREATER-THAN ?auto_3598 ?auto_3595 ) ( GREATER-THAN ?auto_3598 ?auto_3597 ) ( GREATER-THAN ?auto_3599 ?auto_3595 ) ( GREATER-THAN ?auto_3599 ?auto_3597 ) ( GREATER-THAN ?auto_3599 ?auto_3598 ) ( GREATER-THAN ?auto_3600 ?auto_3595 ) ( GREATER-THAN ?auto_3600 ?auto_3597 ) ( GREATER-THAN ?auto_3600 ?auto_3598 ) ( GREATER-THAN ?auto_3600 ?auto_3599 ) ( GREATER-THAN ?auto_3601 ?auto_3595 ) ( GREATER-THAN ?auto_3601 ?auto_3597 ) ( GREATER-THAN ?auto_3601 ?auto_3598 ) ( GREATER-THAN ?auto_3601 ?auto_3599 ) ( GREATER-THAN ?auto_3601 ?auto_3600 ) ( IN-CITY ?auto_3606 ?auto_3607 ) ( IN-CITY ?auto_3602 ?auto_3607 ) ( not ( = ?auto_3602 ?auto_3606 ) ) ( OBJ-AT ?auto_3601 ?auto_3606 ) ( IN-CITY ?auto_3602 ?auto_3608 ) ( IN-CITY ?auto_3606 ?auto_3608 ) ( IN-CITY ?auto_3629 ?auto_3620 ) ( IN-CITY ?auto_3602 ?auto_3620 ) ( not ( = ?auto_3602 ?auto_3629 ) ) ( OBJ-AT ?auto_3600 ?auto_3629 ) ( IN-CITY ?auto_3602 ?auto_3613 ) ( IN-CITY ?auto_3629 ?auto_3613 ) ( IN-CITY ?auto_3611 ?auto_3615 ) ( IN-CITY ?auto_3602 ?auto_3615 ) ( not ( = ?auto_3602 ?auto_3611 ) ) ( OBJ-AT ?auto_3599 ?auto_3611 ) ( IN-CITY ?auto_3602 ?auto_3623 ) ( IN-CITY ?auto_3611 ?auto_3623 ) ( IN-CITY ?auto_3618 ?auto_3627 ) ( IN-CITY ?auto_3602 ?auto_3627 ) ( not ( = ?auto_3602 ?auto_3618 ) ) ( OBJ-AT ?auto_3598 ?auto_3618 ) ( IN-CITY ?auto_3602 ?auto_3609 ) ( IN-CITY ?auto_3618 ?auto_3609 ) ( IN-CITY ?auto_3612 ?auto_3614 ) ( IN-CITY ?auto_3602 ?auto_3614 ) ( not ( = ?auto_3602 ?auto_3612 ) ) ( OBJ-AT ?auto_3597 ?auto_3612 ) ( IN-CITY ?auto_3602 ?auto_3626 ) ( IN-CITY ?auto_3612 ?auto_3626 ) ( IN-CITY ?auto_3610 ?auto_3625 ) ( IN-CITY ?auto_3602 ?auto_3625 ) ( not ( = ?auto_3602 ?auto_3610 ) ) ( OBJ-AT ?auto_3595 ?auto_3610 ) ( TRUCK-AT ?auto_3603 ?auto_3616 ) ( IN-CITY ?auto_3616 ?auto_3624 ) ( IN-CITY ?auto_3610 ?auto_3624 ) ( not ( = ?auto_3610 ?auto_3616 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_3595 ?auto_3597 ?auto_3598 ?auto_3599 ?auto_3600 ?auto_3602 )
      ( DELIVER-1PKG ?auto_3601 ?auto_3602 )
      ( DELIVER-6PKG-VERIFY ?auto_3595 ?auto_3597 ?auto_3598 ?auto_3599 ?auto_3600 ?auto_3601 ?auto_3602 ) )
  )

)

