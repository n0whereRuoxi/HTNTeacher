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

  ( :method MAKE-9CRATE-VERIFY
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
      ?c9 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( CLEAR ?c9 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-10CRATE-VERIFY
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
      ?c9 - SURFACE
      ?c10 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( CLEAR ?c10 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-11CRATE-VERIFY
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
      ?c9 - SURFACE
      ?c10 - SURFACE
      ?c11 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( ON ?c11 ?c10 ) ( CLEAR ?c11 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_403658 - SURFACE
      ?auto_403659 - SURFACE
    )
    :vars
    (
      ?auto_403660 - HOIST
      ?auto_403661 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_403660 ?auto_403661 ) ( SURFACE-AT ?auto_403658 ?auto_403661 ) ( CLEAR ?auto_403658 ) ( LIFTING ?auto_403660 ?auto_403659 ) ( IS-CRATE ?auto_403659 ) ( not ( = ?auto_403658 ?auto_403659 ) ) )
    :subtasks
    ( ( !DROP ?auto_403660 ?auto_403659 ?auto_403658 ?auto_403661 )
      ( MAKE-1CRATE-VERIFY ?auto_403658 ?auto_403659 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_403662 - SURFACE
      ?auto_403663 - SURFACE
    )
    :vars
    (
      ?auto_403664 - HOIST
      ?auto_403665 - PLACE
      ?auto_403666 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_403664 ?auto_403665 ) ( SURFACE-AT ?auto_403662 ?auto_403665 ) ( CLEAR ?auto_403662 ) ( IS-CRATE ?auto_403663 ) ( not ( = ?auto_403662 ?auto_403663 ) ) ( TRUCK-AT ?auto_403666 ?auto_403665 ) ( AVAILABLE ?auto_403664 ) ( IN ?auto_403663 ?auto_403666 ) )
    :subtasks
    ( ( !UNLOAD ?auto_403664 ?auto_403663 ?auto_403666 ?auto_403665 )
      ( MAKE-1CRATE ?auto_403662 ?auto_403663 )
      ( MAKE-1CRATE-VERIFY ?auto_403662 ?auto_403663 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_403667 - SURFACE
      ?auto_403668 - SURFACE
    )
    :vars
    (
      ?auto_403671 - HOIST
      ?auto_403669 - PLACE
      ?auto_403670 - TRUCK
      ?auto_403672 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_403671 ?auto_403669 ) ( SURFACE-AT ?auto_403667 ?auto_403669 ) ( CLEAR ?auto_403667 ) ( IS-CRATE ?auto_403668 ) ( not ( = ?auto_403667 ?auto_403668 ) ) ( AVAILABLE ?auto_403671 ) ( IN ?auto_403668 ?auto_403670 ) ( TRUCK-AT ?auto_403670 ?auto_403672 ) ( not ( = ?auto_403672 ?auto_403669 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_403670 ?auto_403672 ?auto_403669 )
      ( MAKE-1CRATE ?auto_403667 ?auto_403668 )
      ( MAKE-1CRATE-VERIFY ?auto_403667 ?auto_403668 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_403673 - SURFACE
      ?auto_403674 - SURFACE
    )
    :vars
    (
      ?auto_403675 - HOIST
      ?auto_403677 - PLACE
      ?auto_403676 - TRUCK
      ?auto_403678 - PLACE
      ?auto_403679 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_403675 ?auto_403677 ) ( SURFACE-AT ?auto_403673 ?auto_403677 ) ( CLEAR ?auto_403673 ) ( IS-CRATE ?auto_403674 ) ( not ( = ?auto_403673 ?auto_403674 ) ) ( AVAILABLE ?auto_403675 ) ( TRUCK-AT ?auto_403676 ?auto_403678 ) ( not ( = ?auto_403678 ?auto_403677 ) ) ( HOIST-AT ?auto_403679 ?auto_403678 ) ( LIFTING ?auto_403679 ?auto_403674 ) ( not ( = ?auto_403675 ?auto_403679 ) ) )
    :subtasks
    ( ( !LOAD ?auto_403679 ?auto_403674 ?auto_403676 ?auto_403678 )
      ( MAKE-1CRATE ?auto_403673 ?auto_403674 )
      ( MAKE-1CRATE-VERIFY ?auto_403673 ?auto_403674 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_403680 - SURFACE
      ?auto_403681 - SURFACE
    )
    :vars
    (
      ?auto_403683 - HOIST
      ?auto_403686 - PLACE
      ?auto_403682 - TRUCK
      ?auto_403685 - PLACE
      ?auto_403684 - HOIST
      ?auto_403687 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_403683 ?auto_403686 ) ( SURFACE-AT ?auto_403680 ?auto_403686 ) ( CLEAR ?auto_403680 ) ( IS-CRATE ?auto_403681 ) ( not ( = ?auto_403680 ?auto_403681 ) ) ( AVAILABLE ?auto_403683 ) ( TRUCK-AT ?auto_403682 ?auto_403685 ) ( not ( = ?auto_403685 ?auto_403686 ) ) ( HOIST-AT ?auto_403684 ?auto_403685 ) ( not ( = ?auto_403683 ?auto_403684 ) ) ( AVAILABLE ?auto_403684 ) ( SURFACE-AT ?auto_403681 ?auto_403685 ) ( ON ?auto_403681 ?auto_403687 ) ( CLEAR ?auto_403681 ) ( not ( = ?auto_403680 ?auto_403687 ) ) ( not ( = ?auto_403681 ?auto_403687 ) ) )
    :subtasks
    ( ( !LIFT ?auto_403684 ?auto_403681 ?auto_403687 ?auto_403685 )
      ( MAKE-1CRATE ?auto_403680 ?auto_403681 )
      ( MAKE-1CRATE-VERIFY ?auto_403680 ?auto_403681 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_403688 - SURFACE
      ?auto_403689 - SURFACE
    )
    :vars
    (
      ?auto_403690 - HOIST
      ?auto_403692 - PLACE
      ?auto_403695 - PLACE
      ?auto_403694 - HOIST
      ?auto_403693 - SURFACE
      ?auto_403691 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_403690 ?auto_403692 ) ( SURFACE-AT ?auto_403688 ?auto_403692 ) ( CLEAR ?auto_403688 ) ( IS-CRATE ?auto_403689 ) ( not ( = ?auto_403688 ?auto_403689 ) ) ( AVAILABLE ?auto_403690 ) ( not ( = ?auto_403695 ?auto_403692 ) ) ( HOIST-AT ?auto_403694 ?auto_403695 ) ( not ( = ?auto_403690 ?auto_403694 ) ) ( AVAILABLE ?auto_403694 ) ( SURFACE-AT ?auto_403689 ?auto_403695 ) ( ON ?auto_403689 ?auto_403693 ) ( CLEAR ?auto_403689 ) ( not ( = ?auto_403688 ?auto_403693 ) ) ( not ( = ?auto_403689 ?auto_403693 ) ) ( TRUCK-AT ?auto_403691 ?auto_403692 ) )
    :subtasks
    ( ( !DRIVE ?auto_403691 ?auto_403692 ?auto_403695 )
      ( MAKE-1CRATE ?auto_403688 ?auto_403689 )
      ( MAKE-1CRATE-VERIFY ?auto_403688 ?auto_403689 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_403705 - SURFACE
      ?auto_403706 - SURFACE
      ?auto_403707 - SURFACE
    )
    :vars
    (
      ?auto_403708 - HOIST
      ?auto_403709 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_403708 ?auto_403709 ) ( SURFACE-AT ?auto_403706 ?auto_403709 ) ( CLEAR ?auto_403706 ) ( LIFTING ?auto_403708 ?auto_403707 ) ( IS-CRATE ?auto_403707 ) ( not ( = ?auto_403706 ?auto_403707 ) ) ( ON ?auto_403706 ?auto_403705 ) ( not ( = ?auto_403705 ?auto_403706 ) ) ( not ( = ?auto_403705 ?auto_403707 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_403706 ?auto_403707 )
      ( MAKE-2CRATE-VERIFY ?auto_403705 ?auto_403706 ?auto_403707 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_403715 - SURFACE
      ?auto_403716 - SURFACE
      ?auto_403717 - SURFACE
    )
    :vars
    (
      ?auto_403720 - HOIST
      ?auto_403718 - PLACE
      ?auto_403719 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_403720 ?auto_403718 ) ( SURFACE-AT ?auto_403716 ?auto_403718 ) ( CLEAR ?auto_403716 ) ( IS-CRATE ?auto_403717 ) ( not ( = ?auto_403716 ?auto_403717 ) ) ( TRUCK-AT ?auto_403719 ?auto_403718 ) ( AVAILABLE ?auto_403720 ) ( IN ?auto_403717 ?auto_403719 ) ( ON ?auto_403716 ?auto_403715 ) ( not ( = ?auto_403715 ?auto_403716 ) ) ( not ( = ?auto_403715 ?auto_403717 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_403716 ?auto_403717 )
      ( MAKE-2CRATE-VERIFY ?auto_403715 ?auto_403716 ?auto_403717 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_403721 - SURFACE
      ?auto_403722 - SURFACE
    )
    :vars
    (
      ?auto_403723 - HOIST
      ?auto_403726 - PLACE
      ?auto_403725 - TRUCK
      ?auto_403724 - SURFACE
      ?auto_403727 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_403723 ?auto_403726 ) ( SURFACE-AT ?auto_403721 ?auto_403726 ) ( CLEAR ?auto_403721 ) ( IS-CRATE ?auto_403722 ) ( not ( = ?auto_403721 ?auto_403722 ) ) ( AVAILABLE ?auto_403723 ) ( IN ?auto_403722 ?auto_403725 ) ( ON ?auto_403721 ?auto_403724 ) ( not ( = ?auto_403724 ?auto_403721 ) ) ( not ( = ?auto_403724 ?auto_403722 ) ) ( TRUCK-AT ?auto_403725 ?auto_403727 ) ( not ( = ?auto_403727 ?auto_403726 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_403725 ?auto_403727 ?auto_403726 )
      ( MAKE-2CRATE ?auto_403724 ?auto_403721 ?auto_403722 )
      ( MAKE-1CRATE-VERIFY ?auto_403721 ?auto_403722 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_403728 - SURFACE
      ?auto_403729 - SURFACE
      ?auto_403730 - SURFACE
    )
    :vars
    (
      ?auto_403734 - HOIST
      ?auto_403731 - PLACE
      ?auto_403733 - TRUCK
      ?auto_403732 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_403734 ?auto_403731 ) ( SURFACE-AT ?auto_403729 ?auto_403731 ) ( CLEAR ?auto_403729 ) ( IS-CRATE ?auto_403730 ) ( not ( = ?auto_403729 ?auto_403730 ) ) ( AVAILABLE ?auto_403734 ) ( IN ?auto_403730 ?auto_403733 ) ( ON ?auto_403729 ?auto_403728 ) ( not ( = ?auto_403728 ?auto_403729 ) ) ( not ( = ?auto_403728 ?auto_403730 ) ) ( TRUCK-AT ?auto_403733 ?auto_403732 ) ( not ( = ?auto_403732 ?auto_403731 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_403729 ?auto_403730 )
      ( MAKE-2CRATE-VERIFY ?auto_403728 ?auto_403729 ?auto_403730 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_403735 - SURFACE
      ?auto_403736 - SURFACE
    )
    :vars
    (
      ?auto_403740 - HOIST
      ?auto_403739 - PLACE
      ?auto_403741 - SURFACE
      ?auto_403738 - TRUCK
      ?auto_403737 - PLACE
      ?auto_403742 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_403740 ?auto_403739 ) ( SURFACE-AT ?auto_403735 ?auto_403739 ) ( CLEAR ?auto_403735 ) ( IS-CRATE ?auto_403736 ) ( not ( = ?auto_403735 ?auto_403736 ) ) ( AVAILABLE ?auto_403740 ) ( ON ?auto_403735 ?auto_403741 ) ( not ( = ?auto_403741 ?auto_403735 ) ) ( not ( = ?auto_403741 ?auto_403736 ) ) ( TRUCK-AT ?auto_403738 ?auto_403737 ) ( not ( = ?auto_403737 ?auto_403739 ) ) ( HOIST-AT ?auto_403742 ?auto_403737 ) ( LIFTING ?auto_403742 ?auto_403736 ) ( not ( = ?auto_403740 ?auto_403742 ) ) )
    :subtasks
    ( ( !LOAD ?auto_403742 ?auto_403736 ?auto_403738 ?auto_403737 )
      ( MAKE-2CRATE ?auto_403741 ?auto_403735 ?auto_403736 )
      ( MAKE-1CRATE-VERIFY ?auto_403735 ?auto_403736 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_403743 - SURFACE
      ?auto_403744 - SURFACE
      ?auto_403745 - SURFACE
    )
    :vars
    (
      ?auto_403746 - HOIST
      ?auto_403747 - PLACE
      ?auto_403748 - TRUCK
      ?auto_403749 - PLACE
      ?auto_403750 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_403746 ?auto_403747 ) ( SURFACE-AT ?auto_403744 ?auto_403747 ) ( CLEAR ?auto_403744 ) ( IS-CRATE ?auto_403745 ) ( not ( = ?auto_403744 ?auto_403745 ) ) ( AVAILABLE ?auto_403746 ) ( ON ?auto_403744 ?auto_403743 ) ( not ( = ?auto_403743 ?auto_403744 ) ) ( not ( = ?auto_403743 ?auto_403745 ) ) ( TRUCK-AT ?auto_403748 ?auto_403749 ) ( not ( = ?auto_403749 ?auto_403747 ) ) ( HOIST-AT ?auto_403750 ?auto_403749 ) ( LIFTING ?auto_403750 ?auto_403745 ) ( not ( = ?auto_403746 ?auto_403750 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_403744 ?auto_403745 )
      ( MAKE-2CRATE-VERIFY ?auto_403743 ?auto_403744 ?auto_403745 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_403751 - SURFACE
      ?auto_403752 - SURFACE
    )
    :vars
    (
      ?auto_403755 - HOIST
      ?auto_403754 - PLACE
      ?auto_403756 - SURFACE
      ?auto_403757 - TRUCK
      ?auto_403753 - PLACE
      ?auto_403758 - HOIST
      ?auto_403759 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_403755 ?auto_403754 ) ( SURFACE-AT ?auto_403751 ?auto_403754 ) ( CLEAR ?auto_403751 ) ( IS-CRATE ?auto_403752 ) ( not ( = ?auto_403751 ?auto_403752 ) ) ( AVAILABLE ?auto_403755 ) ( ON ?auto_403751 ?auto_403756 ) ( not ( = ?auto_403756 ?auto_403751 ) ) ( not ( = ?auto_403756 ?auto_403752 ) ) ( TRUCK-AT ?auto_403757 ?auto_403753 ) ( not ( = ?auto_403753 ?auto_403754 ) ) ( HOIST-AT ?auto_403758 ?auto_403753 ) ( not ( = ?auto_403755 ?auto_403758 ) ) ( AVAILABLE ?auto_403758 ) ( SURFACE-AT ?auto_403752 ?auto_403753 ) ( ON ?auto_403752 ?auto_403759 ) ( CLEAR ?auto_403752 ) ( not ( = ?auto_403751 ?auto_403759 ) ) ( not ( = ?auto_403752 ?auto_403759 ) ) ( not ( = ?auto_403756 ?auto_403759 ) ) )
    :subtasks
    ( ( !LIFT ?auto_403758 ?auto_403752 ?auto_403759 ?auto_403753 )
      ( MAKE-2CRATE ?auto_403756 ?auto_403751 ?auto_403752 )
      ( MAKE-1CRATE-VERIFY ?auto_403751 ?auto_403752 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_403760 - SURFACE
      ?auto_403761 - SURFACE
      ?auto_403762 - SURFACE
    )
    :vars
    (
      ?auto_403765 - HOIST
      ?auto_403768 - PLACE
      ?auto_403766 - TRUCK
      ?auto_403763 - PLACE
      ?auto_403767 - HOIST
      ?auto_403764 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_403765 ?auto_403768 ) ( SURFACE-AT ?auto_403761 ?auto_403768 ) ( CLEAR ?auto_403761 ) ( IS-CRATE ?auto_403762 ) ( not ( = ?auto_403761 ?auto_403762 ) ) ( AVAILABLE ?auto_403765 ) ( ON ?auto_403761 ?auto_403760 ) ( not ( = ?auto_403760 ?auto_403761 ) ) ( not ( = ?auto_403760 ?auto_403762 ) ) ( TRUCK-AT ?auto_403766 ?auto_403763 ) ( not ( = ?auto_403763 ?auto_403768 ) ) ( HOIST-AT ?auto_403767 ?auto_403763 ) ( not ( = ?auto_403765 ?auto_403767 ) ) ( AVAILABLE ?auto_403767 ) ( SURFACE-AT ?auto_403762 ?auto_403763 ) ( ON ?auto_403762 ?auto_403764 ) ( CLEAR ?auto_403762 ) ( not ( = ?auto_403761 ?auto_403764 ) ) ( not ( = ?auto_403762 ?auto_403764 ) ) ( not ( = ?auto_403760 ?auto_403764 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_403761 ?auto_403762 )
      ( MAKE-2CRATE-VERIFY ?auto_403760 ?auto_403761 ?auto_403762 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_403769 - SURFACE
      ?auto_403770 - SURFACE
    )
    :vars
    (
      ?auto_403774 - HOIST
      ?auto_403773 - PLACE
      ?auto_403777 - SURFACE
      ?auto_403775 - PLACE
      ?auto_403776 - HOIST
      ?auto_403772 - SURFACE
      ?auto_403771 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_403774 ?auto_403773 ) ( SURFACE-AT ?auto_403769 ?auto_403773 ) ( CLEAR ?auto_403769 ) ( IS-CRATE ?auto_403770 ) ( not ( = ?auto_403769 ?auto_403770 ) ) ( AVAILABLE ?auto_403774 ) ( ON ?auto_403769 ?auto_403777 ) ( not ( = ?auto_403777 ?auto_403769 ) ) ( not ( = ?auto_403777 ?auto_403770 ) ) ( not ( = ?auto_403775 ?auto_403773 ) ) ( HOIST-AT ?auto_403776 ?auto_403775 ) ( not ( = ?auto_403774 ?auto_403776 ) ) ( AVAILABLE ?auto_403776 ) ( SURFACE-AT ?auto_403770 ?auto_403775 ) ( ON ?auto_403770 ?auto_403772 ) ( CLEAR ?auto_403770 ) ( not ( = ?auto_403769 ?auto_403772 ) ) ( not ( = ?auto_403770 ?auto_403772 ) ) ( not ( = ?auto_403777 ?auto_403772 ) ) ( TRUCK-AT ?auto_403771 ?auto_403773 ) )
    :subtasks
    ( ( !DRIVE ?auto_403771 ?auto_403773 ?auto_403775 )
      ( MAKE-2CRATE ?auto_403777 ?auto_403769 ?auto_403770 )
      ( MAKE-1CRATE-VERIFY ?auto_403769 ?auto_403770 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_403778 - SURFACE
      ?auto_403779 - SURFACE
      ?auto_403780 - SURFACE
    )
    :vars
    (
      ?auto_403781 - HOIST
      ?auto_403782 - PLACE
      ?auto_403785 - PLACE
      ?auto_403786 - HOIST
      ?auto_403783 - SURFACE
      ?auto_403784 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_403781 ?auto_403782 ) ( SURFACE-AT ?auto_403779 ?auto_403782 ) ( CLEAR ?auto_403779 ) ( IS-CRATE ?auto_403780 ) ( not ( = ?auto_403779 ?auto_403780 ) ) ( AVAILABLE ?auto_403781 ) ( ON ?auto_403779 ?auto_403778 ) ( not ( = ?auto_403778 ?auto_403779 ) ) ( not ( = ?auto_403778 ?auto_403780 ) ) ( not ( = ?auto_403785 ?auto_403782 ) ) ( HOIST-AT ?auto_403786 ?auto_403785 ) ( not ( = ?auto_403781 ?auto_403786 ) ) ( AVAILABLE ?auto_403786 ) ( SURFACE-AT ?auto_403780 ?auto_403785 ) ( ON ?auto_403780 ?auto_403783 ) ( CLEAR ?auto_403780 ) ( not ( = ?auto_403779 ?auto_403783 ) ) ( not ( = ?auto_403780 ?auto_403783 ) ) ( not ( = ?auto_403778 ?auto_403783 ) ) ( TRUCK-AT ?auto_403784 ?auto_403782 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_403779 ?auto_403780 )
      ( MAKE-2CRATE-VERIFY ?auto_403778 ?auto_403779 ?auto_403780 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_403787 - SURFACE
      ?auto_403788 - SURFACE
    )
    :vars
    (
      ?auto_403794 - HOIST
      ?auto_403792 - PLACE
      ?auto_403790 - SURFACE
      ?auto_403789 - PLACE
      ?auto_403793 - HOIST
      ?auto_403795 - SURFACE
      ?auto_403791 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_403794 ?auto_403792 ) ( IS-CRATE ?auto_403788 ) ( not ( = ?auto_403787 ?auto_403788 ) ) ( not ( = ?auto_403790 ?auto_403787 ) ) ( not ( = ?auto_403790 ?auto_403788 ) ) ( not ( = ?auto_403789 ?auto_403792 ) ) ( HOIST-AT ?auto_403793 ?auto_403789 ) ( not ( = ?auto_403794 ?auto_403793 ) ) ( AVAILABLE ?auto_403793 ) ( SURFACE-AT ?auto_403788 ?auto_403789 ) ( ON ?auto_403788 ?auto_403795 ) ( CLEAR ?auto_403788 ) ( not ( = ?auto_403787 ?auto_403795 ) ) ( not ( = ?auto_403788 ?auto_403795 ) ) ( not ( = ?auto_403790 ?auto_403795 ) ) ( TRUCK-AT ?auto_403791 ?auto_403792 ) ( SURFACE-AT ?auto_403790 ?auto_403792 ) ( CLEAR ?auto_403790 ) ( LIFTING ?auto_403794 ?auto_403787 ) ( IS-CRATE ?auto_403787 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_403790 ?auto_403787 )
      ( MAKE-2CRATE ?auto_403790 ?auto_403787 ?auto_403788 )
      ( MAKE-1CRATE-VERIFY ?auto_403787 ?auto_403788 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_403796 - SURFACE
      ?auto_403797 - SURFACE
      ?auto_403798 - SURFACE
    )
    :vars
    (
      ?auto_403803 - HOIST
      ?auto_403801 - PLACE
      ?auto_403800 - PLACE
      ?auto_403802 - HOIST
      ?auto_403804 - SURFACE
      ?auto_403799 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_403803 ?auto_403801 ) ( IS-CRATE ?auto_403798 ) ( not ( = ?auto_403797 ?auto_403798 ) ) ( not ( = ?auto_403796 ?auto_403797 ) ) ( not ( = ?auto_403796 ?auto_403798 ) ) ( not ( = ?auto_403800 ?auto_403801 ) ) ( HOIST-AT ?auto_403802 ?auto_403800 ) ( not ( = ?auto_403803 ?auto_403802 ) ) ( AVAILABLE ?auto_403802 ) ( SURFACE-AT ?auto_403798 ?auto_403800 ) ( ON ?auto_403798 ?auto_403804 ) ( CLEAR ?auto_403798 ) ( not ( = ?auto_403797 ?auto_403804 ) ) ( not ( = ?auto_403798 ?auto_403804 ) ) ( not ( = ?auto_403796 ?auto_403804 ) ) ( TRUCK-AT ?auto_403799 ?auto_403801 ) ( SURFACE-AT ?auto_403796 ?auto_403801 ) ( CLEAR ?auto_403796 ) ( LIFTING ?auto_403803 ?auto_403797 ) ( IS-CRATE ?auto_403797 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_403797 ?auto_403798 )
      ( MAKE-2CRATE-VERIFY ?auto_403796 ?auto_403797 ?auto_403798 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_403805 - SURFACE
      ?auto_403806 - SURFACE
    )
    :vars
    (
      ?auto_403808 - HOIST
      ?auto_403811 - PLACE
      ?auto_403807 - SURFACE
      ?auto_403809 - PLACE
      ?auto_403810 - HOIST
      ?auto_403812 - SURFACE
      ?auto_403813 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_403808 ?auto_403811 ) ( IS-CRATE ?auto_403806 ) ( not ( = ?auto_403805 ?auto_403806 ) ) ( not ( = ?auto_403807 ?auto_403805 ) ) ( not ( = ?auto_403807 ?auto_403806 ) ) ( not ( = ?auto_403809 ?auto_403811 ) ) ( HOIST-AT ?auto_403810 ?auto_403809 ) ( not ( = ?auto_403808 ?auto_403810 ) ) ( AVAILABLE ?auto_403810 ) ( SURFACE-AT ?auto_403806 ?auto_403809 ) ( ON ?auto_403806 ?auto_403812 ) ( CLEAR ?auto_403806 ) ( not ( = ?auto_403805 ?auto_403812 ) ) ( not ( = ?auto_403806 ?auto_403812 ) ) ( not ( = ?auto_403807 ?auto_403812 ) ) ( TRUCK-AT ?auto_403813 ?auto_403811 ) ( SURFACE-AT ?auto_403807 ?auto_403811 ) ( CLEAR ?auto_403807 ) ( IS-CRATE ?auto_403805 ) ( AVAILABLE ?auto_403808 ) ( IN ?auto_403805 ?auto_403813 ) )
    :subtasks
    ( ( !UNLOAD ?auto_403808 ?auto_403805 ?auto_403813 ?auto_403811 )
      ( MAKE-2CRATE ?auto_403807 ?auto_403805 ?auto_403806 )
      ( MAKE-1CRATE-VERIFY ?auto_403805 ?auto_403806 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_403814 - SURFACE
      ?auto_403815 - SURFACE
      ?auto_403816 - SURFACE
    )
    :vars
    (
      ?auto_403817 - HOIST
      ?auto_403822 - PLACE
      ?auto_403820 - PLACE
      ?auto_403821 - HOIST
      ?auto_403818 - SURFACE
      ?auto_403819 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_403817 ?auto_403822 ) ( IS-CRATE ?auto_403816 ) ( not ( = ?auto_403815 ?auto_403816 ) ) ( not ( = ?auto_403814 ?auto_403815 ) ) ( not ( = ?auto_403814 ?auto_403816 ) ) ( not ( = ?auto_403820 ?auto_403822 ) ) ( HOIST-AT ?auto_403821 ?auto_403820 ) ( not ( = ?auto_403817 ?auto_403821 ) ) ( AVAILABLE ?auto_403821 ) ( SURFACE-AT ?auto_403816 ?auto_403820 ) ( ON ?auto_403816 ?auto_403818 ) ( CLEAR ?auto_403816 ) ( not ( = ?auto_403815 ?auto_403818 ) ) ( not ( = ?auto_403816 ?auto_403818 ) ) ( not ( = ?auto_403814 ?auto_403818 ) ) ( TRUCK-AT ?auto_403819 ?auto_403822 ) ( SURFACE-AT ?auto_403814 ?auto_403822 ) ( CLEAR ?auto_403814 ) ( IS-CRATE ?auto_403815 ) ( AVAILABLE ?auto_403817 ) ( IN ?auto_403815 ?auto_403819 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_403815 ?auto_403816 )
      ( MAKE-2CRATE-VERIFY ?auto_403814 ?auto_403815 ?auto_403816 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_403823 - SURFACE
      ?auto_403824 - SURFACE
    )
    :vars
    (
      ?auto_403831 - HOIST
      ?auto_403827 - PLACE
      ?auto_403825 - SURFACE
      ?auto_403828 - PLACE
      ?auto_403826 - HOIST
      ?auto_403830 - SURFACE
      ?auto_403829 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_403831 ?auto_403827 ) ( IS-CRATE ?auto_403824 ) ( not ( = ?auto_403823 ?auto_403824 ) ) ( not ( = ?auto_403825 ?auto_403823 ) ) ( not ( = ?auto_403825 ?auto_403824 ) ) ( not ( = ?auto_403828 ?auto_403827 ) ) ( HOIST-AT ?auto_403826 ?auto_403828 ) ( not ( = ?auto_403831 ?auto_403826 ) ) ( AVAILABLE ?auto_403826 ) ( SURFACE-AT ?auto_403824 ?auto_403828 ) ( ON ?auto_403824 ?auto_403830 ) ( CLEAR ?auto_403824 ) ( not ( = ?auto_403823 ?auto_403830 ) ) ( not ( = ?auto_403824 ?auto_403830 ) ) ( not ( = ?auto_403825 ?auto_403830 ) ) ( SURFACE-AT ?auto_403825 ?auto_403827 ) ( CLEAR ?auto_403825 ) ( IS-CRATE ?auto_403823 ) ( AVAILABLE ?auto_403831 ) ( IN ?auto_403823 ?auto_403829 ) ( TRUCK-AT ?auto_403829 ?auto_403828 ) )
    :subtasks
    ( ( !DRIVE ?auto_403829 ?auto_403828 ?auto_403827 )
      ( MAKE-2CRATE ?auto_403825 ?auto_403823 ?auto_403824 )
      ( MAKE-1CRATE-VERIFY ?auto_403823 ?auto_403824 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_403832 - SURFACE
      ?auto_403833 - SURFACE
      ?auto_403834 - SURFACE
    )
    :vars
    (
      ?auto_403837 - HOIST
      ?auto_403835 - PLACE
      ?auto_403839 - PLACE
      ?auto_403836 - HOIST
      ?auto_403838 - SURFACE
      ?auto_403840 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_403837 ?auto_403835 ) ( IS-CRATE ?auto_403834 ) ( not ( = ?auto_403833 ?auto_403834 ) ) ( not ( = ?auto_403832 ?auto_403833 ) ) ( not ( = ?auto_403832 ?auto_403834 ) ) ( not ( = ?auto_403839 ?auto_403835 ) ) ( HOIST-AT ?auto_403836 ?auto_403839 ) ( not ( = ?auto_403837 ?auto_403836 ) ) ( AVAILABLE ?auto_403836 ) ( SURFACE-AT ?auto_403834 ?auto_403839 ) ( ON ?auto_403834 ?auto_403838 ) ( CLEAR ?auto_403834 ) ( not ( = ?auto_403833 ?auto_403838 ) ) ( not ( = ?auto_403834 ?auto_403838 ) ) ( not ( = ?auto_403832 ?auto_403838 ) ) ( SURFACE-AT ?auto_403832 ?auto_403835 ) ( CLEAR ?auto_403832 ) ( IS-CRATE ?auto_403833 ) ( AVAILABLE ?auto_403837 ) ( IN ?auto_403833 ?auto_403840 ) ( TRUCK-AT ?auto_403840 ?auto_403839 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_403833 ?auto_403834 )
      ( MAKE-2CRATE-VERIFY ?auto_403832 ?auto_403833 ?auto_403834 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_403841 - SURFACE
      ?auto_403842 - SURFACE
    )
    :vars
    (
      ?auto_403848 - HOIST
      ?auto_403849 - PLACE
      ?auto_403847 - SURFACE
      ?auto_403844 - PLACE
      ?auto_403846 - HOIST
      ?auto_403845 - SURFACE
      ?auto_403843 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_403848 ?auto_403849 ) ( IS-CRATE ?auto_403842 ) ( not ( = ?auto_403841 ?auto_403842 ) ) ( not ( = ?auto_403847 ?auto_403841 ) ) ( not ( = ?auto_403847 ?auto_403842 ) ) ( not ( = ?auto_403844 ?auto_403849 ) ) ( HOIST-AT ?auto_403846 ?auto_403844 ) ( not ( = ?auto_403848 ?auto_403846 ) ) ( SURFACE-AT ?auto_403842 ?auto_403844 ) ( ON ?auto_403842 ?auto_403845 ) ( CLEAR ?auto_403842 ) ( not ( = ?auto_403841 ?auto_403845 ) ) ( not ( = ?auto_403842 ?auto_403845 ) ) ( not ( = ?auto_403847 ?auto_403845 ) ) ( SURFACE-AT ?auto_403847 ?auto_403849 ) ( CLEAR ?auto_403847 ) ( IS-CRATE ?auto_403841 ) ( AVAILABLE ?auto_403848 ) ( TRUCK-AT ?auto_403843 ?auto_403844 ) ( LIFTING ?auto_403846 ?auto_403841 ) )
    :subtasks
    ( ( !LOAD ?auto_403846 ?auto_403841 ?auto_403843 ?auto_403844 )
      ( MAKE-2CRATE ?auto_403847 ?auto_403841 ?auto_403842 )
      ( MAKE-1CRATE-VERIFY ?auto_403841 ?auto_403842 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_403850 - SURFACE
      ?auto_403851 - SURFACE
      ?auto_403852 - SURFACE
    )
    :vars
    (
      ?auto_403854 - HOIST
      ?auto_403857 - PLACE
      ?auto_403853 - PLACE
      ?auto_403856 - HOIST
      ?auto_403855 - SURFACE
      ?auto_403858 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_403854 ?auto_403857 ) ( IS-CRATE ?auto_403852 ) ( not ( = ?auto_403851 ?auto_403852 ) ) ( not ( = ?auto_403850 ?auto_403851 ) ) ( not ( = ?auto_403850 ?auto_403852 ) ) ( not ( = ?auto_403853 ?auto_403857 ) ) ( HOIST-AT ?auto_403856 ?auto_403853 ) ( not ( = ?auto_403854 ?auto_403856 ) ) ( SURFACE-AT ?auto_403852 ?auto_403853 ) ( ON ?auto_403852 ?auto_403855 ) ( CLEAR ?auto_403852 ) ( not ( = ?auto_403851 ?auto_403855 ) ) ( not ( = ?auto_403852 ?auto_403855 ) ) ( not ( = ?auto_403850 ?auto_403855 ) ) ( SURFACE-AT ?auto_403850 ?auto_403857 ) ( CLEAR ?auto_403850 ) ( IS-CRATE ?auto_403851 ) ( AVAILABLE ?auto_403854 ) ( TRUCK-AT ?auto_403858 ?auto_403853 ) ( LIFTING ?auto_403856 ?auto_403851 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_403851 ?auto_403852 )
      ( MAKE-2CRATE-VERIFY ?auto_403850 ?auto_403851 ?auto_403852 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_403859 - SURFACE
      ?auto_403860 - SURFACE
    )
    :vars
    (
      ?auto_403864 - HOIST
      ?auto_403861 - PLACE
      ?auto_403866 - SURFACE
      ?auto_403862 - PLACE
      ?auto_403865 - HOIST
      ?auto_403863 - SURFACE
      ?auto_403867 - TRUCK
      ?auto_403868 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_403864 ?auto_403861 ) ( IS-CRATE ?auto_403860 ) ( not ( = ?auto_403859 ?auto_403860 ) ) ( not ( = ?auto_403866 ?auto_403859 ) ) ( not ( = ?auto_403866 ?auto_403860 ) ) ( not ( = ?auto_403862 ?auto_403861 ) ) ( HOIST-AT ?auto_403865 ?auto_403862 ) ( not ( = ?auto_403864 ?auto_403865 ) ) ( SURFACE-AT ?auto_403860 ?auto_403862 ) ( ON ?auto_403860 ?auto_403863 ) ( CLEAR ?auto_403860 ) ( not ( = ?auto_403859 ?auto_403863 ) ) ( not ( = ?auto_403860 ?auto_403863 ) ) ( not ( = ?auto_403866 ?auto_403863 ) ) ( SURFACE-AT ?auto_403866 ?auto_403861 ) ( CLEAR ?auto_403866 ) ( IS-CRATE ?auto_403859 ) ( AVAILABLE ?auto_403864 ) ( TRUCK-AT ?auto_403867 ?auto_403862 ) ( AVAILABLE ?auto_403865 ) ( SURFACE-AT ?auto_403859 ?auto_403862 ) ( ON ?auto_403859 ?auto_403868 ) ( CLEAR ?auto_403859 ) ( not ( = ?auto_403859 ?auto_403868 ) ) ( not ( = ?auto_403860 ?auto_403868 ) ) ( not ( = ?auto_403866 ?auto_403868 ) ) ( not ( = ?auto_403863 ?auto_403868 ) ) )
    :subtasks
    ( ( !LIFT ?auto_403865 ?auto_403859 ?auto_403868 ?auto_403862 )
      ( MAKE-2CRATE ?auto_403866 ?auto_403859 ?auto_403860 )
      ( MAKE-1CRATE-VERIFY ?auto_403859 ?auto_403860 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_403869 - SURFACE
      ?auto_403870 - SURFACE
      ?auto_403871 - SURFACE
    )
    :vars
    (
      ?auto_403877 - HOIST
      ?auto_403876 - PLACE
      ?auto_403875 - PLACE
      ?auto_403872 - HOIST
      ?auto_403878 - SURFACE
      ?auto_403874 - TRUCK
      ?auto_403873 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_403877 ?auto_403876 ) ( IS-CRATE ?auto_403871 ) ( not ( = ?auto_403870 ?auto_403871 ) ) ( not ( = ?auto_403869 ?auto_403870 ) ) ( not ( = ?auto_403869 ?auto_403871 ) ) ( not ( = ?auto_403875 ?auto_403876 ) ) ( HOIST-AT ?auto_403872 ?auto_403875 ) ( not ( = ?auto_403877 ?auto_403872 ) ) ( SURFACE-AT ?auto_403871 ?auto_403875 ) ( ON ?auto_403871 ?auto_403878 ) ( CLEAR ?auto_403871 ) ( not ( = ?auto_403870 ?auto_403878 ) ) ( not ( = ?auto_403871 ?auto_403878 ) ) ( not ( = ?auto_403869 ?auto_403878 ) ) ( SURFACE-AT ?auto_403869 ?auto_403876 ) ( CLEAR ?auto_403869 ) ( IS-CRATE ?auto_403870 ) ( AVAILABLE ?auto_403877 ) ( TRUCK-AT ?auto_403874 ?auto_403875 ) ( AVAILABLE ?auto_403872 ) ( SURFACE-AT ?auto_403870 ?auto_403875 ) ( ON ?auto_403870 ?auto_403873 ) ( CLEAR ?auto_403870 ) ( not ( = ?auto_403870 ?auto_403873 ) ) ( not ( = ?auto_403871 ?auto_403873 ) ) ( not ( = ?auto_403869 ?auto_403873 ) ) ( not ( = ?auto_403878 ?auto_403873 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_403870 ?auto_403871 )
      ( MAKE-2CRATE-VERIFY ?auto_403869 ?auto_403870 ?auto_403871 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_403879 - SURFACE
      ?auto_403880 - SURFACE
    )
    :vars
    (
      ?auto_403887 - HOIST
      ?auto_403881 - PLACE
      ?auto_403886 - SURFACE
      ?auto_403883 - PLACE
      ?auto_403882 - HOIST
      ?auto_403885 - SURFACE
      ?auto_403888 - SURFACE
      ?auto_403884 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_403887 ?auto_403881 ) ( IS-CRATE ?auto_403880 ) ( not ( = ?auto_403879 ?auto_403880 ) ) ( not ( = ?auto_403886 ?auto_403879 ) ) ( not ( = ?auto_403886 ?auto_403880 ) ) ( not ( = ?auto_403883 ?auto_403881 ) ) ( HOIST-AT ?auto_403882 ?auto_403883 ) ( not ( = ?auto_403887 ?auto_403882 ) ) ( SURFACE-AT ?auto_403880 ?auto_403883 ) ( ON ?auto_403880 ?auto_403885 ) ( CLEAR ?auto_403880 ) ( not ( = ?auto_403879 ?auto_403885 ) ) ( not ( = ?auto_403880 ?auto_403885 ) ) ( not ( = ?auto_403886 ?auto_403885 ) ) ( SURFACE-AT ?auto_403886 ?auto_403881 ) ( CLEAR ?auto_403886 ) ( IS-CRATE ?auto_403879 ) ( AVAILABLE ?auto_403887 ) ( AVAILABLE ?auto_403882 ) ( SURFACE-AT ?auto_403879 ?auto_403883 ) ( ON ?auto_403879 ?auto_403888 ) ( CLEAR ?auto_403879 ) ( not ( = ?auto_403879 ?auto_403888 ) ) ( not ( = ?auto_403880 ?auto_403888 ) ) ( not ( = ?auto_403886 ?auto_403888 ) ) ( not ( = ?auto_403885 ?auto_403888 ) ) ( TRUCK-AT ?auto_403884 ?auto_403881 ) )
    :subtasks
    ( ( !DRIVE ?auto_403884 ?auto_403881 ?auto_403883 )
      ( MAKE-2CRATE ?auto_403886 ?auto_403879 ?auto_403880 )
      ( MAKE-1CRATE-VERIFY ?auto_403879 ?auto_403880 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_403889 - SURFACE
      ?auto_403890 - SURFACE
      ?auto_403891 - SURFACE
    )
    :vars
    (
      ?auto_403894 - HOIST
      ?auto_403897 - PLACE
      ?auto_403893 - PLACE
      ?auto_403892 - HOIST
      ?auto_403895 - SURFACE
      ?auto_403896 - SURFACE
      ?auto_403898 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_403894 ?auto_403897 ) ( IS-CRATE ?auto_403891 ) ( not ( = ?auto_403890 ?auto_403891 ) ) ( not ( = ?auto_403889 ?auto_403890 ) ) ( not ( = ?auto_403889 ?auto_403891 ) ) ( not ( = ?auto_403893 ?auto_403897 ) ) ( HOIST-AT ?auto_403892 ?auto_403893 ) ( not ( = ?auto_403894 ?auto_403892 ) ) ( SURFACE-AT ?auto_403891 ?auto_403893 ) ( ON ?auto_403891 ?auto_403895 ) ( CLEAR ?auto_403891 ) ( not ( = ?auto_403890 ?auto_403895 ) ) ( not ( = ?auto_403891 ?auto_403895 ) ) ( not ( = ?auto_403889 ?auto_403895 ) ) ( SURFACE-AT ?auto_403889 ?auto_403897 ) ( CLEAR ?auto_403889 ) ( IS-CRATE ?auto_403890 ) ( AVAILABLE ?auto_403894 ) ( AVAILABLE ?auto_403892 ) ( SURFACE-AT ?auto_403890 ?auto_403893 ) ( ON ?auto_403890 ?auto_403896 ) ( CLEAR ?auto_403890 ) ( not ( = ?auto_403890 ?auto_403896 ) ) ( not ( = ?auto_403891 ?auto_403896 ) ) ( not ( = ?auto_403889 ?auto_403896 ) ) ( not ( = ?auto_403895 ?auto_403896 ) ) ( TRUCK-AT ?auto_403898 ?auto_403897 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_403890 ?auto_403891 )
      ( MAKE-2CRATE-VERIFY ?auto_403889 ?auto_403890 ?auto_403891 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_403918 - SURFACE
      ?auto_403919 - SURFACE
      ?auto_403920 - SURFACE
      ?auto_403917 - SURFACE
    )
    :vars
    (
      ?auto_403921 - HOIST
      ?auto_403922 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_403921 ?auto_403922 ) ( SURFACE-AT ?auto_403920 ?auto_403922 ) ( CLEAR ?auto_403920 ) ( LIFTING ?auto_403921 ?auto_403917 ) ( IS-CRATE ?auto_403917 ) ( not ( = ?auto_403920 ?auto_403917 ) ) ( ON ?auto_403919 ?auto_403918 ) ( ON ?auto_403920 ?auto_403919 ) ( not ( = ?auto_403918 ?auto_403919 ) ) ( not ( = ?auto_403918 ?auto_403920 ) ) ( not ( = ?auto_403918 ?auto_403917 ) ) ( not ( = ?auto_403919 ?auto_403920 ) ) ( not ( = ?auto_403919 ?auto_403917 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_403920 ?auto_403917 )
      ( MAKE-3CRATE-VERIFY ?auto_403918 ?auto_403919 ?auto_403920 ?auto_403917 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_403935 - SURFACE
      ?auto_403936 - SURFACE
      ?auto_403937 - SURFACE
      ?auto_403934 - SURFACE
    )
    :vars
    (
      ?auto_403938 - HOIST
      ?auto_403939 - PLACE
      ?auto_403940 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_403938 ?auto_403939 ) ( SURFACE-AT ?auto_403937 ?auto_403939 ) ( CLEAR ?auto_403937 ) ( IS-CRATE ?auto_403934 ) ( not ( = ?auto_403937 ?auto_403934 ) ) ( TRUCK-AT ?auto_403940 ?auto_403939 ) ( AVAILABLE ?auto_403938 ) ( IN ?auto_403934 ?auto_403940 ) ( ON ?auto_403937 ?auto_403936 ) ( not ( = ?auto_403936 ?auto_403937 ) ) ( not ( = ?auto_403936 ?auto_403934 ) ) ( ON ?auto_403936 ?auto_403935 ) ( not ( = ?auto_403935 ?auto_403936 ) ) ( not ( = ?auto_403935 ?auto_403937 ) ) ( not ( = ?auto_403935 ?auto_403934 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_403936 ?auto_403937 ?auto_403934 )
      ( MAKE-3CRATE-VERIFY ?auto_403935 ?auto_403936 ?auto_403937 ?auto_403934 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_403956 - SURFACE
      ?auto_403957 - SURFACE
      ?auto_403958 - SURFACE
      ?auto_403955 - SURFACE
    )
    :vars
    (
      ?auto_403960 - HOIST
      ?auto_403962 - PLACE
      ?auto_403959 - TRUCK
      ?auto_403961 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_403960 ?auto_403962 ) ( SURFACE-AT ?auto_403958 ?auto_403962 ) ( CLEAR ?auto_403958 ) ( IS-CRATE ?auto_403955 ) ( not ( = ?auto_403958 ?auto_403955 ) ) ( AVAILABLE ?auto_403960 ) ( IN ?auto_403955 ?auto_403959 ) ( ON ?auto_403958 ?auto_403957 ) ( not ( = ?auto_403957 ?auto_403958 ) ) ( not ( = ?auto_403957 ?auto_403955 ) ) ( TRUCK-AT ?auto_403959 ?auto_403961 ) ( not ( = ?auto_403961 ?auto_403962 ) ) ( ON ?auto_403957 ?auto_403956 ) ( not ( = ?auto_403956 ?auto_403957 ) ) ( not ( = ?auto_403956 ?auto_403958 ) ) ( not ( = ?auto_403956 ?auto_403955 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_403957 ?auto_403958 ?auto_403955 )
      ( MAKE-3CRATE-VERIFY ?auto_403956 ?auto_403957 ?auto_403958 ?auto_403955 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_403980 - SURFACE
      ?auto_403981 - SURFACE
      ?auto_403982 - SURFACE
      ?auto_403979 - SURFACE
    )
    :vars
    (
      ?auto_403985 - HOIST
      ?auto_403984 - PLACE
      ?auto_403987 - TRUCK
      ?auto_403986 - PLACE
      ?auto_403983 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_403985 ?auto_403984 ) ( SURFACE-AT ?auto_403982 ?auto_403984 ) ( CLEAR ?auto_403982 ) ( IS-CRATE ?auto_403979 ) ( not ( = ?auto_403982 ?auto_403979 ) ) ( AVAILABLE ?auto_403985 ) ( ON ?auto_403982 ?auto_403981 ) ( not ( = ?auto_403981 ?auto_403982 ) ) ( not ( = ?auto_403981 ?auto_403979 ) ) ( TRUCK-AT ?auto_403987 ?auto_403986 ) ( not ( = ?auto_403986 ?auto_403984 ) ) ( HOIST-AT ?auto_403983 ?auto_403986 ) ( LIFTING ?auto_403983 ?auto_403979 ) ( not ( = ?auto_403985 ?auto_403983 ) ) ( ON ?auto_403981 ?auto_403980 ) ( not ( = ?auto_403980 ?auto_403981 ) ) ( not ( = ?auto_403980 ?auto_403982 ) ) ( not ( = ?auto_403980 ?auto_403979 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_403981 ?auto_403982 ?auto_403979 )
      ( MAKE-3CRATE-VERIFY ?auto_403980 ?auto_403981 ?auto_403982 ?auto_403979 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_404007 - SURFACE
      ?auto_404008 - SURFACE
      ?auto_404009 - SURFACE
      ?auto_404006 - SURFACE
    )
    :vars
    (
      ?auto_404013 - HOIST
      ?auto_404015 - PLACE
      ?auto_404011 - TRUCK
      ?auto_404014 - PLACE
      ?auto_404012 - HOIST
      ?auto_404010 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_404013 ?auto_404015 ) ( SURFACE-AT ?auto_404009 ?auto_404015 ) ( CLEAR ?auto_404009 ) ( IS-CRATE ?auto_404006 ) ( not ( = ?auto_404009 ?auto_404006 ) ) ( AVAILABLE ?auto_404013 ) ( ON ?auto_404009 ?auto_404008 ) ( not ( = ?auto_404008 ?auto_404009 ) ) ( not ( = ?auto_404008 ?auto_404006 ) ) ( TRUCK-AT ?auto_404011 ?auto_404014 ) ( not ( = ?auto_404014 ?auto_404015 ) ) ( HOIST-AT ?auto_404012 ?auto_404014 ) ( not ( = ?auto_404013 ?auto_404012 ) ) ( AVAILABLE ?auto_404012 ) ( SURFACE-AT ?auto_404006 ?auto_404014 ) ( ON ?auto_404006 ?auto_404010 ) ( CLEAR ?auto_404006 ) ( not ( = ?auto_404009 ?auto_404010 ) ) ( not ( = ?auto_404006 ?auto_404010 ) ) ( not ( = ?auto_404008 ?auto_404010 ) ) ( ON ?auto_404008 ?auto_404007 ) ( not ( = ?auto_404007 ?auto_404008 ) ) ( not ( = ?auto_404007 ?auto_404009 ) ) ( not ( = ?auto_404007 ?auto_404006 ) ) ( not ( = ?auto_404007 ?auto_404010 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_404008 ?auto_404009 ?auto_404006 )
      ( MAKE-3CRATE-VERIFY ?auto_404007 ?auto_404008 ?auto_404009 ?auto_404006 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_404035 - SURFACE
      ?auto_404036 - SURFACE
      ?auto_404037 - SURFACE
      ?auto_404034 - SURFACE
    )
    :vars
    (
      ?auto_404039 - HOIST
      ?auto_404040 - PLACE
      ?auto_404038 - PLACE
      ?auto_404042 - HOIST
      ?auto_404043 - SURFACE
      ?auto_404041 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_404039 ?auto_404040 ) ( SURFACE-AT ?auto_404037 ?auto_404040 ) ( CLEAR ?auto_404037 ) ( IS-CRATE ?auto_404034 ) ( not ( = ?auto_404037 ?auto_404034 ) ) ( AVAILABLE ?auto_404039 ) ( ON ?auto_404037 ?auto_404036 ) ( not ( = ?auto_404036 ?auto_404037 ) ) ( not ( = ?auto_404036 ?auto_404034 ) ) ( not ( = ?auto_404038 ?auto_404040 ) ) ( HOIST-AT ?auto_404042 ?auto_404038 ) ( not ( = ?auto_404039 ?auto_404042 ) ) ( AVAILABLE ?auto_404042 ) ( SURFACE-AT ?auto_404034 ?auto_404038 ) ( ON ?auto_404034 ?auto_404043 ) ( CLEAR ?auto_404034 ) ( not ( = ?auto_404037 ?auto_404043 ) ) ( not ( = ?auto_404034 ?auto_404043 ) ) ( not ( = ?auto_404036 ?auto_404043 ) ) ( TRUCK-AT ?auto_404041 ?auto_404040 ) ( ON ?auto_404036 ?auto_404035 ) ( not ( = ?auto_404035 ?auto_404036 ) ) ( not ( = ?auto_404035 ?auto_404037 ) ) ( not ( = ?auto_404035 ?auto_404034 ) ) ( not ( = ?auto_404035 ?auto_404043 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_404036 ?auto_404037 ?auto_404034 )
      ( MAKE-3CRATE-VERIFY ?auto_404035 ?auto_404036 ?auto_404037 ?auto_404034 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_404063 - SURFACE
      ?auto_404064 - SURFACE
      ?auto_404065 - SURFACE
      ?auto_404062 - SURFACE
    )
    :vars
    (
      ?auto_404068 - HOIST
      ?auto_404067 - PLACE
      ?auto_404071 - PLACE
      ?auto_404070 - HOIST
      ?auto_404066 - SURFACE
      ?auto_404069 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_404068 ?auto_404067 ) ( IS-CRATE ?auto_404062 ) ( not ( = ?auto_404065 ?auto_404062 ) ) ( not ( = ?auto_404064 ?auto_404065 ) ) ( not ( = ?auto_404064 ?auto_404062 ) ) ( not ( = ?auto_404071 ?auto_404067 ) ) ( HOIST-AT ?auto_404070 ?auto_404071 ) ( not ( = ?auto_404068 ?auto_404070 ) ) ( AVAILABLE ?auto_404070 ) ( SURFACE-AT ?auto_404062 ?auto_404071 ) ( ON ?auto_404062 ?auto_404066 ) ( CLEAR ?auto_404062 ) ( not ( = ?auto_404065 ?auto_404066 ) ) ( not ( = ?auto_404062 ?auto_404066 ) ) ( not ( = ?auto_404064 ?auto_404066 ) ) ( TRUCK-AT ?auto_404069 ?auto_404067 ) ( SURFACE-AT ?auto_404064 ?auto_404067 ) ( CLEAR ?auto_404064 ) ( LIFTING ?auto_404068 ?auto_404065 ) ( IS-CRATE ?auto_404065 ) ( ON ?auto_404064 ?auto_404063 ) ( not ( = ?auto_404063 ?auto_404064 ) ) ( not ( = ?auto_404063 ?auto_404065 ) ) ( not ( = ?auto_404063 ?auto_404062 ) ) ( not ( = ?auto_404063 ?auto_404066 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_404064 ?auto_404065 ?auto_404062 )
      ( MAKE-3CRATE-VERIFY ?auto_404063 ?auto_404064 ?auto_404065 ?auto_404062 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_404091 - SURFACE
      ?auto_404092 - SURFACE
      ?auto_404093 - SURFACE
      ?auto_404090 - SURFACE
    )
    :vars
    (
      ?auto_404096 - HOIST
      ?auto_404098 - PLACE
      ?auto_404094 - PLACE
      ?auto_404097 - HOIST
      ?auto_404099 - SURFACE
      ?auto_404095 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_404096 ?auto_404098 ) ( IS-CRATE ?auto_404090 ) ( not ( = ?auto_404093 ?auto_404090 ) ) ( not ( = ?auto_404092 ?auto_404093 ) ) ( not ( = ?auto_404092 ?auto_404090 ) ) ( not ( = ?auto_404094 ?auto_404098 ) ) ( HOIST-AT ?auto_404097 ?auto_404094 ) ( not ( = ?auto_404096 ?auto_404097 ) ) ( AVAILABLE ?auto_404097 ) ( SURFACE-AT ?auto_404090 ?auto_404094 ) ( ON ?auto_404090 ?auto_404099 ) ( CLEAR ?auto_404090 ) ( not ( = ?auto_404093 ?auto_404099 ) ) ( not ( = ?auto_404090 ?auto_404099 ) ) ( not ( = ?auto_404092 ?auto_404099 ) ) ( TRUCK-AT ?auto_404095 ?auto_404098 ) ( SURFACE-AT ?auto_404092 ?auto_404098 ) ( CLEAR ?auto_404092 ) ( IS-CRATE ?auto_404093 ) ( AVAILABLE ?auto_404096 ) ( IN ?auto_404093 ?auto_404095 ) ( ON ?auto_404092 ?auto_404091 ) ( not ( = ?auto_404091 ?auto_404092 ) ) ( not ( = ?auto_404091 ?auto_404093 ) ) ( not ( = ?auto_404091 ?auto_404090 ) ) ( not ( = ?auto_404091 ?auto_404099 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_404092 ?auto_404093 ?auto_404090 )
      ( MAKE-3CRATE-VERIFY ?auto_404091 ?auto_404092 ?auto_404093 ?auto_404090 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_404169 - SURFACE
      ?auto_404170 - SURFACE
    )
    :vars
    (
      ?auto_404172 - HOIST
      ?auto_404173 - PLACE
      ?auto_404171 - SURFACE
      ?auto_404177 - PLACE
      ?auto_404175 - HOIST
      ?auto_404174 - SURFACE
      ?auto_404176 - TRUCK
      ?auto_404178 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_404172 ?auto_404173 ) ( SURFACE-AT ?auto_404169 ?auto_404173 ) ( CLEAR ?auto_404169 ) ( IS-CRATE ?auto_404170 ) ( not ( = ?auto_404169 ?auto_404170 ) ) ( AVAILABLE ?auto_404172 ) ( ON ?auto_404169 ?auto_404171 ) ( not ( = ?auto_404171 ?auto_404169 ) ) ( not ( = ?auto_404171 ?auto_404170 ) ) ( not ( = ?auto_404177 ?auto_404173 ) ) ( HOIST-AT ?auto_404175 ?auto_404177 ) ( not ( = ?auto_404172 ?auto_404175 ) ) ( AVAILABLE ?auto_404175 ) ( SURFACE-AT ?auto_404170 ?auto_404177 ) ( ON ?auto_404170 ?auto_404174 ) ( CLEAR ?auto_404170 ) ( not ( = ?auto_404169 ?auto_404174 ) ) ( not ( = ?auto_404170 ?auto_404174 ) ) ( not ( = ?auto_404171 ?auto_404174 ) ) ( TRUCK-AT ?auto_404176 ?auto_404178 ) ( not ( = ?auto_404178 ?auto_404173 ) ) ( not ( = ?auto_404177 ?auto_404178 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_404176 ?auto_404178 ?auto_404173 )
      ( MAKE-1CRATE ?auto_404169 ?auto_404170 )
      ( MAKE-1CRATE-VERIFY ?auto_404169 ?auto_404170 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_404275 - SURFACE
      ?auto_404276 - SURFACE
    )
    :vars
    (
      ?auto_404278 - HOIST
      ?auto_404279 - PLACE
      ?auto_404281 - SURFACE
      ?auto_404283 - PLACE
      ?auto_404277 - HOIST
      ?auto_404280 - SURFACE
      ?auto_404282 - TRUCK
      ?auto_404284 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_404278 ?auto_404279 ) ( SURFACE-AT ?auto_404275 ?auto_404279 ) ( CLEAR ?auto_404275 ) ( IS-CRATE ?auto_404276 ) ( not ( = ?auto_404275 ?auto_404276 ) ) ( ON ?auto_404275 ?auto_404281 ) ( not ( = ?auto_404281 ?auto_404275 ) ) ( not ( = ?auto_404281 ?auto_404276 ) ) ( not ( = ?auto_404283 ?auto_404279 ) ) ( HOIST-AT ?auto_404277 ?auto_404283 ) ( not ( = ?auto_404278 ?auto_404277 ) ) ( AVAILABLE ?auto_404277 ) ( SURFACE-AT ?auto_404276 ?auto_404283 ) ( ON ?auto_404276 ?auto_404280 ) ( CLEAR ?auto_404276 ) ( not ( = ?auto_404275 ?auto_404280 ) ) ( not ( = ?auto_404276 ?auto_404280 ) ) ( not ( = ?auto_404281 ?auto_404280 ) ) ( TRUCK-AT ?auto_404282 ?auto_404279 ) ( LIFTING ?auto_404278 ?auto_404284 ) ( IS-CRATE ?auto_404284 ) ( not ( = ?auto_404275 ?auto_404284 ) ) ( not ( = ?auto_404276 ?auto_404284 ) ) ( not ( = ?auto_404281 ?auto_404284 ) ) ( not ( = ?auto_404280 ?auto_404284 ) ) )
    :subtasks
    ( ( !LOAD ?auto_404278 ?auto_404284 ?auto_404282 ?auto_404279 )
      ( MAKE-1CRATE ?auto_404275 ?auto_404276 )
      ( MAKE-1CRATE-VERIFY ?auto_404275 ?auto_404276 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_404384 - SURFACE
      ?auto_404385 - SURFACE
      ?auto_404386 - SURFACE
      ?auto_404383 - SURFACE
      ?auto_404387 - SURFACE
    )
    :vars
    (
      ?auto_404388 - HOIST
      ?auto_404389 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_404388 ?auto_404389 ) ( SURFACE-AT ?auto_404383 ?auto_404389 ) ( CLEAR ?auto_404383 ) ( LIFTING ?auto_404388 ?auto_404387 ) ( IS-CRATE ?auto_404387 ) ( not ( = ?auto_404383 ?auto_404387 ) ) ( ON ?auto_404385 ?auto_404384 ) ( ON ?auto_404386 ?auto_404385 ) ( ON ?auto_404383 ?auto_404386 ) ( not ( = ?auto_404384 ?auto_404385 ) ) ( not ( = ?auto_404384 ?auto_404386 ) ) ( not ( = ?auto_404384 ?auto_404383 ) ) ( not ( = ?auto_404384 ?auto_404387 ) ) ( not ( = ?auto_404385 ?auto_404386 ) ) ( not ( = ?auto_404385 ?auto_404383 ) ) ( not ( = ?auto_404385 ?auto_404387 ) ) ( not ( = ?auto_404386 ?auto_404383 ) ) ( not ( = ?auto_404386 ?auto_404387 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_404383 ?auto_404387 )
      ( MAKE-4CRATE-VERIFY ?auto_404384 ?auto_404385 ?auto_404386 ?auto_404383 ?auto_404387 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_404409 - SURFACE
      ?auto_404410 - SURFACE
      ?auto_404411 - SURFACE
      ?auto_404408 - SURFACE
      ?auto_404412 - SURFACE
    )
    :vars
    (
      ?auto_404415 - HOIST
      ?auto_404413 - PLACE
      ?auto_404414 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_404415 ?auto_404413 ) ( SURFACE-AT ?auto_404408 ?auto_404413 ) ( CLEAR ?auto_404408 ) ( IS-CRATE ?auto_404412 ) ( not ( = ?auto_404408 ?auto_404412 ) ) ( TRUCK-AT ?auto_404414 ?auto_404413 ) ( AVAILABLE ?auto_404415 ) ( IN ?auto_404412 ?auto_404414 ) ( ON ?auto_404408 ?auto_404411 ) ( not ( = ?auto_404411 ?auto_404408 ) ) ( not ( = ?auto_404411 ?auto_404412 ) ) ( ON ?auto_404410 ?auto_404409 ) ( ON ?auto_404411 ?auto_404410 ) ( not ( = ?auto_404409 ?auto_404410 ) ) ( not ( = ?auto_404409 ?auto_404411 ) ) ( not ( = ?auto_404409 ?auto_404408 ) ) ( not ( = ?auto_404409 ?auto_404412 ) ) ( not ( = ?auto_404410 ?auto_404411 ) ) ( not ( = ?auto_404410 ?auto_404408 ) ) ( not ( = ?auto_404410 ?auto_404412 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_404411 ?auto_404408 ?auto_404412 )
      ( MAKE-4CRATE-VERIFY ?auto_404409 ?auto_404410 ?auto_404411 ?auto_404408 ?auto_404412 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_404439 - SURFACE
      ?auto_404440 - SURFACE
      ?auto_404441 - SURFACE
      ?auto_404438 - SURFACE
      ?auto_404442 - SURFACE
    )
    :vars
    (
      ?auto_404443 - HOIST
      ?auto_404446 - PLACE
      ?auto_404445 - TRUCK
      ?auto_404444 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_404443 ?auto_404446 ) ( SURFACE-AT ?auto_404438 ?auto_404446 ) ( CLEAR ?auto_404438 ) ( IS-CRATE ?auto_404442 ) ( not ( = ?auto_404438 ?auto_404442 ) ) ( AVAILABLE ?auto_404443 ) ( IN ?auto_404442 ?auto_404445 ) ( ON ?auto_404438 ?auto_404441 ) ( not ( = ?auto_404441 ?auto_404438 ) ) ( not ( = ?auto_404441 ?auto_404442 ) ) ( TRUCK-AT ?auto_404445 ?auto_404444 ) ( not ( = ?auto_404444 ?auto_404446 ) ) ( ON ?auto_404440 ?auto_404439 ) ( ON ?auto_404441 ?auto_404440 ) ( not ( = ?auto_404439 ?auto_404440 ) ) ( not ( = ?auto_404439 ?auto_404441 ) ) ( not ( = ?auto_404439 ?auto_404438 ) ) ( not ( = ?auto_404439 ?auto_404442 ) ) ( not ( = ?auto_404440 ?auto_404441 ) ) ( not ( = ?auto_404440 ?auto_404438 ) ) ( not ( = ?auto_404440 ?auto_404442 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_404441 ?auto_404438 ?auto_404442 )
      ( MAKE-4CRATE-VERIFY ?auto_404439 ?auto_404440 ?auto_404441 ?auto_404438 ?auto_404442 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_404473 - SURFACE
      ?auto_404474 - SURFACE
      ?auto_404475 - SURFACE
      ?auto_404472 - SURFACE
      ?auto_404476 - SURFACE
    )
    :vars
    (
      ?auto_404481 - HOIST
      ?auto_404479 - PLACE
      ?auto_404478 - TRUCK
      ?auto_404480 - PLACE
      ?auto_404477 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_404481 ?auto_404479 ) ( SURFACE-AT ?auto_404472 ?auto_404479 ) ( CLEAR ?auto_404472 ) ( IS-CRATE ?auto_404476 ) ( not ( = ?auto_404472 ?auto_404476 ) ) ( AVAILABLE ?auto_404481 ) ( ON ?auto_404472 ?auto_404475 ) ( not ( = ?auto_404475 ?auto_404472 ) ) ( not ( = ?auto_404475 ?auto_404476 ) ) ( TRUCK-AT ?auto_404478 ?auto_404480 ) ( not ( = ?auto_404480 ?auto_404479 ) ) ( HOIST-AT ?auto_404477 ?auto_404480 ) ( LIFTING ?auto_404477 ?auto_404476 ) ( not ( = ?auto_404481 ?auto_404477 ) ) ( ON ?auto_404474 ?auto_404473 ) ( ON ?auto_404475 ?auto_404474 ) ( not ( = ?auto_404473 ?auto_404474 ) ) ( not ( = ?auto_404473 ?auto_404475 ) ) ( not ( = ?auto_404473 ?auto_404472 ) ) ( not ( = ?auto_404473 ?auto_404476 ) ) ( not ( = ?auto_404474 ?auto_404475 ) ) ( not ( = ?auto_404474 ?auto_404472 ) ) ( not ( = ?auto_404474 ?auto_404476 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_404475 ?auto_404472 ?auto_404476 )
      ( MAKE-4CRATE-VERIFY ?auto_404473 ?auto_404474 ?auto_404475 ?auto_404472 ?auto_404476 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_404511 - SURFACE
      ?auto_404512 - SURFACE
      ?auto_404513 - SURFACE
      ?auto_404510 - SURFACE
      ?auto_404514 - SURFACE
    )
    :vars
    (
      ?auto_404515 - HOIST
      ?auto_404518 - PLACE
      ?auto_404520 - TRUCK
      ?auto_404519 - PLACE
      ?auto_404516 - HOIST
      ?auto_404517 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_404515 ?auto_404518 ) ( SURFACE-AT ?auto_404510 ?auto_404518 ) ( CLEAR ?auto_404510 ) ( IS-CRATE ?auto_404514 ) ( not ( = ?auto_404510 ?auto_404514 ) ) ( AVAILABLE ?auto_404515 ) ( ON ?auto_404510 ?auto_404513 ) ( not ( = ?auto_404513 ?auto_404510 ) ) ( not ( = ?auto_404513 ?auto_404514 ) ) ( TRUCK-AT ?auto_404520 ?auto_404519 ) ( not ( = ?auto_404519 ?auto_404518 ) ) ( HOIST-AT ?auto_404516 ?auto_404519 ) ( not ( = ?auto_404515 ?auto_404516 ) ) ( AVAILABLE ?auto_404516 ) ( SURFACE-AT ?auto_404514 ?auto_404519 ) ( ON ?auto_404514 ?auto_404517 ) ( CLEAR ?auto_404514 ) ( not ( = ?auto_404510 ?auto_404517 ) ) ( not ( = ?auto_404514 ?auto_404517 ) ) ( not ( = ?auto_404513 ?auto_404517 ) ) ( ON ?auto_404512 ?auto_404511 ) ( ON ?auto_404513 ?auto_404512 ) ( not ( = ?auto_404511 ?auto_404512 ) ) ( not ( = ?auto_404511 ?auto_404513 ) ) ( not ( = ?auto_404511 ?auto_404510 ) ) ( not ( = ?auto_404511 ?auto_404514 ) ) ( not ( = ?auto_404511 ?auto_404517 ) ) ( not ( = ?auto_404512 ?auto_404513 ) ) ( not ( = ?auto_404512 ?auto_404510 ) ) ( not ( = ?auto_404512 ?auto_404514 ) ) ( not ( = ?auto_404512 ?auto_404517 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_404513 ?auto_404510 ?auto_404514 )
      ( MAKE-4CRATE-VERIFY ?auto_404511 ?auto_404512 ?auto_404513 ?auto_404510 ?auto_404514 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_404550 - SURFACE
      ?auto_404551 - SURFACE
      ?auto_404552 - SURFACE
      ?auto_404549 - SURFACE
      ?auto_404553 - SURFACE
    )
    :vars
    (
      ?auto_404558 - HOIST
      ?auto_404554 - PLACE
      ?auto_404557 - PLACE
      ?auto_404556 - HOIST
      ?auto_404559 - SURFACE
      ?auto_404555 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_404558 ?auto_404554 ) ( SURFACE-AT ?auto_404549 ?auto_404554 ) ( CLEAR ?auto_404549 ) ( IS-CRATE ?auto_404553 ) ( not ( = ?auto_404549 ?auto_404553 ) ) ( AVAILABLE ?auto_404558 ) ( ON ?auto_404549 ?auto_404552 ) ( not ( = ?auto_404552 ?auto_404549 ) ) ( not ( = ?auto_404552 ?auto_404553 ) ) ( not ( = ?auto_404557 ?auto_404554 ) ) ( HOIST-AT ?auto_404556 ?auto_404557 ) ( not ( = ?auto_404558 ?auto_404556 ) ) ( AVAILABLE ?auto_404556 ) ( SURFACE-AT ?auto_404553 ?auto_404557 ) ( ON ?auto_404553 ?auto_404559 ) ( CLEAR ?auto_404553 ) ( not ( = ?auto_404549 ?auto_404559 ) ) ( not ( = ?auto_404553 ?auto_404559 ) ) ( not ( = ?auto_404552 ?auto_404559 ) ) ( TRUCK-AT ?auto_404555 ?auto_404554 ) ( ON ?auto_404551 ?auto_404550 ) ( ON ?auto_404552 ?auto_404551 ) ( not ( = ?auto_404550 ?auto_404551 ) ) ( not ( = ?auto_404550 ?auto_404552 ) ) ( not ( = ?auto_404550 ?auto_404549 ) ) ( not ( = ?auto_404550 ?auto_404553 ) ) ( not ( = ?auto_404550 ?auto_404559 ) ) ( not ( = ?auto_404551 ?auto_404552 ) ) ( not ( = ?auto_404551 ?auto_404549 ) ) ( not ( = ?auto_404551 ?auto_404553 ) ) ( not ( = ?auto_404551 ?auto_404559 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_404552 ?auto_404549 ?auto_404553 )
      ( MAKE-4CRATE-VERIFY ?auto_404550 ?auto_404551 ?auto_404552 ?auto_404549 ?auto_404553 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_404589 - SURFACE
      ?auto_404590 - SURFACE
      ?auto_404591 - SURFACE
      ?auto_404588 - SURFACE
      ?auto_404592 - SURFACE
    )
    :vars
    (
      ?auto_404596 - HOIST
      ?auto_404593 - PLACE
      ?auto_404594 - PLACE
      ?auto_404598 - HOIST
      ?auto_404597 - SURFACE
      ?auto_404595 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_404596 ?auto_404593 ) ( IS-CRATE ?auto_404592 ) ( not ( = ?auto_404588 ?auto_404592 ) ) ( not ( = ?auto_404591 ?auto_404588 ) ) ( not ( = ?auto_404591 ?auto_404592 ) ) ( not ( = ?auto_404594 ?auto_404593 ) ) ( HOIST-AT ?auto_404598 ?auto_404594 ) ( not ( = ?auto_404596 ?auto_404598 ) ) ( AVAILABLE ?auto_404598 ) ( SURFACE-AT ?auto_404592 ?auto_404594 ) ( ON ?auto_404592 ?auto_404597 ) ( CLEAR ?auto_404592 ) ( not ( = ?auto_404588 ?auto_404597 ) ) ( not ( = ?auto_404592 ?auto_404597 ) ) ( not ( = ?auto_404591 ?auto_404597 ) ) ( TRUCK-AT ?auto_404595 ?auto_404593 ) ( SURFACE-AT ?auto_404591 ?auto_404593 ) ( CLEAR ?auto_404591 ) ( LIFTING ?auto_404596 ?auto_404588 ) ( IS-CRATE ?auto_404588 ) ( ON ?auto_404590 ?auto_404589 ) ( ON ?auto_404591 ?auto_404590 ) ( not ( = ?auto_404589 ?auto_404590 ) ) ( not ( = ?auto_404589 ?auto_404591 ) ) ( not ( = ?auto_404589 ?auto_404588 ) ) ( not ( = ?auto_404589 ?auto_404592 ) ) ( not ( = ?auto_404589 ?auto_404597 ) ) ( not ( = ?auto_404590 ?auto_404591 ) ) ( not ( = ?auto_404590 ?auto_404588 ) ) ( not ( = ?auto_404590 ?auto_404592 ) ) ( not ( = ?auto_404590 ?auto_404597 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_404591 ?auto_404588 ?auto_404592 )
      ( MAKE-4CRATE-VERIFY ?auto_404589 ?auto_404590 ?auto_404591 ?auto_404588 ?auto_404592 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_404628 - SURFACE
      ?auto_404629 - SURFACE
      ?auto_404630 - SURFACE
      ?auto_404627 - SURFACE
      ?auto_404631 - SURFACE
    )
    :vars
    (
      ?auto_404632 - HOIST
      ?auto_404637 - PLACE
      ?auto_404634 - PLACE
      ?auto_404636 - HOIST
      ?auto_404635 - SURFACE
      ?auto_404633 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_404632 ?auto_404637 ) ( IS-CRATE ?auto_404631 ) ( not ( = ?auto_404627 ?auto_404631 ) ) ( not ( = ?auto_404630 ?auto_404627 ) ) ( not ( = ?auto_404630 ?auto_404631 ) ) ( not ( = ?auto_404634 ?auto_404637 ) ) ( HOIST-AT ?auto_404636 ?auto_404634 ) ( not ( = ?auto_404632 ?auto_404636 ) ) ( AVAILABLE ?auto_404636 ) ( SURFACE-AT ?auto_404631 ?auto_404634 ) ( ON ?auto_404631 ?auto_404635 ) ( CLEAR ?auto_404631 ) ( not ( = ?auto_404627 ?auto_404635 ) ) ( not ( = ?auto_404631 ?auto_404635 ) ) ( not ( = ?auto_404630 ?auto_404635 ) ) ( TRUCK-AT ?auto_404633 ?auto_404637 ) ( SURFACE-AT ?auto_404630 ?auto_404637 ) ( CLEAR ?auto_404630 ) ( IS-CRATE ?auto_404627 ) ( AVAILABLE ?auto_404632 ) ( IN ?auto_404627 ?auto_404633 ) ( ON ?auto_404629 ?auto_404628 ) ( ON ?auto_404630 ?auto_404629 ) ( not ( = ?auto_404628 ?auto_404629 ) ) ( not ( = ?auto_404628 ?auto_404630 ) ) ( not ( = ?auto_404628 ?auto_404627 ) ) ( not ( = ?auto_404628 ?auto_404631 ) ) ( not ( = ?auto_404628 ?auto_404635 ) ) ( not ( = ?auto_404629 ?auto_404630 ) ) ( not ( = ?auto_404629 ?auto_404627 ) ) ( not ( = ?auto_404629 ?auto_404631 ) ) ( not ( = ?auto_404629 ?auto_404635 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_404630 ?auto_404627 ?auto_404631 )
      ( MAKE-4CRATE-VERIFY ?auto_404628 ?auto_404629 ?auto_404630 ?auto_404627 ?auto_404631 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_405288 - SURFACE
      ?auto_405289 - SURFACE
      ?auto_405290 - SURFACE
      ?auto_405287 - SURFACE
      ?auto_405291 - SURFACE
      ?auto_405292 - SURFACE
    )
    :vars
    (
      ?auto_405293 - HOIST
      ?auto_405294 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_405293 ?auto_405294 ) ( SURFACE-AT ?auto_405291 ?auto_405294 ) ( CLEAR ?auto_405291 ) ( LIFTING ?auto_405293 ?auto_405292 ) ( IS-CRATE ?auto_405292 ) ( not ( = ?auto_405291 ?auto_405292 ) ) ( ON ?auto_405289 ?auto_405288 ) ( ON ?auto_405290 ?auto_405289 ) ( ON ?auto_405287 ?auto_405290 ) ( ON ?auto_405291 ?auto_405287 ) ( not ( = ?auto_405288 ?auto_405289 ) ) ( not ( = ?auto_405288 ?auto_405290 ) ) ( not ( = ?auto_405288 ?auto_405287 ) ) ( not ( = ?auto_405288 ?auto_405291 ) ) ( not ( = ?auto_405288 ?auto_405292 ) ) ( not ( = ?auto_405289 ?auto_405290 ) ) ( not ( = ?auto_405289 ?auto_405287 ) ) ( not ( = ?auto_405289 ?auto_405291 ) ) ( not ( = ?auto_405289 ?auto_405292 ) ) ( not ( = ?auto_405290 ?auto_405287 ) ) ( not ( = ?auto_405290 ?auto_405291 ) ) ( not ( = ?auto_405290 ?auto_405292 ) ) ( not ( = ?auto_405287 ?auto_405291 ) ) ( not ( = ?auto_405287 ?auto_405292 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_405291 ?auto_405292 )
      ( MAKE-5CRATE-VERIFY ?auto_405288 ?auto_405289 ?auto_405290 ?auto_405287 ?auto_405291 ?auto_405292 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_405322 - SURFACE
      ?auto_405323 - SURFACE
      ?auto_405324 - SURFACE
      ?auto_405321 - SURFACE
      ?auto_405325 - SURFACE
      ?auto_405326 - SURFACE
    )
    :vars
    (
      ?auto_405327 - HOIST
      ?auto_405329 - PLACE
      ?auto_405328 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_405327 ?auto_405329 ) ( SURFACE-AT ?auto_405325 ?auto_405329 ) ( CLEAR ?auto_405325 ) ( IS-CRATE ?auto_405326 ) ( not ( = ?auto_405325 ?auto_405326 ) ) ( TRUCK-AT ?auto_405328 ?auto_405329 ) ( AVAILABLE ?auto_405327 ) ( IN ?auto_405326 ?auto_405328 ) ( ON ?auto_405325 ?auto_405321 ) ( not ( = ?auto_405321 ?auto_405325 ) ) ( not ( = ?auto_405321 ?auto_405326 ) ) ( ON ?auto_405323 ?auto_405322 ) ( ON ?auto_405324 ?auto_405323 ) ( ON ?auto_405321 ?auto_405324 ) ( not ( = ?auto_405322 ?auto_405323 ) ) ( not ( = ?auto_405322 ?auto_405324 ) ) ( not ( = ?auto_405322 ?auto_405321 ) ) ( not ( = ?auto_405322 ?auto_405325 ) ) ( not ( = ?auto_405322 ?auto_405326 ) ) ( not ( = ?auto_405323 ?auto_405324 ) ) ( not ( = ?auto_405323 ?auto_405321 ) ) ( not ( = ?auto_405323 ?auto_405325 ) ) ( not ( = ?auto_405323 ?auto_405326 ) ) ( not ( = ?auto_405324 ?auto_405321 ) ) ( not ( = ?auto_405324 ?auto_405325 ) ) ( not ( = ?auto_405324 ?auto_405326 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_405321 ?auto_405325 ?auto_405326 )
      ( MAKE-5CRATE-VERIFY ?auto_405322 ?auto_405323 ?auto_405324 ?auto_405321 ?auto_405325 ?auto_405326 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_405362 - SURFACE
      ?auto_405363 - SURFACE
      ?auto_405364 - SURFACE
      ?auto_405361 - SURFACE
      ?auto_405365 - SURFACE
      ?auto_405366 - SURFACE
    )
    :vars
    (
      ?auto_405369 - HOIST
      ?auto_405370 - PLACE
      ?auto_405368 - TRUCK
      ?auto_405367 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_405369 ?auto_405370 ) ( SURFACE-AT ?auto_405365 ?auto_405370 ) ( CLEAR ?auto_405365 ) ( IS-CRATE ?auto_405366 ) ( not ( = ?auto_405365 ?auto_405366 ) ) ( AVAILABLE ?auto_405369 ) ( IN ?auto_405366 ?auto_405368 ) ( ON ?auto_405365 ?auto_405361 ) ( not ( = ?auto_405361 ?auto_405365 ) ) ( not ( = ?auto_405361 ?auto_405366 ) ) ( TRUCK-AT ?auto_405368 ?auto_405367 ) ( not ( = ?auto_405367 ?auto_405370 ) ) ( ON ?auto_405363 ?auto_405362 ) ( ON ?auto_405364 ?auto_405363 ) ( ON ?auto_405361 ?auto_405364 ) ( not ( = ?auto_405362 ?auto_405363 ) ) ( not ( = ?auto_405362 ?auto_405364 ) ) ( not ( = ?auto_405362 ?auto_405361 ) ) ( not ( = ?auto_405362 ?auto_405365 ) ) ( not ( = ?auto_405362 ?auto_405366 ) ) ( not ( = ?auto_405363 ?auto_405364 ) ) ( not ( = ?auto_405363 ?auto_405361 ) ) ( not ( = ?auto_405363 ?auto_405365 ) ) ( not ( = ?auto_405363 ?auto_405366 ) ) ( not ( = ?auto_405364 ?auto_405361 ) ) ( not ( = ?auto_405364 ?auto_405365 ) ) ( not ( = ?auto_405364 ?auto_405366 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_405361 ?auto_405365 ?auto_405366 )
      ( MAKE-5CRATE-VERIFY ?auto_405362 ?auto_405363 ?auto_405364 ?auto_405361 ?auto_405365 ?auto_405366 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_405407 - SURFACE
      ?auto_405408 - SURFACE
      ?auto_405409 - SURFACE
      ?auto_405406 - SURFACE
      ?auto_405410 - SURFACE
      ?auto_405411 - SURFACE
    )
    :vars
    (
      ?auto_405414 - HOIST
      ?auto_405415 - PLACE
      ?auto_405413 - TRUCK
      ?auto_405416 - PLACE
      ?auto_405412 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_405414 ?auto_405415 ) ( SURFACE-AT ?auto_405410 ?auto_405415 ) ( CLEAR ?auto_405410 ) ( IS-CRATE ?auto_405411 ) ( not ( = ?auto_405410 ?auto_405411 ) ) ( AVAILABLE ?auto_405414 ) ( ON ?auto_405410 ?auto_405406 ) ( not ( = ?auto_405406 ?auto_405410 ) ) ( not ( = ?auto_405406 ?auto_405411 ) ) ( TRUCK-AT ?auto_405413 ?auto_405416 ) ( not ( = ?auto_405416 ?auto_405415 ) ) ( HOIST-AT ?auto_405412 ?auto_405416 ) ( LIFTING ?auto_405412 ?auto_405411 ) ( not ( = ?auto_405414 ?auto_405412 ) ) ( ON ?auto_405408 ?auto_405407 ) ( ON ?auto_405409 ?auto_405408 ) ( ON ?auto_405406 ?auto_405409 ) ( not ( = ?auto_405407 ?auto_405408 ) ) ( not ( = ?auto_405407 ?auto_405409 ) ) ( not ( = ?auto_405407 ?auto_405406 ) ) ( not ( = ?auto_405407 ?auto_405410 ) ) ( not ( = ?auto_405407 ?auto_405411 ) ) ( not ( = ?auto_405408 ?auto_405409 ) ) ( not ( = ?auto_405408 ?auto_405406 ) ) ( not ( = ?auto_405408 ?auto_405410 ) ) ( not ( = ?auto_405408 ?auto_405411 ) ) ( not ( = ?auto_405409 ?auto_405406 ) ) ( not ( = ?auto_405409 ?auto_405410 ) ) ( not ( = ?auto_405409 ?auto_405411 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_405406 ?auto_405410 ?auto_405411 )
      ( MAKE-5CRATE-VERIFY ?auto_405407 ?auto_405408 ?auto_405409 ?auto_405406 ?auto_405410 ?auto_405411 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_405457 - SURFACE
      ?auto_405458 - SURFACE
      ?auto_405459 - SURFACE
      ?auto_405456 - SURFACE
      ?auto_405460 - SURFACE
      ?auto_405461 - SURFACE
    )
    :vars
    (
      ?auto_405463 - HOIST
      ?auto_405464 - PLACE
      ?auto_405466 - TRUCK
      ?auto_405462 - PLACE
      ?auto_405467 - HOIST
      ?auto_405465 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_405463 ?auto_405464 ) ( SURFACE-AT ?auto_405460 ?auto_405464 ) ( CLEAR ?auto_405460 ) ( IS-CRATE ?auto_405461 ) ( not ( = ?auto_405460 ?auto_405461 ) ) ( AVAILABLE ?auto_405463 ) ( ON ?auto_405460 ?auto_405456 ) ( not ( = ?auto_405456 ?auto_405460 ) ) ( not ( = ?auto_405456 ?auto_405461 ) ) ( TRUCK-AT ?auto_405466 ?auto_405462 ) ( not ( = ?auto_405462 ?auto_405464 ) ) ( HOIST-AT ?auto_405467 ?auto_405462 ) ( not ( = ?auto_405463 ?auto_405467 ) ) ( AVAILABLE ?auto_405467 ) ( SURFACE-AT ?auto_405461 ?auto_405462 ) ( ON ?auto_405461 ?auto_405465 ) ( CLEAR ?auto_405461 ) ( not ( = ?auto_405460 ?auto_405465 ) ) ( not ( = ?auto_405461 ?auto_405465 ) ) ( not ( = ?auto_405456 ?auto_405465 ) ) ( ON ?auto_405458 ?auto_405457 ) ( ON ?auto_405459 ?auto_405458 ) ( ON ?auto_405456 ?auto_405459 ) ( not ( = ?auto_405457 ?auto_405458 ) ) ( not ( = ?auto_405457 ?auto_405459 ) ) ( not ( = ?auto_405457 ?auto_405456 ) ) ( not ( = ?auto_405457 ?auto_405460 ) ) ( not ( = ?auto_405457 ?auto_405461 ) ) ( not ( = ?auto_405457 ?auto_405465 ) ) ( not ( = ?auto_405458 ?auto_405459 ) ) ( not ( = ?auto_405458 ?auto_405456 ) ) ( not ( = ?auto_405458 ?auto_405460 ) ) ( not ( = ?auto_405458 ?auto_405461 ) ) ( not ( = ?auto_405458 ?auto_405465 ) ) ( not ( = ?auto_405459 ?auto_405456 ) ) ( not ( = ?auto_405459 ?auto_405460 ) ) ( not ( = ?auto_405459 ?auto_405461 ) ) ( not ( = ?auto_405459 ?auto_405465 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_405456 ?auto_405460 ?auto_405461 )
      ( MAKE-5CRATE-VERIFY ?auto_405457 ?auto_405458 ?auto_405459 ?auto_405456 ?auto_405460 ?auto_405461 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_405508 - SURFACE
      ?auto_405509 - SURFACE
      ?auto_405510 - SURFACE
      ?auto_405507 - SURFACE
      ?auto_405511 - SURFACE
      ?auto_405512 - SURFACE
    )
    :vars
    (
      ?auto_405515 - HOIST
      ?auto_405516 - PLACE
      ?auto_405517 - PLACE
      ?auto_405513 - HOIST
      ?auto_405518 - SURFACE
      ?auto_405514 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_405515 ?auto_405516 ) ( SURFACE-AT ?auto_405511 ?auto_405516 ) ( CLEAR ?auto_405511 ) ( IS-CRATE ?auto_405512 ) ( not ( = ?auto_405511 ?auto_405512 ) ) ( AVAILABLE ?auto_405515 ) ( ON ?auto_405511 ?auto_405507 ) ( not ( = ?auto_405507 ?auto_405511 ) ) ( not ( = ?auto_405507 ?auto_405512 ) ) ( not ( = ?auto_405517 ?auto_405516 ) ) ( HOIST-AT ?auto_405513 ?auto_405517 ) ( not ( = ?auto_405515 ?auto_405513 ) ) ( AVAILABLE ?auto_405513 ) ( SURFACE-AT ?auto_405512 ?auto_405517 ) ( ON ?auto_405512 ?auto_405518 ) ( CLEAR ?auto_405512 ) ( not ( = ?auto_405511 ?auto_405518 ) ) ( not ( = ?auto_405512 ?auto_405518 ) ) ( not ( = ?auto_405507 ?auto_405518 ) ) ( TRUCK-AT ?auto_405514 ?auto_405516 ) ( ON ?auto_405509 ?auto_405508 ) ( ON ?auto_405510 ?auto_405509 ) ( ON ?auto_405507 ?auto_405510 ) ( not ( = ?auto_405508 ?auto_405509 ) ) ( not ( = ?auto_405508 ?auto_405510 ) ) ( not ( = ?auto_405508 ?auto_405507 ) ) ( not ( = ?auto_405508 ?auto_405511 ) ) ( not ( = ?auto_405508 ?auto_405512 ) ) ( not ( = ?auto_405508 ?auto_405518 ) ) ( not ( = ?auto_405509 ?auto_405510 ) ) ( not ( = ?auto_405509 ?auto_405507 ) ) ( not ( = ?auto_405509 ?auto_405511 ) ) ( not ( = ?auto_405509 ?auto_405512 ) ) ( not ( = ?auto_405509 ?auto_405518 ) ) ( not ( = ?auto_405510 ?auto_405507 ) ) ( not ( = ?auto_405510 ?auto_405511 ) ) ( not ( = ?auto_405510 ?auto_405512 ) ) ( not ( = ?auto_405510 ?auto_405518 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_405507 ?auto_405511 ?auto_405512 )
      ( MAKE-5CRATE-VERIFY ?auto_405508 ?auto_405509 ?auto_405510 ?auto_405507 ?auto_405511 ?auto_405512 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_405559 - SURFACE
      ?auto_405560 - SURFACE
      ?auto_405561 - SURFACE
      ?auto_405558 - SURFACE
      ?auto_405562 - SURFACE
      ?auto_405563 - SURFACE
    )
    :vars
    (
      ?auto_405569 - HOIST
      ?auto_405564 - PLACE
      ?auto_405566 - PLACE
      ?auto_405567 - HOIST
      ?auto_405568 - SURFACE
      ?auto_405565 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_405569 ?auto_405564 ) ( IS-CRATE ?auto_405563 ) ( not ( = ?auto_405562 ?auto_405563 ) ) ( not ( = ?auto_405558 ?auto_405562 ) ) ( not ( = ?auto_405558 ?auto_405563 ) ) ( not ( = ?auto_405566 ?auto_405564 ) ) ( HOIST-AT ?auto_405567 ?auto_405566 ) ( not ( = ?auto_405569 ?auto_405567 ) ) ( AVAILABLE ?auto_405567 ) ( SURFACE-AT ?auto_405563 ?auto_405566 ) ( ON ?auto_405563 ?auto_405568 ) ( CLEAR ?auto_405563 ) ( not ( = ?auto_405562 ?auto_405568 ) ) ( not ( = ?auto_405563 ?auto_405568 ) ) ( not ( = ?auto_405558 ?auto_405568 ) ) ( TRUCK-AT ?auto_405565 ?auto_405564 ) ( SURFACE-AT ?auto_405558 ?auto_405564 ) ( CLEAR ?auto_405558 ) ( LIFTING ?auto_405569 ?auto_405562 ) ( IS-CRATE ?auto_405562 ) ( ON ?auto_405560 ?auto_405559 ) ( ON ?auto_405561 ?auto_405560 ) ( ON ?auto_405558 ?auto_405561 ) ( not ( = ?auto_405559 ?auto_405560 ) ) ( not ( = ?auto_405559 ?auto_405561 ) ) ( not ( = ?auto_405559 ?auto_405558 ) ) ( not ( = ?auto_405559 ?auto_405562 ) ) ( not ( = ?auto_405559 ?auto_405563 ) ) ( not ( = ?auto_405559 ?auto_405568 ) ) ( not ( = ?auto_405560 ?auto_405561 ) ) ( not ( = ?auto_405560 ?auto_405558 ) ) ( not ( = ?auto_405560 ?auto_405562 ) ) ( not ( = ?auto_405560 ?auto_405563 ) ) ( not ( = ?auto_405560 ?auto_405568 ) ) ( not ( = ?auto_405561 ?auto_405558 ) ) ( not ( = ?auto_405561 ?auto_405562 ) ) ( not ( = ?auto_405561 ?auto_405563 ) ) ( not ( = ?auto_405561 ?auto_405568 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_405558 ?auto_405562 ?auto_405563 )
      ( MAKE-5CRATE-VERIFY ?auto_405559 ?auto_405560 ?auto_405561 ?auto_405558 ?auto_405562 ?auto_405563 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_405610 - SURFACE
      ?auto_405611 - SURFACE
      ?auto_405612 - SURFACE
      ?auto_405609 - SURFACE
      ?auto_405613 - SURFACE
      ?auto_405614 - SURFACE
    )
    :vars
    (
      ?auto_405617 - HOIST
      ?auto_405616 - PLACE
      ?auto_405615 - PLACE
      ?auto_405618 - HOIST
      ?auto_405619 - SURFACE
      ?auto_405620 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_405617 ?auto_405616 ) ( IS-CRATE ?auto_405614 ) ( not ( = ?auto_405613 ?auto_405614 ) ) ( not ( = ?auto_405609 ?auto_405613 ) ) ( not ( = ?auto_405609 ?auto_405614 ) ) ( not ( = ?auto_405615 ?auto_405616 ) ) ( HOIST-AT ?auto_405618 ?auto_405615 ) ( not ( = ?auto_405617 ?auto_405618 ) ) ( AVAILABLE ?auto_405618 ) ( SURFACE-AT ?auto_405614 ?auto_405615 ) ( ON ?auto_405614 ?auto_405619 ) ( CLEAR ?auto_405614 ) ( not ( = ?auto_405613 ?auto_405619 ) ) ( not ( = ?auto_405614 ?auto_405619 ) ) ( not ( = ?auto_405609 ?auto_405619 ) ) ( TRUCK-AT ?auto_405620 ?auto_405616 ) ( SURFACE-AT ?auto_405609 ?auto_405616 ) ( CLEAR ?auto_405609 ) ( IS-CRATE ?auto_405613 ) ( AVAILABLE ?auto_405617 ) ( IN ?auto_405613 ?auto_405620 ) ( ON ?auto_405611 ?auto_405610 ) ( ON ?auto_405612 ?auto_405611 ) ( ON ?auto_405609 ?auto_405612 ) ( not ( = ?auto_405610 ?auto_405611 ) ) ( not ( = ?auto_405610 ?auto_405612 ) ) ( not ( = ?auto_405610 ?auto_405609 ) ) ( not ( = ?auto_405610 ?auto_405613 ) ) ( not ( = ?auto_405610 ?auto_405614 ) ) ( not ( = ?auto_405610 ?auto_405619 ) ) ( not ( = ?auto_405611 ?auto_405612 ) ) ( not ( = ?auto_405611 ?auto_405609 ) ) ( not ( = ?auto_405611 ?auto_405613 ) ) ( not ( = ?auto_405611 ?auto_405614 ) ) ( not ( = ?auto_405611 ?auto_405619 ) ) ( not ( = ?auto_405612 ?auto_405609 ) ) ( not ( = ?auto_405612 ?auto_405613 ) ) ( not ( = ?auto_405612 ?auto_405614 ) ) ( not ( = ?auto_405612 ?auto_405619 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_405609 ?auto_405613 ?auto_405614 )
      ( MAKE-5CRATE-VERIFY ?auto_405610 ?auto_405611 ?auto_405612 ?auto_405609 ?auto_405613 ?auto_405614 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_405640 - SURFACE
      ?auto_405641 - SURFACE
      ?auto_405642 - SURFACE
      ?auto_405639 - SURFACE
    )
    :vars
    (
      ?auto_405648 - HOIST
      ?auto_405645 - PLACE
      ?auto_405644 - PLACE
      ?auto_405643 - HOIST
      ?auto_405647 - SURFACE
      ?auto_405646 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_405648 ?auto_405645 ) ( IS-CRATE ?auto_405639 ) ( not ( = ?auto_405642 ?auto_405639 ) ) ( not ( = ?auto_405641 ?auto_405642 ) ) ( not ( = ?auto_405641 ?auto_405639 ) ) ( not ( = ?auto_405644 ?auto_405645 ) ) ( HOIST-AT ?auto_405643 ?auto_405644 ) ( not ( = ?auto_405648 ?auto_405643 ) ) ( AVAILABLE ?auto_405643 ) ( SURFACE-AT ?auto_405639 ?auto_405644 ) ( ON ?auto_405639 ?auto_405647 ) ( CLEAR ?auto_405639 ) ( not ( = ?auto_405642 ?auto_405647 ) ) ( not ( = ?auto_405639 ?auto_405647 ) ) ( not ( = ?auto_405641 ?auto_405647 ) ) ( SURFACE-AT ?auto_405641 ?auto_405645 ) ( CLEAR ?auto_405641 ) ( IS-CRATE ?auto_405642 ) ( AVAILABLE ?auto_405648 ) ( IN ?auto_405642 ?auto_405646 ) ( TRUCK-AT ?auto_405646 ?auto_405644 ) ( ON ?auto_405641 ?auto_405640 ) ( not ( = ?auto_405640 ?auto_405641 ) ) ( not ( = ?auto_405640 ?auto_405642 ) ) ( not ( = ?auto_405640 ?auto_405639 ) ) ( not ( = ?auto_405640 ?auto_405647 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_405641 ?auto_405642 ?auto_405639 )
      ( MAKE-3CRATE-VERIFY ?auto_405640 ?auto_405641 ?auto_405642 ?auto_405639 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_405650 - SURFACE
      ?auto_405651 - SURFACE
      ?auto_405652 - SURFACE
      ?auto_405649 - SURFACE
      ?auto_405653 - SURFACE
    )
    :vars
    (
      ?auto_405659 - HOIST
      ?auto_405656 - PLACE
      ?auto_405655 - PLACE
      ?auto_405654 - HOIST
      ?auto_405658 - SURFACE
      ?auto_405657 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_405659 ?auto_405656 ) ( IS-CRATE ?auto_405653 ) ( not ( = ?auto_405649 ?auto_405653 ) ) ( not ( = ?auto_405652 ?auto_405649 ) ) ( not ( = ?auto_405652 ?auto_405653 ) ) ( not ( = ?auto_405655 ?auto_405656 ) ) ( HOIST-AT ?auto_405654 ?auto_405655 ) ( not ( = ?auto_405659 ?auto_405654 ) ) ( AVAILABLE ?auto_405654 ) ( SURFACE-AT ?auto_405653 ?auto_405655 ) ( ON ?auto_405653 ?auto_405658 ) ( CLEAR ?auto_405653 ) ( not ( = ?auto_405649 ?auto_405658 ) ) ( not ( = ?auto_405653 ?auto_405658 ) ) ( not ( = ?auto_405652 ?auto_405658 ) ) ( SURFACE-AT ?auto_405652 ?auto_405656 ) ( CLEAR ?auto_405652 ) ( IS-CRATE ?auto_405649 ) ( AVAILABLE ?auto_405659 ) ( IN ?auto_405649 ?auto_405657 ) ( TRUCK-AT ?auto_405657 ?auto_405655 ) ( ON ?auto_405651 ?auto_405650 ) ( ON ?auto_405652 ?auto_405651 ) ( not ( = ?auto_405650 ?auto_405651 ) ) ( not ( = ?auto_405650 ?auto_405652 ) ) ( not ( = ?auto_405650 ?auto_405649 ) ) ( not ( = ?auto_405650 ?auto_405653 ) ) ( not ( = ?auto_405650 ?auto_405658 ) ) ( not ( = ?auto_405651 ?auto_405652 ) ) ( not ( = ?auto_405651 ?auto_405649 ) ) ( not ( = ?auto_405651 ?auto_405653 ) ) ( not ( = ?auto_405651 ?auto_405658 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_405652 ?auto_405649 ?auto_405653 )
      ( MAKE-4CRATE-VERIFY ?auto_405650 ?auto_405651 ?auto_405652 ?auto_405649 ?auto_405653 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_405661 - SURFACE
      ?auto_405662 - SURFACE
      ?auto_405663 - SURFACE
      ?auto_405660 - SURFACE
      ?auto_405664 - SURFACE
      ?auto_405665 - SURFACE
    )
    :vars
    (
      ?auto_405671 - HOIST
      ?auto_405668 - PLACE
      ?auto_405667 - PLACE
      ?auto_405666 - HOIST
      ?auto_405670 - SURFACE
      ?auto_405669 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_405671 ?auto_405668 ) ( IS-CRATE ?auto_405665 ) ( not ( = ?auto_405664 ?auto_405665 ) ) ( not ( = ?auto_405660 ?auto_405664 ) ) ( not ( = ?auto_405660 ?auto_405665 ) ) ( not ( = ?auto_405667 ?auto_405668 ) ) ( HOIST-AT ?auto_405666 ?auto_405667 ) ( not ( = ?auto_405671 ?auto_405666 ) ) ( AVAILABLE ?auto_405666 ) ( SURFACE-AT ?auto_405665 ?auto_405667 ) ( ON ?auto_405665 ?auto_405670 ) ( CLEAR ?auto_405665 ) ( not ( = ?auto_405664 ?auto_405670 ) ) ( not ( = ?auto_405665 ?auto_405670 ) ) ( not ( = ?auto_405660 ?auto_405670 ) ) ( SURFACE-AT ?auto_405660 ?auto_405668 ) ( CLEAR ?auto_405660 ) ( IS-CRATE ?auto_405664 ) ( AVAILABLE ?auto_405671 ) ( IN ?auto_405664 ?auto_405669 ) ( TRUCK-AT ?auto_405669 ?auto_405667 ) ( ON ?auto_405662 ?auto_405661 ) ( ON ?auto_405663 ?auto_405662 ) ( ON ?auto_405660 ?auto_405663 ) ( not ( = ?auto_405661 ?auto_405662 ) ) ( not ( = ?auto_405661 ?auto_405663 ) ) ( not ( = ?auto_405661 ?auto_405660 ) ) ( not ( = ?auto_405661 ?auto_405664 ) ) ( not ( = ?auto_405661 ?auto_405665 ) ) ( not ( = ?auto_405661 ?auto_405670 ) ) ( not ( = ?auto_405662 ?auto_405663 ) ) ( not ( = ?auto_405662 ?auto_405660 ) ) ( not ( = ?auto_405662 ?auto_405664 ) ) ( not ( = ?auto_405662 ?auto_405665 ) ) ( not ( = ?auto_405662 ?auto_405670 ) ) ( not ( = ?auto_405663 ?auto_405660 ) ) ( not ( = ?auto_405663 ?auto_405664 ) ) ( not ( = ?auto_405663 ?auto_405665 ) ) ( not ( = ?auto_405663 ?auto_405670 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_405660 ?auto_405664 ?auto_405665 )
      ( MAKE-5CRATE-VERIFY ?auto_405661 ?auto_405662 ?auto_405663 ?auto_405660 ?auto_405664 ?auto_405665 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_405691 - SURFACE
      ?auto_405692 - SURFACE
      ?auto_405693 - SURFACE
      ?auto_405690 - SURFACE
    )
    :vars
    (
      ?auto_405698 - HOIST
      ?auto_405696 - PLACE
      ?auto_405699 - PLACE
      ?auto_405694 - HOIST
      ?auto_405697 - SURFACE
      ?auto_405695 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_405698 ?auto_405696 ) ( IS-CRATE ?auto_405690 ) ( not ( = ?auto_405693 ?auto_405690 ) ) ( not ( = ?auto_405692 ?auto_405693 ) ) ( not ( = ?auto_405692 ?auto_405690 ) ) ( not ( = ?auto_405699 ?auto_405696 ) ) ( HOIST-AT ?auto_405694 ?auto_405699 ) ( not ( = ?auto_405698 ?auto_405694 ) ) ( SURFACE-AT ?auto_405690 ?auto_405699 ) ( ON ?auto_405690 ?auto_405697 ) ( CLEAR ?auto_405690 ) ( not ( = ?auto_405693 ?auto_405697 ) ) ( not ( = ?auto_405690 ?auto_405697 ) ) ( not ( = ?auto_405692 ?auto_405697 ) ) ( SURFACE-AT ?auto_405692 ?auto_405696 ) ( CLEAR ?auto_405692 ) ( IS-CRATE ?auto_405693 ) ( AVAILABLE ?auto_405698 ) ( TRUCK-AT ?auto_405695 ?auto_405699 ) ( LIFTING ?auto_405694 ?auto_405693 ) ( ON ?auto_405692 ?auto_405691 ) ( not ( = ?auto_405691 ?auto_405692 ) ) ( not ( = ?auto_405691 ?auto_405693 ) ) ( not ( = ?auto_405691 ?auto_405690 ) ) ( not ( = ?auto_405691 ?auto_405697 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_405692 ?auto_405693 ?auto_405690 )
      ( MAKE-3CRATE-VERIFY ?auto_405691 ?auto_405692 ?auto_405693 ?auto_405690 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_405701 - SURFACE
      ?auto_405702 - SURFACE
      ?auto_405703 - SURFACE
      ?auto_405700 - SURFACE
      ?auto_405704 - SURFACE
    )
    :vars
    (
      ?auto_405709 - HOIST
      ?auto_405707 - PLACE
      ?auto_405710 - PLACE
      ?auto_405705 - HOIST
      ?auto_405708 - SURFACE
      ?auto_405706 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_405709 ?auto_405707 ) ( IS-CRATE ?auto_405704 ) ( not ( = ?auto_405700 ?auto_405704 ) ) ( not ( = ?auto_405703 ?auto_405700 ) ) ( not ( = ?auto_405703 ?auto_405704 ) ) ( not ( = ?auto_405710 ?auto_405707 ) ) ( HOIST-AT ?auto_405705 ?auto_405710 ) ( not ( = ?auto_405709 ?auto_405705 ) ) ( SURFACE-AT ?auto_405704 ?auto_405710 ) ( ON ?auto_405704 ?auto_405708 ) ( CLEAR ?auto_405704 ) ( not ( = ?auto_405700 ?auto_405708 ) ) ( not ( = ?auto_405704 ?auto_405708 ) ) ( not ( = ?auto_405703 ?auto_405708 ) ) ( SURFACE-AT ?auto_405703 ?auto_405707 ) ( CLEAR ?auto_405703 ) ( IS-CRATE ?auto_405700 ) ( AVAILABLE ?auto_405709 ) ( TRUCK-AT ?auto_405706 ?auto_405710 ) ( LIFTING ?auto_405705 ?auto_405700 ) ( ON ?auto_405702 ?auto_405701 ) ( ON ?auto_405703 ?auto_405702 ) ( not ( = ?auto_405701 ?auto_405702 ) ) ( not ( = ?auto_405701 ?auto_405703 ) ) ( not ( = ?auto_405701 ?auto_405700 ) ) ( not ( = ?auto_405701 ?auto_405704 ) ) ( not ( = ?auto_405701 ?auto_405708 ) ) ( not ( = ?auto_405702 ?auto_405703 ) ) ( not ( = ?auto_405702 ?auto_405700 ) ) ( not ( = ?auto_405702 ?auto_405704 ) ) ( not ( = ?auto_405702 ?auto_405708 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_405703 ?auto_405700 ?auto_405704 )
      ( MAKE-4CRATE-VERIFY ?auto_405701 ?auto_405702 ?auto_405703 ?auto_405700 ?auto_405704 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_405712 - SURFACE
      ?auto_405713 - SURFACE
      ?auto_405714 - SURFACE
      ?auto_405711 - SURFACE
      ?auto_405715 - SURFACE
      ?auto_405716 - SURFACE
    )
    :vars
    (
      ?auto_405721 - HOIST
      ?auto_405719 - PLACE
      ?auto_405722 - PLACE
      ?auto_405717 - HOIST
      ?auto_405720 - SURFACE
      ?auto_405718 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_405721 ?auto_405719 ) ( IS-CRATE ?auto_405716 ) ( not ( = ?auto_405715 ?auto_405716 ) ) ( not ( = ?auto_405711 ?auto_405715 ) ) ( not ( = ?auto_405711 ?auto_405716 ) ) ( not ( = ?auto_405722 ?auto_405719 ) ) ( HOIST-AT ?auto_405717 ?auto_405722 ) ( not ( = ?auto_405721 ?auto_405717 ) ) ( SURFACE-AT ?auto_405716 ?auto_405722 ) ( ON ?auto_405716 ?auto_405720 ) ( CLEAR ?auto_405716 ) ( not ( = ?auto_405715 ?auto_405720 ) ) ( not ( = ?auto_405716 ?auto_405720 ) ) ( not ( = ?auto_405711 ?auto_405720 ) ) ( SURFACE-AT ?auto_405711 ?auto_405719 ) ( CLEAR ?auto_405711 ) ( IS-CRATE ?auto_405715 ) ( AVAILABLE ?auto_405721 ) ( TRUCK-AT ?auto_405718 ?auto_405722 ) ( LIFTING ?auto_405717 ?auto_405715 ) ( ON ?auto_405713 ?auto_405712 ) ( ON ?auto_405714 ?auto_405713 ) ( ON ?auto_405711 ?auto_405714 ) ( not ( = ?auto_405712 ?auto_405713 ) ) ( not ( = ?auto_405712 ?auto_405714 ) ) ( not ( = ?auto_405712 ?auto_405711 ) ) ( not ( = ?auto_405712 ?auto_405715 ) ) ( not ( = ?auto_405712 ?auto_405716 ) ) ( not ( = ?auto_405712 ?auto_405720 ) ) ( not ( = ?auto_405713 ?auto_405714 ) ) ( not ( = ?auto_405713 ?auto_405711 ) ) ( not ( = ?auto_405713 ?auto_405715 ) ) ( not ( = ?auto_405713 ?auto_405716 ) ) ( not ( = ?auto_405713 ?auto_405720 ) ) ( not ( = ?auto_405714 ?auto_405711 ) ) ( not ( = ?auto_405714 ?auto_405715 ) ) ( not ( = ?auto_405714 ?auto_405716 ) ) ( not ( = ?auto_405714 ?auto_405720 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_405711 ?auto_405715 ?auto_405716 )
      ( MAKE-5CRATE-VERIFY ?auto_405712 ?auto_405713 ?auto_405714 ?auto_405711 ?auto_405715 ?auto_405716 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_405744 - SURFACE
      ?auto_405745 - SURFACE
      ?auto_405746 - SURFACE
      ?auto_405743 - SURFACE
    )
    :vars
    (
      ?auto_405748 - HOIST
      ?auto_405750 - PLACE
      ?auto_405751 - PLACE
      ?auto_405749 - HOIST
      ?auto_405752 - SURFACE
      ?auto_405753 - TRUCK
      ?auto_405747 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_405748 ?auto_405750 ) ( IS-CRATE ?auto_405743 ) ( not ( = ?auto_405746 ?auto_405743 ) ) ( not ( = ?auto_405745 ?auto_405746 ) ) ( not ( = ?auto_405745 ?auto_405743 ) ) ( not ( = ?auto_405751 ?auto_405750 ) ) ( HOIST-AT ?auto_405749 ?auto_405751 ) ( not ( = ?auto_405748 ?auto_405749 ) ) ( SURFACE-AT ?auto_405743 ?auto_405751 ) ( ON ?auto_405743 ?auto_405752 ) ( CLEAR ?auto_405743 ) ( not ( = ?auto_405746 ?auto_405752 ) ) ( not ( = ?auto_405743 ?auto_405752 ) ) ( not ( = ?auto_405745 ?auto_405752 ) ) ( SURFACE-AT ?auto_405745 ?auto_405750 ) ( CLEAR ?auto_405745 ) ( IS-CRATE ?auto_405746 ) ( AVAILABLE ?auto_405748 ) ( TRUCK-AT ?auto_405753 ?auto_405751 ) ( AVAILABLE ?auto_405749 ) ( SURFACE-AT ?auto_405746 ?auto_405751 ) ( ON ?auto_405746 ?auto_405747 ) ( CLEAR ?auto_405746 ) ( not ( = ?auto_405746 ?auto_405747 ) ) ( not ( = ?auto_405743 ?auto_405747 ) ) ( not ( = ?auto_405745 ?auto_405747 ) ) ( not ( = ?auto_405752 ?auto_405747 ) ) ( ON ?auto_405745 ?auto_405744 ) ( not ( = ?auto_405744 ?auto_405745 ) ) ( not ( = ?auto_405744 ?auto_405746 ) ) ( not ( = ?auto_405744 ?auto_405743 ) ) ( not ( = ?auto_405744 ?auto_405752 ) ) ( not ( = ?auto_405744 ?auto_405747 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_405745 ?auto_405746 ?auto_405743 )
      ( MAKE-3CRATE-VERIFY ?auto_405744 ?auto_405745 ?auto_405746 ?auto_405743 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_405755 - SURFACE
      ?auto_405756 - SURFACE
      ?auto_405757 - SURFACE
      ?auto_405754 - SURFACE
      ?auto_405758 - SURFACE
    )
    :vars
    (
      ?auto_405760 - HOIST
      ?auto_405762 - PLACE
      ?auto_405763 - PLACE
      ?auto_405761 - HOIST
      ?auto_405764 - SURFACE
      ?auto_405765 - TRUCK
      ?auto_405759 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_405760 ?auto_405762 ) ( IS-CRATE ?auto_405758 ) ( not ( = ?auto_405754 ?auto_405758 ) ) ( not ( = ?auto_405757 ?auto_405754 ) ) ( not ( = ?auto_405757 ?auto_405758 ) ) ( not ( = ?auto_405763 ?auto_405762 ) ) ( HOIST-AT ?auto_405761 ?auto_405763 ) ( not ( = ?auto_405760 ?auto_405761 ) ) ( SURFACE-AT ?auto_405758 ?auto_405763 ) ( ON ?auto_405758 ?auto_405764 ) ( CLEAR ?auto_405758 ) ( not ( = ?auto_405754 ?auto_405764 ) ) ( not ( = ?auto_405758 ?auto_405764 ) ) ( not ( = ?auto_405757 ?auto_405764 ) ) ( SURFACE-AT ?auto_405757 ?auto_405762 ) ( CLEAR ?auto_405757 ) ( IS-CRATE ?auto_405754 ) ( AVAILABLE ?auto_405760 ) ( TRUCK-AT ?auto_405765 ?auto_405763 ) ( AVAILABLE ?auto_405761 ) ( SURFACE-AT ?auto_405754 ?auto_405763 ) ( ON ?auto_405754 ?auto_405759 ) ( CLEAR ?auto_405754 ) ( not ( = ?auto_405754 ?auto_405759 ) ) ( not ( = ?auto_405758 ?auto_405759 ) ) ( not ( = ?auto_405757 ?auto_405759 ) ) ( not ( = ?auto_405764 ?auto_405759 ) ) ( ON ?auto_405756 ?auto_405755 ) ( ON ?auto_405757 ?auto_405756 ) ( not ( = ?auto_405755 ?auto_405756 ) ) ( not ( = ?auto_405755 ?auto_405757 ) ) ( not ( = ?auto_405755 ?auto_405754 ) ) ( not ( = ?auto_405755 ?auto_405758 ) ) ( not ( = ?auto_405755 ?auto_405764 ) ) ( not ( = ?auto_405755 ?auto_405759 ) ) ( not ( = ?auto_405756 ?auto_405757 ) ) ( not ( = ?auto_405756 ?auto_405754 ) ) ( not ( = ?auto_405756 ?auto_405758 ) ) ( not ( = ?auto_405756 ?auto_405764 ) ) ( not ( = ?auto_405756 ?auto_405759 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_405757 ?auto_405754 ?auto_405758 )
      ( MAKE-4CRATE-VERIFY ?auto_405755 ?auto_405756 ?auto_405757 ?auto_405754 ?auto_405758 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_405767 - SURFACE
      ?auto_405768 - SURFACE
      ?auto_405769 - SURFACE
      ?auto_405766 - SURFACE
      ?auto_405770 - SURFACE
      ?auto_405771 - SURFACE
    )
    :vars
    (
      ?auto_405773 - HOIST
      ?auto_405775 - PLACE
      ?auto_405776 - PLACE
      ?auto_405774 - HOIST
      ?auto_405777 - SURFACE
      ?auto_405778 - TRUCK
      ?auto_405772 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_405773 ?auto_405775 ) ( IS-CRATE ?auto_405771 ) ( not ( = ?auto_405770 ?auto_405771 ) ) ( not ( = ?auto_405766 ?auto_405770 ) ) ( not ( = ?auto_405766 ?auto_405771 ) ) ( not ( = ?auto_405776 ?auto_405775 ) ) ( HOIST-AT ?auto_405774 ?auto_405776 ) ( not ( = ?auto_405773 ?auto_405774 ) ) ( SURFACE-AT ?auto_405771 ?auto_405776 ) ( ON ?auto_405771 ?auto_405777 ) ( CLEAR ?auto_405771 ) ( not ( = ?auto_405770 ?auto_405777 ) ) ( not ( = ?auto_405771 ?auto_405777 ) ) ( not ( = ?auto_405766 ?auto_405777 ) ) ( SURFACE-AT ?auto_405766 ?auto_405775 ) ( CLEAR ?auto_405766 ) ( IS-CRATE ?auto_405770 ) ( AVAILABLE ?auto_405773 ) ( TRUCK-AT ?auto_405778 ?auto_405776 ) ( AVAILABLE ?auto_405774 ) ( SURFACE-AT ?auto_405770 ?auto_405776 ) ( ON ?auto_405770 ?auto_405772 ) ( CLEAR ?auto_405770 ) ( not ( = ?auto_405770 ?auto_405772 ) ) ( not ( = ?auto_405771 ?auto_405772 ) ) ( not ( = ?auto_405766 ?auto_405772 ) ) ( not ( = ?auto_405777 ?auto_405772 ) ) ( ON ?auto_405768 ?auto_405767 ) ( ON ?auto_405769 ?auto_405768 ) ( ON ?auto_405766 ?auto_405769 ) ( not ( = ?auto_405767 ?auto_405768 ) ) ( not ( = ?auto_405767 ?auto_405769 ) ) ( not ( = ?auto_405767 ?auto_405766 ) ) ( not ( = ?auto_405767 ?auto_405770 ) ) ( not ( = ?auto_405767 ?auto_405771 ) ) ( not ( = ?auto_405767 ?auto_405777 ) ) ( not ( = ?auto_405767 ?auto_405772 ) ) ( not ( = ?auto_405768 ?auto_405769 ) ) ( not ( = ?auto_405768 ?auto_405766 ) ) ( not ( = ?auto_405768 ?auto_405770 ) ) ( not ( = ?auto_405768 ?auto_405771 ) ) ( not ( = ?auto_405768 ?auto_405777 ) ) ( not ( = ?auto_405768 ?auto_405772 ) ) ( not ( = ?auto_405769 ?auto_405766 ) ) ( not ( = ?auto_405769 ?auto_405770 ) ) ( not ( = ?auto_405769 ?auto_405771 ) ) ( not ( = ?auto_405769 ?auto_405777 ) ) ( not ( = ?auto_405769 ?auto_405772 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_405766 ?auto_405770 ?auto_405771 )
      ( MAKE-5CRATE-VERIFY ?auto_405767 ?auto_405768 ?auto_405769 ?auto_405766 ?auto_405770 ?auto_405771 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_405800 - SURFACE
      ?auto_405801 - SURFACE
      ?auto_405802 - SURFACE
      ?auto_405799 - SURFACE
    )
    :vars
    (
      ?auto_405805 - HOIST
      ?auto_405803 - PLACE
      ?auto_405807 - PLACE
      ?auto_405809 - HOIST
      ?auto_405806 - SURFACE
      ?auto_405804 - SURFACE
      ?auto_405808 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_405805 ?auto_405803 ) ( IS-CRATE ?auto_405799 ) ( not ( = ?auto_405802 ?auto_405799 ) ) ( not ( = ?auto_405801 ?auto_405802 ) ) ( not ( = ?auto_405801 ?auto_405799 ) ) ( not ( = ?auto_405807 ?auto_405803 ) ) ( HOIST-AT ?auto_405809 ?auto_405807 ) ( not ( = ?auto_405805 ?auto_405809 ) ) ( SURFACE-AT ?auto_405799 ?auto_405807 ) ( ON ?auto_405799 ?auto_405806 ) ( CLEAR ?auto_405799 ) ( not ( = ?auto_405802 ?auto_405806 ) ) ( not ( = ?auto_405799 ?auto_405806 ) ) ( not ( = ?auto_405801 ?auto_405806 ) ) ( SURFACE-AT ?auto_405801 ?auto_405803 ) ( CLEAR ?auto_405801 ) ( IS-CRATE ?auto_405802 ) ( AVAILABLE ?auto_405805 ) ( AVAILABLE ?auto_405809 ) ( SURFACE-AT ?auto_405802 ?auto_405807 ) ( ON ?auto_405802 ?auto_405804 ) ( CLEAR ?auto_405802 ) ( not ( = ?auto_405802 ?auto_405804 ) ) ( not ( = ?auto_405799 ?auto_405804 ) ) ( not ( = ?auto_405801 ?auto_405804 ) ) ( not ( = ?auto_405806 ?auto_405804 ) ) ( TRUCK-AT ?auto_405808 ?auto_405803 ) ( ON ?auto_405801 ?auto_405800 ) ( not ( = ?auto_405800 ?auto_405801 ) ) ( not ( = ?auto_405800 ?auto_405802 ) ) ( not ( = ?auto_405800 ?auto_405799 ) ) ( not ( = ?auto_405800 ?auto_405806 ) ) ( not ( = ?auto_405800 ?auto_405804 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_405801 ?auto_405802 ?auto_405799 )
      ( MAKE-3CRATE-VERIFY ?auto_405800 ?auto_405801 ?auto_405802 ?auto_405799 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_405811 - SURFACE
      ?auto_405812 - SURFACE
      ?auto_405813 - SURFACE
      ?auto_405810 - SURFACE
      ?auto_405814 - SURFACE
    )
    :vars
    (
      ?auto_405817 - HOIST
      ?auto_405815 - PLACE
      ?auto_405819 - PLACE
      ?auto_405821 - HOIST
      ?auto_405818 - SURFACE
      ?auto_405816 - SURFACE
      ?auto_405820 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_405817 ?auto_405815 ) ( IS-CRATE ?auto_405814 ) ( not ( = ?auto_405810 ?auto_405814 ) ) ( not ( = ?auto_405813 ?auto_405810 ) ) ( not ( = ?auto_405813 ?auto_405814 ) ) ( not ( = ?auto_405819 ?auto_405815 ) ) ( HOIST-AT ?auto_405821 ?auto_405819 ) ( not ( = ?auto_405817 ?auto_405821 ) ) ( SURFACE-AT ?auto_405814 ?auto_405819 ) ( ON ?auto_405814 ?auto_405818 ) ( CLEAR ?auto_405814 ) ( not ( = ?auto_405810 ?auto_405818 ) ) ( not ( = ?auto_405814 ?auto_405818 ) ) ( not ( = ?auto_405813 ?auto_405818 ) ) ( SURFACE-AT ?auto_405813 ?auto_405815 ) ( CLEAR ?auto_405813 ) ( IS-CRATE ?auto_405810 ) ( AVAILABLE ?auto_405817 ) ( AVAILABLE ?auto_405821 ) ( SURFACE-AT ?auto_405810 ?auto_405819 ) ( ON ?auto_405810 ?auto_405816 ) ( CLEAR ?auto_405810 ) ( not ( = ?auto_405810 ?auto_405816 ) ) ( not ( = ?auto_405814 ?auto_405816 ) ) ( not ( = ?auto_405813 ?auto_405816 ) ) ( not ( = ?auto_405818 ?auto_405816 ) ) ( TRUCK-AT ?auto_405820 ?auto_405815 ) ( ON ?auto_405812 ?auto_405811 ) ( ON ?auto_405813 ?auto_405812 ) ( not ( = ?auto_405811 ?auto_405812 ) ) ( not ( = ?auto_405811 ?auto_405813 ) ) ( not ( = ?auto_405811 ?auto_405810 ) ) ( not ( = ?auto_405811 ?auto_405814 ) ) ( not ( = ?auto_405811 ?auto_405818 ) ) ( not ( = ?auto_405811 ?auto_405816 ) ) ( not ( = ?auto_405812 ?auto_405813 ) ) ( not ( = ?auto_405812 ?auto_405810 ) ) ( not ( = ?auto_405812 ?auto_405814 ) ) ( not ( = ?auto_405812 ?auto_405818 ) ) ( not ( = ?auto_405812 ?auto_405816 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_405813 ?auto_405810 ?auto_405814 )
      ( MAKE-4CRATE-VERIFY ?auto_405811 ?auto_405812 ?auto_405813 ?auto_405810 ?auto_405814 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_405823 - SURFACE
      ?auto_405824 - SURFACE
      ?auto_405825 - SURFACE
      ?auto_405822 - SURFACE
      ?auto_405826 - SURFACE
      ?auto_405827 - SURFACE
    )
    :vars
    (
      ?auto_405830 - HOIST
      ?auto_405828 - PLACE
      ?auto_405832 - PLACE
      ?auto_405834 - HOIST
      ?auto_405831 - SURFACE
      ?auto_405829 - SURFACE
      ?auto_405833 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_405830 ?auto_405828 ) ( IS-CRATE ?auto_405827 ) ( not ( = ?auto_405826 ?auto_405827 ) ) ( not ( = ?auto_405822 ?auto_405826 ) ) ( not ( = ?auto_405822 ?auto_405827 ) ) ( not ( = ?auto_405832 ?auto_405828 ) ) ( HOIST-AT ?auto_405834 ?auto_405832 ) ( not ( = ?auto_405830 ?auto_405834 ) ) ( SURFACE-AT ?auto_405827 ?auto_405832 ) ( ON ?auto_405827 ?auto_405831 ) ( CLEAR ?auto_405827 ) ( not ( = ?auto_405826 ?auto_405831 ) ) ( not ( = ?auto_405827 ?auto_405831 ) ) ( not ( = ?auto_405822 ?auto_405831 ) ) ( SURFACE-AT ?auto_405822 ?auto_405828 ) ( CLEAR ?auto_405822 ) ( IS-CRATE ?auto_405826 ) ( AVAILABLE ?auto_405830 ) ( AVAILABLE ?auto_405834 ) ( SURFACE-AT ?auto_405826 ?auto_405832 ) ( ON ?auto_405826 ?auto_405829 ) ( CLEAR ?auto_405826 ) ( not ( = ?auto_405826 ?auto_405829 ) ) ( not ( = ?auto_405827 ?auto_405829 ) ) ( not ( = ?auto_405822 ?auto_405829 ) ) ( not ( = ?auto_405831 ?auto_405829 ) ) ( TRUCK-AT ?auto_405833 ?auto_405828 ) ( ON ?auto_405824 ?auto_405823 ) ( ON ?auto_405825 ?auto_405824 ) ( ON ?auto_405822 ?auto_405825 ) ( not ( = ?auto_405823 ?auto_405824 ) ) ( not ( = ?auto_405823 ?auto_405825 ) ) ( not ( = ?auto_405823 ?auto_405822 ) ) ( not ( = ?auto_405823 ?auto_405826 ) ) ( not ( = ?auto_405823 ?auto_405827 ) ) ( not ( = ?auto_405823 ?auto_405831 ) ) ( not ( = ?auto_405823 ?auto_405829 ) ) ( not ( = ?auto_405824 ?auto_405825 ) ) ( not ( = ?auto_405824 ?auto_405822 ) ) ( not ( = ?auto_405824 ?auto_405826 ) ) ( not ( = ?auto_405824 ?auto_405827 ) ) ( not ( = ?auto_405824 ?auto_405831 ) ) ( not ( = ?auto_405824 ?auto_405829 ) ) ( not ( = ?auto_405825 ?auto_405822 ) ) ( not ( = ?auto_405825 ?auto_405826 ) ) ( not ( = ?auto_405825 ?auto_405827 ) ) ( not ( = ?auto_405825 ?auto_405831 ) ) ( not ( = ?auto_405825 ?auto_405829 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_405822 ?auto_405826 ?auto_405827 )
      ( MAKE-5CRATE-VERIFY ?auto_405823 ?auto_405824 ?auto_405825 ?auto_405822 ?auto_405826 ?auto_405827 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_405835 - SURFACE
      ?auto_405836 - SURFACE
    )
    :vars
    (
      ?auto_405840 - HOIST
      ?auto_405838 - PLACE
      ?auto_405837 - SURFACE
      ?auto_405842 - PLACE
      ?auto_405844 - HOIST
      ?auto_405841 - SURFACE
      ?auto_405839 - SURFACE
      ?auto_405843 - TRUCK
      ?auto_405845 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_405840 ?auto_405838 ) ( IS-CRATE ?auto_405836 ) ( not ( = ?auto_405835 ?auto_405836 ) ) ( not ( = ?auto_405837 ?auto_405835 ) ) ( not ( = ?auto_405837 ?auto_405836 ) ) ( not ( = ?auto_405842 ?auto_405838 ) ) ( HOIST-AT ?auto_405844 ?auto_405842 ) ( not ( = ?auto_405840 ?auto_405844 ) ) ( SURFACE-AT ?auto_405836 ?auto_405842 ) ( ON ?auto_405836 ?auto_405841 ) ( CLEAR ?auto_405836 ) ( not ( = ?auto_405835 ?auto_405841 ) ) ( not ( = ?auto_405836 ?auto_405841 ) ) ( not ( = ?auto_405837 ?auto_405841 ) ) ( IS-CRATE ?auto_405835 ) ( AVAILABLE ?auto_405844 ) ( SURFACE-AT ?auto_405835 ?auto_405842 ) ( ON ?auto_405835 ?auto_405839 ) ( CLEAR ?auto_405835 ) ( not ( = ?auto_405835 ?auto_405839 ) ) ( not ( = ?auto_405836 ?auto_405839 ) ) ( not ( = ?auto_405837 ?auto_405839 ) ) ( not ( = ?auto_405841 ?auto_405839 ) ) ( TRUCK-AT ?auto_405843 ?auto_405838 ) ( SURFACE-AT ?auto_405845 ?auto_405838 ) ( CLEAR ?auto_405845 ) ( LIFTING ?auto_405840 ?auto_405837 ) ( IS-CRATE ?auto_405837 ) ( not ( = ?auto_405845 ?auto_405837 ) ) ( not ( = ?auto_405835 ?auto_405845 ) ) ( not ( = ?auto_405836 ?auto_405845 ) ) ( not ( = ?auto_405841 ?auto_405845 ) ) ( not ( = ?auto_405839 ?auto_405845 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_405845 ?auto_405837 )
      ( MAKE-2CRATE ?auto_405837 ?auto_405835 ?auto_405836 )
      ( MAKE-1CRATE-VERIFY ?auto_405835 ?auto_405836 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_405846 - SURFACE
      ?auto_405847 - SURFACE
      ?auto_405848 - SURFACE
    )
    :vars
    (
      ?auto_405850 - HOIST
      ?auto_405854 - PLACE
      ?auto_405849 - PLACE
      ?auto_405855 - HOIST
      ?auto_405851 - SURFACE
      ?auto_405853 - SURFACE
      ?auto_405852 - TRUCK
      ?auto_405856 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_405850 ?auto_405854 ) ( IS-CRATE ?auto_405848 ) ( not ( = ?auto_405847 ?auto_405848 ) ) ( not ( = ?auto_405846 ?auto_405847 ) ) ( not ( = ?auto_405846 ?auto_405848 ) ) ( not ( = ?auto_405849 ?auto_405854 ) ) ( HOIST-AT ?auto_405855 ?auto_405849 ) ( not ( = ?auto_405850 ?auto_405855 ) ) ( SURFACE-AT ?auto_405848 ?auto_405849 ) ( ON ?auto_405848 ?auto_405851 ) ( CLEAR ?auto_405848 ) ( not ( = ?auto_405847 ?auto_405851 ) ) ( not ( = ?auto_405848 ?auto_405851 ) ) ( not ( = ?auto_405846 ?auto_405851 ) ) ( IS-CRATE ?auto_405847 ) ( AVAILABLE ?auto_405855 ) ( SURFACE-AT ?auto_405847 ?auto_405849 ) ( ON ?auto_405847 ?auto_405853 ) ( CLEAR ?auto_405847 ) ( not ( = ?auto_405847 ?auto_405853 ) ) ( not ( = ?auto_405848 ?auto_405853 ) ) ( not ( = ?auto_405846 ?auto_405853 ) ) ( not ( = ?auto_405851 ?auto_405853 ) ) ( TRUCK-AT ?auto_405852 ?auto_405854 ) ( SURFACE-AT ?auto_405856 ?auto_405854 ) ( CLEAR ?auto_405856 ) ( LIFTING ?auto_405850 ?auto_405846 ) ( IS-CRATE ?auto_405846 ) ( not ( = ?auto_405856 ?auto_405846 ) ) ( not ( = ?auto_405847 ?auto_405856 ) ) ( not ( = ?auto_405848 ?auto_405856 ) ) ( not ( = ?auto_405851 ?auto_405856 ) ) ( not ( = ?auto_405853 ?auto_405856 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_405847 ?auto_405848 )
      ( MAKE-2CRATE-VERIFY ?auto_405846 ?auto_405847 ?auto_405848 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_405858 - SURFACE
      ?auto_405859 - SURFACE
      ?auto_405860 - SURFACE
      ?auto_405857 - SURFACE
    )
    :vars
    (
      ?auto_405863 - HOIST
      ?auto_405866 - PLACE
      ?auto_405867 - PLACE
      ?auto_405865 - HOIST
      ?auto_405864 - SURFACE
      ?auto_405861 - SURFACE
      ?auto_405862 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_405863 ?auto_405866 ) ( IS-CRATE ?auto_405857 ) ( not ( = ?auto_405860 ?auto_405857 ) ) ( not ( = ?auto_405859 ?auto_405860 ) ) ( not ( = ?auto_405859 ?auto_405857 ) ) ( not ( = ?auto_405867 ?auto_405866 ) ) ( HOIST-AT ?auto_405865 ?auto_405867 ) ( not ( = ?auto_405863 ?auto_405865 ) ) ( SURFACE-AT ?auto_405857 ?auto_405867 ) ( ON ?auto_405857 ?auto_405864 ) ( CLEAR ?auto_405857 ) ( not ( = ?auto_405860 ?auto_405864 ) ) ( not ( = ?auto_405857 ?auto_405864 ) ) ( not ( = ?auto_405859 ?auto_405864 ) ) ( IS-CRATE ?auto_405860 ) ( AVAILABLE ?auto_405865 ) ( SURFACE-AT ?auto_405860 ?auto_405867 ) ( ON ?auto_405860 ?auto_405861 ) ( CLEAR ?auto_405860 ) ( not ( = ?auto_405860 ?auto_405861 ) ) ( not ( = ?auto_405857 ?auto_405861 ) ) ( not ( = ?auto_405859 ?auto_405861 ) ) ( not ( = ?auto_405864 ?auto_405861 ) ) ( TRUCK-AT ?auto_405862 ?auto_405866 ) ( SURFACE-AT ?auto_405858 ?auto_405866 ) ( CLEAR ?auto_405858 ) ( LIFTING ?auto_405863 ?auto_405859 ) ( IS-CRATE ?auto_405859 ) ( not ( = ?auto_405858 ?auto_405859 ) ) ( not ( = ?auto_405860 ?auto_405858 ) ) ( not ( = ?auto_405857 ?auto_405858 ) ) ( not ( = ?auto_405864 ?auto_405858 ) ) ( not ( = ?auto_405861 ?auto_405858 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_405859 ?auto_405860 ?auto_405857 )
      ( MAKE-3CRATE-VERIFY ?auto_405858 ?auto_405859 ?auto_405860 ?auto_405857 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_405869 - SURFACE
      ?auto_405870 - SURFACE
      ?auto_405871 - SURFACE
      ?auto_405868 - SURFACE
      ?auto_405872 - SURFACE
    )
    :vars
    (
      ?auto_405875 - HOIST
      ?auto_405878 - PLACE
      ?auto_405879 - PLACE
      ?auto_405877 - HOIST
      ?auto_405876 - SURFACE
      ?auto_405873 - SURFACE
      ?auto_405874 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_405875 ?auto_405878 ) ( IS-CRATE ?auto_405872 ) ( not ( = ?auto_405868 ?auto_405872 ) ) ( not ( = ?auto_405871 ?auto_405868 ) ) ( not ( = ?auto_405871 ?auto_405872 ) ) ( not ( = ?auto_405879 ?auto_405878 ) ) ( HOIST-AT ?auto_405877 ?auto_405879 ) ( not ( = ?auto_405875 ?auto_405877 ) ) ( SURFACE-AT ?auto_405872 ?auto_405879 ) ( ON ?auto_405872 ?auto_405876 ) ( CLEAR ?auto_405872 ) ( not ( = ?auto_405868 ?auto_405876 ) ) ( not ( = ?auto_405872 ?auto_405876 ) ) ( not ( = ?auto_405871 ?auto_405876 ) ) ( IS-CRATE ?auto_405868 ) ( AVAILABLE ?auto_405877 ) ( SURFACE-AT ?auto_405868 ?auto_405879 ) ( ON ?auto_405868 ?auto_405873 ) ( CLEAR ?auto_405868 ) ( not ( = ?auto_405868 ?auto_405873 ) ) ( not ( = ?auto_405872 ?auto_405873 ) ) ( not ( = ?auto_405871 ?auto_405873 ) ) ( not ( = ?auto_405876 ?auto_405873 ) ) ( TRUCK-AT ?auto_405874 ?auto_405878 ) ( SURFACE-AT ?auto_405870 ?auto_405878 ) ( CLEAR ?auto_405870 ) ( LIFTING ?auto_405875 ?auto_405871 ) ( IS-CRATE ?auto_405871 ) ( not ( = ?auto_405870 ?auto_405871 ) ) ( not ( = ?auto_405868 ?auto_405870 ) ) ( not ( = ?auto_405872 ?auto_405870 ) ) ( not ( = ?auto_405876 ?auto_405870 ) ) ( not ( = ?auto_405873 ?auto_405870 ) ) ( ON ?auto_405870 ?auto_405869 ) ( not ( = ?auto_405869 ?auto_405870 ) ) ( not ( = ?auto_405869 ?auto_405871 ) ) ( not ( = ?auto_405869 ?auto_405868 ) ) ( not ( = ?auto_405869 ?auto_405872 ) ) ( not ( = ?auto_405869 ?auto_405876 ) ) ( not ( = ?auto_405869 ?auto_405873 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_405871 ?auto_405868 ?auto_405872 )
      ( MAKE-4CRATE-VERIFY ?auto_405869 ?auto_405870 ?auto_405871 ?auto_405868 ?auto_405872 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_405881 - SURFACE
      ?auto_405882 - SURFACE
      ?auto_405883 - SURFACE
      ?auto_405880 - SURFACE
      ?auto_405884 - SURFACE
      ?auto_405885 - SURFACE
    )
    :vars
    (
      ?auto_405888 - HOIST
      ?auto_405891 - PLACE
      ?auto_405892 - PLACE
      ?auto_405890 - HOIST
      ?auto_405889 - SURFACE
      ?auto_405886 - SURFACE
      ?auto_405887 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_405888 ?auto_405891 ) ( IS-CRATE ?auto_405885 ) ( not ( = ?auto_405884 ?auto_405885 ) ) ( not ( = ?auto_405880 ?auto_405884 ) ) ( not ( = ?auto_405880 ?auto_405885 ) ) ( not ( = ?auto_405892 ?auto_405891 ) ) ( HOIST-AT ?auto_405890 ?auto_405892 ) ( not ( = ?auto_405888 ?auto_405890 ) ) ( SURFACE-AT ?auto_405885 ?auto_405892 ) ( ON ?auto_405885 ?auto_405889 ) ( CLEAR ?auto_405885 ) ( not ( = ?auto_405884 ?auto_405889 ) ) ( not ( = ?auto_405885 ?auto_405889 ) ) ( not ( = ?auto_405880 ?auto_405889 ) ) ( IS-CRATE ?auto_405884 ) ( AVAILABLE ?auto_405890 ) ( SURFACE-AT ?auto_405884 ?auto_405892 ) ( ON ?auto_405884 ?auto_405886 ) ( CLEAR ?auto_405884 ) ( not ( = ?auto_405884 ?auto_405886 ) ) ( not ( = ?auto_405885 ?auto_405886 ) ) ( not ( = ?auto_405880 ?auto_405886 ) ) ( not ( = ?auto_405889 ?auto_405886 ) ) ( TRUCK-AT ?auto_405887 ?auto_405891 ) ( SURFACE-AT ?auto_405883 ?auto_405891 ) ( CLEAR ?auto_405883 ) ( LIFTING ?auto_405888 ?auto_405880 ) ( IS-CRATE ?auto_405880 ) ( not ( = ?auto_405883 ?auto_405880 ) ) ( not ( = ?auto_405884 ?auto_405883 ) ) ( not ( = ?auto_405885 ?auto_405883 ) ) ( not ( = ?auto_405889 ?auto_405883 ) ) ( not ( = ?auto_405886 ?auto_405883 ) ) ( ON ?auto_405882 ?auto_405881 ) ( ON ?auto_405883 ?auto_405882 ) ( not ( = ?auto_405881 ?auto_405882 ) ) ( not ( = ?auto_405881 ?auto_405883 ) ) ( not ( = ?auto_405881 ?auto_405880 ) ) ( not ( = ?auto_405881 ?auto_405884 ) ) ( not ( = ?auto_405881 ?auto_405885 ) ) ( not ( = ?auto_405881 ?auto_405889 ) ) ( not ( = ?auto_405881 ?auto_405886 ) ) ( not ( = ?auto_405882 ?auto_405883 ) ) ( not ( = ?auto_405882 ?auto_405880 ) ) ( not ( = ?auto_405882 ?auto_405884 ) ) ( not ( = ?auto_405882 ?auto_405885 ) ) ( not ( = ?auto_405882 ?auto_405889 ) ) ( not ( = ?auto_405882 ?auto_405886 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_405880 ?auto_405884 ?auto_405885 )
      ( MAKE-5CRATE-VERIFY ?auto_405881 ?auto_405882 ?auto_405883 ?auto_405880 ?auto_405884 ?auto_405885 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_406805 - SURFACE
      ?auto_406806 - SURFACE
      ?auto_406807 - SURFACE
      ?auto_406804 - SURFACE
      ?auto_406808 - SURFACE
      ?auto_406810 - SURFACE
      ?auto_406809 - SURFACE
    )
    :vars
    (
      ?auto_406811 - HOIST
      ?auto_406812 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_406811 ?auto_406812 ) ( SURFACE-AT ?auto_406810 ?auto_406812 ) ( CLEAR ?auto_406810 ) ( LIFTING ?auto_406811 ?auto_406809 ) ( IS-CRATE ?auto_406809 ) ( not ( = ?auto_406810 ?auto_406809 ) ) ( ON ?auto_406806 ?auto_406805 ) ( ON ?auto_406807 ?auto_406806 ) ( ON ?auto_406804 ?auto_406807 ) ( ON ?auto_406808 ?auto_406804 ) ( ON ?auto_406810 ?auto_406808 ) ( not ( = ?auto_406805 ?auto_406806 ) ) ( not ( = ?auto_406805 ?auto_406807 ) ) ( not ( = ?auto_406805 ?auto_406804 ) ) ( not ( = ?auto_406805 ?auto_406808 ) ) ( not ( = ?auto_406805 ?auto_406810 ) ) ( not ( = ?auto_406805 ?auto_406809 ) ) ( not ( = ?auto_406806 ?auto_406807 ) ) ( not ( = ?auto_406806 ?auto_406804 ) ) ( not ( = ?auto_406806 ?auto_406808 ) ) ( not ( = ?auto_406806 ?auto_406810 ) ) ( not ( = ?auto_406806 ?auto_406809 ) ) ( not ( = ?auto_406807 ?auto_406804 ) ) ( not ( = ?auto_406807 ?auto_406808 ) ) ( not ( = ?auto_406807 ?auto_406810 ) ) ( not ( = ?auto_406807 ?auto_406809 ) ) ( not ( = ?auto_406804 ?auto_406808 ) ) ( not ( = ?auto_406804 ?auto_406810 ) ) ( not ( = ?auto_406804 ?auto_406809 ) ) ( not ( = ?auto_406808 ?auto_406810 ) ) ( not ( = ?auto_406808 ?auto_406809 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_406810 ?auto_406809 )
      ( MAKE-6CRATE-VERIFY ?auto_406805 ?auto_406806 ?auto_406807 ?auto_406804 ?auto_406808 ?auto_406810 ?auto_406809 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_406849 - SURFACE
      ?auto_406850 - SURFACE
      ?auto_406851 - SURFACE
      ?auto_406848 - SURFACE
      ?auto_406852 - SURFACE
      ?auto_406854 - SURFACE
      ?auto_406853 - SURFACE
    )
    :vars
    (
      ?auto_406856 - HOIST
      ?auto_406857 - PLACE
      ?auto_406855 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_406856 ?auto_406857 ) ( SURFACE-AT ?auto_406854 ?auto_406857 ) ( CLEAR ?auto_406854 ) ( IS-CRATE ?auto_406853 ) ( not ( = ?auto_406854 ?auto_406853 ) ) ( TRUCK-AT ?auto_406855 ?auto_406857 ) ( AVAILABLE ?auto_406856 ) ( IN ?auto_406853 ?auto_406855 ) ( ON ?auto_406854 ?auto_406852 ) ( not ( = ?auto_406852 ?auto_406854 ) ) ( not ( = ?auto_406852 ?auto_406853 ) ) ( ON ?auto_406850 ?auto_406849 ) ( ON ?auto_406851 ?auto_406850 ) ( ON ?auto_406848 ?auto_406851 ) ( ON ?auto_406852 ?auto_406848 ) ( not ( = ?auto_406849 ?auto_406850 ) ) ( not ( = ?auto_406849 ?auto_406851 ) ) ( not ( = ?auto_406849 ?auto_406848 ) ) ( not ( = ?auto_406849 ?auto_406852 ) ) ( not ( = ?auto_406849 ?auto_406854 ) ) ( not ( = ?auto_406849 ?auto_406853 ) ) ( not ( = ?auto_406850 ?auto_406851 ) ) ( not ( = ?auto_406850 ?auto_406848 ) ) ( not ( = ?auto_406850 ?auto_406852 ) ) ( not ( = ?auto_406850 ?auto_406854 ) ) ( not ( = ?auto_406850 ?auto_406853 ) ) ( not ( = ?auto_406851 ?auto_406848 ) ) ( not ( = ?auto_406851 ?auto_406852 ) ) ( not ( = ?auto_406851 ?auto_406854 ) ) ( not ( = ?auto_406851 ?auto_406853 ) ) ( not ( = ?auto_406848 ?auto_406852 ) ) ( not ( = ?auto_406848 ?auto_406854 ) ) ( not ( = ?auto_406848 ?auto_406853 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_406852 ?auto_406854 ?auto_406853 )
      ( MAKE-6CRATE-VERIFY ?auto_406849 ?auto_406850 ?auto_406851 ?auto_406848 ?auto_406852 ?auto_406854 ?auto_406853 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_406900 - SURFACE
      ?auto_406901 - SURFACE
      ?auto_406902 - SURFACE
      ?auto_406899 - SURFACE
      ?auto_406903 - SURFACE
      ?auto_406905 - SURFACE
      ?auto_406904 - SURFACE
    )
    :vars
    (
      ?auto_406907 - HOIST
      ?auto_406906 - PLACE
      ?auto_406909 - TRUCK
      ?auto_406908 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_406907 ?auto_406906 ) ( SURFACE-AT ?auto_406905 ?auto_406906 ) ( CLEAR ?auto_406905 ) ( IS-CRATE ?auto_406904 ) ( not ( = ?auto_406905 ?auto_406904 ) ) ( AVAILABLE ?auto_406907 ) ( IN ?auto_406904 ?auto_406909 ) ( ON ?auto_406905 ?auto_406903 ) ( not ( = ?auto_406903 ?auto_406905 ) ) ( not ( = ?auto_406903 ?auto_406904 ) ) ( TRUCK-AT ?auto_406909 ?auto_406908 ) ( not ( = ?auto_406908 ?auto_406906 ) ) ( ON ?auto_406901 ?auto_406900 ) ( ON ?auto_406902 ?auto_406901 ) ( ON ?auto_406899 ?auto_406902 ) ( ON ?auto_406903 ?auto_406899 ) ( not ( = ?auto_406900 ?auto_406901 ) ) ( not ( = ?auto_406900 ?auto_406902 ) ) ( not ( = ?auto_406900 ?auto_406899 ) ) ( not ( = ?auto_406900 ?auto_406903 ) ) ( not ( = ?auto_406900 ?auto_406905 ) ) ( not ( = ?auto_406900 ?auto_406904 ) ) ( not ( = ?auto_406901 ?auto_406902 ) ) ( not ( = ?auto_406901 ?auto_406899 ) ) ( not ( = ?auto_406901 ?auto_406903 ) ) ( not ( = ?auto_406901 ?auto_406905 ) ) ( not ( = ?auto_406901 ?auto_406904 ) ) ( not ( = ?auto_406902 ?auto_406899 ) ) ( not ( = ?auto_406902 ?auto_406903 ) ) ( not ( = ?auto_406902 ?auto_406905 ) ) ( not ( = ?auto_406902 ?auto_406904 ) ) ( not ( = ?auto_406899 ?auto_406903 ) ) ( not ( = ?auto_406899 ?auto_406905 ) ) ( not ( = ?auto_406899 ?auto_406904 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_406903 ?auto_406905 ?auto_406904 )
      ( MAKE-6CRATE-VERIFY ?auto_406900 ?auto_406901 ?auto_406902 ?auto_406899 ?auto_406903 ?auto_406905 ?auto_406904 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_406957 - SURFACE
      ?auto_406958 - SURFACE
      ?auto_406959 - SURFACE
      ?auto_406956 - SURFACE
      ?auto_406960 - SURFACE
      ?auto_406962 - SURFACE
      ?auto_406961 - SURFACE
    )
    :vars
    (
      ?auto_406967 - HOIST
      ?auto_406965 - PLACE
      ?auto_406966 - TRUCK
      ?auto_406964 - PLACE
      ?auto_406963 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_406967 ?auto_406965 ) ( SURFACE-AT ?auto_406962 ?auto_406965 ) ( CLEAR ?auto_406962 ) ( IS-CRATE ?auto_406961 ) ( not ( = ?auto_406962 ?auto_406961 ) ) ( AVAILABLE ?auto_406967 ) ( ON ?auto_406962 ?auto_406960 ) ( not ( = ?auto_406960 ?auto_406962 ) ) ( not ( = ?auto_406960 ?auto_406961 ) ) ( TRUCK-AT ?auto_406966 ?auto_406964 ) ( not ( = ?auto_406964 ?auto_406965 ) ) ( HOIST-AT ?auto_406963 ?auto_406964 ) ( LIFTING ?auto_406963 ?auto_406961 ) ( not ( = ?auto_406967 ?auto_406963 ) ) ( ON ?auto_406958 ?auto_406957 ) ( ON ?auto_406959 ?auto_406958 ) ( ON ?auto_406956 ?auto_406959 ) ( ON ?auto_406960 ?auto_406956 ) ( not ( = ?auto_406957 ?auto_406958 ) ) ( not ( = ?auto_406957 ?auto_406959 ) ) ( not ( = ?auto_406957 ?auto_406956 ) ) ( not ( = ?auto_406957 ?auto_406960 ) ) ( not ( = ?auto_406957 ?auto_406962 ) ) ( not ( = ?auto_406957 ?auto_406961 ) ) ( not ( = ?auto_406958 ?auto_406959 ) ) ( not ( = ?auto_406958 ?auto_406956 ) ) ( not ( = ?auto_406958 ?auto_406960 ) ) ( not ( = ?auto_406958 ?auto_406962 ) ) ( not ( = ?auto_406958 ?auto_406961 ) ) ( not ( = ?auto_406959 ?auto_406956 ) ) ( not ( = ?auto_406959 ?auto_406960 ) ) ( not ( = ?auto_406959 ?auto_406962 ) ) ( not ( = ?auto_406959 ?auto_406961 ) ) ( not ( = ?auto_406956 ?auto_406960 ) ) ( not ( = ?auto_406956 ?auto_406962 ) ) ( not ( = ?auto_406956 ?auto_406961 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_406960 ?auto_406962 ?auto_406961 )
      ( MAKE-6CRATE-VERIFY ?auto_406957 ?auto_406958 ?auto_406959 ?auto_406956 ?auto_406960 ?auto_406962 ?auto_406961 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_407020 - SURFACE
      ?auto_407021 - SURFACE
      ?auto_407022 - SURFACE
      ?auto_407019 - SURFACE
      ?auto_407023 - SURFACE
      ?auto_407025 - SURFACE
      ?auto_407024 - SURFACE
    )
    :vars
    (
      ?auto_407031 - HOIST
      ?auto_407029 - PLACE
      ?auto_407026 - TRUCK
      ?auto_407030 - PLACE
      ?auto_407028 - HOIST
      ?auto_407027 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_407031 ?auto_407029 ) ( SURFACE-AT ?auto_407025 ?auto_407029 ) ( CLEAR ?auto_407025 ) ( IS-CRATE ?auto_407024 ) ( not ( = ?auto_407025 ?auto_407024 ) ) ( AVAILABLE ?auto_407031 ) ( ON ?auto_407025 ?auto_407023 ) ( not ( = ?auto_407023 ?auto_407025 ) ) ( not ( = ?auto_407023 ?auto_407024 ) ) ( TRUCK-AT ?auto_407026 ?auto_407030 ) ( not ( = ?auto_407030 ?auto_407029 ) ) ( HOIST-AT ?auto_407028 ?auto_407030 ) ( not ( = ?auto_407031 ?auto_407028 ) ) ( AVAILABLE ?auto_407028 ) ( SURFACE-AT ?auto_407024 ?auto_407030 ) ( ON ?auto_407024 ?auto_407027 ) ( CLEAR ?auto_407024 ) ( not ( = ?auto_407025 ?auto_407027 ) ) ( not ( = ?auto_407024 ?auto_407027 ) ) ( not ( = ?auto_407023 ?auto_407027 ) ) ( ON ?auto_407021 ?auto_407020 ) ( ON ?auto_407022 ?auto_407021 ) ( ON ?auto_407019 ?auto_407022 ) ( ON ?auto_407023 ?auto_407019 ) ( not ( = ?auto_407020 ?auto_407021 ) ) ( not ( = ?auto_407020 ?auto_407022 ) ) ( not ( = ?auto_407020 ?auto_407019 ) ) ( not ( = ?auto_407020 ?auto_407023 ) ) ( not ( = ?auto_407020 ?auto_407025 ) ) ( not ( = ?auto_407020 ?auto_407024 ) ) ( not ( = ?auto_407020 ?auto_407027 ) ) ( not ( = ?auto_407021 ?auto_407022 ) ) ( not ( = ?auto_407021 ?auto_407019 ) ) ( not ( = ?auto_407021 ?auto_407023 ) ) ( not ( = ?auto_407021 ?auto_407025 ) ) ( not ( = ?auto_407021 ?auto_407024 ) ) ( not ( = ?auto_407021 ?auto_407027 ) ) ( not ( = ?auto_407022 ?auto_407019 ) ) ( not ( = ?auto_407022 ?auto_407023 ) ) ( not ( = ?auto_407022 ?auto_407025 ) ) ( not ( = ?auto_407022 ?auto_407024 ) ) ( not ( = ?auto_407022 ?auto_407027 ) ) ( not ( = ?auto_407019 ?auto_407023 ) ) ( not ( = ?auto_407019 ?auto_407025 ) ) ( not ( = ?auto_407019 ?auto_407024 ) ) ( not ( = ?auto_407019 ?auto_407027 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_407023 ?auto_407025 ?auto_407024 )
      ( MAKE-6CRATE-VERIFY ?auto_407020 ?auto_407021 ?auto_407022 ?auto_407019 ?auto_407023 ?auto_407025 ?auto_407024 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_407084 - SURFACE
      ?auto_407085 - SURFACE
      ?auto_407086 - SURFACE
      ?auto_407083 - SURFACE
      ?auto_407087 - SURFACE
      ?auto_407089 - SURFACE
      ?auto_407088 - SURFACE
    )
    :vars
    (
      ?auto_407092 - HOIST
      ?auto_407094 - PLACE
      ?auto_407095 - PLACE
      ?auto_407093 - HOIST
      ?auto_407090 - SURFACE
      ?auto_407091 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_407092 ?auto_407094 ) ( SURFACE-AT ?auto_407089 ?auto_407094 ) ( CLEAR ?auto_407089 ) ( IS-CRATE ?auto_407088 ) ( not ( = ?auto_407089 ?auto_407088 ) ) ( AVAILABLE ?auto_407092 ) ( ON ?auto_407089 ?auto_407087 ) ( not ( = ?auto_407087 ?auto_407089 ) ) ( not ( = ?auto_407087 ?auto_407088 ) ) ( not ( = ?auto_407095 ?auto_407094 ) ) ( HOIST-AT ?auto_407093 ?auto_407095 ) ( not ( = ?auto_407092 ?auto_407093 ) ) ( AVAILABLE ?auto_407093 ) ( SURFACE-AT ?auto_407088 ?auto_407095 ) ( ON ?auto_407088 ?auto_407090 ) ( CLEAR ?auto_407088 ) ( not ( = ?auto_407089 ?auto_407090 ) ) ( not ( = ?auto_407088 ?auto_407090 ) ) ( not ( = ?auto_407087 ?auto_407090 ) ) ( TRUCK-AT ?auto_407091 ?auto_407094 ) ( ON ?auto_407085 ?auto_407084 ) ( ON ?auto_407086 ?auto_407085 ) ( ON ?auto_407083 ?auto_407086 ) ( ON ?auto_407087 ?auto_407083 ) ( not ( = ?auto_407084 ?auto_407085 ) ) ( not ( = ?auto_407084 ?auto_407086 ) ) ( not ( = ?auto_407084 ?auto_407083 ) ) ( not ( = ?auto_407084 ?auto_407087 ) ) ( not ( = ?auto_407084 ?auto_407089 ) ) ( not ( = ?auto_407084 ?auto_407088 ) ) ( not ( = ?auto_407084 ?auto_407090 ) ) ( not ( = ?auto_407085 ?auto_407086 ) ) ( not ( = ?auto_407085 ?auto_407083 ) ) ( not ( = ?auto_407085 ?auto_407087 ) ) ( not ( = ?auto_407085 ?auto_407089 ) ) ( not ( = ?auto_407085 ?auto_407088 ) ) ( not ( = ?auto_407085 ?auto_407090 ) ) ( not ( = ?auto_407086 ?auto_407083 ) ) ( not ( = ?auto_407086 ?auto_407087 ) ) ( not ( = ?auto_407086 ?auto_407089 ) ) ( not ( = ?auto_407086 ?auto_407088 ) ) ( not ( = ?auto_407086 ?auto_407090 ) ) ( not ( = ?auto_407083 ?auto_407087 ) ) ( not ( = ?auto_407083 ?auto_407089 ) ) ( not ( = ?auto_407083 ?auto_407088 ) ) ( not ( = ?auto_407083 ?auto_407090 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_407087 ?auto_407089 ?auto_407088 )
      ( MAKE-6CRATE-VERIFY ?auto_407084 ?auto_407085 ?auto_407086 ?auto_407083 ?auto_407087 ?auto_407089 ?auto_407088 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_407148 - SURFACE
      ?auto_407149 - SURFACE
      ?auto_407150 - SURFACE
      ?auto_407147 - SURFACE
      ?auto_407151 - SURFACE
      ?auto_407153 - SURFACE
      ?auto_407152 - SURFACE
    )
    :vars
    (
      ?auto_407158 - HOIST
      ?auto_407157 - PLACE
      ?auto_407154 - PLACE
      ?auto_407155 - HOIST
      ?auto_407156 - SURFACE
      ?auto_407159 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_407158 ?auto_407157 ) ( IS-CRATE ?auto_407152 ) ( not ( = ?auto_407153 ?auto_407152 ) ) ( not ( = ?auto_407151 ?auto_407153 ) ) ( not ( = ?auto_407151 ?auto_407152 ) ) ( not ( = ?auto_407154 ?auto_407157 ) ) ( HOIST-AT ?auto_407155 ?auto_407154 ) ( not ( = ?auto_407158 ?auto_407155 ) ) ( AVAILABLE ?auto_407155 ) ( SURFACE-AT ?auto_407152 ?auto_407154 ) ( ON ?auto_407152 ?auto_407156 ) ( CLEAR ?auto_407152 ) ( not ( = ?auto_407153 ?auto_407156 ) ) ( not ( = ?auto_407152 ?auto_407156 ) ) ( not ( = ?auto_407151 ?auto_407156 ) ) ( TRUCK-AT ?auto_407159 ?auto_407157 ) ( SURFACE-AT ?auto_407151 ?auto_407157 ) ( CLEAR ?auto_407151 ) ( LIFTING ?auto_407158 ?auto_407153 ) ( IS-CRATE ?auto_407153 ) ( ON ?auto_407149 ?auto_407148 ) ( ON ?auto_407150 ?auto_407149 ) ( ON ?auto_407147 ?auto_407150 ) ( ON ?auto_407151 ?auto_407147 ) ( not ( = ?auto_407148 ?auto_407149 ) ) ( not ( = ?auto_407148 ?auto_407150 ) ) ( not ( = ?auto_407148 ?auto_407147 ) ) ( not ( = ?auto_407148 ?auto_407151 ) ) ( not ( = ?auto_407148 ?auto_407153 ) ) ( not ( = ?auto_407148 ?auto_407152 ) ) ( not ( = ?auto_407148 ?auto_407156 ) ) ( not ( = ?auto_407149 ?auto_407150 ) ) ( not ( = ?auto_407149 ?auto_407147 ) ) ( not ( = ?auto_407149 ?auto_407151 ) ) ( not ( = ?auto_407149 ?auto_407153 ) ) ( not ( = ?auto_407149 ?auto_407152 ) ) ( not ( = ?auto_407149 ?auto_407156 ) ) ( not ( = ?auto_407150 ?auto_407147 ) ) ( not ( = ?auto_407150 ?auto_407151 ) ) ( not ( = ?auto_407150 ?auto_407153 ) ) ( not ( = ?auto_407150 ?auto_407152 ) ) ( not ( = ?auto_407150 ?auto_407156 ) ) ( not ( = ?auto_407147 ?auto_407151 ) ) ( not ( = ?auto_407147 ?auto_407153 ) ) ( not ( = ?auto_407147 ?auto_407152 ) ) ( not ( = ?auto_407147 ?auto_407156 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_407151 ?auto_407153 ?auto_407152 )
      ( MAKE-6CRATE-VERIFY ?auto_407148 ?auto_407149 ?auto_407150 ?auto_407147 ?auto_407151 ?auto_407153 ?auto_407152 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_407212 - SURFACE
      ?auto_407213 - SURFACE
      ?auto_407214 - SURFACE
      ?auto_407211 - SURFACE
      ?auto_407215 - SURFACE
      ?auto_407217 - SURFACE
      ?auto_407216 - SURFACE
    )
    :vars
    (
      ?auto_407218 - HOIST
      ?auto_407223 - PLACE
      ?auto_407221 - PLACE
      ?auto_407220 - HOIST
      ?auto_407219 - SURFACE
      ?auto_407222 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_407218 ?auto_407223 ) ( IS-CRATE ?auto_407216 ) ( not ( = ?auto_407217 ?auto_407216 ) ) ( not ( = ?auto_407215 ?auto_407217 ) ) ( not ( = ?auto_407215 ?auto_407216 ) ) ( not ( = ?auto_407221 ?auto_407223 ) ) ( HOIST-AT ?auto_407220 ?auto_407221 ) ( not ( = ?auto_407218 ?auto_407220 ) ) ( AVAILABLE ?auto_407220 ) ( SURFACE-AT ?auto_407216 ?auto_407221 ) ( ON ?auto_407216 ?auto_407219 ) ( CLEAR ?auto_407216 ) ( not ( = ?auto_407217 ?auto_407219 ) ) ( not ( = ?auto_407216 ?auto_407219 ) ) ( not ( = ?auto_407215 ?auto_407219 ) ) ( TRUCK-AT ?auto_407222 ?auto_407223 ) ( SURFACE-AT ?auto_407215 ?auto_407223 ) ( CLEAR ?auto_407215 ) ( IS-CRATE ?auto_407217 ) ( AVAILABLE ?auto_407218 ) ( IN ?auto_407217 ?auto_407222 ) ( ON ?auto_407213 ?auto_407212 ) ( ON ?auto_407214 ?auto_407213 ) ( ON ?auto_407211 ?auto_407214 ) ( ON ?auto_407215 ?auto_407211 ) ( not ( = ?auto_407212 ?auto_407213 ) ) ( not ( = ?auto_407212 ?auto_407214 ) ) ( not ( = ?auto_407212 ?auto_407211 ) ) ( not ( = ?auto_407212 ?auto_407215 ) ) ( not ( = ?auto_407212 ?auto_407217 ) ) ( not ( = ?auto_407212 ?auto_407216 ) ) ( not ( = ?auto_407212 ?auto_407219 ) ) ( not ( = ?auto_407213 ?auto_407214 ) ) ( not ( = ?auto_407213 ?auto_407211 ) ) ( not ( = ?auto_407213 ?auto_407215 ) ) ( not ( = ?auto_407213 ?auto_407217 ) ) ( not ( = ?auto_407213 ?auto_407216 ) ) ( not ( = ?auto_407213 ?auto_407219 ) ) ( not ( = ?auto_407214 ?auto_407211 ) ) ( not ( = ?auto_407214 ?auto_407215 ) ) ( not ( = ?auto_407214 ?auto_407217 ) ) ( not ( = ?auto_407214 ?auto_407216 ) ) ( not ( = ?auto_407214 ?auto_407219 ) ) ( not ( = ?auto_407211 ?auto_407215 ) ) ( not ( = ?auto_407211 ?auto_407217 ) ) ( not ( = ?auto_407211 ?auto_407216 ) ) ( not ( = ?auto_407211 ?auto_407219 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_407215 ?auto_407217 ?auto_407216 )
      ( MAKE-6CRATE-VERIFY ?auto_407212 ?auto_407213 ?auto_407214 ?auto_407211 ?auto_407215 ?auto_407217 ?auto_407216 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_409161 - SURFACE
      ?auto_409162 - SURFACE
      ?auto_409163 - SURFACE
      ?auto_409160 - SURFACE
      ?auto_409164 - SURFACE
      ?auto_409166 - SURFACE
      ?auto_409165 - SURFACE
      ?auto_409167 - SURFACE
    )
    :vars
    (
      ?auto_409169 - HOIST
      ?auto_409168 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_409169 ?auto_409168 ) ( SURFACE-AT ?auto_409165 ?auto_409168 ) ( CLEAR ?auto_409165 ) ( LIFTING ?auto_409169 ?auto_409167 ) ( IS-CRATE ?auto_409167 ) ( not ( = ?auto_409165 ?auto_409167 ) ) ( ON ?auto_409162 ?auto_409161 ) ( ON ?auto_409163 ?auto_409162 ) ( ON ?auto_409160 ?auto_409163 ) ( ON ?auto_409164 ?auto_409160 ) ( ON ?auto_409166 ?auto_409164 ) ( ON ?auto_409165 ?auto_409166 ) ( not ( = ?auto_409161 ?auto_409162 ) ) ( not ( = ?auto_409161 ?auto_409163 ) ) ( not ( = ?auto_409161 ?auto_409160 ) ) ( not ( = ?auto_409161 ?auto_409164 ) ) ( not ( = ?auto_409161 ?auto_409166 ) ) ( not ( = ?auto_409161 ?auto_409165 ) ) ( not ( = ?auto_409161 ?auto_409167 ) ) ( not ( = ?auto_409162 ?auto_409163 ) ) ( not ( = ?auto_409162 ?auto_409160 ) ) ( not ( = ?auto_409162 ?auto_409164 ) ) ( not ( = ?auto_409162 ?auto_409166 ) ) ( not ( = ?auto_409162 ?auto_409165 ) ) ( not ( = ?auto_409162 ?auto_409167 ) ) ( not ( = ?auto_409163 ?auto_409160 ) ) ( not ( = ?auto_409163 ?auto_409164 ) ) ( not ( = ?auto_409163 ?auto_409166 ) ) ( not ( = ?auto_409163 ?auto_409165 ) ) ( not ( = ?auto_409163 ?auto_409167 ) ) ( not ( = ?auto_409160 ?auto_409164 ) ) ( not ( = ?auto_409160 ?auto_409166 ) ) ( not ( = ?auto_409160 ?auto_409165 ) ) ( not ( = ?auto_409160 ?auto_409167 ) ) ( not ( = ?auto_409164 ?auto_409166 ) ) ( not ( = ?auto_409164 ?auto_409165 ) ) ( not ( = ?auto_409164 ?auto_409167 ) ) ( not ( = ?auto_409166 ?auto_409165 ) ) ( not ( = ?auto_409166 ?auto_409167 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_409165 ?auto_409167 )
      ( MAKE-7CRATE-VERIFY ?auto_409161 ?auto_409162 ?auto_409163 ?auto_409160 ?auto_409164 ?auto_409166 ?auto_409165 ?auto_409167 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_409216 - SURFACE
      ?auto_409217 - SURFACE
      ?auto_409218 - SURFACE
      ?auto_409215 - SURFACE
      ?auto_409219 - SURFACE
      ?auto_409221 - SURFACE
      ?auto_409220 - SURFACE
      ?auto_409222 - SURFACE
    )
    :vars
    (
      ?auto_409225 - HOIST
      ?auto_409223 - PLACE
      ?auto_409224 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_409225 ?auto_409223 ) ( SURFACE-AT ?auto_409220 ?auto_409223 ) ( CLEAR ?auto_409220 ) ( IS-CRATE ?auto_409222 ) ( not ( = ?auto_409220 ?auto_409222 ) ) ( TRUCK-AT ?auto_409224 ?auto_409223 ) ( AVAILABLE ?auto_409225 ) ( IN ?auto_409222 ?auto_409224 ) ( ON ?auto_409220 ?auto_409221 ) ( not ( = ?auto_409221 ?auto_409220 ) ) ( not ( = ?auto_409221 ?auto_409222 ) ) ( ON ?auto_409217 ?auto_409216 ) ( ON ?auto_409218 ?auto_409217 ) ( ON ?auto_409215 ?auto_409218 ) ( ON ?auto_409219 ?auto_409215 ) ( ON ?auto_409221 ?auto_409219 ) ( not ( = ?auto_409216 ?auto_409217 ) ) ( not ( = ?auto_409216 ?auto_409218 ) ) ( not ( = ?auto_409216 ?auto_409215 ) ) ( not ( = ?auto_409216 ?auto_409219 ) ) ( not ( = ?auto_409216 ?auto_409221 ) ) ( not ( = ?auto_409216 ?auto_409220 ) ) ( not ( = ?auto_409216 ?auto_409222 ) ) ( not ( = ?auto_409217 ?auto_409218 ) ) ( not ( = ?auto_409217 ?auto_409215 ) ) ( not ( = ?auto_409217 ?auto_409219 ) ) ( not ( = ?auto_409217 ?auto_409221 ) ) ( not ( = ?auto_409217 ?auto_409220 ) ) ( not ( = ?auto_409217 ?auto_409222 ) ) ( not ( = ?auto_409218 ?auto_409215 ) ) ( not ( = ?auto_409218 ?auto_409219 ) ) ( not ( = ?auto_409218 ?auto_409221 ) ) ( not ( = ?auto_409218 ?auto_409220 ) ) ( not ( = ?auto_409218 ?auto_409222 ) ) ( not ( = ?auto_409215 ?auto_409219 ) ) ( not ( = ?auto_409215 ?auto_409221 ) ) ( not ( = ?auto_409215 ?auto_409220 ) ) ( not ( = ?auto_409215 ?auto_409222 ) ) ( not ( = ?auto_409219 ?auto_409221 ) ) ( not ( = ?auto_409219 ?auto_409220 ) ) ( not ( = ?auto_409219 ?auto_409222 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_409221 ?auto_409220 ?auto_409222 )
      ( MAKE-7CRATE-VERIFY ?auto_409216 ?auto_409217 ?auto_409218 ?auto_409215 ?auto_409219 ?auto_409221 ?auto_409220 ?auto_409222 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_409279 - SURFACE
      ?auto_409280 - SURFACE
      ?auto_409281 - SURFACE
      ?auto_409278 - SURFACE
      ?auto_409282 - SURFACE
      ?auto_409284 - SURFACE
      ?auto_409283 - SURFACE
      ?auto_409285 - SURFACE
    )
    :vars
    (
      ?auto_409288 - HOIST
      ?auto_409286 - PLACE
      ?auto_409289 - TRUCK
      ?auto_409287 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_409288 ?auto_409286 ) ( SURFACE-AT ?auto_409283 ?auto_409286 ) ( CLEAR ?auto_409283 ) ( IS-CRATE ?auto_409285 ) ( not ( = ?auto_409283 ?auto_409285 ) ) ( AVAILABLE ?auto_409288 ) ( IN ?auto_409285 ?auto_409289 ) ( ON ?auto_409283 ?auto_409284 ) ( not ( = ?auto_409284 ?auto_409283 ) ) ( not ( = ?auto_409284 ?auto_409285 ) ) ( TRUCK-AT ?auto_409289 ?auto_409287 ) ( not ( = ?auto_409287 ?auto_409286 ) ) ( ON ?auto_409280 ?auto_409279 ) ( ON ?auto_409281 ?auto_409280 ) ( ON ?auto_409278 ?auto_409281 ) ( ON ?auto_409282 ?auto_409278 ) ( ON ?auto_409284 ?auto_409282 ) ( not ( = ?auto_409279 ?auto_409280 ) ) ( not ( = ?auto_409279 ?auto_409281 ) ) ( not ( = ?auto_409279 ?auto_409278 ) ) ( not ( = ?auto_409279 ?auto_409282 ) ) ( not ( = ?auto_409279 ?auto_409284 ) ) ( not ( = ?auto_409279 ?auto_409283 ) ) ( not ( = ?auto_409279 ?auto_409285 ) ) ( not ( = ?auto_409280 ?auto_409281 ) ) ( not ( = ?auto_409280 ?auto_409278 ) ) ( not ( = ?auto_409280 ?auto_409282 ) ) ( not ( = ?auto_409280 ?auto_409284 ) ) ( not ( = ?auto_409280 ?auto_409283 ) ) ( not ( = ?auto_409280 ?auto_409285 ) ) ( not ( = ?auto_409281 ?auto_409278 ) ) ( not ( = ?auto_409281 ?auto_409282 ) ) ( not ( = ?auto_409281 ?auto_409284 ) ) ( not ( = ?auto_409281 ?auto_409283 ) ) ( not ( = ?auto_409281 ?auto_409285 ) ) ( not ( = ?auto_409278 ?auto_409282 ) ) ( not ( = ?auto_409278 ?auto_409284 ) ) ( not ( = ?auto_409278 ?auto_409283 ) ) ( not ( = ?auto_409278 ?auto_409285 ) ) ( not ( = ?auto_409282 ?auto_409284 ) ) ( not ( = ?auto_409282 ?auto_409283 ) ) ( not ( = ?auto_409282 ?auto_409285 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_409284 ?auto_409283 ?auto_409285 )
      ( MAKE-7CRATE-VERIFY ?auto_409279 ?auto_409280 ?auto_409281 ?auto_409278 ?auto_409282 ?auto_409284 ?auto_409283 ?auto_409285 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_409349 - SURFACE
      ?auto_409350 - SURFACE
      ?auto_409351 - SURFACE
      ?auto_409348 - SURFACE
      ?auto_409352 - SURFACE
      ?auto_409354 - SURFACE
      ?auto_409353 - SURFACE
      ?auto_409355 - SURFACE
    )
    :vars
    (
      ?auto_409359 - HOIST
      ?auto_409358 - PLACE
      ?auto_409357 - TRUCK
      ?auto_409360 - PLACE
      ?auto_409356 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_409359 ?auto_409358 ) ( SURFACE-AT ?auto_409353 ?auto_409358 ) ( CLEAR ?auto_409353 ) ( IS-CRATE ?auto_409355 ) ( not ( = ?auto_409353 ?auto_409355 ) ) ( AVAILABLE ?auto_409359 ) ( ON ?auto_409353 ?auto_409354 ) ( not ( = ?auto_409354 ?auto_409353 ) ) ( not ( = ?auto_409354 ?auto_409355 ) ) ( TRUCK-AT ?auto_409357 ?auto_409360 ) ( not ( = ?auto_409360 ?auto_409358 ) ) ( HOIST-AT ?auto_409356 ?auto_409360 ) ( LIFTING ?auto_409356 ?auto_409355 ) ( not ( = ?auto_409359 ?auto_409356 ) ) ( ON ?auto_409350 ?auto_409349 ) ( ON ?auto_409351 ?auto_409350 ) ( ON ?auto_409348 ?auto_409351 ) ( ON ?auto_409352 ?auto_409348 ) ( ON ?auto_409354 ?auto_409352 ) ( not ( = ?auto_409349 ?auto_409350 ) ) ( not ( = ?auto_409349 ?auto_409351 ) ) ( not ( = ?auto_409349 ?auto_409348 ) ) ( not ( = ?auto_409349 ?auto_409352 ) ) ( not ( = ?auto_409349 ?auto_409354 ) ) ( not ( = ?auto_409349 ?auto_409353 ) ) ( not ( = ?auto_409349 ?auto_409355 ) ) ( not ( = ?auto_409350 ?auto_409351 ) ) ( not ( = ?auto_409350 ?auto_409348 ) ) ( not ( = ?auto_409350 ?auto_409352 ) ) ( not ( = ?auto_409350 ?auto_409354 ) ) ( not ( = ?auto_409350 ?auto_409353 ) ) ( not ( = ?auto_409350 ?auto_409355 ) ) ( not ( = ?auto_409351 ?auto_409348 ) ) ( not ( = ?auto_409351 ?auto_409352 ) ) ( not ( = ?auto_409351 ?auto_409354 ) ) ( not ( = ?auto_409351 ?auto_409353 ) ) ( not ( = ?auto_409351 ?auto_409355 ) ) ( not ( = ?auto_409348 ?auto_409352 ) ) ( not ( = ?auto_409348 ?auto_409354 ) ) ( not ( = ?auto_409348 ?auto_409353 ) ) ( not ( = ?auto_409348 ?auto_409355 ) ) ( not ( = ?auto_409352 ?auto_409354 ) ) ( not ( = ?auto_409352 ?auto_409353 ) ) ( not ( = ?auto_409352 ?auto_409355 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_409354 ?auto_409353 ?auto_409355 )
      ( MAKE-7CRATE-VERIFY ?auto_409349 ?auto_409350 ?auto_409351 ?auto_409348 ?auto_409352 ?auto_409354 ?auto_409353 ?auto_409355 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_409426 - SURFACE
      ?auto_409427 - SURFACE
      ?auto_409428 - SURFACE
      ?auto_409425 - SURFACE
      ?auto_409429 - SURFACE
      ?auto_409431 - SURFACE
      ?auto_409430 - SURFACE
      ?auto_409432 - SURFACE
    )
    :vars
    (
      ?auto_409435 - HOIST
      ?auto_409436 - PLACE
      ?auto_409438 - TRUCK
      ?auto_409434 - PLACE
      ?auto_409433 - HOIST
      ?auto_409437 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_409435 ?auto_409436 ) ( SURFACE-AT ?auto_409430 ?auto_409436 ) ( CLEAR ?auto_409430 ) ( IS-CRATE ?auto_409432 ) ( not ( = ?auto_409430 ?auto_409432 ) ) ( AVAILABLE ?auto_409435 ) ( ON ?auto_409430 ?auto_409431 ) ( not ( = ?auto_409431 ?auto_409430 ) ) ( not ( = ?auto_409431 ?auto_409432 ) ) ( TRUCK-AT ?auto_409438 ?auto_409434 ) ( not ( = ?auto_409434 ?auto_409436 ) ) ( HOIST-AT ?auto_409433 ?auto_409434 ) ( not ( = ?auto_409435 ?auto_409433 ) ) ( AVAILABLE ?auto_409433 ) ( SURFACE-AT ?auto_409432 ?auto_409434 ) ( ON ?auto_409432 ?auto_409437 ) ( CLEAR ?auto_409432 ) ( not ( = ?auto_409430 ?auto_409437 ) ) ( not ( = ?auto_409432 ?auto_409437 ) ) ( not ( = ?auto_409431 ?auto_409437 ) ) ( ON ?auto_409427 ?auto_409426 ) ( ON ?auto_409428 ?auto_409427 ) ( ON ?auto_409425 ?auto_409428 ) ( ON ?auto_409429 ?auto_409425 ) ( ON ?auto_409431 ?auto_409429 ) ( not ( = ?auto_409426 ?auto_409427 ) ) ( not ( = ?auto_409426 ?auto_409428 ) ) ( not ( = ?auto_409426 ?auto_409425 ) ) ( not ( = ?auto_409426 ?auto_409429 ) ) ( not ( = ?auto_409426 ?auto_409431 ) ) ( not ( = ?auto_409426 ?auto_409430 ) ) ( not ( = ?auto_409426 ?auto_409432 ) ) ( not ( = ?auto_409426 ?auto_409437 ) ) ( not ( = ?auto_409427 ?auto_409428 ) ) ( not ( = ?auto_409427 ?auto_409425 ) ) ( not ( = ?auto_409427 ?auto_409429 ) ) ( not ( = ?auto_409427 ?auto_409431 ) ) ( not ( = ?auto_409427 ?auto_409430 ) ) ( not ( = ?auto_409427 ?auto_409432 ) ) ( not ( = ?auto_409427 ?auto_409437 ) ) ( not ( = ?auto_409428 ?auto_409425 ) ) ( not ( = ?auto_409428 ?auto_409429 ) ) ( not ( = ?auto_409428 ?auto_409431 ) ) ( not ( = ?auto_409428 ?auto_409430 ) ) ( not ( = ?auto_409428 ?auto_409432 ) ) ( not ( = ?auto_409428 ?auto_409437 ) ) ( not ( = ?auto_409425 ?auto_409429 ) ) ( not ( = ?auto_409425 ?auto_409431 ) ) ( not ( = ?auto_409425 ?auto_409430 ) ) ( not ( = ?auto_409425 ?auto_409432 ) ) ( not ( = ?auto_409425 ?auto_409437 ) ) ( not ( = ?auto_409429 ?auto_409431 ) ) ( not ( = ?auto_409429 ?auto_409430 ) ) ( not ( = ?auto_409429 ?auto_409432 ) ) ( not ( = ?auto_409429 ?auto_409437 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_409431 ?auto_409430 ?auto_409432 )
      ( MAKE-7CRATE-VERIFY ?auto_409426 ?auto_409427 ?auto_409428 ?auto_409425 ?auto_409429 ?auto_409431 ?auto_409430 ?auto_409432 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_409504 - SURFACE
      ?auto_409505 - SURFACE
      ?auto_409506 - SURFACE
      ?auto_409503 - SURFACE
      ?auto_409507 - SURFACE
      ?auto_409509 - SURFACE
      ?auto_409508 - SURFACE
      ?auto_409510 - SURFACE
    )
    :vars
    (
      ?auto_409514 - HOIST
      ?auto_409511 - PLACE
      ?auto_409513 - PLACE
      ?auto_409512 - HOIST
      ?auto_409515 - SURFACE
      ?auto_409516 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_409514 ?auto_409511 ) ( SURFACE-AT ?auto_409508 ?auto_409511 ) ( CLEAR ?auto_409508 ) ( IS-CRATE ?auto_409510 ) ( not ( = ?auto_409508 ?auto_409510 ) ) ( AVAILABLE ?auto_409514 ) ( ON ?auto_409508 ?auto_409509 ) ( not ( = ?auto_409509 ?auto_409508 ) ) ( not ( = ?auto_409509 ?auto_409510 ) ) ( not ( = ?auto_409513 ?auto_409511 ) ) ( HOIST-AT ?auto_409512 ?auto_409513 ) ( not ( = ?auto_409514 ?auto_409512 ) ) ( AVAILABLE ?auto_409512 ) ( SURFACE-AT ?auto_409510 ?auto_409513 ) ( ON ?auto_409510 ?auto_409515 ) ( CLEAR ?auto_409510 ) ( not ( = ?auto_409508 ?auto_409515 ) ) ( not ( = ?auto_409510 ?auto_409515 ) ) ( not ( = ?auto_409509 ?auto_409515 ) ) ( TRUCK-AT ?auto_409516 ?auto_409511 ) ( ON ?auto_409505 ?auto_409504 ) ( ON ?auto_409506 ?auto_409505 ) ( ON ?auto_409503 ?auto_409506 ) ( ON ?auto_409507 ?auto_409503 ) ( ON ?auto_409509 ?auto_409507 ) ( not ( = ?auto_409504 ?auto_409505 ) ) ( not ( = ?auto_409504 ?auto_409506 ) ) ( not ( = ?auto_409504 ?auto_409503 ) ) ( not ( = ?auto_409504 ?auto_409507 ) ) ( not ( = ?auto_409504 ?auto_409509 ) ) ( not ( = ?auto_409504 ?auto_409508 ) ) ( not ( = ?auto_409504 ?auto_409510 ) ) ( not ( = ?auto_409504 ?auto_409515 ) ) ( not ( = ?auto_409505 ?auto_409506 ) ) ( not ( = ?auto_409505 ?auto_409503 ) ) ( not ( = ?auto_409505 ?auto_409507 ) ) ( not ( = ?auto_409505 ?auto_409509 ) ) ( not ( = ?auto_409505 ?auto_409508 ) ) ( not ( = ?auto_409505 ?auto_409510 ) ) ( not ( = ?auto_409505 ?auto_409515 ) ) ( not ( = ?auto_409506 ?auto_409503 ) ) ( not ( = ?auto_409506 ?auto_409507 ) ) ( not ( = ?auto_409506 ?auto_409509 ) ) ( not ( = ?auto_409506 ?auto_409508 ) ) ( not ( = ?auto_409506 ?auto_409510 ) ) ( not ( = ?auto_409506 ?auto_409515 ) ) ( not ( = ?auto_409503 ?auto_409507 ) ) ( not ( = ?auto_409503 ?auto_409509 ) ) ( not ( = ?auto_409503 ?auto_409508 ) ) ( not ( = ?auto_409503 ?auto_409510 ) ) ( not ( = ?auto_409503 ?auto_409515 ) ) ( not ( = ?auto_409507 ?auto_409509 ) ) ( not ( = ?auto_409507 ?auto_409508 ) ) ( not ( = ?auto_409507 ?auto_409510 ) ) ( not ( = ?auto_409507 ?auto_409515 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_409509 ?auto_409508 ?auto_409510 )
      ( MAKE-7CRATE-VERIFY ?auto_409504 ?auto_409505 ?auto_409506 ?auto_409503 ?auto_409507 ?auto_409509 ?auto_409508 ?auto_409510 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_409582 - SURFACE
      ?auto_409583 - SURFACE
      ?auto_409584 - SURFACE
      ?auto_409581 - SURFACE
      ?auto_409585 - SURFACE
      ?auto_409587 - SURFACE
      ?auto_409586 - SURFACE
      ?auto_409588 - SURFACE
    )
    :vars
    (
      ?auto_409590 - HOIST
      ?auto_409594 - PLACE
      ?auto_409593 - PLACE
      ?auto_409591 - HOIST
      ?auto_409589 - SURFACE
      ?auto_409592 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_409590 ?auto_409594 ) ( IS-CRATE ?auto_409588 ) ( not ( = ?auto_409586 ?auto_409588 ) ) ( not ( = ?auto_409587 ?auto_409586 ) ) ( not ( = ?auto_409587 ?auto_409588 ) ) ( not ( = ?auto_409593 ?auto_409594 ) ) ( HOIST-AT ?auto_409591 ?auto_409593 ) ( not ( = ?auto_409590 ?auto_409591 ) ) ( AVAILABLE ?auto_409591 ) ( SURFACE-AT ?auto_409588 ?auto_409593 ) ( ON ?auto_409588 ?auto_409589 ) ( CLEAR ?auto_409588 ) ( not ( = ?auto_409586 ?auto_409589 ) ) ( not ( = ?auto_409588 ?auto_409589 ) ) ( not ( = ?auto_409587 ?auto_409589 ) ) ( TRUCK-AT ?auto_409592 ?auto_409594 ) ( SURFACE-AT ?auto_409587 ?auto_409594 ) ( CLEAR ?auto_409587 ) ( LIFTING ?auto_409590 ?auto_409586 ) ( IS-CRATE ?auto_409586 ) ( ON ?auto_409583 ?auto_409582 ) ( ON ?auto_409584 ?auto_409583 ) ( ON ?auto_409581 ?auto_409584 ) ( ON ?auto_409585 ?auto_409581 ) ( ON ?auto_409587 ?auto_409585 ) ( not ( = ?auto_409582 ?auto_409583 ) ) ( not ( = ?auto_409582 ?auto_409584 ) ) ( not ( = ?auto_409582 ?auto_409581 ) ) ( not ( = ?auto_409582 ?auto_409585 ) ) ( not ( = ?auto_409582 ?auto_409587 ) ) ( not ( = ?auto_409582 ?auto_409586 ) ) ( not ( = ?auto_409582 ?auto_409588 ) ) ( not ( = ?auto_409582 ?auto_409589 ) ) ( not ( = ?auto_409583 ?auto_409584 ) ) ( not ( = ?auto_409583 ?auto_409581 ) ) ( not ( = ?auto_409583 ?auto_409585 ) ) ( not ( = ?auto_409583 ?auto_409587 ) ) ( not ( = ?auto_409583 ?auto_409586 ) ) ( not ( = ?auto_409583 ?auto_409588 ) ) ( not ( = ?auto_409583 ?auto_409589 ) ) ( not ( = ?auto_409584 ?auto_409581 ) ) ( not ( = ?auto_409584 ?auto_409585 ) ) ( not ( = ?auto_409584 ?auto_409587 ) ) ( not ( = ?auto_409584 ?auto_409586 ) ) ( not ( = ?auto_409584 ?auto_409588 ) ) ( not ( = ?auto_409584 ?auto_409589 ) ) ( not ( = ?auto_409581 ?auto_409585 ) ) ( not ( = ?auto_409581 ?auto_409587 ) ) ( not ( = ?auto_409581 ?auto_409586 ) ) ( not ( = ?auto_409581 ?auto_409588 ) ) ( not ( = ?auto_409581 ?auto_409589 ) ) ( not ( = ?auto_409585 ?auto_409587 ) ) ( not ( = ?auto_409585 ?auto_409586 ) ) ( not ( = ?auto_409585 ?auto_409588 ) ) ( not ( = ?auto_409585 ?auto_409589 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_409587 ?auto_409586 ?auto_409588 )
      ( MAKE-7CRATE-VERIFY ?auto_409582 ?auto_409583 ?auto_409584 ?auto_409581 ?auto_409585 ?auto_409587 ?auto_409586 ?auto_409588 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_409660 - SURFACE
      ?auto_409661 - SURFACE
      ?auto_409662 - SURFACE
      ?auto_409659 - SURFACE
      ?auto_409663 - SURFACE
      ?auto_409665 - SURFACE
      ?auto_409664 - SURFACE
      ?auto_409666 - SURFACE
    )
    :vars
    (
      ?auto_409667 - HOIST
      ?auto_409671 - PLACE
      ?auto_409672 - PLACE
      ?auto_409669 - HOIST
      ?auto_409670 - SURFACE
      ?auto_409668 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_409667 ?auto_409671 ) ( IS-CRATE ?auto_409666 ) ( not ( = ?auto_409664 ?auto_409666 ) ) ( not ( = ?auto_409665 ?auto_409664 ) ) ( not ( = ?auto_409665 ?auto_409666 ) ) ( not ( = ?auto_409672 ?auto_409671 ) ) ( HOIST-AT ?auto_409669 ?auto_409672 ) ( not ( = ?auto_409667 ?auto_409669 ) ) ( AVAILABLE ?auto_409669 ) ( SURFACE-AT ?auto_409666 ?auto_409672 ) ( ON ?auto_409666 ?auto_409670 ) ( CLEAR ?auto_409666 ) ( not ( = ?auto_409664 ?auto_409670 ) ) ( not ( = ?auto_409666 ?auto_409670 ) ) ( not ( = ?auto_409665 ?auto_409670 ) ) ( TRUCK-AT ?auto_409668 ?auto_409671 ) ( SURFACE-AT ?auto_409665 ?auto_409671 ) ( CLEAR ?auto_409665 ) ( IS-CRATE ?auto_409664 ) ( AVAILABLE ?auto_409667 ) ( IN ?auto_409664 ?auto_409668 ) ( ON ?auto_409661 ?auto_409660 ) ( ON ?auto_409662 ?auto_409661 ) ( ON ?auto_409659 ?auto_409662 ) ( ON ?auto_409663 ?auto_409659 ) ( ON ?auto_409665 ?auto_409663 ) ( not ( = ?auto_409660 ?auto_409661 ) ) ( not ( = ?auto_409660 ?auto_409662 ) ) ( not ( = ?auto_409660 ?auto_409659 ) ) ( not ( = ?auto_409660 ?auto_409663 ) ) ( not ( = ?auto_409660 ?auto_409665 ) ) ( not ( = ?auto_409660 ?auto_409664 ) ) ( not ( = ?auto_409660 ?auto_409666 ) ) ( not ( = ?auto_409660 ?auto_409670 ) ) ( not ( = ?auto_409661 ?auto_409662 ) ) ( not ( = ?auto_409661 ?auto_409659 ) ) ( not ( = ?auto_409661 ?auto_409663 ) ) ( not ( = ?auto_409661 ?auto_409665 ) ) ( not ( = ?auto_409661 ?auto_409664 ) ) ( not ( = ?auto_409661 ?auto_409666 ) ) ( not ( = ?auto_409661 ?auto_409670 ) ) ( not ( = ?auto_409662 ?auto_409659 ) ) ( not ( = ?auto_409662 ?auto_409663 ) ) ( not ( = ?auto_409662 ?auto_409665 ) ) ( not ( = ?auto_409662 ?auto_409664 ) ) ( not ( = ?auto_409662 ?auto_409666 ) ) ( not ( = ?auto_409662 ?auto_409670 ) ) ( not ( = ?auto_409659 ?auto_409663 ) ) ( not ( = ?auto_409659 ?auto_409665 ) ) ( not ( = ?auto_409659 ?auto_409664 ) ) ( not ( = ?auto_409659 ?auto_409666 ) ) ( not ( = ?auto_409659 ?auto_409670 ) ) ( not ( = ?auto_409663 ?auto_409665 ) ) ( not ( = ?auto_409663 ?auto_409664 ) ) ( not ( = ?auto_409663 ?auto_409666 ) ) ( not ( = ?auto_409663 ?auto_409670 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_409665 ?auto_409664 ?auto_409666 )
      ( MAKE-7CRATE-VERIFY ?auto_409660 ?auto_409661 ?auto_409662 ?auto_409659 ?auto_409663 ?auto_409665 ?auto_409664 ?auto_409666 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_412579 - SURFACE
      ?auto_412580 - SURFACE
      ?auto_412581 - SURFACE
      ?auto_412578 - SURFACE
      ?auto_412582 - SURFACE
      ?auto_412584 - SURFACE
      ?auto_412583 - SURFACE
      ?auto_412585 - SURFACE
      ?auto_412586 - SURFACE
    )
    :vars
    (
      ?auto_412588 - HOIST
      ?auto_412587 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_412588 ?auto_412587 ) ( SURFACE-AT ?auto_412585 ?auto_412587 ) ( CLEAR ?auto_412585 ) ( LIFTING ?auto_412588 ?auto_412586 ) ( IS-CRATE ?auto_412586 ) ( not ( = ?auto_412585 ?auto_412586 ) ) ( ON ?auto_412580 ?auto_412579 ) ( ON ?auto_412581 ?auto_412580 ) ( ON ?auto_412578 ?auto_412581 ) ( ON ?auto_412582 ?auto_412578 ) ( ON ?auto_412584 ?auto_412582 ) ( ON ?auto_412583 ?auto_412584 ) ( ON ?auto_412585 ?auto_412583 ) ( not ( = ?auto_412579 ?auto_412580 ) ) ( not ( = ?auto_412579 ?auto_412581 ) ) ( not ( = ?auto_412579 ?auto_412578 ) ) ( not ( = ?auto_412579 ?auto_412582 ) ) ( not ( = ?auto_412579 ?auto_412584 ) ) ( not ( = ?auto_412579 ?auto_412583 ) ) ( not ( = ?auto_412579 ?auto_412585 ) ) ( not ( = ?auto_412579 ?auto_412586 ) ) ( not ( = ?auto_412580 ?auto_412581 ) ) ( not ( = ?auto_412580 ?auto_412578 ) ) ( not ( = ?auto_412580 ?auto_412582 ) ) ( not ( = ?auto_412580 ?auto_412584 ) ) ( not ( = ?auto_412580 ?auto_412583 ) ) ( not ( = ?auto_412580 ?auto_412585 ) ) ( not ( = ?auto_412580 ?auto_412586 ) ) ( not ( = ?auto_412581 ?auto_412578 ) ) ( not ( = ?auto_412581 ?auto_412582 ) ) ( not ( = ?auto_412581 ?auto_412584 ) ) ( not ( = ?auto_412581 ?auto_412583 ) ) ( not ( = ?auto_412581 ?auto_412585 ) ) ( not ( = ?auto_412581 ?auto_412586 ) ) ( not ( = ?auto_412578 ?auto_412582 ) ) ( not ( = ?auto_412578 ?auto_412584 ) ) ( not ( = ?auto_412578 ?auto_412583 ) ) ( not ( = ?auto_412578 ?auto_412585 ) ) ( not ( = ?auto_412578 ?auto_412586 ) ) ( not ( = ?auto_412582 ?auto_412584 ) ) ( not ( = ?auto_412582 ?auto_412583 ) ) ( not ( = ?auto_412582 ?auto_412585 ) ) ( not ( = ?auto_412582 ?auto_412586 ) ) ( not ( = ?auto_412584 ?auto_412583 ) ) ( not ( = ?auto_412584 ?auto_412585 ) ) ( not ( = ?auto_412584 ?auto_412586 ) ) ( not ( = ?auto_412583 ?auto_412585 ) ) ( not ( = ?auto_412583 ?auto_412586 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_412585 ?auto_412586 )
      ( MAKE-8CRATE-VERIFY ?auto_412579 ?auto_412580 ?auto_412581 ?auto_412578 ?auto_412582 ?auto_412584 ?auto_412583 ?auto_412585 ?auto_412586 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_412646 - SURFACE
      ?auto_412647 - SURFACE
      ?auto_412648 - SURFACE
      ?auto_412645 - SURFACE
      ?auto_412649 - SURFACE
      ?auto_412651 - SURFACE
      ?auto_412650 - SURFACE
      ?auto_412652 - SURFACE
      ?auto_412653 - SURFACE
    )
    :vars
    (
      ?auto_412654 - HOIST
      ?auto_412656 - PLACE
      ?auto_412655 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_412654 ?auto_412656 ) ( SURFACE-AT ?auto_412652 ?auto_412656 ) ( CLEAR ?auto_412652 ) ( IS-CRATE ?auto_412653 ) ( not ( = ?auto_412652 ?auto_412653 ) ) ( TRUCK-AT ?auto_412655 ?auto_412656 ) ( AVAILABLE ?auto_412654 ) ( IN ?auto_412653 ?auto_412655 ) ( ON ?auto_412652 ?auto_412650 ) ( not ( = ?auto_412650 ?auto_412652 ) ) ( not ( = ?auto_412650 ?auto_412653 ) ) ( ON ?auto_412647 ?auto_412646 ) ( ON ?auto_412648 ?auto_412647 ) ( ON ?auto_412645 ?auto_412648 ) ( ON ?auto_412649 ?auto_412645 ) ( ON ?auto_412651 ?auto_412649 ) ( ON ?auto_412650 ?auto_412651 ) ( not ( = ?auto_412646 ?auto_412647 ) ) ( not ( = ?auto_412646 ?auto_412648 ) ) ( not ( = ?auto_412646 ?auto_412645 ) ) ( not ( = ?auto_412646 ?auto_412649 ) ) ( not ( = ?auto_412646 ?auto_412651 ) ) ( not ( = ?auto_412646 ?auto_412650 ) ) ( not ( = ?auto_412646 ?auto_412652 ) ) ( not ( = ?auto_412646 ?auto_412653 ) ) ( not ( = ?auto_412647 ?auto_412648 ) ) ( not ( = ?auto_412647 ?auto_412645 ) ) ( not ( = ?auto_412647 ?auto_412649 ) ) ( not ( = ?auto_412647 ?auto_412651 ) ) ( not ( = ?auto_412647 ?auto_412650 ) ) ( not ( = ?auto_412647 ?auto_412652 ) ) ( not ( = ?auto_412647 ?auto_412653 ) ) ( not ( = ?auto_412648 ?auto_412645 ) ) ( not ( = ?auto_412648 ?auto_412649 ) ) ( not ( = ?auto_412648 ?auto_412651 ) ) ( not ( = ?auto_412648 ?auto_412650 ) ) ( not ( = ?auto_412648 ?auto_412652 ) ) ( not ( = ?auto_412648 ?auto_412653 ) ) ( not ( = ?auto_412645 ?auto_412649 ) ) ( not ( = ?auto_412645 ?auto_412651 ) ) ( not ( = ?auto_412645 ?auto_412650 ) ) ( not ( = ?auto_412645 ?auto_412652 ) ) ( not ( = ?auto_412645 ?auto_412653 ) ) ( not ( = ?auto_412649 ?auto_412651 ) ) ( not ( = ?auto_412649 ?auto_412650 ) ) ( not ( = ?auto_412649 ?auto_412652 ) ) ( not ( = ?auto_412649 ?auto_412653 ) ) ( not ( = ?auto_412651 ?auto_412650 ) ) ( not ( = ?auto_412651 ?auto_412652 ) ) ( not ( = ?auto_412651 ?auto_412653 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_412650 ?auto_412652 ?auto_412653 )
      ( MAKE-8CRATE-VERIFY ?auto_412646 ?auto_412647 ?auto_412648 ?auto_412645 ?auto_412649 ?auto_412651 ?auto_412650 ?auto_412652 ?auto_412653 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_412722 - SURFACE
      ?auto_412723 - SURFACE
      ?auto_412724 - SURFACE
      ?auto_412721 - SURFACE
      ?auto_412725 - SURFACE
      ?auto_412727 - SURFACE
      ?auto_412726 - SURFACE
      ?auto_412728 - SURFACE
      ?auto_412729 - SURFACE
    )
    :vars
    (
      ?auto_412732 - HOIST
      ?auto_412730 - PLACE
      ?auto_412733 - TRUCK
      ?auto_412731 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_412732 ?auto_412730 ) ( SURFACE-AT ?auto_412728 ?auto_412730 ) ( CLEAR ?auto_412728 ) ( IS-CRATE ?auto_412729 ) ( not ( = ?auto_412728 ?auto_412729 ) ) ( AVAILABLE ?auto_412732 ) ( IN ?auto_412729 ?auto_412733 ) ( ON ?auto_412728 ?auto_412726 ) ( not ( = ?auto_412726 ?auto_412728 ) ) ( not ( = ?auto_412726 ?auto_412729 ) ) ( TRUCK-AT ?auto_412733 ?auto_412731 ) ( not ( = ?auto_412731 ?auto_412730 ) ) ( ON ?auto_412723 ?auto_412722 ) ( ON ?auto_412724 ?auto_412723 ) ( ON ?auto_412721 ?auto_412724 ) ( ON ?auto_412725 ?auto_412721 ) ( ON ?auto_412727 ?auto_412725 ) ( ON ?auto_412726 ?auto_412727 ) ( not ( = ?auto_412722 ?auto_412723 ) ) ( not ( = ?auto_412722 ?auto_412724 ) ) ( not ( = ?auto_412722 ?auto_412721 ) ) ( not ( = ?auto_412722 ?auto_412725 ) ) ( not ( = ?auto_412722 ?auto_412727 ) ) ( not ( = ?auto_412722 ?auto_412726 ) ) ( not ( = ?auto_412722 ?auto_412728 ) ) ( not ( = ?auto_412722 ?auto_412729 ) ) ( not ( = ?auto_412723 ?auto_412724 ) ) ( not ( = ?auto_412723 ?auto_412721 ) ) ( not ( = ?auto_412723 ?auto_412725 ) ) ( not ( = ?auto_412723 ?auto_412727 ) ) ( not ( = ?auto_412723 ?auto_412726 ) ) ( not ( = ?auto_412723 ?auto_412728 ) ) ( not ( = ?auto_412723 ?auto_412729 ) ) ( not ( = ?auto_412724 ?auto_412721 ) ) ( not ( = ?auto_412724 ?auto_412725 ) ) ( not ( = ?auto_412724 ?auto_412727 ) ) ( not ( = ?auto_412724 ?auto_412726 ) ) ( not ( = ?auto_412724 ?auto_412728 ) ) ( not ( = ?auto_412724 ?auto_412729 ) ) ( not ( = ?auto_412721 ?auto_412725 ) ) ( not ( = ?auto_412721 ?auto_412727 ) ) ( not ( = ?auto_412721 ?auto_412726 ) ) ( not ( = ?auto_412721 ?auto_412728 ) ) ( not ( = ?auto_412721 ?auto_412729 ) ) ( not ( = ?auto_412725 ?auto_412727 ) ) ( not ( = ?auto_412725 ?auto_412726 ) ) ( not ( = ?auto_412725 ?auto_412728 ) ) ( not ( = ?auto_412725 ?auto_412729 ) ) ( not ( = ?auto_412727 ?auto_412726 ) ) ( not ( = ?auto_412727 ?auto_412728 ) ) ( not ( = ?auto_412727 ?auto_412729 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_412726 ?auto_412728 ?auto_412729 )
      ( MAKE-8CRATE-VERIFY ?auto_412722 ?auto_412723 ?auto_412724 ?auto_412721 ?auto_412725 ?auto_412727 ?auto_412726 ?auto_412728 ?auto_412729 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_412806 - SURFACE
      ?auto_412807 - SURFACE
      ?auto_412808 - SURFACE
      ?auto_412805 - SURFACE
      ?auto_412809 - SURFACE
      ?auto_412811 - SURFACE
      ?auto_412810 - SURFACE
      ?auto_412812 - SURFACE
      ?auto_412813 - SURFACE
    )
    :vars
    (
      ?auto_412818 - HOIST
      ?auto_412815 - PLACE
      ?auto_412814 - TRUCK
      ?auto_412817 - PLACE
      ?auto_412816 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_412818 ?auto_412815 ) ( SURFACE-AT ?auto_412812 ?auto_412815 ) ( CLEAR ?auto_412812 ) ( IS-CRATE ?auto_412813 ) ( not ( = ?auto_412812 ?auto_412813 ) ) ( AVAILABLE ?auto_412818 ) ( ON ?auto_412812 ?auto_412810 ) ( not ( = ?auto_412810 ?auto_412812 ) ) ( not ( = ?auto_412810 ?auto_412813 ) ) ( TRUCK-AT ?auto_412814 ?auto_412817 ) ( not ( = ?auto_412817 ?auto_412815 ) ) ( HOIST-AT ?auto_412816 ?auto_412817 ) ( LIFTING ?auto_412816 ?auto_412813 ) ( not ( = ?auto_412818 ?auto_412816 ) ) ( ON ?auto_412807 ?auto_412806 ) ( ON ?auto_412808 ?auto_412807 ) ( ON ?auto_412805 ?auto_412808 ) ( ON ?auto_412809 ?auto_412805 ) ( ON ?auto_412811 ?auto_412809 ) ( ON ?auto_412810 ?auto_412811 ) ( not ( = ?auto_412806 ?auto_412807 ) ) ( not ( = ?auto_412806 ?auto_412808 ) ) ( not ( = ?auto_412806 ?auto_412805 ) ) ( not ( = ?auto_412806 ?auto_412809 ) ) ( not ( = ?auto_412806 ?auto_412811 ) ) ( not ( = ?auto_412806 ?auto_412810 ) ) ( not ( = ?auto_412806 ?auto_412812 ) ) ( not ( = ?auto_412806 ?auto_412813 ) ) ( not ( = ?auto_412807 ?auto_412808 ) ) ( not ( = ?auto_412807 ?auto_412805 ) ) ( not ( = ?auto_412807 ?auto_412809 ) ) ( not ( = ?auto_412807 ?auto_412811 ) ) ( not ( = ?auto_412807 ?auto_412810 ) ) ( not ( = ?auto_412807 ?auto_412812 ) ) ( not ( = ?auto_412807 ?auto_412813 ) ) ( not ( = ?auto_412808 ?auto_412805 ) ) ( not ( = ?auto_412808 ?auto_412809 ) ) ( not ( = ?auto_412808 ?auto_412811 ) ) ( not ( = ?auto_412808 ?auto_412810 ) ) ( not ( = ?auto_412808 ?auto_412812 ) ) ( not ( = ?auto_412808 ?auto_412813 ) ) ( not ( = ?auto_412805 ?auto_412809 ) ) ( not ( = ?auto_412805 ?auto_412811 ) ) ( not ( = ?auto_412805 ?auto_412810 ) ) ( not ( = ?auto_412805 ?auto_412812 ) ) ( not ( = ?auto_412805 ?auto_412813 ) ) ( not ( = ?auto_412809 ?auto_412811 ) ) ( not ( = ?auto_412809 ?auto_412810 ) ) ( not ( = ?auto_412809 ?auto_412812 ) ) ( not ( = ?auto_412809 ?auto_412813 ) ) ( not ( = ?auto_412811 ?auto_412810 ) ) ( not ( = ?auto_412811 ?auto_412812 ) ) ( not ( = ?auto_412811 ?auto_412813 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_412810 ?auto_412812 ?auto_412813 )
      ( MAKE-8CRATE-VERIFY ?auto_412806 ?auto_412807 ?auto_412808 ?auto_412805 ?auto_412809 ?auto_412811 ?auto_412810 ?auto_412812 ?auto_412813 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_412898 - SURFACE
      ?auto_412899 - SURFACE
      ?auto_412900 - SURFACE
      ?auto_412897 - SURFACE
      ?auto_412901 - SURFACE
      ?auto_412903 - SURFACE
      ?auto_412902 - SURFACE
      ?auto_412904 - SURFACE
      ?auto_412905 - SURFACE
    )
    :vars
    (
      ?auto_412907 - HOIST
      ?auto_412910 - PLACE
      ?auto_412908 - TRUCK
      ?auto_412911 - PLACE
      ?auto_412909 - HOIST
      ?auto_412906 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_412907 ?auto_412910 ) ( SURFACE-AT ?auto_412904 ?auto_412910 ) ( CLEAR ?auto_412904 ) ( IS-CRATE ?auto_412905 ) ( not ( = ?auto_412904 ?auto_412905 ) ) ( AVAILABLE ?auto_412907 ) ( ON ?auto_412904 ?auto_412902 ) ( not ( = ?auto_412902 ?auto_412904 ) ) ( not ( = ?auto_412902 ?auto_412905 ) ) ( TRUCK-AT ?auto_412908 ?auto_412911 ) ( not ( = ?auto_412911 ?auto_412910 ) ) ( HOIST-AT ?auto_412909 ?auto_412911 ) ( not ( = ?auto_412907 ?auto_412909 ) ) ( AVAILABLE ?auto_412909 ) ( SURFACE-AT ?auto_412905 ?auto_412911 ) ( ON ?auto_412905 ?auto_412906 ) ( CLEAR ?auto_412905 ) ( not ( = ?auto_412904 ?auto_412906 ) ) ( not ( = ?auto_412905 ?auto_412906 ) ) ( not ( = ?auto_412902 ?auto_412906 ) ) ( ON ?auto_412899 ?auto_412898 ) ( ON ?auto_412900 ?auto_412899 ) ( ON ?auto_412897 ?auto_412900 ) ( ON ?auto_412901 ?auto_412897 ) ( ON ?auto_412903 ?auto_412901 ) ( ON ?auto_412902 ?auto_412903 ) ( not ( = ?auto_412898 ?auto_412899 ) ) ( not ( = ?auto_412898 ?auto_412900 ) ) ( not ( = ?auto_412898 ?auto_412897 ) ) ( not ( = ?auto_412898 ?auto_412901 ) ) ( not ( = ?auto_412898 ?auto_412903 ) ) ( not ( = ?auto_412898 ?auto_412902 ) ) ( not ( = ?auto_412898 ?auto_412904 ) ) ( not ( = ?auto_412898 ?auto_412905 ) ) ( not ( = ?auto_412898 ?auto_412906 ) ) ( not ( = ?auto_412899 ?auto_412900 ) ) ( not ( = ?auto_412899 ?auto_412897 ) ) ( not ( = ?auto_412899 ?auto_412901 ) ) ( not ( = ?auto_412899 ?auto_412903 ) ) ( not ( = ?auto_412899 ?auto_412902 ) ) ( not ( = ?auto_412899 ?auto_412904 ) ) ( not ( = ?auto_412899 ?auto_412905 ) ) ( not ( = ?auto_412899 ?auto_412906 ) ) ( not ( = ?auto_412900 ?auto_412897 ) ) ( not ( = ?auto_412900 ?auto_412901 ) ) ( not ( = ?auto_412900 ?auto_412903 ) ) ( not ( = ?auto_412900 ?auto_412902 ) ) ( not ( = ?auto_412900 ?auto_412904 ) ) ( not ( = ?auto_412900 ?auto_412905 ) ) ( not ( = ?auto_412900 ?auto_412906 ) ) ( not ( = ?auto_412897 ?auto_412901 ) ) ( not ( = ?auto_412897 ?auto_412903 ) ) ( not ( = ?auto_412897 ?auto_412902 ) ) ( not ( = ?auto_412897 ?auto_412904 ) ) ( not ( = ?auto_412897 ?auto_412905 ) ) ( not ( = ?auto_412897 ?auto_412906 ) ) ( not ( = ?auto_412901 ?auto_412903 ) ) ( not ( = ?auto_412901 ?auto_412902 ) ) ( not ( = ?auto_412901 ?auto_412904 ) ) ( not ( = ?auto_412901 ?auto_412905 ) ) ( not ( = ?auto_412901 ?auto_412906 ) ) ( not ( = ?auto_412903 ?auto_412902 ) ) ( not ( = ?auto_412903 ?auto_412904 ) ) ( not ( = ?auto_412903 ?auto_412905 ) ) ( not ( = ?auto_412903 ?auto_412906 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_412902 ?auto_412904 ?auto_412905 )
      ( MAKE-8CRATE-VERIFY ?auto_412898 ?auto_412899 ?auto_412900 ?auto_412897 ?auto_412901 ?auto_412903 ?auto_412902 ?auto_412904 ?auto_412905 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_412991 - SURFACE
      ?auto_412992 - SURFACE
      ?auto_412993 - SURFACE
      ?auto_412990 - SURFACE
      ?auto_412994 - SURFACE
      ?auto_412996 - SURFACE
      ?auto_412995 - SURFACE
      ?auto_412997 - SURFACE
      ?auto_412998 - SURFACE
    )
    :vars
    (
      ?auto_413004 - HOIST
      ?auto_413002 - PLACE
      ?auto_412999 - PLACE
      ?auto_413003 - HOIST
      ?auto_413000 - SURFACE
      ?auto_413001 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_413004 ?auto_413002 ) ( SURFACE-AT ?auto_412997 ?auto_413002 ) ( CLEAR ?auto_412997 ) ( IS-CRATE ?auto_412998 ) ( not ( = ?auto_412997 ?auto_412998 ) ) ( AVAILABLE ?auto_413004 ) ( ON ?auto_412997 ?auto_412995 ) ( not ( = ?auto_412995 ?auto_412997 ) ) ( not ( = ?auto_412995 ?auto_412998 ) ) ( not ( = ?auto_412999 ?auto_413002 ) ) ( HOIST-AT ?auto_413003 ?auto_412999 ) ( not ( = ?auto_413004 ?auto_413003 ) ) ( AVAILABLE ?auto_413003 ) ( SURFACE-AT ?auto_412998 ?auto_412999 ) ( ON ?auto_412998 ?auto_413000 ) ( CLEAR ?auto_412998 ) ( not ( = ?auto_412997 ?auto_413000 ) ) ( not ( = ?auto_412998 ?auto_413000 ) ) ( not ( = ?auto_412995 ?auto_413000 ) ) ( TRUCK-AT ?auto_413001 ?auto_413002 ) ( ON ?auto_412992 ?auto_412991 ) ( ON ?auto_412993 ?auto_412992 ) ( ON ?auto_412990 ?auto_412993 ) ( ON ?auto_412994 ?auto_412990 ) ( ON ?auto_412996 ?auto_412994 ) ( ON ?auto_412995 ?auto_412996 ) ( not ( = ?auto_412991 ?auto_412992 ) ) ( not ( = ?auto_412991 ?auto_412993 ) ) ( not ( = ?auto_412991 ?auto_412990 ) ) ( not ( = ?auto_412991 ?auto_412994 ) ) ( not ( = ?auto_412991 ?auto_412996 ) ) ( not ( = ?auto_412991 ?auto_412995 ) ) ( not ( = ?auto_412991 ?auto_412997 ) ) ( not ( = ?auto_412991 ?auto_412998 ) ) ( not ( = ?auto_412991 ?auto_413000 ) ) ( not ( = ?auto_412992 ?auto_412993 ) ) ( not ( = ?auto_412992 ?auto_412990 ) ) ( not ( = ?auto_412992 ?auto_412994 ) ) ( not ( = ?auto_412992 ?auto_412996 ) ) ( not ( = ?auto_412992 ?auto_412995 ) ) ( not ( = ?auto_412992 ?auto_412997 ) ) ( not ( = ?auto_412992 ?auto_412998 ) ) ( not ( = ?auto_412992 ?auto_413000 ) ) ( not ( = ?auto_412993 ?auto_412990 ) ) ( not ( = ?auto_412993 ?auto_412994 ) ) ( not ( = ?auto_412993 ?auto_412996 ) ) ( not ( = ?auto_412993 ?auto_412995 ) ) ( not ( = ?auto_412993 ?auto_412997 ) ) ( not ( = ?auto_412993 ?auto_412998 ) ) ( not ( = ?auto_412993 ?auto_413000 ) ) ( not ( = ?auto_412990 ?auto_412994 ) ) ( not ( = ?auto_412990 ?auto_412996 ) ) ( not ( = ?auto_412990 ?auto_412995 ) ) ( not ( = ?auto_412990 ?auto_412997 ) ) ( not ( = ?auto_412990 ?auto_412998 ) ) ( not ( = ?auto_412990 ?auto_413000 ) ) ( not ( = ?auto_412994 ?auto_412996 ) ) ( not ( = ?auto_412994 ?auto_412995 ) ) ( not ( = ?auto_412994 ?auto_412997 ) ) ( not ( = ?auto_412994 ?auto_412998 ) ) ( not ( = ?auto_412994 ?auto_413000 ) ) ( not ( = ?auto_412996 ?auto_412995 ) ) ( not ( = ?auto_412996 ?auto_412997 ) ) ( not ( = ?auto_412996 ?auto_412998 ) ) ( not ( = ?auto_412996 ?auto_413000 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_412995 ?auto_412997 ?auto_412998 )
      ( MAKE-8CRATE-VERIFY ?auto_412991 ?auto_412992 ?auto_412993 ?auto_412990 ?auto_412994 ?auto_412996 ?auto_412995 ?auto_412997 ?auto_412998 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_413084 - SURFACE
      ?auto_413085 - SURFACE
      ?auto_413086 - SURFACE
      ?auto_413083 - SURFACE
      ?auto_413087 - SURFACE
      ?auto_413089 - SURFACE
      ?auto_413088 - SURFACE
      ?auto_413090 - SURFACE
      ?auto_413091 - SURFACE
    )
    :vars
    (
      ?auto_413094 - HOIST
      ?auto_413095 - PLACE
      ?auto_413096 - PLACE
      ?auto_413092 - HOIST
      ?auto_413097 - SURFACE
      ?auto_413093 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_413094 ?auto_413095 ) ( IS-CRATE ?auto_413091 ) ( not ( = ?auto_413090 ?auto_413091 ) ) ( not ( = ?auto_413088 ?auto_413090 ) ) ( not ( = ?auto_413088 ?auto_413091 ) ) ( not ( = ?auto_413096 ?auto_413095 ) ) ( HOIST-AT ?auto_413092 ?auto_413096 ) ( not ( = ?auto_413094 ?auto_413092 ) ) ( AVAILABLE ?auto_413092 ) ( SURFACE-AT ?auto_413091 ?auto_413096 ) ( ON ?auto_413091 ?auto_413097 ) ( CLEAR ?auto_413091 ) ( not ( = ?auto_413090 ?auto_413097 ) ) ( not ( = ?auto_413091 ?auto_413097 ) ) ( not ( = ?auto_413088 ?auto_413097 ) ) ( TRUCK-AT ?auto_413093 ?auto_413095 ) ( SURFACE-AT ?auto_413088 ?auto_413095 ) ( CLEAR ?auto_413088 ) ( LIFTING ?auto_413094 ?auto_413090 ) ( IS-CRATE ?auto_413090 ) ( ON ?auto_413085 ?auto_413084 ) ( ON ?auto_413086 ?auto_413085 ) ( ON ?auto_413083 ?auto_413086 ) ( ON ?auto_413087 ?auto_413083 ) ( ON ?auto_413089 ?auto_413087 ) ( ON ?auto_413088 ?auto_413089 ) ( not ( = ?auto_413084 ?auto_413085 ) ) ( not ( = ?auto_413084 ?auto_413086 ) ) ( not ( = ?auto_413084 ?auto_413083 ) ) ( not ( = ?auto_413084 ?auto_413087 ) ) ( not ( = ?auto_413084 ?auto_413089 ) ) ( not ( = ?auto_413084 ?auto_413088 ) ) ( not ( = ?auto_413084 ?auto_413090 ) ) ( not ( = ?auto_413084 ?auto_413091 ) ) ( not ( = ?auto_413084 ?auto_413097 ) ) ( not ( = ?auto_413085 ?auto_413086 ) ) ( not ( = ?auto_413085 ?auto_413083 ) ) ( not ( = ?auto_413085 ?auto_413087 ) ) ( not ( = ?auto_413085 ?auto_413089 ) ) ( not ( = ?auto_413085 ?auto_413088 ) ) ( not ( = ?auto_413085 ?auto_413090 ) ) ( not ( = ?auto_413085 ?auto_413091 ) ) ( not ( = ?auto_413085 ?auto_413097 ) ) ( not ( = ?auto_413086 ?auto_413083 ) ) ( not ( = ?auto_413086 ?auto_413087 ) ) ( not ( = ?auto_413086 ?auto_413089 ) ) ( not ( = ?auto_413086 ?auto_413088 ) ) ( not ( = ?auto_413086 ?auto_413090 ) ) ( not ( = ?auto_413086 ?auto_413091 ) ) ( not ( = ?auto_413086 ?auto_413097 ) ) ( not ( = ?auto_413083 ?auto_413087 ) ) ( not ( = ?auto_413083 ?auto_413089 ) ) ( not ( = ?auto_413083 ?auto_413088 ) ) ( not ( = ?auto_413083 ?auto_413090 ) ) ( not ( = ?auto_413083 ?auto_413091 ) ) ( not ( = ?auto_413083 ?auto_413097 ) ) ( not ( = ?auto_413087 ?auto_413089 ) ) ( not ( = ?auto_413087 ?auto_413088 ) ) ( not ( = ?auto_413087 ?auto_413090 ) ) ( not ( = ?auto_413087 ?auto_413091 ) ) ( not ( = ?auto_413087 ?auto_413097 ) ) ( not ( = ?auto_413089 ?auto_413088 ) ) ( not ( = ?auto_413089 ?auto_413090 ) ) ( not ( = ?auto_413089 ?auto_413091 ) ) ( not ( = ?auto_413089 ?auto_413097 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_413088 ?auto_413090 ?auto_413091 )
      ( MAKE-8CRATE-VERIFY ?auto_413084 ?auto_413085 ?auto_413086 ?auto_413083 ?auto_413087 ?auto_413089 ?auto_413088 ?auto_413090 ?auto_413091 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_413177 - SURFACE
      ?auto_413178 - SURFACE
      ?auto_413179 - SURFACE
      ?auto_413176 - SURFACE
      ?auto_413180 - SURFACE
      ?auto_413182 - SURFACE
      ?auto_413181 - SURFACE
      ?auto_413183 - SURFACE
      ?auto_413184 - SURFACE
    )
    :vars
    (
      ?auto_413186 - HOIST
      ?auto_413187 - PLACE
      ?auto_413185 - PLACE
      ?auto_413190 - HOIST
      ?auto_413189 - SURFACE
      ?auto_413188 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_413186 ?auto_413187 ) ( IS-CRATE ?auto_413184 ) ( not ( = ?auto_413183 ?auto_413184 ) ) ( not ( = ?auto_413181 ?auto_413183 ) ) ( not ( = ?auto_413181 ?auto_413184 ) ) ( not ( = ?auto_413185 ?auto_413187 ) ) ( HOIST-AT ?auto_413190 ?auto_413185 ) ( not ( = ?auto_413186 ?auto_413190 ) ) ( AVAILABLE ?auto_413190 ) ( SURFACE-AT ?auto_413184 ?auto_413185 ) ( ON ?auto_413184 ?auto_413189 ) ( CLEAR ?auto_413184 ) ( not ( = ?auto_413183 ?auto_413189 ) ) ( not ( = ?auto_413184 ?auto_413189 ) ) ( not ( = ?auto_413181 ?auto_413189 ) ) ( TRUCK-AT ?auto_413188 ?auto_413187 ) ( SURFACE-AT ?auto_413181 ?auto_413187 ) ( CLEAR ?auto_413181 ) ( IS-CRATE ?auto_413183 ) ( AVAILABLE ?auto_413186 ) ( IN ?auto_413183 ?auto_413188 ) ( ON ?auto_413178 ?auto_413177 ) ( ON ?auto_413179 ?auto_413178 ) ( ON ?auto_413176 ?auto_413179 ) ( ON ?auto_413180 ?auto_413176 ) ( ON ?auto_413182 ?auto_413180 ) ( ON ?auto_413181 ?auto_413182 ) ( not ( = ?auto_413177 ?auto_413178 ) ) ( not ( = ?auto_413177 ?auto_413179 ) ) ( not ( = ?auto_413177 ?auto_413176 ) ) ( not ( = ?auto_413177 ?auto_413180 ) ) ( not ( = ?auto_413177 ?auto_413182 ) ) ( not ( = ?auto_413177 ?auto_413181 ) ) ( not ( = ?auto_413177 ?auto_413183 ) ) ( not ( = ?auto_413177 ?auto_413184 ) ) ( not ( = ?auto_413177 ?auto_413189 ) ) ( not ( = ?auto_413178 ?auto_413179 ) ) ( not ( = ?auto_413178 ?auto_413176 ) ) ( not ( = ?auto_413178 ?auto_413180 ) ) ( not ( = ?auto_413178 ?auto_413182 ) ) ( not ( = ?auto_413178 ?auto_413181 ) ) ( not ( = ?auto_413178 ?auto_413183 ) ) ( not ( = ?auto_413178 ?auto_413184 ) ) ( not ( = ?auto_413178 ?auto_413189 ) ) ( not ( = ?auto_413179 ?auto_413176 ) ) ( not ( = ?auto_413179 ?auto_413180 ) ) ( not ( = ?auto_413179 ?auto_413182 ) ) ( not ( = ?auto_413179 ?auto_413181 ) ) ( not ( = ?auto_413179 ?auto_413183 ) ) ( not ( = ?auto_413179 ?auto_413184 ) ) ( not ( = ?auto_413179 ?auto_413189 ) ) ( not ( = ?auto_413176 ?auto_413180 ) ) ( not ( = ?auto_413176 ?auto_413182 ) ) ( not ( = ?auto_413176 ?auto_413181 ) ) ( not ( = ?auto_413176 ?auto_413183 ) ) ( not ( = ?auto_413176 ?auto_413184 ) ) ( not ( = ?auto_413176 ?auto_413189 ) ) ( not ( = ?auto_413180 ?auto_413182 ) ) ( not ( = ?auto_413180 ?auto_413181 ) ) ( not ( = ?auto_413180 ?auto_413183 ) ) ( not ( = ?auto_413180 ?auto_413184 ) ) ( not ( = ?auto_413180 ?auto_413189 ) ) ( not ( = ?auto_413182 ?auto_413181 ) ) ( not ( = ?auto_413182 ?auto_413183 ) ) ( not ( = ?auto_413182 ?auto_413184 ) ) ( not ( = ?auto_413182 ?auto_413189 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_413181 ?auto_413183 ?auto_413184 )
      ( MAKE-8CRATE-VERIFY ?auto_413177 ?auto_413178 ?auto_413179 ?auto_413176 ?auto_413180 ?auto_413182 ?auto_413181 ?auto_413183 ?auto_413184 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_413871 - SURFACE
      ?auto_413872 - SURFACE
    )
    :vars
    (
      ?auto_413878 - HOIST
      ?auto_413879 - PLACE
      ?auto_413875 - SURFACE
      ?auto_413874 - TRUCK
      ?auto_413876 - PLACE
      ?auto_413877 - HOIST
      ?auto_413873 - SURFACE
      ?auto_413880 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_413878 ?auto_413879 ) ( SURFACE-AT ?auto_413871 ?auto_413879 ) ( CLEAR ?auto_413871 ) ( IS-CRATE ?auto_413872 ) ( not ( = ?auto_413871 ?auto_413872 ) ) ( AVAILABLE ?auto_413878 ) ( ON ?auto_413871 ?auto_413875 ) ( not ( = ?auto_413875 ?auto_413871 ) ) ( not ( = ?auto_413875 ?auto_413872 ) ) ( TRUCK-AT ?auto_413874 ?auto_413876 ) ( not ( = ?auto_413876 ?auto_413879 ) ) ( HOIST-AT ?auto_413877 ?auto_413876 ) ( not ( = ?auto_413878 ?auto_413877 ) ) ( SURFACE-AT ?auto_413872 ?auto_413876 ) ( ON ?auto_413872 ?auto_413873 ) ( CLEAR ?auto_413872 ) ( not ( = ?auto_413871 ?auto_413873 ) ) ( not ( = ?auto_413872 ?auto_413873 ) ) ( not ( = ?auto_413875 ?auto_413873 ) ) ( LIFTING ?auto_413877 ?auto_413880 ) ( IS-CRATE ?auto_413880 ) ( not ( = ?auto_413871 ?auto_413880 ) ) ( not ( = ?auto_413872 ?auto_413880 ) ) ( not ( = ?auto_413875 ?auto_413880 ) ) ( not ( = ?auto_413873 ?auto_413880 ) ) )
    :subtasks
    ( ( !LOAD ?auto_413877 ?auto_413880 ?auto_413874 ?auto_413876 )
      ( MAKE-1CRATE ?auto_413871 ?auto_413872 )
      ( MAKE-1CRATE-VERIFY ?auto_413871 ?auto_413872 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_417280 - SURFACE
      ?auto_417281 - SURFACE
      ?auto_417282 - SURFACE
      ?auto_417279 - SURFACE
      ?auto_417283 - SURFACE
      ?auto_417285 - SURFACE
      ?auto_417284 - SURFACE
      ?auto_417286 - SURFACE
      ?auto_417287 - SURFACE
      ?auto_417288 - SURFACE
    )
    :vars
    (
      ?auto_417290 - HOIST
      ?auto_417289 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_417290 ?auto_417289 ) ( SURFACE-AT ?auto_417287 ?auto_417289 ) ( CLEAR ?auto_417287 ) ( LIFTING ?auto_417290 ?auto_417288 ) ( IS-CRATE ?auto_417288 ) ( not ( = ?auto_417287 ?auto_417288 ) ) ( ON ?auto_417281 ?auto_417280 ) ( ON ?auto_417282 ?auto_417281 ) ( ON ?auto_417279 ?auto_417282 ) ( ON ?auto_417283 ?auto_417279 ) ( ON ?auto_417285 ?auto_417283 ) ( ON ?auto_417284 ?auto_417285 ) ( ON ?auto_417286 ?auto_417284 ) ( ON ?auto_417287 ?auto_417286 ) ( not ( = ?auto_417280 ?auto_417281 ) ) ( not ( = ?auto_417280 ?auto_417282 ) ) ( not ( = ?auto_417280 ?auto_417279 ) ) ( not ( = ?auto_417280 ?auto_417283 ) ) ( not ( = ?auto_417280 ?auto_417285 ) ) ( not ( = ?auto_417280 ?auto_417284 ) ) ( not ( = ?auto_417280 ?auto_417286 ) ) ( not ( = ?auto_417280 ?auto_417287 ) ) ( not ( = ?auto_417280 ?auto_417288 ) ) ( not ( = ?auto_417281 ?auto_417282 ) ) ( not ( = ?auto_417281 ?auto_417279 ) ) ( not ( = ?auto_417281 ?auto_417283 ) ) ( not ( = ?auto_417281 ?auto_417285 ) ) ( not ( = ?auto_417281 ?auto_417284 ) ) ( not ( = ?auto_417281 ?auto_417286 ) ) ( not ( = ?auto_417281 ?auto_417287 ) ) ( not ( = ?auto_417281 ?auto_417288 ) ) ( not ( = ?auto_417282 ?auto_417279 ) ) ( not ( = ?auto_417282 ?auto_417283 ) ) ( not ( = ?auto_417282 ?auto_417285 ) ) ( not ( = ?auto_417282 ?auto_417284 ) ) ( not ( = ?auto_417282 ?auto_417286 ) ) ( not ( = ?auto_417282 ?auto_417287 ) ) ( not ( = ?auto_417282 ?auto_417288 ) ) ( not ( = ?auto_417279 ?auto_417283 ) ) ( not ( = ?auto_417279 ?auto_417285 ) ) ( not ( = ?auto_417279 ?auto_417284 ) ) ( not ( = ?auto_417279 ?auto_417286 ) ) ( not ( = ?auto_417279 ?auto_417287 ) ) ( not ( = ?auto_417279 ?auto_417288 ) ) ( not ( = ?auto_417283 ?auto_417285 ) ) ( not ( = ?auto_417283 ?auto_417284 ) ) ( not ( = ?auto_417283 ?auto_417286 ) ) ( not ( = ?auto_417283 ?auto_417287 ) ) ( not ( = ?auto_417283 ?auto_417288 ) ) ( not ( = ?auto_417285 ?auto_417284 ) ) ( not ( = ?auto_417285 ?auto_417286 ) ) ( not ( = ?auto_417285 ?auto_417287 ) ) ( not ( = ?auto_417285 ?auto_417288 ) ) ( not ( = ?auto_417284 ?auto_417286 ) ) ( not ( = ?auto_417284 ?auto_417287 ) ) ( not ( = ?auto_417284 ?auto_417288 ) ) ( not ( = ?auto_417286 ?auto_417287 ) ) ( not ( = ?auto_417286 ?auto_417288 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_417287 ?auto_417288 )
      ( MAKE-9CRATE-VERIFY ?auto_417280 ?auto_417281 ?auto_417282 ?auto_417279 ?auto_417283 ?auto_417285 ?auto_417284 ?auto_417286 ?auto_417287 ?auto_417288 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_417360 - SURFACE
      ?auto_417361 - SURFACE
      ?auto_417362 - SURFACE
      ?auto_417359 - SURFACE
      ?auto_417363 - SURFACE
      ?auto_417365 - SURFACE
      ?auto_417364 - SURFACE
      ?auto_417366 - SURFACE
      ?auto_417367 - SURFACE
      ?auto_417368 - SURFACE
    )
    :vars
    (
      ?auto_417369 - HOIST
      ?auto_417371 - PLACE
      ?auto_417370 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_417369 ?auto_417371 ) ( SURFACE-AT ?auto_417367 ?auto_417371 ) ( CLEAR ?auto_417367 ) ( IS-CRATE ?auto_417368 ) ( not ( = ?auto_417367 ?auto_417368 ) ) ( TRUCK-AT ?auto_417370 ?auto_417371 ) ( AVAILABLE ?auto_417369 ) ( IN ?auto_417368 ?auto_417370 ) ( ON ?auto_417367 ?auto_417366 ) ( not ( = ?auto_417366 ?auto_417367 ) ) ( not ( = ?auto_417366 ?auto_417368 ) ) ( ON ?auto_417361 ?auto_417360 ) ( ON ?auto_417362 ?auto_417361 ) ( ON ?auto_417359 ?auto_417362 ) ( ON ?auto_417363 ?auto_417359 ) ( ON ?auto_417365 ?auto_417363 ) ( ON ?auto_417364 ?auto_417365 ) ( ON ?auto_417366 ?auto_417364 ) ( not ( = ?auto_417360 ?auto_417361 ) ) ( not ( = ?auto_417360 ?auto_417362 ) ) ( not ( = ?auto_417360 ?auto_417359 ) ) ( not ( = ?auto_417360 ?auto_417363 ) ) ( not ( = ?auto_417360 ?auto_417365 ) ) ( not ( = ?auto_417360 ?auto_417364 ) ) ( not ( = ?auto_417360 ?auto_417366 ) ) ( not ( = ?auto_417360 ?auto_417367 ) ) ( not ( = ?auto_417360 ?auto_417368 ) ) ( not ( = ?auto_417361 ?auto_417362 ) ) ( not ( = ?auto_417361 ?auto_417359 ) ) ( not ( = ?auto_417361 ?auto_417363 ) ) ( not ( = ?auto_417361 ?auto_417365 ) ) ( not ( = ?auto_417361 ?auto_417364 ) ) ( not ( = ?auto_417361 ?auto_417366 ) ) ( not ( = ?auto_417361 ?auto_417367 ) ) ( not ( = ?auto_417361 ?auto_417368 ) ) ( not ( = ?auto_417362 ?auto_417359 ) ) ( not ( = ?auto_417362 ?auto_417363 ) ) ( not ( = ?auto_417362 ?auto_417365 ) ) ( not ( = ?auto_417362 ?auto_417364 ) ) ( not ( = ?auto_417362 ?auto_417366 ) ) ( not ( = ?auto_417362 ?auto_417367 ) ) ( not ( = ?auto_417362 ?auto_417368 ) ) ( not ( = ?auto_417359 ?auto_417363 ) ) ( not ( = ?auto_417359 ?auto_417365 ) ) ( not ( = ?auto_417359 ?auto_417364 ) ) ( not ( = ?auto_417359 ?auto_417366 ) ) ( not ( = ?auto_417359 ?auto_417367 ) ) ( not ( = ?auto_417359 ?auto_417368 ) ) ( not ( = ?auto_417363 ?auto_417365 ) ) ( not ( = ?auto_417363 ?auto_417364 ) ) ( not ( = ?auto_417363 ?auto_417366 ) ) ( not ( = ?auto_417363 ?auto_417367 ) ) ( not ( = ?auto_417363 ?auto_417368 ) ) ( not ( = ?auto_417365 ?auto_417364 ) ) ( not ( = ?auto_417365 ?auto_417366 ) ) ( not ( = ?auto_417365 ?auto_417367 ) ) ( not ( = ?auto_417365 ?auto_417368 ) ) ( not ( = ?auto_417364 ?auto_417366 ) ) ( not ( = ?auto_417364 ?auto_417367 ) ) ( not ( = ?auto_417364 ?auto_417368 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_417366 ?auto_417367 ?auto_417368 )
      ( MAKE-9CRATE-VERIFY ?auto_417360 ?auto_417361 ?auto_417362 ?auto_417359 ?auto_417363 ?auto_417365 ?auto_417364 ?auto_417366 ?auto_417367 ?auto_417368 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_417450 - SURFACE
      ?auto_417451 - SURFACE
      ?auto_417452 - SURFACE
      ?auto_417449 - SURFACE
      ?auto_417453 - SURFACE
      ?auto_417455 - SURFACE
      ?auto_417454 - SURFACE
      ?auto_417456 - SURFACE
      ?auto_417457 - SURFACE
      ?auto_417458 - SURFACE
    )
    :vars
    (
      ?auto_417462 - HOIST
      ?auto_417460 - PLACE
      ?auto_417459 - TRUCK
      ?auto_417461 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_417462 ?auto_417460 ) ( SURFACE-AT ?auto_417457 ?auto_417460 ) ( CLEAR ?auto_417457 ) ( IS-CRATE ?auto_417458 ) ( not ( = ?auto_417457 ?auto_417458 ) ) ( AVAILABLE ?auto_417462 ) ( IN ?auto_417458 ?auto_417459 ) ( ON ?auto_417457 ?auto_417456 ) ( not ( = ?auto_417456 ?auto_417457 ) ) ( not ( = ?auto_417456 ?auto_417458 ) ) ( TRUCK-AT ?auto_417459 ?auto_417461 ) ( not ( = ?auto_417461 ?auto_417460 ) ) ( ON ?auto_417451 ?auto_417450 ) ( ON ?auto_417452 ?auto_417451 ) ( ON ?auto_417449 ?auto_417452 ) ( ON ?auto_417453 ?auto_417449 ) ( ON ?auto_417455 ?auto_417453 ) ( ON ?auto_417454 ?auto_417455 ) ( ON ?auto_417456 ?auto_417454 ) ( not ( = ?auto_417450 ?auto_417451 ) ) ( not ( = ?auto_417450 ?auto_417452 ) ) ( not ( = ?auto_417450 ?auto_417449 ) ) ( not ( = ?auto_417450 ?auto_417453 ) ) ( not ( = ?auto_417450 ?auto_417455 ) ) ( not ( = ?auto_417450 ?auto_417454 ) ) ( not ( = ?auto_417450 ?auto_417456 ) ) ( not ( = ?auto_417450 ?auto_417457 ) ) ( not ( = ?auto_417450 ?auto_417458 ) ) ( not ( = ?auto_417451 ?auto_417452 ) ) ( not ( = ?auto_417451 ?auto_417449 ) ) ( not ( = ?auto_417451 ?auto_417453 ) ) ( not ( = ?auto_417451 ?auto_417455 ) ) ( not ( = ?auto_417451 ?auto_417454 ) ) ( not ( = ?auto_417451 ?auto_417456 ) ) ( not ( = ?auto_417451 ?auto_417457 ) ) ( not ( = ?auto_417451 ?auto_417458 ) ) ( not ( = ?auto_417452 ?auto_417449 ) ) ( not ( = ?auto_417452 ?auto_417453 ) ) ( not ( = ?auto_417452 ?auto_417455 ) ) ( not ( = ?auto_417452 ?auto_417454 ) ) ( not ( = ?auto_417452 ?auto_417456 ) ) ( not ( = ?auto_417452 ?auto_417457 ) ) ( not ( = ?auto_417452 ?auto_417458 ) ) ( not ( = ?auto_417449 ?auto_417453 ) ) ( not ( = ?auto_417449 ?auto_417455 ) ) ( not ( = ?auto_417449 ?auto_417454 ) ) ( not ( = ?auto_417449 ?auto_417456 ) ) ( not ( = ?auto_417449 ?auto_417457 ) ) ( not ( = ?auto_417449 ?auto_417458 ) ) ( not ( = ?auto_417453 ?auto_417455 ) ) ( not ( = ?auto_417453 ?auto_417454 ) ) ( not ( = ?auto_417453 ?auto_417456 ) ) ( not ( = ?auto_417453 ?auto_417457 ) ) ( not ( = ?auto_417453 ?auto_417458 ) ) ( not ( = ?auto_417455 ?auto_417454 ) ) ( not ( = ?auto_417455 ?auto_417456 ) ) ( not ( = ?auto_417455 ?auto_417457 ) ) ( not ( = ?auto_417455 ?auto_417458 ) ) ( not ( = ?auto_417454 ?auto_417456 ) ) ( not ( = ?auto_417454 ?auto_417457 ) ) ( not ( = ?auto_417454 ?auto_417458 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_417456 ?auto_417457 ?auto_417458 )
      ( MAKE-9CRATE-VERIFY ?auto_417450 ?auto_417451 ?auto_417452 ?auto_417449 ?auto_417453 ?auto_417455 ?auto_417454 ?auto_417456 ?auto_417457 ?auto_417458 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_417549 - SURFACE
      ?auto_417550 - SURFACE
      ?auto_417551 - SURFACE
      ?auto_417548 - SURFACE
      ?auto_417552 - SURFACE
      ?auto_417554 - SURFACE
      ?auto_417553 - SURFACE
      ?auto_417555 - SURFACE
      ?auto_417556 - SURFACE
      ?auto_417557 - SURFACE
    )
    :vars
    (
      ?auto_417560 - HOIST
      ?auto_417558 - PLACE
      ?auto_417562 - TRUCK
      ?auto_417559 - PLACE
      ?auto_417561 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_417560 ?auto_417558 ) ( SURFACE-AT ?auto_417556 ?auto_417558 ) ( CLEAR ?auto_417556 ) ( IS-CRATE ?auto_417557 ) ( not ( = ?auto_417556 ?auto_417557 ) ) ( AVAILABLE ?auto_417560 ) ( ON ?auto_417556 ?auto_417555 ) ( not ( = ?auto_417555 ?auto_417556 ) ) ( not ( = ?auto_417555 ?auto_417557 ) ) ( TRUCK-AT ?auto_417562 ?auto_417559 ) ( not ( = ?auto_417559 ?auto_417558 ) ) ( HOIST-AT ?auto_417561 ?auto_417559 ) ( LIFTING ?auto_417561 ?auto_417557 ) ( not ( = ?auto_417560 ?auto_417561 ) ) ( ON ?auto_417550 ?auto_417549 ) ( ON ?auto_417551 ?auto_417550 ) ( ON ?auto_417548 ?auto_417551 ) ( ON ?auto_417552 ?auto_417548 ) ( ON ?auto_417554 ?auto_417552 ) ( ON ?auto_417553 ?auto_417554 ) ( ON ?auto_417555 ?auto_417553 ) ( not ( = ?auto_417549 ?auto_417550 ) ) ( not ( = ?auto_417549 ?auto_417551 ) ) ( not ( = ?auto_417549 ?auto_417548 ) ) ( not ( = ?auto_417549 ?auto_417552 ) ) ( not ( = ?auto_417549 ?auto_417554 ) ) ( not ( = ?auto_417549 ?auto_417553 ) ) ( not ( = ?auto_417549 ?auto_417555 ) ) ( not ( = ?auto_417549 ?auto_417556 ) ) ( not ( = ?auto_417549 ?auto_417557 ) ) ( not ( = ?auto_417550 ?auto_417551 ) ) ( not ( = ?auto_417550 ?auto_417548 ) ) ( not ( = ?auto_417550 ?auto_417552 ) ) ( not ( = ?auto_417550 ?auto_417554 ) ) ( not ( = ?auto_417550 ?auto_417553 ) ) ( not ( = ?auto_417550 ?auto_417555 ) ) ( not ( = ?auto_417550 ?auto_417556 ) ) ( not ( = ?auto_417550 ?auto_417557 ) ) ( not ( = ?auto_417551 ?auto_417548 ) ) ( not ( = ?auto_417551 ?auto_417552 ) ) ( not ( = ?auto_417551 ?auto_417554 ) ) ( not ( = ?auto_417551 ?auto_417553 ) ) ( not ( = ?auto_417551 ?auto_417555 ) ) ( not ( = ?auto_417551 ?auto_417556 ) ) ( not ( = ?auto_417551 ?auto_417557 ) ) ( not ( = ?auto_417548 ?auto_417552 ) ) ( not ( = ?auto_417548 ?auto_417554 ) ) ( not ( = ?auto_417548 ?auto_417553 ) ) ( not ( = ?auto_417548 ?auto_417555 ) ) ( not ( = ?auto_417548 ?auto_417556 ) ) ( not ( = ?auto_417548 ?auto_417557 ) ) ( not ( = ?auto_417552 ?auto_417554 ) ) ( not ( = ?auto_417552 ?auto_417553 ) ) ( not ( = ?auto_417552 ?auto_417555 ) ) ( not ( = ?auto_417552 ?auto_417556 ) ) ( not ( = ?auto_417552 ?auto_417557 ) ) ( not ( = ?auto_417554 ?auto_417553 ) ) ( not ( = ?auto_417554 ?auto_417555 ) ) ( not ( = ?auto_417554 ?auto_417556 ) ) ( not ( = ?auto_417554 ?auto_417557 ) ) ( not ( = ?auto_417553 ?auto_417555 ) ) ( not ( = ?auto_417553 ?auto_417556 ) ) ( not ( = ?auto_417553 ?auto_417557 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_417555 ?auto_417556 ?auto_417557 )
      ( MAKE-9CRATE-VERIFY ?auto_417549 ?auto_417550 ?auto_417551 ?auto_417548 ?auto_417552 ?auto_417554 ?auto_417553 ?auto_417555 ?auto_417556 ?auto_417557 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_417657 - SURFACE
      ?auto_417658 - SURFACE
      ?auto_417659 - SURFACE
      ?auto_417656 - SURFACE
      ?auto_417660 - SURFACE
      ?auto_417662 - SURFACE
      ?auto_417661 - SURFACE
      ?auto_417663 - SURFACE
      ?auto_417664 - SURFACE
      ?auto_417665 - SURFACE
    )
    :vars
    (
      ?auto_417666 - HOIST
      ?auto_417667 - PLACE
      ?auto_417668 - TRUCK
      ?auto_417671 - PLACE
      ?auto_417669 - HOIST
      ?auto_417670 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_417666 ?auto_417667 ) ( SURFACE-AT ?auto_417664 ?auto_417667 ) ( CLEAR ?auto_417664 ) ( IS-CRATE ?auto_417665 ) ( not ( = ?auto_417664 ?auto_417665 ) ) ( AVAILABLE ?auto_417666 ) ( ON ?auto_417664 ?auto_417663 ) ( not ( = ?auto_417663 ?auto_417664 ) ) ( not ( = ?auto_417663 ?auto_417665 ) ) ( TRUCK-AT ?auto_417668 ?auto_417671 ) ( not ( = ?auto_417671 ?auto_417667 ) ) ( HOIST-AT ?auto_417669 ?auto_417671 ) ( not ( = ?auto_417666 ?auto_417669 ) ) ( AVAILABLE ?auto_417669 ) ( SURFACE-AT ?auto_417665 ?auto_417671 ) ( ON ?auto_417665 ?auto_417670 ) ( CLEAR ?auto_417665 ) ( not ( = ?auto_417664 ?auto_417670 ) ) ( not ( = ?auto_417665 ?auto_417670 ) ) ( not ( = ?auto_417663 ?auto_417670 ) ) ( ON ?auto_417658 ?auto_417657 ) ( ON ?auto_417659 ?auto_417658 ) ( ON ?auto_417656 ?auto_417659 ) ( ON ?auto_417660 ?auto_417656 ) ( ON ?auto_417662 ?auto_417660 ) ( ON ?auto_417661 ?auto_417662 ) ( ON ?auto_417663 ?auto_417661 ) ( not ( = ?auto_417657 ?auto_417658 ) ) ( not ( = ?auto_417657 ?auto_417659 ) ) ( not ( = ?auto_417657 ?auto_417656 ) ) ( not ( = ?auto_417657 ?auto_417660 ) ) ( not ( = ?auto_417657 ?auto_417662 ) ) ( not ( = ?auto_417657 ?auto_417661 ) ) ( not ( = ?auto_417657 ?auto_417663 ) ) ( not ( = ?auto_417657 ?auto_417664 ) ) ( not ( = ?auto_417657 ?auto_417665 ) ) ( not ( = ?auto_417657 ?auto_417670 ) ) ( not ( = ?auto_417658 ?auto_417659 ) ) ( not ( = ?auto_417658 ?auto_417656 ) ) ( not ( = ?auto_417658 ?auto_417660 ) ) ( not ( = ?auto_417658 ?auto_417662 ) ) ( not ( = ?auto_417658 ?auto_417661 ) ) ( not ( = ?auto_417658 ?auto_417663 ) ) ( not ( = ?auto_417658 ?auto_417664 ) ) ( not ( = ?auto_417658 ?auto_417665 ) ) ( not ( = ?auto_417658 ?auto_417670 ) ) ( not ( = ?auto_417659 ?auto_417656 ) ) ( not ( = ?auto_417659 ?auto_417660 ) ) ( not ( = ?auto_417659 ?auto_417662 ) ) ( not ( = ?auto_417659 ?auto_417661 ) ) ( not ( = ?auto_417659 ?auto_417663 ) ) ( not ( = ?auto_417659 ?auto_417664 ) ) ( not ( = ?auto_417659 ?auto_417665 ) ) ( not ( = ?auto_417659 ?auto_417670 ) ) ( not ( = ?auto_417656 ?auto_417660 ) ) ( not ( = ?auto_417656 ?auto_417662 ) ) ( not ( = ?auto_417656 ?auto_417661 ) ) ( not ( = ?auto_417656 ?auto_417663 ) ) ( not ( = ?auto_417656 ?auto_417664 ) ) ( not ( = ?auto_417656 ?auto_417665 ) ) ( not ( = ?auto_417656 ?auto_417670 ) ) ( not ( = ?auto_417660 ?auto_417662 ) ) ( not ( = ?auto_417660 ?auto_417661 ) ) ( not ( = ?auto_417660 ?auto_417663 ) ) ( not ( = ?auto_417660 ?auto_417664 ) ) ( not ( = ?auto_417660 ?auto_417665 ) ) ( not ( = ?auto_417660 ?auto_417670 ) ) ( not ( = ?auto_417662 ?auto_417661 ) ) ( not ( = ?auto_417662 ?auto_417663 ) ) ( not ( = ?auto_417662 ?auto_417664 ) ) ( not ( = ?auto_417662 ?auto_417665 ) ) ( not ( = ?auto_417662 ?auto_417670 ) ) ( not ( = ?auto_417661 ?auto_417663 ) ) ( not ( = ?auto_417661 ?auto_417664 ) ) ( not ( = ?auto_417661 ?auto_417665 ) ) ( not ( = ?auto_417661 ?auto_417670 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_417663 ?auto_417664 ?auto_417665 )
      ( MAKE-9CRATE-VERIFY ?auto_417657 ?auto_417658 ?auto_417659 ?auto_417656 ?auto_417660 ?auto_417662 ?auto_417661 ?auto_417663 ?auto_417664 ?auto_417665 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_417766 - SURFACE
      ?auto_417767 - SURFACE
      ?auto_417768 - SURFACE
      ?auto_417765 - SURFACE
      ?auto_417769 - SURFACE
      ?auto_417771 - SURFACE
      ?auto_417770 - SURFACE
      ?auto_417772 - SURFACE
      ?auto_417773 - SURFACE
      ?auto_417774 - SURFACE
    )
    :vars
    (
      ?auto_417775 - HOIST
      ?auto_417778 - PLACE
      ?auto_417777 - PLACE
      ?auto_417780 - HOIST
      ?auto_417779 - SURFACE
      ?auto_417776 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_417775 ?auto_417778 ) ( SURFACE-AT ?auto_417773 ?auto_417778 ) ( CLEAR ?auto_417773 ) ( IS-CRATE ?auto_417774 ) ( not ( = ?auto_417773 ?auto_417774 ) ) ( AVAILABLE ?auto_417775 ) ( ON ?auto_417773 ?auto_417772 ) ( not ( = ?auto_417772 ?auto_417773 ) ) ( not ( = ?auto_417772 ?auto_417774 ) ) ( not ( = ?auto_417777 ?auto_417778 ) ) ( HOIST-AT ?auto_417780 ?auto_417777 ) ( not ( = ?auto_417775 ?auto_417780 ) ) ( AVAILABLE ?auto_417780 ) ( SURFACE-AT ?auto_417774 ?auto_417777 ) ( ON ?auto_417774 ?auto_417779 ) ( CLEAR ?auto_417774 ) ( not ( = ?auto_417773 ?auto_417779 ) ) ( not ( = ?auto_417774 ?auto_417779 ) ) ( not ( = ?auto_417772 ?auto_417779 ) ) ( TRUCK-AT ?auto_417776 ?auto_417778 ) ( ON ?auto_417767 ?auto_417766 ) ( ON ?auto_417768 ?auto_417767 ) ( ON ?auto_417765 ?auto_417768 ) ( ON ?auto_417769 ?auto_417765 ) ( ON ?auto_417771 ?auto_417769 ) ( ON ?auto_417770 ?auto_417771 ) ( ON ?auto_417772 ?auto_417770 ) ( not ( = ?auto_417766 ?auto_417767 ) ) ( not ( = ?auto_417766 ?auto_417768 ) ) ( not ( = ?auto_417766 ?auto_417765 ) ) ( not ( = ?auto_417766 ?auto_417769 ) ) ( not ( = ?auto_417766 ?auto_417771 ) ) ( not ( = ?auto_417766 ?auto_417770 ) ) ( not ( = ?auto_417766 ?auto_417772 ) ) ( not ( = ?auto_417766 ?auto_417773 ) ) ( not ( = ?auto_417766 ?auto_417774 ) ) ( not ( = ?auto_417766 ?auto_417779 ) ) ( not ( = ?auto_417767 ?auto_417768 ) ) ( not ( = ?auto_417767 ?auto_417765 ) ) ( not ( = ?auto_417767 ?auto_417769 ) ) ( not ( = ?auto_417767 ?auto_417771 ) ) ( not ( = ?auto_417767 ?auto_417770 ) ) ( not ( = ?auto_417767 ?auto_417772 ) ) ( not ( = ?auto_417767 ?auto_417773 ) ) ( not ( = ?auto_417767 ?auto_417774 ) ) ( not ( = ?auto_417767 ?auto_417779 ) ) ( not ( = ?auto_417768 ?auto_417765 ) ) ( not ( = ?auto_417768 ?auto_417769 ) ) ( not ( = ?auto_417768 ?auto_417771 ) ) ( not ( = ?auto_417768 ?auto_417770 ) ) ( not ( = ?auto_417768 ?auto_417772 ) ) ( not ( = ?auto_417768 ?auto_417773 ) ) ( not ( = ?auto_417768 ?auto_417774 ) ) ( not ( = ?auto_417768 ?auto_417779 ) ) ( not ( = ?auto_417765 ?auto_417769 ) ) ( not ( = ?auto_417765 ?auto_417771 ) ) ( not ( = ?auto_417765 ?auto_417770 ) ) ( not ( = ?auto_417765 ?auto_417772 ) ) ( not ( = ?auto_417765 ?auto_417773 ) ) ( not ( = ?auto_417765 ?auto_417774 ) ) ( not ( = ?auto_417765 ?auto_417779 ) ) ( not ( = ?auto_417769 ?auto_417771 ) ) ( not ( = ?auto_417769 ?auto_417770 ) ) ( not ( = ?auto_417769 ?auto_417772 ) ) ( not ( = ?auto_417769 ?auto_417773 ) ) ( not ( = ?auto_417769 ?auto_417774 ) ) ( not ( = ?auto_417769 ?auto_417779 ) ) ( not ( = ?auto_417771 ?auto_417770 ) ) ( not ( = ?auto_417771 ?auto_417772 ) ) ( not ( = ?auto_417771 ?auto_417773 ) ) ( not ( = ?auto_417771 ?auto_417774 ) ) ( not ( = ?auto_417771 ?auto_417779 ) ) ( not ( = ?auto_417770 ?auto_417772 ) ) ( not ( = ?auto_417770 ?auto_417773 ) ) ( not ( = ?auto_417770 ?auto_417774 ) ) ( not ( = ?auto_417770 ?auto_417779 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_417772 ?auto_417773 ?auto_417774 )
      ( MAKE-9CRATE-VERIFY ?auto_417766 ?auto_417767 ?auto_417768 ?auto_417765 ?auto_417769 ?auto_417771 ?auto_417770 ?auto_417772 ?auto_417773 ?auto_417774 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_417875 - SURFACE
      ?auto_417876 - SURFACE
      ?auto_417877 - SURFACE
      ?auto_417874 - SURFACE
      ?auto_417878 - SURFACE
      ?auto_417880 - SURFACE
      ?auto_417879 - SURFACE
      ?auto_417881 - SURFACE
      ?auto_417882 - SURFACE
      ?auto_417883 - SURFACE
    )
    :vars
    (
      ?auto_417888 - HOIST
      ?auto_417889 - PLACE
      ?auto_417884 - PLACE
      ?auto_417887 - HOIST
      ?auto_417886 - SURFACE
      ?auto_417885 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_417888 ?auto_417889 ) ( IS-CRATE ?auto_417883 ) ( not ( = ?auto_417882 ?auto_417883 ) ) ( not ( = ?auto_417881 ?auto_417882 ) ) ( not ( = ?auto_417881 ?auto_417883 ) ) ( not ( = ?auto_417884 ?auto_417889 ) ) ( HOIST-AT ?auto_417887 ?auto_417884 ) ( not ( = ?auto_417888 ?auto_417887 ) ) ( AVAILABLE ?auto_417887 ) ( SURFACE-AT ?auto_417883 ?auto_417884 ) ( ON ?auto_417883 ?auto_417886 ) ( CLEAR ?auto_417883 ) ( not ( = ?auto_417882 ?auto_417886 ) ) ( not ( = ?auto_417883 ?auto_417886 ) ) ( not ( = ?auto_417881 ?auto_417886 ) ) ( TRUCK-AT ?auto_417885 ?auto_417889 ) ( SURFACE-AT ?auto_417881 ?auto_417889 ) ( CLEAR ?auto_417881 ) ( LIFTING ?auto_417888 ?auto_417882 ) ( IS-CRATE ?auto_417882 ) ( ON ?auto_417876 ?auto_417875 ) ( ON ?auto_417877 ?auto_417876 ) ( ON ?auto_417874 ?auto_417877 ) ( ON ?auto_417878 ?auto_417874 ) ( ON ?auto_417880 ?auto_417878 ) ( ON ?auto_417879 ?auto_417880 ) ( ON ?auto_417881 ?auto_417879 ) ( not ( = ?auto_417875 ?auto_417876 ) ) ( not ( = ?auto_417875 ?auto_417877 ) ) ( not ( = ?auto_417875 ?auto_417874 ) ) ( not ( = ?auto_417875 ?auto_417878 ) ) ( not ( = ?auto_417875 ?auto_417880 ) ) ( not ( = ?auto_417875 ?auto_417879 ) ) ( not ( = ?auto_417875 ?auto_417881 ) ) ( not ( = ?auto_417875 ?auto_417882 ) ) ( not ( = ?auto_417875 ?auto_417883 ) ) ( not ( = ?auto_417875 ?auto_417886 ) ) ( not ( = ?auto_417876 ?auto_417877 ) ) ( not ( = ?auto_417876 ?auto_417874 ) ) ( not ( = ?auto_417876 ?auto_417878 ) ) ( not ( = ?auto_417876 ?auto_417880 ) ) ( not ( = ?auto_417876 ?auto_417879 ) ) ( not ( = ?auto_417876 ?auto_417881 ) ) ( not ( = ?auto_417876 ?auto_417882 ) ) ( not ( = ?auto_417876 ?auto_417883 ) ) ( not ( = ?auto_417876 ?auto_417886 ) ) ( not ( = ?auto_417877 ?auto_417874 ) ) ( not ( = ?auto_417877 ?auto_417878 ) ) ( not ( = ?auto_417877 ?auto_417880 ) ) ( not ( = ?auto_417877 ?auto_417879 ) ) ( not ( = ?auto_417877 ?auto_417881 ) ) ( not ( = ?auto_417877 ?auto_417882 ) ) ( not ( = ?auto_417877 ?auto_417883 ) ) ( not ( = ?auto_417877 ?auto_417886 ) ) ( not ( = ?auto_417874 ?auto_417878 ) ) ( not ( = ?auto_417874 ?auto_417880 ) ) ( not ( = ?auto_417874 ?auto_417879 ) ) ( not ( = ?auto_417874 ?auto_417881 ) ) ( not ( = ?auto_417874 ?auto_417882 ) ) ( not ( = ?auto_417874 ?auto_417883 ) ) ( not ( = ?auto_417874 ?auto_417886 ) ) ( not ( = ?auto_417878 ?auto_417880 ) ) ( not ( = ?auto_417878 ?auto_417879 ) ) ( not ( = ?auto_417878 ?auto_417881 ) ) ( not ( = ?auto_417878 ?auto_417882 ) ) ( not ( = ?auto_417878 ?auto_417883 ) ) ( not ( = ?auto_417878 ?auto_417886 ) ) ( not ( = ?auto_417880 ?auto_417879 ) ) ( not ( = ?auto_417880 ?auto_417881 ) ) ( not ( = ?auto_417880 ?auto_417882 ) ) ( not ( = ?auto_417880 ?auto_417883 ) ) ( not ( = ?auto_417880 ?auto_417886 ) ) ( not ( = ?auto_417879 ?auto_417881 ) ) ( not ( = ?auto_417879 ?auto_417882 ) ) ( not ( = ?auto_417879 ?auto_417883 ) ) ( not ( = ?auto_417879 ?auto_417886 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_417881 ?auto_417882 ?auto_417883 )
      ( MAKE-9CRATE-VERIFY ?auto_417875 ?auto_417876 ?auto_417877 ?auto_417874 ?auto_417878 ?auto_417880 ?auto_417879 ?auto_417881 ?auto_417882 ?auto_417883 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_417984 - SURFACE
      ?auto_417985 - SURFACE
      ?auto_417986 - SURFACE
      ?auto_417983 - SURFACE
      ?auto_417987 - SURFACE
      ?auto_417989 - SURFACE
      ?auto_417988 - SURFACE
      ?auto_417990 - SURFACE
      ?auto_417991 - SURFACE
      ?auto_417992 - SURFACE
    )
    :vars
    (
      ?auto_417996 - HOIST
      ?auto_417993 - PLACE
      ?auto_417997 - PLACE
      ?auto_417994 - HOIST
      ?auto_417995 - SURFACE
      ?auto_417998 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_417996 ?auto_417993 ) ( IS-CRATE ?auto_417992 ) ( not ( = ?auto_417991 ?auto_417992 ) ) ( not ( = ?auto_417990 ?auto_417991 ) ) ( not ( = ?auto_417990 ?auto_417992 ) ) ( not ( = ?auto_417997 ?auto_417993 ) ) ( HOIST-AT ?auto_417994 ?auto_417997 ) ( not ( = ?auto_417996 ?auto_417994 ) ) ( AVAILABLE ?auto_417994 ) ( SURFACE-AT ?auto_417992 ?auto_417997 ) ( ON ?auto_417992 ?auto_417995 ) ( CLEAR ?auto_417992 ) ( not ( = ?auto_417991 ?auto_417995 ) ) ( not ( = ?auto_417992 ?auto_417995 ) ) ( not ( = ?auto_417990 ?auto_417995 ) ) ( TRUCK-AT ?auto_417998 ?auto_417993 ) ( SURFACE-AT ?auto_417990 ?auto_417993 ) ( CLEAR ?auto_417990 ) ( IS-CRATE ?auto_417991 ) ( AVAILABLE ?auto_417996 ) ( IN ?auto_417991 ?auto_417998 ) ( ON ?auto_417985 ?auto_417984 ) ( ON ?auto_417986 ?auto_417985 ) ( ON ?auto_417983 ?auto_417986 ) ( ON ?auto_417987 ?auto_417983 ) ( ON ?auto_417989 ?auto_417987 ) ( ON ?auto_417988 ?auto_417989 ) ( ON ?auto_417990 ?auto_417988 ) ( not ( = ?auto_417984 ?auto_417985 ) ) ( not ( = ?auto_417984 ?auto_417986 ) ) ( not ( = ?auto_417984 ?auto_417983 ) ) ( not ( = ?auto_417984 ?auto_417987 ) ) ( not ( = ?auto_417984 ?auto_417989 ) ) ( not ( = ?auto_417984 ?auto_417988 ) ) ( not ( = ?auto_417984 ?auto_417990 ) ) ( not ( = ?auto_417984 ?auto_417991 ) ) ( not ( = ?auto_417984 ?auto_417992 ) ) ( not ( = ?auto_417984 ?auto_417995 ) ) ( not ( = ?auto_417985 ?auto_417986 ) ) ( not ( = ?auto_417985 ?auto_417983 ) ) ( not ( = ?auto_417985 ?auto_417987 ) ) ( not ( = ?auto_417985 ?auto_417989 ) ) ( not ( = ?auto_417985 ?auto_417988 ) ) ( not ( = ?auto_417985 ?auto_417990 ) ) ( not ( = ?auto_417985 ?auto_417991 ) ) ( not ( = ?auto_417985 ?auto_417992 ) ) ( not ( = ?auto_417985 ?auto_417995 ) ) ( not ( = ?auto_417986 ?auto_417983 ) ) ( not ( = ?auto_417986 ?auto_417987 ) ) ( not ( = ?auto_417986 ?auto_417989 ) ) ( not ( = ?auto_417986 ?auto_417988 ) ) ( not ( = ?auto_417986 ?auto_417990 ) ) ( not ( = ?auto_417986 ?auto_417991 ) ) ( not ( = ?auto_417986 ?auto_417992 ) ) ( not ( = ?auto_417986 ?auto_417995 ) ) ( not ( = ?auto_417983 ?auto_417987 ) ) ( not ( = ?auto_417983 ?auto_417989 ) ) ( not ( = ?auto_417983 ?auto_417988 ) ) ( not ( = ?auto_417983 ?auto_417990 ) ) ( not ( = ?auto_417983 ?auto_417991 ) ) ( not ( = ?auto_417983 ?auto_417992 ) ) ( not ( = ?auto_417983 ?auto_417995 ) ) ( not ( = ?auto_417987 ?auto_417989 ) ) ( not ( = ?auto_417987 ?auto_417988 ) ) ( not ( = ?auto_417987 ?auto_417990 ) ) ( not ( = ?auto_417987 ?auto_417991 ) ) ( not ( = ?auto_417987 ?auto_417992 ) ) ( not ( = ?auto_417987 ?auto_417995 ) ) ( not ( = ?auto_417989 ?auto_417988 ) ) ( not ( = ?auto_417989 ?auto_417990 ) ) ( not ( = ?auto_417989 ?auto_417991 ) ) ( not ( = ?auto_417989 ?auto_417992 ) ) ( not ( = ?auto_417989 ?auto_417995 ) ) ( not ( = ?auto_417988 ?auto_417990 ) ) ( not ( = ?auto_417988 ?auto_417991 ) ) ( not ( = ?auto_417988 ?auto_417992 ) ) ( not ( = ?auto_417988 ?auto_417995 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_417990 ?auto_417991 ?auto_417992 )
      ( MAKE-9CRATE-VERIFY ?auto_417984 ?auto_417985 ?auto_417986 ?auto_417983 ?auto_417987 ?auto_417989 ?auto_417988 ?auto_417990 ?auto_417991 ?auto_417992 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_423534 - SURFACE
      ?auto_423535 - SURFACE
      ?auto_423536 - SURFACE
      ?auto_423533 - SURFACE
      ?auto_423537 - SURFACE
      ?auto_423539 - SURFACE
      ?auto_423538 - SURFACE
      ?auto_423540 - SURFACE
      ?auto_423541 - SURFACE
      ?auto_423542 - SURFACE
      ?auto_423543 - SURFACE
    )
    :vars
    (
      ?auto_423545 - HOIST
      ?auto_423544 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_423545 ?auto_423544 ) ( SURFACE-AT ?auto_423542 ?auto_423544 ) ( CLEAR ?auto_423542 ) ( LIFTING ?auto_423545 ?auto_423543 ) ( IS-CRATE ?auto_423543 ) ( not ( = ?auto_423542 ?auto_423543 ) ) ( ON ?auto_423535 ?auto_423534 ) ( ON ?auto_423536 ?auto_423535 ) ( ON ?auto_423533 ?auto_423536 ) ( ON ?auto_423537 ?auto_423533 ) ( ON ?auto_423539 ?auto_423537 ) ( ON ?auto_423538 ?auto_423539 ) ( ON ?auto_423540 ?auto_423538 ) ( ON ?auto_423541 ?auto_423540 ) ( ON ?auto_423542 ?auto_423541 ) ( not ( = ?auto_423534 ?auto_423535 ) ) ( not ( = ?auto_423534 ?auto_423536 ) ) ( not ( = ?auto_423534 ?auto_423533 ) ) ( not ( = ?auto_423534 ?auto_423537 ) ) ( not ( = ?auto_423534 ?auto_423539 ) ) ( not ( = ?auto_423534 ?auto_423538 ) ) ( not ( = ?auto_423534 ?auto_423540 ) ) ( not ( = ?auto_423534 ?auto_423541 ) ) ( not ( = ?auto_423534 ?auto_423542 ) ) ( not ( = ?auto_423534 ?auto_423543 ) ) ( not ( = ?auto_423535 ?auto_423536 ) ) ( not ( = ?auto_423535 ?auto_423533 ) ) ( not ( = ?auto_423535 ?auto_423537 ) ) ( not ( = ?auto_423535 ?auto_423539 ) ) ( not ( = ?auto_423535 ?auto_423538 ) ) ( not ( = ?auto_423535 ?auto_423540 ) ) ( not ( = ?auto_423535 ?auto_423541 ) ) ( not ( = ?auto_423535 ?auto_423542 ) ) ( not ( = ?auto_423535 ?auto_423543 ) ) ( not ( = ?auto_423536 ?auto_423533 ) ) ( not ( = ?auto_423536 ?auto_423537 ) ) ( not ( = ?auto_423536 ?auto_423539 ) ) ( not ( = ?auto_423536 ?auto_423538 ) ) ( not ( = ?auto_423536 ?auto_423540 ) ) ( not ( = ?auto_423536 ?auto_423541 ) ) ( not ( = ?auto_423536 ?auto_423542 ) ) ( not ( = ?auto_423536 ?auto_423543 ) ) ( not ( = ?auto_423533 ?auto_423537 ) ) ( not ( = ?auto_423533 ?auto_423539 ) ) ( not ( = ?auto_423533 ?auto_423538 ) ) ( not ( = ?auto_423533 ?auto_423540 ) ) ( not ( = ?auto_423533 ?auto_423541 ) ) ( not ( = ?auto_423533 ?auto_423542 ) ) ( not ( = ?auto_423533 ?auto_423543 ) ) ( not ( = ?auto_423537 ?auto_423539 ) ) ( not ( = ?auto_423537 ?auto_423538 ) ) ( not ( = ?auto_423537 ?auto_423540 ) ) ( not ( = ?auto_423537 ?auto_423541 ) ) ( not ( = ?auto_423537 ?auto_423542 ) ) ( not ( = ?auto_423537 ?auto_423543 ) ) ( not ( = ?auto_423539 ?auto_423538 ) ) ( not ( = ?auto_423539 ?auto_423540 ) ) ( not ( = ?auto_423539 ?auto_423541 ) ) ( not ( = ?auto_423539 ?auto_423542 ) ) ( not ( = ?auto_423539 ?auto_423543 ) ) ( not ( = ?auto_423538 ?auto_423540 ) ) ( not ( = ?auto_423538 ?auto_423541 ) ) ( not ( = ?auto_423538 ?auto_423542 ) ) ( not ( = ?auto_423538 ?auto_423543 ) ) ( not ( = ?auto_423540 ?auto_423541 ) ) ( not ( = ?auto_423540 ?auto_423542 ) ) ( not ( = ?auto_423540 ?auto_423543 ) ) ( not ( = ?auto_423541 ?auto_423542 ) ) ( not ( = ?auto_423541 ?auto_423543 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_423542 ?auto_423543 )
      ( MAKE-10CRATE-VERIFY ?auto_423534 ?auto_423535 ?auto_423536 ?auto_423533 ?auto_423537 ?auto_423539 ?auto_423538 ?auto_423540 ?auto_423541 ?auto_423542 ?auto_423543 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_423628 - SURFACE
      ?auto_423629 - SURFACE
      ?auto_423630 - SURFACE
      ?auto_423627 - SURFACE
      ?auto_423631 - SURFACE
      ?auto_423633 - SURFACE
      ?auto_423632 - SURFACE
      ?auto_423634 - SURFACE
      ?auto_423635 - SURFACE
      ?auto_423636 - SURFACE
      ?auto_423637 - SURFACE
    )
    :vars
    (
      ?auto_423640 - HOIST
      ?auto_423639 - PLACE
      ?auto_423638 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_423640 ?auto_423639 ) ( SURFACE-AT ?auto_423636 ?auto_423639 ) ( CLEAR ?auto_423636 ) ( IS-CRATE ?auto_423637 ) ( not ( = ?auto_423636 ?auto_423637 ) ) ( TRUCK-AT ?auto_423638 ?auto_423639 ) ( AVAILABLE ?auto_423640 ) ( IN ?auto_423637 ?auto_423638 ) ( ON ?auto_423636 ?auto_423635 ) ( not ( = ?auto_423635 ?auto_423636 ) ) ( not ( = ?auto_423635 ?auto_423637 ) ) ( ON ?auto_423629 ?auto_423628 ) ( ON ?auto_423630 ?auto_423629 ) ( ON ?auto_423627 ?auto_423630 ) ( ON ?auto_423631 ?auto_423627 ) ( ON ?auto_423633 ?auto_423631 ) ( ON ?auto_423632 ?auto_423633 ) ( ON ?auto_423634 ?auto_423632 ) ( ON ?auto_423635 ?auto_423634 ) ( not ( = ?auto_423628 ?auto_423629 ) ) ( not ( = ?auto_423628 ?auto_423630 ) ) ( not ( = ?auto_423628 ?auto_423627 ) ) ( not ( = ?auto_423628 ?auto_423631 ) ) ( not ( = ?auto_423628 ?auto_423633 ) ) ( not ( = ?auto_423628 ?auto_423632 ) ) ( not ( = ?auto_423628 ?auto_423634 ) ) ( not ( = ?auto_423628 ?auto_423635 ) ) ( not ( = ?auto_423628 ?auto_423636 ) ) ( not ( = ?auto_423628 ?auto_423637 ) ) ( not ( = ?auto_423629 ?auto_423630 ) ) ( not ( = ?auto_423629 ?auto_423627 ) ) ( not ( = ?auto_423629 ?auto_423631 ) ) ( not ( = ?auto_423629 ?auto_423633 ) ) ( not ( = ?auto_423629 ?auto_423632 ) ) ( not ( = ?auto_423629 ?auto_423634 ) ) ( not ( = ?auto_423629 ?auto_423635 ) ) ( not ( = ?auto_423629 ?auto_423636 ) ) ( not ( = ?auto_423629 ?auto_423637 ) ) ( not ( = ?auto_423630 ?auto_423627 ) ) ( not ( = ?auto_423630 ?auto_423631 ) ) ( not ( = ?auto_423630 ?auto_423633 ) ) ( not ( = ?auto_423630 ?auto_423632 ) ) ( not ( = ?auto_423630 ?auto_423634 ) ) ( not ( = ?auto_423630 ?auto_423635 ) ) ( not ( = ?auto_423630 ?auto_423636 ) ) ( not ( = ?auto_423630 ?auto_423637 ) ) ( not ( = ?auto_423627 ?auto_423631 ) ) ( not ( = ?auto_423627 ?auto_423633 ) ) ( not ( = ?auto_423627 ?auto_423632 ) ) ( not ( = ?auto_423627 ?auto_423634 ) ) ( not ( = ?auto_423627 ?auto_423635 ) ) ( not ( = ?auto_423627 ?auto_423636 ) ) ( not ( = ?auto_423627 ?auto_423637 ) ) ( not ( = ?auto_423631 ?auto_423633 ) ) ( not ( = ?auto_423631 ?auto_423632 ) ) ( not ( = ?auto_423631 ?auto_423634 ) ) ( not ( = ?auto_423631 ?auto_423635 ) ) ( not ( = ?auto_423631 ?auto_423636 ) ) ( not ( = ?auto_423631 ?auto_423637 ) ) ( not ( = ?auto_423633 ?auto_423632 ) ) ( not ( = ?auto_423633 ?auto_423634 ) ) ( not ( = ?auto_423633 ?auto_423635 ) ) ( not ( = ?auto_423633 ?auto_423636 ) ) ( not ( = ?auto_423633 ?auto_423637 ) ) ( not ( = ?auto_423632 ?auto_423634 ) ) ( not ( = ?auto_423632 ?auto_423635 ) ) ( not ( = ?auto_423632 ?auto_423636 ) ) ( not ( = ?auto_423632 ?auto_423637 ) ) ( not ( = ?auto_423634 ?auto_423635 ) ) ( not ( = ?auto_423634 ?auto_423636 ) ) ( not ( = ?auto_423634 ?auto_423637 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_423635 ?auto_423636 ?auto_423637 )
      ( MAKE-10CRATE-VERIFY ?auto_423628 ?auto_423629 ?auto_423630 ?auto_423627 ?auto_423631 ?auto_423633 ?auto_423632 ?auto_423634 ?auto_423635 ?auto_423636 ?auto_423637 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_423733 - SURFACE
      ?auto_423734 - SURFACE
      ?auto_423735 - SURFACE
      ?auto_423732 - SURFACE
      ?auto_423736 - SURFACE
      ?auto_423738 - SURFACE
      ?auto_423737 - SURFACE
      ?auto_423739 - SURFACE
      ?auto_423740 - SURFACE
      ?auto_423741 - SURFACE
      ?auto_423742 - SURFACE
    )
    :vars
    (
      ?auto_423745 - HOIST
      ?auto_423744 - PLACE
      ?auto_423746 - TRUCK
      ?auto_423743 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_423745 ?auto_423744 ) ( SURFACE-AT ?auto_423741 ?auto_423744 ) ( CLEAR ?auto_423741 ) ( IS-CRATE ?auto_423742 ) ( not ( = ?auto_423741 ?auto_423742 ) ) ( AVAILABLE ?auto_423745 ) ( IN ?auto_423742 ?auto_423746 ) ( ON ?auto_423741 ?auto_423740 ) ( not ( = ?auto_423740 ?auto_423741 ) ) ( not ( = ?auto_423740 ?auto_423742 ) ) ( TRUCK-AT ?auto_423746 ?auto_423743 ) ( not ( = ?auto_423743 ?auto_423744 ) ) ( ON ?auto_423734 ?auto_423733 ) ( ON ?auto_423735 ?auto_423734 ) ( ON ?auto_423732 ?auto_423735 ) ( ON ?auto_423736 ?auto_423732 ) ( ON ?auto_423738 ?auto_423736 ) ( ON ?auto_423737 ?auto_423738 ) ( ON ?auto_423739 ?auto_423737 ) ( ON ?auto_423740 ?auto_423739 ) ( not ( = ?auto_423733 ?auto_423734 ) ) ( not ( = ?auto_423733 ?auto_423735 ) ) ( not ( = ?auto_423733 ?auto_423732 ) ) ( not ( = ?auto_423733 ?auto_423736 ) ) ( not ( = ?auto_423733 ?auto_423738 ) ) ( not ( = ?auto_423733 ?auto_423737 ) ) ( not ( = ?auto_423733 ?auto_423739 ) ) ( not ( = ?auto_423733 ?auto_423740 ) ) ( not ( = ?auto_423733 ?auto_423741 ) ) ( not ( = ?auto_423733 ?auto_423742 ) ) ( not ( = ?auto_423734 ?auto_423735 ) ) ( not ( = ?auto_423734 ?auto_423732 ) ) ( not ( = ?auto_423734 ?auto_423736 ) ) ( not ( = ?auto_423734 ?auto_423738 ) ) ( not ( = ?auto_423734 ?auto_423737 ) ) ( not ( = ?auto_423734 ?auto_423739 ) ) ( not ( = ?auto_423734 ?auto_423740 ) ) ( not ( = ?auto_423734 ?auto_423741 ) ) ( not ( = ?auto_423734 ?auto_423742 ) ) ( not ( = ?auto_423735 ?auto_423732 ) ) ( not ( = ?auto_423735 ?auto_423736 ) ) ( not ( = ?auto_423735 ?auto_423738 ) ) ( not ( = ?auto_423735 ?auto_423737 ) ) ( not ( = ?auto_423735 ?auto_423739 ) ) ( not ( = ?auto_423735 ?auto_423740 ) ) ( not ( = ?auto_423735 ?auto_423741 ) ) ( not ( = ?auto_423735 ?auto_423742 ) ) ( not ( = ?auto_423732 ?auto_423736 ) ) ( not ( = ?auto_423732 ?auto_423738 ) ) ( not ( = ?auto_423732 ?auto_423737 ) ) ( not ( = ?auto_423732 ?auto_423739 ) ) ( not ( = ?auto_423732 ?auto_423740 ) ) ( not ( = ?auto_423732 ?auto_423741 ) ) ( not ( = ?auto_423732 ?auto_423742 ) ) ( not ( = ?auto_423736 ?auto_423738 ) ) ( not ( = ?auto_423736 ?auto_423737 ) ) ( not ( = ?auto_423736 ?auto_423739 ) ) ( not ( = ?auto_423736 ?auto_423740 ) ) ( not ( = ?auto_423736 ?auto_423741 ) ) ( not ( = ?auto_423736 ?auto_423742 ) ) ( not ( = ?auto_423738 ?auto_423737 ) ) ( not ( = ?auto_423738 ?auto_423739 ) ) ( not ( = ?auto_423738 ?auto_423740 ) ) ( not ( = ?auto_423738 ?auto_423741 ) ) ( not ( = ?auto_423738 ?auto_423742 ) ) ( not ( = ?auto_423737 ?auto_423739 ) ) ( not ( = ?auto_423737 ?auto_423740 ) ) ( not ( = ?auto_423737 ?auto_423741 ) ) ( not ( = ?auto_423737 ?auto_423742 ) ) ( not ( = ?auto_423739 ?auto_423740 ) ) ( not ( = ?auto_423739 ?auto_423741 ) ) ( not ( = ?auto_423739 ?auto_423742 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_423740 ?auto_423741 ?auto_423742 )
      ( MAKE-10CRATE-VERIFY ?auto_423733 ?auto_423734 ?auto_423735 ?auto_423732 ?auto_423736 ?auto_423738 ?auto_423737 ?auto_423739 ?auto_423740 ?auto_423741 ?auto_423742 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_423848 - SURFACE
      ?auto_423849 - SURFACE
      ?auto_423850 - SURFACE
      ?auto_423847 - SURFACE
      ?auto_423851 - SURFACE
      ?auto_423853 - SURFACE
      ?auto_423852 - SURFACE
      ?auto_423854 - SURFACE
      ?auto_423855 - SURFACE
      ?auto_423856 - SURFACE
      ?auto_423857 - SURFACE
    )
    :vars
    (
      ?auto_423859 - HOIST
      ?auto_423862 - PLACE
      ?auto_423860 - TRUCK
      ?auto_423858 - PLACE
      ?auto_423861 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_423859 ?auto_423862 ) ( SURFACE-AT ?auto_423856 ?auto_423862 ) ( CLEAR ?auto_423856 ) ( IS-CRATE ?auto_423857 ) ( not ( = ?auto_423856 ?auto_423857 ) ) ( AVAILABLE ?auto_423859 ) ( ON ?auto_423856 ?auto_423855 ) ( not ( = ?auto_423855 ?auto_423856 ) ) ( not ( = ?auto_423855 ?auto_423857 ) ) ( TRUCK-AT ?auto_423860 ?auto_423858 ) ( not ( = ?auto_423858 ?auto_423862 ) ) ( HOIST-AT ?auto_423861 ?auto_423858 ) ( LIFTING ?auto_423861 ?auto_423857 ) ( not ( = ?auto_423859 ?auto_423861 ) ) ( ON ?auto_423849 ?auto_423848 ) ( ON ?auto_423850 ?auto_423849 ) ( ON ?auto_423847 ?auto_423850 ) ( ON ?auto_423851 ?auto_423847 ) ( ON ?auto_423853 ?auto_423851 ) ( ON ?auto_423852 ?auto_423853 ) ( ON ?auto_423854 ?auto_423852 ) ( ON ?auto_423855 ?auto_423854 ) ( not ( = ?auto_423848 ?auto_423849 ) ) ( not ( = ?auto_423848 ?auto_423850 ) ) ( not ( = ?auto_423848 ?auto_423847 ) ) ( not ( = ?auto_423848 ?auto_423851 ) ) ( not ( = ?auto_423848 ?auto_423853 ) ) ( not ( = ?auto_423848 ?auto_423852 ) ) ( not ( = ?auto_423848 ?auto_423854 ) ) ( not ( = ?auto_423848 ?auto_423855 ) ) ( not ( = ?auto_423848 ?auto_423856 ) ) ( not ( = ?auto_423848 ?auto_423857 ) ) ( not ( = ?auto_423849 ?auto_423850 ) ) ( not ( = ?auto_423849 ?auto_423847 ) ) ( not ( = ?auto_423849 ?auto_423851 ) ) ( not ( = ?auto_423849 ?auto_423853 ) ) ( not ( = ?auto_423849 ?auto_423852 ) ) ( not ( = ?auto_423849 ?auto_423854 ) ) ( not ( = ?auto_423849 ?auto_423855 ) ) ( not ( = ?auto_423849 ?auto_423856 ) ) ( not ( = ?auto_423849 ?auto_423857 ) ) ( not ( = ?auto_423850 ?auto_423847 ) ) ( not ( = ?auto_423850 ?auto_423851 ) ) ( not ( = ?auto_423850 ?auto_423853 ) ) ( not ( = ?auto_423850 ?auto_423852 ) ) ( not ( = ?auto_423850 ?auto_423854 ) ) ( not ( = ?auto_423850 ?auto_423855 ) ) ( not ( = ?auto_423850 ?auto_423856 ) ) ( not ( = ?auto_423850 ?auto_423857 ) ) ( not ( = ?auto_423847 ?auto_423851 ) ) ( not ( = ?auto_423847 ?auto_423853 ) ) ( not ( = ?auto_423847 ?auto_423852 ) ) ( not ( = ?auto_423847 ?auto_423854 ) ) ( not ( = ?auto_423847 ?auto_423855 ) ) ( not ( = ?auto_423847 ?auto_423856 ) ) ( not ( = ?auto_423847 ?auto_423857 ) ) ( not ( = ?auto_423851 ?auto_423853 ) ) ( not ( = ?auto_423851 ?auto_423852 ) ) ( not ( = ?auto_423851 ?auto_423854 ) ) ( not ( = ?auto_423851 ?auto_423855 ) ) ( not ( = ?auto_423851 ?auto_423856 ) ) ( not ( = ?auto_423851 ?auto_423857 ) ) ( not ( = ?auto_423853 ?auto_423852 ) ) ( not ( = ?auto_423853 ?auto_423854 ) ) ( not ( = ?auto_423853 ?auto_423855 ) ) ( not ( = ?auto_423853 ?auto_423856 ) ) ( not ( = ?auto_423853 ?auto_423857 ) ) ( not ( = ?auto_423852 ?auto_423854 ) ) ( not ( = ?auto_423852 ?auto_423855 ) ) ( not ( = ?auto_423852 ?auto_423856 ) ) ( not ( = ?auto_423852 ?auto_423857 ) ) ( not ( = ?auto_423854 ?auto_423855 ) ) ( not ( = ?auto_423854 ?auto_423856 ) ) ( not ( = ?auto_423854 ?auto_423857 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_423855 ?auto_423856 ?auto_423857 )
      ( MAKE-10CRATE-VERIFY ?auto_423848 ?auto_423849 ?auto_423850 ?auto_423847 ?auto_423851 ?auto_423853 ?auto_423852 ?auto_423854 ?auto_423855 ?auto_423856 ?auto_423857 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_423973 - SURFACE
      ?auto_423974 - SURFACE
      ?auto_423975 - SURFACE
      ?auto_423972 - SURFACE
      ?auto_423976 - SURFACE
      ?auto_423978 - SURFACE
      ?auto_423977 - SURFACE
      ?auto_423979 - SURFACE
      ?auto_423980 - SURFACE
      ?auto_423981 - SURFACE
      ?auto_423982 - SURFACE
    )
    :vars
    (
      ?auto_423983 - HOIST
      ?auto_423987 - PLACE
      ?auto_423986 - TRUCK
      ?auto_423984 - PLACE
      ?auto_423985 - HOIST
      ?auto_423988 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_423983 ?auto_423987 ) ( SURFACE-AT ?auto_423981 ?auto_423987 ) ( CLEAR ?auto_423981 ) ( IS-CRATE ?auto_423982 ) ( not ( = ?auto_423981 ?auto_423982 ) ) ( AVAILABLE ?auto_423983 ) ( ON ?auto_423981 ?auto_423980 ) ( not ( = ?auto_423980 ?auto_423981 ) ) ( not ( = ?auto_423980 ?auto_423982 ) ) ( TRUCK-AT ?auto_423986 ?auto_423984 ) ( not ( = ?auto_423984 ?auto_423987 ) ) ( HOIST-AT ?auto_423985 ?auto_423984 ) ( not ( = ?auto_423983 ?auto_423985 ) ) ( AVAILABLE ?auto_423985 ) ( SURFACE-AT ?auto_423982 ?auto_423984 ) ( ON ?auto_423982 ?auto_423988 ) ( CLEAR ?auto_423982 ) ( not ( = ?auto_423981 ?auto_423988 ) ) ( not ( = ?auto_423982 ?auto_423988 ) ) ( not ( = ?auto_423980 ?auto_423988 ) ) ( ON ?auto_423974 ?auto_423973 ) ( ON ?auto_423975 ?auto_423974 ) ( ON ?auto_423972 ?auto_423975 ) ( ON ?auto_423976 ?auto_423972 ) ( ON ?auto_423978 ?auto_423976 ) ( ON ?auto_423977 ?auto_423978 ) ( ON ?auto_423979 ?auto_423977 ) ( ON ?auto_423980 ?auto_423979 ) ( not ( = ?auto_423973 ?auto_423974 ) ) ( not ( = ?auto_423973 ?auto_423975 ) ) ( not ( = ?auto_423973 ?auto_423972 ) ) ( not ( = ?auto_423973 ?auto_423976 ) ) ( not ( = ?auto_423973 ?auto_423978 ) ) ( not ( = ?auto_423973 ?auto_423977 ) ) ( not ( = ?auto_423973 ?auto_423979 ) ) ( not ( = ?auto_423973 ?auto_423980 ) ) ( not ( = ?auto_423973 ?auto_423981 ) ) ( not ( = ?auto_423973 ?auto_423982 ) ) ( not ( = ?auto_423973 ?auto_423988 ) ) ( not ( = ?auto_423974 ?auto_423975 ) ) ( not ( = ?auto_423974 ?auto_423972 ) ) ( not ( = ?auto_423974 ?auto_423976 ) ) ( not ( = ?auto_423974 ?auto_423978 ) ) ( not ( = ?auto_423974 ?auto_423977 ) ) ( not ( = ?auto_423974 ?auto_423979 ) ) ( not ( = ?auto_423974 ?auto_423980 ) ) ( not ( = ?auto_423974 ?auto_423981 ) ) ( not ( = ?auto_423974 ?auto_423982 ) ) ( not ( = ?auto_423974 ?auto_423988 ) ) ( not ( = ?auto_423975 ?auto_423972 ) ) ( not ( = ?auto_423975 ?auto_423976 ) ) ( not ( = ?auto_423975 ?auto_423978 ) ) ( not ( = ?auto_423975 ?auto_423977 ) ) ( not ( = ?auto_423975 ?auto_423979 ) ) ( not ( = ?auto_423975 ?auto_423980 ) ) ( not ( = ?auto_423975 ?auto_423981 ) ) ( not ( = ?auto_423975 ?auto_423982 ) ) ( not ( = ?auto_423975 ?auto_423988 ) ) ( not ( = ?auto_423972 ?auto_423976 ) ) ( not ( = ?auto_423972 ?auto_423978 ) ) ( not ( = ?auto_423972 ?auto_423977 ) ) ( not ( = ?auto_423972 ?auto_423979 ) ) ( not ( = ?auto_423972 ?auto_423980 ) ) ( not ( = ?auto_423972 ?auto_423981 ) ) ( not ( = ?auto_423972 ?auto_423982 ) ) ( not ( = ?auto_423972 ?auto_423988 ) ) ( not ( = ?auto_423976 ?auto_423978 ) ) ( not ( = ?auto_423976 ?auto_423977 ) ) ( not ( = ?auto_423976 ?auto_423979 ) ) ( not ( = ?auto_423976 ?auto_423980 ) ) ( not ( = ?auto_423976 ?auto_423981 ) ) ( not ( = ?auto_423976 ?auto_423982 ) ) ( not ( = ?auto_423976 ?auto_423988 ) ) ( not ( = ?auto_423978 ?auto_423977 ) ) ( not ( = ?auto_423978 ?auto_423979 ) ) ( not ( = ?auto_423978 ?auto_423980 ) ) ( not ( = ?auto_423978 ?auto_423981 ) ) ( not ( = ?auto_423978 ?auto_423982 ) ) ( not ( = ?auto_423978 ?auto_423988 ) ) ( not ( = ?auto_423977 ?auto_423979 ) ) ( not ( = ?auto_423977 ?auto_423980 ) ) ( not ( = ?auto_423977 ?auto_423981 ) ) ( not ( = ?auto_423977 ?auto_423982 ) ) ( not ( = ?auto_423977 ?auto_423988 ) ) ( not ( = ?auto_423979 ?auto_423980 ) ) ( not ( = ?auto_423979 ?auto_423981 ) ) ( not ( = ?auto_423979 ?auto_423982 ) ) ( not ( = ?auto_423979 ?auto_423988 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_423980 ?auto_423981 ?auto_423982 )
      ( MAKE-10CRATE-VERIFY ?auto_423973 ?auto_423974 ?auto_423975 ?auto_423972 ?auto_423976 ?auto_423978 ?auto_423977 ?auto_423979 ?auto_423980 ?auto_423981 ?auto_423982 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_424099 - SURFACE
      ?auto_424100 - SURFACE
      ?auto_424101 - SURFACE
      ?auto_424098 - SURFACE
      ?auto_424102 - SURFACE
      ?auto_424104 - SURFACE
      ?auto_424103 - SURFACE
      ?auto_424105 - SURFACE
      ?auto_424106 - SURFACE
      ?auto_424107 - SURFACE
      ?auto_424108 - SURFACE
    )
    :vars
    (
      ?auto_424109 - HOIST
      ?auto_424114 - PLACE
      ?auto_424111 - PLACE
      ?auto_424110 - HOIST
      ?auto_424112 - SURFACE
      ?auto_424113 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_424109 ?auto_424114 ) ( SURFACE-AT ?auto_424107 ?auto_424114 ) ( CLEAR ?auto_424107 ) ( IS-CRATE ?auto_424108 ) ( not ( = ?auto_424107 ?auto_424108 ) ) ( AVAILABLE ?auto_424109 ) ( ON ?auto_424107 ?auto_424106 ) ( not ( = ?auto_424106 ?auto_424107 ) ) ( not ( = ?auto_424106 ?auto_424108 ) ) ( not ( = ?auto_424111 ?auto_424114 ) ) ( HOIST-AT ?auto_424110 ?auto_424111 ) ( not ( = ?auto_424109 ?auto_424110 ) ) ( AVAILABLE ?auto_424110 ) ( SURFACE-AT ?auto_424108 ?auto_424111 ) ( ON ?auto_424108 ?auto_424112 ) ( CLEAR ?auto_424108 ) ( not ( = ?auto_424107 ?auto_424112 ) ) ( not ( = ?auto_424108 ?auto_424112 ) ) ( not ( = ?auto_424106 ?auto_424112 ) ) ( TRUCK-AT ?auto_424113 ?auto_424114 ) ( ON ?auto_424100 ?auto_424099 ) ( ON ?auto_424101 ?auto_424100 ) ( ON ?auto_424098 ?auto_424101 ) ( ON ?auto_424102 ?auto_424098 ) ( ON ?auto_424104 ?auto_424102 ) ( ON ?auto_424103 ?auto_424104 ) ( ON ?auto_424105 ?auto_424103 ) ( ON ?auto_424106 ?auto_424105 ) ( not ( = ?auto_424099 ?auto_424100 ) ) ( not ( = ?auto_424099 ?auto_424101 ) ) ( not ( = ?auto_424099 ?auto_424098 ) ) ( not ( = ?auto_424099 ?auto_424102 ) ) ( not ( = ?auto_424099 ?auto_424104 ) ) ( not ( = ?auto_424099 ?auto_424103 ) ) ( not ( = ?auto_424099 ?auto_424105 ) ) ( not ( = ?auto_424099 ?auto_424106 ) ) ( not ( = ?auto_424099 ?auto_424107 ) ) ( not ( = ?auto_424099 ?auto_424108 ) ) ( not ( = ?auto_424099 ?auto_424112 ) ) ( not ( = ?auto_424100 ?auto_424101 ) ) ( not ( = ?auto_424100 ?auto_424098 ) ) ( not ( = ?auto_424100 ?auto_424102 ) ) ( not ( = ?auto_424100 ?auto_424104 ) ) ( not ( = ?auto_424100 ?auto_424103 ) ) ( not ( = ?auto_424100 ?auto_424105 ) ) ( not ( = ?auto_424100 ?auto_424106 ) ) ( not ( = ?auto_424100 ?auto_424107 ) ) ( not ( = ?auto_424100 ?auto_424108 ) ) ( not ( = ?auto_424100 ?auto_424112 ) ) ( not ( = ?auto_424101 ?auto_424098 ) ) ( not ( = ?auto_424101 ?auto_424102 ) ) ( not ( = ?auto_424101 ?auto_424104 ) ) ( not ( = ?auto_424101 ?auto_424103 ) ) ( not ( = ?auto_424101 ?auto_424105 ) ) ( not ( = ?auto_424101 ?auto_424106 ) ) ( not ( = ?auto_424101 ?auto_424107 ) ) ( not ( = ?auto_424101 ?auto_424108 ) ) ( not ( = ?auto_424101 ?auto_424112 ) ) ( not ( = ?auto_424098 ?auto_424102 ) ) ( not ( = ?auto_424098 ?auto_424104 ) ) ( not ( = ?auto_424098 ?auto_424103 ) ) ( not ( = ?auto_424098 ?auto_424105 ) ) ( not ( = ?auto_424098 ?auto_424106 ) ) ( not ( = ?auto_424098 ?auto_424107 ) ) ( not ( = ?auto_424098 ?auto_424108 ) ) ( not ( = ?auto_424098 ?auto_424112 ) ) ( not ( = ?auto_424102 ?auto_424104 ) ) ( not ( = ?auto_424102 ?auto_424103 ) ) ( not ( = ?auto_424102 ?auto_424105 ) ) ( not ( = ?auto_424102 ?auto_424106 ) ) ( not ( = ?auto_424102 ?auto_424107 ) ) ( not ( = ?auto_424102 ?auto_424108 ) ) ( not ( = ?auto_424102 ?auto_424112 ) ) ( not ( = ?auto_424104 ?auto_424103 ) ) ( not ( = ?auto_424104 ?auto_424105 ) ) ( not ( = ?auto_424104 ?auto_424106 ) ) ( not ( = ?auto_424104 ?auto_424107 ) ) ( not ( = ?auto_424104 ?auto_424108 ) ) ( not ( = ?auto_424104 ?auto_424112 ) ) ( not ( = ?auto_424103 ?auto_424105 ) ) ( not ( = ?auto_424103 ?auto_424106 ) ) ( not ( = ?auto_424103 ?auto_424107 ) ) ( not ( = ?auto_424103 ?auto_424108 ) ) ( not ( = ?auto_424103 ?auto_424112 ) ) ( not ( = ?auto_424105 ?auto_424106 ) ) ( not ( = ?auto_424105 ?auto_424107 ) ) ( not ( = ?auto_424105 ?auto_424108 ) ) ( not ( = ?auto_424105 ?auto_424112 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_424106 ?auto_424107 ?auto_424108 )
      ( MAKE-10CRATE-VERIFY ?auto_424099 ?auto_424100 ?auto_424101 ?auto_424098 ?auto_424102 ?auto_424104 ?auto_424103 ?auto_424105 ?auto_424106 ?auto_424107 ?auto_424108 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_424225 - SURFACE
      ?auto_424226 - SURFACE
      ?auto_424227 - SURFACE
      ?auto_424224 - SURFACE
      ?auto_424228 - SURFACE
      ?auto_424230 - SURFACE
      ?auto_424229 - SURFACE
      ?auto_424231 - SURFACE
      ?auto_424232 - SURFACE
      ?auto_424233 - SURFACE
      ?auto_424234 - SURFACE
    )
    :vars
    (
      ?auto_424237 - HOIST
      ?auto_424239 - PLACE
      ?auto_424236 - PLACE
      ?auto_424235 - HOIST
      ?auto_424240 - SURFACE
      ?auto_424238 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_424237 ?auto_424239 ) ( IS-CRATE ?auto_424234 ) ( not ( = ?auto_424233 ?auto_424234 ) ) ( not ( = ?auto_424232 ?auto_424233 ) ) ( not ( = ?auto_424232 ?auto_424234 ) ) ( not ( = ?auto_424236 ?auto_424239 ) ) ( HOIST-AT ?auto_424235 ?auto_424236 ) ( not ( = ?auto_424237 ?auto_424235 ) ) ( AVAILABLE ?auto_424235 ) ( SURFACE-AT ?auto_424234 ?auto_424236 ) ( ON ?auto_424234 ?auto_424240 ) ( CLEAR ?auto_424234 ) ( not ( = ?auto_424233 ?auto_424240 ) ) ( not ( = ?auto_424234 ?auto_424240 ) ) ( not ( = ?auto_424232 ?auto_424240 ) ) ( TRUCK-AT ?auto_424238 ?auto_424239 ) ( SURFACE-AT ?auto_424232 ?auto_424239 ) ( CLEAR ?auto_424232 ) ( LIFTING ?auto_424237 ?auto_424233 ) ( IS-CRATE ?auto_424233 ) ( ON ?auto_424226 ?auto_424225 ) ( ON ?auto_424227 ?auto_424226 ) ( ON ?auto_424224 ?auto_424227 ) ( ON ?auto_424228 ?auto_424224 ) ( ON ?auto_424230 ?auto_424228 ) ( ON ?auto_424229 ?auto_424230 ) ( ON ?auto_424231 ?auto_424229 ) ( ON ?auto_424232 ?auto_424231 ) ( not ( = ?auto_424225 ?auto_424226 ) ) ( not ( = ?auto_424225 ?auto_424227 ) ) ( not ( = ?auto_424225 ?auto_424224 ) ) ( not ( = ?auto_424225 ?auto_424228 ) ) ( not ( = ?auto_424225 ?auto_424230 ) ) ( not ( = ?auto_424225 ?auto_424229 ) ) ( not ( = ?auto_424225 ?auto_424231 ) ) ( not ( = ?auto_424225 ?auto_424232 ) ) ( not ( = ?auto_424225 ?auto_424233 ) ) ( not ( = ?auto_424225 ?auto_424234 ) ) ( not ( = ?auto_424225 ?auto_424240 ) ) ( not ( = ?auto_424226 ?auto_424227 ) ) ( not ( = ?auto_424226 ?auto_424224 ) ) ( not ( = ?auto_424226 ?auto_424228 ) ) ( not ( = ?auto_424226 ?auto_424230 ) ) ( not ( = ?auto_424226 ?auto_424229 ) ) ( not ( = ?auto_424226 ?auto_424231 ) ) ( not ( = ?auto_424226 ?auto_424232 ) ) ( not ( = ?auto_424226 ?auto_424233 ) ) ( not ( = ?auto_424226 ?auto_424234 ) ) ( not ( = ?auto_424226 ?auto_424240 ) ) ( not ( = ?auto_424227 ?auto_424224 ) ) ( not ( = ?auto_424227 ?auto_424228 ) ) ( not ( = ?auto_424227 ?auto_424230 ) ) ( not ( = ?auto_424227 ?auto_424229 ) ) ( not ( = ?auto_424227 ?auto_424231 ) ) ( not ( = ?auto_424227 ?auto_424232 ) ) ( not ( = ?auto_424227 ?auto_424233 ) ) ( not ( = ?auto_424227 ?auto_424234 ) ) ( not ( = ?auto_424227 ?auto_424240 ) ) ( not ( = ?auto_424224 ?auto_424228 ) ) ( not ( = ?auto_424224 ?auto_424230 ) ) ( not ( = ?auto_424224 ?auto_424229 ) ) ( not ( = ?auto_424224 ?auto_424231 ) ) ( not ( = ?auto_424224 ?auto_424232 ) ) ( not ( = ?auto_424224 ?auto_424233 ) ) ( not ( = ?auto_424224 ?auto_424234 ) ) ( not ( = ?auto_424224 ?auto_424240 ) ) ( not ( = ?auto_424228 ?auto_424230 ) ) ( not ( = ?auto_424228 ?auto_424229 ) ) ( not ( = ?auto_424228 ?auto_424231 ) ) ( not ( = ?auto_424228 ?auto_424232 ) ) ( not ( = ?auto_424228 ?auto_424233 ) ) ( not ( = ?auto_424228 ?auto_424234 ) ) ( not ( = ?auto_424228 ?auto_424240 ) ) ( not ( = ?auto_424230 ?auto_424229 ) ) ( not ( = ?auto_424230 ?auto_424231 ) ) ( not ( = ?auto_424230 ?auto_424232 ) ) ( not ( = ?auto_424230 ?auto_424233 ) ) ( not ( = ?auto_424230 ?auto_424234 ) ) ( not ( = ?auto_424230 ?auto_424240 ) ) ( not ( = ?auto_424229 ?auto_424231 ) ) ( not ( = ?auto_424229 ?auto_424232 ) ) ( not ( = ?auto_424229 ?auto_424233 ) ) ( not ( = ?auto_424229 ?auto_424234 ) ) ( not ( = ?auto_424229 ?auto_424240 ) ) ( not ( = ?auto_424231 ?auto_424232 ) ) ( not ( = ?auto_424231 ?auto_424233 ) ) ( not ( = ?auto_424231 ?auto_424234 ) ) ( not ( = ?auto_424231 ?auto_424240 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_424232 ?auto_424233 ?auto_424234 )
      ( MAKE-10CRATE-VERIFY ?auto_424225 ?auto_424226 ?auto_424227 ?auto_424224 ?auto_424228 ?auto_424230 ?auto_424229 ?auto_424231 ?auto_424232 ?auto_424233 ?auto_424234 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_424351 - SURFACE
      ?auto_424352 - SURFACE
      ?auto_424353 - SURFACE
      ?auto_424350 - SURFACE
      ?auto_424354 - SURFACE
      ?auto_424356 - SURFACE
      ?auto_424355 - SURFACE
      ?auto_424357 - SURFACE
      ?auto_424358 - SURFACE
      ?auto_424359 - SURFACE
      ?auto_424360 - SURFACE
    )
    :vars
    (
      ?auto_424364 - HOIST
      ?auto_424363 - PLACE
      ?auto_424366 - PLACE
      ?auto_424361 - HOIST
      ?auto_424365 - SURFACE
      ?auto_424362 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_424364 ?auto_424363 ) ( IS-CRATE ?auto_424360 ) ( not ( = ?auto_424359 ?auto_424360 ) ) ( not ( = ?auto_424358 ?auto_424359 ) ) ( not ( = ?auto_424358 ?auto_424360 ) ) ( not ( = ?auto_424366 ?auto_424363 ) ) ( HOIST-AT ?auto_424361 ?auto_424366 ) ( not ( = ?auto_424364 ?auto_424361 ) ) ( AVAILABLE ?auto_424361 ) ( SURFACE-AT ?auto_424360 ?auto_424366 ) ( ON ?auto_424360 ?auto_424365 ) ( CLEAR ?auto_424360 ) ( not ( = ?auto_424359 ?auto_424365 ) ) ( not ( = ?auto_424360 ?auto_424365 ) ) ( not ( = ?auto_424358 ?auto_424365 ) ) ( TRUCK-AT ?auto_424362 ?auto_424363 ) ( SURFACE-AT ?auto_424358 ?auto_424363 ) ( CLEAR ?auto_424358 ) ( IS-CRATE ?auto_424359 ) ( AVAILABLE ?auto_424364 ) ( IN ?auto_424359 ?auto_424362 ) ( ON ?auto_424352 ?auto_424351 ) ( ON ?auto_424353 ?auto_424352 ) ( ON ?auto_424350 ?auto_424353 ) ( ON ?auto_424354 ?auto_424350 ) ( ON ?auto_424356 ?auto_424354 ) ( ON ?auto_424355 ?auto_424356 ) ( ON ?auto_424357 ?auto_424355 ) ( ON ?auto_424358 ?auto_424357 ) ( not ( = ?auto_424351 ?auto_424352 ) ) ( not ( = ?auto_424351 ?auto_424353 ) ) ( not ( = ?auto_424351 ?auto_424350 ) ) ( not ( = ?auto_424351 ?auto_424354 ) ) ( not ( = ?auto_424351 ?auto_424356 ) ) ( not ( = ?auto_424351 ?auto_424355 ) ) ( not ( = ?auto_424351 ?auto_424357 ) ) ( not ( = ?auto_424351 ?auto_424358 ) ) ( not ( = ?auto_424351 ?auto_424359 ) ) ( not ( = ?auto_424351 ?auto_424360 ) ) ( not ( = ?auto_424351 ?auto_424365 ) ) ( not ( = ?auto_424352 ?auto_424353 ) ) ( not ( = ?auto_424352 ?auto_424350 ) ) ( not ( = ?auto_424352 ?auto_424354 ) ) ( not ( = ?auto_424352 ?auto_424356 ) ) ( not ( = ?auto_424352 ?auto_424355 ) ) ( not ( = ?auto_424352 ?auto_424357 ) ) ( not ( = ?auto_424352 ?auto_424358 ) ) ( not ( = ?auto_424352 ?auto_424359 ) ) ( not ( = ?auto_424352 ?auto_424360 ) ) ( not ( = ?auto_424352 ?auto_424365 ) ) ( not ( = ?auto_424353 ?auto_424350 ) ) ( not ( = ?auto_424353 ?auto_424354 ) ) ( not ( = ?auto_424353 ?auto_424356 ) ) ( not ( = ?auto_424353 ?auto_424355 ) ) ( not ( = ?auto_424353 ?auto_424357 ) ) ( not ( = ?auto_424353 ?auto_424358 ) ) ( not ( = ?auto_424353 ?auto_424359 ) ) ( not ( = ?auto_424353 ?auto_424360 ) ) ( not ( = ?auto_424353 ?auto_424365 ) ) ( not ( = ?auto_424350 ?auto_424354 ) ) ( not ( = ?auto_424350 ?auto_424356 ) ) ( not ( = ?auto_424350 ?auto_424355 ) ) ( not ( = ?auto_424350 ?auto_424357 ) ) ( not ( = ?auto_424350 ?auto_424358 ) ) ( not ( = ?auto_424350 ?auto_424359 ) ) ( not ( = ?auto_424350 ?auto_424360 ) ) ( not ( = ?auto_424350 ?auto_424365 ) ) ( not ( = ?auto_424354 ?auto_424356 ) ) ( not ( = ?auto_424354 ?auto_424355 ) ) ( not ( = ?auto_424354 ?auto_424357 ) ) ( not ( = ?auto_424354 ?auto_424358 ) ) ( not ( = ?auto_424354 ?auto_424359 ) ) ( not ( = ?auto_424354 ?auto_424360 ) ) ( not ( = ?auto_424354 ?auto_424365 ) ) ( not ( = ?auto_424356 ?auto_424355 ) ) ( not ( = ?auto_424356 ?auto_424357 ) ) ( not ( = ?auto_424356 ?auto_424358 ) ) ( not ( = ?auto_424356 ?auto_424359 ) ) ( not ( = ?auto_424356 ?auto_424360 ) ) ( not ( = ?auto_424356 ?auto_424365 ) ) ( not ( = ?auto_424355 ?auto_424357 ) ) ( not ( = ?auto_424355 ?auto_424358 ) ) ( not ( = ?auto_424355 ?auto_424359 ) ) ( not ( = ?auto_424355 ?auto_424360 ) ) ( not ( = ?auto_424355 ?auto_424365 ) ) ( not ( = ?auto_424357 ?auto_424358 ) ) ( not ( = ?auto_424357 ?auto_424359 ) ) ( not ( = ?auto_424357 ?auto_424360 ) ) ( not ( = ?auto_424357 ?auto_424365 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_424358 ?auto_424359 ?auto_424360 )
      ( MAKE-10CRATE-VERIFY ?auto_424351 ?auto_424352 ?auto_424353 ?auto_424350 ?auto_424354 ?auto_424356 ?auto_424355 ?auto_424357 ?auto_424358 ?auto_424359 ?auto_424360 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_431635 - SURFACE
      ?auto_431636 - SURFACE
      ?auto_431637 - SURFACE
      ?auto_431634 - SURFACE
      ?auto_431638 - SURFACE
      ?auto_431640 - SURFACE
      ?auto_431639 - SURFACE
      ?auto_431641 - SURFACE
      ?auto_431642 - SURFACE
      ?auto_431643 - SURFACE
      ?auto_431644 - SURFACE
      ?auto_431645 - SURFACE
    )
    :vars
    (
      ?auto_431646 - HOIST
      ?auto_431647 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_431646 ?auto_431647 ) ( SURFACE-AT ?auto_431644 ?auto_431647 ) ( CLEAR ?auto_431644 ) ( LIFTING ?auto_431646 ?auto_431645 ) ( IS-CRATE ?auto_431645 ) ( not ( = ?auto_431644 ?auto_431645 ) ) ( ON ?auto_431636 ?auto_431635 ) ( ON ?auto_431637 ?auto_431636 ) ( ON ?auto_431634 ?auto_431637 ) ( ON ?auto_431638 ?auto_431634 ) ( ON ?auto_431640 ?auto_431638 ) ( ON ?auto_431639 ?auto_431640 ) ( ON ?auto_431641 ?auto_431639 ) ( ON ?auto_431642 ?auto_431641 ) ( ON ?auto_431643 ?auto_431642 ) ( ON ?auto_431644 ?auto_431643 ) ( not ( = ?auto_431635 ?auto_431636 ) ) ( not ( = ?auto_431635 ?auto_431637 ) ) ( not ( = ?auto_431635 ?auto_431634 ) ) ( not ( = ?auto_431635 ?auto_431638 ) ) ( not ( = ?auto_431635 ?auto_431640 ) ) ( not ( = ?auto_431635 ?auto_431639 ) ) ( not ( = ?auto_431635 ?auto_431641 ) ) ( not ( = ?auto_431635 ?auto_431642 ) ) ( not ( = ?auto_431635 ?auto_431643 ) ) ( not ( = ?auto_431635 ?auto_431644 ) ) ( not ( = ?auto_431635 ?auto_431645 ) ) ( not ( = ?auto_431636 ?auto_431637 ) ) ( not ( = ?auto_431636 ?auto_431634 ) ) ( not ( = ?auto_431636 ?auto_431638 ) ) ( not ( = ?auto_431636 ?auto_431640 ) ) ( not ( = ?auto_431636 ?auto_431639 ) ) ( not ( = ?auto_431636 ?auto_431641 ) ) ( not ( = ?auto_431636 ?auto_431642 ) ) ( not ( = ?auto_431636 ?auto_431643 ) ) ( not ( = ?auto_431636 ?auto_431644 ) ) ( not ( = ?auto_431636 ?auto_431645 ) ) ( not ( = ?auto_431637 ?auto_431634 ) ) ( not ( = ?auto_431637 ?auto_431638 ) ) ( not ( = ?auto_431637 ?auto_431640 ) ) ( not ( = ?auto_431637 ?auto_431639 ) ) ( not ( = ?auto_431637 ?auto_431641 ) ) ( not ( = ?auto_431637 ?auto_431642 ) ) ( not ( = ?auto_431637 ?auto_431643 ) ) ( not ( = ?auto_431637 ?auto_431644 ) ) ( not ( = ?auto_431637 ?auto_431645 ) ) ( not ( = ?auto_431634 ?auto_431638 ) ) ( not ( = ?auto_431634 ?auto_431640 ) ) ( not ( = ?auto_431634 ?auto_431639 ) ) ( not ( = ?auto_431634 ?auto_431641 ) ) ( not ( = ?auto_431634 ?auto_431642 ) ) ( not ( = ?auto_431634 ?auto_431643 ) ) ( not ( = ?auto_431634 ?auto_431644 ) ) ( not ( = ?auto_431634 ?auto_431645 ) ) ( not ( = ?auto_431638 ?auto_431640 ) ) ( not ( = ?auto_431638 ?auto_431639 ) ) ( not ( = ?auto_431638 ?auto_431641 ) ) ( not ( = ?auto_431638 ?auto_431642 ) ) ( not ( = ?auto_431638 ?auto_431643 ) ) ( not ( = ?auto_431638 ?auto_431644 ) ) ( not ( = ?auto_431638 ?auto_431645 ) ) ( not ( = ?auto_431640 ?auto_431639 ) ) ( not ( = ?auto_431640 ?auto_431641 ) ) ( not ( = ?auto_431640 ?auto_431642 ) ) ( not ( = ?auto_431640 ?auto_431643 ) ) ( not ( = ?auto_431640 ?auto_431644 ) ) ( not ( = ?auto_431640 ?auto_431645 ) ) ( not ( = ?auto_431639 ?auto_431641 ) ) ( not ( = ?auto_431639 ?auto_431642 ) ) ( not ( = ?auto_431639 ?auto_431643 ) ) ( not ( = ?auto_431639 ?auto_431644 ) ) ( not ( = ?auto_431639 ?auto_431645 ) ) ( not ( = ?auto_431641 ?auto_431642 ) ) ( not ( = ?auto_431641 ?auto_431643 ) ) ( not ( = ?auto_431641 ?auto_431644 ) ) ( not ( = ?auto_431641 ?auto_431645 ) ) ( not ( = ?auto_431642 ?auto_431643 ) ) ( not ( = ?auto_431642 ?auto_431644 ) ) ( not ( = ?auto_431642 ?auto_431645 ) ) ( not ( = ?auto_431643 ?auto_431644 ) ) ( not ( = ?auto_431643 ?auto_431645 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_431644 ?auto_431645 )
      ( MAKE-11CRATE-VERIFY ?auto_431635 ?auto_431636 ?auto_431637 ?auto_431634 ?auto_431638 ?auto_431640 ?auto_431639 ?auto_431641 ?auto_431642 ?auto_431643 ?auto_431644 ?auto_431645 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_431744 - SURFACE
      ?auto_431745 - SURFACE
      ?auto_431746 - SURFACE
      ?auto_431743 - SURFACE
      ?auto_431747 - SURFACE
      ?auto_431749 - SURFACE
      ?auto_431748 - SURFACE
      ?auto_431750 - SURFACE
      ?auto_431751 - SURFACE
      ?auto_431752 - SURFACE
      ?auto_431753 - SURFACE
      ?auto_431754 - SURFACE
    )
    :vars
    (
      ?auto_431755 - HOIST
      ?auto_431756 - PLACE
      ?auto_431757 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_431755 ?auto_431756 ) ( SURFACE-AT ?auto_431753 ?auto_431756 ) ( CLEAR ?auto_431753 ) ( IS-CRATE ?auto_431754 ) ( not ( = ?auto_431753 ?auto_431754 ) ) ( TRUCK-AT ?auto_431757 ?auto_431756 ) ( AVAILABLE ?auto_431755 ) ( IN ?auto_431754 ?auto_431757 ) ( ON ?auto_431753 ?auto_431752 ) ( not ( = ?auto_431752 ?auto_431753 ) ) ( not ( = ?auto_431752 ?auto_431754 ) ) ( ON ?auto_431745 ?auto_431744 ) ( ON ?auto_431746 ?auto_431745 ) ( ON ?auto_431743 ?auto_431746 ) ( ON ?auto_431747 ?auto_431743 ) ( ON ?auto_431749 ?auto_431747 ) ( ON ?auto_431748 ?auto_431749 ) ( ON ?auto_431750 ?auto_431748 ) ( ON ?auto_431751 ?auto_431750 ) ( ON ?auto_431752 ?auto_431751 ) ( not ( = ?auto_431744 ?auto_431745 ) ) ( not ( = ?auto_431744 ?auto_431746 ) ) ( not ( = ?auto_431744 ?auto_431743 ) ) ( not ( = ?auto_431744 ?auto_431747 ) ) ( not ( = ?auto_431744 ?auto_431749 ) ) ( not ( = ?auto_431744 ?auto_431748 ) ) ( not ( = ?auto_431744 ?auto_431750 ) ) ( not ( = ?auto_431744 ?auto_431751 ) ) ( not ( = ?auto_431744 ?auto_431752 ) ) ( not ( = ?auto_431744 ?auto_431753 ) ) ( not ( = ?auto_431744 ?auto_431754 ) ) ( not ( = ?auto_431745 ?auto_431746 ) ) ( not ( = ?auto_431745 ?auto_431743 ) ) ( not ( = ?auto_431745 ?auto_431747 ) ) ( not ( = ?auto_431745 ?auto_431749 ) ) ( not ( = ?auto_431745 ?auto_431748 ) ) ( not ( = ?auto_431745 ?auto_431750 ) ) ( not ( = ?auto_431745 ?auto_431751 ) ) ( not ( = ?auto_431745 ?auto_431752 ) ) ( not ( = ?auto_431745 ?auto_431753 ) ) ( not ( = ?auto_431745 ?auto_431754 ) ) ( not ( = ?auto_431746 ?auto_431743 ) ) ( not ( = ?auto_431746 ?auto_431747 ) ) ( not ( = ?auto_431746 ?auto_431749 ) ) ( not ( = ?auto_431746 ?auto_431748 ) ) ( not ( = ?auto_431746 ?auto_431750 ) ) ( not ( = ?auto_431746 ?auto_431751 ) ) ( not ( = ?auto_431746 ?auto_431752 ) ) ( not ( = ?auto_431746 ?auto_431753 ) ) ( not ( = ?auto_431746 ?auto_431754 ) ) ( not ( = ?auto_431743 ?auto_431747 ) ) ( not ( = ?auto_431743 ?auto_431749 ) ) ( not ( = ?auto_431743 ?auto_431748 ) ) ( not ( = ?auto_431743 ?auto_431750 ) ) ( not ( = ?auto_431743 ?auto_431751 ) ) ( not ( = ?auto_431743 ?auto_431752 ) ) ( not ( = ?auto_431743 ?auto_431753 ) ) ( not ( = ?auto_431743 ?auto_431754 ) ) ( not ( = ?auto_431747 ?auto_431749 ) ) ( not ( = ?auto_431747 ?auto_431748 ) ) ( not ( = ?auto_431747 ?auto_431750 ) ) ( not ( = ?auto_431747 ?auto_431751 ) ) ( not ( = ?auto_431747 ?auto_431752 ) ) ( not ( = ?auto_431747 ?auto_431753 ) ) ( not ( = ?auto_431747 ?auto_431754 ) ) ( not ( = ?auto_431749 ?auto_431748 ) ) ( not ( = ?auto_431749 ?auto_431750 ) ) ( not ( = ?auto_431749 ?auto_431751 ) ) ( not ( = ?auto_431749 ?auto_431752 ) ) ( not ( = ?auto_431749 ?auto_431753 ) ) ( not ( = ?auto_431749 ?auto_431754 ) ) ( not ( = ?auto_431748 ?auto_431750 ) ) ( not ( = ?auto_431748 ?auto_431751 ) ) ( not ( = ?auto_431748 ?auto_431752 ) ) ( not ( = ?auto_431748 ?auto_431753 ) ) ( not ( = ?auto_431748 ?auto_431754 ) ) ( not ( = ?auto_431750 ?auto_431751 ) ) ( not ( = ?auto_431750 ?auto_431752 ) ) ( not ( = ?auto_431750 ?auto_431753 ) ) ( not ( = ?auto_431750 ?auto_431754 ) ) ( not ( = ?auto_431751 ?auto_431752 ) ) ( not ( = ?auto_431751 ?auto_431753 ) ) ( not ( = ?auto_431751 ?auto_431754 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_431752 ?auto_431753 ?auto_431754 )
      ( MAKE-11CRATE-VERIFY ?auto_431744 ?auto_431745 ?auto_431746 ?auto_431743 ?auto_431747 ?auto_431749 ?auto_431748 ?auto_431750 ?auto_431751 ?auto_431752 ?auto_431753 ?auto_431754 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_431865 - SURFACE
      ?auto_431866 - SURFACE
      ?auto_431867 - SURFACE
      ?auto_431864 - SURFACE
      ?auto_431868 - SURFACE
      ?auto_431870 - SURFACE
      ?auto_431869 - SURFACE
      ?auto_431871 - SURFACE
      ?auto_431872 - SURFACE
      ?auto_431873 - SURFACE
      ?auto_431874 - SURFACE
      ?auto_431875 - SURFACE
    )
    :vars
    (
      ?auto_431878 - HOIST
      ?auto_431879 - PLACE
      ?auto_431877 - TRUCK
      ?auto_431876 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_431878 ?auto_431879 ) ( SURFACE-AT ?auto_431874 ?auto_431879 ) ( CLEAR ?auto_431874 ) ( IS-CRATE ?auto_431875 ) ( not ( = ?auto_431874 ?auto_431875 ) ) ( AVAILABLE ?auto_431878 ) ( IN ?auto_431875 ?auto_431877 ) ( ON ?auto_431874 ?auto_431873 ) ( not ( = ?auto_431873 ?auto_431874 ) ) ( not ( = ?auto_431873 ?auto_431875 ) ) ( TRUCK-AT ?auto_431877 ?auto_431876 ) ( not ( = ?auto_431876 ?auto_431879 ) ) ( ON ?auto_431866 ?auto_431865 ) ( ON ?auto_431867 ?auto_431866 ) ( ON ?auto_431864 ?auto_431867 ) ( ON ?auto_431868 ?auto_431864 ) ( ON ?auto_431870 ?auto_431868 ) ( ON ?auto_431869 ?auto_431870 ) ( ON ?auto_431871 ?auto_431869 ) ( ON ?auto_431872 ?auto_431871 ) ( ON ?auto_431873 ?auto_431872 ) ( not ( = ?auto_431865 ?auto_431866 ) ) ( not ( = ?auto_431865 ?auto_431867 ) ) ( not ( = ?auto_431865 ?auto_431864 ) ) ( not ( = ?auto_431865 ?auto_431868 ) ) ( not ( = ?auto_431865 ?auto_431870 ) ) ( not ( = ?auto_431865 ?auto_431869 ) ) ( not ( = ?auto_431865 ?auto_431871 ) ) ( not ( = ?auto_431865 ?auto_431872 ) ) ( not ( = ?auto_431865 ?auto_431873 ) ) ( not ( = ?auto_431865 ?auto_431874 ) ) ( not ( = ?auto_431865 ?auto_431875 ) ) ( not ( = ?auto_431866 ?auto_431867 ) ) ( not ( = ?auto_431866 ?auto_431864 ) ) ( not ( = ?auto_431866 ?auto_431868 ) ) ( not ( = ?auto_431866 ?auto_431870 ) ) ( not ( = ?auto_431866 ?auto_431869 ) ) ( not ( = ?auto_431866 ?auto_431871 ) ) ( not ( = ?auto_431866 ?auto_431872 ) ) ( not ( = ?auto_431866 ?auto_431873 ) ) ( not ( = ?auto_431866 ?auto_431874 ) ) ( not ( = ?auto_431866 ?auto_431875 ) ) ( not ( = ?auto_431867 ?auto_431864 ) ) ( not ( = ?auto_431867 ?auto_431868 ) ) ( not ( = ?auto_431867 ?auto_431870 ) ) ( not ( = ?auto_431867 ?auto_431869 ) ) ( not ( = ?auto_431867 ?auto_431871 ) ) ( not ( = ?auto_431867 ?auto_431872 ) ) ( not ( = ?auto_431867 ?auto_431873 ) ) ( not ( = ?auto_431867 ?auto_431874 ) ) ( not ( = ?auto_431867 ?auto_431875 ) ) ( not ( = ?auto_431864 ?auto_431868 ) ) ( not ( = ?auto_431864 ?auto_431870 ) ) ( not ( = ?auto_431864 ?auto_431869 ) ) ( not ( = ?auto_431864 ?auto_431871 ) ) ( not ( = ?auto_431864 ?auto_431872 ) ) ( not ( = ?auto_431864 ?auto_431873 ) ) ( not ( = ?auto_431864 ?auto_431874 ) ) ( not ( = ?auto_431864 ?auto_431875 ) ) ( not ( = ?auto_431868 ?auto_431870 ) ) ( not ( = ?auto_431868 ?auto_431869 ) ) ( not ( = ?auto_431868 ?auto_431871 ) ) ( not ( = ?auto_431868 ?auto_431872 ) ) ( not ( = ?auto_431868 ?auto_431873 ) ) ( not ( = ?auto_431868 ?auto_431874 ) ) ( not ( = ?auto_431868 ?auto_431875 ) ) ( not ( = ?auto_431870 ?auto_431869 ) ) ( not ( = ?auto_431870 ?auto_431871 ) ) ( not ( = ?auto_431870 ?auto_431872 ) ) ( not ( = ?auto_431870 ?auto_431873 ) ) ( not ( = ?auto_431870 ?auto_431874 ) ) ( not ( = ?auto_431870 ?auto_431875 ) ) ( not ( = ?auto_431869 ?auto_431871 ) ) ( not ( = ?auto_431869 ?auto_431872 ) ) ( not ( = ?auto_431869 ?auto_431873 ) ) ( not ( = ?auto_431869 ?auto_431874 ) ) ( not ( = ?auto_431869 ?auto_431875 ) ) ( not ( = ?auto_431871 ?auto_431872 ) ) ( not ( = ?auto_431871 ?auto_431873 ) ) ( not ( = ?auto_431871 ?auto_431874 ) ) ( not ( = ?auto_431871 ?auto_431875 ) ) ( not ( = ?auto_431872 ?auto_431873 ) ) ( not ( = ?auto_431872 ?auto_431874 ) ) ( not ( = ?auto_431872 ?auto_431875 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_431873 ?auto_431874 ?auto_431875 )
      ( MAKE-11CRATE-VERIFY ?auto_431865 ?auto_431866 ?auto_431867 ?auto_431864 ?auto_431868 ?auto_431870 ?auto_431869 ?auto_431871 ?auto_431872 ?auto_431873 ?auto_431874 ?auto_431875 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_431997 - SURFACE
      ?auto_431998 - SURFACE
      ?auto_431999 - SURFACE
      ?auto_431996 - SURFACE
      ?auto_432000 - SURFACE
      ?auto_432002 - SURFACE
      ?auto_432001 - SURFACE
      ?auto_432003 - SURFACE
      ?auto_432004 - SURFACE
      ?auto_432005 - SURFACE
      ?auto_432006 - SURFACE
      ?auto_432007 - SURFACE
    )
    :vars
    (
      ?auto_432009 - HOIST
      ?auto_432008 - PLACE
      ?auto_432011 - TRUCK
      ?auto_432012 - PLACE
      ?auto_432010 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_432009 ?auto_432008 ) ( SURFACE-AT ?auto_432006 ?auto_432008 ) ( CLEAR ?auto_432006 ) ( IS-CRATE ?auto_432007 ) ( not ( = ?auto_432006 ?auto_432007 ) ) ( AVAILABLE ?auto_432009 ) ( ON ?auto_432006 ?auto_432005 ) ( not ( = ?auto_432005 ?auto_432006 ) ) ( not ( = ?auto_432005 ?auto_432007 ) ) ( TRUCK-AT ?auto_432011 ?auto_432012 ) ( not ( = ?auto_432012 ?auto_432008 ) ) ( HOIST-AT ?auto_432010 ?auto_432012 ) ( LIFTING ?auto_432010 ?auto_432007 ) ( not ( = ?auto_432009 ?auto_432010 ) ) ( ON ?auto_431998 ?auto_431997 ) ( ON ?auto_431999 ?auto_431998 ) ( ON ?auto_431996 ?auto_431999 ) ( ON ?auto_432000 ?auto_431996 ) ( ON ?auto_432002 ?auto_432000 ) ( ON ?auto_432001 ?auto_432002 ) ( ON ?auto_432003 ?auto_432001 ) ( ON ?auto_432004 ?auto_432003 ) ( ON ?auto_432005 ?auto_432004 ) ( not ( = ?auto_431997 ?auto_431998 ) ) ( not ( = ?auto_431997 ?auto_431999 ) ) ( not ( = ?auto_431997 ?auto_431996 ) ) ( not ( = ?auto_431997 ?auto_432000 ) ) ( not ( = ?auto_431997 ?auto_432002 ) ) ( not ( = ?auto_431997 ?auto_432001 ) ) ( not ( = ?auto_431997 ?auto_432003 ) ) ( not ( = ?auto_431997 ?auto_432004 ) ) ( not ( = ?auto_431997 ?auto_432005 ) ) ( not ( = ?auto_431997 ?auto_432006 ) ) ( not ( = ?auto_431997 ?auto_432007 ) ) ( not ( = ?auto_431998 ?auto_431999 ) ) ( not ( = ?auto_431998 ?auto_431996 ) ) ( not ( = ?auto_431998 ?auto_432000 ) ) ( not ( = ?auto_431998 ?auto_432002 ) ) ( not ( = ?auto_431998 ?auto_432001 ) ) ( not ( = ?auto_431998 ?auto_432003 ) ) ( not ( = ?auto_431998 ?auto_432004 ) ) ( not ( = ?auto_431998 ?auto_432005 ) ) ( not ( = ?auto_431998 ?auto_432006 ) ) ( not ( = ?auto_431998 ?auto_432007 ) ) ( not ( = ?auto_431999 ?auto_431996 ) ) ( not ( = ?auto_431999 ?auto_432000 ) ) ( not ( = ?auto_431999 ?auto_432002 ) ) ( not ( = ?auto_431999 ?auto_432001 ) ) ( not ( = ?auto_431999 ?auto_432003 ) ) ( not ( = ?auto_431999 ?auto_432004 ) ) ( not ( = ?auto_431999 ?auto_432005 ) ) ( not ( = ?auto_431999 ?auto_432006 ) ) ( not ( = ?auto_431999 ?auto_432007 ) ) ( not ( = ?auto_431996 ?auto_432000 ) ) ( not ( = ?auto_431996 ?auto_432002 ) ) ( not ( = ?auto_431996 ?auto_432001 ) ) ( not ( = ?auto_431996 ?auto_432003 ) ) ( not ( = ?auto_431996 ?auto_432004 ) ) ( not ( = ?auto_431996 ?auto_432005 ) ) ( not ( = ?auto_431996 ?auto_432006 ) ) ( not ( = ?auto_431996 ?auto_432007 ) ) ( not ( = ?auto_432000 ?auto_432002 ) ) ( not ( = ?auto_432000 ?auto_432001 ) ) ( not ( = ?auto_432000 ?auto_432003 ) ) ( not ( = ?auto_432000 ?auto_432004 ) ) ( not ( = ?auto_432000 ?auto_432005 ) ) ( not ( = ?auto_432000 ?auto_432006 ) ) ( not ( = ?auto_432000 ?auto_432007 ) ) ( not ( = ?auto_432002 ?auto_432001 ) ) ( not ( = ?auto_432002 ?auto_432003 ) ) ( not ( = ?auto_432002 ?auto_432004 ) ) ( not ( = ?auto_432002 ?auto_432005 ) ) ( not ( = ?auto_432002 ?auto_432006 ) ) ( not ( = ?auto_432002 ?auto_432007 ) ) ( not ( = ?auto_432001 ?auto_432003 ) ) ( not ( = ?auto_432001 ?auto_432004 ) ) ( not ( = ?auto_432001 ?auto_432005 ) ) ( not ( = ?auto_432001 ?auto_432006 ) ) ( not ( = ?auto_432001 ?auto_432007 ) ) ( not ( = ?auto_432003 ?auto_432004 ) ) ( not ( = ?auto_432003 ?auto_432005 ) ) ( not ( = ?auto_432003 ?auto_432006 ) ) ( not ( = ?auto_432003 ?auto_432007 ) ) ( not ( = ?auto_432004 ?auto_432005 ) ) ( not ( = ?auto_432004 ?auto_432006 ) ) ( not ( = ?auto_432004 ?auto_432007 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_432005 ?auto_432006 ?auto_432007 )
      ( MAKE-11CRATE-VERIFY ?auto_431997 ?auto_431998 ?auto_431999 ?auto_431996 ?auto_432000 ?auto_432002 ?auto_432001 ?auto_432003 ?auto_432004 ?auto_432005 ?auto_432006 ?auto_432007 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_432140 - SURFACE
      ?auto_432141 - SURFACE
      ?auto_432142 - SURFACE
      ?auto_432139 - SURFACE
      ?auto_432143 - SURFACE
      ?auto_432145 - SURFACE
      ?auto_432144 - SURFACE
      ?auto_432146 - SURFACE
      ?auto_432147 - SURFACE
      ?auto_432148 - SURFACE
      ?auto_432149 - SURFACE
      ?auto_432150 - SURFACE
    )
    :vars
    (
      ?auto_432152 - HOIST
      ?auto_432156 - PLACE
      ?auto_432154 - TRUCK
      ?auto_432151 - PLACE
      ?auto_432153 - HOIST
      ?auto_432155 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_432152 ?auto_432156 ) ( SURFACE-AT ?auto_432149 ?auto_432156 ) ( CLEAR ?auto_432149 ) ( IS-CRATE ?auto_432150 ) ( not ( = ?auto_432149 ?auto_432150 ) ) ( AVAILABLE ?auto_432152 ) ( ON ?auto_432149 ?auto_432148 ) ( not ( = ?auto_432148 ?auto_432149 ) ) ( not ( = ?auto_432148 ?auto_432150 ) ) ( TRUCK-AT ?auto_432154 ?auto_432151 ) ( not ( = ?auto_432151 ?auto_432156 ) ) ( HOIST-AT ?auto_432153 ?auto_432151 ) ( not ( = ?auto_432152 ?auto_432153 ) ) ( AVAILABLE ?auto_432153 ) ( SURFACE-AT ?auto_432150 ?auto_432151 ) ( ON ?auto_432150 ?auto_432155 ) ( CLEAR ?auto_432150 ) ( not ( = ?auto_432149 ?auto_432155 ) ) ( not ( = ?auto_432150 ?auto_432155 ) ) ( not ( = ?auto_432148 ?auto_432155 ) ) ( ON ?auto_432141 ?auto_432140 ) ( ON ?auto_432142 ?auto_432141 ) ( ON ?auto_432139 ?auto_432142 ) ( ON ?auto_432143 ?auto_432139 ) ( ON ?auto_432145 ?auto_432143 ) ( ON ?auto_432144 ?auto_432145 ) ( ON ?auto_432146 ?auto_432144 ) ( ON ?auto_432147 ?auto_432146 ) ( ON ?auto_432148 ?auto_432147 ) ( not ( = ?auto_432140 ?auto_432141 ) ) ( not ( = ?auto_432140 ?auto_432142 ) ) ( not ( = ?auto_432140 ?auto_432139 ) ) ( not ( = ?auto_432140 ?auto_432143 ) ) ( not ( = ?auto_432140 ?auto_432145 ) ) ( not ( = ?auto_432140 ?auto_432144 ) ) ( not ( = ?auto_432140 ?auto_432146 ) ) ( not ( = ?auto_432140 ?auto_432147 ) ) ( not ( = ?auto_432140 ?auto_432148 ) ) ( not ( = ?auto_432140 ?auto_432149 ) ) ( not ( = ?auto_432140 ?auto_432150 ) ) ( not ( = ?auto_432140 ?auto_432155 ) ) ( not ( = ?auto_432141 ?auto_432142 ) ) ( not ( = ?auto_432141 ?auto_432139 ) ) ( not ( = ?auto_432141 ?auto_432143 ) ) ( not ( = ?auto_432141 ?auto_432145 ) ) ( not ( = ?auto_432141 ?auto_432144 ) ) ( not ( = ?auto_432141 ?auto_432146 ) ) ( not ( = ?auto_432141 ?auto_432147 ) ) ( not ( = ?auto_432141 ?auto_432148 ) ) ( not ( = ?auto_432141 ?auto_432149 ) ) ( not ( = ?auto_432141 ?auto_432150 ) ) ( not ( = ?auto_432141 ?auto_432155 ) ) ( not ( = ?auto_432142 ?auto_432139 ) ) ( not ( = ?auto_432142 ?auto_432143 ) ) ( not ( = ?auto_432142 ?auto_432145 ) ) ( not ( = ?auto_432142 ?auto_432144 ) ) ( not ( = ?auto_432142 ?auto_432146 ) ) ( not ( = ?auto_432142 ?auto_432147 ) ) ( not ( = ?auto_432142 ?auto_432148 ) ) ( not ( = ?auto_432142 ?auto_432149 ) ) ( not ( = ?auto_432142 ?auto_432150 ) ) ( not ( = ?auto_432142 ?auto_432155 ) ) ( not ( = ?auto_432139 ?auto_432143 ) ) ( not ( = ?auto_432139 ?auto_432145 ) ) ( not ( = ?auto_432139 ?auto_432144 ) ) ( not ( = ?auto_432139 ?auto_432146 ) ) ( not ( = ?auto_432139 ?auto_432147 ) ) ( not ( = ?auto_432139 ?auto_432148 ) ) ( not ( = ?auto_432139 ?auto_432149 ) ) ( not ( = ?auto_432139 ?auto_432150 ) ) ( not ( = ?auto_432139 ?auto_432155 ) ) ( not ( = ?auto_432143 ?auto_432145 ) ) ( not ( = ?auto_432143 ?auto_432144 ) ) ( not ( = ?auto_432143 ?auto_432146 ) ) ( not ( = ?auto_432143 ?auto_432147 ) ) ( not ( = ?auto_432143 ?auto_432148 ) ) ( not ( = ?auto_432143 ?auto_432149 ) ) ( not ( = ?auto_432143 ?auto_432150 ) ) ( not ( = ?auto_432143 ?auto_432155 ) ) ( not ( = ?auto_432145 ?auto_432144 ) ) ( not ( = ?auto_432145 ?auto_432146 ) ) ( not ( = ?auto_432145 ?auto_432147 ) ) ( not ( = ?auto_432145 ?auto_432148 ) ) ( not ( = ?auto_432145 ?auto_432149 ) ) ( not ( = ?auto_432145 ?auto_432150 ) ) ( not ( = ?auto_432145 ?auto_432155 ) ) ( not ( = ?auto_432144 ?auto_432146 ) ) ( not ( = ?auto_432144 ?auto_432147 ) ) ( not ( = ?auto_432144 ?auto_432148 ) ) ( not ( = ?auto_432144 ?auto_432149 ) ) ( not ( = ?auto_432144 ?auto_432150 ) ) ( not ( = ?auto_432144 ?auto_432155 ) ) ( not ( = ?auto_432146 ?auto_432147 ) ) ( not ( = ?auto_432146 ?auto_432148 ) ) ( not ( = ?auto_432146 ?auto_432149 ) ) ( not ( = ?auto_432146 ?auto_432150 ) ) ( not ( = ?auto_432146 ?auto_432155 ) ) ( not ( = ?auto_432147 ?auto_432148 ) ) ( not ( = ?auto_432147 ?auto_432149 ) ) ( not ( = ?auto_432147 ?auto_432150 ) ) ( not ( = ?auto_432147 ?auto_432155 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_432148 ?auto_432149 ?auto_432150 )
      ( MAKE-11CRATE-VERIFY ?auto_432140 ?auto_432141 ?auto_432142 ?auto_432139 ?auto_432143 ?auto_432145 ?auto_432144 ?auto_432146 ?auto_432147 ?auto_432148 ?auto_432149 ?auto_432150 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_432284 - SURFACE
      ?auto_432285 - SURFACE
      ?auto_432286 - SURFACE
      ?auto_432283 - SURFACE
      ?auto_432287 - SURFACE
      ?auto_432289 - SURFACE
      ?auto_432288 - SURFACE
      ?auto_432290 - SURFACE
      ?auto_432291 - SURFACE
      ?auto_432292 - SURFACE
      ?auto_432293 - SURFACE
      ?auto_432294 - SURFACE
    )
    :vars
    (
      ?auto_432295 - HOIST
      ?auto_432299 - PLACE
      ?auto_432298 - PLACE
      ?auto_432300 - HOIST
      ?auto_432296 - SURFACE
      ?auto_432297 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_432295 ?auto_432299 ) ( SURFACE-AT ?auto_432293 ?auto_432299 ) ( CLEAR ?auto_432293 ) ( IS-CRATE ?auto_432294 ) ( not ( = ?auto_432293 ?auto_432294 ) ) ( AVAILABLE ?auto_432295 ) ( ON ?auto_432293 ?auto_432292 ) ( not ( = ?auto_432292 ?auto_432293 ) ) ( not ( = ?auto_432292 ?auto_432294 ) ) ( not ( = ?auto_432298 ?auto_432299 ) ) ( HOIST-AT ?auto_432300 ?auto_432298 ) ( not ( = ?auto_432295 ?auto_432300 ) ) ( AVAILABLE ?auto_432300 ) ( SURFACE-AT ?auto_432294 ?auto_432298 ) ( ON ?auto_432294 ?auto_432296 ) ( CLEAR ?auto_432294 ) ( not ( = ?auto_432293 ?auto_432296 ) ) ( not ( = ?auto_432294 ?auto_432296 ) ) ( not ( = ?auto_432292 ?auto_432296 ) ) ( TRUCK-AT ?auto_432297 ?auto_432299 ) ( ON ?auto_432285 ?auto_432284 ) ( ON ?auto_432286 ?auto_432285 ) ( ON ?auto_432283 ?auto_432286 ) ( ON ?auto_432287 ?auto_432283 ) ( ON ?auto_432289 ?auto_432287 ) ( ON ?auto_432288 ?auto_432289 ) ( ON ?auto_432290 ?auto_432288 ) ( ON ?auto_432291 ?auto_432290 ) ( ON ?auto_432292 ?auto_432291 ) ( not ( = ?auto_432284 ?auto_432285 ) ) ( not ( = ?auto_432284 ?auto_432286 ) ) ( not ( = ?auto_432284 ?auto_432283 ) ) ( not ( = ?auto_432284 ?auto_432287 ) ) ( not ( = ?auto_432284 ?auto_432289 ) ) ( not ( = ?auto_432284 ?auto_432288 ) ) ( not ( = ?auto_432284 ?auto_432290 ) ) ( not ( = ?auto_432284 ?auto_432291 ) ) ( not ( = ?auto_432284 ?auto_432292 ) ) ( not ( = ?auto_432284 ?auto_432293 ) ) ( not ( = ?auto_432284 ?auto_432294 ) ) ( not ( = ?auto_432284 ?auto_432296 ) ) ( not ( = ?auto_432285 ?auto_432286 ) ) ( not ( = ?auto_432285 ?auto_432283 ) ) ( not ( = ?auto_432285 ?auto_432287 ) ) ( not ( = ?auto_432285 ?auto_432289 ) ) ( not ( = ?auto_432285 ?auto_432288 ) ) ( not ( = ?auto_432285 ?auto_432290 ) ) ( not ( = ?auto_432285 ?auto_432291 ) ) ( not ( = ?auto_432285 ?auto_432292 ) ) ( not ( = ?auto_432285 ?auto_432293 ) ) ( not ( = ?auto_432285 ?auto_432294 ) ) ( not ( = ?auto_432285 ?auto_432296 ) ) ( not ( = ?auto_432286 ?auto_432283 ) ) ( not ( = ?auto_432286 ?auto_432287 ) ) ( not ( = ?auto_432286 ?auto_432289 ) ) ( not ( = ?auto_432286 ?auto_432288 ) ) ( not ( = ?auto_432286 ?auto_432290 ) ) ( not ( = ?auto_432286 ?auto_432291 ) ) ( not ( = ?auto_432286 ?auto_432292 ) ) ( not ( = ?auto_432286 ?auto_432293 ) ) ( not ( = ?auto_432286 ?auto_432294 ) ) ( not ( = ?auto_432286 ?auto_432296 ) ) ( not ( = ?auto_432283 ?auto_432287 ) ) ( not ( = ?auto_432283 ?auto_432289 ) ) ( not ( = ?auto_432283 ?auto_432288 ) ) ( not ( = ?auto_432283 ?auto_432290 ) ) ( not ( = ?auto_432283 ?auto_432291 ) ) ( not ( = ?auto_432283 ?auto_432292 ) ) ( not ( = ?auto_432283 ?auto_432293 ) ) ( not ( = ?auto_432283 ?auto_432294 ) ) ( not ( = ?auto_432283 ?auto_432296 ) ) ( not ( = ?auto_432287 ?auto_432289 ) ) ( not ( = ?auto_432287 ?auto_432288 ) ) ( not ( = ?auto_432287 ?auto_432290 ) ) ( not ( = ?auto_432287 ?auto_432291 ) ) ( not ( = ?auto_432287 ?auto_432292 ) ) ( not ( = ?auto_432287 ?auto_432293 ) ) ( not ( = ?auto_432287 ?auto_432294 ) ) ( not ( = ?auto_432287 ?auto_432296 ) ) ( not ( = ?auto_432289 ?auto_432288 ) ) ( not ( = ?auto_432289 ?auto_432290 ) ) ( not ( = ?auto_432289 ?auto_432291 ) ) ( not ( = ?auto_432289 ?auto_432292 ) ) ( not ( = ?auto_432289 ?auto_432293 ) ) ( not ( = ?auto_432289 ?auto_432294 ) ) ( not ( = ?auto_432289 ?auto_432296 ) ) ( not ( = ?auto_432288 ?auto_432290 ) ) ( not ( = ?auto_432288 ?auto_432291 ) ) ( not ( = ?auto_432288 ?auto_432292 ) ) ( not ( = ?auto_432288 ?auto_432293 ) ) ( not ( = ?auto_432288 ?auto_432294 ) ) ( not ( = ?auto_432288 ?auto_432296 ) ) ( not ( = ?auto_432290 ?auto_432291 ) ) ( not ( = ?auto_432290 ?auto_432292 ) ) ( not ( = ?auto_432290 ?auto_432293 ) ) ( not ( = ?auto_432290 ?auto_432294 ) ) ( not ( = ?auto_432290 ?auto_432296 ) ) ( not ( = ?auto_432291 ?auto_432292 ) ) ( not ( = ?auto_432291 ?auto_432293 ) ) ( not ( = ?auto_432291 ?auto_432294 ) ) ( not ( = ?auto_432291 ?auto_432296 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_432292 ?auto_432293 ?auto_432294 )
      ( MAKE-11CRATE-VERIFY ?auto_432284 ?auto_432285 ?auto_432286 ?auto_432283 ?auto_432287 ?auto_432289 ?auto_432288 ?auto_432290 ?auto_432291 ?auto_432292 ?auto_432293 ?auto_432294 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_432428 - SURFACE
      ?auto_432429 - SURFACE
      ?auto_432430 - SURFACE
      ?auto_432427 - SURFACE
      ?auto_432431 - SURFACE
      ?auto_432433 - SURFACE
      ?auto_432432 - SURFACE
      ?auto_432434 - SURFACE
      ?auto_432435 - SURFACE
      ?auto_432436 - SURFACE
      ?auto_432437 - SURFACE
      ?auto_432438 - SURFACE
    )
    :vars
    (
      ?auto_432440 - HOIST
      ?auto_432441 - PLACE
      ?auto_432443 - PLACE
      ?auto_432439 - HOIST
      ?auto_432442 - SURFACE
      ?auto_432444 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_432440 ?auto_432441 ) ( IS-CRATE ?auto_432438 ) ( not ( = ?auto_432437 ?auto_432438 ) ) ( not ( = ?auto_432436 ?auto_432437 ) ) ( not ( = ?auto_432436 ?auto_432438 ) ) ( not ( = ?auto_432443 ?auto_432441 ) ) ( HOIST-AT ?auto_432439 ?auto_432443 ) ( not ( = ?auto_432440 ?auto_432439 ) ) ( AVAILABLE ?auto_432439 ) ( SURFACE-AT ?auto_432438 ?auto_432443 ) ( ON ?auto_432438 ?auto_432442 ) ( CLEAR ?auto_432438 ) ( not ( = ?auto_432437 ?auto_432442 ) ) ( not ( = ?auto_432438 ?auto_432442 ) ) ( not ( = ?auto_432436 ?auto_432442 ) ) ( TRUCK-AT ?auto_432444 ?auto_432441 ) ( SURFACE-AT ?auto_432436 ?auto_432441 ) ( CLEAR ?auto_432436 ) ( LIFTING ?auto_432440 ?auto_432437 ) ( IS-CRATE ?auto_432437 ) ( ON ?auto_432429 ?auto_432428 ) ( ON ?auto_432430 ?auto_432429 ) ( ON ?auto_432427 ?auto_432430 ) ( ON ?auto_432431 ?auto_432427 ) ( ON ?auto_432433 ?auto_432431 ) ( ON ?auto_432432 ?auto_432433 ) ( ON ?auto_432434 ?auto_432432 ) ( ON ?auto_432435 ?auto_432434 ) ( ON ?auto_432436 ?auto_432435 ) ( not ( = ?auto_432428 ?auto_432429 ) ) ( not ( = ?auto_432428 ?auto_432430 ) ) ( not ( = ?auto_432428 ?auto_432427 ) ) ( not ( = ?auto_432428 ?auto_432431 ) ) ( not ( = ?auto_432428 ?auto_432433 ) ) ( not ( = ?auto_432428 ?auto_432432 ) ) ( not ( = ?auto_432428 ?auto_432434 ) ) ( not ( = ?auto_432428 ?auto_432435 ) ) ( not ( = ?auto_432428 ?auto_432436 ) ) ( not ( = ?auto_432428 ?auto_432437 ) ) ( not ( = ?auto_432428 ?auto_432438 ) ) ( not ( = ?auto_432428 ?auto_432442 ) ) ( not ( = ?auto_432429 ?auto_432430 ) ) ( not ( = ?auto_432429 ?auto_432427 ) ) ( not ( = ?auto_432429 ?auto_432431 ) ) ( not ( = ?auto_432429 ?auto_432433 ) ) ( not ( = ?auto_432429 ?auto_432432 ) ) ( not ( = ?auto_432429 ?auto_432434 ) ) ( not ( = ?auto_432429 ?auto_432435 ) ) ( not ( = ?auto_432429 ?auto_432436 ) ) ( not ( = ?auto_432429 ?auto_432437 ) ) ( not ( = ?auto_432429 ?auto_432438 ) ) ( not ( = ?auto_432429 ?auto_432442 ) ) ( not ( = ?auto_432430 ?auto_432427 ) ) ( not ( = ?auto_432430 ?auto_432431 ) ) ( not ( = ?auto_432430 ?auto_432433 ) ) ( not ( = ?auto_432430 ?auto_432432 ) ) ( not ( = ?auto_432430 ?auto_432434 ) ) ( not ( = ?auto_432430 ?auto_432435 ) ) ( not ( = ?auto_432430 ?auto_432436 ) ) ( not ( = ?auto_432430 ?auto_432437 ) ) ( not ( = ?auto_432430 ?auto_432438 ) ) ( not ( = ?auto_432430 ?auto_432442 ) ) ( not ( = ?auto_432427 ?auto_432431 ) ) ( not ( = ?auto_432427 ?auto_432433 ) ) ( not ( = ?auto_432427 ?auto_432432 ) ) ( not ( = ?auto_432427 ?auto_432434 ) ) ( not ( = ?auto_432427 ?auto_432435 ) ) ( not ( = ?auto_432427 ?auto_432436 ) ) ( not ( = ?auto_432427 ?auto_432437 ) ) ( not ( = ?auto_432427 ?auto_432438 ) ) ( not ( = ?auto_432427 ?auto_432442 ) ) ( not ( = ?auto_432431 ?auto_432433 ) ) ( not ( = ?auto_432431 ?auto_432432 ) ) ( not ( = ?auto_432431 ?auto_432434 ) ) ( not ( = ?auto_432431 ?auto_432435 ) ) ( not ( = ?auto_432431 ?auto_432436 ) ) ( not ( = ?auto_432431 ?auto_432437 ) ) ( not ( = ?auto_432431 ?auto_432438 ) ) ( not ( = ?auto_432431 ?auto_432442 ) ) ( not ( = ?auto_432433 ?auto_432432 ) ) ( not ( = ?auto_432433 ?auto_432434 ) ) ( not ( = ?auto_432433 ?auto_432435 ) ) ( not ( = ?auto_432433 ?auto_432436 ) ) ( not ( = ?auto_432433 ?auto_432437 ) ) ( not ( = ?auto_432433 ?auto_432438 ) ) ( not ( = ?auto_432433 ?auto_432442 ) ) ( not ( = ?auto_432432 ?auto_432434 ) ) ( not ( = ?auto_432432 ?auto_432435 ) ) ( not ( = ?auto_432432 ?auto_432436 ) ) ( not ( = ?auto_432432 ?auto_432437 ) ) ( not ( = ?auto_432432 ?auto_432438 ) ) ( not ( = ?auto_432432 ?auto_432442 ) ) ( not ( = ?auto_432434 ?auto_432435 ) ) ( not ( = ?auto_432434 ?auto_432436 ) ) ( not ( = ?auto_432434 ?auto_432437 ) ) ( not ( = ?auto_432434 ?auto_432438 ) ) ( not ( = ?auto_432434 ?auto_432442 ) ) ( not ( = ?auto_432435 ?auto_432436 ) ) ( not ( = ?auto_432435 ?auto_432437 ) ) ( not ( = ?auto_432435 ?auto_432438 ) ) ( not ( = ?auto_432435 ?auto_432442 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_432436 ?auto_432437 ?auto_432438 )
      ( MAKE-11CRATE-VERIFY ?auto_432428 ?auto_432429 ?auto_432430 ?auto_432427 ?auto_432431 ?auto_432433 ?auto_432432 ?auto_432434 ?auto_432435 ?auto_432436 ?auto_432437 ?auto_432438 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_432572 - SURFACE
      ?auto_432573 - SURFACE
      ?auto_432574 - SURFACE
      ?auto_432571 - SURFACE
      ?auto_432575 - SURFACE
      ?auto_432577 - SURFACE
      ?auto_432576 - SURFACE
      ?auto_432578 - SURFACE
      ?auto_432579 - SURFACE
      ?auto_432580 - SURFACE
      ?auto_432581 - SURFACE
      ?auto_432582 - SURFACE
    )
    :vars
    (
      ?auto_432583 - HOIST
      ?auto_432587 - PLACE
      ?auto_432586 - PLACE
      ?auto_432585 - HOIST
      ?auto_432584 - SURFACE
      ?auto_432588 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_432583 ?auto_432587 ) ( IS-CRATE ?auto_432582 ) ( not ( = ?auto_432581 ?auto_432582 ) ) ( not ( = ?auto_432580 ?auto_432581 ) ) ( not ( = ?auto_432580 ?auto_432582 ) ) ( not ( = ?auto_432586 ?auto_432587 ) ) ( HOIST-AT ?auto_432585 ?auto_432586 ) ( not ( = ?auto_432583 ?auto_432585 ) ) ( AVAILABLE ?auto_432585 ) ( SURFACE-AT ?auto_432582 ?auto_432586 ) ( ON ?auto_432582 ?auto_432584 ) ( CLEAR ?auto_432582 ) ( not ( = ?auto_432581 ?auto_432584 ) ) ( not ( = ?auto_432582 ?auto_432584 ) ) ( not ( = ?auto_432580 ?auto_432584 ) ) ( TRUCK-AT ?auto_432588 ?auto_432587 ) ( SURFACE-AT ?auto_432580 ?auto_432587 ) ( CLEAR ?auto_432580 ) ( IS-CRATE ?auto_432581 ) ( AVAILABLE ?auto_432583 ) ( IN ?auto_432581 ?auto_432588 ) ( ON ?auto_432573 ?auto_432572 ) ( ON ?auto_432574 ?auto_432573 ) ( ON ?auto_432571 ?auto_432574 ) ( ON ?auto_432575 ?auto_432571 ) ( ON ?auto_432577 ?auto_432575 ) ( ON ?auto_432576 ?auto_432577 ) ( ON ?auto_432578 ?auto_432576 ) ( ON ?auto_432579 ?auto_432578 ) ( ON ?auto_432580 ?auto_432579 ) ( not ( = ?auto_432572 ?auto_432573 ) ) ( not ( = ?auto_432572 ?auto_432574 ) ) ( not ( = ?auto_432572 ?auto_432571 ) ) ( not ( = ?auto_432572 ?auto_432575 ) ) ( not ( = ?auto_432572 ?auto_432577 ) ) ( not ( = ?auto_432572 ?auto_432576 ) ) ( not ( = ?auto_432572 ?auto_432578 ) ) ( not ( = ?auto_432572 ?auto_432579 ) ) ( not ( = ?auto_432572 ?auto_432580 ) ) ( not ( = ?auto_432572 ?auto_432581 ) ) ( not ( = ?auto_432572 ?auto_432582 ) ) ( not ( = ?auto_432572 ?auto_432584 ) ) ( not ( = ?auto_432573 ?auto_432574 ) ) ( not ( = ?auto_432573 ?auto_432571 ) ) ( not ( = ?auto_432573 ?auto_432575 ) ) ( not ( = ?auto_432573 ?auto_432577 ) ) ( not ( = ?auto_432573 ?auto_432576 ) ) ( not ( = ?auto_432573 ?auto_432578 ) ) ( not ( = ?auto_432573 ?auto_432579 ) ) ( not ( = ?auto_432573 ?auto_432580 ) ) ( not ( = ?auto_432573 ?auto_432581 ) ) ( not ( = ?auto_432573 ?auto_432582 ) ) ( not ( = ?auto_432573 ?auto_432584 ) ) ( not ( = ?auto_432574 ?auto_432571 ) ) ( not ( = ?auto_432574 ?auto_432575 ) ) ( not ( = ?auto_432574 ?auto_432577 ) ) ( not ( = ?auto_432574 ?auto_432576 ) ) ( not ( = ?auto_432574 ?auto_432578 ) ) ( not ( = ?auto_432574 ?auto_432579 ) ) ( not ( = ?auto_432574 ?auto_432580 ) ) ( not ( = ?auto_432574 ?auto_432581 ) ) ( not ( = ?auto_432574 ?auto_432582 ) ) ( not ( = ?auto_432574 ?auto_432584 ) ) ( not ( = ?auto_432571 ?auto_432575 ) ) ( not ( = ?auto_432571 ?auto_432577 ) ) ( not ( = ?auto_432571 ?auto_432576 ) ) ( not ( = ?auto_432571 ?auto_432578 ) ) ( not ( = ?auto_432571 ?auto_432579 ) ) ( not ( = ?auto_432571 ?auto_432580 ) ) ( not ( = ?auto_432571 ?auto_432581 ) ) ( not ( = ?auto_432571 ?auto_432582 ) ) ( not ( = ?auto_432571 ?auto_432584 ) ) ( not ( = ?auto_432575 ?auto_432577 ) ) ( not ( = ?auto_432575 ?auto_432576 ) ) ( not ( = ?auto_432575 ?auto_432578 ) ) ( not ( = ?auto_432575 ?auto_432579 ) ) ( not ( = ?auto_432575 ?auto_432580 ) ) ( not ( = ?auto_432575 ?auto_432581 ) ) ( not ( = ?auto_432575 ?auto_432582 ) ) ( not ( = ?auto_432575 ?auto_432584 ) ) ( not ( = ?auto_432577 ?auto_432576 ) ) ( not ( = ?auto_432577 ?auto_432578 ) ) ( not ( = ?auto_432577 ?auto_432579 ) ) ( not ( = ?auto_432577 ?auto_432580 ) ) ( not ( = ?auto_432577 ?auto_432581 ) ) ( not ( = ?auto_432577 ?auto_432582 ) ) ( not ( = ?auto_432577 ?auto_432584 ) ) ( not ( = ?auto_432576 ?auto_432578 ) ) ( not ( = ?auto_432576 ?auto_432579 ) ) ( not ( = ?auto_432576 ?auto_432580 ) ) ( not ( = ?auto_432576 ?auto_432581 ) ) ( not ( = ?auto_432576 ?auto_432582 ) ) ( not ( = ?auto_432576 ?auto_432584 ) ) ( not ( = ?auto_432578 ?auto_432579 ) ) ( not ( = ?auto_432578 ?auto_432580 ) ) ( not ( = ?auto_432578 ?auto_432581 ) ) ( not ( = ?auto_432578 ?auto_432582 ) ) ( not ( = ?auto_432578 ?auto_432584 ) ) ( not ( = ?auto_432579 ?auto_432580 ) ) ( not ( = ?auto_432579 ?auto_432581 ) ) ( not ( = ?auto_432579 ?auto_432582 ) ) ( not ( = ?auto_432579 ?auto_432584 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_432580 ?auto_432581 ?auto_432582 )
      ( MAKE-11CRATE-VERIFY ?auto_432572 ?auto_432573 ?auto_432574 ?auto_432571 ?auto_432575 ?auto_432577 ?auto_432576 ?auto_432578 ?auto_432579 ?auto_432580 ?auto_432581 ?auto_432582 ) )
  )

)

