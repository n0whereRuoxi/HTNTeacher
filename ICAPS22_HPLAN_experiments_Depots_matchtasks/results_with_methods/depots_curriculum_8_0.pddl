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

  ( :method MAKE-8CRATE-VERIFY
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
      ?c8 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( CLEAR ?c8 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3630 - SURFACE
      ?auto_3631 - SURFACE
    )
    :vars
    (
      ?auto_3632 - HOIST
      ?auto_3633 - PLACE
      ?auto_3635 - PLACE
      ?auto_3636 - HOIST
      ?auto_3637 - SURFACE
      ?auto_3634 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3632 ?auto_3633 ) ( SURFACE-AT ?auto_3630 ?auto_3633 ) ( CLEAR ?auto_3630 ) ( IS-CRATE ?auto_3631 ) ( AVAILABLE ?auto_3632 ) ( not ( = ?auto_3635 ?auto_3633 ) ) ( HOIST-AT ?auto_3636 ?auto_3635 ) ( AVAILABLE ?auto_3636 ) ( SURFACE-AT ?auto_3631 ?auto_3635 ) ( ON ?auto_3631 ?auto_3637 ) ( CLEAR ?auto_3631 ) ( TRUCK-AT ?auto_3634 ?auto_3633 ) ( not ( = ?auto_3630 ?auto_3631 ) ) ( not ( = ?auto_3630 ?auto_3637 ) ) ( not ( = ?auto_3631 ?auto_3637 ) ) ( not ( = ?auto_3632 ?auto_3636 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3634 ?auto_3633 ?auto_3635 )
      ( !LIFT ?auto_3636 ?auto_3631 ?auto_3637 ?auto_3635 )
      ( !LOAD ?auto_3636 ?auto_3631 ?auto_3634 ?auto_3635 )
      ( !DRIVE ?auto_3634 ?auto_3635 ?auto_3633 )
      ( !UNLOAD ?auto_3632 ?auto_3631 ?auto_3634 ?auto_3633 )
      ( !DROP ?auto_3632 ?auto_3631 ?auto_3630 ?auto_3633 )
      ( MAKE-1CRATE-VERIFY ?auto_3630 ?auto_3631 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3640 - SURFACE
      ?auto_3641 - SURFACE
    )
    :vars
    (
      ?auto_3642 - HOIST
      ?auto_3643 - PLACE
      ?auto_3645 - PLACE
      ?auto_3646 - HOIST
      ?auto_3647 - SURFACE
      ?auto_3644 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3642 ?auto_3643 ) ( SURFACE-AT ?auto_3640 ?auto_3643 ) ( CLEAR ?auto_3640 ) ( IS-CRATE ?auto_3641 ) ( AVAILABLE ?auto_3642 ) ( not ( = ?auto_3645 ?auto_3643 ) ) ( HOIST-AT ?auto_3646 ?auto_3645 ) ( AVAILABLE ?auto_3646 ) ( SURFACE-AT ?auto_3641 ?auto_3645 ) ( ON ?auto_3641 ?auto_3647 ) ( CLEAR ?auto_3641 ) ( TRUCK-AT ?auto_3644 ?auto_3643 ) ( not ( = ?auto_3640 ?auto_3641 ) ) ( not ( = ?auto_3640 ?auto_3647 ) ) ( not ( = ?auto_3641 ?auto_3647 ) ) ( not ( = ?auto_3642 ?auto_3646 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3644 ?auto_3643 ?auto_3645 )
      ( !LIFT ?auto_3646 ?auto_3641 ?auto_3647 ?auto_3645 )
      ( !LOAD ?auto_3646 ?auto_3641 ?auto_3644 ?auto_3645 )
      ( !DRIVE ?auto_3644 ?auto_3645 ?auto_3643 )
      ( !UNLOAD ?auto_3642 ?auto_3641 ?auto_3644 ?auto_3643 )
      ( !DROP ?auto_3642 ?auto_3641 ?auto_3640 ?auto_3643 )
      ( MAKE-1CRATE-VERIFY ?auto_3640 ?auto_3641 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3651 - SURFACE
      ?auto_3652 - SURFACE
      ?auto_3653 - SURFACE
    )
    :vars
    (
      ?auto_3656 - HOIST
      ?auto_3655 - PLACE
      ?auto_3654 - PLACE
      ?auto_3657 - HOIST
      ?auto_3659 - SURFACE
      ?auto_3660 - SURFACE
      ?auto_3658 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3656 ?auto_3655 ) ( IS-CRATE ?auto_3653 ) ( not ( = ?auto_3654 ?auto_3655 ) ) ( HOIST-AT ?auto_3657 ?auto_3654 ) ( SURFACE-AT ?auto_3653 ?auto_3654 ) ( ON ?auto_3653 ?auto_3659 ) ( CLEAR ?auto_3653 ) ( not ( = ?auto_3652 ?auto_3653 ) ) ( not ( = ?auto_3652 ?auto_3659 ) ) ( not ( = ?auto_3653 ?auto_3659 ) ) ( not ( = ?auto_3656 ?auto_3657 ) ) ( SURFACE-AT ?auto_3651 ?auto_3655 ) ( CLEAR ?auto_3651 ) ( IS-CRATE ?auto_3652 ) ( AVAILABLE ?auto_3656 ) ( AVAILABLE ?auto_3657 ) ( SURFACE-AT ?auto_3652 ?auto_3654 ) ( ON ?auto_3652 ?auto_3660 ) ( CLEAR ?auto_3652 ) ( TRUCK-AT ?auto_3658 ?auto_3655 ) ( not ( = ?auto_3651 ?auto_3652 ) ) ( not ( = ?auto_3651 ?auto_3660 ) ) ( not ( = ?auto_3652 ?auto_3660 ) ) ( not ( = ?auto_3651 ?auto_3653 ) ) ( not ( = ?auto_3651 ?auto_3659 ) ) ( not ( = ?auto_3653 ?auto_3660 ) ) ( not ( = ?auto_3659 ?auto_3660 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3651 ?auto_3652 )
      ( MAKE-1CRATE ?auto_3652 ?auto_3653 )
      ( MAKE-2CRATE-VERIFY ?auto_3651 ?auto_3652 ?auto_3653 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3663 - SURFACE
      ?auto_3664 - SURFACE
    )
    :vars
    (
      ?auto_3665 - HOIST
      ?auto_3666 - PLACE
      ?auto_3668 - PLACE
      ?auto_3669 - HOIST
      ?auto_3670 - SURFACE
      ?auto_3667 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3665 ?auto_3666 ) ( SURFACE-AT ?auto_3663 ?auto_3666 ) ( CLEAR ?auto_3663 ) ( IS-CRATE ?auto_3664 ) ( AVAILABLE ?auto_3665 ) ( not ( = ?auto_3668 ?auto_3666 ) ) ( HOIST-AT ?auto_3669 ?auto_3668 ) ( AVAILABLE ?auto_3669 ) ( SURFACE-AT ?auto_3664 ?auto_3668 ) ( ON ?auto_3664 ?auto_3670 ) ( CLEAR ?auto_3664 ) ( TRUCK-AT ?auto_3667 ?auto_3666 ) ( not ( = ?auto_3663 ?auto_3664 ) ) ( not ( = ?auto_3663 ?auto_3670 ) ) ( not ( = ?auto_3664 ?auto_3670 ) ) ( not ( = ?auto_3665 ?auto_3669 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3667 ?auto_3666 ?auto_3668 )
      ( !LIFT ?auto_3669 ?auto_3664 ?auto_3670 ?auto_3668 )
      ( !LOAD ?auto_3669 ?auto_3664 ?auto_3667 ?auto_3668 )
      ( !DRIVE ?auto_3667 ?auto_3668 ?auto_3666 )
      ( !UNLOAD ?auto_3665 ?auto_3664 ?auto_3667 ?auto_3666 )
      ( !DROP ?auto_3665 ?auto_3664 ?auto_3663 ?auto_3666 )
      ( MAKE-1CRATE-VERIFY ?auto_3663 ?auto_3664 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_3675 - SURFACE
      ?auto_3676 - SURFACE
      ?auto_3677 - SURFACE
      ?auto_3678 - SURFACE
    )
    :vars
    (
      ?auto_3682 - HOIST
      ?auto_3683 - PLACE
      ?auto_3681 - PLACE
      ?auto_3680 - HOIST
      ?auto_3679 - SURFACE
      ?auto_3687 - PLACE
      ?auto_3688 - HOIST
      ?auto_3686 - SURFACE
      ?auto_3685 - SURFACE
      ?auto_3684 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3682 ?auto_3683 ) ( IS-CRATE ?auto_3678 ) ( not ( = ?auto_3681 ?auto_3683 ) ) ( HOIST-AT ?auto_3680 ?auto_3681 ) ( AVAILABLE ?auto_3680 ) ( SURFACE-AT ?auto_3678 ?auto_3681 ) ( ON ?auto_3678 ?auto_3679 ) ( CLEAR ?auto_3678 ) ( not ( = ?auto_3677 ?auto_3678 ) ) ( not ( = ?auto_3677 ?auto_3679 ) ) ( not ( = ?auto_3678 ?auto_3679 ) ) ( not ( = ?auto_3682 ?auto_3680 ) ) ( IS-CRATE ?auto_3677 ) ( not ( = ?auto_3687 ?auto_3683 ) ) ( HOIST-AT ?auto_3688 ?auto_3687 ) ( SURFACE-AT ?auto_3677 ?auto_3687 ) ( ON ?auto_3677 ?auto_3686 ) ( CLEAR ?auto_3677 ) ( not ( = ?auto_3676 ?auto_3677 ) ) ( not ( = ?auto_3676 ?auto_3686 ) ) ( not ( = ?auto_3677 ?auto_3686 ) ) ( not ( = ?auto_3682 ?auto_3688 ) ) ( SURFACE-AT ?auto_3675 ?auto_3683 ) ( CLEAR ?auto_3675 ) ( IS-CRATE ?auto_3676 ) ( AVAILABLE ?auto_3682 ) ( AVAILABLE ?auto_3688 ) ( SURFACE-AT ?auto_3676 ?auto_3687 ) ( ON ?auto_3676 ?auto_3685 ) ( CLEAR ?auto_3676 ) ( TRUCK-AT ?auto_3684 ?auto_3683 ) ( not ( = ?auto_3675 ?auto_3676 ) ) ( not ( = ?auto_3675 ?auto_3685 ) ) ( not ( = ?auto_3676 ?auto_3685 ) ) ( not ( = ?auto_3675 ?auto_3677 ) ) ( not ( = ?auto_3675 ?auto_3686 ) ) ( not ( = ?auto_3677 ?auto_3685 ) ) ( not ( = ?auto_3686 ?auto_3685 ) ) ( not ( = ?auto_3675 ?auto_3678 ) ) ( not ( = ?auto_3675 ?auto_3679 ) ) ( not ( = ?auto_3676 ?auto_3678 ) ) ( not ( = ?auto_3676 ?auto_3679 ) ) ( not ( = ?auto_3678 ?auto_3686 ) ) ( not ( = ?auto_3678 ?auto_3685 ) ) ( not ( = ?auto_3681 ?auto_3687 ) ) ( not ( = ?auto_3680 ?auto_3688 ) ) ( not ( = ?auto_3679 ?auto_3686 ) ) ( not ( = ?auto_3679 ?auto_3685 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_3675 ?auto_3676 ?auto_3677 )
      ( MAKE-1CRATE ?auto_3677 ?auto_3678 )
      ( MAKE-3CRATE-VERIFY ?auto_3675 ?auto_3676 ?auto_3677 ?auto_3678 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3691 - SURFACE
      ?auto_3692 - SURFACE
    )
    :vars
    (
      ?auto_3693 - HOIST
      ?auto_3694 - PLACE
      ?auto_3696 - PLACE
      ?auto_3697 - HOIST
      ?auto_3698 - SURFACE
      ?auto_3695 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3693 ?auto_3694 ) ( SURFACE-AT ?auto_3691 ?auto_3694 ) ( CLEAR ?auto_3691 ) ( IS-CRATE ?auto_3692 ) ( AVAILABLE ?auto_3693 ) ( not ( = ?auto_3696 ?auto_3694 ) ) ( HOIST-AT ?auto_3697 ?auto_3696 ) ( AVAILABLE ?auto_3697 ) ( SURFACE-AT ?auto_3692 ?auto_3696 ) ( ON ?auto_3692 ?auto_3698 ) ( CLEAR ?auto_3692 ) ( TRUCK-AT ?auto_3695 ?auto_3694 ) ( not ( = ?auto_3691 ?auto_3692 ) ) ( not ( = ?auto_3691 ?auto_3698 ) ) ( not ( = ?auto_3692 ?auto_3698 ) ) ( not ( = ?auto_3693 ?auto_3697 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3695 ?auto_3694 ?auto_3696 )
      ( !LIFT ?auto_3697 ?auto_3692 ?auto_3698 ?auto_3696 )
      ( !LOAD ?auto_3697 ?auto_3692 ?auto_3695 ?auto_3696 )
      ( !DRIVE ?auto_3695 ?auto_3696 ?auto_3694 )
      ( !UNLOAD ?auto_3693 ?auto_3692 ?auto_3695 ?auto_3694 )
      ( !DROP ?auto_3693 ?auto_3692 ?auto_3691 ?auto_3694 )
      ( MAKE-1CRATE-VERIFY ?auto_3691 ?auto_3692 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_3704 - SURFACE
      ?auto_3705 - SURFACE
      ?auto_3706 - SURFACE
      ?auto_3707 - SURFACE
      ?auto_3708 - SURFACE
    )
    :vars
    (
      ?auto_3713 - HOIST
      ?auto_3709 - PLACE
      ?auto_3710 - PLACE
      ?auto_3711 - HOIST
      ?auto_3714 - SURFACE
      ?auto_3718 - PLACE
      ?auto_3719 - HOIST
      ?auto_3717 - SURFACE
      ?auto_3716 - PLACE
      ?auto_3715 - HOIST
      ?auto_3721 - SURFACE
      ?auto_3720 - SURFACE
      ?auto_3712 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3713 ?auto_3709 ) ( IS-CRATE ?auto_3708 ) ( not ( = ?auto_3710 ?auto_3709 ) ) ( HOIST-AT ?auto_3711 ?auto_3710 ) ( AVAILABLE ?auto_3711 ) ( SURFACE-AT ?auto_3708 ?auto_3710 ) ( ON ?auto_3708 ?auto_3714 ) ( CLEAR ?auto_3708 ) ( not ( = ?auto_3707 ?auto_3708 ) ) ( not ( = ?auto_3707 ?auto_3714 ) ) ( not ( = ?auto_3708 ?auto_3714 ) ) ( not ( = ?auto_3713 ?auto_3711 ) ) ( IS-CRATE ?auto_3707 ) ( not ( = ?auto_3718 ?auto_3709 ) ) ( HOIST-AT ?auto_3719 ?auto_3718 ) ( AVAILABLE ?auto_3719 ) ( SURFACE-AT ?auto_3707 ?auto_3718 ) ( ON ?auto_3707 ?auto_3717 ) ( CLEAR ?auto_3707 ) ( not ( = ?auto_3706 ?auto_3707 ) ) ( not ( = ?auto_3706 ?auto_3717 ) ) ( not ( = ?auto_3707 ?auto_3717 ) ) ( not ( = ?auto_3713 ?auto_3719 ) ) ( IS-CRATE ?auto_3706 ) ( not ( = ?auto_3716 ?auto_3709 ) ) ( HOIST-AT ?auto_3715 ?auto_3716 ) ( SURFACE-AT ?auto_3706 ?auto_3716 ) ( ON ?auto_3706 ?auto_3721 ) ( CLEAR ?auto_3706 ) ( not ( = ?auto_3705 ?auto_3706 ) ) ( not ( = ?auto_3705 ?auto_3721 ) ) ( not ( = ?auto_3706 ?auto_3721 ) ) ( not ( = ?auto_3713 ?auto_3715 ) ) ( SURFACE-AT ?auto_3704 ?auto_3709 ) ( CLEAR ?auto_3704 ) ( IS-CRATE ?auto_3705 ) ( AVAILABLE ?auto_3713 ) ( AVAILABLE ?auto_3715 ) ( SURFACE-AT ?auto_3705 ?auto_3716 ) ( ON ?auto_3705 ?auto_3720 ) ( CLEAR ?auto_3705 ) ( TRUCK-AT ?auto_3712 ?auto_3709 ) ( not ( = ?auto_3704 ?auto_3705 ) ) ( not ( = ?auto_3704 ?auto_3720 ) ) ( not ( = ?auto_3705 ?auto_3720 ) ) ( not ( = ?auto_3704 ?auto_3706 ) ) ( not ( = ?auto_3704 ?auto_3721 ) ) ( not ( = ?auto_3706 ?auto_3720 ) ) ( not ( = ?auto_3721 ?auto_3720 ) ) ( not ( = ?auto_3704 ?auto_3707 ) ) ( not ( = ?auto_3704 ?auto_3717 ) ) ( not ( = ?auto_3705 ?auto_3707 ) ) ( not ( = ?auto_3705 ?auto_3717 ) ) ( not ( = ?auto_3707 ?auto_3721 ) ) ( not ( = ?auto_3707 ?auto_3720 ) ) ( not ( = ?auto_3718 ?auto_3716 ) ) ( not ( = ?auto_3719 ?auto_3715 ) ) ( not ( = ?auto_3717 ?auto_3721 ) ) ( not ( = ?auto_3717 ?auto_3720 ) ) ( not ( = ?auto_3704 ?auto_3708 ) ) ( not ( = ?auto_3704 ?auto_3714 ) ) ( not ( = ?auto_3705 ?auto_3708 ) ) ( not ( = ?auto_3705 ?auto_3714 ) ) ( not ( = ?auto_3706 ?auto_3708 ) ) ( not ( = ?auto_3706 ?auto_3714 ) ) ( not ( = ?auto_3708 ?auto_3717 ) ) ( not ( = ?auto_3708 ?auto_3721 ) ) ( not ( = ?auto_3708 ?auto_3720 ) ) ( not ( = ?auto_3710 ?auto_3718 ) ) ( not ( = ?auto_3710 ?auto_3716 ) ) ( not ( = ?auto_3711 ?auto_3719 ) ) ( not ( = ?auto_3711 ?auto_3715 ) ) ( not ( = ?auto_3714 ?auto_3717 ) ) ( not ( = ?auto_3714 ?auto_3721 ) ) ( not ( = ?auto_3714 ?auto_3720 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_3704 ?auto_3705 ?auto_3706 ?auto_3707 )
      ( MAKE-1CRATE ?auto_3707 ?auto_3708 )
      ( MAKE-4CRATE-VERIFY ?auto_3704 ?auto_3705 ?auto_3706 ?auto_3707 ?auto_3708 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3724 - SURFACE
      ?auto_3725 - SURFACE
    )
    :vars
    (
      ?auto_3726 - HOIST
      ?auto_3727 - PLACE
      ?auto_3729 - PLACE
      ?auto_3730 - HOIST
      ?auto_3731 - SURFACE
      ?auto_3728 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3726 ?auto_3727 ) ( SURFACE-AT ?auto_3724 ?auto_3727 ) ( CLEAR ?auto_3724 ) ( IS-CRATE ?auto_3725 ) ( AVAILABLE ?auto_3726 ) ( not ( = ?auto_3729 ?auto_3727 ) ) ( HOIST-AT ?auto_3730 ?auto_3729 ) ( AVAILABLE ?auto_3730 ) ( SURFACE-AT ?auto_3725 ?auto_3729 ) ( ON ?auto_3725 ?auto_3731 ) ( CLEAR ?auto_3725 ) ( TRUCK-AT ?auto_3728 ?auto_3727 ) ( not ( = ?auto_3724 ?auto_3725 ) ) ( not ( = ?auto_3724 ?auto_3731 ) ) ( not ( = ?auto_3725 ?auto_3731 ) ) ( not ( = ?auto_3726 ?auto_3730 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3728 ?auto_3727 ?auto_3729 )
      ( !LIFT ?auto_3730 ?auto_3725 ?auto_3731 ?auto_3729 )
      ( !LOAD ?auto_3730 ?auto_3725 ?auto_3728 ?auto_3729 )
      ( !DRIVE ?auto_3728 ?auto_3729 ?auto_3727 )
      ( !UNLOAD ?auto_3726 ?auto_3725 ?auto_3728 ?auto_3727 )
      ( !DROP ?auto_3726 ?auto_3725 ?auto_3724 ?auto_3727 )
      ( MAKE-1CRATE-VERIFY ?auto_3724 ?auto_3725 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_3738 - SURFACE
      ?auto_3739 - SURFACE
      ?auto_3740 - SURFACE
      ?auto_3741 - SURFACE
      ?auto_3742 - SURFACE
      ?auto_3743 - SURFACE
    )
    :vars
    (
      ?auto_3747 - HOIST
      ?auto_3744 - PLACE
      ?auto_3745 - PLACE
      ?auto_3749 - HOIST
      ?auto_3748 - SURFACE
      ?auto_3752 - SURFACE
      ?auto_3756 - PLACE
      ?auto_3757 - HOIST
      ?auto_3754 - SURFACE
      ?auto_3755 - PLACE
      ?auto_3753 - HOIST
      ?auto_3750 - SURFACE
      ?auto_3751 - SURFACE
      ?auto_3746 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3747 ?auto_3744 ) ( IS-CRATE ?auto_3743 ) ( not ( = ?auto_3745 ?auto_3744 ) ) ( HOIST-AT ?auto_3749 ?auto_3745 ) ( SURFACE-AT ?auto_3743 ?auto_3745 ) ( ON ?auto_3743 ?auto_3748 ) ( CLEAR ?auto_3743 ) ( not ( = ?auto_3742 ?auto_3743 ) ) ( not ( = ?auto_3742 ?auto_3748 ) ) ( not ( = ?auto_3743 ?auto_3748 ) ) ( not ( = ?auto_3747 ?auto_3749 ) ) ( IS-CRATE ?auto_3742 ) ( AVAILABLE ?auto_3749 ) ( SURFACE-AT ?auto_3742 ?auto_3745 ) ( ON ?auto_3742 ?auto_3752 ) ( CLEAR ?auto_3742 ) ( not ( = ?auto_3741 ?auto_3742 ) ) ( not ( = ?auto_3741 ?auto_3752 ) ) ( not ( = ?auto_3742 ?auto_3752 ) ) ( IS-CRATE ?auto_3741 ) ( not ( = ?auto_3756 ?auto_3744 ) ) ( HOIST-AT ?auto_3757 ?auto_3756 ) ( AVAILABLE ?auto_3757 ) ( SURFACE-AT ?auto_3741 ?auto_3756 ) ( ON ?auto_3741 ?auto_3754 ) ( CLEAR ?auto_3741 ) ( not ( = ?auto_3740 ?auto_3741 ) ) ( not ( = ?auto_3740 ?auto_3754 ) ) ( not ( = ?auto_3741 ?auto_3754 ) ) ( not ( = ?auto_3747 ?auto_3757 ) ) ( IS-CRATE ?auto_3740 ) ( not ( = ?auto_3755 ?auto_3744 ) ) ( HOIST-AT ?auto_3753 ?auto_3755 ) ( SURFACE-AT ?auto_3740 ?auto_3755 ) ( ON ?auto_3740 ?auto_3750 ) ( CLEAR ?auto_3740 ) ( not ( = ?auto_3739 ?auto_3740 ) ) ( not ( = ?auto_3739 ?auto_3750 ) ) ( not ( = ?auto_3740 ?auto_3750 ) ) ( not ( = ?auto_3747 ?auto_3753 ) ) ( SURFACE-AT ?auto_3738 ?auto_3744 ) ( CLEAR ?auto_3738 ) ( IS-CRATE ?auto_3739 ) ( AVAILABLE ?auto_3747 ) ( AVAILABLE ?auto_3753 ) ( SURFACE-AT ?auto_3739 ?auto_3755 ) ( ON ?auto_3739 ?auto_3751 ) ( CLEAR ?auto_3739 ) ( TRUCK-AT ?auto_3746 ?auto_3744 ) ( not ( = ?auto_3738 ?auto_3739 ) ) ( not ( = ?auto_3738 ?auto_3751 ) ) ( not ( = ?auto_3739 ?auto_3751 ) ) ( not ( = ?auto_3738 ?auto_3740 ) ) ( not ( = ?auto_3738 ?auto_3750 ) ) ( not ( = ?auto_3740 ?auto_3751 ) ) ( not ( = ?auto_3750 ?auto_3751 ) ) ( not ( = ?auto_3738 ?auto_3741 ) ) ( not ( = ?auto_3738 ?auto_3754 ) ) ( not ( = ?auto_3739 ?auto_3741 ) ) ( not ( = ?auto_3739 ?auto_3754 ) ) ( not ( = ?auto_3741 ?auto_3750 ) ) ( not ( = ?auto_3741 ?auto_3751 ) ) ( not ( = ?auto_3756 ?auto_3755 ) ) ( not ( = ?auto_3757 ?auto_3753 ) ) ( not ( = ?auto_3754 ?auto_3750 ) ) ( not ( = ?auto_3754 ?auto_3751 ) ) ( not ( = ?auto_3738 ?auto_3742 ) ) ( not ( = ?auto_3738 ?auto_3752 ) ) ( not ( = ?auto_3739 ?auto_3742 ) ) ( not ( = ?auto_3739 ?auto_3752 ) ) ( not ( = ?auto_3740 ?auto_3742 ) ) ( not ( = ?auto_3740 ?auto_3752 ) ) ( not ( = ?auto_3742 ?auto_3754 ) ) ( not ( = ?auto_3742 ?auto_3750 ) ) ( not ( = ?auto_3742 ?auto_3751 ) ) ( not ( = ?auto_3745 ?auto_3756 ) ) ( not ( = ?auto_3745 ?auto_3755 ) ) ( not ( = ?auto_3749 ?auto_3757 ) ) ( not ( = ?auto_3749 ?auto_3753 ) ) ( not ( = ?auto_3752 ?auto_3754 ) ) ( not ( = ?auto_3752 ?auto_3750 ) ) ( not ( = ?auto_3752 ?auto_3751 ) ) ( not ( = ?auto_3738 ?auto_3743 ) ) ( not ( = ?auto_3738 ?auto_3748 ) ) ( not ( = ?auto_3739 ?auto_3743 ) ) ( not ( = ?auto_3739 ?auto_3748 ) ) ( not ( = ?auto_3740 ?auto_3743 ) ) ( not ( = ?auto_3740 ?auto_3748 ) ) ( not ( = ?auto_3741 ?auto_3743 ) ) ( not ( = ?auto_3741 ?auto_3748 ) ) ( not ( = ?auto_3743 ?auto_3752 ) ) ( not ( = ?auto_3743 ?auto_3754 ) ) ( not ( = ?auto_3743 ?auto_3750 ) ) ( not ( = ?auto_3743 ?auto_3751 ) ) ( not ( = ?auto_3748 ?auto_3752 ) ) ( not ( = ?auto_3748 ?auto_3754 ) ) ( not ( = ?auto_3748 ?auto_3750 ) ) ( not ( = ?auto_3748 ?auto_3751 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_3738 ?auto_3739 ?auto_3740 ?auto_3741 ?auto_3742 )
      ( MAKE-1CRATE ?auto_3742 ?auto_3743 )
      ( MAKE-5CRATE-VERIFY ?auto_3738 ?auto_3739 ?auto_3740 ?auto_3741 ?auto_3742 ?auto_3743 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3760 - SURFACE
      ?auto_3761 - SURFACE
    )
    :vars
    (
      ?auto_3762 - HOIST
      ?auto_3763 - PLACE
      ?auto_3765 - PLACE
      ?auto_3766 - HOIST
      ?auto_3767 - SURFACE
      ?auto_3764 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3762 ?auto_3763 ) ( SURFACE-AT ?auto_3760 ?auto_3763 ) ( CLEAR ?auto_3760 ) ( IS-CRATE ?auto_3761 ) ( AVAILABLE ?auto_3762 ) ( not ( = ?auto_3765 ?auto_3763 ) ) ( HOIST-AT ?auto_3766 ?auto_3765 ) ( AVAILABLE ?auto_3766 ) ( SURFACE-AT ?auto_3761 ?auto_3765 ) ( ON ?auto_3761 ?auto_3767 ) ( CLEAR ?auto_3761 ) ( TRUCK-AT ?auto_3764 ?auto_3763 ) ( not ( = ?auto_3760 ?auto_3761 ) ) ( not ( = ?auto_3760 ?auto_3767 ) ) ( not ( = ?auto_3761 ?auto_3767 ) ) ( not ( = ?auto_3762 ?auto_3766 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3764 ?auto_3763 ?auto_3765 )
      ( !LIFT ?auto_3766 ?auto_3761 ?auto_3767 ?auto_3765 )
      ( !LOAD ?auto_3766 ?auto_3761 ?auto_3764 ?auto_3765 )
      ( !DRIVE ?auto_3764 ?auto_3765 ?auto_3763 )
      ( !UNLOAD ?auto_3762 ?auto_3761 ?auto_3764 ?auto_3763 )
      ( !DROP ?auto_3762 ?auto_3761 ?auto_3760 ?auto_3763 )
      ( MAKE-1CRATE-VERIFY ?auto_3760 ?auto_3761 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_3775 - SURFACE
      ?auto_3776 - SURFACE
      ?auto_3777 - SURFACE
      ?auto_3778 - SURFACE
      ?auto_3779 - SURFACE
      ?auto_3781 - SURFACE
      ?auto_3780 - SURFACE
    )
    :vars
    (
      ?auto_3786 - HOIST
      ?auto_3785 - PLACE
      ?auto_3787 - PLACE
      ?auto_3783 - HOIST
      ?auto_3784 - SURFACE
      ?auto_3792 - PLACE
      ?auto_3798 - HOIST
      ?auto_3790 - SURFACE
      ?auto_3793 - SURFACE
      ?auto_3791 - PLACE
      ?auto_3788 - HOIST
      ?auto_3796 - SURFACE
      ?auto_3789 - PLACE
      ?auto_3794 - HOIST
      ?auto_3795 - SURFACE
      ?auto_3797 - SURFACE
      ?auto_3782 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3786 ?auto_3785 ) ( IS-CRATE ?auto_3780 ) ( not ( = ?auto_3787 ?auto_3785 ) ) ( HOIST-AT ?auto_3783 ?auto_3787 ) ( AVAILABLE ?auto_3783 ) ( SURFACE-AT ?auto_3780 ?auto_3787 ) ( ON ?auto_3780 ?auto_3784 ) ( CLEAR ?auto_3780 ) ( not ( = ?auto_3781 ?auto_3780 ) ) ( not ( = ?auto_3781 ?auto_3784 ) ) ( not ( = ?auto_3780 ?auto_3784 ) ) ( not ( = ?auto_3786 ?auto_3783 ) ) ( IS-CRATE ?auto_3781 ) ( not ( = ?auto_3792 ?auto_3785 ) ) ( HOIST-AT ?auto_3798 ?auto_3792 ) ( SURFACE-AT ?auto_3781 ?auto_3792 ) ( ON ?auto_3781 ?auto_3790 ) ( CLEAR ?auto_3781 ) ( not ( = ?auto_3779 ?auto_3781 ) ) ( not ( = ?auto_3779 ?auto_3790 ) ) ( not ( = ?auto_3781 ?auto_3790 ) ) ( not ( = ?auto_3786 ?auto_3798 ) ) ( IS-CRATE ?auto_3779 ) ( AVAILABLE ?auto_3798 ) ( SURFACE-AT ?auto_3779 ?auto_3792 ) ( ON ?auto_3779 ?auto_3793 ) ( CLEAR ?auto_3779 ) ( not ( = ?auto_3778 ?auto_3779 ) ) ( not ( = ?auto_3778 ?auto_3793 ) ) ( not ( = ?auto_3779 ?auto_3793 ) ) ( IS-CRATE ?auto_3778 ) ( not ( = ?auto_3791 ?auto_3785 ) ) ( HOIST-AT ?auto_3788 ?auto_3791 ) ( AVAILABLE ?auto_3788 ) ( SURFACE-AT ?auto_3778 ?auto_3791 ) ( ON ?auto_3778 ?auto_3796 ) ( CLEAR ?auto_3778 ) ( not ( = ?auto_3777 ?auto_3778 ) ) ( not ( = ?auto_3777 ?auto_3796 ) ) ( not ( = ?auto_3778 ?auto_3796 ) ) ( not ( = ?auto_3786 ?auto_3788 ) ) ( IS-CRATE ?auto_3777 ) ( not ( = ?auto_3789 ?auto_3785 ) ) ( HOIST-AT ?auto_3794 ?auto_3789 ) ( SURFACE-AT ?auto_3777 ?auto_3789 ) ( ON ?auto_3777 ?auto_3795 ) ( CLEAR ?auto_3777 ) ( not ( = ?auto_3776 ?auto_3777 ) ) ( not ( = ?auto_3776 ?auto_3795 ) ) ( not ( = ?auto_3777 ?auto_3795 ) ) ( not ( = ?auto_3786 ?auto_3794 ) ) ( SURFACE-AT ?auto_3775 ?auto_3785 ) ( CLEAR ?auto_3775 ) ( IS-CRATE ?auto_3776 ) ( AVAILABLE ?auto_3786 ) ( AVAILABLE ?auto_3794 ) ( SURFACE-AT ?auto_3776 ?auto_3789 ) ( ON ?auto_3776 ?auto_3797 ) ( CLEAR ?auto_3776 ) ( TRUCK-AT ?auto_3782 ?auto_3785 ) ( not ( = ?auto_3775 ?auto_3776 ) ) ( not ( = ?auto_3775 ?auto_3797 ) ) ( not ( = ?auto_3776 ?auto_3797 ) ) ( not ( = ?auto_3775 ?auto_3777 ) ) ( not ( = ?auto_3775 ?auto_3795 ) ) ( not ( = ?auto_3777 ?auto_3797 ) ) ( not ( = ?auto_3795 ?auto_3797 ) ) ( not ( = ?auto_3775 ?auto_3778 ) ) ( not ( = ?auto_3775 ?auto_3796 ) ) ( not ( = ?auto_3776 ?auto_3778 ) ) ( not ( = ?auto_3776 ?auto_3796 ) ) ( not ( = ?auto_3778 ?auto_3795 ) ) ( not ( = ?auto_3778 ?auto_3797 ) ) ( not ( = ?auto_3791 ?auto_3789 ) ) ( not ( = ?auto_3788 ?auto_3794 ) ) ( not ( = ?auto_3796 ?auto_3795 ) ) ( not ( = ?auto_3796 ?auto_3797 ) ) ( not ( = ?auto_3775 ?auto_3779 ) ) ( not ( = ?auto_3775 ?auto_3793 ) ) ( not ( = ?auto_3776 ?auto_3779 ) ) ( not ( = ?auto_3776 ?auto_3793 ) ) ( not ( = ?auto_3777 ?auto_3779 ) ) ( not ( = ?auto_3777 ?auto_3793 ) ) ( not ( = ?auto_3779 ?auto_3796 ) ) ( not ( = ?auto_3779 ?auto_3795 ) ) ( not ( = ?auto_3779 ?auto_3797 ) ) ( not ( = ?auto_3792 ?auto_3791 ) ) ( not ( = ?auto_3792 ?auto_3789 ) ) ( not ( = ?auto_3798 ?auto_3788 ) ) ( not ( = ?auto_3798 ?auto_3794 ) ) ( not ( = ?auto_3793 ?auto_3796 ) ) ( not ( = ?auto_3793 ?auto_3795 ) ) ( not ( = ?auto_3793 ?auto_3797 ) ) ( not ( = ?auto_3775 ?auto_3781 ) ) ( not ( = ?auto_3775 ?auto_3790 ) ) ( not ( = ?auto_3776 ?auto_3781 ) ) ( not ( = ?auto_3776 ?auto_3790 ) ) ( not ( = ?auto_3777 ?auto_3781 ) ) ( not ( = ?auto_3777 ?auto_3790 ) ) ( not ( = ?auto_3778 ?auto_3781 ) ) ( not ( = ?auto_3778 ?auto_3790 ) ) ( not ( = ?auto_3781 ?auto_3793 ) ) ( not ( = ?auto_3781 ?auto_3796 ) ) ( not ( = ?auto_3781 ?auto_3795 ) ) ( not ( = ?auto_3781 ?auto_3797 ) ) ( not ( = ?auto_3790 ?auto_3793 ) ) ( not ( = ?auto_3790 ?auto_3796 ) ) ( not ( = ?auto_3790 ?auto_3795 ) ) ( not ( = ?auto_3790 ?auto_3797 ) ) ( not ( = ?auto_3775 ?auto_3780 ) ) ( not ( = ?auto_3775 ?auto_3784 ) ) ( not ( = ?auto_3776 ?auto_3780 ) ) ( not ( = ?auto_3776 ?auto_3784 ) ) ( not ( = ?auto_3777 ?auto_3780 ) ) ( not ( = ?auto_3777 ?auto_3784 ) ) ( not ( = ?auto_3778 ?auto_3780 ) ) ( not ( = ?auto_3778 ?auto_3784 ) ) ( not ( = ?auto_3779 ?auto_3780 ) ) ( not ( = ?auto_3779 ?auto_3784 ) ) ( not ( = ?auto_3780 ?auto_3790 ) ) ( not ( = ?auto_3780 ?auto_3793 ) ) ( not ( = ?auto_3780 ?auto_3796 ) ) ( not ( = ?auto_3780 ?auto_3795 ) ) ( not ( = ?auto_3780 ?auto_3797 ) ) ( not ( = ?auto_3787 ?auto_3792 ) ) ( not ( = ?auto_3787 ?auto_3791 ) ) ( not ( = ?auto_3787 ?auto_3789 ) ) ( not ( = ?auto_3783 ?auto_3798 ) ) ( not ( = ?auto_3783 ?auto_3788 ) ) ( not ( = ?auto_3783 ?auto_3794 ) ) ( not ( = ?auto_3784 ?auto_3790 ) ) ( not ( = ?auto_3784 ?auto_3793 ) ) ( not ( = ?auto_3784 ?auto_3796 ) ) ( not ( = ?auto_3784 ?auto_3795 ) ) ( not ( = ?auto_3784 ?auto_3797 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_3775 ?auto_3776 ?auto_3777 ?auto_3778 ?auto_3779 ?auto_3781 )
      ( MAKE-1CRATE ?auto_3781 ?auto_3780 )
      ( MAKE-6CRATE-VERIFY ?auto_3775 ?auto_3776 ?auto_3777 ?auto_3778 ?auto_3779 ?auto_3781 ?auto_3780 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3801 - SURFACE
      ?auto_3802 - SURFACE
    )
    :vars
    (
      ?auto_3803 - HOIST
      ?auto_3804 - PLACE
      ?auto_3806 - PLACE
      ?auto_3807 - HOIST
      ?auto_3808 - SURFACE
      ?auto_3805 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3803 ?auto_3804 ) ( SURFACE-AT ?auto_3801 ?auto_3804 ) ( CLEAR ?auto_3801 ) ( IS-CRATE ?auto_3802 ) ( AVAILABLE ?auto_3803 ) ( not ( = ?auto_3806 ?auto_3804 ) ) ( HOIST-AT ?auto_3807 ?auto_3806 ) ( AVAILABLE ?auto_3807 ) ( SURFACE-AT ?auto_3802 ?auto_3806 ) ( ON ?auto_3802 ?auto_3808 ) ( CLEAR ?auto_3802 ) ( TRUCK-AT ?auto_3805 ?auto_3804 ) ( not ( = ?auto_3801 ?auto_3802 ) ) ( not ( = ?auto_3801 ?auto_3808 ) ) ( not ( = ?auto_3802 ?auto_3808 ) ) ( not ( = ?auto_3803 ?auto_3807 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3805 ?auto_3804 ?auto_3806 )
      ( !LIFT ?auto_3807 ?auto_3802 ?auto_3808 ?auto_3806 )
      ( !LOAD ?auto_3807 ?auto_3802 ?auto_3805 ?auto_3806 )
      ( !DRIVE ?auto_3805 ?auto_3806 ?auto_3804 )
      ( !UNLOAD ?auto_3803 ?auto_3802 ?auto_3805 ?auto_3804 )
      ( !DROP ?auto_3803 ?auto_3802 ?auto_3801 ?auto_3804 )
      ( MAKE-1CRATE-VERIFY ?auto_3801 ?auto_3802 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_3817 - SURFACE
      ?auto_3818 - SURFACE
      ?auto_3819 - SURFACE
      ?auto_3820 - SURFACE
      ?auto_3821 - SURFACE
      ?auto_3823 - SURFACE
      ?auto_3822 - SURFACE
      ?auto_3824 - SURFACE
    )
    :vars
    (
      ?auto_3829 - HOIST
      ?auto_3830 - PLACE
      ?auto_3828 - PLACE
      ?auto_3827 - HOIST
      ?auto_3826 - SURFACE
      ?auto_3841 - PLACE
      ?auto_3840 - HOIST
      ?auto_3832 - SURFACE
      ?auto_3839 - PLACE
      ?auto_3834 - HOIST
      ?auto_3842 - SURFACE
      ?auto_3838 - SURFACE
      ?auto_3831 - PLACE
      ?auto_3844 - HOIST
      ?auto_3833 - SURFACE
      ?auto_3843 - PLACE
      ?auto_3837 - HOIST
      ?auto_3836 - SURFACE
      ?auto_3835 - SURFACE
      ?auto_3825 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3829 ?auto_3830 ) ( IS-CRATE ?auto_3824 ) ( not ( = ?auto_3828 ?auto_3830 ) ) ( HOIST-AT ?auto_3827 ?auto_3828 ) ( AVAILABLE ?auto_3827 ) ( SURFACE-AT ?auto_3824 ?auto_3828 ) ( ON ?auto_3824 ?auto_3826 ) ( CLEAR ?auto_3824 ) ( not ( = ?auto_3822 ?auto_3824 ) ) ( not ( = ?auto_3822 ?auto_3826 ) ) ( not ( = ?auto_3824 ?auto_3826 ) ) ( not ( = ?auto_3829 ?auto_3827 ) ) ( IS-CRATE ?auto_3822 ) ( not ( = ?auto_3841 ?auto_3830 ) ) ( HOIST-AT ?auto_3840 ?auto_3841 ) ( AVAILABLE ?auto_3840 ) ( SURFACE-AT ?auto_3822 ?auto_3841 ) ( ON ?auto_3822 ?auto_3832 ) ( CLEAR ?auto_3822 ) ( not ( = ?auto_3823 ?auto_3822 ) ) ( not ( = ?auto_3823 ?auto_3832 ) ) ( not ( = ?auto_3822 ?auto_3832 ) ) ( not ( = ?auto_3829 ?auto_3840 ) ) ( IS-CRATE ?auto_3823 ) ( not ( = ?auto_3839 ?auto_3830 ) ) ( HOIST-AT ?auto_3834 ?auto_3839 ) ( SURFACE-AT ?auto_3823 ?auto_3839 ) ( ON ?auto_3823 ?auto_3842 ) ( CLEAR ?auto_3823 ) ( not ( = ?auto_3821 ?auto_3823 ) ) ( not ( = ?auto_3821 ?auto_3842 ) ) ( not ( = ?auto_3823 ?auto_3842 ) ) ( not ( = ?auto_3829 ?auto_3834 ) ) ( IS-CRATE ?auto_3821 ) ( AVAILABLE ?auto_3834 ) ( SURFACE-AT ?auto_3821 ?auto_3839 ) ( ON ?auto_3821 ?auto_3838 ) ( CLEAR ?auto_3821 ) ( not ( = ?auto_3820 ?auto_3821 ) ) ( not ( = ?auto_3820 ?auto_3838 ) ) ( not ( = ?auto_3821 ?auto_3838 ) ) ( IS-CRATE ?auto_3820 ) ( not ( = ?auto_3831 ?auto_3830 ) ) ( HOIST-AT ?auto_3844 ?auto_3831 ) ( AVAILABLE ?auto_3844 ) ( SURFACE-AT ?auto_3820 ?auto_3831 ) ( ON ?auto_3820 ?auto_3833 ) ( CLEAR ?auto_3820 ) ( not ( = ?auto_3819 ?auto_3820 ) ) ( not ( = ?auto_3819 ?auto_3833 ) ) ( not ( = ?auto_3820 ?auto_3833 ) ) ( not ( = ?auto_3829 ?auto_3844 ) ) ( IS-CRATE ?auto_3819 ) ( not ( = ?auto_3843 ?auto_3830 ) ) ( HOIST-AT ?auto_3837 ?auto_3843 ) ( SURFACE-AT ?auto_3819 ?auto_3843 ) ( ON ?auto_3819 ?auto_3836 ) ( CLEAR ?auto_3819 ) ( not ( = ?auto_3818 ?auto_3819 ) ) ( not ( = ?auto_3818 ?auto_3836 ) ) ( not ( = ?auto_3819 ?auto_3836 ) ) ( not ( = ?auto_3829 ?auto_3837 ) ) ( SURFACE-AT ?auto_3817 ?auto_3830 ) ( CLEAR ?auto_3817 ) ( IS-CRATE ?auto_3818 ) ( AVAILABLE ?auto_3829 ) ( AVAILABLE ?auto_3837 ) ( SURFACE-AT ?auto_3818 ?auto_3843 ) ( ON ?auto_3818 ?auto_3835 ) ( CLEAR ?auto_3818 ) ( TRUCK-AT ?auto_3825 ?auto_3830 ) ( not ( = ?auto_3817 ?auto_3818 ) ) ( not ( = ?auto_3817 ?auto_3835 ) ) ( not ( = ?auto_3818 ?auto_3835 ) ) ( not ( = ?auto_3817 ?auto_3819 ) ) ( not ( = ?auto_3817 ?auto_3836 ) ) ( not ( = ?auto_3819 ?auto_3835 ) ) ( not ( = ?auto_3836 ?auto_3835 ) ) ( not ( = ?auto_3817 ?auto_3820 ) ) ( not ( = ?auto_3817 ?auto_3833 ) ) ( not ( = ?auto_3818 ?auto_3820 ) ) ( not ( = ?auto_3818 ?auto_3833 ) ) ( not ( = ?auto_3820 ?auto_3836 ) ) ( not ( = ?auto_3820 ?auto_3835 ) ) ( not ( = ?auto_3831 ?auto_3843 ) ) ( not ( = ?auto_3844 ?auto_3837 ) ) ( not ( = ?auto_3833 ?auto_3836 ) ) ( not ( = ?auto_3833 ?auto_3835 ) ) ( not ( = ?auto_3817 ?auto_3821 ) ) ( not ( = ?auto_3817 ?auto_3838 ) ) ( not ( = ?auto_3818 ?auto_3821 ) ) ( not ( = ?auto_3818 ?auto_3838 ) ) ( not ( = ?auto_3819 ?auto_3821 ) ) ( not ( = ?auto_3819 ?auto_3838 ) ) ( not ( = ?auto_3821 ?auto_3833 ) ) ( not ( = ?auto_3821 ?auto_3836 ) ) ( not ( = ?auto_3821 ?auto_3835 ) ) ( not ( = ?auto_3839 ?auto_3831 ) ) ( not ( = ?auto_3839 ?auto_3843 ) ) ( not ( = ?auto_3834 ?auto_3844 ) ) ( not ( = ?auto_3834 ?auto_3837 ) ) ( not ( = ?auto_3838 ?auto_3833 ) ) ( not ( = ?auto_3838 ?auto_3836 ) ) ( not ( = ?auto_3838 ?auto_3835 ) ) ( not ( = ?auto_3817 ?auto_3823 ) ) ( not ( = ?auto_3817 ?auto_3842 ) ) ( not ( = ?auto_3818 ?auto_3823 ) ) ( not ( = ?auto_3818 ?auto_3842 ) ) ( not ( = ?auto_3819 ?auto_3823 ) ) ( not ( = ?auto_3819 ?auto_3842 ) ) ( not ( = ?auto_3820 ?auto_3823 ) ) ( not ( = ?auto_3820 ?auto_3842 ) ) ( not ( = ?auto_3823 ?auto_3838 ) ) ( not ( = ?auto_3823 ?auto_3833 ) ) ( not ( = ?auto_3823 ?auto_3836 ) ) ( not ( = ?auto_3823 ?auto_3835 ) ) ( not ( = ?auto_3842 ?auto_3838 ) ) ( not ( = ?auto_3842 ?auto_3833 ) ) ( not ( = ?auto_3842 ?auto_3836 ) ) ( not ( = ?auto_3842 ?auto_3835 ) ) ( not ( = ?auto_3817 ?auto_3822 ) ) ( not ( = ?auto_3817 ?auto_3832 ) ) ( not ( = ?auto_3818 ?auto_3822 ) ) ( not ( = ?auto_3818 ?auto_3832 ) ) ( not ( = ?auto_3819 ?auto_3822 ) ) ( not ( = ?auto_3819 ?auto_3832 ) ) ( not ( = ?auto_3820 ?auto_3822 ) ) ( not ( = ?auto_3820 ?auto_3832 ) ) ( not ( = ?auto_3821 ?auto_3822 ) ) ( not ( = ?auto_3821 ?auto_3832 ) ) ( not ( = ?auto_3822 ?auto_3842 ) ) ( not ( = ?auto_3822 ?auto_3838 ) ) ( not ( = ?auto_3822 ?auto_3833 ) ) ( not ( = ?auto_3822 ?auto_3836 ) ) ( not ( = ?auto_3822 ?auto_3835 ) ) ( not ( = ?auto_3841 ?auto_3839 ) ) ( not ( = ?auto_3841 ?auto_3831 ) ) ( not ( = ?auto_3841 ?auto_3843 ) ) ( not ( = ?auto_3840 ?auto_3834 ) ) ( not ( = ?auto_3840 ?auto_3844 ) ) ( not ( = ?auto_3840 ?auto_3837 ) ) ( not ( = ?auto_3832 ?auto_3842 ) ) ( not ( = ?auto_3832 ?auto_3838 ) ) ( not ( = ?auto_3832 ?auto_3833 ) ) ( not ( = ?auto_3832 ?auto_3836 ) ) ( not ( = ?auto_3832 ?auto_3835 ) ) ( not ( = ?auto_3817 ?auto_3824 ) ) ( not ( = ?auto_3817 ?auto_3826 ) ) ( not ( = ?auto_3818 ?auto_3824 ) ) ( not ( = ?auto_3818 ?auto_3826 ) ) ( not ( = ?auto_3819 ?auto_3824 ) ) ( not ( = ?auto_3819 ?auto_3826 ) ) ( not ( = ?auto_3820 ?auto_3824 ) ) ( not ( = ?auto_3820 ?auto_3826 ) ) ( not ( = ?auto_3821 ?auto_3824 ) ) ( not ( = ?auto_3821 ?auto_3826 ) ) ( not ( = ?auto_3823 ?auto_3824 ) ) ( not ( = ?auto_3823 ?auto_3826 ) ) ( not ( = ?auto_3824 ?auto_3832 ) ) ( not ( = ?auto_3824 ?auto_3842 ) ) ( not ( = ?auto_3824 ?auto_3838 ) ) ( not ( = ?auto_3824 ?auto_3833 ) ) ( not ( = ?auto_3824 ?auto_3836 ) ) ( not ( = ?auto_3824 ?auto_3835 ) ) ( not ( = ?auto_3828 ?auto_3841 ) ) ( not ( = ?auto_3828 ?auto_3839 ) ) ( not ( = ?auto_3828 ?auto_3831 ) ) ( not ( = ?auto_3828 ?auto_3843 ) ) ( not ( = ?auto_3827 ?auto_3840 ) ) ( not ( = ?auto_3827 ?auto_3834 ) ) ( not ( = ?auto_3827 ?auto_3844 ) ) ( not ( = ?auto_3827 ?auto_3837 ) ) ( not ( = ?auto_3826 ?auto_3832 ) ) ( not ( = ?auto_3826 ?auto_3842 ) ) ( not ( = ?auto_3826 ?auto_3838 ) ) ( not ( = ?auto_3826 ?auto_3833 ) ) ( not ( = ?auto_3826 ?auto_3836 ) ) ( not ( = ?auto_3826 ?auto_3835 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_3817 ?auto_3818 ?auto_3819 ?auto_3820 ?auto_3821 ?auto_3823 ?auto_3822 )
      ( MAKE-1CRATE ?auto_3822 ?auto_3824 )
      ( MAKE-7CRATE-VERIFY ?auto_3817 ?auto_3818 ?auto_3819 ?auto_3820 ?auto_3821 ?auto_3823 ?auto_3822 ?auto_3824 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3847 - SURFACE
      ?auto_3848 - SURFACE
    )
    :vars
    (
      ?auto_3849 - HOIST
      ?auto_3850 - PLACE
      ?auto_3852 - PLACE
      ?auto_3853 - HOIST
      ?auto_3854 - SURFACE
      ?auto_3851 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3849 ?auto_3850 ) ( SURFACE-AT ?auto_3847 ?auto_3850 ) ( CLEAR ?auto_3847 ) ( IS-CRATE ?auto_3848 ) ( AVAILABLE ?auto_3849 ) ( not ( = ?auto_3852 ?auto_3850 ) ) ( HOIST-AT ?auto_3853 ?auto_3852 ) ( AVAILABLE ?auto_3853 ) ( SURFACE-AT ?auto_3848 ?auto_3852 ) ( ON ?auto_3848 ?auto_3854 ) ( CLEAR ?auto_3848 ) ( TRUCK-AT ?auto_3851 ?auto_3850 ) ( not ( = ?auto_3847 ?auto_3848 ) ) ( not ( = ?auto_3847 ?auto_3854 ) ) ( not ( = ?auto_3848 ?auto_3854 ) ) ( not ( = ?auto_3849 ?auto_3853 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3851 ?auto_3850 ?auto_3852 )
      ( !LIFT ?auto_3853 ?auto_3848 ?auto_3854 ?auto_3852 )
      ( !LOAD ?auto_3853 ?auto_3848 ?auto_3851 ?auto_3852 )
      ( !DRIVE ?auto_3851 ?auto_3852 ?auto_3850 )
      ( !UNLOAD ?auto_3849 ?auto_3848 ?auto_3851 ?auto_3850 )
      ( !DROP ?auto_3849 ?auto_3848 ?auto_3847 ?auto_3850 )
      ( MAKE-1CRATE-VERIFY ?auto_3847 ?auto_3848 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_3864 - SURFACE
      ?auto_3865 - SURFACE
      ?auto_3866 - SURFACE
      ?auto_3867 - SURFACE
      ?auto_3868 - SURFACE
      ?auto_3870 - SURFACE
      ?auto_3869 - SURFACE
      ?auto_3872 - SURFACE
      ?auto_3871 - SURFACE
    )
    :vars
    (
      ?auto_3874 - HOIST
      ?auto_3876 - PLACE
      ?auto_3877 - PLACE
      ?auto_3875 - HOIST
      ?auto_3873 - SURFACE
      ?auto_3879 - PLACE
      ?auto_3881 - HOIST
      ?auto_3880 - SURFACE
      ?auto_3886 - PLACE
      ?auto_3887 - HOIST
      ?auto_3883 - SURFACE
      ?auto_3885 - PLACE
      ?auto_3882 - HOIST
      ?auto_3888 - SURFACE
      ?auto_3890 - SURFACE
      ?auto_3884 - SURFACE
      ?auto_3889 - PLACE
      ?auto_3891 - HOIST
      ?auto_3892 - SURFACE
      ?auto_3893 - SURFACE
      ?auto_3878 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3874 ?auto_3876 ) ( IS-CRATE ?auto_3871 ) ( not ( = ?auto_3877 ?auto_3876 ) ) ( HOIST-AT ?auto_3875 ?auto_3877 ) ( SURFACE-AT ?auto_3871 ?auto_3877 ) ( ON ?auto_3871 ?auto_3873 ) ( CLEAR ?auto_3871 ) ( not ( = ?auto_3872 ?auto_3871 ) ) ( not ( = ?auto_3872 ?auto_3873 ) ) ( not ( = ?auto_3871 ?auto_3873 ) ) ( not ( = ?auto_3874 ?auto_3875 ) ) ( IS-CRATE ?auto_3872 ) ( not ( = ?auto_3879 ?auto_3876 ) ) ( HOIST-AT ?auto_3881 ?auto_3879 ) ( AVAILABLE ?auto_3881 ) ( SURFACE-AT ?auto_3872 ?auto_3879 ) ( ON ?auto_3872 ?auto_3880 ) ( CLEAR ?auto_3872 ) ( not ( = ?auto_3869 ?auto_3872 ) ) ( not ( = ?auto_3869 ?auto_3880 ) ) ( not ( = ?auto_3872 ?auto_3880 ) ) ( not ( = ?auto_3874 ?auto_3881 ) ) ( IS-CRATE ?auto_3869 ) ( not ( = ?auto_3886 ?auto_3876 ) ) ( HOIST-AT ?auto_3887 ?auto_3886 ) ( AVAILABLE ?auto_3887 ) ( SURFACE-AT ?auto_3869 ?auto_3886 ) ( ON ?auto_3869 ?auto_3883 ) ( CLEAR ?auto_3869 ) ( not ( = ?auto_3870 ?auto_3869 ) ) ( not ( = ?auto_3870 ?auto_3883 ) ) ( not ( = ?auto_3869 ?auto_3883 ) ) ( not ( = ?auto_3874 ?auto_3887 ) ) ( IS-CRATE ?auto_3870 ) ( not ( = ?auto_3885 ?auto_3876 ) ) ( HOIST-AT ?auto_3882 ?auto_3885 ) ( SURFACE-AT ?auto_3870 ?auto_3885 ) ( ON ?auto_3870 ?auto_3888 ) ( CLEAR ?auto_3870 ) ( not ( = ?auto_3868 ?auto_3870 ) ) ( not ( = ?auto_3868 ?auto_3888 ) ) ( not ( = ?auto_3870 ?auto_3888 ) ) ( not ( = ?auto_3874 ?auto_3882 ) ) ( IS-CRATE ?auto_3868 ) ( AVAILABLE ?auto_3882 ) ( SURFACE-AT ?auto_3868 ?auto_3885 ) ( ON ?auto_3868 ?auto_3890 ) ( CLEAR ?auto_3868 ) ( not ( = ?auto_3867 ?auto_3868 ) ) ( not ( = ?auto_3867 ?auto_3890 ) ) ( not ( = ?auto_3868 ?auto_3890 ) ) ( IS-CRATE ?auto_3867 ) ( AVAILABLE ?auto_3875 ) ( SURFACE-AT ?auto_3867 ?auto_3877 ) ( ON ?auto_3867 ?auto_3884 ) ( CLEAR ?auto_3867 ) ( not ( = ?auto_3866 ?auto_3867 ) ) ( not ( = ?auto_3866 ?auto_3884 ) ) ( not ( = ?auto_3867 ?auto_3884 ) ) ( IS-CRATE ?auto_3866 ) ( not ( = ?auto_3889 ?auto_3876 ) ) ( HOIST-AT ?auto_3891 ?auto_3889 ) ( SURFACE-AT ?auto_3866 ?auto_3889 ) ( ON ?auto_3866 ?auto_3892 ) ( CLEAR ?auto_3866 ) ( not ( = ?auto_3865 ?auto_3866 ) ) ( not ( = ?auto_3865 ?auto_3892 ) ) ( not ( = ?auto_3866 ?auto_3892 ) ) ( not ( = ?auto_3874 ?auto_3891 ) ) ( SURFACE-AT ?auto_3864 ?auto_3876 ) ( CLEAR ?auto_3864 ) ( IS-CRATE ?auto_3865 ) ( AVAILABLE ?auto_3874 ) ( AVAILABLE ?auto_3891 ) ( SURFACE-AT ?auto_3865 ?auto_3889 ) ( ON ?auto_3865 ?auto_3893 ) ( CLEAR ?auto_3865 ) ( TRUCK-AT ?auto_3878 ?auto_3876 ) ( not ( = ?auto_3864 ?auto_3865 ) ) ( not ( = ?auto_3864 ?auto_3893 ) ) ( not ( = ?auto_3865 ?auto_3893 ) ) ( not ( = ?auto_3864 ?auto_3866 ) ) ( not ( = ?auto_3864 ?auto_3892 ) ) ( not ( = ?auto_3866 ?auto_3893 ) ) ( not ( = ?auto_3892 ?auto_3893 ) ) ( not ( = ?auto_3864 ?auto_3867 ) ) ( not ( = ?auto_3864 ?auto_3884 ) ) ( not ( = ?auto_3865 ?auto_3867 ) ) ( not ( = ?auto_3865 ?auto_3884 ) ) ( not ( = ?auto_3867 ?auto_3892 ) ) ( not ( = ?auto_3867 ?auto_3893 ) ) ( not ( = ?auto_3877 ?auto_3889 ) ) ( not ( = ?auto_3875 ?auto_3891 ) ) ( not ( = ?auto_3884 ?auto_3892 ) ) ( not ( = ?auto_3884 ?auto_3893 ) ) ( not ( = ?auto_3864 ?auto_3868 ) ) ( not ( = ?auto_3864 ?auto_3890 ) ) ( not ( = ?auto_3865 ?auto_3868 ) ) ( not ( = ?auto_3865 ?auto_3890 ) ) ( not ( = ?auto_3866 ?auto_3868 ) ) ( not ( = ?auto_3866 ?auto_3890 ) ) ( not ( = ?auto_3868 ?auto_3884 ) ) ( not ( = ?auto_3868 ?auto_3892 ) ) ( not ( = ?auto_3868 ?auto_3893 ) ) ( not ( = ?auto_3885 ?auto_3877 ) ) ( not ( = ?auto_3885 ?auto_3889 ) ) ( not ( = ?auto_3882 ?auto_3875 ) ) ( not ( = ?auto_3882 ?auto_3891 ) ) ( not ( = ?auto_3890 ?auto_3884 ) ) ( not ( = ?auto_3890 ?auto_3892 ) ) ( not ( = ?auto_3890 ?auto_3893 ) ) ( not ( = ?auto_3864 ?auto_3870 ) ) ( not ( = ?auto_3864 ?auto_3888 ) ) ( not ( = ?auto_3865 ?auto_3870 ) ) ( not ( = ?auto_3865 ?auto_3888 ) ) ( not ( = ?auto_3866 ?auto_3870 ) ) ( not ( = ?auto_3866 ?auto_3888 ) ) ( not ( = ?auto_3867 ?auto_3870 ) ) ( not ( = ?auto_3867 ?auto_3888 ) ) ( not ( = ?auto_3870 ?auto_3890 ) ) ( not ( = ?auto_3870 ?auto_3884 ) ) ( not ( = ?auto_3870 ?auto_3892 ) ) ( not ( = ?auto_3870 ?auto_3893 ) ) ( not ( = ?auto_3888 ?auto_3890 ) ) ( not ( = ?auto_3888 ?auto_3884 ) ) ( not ( = ?auto_3888 ?auto_3892 ) ) ( not ( = ?auto_3888 ?auto_3893 ) ) ( not ( = ?auto_3864 ?auto_3869 ) ) ( not ( = ?auto_3864 ?auto_3883 ) ) ( not ( = ?auto_3865 ?auto_3869 ) ) ( not ( = ?auto_3865 ?auto_3883 ) ) ( not ( = ?auto_3866 ?auto_3869 ) ) ( not ( = ?auto_3866 ?auto_3883 ) ) ( not ( = ?auto_3867 ?auto_3869 ) ) ( not ( = ?auto_3867 ?auto_3883 ) ) ( not ( = ?auto_3868 ?auto_3869 ) ) ( not ( = ?auto_3868 ?auto_3883 ) ) ( not ( = ?auto_3869 ?auto_3888 ) ) ( not ( = ?auto_3869 ?auto_3890 ) ) ( not ( = ?auto_3869 ?auto_3884 ) ) ( not ( = ?auto_3869 ?auto_3892 ) ) ( not ( = ?auto_3869 ?auto_3893 ) ) ( not ( = ?auto_3886 ?auto_3885 ) ) ( not ( = ?auto_3886 ?auto_3877 ) ) ( not ( = ?auto_3886 ?auto_3889 ) ) ( not ( = ?auto_3887 ?auto_3882 ) ) ( not ( = ?auto_3887 ?auto_3875 ) ) ( not ( = ?auto_3887 ?auto_3891 ) ) ( not ( = ?auto_3883 ?auto_3888 ) ) ( not ( = ?auto_3883 ?auto_3890 ) ) ( not ( = ?auto_3883 ?auto_3884 ) ) ( not ( = ?auto_3883 ?auto_3892 ) ) ( not ( = ?auto_3883 ?auto_3893 ) ) ( not ( = ?auto_3864 ?auto_3872 ) ) ( not ( = ?auto_3864 ?auto_3880 ) ) ( not ( = ?auto_3865 ?auto_3872 ) ) ( not ( = ?auto_3865 ?auto_3880 ) ) ( not ( = ?auto_3866 ?auto_3872 ) ) ( not ( = ?auto_3866 ?auto_3880 ) ) ( not ( = ?auto_3867 ?auto_3872 ) ) ( not ( = ?auto_3867 ?auto_3880 ) ) ( not ( = ?auto_3868 ?auto_3872 ) ) ( not ( = ?auto_3868 ?auto_3880 ) ) ( not ( = ?auto_3870 ?auto_3872 ) ) ( not ( = ?auto_3870 ?auto_3880 ) ) ( not ( = ?auto_3872 ?auto_3883 ) ) ( not ( = ?auto_3872 ?auto_3888 ) ) ( not ( = ?auto_3872 ?auto_3890 ) ) ( not ( = ?auto_3872 ?auto_3884 ) ) ( not ( = ?auto_3872 ?auto_3892 ) ) ( not ( = ?auto_3872 ?auto_3893 ) ) ( not ( = ?auto_3879 ?auto_3886 ) ) ( not ( = ?auto_3879 ?auto_3885 ) ) ( not ( = ?auto_3879 ?auto_3877 ) ) ( not ( = ?auto_3879 ?auto_3889 ) ) ( not ( = ?auto_3881 ?auto_3887 ) ) ( not ( = ?auto_3881 ?auto_3882 ) ) ( not ( = ?auto_3881 ?auto_3875 ) ) ( not ( = ?auto_3881 ?auto_3891 ) ) ( not ( = ?auto_3880 ?auto_3883 ) ) ( not ( = ?auto_3880 ?auto_3888 ) ) ( not ( = ?auto_3880 ?auto_3890 ) ) ( not ( = ?auto_3880 ?auto_3884 ) ) ( not ( = ?auto_3880 ?auto_3892 ) ) ( not ( = ?auto_3880 ?auto_3893 ) ) ( not ( = ?auto_3864 ?auto_3871 ) ) ( not ( = ?auto_3864 ?auto_3873 ) ) ( not ( = ?auto_3865 ?auto_3871 ) ) ( not ( = ?auto_3865 ?auto_3873 ) ) ( not ( = ?auto_3866 ?auto_3871 ) ) ( not ( = ?auto_3866 ?auto_3873 ) ) ( not ( = ?auto_3867 ?auto_3871 ) ) ( not ( = ?auto_3867 ?auto_3873 ) ) ( not ( = ?auto_3868 ?auto_3871 ) ) ( not ( = ?auto_3868 ?auto_3873 ) ) ( not ( = ?auto_3870 ?auto_3871 ) ) ( not ( = ?auto_3870 ?auto_3873 ) ) ( not ( = ?auto_3869 ?auto_3871 ) ) ( not ( = ?auto_3869 ?auto_3873 ) ) ( not ( = ?auto_3871 ?auto_3880 ) ) ( not ( = ?auto_3871 ?auto_3883 ) ) ( not ( = ?auto_3871 ?auto_3888 ) ) ( not ( = ?auto_3871 ?auto_3890 ) ) ( not ( = ?auto_3871 ?auto_3884 ) ) ( not ( = ?auto_3871 ?auto_3892 ) ) ( not ( = ?auto_3871 ?auto_3893 ) ) ( not ( = ?auto_3873 ?auto_3880 ) ) ( not ( = ?auto_3873 ?auto_3883 ) ) ( not ( = ?auto_3873 ?auto_3888 ) ) ( not ( = ?auto_3873 ?auto_3890 ) ) ( not ( = ?auto_3873 ?auto_3884 ) ) ( not ( = ?auto_3873 ?auto_3892 ) ) ( not ( = ?auto_3873 ?auto_3893 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_3864 ?auto_3865 ?auto_3866 ?auto_3867 ?auto_3868 ?auto_3870 ?auto_3869 ?auto_3872 )
      ( MAKE-1CRATE ?auto_3872 ?auto_3871 )
      ( MAKE-8CRATE-VERIFY ?auto_3864 ?auto_3865 ?auto_3866 ?auto_3867 ?auto_3868 ?auto_3870 ?auto_3869 ?auto_3872 ?auto_3871 ) )
  )

)

