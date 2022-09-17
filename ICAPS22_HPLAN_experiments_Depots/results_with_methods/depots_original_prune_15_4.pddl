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
      ?auto_69622 - SURFACE
      ?auto_69623 - SURFACE
    )
    :vars
    (
      ?auto_69624 - HOIST
      ?auto_69625 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_69624 ?auto_69625 ) ( SURFACE-AT ?auto_69623 ?auto_69625 ) ( CLEAR ?auto_69623 ) ( LIFTING ?auto_69624 ?auto_69622 ) ( IS-CRATE ?auto_69622 ) ( not ( = ?auto_69622 ?auto_69623 ) ) )
    :subtasks
    ( ( !DROP ?auto_69624 ?auto_69622 ?auto_69623 ?auto_69625 )
      ( MAKE-ON-VERIFY ?auto_69622 ?auto_69623 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_69626 - SURFACE
      ?auto_69627 - SURFACE
    )
    :vars
    (
      ?auto_69629 - HOIST
      ?auto_69628 - PLACE
      ?auto_69630 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_69629 ?auto_69628 ) ( SURFACE-AT ?auto_69627 ?auto_69628 ) ( CLEAR ?auto_69627 ) ( IS-CRATE ?auto_69626 ) ( not ( = ?auto_69626 ?auto_69627 ) ) ( TRUCK-AT ?auto_69630 ?auto_69628 ) ( AVAILABLE ?auto_69629 ) ( IN ?auto_69626 ?auto_69630 ) )
    :subtasks
    ( ( !UNLOAD ?auto_69629 ?auto_69626 ?auto_69630 ?auto_69628 )
      ( MAKE-ON ?auto_69626 ?auto_69627 )
      ( MAKE-ON-VERIFY ?auto_69626 ?auto_69627 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_69631 - SURFACE
      ?auto_69632 - SURFACE
    )
    :vars
    (
      ?auto_69634 - HOIST
      ?auto_69635 - PLACE
      ?auto_69633 - TRUCK
      ?auto_69636 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_69634 ?auto_69635 ) ( SURFACE-AT ?auto_69632 ?auto_69635 ) ( CLEAR ?auto_69632 ) ( IS-CRATE ?auto_69631 ) ( not ( = ?auto_69631 ?auto_69632 ) ) ( AVAILABLE ?auto_69634 ) ( IN ?auto_69631 ?auto_69633 ) ( TRUCK-AT ?auto_69633 ?auto_69636 ) ( not ( = ?auto_69636 ?auto_69635 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_69633 ?auto_69636 ?auto_69635 )
      ( MAKE-ON ?auto_69631 ?auto_69632 )
      ( MAKE-ON-VERIFY ?auto_69631 ?auto_69632 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_69637 - SURFACE
      ?auto_69638 - SURFACE
    )
    :vars
    (
      ?auto_69642 - HOIST
      ?auto_69639 - PLACE
      ?auto_69640 - TRUCK
      ?auto_69641 - PLACE
      ?auto_69643 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_69642 ?auto_69639 ) ( SURFACE-AT ?auto_69638 ?auto_69639 ) ( CLEAR ?auto_69638 ) ( IS-CRATE ?auto_69637 ) ( not ( = ?auto_69637 ?auto_69638 ) ) ( AVAILABLE ?auto_69642 ) ( TRUCK-AT ?auto_69640 ?auto_69641 ) ( not ( = ?auto_69641 ?auto_69639 ) ) ( HOIST-AT ?auto_69643 ?auto_69641 ) ( LIFTING ?auto_69643 ?auto_69637 ) ( not ( = ?auto_69642 ?auto_69643 ) ) )
    :subtasks
    ( ( !LOAD ?auto_69643 ?auto_69637 ?auto_69640 ?auto_69641 )
      ( MAKE-ON ?auto_69637 ?auto_69638 )
      ( MAKE-ON-VERIFY ?auto_69637 ?auto_69638 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_69644 - SURFACE
      ?auto_69645 - SURFACE
    )
    :vars
    (
      ?auto_69647 - HOIST
      ?auto_69650 - PLACE
      ?auto_69646 - TRUCK
      ?auto_69648 - PLACE
      ?auto_69649 - HOIST
      ?auto_69651 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_69647 ?auto_69650 ) ( SURFACE-AT ?auto_69645 ?auto_69650 ) ( CLEAR ?auto_69645 ) ( IS-CRATE ?auto_69644 ) ( not ( = ?auto_69644 ?auto_69645 ) ) ( AVAILABLE ?auto_69647 ) ( TRUCK-AT ?auto_69646 ?auto_69648 ) ( not ( = ?auto_69648 ?auto_69650 ) ) ( HOIST-AT ?auto_69649 ?auto_69648 ) ( not ( = ?auto_69647 ?auto_69649 ) ) ( AVAILABLE ?auto_69649 ) ( SURFACE-AT ?auto_69644 ?auto_69648 ) ( ON ?auto_69644 ?auto_69651 ) ( CLEAR ?auto_69644 ) ( not ( = ?auto_69644 ?auto_69651 ) ) ( not ( = ?auto_69645 ?auto_69651 ) ) )
    :subtasks
    ( ( !LIFT ?auto_69649 ?auto_69644 ?auto_69651 ?auto_69648 )
      ( MAKE-ON ?auto_69644 ?auto_69645 )
      ( MAKE-ON-VERIFY ?auto_69644 ?auto_69645 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_69652 - SURFACE
      ?auto_69653 - SURFACE
    )
    :vars
    (
      ?auto_69658 - HOIST
      ?auto_69657 - PLACE
      ?auto_69654 - PLACE
      ?auto_69656 - HOIST
      ?auto_69655 - SURFACE
      ?auto_69659 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_69658 ?auto_69657 ) ( SURFACE-AT ?auto_69653 ?auto_69657 ) ( CLEAR ?auto_69653 ) ( IS-CRATE ?auto_69652 ) ( not ( = ?auto_69652 ?auto_69653 ) ) ( AVAILABLE ?auto_69658 ) ( not ( = ?auto_69654 ?auto_69657 ) ) ( HOIST-AT ?auto_69656 ?auto_69654 ) ( not ( = ?auto_69658 ?auto_69656 ) ) ( AVAILABLE ?auto_69656 ) ( SURFACE-AT ?auto_69652 ?auto_69654 ) ( ON ?auto_69652 ?auto_69655 ) ( CLEAR ?auto_69652 ) ( not ( = ?auto_69652 ?auto_69655 ) ) ( not ( = ?auto_69653 ?auto_69655 ) ) ( TRUCK-AT ?auto_69659 ?auto_69657 ) )
    :subtasks
    ( ( !DRIVE ?auto_69659 ?auto_69657 ?auto_69654 )
      ( MAKE-ON ?auto_69652 ?auto_69653 )
      ( MAKE-ON-VERIFY ?auto_69652 ?auto_69653 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_69700 - SURFACE
      ?auto_69701 - SURFACE
    )
    :vars
    (
      ?auto_69702 - HOIST
      ?auto_69706 - PLACE
      ?auto_69703 - PLACE
      ?auto_69707 - HOIST
      ?auto_69704 - SURFACE
      ?auto_69705 - TRUCK
      ?auto_69708 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_69702 ?auto_69706 ) ( IS-CRATE ?auto_69700 ) ( not ( = ?auto_69700 ?auto_69701 ) ) ( not ( = ?auto_69703 ?auto_69706 ) ) ( HOIST-AT ?auto_69707 ?auto_69703 ) ( not ( = ?auto_69702 ?auto_69707 ) ) ( AVAILABLE ?auto_69707 ) ( SURFACE-AT ?auto_69700 ?auto_69703 ) ( ON ?auto_69700 ?auto_69704 ) ( CLEAR ?auto_69700 ) ( not ( = ?auto_69700 ?auto_69704 ) ) ( not ( = ?auto_69701 ?auto_69704 ) ) ( TRUCK-AT ?auto_69705 ?auto_69706 ) ( SURFACE-AT ?auto_69708 ?auto_69706 ) ( CLEAR ?auto_69708 ) ( LIFTING ?auto_69702 ?auto_69701 ) ( IS-CRATE ?auto_69701 ) ( not ( = ?auto_69700 ?auto_69708 ) ) ( not ( = ?auto_69701 ?auto_69708 ) ) ( not ( = ?auto_69704 ?auto_69708 ) ) )
    :subtasks
    ( ( !DROP ?auto_69702 ?auto_69701 ?auto_69708 ?auto_69706 )
      ( MAKE-ON ?auto_69700 ?auto_69701 )
      ( MAKE-ON-VERIFY ?auto_69700 ?auto_69701 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_69709 - SURFACE
      ?auto_69710 - SURFACE
    )
    :vars
    (
      ?auto_69717 - HOIST
      ?auto_69713 - PLACE
      ?auto_69716 - PLACE
      ?auto_69714 - HOIST
      ?auto_69712 - SURFACE
      ?auto_69711 - TRUCK
      ?auto_69715 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_69717 ?auto_69713 ) ( IS-CRATE ?auto_69709 ) ( not ( = ?auto_69709 ?auto_69710 ) ) ( not ( = ?auto_69716 ?auto_69713 ) ) ( HOIST-AT ?auto_69714 ?auto_69716 ) ( not ( = ?auto_69717 ?auto_69714 ) ) ( AVAILABLE ?auto_69714 ) ( SURFACE-AT ?auto_69709 ?auto_69716 ) ( ON ?auto_69709 ?auto_69712 ) ( CLEAR ?auto_69709 ) ( not ( = ?auto_69709 ?auto_69712 ) ) ( not ( = ?auto_69710 ?auto_69712 ) ) ( TRUCK-AT ?auto_69711 ?auto_69713 ) ( SURFACE-AT ?auto_69715 ?auto_69713 ) ( CLEAR ?auto_69715 ) ( IS-CRATE ?auto_69710 ) ( not ( = ?auto_69709 ?auto_69715 ) ) ( not ( = ?auto_69710 ?auto_69715 ) ) ( not ( = ?auto_69712 ?auto_69715 ) ) ( AVAILABLE ?auto_69717 ) ( IN ?auto_69710 ?auto_69711 ) )
    :subtasks
    ( ( !UNLOAD ?auto_69717 ?auto_69710 ?auto_69711 ?auto_69713 )
      ( MAKE-ON ?auto_69709 ?auto_69710 )
      ( MAKE-ON-VERIFY ?auto_69709 ?auto_69710 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_69724 - SURFACE
      ?auto_69725 - SURFACE
    )
    :vars
    (
      ?auto_69730 - HOIST
      ?auto_69729 - PLACE
      ?auto_69726 - PLACE
      ?auto_69727 - HOIST
      ?auto_69731 - SURFACE
      ?auto_69728 - TRUCK
      ?auto_69732 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_69730 ?auto_69729 ) ( SURFACE-AT ?auto_69725 ?auto_69729 ) ( CLEAR ?auto_69725 ) ( IS-CRATE ?auto_69724 ) ( not ( = ?auto_69724 ?auto_69725 ) ) ( AVAILABLE ?auto_69730 ) ( not ( = ?auto_69726 ?auto_69729 ) ) ( HOIST-AT ?auto_69727 ?auto_69726 ) ( not ( = ?auto_69730 ?auto_69727 ) ) ( AVAILABLE ?auto_69727 ) ( SURFACE-AT ?auto_69724 ?auto_69726 ) ( ON ?auto_69724 ?auto_69731 ) ( CLEAR ?auto_69724 ) ( not ( = ?auto_69724 ?auto_69731 ) ) ( not ( = ?auto_69725 ?auto_69731 ) ) ( TRUCK-AT ?auto_69728 ?auto_69732 ) ( not ( = ?auto_69732 ?auto_69729 ) ) ( not ( = ?auto_69726 ?auto_69732 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_69728 ?auto_69732 ?auto_69729 )
      ( MAKE-ON ?auto_69724 ?auto_69725 )
      ( MAKE-ON-VERIFY ?auto_69724 ?auto_69725 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_70018 - SURFACE
      ?auto_70019 - SURFACE
    )
    :vars
    (
      ?auto_70023 - HOIST
      ?auto_70021 - PLACE
      ?auto_70025 - TRUCK
      ?auto_70020 - PLACE
      ?auto_70022 - HOIST
      ?auto_70024 - SURFACE
      ?auto_70026 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_70023 ?auto_70021 ) ( SURFACE-AT ?auto_70019 ?auto_70021 ) ( CLEAR ?auto_70019 ) ( IS-CRATE ?auto_70018 ) ( not ( = ?auto_70018 ?auto_70019 ) ) ( AVAILABLE ?auto_70023 ) ( TRUCK-AT ?auto_70025 ?auto_70020 ) ( not ( = ?auto_70020 ?auto_70021 ) ) ( HOIST-AT ?auto_70022 ?auto_70020 ) ( not ( = ?auto_70023 ?auto_70022 ) ) ( SURFACE-AT ?auto_70018 ?auto_70020 ) ( ON ?auto_70018 ?auto_70024 ) ( CLEAR ?auto_70018 ) ( not ( = ?auto_70018 ?auto_70024 ) ) ( not ( = ?auto_70019 ?auto_70024 ) ) ( LIFTING ?auto_70022 ?auto_70026 ) ( IS-CRATE ?auto_70026 ) ( not ( = ?auto_70018 ?auto_70026 ) ) ( not ( = ?auto_70019 ?auto_70026 ) ) ( not ( = ?auto_70024 ?auto_70026 ) ) )
    :subtasks
    ( ( !LOAD ?auto_70022 ?auto_70026 ?auto_70025 ?auto_70020 )
      ( MAKE-ON ?auto_70018 ?auto_70019 )
      ( MAKE-ON-VERIFY ?auto_70018 ?auto_70019 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_70146 - SURFACE
      ?auto_70147 - SURFACE
    )
    :vars
    (
      ?auto_70151 - HOIST
      ?auto_70149 - PLACE
      ?auto_70148 - PLACE
      ?auto_70150 - HOIST
      ?auto_70153 - SURFACE
      ?auto_70152 - TRUCK
      ?auto_70154 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_70151 ?auto_70149 ) ( SURFACE-AT ?auto_70147 ?auto_70149 ) ( CLEAR ?auto_70147 ) ( IS-CRATE ?auto_70146 ) ( not ( = ?auto_70146 ?auto_70147 ) ) ( not ( = ?auto_70148 ?auto_70149 ) ) ( HOIST-AT ?auto_70150 ?auto_70148 ) ( not ( = ?auto_70151 ?auto_70150 ) ) ( AVAILABLE ?auto_70150 ) ( SURFACE-AT ?auto_70146 ?auto_70148 ) ( ON ?auto_70146 ?auto_70153 ) ( CLEAR ?auto_70146 ) ( not ( = ?auto_70146 ?auto_70153 ) ) ( not ( = ?auto_70147 ?auto_70153 ) ) ( TRUCK-AT ?auto_70152 ?auto_70149 ) ( LIFTING ?auto_70151 ?auto_70154 ) ( IS-CRATE ?auto_70154 ) ( not ( = ?auto_70146 ?auto_70154 ) ) ( not ( = ?auto_70147 ?auto_70154 ) ) ( not ( = ?auto_70153 ?auto_70154 ) ) )
    :subtasks
    ( ( !LOAD ?auto_70151 ?auto_70154 ?auto_70152 ?auto_70149 )
      ( MAKE-ON ?auto_70146 ?auto_70147 )
      ( MAKE-ON-VERIFY ?auto_70146 ?auto_70147 ) )
  )

)

