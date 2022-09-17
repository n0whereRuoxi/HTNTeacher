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
      ?auto_3659 - PLACE
      ?auto_3655 - PLACE
      ?auto_3658 - HOIST
      ?auto_3654 - SURFACE
      ?auto_3660 - SURFACE
      ?auto_3657 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3656 ?auto_3659 ) ( IS-CRATE ?auto_3653 ) ( not ( = ?auto_3655 ?auto_3659 ) ) ( HOIST-AT ?auto_3658 ?auto_3655 ) ( SURFACE-AT ?auto_3653 ?auto_3655 ) ( ON ?auto_3653 ?auto_3654 ) ( CLEAR ?auto_3653 ) ( not ( = ?auto_3652 ?auto_3653 ) ) ( not ( = ?auto_3652 ?auto_3654 ) ) ( not ( = ?auto_3653 ?auto_3654 ) ) ( not ( = ?auto_3656 ?auto_3658 ) ) ( SURFACE-AT ?auto_3651 ?auto_3659 ) ( CLEAR ?auto_3651 ) ( IS-CRATE ?auto_3652 ) ( AVAILABLE ?auto_3656 ) ( AVAILABLE ?auto_3658 ) ( SURFACE-AT ?auto_3652 ?auto_3655 ) ( ON ?auto_3652 ?auto_3660 ) ( CLEAR ?auto_3652 ) ( TRUCK-AT ?auto_3657 ?auto_3659 ) ( not ( = ?auto_3651 ?auto_3652 ) ) ( not ( = ?auto_3651 ?auto_3660 ) ) ( not ( = ?auto_3652 ?auto_3660 ) ) ( not ( = ?auto_3651 ?auto_3653 ) ) ( not ( = ?auto_3651 ?auto_3654 ) ) ( not ( = ?auto_3653 ?auto_3660 ) ) ( not ( = ?auto_3654 ?auto_3660 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3651 ?auto_3652 )
      ( MAKE-1CRATE ?auto_3652 ?auto_3653 )
      ( MAKE-2CRATE-VERIFY ?auto_3651 ?auto_3652 ?auto_3653 ) )
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
      ?auto_3681 - HOIST
      ?auto_3683 - PLACE
      ?auto_3682 - PLACE
      ?auto_3679 - HOIST
      ?auto_3680 - SURFACE
      ?auto_3687 - PLACE
      ?auto_3685 - HOIST
      ?auto_3686 - SURFACE
      ?auto_3688 - SURFACE
      ?auto_3684 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3681 ?auto_3683 ) ( IS-CRATE ?auto_3678 ) ( not ( = ?auto_3682 ?auto_3683 ) ) ( HOIST-AT ?auto_3679 ?auto_3682 ) ( AVAILABLE ?auto_3679 ) ( SURFACE-AT ?auto_3678 ?auto_3682 ) ( ON ?auto_3678 ?auto_3680 ) ( CLEAR ?auto_3678 ) ( not ( = ?auto_3677 ?auto_3678 ) ) ( not ( = ?auto_3677 ?auto_3680 ) ) ( not ( = ?auto_3678 ?auto_3680 ) ) ( not ( = ?auto_3681 ?auto_3679 ) ) ( IS-CRATE ?auto_3677 ) ( not ( = ?auto_3687 ?auto_3683 ) ) ( HOIST-AT ?auto_3685 ?auto_3687 ) ( SURFACE-AT ?auto_3677 ?auto_3687 ) ( ON ?auto_3677 ?auto_3686 ) ( CLEAR ?auto_3677 ) ( not ( = ?auto_3676 ?auto_3677 ) ) ( not ( = ?auto_3676 ?auto_3686 ) ) ( not ( = ?auto_3677 ?auto_3686 ) ) ( not ( = ?auto_3681 ?auto_3685 ) ) ( SURFACE-AT ?auto_3675 ?auto_3683 ) ( CLEAR ?auto_3675 ) ( IS-CRATE ?auto_3676 ) ( AVAILABLE ?auto_3681 ) ( AVAILABLE ?auto_3685 ) ( SURFACE-AT ?auto_3676 ?auto_3687 ) ( ON ?auto_3676 ?auto_3688 ) ( CLEAR ?auto_3676 ) ( TRUCK-AT ?auto_3684 ?auto_3683 ) ( not ( = ?auto_3675 ?auto_3676 ) ) ( not ( = ?auto_3675 ?auto_3688 ) ) ( not ( = ?auto_3676 ?auto_3688 ) ) ( not ( = ?auto_3675 ?auto_3677 ) ) ( not ( = ?auto_3675 ?auto_3686 ) ) ( not ( = ?auto_3677 ?auto_3688 ) ) ( not ( = ?auto_3686 ?auto_3688 ) ) ( not ( = ?auto_3675 ?auto_3678 ) ) ( not ( = ?auto_3675 ?auto_3680 ) ) ( not ( = ?auto_3676 ?auto_3678 ) ) ( not ( = ?auto_3676 ?auto_3680 ) ) ( not ( = ?auto_3678 ?auto_3686 ) ) ( not ( = ?auto_3678 ?auto_3688 ) ) ( not ( = ?auto_3682 ?auto_3687 ) ) ( not ( = ?auto_3679 ?auto_3685 ) ) ( not ( = ?auto_3680 ?auto_3686 ) ) ( not ( = ?auto_3680 ?auto_3688 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_3675 ?auto_3676 ?auto_3677 )
      ( MAKE-1CRATE ?auto_3677 ?auto_3678 )
      ( MAKE-3CRATE-VERIFY ?auto_3675 ?auto_3676 ?auto_3677 ?auto_3678 ) )
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
      ?auto_3710 - PLACE
      ?auto_3711 - PLACE
      ?auto_3709 - HOIST
      ?auto_3712 - SURFACE
      ?auto_3718 - PLACE
      ?auto_3717 - HOIST
      ?auto_3716 - SURFACE
      ?auto_3720 - PLACE
      ?auto_3721 - HOIST
      ?auto_3719 - SURFACE
      ?auto_3715 - SURFACE
      ?auto_3714 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3713 ?auto_3710 ) ( IS-CRATE ?auto_3708 ) ( not ( = ?auto_3711 ?auto_3710 ) ) ( HOIST-AT ?auto_3709 ?auto_3711 ) ( AVAILABLE ?auto_3709 ) ( SURFACE-AT ?auto_3708 ?auto_3711 ) ( ON ?auto_3708 ?auto_3712 ) ( CLEAR ?auto_3708 ) ( not ( = ?auto_3707 ?auto_3708 ) ) ( not ( = ?auto_3707 ?auto_3712 ) ) ( not ( = ?auto_3708 ?auto_3712 ) ) ( not ( = ?auto_3713 ?auto_3709 ) ) ( IS-CRATE ?auto_3707 ) ( not ( = ?auto_3718 ?auto_3710 ) ) ( HOIST-AT ?auto_3717 ?auto_3718 ) ( AVAILABLE ?auto_3717 ) ( SURFACE-AT ?auto_3707 ?auto_3718 ) ( ON ?auto_3707 ?auto_3716 ) ( CLEAR ?auto_3707 ) ( not ( = ?auto_3706 ?auto_3707 ) ) ( not ( = ?auto_3706 ?auto_3716 ) ) ( not ( = ?auto_3707 ?auto_3716 ) ) ( not ( = ?auto_3713 ?auto_3717 ) ) ( IS-CRATE ?auto_3706 ) ( not ( = ?auto_3720 ?auto_3710 ) ) ( HOIST-AT ?auto_3721 ?auto_3720 ) ( SURFACE-AT ?auto_3706 ?auto_3720 ) ( ON ?auto_3706 ?auto_3719 ) ( CLEAR ?auto_3706 ) ( not ( = ?auto_3705 ?auto_3706 ) ) ( not ( = ?auto_3705 ?auto_3719 ) ) ( not ( = ?auto_3706 ?auto_3719 ) ) ( not ( = ?auto_3713 ?auto_3721 ) ) ( SURFACE-AT ?auto_3704 ?auto_3710 ) ( CLEAR ?auto_3704 ) ( IS-CRATE ?auto_3705 ) ( AVAILABLE ?auto_3713 ) ( AVAILABLE ?auto_3721 ) ( SURFACE-AT ?auto_3705 ?auto_3720 ) ( ON ?auto_3705 ?auto_3715 ) ( CLEAR ?auto_3705 ) ( TRUCK-AT ?auto_3714 ?auto_3710 ) ( not ( = ?auto_3704 ?auto_3705 ) ) ( not ( = ?auto_3704 ?auto_3715 ) ) ( not ( = ?auto_3705 ?auto_3715 ) ) ( not ( = ?auto_3704 ?auto_3706 ) ) ( not ( = ?auto_3704 ?auto_3719 ) ) ( not ( = ?auto_3706 ?auto_3715 ) ) ( not ( = ?auto_3719 ?auto_3715 ) ) ( not ( = ?auto_3704 ?auto_3707 ) ) ( not ( = ?auto_3704 ?auto_3716 ) ) ( not ( = ?auto_3705 ?auto_3707 ) ) ( not ( = ?auto_3705 ?auto_3716 ) ) ( not ( = ?auto_3707 ?auto_3719 ) ) ( not ( = ?auto_3707 ?auto_3715 ) ) ( not ( = ?auto_3718 ?auto_3720 ) ) ( not ( = ?auto_3717 ?auto_3721 ) ) ( not ( = ?auto_3716 ?auto_3719 ) ) ( not ( = ?auto_3716 ?auto_3715 ) ) ( not ( = ?auto_3704 ?auto_3708 ) ) ( not ( = ?auto_3704 ?auto_3712 ) ) ( not ( = ?auto_3705 ?auto_3708 ) ) ( not ( = ?auto_3705 ?auto_3712 ) ) ( not ( = ?auto_3706 ?auto_3708 ) ) ( not ( = ?auto_3706 ?auto_3712 ) ) ( not ( = ?auto_3708 ?auto_3716 ) ) ( not ( = ?auto_3708 ?auto_3719 ) ) ( not ( = ?auto_3708 ?auto_3715 ) ) ( not ( = ?auto_3711 ?auto_3718 ) ) ( not ( = ?auto_3711 ?auto_3720 ) ) ( not ( = ?auto_3709 ?auto_3717 ) ) ( not ( = ?auto_3709 ?auto_3721 ) ) ( not ( = ?auto_3712 ?auto_3716 ) ) ( not ( = ?auto_3712 ?auto_3719 ) ) ( not ( = ?auto_3712 ?auto_3715 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_3704 ?auto_3705 ?auto_3706 ?auto_3707 )
      ( MAKE-1CRATE ?auto_3707 ?auto_3708 )
      ( MAKE-4CRATE-VERIFY ?auto_3704 ?auto_3705 ?auto_3706 ?auto_3707 ?auto_3708 ) )
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
      ?auto_3746 - HOIST
      ?auto_3745 - PLACE
      ?auto_3744 - PLACE
      ?auto_3749 - HOIST
      ?auto_3747 - SURFACE
      ?auto_3750 - SURFACE
      ?auto_3757 - PLACE
      ?auto_3755 - HOIST
      ?auto_3756 - SURFACE
      ?auto_3753 - PLACE
      ?auto_3751 - HOIST
      ?auto_3752 - SURFACE
      ?auto_3754 - SURFACE
      ?auto_3748 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3746 ?auto_3745 ) ( IS-CRATE ?auto_3743 ) ( not ( = ?auto_3744 ?auto_3745 ) ) ( HOIST-AT ?auto_3749 ?auto_3744 ) ( SURFACE-AT ?auto_3743 ?auto_3744 ) ( ON ?auto_3743 ?auto_3747 ) ( CLEAR ?auto_3743 ) ( not ( = ?auto_3742 ?auto_3743 ) ) ( not ( = ?auto_3742 ?auto_3747 ) ) ( not ( = ?auto_3743 ?auto_3747 ) ) ( not ( = ?auto_3746 ?auto_3749 ) ) ( IS-CRATE ?auto_3742 ) ( AVAILABLE ?auto_3749 ) ( SURFACE-AT ?auto_3742 ?auto_3744 ) ( ON ?auto_3742 ?auto_3750 ) ( CLEAR ?auto_3742 ) ( not ( = ?auto_3741 ?auto_3742 ) ) ( not ( = ?auto_3741 ?auto_3750 ) ) ( not ( = ?auto_3742 ?auto_3750 ) ) ( IS-CRATE ?auto_3741 ) ( not ( = ?auto_3757 ?auto_3745 ) ) ( HOIST-AT ?auto_3755 ?auto_3757 ) ( AVAILABLE ?auto_3755 ) ( SURFACE-AT ?auto_3741 ?auto_3757 ) ( ON ?auto_3741 ?auto_3756 ) ( CLEAR ?auto_3741 ) ( not ( = ?auto_3740 ?auto_3741 ) ) ( not ( = ?auto_3740 ?auto_3756 ) ) ( not ( = ?auto_3741 ?auto_3756 ) ) ( not ( = ?auto_3746 ?auto_3755 ) ) ( IS-CRATE ?auto_3740 ) ( not ( = ?auto_3753 ?auto_3745 ) ) ( HOIST-AT ?auto_3751 ?auto_3753 ) ( SURFACE-AT ?auto_3740 ?auto_3753 ) ( ON ?auto_3740 ?auto_3752 ) ( CLEAR ?auto_3740 ) ( not ( = ?auto_3739 ?auto_3740 ) ) ( not ( = ?auto_3739 ?auto_3752 ) ) ( not ( = ?auto_3740 ?auto_3752 ) ) ( not ( = ?auto_3746 ?auto_3751 ) ) ( SURFACE-AT ?auto_3738 ?auto_3745 ) ( CLEAR ?auto_3738 ) ( IS-CRATE ?auto_3739 ) ( AVAILABLE ?auto_3746 ) ( AVAILABLE ?auto_3751 ) ( SURFACE-AT ?auto_3739 ?auto_3753 ) ( ON ?auto_3739 ?auto_3754 ) ( CLEAR ?auto_3739 ) ( TRUCK-AT ?auto_3748 ?auto_3745 ) ( not ( = ?auto_3738 ?auto_3739 ) ) ( not ( = ?auto_3738 ?auto_3754 ) ) ( not ( = ?auto_3739 ?auto_3754 ) ) ( not ( = ?auto_3738 ?auto_3740 ) ) ( not ( = ?auto_3738 ?auto_3752 ) ) ( not ( = ?auto_3740 ?auto_3754 ) ) ( not ( = ?auto_3752 ?auto_3754 ) ) ( not ( = ?auto_3738 ?auto_3741 ) ) ( not ( = ?auto_3738 ?auto_3756 ) ) ( not ( = ?auto_3739 ?auto_3741 ) ) ( not ( = ?auto_3739 ?auto_3756 ) ) ( not ( = ?auto_3741 ?auto_3752 ) ) ( not ( = ?auto_3741 ?auto_3754 ) ) ( not ( = ?auto_3757 ?auto_3753 ) ) ( not ( = ?auto_3755 ?auto_3751 ) ) ( not ( = ?auto_3756 ?auto_3752 ) ) ( not ( = ?auto_3756 ?auto_3754 ) ) ( not ( = ?auto_3738 ?auto_3742 ) ) ( not ( = ?auto_3738 ?auto_3750 ) ) ( not ( = ?auto_3739 ?auto_3742 ) ) ( not ( = ?auto_3739 ?auto_3750 ) ) ( not ( = ?auto_3740 ?auto_3742 ) ) ( not ( = ?auto_3740 ?auto_3750 ) ) ( not ( = ?auto_3742 ?auto_3756 ) ) ( not ( = ?auto_3742 ?auto_3752 ) ) ( not ( = ?auto_3742 ?auto_3754 ) ) ( not ( = ?auto_3744 ?auto_3757 ) ) ( not ( = ?auto_3744 ?auto_3753 ) ) ( not ( = ?auto_3749 ?auto_3755 ) ) ( not ( = ?auto_3749 ?auto_3751 ) ) ( not ( = ?auto_3750 ?auto_3756 ) ) ( not ( = ?auto_3750 ?auto_3752 ) ) ( not ( = ?auto_3750 ?auto_3754 ) ) ( not ( = ?auto_3738 ?auto_3743 ) ) ( not ( = ?auto_3738 ?auto_3747 ) ) ( not ( = ?auto_3739 ?auto_3743 ) ) ( not ( = ?auto_3739 ?auto_3747 ) ) ( not ( = ?auto_3740 ?auto_3743 ) ) ( not ( = ?auto_3740 ?auto_3747 ) ) ( not ( = ?auto_3741 ?auto_3743 ) ) ( not ( = ?auto_3741 ?auto_3747 ) ) ( not ( = ?auto_3743 ?auto_3750 ) ) ( not ( = ?auto_3743 ?auto_3756 ) ) ( not ( = ?auto_3743 ?auto_3752 ) ) ( not ( = ?auto_3743 ?auto_3754 ) ) ( not ( = ?auto_3747 ?auto_3750 ) ) ( not ( = ?auto_3747 ?auto_3756 ) ) ( not ( = ?auto_3747 ?auto_3752 ) ) ( not ( = ?auto_3747 ?auto_3754 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_3738 ?auto_3739 ?auto_3740 ?auto_3741 ?auto_3742 )
      ( MAKE-1CRATE ?auto_3742 ?auto_3743 )
      ( MAKE-5CRATE-VERIFY ?auto_3738 ?auto_3739 ?auto_3740 ?auto_3741 ?auto_3742 ?auto_3743 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_3775 - SURFACE
      ?auto_3776 - SURFACE
      ?auto_3777 - SURFACE
      ?auto_3778 - SURFACE
      ?auto_3779 - SURFACE
      ?auto_3780 - SURFACE
      ?auto_3781 - SURFACE
    )
    :vars
    (
      ?auto_3783 - HOIST
      ?auto_3784 - PLACE
      ?auto_3786 - PLACE
      ?auto_3787 - HOIST
      ?auto_3782 - SURFACE
      ?auto_3791 - PLACE
      ?auto_3794 - HOIST
      ?auto_3793 - SURFACE
      ?auto_3789 - SURFACE
      ?auto_3795 - PLACE
      ?auto_3796 - HOIST
      ?auto_3792 - SURFACE
      ?auto_3797 - PLACE
      ?auto_3788 - HOIST
      ?auto_3790 - SURFACE
      ?auto_3798 - SURFACE
      ?auto_3785 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3783 ?auto_3784 ) ( IS-CRATE ?auto_3781 ) ( not ( = ?auto_3786 ?auto_3784 ) ) ( HOIST-AT ?auto_3787 ?auto_3786 ) ( AVAILABLE ?auto_3787 ) ( SURFACE-AT ?auto_3781 ?auto_3786 ) ( ON ?auto_3781 ?auto_3782 ) ( CLEAR ?auto_3781 ) ( not ( = ?auto_3780 ?auto_3781 ) ) ( not ( = ?auto_3780 ?auto_3782 ) ) ( not ( = ?auto_3781 ?auto_3782 ) ) ( not ( = ?auto_3783 ?auto_3787 ) ) ( IS-CRATE ?auto_3780 ) ( not ( = ?auto_3791 ?auto_3784 ) ) ( HOIST-AT ?auto_3794 ?auto_3791 ) ( SURFACE-AT ?auto_3780 ?auto_3791 ) ( ON ?auto_3780 ?auto_3793 ) ( CLEAR ?auto_3780 ) ( not ( = ?auto_3779 ?auto_3780 ) ) ( not ( = ?auto_3779 ?auto_3793 ) ) ( not ( = ?auto_3780 ?auto_3793 ) ) ( not ( = ?auto_3783 ?auto_3794 ) ) ( IS-CRATE ?auto_3779 ) ( AVAILABLE ?auto_3794 ) ( SURFACE-AT ?auto_3779 ?auto_3791 ) ( ON ?auto_3779 ?auto_3789 ) ( CLEAR ?auto_3779 ) ( not ( = ?auto_3778 ?auto_3779 ) ) ( not ( = ?auto_3778 ?auto_3789 ) ) ( not ( = ?auto_3779 ?auto_3789 ) ) ( IS-CRATE ?auto_3778 ) ( not ( = ?auto_3795 ?auto_3784 ) ) ( HOIST-AT ?auto_3796 ?auto_3795 ) ( AVAILABLE ?auto_3796 ) ( SURFACE-AT ?auto_3778 ?auto_3795 ) ( ON ?auto_3778 ?auto_3792 ) ( CLEAR ?auto_3778 ) ( not ( = ?auto_3777 ?auto_3778 ) ) ( not ( = ?auto_3777 ?auto_3792 ) ) ( not ( = ?auto_3778 ?auto_3792 ) ) ( not ( = ?auto_3783 ?auto_3796 ) ) ( IS-CRATE ?auto_3777 ) ( not ( = ?auto_3797 ?auto_3784 ) ) ( HOIST-AT ?auto_3788 ?auto_3797 ) ( SURFACE-AT ?auto_3777 ?auto_3797 ) ( ON ?auto_3777 ?auto_3790 ) ( CLEAR ?auto_3777 ) ( not ( = ?auto_3776 ?auto_3777 ) ) ( not ( = ?auto_3776 ?auto_3790 ) ) ( not ( = ?auto_3777 ?auto_3790 ) ) ( not ( = ?auto_3783 ?auto_3788 ) ) ( SURFACE-AT ?auto_3775 ?auto_3784 ) ( CLEAR ?auto_3775 ) ( IS-CRATE ?auto_3776 ) ( AVAILABLE ?auto_3783 ) ( AVAILABLE ?auto_3788 ) ( SURFACE-AT ?auto_3776 ?auto_3797 ) ( ON ?auto_3776 ?auto_3798 ) ( CLEAR ?auto_3776 ) ( TRUCK-AT ?auto_3785 ?auto_3784 ) ( not ( = ?auto_3775 ?auto_3776 ) ) ( not ( = ?auto_3775 ?auto_3798 ) ) ( not ( = ?auto_3776 ?auto_3798 ) ) ( not ( = ?auto_3775 ?auto_3777 ) ) ( not ( = ?auto_3775 ?auto_3790 ) ) ( not ( = ?auto_3777 ?auto_3798 ) ) ( not ( = ?auto_3790 ?auto_3798 ) ) ( not ( = ?auto_3775 ?auto_3778 ) ) ( not ( = ?auto_3775 ?auto_3792 ) ) ( not ( = ?auto_3776 ?auto_3778 ) ) ( not ( = ?auto_3776 ?auto_3792 ) ) ( not ( = ?auto_3778 ?auto_3790 ) ) ( not ( = ?auto_3778 ?auto_3798 ) ) ( not ( = ?auto_3795 ?auto_3797 ) ) ( not ( = ?auto_3796 ?auto_3788 ) ) ( not ( = ?auto_3792 ?auto_3790 ) ) ( not ( = ?auto_3792 ?auto_3798 ) ) ( not ( = ?auto_3775 ?auto_3779 ) ) ( not ( = ?auto_3775 ?auto_3789 ) ) ( not ( = ?auto_3776 ?auto_3779 ) ) ( not ( = ?auto_3776 ?auto_3789 ) ) ( not ( = ?auto_3777 ?auto_3779 ) ) ( not ( = ?auto_3777 ?auto_3789 ) ) ( not ( = ?auto_3779 ?auto_3792 ) ) ( not ( = ?auto_3779 ?auto_3790 ) ) ( not ( = ?auto_3779 ?auto_3798 ) ) ( not ( = ?auto_3791 ?auto_3795 ) ) ( not ( = ?auto_3791 ?auto_3797 ) ) ( not ( = ?auto_3794 ?auto_3796 ) ) ( not ( = ?auto_3794 ?auto_3788 ) ) ( not ( = ?auto_3789 ?auto_3792 ) ) ( not ( = ?auto_3789 ?auto_3790 ) ) ( not ( = ?auto_3789 ?auto_3798 ) ) ( not ( = ?auto_3775 ?auto_3780 ) ) ( not ( = ?auto_3775 ?auto_3793 ) ) ( not ( = ?auto_3776 ?auto_3780 ) ) ( not ( = ?auto_3776 ?auto_3793 ) ) ( not ( = ?auto_3777 ?auto_3780 ) ) ( not ( = ?auto_3777 ?auto_3793 ) ) ( not ( = ?auto_3778 ?auto_3780 ) ) ( not ( = ?auto_3778 ?auto_3793 ) ) ( not ( = ?auto_3780 ?auto_3789 ) ) ( not ( = ?auto_3780 ?auto_3792 ) ) ( not ( = ?auto_3780 ?auto_3790 ) ) ( not ( = ?auto_3780 ?auto_3798 ) ) ( not ( = ?auto_3793 ?auto_3789 ) ) ( not ( = ?auto_3793 ?auto_3792 ) ) ( not ( = ?auto_3793 ?auto_3790 ) ) ( not ( = ?auto_3793 ?auto_3798 ) ) ( not ( = ?auto_3775 ?auto_3781 ) ) ( not ( = ?auto_3775 ?auto_3782 ) ) ( not ( = ?auto_3776 ?auto_3781 ) ) ( not ( = ?auto_3776 ?auto_3782 ) ) ( not ( = ?auto_3777 ?auto_3781 ) ) ( not ( = ?auto_3777 ?auto_3782 ) ) ( not ( = ?auto_3778 ?auto_3781 ) ) ( not ( = ?auto_3778 ?auto_3782 ) ) ( not ( = ?auto_3779 ?auto_3781 ) ) ( not ( = ?auto_3779 ?auto_3782 ) ) ( not ( = ?auto_3781 ?auto_3793 ) ) ( not ( = ?auto_3781 ?auto_3789 ) ) ( not ( = ?auto_3781 ?auto_3792 ) ) ( not ( = ?auto_3781 ?auto_3790 ) ) ( not ( = ?auto_3781 ?auto_3798 ) ) ( not ( = ?auto_3786 ?auto_3791 ) ) ( not ( = ?auto_3786 ?auto_3795 ) ) ( not ( = ?auto_3786 ?auto_3797 ) ) ( not ( = ?auto_3787 ?auto_3794 ) ) ( not ( = ?auto_3787 ?auto_3796 ) ) ( not ( = ?auto_3787 ?auto_3788 ) ) ( not ( = ?auto_3782 ?auto_3793 ) ) ( not ( = ?auto_3782 ?auto_3789 ) ) ( not ( = ?auto_3782 ?auto_3792 ) ) ( not ( = ?auto_3782 ?auto_3790 ) ) ( not ( = ?auto_3782 ?auto_3798 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_3775 ?auto_3776 ?auto_3777 ?auto_3778 ?auto_3779 ?auto_3780 )
      ( MAKE-1CRATE ?auto_3780 ?auto_3781 )
      ( MAKE-6CRATE-VERIFY ?auto_3775 ?auto_3776 ?auto_3777 ?auto_3778 ?auto_3779 ?auto_3780 ?auto_3781 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_3817 - SURFACE
      ?auto_3818 - SURFACE
      ?auto_3819 - SURFACE
      ?auto_3820 - SURFACE
      ?auto_3821 - SURFACE
      ?auto_3822 - SURFACE
      ?auto_3823 - SURFACE
      ?auto_3824 - SURFACE
    )
    :vars
    (
      ?auto_3828 - HOIST
      ?auto_3827 - PLACE
      ?auto_3825 - PLACE
      ?auto_3829 - HOIST
      ?auto_3830 - SURFACE
      ?auto_3836 - PLACE
      ?auto_3835 - HOIST
      ?auto_3837 - SURFACE
      ?auto_3839 - PLACE
      ?auto_3840 - HOIST
      ?auto_3833 - SURFACE
      ?auto_3831 - SURFACE
      ?auto_3834 - PLACE
      ?auto_3841 - HOIST
      ?auto_3832 - SURFACE
      ?auto_3843 - PLACE
      ?auto_3838 - HOIST
      ?auto_3844 - SURFACE
      ?auto_3842 - SURFACE
      ?auto_3826 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3828 ?auto_3827 ) ( IS-CRATE ?auto_3824 ) ( not ( = ?auto_3825 ?auto_3827 ) ) ( HOIST-AT ?auto_3829 ?auto_3825 ) ( AVAILABLE ?auto_3829 ) ( SURFACE-AT ?auto_3824 ?auto_3825 ) ( ON ?auto_3824 ?auto_3830 ) ( CLEAR ?auto_3824 ) ( not ( = ?auto_3823 ?auto_3824 ) ) ( not ( = ?auto_3823 ?auto_3830 ) ) ( not ( = ?auto_3824 ?auto_3830 ) ) ( not ( = ?auto_3828 ?auto_3829 ) ) ( IS-CRATE ?auto_3823 ) ( not ( = ?auto_3836 ?auto_3827 ) ) ( HOIST-AT ?auto_3835 ?auto_3836 ) ( AVAILABLE ?auto_3835 ) ( SURFACE-AT ?auto_3823 ?auto_3836 ) ( ON ?auto_3823 ?auto_3837 ) ( CLEAR ?auto_3823 ) ( not ( = ?auto_3822 ?auto_3823 ) ) ( not ( = ?auto_3822 ?auto_3837 ) ) ( not ( = ?auto_3823 ?auto_3837 ) ) ( not ( = ?auto_3828 ?auto_3835 ) ) ( IS-CRATE ?auto_3822 ) ( not ( = ?auto_3839 ?auto_3827 ) ) ( HOIST-AT ?auto_3840 ?auto_3839 ) ( SURFACE-AT ?auto_3822 ?auto_3839 ) ( ON ?auto_3822 ?auto_3833 ) ( CLEAR ?auto_3822 ) ( not ( = ?auto_3821 ?auto_3822 ) ) ( not ( = ?auto_3821 ?auto_3833 ) ) ( not ( = ?auto_3822 ?auto_3833 ) ) ( not ( = ?auto_3828 ?auto_3840 ) ) ( IS-CRATE ?auto_3821 ) ( AVAILABLE ?auto_3840 ) ( SURFACE-AT ?auto_3821 ?auto_3839 ) ( ON ?auto_3821 ?auto_3831 ) ( CLEAR ?auto_3821 ) ( not ( = ?auto_3820 ?auto_3821 ) ) ( not ( = ?auto_3820 ?auto_3831 ) ) ( not ( = ?auto_3821 ?auto_3831 ) ) ( IS-CRATE ?auto_3820 ) ( not ( = ?auto_3834 ?auto_3827 ) ) ( HOIST-AT ?auto_3841 ?auto_3834 ) ( AVAILABLE ?auto_3841 ) ( SURFACE-AT ?auto_3820 ?auto_3834 ) ( ON ?auto_3820 ?auto_3832 ) ( CLEAR ?auto_3820 ) ( not ( = ?auto_3819 ?auto_3820 ) ) ( not ( = ?auto_3819 ?auto_3832 ) ) ( not ( = ?auto_3820 ?auto_3832 ) ) ( not ( = ?auto_3828 ?auto_3841 ) ) ( IS-CRATE ?auto_3819 ) ( not ( = ?auto_3843 ?auto_3827 ) ) ( HOIST-AT ?auto_3838 ?auto_3843 ) ( SURFACE-AT ?auto_3819 ?auto_3843 ) ( ON ?auto_3819 ?auto_3844 ) ( CLEAR ?auto_3819 ) ( not ( = ?auto_3818 ?auto_3819 ) ) ( not ( = ?auto_3818 ?auto_3844 ) ) ( not ( = ?auto_3819 ?auto_3844 ) ) ( not ( = ?auto_3828 ?auto_3838 ) ) ( SURFACE-AT ?auto_3817 ?auto_3827 ) ( CLEAR ?auto_3817 ) ( IS-CRATE ?auto_3818 ) ( AVAILABLE ?auto_3828 ) ( AVAILABLE ?auto_3838 ) ( SURFACE-AT ?auto_3818 ?auto_3843 ) ( ON ?auto_3818 ?auto_3842 ) ( CLEAR ?auto_3818 ) ( TRUCK-AT ?auto_3826 ?auto_3827 ) ( not ( = ?auto_3817 ?auto_3818 ) ) ( not ( = ?auto_3817 ?auto_3842 ) ) ( not ( = ?auto_3818 ?auto_3842 ) ) ( not ( = ?auto_3817 ?auto_3819 ) ) ( not ( = ?auto_3817 ?auto_3844 ) ) ( not ( = ?auto_3819 ?auto_3842 ) ) ( not ( = ?auto_3844 ?auto_3842 ) ) ( not ( = ?auto_3817 ?auto_3820 ) ) ( not ( = ?auto_3817 ?auto_3832 ) ) ( not ( = ?auto_3818 ?auto_3820 ) ) ( not ( = ?auto_3818 ?auto_3832 ) ) ( not ( = ?auto_3820 ?auto_3844 ) ) ( not ( = ?auto_3820 ?auto_3842 ) ) ( not ( = ?auto_3834 ?auto_3843 ) ) ( not ( = ?auto_3841 ?auto_3838 ) ) ( not ( = ?auto_3832 ?auto_3844 ) ) ( not ( = ?auto_3832 ?auto_3842 ) ) ( not ( = ?auto_3817 ?auto_3821 ) ) ( not ( = ?auto_3817 ?auto_3831 ) ) ( not ( = ?auto_3818 ?auto_3821 ) ) ( not ( = ?auto_3818 ?auto_3831 ) ) ( not ( = ?auto_3819 ?auto_3821 ) ) ( not ( = ?auto_3819 ?auto_3831 ) ) ( not ( = ?auto_3821 ?auto_3832 ) ) ( not ( = ?auto_3821 ?auto_3844 ) ) ( not ( = ?auto_3821 ?auto_3842 ) ) ( not ( = ?auto_3839 ?auto_3834 ) ) ( not ( = ?auto_3839 ?auto_3843 ) ) ( not ( = ?auto_3840 ?auto_3841 ) ) ( not ( = ?auto_3840 ?auto_3838 ) ) ( not ( = ?auto_3831 ?auto_3832 ) ) ( not ( = ?auto_3831 ?auto_3844 ) ) ( not ( = ?auto_3831 ?auto_3842 ) ) ( not ( = ?auto_3817 ?auto_3822 ) ) ( not ( = ?auto_3817 ?auto_3833 ) ) ( not ( = ?auto_3818 ?auto_3822 ) ) ( not ( = ?auto_3818 ?auto_3833 ) ) ( not ( = ?auto_3819 ?auto_3822 ) ) ( not ( = ?auto_3819 ?auto_3833 ) ) ( not ( = ?auto_3820 ?auto_3822 ) ) ( not ( = ?auto_3820 ?auto_3833 ) ) ( not ( = ?auto_3822 ?auto_3831 ) ) ( not ( = ?auto_3822 ?auto_3832 ) ) ( not ( = ?auto_3822 ?auto_3844 ) ) ( not ( = ?auto_3822 ?auto_3842 ) ) ( not ( = ?auto_3833 ?auto_3831 ) ) ( not ( = ?auto_3833 ?auto_3832 ) ) ( not ( = ?auto_3833 ?auto_3844 ) ) ( not ( = ?auto_3833 ?auto_3842 ) ) ( not ( = ?auto_3817 ?auto_3823 ) ) ( not ( = ?auto_3817 ?auto_3837 ) ) ( not ( = ?auto_3818 ?auto_3823 ) ) ( not ( = ?auto_3818 ?auto_3837 ) ) ( not ( = ?auto_3819 ?auto_3823 ) ) ( not ( = ?auto_3819 ?auto_3837 ) ) ( not ( = ?auto_3820 ?auto_3823 ) ) ( not ( = ?auto_3820 ?auto_3837 ) ) ( not ( = ?auto_3821 ?auto_3823 ) ) ( not ( = ?auto_3821 ?auto_3837 ) ) ( not ( = ?auto_3823 ?auto_3833 ) ) ( not ( = ?auto_3823 ?auto_3831 ) ) ( not ( = ?auto_3823 ?auto_3832 ) ) ( not ( = ?auto_3823 ?auto_3844 ) ) ( not ( = ?auto_3823 ?auto_3842 ) ) ( not ( = ?auto_3836 ?auto_3839 ) ) ( not ( = ?auto_3836 ?auto_3834 ) ) ( not ( = ?auto_3836 ?auto_3843 ) ) ( not ( = ?auto_3835 ?auto_3840 ) ) ( not ( = ?auto_3835 ?auto_3841 ) ) ( not ( = ?auto_3835 ?auto_3838 ) ) ( not ( = ?auto_3837 ?auto_3833 ) ) ( not ( = ?auto_3837 ?auto_3831 ) ) ( not ( = ?auto_3837 ?auto_3832 ) ) ( not ( = ?auto_3837 ?auto_3844 ) ) ( not ( = ?auto_3837 ?auto_3842 ) ) ( not ( = ?auto_3817 ?auto_3824 ) ) ( not ( = ?auto_3817 ?auto_3830 ) ) ( not ( = ?auto_3818 ?auto_3824 ) ) ( not ( = ?auto_3818 ?auto_3830 ) ) ( not ( = ?auto_3819 ?auto_3824 ) ) ( not ( = ?auto_3819 ?auto_3830 ) ) ( not ( = ?auto_3820 ?auto_3824 ) ) ( not ( = ?auto_3820 ?auto_3830 ) ) ( not ( = ?auto_3821 ?auto_3824 ) ) ( not ( = ?auto_3821 ?auto_3830 ) ) ( not ( = ?auto_3822 ?auto_3824 ) ) ( not ( = ?auto_3822 ?auto_3830 ) ) ( not ( = ?auto_3824 ?auto_3837 ) ) ( not ( = ?auto_3824 ?auto_3833 ) ) ( not ( = ?auto_3824 ?auto_3831 ) ) ( not ( = ?auto_3824 ?auto_3832 ) ) ( not ( = ?auto_3824 ?auto_3844 ) ) ( not ( = ?auto_3824 ?auto_3842 ) ) ( not ( = ?auto_3825 ?auto_3836 ) ) ( not ( = ?auto_3825 ?auto_3839 ) ) ( not ( = ?auto_3825 ?auto_3834 ) ) ( not ( = ?auto_3825 ?auto_3843 ) ) ( not ( = ?auto_3829 ?auto_3835 ) ) ( not ( = ?auto_3829 ?auto_3840 ) ) ( not ( = ?auto_3829 ?auto_3841 ) ) ( not ( = ?auto_3829 ?auto_3838 ) ) ( not ( = ?auto_3830 ?auto_3837 ) ) ( not ( = ?auto_3830 ?auto_3833 ) ) ( not ( = ?auto_3830 ?auto_3831 ) ) ( not ( = ?auto_3830 ?auto_3832 ) ) ( not ( = ?auto_3830 ?auto_3844 ) ) ( not ( = ?auto_3830 ?auto_3842 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_3817 ?auto_3818 ?auto_3819 ?auto_3820 ?auto_3821 ?auto_3822 ?auto_3823 )
      ( MAKE-1CRATE ?auto_3823 ?auto_3824 )
      ( MAKE-7CRATE-VERIFY ?auto_3817 ?auto_3818 ?auto_3819 ?auto_3820 ?auto_3821 ?auto_3822 ?auto_3823 ?auto_3824 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_3864 - SURFACE
      ?auto_3865 - SURFACE
      ?auto_3866 - SURFACE
      ?auto_3867 - SURFACE
      ?auto_3868 - SURFACE
      ?auto_3869 - SURFACE
      ?auto_3870 - SURFACE
      ?auto_3871 - SURFACE
      ?auto_3872 - SURFACE
    )
    :vars
    (
      ?auto_3878 - HOIST
      ?auto_3877 - PLACE
      ?auto_3873 - PLACE
      ?auto_3874 - HOIST
      ?auto_3875 - SURFACE
      ?auto_3893 - PLACE
      ?auto_3892 - HOIST
      ?auto_3891 - SURFACE
      ?auto_3881 - PLACE
      ?auto_3880 - HOIST
      ?auto_3885 - SURFACE
      ?auto_3888 - PLACE
      ?auto_3890 - HOIST
      ?auto_3887 - SURFACE
      ?auto_3886 - SURFACE
      ?auto_3883 - SURFACE
      ?auto_3884 - PLACE
      ?auto_3889 - HOIST
      ?auto_3879 - SURFACE
      ?auto_3882 - SURFACE
      ?auto_3876 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3878 ?auto_3877 ) ( IS-CRATE ?auto_3872 ) ( not ( = ?auto_3873 ?auto_3877 ) ) ( HOIST-AT ?auto_3874 ?auto_3873 ) ( SURFACE-AT ?auto_3872 ?auto_3873 ) ( ON ?auto_3872 ?auto_3875 ) ( CLEAR ?auto_3872 ) ( not ( = ?auto_3871 ?auto_3872 ) ) ( not ( = ?auto_3871 ?auto_3875 ) ) ( not ( = ?auto_3872 ?auto_3875 ) ) ( not ( = ?auto_3878 ?auto_3874 ) ) ( IS-CRATE ?auto_3871 ) ( not ( = ?auto_3893 ?auto_3877 ) ) ( HOIST-AT ?auto_3892 ?auto_3893 ) ( AVAILABLE ?auto_3892 ) ( SURFACE-AT ?auto_3871 ?auto_3893 ) ( ON ?auto_3871 ?auto_3891 ) ( CLEAR ?auto_3871 ) ( not ( = ?auto_3870 ?auto_3871 ) ) ( not ( = ?auto_3870 ?auto_3891 ) ) ( not ( = ?auto_3871 ?auto_3891 ) ) ( not ( = ?auto_3878 ?auto_3892 ) ) ( IS-CRATE ?auto_3870 ) ( not ( = ?auto_3881 ?auto_3877 ) ) ( HOIST-AT ?auto_3880 ?auto_3881 ) ( AVAILABLE ?auto_3880 ) ( SURFACE-AT ?auto_3870 ?auto_3881 ) ( ON ?auto_3870 ?auto_3885 ) ( CLEAR ?auto_3870 ) ( not ( = ?auto_3869 ?auto_3870 ) ) ( not ( = ?auto_3869 ?auto_3885 ) ) ( not ( = ?auto_3870 ?auto_3885 ) ) ( not ( = ?auto_3878 ?auto_3880 ) ) ( IS-CRATE ?auto_3869 ) ( not ( = ?auto_3888 ?auto_3877 ) ) ( HOIST-AT ?auto_3890 ?auto_3888 ) ( SURFACE-AT ?auto_3869 ?auto_3888 ) ( ON ?auto_3869 ?auto_3887 ) ( CLEAR ?auto_3869 ) ( not ( = ?auto_3868 ?auto_3869 ) ) ( not ( = ?auto_3868 ?auto_3887 ) ) ( not ( = ?auto_3869 ?auto_3887 ) ) ( not ( = ?auto_3878 ?auto_3890 ) ) ( IS-CRATE ?auto_3868 ) ( AVAILABLE ?auto_3890 ) ( SURFACE-AT ?auto_3868 ?auto_3888 ) ( ON ?auto_3868 ?auto_3886 ) ( CLEAR ?auto_3868 ) ( not ( = ?auto_3867 ?auto_3868 ) ) ( not ( = ?auto_3867 ?auto_3886 ) ) ( not ( = ?auto_3868 ?auto_3886 ) ) ( IS-CRATE ?auto_3867 ) ( AVAILABLE ?auto_3874 ) ( SURFACE-AT ?auto_3867 ?auto_3873 ) ( ON ?auto_3867 ?auto_3883 ) ( CLEAR ?auto_3867 ) ( not ( = ?auto_3866 ?auto_3867 ) ) ( not ( = ?auto_3866 ?auto_3883 ) ) ( not ( = ?auto_3867 ?auto_3883 ) ) ( IS-CRATE ?auto_3866 ) ( not ( = ?auto_3884 ?auto_3877 ) ) ( HOIST-AT ?auto_3889 ?auto_3884 ) ( SURFACE-AT ?auto_3866 ?auto_3884 ) ( ON ?auto_3866 ?auto_3879 ) ( CLEAR ?auto_3866 ) ( not ( = ?auto_3865 ?auto_3866 ) ) ( not ( = ?auto_3865 ?auto_3879 ) ) ( not ( = ?auto_3866 ?auto_3879 ) ) ( not ( = ?auto_3878 ?auto_3889 ) ) ( SURFACE-AT ?auto_3864 ?auto_3877 ) ( CLEAR ?auto_3864 ) ( IS-CRATE ?auto_3865 ) ( AVAILABLE ?auto_3878 ) ( AVAILABLE ?auto_3889 ) ( SURFACE-AT ?auto_3865 ?auto_3884 ) ( ON ?auto_3865 ?auto_3882 ) ( CLEAR ?auto_3865 ) ( TRUCK-AT ?auto_3876 ?auto_3877 ) ( not ( = ?auto_3864 ?auto_3865 ) ) ( not ( = ?auto_3864 ?auto_3882 ) ) ( not ( = ?auto_3865 ?auto_3882 ) ) ( not ( = ?auto_3864 ?auto_3866 ) ) ( not ( = ?auto_3864 ?auto_3879 ) ) ( not ( = ?auto_3866 ?auto_3882 ) ) ( not ( = ?auto_3879 ?auto_3882 ) ) ( not ( = ?auto_3864 ?auto_3867 ) ) ( not ( = ?auto_3864 ?auto_3883 ) ) ( not ( = ?auto_3865 ?auto_3867 ) ) ( not ( = ?auto_3865 ?auto_3883 ) ) ( not ( = ?auto_3867 ?auto_3879 ) ) ( not ( = ?auto_3867 ?auto_3882 ) ) ( not ( = ?auto_3873 ?auto_3884 ) ) ( not ( = ?auto_3874 ?auto_3889 ) ) ( not ( = ?auto_3883 ?auto_3879 ) ) ( not ( = ?auto_3883 ?auto_3882 ) ) ( not ( = ?auto_3864 ?auto_3868 ) ) ( not ( = ?auto_3864 ?auto_3886 ) ) ( not ( = ?auto_3865 ?auto_3868 ) ) ( not ( = ?auto_3865 ?auto_3886 ) ) ( not ( = ?auto_3866 ?auto_3868 ) ) ( not ( = ?auto_3866 ?auto_3886 ) ) ( not ( = ?auto_3868 ?auto_3883 ) ) ( not ( = ?auto_3868 ?auto_3879 ) ) ( not ( = ?auto_3868 ?auto_3882 ) ) ( not ( = ?auto_3888 ?auto_3873 ) ) ( not ( = ?auto_3888 ?auto_3884 ) ) ( not ( = ?auto_3890 ?auto_3874 ) ) ( not ( = ?auto_3890 ?auto_3889 ) ) ( not ( = ?auto_3886 ?auto_3883 ) ) ( not ( = ?auto_3886 ?auto_3879 ) ) ( not ( = ?auto_3886 ?auto_3882 ) ) ( not ( = ?auto_3864 ?auto_3869 ) ) ( not ( = ?auto_3864 ?auto_3887 ) ) ( not ( = ?auto_3865 ?auto_3869 ) ) ( not ( = ?auto_3865 ?auto_3887 ) ) ( not ( = ?auto_3866 ?auto_3869 ) ) ( not ( = ?auto_3866 ?auto_3887 ) ) ( not ( = ?auto_3867 ?auto_3869 ) ) ( not ( = ?auto_3867 ?auto_3887 ) ) ( not ( = ?auto_3869 ?auto_3886 ) ) ( not ( = ?auto_3869 ?auto_3883 ) ) ( not ( = ?auto_3869 ?auto_3879 ) ) ( not ( = ?auto_3869 ?auto_3882 ) ) ( not ( = ?auto_3887 ?auto_3886 ) ) ( not ( = ?auto_3887 ?auto_3883 ) ) ( not ( = ?auto_3887 ?auto_3879 ) ) ( not ( = ?auto_3887 ?auto_3882 ) ) ( not ( = ?auto_3864 ?auto_3870 ) ) ( not ( = ?auto_3864 ?auto_3885 ) ) ( not ( = ?auto_3865 ?auto_3870 ) ) ( not ( = ?auto_3865 ?auto_3885 ) ) ( not ( = ?auto_3866 ?auto_3870 ) ) ( not ( = ?auto_3866 ?auto_3885 ) ) ( not ( = ?auto_3867 ?auto_3870 ) ) ( not ( = ?auto_3867 ?auto_3885 ) ) ( not ( = ?auto_3868 ?auto_3870 ) ) ( not ( = ?auto_3868 ?auto_3885 ) ) ( not ( = ?auto_3870 ?auto_3887 ) ) ( not ( = ?auto_3870 ?auto_3886 ) ) ( not ( = ?auto_3870 ?auto_3883 ) ) ( not ( = ?auto_3870 ?auto_3879 ) ) ( not ( = ?auto_3870 ?auto_3882 ) ) ( not ( = ?auto_3881 ?auto_3888 ) ) ( not ( = ?auto_3881 ?auto_3873 ) ) ( not ( = ?auto_3881 ?auto_3884 ) ) ( not ( = ?auto_3880 ?auto_3890 ) ) ( not ( = ?auto_3880 ?auto_3874 ) ) ( not ( = ?auto_3880 ?auto_3889 ) ) ( not ( = ?auto_3885 ?auto_3887 ) ) ( not ( = ?auto_3885 ?auto_3886 ) ) ( not ( = ?auto_3885 ?auto_3883 ) ) ( not ( = ?auto_3885 ?auto_3879 ) ) ( not ( = ?auto_3885 ?auto_3882 ) ) ( not ( = ?auto_3864 ?auto_3871 ) ) ( not ( = ?auto_3864 ?auto_3891 ) ) ( not ( = ?auto_3865 ?auto_3871 ) ) ( not ( = ?auto_3865 ?auto_3891 ) ) ( not ( = ?auto_3866 ?auto_3871 ) ) ( not ( = ?auto_3866 ?auto_3891 ) ) ( not ( = ?auto_3867 ?auto_3871 ) ) ( not ( = ?auto_3867 ?auto_3891 ) ) ( not ( = ?auto_3868 ?auto_3871 ) ) ( not ( = ?auto_3868 ?auto_3891 ) ) ( not ( = ?auto_3869 ?auto_3871 ) ) ( not ( = ?auto_3869 ?auto_3891 ) ) ( not ( = ?auto_3871 ?auto_3885 ) ) ( not ( = ?auto_3871 ?auto_3887 ) ) ( not ( = ?auto_3871 ?auto_3886 ) ) ( not ( = ?auto_3871 ?auto_3883 ) ) ( not ( = ?auto_3871 ?auto_3879 ) ) ( not ( = ?auto_3871 ?auto_3882 ) ) ( not ( = ?auto_3893 ?auto_3881 ) ) ( not ( = ?auto_3893 ?auto_3888 ) ) ( not ( = ?auto_3893 ?auto_3873 ) ) ( not ( = ?auto_3893 ?auto_3884 ) ) ( not ( = ?auto_3892 ?auto_3880 ) ) ( not ( = ?auto_3892 ?auto_3890 ) ) ( not ( = ?auto_3892 ?auto_3874 ) ) ( not ( = ?auto_3892 ?auto_3889 ) ) ( not ( = ?auto_3891 ?auto_3885 ) ) ( not ( = ?auto_3891 ?auto_3887 ) ) ( not ( = ?auto_3891 ?auto_3886 ) ) ( not ( = ?auto_3891 ?auto_3883 ) ) ( not ( = ?auto_3891 ?auto_3879 ) ) ( not ( = ?auto_3891 ?auto_3882 ) ) ( not ( = ?auto_3864 ?auto_3872 ) ) ( not ( = ?auto_3864 ?auto_3875 ) ) ( not ( = ?auto_3865 ?auto_3872 ) ) ( not ( = ?auto_3865 ?auto_3875 ) ) ( not ( = ?auto_3866 ?auto_3872 ) ) ( not ( = ?auto_3866 ?auto_3875 ) ) ( not ( = ?auto_3867 ?auto_3872 ) ) ( not ( = ?auto_3867 ?auto_3875 ) ) ( not ( = ?auto_3868 ?auto_3872 ) ) ( not ( = ?auto_3868 ?auto_3875 ) ) ( not ( = ?auto_3869 ?auto_3872 ) ) ( not ( = ?auto_3869 ?auto_3875 ) ) ( not ( = ?auto_3870 ?auto_3872 ) ) ( not ( = ?auto_3870 ?auto_3875 ) ) ( not ( = ?auto_3872 ?auto_3891 ) ) ( not ( = ?auto_3872 ?auto_3885 ) ) ( not ( = ?auto_3872 ?auto_3887 ) ) ( not ( = ?auto_3872 ?auto_3886 ) ) ( not ( = ?auto_3872 ?auto_3883 ) ) ( not ( = ?auto_3872 ?auto_3879 ) ) ( not ( = ?auto_3872 ?auto_3882 ) ) ( not ( = ?auto_3875 ?auto_3891 ) ) ( not ( = ?auto_3875 ?auto_3885 ) ) ( not ( = ?auto_3875 ?auto_3887 ) ) ( not ( = ?auto_3875 ?auto_3886 ) ) ( not ( = ?auto_3875 ?auto_3883 ) ) ( not ( = ?auto_3875 ?auto_3879 ) ) ( not ( = ?auto_3875 ?auto_3882 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_3864 ?auto_3865 ?auto_3866 ?auto_3867 ?auto_3868 ?auto_3869 ?auto_3870 ?auto_3871 )
      ( MAKE-1CRATE ?auto_3871 ?auto_3872 )
      ( MAKE-8CRATE-VERIFY ?auto_3864 ?auto_3865 ?auto_3866 ?auto_3867 ?auto_3868 ?auto_3869 ?auto_3870 ?auto_3871 ?auto_3872 ) )
  )

)

