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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3405 - SURFACE
      ?auto_3406 - SURFACE
    )
    :vars
    (
      ?auto_3407 - HOIST
      ?auto_3408 - PLACE
      ?auto_3410 - PLACE
      ?auto_3411 - HOIST
      ?auto_3412 - SURFACE
      ?auto_3409 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3407 ?auto_3408 ) ( SURFACE-AT ?auto_3405 ?auto_3408 ) ( CLEAR ?auto_3405 ) ( IS-CRATE ?auto_3406 ) ( AVAILABLE ?auto_3407 ) ( not ( = ?auto_3410 ?auto_3408 ) ) ( HOIST-AT ?auto_3411 ?auto_3410 ) ( AVAILABLE ?auto_3411 ) ( SURFACE-AT ?auto_3406 ?auto_3410 ) ( ON ?auto_3406 ?auto_3412 ) ( CLEAR ?auto_3406 ) ( TRUCK-AT ?auto_3409 ?auto_3408 ) ( not ( = ?auto_3405 ?auto_3406 ) ) ( not ( = ?auto_3405 ?auto_3412 ) ) ( not ( = ?auto_3406 ?auto_3412 ) ) ( not ( = ?auto_3407 ?auto_3411 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3409 ?auto_3408 ?auto_3410 )
      ( !LIFT ?auto_3411 ?auto_3406 ?auto_3412 ?auto_3410 )
      ( !LOAD ?auto_3411 ?auto_3406 ?auto_3409 ?auto_3410 )
      ( !DRIVE ?auto_3409 ?auto_3410 ?auto_3408 )
      ( !UNLOAD ?auto_3407 ?auto_3406 ?auto_3409 ?auto_3408 )
      ( !DROP ?auto_3407 ?auto_3406 ?auto_3405 ?auto_3408 )
      ( MAKE-1CRATE-VERIFY ?auto_3405 ?auto_3406 ) )
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
      ?auto_3422 - HOIST
      ?auto_3423 - PLACE
      ?auto_3421 - PLACE
      ?auto_3419 - HOIST
      ?auto_3420 - SURFACE
      ?auto_3427 - PLACE
      ?auto_3425 - HOIST
      ?auto_3426 - SURFACE
      ?auto_3424 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3422 ?auto_3423 ) ( IS-CRATE ?auto_3418 ) ( not ( = ?auto_3421 ?auto_3423 ) ) ( HOIST-AT ?auto_3419 ?auto_3421 ) ( AVAILABLE ?auto_3419 ) ( SURFACE-AT ?auto_3418 ?auto_3421 ) ( ON ?auto_3418 ?auto_3420 ) ( CLEAR ?auto_3418 ) ( not ( = ?auto_3417 ?auto_3418 ) ) ( not ( = ?auto_3417 ?auto_3420 ) ) ( not ( = ?auto_3418 ?auto_3420 ) ) ( not ( = ?auto_3422 ?auto_3419 ) ) ( SURFACE-AT ?auto_3416 ?auto_3423 ) ( CLEAR ?auto_3416 ) ( IS-CRATE ?auto_3417 ) ( AVAILABLE ?auto_3422 ) ( not ( = ?auto_3427 ?auto_3423 ) ) ( HOIST-AT ?auto_3425 ?auto_3427 ) ( AVAILABLE ?auto_3425 ) ( SURFACE-AT ?auto_3417 ?auto_3427 ) ( ON ?auto_3417 ?auto_3426 ) ( CLEAR ?auto_3417 ) ( TRUCK-AT ?auto_3424 ?auto_3423 ) ( not ( = ?auto_3416 ?auto_3417 ) ) ( not ( = ?auto_3416 ?auto_3426 ) ) ( not ( = ?auto_3417 ?auto_3426 ) ) ( not ( = ?auto_3422 ?auto_3425 ) ) ( not ( = ?auto_3416 ?auto_3418 ) ) ( not ( = ?auto_3416 ?auto_3420 ) ) ( not ( = ?auto_3418 ?auto_3426 ) ) ( not ( = ?auto_3421 ?auto_3427 ) ) ( not ( = ?auto_3419 ?auto_3425 ) ) ( not ( = ?auto_3420 ?auto_3426 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3416 ?auto_3417 )
      ( MAKE-1CRATE ?auto_3417 ?auto_3418 )
      ( MAKE-2CRATE-VERIFY ?auto_3416 ?auto_3417 ?auto_3418 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3430 - SURFACE
      ?auto_3431 - SURFACE
    )
    :vars
    (
      ?auto_3432 - HOIST
      ?auto_3433 - PLACE
      ?auto_3435 - PLACE
      ?auto_3436 - HOIST
      ?auto_3437 - SURFACE
      ?auto_3434 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3432 ?auto_3433 ) ( SURFACE-AT ?auto_3430 ?auto_3433 ) ( CLEAR ?auto_3430 ) ( IS-CRATE ?auto_3431 ) ( AVAILABLE ?auto_3432 ) ( not ( = ?auto_3435 ?auto_3433 ) ) ( HOIST-AT ?auto_3436 ?auto_3435 ) ( AVAILABLE ?auto_3436 ) ( SURFACE-AT ?auto_3431 ?auto_3435 ) ( ON ?auto_3431 ?auto_3437 ) ( CLEAR ?auto_3431 ) ( TRUCK-AT ?auto_3434 ?auto_3433 ) ( not ( = ?auto_3430 ?auto_3431 ) ) ( not ( = ?auto_3430 ?auto_3437 ) ) ( not ( = ?auto_3431 ?auto_3437 ) ) ( not ( = ?auto_3432 ?auto_3436 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3434 ?auto_3433 ?auto_3435 )
      ( !LIFT ?auto_3436 ?auto_3431 ?auto_3437 ?auto_3435 )
      ( !LOAD ?auto_3436 ?auto_3431 ?auto_3434 ?auto_3435 )
      ( !DRIVE ?auto_3434 ?auto_3435 ?auto_3433 )
      ( !UNLOAD ?auto_3432 ?auto_3431 ?auto_3434 ?auto_3433 )
      ( !DROP ?auto_3432 ?auto_3431 ?auto_3430 ?auto_3433 )
      ( MAKE-1CRATE-VERIFY ?auto_3430 ?auto_3431 ) )
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
      ?auto_3447 - HOIST
      ?auto_3450 - PLACE
      ?auto_3446 - PLACE
      ?auto_3449 - HOIST
      ?auto_3448 - SURFACE
      ?auto_3456 - PLACE
      ?auto_3457 - HOIST
      ?auto_3452 - SURFACE
      ?auto_3454 - PLACE
      ?auto_3453 - HOIST
      ?auto_3455 - SURFACE
      ?auto_3451 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3447 ?auto_3450 ) ( IS-CRATE ?auto_3445 ) ( not ( = ?auto_3446 ?auto_3450 ) ) ( HOIST-AT ?auto_3449 ?auto_3446 ) ( AVAILABLE ?auto_3449 ) ( SURFACE-AT ?auto_3445 ?auto_3446 ) ( ON ?auto_3445 ?auto_3448 ) ( CLEAR ?auto_3445 ) ( not ( = ?auto_3444 ?auto_3445 ) ) ( not ( = ?auto_3444 ?auto_3448 ) ) ( not ( = ?auto_3445 ?auto_3448 ) ) ( not ( = ?auto_3447 ?auto_3449 ) ) ( IS-CRATE ?auto_3444 ) ( not ( = ?auto_3456 ?auto_3450 ) ) ( HOIST-AT ?auto_3457 ?auto_3456 ) ( AVAILABLE ?auto_3457 ) ( SURFACE-AT ?auto_3444 ?auto_3456 ) ( ON ?auto_3444 ?auto_3452 ) ( CLEAR ?auto_3444 ) ( not ( = ?auto_3443 ?auto_3444 ) ) ( not ( = ?auto_3443 ?auto_3452 ) ) ( not ( = ?auto_3444 ?auto_3452 ) ) ( not ( = ?auto_3447 ?auto_3457 ) ) ( SURFACE-AT ?auto_3442 ?auto_3450 ) ( CLEAR ?auto_3442 ) ( IS-CRATE ?auto_3443 ) ( AVAILABLE ?auto_3447 ) ( not ( = ?auto_3454 ?auto_3450 ) ) ( HOIST-AT ?auto_3453 ?auto_3454 ) ( AVAILABLE ?auto_3453 ) ( SURFACE-AT ?auto_3443 ?auto_3454 ) ( ON ?auto_3443 ?auto_3455 ) ( CLEAR ?auto_3443 ) ( TRUCK-AT ?auto_3451 ?auto_3450 ) ( not ( = ?auto_3442 ?auto_3443 ) ) ( not ( = ?auto_3442 ?auto_3455 ) ) ( not ( = ?auto_3443 ?auto_3455 ) ) ( not ( = ?auto_3447 ?auto_3453 ) ) ( not ( = ?auto_3442 ?auto_3444 ) ) ( not ( = ?auto_3442 ?auto_3452 ) ) ( not ( = ?auto_3444 ?auto_3455 ) ) ( not ( = ?auto_3456 ?auto_3454 ) ) ( not ( = ?auto_3457 ?auto_3453 ) ) ( not ( = ?auto_3452 ?auto_3455 ) ) ( not ( = ?auto_3442 ?auto_3445 ) ) ( not ( = ?auto_3442 ?auto_3448 ) ) ( not ( = ?auto_3443 ?auto_3445 ) ) ( not ( = ?auto_3443 ?auto_3448 ) ) ( not ( = ?auto_3445 ?auto_3452 ) ) ( not ( = ?auto_3445 ?auto_3455 ) ) ( not ( = ?auto_3446 ?auto_3456 ) ) ( not ( = ?auto_3446 ?auto_3454 ) ) ( not ( = ?auto_3449 ?auto_3457 ) ) ( not ( = ?auto_3449 ?auto_3453 ) ) ( not ( = ?auto_3448 ?auto_3452 ) ) ( not ( = ?auto_3448 ?auto_3455 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_3442 ?auto_3443 ?auto_3444 )
      ( MAKE-1CRATE ?auto_3444 ?auto_3445 )
      ( MAKE-3CRATE-VERIFY ?auto_3442 ?auto_3443 ?auto_3444 ?auto_3445 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3460 - SURFACE
      ?auto_3461 - SURFACE
    )
    :vars
    (
      ?auto_3462 - HOIST
      ?auto_3463 - PLACE
      ?auto_3465 - PLACE
      ?auto_3466 - HOIST
      ?auto_3467 - SURFACE
      ?auto_3464 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3462 ?auto_3463 ) ( SURFACE-AT ?auto_3460 ?auto_3463 ) ( CLEAR ?auto_3460 ) ( IS-CRATE ?auto_3461 ) ( AVAILABLE ?auto_3462 ) ( not ( = ?auto_3465 ?auto_3463 ) ) ( HOIST-AT ?auto_3466 ?auto_3465 ) ( AVAILABLE ?auto_3466 ) ( SURFACE-AT ?auto_3461 ?auto_3465 ) ( ON ?auto_3461 ?auto_3467 ) ( CLEAR ?auto_3461 ) ( TRUCK-AT ?auto_3464 ?auto_3463 ) ( not ( = ?auto_3460 ?auto_3461 ) ) ( not ( = ?auto_3460 ?auto_3467 ) ) ( not ( = ?auto_3461 ?auto_3467 ) ) ( not ( = ?auto_3462 ?auto_3466 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3464 ?auto_3463 ?auto_3465 )
      ( !LIFT ?auto_3466 ?auto_3461 ?auto_3467 ?auto_3465 )
      ( !LOAD ?auto_3466 ?auto_3461 ?auto_3464 ?auto_3465 )
      ( !DRIVE ?auto_3464 ?auto_3465 ?auto_3463 )
      ( !UNLOAD ?auto_3462 ?auto_3461 ?auto_3464 ?auto_3463 )
      ( !DROP ?auto_3462 ?auto_3461 ?auto_3460 ?auto_3463 )
      ( MAKE-1CRATE-VERIFY ?auto_3460 ?auto_3461 ) )
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
      ?auto_3480 - HOIST
      ?auto_3479 - PLACE
      ?auto_3481 - PLACE
      ?auto_3482 - HOIST
      ?auto_3483 - SURFACE
      ?auto_3492 - PLACE
      ?auto_3485 - HOIST
      ?auto_3484 - SURFACE
      ?auto_3491 - PLACE
      ?auto_3489 - HOIST
      ?auto_3487 - SURFACE
      ?auto_3490 - PLACE
      ?auto_3488 - HOIST
      ?auto_3486 - SURFACE
      ?auto_3478 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3480 ?auto_3479 ) ( IS-CRATE ?auto_3477 ) ( not ( = ?auto_3481 ?auto_3479 ) ) ( HOIST-AT ?auto_3482 ?auto_3481 ) ( AVAILABLE ?auto_3482 ) ( SURFACE-AT ?auto_3477 ?auto_3481 ) ( ON ?auto_3477 ?auto_3483 ) ( CLEAR ?auto_3477 ) ( not ( = ?auto_3476 ?auto_3477 ) ) ( not ( = ?auto_3476 ?auto_3483 ) ) ( not ( = ?auto_3477 ?auto_3483 ) ) ( not ( = ?auto_3480 ?auto_3482 ) ) ( IS-CRATE ?auto_3476 ) ( not ( = ?auto_3492 ?auto_3479 ) ) ( HOIST-AT ?auto_3485 ?auto_3492 ) ( AVAILABLE ?auto_3485 ) ( SURFACE-AT ?auto_3476 ?auto_3492 ) ( ON ?auto_3476 ?auto_3484 ) ( CLEAR ?auto_3476 ) ( not ( = ?auto_3475 ?auto_3476 ) ) ( not ( = ?auto_3475 ?auto_3484 ) ) ( not ( = ?auto_3476 ?auto_3484 ) ) ( not ( = ?auto_3480 ?auto_3485 ) ) ( IS-CRATE ?auto_3475 ) ( not ( = ?auto_3491 ?auto_3479 ) ) ( HOIST-AT ?auto_3489 ?auto_3491 ) ( AVAILABLE ?auto_3489 ) ( SURFACE-AT ?auto_3475 ?auto_3491 ) ( ON ?auto_3475 ?auto_3487 ) ( CLEAR ?auto_3475 ) ( not ( = ?auto_3474 ?auto_3475 ) ) ( not ( = ?auto_3474 ?auto_3487 ) ) ( not ( = ?auto_3475 ?auto_3487 ) ) ( not ( = ?auto_3480 ?auto_3489 ) ) ( SURFACE-AT ?auto_3473 ?auto_3479 ) ( CLEAR ?auto_3473 ) ( IS-CRATE ?auto_3474 ) ( AVAILABLE ?auto_3480 ) ( not ( = ?auto_3490 ?auto_3479 ) ) ( HOIST-AT ?auto_3488 ?auto_3490 ) ( AVAILABLE ?auto_3488 ) ( SURFACE-AT ?auto_3474 ?auto_3490 ) ( ON ?auto_3474 ?auto_3486 ) ( CLEAR ?auto_3474 ) ( TRUCK-AT ?auto_3478 ?auto_3479 ) ( not ( = ?auto_3473 ?auto_3474 ) ) ( not ( = ?auto_3473 ?auto_3486 ) ) ( not ( = ?auto_3474 ?auto_3486 ) ) ( not ( = ?auto_3480 ?auto_3488 ) ) ( not ( = ?auto_3473 ?auto_3475 ) ) ( not ( = ?auto_3473 ?auto_3487 ) ) ( not ( = ?auto_3475 ?auto_3486 ) ) ( not ( = ?auto_3491 ?auto_3490 ) ) ( not ( = ?auto_3489 ?auto_3488 ) ) ( not ( = ?auto_3487 ?auto_3486 ) ) ( not ( = ?auto_3473 ?auto_3476 ) ) ( not ( = ?auto_3473 ?auto_3484 ) ) ( not ( = ?auto_3474 ?auto_3476 ) ) ( not ( = ?auto_3474 ?auto_3484 ) ) ( not ( = ?auto_3476 ?auto_3487 ) ) ( not ( = ?auto_3476 ?auto_3486 ) ) ( not ( = ?auto_3492 ?auto_3491 ) ) ( not ( = ?auto_3492 ?auto_3490 ) ) ( not ( = ?auto_3485 ?auto_3489 ) ) ( not ( = ?auto_3485 ?auto_3488 ) ) ( not ( = ?auto_3484 ?auto_3487 ) ) ( not ( = ?auto_3484 ?auto_3486 ) ) ( not ( = ?auto_3473 ?auto_3477 ) ) ( not ( = ?auto_3473 ?auto_3483 ) ) ( not ( = ?auto_3474 ?auto_3477 ) ) ( not ( = ?auto_3474 ?auto_3483 ) ) ( not ( = ?auto_3475 ?auto_3477 ) ) ( not ( = ?auto_3475 ?auto_3483 ) ) ( not ( = ?auto_3477 ?auto_3484 ) ) ( not ( = ?auto_3477 ?auto_3487 ) ) ( not ( = ?auto_3477 ?auto_3486 ) ) ( not ( = ?auto_3481 ?auto_3492 ) ) ( not ( = ?auto_3481 ?auto_3491 ) ) ( not ( = ?auto_3481 ?auto_3490 ) ) ( not ( = ?auto_3482 ?auto_3485 ) ) ( not ( = ?auto_3482 ?auto_3489 ) ) ( not ( = ?auto_3482 ?auto_3488 ) ) ( not ( = ?auto_3483 ?auto_3484 ) ) ( not ( = ?auto_3483 ?auto_3487 ) ) ( not ( = ?auto_3483 ?auto_3486 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_3473 ?auto_3474 ?auto_3475 ?auto_3476 )
      ( MAKE-1CRATE ?auto_3476 ?auto_3477 )
      ( MAKE-4CRATE-VERIFY ?auto_3473 ?auto_3474 ?auto_3475 ?auto_3476 ?auto_3477 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3495 - SURFACE
      ?auto_3496 - SURFACE
    )
    :vars
    (
      ?auto_3497 - HOIST
      ?auto_3498 - PLACE
      ?auto_3500 - PLACE
      ?auto_3501 - HOIST
      ?auto_3502 - SURFACE
      ?auto_3499 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3497 ?auto_3498 ) ( SURFACE-AT ?auto_3495 ?auto_3498 ) ( CLEAR ?auto_3495 ) ( IS-CRATE ?auto_3496 ) ( AVAILABLE ?auto_3497 ) ( not ( = ?auto_3500 ?auto_3498 ) ) ( HOIST-AT ?auto_3501 ?auto_3500 ) ( AVAILABLE ?auto_3501 ) ( SURFACE-AT ?auto_3496 ?auto_3500 ) ( ON ?auto_3496 ?auto_3502 ) ( CLEAR ?auto_3496 ) ( TRUCK-AT ?auto_3499 ?auto_3498 ) ( not ( = ?auto_3495 ?auto_3496 ) ) ( not ( = ?auto_3495 ?auto_3502 ) ) ( not ( = ?auto_3496 ?auto_3502 ) ) ( not ( = ?auto_3497 ?auto_3501 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3499 ?auto_3498 ?auto_3500 )
      ( !LIFT ?auto_3501 ?auto_3496 ?auto_3502 ?auto_3500 )
      ( !LOAD ?auto_3501 ?auto_3496 ?auto_3499 ?auto_3500 )
      ( !DRIVE ?auto_3499 ?auto_3500 ?auto_3498 )
      ( !UNLOAD ?auto_3497 ?auto_3496 ?auto_3499 ?auto_3498 )
      ( !DROP ?auto_3497 ?auto_3496 ?auto_3495 ?auto_3498 )
      ( MAKE-1CRATE-VERIFY ?auto_3495 ?auto_3496 ) )
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
      ?auto_3518 - HOIST
      ?auto_3516 - PLACE
      ?auto_3520 - PLACE
      ?auto_3517 - HOIST
      ?auto_3515 - SURFACE
      ?auto_3531 - PLACE
      ?auto_3525 - HOIST
      ?auto_3526 - SURFACE
      ?auto_3522 - PLACE
      ?auto_3523 - HOIST
      ?auto_3529 - SURFACE
      ?auto_3521 - PLACE
      ?auto_3530 - HOIST
      ?auto_3524 - SURFACE
      ?auto_3528 - PLACE
      ?auto_3527 - HOIST
      ?auto_3532 - SURFACE
      ?auto_3519 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3518 ?auto_3516 ) ( IS-CRATE ?auto_3514 ) ( not ( = ?auto_3520 ?auto_3516 ) ) ( HOIST-AT ?auto_3517 ?auto_3520 ) ( AVAILABLE ?auto_3517 ) ( SURFACE-AT ?auto_3514 ?auto_3520 ) ( ON ?auto_3514 ?auto_3515 ) ( CLEAR ?auto_3514 ) ( not ( = ?auto_3513 ?auto_3514 ) ) ( not ( = ?auto_3513 ?auto_3515 ) ) ( not ( = ?auto_3514 ?auto_3515 ) ) ( not ( = ?auto_3518 ?auto_3517 ) ) ( IS-CRATE ?auto_3513 ) ( not ( = ?auto_3531 ?auto_3516 ) ) ( HOIST-AT ?auto_3525 ?auto_3531 ) ( AVAILABLE ?auto_3525 ) ( SURFACE-AT ?auto_3513 ?auto_3531 ) ( ON ?auto_3513 ?auto_3526 ) ( CLEAR ?auto_3513 ) ( not ( = ?auto_3512 ?auto_3513 ) ) ( not ( = ?auto_3512 ?auto_3526 ) ) ( not ( = ?auto_3513 ?auto_3526 ) ) ( not ( = ?auto_3518 ?auto_3525 ) ) ( IS-CRATE ?auto_3512 ) ( not ( = ?auto_3522 ?auto_3516 ) ) ( HOIST-AT ?auto_3523 ?auto_3522 ) ( AVAILABLE ?auto_3523 ) ( SURFACE-AT ?auto_3512 ?auto_3522 ) ( ON ?auto_3512 ?auto_3529 ) ( CLEAR ?auto_3512 ) ( not ( = ?auto_3511 ?auto_3512 ) ) ( not ( = ?auto_3511 ?auto_3529 ) ) ( not ( = ?auto_3512 ?auto_3529 ) ) ( not ( = ?auto_3518 ?auto_3523 ) ) ( IS-CRATE ?auto_3511 ) ( not ( = ?auto_3521 ?auto_3516 ) ) ( HOIST-AT ?auto_3530 ?auto_3521 ) ( AVAILABLE ?auto_3530 ) ( SURFACE-AT ?auto_3511 ?auto_3521 ) ( ON ?auto_3511 ?auto_3524 ) ( CLEAR ?auto_3511 ) ( not ( = ?auto_3510 ?auto_3511 ) ) ( not ( = ?auto_3510 ?auto_3524 ) ) ( not ( = ?auto_3511 ?auto_3524 ) ) ( not ( = ?auto_3518 ?auto_3530 ) ) ( SURFACE-AT ?auto_3509 ?auto_3516 ) ( CLEAR ?auto_3509 ) ( IS-CRATE ?auto_3510 ) ( AVAILABLE ?auto_3518 ) ( not ( = ?auto_3528 ?auto_3516 ) ) ( HOIST-AT ?auto_3527 ?auto_3528 ) ( AVAILABLE ?auto_3527 ) ( SURFACE-AT ?auto_3510 ?auto_3528 ) ( ON ?auto_3510 ?auto_3532 ) ( CLEAR ?auto_3510 ) ( TRUCK-AT ?auto_3519 ?auto_3516 ) ( not ( = ?auto_3509 ?auto_3510 ) ) ( not ( = ?auto_3509 ?auto_3532 ) ) ( not ( = ?auto_3510 ?auto_3532 ) ) ( not ( = ?auto_3518 ?auto_3527 ) ) ( not ( = ?auto_3509 ?auto_3511 ) ) ( not ( = ?auto_3509 ?auto_3524 ) ) ( not ( = ?auto_3511 ?auto_3532 ) ) ( not ( = ?auto_3521 ?auto_3528 ) ) ( not ( = ?auto_3530 ?auto_3527 ) ) ( not ( = ?auto_3524 ?auto_3532 ) ) ( not ( = ?auto_3509 ?auto_3512 ) ) ( not ( = ?auto_3509 ?auto_3529 ) ) ( not ( = ?auto_3510 ?auto_3512 ) ) ( not ( = ?auto_3510 ?auto_3529 ) ) ( not ( = ?auto_3512 ?auto_3524 ) ) ( not ( = ?auto_3512 ?auto_3532 ) ) ( not ( = ?auto_3522 ?auto_3521 ) ) ( not ( = ?auto_3522 ?auto_3528 ) ) ( not ( = ?auto_3523 ?auto_3530 ) ) ( not ( = ?auto_3523 ?auto_3527 ) ) ( not ( = ?auto_3529 ?auto_3524 ) ) ( not ( = ?auto_3529 ?auto_3532 ) ) ( not ( = ?auto_3509 ?auto_3513 ) ) ( not ( = ?auto_3509 ?auto_3526 ) ) ( not ( = ?auto_3510 ?auto_3513 ) ) ( not ( = ?auto_3510 ?auto_3526 ) ) ( not ( = ?auto_3511 ?auto_3513 ) ) ( not ( = ?auto_3511 ?auto_3526 ) ) ( not ( = ?auto_3513 ?auto_3529 ) ) ( not ( = ?auto_3513 ?auto_3524 ) ) ( not ( = ?auto_3513 ?auto_3532 ) ) ( not ( = ?auto_3531 ?auto_3522 ) ) ( not ( = ?auto_3531 ?auto_3521 ) ) ( not ( = ?auto_3531 ?auto_3528 ) ) ( not ( = ?auto_3525 ?auto_3523 ) ) ( not ( = ?auto_3525 ?auto_3530 ) ) ( not ( = ?auto_3525 ?auto_3527 ) ) ( not ( = ?auto_3526 ?auto_3529 ) ) ( not ( = ?auto_3526 ?auto_3524 ) ) ( not ( = ?auto_3526 ?auto_3532 ) ) ( not ( = ?auto_3509 ?auto_3514 ) ) ( not ( = ?auto_3509 ?auto_3515 ) ) ( not ( = ?auto_3510 ?auto_3514 ) ) ( not ( = ?auto_3510 ?auto_3515 ) ) ( not ( = ?auto_3511 ?auto_3514 ) ) ( not ( = ?auto_3511 ?auto_3515 ) ) ( not ( = ?auto_3512 ?auto_3514 ) ) ( not ( = ?auto_3512 ?auto_3515 ) ) ( not ( = ?auto_3514 ?auto_3526 ) ) ( not ( = ?auto_3514 ?auto_3529 ) ) ( not ( = ?auto_3514 ?auto_3524 ) ) ( not ( = ?auto_3514 ?auto_3532 ) ) ( not ( = ?auto_3520 ?auto_3531 ) ) ( not ( = ?auto_3520 ?auto_3522 ) ) ( not ( = ?auto_3520 ?auto_3521 ) ) ( not ( = ?auto_3520 ?auto_3528 ) ) ( not ( = ?auto_3517 ?auto_3525 ) ) ( not ( = ?auto_3517 ?auto_3523 ) ) ( not ( = ?auto_3517 ?auto_3530 ) ) ( not ( = ?auto_3517 ?auto_3527 ) ) ( not ( = ?auto_3515 ?auto_3526 ) ) ( not ( = ?auto_3515 ?auto_3529 ) ) ( not ( = ?auto_3515 ?auto_3524 ) ) ( not ( = ?auto_3515 ?auto_3532 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_3509 ?auto_3510 ?auto_3511 ?auto_3512 ?auto_3513 )
      ( MAKE-1CRATE ?auto_3513 ?auto_3514 )
      ( MAKE-5CRATE-VERIFY ?auto_3509 ?auto_3510 ?auto_3511 ?auto_3512 ?auto_3513 ?auto_3514 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3535 - SURFACE
      ?auto_3536 - SURFACE
    )
    :vars
    (
      ?auto_3537 - HOIST
      ?auto_3538 - PLACE
      ?auto_3540 - PLACE
      ?auto_3541 - HOIST
      ?auto_3542 - SURFACE
      ?auto_3539 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3537 ?auto_3538 ) ( SURFACE-AT ?auto_3535 ?auto_3538 ) ( CLEAR ?auto_3535 ) ( IS-CRATE ?auto_3536 ) ( AVAILABLE ?auto_3537 ) ( not ( = ?auto_3540 ?auto_3538 ) ) ( HOIST-AT ?auto_3541 ?auto_3540 ) ( AVAILABLE ?auto_3541 ) ( SURFACE-AT ?auto_3536 ?auto_3540 ) ( ON ?auto_3536 ?auto_3542 ) ( CLEAR ?auto_3536 ) ( TRUCK-AT ?auto_3539 ?auto_3538 ) ( not ( = ?auto_3535 ?auto_3536 ) ) ( not ( = ?auto_3535 ?auto_3542 ) ) ( not ( = ?auto_3536 ?auto_3542 ) ) ( not ( = ?auto_3537 ?auto_3541 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3539 ?auto_3538 ?auto_3540 )
      ( !LIFT ?auto_3541 ?auto_3536 ?auto_3542 ?auto_3540 )
      ( !LOAD ?auto_3541 ?auto_3536 ?auto_3539 ?auto_3540 )
      ( !DRIVE ?auto_3539 ?auto_3540 ?auto_3538 )
      ( !UNLOAD ?auto_3537 ?auto_3536 ?auto_3539 ?auto_3538 )
      ( !DROP ?auto_3537 ?auto_3536 ?auto_3535 ?auto_3538 )
      ( MAKE-1CRATE-VERIFY ?auto_3535 ?auto_3536 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_3550 - SURFACE
      ?auto_3551 - SURFACE
      ?auto_3552 - SURFACE
      ?auto_3553 - SURFACE
      ?auto_3554 - SURFACE
      ?auto_3556 - SURFACE
      ?auto_3555 - SURFACE
    )
    :vars
    (
      ?auto_3557 - HOIST
      ?auto_3558 - PLACE
      ?auto_3560 - PLACE
      ?auto_3559 - HOIST
      ?auto_3562 - SURFACE
      ?auto_3565 - PLACE
      ?auto_3563 - HOIST
      ?auto_3564 - SURFACE
      ?auto_3576 - PLACE
      ?auto_3570 - HOIST
      ?auto_3569 - SURFACE
      ?auto_3567 - PLACE
      ?auto_3573 - HOIST
      ?auto_3574 - SURFACE
      ?auto_3577 - PLACE
      ?auto_3568 - HOIST
      ?auto_3566 - SURFACE
      ?auto_3571 - PLACE
      ?auto_3572 - HOIST
      ?auto_3575 - SURFACE
      ?auto_3561 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3557 ?auto_3558 ) ( IS-CRATE ?auto_3555 ) ( not ( = ?auto_3560 ?auto_3558 ) ) ( HOIST-AT ?auto_3559 ?auto_3560 ) ( AVAILABLE ?auto_3559 ) ( SURFACE-AT ?auto_3555 ?auto_3560 ) ( ON ?auto_3555 ?auto_3562 ) ( CLEAR ?auto_3555 ) ( not ( = ?auto_3556 ?auto_3555 ) ) ( not ( = ?auto_3556 ?auto_3562 ) ) ( not ( = ?auto_3555 ?auto_3562 ) ) ( not ( = ?auto_3557 ?auto_3559 ) ) ( IS-CRATE ?auto_3556 ) ( not ( = ?auto_3565 ?auto_3558 ) ) ( HOIST-AT ?auto_3563 ?auto_3565 ) ( AVAILABLE ?auto_3563 ) ( SURFACE-AT ?auto_3556 ?auto_3565 ) ( ON ?auto_3556 ?auto_3564 ) ( CLEAR ?auto_3556 ) ( not ( = ?auto_3554 ?auto_3556 ) ) ( not ( = ?auto_3554 ?auto_3564 ) ) ( not ( = ?auto_3556 ?auto_3564 ) ) ( not ( = ?auto_3557 ?auto_3563 ) ) ( IS-CRATE ?auto_3554 ) ( not ( = ?auto_3576 ?auto_3558 ) ) ( HOIST-AT ?auto_3570 ?auto_3576 ) ( AVAILABLE ?auto_3570 ) ( SURFACE-AT ?auto_3554 ?auto_3576 ) ( ON ?auto_3554 ?auto_3569 ) ( CLEAR ?auto_3554 ) ( not ( = ?auto_3553 ?auto_3554 ) ) ( not ( = ?auto_3553 ?auto_3569 ) ) ( not ( = ?auto_3554 ?auto_3569 ) ) ( not ( = ?auto_3557 ?auto_3570 ) ) ( IS-CRATE ?auto_3553 ) ( not ( = ?auto_3567 ?auto_3558 ) ) ( HOIST-AT ?auto_3573 ?auto_3567 ) ( AVAILABLE ?auto_3573 ) ( SURFACE-AT ?auto_3553 ?auto_3567 ) ( ON ?auto_3553 ?auto_3574 ) ( CLEAR ?auto_3553 ) ( not ( = ?auto_3552 ?auto_3553 ) ) ( not ( = ?auto_3552 ?auto_3574 ) ) ( not ( = ?auto_3553 ?auto_3574 ) ) ( not ( = ?auto_3557 ?auto_3573 ) ) ( IS-CRATE ?auto_3552 ) ( not ( = ?auto_3577 ?auto_3558 ) ) ( HOIST-AT ?auto_3568 ?auto_3577 ) ( AVAILABLE ?auto_3568 ) ( SURFACE-AT ?auto_3552 ?auto_3577 ) ( ON ?auto_3552 ?auto_3566 ) ( CLEAR ?auto_3552 ) ( not ( = ?auto_3551 ?auto_3552 ) ) ( not ( = ?auto_3551 ?auto_3566 ) ) ( not ( = ?auto_3552 ?auto_3566 ) ) ( not ( = ?auto_3557 ?auto_3568 ) ) ( SURFACE-AT ?auto_3550 ?auto_3558 ) ( CLEAR ?auto_3550 ) ( IS-CRATE ?auto_3551 ) ( AVAILABLE ?auto_3557 ) ( not ( = ?auto_3571 ?auto_3558 ) ) ( HOIST-AT ?auto_3572 ?auto_3571 ) ( AVAILABLE ?auto_3572 ) ( SURFACE-AT ?auto_3551 ?auto_3571 ) ( ON ?auto_3551 ?auto_3575 ) ( CLEAR ?auto_3551 ) ( TRUCK-AT ?auto_3561 ?auto_3558 ) ( not ( = ?auto_3550 ?auto_3551 ) ) ( not ( = ?auto_3550 ?auto_3575 ) ) ( not ( = ?auto_3551 ?auto_3575 ) ) ( not ( = ?auto_3557 ?auto_3572 ) ) ( not ( = ?auto_3550 ?auto_3552 ) ) ( not ( = ?auto_3550 ?auto_3566 ) ) ( not ( = ?auto_3552 ?auto_3575 ) ) ( not ( = ?auto_3577 ?auto_3571 ) ) ( not ( = ?auto_3568 ?auto_3572 ) ) ( not ( = ?auto_3566 ?auto_3575 ) ) ( not ( = ?auto_3550 ?auto_3553 ) ) ( not ( = ?auto_3550 ?auto_3574 ) ) ( not ( = ?auto_3551 ?auto_3553 ) ) ( not ( = ?auto_3551 ?auto_3574 ) ) ( not ( = ?auto_3553 ?auto_3566 ) ) ( not ( = ?auto_3553 ?auto_3575 ) ) ( not ( = ?auto_3567 ?auto_3577 ) ) ( not ( = ?auto_3567 ?auto_3571 ) ) ( not ( = ?auto_3573 ?auto_3568 ) ) ( not ( = ?auto_3573 ?auto_3572 ) ) ( not ( = ?auto_3574 ?auto_3566 ) ) ( not ( = ?auto_3574 ?auto_3575 ) ) ( not ( = ?auto_3550 ?auto_3554 ) ) ( not ( = ?auto_3550 ?auto_3569 ) ) ( not ( = ?auto_3551 ?auto_3554 ) ) ( not ( = ?auto_3551 ?auto_3569 ) ) ( not ( = ?auto_3552 ?auto_3554 ) ) ( not ( = ?auto_3552 ?auto_3569 ) ) ( not ( = ?auto_3554 ?auto_3574 ) ) ( not ( = ?auto_3554 ?auto_3566 ) ) ( not ( = ?auto_3554 ?auto_3575 ) ) ( not ( = ?auto_3576 ?auto_3567 ) ) ( not ( = ?auto_3576 ?auto_3577 ) ) ( not ( = ?auto_3576 ?auto_3571 ) ) ( not ( = ?auto_3570 ?auto_3573 ) ) ( not ( = ?auto_3570 ?auto_3568 ) ) ( not ( = ?auto_3570 ?auto_3572 ) ) ( not ( = ?auto_3569 ?auto_3574 ) ) ( not ( = ?auto_3569 ?auto_3566 ) ) ( not ( = ?auto_3569 ?auto_3575 ) ) ( not ( = ?auto_3550 ?auto_3556 ) ) ( not ( = ?auto_3550 ?auto_3564 ) ) ( not ( = ?auto_3551 ?auto_3556 ) ) ( not ( = ?auto_3551 ?auto_3564 ) ) ( not ( = ?auto_3552 ?auto_3556 ) ) ( not ( = ?auto_3552 ?auto_3564 ) ) ( not ( = ?auto_3553 ?auto_3556 ) ) ( not ( = ?auto_3553 ?auto_3564 ) ) ( not ( = ?auto_3556 ?auto_3569 ) ) ( not ( = ?auto_3556 ?auto_3574 ) ) ( not ( = ?auto_3556 ?auto_3566 ) ) ( not ( = ?auto_3556 ?auto_3575 ) ) ( not ( = ?auto_3565 ?auto_3576 ) ) ( not ( = ?auto_3565 ?auto_3567 ) ) ( not ( = ?auto_3565 ?auto_3577 ) ) ( not ( = ?auto_3565 ?auto_3571 ) ) ( not ( = ?auto_3563 ?auto_3570 ) ) ( not ( = ?auto_3563 ?auto_3573 ) ) ( not ( = ?auto_3563 ?auto_3568 ) ) ( not ( = ?auto_3563 ?auto_3572 ) ) ( not ( = ?auto_3564 ?auto_3569 ) ) ( not ( = ?auto_3564 ?auto_3574 ) ) ( not ( = ?auto_3564 ?auto_3566 ) ) ( not ( = ?auto_3564 ?auto_3575 ) ) ( not ( = ?auto_3550 ?auto_3555 ) ) ( not ( = ?auto_3550 ?auto_3562 ) ) ( not ( = ?auto_3551 ?auto_3555 ) ) ( not ( = ?auto_3551 ?auto_3562 ) ) ( not ( = ?auto_3552 ?auto_3555 ) ) ( not ( = ?auto_3552 ?auto_3562 ) ) ( not ( = ?auto_3553 ?auto_3555 ) ) ( not ( = ?auto_3553 ?auto_3562 ) ) ( not ( = ?auto_3554 ?auto_3555 ) ) ( not ( = ?auto_3554 ?auto_3562 ) ) ( not ( = ?auto_3555 ?auto_3564 ) ) ( not ( = ?auto_3555 ?auto_3569 ) ) ( not ( = ?auto_3555 ?auto_3574 ) ) ( not ( = ?auto_3555 ?auto_3566 ) ) ( not ( = ?auto_3555 ?auto_3575 ) ) ( not ( = ?auto_3560 ?auto_3565 ) ) ( not ( = ?auto_3560 ?auto_3576 ) ) ( not ( = ?auto_3560 ?auto_3567 ) ) ( not ( = ?auto_3560 ?auto_3577 ) ) ( not ( = ?auto_3560 ?auto_3571 ) ) ( not ( = ?auto_3559 ?auto_3563 ) ) ( not ( = ?auto_3559 ?auto_3570 ) ) ( not ( = ?auto_3559 ?auto_3573 ) ) ( not ( = ?auto_3559 ?auto_3568 ) ) ( not ( = ?auto_3559 ?auto_3572 ) ) ( not ( = ?auto_3562 ?auto_3564 ) ) ( not ( = ?auto_3562 ?auto_3569 ) ) ( not ( = ?auto_3562 ?auto_3574 ) ) ( not ( = ?auto_3562 ?auto_3566 ) ) ( not ( = ?auto_3562 ?auto_3575 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_3550 ?auto_3551 ?auto_3552 ?auto_3553 ?auto_3554 ?auto_3556 )
      ( MAKE-1CRATE ?auto_3556 ?auto_3555 )
      ( MAKE-6CRATE-VERIFY ?auto_3550 ?auto_3551 ?auto_3552 ?auto_3553 ?auto_3554 ?auto_3556 ?auto_3555 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3580 - SURFACE
      ?auto_3581 - SURFACE
    )
    :vars
    (
      ?auto_3582 - HOIST
      ?auto_3583 - PLACE
      ?auto_3585 - PLACE
      ?auto_3586 - HOIST
      ?auto_3587 - SURFACE
      ?auto_3584 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3582 ?auto_3583 ) ( SURFACE-AT ?auto_3580 ?auto_3583 ) ( CLEAR ?auto_3580 ) ( IS-CRATE ?auto_3581 ) ( AVAILABLE ?auto_3582 ) ( not ( = ?auto_3585 ?auto_3583 ) ) ( HOIST-AT ?auto_3586 ?auto_3585 ) ( AVAILABLE ?auto_3586 ) ( SURFACE-AT ?auto_3581 ?auto_3585 ) ( ON ?auto_3581 ?auto_3587 ) ( CLEAR ?auto_3581 ) ( TRUCK-AT ?auto_3584 ?auto_3583 ) ( not ( = ?auto_3580 ?auto_3581 ) ) ( not ( = ?auto_3580 ?auto_3587 ) ) ( not ( = ?auto_3581 ?auto_3587 ) ) ( not ( = ?auto_3582 ?auto_3586 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3584 ?auto_3583 ?auto_3585 )
      ( !LIFT ?auto_3586 ?auto_3581 ?auto_3587 ?auto_3585 )
      ( !LOAD ?auto_3586 ?auto_3581 ?auto_3584 ?auto_3585 )
      ( !DRIVE ?auto_3584 ?auto_3585 ?auto_3583 )
      ( !UNLOAD ?auto_3582 ?auto_3581 ?auto_3584 ?auto_3583 )
      ( !DROP ?auto_3582 ?auto_3581 ?auto_3580 ?auto_3583 )
      ( MAKE-1CRATE-VERIFY ?auto_3580 ?auto_3581 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_3596 - SURFACE
      ?auto_3597 - SURFACE
      ?auto_3598 - SURFACE
      ?auto_3599 - SURFACE
      ?auto_3600 - SURFACE
      ?auto_3602 - SURFACE
      ?auto_3601 - SURFACE
      ?auto_3603 - SURFACE
    )
    :vars
    (
      ?auto_3604 - HOIST
      ?auto_3607 - PLACE
      ?auto_3605 - PLACE
      ?auto_3609 - HOIST
      ?auto_3608 - SURFACE
      ?auto_3611 - PLACE
      ?auto_3627 - HOIST
      ?auto_3612 - SURFACE
      ?auto_3615 - PLACE
      ?auto_3616 - HOIST
      ?auto_3613 - SURFACE
      ?auto_3622 - PLACE
      ?auto_3623 - HOIST
      ?auto_3624 - SURFACE
      ?auto_3626 - PLACE
      ?auto_3618 - HOIST
      ?auto_3620 - SURFACE
      ?auto_3614 - PLACE
      ?auto_3625 - HOIST
      ?auto_3610 - SURFACE
      ?auto_3617 - PLACE
      ?auto_3619 - HOIST
      ?auto_3621 - SURFACE
      ?auto_3606 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3604 ?auto_3607 ) ( IS-CRATE ?auto_3603 ) ( not ( = ?auto_3605 ?auto_3607 ) ) ( HOIST-AT ?auto_3609 ?auto_3605 ) ( AVAILABLE ?auto_3609 ) ( SURFACE-AT ?auto_3603 ?auto_3605 ) ( ON ?auto_3603 ?auto_3608 ) ( CLEAR ?auto_3603 ) ( not ( = ?auto_3601 ?auto_3603 ) ) ( not ( = ?auto_3601 ?auto_3608 ) ) ( not ( = ?auto_3603 ?auto_3608 ) ) ( not ( = ?auto_3604 ?auto_3609 ) ) ( IS-CRATE ?auto_3601 ) ( not ( = ?auto_3611 ?auto_3607 ) ) ( HOIST-AT ?auto_3627 ?auto_3611 ) ( AVAILABLE ?auto_3627 ) ( SURFACE-AT ?auto_3601 ?auto_3611 ) ( ON ?auto_3601 ?auto_3612 ) ( CLEAR ?auto_3601 ) ( not ( = ?auto_3602 ?auto_3601 ) ) ( not ( = ?auto_3602 ?auto_3612 ) ) ( not ( = ?auto_3601 ?auto_3612 ) ) ( not ( = ?auto_3604 ?auto_3627 ) ) ( IS-CRATE ?auto_3602 ) ( not ( = ?auto_3615 ?auto_3607 ) ) ( HOIST-AT ?auto_3616 ?auto_3615 ) ( AVAILABLE ?auto_3616 ) ( SURFACE-AT ?auto_3602 ?auto_3615 ) ( ON ?auto_3602 ?auto_3613 ) ( CLEAR ?auto_3602 ) ( not ( = ?auto_3600 ?auto_3602 ) ) ( not ( = ?auto_3600 ?auto_3613 ) ) ( not ( = ?auto_3602 ?auto_3613 ) ) ( not ( = ?auto_3604 ?auto_3616 ) ) ( IS-CRATE ?auto_3600 ) ( not ( = ?auto_3622 ?auto_3607 ) ) ( HOIST-AT ?auto_3623 ?auto_3622 ) ( AVAILABLE ?auto_3623 ) ( SURFACE-AT ?auto_3600 ?auto_3622 ) ( ON ?auto_3600 ?auto_3624 ) ( CLEAR ?auto_3600 ) ( not ( = ?auto_3599 ?auto_3600 ) ) ( not ( = ?auto_3599 ?auto_3624 ) ) ( not ( = ?auto_3600 ?auto_3624 ) ) ( not ( = ?auto_3604 ?auto_3623 ) ) ( IS-CRATE ?auto_3599 ) ( not ( = ?auto_3626 ?auto_3607 ) ) ( HOIST-AT ?auto_3618 ?auto_3626 ) ( AVAILABLE ?auto_3618 ) ( SURFACE-AT ?auto_3599 ?auto_3626 ) ( ON ?auto_3599 ?auto_3620 ) ( CLEAR ?auto_3599 ) ( not ( = ?auto_3598 ?auto_3599 ) ) ( not ( = ?auto_3598 ?auto_3620 ) ) ( not ( = ?auto_3599 ?auto_3620 ) ) ( not ( = ?auto_3604 ?auto_3618 ) ) ( IS-CRATE ?auto_3598 ) ( not ( = ?auto_3614 ?auto_3607 ) ) ( HOIST-AT ?auto_3625 ?auto_3614 ) ( AVAILABLE ?auto_3625 ) ( SURFACE-AT ?auto_3598 ?auto_3614 ) ( ON ?auto_3598 ?auto_3610 ) ( CLEAR ?auto_3598 ) ( not ( = ?auto_3597 ?auto_3598 ) ) ( not ( = ?auto_3597 ?auto_3610 ) ) ( not ( = ?auto_3598 ?auto_3610 ) ) ( not ( = ?auto_3604 ?auto_3625 ) ) ( SURFACE-AT ?auto_3596 ?auto_3607 ) ( CLEAR ?auto_3596 ) ( IS-CRATE ?auto_3597 ) ( AVAILABLE ?auto_3604 ) ( not ( = ?auto_3617 ?auto_3607 ) ) ( HOIST-AT ?auto_3619 ?auto_3617 ) ( AVAILABLE ?auto_3619 ) ( SURFACE-AT ?auto_3597 ?auto_3617 ) ( ON ?auto_3597 ?auto_3621 ) ( CLEAR ?auto_3597 ) ( TRUCK-AT ?auto_3606 ?auto_3607 ) ( not ( = ?auto_3596 ?auto_3597 ) ) ( not ( = ?auto_3596 ?auto_3621 ) ) ( not ( = ?auto_3597 ?auto_3621 ) ) ( not ( = ?auto_3604 ?auto_3619 ) ) ( not ( = ?auto_3596 ?auto_3598 ) ) ( not ( = ?auto_3596 ?auto_3610 ) ) ( not ( = ?auto_3598 ?auto_3621 ) ) ( not ( = ?auto_3614 ?auto_3617 ) ) ( not ( = ?auto_3625 ?auto_3619 ) ) ( not ( = ?auto_3610 ?auto_3621 ) ) ( not ( = ?auto_3596 ?auto_3599 ) ) ( not ( = ?auto_3596 ?auto_3620 ) ) ( not ( = ?auto_3597 ?auto_3599 ) ) ( not ( = ?auto_3597 ?auto_3620 ) ) ( not ( = ?auto_3599 ?auto_3610 ) ) ( not ( = ?auto_3599 ?auto_3621 ) ) ( not ( = ?auto_3626 ?auto_3614 ) ) ( not ( = ?auto_3626 ?auto_3617 ) ) ( not ( = ?auto_3618 ?auto_3625 ) ) ( not ( = ?auto_3618 ?auto_3619 ) ) ( not ( = ?auto_3620 ?auto_3610 ) ) ( not ( = ?auto_3620 ?auto_3621 ) ) ( not ( = ?auto_3596 ?auto_3600 ) ) ( not ( = ?auto_3596 ?auto_3624 ) ) ( not ( = ?auto_3597 ?auto_3600 ) ) ( not ( = ?auto_3597 ?auto_3624 ) ) ( not ( = ?auto_3598 ?auto_3600 ) ) ( not ( = ?auto_3598 ?auto_3624 ) ) ( not ( = ?auto_3600 ?auto_3620 ) ) ( not ( = ?auto_3600 ?auto_3610 ) ) ( not ( = ?auto_3600 ?auto_3621 ) ) ( not ( = ?auto_3622 ?auto_3626 ) ) ( not ( = ?auto_3622 ?auto_3614 ) ) ( not ( = ?auto_3622 ?auto_3617 ) ) ( not ( = ?auto_3623 ?auto_3618 ) ) ( not ( = ?auto_3623 ?auto_3625 ) ) ( not ( = ?auto_3623 ?auto_3619 ) ) ( not ( = ?auto_3624 ?auto_3620 ) ) ( not ( = ?auto_3624 ?auto_3610 ) ) ( not ( = ?auto_3624 ?auto_3621 ) ) ( not ( = ?auto_3596 ?auto_3602 ) ) ( not ( = ?auto_3596 ?auto_3613 ) ) ( not ( = ?auto_3597 ?auto_3602 ) ) ( not ( = ?auto_3597 ?auto_3613 ) ) ( not ( = ?auto_3598 ?auto_3602 ) ) ( not ( = ?auto_3598 ?auto_3613 ) ) ( not ( = ?auto_3599 ?auto_3602 ) ) ( not ( = ?auto_3599 ?auto_3613 ) ) ( not ( = ?auto_3602 ?auto_3624 ) ) ( not ( = ?auto_3602 ?auto_3620 ) ) ( not ( = ?auto_3602 ?auto_3610 ) ) ( not ( = ?auto_3602 ?auto_3621 ) ) ( not ( = ?auto_3615 ?auto_3622 ) ) ( not ( = ?auto_3615 ?auto_3626 ) ) ( not ( = ?auto_3615 ?auto_3614 ) ) ( not ( = ?auto_3615 ?auto_3617 ) ) ( not ( = ?auto_3616 ?auto_3623 ) ) ( not ( = ?auto_3616 ?auto_3618 ) ) ( not ( = ?auto_3616 ?auto_3625 ) ) ( not ( = ?auto_3616 ?auto_3619 ) ) ( not ( = ?auto_3613 ?auto_3624 ) ) ( not ( = ?auto_3613 ?auto_3620 ) ) ( not ( = ?auto_3613 ?auto_3610 ) ) ( not ( = ?auto_3613 ?auto_3621 ) ) ( not ( = ?auto_3596 ?auto_3601 ) ) ( not ( = ?auto_3596 ?auto_3612 ) ) ( not ( = ?auto_3597 ?auto_3601 ) ) ( not ( = ?auto_3597 ?auto_3612 ) ) ( not ( = ?auto_3598 ?auto_3601 ) ) ( not ( = ?auto_3598 ?auto_3612 ) ) ( not ( = ?auto_3599 ?auto_3601 ) ) ( not ( = ?auto_3599 ?auto_3612 ) ) ( not ( = ?auto_3600 ?auto_3601 ) ) ( not ( = ?auto_3600 ?auto_3612 ) ) ( not ( = ?auto_3601 ?auto_3613 ) ) ( not ( = ?auto_3601 ?auto_3624 ) ) ( not ( = ?auto_3601 ?auto_3620 ) ) ( not ( = ?auto_3601 ?auto_3610 ) ) ( not ( = ?auto_3601 ?auto_3621 ) ) ( not ( = ?auto_3611 ?auto_3615 ) ) ( not ( = ?auto_3611 ?auto_3622 ) ) ( not ( = ?auto_3611 ?auto_3626 ) ) ( not ( = ?auto_3611 ?auto_3614 ) ) ( not ( = ?auto_3611 ?auto_3617 ) ) ( not ( = ?auto_3627 ?auto_3616 ) ) ( not ( = ?auto_3627 ?auto_3623 ) ) ( not ( = ?auto_3627 ?auto_3618 ) ) ( not ( = ?auto_3627 ?auto_3625 ) ) ( not ( = ?auto_3627 ?auto_3619 ) ) ( not ( = ?auto_3612 ?auto_3613 ) ) ( not ( = ?auto_3612 ?auto_3624 ) ) ( not ( = ?auto_3612 ?auto_3620 ) ) ( not ( = ?auto_3612 ?auto_3610 ) ) ( not ( = ?auto_3612 ?auto_3621 ) ) ( not ( = ?auto_3596 ?auto_3603 ) ) ( not ( = ?auto_3596 ?auto_3608 ) ) ( not ( = ?auto_3597 ?auto_3603 ) ) ( not ( = ?auto_3597 ?auto_3608 ) ) ( not ( = ?auto_3598 ?auto_3603 ) ) ( not ( = ?auto_3598 ?auto_3608 ) ) ( not ( = ?auto_3599 ?auto_3603 ) ) ( not ( = ?auto_3599 ?auto_3608 ) ) ( not ( = ?auto_3600 ?auto_3603 ) ) ( not ( = ?auto_3600 ?auto_3608 ) ) ( not ( = ?auto_3602 ?auto_3603 ) ) ( not ( = ?auto_3602 ?auto_3608 ) ) ( not ( = ?auto_3603 ?auto_3612 ) ) ( not ( = ?auto_3603 ?auto_3613 ) ) ( not ( = ?auto_3603 ?auto_3624 ) ) ( not ( = ?auto_3603 ?auto_3620 ) ) ( not ( = ?auto_3603 ?auto_3610 ) ) ( not ( = ?auto_3603 ?auto_3621 ) ) ( not ( = ?auto_3605 ?auto_3611 ) ) ( not ( = ?auto_3605 ?auto_3615 ) ) ( not ( = ?auto_3605 ?auto_3622 ) ) ( not ( = ?auto_3605 ?auto_3626 ) ) ( not ( = ?auto_3605 ?auto_3614 ) ) ( not ( = ?auto_3605 ?auto_3617 ) ) ( not ( = ?auto_3609 ?auto_3627 ) ) ( not ( = ?auto_3609 ?auto_3616 ) ) ( not ( = ?auto_3609 ?auto_3623 ) ) ( not ( = ?auto_3609 ?auto_3618 ) ) ( not ( = ?auto_3609 ?auto_3625 ) ) ( not ( = ?auto_3609 ?auto_3619 ) ) ( not ( = ?auto_3608 ?auto_3612 ) ) ( not ( = ?auto_3608 ?auto_3613 ) ) ( not ( = ?auto_3608 ?auto_3624 ) ) ( not ( = ?auto_3608 ?auto_3620 ) ) ( not ( = ?auto_3608 ?auto_3610 ) ) ( not ( = ?auto_3608 ?auto_3621 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_3596 ?auto_3597 ?auto_3598 ?auto_3599 ?auto_3600 ?auto_3602 ?auto_3601 )
      ( MAKE-1CRATE ?auto_3601 ?auto_3603 )
      ( MAKE-7CRATE-VERIFY ?auto_3596 ?auto_3597 ?auto_3598 ?auto_3599 ?auto_3600 ?auto_3602 ?auto_3601 ?auto_3603 ) )
  )

)

