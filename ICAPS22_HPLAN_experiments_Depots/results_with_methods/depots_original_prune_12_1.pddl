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
      ?auto_35680 - SURFACE
      ?auto_35681 - SURFACE
    )
    :vars
    (
      ?auto_35682 - HOIST
      ?auto_35683 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_35682 ?auto_35683 ) ( SURFACE-AT ?auto_35681 ?auto_35683 ) ( CLEAR ?auto_35681 ) ( LIFTING ?auto_35682 ?auto_35680 ) ( IS-CRATE ?auto_35680 ) ( not ( = ?auto_35680 ?auto_35681 ) ) )
    :subtasks
    ( ( !DROP ?auto_35682 ?auto_35680 ?auto_35681 ?auto_35683 )
      ( MAKE-ON-VERIFY ?auto_35680 ?auto_35681 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_35684 - SURFACE
      ?auto_35685 - SURFACE
    )
    :vars
    (
      ?auto_35686 - HOIST
      ?auto_35687 - PLACE
      ?auto_35688 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_35686 ?auto_35687 ) ( SURFACE-AT ?auto_35685 ?auto_35687 ) ( CLEAR ?auto_35685 ) ( IS-CRATE ?auto_35684 ) ( not ( = ?auto_35684 ?auto_35685 ) ) ( TRUCK-AT ?auto_35688 ?auto_35687 ) ( AVAILABLE ?auto_35686 ) ( IN ?auto_35684 ?auto_35688 ) )
    :subtasks
    ( ( !UNLOAD ?auto_35686 ?auto_35684 ?auto_35688 ?auto_35687 )
      ( MAKE-ON ?auto_35684 ?auto_35685 )
      ( MAKE-ON-VERIFY ?auto_35684 ?auto_35685 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_35689 - SURFACE
      ?auto_35690 - SURFACE
    )
    :vars
    (
      ?auto_35691 - HOIST
      ?auto_35692 - PLACE
      ?auto_35693 - TRUCK
      ?auto_35694 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_35691 ?auto_35692 ) ( SURFACE-AT ?auto_35690 ?auto_35692 ) ( CLEAR ?auto_35690 ) ( IS-CRATE ?auto_35689 ) ( not ( = ?auto_35689 ?auto_35690 ) ) ( AVAILABLE ?auto_35691 ) ( IN ?auto_35689 ?auto_35693 ) ( TRUCK-AT ?auto_35693 ?auto_35694 ) ( not ( = ?auto_35694 ?auto_35692 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_35693 ?auto_35694 ?auto_35692 )
      ( MAKE-ON ?auto_35689 ?auto_35690 )
      ( MAKE-ON-VERIFY ?auto_35689 ?auto_35690 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_35695 - SURFACE
      ?auto_35696 - SURFACE
    )
    :vars
    (
      ?auto_35697 - HOIST
      ?auto_35698 - PLACE
      ?auto_35699 - TRUCK
      ?auto_35700 - PLACE
      ?auto_35701 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_35697 ?auto_35698 ) ( SURFACE-AT ?auto_35696 ?auto_35698 ) ( CLEAR ?auto_35696 ) ( IS-CRATE ?auto_35695 ) ( not ( = ?auto_35695 ?auto_35696 ) ) ( AVAILABLE ?auto_35697 ) ( TRUCK-AT ?auto_35699 ?auto_35700 ) ( not ( = ?auto_35700 ?auto_35698 ) ) ( HOIST-AT ?auto_35701 ?auto_35700 ) ( LIFTING ?auto_35701 ?auto_35695 ) ( not ( = ?auto_35697 ?auto_35701 ) ) )
    :subtasks
    ( ( !LOAD ?auto_35701 ?auto_35695 ?auto_35699 ?auto_35700 )
      ( MAKE-ON ?auto_35695 ?auto_35696 )
      ( MAKE-ON-VERIFY ?auto_35695 ?auto_35696 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_35702 - SURFACE
      ?auto_35703 - SURFACE
    )
    :vars
    (
      ?auto_35705 - HOIST
      ?auto_35704 - PLACE
      ?auto_35707 - TRUCK
      ?auto_35708 - PLACE
      ?auto_35706 - HOIST
      ?auto_35709 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_35705 ?auto_35704 ) ( SURFACE-AT ?auto_35703 ?auto_35704 ) ( CLEAR ?auto_35703 ) ( IS-CRATE ?auto_35702 ) ( not ( = ?auto_35702 ?auto_35703 ) ) ( AVAILABLE ?auto_35705 ) ( TRUCK-AT ?auto_35707 ?auto_35708 ) ( not ( = ?auto_35708 ?auto_35704 ) ) ( HOIST-AT ?auto_35706 ?auto_35708 ) ( not ( = ?auto_35705 ?auto_35706 ) ) ( AVAILABLE ?auto_35706 ) ( SURFACE-AT ?auto_35702 ?auto_35708 ) ( ON ?auto_35702 ?auto_35709 ) ( CLEAR ?auto_35702 ) ( not ( = ?auto_35702 ?auto_35709 ) ) ( not ( = ?auto_35703 ?auto_35709 ) ) )
    :subtasks
    ( ( !LIFT ?auto_35706 ?auto_35702 ?auto_35709 ?auto_35708 )
      ( MAKE-ON ?auto_35702 ?auto_35703 )
      ( MAKE-ON-VERIFY ?auto_35702 ?auto_35703 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_35710 - SURFACE
      ?auto_35711 - SURFACE
    )
    :vars
    (
      ?auto_35716 - HOIST
      ?auto_35717 - PLACE
      ?auto_35715 - PLACE
      ?auto_35713 - HOIST
      ?auto_35714 - SURFACE
      ?auto_35712 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_35716 ?auto_35717 ) ( SURFACE-AT ?auto_35711 ?auto_35717 ) ( CLEAR ?auto_35711 ) ( IS-CRATE ?auto_35710 ) ( not ( = ?auto_35710 ?auto_35711 ) ) ( AVAILABLE ?auto_35716 ) ( not ( = ?auto_35715 ?auto_35717 ) ) ( HOIST-AT ?auto_35713 ?auto_35715 ) ( not ( = ?auto_35716 ?auto_35713 ) ) ( AVAILABLE ?auto_35713 ) ( SURFACE-AT ?auto_35710 ?auto_35715 ) ( ON ?auto_35710 ?auto_35714 ) ( CLEAR ?auto_35710 ) ( not ( = ?auto_35710 ?auto_35714 ) ) ( not ( = ?auto_35711 ?auto_35714 ) ) ( TRUCK-AT ?auto_35712 ?auto_35717 ) )
    :subtasks
    ( ( !DRIVE ?auto_35712 ?auto_35717 ?auto_35715 )
      ( MAKE-ON ?auto_35710 ?auto_35711 )
      ( MAKE-ON-VERIFY ?auto_35710 ?auto_35711 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_35758 - SURFACE
      ?auto_35759 - SURFACE
    )
    :vars
    (
      ?auto_35763 - HOIST
      ?auto_35764 - PLACE
      ?auto_35760 - PLACE
      ?auto_35762 - HOIST
      ?auto_35761 - SURFACE
      ?auto_35765 - TRUCK
      ?auto_35766 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_35763 ?auto_35764 ) ( IS-CRATE ?auto_35758 ) ( not ( = ?auto_35758 ?auto_35759 ) ) ( not ( = ?auto_35760 ?auto_35764 ) ) ( HOIST-AT ?auto_35762 ?auto_35760 ) ( not ( = ?auto_35763 ?auto_35762 ) ) ( AVAILABLE ?auto_35762 ) ( SURFACE-AT ?auto_35758 ?auto_35760 ) ( ON ?auto_35758 ?auto_35761 ) ( CLEAR ?auto_35758 ) ( not ( = ?auto_35758 ?auto_35761 ) ) ( not ( = ?auto_35759 ?auto_35761 ) ) ( TRUCK-AT ?auto_35765 ?auto_35764 ) ( SURFACE-AT ?auto_35766 ?auto_35764 ) ( CLEAR ?auto_35766 ) ( LIFTING ?auto_35763 ?auto_35759 ) ( IS-CRATE ?auto_35759 ) ( not ( = ?auto_35758 ?auto_35766 ) ) ( not ( = ?auto_35759 ?auto_35766 ) ) ( not ( = ?auto_35761 ?auto_35766 ) ) )
    :subtasks
    ( ( !DROP ?auto_35763 ?auto_35759 ?auto_35766 ?auto_35764 )
      ( MAKE-ON ?auto_35758 ?auto_35759 )
      ( MAKE-ON-VERIFY ?auto_35758 ?auto_35759 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_35767 - SURFACE
      ?auto_35768 - SURFACE
    )
    :vars
    (
      ?auto_35769 - HOIST
      ?auto_35775 - PLACE
      ?auto_35771 - PLACE
      ?auto_35772 - HOIST
      ?auto_35773 - SURFACE
      ?auto_35770 - TRUCK
      ?auto_35774 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_35769 ?auto_35775 ) ( IS-CRATE ?auto_35767 ) ( not ( = ?auto_35767 ?auto_35768 ) ) ( not ( = ?auto_35771 ?auto_35775 ) ) ( HOIST-AT ?auto_35772 ?auto_35771 ) ( not ( = ?auto_35769 ?auto_35772 ) ) ( AVAILABLE ?auto_35772 ) ( SURFACE-AT ?auto_35767 ?auto_35771 ) ( ON ?auto_35767 ?auto_35773 ) ( CLEAR ?auto_35767 ) ( not ( = ?auto_35767 ?auto_35773 ) ) ( not ( = ?auto_35768 ?auto_35773 ) ) ( TRUCK-AT ?auto_35770 ?auto_35775 ) ( SURFACE-AT ?auto_35774 ?auto_35775 ) ( CLEAR ?auto_35774 ) ( IS-CRATE ?auto_35768 ) ( not ( = ?auto_35767 ?auto_35774 ) ) ( not ( = ?auto_35768 ?auto_35774 ) ) ( not ( = ?auto_35773 ?auto_35774 ) ) ( AVAILABLE ?auto_35769 ) ( IN ?auto_35768 ?auto_35770 ) )
    :subtasks
    ( ( !UNLOAD ?auto_35769 ?auto_35768 ?auto_35770 ?auto_35775 )
      ( MAKE-ON ?auto_35767 ?auto_35768 )
      ( MAKE-ON-VERIFY ?auto_35767 ?auto_35768 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_35782 - SURFACE
      ?auto_35783 - SURFACE
    )
    :vars
    (
      ?auto_35789 - HOIST
      ?auto_35787 - PLACE
      ?auto_35784 - PLACE
      ?auto_35788 - HOIST
      ?auto_35786 - SURFACE
      ?auto_35785 - TRUCK
      ?auto_35790 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_35789 ?auto_35787 ) ( SURFACE-AT ?auto_35783 ?auto_35787 ) ( CLEAR ?auto_35783 ) ( IS-CRATE ?auto_35782 ) ( not ( = ?auto_35782 ?auto_35783 ) ) ( AVAILABLE ?auto_35789 ) ( not ( = ?auto_35784 ?auto_35787 ) ) ( HOIST-AT ?auto_35788 ?auto_35784 ) ( not ( = ?auto_35789 ?auto_35788 ) ) ( AVAILABLE ?auto_35788 ) ( SURFACE-AT ?auto_35782 ?auto_35784 ) ( ON ?auto_35782 ?auto_35786 ) ( CLEAR ?auto_35782 ) ( not ( = ?auto_35782 ?auto_35786 ) ) ( not ( = ?auto_35783 ?auto_35786 ) ) ( TRUCK-AT ?auto_35785 ?auto_35790 ) ( not ( = ?auto_35790 ?auto_35787 ) ) ( not ( = ?auto_35784 ?auto_35790 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_35785 ?auto_35790 ?auto_35787 )
      ( MAKE-ON ?auto_35782 ?auto_35783 )
      ( MAKE-ON-VERIFY ?auto_35782 ?auto_35783 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_36052 - SURFACE
      ?auto_36053 - SURFACE
    )
    :vars
    (
      ?auto_36058 - HOIST
      ?auto_36059 - PLACE
      ?auto_36057 - TRUCK
      ?auto_36055 - PLACE
      ?auto_36054 - HOIST
      ?auto_36056 - SURFACE
      ?auto_36060 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_36058 ?auto_36059 ) ( SURFACE-AT ?auto_36053 ?auto_36059 ) ( CLEAR ?auto_36053 ) ( IS-CRATE ?auto_36052 ) ( not ( = ?auto_36052 ?auto_36053 ) ) ( AVAILABLE ?auto_36058 ) ( TRUCK-AT ?auto_36057 ?auto_36055 ) ( not ( = ?auto_36055 ?auto_36059 ) ) ( HOIST-AT ?auto_36054 ?auto_36055 ) ( not ( = ?auto_36058 ?auto_36054 ) ) ( SURFACE-AT ?auto_36052 ?auto_36055 ) ( ON ?auto_36052 ?auto_36056 ) ( CLEAR ?auto_36052 ) ( not ( = ?auto_36052 ?auto_36056 ) ) ( not ( = ?auto_36053 ?auto_36056 ) ) ( LIFTING ?auto_36054 ?auto_36060 ) ( IS-CRATE ?auto_36060 ) ( not ( = ?auto_36052 ?auto_36060 ) ) ( not ( = ?auto_36053 ?auto_36060 ) ) ( not ( = ?auto_36056 ?auto_36060 ) ) )
    :subtasks
    ( ( !LOAD ?auto_36054 ?auto_36060 ?auto_36057 ?auto_36055 )
      ( MAKE-ON ?auto_36052 ?auto_36053 )
      ( MAKE-ON-VERIFY ?auto_36052 ?auto_36053 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_36180 - SURFACE
      ?auto_36181 - SURFACE
    )
    :vars
    (
      ?auto_36186 - HOIST
      ?auto_36182 - PLACE
      ?auto_36183 - PLACE
      ?auto_36184 - HOIST
      ?auto_36187 - SURFACE
      ?auto_36185 - TRUCK
      ?auto_36188 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_36186 ?auto_36182 ) ( SURFACE-AT ?auto_36181 ?auto_36182 ) ( CLEAR ?auto_36181 ) ( IS-CRATE ?auto_36180 ) ( not ( = ?auto_36180 ?auto_36181 ) ) ( not ( = ?auto_36183 ?auto_36182 ) ) ( HOIST-AT ?auto_36184 ?auto_36183 ) ( not ( = ?auto_36186 ?auto_36184 ) ) ( AVAILABLE ?auto_36184 ) ( SURFACE-AT ?auto_36180 ?auto_36183 ) ( ON ?auto_36180 ?auto_36187 ) ( CLEAR ?auto_36180 ) ( not ( = ?auto_36180 ?auto_36187 ) ) ( not ( = ?auto_36181 ?auto_36187 ) ) ( TRUCK-AT ?auto_36185 ?auto_36182 ) ( LIFTING ?auto_36186 ?auto_36188 ) ( IS-CRATE ?auto_36188 ) ( not ( = ?auto_36180 ?auto_36188 ) ) ( not ( = ?auto_36181 ?auto_36188 ) ) ( not ( = ?auto_36187 ?auto_36188 ) ) )
    :subtasks
    ( ( !LOAD ?auto_36186 ?auto_36188 ?auto_36185 ?auto_36182 )
      ( MAKE-ON ?auto_36180 ?auto_36181 )
      ( MAKE-ON-VERIFY ?auto_36180 ?auto_36181 ) )
  )

)

