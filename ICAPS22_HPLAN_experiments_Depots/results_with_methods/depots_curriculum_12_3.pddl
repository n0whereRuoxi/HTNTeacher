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
      ?auto_3612 - SURFACE
      ?auto_3613 - SURFACE
    )
    :vars
    (
      ?auto_3614 - HOIST
      ?auto_3615 - PLACE
      ?auto_3617 - PLACE
      ?auto_3618 - HOIST
      ?auto_3619 - SURFACE
      ?auto_3616 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3614 ?auto_3615 ) ( SURFACE-AT ?auto_3613 ?auto_3615 ) ( CLEAR ?auto_3613 ) ( IS-CRATE ?auto_3612 ) ( AVAILABLE ?auto_3614 ) ( not ( = ?auto_3617 ?auto_3615 ) ) ( HOIST-AT ?auto_3618 ?auto_3617 ) ( AVAILABLE ?auto_3618 ) ( SURFACE-AT ?auto_3612 ?auto_3617 ) ( ON ?auto_3612 ?auto_3619 ) ( CLEAR ?auto_3612 ) ( TRUCK-AT ?auto_3616 ?auto_3615 ) ( not ( = ?auto_3612 ?auto_3613 ) ) ( not ( = ?auto_3612 ?auto_3619 ) ) ( not ( = ?auto_3613 ?auto_3619 ) ) ( not ( = ?auto_3614 ?auto_3618 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3616 ?auto_3615 ?auto_3617 )
      ( !LIFT ?auto_3618 ?auto_3612 ?auto_3619 ?auto_3617 )
      ( !LOAD ?auto_3618 ?auto_3612 ?auto_3616 ?auto_3617 )
      ( !DRIVE ?auto_3616 ?auto_3617 ?auto_3615 )
      ( !UNLOAD ?auto_3614 ?auto_3612 ?auto_3616 ?auto_3615 )
      ( !DROP ?auto_3614 ?auto_3612 ?auto_3613 ?auto_3615 )
      ( MAKE-ON-VERIFY ?auto_3612 ?auto_3613 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3622 - SURFACE
      ?auto_3623 - SURFACE
    )
    :vars
    (
      ?auto_3624 - HOIST
      ?auto_3625 - PLACE
      ?auto_3627 - PLACE
      ?auto_3628 - HOIST
      ?auto_3629 - SURFACE
      ?auto_3626 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3624 ?auto_3625 ) ( SURFACE-AT ?auto_3623 ?auto_3625 ) ( CLEAR ?auto_3623 ) ( IS-CRATE ?auto_3622 ) ( AVAILABLE ?auto_3624 ) ( not ( = ?auto_3627 ?auto_3625 ) ) ( HOIST-AT ?auto_3628 ?auto_3627 ) ( AVAILABLE ?auto_3628 ) ( SURFACE-AT ?auto_3622 ?auto_3627 ) ( ON ?auto_3622 ?auto_3629 ) ( CLEAR ?auto_3622 ) ( TRUCK-AT ?auto_3626 ?auto_3625 ) ( not ( = ?auto_3622 ?auto_3623 ) ) ( not ( = ?auto_3622 ?auto_3629 ) ) ( not ( = ?auto_3623 ?auto_3629 ) ) ( not ( = ?auto_3624 ?auto_3628 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3626 ?auto_3625 ?auto_3627 )
      ( !LIFT ?auto_3628 ?auto_3622 ?auto_3629 ?auto_3627 )
      ( !LOAD ?auto_3628 ?auto_3622 ?auto_3626 ?auto_3627 )
      ( !DRIVE ?auto_3626 ?auto_3627 ?auto_3625 )
      ( !UNLOAD ?auto_3624 ?auto_3622 ?auto_3626 ?auto_3625 )
      ( !DROP ?auto_3624 ?auto_3622 ?auto_3623 ?auto_3625 )
      ( MAKE-ON-VERIFY ?auto_3622 ?auto_3623 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3632 - SURFACE
      ?auto_3633 - SURFACE
    )
    :vars
    (
      ?auto_3634 - HOIST
      ?auto_3635 - PLACE
      ?auto_3637 - PLACE
      ?auto_3638 - HOIST
      ?auto_3639 - SURFACE
      ?auto_3636 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3634 ?auto_3635 ) ( SURFACE-AT ?auto_3633 ?auto_3635 ) ( CLEAR ?auto_3633 ) ( IS-CRATE ?auto_3632 ) ( AVAILABLE ?auto_3634 ) ( not ( = ?auto_3637 ?auto_3635 ) ) ( HOIST-AT ?auto_3638 ?auto_3637 ) ( AVAILABLE ?auto_3638 ) ( SURFACE-AT ?auto_3632 ?auto_3637 ) ( ON ?auto_3632 ?auto_3639 ) ( CLEAR ?auto_3632 ) ( TRUCK-AT ?auto_3636 ?auto_3635 ) ( not ( = ?auto_3632 ?auto_3633 ) ) ( not ( = ?auto_3632 ?auto_3639 ) ) ( not ( = ?auto_3633 ?auto_3639 ) ) ( not ( = ?auto_3634 ?auto_3638 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3636 ?auto_3635 ?auto_3637 )
      ( !LIFT ?auto_3638 ?auto_3632 ?auto_3639 ?auto_3637 )
      ( !LOAD ?auto_3638 ?auto_3632 ?auto_3636 ?auto_3637 )
      ( !DRIVE ?auto_3636 ?auto_3637 ?auto_3635 )
      ( !UNLOAD ?auto_3634 ?auto_3632 ?auto_3636 ?auto_3635 )
      ( !DROP ?auto_3634 ?auto_3632 ?auto_3633 ?auto_3635 )
      ( MAKE-ON-VERIFY ?auto_3632 ?auto_3633 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3642 - SURFACE
      ?auto_3643 - SURFACE
    )
    :vars
    (
      ?auto_3644 - HOIST
      ?auto_3645 - PLACE
      ?auto_3647 - PLACE
      ?auto_3648 - HOIST
      ?auto_3649 - SURFACE
      ?auto_3646 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3644 ?auto_3645 ) ( SURFACE-AT ?auto_3643 ?auto_3645 ) ( CLEAR ?auto_3643 ) ( IS-CRATE ?auto_3642 ) ( AVAILABLE ?auto_3644 ) ( not ( = ?auto_3647 ?auto_3645 ) ) ( HOIST-AT ?auto_3648 ?auto_3647 ) ( AVAILABLE ?auto_3648 ) ( SURFACE-AT ?auto_3642 ?auto_3647 ) ( ON ?auto_3642 ?auto_3649 ) ( CLEAR ?auto_3642 ) ( TRUCK-AT ?auto_3646 ?auto_3645 ) ( not ( = ?auto_3642 ?auto_3643 ) ) ( not ( = ?auto_3642 ?auto_3649 ) ) ( not ( = ?auto_3643 ?auto_3649 ) ) ( not ( = ?auto_3644 ?auto_3648 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3646 ?auto_3645 ?auto_3647 )
      ( !LIFT ?auto_3648 ?auto_3642 ?auto_3649 ?auto_3647 )
      ( !LOAD ?auto_3648 ?auto_3642 ?auto_3646 ?auto_3647 )
      ( !DRIVE ?auto_3646 ?auto_3647 ?auto_3645 )
      ( !UNLOAD ?auto_3644 ?auto_3642 ?auto_3646 ?auto_3645 )
      ( !DROP ?auto_3644 ?auto_3642 ?auto_3643 ?auto_3645 )
      ( MAKE-ON-VERIFY ?auto_3642 ?auto_3643 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3652 - SURFACE
      ?auto_3653 - SURFACE
    )
    :vars
    (
      ?auto_3654 - HOIST
      ?auto_3655 - PLACE
      ?auto_3657 - PLACE
      ?auto_3658 - HOIST
      ?auto_3659 - SURFACE
      ?auto_3656 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3654 ?auto_3655 ) ( SURFACE-AT ?auto_3653 ?auto_3655 ) ( CLEAR ?auto_3653 ) ( IS-CRATE ?auto_3652 ) ( AVAILABLE ?auto_3654 ) ( not ( = ?auto_3657 ?auto_3655 ) ) ( HOIST-AT ?auto_3658 ?auto_3657 ) ( AVAILABLE ?auto_3658 ) ( SURFACE-AT ?auto_3652 ?auto_3657 ) ( ON ?auto_3652 ?auto_3659 ) ( CLEAR ?auto_3652 ) ( TRUCK-AT ?auto_3656 ?auto_3655 ) ( not ( = ?auto_3652 ?auto_3653 ) ) ( not ( = ?auto_3652 ?auto_3659 ) ) ( not ( = ?auto_3653 ?auto_3659 ) ) ( not ( = ?auto_3654 ?auto_3658 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3656 ?auto_3655 ?auto_3657 )
      ( !LIFT ?auto_3658 ?auto_3652 ?auto_3659 ?auto_3657 )
      ( !LOAD ?auto_3658 ?auto_3652 ?auto_3656 ?auto_3657 )
      ( !DRIVE ?auto_3656 ?auto_3657 ?auto_3655 )
      ( !UNLOAD ?auto_3654 ?auto_3652 ?auto_3656 ?auto_3655 )
      ( !DROP ?auto_3654 ?auto_3652 ?auto_3653 ?auto_3655 )
      ( MAKE-ON-VERIFY ?auto_3652 ?auto_3653 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3662 - SURFACE
      ?auto_3663 - SURFACE
    )
    :vars
    (
      ?auto_3664 - HOIST
      ?auto_3665 - PLACE
      ?auto_3667 - PLACE
      ?auto_3668 - HOIST
      ?auto_3669 - SURFACE
      ?auto_3666 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3664 ?auto_3665 ) ( SURFACE-AT ?auto_3663 ?auto_3665 ) ( CLEAR ?auto_3663 ) ( IS-CRATE ?auto_3662 ) ( AVAILABLE ?auto_3664 ) ( not ( = ?auto_3667 ?auto_3665 ) ) ( HOIST-AT ?auto_3668 ?auto_3667 ) ( AVAILABLE ?auto_3668 ) ( SURFACE-AT ?auto_3662 ?auto_3667 ) ( ON ?auto_3662 ?auto_3669 ) ( CLEAR ?auto_3662 ) ( TRUCK-AT ?auto_3666 ?auto_3665 ) ( not ( = ?auto_3662 ?auto_3663 ) ) ( not ( = ?auto_3662 ?auto_3669 ) ) ( not ( = ?auto_3663 ?auto_3669 ) ) ( not ( = ?auto_3664 ?auto_3668 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3666 ?auto_3665 ?auto_3667 )
      ( !LIFT ?auto_3668 ?auto_3662 ?auto_3669 ?auto_3667 )
      ( !LOAD ?auto_3668 ?auto_3662 ?auto_3666 ?auto_3667 )
      ( !DRIVE ?auto_3666 ?auto_3667 ?auto_3665 )
      ( !UNLOAD ?auto_3664 ?auto_3662 ?auto_3666 ?auto_3665 )
      ( !DROP ?auto_3664 ?auto_3662 ?auto_3663 ?auto_3665 )
      ( MAKE-ON-VERIFY ?auto_3662 ?auto_3663 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3672 - SURFACE
      ?auto_3673 - SURFACE
    )
    :vars
    (
      ?auto_3674 - HOIST
      ?auto_3675 - PLACE
      ?auto_3677 - PLACE
      ?auto_3678 - HOIST
      ?auto_3679 - SURFACE
      ?auto_3676 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3674 ?auto_3675 ) ( SURFACE-AT ?auto_3673 ?auto_3675 ) ( CLEAR ?auto_3673 ) ( IS-CRATE ?auto_3672 ) ( AVAILABLE ?auto_3674 ) ( not ( = ?auto_3677 ?auto_3675 ) ) ( HOIST-AT ?auto_3678 ?auto_3677 ) ( AVAILABLE ?auto_3678 ) ( SURFACE-AT ?auto_3672 ?auto_3677 ) ( ON ?auto_3672 ?auto_3679 ) ( CLEAR ?auto_3672 ) ( TRUCK-AT ?auto_3676 ?auto_3675 ) ( not ( = ?auto_3672 ?auto_3673 ) ) ( not ( = ?auto_3672 ?auto_3679 ) ) ( not ( = ?auto_3673 ?auto_3679 ) ) ( not ( = ?auto_3674 ?auto_3678 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3676 ?auto_3675 ?auto_3677 )
      ( !LIFT ?auto_3678 ?auto_3672 ?auto_3679 ?auto_3677 )
      ( !LOAD ?auto_3678 ?auto_3672 ?auto_3676 ?auto_3677 )
      ( !DRIVE ?auto_3676 ?auto_3677 ?auto_3675 )
      ( !UNLOAD ?auto_3674 ?auto_3672 ?auto_3676 ?auto_3675 )
      ( !DROP ?auto_3674 ?auto_3672 ?auto_3673 ?auto_3675 )
      ( MAKE-ON-VERIFY ?auto_3672 ?auto_3673 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3682 - SURFACE
      ?auto_3683 - SURFACE
    )
    :vars
    (
      ?auto_3684 - HOIST
      ?auto_3685 - PLACE
      ?auto_3687 - PLACE
      ?auto_3688 - HOIST
      ?auto_3689 - SURFACE
      ?auto_3686 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3684 ?auto_3685 ) ( SURFACE-AT ?auto_3683 ?auto_3685 ) ( CLEAR ?auto_3683 ) ( IS-CRATE ?auto_3682 ) ( AVAILABLE ?auto_3684 ) ( not ( = ?auto_3687 ?auto_3685 ) ) ( HOIST-AT ?auto_3688 ?auto_3687 ) ( AVAILABLE ?auto_3688 ) ( SURFACE-AT ?auto_3682 ?auto_3687 ) ( ON ?auto_3682 ?auto_3689 ) ( CLEAR ?auto_3682 ) ( TRUCK-AT ?auto_3686 ?auto_3685 ) ( not ( = ?auto_3682 ?auto_3683 ) ) ( not ( = ?auto_3682 ?auto_3689 ) ) ( not ( = ?auto_3683 ?auto_3689 ) ) ( not ( = ?auto_3684 ?auto_3688 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3686 ?auto_3685 ?auto_3687 )
      ( !LIFT ?auto_3688 ?auto_3682 ?auto_3689 ?auto_3687 )
      ( !LOAD ?auto_3688 ?auto_3682 ?auto_3686 ?auto_3687 )
      ( !DRIVE ?auto_3686 ?auto_3687 ?auto_3685 )
      ( !UNLOAD ?auto_3684 ?auto_3682 ?auto_3686 ?auto_3685 )
      ( !DROP ?auto_3684 ?auto_3682 ?auto_3683 ?auto_3685 )
      ( MAKE-ON-VERIFY ?auto_3682 ?auto_3683 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3692 - SURFACE
      ?auto_3693 - SURFACE
    )
    :vars
    (
      ?auto_3694 - HOIST
      ?auto_3695 - PLACE
      ?auto_3697 - PLACE
      ?auto_3698 - HOIST
      ?auto_3699 - SURFACE
      ?auto_3696 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3694 ?auto_3695 ) ( SURFACE-AT ?auto_3693 ?auto_3695 ) ( CLEAR ?auto_3693 ) ( IS-CRATE ?auto_3692 ) ( AVAILABLE ?auto_3694 ) ( not ( = ?auto_3697 ?auto_3695 ) ) ( HOIST-AT ?auto_3698 ?auto_3697 ) ( AVAILABLE ?auto_3698 ) ( SURFACE-AT ?auto_3692 ?auto_3697 ) ( ON ?auto_3692 ?auto_3699 ) ( CLEAR ?auto_3692 ) ( TRUCK-AT ?auto_3696 ?auto_3695 ) ( not ( = ?auto_3692 ?auto_3693 ) ) ( not ( = ?auto_3692 ?auto_3699 ) ) ( not ( = ?auto_3693 ?auto_3699 ) ) ( not ( = ?auto_3694 ?auto_3698 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3696 ?auto_3695 ?auto_3697 )
      ( !LIFT ?auto_3698 ?auto_3692 ?auto_3699 ?auto_3697 )
      ( !LOAD ?auto_3698 ?auto_3692 ?auto_3696 ?auto_3697 )
      ( !DRIVE ?auto_3696 ?auto_3697 ?auto_3695 )
      ( !UNLOAD ?auto_3694 ?auto_3692 ?auto_3696 ?auto_3695 )
      ( !DROP ?auto_3694 ?auto_3692 ?auto_3693 ?auto_3695 )
      ( MAKE-ON-VERIFY ?auto_3692 ?auto_3693 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3702 - SURFACE
      ?auto_3703 - SURFACE
    )
    :vars
    (
      ?auto_3704 - HOIST
      ?auto_3705 - PLACE
      ?auto_3707 - PLACE
      ?auto_3708 - HOIST
      ?auto_3709 - SURFACE
      ?auto_3706 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3704 ?auto_3705 ) ( SURFACE-AT ?auto_3703 ?auto_3705 ) ( CLEAR ?auto_3703 ) ( IS-CRATE ?auto_3702 ) ( AVAILABLE ?auto_3704 ) ( not ( = ?auto_3707 ?auto_3705 ) ) ( HOIST-AT ?auto_3708 ?auto_3707 ) ( AVAILABLE ?auto_3708 ) ( SURFACE-AT ?auto_3702 ?auto_3707 ) ( ON ?auto_3702 ?auto_3709 ) ( CLEAR ?auto_3702 ) ( TRUCK-AT ?auto_3706 ?auto_3705 ) ( not ( = ?auto_3702 ?auto_3703 ) ) ( not ( = ?auto_3702 ?auto_3709 ) ) ( not ( = ?auto_3703 ?auto_3709 ) ) ( not ( = ?auto_3704 ?auto_3708 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3706 ?auto_3705 ?auto_3707 )
      ( !LIFT ?auto_3708 ?auto_3702 ?auto_3709 ?auto_3707 )
      ( !LOAD ?auto_3708 ?auto_3702 ?auto_3706 ?auto_3707 )
      ( !DRIVE ?auto_3706 ?auto_3707 ?auto_3705 )
      ( !UNLOAD ?auto_3704 ?auto_3702 ?auto_3706 ?auto_3705 )
      ( !DROP ?auto_3704 ?auto_3702 ?auto_3703 ?auto_3705 )
      ( MAKE-ON-VERIFY ?auto_3702 ?auto_3703 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3712 - SURFACE
      ?auto_3713 - SURFACE
    )
    :vars
    (
      ?auto_3714 - HOIST
      ?auto_3715 - PLACE
      ?auto_3717 - PLACE
      ?auto_3718 - HOIST
      ?auto_3719 - SURFACE
      ?auto_3716 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3714 ?auto_3715 ) ( SURFACE-AT ?auto_3713 ?auto_3715 ) ( CLEAR ?auto_3713 ) ( IS-CRATE ?auto_3712 ) ( AVAILABLE ?auto_3714 ) ( not ( = ?auto_3717 ?auto_3715 ) ) ( HOIST-AT ?auto_3718 ?auto_3717 ) ( AVAILABLE ?auto_3718 ) ( SURFACE-AT ?auto_3712 ?auto_3717 ) ( ON ?auto_3712 ?auto_3719 ) ( CLEAR ?auto_3712 ) ( TRUCK-AT ?auto_3716 ?auto_3715 ) ( not ( = ?auto_3712 ?auto_3713 ) ) ( not ( = ?auto_3712 ?auto_3719 ) ) ( not ( = ?auto_3713 ?auto_3719 ) ) ( not ( = ?auto_3714 ?auto_3718 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3716 ?auto_3715 ?auto_3717 )
      ( !LIFT ?auto_3718 ?auto_3712 ?auto_3719 ?auto_3717 )
      ( !LOAD ?auto_3718 ?auto_3712 ?auto_3716 ?auto_3717 )
      ( !DRIVE ?auto_3716 ?auto_3717 ?auto_3715 )
      ( !UNLOAD ?auto_3714 ?auto_3712 ?auto_3716 ?auto_3715 )
      ( !DROP ?auto_3714 ?auto_3712 ?auto_3713 ?auto_3715 )
      ( MAKE-ON-VERIFY ?auto_3712 ?auto_3713 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_3722 - SURFACE
      ?auto_3723 - SURFACE
    )
    :vars
    (
      ?auto_3724 - HOIST
      ?auto_3725 - PLACE
      ?auto_3727 - PLACE
      ?auto_3728 - HOIST
      ?auto_3729 - SURFACE
      ?auto_3726 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3724 ?auto_3725 ) ( SURFACE-AT ?auto_3723 ?auto_3725 ) ( CLEAR ?auto_3723 ) ( IS-CRATE ?auto_3722 ) ( AVAILABLE ?auto_3724 ) ( not ( = ?auto_3727 ?auto_3725 ) ) ( HOIST-AT ?auto_3728 ?auto_3727 ) ( AVAILABLE ?auto_3728 ) ( SURFACE-AT ?auto_3722 ?auto_3727 ) ( ON ?auto_3722 ?auto_3729 ) ( CLEAR ?auto_3722 ) ( TRUCK-AT ?auto_3726 ?auto_3725 ) ( not ( = ?auto_3722 ?auto_3723 ) ) ( not ( = ?auto_3722 ?auto_3729 ) ) ( not ( = ?auto_3723 ?auto_3729 ) ) ( not ( = ?auto_3724 ?auto_3728 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3726 ?auto_3725 ?auto_3727 )
      ( !LIFT ?auto_3728 ?auto_3722 ?auto_3729 ?auto_3727 )
      ( !LOAD ?auto_3728 ?auto_3722 ?auto_3726 ?auto_3727 )
      ( !DRIVE ?auto_3726 ?auto_3727 ?auto_3725 )
      ( !UNLOAD ?auto_3724 ?auto_3722 ?auto_3726 ?auto_3725 )
      ( !DROP ?auto_3724 ?auto_3722 ?auto_3723 ?auto_3725 )
      ( MAKE-ON-VERIFY ?auto_3722 ?auto_3723 ) )
  )

)

