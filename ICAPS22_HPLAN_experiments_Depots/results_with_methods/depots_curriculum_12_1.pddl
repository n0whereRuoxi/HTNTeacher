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

  ( :method MAKE-ON-VERIFY
    :parameters
    (
      ?c1 - SURFACE
      ?c2 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?c2 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3372 - SURFACE
      ?auto_3373 - SURFACE
    )
    :vars
    (
      ?auto_3374 - HOIST
      ?auto_3375 - PLACE
      ?auto_3377 - PLACE
      ?auto_3378 - HOIST
      ?auto_3379 - SURFACE
      ?auto_3376 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3374 ?auto_3375 ) ( SURFACE-AT ?auto_3373 ?auto_3375 ) ( CLEAR ?auto_3373 ) ( IS-CRATE ?auto_3372 ) ( AVAILABLE ?auto_3374 ) ( not ( = ?auto_3377 ?auto_3375 ) ) ( HOIST-AT ?auto_3378 ?auto_3377 ) ( AVAILABLE ?auto_3378 ) ( SURFACE-AT ?auto_3372 ?auto_3377 ) ( ON ?auto_3372 ?auto_3379 ) ( CLEAR ?auto_3372 ) ( TRUCK-AT ?auto_3376 ?auto_3375 ) ( not ( = ?auto_3372 ?auto_3373 ) ) ( not ( = ?auto_3372 ?auto_3379 ) ) ( not ( = ?auto_3373 ?auto_3379 ) ) ( not ( = ?auto_3374 ?auto_3378 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3376 ?auto_3375 ?auto_3377 )
      ( !LIFT ?auto_3378 ?auto_3372 ?auto_3379 ?auto_3377 )
      ( !LOAD ?auto_3378 ?auto_3372 ?auto_3376 ?auto_3377 )
      ( !DRIVE ?auto_3376 ?auto_3377 ?auto_3375 )
      ( !UNLOAD ?auto_3374 ?auto_3372 ?auto_3376 ?auto_3375 )
      ( !DROP ?auto_3374 ?auto_3372 ?auto_3373 ?auto_3375 )
      ( MAKE-ON-VERIFY ?auto_3372 ?auto_3373 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3382 - SURFACE
      ?auto_3383 - SURFACE
    )
    :vars
    (
      ?auto_3384 - HOIST
      ?auto_3385 - PLACE
      ?auto_3387 - PLACE
      ?auto_3388 - HOIST
      ?auto_3389 - SURFACE
      ?auto_3386 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3384 ?auto_3385 ) ( SURFACE-AT ?auto_3383 ?auto_3385 ) ( CLEAR ?auto_3383 ) ( IS-CRATE ?auto_3382 ) ( AVAILABLE ?auto_3384 ) ( not ( = ?auto_3387 ?auto_3385 ) ) ( HOIST-AT ?auto_3388 ?auto_3387 ) ( AVAILABLE ?auto_3388 ) ( SURFACE-AT ?auto_3382 ?auto_3387 ) ( ON ?auto_3382 ?auto_3389 ) ( CLEAR ?auto_3382 ) ( TRUCK-AT ?auto_3386 ?auto_3385 ) ( not ( = ?auto_3382 ?auto_3383 ) ) ( not ( = ?auto_3382 ?auto_3389 ) ) ( not ( = ?auto_3383 ?auto_3389 ) ) ( not ( = ?auto_3384 ?auto_3388 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3386 ?auto_3385 ?auto_3387 )
      ( !LIFT ?auto_3388 ?auto_3382 ?auto_3389 ?auto_3387 )
      ( !LOAD ?auto_3388 ?auto_3382 ?auto_3386 ?auto_3387 )
      ( !DRIVE ?auto_3386 ?auto_3387 ?auto_3385 )
      ( !UNLOAD ?auto_3384 ?auto_3382 ?auto_3386 ?auto_3385 )
      ( !DROP ?auto_3384 ?auto_3382 ?auto_3383 ?auto_3385 )
      ( MAKE-ON-VERIFY ?auto_3382 ?auto_3383 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3392 - SURFACE
      ?auto_3393 - SURFACE
    )
    :vars
    (
      ?auto_3394 - HOIST
      ?auto_3395 - PLACE
      ?auto_3397 - PLACE
      ?auto_3398 - HOIST
      ?auto_3399 - SURFACE
      ?auto_3396 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3394 ?auto_3395 ) ( SURFACE-AT ?auto_3393 ?auto_3395 ) ( CLEAR ?auto_3393 ) ( IS-CRATE ?auto_3392 ) ( AVAILABLE ?auto_3394 ) ( not ( = ?auto_3397 ?auto_3395 ) ) ( HOIST-AT ?auto_3398 ?auto_3397 ) ( AVAILABLE ?auto_3398 ) ( SURFACE-AT ?auto_3392 ?auto_3397 ) ( ON ?auto_3392 ?auto_3399 ) ( CLEAR ?auto_3392 ) ( TRUCK-AT ?auto_3396 ?auto_3395 ) ( not ( = ?auto_3392 ?auto_3393 ) ) ( not ( = ?auto_3392 ?auto_3399 ) ) ( not ( = ?auto_3393 ?auto_3399 ) ) ( not ( = ?auto_3394 ?auto_3398 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3396 ?auto_3395 ?auto_3397 )
      ( !LIFT ?auto_3398 ?auto_3392 ?auto_3399 ?auto_3397 )
      ( !LOAD ?auto_3398 ?auto_3392 ?auto_3396 ?auto_3397 )
      ( !DRIVE ?auto_3396 ?auto_3397 ?auto_3395 )
      ( !UNLOAD ?auto_3394 ?auto_3392 ?auto_3396 ?auto_3395 )
      ( !DROP ?auto_3394 ?auto_3392 ?auto_3393 ?auto_3395 )
      ( MAKE-ON-VERIFY ?auto_3392 ?auto_3393 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3402 - SURFACE
      ?auto_3403 - SURFACE
    )
    :vars
    (
      ?auto_3404 - HOIST
      ?auto_3405 - PLACE
      ?auto_3407 - PLACE
      ?auto_3408 - HOIST
      ?auto_3409 - SURFACE
      ?auto_3406 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3404 ?auto_3405 ) ( SURFACE-AT ?auto_3403 ?auto_3405 ) ( CLEAR ?auto_3403 ) ( IS-CRATE ?auto_3402 ) ( AVAILABLE ?auto_3404 ) ( not ( = ?auto_3407 ?auto_3405 ) ) ( HOIST-AT ?auto_3408 ?auto_3407 ) ( AVAILABLE ?auto_3408 ) ( SURFACE-AT ?auto_3402 ?auto_3407 ) ( ON ?auto_3402 ?auto_3409 ) ( CLEAR ?auto_3402 ) ( TRUCK-AT ?auto_3406 ?auto_3405 ) ( not ( = ?auto_3402 ?auto_3403 ) ) ( not ( = ?auto_3402 ?auto_3409 ) ) ( not ( = ?auto_3403 ?auto_3409 ) ) ( not ( = ?auto_3404 ?auto_3408 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3406 ?auto_3405 ?auto_3407 )
      ( !LIFT ?auto_3408 ?auto_3402 ?auto_3409 ?auto_3407 )
      ( !LOAD ?auto_3408 ?auto_3402 ?auto_3406 ?auto_3407 )
      ( !DRIVE ?auto_3406 ?auto_3407 ?auto_3405 )
      ( !UNLOAD ?auto_3404 ?auto_3402 ?auto_3406 ?auto_3405 )
      ( !DROP ?auto_3404 ?auto_3402 ?auto_3403 ?auto_3405 )
      ( MAKE-ON-VERIFY ?auto_3402 ?auto_3403 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3412 - SURFACE
      ?auto_3413 - SURFACE
    )
    :vars
    (
      ?auto_3414 - HOIST
      ?auto_3415 - PLACE
      ?auto_3417 - PLACE
      ?auto_3418 - HOIST
      ?auto_3419 - SURFACE
      ?auto_3416 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3414 ?auto_3415 ) ( SURFACE-AT ?auto_3413 ?auto_3415 ) ( CLEAR ?auto_3413 ) ( IS-CRATE ?auto_3412 ) ( AVAILABLE ?auto_3414 ) ( not ( = ?auto_3417 ?auto_3415 ) ) ( HOIST-AT ?auto_3418 ?auto_3417 ) ( AVAILABLE ?auto_3418 ) ( SURFACE-AT ?auto_3412 ?auto_3417 ) ( ON ?auto_3412 ?auto_3419 ) ( CLEAR ?auto_3412 ) ( TRUCK-AT ?auto_3416 ?auto_3415 ) ( not ( = ?auto_3412 ?auto_3413 ) ) ( not ( = ?auto_3412 ?auto_3419 ) ) ( not ( = ?auto_3413 ?auto_3419 ) ) ( not ( = ?auto_3414 ?auto_3418 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3416 ?auto_3415 ?auto_3417 )
      ( !LIFT ?auto_3418 ?auto_3412 ?auto_3419 ?auto_3417 )
      ( !LOAD ?auto_3418 ?auto_3412 ?auto_3416 ?auto_3417 )
      ( !DRIVE ?auto_3416 ?auto_3417 ?auto_3415 )
      ( !UNLOAD ?auto_3414 ?auto_3412 ?auto_3416 ?auto_3415 )
      ( !DROP ?auto_3414 ?auto_3412 ?auto_3413 ?auto_3415 )
      ( MAKE-ON-VERIFY ?auto_3412 ?auto_3413 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3422 - SURFACE
      ?auto_3423 - SURFACE
    )
    :vars
    (
      ?auto_3424 - HOIST
      ?auto_3425 - PLACE
      ?auto_3427 - PLACE
      ?auto_3428 - HOIST
      ?auto_3429 - SURFACE
      ?auto_3426 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3424 ?auto_3425 ) ( SURFACE-AT ?auto_3423 ?auto_3425 ) ( CLEAR ?auto_3423 ) ( IS-CRATE ?auto_3422 ) ( AVAILABLE ?auto_3424 ) ( not ( = ?auto_3427 ?auto_3425 ) ) ( HOIST-AT ?auto_3428 ?auto_3427 ) ( AVAILABLE ?auto_3428 ) ( SURFACE-AT ?auto_3422 ?auto_3427 ) ( ON ?auto_3422 ?auto_3429 ) ( CLEAR ?auto_3422 ) ( TRUCK-AT ?auto_3426 ?auto_3425 ) ( not ( = ?auto_3422 ?auto_3423 ) ) ( not ( = ?auto_3422 ?auto_3429 ) ) ( not ( = ?auto_3423 ?auto_3429 ) ) ( not ( = ?auto_3424 ?auto_3428 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3426 ?auto_3425 ?auto_3427 )
      ( !LIFT ?auto_3428 ?auto_3422 ?auto_3429 ?auto_3427 )
      ( !LOAD ?auto_3428 ?auto_3422 ?auto_3426 ?auto_3427 )
      ( !DRIVE ?auto_3426 ?auto_3427 ?auto_3425 )
      ( !UNLOAD ?auto_3424 ?auto_3422 ?auto_3426 ?auto_3425 )
      ( !DROP ?auto_3424 ?auto_3422 ?auto_3423 ?auto_3425 )
      ( MAKE-ON-VERIFY ?auto_3422 ?auto_3423 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3432 - SURFACE
      ?auto_3433 - SURFACE
    )
    :vars
    (
      ?auto_3434 - HOIST
      ?auto_3435 - PLACE
      ?auto_3437 - PLACE
      ?auto_3438 - HOIST
      ?auto_3439 - SURFACE
      ?auto_3436 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3434 ?auto_3435 ) ( SURFACE-AT ?auto_3433 ?auto_3435 ) ( CLEAR ?auto_3433 ) ( IS-CRATE ?auto_3432 ) ( AVAILABLE ?auto_3434 ) ( not ( = ?auto_3437 ?auto_3435 ) ) ( HOIST-AT ?auto_3438 ?auto_3437 ) ( AVAILABLE ?auto_3438 ) ( SURFACE-AT ?auto_3432 ?auto_3437 ) ( ON ?auto_3432 ?auto_3439 ) ( CLEAR ?auto_3432 ) ( TRUCK-AT ?auto_3436 ?auto_3435 ) ( not ( = ?auto_3432 ?auto_3433 ) ) ( not ( = ?auto_3432 ?auto_3439 ) ) ( not ( = ?auto_3433 ?auto_3439 ) ) ( not ( = ?auto_3434 ?auto_3438 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3436 ?auto_3435 ?auto_3437 )
      ( !LIFT ?auto_3438 ?auto_3432 ?auto_3439 ?auto_3437 )
      ( !LOAD ?auto_3438 ?auto_3432 ?auto_3436 ?auto_3437 )
      ( !DRIVE ?auto_3436 ?auto_3437 ?auto_3435 )
      ( !UNLOAD ?auto_3434 ?auto_3432 ?auto_3436 ?auto_3435 )
      ( !DROP ?auto_3434 ?auto_3432 ?auto_3433 ?auto_3435 )
      ( MAKE-ON-VERIFY ?auto_3432 ?auto_3433 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3442 - SURFACE
      ?auto_3443 - SURFACE
    )
    :vars
    (
      ?auto_3444 - HOIST
      ?auto_3445 - PLACE
      ?auto_3447 - PLACE
      ?auto_3448 - HOIST
      ?auto_3449 - SURFACE
      ?auto_3446 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3444 ?auto_3445 ) ( SURFACE-AT ?auto_3443 ?auto_3445 ) ( CLEAR ?auto_3443 ) ( IS-CRATE ?auto_3442 ) ( AVAILABLE ?auto_3444 ) ( not ( = ?auto_3447 ?auto_3445 ) ) ( HOIST-AT ?auto_3448 ?auto_3447 ) ( AVAILABLE ?auto_3448 ) ( SURFACE-AT ?auto_3442 ?auto_3447 ) ( ON ?auto_3442 ?auto_3449 ) ( CLEAR ?auto_3442 ) ( TRUCK-AT ?auto_3446 ?auto_3445 ) ( not ( = ?auto_3442 ?auto_3443 ) ) ( not ( = ?auto_3442 ?auto_3449 ) ) ( not ( = ?auto_3443 ?auto_3449 ) ) ( not ( = ?auto_3444 ?auto_3448 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3446 ?auto_3445 ?auto_3447 )
      ( !LIFT ?auto_3448 ?auto_3442 ?auto_3449 ?auto_3447 )
      ( !LOAD ?auto_3448 ?auto_3442 ?auto_3446 ?auto_3447 )
      ( !DRIVE ?auto_3446 ?auto_3447 ?auto_3445 )
      ( !UNLOAD ?auto_3444 ?auto_3442 ?auto_3446 ?auto_3445 )
      ( !DROP ?auto_3444 ?auto_3442 ?auto_3443 ?auto_3445 )
      ( MAKE-ON-VERIFY ?auto_3442 ?auto_3443 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3452 - SURFACE
      ?auto_3453 - SURFACE
    )
    :vars
    (
      ?auto_3454 - HOIST
      ?auto_3455 - PLACE
      ?auto_3457 - PLACE
      ?auto_3458 - HOIST
      ?auto_3459 - SURFACE
      ?auto_3456 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3454 ?auto_3455 ) ( SURFACE-AT ?auto_3453 ?auto_3455 ) ( CLEAR ?auto_3453 ) ( IS-CRATE ?auto_3452 ) ( AVAILABLE ?auto_3454 ) ( not ( = ?auto_3457 ?auto_3455 ) ) ( HOIST-AT ?auto_3458 ?auto_3457 ) ( AVAILABLE ?auto_3458 ) ( SURFACE-AT ?auto_3452 ?auto_3457 ) ( ON ?auto_3452 ?auto_3459 ) ( CLEAR ?auto_3452 ) ( TRUCK-AT ?auto_3456 ?auto_3455 ) ( not ( = ?auto_3452 ?auto_3453 ) ) ( not ( = ?auto_3452 ?auto_3459 ) ) ( not ( = ?auto_3453 ?auto_3459 ) ) ( not ( = ?auto_3454 ?auto_3458 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3456 ?auto_3455 ?auto_3457 )
      ( !LIFT ?auto_3458 ?auto_3452 ?auto_3459 ?auto_3457 )
      ( !LOAD ?auto_3458 ?auto_3452 ?auto_3456 ?auto_3457 )
      ( !DRIVE ?auto_3456 ?auto_3457 ?auto_3455 )
      ( !UNLOAD ?auto_3454 ?auto_3452 ?auto_3456 ?auto_3455 )
      ( !DROP ?auto_3454 ?auto_3452 ?auto_3453 ?auto_3455 )
      ( MAKE-ON-VERIFY ?auto_3452 ?auto_3453 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3462 - SURFACE
      ?auto_3463 - SURFACE
    )
    :vars
    (
      ?auto_3464 - HOIST
      ?auto_3465 - PLACE
      ?auto_3467 - PLACE
      ?auto_3468 - HOIST
      ?auto_3469 - SURFACE
      ?auto_3466 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3464 ?auto_3465 ) ( SURFACE-AT ?auto_3463 ?auto_3465 ) ( CLEAR ?auto_3463 ) ( IS-CRATE ?auto_3462 ) ( AVAILABLE ?auto_3464 ) ( not ( = ?auto_3467 ?auto_3465 ) ) ( HOIST-AT ?auto_3468 ?auto_3467 ) ( AVAILABLE ?auto_3468 ) ( SURFACE-AT ?auto_3462 ?auto_3467 ) ( ON ?auto_3462 ?auto_3469 ) ( CLEAR ?auto_3462 ) ( TRUCK-AT ?auto_3466 ?auto_3465 ) ( not ( = ?auto_3462 ?auto_3463 ) ) ( not ( = ?auto_3462 ?auto_3469 ) ) ( not ( = ?auto_3463 ?auto_3469 ) ) ( not ( = ?auto_3464 ?auto_3468 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3466 ?auto_3465 ?auto_3467 )
      ( !LIFT ?auto_3468 ?auto_3462 ?auto_3469 ?auto_3467 )
      ( !LOAD ?auto_3468 ?auto_3462 ?auto_3466 ?auto_3467 )
      ( !DRIVE ?auto_3466 ?auto_3467 ?auto_3465 )
      ( !UNLOAD ?auto_3464 ?auto_3462 ?auto_3466 ?auto_3465 )
      ( !DROP ?auto_3464 ?auto_3462 ?auto_3463 ?auto_3465 )
      ( MAKE-ON-VERIFY ?auto_3462 ?auto_3463 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3472 - SURFACE
      ?auto_3473 - SURFACE
    )
    :vars
    (
      ?auto_3474 - HOIST
      ?auto_3475 - PLACE
      ?auto_3477 - PLACE
      ?auto_3478 - HOIST
      ?auto_3479 - SURFACE
      ?auto_3476 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3474 ?auto_3475 ) ( SURFACE-AT ?auto_3473 ?auto_3475 ) ( CLEAR ?auto_3473 ) ( IS-CRATE ?auto_3472 ) ( AVAILABLE ?auto_3474 ) ( not ( = ?auto_3477 ?auto_3475 ) ) ( HOIST-AT ?auto_3478 ?auto_3477 ) ( AVAILABLE ?auto_3478 ) ( SURFACE-AT ?auto_3472 ?auto_3477 ) ( ON ?auto_3472 ?auto_3479 ) ( CLEAR ?auto_3472 ) ( TRUCK-AT ?auto_3476 ?auto_3475 ) ( not ( = ?auto_3472 ?auto_3473 ) ) ( not ( = ?auto_3472 ?auto_3479 ) ) ( not ( = ?auto_3473 ?auto_3479 ) ) ( not ( = ?auto_3474 ?auto_3478 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3476 ?auto_3475 ?auto_3477 )
      ( !LIFT ?auto_3478 ?auto_3472 ?auto_3479 ?auto_3477 )
      ( !LOAD ?auto_3478 ?auto_3472 ?auto_3476 ?auto_3477 )
      ( !DRIVE ?auto_3476 ?auto_3477 ?auto_3475 )
      ( !UNLOAD ?auto_3474 ?auto_3472 ?auto_3476 ?auto_3475 )
      ( !DROP ?auto_3474 ?auto_3472 ?auto_3473 ?auto_3475 )
      ( MAKE-ON-VERIFY ?auto_3472 ?auto_3473 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3482 - SURFACE
      ?auto_3483 - SURFACE
    )
    :vars
    (
      ?auto_3484 - HOIST
      ?auto_3485 - PLACE
      ?auto_3487 - PLACE
      ?auto_3488 - HOIST
      ?auto_3489 - SURFACE
      ?auto_3486 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3484 ?auto_3485 ) ( SURFACE-AT ?auto_3483 ?auto_3485 ) ( CLEAR ?auto_3483 ) ( IS-CRATE ?auto_3482 ) ( AVAILABLE ?auto_3484 ) ( not ( = ?auto_3487 ?auto_3485 ) ) ( HOIST-AT ?auto_3488 ?auto_3487 ) ( AVAILABLE ?auto_3488 ) ( SURFACE-AT ?auto_3482 ?auto_3487 ) ( ON ?auto_3482 ?auto_3489 ) ( CLEAR ?auto_3482 ) ( TRUCK-AT ?auto_3486 ?auto_3485 ) ( not ( = ?auto_3482 ?auto_3483 ) ) ( not ( = ?auto_3482 ?auto_3489 ) ) ( not ( = ?auto_3483 ?auto_3489 ) ) ( not ( = ?auto_3484 ?auto_3488 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3486 ?auto_3485 ?auto_3487 )
      ( !LIFT ?auto_3488 ?auto_3482 ?auto_3489 ?auto_3487 )
      ( !LOAD ?auto_3488 ?auto_3482 ?auto_3486 ?auto_3487 )
      ( !DRIVE ?auto_3486 ?auto_3487 ?auto_3485 )
      ( !UNLOAD ?auto_3484 ?auto_3482 ?auto_3486 ?auto_3485 )
      ( !DROP ?auto_3484 ?auto_3482 ?auto_3483 ?auto_3485 )
      ( MAKE-ON-VERIFY ?auto_3482 ?auto_3483 ) )
  )

)

