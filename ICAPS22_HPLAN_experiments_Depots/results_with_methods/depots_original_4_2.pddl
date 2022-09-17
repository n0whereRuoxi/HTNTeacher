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
      ?auto_3577 - SURFACE
      ?auto_3578 - SURFACE
    )
    :vars
    (
      ?auto_3579 - HOIST
      ?auto_3580 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3579 ?auto_3580 ) ( SURFACE-AT ?auto_3578 ?auto_3580 ) ( CLEAR ?auto_3578 ) ( LIFTING ?auto_3579 ?auto_3577 ) ( IS-CRATE ?auto_3577 ) ( not ( = ?auto_3577 ?auto_3578 ) ) )
    :subtasks
    ( ( !DROP ?auto_3579 ?auto_3577 ?auto_3578 ?auto_3580 )
      ( MAKE-ON-VERIFY ?auto_3577 ?auto_3578 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3581 - SURFACE
      ?auto_3582 - SURFACE
    )
    :vars
    (
      ?auto_3584 - HOIST
      ?auto_3583 - PLACE
      ?auto_3585 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3584 ?auto_3583 ) ( SURFACE-AT ?auto_3582 ?auto_3583 ) ( CLEAR ?auto_3582 ) ( IS-CRATE ?auto_3581 ) ( not ( = ?auto_3581 ?auto_3582 ) ) ( TRUCK-AT ?auto_3585 ?auto_3583 ) ( AVAILABLE ?auto_3584 ) ( IN ?auto_3581 ?auto_3585 ) )
    :subtasks
    ( ( !UNLOAD ?auto_3584 ?auto_3581 ?auto_3585 ?auto_3583 )
      ( MAKE-ON ?auto_3581 ?auto_3582 )
      ( MAKE-ON-VERIFY ?auto_3581 ?auto_3582 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3586 - SURFACE
      ?auto_3587 - SURFACE
    )
    :vars
    (
      ?auto_3589 - HOIST
      ?auto_3588 - PLACE
      ?auto_3590 - TRUCK
      ?auto_3591 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3589 ?auto_3588 ) ( SURFACE-AT ?auto_3587 ?auto_3588 ) ( CLEAR ?auto_3587 ) ( IS-CRATE ?auto_3586 ) ( not ( = ?auto_3586 ?auto_3587 ) ) ( AVAILABLE ?auto_3589 ) ( IN ?auto_3586 ?auto_3590 ) ( TRUCK-AT ?auto_3590 ?auto_3591 ) ( not ( = ?auto_3591 ?auto_3588 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3590 ?auto_3591 ?auto_3588 )
      ( MAKE-ON ?auto_3586 ?auto_3587 )
      ( MAKE-ON-VERIFY ?auto_3586 ?auto_3587 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3592 - SURFACE
      ?auto_3593 - SURFACE
    )
    :vars
    (
      ?auto_3595 - HOIST
      ?auto_3594 - PLACE
      ?auto_3597 - TRUCK
      ?auto_3596 - PLACE
      ?auto_3598 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_3595 ?auto_3594 ) ( SURFACE-AT ?auto_3593 ?auto_3594 ) ( CLEAR ?auto_3593 ) ( IS-CRATE ?auto_3592 ) ( not ( = ?auto_3592 ?auto_3593 ) ) ( AVAILABLE ?auto_3595 ) ( TRUCK-AT ?auto_3597 ?auto_3596 ) ( not ( = ?auto_3596 ?auto_3594 ) ) ( HOIST-AT ?auto_3598 ?auto_3596 ) ( LIFTING ?auto_3598 ?auto_3592 ) ( not ( = ?auto_3595 ?auto_3598 ) ) )
    :subtasks
    ( ( !LOAD ?auto_3598 ?auto_3592 ?auto_3597 ?auto_3596 )
      ( MAKE-ON ?auto_3592 ?auto_3593 )
      ( MAKE-ON-VERIFY ?auto_3592 ?auto_3593 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3599 - SURFACE
      ?auto_3600 - SURFACE
    )
    :vars
    (
      ?auto_3601 - HOIST
      ?auto_3605 - PLACE
      ?auto_3602 - TRUCK
      ?auto_3604 - PLACE
      ?auto_3603 - HOIST
      ?auto_3606 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3601 ?auto_3605 ) ( SURFACE-AT ?auto_3600 ?auto_3605 ) ( CLEAR ?auto_3600 ) ( IS-CRATE ?auto_3599 ) ( not ( = ?auto_3599 ?auto_3600 ) ) ( AVAILABLE ?auto_3601 ) ( TRUCK-AT ?auto_3602 ?auto_3604 ) ( not ( = ?auto_3604 ?auto_3605 ) ) ( HOIST-AT ?auto_3603 ?auto_3604 ) ( not ( = ?auto_3601 ?auto_3603 ) ) ( AVAILABLE ?auto_3603 ) ( SURFACE-AT ?auto_3599 ?auto_3604 ) ( ON ?auto_3599 ?auto_3606 ) ( CLEAR ?auto_3599 ) ( not ( = ?auto_3599 ?auto_3606 ) ) ( not ( = ?auto_3600 ?auto_3606 ) ) )
    :subtasks
    ( ( !LIFT ?auto_3603 ?auto_3599 ?auto_3606 ?auto_3604 )
      ( MAKE-ON ?auto_3599 ?auto_3600 )
      ( MAKE-ON-VERIFY ?auto_3599 ?auto_3600 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3607 - SURFACE
      ?auto_3608 - SURFACE
    )
    :vars
    (
      ?auto_3609 - HOIST
      ?auto_3611 - PLACE
      ?auto_3614 - PLACE
      ?auto_3613 - HOIST
      ?auto_3612 - SURFACE
      ?auto_3610 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3609 ?auto_3611 ) ( SURFACE-AT ?auto_3608 ?auto_3611 ) ( CLEAR ?auto_3608 ) ( IS-CRATE ?auto_3607 ) ( not ( = ?auto_3607 ?auto_3608 ) ) ( AVAILABLE ?auto_3609 ) ( not ( = ?auto_3614 ?auto_3611 ) ) ( HOIST-AT ?auto_3613 ?auto_3614 ) ( not ( = ?auto_3609 ?auto_3613 ) ) ( AVAILABLE ?auto_3613 ) ( SURFACE-AT ?auto_3607 ?auto_3614 ) ( ON ?auto_3607 ?auto_3612 ) ( CLEAR ?auto_3607 ) ( not ( = ?auto_3607 ?auto_3612 ) ) ( not ( = ?auto_3608 ?auto_3612 ) ) ( TRUCK-AT ?auto_3610 ?auto_3611 ) )
    :subtasks
    ( ( !DRIVE ?auto_3610 ?auto_3611 ?auto_3614 )
      ( MAKE-ON ?auto_3607 ?auto_3608 )
      ( MAKE-ON-VERIFY ?auto_3607 ?auto_3608 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3617 - SURFACE
      ?auto_3618 - SURFACE
    )
    :vars
    (
      ?auto_3619 - HOIST
      ?auto_3620 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3619 ?auto_3620 ) ( SURFACE-AT ?auto_3618 ?auto_3620 ) ( CLEAR ?auto_3618 ) ( LIFTING ?auto_3619 ?auto_3617 ) ( IS-CRATE ?auto_3617 ) ( not ( = ?auto_3617 ?auto_3618 ) ) )
    :subtasks
    ( ( !DROP ?auto_3619 ?auto_3617 ?auto_3618 ?auto_3620 )
      ( MAKE-ON-VERIFY ?auto_3617 ?auto_3618 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3621 - SURFACE
      ?auto_3622 - SURFACE
    )
    :vars
    (
      ?auto_3624 - HOIST
      ?auto_3623 - PLACE
      ?auto_3625 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3624 ?auto_3623 ) ( SURFACE-AT ?auto_3622 ?auto_3623 ) ( CLEAR ?auto_3622 ) ( IS-CRATE ?auto_3621 ) ( not ( = ?auto_3621 ?auto_3622 ) ) ( TRUCK-AT ?auto_3625 ?auto_3623 ) ( AVAILABLE ?auto_3624 ) ( IN ?auto_3621 ?auto_3625 ) )
    :subtasks
    ( ( !UNLOAD ?auto_3624 ?auto_3621 ?auto_3625 ?auto_3623 )
      ( MAKE-ON ?auto_3621 ?auto_3622 )
      ( MAKE-ON-VERIFY ?auto_3621 ?auto_3622 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3626 - SURFACE
      ?auto_3627 - SURFACE
    )
    :vars
    (
      ?auto_3628 - HOIST
      ?auto_3630 - PLACE
      ?auto_3629 - TRUCK
      ?auto_3631 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3628 ?auto_3630 ) ( SURFACE-AT ?auto_3627 ?auto_3630 ) ( CLEAR ?auto_3627 ) ( IS-CRATE ?auto_3626 ) ( not ( = ?auto_3626 ?auto_3627 ) ) ( AVAILABLE ?auto_3628 ) ( IN ?auto_3626 ?auto_3629 ) ( TRUCK-AT ?auto_3629 ?auto_3631 ) ( not ( = ?auto_3631 ?auto_3630 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3629 ?auto_3631 ?auto_3630 )
      ( MAKE-ON ?auto_3626 ?auto_3627 )
      ( MAKE-ON-VERIFY ?auto_3626 ?auto_3627 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3632 - SURFACE
      ?auto_3633 - SURFACE
    )
    :vars
    (
      ?auto_3635 - HOIST
      ?auto_3637 - PLACE
      ?auto_3634 - TRUCK
      ?auto_3636 - PLACE
      ?auto_3638 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_3635 ?auto_3637 ) ( SURFACE-AT ?auto_3633 ?auto_3637 ) ( CLEAR ?auto_3633 ) ( IS-CRATE ?auto_3632 ) ( not ( = ?auto_3632 ?auto_3633 ) ) ( AVAILABLE ?auto_3635 ) ( TRUCK-AT ?auto_3634 ?auto_3636 ) ( not ( = ?auto_3636 ?auto_3637 ) ) ( HOIST-AT ?auto_3638 ?auto_3636 ) ( LIFTING ?auto_3638 ?auto_3632 ) ( not ( = ?auto_3635 ?auto_3638 ) ) )
    :subtasks
    ( ( !LOAD ?auto_3638 ?auto_3632 ?auto_3634 ?auto_3636 )
      ( MAKE-ON ?auto_3632 ?auto_3633 )
      ( MAKE-ON-VERIFY ?auto_3632 ?auto_3633 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3639 - SURFACE
      ?auto_3640 - SURFACE
    )
    :vars
    (
      ?auto_3642 - HOIST
      ?auto_3645 - PLACE
      ?auto_3643 - TRUCK
      ?auto_3644 - PLACE
      ?auto_3641 - HOIST
      ?auto_3646 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3642 ?auto_3645 ) ( SURFACE-AT ?auto_3640 ?auto_3645 ) ( CLEAR ?auto_3640 ) ( IS-CRATE ?auto_3639 ) ( not ( = ?auto_3639 ?auto_3640 ) ) ( AVAILABLE ?auto_3642 ) ( TRUCK-AT ?auto_3643 ?auto_3644 ) ( not ( = ?auto_3644 ?auto_3645 ) ) ( HOIST-AT ?auto_3641 ?auto_3644 ) ( not ( = ?auto_3642 ?auto_3641 ) ) ( AVAILABLE ?auto_3641 ) ( SURFACE-AT ?auto_3639 ?auto_3644 ) ( ON ?auto_3639 ?auto_3646 ) ( CLEAR ?auto_3639 ) ( not ( = ?auto_3639 ?auto_3646 ) ) ( not ( = ?auto_3640 ?auto_3646 ) ) )
    :subtasks
    ( ( !LIFT ?auto_3641 ?auto_3639 ?auto_3646 ?auto_3644 )
      ( MAKE-ON ?auto_3639 ?auto_3640 )
      ( MAKE-ON-VERIFY ?auto_3639 ?auto_3640 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3647 - SURFACE
      ?auto_3648 - SURFACE
    )
    :vars
    (
      ?auto_3651 - HOIST
      ?auto_3654 - PLACE
      ?auto_3650 - PLACE
      ?auto_3653 - HOIST
      ?auto_3652 - SURFACE
      ?auto_3649 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3651 ?auto_3654 ) ( SURFACE-AT ?auto_3648 ?auto_3654 ) ( CLEAR ?auto_3648 ) ( IS-CRATE ?auto_3647 ) ( not ( = ?auto_3647 ?auto_3648 ) ) ( AVAILABLE ?auto_3651 ) ( not ( = ?auto_3650 ?auto_3654 ) ) ( HOIST-AT ?auto_3653 ?auto_3650 ) ( not ( = ?auto_3651 ?auto_3653 ) ) ( AVAILABLE ?auto_3653 ) ( SURFACE-AT ?auto_3647 ?auto_3650 ) ( ON ?auto_3647 ?auto_3652 ) ( CLEAR ?auto_3647 ) ( not ( = ?auto_3647 ?auto_3652 ) ) ( not ( = ?auto_3648 ?auto_3652 ) ) ( TRUCK-AT ?auto_3649 ?auto_3654 ) )
    :subtasks
    ( ( !DRIVE ?auto_3649 ?auto_3654 ?auto_3650 )
      ( MAKE-ON ?auto_3647 ?auto_3648 )
      ( MAKE-ON-VERIFY ?auto_3647 ?auto_3648 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3655 - SURFACE
      ?auto_3656 - SURFACE
    )
    :vars
    (
      ?auto_3659 - HOIST
      ?auto_3658 - PLACE
      ?auto_3662 - PLACE
      ?auto_3660 - HOIST
      ?auto_3657 - SURFACE
      ?auto_3661 - TRUCK
      ?auto_3663 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3659 ?auto_3658 ) ( IS-CRATE ?auto_3655 ) ( not ( = ?auto_3655 ?auto_3656 ) ) ( not ( = ?auto_3662 ?auto_3658 ) ) ( HOIST-AT ?auto_3660 ?auto_3662 ) ( not ( = ?auto_3659 ?auto_3660 ) ) ( AVAILABLE ?auto_3660 ) ( SURFACE-AT ?auto_3655 ?auto_3662 ) ( ON ?auto_3655 ?auto_3657 ) ( CLEAR ?auto_3655 ) ( not ( = ?auto_3655 ?auto_3657 ) ) ( not ( = ?auto_3656 ?auto_3657 ) ) ( TRUCK-AT ?auto_3661 ?auto_3658 ) ( SURFACE-AT ?auto_3663 ?auto_3658 ) ( CLEAR ?auto_3663 ) ( LIFTING ?auto_3659 ?auto_3656 ) ( IS-CRATE ?auto_3656 ) ( not ( = ?auto_3655 ?auto_3663 ) ) ( not ( = ?auto_3656 ?auto_3663 ) ) ( not ( = ?auto_3657 ?auto_3663 ) ) )
    :subtasks
    ( ( !DROP ?auto_3659 ?auto_3656 ?auto_3663 ?auto_3658 )
      ( MAKE-ON ?auto_3655 ?auto_3656 )
      ( MAKE-ON-VERIFY ?auto_3655 ?auto_3656 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3664 - SURFACE
      ?auto_3665 - SURFACE
    )
    :vars
    (
      ?auto_3672 - HOIST
      ?auto_3670 - PLACE
      ?auto_3666 - PLACE
      ?auto_3671 - HOIST
      ?auto_3669 - SURFACE
      ?auto_3668 - TRUCK
      ?auto_3667 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3672 ?auto_3670 ) ( IS-CRATE ?auto_3664 ) ( not ( = ?auto_3664 ?auto_3665 ) ) ( not ( = ?auto_3666 ?auto_3670 ) ) ( HOIST-AT ?auto_3671 ?auto_3666 ) ( not ( = ?auto_3672 ?auto_3671 ) ) ( AVAILABLE ?auto_3671 ) ( SURFACE-AT ?auto_3664 ?auto_3666 ) ( ON ?auto_3664 ?auto_3669 ) ( CLEAR ?auto_3664 ) ( not ( = ?auto_3664 ?auto_3669 ) ) ( not ( = ?auto_3665 ?auto_3669 ) ) ( TRUCK-AT ?auto_3668 ?auto_3670 ) ( SURFACE-AT ?auto_3667 ?auto_3670 ) ( CLEAR ?auto_3667 ) ( IS-CRATE ?auto_3665 ) ( not ( = ?auto_3664 ?auto_3667 ) ) ( not ( = ?auto_3665 ?auto_3667 ) ) ( not ( = ?auto_3669 ?auto_3667 ) ) ( AVAILABLE ?auto_3672 ) ( IN ?auto_3665 ?auto_3668 ) )
    :subtasks
    ( ( !UNLOAD ?auto_3672 ?auto_3665 ?auto_3668 ?auto_3670 )
      ( MAKE-ON ?auto_3664 ?auto_3665 )
      ( MAKE-ON-VERIFY ?auto_3664 ?auto_3665 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3673 - SURFACE
      ?auto_3674 - SURFACE
    )
    :vars
    (
      ?auto_3680 - HOIST
      ?auto_3677 - PLACE
      ?auto_3678 - PLACE
      ?auto_3675 - HOIST
      ?auto_3681 - SURFACE
      ?auto_3676 - SURFACE
      ?auto_3679 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3680 ?auto_3677 ) ( IS-CRATE ?auto_3673 ) ( not ( = ?auto_3673 ?auto_3674 ) ) ( not ( = ?auto_3678 ?auto_3677 ) ) ( HOIST-AT ?auto_3675 ?auto_3678 ) ( not ( = ?auto_3680 ?auto_3675 ) ) ( AVAILABLE ?auto_3675 ) ( SURFACE-AT ?auto_3673 ?auto_3678 ) ( ON ?auto_3673 ?auto_3681 ) ( CLEAR ?auto_3673 ) ( not ( = ?auto_3673 ?auto_3681 ) ) ( not ( = ?auto_3674 ?auto_3681 ) ) ( SURFACE-AT ?auto_3676 ?auto_3677 ) ( CLEAR ?auto_3676 ) ( IS-CRATE ?auto_3674 ) ( not ( = ?auto_3673 ?auto_3676 ) ) ( not ( = ?auto_3674 ?auto_3676 ) ) ( not ( = ?auto_3681 ?auto_3676 ) ) ( AVAILABLE ?auto_3680 ) ( IN ?auto_3674 ?auto_3679 ) ( TRUCK-AT ?auto_3679 ?auto_3678 ) )
    :subtasks
    ( ( !DRIVE ?auto_3679 ?auto_3678 ?auto_3677 )
      ( MAKE-ON ?auto_3673 ?auto_3674 )
      ( MAKE-ON-VERIFY ?auto_3673 ?auto_3674 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3682 - SURFACE
      ?auto_3683 - SURFACE
    )
    :vars
    (
      ?auto_3690 - HOIST
      ?auto_3687 - PLACE
      ?auto_3685 - PLACE
      ?auto_3688 - HOIST
      ?auto_3686 - SURFACE
      ?auto_3684 - SURFACE
      ?auto_3689 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3690 ?auto_3687 ) ( IS-CRATE ?auto_3682 ) ( not ( = ?auto_3682 ?auto_3683 ) ) ( not ( = ?auto_3685 ?auto_3687 ) ) ( HOIST-AT ?auto_3688 ?auto_3685 ) ( not ( = ?auto_3690 ?auto_3688 ) ) ( SURFACE-AT ?auto_3682 ?auto_3685 ) ( ON ?auto_3682 ?auto_3686 ) ( CLEAR ?auto_3682 ) ( not ( = ?auto_3682 ?auto_3686 ) ) ( not ( = ?auto_3683 ?auto_3686 ) ) ( SURFACE-AT ?auto_3684 ?auto_3687 ) ( CLEAR ?auto_3684 ) ( IS-CRATE ?auto_3683 ) ( not ( = ?auto_3682 ?auto_3684 ) ) ( not ( = ?auto_3683 ?auto_3684 ) ) ( not ( = ?auto_3686 ?auto_3684 ) ) ( AVAILABLE ?auto_3690 ) ( TRUCK-AT ?auto_3689 ?auto_3685 ) ( LIFTING ?auto_3688 ?auto_3683 ) )
    :subtasks
    ( ( !LOAD ?auto_3688 ?auto_3683 ?auto_3689 ?auto_3685 )
      ( MAKE-ON ?auto_3682 ?auto_3683 )
      ( MAKE-ON-VERIFY ?auto_3682 ?auto_3683 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3691 - SURFACE
      ?auto_3692 - SURFACE
    )
    :vars
    (
      ?auto_3698 - HOIST
      ?auto_3694 - PLACE
      ?auto_3695 - PLACE
      ?auto_3697 - HOIST
      ?auto_3699 - SURFACE
      ?auto_3696 - SURFACE
      ?auto_3693 - TRUCK
      ?auto_3700 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3698 ?auto_3694 ) ( IS-CRATE ?auto_3691 ) ( not ( = ?auto_3691 ?auto_3692 ) ) ( not ( = ?auto_3695 ?auto_3694 ) ) ( HOIST-AT ?auto_3697 ?auto_3695 ) ( not ( = ?auto_3698 ?auto_3697 ) ) ( SURFACE-AT ?auto_3691 ?auto_3695 ) ( ON ?auto_3691 ?auto_3699 ) ( CLEAR ?auto_3691 ) ( not ( = ?auto_3691 ?auto_3699 ) ) ( not ( = ?auto_3692 ?auto_3699 ) ) ( SURFACE-AT ?auto_3696 ?auto_3694 ) ( CLEAR ?auto_3696 ) ( IS-CRATE ?auto_3692 ) ( not ( = ?auto_3691 ?auto_3696 ) ) ( not ( = ?auto_3692 ?auto_3696 ) ) ( not ( = ?auto_3699 ?auto_3696 ) ) ( AVAILABLE ?auto_3698 ) ( TRUCK-AT ?auto_3693 ?auto_3695 ) ( AVAILABLE ?auto_3697 ) ( SURFACE-AT ?auto_3692 ?auto_3695 ) ( ON ?auto_3692 ?auto_3700 ) ( CLEAR ?auto_3692 ) ( not ( = ?auto_3691 ?auto_3700 ) ) ( not ( = ?auto_3692 ?auto_3700 ) ) ( not ( = ?auto_3699 ?auto_3700 ) ) ( not ( = ?auto_3696 ?auto_3700 ) ) )
    :subtasks
    ( ( !LIFT ?auto_3697 ?auto_3692 ?auto_3700 ?auto_3695 )
      ( MAKE-ON ?auto_3691 ?auto_3692 )
      ( MAKE-ON-VERIFY ?auto_3691 ?auto_3692 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3701 - SURFACE
      ?auto_3702 - SURFACE
    )
    :vars
    (
      ?auto_3706 - HOIST
      ?auto_3709 - PLACE
      ?auto_3708 - PLACE
      ?auto_3710 - HOIST
      ?auto_3705 - SURFACE
      ?auto_3707 - SURFACE
      ?auto_3703 - SURFACE
      ?auto_3704 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3706 ?auto_3709 ) ( IS-CRATE ?auto_3701 ) ( not ( = ?auto_3701 ?auto_3702 ) ) ( not ( = ?auto_3708 ?auto_3709 ) ) ( HOIST-AT ?auto_3710 ?auto_3708 ) ( not ( = ?auto_3706 ?auto_3710 ) ) ( SURFACE-AT ?auto_3701 ?auto_3708 ) ( ON ?auto_3701 ?auto_3705 ) ( CLEAR ?auto_3701 ) ( not ( = ?auto_3701 ?auto_3705 ) ) ( not ( = ?auto_3702 ?auto_3705 ) ) ( SURFACE-AT ?auto_3707 ?auto_3709 ) ( CLEAR ?auto_3707 ) ( IS-CRATE ?auto_3702 ) ( not ( = ?auto_3701 ?auto_3707 ) ) ( not ( = ?auto_3702 ?auto_3707 ) ) ( not ( = ?auto_3705 ?auto_3707 ) ) ( AVAILABLE ?auto_3706 ) ( AVAILABLE ?auto_3710 ) ( SURFACE-AT ?auto_3702 ?auto_3708 ) ( ON ?auto_3702 ?auto_3703 ) ( CLEAR ?auto_3702 ) ( not ( = ?auto_3701 ?auto_3703 ) ) ( not ( = ?auto_3702 ?auto_3703 ) ) ( not ( = ?auto_3705 ?auto_3703 ) ) ( not ( = ?auto_3707 ?auto_3703 ) ) ( TRUCK-AT ?auto_3704 ?auto_3709 ) )
    :subtasks
    ( ( !DRIVE ?auto_3704 ?auto_3709 ?auto_3708 )
      ( MAKE-ON ?auto_3701 ?auto_3702 )
      ( MAKE-ON-VERIFY ?auto_3701 ?auto_3702 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3713 - SURFACE
      ?auto_3714 - SURFACE
    )
    :vars
    (
      ?auto_3715 - HOIST
      ?auto_3716 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3715 ?auto_3716 ) ( SURFACE-AT ?auto_3714 ?auto_3716 ) ( CLEAR ?auto_3714 ) ( LIFTING ?auto_3715 ?auto_3713 ) ( IS-CRATE ?auto_3713 ) ( not ( = ?auto_3713 ?auto_3714 ) ) )
    :subtasks
    ( ( !DROP ?auto_3715 ?auto_3713 ?auto_3714 ?auto_3716 )
      ( MAKE-ON-VERIFY ?auto_3713 ?auto_3714 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3717 - SURFACE
      ?auto_3718 - SURFACE
    )
    :vars
    (
      ?auto_3719 - HOIST
      ?auto_3720 - PLACE
      ?auto_3721 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3719 ?auto_3720 ) ( SURFACE-AT ?auto_3718 ?auto_3720 ) ( CLEAR ?auto_3718 ) ( IS-CRATE ?auto_3717 ) ( not ( = ?auto_3717 ?auto_3718 ) ) ( TRUCK-AT ?auto_3721 ?auto_3720 ) ( AVAILABLE ?auto_3719 ) ( IN ?auto_3717 ?auto_3721 ) )
    :subtasks
    ( ( !UNLOAD ?auto_3719 ?auto_3717 ?auto_3721 ?auto_3720 )
      ( MAKE-ON ?auto_3717 ?auto_3718 )
      ( MAKE-ON-VERIFY ?auto_3717 ?auto_3718 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3722 - SURFACE
      ?auto_3723 - SURFACE
    )
    :vars
    (
      ?auto_3725 - HOIST
      ?auto_3724 - PLACE
      ?auto_3726 - TRUCK
      ?auto_3727 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3725 ?auto_3724 ) ( SURFACE-AT ?auto_3723 ?auto_3724 ) ( CLEAR ?auto_3723 ) ( IS-CRATE ?auto_3722 ) ( not ( = ?auto_3722 ?auto_3723 ) ) ( AVAILABLE ?auto_3725 ) ( IN ?auto_3722 ?auto_3726 ) ( TRUCK-AT ?auto_3726 ?auto_3727 ) ( not ( = ?auto_3727 ?auto_3724 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3726 ?auto_3727 ?auto_3724 )
      ( MAKE-ON ?auto_3722 ?auto_3723 )
      ( MAKE-ON-VERIFY ?auto_3722 ?auto_3723 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3728 - SURFACE
      ?auto_3729 - SURFACE
    )
    :vars
    (
      ?auto_3731 - HOIST
      ?auto_3730 - PLACE
      ?auto_3732 - TRUCK
      ?auto_3733 - PLACE
      ?auto_3734 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_3731 ?auto_3730 ) ( SURFACE-AT ?auto_3729 ?auto_3730 ) ( CLEAR ?auto_3729 ) ( IS-CRATE ?auto_3728 ) ( not ( = ?auto_3728 ?auto_3729 ) ) ( AVAILABLE ?auto_3731 ) ( TRUCK-AT ?auto_3732 ?auto_3733 ) ( not ( = ?auto_3733 ?auto_3730 ) ) ( HOIST-AT ?auto_3734 ?auto_3733 ) ( LIFTING ?auto_3734 ?auto_3728 ) ( not ( = ?auto_3731 ?auto_3734 ) ) )
    :subtasks
    ( ( !LOAD ?auto_3734 ?auto_3728 ?auto_3732 ?auto_3733 )
      ( MAKE-ON ?auto_3728 ?auto_3729 )
      ( MAKE-ON-VERIFY ?auto_3728 ?auto_3729 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3735 - SURFACE
      ?auto_3736 - SURFACE
    )
    :vars
    (
      ?auto_3737 - HOIST
      ?auto_3739 - PLACE
      ?auto_3740 - TRUCK
      ?auto_3741 - PLACE
      ?auto_3738 - HOIST
      ?auto_3742 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3737 ?auto_3739 ) ( SURFACE-AT ?auto_3736 ?auto_3739 ) ( CLEAR ?auto_3736 ) ( IS-CRATE ?auto_3735 ) ( not ( = ?auto_3735 ?auto_3736 ) ) ( AVAILABLE ?auto_3737 ) ( TRUCK-AT ?auto_3740 ?auto_3741 ) ( not ( = ?auto_3741 ?auto_3739 ) ) ( HOIST-AT ?auto_3738 ?auto_3741 ) ( not ( = ?auto_3737 ?auto_3738 ) ) ( AVAILABLE ?auto_3738 ) ( SURFACE-AT ?auto_3735 ?auto_3741 ) ( ON ?auto_3735 ?auto_3742 ) ( CLEAR ?auto_3735 ) ( not ( = ?auto_3735 ?auto_3742 ) ) ( not ( = ?auto_3736 ?auto_3742 ) ) )
    :subtasks
    ( ( !LIFT ?auto_3738 ?auto_3735 ?auto_3742 ?auto_3741 )
      ( MAKE-ON ?auto_3735 ?auto_3736 )
      ( MAKE-ON-VERIFY ?auto_3735 ?auto_3736 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3743 - SURFACE
      ?auto_3744 - SURFACE
    )
    :vars
    (
      ?auto_3745 - HOIST
      ?auto_3748 - PLACE
      ?auto_3747 - PLACE
      ?auto_3749 - HOIST
      ?auto_3746 - SURFACE
      ?auto_3750 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3745 ?auto_3748 ) ( SURFACE-AT ?auto_3744 ?auto_3748 ) ( CLEAR ?auto_3744 ) ( IS-CRATE ?auto_3743 ) ( not ( = ?auto_3743 ?auto_3744 ) ) ( AVAILABLE ?auto_3745 ) ( not ( = ?auto_3747 ?auto_3748 ) ) ( HOIST-AT ?auto_3749 ?auto_3747 ) ( not ( = ?auto_3745 ?auto_3749 ) ) ( AVAILABLE ?auto_3749 ) ( SURFACE-AT ?auto_3743 ?auto_3747 ) ( ON ?auto_3743 ?auto_3746 ) ( CLEAR ?auto_3743 ) ( not ( = ?auto_3743 ?auto_3746 ) ) ( not ( = ?auto_3744 ?auto_3746 ) ) ( TRUCK-AT ?auto_3750 ?auto_3748 ) )
    :subtasks
    ( ( !DRIVE ?auto_3750 ?auto_3748 ?auto_3747 )
      ( MAKE-ON ?auto_3743 ?auto_3744 )
      ( MAKE-ON-VERIFY ?auto_3743 ?auto_3744 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3751 - SURFACE
      ?auto_3752 - SURFACE
    )
    :vars
    (
      ?auto_3754 - HOIST
      ?auto_3753 - PLACE
      ?auto_3757 - PLACE
      ?auto_3756 - HOIST
      ?auto_3755 - SURFACE
      ?auto_3758 - TRUCK
      ?auto_3759 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3754 ?auto_3753 ) ( IS-CRATE ?auto_3751 ) ( not ( = ?auto_3751 ?auto_3752 ) ) ( not ( = ?auto_3757 ?auto_3753 ) ) ( HOIST-AT ?auto_3756 ?auto_3757 ) ( not ( = ?auto_3754 ?auto_3756 ) ) ( AVAILABLE ?auto_3756 ) ( SURFACE-AT ?auto_3751 ?auto_3757 ) ( ON ?auto_3751 ?auto_3755 ) ( CLEAR ?auto_3751 ) ( not ( = ?auto_3751 ?auto_3755 ) ) ( not ( = ?auto_3752 ?auto_3755 ) ) ( TRUCK-AT ?auto_3758 ?auto_3753 ) ( SURFACE-AT ?auto_3759 ?auto_3753 ) ( CLEAR ?auto_3759 ) ( LIFTING ?auto_3754 ?auto_3752 ) ( IS-CRATE ?auto_3752 ) ( not ( = ?auto_3751 ?auto_3759 ) ) ( not ( = ?auto_3752 ?auto_3759 ) ) ( not ( = ?auto_3755 ?auto_3759 ) ) )
    :subtasks
    ( ( !DROP ?auto_3754 ?auto_3752 ?auto_3759 ?auto_3753 )
      ( MAKE-ON ?auto_3751 ?auto_3752 )
      ( MAKE-ON-VERIFY ?auto_3751 ?auto_3752 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3760 - SURFACE
      ?auto_3761 - SURFACE
    )
    :vars
    (
      ?auto_3763 - HOIST
      ?auto_3765 - PLACE
      ?auto_3767 - PLACE
      ?auto_3766 - HOIST
      ?auto_3764 - SURFACE
      ?auto_3762 - TRUCK
      ?auto_3768 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3763 ?auto_3765 ) ( IS-CRATE ?auto_3760 ) ( not ( = ?auto_3760 ?auto_3761 ) ) ( not ( = ?auto_3767 ?auto_3765 ) ) ( HOIST-AT ?auto_3766 ?auto_3767 ) ( not ( = ?auto_3763 ?auto_3766 ) ) ( AVAILABLE ?auto_3766 ) ( SURFACE-AT ?auto_3760 ?auto_3767 ) ( ON ?auto_3760 ?auto_3764 ) ( CLEAR ?auto_3760 ) ( not ( = ?auto_3760 ?auto_3764 ) ) ( not ( = ?auto_3761 ?auto_3764 ) ) ( TRUCK-AT ?auto_3762 ?auto_3765 ) ( SURFACE-AT ?auto_3768 ?auto_3765 ) ( CLEAR ?auto_3768 ) ( IS-CRATE ?auto_3761 ) ( not ( = ?auto_3760 ?auto_3768 ) ) ( not ( = ?auto_3761 ?auto_3768 ) ) ( not ( = ?auto_3764 ?auto_3768 ) ) ( AVAILABLE ?auto_3763 ) ( IN ?auto_3761 ?auto_3762 ) )
    :subtasks
    ( ( !UNLOAD ?auto_3763 ?auto_3761 ?auto_3762 ?auto_3765 )
      ( MAKE-ON ?auto_3760 ?auto_3761 )
      ( MAKE-ON-VERIFY ?auto_3760 ?auto_3761 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3769 - SURFACE
      ?auto_3770 - SURFACE
    )
    :vars
    (
      ?auto_3773 - HOIST
      ?auto_3775 - PLACE
      ?auto_3776 - PLACE
      ?auto_3777 - HOIST
      ?auto_3771 - SURFACE
      ?auto_3772 - SURFACE
      ?auto_3774 - TRUCK
      ?auto_3778 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3773 ?auto_3775 ) ( IS-CRATE ?auto_3769 ) ( not ( = ?auto_3769 ?auto_3770 ) ) ( not ( = ?auto_3776 ?auto_3775 ) ) ( HOIST-AT ?auto_3777 ?auto_3776 ) ( not ( = ?auto_3773 ?auto_3777 ) ) ( AVAILABLE ?auto_3777 ) ( SURFACE-AT ?auto_3769 ?auto_3776 ) ( ON ?auto_3769 ?auto_3771 ) ( CLEAR ?auto_3769 ) ( not ( = ?auto_3769 ?auto_3771 ) ) ( not ( = ?auto_3770 ?auto_3771 ) ) ( SURFACE-AT ?auto_3772 ?auto_3775 ) ( CLEAR ?auto_3772 ) ( IS-CRATE ?auto_3770 ) ( not ( = ?auto_3769 ?auto_3772 ) ) ( not ( = ?auto_3770 ?auto_3772 ) ) ( not ( = ?auto_3771 ?auto_3772 ) ) ( AVAILABLE ?auto_3773 ) ( IN ?auto_3770 ?auto_3774 ) ( TRUCK-AT ?auto_3774 ?auto_3778 ) ( not ( = ?auto_3778 ?auto_3775 ) ) ( not ( = ?auto_3776 ?auto_3778 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3774 ?auto_3778 ?auto_3775 )
      ( MAKE-ON ?auto_3769 ?auto_3770 )
      ( MAKE-ON-VERIFY ?auto_3769 ?auto_3770 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3779 - SURFACE
      ?auto_3780 - SURFACE
    )
    :vars
    (
      ?auto_3781 - HOIST
      ?auto_3782 - PLACE
      ?auto_3785 - PLACE
      ?auto_3786 - HOIST
      ?auto_3784 - SURFACE
      ?auto_3783 - SURFACE
      ?auto_3787 - TRUCK
      ?auto_3788 - PLACE
      ?auto_3789 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_3781 ?auto_3782 ) ( IS-CRATE ?auto_3779 ) ( not ( = ?auto_3779 ?auto_3780 ) ) ( not ( = ?auto_3785 ?auto_3782 ) ) ( HOIST-AT ?auto_3786 ?auto_3785 ) ( not ( = ?auto_3781 ?auto_3786 ) ) ( AVAILABLE ?auto_3786 ) ( SURFACE-AT ?auto_3779 ?auto_3785 ) ( ON ?auto_3779 ?auto_3784 ) ( CLEAR ?auto_3779 ) ( not ( = ?auto_3779 ?auto_3784 ) ) ( not ( = ?auto_3780 ?auto_3784 ) ) ( SURFACE-AT ?auto_3783 ?auto_3782 ) ( CLEAR ?auto_3783 ) ( IS-CRATE ?auto_3780 ) ( not ( = ?auto_3779 ?auto_3783 ) ) ( not ( = ?auto_3780 ?auto_3783 ) ) ( not ( = ?auto_3784 ?auto_3783 ) ) ( AVAILABLE ?auto_3781 ) ( TRUCK-AT ?auto_3787 ?auto_3788 ) ( not ( = ?auto_3788 ?auto_3782 ) ) ( not ( = ?auto_3785 ?auto_3788 ) ) ( HOIST-AT ?auto_3789 ?auto_3788 ) ( LIFTING ?auto_3789 ?auto_3780 ) ( not ( = ?auto_3781 ?auto_3789 ) ) ( not ( = ?auto_3786 ?auto_3789 ) ) )
    :subtasks
    ( ( !LOAD ?auto_3789 ?auto_3780 ?auto_3787 ?auto_3788 )
      ( MAKE-ON ?auto_3779 ?auto_3780 )
      ( MAKE-ON-VERIFY ?auto_3779 ?auto_3780 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3790 - SURFACE
      ?auto_3791 - SURFACE
    )
    :vars
    (
      ?auto_3792 - HOIST
      ?auto_3799 - PLACE
      ?auto_3796 - PLACE
      ?auto_3800 - HOIST
      ?auto_3794 - SURFACE
      ?auto_3798 - SURFACE
      ?auto_3793 - TRUCK
      ?auto_3797 - PLACE
      ?auto_3795 - HOIST
      ?auto_3801 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3792 ?auto_3799 ) ( IS-CRATE ?auto_3790 ) ( not ( = ?auto_3790 ?auto_3791 ) ) ( not ( = ?auto_3796 ?auto_3799 ) ) ( HOIST-AT ?auto_3800 ?auto_3796 ) ( not ( = ?auto_3792 ?auto_3800 ) ) ( AVAILABLE ?auto_3800 ) ( SURFACE-AT ?auto_3790 ?auto_3796 ) ( ON ?auto_3790 ?auto_3794 ) ( CLEAR ?auto_3790 ) ( not ( = ?auto_3790 ?auto_3794 ) ) ( not ( = ?auto_3791 ?auto_3794 ) ) ( SURFACE-AT ?auto_3798 ?auto_3799 ) ( CLEAR ?auto_3798 ) ( IS-CRATE ?auto_3791 ) ( not ( = ?auto_3790 ?auto_3798 ) ) ( not ( = ?auto_3791 ?auto_3798 ) ) ( not ( = ?auto_3794 ?auto_3798 ) ) ( AVAILABLE ?auto_3792 ) ( TRUCK-AT ?auto_3793 ?auto_3797 ) ( not ( = ?auto_3797 ?auto_3799 ) ) ( not ( = ?auto_3796 ?auto_3797 ) ) ( HOIST-AT ?auto_3795 ?auto_3797 ) ( not ( = ?auto_3792 ?auto_3795 ) ) ( not ( = ?auto_3800 ?auto_3795 ) ) ( AVAILABLE ?auto_3795 ) ( SURFACE-AT ?auto_3791 ?auto_3797 ) ( ON ?auto_3791 ?auto_3801 ) ( CLEAR ?auto_3791 ) ( not ( = ?auto_3790 ?auto_3801 ) ) ( not ( = ?auto_3791 ?auto_3801 ) ) ( not ( = ?auto_3794 ?auto_3801 ) ) ( not ( = ?auto_3798 ?auto_3801 ) ) )
    :subtasks
    ( ( !LIFT ?auto_3795 ?auto_3791 ?auto_3801 ?auto_3797 )
      ( MAKE-ON ?auto_3790 ?auto_3791 )
      ( MAKE-ON-VERIFY ?auto_3790 ?auto_3791 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3802 - SURFACE
      ?auto_3803 - SURFACE
    )
    :vars
    (
      ?auto_3811 - HOIST
      ?auto_3810 - PLACE
      ?auto_3809 - PLACE
      ?auto_3807 - HOIST
      ?auto_3806 - SURFACE
      ?auto_3804 - SURFACE
      ?auto_3812 - PLACE
      ?auto_3813 - HOIST
      ?auto_3808 - SURFACE
      ?auto_3805 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3811 ?auto_3810 ) ( IS-CRATE ?auto_3802 ) ( not ( = ?auto_3802 ?auto_3803 ) ) ( not ( = ?auto_3809 ?auto_3810 ) ) ( HOIST-AT ?auto_3807 ?auto_3809 ) ( not ( = ?auto_3811 ?auto_3807 ) ) ( AVAILABLE ?auto_3807 ) ( SURFACE-AT ?auto_3802 ?auto_3809 ) ( ON ?auto_3802 ?auto_3806 ) ( CLEAR ?auto_3802 ) ( not ( = ?auto_3802 ?auto_3806 ) ) ( not ( = ?auto_3803 ?auto_3806 ) ) ( SURFACE-AT ?auto_3804 ?auto_3810 ) ( CLEAR ?auto_3804 ) ( IS-CRATE ?auto_3803 ) ( not ( = ?auto_3802 ?auto_3804 ) ) ( not ( = ?auto_3803 ?auto_3804 ) ) ( not ( = ?auto_3806 ?auto_3804 ) ) ( AVAILABLE ?auto_3811 ) ( not ( = ?auto_3812 ?auto_3810 ) ) ( not ( = ?auto_3809 ?auto_3812 ) ) ( HOIST-AT ?auto_3813 ?auto_3812 ) ( not ( = ?auto_3811 ?auto_3813 ) ) ( not ( = ?auto_3807 ?auto_3813 ) ) ( AVAILABLE ?auto_3813 ) ( SURFACE-AT ?auto_3803 ?auto_3812 ) ( ON ?auto_3803 ?auto_3808 ) ( CLEAR ?auto_3803 ) ( not ( = ?auto_3802 ?auto_3808 ) ) ( not ( = ?auto_3803 ?auto_3808 ) ) ( not ( = ?auto_3806 ?auto_3808 ) ) ( not ( = ?auto_3804 ?auto_3808 ) ) ( TRUCK-AT ?auto_3805 ?auto_3810 ) )
    :subtasks
    ( ( !DRIVE ?auto_3805 ?auto_3810 ?auto_3812 )
      ( MAKE-ON ?auto_3802 ?auto_3803 )
      ( MAKE-ON-VERIFY ?auto_3802 ?auto_3803 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3814 - SURFACE
      ?auto_3815 - SURFACE
    )
    :vars
    (
      ?auto_3816 - HOIST
      ?auto_3825 - PLACE
      ?auto_3824 - PLACE
      ?auto_3822 - HOIST
      ?auto_3821 - SURFACE
      ?auto_3819 - SURFACE
      ?auto_3820 - PLACE
      ?auto_3818 - HOIST
      ?auto_3823 - SURFACE
      ?auto_3817 - TRUCK
      ?auto_3826 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3816 ?auto_3825 ) ( IS-CRATE ?auto_3814 ) ( not ( = ?auto_3814 ?auto_3815 ) ) ( not ( = ?auto_3824 ?auto_3825 ) ) ( HOIST-AT ?auto_3822 ?auto_3824 ) ( not ( = ?auto_3816 ?auto_3822 ) ) ( AVAILABLE ?auto_3822 ) ( SURFACE-AT ?auto_3814 ?auto_3824 ) ( ON ?auto_3814 ?auto_3821 ) ( CLEAR ?auto_3814 ) ( not ( = ?auto_3814 ?auto_3821 ) ) ( not ( = ?auto_3815 ?auto_3821 ) ) ( IS-CRATE ?auto_3815 ) ( not ( = ?auto_3814 ?auto_3819 ) ) ( not ( = ?auto_3815 ?auto_3819 ) ) ( not ( = ?auto_3821 ?auto_3819 ) ) ( not ( = ?auto_3820 ?auto_3825 ) ) ( not ( = ?auto_3824 ?auto_3820 ) ) ( HOIST-AT ?auto_3818 ?auto_3820 ) ( not ( = ?auto_3816 ?auto_3818 ) ) ( not ( = ?auto_3822 ?auto_3818 ) ) ( AVAILABLE ?auto_3818 ) ( SURFACE-AT ?auto_3815 ?auto_3820 ) ( ON ?auto_3815 ?auto_3823 ) ( CLEAR ?auto_3815 ) ( not ( = ?auto_3814 ?auto_3823 ) ) ( not ( = ?auto_3815 ?auto_3823 ) ) ( not ( = ?auto_3821 ?auto_3823 ) ) ( not ( = ?auto_3819 ?auto_3823 ) ) ( TRUCK-AT ?auto_3817 ?auto_3825 ) ( SURFACE-AT ?auto_3826 ?auto_3825 ) ( CLEAR ?auto_3826 ) ( LIFTING ?auto_3816 ?auto_3819 ) ( IS-CRATE ?auto_3819 ) ( not ( = ?auto_3814 ?auto_3826 ) ) ( not ( = ?auto_3815 ?auto_3826 ) ) ( not ( = ?auto_3821 ?auto_3826 ) ) ( not ( = ?auto_3819 ?auto_3826 ) ) ( not ( = ?auto_3823 ?auto_3826 ) ) )
    :subtasks
    ( ( !DROP ?auto_3816 ?auto_3819 ?auto_3826 ?auto_3825 )
      ( MAKE-ON ?auto_3814 ?auto_3815 )
      ( MAKE-ON-VERIFY ?auto_3814 ?auto_3815 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3827 - SURFACE
      ?auto_3828 - SURFACE
    )
    :vars
    (
      ?auto_3837 - HOIST
      ?auto_3836 - PLACE
      ?auto_3833 - PLACE
      ?auto_3838 - HOIST
      ?auto_3839 - SURFACE
      ?auto_3832 - SURFACE
      ?auto_3829 - PLACE
      ?auto_3831 - HOIST
      ?auto_3835 - SURFACE
      ?auto_3830 - TRUCK
      ?auto_3834 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3837 ?auto_3836 ) ( IS-CRATE ?auto_3827 ) ( not ( = ?auto_3827 ?auto_3828 ) ) ( not ( = ?auto_3833 ?auto_3836 ) ) ( HOIST-AT ?auto_3838 ?auto_3833 ) ( not ( = ?auto_3837 ?auto_3838 ) ) ( AVAILABLE ?auto_3838 ) ( SURFACE-AT ?auto_3827 ?auto_3833 ) ( ON ?auto_3827 ?auto_3839 ) ( CLEAR ?auto_3827 ) ( not ( = ?auto_3827 ?auto_3839 ) ) ( not ( = ?auto_3828 ?auto_3839 ) ) ( IS-CRATE ?auto_3828 ) ( not ( = ?auto_3827 ?auto_3832 ) ) ( not ( = ?auto_3828 ?auto_3832 ) ) ( not ( = ?auto_3839 ?auto_3832 ) ) ( not ( = ?auto_3829 ?auto_3836 ) ) ( not ( = ?auto_3833 ?auto_3829 ) ) ( HOIST-AT ?auto_3831 ?auto_3829 ) ( not ( = ?auto_3837 ?auto_3831 ) ) ( not ( = ?auto_3838 ?auto_3831 ) ) ( AVAILABLE ?auto_3831 ) ( SURFACE-AT ?auto_3828 ?auto_3829 ) ( ON ?auto_3828 ?auto_3835 ) ( CLEAR ?auto_3828 ) ( not ( = ?auto_3827 ?auto_3835 ) ) ( not ( = ?auto_3828 ?auto_3835 ) ) ( not ( = ?auto_3839 ?auto_3835 ) ) ( not ( = ?auto_3832 ?auto_3835 ) ) ( TRUCK-AT ?auto_3830 ?auto_3836 ) ( SURFACE-AT ?auto_3834 ?auto_3836 ) ( CLEAR ?auto_3834 ) ( IS-CRATE ?auto_3832 ) ( not ( = ?auto_3827 ?auto_3834 ) ) ( not ( = ?auto_3828 ?auto_3834 ) ) ( not ( = ?auto_3839 ?auto_3834 ) ) ( not ( = ?auto_3832 ?auto_3834 ) ) ( not ( = ?auto_3835 ?auto_3834 ) ) ( AVAILABLE ?auto_3837 ) ( IN ?auto_3832 ?auto_3830 ) )
    :subtasks
    ( ( !UNLOAD ?auto_3837 ?auto_3832 ?auto_3830 ?auto_3836 )
      ( MAKE-ON ?auto_3827 ?auto_3828 )
      ( MAKE-ON-VERIFY ?auto_3827 ?auto_3828 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3840 - SURFACE
      ?auto_3841 - SURFACE
    )
    :vars
    (
      ?auto_3843 - HOIST
      ?auto_3848 - PLACE
      ?auto_3844 - PLACE
      ?auto_3851 - HOIST
      ?auto_3847 - SURFACE
      ?auto_3846 - SURFACE
      ?auto_3845 - PLACE
      ?auto_3852 - HOIST
      ?auto_3849 - SURFACE
      ?auto_3850 - SURFACE
      ?auto_3842 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3843 ?auto_3848 ) ( IS-CRATE ?auto_3840 ) ( not ( = ?auto_3840 ?auto_3841 ) ) ( not ( = ?auto_3844 ?auto_3848 ) ) ( HOIST-AT ?auto_3851 ?auto_3844 ) ( not ( = ?auto_3843 ?auto_3851 ) ) ( AVAILABLE ?auto_3851 ) ( SURFACE-AT ?auto_3840 ?auto_3844 ) ( ON ?auto_3840 ?auto_3847 ) ( CLEAR ?auto_3840 ) ( not ( = ?auto_3840 ?auto_3847 ) ) ( not ( = ?auto_3841 ?auto_3847 ) ) ( IS-CRATE ?auto_3841 ) ( not ( = ?auto_3840 ?auto_3846 ) ) ( not ( = ?auto_3841 ?auto_3846 ) ) ( not ( = ?auto_3847 ?auto_3846 ) ) ( not ( = ?auto_3845 ?auto_3848 ) ) ( not ( = ?auto_3844 ?auto_3845 ) ) ( HOIST-AT ?auto_3852 ?auto_3845 ) ( not ( = ?auto_3843 ?auto_3852 ) ) ( not ( = ?auto_3851 ?auto_3852 ) ) ( AVAILABLE ?auto_3852 ) ( SURFACE-AT ?auto_3841 ?auto_3845 ) ( ON ?auto_3841 ?auto_3849 ) ( CLEAR ?auto_3841 ) ( not ( = ?auto_3840 ?auto_3849 ) ) ( not ( = ?auto_3841 ?auto_3849 ) ) ( not ( = ?auto_3847 ?auto_3849 ) ) ( not ( = ?auto_3846 ?auto_3849 ) ) ( SURFACE-AT ?auto_3850 ?auto_3848 ) ( CLEAR ?auto_3850 ) ( IS-CRATE ?auto_3846 ) ( not ( = ?auto_3840 ?auto_3850 ) ) ( not ( = ?auto_3841 ?auto_3850 ) ) ( not ( = ?auto_3847 ?auto_3850 ) ) ( not ( = ?auto_3846 ?auto_3850 ) ) ( not ( = ?auto_3849 ?auto_3850 ) ) ( AVAILABLE ?auto_3843 ) ( IN ?auto_3846 ?auto_3842 ) ( TRUCK-AT ?auto_3842 ?auto_3845 ) )
    :subtasks
    ( ( !DRIVE ?auto_3842 ?auto_3845 ?auto_3848 )
      ( MAKE-ON ?auto_3840 ?auto_3841 )
      ( MAKE-ON-VERIFY ?auto_3840 ?auto_3841 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3853 - SURFACE
      ?auto_3854 - SURFACE
    )
    :vars
    (
      ?auto_3862 - HOIST
      ?auto_3865 - PLACE
      ?auto_3857 - PLACE
      ?auto_3855 - HOIST
      ?auto_3860 - SURFACE
      ?auto_3859 - SURFACE
      ?auto_3863 - PLACE
      ?auto_3861 - HOIST
      ?auto_3856 - SURFACE
      ?auto_3858 - SURFACE
      ?auto_3864 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3862 ?auto_3865 ) ( IS-CRATE ?auto_3853 ) ( not ( = ?auto_3853 ?auto_3854 ) ) ( not ( = ?auto_3857 ?auto_3865 ) ) ( HOIST-AT ?auto_3855 ?auto_3857 ) ( not ( = ?auto_3862 ?auto_3855 ) ) ( AVAILABLE ?auto_3855 ) ( SURFACE-AT ?auto_3853 ?auto_3857 ) ( ON ?auto_3853 ?auto_3860 ) ( CLEAR ?auto_3853 ) ( not ( = ?auto_3853 ?auto_3860 ) ) ( not ( = ?auto_3854 ?auto_3860 ) ) ( IS-CRATE ?auto_3854 ) ( not ( = ?auto_3853 ?auto_3859 ) ) ( not ( = ?auto_3854 ?auto_3859 ) ) ( not ( = ?auto_3860 ?auto_3859 ) ) ( not ( = ?auto_3863 ?auto_3865 ) ) ( not ( = ?auto_3857 ?auto_3863 ) ) ( HOIST-AT ?auto_3861 ?auto_3863 ) ( not ( = ?auto_3862 ?auto_3861 ) ) ( not ( = ?auto_3855 ?auto_3861 ) ) ( SURFACE-AT ?auto_3854 ?auto_3863 ) ( ON ?auto_3854 ?auto_3856 ) ( CLEAR ?auto_3854 ) ( not ( = ?auto_3853 ?auto_3856 ) ) ( not ( = ?auto_3854 ?auto_3856 ) ) ( not ( = ?auto_3860 ?auto_3856 ) ) ( not ( = ?auto_3859 ?auto_3856 ) ) ( SURFACE-AT ?auto_3858 ?auto_3865 ) ( CLEAR ?auto_3858 ) ( IS-CRATE ?auto_3859 ) ( not ( = ?auto_3853 ?auto_3858 ) ) ( not ( = ?auto_3854 ?auto_3858 ) ) ( not ( = ?auto_3860 ?auto_3858 ) ) ( not ( = ?auto_3859 ?auto_3858 ) ) ( not ( = ?auto_3856 ?auto_3858 ) ) ( AVAILABLE ?auto_3862 ) ( TRUCK-AT ?auto_3864 ?auto_3863 ) ( LIFTING ?auto_3861 ?auto_3859 ) )
    :subtasks
    ( ( !LOAD ?auto_3861 ?auto_3859 ?auto_3864 ?auto_3863 )
      ( MAKE-ON ?auto_3853 ?auto_3854 )
      ( MAKE-ON-VERIFY ?auto_3853 ?auto_3854 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3866 - SURFACE
      ?auto_3867 - SURFACE
    )
    :vars
    (
      ?auto_3877 - HOIST
      ?auto_3870 - PLACE
      ?auto_3873 - PLACE
      ?auto_3869 - HOIST
      ?auto_3874 - SURFACE
      ?auto_3868 - SURFACE
      ?auto_3878 - PLACE
      ?auto_3875 - HOIST
      ?auto_3872 - SURFACE
      ?auto_3876 - SURFACE
      ?auto_3871 - TRUCK
      ?auto_3879 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3877 ?auto_3870 ) ( IS-CRATE ?auto_3866 ) ( not ( = ?auto_3866 ?auto_3867 ) ) ( not ( = ?auto_3873 ?auto_3870 ) ) ( HOIST-AT ?auto_3869 ?auto_3873 ) ( not ( = ?auto_3877 ?auto_3869 ) ) ( AVAILABLE ?auto_3869 ) ( SURFACE-AT ?auto_3866 ?auto_3873 ) ( ON ?auto_3866 ?auto_3874 ) ( CLEAR ?auto_3866 ) ( not ( = ?auto_3866 ?auto_3874 ) ) ( not ( = ?auto_3867 ?auto_3874 ) ) ( IS-CRATE ?auto_3867 ) ( not ( = ?auto_3866 ?auto_3868 ) ) ( not ( = ?auto_3867 ?auto_3868 ) ) ( not ( = ?auto_3874 ?auto_3868 ) ) ( not ( = ?auto_3878 ?auto_3870 ) ) ( not ( = ?auto_3873 ?auto_3878 ) ) ( HOIST-AT ?auto_3875 ?auto_3878 ) ( not ( = ?auto_3877 ?auto_3875 ) ) ( not ( = ?auto_3869 ?auto_3875 ) ) ( SURFACE-AT ?auto_3867 ?auto_3878 ) ( ON ?auto_3867 ?auto_3872 ) ( CLEAR ?auto_3867 ) ( not ( = ?auto_3866 ?auto_3872 ) ) ( not ( = ?auto_3867 ?auto_3872 ) ) ( not ( = ?auto_3874 ?auto_3872 ) ) ( not ( = ?auto_3868 ?auto_3872 ) ) ( SURFACE-AT ?auto_3876 ?auto_3870 ) ( CLEAR ?auto_3876 ) ( IS-CRATE ?auto_3868 ) ( not ( = ?auto_3866 ?auto_3876 ) ) ( not ( = ?auto_3867 ?auto_3876 ) ) ( not ( = ?auto_3874 ?auto_3876 ) ) ( not ( = ?auto_3868 ?auto_3876 ) ) ( not ( = ?auto_3872 ?auto_3876 ) ) ( AVAILABLE ?auto_3877 ) ( TRUCK-AT ?auto_3871 ?auto_3878 ) ( AVAILABLE ?auto_3875 ) ( SURFACE-AT ?auto_3868 ?auto_3878 ) ( ON ?auto_3868 ?auto_3879 ) ( CLEAR ?auto_3868 ) ( not ( = ?auto_3866 ?auto_3879 ) ) ( not ( = ?auto_3867 ?auto_3879 ) ) ( not ( = ?auto_3874 ?auto_3879 ) ) ( not ( = ?auto_3868 ?auto_3879 ) ) ( not ( = ?auto_3872 ?auto_3879 ) ) ( not ( = ?auto_3876 ?auto_3879 ) ) )
    :subtasks
    ( ( !LIFT ?auto_3875 ?auto_3868 ?auto_3879 ?auto_3878 )
      ( MAKE-ON ?auto_3866 ?auto_3867 )
      ( MAKE-ON-VERIFY ?auto_3866 ?auto_3867 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3880 - SURFACE
      ?auto_3881 - SURFACE
    )
    :vars
    (
      ?auto_3888 - HOIST
      ?auto_3887 - PLACE
      ?auto_3886 - PLACE
      ?auto_3893 - HOIST
      ?auto_3892 - SURFACE
      ?auto_3884 - SURFACE
      ?auto_3883 - PLACE
      ?auto_3891 - HOIST
      ?auto_3882 - SURFACE
      ?auto_3889 - SURFACE
      ?auto_3885 - SURFACE
      ?auto_3890 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3888 ?auto_3887 ) ( IS-CRATE ?auto_3880 ) ( not ( = ?auto_3880 ?auto_3881 ) ) ( not ( = ?auto_3886 ?auto_3887 ) ) ( HOIST-AT ?auto_3893 ?auto_3886 ) ( not ( = ?auto_3888 ?auto_3893 ) ) ( AVAILABLE ?auto_3893 ) ( SURFACE-AT ?auto_3880 ?auto_3886 ) ( ON ?auto_3880 ?auto_3892 ) ( CLEAR ?auto_3880 ) ( not ( = ?auto_3880 ?auto_3892 ) ) ( not ( = ?auto_3881 ?auto_3892 ) ) ( IS-CRATE ?auto_3881 ) ( not ( = ?auto_3880 ?auto_3884 ) ) ( not ( = ?auto_3881 ?auto_3884 ) ) ( not ( = ?auto_3892 ?auto_3884 ) ) ( not ( = ?auto_3883 ?auto_3887 ) ) ( not ( = ?auto_3886 ?auto_3883 ) ) ( HOIST-AT ?auto_3891 ?auto_3883 ) ( not ( = ?auto_3888 ?auto_3891 ) ) ( not ( = ?auto_3893 ?auto_3891 ) ) ( SURFACE-AT ?auto_3881 ?auto_3883 ) ( ON ?auto_3881 ?auto_3882 ) ( CLEAR ?auto_3881 ) ( not ( = ?auto_3880 ?auto_3882 ) ) ( not ( = ?auto_3881 ?auto_3882 ) ) ( not ( = ?auto_3892 ?auto_3882 ) ) ( not ( = ?auto_3884 ?auto_3882 ) ) ( SURFACE-AT ?auto_3889 ?auto_3887 ) ( CLEAR ?auto_3889 ) ( IS-CRATE ?auto_3884 ) ( not ( = ?auto_3880 ?auto_3889 ) ) ( not ( = ?auto_3881 ?auto_3889 ) ) ( not ( = ?auto_3892 ?auto_3889 ) ) ( not ( = ?auto_3884 ?auto_3889 ) ) ( not ( = ?auto_3882 ?auto_3889 ) ) ( AVAILABLE ?auto_3888 ) ( AVAILABLE ?auto_3891 ) ( SURFACE-AT ?auto_3884 ?auto_3883 ) ( ON ?auto_3884 ?auto_3885 ) ( CLEAR ?auto_3884 ) ( not ( = ?auto_3880 ?auto_3885 ) ) ( not ( = ?auto_3881 ?auto_3885 ) ) ( not ( = ?auto_3892 ?auto_3885 ) ) ( not ( = ?auto_3884 ?auto_3885 ) ) ( not ( = ?auto_3882 ?auto_3885 ) ) ( not ( = ?auto_3889 ?auto_3885 ) ) ( TRUCK-AT ?auto_3890 ?auto_3887 ) )
    :subtasks
    ( ( !DRIVE ?auto_3890 ?auto_3887 ?auto_3883 )
      ( MAKE-ON ?auto_3880 ?auto_3881 )
      ( MAKE-ON-VERIFY ?auto_3880 ?auto_3881 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3896 - SURFACE
      ?auto_3897 - SURFACE
    )
    :vars
    (
      ?auto_3898 - HOIST
      ?auto_3899 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3898 ?auto_3899 ) ( SURFACE-AT ?auto_3897 ?auto_3899 ) ( CLEAR ?auto_3897 ) ( LIFTING ?auto_3898 ?auto_3896 ) ( IS-CRATE ?auto_3896 ) ( not ( = ?auto_3896 ?auto_3897 ) ) )
    :subtasks
    ( ( !DROP ?auto_3898 ?auto_3896 ?auto_3897 ?auto_3899 )
      ( MAKE-ON-VERIFY ?auto_3896 ?auto_3897 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3900 - SURFACE
      ?auto_3901 - SURFACE
    )
    :vars
    (
      ?auto_3902 - HOIST
      ?auto_3903 - PLACE
      ?auto_3904 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3902 ?auto_3903 ) ( SURFACE-AT ?auto_3901 ?auto_3903 ) ( CLEAR ?auto_3901 ) ( IS-CRATE ?auto_3900 ) ( not ( = ?auto_3900 ?auto_3901 ) ) ( TRUCK-AT ?auto_3904 ?auto_3903 ) ( AVAILABLE ?auto_3902 ) ( IN ?auto_3900 ?auto_3904 ) )
    :subtasks
    ( ( !UNLOAD ?auto_3902 ?auto_3900 ?auto_3904 ?auto_3903 )
      ( MAKE-ON ?auto_3900 ?auto_3901 )
      ( MAKE-ON-VERIFY ?auto_3900 ?auto_3901 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3905 - SURFACE
      ?auto_3906 - SURFACE
    )
    :vars
    (
      ?auto_3908 - HOIST
      ?auto_3909 - PLACE
      ?auto_3907 - TRUCK
      ?auto_3910 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3908 ?auto_3909 ) ( SURFACE-AT ?auto_3906 ?auto_3909 ) ( CLEAR ?auto_3906 ) ( IS-CRATE ?auto_3905 ) ( not ( = ?auto_3905 ?auto_3906 ) ) ( AVAILABLE ?auto_3908 ) ( IN ?auto_3905 ?auto_3907 ) ( TRUCK-AT ?auto_3907 ?auto_3910 ) ( not ( = ?auto_3910 ?auto_3909 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3907 ?auto_3910 ?auto_3909 )
      ( MAKE-ON ?auto_3905 ?auto_3906 )
      ( MAKE-ON-VERIFY ?auto_3905 ?auto_3906 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3911 - SURFACE
      ?auto_3912 - SURFACE
    )
    :vars
    (
      ?auto_3913 - HOIST
      ?auto_3915 - PLACE
      ?auto_3916 - TRUCK
      ?auto_3914 - PLACE
      ?auto_3917 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_3913 ?auto_3915 ) ( SURFACE-AT ?auto_3912 ?auto_3915 ) ( CLEAR ?auto_3912 ) ( IS-CRATE ?auto_3911 ) ( not ( = ?auto_3911 ?auto_3912 ) ) ( AVAILABLE ?auto_3913 ) ( TRUCK-AT ?auto_3916 ?auto_3914 ) ( not ( = ?auto_3914 ?auto_3915 ) ) ( HOIST-AT ?auto_3917 ?auto_3914 ) ( LIFTING ?auto_3917 ?auto_3911 ) ( not ( = ?auto_3913 ?auto_3917 ) ) )
    :subtasks
    ( ( !LOAD ?auto_3917 ?auto_3911 ?auto_3916 ?auto_3914 )
      ( MAKE-ON ?auto_3911 ?auto_3912 )
      ( MAKE-ON-VERIFY ?auto_3911 ?auto_3912 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3918 - SURFACE
      ?auto_3919 - SURFACE
    )
    :vars
    (
      ?auto_3923 - HOIST
      ?auto_3922 - PLACE
      ?auto_3921 - TRUCK
      ?auto_3924 - PLACE
      ?auto_3920 - HOIST
      ?auto_3925 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3923 ?auto_3922 ) ( SURFACE-AT ?auto_3919 ?auto_3922 ) ( CLEAR ?auto_3919 ) ( IS-CRATE ?auto_3918 ) ( not ( = ?auto_3918 ?auto_3919 ) ) ( AVAILABLE ?auto_3923 ) ( TRUCK-AT ?auto_3921 ?auto_3924 ) ( not ( = ?auto_3924 ?auto_3922 ) ) ( HOIST-AT ?auto_3920 ?auto_3924 ) ( not ( = ?auto_3923 ?auto_3920 ) ) ( AVAILABLE ?auto_3920 ) ( SURFACE-AT ?auto_3918 ?auto_3924 ) ( ON ?auto_3918 ?auto_3925 ) ( CLEAR ?auto_3918 ) ( not ( = ?auto_3918 ?auto_3925 ) ) ( not ( = ?auto_3919 ?auto_3925 ) ) )
    :subtasks
    ( ( !LIFT ?auto_3920 ?auto_3918 ?auto_3925 ?auto_3924 )
      ( MAKE-ON ?auto_3918 ?auto_3919 )
      ( MAKE-ON-VERIFY ?auto_3918 ?auto_3919 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3926 - SURFACE
      ?auto_3927 - SURFACE
    )
    :vars
    (
      ?auto_3933 - HOIST
      ?auto_3929 - PLACE
      ?auto_3931 - PLACE
      ?auto_3932 - HOIST
      ?auto_3928 - SURFACE
      ?auto_3930 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3933 ?auto_3929 ) ( SURFACE-AT ?auto_3927 ?auto_3929 ) ( CLEAR ?auto_3927 ) ( IS-CRATE ?auto_3926 ) ( not ( = ?auto_3926 ?auto_3927 ) ) ( AVAILABLE ?auto_3933 ) ( not ( = ?auto_3931 ?auto_3929 ) ) ( HOIST-AT ?auto_3932 ?auto_3931 ) ( not ( = ?auto_3933 ?auto_3932 ) ) ( AVAILABLE ?auto_3932 ) ( SURFACE-AT ?auto_3926 ?auto_3931 ) ( ON ?auto_3926 ?auto_3928 ) ( CLEAR ?auto_3926 ) ( not ( = ?auto_3926 ?auto_3928 ) ) ( not ( = ?auto_3927 ?auto_3928 ) ) ( TRUCK-AT ?auto_3930 ?auto_3929 ) )
    :subtasks
    ( ( !DRIVE ?auto_3930 ?auto_3929 ?auto_3931 )
      ( MAKE-ON ?auto_3926 ?auto_3927 )
      ( MAKE-ON-VERIFY ?auto_3926 ?auto_3927 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3934 - SURFACE
      ?auto_3935 - SURFACE
    )
    :vars
    (
      ?auto_3937 - HOIST
      ?auto_3939 - PLACE
      ?auto_3940 - PLACE
      ?auto_3941 - HOIST
      ?auto_3938 - SURFACE
      ?auto_3936 - TRUCK
      ?auto_3942 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3937 ?auto_3939 ) ( IS-CRATE ?auto_3934 ) ( not ( = ?auto_3934 ?auto_3935 ) ) ( not ( = ?auto_3940 ?auto_3939 ) ) ( HOIST-AT ?auto_3941 ?auto_3940 ) ( not ( = ?auto_3937 ?auto_3941 ) ) ( AVAILABLE ?auto_3941 ) ( SURFACE-AT ?auto_3934 ?auto_3940 ) ( ON ?auto_3934 ?auto_3938 ) ( CLEAR ?auto_3934 ) ( not ( = ?auto_3934 ?auto_3938 ) ) ( not ( = ?auto_3935 ?auto_3938 ) ) ( TRUCK-AT ?auto_3936 ?auto_3939 ) ( SURFACE-AT ?auto_3942 ?auto_3939 ) ( CLEAR ?auto_3942 ) ( LIFTING ?auto_3937 ?auto_3935 ) ( IS-CRATE ?auto_3935 ) ( not ( = ?auto_3934 ?auto_3942 ) ) ( not ( = ?auto_3935 ?auto_3942 ) ) ( not ( = ?auto_3938 ?auto_3942 ) ) )
    :subtasks
    ( ( !DROP ?auto_3937 ?auto_3935 ?auto_3942 ?auto_3939 )
      ( MAKE-ON ?auto_3934 ?auto_3935 )
      ( MAKE-ON-VERIFY ?auto_3934 ?auto_3935 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3943 - SURFACE
      ?auto_3944 - SURFACE
    )
    :vars
    (
      ?auto_3949 - HOIST
      ?auto_3946 - PLACE
      ?auto_3948 - PLACE
      ?auto_3950 - HOIST
      ?auto_3945 - SURFACE
      ?auto_3947 - TRUCK
      ?auto_3951 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3949 ?auto_3946 ) ( IS-CRATE ?auto_3943 ) ( not ( = ?auto_3943 ?auto_3944 ) ) ( not ( = ?auto_3948 ?auto_3946 ) ) ( HOIST-AT ?auto_3950 ?auto_3948 ) ( not ( = ?auto_3949 ?auto_3950 ) ) ( AVAILABLE ?auto_3950 ) ( SURFACE-AT ?auto_3943 ?auto_3948 ) ( ON ?auto_3943 ?auto_3945 ) ( CLEAR ?auto_3943 ) ( not ( = ?auto_3943 ?auto_3945 ) ) ( not ( = ?auto_3944 ?auto_3945 ) ) ( TRUCK-AT ?auto_3947 ?auto_3946 ) ( SURFACE-AT ?auto_3951 ?auto_3946 ) ( CLEAR ?auto_3951 ) ( IS-CRATE ?auto_3944 ) ( not ( = ?auto_3943 ?auto_3951 ) ) ( not ( = ?auto_3944 ?auto_3951 ) ) ( not ( = ?auto_3945 ?auto_3951 ) ) ( AVAILABLE ?auto_3949 ) ( IN ?auto_3944 ?auto_3947 ) )
    :subtasks
    ( ( !UNLOAD ?auto_3949 ?auto_3944 ?auto_3947 ?auto_3946 )
      ( MAKE-ON ?auto_3943 ?auto_3944 )
      ( MAKE-ON-VERIFY ?auto_3943 ?auto_3944 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3952 - SURFACE
      ?auto_3953 - SURFACE
    )
    :vars
    (
      ?auto_3959 - HOIST
      ?auto_3954 - PLACE
      ?auto_3956 - PLACE
      ?auto_3955 - HOIST
      ?auto_3960 - SURFACE
      ?auto_3957 - SURFACE
      ?auto_3958 - TRUCK
      ?auto_3961 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3959 ?auto_3954 ) ( IS-CRATE ?auto_3952 ) ( not ( = ?auto_3952 ?auto_3953 ) ) ( not ( = ?auto_3956 ?auto_3954 ) ) ( HOIST-AT ?auto_3955 ?auto_3956 ) ( not ( = ?auto_3959 ?auto_3955 ) ) ( AVAILABLE ?auto_3955 ) ( SURFACE-AT ?auto_3952 ?auto_3956 ) ( ON ?auto_3952 ?auto_3960 ) ( CLEAR ?auto_3952 ) ( not ( = ?auto_3952 ?auto_3960 ) ) ( not ( = ?auto_3953 ?auto_3960 ) ) ( SURFACE-AT ?auto_3957 ?auto_3954 ) ( CLEAR ?auto_3957 ) ( IS-CRATE ?auto_3953 ) ( not ( = ?auto_3952 ?auto_3957 ) ) ( not ( = ?auto_3953 ?auto_3957 ) ) ( not ( = ?auto_3960 ?auto_3957 ) ) ( AVAILABLE ?auto_3959 ) ( IN ?auto_3953 ?auto_3958 ) ( TRUCK-AT ?auto_3958 ?auto_3961 ) ( not ( = ?auto_3961 ?auto_3954 ) ) ( not ( = ?auto_3956 ?auto_3961 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3958 ?auto_3961 ?auto_3954 )
      ( MAKE-ON ?auto_3952 ?auto_3953 )
      ( MAKE-ON-VERIFY ?auto_3952 ?auto_3953 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3962 - SURFACE
      ?auto_3963 - SURFACE
    )
    :vars
    (
      ?auto_3966 - HOIST
      ?auto_3964 - PLACE
      ?auto_3971 - PLACE
      ?auto_3967 - HOIST
      ?auto_3969 - SURFACE
      ?auto_3970 - SURFACE
      ?auto_3968 - TRUCK
      ?auto_3965 - PLACE
      ?auto_3972 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_3966 ?auto_3964 ) ( IS-CRATE ?auto_3962 ) ( not ( = ?auto_3962 ?auto_3963 ) ) ( not ( = ?auto_3971 ?auto_3964 ) ) ( HOIST-AT ?auto_3967 ?auto_3971 ) ( not ( = ?auto_3966 ?auto_3967 ) ) ( AVAILABLE ?auto_3967 ) ( SURFACE-AT ?auto_3962 ?auto_3971 ) ( ON ?auto_3962 ?auto_3969 ) ( CLEAR ?auto_3962 ) ( not ( = ?auto_3962 ?auto_3969 ) ) ( not ( = ?auto_3963 ?auto_3969 ) ) ( SURFACE-AT ?auto_3970 ?auto_3964 ) ( CLEAR ?auto_3970 ) ( IS-CRATE ?auto_3963 ) ( not ( = ?auto_3962 ?auto_3970 ) ) ( not ( = ?auto_3963 ?auto_3970 ) ) ( not ( = ?auto_3969 ?auto_3970 ) ) ( AVAILABLE ?auto_3966 ) ( TRUCK-AT ?auto_3968 ?auto_3965 ) ( not ( = ?auto_3965 ?auto_3964 ) ) ( not ( = ?auto_3971 ?auto_3965 ) ) ( HOIST-AT ?auto_3972 ?auto_3965 ) ( LIFTING ?auto_3972 ?auto_3963 ) ( not ( = ?auto_3966 ?auto_3972 ) ) ( not ( = ?auto_3967 ?auto_3972 ) ) )
    :subtasks
    ( ( !LOAD ?auto_3972 ?auto_3963 ?auto_3968 ?auto_3965 )
      ( MAKE-ON ?auto_3962 ?auto_3963 )
      ( MAKE-ON-VERIFY ?auto_3962 ?auto_3963 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3973 - SURFACE
      ?auto_3974 - SURFACE
    )
    :vars
    (
      ?auto_3983 - HOIST
      ?auto_3978 - PLACE
      ?auto_3981 - PLACE
      ?auto_3982 - HOIST
      ?auto_3980 - SURFACE
      ?auto_3979 - SURFACE
      ?auto_3977 - TRUCK
      ?auto_3975 - PLACE
      ?auto_3976 - HOIST
      ?auto_3984 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3983 ?auto_3978 ) ( IS-CRATE ?auto_3973 ) ( not ( = ?auto_3973 ?auto_3974 ) ) ( not ( = ?auto_3981 ?auto_3978 ) ) ( HOIST-AT ?auto_3982 ?auto_3981 ) ( not ( = ?auto_3983 ?auto_3982 ) ) ( AVAILABLE ?auto_3982 ) ( SURFACE-AT ?auto_3973 ?auto_3981 ) ( ON ?auto_3973 ?auto_3980 ) ( CLEAR ?auto_3973 ) ( not ( = ?auto_3973 ?auto_3980 ) ) ( not ( = ?auto_3974 ?auto_3980 ) ) ( SURFACE-AT ?auto_3979 ?auto_3978 ) ( CLEAR ?auto_3979 ) ( IS-CRATE ?auto_3974 ) ( not ( = ?auto_3973 ?auto_3979 ) ) ( not ( = ?auto_3974 ?auto_3979 ) ) ( not ( = ?auto_3980 ?auto_3979 ) ) ( AVAILABLE ?auto_3983 ) ( TRUCK-AT ?auto_3977 ?auto_3975 ) ( not ( = ?auto_3975 ?auto_3978 ) ) ( not ( = ?auto_3981 ?auto_3975 ) ) ( HOIST-AT ?auto_3976 ?auto_3975 ) ( not ( = ?auto_3983 ?auto_3976 ) ) ( not ( = ?auto_3982 ?auto_3976 ) ) ( AVAILABLE ?auto_3976 ) ( SURFACE-AT ?auto_3974 ?auto_3975 ) ( ON ?auto_3974 ?auto_3984 ) ( CLEAR ?auto_3974 ) ( not ( = ?auto_3973 ?auto_3984 ) ) ( not ( = ?auto_3974 ?auto_3984 ) ) ( not ( = ?auto_3980 ?auto_3984 ) ) ( not ( = ?auto_3979 ?auto_3984 ) ) )
    :subtasks
    ( ( !LIFT ?auto_3976 ?auto_3974 ?auto_3984 ?auto_3975 )
      ( MAKE-ON ?auto_3973 ?auto_3974 )
      ( MAKE-ON-VERIFY ?auto_3973 ?auto_3974 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3985 - SURFACE
      ?auto_3986 - SURFACE
    )
    :vars
    (
      ?auto_3994 - HOIST
      ?auto_3995 - PLACE
      ?auto_3993 - PLACE
      ?auto_3989 - HOIST
      ?auto_3996 - SURFACE
      ?auto_3992 - SURFACE
      ?auto_3988 - PLACE
      ?auto_3990 - HOIST
      ?auto_3987 - SURFACE
      ?auto_3991 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3994 ?auto_3995 ) ( IS-CRATE ?auto_3985 ) ( not ( = ?auto_3985 ?auto_3986 ) ) ( not ( = ?auto_3993 ?auto_3995 ) ) ( HOIST-AT ?auto_3989 ?auto_3993 ) ( not ( = ?auto_3994 ?auto_3989 ) ) ( AVAILABLE ?auto_3989 ) ( SURFACE-AT ?auto_3985 ?auto_3993 ) ( ON ?auto_3985 ?auto_3996 ) ( CLEAR ?auto_3985 ) ( not ( = ?auto_3985 ?auto_3996 ) ) ( not ( = ?auto_3986 ?auto_3996 ) ) ( SURFACE-AT ?auto_3992 ?auto_3995 ) ( CLEAR ?auto_3992 ) ( IS-CRATE ?auto_3986 ) ( not ( = ?auto_3985 ?auto_3992 ) ) ( not ( = ?auto_3986 ?auto_3992 ) ) ( not ( = ?auto_3996 ?auto_3992 ) ) ( AVAILABLE ?auto_3994 ) ( not ( = ?auto_3988 ?auto_3995 ) ) ( not ( = ?auto_3993 ?auto_3988 ) ) ( HOIST-AT ?auto_3990 ?auto_3988 ) ( not ( = ?auto_3994 ?auto_3990 ) ) ( not ( = ?auto_3989 ?auto_3990 ) ) ( AVAILABLE ?auto_3990 ) ( SURFACE-AT ?auto_3986 ?auto_3988 ) ( ON ?auto_3986 ?auto_3987 ) ( CLEAR ?auto_3986 ) ( not ( = ?auto_3985 ?auto_3987 ) ) ( not ( = ?auto_3986 ?auto_3987 ) ) ( not ( = ?auto_3996 ?auto_3987 ) ) ( not ( = ?auto_3992 ?auto_3987 ) ) ( TRUCK-AT ?auto_3991 ?auto_3995 ) )
    :subtasks
    ( ( !DRIVE ?auto_3991 ?auto_3995 ?auto_3988 )
      ( MAKE-ON ?auto_3985 ?auto_3986 )
      ( MAKE-ON-VERIFY ?auto_3985 ?auto_3986 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3997 - SURFACE
      ?auto_3998 - SURFACE
    )
    :vars
    (
      ?auto_4004 - HOIST
      ?auto_4008 - PLACE
      ?auto_4001 - PLACE
      ?auto_3999 - HOIST
      ?auto_4003 - SURFACE
      ?auto_4007 - SURFACE
      ?auto_4002 - PLACE
      ?auto_4005 - HOIST
      ?auto_4000 - SURFACE
      ?auto_4006 - TRUCK
      ?auto_4009 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4004 ?auto_4008 ) ( IS-CRATE ?auto_3997 ) ( not ( = ?auto_3997 ?auto_3998 ) ) ( not ( = ?auto_4001 ?auto_4008 ) ) ( HOIST-AT ?auto_3999 ?auto_4001 ) ( not ( = ?auto_4004 ?auto_3999 ) ) ( AVAILABLE ?auto_3999 ) ( SURFACE-AT ?auto_3997 ?auto_4001 ) ( ON ?auto_3997 ?auto_4003 ) ( CLEAR ?auto_3997 ) ( not ( = ?auto_3997 ?auto_4003 ) ) ( not ( = ?auto_3998 ?auto_4003 ) ) ( IS-CRATE ?auto_3998 ) ( not ( = ?auto_3997 ?auto_4007 ) ) ( not ( = ?auto_3998 ?auto_4007 ) ) ( not ( = ?auto_4003 ?auto_4007 ) ) ( not ( = ?auto_4002 ?auto_4008 ) ) ( not ( = ?auto_4001 ?auto_4002 ) ) ( HOIST-AT ?auto_4005 ?auto_4002 ) ( not ( = ?auto_4004 ?auto_4005 ) ) ( not ( = ?auto_3999 ?auto_4005 ) ) ( AVAILABLE ?auto_4005 ) ( SURFACE-AT ?auto_3998 ?auto_4002 ) ( ON ?auto_3998 ?auto_4000 ) ( CLEAR ?auto_3998 ) ( not ( = ?auto_3997 ?auto_4000 ) ) ( not ( = ?auto_3998 ?auto_4000 ) ) ( not ( = ?auto_4003 ?auto_4000 ) ) ( not ( = ?auto_4007 ?auto_4000 ) ) ( TRUCK-AT ?auto_4006 ?auto_4008 ) ( SURFACE-AT ?auto_4009 ?auto_4008 ) ( CLEAR ?auto_4009 ) ( LIFTING ?auto_4004 ?auto_4007 ) ( IS-CRATE ?auto_4007 ) ( not ( = ?auto_3997 ?auto_4009 ) ) ( not ( = ?auto_3998 ?auto_4009 ) ) ( not ( = ?auto_4003 ?auto_4009 ) ) ( not ( = ?auto_4007 ?auto_4009 ) ) ( not ( = ?auto_4000 ?auto_4009 ) ) )
    :subtasks
    ( ( !DROP ?auto_4004 ?auto_4007 ?auto_4009 ?auto_4008 )
      ( MAKE-ON ?auto_3997 ?auto_3998 )
      ( MAKE-ON-VERIFY ?auto_3997 ?auto_3998 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4010 - SURFACE
      ?auto_4011 - SURFACE
    )
    :vars
    (
      ?auto_4022 - HOIST
      ?auto_4016 - PLACE
      ?auto_4021 - PLACE
      ?auto_4020 - HOIST
      ?auto_4014 - SURFACE
      ?auto_4019 - SURFACE
      ?auto_4013 - PLACE
      ?auto_4017 - HOIST
      ?auto_4012 - SURFACE
      ?auto_4015 - TRUCK
      ?auto_4018 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4022 ?auto_4016 ) ( IS-CRATE ?auto_4010 ) ( not ( = ?auto_4010 ?auto_4011 ) ) ( not ( = ?auto_4021 ?auto_4016 ) ) ( HOIST-AT ?auto_4020 ?auto_4021 ) ( not ( = ?auto_4022 ?auto_4020 ) ) ( AVAILABLE ?auto_4020 ) ( SURFACE-AT ?auto_4010 ?auto_4021 ) ( ON ?auto_4010 ?auto_4014 ) ( CLEAR ?auto_4010 ) ( not ( = ?auto_4010 ?auto_4014 ) ) ( not ( = ?auto_4011 ?auto_4014 ) ) ( IS-CRATE ?auto_4011 ) ( not ( = ?auto_4010 ?auto_4019 ) ) ( not ( = ?auto_4011 ?auto_4019 ) ) ( not ( = ?auto_4014 ?auto_4019 ) ) ( not ( = ?auto_4013 ?auto_4016 ) ) ( not ( = ?auto_4021 ?auto_4013 ) ) ( HOIST-AT ?auto_4017 ?auto_4013 ) ( not ( = ?auto_4022 ?auto_4017 ) ) ( not ( = ?auto_4020 ?auto_4017 ) ) ( AVAILABLE ?auto_4017 ) ( SURFACE-AT ?auto_4011 ?auto_4013 ) ( ON ?auto_4011 ?auto_4012 ) ( CLEAR ?auto_4011 ) ( not ( = ?auto_4010 ?auto_4012 ) ) ( not ( = ?auto_4011 ?auto_4012 ) ) ( not ( = ?auto_4014 ?auto_4012 ) ) ( not ( = ?auto_4019 ?auto_4012 ) ) ( TRUCK-AT ?auto_4015 ?auto_4016 ) ( SURFACE-AT ?auto_4018 ?auto_4016 ) ( CLEAR ?auto_4018 ) ( IS-CRATE ?auto_4019 ) ( not ( = ?auto_4010 ?auto_4018 ) ) ( not ( = ?auto_4011 ?auto_4018 ) ) ( not ( = ?auto_4014 ?auto_4018 ) ) ( not ( = ?auto_4019 ?auto_4018 ) ) ( not ( = ?auto_4012 ?auto_4018 ) ) ( AVAILABLE ?auto_4022 ) ( IN ?auto_4019 ?auto_4015 ) )
    :subtasks
    ( ( !UNLOAD ?auto_4022 ?auto_4019 ?auto_4015 ?auto_4016 )
      ( MAKE-ON ?auto_4010 ?auto_4011 )
      ( MAKE-ON-VERIFY ?auto_4010 ?auto_4011 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4023 - SURFACE
      ?auto_4024 - SURFACE
    )
    :vars
    (
      ?auto_4025 - HOIST
      ?auto_4027 - PLACE
      ?auto_4032 - PLACE
      ?auto_4029 - HOIST
      ?auto_4030 - SURFACE
      ?auto_4031 - SURFACE
      ?auto_4028 - PLACE
      ?auto_4034 - HOIST
      ?auto_4033 - SURFACE
      ?auto_4035 - SURFACE
      ?auto_4026 - TRUCK
      ?auto_4036 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4025 ?auto_4027 ) ( IS-CRATE ?auto_4023 ) ( not ( = ?auto_4023 ?auto_4024 ) ) ( not ( = ?auto_4032 ?auto_4027 ) ) ( HOIST-AT ?auto_4029 ?auto_4032 ) ( not ( = ?auto_4025 ?auto_4029 ) ) ( AVAILABLE ?auto_4029 ) ( SURFACE-AT ?auto_4023 ?auto_4032 ) ( ON ?auto_4023 ?auto_4030 ) ( CLEAR ?auto_4023 ) ( not ( = ?auto_4023 ?auto_4030 ) ) ( not ( = ?auto_4024 ?auto_4030 ) ) ( IS-CRATE ?auto_4024 ) ( not ( = ?auto_4023 ?auto_4031 ) ) ( not ( = ?auto_4024 ?auto_4031 ) ) ( not ( = ?auto_4030 ?auto_4031 ) ) ( not ( = ?auto_4028 ?auto_4027 ) ) ( not ( = ?auto_4032 ?auto_4028 ) ) ( HOIST-AT ?auto_4034 ?auto_4028 ) ( not ( = ?auto_4025 ?auto_4034 ) ) ( not ( = ?auto_4029 ?auto_4034 ) ) ( AVAILABLE ?auto_4034 ) ( SURFACE-AT ?auto_4024 ?auto_4028 ) ( ON ?auto_4024 ?auto_4033 ) ( CLEAR ?auto_4024 ) ( not ( = ?auto_4023 ?auto_4033 ) ) ( not ( = ?auto_4024 ?auto_4033 ) ) ( not ( = ?auto_4030 ?auto_4033 ) ) ( not ( = ?auto_4031 ?auto_4033 ) ) ( SURFACE-AT ?auto_4035 ?auto_4027 ) ( CLEAR ?auto_4035 ) ( IS-CRATE ?auto_4031 ) ( not ( = ?auto_4023 ?auto_4035 ) ) ( not ( = ?auto_4024 ?auto_4035 ) ) ( not ( = ?auto_4030 ?auto_4035 ) ) ( not ( = ?auto_4031 ?auto_4035 ) ) ( not ( = ?auto_4033 ?auto_4035 ) ) ( AVAILABLE ?auto_4025 ) ( IN ?auto_4031 ?auto_4026 ) ( TRUCK-AT ?auto_4026 ?auto_4036 ) ( not ( = ?auto_4036 ?auto_4027 ) ) ( not ( = ?auto_4032 ?auto_4036 ) ) ( not ( = ?auto_4028 ?auto_4036 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4026 ?auto_4036 ?auto_4027 )
      ( MAKE-ON ?auto_4023 ?auto_4024 )
      ( MAKE-ON-VERIFY ?auto_4023 ?auto_4024 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4037 - SURFACE
      ?auto_4038 - SURFACE
    )
    :vars
    (
      ?auto_4045 - HOIST
      ?auto_4044 - PLACE
      ?auto_4040 - PLACE
      ?auto_4047 - HOIST
      ?auto_4048 - SURFACE
      ?auto_4049 - SURFACE
      ?auto_4041 - PLACE
      ?auto_4043 - HOIST
      ?auto_4046 - SURFACE
      ?auto_4042 - SURFACE
      ?auto_4039 - TRUCK
      ?auto_4050 - PLACE
      ?auto_4051 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_4045 ?auto_4044 ) ( IS-CRATE ?auto_4037 ) ( not ( = ?auto_4037 ?auto_4038 ) ) ( not ( = ?auto_4040 ?auto_4044 ) ) ( HOIST-AT ?auto_4047 ?auto_4040 ) ( not ( = ?auto_4045 ?auto_4047 ) ) ( AVAILABLE ?auto_4047 ) ( SURFACE-AT ?auto_4037 ?auto_4040 ) ( ON ?auto_4037 ?auto_4048 ) ( CLEAR ?auto_4037 ) ( not ( = ?auto_4037 ?auto_4048 ) ) ( not ( = ?auto_4038 ?auto_4048 ) ) ( IS-CRATE ?auto_4038 ) ( not ( = ?auto_4037 ?auto_4049 ) ) ( not ( = ?auto_4038 ?auto_4049 ) ) ( not ( = ?auto_4048 ?auto_4049 ) ) ( not ( = ?auto_4041 ?auto_4044 ) ) ( not ( = ?auto_4040 ?auto_4041 ) ) ( HOIST-AT ?auto_4043 ?auto_4041 ) ( not ( = ?auto_4045 ?auto_4043 ) ) ( not ( = ?auto_4047 ?auto_4043 ) ) ( AVAILABLE ?auto_4043 ) ( SURFACE-AT ?auto_4038 ?auto_4041 ) ( ON ?auto_4038 ?auto_4046 ) ( CLEAR ?auto_4038 ) ( not ( = ?auto_4037 ?auto_4046 ) ) ( not ( = ?auto_4038 ?auto_4046 ) ) ( not ( = ?auto_4048 ?auto_4046 ) ) ( not ( = ?auto_4049 ?auto_4046 ) ) ( SURFACE-AT ?auto_4042 ?auto_4044 ) ( CLEAR ?auto_4042 ) ( IS-CRATE ?auto_4049 ) ( not ( = ?auto_4037 ?auto_4042 ) ) ( not ( = ?auto_4038 ?auto_4042 ) ) ( not ( = ?auto_4048 ?auto_4042 ) ) ( not ( = ?auto_4049 ?auto_4042 ) ) ( not ( = ?auto_4046 ?auto_4042 ) ) ( AVAILABLE ?auto_4045 ) ( TRUCK-AT ?auto_4039 ?auto_4050 ) ( not ( = ?auto_4050 ?auto_4044 ) ) ( not ( = ?auto_4040 ?auto_4050 ) ) ( not ( = ?auto_4041 ?auto_4050 ) ) ( HOIST-AT ?auto_4051 ?auto_4050 ) ( LIFTING ?auto_4051 ?auto_4049 ) ( not ( = ?auto_4045 ?auto_4051 ) ) ( not ( = ?auto_4047 ?auto_4051 ) ) ( not ( = ?auto_4043 ?auto_4051 ) ) )
    :subtasks
    ( ( !LOAD ?auto_4051 ?auto_4049 ?auto_4039 ?auto_4050 )
      ( MAKE-ON ?auto_4037 ?auto_4038 )
      ( MAKE-ON-VERIFY ?auto_4037 ?auto_4038 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4052 - SURFACE
      ?auto_4053 - SURFACE
    )
    :vars
    (
      ?auto_4061 - HOIST
      ?auto_4063 - PLACE
      ?auto_4056 - PLACE
      ?auto_4062 - HOIST
      ?auto_4057 - SURFACE
      ?auto_4054 - SURFACE
      ?auto_4058 - PLACE
      ?auto_4065 - HOIST
      ?auto_4066 - SURFACE
      ?auto_4055 - SURFACE
      ?auto_4064 - TRUCK
      ?auto_4059 - PLACE
      ?auto_4060 - HOIST
      ?auto_4067 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4061 ?auto_4063 ) ( IS-CRATE ?auto_4052 ) ( not ( = ?auto_4052 ?auto_4053 ) ) ( not ( = ?auto_4056 ?auto_4063 ) ) ( HOIST-AT ?auto_4062 ?auto_4056 ) ( not ( = ?auto_4061 ?auto_4062 ) ) ( AVAILABLE ?auto_4062 ) ( SURFACE-AT ?auto_4052 ?auto_4056 ) ( ON ?auto_4052 ?auto_4057 ) ( CLEAR ?auto_4052 ) ( not ( = ?auto_4052 ?auto_4057 ) ) ( not ( = ?auto_4053 ?auto_4057 ) ) ( IS-CRATE ?auto_4053 ) ( not ( = ?auto_4052 ?auto_4054 ) ) ( not ( = ?auto_4053 ?auto_4054 ) ) ( not ( = ?auto_4057 ?auto_4054 ) ) ( not ( = ?auto_4058 ?auto_4063 ) ) ( not ( = ?auto_4056 ?auto_4058 ) ) ( HOIST-AT ?auto_4065 ?auto_4058 ) ( not ( = ?auto_4061 ?auto_4065 ) ) ( not ( = ?auto_4062 ?auto_4065 ) ) ( AVAILABLE ?auto_4065 ) ( SURFACE-AT ?auto_4053 ?auto_4058 ) ( ON ?auto_4053 ?auto_4066 ) ( CLEAR ?auto_4053 ) ( not ( = ?auto_4052 ?auto_4066 ) ) ( not ( = ?auto_4053 ?auto_4066 ) ) ( not ( = ?auto_4057 ?auto_4066 ) ) ( not ( = ?auto_4054 ?auto_4066 ) ) ( SURFACE-AT ?auto_4055 ?auto_4063 ) ( CLEAR ?auto_4055 ) ( IS-CRATE ?auto_4054 ) ( not ( = ?auto_4052 ?auto_4055 ) ) ( not ( = ?auto_4053 ?auto_4055 ) ) ( not ( = ?auto_4057 ?auto_4055 ) ) ( not ( = ?auto_4054 ?auto_4055 ) ) ( not ( = ?auto_4066 ?auto_4055 ) ) ( AVAILABLE ?auto_4061 ) ( TRUCK-AT ?auto_4064 ?auto_4059 ) ( not ( = ?auto_4059 ?auto_4063 ) ) ( not ( = ?auto_4056 ?auto_4059 ) ) ( not ( = ?auto_4058 ?auto_4059 ) ) ( HOIST-AT ?auto_4060 ?auto_4059 ) ( not ( = ?auto_4061 ?auto_4060 ) ) ( not ( = ?auto_4062 ?auto_4060 ) ) ( not ( = ?auto_4065 ?auto_4060 ) ) ( AVAILABLE ?auto_4060 ) ( SURFACE-AT ?auto_4054 ?auto_4059 ) ( ON ?auto_4054 ?auto_4067 ) ( CLEAR ?auto_4054 ) ( not ( = ?auto_4052 ?auto_4067 ) ) ( not ( = ?auto_4053 ?auto_4067 ) ) ( not ( = ?auto_4057 ?auto_4067 ) ) ( not ( = ?auto_4054 ?auto_4067 ) ) ( not ( = ?auto_4066 ?auto_4067 ) ) ( not ( = ?auto_4055 ?auto_4067 ) ) )
    :subtasks
    ( ( !LIFT ?auto_4060 ?auto_4054 ?auto_4067 ?auto_4059 )
      ( MAKE-ON ?auto_4052 ?auto_4053 )
      ( MAKE-ON-VERIFY ?auto_4052 ?auto_4053 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4068 - SURFACE
      ?auto_4069 - SURFACE
    )
    :vars
    (
      ?auto_4078 - HOIST
      ?auto_4074 - PLACE
      ?auto_4075 - PLACE
      ?auto_4082 - HOIST
      ?auto_4073 - SURFACE
      ?auto_4083 - SURFACE
      ?auto_4079 - PLACE
      ?auto_4070 - HOIST
      ?auto_4072 - SURFACE
      ?auto_4076 - SURFACE
      ?auto_4077 - PLACE
      ?auto_4071 - HOIST
      ?auto_4081 - SURFACE
      ?auto_4080 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4078 ?auto_4074 ) ( IS-CRATE ?auto_4068 ) ( not ( = ?auto_4068 ?auto_4069 ) ) ( not ( = ?auto_4075 ?auto_4074 ) ) ( HOIST-AT ?auto_4082 ?auto_4075 ) ( not ( = ?auto_4078 ?auto_4082 ) ) ( AVAILABLE ?auto_4082 ) ( SURFACE-AT ?auto_4068 ?auto_4075 ) ( ON ?auto_4068 ?auto_4073 ) ( CLEAR ?auto_4068 ) ( not ( = ?auto_4068 ?auto_4073 ) ) ( not ( = ?auto_4069 ?auto_4073 ) ) ( IS-CRATE ?auto_4069 ) ( not ( = ?auto_4068 ?auto_4083 ) ) ( not ( = ?auto_4069 ?auto_4083 ) ) ( not ( = ?auto_4073 ?auto_4083 ) ) ( not ( = ?auto_4079 ?auto_4074 ) ) ( not ( = ?auto_4075 ?auto_4079 ) ) ( HOIST-AT ?auto_4070 ?auto_4079 ) ( not ( = ?auto_4078 ?auto_4070 ) ) ( not ( = ?auto_4082 ?auto_4070 ) ) ( AVAILABLE ?auto_4070 ) ( SURFACE-AT ?auto_4069 ?auto_4079 ) ( ON ?auto_4069 ?auto_4072 ) ( CLEAR ?auto_4069 ) ( not ( = ?auto_4068 ?auto_4072 ) ) ( not ( = ?auto_4069 ?auto_4072 ) ) ( not ( = ?auto_4073 ?auto_4072 ) ) ( not ( = ?auto_4083 ?auto_4072 ) ) ( SURFACE-AT ?auto_4076 ?auto_4074 ) ( CLEAR ?auto_4076 ) ( IS-CRATE ?auto_4083 ) ( not ( = ?auto_4068 ?auto_4076 ) ) ( not ( = ?auto_4069 ?auto_4076 ) ) ( not ( = ?auto_4073 ?auto_4076 ) ) ( not ( = ?auto_4083 ?auto_4076 ) ) ( not ( = ?auto_4072 ?auto_4076 ) ) ( AVAILABLE ?auto_4078 ) ( not ( = ?auto_4077 ?auto_4074 ) ) ( not ( = ?auto_4075 ?auto_4077 ) ) ( not ( = ?auto_4079 ?auto_4077 ) ) ( HOIST-AT ?auto_4071 ?auto_4077 ) ( not ( = ?auto_4078 ?auto_4071 ) ) ( not ( = ?auto_4082 ?auto_4071 ) ) ( not ( = ?auto_4070 ?auto_4071 ) ) ( AVAILABLE ?auto_4071 ) ( SURFACE-AT ?auto_4083 ?auto_4077 ) ( ON ?auto_4083 ?auto_4081 ) ( CLEAR ?auto_4083 ) ( not ( = ?auto_4068 ?auto_4081 ) ) ( not ( = ?auto_4069 ?auto_4081 ) ) ( not ( = ?auto_4073 ?auto_4081 ) ) ( not ( = ?auto_4083 ?auto_4081 ) ) ( not ( = ?auto_4072 ?auto_4081 ) ) ( not ( = ?auto_4076 ?auto_4081 ) ) ( TRUCK-AT ?auto_4080 ?auto_4074 ) )
    :subtasks
    ( ( !DRIVE ?auto_4080 ?auto_4074 ?auto_4077 )
      ( MAKE-ON ?auto_4068 ?auto_4069 )
      ( MAKE-ON-VERIFY ?auto_4068 ?auto_4069 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4084 - SURFACE
      ?auto_4085 - SURFACE
    )
    :vars
    (
      ?auto_4093 - HOIST
      ?auto_4095 - PLACE
      ?auto_4097 - PLACE
      ?auto_4094 - HOIST
      ?auto_4092 - SURFACE
      ?auto_4091 - SURFACE
      ?auto_4096 - PLACE
      ?auto_4088 - HOIST
      ?auto_4099 - SURFACE
      ?auto_4087 - SURFACE
      ?auto_4090 - PLACE
      ?auto_4089 - HOIST
      ?auto_4086 - SURFACE
      ?auto_4098 - TRUCK
      ?auto_4100 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4093 ?auto_4095 ) ( IS-CRATE ?auto_4084 ) ( not ( = ?auto_4084 ?auto_4085 ) ) ( not ( = ?auto_4097 ?auto_4095 ) ) ( HOIST-AT ?auto_4094 ?auto_4097 ) ( not ( = ?auto_4093 ?auto_4094 ) ) ( AVAILABLE ?auto_4094 ) ( SURFACE-AT ?auto_4084 ?auto_4097 ) ( ON ?auto_4084 ?auto_4092 ) ( CLEAR ?auto_4084 ) ( not ( = ?auto_4084 ?auto_4092 ) ) ( not ( = ?auto_4085 ?auto_4092 ) ) ( IS-CRATE ?auto_4085 ) ( not ( = ?auto_4084 ?auto_4091 ) ) ( not ( = ?auto_4085 ?auto_4091 ) ) ( not ( = ?auto_4092 ?auto_4091 ) ) ( not ( = ?auto_4096 ?auto_4095 ) ) ( not ( = ?auto_4097 ?auto_4096 ) ) ( HOIST-AT ?auto_4088 ?auto_4096 ) ( not ( = ?auto_4093 ?auto_4088 ) ) ( not ( = ?auto_4094 ?auto_4088 ) ) ( AVAILABLE ?auto_4088 ) ( SURFACE-AT ?auto_4085 ?auto_4096 ) ( ON ?auto_4085 ?auto_4099 ) ( CLEAR ?auto_4085 ) ( not ( = ?auto_4084 ?auto_4099 ) ) ( not ( = ?auto_4085 ?auto_4099 ) ) ( not ( = ?auto_4092 ?auto_4099 ) ) ( not ( = ?auto_4091 ?auto_4099 ) ) ( IS-CRATE ?auto_4091 ) ( not ( = ?auto_4084 ?auto_4087 ) ) ( not ( = ?auto_4085 ?auto_4087 ) ) ( not ( = ?auto_4092 ?auto_4087 ) ) ( not ( = ?auto_4091 ?auto_4087 ) ) ( not ( = ?auto_4099 ?auto_4087 ) ) ( not ( = ?auto_4090 ?auto_4095 ) ) ( not ( = ?auto_4097 ?auto_4090 ) ) ( not ( = ?auto_4096 ?auto_4090 ) ) ( HOIST-AT ?auto_4089 ?auto_4090 ) ( not ( = ?auto_4093 ?auto_4089 ) ) ( not ( = ?auto_4094 ?auto_4089 ) ) ( not ( = ?auto_4088 ?auto_4089 ) ) ( AVAILABLE ?auto_4089 ) ( SURFACE-AT ?auto_4091 ?auto_4090 ) ( ON ?auto_4091 ?auto_4086 ) ( CLEAR ?auto_4091 ) ( not ( = ?auto_4084 ?auto_4086 ) ) ( not ( = ?auto_4085 ?auto_4086 ) ) ( not ( = ?auto_4092 ?auto_4086 ) ) ( not ( = ?auto_4091 ?auto_4086 ) ) ( not ( = ?auto_4099 ?auto_4086 ) ) ( not ( = ?auto_4087 ?auto_4086 ) ) ( TRUCK-AT ?auto_4098 ?auto_4095 ) ( SURFACE-AT ?auto_4100 ?auto_4095 ) ( CLEAR ?auto_4100 ) ( LIFTING ?auto_4093 ?auto_4087 ) ( IS-CRATE ?auto_4087 ) ( not ( = ?auto_4084 ?auto_4100 ) ) ( not ( = ?auto_4085 ?auto_4100 ) ) ( not ( = ?auto_4092 ?auto_4100 ) ) ( not ( = ?auto_4091 ?auto_4100 ) ) ( not ( = ?auto_4099 ?auto_4100 ) ) ( not ( = ?auto_4087 ?auto_4100 ) ) ( not ( = ?auto_4086 ?auto_4100 ) ) )
    :subtasks
    ( ( !DROP ?auto_4093 ?auto_4087 ?auto_4100 ?auto_4095 )
      ( MAKE-ON ?auto_4084 ?auto_4085 )
      ( MAKE-ON-VERIFY ?auto_4084 ?auto_4085 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4101 - SURFACE
      ?auto_4102 - SURFACE
    )
    :vars
    (
      ?auto_4117 - HOIST
      ?auto_4107 - PLACE
      ?auto_4113 - PLACE
      ?auto_4114 - HOIST
      ?auto_4116 - SURFACE
      ?auto_4109 - SURFACE
      ?auto_4106 - PLACE
      ?auto_4104 - HOIST
      ?auto_4110 - SURFACE
      ?auto_4111 - SURFACE
      ?auto_4108 - PLACE
      ?auto_4112 - HOIST
      ?auto_4103 - SURFACE
      ?auto_4105 - TRUCK
      ?auto_4115 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4117 ?auto_4107 ) ( IS-CRATE ?auto_4101 ) ( not ( = ?auto_4101 ?auto_4102 ) ) ( not ( = ?auto_4113 ?auto_4107 ) ) ( HOIST-AT ?auto_4114 ?auto_4113 ) ( not ( = ?auto_4117 ?auto_4114 ) ) ( AVAILABLE ?auto_4114 ) ( SURFACE-AT ?auto_4101 ?auto_4113 ) ( ON ?auto_4101 ?auto_4116 ) ( CLEAR ?auto_4101 ) ( not ( = ?auto_4101 ?auto_4116 ) ) ( not ( = ?auto_4102 ?auto_4116 ) ) ( IS-CRATE ?auto_4102 ) ( not ( = ?auto_4101 ?auto_4109 ) ) ( not ( = ?auto_4102 ?auto_4109 ) ) ( not ( = ?auto_4116 ?auto_4109 ) ) ( not ( = ?auto_4106 ?auto_4107 ) ) ( not ( = ?auto_4113 ?auto_4106 ) ) ( HOIST-AT ?auto_4104 ?auto_4106 ) ( not ( = ?auto_4117 ?auto_4104 ) ) ( not ( = ?auto_4114 ?auto_4104 ) ) ( AVAILABLE ?auto_4104 ) ( SURFACE-AT ?auto_4102 ?auto_4106 ) ( ON ?auto_4102 ?auto_4110 ) ( CLEAR ?auto_4102 ) ( not ( = ?auto_4101 ?auto_4110 ) ) ( not ( = ?auto_4102 ?auto_4110 ) ) ( not ( = ?auto_4116 ?auto_4110 ) ) ( not ( = ?auto_4109 ?auto_4110 ) ) ( IS-CRATE ?auto_4109 ) ( not ( = ?auto_4101 ?auto_4111 ) ) ( not ( = ?auto_4102 ?auto_4111 ) ) ( not ( = ?auto_4116 ?auto_4111 ) ) ( not ( = ?auto_4109 ?auto_4111 ) ) ( not ( = ?auto_4110 ?auto_4111 ) ) ( not ( = ?auto_4108 ?auto_4107 ) ) ( not ( = ?auto_4113 ?auto_4108 ) ) ( not ( = ?auto_4106 ?auto_4108 ) ) ( HOIST-AT ?auto_4112 ?auto_4108 ) ( not ( = ?auto_4117 ?auto_4112 ) ) ( not ( = ?auto_4114 ?auto_4112 ) ) ( not ( = ?auto_4104 ?auto_4112 ) ) ( AVAILABLE ?auto_4112 ) ( SURFACE-AT ?auto_4109 ?auto_4108 ) ( ON ?auto_4109 ?auto_4103 ) ( CLEAR ?auto_4109 ) ( not ( = ?auto_4101 ?auto_4103 ) ) ( not ( = ?auto_4102 ?auto_4103 ) ) ( not ( = ?auto_4116 ?auto_4103 ) ) ( not ( = ?auto_4109 ?auto_4103 ) ) ( not ( = ?auto_4110 ?auto_4103 ) ) ( not ( = ?auto_4111 ?auto_4103 ) ) ( TRUCK-AT ?auto_4105 ?auto_4107 ) ( SURFACE-AT ?auto_4115 ?auto_4107 ) ( CLEAR ?auto_4115 ) ( IS-CRATE ?auto_4111 ) ( not ( = ?auto_4101 ?auto_4115 ) ) ( not ( = ?auto_4102 ?auto_4115 ) ) ( not ( = ?auto_4116 ?auto_4115 ) ) ( not ( = ?auto_4109 ?auto_4115 ) ) ( not ( = ?auto_4110 ?auto_4115 ) ) ( not ( = ?auto_4111 ?auto_4115 ) ) ( not ( = ?auto_4103 ?auto_4115 ) ) ( AVAILABLE ?auto_4117 ) ( IN ?auto_4111 ?auto_4105 ) )
    :subtasks
    ( ( !UNLOAD ?auto_4117 ?auto_4111 ?auto_4105 ?auto_4107 )
      ( MAKE-ON ?auto_4101 ?auto_4102 )
      ( MAKE-ON-VERIFY ?auto_4101 ?auto_4102 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4118 - SURFACE
      ?auto_4119 - SURFACE
    )
    :vars
    (
      ?auto_4127 - HOIST
      ?auto_4132 - PLACE
      ?auto_4134 - PLACE
      ?auto_4126 - HOIST
      ?auto_4129 - SURFACE
      ?auto_4124 - SURFACE
      ?auto_4121 - PLACE
      ?auto_4128 - HOIST
      ?auto_4131 - SURFACE
      ?auto_4125 - SURFACE
      ?auto_4123 - PLACE
      ?auto_4133 - HOIST
      ?auto_4120 - SURFACE
      ?auto_4130 - SURFACE
      ?auto_4122 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4127 ?auto_4132 ) ( IS-CRATE ?auto_4118 ) ( not ( = ?auto_4118 ?auto_4119 ) ) ( not ( = ?auto_4134 ?auto_4132 ) ) ( HOIST-AT ?auto_4126 ?auto_4134 ) ( not ( = ?auto_4127 ?auto_4126 ) ) ( AVAILABLE ?auto_4126 ) ( SURFACE-AT ?auto_4118 ?auto_4134 ) ( ON ?auto_4118 ?auto_4129 ) ( CLEAR ?auto_4118 ) ( not ( = ?auto_4118 ?auto_4129 ) ) ( not ( = ?auto_4119 ?auto_4129 ) ) ( IS-CRATE ?auto_4119 ) ( not ( = ?auto_4118 ?auto_4124 ) ) ( not ( = ?auto_4119 ?auto_4124 ) ) ( not ( = ?auto_4129 ?auto_4124 ) ) ( not ( = ?auto_4121 ?auto_4132 ) ) ( not ( = ?auto_4134 ?auto_4121 ) ) ( HOIST-AT ?auto_4128 ?auto_4121 ) ( not ( = ?auto_4127 ?auto_4128 ) ) ( not ( = ?auto_4126 ?auto_4128 ) ) ( AVAILABLE ?auto_4128 ) ( SURFACE-AT ?auto_4119 ?auto_4121 ) ( ON ?auto_4119 ?auto_4131 ) ( CLEAR ?auto_4119 ) ( not ( = ?auto_4118 ?auto_4131 ) ) ( not ( = ?auto_4119 ?auto_4131 ) ) ( not ( = ?auto_4129 ?auto_4131 ) ) ( not ( = ?auto_4124 ?auto_4131 ) ) ( IS-CRATE ?auto_4124 ) ( not ( = ?auto_4118 ?auto_4125 ) ) ( not ( = ?auto_4119 ?auto_4125 ) ) ( not ( = ?auto_4129 ?auto_4125 ) ) ( not ( = ?auto_4124 ?auto_4125 ) ) ( not ( = ?auto_4131 ?auto_4125 ) ) ( not ( = ?auto_4123 ?auto_4132 ) ) ( not ( = ?auto_4134 ?auto_4123 ) ) ( not ( = ?auto_4121 ?auto_4123 ) ) ( HOIST-AT ?auto_4133 ?auto_4123 ) ( not ( = ?auto_4127 ?auto_4133 ) ) ( not ( = ?auto_4126 ?auto_4133 ) ) ( not ( = ?auto_4128 ?auto_4133 ) ) ( AVAILABLE ?auto_4133 ) ( SURFACE-AT ?auto_4124 ?auto_4123 ) ( ON ?auto_4124 ?auto_4120 ) ( CLEAR ?auto_4124 ) ( not ( = ?auto_4118 ?auto_4120 ) ) ( not ( = ?auto_4119 ?auto_4120 ) ) ( not ( = ?auto_4129 ?auto_4120 ) ) ( not ( = ?auto_4124 ?auto_4120 ) ) ( not ( = ?auto_4131 ?auto_4120 ) ) ( not ( = ?auto_4125 ?auto_4120 ) ) ( SURFACE-AT ?auto_4130 ?auto_4132 ) ( CLEAR ?auto_4130 ) ( IS-CRATE ?auto_4125 ) ( not ( = ?auto_4118 ?auto_4130 ) ) ( not ( = ?auto_4119 ?auto_4130 ) ) ( not ( = ?auto_4129 ?auto_4130 ) ) ( not ( = ?auto_4124 ?auto_4130 ) ) ( not ( = ?auto_4131 ?auto_4130 ) ) ( not ( = ?auto_4125 ?auto_4130 ) ) ( not ( = ?auto_4120 ?auto_4130 ) ) ( AVAILABLE ?auto_4127 ) ( IN ?auto_4125 ?auto_4122 ) ( TRUCK-AT ?auto_4122 ?auto_4123 ) )
    :subtasks
    ( ( !DRIVE ?auto_4122 ?auto_4123 ?auto_4132 )
      ( MAKE-ON ?auto_4118 ?auto_4119 )
      ( MAKE-ON-VERIFY ?auto_4118 ?auto_4119 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4135 - SURFACE
      ?auto_4136 - SURFACE
    )
    :vars
    (
      ?auto_4147 - HOIST
      ?auto_4144 - PLACE
      ?auto_4145 - PLACE
      ?auto_4137 - HOIST
      ?auto_4141 - SURFACE
      ?auto_4140 - SURFACE
      ?auto_4151 - PLACE
      ?auto_4149 - HOIST
      ?auto_4139 - SURFACE
      ?auto_4148 - SURFACE
      ?auto_4142 - PLACE
      ?auto_4146 - HOIST
      ?auto_4150 - SURFACE
      ?auto_4143 - SURFACE
      ?auto_4138 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4147 ?auto_4144 ) ( IS-CRATE ?auto_4135 ) ( not ( = ?auto_4135 ?auto_4136 ) ) ( not ( = ?auto_4145 ?auto_4144 ) ) ( HOIST-AT ?auto_4137 ?auto_4145 ) ( not ( = ?auto_4147 ?auto_4137 ) ) ( AVAILABLE ?auto_4137 ) ( SURFACE-AT ?auto_4135 ?auto_4145 ) ( ON ?auto_4135 ?auto_4141 ) ( CLEAR ?auto_4135 ) ( not ( = ?auto_4135 ?auto_4141 ) ) ( not ( = ?auto_4136 ?auto_4141 ) ) ( IS-CRATE ?auto_4136 ) ( not ( = ?auto_4135 ?auto_4140 ) ) ( not ( = ?auto_4136 ?auto_4140 ) ) ( not ( = ?auto_4141 ?auto_4140 ) ) ( not ( = ?auto_4151 ?auto_4144 ) ) ( not ( = ?auto_4145 ?auto_4151 ) ) ( HOIST-AT ?auto_4149 ?auto_4151 ) ( not ( = ?auto_4147 ?auto_4149 ) ) ( not ( = ?auto_4137 ?auto_4149 ) ) ( AVAILABLE ?auto_4149 ) ( SURFACE-AT ?auto_4136 ?auto_4151 ) ( ON ?auto_4136 ?auto_4139 ) ( CLEAR ?auto_4136 ) ( not ( = ?auto_4135 ?auto_4139 ) ) ( not ( = ?auto_4136 ?auto_4139 ) ) ( not ( = ?auto_4141 ?auto_4139 ) ) ( not ( = ?auto_4140 ?auto_4139 ) ) ( IS-CRATE ?auto_4140 ) ( not ( = ?auto_4135 ?auto_4148 ) ) ( not ( = ?auto_4136 ?auto_4148 ) ) ( not ( = ?auto_4141 ?auto_4148 ) ) ( not ( = ?auto_4140 ?auto_4148 ) ) ( not ( = ?auto_4139 ?auto_4148 ) ) ( not ( = ?auto_4142 ?auto_4144 ) ) ( not ( = ?auto_4145 ?auto_4142 ) ) ( not ( = ?auto_4151 ?auto_4142 ) ) ( HOIST-AT ?auto_4146 ?auto_4142 ) ( not ( = ?auto_4147 ?auto_4146 ) ) ( not ( = ?auto_4137 ?auto_4146 ) ) ( not ( = ?auto_4149 ?auto_4146 ) ) ( SURFACE-AT ?auto_4140 ?auto_4142 ) ( ON ?auto_4140 ?auto_4150 ) ( CLEAR ?auto_4140 ) ( not ( = ?auto_4135 ?auto_4150 ) ) ( not ( = ?auto_4136 ?auto_4150 ) ) ( not ( = ?auto_4141 ?auto_4150 ) ) ( not ( = ?auto_4140 ?auto_4150 ) ) ( not ( = ?auto_4139 ?auto_4150 ) ) ( not ( = ?auto_4148 ?auto_4150 ) ) ( SURFACE-AT ?auto_4143 ?auto_4144 ) ( CLEAR ?auto_4143 ) ( IS-CRATE ?auto_4148 ) ( not ( = ?auto_4135 ?auto_4143 ) ) ( not ( = ?auto_4136 ?auto_4143 ) ) ( not ( = ?auto_4141 ?auto_4143 ) ) ( not ( = ?auto_4140 ?auto_4143 ) ) ( not ( = ?auto_4139 ?auto_4143 ) ) ( not ( = ?auto_4148 ?auto_4143 ) ) ( not ( = ?auto_4150 ?auto_4143 ) ) ( AVAILABLE ?auto_4147 ) ( TRUCK-AT ?auto_4138 ?auto_4142 ) ( LIFTING ?auto_4146 ?auto_4148 ) )
    :subtasks
    ( ( !LOAD ?auto_4146 ?auto_4148 ?auto_4138 ?auto_4142 )
      ( MAKE-ON ?auto_4135 ?auto_4136 )
      ( MAKE-ON-VERIFY ?auto_4135 ?auto_4136 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4152 - SURFACE
      ?auto_4153 - SURFACE
    )
    :vars
    (
      ?auto_4163 - HOIST
      ?auto_4159 - PLACE
      ?auto_4160 - PLACE
      ?auto_4167 - HOIST
      ?auto_4162 - SURFACE
      ?auto_4166 - SURFACE
      ?auto_4168 - PLACE
      ?auto_4156 - HOIST
      ?auto_4155 - SURFACE
      ?auto_4157 - SURFACE
      ?auto_4164 - PLACE
      ?auto_4158 - HOIST
      ?auto_4161 - SURFACE
      ?auto_4165 - SURFACE
      ?auto_4154 - TRUCK
      ?auto_4169 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4163 ?auto_4159 ) ( IS-CRATE ?auto_4152 ) ( not ( = ?auto_4152 ?auto_4153 ) ) ( not ( = ?auto_4160 ?auto_4159 ) ) ( HOIST-AT ?auto_4167 ?auto_4160 ) ( not ( = ?auto_4163 ?auto_4167 ) ) ( AVAILABLE ?auto_4167 ) ( SURFACE-AT ?auto_4152 ?auto_4160 ) ( ON ?auto_4152 ?auto_4162 ) ( CLEAR ?auto_4152 ) ( not ( = ?auto_4152 ?auto_4162 ) ) ( not ( = ?auto_4153 ?auto_4162 ) ) ( IS-CRATE ?auto_4153 ) ( not ( = ?auto_4152 ?auto_4166 ) ) ( not ( = ?auto_4153 ?auto_4166 ) ) ( not ( = ?auto_4162 ?auto_4166 ) ) ( not ( = ?auto_4168 ?auto_4159 ) ) ( not ( = ?auto_4160 ?auto_4168 ) ) ( HOIST-AT ?auto_4156 ?auto_4168 ) ( not ( = ?auto_4163 ?auto_4156 ) ) ( not ( = ?auto_4167 ?auto_4156 ) ) ( AVAILABLE ?auto_4156 ) ( SURFACE-AT ?auto_4153 ?auto_4168 ) ( ON ?auto_4153 ?auto_4155 ) ( CLEAR ?auto_4153 ) ( not ( = ?auto_4152 ?auto_4155 ) ) ( not ( = ?auto_4153 ?auto_4155 ) ) ( not ( = ?auto_4162 ?auto_4155 ) ) ( not ( = ?auto_4166 ?auto_4155 ) ) ( IS-CRATE ?auto_4166 ) ( not ( = ?auto_4152 ?auto_4157 ) ) ( not ( = ?auto_4153 ?auto_4157 ) ) ( not ( = ?auto_4162 ?auto_4157 ) ) ( not ( = ?auto_4166 ?auto_4157 ) ) ( not ( = ?auto_4155 ?auto_4157 ) ) ( not ( = ?auto_4164 ?auto_4159 ) ) ( not ( = ?auto_4160 ?auto_4164 ) ) ( not ( = ?auto_4168 ?auto_4164 ) ) ( HOIST-AT ?auto_4158 ?auto_4164 ) ( not ( = ?auto_4163 ?auto_4158 ) ) ( not ( = ?auto_4167 ?auto_4158 ) ) ( not ( = ?auto_4156 ?auto_4158 ) ) ( SURFACE-AT ?auto_4166 ?auto_4164 ) ( ON ?auto_4166 ?auto_4161 ) ( CLEAR ?auto_4166 ) ( not ( = ?auto_4152 ?auto_4161 ) ) ( not ( = ?auto_4153 ?auto_4161 ) ) ( not ( = ?auto_4162 ?auto_4161 ) ) ( not ( = ?auto_4166 ?auto_4161 ) ) ( not ( = ?auto_4155 ?auto_4161 ) ) ( not ( = ?auto_4157 ?auto_4161 ) ) ( SURFACE-AT ?auto_4165 ?auto_4159 ) ( CLEAR ?auto_4165 ) ( IS-CRATE ?auto_4157 ) ( not ( = ?auto_4152 ?auto_4165 ) ) ( not ( = ?auto_4153 ?auto_4165 ) ) ( not ( = ?auto_4162 ?auto_4165 ) ) ( not ( = ?auto_4166 ?auto_4165 ) ) ( not ( = ?auto_4155 ?auto_4165 ) ) ( not ( = ?auto_4157 ?auto_4165 ) ) ( not ( = ?auto_4161 ?auto_4165 ) ) ( AVAILABLE ?auto_4163 ) ( TRUCK-AT ?auto_4154 ?auto_4164 ) ( AVAILABLE ?auto_4158 ) ( SURFACE-AT ?auto_4157 ?auto_4164 ) ( ON ?auto_4157 ?auto_4169 ) ( CLEAR ?auto_4157 ) ( not ( = ?auto_4152 ?auto_4169 ) ) ( not ( = ?auto_4153 ?auto_4169 ) ) ( not ( = ?auto_4162 ?auto_4169 ) ) ( not ( = ?auto_4166 ?auto_4169 ) ) ( not ( = ?auto_4155 ?auto_4169 ) ) ( not ( = ?auto_4157 ?auto_4169 ) ) ( not ( = ?auto_4161 ?auto_4169 ) ) ( not ( = ?auto_4165 ?auto_4169 ) ) )
    :subtasks
    ( ( !LIFT ?auto_4158 ?auto_4157 ?auto_4169 ?auto_4164 )
      ( MAKE-ON ?auto_4152 ?auto_4153 )
      ( MAKE-ON-VERIFY ?auto_4152 ?auto_4153 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4170 - SURFACE
      ?auto_4171 - SURFACE
    )
    :vars
    (
      ?auto_4186 - HOIST
      ?auto_4179 - PLACE
      ?auto_4174 - PLACE
      ?auto_4187 - HOIST
      ?auto_4185 - SURFACE
      ?auto_4181 - SURFACE
      ?auto_4175 - PLACE
      ?auto_4178 - HOIST
      ?auto_4176 - SURFACE
      ?auto_4177 - SURFACE
      ?auto_4183 - PLACE
      ?auto_4184 - HOIST
      ?auto_4180 - SURFACE
      ?auto_4182 - SURFACE
      ?auto_4173 - SURFACE
      ?auto_4172 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4186 ?auto_4179 ) ( IS-CRATE ?auto_4170 ) ( not ( = ?auto_4170 ?auto_4171 ) ) ( not ( = ?auto_4174 ?auto_4179 ) ) ( HOIST-AT ?auto_4187 ?auto_4174 ) ( not ( = ?auto_4186 ?auto_4187 ) ) ( AVAILABLE ?auto_4187 ) ( SURFACE-AT ?auto_4170 ?auto_4174 ) ( ON ?auto_4170 ?auto_4185 ) ( CLEAR ?auto_4170 ) ( not ( = ?auto_4170 ?auto_4185 ) ) ( not ( = ?auto_4171 ?auto_4185 ) ) ( IS-CRATE ?auto_4171 ) ( not ( = ?auto_4170 ?auto_4181 ) ) ( not ( = ?auto_4171 ?auto_4181 ) ) ( not ( = ?auto_4185 ?auto_4181 ) ) ( not ( = ?auto_4175 ?auto_4179 ) ) ( not ( = ?auto_4174 ?auto_4175 ) ) ( HOIST-AT ?auto_4178 ?auto_4175 ) ( not ( = ?auto_4186 ?auto_4178 ) ) ( not ( = ?auto_4187 ?auto_4178 ) ) ( AVAILABLE ?auto_4178 ) ( SURFACE-AT ?auto_4171 ?auto_4175 ) ( ON ?auto_4171 ?auto_4176 ) ( CLEAR ?auto_4171 ) ( not ( = ?auto_4170 ?auto_4176 ) ) ( not ( = ?auto_4171 ?auto_4176 ) ) ( not ( = ?auto_4185 ?auto_4176 ) ) ( not ( = ?auto_4181 ?auto_4176 ) ) ( IS-CRATE ?auto_4181 ) ( not ( = ?auto_4170 ?auto_4177 ) ) ( not ( = ?auto_4171 ?auto_4177 ) ) ( not ( = ?auto_4185 ?auto_4177 ) ) ( not ( = ?auto_4181 ?auto_4177 ) ) ( not ( = ?auto_4176 ?auto_4177 ) ) ( not ( = ?auto_4183 ?auto_4179 ) ) ( not ( = ?auto_4174 ?auto_4183 ) ) ( not ( = ?auto_4175 ?auto_4183 ) ) ( HOIST-AT ?auto_4184 ?auto_4183 ) ( not ( = ?auto_4186 ?auto_4184 ) ) ( not ( = ?auto_4187 ?auto_4184 ) ) ( not ( = ?auto_4178 ?auto_4184 ) ) ( SURFACE-AT ?auto_4181 ?auto_4183 ) ( ON ?auto_4181 ?auto_4180 ) ( CLEAR ?auto_4181 ) ( not ( = ?auto_4170 ?auto_4180 ) ) ( not ( = ?auto_4171 ?auto_4180 ) ) ( not ( = ?auto_4185 ?auto_4180 ) ) ( not ( = ?auto_4181 ?auto_4180 ) ) ( not ( = ?auto_4176 ?auto_4180 ) ) ( not ( = ?auto_4177 ?auto_4180 ) ) ( SURFACE-AT ?auto_4182 ?auto_4179 ) ( CLEAR ?auto_4182 ) ( IS-CRATE ?auto_4177 ) ( not ( = ?auto_4170 ?auto_4182 ) ) ( not ( = ?auto_4171 ?auto_4182 ) ) ( not ( = ?auto_4185 ?auto_4182 ) ) ( not ( = ?auto_4181 ?auto_4182 ) ) ( not ( = ?auto_4176 ?auto_4182 ) ) ( not ( = ?auto_4177 ?auto_4182 ) ) ( not ( = ?auto_4180 ?auto_4182 ) ) ( AVAILABLE ?auto_4186 ) ( AVAILABLE ?auto_4184 ) ( SURFACE-AT ?auto_4177 ?auto_4183 ) ( ON ?auto_4177 ?auto_4173 ) ( CLEAR ?auto_4177 ) ( not ( = ?auto_4170 ?auto_4173 ) ) ( not ( = ?auto_4171 ?auto_4173 ) ) ( not ( = ?auto_4185 ?auto_4173 ) ) ( not ( = ?auto_4181 ?auto_4173 ) ) ( not ( = ?auto_4176 ?auto_4173 ) ) ( not ( = ?auto_4177 ?auto_4173 ) ) ( not ( = ?auto_4180 ?auto_4173 ) ) ( not ( = ?auto_4182 ?auto_4173 ) ) ( TRUCK-AT ?auto_4172 ?auto_4179 ) )
    :subtasks
    ( ( !DRIVE ?auto_4172 ?auto_4179 ?auto_4183 )
      ( MAKE-ON ?auto_4170 ?auto_4171 )
      ( MAKE-ON-VERIFY ?auto_4170 ?auto_4171 ) )
  )

)

