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
      ?auto_3492 - SURFACE
      ?auto_3493 - SURFACE
    )
    :vars
    (
      ?auto_3494 - HOIST
      ?auto_3495 - PLACE
      ?auto_3497 - PLACE
      ?auto_3498 - HOIST
      ?auto_3499 - SURFACE
      ?auto_3496 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3494 ?auto_3495 ) ( SURFACE-AT ?auto_3493 ?auto_3495 ) ( CLEAR ?auto_3493 ) ( IS-CRATE ?auto_3492 ) ( AVAILABLE ?auto_3494 ) ( not ( = ?auto_3497 ?auto_3495 ) ) ( HOIST-AT ?auto_3498 ?auto_3497 ) ( AVAILABLE ?auto_3498 ) ( SURFACE-AT ?auto_3492 ?auto_3497 ) ( ON ?auto_3492 ?auto_3499 ) ( CLEAR ?auto_3492 ) ( TRUCK-AT ?auto_3496 ?auto_3495 ) ( not ( = ?auto_3492 ?auto_3493 ) ) ( not ( = ?auto_3492 ?auto_3499 ) ) ( not ( = ?auto_3493 ?auto_3499 ) ) ( not ( = ?auto_3494 ?auto_3498 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3496 ?auto_3495 ?auto_3497 )
      ( !LIFT ?auto_3498 ?auto_3492 ?auto_3499 ?auto_3497 )
      ( !LOAD ?auto_3498 ?auto_3492 ?auto_3496 ?auto_3497 )
      ( !DRIVE ?auto_3496 ?auto_3497 ?auto_3495 )
      ( !UNLOAD ?auto_3494 ?auto_3492 ?auto_3496 ?auto_3495 )
      ( !DROP ?auto_3494 ?auto_3492 ?auto_3493 ?auto_3495 )
      ( MAKE-ON-VERIFY ?auto_3492 ?auto_3493 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3502 - SURFACE
      ?auto_3503 - SURFACE
    )
    :vars
    (
      ?auto_3504 - HOIST
      ?auto_3505 - PLACE
      ?auto_3507 - PLACE
      ?auto_3508 - HOIST
      ?auto_3509 - SURFACE
      ?auto_3506 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3504 ?auto_3505 ) ( SURFACE-AT ?auto_3503 ?auto_3505 ) ( CLEAR ?auto_3503 ) ( IS-CRATE ?auto_3502 ) ( AVAILABLE ?auto_3504 ) ( not ( = ?auto_3507 ?auto_3505 ) ) ( HOIST-AT ?auto_3508 ?auto_3507 ) ( AVAILABLE ?auto_3508 ) ( SURFACE-AT ?auto_3502 ?auto_3507 ) ( ON ?auto_3502 ?auto_3509 ) ( CLEAR ?auto_3502 ) ( TRUCK-AT ?auto_3506 ?auto_3505 ) ( not ( = ?auto_3502 ?auto_3503 ) ) ( not ( = ?auto_3502 ?auto_3509 ) ) ( not ( = ?auto_3503 ?auto_3509 ) ) ( not ( = ?auto_3504 ?auto_3508 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3506 ?auto_3505 ?auto_3507 )
      ( !LIFT ?auto_3508 ?auto_3502 ?auto_3509 ?auto_3507 )
      ( !LOAD ?auto_3508 ?auto_3502 ?auto_3506 ?auto_3507 )
      ( !DRIVE ?auto_3506 ?auto_3507 ?auto_3505 )
      ( !UNLOAD ?auto_3504 ?auto_3502 ?auto_3506 ?auto_3505 )
      ( !DROP ?auto_3504 ?auto_3502 ?auto_3503 ?auto_3505 )
      ( MAKE-ON-VERIFY ?auto_3502 ?auto_3503 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3512 - SURFACE
      ?auto_3513 - SURFACE
    )
    :vars
    (
      ?auto_3514 - HOIST
      ?auto_3515 - PLACE
      ?auto_3517 - PLACE
      ?auto_3518 - HOIST
      ?auto_3519 - SURFACE
      ?auto_3516 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3514 ?auto_3515 ) ( SURFACE-AT ?auto_3513 ?auto_3515 ) ( CLEAR ?auto_3513 ) ( IS-CRATE ?auto_3512 ) ( AVAILABLE ?auto_3514 ) ( not ( = ?auto_3517 ?auto_3515 ) ) ( HOIST-AT ?auto_3518 ?auto_3517 ) ( AVAILABLE ?auto_3518 ) ( SURFACE-AT ?auto_3512 ?auto_3517 ) ( ON ?auto_3512 ?auto_3519 ) ( CLEAR ?auto_3512 ) ( TRUCK-AT ?auto_3516 ?auto_3515 ) ( not ( = ?auto_3512 ?auto_3513 ) ) ( not ( = ?auto_3512 ?auto_3519 ) ) ( not ( = ?auto_3513 ?auto_3519 ) ) ( not ( = ?auto_3514 ?auto_3518 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3516 ?auto_3515 ?auto_3517 )
      ( !LIFT ?auto_3518 ?auto_3512 ?auto_3519 ?auto_3517 )
      ( !LOAD ?auto_3518 ?auto_3512 ?auto_3516 ?auto_3517 )
      ( !DRIVE ?auto_3516 ?auto_3517 ?auto_3515 )
      ( !UNLOAD ?auto_3514 ?auto_3512 ?auto_3516 ?auto_3515 )
      ( !DROP ?auto_3514 ?auto_3512 ?auto_3513 ?auto_3515 )
      ( MAKE-ON-VERIFY ?auto_3512 ?auto_3513 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3522 - SURFACE
      ?auto_3523 - SURFACE
    )
    :vars
    (
      ?auto_3524 - HOIST
      ?auto_3525 - PLACE
      ?auto_3527 - PLACE
      ?auto_3528 - HOIST
      ?auto_3529 - SURFACE
      ?auto_3526 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3524 ?auto_3525 ) ( SURFACE-AT ?auto_3523 ?auto_3525 ) ( CLEAR ?auto_3523 ) ( IS-CRATE ?auto_3522 ) ( AVAILABLE ?auto_3524 ) ( not ( = ?auto_3527 ?auto_3525 ) ) ( HOIST-AT ?auto_3528 ?auto_3527 ) ( AVAILABLE ?auto_3528 ) ( SURFACE-AT ?auto_3522 ?auto_3527 ) ( ON ?auto_3522 ?auto_3529 ) ( CLEAR ?auto_3522 ) ( TRUCK-AT ?auto_3526 ?auto_3525 ) ( not ( = ?auto_3522 ?auto_3523 ) ) ( not ( = ?auto_3522 ?auto_3529 ) ) ( not ( = ?auto_3523 ?auto_3529 ) ) ( not ( = ?auto_3524 ?auto_3528 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3526 ?auto_3525 ?auto_3527 )
      ( !LIFT ?auto_3528 ?auto_3522 ?auto_3529 ?auto_3527 )
      ( !LOAD ?auto_3528 ?auto_3522 ?auto_3526 ?auto_3527 )
      ( !DRIVE ?auto_3526 ?auto_3527 ?auto_3525 )
      ( !UNLOAD ?auto_3524 ?auto_3522 ?auto_3526 ?auto_3525 )
      ( !DROP ?auto_3524 ?auto_3522 ?auto_3523 ?auto_3525 )
      ( MAKE-ON-VERIFY ?auto_3522 ?auto_3523 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3532 - SURFACE
      ?auto_3533 - SURFACE
    )
    :vars
    (
      ?auto_3534 - HOIST
      ?auto_3535 - PLACE
      ?auto_3537 - PLACE
      ?auto_3538 - HOIST
      ?auto_3539 - SURFACE
      ?auto_3536 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3534 ?auto_3535 ) ( SURFACE-AT ?auto_3533 ?auto_3535 ) ( CLEAR ?auto_3533 ) ( IS-CRATE ?auto_3532 ) ( AVAILABLE ?auto_3534 ) ( not ( = ?auto_3537 ?auto_3535 ) ) ( HOIST-AT ?auto_3538 ?auto_3537 ) ( AVAILABLE ?auto_3538 ) ( SURFACE-AT ?auto_3532 ?auto_3537 ) ( ON ?auto_3532 ?auto_3539 ) ( CLEAR ?auto_3532 ) ( TRUCK-AT ?auto_3536 ?auto_3535 ) ( not ( = ?auto_3532 ?auto_3533 ) ) ( not ( = ?auto_3532 ?auto_3539 ) ) ( not ( = ?auto_3533 ?auto_3539 ) ) ( not ( = ?auto_3534 ?auto_3538 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3536 ?auto_3535 ?auto_3537 )
      ( !LIFT ?auto_3538 ?auto_3532 ?auto_3539 ?auto_3537 )
      ( !LOAD ?auto_3538 ?auto_3532 ?auto_3536 ?auto_3537 )
      ( !DRIVE ?auto_3536 ?auto_3537 ?auto_3535 )
      ( !UNLOAD ?auto_3534 ?auto_3532 ?auto_3536 ?auto_3535 )
      ( !DROP ?auto_3534 ?auto_3532 ?auto_3533 ?auto_3535 )
      ( MAKE-ON-VERIFY ?auto_3532 ?auto_3533 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3542 - SURFACE
      ?auto_3543 - SURFACE
    )
    :vars
    (
      ?auto_3544 - HOIST
      ?auto_3545 - PLACE
      ?auto_3547 - PLACE
      ?auto_3548 - HOIST
      ?auto_3549 - SURFACE
      ?auto_3546 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3544 ?auto_3545 ) ( SURFACE-AT ?auto_3543 ?auto_3545 ) ( CLEAR ?auto_3543 ) ( IS-CRATE ?auto_3542 ) ( AVAILABLE ?auto_3544 ) ( not ( = ?auto_3547 ?auto_3545 ) ) ( HOIST-AT ?auto_3548 ?auto_3547 ) ( AVAILABLE ?auto_3548 ) ( SURFACE-AT ?auto_3542 ?auto_3547 ) ( ON ?auto_3542 ?auto_3549 ) ( CLEAR ?auto_3542 ) ( TRUCK-AT ?auto_3546 ?auto_3545 ) ( not ( = ?auto_3542 ?auto_3543 ) ) ( not ( = ?auto_3542 ?auto_3549 ) ) ( not ( = ?auto_3543 ?auto_3549 ) ) ( not ( = ?auto_3544 ?auto_3548 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3546 ?auto_3545 ?auto_3547 )
      ( !LIFT ?auto_3548 ?auto_3542 ?auto_3549 ?auto_3547 )
      ( !LOAD ?auto_3548 ?auto_3542 ?auto_3546 ?auto_3547 )
      ( !DRIVE ?auto_3546 ?auto_3547 ?auto_3545 )
      ( !UNLOAD ?auto_3544 ?auto_3542 ?auto_3546 ?auto_3545 )
      ( !DROP ?auto_3544 ?auto_3542 ?auto_3543 ?auto_3545 )
      ( MAKE-ON-VERIFY ?auto_3542 ?auto_3543 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3552 - SURFACE
      ?auto_3553 - SURFACE
    )
    :vars
    (
      ?auto_3554 - HOIST
      ?auto_3555 - PLACE
      ?auto_3557 - PLACE
      ?auto_3558 - HOIST
      ?auto_3559 - SURFACE
      ?auto_3556 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3554 ?auto_3555 ) ( SURFACE-AT ?auto_3553 ?auto_3555 ) ( CLEAR ?auto_3553 ) ( IS-CRATE ?auto_3552 ) ( AVAILABLE ?auto_3554 ) ( not ( = ?auto_3557 ?auto_3555 ) ) ( HOIST-AT ?auto_3558 ?auto_3557 ) ( AVAILABLE ?auto_3558 ) ( SURFACE-AT ?auto_3552 ?auto_3557 ) ( ON ?auto_3552 ?auto_3559 ) ( CLEAR ?auto_3552 ) ( TRUCK-AT ?auto_3556 ?auto_3555 ) ( not ( = ?auto_3552 ?auto_3553 ) ) ( not ( = ?auto_3552 ?auto_3559 ) ) ( not ( = ?auto_3553 ?auto_3559 ) ) ( not ( = ?auto_3554 ?auto_3558 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3556 ?auto_3555 ?auto_3557 )
      ( !LIFT ?auto_3558 ?auto_3552 ?auto_3559 ?auto_3557 )
      ( !LOAD ?auto_3558 ?auto_3552 ?auto_3556 ?auto_3557 )
      ( !DRIVE ?auto_3556 ?auto_3557 ?auto_3555 )
      ( !UNLOAD ?auto_3554 ?auto_3552 ?auto_3556 ?auto_3555 )
      ( !DROP ?auto_3554 ?auto_3552 ?auto_3553 ?auto_3555 )
      ( MAKE-ON-VERIFY ?auto_3552 ?auto_3553 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3562 - SURFACE
      ?auto_3563 - SURFACE
    )
    :vars
    (
      ?auto_3564 - HOIST
      ?auto_3565 - PLACE
      ?auto_3567 - PLACE
      ?auto_3568 - HOIST
      ?auto_3569 - SURFACE
      ?auto_3566 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3564 ?auto_3565 ) ( SURFACE-AT ?auto_3563 ?auto_3565 ) ( CLEAR ?auto_3563 ) ( IS-CRATE ?auto_3562 ) ( AVAILABLE ?auto_3564 ) ( not ( = ?auto_3567 ?auto_3565 ) ) ( HOIST-AT ?auto_3568 ?auto_3567 ) ( AVAILABLE ?auto_3568 ) ( SURFACE-AT ?auto_3562 ?auto_3567 ) ( ON ?auto_3562 ?auto_3569 ) ( CLEAR ?auto_3562 ) ( TRUCK-AT ?auto_3566 ?auto_3565 ) ( not ( = ?auto_3562 ?auto_3563 ) ) ( not ( = ?auto_3562 ?auto_3569 ) ) ( not ( = ?auto_3563 ?auto_3569 ) ) ( not ( = ?auto_3564 ?auto_3568 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3566 ?auto_3565 ?auto_3567 )
      ( !LIFT ?auto_3568 ?auto_3562 ?auto_3569 ?auto_3567 )
      ( !LOAD ?auto_3568 ?auto_3562 ?auto_3566 ?auto_3567 )
      ( !DRIVE ?auto_3566 ?auto_3567 ?auto_3565 )
      ( !UNLOAD ?auto_3564 ?auto_3562 ?auto_3566 ?auto_3565 )
      ( !DROP ?auto_3564 ?auto_3562 ?auto_3563 ?auto_3565 )
      ( MAKE-ON-VERIFY ?auto_3562 ?auto_3563 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3572 - SURFACE
      ?auto_3573 - SURFACE
    )
    :vars
    (
      ?auto_3574 - HOIST
      ?auto_3575 - PLACE
      ?auto_3577 - PLACE
      ?auto_3578 - HOIST
      ?auto_3579 - SURFACE
      ?auto_3576 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3574 ?auto_3575 ) ( SURFACE-AT ?auto_3573 ?auto_3575 ) ( CLEAR ?auto_3573 ) ( IS-CRATE ?auto_3572 ) ( AVAILABLE ?auto_3574 ) ( not ( = ?auto_3577 ?auto_3575 ) ) ( HOIST-AT ?auto_3578 ?auto_3577 ) ( AVAILABLE ?auto_3578 ) ( SURFACE-AT ?auto_3572 ?auto_3577 ) ( ON ?auto_3572 ?auto_3579 ) ( CLEAR ?auto_3572 ) ( TRUCK-AT ?auto_3576 ?auto_3575 ) ( not ( = ?auto_3572 ?auto_3573 ) ) ( not ( = ?auto_3572 ?auto_3579 ) ) ( not ( = ?auto_3573 ?auto_3579 ) ) ( not ( = ?auto_3574 ?auto_3578 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3576 ?auto_3575 ?auto_3577 )
      ( !LIFT ?auto_3578 ?auto_3572 ?auto_3579 ?auto_3577 )
      ( !LOAD ?auto_3578 ?auto_3572 ?auto_3576 ?auto_3577 )
      ( !DRIVE ?auto_3576 ?auto_3577 ?auto_3575 )
      ( !UNLOAD ?auto_3574 ?auto_3572 ?auto_3576 ?auto_3575 )
      ( !DROP ?auto_3574 ?auto_3572 ?auto_3573 ?auto_3575 )
      ( MAKE-ON-VERIFY ?auto_3572 ?auto_3573 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3582 - SURFACE
      ?auto_3583 - SURFACE
    )
    :vars
    (
      ?auto_3584 - HOIST
      ?auto_3585 - PLACE
      ?auto_3587 - PLACE
      ?auto_3588 - HOIST
      ?auto_3589 - SURFACE
      ?auto_3586 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3584 ?auto_3585 ) ( SURFACE-AT ?auto_3583 ?auto_3585 ) ( CLEAR ?auto_3583 ) ( IS-CRATE ?auto_3582 ) ( AVAILABLE ?auto_3584 ) ( not ( = ?auto_3587 ?auto_3585 ) ) ( HOIST-AT ?auto_3588 ?auto_3587 ) ( AVAILABLE ?auto_3588 ) ( SURFACE-AT ?auto_3582 ?auto_3587 ) ( ON ?auto_3582 ?auto_3589 ) ( CLEAR ?auto_3582 ) ( TRUCK-AT ?auto_3586 ?auto_3585 ) ( not ( = ?auto_3582 ?auto_3583 ) ) ( not ( = ?auto_3582 ?auto_3589 ) ) ( not ( = ?auto_3583 ?auto_3589 ) ) ( not ( = ?auto_3584 ?auto_3588 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3586 ?auto_3585 ?auto_3587 )
      ( !LIFT ?auto_3588 ?auto_3582 ?auto_3589 ?auto_3587 )
      ( !LOAD ?auto_3588 ?auto_3582 ?auto_3586 ?auto_3587 )
      ( !DRIVE ?auto_3586 ?auto_3587 ?auto_3585 )
      ( !UNLOAD ?auto_3584 ?auto_3582 ?auto_3586 ?auto_3585 )
      ( !DROP ?auto_3584 ?auto_3582 ?auto_3583 ?auto_3585 )
      ( MAKE-ON-VERIFY ?auto_3582 ?auto_3583 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3592 - SURFACE
      ?auto_3593 - SURFACE
    )
    :vars
    (
      ?auto_3594 - HOIST
      ?auto_3595 - PLACE
      ?auto_3597 - PLACE
      ?auto_3598 - HOIST
      ?auto_3599 - SURFACE
      ?auto_3596 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3594 ?auto_3595 ) ( SURFACE-AT ?auto_3593 ?auto_3595 ) ( CLEAR ?auto_3593 ) ( IS-CRATE ?auto_3592 ) ( AVAILABLE ?auto_3594 ) ( not ( = ?auto_3597 ?auto_3595 ) ) ( HOIST-AT ?auto_3598 ?auto_3597 ) ( AVAILABLE ?auto_3598 ) ( SURFACE-AT ?auto_3592 ?auto_3597 ) ( ON ?auto_3592 ?auto_3599 ) ( CLEAR ?auto_3592 ) ( TRUCK-AT ?auto_3596 ?auto_3595 ) ( not ( = ?auto_3592 ?auto_3593 ) ) ( not ( = ?auto_3592 ?auto_3599 ) ) ( not ( = ?auto_3593 ?auto_3599 ) ) ( not ( = ?auto_3594 ?auto_3598 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3596 ?auto_3595 ?auto_3597 )
      ( !LIFT ?auto_3598 ?auto_3592 ?auto_3599 ?auto_3597 )
      ( !LOAD ?auto_3598 ?auto_3592 ?auto_3596 ?auto_3597 )
      ( !DRIVE ?auto_3596 ?auto_3597 ?auto_3595 )
      ( !UNLOAD ?auto_3594 ?auto_3592 ?auto_3596 ?auto_3595 )
      ( !DROP ?auto_3594 ?auto_3592 ?auto_3593 ?auto_3595 )
      ( MAKE-ON-VERIFY ?auto_3592 ?auto_3593 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3602 - SURFACE
      ?auto_3603 - SURFACE
    )
    :vars
    (
      ?auto_3604 - HOIST
      ?auto_3605 - PLACE
      ?auto_3607 - PLACE
      ?auto_3608 - HOIST
      ?auto_3609 - SURFACE
      ?auto_3606 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3604 ?auto_3605 ) ( SURFACE-AT ?auto_3603 ?auto_3605 ) ( CLEAR ?auto_3603 ) ( IS-CRATE ?auto_3602 ) ( AVAILABLE ?auto_3604 ) ( not ( = ?auto_3607 ?auto_3605 ) ) ( HOIST-AT ?auto_3608 ?auto_3607 ) ( AVAILABLE ?auto_3608 ) ( SURFACE-AT ?auto_3602 ?auto_3607 ) ( ON ?auto_3602 ?auto_3609 ) ( CLEAR ?auto_3602 ) ( TRUCK-AT ?auto_3606 ?auto_3605 ) ( not ( = ?auto_3602 ?auto_3603 ) ) ( not ( = ?auto_3602 ?auto_3609 ) ) ( not ( = ?auto_3603 ?auto_3609 ) ) ( not ( = ?auto_3604 ?auto_3608 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3606 ?auto_3605 ?auto_3607 )
      ( !LIFT ?auto_3608 ?auto_3602 ?auto_3609 ?auto_3607 )
      ( !LOAD ?auto_3608 ?auto_3602 ?auto_3606 ?auto_3607 )
      ( !DRIVE ?auto_3606 ?auto_3607 ?auto_3605 )
      ( !UNLOAD ?auto_3604 ?auto_3602 ?auto_3606 ?auto_3605 )
      ( !DROP ?auto_3604 ?auto_3602 ?auto_3603 ?auto_3605 )
      ( MAKE-ON-VERIFY ?auto_3602 ?auto_3603 ) )
  )

)

