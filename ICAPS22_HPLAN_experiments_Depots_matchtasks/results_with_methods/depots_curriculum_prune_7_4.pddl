( define ( domain depots )
  ( :requirements :strips :typing :equality :htn )
  ( :types hoist place surface truck )
  ( :predicates
    ( SURFACE-AT ?a - SURFACE ?b - PLACE )
    ( ON ?c - SURFACE ?d - SURFACE )
    ( IN ?e - SURFACE ?f - TRUCK )
    ( LIFTING ?g - HOIST ?h - SURFACE )
    ( AVAILABLE ?i - HOIST )
    ( CLEAR ?j - SURFACE )
    ( IS-CRATE ?k - SURFACE )
    ( HOIST-AT ?l - HOIST ?m - PLACE )
    ( TRUCK-AT ?n - TRUCK ?o - PLACE )
  )
  ( :action !DRIVE
    :parameters
    (
      ?truck - TRUCK
      ?old - PLACE
      ?new - PLACE
    )
    :precondition
    ( and ( TRUCK-AT ?truck ?old ) ( not ( = ?old ?new ) ) )
    :effect
    ( and ( not ( TRUCK-AT ?truck ?old ) ) ( TRUCK-AT ?truck ?new ) )
  )
  ( :action !LIFT
    :parameters
    (
      ?hoist - HOIST
      ?crate - SURFACE
      ?below - SURFACE
      ?here - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?hoist ?here ) ( AVAILABLE ?hoist ) ( SURFACE-AT ?crate ?here ) ( ON ?crate ?below ) ( CLEAR ?crate ) ( IS-CRATE ?crate ) )
    :effect
    ( and ( not ( SURFACE-AT ?crate ?here ) ) ( not ( CLEAR ?crate ) ) ( not ( AVAILABLE ?hoist ) ) ( not ( ON ?crate ?below ) ) ( CLEAR ?below ) ( LIFTING ?hoist ?crate ) )
  )
  ( :action !DROP
    :parameters
    (
      ?hoist - HOIST
      ?crate - SURFACE
      ?below - SURFACE
      ?here - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?hoist ?here ) ( SURFACE-AT ?below ?here ) ( CLEAR ?below ) ( LIFTING ?hoist ?crate ) ( IS-CRATE ?crate ) )
    :effect
    ( and ( not ( LIFTING ?hoist ?crate ) ) ( not ( CLEAR ?below ) ) ( AVAILABLE ?hoist ) ( SURFACE-AT ?crate ?here ) ( CLEAR ?crate ) ( ON ?crate ?below ) )
  )
  ( :action !LOAD
    :parameters
    (
      ?hoist - HOIST
      ?crate - SURFACE
      ?truck - TRUCK
      ?here - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?hoist ?here ) ( TRUCK-AT ?truck ?here ) ( LIFTING ?hoist ?crate ) ( IS-CRATE ?crate ) )
    :effect
    ( and ( not ( LIFTING ?hoist ?crate ) ) ( IN ?crate ?truck ) ( AVAILABLE ?hoist ) )
  )
  ( :action !UNLOAD
    :parameters
    (
      ?hoist - HOIST
      ?crate - SURFACE
      ?truck - TRUCK
      ?here - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?hoist ?here ) ( TRUCK-AT ?truck ?here ) ( AVAILABLE ?hoist ) ( IN ?crate ?truck ) ( IS-CRATE ?crate ) )
    :effect
    ( and ( not ( IN ?crate ?truck ) ) ( not ( AVAILABLE ?hoist ) ) ( LIFTING ?hoist ?crate ) )
  )
  ( :method MAKE-ON
    :parameters
    (
      ?ab - SURFACE
      ?be - SURFACE
    )
    :precondition
    ( and ( ON ?ab ?be ) )
    :subtasks
    (  )
  )

  ( :method MAKE-1CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( CLEAR ?c1 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-2CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( CLEAR ?c2 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-3CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( CLEAR ?c3 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-4CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( CLEAR ?c4 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-5CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( CLEAR ?c5 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-6CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( CLEAR ?c6 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-7CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
      ?c7 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( CLEAR ?c7 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3395 - SURFACE
      ?auto_3396 - SURFACE
    )
    :vars
    (
      ?auto_3397 - HOIST
      ?auto_3398 - PLACE
      ?auto_3400 - PLACE
      ?auto_3401 - HOIST
      ?auto_3402 - SURFACE
      ?auto_3399 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3397 ?auto_3398 ) ( SURFACE-AT ?auto_3395 ?auto_3398 ) ( CLEAR ?auto_3395 ) ( IS-CRATE ?auto_3396 ) ( AVAILABLE ?auto_3397 ) ( not ( = ?auto_3400 ?auto_3398 ) ) ( HOIST-AT ?auto_3401 ?auto_3400 ) ( AVAILABLE ?auto_3401 ) ( SURFACE-AT ?auto_3396 ?auto_3400 ) ( ON ?auto_3396 ?auto_3402 ) ( CLEAR ?auto_3396 ) ( TRUCK-AT ?auto_3399 ?auto_3398 ) ( not ( = ?auto_3395 ?auto_3396 ) ) ( not ( = ?auto_3395 ?auto_3402 ) ) ( not ( = ?auto_3396 ?auto_3402 ) ) ( not ( = ?auto_3397 ?auto_3401 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3399 ?auto_3398 ?auto_3400 )
      ( !LIFT ?auto_3401 ?auto_3396 ?auto_3402 ?auto_3400 )
      ( !LOAD ?auto_3401 ?auto_3396 ?auto_3399 ?auto_3400 )
      ( !DRIVE ?auto_3399 ?auto_3400 ?auto_3398 )
      ( !UNLOAD ?auto_3397 ?auto_3396 ?auto_3399 ?auto_3398 )
      ( !DROP ?auto_3397 ?auto_3396 ?auto_3395 ?auto_3398 )
      ( MAKE-1CRATE-VERIFY ?auto_3395 ?auto_3396 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3416 - SURFACE
      ?auto_3417 - SURFACE
      ?auto_3418 - SURFACE
    )
    :vars
    (
      ?auto_3421 - HOIST
      ?auto_3422 - PLACE
      ?auto_3419 - PLACE
      ?auto_3423 - HOIST
      ?auto_3424 - SURFACE
      ?auto_3427 - PLACE
      ?auto_3426 - HOIST
      ?auto_3425 - SURFACE
      ?auto_3420 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3421 ?auto_3422 ) ( IS-CRATE ?auto_3418 ) ( not ( = ?auto_3419 ?auto_3422 ) ) ( HOIST-AT ?auto_3423 ?auto_3419 ) ( AVAILABLE ?auto_3423 ) ( SURFACE-AT ?auto_3418 ?auto_3419 ) ( ON ?auto_3418 ?auto_3424 ) ( CLEAR ?auto_3418 ) ( not ( = ?auto_3417 ?auto_3418 ) ) ( not ( = ?auto_3417 ?auto_3424 ) ) ( not ( = ?auto_3418 ?auto_3424 ) ) ( not ( = ?auto_3421 ?auto_3423 ) ) ( SURFACE-AT ?auto_3416 ?auto_3422 ) ( CLEAR ?auto_3416 ) ( IS-CRATE ?auto_3417 ) ( AVAILABLE ?auto_3421 ) ( not ( = ?auto_3427 ?auto_3422 ) ) ( HOIST-AT ?auto_3426 ?auto_3427 ) ( AVAILABLE ?auto_3426 ) ( SURFACE-AT ?auto_3417 ?auto_3427 ) ( ON ?auto_3417 ?auto_3425 ) ( CLEAR ?auto_3417 ) ( TRUCK-AT ?auto_3420 ?auto_3422 ) ( not ( = ?auto_3416 ?auto_3417 ) ) ( not ( = ?auto_3416 ?auto_3425 ) ) ( not ( = ?auto_3417 ?auto_3425 ) ) ( not ( = ?auto_3421 ?auto_3426 ) ) ( not ( = ?auto_3416 ?auto_3418 ) ) ( not ( = ?auto_3416 ?auto_3424 ) ) ( not ( = ?auto_3418 ?auto_3425 ) ) ( not ( = ?auto_3419 ?auto_3427 ) ) ( not ( = ?auto_3423 ?auto_3426 ) ) ( not ( = ?auto_3424 ?auto_3425 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3416 ?auto_3417 )
      ( MAKE-1CRATE ?auto_3417 ?auto_3418 )
      ( MAKE-2CRATE-VERIFY ?auto_3416 ?auto_3417 ?auto_3418 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_3442 - SURFACE
      ?auto_3443 - SURFACE
      ?auto_3444 - SURFACE
      ?auto_3445 - SURFACE
    )
    :vars
    (
      ?auto_3451 - HOIST
      ?auto_3447 - PLACE
      ?auto_3450 - PLACE
      ?auto_3448 - HOIST
      ?auto_3449 - SURFACE
      ?auto_3453 - PLACE
      ?auto_3454 - HOIST
      ?auto_3456 - SURFACE
      ?auto_3455 - PLACE
      ?auto_3452 - HOIST
      ?auto_3457 - SURFACE
      ?auto_3446 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3451 ?auto_3447 ) ( IS-CRATE ?auto_3445 ) ( not ( = ?auto_3450 ?auto_3447 ) ) ( HOIST-AT ?auto_3448 ?auto_3450 ) ( AVAILABLE ?auto_3448 ) ( SURFACE-AT ?auto_3445 ?auto_3450 ) ( ON ?auto_3445 ?auto_3449 ) ( CLEAR ?auto_3445 ) ( not ( = ?auto_3444 ?auto_3445 ) ) ( not ( = ?auto_3444 ?auto_3449 ) ) ( not ( = ?auto_3445 ?auto_3449 ) ) ( not ( = ?auto_3451 ?auto_3448 ) ) ( IS-CRATE ?auto_3444 ) ( not ( = ?auto_3453 ?auto_3447 ) ) ( HOIST-AT ?auto_3454 ?auto_3453 ) ( AVAILABLE ?auto_3454 ) ( SURFACE-AT ?auto_3444 ?auto_3453 ) ( ON ?auto_3444 ?auto_3456 ) ( CLEAR ?auto_3444 ) ( not ( = ?auto_3443 ?auto_3444 ) ) ( not ( = ?auto_3443 ?auto_3456 ) ) ( not ( = ?auto_3444 ?auto_3456 ) ) ( not ( = ?auto_3451 ?auto_3454 ) ) ( SURFACE-AT ?auto_3442 ?auto_3447 ) ( CLEAR ?auto_3442 ) ( IS-CRATE ?auto_3443 ) ( AVAILABLE ?auto_3451 ) ( not ( = ?auto_3455 ?auto_3447 ) ) ( HOIST-AT ?auto_3452 ?auto_3455 ) ( AVAILABLE ?auto_3452 ) ( SURFACE-AT ?auto_3443 ?auto_3455 ) ( ON ?auto_3443 ?auto_3457 ) ( CLEAR ?auto_3443 ) ( TRUCK-AT ?auto_3446 ?auto_3447 ) ( not ( = ?auto_3442 ?auto_3443 ) ) ( not ( = ?auto_3442 ?auto_3457 ) ) ( not ( = ?auto_3443 ?auto_3457 ) ) ( not ( = ?auto_3451 ?auto_3452 ) ) ( not ( = ?auto_3442 ?auto_3444 ) ) ( not ( = ?auto_3442 ?auto_3456 ) ) ( not ( = ?auto_3444 ?auto_3457 ) ) ( not ( = ?auto_3453 ?auto_3455 ) ) ( not ( = ?auto_3454 ?auto_3452 ) ) ( not ( = ?auto_3456 ?auto_3457 ) ) ( not ( = ?auto_3442 ?auto_3445 ) ) ( not ( = ?auto_3442 ?auto_3449 ) ) ( not ( = ?auto_3443 ?auto_3445 ) ) ( not ( = ?auto_3443 ?auto_3449 ) ) ( not ( = ?auto_3445 ?auto_3456 ) ) ( not ( = ?auto_3445 ?auto_3457 ) ) ( not ( = ?auto_3450 ?auto_3453 ) ) ( not ( = ?auto_3450 ?auto_3455 ) ) ( not ( = ?auto_3448 ?auto_3454 ) ) ( not ( = ?auto_3448 ?auto_3452 ) ) ( not ( = ?auto_3449 ?auto_3456 ) ) ( not ( = ?auto_3449 ?auto_3457 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_3442 ?auto_3443 ?auto_3444 )
      ( MAKE-1CRATE ?auto_3444 ?auto_3445 )
      ( MAKE-3CRATE-VERIFY ?auto_3442 ?auto_3443 ?auto_3444 ?auto_3445 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_3473 - SURFACE
      ?auto_3474 - SURFACE
      ?auto_3475 - SURFACE
      ?auto_3476 - SURFACE
      ?auto_3477 - SURFACE
    )
    :vars
    (
      ?auto_3481 - HOIST
      ?auto_3478 - PLACE
      ?auto_3483 - PLACE
      ?auto_3479 - HOIST
      ?auto_3480 - SURFACE
      ?auto_3491 - PLACE
      ?auto_3492 - HOIST
      ?auto_3485 - SURFACE
      ?auto_3490 - PLACE
      ?auto_3487 - HOIST
      ?auto_3488 - SURFACE
      ?auto_3489 - PLACE
      ?auto_3486 - HOIST
      ?auto_3484 - SURFACE
      ?auto_3482 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3481 ?auto_3478 ) ( IS-CRATE ?auto_3477 ) ( not ( = ?auto_3483 ?auto_3478 ) ) ( HOIST-AT ?auto_3479 ?auto_3483 ) ( AVAILABLE ?auto_3479 ) ( SURFACE-AT ?auto_3477 ?auto_3483 ) ( ON ?auto_3477 ?auto_3480 ) ( CLEAR ?auto_3477 ) ( not ( = ?auto_3476 ?auto_3477 ) ) ( not ( = ?auto_3476 ?auto_3480 ) ) ( not ( = ?auto_3477 ?auto_3480 ) ) ( not ( = ?auto_3481 ?auto_3479 ) ) ( IS-CRATE ?auto_3476 ) ( not ( = ?auto_3491 ?auto_3478 ) ) ( HOIST-AT ?auto_3492 ?auto_3491 ) ( AVAILABLE ?auto_3492 ) ( SURFACE-AT ?auto_3476 ?auto_3491 ) ( ON ?auto_3476 ?auto_3485 ) ( CLEAR ?auto_3476 ) ( not ( = ?auto_3475 ?auto_3476 ) ) ( not ( = ?auto_3475 ?auto_3485 ) ) ( not ( = ?auto_3476 ?auto_3485 ) ) ( not ( = ?auto_3481 ?auto_3492 ) ) ( IS-CRATE ?auto_3475 ) ( not ( = ?auto_3490 ?auto_3478 ) ) ( HOIST-AT ?auto_3487 ?auto_3490 ) ( AVAILABLE ?auto_3487 ) ( SURFACE-AT ?auto_3475 ?auto_3490 ) ( ON ?auto_3475 ?auto_3488 ) ( CLEAR ?auto_3475 ) ( not ( = ?auto_3474 ?auto_3475 ) ) ( not ( = ?auto_3474 ?auto_3488 ) ) ( not ( = ?auto_3475 ?auto_3488 ) ) ( not ( = ?auto_3481 ?auto_3487 ) ) ( SURFACE-AT ?auto_3473 ?auto_3478 ) ( CLEAR ?auto_3473 ) ( IS-CRATE ?auto_3474 ) ( AVAILABLE ?auto_3481 ) ( not ( = ?auto_3489 ?auto_3478 ) ) ( HOIST-AT ?auto_3486 ?auto_3489 ) ( AVAILABLE ?auto_3486 ) ( SURFACE-AT ?auto_3474 ?auto_3489 ) ( ON ?auto_3474 ?auto_3484 ) ( CLEAR ?auto_3474 ) ( TRUCK-AT ?auto_3482 ?auto_3478 ) ( not ( = ?auto_3473 ?auto_3474 ) ) ( not ( = ?auto_3473 ?auto_3484 ) ) ( not ( = ?auto_3474 ?auto_3484 ) ) ( not ( = ?auto_3481 ?auto_3486 ) ) ( not ( = ?auto_3473 ?auto_3475 ) ) ( not ( = ?auto_3473 ?auto_3488 ) ) ( not ( = ?auto_3475 ?auto_3484 ) ) ( not ( = ?auto_3490 ?auto_3489 ) ) ( not ( = ?auto_3487 ?auto_3486 ) ) ( not ( = ?auto_3488 ?auto_3484 ) ) ( not ( = ?auto_3473 ?auto_3476 ) ) ( not ( = ?auto_3473 ?auto_3485 ) ) ( not ( = ?auto_3474 ?auto_3476 ) ) ( not ( = ?auto_3474 ?auto_3485 ) ) ( not ( = ?auto_3476 ?auto_3488 ) ) ( not ( = ?auto_3476 ?auto_3484 ) ) ( not ( = ?auto_3491 ?auto_3490 ) ) ( not ( = ?auto_3491 ?auto_3489 ) ) ( not ( = ?auto_3492 ?auto_3487 ) ) ( not ( = ?auto_3492 ?auto_3486 ) ) ( not ( = ?auto_3485 ?auto_3488 ) ) ( not ( = ?auto_3485 ?auto_3484 ) ) ( not ( = ?auto_3473 ?auto_3477 ) ) ( not ( = ?auto_3473 ?auto_3480 ) ) ( not ( = ?auto_3474 ?auto_3477 ) ) ( not ( = ?auto_3474 ?auto_3480 ) ) ( not ( = ?auto_3475 ?auto_3477 ) ) ( not ( = ?auto_3475 ?auto_3480 ) ) ( not ( = ?auto_3477 ?auto_3485 ) ) ( not ( = ?auto_3477 ?auto_3488 ) ) ( not ( = ?auto_3477 ?auto_3484 ) ) ( not ( = ?auto_3483 ?auto_3491 ) ) ( not ( = ?auto_3483 ?auto_3490 ) ) ( not ( = ?auto_3483 ?auto_3489 ) ) ( not ( = ?auto_3479 ?auto_3492 ) ) ( not ( = ?auto_3479 ?auto_3487 ) ) ( not ( = ?auto_3479 ?auto_3486 ) ) ( not ( = ?auto_3480 ?auto_3485 ) ) ( not ( = ?auto_3480 ?auto_3488 ) ) ( not ( = ?auto_3480 ?auto_3484 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_3473 ?auto_3474 ?auto_3475 ?auto_3476 )
      ( MAKE-1CRATE ?auto_3476 ?auto_3477 )
      ( MAKE-4CRATE-VERIFY ?auto_3473 ?auto_3474 ?auto_3475 ?auto_3476 ?auto_3477 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_3509 - SURFACE
      ?auto_3510 - SURFACE
      ?auto_3511 - SURFACE
      ?auto_3512 - SURFACE
      ?auto_3513 - SURFACE
      ?auto_3514 - SURFACE
    )
    :vars
    (
      ?auto_3519 - HOIST
      ?auto_3515 - PLACE
      ?auto_3520 - PLACE
      ?auto_3518 - HOIST
      ?auto_3516 - SURFACE
      ?auto_3525 - PLACE
      ?auto_3522 - HOIST
      ?auto_3524 - SURFACE
      ?auto_3521 - PLACE
      ?auto_3530 - HOIST
      ?auto_3532 - SURFACE
      ?auto_3527 - PLACE
      ?auto_3528 - HOIST
      ?auto_3529 - SURFACE
      ?auto_3526 - PLACE
      ?auto_3531 - HOIST
      ?auto_3523 - SURFACE
      ?auto_3517 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3519 ?auto_3515 ) ( IS-CRATE ?auto_3514 ) ( not ( = ?auto_3520 ?auto_3515 ) ) ( HOIST-AT ?auto_3518 ?auto_3520 ) ( AVAILABLE ?auto_3518 ) ( SURFACE-AT ?auto_3514 ?auto_3520 ) ( ON ?auto_3514 ?auto_3516 ) ( CLEAR ?auto_3514 ) ( not ( = ?auto_3513 ?auto_3514 ) ) ( not ( = ?auto_3513 ?auto_3516 ) ) ( not ( = ?auto_3514 ?auto_3516 ) ) ( not ( = ?auto_3519 ?auto_3518 ) ) ( IS-CRATE ?auto_3513 ) ( not ( = ?auto_3525 ?auto_3515 ) ) ( HOIST-AT ?auto_3522 ?auto_3525 ) ( AVAILABLE ?auto_3522 ) ( SURFACE-AT ?auto_3513 ?auto_3525 ) ( ON ?auto_3513 ?auto_3524 ) ( CLEAR ?auto_3513 ) ( not ( = ?auto_3512 ?auto_3513 ) ) ( not ( = ?auto_3512 ?auto_3524 ) ) ( not ( = ?auto_3513 ?auto_3524 ) ) ( not ( = ?auto_3519 ?auto_3522 ) ) ( IS-CRATE ?auto_3512 ) ( not ( = ?auto_3521 ?auto_3515 ) ) ( HOIST-AT ?auto_3530 ?auto_3521 ) ( AVAILABLE ?auto_3530 ) ( SURFACE-AT ?auto_3512 ?auto_3521 ) ( ON ?auto_3512 ?auto_3532 ) ( CLEAR ?auto_3512 ) ( not ( = ?auto_3511 ?auto_3512 ) ) ( not ( = ?auto_3511 ?auto_3532 ) ) ( not ( = ?auto_3512 ?auto_3532 ) ) ( not ( = ?auto_3519 ?auto_3530 ) ) ( IS-CRATE ?auto_3511 ) ( not ( = ?auto_3527 ?auto_3515 ) ) ( HOIST-AT ?auto_3528 ?auto_3527 ) ( AVAILABLE ?auto_3528 ) ( SURFACE-AT ?auto_3511 ?auto_3527 ) ( ON ?auto_3511 ?auto_3529 ) ( CLEAR ?auto_3511 ) ( not ( = ?auto_3510 ?auto_3511 ) ) ( not ( = ?auto_3510 ?auto_3529 ) ) ( not ( = ?auto_3511 ?auto_3529 ) ) ( not ( = ?auto_3519 ?auto_3528 ) ) ( SURFACE-AT ?auto_3509 ?auto_3515 ) ( CLEAR ?auto_3509 ) ( IS-CRATE ?auto_3510 ) ( AVAILABLE ?auto_3519 ) ( not ( = ?auto_3526 ?auto_3515 ) ) ( HOIST-AT ?auto_3531 ?auto_3526 ) ( AVAILABLE ?auto_3531 ) ( SURFACE-AT ?auto_3510 ?auto_3526 ) ( ON ?auto_3510 ?auto_3523 ) ( CLEAR ?auto_3510 ) ( TRUCK-AT ?auto_3517 ?auto_3515 ) ( not ( = ?auto_3509 ?auto_3510 ) ) ( not ( = ?auto_3509 ?auto_3523 ) ) ( not ( = ?auto_3510 ?auto_3523 ) ) ( not ( = ?auto_3519 ?auto_3531 ) ) ( not ( = ?auto_3509 ?auto_3511 ) ) ( not ( = ?auto_3509 ?auto_3529 ) ) ( not ( = ?auto_3511 ?auto_3523 ) ) ( not ( = ?auto_3527 ?auto_3526 ) ) ( not ( = ?auto_3528 ?auto_3531 ) ) ( not ( = ?auto_3529 ?auto_3523 ) ) ( not ( = ?auto_3509 ?auto_3512 ) ) ( not ( = ?auto_3509 ?auto_3532 ) ) ( not ( = ?auto_3510 ?auto_3512 ) ) ( not ( = ?auto_3510 ?auto_3532 ) ) ( not ( = ?auto_3512 ?auto_3529 ) ) ( not ( = ?auto_3512 ?auto_3523 ) ) ( not ( = ?auto_3521 ?auto_3527 ) ) ( not ( = ?auto_3521 ?auto_3526 ) ) ( not ( = ?auto_3530 ?auto_3528 ) ) ( not ( = ?auto_3530 ?auto_3531 ) ) ( not ( = ?auto_3532 ?auto_3529 ) ) ( not ( = ?auto_3532 ?auto_3523 ) ) ( not ( = ?auto_3509 ?auto_3513 ) ) ( not ( = ?auto_3509 ?auto_3524 ) ) ( not ( = ?auto_3510 ?auto_3513 ) ) ( not ( = ?auto_3510 ?auto_3524 ) ) ( not ( = ?auto_3511 ?auto_3513 ) ) ( not ( = ?auto_3511 ?auto_3524 ) ) ( not ( = ?auto_3513 ?auto_3532 ) ) ( not ( = ?auto_3513 ?auto_3529 ) ) ( not ( = ?auto_3513 ?auto_3523 ) ) ( not ( = ?auto_3525 ?auto_3521 ) ) ( not ( = ?auto_3525 ?auto_3527 ) ) ( not ( = ?auto_3525 ?auto_3526 ) ) ( not ( = ?auto_3522 ?auto_3530 ) ) ( not ( = ?auto_3522 ?auto_3528 ) ) ( not ( = ?auto_3522 ?auto_3531 ) ) ( not ( = ?auto_3524 ?auto_3532 ) ) ( not ( = ?auto_3524 ?auto_3529 ) ) ( not ( = ?auto_3524 ?auto_3523 ) ) ( not ( = ?auto_3509 ?auto_3514 ) ) ( not ( = ?auto_3509 ?auto_3516 ) ) ( not ( = ?auto_3510 ?auto_3514 ) ) ( not ( = ?auto_3510 ?auto_3516 ) ) ( not ( = ?auto_3511 ?auto_3514 ) ) ( not ( = ?auto_3511 ?auto_3516 ) ) ( not ( = ?auto_3512 ?auto_3514 ) ) ( not ( = ?auto_3512 ?auto_3516 ) ) ( not ( = ?auto_3514 ?auto_3524 ) ) ( not ( = ?auto_3514 ?auto_3532 ) ) ( not ( = ?auto_3514 ?auto_3529 ) ) ( not ( = ?auto_3514 ?auto_3523 ) ) ( not ( = ?auto_3520 ?auto_3525 ) ) ( not ( = ?auto_3520 ?auto_3521 ) ) ( not ( = ?auto_3520 ?auto_3527 ) ) ( not ( = ?auto_3520 ?auto_3526 ) ) ( not ( = ?auto_3518 ?auto_3522 ) ) ( not ( = ?auto_3518 ?auto_3530 ) ) ( not ( = ?auto_3518 ?auto_3528 ) ) ( not ( = ?auto_3518 ?auto_3531 ) ) ( not ( = ?auto_3516 ?auto_3524 ) ) ( not ( = ?auto_3516 ?auto_3532 ) ) ( not ( = ?auto_3516 ?auto_3529 ) ) ( not ( = ?auto_3516 ?auto_3523 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_3509 ?auto_3510 ?auto_3511 ?auto_3512 ?auto_3513 )
      ( MAKE-1CRATE ?auto_3513 ?auto_3514 )
      ( MAKE-5CRATE-VERIFY ?auto_3509 ?auto_3510 ?auto_3511 ?auto_3512 ?auto_3513 ?auto_3514 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_3550 - SURFACE
      ?auto_3551 - SURFACE
      ?auto_3552 - SURFACE
      ?auto_3553 - SURFACE
      ?auto_3554 - SURFACE
      ?auto_3555 - SURFACE
      ?auto_3556 - SURFACE
    )
    :vars
    (
      ?auto_3562 - HOIST
      ?auto_3561 - PLACE
      ?auto_3557 - PLACE
      ?auto_3559 - HOIST
      ?auto_3558 - SURFACE
      ?auto_3571 - PLACE
      ?auto_3577 - HOIST
      ?auto_3569 - SURFACE
      ?auto_3563 - PLACE
      ?auto_3565 - HOIST
      ?auto_3564 - SURFACE
      ?auto_3567 - PLACE
      ?auto_3572 - HOIST
      ?auto_3568 - SURFACE
      ?auto_3574 - PLACE
      ?auto_3576 - HOIST
      ?auto_3573 - SURFACE
      ?auto_3575 - PLACE
      ?auto_3570 - HOIST
      ?auto_3566 - SURFACE
      ?auto_3560 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3562 ?auto_3561 ) ( IS-CRATE ?auto_3556 ) ( not ( = ?auto_3557 ?auto_3561 ) ) ( HOIST-AT ?auto_3559 ?auto_3557 ) ( AVAILABLE ?auto_3559 ) ( SURFACE-AT ?auto_3556 ?auto_3557 ) ( ON ?auto_3556 ?auto_3558 ) ( CLEAR ?auto_3556 ) ( not ( = ?auto_3555 ?auto_3556 ) ) ( not ( = ?auto_3555 ?auto_3558 ) ) ( not ( = ?auto_3556 ?auto_3558 ) ) ( not ( = ?auto_3562 ?auto_3559 ) ) ( IS-CRATE ?auto_3555 ) ( not ( = ?auto_3571 ?auto_3561 ) ) ( HOIST-AT ?auto_3577 ?auto_3571 ) ( AVAILABLE ?auto_3577 ) ( SURFACE-AT ?auto_3555 ?auto_3571 ) ( ON ?auto_3555 ?auto_3569 ) ( CLEAR ?auto_3555 ) ( not ( = ?auto_3554 ?auto_3555 ) ) ( not ( = ?auto_3554 ?auto_3569 ) ) ( not ( = ?auto_3555 ?auto_3569 ) ) ( not ( = ?auto_3562 ?auto_3577 ) ) ( IS-CRATE ?auto_3554 ) ( not ( = ?auto_3563 ?auto_3561 ) ) ( HOIST-AT ?auto_3565 ?auto_3563 ) ( AVAILABLE ?auto_3565 ) ( SURFACE-AT ?auto_3554 ?auto_3563 ) ( ON ?auto_3554 ?auto_3564 ) ( CLEAR ?auto_3554 ) ( not ( = ?auto_3553 ?auto_3554 ) ) ( not ( = ?auto_3553 ?auto_3564 ) ) ( not ( = ?auto_3554 ?auto_3564 ) ) ( not ( = ?auto_3562 ?auto_3565 ) ) ( IS-CRATE ?auto_3553 ) ( not ( = ?auto_3567 ?auto_3561 ) ) ( HOIST-AT ?auto_3572 ?auto_3567 ) ( AVAILABLE ?auto_3572 ) ( SURFACE-AT ?auto_3553 ?auto_3567 ) ( ON ?auto_3553 ?auto_3568 ) ( CLEAR ?auto_3553 ) ( not ( = ?auto_3552 ?auto_3553 ) ) ( not ( = ?auto_3552 ?auto_3568 ) ) ( not ( = ?auto_3553 ?auto_3568 ) ) ( not ( = ?auto_3562 ?auto_3572 ) ) ( IS-CRATE ?auto_3552 ) ( not ( = ?auto_3574 ?auto_3561 ) ) ( HOIST-AT ?auto_3576 ?auto_3574 ) ( AVAILABLE ?auto_3576 ) ( SURFACE-AT ?auto_3552 ?auto_3574 ) ( ON ?auto_3552 ?auto_3573 ) ( CLEAR ?auto_3552 ) ( not ( = ?auto_3551 ?auto_3552 ) ) ( not ( = ?auto_3551 ?auto_3573 ) ) ( not ( = ?auto_3552 ?auto_3573 ) ) ( not ( = ?auto_3562 ?auto_3576 ) ) ( SURFACE-AT ?auto_3550 ?auto_3561 ) ( CLEAR ?auto_3550 ) ( IS-CRATE ?auto_3551 ) ( AVAILABLE ?auto_3562 ) ( not ( = ?auto_3575 ?auto_3561 ) ) ( HOIST-AT ?auto_3570 ?auto_3575 ) ( AVAILABLE ?auto_3570 ) ( SURFACE-AT ?auto_3551 ?auto_3575 ) ( ON ?auto_3551 ?auto_3566 ) ( CLEAR ?auto_3551 ) ( TRUCK-AT ?auto_3560 ?auto_3561 ) ( not ( = ?auto_3550 ?auto_3551 ) ) ( not ( = ?auto_3550 ?auto_3566 ) ) ( not ( = ?auto_3551 ?auto_3566 ) ) ( not ( = ?auto_3562 ?auto_3570 ) ) ( not ( = ?auto_3550 ?auto_3552 ) ) ( not ( = ?auto_3550 ?auto_3573 ) ) ( not ( = ?auto_3552 ?auto_3566 ) ) ( not ( = ?auto_3574 ?auto_3575 ) ) ( not ( = ?auto_3576 ?auto_3570 ) ) ( not ( = ?auto_3573 ?auto_3566 ) ) ( not ( = ?auto_3550 ?auto_3553 ) ) ( not ( = ?auto_3550 ?auto_3568 ) ) ( not ( = ?auto_3551 ?auto_3553 ) ) ( not ( = ?auto_3551 ?auto_3568 ) ) ( not ( = ?auto_3553 ?auto_3573 ) ) ( not ( = ?auto_3553 ?auto_3566 ) ) ( not ( = ?auto_3567 ?auto_3574 ) ) ( not ( = ?auto_3567 ?auto_3575 ) ) ( not ( = ?auto_3572 ?auto_3576 ) ) ( not ( = ?auto_3572 ?auto_3570 ) ) ( not ( = ?auto_3568 ?auto_3573 ) ) ( not ( = ?auto_3568 ?auto_3566 ) ) ( not ( = ?auto_3550 ?auto_3554 ) ) ( not ( = ?auto_3550 ?auto_3564 ) ) ( not ( = ?auto_3551 ?auto_3554 ) ) ( not ( = ?auto_3551 ?auto_3564 ) ) ( not ( = ?auto_3552 ?auto_3554 ) ) ( not ( = ?auto_3552 ?auto_3564 ) ) ( not ( = ?auto_3554 ?auto_3568 ) ) ( not ( = ?auto_3554 ?auto_3573 ) ) ( not ( = ?auto_3554 ?auto_3566 ) ) ( not ( = ?auto_3563 ?auto_3567 ) ) ( not ( = ?auto_3563 ?auto_3574 ) ) ( not ( = ?auto_3563 ?auto_3575 ) ) ( not ( = ?auto_3565 ?auto_3572 ) ) ( not ( = ?auto_3565 ?auto_3576 ) ) ( not ( = ?auto_3565 ?auto_3570 ) ) ( not ( = ?auto_3564 ?auto_3568 ) ) ( not ( = ?auto_3564 ?auto_3573 ) ) ( not ( = ?auto_3564 ?auto_3566 ) ) ( not ( = ?auto_3550 ?auto_3555 ) ) ( not ( = ?auto_3550 ?auto_3569 ) ) ( not ( = ?auto_3551 ?auto_3555 ) ) ( not ( = ?auto_3551 ?auto_3569 ) ) ( not ( = ?auto_3552 ?auto_3555 ) ) ( not ( = ?auto_3552 ?auto_3569 ) ) ( not ( = ?auto_3553 ?auto_3555 ) ) ( not ( = ?auto_3553 ?auto_3569 ) ) ( not ( = ?auto_3555 ?auto_3564 ) ) ( not ( = ?auto_3555 ?auto_3568 ) ) ( not ( = ?auto_3555 ?auto_3573 ) ) ( not ( = ?auto_3555 ?auto_3566 ) ) ( not ( = ?auto_3571 ?auto_3563 ) ) ( not ( = ?auto_3571 ?auto_3567 ) ) ( not ( = ?auto_3571 ?auto_3574 ) ) ( not ( = ?auto_3571 ?auto_3575 ) ) ( not ( = ?auto_3577 ?auto_3565 ) ) ( not ( = ?auto_3577 ?auto_3572 ) ) ( not ( = ?auto_3577 ?auto_3576 ) ) ( not ( = ?auto_3577 ?auto_3570 ) ) ( not ( = ?auto_3569 ?auto_3564 ) ) ( not ( = ?auto_3569 ?auto_3568 ) ) ( not ( = ?auto_3569 ?auto_3573 ) ) ( not ( = ?auto_3569 ?auto_3566 ) ) ( not ( = ?auto_3550 ?auto_3556 ) ) ( not ( = ?auto_3550 ?auto_3558 ) ) ( not ( = ?auto_3551 ?auto_3556 ) ) ( not ( = ?auto_3551 ?auto_3558 ) ) ( not ( = ?auto_3552 ?auto_3556 ) ) ( not ( = ?auto_3552 ?auto_3558 ) ) ( not ( = ?auto_3553 ?auto_3556 ) ) ( not ( = ?auto_3553 ?auto_3558 ) ) ( not ( = ?auto_3554 ?auto_3556 ) ) ( not ( = ?auto_3554 ?auto_3558 ) ) ( not ( = ?auto_3556 ?auto_3569 ) ) ( not ( = ?auto_3556 ?auto_3564 ) ) ( not ( = ?auto_3556 ?auto_3568 ) ) ( not ( = ?auto_3556 ?auto_3573 ) ) ( not ( = ?auto_3556 ?auto_3566 ) ) ( not ( = ?auto_3557 ?auto_3571 ) ) ( not ( = ?auto_3557 ?auto_3563 ) ) ( not ( = ?auto_3557 ?auto_3567 ) ) ( not ( = ?auto_3557 ?auto_3574 ) ) ( not ( = ?auto_3557 ?auto_3575 ) ) ( not ( = ?auto_3559 ?auto_3577 ) ) ( not ( = ?auto_3559 ?auto_3565 ) ) ( not ( = ?auto_3559 ?auto_3572 ) ) ( not ( = ?auto_3559 ?auto_3576 ) ) ( not ( = ?auto_3559 ?auto_3570 ) ) ( not ( = ?auto_3558 ?auto_3569 ) ) ( not ( = ?auto_3558 ?auto_3564 ) ) ( not ( = ?auto_3558 ?auto_3568 ) ) ( not ( = ?auto_3558 ?auto_3573 ) ) ( not ( = ?auto_3558 ?auto_3566 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_3550 ?auto_3551 ?auto_3552 ?auto_3553 ?auto_3554 ?auto_3555 )
      ( MAKE-1CRATE ?auto_3555 ?auto_3556 )
      ( MAKE-6CRATE-VERIFY ?auto_3550 ?auto_3551 ?auto_3552 ?auto_3553 ?auto_3554 ?auto_3555 ?auto_3556 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_3596 - SURFACE
      ?auto_3597 - SURFACE
      ?auto_3598 - SURFACE
      ?auto_3599 - SURFACE
      ?auto_3600 - SURFACE
      ?auto_3601 - SURFACE
      ?auto_3602 - SURFACE
      ?auto_3603 - SURFACE
    )
    :vars
    (
      ?auto_3606 - HOIST
      ?auto_3605 - PLACE
      ?auto_3604 - PLACE
      ?auto_3607 - HOIST
      ?auto_3608 - SURFACE
      ?auto_3616 - PLACE
      ?auto_3620 - HOIST
      ?auto_3617 - SURFACE
      ?auto_3626 - PLACE
      ?auto_3622 - HOIST
      ?auto_3624 - SURFACE
      ?auto_3614 - PLACE
      ?auto_3611 - HOIST
      ?auto_3613 - SURFACE
      ?auto_3610 - PLACE
      ?auto_3612 - HOIST
      ?auto_3621 - SURFACE
      ?auto_3625 - PLACE
      ?auto_3619 - HOIST
      ?auto_3627 - SURFACE
      ?auto_3615 - PLACE
      ?auto_3618 - HOIST
      ?auto_3623 - SURFACE
      ?auto_3609 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3606 ?auto_3605 ) ( IS-CRATE ?auto_3603 ) ( not ( = ?auto_3604 ?auto_3605 ) ) ( HOIST-AT ?auto_3607 ?auto_3604 ) ( AVAILABLE ?auto_3607 ) ( SURFACE-AT ?auto_3603 ?auto_3604 ) ( ON ?auto_3603 ?auto_3608 ) ( CLEAR ?auto_3603 ) ( not ( = ?auto_3602 ?auto_3603 ) ) ( not ( = ?auto_3602 ?auto_3608 ) ) ( not ( = ?auto_3603 ?auto_3608 ) ) ( not ( = ?auto_3606 ?auto_3607 ) ) ( IS-CRATE ?auto_3602 ) ( not ( = ?auto_3616 ?auto_3605 ) ) ( HOIST-AT ?auto_3620 ?auto_3616 ) ( AVAILABLE ?auto_3620 ) ( SURFACE-AT ?auto_3602 ?auto_3616 ) ( ON ?auto_3602 ?auto_3617 ) ( CLEAR ?auto_3602 ) ( not ( = ?auto_3601 ?auto_3602 ) ) ( not ( = ?auto_3601 ?auto_3617 ) ) ( not ( = ?auto_3602 ?auto_3617 ) ) ( not ( = ?auto_3606 ?auto_3620 ) ) ( IS-CRATE ?auto_3601 ) ( not ( = ?auto_3626 ?auto_3605 ) ) ( HOIST-AT ?auto_3622 ?auto_3626 ) ( AVAILABLE ?auto_3622 ) ( SURFACE-AT ?auto_3601 ?auto_3626 ) ( ON ?auto_3601 ?auto_3624 ) ( CLEAR ?auto_3601 ) ( not ( = ?auto_3600 ?auto_3601 ) ) ( not ( = ?auto_3600 ?auto_3624 ) ) ( not ( = ?auto_3601 ?auto_3624 ) ) ( not ( = ?auto_3606 ?auto_3622 ) ) ( IS-CRATE ?auto_3600 ) ( not ( = ?auto_3614 ?auto_3605 ) ) ( HOIST-AT ?auto_3611 ?auto_3614 ) ( AVAILABLE ?auto_3611 ) ( SURFACE-AT ?auto_3600 ?auto_3614 ) ( ON ?auto_3600 ?auto_3613 ) ( CLEAR ?auto_3600 ) ( not ( = ?auto_3599 ?auto_3600 ) ) ( not ( = ?auto_3599 ?auto_3613 ) ) ( not ( = ?auto_3600 ?auto_3613 ) ) ( not ( = ?auto_3606 ?auto_3611 ) ) ( IS-CRATE ?auto_3599 ) ( not ( = ?auto_3610 ?auto_3605 ) ) ( HOIST-AT ?auto_3612 ?auto_3610 ) ( AVAILABLE ?auto_3612 ) ( SURFACE-AT ?auto_3599 ?auto_3610 ) ( ON ?auto_3599 ?auto_3621 ) ( CLEAR ?auto_3599 ) ( not ( = ?auto_3598 ?auto_3599 ) ) ( not ( = ?auto_3598 ?auto_3621 ) ) ( not ( = ?auto_3599 ?auto_3621 ) ) ( not ( = ?auto_3606 ?auto_3612 ) ) ( IS-CRATE ?auto_3598 ) ( not ( = ?auto_3625 ?auto_3605 ) ) ( HOIST-AT ?auto_3619 ?auto_3625 ) ( AVAILABLE ?auto_3619 ) ( SURFACE-AT ?auto_3598 ?auto_3625 ) ( ON ?auto_3598 ?auto_3627 ) ( CLEAR ?auto_3598 ) ( not ( = ?auto_3597 ?auto_3598 ) ) ( not ( = ?auto_3597 ?auto_3627 ) ) ( not ( = ?auto_3598 ?auto_3627 ) ) ( not ( = ?auto_3606 ?auto_3619 ) ) ( SURFACE-AT ?auto_3596 ?auto_3605 ) ( CLEAR ?auto_3596 ) ( IS-CRATE ?auto_3597 ) ( AVAILABLE ?auto_3606 ) ( not ( = ?auto_3615 ?auto_3605 ) ) ( HOIST-AT ?auto_3618 ?auto_3615 ) ( AVAILABLE ?auto_3618 ) ( SURFACE-AT ?auto_3597 ?auto_3615 ) ( ON ?auto_3597 ?auto_3623 ) ( CLEAR ?auto_3597 ) ( TRUCK-AT ?auto_3609 ?auto_3605 ) ( not ( = ?auto_3596 ?auto_3597 ) ) ( not ( = ?auto_3596 ?auto_3623 ) ) ( not ( = ?auto_3597 ?auto_3623 ) ) ( not ( = ?auto_3606 ?auto_3618 ) ) ( not ( = ?auto_3596 ?auto_3598 ) ) ( not ( = ?auto_3596 ?auto_3627 ) ) ( not ( = ?auto_3598 ?auto_3623 ) ) ( not ( = ?auto_3625 ?auto_3615 ) ) ( not ( = ?auto_3619 ?auto_3618 ) ) ( not ( = ?auto_3627 ?auto_3623 ) ) ( not ( = ?auto_3596 ?auto_3599 ) ) ( not ( = ?auto_3596 ?auto_3621 ) ) ( not ( = ?auto_3597 ?auto_3599 ) ) ( not ( = ?auto_3597 ?auto_3621 ) ) ( not ( = ?auto_3599 ?auto_3627 ) ) ( not ( = ?auto_3599 ?auto_3623 ) ) ( not ( = ?auto_3610 ?auto_3625 ) ) ( not ( = ?auto_3610 ?auto_3615 ) ) ( not ( = ?auto_3612 ?auto_3619 ) ) ( not ( = ?auto_3612 ?auto_3618 ) ) ( not ( = ?auto_3621 ?auto_3627 ) ) ( not ( = ?auto_3621 ?auto_3623 ) ) ( not ( = ?auto_3596 ?auto_3600 ) ) ( not ( = ?auto_3596 ?auto_3613 ) ) ( not ( = ?auto_3597 ?auto_3600 ) ) ( not ( = ?auto_3597 ?auto_3613 ) ) ( not ( = ?auto_3598 ?auto_3600 ) ) ( not ( = ?auto_3598 ?auto_3613 ) ) ( not ( = ?auto_3600 ?auto_3621 ) ) ( not ( = ?auto_3600 ?auto_3627 ) ) ( not ( = ?auto_3600 ?auto_3623 ) ) ( not ( = ?auto_3614 ?auto_3610 ) ) ( not ( = ?auto_3614 ?auto_3625 ) ) ( not ( = ?auto_3614 ?auto_3615 ) ) ( not ( = ?auto_3611 ?auto_3612 ) ) ( not ( = ?auto_3611 ?auto_3619 ) ) ( not ( = ?auto_3611 ?auto_3618 ) ) ( not ( = ?auto_3613 ?auto_3621 ) ) ( not ( = ?auto_3613 ?auto_3627 ) ) ( not ( = ?auto_3613 ?auto_3623 ) ) ( not ( = ?auto_3596 ?auto_3601 ) ) ( not ( = ?auto_3596 ?auto_3624 ) ) ( not ( = ?auto_3597 ?auto_3601 ) ) ( not ( = ?auto_3597 ?auto_3624 ) ) ( not ( = ?auto_3598 ?auto_3601 ) ) ( not ( = ?auto_3598 ?auto_3624 ) ) ( not ( = ?auto_3599 ?auto_3601 ) ) ( not ( = ?auto_3599 ?auto_3624 ) ) ( not ( = ?auto_3601 ?auto_3613 ) ) ( not ( = ?auto_3601 ?auto_3621 ) ) ( not ( = ?auto_3601 ?auto_3627 ) ) ( not ( = ?auto_3601 ?auto_3623 ) ) ( not ( = ?auto_3626 ?auto_3614 ) ) ( not ( = ?auto_3626 ?auto_3610 ) ) ( not ( = ?auto_3626 ?auto_3625 ) ) ( not ( = ?auto_3626 ?auto_3615 ) ) ( not ( = ?auto_3622 ?auto_3611 ) ) ( not ( = ?auto_3622 ?auto_3612 ) ) ( not ( = ?auto_3622 ?auto_3619 ) ) ( not ( = ?auto_3622 ?auto_3618 ) ) ( not ( = ?auto_3624 ?auto_3613 ) ) ( not ( = ?auto_3624 ?auto_3621 ) ) ( not ( = ?auto_3624 ?auto_3627 ) ) ( not ( = ?auto_3624 ?auto_3623 ) ) ( not ( = ?auto_3596 ?auto_3602 ) ) ( not ( = ?auto_3596 ?auto_3617 ) ) ( not ( = ?auto_3597 ?auto_3602 ) ) ( not ( = ?auto_3597 ?auto_3617 ) ) ( not ( = ?auto_3598 ?auto_3602 ) ) ( not ( = ?auto_3598 ?auto_3617 ) ) ( not ( = ?auto_3599 ?auto_3602 ) ) ( not ( = ?auto_3599 ?auto_3617 ) ) ( not ( = ?auto_3600 ?auto_3602 ) ) ( not ( = ?auto_3600 ?auto_3617 ) ) ( not ( = ?auto_3602 ?auto_3624 ) ) ( not ( = ?auto_3602 ?auto_3613 ) ) ( not ( = ?auto_3602 ?auto_3621 ) ) ( not ( = ?auto_3602 ?auto_3627 ) ) ( not ( = ?auto_3602 ?auto_3623 ) ) ( not ( = ?auto_3616 ?auto_3626 ) ) ( not ( = ?auto_3616 ?auto_3614 ) ) ( not ( = ?auto_3616 ?auto_3610 ) ) ( not ( = ?auto_3616 ?auto_3625 ) ) ( not ( = ?auto_3616 ?auto_3615 ) ) ( not ( = ?auto_3620 ?auto_3622 ) ) ( not ( = ?auto_3620 ?auto_3611 ) ) ( not ( = ?auto_3620 ?auto_3612 ) ) ( not ( = ?auto_3620 ?auto_3619 ) ) ( not ( = ?auto_3620 ?auto_3618 ) ) ( not ( = ?auto_3617 ?auto_3624 ) ) ( not ( = ?auto_3617 ?auto_3613 ) ) ( not ( = ?auto_3617 ?auto_3621 ) ) ( not ( = ?auto_3617 ?auto_3627 ) ) ( not ( = ?auto_3617 ?auto_3623 ) ) ( not ( = ?auto_3596 ?auto_3603 ) ) ( not ( = ?auto_3596 ?auto_3608 ) ) ( not ( = ?auto_3597 ?auto_3603 ) ) ( not ( = ?auto_3597 ?auto_3608 ) ) ( not ( = ?auto_3598 ?auto_3603 ) ) ( not ( = ?auto_3598 ?auto_3608 ) ) ( not ( = ?auto_3599 ?auto_3603 ) ) ( not ( = ?auto_3599 ?auto_3608 ) ) ( not ( = ?auto_3600 ?auto_3603 ) ) ( not ( = ?auto_3600 ?auto_3608 ) ) ( not ( = ?auto_3601 ?auto_3603 ) ) ( not ( = ?auto_3601 ?auto_3608 ) ) ( not ( = ?auto_3603 ?auto_3617 ) ) ( not ( = ?auto_3603 ?auto_3624 ) ) ( not ( = ?auto_3603 ?auto_3613 ) ) ( not ( = ?auto_3603 ?auto_3621 ) ) ( not ( = ?auto_3603 ?auto_3627 ) ) ( not ( = ?auto_3603 ?auto_3623 ) ) ( not ( = ?auto_3604 ?auto_3616 ) ) ( not ( = ?auto_3604 ?auto_3626 ) ) ( not ( = ?auto_3604 ?auto_3614 ) ) ( not ( = ?auto_3604 ?auto_3610 ) ) ( not ( = ?auto_3604 ?auto_3625 ) ) ( not ( = ?auto_3604 ?auto_3615 ) ) ( not ( = ?auto_3607 ?auto_3620 ) ) ( not ( = ?auto_3607 ?auto_3622 ) ) ( not ( = ?auto_3607 ?auto_3611 ) ) ( not ( = ?auto_3607 ?auto_3612 ) ) ( not ( = ?auto_3607 ?auto_3619 ) ) ( not ( = ?auto_3607 ?auto_3618 ) ) ( not ( = ?auto_3608 ?auto_3617 ) ) ( not ( = ?auto_3608 ?auto_3624 ) ) ( not ( = ?auto_3608 ?auto_3613 ) ) ( not ( = ?auto_3608 ?auto_3621 ) ) ( not ( = ?auto_3608 ?auto_3627 ) ) ( not ( = ?auto_3608 ?auto_3623 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_3596 ?auto_3597 ?auto_3598 ?auto_3599 ?auto_3600 ?auto_3601 ?auto_3602 )
      ( MAKE-1CRATE ?auto_3602 ?auto_3603 )
      ( MAKE-7CRATE-VERIFY ?auto_3596 ?auto_3597 ?auto_3598 ?auto_3599 ?auto_3600 ?auto_3601 ?auto_3602 ?auto_3603 ) )
  )

)

