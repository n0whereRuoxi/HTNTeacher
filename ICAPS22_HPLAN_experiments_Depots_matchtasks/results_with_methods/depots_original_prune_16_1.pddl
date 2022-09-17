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

  ( :method MAKE-12CRATE-VERIFY
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
      ?c12 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( ON ?c11 ?c10 ) ( ON ?c12 ?c11 ) ( CLEAR ?c12 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-13CRATE-VERIFY
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
      ?c12 - SURFACE
      ?c13 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( ON ?c11 ?c10 ) ( ON ?c12 ?c11 ) ( ON ?c13 ?c12 ) ( CLEAR ?c13 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-14CRATE-VERIFY
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
      ?c12 - SURFACE
      ?c13 - SURFACE
      ?c14 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( ON ?c11 ?c10 ) ( ON ?c12 ?c11 ) ( ON ?c13 ?c12 ) ( ON ?c14 ?c13 ) ( CLEAR ?c14 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-15CRATE-VERIFY
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
      ?c12 - SURFACE
      ?c13 - SURFACE
      ?c14 - SURFACE
      ?c15 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( ON ?c11 ?c10 ) ( ON ?c12 ?c11 ) ( ON ?c13 ?c12 ) ( ON ?c14 ?c13 ) ( ON ?c15 ?c14 ) ( CLEAR ?c15 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-16CRATE-VERIFY
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
      ?c12 - SURFACE
      ?c13 - SURFACE
      ?c14 - SURFACE
      ?c15 - SURFACE
      ?c16 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( ON ?c11 ?c10 ) ( ON ?c12 ?c11 ) ( ON ?c13 ?c12 ) ( ON ?c14 ?c13 ) ( ON ?c15 ?c14 ) ( ON ?c16 ?c15 ) ( CLEAR ?c16 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2260699 - SURFACE
      ?auto_2260700 - SURFACE
    )
    :vars
    (
      ?auto_2260701 - HOIST
      ?auto_2260702 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2260701 ?auto_2260702 ) ( SURFACE-AT ?auto_2260699 ?auto_2260702 ) ( CLEAR ?auto_2260699 ) ( LIFTING ?auto_2260701 ?auto_2260700 ) ( IS-CRATE ?auto_2260700 ) ( not ( = ?auto_2260699 ?auto_2260700 ) ) )
    :subtasks
    ( ( !DROP ?auto_2260701 ?auto_2260700 ?auto_2260699 ?auto_2260702 )
      ( MAKE-1CRATE-VERIFY ?auto_2260699 ?auto_2260700 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2260703 - SURFACE
      ?auto_2260704 - SURFACE
    )
    :vars
    (
      ?auto_2260705 - HOIST
      ?auto_2260706 - PLACE
      ?auto_2260707 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2260705 ?auto_2260706 ) ( SURFACE-AT ?auto_2260703 ?auto_2260706 ) ( CLEAR ?auto_2260703 ) ( IS-CRATE ?auto_2260704 ) ( not ( = ?auto_2260703 ?auto_2260704 ) ) ( TRUCK-AT ?auto_2260707 ?auto_2260706 ) ( AVAILABLE ?auto_2260705 ) ( IN ?auto_2260704 ?auto_2260707 ) )
    :subtasks
    ( ( !UNLOAD ?auto_2260705 ?auto_2260704 ?auto_2260707 ?auto_2260706 )
      ( MAKE-1CRATE ?auto_2260703 ?auto_2260704 )
      ( MAKE-1CRATE-VERIFY ?auto_2260703 ?auto_2260704 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2260708 - SURFACE
      ?auto_2260709 - SURFACE
    )
    :vars
    (
      ?auto_2260710 - HOIST
      ?auto_2260711 - PLACE
      ?auto_2260712 - TRUCK
      ?auto_2260713 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2260710 ?auto_2260711 ) ( SURFACE-AT ?auto_2260708 ?auto_2260711 ) ( CLEAR ?auto_2260708 ) ( IS-CRATE ?auto_2260709 ) ( not ( = ?auto_2260708 ?auto_2260709 ) ) ( AVAILABLE ?auto_2260710 ) ( IN ?auto_2260709 ?auto_2260712 ) ( TRUCK-AT ?auto_2260712 ?auto_2260713 ) ( not ( = ?auto_2260713 ?auto_2260711 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2260712 ?auto_2260713 ?auto_2260711 )
      ( MAKE-1CRATE ?auto_2260708 ?auto_2260709 )
      ( MAKE-1CRATE-VERIFY ?auto_2260708 ?auto_2260709 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2260714 - SURFACE
      ?auto_2260715 - SURFACE
    )
    :vars
    (
      ?auto_2260718 - HOIST
      ?auto_2260716 - PLACE
      ?auto_2260717 - TRUCK
      ?auto_2260719 - PLACE
      ?auto_2260720 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2260718 ?auto_2260716 ) ( SURFACE-AT ?auto_2260714 ?auto_2260716 ) ( CLEAR ?auto_2260714 ) ( IS-CRATE ?auto_2260715 ) ( not ( = ?auto_2260714 ?auto_2260715 ) ) ( AVAILABLE ?auto_2260718 ) ( TRUCK-AT ?auto_2260717 ?auto_2260719 ) ( not ( = ?auto_2260719 ?auto_2260716 ) ) ( HOIST-AT ?auto_2260720 ?auto_2260719 ) ( LIFTING ?auto_2260720 ?auto_2260715 ) ( not ( = ?auto_2260718 ?auto_2260720 ) ) )
    :subtasks
    ( ( !LOAD ?auto_2260720 ?auto_2260715 ?auto_2260717 ?auto_2260719 )
      ( MAKE-1CRATE ?auto_2260714 ?auto_2260715 )
      ( MAKE-1CRATE-VERIFY ?auto_2260714 ?auto_2260715 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2260721 - SURFACE
      ?auto_2260722 - SURFACE
    )
    :vars
    (
      ?auto_2260725 - HOIST
      ?auto_2260726 - PLACE
      ?auto_2260727 - TRUCK
      ?auto_2260723 - PLACE
      ?auto_2260724 - HOIST
      ?auto_2260728 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2260725 ?auto_2260726 ) ( SURFACE-AT ?auto_2260721 ?auto_2260726 ) ( CLEAR ?auto_2260721 ) ( IS-CRATE ?auto_2260722 ) ( not ( = ?auto_2260721 ?auto_2260722 ) ) ( AVAILABLE ?auto_2260725 ) ( TRUCK-AT ?auto_2260727 ?auto_2260723 ) ( not ( = ?auto_2260723 ?auto_2260726 ) ) ( HOIST-AT ?auto_2260724 ?auto_2260723 ) ( not ( = ?auto_2260725 ?auto_2260724 ) ) ( AVAILABLE ?auto_2260724 ) ( SURFACE-AT ?auto_2260722 ?auto_2260723 ) ( ON ?auto_2260722 ?auto_2260728 ) ( CLEAR ?auto_2260722 ) ( not ( = ?auto_2260721 ?auto_2260728 ) ) ( not ( = ?auto_2260722 ?auto_2260728 ) ) )
    :subtasks
    ( ( !LIFT ?auto_2260724 ?auto_2260722 ?auto_2260728 ?auto_2260723 )
      ( MAKE-1CRATE ?auto_2260721 ?auto_2260722 )
      ( MAKE-1CRATE-VERIFY ?auto_2260721 ?auto_2260722 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2260729 - SURFACE
      ?auto_2260730 - SURFACE
    )
    :vars
    (
      ?auto_2260733 - HOIST
      ?auto_2260732 - PLACE
      ?auto_2260735 - PLACE
      ?auto_2260736 - HOIST
      ?auto_2260734 - SURFACE
      ?auto_2260731 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2260733 ?auto_2260732 ) ( SURFACE-AT ?auto_2260729 ?auto_2260732 ) ( CLEAR ?auto_2260729 ) ( IS-CRATE ?auto_2260730 ) ( not ( = ?auto_2260729 ?auto_2260730 ) ) ( AVAILABLE ?auto_2260733 ) ( not ( = ?auto_2260735 ?auto_2260732 ) ) ( HOIST-AT ?auto_2260736 ?auto_2260735 ) ( not ( = ?auto_2260733 ?auto_2260736 ) ) ( AVAILABLE ?auto_2260736 ) ( SURFACE-AT ?auto_2260730 ?auto_2260735 ) ( ON ?auto_2260730 ?auto_2260734 ) ( CLEAR ?auto_2260730 ) ( not ( = ?auto_2260729 ?auto_2260734 ) ) ( not ( = ?auto_2260730 ?auto_2260734 ) ) ( TRUCK-AT ?auto_2260731 ?auto_2260732 ) )
    :subtasks
    ( ( !DRIVE ?auto_2260731 ?auto_2260732 ?auto_2260735 )
      ( MAKE-1CRATE ?auto_2260729 ?auto_2260730 )
      ( MAKE-1CRATE-VERIFY ?auto_2260729 ?auto_2260730 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2260746 - SURFACE
      ?auto_2260747 - SURFACE
      ?auto_2260748 - SURFACE
    )
    :vars
    (
      ?auto_2260749 - HOIST
      ?auto_2260750 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2260749 ?auto_2260750 ) ( SURFACE-AT ?auto_2260747 ?auto_2260750 ) ( CLEAR ?auto_2260747 ) ( LIFTING ?auto_2260749 ?auto_2260748 ) ( IS-CRATE ?auto_2260748 ) ( not ( = ?auto_2260747 ?auto_2260748 ) ) ( ON ?auto_2260747 ?auto_2260746 ) ( not ( = ?auto_2260746 ?auto_2260747 ) ) ( not ( = ?auto_2260746 ?auto_2260748 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2260747 ?auto_2260748 )
      ( MAKE-2CRATE-VERIFY ?auto_2260746 ?auto_2260747 ?auto_2260748 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2260756 - SURFACE
      ?auto_2260757 - SURFACE
      ?auto_2260758 - SURFACE
    )
    :vars
    (
      ?auto_2260759 - HOIST
      ?auto_2260761 - PLACE
      ?auto_2260760 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2260759 ?auto_2260761 ) ( SURFACE-AT ?auto_2260757 ?auto_2260761 ) ( CLEAR ?auto_2260757 ) ( IS-CRATE ?auto_2260758 ) ( not ( = ?auto_2260757 ?auto_2260758 ) ) ( TRUCK-AT ?auto_2260760 ?auto_2260761 ) ( AVAILABLE ?auto_2260759 ) ( IN ?auto_2260758 ?auto_2260760 ) ( ON ?auto_2260757 ?auto_2260756 ) ( not ( = ?auto_2260756 ?auto_2260757 ) ) ( not ( = ?auto_2260756 ?auto_2260758 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2260757 ?auto_2260758 )
      ( MAKE-2CRATE-VERIFY ?auto_2260756 ?auto_2260757 ?auto_2260758 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2260762 - SURFACE
      ?auto_2260763 - SURFACE
    )
    :vars
    (
      ?auto_2260766 - HOIST
      ?auto_2260764 - PLACE
      ?auto_2260767 - TRUCK
      ?auto_2260765 - SURFACE
      ?auto_2260768 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2260766 ?auto_2260764 ) ( SURFACE-AT ?auto_2260762 ?auto_2260764 ) ( CLEAR ?auto_2260762 ) ( IS-CRATE ?auto_2260763 ) ( not ( = ?auto_2260762 ?auto_2260763 ) ) ( AVAILABLE ?auto_2260766 ) ( IN ?auto_2260763 ?auto_2260767 ) ( ON ?auto_2260762 ?auto_2260765 ) ( not ( = ?auto_2260765 ?auto_2260762 ) ) ( not ( = ?auto_2260765 ?auto_2260763 ) ) ( TRUCK-AT ?auto_2260767 ?auto_2260768 ) ( not ( = ?auto_2260768 ?auto_2260764 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2260767 ?auto_2260768 ?auto_2260764 )
      ( MAKE-2CRATE ?auto_2260765 ?auto_2260762 ?auto_2260763 )
      ( MAKE-1CRATE-VERIFY ?auto_2260762 ?auto_2260763 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2260769 - SURFACE
      ?auto_2260770 - SURFACE
      ?auto_2260771 - SURFACE
    )
    :vars
    (
      ?auto_2260775 - HOIST
      ?auto_2260774 - PLACE
      ?auto_2260772 - TRUCK
      ?auto_2260773 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2260775 ?auto_2260774 ) ( SURFACE-AT ?auto_2260770 ?auto_2260774 ) ( CLEAR ?auto_2260770 ) ( IS-CRATE ?auto_2260771 ) ( not ( = ?auto_2260770 ?auto_2260771 ) ) ( AVAILABLE ?auto_2260775 ) ( IN ?auto_2260771 ?auto_2260772 ) ( ON ?auto_2260770 ?auto_2260769 ) ( not ( = ?auto_2260769 ?auto_2260770 ) ) ( not ( = ?auto_2260769 ?auto_2260771 ) ) ( TRUCK-AT ?auto_2260772 ?auto_2260773 ) ( not ( = ?auto_2260773 ?auto_2260774 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2260770 ?auto_2260771 )
      ( MAKE-2CRATE-VERIFY ?auto_2260769 ?auto_2260770 ?auto_2260771 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2260776 - SURFACE
      ?auto_2260777 - SURFACE
    )
    :vars
    (
      ?auto_2260780 - HOIST
      ?auto_2260781 - PLACE
      ?auto_2260778 - SURFACE
      ?auto_2260779 - TRUCK
      ?auto_2260782 - PLACE
      ?auto_2260783 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2260780 ?auto_2260781 ) ( SURFACE-AT ?auto_2260776 ?auto_2260781 ) ( CLEAR ?auto_2260776 ) ( IS-CRATE ?auto_2260777 ) ( not ( = ?auto_2260776 ?auto_2260777 ) ) ( AVAILABLE ?auto_2260780 ) ( ON ?auto_2260776 ?auto_2260778 ) ( not ( = ?auto_2260778 ?auto_2260776 ) ) ( not ( = ?auto_2260778 ?auto_2260777 ) ) ( TRUCK-AT ?auto_2260779 ?auto_2260782 ) ( not ( = ?auto_2260782 ?auto_2260781 ) ) ( HOIST-AT ?auto_2260783 ?auto_2260782 ) ( LIFTING ?auto_2260783 ?auto_2260777 ) ( not ( = ?auto_2260780 ?auto_2260783 ) ) )
    :subtasks
    ( ( !LOAD ?auto_2260783 ?auto_2260777 ?auto_2260779 ?auto_2260782 )
      ( MAKE-2CRATE ?auto_2260778 ?auto_2260776 ?auto_2260777 )
      ( MAKE-1CRATE-VERIFY ?auto_2260776 ?auto_2260777 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2260784 - SURFACE
      ?auto_2260785 - SURFACE
      ?auto_2260786 - SURFACE
    )
    :vars
    (
      ?auto_2260788 - HOIST
      ?auto_2260791 - PLACE
      ?auto_2260789 - TRUCK
      ?auto_2260787 - PLACE
      ?auto_2260790 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2260788 ?auto_2260791 ) ( SURFACE-AT ?auto_2260785 ?auto_2260791 ) ( CLEAR ?auto_2260785 ) ( IS-CRATE ?auto_2260786 ) ( not ( = ?auto_2260785 ?auto_2260786 ) ) ( AVAILABLE ?auto_2260788 ) ( ON ?auto_2260785 ?auto_2260784 ) ( not ( = ?auto_2260784 ?auto_2260785 ) ) ( not ( = ?auto_2260784 ?auto_2260786 ) ) ( TRUCK-AT ?auto_2260789 ?auto_2260787 ) ( not ( = ?auto_2260787 ?auto_2260791 ) ) ( HOIST-AT ?auto_2260790 ?auto_2260787 ) ( LIFTING ?auto_2260790 ?auto_2260786 ) ( not ( = ?auto_2260788 ?auto_2260790 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2260785 ?auto_2260786 )
      ( MAKE-2CRATE-VERIFY ?auto_2260784 ?auto_2260785 ?auto_2260786 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2260792 - SURFACE
      ?auto_2260793 - SURFACE
    )
    :vars
    (
      ?auto_2260797 - HOIST
      ?auto_2260798 - PLACE
      ?auto_2260796 - SURFACE
      ?auto_2260799 - TRUCK
      ?auto_2260794 - PLACE
      ?auto_2260795 - HOIST
      ?auto_2260800 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2260797 ?auto_2260798 ) ( SURFACE-AT ?auto_2260792 ?auto_2260798 ) ( CLEAR ?auto_2260792 ) ( IS-CRATE ?auto_2260793 ) ( not ( = ?auto_2260792 ?auto_2260793 ) ) ( AVAILABLE ?auto_2260797 ) ( ON ?auto_2260792 ?auto_2260796 ) ( not ( = ?auto_2260796 ?auto_2260792 ) ) ( not ( = ?auto_2260796 ?auto_2260793 ) ) ( TRUCK-AT ?auto_2260799 ?auto_2260794 ) ( not ( = ?auto_2260794 ?auto_2260798 ) ) ( HOIST-AT ?auto_2260795 ?auto_2260794 ) ( not ( = ?auto_2260797 ?auto_2260795 ) ) ( AVAILABLE ?auto_2260795 ) ( SURFACE-AT ?auto_2260793 ?auto_2260794 ) ( ON ?auto_2260793 ?auto_2260800 ) ( CLEAR ?auto_2260793 ) ( not ( = ?auto_2260792 ?auto_2260800 ) ) ( not ( = ?auto_2260793 ?auto_2260800 ) ) ( not ( = ?auto_2260796 ?auto_2260800 ) ) )
    :subtasks
    ( ( !LIFT ?auto_2260795 ?auto_2260793 ?auto_2260800 ?auto_2260794 )
      ( MAKE-2CRATE ?auto_2260796 ?auto_2260792 ?auto_2260793 )
      ( MAKE-1CRATE-VERIFY ?auto_2260792 ?auto_2260793 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2260801 - SURFACE
      ?auto_2260802 - SURFACE
      ?auto_2260803 - SURFACE
    )
    :vars
    (
      ?auto_2260809 - HOIST
      ?auto_2260804 - PLACE
      ?auto_2260806 - TRUCK
      ?auto_2260808 - PLACE
      ?auto_2260807 - HOIST
      ?auto_2260805 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2260809 ?auto_2260804 ) ( SURFACE-AT ?auto_2260802 ?auto_2260804 ) ( CLEAR ?auto_2260802 ) ( IS-CRATE ?auto_2260803 ) ( not ( = ?auto_2260802 ?auto_2260803 ) ) ( AVAILABLE ?auto_2260809 ) ( ON ?auto_2260802 ?auto_2260801 ) ( not ( = ?auto_2260801 ?auto_2260802 ) ) ( not ( = ?auto_2260801 ?auto_2260803 ) ) ( TRUCK-AT ?auto_2260806 ?auto_2260808 ) ( not ( = ?auto_2260808 ?auto_2260804 ) ) ( HOIST-AT ?auto_2260807 ?auto_2260808 ) ( not ( = ?auto_2260809 ?auto_2260807 ) ) ( AVAILABLE ?auto_2260807 ) ( SURFACE-AT ?auto_2260803 ?auto_2260808 ) ( ON ?auto_2260803 ?auto_2260805 ) ( CLEAR ?auto_2260803 ) ( not ( = ?auto_2260802 ?auto_2260805 ) ) ( not ( = ?auto_2260803 ?auto_2260805 ) ) ( not ( = ?auto_2260801 ?auto_2260805 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2260802 ?auto_2260803 )
      ( MAKE-2CRATE-VERIFY ?auto_2260801 ?auto_2260802 ?auto_2260803 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2260810 - SURFACE
      ?auto_2260811 - SURFACE
    )
    :vars
    (
      ?auto_2260814 - HOIST
      ?auto_2260812 - PLACE
      ?auto_2260818 - SURFACE
      ?auto_2260813 - PLACE
      ?auto_2260817 - HOIST
      ?auto_2260816 - SURFACE
      ?auto_2260815 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2260814 ?auto_2260812 ) ( SURFACE-AT ?auto_2260810 ?auto_2260812 ) ( CLEAR ?auto_2260810 ) ( IS-CRATE ?auto_2260811 ) ( not ( = ?auto_2260810 ?auto_2260811 ) ) ( AVAILABLE ?auto_2260814 ) ( ON ?auto_2260810 ?auto_2260818 ) ( not ( = ?auto_2260818 ?auto_2260810 ) ) ( not ( = ?auto_2260818 ?auto_2260811 ) ) ( not ( = ?auto_2260813 ?auto_2260812 ) ) ( HOIST-AT ?auto_2260817 ?auto_2260813 ) ( not ( = ?auto_2260814 ?auto_2260817 ) ) ( AVAILABLE ?auto_2260817 ) ( SURFACE-AT ?auto_2260811 ?auto_2260813 ) ( ON ?auto_2260811 ?auto_2260816 ) ( CLEAR ?auto_2260811 ) ( not ( = ?auto_2260810 ?auto_2260816 ) ) ( not ( = ?auto_2260811 ?auto_2260816 ) ) ( not ( = ?auto_2260818 ?auto_2260816 ) ) ( TRUCK-AT ?auto_2260815 ?auto_2260812 ) )
    :subtasks
    ( ( !DRIVE ?auto_2260815 ?auto_2260812 ?auto_2260813 )
      ( MAKE-2CRATE ?auto_2260818 ?auto_2260810 ?auto_2260811 )
      ( MAKE-1CRATE-VERIFY ?auto_2260810 ?auto_2260811 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2260819 - SURFACE
      ?auto_2260820 - SURFACE
      ?auto_2260821 - SURFACE
    )
    :vars
    (
      ?auto_2260822 - HOIST
      ?auto_2260826 - PLACE
      ?auto_2260825 - PLACE
      ?auto_2260824 - HOIST
      ?auto_2260827 - SURFACE
      ?auto_2260823 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2260822 ?auto_2260826 ) ( SURFACE-AT ?auto_2260820 ?auto_2260826 ) ( CLEAR ?auto_2260820 ) ( IS-CRATE ?auto_2260821 ) ( not ( = ?auto_2260820 ?auto_2260821 ) ) ( AVAILABLE ?auto_2260822 ) ( ON ?auto_2260820 ?auto_2260819 ) ( not ( = ?auto_2260819 ?auto_2260820 ) ) ( not ( = ?auto_2260819 ?auto_2260821 ) ) ( not ( = ?auto_2260825 ?auto_2260826 ) ) ( HOIST-AT ?auto_2260824 ?auto_2260825 ) ( not ( = ?auto_2260822 ?auto_2260824 ) ) ( AVAILABLE ?auto_2260824 ) ( SURFACE-AT ?auto_2260821 ?auto_2260825 ) ( ON ?auto_2260821 ?auto_2260827 ) ( CLEAR ?auto_2260821 ) ( not ( = ?auto_2260820 ?auto_2260827 ) ) ( not ( = ?auto_2260821 ?auto_2260827 ) ) ( not ( = ?auto_2260819 ?auto_2260827 ) ) ( TRUCK-AT ?auto_2260823 ?auto_2260826 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2260820 ?auto_2260821 )
      ( MAKE-2CRATE-VERIFY ?auto_2260819 ?auto_2260820 ?auto_2260821 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2260828 - SURFACE
      ?auto_2260829 - SURFACE
    )
    :vars
    (
      ?auto_2260835 - HOIST
      ?auto_2260836 - PLACE
      ?auto_2260831 - SURFACE
      ?auto_2260834 - PLACE
      ?auto_2260830 - HOIST
      ?auto_2260832 - SURFACE
      ?auto_2260833 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2260835 ?auto_2260836 ) ( IS-CRATE ?auto_2260829 ) ( not ( = ?auto_2260828 ?auto_2260829 ) ) ( not ( = ?auto_2260831 ?auto_2260828 ) ) ( not ( = ?auto_2260831 ?auto_2260829 ) ) ( not ( = ?auto_2260834 ?auto_2260836 ) ) ( HOIST-AT ?auto_2260830 ?auto_2260834 ) ( not ( = ?auto_2260835 ?auto_2260830 ) ) ( AVAILABLE ?auto_2260830 ) ( SURFACE-AT ?auto_2260829 ?auto_2260834 ) ( ON ?auto_2260829 ?auto_2260832 ) ( CLEAR ?auto_2260829 ) ( not ( = ?auto_2260828 ?auto_2260832 ) ) ( not ( = ?auto_2260829 ?auto_2260832 ) ) ( not ( = ?auto_2260831 ?auto_2260832 ) ) ( TRUCK-AT ?auto_2260833 ?auto_2260836 ) ( SURFACE-AT ?auto_2260831 ?auto_2260836 ) ( CLEAR ?auto_2260831 ) ( LIFTING ?auto_2260835 ?auto_2260828 ) ( IS-CRATE ?auto_2260828 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2260831 ?auto_2260828 )
      ( MAKE-2CRATE ?auto_2260831 ?auto_2260828 ?auto_2260829 )
      ( MAKE-1CRATE-VERIFY ?auto_2260828 ?auto_2260829 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2260837 - SURFACE
      ?auto_2260838 - SURFACE
      ?auto_2260839 - SURFACE
    )
    :vars
    (
      ?auto_2260843 - HOIST
      ?auto_2260845 - PLACE
      ?auto_2260840 - PLACE
      ?auto_2260841 - HOIST
      ?auto_2260844 - SURFACE
      ?auto_2260842 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2260843 ?auto_2260845 ) ( IS-CRATE ?auto_2260839 ) ( not ( = ?auto_2260838 ?auto_2260839 ) ) ( not ( = ?auto_2260837 ?auto_2260838 ) ) ( not ( = ?auto_2260837 ?auto_2260839 ) ) ( not ( = ?auto_2260840 ?auto_2260845 ) ) ( HOIST-AT ?auto_2260841 ?auto_2260840 ) ( not ( = ?auto_2260843 ?auto_2260841 ) ) ( AVAILABLE ?auto_2260841 ) ( SURFACE-AT ?auto_2260839 ?auto_2260840 ) ( ON ?auto_2260839 ?auto_2260844 ) ( CLEAR ?auto_2260839 ) ( not ( = ?auto_2260838 ?auto_2260844 ) ) ( not ( = ?auto_2260839 ?auto_2260844 ) ) ( not ( = ?auto_2260837 ?auto_2260844 ) ) ( TRUCK-AT ?auto_2260842 ?auto_2260845 ) ( SURFACE-AT ?auto_2260837 ?auto_2260845 ) ( CLEAR ?auto_2260837 ) ( LIFTING ?auto_2260843 ?auto_2260838 ) ( IS-CRATE ?auto_2260838 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2260838 ?auto_2260839 )
      ( MAKE-2CRATE-VERIFY ?auto_2260837 ?auto_2260838 ?auto_2260839 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2260846 - SURFACE
      ?auto_2260847 - SURFACE
    )
    :vars
    (
      ?auto_2260852 - HOIST
      ?auto_2260854 - PLACE
      ?auto_2260850 - SURFACE
      ?auto_2260851 - PLACE
      ?auto_2260848 - HOIST
      ?auto_2260853 - SURFACE
      ?auto_2260849 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2260852 ?auto_2260854 ) ( IS-CRATE ?auto_2260847 ) ( not ( = ?auto_2260846 ?auto_2260847 ) ) ( not ( = ?auto_2260850 ?auto_2260846 ) ) ( not ( = ?auto_2260850 ?auto_2260847 ) ) ( not ( = ?auto_2260851 ?auto_2260854 ) ) ( HOIST-AT ?auto_2260848 ?auto_2260851 ) ( not ( = ?auto_2260852 ?auto_2260848 ) ) ( AVAILABLE ?auto_2260848 ) ( SURFACE-AT ?auto_2260847 ?auto_2260851 ) ( ON ?auto_2260847 ?auto_2260853 ) ( CLEAR ?auto_2260847 ) ( not ( = ?auto_2260846 ?auto_2260853 ) ) ( not ( = ?auto_2260847 ?auto_2260853 ) ) ( not ( = ?auto_2260850 ?auto_2260853 ) ) ( TRUCK-AT ?auto_2260849 ?auto_2260854 ) ( SURFACE-AT ?auto_2260850 ?auto_2260854 ) ( CLEAR ?auto_2260850 ) ( IS-CRATE ?auto_2260846 ) ( AVAILABLE ?auto_2260852 ) ( IN ?auto_2260846 ?auto_2260849 ) )
    :subtasks
    ( ( !UNLOAD ?auto_2260852 ?auto_2260846 ?auto_2260849 ?auto_2260854 )
      ( MAKE-2CRATE ?auto_2260850 ?auto_2260846 ?auto_2260847 )
      ( MAKE-1CRATE-VERIFY ?auto_2260846 ?auto_2260847 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2260855 - SURFACE
      ?auto_2260856 - SURFACE
      ?auto_2260857 - SURFACE
    )
    :vars
    (
      ?auto_2260859 - HOIST
      ?auto_2260860 - PLACE
      ?auto_2260861 - PLACE
      ?auto_2260863 - HOIST
      ?auto_2260858 - SURFACE
      ?auto_2260862 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2260859 ?auto_2260860 ) ( IS-CRATE ?auto_2260857 ) ( not ( = ?auto_2260856 ?auto_2260857 ) ) ( not ( = ?auto_2260855 ?auto_2260856 ) ) ( not ( = ?auto_2260855 ?auto_2260857 ) ) ( not ( = ?auto_2260861 ?auto_2260860 ) ) ( HOIST-AT ?auto_2260863 ?auto_2260861 ) ( not ( = ?auto_2260859 ?auto_2260863 ) ) ( AVAILABLE ?auto_2260863 ) ( SURFACE-AT ?auto_2260857 ?auto_2260861 ) ( ON ?auto_2260857 ?auto_2260858 ) ( CLEAR ?auto_2260857 ) ( not ( = ?auto_2260856 ?auto_2260858 ) ) ( not ( = ?auto_2260857 ?auto_2260858 ) ) ( not ( = ?auto_2260855 ?auto_2260858 ) ) ( TRUCK-AT ?auto_2260862 ?auto_2260860 ) ( SURFACE-AT ?auto_2260855 ?auto_2260860 ) ( CLEAR ?auto_2260855 ) ( IS-CRATE ?auto_2260856 ) ( AVAILABLE ?auto_2260859 ) ( IN ?auto_2260856 ?auto_2260862 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2260856 ?auto_2260857 )
      ( MAKE-2CRATE-VERIFY ?auto_2260855 ?auto_2260856 ?auto_2260857 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2260900 - SURFACE
      ?auto_2260901 - SURFACE
    )
    :vars
    (
      ?auto_2260903 - HOIST
      ?auto_2260902 - PLACE
      ?auto_2260907 - SURFACE
      ?auto_2260905 - PLACE
      ?auto_2260906 - HOIST
      ?auto_2260908 - SURFACE
      ?auto_2260904 - TRUCK
      ?auto_2260909 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2260903 ?auto_2260902 ) ( SURFACE-AT ?auto_2260900 ?auto_2260902 ) ( CLEAR ?auto_2260900 ) ( IS-CRATE ?auto_2260901 ) ( not ( = ?auto_2260900 ?auto_2260901 ) ) ( AVAILABLE ?auto_2260903 ) ( ON ?auto_2260900 ?auto_2260907 ) ( not ( = ?auto_2260907 ?auto_2260900 ) ) ( not ( = ?auto_2260907 ?auto_2260901 ) ) ( not ( = ?auto_2260905 ?auto_2260902 ) ) ( HOIST-AT ?auto_2260906 ?auto_2260905 ) ( not ( = ?auto_2260903 ?auto_2260906 ) ) ( AVAILABLE ?auto_2260906 ) ( SURFACE-AT ?auto_2260901 ?auto_2260905 ) ( ON ?auto_2260901 ?auto_2260908 ) ( CLEAR ?auto_2260901 ) ( not ( = ?auto_2260900 ?auto_2260908 ) ) ( not ( = ?auto_2260901 ?auto_2260908 ) ) ( not ( = ?auto_2260907 ?auto_2260908 ) ) ( TRUCK-AT ?auto_2260904 ?auto_2260909 ) ( not ( = ?auto_2260909 ?auto_2260902 ) ) ( not ( = ?auto_2260905 ?auto_2260909 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2260904 ?auto_2260909 ?auto_2260902 )
      ( MAKE-1CRATE ?auto_2260900 ?auto_2260901 )
      ( MAKE-1CRATE-VERIFY ?auto_2260900 ?auto_2260901 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2260940 - SURFACE
      ?auto_2260941 - SURFACE
      ?auto_2260942 - SURFACE
      ?auto_2260939 - SURFACE
    )
    :vars
    (
      ?auto_2260944 - HOIST
      ?auto_2260943 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2260944 ?auto_2260943 ) ( SURFACE-AT ?auto_2260942 ?auto_2260943 ) ( CLEAR ?auto_2260942 ) ( LIFTING ?auto_2260944 ?auto_2260939 ) ( IS-CRATE ?auto_2260939 ) ( not ( = ?auto_2260942 ?auto_2260939 ) ) ( ON ?auto_2260941 ?auto_2260940 ) ( ON ?auto_2260942 ?auto_2260941 ) ( not ( = ?auto_2260940 ?auto_2260941 ) ) ( not ( = ?auto_2260940 ?auto_2260942 ) ) ( not ( = ?auto_2260940 ?auto_2260939 ) ) ( not ( = ?auto_2260941 ?auto_2260942 ) ) ( not ( = ?auto_2260941 ?auto_2260939 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2260942 ?auto_2260939 )
      ( MAKE-3CRATE-VERIFY ?auto_2260940 ?auto_2260941 ?auto_2260942 ?auto_2260939 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2260957 - SURFACE
      ?auto_2260958 - SURFACE
      ?auto_2260959 - SURFACE
      ?auto_2260956 - SURFACE
    )
    :vars
    (
      ?auto_2260960 - HOIST
      ?auto_2260962 - PLACE
      ?auto_2260961 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2260960 ?auto_2260962 ) ( SURFACE-AT ?auto_2260959 ?auto_2260962 ) ( CLEAR ?auto_2260959 ) ( IS-CRATE ?auto_2260956 ) ( not ( = ?auto_2260959 ?auto_2260956 ) ) ( TRUCK-AT ?auto_2260961 ?auto_2260962 ) ( AVAILABLE ?auto_2260960 ) ( IN ?auto_2260956 ?auto_2260961 ) ( ON ?auto_2260959 ?auto_2260958 ) ( not ( = ?auto_2260958 ?auto_2260959 ) ) ( not ( = ?auto_2260958 ?auto_2260956 ) ) ( ON ?auto_2260958 ?auto_2260957 ) ( not ( = ?auto_2260957 ?auto_2260958 ) ) ( not ( = ?auto_2260957 ?auto_2260959 ) ) ( not ( = ?auto_2260957 ?auto_2260956 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2260958 ?auto_2260959 ?auto_2260956 )
      ( MAKE-3CRATE-VERIFY ?auto_2260957 ?auto_2260958 ?auto_2260959 ?auto_2260956 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2260978 - SURFACE
      ?auto_2260979 - SURFACE
      ?auto_2260980 - SURFACE
      ?auto_2260977 - SURFACE
    )
    :vars
    (
      ?auto_2260984 - HOIST
      ?auto_2260982 - PLACE
      ?auto_2260983 - TRUCK
      ?auto_2260981 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2260984 ?auto_2260982 ) ( SURFACE-AT ?auto_2260980 ?auto_2260982 ) ( CLEAR ?auto_2260980 ) ( IS-CRATE ?auto_2260977 ) ( not ( = ?auto_2260980 ?auto_2260977 ) ) ( AVAILABLE ?auto_2260984 ) ( IN ?auto_2260977 ?auto_2260983 ) ( ON ?auto_2260980 ?auto_2260979 ) ( not ( = ?auto_2260979 ?auto_2260980 ) ) ( not ( = ?auto_2260979 ?auto_2260977 ) ) ( TRUCK-AT ?auto_2260983 ?auto_2260981 ) ( not ( = ?auto_2260981 ?auto_2260982 ) ) ( ON ?auto_2260979 ?auto_2260978 ) ( not ( = ?auto_2260978 ?auto_2260979 ) ) ( not ( = ?auto_2260978 ?auto_2260980 ) ) ( not ( = ?auto_2260978 ?auto_2260977 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2260979 ?auto_2260980 ?auto_2260977 )
      ( MAKE-3CRATE-VERIFY ?auto_2260978 ?auto_2260979 ?auto_2260980 ?auto_2260977 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2261002 - SURFACE
      ?auto_2261003 - SURFACE
      ?auto_2261004 - SURFACE
      ?auto_2261001 - SURFACE
    )
    :vars
    (
      ?auto_2261007 - HOIST
      ?auto_2261009 - PLACE
      ?auto_2261005 - TRUCK
      ?auto_2261008 - PLACE
      ?auto_2261006 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2261007 ?auto_2261009 ) ( SURFACE-AT ?auto_2261004 ?auto_2261009 ) ( CLEAR ?auto_2261004 ) ( IS-CRATE ?auto_2261001 ) ( not ( = ?auto_2261004 ?auto_2261001 ) ) ( AVAILABLE ?auto_2261007 ) ( ON ?auto_2261004 ?auto_2261003 ) ( not ( = ?auto_2261003 ?auto_2261004 ) ) ( not ( = ?auto_2261003 ?auto_2261001 ) ) ( TRUCK-AT ?auto_2261005 ?auto_2261008 ) ( not ( = ?auto_2261008 ?auto_2261009 ) ) ( HOIST-AT ?auto_2261006 ?auto_2261008 ) ( LIFTING ?auto_2261006 ?auto_2261001 ) ( not ( = ?auto_2261007 ?auto_2261006 ) ) ( ON ?auto_2261003 ?auto_2261002 ) ( not ( = ?auto_2261002 ?auto_2261003 ) ) ( not ( = ?auto_2261002 ?auto_2261004 ) ) ( not ( = ?auto_2261002 ?auto_2261001 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2261003 ?auto_2261004 ?auto_2261001 )
      ( MAKE-3CRATE-VERIFY ?auto_2261002 ?auto_2261003 ?auto_2261004 ?auto_2261001 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2261029 - SURFACE
      ?auto_2261030 - SURFACE
      ?auto_2261031 - SURFACE
      ?auto_2261028 - SURFACE
    )
    :vars
    (
      ?auto_2261034 - HOIST
      ?auto_2261036 - PLACE
      ?auto_2261033 - TRUCK
      ?auto_2261035 - PLACE
      ?auto_2261032 - HOIST
      ?auto_2261037 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2261034 ?auto_2261036 ) ( SURFACE-AT ?auto_2261031 ?auto_2261036 ) ( CLEAR ?auto_2261031 ) ( IS-CRATE ?auto_2261028 ) ( not ( = ?auto_2261031 ?auto_2261028 ) ) ( AVAILABLE ?auto_2261034 ) ( ON ?auto_2261031 ?auto_2261030 ) ( not ( = ?auto_2261030 ?auto_2261031 ) ) ( not ( = ?auto_2261030 ?auto_2261028 ) ) ( TRUCK-AT ?auto_2261033 ?auto_2261035 ) ( not ( = ?auto_2261035 ?auto_2261036 ) ) ( HOIST-AT ?auto_2261032 ?auto_2261035 ) ( not ( = ?auto_2261034 ?auto_2261032 ) ) ( AVAILABLE ?auto_2261032 ) ( SURFACE-AT ?auto_2261028 ?auto_2261035 ) ( ON ?auto_2261028 ?auto_2261037 ) ( CLEAR ?auto_2261028 ) ( not ( = ?auto_2261031 ?auto_2261037 ) ) ( not ( = ?auto_2261028 ?auto_2261037 ) ) ( not ( = ?auto_2261030 ?auto_2261037 ) ) ( ON ?auto_2261030 ?auto_2261029 ) ( not ( = ?auto_2261029 ?auto_2261030 ) ) ( not ( = ?auto_2261029 ?auto_2261031 ) ) ( not ( = ?auto_2261029 ?auto_2261028 ) ) ( not ( = ?auto_2261029 ?auto_2261037 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2261030 ?auto_2261031 ?auto_2261028 )
      ( MAKE-3CRATE-VERIFY ?auto_2261029 ?auto_2261030 ?auto_2261031 ?auto_2261028 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2261057 - SURFACE
      ?auto_2261058 - SURFACE
      ?auto_2261059 - SURFACE
      ?auto_2261056 - SURFACE
    )
    :vars
    (
      ?auto_2261064 - HOIST
      ?auto_2261063 - PLACE
      ?auto_2261060 - PLACE
      ?auto_2261065 - HOIST
      ?auto_2261061 - SURFACE
      ?auto_2261062 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2261064 ?auto_2261063 ) ( SURFACE-AT ?auto_2261059 ?auto_2261063 ) ( CLEAR ?auto_2261059 ) ( IS-CRATE ?auto_2261056 ) ( not ( = ?auto_2261059 ?auto_2261056 ) ) ( AVAILABLE ?auto_2261064 ) ( ON ?auto_2261059 ?auto_2261058 ) ( not ( = ?auto_2261058 ?auto_2261059 ) ) ( not ( = ?auto_2261058 ?auto_2261056 ) ) ( not ( = ?auto_2261060 ?auto_2261063 ) ) ( HOIST-AT ?auto_2261065 ?auto_2261060 ) ( not ( = ?auto_2261064 ?auto_2261065 ) ) ( AVAILABLE ?auto_2261065 ) ( SURFACE-AT ?auto_2261056 ?auto_2261060 ) ( ON ?auto_2261056 ?auto_2261061 ) ( CLEAR ?auto_2261056 ) ( not ( = ?auto_2261059 ?auto_2261061 ) ) ( not ( = ?auto_2261056 ?auto_2261061 ) ) ( not ( = ?auto_2261058 ?auto_2261061 ) ) ( TRUCK-AT ?auto_2261062 ?auto_2261063 ) ( ON ?auto_2261058 ?auto_2261057 ) ( not ( = ?auto_2261057 ?auto_2261058 ) ) ( not ( = ?auto_2261057 ?auto_2261059 ) ) ( not ( = ?auto_2261057 ?auto_2261056 ) ) ( not ( = ?auto_2261057 ?auto_2261061 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2261058 ?auto_2261059 ?auto_2261056 )
      ( MAKE-3CRATE-VERIFY ?auto_2261057 ?auto_2261058 ?auto_2261059 ?auto_2261056 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2261085 - SURFACE
      ?auto_2261086 - SURFACE
      ?auto_2261087 - SURFACE
      ?auto_2261084 - SURFACE
    )
    :vars
    (
      ?auto_2261093 - HOIST
      ?auto_2261091 - PLACE
      ?auto_2261092 - PLACE
      ?auto_2261089 - HOIST
      ?auto_2261088 - SURFACE
      ?auto_2261090 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2261093 ?auto_2261091 ) ( IS-CRATE ?auto_2261084 ) ( not ( = ?auto_2261087 ?auto_2261084 ) ) ( not ( = ?auto_2261086 ?auto_2261087 ) ) ( not ( = ?auto_2261086 ?auto_2261084 ) ) ( not ( = ?auto_2261092 ?auto_2261091 ) ) ( HOIST-AT ?auto_2261089 ?auto_2261092 ) ( not ( = ?auto_2261093 ?auto_2261089 ) ) ( AVAILABLE ?auto_2261089 ) ( SURFACE-AT ?auto_2261084 ?auto_2261092 ) ( ON ?auto_2261084 ?auto_2261088 ) ( CLEAR ?auto_2261084 ) ( not ( = ?auto_2261087 ?auto_2261088 ) ) ( not ( = ?auto_2261084 ?auto_2261088 ) ) ( not ( = ?auto_2261086 ?auto_2261088 ) ) ( TRUCK-AT ?auto_2261090 ?auto_2261091 ) ( SURFACE-AT ?auto_2261086 ?auto_2261091 ) ( CLEAR ?auto_2261086 ) ( LIFTING ?auto_2261093 ?auto_2261087 ) ( IS-CRATE ?auto_2261087 ) ( ON ?auto_2261086 ?auto_2261085 ) ( not ( = ?auto_2261085 ?auto_2261086 ) ) ( not ( = ?auto_2261085 ?auto_2261087 ) ) ( not ( = ?auto_2261085 ?auto_2261084 ) ) ( not ( = ?auto_2261085 ?auto_2261088 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2261086 ?auto_2261087 ?auto_2261084 )
      ( MAKE-3CRATE-VERIFY ?auto_2261085 ?auto_2261086 ?auto_2261087 ?auto_2261084 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2261113 - SURFACE
      ?auto_2261114 - SURFACE
      ?auto_2261115 - SURFACE
      ?auto_2261112 - SURFACE
    )
    :vars
    (
      ?auto_2261121 - HOIST
      ?auto_2261119 - PLACE
      ?auto_2261118 - PLACE
      ?auto_2261117 - HOIST
      ?auto_2261116 - SURFACE
      ?auto_2261120 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2261121 ?auto_2261119 ) ( IS-CRATE ?auto_2261112 ) ( not ( = ?auto_2261115 ?auto_2261112 ) ) ( not ( = ?auto_2261114 ?auto_2261115 ) ) ( not ( = ?auto_2261114 ?auto_2261112 ) ) ( not ( = ?auto_2261118 ?auto_2261119 ) ) ( HOIST-AT ?auto_2261117 ?auto_2261118 ) ( not ( = ?auto_2261121 ?auto_2261117 ) ) ( AVAILABLE ?auto_2261117 ) ( SURFACE-AT ?auto_2261112 ?auto_2261118 ) ( ON ?auto_2261112 ?auto_2261116 ) ( CLEAR ?auto_2261112 ) ( not ( = ?auto_2261115 ?auto_2261116 ) ) ( not ( = ?auto_2261112 ?auto_2261116 ) ) ( not ( = ?auto_2261114 ?auto_2261116 ) ) ( TRUCK-AT ?auto_2261120 ?auto_2261119 ) ( SURFACE-AT ?auto_2261114 ?auto_2261119 ) ( CLEAR ?auto_2261114 ) ( IS-CRATE ?auto_2261115 ) ( AVAILABLE ?auto_2261121 ) ( IN ?auto_2261115 ?auto_2261120 ) ( ON ?auto_2261114 ?auto_2261113 ) ( not ( = ?auto_2261113 ?auto_2261114 ) ) ( not ( = ?auto_2261113 ?auto_2261115 ) ) ( not ( = ?auto_2261113 ?auto_2261112 ) ) ( not ( = ?auto_2261113 ?auto_2261116 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2261114 ?auto_2261115 ?auto_2261112 )
      ( MAKE-3CRATE-VERIFY ?auto_2261113 ?auto_2261114 ?auto_2261115 ?auto_2261112 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2261404 - SURFACE
      ?auto_2261405 - SURFACE
      ?auto_2261406 - SURFACE
      ?auto_2261403 - SURFACE
      ?auto_2261407 - SURFACE
    )
    :vars
    (
      ?auto_2261409 - HOIST
      ?auto_2261408 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2261409 ?auto_2261408 ) ( SURFACE-AT ?auto_2261403 ?auto_2261408 ) ( CLEAR ?auto_2261403 ) ( LIFTING ?auto_2261409 ?auto_2261407 ) ( IS-CRATE ?auto_2261407 ) ( not ( = ?auto_2261403 ?auto_2261407 ) ) ( ON ?auto_2261405 ?auto_2261404 ) ( ON ?auto_2261406 ?auto_2261405 ) ( ON ?auto_2261403 ?auto_2261406 ) ( not ( = ?auto_2261404 ?auto_2261405 ) ) ( not ( = ?auto_2261404 ?auto_2261406 ) ) ( not ( = ?auto_2261404 ?auto_2261403 ) ) ( not ( = ?auto_2261404 ?auto_2261407 ) ) ( not ( = ?auto_2261405 ?auto_2261406 ) ) ( not ( = ?auto_2261405 ?auto_2261403 ) ) ( not ( = ?auto_2261405 ?auto_2261407 ) ) ( not ( = ?auto_2261406 ?auto_2261403 ) ) ( not ( = ?auto_2261406 ?auto_2261407 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2261403 ?auto_2261407 )
      ( MAKE-4CRATE-VERIFY ?auto_2261404 ?auto_2261405 ?auto_2261406 ?auto_2261403 ?auto_2261407 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2261429 - SURFACE
      ?auto_2261430 - SURFACE
      ?auto_2261431 - SURFACE
      ?auto_2261428 - SURFACE
      ?auto_2261432 - SURFACE
    )
    :vars
    (
      ?auto_2261434 - HOIST
      ?auto_2261433 - PLACE
      ?auto_2261435 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2261434 ?auto_2261433 ) ( SURFACE-AT ?auto_2261428 ?auto_2261433 ) ( CLEAR ?auto_2261428 ) ( IS-CRATE ?auto_2261432 ) ( not ( = ?auto_2261428 ?auto_2261432 ) ) ( TRUCK-AT ?auto_2261435 ?auto_2261433 ) ( AVAILABLE ?auto_2261434 ) ( IN ?auto_2261432 ?auto_2261435 ) ( ON ?auto_2261428 ?auto_2261431 ) ( not ( = ?auto_2261431 ?auto_2261428 ) ) ( not ( = ?auto_2261431 ?auto_2261432 ) ) ( ON ?auto_2261430 ?auto_2261429 ) ( ON ?auto_2261431 ?auto_2261430 ) ( not ( = ?auto_2261429 ?auto_2261430 ) ) ( not ( = ?auto_2261429 ?auto_2261431 ) ) ( not ( = ?auto_2261429 ?auto_2261428 ) ) ( not ( = ?auto_2261429 ?auto_2261432 ) ) ( not ( = ?auto_2261430 ?auto_2261431 ) ) ( not ( = ?auto_2261430 ?auto_2261428 ) ) ( not ( = ?auto_2261430 ?auto_2261432 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2261431 ?auto_2261428 ?auto_2261432 )
      ( MAKE-4CRATE-VERIFY ?auto_2261429 ?auto_2261430 ?auto_2261431 ?auto_2261428 ?auto_2261432 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2261459 - SURFACE
      ?auto_2261460 - SURFACE
      ?auto_2261461 - SURFACE
      ?auto_2261458 - SURFACE
      ?auto_2261462 - SURFACE
    )
    :vars
    (
      ?auto_2261463 - HOIST
      ?auto_2261464 - PLACE
      ?auto_2261465 - TRUCK
      ?auto_2261466 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2261463 ?auto_2261464 ) ( SURFACE-AT ?auto_2261458 ?auto_2261464 ) ( CLEAR ?auto_2261458 ) ( IS-CRATE ?auto_2261462 ) ( not ( = ?auto_2261458 ?auto_2261462 ) ) ( AVAILABLE ?auto_2261463 ) ( IN ?auto_2261462 ?auto_2261465 ) ( ON ?auto_2261458 ?auto_2261461 ) ( not ( = ?auto_2261461 ?auto_2261458 ) ) ( not ( = ?auto_2261461 ?auto_2261462 ) ) ( TRUCK-AT ?auto_2261465 ?auto_2261466 ) ( not ( = ?auto_2261466 ?auto_2261464 ) ) ( ON ?auto_2261460 ?auto_2261459 ) ( ON ?auto_2261461 ?auto_2261460 ) ( not ( = ?auto_2261459 ?auto_2261460 ) ) ( not ( = ?auto_2261459 ?auto_2261461 ) ) ( not ( = ?auto_2261459 ?auto_2261458 ) ) ( not ( = ?auto_2261459 ?auto_2261462 ) ) ( not ( = ?auto_2261460 ?auto_2261461 ) ) ( not ( = ?auto_2261460 ?auto_2261458 ) ) ( not ( = ?auto_2261460 ?auto_2261462 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2261461 ?auto_2261458 ?auto_2261462 )
      ( MAKE-4CRATE-VERIFY ?auto_2261459 ?auto_2261460 ?auto_2261461 ?auto_2261458 ?auto_2261462 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2261493 - SURFACE
      ?auto_2261494 - SURFACE
      ?auto_2261495 - SURFACE
      ?auto_2261492 - SURFACE
      ?auto_2261496 - SURFACE
    )
    :vars
    (
      ?auto_2261501 - HOIST
      ?auto_2261500 - PLACE
      ?auto_2261499 - TRUCK
      ?auto_2261498 - PLACE
      ?auto_2261497 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2261501 ?auto_2261500 ) ( SURFACE-AT ?auto_2261492 ?auto_2261500 ) ( CLEAR ?auto_2261492 ) ( IS-CRATE ?auto_2261496 ) ( not ( = ?auto_2261492 ?auto_2261496 ) ) ( AVAILABLE ?auto_2261501 ) ( ON ?auto_2261492 ?auto_2261495 ) ( not ( = ?auto_2261495 ?auto_2261492 ) ) ( not ( = ?auto_2261495 ?auto_2261496 ) ) ( TRUCK-AT ?auto_2261499 ?auto_2261498 ) ( not ( = ?auto_2261498 ?auto_2261500 ) ) ( HOIST-AT ?auto_2261497 ?auto_2261498 ) ( LIFTING ?auto_2261497 ?auto_2261496 ) ( not ( = ?auto_2261501 ?auto_2261497 ) ) ( ON ?auto_2261494 ?auto_2261493 ) ( ON ?auto_2261495 ?auto_2261494 ) ( not ( = ?auto_2261493 ?auto_2261494 ) ) ( not ( = ?auto_2261493 ?auto_2261495 ) ) ( not ( = ?auto_2261493 ?auto_2261492 ) ) ( not ( = ?auto_2261493 ?auto_2261496 ) ) ( not ( = ?auto_2261494 ?auto_2261495 ) ) ( not ( = ?auto_2261494 ?auto_2261492 ) ) ( not ( = ?auto_2261494 ?auto_2261496 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2261495 ?auto_2261492 ?auto_2261496 )
      ( MAKE-4CRATE-VERIFY ?auto_2261493 ?auto_2261494 ?auto_2261495 ?auto_2261492 ?auto_2261496 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2261531 - SURFACE
      ?auto_2261532 - SURFACE
      ?auto_2261533 - SURFACE
      ?auto_2261530 - SURFACE
      ?auto_2261534 - SURFACE
    )
    :vars
    (
      ?auto_2261539 - HOIST
      ?auto_2261535 - PLACE
      ?auto_2261538 - TRUCK
      ?auto_2261536 - PLACE
      ?auto_2261540 - HOIST
      ?auto_2261537 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2261539 ?auto_2261535 ) ( SURFACE-AT ?auto_2261530 ?auto_2261535 ) ( CLEAR ?auto_2261530 ) ( IS-CRATE ?auto_2261534 ) ( not ( = ?auto_2261530 ?auto_2261534 ) ) ( AVAILABLE ?auto_2261539 ) ( ON ?auto_2261530 ?auto_2261533 ) ( not ( = ?auto_2261533 ?auto_2261530 ) ) ( not ( = ?auto_2261533 ?auto_2261534 ) ) ( TRUCK-AT ?auto_2261538 ?auto_2261536 ) ( not ( = ?auto_2261536 ?auto_2261535 ) ) ( HOIST-AT ?auto_2261540 ?auto_2261536 ) ( not ( = ?auto_2261539 ?auto_2261540 ) ) ( AVAILABLE ?auto_2261540 ) ( SURFACE-AT ?auto_2261534 ?auto_2261536 ) ( ON ?auto_2261534 ?auto_2261537 ) ( CLEAR ?auto_2261534 ) ( not ( = ?auto_2261530 ?auto_2261537 ) ) ( not ( = ?auto_2261534 ?auto_2261537 ) ) ( not ( = ?auto_2261533 ?auto_2261537 ) ) ( ON ?auto_2261532 ?auto_2261531 ) ( ON ?auto_2261533 ?auto_2261532 ) ( not ( = ?auto_2261531 ?auto_2261532 ) ) ( not ( = ?auto_2261531 ?auto_2261533 ) ) ( not ( = ?auto_2261531 ?auto_2261530 ) ) ( not ( = ?auto_2261531 ?auto_2261534 ) ) ( not ( = ?auto_2261531 ?auto_2261537 ) ) ( not ( = ?auto_2261532 ?auto_2261533 ) ) ( not ( = ?auto_2261532 ?auto_2261530 ) ) ( not ( = ?auto_2261532 ?auto_2261534 ) ) ( not ( = ?auto_2261532 ?auto_2261537 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2261533 ?auto_2261530 ?auto_2261534 )
      ( MAKE-4CRATE-VERIFY ?auto_2261531 ?auto_2261532 ?auto_2261533 ?auto_2261530 ?auto_2261534 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2261570 - SURFACE
      ?auto_2261571 - SURFACE
      ?auto_2261572 - SURFACE
      ?auto_2261569 - SURFACE
      ?auto_2261573 - SURFACE
    )
    :vars
    (
      ?auto_2261574 - HOIST
      ?auto_2261576 - PLACE
      ?auto_2261575 - PLACE
      ?auto_2261577 - HOIST
      ?auto_2261579 - SURFACE
      ?auto_2261578 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2261574 ?auto_2261576 ) ( SURFACE-AT ?auto_2261569 ?auto_2261576 ) ( CLEAR ?auto_2261569 ) ( IS-CRATE ?auto_2261573 ) ( not ( = ?auto_2261569 ?auto_2261573 ) ) ( AVAILABLE ?auto_2261574 ) ( ON ?auto_2261569 ?auto_2261572 ) ( not ( = ?auto_2261572 ?auto_2261569 ) ) ( not ( = ?auto_2261572 ?auto_2261573 ) ) ( not ( = ?auto_2261575 ?auto_2261576 ) ) ( HOIST-AT ?auto_2261577 ?auto_2261575 ) ( not ( = ?auto_2261574 ?auto_2261577 ) ) ( AVAILABLE ?auto_2261577 ) ( SURFACE-AT ?auto_2261573 ?auto_2261575 ) ( ON ?auto_2261573 ?auto_2261579 ) ( CLEAR ?auto_2261573 ) ( not ( = ?auto_2261569 ?auto_2261579 ) ) ( not ( = ?auto_2261573 ?auto_2261579 ) ) ( not ( = ?auto_2261572 ?auto_2261579 ) ) ( TRUCK-AT ?auto_2261578 ?auto_2261576 ) ( ON ?auto_2261571 ?auto_2261570 ) ( ON ?auto_2261572 ?auto_2261571 ) ( not ( = ?auto_2261570 ?auto_2261571 ) ) ( not ( = ?auto_2261570 ?auto_2261572 ) ) ( not ( = ?auto_2261570 ?auto_2261569 ) ) ( not ( = ?auto_2261570 ?auto_2261573 ) ) ( not ( = ?auto_2261570 ?auto_2261579 ) ) ( not ( = ?auto_2261571 ?auto_2261572 ) ) ( not ( = ?auto_2261571 ?auto_2261569 ) ) ( not ( = ?auto_2261571 ?auto_2261573 ) ) ( not ( = ?auto_2261571 ?auto_2261579 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2261572 ?auto_2261569 ?auto_2261573 )
      ( MAKE-4CRATE-VERIFY ?auto_2261570 ?auto_2261571 ?auto_2261572 ?auto_2261569 ?auto_2261573 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2261609 - SURFACE
      ?auto_2261610 - SURFACE
      ?auto_2261611 - SURFACE
      ?auto_2261608 - SURFACE
      ?auto_2261612 - SURFACE
    )
    :vars
    (
      ?auto_2261613 - HOIST
      ?auto_2261618 - PLACE
      ?auto_2261617 - PLACE
      ?auto_2261615 - HOIST
      ?auto_2261614 - SURFACE
      ?auto_2261616 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2261613 ?auto_2261618 ) ( IS-CRATE ?auto_2261612 ) ( not ( = ?auto_2261608 ?auto_2261612 ) ) ( not ( = ?auto_2261611 ?auto_2261608 ) ) ( not ( = ?auto_2261611 ?auto_2261612 ) ) ( not ( = ?auto_2261617 ?auto_2261618 ) ) ( HOIST-AT ?auto_2261615 ?auto_2261617 ) ( not ( = ?auto_2261613 ?auto_2261615 ) ) ( AVAILABLE ?auto_2261615 ) ( SURFACE-AT ?auto_2261612 ?auto_2261617 ) ( ON ?auto_2261612 ?auto_2261614 ) ( CLEAR ?auto_2261612 ) ( not ( = ?auto_2261608 ?auto_2261614 ) ) ( not ( = ?auto_2261612 ?auto_2261614 ) ) ( not ( = ?auto_2261611 ?auto_2261614 ) ) ( TRUCK-AT ?auto_2261616 ?auto_2261618 ) ( SURFACE-AT ?auto_2261611 ?auto_2261618 ) ( CLEAR ?auto_2261611 ) ( LIFTING ?auto_2261613 ?auto_2261608 ) ( IS-CRATE ?auto_2261608 ) ( ON ?auto_2261610 ?auto_2261609 ) ( ON ?auto_2261611 ?auto_2261610 ) ( not ( = ?auto_2261609 ?auto_2261610 ) ) ( not ( = ?auto_2261609 ?auto_2261611 ) ) ( not ( = ?auto_2261609 ?auto_2261608 ) ) ( not ( = ?auto_2261609 ?auto_2261612 ) ) ( not ( = ?auto_2261609 ?auto_2261614 ) ) ( not ( = ?auto_2261610 ?auto_2261611 ) ) ( not ( = ?auto_2261610 ?auto_2261608 ) ) ( not ( = ?auto_2261610 ?auto_2261612 ) ) ( not ( = ?auto_2261610 ?auto_2261614 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2261611 ?auto_2261608 ?auto_2261612 )
      ( MAKE-4CRATE-VERIFY ?auto_2261609 ?auto_2261610 ?auto_2261611 ?auto_2261608 ?auto_2261612 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2261648 - SURFACE
      ?auto_2261649 - SURFACE
      ?auto_2261650 - SURFACE
      ?auto_2261647 - SURFACE
      ?auto_2261651 - SURFACE
    )
    :vars
    (
      ?auto_2261654 - HOIST
      ?auto_2261653 - PLACE
      ?auto_2261656 - PLACE
      ?auto_2261655 - HOIST
      ?auto_2261652 - SURFACE
      ?auto_2261657 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2261654 ?auto_2261653 ) ( IS-CRATE ?auto_2261651 ) ( not ( = ?auto_2261647 ?auto_2261651 ) ) ( not ( = ?auto_2261650 ?auto_2261647 ) ) ( not ( = ?auto_2261650 ?auto_2261651 ) ) ( not ( = ?auto_2261656 ?auto_2261653 ) ) ( HOIST-AT ?auto_2261655 ?auto_2261656 ) ( not ( = ?auto_2261654 ?auto_2261655 ) ) ( AVAILABLE ?auto_2261655 ) ( SURFACE-AT ?auto_2261651 ?auto_2261656 ) ( ON ?auto_2261651 ?auto_2261652 ) ( CLEAR ?auto_2261651 ) ( not ( = ?auto_2261647 ?auto_2261652 ) ) ( not ( = ?auto_2261651 ?auto_2261652 ) ) ( not ( = ?auto_2261650 ?auto_2261652 ) ) ( TRUCK-AT ?auto_2261657 ?auto_2261653 ) ( SURFACE-AT ?auto_2261650 ?auto_2261653 ) ( CLEAR ?auto_2261650 ) ( IS-CRATE ?auto_2261647 ) ( AVAILABLE ?auto_2261654 ) ( IN ?auto_2261647 ?auto_2261657 ) ( ON ?auto_2261649 ?auto_2261648 ) ( ON ?auto_2261650 ?auto_2261649 ) ( not ( = ?auto_2261648 ?auto_2261649 ) ) ( not ( = ?auto_2261648 ?auto_2261650 ) ) ( not ( = ?auto_2261648 ?auto_2261647 ) ) ( not ( = ?auto_2261648 ?auto_2261651 ) ) ( not ( = ?auto_2261648 ?auto_2261652 ) ) ( not ( = ?auto_2261649 ?auto_2261650 ) ) ( not ( = ?auto_2261649 ?auto_2261647 ) ) ( not ( = ?auto_2261649 ?auto_2261651 ) ) ( not ( = ?auto_2261649 ?auto_2261652 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2261650 ?auto_2261647 ?auto_2261651 )
      ( MAKE-4CRATE-VERIFY ?auto_2261648 ?auto_2261649 ?auto_2261650 ?auto_2261647 ?auto_2261651 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2262308 - SURFACE
      ?auto_2262309 - SURFACE
      ?auto_2262310 - SURFACE
      ?auto_2262307 - SURFACE
      ?auto_2262311 - SURFACE
      ?auto_2262312 - SURFACE
    )
    :vars
    (
      ?auto_2262313 - HOIST
      ?auto_2262314 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2262313 ?auto_2262314 ) ( SURFACE-AT ?auto_2262311 ?auto_2262314 ) ( CLEAR ?auto_2262311 ) ( LIFTING ?auto_2262313 ?auto_2262312 ) ( IS-CRATE ?auto_2262312 ) ( not ( = ?auto_2262311 ?auto_2262312 ) ) ( ON ?auto_2262309 ?auto_2262308 ) ( ON ?auto_2262310 ?auto_2262309 ) ( ON ?auto_2262307 ?auto_2262310 ) ( ON ?auto_2262311 ?auto_2262307 ) ( not ( = ?auto_2262308 ?auto_2262309 ) ) ( not ( = ?auto_2262308 ?auto_2262310 ) ) ( not ( = ?auto_2262308 ?auto_2262307 ) ) ( not ( = ?auto_2262308 ?auto_2262311 ) ) ( not ( = ?auto_2262308 ?auto_2262312 ) ) ( not ( = ?auto_2262309 ?auto_2262310 ) ) ( not ( = ?auto_2262309 ?auto_2262307 ) ) ( not ( = ?auto_2262309 ?auto_2262311 ) ) ( not ( = ?auto_2262309 ?auto_2262312 ) ) ( not ( = ?auto_2262310 ?auto_2262307 ) ) ( not ( = ?auto_2262310 ?auto_2262311 ) ) ( not ( = ?auto_2262310 ?auto_2262312 ) ) ( not ( = ?auto_2262307 ?auto_2262311 ) ) ( not ( = ?auto_2262307 ?auto_2262312 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2262311 ?auto_2262312 )
      ( MAKE-5CRATE-VERIFY ?auto_2262308 ?auto_2262309 ?auto_2262310 ?auto_2262307 ?auto_2262311 ?auto_2262312 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2262342 - SURFACE
      ?auto_2262343 - SURFACE
      ?auto_2262344 - SURFACE
      ?auto_2262341 - SURFACE
      ?auto_2262345 - SURFACE
      ?auto_2262346 - SURFACE
    )
    :vars
    (
      ?auto_2262347 - HOIST
      ?auto_2262348 - PLACE
      ?auto_2262349 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2262347 ?auto_2262348 ) ( SURFACE-AT ?auto_2262345 ?auto_2262348 ) ( CLEAR ?auto_2262345 ) ( IS-CRATE ?auto_2262346 ) ( not ( = ?auto_2262345 ?auto_2262346 ) ) ( TRUCK-AT ?auto_2262349 ?auto_2262348 ) ( AVAILABLE ?auto_2262347 ) ( IN ?auto_2262346 ?auto_2262349 ) ( ON ?auto_2262345 ?auto_2262341 ) ( not ( = ?auto_2262341 ?auto_2262345 ) ) ( not ( = ?auto_2262341 ?auto_2262346 ) ) ( ON ?auto_2262343 ?auto_2262342 ) ( ON ?auto_2262344 ?auto_2262343 ) ( ON ?auto_2262341 ?auto_2262344 ) ( not ( = ?auto_2262342 ?auto_2262343 ) ) ( not ( = ?auto_2262342 ?auto_2262344 ) ) ( not ( = ?auto_2262342 ?auto_2262341 ) ) ( not ( = ?auto_2262342 ?auto_2262345 ) ) ( not ( = ?auto_2262342 ?auto_2262346 ) ) ( not ( = ?auto_2262343 ?auto_2262344 ) ) ( not ( = ?auto_2262343 ?auto_2262341 ) ) ( not ( = ?auto_2262343 ?auto_2262345 ) ) ( not ( = ?auto_2262343 ?auto_2262346 ) ) ( not ( = ?auto_2262344 ?auto_2262341 ) ) ( not ( = ?auto_2262344 ?auto_2262345 ) ) ( not ( = ?auto_2262344 ?auto_2262346 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2262341 ?auto_2262345 ?auto_2262346 )
      ( MAKE-5CRATE-VERIFY ?auto_2262342 ?auto_2262343 ?auto_2262344 ?auto_2262341 ?auto_2262345 ?auto_2262346 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2262382 - SURFACE
      ?auto_2262383 - SURFACE
      ?auto_2262384 - SURFACE
      ?auto_2262381 - SURFACE
      ?auto_2262385 - SURFACE
      ?auto_2262386 - SURFACE
    )
    :vars
    (
      ?auto_2262390 - HOIST
      ?auto_2262387 - PLACE
      ?auto_2262388 - TRUCK
      ?auto_2262389 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2262390 ?auto_2262387 ) ( SURFACE-AT ?auto_2262385 ?auto_2262387 ) ( CLEAR ?auto_2262385 ) ( IS-CRATE ?auto_2262386 ) ( not ( = ?auto_2262385 ?auto_2262386 ) ) ( AVAILABLE ?auto_2262390 ) ( IN ?auto_2262386 ?auto_2262388 ) ( ON ?auto_2262385 ?auto_2262381 ) ( not ( = ?auto_2262381 ?auto_2262385 ) ) ( not ( = ?auto_2262381 ?auto_2262386 ) ) ( TRUCK-AT ?auto_2262388 ?auto_2262389 ) ( not ( = ?auto_2262389 ?auto_2262387 ) ) ( ON ?auto_2262383 ?auto_2262382 ) ( ON ?auto_2262384 ?auto_2262383 ) ( ON ?auto_2262381 ?auto_2262384 ) ( not ( = ?auto_2262382 ?auto_2262383 ) ) ( not ( = ?auto_2262382 ?auto_2262384 ) ) ( not ( = ?auto_2262382 ?auto_2262381 ) ) ( not ( = ?auto_2262382 ?auto_2262385 ) ) ( not ( = ?auto_2262382 ?auto_2262386 ) ) ( not ( = ?auto_2262383 ?auto_2262384 ) ) ( not ( = ?auto_2262383 ?auto_2262381 ) ) ( not ( = ?auto_2262383 ?auto_2262385 ) ) ( not ( = ?auto_2262383 ?auto_2262386 ) ) ( not ( = ?auto_2262384 ?auto_2262381 ) ) ( not ( = ?auto_2262384 ?auto_2262385 ) ) ( not ( = ?auto_2262384 ?auto_2262386 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2262381 ?auto_2262385 ?auto_2262386 )
      ( MAKE-5CRATE-VERIFY ?auto_2262382 ?auto_2262383 ?auto_2262384 ?auto_2262381 ?auto_2262385 ?auto_2262386 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2262427 - SURFACE
      ?auto_2262428 - SURFACE
      ?auto_2262429 - SURFACE
      ?auto_2262426 - SURFACE
      ?auto_2262430 - SURFACE
      ?auto_2262431 - SURFACE
    )
    :vars
    (
      ?auto_2262433 - HOIST
      ?auto_2262432 - PLACE
      ?auto_2262436 - TRUCK
      ?auto_2262435 - PLACE
      ?auto_2262434 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2262433 ?auto_2262432 ) ( SURFACE-AT ?auto_2262430 ?auto_2262432 ) ( CLEAR ?auto_2262430 ) ( IS-CRATE ?auto_2262431 ) ( not ( = ?auto_2262430 ?auto_2262431 ) ) ( AVAILABLE ?auto_2262433 ) ( ON ?auto_2262430 ?auto_2262426 ) ( not ( = ?auto_2262426 ?auto_2262430 ) ) ( not ( = ?auto_2262426 ?auto_2262431 ) ) ( TRUCK-AT ?auto_2262436 ?auto_2262435 ) ( not ( = ?auto_2262435 ?auto_2262432 ) ) ( HOIST-AT ?auto_2262434 ?auto_2262435 ) ( LIFTING ?auto_2262434 ?auto_2262431 ) ( not ( = ?auto_2262433 ?auto_2262434 ) ) ( ON ?auto_2262428 ?auto_2262427 ) ( ON ?auto_2262429 ?auto_2262428 ) ( ON ?auto_2262426 ?auto_2262429 ) ( not ( = ?auto_2262427 ?auto_2262428 ) ) ( not ( = ?auto_2262427 ?auto_2262429 ) ) ( not ( = ?auto_2262427 ?auto_2262426 ) ) ( not ( = ?auto_2262427 ?auto_2262430 ) ) ( not ( = ?auto_2262427 ?auto_2262431 ) ) ( not ( = ?auto_2262428 ?auto_2262429 ) ) ( not ( = ?auto_2262428 ?auto_2262426 ) ) ( not ( = ?auto_2262428 ?auto_2262430 ) ) ( not ( = ?auto_2262428 ?auto_2262431 ) ) ( not ( = ?auto_2262429 ?auto_2262426 ) ) ( not ( = ?auto_2262429 ?auto_2262430 ) ) ( not ( = ?auto_2262429 ?auto_2262431 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2262426 ?auto_2262430 ?auto_2262431 )
      ( MAKE-5CRATE-VERIFY ?auto_2262427 ?auto_2262428 ?auto_2262429 ?auto_2262426 ?auto_2262430 ?auto_2262431 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2262477 - SURFACE
      ?auto_2262478 - SURFACE
      ?auto_2262479 - SURFACE
      ?auto_2262476 - SURFACE
      ?auto_2262480 - SURFACE
      ?auto_2262481 - SURFACE
    )
    :vars
    (
      ?auto_2262485 - HOIST
      ?auto_2262487 - PLACE
      ?auto_2262482 - TRUCK
      ?auto_2262483 - PLACE
      ?auto_2262484 - HOIST
      ?auto_2262486 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2262485 ?auto_2262487 ) ( SURFACE-AT ?auto_2262480 ?auto_2262487 ) ( CLEAR ?auto_2262480 ) ( IS-CRATE ?auto_2262481 ) ( not ( = ?auto_2262480 ?auto_2262481 ) ) ( AVAILABLE ?auto_2262485 ) ( ON ?auto_2262480 ?auto_2262476 ) ( not ( = ?auto_2262476 ?auto_2262480 ) ) ( not ( = ?auto_2262476 ?auto_2262481 ) ) ( TRUCK-AT ?auto_2262482 ?auto_2262483 ) ( not ( = ?auto_2262483 ?auto_2262487 ) ) ( HOIST-AT ?auto_2262484 ?auto_2262483 ) ( not ( = ?auto_2262485 ?auto_2262484 ) ) ( AVAILABLE ?auto_2262484 ) ( SURFACE-AT ?auto_2262481 ?auto_2262483 ) ( ON ?auto_2262481 ?auto_2262486 ) ( CLEAR ?auto_2262481 ) ( not ( = ?auto_2262480 ?auto_2262486 ) ) ( not ( = ?auto_2262481 ?auto_2262486 ) ) ( not ( = ?auto_2262476 ?auto_2262486 ) ) ( ON ?auto_2262478 ?auto_2262477 ) ( ON ?auto_2262479 ?auto_2262478 ) ( ON ?auto_2262476 ?auto_2262479 ) ( not ( = ?auto_2262477 ?auto_2262478 ) ) ( not ( = ?auto_2262477 ?auto_2262479 ) ) ( not ( = ?auto_2262477 ?auto_2262476 ) ) ( not ( = ?auto_2262477 ?auto_2262480 ) ) ( not ( = ?auto_2262477 ?auto_2262481 ) ) ( not ( = ?auto_2262477 ?auto_2262486 ) ) ( not ( = ?auto_2262478 ?auto_2262479 ) ) ( not ( = ?auto_2262478 ?auto_2262476 ) ) ( not ( = ?auto_2262478 ?auto_2262480 ) ) ( not ( = ?auto_2262478 ?auto_2262481 ) ) ( not ( = ?auto_2262478 ?auto_2262486 ) ) ( not ( = ?auto_2262479 ?auto_2262476 ) ) ( not ( = ?auto_2262479 ?auto_2262480 ) ) ( not ( = ?auto_2262479 ?auto_2262481 ) ) ( not ( = ?auto_2262479 ?auto_2262486 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2262476 ?auto_2262480 ?auto_2262481 )
      ( MAKE-5CRATE-VERIFY ?auto_2262477 ?auto_2262478 ?auto_2262479 ?auto_2262476 ?auto_2262480 ?auto_2262481 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2262528 - SURFACE
      ?auto_2262529 - SURFACE
      ?auto_2262530 - SURFACE
      ?auto_2262527 - SURFACE
      ?auto_2262531 - SURFACE
      ?auto_2262532 - SURFACE
    )
    :vars
    (
      ?auto_2262533 - HOIST
      ?auto_2262535 - PLACE
      ?auto_2262537 - PLACE
      ?auto_2262534 - HOIST
      ?auto_2262538 - SURFACE
      ?auto_2262536 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2262533 ?auto_2262535 ) ( SURFACE-AT ?auto_2262531 ?auto_2262535 ) ( CLEAR ?auto_2262531 ) ( IS-CRATE ?auto_2262532 ) ( not ( = ?auto_2262531 ?auto_2262532 ) ) ( AVAILABLE ?auto_2262533 ) ( ON ?auto_2262531 ?auto_2262527 ) ( not ( = ?auto_2262527 ?auto_2262531 ) ) ( not ( = ?auto_2262527 ?auto_2262532 ) ) ( not ( = ?auto_2262537 ?auto_2262535 ) ) ( HOIST-AT ?auto_2262534 ?auto_2262537 ) ( not ( = ?auto_2262533 ?auto_2262534 ) ) ( AVAILABLE ?auto_2262534 ) ( SURFACE-AT ?auto_2262532 ?auto_2262537 ) ( ON ?auto_2262532 ?auto_2262538 ) ( CLEAR ?auto_2262532 ) ( not ( = ?auto_2262531 ?auto_2262538 ) ) ( not ( = ?auto_2262532 ?auto_2262538 ) ) ( not ( = ?auto_2262527 ?auto_2262538 ) ) ( TRUCK-AT ?auto_2262536 ?auto_2262535 ) ( ON ?auto_2262529 ?auto_2262528 ) ( ON ?auto_2262530 ?auto_2262529 ) ( ON ?auto_2262527 ?auto_2262530 ) ( not ( = ?auto_2262528 ?auto_2262529 ) ) ( not ( = ?auto_2262528 ?auto_2262530 ) ) ( not ( = ?auto_2262528 ?auto_2262527 ) ) ( not ( = ?auto_2262528 ?auto_2262531 ) ) ( not ( = ?auto_2262528 ?auto_2262532 ) ) ( not ( = ?auto_2262528 ?auto_2262538 ) ) ( not ( = ?auto_2262529 ?auto_2262530 ) ) ( not ( = ?auto_2262529 ?auto_2262527 ) ) ( not ( = ?auto_2262529 ?auto_2262531 ) ) ( not ( = ?auto_2262529 ?auto_2262532 ) ) ( not ( = ?auto_2262529 ?auto_2262538 ) ) ( not ( = ?auto_2262530 ?auto_2262527 ) ) ( not ( = ?auto_2262530 ?auto_2262531 ) ) ( not ( = ?auto_2262530 ?auto_2262532 ) ) ( not ( = ?auto_2262530 ?auto_2262538 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2262527 ?auto_2262531 ?auto_2262532 )
      ( MAKE-5CRATE-VERIFY ?auto_2262528 ?auto_2262529 ?auto_2262530 ?auto_2262527 ?auto_2262531 ?auto_2262532 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2262579 - SURFACE
      ?auto_2262580 - SURFACE
      ?auto_2262581 - SURFACE
      ?auto_2262578 - SURFACE
      ?auto_2262582 - SURFACE
      ?auto_2262583 - SURFACE
    )
    :vars
    (
      ?auto_2262586 - HOIST
      ?auto_2262588 - PLACE
      ?auto_2262584 - PLACE
      ?auto_2262587 - HOIST
      ?auto_2262589 - SURFACE
      ?auto_2262585 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2262586 ?auto_2262588 ) ( IS-CRATE ?auto_2262583 ) ( not ( = ?auto_2262582 ?auto_2262583 ) ) ( not ( = ?auto_2262578 ?auto_2262582 ) ) ( not ( = ?auto_2262578 ?auto_2262583 ) ) ( not ( = ?auto_2262584 ?auto_2262588 ) ) ( HOIST-AT ?auto_2262587 ?auto_2262584 ) ( not ( = ?auto_2262586 ?auto_2262587 ) ) ( AVAILABLE ?auto_2262587 ) ( SURFACE-AT ?auto_2262583 ?auto_2262584 ) ( ON ?auto_2262583 ?auto_2262589 ) ( CLEAR ?auto_2262583 ) ( not ( = ?auto_2262582 ?auto_2262589 ) ) ( not ( = ?auto_2262583 ?auto_2262589 ) ) ( not ( = ?auto_2262578 ?auto_2262589 ) ) ( TRUCK-AT ?auto_2262585 ?auto_2262588 ) ( SURFACE-AT ?auto_2262578 ?auto_2262588 ) ( CLEAR ?auto_2262578 ) ( LIFTING ?auto_2262586 ?auto_2262582 ) ( IS-CRATE ?auto_2262582 ) ( ON ?auto_2262580 ?auto_2262579 ) ( ON ?auto_2262581 ?auto_2262580 ) ( ON ?auto_2262578 ?auto_2262581 ) ( not ( = ?auto_2262579 ?auto_2262580 ) ) ( not ( = ?auto_2262579 ?auto_2262581 ) ) ( not ( = ?auto_2262579 ?auto_2262578 ) ) ( not ( = ?auto_2262579 ?auto_2262582 ) ) ( not ( = ?auto_2262579 ?auto_2262583 ) ) ( not ( = ?auto_2262579 ?auto_2262589 ) ) ( not ( = ?auto_2262580 ?auto_2262581 ) ) ( not ( = ?auto_2262580 ?auto_2262578 ) ) ( not ( = ?auto_2262580 ?auto_2262582 ) ) ( not ( = ?auto_2262580 ?auto_2262583 ) ) ( not ( = ?auto_2262580 ?auto_2262589 ) ) ( not ( = ?auto_2262581 ?auto_2262578 ) ) ( not ( = ?auto_2262581 ?auto_2262582 ) ) ( not ( = ?auto_2262581 ?auto_2262583 ) ) ( not ( = ?auto_2262581 ?auto_2262589 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2262578 ?auto_2262582 ?auto_2262583 )
      ( MAKE-5CRATE-VERIFY ?auto_2262579 ?auto_2262580 ?auto_2262581 ?auto_2262578 ?auto_2262582 ?auto_2262583 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2262630 - SURFACE
      ?auto_2262631 - SURFACE
      ?auto_2262632 - SURFACE
      ?auto_2262629 - SURFACE
      ?auto_2262633 - SURFACE
      ?auto_2262634 - SURFACE
    )
    :vars
    (
      ?auto_2262635 - HOIST
      ?auto_2262637 - PLACE
      ?auto_2262638 - PLACE
      ?auto_2262636 - HOIST
      ?auto_2262640 - SURFACE
      ?auto_2262639 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2262635 ?auto_2262637 ) ( IS-CRATE ?auto_2262634 ) ( not ( = ?auto_2262633 ?auto_2262634 ) ) ( not ( = ?auto_2262629 ?auto_2262633 ) ) ( not ( = ?auto_2262629 ?auto_2262634 ) ) ( not ( = ?auto_2262638 ?auto_2262637 ) ) ( HOIST-AT ?auto_2262636 ?auto_2262638 ) ( not ( = ?auto_2262635 ?auto_2262636 ) ) ( AVAILABLE ?auto_2262636 ) ( SURFACE-AT ?auto_2262634 ?auto_2262638 ) ( ON ?auto_2262634 ?auto_2262640 ) ( CLEAR ?auto_2262634 ) ( not ( = ?auto_2262633 ?auto_2262640 ) ) ( not ( = ?auto_2262634 ?auto_2262640 ) ) ( not ( = ?auto_2262629 ?auto_2262640 ) ) ( TRUCK-AT ?auto_2262639 ?auto_2262637 ) ( SURFACE-AT ?auto_2262629 ?auto_2262637 ) ( CLEAR ?auto_2262629 ) ( IS-CRATE ?auto_2262633 ) ( AVAILABLE ?auto_2262635 ) ( IN ?auto_2262633 ?auto_2262639 ) ( ON ?auto_2262631 ?auto_2262630 ) ( ON ?auto_2262632 ?auto_2262631 ) ( ON ?auto_2262629 ?auto_2262632 ) ( not ( = ?auto_2262630 ?auto_2262631 ) ) ( not ( = ?auto_2262630 ?auto_2262632 ) ) ( not ( = ?auto_2262630 ?auto_2262629 ) ) ( not ( = ?auto_2262630 ?auto_2262633 ) ) ( not ( = ?auto_2262630 ?auto_2262634 ) ) ( not ( = ?auto_2262630 ?auto_2262640 ) ) ( not ( = ?auto_2262631 ?auto_2262632 ) ) ( not ( = ?auto_2262631 ?auto_2262629 ) ) ( not ( = ?auto_2262631 ?auto_2262633 ) ) ( not ( = ?auto_2262631 ?auto_2262634 ) ) ( not ( = ?auto_2262631 ?auto_2262640 ) ) ( not ( = ?auto_2262632 ?auto_2262629 ) ) ( not ( = ?auto_2262632 ?auto_2262633 ) ) ( not ( = ?auto_2262632 ?auto_2262634 ) ) ( not ( = ?auto_2262632 ?auto_2262640 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2262629 ?auto_2262633 ?auto_2262634 )
      ( MAKE-5CRATE-VERIFY ?auto_2262630 ?auto_2262631 ?auto_2262632 ?auto_2262629 ?auto_2262633 ?auto_2262634 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2263621 - SURFACE
      ?auto_2263622 - SURFACE
    )
    :vars
    (
      ?auto_2263624 - HOIST
      ?auto_2263629 - PLACE
      ?auto_2263627 - SURFACE
      ?auto_2263623 - TRUCK
      ?auto_2263625 - PLACE
      ?auto_2263626 - HOIST
      ?auto_2263628 - SURFACE
      ?auto_2263630 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2263624 ?auto_2263629 ) ( SURFACE-AT ?auto_2263621 ?auto_2263629 ) ( CLEAR ?auto_2263621 ) ( IS-CRATE ?auto_2263622 ) ( not ( = ?auto_2263621 ?auto_2263622 ) ) ( AVAILABLE ?auto_2263624 ) ( ON ?auto_2263621 ?auto_2263627 ) ( not ( = ?auto_2263627 ?auto_2263621 ) ) ( not ( = ?auto_2263627 ?auto_2263622 ) ) ( TRUCK-AT ?auto_2263623 ?auto_2263625 ) ( not ( = ?auto_2263625 ?auto_2263629 ) ) ( HOIST-AT ?auto_2263626 ?auto_2263625 ) ( not ( = ?auto_2263624 ?auto_2263626 ) ) ( SURFACE-AT ?auto_2263622 ?auto_2263625 ) ( ON ?auto_2263622 ?auto_2263628 ) ( CLEAR ?auto_2263622 ) ( not ( = ?auto_2263621 ?auto_2263628 ) ) ( not ( = ?auto_2263622 ?auto_2263628 ) ) ( not ( = ?auto_2263627 ?auto_2263628 ) ) ( LIFTING ?auto_2263626 ?auto_2263630 ) ( IS-CRATE ?auto_2263630 ) ( not ( = ?auto_2263621 ?auto_2263630 ) ) ( not ( = ?auto_2263622 ?auto_2263630 ) ) ( not ( = ?auto_2263627 ?auto_2263630 ) ) ( not ( = ?auto_2263628 ?auto_2263630 ) ) )
    :subtasks
    ( ( !LOAD ?auto_2263626 ?auto_2263630 ?auto_2263623 ?auto_2263625 )
      ( MAKE-1CRATE ?auto_2263621 ?auto_2263622 )
      ( MAKE-1CRATE-VERIFY ?auto_2263621 ?auto_2263622 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2263837 - SURFACE
      ?auto_2263838 - SURFACE
      ?auto_2263839 - SURFACE
      ?auto_2263836 - SURFACE
      ?auto_2263840 - SURFACE
      ?auto_2263842 - SURFACE
      ?auto_2263841 - SURFACE
    )
    :vars
    (
      ?auto_2263844 - HOIST
      ?auto_2263843 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2263844 ?auto_2263843 ) ( SURFACE-AT ?auto_2263842 ?auto_2263843 ) ( CLEAR ?auto_2263842 ) ( LIFTING ?auto_2263844 ?auto_2263841 ) ( IS-CRATE ?auto_2263841 ) ( not ( = ?auto_2263842 ?auto_2263841 ) ) ( ON ?auto_2263838 ?auto_2263837 ) ( ON ?auto_2263839 ?auto_2263838 ) ( ON ?auto_2263836 ?auto_2263839 ) ( ON ?auto_2263840 ?auto_2263836 ) ( ON ?auto_2263842 ?auto_2263840 ) ( not ( = ?auto_2263837 ?auto_2263838 ) ) ( not ( = ?auto_2263837 ?auto_2263839 ) ) ( not ( = ?auto_2263837 ?auto_2263836 ) ) ( not ( = ?auto_2263837 ?auto_2263840 ) ) ( not ( = ?auto_2263837 ?auto_2263842 ) ) ( not ( = ?auto_2263837 ?auto_2263841 ) ) ( not ( = ?auto_2263838 ?auto_2263839 ) ) ( not ( = ?auto_2263838 ?auto_2263836 ) ) ( not ( = ?auto_2263838 ?auto_2263840 ) ) ( not ( = ?auto_2263838 ?auto_2263842 ) ) ( not ( = ?auto_2263838 ?auto_2263841 ) ) ( not ( = ?auto_2263839 ?auto_2263836 ) ) ( not ( = ?auto_2263839 ?auto_2263840 ) ) ( not ( = ?auto_2263839 ?auto_2263842 ) ) ( not ( = ?auto_2263839 ?auto_2263841 ) ) ( not ( = ?auto_2263836 ?auto_2263840 ) ) ( not ( = ?auto_2263836 ?auto_2263842 ) ) ( not ( = ?auto_2263836 ?auto_2263841 ) ) ( not ( = ?auto_2263840 ?auto_2263842 ) ) ( not ( = ?auto_2263840 ?auto_2263841 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2263842 ?auto_2263841 )
      ( MAKE-6CRATE-VERIFY ?auto_2263837 ?auto_2263838 ?auto_2263839 ?auto_2263836 ?auto_2263840 ?auto_2263842 ?auto_2263841 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2263881 - SURFACE
      ?auto_2263882 - SURFACE
      ?auto_2263883 - SURFACE
      ?auto_2263880 - SURFACE
      ?auto_2263884 - SURFACE
      ?auto_2263886 - SURFACE
      ?auto_2263885 - SURFACE
    )
    :vars
    (
      ?auto_2263888 - HOIST
      ?auto_2263887 - PLACE
      ?auto_2263889 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2263888 ?auto_2263887 ) ( SURFACE-AT ?auto_2263886 ?auto_2263887 ) ( CLEAR ?auto_2263886 ) ( IS-CRATE ?auto_2263885 ) ( not ( = ?auto_2263886 ?auto_2263885 ) ) ( TRUCK-AT ?auto_2263889 ?auto_2263887 ) ( AVAILABLE ?auto_2263888 ) ( IN ?auto_2263885 ?auto_2263889 ) ( ON ?auto_2263886 ?auto_2263884 ) ( not ( = ?auto_2263884 ?auto_2263886 ) ) ( not ( = ?auto_2263884 ?auto_2263885 ) ) ( ON ?auto_2263882 ?auto_2263881 ) ( ON ?auto_2263883 ?auto_2263882 ) ( ON ?auto_2263880 ?auto_2263883 ) ( ON ?auto_2263884 ?auto_2263880 ) ( not ( = ?auto_2263881 ?auto_2263882 ) ) ( not ( = ?auto_2263881 ?auto_2263883 ) ) ( not ( = ?auto_2263881 ?auto_2263880 ) ) ( not ( = ?auto_2263881 ?auto_2263884 ) ) ( not ( = ?auto_2263881 ?auto_2263886 ) ) ( not ( = ?auto_2263881 ?auto_2263885 ) ) ( not ( = ?auto_2263882 ?auto_2263883 ) ) ( not ( = ?auto_2263882 ?auto_2263880 ) ) ( not ( = ?auto_2263882 ?auto_2263884 ) ) ( not ( = ?auto_2263882 ?auto_2263886 ) ) ( not ( = ?auto_2263882 ?auto_2263885 ) ) ( not ( = ?auto_2263883 ?auto_2263880 ) ) ( not ( = ?auto_2263883 ?auto_2263884 ) ) ( not ( = ?auto_2263883 ?auto_2263886 ) ) ( not ( = ?auto_2263883 ?auto_2263885 ) ) ( not ( = ?auto_2263880 ?auto_2263884 ) ) ( not ( = ?auto_2263880 ?auto_2263886 ) ) ( not ( = ?auto_2263880 ?auto_2263885 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2263884 ?auto_2263886 ?auto_2263885 )
      ( MAKE-6CRATE-VERIFY ?auto_2263881 ?auto_2263882 ?auto_2263883 ?auto_2263880 ?auto_2263884 ?auto_2263886 ?auto_2263885 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2263932 - SURFACE
      ?auto_2263933 - SURFACE
      ?auto_2263934 - SURFACE
      ?auto_2263931 - SURFACE
      ?auto_2263935 - SURFACE
      ?auto_2263937 - SURFACE
      ?auto_2263936 - SURFACE
    )
    :vars
    (
      ?auto_2263940 - HOIST
      ?auto_2263941 - PLACE
      ?auto_2263939 - TRUCK
      ?auto_2263938 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2263940 ?auto_2263941 ) ( SURFACE-AT ?auto_2263937 ?auto_2263941 ) ( CLEAR ?auto_2263937 ) ( IS-CRATE ?auto_2263936 ) ( not ( = ?auto_2263937 ?auto_2263936 ) ) ( AVAILABLE ?auto_2263940 ) ( IN ?auto_2263936 ?auto_2263939 ) ( ON ?auto_2263937 ?auto_2263935 ) ( not ( = ?auto_2263935 ?auto_2263937 ) ) ( not ( = ?auto_2263935 ?auto_2263936 ) ) ( TRUCK-AT ?auto_2263939 ?auto_2263938 ) ( not ( = ?auto_2263938 ?auto_2263941 ) ) ( ON ?auto_2263933 ?auto_2263932 ) ( ON ?auto_2263934 ?auto_2263933 ) ( ON ?auto_2263931 ?auto_2263934 ) ( ON ?auto_2263935 ?auto_2263931 ) ( not ( = ?auto_2263932 ?auto_2263933 ) ) ( not ( = ?auto_2263932 ?auto_2263934 ) ) ( not ( = ?auto_2263932 ?auto_2263931 ) ) ( not ( = ?auto_2263932 ?auto_2263935 ) ) ( not ( = ?auto_2263932 ?auto_2263937 ) ) ( not ( = ?auto_2263932 ?auto_2263936 ) ) ( not ( = ?auto_2263933 ?auto_2263934 ) ) ( not ( = ?auto_2263933 ?auto_2263931 ) ) ( not ( = ?auto_2263933 ?auto_2263935 ) ) ( not ( = ?auto_2263933 ?auto_2263937 ) ) ( not ( = ?auto_2263933 ?auto_2263936 ) ) ( not ( = ?auto_2263934 ?auto_2263931 ) ) ( not ( = ?auto_2263934 ?auto_2263935 ) ) ( not ( = ?auto_2263934 ?auto_2263937 ) ) ( not ( = ?auto_2263934 ?auto_2263936 ) ) ( not ( = ?auto_2263931 ?auto_2263935 ) ) ( not ( = ?auto_2263931 ?auto_2263937 ) ) ( not ( = ?auto_2263931 ?auto_2263936 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2263935 ?auto_2263937 ?auto_2263936 )
      ( MAKE-6CRATE-VERIFY ?auto_2263932 ?auto_2263933 ?auto_2263934 ?auto_2263931 ?auto_2263935 ?auto_2263937 ?auto_2263936 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2263989 - SURFACE
      ?auto_2263990 - SURFACE
      ?auto_2263991 - SURFACE
      ?auto_2263988 - SURFACE
      ?auto_2263992 - SURFACE
      ?auto_2263994 - SURFACE
      ?auto_2263993 - SURFACE
    )
    :vars
    (
      ?auto_2263997 - HOIST
      ?auto_2263999 - PLACE
      ?auto_2263998 - TRUCK
      ?auto_2263996 - PLACE
      ?auto_2263995 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2263997 ?auto_2263999 ) ( SURFACE-AT ?auto_2263994 ?auto_2263999 ) ( CLEAR ?auto_2263994 ) ( IS-CRATE ?auto_2263993 ) ( not ( = ?auto_2263994 ?auto_2263993 ) ) ( AVAILABLE ?auto_2263997 ) ( ON ?auto_2263994 ?auto_2263992 ) ( not ( = ?auto_2263992 ?auto_2263994 ) ) ( not ( = ?auto_2263992 ?auto_2263993 ) ) ( TRUCK-AT ?auto_2263998 ?auto_2263996 ) ( not ( = ?auto_2263996 ?auto_2263999 ) ) ( HOIST-AT ?auto_2263995 ?auto_2263996 ) ( LIFTING ?auto_2263995 ?auto_2263993 ) ( not ( = ?auto_2263997 ?auto_2263995 ) ) ( ON ?auto_2263990 ?auto_2263989 ) ( ON ?auto_2263991 ?auto_2263990 ) ( ON ?auto_2263988 ?auto_2263991 ) ( ON ?auto_2263992 ?auto_2263988 ) ( not ( = ?auto_2263989 ?auto_2263990 ) ) ( not ( = ?auto_2263989 ?auto_2263991 ) ) ( not ( = ?auto_2263989 ?auto_2263988 ) ) ( not ( = ?auto_2263989 ?auto_2263992 ) ) ( not ( = ?auto_2263989 ?auto_2263994 ) ) ( not ( = ?auto_2263989 ?auto_2263993 ) ) ( not ( = ?auto_2263990 ?auto_2263991 ) ) ( not ( = ?auto_2263990 ?auto_2263988 ) ) ( not ( = ?auto_2263990 ?auto_2263992 ) ) ( not ( = ?auto_2263990 ?auto_2263994 ) ) ( not ( = ?auto_2263990 ?auto_2263993 ) ) ( not ( = ?auto_2263991 ?auto_2263988 ) ) ( not ( = ?auto_2263991 ?auto_2263992 ) ) ( not ( = ?auto_2263991 ?auto_2263994 ) ) ( not ( = ?auto_2263991 ?auto_2263993 ) ) ( not ( = ?auto_2263988 ?auto_2263992 ) ) ( not ( = ?auto_2263988 ?auto_2263994 ) ) ( not ( = ?auto_2263988 ?auto_2263993 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2263992 ?auto_2263994 ?auto_2263993 )
      ( MAKE-6CRATE-VERIFY ?auto_2263989 ?auto_2263990 ?auto_2263991 ?auto_2263988 ?auto_2263992 ?auto_2263994 ?auto_2263993 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2264052 - SURFACE
      ?auto_2264053 - SURFACE
      ?auto_2264054 - SURFACE
      ?auto_2264051 - SURFACE
      ?auto_2264055 - SURFACE
      ?auto_2264057 - SURFACE
      ?auto_2264056 - SURFACE
    )
    :vars
    (
      ?auto_2264060 - HOIST
      ?auto_2264062 - PLACE
      ?auto_2264058 - TRUCK
      ?auto_2264059 - PLACE
      ?auto_2264063 - HOIST
      ?auto_2264061 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2264060 ?auto_2264062 ) ( SURFACE-AT ?auto_2264057 ?auto_2264062 ) ( CLEAR ?auto_2264057 ) ( IS-CRATE ?auto_2264056 ) ( not ( = ?auto_2264057 ?auto_2264056 ) ) ( AVAILABLE ?auto_2264060 ) ( ON ?auto_2264057 ?auto_2264055 ) ( not ( = ?auto_2264055 ?auto_2264057 ) ) ( not ( = ?auto_2264055 ?auto_2264056 ) ) ( TRUCK-AT ?auto_2264058 ?auto_2264059 ) ( not ( = ?auto_2264059 ?auto_2264062 ) ) ( HOIST-AT ?auto_2264063 ?auto_2264059 ) ( not ( = ?auto_2264060 ?auto_2264063 ) ) ( AVAILABLE ?auto_2264063 ) ( SURFACE-AT ?auto_2264056 ?auto_2264059 ) ( ON ?auto_2264056 ?auto_2264061 ) ( CLEAR ?auto_2264056 ) ( not ( = ?auto_2264057 ?auto_2264061 ) ) ( not ( = ?auto_2264056 ?auto_2264061 ) ) ( not ( = ?auto_2264055 ?auto_2264061 ) ) ( ON ?auto_2264053 ?auto_2264052 ) ( ON ?auto_2264054 ?auto_2264053 ) ( ON ?auto_2264051 ?auto_2264054 ) ( ON ?auto_2264055 ?auto_2264051 ) ( not ( = ?auto_2264052 ?auto_2264053 ) ) ( not ( = ?auto_2264052 ?auto_2264054 ) ) ( not ( = ?auto_2264052 ?auto_2264051 ) ) ( not ( = ?auto_2264052 ?auto_2264055 ) ) ( not ( = ?auto_2264052 ?auto_2264057 ) ) ( not ( = ?auto_2264052 ?auto_2264056 ) ) ( not ( = ?auto_2264052 ?auto_2264061 ) ) ( not ( = ?auto_2264053 ?auto_2264054 ) ) ( not ( = ?auto_2264053 ?auto_2264051 ) ) ( not ( = ?auto_2264053 ?auto_2264055 ) ) ( not ( = ?auto_2264053 ?auto_2264057 ) ) ( not ( = ?auto_2264053 ?auto_2264056 ) ) ( not ( = ?auto_2264053 ?auto_2264061 ) ) ( not ( = ?auto_2264054 ?auto_2264051 ) ) ( not ( = ?auto_2264054 ?auto_2264055 ) ) ( not ( = ?auto_2264054 ?auto_2264057 ) ) ( not ( = ?auto_2264054 ?auto_2264056 ) ) ( not ( = ?auto_2264054 ?auto_2264061 ) ) ( not ( = ?auto_2264051 ?auto_2264055 ) ) ( not ( = ?auto_2264051 ?auto_2264057 ) ) ( not ( = ?auto_2264051 ?auto_2264056 ) ) ( not ( = ?auto_2264051 ?auto_2264061 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2264055 ?auto_2264057 ?auto_2264056 )
      ( MAKE-6CRATE-VERIFY ?auto_2264052 ?auto_2264053 ?auto_2264054 ?auto_2264051 ?auto_2264055 ?auto_2264057 ?auto_2264056 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2264116 - SURFACE
      ?auto_2264117 - SURFACE
      ?auto_2264118 - SURFACE
      ?auto_2264115 - SURFACE
      ?auto_2264119 - SURFACE
      ?auto_2264121 - SURFACE
      ?auto_2264120 - SURFACE
    )
    :vars
    (
      ?auto_2264122 - HOIST
      ?auto_2264123 - PLACE
      ?auto_2264125 - PLACE
      ?auto_2264124 - HOIST
      ?auto_2264126 - SURFACE
      ?auto_2264127 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2264122 ?auto_2264123 ) ( SURFACE-AT ?auto_2264121 ?auto_2264123 ) ( CLEAR ?auto_2264121 ) ( IS-CRATE ?auto_2264120 ) ( not ( = ?auto_2264121 ?auto_2264120 ) ) ( AVAILABLE ?auto_2264122 ) ( ON ?auto_2264121 ?auto_2264119 ) ( not ( = ?auto_2264119 ?auto_2264121 ) ) ( not ( = ?auto_2264119 ?auto_2264120 ) ) ( not ( = ?auto_2264125 ?auto_2264123 ) ) ( HOIST-AT ?auto_2264124 ?auto_2264125 ) ( not ( = ?auto_2264122 ?auto_2264124 ) ) ( AVAILABLE ?auto_2264124 ) ( SURFACE-AT ?auto_2264120 ?auto_2264125 ) ( ON ?auto_2264120 ?auto_2264126 ) ( CLEAR ?auto_2264120 ) ( not ( = ?auto_2264121 ?auto_2264126 ) ) ( not ( = ?auto_2264120 ?auto_2264126 ) ) ( not ( = ?auto_2264119 ?auto_2264126 ) ) ( TRUCK-AT ?auto_2264127 ?auto_2264123 ) ( ON ?auto_2264117 ?auto_2264116 ) ( ON ?auto_2264118 ?auto_2264117 ) ( ON ?auto_2264115 ?auto_2264118 ) ( ON ?auto_2264119 ?auto_2264115 ) ( not ( = ?auto_2264116 ?auto_2264117 ) ) ( not ( = ?auto_2264116 ?auto_2264118 ) ) ( not ( = ?auto_2264116 ?auto_2264115 ) ) ( not ( = ?auto_2264116 ?auto_2264119 ) ) ( not ( = ?auto_2264116 ?auto_2264121 ) ) ( not ( = ?auto_2264116 ?auto_2264120 ) ) ( not ( = ?auto_2264116 ?auto_2264126 ) ) ( not ( = ?auto_2264117 ?auto_2264118 ) ) ( not ( = ?auto_2264117 ?auto_2264115 ) ) ( not ( = ?auto_2264117 ?auto_2264119 ) ) ( not ( = ?auto_2264117 ?auto_2264121 ) ) ( not ( = ?auto_2264117 ?auto_2264120 ) ) ( not ( = ?auto_2264117 ?auto_2264126 ) ) ( not ( = ?auto_2264118 ?auto_2264115 ) ) ( not ( = ?auto_2264118 ?auto_2264119 ) ) ( not ( = ?auto_2264118 ?auto_2264121 ) ) ( not ( = ?auto_2264118 ?auto_2264120 ) ) ( not ( = ?auto_2264118 ?auto_2264126 ) ) ( not ( = ?auto_2264115 ?auto_2264119 ) ) ( not ( = ?auto_2264115 ?auto_2264121 ) ) ( not ( = ?auto_2264115 ?auto_2264120 ) ) ( not ( = ?auto_2264115 ?auto_2264126 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2264119 ?auto_2264121 ?auto_2264120 )
      ( MAKE-6CRATE-VERIFY ?auto_2264116 ?auto_2264117 ?auto_2264118 ?auto_2264115 ?auto_2264119 ?auto_2264121 ?auto_2264120 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2264180 - SURFACE
      ?auto_2264181 - SURFACE
      ?auto_2264182 - SURFACE
      ?auto_2264179 - SURFACE
      ?auto_2264183 - SURFACE
      ?auto_2264185 - SURFACE
      ?auto_2264184 - SURFACE
    )
    :vars
    (
      ?auto_2264189 - HOIST
      ?auto_2264191 - PLACE
      ?auto_2264186 - PLACE
      ?auto_2264190 - HOIST
      ?auto_2264187 - SURFACE
      ?auto_2264188 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2264189 ?auto_2264191 ) ( IS-CRATE ?auto_2264184 ) ( not ( = ?auto_2264185 ?auto_2264184 ) ) ( not ( = ?auto_2264183 ?auto_2264185 ) ) ( not ( = ?auto_2264183 ?auto_2264184 ) ) ( not ( = ?auto_2264186 ?auto_2264191 ) ) ( HOIST-AT ?auto_2264190 ?auto_2264186 ) ( not ( = ?auto_2264189 ?auto_2264190 ) ) ( AVAILABLE ?auto_2264190 ) ( SURFACE-AT ?auto_2264184 ?auto_2264186 ) ( ON ?auto_2264184 ?auto_2264187 ) ( CLEAR ?auto_2264184 ) ( not ( = ?auto_2264185 ?auto_2264187 ) ) ( not ( = ?auto_2264184 ?auto_2264187 ) ) ( not ( = ?auto_2264183 ?auto_2264187 ) ) ( TRUCK-AT ?auto_2264188 ?auto_2264191 ) ( SURFACE-AT ?auto_2264183 ?auto_2264191 ) ( CLEAR ?auto_2264183 ) ( LIFTING ?auto_2264189 ?auto_2264185 ) ( IS-CRATE ?auto_2264185 ) ( ON ?auto_2264181 ?auto_2264180 ) ( ON ?auto_2264182 ?auto_2264181 ) ( ON ?auto_2264179 ?auto_2264182 ) ( ON ?auto_2264183 ?auto_2264179 ) ( not ( = ?auto_2264180 ?auto_2264181 ) ) ( not ( = ?auto_2264180 ?auto_2264182 ) ) ( not ( = ?auto_2264180 ?auto_2264179 ) ) ( not ( = ?auto_2264180 ?auto_2264183 ) ) ( not ( = ?auto_2264180 ?auto_2264185 ) ) ( not ( = ?auto_2264180 ?auto_2264184 ) ) ( not ( = ?auto_2264180 ?auto_2264187 ) ) ( not ( = ?auto_2264181 ?auto_2264182 ) ) ( not ( = ?auto_2264181 ?auto_2264179 ) ) ( not ( = ?auto_2264181 ?auto_2264183 ) ) ( not ( = ?auto_2264181 ?auto_2264185 ) ) ( not ( = ?auto_2264181 ?auto_2264184 ) ) ( not ( = ?auto_2264181 ?auto_2264187 ) ) ( not ( = ?auto_2264182 ?auto_2264179 ) ) ( not ( = ?auto_2264182 ?auto_2264183 ) ) ( not ( = ?auto_2264182 ?auto_2264185 ) ) ( not ( = ?auto_2264182 ?auto_2264184 ) ) ( not ( = ?auto_2264182 ?auto_2264187 ) ) ( not ( = ?auto_2264179 ?auto_2264183 ) ) ( not ( = ?auto_2264179 ?auto_2264185 ) ) ( not ( = ?auto_2264179 ?auto_2264184 ) ) ( not ( = ?auto_2264179 ?auto_2264187 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2264183 ?auto_2264185 ?auto_2264184 )
      ( MAKE-6CRATE-VERIFY ?auto_2264180 ?auto_2264181 ?auto_2264182 ?auto_2264179 ?auto_2264183 ?auto_2264185 ?auto_2264184 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2264244 - SURFACE
      ?auto_2264245 - SURFACE
      ?auto_2264246 - SURFACE
      ?auto_2264243 - SURFACE
      ?auto_2264247 - SURFACE
      ?auto_2264249 - SURFACE
      ?auto_2264248 - SURFACE
    )
    :vars
    (
      ?auto_2264251 - HOIST
      ?auto_2264255 - PLACE
      ?auto_2264252 - PLACE
      ?auto_2264254 - HOIST
      ?auto_2264250 - SURFACE
      ?auto_2264253 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2264251 ?auto_2264255 ) ( IS-CRATE ?auto_2264248 ) ( not ( = ?auto_2264249 ?auto_2264248 ) ) ( not ( = ?auto_2264247 ?auto_2264249 ) ) ( not ( = ?auto_2264247 ?auto_2264248 ) ) ( not ( = ?auto_2264252 ?auto_2264255 ) ) ( HOIST-AT ?auto_2264254 ?auto_2264252 ) ( not ( = ?auto_2264251 ?auto_2264254 ) ) ( AVAILABLE ?auto_2264254 ) ( SURFACE-AT ?auto_2264248 ?auto_2264252 ) ( ON ?auto_2264248 ?auto_2264250 ) ( CLEAR ?auto_2264248 ) ( not ( = ?auto_2264249 ?auto_2264250 ) ) ( not ( = ?auto_2264248 ?auto_2264250 ) ) ( not ( = ?auto_2264247 ?auto_2264250 ) ) ( TRUCK-AT ?auto_2264253 ?auto_2264255 ) ( SURFACE-AT ?auto_2264247 ?auto_2264255 ) ( CLEAR ?auto_2264247 ) ( IS-CRATE ?auto_2264249 ) ( AVAILABLE ?auto_2264251 ) ( IN ?auto_2264249 ?auto_2264253 ) ( ON ?auto_2264245 ?auto_2264244 ) ( ON ?auto_2264246 ?auto_2264245 ) ( ON ?auto_2264243 ?auto_2264246 ) ( ON ?auto_2264247 ?auto_2264243 ) ( not ( = ?auto_2264244 ?auto_2264245 ) ) ( not ( = ?auto_2264244 ?auto_2264246 ) ) ( not ( = ?auto_2264244 ?auto_2264243 ) ) ( not ( = ?auto_2264244 ?auto_2264247 ) ) ( not ( = ?auto_2264244 ?auto_2264249 ) ) ( not ( = ?auto_2264244 ?auto_2264248 ) ) ( not ( = ?auto_2264244 ?auto_2264250 ) ) ( not ( = ?auto_2264245 ?auto_2264246 ) ) ( not ( = ?auto_2264245 ?auto_2264243 ) ) ( not ( = ?auto_2264245 ?auto_2264247 ) ) ( not ( = ?auto_2264245 ?auto_2264249 ) ) ( not ( = ?auto_2264245 ?auto_2264248 ) ) ( not ( = ?auto_2264245 ?auto_2264250 ) ) ( not ( = ?auto_2264246 ?auto_2264243 ) ) ( not ( = ?auto_2264246 ?auto_2264247 ) ) ( not ( = ?auto_2264246 ?auto_2264249 ) ) ( not ( = ?auto_2264246 ?auto_2264248 ) ) ( not ( = ?auto_2264246 ?auto_2264250 ) ) ( not ( = ?auto_2264243 ?auto_2264247 ) ) ( not ( = ?auto_2264243 ?auto_2264249 ) ) ( not ( = ?auto_2264243 ?auto_2264248 ) ) ( not ( = ?auto_2264243 ?auto_2264250 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2264247 ?auto_2264249 ?auto_2264248 )
      ( MAKE-6CRATE-VERIFY ?auto_2264244 ?auto_2264245 ?auto_2264246 ?auto_2264243 ?auto_2264247 ?auto_2264249 ?auto_2264248 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2265912 - SURFACE
      ?auto_2265913 - SURFACE
    )
    :vars
    (
      ?auto_2265916 - HOIST
      ?auto_2265919 - PLACE
      ?auto_2265914 - SURFACE
      ?auto_2265917 - PLACE
      ?auto_2265918 - HOIST
      ?auto_2265920 - SURFACE
      ?auto_2265915 - TRUCK
      ?auto_2265921 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2265916 ?auto_2265919 ) ( SURFACE-AT ?auto_2265912 ?auto_2265919 ) ( CLEAR ?auto_2265912 ) ( IS-CRATE ?auto_2265913 ) ( not ( = ?auto_2265912 ?auto_2265913 ) ) ( ON ?auto_2265912 ?auto_2265914 ) ( not ( = ?auto_2265914 ?auto_2265912 ) ) ( not ( = ?auto_2265914 ?auto_2265913 ) ) ( not ( = ?auto_2265917 ?auto_2265919 ) ) ( HOIST-AT ?auto_2265918 ?auto_2265917 ) ( not ( = ?auto_2265916 ?auto_2265918 ) ) ( AVAILABLE ?auto_2265918 ) ( SURFACE-AT ?auto_2265913 ?auto_2265917 ) ( ON ?auto_2265913 ?auto_2265920 ) ( CLEAR ?auto_2265913 ) ( not ( = ?auto_2265912 ?auto_2265920 ) ) ( not ( = ?auto_2265913 ?auto_2265920 ) ) ( not ( = ?auto_2265914 ?auto_2265920 ) ) ( TRUCK-AT ?auto_2265915 ?auto_2265919 ) ( LIFTING ?auto_2265916 ?auto_2265921 ) ( IS-CRATE ?auto_2265921 ) ( not ( = ?auto_2265912 ?auto_2265921 ) ) ( not ( = ?auto_2265913 ?auto_2265921 ) ) ( not ( = ?auto_2265914 ?auto_2265921 ) ) ( not ( = ?auto_2265920 ?auto_2265921 ) ) )
    :subtasks
    ( ( !LOAD ?auto_2265916 ?auto_2265921 ?auto_2265915 ?auto_2265919 )
      ( MAKE-1CRATE ?auto_2265912 ?auto_2265913 )
      ( MAKE-1CRATE-VERIFY ?auto_2265912 ?auto_2265913 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2266189 - SURFACE
      ?auto_2266190 - SURFACE
      ?auto_2266191 - SURFACE
      ?auto_2266188 - SURFACE
      ?auto_2266192 - SURFACE
      ?auto_2266194 - SURFACE
      ?auto_2266193 - SURFACE
      ?auto_2266195 - SURFACE
    )
    :vars
    (
      ?auto_2266197 - HOIST
      ?auto_2266196 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2266197 ?auto_2266196 ) ( SURFACE-AT ?auto_2266193 ?auto_2266196 ) ( CLEAR ?auto_2266193 ) ( LIFTING ?auto_2266197 ?auto_2266195 ) ( IS-CRATE ?auto_2266195 ) ( not ( = ?auto_2266193 ?auto_2266195 ) ) ( ON ?auto_2266190 ?auto_2266189 ) ( ON ?auto_2266191 ?auto_2266190 ) ( ON ?auto_2266188 ?auto_2266191 ) ( ON ?auto_2266192 ?auto_2266188 ) ( ON ?auto_2266194 ?auto_2266192 ) ( ON ?auto_2266193 ?auto_2266194 ) ( not ( = ?auto_2266189 ?auto_2266190 ) ) ( not ( = ?auto_2266189 ?auto_2266191 ) ) ( not ( = ?auto_2266189 ?auto_2266188 ) ) ( not ( = ?auto_2266189 ?auto_2266192 ) ) ( not ( = ?auto_2266189 ?auto_2266194 ) ) ( not ( = ?auto_2266189 ?auto_2266193 ) ) ( not ( = ?auto_2266189 ?auto_2266195 ) ) ( not ( = ?auto_2266190 ?auto_2266191 ) ) ( not ( = ?auto_2266190 ?auto_2266188 ) ) ( not ( = ?auto_2266190 ?auto_2266192 ) ) ( not ( = ?auto_2266190 ?auto_2266194 ) ) ( not ( = ?auto_2266190 ?auto_2266193 ) ) ( not ( = ?auto_2266190 ?auto_2266195 ) ) ( not ( = ?auto_2266191 ?auto_2266188 ) ) ( not ( = ?auto_2266191 ?auto_2266192 ) ) ( not ( = ?auto_2266191 ?auto_2266194 ) ) ( not ( = ?auto_2266191 ?auto_2266193 ) ) ( not ( = ?auto_2266191 ?auto_2266195 ) ) ( not ( = ?auto_2266188 ?auto_2266192 ) ) ( not ( = ?auto_2266188 ?auto_2266194 ) ) ( not ( = ?auto_2266188 ?auto_2266193 ) ) ( not ( = ?auto_2266188 ?auto_2266195 ) ) ( not ( = ?auto_2266192 ?auto_2266194 ) ) ( not ( = ?auto_2266192 ?auto_2266193 ) ) ( not ( = ?auto_2266192 ?auto_2266195 ) ) ( not ( = ?auto_2266194 ?auto_2266193 ) ) ( not ( = ?auto_2266194 ?auto_2266195 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2266193 ?auto_2266195 )
      ( MAKE-7CRATE-VERIFY ?auto_2266189 ?auto_2266190 ?auto_2266191 ?auto_2266188 ?auto_2266192 ?auto_2266194 ?auto_2266193 ?auto_2266195 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2266244 - SURFACE
      ?auto_2266245 - SURFACE
      ?auto_2266246 - SURFACE
      ?auto_2266243 - SURFACE
      ?auto_2266247 - SURFACE
      ?auto_2266249 - SURFACE
      ?auto_2266248 - SURFACE
      ?auto_2266250 - SURFACE
    )
    :vars
    (
      ?auto_2266252 - HOIST
      ?auto_2266251 - PLACE
      ?auto_2266253 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2266252 ?auto_2266251 ) ( SURFACE-AT ?auto_2266248 ?auto_2266251 ) ( CLEAR ?auto_2266248 ) ( IS-CRATE ?auto_2266250 ) ( not ( = ?auto_2266248 ?auto_2266250 ) ) ( TRUCK-AT ?auto_2266253 ?auto_2266251 ) ( AVAILABLE ?auto_2266252 ) ( IN ?auto_2266250 ?auto_2266253 ) ( ON ?auto_2266248 ?auto_2266249 ) ( not ( = ?auto_2266249 ?auto_2266248 ) ) ( not ( = ?auto_2266249 ?auto_2266250 ) ) ( ON ?auto_2266245 ?auto_2266244 ) ( ON ?auto_2266246 ?auto_2266245 ) ( ON ?auto_2266243 ?auto_2266246 ) ( ON ?auto_2266247 ?auto_2266243 ) ( ON ?auto_2266249 ?auto_2266247 ) ( not ( = ?auto_2266244 ?auto_2266245 ) ) ( not ( = ?auto_2266244 ?auto_2266246 ) ) ( not ( = ?auto_2266244 ?auto_2266243 ) ) ( not ( = ?auto_2266244 ?auto_2266247 ) ) ( not ( = ?auto_2266244 ?auto_2266249 ) ) ( not ( = ?auto_2266244 ?auto_2266248 ) ) ( not ( = ?auto_2266244 ?auto_2266250 ) ) ( not ( = ?auto_2266245 ?auto_2266246 ) ) ( not ( = ?auto_2266245 ?auto_2266243 ) ) ( not ( = ?auto_2266245 ?auto_2266247 ) ) ( not ( = ?auto_2266245 ?auto_2266249 ) ) ( not ( = ?auto_2266245 ?auto_2266248 ) ) ( not ( = ?auto_2266245 ?auto_2266250 ) ) ( not ( = ?auto_2266246 ?auto_2266243 ) ) ( not ( = ?auto_2266246 ?auto_2266247 ) ) ( not ( = ?auto_2266246 ?auto_2266249 ) ) ( not ( = ?auto_2266246 ?auto_2266248 ) ) ( not ( = ?auto_2266246 ?auto_2266250 ) ) ( not ( = ?auto_2266243 ?auto_2266247 ) ) ( not ( = ?auto_2266243 ?auto_2266249 ) ) ( not ( = ?auto_2266243 ?auto_2266248 ) ) ( not ( = ?auto_2266243 ?auto_2266250 ) ) ( not ( = ?auto_2266247 ?auto_2266249 ) ) ( not ( = ?auto_2266247 ?auto_2266248 ) ) ( not ( = ?auto_2266247 ?auto_2266250 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2266249 ?auto_2266248 ?auto_2266250 )
      ( MAKE-7CRATE-VERIFY ?auto_2266244 ?auto_2266245 ?auto_2266246 ?auto_2266243 ?auto_2266247 ?auto_2266249 ?auto_2266248 ?auto_2266250 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2266307 - SURFACE
      ?auto_2266308 - SURFACE
      ?auto_2266309 - SURFACE
      ?auto_2266306 - SURFACE
      ?auto_2266310 - SURFACE
      ?auto_2266312 - SURFACE
      ?auto_2266311 - SURFACE
      ?auto_2266313 - SURFACE
    )
    :vars
    (
      ?auto_2266315 - HOIST
      ?auto_2266314 - PLACE
      ?auto_2266316 - TRUCK
      ?auto_2266317 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2266315 ?auto_2266314 ) ( SURFACE-AT ?auto_2266311 ?auto_2266314 ) ( CLEAR ?auto_2266311 ) ( IS-CRATE ?auto_2266313 ) ( not ( = ?auto_2266311 ?auto_2266313 ) ) ( AVAILABLE ?auto_2266315 ) ( IN ?auto_2266313 ?auto_2266316 ) ( ON ?auto_2266311 ?auto_2266312 ) ( not ( = ?auto_2266312 ?auto_2266311 ) ) ( not ( = ?auto_2266312 ?auto_2266313 ) ) ( TRUCK-AT ?auto_2266316 ?auto_2266317 ) ( not ( = ?auto_2266317 ?auto_2266314 ) ) ( ON ?auto_2266308 ?auto_2266307 ) ( ON ?auto_2266309 ?auto_2266308 ) ( ON ?auto_2266306 ?auto_2266309 ) ( ON ?auto_2266310 ?auto_2266306 ) ( ON ?auto_2266312 ?auto_2266310 ) ( not ( = ?auto_2266307 ?auto_2266308 ) ) ( not ( = ?auto_2266307 ?auto_2266309 ) ) ( not ( = ?auto_2266307 ?auto_2266306 ) ) ( not ( = ?auto_2266307 ?auto_2266310 ) ) ( not ( = ?auto_2266307 ?auto_2266312 ) ) ( not ( = ?auto_2266307 ?auto_2266311 ) ) ( not ( = ?auto_2266307 ?auto_2266313 ) ) ( not ( = ?auto_2266308 ?auto_2266309 ) ) ( not ( = ?auto_2266308 ?auto_2266306 ) ) ( not ( = ?auto_2266308 ?auto_2266310 ) ) ( not ( = ?auto_2266308 ?auto_2266312 ) ) ( not ( = ?auto_2266308 ?auto_2266311 ) ) ( not ( = ?auto_2266308 ?auto_2266313 ) ) ( not ( = ?auto_2266309 ?auto_2266306 ) ) ( not ( = ?auto_2266309 ?auto_2266310 ) ) ( not ( = ?auto_2266309 ?auto_2266312 ) ) ( not ( = ?auto_2266309 ?auto_2266311 ) ) ( not ( = ?auto_2266309 ?auto_2266313 ) ) ( not ( = ?auto_2266306 ?auto_2266310 ) ) ( not ( = ?auto_2266306 ?auto_2266312 ) ) ( not ( = ?auto_2266306 ?auto_2266311 ) ) ( not ( = ?auto_2266306 ?auto_2266313 ) ) ( not ( = ?auto_2266310 ?auto_2266312 ) ) ( not ( = ?auto_2266310 ?auto_2266311 ) ) ( not ( = ?auto_2266310 ?auto_2266313 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2266312 ?auto_2266311 ?auto_2266313 )
      ( MAKE-7CRATE-VERIFY ?auto_2266307 ?auto_2266308 ?auto_2266309 ?auto_2266306 ?auto_2266310 ?auto_2266312 ?auto_2266311 ?auto_2266313 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2266377 - SURFACE
      ?auto_2266378 - SURFACE
      ?auto_2266379 - SURFACE
      ?auto_2266376 - SURFACE
      ?auto_2266380 - SURFACE
      ?auto_2266382 - SURFACE
      ?auto_2266381 - SURFACE
      ?auto_2266383 - SURFACE
    )
    :vars
    (
      ?auto_2266387 - HOIST
      ?auto_2266388 - PLACE
      ?auto_2266384 - TRUCK
      ?auto_2266385 - PLACE
      ?auto_2266386 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2266387 ?auto_2266388 ) ( SURFACE-AT ?auto_2266381 ?auto_2266388 ) ( CLEAR ?auto_2266381 ) ( IS-CRATE ?auto_2266383 ) ( not ( = ?auto_2266381 ?auto_2266383 ) ) ( AVAILABLE ?auto_2266387 ) ( ON ?auto_2266381 ?auto_2266382 ) ( not ( = ?auto_2266382 ?auto_2266381 ) ) ( not ( = ?auto_2266382 ?auto_2266383 ) ) ( TRUCK-AT ?auto_2266384 ?auto_2266385 ) ( not ( = ?auto_2266385 ?auto_2266388 ) ) ( HOIST-AT ?auto_2266386 ?auto_2266385 ) ( LIFTING ?auto_2266386 ?auto_2266383 ) ( not ( = ?auto_2266387 ?auto_2266386 ) ) ( ON ?auto_2266378 ?auto_2266377 ) ( ON ?auto_2266379 ?auto_2266378 ) ( ON ?auto_2266376 ?auto_2266379 ) ( ON ?auto_2266380 ?auto_2266376 ) ( ON ?auto_2266382 ?auto_2266380 ) ( not ( = ?auto_2266377 ?auto_2266378 ) ) ( not ( = ?auto_2266377 ?auto_2266379 ) ) ( not ( = ?auto_2266377 ?auto_2266376 ) ) ( not ( = ?auto_2266377 ?auto_2266380 ) ) ( not ( = ?auto_2266377 ?auto_2266382 ) ) ( not ( = ?auto_2266377 ?auto_2266381 ) ) ( not ( = ?auto_2266377 ?auto_2266383 ) ) ( not ( = ?auto_2266378 ?auto_2266379 ) ) ( not ( = ?auto_2266378 ?auto_2266376 ) ) ( not ( = ?auto_2266378 ?auto_2266380 ) ) ( not ( = ?auto_2266378 ?auto_2266382 ) ) ( not ( = ?auto_2266378 ?auto_2266381 ) ) ( not ( = ?auto_2266378 ?auto_2266383 ) ) ( not ( = ?auto_2266379 ?auto_2266376 ) ) ( not ( = ?auto_2266379 ?auto_2266380 ) ) ( not ( = ?auto_2266379 ?auto_2266382 ) ) ( not ( = ?auto_2266379 ?auto_2266381 ) ) ( not ( = ?auto_2266379 ?auto_2266383 ) ) ( not ( = ?auto_2266376 ?auto_2266380 ) ) ( not ( = ?auto_2266376 ?auto_2266382 ) ) ( not ( = ?auto_2266376 ?auto_2266381 ) ) ( not ( = ?auto_2266376 ?auto_2266383 ) ) ( not ( = ?auto_2266380 ?auto_2266382 ) ) ( not ( = ?auto_2266380 ?auto_2266381 ) ) ( not ( = ?auto_2266380 ?auto_2266383 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2266382 ?auto_2266381 ?auto_2266383 )
      ( MAKE-7CRATE-VERIFY ?auto_2266377 ?auto_2266378 ?auto_2266379 ?auto_2266376 ?auto_2266380 ?auto_2266382 ?auto_2266381 ?auto_2266383 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2266454 - SURFACE
      ?auto_2266455 - SURFACE
      ?auto_2266456 - SURFACE
      ?auto_2266453 - SURFACE
      ?auto_2266457 - SURFACE
      ?auto_2266459 - SURFACE
      ?auto_2266458 - SURFACE
      ?auto_2266460 - SURFACE
    )
    :vars
    (
      ?auto_2266463 - HOIST
      ?auto_2266466 - PLACE
      ?auto_2266461 - TRUCK
      ?auto_2266462 - PLACE
      ?auto_2266464 - HOIST
      ?auto_2266465 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2266463 ?auto_2266466 ) ( SURFACE-AT ?auto_2266458 ?auto_2266466 ) ( CLEAR ?auto_2266458 ) ( IS-CRATE ?auto_2266460 ) ( not ( = ?auto_2266458 ?auto_2266460 ) ) ( AVAILABLE ?auto_2266463 ) ( ON ?auto_2266458 ?auto_2266459 ) ( not ( = ?auto_2266459 ?auto_2266458 ) ) ( not ( = ?auto_2266459 ?auto_2266460 ) ) ( TRUCK-AT ?auto_2266461 ?auto_2266462 ) ( not ( = ?auto_2266462 ?auto_2266466 ) ) ( HOIST-AT ?auto_2266464 ?auto_2266462 ) ( not ( = ?auto_2266463 ?auto_2266464 ) ) ( AVAILABLE ?auto_2266464 ) ( SURFACE-AT ?auto_2266460 ?auto_2266462 ) ( ON ?auto_2266460 ?auto_2266465 ) ( CLEAR ?auto_2266460 ) ( not ( = ?auto_2266458 ?auto_2266465 ) ) ( not ( = ?auto_2266460 ?auto_2266465 ) ) ( not ( = ?auto_2266459 ?auto_2266465 ) ) ( ON ?auto_2266455 ?auto_2266454 ) ( ON ?auto_2266456 ?auto_2266455 ) ( ON ?auto_2266453 ?auto_2266456 ) ( ON ?auto_2266457 ?auto_2266453 ) ( ON ?auto_2266459 ?auto_2266457 ) ( not ( = ?auto_2266454 ?auto_2266455 ) ) ( not ( = ?auto_2266454 ?auto_2266456 ) ) ( not ( = ?auto_2266454 ?auto_2266453 ) ) ( not ( = ?auto_2266454 ?auto_2266457 ) ) ( not ( = ?auto_2266454 ?auto_2266459 ) ) ( not ( = ?auto_2266454 ?auto_2266458 ) ) ( not ( = ?auto_2266454 ?auto_2266460 ) ) ( not ( = ?auto_2266454 ?auto_2266465 ) ) ( not ( = ?auto_2266455 ?auto_2266456 ) ) ( not ( = ?auto_2266455 ?auto_2266453 ) ) ( not ( = ?auto_2266455 ?auto_2266457 ) ) ( not ( = ?auto_2266455 ?auto_2266459 ) ) ( not ( = ?auto_2266455 ?auto_2266458 ) ) ( not ( = ?auto_2266455 ?auto_2266460 ) ) ( not ( = ?auto_2266455 ?auto_2266465 ) ) ( not ( = ?auto_2266456 ?auto_2266453 ) ) ( not ( = ?auto_2266456 ?auto_2266457 ) ) ( not ( = ?auto_2266456 ?auto_2266459 ) ) ( not ( = ?auto_2266456 ?auto_2266458 ) ) ( not ( = ?auto_2266456 ?auto_2266460 ) ) ( not ( = ?auto_2266456 ?auto_2266465 ) ) ( not ( = ?auto_2266453 ?auto_2266457 ) ) ( not ( = ?auto_2266453 ?auto_2266459 ) ) ( not ( = ?auto_2266453 ?auto_2266458 ) ) ( not ( = ?auto_2266453 ?auto_2266460 ) ) ( not ( = ?auto_2266453 ?auto_2266465 ) ) ( not ( = ?auto_2266457 ?auto_2266459 ) ) ( not ( = ?auto_2266457 ?auto_2266458 ) ) ( not ( = ?auto_2266457 ?auto_2266460 ) ) ( not ( = ?auto_2266457 ?auto_2266465 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2266459 ?auto_2266458 ?auto_2266460 )
      ( MAKE-7CRATE-VERIFY ?auto_2266454 ?auto_2266455 ?auto_2266456 ?auto_2266453 ?auto_2266457 ?auto_2266459 ?auto_2266458 ?auto_2266460 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2266532 - SURFACE
      ?auto_2266533 - SURFACE
      ?auto_2266534 - SURFACE
      ?auto_2266531 - SURFACE
      ?auto_2266535 - SURFACE
      ?auto_2266537 - SURFACE
      ?auto_2266536 - SURFACE
      ?auto_2266538 - SURFACE
    )
    :vars
    (
      ?auto_2266541 - HOIST
      ?auto_2266544 - PLACE
      ?auto_2266540 - PLACE
      ?auto_2266542 - HOIST
      ?auto_2266543 - SURFACE
      ?auto_2266539 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2266541 ?auto_2266544 ) ( SURFACE-AT ?auto_2266536 ?auto_2266544 ) ( CLEAR ?auto_2266536 ) ( IS-CRATE ?auto_2266538 ) ( not ( = ?auto_2266536 ?auto_2266538 ) ) ( AVAILABLE ?auto_2266541 ) ( ON ?auto_2266536 ?auto_2266537 ) ( not ( = ?auto_2266537 ?auto_2266536 ) ) ( not ( = ?auto_2266537 ?auto_2266538 ) ) ( not ( = ?auto_2266540 ?auto_2266544 ) ) ( HOIST-AT ?auto_2266542 ?auto_2266540 ) ( not ( = ?auto_2266541 ?auto_2266542 ) ) ( AVAILABLE ?auto_2266542 ) ( SURFACE-AT ?auto_2266538 ?auto_2266540 ) ( ON ?auto_2266538 ?auto_2266543 ) ( CLEAR ?auto_2266538 ) ( not ( = ?auto_2266536 ?auto_2266543 ) ) ( not ( = ?auto_2266538 ?auto_2266543 ) ) ( not ( = ?auto_2266537 ?auto_2266543 ) ) ( TRUCK-AT ?auto_2266539 ?auto_2266544 ) ( ON ?auto_2266533 ?auto_2266532 ) ( ON ?auto_2266534 ?auto_2266533 ) ( ON ?auto_2266531 ?auto_2266534 ) ( ON ?auto_2266535 ?auto_2266531 ) ( ON ?auto_2266537 ?auto_2266535 ) ( not ( = ?auto_2266532 ?auto_2266533 ) ) ( not ( = ?auto_2266532 ?auto_2266534 ) ) ( not ( = ?auto_2266532 ?auto_2266531 ) ) ( not ( = ?auto_2266532 ?auto_2266535 ) ) ( not ( = ?auto_2266532 ?auto_2266537 ) ) ( not ( = ?auto_2266532 ?auto_2266536 ) ) ( not ( = ?auto_2266532 ?auto_2266538 ) ) ( not ( = ?auto_2266532 ?auto_2266543 ) ) ( not ( = ?auto_2266533 ?auto_2266534 ) ) ( not ( = ?auto_2266533 ?auto_2266531 ) ) ( not ( = ?auto_2266533 ?auto_2266535 ) ) ( not ( = ?auto_2266533 ?auto_2266537 ) ) ( not ( = ?auto_2266533 ?auto_2266536 ) ) ( not ( = ?auto_2266533 ?auto_2266538 ) ) ( not ( = ?auto_2266533 ?auto_2266543 ) ) ( not ( = ?auto_2266534 ?auto_2266531 ) ) ( not ( = ?auto_2266534 ?auto_2266535 ) ) ( not ( = ?auto_2266534 ?auto_2266537 ) ) ( not ( = ?auto_2266534 ?auto_2266536 ) ) ( not ( = ?auto_2266534 ?auto_2266538 ) ) ( not ( = ?auto_2266534 ?auto_2266543 ) ) ( not ( = ?auto_2266531 ?auto_2266535 ) ) ( not ( = ?auto_2266531 ?auto_2266537 ) ) ( not ( = ?auto_2266531 ?auto_2266536 ) ) ( not ( = ?auto_2266531 ?auto_2266538 ) ) ( not ( = ?auto_2266531 ?auto_2266543 ) ) ( not ( = ?auto_2266535 ?auto_2266537 ) ) ( not ( = ?auto_2266535 ?auto_2266536 ) ) ( not ( = ?auto_2266535 ?auto_2266538 ) ) ( not ( = ?auto_2266535 ?auto_2266543 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2266537 ?auto_2266536 ?auto_2266538 )
      ( MAKE-7CRATE-VERIFY ?auto_2266532 ?auto_2266533 ?auto_2266534 ?auto_2266531 ?auto_2266535 ?auto_2266537 ?auto_2266536 ?auto_2266538 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2266610 - SURFACE
      ?auto_2266611 - SURFACE
      ?auto_2266612 - SURFACE
      ?auto_2266609 - SURFACE
      ?auto_2266613 - SURFACE
      ?auto_2266615 - SURFACE
      ?auto_2266614 - SURFACE
      ?auto_2266616 - SURFACE
    )
    :vars
    (
      ?auto_2266619 - HOIST
      ?auto_2266621 - PLACE
      ?auto_2266620 - PLACE
      ?auto_2266617 - HOIST
      ?auto_2266618 - SURFACE
      ?auto_2266622 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2266619 ?auto_2266621 ) ( IS-CRATE ?auto_2266616 ) ( not ( = ?auto_2266614 ?auto_2266616 ) ) ( not ( = ?auto_2266615 ?auto_2266614 ) ) ( not ( = ?auto_2266615 ?auto_2266616 ) ) ( not ( = ?auto_2266620 ?auto_2266621 ) ) ( HOIST-AT ?auto_2266617 ?auto_2266620 ) ( not ( = ?auto_2266619 ?auto_2266617 ) ) ( AVAILABLE ?auto_2266617 ) ( SURFACE-AT ?auto_2266616 ?auto_2266620 ) ( ON ?auto_2266616 ?auto_2266618 ) ( CLEAR ?auto_2266616 ) ( not ( = ?auto_2266614 ?auto_2266618 ) ) ( not ( = ?auto_2266616 ?auto_2266618 ) ) ( not ( = ?auto_2266615 ?auto_2266618 ) ) ( TRUCK-AT ?auto_2266622 ?auto_2266621 ) ( SURFACE-AT ?auto_2266615 ?auto_2266621 ) ( CLEAR ?auto_2266615 ) ( LIFTING ?auto_2266619 ?auto_2266614 ) ( IS-CRATE ?auto_2266614 ) ( ON ?auto_2266611 ?auto_2266610 ) ( ON ?auto_2266612 ?auto_2266611 ) ( ON ?auto_2266609 ?auto_2266612 ) ( ON ?auto_2266613 ?auto_2266609 ) ( ON ?auto_2266615 ?auto_2266613 ) ( not ( = ?auto_2266610 ?auto_2266611 ) ) ( not ( = ?auto_2266610 ?auto_2266612 ) ) ( not ( = ?auto_2266610 ?auto_2266609 ) ) ( not ( = ?auto_2266610 ?auto_2266613 ) ) ( not ( = ?auto_2266610 ?auto_2266615 ) ) ( not ( = ?auto_2266610 ?auto_2266614 ) ) ( not ( = ?auto_2266610 ?auto_2266616 ) ) ( not ( = ?auto_2266610 ?auto_2266618 ) ) ( not ( = ?auto_2266611 ?auto_2266612 ) ) ( not ( = ?auto_2266611 ?auto_2266609 ) ) ( not ( = ?auto_2266611 ?auto_2266613 ) ) ( not ( = ?auto_2266611 ?auto_2266615 ) ) ( not ( = ?auto_2266611 ?auto_2266614 ) ) ( not ( = ?auto_2266611 ?auto_2266616 ) ) ( not ( = ?auto_2266611 ?auto_2266618 ) ) ( not ( = ?auto_2266612 ?auto_2266609 ) ) ( not ( = ?auto_2266612 ?auto_2266613 ) ) ( not ( = ?auto_2266612 ?auto_2266615 ) ) ( not ( = ?auto_2266612 ?auto_2266614 ) ) ( not ( = ?auto_2266612 ?auto_2266616 ) ) ( not ( = ?auto_2266612 ?auto_2266618 ) ) ( not ( = ?auto_2266609 ?auto_2266613 ) ) ( not ( = ?auto_2266609 ?auto_2266615 ) ) ( not ( = ?auto_2266609 ?auto_2266614 ) ) ( not ( = ?auto_2266609 ?auto_2266616 ) ) ( not ( = ?auto_2266609 ?auto_2266618 ) ) ( not ( = ?auto_2266613 ?auto_2266615 ) ) ( not ( = ?auto_2266613 ?auto_2266614 ) ) ( not ( = ?auto_2266613 ?auto_2266616 ) ) ( not ( = ?auto_2266613 ?auto_2266618 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2266615 ?auto_2266614 ?auto_2266616 )
      ( MAKE-7CRATE-VERIFY ?auto_2266610 ?auto_2266611 ?auto_2266612 ?auto_2266609 ?auto_2266613 ?auto_2266615 ?auto_2266614 ?auto_2266616 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2266688 - SURFACE
      ?auto_2266689 - SURFACE
      ?auto_2266690 - SURFACE
      ?auto_2266687 - SURFACE
      ?auto_2266691 - SURFACE
      ?auto_2266693 - SURFACE
      ?auto_2266692 - SURFACE
      ?auto_2266694 - SURFACE
    )
    :vars
    (
      ?auto_2266700 - HOIST
      ?auto_2266696 - PLACE
      ?auto_2266697 - PLACE
      ?auto_2266695 - HOIST
      ?auto_2266698 - SURFACE
      ?auto_2266699 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2266700 ?auto_2266696 ) ( IS-CRATE ?auto_2266694 ) ( not ( = ?auto_2266692 ?auto_2266694 ) ) ( not ( = ?auto_2266693 ?auto_2266692 ) ) ( not ( = ?auto_2266693 ?auto_2266694 ) ) ( not ( = ?auto_2266697 ?auto_2266696 ) ) ( HOIST-AT ?auto_2266695 ?auto_2266697 ) ( not ( = ?auto_2266700 ?auto_2266695 ) ) ( AVAILABLE ?auto_2266695 ) ( SURFACE-AT ?auto_2266694 ?auto_2266697 ) ( ON ?auto_2266694 ?auto_2266698 ) ( CLEAR ?auto_2266694 ) ( not ( = ?auto_2266692 ?auto_2266698 ) ) ( not ( = ?auto_2266694 ?auto_2266698 ) ) ( not ( = ?auto_2266693 ?auto_2266698 ) ) ( TRUCK-AT ?auto_2266699 ?auto_2266696 ) ( SURFACE-AT ?auto_2266693 ?auto_2266696 ) ( CLEAR ?auto_2266693 ) ( IS-CRATE ?auto_2266692 ) ( AVAILABLE ?auto_2266700 ) ( IN ?auto_2266692 ?auto_2266699 ) ( ON ?auto_2266689 ?auto_2266688 ) ( ON ?auto_2266690 ?auto_2266689 ) ( ON ?auto_2266687 ?auto_2266690 ) ( ON ?auto_2266691 ?auto_2266687 ) ( ON ?auto_2266693 ?auto_2266691 ) ( not ( = ?auto_2266688 ?auto_2266689 ) ) ( not ( = ?auto_2266688 ?auto_2266690 ) ) ( not ( = ?auto_2266688 ?auto_2266687 ) ) ( not ( = ?auto_2266688 ?auto_2266691 ) ) ( not ( = ?auto_2266688 ?auto_2266693 ) ) ( not ( = ?auto_2266688 ?auto_2266692 ) ) ( not ( = ?auto_2266688 ?auto_2266694 ) ) ( not ( = ?auto_2266688 ?auto_2266698 ) ) ( not ( = ?auto_2266689 ?auto_2266690 ) ) ( not ( = ?auto_2266689 ?auto_2266687 ) ) ( not ( = ?auto_2266689 ?auto_2266691 ) ) ( not ( = ?auto_2266689 ?auto_2266693 ) ) ( not ( = ?auto_2266689 ?auto_2266692 ) ) ( not ( = ?auto_2266689 ?auto_2266694 ) ) ( not ( = ?auto_2266689 ?auto_2266698 ) ) ( not ( = ?auto_2266690 ?auto_2266687 ) ) ( not ( = ?auto_2266690 ?auto_2266691 ) ) ( not ( = ?auto_2266690 ?auto_2266693 ) ) ( not ( = ?auto_2266690 ?auto_2266692 ) ) ( not ( = ?auto_2266690 ?auto_2266694 ) ) ( not ( = ?auto_2266690 ?auto_2266698 ) ) ( not ( = ?auto_2266687 ?auto_2266691 ) ) ( not ( = ?auto_2266687 ?auto_2266693 ) ) ( not ( = ?auto_2266687 ?auto_2266692 ) ) ( not ( = ?auto_2266687 ?auto_2266694 ) ) ( not ( = ?auto_2266687 ?auto_2266698 ) ) ( not ( = ?auto_2266691 ?auto_2266693 ) ) ( not ( = ?auto_2266691 ?auto_2266692 ) ) ( not ( = ?auto_2266691 ?auto_2266694 ) ) ( not ( = ?auto_2266691 ?auto_2266698 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2266693 ?auto_2266692 ?auto_2266694 )
      ( MAKE-7CRATE-VERIFY ?auto_2266688 ?auto_2266689 ?auto_2266690 ?auto_2266687 ?auto_2266691 ?auto_2266693 ?auto_2266692 ?auto_2266694 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2269582 - SURFACE
      ?auto_2269583 - SURFACE
      ?auto_2269584 - SURFACE
      ?auto_2269581 - SURFACE
      ?auto_2269585 - SURFACE
      ?auto_2269587 - SURFACE
      ?auto_2269586 - SURFACE
      ?auto_2269588 - SURFACE
      ?auto_2269589 - SURFACE
    )
    :vars
    (
      ?auto_2269590 - HOIST
      ?auto_2269591 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2269590 ?auto_2269591 ) ( SURFACE-AT ?auto_2269588 ?auto_2269591 ) ( CLEAR ?auto_2269588 ) ( LIFTING ?auto_2269590 ?auto_2269589 ) ( IS-CRATE ?auto_2269589 ) ( not ( = ?auto_2269588 ?auto_2269589 ) ) ( ON ?auto_2269583 ?auto_2269582 ) ( ON ?auto_2269584 ?auto_2269583 ) ( ON ?auto_2269581 ?auto_2269584 ) ( ON ?auto_2269585 ?auto_2269581 ) ( ON ?auto_2269587 ?auto_2269585 ) ( ON ?auto_2269586 ?auto_2269587 ) ( ON ?auto_2269588 ?auto_2269586 ) ( not ( = ?auto_2269582 ?auto_2269583 ) ) ( not ( = ?auto_2269582 ?auto_2269584 ) ) ( not ( = ?auto_2269582 ?auto_2269581 ) ) ( not ( = ?auto_2269582 ?auto_2269585 ) ) ( not ( = ?auto_2269582 ?auto_2269587 ) ) ( not ( = ?auto_2269582 ?auto_2269586 ) ) ( not ( = ?auto_2269582 ?auto_2269588 ) ) ( not ( = ?auto_2269582 ?auto_2269589 ) ) ( not ( = ?auto_2269583 ?auto_2269584 ) ) ( not ( = ?auto_2269583 ?auto_2269581 ) ) ( not ( = ?auto_2269583 ?auto_2269585 ) ) ( not ( = ?auto_2269583 ?auto_2269587 ) ) ( not ( = ?auto_2269583 ?auto_2269586 ) ) ( not ( = ?auto_2269583 ?auto_2269588 ) ) ( not ( = ?auto_2269583 ?auto_2269589 ) ) ( not ( = ?auto_2269584 ?auto_2269581 ) ) ( not ( = ?auto_2269584 ?auto_2269585 ) ) ( not ( = ?auto_2269584 ?auto_2269587 ) ) ( not ( = ?auto_2269584 ?auto_2269586 ) ) ( not ( = ?auto_2269584 ?auto_2269588 ) ) ( not ( = ?auto_2269584 ?auto_2269589 ) ) ( not ( = ?auto_2269581 ?auto_2269585 ) ) ( not ( = ?auto_2269581 ?auto_2269587 ) ) ( not ( = ?auto_2269581 ?auto_2269586 ) ) ( not ( = ?auto_2269581 ?auto_2269588 ) ) ( not ( = ?auto_2269581 ?auto_2269589 ) ) ( not ( = ?auto_2269585 ?auto_2269587 ) ) ( not ( = ?auto_2269585 ?auto_2269586 ) ) ( not ( = ?auto_2269585 ?auto_2269588 ) ) ( not ( = ?auto_2269585 ?auto_2269589 ) ) ( not ( = ?auto_2269587 ?auto_2269586 ) ) ( not ( = ?auto_2269587 ?auto_2269588 ) ) ( not ( = ?auto_2269587 ?auto_2269589 ) ) ( not ( = ?auto_2269586 ?auto_2269588 ) ) ( not ( = ?auto_2269586 ?auto_2269589 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2269588 ?auto_2269589 )
      ( MAKE-8CRATE-VERIFY ?auto_2269582 ?auto_2269583 ?auto_2269584 ?auto_2269581 ?auto_2269585 ?auto_2269587 ?auto_2269586 ?auto_2269588 ?auto_2269589 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2269649 - SURFACE
      ?auto_2269650 - SURFACE
      ?auto_2269651 - SURFACE
      ?auto_2269648 - SURFACE
      ?auto_2269652 - SURFACE
      ?auto_2269654 - SURFACE
      ?auto_2269653 - SURFACE
      ?auto_2269655 - SURFACE
      ?auto_2269656 - SURFACE
    )
    :vars
    (
      ?auto_2269659 - HOIST
      ?auto_2269657 - PLACE
      ?auto_2269658 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2269659 ?auto_2269657 ) ( SURFACE-AT ?auto_2269655 ?auto_2269657 ) ( CLEAR ?auto_2269655 ) ( IS-CRATE ?auto_2269656 ) ( not ( = ?auto_2269655 ?auto_2269656 ) ) ( TRUCK-AT ?auto_2269658 ?auto_2269657 ) ( AVAILABLE ?auto_2269659 ) ( IN ?auto_2269656 ?auto_2269658 ) ( ON ?auto_2269655 ?auto_2269653 ) ( not ( = ?auto_2269653 ?auto_2269655 ) ) ( not ( = ?auto_2269653 ?auto_2269656 ) ) ( ON ?auto_2269650 ?auto_2269649 ) ( ON ?auto_2269651 ?auto_2269650 ) ( ON ?auto_2269648 ?auto_2269651 ) ( ON ?auto_2269652 ?auto_2269648 ) ( ON ?auto_2269654 ?auto_2269652 ) ( ON ?auto_2269653 ?auto_2269654 ) ( not ( = ?auto_2269649 ?auto_2269650 ) ) ( not ( = ?auto_2269649 ?auto_2269651 ) ) ( not ( = ?auto_2269649 ?auto_2269648 ) ) ( not ( = ?auto_2269649 ?auto_2269652 ) ) ( not ( = ?auto_2269649 ?auto_2269654 ) ) ( not ( = ?auto_2269649 ?auto_2269653 ) ) ( not ( = ?auto_2269649 ?auto_2269655 ) ) ( not ( = ?auto_2269649 ?auto_2269656 ) ) ( not ( = ?auto_2269650 ?auto_2269651 ) ) ( not ( = ?auto_2269650 ?auto_2269648 ) ) ( not ( = ?auto_2269650 ?auto_2269652 ) ) ( not ( = ?auto_2269650 ?auto_2269654 ) ) ( not ( = ?auto_2269650 ?auto_2269653 ) ) ( not ( = ?auto_2269650 ?auto_2269655 ) ) ( not ( = ?auto_2269650 ?auto_2269656 ) ) ( not ( = ?auto_2269651 ?auto_2269648 ) ) ( not ( = ?auto_2269651 ?auto_2269652 ) ) ( not ( = ?auto_2269651 ?auto_2269654 ) ) ( not ( = ?auto_2269651 ?auto_2269653 ) ) ( not ( = ?auto_2269651 ?auto_2269655 ) ) ( not ( = ?auto_2269651 ?auto_2269656 ) ) ( not ( = ?auto_2269648 ?auto_2269652 ) ) ( not ( = ?auto_2269648 ?auto_2269654 ) ) ( not ( = ?auto_2269648 ?auto_2269653 ) ) ( not ( = ?auto_2269648 ?auto_2269655 ) ) ( not ( = ?auto_2269648 ?auto_2269656 ) ) ( not ( = ?auto_2269652 ?auto_2269654 ) ) ( not ( = ?auto_2269652 ?auto_2269653 ) ) ( not ( = ?auto_2269652 ?auto_2269655 ) ) ( not ( = ?auto_2269652 ?auto_2269656 ) ) ( not ( = ?auto_2269654 ?auto_2269653 ) ) ( not ( = ?auto_2269654 ?auto_2269655 ) ) ( not ( = ?auto_2269654 ?auto_2269656 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2269653 ?auto_2269655 ?auto_2269656 )
      ( MAKE-8CRATE-VERIFY ?auto_2269649 ?auto_2269650 ?auto_2269651 ?auto_2269648 ?auto_2269652 ?auto_2269654 ?auto_2269653 ?auto_2269655 ?auto_2269656 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2269725 - SURFACE
      ?auto_2269726 - SURFACE
      ?auto_2269727 - SURFACE
      ?auto_2269724 - SURFACE
      ?auto_2269728 - SURFACE
      ?auto_2269730 - SURFACE
      ?auto_2269729 - SURFACE
      ?auto_2269731 - SURFACE
      ?auto_2269732 - SURFACE
    )
    :vars
    (
      ?auto_2269735 - HOIST
      ?auto_2269736 - PLACE
      ?auto_2269734 - TRUCK
      ?auto_2269733 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2269735 ?auto_2269736 ) ( SURFACE-AT ?auto_2269731 ?auto_2269736 ) ( CLEAR ?auto_2269731 ) ( IS-CRATE ?auto_2269732 ) ( not ( = ?auto_2269731 ?auto_2269732 ) ) ( AVAILABLE ?auto_2269735 ) ( IN ?auto_2269732 ?auto_2269734 ) ( ON ?auto_2269731 ?auto_2269729 ) ( not ( = ?auto_2269729 ?auto_2269731 ) ) ( not ( = ?auto_2269729 ?auto_2269732 ) ) ( TRUCK-AT ?auto_2269734 ?auto_2269733 ) ( not ( = ?auto_2269733 ?auto_2269736 ) ) ( ON ?auto_2269726 ?auto_2269725 ) ( ON ?auto_2269727 ?auto_2269726 ) ( ON ?auto_2269724 ?auto_2269727 ) ( ON ?auto_2269728 ?auto_2269724 ) ( ON ?auto_2269730 ?auto_2269728 ) ( ON ?auto_2269729 ?auto_2269730 ) ( not ( = ?auto_2269725 ?auto_2269726 ) ) ( not ( = ?auto_2269725 ?auto_2269727 ) ) ( not ( = ?auto_2269725 ?auto_2269724 ) ) ( not ( = ?auto_2269725 ?auto_2269728 ) ) ( not ( = ?auto_2269725 ?auto_2269730 ) ) ( not ( = ?auto_2269725 ?auto_2269729 ) ) ( not ( = ?auto_2269725 ?auto_2269731 ) ) ( not ( = ?auto_2269725 ?auto_2269732 ) ) ( not ( = ?auto_2269726 ?auto_2269727 ) ) ( not ( = ?auto_2269726 ?auto_2269724 ) ) ( not ( = ?auto_2269726 ?auto_2269728 ) ) ( not ( = ?auto_2269726 ?auto_2269730 ) ) ( not ( = ?auto_2269726 ?auto_2269729 ) ) ( not ( = ?auto_2269726 ?auto_2269731 ) ) ( not ( = ?auto_2269726 ?auto_2269732 ) ) ( not ( = ?auto_2269727 ?auto_2269724 ) ) ( not ( = ?auto_2269727 ?auto_2269728 ) ) ( not ( = ?auto_2269727 ?auto_2269730 ) ) ( not ( = ?auto_2269727 ?auto_2269729 ) ) ( not ( = ?auto_2269727 ?auto_2269731 ) ) ( not ( = ?auto_2269727 ?auto_2269732 ) ) ( not ( = ?auto_2269724 ?auto_2269728 ) ) ( not ( = ?auto_2269724 ?auto_2269730 ) ) ( not ( = ?auto_2269724 ?auto_2269729 ) ) ( not ( = ?auto_2269724 ?auto_2269731 ) ) ( not ( = ?auto_2269724 ?auto_2269732 ) ) ( not ( = ?auto_2269728 ?auto_2269730 ) ) ( not ( = ?auto_2269728 ?auto_2269729 ) ) ( not ( = ?auto_2269728 ?auto_2269731 ) ) ( not ( = ?auto_2269728 ?auto_2269732 ) ) ( not ( = ?auto_2269730 ?auto_2269729 ) ) ( not ( = ?auto_2269730 ?auto_2269731 ) ) ( not ( = ?auto_2269730 ?auto_2269732 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2269729 ?auto_2269731 ?auto_2269732 )
      ( MAKE-8CRATE-VERIFY ?auto_2269725 ?auto_2269726 ?auto_2269727 ?auto_2269724 ?auto_2269728 ?auto_2269730 ?auto_2269729 ?auto_2269731 ?auto_2269732 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2269809 - SURFACE
      ?auto_2269810 - SURFACE
      ?auto_2269811 - SURFACE
      ?auto_2269808 - SURFACE
      ?auto_2269812 - SURFACE
      ?auto_2269814 - SURFACE
      ?auto_2269813 - SURFACE
      ?auto_2269815 - SURFACE
      ?auto_2269816 - SURFACE
    )
    :vars
    (
      ?auto_2269819 - HOIST
      ?auto_2269818 - PLACE
      ?auto_2269817 - TRUCK
      ?auto_2269820 - PLACE
      ?auto_2269821 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2269819 ?auto_2269818 ) ( SURFACE-AT ?auto_2269815 ?auto_2269818 ) ( CLEAR ?auto_2269815 ) ( IS-CRATE ?auto_2269816 ) ( not ( = ?auto_2269815 ?auto_2269816 ) ) ( AVAILABLE ?auto_2269819 ) ( ON ?auto_2269815 ?auto_2269813 ) ( not ( = ?auto_2269813 ?auto_2269815 ) ) ( not ( = ?auto_2269813 ?auto_2269816 ) ) ( TRUCK-AT ?auto_2269817 ?auto_2269820 ) ( not ( = ?auto_2269820 ?auto_2269818 ) ) ( HOIST-AT ?auto_2269821 ?auto_2269820 ) ( LIFTING ?auto_2269821 ?auto_2269816 ) ( not ( = ?auto_2269819 ?auto_2269821 ) ) ( ON ?auto_2269810 ?auto_2269809 ) ( ON ?auto_2269811 ?auto_2269810 ) ( ON ?auto_2269808 ?auto_2269811 ) ( ON ?auto_2269812 ?auto_2269808 ) ( ON ?auto_2269814 ?auto_2269812 ) ( ON ?auto_2269813 ?auto_2269814 ) ( not ( = ?auto_2269809 ?auto_2269810 ) ) ( not ( = ?auto_2269809 ?auto_2269811 ) ) ( not ( = ?auto_2269809 ?auto_2269808 ) ) ( not ( = ?auto_2269809 ?auto_2269812 ) ) ( not ( = ?auto_2269809 ?auto_2269814 ) ) ( not ( = ?auto_2269809 ?auto_2269813 ) ) ( not ( = ?auto_2269809 ?auto_2269815 ) ) ( not ( = ?auto_2269809 ?auto_2269816 ) ) ( not ( = ?auto_2269810 ?auto_2269811 ) ) ( not ( = ?auto_2269810 ?auto_2269808 ) ) ( not ( = ?auto_2269810 ?auto_2269812 ) ) ( not ( = ?auto_2269810 ?auto_2269814 ) ) ( not ( = ?auto_2269810 ?auto_2269813 ) ) ( not ( = ?auto_2269810 ?auto_2269815 ) ) ( not ( = ?auto_2269810 ?auto_2269816 ) ) ( not ( = ?auto_2269811 ?auto_2269808 ) ) ( not ( = ?auto_2269811 ?auto_2269812 ) ) ( not ( = ?auto_2269811 ?auto_2269814 ) ) ( not ( = ?auto_2269811 ?auto_2269813 ) ) ( not ( = ?auto_2269811 ?auto_2269815 ) ) ( not ( = ?auto_2269811 ?auto_2269816 ) ) ( not ( = ?auto_2269808 ?auto_2269812 ) ) ( not ( = ?auto_2269808 ?auto_2269814 ) ) ( not ( = ?auto_2269808 ?auto_2269813 ) ) ( not ( = ?auto_2269808 ?auto_2269815 ) ) ( not ( = ?auto_2269808 ?auto_2269816 ) ) ( not ( = ?auto_2269812 ?auto_2269814 ) ) ( not ( = ?auto_2269812 ?auto_2269813 ) ) ( not ( = ?auto_2269812 ?auto_2269815 ) ) ( not ( = ?auto_2269812 ?auto_2269816 ) ) ( not ( = ?auto_2269814 ?auto_2269813 ) ) ( not ( = ?auto_2269814 ?auto_2269815 ) ) ( not ( = ?auto_2269814 ?auto_2269816 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2269813 ?auto_2269815 ?auto_2269816 )
      ( MAKE-8CRATE-VERIFY ?auto_2269809 ?auto_2269810 ?auto_2269811 ?auto_2269808 ?auto_2269812 ?auto_2269814 ?auto_2269813 ?auto_2269815 ?auto_2269816 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2269901 - SURFACE
      ?auto_2269902 - SURFACE
      ?auto_2269903 - SURFACE
      ?auto_2269900 - SURFACE
      ?auto_2269904 - SURFACE
      ?auto_2269906 - SURFACE
      ?auto_2269905 - SURFACE
      ?auto_2269907 - SURFACE
      ?auto_2269908 - SURFACE
    )
    :vars
    (
      ?auto_2269914 - HOIST
      ?auto_2269913 - PLACE
      ?auto_2269910 - TRUCK
      ?auto_2269909 - PLACE
      ?auto_2269911 - HOIST
      ?auto_2269912 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2269914 ?auto_2269913 ) ( SURFACE-AT ?auto_2269907 ?auto_2269913 ) ( CLEAR ?auto_2269907 ) ( IS-CRATE ?auto_2269908 ) ( not ( = ?auto_2269907 ?auto_2269908 ) ) ( AVAILABLE ?auto_2269914 ) ( ON ?auto_2269907 ?auto_2269905 ) ( not ( = ?auto_2269905 ?auto_2269907 ) ) ( not ( = ?auto_2269905 ?auto_2269908 ) ) ( TRUCK-AT ?auto_2269910 ?auto_2269909 ) ( not ( = ?auto_2269909 ?auto_2269913 ) ) ( HOIST-AT ?auto_2269911 ?auto_2269909 ) ( not ( = ?auto_2269914 ?auto_2269911 ) ) ( AVAILABLE ?auto_2269911 ) ( SURFACE-AT ?auto_2269908 ?auto_2269909 ) ( ON ?auto_2269908 ?auto_2269912 ) ( CLEAR ?auto_2269908 ) ( not ( = ?auto_2269907 ?auto_2269912 ) ) ( not ( = ?auto_2269908 ?auto_2269912 ) ) ( not ( = ?auto_2269905 ?auto_2269912 ) ) ( ON ?auto_2269902 ?auto_2269901 ) ( ON ?auto_2269903 ?auto_2269902 ) ( ON ?auto_2269900 ?auto_2269903 ) ( ON ?auto_2269904 ?auto_2269900 ) ( ON ?auto_2269906 ?auto_2269904 ) ( ON ?auto_2269905 ?auto_2269906 ) ( not ( = ?auto_2269901 ?auto_2269902 ) ) ( not ( = ?auto_2269901 ?auto_2269903 ) ) ( not ( = ?auto_2269901 ?auto_2269900 ) ) ( not ( = ?auto_2269901 ?auto_2269904 ) ) ( not ( = ?auto_2269901 ?auto_2269906 ) ) ( not ( = ?auto_2269901 ?auto_2269905 ) ) ( not ( = ?auto_2269901 ?auto_2269907 ) ) ( not ( = ?auto_2269901 ?auto_2269908 ) ) ( not ( = ?auto_2269901 ?auto_2269912 ) ) ( not ( = ?auto_2269902 ?auto_2269903 ) ) ( not ( = ?auto_2269902 ?auto_2269900 ) ) ( not ( = ?auto_2269902 ?auto_2269904 ) ) ( not ( = ?auto_2269902 ?auto_2269906 ) ) ( not ( = ?auto_2269902 ?auto_2269905 ) ) ( not ( = ?auto_2269902 ?auto_2269907 ) ) ( not ( = ?auto_2269902 ?auto_2269908 ) ) ( not ( = ?auto_2269902 ?auto_2269912 ) ) ( not ( = ?auto_2269903 ?auto_2269900 ) ) ( not ( = ?auto_2269903 ?auto_2269904 ) ) ( not ( = ?auto_2269903 ?auto_2269906 ) ) ( not ( = ?auto_2269903 ?auto_2269905 ) ) ( not ( = ?auto_2269903 ?auto_2269907 ) ) ( not ( = ?auto_2269903 ?auto_2269908 ) ) ( not ( = ?auto_2269903 ?auto_2269912 ) ) ( not ( = ?auto_2269900 ?auto_2269904 ) ) ( not ( = ?auto_2269900 ?auto_2269906 ) ) ( not ( = ?auto_2269900 ?auto_2269905 ) ) ( not ( = ?auto_2269900 ?auto_2269907 ) ) ( not ( = ?auto_2269900 ?auto_2269908 ) ) ( not ( = ?auto_2269900 ?auto_2269912 ) ) ( not ( = ?auto_2269904 ?auto_2269906 ) ) ( not ( = ?auto_2269904 ?auto_2269905 ) ) ( not ( = ?auto_2269904 ?auto_2269907 ) ) ( not ( = ?auto_2269904 ?auto_2269908 ) ) ( not ( = ?auto_2269904 ?auto_2269912 ) ) ( not ( = ?auto_2269906 ?auto_2269905 ) ) ( not ( = ?auto_2269906 ?auto_2269907 ) ) ( not ( = ?auto_2269906 ?auto_2269908 ) ) ( not ( = ?auto_2269906 ?auto_2269912 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2269905 ?auto_2269907 ?auto_2269908 )
      ( MAKE-8CRATE-VERIFY ?auto_2269901 ?auto_2269902 ?auto_2269903 ?auto_2269900 ?auto_2269904 ?auto_2269906 ?auto_2269905 ?auto_2269907 ?auto_2269908 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2269994 - SURFACE
      ?auto_2269995 - SURFACE
      ?auto_2269996 - SURFACE
      ?auto_2269993 - SURFACE
      ?auto_2269997 - SURFACE
      ?auto_2269999 - SURFACE
      ?auto_2269998 - SURFACE
      ?auto_2270000 - SURFACE
      ?auto_2270001 - SURFACE
    )
    :vars
    (
      ?auto_2270002 - HOIST
      ?auto_2270006 - PLACE
      ?auto_2270007 - PLACE
      ?auto_2270003 - HOIST
      ?auto_2270004 - SURFACE
      ?auto_2270005 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2270002 ?auto_2270006 ) ( SURFACE-AT ?auto_2270000 ?auto_2270006 ) ( CLEAR ?auto_2270000 ) ( IS-CRATE ?auto_2270001 ) ( not ( = ?auto_2270000 ?auto_2270001 ) ) ( AVAILABLE ?auto_2270002 ) ( ON ?auto_2270000 ?auto_2269998 ) ( not ( = ?auto_2269998 ?auto_2270000 ) ) ( not ( = ?auto_2269998 ?auto_2270001 ) ) ( not ( = ?auto_2270007 ?auto_2270006 ) ) ( HOIST-AT ?auto_2270003 ?auto_2270007 ) ( not ( = ?auto_2270002 ?auto_2270003 ) ) ( AVAILABLE ?auto_2270003 ) ( SURFACE-AT ?auto_2270001 ?auto_2270007 ) ( ON ?auto_2270001 ?auto_2270004 ) ( CLEAR ?auto_2270001 ) ( not ( = ?auto_2270000 ?auto_2270004 ) ) ( not ( = ?auto_2270001 ?auto_2270004 ) ) ( not ( = ?auto_2269998 ?auto_2270004 ) ) ( TRUCK-AT ?auto_2270005 ?auto_2270006 ) ( ON ?auto_2269995 ?auto_2269994 ) ( ON ?auto_2269996 ?auto_2269995 ) ( ON ?auto_2269993 ?auto_2269996 ) ( ON ?auto_2269997 ?auto_2269993 ) ( ON ?auto_2269999 ?auto_2269997 ) ( ON ?auto_2269998 ?auto_2269999 ) ( not ( = ?auto_2269994 ?auto_2269995 ) ) ( not ( = ?auto_2269994 ?auto_2269996 ) ) ( not ( = ?auto_2269994 ?auto_2269993 ) ) ( not ( = ?auto_2269994 ?auto_2269997 ) ) ( not ( = ?auto_2269994 ?auto_2269999 ) ) ( not ( = ?auto_2269994 ?auto_2269998 ) ) ( not ( = ?auto_2269994 ?auto_2270000 ) ) ( not ( = ?auto_2269994 ?auto_2270001 ) ) ( not ( = ?auto_2269994 ?auto_2270004 ) ) ( not ( = ?auto_2269995 ?auto_2269996 ) ) ( not ( = ?auto_2269995 ?auto_2269993 ) ) ( not ( = ?auto_2269995 ?auto_2269997 ) ) ( not ( = ?auto_2269995 ?auto_2269999 ) ) ( not ( = ?auto_2269995 ?auto_2269998 ) ) ( not ( = ?auto_2269995 ?auto_2270000 ) ) ( not ( = ?auto_2269995 ?auto_2270001 ) ) ( not ( = ?auto_2269995 ?auto_2270004 ) ) ( not ( = ?auto_2269996 ?auto_2269993 ) ) ( not ( = ?auto_2269996 ?auto_2269997 ) ) ( not ( = ?auto_2269996 ?auto_2269999 ) ) ( not ( = ?auto_2269996 ?auto_2269998 ) ) ( not ( = ?auto_2269996 ?auto_2270000 ) ) ( not ( = ?auto_2269996 ?auto_2270001 ) ) ( not ( = ?auto_2269996 ?auto_2270004 ) ) ( not ( = ?auto_2269993 ?auto_2269997 ) ) ( not ( = ?auto_2269993 ?auto_2269999 ) ) ( not ( = ?auto_2269993 ?auto_2269998 ) ) ( not ( = ?auto_2269993 ?auto_2270000 ) ) ( not ( = ?auto_2269993 ?auto_2270001 ) ) ( not ( = ?auto_2269993 ?auto_2270004 ) ) ( not ( = ?auto_2269997 ?auto_2269999 ) ) ( not ( = ?auto_2269997 ?auto_2269998 ) ) ( not ( = ?auto_2269997 ?auto_2270000 ) ) ( not ( = ?auto_2269997 ?auto_2270001 ) ) ( not ( = ?auto_2269997 ?auto_2270004 ) ) ( not ( = ?auto_2269999 ?auto_2269998 ) ) ( not ( = ?auto_2269999 ?auto_2270000 ) ) ( not ( = ?auto_2269999 ?auto_2270001 ) ) ( not ( = ?auto_2269999 ?auto_2270004 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2269998 ?auto_2270000 ?auto_2270001 )
      ( MAKE-8CRATE-VERIFY ?auto_2269994 ?auto_2269995 ?auto_2269996 ?auto_2269993 ?auto_2269997 ?auto_2269999 ?auto_2269998 ?auto_2270000 ?auto_2270001 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2270087 - SURFACE
      ?auto_2270088 - SURFACE
      ?auto_2270089 - SURFACE
      ?auto_2270086 - SURFACE
      ?auto_2270090 - SURFACE
      ?auto_2270092 - SURFACE
      ?auto_2270091 - SURFACE
      ?auto_2270093 - SURFACE
      ?auto_2270094 - SURFACE
    )
    :vars
    (
      ?auto_2270100 - HOIST
      ?auto_2270096 - PLACE
      ?auto_2270097 - PLACE
      ?auto_2270095 - HOIST
      ?auto_2270099 - SURFACE
      ?auto_2270098 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2270100 ?auto_2270096 ) ( IS-CRATE ?auto_2270094 ) ( not ( = ?auto_2270093 ?auto_2270094 ) ) ( not ( = ?auto_2270091 ?auto_2270093 ) ) ( not ( = ?auto_2270091 ?auto_2270094 ) ) ( not ( = ?auto_2270097 ?auto_2270096 ) ) ( HOIST-AT ?auto_2270095 ?auto_2270097 ) ( not ( = ?auto_2270100 ?auto_2270095 ) ) ( AVAILABLE ?auto_2270095 ) ( SURFACE-AT ?auto_2270094 ?auto_2270097 ) ( ON ?auto_2270094 ?auto_2270099 ) ( CLEAR ?auto_2270094 ) ( not ( = ?auto_2270093 ?auto_2270099 ) ) ( not ( = ?auto_2270094 ?auto_2270099 ) ) ( not ( = ?auto_2270091 ?auto_2270099 ) ) ( TRUCK-AT ?auto_2270098 ?auto_2270096 ) ( SURFACE-AT ?auto_2270091 ?auto_2270096 ) ( CLEAR ?auto_2270091 ) ( LIFTING ?auto_2270100 ?auto_2270093 ) ( IS-CRATE ?auto_2270093 ) ( ON ?auto_2270088 ?auto_2270087 ) ( ON ?auto_2270089 ?auto_2270088 ) ( ON ?auto_2270086 ?auto_2270089 ) ( ON ?auto_2270090 ?auto_2270086 ) ( ON ?auto_2270092 ?auto_2270090 ) ( ON ?auto_2270091 ?auto_2270092 ) ( not ( = ?auto_2270087 ?auto_2270088 ) ) ( not ( = ?auto_2270087 ?auto_2270089 ) ) ( not ( = ?auto_2270087 ?auto_2270086 ) ) ( not ( = ?auto_2270087 ?auto_2270090 ) ) ( not ( = ?auto_2270087 ?auto_2270092 ) ) ( not ( = ?auto_2270087 ?auto_2270091 ) ) ( not ( = ?auto_2270087 ?auto_2270093 ) ) ( not ( = ?auto_2270087 ?auto_2270094 ) ) ( not ( = ?auto_2270087 ?auto_2270099 ) ) ( not ( = ?auto_2270088 ?auto_2270089 ) ) ( not ( = ?auto_2270088 ?auto_2270086 ) ) ( not ( = ?auto_2270088 ?auto_2270090 ) ) ( not ( = ?auto_2270088 ?auto_2270092 ) ) ( not ( = ?auto_2270088 ?auto_2270091 ) ) ( not ( = ?auto_2270088 ?auto_2270093 ) ) ( not ( = ?auto_2270088 ?auto_2270094 ) ) ( not ( = ?auto_2270088 ?auto_2270099 ) ) ( not ( = ?auto_2270089 ?auto_2270086 ) ) ( not ( = ?auto_2270089 ?auto_2270090 ) ) ( not ( = ?auto_2270089 ?auto_2270092 ) ) ( not ( = ?auto_2270089 ?auto_2270091 ) ) ( not ( = ?auto_2270089 ?auto_2270093 ) ) ( not ( = ?auto_2270089 ?auto_2270094 ) ) ( not ( = ?auto_2270089 ?auto_2270099 ) ) ( not ( = ?auto_2270086 ?auto_2270090 ) ) ( not ( = ?auto_2270086 ?auto_2270092 ) ) ( not ( = ?auto_2270086 ?auto_2270091 ) ) ( not ( = ?auto_2270086 ?auto_2270093 ) ) ( not ( = ?auto_2270086 ?auto_2270094 ) ) ( not ( = ?auto_2270086 ?auto_2270099 ) ) ( not ( = ?auto_2270090 ?auto_2270092 ) ) ( not ( = ?auto_2270090 ?auto_2270091 ) ) ( not ( = ?auto_2270090 ?auto_2270093 ) ) ( not ( = ?auto_2270090 ?auto_2270094 ) ) ( not ( = ?auto_2270090 ?auto_2270099 ) ) ( not ( = ?auto_2270092 ?auto_2270091 ) ) ( not ( = ?auto_2270092 ?auto_2270093 ) ) ( not ( = ?auto_2270092 ?auto_2270094 ) ) ( not ( = ?auto_2270092 ?auto_2270099 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2270091 ?auto_2270093 ?auto_2270094 )
      ( MAKE-8CRATE-VERIFY ?auto_2270087 ?auto_2270088 ?auto_2270089 ?auto_2270086 ?auto_2270090 ?auto_2270092 ?auto_2270091 ?auto_2270093 ?auto_2270094 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2270180 - SURFACE
      ?auto_2270181 - SURFACE
      ?auto_2270182 - SURFACE
      ?auto_2270179 - SURFACE
      ?auto_2270183 - SURFACE
      ?auto_2270185 - SURFACE
      ?auto_2270184 - SURFACE
      ?auto_2270186 - SURFACE
      ?auto_2270187 - SURFACE
    )
    :vars
    (
      ?auto_2270192 - HOIST
      ?auto_2270190 - PLACE
      ?auto_2270193 - PLACE
      ?auto_2270191 - HOIST
      ?auto_2270188 - SURFACE
      ?auto_2270189 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2270192 ?auto_2270190 ) ( IS-CRATE ?auto_2270187 ) ( not ( = ?auto_2270186 ?auto_2270187 ) ) ( not ( = ?auto_2270184 ?auto_2270186 ) ) ( not ( = ?auto_2270184 ?auto_2270187 ) ) ( not ( = ?auto_2270193 ?auto_2270190 ) ) ( HOIST-AT ?auto_2270191 ?auto_2270193 ) ( not ( = ?auto_2270192 ?auto_2270191 ) ) ( AVAILABLE ?auto_2270191 ) ( SURFACE-AT ?auto_2270187 ?auto_2270193 ) ( ON ?auto_2270187 ?auto_2270188 ) ( CLEAR ?auto_2270187 ) ( not ( = ?auto_2270186 ?auto_2270188 ) ) ( not ( = ?auto_2270187 ?auto_2270188 ) ) ( not ( = ?auto_2270184 ?auto_2270188 ) ) ( TRUCK-AT ?auto_2270189 ?auto_2270190 ) ( SURFACE-AT ?auto_2270184 ?auto_2270190 ) ( CLEAR ?auto_2270184 ) ( IS-CRATE ?auto_2270186 ) ( AVAILABLE ?auto_2270192 ) ( IN ?auto_2270186 ?auto_2270189 ) ( ON ?auto_2270181 ?auto_2270180 ) ( ON ?auto_2270182 ?auto_2270181 ) ( ON ?auto_2270179 ?auto_2270182 ) ( ON ?auto_2270183 ?auto_2270179 ) ( ON ?auto_2270185 ?auto_2270183 ) ( ON ?auto_2270184 ?auto_2270185 ) ( not ( = ?auto_2270180 ?auto_2270181 ) ) ( not ( = ?auto_2270180 ?auto_2270182 ) ) ( not ( = ?auto_2270180 ?auto_2270179 ) ) ( not ( = ?auto_2270180 ?auto_2270183 ) ) ( not ( = ?auto_2270180 ?auto_2270185 ) ) ( not ( = ?auto_2270180 ?auto_2270184 ) ) ( not ( = ?auto_2270180 ?auto_2270186 ) ) ( not ( = ?auto_2270180 ?auto_2270187 ) ) ( not ( = ?auto_2270180 ?auto_2270188 ) ) ( not ( = ?auto_2270181 ?auto_2270182 ) ) ( not ( = ?auto_2270181 ?auto_2270179 ) ) ( not ( = ?auto_2270181 ?auto_2270183 ) ) ( not ( = ?auto_2270181 ?auto_2270185 ) ) ( not ( = ?auto_2270181 ?auto_2270184 ) ) ( not ( = ?auto_2270181 ?auto_2270186 ) ) ( not ( = ?auto_2270181 ?auto_2270187 ) ) ( not ( = ?auto_2270181 ?auto_2270188 ) ) ( not ( = ?auto_2270182 ?auto_2270179 ) ) ( not ( = ?auto_2270182 ?auto_2270183 ) ) ( not ( = ?auto_2270182 ?auto_2270185 ) ) ( not ( = ?auto_2270182 ?auto_2270184 ) ) ( not ( = ?auto_2270182 ?auto_2270186 ) ) ( not ( = ?auto_2270182 ?auto_2270187 ) ) ( not ( = ?auto_2270182 ?auto_2270188 ) ) ( not ( = ?auto_2270179 ?auto_2270183 ) ) ( not ( = ?auto_2270179 ?auto_2270185 ) ) ( not ( = ?auto_2270179 ?auto_2270184 ) ) ( not ( = ?auto_2270179 ?auto_2270186 ) ) ( not ( = ?auto_2270179 ?auto_2270187 ) ) ( not ( = ?auto_2270179 ?auto_2270188 ) ) ( not ( = ?auto_2270183 ?auto_2270185 ) ) ( not ( = ?auto_2270183 ?auto_2270184 ) ) ( not ( = ?auto_2270183 ?auto_2270186 ) ) ( not ( = ?auto_2270183 ?auto_2270187 ) ) ( not ( = ?auto_2270183 ?auto_2270188 ) ) ( not ( = ?auto_2270185 ?auto_2270184 ) ) ( not ( = ?auto_2270185 ?auto_2270186 ) ) ( not ( = ?auto_2270185 ?auto_2270187 ) ) ( not ( = ?auto_2270185 ?auto_2270188 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2270184 ?auto_2270186 ?auto_2270187 )
      ( MAKE-8CRATE-VERIFY ?auto_2270180 ?auto_2270181 ?auto_2270182 ?auto_2270179 ?auto_2270183 ?auto_2270185 ?auto_2270184 ?auto_2270186 ?auto_2270187 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2274278 - SURFACE
      ?auto_2274279 - SURFACE
      ?auto_2274280 - SURFACE
      ?auto_2274277 - SURFACE
      ?auto_2274281 - SURFACE
      ?auto_2274283 - SURFACE
      ?auto_2274282 - SURFACE
      ?auto_2274284 - SURFACE
      ?auto_2274285 - SURFACE
      ?auto_2274286 - SURFACE
    )
    :vars
    (
      ?auto_2274288 - HOIST
      ?auto_2274287 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2274288 ?auto_2274287 ) ( SURFACE-AT ?auto_2274285 ?auto_2274287 ) ( CLEAR ?auto_2274285 ) ( LIFTING ?auto_2274288 ?auto_2274286 ) ( IS-CRATE ?auto_2274286 ) ( not ( = ?auto_2274285 ?auto_2274286 ) ) ( ON ?auto_2274279 ?auto_2274278 ) ( ON ?auto_2274280 ?auto_2274279 ) ( ON ?auto_2274277 ?auto_2274280 ) ( ON ?auto_2274281 ?auto_2274277 ) ( ON ?auto_2274283 ?auto_2274281 ) ( ON ?auto_2274282 ?auto_2274283 ) ( ON ?auto_2274284 ?auto_2274282 ) ( ON ?auto_2274285 ?auto_2274284 ) ( not ( = ?auto_2274278 ?auto_2274279 ) ) ( not ( = ?auto_2274278 ?auto_2274280 ) ) ( not ( = ?auto_2274278 ?auto_2274277 ) ) ( not ( = ?auto_2274278 ?auto_2274281 ) ) ( not ( = ?auto_2274278 ?auto_2274283 ) ) ( not ( = ?auto_2274278 ?auto_2274282 ) ) ( not ( = ?auto_2274278 ?auto_2274284 ) ) ( not ( = ?auto_2274278 ?auto_2274285 ) ) ( not ( = ?auto_2274278 ?auto_2274286 ) ) ( not ( = ?auto_2274279 ?auto_2274280 ) ) ( not ( = ?auto_2274279 ?auto_2274277 ) ) ( not ( = ?auto_2274279 ?auto_2274281 ) ) ( not ( = ?auto_2274279 ?auto_2274283 ) ) ( not ( = ?auto_2274279 ?auto_2274282 ) ) ( not ( = ?auto_2274279 ?auto_2274284 ) ) ( not ( = ?auto_2274279 ?auto_2274285 ) ) ( not ( = ?auto_2274279 ?auto_2274286 ) ) ( not ( = ?auto_2274280 ?auto_2274277 ) ) ( not ( = ?auto_2274280 ?auto_2274281 ) ) ( not ( = ?auto_2274280 ?auto_2274283 ) ) ( not ( = ?auto_2274280 ?auto_2274282 ) ) ( not ( = ?auto_2274280 ?auto_2274284 ) ) ( not ( = ?auto_2274280 ?auto_2274285 ) ) ( not ( = ?auto_2274280 ?auto_2274286 ) ) ( not ( = ?auto_2274277 ?auto_2274281 ) ) ( not ( = ?auto_2274277 ?auto_2274283 ) ) ( not ( = ?auto_2274277 ?auto_2274282 ) ) ( not ( = ?auto_2274277 ?auto_2274284 ) ) ( not ( = ?auto_2274277 ?auto_2274285 ) ) ( not ( = ?auto_2274277 ?auto_2274286 ) ) ( not ( = ?auto_2274281 ?auto_2274283 ) ) ( not ( = ?auto_2274281 ?auto_2274282 ) ) ( not ( = ?auto_2274281 ?auto_2274284 ) ) ( not ( = ?auto_2274281 ?auto_2274285 ) ) ( not ( = ?auto_2274281 ?auto_2274286 ) ) ( not ( = ?auto_2274283 ?auto_2274282 ) ) ( not ( = ?auto_2274283 ?auto_2274284 ) ) ( not ( = ?auto_2274283 ?auto_2274285 ) ) ( not ( = ?auto_2274283 ?auto_2274286 ) ) ( not ( = ?auto_2274282 ?auto_2274284 ) ) ( not ( = ?auto_2274282 ?auto_2274285 ) ) ( not ( = ?auto_2274282 ?auto_2274286 ) ) ( not ( = ?auto_2274284 ?auto_2274285 ) ) ( not ( = ?auto_2274284 ?auto_2274286 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2274285 ?auto_2274286 )
      ( MAKE-9CRATE-VERIFY ?auto_2274278 ?auto_2274279 ?auto_2274280 ?auto_2274277 ?auto_2274281 ?auto_2274283 ?auto_2274282 ?auto_2274284 ?auto_2274285 ?auto_2274286 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2274358 - SURFACE
      ?auto_2274359 - SURFACE
      ?auto_2274360 - SURFACE
      ?auto_2274357 - SURFACE
      ?auto_2274361 - SURFACE
      ?auto_2274363 - SURFACE
      ?auto_2274362 - SURFACE
      ?auto_2274364 - SURFACE
      ?auto_2274365 - SURFACE
      ?auto_2274366 - SURFACE
    )
    :vars
    (
      ?auto_2274368 - HOIST
      ?auto_2274367 - PLACE
      ?auto_2274369 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2274368 ?auto_2274367 ) ( SURFACE-AT ?auto_2274365 ?auto_2274367 ) ( CLEAR ?auto_2274365 ) ( IS-CRATE ?auto_2274366 ) ( not ( = ?auto_2274365 ?auto_2274366 ) ) ( TRUCK-AT ?auto_2274369 ?auto_2274367 ) ( AVAILABLE ?auto_2274368 ) ( IN ?auto_2274366 ?auto_2274369 ) ( ON ?auto_2274365 ?auto_2274364 ) ( not ( = ?auto_2274364 ?auto_2274365 ) ) ( not ( = ?auto_2274364 ?auto_2274366 ) ) ( ON ?auto_2274359 ?auto_2274358 ) ( ON ?auto_2274360 ?auto_2274359 ) ( ON ?auto_2274357 ?auto_2274360 ) ( ON ?auto_2274361 ?auto_2274357 ) ( ON ?auto_2274363 ?auto_2274361 ) ( ON ?auto_2274362 ?auto_2274363 ) ( ON ?auto_2274364 ?auto_2274362 ) ( not ( = ?auto_2274358 ?auto_2274359 ) ) ( not ( = ?auto_2274358 ?auto_2274360 ) ) ( not ( = ?auto_2274358 ?auto_2274357 ) ) ( not ( = ?auto_2274358 ?auto_2274361 ) ) ( not ( = ?auto_2274358 ?auto_2274363 ) ) ( not ( = ?auto_2274358 ?auto_2274362 ) ) ( not ( = ?auto_2274358 ?auto_2274364 ) ) ( not ( = ?auto_2274358 ?auto_2274365 ) ) ( not ( = ?auto_2274358 ?auto_2274366 ) ) ( not ( = ?auto_2274359 ?auto_2274360 ) ) ( not ( = ?auto_2274359 ?auto_2274357 ) ) ( not ( = ?auto_2274359 ?auto_2274361 ) ) ( not ( = ?auto_2274359 ?auto_2274363 ) ) ( not ( = ?auto_2274359 ?auto_2274362 ) ) ( not ( = ?auto_2274359 ?auto_2274364 ) ) ( not ( = ?auto_2274359 ?auto_2274365 ) ) ( not ( = ?auto_2274359 ?auto_2274366 ) ) ( not ( = ?auto_2274360 ?auto_2274357 ) ) ( not ( = ?auto_2274360 ?auto_2274361 ) ) ( not ( = ?auto_2274360 ?auto_2274363 ) ) ( not ( = ?auto_2274360 ?auto_2274362 ) ) ( not ( = ?auto_2274360 ?auto_2274364 ) ) ( not ( = ?auto_2274360 ?auto_2274365 ) ) ( not ( = ?auto_2274360 ?auto_2274366 ) ) ( not ( = ?auto_2274357 ?auto_2274361 ) ) ( not ( = ?auto_2274357 ?auto_2274363 ) ) ( not ( = ?auto_2274357 ?auto_2274362 ) ) ( not ( = ?auto_2274357 ?auto_2274364 ) ) ( not ( = ?auto_2274357 ?auto_2274365 ) ) ( not ( = ?auto_2274357 ?auto_2274366 ) ) ( not ( = ?auto_2274361 ?auto_2274363 ) ) ( not ( = ?auto_2274361 ?auto_2274362 ) ) ( not ( = ?auto_2274361 ?auto_2274364 ) ) ( not ( = ?auto_2274361 ?auto_2274365 ) ) ( not ( = ?auto_2274361 ?auto_2274366 ) ) ( not ( = ?auto_2274363 ?auto_2274362 ) ) ( not ( = ?auto_2274363 ?auto_2274364 ) ) ( not ( = ?auto_2274363 ?auto_2274365 ) ) ( not ( = ?auto_2274363 ?auto_2274366 ) ) ( not ( = ?auto_2274362 ?auto_2274364 ) ) ( not ( = ?auto_2274362 ?auto_2274365 ) ) ( not ( = ?auto_2274362 ?auto_2274366 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2274364 ?auto_2274365 ?auto_2274366 )
      ( MAKE-9CRATE-VERIFY ?auto_2274358 ?auto_2274359 ?auto_2274360 ?auto_2274357 ?auto_2274361 ?auto_2274363 ?auto_2274362 ?auto_2274364 ?auto_2274365 ?auto_2274366 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2274448 - SURFACE
      ?auto_2274449 - SURFACE
      ?auto_2274450 - SURFACE
      ?auto_2274447 - SURFACE
      ?auto_2274451 - SURFACE
      ?auto_2274453 - SURFACE
      ?auto_2274452 - SURFACE
      ?auto_2274454 - SURFACE
      ?auto_2274455 - SURFACE
      ?auto_2274456 - SURFACE
    )
    :vars
    (
      ?auto_2274457 - HOIST
      ?auto_2274460 - PLACE
      ?auto_2274458 - TRUCK
      ?auto_2274459 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2274457 ?auto_2274460 ) ( SURFACE-AT ?auto_2274455 ?auto_2274460 ) ( CLEAR ?auto_2274455 ) ( IS-CRATE ?auto_2274456 ) ( not ( = ?auto_2274455 ?auto_2274456 ) ) ( AVAILABLE ?auto_2274457 ) ( IN ?auto_2274456 ?auto_2274458 ) ( ON ?auto_2274455 ?auto_2274454 ) ( not ( = ?auto_2274454 ?auto_2274455 ) ) ( not ( = ?auto_2274454 ?auto_2274456 ) ) ( TRUCK-AT ?auto_2274458 ?auto_2274459 ) ( not ( = ?auto_2274459 ?auto_2274460 ) ) ( ON ?auto_2274449 ?auto_2274448 ) ( ON ?auto_2274450 ?auto_2274449 ) ( ON ?auto_2274447 ?auto_2274450 ) ( ON ?auto_2274451 ?auto_2274447 ) ( ON ?auto_2274453 ?auto_2274451 ) ( ON ?auto_2274452 ?auto_2274453 ) ( ON ?auto_2274454 ?auto_2274452 ) ( not ( = ?auto_2274448 ?auto_2274449 ) ) ( not ( = ?auto_2274448 ?auto_2274450 ) ) ( not ( = ?auto_2274448 ?auto_2274447 ) ) ( not ( = ?auto_2274448 ?auto_2274451 ) ) ( not ( = ?auto_2274448 ?auto_2274453 ) ) ( not ( = ?auto_2274448 ?auto_2274452 ) ) ( not ( = ?auto_2274448 ?auto_2274454 ) ) ( not ( = ?auto_2274448 ?auto_2274455 ) ) ( not ( = ?auto_2274448 ?auto_2274456 ) ) ( not ( = ?auto_2274449 ?auto_2274450 ) ) ( not ( = ?auto_2274449 ?auto_2274447 ) ) ( not ( = ?auto_2274449 ?auto_2274451 ) ) ( not ( = ?auto_2274449 ?auto_2274453 ) ) ( not ( = ?auto_2274449 ?auto_2274452 ) ) ( not ( = ?auto_2274449 ?auto_2274454 ) ) ( not ( = ?auto_2274449 ?auto_2274455 ) ) ( not ( = ?auto_2274449 ?auto_2274456 ) ) ( not ( = ?auto_2274450 ?auto_2274447 ) ) ( not ( = ?auto_2274450 ?auto_2274451 ) ) ( not ( = ?auto_2274450 ?auto_2274453 ) ) ( not ( = ?auto_2274450 ?auto_2274452 ) ) ( not ( = ?auto_2274450 ?auto_2274454 ) ) ( not ( = ?auto_2274450 ?auto_2274455 ) ) ( not ( = ?auto_2274450 ?auto_2274456 ) ) ( not ( = ?auto_2274447 ?auto_2274451 ) ) ( not ( = ?auto_2274447 ?auto_2274453 ) ) ( not ( = ?auto_2274447 ?auto_2274452 ) ) ( not ( = ?auto_2274447 ?auto_2274454 ) ) ( not ( = ?auto_2274447 ?auto_2274455 ) ) ( not ( = ?auto_2274447 ?auto_2274456 ) ) ( not ( = ?auto_2274451 ?auto_2274453 ) ) ( not ( = ?auto_2274451 ?auto_2274452 ) ) ( not ( = ?auto_2274451 ?auto_2274454 ) ) ( not ( = ?auto_2274451 ?auto_2274455 ) ) ( not ( = ?auto_2274451 ?auto_2274456 ) ) ( not ( = ?auto_2274453 ?auto_2274452 ) ) ( not ( = ?auto_2274453 ?auto_2274454 ) ) ( not ( = ?auto_2274453 ?auto_2274455 ) ) ( not ( = ?auto_2274453 ?auto_2274456 ) ) ( not ( = ?auto_2274452 ?auto_2274454 ) ) ( not ( = ?auto_2274452 ?auto_2274455 ) ) ( not ( = ?auto_2274452 ?auto_2274456 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2274454 ?auto_2274455 ?auto_2274456 )
      ( MAKE-9CRATE-VERIFY ?auto_2274448 ?auto_2274449 ?auto_2274450 ?auto_2274447 ?auto_2274451 ?auto_2274453 ?auto_2274452 ?auto_2274454 ?auto_2274455 ?auto_2274456 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2274547 - SURFACE
      ?auto_2274548 - SURFACE
      ?auto_2274549 - SURFACE
      ?auto_2274546 - SURFACE
      ?auto_2274550 - SURFACE
      ?auto_2274552 - SURFACE
      ?auto_2274551 - SURFACE
      ?auto_2274553 - SURFACE
      ?auto_2274554 - SURFACE
      ?auto_2274555 - SURFACE
    )
    :vars
    (
      ?auto_2274556 - HOIST
      ?auto_2274558 - PLACE
      ?auto_2274559 - TRUCK
      ?auto_2274560 - PLACE
      ?auto_2274557 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2274556 ?auto_2274558 ) ( SURFACE-AT ?auto_2274554 ?auto_2274558 ) ( CLEAR ?auto_2274554 ) ( IS-CRATE ?auto_2274555 ) ( not ( = ?auto_2274554 ?auto_2274555 ) ) ( AVAILABLE ?auto_2274556 ) ( ON ?auto_2274554 ?auto_2274553 ) ( not ( = ?auto_2274553 ?auto_2274554 ) ) ( not ( = ?auto_2274553 ?auto_2274555 ) ) ( TRUCK-AT ?auto_2274559 ?auto_2274560 ) ( not ( = ?auto_2274560 ?auto_2274558 ) ) ( HOIST-AT ?auto_2274557 ?auto_2274560 ) ( LIFTING ?auto_2274557 ?auto_2274555 ) ( not ( = ?auto_2274556 ?auto_2274557 ) ) ( ON ?auto_2274548 ?auto_2274547 ) ( ON ?auto_2274549 ?auto_2274548 ) ( ON ?auto_2274546 ?auto_2274549 ) ( ON ?auto_2274550 ?auto_2274546 ) ( ON ?auto_2274552 ?auto_2274550 ) ( ON ?auto_2274551 ?auto_2274552 ) ( ON ?auto_2274553 ?auto_2274551 ) ( not ( = ?auto_2274547 ?auto_2274548 ) ) ( not ( = ?auto_2274547 ?auto_2274549 ) ) ( not ( = ?auto_2274547 ?auto_2274546 ) ) ( not ( = ?auto_2274547 ?auto_2274550 ) ) ( not ( = ?auto_2274547 ?auto_2274552 ) ) ( not ( = ?auto_2274547 ?auto_2274551 ) ) ( not ( = ?auto_2274547 ?auto_2274553 ) ) ( not ( = ?auto_2274547 ?auto_2274554 ) ) ( not ( = ?auto_2274547 ?auto_2274555 ) ) ( not ( = ?auto_2274548 ?auto_2274549 ) ) ( not ( = ?auto_2274548 ?auto_2274546 ) ) ( not ( = ?auto_2274548 ?auto_2274550 ) ) ( not ( = ?auto_2274548 ?auto_2274552 ) ) ( not ( = ?auto_2274548 ?auto_2274551 ) ) ( not ( = ?auto_2274548 ?auto_2274553 ) ) ( not ( = ?auto_2274548 ?auto_2274554 ) ) ( not ( = ?auto_2274548 ?auto_2274555 ) ) ( not ( = ?auto_2274549 ?auto_2274546 ) ) ( not ( = ?auto_2274549 ?auto_2274550 ) ) ( not ( = ?auto_2274549 ?auto_2274552 ) ) ( not ( = ?auto_2274549 ?auto_2274551 ) ) ( not ( = ?auto_2274549 ?auto_2274553 ) ) ( not ( = ?auto_2274549 ?auto_2274554 ) ) ( not ( = ?auto_2274549 ?auto_2274555 ) ) ( not ( = ?auto_2274546 ?auto_2274550 ) ) ( not ( = ?auto_2274546 ?auto_2274552 ) ) ( not ( = ?auto_2274546 ?auto_2274551 ) ) ( not ( = ?auto_2274546 ?auto_2274553 ) ) ( not ( = ?auto_2274546 ?auto_2274554 ) ) ( not ( = ?auto_2274546 ?auto_2274555 ) ) ( not ( = ?auto_2274550 ?auto_2274552 ) ) ( not ( = ?auto_2274550 ?auto_2274551 ) ) ( not ( = ?auto_2274550 ?auto_2274553 ) ) ( not ( = ?auto_2274550 ?auto_2274554 ) ) ( not ( = ?auto_2274550 ?auto_2274555 ) ) ( not ( = ?auto_2274552 ?auto_2274551 ) ) ( not ( = ?auto_2274552 ?auto_2274553 ) ) ( not ( = ?auto_2274552 ?auto_2274554 ) ) ( not ( = ?auto_2274552 ?auto_2274555 ) ) ( not ( = ?auto_2274551 ?auto_2274553 ) ) ( not ( = ?auto_2274551 ?auto_2274554 ) ) ( not ( = ?auto_2274551 ?auto_2274555 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2274553 ?auto_2274554 ?auto_2274555 )
      ( MAKE-9CRATE-VERIFY ?auto_2274547 ?auto_2274548 ?auto_2274549 ?auto_2274546 ?auto_2274550 ?auto_2274552 ?auto_2274551 ?auto_2274553 ?auto_2274554 ?auto_2274555 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2274655 - SURFACE
      ?auto_2274656 - SURFACE
      ?auto_2274657 - SURFACE
      ?auto_2274654 - SURFACE
      ?auto_2274658 - SURFACE
      ?auto_2274660 - SURFACE
      ?auto_2274659 - SURFACE
      ?auto_2274661 - SURFACE
      ?auto_2274662 - SURFACE
      ?auto_2274663 - SURFACE
    )
    :vars
    (
      ?auto_2274668 - HOIST
      ?auto_2274665 - PLACE
      ?auto_2274669 - TRUCK
      ?auto_2274664 - PLACE
      ?auto_2274667 - HOIST
      ?auto_2274666 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2274668 ?auto_2274665 ) ( SURFACE-AT ?auto_2274662 ?auto_2274665 ) ( CLEAR ?auto_2274662 ) ( IS-CRATE ?auto_2274663 ) ( not ( = ?auto_2274662 ?auto_2274663 ) ) ( AVAILABLE ?auto_2274668 ) ( ON ?auto_2274662 ?auto_2274661 ) ( not ( = ?auto_2274661 ?auto_2274662 ) ) ( not ( = ?auto_2274661 ?auto_2274663 ) ) ( TRUCK-AT ?auto_2274669 ?auto_2274664 ) ( not ( = ?auto_2274664 ?auto_2274665 ) ) ( HOIST-AT ?auto_2274667 ?auto_2274664 ) ( not ( = ?auto_2274668 ?auto_2274667 ) ) ( AVAILABLE ?auto_2274667 ) ( SURFACE-AT ?auto_2274663 ?auto_2274664 ) ( ON ?auto_2274663 ?auto_2274666 ) ( CLEAR ?auto_2274663 ) ( not ( = ?auto_2274662 ?auto_2274666 ) ) ( not ( = ?auto_2274663 ?auto_2274666 ) ) ( not ( = ?auto_2274661 ?auto_2274666 ) ) ( ON ?auto_2274656 ?auto_2274655 ) ( ON ?auto_2274657 ?auto_2274656 ) ( ON ?auto_2274654 ?auto_2274657 ) ( ON ?auto_2274658 ?auto_2274654 ) ( ON ?auto_2274660 ?auto_2274658 ) ( ON ?auto_2274659 ?auto_2274660 ) ( ON ?auto_2274661 ?auto_2274659 ) ( not ( = ?auto_2274655 ?auto_2274656 ) ) ( not ( = ?auto_2274655 ?auto_2274657 ) ) ( not ( = ?auto_2274655 ?auto_2274654 ) ) ( not ( = ?auto_2274655 ?auto_2274658 ) ) ( not ( = ?auto_2274655 ?auto_2274660 ) ) ( not ( = ?auto_2274655 ?auto_2274659 ) ) ( not ( = ?auto_2274655 ?auto_2274661 ) ) ( not ( = ?auto_2274655 ?auto_2274662 ) ) ( not ( = ?auto_2274655 ?auto_2274663 ) ) ( not ( = ?auto_2274655 ?auto_2274666 ) ) ( not ( = ?auto_2274656 ?auto_2274657 ) ) ( not ( = ?auto_2274656 ?auto_2274654 ) ) ( not ( = ?auto_2274656 ?auto_2274658 ) ) ( not ( = ?auto_2274656 ?auto_2274660 ) ) ( not ( = ?auto_2274656 ?auto_2274659 ) ) ( not ( = ?auto_2274656 ?auto_2274661 ) ) ( not ( = ?auto_2274656 ?auto_2274662 ) ) ( not ( = ?auto_2274656 ?auto_2274663 ) ) ( not ( = ?auto_2274656 ?auto_2274666 ) ) ( not ( = ?auto_2274657 ?auto_2274654 ) ) ( not ( = ?auto_2274657 ?auto_2274658 ) ) ( not ( = ?auto_2274657 ?auto_2274660 ) ) ( not ( = ?auto_2274657 ?auto_2274659 ) ) ( not ( = ?auto_2274657 ?auto_2274661 ) ) ( not ( = ?auto_2274657 ?auto_2274662 ) ) ( not ( = ?auto_2274657 ?auto_2274663 ) ) ( not ( = ?auto_2274657 ?auto_2274666 ) ) ( not ( = ?auto_2274654 ?auto_2274658 ) ) ( not ( = ?auto_2274654 ?auto_2274660 ) ) ( not ( = ?auto_2274654 ?auto_2274659 ) ) ( not ( = ?auto_2274654 ?auto_2274661 ) ) ( not ( = ?auto_2274654 ?auto_2274662 ) ) ( not ( = ?auto_2274654 ?auto_2274663 ) ) ( not ( = ?auto_2274654 ?auto_2274666 ) ) ( not ( = ?auto_2274658 ?auto_2274660 ) ) ( not ( = ?auto_2274658 ?auto_2274659 ) ) ( not ( = ?auto_2274658 ?auto_2274661 ) ) ( not ( = ?auto_2274658 ?auto_2274662 ) ) ( not ( = ?auto_2274658 ?auto_2274663 ) ) ( not ( = ?auto_2274658 ?auto_2274666 ) ) ( not ( = ?auto_2274660 ?auto_2274659 ) ) ( not ( = ?auto_2274660 ?auto_2274661 ) ) ( not ( = ?auto_2274660 ?auto_2274662 ) ) ( not ( = ?auto_2274660 ?auto_2274663 ) ) ( not ( = ?auto_2274660 ?auto_2274666 ) ) ( not ( = ?auto_2274659 ?auto_2274661 ) ) ( not ( = ?auto_2274659 ?auto_2274662 ) ) ( not ( = ?auto_2274659 ?auto_2274663 ) ) ( not ( = ?auto_2274659 ?auto_2274666 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2274661 ?auto_2274662 ?auto_2274663 )
      ( MAKE-9CRATE-VERIFY ?auto_2274655 ?auto_2274656 ?auto_2274657 ?auto_2274654 ?auto_2274658 ?auto_2274660 ?auto_2274659 ?auto_2274661 ?auto_2274662 ?auto_2274663 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2274764 - SURFACE
      ?auto_2274765 - SURFACE
      ?auto_2274766 - SURFACE
      ?auto_2274763 - SURFACE
      ?auto_2274767 - SURFACE
      ?auto_2274769 - SURFACE
      ?auto_2274768 - SURFACE
      ?auto_2274770 - SURFACE
      ?auto_2274771 - SURFACE
      ?auto_2274772 - SURFACE
    )
    :vars
    (
      ?auto_2274775 - HOIST
      ?auto_2274778 - PLACE
      ?auto_2274776 - PLACE
      ?auto_2274773 - HOIST
      ?auto_2274774 - SURFACE
      ?auto_2274777 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2274775 ?auto_2274778 ) ( SURFACE-AT ?auto_2274771 ?auto_2274778 ) ( CLEAR ?auto_2274771 ) ( IS-CRATE ?auto_2274772 ) ( not ( = ?auto_2274771 ?auto_2274772 ) ) ( AVAILABLE ?auto_2274775 ) ( ON ?auto_2274771 ?auto_2274770 ) ( not ( = ?auto_2274770 ?auto_2274771 ) ) ( not ( = ?auto_2274770 ?auto_2274772 ) ) ( not ( = ?auto_2274776 ?auto_2274778 ) ) ( HOIST-AT ?auto_2274773 ?auto_2274776 ) ( not ( = ?auto_2274775 ?auto_2274773 ) ) ( AVAILABLE ?auto_2274773 ) ( SURFACE-AT ?auto_2274772 ?auto_2274776 ) ( ON ?auto_2274772 ?auto_2274774 ) ( CLEAR ?auto_2274772 ) ( not ( = ?auto_2274771 ?auto_2274774 ) ) ( not ( = ?auto_2274772 ?auto_2274774 ) ) ( not ( = ?auto_2274770 ?auto_2274774 ) ) ( TRUCK-AT ?auto_2274777 ?auto_2274778 ) ( ON ?auto_2274765 ?auto_2274764 ) ( ON ?auto_2274766 ?auto_2274765 ) ( ON ?auto_2274763 ?auto_2274766 ) ( ON ?auto_2274767 ?auto_2274763 ) ( ON ?auto_2274769 ?auto_2274767 ) ( ON ?auto_2274768 ?auto_2274769 ) ( ON ?auto_2274770 ?auto_2274768 ) ( not ( = ?auto_2274764 ?auto_2274765 ) ) ( not ( = ?auto_2274764 ?auto_2274766 ) ) ( not ( = ?auto_2274764 ?auto_2274763 ) ) ( not ( = ?auto_2274764 ?auto_2274767 ) ) ( not ( = ?auto_2274764 ?auto_2274769 ) ) ( not ( = ?auto_2274764 ?auto_2274768 ) ) ( not ( = ?auto_2274764 ?auto_2274770 ) ) ( not ( = ?auto_2274764 ?auto_2274771 ) ) ( not ( = ?auto_2274764 ?auto_2274772 ) ) ( not ( = ?auto_2274764 ?auto_2274774 ) ) ( not ( = ?auto_2274765 ?auto_2274766 ) ) ( not ( = ?auto_2274765 ?auto_2274763 ) ) ( not ( = ?auto_2274765 ?auto_2274767 ) ) ( not ( = ?auto_2274765 ?auto_2274769 ) ) ( not ( = ?auto_2274765 ?auto_2274768 ) ) ( not ( = ?auto_2274765 ?auto_2274770 ) ) ( not ( = ?auto_2274765 ?auto_2274771 ) ) ( not ( = ?auto_2274765 ?auto_2274772 ) ) ( not ( = ?auto_2274765 ?auto_2274774 ) ) ( not ( = ?auto_2274766 ?auto_2274763 ) ) ( not ( = ?auto_2274766 ?auto_2274767 ) ) ( not ( = ?auto_2274766 ?auto_2274769 ) ) ( not ( = ?auto_2274766 ?auto_2274768 ) ) ( not ( = ?auto_2274766 ?auto_2274770 ) ) ( not ( = ?auto_2274766 ?auto_2274771 ) ) ( not ( = ?auto_2274766 ?auto_2274772 ) ) ( not ( = ?auto_2274766 ?auto_2274774 ) ) ( not ( = ?auto_2274763 ?auto_2274767 ) ) ( not ( = ?auto_2274763 ?auto_2274769 ) ) ( not ( = ?auto_2274763 ?auto_2274768 ) ) ( not ( = ?auto_2274763 ?auto_2274770 ) ) ( not ( = ?auto_2274763 ?auto_2274771 ) ) ( not ( = ?auto_2274763 ?auto_2274772 ) ) ( not ( = ?auto_2274763 ?auto_2274774 ) ) ( not ( = ?auto_2274767 ?auto_2274769 ) ) ( not ( = ?auto_2274767 ?auto_2274768 ) ) ( not ( = ?auto_2274767 ?auto_2274770 ) ) ( not ( = ?auto_2274767 ?auto_2274771 ) ) ( not ( = ?auto_2274767 ?auto_2274772 ) ) ( not ( = ?auto_2274767 ?auto_2274774 ) ) ( not ( = ?auto_2274769 ?auto_2274768 ) ) ( not ( = ?auto_2274769 ?auto_2274770 ) ) ( not ( = ?auto_2274769 ?auto_2274771 ) ) ( not ( = ?auto_2274769 ?auto_2274772 ) ) ( not ( = ?auto_2274769 ?auto_2274774 ) ) ( not ( = ?auto_2274768 ?auto_2274770 ) ) ( not ( = ?auto_2274768 ?auto_2274771 ) ) ( not ( = ?auto_2274768 ?auto_2274772 ) ) ( not ( = ?auto_2274768 ?auto_2274774 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2274770 ?auto_2274771 ?auto_2274772 )
      ( MAKE-9CRATE-VERIFY ?auto_2274764 ?auto_2274765 ?auto_2274766 ?auto_2274763 ?auto_2274767 ?auto_2274769 ?auto_2274768 ?auto_2274770 ?auto_2274771 ?auto_2274772 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2274873 - SURFACE
      ?auto_2274874 - SURFACE
      ?auto_2274875 - SURFACE
      ?auto_2274872 - SURFACE
      ?auto_2274876 - SURFACE
      ?auto_2274878 - SURFACE
      ?auto_2274877 - SURFACE
      ?auto_2274879 - SURFACE
      ?auto_2274880 - SURFACE
      ?auto_2274881 - SURFACE
    )
    :vars
    (
      ?auto_2274885 - HOIST
      ?auto_2274886 - PLACE
      ?auto_2274882 - PLACE
      ?auto_2274884 - HOIST
      ?auto_2274883 - SURFACE
      ?auto_2274887 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2274885 ?auto_2274886 ) ( IS-CRATE ?auto_2274881 ) ( not ( = ?auto_2274880 ?auto_2274881 ) ) ( not ( = ?auto_2274879 ?auto_2274880 ) ) ( not ( = ?auto_2274879 ?auto_2274881 ) ) ( not ( = ?auto_2274882 ?auto_2274886 ) ) ( HOIST-AT ?auto_2274884 ?auto_2274882 ) ( not ( = ?auto_2274885 ?auto_2274884 ) ) ( AVAILABLE ?auto_2274884 ) ( SURFACE-AT ?auto_2274881 ?auto_2274882 ) ( ON ?auto_2274881 ?auto_2274883 ) ( CLEAR ?auto_2274881 ) ( not ( = ?auto_2274880 ?auto_2274883 ) ) ( not ( = ?auto_2274881 ?auto_2274883 ) ) ( not ( = ?auto_2274879 ?auto_2274883 ) ) ( TRUCK-AT ?auto_2274887 ?auto_2274886 ) ( SURFACE-AT ?auto_2274879 ?auto_2274886 ) ( CLEAR ?auto_2274879 ) ( LIFTING ?auto_2274885 ?auto_2274880 ) ( IS-CRATE ?auto_2274880 ) ( ON ?auto_2274874 ?auto_2274873 ) ( ON ?auto_2274875 ?auto_2274874 ) ( ON ?auto_2274872 ?auto_2274875 ) ( ON ?auto_2274876 ?auto_2274872 ) ( ON ?auto_2274878 ?auto_2274876 ) ( ON ?auto_2274877 ?auto_2274878 ) ( ON ?auto_2274879 ?auto_2274877 ) ( not ( = ?auto_2274873 ?auto_2274874 ) ) ( not ( = ?auto_2274873 ?auto_2274875 ) ) ( not ( = ?auto_2274873 ?auto_2274872 ) ) ( not ( = ?auto_2274873 ?auto_2274876 ) ) ( not ( = ?auto_2274873 ?auto_2274878 ) ) ( not ( = ?auto_2274873 ?auto_2274877 ) ) ( not ( = ?auto_2274873 ?auto_2274879 ) ) ( not ( = ?auto_2274873 ?auto_2274880 ) ) ( not ( = ?auto_2274873 ?auto_2274881 ) ) ( not ( = ?auto_2274873 ?auto_2274883 ) ) ( not ( = ?auto_2274874 ?auto_2274875 ) ) ( not ( = ?auto_2274874 ?auto_2274872 ) ) ( not ( = ?auto_2274874 ?auto_2274876 ) ) ( not ( = ?auto_2274874 ?auto_2274878 ) ) ( not ( = ?auto_2274874 ?auto_2274877 ) ) ( not ( = ?auto_2274874 ?auto_2274879 ) ) ( not ( = ?auto_2274874 ?auto_2274880 ) ) ( not ( = ?auto_2274874 ?auto_2274881 ) ) ( not ( = ?auto_2274874 ?auto_2274883 ) ) ( not ( = ?auto_2274875 ?auto_2274872 ) ) ( not ( = ?auto_2274875 ?auto_2274876 ) ) ( not ( = ?auto_2274875 ?auto_2274878 ) ) ( not ( = ?auto_2274875 ?auto_2274877 ) ) ( not ( = ?auto_2274875 ?auto_2274879 ) ) ( not ( = ?auto_2274875 ?auto_2274880 ) ) ( not ( = ?auto_2274875 ?auto_2274881 ) ) ( not ( = ?auto_2274875 ?auto_2274883 ) ) ( not ( = ?auto_2274872 ?auto_2274876 ) ) ( not ( = ?auto_2274872 ?auto_2274878 ) ) ( not ( = ?auto_2274872 ?auto_2274877 ) ) ( not ( = ?auto_2274872 ?auto_2274879 ) ) ( not ( = ?auto_2274872 ?auto_2274880 ) ) ( not ( = ?auto_2274872 ?auto_2274881 ) ) ( not ( = ?auto_2274872 ?auto_2274883 ) ) ( not ( = ?auto_2274876 ?auto_2274878 ) ) ( not ( = ?auto_2274876 ?auto_2274877 ) ) ( not ( = ?auto_2274876 ?auto_2274879 ) ) ( not ( = ?auto_2274876 ?auto_2274880 ) ) ( not ( = ?auto_2274876 ?auto_2274881 ) ) ( not ( = ?auto_2274876 ?auto_2274883 ) ) ( not ( = ?auto_2274878 ?auto_2274877 ) ) ( not ( = ?auto_2274878 ?auto_2274879 ) ) ( not ( = ?auto_2274878 ?auto_2274880 ) ) ( not ( = ?auto_2274878 ?auto_2274881 ) ) ( not ( = ?auto_2274878 ?auto_2274883 ) ) ( not ( = ?auto_2274877 ?auto_2274879 ) ) ( not ( = ?auto_2274877 ?auto_2274880 ) ) ( not ( = ?auto_2274877 ?auto_2274881 ) ) ( not ( = ?auto_2274877 ?auto_2274883 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2274879 ?auto_2274880 ?auto_2274881 )
      ( MAKE-9CRATE-VERIFY ?auto_2274873 ?auto_2274874 ?auto_2274875 ?auto_2274872 ?auto_2274876 ?auto_2274878 ?auto_2274877 ?auto_2274879 ?auto_2274880 ?auto_2274881 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2274982 - SURFACE
      ?auto_2274983 - SURFACE
      ?auto_2274984 - SURFACE
      ?auto_2274981 - SURFACE
      ?auto_2274985 - SURFACE
      ?auto_2274987 - SURFACE
      ?auto_2274986 - SURFACE
      ?auto_2274988 - SURFACE
      ?auto_2274989 - SURFACE
      ?auto_2274990 - SURFACE
    )
    :vars
    (
      ?auto_2274991 - HOIST
      ?auto_2274992 - PLACE
      ?auto_2274996 - PLACE
      ?auto_2274994 - HOIST
      ?auto_2274993 - SURFACE
      ?auto_2274995 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2274991 ?auto_2274992 ) ( IS-CRATE ?auto_2274990 ) ( not ( = ?auto_2274989 ?auto_2274990 ) ) ( not ( = ?auto_2274988 ?auto_2274989 ) ) ( not ( = ?auto_2274988 ?auto_2274990 ) ) ( not ( = ?auto_2274996 ?auto_2274992 ) ) ( HOIST-AT ?auto_2274994 ?auto_2274996 ) ( not ( = ?auto_2274991 ?auto_2274994 ) ) ( AVAILABLE ?auto_2274994 ) ( SURFACE-AT ?auto_2274990 ?auto_2274996 ) ( ON ?auto_2274990 ?auto_2274993 ) ( CLEAR ?auto_2274990 ) ( not ( = ?auto_2274989 ?auto_2274993 ) ) ( not ( = ?auto_2274990 ?auto_2274993 ) ) ( not ( = ?auto_2274988 ?auto_2274993 ) ) ( TRUCK-AT ?auto_2274995 ?auto_2274992 ) ( SURFACE-AT ?auto_2274988 ?auto_2274992 ) ( CLEAR ?auto_2274988 ) ( IS-CRATE ?auto_2274989 ) ( AVAILABLE ?auto_2274991 ) ( IN ?auto_2274989 ?auto_2274995 ) ( ON ?auto_2274983 ?auto_2274982 ) ( ON ?auto_2274984 ?auto_2274983 ) ( ON ?auto_2274981 ?auto_2274984 ) ( ON ?auto_2274985 ?auto_2274981 ) ( ON ?auto_2274987 ?auto_2274985 ) ( ON ?auto_2274986 ?auto_2274987 ) ( ON ?auto_2274988 ?auto_2274986 ) ( not ( = ?auto_2274982 ?auto_2274983 ) ) ( not ( = ?auto_2274982 ?auto_2274984 ) ) ( not ( = ?auto_2274982 ?auto_2274981 ) ) ( not ( = ?auto_2274982 ?auto_2274985 ) ) ( not ( = ?auto_2274982 ?auto_2274987 ) ) ( not ( = ?auto_2274982 ?auto_2274986 ) ) ( not ( = ?auto_2274982 ?auto_2274988 ) ) ( not ( = ?auto_2274982 ?auto_2274989 ) ) ( not ( = ?auto_2274982 ?auto_2274990 ) ) ( not ( = ?auto_2274982 ?auto_2274993 ) ) ( not ( = ?auto_2274983 ?auto_2274984 ) ) ( not ( = ?auto_2274983 ?auto_2274981 ) ) ( not ( = ?auto_2274983 ?auto_2274985 ) ) ( not ( = ?auto_2274983 ?auto_2274987 ) ) ( not ( = ?auto_2274983 ?auto_2274986 ) ) ( not ( = ?auto_2274983 ?auto_2274988 ) ) ( not ( = ?auto_2274983 ?auto_2274989 ) ) ( not ( = ?auto_2274983 ?auto_2274990 ) ) ( not ( = ?auto_2274983 ?auto_2274993 ) ) ( not ( = ?auto_2274984 ?auto_2274981 ) ) ( not ( = ?auto_2274984 ?auto_2274985 ) ) ( not ( = ?auto_2274984 ?auto_2274987 ) ) ( not ( = ?auto_2274984 ?auto_2274986 ) ) ( not ( = ?auto_2274984 ?auto_2274988 ) ) ( not ( = ?auto_2274984 ?auto_2274989 ) ) ( not ( = ?auto_2274984 ?auto_2274990 ) ) ( not ( = ?auto_2274984 ?auto_2274993 ) ) ( not ( = ?auto_2274981 ?auto_2274985 ) ) ( not ( = ?auto_2274981 ?auto_2274987 ) ) ( not ( = ?auto_2274981 ?auto_2274986 ) ) ( not ( = ?auto_2274981 ?auto_2274988 ) ) ( not ( = ?auto_2274981 ?auto_2274989 ) ) ( not ( = ?auto_2274981 ?auto_2274990 ) ) ( not ( = ?auto_2274981 ?auto_2274993 ) ) ( not ( = ?auto_2274985 ?auto_2274987 ) ) ( not ( = ?auto_2274985 ?auto_2274986 ) ) ( not ( = ?auto_2274985 ?auto_2274988 ) ) ( not ( = ?auto_2274985 ?auto_2274989 ) ) ( not ( = ?auto_2274985 ?auto_2274990 ) ) ( not ( = ?auto_2274985 ?auto_2274993 ) ) ( not ( = ?auto_2274987 ?auto_2274986 ) ) ( not ( = ?auto_2274987 ?auto_2274988 ) ) ( not ( = ?auto_2274987 ?auto_2274989 ) ) ( not ( = ?auto_2274987 ?auto_2274990 ) ) ( not ( = ?auto_2274987 ?auto_2274993 ) ) ( not ( = ?auto_2274986 ?auto_2274988 ) ) ( not ( = ?auto_2274986 ?auto_2274989 ) ) ( not ( = ?auto_2274986 ?auto_2274990 ) ) ( not ( = ?auto_2274986 ?auto_2274993 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2274988 ?auto_2274989 ?auto_2274990 )
      ( MAKE-9CRATE-VERIFY ?auto_2274982 ?auto_2274983 ?auto_2274984 ?auto_2274981 ?auto_2274985 ?auto_2274987 ?auto_2274986 ?auto_2274988 ?auto_2274989 ?auto_2274990 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2280547 - SURFACE
      ?auto_2280548 - SURFACE
      ?auto_2280549 - SURFACE
      ?auto_2280546 - SURFACE
      ?auto_2280550 - SURFACE
      ?auto_2280552 - SURFACE
      ?auto_2280551 - SURFACE
      ?auto_2280553 - SURFACE
      ?auto_2280554 - SURFACE
      ?auto_2280555 - SURFACE
      ?auto_2280556 - SURFACE
    )
    :vars
    (
      ?auto_2280557 - HOIST
      ?auto_2280558 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2280557 ?auto_2280558 ) ( SURFACE-AT ?auto_2280555 ?auto_2280558 ) ( CLEAR ?auto_2280555 ) ( LIFTING ?auto_2280557 ?auto_2280556 ) ( IS-CRATE ?auto_2280556 ) ( not ( = ?auto_2280555 ?auto_2280556 ) ) ( ON ?auto_2280548 ?auto_2280547 ) ( ON ?auto_2280549 ?auto_2280548 ) ( ON ?auto_2280546 ?auto_2280549 ) ( ON ?auto_2280550 ?auto_2280546 ) ( ON ?auto_2280552 ?auto_2280550 ) ( ON ?auto_2280551 ?auto_2280552 ) ( ON ?auto_2280553 ?auto_2280551 ) ( ON ?auto_2280554 ?auto_2280553 ) ( ON ?auto_2280555 ?auto_2280554 ) ( not ( = ?auto_2280547 ?auto_2280548 ) ) ( not ( = ?auto_2280547 ?auto_2280549 ) ) ( not ( = ?auto_2280547 ?auto_2280546 ) ) ( not ( = ?auto_2280547 ?auto_2280550 ) ) ( not ( = ?auto_2280547 ?auto_2280552 ) ) ( not ( = ?auto_2280547 ?auto_2280551 ) ) ( not ( = ?auto_2280547 ?auto_2280553 ) ) ( not ( = ?auto_2280547 ?auto_2280554 ) ) ( not ( = ?auto_2280547 ?auto_2280555 ) ) ( not ( = ?auto_2280547 ?auto_2280556 ) ) ( not ( = ?auto_2280548 ?auto_2280549 ) ) ( not ( = ?auto_2280548 ?auto_2280546 ) ) ( not ( = ?auto_2280548 ?auto_2280550 ) ) ( not ( = ?auto_2280548 ?auto_2280552 ) ) ( not ( = ?auto_2280548 ?auto_2280551 ) ) ( not ( = ?auto_2280548 ?auto_2280553 ) ) ( not ( = ?auto_2280548 ?auto_2280554 ) ) ( not ( = ?auto_2280548 ?auto_2280555 ) ) ( not ( = ?auto_2280548 ?auto_2280556 ) ) ( not ( = ?auto_2280549 ?auto_2280546 ) ) ( not ( = ?auto_2280549 ?auto_2280550 ) ) ( not ( = ?auto_2280549 ?auto_2280552 ) ) ( not ( = ?auto_2280549 ?auto_2280551 ) ) ( not ( = ?auto_2280549 ?auto_2280553 ) ) ( not ( = ?auto_2280549 ?auto_2280554 ) ) ( not ( = ?auto_2280549 ?auto_2280555 ) ) ( not ( = ?auto_2280549 ?auto_2280556 ) ) ( not ( = ?auto_2280546 ?auto_2280550 ) ) ( not ( = ?auto_2280546 ?auto_2280552 ) ) ( not ( = ?auto_2280546 ?auto_2280551 ) ) ( not ( = ?auto_2280546 ?auto_2280553 ) ) ( not ( = ?auto_2280546 ?auto_2280554 ) ) ( not ( = ?auto_2280546 ?auto_2280555 ) ) ( not ( = ?auto_2280546 ?auto_2280556 ) ) ( not ( = ?auto_2280550 ?auto_2280552 ) ) ( not ( = ?auto_2280550 ?auto_2280551 ) ) ( not ( = ?auto_2280550 ?auto_2280553 ) ) ( not ( = ?auto_2280550 ?auto_2280554 ) ) ( not ( = ?auto_2280550 ?auto_2280555 ) ) ( not ( = ?auto_2280550 ?auto_2280556 ) ) ( not ( = ?auto_2280552 ?auto_2280551 ) ) ( not ( = ?auto_2280552 ?auto_2280553 ) ) ( not ( = ?auto_2280552 ?auto_2280554 ) ) ( not ( = ?auto_2280552 ?auto_2280555 ) ) ( not ( = ?auto_2280552 ?auto_2280556 ) ) ( not ( = ?auto_2280551 ?auto_2280553 ) ) ( not ( = ?auto_2280551 ?auto_2280554 ) ) ( not ( = ?auto_2280551 ?auto_2280555 ) ) ( not ( = ?auto_2280551 ?auto_2280556 ) ) ( not ( = ?auto_2280553 ?auto_2280554 ) ) ( not ( = ?auto_2280553 ?auto_2280555 ) ) ( not ( = ?auto_2280553 ?auto_2280556 ) ) ( not ( = ?auto_2280554 ?auto_2280555 ) ) ( not ( = ?auto_2280554 ?auto_2280556 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2280555 ?auto_2280556 )
      ( MAKE-10CRATE-VERIFY ?auto_2280547 ?auto_2280548 ?auto_2280549 ?auto_2280546 ?auto_2280550 ?auto_2280552 ?auto_2280551 ?auto_2280553 ?auto_2280554 ?auto_2280555 ?auto_2280556 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2280641 - SURFACE
      ?auto_2280642 - SURFACE
      ?auto_2280643 - SURFACE
      ?auto_2280640 - SURFACE
      ?auto_2280644 - SURFACE
      ?auto_2280646 - SURFACE
      ?auto_2280645 - SURFACE
      ?auto_2280647 - SURFACE
      ?auto_2280648 - SURFACE
      ?auto_2280649 - SURFACE
      ?auto_2280650 - SURFACE
    )
    :vars
    (
      ?auto_2280652 - HOIST
      ?auto_2280653 - PLACE
      ?auto_2280651 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2280652 ?auto_2280653 ) ( SURFACE-AT ?auto_2280649 ?auto_2280653 ) ( CLEAR ?auto_2280649 ) ( IS-CRATE ?auto_2280650 ) ( not ( = ?auto_2280649 ?auto_2280650 ) ) ( TRUCK-AT ?auto_2280651 ?auto_2280653 ) ( AVAILABLE ?auto_2280652 ) ( IN ?auto_2280650 ?auto_2280651 ) ( ON ?auto_2280649 ?auto_2280648 ) ( not ( = ?auto_2280648 ?auto_2280649 ) ) ( not ( = ?auto_2280648 ?auto_2280650 ) ) ( ON ?auto_2280642 ?auto_2280641 ) ( ON ?auto_2280643 ?auto_2280642 ) ( ON ?auto_2280640 ?auto_2280643 ) ( ON ?auto_2280644 ?auto_2280640 ) ( ON ?auto_2280646 ?auto_2280644 ) ( ON ?auto_2280645 ?auto_2280646 ) ( ON ?auto_2280647 ?auto_2280645 ) ( ON ?auto_2280648 ?auto_2280647 ) ( not ( = ?auto_2280641 ?auto_2280642 ) ) ( not ( = ?auto_2280641 ?auto_2280643 ) ) ( not ( = ?auto_2280641 ?auto_2280640 ) ) ( not ( = ?auto_2280641 ?auto_2280644 ) ) ( not ( = ?auto_2280641 ?auto_2280646 ) ) ( not ( = ?auto_2280641 ?auto_2280645 ) ) ( not ( = ?auto_2280641 ?auto_2280647 ) ) ( not ( = ?auto_2280641 ?auto_2280648 ) ) ( not ( = ?auto_2280641 ?auto_2280649 ) ) ( not ( = ?auto_2280641 ?auto_2280650 ) ) ( not ( = ?auto_2280642 ?auto_2280643 ) ) ( not ( = ?auto_2280642 ?auto_2280640 ) ) ( not ( = ?auto_2280642 ?auto_2280644 ) ) ( not ( = ?auto_2280642 ?auto_2280646 ) ) ( not ( = ?auto_2280642 ?auto_2280645 ) ) ( not ( = ?auto_2280642 ?auto_2280647 ) ) ( not ( = ?auto_2280642 ?auto_2280648 ) ) ( not ( = ?auto_2280642 ?auto_2280649 ) ) ( not ( = ?auto_2280642 ?auto_2280650 ) ) ( not ( = ?auto_2280643 ?auto_2280640 ) ) ( not ( = ?auto_2280643 ?auto_2280644 ) ) ( not ( = ?auto_2280643 ?auto_2280646 ) ) ( not ( = ?auto_2280643 ?auto_2280645 ) ) ( not ( = ?auto_2280643 ?auto_2280647 ) ) ( not ( = ?auto_2280643 ?auto_2280648 ) ) ( not ( = ?auto_2280643 ?auto_2280649 ) ) ( not ( = ?auto_2280643 ?auto_2280650 ) ) ( not ( = ?auto_2280640 ?auto_2280644 ) ) ( not ( = ?auto_2280640 ?auto_2280646 ) ) ( not ( = ?auto_2280640 ?auto_2280645 ) ) ( not ( = ?auto_2280640 ?auto_2280647 ) ) ( not ( = ?auto_2280640 ?auto_2280648 ) ) ( not ( = ?auto_2280640 ?auto_2280649 ) ) ( not ( = ?auto_2280640 ?auto_2280650 ) ) ( not ( = ?auto_2280644 ?auto_2280646 ) ) ( not ( = ?auto_2280644 ?auto_2280645 ) ) ( not ( = ?auto_2280644 ?auto_2280647 ) ) ( not ( = ?auto_2280644 ?auto_2280648 ) ) ( not ( = ?auto_2280644 ?auto_2280649 ) ) ( not ( = ?auto_2280644 ?auto_2280650 ) ) ( not ( = ?auto_2280646 ?auto_2280645 ) ) ( not ( = ?auto_2280646 ?auto_2280647 ) ) ( not ( = ?auto_2280646 ?auto_2280648 ) ) ( not ( = ?auto_2280646 ?auto_2280649 ) ) ( not ( = ?auto_2280646 ?auto_2280650 ) ) ( not ( = ?auto_2280645 ?auto_2280647 ) ) ( not ( = ?auto_2280645 ?auto_2280648 ) ) ( not ( = ?auto_2280645 ?auto_2280649 ) ) ( not ( = ?auto_2280645 ?auto_2280650 ) ) ( not ( = ?auto_2280647 ?auto_2280648 ) ) ( not ( = ?auto_2280647 ?auto_2280649 ) ) ( not ( = ?auto_2280647 ?auto_2280650 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2280648 ?auto_2280649 ?auto_2280650 )
      ( MAKE-10CRATE-VERIFY ?auto_2280641 ?auto_2280642 ?auto_2280643 ?auto_2280640 ?auto_2280644 ?auto_2280646 ?auto_2280645 ?auto_2280647 ?auto_2280648 ?auto_2280649 ?auto_2280650 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2280746 - SURFACE
      ?auto_2280747 - SURFACE
      ?auto_2280748 - SURFACE
      ?auto_2280745 - SURFACE
      ?auto_2280749 - SURFACE
      ?auto_2280751 - SURFACE
      ?auto_2280750 - SURFACE
      ?auto_2280752 - SURFACE
      ?auto_2280753 - SURFACE
      ?auto_2280754 - SURFACE
      ?auto_2280755 - SURFACE
    )
    :vars
    (
      ?auto_2280759 - HOIST
      ?auto_2280757 - PLACE
      ?auto_2280756 - TRUCK
      ?auto_2280758 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2280759 ?auto_2280757 ) ( SURFACE-AT ?auto_2280754 ?auto_2280757 ) ( CLEAR ?auto_2280754 ) ( IS-CRATE ?auto_2280755 ) ( not ( = ?auto_2280754 ?auto_2280755 ) ) ( AVAILABLE ?auto_2280759 ) ( IN ?auto_2280755 ?auto_2280756 ) ( ON ?auto_2280754 ?auto_2280753 ) ( not ( = ?auto_2280753 ?auto_2280754 ) ) ( not ( = ?auto_2280753 ?auto_2280755 ) ) ( TRUCK-AT ?auto_2280756 ?auto_2280758 ) ( not ( = ?auto_2280758 ?auto_2280757 ) ) ( ON ?auto_2280747 ?auto_2280746 ) ( ON ?auto_2280748 ?auto_2280747 ) ( ON ?auto_2280745 ?auto_2280748 ) ( ON ?auto_2280749 ?auto_2280745 ) ( ON ?auto_2280751 ?auto_2280749 ) ( ON ?auto_2280750 ?auto_2280751 ) ( ON ?auto_2280752 ?auto_2280750 ) ( ON ?auto_2280753 ?auto_2280752 ) ( not ( = ?auto_2280746 ?auto_2280747 ) ) ( not ( = ?auto_2280746 ?auto_2280748 ) ) ( not ( = ?auto_2280746 ?auto_2280745 ) ) ( not ( = ?auto_2280746 ?auto_2280749 ) ) ( not ( = ?auto_2280746 ?auto_2280751 ) ) ( not ( = ?auto_2280746 ?auto_2280750 ) ) ( not ( = ?auto_2280746 ?auto_2280752 ) ) ( not ( = ?auto_2280746 ?auto_2280753 ) ) ( not ( = ?auto_2280746 ?auto_2280754 ) ) ( not ( = ?auto_2280746 ?auto_2280755 ) ) ( not ( = ?auto_2280747 ?auto_2280748 ) ) ( not ( = ?auto_2280747 ?auto_2280745 ) ) ( not ( = ?auto_2280747 ?auto_2280749 ) ) ( not ( = ?auto_2280747 ?auto_2280751 ) ) ( not ( = ?auto_2280747 ?auto_2280750 ) ) ( not ( = ?auto_2280747 ?auto_2280752 ) ) ( not ( = ?auto_2280747 ?auto_2280753 ) ) ( not ( = ?auto_2280747 ?auto_2280754 ) ) ( not ( = ?auto_2280747 ?auto_2280755 ) ) ( not ( = ?auto_2280748 ?auto_2280745 ) ) ( not ( = ?auto_2280748 ?auto_2280749 ) ) ( not ( = ?auto_2280748 ?auto_2280751 ) ) ( not ( = ?auto_2280748 ?auto_2280750 ) ) ( not ( = ?auto_2280748 ?auto_2280752 ) ) ( not ( = ?auto_2280748 ?auto_2280753 ) ) ( not ( = ?auto_2280748 ?auto_2280754 ) ) ( not ( = ?auto_2280748 ?auto_2280755 ) ) ( not ( = ?auto_2280745 ?auto_2280749 ) ) ( not ( = ?auto_2280745 ?auto_2280751 ) ) ( not ( = ?auto_2280745 ?auto_2280750 ) ) ( not ( = ?auto_2280745 ?auto_2280752 ) ) ( not ( = ?auto_2280745 ?auto_2280753 ) ) ( not ( = ?auto_2280745 ?auto_2280754 ) ) ( not ( = ?auto_2280745 ?auto_2280755 ) ) ( not ( = ?auto_2280749 ?auto_2280751 ) ) ( not ( = ?auto_2280749 ?auto_2280750 ) ) ( not ( = ?auto_2280749 ?auto_2280752 ) ) ( not ( = ?auto_2280749 ?auto_2280753 ) ) ( not ( = ?auto_2280749 ?auto_2280754 ) ) ( not ( = ?auto_2280749 ?auto_2280755 ) ) ( not ( = ?auto_2280751 ?auto_2280750 ) ) ( not ( = ?auto_2280751 ?auto_2280752 ) ) ( not ( = ?auto_2280751 ?auto_2280753 ) ) ( not ( = ?auto_2280751 ?auto_2280754 ) ) ( not ( = ?auto_2280751 ?auto_2280755 ) ) ( not ( = ?auto_2280750 ?auto_2280752 ) ) ( not ( = ?auto_2280750 ?auto_2280753 ) ) ( not ( = ?auto_2280750 ?auto_2280754 ) ) ( not ( = ?auto_2280750 ?auto_2280755 ) ) ( not ( = ?auto_2280752 ?auto_2280753 ) ) ( not ( = ?auto_2280752 ?auto_2280754 ) ) ( not ( = ?auto_2280752 ?auto_2280755 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2280753 ?auto_2280754 ?auto_2280755 )
      ( MAKE-10CRATE-VERIFY ?auto_2280746 ?auto_2280747 ?auto_2280748 ?auto_2280745 ?auto_2280749 ?auto_2280751 ?auto_2280750 ?auto_2280752 ?auto_2280753 ?auto_2280754 ?auto_2280755 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2280861 - SURFACE
      ?auto_2280862 - SURFACE
      ?auto_2280863 - SURFACE
      ?auto_2280860 - SURFACE
      ?auto_2280864 - SURFACE
      ?auto_2280866 - SURFACE
      ?auto_2280865 - SURFACE
      ?auto_2280867 - SURFACE
      ?auto_2280868 - SURFACE
      ?auto_2280869 - SURFACE
      ?auto_2280870 - SURFACE
    )
    :vars
    (
      ?auto_2280872 - HOIST
      ?auto_2280873 - PLACE
      ?auto_2280875 - TRUCK
      ?auto_2280874 - PLACE
      ?auto_2280871 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2280872 ?auto_2280873 ) ( SURFACE-AT ?auto_2280869 ?auto_2280873 ) ( CLEAR ?auto_2280869 ) ( IS-CRATE ?auto_2280870 ) ( not ( = ?auto_2280869 ?auto_2280870 ) ) ( AVAILABLE ?auto_2280872 ) ( ON ?auto_2280869 ?auto_2280868 ) ( not ( = ?auto_2280868 ?auto_2280869 ) ) ( not ( = ?auto_2280868 ?auto_2280870 ) ) ( TRUCK-AT ?auto_2280875 ?auto_2280874 ) ( not ( = ?auto_2280874 ?auto_2280873 ) ) ( HOIST-AT ?auto_2280871 ?auto_2280874 ) ( LIFTING ?auto_2280871 ?auto_2280870 ) ( not ( = ?auto_2280872 ?auto_2280871 ) ) ( ON ?auto_2280862 ?auto_2280861 ) ( ON ?auto_2280863 ?auto_2280862 ) ( ON ?auto_2280860 ?auto_2280863 ) ( ON ?auto_2280864 ?auto_2280860 ) ( ON ?auto_2280866 ?auto_2280864 ) ( ON ?auto_2280865 ?auto_2280866 ) ( ON ?auto_2280867 ?auto_2280865 ) ( ON ?auto_2280868 ?auto_2280867 ) ( not ( = ?auto_2280861 ?auto_2280862 ) ) ( not ( = ?auto_2280861 ?auto_2280863 ) ) ( not ( = ?auto_2280861 ?auto_2280860 ) ) ( not ( = ?auto_2280861 ?auto_2280864 ) ) ( not ( = ?auto_2280861 ?auto_2280866 ) ) ( not ( = ?auto_2280861 ?auto_2280865 ) ) ( not ( = ?auto_2280861 ?auto_2280867 ) ) ( not ( = ?auto_2280861 ?auto_2280868 ) ) ( not ( = ?auto_2280861 ?auto_2280869 ) ) ( not ( = ?auto_2280861 ?auto_2280870 ) ) ( not ( = ?auto_2280862 ?auto_2280863 ) ) ( not ( = ?auto_2280862 ?auto_2280860 ) ) ( not ( = ?auto_2280862 ?auto_2280864 ) ) ( not ( = ?auto_2280862 ?auto_2280866 ) ) ( not ( = ?auto_2280862 ?auto_2280865 ) ) ( not ( = ?auto_2280862 ?auto_2280867 ) ) ( not ( = ?auto_2280862 ?auto_2280868 ) ) ( not ( = ?auto_2280862 ?auto_2280869 ) ) ( not ( = ?auto_2280862 ?auto_2280870 ) ) ( not ( = ?auto_2280863 ?auto_2280860 ) ) ( not ( = ?auto_2280863 ?auto_2280864 ) ) ( not ( = ?auto_2280863 ?auto_2280866 ) ) ( not ( = ?auto_2280863 ?auto_2280865 ) ) ( not ( = ?auto_2280863 ?auto_2280867 ) ) ( not ( = ?auto_2280863 ?auto_2280868 ) ) ( not ( = ?auto_2280863 ?auto_2280869 ) ) ( not ( = ?auto_2280863 ?auto_2280870 ) ) ( not ( = ?auto_2280860 ?auto_2280864 ) ) ( not ( = ?auto_2280860 ?auto_2280866 ) ) ( not ( = ?auto_2280860 ?auto_2280865 ) ) ( not ( = ?auto_2280860 ?auto_2280867 ) ) ( not ( = ?auto_2280860 ?auto_2280868 ) ) ( not ( = ?auto_2280860 ?auto_2280869 ) ) ( not ( = ?auto_2280860 ?auto_2280870 ) ) ( not ( = ?auto_2280864 ?auto_2280866 ) ) ( not ( = ?auto_2280864 ?auto_2280865 ) ) ( not ( = ?auto_2280864 ?auto_2280867 ) ) ( not ( = ?auto_2280864 ?auto_2280868 ) ) ( not ( = ?auto_2280864 ?auto_2280869 ) ) ( not ( = ?auto_2280864 ?auto_2280870 ) ) ( not ( = ?auto_2280866 ?auto_2280865 ) ) ( not ( = ?auto_2280866 ?auto_2280867 ) ) ( not ( = ?auto_2280866 ?auto_2280868 ) ) ( not ( = ?auto_2280866 ?auto_2280869 ) ) ( not ( = ?auto_2280866 ?auto_2280870 ) ) ( not ( = ?auto_2280865 ?auto_2280867 ) ) ( not ( = ?auto_2280865 ?auto_2280868 ) ) ( not ( = ?auto_2280865 ?auto_2280869 ) ) ( not ( = ?auto_2280865 ?auto_2280870 ) ) ( not ( = ?auto_2280867 ?auto_2280868 ) ) ( not ( = ?auto_2280867 ?auto_2280869 ) ) ( not ( = ?auto_2280867 ?auto_2280870 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2280868 ?auto_2280869 ?auto_2280870 )
      ( MAKE-10CRATE-VERIFY ?auto_2280861 ?auto_2280862 ?auto_2280863 ?auto_2280860 ?auto_2280864 ?auto_2280866 ?auto_2280865 ?auto_2280867 ?auto_2280868 ?auto_2280869 ?auto_2280870 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2280986 - SURFACE
      ?auto_2280987 - SURFACE
      ?auto_2280988 - SURFACE
      ?auto_2280985 - SURFACE
      ?auto_2280989 - SURFACE
      ?auto_2280991 - SURFACE
      ?auto_2280990 - SURFACE
      ?auto_2280992 - SURFACE
      ?auto_2280993 - SURFACE
      ?auto_2280994 - SURFACE
      ?auto_2280995 - SURFACE
    )
    :vars
    (
      ?auto_2280996 - HOIST
      ?auto_2280998 - PLACE
      ?auto_2280997 - TRUCK
      ?auto_2281001 - PLACE
      ?auto_2281000 - HOIST
      ?auto_2280999 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2280996 ?auto_2280998 ) ( SURFACE-AT ?auto_2280994 ?auto_2280998 ) ( CLEAR ?auto_2280994 ) ( IS-CRATE ?auto_2280995 ) ( not ( = ?auto_2280994 ?auto_2280995 ) ) ( AVAILABLE ?auto_2280996 ) ( ON ?auto_2280994 ?auto_2280993 ) ( not ( = ?auto_2280993 ?auto_2280994 ) ) ( not ( = ?auto_2280993 ?auto_2280995 ) ) ( TRUCK-AT ?auto_2280997 ?auto_2281001 ) ( not ( = ?auto_2281001 ?auto_2280998 ) ) ( HOIST-AT ?auto_2281000 ?auto_2281001 ) ( not ( = ?auto_2280996 ?auto_2281000 ) ) ( AVAILABLE ?auto_2281000 ) ( SURFACE-AT ?auto_2280995 ?auto_2281001 ) ( ON ?auto_2280995 ?auto_2280999 ) ( CLEAR ?auto_2280995 ) ( not ( = ?auto_2280994 ?auto_2280999 ) ) ( not ( = ?auto_2280995 ?auto_2280999 ) ) ( not ( = ?auto_2280993 ?auto_2280999 ) ) ( ON ?auto_2280987 ?auto_2280986 ) ( ON ?auto_2280988 ?auto_2280987 ) ( ON ?auto_2280985 ?auto_2280988 ) ( ON ?auto_2280989 ?auto_2280985 ) ( ON ?auto_2280991 ?auto_2280989 ) ( ON ?auto_2280990 ?auto_2280991 ) ( ON ?auto_2280992 ?auto_2280990 ) ( ON ?auto_2280993 ?auto_2280992 ) ( not ( = ?auto_2280986 ?auto_2280987 ) ) ( not ( = ?auto_2280986 ?auto_2280988 ) ) ( not ( = ?auto_2280986 ?auto_2280985 ) ) ( not ( = ?auto_2280986 ?auto_2280989 ) ) ( not ( = ?auto_2280986 ?auto_2280991 ) ) ( not ( = ?auto_2280986 ?auto_2280990 ) ) ( not ( = ?auto_2280986 ?auto_2280992 ) ) ( not ( = ?auto_2280986 ?auto_2280993 ) ) ( not ( = ?auto_2280986 ?auto_2280994 ) ) ( not ( = ?auto_2280986 ?auto_2280995 ) ) ( not ( = ?auto_2280986 ?auto_2280999 ) ) ( not ( = ?auto_2280987 ?auto_2280988 ) ) ( not ( = ?auto_2280987 ?auto_2280985 ) ) ( not ( = ?auto_2280987 ?auto_2280989 ) ) ( not ( = ?auto_2280987 ?auto_2280991 ) ) ( not ( = ?auto_2280987 ?auto_2280990 ) ) ( not ( = ?auto_2280987 ?auto_2280992 ) ) ( not ( = ?auto_2280987 ?auto_2280993 ) ) ( not ( = ?auto_2280987 ?auto_2280994 ) ) ( not ( = ?auto_2280987 ?auto_2280995 ) ) ( not ( = ?auto_2280987 ?auto_2280999 ) ) ( not ( = ?auto_2280988 ?auto_2280985 ) ) ( not ( = ?auto_2280988 ?auto_2280989 ) ) ( not ( = ?auto_2280988 ?auto_2280991 ) ) ( not ( = ?auto_2280988 ?auto_2280990 ) ) ( not ( = ?auto_2280988 ?auto_2280992 ) ) ( not ( = ?auto_2280988 ?auto_2280993 ) ) ( not ( = ?auto_2280988 ?auto_2280994 ) ) ( not ( = ?auto_2280988 ?auto_2280995 ) ) ( not ( = ?auto_2280988 ?auto_2280999 ) ) ( not ( = ?auto_2280985 ?auto_2280989 ) ) ( not ( = ?auto_2280985 ?auto_2280991 ) ) ( not ( = ?auto_2280985 ?auto_2280990 ) ) ( not ( = ?auto_2280985 ?auto_2280992 ) ) ( not ( = ?auto_2280985 ?auto_2280993 ) ) ( not ( = ?auto_2280985 ?auto_2280994 ) ) ( not ( = ?auto_2280985 ?auto_2280995 ) ) ( not ( = ?auto_2280985 ?auto_2280999 ) ) ( not ( = ?auto_2280989 ?auto_2280991 ) ) ( not ( = ?auto_2280989 ?auto_2280990 ) ) ( not ( = ?auto_2280989 ?auto_2280992 ) ) ( not ( = ?auto_2280989 ?auto_2280993 ) ) ( not ( = ?auto_2280989 ?auto_2280994 ) ) ( not ( = ?auto_2280989 ?auto_2280995 ) ) ( not ( = ?auto_2280989 ?auto_2280999 ) ) ( not ( = ?auto_2280991 ?auto_2280990 ) ) ( not ( = ?auto_2280991 ?auto_2280992 ) ) ( not ( = ?auto_2280991 ?auto_2280993 ) ) ( not ( = ?auto_2280991 ?auto_2280994 ) ) ( not ( = ?auto_2280991 ?auto_2280995 ) ) ( not ( = ?auto_2280991 ?auto_2280999 ) ) ( not ( = ?auto_2280990 ?auto_2280992 ) ) ( not ( = ?auto_2280990 ?auto_2280993 ) ) ( not ( = ?auto_2280990 ?auto_2280994 ) ) ( not ( = ?auto_2280990 ?auto_2280995 ) ) ( not ( = ?auto_2280990 ?auto_2280999 ) ) ( not ( = ?auto_2280992 ?auto_2280993 ) ) ( not ( = ?auto_2280992 ?auto_2280994 ) ) ( not ( = ?auto_2280992 ?auto_2280995 ) ) ( not ( = ?auto_2280992 ?auto_2280999 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2280993 ?auto_2280994 ?auto_2280995 )
      ( MAKE-10CRATE-VERIFY ?auto_2280986 ?auto_2280987 ?auto_2280988 ?auto_2280985 ?auto_2280989 ?auto_2280991 ?auto_2280990 ?auto_2280992 ?auto_2280993 ?auto_2280994 ?auto_2280995 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2281112 - SURFACE
      ?auto_2281113 - SURFACE
      ?auto_2281114 - SURFACE
      ?auto_2281111 - SURFACE
      ?auto_2281115 - SURFACE
      ?auto_2281117 - SURFACE
      ?auto_2281116 - SURFACE
      ?auto_2281118 - SURFACE
      ?auto_2281119 - SURFACE
      ?auto_2281120 - SURFACE
      ?auto_2281121 - SURFACE
    )
    :vars
    (
      ?auto_2281124 - HOIST
      ?auto_2281123 - PLACE
      ?auto_2281125 - PLACE
      ?auto_2281122 - HOIST
      ?auto_2281127 - SURFACE
      ?auto_2281126 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2281124 ?auto_2281123 ) ( SURFACE-AT ?auto_2281120 ?auto_2281123 ) ( CLEAR ?auto_2281120 ) ( IS-CRATE ?auto_2281121 ) ( not ( = ?auto_2281120 ?auto_2281121 ) ) ( AVAILABLE ?auto_2281124 ) ( ON ?auto_2281120 ?auto_2281119 ) ( not ( = ?auto_2281119 ?auto_2281120 ) ) ( not ( = ?auto_2281119 ?auto_2281121 ) ) ( not ( = ?auto_2281125 ?auto_2281123 ) ) ( HOIST-AT ?auto_2281122 ?auto_2281125 ) ( not ( = ?auto_2281124 ?auto_2281122 ) ) ( AVAILABLE ?auto_2281122 ) ( SURFACE-AT ?auto_2281121 ?auto_2281125 ) ( ON ?auto_2281121 ?auto_2281127 ) ( CLEAR ?auto_2281121 ) ( not ( = ?auto_2281120 ?auto_2281127 ) ) ( not ( = ?auto_2281121 ?auto_2281127 ) ) ( not ( = ?auto_2281119 ?auto_2281127 ) ) ( TRUCK-AT ?auto_2281126 ?auto_2281123 ) ( ON ?auto_2281113 ?auto_2281112 ) ( ON ?auto_2281114 ?auto_2281113 ) ( ON ?auto_2281111 ?auto_2281114 ) ( ON ?auto_2281115 ?auto_2281111 ) ( ON ?auto_2281117 ?auto_2281115 ) ( ON ?auto_2281116 ?auto_2281117 ) ( ON ?auto_2281118 ?auto_2281116 ) ( ON ?auto_2281119 ?auto_2281118 ) ( not ( = ?auto_2281112 ?auto_2281113 ) ) ( not ( = ?auto_2281112 ?auto_2281114 ) ) ( not ( = ?auto_2281112 ?auto_2281111 ) ) ( not ( = ?auto_2281112 ?auto_2281115 ) ) ( not ( = ?auto_2281112 ?auto_2281117 ) ) ( not ( = ?auto_2281112 ?auto_2281116 ) ) ( not ( = ?auto_2281112 ?auto_2281118 ) ) ( not ( = ?auto_2281112 ?auto_2281119 ) ) ( not ( = ?auto_2281112 ?auto_2281120 ) ) ( not ( = ?auto_2281112 ?auto_2281121 ) ) ( not ( = ?auto_2281112 ?auto_2281127 ) ) ( not ( = ?auto_2281113 ?auto_2281114 ) ) ( not ( = ?auto_2281113 ?auto_2281111 ) ) ( not ( = ?auto_2281113 ?auto_2281115 ) ) ( not ( = ?auto_2281113 ?auto_2281117 ) ) ( not ( = ?auto_2281113 ?auto_2281116 ) ) ( not ( = ?auto_2281113 ?auto_2281118 ) ) ( not ( = ?auto_2281113 ?auto_2281119 ) ) ( not ( = ?auto_2281113 ?auto_2281120 ) ) ( not ( = ?auto_2281113 ?auto_2281121 ) ) ( not ( = ?auto_2281113 ?auto_2281127 ) ) ( not ( = ?auto_2281114 ?auto_2281111 ) ) ( not ( = ?auto_2281114 ?auto_2281115 ) ) ( not ( = ?auto_2281114 ?auto_2281117 ) ) ( not ( = ?auto_2281114 ?auto_2281116 ) ) ( not ( = ?auto_2281114 ?auto_2281118 ) ) ( not ( = ?auto_2281114 ?auto_2281119 ) ) ( not ( = ?auto_2281114 ?auto_2281120 ) ) ( not ( = ?auto_2281114 ?auto_2281121 ) ) ( not ( = ?auto_2281114 ?auto_2281127 ) ) ( not ( = ?auto_2281111 ?auto_2281115 ) ) ( not ( = ?auto_2281111 ?auto_2281117 ) ) ( not ( = ?auto_2281111 ?auto_2281116 ) ) ( not ( = ?auto_2281111 ?auto_2281118 ) ) ( not ( = ?auto_2281111 ?auto_2281119 ) ) ( not ( = ?auto_2281111 ?auto_2281120 ) ) ( not ( = ?auto_2281111 ?auto_2281121 ) ) ( not ( = ?auto_2281111 ?auto_2281127 ) ) ( not ( = ?auto_2281115 ?auto_2281117 ) ) ( not ( = ?auto_2281115 ?auto_2281116 ) ) ( not ( = ?auto_2281115 ?auto_2281118 ) ) ( not ( = ?auto_2281115 ?auto_2281119 ) ) ( not ( = ?auto_2281115 ?auto_2281120 ) ) ( not ( = ?auto_2281115 ?auto_2281121 ) ) ( not ( = ?auto_2281115 ?auto_2281127 ) ) ( not ( = ?auto_2281117 ?auto_2281116 ) ) ( not ( = ?auto_2281117 ?auto_2281118 ) ) ( not ( = ?auto_2281117 ?auto_2281119 ) ) ( not ( = ?auto_2281117 ?auto_2281120 ) ) ( not ( = ?auto_2281117 ?auto_2281121 ) ) ( not ( = ?auto_2281117 ?auto_2281127 ) ) ( not ( = ?auto_2281116 ?auto_2281118 ) ) ( not ( = ?auto_2281116 ?auto_2281119 ) ) ( not ( = ?auto_2281116 ?auto_2281120 ) ) ( not ( = ?auto_2281116 ?auto_2281121 ) ) ( not ( = ?auto_2281116 ?auto_2281127 ) ) ( not ( = ?auto_2281118 ?auto_2281119 ) ) ( not ( = ?auto_2281118 ?auto_2281120 ) ) ( not ( = ?auto_2281118 ?auto_2281121 ) ) ( not ( = ?auto_2281118 ?auto_2281127 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2281119 ?auto_2281120 ?auto_2281121 )
      ( MAKE-10CRATE-VERIFY ?auto_2281112 ?auto_2281113 ?auto_2281114 ?auto_2281111 ?auto_2281115 ?auto_2281117 ?auto_2281116 ?auto_2281118 ?auto_2281119 ?auto_2281120 ?auto_2281121 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2281238 - SURFACE
      ?auto_2281239 - SURFACE
      ?auto_2281240 - SURFACE
      ?auto_2281237 - SURFACE
      ?auto_2281241 - SURFACE
      ?auto_2281243 - SURFACE
      ?auto_2281242 - SURFACE
      ?auto_2281244 - SURFACE
      ?auto_2281245 - SURFACE
      ?auto_2281246 - SURFACE
      ?auto_2281247 - SURFACE
    )
    :vars
    (
      ?auto_2281248 - HOIST
      ?auto_2281251 - PLACE
      ?auto_2281250 - PLACE
      ?auto_2281252 - HOIST
      ?auto_2281249 - SURFACE
      ?auto_2281253 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2281248 ?auto_2281251 ) ( IS-CRATE ?auto_2281247 ) ( not ( = ?auto_2281246 ?auto_2281247 ) ) ( not ( = ?auto_2281245 ?auto_2281246 ) ) ( not ( = ?auto_2281245 ?auto_2281247 ) ) ( not ( = ?auto_2281250 ?auto_2281251 ) ) ( HOIST-AT ?auto_2281252 ?auto_2281250 ) ( not ( = ?auto_2281248 ?auto_2281252 ) ) ( AVAILABLE ?auto_2281252 ) ( SURFACE-AT ?auto_2281247 ?auto_2281250 ) ( ON ?auto_2281247 ?auto_2281249 ) ( CLEAR ?auto_2281247 ) ( not ( = ?auto_2281246 ?auto_2281249 ) ) ( not ( = ?auto_2281247 ?auto_2281249 ) ) ( not ( = ?auto_2281245 ?auto_2281249 ) ) ( TRUCK-AT ?auto_2281253 ?auto_2281251 ) ( SURFACE-AT ?auto_2281245 ?auto_2281251 ) ( CLEAR ?auto_2281245 ) ( LIFTING ?auto_2281248 ?auto_2281246 ) ( IS-CRATE ?auto_2281246 ) ( ON ?auto_2281239 ?auto_2281238 ) ( ON ?auto_2281240 ?auto_2281239 ) ( ON ?auto_2281237 ?auto_2281240 ) ( ON ?auto_2281241 ?auto_2281237 ) ( ON ?auto_2281243 ?auto_2281241 ) ( ON ?auto_2281242 ?auto_2281243 ) ( ON ?auto_2281244 ?auto_2281242 ) ( ON ?auto_2281245 ?auto_2281244 ) ( not ( = ?auto_2281238 ?auto_2281239 ) ) ( not ( = ?auto_2281238 ?auto_2281240 ) ) ( not ( = ?auto_2281238 ?auto_2281237 ) ) ( not ( = ?auto_2281238 ?auto_2281241 ) ) ( not ( = ?auto_2281238 ?auto_2281243 ) ) ( not ( = ?auto_2281238 ?auto_2281242 ) ) ( not ( = ?auto_2281238 ?auto_2281244 ) ) ( not ( = ?auto_2281238 ?auto_2281245 ) ) ( not ( = ?auto_2281238 ?auto_2281246 ) ) ( not ( = ?auto_2281238 ?auto_2281247 ) ) ( not ( = ?auto_2281238 ?auto_2281249 ) ) ( not ( = ?auto_2281239 ?auto_2281240 ) ) ( not ( = ?auto_2281239 ?auto_2281237 ) ) ( not ( = ?auto_2281239 ?auto_2281241 ) ) ( not ( = ?auto_2281239 ?auto_2281243 ) ) ( not ( = ?auto_2281239 ?auto_2281242 ) ) ( not ( = ?auto_2281239 ?auto_2281244 ) ) ( not ( = ?auto_2281239 ?auto_2281245 ) ) ( not ( = ?auto_2281239 ?auto_2281246 ) ) ( not ( = ?auto_2281239 ?auto_2281247 ) ) ( not ( = ?auto_2281239 ?auto_2281249 ) ) ( not ( = ?auto_2281240 ?auto_2281237 ) ) ( not ( = ?auto_2281240 ?auto_2281241 ) ) ( not ( = ?auto_2281240 ?auto_2281243 ) ) ( not ( = ?auto_2281240 ?auto_2281242 ) ) ( not ( = ?auto_2281240 ?auto_2281244 ) ) ( not ( = ?auto_2281240 ?auto_2281245 ) ) ( not ( = ?auto_2281240 ?auto_2281246 ) ) ( not ( = ?auto_2281240 ?auto_2281247 ) ) ( not ( = ?auto_2281240 ?auto_2281249 ) ) ( not ( = ?auto_2281237 ?auto_2281241 ) ) ( not ( = ?auto_2281237 ?auto_2281243 ) ) ( not ( = ?auto_2281237 ?auto_2281242 ) ) ( not ( = ?auto_2281237 ?auto_2281244 ) ) ( not ( = ?auto_2281237 ?auto_2281245 ) ) ( not ( = ?auto_2281237 ?auto_2281246 ) ) ( not ( = ?auto_2281237 ?auto_2281247 ) ) ( not ( = ?auto_2281237 ?auto_2281249 ) ) ( not ( = ?auto_2281241 ?auto_2281243 ) ) ( not ( = ?auto_2281241 ?auto_2281242 ) ) ( not ( = ?auto_2281241 ?auto_2281244 ) ) ( not ( = ?auto_2281241 ?auto_2281245 ) ) ( not ( = ?auto_2281241 ?auto_2281246 ) ) ( not ( = ?auto_2281241 ?auto_2281247 ) ) ( not ( = ?auto_2281241 ?auto_2281249 ) ) ( not ( = ?auto_2281243 ?auto_2281242 ) ) ( not ( = ?auto_2281243 ?auto_2281244 ) ) ( not ( = ?auto_2281243 ?auto_2281245 ) ) ( not ( = ?auto_2281243 ?auto_2281246 ) ) ( not ( = ?auto_2281243 ?auto_2281247 ) ) ( not ( = ?auto_2281243 ?auto_2281249 ) ) ( not ( = ?auto_2281242 ?auto_2281244 ) ) ( not ( = ?auto_2281242 ?auto_2281245 ) ) ( not ( = ?auto_2281242 ?auto_2281246 ) ) ( not ( = ?auto_2281242 ?auto_2281247 ) ) ( not ( = ?auto_2281242 ?auto_2281249 ) ) ( not ( = ?auto_2281244 ?auto_2281245 ) ) ( not ( = ?auto_2281244 ?auto_2281246 ) ) ( not ( = ?auto_2281244 ?auto_2281247 ) ) ( not ( = ?auto_2281244 ?auto_2281249 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2281245 ?auto_2281246 ?auto_2281247 )
      ( MAKE-10CRATE-VERIFY ?auto_2281238 ?auto_2281239 ?auto_2281240 ?auto_2281237 ?auto_2281241 ?auto_2281243 ?auto_2281242 ?auto_2281244 ?auto_2281245 ?auto_2281246 ?auto_2281247 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2281364 - SURFACE
      ?auto_2281365 - SURFACE
      ?auto_2281366 - SURFACE
      ?auto_2281363 - SURFACE
      ?auto_2281367 - SURFACE
      ?auto_2281369 - SURFACE
      ?auto_2281368 - SURFACE
      ?auto_2281370 - SURFACE
      ?auto_2281371 - SURFACE
      ?auto_2281372 - SURFACE
      ?auto_2281373 - SURFACE
    )
    :vars
    (
      ?auto_2281377 - HOIST
      ?auto_2281375 - PLACE
      ?auto_2281376 - PLACE
      ?auto_2281378 - HOIST
      ?auto_2281374 - SURFACE
      ?auto_2281379 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2281377 ?auto_2281375 ) ( IS-CRATE ?auto_2281373 ) ( not ( = ?auto_2281372 ?auto_2281373 ) ) ( not ( = ?auto_2281371 ?auto_2281372 ) ) ( not ( = ?auto_2281371 ?auto_2281373 ) ) ( not ( = ?auto_2281376 ?auto_2281375 ) ) ( HOIST-AT ?auto_2281378 ?auto_2281376 ) ( not ( = ?auto_2281377 ?auto_2281378 ) ) ( AVAILABLE ?auto_2281378 ) ( SURFACE-AT ?auto_2281373 ?auto_2281376 ) ( ON ?auto_2281373 ?auto_2281374 ) ( CLEAR ?auto_2281373 ) ( not ( = ?auto_2281372 ?auto_2281374 ) ) ( not ( = ?auto_2281373 ?auto_2281374 ) ) ( not ( = ?auto_2281371 ?auto_2281374 ) ) ( TRUCK-AT ?auto_2281379 ?auto_2281375 ) ( SURFACE-AT ?auto_2281371 ?auto_2281375 ) ( CLEAR ?auto_2281371 ) ( IS-CRATE ?auto_2281372 ) ( AVAILABLE ?auto_2281377 ) ( IN ?auto_2281372 ?auto_2281379 ) ( ON ?auto_2281365 ?auto_2281364 ) ( ON ?auto_2281366 ?auto_2281365 ) ( ON ?auto_2281363 ?auto_2281366 ) ( ON ?auto_2281367 ?auto_2281363 ) ( ON ?auto_2281369 ?auto_2281367 ) ( ON ?auto_2281368 ?auto_2281369 ) ( ON ?auto_2281370 ?auto_2281368 ) ( ON ?auto_2281371 ?auto_2281370 ) ( not ( = ?auto_2281364 ?auto_2281365 ) ) ( not ( = ?auto_2281364 ?auto_2281366 ) ) ( not ( = ?auto_2281364 ?auto_2281363 ) ) ( not ( = ?auto_2281364 ?auto_2281367 ) ) ( not ( = ?auto_2281364 ?auto_2281369 ) ) ( not ( = ?auto_2281364 ?auto_2281368 ) ) ( not ( = ?auto_2281364 ?auto_2281370 ) ) ( not ( = ?auto_2281364 ?auto_2281371 ) ) ( not ( = ?auto_2281364 ?auto_2281372 ) ) ( not ( = ?auto_2281364 ?auto_2281373 ) ) ( not ( = ?auto_2281364 ?auto_2281374 ) ) ( not ( = ?auto_2281365 ?auto_2281366 ) ) ( not ( = ?auto_2281365 ?auto_2281363 ) ) ( not ( = ?auto_2281365 ?auto_2281367 ) ) ( not ( = ?auto_2281365 ?auto_2281369 ) ) ( not ( = ?auto_2281365 ?auto_2281368 ) ) ( not ( = ?auto_2281365 ?auto_2281370 ) ) ( not ( = ?auto_2281365 ?auto_2281371 ) ) ( not ( = ?auto_2281365 ?auto_2281372 ) ) ( not ( = ?auto_2281365 ?auto_2281373 ) ) ( not ( = ?auto_2281365 ?auto_2281374 ) ) ( not ( = ?auto_2281366 ?auto_2281363 ) ) ( not ( = ?auto_2281366 ?auto_2281367 ) ) ( not ( = ?auto_2281366 ?auto_2281369 ) ) ( not ( = ?auto_2281366 ?auto_2281368 ) ) ( not ( = ?auto_2281366 ?auto_2281370 ) ) ( not ( = ?auto_2281366 ?auto_2281371 ) ) ( not ( = ?auto_2281366 ?auto_2281372 ) ) ( not ( = ?auto_2281366 ?auto_2281373 ) ) ( not ( = ?auto_2281366 ?auto_2281374 ) ) ( not ( = ?auto_2281363 ?auto_2281367 ) ) ( not ( = ?auto_2281363 ?auto_2281369 ) ) ( not ( = ?auto_2281363 ?auto_2281368 ) ) ( not ( = ?auto_2281363 ?auto_2281370 ) ) ( not ( = ?auto_2281363 ?auto_2281371 ) ) ( not ( = ?auto_2281363 ?auto_2281372 ) ) ( not ( = ?auto_2281363 ?auto_2281373 ) ) ( not ( = ?auto_2281363 ?auto_2281374 ) ) ( not ( = ?auto_2281367 ?auto_2281369 ) ) ( not ( = ?auto_2281367 ?auto_2281368 ) ) ( not ( = ?auto_2281367 ?auto_2281370 ) ) ( not ( = ?auto_2281367 ?auto_2281371 ) ) ( not ( = ?auto_2281367 ?auto_2281372 ) ) ( not ( = ?auto_2281367 ?auto_2281373 ) ) ( not ( = ?auto_2281367 ?auto_2281374 ) ) ( not ( = ?auto_2281369 ?auto_2281368 ) ) ( not ( = ?auto_2281369 ?auto_2281370 ) ) ( not ( = ?auto_2281369 ?auto_2281371 ) ) ( not ( = ?auto_2281369 ?auto_2281372 ) ) ( not ( = ?auto_2281369 ?auto_2281373 ) ) ( not ( = ?auto_2281369 ?auto_2281374 ) ) ( not ( = ?auto_2281368 ?auto_2281370 ) ) ( not ( = ?auto_2281368 ?auto_2281371 ) ) ( not ( = ?auto_2281368 ?auto_2281372 ) ) ( not ( = ?auto_2281368 ?auto_2281373 ) ) ( not ( = ?auto_2281368 ?auto_2281374 ) ) ( not ( = ?auto_2281370 ?auto_2281371 ) ) ( not ( = ?auto_2281370 ?auto_2281372 ) ) ( not ( = ?auto_2281370 ?auto_2281373 ) ) ( not ( = ?auto_2281370 ?auto_2281374 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2281371 ?auto_2281372 ?auto_2281373 )
      ( MAKE-10CRATE-VERIFY ?auto_2281364 ?auto_2281365 ?auto_2281366 ?auto_2281363 ?auto_2281367 ?auto_2281369 ?auto_2281368 ?auto_2281370 ?auto_2281371 ?auto_2281372 ?auto_2281373 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2288627 - SURFACE
      ?auto_2288628 - SURFACE
      ?auto_2288629 - SURFACE
      ?auto_2288626 - SURFACE
      ?auto_2288630 - SURFACE
      ?auto_2288632 - SURFACE
      ?auto_2288631 - SURFACE
      ?auto_2288633 - SURFACE
      ?auto_2288634 - SURFACE
      ?auto_2288635 - SURFACE
      ?auto_2288636 - SURFACE
      ?auto_2288637 - SURFACE
    )
    :vars
    (
      ?auto_2288639 - HOIST
      ?auto_2288638 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2288639 ?auto_2288638 ) ( SURFACE-AT ?auto_2288636 ?auto_2288638 ) ( CLEAR ?auto_2288636 ) ( LIFTING ?auto_2288639 ?auto_2288637 ) ( IS-CRATE ?auto_2288637 ) ( not ( = ?auto_2288636 ?auto_2288637 ) ) ( ON ?auto_2288628 ?auto_2288627 ) ( ON ?auto_2288629 ?auto_2288628 ) ( ON ?auto_2288626 ?auto_2288629 ) ( ON ?auto_2288630 ?auto_2288626 ) ( ON ?auto_2288632 ?auto_2288630 ) ( ON ?auto_2288631 ?auto_2288632 ) ( ON ?auto_2288633 ?auto_2288631 ) ( ON ?auto_2288634 ?auto_2288633 ) ( ON ?auto_2288635 ?auto_2288634 ) ( ON ?auto_2288636 ?auto_2288635 ) ( not ( = ?auto_2288627 ?auto_2288628 ) ) ( not ( = ?auto_2288627 ?auto_2288629 ) ) ( not ( = ?auto_2288627 ?auto_2288626 ) ) ( not ( = ?auto_2288627 ?auto_2288630 ) ) ( not ( = ?auto_2288627 ?auto_2288632 ) ) ( not ( = ?auto_2288627 ?auto_2288631 ) ) ( not ( = ?auto_2288627 ?auto_2288633 ) ) ( not ( = ?auto_2288627 ?auto_2288634 ) ) ( not ( = ?auto_2288627 ?auto_2288635 ) ) ( not ( = ?auto_2288627 ?auto_2288636 ) ) ( not ( = ?auto_2288627 ?auto_2288637 ) ) ( not ( = ?auto_2288628 ?auto_2288629 ) ) ( not ( = ?auto_2288628 ?auto_2288626 ) ) ( not ( = ?auto_2288628 ?auto_2288630 ) ) ( not ( = ?auto_2288628 ?auto_2288632 ) ) ( not ( = ?auto_2288628 ?auto_2288631 ) ) ( not ( = ?auto_2288628 ?auto_2288633 ) ) ( not ( = ?auto_2288628 ?auto_2288634 ) ) ( not ( = ?auto_2288628 ?auto_2288635 ) ) ( not ( = ?auto_2288628 ?auto_2288636 ) ) ( not ( = ?auto_2288628 ?auto_2288637 ) ) ( not ( = ?auto_2288629 ?auto_2288626 ) ) ( not ( = ?auto_2288629 ?auto_2288630 ) ) ( not ( = ?auto_2288629 ?auto_2288632 ) ) ( not ( = ?auto_2288629 ?auto_2288631 ) ) ( not ( = ?auto_2288629 ?auto_2288633 ) ) ( not ( = ?auto_2288629 ?auto_2288634 ) ) ( not ( = ?auto_2288629 ?auto_2288635 ) ) ( not ( = ?auto_2288629 ?auto_2288636 ) ) ( not ( = ?auto_2288629 ?auto_2288637 ) ) ( not ( = ?auto_2288626 ?auto_2288630 ) ) ( not ( = ?auto_2288626 ?auto_2288632 ) ) ( not ( = ?auto_2288626 ?auto_2288631 ) ) ( not ( = ?auto_2288626 ?auto_2288633 ) ) ( not ( = ?auto_2288626 ?auto_2288634 ) ) ( not ( = ?auto_2288626 ?auto_2288635 ) ) ( not ( = ?auto_2288626 ?auto_2288636 ) ) ( not ( = ?auto_2288626 ?auto_2288637 ) ) ( not ( = ?auto_2288630 ?auto_2288632 ) ) ( not ( = ?auto_2288630 ?auto_2288631 ) ) ( not ( = ?auto_2288630 ?auto_2288633 ) ) ( not ( = ?auto_2288630 ?auto_2288634 ) ) ( not ( = ?auto_2288630 ?auto_2288635 ) ) ( not ( = ?auto_2288630 ?auto_2288636 ) ) ( not ( = ?auto_2288630 ?auto_2288637 ) ) ( not ( = ?auto_2288632 ?auto_2288631 ) ) ( not ( = ?auto_2288632 ?auto_2288633 ) ) ( not ( = ?auto_2288632 ?auto_2288634 ) ) ( not ( = ?auto_2288632 ?auto_2288635 ) ) ( not ( = ?auto_2288632 ?auto_2288636 ) ) ( not ( = ?auto_2288632 ?auto_2288637 ) ) ( not ( = ?auto_2288631 ?auto_2288633 ) ) ( not ( = ?auto_2288631 ?auto_2288634 ) ) ( not ( = ?auto_2288631 ?auto_2288635 ) ) ( not ( = ?auto_2288631 ?auto_2288636 ) ) ( not ( = ?auto_2288631 ?auto_2288637 ) ) ( not ( = ?auto_2288633 ?auto_2288634 ) ) ( not ( = ?auto_2288633 ?auto_2288635 ) ) ( not ( = ?auto_2288633 ?auto_2288636 ) ) ( not ( = ?auto_2288633 ?auto_2288637 ) ) ( not ( = ?auto_2288634 ?auto_2288635 ) ) ( not ( = ?auto_2288634 ?auto_2288636 ) ) ( not ( = ?auto_2288634 ?auto_2288637 ) ) ( not ( = ?auto_2288635 ?auto_2288636 ) ) ( not ( = ?auto_2288635 ?auto_2288637 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2288636 ?auto_2288637 )
      ( MAKE-11CRATE-VERIFY ?auto_2288627 ?auto_2288628 ?auto_2288629 ?auto_2288626 ?auto_2288630 ?auto_2288632 ?auto_2288631 ?auto_2288633 ?auto_2288634 ?auto_2288635 ?auto_2288636 ?auto_2288637 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2288736 - SURFACE
      ?auto_2288737 - SURFACE
      ?auto_2288738 - SURFACE
      ?auto_2288735 - SURFACE
      ?auto_2288739 - SURFACE
      ?auto_2288741 - SURFACE
      ?auto_2288740 - SURFACE
      ?auto_2288742 - SURFACE
      ?auto_2288743 - SURFACE
      ?auto_2288744 - SURFACE
      ?auto_2288745 - SURFACE
      ?auto_2288746 - SURFACE
    )
    :vars
    (
      ?auto_2288748 - HOIST
      ?auto_2288747 - PLACE
      ?auto_2288749 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2288748 ?auto_2288747 ) ( SURFACE-AT ?auto_2288745 ?auto_2288747 ) ( CLEAR ?auto_2288745 ) ( IS-CRATE ?auto_2288746 ) ( not ( = ?auto_2288745 ?auto_2288746 ) ) ( TRUCK-AT ?auto_2288749 ?auto_2288747 ) ( AVAILABLE ?auto_2288748 ) ( IN ?auto_2288746 ?auto_2288749 ) ( ON ?auto_2288745 ?auto_2288744 ) ( not ( = ?auto_2288744 ?auto_2288745 ) ) ( not ( = ?auto_2288744 ?auto_2288746 ) ) ( ON ?auto_2288737 ?auto_2288736 ) ( ON ?auto_2288738 ?auto_2288737 ) ( ON ?auto_2288735 ?auto_2288738 ) ( ON ?auto_2288739 ?auto_2288735 ) ( ON ?auto_2288741 ?auto_2288739 ) ( ON ?auto_2288740 ?auto_2288741 ) ( ON ?auto_2288742 ?auto_2288740 ) ( ON ?auto_2288743 ?auto_2288742 ) ( ON ?auto_2288744 ?auto_2288743 ) ( not ( = ?auto_2288736 ?auto_2288737 ) ) ( not ( = ?auto_2288736 ?auto_2288738 ) ) ( not ( = ?auto_2288736 ?auto_2288735 ) ) ( not ( = ?auto_2288736 ?auto_2288739 ) ) ( not ( = ?auto_2288736 ?auto_2288741 ) ) ( not ( = ?auto_2288736 ?auto_2288740 ) ) ( not ( = ?auto_2288736 ?auto_2288742 ) ) ( not ( = ?auto_2288736 ?auto_2288743 ) ) ( not ( = ?auto_2288736 ?auto_2288744 ) ) ( not ( = ?auto_2288736 ?auto_2288745 ) ) ( not ( = ?auto_2288736 ?auto_2288746 ) ) ( not ( = ?auto_2288737 ?auto_2288738 ) ) ( not ( = ?auto_2288737 ?auto_2288735 ) ) ( not ( = ?auto_2288737 ?auto_2288739 ) ) ( not ( = ?auto_2288737 ?auto_2288741 ) ) ( not ( = ?auto_2288737 ?auto_2288740 ) ) ( not ( = ?auto_2288737 ?auto_2288742 ) ) ( not ( = ?auto_2288737 ?auto_2288743 ) ) ( not ( = ?auto_2288737 ?auto_2288744 ) ) ( not ( = ?auto_2288737 ?auto_2288745 ) ) ( not ( = ?auto_2288737 ?auto_2288746 ) ) ( not ( = ?auto_2288738 ?auto_2288735 ) ) ( not ( = ?auto_2288738 ?auto_2288739 ) ) ( not ( = ?auto_2288738 ?auto_2288741 ) ) ( not ( = ?auto_2288738 ?auto_2288740 ) ) ( not ( = ?auto_2288738 ?auto_2288742 ) ) ( not ( = ?auto_2288738 ?auto_2288743 ) ) ( not ( = ?auto_2288738 ?auto_2288744 ) ) ( not ( = ?auto_2288738 ?auto_2288745 ) ) ( not ( = ?auto_2288738 ?auto_2288746 ) ) ( not ( = ?auto_2288735 ?auto_2288739 ) ) ( not ( = ?auto_2288735 ?auto_2288741 ) ) ( not ( = ?auto_2288735 ?auto_2288740 ) ) ( not ( = ?auto_2288735 ?auto_2288742 ) ) ( not ( = ?auto_2288735 ?auto_2288743 ) ) ( not ( = ?auto_2288735 ?auto_2288744 ) ) ( not ( = ?auto_2288735 ?auto_2288745 ) ) ( not ( = ?auto_2288735 ?auto_2288746 ) ) ( not ( = ?auto_2288739 ?auto_2288741 ) ) ( not ( = ?auto_2288739 ?auto_2288740 ) ) ( not ( = ?auto_2288739 ?auto_2288742 ) ) ( not ( = ?auto_2288739 ?auto_2288743 ) ) ( not ( = ?auto_2288739 ?auto_2288744 ) ) ( not ( = ?auto_2288739 ?auto_2288745 ) ) ( not ( = ?auto_2288739 ?auto_2288746 ) ) ( not ( = ?auto_2288741 ?auto_2288740 ) ) ( not ( = ?auto_2288741 ?auto_2288742 ) ) ( not ( = ?auto_2288741 ?auto_2288743 ) ) ( not ( = ?auto_2288741 ?auto_2288744 ) ) ( not ( = ?auto_2288741 ?auto_2288745 ) ) ( not ( = ?auto_2288741 ?auto_2288746 ) ) ( not ( = ?auto_2288740 ?auto_2288742 ) ) ( not ( = ?auto_2288740 ?auto_2288743 ) ) ( not ( = ?auto_2288740 ?auto_2288744 ) ) ( not ( = ?auto_2288740 ?auto_2288745 ) ) ( not ( = ?auto_2288740 ?auto_2288746 ) ) ( not ( = ?auto_2288742 ?auto_2288743 ) ) ( not ( = ?auto_2288742 ?auto_2288744 ) ) ( not ( = ?auto_2288742 ?auto_2288745 ) ) ( not ( = ?auto_2288742 ?auto_2288746 ) ) ( not ( = ?auto_2288743 ?auto_2288744 ) ) ( not ( = ?auto_2288743 ?auto_2288745 ) ) ( not ( = ?auto_2288743 ?auto_2288746 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2288744 ?auto_2288745 ?auto_2288746 )
      ( MAKE-11CRATE-VERIFY ?auto_2288736 ?auto_2288737 ?auto_2288738 ?auto_2288735 ?auto_2288739 ?auto_2288741 ?auto_2288740 ?auto_2288742 ?auto_2288743 ?auto_2288744 ?auto_2288745 ?auto_2288746 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2288857 - SURFACE
      ?auto_2288858 - SURFACE
      ?auto_2288859 - SURFACE
      ?auto_2288856 - SURFACE
      ?auto_2288860 - SURFACE
      ?auto_2288862 - SURFACE
      ?auto_2288861 - SURFACE
      ?auto_2288863 - SURFACE
      ?auto_2288864 - SURFACE
      ?auto_2288865 - SURFACE
      ?auto_2288866 - SURFACE
      ?auto_2288867 - SURFACE
    )
    :vars
    (
      ?auto_2288870 - HOIST
      ?auto_2288871 - PLACE
      ?auto_2288869 - TRUCK
      ?auto_2288868 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2288870 ?auto_2288871 ) ( SURFACE-AT ?auto_2288866 ?auto_2288871 ) ( CLEAR ?auto_2288866 ) ( IS-CRATE ?auto_2288867 ) ( not ( = ?auto_2288866 ?auto_2288867 ) ) ( AVAILABLE ?auto_2288870 ) ( IN ?auto_2288867 ?auto_2288869 ) ( ON ?auto_2288866 ?auto_2288865 ) ( not ( = ?auto_2288865 ?auto_2288866 ) ) ( not ( = ?auto_2288865 ?auto_2288867 ) ) ( TRUCK-AT ?auto_2288869 ?auto_2288868 ) ( not ( = ?auto_2288868 ?auto_2288871 ) ) ( ON ?auto_2288858 ?auto_2288857 ) ( ON ?auto_2288859 ?auto_2288858 ) ( ON ?auto_2288856 ?auto_2288859 ) ( ON ?auto_2288860 ?auto_2288856 ) ( ON ?auto_2288862 ?auto_2288860 ) ( ON ?auto_2288861 ?auto_2288862 ) ( ON ?auto_2288863 ?auto_2288861 ) ( ON ?auto_2288864 ?auto_2288863 ) ( ON ?auto_2288865 ?auto_2288864 ) ( not ( = ?auto_2288857 ?auto_2288858 ) ) ( not ( = ?auto_2288857 ?auto_2288859 ) ) ( not ( = ?auto_2288857 ?auto_2288856 ) ) ( not ( = ?auto_2288857 ?auto_2288860 ) ) ( not ( = ?auto_2288857 ?auto_2288862 ) ) ( not ( = ?auto_2288857 ?auto_2288861 ) ) ( not ( = ?auto_2288857 ?auto_2288863 ) ) ( not ( = ?auto_2288857 ?auto_2288864 ) ) ( not ( = ?auto_2288857 ?auto_2288865 ) ) ( not ( = ?auto_2288857 ?auto_2288866 ) ) ( not ( = ?auto_2288857 ?auto_2288867 ) ) ( not ( = ?auto_2288858 ?auto_2288859 ) ) ( not ( = ?auto_2288858 ?auto_2288856 ) ) ( not ( = ?auto_2288858 ?auto_2288860 ) ) ( not ( = ?auto_2288858 ?auto_2288862 ) ) ( not ( = ?auto_2288858 ?auto_2288861 ) ) ( not ( = ?auto_2288858 ?auto_2288863 ) ) ( not ( = ?auto_2288858 ?auto_2288864 ) ) ( not ( = ?auto_2288858 ?auto_2288865 ) ) ( not ( = ?auto_2288858 ?auto_2288866 ) ) ( not ( = ?auto_2288858 ?auto_2288867 ) ) ( not ( = ?auto_2288859 ?auto_2288856 ) ) ( not ( = ?auto_2288859 ?auto_2288860 ) ) ( not ( = ?auto_2288859 ?auto_2288862 ) ) ( not ( = ?auto_2288859 ?auto_2288861 ) ) ( not ( = ?auto_2288859 ?auto_2288863 ) ) ( not ( = ?auto_2288859 ?auto_2288864 ) ) ( not ( = ?auto_2288859 ?auto_2288865 ) ) ( not ( = ?auto_2288859 ?auto_2288866 ) ) ( not ( = ?auto_2288859 ?auto_2288867 ) ) ( not ( = ?auto_2288856 ?auto_2288860 ) ) ( not ( = ?auto_2288856 ?auto_2288862 ) ) ( not ( = ?auto_2288856 ?auto_2288861 ) ) ( not ( = ?auto_2288856 ?auto_2288863 ) ) ( not ( = ?auto_2288856 ?auto_2288864 ) ) ( not ( = ?auto_2288856 ?auto_2288865 ) ) ( not ( = ?auto_2288856 ?auto_2288866 ) ) ( not ( = ?auto_2288856 ?auto_2288867 ) ) ( not ( = ?auto_2288860 ?auto_2288862 ) ) ( not ( = ?auto_2288860 ?auto_2288861 ) ) ( not ( = ?auto_2288860 ?auto_2288863 ) ) ( not ( = ?auto_2288860 ?auto_2288864 ) ) ( not ( = ?auto_2288860 ?auto_2288865 ) ) ( not ( = ?auto_2288860 ?auto_2288866 ) ) ( not ( = ?auto_2288860 ?auto_2288867 ) ) ( not ( = ?auto_2288862 ?auto_2288861 ) ) ( not ( = ?auto_2288862 ?auto_2288863 ) ) ( not ( = ?auto_2288862 ?auto_2288864 ) ) ( not ( = ?auto_2288862 ?auto_2288865 ) ) ( not ( = ?auto_2288862 ?auto_2288866 ) ) ( not ( = ?auto_2288862 ?auto_2288867 ) ) ( not ( = ?auto_2288861 ?auto_2288863 ) ) ( not ( = ?auto_2288861 ?auto_2288864 ) ) ( not ( = ?auto_2288861 ?auto_2288865 ) ) ( not ( = ?auto_2288861 ?auto_2288866 ) ) ( not ( = ?auto_2288861 ?auto_2288867 ) ) ( not ( = ?auto_2288863 ?auto_2288864 ) ) ( not ( = ?auto_2288863 ?auto_2288865 ) ) ( not ( = ?auto_2288863 ?auto_2288866 ) ) ( not ( = ?auto_2288863 ?auto_2288867 ) ) ( not ( = ?auto_2288864 ?auto_2288865 ) ) ( not ( = ?auto_2288864 ?auto_2288866 ) ) ( not ( = ?auto_2288864 ?auto_2288867 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2288865 ?auto_2288866 ?auto_2288867 )
      ( MAKE-11CRATE-VERIFY ?auto_2288857 ?auto_2288858 ?auto_2288859 ?auto_2288856 ?auto_2288860 ?auto_2288862 ?auto_2288861 ?auto_2288863 ?auto_2288864 ?auto_2288865 ?auto_2288866 ?auto_2288867 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2288989 - SURFACE
      ?auto_2288990 - SURFACE
      ?auto_2288991 - SURFACE
      ?auto_2288988 - SURFACE
      ?auto_2288992 - SURFACE
      ?auto_2288994 - SURFACE
      ?auto_2288993 - SURFACE
      ?auto_2288995 - SURFACE
      ?auto_2288996 - SURFACE
      ?auto_2288997 - SURFACE
      ?auto_2288998 - SURFACE
      ?auto_2288999 - SURFACE
    )
    :vars
    (
      ?auto_2289001 - HOIST
      ?auto_2289003 - PLACE
      ?auto_2289000 - TRUCK
      ?auto_2289004 - PLACE
      ?auto_2289002 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2289001 ?auto_2289003 ) ( SURFACE-AT ?auto_2288998 ?auto_2289003 ) ( CLEAR ?auto_2288998 ) ( IS-CRATE ?auto_2288999 ) ( not ( = ?auto_2288998 ?auto_2288999 ) ) ( AVAILABLE ?auto_2289001 ) ( ON ?auto_2288998 ?auto_2288997 ) ( not ( = ?auto_2288997 ?auto_2288998 ) ) ( not ( = ?auto_2288997 ?auto_2288999 ) ) ( TRUCK-AT ?auto_2289000 ?auto_2289004 ) ( not ( = ?auto_2289004 ?auto_2289003 ) ) ( HOIST-AT ?auto_2289002 ?auto_2289004 ) ( LIFTING ?auto_2289002 ?auto_2288999 ) ( not ( = ?auto_2289001 ?auto_2289002 ) ) ( ON ?auto_2288990 ?auto_2288989 ) ( ON ?auto_2288991 ?auto_2288990 ) ( ON ?auto_2288988 ?auto_2288991 ) ( ON ?auto_2288992 ?auto_2288988 ) ( ON ?auto_2288994 ?auto_2288992 ) ( ON ?auto_2288993 ?auto_2288994 ) ( ON ?auto_2288995 ?auto_2288993 ) ( ON ?auto_2288996 ?auto_2288995 ) ( ON ?auto_2288997 ?auto_2288996 ) ( not ( = ?auto_2288989 ?auto_2288990 ) ) ( not ( = ?auto_2288989 ?auto_2288991 ) ) ( not ( = ?auto_2288989 ?auto_2288988 ) ) ( not ( = ?auto_2288989 ?auto_2288992 ) ) ( not ( = ?auto_2288989 ?auto_2288994 ) ) ( not ( = ?auto_2288989 ?auto_2288993 ) ) ( not ( = ?auto_2288989 ?auto_2288995 ) ) ( not ( = ?auto_2288989 ?auto_2288996 ) ) ( not ( = ?auto_2288989 ?auto_2288997 ) ) ( not ( = ?auto_2288989 ?auto_2288998 ) ) ( not ( = ?auto_2288989 ?auto_2288999 ) ) ( not ( = ?auto_2288990 ?auto_2288991 ) ) ( not ( = ?auto_2288990 ?auto_2288988 ) ) ( not ( = ?auto_2288990 ?auto_2288992 ) ) ( not ( = ?auto_2288990 ?auto_2288994 ) ) ( not ( = ?auto_2288990 ?auto_2288993 ) ) ( not ( = ?auto_2288990 ?auto_2288995 ) ) ( not ( = ?auto_2288990 ?auto_2288996 ) ) ( not ( = ?auto_2288990 ?auto_2288997 ) ) ( not ( = ?auto_2288990 ?auto_2288998 ) ) ( not ( = ?auto_2288990 ?auto_2288999 ) ) ( not ( = ?auto_2288991 ?auto_2288988 ) ) ( not ( = ?auto_2288991 ?auto_2288992 ) ) ( not ( = ?auto_2288991 ?auto_2288994 ) ) ( not ( = ?auto_2288991 ?auto_2288993 ) ) ( not ( = ?auto_2288991 ?auto_2288995 ) ) ( not ( = ?auto_2288991 ?auto_2288996 ) ) ( not ( = ?auto_2288991 ?auto_2288997 ) ) ( not ( = ?auto_2288991 ?auto_2288998 ) ) ( not ( = ?auto_2288991 ?auto_2288999 ) ) ( not ( = ?auto_2288988 ?auto_2288992 ) ) ( not ( = ?auto_2288988 ?auto_2288994 ) ) ( not ( = ?auto_2288988 ?auto_2288993 ) ) ( not ( = ?auto_2288988 ?auto_2288995 ) ) ( not ( = ?auto_2288988 ?auto_2288996 ) ) ( not ( = ?auto_2288988 ?auto_2288997 ) ) ( not ( = ?auto_2288988 ?auto_2288998 ) ) ( not ( = ?auto_2288988 ?auto_2288999 ) ) ( not ( = ?auto_2288992 ?auto_2288994 ) ) ( not ( = ?auto_2288992 ?auto_2288993 ) ) ( not ( = ?auto_2288992 ?auto_2288995 ) ) ( not ( = ?auto_2288992 ?auto_2288996 ) ) ( not ( = ?auto_2288992 ?auto_2288997 ) ) ( not ( = ?auto_2288992 ?auto_2288998 ) ) ( not ( = ?auto_2288992 ?auto_2288999 ) ) ( not ( = ?auto_2288994 ?auto_2288993 ) ) ( not ( = ?auto_2288994 ?auto_2288995 ) ) ( not ( = ?auto_2288994 ?auto_2288996 ) ) ( not ( = ?auto_2288994 ?auto_2288997 ) ) ( not ( = ?auto_2288994 ?auto_2288998 ) ) ( not ( = ?auto_2288994 ?auto_2288999 ) ) ( not ( = ?auto_2288993 ?auto_2288995 ) ) ( not ( = ?auto_2288993 ?auto_2288996 ) ) ( not ( = ?auto_2288993 ?auto_2288997 ) ) ( not ( = ?auto_2288993 ?auto_2288998 ) ) ( not ( = ?auto_2288993 ?auto_2288999 ) ) ( not ( = ?auto_2288995 ?auto_2288996 ) ) ( not ( = ?auto_2288995 ?auto_2288997 ) ) ( not ( = ?auto_2288995 ?auto_2288998 ) ) ( not ( = ?auto_2288995 ?auto_2288999 ) ) ( not ( = ?auto_2288996 ?auto_2288997 ) ) ( not ( = ?auto_2288996 ?auto_2288998 ) ) ( not ( = ?auto_2288996 ?auto_2288999 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2288997 ?auto_2288998 ?auto_2288999 )
      ( MAKE-11CRATE-VERIFY ?auto_2288989 ?auto_2288990 ?auto_2288991 ?auto_2288988 ?auto_2288992 ?auto_2288994 ?auto_2288993 ?auto_2288995 ?auto_2288996 ?auto_2288997 ?auto_2288998 ?auto_2288999 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2289132 - SURFACE
      ?auto_2289133 - SURFACE
      ?auto_2289134 - SURFACE
      ?auto_2289131 - SURFACE
      ?auto_2289135 - SURFACE
      ?auto_2289137 - SURFACE
      ?auto_2289136 - SURFACE
      ?auto_2289138 - SURFACE
      ?auto_2289139 - SURFACE
      ?auto_2289140 - SURFACE
      ?auto_2289141 - SURFACE
      ?auto_2289142 - SURFACE
    )
    :vars
    (
      ?auto_2289144 - HOIST
      ?auto_2289148 - PLACE
      ?auto_2289145 - TRUCK
      ?auto_2289147 - PLACE
      ?auto_2289143 - HOIST
      ?auto_2289146 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2289144 ?auto_2289148 ) ( SURFACE-AT ?auto_2289141 ?auto_2289148 ) ( CLEAR ?auto_2289141 ) ( IS-CRATE ?auto_2289142 ) ( not ( = ?auto_2289141 ?auto_2289142 ) ) ( AVAILABLE ?auto_2289144 ) ( ON ?auto_2289141 ?auto_2289140 ) ( not ( = ?auto_2289140 ?auto_2289141 ) ) ( not ( = ?auto_2289140 ?auto_2289142 ) ) ( TRUCK-AT ?auto_2289145 ?auto_2289147 ) ( not ( = ?auto_2289147 ?auto_2289148 ) ) ( HOIST-AT ?auto_2289143 ?auto_2289147 ) ( not ( = ?auto_2289144 ?auto_2289143 ) ) ( AVAILABLE ?auto_2289143 ) ( SURFACE-AT ?auto_2289142 ?auto_2289147 ) ( ON ?auto_2289142 ?auto_2289146 ) ( CLEAR ?auto_2289142 ) ( not ( = ?auto_2289141 ?auto_2289146 ) ) ( not ( = ?auto_2289142 ?auto_2289146 ) ) ( not ( = ?auto_2289140 ?auto_2289146 ) ) ( ON ?auto_2289133 ?auto_2289132 ) ( ON ?auto_2289134 ?auto_2289133 ) ( ON ?auto_2289131 ?auto_2289134 ) ( ON ?auto_2289135 ?auto_2289131 ) ( ON ?auto_2289137 ?auto_2289135 ) ( ON ?auto_2289136 ?auto_2289137 ) ( ON ?auto_2289138 ?auto_2289136 ) ( ON ?auto_2289139 ?auto_2289138 ) ( ON ?auto_2289140 ?auto_2289139 ) ( not ( = ?auto_2289132 ?auto_2289133 ) ) ( not ( = ?auto_2289132 ?auto_2289134 ) ) ( not ( = ?auto_2289132 ?auto_2289131 ) ) ( not ( = ?auto_2289132 ?auto_2289135 ) ) ( not ( = ?auto_2289132 ?auto_2289137 ) ) ( not ( = ?auto_2289132 ?auto_2289136 ) ) ( not ( = ?auto_2289132 ?auto_2289138 ) ) ( not ( = ?auto_2289132 ?auto_2289139 ) ) ( not ( = ?auto_2289132 ?auto_2289140 ) ) ( not ( = ?auto_2289132 ?auto_2289141 ) ) ( not ( = ?auto_2289132 ?auto_2289142 ) ) ( not ( = ?auto_2289132 ?auto_2289146 ) ) ( not ( = ?auto_2289133 ?auto_2289134 ) ) ( not ( = ?auto_2289133 ?auto_2289131 ) ) ( not ( = ?auto_2289133 ?auto_2289135 ) ) ( not ( = ?auto_2289133 ?auto_2289137 ) ) ( not ( = ?auto_2289133 ?auto_2289136 ) ) ( not ( = ?auto_2289133 ?auto_2289138 ) ) ( not ( = ?auto_2289133 ?auto_2289139 ) ) ( not ( = ?auto_2289133 ?auto_2289140 ) ) ( not ( = ?auto_2289133 ?auto_2289141 ) ) ( not ( = ?auto_2289133 ?auto_2289142 ) ) ( not ( = ?auto_2289133 ?auto_2289146 ) ) ( not ( = ?auto_2289134 ?auto_2289131 ) ) ( not ( = ?auto_2289134 ?auto_2289135 ) ) ( not ( = ?auto_2289134 ?auto_2289137 ) ) ( not ( = ?auto_2289134 ?auto_2289136 ) ) ( not ( = ?auto_2289134 ?auto_2289138 ) ) ( not ( = ?auto_2289134 ?auto_2289139 ) ) ( not ( = ?auto_2289134 ?auto_2289140 ) ) ( not ( = ?auto_2289134 ?auto_2289141 ) ) ( not ( = ?auto_2289134 ?auto_2289142 ) ) ( not ( = ?auto_2289134 ?auto_2289146 ) ) ( not ( = ?auto_2289131 ?auto_2289135 ) ) ( not ( = ?auto_2289131 ?auto_2289137 ) ) ( not ( = ?auto_2289131 ?auto_2289136 ) ) ( not ( = ?auto_2289131 ?auto_2289138 ) ) ( not ( = ?auto_2289131 ?auto_2289139 ) ) ( not ( = ?auto_2289131 ?auto_2289140 ) ) ( not ( = ?auto_2289131 ?auto_2289141 ) ) ( not ( = ?auto_2289131 ?auto_2289142 ) ) ( not ( = ?auto_2289131 ?auto_2289146 ) ) ( not ( = ?auto_2289135 ?auto_2289137 ) ) ( not ( = ?auto_2289135 ?auto_2289136 ) ) ( not ( = ?auto_2289135 ?auto_2289138 ) ) ( not ( = ?auto_2289135 ?auto_2289139 ) ) ( not ( = ?auto_2289135 ?auto_2289140 ) ) ( not ( = ?auto_2289135 ?auto_2289141 ) ) ( not ( = ?auto_2289135 ?auto_2289142 ) ) ( not ( = ?auto_2289135 ?auto_2289146 ) ) ( not ( = ?auto_2289137 ?auto_2289136 ) ) ( not ( = ?auto_2289137 ?auto_2289138 ) ) ( not ( = ?auto_2289137 ?auto_2289139 ) ) ( not ( = ?auto_2289137 ?auto_2289140 ) ) ( not ( = ?auto_2289137 ?auto_2289141 ) ) ( not ( = ?auto_2289137 ?auto_2289142 ) ) ( not ( = ?auto_2289137 ?auto_2289146 ) ) ( not ( = ?auto_2289136 ?auto_2289138 ) ) ( not ( = ?auto_2289136 ?auto_2289139 ) ) ( not ( = ?auto_2289136 ?auto_2289140 ) ) ( not ( = ?auto_2289136 ?auto_2289141 ) ) ( not ( = ?auto_2289136 ?auto_2289142 ) ) ( not ( = ?auto_2289136 ?auto_2289146 ) ) ( not ( = ?auto_2289138 ?auto_2289139 ) ) ( not ( = ?auto_2289138 ?auto_2289140 ) ) ( not ( = ?auto_2289138 ?auto_2289141 ) ) ( not ( = ?auto_2289138 ?auto_2289142 ) ) ( not ( = ?auto_2289138 ?auto_2289146 ) ) ( not ( = ?auto_2289139 ?auto_2289140 ) ) ( not ( = ?auto_2289139 ?auto_2289141 ) ) ( not ( = ?auto_2289139 ?auto_2289142 ) ) ( not ( = ?auto_2289139 ?auto_2289146 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2289140 ?auto_2289141 ?auto_2289142 )
      ( MAKE-11CRATE-VERIFY ?auto_2289132 ?auto_2289133 ?auto_2289134 ?auto_2289131 ?auto_2289135 ?auto_2289137 ?auto_2289136 ?auto_2289138 ?auto_2289139 ?auto_2289140 ?auto_2289141 ?auto_2289142 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2289276 - SURFACE
      ?auto_2289277 - SURFACE
      ?auto_2289278 - SURFACE
      ?auto_2289275 - SURFACE
      ?auto_2289279 - SURFACE
      ?auto_2289281 - SURFACE
      ?auto_2289280 - SURFACE
      ?auto_2289282 - SURFACE
      ?auto_2289283 - SURFACE
      ?auto_2289284 - SURFACE
      ?auto_2289285 - SURFACE
      ?auto_2289286 - SURFACE
    )
    :vars
    (
      ?auto_2289287 - HOIST
      ?auto_2289289 - PLACE
      ?auto_2289290 - PLACE
      ?auto_2289291 - HOIST
      ?auto_2289288 - SURFACE
      ?auto_2289292 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2289287 ?auto_2289289 ) ( SURFACE-AT ?auto_2289285 ?auto_2289289 ) ( CLEAR ?auto_2289285 ) ( IS-CRATE ?auto_2289286 ) ( not ( = ?auto_2289285 ?auto_2289286 ) ) ( AVAILABLE ?auto_2289287 ) ( ON ?auto_2289285 ?auto_2289284 ) ( not ( = ?auto_2289284 ?auto_2289285 ) ) ( not ( = ?auto_2289284 ?auto_2289286 ) ) ( not ( = ?auto_2289290 ?auto_2289289 ) ) ( HOIST-AT ?auto_2289291 ?auto_2289290 ) ( not ( = ?auto_2289287 ?auto_2289291 ) ) ( AVAILABLE ?auto_2289291 ) ( SURFACE-AT ?auto_2289286 ?auto_2289290 ) ( ON ?auto_2289286 ?auto_2289288 ) ( CLEAR ?auto_2289286 ) ( not ( = ?auto_2289285 ?auto_2289288 ) ) ( not ( = ?auto_2289286 ?auto_2289288 ) ) ( not ( = ?auto_2289284 ?auto_2289288 ) ) ( TRUCK-AT ?auto_2289292 ?auto_2289289 ) ( ON ?auto_2289277 ?auto_2289276 ) ( ON ?auto_2289278 ?auto_2289277 ) ( ON ?auto_2289275 ?auto_2289278 ) ( ON ?auto_2289279 ?auto_2289275 ) ( ON ?auto_2289281 ?auto_2289279 ) ( ON ?auto_2289280 ?auto_2289281 ) ( ON ?auto_2289282 ?auto_2289280 ) ( ON ?auto_2289283 ?auto_2289282 ) ( ON ?auto_2289284 ?auto_2289283 ) ( not ( = ?auto_2289276 ?auto_2289277 ) ) ( not ( = ?auto_2289276 ?auto_2289278 ) ) ( not ( = ?auto_2289276 ?auto_2289275 ) ) ( not ( = ?auto_2289276 ?auto_2289279 ) ) ( not ( = ?auto_2289276 ?auto_2289281 ) ) ( not ( = ?auto_2289276 ?auto_2289280 ) ) ( not ( = ?auto_2289276 ?auto_2289282 ) ) ( not ( = ?auto_2289276 ?auto_2289283 ) ) ( not ( = ?auto_2289276 ?auto_2289284 ) ) ( not ( = ?auto_2289276 ?auto_2289285 ) ) ( not ( = ?auto_2289276 ?auto_2289286 ) ) ( not ( = ?auto_2289276 ?auto_2289288 ) ) ( not ( = ?auto_2289277 ?auto_2289278 ) ) ( not ( = ?auto_2289277 ?auto_2289275 ) ) ( not ( = ?auto_2289277 ?auto_2289279 ) ) ( not ( = ?auto_2289277 ?auto_2289281 ) ) ( not ( = ?auto_2289277 ?auto_2289280 ) ) ( not ( = ?auto_2289277 ?auto_2289282 ) ) ( not ( = ?auto_2289277 ?auto_2289283 ) ) ( not ( = ?auto_2289277 ?auto_2289284 ) ) ( not ( = ?auto_2289277 ?auto_2289285 ) ) ( not ( = ?auto_2289277 ?auto_2289286 ) ) ( not ( = ?auto_2289277 ?auto_2289288 ) ) ( not ( = ?auto_2289278 ?auto_2289275 ) ) ( not ( = ?auto_2289278 ?auto_2289279 ) ) ( not ( = ?auto_2289278 ?auto_2289281 ) ) ( not ( = ?auto_2289278 ?auto_2289280 ) ) ( not ( = ?auto_2289278 ?auto_2289282 ) ) ( not ( = ?auto_2289278 ?auto_2289283 ) ) ( not ( = ?auto_2289278 ?auto_2289284 ) ) ( not ( = ?auto_2289278 ?auto_2289285 ) ) ( not ( = ?auto_2289278 ?auto_2289286 ) ) ( not ( = ?auto_2289278 ?auto_2289288 ) ) ( not ( = ?auto_2289275 ?auto_2289279 ) ) ( not ( = ?auto_2289275 ?auto_2289281 ) ) ( not ( = ?auto_2289275 ?auto_2289280 ) ) ( not ( = ?auto_2289275 ?auto_2289282 ) ) ( not ( = ?auto_2289275 ?auto_2289283 ) ) ( not ( = ?auto_2289275 ?auto_2289284 ) ) ( not ( = ?auto_2289275 ?auto_2289285 ) ) ( not ( = ?auto_2289275 ?auto_2289286 ) ) ( not ( = ?auto_2289275 ?auto_2289288 ) ) ( not ( = ?auto_2289279 ?auto_2289281 ) ) ( not ( = ?auto_2289279 ?auto_2289280 ) ) ( not ( = ?auto_2289279 ?auto_2289282 ) ) ( not ( = ?auto_2289279 ?auto_2289283 ) ) ( not ( = ?auto_2289279 ?auto_2289284 ) ) ( not ( = ?auto_2289279 ?auto_2289285 ) ) ( not ( = ?auto_2289279 ?auto_2289286 ) ) ( not ( = ?auto_2289279 ?auto_2289288 ) ) ( not ( = ?auto_2289281 ?auto_2289280 ) ) ( not ( = ?auto_2289281 ?auto_2289282 ) ) ( not ( = ?auto_2289281 ?auto_2289283 ) ) ( not ( = ?auto_2289281 ?auto_2289284 ) ) ( not ( = ?auto_2289281 ?auto_2289285 ) ) ( not ( = ?auto_2289281 ?auto_2289286 ) ) ( not ( = ?auto_2289281 ?auto_2289288 ) ) ( not ( = ?auto_2289280 ?auto_2289282 ) ) ( not ( = ?auto_2289280 ?auto_2289283 ) ) ( not ( = ?auto_2289280 ?auto_2289284 ) ) ( not ( = ?auto_2289280 ?auto_2289285 ) ) ( not ( = ?auto_2289280 ?auto_2289286 ) ) ( not ( = ?auto_2289280 ?auto_2289288 ) ) ( not ( = ?auto_2289282 ?auto_2289283 ) ) ( not ( = ?auto_2289282 ?auto_2289284 ) ) ( not ( = ?auto_2289282 ?auto_2289285 ) ) ( not ( = ?auto_2289282 ?auto_2289286 ) ) ( not ( = ?auto_2289282 ?auto_2289288 ) ) ( not ( = ?auto_2289283 ?auto_2289284 ) ) ( not ( = ?auto_2289283 ?auto_2289285 ) ) ( not ( = ?auto_2289283 ?auto_2289286 ) ) ( not ( = ?auto_2289283 ?auto_2289288 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2289284 ?auto_2289285 ?auto_2289286 )
      ( MAKE-11CRATE-VERIFY ?auto_2289276 ?auto_2289277 ?auto_2289278 ?auto_2289275 ?auto_2289279 ?auto_2289281 ?auto_2289280 ?auto_2289282 ?auto_2289283 ?auto_2289284 ?auto_2289285 ?auto_2289286 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2289420 - SURFACE
      ?auto_2289421 - SURFACE
      ?auto_2289422 - SURFACE
      ?auto_2289419 - SURFACE
      ?auto_2289423 - SURFACE
      ?auto_2289425 - SURFACE
      ?auto_2289424 - SURFACE
      ?auto_2289426 - SURFACE
      ?auto_2289427 - SURFACE
      ?auto_2289428 - SURFACE
      ?auto_2289429 - SURFACE
      ?auto_2289430 - SURFACE
    )
    :vars
    (
      ?auto_2289434 - HOIST
      ?auto_2289435 - PLACE
      ?auto_2289432 - PLACE
      ?auto_2289436 - HOIST
      ?auto_2289431 - SURFACE
      ?auto_2289433 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2289434 ?auto_2289435 ) ( IS-CRATE ?auto_2289430 ) ( not ( = ?auto_2289429 ?auto_2289430 ) ) ( not ( = ?auto_2289428 ?auto_2289429 ) ) ( not ( = ?auto_2289428 ?auto_2289430 ) ) ( not ( = ?auto_2289432 ?auto_2289435 ) ) ( HOIST-AT ?auto_2289436 ?auto_2289432 ) ( not ( = ?auto_2289434 ?auto_2289436 ) ) ( AVAILABLE ?auto_2289436 ) ( SURFACE-AT ?auto_2289430 ?auto_2289432 ) ( ON ?auto_2289430 ?auto_2289431 ) ( CLEAR ?auto_2289430 ) ( not ( = ?auto_2289429 ?auto_2289431 ) ) ( not ( = ?auto_2289430 ?auto_2289431 ) ) ( not ( = ?auto_2289428 ?auto_2289431 ) ) ( TRUCK-AT ?auto_2289433 ?auto_2289435 ) ( SURFACE-AT ?auto_2289428 ?auto_2289435 ) ( CLEAR ?auto_2289428 ) ( LIFTING ?auto_2289434 ?auto_2289429 ) ( IS-CRATE ?auto_2289429 ) ( ON ?auto_2289421 ?auto_2289420 ) ( ON ?auto_2289422 ?auto_2289421 ) ( ON ?auto_2289419 ?auto_2289422 ) ( ON ?auto_2289423 ?auto_2289419 ) ( ON ?auto_2289425 ?auto_2289423 ) ( ON ?auto_2289424 ?auto_2289425 ) ( ON ?auto_2289426 ?auto_2289424 ) ( ON ?auto_2289427 ?auto_2289426 ) ( ON ?auto_2289428 ?auto_2289427 ) ( not ( = ?auto_2289420 ?auto_2289421 ) ) ( not ( = ?auto_2289420 ?auto_2289422 ) ) ( not ( = ?auto_2289420 ?auto_2289419 ) ) ( not ( = ?auto_2289420 ?auto_2289423 ) ) ( not ( = ?auto_2289420 ?auto_2289425 ) ) ( not ( = ?auto_2289420 ?auto_2289424 ) ) ( not ( = ?auto_2289420 ?auto_2289426 ) ) ( not ( = ?auto_2289420 ?auto_2289427 ) ) ( not ( = ?auto_2289420 ?auto_2289428 ) ) ( not ( = ?auto_2289420 ?auto_2289429 ) ) ( not ( = ?auto_2289420 ?auto_2289430 ) ) ( not ( = ?auto_2289420 ?auto_2289431 ) ) ( not ( = ?auto_2289421 ?auto_2289422 ) ) ( not ( = ?auto_2289421 ?auto_2289419 ) ) ( not ( = ?auto_2289421 ?auto_2289423 ) ) ( not ( = ?auto_2289421 ?auto_2289425 ) ) ( not ( = ?auto_2289421 ?auto_2289424 ) ) ( not ( = ?auto_2289421 ?auto_2289426 ) ) ( not ( = ?auto_2289421 ?auto_2289427 ) ) ( not ( = ?auto_2289421 ?auto_2289428 ) ) ( not ( = ?auto_2289421 ?auto_2289429 ) ) ( not ( = ?auto_2289421 ?auto_2289430 ) ) ( not ( = ?auto_2289421 ?auto_2289431 ) ) ( not ( = ?auto_2289422 ?auto_2289419 ) ) ( not ( = ?auto_2289422 ?auto_2289423 ) ) ( not ( = ?auto_2289422 ?auto_2289425 ) ) ( not ( = ?auto_2289422 ?auto_2289424 ) ) ( not ( = ?auto_2289422 ?auto_2289426 ) ) ( not ( = ?auto_2289422 ?auto_2289427 ) ) ( not ( = ?auto_2289422 ?auto_2289428 ) ) ( not ( = ?auto_2289422 ?auto_2289429 ) ) ( not ( = ?auto_2289422 ?auto_2289430 ) ) ( not ( = ?auto_2289422 ?auto_2289431 ) ) ( not ( = ?auto_2289419 ?auto_2289423 ) ) ( not ( = ?auto_2289419 ?auto_2289425 ) ) ( not ( = ?auto_2289419 ?auto_2289424 ) ) ( not ( = ?auto_2289419 ?auto_2289426 ) ) ( not ( = ?auto_2289419 ?auto_2289427 ) ) ( not ( = ?auto_2289419 ?auto_2289428 ) ) ( not ( = ?auto_2289419 ?auto_2289429 ) ) ( not ( = ?auto_2289419 ?auto_2289430 ) ) ( not ( = ?auto_2289419 ?auto_2289431 ) ) ( not ( = ?auto_2289423 ?auto_2289425 ) ) ( not ( = ?auto_2289423 ?auto_2289424 ) ) ( not ( = ?auto_2289423 ?auto_2289426 ) ) ( not ( = ?auto_2289423 ?auto_2289427 ) ) ( not ( = ?auto_2289423 ?auto_2289428 ) ) ( not ( = ?auto_2289423 ?auto_2289429 ) ) ( not ( = ?auto_2289423 ?auto_2289430 ) ) ( not ( = ?auto_2289423 ?auto_2289431 ) ) ( not ( = ?auto_2289425 ?auto_2289424 ) ) ( not ( = ?auto_2289425 ?auto_2289426 ) ) ( not ( = ?auto_2289425 ?auto_2289427 ) ) ( not ( = ?auto_2289425 ?auto_2289428 ) ) ( not ( = ?auto_2289425 ?auto_2289429 ) ) ( not ( = ?auto_2289425 ?auto_2289430 ) ) ( not ( = ?auto_2289425 ?auto_2289431 ) ) ( not ( = ?auto_2289424 ?auto_2289426 ) ) ( not ( = ?auto_2289424 ?auto_2289427 ) ) ( not ( = ?auto_2289424 ?auto_2289428 ) ) ( not ( = ?auto_2289424 ?auto_2289429 ) ) ( not ( = ?auto_2289424 ?auto_2289430 ) ) ( not ( = ?auto_2289424 ?auto_2289431 ) ) ( not ( = ?auto_2289426 ?auto_2289427 ) ) ( not ( = ?auto_2289426 ?auto_2289428 ) ) ( not ( = ?auto_2289426 ?auto_2289429 ) ) ( not ( = ?auto_2289426 ?auto_2289430 ) ) ( not ( = ?auto_2289426 ?auto_2289431 ) ) ( not ( = ?auto_2289427 ?auto_2289428 ) ) ( not ( = ?auto_2289427 ?auto_2289429 ) ) ( not ( = ?auto_2289427 ?auto_2289430 ) ) ( not ( = ?auto_2289427 ?auto_2289431 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2289428 ?auto_2289429 ?auto_2289430 )
      ( MAKE-11CRATE-VERIFY ?auto_2289420 ?auto_2289421 ?auto_2289422 ?auto_2289419 ?auto_2289423 ?auto_2289425 ?auto_2289424 ?auto_2289426 ?auto_2289427 ?auto_2289428 ?auto_2289429 ?auto_2289430 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2289564 - SURFACE
      ?auto_2289565 - SURFACE
      ?auto_2289566 - SURFACE
      ?auto_2289563 - SURFACE
      ?auto_2289567 - SURFACE
      ?auto_2289569 - SURFACE
      ?auto_2289568 - SURFACE
      ?auto_2289570 - SURFACE
      ?auto_2289571 - SURFACE
      ?auto_2289572 - SURFACE
      ?auto_2289573 - SURFACE
      ?auto_2289574 - SURFACE
    )
    :vars
    (
      ?auto_2289578 - HOIST
      ?auto_2289577 - PLACE
      ?auto_2289575 - PLACE
      ?auto_2289579 - HOIST
      ?auto_2289580 - SURFACE
      ?auto_2289576 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2289578 ?auto_2289577 ) ( IS-CRATE ?auto_2289574 ) ( not ( = ?auto_2289573 ?auto_2289574 ) ) ( not ( = ?auto_2289572 ?auto_2289573 ) ) ( not ( = ?auto_2289572 ?auto_2289574 ) ) ( not ( = ?auto_2289575 ?auto_2289577 ) ) ( HOIST-AT ?auto_2289579 ?auto_2289575 ) ( not ( = ?auto_2289578 ?auto_2289579 ) ) ( AVAILABLE ?auto_2289579 ) ( SURFACE-AT ?auto_2289574 ?auto_2289575 ) ( ON ?auto_2289574 ?auto_2289580 ) ( CLEAR ?auto_2289574 ) ( not ( = ?auto_2289573 ?auto_2289580 ) ) ( not ( = ?auto_2289574 ?auto_2289580 ) ) ( not ( = ?auto_2289572 ?auto_2289580 ) ) ( TRUCK-AT ?auto_2289576 ?auto_2289577 ) ( SURFACE-AT ?auto_2289572 ?auto_2289577 ) ( CLEAR ?auto_2289572 ) ( IS-CRATE ?auto_2289573 ) ( AVAILABLE ?auto_2289578 ) ( IN ?auto_2289573 ?auto_2289576 ) ( ON ?auto_2289565 ?auto_2289564 ) ( ON ?auto_2289566 ?auto_2289565 ) ( ON ?auto_2289563 ?auto_2289566 ) ( ON ?auto_2289567 ?auto_2289563 ) ( ON ?auto_2289569 ?auto_2289567 ) ( ON ?auto_2289568 ?auto_2289569 ) ( ON ?auto_2289570 ?auto_2289568 ) ( ON ?auto_2289571 ?auto_2289570 ) ( ON ?auto_2289572 ?auto_2289571 ) ( not ( = ?auto_2289564 ?auto_2289565 ) ) ( not ( = ?auto_2289564 ?auto_2289566 ) ) ( not ( = ?auto_2289564 ?auto_2289563 ) ) ( not ( = ?auto_2289564 ?auto_2289567 ) ) ( not ( = ?auto_2289564 ?auto_2289569 ) ) ( not ( = ?auto_2289564 ?auto_2289568 ) ) ( not ( = ?auto_2289564 ?auto_2289570 ) ) ( not ( = ?auto_2289564 ?auto_2289571 ) ) ( not ( = ?auto_2289564 ?auto_2289572 ) ) ( not ( = ?auto_2289564 ?auto_2289573 ) ) ( not ( = ?auto_2289564 ?auto_2289574 ) ) ( not ( = ?auto_2289564 ?auto_2289580 ) ) ( not ( = ?auto_2289565 ?auto_2289566 ) ) ( not ( = ?auto_2289565 ?auto_2289563 ) ) ( not ( = ?auto_2289565 ?auto_2289567 ) ) ( not ( = ?auto_2289565 ?auto_2289569 ) ) ( not ( = ?auto_2289565 ?auto_2289568 ) ) ( not ( = ?auto_2289565 ?auto_2289570 ) ) ( not ( = ?auto_2289565 ?auto_2289571 ) ) ( not ( = ?auto_2289565 ?auto_2289572 ) ) ( not ( = ?auto_2289565 ?auto_2289573 ) ) ( not ( = ?auto_2289565 ?auto_2289574 ) ) ( not ( = ?auto_2289565 ?auto_2289580 ) ) ( not ( = ?auto_2289566 ?auto_2289563 ) ) ( not ( = ?auto_2289566 ?auto_2289567 ) ) ( not ( = ?auto_2289566 ?auto_2289569 ) ) ( not ( = ?auto_2289566 ?auto_2289568 ) ) ( not ( = ?auto_2289566 ?auto_2289570 ) ) ( not ( = ?auto_2289566 ?auto_2289571 ) ) ( not ( = ?auto_2289566 ?auto_2289572 ) ) ( not ( = ?auto_2289566 ?auto_2289573 ) ) ( not ( = ?auto_2289566 ?auto_2289574 ) ) ( not ( = ?auto_2289566 ?auto_2289580 ) ) ( not ( = ?auto_2289563 ?auto_2289567 ) ) ( not ( = ?auto_2289563 ?auto_2289569 ) ) ( not ( = ?auto_2289563 ?auto_2289568 ) ) ( not ( = ?auto_2289563 ?auto_2289570 ) ) ( not ( = ?auto_2289563 ?auto_2289571 ) ) ( not ( = ?auto_2289563 ?auto_2289572 ) ) ( not ( = ?auto_2289563 ?auto_2289573 ) ) ( not ( = ?auto_2289563 ?auto_2289574 ) ) ( not ( = ?auto_2289563 ?auto_2289580 ) ) ( not ( = ?auto_2289567 ?auto_2289569 ) ) ( not ( = ?auto_2289567 ?auto_2289568 ) ) ( not ( = ?auto_2289567 ?auto_2289570 ) ) ( not ( = ?auto_2289567 ?auto_2289571 ) ) ( not ( = ?auto_2289567 ?auto_2289572 ) ) ( not ( = ?auto_2289567 ?auto_2289573 ) ) ( not ( = ?auto_2289567 ?auto_2289574 ) ) ( not ( = ?auto_2289567 ?auto_2289580 ) ) ( not ( = ?auto_2289569 ?auto_2289568 ) ) ( not ( = ?auto_2289569 ?auto_2289570 ) ) ( not ( = ?auto_2289569 ?auto_2289571 ) ) ( not ( = ?auto_2289569 ?auto_2289572 ) ) ( not ( = ?auto_2289569 ?auto_2289573 ) ) ( not ( = ?auto_2289569 ?auto_2289574 ) ) ( not ( = ?auto_2289569 ?auto_2289580 ) ) ( not ( = ?auto_2289568 ?auto_2289570 ) ) ( not ( = ?auto_2289568 ?auto_2289571 ) ) ( not ( = ?auto_2289568 ?auto_2289572 ) ) ( not ( = ?auto_2289568 ?auto_2289573 ) ) ( not ( = ?auto_2289568 ?auto_2289574 ) ) ( not ( = ?auto_2289568 ?auto_2289580 ) ) ( not ( = ?auto_2289570 ?auto_2289571 ) ) ( not ( = ?auto_2289570 ?auto_2289572 ) ) ( not ( = ?auto_2289570 ?auto_2289573 ) ) ( not ( = ?auto_2289570 ?auto_2289574 ) ) ( not ( = ?auto_2289570 ?auto_2289580 ) ) ( not ( = ?auto_2289571 ?auto_2289572 ) ) ( not ( = ?auto_2289571 ?auto_2289573 ) ) ( not ( = ?auto_2289571 ?auto_2289574 ) ) ( not ( = ?auto_2289571 ?auto_2289580 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2289572 ?auto_2289573 ?auto_2289574 )
      ( MAKE-11CRATE-VERIFY ?auto_2289564 ?auto_2289565 ?auto_2289566 ?auto_2289563 ?auto_2289567 ?auto_2289569 ?auto_2289568 ?auto_2289570 ?auto_2289571 ?auto_2289572 ?auto_2289573 ?auto_2289574 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2298788 - SURFACE
      ?auto_2298789 - SURFACE
      ?auto_2298790 - SURFACE
      ?auto_2298787 - SURFACE
      ?auto_2298791 - SURFACE
      ?auto_2298793 - SURFACE
      ?auto_2298792 - SURFACE
      ?auto_2298794 - SURFACE
      ?auto_2298795 - SURFACE
      ?auto_2298796 - SURFACE
      ?auto_2298797 - SURFACE
      ?auto_2298798 - SURFACE
      ?auto_2298799 - SURFACE
    )
    :vars
    (
      ?auto_2298800 - HOIST
      ?auto_2298801 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2298800 ?auto_2298801 ) ( SURFACE-AT ?auto_2298798 ?auto_2298801 ) ( CLEAR ?auto_2298798 ) ( LIFTING ?auto_2298800 ?auto_2298799 ) ( IS-CRATE ?auto_2298799 ) ( not ( = ?auto_2298798 ?auto_2298799 ) ) ( ON ?auto_2298789 ?auto_2298788 ) ( ON ?auto_2298790 ?auto_2298789 ) ( ON ?auto_2298787 ?auto_2298790 ) ( ON ?auto_2298791 ?auto_2298787 ) ( ON ?auto_2298793 ?auto_2298791 ) ( ON ?auto_2298792 ?auto_2298793 ) ( ON ?auto_2298794 ?auto_2298792 ) ( ON ?auto_2298795 ?auto_2298794 ) ( ON ?auto_2298796 ?auto_2298795 ) ( ON ?auto_2298797 ?auto_2298796 ) ( ON ?auto_2298798 ?auto_2298797 ) ( not ( = ?auto_2298788 ?auto_2298789 ) ) ( not ( = ?auto_2298788 ?auto_2298790 ) ) ( not ( = ?auto_2298788 ?auto_2298787 ) ) ( not ( = ?auto_2298788 ?auto_2298791 ) ) ( not ( = ?auto_2298788 ?auto_2298793 ) ) ( not ( = ?auto_2298788 ?auto_2298792 ) ) ( not ( = ?auto_2298788 ?auto_2298794 ) ) ( not ( = ?auto_2298788 ?auto_2298795 ) ) ( not ( = ?auto_2298788 ?auto_2298796 ) ) ( not ( = ?auto_2298788 ?auto_2298797 ) ) ( not ( = ?auto_2298788 ?auto_2298798 ) ) ( not ( = ?auto_2298788 ?auto_2298799 ) ) ( not ( = ?auto_2298789 ?auto_2298790 ) ) ( not ( = ?auto_2298789 ?auto_2298787 ) ) ( not ( = ?auto_2298789 ?auto_2298791 ) ) ( not ( = ?auto_2298789 ?auto_2298793 ) ) ( not ( = ?auto_2298789 ?auto_2298792 ) ) ( not ( = ?auto_2298789 ?auto_2298794 ) ) ( not ( = ?auto_2298789 ?auto_2298795 ) ) ( not ( = ?auto_2298789 ?auto_2298796 ) ) ( not ( = ?auto_2298789 ?auto_2298797 ) ) ( not ( = ?auto_2298789 ?auto_2298798 ) ) ( not ( = ?auto_2298789 ?auto_2298799 ) ) ( not ( = ?auto_2298790 ?auto_2298787 ) ) ( not ( = ?auto_2298790 ?auto_2298791 ) ) ( not ( = ?auto_2298790 ?auto_2298793 ) ) ( not ( = ?auto_2298790 ?auto_2298792 ) ) ( not ( = ?auto_2298790 ?auto_2298794 ) ) ( not ( = ?auto_2298790 ?auto_2298795 ) ) ( not ( = ?auto_2298790 ?auto_2298796 ) ) ( not ( = ?auto_2298790 ?auto_2298797 ) ) ( not ( = ?auto_2298790 ?auto_2298798 ) ) ( not ( = ?auto_2298790 ?auto_2298799 ) ) ( not ( = ?auto_2298787 ?auto_2298791 ) ) ( not ( = ?auto_2298787 ?auto_2298793 ) ) ( not ( = ?auto_2298787 ?auto_2298792 ) ) ( not ( = ?auto_2298787 ?auto_2298794 ) ) ( not ( = ?auto_2298787 ?auto_2298795 ) ) ( not ( = ?auto_2298787 ?auto_2298796 ) ) ( not ( = ?auto_2298787 ?auto_2298797 ) ) ( not ( = ?auto_2298787 ?auto_2298798 ) ) ( not ( = ?auto_2298787 ?auto_2298799 ) ) ( not ( = ?auto_2298791 ?auto_2298793 ) ) ( not ( = ?auto_2298791 ?auto_2298792 ) ) ( not ( = ?auto_2298791 ?auto_2298794 ) ) ( not ( = ?auto_2298791 ?auto_2298795 ) ) ( not ( = ?auto_2298791 ?auto_2298796 ) ) ( not ( = ?auto_2298791 ?auto_2298797 ) ) ( not ( = ?auto_2298791 ?auto_2298798 ) ) ( not ( = ?auto_2298791 ?auto_2298799 ) ) ( not ( = ?auto_2298793 ?auto_2298792 ) ) ( not ( = ?auto_2298793 ?auto_2298794 ) ) ( not ( = ?auto_2298793 ?auto_2298795 ) ) ( not ( = ?auto_2298793 ?auto_2298796 ) ) ( not ( = ?auto_2298793 ?auto_2298797 ) ) ( not ( = ?auto_2298793 ?auto_2298798 ) ) ( not ( = ?auto_2298793 ?auto_2298799 ) ) ( not ( = ?auto_2298792 ?auto_2298794 ) ) ( not ( = ?auto_2298792 ?auto_2298795 ) ) ( not ( = ?auto_2298792 ?auto_2298796 ) ) ( not ( = ?auto_2298792 ?auto_2298797 ) ) ( not ( = ?auto_2298792 ?auto_2298798 ) ) ( not ( = ?auto_2298792 ?auto_2298799 ) ) ( not ( = ?auto_2298794 ?auto_2298795 ) ) ( not ( = ?auto_2298794 ?auto_2298796 ) ) ( not ( = ?auto_2298794 ?auto_2298797 ) ) ( not ( = ?auto_2298794 ?auto_2298798 ) ) ( not ( = ?auto_2298794 ?auto_2298799 ) ) ( not ( = ?auto_2298795 ?auto_2298796 ) ) ( not ( = ?auto_2298795 ?auto_2298797 ) ) ( not ( = ?auto_2298795 ?auto_2298798 ) ) ( not ( = ?auto_2298795 ?auto_2298799 ) ) ( not ( = ?auto_2298796 ?auto_2298797 ) ) ( not ( = ?auto_2298796 ?auto_2298798 ) ) ( not ( = ?auto_2298796 ?auto_2298799 ) ) ( not ( = ?auto_2298797 ?auto_2298798 ) ) ( not ( = ?auto_2298797 ?auto_2298799 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2298798 ?auto_2298799 )
      ( MAKE-12CRATE-VERIFY ?auto_2298788 ?auto_2298789 ?auto_2298790 ?auto_2298787 ?auto_2298791 ?auto_2298793 ?auto_2298792 ?auto_2298794 ?auto_2298795 ?auto_2298796 ?auto_2298797 ?auto_2298798 ?auto_2298799 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2298913 - SURFACE
      ?auto_2298914 - SURFACE
      ?auto_2298915 - SURFACE
      ?auto_2298912 - SURFACE
      ?auto_2298916 - SURFACE
      ?auto_2298918 - SURFACE
      ?auto_2298917 - SURFACE
      ?auto_2298919 - SURFACE
      ?auto_2298920 - SURFACE
      ?auto_2298921 - SURFACE
      ?auto_2298922 - SURFACE
      ?auto_2298923 - SURFACE
      ?auto_2298924 - SURFACE
    )
    :vars
    (
      ?auto_2298925 - HOIST
      ?auto_2298926 - PLACE
      ?auto_2298927 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2298925 ?auto_2298926 ) ( SURFACE-AT ?auto_2298923 ?auto_2298926 ) ( CLEAR ?auto_2298923 ) ( IS-CRATE ?auto_2298924 ) ( not ( = ?auto_2298923 ?auto_2298924 ) ) ( TRUCK-AT ?auto_2298927 ?auto_2298926 ) ( AVAILABLE ?auto_2298925 ) ( IN ?auto_2298924 ?auto_2298927 ) ( ON ?auto_2298923 ?auto_2298922 ) ( not ( = ?auto_2298922 ?auto_2298923 ) ) ( not ( = ?auto_2298922 ?auto_2298924 ) ) ( ON ?auto_2298914 ?auto_2298913 ) ( ON ?auto_2298915 ?auto_2298914 ) ( ON ?auto_2298912 ?auto_2298915 ) ( ON ?auto_2298916 ?auto_2298912 ) ( ON ?auto_2298918 ?auto_2298916 ) ( ON ?auto_2298917 ?auto_2298918 ) ( ON ?auto_2298919 ?auto_2298917 ) ( ON ?auto_2298920 ?auto_2298919 ) ( ON ?auto_2298921 ?auto_2298920 ) ( ON ?auto_2298922 ?auto_2298921 ) ( not ( = ?auto_2298913 ?auto_2298914 ) ) ( not ( = ?auto_2298913 ?auto_2298915 ) ) ( not ( = ?auto_2298913 ?auto_2298912 ) ) ( not ( = ?auto_2298913 ?auto_2298916 ) ) ( not ( = ?auto_2298913 ?auto_2298918 ) ) ( not ( = ?auto_2298913 ?auto_2298917 ) ) ( not ( = ?auto_2298913 ?auto_2298919 ) ) ( not ( = ?auto_2298913 ?auto_2298920 ) ) ( not ( = ?auto_2298913 ?auto_2298921 ) ) ( not ( = ?auto_2298913 ?auto_2298922 ) ) ( not ( = ?auto_2298913 ?auto_2298923 ) ) ( not ( = ?auto_2298913 ?auto_2298924 ) ) ( not ( = ?auto_2298914 ?auto_2298915 ) ) ( not ( = ?auto_2298914 ?auto_2298912 ) ) ( not ( = ?auto_2298914 ?auto_2298916 ) ) ( not ( = ?auto_2298914 ?auto_2298918 ) ) ( not ( = ?auto_2298914 ?auto_2298917 ) ) ( not ( = ?auto_2298914 ?auto_2298919 ) ) ( not ( = ?auto_2298914 ?auto_2298920 ) ) ( not ( = ?auto_2298914 ?auto_2298921 ) ) ( not ( = ?auto_2298914 ?auto_2298922 ) ) ( not ( = ?auto_2298914 ?auto_2298923 ) ) ( not ( = ?auto_2298914 ?auto_2298924 ) ) ( not ( = ?auto_2298915 ?auto_2298912 ) ) ( not ( = ?auto_2298915 ?auto_2298916 ) ) ( not ( = ?auto_2298915 ?auto_2298918 ) ) ( not ( = ?auto_2298915 ?auto_2298917 ) ) ( not ( = ?auto_2298915 ?auto_2298919 ) ) ( not ( = ?auto_2298915 ?auto_2298920 ) ) ( not ( = ?auto_2298915 ?auto_2298921 ) ) ( not ( = ?auto_2298915 ?auto_2298922 ) ) ( not ( = ?auto_2298915 ?auto_2298923 ) ) ( not ( = ?auto_2298915 ?auto_2298924 ) ) ( not ( = ?auto_2298912 ?auto_2298916 ) ) ( not ( = ?auto_2298912 ?auto_2298918 ) ) ( not ( = ?auto_2298912 ?auto_2298917 ) ) ( not ( = ?auto_2298912 ?auto_2298919 ) ) ( not ( = ?auto_2298912 ?auto_2298920 ) ) ( not ( = ?auto_2298912 ?auto_2298921 ) ) ( not ( = ?auto_2298912 ?auto_2298922 ) ) ( not ( = ?auto_2298912 ?auto_2298923 ) ) ( not ( = ?auto_2298912 ?auto_2298924 ) ) ( not ( = ?auto_2298916 ?auto_2298918 ) ) ( not ( = ?auto_2298916 ?auto_2298917 ) ) ( not ( = ?auto_2298916 ?auto_2298919 ) ) ( not ( = ?auto_2298916 ?auto_2298920 ) ) ( not ( = ?auto_2298916 ?auto_2298921 ) ) ( not ( = ?auto_2298916 ?auto_2298922 ) ) ( not ( = ?auto_2298916 ?auto_2298923 ) ) ( not ( = ?auto_2298916 ?auto_2298924 ) ) ( not ( = ?auto_2298918 ?auto_2298917 ) ) ( not ( = ?auto_2298918 ?auto_2298919 ) ) ( not ( = ?auto_2298918 ?auto_2298920 ) ) ( not ( = ?auto_2298918 ?auto_2298921 ) ) ( not ( = ?auto_2298918 ?auto_2298922 ) ) ( not ( = ?auto_2298918 ?auto_2298923 ) ) ( not ( = ?auto_2298918 ?auto_2298924 ) ) ( not ( = ?auto_2298917 ?auto_2298919 ) ) ( not ( = ?auto_2298917 ?auto_2298920 ) ) ( not ( = ?auto_2298917 ?auto_2298921 ) ) ( not ( = ?auto_2298917 ?auto_2298922 ) ) ( not ( = ?auto_2298917 ?auto_2298923 ) ) ( not ( = ?auto_2298917 ?auto_2298924 ) ) ( not ( = ?auto_2298919 ?auto_2298920 ) ) ( not ( = ?auto_2298919 ?auto_2298921 ) ) ( not ( = ?auto_2298919 ?auto_2298922 ) ) ( not ( = ?auto_2298919 ?auto_2298923 ) ) ( not ( = ?auto_2298919 ?auto_2298924 ) ) ( not ( = ?auto_2298920 ?auto_2298921 ) ) ( not ( = ?auto_2298920 ?auto_2298922 ) ) ( not ( = ?auto_2298920 ?auto_2298923 ) ) ( not ( = ?auto_2298920 ?auto_2298924 ) ) ( not ( = ?auto_2298921 ?auto_2298922 ) ) ( not ( = ?auto_2298921 ?auto_2298923 ) ) ( not ( = ?auto_2298921 ?auto_2298924 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2298922 ?auto_2298923 ?auto_2298924 )
      ( MAKE-12CRATE-VERIFY ?auto_2298913 ?auto_2298914 ?auto_2298915 ?auto_2298912 ?auto_2298916 ?auto_2298918 ?auto_2298917 ?auto_2298919 ?auto_2298920 ?auto_2298921 ?auto_2298922 ?auto_2298923 ?auto_2298924 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2299051 - SURFACE
      ?auto_2299052 - SURFACE
      ?auto_2299053 - SURFACE
      ?auto_2299050 - SURFACE
      ?auto_2299054 - SURFACE
      ?auto_2299056 - SURFACE
      ?auto_2299055 - SURFACE
      ?auto_2299057 - SURFACE
      ?auto_2299058 - SURFACE
      ?auto_2299059 - SURFACE
      ?auto_2299060 - SURFACE
      ?auto_2299061 - SURFACE
      ?auto_2299062 - SURFACE
    )
    :vars
    (
      ?auto_2299063 - HOIST
      ?auto_2299065 - PLACE
      ?auto_2299066 - TRUCK
      ?auto_2299064 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2299063 ?auto_2299065 ) ( SURFACE-AT ?auto_2299061 ?auto_2299065 ) ( CLEAR ?auto_2299061 ) ( IS-CRATE ?auto_2299062 ) ( not ( = ?auto_2299061 ?auto_2299062 ) ) ( AVAILABLE ?auto_2299063 ) ( IN ?auto_2299062 ?auto_2299066 ) ( ON ?auto_2299061 ?auto_2299060 ) ( not ( = ?auto_2299060 ?auto_2299061 ) ) ( not ( = ?auto_2299060 ?auto_2299062 ) ) ( TRUCK-AT ?auto_2299066 ?auto_2299064 ) ( not ( = ?auto_2299064 ?auto_2299065 ) ) ( ON ?auto_2299052 ?auto_2299051 ) ( ON ?auto_2299053 ?auto_2299052 ) ( ON ?auto_2299050 ?auto_2299053 ) ( ON ?auto_2299054 ?auto_2299050 ) ( ON ?auto_2299056 ?auto_2299054 ) ( ON ?auto_2299055 ?auto_2299056 ) ( ON ?auto_2299057 ?auto_2299055 ) ( ON ?auto_2299058 ?auto_2299057 ) ( ON ?auto_2299059 ?auto_2299058 ) ( ON ?auto_2299060 ?auto_2299059 ) ( not ( = ?auto_2299051 ?auto_2299052 ) ) ( not ( = ?auto_2299051 ?auto_2299053 ) ) ( not ( = ?auto_2299051 ?auto_2299050 ) ) ( not ( = ?auto_2299051 ?auto_2299054 ) ) ( not ( = ?auto_2299051 ?auto_2299056 ) ) ( not ( = ?auto_2299051 ?auto_2299055 ) ) ( not ( = ?auto_2299051 ?auto_2299057 ) ) ( not ( = ?auto_2299051 ?auto_2299058 ) ) ( not ( = ?auto_2299051 ?auto_2299059 ) ) ( not ( = ?auto_2299051 ?auto_2299060 ) ) ( not ( = ?auto_2299051 ?auto_2299061 ) ) ( not ( = ?auto_2299051 ?auto_2299062 ) ) ( not ( = ?auto_2299052 ?auto_2299053 ) ) ( not ( = ?auto_2299052 ?auto_2299050 ) ) ( not ( = ?auto_2299052 ?auto_2299054 ) ) ( not ( = ?auto_2299052 ?auto_2299056 ) ) ( not ( = ?auto_2299052 ?auto_2299055 ) ) ( not ( = ?auto_2299052 ?auto_2299057 ) ) ( not ( = ?auto_2299052 ?auto_2299058 ) ) ( not ( = ?auto_2299052 ?auto_2299059 ) ) ( not ( = ?auto_2299052 ?auto_2299060 ) ) ( not ( = ?auto_2299052 ?auto_2299061 ) ) ( not ( = ?auto_2299052 ?auto_2299062 ) ) ( not ( = ?auto_2299053 ?auto_2299050 ) ) ( not ( = ?auto_2299053 ?auto_2299054 ) ) ( not ( = ?auto_2299053 ?auto_2299056 ) ) ( not ( = ?auto_2299053 ?auto_2299055 ) ) ( not ( = ?auto_2299053 ?auto_2299057 ) ) ( not ( = ?auto_2299053 ?auto_2299058 ) ) ( not ( = ?auto_2299053 ?auto_2299059 ) ) ( not ( = ?auto_2299053 ?auto_2299060 ) ) ( not ( = ?auto_2299053 ?auto_2299061 ) ) ( not ( = ?auto_2299053 ?auto_2299062 ) ) ( not ( = ?auto_2299050 ?auto_2299054 ) ) ( not ( = ?auto_2299050 ?auto_2299056 ) ) ( not ( = ?auto_2299050 ?auto_2299055 ) ) ( not ( = ?auto_2299050 ?auto_2299057 ) ) ( not ( = ?auto_2299050 ?auto_2299058 ) ) ( not ( = ?auto_2299050 ?auto_2299059 ) ) ( not ( = ?auto_2299050 ?auto_2299060 ) ) ( not ( = ?auto_2299050 ?auto_2299061 ) ) ( not ( = ?auto_2299050 ?auto_2299062 ) ) ( not ( = ?auto_2299054 ?auto_2299056 ) ) ( not ( = ?auto_2299054 ?auto_2299055 ) ) ( not ( = ?auto_2299054 ?auto_2299057 ) ) ( not ( = ?auto_2299054 ?auto_2299058 ) ) ( not ( = ?auto_2299054 ?auto_2299059 ) ) ( not ( = ?auto_2299054 ?auto_2299060 ) ) ( not ( = ?auto_2299054 ?auto_2299061 ) ) ( not ( = ?auto_2299054 ?auto_2299062 ) ) ( not ( = ?auto_2299056 ?auto_2299055 ) ) ( not ( = ?auto_2299056 ?auto_2299057 ) ) ( not ( = ?auto_2299056 ?auto_2299058 ) ) ( not ( = ?auto_2299056 ?auto_2299059 ) ) ( not ( = ?auto_2299056 ?auto_2299060 ) ) ( not ( = ?auto_2299056 ?auto_2299061 ) ) ( not ( = ?auto_2299056 ?auto_2299062 ) ) ( not ( = ?auto_2299055 ?auto_2299057 ) ) ( not ( = ?auto_2299055 ?auto_2299058 ) ) ( not ( = ?auto_2299055 ?auto_2299059 ) ) ( not ( = ?auto_2299055 ?auto_2299060 ) ) ( not ( = ?auto_2299055 ?auto_2299061 ) ) ( not ( = ?auto_2299055 ?auto_2299062 ) ) ( not ( = ?auto_2299057 ?auto_2299058 ) ) ( not ( = ?auto_2299057 ?auto_2299059 ) ) ( not ( = ?auto_2299057 ?auto_2299060 ) ) ( not ( = ?auto_2299057 ?auto_2299061 ) ) ( not ( = ?auto_2299057 ?auto_2299062 ) ) ( not ( = ?auto_2299058 ?auto_2299059 ) ) ( not ( = ?auto_2299058 ?auto_2299060 ) ) ( not ( = ?auto_2299058 ?auto_2299061 ) ) ( not ( = ?auto_2299058 ?auto_2299062 ) ) ( not ( = ?auto_2299059 ?auto_2299060 ) ) ( not ( = ?auto_2299059 ?auto_2299061 ) ) ( not ( = ?auto_2299059 ?auto_2299062 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2299060 ?auto_2299061 ?auto_2299062 )
      ( MAKE-12CRATE-VERIFY ?auto_2299051 ?auto_2299052 ?auto_2299053 ?auto_2299050 ?auto_2299054 ?auto_2299056 ?auto_2299055 ?auto_2299057 ?auto_2299058 ?auto_2299059 ?auto_2299060 ?auto_2299061 ?auto_2299062 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2299201 - SURFACE
      ?auto_2299202 - SURFACE
      ?auto_2299203 - SURFACE
      ?auto_2299200 - SURFACE
      ?auto_2299204 - SURFACE
      ?auto_2299206 - SURFACE
      ?auto_2299205 - SURFACE
      ?auto_2299207 - SURFACE
      ?auto_2299208 - SURFACE
      ?auto_2299209 - SURFACE
      ?auto_2299210 - SURFACE
      ?auto_2299211 - SURFACE
      ?auto_2299212 - SURFACE
    )
    :vars
    (
      ?auto_2299216 - HOIST
      ?auto_2299213 - PLACE
      ?auto_2299217 - TRUCK
      ?auto_2299214 - PLACE
      ?auto_2299215 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2299216 ?auto_2299213 ) ( SURFACE-AT ?auto_2299211 ?auto_2299213 ) ( CLEAR ?auto_2299211 ) ( IS-CRATE ?auto_2299212 ) ( not ( = ?auto_2299211 ?auto_2299212 ) ) ( AVAILABLE ?auto_2299216 ) ( ON ?auto_2299211 ?auto_2299210 ) ( not ( = ?auto_2299210 ?auto_2299211 ) ) ( not ( = ?auto_2299210 ?auto_2299212 ) ) ( TRUCK-AT ?auto_2299217 ?auto_2299214 ) ( not ( = ?auto_2299214 ?auto_2299213 ) ) ( HOIST-AT ?auto_2299215 ?auto_2299214 ) ( LIFTING ?auto_2299215 ?auto_2299212 ) ( not ( = ?auto_2299216 ?auto_2299215 ) ) ( ON ?auto_2299202 ?auto_2299201 ) ( ON ?auto_2299203 ?auto_2299202 ) ( ON ?auto_2299200 ?auto_2299203 ) ( ON ?auto_2299204 ?auto_2299200 ) ( ON ?auto_2299206 ?auto_2299204 ) ( ON ?auto_2299205 ?auto_2299206 ) ( ON ?auto_2299207 ?auto_2299205 ) ( ON ?auto_2299208 ?auto_2299207 ) ( ON ?auto_2299209 ?auto_2299208 ) ( ON ?auto_2299210 ?auto_2299209 ) ( not ( = ?auto_2299201 ?auto_2299202 ) ) ( not ( = ?auto_2299201 ?auto_2299203 ) ) ( not ( = ?auto_2299201 ?auto_2299200 ) ) ( not ( = ?auto_2299201 ?auto_2299204 ) ) ( not ( = ?auto_2299201 ?auto_2299206 ) ) ( not ( = ?auto_2299201 ?auto_2299205 ) ) ( not ( = ?auto_2299201 ?auto_2299207 ) ) ( not ( = ?auto_2299201 ?auto_2299208 ) ) ( not ( = ?auto_2299201 ?auto_2299209 ) ) ( not ( = ?auto_2299201 ?auto_2299210 ) ) ( not ( = ?auto_2299201 ?auto_2299211 ) ) ( not ( = ?auto_2299201 ?auto_2299212 ) ) ( not ( = ?auto_2299202 ?auto_2299203 ) ) ( not ( = ?auto_2299202 ?auto_2299200 ) ) ( not ( = ?auto_2299202 ?auto_2299204 ) ) ( not ( = ?auto_2299202 ?auto_2299206 ) ) ( not ( = ?auto_2299202 ?auto_2299205 ) ) ( not ( = ?auto_2299202 ?auto_2299207 ) ) ( not ( = ?auto_2299202 ?auto_2299208 ) ) ( not ( = ?auto_2299202 ?auto_2299209 ) ) ( not ( = ?auto_2299202 ?auto_2299210 ) ) ( not ( = ?auto_2299202 ?auto_2299211 ) ) ( not ( = ?auto_2299202 ?auto_2299212 ) ) ( not ( = ?auto_2299203 ?auto_2299200 ) ) ( not ( = ?auto_2299203 ?auto_2299204 ) ) ( not ( = ?auto_2299203 ?auto_2299206 ) ) ( not ( = ?auto_2299203 ?auto_2299205 ) ) ( not ( = ?auto_2299203 ?auto_2299207 ) ) ( not ( = ?auto_2299203 ?auto_2299208 ) ) ( not ( = ?auto_2299203 ?auto_2299209 ) ) ( not ( = ?auto_2299203 ?auto_2299210 ) ) ( not ( = ?auto_2299203 ?auto_2299211 ) ) ( not ( = ?auto_2299203 ?auto_2299212 ) ) ( not ( = ?auto_2299200 ?auto_2299204 ) ) ( not ( = ?auto_2299200 ?auto_2299206 ) ) ( not ( = ?auto_2299200 ?auto_2299205 ) ) ( not ( = ?auto_2299200 ?auto_2299207 ) ) ( not ( = ?auto_2299200 ?auto_2299208 ) ) ( not ( = ?auto_2299200 ?auto_2299209 ) ) ( not ( = ?auto_2299200 ?auto_2299210 ) ) ( not ( = ?auto_2299200 ?auto_2299211 ) ) ( not ( = ?auto_2299200 ?auto_2299212 ) ) ( not ( = ?auto_2299204 ?auto_2299206 ) ) ( not ( = ?auto_2299204 ?auto_2299205 ) ) ( not ( = ?auto_2299204 ?auto_2299207 ) ) ( not ( = ?auto_2299204 ?auto_2299208 ) ) ( not ( = ?auto_2299204 ?auto_2299209 ) ) ( not ( = ?auto_2299204 ?auto_2299210 ) ) ( not ( = ?auto_2299204 ?auto_2299211 ) ) ( not ( = ?auto_2299204 ?auto_2299212 ) ) ( not ( = ?auto_2299206 ?auto_2299205 ) ) ( not ( = ?auto_2299206 ?auto_2299207 ) ) ( not ( = ?auto_2299206 ?auto_2299208 ) ) ( not ( = ?auto_2299206 ?auto_2299209 ) ) ( not ( = ?auto_2299206 ?auto_2299210 ) ) ( not ( = ?auto_2299206 ?auto_2299211 ) ) ( not ( = ?auto_2299206 ?auto_2299212 ) ) ( not ( = ?auto_2299205 ?auto_2299207 ) ) ( not ( = ?auto_2299205 ?auto_2299208 ) ) ( not ( = ?auto_2299205 ?auto_2299209 ) ) ( not ( = ?auto_2299205 ?auto_2299210 ) ) ( not ( = ?auto_2299205 ?auto_2299211 ) ) ( not ( = ?auto_2299205 ?auto_2299212 ) ) ( not ( = ?auto_2299207 ?auto_2299208 ) ) ( not ( = ?auto_2299207 ?auto_2299209 ) ) ( not ( = ?auto_2299207 ?auto_2299210 ) ) ( not ( = ?auto_2299207 ?auto_2299211 ) ) ( not ( = ?auto_2299207 ?auto_2299212 ) ) ( not ( = ?auto_2299208 ?auto_2299209 ) ) ( not ( = ?auto_2299208 ?auto_2299210 ) ) ( not ( = ?auto_2299208 ?auto_2299211 ) ) ( not ( = ?auto_2299208 ?auto_2299212 ) ) ( not ( = ?auto_2299209 ?auto_2299210 ) ) ( not ( = ?auto_2299209 ?auto_2299211 ) ) ( not ( = ?auto_2299209 ?auto_2299212 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2299210 ?auto_2299211 ?auto_2299212 )
      ( MAKE-12CRATE-VERIFY ?auto_2299201 ?auto_2299202 ?auto_2299203 ?auto_2299200 ?auto_2299204 ?auto_2299206 ?auto_2299205 ?auto_2299207 ?auto_2299208 ?auto_2299209 ?auto_2299210 ?auto_2299211 ?auto_2299212 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2299363 - SURFACE
      ?auto_2299364 - SURFACE
      ?auto_2299365 - SURFACE
      ?auto_2299362 - SURFACE
      ?auto_2299366 - SURFACE
      ?auto_2299368 - SURFACE
      ?auto_2299367 - SURFACE
      ?auto_2299369 - SURFACE
      ?auto_2299370 - SURFACE
      ?auto_2299371 - SURFACE
      ?auto_2299372 - SURFACE
      ?auto_2299373 - SURFACE
      ?auto_2299374 - SURFACE
    )
    :vars
    (
      ?auto_2299380 - HOIST
      ?auto_2299379 - PLACE
      ?auto_2299375 - TRUCK
      ?auto_2299378 - PLACE
      ?auto_2299376 - HOIST
      ?auto_2299377 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2299380 ?auto_2299379 ) ( SURFACE-AT ?auto_2299373 ?auto_2299379 ) ( CLEAR ?auto_2299373 ) ( IS-CRATE ?auto_2299374 ) ( not ( = ?auto_2299373 ?auto_2299374 ) ) ( AVAILABLE ?auto_2299380 ) ( ON ?auto_2299373 ?auto_2299372 ) ( not ( = ?auto_2299372 ?auto_2299373 ) ) ( not ( = ?auto_2299372 ?auto_2299374 ) ) ( TRUCK-AT ?auto_2299375 ?auto_2299378 ) ( not ( = ?auto_2299378 ?auto_2299379 ) ) ( HOIST-AT ?auto_2299376 ?auto_2299378 ) ( not ( = ?auto_2299380 ?auto_2299376 ) ) ( AVAILABLE ?auto_2299376 ) ( SURFACE-AT ?auto_2299374 ?auto_2299378 ) ( ON ?auto_2299374 ?auto_2299377 ) ( CLEAR ?auto_2299374 ) ( not ( = ?auto_2299373 ?auto_2299377 ) ) ( not ( = ?auto_2299374 ?auto_2299377 ) ) ( not ( = ?auto_2299372 ?auto_2299377 ) ) ( ON ?auto_2299364 ?auto_2299363 ) ( ON ?auto_2299365 ?auto_2299364 ) ( ON ?auto_2299362 ?auto_2299365 ) ( ON ?auto_2299366 ?auto_2299362 ) ( ON ?auto_2299368 ?auto_2299366 ) ( ON ?auto_2299367 ?auto_2299368 ) ( ON ?auto_2299369 ?auto_2299367 ) ( ON ?auto_2299370 ?auto_2299369 ) ( ON ?auto_2299371 ?auto_2299370 ) ( ON ?auto_2299372 ?auto_2299371 ) ( not ( = ?auto_2299363 ?auto_2299364 ) ) ( not ( = ?auto_2299363 ?auto_2299365 ) ) ( not ( = ?auto_2299363 ?auto_2299362 ) ) ( not ( = ?auto_2299363 ?auto_2299366 ) ) ( not ( = ?auto_2299363 ?auto_2299368 ) ) ( not ( = ?auto_2299363 ?auto_2299367 ) ) ( not ( = ?auto_2299363 ?auto_2299369 ) ) ( not ( = ?auto_2299363 ?auto_2299370 ) ) ( not ( = ?auto_2299363 ?auto_2299371 ) ) ( not ( = ?auto_2299363 ?auto_2299372 ) ) ( not ( = ?auto_2299363 ?auto_2299373 ) ) ( not ( = ?auto_2299363 ?auto_2299374 ) ) ( not ( = ?auto_2299363 ?auto_2299377 ) ) ( not ( = ?auto_2299364 ?auto_2299365 ) ) ( not ( = ?auto_2299364 ?auto_2299362 ) ) ( not ( = ?auto_2299364 ?auto_2299366 ) ) ( not ( = ?auto_2299364 ?auto_2299368 ) ) ( not ( = ?auto_2299364 ?auto_2299367 ) ) ( not ( = ?auto_2299364 ?auto_2299369 ) ) ( not ( = ?auto_2299364 ?auto_2299370 ) ) ( not ( = ?auto_2299364 ?auto_2299371 ) ) ( not ( = ?auto_2299364 ?auto_2299372 ) ) ( not ( = ?auto_2299364 ?auto_2299373 ) ) ( not ( = ?auto_2299364 ?auto_2299374 ) ) ( not ( = ?auto_2299364 ?auto_2299377 ) ) ( not ( = ?auto_2299365 ?auto_2299362 ) ) ( not ( = ?auto_2299365 ?auto_2299366 ) ) ( not ( = ?auto_2299365 ?auto_2299368 ) ) ( not ( = ?auto_2299365 ?auto_2299367 ) ) ( not ( = ?auto_2299365 ?auto_2299369 ) ) ( not ( = ?auto_2299365 ?auto_2299370 ) ) ( not ( = ?auto_2299365 ?auto_2299371 ) ) ( not ( = ?auto_2299365 ?auto_2299372 ) ) ( not ( = ?auto_2299365 ?auto_2299373 ) ) ( not ( = ?auto_2299365 ?auto_2299374 ) ) ( not ( = ?auto_2299365 ?auto_2299377 ) ) ( not ( = ?auto_2299362 ?auto_2299366 ) ) ( not ( = ?auto_2299362 ?auto_2299368 ) ) ( not ( = ?auto_2299362 ?auto_2299367 ) ) ( not ( = ?auto_2299362 ?auto_2299369 ) ) ( not ( = ?auto_2299362 ?auto_2299370 ) ) ( not ( = ?auto_2299362 ?auto_2299371 ) ) ( not ( = ?auto_2299362 ?auto_2299372 ) ) ( not ( = ?auto_2299362 ?auto_2299373 ) ) ( not ( = ?auto_2299362 ?auto_2299374 ) ) ( not ( = ?auto_2299362 ?auto_2299377 ) ) ( not ( = ?auto_2299366 ?auto_2299368 ) ) ( not ( = ?auto_2299366 ?auto_2299367 ) ) ( not ( = ?auto_2299366 ?auto_2299369 ) ) ( not ( = ?auto_2299366 ?auto_2299370 ) ) ( not ( = ?auto_2299366 ?auto_2299371 ) ) ( not ( = ?auto_2299366 ?auto_2299372 ) ) ( not ( = ?auto_2299366 ?auto_2299373 ) ) ( not ( = ?auto_2299366 ?auto_2299374 ) ) ( not ( = ?auto_2299366 ?auto_2299377 ) ) ( not ( = ?auto_2299368 ?auto_2299367 ) ) ( not ( = ?auto_2299368 ?auto_2299369 ) ) ( not ( = ?auto_2299368 ?auto_2299370 ) ) ( not ( = ?auto_2299368 ?auto_2299371 ) ) ( not ( = ?auto_2299368 ?auto_2299372 ) ) ( not ( = ?auto_2299368 ?auto_2299373 ) ) ( not ( = ?auto_2299368 ?auto_2299374 ) ) ( not ( = ?auto_2299368 ?auto_2299377 ) ) ( not ( = ?auto_2299367 ?auto_2299369 ) ) ( not ( = ?auto_2299367 ?auto_2299370 ) ) ( not ( = ?auto_2299367 ?auto_2299371 ) ) ( not ( = ?auto_2299367 ?auto_2299372 ) ) ( not ( = ?auto_2299367 ?auto_2299373 ) ) ( not ( = ?auto_2299367 ?auto_2299374 ) ) ( not ( = ?auto_2299367 ?auto_2299377 ) ) ( not ( = ?auto_2299369 ?auto_2299370 ) ) ( not ( = ?auto_2299369 ?auto_2299371 ) ) ( not ( = ?auto_2299369 ?auto_2299372 ) ) ( not ( = ?auto_2299369 ?auto_2299373 ) ) ( not ( = ?auto_2299369 ?auto_2299374 ) ) ( not ( = ?auto_2299369 ?auto_2299377 ) ) ( not ( = ?auto_2299370 ?auto_2299371 ) ) ( not ( = ?auto_2299370 ?auto_2299372 ) ) ( not ( = ?auto_2299370 ?auto_2299373 ) ) ( not ( = ?auto_2299370 ?auto_2299374 ) ) ( not ( = ?auto_2299370 ?auto_2299377 ) ) ( not ( = ?auto_2299371 ?auto_2299372 ) ) ( not ( = ?auto_2299371 ?auto_2299373 ) ) ( not ( = ?auto_2299371 ?auto_2299374 ) ) ( not ( = ?auto_2299371 ?auto_2299377 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2299372 ?auto_2299373 ?auto_2299374 )
      ( MAKE-12CRATE-VERIFY ?auto_2299363 ?auto_2299364 ?auto_2299365 ?auto_2299362 ?auto_2299366 ?auto_2299368 ?auto_2299367 ?auto_2299369 ?auto_2299370 ?auto_2299371 ?auto_2299372 ?auto_2299373 ?auto_2299374 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2299526 - SURFACE
      ?auto_2299527 - SURFACE
      ?auto_2299528 - SURFACE
      ?auto_2299525 - SURFACE
      ?auto_2299529 - SURFACE
      ?auto_2299531 - SURFACE
      ?auto_2299530 - SURFACE
      ?auto_2299532 - SURFACE
      ?auto_2299533 - SURFACE
      ?auto_2299534 - SURFACE
      ?auto_2299535 - SURFACE
      ?auto_2299536 - SURFACE
      ?auto_2299537 - SURFACE
    )
    :vars
    (
      ?auto_2299542 - HOIST
      ?auto_2299541 - PLACE
      ?auto_2299543 - PLACE
      ?auto_2299540 - HOIST
      ?auto_2299538 - SURFACE
      ?auto_2299539 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2299542 ?auto_2299541 ) ( SURFACE-AT ?auto_2299536 ?auto_2299541 ) ( CLEAR ?auto_2299536 ) ( IS-CRATE ?auto_2299537 ) ( not ( = ?auto_2299536 ?auto_2299537 ) ) ( AVAILABLE ?auto_2299542 ) ( ON ?auto_2299536 ?auto_2299535 ) ( not ( = ?auto_2299535 ?auto_2299536 ) ) ( not ( = ?auto_2299535 ?auto_2299537 ) ) ( not ( = ?auto_2299543 ?auto_2299541 ) ) ( HOIST-AT ?auto_2299540 ?auto_2299543 ) ( not ( = ?auto_2299542 ?auto_2299540 ) ) ( AVAILABLE ?auto_2299540 ) ( SURFACE-AT ?auto_2299537 ?auto_2299543 ) ( ON ?auto_2299537 ?auto_2299538 ) ( CLEAR ?auto_2299537 ) ( not ( = ?auto_2299536 ?auto_2299538 ) ) ( not ( = ?auto_2299537 ?auto_2299538 ) ) ( not ( = ?auto_2299535 ?auto_2299538 ) ) ( TRUCK-AT ?auto_2299539 ?auto_2299541 ) ( ON ?auto_2299527 ?auto_2299526 ) ( ON ?auto_2299528 ?auto_2299527 ) ( ON ?auto_2299525 ?auto_2299528 ) ( ON ?auto_2299529 ?auto_2299525 ) ( ON ?auto_2299531 ?auto_2299529 ) ( ON ?auto_2299530 ?auto_2299531 ) ( ON ?auto_2299532 ?auto_2299530 ) ( ON ?auto_2299533 ?auto_2299532 ) ( ON ?auto_2299534 ?auto_2299533 ) ( ON ?auto_2299535 ?auto_2299534 ) ( not ( = ?auto_2299526 ?auto_2299527 ) ) ( not ( = ?auto_2299526 ?auto_2299528 ) ) ( not ( = ?auto_2299526 ?auto_2299525 ) ) ( not ( = ?auto_2299526 ?auto_2299529 ) ) ( not ( = ?auto_2299526 ?auto_2299531 ) ) ( not ( = ?auto_2299526 ?auto_2299530 ) ) ( not ( = ?auto_2299526 ?auto_2299532 ) ) ( not ( = ?auto_2299526 ?auto_2299533 ) ) ( not ( = ?auto_2299526 ?auto_2299534 ) ) ( not ( = ?auto_2299526 ?auto_2299535 ) ) ( not ( = ?auto_2299526 ?auto_2299536 ) ) ( not ( = ?auto_2299526 ?auto_2299537 ) ) ( not ( = ?auto_2299526 ?auto_2299538 ) ) ( not ( = ?auto_2299527 ?auto_2299528 ) ) ( not ( = ?auto_2299527 ?auto_2299525 ) ) ( not ( = ?auto_2299527 ?auto_2299529 ) ) ( not ( = ?auto_2299527 ?auto_2299531 ) ) ( not ( = ?auto_2299527 ?auto_2299530 ) ) ( not ( = ?auto_2299527 ?auto_2299532 ) ) ( not ( = ?auto_2299527 ?auto_2299533 ) ) ( not ( = ?auto_2299527 ?auto_2299534 ) ) ( not ( = ?auto_2299527 ?auto_2299535 ) ) ( not ( = ?auto_2299527 ?auto_2299536 ) ) ( not ( = ?auto_2299527 ?auto_2299537 ) ) ( not ( = ?auto_2299527 ?auto_2299538 ) ) ( not ( = ?auto_2299528 ?auto_2299525 ) ) ( not ( = ?auto_2299528 ?auto_2299529 ) ) ( not ( = ?auto_2299528 ?auto_2299531 ) ) ( not ( = ?auto_2299528 ?auto_2299530 ) ) ( not ( = ?auto_2299528 ?auto_2299532 ) ) ( not ( = ?auto_2299528 ?auto_2299533 ) ) ( not ( = ?auto_2299528 ?auto_2299534 ) ) ( not ( = ?auto_2299528 ?auto_2299535 ) ) ( not ( = ?auto_2299528 ?auto_2299536 ) ) ( not ( = ?auto_2299528 ?auto_2299537 ) ) ( not ( = ?auto_2299528 ?auto_2299538 ) ) ( not ( = ?auto_2299525 ?auto_2299529 ) ) ( not ( = ?auto_2299525 ?auto_2299531 ) ) ( not ( = ?auto_2299525 ?auto_2299530 ) ) ( not ( = ?auto_2299525 ?auto_2299532 ) ) ( not ( = ?auto_2299525 ?auto_2299533 ) ) ( not ( = ?auto_2299525 ?auto_2299534 ) ) ( not ( = ?auto_2299525 ?auto_2299535 ) ) ( not ( = ?auto_2299525 ?auto_2299536 ) ) ( not ( = ?auto_2299525 ?auto_2299537 ) ) ( not ( = ?auto_2299525 ?auto_2299538 ) ) ( not ( = ?auto_2299529 ?auto_2299531 ) ) ( not ( = ?auto_2299529 ?auto_2299530 ) ) ( not ( = ?auto_2299529 ?auto_2299532 ) ) ( not ( = ?auto_2299529 ?auto_2299533 ) ) ( not ( = ?auto_2299529 ?auto_2299534 ) ) ( not ( = ?auto_2299529 ?auto_2299535 ) ) ( not ( = ?auto_2299529 ?auto_2299536 ) ) ( not ( = ?auto_2299529 ?auto_2299537 ) ) ( not ( = ?auto_2299529 ?auto_2299538 ) ) ( not ( = ?auto_2299531 ?auto_2299530 ) ) ( not ( = ?auto_2299531 ?auto_2299532 ) ) ( not ( = ?auto_2299531 ?auto_2299533 ) ) ( not ( = ?auto_2299531 ?auto_2299534 ) ) ( not ( = ?auto_2299531 ?auto_2299535 ) ) ( not ( = ?auto_2299531 ?auto_2299536 ) ) ( not ( = ?auto_2299531 ?auto_2299537 ) ) ( not ( = ?auto_2299531 ?auto_2299538 ) ) ( not ( = ?auto_2299530 ?auto_2299532 ) ) ( not ( = ?auto_2299530 ?auto_2299533 ) ) ( not ( = ?auto_2299530 ?auto_2299534 ) ) ( not ( = ?auto_2299530 ?auto_2299535 ) ) ( not ( = ?auto_2299530 ?auto_2299536 ) ) ( not ( = ?auto_2299530 ?auto_2299537 ) ) ( not ( = ?auto_2299530 ?auto_2299538 ) ) ( not ( = ?auto_2299532 ?auto_2299533 ) ) ( not ( = ?auto_2299532 ?auto_2299534 ) ) ( not ( = ?auto_2299532 ?auto_2299535 ) ) ( not ( = ?auto_2299532 ?auto_2299536 ) ) ( not ( = ?auto_2299532 ?auto_2299537 ) ) ( not ( = ?auto_2299532 ?auto_2299538 ) ) ( not ( = ?auto_2299533 ?auto_2299534 ) ) ( not ( = ?auto_2299533 ?auto_2299535 ) ) ( not ( = ?auto_2299533 ?auto_2299536 ) ) ( not ( = ?auto_2299533 ?auto_2299537 ) ) ( not ( = ?auto_2299533 ?auto_2299538 ) ) ( not ( = ?auto_2299534 ?auto_2299535 ) ) ( not ( = ?auto_2299534 ?auto_2299536 ) ) ( not ( = ?auto_2299534 ?auto_2299537 ) ) ( not ( = ?auto_2299534 ?auto_2299538 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2299535 ?auto_2299536 ?auto_2299537 )
      ( MAKE-12CRATE-VERIFY ?auto_2299526 ?auto_2299527 ?auto_2299528 ?auto_2299525 ?auto_2299529 ?auto_2299531 ?auto_2299530 ?auto_2299532 ?auto_2299533 ?auto_2299534 ?auto_2299535 ?auto_2299536 ?auto_2299537 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2299689 - SURFACE
      ?auto_2299690 - SURFACE
      ?auto_2299691 - SURFACE
      ?auto_2299688 - SURFACE
      ?auto_2299692 - SURFACE
      ?auto_2299694 - SURFACE
      ?auto_2299693 - SURFACE
      ?auto_2299695 - SURFACE
      ?auto_2299696 - SURFACE
      ?auto_2299697 - SURFACE
      ?auto_2299698 - SURFACE
      ?auto_2299699 - SURFACE
      ?auto_2299700 - SURFACE
    )
    :vars
    (
      ?auto_2299705 - HOIST
      ?auto_2299706 - PLACE
      ?auto_2299704 - PLACE
      ?auto_2299703 - HOIST
      ?auto_2299701 - SURFACE
      ?auto_2299702 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2299705 ?auto_2299706 ) ( IS-CRATE ?auto_2299700 ) ( not ( = ?auto_2299699 ?auto_2299700 ) ) ( not ( = ?auto_2299698 ?auto_2299699 ) ) ( not ( = ?auto_2299698 ?auto_2299700 ) ) ( not ( = ?auto_2299704 ?auto_2299706 ) ) ( HOIST-AT ?auto_2299703 ?auto_2299704 ) ( not ( = ?auto_2299705 ?auto_2299703 ) ) ( AVAILABLE ?auto_2299703 ) ( SURFACE-AT ?auto_2299700 ?auto_2299704 ) ( ON ?auto_2299700 ?auto_2299701 ) ( CLEAR ?auto_2299700 ) ( not ( = ?auto_2299699 ?auto_2299701 ) ) ( not ( = ?auto_2299700 ?auto_2299701 ) ) ( not ( = ?auto_2299698 ?auto_2299701 ) ) ( TRUCK-AT ?auto_2299702 ?auto_2299706 ) ( SURFACE-AT ?auto_2299698 ?auto_2299706 ) ( CLEAR ?auto_2299698 ) ( LIFTING ?auto_2299705 ?auto_2299699 ) ( IS-CRATE ?auto_2299699 ) ( ON ?auto_2299690 ?auto_2299689 ) ( ON ?auto_2299691 ?auto_2299690 ) ( ON ?auto_2299688 ?auto_2299691 ) ( ON ?auto_2299692 ?auto_2299688 ) ( ON ?auto_2299694 ?auto_2299692 ) ( ON ?auto_2299693 ?auto_2299694 ) ( ON ?auto_2299695 ?auto_2299693 ) ( ON ?auto_2299696 ?auto_2299695 ) ( ON ?auto_2299697 ?auto_2299696 ) ( ON ?auto_2299698 ?auto_2299697 ) ( not ( = ?auto_2299689 ?auto_2299690 ) ) ( not ( = ?auto_2299689 ?auto_2299691 ) ) ( not ( = ?auto_2299689 ?auto_2299688 ) ) ( not ( = ?auto_2299689 ?auto_2299692 ) ) ( not ( = ?auto_2299689 ?auto_2299694 ) ) ( not ( = ?auto_2299689 ?auto_2299693 ) ) ( not ( = ?auto_2299689 ?auto_2299695 ) ) ( not ( = ?auto_2299689 ?auto_2299696 ) ) ( not ( = ?auto_2299689 ?auto_2299697 ) ) ( not ( = ?auto_2299689 ?auto_2299698 ) ) ( not ( = ?auto_2299689 ?auto_2299699 ) ) ( not ( = ?auto_2299689 ?auto_2299700 ) ) ( not ( = ?auto_2299689 ?auto_2299701 ) ) ( not ( = ?auto_2299690 ?auto_2299691 ) ) ( not ( = ?auto_2299690 ?auto_2299688 ) ) ( not ( = ?auto_2299690 ?auto_2299692 ) ) ( not ( = ?auto_2299690 ?auto_2299694 ) ) ( not ( = ?auto_2299690 ?auto_2299693 ) ) ( not ( = ?auto_2299690 ?auto_2299695 ) ) ( not ( = ?auto_2299690 ?auto_2299696 ) ) ( not ( = ?auto_2299690 ?auto_2299697 ) ) ( not ( = ?auto_2299690 ?auto_2299698 ) ) ( not ( = ?auto_2299690 ?auto_2299699 ) ) ( not ( = ?auto_2299690 ?auto_2299700 ) ) ( not ( = ?auto_2299690 ?auto_2299701 ) ) ( not ( = ?auto_2299691 ?auto_2299688 ) ) ( not ( = ?auto_2299691 ?auto_2299692 ) ) ( not ( = ?auto_2299691 ?auto_2299694 ) ) ( not ( = ?auto_2299691 ?auto_2299693 ) ) ( not ( = ?auto_2299691 ?auto_2299695 ) ) ( not ( = ?auto_2299691 ?auto_2299696 ) ) ( not ( = ?auto_2299691 ?auto_2299697 ) ) ( not ( = ?auto_2299691 ?auto_2299698 ) ) ( not ( = ?auto_2299691 ?auto_2299699 ) ) ( not ( = ?auto_2299691 ?auto_2299700 ) ) ( not ( = ?auto_2299691 ?auto_2299701 ) ) ( not ( = ?auto_2299688 ?auto_2299692 ) ) ( not ( = ?auto_2299688 ?auto_2299694 ) ) ( not ( = ?auto_2299688 ?auto_2299693 ) ) ( not ( = ?auto_2299688 ?auto_2299695 ) ) ( not ( = ?auto_2299688 ?auto_2299696 ) ) ( not ( = ?auto_2299688 ?auto_2299697 ) ) ( not ( = ?auto_2299688 ?auto_2299698 ) ) ( not ( = ?auto_2299688 ?auto_2299699 ) ) ( not ( = ?auto_2299688 ?auto_2299700 ) ) ( not ( = ?auto_2299688 ?auto_2299701 ) ) ( not ( = ?auto_2299692 ?auto_2299694 ) ) ( not ( = ?auto_2299692 ?auto_2299693 ) ) ( not ( = ?auto_2299692 ?auto_2299695 ) ) ( not ( = ?auto_2299692 ?auto_2299696 ) ) ( not ( = ?auto_2299692 ?auto_2299697 ) ) ( not ( = ?auto_2299692 ?auto_2299698 ) ) ( not ( = ?auto_2299692 ?auto_2299699 ) ) ( not ( = ?auto_2299692 ?auto_2299700 ) ) ( not ( = ?auto_2299692 ?auto_2299701 ) ) ( not ( = ?auto_2299694 ?auto_2299693 ) ) ( not ( = ?auto_2299694 ?auto_2299695 ) ) ( not ( = ?auto_2299694 ?auto_2299696 ) ) ( not ( = ?auto_2299694 ?auto_2299697 ) ) ( not ( = ?auto_2299694 ?auto_2299698 ) ) ( not ( = ?auto_2299694 ?auto_2299699 ) ) ( not ( = ?auto_2299694 ?auto_2299700 ) ) ( not ( = ?auto_2299694 ?auto_2299701 ) ) ( not ( = ?auto_2299693 ?auto_2299695 ) ) ( not ( = ?auto_2299693 ?auto_2299696 ) ) ( not ( = ?auto_2299693 ?auto_2299697 ) ) ( not ( = ?auto_2299693 ?auto_2299698 ) ) ( not ( = ?auto_2299693 ?auto_2299699 ) ) ( not ( = ?auto_2299693 ?auto_2299700 ) ) ( not ( = ?auto_2299693 ?auto_2299701 ) ) ( not ( = ?auto_2299695 ?auto_2299696 ) ) ( not ( = ?auto_2299695 ?auto_2299697 ) ) ( not ( = ?auto_2299695 ?auto_2299698 ) ) ( not ( = ?auto_2299695 ?auto_2299699 ) ) ( not ( = ?auto_2299695 ?auto_2299700 ) ) ( not ( = ?auto_2299695 ?auto_2299701 ) ) ( not ( = ?auto_2299696 ?auto_2299697 ) ) ( not ( = ?auto_2299696 ?auto_2299698 ) ) ( not ( = ?auto_2299696 ?auto_2299699 ) ) ( not ( = ?auto_2299696 ?auto_2299700 ) ) ( not ( = ?auto_2299696 ?auto_2299701 ) ) ( not ( = ?auto_2299697 ?auto_2299698 ) ) ( not ( = ?auto_2299697 ?auto_2299699 ) ) ( not ( = ?auto_2299697 ?auto_2299700 ) ) ( not ( = ?auto_2299697 ?auto_2299701 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2299698 ?auto_2299699 ?auto_2299700 )
      ( MAKE-12CRATE-VERIFY ?auto_2299689 ?auto_2299690 ?auto_2299691 ?auto_2299688 ?auto_2299692 ?auto_2299694 ?auto_2299693 ?auto_2299695 ?auto_2299696 ?auto_2299697 ?auto_2299698 ?auto_2299699 ?auto_2299700 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2299852 - SURFACE
      ?auto_2299853 - SURFACE
      ?auto_2299854 - SURFACE
      ?auto_2299851 - SURFACE
      ?auto_2299855 - SURFACE
      ?auto_2299857 - SURFACE
      ?auto_2299856 - SURFACE
      ?auto_2299858 - SURFACE
      ?auto_2299859 - SURFACE
      ?auto_2299860 - SURFACE
      ?auto_2299861 - SURFACE
      ?auto_2299862 - SURFACE
      ?auto_2299863 - SURFACE
    )
    :vars
    (
      ?auto_2299869 - HOIST
      ?auto_2299864 - PLACE
      ?auto_2299865 - PLACE
      ?auto_2299866 - HOIST
      ?auto_2299867 - SURFACE
      ?auto_2299868 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2299869 ?auto_2299864 ) ( IS-CRATE ?auto_2299863 ) ( not ( = ?auto_2299862 ?auto_2299863 ) ) ( not ( = ?auto_2299861 ?auto_2299862 ) ) ( not ( = ?auto_2299861 ?auto_2299863 ) ) ( not ( = ?auto_2299865 ?auto_2299864 ) ) ( HOIST-AT ?auto_2299866 ?auto_2299865 ) ( not ( = ?auto_2299869 ?auto_2299866 ) ) ( AVAILABLE ?auto_2299866 ) ( SURFACE-AT ?auto_2299863 ?auto_2299865 ) ( ON ?auto_2299863 ?auto_2299867 ) ( CLEAR ?auto_2299863 ) ( not ( = ?auto_2299862 ?auto_2299867 ) ) ( not ( = ?auto_2299863 ?auto_2299867 ) ) ( not ( = ?auto_2299861 ?auto_2299867 ) ) ( TRUCK-AT ?auto_2299868 ?auto_2299864 ) ( SURFACE-AT ?auto_2299861 ?auto_2299864 ) ( CLEAR ?auto_2299861 ) ( IS-CRATE ?auto_2299862 ) ( AVAILABLE ?auto_2299869 ) ( IN ?auto_2299862 ?auto_2299868 ) ( ON ?auto_2299853 ?auto_2299852 ) ( ON ?auto_2299854 ?auto_2299853 ) ( ON ?auto_2299851 ?auto_2299854 ) ( ON ?auto_2299855 ?auto_2299851 ) ( ON ?auto_2299857 ?auto_2299855 ) ( ON ?auto_2299856 ?auto_2299857 ) ( ON ?auto_2299858 ?auto_2299856 ) ( ON ?auto_2299859 ?auto_2299858 ) ( ON ?auto_2299860 ?auto_2299859 ) ( ON ?auto_2299861 ?auto_2299860 ) ( not ( = ?auto_2299852 ?auto_2299853 ) ) ( not ( = ?auto_2299852 ?auto_2299854 ) ) ( not ( = ?auto_2299852 ?auto_2299851 ) ) ( not ( = ?auto_2299852 ?auto_2299855 ) ) ( not ( = ?auto_2299852 ?auto_2299857 ) ) ( not ( = ?auto_2299852 ?auto_2299856 ) ) ( not ( = ?auto_2299852 ?auto_2299858 ) ) ( not ( = ?auto_2299852 ?auto_2299859 ) ) ( not ( = ?auto_2299852 ?auto_2299860 ) ) ( not ( = ?auto_2299852 ?auto_2299861 ) ) ( not ( = ?auto_2299852 ?auto_2299862 ) ) ( not ( = ?auto_2299852 ?auto_2299863 ) ) ( not ( = ?auto_2299852 ?auto_2299867 ) ) ( not ( = ?auto_2299853 ?auto_2299854 ) ) ( not ( = ?auto_2299853 ?auto_2299851 ) ) ( not ( = ?auto_2299853 ?auto_2299855 ) ) ( not ( = ?auto_2299853 ?auto_2299857 ) ) ( not ( = ?auto_2299853 ?auto_2299856 ) ) ( not ( = ?auto_2299853 ?auto_2299858 ) ) ( not ( = ?auto_2299853 ?auto_2299859 ) ) ( not ( = ?auto_2299853 ?auto_2299860 ) ) ( not ( = ?auto_2299853 ?auto_2299861 ) ) ( not ( = ?auto_2299853 ?auto_2299862 ) ) ( not ( = ?auto_2299853 ?auto_2299863 ) ) ( not ( = ?auto_2299853 ?auto_2299867 ) ) ( not ( = ?auto_2299854 ?auto_2299851 ) ) ( not ( = ?auto_2299854 ?auto_2299855 ) ) ( not ( = ?auto_2299854 ?auto_2299857 ) ) ( not ( = ?auto_2299854 ?auto_2299856 ) ) ( not ( = ?auto_2299854 ?auto_2299858 ) ) ( not ( = ?auto_2299854 ?auto_2299859 ) ) ( not ( = ?auto_2299854 ?auto_2299860 ) ) ( not ( = ?auto_2299854 ?auto_2299861 ) ) ( not ( = ?auto_2299854 ?auto_2299862 ) ) ( not ( = ?auto_2299854 ?auto_2299863 ) ) ( not ( = ?auto_2299854 ?auto_2299867 ) ) ( not ( = ?auto_2299851 ?auto_2299855 ) ) ( not ( = ?auto_2299851 ?auto_2299857 ) ) ( not ( = ?auto_2299851 ?auto_2299856 ) ) ( not ( = ?auto_2299851 ?auto_2299858 ) ) ( not ( = ?auto_2299851 ?auto_2299859 ) ) ( not ( = ?auto_2299851 ?auto_2299860 ) ) ( not ( = ?auto_2299851 ?auto_2299861 ) ) ( not ( = ?auto_2299851 ?auto_2299862 ) ) ( not ( = ?auto_2299851 ?auto_2299863 ) ) ( not ( = ?auto_2299851 ?auto_2299867 ) ) ( not ( = ?auto_2299855 ?auto_2299857 ) ) ( not ( = ?auto_2299855 ?auto_2299856 ) ) ( not ( = ?auto_2299855 ?auto_2299858 ) ) ( not ( = ?auto_2299855 ?auto_2299859 ) ) ( not ( = ?auto_2299855 ?auto_2299860 ) ) ( not ( = ?auto_2299855 ?auto_2299861 ) ) ( not ( = ?auto_2299855 ?auto_2299862 ) ) ( not ( = ?auto_2299855 ?auto_2299863 ) ) ( not ( = ?auto_2299855 ?auto_2299867 ) ) ( not ( = ?auto_2299857 ?auto_2299856 ) ) ( not ( = ?auto_2299857 ?auto_2299858 ) ) ( not ( = ?auto_2299857 ?auto_2299859 ) ) ( not ( = ?auto_2299857 ?auto_2299860 ) ) ( not ( = ?auto_2299857 ?auto_2299861 ) ) ( not ( = ?auto_2299857 ?auto_2299862 ) ) ( not ( = ?auto_2299857 ?auto_2299863 ) ) ( not ( = ?auto_2299857 ?auto_2299867 ) ) ( not ( = ?auto_2299856 ?auto_2299858 ) ) ( not ( = ?auto_2299856 ?auto_2299859 ) ) ( not ( = ?auto_2299856 ?auto_2299860 ) ) ( not ( = ?auto_2299856 ?auto_2299861 ) ) ( not ( = ?auto_2299856 ?auto_2299862 ) ) ( not ( = ?auto_2299856 ?auto_2299863 ) ) ( not ( = ?auto_2299856 ?auto_2299867 ) ) ( not ( = ?auto_2299858 ?auto_2299859 ) ) ( not ( = ?auto_2299858 ?auto_2299860 ) ) ( not ( = ?auto_2299858 ?auto_2299861 ) ) ( not ( = ?auto_2299858 ?auto_2299862 ) ) ( not ( = ?auto_2299858 ?auto_2299863 ) ) ( not ( = ?auto_2299858 ?auto_2299867 ) ) ( not ( = ?auto_2299859 ?auto_2299860 ) ) ( not ( = ?auto_2299859 ?auto_2299861 ) ) ( not ( = ?auto_2299859 ?auto_2299862 ) ) ( not ( = ?auto_2299859 ?auto_2299863 ) ) ( not ( = ?auto_2299859 ?auto_2299867 ) ) ( not ( = ?auto_2299860 ?auto_2299861 ) ) ( not ( = ?auto_2299860 ?auto_2299862 ) ) ( not ( = ?auto_2299860 ?auto_2299863 ) ) ( not ( = ?auto_2299860 ?auto_2299867 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2299861 ?auto_2299862 ?auto_2299863 )
      ( MAKE-12CRATE-VERIFY ?auto_2299852 ?auto_2299853 ?auto_2299854 ?auto_2299851 ?auto_2299855 ?auto_2299857 ?auto_2299856 ?auto_2299858 ?auto_2299859 ?auto_2299860 ?auto_2299861 ?auto_2299862 ?auto_2299863 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_2311408 - SURFACE
      ?auto_2311409 - SURFACE
      ?auto_2311410 - SURFACE
      ?auto_2311407 - SURFACE
      ?auto_2311411 - SURFACE
      ?auto_2311413 - SURFACE
      ?auto_2311412 - SURFACE
      ?auto_2311414 - SURFACE
      ?auto_2311415 - SURFACE
      ?auto_2311416 - SURFACE
      ?auto_2311417 - SURFACE
      ?auto_2311418 - SURFACE
      ?auto_2311419 - SURFACE
      ?auto_2311420 - SURFACE
    )
    :vars
    (
      ?auto_2311421 - HOIST
      ?auto_2311422 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2311421 ?auto_2311422 ) ( SURFACE-AT ?auto_2311419 ?auto_2311422 ) ( CLEAR ?auto_2311419 ) ( LIFTING ?auto_2311421 ?auto_2311420 ) ( IS-CRATE ?auto_2311420 ) ( not ( = ?auto_2311419 ?auto_2311420 ) ) ( ON ?auto_2311409 ?auto_2311408 ) ( ON ?auto_2311410 ?auto_2311409 ) ( ON ?auto_2311407 ?auto_2311410 ) ( ON ?auto_2311411 ?auto_2311407 ) ( ON ?auto_2311413 ?auto_2311411 ) ( ON ?auto_2311412 ?auto_2311413 ) ( ON ?auto_2311414 ?auto_2311412 ) ( ON ?auto_2311415 ?auto_2311414 ) ( ON ?auto_2311416 ?auto_2311415 ) ( ON ?auto_2311417 ?auto_2311416 ) ( ON ?auto_2311418 ?auto_2311417 ) ( ON ?auto_2311419 ?auto_2311418 ) ( not ( = ?auto_2311408 ?auto_2311409 ) ) ( not ( = ?auto_2311408 ?auto_2311410 ) ) ( not ( = ?auto_2311408 ?auto_2311407 ) ) ( not ( = ?auto_2311408 ?auto_2311411 ) ) ( not ( = ?auto_2311408 ?auto_2311413 ) ) ( not ( = ?auto_2311408 ?auto_2311412 ) ) ( not ( = ?auto_2311408 ?auto_2311414 ) ) ( not ( = ?auto_2311408 ?auto_2311415 ) ) ( not ( = ?auto_2311408 ?auto_2311416 ) ) ( not ( = ?auto_2311408 ?auto_2311417 ) ) ( not ( = ?auto_2311408 ?auto_2311418 ) ) ( not ( = ?auto_2311408 ?auto_2311419 ) ) ( not ( = ?auto_2311408 ?auto_2311420 ) ) ( not ( = ?auto_2311409 ?auto_2311410 ) ) ( not ( = ?auto_2311409 ?auto_2311407 ) ) ( not ( = ?auto_2311409 ?auto_2311411 ) ) ( not ( = ?auto_2311409 ?auto_2311413 ) ) ( not ( = ?auto_2311409 ?auto_2311412 ) ) ( not ( = ?auto_2311409 ?auto_2311414 ) ) ( not ( = ?auto_2311409 ?auto_2311415 ) ) ( not ( = ?auto_2311409 ?auto_2311416 ) ) ( not ( = ?auto_2311409 ?auto_2311417 ) ) ( not ( = ?auto_2311409 ?auto_2311418 ) ) ( not ( = ?auto_2311409 ?auto_2311419 ) ) ( not ( = ?auto_2311409 ?auto_2311420 ) ) ( not ( = ?auto_2311410 ?auto_2311407 ) ) ( not ( = ?auto_2311410 ?auto_2311411 ) ) ( not ( = ?auto_2311410 ?auto_2311413 ) ) ( not ( = ?auto_2311410 ?auto_2311412 ) ) ( not ( = ?auto_2311410 ?auto_2311414 ) ) ( not ( = ?auto_2311410 ?auto_2311415 ) ) ( not ( = ?auto_2311410 ?auto_2311416 ) ) ( not ( = ?auto_2311410 ?auto_2311417 ) ) ( not ( = ?auto_2311410 ?auto_2311418 ) ) ( not ( = ?auto_2311410 ?auto_2311419 ) ) ( not ( = ?auto_2311410 ?auto_2311420 ) ) ( not ( = ?auto_2311407 ?auto_2311411 ) ) ( not ( = ?auto_2311407 ?auto_2311413 ) ) ( not ( = ?auto_2311407 ?auto_2311412 ) ) ( not ( = ?auto_2311407 ?auto_2311414 ) ) ( not ( = ?auto_2311407 ?auto_2311415 ) ) ( not ( = ?auto_2311407 ?auto_2311416 ) ) ( not ( = ?auto_2311407 ?auto_2311417 ) ) ( not ( = ?auto_2311407 ?auto_2311418 ) ) ( not ( = ?auto_2311407 ?auto_2311419 ) ) ( not ( = ?auto_2311407 ?auto_2311420 ) ) ( not ( = ?auto_2311411 ?auto_2311413 ) ) ( not ( = ?auto_2311411 ?auto_2311412 ) ) ( not ( = ?auto_2311411 ?auto_2311414 ) ) ( not ( = ?auto_2311411 ?auto_2311415 ) ) ( not ( = ?auto_2311411 ?auto_2311416 ) ) ( not ( = ?auto_2311411 ?auto_2311417 ) ) ( not ( = ?auto_2311411 ?auto_2311418 ) ) ( not ( = ?auto_2311411 ?auto_2311419 ) ) ( not ( = ?auto_2311411 ?auto_2311420 ) ) ( not ( = ?auto_2311413 ?auto_2311412 ) ) ( not ( = ?auto_2311413 ?auto_2311414 ) ) ( not ( = ?auto_2311413 ?auto_2311415 ) ) ( not ( = ?auto_2311413 ?auto_2311416 ) ) ( not ( = ?auto_2311413 ?auto_2311417 ) ) ( not ( = ?auto_2311413 ?auto_2311418 ) ) ( not ( = ?auto_2311413 ?auto_2311419 ) ) ( not ( = ?auto_2311413 ?auto_2311420 ) ) ( not ( = ?auto_2311412 ?auto_2311414 ) ) ( not ( = ?auto_2311412 ?auto_2311415 ) ) ( not ( = ?auto_2311412 ?auto_2311416 ) ) ( not ( = ?auto_2311412 ?auto_2311417 ) ) ( not ( = ?auto_2311412 ?auto_2311418 ) ) ( not ( = ?auto_2311412 ?auto_2311419 ) ) ( not ( = ?auto_2311412 ?auto_2311420 ) ) ( not ( = ?auto_2311414 ?auto_2311415 ) ) ( not ( = ?auto_2311414 ?auto_2311416 ) ) ( not ( = ?auto_2311414 ?auto_2311417 ) ) ( not ( = ?auto_2311414 ?auto_2311418 ) ) ( not ( = ?auto_2311414 ?auto_2311419 ) ) ( not ( = ?auto_2311414 ?auto_2311420 ) ) ( not ( = ?auto_2311415 ?auto_2311416 ) ) ( not ( = ?auto_2311415 ?auto_2311417 ) ) ( not ( = ?auto_2311415 ?auto_2311418 ) ) ( not ( = ?auto_2311415 ?auto_2311419 ) ) ( not ( = ?auto_2311415 ?auto_2311420 ) ) ( not ( = ?auto_2311416 ?auto_2311417 ) ) ( not ( = ?auto_2311416 ?auto_2311418 ) ) ( not ( = ?auto_2311416 ?auto_2311419 ) ) ( not ( = ?auto_2311416 ?auto_2311420 ) ) ( not ( = ?auto_2311417 ?auto_2311418 ) ) ( not ( = ?auto_2311417 ?auto_2311419 ) ) ( not ( = ?auto_2311417 ?auto_2311420 ) ) ( not ( = ?auto_2311418 ?auto_2311419 ) ) ( not ( = ?auto_2311418 ?auto_2311420 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2311419 ?auto_2311420 )
      ( MAKE-13CRATE-VERIFY ?auto_2311408 ?auto_2311409 ?auto_2311410 ?auto_2311407 ?auto_2311411 ?auto_2311413 ?auto_2311412 ?auto_2311414 ?auto_2311415 ?auto_2311416 ?auto_2311417 ?auto_2311418 ?auto_2311419 ?auto_2311420 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_2311550 - SURFACE
      ?auto_2311551 - SURFACE
      ?auto_2311552 - SURFACE
      ?auto_2311549 - SURFACE
      ?auto_2311553 - SURFACE
      ?auto_2311555 - SURFACE
      ?auto_2311554 - SURFACE
      ?auto_2311556 - SURFACE
      ?auto_2311557 - SURFACE
      ?auto_2311558 - SURFACE
      ?auto_2311559 - SURFACE
      ?auto_2311560 - SURFACE
      ?auto_2311561 - SURFACE
      ?auto_2311562 - SURFACE
    )
    :vars
    (
      ?auto_2311563 - HOIST
      ?auto_2311565 - PLACE
      ?auto_2311564 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2311563 ?auto_2311565 ) ( SURFACE-AT ?auto_2311561 ?auto_2311565 ) ( CLEAR ?auto_2311561 ) ( IS-CRATE ?auto_2311562 ) ( not ( = ?auto_2311561 ?auto_2311562 ) ) ( TRUCK-AT ?auto_2311564 ?auto_2311565 ) ( AVAILABLE ?auto_2311563 ) ( IN ?auto_2311562 ?auto_2311564 ) ( ON ?auto_2311561 ?auto_2311560 ) ( not ( = ?auto_2311560 ?auto_2311561 ) ) ( not ( = ?auto_2311560 ?auto_2311562 ) ) ( ON ?auto_2311551 ?auto_2311550 ) ( ON ?auto_2311552 ?auto_2311551 ) ( ON ?auto_2311549 ?auto_2311552 ) ( ON ?auto_2311553 ?auto_2311549 ) ( ON ?auto_2311555 ?auto_2311553 ) ( ON ?auto_2311554 ?auto_2311555 ) ( ON ?auto_2311556 ?auto_2311554 ) ( ON ?auto_2311557 ?auto_2311556 ) ( ON ?auto_2311558 ?auto_2311557 ) ( ON ?auto_2311559 ?auto_2311558 ) ( ON ?auto_2311560 ?auto_2311559 ) ( not ( = ?auto_2311550 ?auto_2311551 ) ) ( not ( = ?auto_2311550 ?auto_2311552 ) ) ( not ( = ?auto_2311550 ?auto_2311549 ) ) ( not ( = ?auto_2311550 ?auto_2311553 ) ) ( not ( = ?auto_2311550 ?auto_2311555 ) ) ( not ( = ?auto_2311550 ?auto_2311554 ) ) ( not ( = ?auto_2311550 ?auto_2311556 ) ) ( not ( = ?auto_2311550 ?auto_2311557 ) ) ( not ( = ?auto_2311550 ?auto_2311558 ) ) ( not ( = ?auto_2311550 ?auto_2311559 ) ) ( not ( = ?auto_2311550 ?auto_2311560 ) ) ( not ( = ?auto_2311550 ?auto_2311561 ) ) ( not ( = ?auto_2311550 ?auto_2311562 ) ) ( not ( = ?auto_2311551 ?auto_2311552 ) ) ( not ( = ?auto_2311551 ?auto_2311549 ) ) ( not ( = ?auto_2311551 ?auto_2311553 ) ) ( not ( = ?auto_2311551 ?auto_2311555 ) ) ( not ( = ?auto_2311551 ?auto_2311554 ) ) ( not ( = ?auto_2311551 ?auto_2311556 ) ) ( not ( = ?auto_2311551 ?auto_2311557 ) ) ( not ( = ?auto_2311551 ?auto_2311558 ) ) ( not ( = ?auto_2311551 ?auto_2311559 ) ) ( not ( = ?auto_2311551 ?auto_2311560 ) ) ( not ( = ?auto_2311551 ?auto_2311561 ) ) ( not ( = ?auto_2311551 ?auto_2311562 ) ) ( not ( = ?auto_2311552 ?auto_2311549 ) ) ( not ( = ?auto_2311552 ?auto_2311553 ) ) ( not ( = ?auto_2311552 ?auto_2311555 ) ) ( not ( = ?auto_2311552 ?auto_2311554 ) ) ( not ( = ?auto_2311552 ?auto_2311556 ) ) ( not ( = ?auto_2311552 ?auto_2311557 ) ) ( not ( = ?auto_2311552 ?auto_2311558 ) ) ( not ( = ?auto_2311552 ?auto_2311559 ) ) ( not ( = ?auto_2311552 ?auto_2311560 ) ) ( not ( = ?auto_2311552 ?auto_2311561 ) ) ( not ( = ?auto_2311552 ?auto_2311562 ) ) ( not ( = ?auto_2311549 ?auto_2311553 ) ) ( not ( = ?auto_2311549 ?auto_2311555 ) ) ( not ( = ?auto_2311549 ?auto_2311554 ) ) ( not ( = ?auto_2311549 ?auto_2311556 ) ) ( not ( = ?auto_2311549 ?auto_2311557 ) ) ( not ( = ?auto_2311549 ?auto_2311558 ) ) ( not ( = ?auto_2311549 ?auto_2311559 ) ) ( not ( = ?auto_2311549 ?auto_2311560 ) ) ( not ( = ?auto_2311549 ?auto_2311561 ) ) ( not ( = ?auto_2311549 ?auto_2311562 ) ) ( not ( = ?auto_2311553 ?auto_2311555 ) ) ( not ( = ?auto_2311553 ?auto_2311554 ) ) ( not ( = ?auto_2311553 ?auto_2311556 ) ) ( not ( = ?auto_2311553 ?auto_2311557 ) ) ( not ( = ?auto_2311553 ?auto_2311558 ) ) ( not ( = ?auto_2311553 ?auto_2311559 ) ) ( not ( = ?auto_2311553 ?auto_2311560 ) ) ( not ( = ?auto_2311553 ?auto_2311561 ) ) ( not ( = ?auto_2311553 ?auto_2311562 ) ) ( not ( = ?auto_2311555 ?auto_2311554 ) ) ( not ( = ?auto_2311555 ?auto_2311556 ) ) ( not ( = ?auto_2311555 ?auto_2311557 ) ) ( not ( = ?auto_2311555 ?auto_2311558 ) ) ( not ( = ?auto_2311555 ?auto_2311559 ) ) ( not ( = ?auto_2311555 ?auto_2311560 ) ) ( not ( = ?auto_2311555 ?auto_2311561 ) ) ( not ( = ?auto_2311555 ?auto_2311562 ) ) ( not ( = ?auto_2311554 ?auto_2311556 ) ) ( not ( = ?auto_2311554 ?auto_2311557 ) ) ( not ( = ?auto_2311554 ?auto_2311558 ) ) ( not ( = ?auto_2311554 ?auto_2311559 ) ) ( not ( = ?auto_2311554 ?auto_2311560 ) ) ( not ( = ?auto_2311554 ?auto_2311561 ) ) ( not ( = ?auto_2311554 ?auto_2311562 ) ) ( not ( = ?auto_2311556 ?auto_2311557 ) ) ( not ( = ?auto_2311556 ?auto_2311558 ) ) ( not ( = ?auto_2311556 ?auto_2311559 ) ) ( not ( = ?auto_2311556 ?auto_2311560 ) ) ( not ( = ?auto_2311556 ?auto_2311561 ) ) ( not ( = ?auto_2311556 ?auto_2311562 ) ) ( not ( = ?auto_2311557 ?auto_2311558 ) ) ( not ( = ?auto_2311557 ?auto_2311559 ) ) ( not ( = ?auto_2311557 ?auto_2311560 ) ) ( not ( = ?auto_2311557 ?auto_2311561 ) ) ( not ( = ?auto_2311557 ?auto_2311562 ) ) ( not ( = ?auto_2311558 ?auto_2311559 ) ) ( not ( = ?auto_2311558 ?auto_2311560 ) ) ( not ( = ?auto_2311558 ?auto_2311561 ) ) ( not ( = ?auto_2311558 ?auto_2311562 ) ) ( not ( = ?auto_2311559 ?auto_2311560 ) ) ( not ( = ?auto_2311559 ?auto_2311561 ) ) ( not ( = ?auto_2311559 ?auto_2311562 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2311560 ?auto_2311561 ?auto_2311562 )
      ( MAKE-13CRATE-VERIFY ?auto_2311550 ?auto_2311551 ?auto_2311552 ?auto_2311549 ?auto_2311553 ?auto_2311555 ?auto_2311554 ?auto_2311556 ?auto_2311557 ?auto_2311558 ?auto_2311559 ?auto_2311560 ?auto_2311561 ?auto_2311562 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_2311706 - SURFACE
      ?auto_2311707 - SURFACE
      ?auto_2311708 - SURFACE
      ?auto_2311705 - SURFACE
      ?auto_2311709 - SURFACE
      ?auto_2311711 - SURFACE
      ?auto_2311710 - SURFACE
      ?auto_2311712 - SURFACE
      ?auto_2311713 - SURFACE
      ?auto_2311714 - SURFACE
      ?auto_2311715 - SURFACE
      ?auto_2311716 - SURFACE
      ?auto_2311717 - SURFACE
      ?auto_2311718 - SURFACE
    )
    :vars
    (
      ?auto_2311722 - HOIST
      ?auto_2311720 - PLACE
      ?auto_2311719 - TRUCK
      ?auto_2311721 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2311722 ?auto_2311720 ) ( SURFACE-AT ?auto_2311717 ?auto_2311720 ) ( CLEAR ?auto_2311717 ) ( IS-CRATE ?auto_2311718 ) ( not ( = ?auto_2311717 ?auto_2311718 ) ) ( AVAILABLE ?auto_2311722 ) ( IN ?auto_2311718 ?auto_2311719 ) ( ON ?auto_2311717 ?auto_2311716 ) ( not ( = ?auto_2311716 ?auto_2311717 ) ) ( not ( = ?auto_2311716 ?auto_2311718 ) ) ( TRUCK-AT ?auto_2311719 ?auto_2311721 ) ( not ( = ?auto_2311721 ?auto_2311720 ) ) ( ON ?auto_2311707 ?auto_2311706 ) ( ON ?auto_2311708 ?auto_2311707 ) ( ON ?auto_2311705 ?auto_2311708 ) ( ON ?auto_2311709 ?auto_2311705 ) ( ON ?auto_2311711 ?auto_2311709 ) ( ON ?auto_2311710 ?auto_2311711 ) ( ON ?auto_2311712 ?auto_2311710 ) ( ON ?auto_2311713 ?auto_2311712 ) ( ON ?auto_2311714 ?auto_2311713 ) ( ON ?auto_2311715 ?auto_2311714 ) ( ON ?auto_2311716 ?auto_2311715 ) ( not ( = ?auto_2311706 ?auto_2311707 ) ) ( not ( = ?auto_2311706 ?auto_2311708 ) ) ( not ( = ?auto_2311706 ?auto_2311705 ) ) ( not ( = ?auto_2311706 ?auto_2311709 ) ) ( not ( = ?auto_2311706 ?auto_2311711 ) ) ( not ( = ?auto_2311706 ?auto_2311710 ) ) ( not ( = ?auto_2311706 ?auto_2311712 ) ) ( not ( = ?auto_2311706 ?auto_2311713 ) ) ( not ( = ?auto_2311706 ?auto_2311714 ) ) ( not ( = ?auto_2311706 ?auto_2311715 ) ) ( not ( = ?auto_2311706 ?auto_2311716 ) ) ( not ( = ?auto_2311706 ?auto_2311717 ) ) ( not ( = ?auto_2311706 ?auto_2311718 ) ) ( not ( = ?auto_2311707 ?auto_2311708 ) ) ( not ( = ?auto_2311707 ?auto_2311705 ) ) ( not ( = ?auto_2311707 ?auto_2311709 ) ) ( not ( = ?auto_2311707 ?auto_2311711 ) ) ( not ( = ?auto_2311707 ?auto_2311710 ) ) ( not ( = ?auto_2311707 ?auto_2311712 ) ) ( not ( = ?auto_2311707 ?auto_2311713 ) ) ( not ( = ?auto_2311707 ?auto_2311714 ) ) ( not ( = ?auto_2311707 ?auto_2311715 ) ) ( not ( = ?auto_2311707 ?auto_2311716 ) ) ( not ( = ?auto_2311707 ?auto_2311717 ) ) ( not ( = ?auto_2311707 ?auto_2311718 ) ) ( not ( = ?auto_2311708 ?auto_2311705 ) ) ( not ( = ?auto_2311708 ?auto_2311709 ) ) ( not ( = ?auto_2311708 ?auto_2311711 ) ) ( not ( = ?auto_2311708 ?auto_2311710 ) ) ( not ( = ?auto_2311708 ?auto_2311712 ) ) ( not ( = ?auto_2311708 ?auto_2311713 ) ) ( not ( = ?auto_2311708 ?auto_2311714 ) ) ( not ( = ?auto_2311708 ?auto_2311715 ) ) ( not ( = ?auto_2311708 ?auto_2311716 ) ) ( not ( = ?auto_2311708 ?auto_2311717 ) ) ( not ( = ?auto_2311708 ?auto_2311718 ) ) ( not ( = ?auto_2311705 ?auto_2311709 ) ) ( not ( = ?auto_2311705 ?auto_2311711 ) ) ( not ( = ?auto_2311705 ?auto_2311710 ) ) ( not ( = ?auto_2311705 ?auto_2311712 ) ) ( not ( = ?auto_2311705 ?auto_2311713 ) ) ( not ( = ?auto_2311705 ?auto_2311714 ) ) ( not ( = ?auto_2311705 ?auto_2311715 ) ) ( not ( = ?auto_2311705 ?auto_2311716 ) ) ( not ( = ?auto_2311705 ?auto_2311717 ) ) ( not ( = ?auto_2311705 ?auto_2311718 ) ) ( not ( = ?auto_2311709 ?auto_2311711 ) ) ( not ( = ?auto_2311709 ?auto_2311710 ) ) ( not ( = ?auto_2311709 ?auto_2311712 ) ) ( not ( = ?auto_2311709 ?auto_2311713 ) ) ( not ( = ?auto_2311709 ?auto_2311714 ) ) ( not ( = ?auto_2311709 ?auto_2311715 ) ) ( not ( = ?auto_2311709 ?auto_2311716 ) ) ( not ( = ?auto_2311709 ?auto_2311717 ) ) ( not ( = ?auto_2311709 ?auto_2311718 ) ) ( not ( = ?auto_2311711 ?auto_2311710 ) ) ( not ( = ?auto_2311711 ?auto_2311712 ) ) ( not ( = ?auto_2311711 ?auto_2311713 ) ) ( not ( = ?auto_2311711 ?auto_2311714 ) ) ( not ( = ?auto_2311711 ?auto_2311715 ) ) ( not ( = ?auto_2311711 ?auto_2311716 ) ) ( not ( = ?auto_2311711 ?auto_2311717 ) ) ( not ( = ?auto_2311711 ?auto_2311718 ) ) ( not ( = ?auto_2311710 ?auto_2311712 ) ) ( not ( = ?auto_2311710 ?auto_2311713 ) ) ( not ( = ?auto_2311710 ?auto_2311714 ) ) ( not ( = ?auto_2311710 ?auto_2311715 ) ) ( not ( = ?auto_2311710 ?auto_2311716 ) ) ( not ( = ?auto_2311710 ?auto_2311717 ) ) ( not ( = ?auto_2311710 ?auto_2311718 ) ) ( not ( = ?auto_2311712 ?auto_2311713 ) ) ( not ( = ?auto_2311712 ?auto_2311714 ) ) ( not ( = ?auto_2311712 ?auto_2311715 ) ) ( not ( = ?auto_2311712 ?auto_2311716 ) ) ( not ( = ?auto_2311712 ?auto_2311717 ) ) ( not ( = ?auto_2311712 ?auto_2311718 ) ) ( not ( = ?auto_2311713 ?auto_2311714 ) ) ( not ( = ?auto_2311713 ?auto_2311715 ) ) ( not ( = ?auto_2311713 ?auto_2311716 ) ) ( not ( = ?auto_2311713 ?auto_2311717 ) ) ( not ( = ?auto_2311713 ?auto_2311718 ) ) ( not ( = ?auto_2311714 ?auto_2311715 ) ) ( not ( = ?auto_2311714 ?auto_2311716 ) ) ( not ( = ?auto_2311714 ?auto_2311717 ) ) ( not ( = ?auto_2311714 ?auto_2311718 ) ) ( not ( = ?auto_2311715 ?auto_2311716 ) ) ( not ( = ?auto_2311715 ?auto_2311717 ) ) ( not ( = ?auto_2311715 ?auto_2311718 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2311716 ?auto_2311717 ?auto_2311718 )
      ( MAKE-13CRATE-VERIFY ?auto_2311706 ?auto_2311707 ?auto_2311708 ?auto_2311705 ?auto_2311709 ?auto_2311711 ?auto_2311710 ?auto_2311712 ?auto_2311713 ?auto_2311714 ?auto_2311715 ?auto_2311716 ?auto_2311717 ?auto_2311718 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_2311875 - SURFACE
      ?auto_2311876 - SURFACE
      ?auto_2311877 - SURFACE
      ?auto_2311874 - SURFACE
      ?auto_2311878 - SURFACE
      ?auto_2311880 - SURFACE
      ?auto_2311879 - SURFACE
      ?auto_2311881 - SURFACE
      ?auto_2311882 - SURFACE
      ?auto_2311883 - SURFACE
      ?auto_2311884 - SURFACE
      ?auto_2311885 - SURFACE
      ?auto_2311886 - SURFACE
      ?auto_2311887 - SURFACE
    )
    :vars
    (
      ?auto_2311890 - HOIST
      ?auto_2311888 - PLACE
      ?auto_2311891 - TRUCK
      ?auto_2311892 - PLACE
      ?auto_2311889 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2311890 ?auto_2311888 ) ( SURFACE-AT ?auto_2311886 ?auto_2311888 ) ( CLEAR ?auto_2311886 ) ( IS-CRATE ?auto_2311887 ) ( not ( = ?auto_2311886 ?auto_2311887 ) ) ( AVAILABLE ?auto_2311890 ) ( ON ?auto_2311886 ?auto_2311885 ) ( not ( = ?auto_2311885 ?auto_2311886 ) ) ( not ( = ?auto_2311885 ?auto_2311887 ) ) ( TRUCK-AT ?auto_2311891 ?auto_2311892 ) ( not ( = ?auto_2311892 ?auto_2311888 ) ) ( HOIST-AT ?auto_2311889 ?auto_2311892 ) ( LIFTING ?auto_2311889 ?auto_2311887 ) ( not ( = ?auto_2311890 ?auto_2311889 ) ) ( ON ?auto_2311876 ?auto_2311875 ) ( ON ?auto_2311877 ?auto_2311876 ) ( ON ?auto_2311874 ?auto_2311877 ) ( ON ?auto_2311878 ?auto_2311874 ) ( ON ?auto_2311880 ?auto_2311878 ) ( ON ?auto_2311879 ?auto_2311880 ) ( ON ?auto_2311881 ?auto_2311879 ) ( ON ?auto_2311882 ?auto_2311881 ) ( ON ?auto_2311883 ?auto_2311882 ) ( ON ?auto_2311884 ?auto_2311883 ) ( ON ?auto_2311885 ?auto_2311884 ) ( not ( = ?auto_2311875 ?auto_2311876 ) ) ( not ( = ?auto_2311875 ?auto_2311877 ) ) ( not ( = ?auto_2311875 ?auto_2311874 ) ) ( not ( = ?auto_2311875 ?auto_2311878 ) ) ( not ( = ?auto_2311875 ?auto_2311880 ) ) ( not ( = ?auto_2311875 ?auto_2311879 ) ) ( not ( = ?auto_2311875 ?auto_2311881 ) ) ( not ( = ?auto_2311875 ?auto_2311882 ) ) ( not ( = ?auto_2311875 ?auto_2311883 ) ) ( not ( = ?auto_2311875 ?auto_2311884 ) ) ( not ( = ?auto_2311875 ?auto_2311885 ) ) ( not ( = ?auto_2311875 ?auto_2311886 ) ) ( not ( = ?auto_2311875 ?auto_2311887 ) ) ( not ( = ?auto_2311876 ?auto_2311877 ) ) ( not ( = ?auto_2311876 ?auto_2311874 ) ) ( not ( = ?auto_2311876 ?auto_2311878 ) ) ( not ( = ?auto_2311876 ?auto_2311880 ) ) ( not ( = ?auto_2311876 ?auto_2311879 ) ) ( not ( = ?auto_2311876 ?auto_2311881 ) ) ( not ( = ?auto_2311876 ?auto_2311882 ) ) ( not ( = ?auto_2311876 ?auto_2311883 ) ) ( not ( = ?auto_2311876 ?auto_2311884 ) ) ( not ( = ?auto_2311876 ?auto_2311885 ) ) ( not ( = ?auto_2311876 ?auto_2311886 ) ) ( not ( = ?auto_2311876 ?auto_2311887 ) ) ( not ( = ?auto_2311877 ?auto_2311874 ) ) ( not ( = ?auto_2311877 ?auto_2311878 ) ) ( not ( = ?auto_2311877 ?auto_2311880 ) ) ( not ( = ?auto_2311877 ?auto_2311879 ) ) ( not ( = ?auto_2311877 ?auto_2311881 ) ) ( not ( = ?auto_2311877 ?auto_2311882 ) ) ( not ( = ?auto_2311877 ?auto_2311883 ) ) ( not ( = ?auto_2311877 ?auto_2311884 ) ) ( not ( = ?auto_2311877 ?auto_2311885 ) ) ( not ( = ?auto_2311877 ?auto_2311886 ) ) ( not ( = ?auto_2311877 ?auto_2311887 ) ) ( not ( = ?auto_2311874 ?auto_2311878 ) ) ( not ( = ?auto_2311874 ?auto_2311880 ) ) ( not ( = ?auto_2311874 ?auto_2311879 ) ) ( not ( = ?auto_2311874 ?auto_2311881 ) ) ( not ( = ?auto_2311874 ?auto_2311882 ) ) ( not ( = ?auto_2311874 ?auto_2311883 ) ) ( not ( = ?auto_2311874 ?auto_2311884 ) ) ( not ( = ?auto_2311874 ?auto_2311885 ) ) ( not ( = ?auto_2311874 ?auto_2311886 ) ) ( not ( = ?auto_2311874 ?auto_2311887 ) ) ( not ( = ?auto_2311878 ?auto_2311880 ) ) ( not ( = ?auto_2311878 ?auto_2311879 ) ) ( not ( = ?auto_2311878 ?auto_2311881 ) ) ( not ( = ?auto_2311878 ?auto_2311882 ) ) ( not ( = ?auto_2311878 ?auto_2311883 ) ) ( not ( = ?auto_2311878 ?auto_2311884 ) ) ( not ( = ?auto_2311878 ?auto_2311885 ) ) ( not ( = ?auto_2311878 ?auto_2311886 ) ) ( not ( = ?auto_2311878 ?auto_2311887 ) ) ( not ( = ?auto_2311880 ?auto_2311879 ) ) ( not ( = ?auto_2311880 ?auto_2311881 ) ) ( not ( = ?auto_2311880 ?auto_2311882 ) ) ( not ( = ?auto_2311880 ?auto_2311883 ) ) ( not ( = ?auto_2311880 ?auto_2311884 ) ) ( not ( = ?auto_2311880 ?auto_2311885 ) ) ( not ( = ?auto_2311880 ?auto_2311886 ) ) ( not ( = ?auto_2311880 ?auto_2311887 ) ) ( not ( = ?auto_2311879 ?auto_2311881 ) ) ( not ( = ?auto_2311879 ?auto_2311882 ) ) ( not ( = ?auto_2311879 ?auto_2311883 ) ) ( not ( = ?auto_2311879 ?auto_2311884 ) ) ( not ( = ?auto_2311879 ?auto_2311885 ) ) ( not ( = ?auto_2311879 ?auto_2311886 ) ) ( not ( = ?auto_2311879 ?auto_2311887 ) ) ( not ( = ?auto_2311881 ?auto_2311882 ) ) ( not ( = ?auto_2311881 ?auto_2311883 ) ) ( not ( = ?auto_2311881 ?auto_2311884 ) ) ( not ( = ?auto_2311881 ?auto_2311885 ) ) ( not ( = ?auto_2311881 ?auto_2311886 ) ) ( not ( = ?auto_2311881 ?auto_2311887 ) ) ( not ( = ?auto_2311882 ?auto_2311883 ) ) ( not ( = ?auto_2311882 ?auto_2311884 ) ) ( not ( = ?auto_2311882 ?auto_2311885 ) ) ( not ( = ?auto_2311882 ?auto_2311886 ) ) ( not ( = ?auto_2311882 ?auto_2311887 ) ) ( not ( = ?auto_2311883 ?auto_2311884 ) ) ( not ( = ?auto_2311883 ?auto_2311885 ) ) ( not ( = ?auto_2311883 ?auto_2311886 ) ) ( not ( = ?auto_2311883 ?auto_2311887 ) ) ( not ( = ?auto_2311884 ?auto_2311885 ) ) ( not ( = ?auto_2311884 ?auto_2311886 ) ) ( not ( = ?auto_2311884 ?auto_2311887 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2311885 ?auto_2311886 ?auto_2311887 )
      ( MAKE-13CRATE-VERIFY ?auto_2311875 ?auto_2311876 ?auto_2311877 ?auto_2311874 ?auto_2311878 ?auto_2311880 ?auto_2311879 ?auto_2311881 ?auto_2311882 ?auto_2311883 ?auto_2311884 ?auto_2311885 ?auto_2311886 ?auto_2311887 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_2312057 - SURFACE
      ?auto_2312058 - SURFACE
      ?auto_2312059 - SURFACE
      ?auto_2312056 - SURFACE
      ?auto_2312060 - SURFACE
      ?auto_2312062 - SURFACE
      ?auto_2312061 - SURFACE
      ?auto_2312063 - SURFACE
      ?auto_2312064 - SURFACE
      ?auto_2312065 - SURFACE
      ?auto_2312066 - SURFACE
      ?auto_2312067 - SURFACE
      ?auto_2312068 - SURFACE
      ?auto_2312069 - SURFACE
    )
    :vars
    (
      ?auto_2312070 - HOIST
      ?auto_2312072 - PLACE
      ?auto_2312071 - TRUCK
      ?auto_2312074 - PLACE
      ?auto_2312075 - HOIST
      ?auto_2312073 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2312070 ?auto_2312072 ) ( SURFACE-AT ?auto_2312068 ?auto_2312072 ) ( CLEAR ?auto_2312068 ) ( IS-CRATE ?auto_2312069 ) ( not ( = ?auto_2312068 ?auto_2312069 ) ) ( AVAILABLE ?auto_2312070 ) ( ON ?auto_2312068 ?auto_2312067 ) ( not ( = ?auto_2312067 ?auto_2312068 ) ) ( not ( = ?auto_2312067 ?auto_2312069 ) ) ( TRUCK-AT ?auto_2312071 ?auto_2312074 ) ( not ( = ?auto_2312074 ?auto_2312072 ) ) ( HOIST-AT ?auto_2312075 ?auto_2312074 ) ( not ( = ?auto_2312070 ?auto_2312075 ) ) ( AVAILABLE ?auto_2312075 ) ( SURFACE-AT ?auto_2312069 ?auto_2312074 ) ( ON ?auto_2312069 ?auto_2312073 ) ( CLEAR ?auto_2312069 ) ( not ( = ?auto_2312068 ?auto_2312073 ) ) ( not ( = ?auto_2312069 ?auto_2312073 ) ) ( not ( = ?auto_2312067 ?auto_2312073 ) ) ( ON ?auto_2312058 ?auto_2312057 ) ( ON ?auto_2312059 ?auto_2312058 ) ( ON ?auto_2312056 ?auto_2312059 ) ( ON ?auto_2312060 ?auto_2312056 ) ( ON ?auto_2312062 ?auto_2312060 ) ( ON ?auto_2312061 ?auto_2312062 ) ( ON ?auto_2312063 ?auto_2312061 ) ( ON ?auto_2312064 ?auto_2312063 ) ( ON ?auto_2312065 ?auto_2312064 ) ( ON ?auto_2312066 ?auto_2312065 ) ( ON ?auto_2312067 ?auto_2312066 ) ( not ( = ?auto_2312057 ?auto_2312058 ) ) ( not ( = ?auto_2312057 ?auto_2312059 ) ) ( not ( = ?auto_2312057 ?auto_2312056 ) ) ( not ( = ?auto_2312057 ?auto_2312060 ) ) ( not ( = ?auto_2312057 ?auto_2312062 ) ) ( not ( = ?auto_2312057 ?auto_2312061 ) ) ( not ( = ?auto_2312057 ?auto_2312063 ) ) ( not ( = ?auto_2312057 ?auto_2312064 ) ) ( not ( = ?auto_2312057 ?auto_2312065 ) ) ( not ( = ?auto_2312057 ?auto_2312066 ) ) ( not ( = ?auto_2312057 ?auto_2312067 ) ) ( not ( = ?auto_2312057 ?auto_2312068 ) ) ( not ( = ?auto_2312057 ?auto_2312069 ) ) ( not ( = ?auto_2312057 ?auto_2312073 ) ) ( not ( = ?auto_2312058 ?auto_2312059 ) ) ( not ( = ?auto_2312058 ?auto_2312056 ) ) ( not ( = ?auto_2312058 ?auto_2312060 ) ) ( not ( = ?auto_2312058 ?auto_2312062 ) ) ( not ( = ?auto_2312058 ?auto_2312061 ) ) ( not ( = ?auto_2312058 ?auto_2312063 ) ) ( not ( = ?auto_2312058 ?auto_2312064 ) ) ( not ( = ?auto_2312058 ?auto_2312065 ) ) ( not ( = ?auto_2312058 ?auto_2312066 ) ) ( not ( = ?auto_2312058 ?auto_2312067 ) ) ( not ( = ?auto_2312058 ?auto_2312068 ) ) ( not ( = ?auto_2312058 ?auto_2312069 ) ) ( not ( = ?auto_2312058 ?auto_2312073 ) ) ( not ( = ?auto_2312059 ?auto_2312056 ) ) ( not ( = ?auto_2312059 ?auto_2312060 ) ) ( not ( = ?auto_2312059 ?auto_2312062 ) ) ( not ( = ?auto_2312059 ?auto_2312061 ) ) ( not ( = ?auto_2312059 ?auto_2312063 ) ) ( not ( = ?auto_2312059 ?auto_2312064 ) ) ( not ( = ?auto_2312059 ?auto_2312065 ) ) ( not ( = ?auto_2312059 ?auto_2312066 ) ) ( not ( = ?auto_2312059 ?auto_2312067 ) ) ( not ( = ?auto_2312059 ?auto_2312068 ) ) ( not ( = ?auto_2312059 ?auto_2312069 ) ) ( not ( = ?auto_2312059 ?auto_2312073 ) ) ( not ( = ?auto_2312056 ?auto_2312060 ) ) ( not ( = ?auto_2312056 ?auto_2312062 ) ) ( not ( = ?auto_2312056 ?auto_2312061 ) ) ( not ( = ?auto_2312056 ?auto_2312063 ) ) ( not ( = ?auto_2312056 ?auto_2312064 ) ) ( not ( = ?auto_2312056 ?auto_2312065 ) ) ( not ( = ?auto_2312056 ?auto_2312066 ) ) ( not ( = ?auto_2312056 ?auto_2312067 ) ) ( not ( = ?auto_2312056 ?auto_2312068 ) ) ( not ( = ?auto_2312056 ?auto_2312069 ) ) ( not ( = ?auto_2312056 ?auto_2312073 ) ) ( not ( = ?auto_2312060 ?auto_2312062 ) ) ( not ( = ?auto_2312060 ?auto_2312061 ) ) ( not ( = ?auto_2312060 ?auto_2312063 ) ) ( not ( = ?auto_2312060 ?auto_2312064 ) ) ( not ( = ?auto_2312060 ?auto_2312065 ) ) ( not ( = ?auto_2312060 ?auto_2312066 ) ) ( not ( = ?auto_2312060 ?auto_2312067 ) ) ( not ( = ?auto_2312060 ?auto_2312068 ) ) ( not ( = ?auto_2312060 ?auto_2312069 ) ) ( not ( = ?auto_2312060 ?auto_2312073 ) ) ( not ( = ?auto_2312062 ?auto_2312061 ) ) ( not ( = ?auto_2312062 ?auto_2312063 ) ) ( not ( = ?auto_2312062 ?auto_2312064 ) ) ( not ( = ?auto_2312062 ?auto_2312065 ) ) ( not ( = ?auto_2312062 ?auto_2312066 ) ) ( not ( = ?auto_2312062 ?auto_2312067 ) ) ( not ( = ?auto_2312062 ?auto_2312068 ) ) ( not ( = ?auto_2312062 ?auto_2312069 ) ) ( not ( = ?auto_2312062 ?auto_2312073 ) ) ( not ( = ?auto_2312061 ?auto_2312063 ) ) ( not ( = ?auto_2312061 ?auto_2312064 ) ) ( not ( = ?auto_2312061 ?auto_2312065 ) ) ( not ( = ?auto_2312061 ?auto_2312066 ) ) ( not ( = ?auto_2312061 ?auto_2312067 ) ) ( not ( = ?auto_2312061 ?auto_2312068 ) ) ( not ( = ?auto_2312061 ?auto_2312069 ) ) ( not ( = ?auto_2312061 ?auto_2312073 ) ) ( not ( = ?auto_2312063 ?auto_2312064 ) ) ( not ( = ?auto_2312063 ?auto_2312065 ) ) ( not ( = ?auto_2312063 ?auto_2312066 ) ) ( not ( = ?auto_2312063 ?auto_2312067 ) ) ( not ( = ?auto_2312063 ?auto_2312068 ) ) ( not ( = ?auto_2312063 ?auto_2312069 ) ) ( not ( = ?auto_2312063 ?auto_2312073 ) ) ( not ( = ?auto_2312064 ?auto_2312065 ) ) ( not ( = ?auto_2312064 ?auto_2312066 ) ) ( not ( = ?auto_2312064 ?auto_2312067 ) ) ( not ( = ?auto_2312064 ?auto_2312068 ) ) ( not ( = ?auto_2312064 ?auto_2312069 ) ) ( not ( = ?auto_2312064 ?auto_2312073 ) ) ( not ( = ?auto_2312065 ?auto_2312066 ) ) ( not ( = ?auto_2312065 ?auto_2312067 ) ) ( not ( = ?auto_2312065 ?auto_2312068 ) ) ( not ( = ?auto_2312065 ?auto_2312069 ) ) ( not ( = ?auto_2312065 ?auto_2312073 ) ) ( not ( = ?auto_2312066 ?auto_2312067 ) ) ( not ( = ?auto_2312066 ?auto_2312068 ) ) ( not ( = ?auto_2312066 ?auto_2312069 ) ) ( not ( = ?auto_2312066 ?auto_2312073 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2312067 ?auto_2312068 ?auto_2312069 )
      ( MAKE-13CRATE-VERIFY ?auto_2312057 ?auto_2312058 ?auto_2312059 ?auto_2312056 ?auto_2312060 ?auto_2312062 ?auto_2312061 ?auto_2312063 ?auto_2312064 ?auto_2312065 ?auto_2312066 ?auto_2312067 ?auto_2312068 ?auto_2312069 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_2312240 - SURFACE
      ?auto_2312241 - SURFACE
      ?auto_2312242 - SURFACE
      ?auto_2312239 - SURFACE
      ?auto_2312243 - SURFACE
      ?auto_2312245 - SURFACE
      ?auto_2312244 - SURFACE
      ?auto_2312246 - SURFACE
      ?auto_2312247 - SURFACE
      ?auto_2312248 - SURFACE
      ?auto_2312249 - SURFACE
      ?auto_2312250 - SURFACE
      ?auto_2312251 - SURFACE
      ?auto_2312252 - SURFACE
    )
    :vars
    (
      ?auto_2312253 - HOIST
      ?auto_2312255 - PLACE
      ?auto_2312254 - PLACE
      ?auto_2312258 - HOIST
      ?auto_2312256 - SURFACE
      ?auto_2312257 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2312253 ?auto_2312255 ) ( SURFACE-AT ?auto_2312251 ?auto_2312255 ) ( CLEAR ?auto_2312251 ) ( IS-CRATE ?auto_2312252 ) ( not ( = ?auto_2312251 ?auto_2312252 ) ) ( AVAILABLE ?auto_2312253 ) ( ON ?auto_2312251 ?auto_2312250 ) ( not ( = ?auto_2312250 ?auto_2312251 ) ) ( not ( = ?auto_2312250 ?auto_2312252 ) ) ( not ( = ?auto_2312254 ?auto_2312255 ) ) ( HOIST-AT ?auto_2312258 ?auto_2312254 ) ( not ( = ?auto_2312253 ?auto_2312258 ) ) ( AVAILABLE ?auto_2312258 ) ( SURFACE-AT ?auto_2312252 ?auto_2312254 ) ( ON ?auto_2312252 ?auto_2312256 ) ( CLEAR ?auto_2312252 ) ( not ( = ?auto_2312251 ?auto_2312256 ) ) ( not ( = ?auto_2312252 ?auto_2312256 ) ) ( not ( = ?auto_2312250 ?auto_2312256 ) ) ( TRUCK-AT ?auto_2312257 ?auto_2312255 ) ( ON ?auto_2312241 ?auto_2312240 ) ( ON ?auto_2312242 ?auto_2312241 ) ( ON ?auto_2312239 ?auto_2312242 ) ( ON ?auto_2312243 ?auto_2312239 ) ( ON ?auto_2312245 ?auto_2312243 ) ( ON ?auto_2312244 ?auto_2312245 ) ( ON ?auto_2312246 ?auto_2312244 ) ( ON ?auto_2312247 ?auto_2312246 ) ( ON ?auto_2312248 ?auto_2312247 ) ( ON ?auto_2312249 ?auto_2312248 ) ( ON ?auto_2312250 ?auto_2312249 ) ( not ( = ?auto_2312240 ?auto_2312241 ) ) ( not ( = ?auto_2312240 ?auto_2312242 ) ) ( not ( = ?auto_2312240 ?auto_2312239 ) ) ( not ( = ?auto_2312240 ?auto_2312243 ) ) ( not ( = ?auto_2312240 ?auto_2312245 ) ) ( not ( = ?auto_2312240 ?auto_2312244 ) ) ( not ( = ?auto_2312240 ?auto_2312246 ) ) ( not ( = ?auto_2312240 ?auto_2312247 ) ) ( not ( = ?auto_2312240 ?auto_2312248 ) ) ( not ( = ?auto_2312240 ?auto_2312249 ) ) ( not ( = ?auto_2312240 ?auto_2312250 ) ) ( not ( = ?auto_2312240 ?auto_2312251 ) ) ( not ( = ?auto_2312240 ?auto_2312252 ) ) ( not ( = ?auto_2312240 ?auto_2312256 ) ) ( not ( = ?auto_2312241 ?auto_2312242 ) ) ( not ( = ?auto_2312241 ?auto_2312239 ) ) ( not ( = ?auto_2312241 ?auto_2312243 ) ) ( not ( = ?auto_2312241 ?auto_2312245 ) ) ( not ( = ?auto_2312241 ?auto_2312244 ) ) ( not ( = ?auto_2312241 ?auto_2312246 ) ) ( not ( = ?auto_2312241 ?auto_2312247 ) ) ( not ( = ?auto_2312241 ?auto_2312248 ) ) ( not ( = ?auto_2312241 ?auto_2312249 ) ) ( not ( = ?auto_2312241 ?auto_2312250 ) ) ( not ( = ?auto_2312241 ?auto_2312251 ) ) ( not ( = ?auto_2312241 ?auto_2312252 ) ) ( not ( = ?auto_2312241 ?auto_2312256 ) ) ( not ( = ?auto_2312242 ?auto_2312239 ) ) ( not ( = ?auto_2312242 ?auto_2312243 ) ) ( not ( = ?auto_2312242 ?auto_2312245 ) ) ( not ( = ?auto_2312242 ?auto_2312244 ) ) ( not ( = ?auto_2312242 ?auto_2312246 ) ) ( not ( = ?auto_2312242 ?auto_2312247 ) ) ( not ( = ?auto_2312242 ?auto_2312248 ) ) ( not ( = ?auto_2312242 ?auto_2312249 ) ) ( not ( = ?auto_2312242 ?auto_2312250 ) ) ( not ( = ?auto_2312242 ?auto_2312251 ) ) ( not ( = ?auto_2312242 ?auto_2312252 ) ) ( not ( = ?auto_2312242 ?auto_2312256 ) ) ( not ( = ?auto_2312239 ?auto_2312243 ) ) ( not ( = ?auto_2312239 ?auto_2312245 ) ) ( not ( = ?auto_2312239 ?auto_2312244 ) ) ( not ( = ?auto_2312239 ?auto_2312246 ) ) ( not ( = ?auto_2312239 ?auto_2312247 ) ) ( not ( = ?auto_2312239 ?auto_2312248 ) ) ( not ( = ?auto_2312239 ?auto_2312249 ) ) ( not ( = ?auto_2312239 ?auto_2312250 ) ) ( not ( = ?auto_2312239 ?auto_2312251 ) ) ( not ( = ?auto_2312239 ?auto_2312252 ) ) ( not ( = ?auto_2312239 ?auto_2312256 ) ) ( not ( = ?auto_2312243 ?auto_2312245 ) ) ( not ( = ?auto_2312243 ?auto_2312244 ) ) ( not ( = ?auto_2312243 ?auto_2312246 ) ) ( not ( = ?auto_2312243 ?auto_2312247 ) ) ( not ( = ?auto_2312243 ?auto_2312248 ) ) ( not ( = ?auto_2312243 ?auto_2312249 ) ) ( not ( = ?auto_2312243 ?auto_2312250 ) ) ( not ( = ?auto_2312243 ?auto_2312251 ) ) ( not ( = ?auto_2312243 ?auto_2312252 ) ) ( not ( = ?auto_2312243 ?auto_2312256 ) ) ( not ( = ?auto_2312245 ?auto_2312244 ) ) ( not ( = ?auto_2312245 ?auto_2312246 ) ) ( not ( = ?auto_2312245 ?auto_2312247 ) ) ( not ( = ?auto_2312245 ?auto_2312248 ) ) ( not ( = ?auto_2312245 ?auto_2312249 ) ) ( not ( = ?auto_2312245 ?auto_2312250 ) ) ( not ( = ?auto_2312245 ?auto_2312251 ) ) ( not ( = ?auto_2312245 ?auto_2312252 ) ) ( not ( = ?auto_2312245 ?auto_2312256 ) ) ( not ( = ?auto_2312244 ?auto_2312246 ) ) ( not ( = ?auto_2312244 ?auto_2312247 ) ) ( not ( = ?auto_2312244 ?auto_2312248 ) ) ( not ( = ?auto_2312244 ?auto_2312249 ) ) ( not ( = ?auto_2312244 ?auto_2312250 ) ) ( not ( = ?auto_2312244 ?auto_2312251 ) ) ( not ( = ?auto_2312244 ?auto_2312252 ) ) ( not ( = ?auto_2312244 ?auto_2312256 ) ) ( not ( = ?auto_2312246 ?auto_2312247 ) ) ( not ( = ?auto_2312246 ?auto_2312248 ) ) ( not ( = ?auto_2312246 ?auto_2312249 ) ) ( not ( = ?auto_2312246 ?auto_2312250 ) ) ( not ( = ?auto_2312246 ?auto_2312251 ) ) ( not ( = ?auto_2312246 ?auto_2312252 ) ) ( not ( = ?auto_2312246 ?auto_2312256 ) ) ( not ( = ?auto_2312247 ?auto_2312248 ) ) ( not ( = ?auto_2312247 ?auto_2312249 ) ) ( not ( = ?auto_2312247 ?auto_2312250 ) ) ( not ( = ?auto_2312247 ?auto_2312251 ) ) ( not ( = ?auto_2312247 ?auto_2312252 ) ) ( not ( = ?auto_2312247 ?auto_2312256 ) ) ( not ( = ?auto_2312248 ?auto_2312249 ) ) ( not ( = ?auto_2312248 ?auto_2312250 ) ) ( not ( = ?auto_2312248 ?auto_2312251 ) ) ( not ( = ?auto_2312248 ?auto_2312252 ) ) ( not ( = ?auto_2312248 ?auto_2312256 ) ) ( not ( = ?auto_2312249 ?auto_2312250 ) ) ( not ( = ?auto_2312249 ?auto_2312251 ) ) ( not ( = ?auto_2312249 ?auto_2312252 ) ) ( not ( = ?auto_2312249 ?auto_2312256 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2312250 ?auto_2312251 ?auto_2312252 )
      ( MAKE-13CRATE-VERIFY ?auto_2312240 ?auto_2312241 ?auto_2312242 ?auto_2312239 ?auto_2312243 ?auto_2312245 ?auto_2312244 ?auto_2312246 ?auto_2312247 ?auto_2312248 ?auto_2312249 ?auto_2312250 ?auto_2312251 ?auto_2312252 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_2312423 - SURFACE
      ?auto_2312424 - SURFACE
      ?auto_2312425 - SURFACE
      ?auto_2312422 - SURFACE
      ?auto_2312426 - SURFACE
      ?auto_2312428 - SURFACE
      ?auto_2312427 - SURFACE
      ?auto_2312429 - SURFACE
      ?auto_2312430 - SURFACE
      ?auto_2312431 - SURFACE
      ?auto_2312432 - SURFACE
      ?auto_2312433 - SURFACE
      ?auto_2312434 - SURFACE
      ?auto_2312435 - SURFACE
    )
    :vars
    (
      ?auto_2312440 - HOIST
      ?auto_2312436 - PLACE
      ?auto_2312441 - PLACE
      ?auto_2312437 - HOIST
      ?auto_2312439 - SURFACE
      ?auto_2312438 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2312440 ?auto_2312436 ) ( IS-CRATE ?auto_2312435 ) ( not ( = ?auto_2312434 ?auto_2312435 ) ) ( not ( = ?auto_2312433 ?auto_2312434 ) ) ( not ( = ?auto_2312433 ?auto_2312435 ) ) ( not ( = ?auto_2312441 ?auto_2312436 ) ) ( HOIST-AT ?auto_2312437 ?auto_2312441 ) ( not ( = ?auto_2312440 ?auto_2312437 ) ) ( AVAILABLE ?auto_2312437 ) ( SURFACE-AT ?auto_2312435 ?auto_2312441 ) ( ON ?auto_2312435 ?auto_2312439 ) ( CLEAR ?auto_2312435 ) ( not ( = ?auto_2312434 ?auto_2312439 ) ) ( not ( = ?auto_2312435 ?auto_2312439 ) ) ( not ( = ?auto_2312433 ?auto_2312439 ) ) ( TRUCK-AT ?auto_2312438 ?auto_2312436 ) ( SURFACE-AT ?auto_2312433 ?auto_2312436 ) ( CLEAR ?auto_2312433 ) ( LIFTING ?auto_2312440 ?auto_2312434 ) ( IS-CRATE ?auto_2312434 ) ( ON ?auto_2312424 ?auto_2312423 ) ( ON ?auto_2312425 ?auto_2312424 ) ( ON ?auto_2312422 ?auto_2312425 ) ( ON ?auto_2312426 ?auto_2312422 ) ( ON ?auto_2312428 ?auto_2312426 ) ( ON ?auto_2312427 ?auto_2312428 ) ( ON ?auto_2312429 ?auto_2312427 ) ( ON ?auto_2312430 ?auto_2312429 ) ( ON ?auto_2312431 ?auto_2312430 ) ( ON ?auto_2312432 ?auto_2312431 ) ( ON ?auto_2312433 ?auto_2312432 ) ( not ( = ?auto_2312423 ?auto_2312424 ) ) ( not ( = ?auto_2312423 ?auto_2312425 ) ) ( not ( = ?auto_2312423 ?auto_2312422 ) ) ( not ( = ?auto_2312423 ?auto_2312426 ) ) ( not ( = ?auto_2312423 ?auto_2312428 ) ) ( not ( = ?auto_2312423 ?auto_2312427 ) ) ( not ( = ?auto_2312423 ?auto_2312429 ) ) ( not ( = ?auto_2312423 ?auto_2312430 ) ) ( not ( = ?auto_2312423 ?auto_2312431 ) ) ( not ( = ?auto_2312423 ?auto_2312432 ) ) ( not ( = ?auto_2312423 ?auto_2312433 ) ) ( not ( = ?auto_2312423 ?auto_2312434 ) ) ( not ( = ?auto_2312423 ?auto_2312435 ) ) ( not ( = ?auto_2312423 ?auto_2312439 ) ) ( not ( = ?auto_2312424 ?auto_2312425 ) ) ( not ( = ?auto_2312424 ?auto_2312422 ) ) ( not ( = ?auto_2312424 ?auto_2312426 ) ) ( not ( = ?auto_2312424 ?auto_2312428 ) ) ( not ( = ?auto_2312424 ?auto_2312427 ) ) ( not ( = ?auto_2312424 ?auto_2312429 ) ) ( not ( = ?auto_2312424 ?auto_2312430 ) ) ( not ( = ?auto_2312424 ?auto_2312431 ) ) ( not ( = ?auto_2312424 ?auto_2312432 ) ) ( not ( = ?auto_2312424 ?auto_2312433 ) ) ( not ( = ?auto_2312424 ?auto_2312434 ) ) ( not ( = ?auto_2312424 ?auto_2312435 ) ) ( not ( = ?auto_2312424 ?auto_2312439 ) ) ( not ( = ?auto_2312425 ?auto_2312422 ) ) ( not ( = ?auto_2312425 ?auto_2312426 ) ) ( not ( = ?auto_2312425 ?auto_2312428 ) ) ( not ( = ?auto_2312425 ?auto_2312427 ) ) ( not ( = ?auto_2312425 ?auto_2312429 ) ) ( not ( = ?auto_2312425 ?auto_2312430 ) ) ( not ( = ?auto_2312425 ?auto_2312431 ) ) ( not ( = ?auto_2312425 ?auto_2312432 ) ) ( not ( = ?auto_2312425 ?auto_2312433 ) ) ( not ( = ?auto_2312425 ?auto_2312434 ) ) ( not ( = ?auto_2312425 ?auto_2312435 ) ) ( not ( = ?auto_2312425 ?auto_2312439 ) ) ( not ( = ?auto_2312422 ?auto_2312426 ) ) ( not ( = ?auto_2312422 ?auto_2312428 ) ) ( not ( = ?auto_2312422 ?auto_2312427 ) ) ( not ( = ?auto_2312422 ?auto_2312429 ) ) ( not ( = ?auto_2312422 ?auto_2312430 ) ) ( not ( = ?auto_2312422 ?auto_2312431 ) ) ( not ( = ?auto_2312422 ?auto_2312432 ) ) ( not ( = ?auto_2312422 ?auto_2312433 ) ) ( not ( = ?auto_2312422 ?auto_2312434 ) ) ( not ( = ?auto_2312422 ?auto_2312435 ) ) ( not ( = ?auto_2312422 ?auto_2312439 ) ) ( not ( = ?auto_2312426 ?auto_2312428 ) ) ( not ( = ?auto_2312426 ?auto_2312427 ) ) ( not ( = ?auto_2312426 ?auto_2312429 ) ) ( not ( = ?auto_2312426 ?auto_2312430 ) ) ( not ( = ?auto_2312426 ?auto_2312431 ) ) ( not ( = ?auto_2312426 ?auto_2312432 ) ) ( not ( = ?auto_2312426 ?auto_2312433 ) ) ( not ( = ?auto_2312426 ?auto_2312434 ) ) ( not ( = ?auto_2312426 ?auto_2312435 ) ) ( not ( = ?auto_2312426 ?auto_2312439 ) ) ( not ( = ?auto_2312428 ?auto_2312427 ) ) ( not ( = ?auto_2312428 ?auto_2312429 ) ) ( not ( = ?auto_2312428 ?auto_2312430 ) ) ( not ( = ?auto_2312428 ?auto_2312431 ) ) ( not ( = ?auto_2312428 ?auto_2312432 ) ) ( not ( = ?auto_2312428 ?auto_2312433 ) ) ( not ( = ?auto_2312428 ?auto_2312434 ) ) ( not ( = ?auto_2312428 ?auto_2312435 ) ) ( not ( = ?auto_2312428 ?auto_2312439 ) ) ( not ( = ?auto_2312427 ?auto_2312429 ) ) ( not ( = ?auto_2312427 ?auto_2312430 ) ) ( not ( = ?auto_2312427 ?auto_2312431 ) ) ( not ( = ?auto_2312427 ?auto_2312432 ) ) ( not ( = ?auto_2312427 ?auto_2312433 ) ) ( not ( = ?auto_2312427 ?auto_2312434 ) ) ( not ( = ?auto_2312427 ?auto_2312435 ) ) ( not ( = ?auto_2312427 ?auto_2312439 ) ) ( not ( = ?auto_2312429 ?auto_2312430 ) ) ( not ( = ?auto_2312429 ?auto_2312431 ) ) ( not ( = ?auto_2312429 ?auto_2312432 ) ) ( not ( = ?auto_2312429 ?auto_2312433 ) ) ( not ( = ?auto_2312429 ?auto_2312434 ) ) ( not ( = ?auto_2312429 ?auto_2312435 ) ) ( not ( = ?auto_2312429 ?auto_2312439 ) ) ( not ( = ?auto_2312430 ?auto_2312431 ) ) ( not ( = ?auto_2312430 ?auto_2312432 ) ) ( not ( = ?auto_2312430 ?auto_2312433 ) ) ( not ( = ?auto_2312430 ?auto_2312434 ) ) ( not ( = ?auto_2312430 ?auto_2312435 ) ) ( not ( = ?auto_2312430 ?auto_2312439 ) ) ( not ( = ?auto_2312431 ?auto_2312432 ) ) ( not ( = ?auto_2312431 ?auto_2312433 ) ) ( not ( = ?auto_2312431 ?auto_2312434 ) ) ( not ( = ?auto_2312431 ?auto_2312435 ) ) ( not ( = ?auto_2312431 ?auto_2312439 ) ) ( not ( = ?auto_2312432 ?auto_2312433 ) ) ( not ( = ?auto_2312432 ?auto_2312434 ) ) ( not ( = ?auto_2312432 ?auto_2312435 ) ) ( not ( = ?auto_2312432 ?auto_2312439 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2312433 ?auto_2312434 ?auto_2312435 )
      ( MAKE-13CRATE-VERIFY ?auto_2312423 ?auto_2312424 ?auto_2312425 ?auto_2312422 ?auto_2312426 ?auto_2312428 ?auto_2312427 ?auto_2312429 ?auto_2312430 ?auto_2312431 ?auto_2312432 ?auto_2312433 ?auto_2312434 ?auto_2312435 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_2312606 - SURFACE
      ?auto_2312607 - SURFACE
      ?auto_2312608 - SURFACE
      ?auto_2312605 - SURFACE
      ?auto_2312609 - SURFACE
      ?auto_2312611 - SURFACE
      ?auto_2312610 - SURFACE
      ?auto_2312612 - SURFACE
      ?auto_2312613 - SURFACE
      ?auto_2312614 - SURFACE
      ?auto_2312615 - SURFACE
      ?auto_2312616 - SURFACE
      ?auto_2312617 - SURFACE
      ?auto_2312618 - SURFACE
    )
    :vars
    (
      ?auto_2312619 - HOIST
      ?auto_2312624 - PLACE
      ?auto_2312620 - PLACE
      ?auto_2312621 - HOIST
      ?auto_2312623 - SURFACE
      ?auto_2312622 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2312619 ?auto_2312624 ) ( IS-CRATE ?auto_2312618 ) ( not ( = ?auto_2312617 ?auto_2312618 ) ) ( not ( = ?auto_2312616 ?auto_2312617 ) ) ( not ( = ?auto_2312616 ?auto_2312618 ) ) ( not ( = ?auto_2312620 ?auto_2312624 ) ) ( HOIST-AT ?auto_2312621 ?auto_2312620 ) ( not ( = ?auto_2312619 ?auto_2312621 ) ) ( AVAILABLE ?auto_2312621 ) ( SURFACE-AT ?auto_2312618 ?auto_2312620 ) ( ON ?auto_2312618 ?auto_2312623 ) ( CLEAR ?auto_2312618 ) ( not ( = ?auto_2312617 ?auto_2312623 ) ) ( not ( = ?auto_2312618 ?auto_2312623 ) ) ( not ( = ?auto_2312616 ?auto_2312623 ) ) ( TRUCK-AT ?auto_2312622 ?auto_2312624 ) ( SURFACE-AT ?auto_2312616 ?auto_2312624 ) ( CLEAR ?auto_2312616 ) ( IS-CRATE ?auto_2312617 ) ( AVAILABLE ?auto_2312619 ) ( IN ?auto_2312617 ?auto_2312622 ) ( ON ?auto_2312607 ?auto_2312606 ) ( ON ?auto_2312608 ?auto_2312607 ) ( ON ?auto_2312605 ?auto_2312608 ) ( ON ?auto_2312609 ?auto_2312605 ) ( ON ?auto_2312611 ?auto_2312609 ) ( ON ?auto_2312610 ?auto_2312611 ) ( ON ?auto_2312612 ?auto_2312610 ) ( ON ?auto_2312613 ?auto_2312612 ) ( ON ?auto_2312614 ?auto_2312613 ) ( ON ?auto_2312615 ?auto_2312614 ) ( ON ?auto_2312616 ?auto_2312615 ) ( not ( = ?auto_2312606 ?auto_2312607 ) ) ( not ( = ?auto_2312606 ?auto_2312608 ) ) ( not ( = ?auto_2312606 ?auto_2312605 ) ) ( not ( = ?auto_2312606 ?auto_2312609 ) ) ( not ( = ?auto_2312606 ?auto_2312611 ) ) ( not ( = ?auto_2312606 ?auto_2312610 ) ) ( not ( = ?auto_2312606 ?auto_2312612 ) ) ( not ( = ?auto_2312606 ?auto_2312613 ) ) ( not ( = ?auto_2312606 ?auto_2312614 ) ) ( not ( = ?auto_2312606 ?auto_2312615 ) ) ( not ( = ?auto_2312606 ?auto_2312616 ) ) ( not ( = ?auto_2312606 ?auto_2312617 ) ) ( not ( = ?auto_2312606 ?auto_2312618 ) ) ( not ( = ?auto_2312606 ?auto_2312623 ) ) ( not ( = ?auto_2312607 ?auto_2312608 ) ) ( not ( = ?auto_2312607 ?auto_2312605 ) ) ( not ( = ?auto_2312607 ?auto_2312609 ) ) ( not ( = ?auto_2312607 ?auto_2312611 ) ) ( not ( = ?auto_2312607 ?auto_2312610 ) ) ( not ( = ?auto_2312607 ?auto_2312612 ) ) ( not ( = ?auto_2312607 ?auto_2312613 ) ) ( not ( = ?auto_2312607 ?auto_2312614 ) ) ( not ( = ?auto_2312607 ?auto_2312615 ) ) ( not ( = ?auto_2312607 ?auto_2312616 ) ) ( not ( = ?auto_2312607 ?auto_2312617 ) ) ( not ( = ?auto_2312607 ?auto_2312618 ) ) ( not ( = ?auto_2312607 ?auto_2312623 ) ) ( not ( = ?auto_2312608 ?auto_2312605 ) ) ( not ( = ?auto_2312608 ?auto_2312609 ) ) ( not ( = ?auto_2312608 ?auto_2312611 ) ) ( not ( = ?auto_2312608 ?auto_2312610 ) ) ( not ( = ?auto_2312608 ?auto_2312612 ) ) ( not ( = ?auto_2312608 ?auto_2312613 ) ) ( not ( = ?auto_2312608 ?auto_2312614 ) ) ( not ( = ?auto_2312608 ?auto_2312615 ) ) ( not ( = ?auto_2312608 ?auto_2312616 ) ) ( not ( = ?auto_2312608 ?auto_2312617 ) ) ( not ( = ?auto_2312608 ?auto_2312618 ) ) ( not ( = ?auto_2312608 ?auto_2312623 ) ) ( not ( = ?auto_2312605 ?auto_2312609 ) ) ( not ( = ?auto_2312605 ?auto_2312611 ) ) ( not ( = ?auto_2312605 ?auto_2312610 ) ) ( not ( = ?auto_2312605 ?auto_2312612 ) ) ( not ( = ?auto_2312605 ?auto_2312613 ) ) ( not ( = ?auto_2312605 ?auto_2312614 ) ) ( not ( = ?auto_2312605 ?auto_2312615 ) ) ( not ( = ?auto_2312605 ?auto_2312616 ) ) ( not ( = ?auto_2312605 ?auto_2312617 ) ) ( not ( = ?auto_2312605 ?auto_2312618 ) ) ( not ( = ?auto_2312605 ?auto_2312623 ) ) ( not ( = ?auto_2312609 ?auto_2312611 ) ) ( not ( = ?auto_2312609 ?auto_2312610 ) ) ( not ( = ?auto_2312609 ?auto_2312612 ) ) ( not ( = ?auto_2312609 ?auto_2312613 ) ) ( not ( = ?auto_2312609 ?auto_2312614 ) ) ( not ( = ?auto_2312609 ?auto_2312615 ) ) ( not ( = ?auto_2312609 ?auto_2312616 ) ) ( not ( = ?auto_2312609 ?auto_2312617 ) ) ( not ( = ?auto_2312609 ?auto_2312618 ) ) ( not ( = ?auto_2312609 ?auto_2312623 ) ) ( not ( = ?auto_2312611 ?auto_2312610 ) ) ( not ( = ?auto_2312611 ?auto_2312612 ) ) ( not ( = ?auto_2312611 ?auto_2312613 ) ) ( not ( = ?auto_2312611 ?auto_2312614 ) ) ( not ( = ?auto_2312611 ?auto_2312615 ) ) ( not ( = ?auto_2312611 ?auto_2312616 ) ) ( not ( = ?auto_2312611 ?auto_2312617 ) ) ( not ( = ?auto_2312611 ?auto_2312618 ) ) ( not ( = ?auto_2312611 ?auto_2312623 ) ) ( not ( = ?auto_2312610 ?auto_2312612 ) ) ( not ( = ?auto_2312610 ?auto_2312613 ) ) ( not ( = ?auto_2312610 ?auto_2312614 ) ) ( not ( = ?auto_2312610 ?auto_2312615 ) ) ( not ( = ?auto_2312610 ?auto_2312616 ) ) ( not ( = ?auto_2312610 ?auto_2312617 ) ) ( not ( = ?auto_2312610 ?auto_2312618 ) ) ( not ( = ?auto_2312610 ?auto_2312623 ) ) ( not ( = ?auto_2312612 ?auto_2312613 ) ) ( not ( = ?auto_2312612 ?auto_2312614 ) ) ( not ( = ?auto_2312612 ?auto_2312615 ) ) ( not ( = ?auto_2312612 ?auto_2312616 ) ) ( not ( = ?auto_2312612 ?auto_2312617 ) ) ( not ( = ?auto_2312612 ?auto_2312618 ) ) ( not ( = ?auto_2312612 ?auto_2312623 ) ) ( not ( = ?auto_2312613 ?auto_2312614 ) ) ( not ( = ?auto_2312613 ?auto_2312615 ) ) ( not ( = ?auto_2312613 ?auto_2312616 ) ) ( not ( = ?auto_2312613 ?auto_2312617 ) ) ( not ( = ?auto_2312613 ?auto_2312618 ) ) ( not ( = ?auto_2312613 ?auto_2312623 ) ) ( not ( = ?auto_2312614 ?auto_2312615 ) ) ( not ( = ?auto_2312614 ?auto_2312616 ) ) ( not ( = ?auto_2312614 ?auto_2312617 ) ) ( not ( = ?auto_2312614 ?auto_2312618 ) ) ( not ( = ?auto_2312614 ?auto_2312623 ) ) ( not ( = ?auto_2312615 ?auto_2312616 ) ) ( not ( = ?auto_2312615 ?auto_2312617 ) ) ( not ( = ?auto_2312615 ?auto_2312618 ) ) ( not ( = ?auto_2312615 ?auto_2312623 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2312616 ?auto_2312617 ?auto_2312618 )
      ( MAKE-13CRATE-VERIFY ?auto_2312606 ?auto_2312607 ?auto_2312608 ?auto_2312605 ?auto_2312609 ?auto_2312611 ?auto_2312610 ?auto_2312612 ?auto_2312613 ?auto_2312614 ?auto_2312615 ?auto_2312616 ?auto_2312617 ?auto_2312618 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_2326847 - SURFACE
      ?auto_2326848 - SURFACE
      ?auto_2326849 - SURFACE
      ?auto_2326846 - SURFACE
      ?auto_2326850 - SURFACE
      ?auto_2326852 - SURFACE
      ?auto_2326851 - SURFACE
      ?auto_2326853 - SURFACE
      ?auto_2326854 - SURFACE
      ?auto_2326855 - SURFACE
      ?auto_2326856 - SURFACE
      ?auto_2326857 - SURFACE
      ?auto_2326858 - SURFACE
      ?auto_2326859 - SURFACE
      ?auto_2326860 - SURFACE
    )
    :vars
    (
      ?auto_2326862 - HOIST
      ?auto_2326861 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2326862 ?auto_2326861 ) ( SURFACE-AT ?auto_2326859 ?auto_2326861 ) ( CLEAR ?auto_2326859 ) ( LIFTING ?auto_2326862 ?auto_2326860 ) ( IS-CRATE ?auto_2326860 ) ( not ( = ?auto_2326859 ?auto_2326860 ) ) ( ON ?auto_2326848 ?auto_2326847 ) ( ON ?auto_2326849 ?auto_2326848 ) ( ON ?auto_2326846 ?auto_2326849 ) ( ON ?auto_2326850 ?auto_2326846 ) ( ON ?auto_2326852 ?auto_2326850 ) ( ON ?auto_2326851 ?auto_2326852 ) ( ON ?auto_2326853 ?auto_2326851 ) ( ON ?auto_2326854 ?auto_2326853 ) ( ON ?auto_2326855 ?auto_2326854 ) ( ON ?auto_2326856 ?auto_2326855 ) ( ON ?auto_2326857 ?auto_2326856 ) ( ON ?auto_2326858 ?auto_2326857 ) ( ON ?auto_2326859 ?auto_2326858 ) ( not ( = ?auto_2326847 ?auto_2326848 ) ) ( not ( = ?auto_2326847 ?auto_2326849 ) ) ( not ( = ?auto_2326847 ?auto_2326846 ) ) ( not ( = ?auto_2326847 ?auto_2326850 ) ) ( not ( = ?auto_2326847 ?auto_2326852 ) ) ( not ( = ?auto_2326847 ?auto_2326851 ) ) ( not ( = ?auto_2326847 ?auto_2326853 ) ) ( not ( = ?auto_2326847 ?auto_2326854 ) ) ( not ( = ?auto_2326847 ?auto_2326855 ) ) ( not ( = ?auto_2326847 ?auto_2326856 ) ) ( not ( = ?auto_2326847 ?auto_2326857 ) ) ( not ( = ?auto_2326847 ?auto_2326858 ) ) ( not ( = ?auto_2326847 ?auto_2326859 ) ) ( not ( = ?auto_2326847 ?auto_2326860 ) ) ( not ( = ?auto_2326848 ?auto_2326849 ) ) ( not ( = ?auto_2326848 ?auto_2326846 ) ) ( not ( = ?auto_2326848 ?auto_2326850 ) ) ( not ( = ?auto_2326848 ?auto_2326852 ) ) ( not ( = ?auto_2326848 ?auto_2326851 ) ) ( not ( = ?auto_2326848 ?auto_2326853 ) ) ( not ( = ?auto_2326848 ?auto_2326854 ) ) ( not ( = ?auto_2326848 ?auto_2326855 ) ) ( not ( = ?auto_2326848 ?auto_2326856 ) ) ( not ( = ?auto_2326848 ?auto_2326857 ) ) ( not ( = ?auto_2326848 ?auto_2326858 ) ) ( not ( = ?auto_2326848 ?auto_2326859 ) ) ( not ( = ?auto_2326848 ?auto_2326860 ) ) ( not ( = ?auto_2326849 ?auto_2326846 ) ) ( not ( = ?auto_2326849 ?auto_2326850 ) ) ( not ( = ?auto_2326849 ?auto_2326852 ) ) ( not ( = ?auto_2326849 ?auto_2326851 ) ) ( not ( = ?auto_2326849 ?auto_2326853 ) ) ( not ( = ?auto_2326849 ?auto_2326854 ) ) ( not ( = ?auto_2326849 ?auto_2326855 ) ) ( not ( = ?auto_2326849 ?auto_2326856 ) ) ( not ( = ?auto_2326849 ?auto_2326857 ) ) ( not ( = ?auto_2326849 ?auto_2326858 ) ) ( not ( = ?auto_2326849 ?auto_2326859 ) ) ( not ( = ?auto_2326849 ?auto_2326860 ) ) ( not ( = ?auto_2326846 ?auto_2326850 ) ) ( not ( = ?auto_2326846 ?auto_2326852 ) ) ( not ( = ?auto_2326846 ?auto_2326851 ) ) ( not ( = ?auto_2326846 ?auto_2326853 ) ) ( not ( = ?auto_2326846 ?auto_2326854 ) ) ( not ( = ?auto_2326846 ?auto_2326855 ) ) ( not ( = ?auto_2326846 ?auto_2326856 ) ) ( not ( = ?auto_2326846 ?auto_2326857 ) ) ( not ( = ?auto_2326846 ?auto_2326858 ) ) ( not ( = ?auto_2326846 ?auto_2326859 ) ) ( not ( = ?auto_2326846 ?auto_2326860 ) ) ( not ( = ?auto_2326850 ?auto_2326852 ) ) ( not ( = ?auto_2326850 ?auto_2326851 ) ) ( not ( = ?auto_2326850 ?auto_2326853 ) ) ( not ( = ?auto_2326850 ?auto_2326854 ) ) ( not ( = ?auto_2326850 ?auto_2326855 ) ) ( not ( = ?auto_2326850 ?auto_2326856 ) ) ( not ( = ?auto_2326850 ?auto_2326857 ) ) ( not ( = ?auto_2326850 ?auto_2326858 ) ) ( not ( = ?auto_2326850 ?auto_2326859 ) ) ( not ( = ?auto_2326850 ?auto_2326860 ) ) ( not ( = ?auto_2326852 ?auto_2326851 ) ) ( not ( = ?auto_2326852 ?auto_2326853 ) ) ( not ( = ?auto_2326852 ?auto_2326854 ) ) ( not ( = ?auto_2326852 ?auto_2326855 ) ) ( not ( = ?auto_2326852 ?auto_2326856 ) ) ( not ( = ?auto_2326852 ?auto_2326857 ) ) ( not ( = ?auto_2326852 ?auto_2326858 ) ) ( not ( = ?auto_2326852 ?auto_2326859 ) ) ( not ( = ?auto_2326852 ?auto_2326860 ) ) ( not ( = ?auto_2326851 ?auto_2326853 ) ) ( not ( = ?auto_2326851 ?auto_2326854 ) ) ( not ( = ?auto_2326851 ?auto_2326855 ) ) ( not ( = ?auto_2326851 ?auto_2326856 ) ) ( not ( = ?auto_2326851 ?auto_2326857 ) ) ( not ( = ?auto_2326851 ?auto_2326858 ) ) ( not ( = ?auto_2326851 ?auto_2326859 ) ) ( not ( = ?auto_2326851 ?auto_2326860 ) ) ( not ( = ?auto_2326853 ?auto_2326854 ) ) ( not ( = ?auto_2326853 ?auto_2326855 ) ) ( not ( = ?auto_2326853 ?auto_2326856 ) ) ( not ( = ?auto_2326853 ?auto_2326857 ) ) ( not ( = ?auto_2326853 ?auto_2326858 ) ) ( not ( = ?auto_2326853 ?auto_2326859 ) ) ( not ( = ?auto_2326853 ?auto_2326860 ) ) ( not ( = ?auto_2326854 ?auto_2326855 ) ) ( not ( = ?auto_2326854 ?auto_2326856 ) ) ( not ( = ?auto_2326854 ?auto_2326857 ) ) ( not ( = ?auto_2326854 ?auto_2326858 ) ) ( not ( = ?auto_2326854 ?auto_2326859 ) ) ( not ( = ?auto_2326854 ?auto_2326860 ) ) ( not ( = ?auto_2326855 ?auto_2326856 ) ) ( not ( = ?auto_2326855 ?auto_2326857 ) ) ( not ( = ?auto_2326855 ?auto_2326858 ) ) ( not ( = ?auto_2326855 ?auto_2326859 ) ) ( not ( = ?auto_2326855 ?auto_2326860 ) ) ( not ( = ?auto_2326856 ?auto_2326857 ) ) ( not ( = ?auto_2326856 ?auto_2326858 ) ) ( not ( = ?auto_2326856 ?auto_2326859 ) ) ( not ( = ?auto_2326856 ?auto_2326860 ) ) ( not ( = ?auto_2326857 ?auto_2326858 ) ) ( not ( = ?auto_2326857 ?auto_2326859 ) ) ( not ( = ?auto_2326857 ?auto_2326860 ) ) ( not ( = ?auto_2326858 ?auto_2326859 ) ) ( not ( = ?auto_2326858 ?auto_2326860 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2326859 ?auto_2326860 )
      ( MAKE-14CRATE-VERIFY ?auto_2326847 ?auto_2326848 ?auto_2326849 ?auto_2326846 ?auto_2326850 ?auto_2326852 ?auto_2326851 ?auto_2326853 ?auto_2326854 ?auto_2326855 ?auto_2326856 ?auto_2326857 ?auto_2326858 ?auto_2326859 ?auto_2326860 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_2327007 - SURFACE
      ?auto_2327008 - SURFACE
      ?auto_2327009 - SURFACE
      ?auto_2327006 - SURFACE
      ?auto_2327010 - SURFACE
      ?auto_2327012 - SURFACE
      ?auto_2327011 - SURFACE
      ?auto_2327013 - SURFACE
      ?auto_2327014 - SURFACE
      ?auto_2327015 - SURFACE
      ?auto_2327016 - SURFACE
      ?auto_2327017 - SURFACE
      ?auto_2327018 - SURFACE
      ?auto_2327019 - SURFACE
      ?auto_2327020 - SURFACE
    )
    :vars
    (
      ?auto_2327023 - HOIST
      ?auto_2327021 - PLACE
      ?auto_2327022 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2327023 ?auto_2327021 ) ( SURFACE-AT ?auto_2327019 ?auto_2327021 ) ( CLEAR ?auto_2327019 ) ( IS-CRATE ?auto_2327020 ) ( not ( = ?auto_2327019 ?auto_2327020 ) ) ( TRUCK-AT ?auto_2327022 ?auto_2327021 ) ( AVAILABLE ?auto_2327023 ) ( IN ?auto_2327020 ?auto_2327022 ) ( ON ?auto_2327019 ?auto_2327018 ) ( not ( = ?auto_2327018 ?auto_2327019 ) ) ( not ( = ?auto_2327018 ?auto_2327020 ) ) ( ON ?auto_2327008 ?auto_2327007 ) ( ON ?auto_2327009 ?auto_2327008 ) ( ON ?auto_2327006 ?auto_2327009 ) ( ON ?auto_2327010 ?auto_2327006 ) ( ON ?auto_2327012 ?auto_2327010 ) ( ON ?auto_2327011 ?auto_2327012 ) ( ON ?auto_2327013 ?auto_2327011 ) ( ON ?auto_2327014 ?auto_2327013 ) ( ON ?auto_2327015 ?auto_2327014 ) ( ON ?auto_2327016 ?auto_2327015 ) ( ON ?auto_2327017 ?auto_2327016 ) ( ON ?auto_2327018 ?auto_2327017 ) ( not ( = ?auto_2327007 ?auto_2327008 ) ) ( not ( = ?auto_2327007 ?auto_2327009 ) ) ( not ( = ?auto_2327007 ?auto_2327006 ) ) ( not ( = ?auto_2327007 ?auto_2327010 ) ) ( not ( = ?auto_2327007 ?auto_2327012 ) ) ( not ( = ?auto_2327007 ?auto_2327011 ) ) ( not ( = ?auto_2327007 ?auto_2327013 ) ) ( not ( = ?auto_2327007 ?auto_2327014 ) ) ( not ( = ?auto_2327007 ?auto_2327015 ) ) ( not ( = ?auto_2327007 ?auto_2327016 ) ) ( not ( = ?auto_2327007 ?auto_2327017 ) ) ( not ( = ?auto_2327007 ?auto_2327018 ) ) ( not ( = ?auto_2327007 ?auto_2327019 ) ) ( not ( = ?auto_2327007 ?auto_2327020 ) ) ( not ( = ?auto_2327008 ?auto_2327009 ) ) ( not ( = ?auto_2327008 ?auto_2327006 ) ) ( not ( = ?auto_2327008 ?auto_2327010 ) ) ( not ( = ?auto_2327008 ?auto_2327012 ) ) ( not ( = ?auto_2327008 ?auto_2327011 ) ) ( not ( = ?auto_2327008 ?auto_2327013 ) ) ( not ( = ?auto_2327008 ?auto_2327014 ) ) ( not ( = ?auto_2327008 ?auto_2327015 ) ) ( not ( = ?auto_2327008 ?auto_2327016 ) ) ( not ( = ?auto_2327008 ?auto_2327017 ) ) ( not ( = ?auto_2327008 ?auto_2327018 ) ) ( not ( = ?auto_2327008 ?auto_2327019 ) ) ( not ( = ?auto_2327008 ?auto_2327020 ) ) ( not ( = ?auto_2327009 ?auto_2327006 ) ) ( not ( = ?auto_2327009 ?auto_2327010 ) ) ( not ( = ?auto_2327009 ?auto_2327012 ) ) ( not ( = ?auto_2327009 ?auto_2327011 ) ) ( not ( = ?auto_2327009 ?auto_2327013 ) ) ( not ( = ?auto_2327009 ?auto_2327014 ) ) ( not ( = ?auto_2327009 ?auto_2327015 ) ) ( not ( = ?auto_2327009 ?auto_2327016 ) ) ( not ( = ?auto_2327009 ?auto_2327017 ) ) ( not ( = ?auto_2327009 ?auto_2327018 ) ) ( not ( = ?auto_2327009 ?auto_2327019 ) ) ( not ( = ?auto_2327009 ?auto_2327020 ) ) ( not ( = ?auto_2327006 ?auto_2327010 ) ) ( not ( = ?auto_2327006 ?auto_2327012 ) ) ( not ( = ?auto_2327006 ?auto_2327011 ) ) ( not ( = ?auto_2327006 ?auto_2327013 ) ) ( not ( = ?auto_2327006 ?auto_2327014 ) ) ( not ( = ?auto_2327006 ?auto_2327015 ) ) ( not ( = ?auto_2327006 ?auto_2327016 ) ) ( not ( = ?auto_2327006 ?auto_2327017 ) ) ( not ( = ?auto_2327006 ?auto_2327018 ) ) ( not ( = ?auto_2327006 ?auto_2327019 ) ) ( not ( = ?auto_2327006 ?auto_2327020 ) ) ( not ( = ?auto_2327010 ?auto_2327012 ) ) ( not ( = ?auto_2327010 ?auto_2327011 ) ) ( not ( = ?auto_2327010 ?auto_2327013 ) ) ( not ( = ?auto_2327010 ?auto_2327014 ) ) ( not ( = ?auto_2327010 ?auto_2327015 ) ) ( not ( = ?auto_2327010 ?auto_2327016 ) ) ( not ( = ?auto_2327010 ?auto_2327017 ) ) ( not ( = ?auto_2327010 ?auto_2327018 ) ) ( not ( = ?auto_2327010 ?auto_2327019 ) ) ( not ( = ?auto_2327010 ?auto_2327020 ) ) ( not ( = ?auto_2327012 ?auto_2327011 ) ) ( not ( = ?auto_2327012 ?auto_2327013 ) ) ( not ( = ?auto_2327012 ?auto_2327014 ) ) ( not ( = ?auto_2327012 ?auto_2327015 ) ) ( not ( = ?auto_2327012 ?auto_2327016 ) ) ( not ( = ?auto_2327012 ?auto_2327017 ) ) ( not ( = ?auto_2327012 ?auto_2327018 ) ) ( not ( = ?auto_2327012 ?auto_2327019 ) ) ( not ( = ?auto_2327012 ?auto_2327020 ) ) ( not ( = ?auto_2327011 ?auto_2327013 ) ) ( not ( = ?auto_2327011 ?auto_2327014 ) ) ( not ( = ?auto_2327011 ?auto_2327015 ) ) ( not ( = ?auto_2327011 ?auto_2327016 ) ) ( not ( = ?auto_2327011 ?auto_2327017 ) ) ( not ( = ?auto_2327011 ?auto_2327018 ) ) ( not ( = ?auto_2327011 ?auto_2327019 ) ) ( not ( = ?auto_2327011 ?auto_2327020 ) ) ( not ( = ?auto_2327013 ?auto_2327014 ) ) ( not ( = ?auto_2327013 ?auto_2327015 ) ) ( not ( = ?auto_2327013 ?auto_2327016 ) ) ( not ( = ?auto_2327013 ?auto_2327017 ) ) ( not ( = ?auto_2327013 ?auto_2327018 ) ) ( not ( = ?auto_2327013 ?auto_2327019 ) ) ( not ( = ?auto_2327013 ?auto_2327020 ) ) ( not ( = ?auto_2327014 ?auto_2327015 ) ) ( not ( = ?auto_2327014 ?auto_2327016 ) ) ( not ( = ?auto_2327014 ?auto_2327017 ) ) ( not ( = ?auto_2327014 ?auto_2327018 ) ) ( not ( = ?auto_2327014 ?auto_2327019 ) ) ( not ( = ?auto_2327014 ?auto_2327020 ) ) ( not ( = ?auto_2327015 ?auto_2327016 ) ) ( not ( = ?auto_2327015 ?auto_2327017 ) ) ( not ( = ?auto_2327015 ?auto_2327018 ) ) ( not ( = ?auto_2327015 ?auto_2327019 ) ) ( not ( = ?auto_2327015 ?auto_2327020 ) ) ( not ( = ?auto_2327016 ?auto_2327017 ) ) ( not ( = ?auto_2327016 ?auto_2327018 ) ) ( not ( = ?auto_2327016 ?auto_2327019 ) ) ( not ( = ?auto_2327016 ?auto_2327020 ) ) ( not ( = ?auto_2327017 ?auto_2327018 ) ) ( not ( = ?auto_2327017 ?auto_2327019 ) ) ( not ( = ?auto_2327017 ?auto_2327020 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2327018 ?auto_2327019 ?auto_2327020 )
      ( MAKE-14CRATE-VERIFY ?auto_2327007 ?auto_2327008 ?auto_2327009 ?auto_2327006 ?auto_2327010 ?auto_2327012 ?auto_2327011 ?auto_2327013 ?auto_2327014 ?auto_2327015 ?auto_2327016 ?auto_2327017 ?auto_2327018 ?auto_2327019 ?auto_2327020 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_2327182 - SURFACE
      ?auto_2327183 - SURFACE
      ?auto_2327184 - SURFACE
      ?auto_2327181 - SURFACE
      ?auto_2327185 - SURFACE
      ?auto_2327187 - SURFACE
      ?auto_2327186 - SURFACE
      ?auto_2327188 - SURFACE
      ?auto_2327189 - SURFACE
      ?auto_2327190 - SURFACE
      ?auto_2327191 - SURFACE
      ?auto_2327192 - SURFACE
      ?auto_2327193 - SURFACE
      ?auto_2327194 - SURFACE
      ?auto_2327195 - SURFACE
    )
    :vars
    (
      ?auto_2327199 - HOIST
      ?auto_2327196 - PLACE
      ?auto_2327197 - TRUCK
      ?auto_2327198 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2327199 ?auto_2327196 ) ( SURFACE-AT ?auto_2327194 ?auto_2327196 ) ( CLEAR ?auto_2327194 ) ( IS-CRATE ?auto_2327195 ) ( not ( = ?auto_2327194 ?auto_2327195 ) ) ( AVAILABLE ?auto_2327199 ) ( IN ?auto_2327195 ?auto_2327197 ) ( ON ?auto_2327194 ?auto_2327193 ) ( not ( = ?auto_2327193 ?auto_2327194 ) ) ( not ( = ?auto_2327193 ?auto_2327195 ) ) ( TRUCK-AT ?auto_2327197 ?auto_2327198 ) ( not ( = ?auto_2327198 ?auto_2327196 ) ) ( ON ?auto_2327183 ?auto_2327182 ) ( ON ?auto_2327184 ?auto_2327183 ) ( ON ?auto_2327181 ?auto_2327184 ) ( ON ?auto_2327185 ?auto_2327181 ) ( ON ?auto_2327187 ?auto_2327185 ) ( ON ?auto_2327186 ?auto_2327187 ) ( ON ?auto_2327188 ?auto_2327186 ) ( ON ?auto_2327189 ?auto_2327188 ) ( ON ?auto_2327190 ?auto_2327189 ) ( ON ?auto_2327191 ?auto_2327190 ) ( ON ?auto_2327192 ?auto_2327191 ) ( ON ?auto_2327193 ?auto_2327192 ) ( not ( = ?auto_2327182 ?auto_2327183 ) ) ( not ( = ?auto_2327182 ?auto_2327184 ) ) ( not ( = ?auto_2327182 ?auto_2327181 ) ) ( not ( = ?auto_2327182 ?auto_2327185 ) ) ( not ( = ?auto_2327182 ?auto_2327187 ) ) ( not ( = ?auto_2327182 ?auto_2327186 ) ) ( not ( = ?auto_2327182 ?auto_2327188 ) ) ( not ( = ?auto_2327182 ?auto_2327189 ) ) ( not ( = ?auto_2327182 ?auto_2327190 ) ) ( not ( = ?auto_2327182 ?auto_2327191 ) ) ( not ( = ?auto_2327182 ?auto_2327192 ) ) ( not ( = ?auto_2327182 ?auto_2327193 ) ) ( not ( = ?auto_2327182 ?auto_2327194 ) ) ( not ( = ?auto_2327182 ?auto_2327195 ) ) ( not ( = ?auto_2327183 ?auto_2327184 ) ) ( not ( = ?auto_2327183 ?auto_2327181 ) ) ( not ( = ?auto_2327183 ?auto_2327185 ) ) ( not ( = ?auto_2327183 ?auto_2327187 ) ) ( not ( = ?auto_2327183 ?auto_2327186 ) ) ( not ( = ?auto_2327183 ?auto_2327188 ) ) ( not ( = ?auto_2327183 ?auto_2327189 ) ) ( not ( = ?auto_2327183 ?auto_2327190 ) ) ( not ( = ?auto_2327183 ?auto_2327191 ) ) ( not ( = ?auto_2327183 ?auto_2327192 ) ) ( not ( = ?auto_2327183 ?auto_2327193 ) ) ( not ( = ?auto_2327183 ?auto_2327194 ) ) ( not ( = ?auto_2327183 ?auto_2327195 ) ) ( not ( = ?auto_2327184 ?auto_2327181 ) ) ( not ( = ?auto_2327184 ?auto_2327185 ) ) ( not ( = ?auto_2327184 ?auto_2327187 ) ) ( not ( = ?auto_2327184 ?auto_2327186 ) ) ( not ( = ?auto_2327184 ?auto_2327188 ) ) ( not ( = ?auto_2327184 ?auto_2327189 ) ) ( not ( = ?auto_2327184 ?auto_2327190 ) ) ( not ( = ?auto_2327184 ?auto_2327191 ) ) ( not ( = ?auto_2327184 ?auto_2327192 ) ) ( not ( = ?auto_2327184 ?auto_2327193 ) ) ( not ( = ?auto_2327184 ?auto_2327194 ) ) ( not ( = ?auto_2327184 ?auto_2327195 ) ) ( not ( = ?auto_2327181 ?auto_2327185 ) ) ( not ( = ?auto_2327181 ?auto_2327187 ) ) ( not ( = ?auto_2327181 ?auto_2327186 ) ) ( not ( = ?auto_2327181 ?auto_2327188 ) ) ( not ( = ?auto_2327181 ?auto_2327189 ) ) ( not ( = ?auto_2327181 ?auto_2327190 ) ) ( not ( = ?auto_2327181 ?auto_2327191 ) ) ( not ( = ?auto_2327181 ?auto_2327192 ) ) ( not ( = ?auto_2327181 ?auto_2327193 ) ) ( not ( = ?auto_2327181 ?auto_2327194 ) ) ( not ( = ?auto_2327181 ?auto_2327195 ) ) ( not ( = ?auto_2327185 ?auto_2327187 ) ) ( not ( = ?auto_2327185 ?auto_2327186 ) ) ( not ( = ?auto_2327185 ?auto_2327188 ) ) ( not ( = ?auto_2327185 ?auto_2327189 ) ) ( not ( = ?auto_2327185 ?auto_2327190 ) ) ( not ( = ?auto_2327185 ?auto_2327191 ) ) ( not ( = ?auto_2327185 ?auto_2327192 ) ) ( not ( = ?auto_2327185 ?auto_2327193 ) ) ( not ( = ?auto_2327185 ?auto_2327194 ) ) ( not ( = ?auto_2327185 ?auto_2327195 ) ) ( not ( = ?auto_2327187 ?auto_2327186 ) ) ( not ( = ?auto_2327187 ?auto_2327188 ) ) ( not ( = ?auto_2327187 ?auto_2327189 ) ) ( not ( = ?auto_2327187 ?auto_2327190 ) ) ( not ( = ?auto_2327187 ?auto_2327191 ) ) ( not ( = ?auto_2327187 ?auto_2327192 ) ) ( not ( = ?auto_2327187 ?auto_2327193 ) ) ( not ( = ?auto_2327187 ?auto_2327194 ) ) ( not ( = ?auto_2327187 ?auto_2327195 ) ) ( not ( = ?auto_2327186 ?auto_2327188 ) ) ( not ( = ?auto_2327186 ?auto_2327189 ) ) ( not ( = ?auto_2327186 ?auto_2327190 ) ) ( not ( = ?auto_2327186 ?auto_2327191 ) ) ( not ( = ?auto_2327186 ?auto_2327192 ) ) ( not ( = ?auto_2327186 ?auto_2327193 ) ) ( not ( = ?auto_2327186 ?auto_2327194 ) ) ( not ( = ?auto_2327186 ?auto_2327195 ) ) ( not ( = ?auto_2327188 ?auto_2327189 ) ) ( not ( = ?auto_2327188 ?auto_2327190 ) ) ( not ( = ?auto_2327188 ?auto_2327191 ) ) ( not ( = ?auto_2327188 ?auto_2327192 ) ) ( not ( = ?auto_2327188 ?auto_2327193 ) ) ( not ( = ?auto_2327188 ?auto_2327194 ) ) ( not ( = ?auto_2327188 ?auto_2327195 ) ) ( not ( = ?auto_2327189 ?auto_2327190 ) ) ( not ( = ?auto_2327189 ?auto_2327191 ) ) ( not ( = ?auto_2327189 ?auto_2327192 ) ) ( not ( = ?auto_2327189 ?auto_2327193 ) ) ( not ( = ?auto_2327189 ?auto_2327194 ) ) ( not ( = ?auto_2327189 ?auto_2327195 ) ) ( not ( = ?auto_2327190 ?auto_2327191 ) ) ( not ( = ?auto_2327190 ?auto_2327192 ) ) ( not ( = ?auto_2327190 ?auto_2327193 ) ) ( not ( = ?auto_2327190 ?auto_2327194 ) ) ( not ( = ?auto_2327190 ?auto_2327195 ) ) ( not ( = ?auto_2327191 ?auto_2327192 ) ) ( not ( = ?auto_2327191 ?auto_2327193 ) ) ( not ( = ?auto_2327191 ?auto_2327194 ) ) ( not ( = ?auto_2327191 ?auto_2327195 ) ) ( not ( = ?auto_2327192 ?auto_2327193 ) ) ( not ( = ?auto_2327192 ?auto_2327194 ) ) ( not ( = ?auto_2327192 ?auto_2327195 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2327193 ?auto_2327194 ?auto_2327195 )
      ( MAKE-14CRATE-VERIFY ?auto_2327182 ?auto_2327183 ?auto_2327184 ?auto_2327181 ?auto_2327185 ?auto_2327187 ?auto_2327186 ?auto_2327188 ?auto_2327189 ?auto_2327190 ?auto_2327191 ?auto_2327192 ?auto_2327193 ?auto_2327194 ?auto_2327195 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_2327371 - SURFACE
      ?auto_2327372 - SURFACE
      ?auto_2327373 - SURFACE
      ?auto_2327370 - SURFACE
      ?auto_2327374 - SURFACE
      ?auto_2327376 - SURFACE
      ?auto_2327375 - SURFACE
      ?auto_2327377 - SURFACE
      ?auto_2327378 - SURFACE
      ?auto_2327379 - SURFACE
      ?auto_2327380 - SURFACE
      ?auto_2327381 - SURFACE
      ?auto_2327382 - SURFACE
      ?auto_2327383 - SURFACE
      ?auto_2327384 - SURFACE
    )
    :vars
    (
      ?auto_2327385 - HOIST
      ?auto_2327388 - PLACE
      ?auto_2327387 - TRUCK
      ?auto_2327386 - PLACE
      ?auto_2327389 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2327385 ?auto_2327388 ) ( SURFACE-AT ?auto_2327383 ?auto_2327388 ) ( CLEAR ?auto_2327383 ) ( IS-CRATE ?auto_2327384 ) ( not ( = ?auto_2327383 ?auto_2327384 ) ) ( AVAILABLE ?auto_2327385 ) ( ON ?auto_2327383 ?auto_2327382 ) ( not ( = ?auto_2327382 ?auto_2327383 ) ) ( not ( = ?auto_2327382 ?auto_2327384 ) ) ( TRUCK-AT ?auto_2327387 ?auto_2327386 ) ( not ( = ?auto_2327386 ?auto_2327388 ) ) ( HOIST-AT ?auto_2327389 ?auto_2327386 ) ( LIFTING ?auto_2327389 ?auto_2327384 ) ( not ( = ?auto_2327385 ?auto_2327389 ) ) ( ON ?auto_2327372 ?auto_2327371 ) ( ON ?auto_2327373 ?auto_2327372 ) ( ON ?auto_2327370 ?auto_2327373 ) ( ON ?auto_2327374 ?auto_2327370 ) ( ON ?auto_2327376 ?auto_2327374 ) ( ON ?auto_2327375 ?auto_2327376 ) ( ON ?auto_2327377 ?auto_2327375 ) ( ON ?auto_2327378 ?auto_2327377 ) ( ON ?auto_2327379 ?auto_2327378 ) ( ON ?auto_2327380 ?auto_2327379 ) ( ON ?auto_2327381 ?auto_2327380 ) ( ON ?auto_2327382 ?auto_2327381 ) ( not ( = ?auto_2327371 ?auto_2327372 ) ) ( not ( = ?auto_2327371 ?auto_2327373 ) ) ( not ( = ?auto_2327371 ?auto_2327370 ) ) ( not ( = ?auto_2327371 ?auto_2327374 ) ) ( not ( = ?auto_2327371 ?auto_2327376 ) ) ( not ( = ?auto_2327371 ?auto_2327375 ) ) ( not ( = ?auto_2327371 ?auto_2327377 ) ) ( not ( = ?auto_2327371 ?auto_2327378 ) ) ( not ( = ?auto_2327371 ?auto_2327379 ) ) ( not ( = ?auto_2327371 ?auto_2327380 ) ) ( not ( = ?auto_2327371 ?auto_2327381 ) ) ( not ( = ?auto_2327371 ?auto_2327382 ) ) ( not ( = ?auto_2327371 ?auto_2327383 ) ) ( not ( = ?auto_2327371 ?auto_2327384 ) ) ( not ( = ?auto_2327372 ?auto_2327373 ) ) ( not ( = ?auto_2327372 ?auto_2327370 ) ) ( not ( = ?auto_2327372 ?auto_2327374 ) ) ( not ( = ?auto_2327372 ?auto_2327376 ) ) ( not ( = ?auto_2327372 ?auto_2327375 ) ) ( not ( = ?auto_2327372 ?auto_2327377 ) ) ( not ( = ?auto_2327372 ?auto_2327378 ) ) ( not ( = ?auto_2327372 ?auto_2327379 ) ) ( not ( = ?auto_2327372 ?auto_2327380 ) ) ( not ( = ?auto_2327372 ?auto_2327381 ) ) ( not ( = ?auto_2327372 ?auto_2327382 ) ) ( not ( = ?auto_2327372 ?auto_2327383 ) ) ( not ( = ?auto_2327372 ?auto_2327384 ) ) ( not ( = ?auto_2327373 ?auto_2327370 ) ) ( not ( = ?auto_2327373 ?auto_2327374 ) ) ( not ( = ?auto_2327373 ?auto_2327376 ) ) ( not ( = ?auto_2327373 ?auto_2327375 ) ) ( not ( = ?auto_2327373 ?auto_2327377 ) ) ( not ( = ?auto_2327373 ?auto_2327378 ) ) ( not ( = ?auto_2327373 ?auto_2327379 ) ) ( not ( = ?auto_2327373 ?auto_2327380 ) ) ( not ( = ?auto_2327373 ?auto_2327381 ) ) ( not ( = ?auto_2327373 ?auto_2327382 ) ) ( not ( = ?auto_2327373 ?auto_2327383 ) ) ( not ( = ?auto_2327373 ?auto_2327384 ) ) ( not ( = ?auto_2327370 ?auto_2327374 ) ) ( not ( = ?auto_2327370 ?auto_2327376 ) ) ( not ( = ?auto_2327370 ?auto_2327375 ) ) ( not ( = ?auto_2327370 ?auto_2327377 ) ) ( not ( = ?auto_2327370 ?auto_2327378 ) ) ( not ( = ?auto_2327370 ?auto_2327379 ) ) ( not ( = ?auto_2327370 ?auto_2327380 ) ) ( not ( = ?auto_2327370 ?auto_2327381 ) ) ( not ( = ?auto_2327370 ?auto_2327382 ) ) ( not ( = ?auto_2327370 ?auto_2327383 ) ) ( not ( = ?auto_2327370 ?auto_2327384 ) ) ( not ( = ?auto_2327374 ?auto_2327376 ) ) ( not ( = ?auto_2327374 ?auto_2327375 ) ) ( not ( = ?auto_2327374 ?auto_2327377 ) ) ( not ( = ?auto_2327374 ?auto_2327378 ) ) ( not ( = ?auto_2327374 ?auto_2327379 ) ) ( not ( = ?auto_2327374 ?auto_2327380 ) ) ( not ( = ?auto_2327374 ?auto_2327381 ) ) ( not ( = ?auto_2327374 ?auto_2327382 ) ) ( not ( = ?auto_2327374 ?auto_2327383 ) ) ( not ( = ?auto_2327374 ?auto_2327384 ) ) ( not ( = ?auto_2327376 ?auto_2327375 ) ) ( not ( = ?auto_2327376 ?auto_2327377 ) ) ( not ( = ?auto_2327376 ?auto_2327378 ) ) ( not ( = ?auto_2327376 ?auto_2327379 ) ) ( not ( = ?auto_2327376 ?auto_2327380 ) ) ( not ( = ?auto_2327376 ?auto_2327381 ) ) ( not ( = ?auto_2327376 ?auto_2327382 ) ) ( not ( = ?auto_2327376 ?auto_2327383 ) ) ( not ( = ?auto_2327376 ?auto_2327384 ) ) ( not ( = ?auto_2327375 ?auto_2327377 ) ) ( not ( = ?auto_2327375 ?auto_2327378 ) ) ( not ( = ?auto_2327375 ?auto_2327379 ) ) ( not ( = ?auto_2327375 ?auto_2327380 ) ) ( not ( = ?auto_2327375 ?auto_2327381 ) ) ( not ( = ?auto_2327375 ?auto_2327382 ) ) ( not ( = ?auto_2327375 ?auto_2327383 ) ) ( not ( = ?auto_2327375 ?auto_2327384 ) ) ( not ( = ?auto_2327377 ?auto_2327378 ) ) ( not ( = ?auto_2327377 ?auto_2327379 ) ) ( not ( = ?auto_2327377 ?auto_2327380 ) ) ( not ( = ?auto_2327377 ?auto_2327381 ) ) ( not ( = ?auto_2327377 ?auto_2327382 ) ) ( not ( = ?auto_2327377 ?auto_2327383 ) ) ( not ( = ?auto_2327377 ?auto_2327384 ) ) ( not ( = ?auto_2327378 ?auto_2327379 ) ) ( not ( = ?auto_2327378 ?auto_2327380 ) ) ( not ( = ?auto_2327378 ?auto_2327381 ) ) ( not ( = ?auto_2327378 ?auto_2327382 ) ) ( not ( = ?auto_2327378 ?auto_2327383 ) ) ( not ( = ?auto_2327378 ?auto_2327384 ) ) ( not ( = ?auto_2327379 ?auto_2327380 ) ) ( not ( = ?auto_2327379 ?auto_2327381 ) ) ( not ( = ?auto_2327379 ?auto_2327382 ) ) ( not ( = ?auto_2327379 ?auto_2327383 ) ) ( not ( = ?auto_2327379 ?auto_2327384 ) ) ( not ( = ?auto_2327380 ?auto_2327381 ) ) ( not ( = ?auto_2327380 ?auto_2327382 ) ) ( not ( = ?auto_2327380 ?auto_2327383 ) ) ( not ( = ?auto_2327380 ?auto_2327384 ) ) ( not ( = ?auto_2327381 ?auto_2327382 ) ) ( not ( = ?auto_2327381 ?auto_2327383 ) ) ( not ( = ?auto_2327381 ?auto_2327384 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2327382 ?auto_2327383 ?auto_2327384 )
      ( MAKE-14CRATE-VERIFY ?auto_2327371 ?auto_2327372 ?auto_2327373 ?auto_2327370 ?auto_2327374 ?auto_2327376 ?auto_2327375 ?auto_2327377 ?auto_2327378 ?auto_2327379 ?auto_2327380 ?auto_2327381 ?auto_2327382 ?auto_2327383 ?auto_2327384 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_2327574 - SURFACE
      ?auto_2327575 - SURFACE
      ?auto_2327576 - SURFACE
      ?auto_2327573 - SURFACE
      ?auto_2327577 - SURFACE
      ?auto_2327579 - SURFACE
      ?auto_2327578 - SURFACE
      ?auto_2327580 - SURFACE
      ?auto_2327581 - SURFACE
      ?auto_2327582 - SURFACE
      ?auto_2327583 - SURFACE
      ?auto_2327584 - SURFACE
      ?auto_2327585 - SURFACE
      ?auto_2327586 - SURFACE
      ?auto_2327587 - SURFACE
    )
    :vars
    (
      ?auto_2327592 - HOIST
      ?auto_2327588 - PLACE
      ?auto_2327591 - TRUCK
      ?auto_2327590 - PLACE
      ?auto_2327593 - HOIST
      ?auto_2327589 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2327592 ?auto_2327588 ) ( SURFACE-AT ?auto_2327586 ?auto_2327588 ) ( CLEAR ?auto_2327586 ) ( IS-CRATE ?auto_2327587 ) ( not ( = ?auto_2327586 ?auto_2327587 ) ) ( AVAILABLE ?auto_2327592 ) ( ON ?auto_2327586 ?auto_2327585 ) ( not ( = ?auto_2327585 ?auto_2327586 ) ) ( not ( = ?auto_2327585 ?auto_2327587 ) ) ( TRUCK-AT ?auto_2327591 ?auto_2327590 ) ( not ( = ?auto_2327590 ?auto_2327588 ) ) ( HOIST-AT ?auto_2327593 ?auto_2327590 ) ( not ( = ?auto_2327592 ?auto_2327593 ) ) ( AVAILABLE ?auto_2327593 ) ( SURFACE-AT ?auto_2327587 ?auto_2327590 ) ( ON ?auto_2327587 ?auto_2327589 ) ( CLEAR ?auto_2327587 ) ( not ( = ?auto_2327586 ?auto_2327589 ) ) ( not ( = ?auto_2327587 ?auto_2327589 ) ) ( not ( = ?auto_2327585 ?auto_2327589 ) ) ( ON ?auto_2327575 ?auto_2327574 ) ( ON ?auto_2327576 ?auto_2327575 ) ( ON ?auto_2327573 ?auto_2327576 ) ( ON ?auto_2327577 ?auto_2327573 ) ( ON ?auto_2327579 ?auto_2327577 ) ( ON ?auto_2327578 ?auto_2327579 ) ( ON ?auto_2327580 ?auto_2327578 ) ( ON ?auto_2327581 ?auto_2327580 ) ( ON ?auto_2327582 ?auto_2327581 ) ( ON ?auto_2327583 ?auto_2327582 ) ( ON ?auto_2327584 ?auto_2327583 ) ( ON ?auto_2327585 ?auto_2327584 ) ( not ( = ?auto_2327574 ?auto_2327575 ) ) ( not ( = ?auto_2327574 ?auto_2327576 ) ) ( not ( = ?auto_2327574 ?auto_2327573 ) ) ( not ( = ?auto_2327574 ?auto_2327577 ) ) ( not ( = ?auto_2327574 ?auto_2327579 ) ) ( not ( = ?auto_2327574 ?auto_2327578 ) ) ( not ( = ?auto_2327574 ?auto_2327580 ) ) ( not ( = ?auto_2327574 ?auto_2327581 ) ) ( not ( = ?auto_2327574 ?auto_2327582 ) ) ( not ( = ?auto_2327574 ?auto_2327583 ) ) ( not ( = ?auto_2327574 ?auto_2327584 ) ) ( not ( = ?auto_2327574 ?auto_2327585 ) ) ( not ( = ?auto_2327574 ?auto_2327586 ) ) ( not ( = ?auto_2327574 ?auto_2327587 ) ) ( not ( = ?auto_2327574 ?auto_2327589 ) ) ( not ( = ?auto_2327575 ?auto_2327576 ) ) ( not ( = ?auto_2327575 ?auto_2327573 ) ) ( not ( = ?auto_2327575 ?auto_2327577 ) ) ( not ( = ?auto_2327575 ?auto_2327579 ) ) ( not ( = ?auto_2327575 ?auto_2327578 ) ) ( not ( = ?auto_2327575 ?auto_2327580 ) ) ( not ( = ?auto_2327575 ?auto_2327581 ) ) ( not ( = ?auto_2327575 ?auto_2327582 ) ) ( not ( = ?auto_2327575 ?auto_2327583 ) ) ( not ( = ?auto_2327575 ?auto_2327584 ) ) ( not ( = ?auto_2327575 ?auto_2327585 ) ) ( not ( = ?auto_2327575 ?auto_2327586 ) ) ( not ( = ?auto_2327575 ?auto_2327587 ) ) ( not ( = ?auto_2327575 ?auto_2327589 ) ) ( not ( = ?auto_2327576 ?auto_2327573 ) ) ( not ( = ?auto_2327576 ?auto_2327577 ) ) ( not ( = ?auto_2327576 ?auto_2327579 ) ) ( not ( = ?auto_2327576 ?auto_2327578 ) ) ( not ( = ?auto_2327576 ?auto_2327580 ) ) ( not ( = ?auto_2327576 ?auto_2327581 ) ) ( not ( = ?auto_2327576 ?auto_2327582 ) ) ( not ( = ?auto_2327576 ?auto_2327583 ) ) ( not ( = ?auto_2327576 ?auto_2327584 ) ) ( not ( = ?auto_2327576 ?auto_2327585 ) ) ( not ( = ?auto_2327576 ?auto_2327586 ) ) ( not ( = ?auto_2327576 ?auto_2327587 ) ) ( not ( = ?auto_2327576 ?auto_2327589 ) ) ( not ( = ?auto_2327573 ?auto_2327577 ) ) ( not ( = ?auto_2327573 ?auto_2327579 ) ) ( not ( = ?auto_2327573 ?auto_2327578 ) ) ( not ( = ?auto_2327573 ?auto_2327580 ) ) ( not ( = ?auto_2327573 ?auto_2327581 ) ) ( not ( = ?auto_2327573 ?auto_2327582 ) ) ( not ( = ?auto_2327573 ?auto_2327583 ) ) ( not ( = ?auto_2327573 ?auto_2327584 ) ) ( not ( = ?auto_2327573 ?auto_2327585 ) ) ( not ( = ?auto_2327573 ?auto_2327586 ) ) ( not ( = ?auto_2327573 ?auto_2327587 ) ) ( not ( = ?auto_2327573 ?auto_2327589 ) ) ( not ( = ?auto_2327577 ?auto_2327579 ) ) ( not ( = ?auto_2327577 ?auto_2327578 ) ) ( not ( = ?auto_2327577 ?auto_2327580 ) ) ( not ( = ?auto_2327577 ?auto_2327581 ) ) ( not ( = ?auto_2327577 ?auto_2327582 ) ) ( not ( = ?auto_2327577 ?auto_2327583 ) ) ( not ( = ?auto_2327577 ?auto_2327584 ) ) ( not ( = ?auto_2327577 ?auto_2327585 ) ) ( not ( = ?auto_2327577 ?auto_2327586 ) ) ( not ( = ?auto_2327577 ?auto_2327587 ) ) ( not ( = ?auto_2327577 ?auto_2327589 ) ) ( not ( = ?auto_2327579 ?auto_2327578 ) ) ( not ( = ?auto_2327579 ?auto_2327580 ) ) ( not ( = ?auto_2327579 ?auto_2327581 ) ) ( not ( = ?auto_2327579 ?auto_2327582 ) ) ( not ( = ?auto_2327579 ?auto_2327583 ) ) ( not ( = ?auto_2327579 ?auto_2327584 ) ) ( not ( = ?auto_2327579 ?auto_2327585 ) ) ( not ( = ?auto_2327579 ?auto_2327586 ) ) ( not ( = ?auto_2327579 ?auto_2327587 ) ) ( not ( = ?auto_2327579 ?auto_2327589 ) ) ( not ( = ?auto_2327578 ?auto_2327580 ) ) ( not ( = ?auto_2327578 ?auto_2327581 ) ) ( not ( = ?auto_2327578 ?auto_2327582 ) ) ( not ( = ?auto_2327578 ?auto_2327583 ) ) ( not ( = ?auto_2327578 ?auto_2327584 ) ) ( not ( = ?auto_2327578 ?auto_2327585 ) ) ( not ( = ?auto_2327578 ?auto_2327586 ) ) ( not ( = ?auto_2327578 ?auto_2327587 ) ) ( not ( = ?auto_2327578 ?auto_2327589 ) ) ( not ( = ?auto_2327580 ?auto_2327581 ) ) ( not ( = ?auto_2327580 ?auto_2327582 ) ) ( not ( = ?auto_2327580 ?auto_2327583 ) ) ( not ( = ?auto_2327580 ?auto_2327584 ) ) ( not ( = ?auto_2327580 ?auto_2327585 ) ) ( not ( = ?auto_2327580 ?auto_2327586 ) ) ( not ( = ?auto_2327580 ?auto_2327587 ) ) ( not ( = ?auto_2327580 ?auto_2327589 ) ) ( not ( = ?auto_2327581 ?auto_2327582 ) ) ( not ( = ?auto_2327581 ?auto_2327583 ) ) ( not ( = ?auto_2327581 ?auto_2327584 ) ) ( not ( = ?auto_2327581 ?auto_2327585 ) ) ( not ( = ?auto_2327581 ?auto_2327586 ) ) ( not ( = ?auto_2327581 ?auto_2327587 ) ) ( not ( = ?auto_2327581 ?auto_2327589 ) ) ( not ( = ?auto_2327582 ?auto_2327583 ) ) ( not ( = ?auto_2327582 ?auto_2327584 ) ) ( not ( = ?auto_2327582 ?auto_2327585 ) ) ( not ( = ?auto_2327582 ?auto_2327586 ) ) ( not ( = ?auto_2327582 ?auto_2327587 ) ) ( not ( = ?auto_2327582 ?auto_2327589 ) ) ( not ( = ?auto_2327583 ?auto_2327584 ) ) ( not ( = ?auto_2327583 ?auto_2327585 ) ) ( not ( = ?auto_2327583 ?auto_2327586 ) ) ( not ( = ?auto_2327583 ?auto_2327587 ) ) ( not ( = ?auto_2327583 ?auto_2327589 ) ) ( not ( = ?auto_2327584 ?auto_2327585 ) ) ( not ( = ?auto_2327584 ?auto_2327586 ) ) ( not ( = ?auto_2327584 ?auto_2327587 ) ) ( not ( = ?auto_2327584 ?auto_2327589 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2327585 ?auto_2327586 ?auto_2327587 )
      ( MAKE-14CRATE-VERIFY ?auto_2327574 ?auto_2327575 ?auto_2327576 ?auto_2327573 ?auto_2327577 ?auto_2327579 ?auto_2327578 ?auto_2327580 ?auto_2327581 ?auto_2327582 ?auto_2327583 ?auto_2327584 ?auto_2327585 ?auto_2327586 ?auto_2327587 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_2327778 - SURFACE
      ?auto_2327779 - SURFACE
      ?auto_2327780 - SURFACE
      ?auto_2327777 - SURFACE
      ?auto_2327781 - SURFACE
      ?auto_2327783 - SURFACE
      ?auto_2327782 - SURFACE
      ?auto_2327784 - SURFACE
      ?auto_2327785 - SURFACE
      ?auto_2327786 - SURFACE
      ?auto_2327787 - SURFACE
      ?auto_2327788 - SURFACE
      ?auto_2327789 - SURFACE
      ?auto_2327790 - SURFACE
      ?auto_2327791 - SURFACE
    )
    :vars
    (
      ?auto_2327796 - HOIST
      ?auto_2327794 - PLACE
      ?auto_2327797 - PLACE
      ?auto_2327792 - HOIST
      ?auto_2327793 - SURFACE
      ?auto_2327795 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2327796 ?auto_2327794 ) ( SURFACE-AT ?auto_2327790 ?auto_2327794 ) ( CLEAR ?auto_2327790 ) ( IS-CRATE ?auto_2327791 ) ( not ( = ?auto_2327790 ?auto_2327791 ) ) ( AVAILABLE ?auto_2327796 ) ( ON ?auto_2327790 ?auto_2327789 ) ( not ( = ?auto_2327789 ?auto_2327790 ) ) ( not ( = ?auto_2327789 ?auto_2327791 ) ) ( not ( = ?auto_2327797 ?auto_2327794 ) ) ( HOIST-AT ?auto_2327792 ?auto_2327797 ) ( not ( = ?auto_2327796 ?auto_2327792 ) ) ( AVAILABLE ?auto_2327792 ) ( SURFACE-AT ?auto_2327791 ?auto_2327797 ) ( ON ?auto_2327791 ?auto_2327793 ) ( CLEAR ?auto_2327791 ) ( not ( = ?auto_2327790 ?auto_2327793 ) ) ( not ( = ?auto_2327791 ?auto_2327793 ) ) ( not ( = ?auto_2327789 ?auto_2327793 ) ) ( TRUCK-AT ?auto_2327795 ?auto_2327794 ) ( ON ?auto_2327779 ?auto_2327778 ) ( ON ?auto_2327780 ?auto_2327779 ) ( ON ?auto_2327777 ?auto_2327780 ) ( ON ?auto_2327781 ?auto_2327777 ) ( ON ?auto_2327783 ?auto_2327781 ) ( ON ?auto_2327782 ?auto_2327783 ) ( ON ?auto_2327784 ?auto_2327782 ) ( ON ?auto_2327785 ?auto_2327784 ) ( ON ?auto_2327786 ?auto_2327785 ) ( ON ?auto_2327787 ?auto_2327786 ) ( ON ?auto_2327788 ?auto_2327787 ) ( ON ?auto_2327789 ?auto_2327788 ) ( not ( = ?auto_2327778 ?auto_2327779 ) ) ( not ( = ?auto_2327778 ?auto_2327780 ) ) ( not ( = ?auto_2327778 ?auto_2327777 ) ) ( not ( = ?auto_2327778 ?auto_2327781 ) ) ( not ( = ?auto_2327778 ?auto_2327783 ) ) ( not ( = ?auto_2327778 ?auto_2327782 ) ) ( not ( = ?auto_2327778 ?auto_2327784 ) ) ( not ( = ?auto_2327778 ?auto_2327785 ) ) ( not ( = ?auto_2327778 ?auto_2327786 ) ) ( not ( = ?auto_2327778 ?auto_2327787 ) ) ( not ( = ?auto_2327778 ?auto_2327788 ) ) ( not ( = ?auto_2327778 ?auto_2327789 ) ) ( not ( = ?auto_2327778 ?auto_2327790 ) ) ( not ( = ?auto_2327778 ?auto_2327791 ) ) ( not ( = ?auto_2327778 ?auto_2327793 ) ) ( not ( = ?auto_2327779 ?auto_2327780 ) ) ( not ( = ?auto_2327779 ?auto_2327777 ) ) ( not ( = ?auto_2327779 ?auto_2327781 ) ) ( not ( = ?auto_2327779 ?auto_2327783 ) ) ( not ( = ?auto_2327779 ?auto_2327782 ) ) ( not ( = ?auto_2327779 ?auto_2327784 ) ) ( not ( = ?auto_2327779 ?auto_2327785 ) ) ( not ( = ?auto_2327779 ?auto_2327786 ) ) ( not ( = ?auto_2327779 ?auto_2327787 ) ) ( not ( = ?auto_2327779 ?auto_2327788 ) ) ( not ( = ?auto_2327779 ?auto_2327789 ) ) ( not ( = ?auto_2327779 ?auto_2327790 ) ) ( not ( = ?auto_2327779 ?auto_2327791 ) ) ( not ( = ?auto_2327779 ?auto_2327793 ) ) ( not ( = ?auto_2327780 ?auto_2327777 ) ) ( not ( = ?auto_2327780 ?auto_2327781 ) ) ( not ( = ?auto_2327780 ?auto_2327783 ) ) ( not ( = ?auto_2327780 ?auto_2327782 ) ) ( not ( = ?auto_2327780 ?auto_2327784 ) ) ( not ( = ?auto_2327780 ?auto_2327785 ) ) ( not ( = ?auto_2327780 ?auto_2327786 ) ) ( not ( = ?auto_2327780 ?auto_2327787 ) ) ( not ( = ?auto_2327780 ?auto_2327788 ) ) ( not ( = ?auto_2327780 ?auto_2327789 ) ) ( not ( = ?auto_2327780 ?auto_2327790 ) ) ( not ( = ?auto_2327780 ?auto_2327791 ) ) ( not ( = ?auto_2327780 ?auto_2327793 ) ) ( not ( = ?auto_2327777 ?auto_2327781 ) ) ( not ( = ?auto_2327777 ?auto_2327783 ) ) ( not ( = ?auto_2327777 ?auto_2327782 ) ) ( not ( = ?auto_2327777 ?auto_2327784 ) ) ( not ( = ?auto_2327777 ?auto_2327785 ) ) ( not ( = ?auto_2327777 ?auto_2327786 ) ) ( not ( = ?auto_2327777 ?auto_2327787 ) ) ( not ( = ?auto_2327777 ?auto_2327788 ) ) ( not ( = ?auto_2327777 ?auto_2327789 ) ) ( not ( = ?auto_2327777 ?auto_2327790 ) ) ( not ( = ?auto_2327777 ?auto_2327791 ) ) ( not ( = ?auto_2327777 ?auto_2327793 ) ) ( not ( = ?auto_2327781 ?auto_2327783 ) ) ( not ( = ?auto_2327781 ?auto_2327782 ) ) ( not ( = ?auto_2327781 ?auto_2327784 ) ) ( not ( = ?auto_2327781 ?auto_2327785 ) ) ( not ( = ?auto_2327781 ?auto_2327786 ) ) ( not ( = ?auto_2327781 ?auto_2327787 ) ) ( not ( = ?auto_2327781 ?auto_2327788 ) ) ( not ( = ?auto_2327781 ?auto_2327789 ) ) ( not ( = ?auto_2327781 ?auto_2327790 ) ) ( not ( = ?auto_2327781 ?auto_2327791 ) ) ( not ( = ?auto_2327781 ?auto_2327793 ) ) ( not ( = ?auto_2327783 ?auto_2327782 ) ) ( not ( = ?auto_2327783 ?auto_2327784 ) ) ( not ( = ?auto_2327783 ?auto_2327785 ) ) ( not ( = ?auto_2327783 ?auto_2327786 ) ) ( not ( = ?auto_2327783 ?auto_2327787 ) ) ( not ( = ?auto_2327783 ?auto_2327788 ) ) ( not ( = ?auto_2327783 ?auto_2327789 ) ) ( not ( = ?auto_2327783 ?auto_2327790 ) ) ( not ( = ?auto_2327783 ?auto_2327791 ) ) ( not ( = ?auto_2327783 ?auto_2327793 ) ) ( not ( = ?auto_2327782 ?auto_2327784 ) ) ( not ( = ?auto_2327782 ?auto_2327785 ) ) ( not ( = ?auto_2327782 ?auto_2327786 ) ) ( not ( = ?auto_2327782 ?auto_2327787 ) ) ( not ( = ?auto_2327782 ?auto_2327788 ) ) ( not ( = ?auto_2327782 ?auto_2327789 ) ) ( not ( = ?auto_2327782 ?auto_2327790 ) ) ( not ( = ?auto_2327782 ?auto_2327791 ) ) ( not ( = ?auto_2327782 ?auto_2327793 ) ) ( not ( = ?auto_2327784 ?auto_2327785 ) ) ( not ( = ?auto_2327784 ?auto_2327786 ) ) ( not ( = ?auto_2327784 ?auto_2327787 ) ) ( not ( = ?auto_2327784 ?auto_2327788 ) ) ( not ( = ?auto_2327784 ?auto_2327789 ) ) ( not ( = ?auto_2327784 ?auto_2327790 ) ) ( not ( = ?auto_2327784 ?auto_2327791 ) ) ( not ( = ?auto_2327784 ?auto_2327793 ) ) ( not ( = ?auto_2327785 ?auto_2327786 ) ) ( not ( = ?auto_2327785 ?auto_2327787 ) ) ( not ( = ?auto_2327785 ?auto_2327788 ) ) ( not ( = ?auto_2327785 ?auto_2327789 ) ) ( not ( = ?auto_2327785 ?auto_2327790 ) ) ( not ( = ?auto_2327785 ?auto_2327791 ) ) ( not ( = ?auto_2327785 ?auto_2327793 ) ) ( not ( = ?auto_2327786 ?auto_2327787 ) ) ( not ( = ?auto_2327786 ?auto_2327788 ) ) ( not ( = ?auto_2327786 ?auto_2327789 ) ) ( not ( = ?auto_2327786 ?auto_2327790 ) ) ( not ( = ?auto_2327786 ?auto_2327791 ) ) ( not ( = ?auto_2327786 ?auto_2327793 ) ) ( not ( = ?auto_2327787 ?auto_2327788 ) ) ( not ( = ?auto_2327787 ?auto_2327789 ) ) ( not ( = ?auto_2327787 ?auto_2327790 ) ) ( not ( = ?auto_2327787 ?auto_2327791 ) ) ( not ( = ?auto_2327787 ?auto_2327793 ) ) ( not ( = ?auto_2327788 ?auto_2327789 ) ) ( not ( = ?auto_2327788 ?auto_2327790 ) ) ( not ( = ?auto_2327788 ?auto_2327791 ) ) ( not ( = ?auto_2327788 ?auto_2327793 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2327789 ?auto_2327790 ?auto_2327791 )
      ( MAKE-14CRATE-VERIFY ?auto_2327778 ?auto_2327779 ?auto_2327780 ?auto_2327777 ?auto_2327781 ?auto_2327783 ?auto_2327782 ?auto_2327784 ?auto_2327785 ?auto_2327786 ?auto_2327787 ?auto_2327788 ?auto_2327789 ?auto_2327790 ?auto_2327791 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_2327982 - SURFACE
      ?auto_2327983 - SURFACE
      ?auto_2327984 - SURFACE
      ?auto_2327981 - SURFACE
      ?auto_2327985 - SURFACE
      ?auto_2327987 - SURFACE
      ?auto_2327986 - SURFACE
      ?auto_2327988 - SURFACE
      ?auto_2327989 - SURFACE
      ?auto_2327990 - SURFACE
      ?auto_2327991 - SURFACE
      ?auto_2327992 - SURFACE
      ?auto_2327993 - SURFACE
      ?auto_2327994 - SURFACE
      ?auto_2327995 - SURFACE
    )
    :vars
    (
      ?auto_2327996 - HOIST
      ?auto_2328001 - PLACE
      ?auto_2327997 - PLACE
      ?auto_2327999 - HOIST
      ?auto_2328000 - SURFACE
      ?auto_2327998 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2327996 ?auto_2328001 ) ( IS-CRATE ?auto_2327995 ) ( not ( = ?auto_2327994 ?auto_2327995 ) ) ( not ( = ?auto_2327993 ?auto_2327994 ) ) ( not ( = ?auto_2327993 ?auto_2327995 ) ) ( not ( = ?auto_2327997 ?auto_2328001 ) ) ( HOIST-AT ?auto_2327999 ?auto_2327997 ) ( not ( = ?auto_2327996 ?auto_2327999 ) ) ( AVAILABLE ?auto_2327999 ) ( SURFACE-AT ?auto_2327995 ?auto_2327997 ) ( ON ?auto_2327995 ?auto_2328000 ) ( CLEAR ?auto_2327995 ) ( not ( = ?auto_2327994 ?auto_2328000 ) ) ( not ( = ?auto_2327995 ?auto_2328000 ) ) ( not ( = ?auto_2327993 ?auto_2328000 ) ) ( TRUCK-AT ?auto_2327998 ?auto_2328001 ) ( SURFACE-AT ?auto_2327993 ?auto_2328001 ) ( CLEAR ?auto_2327993 ) ( LIFTING ?auto_2327996 ?auto_2327994 ) ( IS-CRATE ?auto_2327994 ) ( ON ?auto_2327983 ?auto_2327982 ) ( ON ?auto_2327984 ?auto_2327983 ) ( ON ?auto_2327981 ?auto_2327984 ) ( ON ?auto_2327985 ?auto_2327981 ) ( ON ?auto_2327987 ?auto_2327985 ) ( ON ?auto_2327986 ?auto_2327987 ) ( ON ?auto_2327988 ?auto_2327986 ) ( ON ?auto_2327989 ?auto_2327988 ) ( ON ?auto_2327990 ?auto_2327989 ) ( ON ?auto_2327991 ?auto_2327990 ) ( ON ?auto_2327992 ?auto_2327991 ) ( ON ?auto_2327993 ?auto_2327992 ) ( not ( = ?auto_2327982 ?auto_2327983 ) ) ( not ( = ?auto_2327982 ?auto_2327984 ) ) ( not ( = ?auto_2327982 ?auto_2327981 ) ) ( not ( = ?auto_2327982 ?auto_2327985 ) ) ( not ( = ?auto_2327982 ?auto_2327987 ) ) ( not ( = ?auto_2327982 ?auto_2327986 ) ) ( not ( = ?auto_2327982 ?auto_2327988 ) ) ( not ( = ?auto_2327982 ?auto_2327989 ) ) ( not ( = ?auto_2327982 ?auto_2327990 ) ) ( not ( = ?auto_2327982 ?auto_2327991 ) ) ( not ( = ?auto_2327982 ?auto_2327992 ) ) ( not ( = ?auto_2327982 ?auto_2327993 ) ) ( not ( = ?auto_2327982 ?auto_2327994 ) ) ( not ( = ?auto_2327982 ?auto_2327995 ) ) ( not ( = ?auto_2327982 ?auto_2328000 ) ) ( not ( = ?auto_2327983 ?auto_2327984 ) ) ( not ( = ?auto_2327983 ?auto_2327981 ) ) ( not ( = ?auto_2327983 ?auto_2327985 ) ) ( not ( = ?auto_2327983 ?auto_2327987 ) ) ( not ( = ?auto_2327983 ?auto_2327986 ) ) ( not ( = ?auto_2327983 ?auto_2327988 ) ) ( not ( = ?auto_2327983 ?auto_2327989 ) ) ( not ( = ?auto_2327983 ?auto_2327990 ) ) ( not ( = ?auto_2327983 ?auto_2327991 ) ) ( not ( = ?auto_2327983 ?auto_2327992 ) ) ( not ( = ?auto_2327983 ?auto_2327993 ) ) ( not ( = ?auto_2327983 ?auto_2327994 ) ) ( not ( = ?auto_2327983 ?auto_2327995 ) ) ( not ( = ?auto_2327983 ?auto_2328000 ) ) ( not ( = ?auto_2327984 ?auto_2327981 ) ) ( not ( = ?auto_2327984 ?auto_2327985 ) ) ( not ( = ?auto_2327984 ?auto_2327987 ) ) ( not ( = ?auto_2327984 ?auto_2327986 ) ) ( not ( = ?auto_2327984 ?auto_2327988 ) ) ( not ( = ?auto_2327984 ?auto_2327989 ) ) ( not ( = ?auto_2327984 ?auto_2327990 ) ) ( not ( = ?auto_2327984 ?auto_2327991 ) ) ( not ( = ?auto_2327984 ?auto_2327992 ) ) ( not ( = ?auto_2327984 ?auto_2327993 ) ) ( not ( = ?auto_2327984 ?auto_2327994 ) ) ( not ( = ?auto_2327984 ?auto_2327995 ) ) ( not ( = ?auto_2327984 ?auto_2328000 ) ) ( not ( = ?auto_2327981 ?auto_2327985 ) ) ( not ( = ?auto_2327981 ?auto_2327987 ) ) ( not ( = ?auto_2327981 ?auto_2327986 ) ) ( not ( = ?auto_2327981 ?auto_2327988 ) ) ( not ( = ?auto_2327981 ?auto_2327989 ) ) ( not ( = ?auto_2327981 ?auto_2327990 ) ) ( not ( = ?auto_2327981 ?auto_2327991 ) ) ( not ( = ?auto_2327981 ?auto_2327992 ) ) ( not ( = ?auto_2327981 ?auto_2327993 ) ) ( not ( = ?auto_2327981 ?auto_2327994 ) ) ( not ( = ?auto_2327981 ?auto_2327995 ) ) ( not ( = ?auto_2327981 ?auto_2328000 ) ) ( not ( = ?auto_2327985 ?auto_2327987 ) ) ( not ( = ?auto_2327985 ?auto_2327986 ) ) ( not ( = ?auto_2327985 ?auto_2327988 ) ) ( not ( = ?auto_2327985 ?auto_2327989 ) ) ( not ( = ?auto_2327985 ?auto_2327990 ) ) ( not ( = ?auto_2327985 ?auto_2327991 ) ) ( not ( = ?auto_2327985 ?auto_2327992 ) ) ( not ( = ?auto_2327985 ?auto_2327993 ) ) ( not ( = ?auto_2327985 ?auto_2327994 ) ) ( not ( = ?auto_2327985 ?auto_2327995 ) ) ( not ( = ?auto_2327985 ?auto_2328000 ) ) ( not ( = ?auto_2327987 ?auto_2327986 ) ) ( not ( = ?auto_2327987 ?auto_2327988 ) ) ( not ( = ?auto_2327987 ?auto_2327989 ) ) ( not ( = ?auto_2327987 ?auto_2327990 ) ) ( not ( = ?auto_2327987 ?auto_2327991 ) ) ( not ( = ?auto_2327987 ?auto_2327992 ) ) ( not ( = ?auto_2327987 ?auto_2327993 ) ) ( not ( = ?auto_2327987 ?auto_2327994 ) ) ( not ( = ?auto_2327987 ?auto_2327995 ) ) ( not ( = ?auto_2327987 ?auto_2328000 ) ) ( not ( = ?auto_2327986 ?auto_2327988 ) ) ( not ( = ?auto_2327986 ?auto_2327989 ) ) ( not ( = ?auto_2327986 ?auto_2327990 ) ) ( not ( = ?auto_2327986 ?auto_2327991 ) ) ( not ( = ?auto_2327986 ?auto_2327992 ) ) ( not ( = ?auto_2327986 ?auto_2327993 ) ) ( not ( = ?auto_2327986 ?auto_2327994 ) ) ( not ( = ?auto_2327986 ?auto_2327995 ) ) ( not ( = ?auto_2327986 ?auto_2328000 ) ) ( not ( = ?auto_2327988 ?auto_2327989 ) ) ( not ( = ?auto_2327988 ?auto_2327990 ) ) ( not ( = ?auto_2327988 ?auto_2327991 ) ) ( not ( = ?auto_2327988 ?auto_2327992 ) ) ( not ( = ?auto_2327988 ?auto_2327993 ) ) ( not ( = ?auto_2327988 ?auto_2327994 ) ) ( not ( = ?auto_2327988 ?auto_2327995 ) ) ( not ( = ?auto_2327988 ?auto_2328000 ) ) ( not ( = ?auto_2327989 ?auto_2327990 ) ) ( not ( = ?auto_2327989 ?auto_2327991 ) ) ( not ( = ?auto_2327989 ?auto_2327992 ) ) ( not ( = ?auto_2327989 ?auto_2327993 ) ) ( not ( = ?auto_2327989 ?auto_2327994 ) ) ( not ( = ?auto_2327989 ?auto_2327995 ) ) ( not ( = ?auto_2327989 ?auto_2328000 ) ) ( not ( = ?auto_2327990 ?auto_2327991 ) ) ( not ( = ?auto_2327990 ?auto_2327992 ) ) ( not ( = ?auto_2327990 ?auto_2327993 ) ) ( not ( = ?auto_2327990 ?auto_2327994 ) ) ( not ( = ?auto_2327990 ?auto_2327995 ) ) ( not ( = ?auto_2327990 ?auto_2328000 ) ) ( not ( = ?auto_2327991 ?auto_2327992 ) ) ( not ( = ?auto_2327991 ?auto_2327993 ) ) ( not ( = ?auto_2327991 ?auto_2327994 ) ) ( not ( = ?auto_2327991 ?auto_2327995 ) ) ( not ( = ?auto_2327991 ?auto_2328000 ) ) ( not ( = ?auto_2327992 ?auto_2327993 ) ) ( not ( = ?auto_2327992 ?auto_2327994 ) ) ( not ( = ?auto_2327992 ?auto_2327995 ) ) ( not ( = ?auto_2327992 ?auto_2328000 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2327993 ?auto_2327994 ?auto_2327995 )
      ( MAKE-14CRATE-VERIFY ?auto_2327982 ?auto_2327983 ?auto_2327984 ?auto_2327981 ?auto_2327985 ?auto_2327987 ?auto_2327986 ?auto_2327988 ?auto_2327989 ?auto_2327990 ?auto_2327991 ?auto_2327992 ?auto_2327993 ?auto_2327994 ?auto_2327995 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_2328186 - SURFACE
      ?auto_2328187 - SURFACE
      ?auto_2328188 - SURFACE
      ?auto_2328185 - SURFACE
      ?auto_2328189 - SURFACE
      ?auto_2328191 - SURFACE
      ?auto_2328190 - SURFACE
      ?auto_2328192 - SURFACE
      ?auto_2328193 - SURFACE
      ?auto_2328194 - SURFACE
      ?auto_2328195 - SURFACE
      ?auto_2328196 - SURFACE
      ?auto_2328197 - SURFACE
      ?auto_2328198 - SURFACE
      ?auto_2328199 - SURFACE
    )
    :vars
    (
      ?auto_2328203 - HOIST
      ?auto_2328205 - PLACE
      ?auto_2328201 - PLACE
      ?auto_2328200 - HOIST
      ?auto_2328202 - SURFACE
      ?auto_2328204 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2328203 ?auto_2328205 ) ( IS-CRATE ?auto_2328199 ) ( not ( = ?auto_2328198 ?auto_2328199 ) ) ( not ( = ?auto_2328197 ?auto_2328198 ) ) ( not ( = ?auto_2328197 ?auto_2328199 ) ) ( not ( = ?auto_2328201 ?auto_2328205 ) ) ( HOIST-AT ?auto_2328200 ?auto_2328201 ) ( not ( = ?auto_2328203 ?auto_2328200 ) ) ( AVAILABLE ?auto_2328200 ) ( SURFACE-AT ?auto_2328199 ?auto_2328201 ) ( ON ?auto_2328199 ?auto_2328202 ) ( CLEAR ?auto_2328199 ) ( not ( = ?auto_2328198 ?auto_2328202 ) ) ( not ( = ?auto_2328199 ?auto_2328202 ) ) ( not ( = ?auto_2328197 ?auto_2328202 ) ) ( TRUCK-AT ?auto_2328204 ?auto_2328205 ) ( SURFACE-AT ?auto_2328197 ?auto_2328205 ) ( CLEAR ?auto_2328197 ) ( IS-CRATE ?auto_2328198 ) ( AVAILABLE ?auto_2328203 ) ( IN ?auto_2328198 ?auto_2328204 ) ( ON ?auto_2328187 ?auto_2328186 ) ( ON ?auto_2328188 ?auto_2328187 ) ( ON ?auto_2328185 ?auto_2328188 ) ( ON ?auto_2328189 ?auto_2328185 ) ( ON ?auto_2328191 ?auto_2328189 ) ( ON ?auto_2328190 ?auto_2328191 ) ( ON ?auto_2328192 ?auto_2328190 ) ( ON ?auto_2328193 ?auto_2328192 ) ( ON ?auto_2328194 ?auto_2328193 ) ( ON ?auto_2328195 ?auto_2328194 ) ( ON ?auto_2328196 ?auto_2328195 ) ( ON ?auto_2328197 ?auto_2328196 ) ( not ( = ?auto_2328186 ?auto_2328187 ) ) ( not ( = ?auto_2328186 ?auto_2328188 ) ) ( not ( = ?auto_2328186 ?auto_2328185 ) ) ( not ( = ?auto_2328186 ?auto_2328189 ) ) ( not ( = ?auto_2328186 ?auto_2328191 ) ) ( not ( = ?auto_2328186 ?auto_2328190 ) ) ( not ( = ?auto_2328186 ?auto_2328192 ) ) ( not ( = ?auto_2328186 ?auto_2328193 ) ) ( not ( = ?auto_2328186 ?auto_2328194 ) ) ( not ( = ?auto_2328186 ?auto_2328195 ) ) ( not ( = ?auto_2328186 ?auto_2328196 ) ) ( not ( = ?auto_2328186 ?auto_2328197 ) ) ( not ( = ?auto_2328186 ?auto_2328198 ) ) ( not ( = ?auto_2328186 ?auto_2328199 ) ) ( not ( = ?auto_2328186 ?auto_2328202 ) ) ( not ( = ?auto_2328187 ?auto_2328188 ) ) ( not ( = ?auto_2328187 ?auto_2328185 ) ) ( not ( = ?auto_2328187 ?auto_2328189 ) ) ( not ( = ?auto_2328187 ?auto_2328191 ) ) ( not ( = ?auto_2328187 ?auto_2328190 ) ) ( not ( = ?auto_2328187 ?auto_2328192 ) ) ( not ( = ?auto_2328187 ?auto_2328193 ) ) ( not ( = ?auto_2328187 ?auto_2328194 ) ) ( not ( = ?auto_2328187 ?auto_2328195 ) ) ( not ( = ?auto_2328187 ?auto_2328196 ) ) ( not ( = ?auto_2328187 ?auto_2328197 ) ) ( not ( = ?auto_2328187 ?auto_2328198 ) ) ( not ( = ?auto_2328187 ?auto_2328199 ) ) ( not ( = ?auto_2328187 ?auto_2328202 ) ) ( not ( = ?auto_2328188 ?auto_2328185 ) ) ( not ( = ?auto_2328188 ?auto_2328189 ) ) ( not ( = ?auto_2328188 ?auto_2328191 ) ) ( not ( = ?auto_2328188 ?auto_2328190 ) ) ( not ( = ?auto_2328188 ?auto_2328192 ) ) ( not ( = ?auto_2328188 ?auto_2328193 ) ) ( not ( = ?auto_2328188 ?auto_2328194 ) ) ( not ( = ?auto_2328188 ?auto_2328195 ) ) ( not ( = ?auto_2328188 ?auto_2328196 ) ) ( not ( = ?auto_2328188 ?auto_2328197 ) ) ( not ( = ?auto_2328188 ?auto_2328198 ) ) ( not ( = ?auto_2328188 ?auto_2328199 ) ) ( not ( = ?auto_2328188 ?auto_2328202 ) ) ( not ( = ?auto_2328185 ?auto_2328189 ) ) ( not ( = ?auto_2328185 ?auto_2328191 ) ) ( not ( = ?auto_2328185 ?auto_2328190 ) ) ( not ( = ?auto_2328185 ?auto_2328192 ) ) ( not ( = ?auto_2328185 ?auto_2328193 ) ) ( not ( = ?auto_2328185 ?auto_2328194 ) ) ( not ( = ?auto_2328185 ?auto_2328195 ) ) ( not ( = ?auto_2328185 ?auto_2328196 ) ) ( not ( = ?auto_2328185 ?auto_2328197 ) ) ( not ( = ?auto_2328185 ?auto_2328198 ) ) ( not ( = ?auto_2328185 ?auto_2328199 ) ) ( not ( = ?auto_2328185 ?auto_2328202 ) ) ( not ( = ?auto_2328189 ?auto_2328191 ) ) ( not ( = ?auto_2328189 ?auto_2328190 ) ) ( not ( = ?auto_2328189 ?auto_2328192 ) ) ( not ( = ?auto_2328189 ?auto_2328193 ) ) ( not ( = ?auto_2328189 ?auto_2328194 ) ) ( not ( = ?auto_2328189 ?auto_2328195 ) ) ( not ( = ?auto_2328189 ?auto_2328196 ) ) ( not ( = ?auto_2328189 ?auto_2328197 ) ) ( not ( = ?auto_2328189 ?auto_2328198 ) ) ( not ( = ?auto_2328189 ?auto_2328199 ) ) ( not ( = ?auto_2328189 ?auto_2328202 ) ) ( not ( = ?auto_2328191 ?auto_2328190 ) ) ( not ( = ?auto_2328191 ?auto_2328192 ) ) ( not ( = ?auto_2328191 ?auto_2328193 ) ) ( not ( = ?auto_2328191 ?auto_2328194 ) ) ( not ( = ?auto_2328191 ?auto_2328195 ) ) ( not ( = ?auto_2328191 ?auto_2328196 ) ) ( not ( = ?auto_2328191 ?auto_2328197 ) ) ( not ( = ?auto_2328191 ?auto_2328198 ) ) ( not ( = ?auto_2328191 ?auto_2328199 ) ) ( not ( = ?auto_2328191 ?auto_2328202 ) ) ( not ( = ?auto_2328190 ?auto_2328192 ) ) ( not ( = ?auto_2328190 ?auto_2328193 ) ) ( not ( = ?auto_2328190 ?auto_2328194 ) ) ( not ( = ?auto_2328190 ?auto_2328195 ) ) ( not ( = ?auto_2328190 ?auto_2328196 ) ) ( not ( = ?auto_2328190 ?auto_2328197 ) ) ( not ( = ?auto_2328190 ?auto_2328198 ) ) ( not ( = ?auto_2328190 ?auto_2328199 ) ) ( not ( = ?auto_2328190 ?auto_2328202 ) ) ( not ( = ?auto_2328192 ?auto_2328193 ) ) ( not ( = ?auto_2328192 ?auto_2328194 ) ) ( not ( = ?auto_2328192 ?auto_2328195 ) ) ( not ( = ?auto_2328192 ?auto_2328196 ) ) ( not ( = ?auto_2328192 ?auto_2328197 ) ) ( not ( = ?auto_2328192 ?auto_2328198 ) ) ( not ( = ?auto_2328192 ?auto_2328199 ) ) ( not ( = ?auto_2328192 ?auto_2328202 ) ) ( not ( = ?auto_2328193 ?auto_2328194 ) ) ( not ( = ?auto_2328193 ?auto_2328195 ) ) ( not ( = ?auto_2328193 ?auto_2328196 ) ) ( not ( = ?auto_2328193 ?auto_2328197 ) ) ( not ( = ?auto_2328193 ?auto_2328198 ) ) ( not ( = ?auto_2328193 ?auto_2328199 ) ) ( not ( = ?auto_2328193 ?auto_2328202 ) ) ( not ( = ?auto_2328194 ?auto_2328195 ) ) ( not ( = ?auto_2328194 ?auto_2328196 ) ) ( not ( = ?auto_2328194 ?auto_2328197 ) ) ( not ( = ?auto_2328194 ?auto_2328198 ) ) ( not ( = ?auto_2328194 ?auto_2328199 ) ) ( not ( = ?auto_2328194 ?auto_2328202 ) ) ( not ( = ?auto_2328195 ?auto_2328196 ) ) ( not ( = ?auto_2328195 ?auto_2328197 ) ) ( not ( = ?auto_2328195 ?auto_2328198 ) ) ( not ( = ?auto_2328195 ?auto_2328199 ) ) ( not ( = ?auto_2328195 ?auto_2328202 ) ) ( not ( = ?auto_2328196 ?auto_2328197 ) ) ( not ( = ?auto_2328196 ?auto_2328198 ) ) ( not ( = ?auto_2328196 ?auto_2328199 ) ) ( not ( = ?auto_2328196 ?auto_2328202 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2328197 ?auto_2328198 ?auto_2328199 )
      ( MAKE-14CRATE-VERIFY ?auto_2328186 ?auto_2328187 ?auto_2328188 ?auto_2328185 ?auto_2328189 ?auto_2328191 ?auto_2328190 ?auto_2328192 ?auto_2328193 ?auto_2328194 ?auto_2328195 ?auto_2328196 ?auto_2328197 ?auto_2328198 ?auto_2328199 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2345378 - SURFACE
      ?auto_2345379 - SURFACE
      ?auto_2345380 - SURFACE
      ?auto_2345377 - SURFACE
      ?auto_2345381 - SURFACE
      ?auto_2345383 - SURFACE
      ?auto_2345382 - SURFACE
      ?auto_2345384 - SURFACE
      ?auto_2345385 - SURFACE
      ?auto_2345386 - SURFACE
      ?auto_2345387 - SURFACE
      ?auto_2345388 - SURFACE
      ?auto_2345389 - SURFACE
      ?auto_2345390 - SURFACE
      ?auto_2345391 - SURFACE
      ?auto_2345392 - SURFACE
    )
    :vars
    (
      ?auto_2345394 - HOIST
      ?auto_2345393 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2345394 ?auto_2345393 ) ( SURFACE-AT ?auto_2345391 ?auto_2345393 ) ( CLEAR ?auto_2345391 ) ( LIFTING ?auto_2345394 ?auto_2345392 ) ( IS-CRATE ?auto_2345392 ) ( not ( = ?auto_2345391 ?auto_2345392 ) ) ( ON ?auto_2345379 ?auto_2345378 ) ( ON ?auto_2345380 ?auto_2345379 ) ( ON ?auto_2345377 ?auto_2345380 ) ( ON ?auto_2345381 ?auto_2345377 ) ( ON ?auto_2345383 ?auto_2345381 ) ( ON ?auto_2345382 ?auto_2345383 ) ( ON ?auto_2345384 ?auto_2345382 ) ( ON ?auto_2345385 ?auto_2345384 ) ( ON ?auto_2345386 ?auto_2345385 ) ( ON ?auto_2345387 ?auto_2345386 ) ( ON ?auto_2345388 ?auto_2345387 ) ( ON ?auto_2345389 ?auto_2345388 ) ( ON ?auto_2345390 ?auto_2345389 ) ( ON ?auto_2345391 ?auto_2345390 ) ( not ( = ?auto_2345378 ?auto_2345379 ) ) ( not ( = ?auto_2345378 ?auto_2345380 ) ) ( not ( = ?auto_2345378 ?auto_2345377 ) ) ( not ( = ?auto_2345378 ?auto_2345381 ) ) ( not ( = ?auto_2345378 ?auto_2345383 ) ) ( not ( = ?auto_2345378 ?auto_2345382 ) ) ( not ( = ?auto_2345378 ?auto_2345384 ) ) ( not ( = ?auto_2345378 ?auto_2345385 ) ) ( not ( = ?auto_2345378 ?auto_2345386 ) ) ( not ( = ?auto_2345378 ?auto_2345387 ) ) ( not ( = ?auto_2345378 ?auto_2345388 ) ) ( not ( = ?auto_2345378 ?auto_2345389 ) ) ( not ( = ?auto_2345378 ?auto_2345390 ) ) ( not ( = ?auto_2345378 ?auto_2345391 ) ) ( not ( = ?auto_2345378 ?auto_2345392 ) ) ( not ( = ?auto_2345379 ?auto_2345380 ) ) ( not ( = ?auto_2345379 ?auto_2345377 ) ) ( not ( = ?auto_2345379 ?auto_2345381 ) ) ( not ( = ?auto_2345379 ?auto_2345383 ) ) ( not ( = ?auto_2345379 ?auto_2345382 ) ) ( not ( = ?auto_2345379 ?auto_2345384 ) ) ( not ( = ?auto_2345379 ?auto_2345385 ) ) ( not ( = ?auto_2345379 ?auto_2345386 ) ) ( not ( = ?auto_2345379 ?auto_2345387 ) ) ( not ( = ?auto_2345379 ?auto_2345388 ) ) ( not ( = ?auto_2345379 ?auto_2345389 ) ) ( not ( = ?auto_2345379 ?auto_2345390 ) ) ( not ( = ?auto_2345379 ?auto_2345391 ) ) ( not ( = ?auto_2345379 ?auto_2345392 ) ) ( not ( = ?auto_2345380 ?auto_2345377 ) ) ( not ( = ?auto_2345380 ?auto_2345381 ) ) ( not ( = ?auto_2345380 ?auto_2345383 ) ) ( not ( = ?auto_2345380 ?auto_2345382 ) ) ( not ( = ?auto_2345380 ?auto_2345384 ) ) ( not ( = ?auto_2345380 ?auto_2345385 ) ) ( not ( = ?auto_2345380 ?auto_2345386 ) ) ( not ( = ?auto_2345380 ?auto_2345387 ) ) ( not ( = ?auto_2345380 ?auto_2345388 ) ) ( not ( = ?auto_2345380 ?auto_2345389 ) ) ( not ( = ?auto_2345380 ?auto_2345390 ) ) ( not ( = ?auto_2345380 ?auto_2345391 ) ) ( not ( = ?auto_2345380 ?auto_2345392 ) ) ( not ( = ?auto_2345377 ?auto_2345381 ) ) ( not ( = ?auto_2345377 ?auto_2345383 ) ) ( not ( = ?auto_2345377 ?auto_2345382 ) ) ( not ( = ?auto_2345377 ?auto_2345384 ) ) ( not ( = ?auto_2345377 ?auto_2345385 ) ) ( not ( = ?auto_2345377 ?auto_2345386 ) ) ( not ( = ?auto_2345377 ?auto_2345387 ) ) ( not ( = ?auto_2345377 ?auto_2345388 ) ) ( not ( = ?auto_2345377 ?auto_2345389 ) ) ( not ( = ?auto_2345377 ?auto_2345390 ) ) ( not ( = ?auto_2345377 ?auto_2345391 ) ) ( not ( = ?auto_2345377 ?auto_2345392 ) ) ( not ( = ?auto_2345381 ?auto_2345383 ) ) ( not ( = ?auto_2345381 ?auto_2345382 ) ) ( not ( = ?auto_2345381 ?auto_2345384 ) ) ( not ( = ?auto_2345381 ?auto_2345385 ) ) ( not ( = ?auto_2345381 ?auto_2345386 ) ) ( not ( = ?auto_2345381 ?auto_2345387 ) ) ( not ( = ?auto_2345381 ?auto_2345388 ) ) ( not ( = ?auto_2345381 ?auto_2345389 ) ) ( not ( = ?auto_2345381 ?auto_2345390 ) ) ( not ( = ?auto_2345381 ?auto_2345391 ) ) ( not ( = ?auto_2345381 ?auto_2345392 ) ) ( not ( = ?auto_2345383 ?auto_2345382 ) ) ( not ( = ?auto_2345383 ?auto_2345384 ) ) ( not ( = ?auto_2345383 ?auto_2345385 ) ) ( not ( = ?auto_2345383 ?auto_2345386 ) ) ( not ( = ?auto_2345383 ?auto_2345387 ) ) ( not ( = ?auto_2345383 ?auto_2345388 ) ) ( not ( = ?auto_2345383 ?auto_2345389 ) ) ( not ( = ?auto_2345383 ?auto_2345390 ) ) ( not ( = ?auto_2345383 ?auto_2345391 ) ) ( not ( = ?auto_2345383 ?auto_2345392 ) ) ( not ( = ?auto_2345382 ?auto_2345384 ) ) ( not ( = ?auto_2345382 ?auto_2345385 ) ) ( not ( = ?auto_2345382 ?auto_2345386 ) ) ( not ( = ?auto_2345382 ?auto_2345387 ) ) ( not ( = ?auto_2345382 ?auto_2345388 ) ) ( not ( = ?auto_2345382 ?auto_2345389 ) ) ( not ( = ?auto_2345382 ?auto_2345390 ) ) ( not ( = ?auto_2345382 ?auto_2345391 ) ) ( not ( = ?auto_2345382 ?auto_2345392 ) ) ( not ( = ?auto_2345384 ?auto_2345385 ) ) ( not ( = ?auto_2345384 ?auto_2345386 ) ) ( not ( = ?auto_2345384 ?auto_2345387 ) ) ( not ( = ?auto_2345384 ?auto_2345388 ) ) ( not ( = ?auto_2345384 ?auto_2345389 ) ) ( not ( = ?auto_2345384 ?auto_2345390 ) ) ( not ( = ?auto_2345384 ?auto_2345391 ) ) ( not ( = ?auto_2345384 ?auto_2345392 ) ) ( not ( = ?auto_2345385 ?auto_2345386 ) ) ( not ( = ?auto_2345385 ?auto_2345387 ) ) ( not ( = ?auto_2345385 ?auto_2345388 ) ) ( not ( = ?auto_2345385 ?auto_2345389 ) ) ( not ( = ?auto_2345385 ?auto_2345390 ) ) ( not ( = ?auto_2345385 ?auto_2345391 ) ) ( not ( = ?auto_2345385 ?auto_2345392 ) ) ( not ( = ?auto_2345386 ?auto_2345387 ) ) ( not ( = ?auto_2345386 ?auto_2345388 ) ) ( not ( = ?auto_2345386 ?auto_2345389 ) ) ( not ( = ?auto_2345386 ?auto_2345390 ) ) ( not ( = ?auto_2345386 ?auto_2345391 ) ) ( not ( = ?auto_2345386 ?auto_2345392 ) ) ( not ( = ?auto_2345387 ?auto_2345388 ) ) ( not ( = ?auto_2345387 ?auto_2345389 ) ) ( not ( = ?auto_2345387 ?auto_2345390 ) ) ( not ( = ?auto_2345387 ?auto_2345391 ) ) ( not ( = ?auto_2345387 ?auto_2345392 ) ) ( not ( = ?auto_2345388 ?auto_2345389 ) ) ( not ( = ?auto_2345388 ?auto_2345390 ) ) ( not ( = ?auto_2345388 ?auto_2345391 ) ) ( not ( = ?auto_2345388 ?auto_2345392 ) ) ( not ( = ?auto_2345389 ?auto_2345390 ) ) ( not ( = ?auto_2345389 ?auto_2345391 ) ) ( not ( = ?auto_2345389 ?auto_2345392 ) ) ( not ( = ?auto_2345390 ?auto_2345391 ) ) ( not ( = ?auto_2345390 ?auto_2345392 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2345391 ?auto_2345392 )
      ( MAKE-15CRATE-VERIFY ?auto_2345378 ?auto_2345379 ?auto_2345380 ?auto_2345377 ?auto_2345381 ?auto_2345383 ?auto_2345382 ?auto_2345384 ?auto_2345385 ?auto_2345386 ?auto_2345387 ?auto_2345388 ?auto_2345389 ?auto_2345390 ?auto_2345391 ?auto_2345392 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2345557 - SURFACE
      ?auto_2345558 - SURFACE
      ?auto_2345559 - SURFACE
      ?auto_2345556 - SURFACE
      ?auto_2345560 - SURFACE
      ?auto_2345562 - SURFACE
      ?auto_2345561 - SURFACE
      ?auto_2345563 - SURFACE
      ?auto_2345564 - SURFACE
      ?auto_2345565 - SURFACE
      ?auto_2345566 - SURFACE
      ?auto_2345567 - SURFACE
      ?auto_2345568 - SURFACE
      ?auto_2345569 - SURFACE
      ?auto_2345570 - SURFACE
      ?auto_2345571 - SURFACE
    )
    :vars
    (
      ?auto_2345572 - HOIST
      ?auto_2345573 - PLACE
      ?auto_2345574 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2345572 ?auto_2345573 ) ( SURFACE-AT ?auto_2345570 ?auto_2345573 ) ( CLEAR ?auto_2345570 ) ( IS-CRATE ?auto_2345571 ) ( not ( = ?auto_2345570 ?auto_2345571 ) ) ( TRUCK-AT ?auto_2345574 ?auto_2345573 ) ( AVAILABLE ?auto_2345572 ) ( IN ?auto_2345571 ?auto_2345574 ) ( ON ?auto_2345570 ?auto_2345569 ) ( not ( = ?auto_2345569 ?auto_2345570 ) ) ( not ( = ?auto_2345569 ?auto_2345571 ) ) ( ON ?auto_2345558 ?auto_2345557 ) ( ON ?auto_2345559 ?auto_2345558 ) ( ON ?auto_2345556 ?auto_2345559 ) ( ON ?auto_2345560 ?auto_2345556 ) ( ON ?auto_2345562 ?auto_2345560 ) ( ON ?auto_2345561 ?auto_2345562 ) ( ON ?auto_2345563 ?auto_2345561 ) ( ON ?auto_2345564 ?auto_2345563 ) ( ON ?auto_2345565 ?auto_2345564 ) ( ON ?auto_2345566 ?auto_2345565 ) ( ON ?auto_2345567 ?auto_2345566 ) ( ON ?auto_2345568 ?auto_2345567 ) ( ON ?auto_2345569 ?auto_2345568 ) ( not ( = ?auto_2345557 ?auto_2345558 ) ) ( not ( = ?auto_2345557 ?auto_2345559 ) ) ( not ( = ?auto_2345557 ?auto_2345556 ) ) ( not ( = ?auto_2345557 ?auto_2345560 ) ) ( not ( = ?auto_2345557 ?auto_2345562 ) ) ( not ( = ?auto_2345557 ?auto_2345561 ) ) ( not ( = ?auto_2345557 ?auto_2345563 ) ) ( not ( = ?auto_2345557 ?auto_2345564 ) ) ( not ( = ?auto_2345557 ?auto_2345565 ) ) ( not ( = ?auto_2345557 ?auto_2345566 ) ) ( not ( = ?auto_2345557 ?auto_2345567 ) ) ( not ( = ?auto_2345557 ?auto_2345568 ) ) ( not ( = ?auto_2345557 ?auto_2345569 ) ) ( not ( = ?auto_2345557 ?auto_2345570 ) ) ( not ( = ?auto_2345557 ?auto_2345571 ) ) ( not ( = ?auto_2345558 ?auto_2345559 ) ) ( not ( = ?auto_2345558 ?auto_2345556 ) ) ( not ( = ?auto_2345558 ?auto_2345560 ) ) ( not ( = ?auto_2345558 ?auto_2345562 ) ) ( not ( = ?auto_2345558 ?auto_2345561 ) ) ( not ( = ?auto_2345558 ?auto_2345563 ) ) ( not ( = ?auto_2345558 ?auto_2345564 ) ) ( not ( = ?auto_2345558 ?auto_2345565 ) ) ( not ( = ?auto_2345558 ?auto_2345566 ) ) ( not ( = ?auto_2345558 ?auto_2345567 ) ) ( not ( = ?auto_2345558 ?auto_2345568 ) ) ( not ( = ?auto_2345558 ?auto_2345569 ) ) ( not ( = ?auto_2345558 ?auto_2345570 ) ) ( not ( = ?auto_2345558 ?auto_2345571 ) ) ( not ( = ?auto_2345559 ?auto_2345556 ) ) ( not ( = ?auto_2345559 ?auto_2345560 ) ) ( not ( = ?auto_2345559 ?auto_2345562 ) ) ( not ( = ?auto_2345559 ?auto_2345561 ) ) ( not ( = ?auto_2345559 ?auto_2345563 ) ) ( not ( = ?auto_2345559 ?auto_2345564 ) ) ( not ( = ?auto_2345559 ?auto_2345565 ) ) ( not ( = ?auto_2345559 ?auto_2345566 ) ) ( not ( = ?auto_2345559 ?auto_2345567 ) ) ( not ( = ?auto_2345559 ?auto_2345568 ) ) ( not ( = ?auto_2345559 ?auto_2345569 ) ) ( not ( = ?auto_2345559 ?auto_2345570 ) ) ( not ( = ?auto_2345559 ?auto_2345571 ) ) ( not ( = ?auto_2345556 ?auto_2345560 ) ) ( not ( = ?auto_2345556 ?auto_2345562 ) ) ( not ( = ?auto_2345556 ?auto_2345561 ) ) ( not ( = ?auto_2345556 ?auto_2345563 ) ) ( not ( = ?auto_2345556 ?auto_2345564 ) ) ( not ( = ?auto_2345556 ?auto_2345565 ) ) ( not ( = ?auto_2345556 ?auto_2345566 ) ) ( not ( = ?auto_2345556 ?auto_2345567 ) ) ( not ( = ?auto_2345556 ?auto_2345568 ) ) ( not ( = ?auto_2345556 ?auto_2345569 ) ) ( not ( = ?auto_2345556 ?auto_2345570 ) ) ( not ( = ?auto_2345556 ?auto_2345571 ) ) ( not ( = ?auto_2345560 ?auto_2345562 ) ) ( not ( = ?auto_2345560 ?auto_2345561 ) ) ( not ( = ?auto_2345560 ?auto_2345563 ) ) ( not ( = ?auto_2345560 ?auto_2345564 ) ) ( not ( = ?auto_2345560 ?auto_2345565 ) ) ( not ( = ?auto_2345560 ?auto_2345566 ) ) ( not ( = ?auto_2345560 ?auto_2345567 ) ) ( not ( = ?auto_2345560 ?auto_2345568 ) ) ( not ( = ?auto_2345560 ?auto_2345569 ) ) ( not ( = ?auto_2345560 ?auto_2345570 ) ) ( not ( = ?auto_2345560 ?auto_2345571 ) ) ( not ( = ?auto_2345562 ?auto_2345561 ) ) ( not ( = ?auto_2345562 ?auto_2345563 ) ) ( not ( = ?auto_2345562 ?auto_2345564 ) ) ( not ( = ?auto_2345562 ?auto_2345565 ) ) ( not ( = ?auto_2345562 ?auto_2345566 ) ) ( not ( = ?auto_2345562 ?auto_2345567 ) ) ( not ( = ?auto_2345562 ?auto_2345568 ) ) ( not ( = ?auto_2345562 ?auto_2345569 ) ) ( not ( = ?auto_2345562 ?auto_2345570 ) ) ( not ( = ?auto_2345562 ?auto_2345571 ) ) ( not ( = ?auto_2345561 ?auto_2345563 ) ) ( not ( = ?auto_2345561 ?auto_2345564 ) ) ( not ( = ?auto_2345561 ?auto_2345565 ) ) ( not ( = ?auto_2345561 ?auto_2345566 ) ) ( not ( = ?auto_2345561 ?auto_2345567 ) ) ( not ( = ?auto_2345561 ?auto_2345568 ) ) ( not ( = ?auto_2345561 ?auto_2345569 ) ) ( not ( = ?auto_2345561 ?auto_2345570 ) ) ( not ( = ?auto_2345561 ?auto_2345571 ) ) ( not ( = ?auto_2345563 ?auto_2345564 ) ) ( not ( = ?auto_2345563 ?auto_2345565 ) ) ( not ( = ?auto_2345563 ?auto_2345566 ) ) ( not ( = ?auto_2345563 ?auto_2345567 ) ) ( not ( = ?auto_2345563 ?auto_2345568 ) ) ( not ( = ?auto_2345563 ?auto_2345569 ) ) ( not ( = ?auto_2345563 ?auto_2345570 ) ) ( not ( = ?auto_2345563 ?auto_2345571 ) ) ( not ( = ?auto_2345564 ?auto_2345565 ) ) ( not ( = ?auto_2345564 ?auto_2345566 ) ) ( not ( = ?auto_2345564 ?auto_2345567 ) ) ( not ( = ?auto_2345564 ?auto_2345568 ) ) ( not ( = ?auto_2345564 ?auto_2345569 ) ) ( not ( = ?auto_2345564 ?auto_2345570 ) ) ( not ( = ?auto_2345564 ?auto_2345571 ) ) ( not ( = ?auto_2345565 ?auto_2345566 ) ) ( not ( = ?auto_2345565 ?auto_2345567 ) ) ( not ( = ?auto_2345565 ?auto_2345568 ) ) ( not ( = ?auto_2345565 ?auto_2345569 ) ) ( not ( = ?auto_2345565 ?auto_2345570 ) ) ( not ( = ?auto_2345565 ?auto_2345571 ) ) ( not ( = ?auto_2345566 ?auto_2345567 ) ) ( not ( = ?auto_2345566 ?auto_2345568 ) ) ( not ( = ?auto_2345566 ?auto_2345569 ) ) ( not ( = ?auto_2345566 ?auto_2345570 ) ) ( not ( = ?auto_2345566 ?auto_2345571 ) ) ( not ( = ?auto_2345567 ?auto_2345568 ) ) ( not ( = ?auto_2345567 ?auto_2345569 ) ) ( not ( = ?auto_2345567 ?auto_2345570 ) ) ( not ( = ?auto_2345567 ?auto_2345571 ) ) ( not ( = ?auto_2345568 ?auto_2345569 ) ) ( not ( = ?auto_2345568 ?auto_2345570 ) ) ( not ( = ?auto_2345568 ?auto_2345571 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2345569 ?auto_2345570 ?auto_2345571 )
      ( MAKE-15CRATE-VERIFY ?auto_2345557 ?auto_2345558 ?auto_2345559 ?auto_2345556 ?auto_2345560 ?auto_2345562 ?auto_2345561 ?auto_2345563 ?auto_2345564 ?auto_2345565 ?auto_2345566 ?auto_2345567 ?auto_2345568 ?auto_2345569 ?auto_2345570 ?auto_2345571 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2345752 - SURFACE
      ?auto_2345753 - SURFACE
      ?auto_2345754 - SURFACE
      ?auto_2345751 - SURFACE
      ?auto_2345755 - SURFACE
      ?auto_2345757 - SURFACE
      ?auto_2345756 - SURFACE
      ?auto_2345758 - SURFACE
      ?auto_2345759 - SURFACE
      ?auto_2345760 - SURFACE
      ?auto_2345761 - SURFACE
      ?auto_2345762 - SURFACE
      ?auto_2345763 - SURFACE
      ?auto_2345764 - SURFACE
      ?auto_2345765 - SURFACE
      ?auto_2345766 - SURFACE
    )
    :vars
    (
      ?auto_2345769 - HOIST
      ?auto_2345768 - PLACE
      ?auto_2345767 - TRUCK
      ?auto_2345770 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2345769 ?auto_2345768 ) ( SURFACE-AT ?auto_2345765 ?auto_2345768 ) ( CLEAR ?auto_2345765 ) ( IS-CRATE ?auto_2345766 ) ( not ( = ?auto_2345765 ?auto_2345766 ) ) ( AVAILABLE ?auto_2345769 ) ( IN ?auto_2345766 ?auto_2345767 ) ( ON ?auto_2345765 ?auto_2345764 ) ( not ( = ?auto_2345764 ?auto_2345765 ) ) ( not ( = ?auto_2345764 ?auto_2345766 ) ) ( TRUCK-AT ?auto_2345767 ?auto_2345770 ) ( not ( = ?auto_2345770 ?auto_2345768 ) ) ( ON ?auto_2345753 ?auto_2345752 ) ( ON ?auto_2345754 ?auto_2345753 ) ( ON ?auto_2345751 ?auto_2345754 ) ( ON ?auto_2345755 ?auto_2345751 ) ( ON ?auto_2345757 ?auto_2345755 ) ( ON ?auto_2345756 ?auto_2345757 ) ( ON ?auto_2345758 ?auto_2345756 ) ( ON ?auto_2345759 ?auto_2345758 ) ( ON ?auto_2345760 ?auto_2345759 ) ( ON ?auto_2345761 ?auto_2345760 ) ( ON ?auto_2345762 ?auto_2345761 ) ( ON ?auto_2345763 ?auto_2345762 ) ( ON ?auto_2345764 ?auto_2345763 ) ( not ( = ?auto_2345752 ?auto_2345753 ) ) ( not ( = ?auto_2345752 ?auto_2345754 ) ) ( not ( = ?auto_2345752 ?auto_2345751 ) ) ( not ( = ?auto_2345752 ?auto_2345755 ) ) ( not ( = ?auto_2345752 ?auto_2345757 ) ) ( not ( = ?auto_2345752 ?auto_2345756 ) ) ( not ( = ?auto_2345752 ?auto_2345758 ) ) ( not ( = ?auto_2345752 ?auto_2345759 ) ) ( not ( = ?auto_2345752 ?auto_2345760 ) ) ( not ( = ?auto_2345752 ?auto_2345761 ) ) ( not ( = ?auto_2345752 ?auto_2345762 ) ) ( not ( = ?auto_2345752 ?auto_2345763 ) ) ( not ( = ?auto_2345752 ?auto_2345764 ) ) ( not ( = ?auto_2345752 ?auto_2345765 ) ) ( not ( = ?auto_2345752 ?auto_2345766 ) ) ( not ( = ?auto_2345753 ?auto_2345754 ) ) ( not ( = ?auto_2345753 ?auto_2345751 ) ) ( not ( = ?auto_2345753 ?auto_2345755 ) ) ( not ( = ?auto_2345753 ?auto_2345757 ) ) ( not ( = ?auto_2345753 ?auto_2345756 ) ) ( not ( = ?auto_2345753 ?auto_2345758 ) ) ( not ( = ?auto_2345753 ?auto_2345759 ) ) ( not ( = ?auto_2345753 ?auto_2345760 ) ) ( not ( = ?auto_2345753 ?auto_2345761 ) ) ( not ( = ?auto_2345753 ?auto_2345762 ) ) ( not ( = ?auto_2345753 ?auto_2345763 ) ) ( not ( = ?auto_2345753 ?auto_2345764 ) ) ( not ( = ?auto_2345753 ?auto_2345765 ) ) ( not ( = ?auto_2345753 ?auto_2345766 ) ) ( not ( = ?auto_2345754 ?auto_2345751 ) ) ( not ( = ?auto_2345754 ?auto_2345755 ) ) ( not ( = ?auto_2345754 ?auto_2345757 ) ) ( not ( = ?auto_2345754 ?auto_2345756 ) ) ( not ( = ?auto_2345754 ?auto_2345758 ) ) ( not ( = ?auto_2345754 ?auto_2345759 ) ) ( not ( = ?auto_2345754 ?auto_2345760 ) ) ( not ( = ?auto_2345754 ?auto_2345761 ) ) ( not ( = ?auto_2345754 ?auto_2345762 ) ) ( not ( = ?auto_2345754 ?auto_2345763 ) ) ( not ( = ?auto_2345754 ?auto_2345764 ) ) ( not ( = ?auto_2345754 ?auto_2345765 ) ) ( not ( = ?auto_2345754 ?auto_2345766 ) ) ( not ( = ?auto_2345751 ?auto_2345755 ) ) ( not ( = ?auto_2345751 ?auto_2345757 ) ) ( not ( = ?auto_2345751 ?auto_2345756 ) ) ( not ( = ?auto_2345751 ?auto_2345758 ) ) ( not ( = ?auto_2345751 ?auto_2345759 ) ) ( not ( = ?auto_2345751 ?auto_2345760 ) ) ( not ( = ?auto_2345751 ?auto_2345761 ) ) ( not ( = ?auto_2345751 ?auto_2345762 ) ) ( not ( = ?auto_2345751 ?auto_2345763 ) ) ( not ( = ?auto_2345751 ?auto_2345764 ) ) ( not ( = ?auto_2345751 ?auto_2345765 ) ) ( not ( = ?auto_2345751 ?auto_2345766 ) ) ( not ( = ?auto_2345755 ?auto_2345757 ) ) ( not ( = ?auto_2345755 ?auto_2345756 ) ) ( not ( = ?auto_2345755 ?auto_2345758 ) ) ( not ( = ?auto_2345755 ?auto_2345759 ) ) ( not ( = ?auto_2345755 ?auto_2345760 ) ) ( not ( = ?auto_2345755 ?auto_2345761 ) ) ( not ( = ?auto_2345755 ?auto_2345762 ) ) ( not ( = ?auto_2345755 ?auto_2345763 ) ) ( not ( = ?auto_2345755 ?auto_2345764 ) ) ( not ( = ?auto_2345755 ?auto_2345765 ) ) ( not ( = ?auto_2345755 ?auto_2345766 ) ) ( not ( = ?auto_2345757 ?auto_2345756 ) ) ( not ( = ?auto_2345757 ?auto_2345758 ) ) ( not ( = ?auto_2345757 ?auto_2345759 ) ) ( not ( = ?auto_2345757 ?auto_2345760 ) ) ( not ( = ?auto_2345757 ?auto_2345761 ) ) ( not ( = ?auto_2345757 ?auto_2345762 ) ) ( not ( = ?auto_2345757 ?auto_2345763 ) ) ( not ( = ?auto_2345757 ?auto_2345764 ) ) ( not ( = ?auto_2345757 ?auto_2345765 ) ) ( not ( = ?auto_2345757 ?auto_2345766 ) ) ( not ( = ?auto_2345756 ?auto_2345758 ) ) ( not ( = ?auto_2345756 ?auto_2345759 ) ) ( not ( = ?auto_2345756 ?auto_2345760 ) ) ( not ( = ?auto_2345756 ?auto_2345761 ) ) ( not ( = ?auto_2345756 ?auto_2345762 ) ) ( not ( = ?auto_2345756 ?auto_2345763 ) ) ( not ( = ?auto_2345756 ?auto_2345764 ) ) ( not ( = ?auto_2345756 ?auto_2345765 ) ) ( not ( = ?auto_2345756 ?auto_2345766 ) ) ( not ( = ?auto_2345758 ?auto_2345759 ) ) ( not ( = ?auto_2345758 ?auto_2345760 ) ) ( not ( = ?auto_2345758 ?auto_2345761 ) ) ( not ( = ?auto_2345758 ?auto_2345762 ) ) ( not ( = ?auto_2345758 ?auto_2345763 ) ) ( not ( = ?auto_2345758 ?auto_2345764 ) ) ( not ( = ?auto_2345758 ?auto_2345765 ) ) ( not ( = ?auto_2345758 ?auto_2345766 ) ) ( not ( = ?auto_2345759 ?auto_2345760 ) ) ( not ( = ?auto_2345759 ?auto_2345761 ) ) ( not ( = ?auto_2345759 ?auto_2345762 ) ) ( not ( = ?auto_2345759 ?auto_2345763 ) ) ( not ( = ?auto_2345759 ?auto_2345764 ) ) ( not ( = ?auto_2345759 ?auto_2345765 ) ) ( not ( = ?auto_2345759 ?auto_2345766 ) ) ( not ( = ?auto_2345760 ?auto_2345761 ) ) ( not ( = ?auto_2345760 ?auto_2345762 ) ) ( not ( = ?auto_2345760 ?auto_2345763 ) ) ( not ( = ?auto_2345760 ?auto_2345764 ) ) ( not ( = ?auto_2345760 ?auto_2345765 ) ) ( not ( = ?auto_2345760 ?auto_2345766 ) ) ( not ( = ?auto_2345761 ?auto_2345762 ) ) ( not ( = ?auto_2345761 ?auto_2345763 ) ) ( not ( = ?auto_2345761 ?auto_2345764 ) ) ( not ( = ?auto_2345761 ?auto_2345765 ) ) ( not ( = ?auto_2345761 ?auto_2345766 ) ) ( not ( = ?auto_2345762 ?auto_2345763 ) ) ( not ( = ?auto_2345762 ?auto_2345764 ) ) ( not ( = ?auto_2345762 ?auto_2345765 ) ) ( not ( = ?auto_2345762 ?auto_2345766 ) ) ( not ( = ?auto_2345763 ?auto_2345764 ) ) ( not ( = ?auto_2345763 ?auto_2345765 ) ) ( not ( = ?auto_2345763 ?auto_2345766 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2345764 ?auto_2345765 ?auto_2345766 )
      ( MAKE-15CRATE-VERIFY ?auto_2345752 ?auto_2345753 ?auto_2345754 ?auto_2345751 ?auto_2345755 ?auto_2345757 ?auto_2345756 ?auto_2345758 ?auto_2345759 ?auto_2345760 ?auto_2345761 ?auto_2345762 ?auto_2345763 ?auto_2345764 ?auto_2345765 ?auto_2345766 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2345962 - SURFACE
      ?auto_2345963 - SURFACE
      ?auto_2345964 - SURFACE
      ?auto_2345961 - SURFACE
      ?auto_2345965 - SURFACE
      ?auto_2345967 - SURFACE
      ?auto_2345966 - SURFACE
      ?auto_2345968 - SURFACE
      ?auto_2345969 - SURFACE
      ?auto_2345970 - SURFACE
      ?auto_2345971 - SURFACE
      ?auto_2345972 - SURFACE
      ?auto_2345973 - SURFACE
      ?auto_2345974 - SURFACE
      ?auto_2345975 - SURFACE
      ?auto_2345976 - SURFACE
    )
    :vars
    (
      ?auto_2345978 - HOIST
      ?auto_2345980 - PLACE
      ?auto_2345981 - TRUCK
      ?auto_2345979 - PLACE
      ?auto_2345977 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2345978 ?auto_2345980 ) ( SURFACE-AT ?auto_2345975 ?auto_2345980 ) ( CLEAR ?auto_2345975 ) ( IS-CRATE ?auto_2345976 ) ( not ( = ?auto_2345975 ?auto_2345976 ) ) ( AVAILABLE ?auto_2345978 ) ( ON ?auto_2345975 ?auto_2345974 ) ( not ( = ?auto_2345974 ?auto_2345975 ) ) ( not ( = ?auto_2345974 ?auto_2345976 ) ) ( TRUCK-AT ?auto_2345981 ?auto_2345979 ) ( not ( = ?auto_2345979 ?auto_2345980 ) ) ( HOIST-AT ?auto_2345977 ?auto_2345979 ) ( LIFTING ?auto_2345977 ?auto_2345976 ) ( not ( = ?auto_2345978 ?auto_2345977 ) ) ( ON ?auto_2345963 ?auto_2345962 ) ( ON ?auto_2345964 ?auto_2345963 ) ( ON ?auto_2345961 ?auto_2345964 ) ( ON ?auto_2345965 ?auto_2345961 ) ( ON ?auto_2345967 ?auto_2345965 ) ( ON ?auto_2345966 ?auto_2345967 ) ( ON ?auto_2345968 ?auto_2345966 ) ( ON ?auto_2345969 ?auto_2345968 ) ( ON ?auto_2345970 ?auto_2345969 ) ( ON ?auto_2345971 ?auto_2345970 ) ( ON ?auto_2345972 ?auto_2345971 ) ( ON ?auto_2345973 ?auto_2345972 ) ( ON ?auto_2345974 ?auto_2345973 ) ( not ( = ?auto_2345962 ?auto_2345963 ) ) ( not ( = ?auto_2345962 ?auto_2345964 ) ) ( not ( = ?auto_2345962 ?auto_2345961 ) ) ( not ( = ?auto_2345962 ?auto_2345965 ) ) ( not ( = ?auto_2345962 ?auto_2345967 ) ) ( not ( = ?auto_2345962 ?auto_2345966 ) ) ( not ( = ?auto_2345962 ?auto_2345968 ) ) ( not ( = ?auto_2345962 ?auto_2345969 ) ) ( not ( = ?auto_2345962 ?auto_2345970 ) ) ( not ( = ?auto_2345962 ?auto_2345971 ) ) ( not ( = ?auto_2345962 ?auto_2345972 ) ) ( not ( = ?auto_2345962 ?auto_2345973 ) ) ( not ( = ?auto_2345962 ?auto_2345974 ) ) ( not ( = ?auto_2345962 ?auto_2345975 ) ) ( not ( = ?auto_2345962 ?auto_2345976 ) ) ( not ( = ?auto_2345963 ?auto_2345964 ) ) ( not ( = ?auto_2345963 ?auto_2345961 ) ) ( not ( = ?auto_2345963 ?auto_2345965 ) ) ( not ( = ?auto_2345963 ?auto_2345967 ) ) ( not ( = ?auto_2345963 ?auto_2345966 ) ) ( not ( = ?auto_2345963 ?auto_2345968 ) ) ( not ( = ?auto_2345963 ?auto_2345969 ) ) ( not ( = ?auto_2345963 ?auto_2345970 ) ) ( not ( = ?auto_2345963 ?auto_2345971 ) ) ( not ( = ?auto_2345963 ?auto_2345972 ) ) ( not ( = ?auto_2345963 ?auto_2345973 ) ) ( not ( = ?auto_2345963 ?auto_2345974 ) ) ( not ( = ?auto_2345963 ?auto_2345975 ) ) ( not ( = ?auto_2345963 ?auto_2345976 ) ) ( not ( = ?auto_2345964 ?auto_2345961 ) ) ( not ( = ?auto_2345964 ?auto_2345965 ) ) ( not ( = ?auto_2345964 ?auto_2345967 ) ) ( not ( = ?auto_2345964 ?auto_2345966 ) ) ( not ( = ?auto_2345964 ?auto_2345968 ) ) ( not ( = ?auto_2345964 ?auto_2345969 ) ) ( not ( = ?auto_2345964 ?auto_2345970 ) ) ( not ( = ?auto_2345964 ?auto_2345971 ) ) ( not ( = ?auto_2345964 ?auto_2345972 ) ) ( not ( = ?auto_2345964 ?auto_2345973 ) ) ( not ( = ?auto_2345964 ?auto_2345974 ) ) ( not ( = ?auto_2345964 ?auto_2345975 ) ) ( not ( = ?auto_2345964 ?auto_2345976 ) ) ( not ( = ?auto_2345961 ?auto_2345965 ) ) ( not ( = ?auto_2345961 ?auto_2345967 ) ) ( not ( = ?auto_2345961 ?auto_2345966 ) ) ( not ( = ?auto_2345961 ?auto_2345968 ) ) ( not ( = ?auto_2345961 ?auto_2345969 ) ) ( not ( = ?auto_2345961 ?auto_2345970 ) ) ( not ( = ?auto_2345961 ?auto_2345971 ) ) ( not ( = ?auto_2345961 ?auto_2345972 ) ) ( not ( = ?auto_2345961 ?auto_2345973 ) ) ( not ( = ?auto_2345961 ?auto_2345974 ) ) ( not ( = ?auto_2345961 ?auto_2345975 ) ) ( not ( = ?auto_2345961 ?auto_2345976 ) ) ( not ( = ?auto_2345965 ?auto_2345967 ) ) ( not ( = ?auto_2345965 ?auto_2345966 ) ) ( not ( = ?auto_2345965 ?auto_2345968 ) ) ( not ( = ?auto_2345965 ?auto_2345969 ) ) ( not ( = ?auto_2345965 ?auto_2345970 ) ) ( not ( = ?auto_2345965 ?auto_2345971 ) ) ( not ( = ?auto_2345965 ?auto_2345972 ) ) ( not ( = ?auto_2345965 ?auto_2345973 ) ) ( not ( = ?auto_2345965 ?auto_2345974 ) ) ( not ( = ?auto_2345965 ?auto_2345975 ) ) ( not ( = ?auto_2345965 ?auto_2345976 ) ) ( not ( = ?auto_2345967 ?auto_2345966 ) ) ( not ( = ?auto_2345967 ?auto_2345968 ) ) ( not ( = ?auto_2345967 ?auto_2345969 ) ) ( not ( = ?auto_2345967 ?auto_2345970 ) ) ( not ( = ?auto_2345967 ?auto_2345971 ) ) ( not ( = ?auto_2345967 ?auto_2345972 ) ) ( not ( = ?auto_2345967 ?auto_2345973 ) ) ( not ( = ?auto_2345967 ?auto_2345974 ) ) ( not ( = ?auto_2345967 ?auto_2345975 ) ) ( not ( = ?auto_2345967 ?auto_2345976 ) ) ( not ( = ?auto_2345966 ?auto_2345968 ) ) ( not ( = ?auto_2345966 ?auto_2345969 ) ) ( not ( = ?auto_2345966 ?auto_2345970 ) ) ( not ( = ?auto_2345966 ?auto_2345971 ) ) ( not ( = ?auto_2345966 ?auto_2345972 ) ) ( not ( = ?auto_2345966 ?auto_2345973 ) ) ( not ( = ?auto_2345966 ?auto_2345974 ) ) ( not ( = ?auto_2345966 ?auto_2345975 ) ) ( not ( = ?auto_2345966 ?auto_2345976 ) ) ( not ( = ?auto_2345968 ?auto_2345969 ) ) ( not ( = ?auto_2345968 ?auto_2345970 ) ) ( not ( = ?auto_2345968 ?auto_2345971 ) ) ( not ( = ?auto_2345968 ?auto_2345972 ) ) ( not ( = ?auto_2345968 ?auto_2345973 ) ) ( not ( = ?auto_2345968 ?auto_2345974 ) ) ( not ( = ?auto_2345968 ?auto_2345975 ) ) ( not ( = ?auto_2345968 ?auto_2345976 ) ) ( not ( = ?auto_2345969 ?auto_2345970 ) ) ( not ( = ?auto_2345969 ?auto_2345971 ) ) ( not ( = ?auto_2345969 ?auto_2345972 ) ) ( not ( = ?auto_2345969 ?auto_2345973 ) ) ( not ( = ?auto_2345969 ?auto_2345974 ) ) ( not ( = ?auto_2345969 ?auto_2345975 ) ) ( not ( = ?auto_2345969 ?auto_2345976 ) ) ( not ( = ?auto_2345970 ?auto_2345971 ) ) ( not ( = ?auto_2345970 ?auto_2345972 ) ) ( not ( = ?auto_2345970 ?auto_2345973 ) ) ( not ( = ?auto_2345970 ?auto_2345974 ) ) ( not ( = ?auto_2345970 ?auto_2345975 ) ) ( not ( = ?auto_2345970 ?auto_2345976 ) ) ( not ( = ?auto_2345971 ?auto_2345972 ) ) ( not ( = ?auto_2345971 ?auto_2345973 ) ) ( not ( = ?auto_2345971 ?auto_2345974 ) ) ( not ( = ?auto_2345971 ?auto_2345975 ) ) ( not ( = ?auto_2345971 ?auto_2345976 ) ) ( not ( = ?auto_2345972 ?auto_2345973 ) ) ( not ( = ?auto_2345972 ?auto_2345974 ) ) ( not ( = ?auto_2345972 ?auto_2345975 ) ) ( not ( = ?auto_2345972 ?auto_2345976 ) ) ( not ( = ?auto_2345973 ?auto_2345974 ) ) ( not ( = ?auto_2345973 ?auto_2345975 ) ) ( not ( = ?auto_2345973 ?auto_2345976 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2345974 ?auto_2345975 ?auto_2345976 )
      ( MAKE-15CRATE-VERIFY ?auto_2345962 ?auto_2345963 ?auto_2345964 ?auto_2345961 ?auto_2345965 ?auto_2345967 ?auto_2345966 ?auto_2345968 ?auto_2345969 ?auto_2345970 ?auto_2345971 ?auto_2345972 ?auto_2345973 ?auto_2345974 ?auto_2345975 ?auto_2345976 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2346187 - SURFACE
      ?auto_2346188 - SURFACE
      ?auto_2346189 - SURFACE
      ?auto_2346186 - SURFACE
      ?auto_2346190 - SURFACE
      ?auto_2346192 - SURFACE
      ?auto_2346191 - SURFACE
      ?auto_2346193 - SURFACE
      ?auto_2346194 - SURFACE
      ?auto_2346195 - SURFACE
      ?auto_2346196 - SURFACE
      ?auto_2346197 - SURFACE
      ?auto_2346198 - SURFACE
      ?auto_2346199 - SURFACE
      ?auto_2346200 - SURFACE
      ?auto_2346201 - SURFACE
    )
    :vars
    (
      ?auto_2346205 - HOIST
      ?auto_2346202 - PLACE
      ?auto_2346204 - TRUCK
      ?auto_2346203 - PLACE
      ?auto_2346207 - HOIST
      ?auto_2346206 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2346205 ?auto_2346202 ) ( SURFACE-AT ?auto_2346200 ?auto_2346202 ) ( CLEAR ?auto_2346200 ) ( IS-CRATE ?auto_2346201 ) ( not ( = ?auto_2346200 ?auto_2346201 ) ) ( AVAILABLE ?auto_2346205 ) ( ON ?auto_2346200 ?auto_2346199 ) ( not ( = ?auto_2346199 ?auto_2346200 ) ) ( not ( = ?auto_2346199 ?auto_2346201 ) ) ( TRUCK-AT ?auto_2346204 ?auto_2346203 ) ( not ( = ?auto_2346203 ?auto_2346202 ) ) ( HOIST-AT ?auto_2346207 ?auto_2346203 ) ( not ( = ?auto_2346205 ?auto_2346207 ) ) ( AVAILABLE ?auto_2346207 ) ( SURFACE-AT ?auto_2346201 ?auto_2346203 ) ( ON ?auto_2346201 ?auto_2346206 ) ( CLEAR ?auto_2346201 ) ( not ( = ?auto_2346200 ?auto_2346206 ) ) ( not ( = ?auto_2346201 ?auto_2346206 ) ) ( not ( = ?auto_2346199 ?auto_2346206 ) ) ( ON ?auto_2346188 ?auto_2346187 ) ( ON ?auto_2346189 ?auto_2346188 ) ( ON ?auto_2346186 ?auto_2346189 ) ( ON ?auto_2346190 ?auto_2346186 ) ( ON ?auto_2346192 ?auto_2346190 ) ( ON ?auto_2346191 ?auto_2346192 ) ( ON ?auto_2346193 ?auto_2346191 ) ( ON ?auto_2346194 ?auto_2346193 ) ( ON ?auto_2346195 ?auto_2346194 ) ( ON ?auto_2346196 ?auto_2346195 ) ( ON ?auto_2346197 ?auto_2346196 ) ( ON ?auto_2346198 ?auto_2346197 ) ( ON ?auto_2346199 ?auto_2346198 ) ( not ( = ?auto_2346187 ?auto_2346188 ) ) ( not ( = ?auto_2346187 ?auto_2346189 ) ) ( not ( = ?auto_2346187 ?auto_2346186 ) ) ( not ( = ?auto_2346187 ?auto_2346190 ) ) ( not ( = ?auto_2346187 ?auto_2346192 ) ) ( not ( = ?auto_2346187 ?auto_2346191 ) ) ( not ( = ?auto_2346187 ?auto_2346193 ) ) ( not ( = ?auto_2346187 ?auto_2346194 ) ) ( not ( = ?auto_2346187 ?auto_2346195 ) ) ( not ( = ?auto_2346187 ?auto_2346196 ) ) ( not ( = ?auto_2346187 ?auto_2346197 ) ) ( not ( = ?auto_2346187 ?auto_2346198 ) ) ( not ( = ?auto_2346187 ?auto_2346199 ) ) ( not ( = ?auto_2346187 ?auto_2346200 ) ) ( not ( = ?auto_2346187 ?auto_2346201 ) ) ( not ( = ?auto_2346187 ?auto_2346206 ) ) ( not ( = ?auto_2346188 ?auto_2346189 ) ) ( not ( = ?auto_2346188 ?auto_2346186 ) ) ( not ( = ?auto_2346188 ?auto_2346190 ) ) ( not ( = ?auto_2346188 ?auto_2346192 ) ) ( not ( = ?auto_2346188 ?auto_2346191 ) ) ( not ( = ?auto_2346188 ?auto_2346193 ) ) ( not ( = ?auto_2346188 ?auto_2346194 ) ) ( not ( = ?auto_2346188 ?auto_2346195 ) ) ( not ( = ?auto_2346188 ?auto_2346196 ) ) ( not ( = ?auto_2346188 ?auto_2346197 ) ) ( not ( = ?auto_2346188 ?auto_2346198 ) ) ( not ( = ?auto_2346188 ?auto_2346199 ) ) ( not ( = ?auto_2346188 ?auto_2346200 ) ) ( not ( = ?auto_2346188 ?auto_2346201 ) ) ( not ( = ?auto_2346188 ?auto_2346206 ) ) ( not ( = ?auto_2346189 ?auto_2346186 ) ) ( not ( = ?auto_2346189 ?auto_2346190 ) ) ( not ( = ?auto_2346189 ?auto_2346192 ) ) ( not ( = ?auto_2346189 ?auto_2346191 ) ) ( not ( = ?auto_2346189 ?auto_2346193 ) ) ( not ( = ?auto_2346189 ?auto_2346194 ) ) ( not ( = ?auto_2346189 ?auto_2346195 ) ) ( not ( = ?auto_2346189 ?auto_2346196 ) ) ( not ( = ?auto_2346189 ?auto_2346197 ) ) ( not ( = ?auto_2346189 ?auto_2346198 ) ) ( not ( = ?auto_2346189 ?auto_2346199 ) ) ( not ( = ?auto_2346189 ?auto_2346200 ) ) ( not ( = ?auto_2346189 ?auto_2346201 ) ) ( not ( = ?auto_2346189 ?auto_2346206 ) ) ( not ( = ?auto_2346186 ?auto_2346190 ) ) ( not ( = ?auto_2346186 ?auto_2346192 ) ) ( not ( = ?auto_2346186 ?auto_2346191 ) ) ( not ( = ?auto_2346186 ?auto_2346193 ) ) ( not ( = ?auto_2346186 ?auto_2346194 ) ) ( not ( = ?auto_2346186 ?auto_2346195 ) ) ( not ( = ?auto_2346186 ?auto_2346196 ) ) ( not ( = ?auto_2346186 ?auto_2346197 ) ) ( not ( = ?auto_2346186 ?auto_2346198 ) ) ( not ( = ?auto_2346186 ?auto_2346199 ) ) ( not ( = ?auto_2346186 ?auto_2346200 ) ) ( not ( = ?auto_2346186 ?auto_2346201 ) ) ( not ( = ?auto_2346186 ?auto_2346206 ) ) ( not ( = ?auto_2346190 ?auto_2346192 ) ) ( not ( = ?auto_2346190 ?auto_2346191 ) ) ( not ( = ?auto_2346190 ?auto_2346193 ) ) ( not ( = ?auto_2346190 ?auto_2346194 ) ) ( not ( = ?auto_2346190 ?auto_2346195 ) ) ( not ( = ?auto_2346190 ?auto_2346196 ) ) ( not ( = ?auto_2346190 ?auto_2346197 ) ) ( not ( = ?auto_2346190 ?auto_2346198 ) ) ( not ( = ?auto_2346190 ?auto_2346199 ) ) ( not ( = ?auto_2346190 ?auto_2346200 ) ) ( not ( = ?auto_2346190 ?auto_2346201 ) ) ( not ( = ?auto_2346190 ?auto_2346206 ) ) ( not ( = ?auto_2346192 ?auto_2346191 ) ) ( not ( = ?auto_2346192 ?auto_2346193 ) ) ( not ( = ?auto_2346192 ?auto_2346194 ) ) ( not ( = ?auto_2346192 ?auto_2346195 ) ) ( not ( = ?auto_2346192 ?auto_2346196 ) ) ( not ( = ?auto_2346192 ?auto_2346197 ) ) ( not ( = ?auto_2346192 ?auto_2346198 ) ) ( not ( = ?auto_2346192 ?auto_2346199 ) ) ( not ( = ?auto_2346192 ?auto_2346200 ) ) ( not ( = ?auto_2346192 ?auto_2346201 ) ) ( not ( = ?auto_2346192 ?auto_2346206 ) ) ( not ( = ?auto_2346191 ?auto_2346193 ) ) ( not ( = ?auto_2346191 ?auto_2346194 ) ) ( not ( = ?auto_2346191 ?auto_2346195 ) ) ( not ( = ?auto_2346191 ?auto_2346196 ) ) ( not ( = ?auto_2346191 ?auto_2346197 ) ) ( not ( = ?auto_2346191 ?auto_2346198 ) ) ( not ( = ?auto_2346191 ?auto_2346199 ) ) ( not ( = ?auto_2346191 ?auto_2346200 ) ) ( not ( = ?auto_2346191 ?auto_2346201 ) ) ( not ( = ?auto_2346191 ?auto_2346206 ) ) ( not ( = ?auto_2346193 ?auto_2346194 ) ) ( not ( = ?auto_2346193 ?auto_2346195 ) ) ( not ( = ?auto_2346193 ?auto_2346196 ) ) ( not ( = ?auto_2346193 ?auto_2346197 ) ) ( not ( = ?auto_2346193 ?auto_2346198 ) ) ( not ( = ?auto_2346193 ?auto_2346199 ) ) ( not ( = ?auto_2346193 ?auto_2346200 ) ) ( not ( = ?auto_2346193 ?auto_2346201 ) ) ( not ( = ?auto_2346193 ?auto_2346206 ) ) ( not ( = ?auto_2346194 ?auto_2346195 ) ) ( not ( = ?auto_2346194 ?auto_2346196 ) ) ( not ( = ?auto_2346194 ?auto_2346197 ) ) ( not ( = ?auto_2346194 ?auto_2346198 ) ) ( not ( = ?auto_2346194 ?auto_2346199 ) ) ( not ( = ?auto_2346194 ?auto_2346200 ) ) ( not ( = ?auto_2346194 ?auto_2346201 ) ) ( not ( = ?auto_2346194 ?auto_2346206 ) ) ( not ( = ?auto_2346195 ?auto_2346196 ) ) ( not ( = ?auto_2346195 ?auto_2346197 ) ) ( not ( = ?auto_2346195 ?auto_2346198 ) ) ( not ( = ?auto_2346195 ?auto_2346199 ) ) ( not ( = ?auto_2346195 ?auto_2346200 ) ) ( not ( = ?auto_2346195 ?auto_2346201 ) ) ( not ( = ?auto_2346195 ?auto_2346206 ) ) ( not ( = ?auto_2346196 ?auto_2346197 ) ) ( not ( = ?auto_2346196 ?auto_2346198 ) ) ( not ( = ?auto_2346196 ?auto_2346199 ) ) ( not ( = ?auto_2346196 ?auto_2346200 ) ) ( not ( = ?auto_2346196 ?auto_2346201 ) ) ( not ( = ?auto_2346196 ?auto_2346206 ) ) ( not ( = ?auto_2346197 ?auto_2346198 ) ) ( not ( = ?auto_2346197 ?auto_2346199 ) ) ( not ( = ?auto_2346197 ?auto_2346200 ) ) ( not ( = ?auto_2346197 ?auto_2346201 ) ) ( not ( = ?auto_2346197 ?auto_2346206 ) ) ( not ( = ?auto_2346198 ?auto_2346199 ) ) ( not ( = ?auto_2346198 ?auto_2346200 ) ) ( not ( = ?auto_2346198 ?auto_2346201 ) ) ( not ( = ?auto_2346198 ?auto_2346206 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2346199 ?auto_2346200 ?auto_2346201 )
      ( MAKE-15CRATE-VERIFY ?auto_2346187 ?auto_2346188 ?auto_2346189 ?auto_2346186 ?auto_2346190 ?auto_2346192 ?auto_2346191 ?auto_2346193 ?auto_2346194 ?auto_2346195 ?auto_2346196 ?auto_2346197 ?auto_2346198 ?auto_2346199 ?auto_2346200 ?auto_2346201 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2346413 - SURFACE
      ?auto_2346414 - SURFACE
      ?auto_2346415 - SURFACE
      ?auto_2346412 - SURFACE
      ?auto_2346416 - SURFACE
      ?auto_2346418 - SURFACE
      ?auto_2346417 - SURFACE
      ?auto_2346419 - SURFACE
      ?auto_2346420 - SURFACE
      ?auto_2346421 - SURFACE
      ?auto_2346422 - SURFACE
      ?auto_2346423 - SURFACE
      ?auto_2346424 - SURFACE
      ?auto_2346425 - SURFACE
      ?auto_2346426 - SURFACE
      ?auto_2346427 - SURFACE
    )
    :vars
    (
      ?auto_2346428 - HOIST
      ?auto_2346430 - PLACE
      ?auto_2346433 - PLACE
      ?auto_2346432 - HOIST
      ?auto_2346429 - SURFACE
      ?auto_2346431 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2346428 ?auto_2346430 ) ( SURFACE-AT ?auto_2346426 ?auto_2346430 ) ( CLEAR ?auto_2346426 ) ( IS-CRATE ?auto_2346427 ) ( not ( = ?auto_2346426 ?auto_2346427 ) ) ( AVAILABLE ?auto_2346428 ) ( ON ?auto_2346426 ?auto_2346425 ) ( not ( = ?auto_2346425 ?auto_2346426 ) ) ( not ( = ?auto_2346425 ?auto_2346427 ) ) ( not ( = ?auto_2346433 ?auto_2346430 ) ) ( HOIST-AT ?auto_2346432 ?auto_2346433 ) ( not ( = ?auto_2346428 ?auto_2346432 ) ) ( AVAILABLE ?auto_2346432 ) ( SURFACE-AT ?auto_2346427 ?auto_2346433 ) ( ON ?auto_2346427 ?auto_2346429 ) ( CLEAR ?auto_2346427 ) ( not ( = ?auto_2346426 ?auto_2346429 ) ) ( not ( = ?auto_2346427 ?auto_2346429 ) ) ( not ( = ?auto_2346425 ?auto_2346429 ) ) ( TRUCK-AT ?auto_2346431 ?auto_2346430 ) ( ON ?auto_2346414 ?auto_2346413 ) ( ON ?auto_2346415 ?auto_2346414 ) ( ON ?auto_2346412 ?auto_2346415 ) ( ON ?auto_2346416 ?auto_2346412 ) ( ON ?auto_2346418 ?auto_2346416 ) ( ON ?auto_2346417 ?auto_2346418 ) ( ON ?auto_2346419 ?auto_2346417 ) ( ON ?auto_2346420 ?auto_2346419 ) ( ON ?auto_2346421 ?auto_2346420 ) ( ON ?auto_2346422 ?auto_2346421 ) ( ON ?auto_2346423 ?auto_2346422 ) ( ON ?auto_2346424 ?auto_2346423 ) ( ON ?auto_2346425 ?auto_2346424 ) ( not ( = ?auto_2346413 ?auto_2346414 ) ) ( not ( = ?auto_2346413 ?auto_2346415 ) ) ( not ( = ?auto_2346413 ?auto_2346412 ) ) ( not ( = ?auto_2346413 ?auto_2346416 ) ) ( not ( = ?auto_2346413 ?auto_2346418 ) ) ( not ( = ?auto_2346413 ?auto_2346417 ) ) ( not ( = ?auto_2346413 ?auto_2346419 ) ) ( not ( = ?auto_2346413 ?auto_2346420 ) ) ( not ( = ?auto_2346413 ?auto_2346421 ) ) ( not ( = ?auto_2346413 ?auto_2346422 ) ) ( not ( = ?auto_2346413 ?auto_2346423 ) ) ( not ( = ?auto_2346413 ?auto_2346424 ) ) ( not ( = ?auto_2346413 ?auto_2346425 ) ) ( not ( = ?auto_2346413 ?auto_2346426 ) ) ( not ( = ?auto_2346413 ?auto_2346427 ) ) ( not ( = ?auto_2346413 ?auto_2346429 ) ) ( not ( = ?auto_2346414 ?auto_2346415 ) ) ( not ( = ?auto_2346414 ?auto_2346412 ) ) ( not ( = ?auto_2346414 ?auto_2346416 ) ) ( not ( = ?auto_2346414 ?auto_2346418 ) ) ( not ( = ?auto_2346414 ?auto_2346417 ) ) ( not ( = ?auto_2346414 ?auto_2346419 ) ) ( not ( = ?auto_2346414 ?auto_2346420 ) ) ( not ( = ?auto_2346414 ?auto_2346421 ) ) ( not ( = ?auto_2346414 ?auto_2346422 ) ) ( not ( = ?auto_2346414 ?auto_2346423 ) ) ( not ( = ?auto_2346414 ?auto_2346424 ) ) ( not ( = ?auto_2346414 ?auto_2346425 ) ) ( not ( = ?auto_2346414 ?auto_2346426 ) ) ( not ( = ?auto_2346414 ?auto_2346427 ) ) ( not ( = ?auto_2346414 ?auto_2346429 ) ) ( not ( = ?auto_2346415 ?auto_2346412 ) ) ( not ( = ?auto_2346415 ?auto_2346416 ) ) ( not ( = ?auto_2346415 ?auto_2346418 ) ) ( not ( = ?auto_2346415 ?auto_2346417 ) ) ( not ( = ?auto_2346415 ?auto_2346419 ) ) ( not ( = ?auto_2346415 ?auto_2346420 ) ) ( not ( = ?auto_2346415 ?auto_2346421 ) ) ( not ( = ?auto_2346415 ?auto_2346422 ) ) ( not ( = ?auto_2346415 ?auto_2346423 ) ) ( not ( = ?auto_2346415 ?auto_2346424 ) ) ( not ( = ?auto_2346415 ?auto_2346425 ) ) ( not ( = ?auto_2346415 ?auto_2346426 ) ) ( not ( = ?auto_2346415 ?auto_2346427 ) ) ( not ( = ?auto_2346415 ?auto_2346429 ) ) ( not ( = ?auto_2346412 ?auto_2346416 ) ) ( not ( = ?auto_2346412 ?auto_2346418 ) ) ( not ( = ?auto_2346412 ?auto_2346417 ) ) ( not ( = ?auto_2346412 ?auto_2346419 ) ) ( not ( = ?auto_2346412 ?auto_2346420 ) ) ( not ( = ?auto_2346412 ?auto_2346421 ) ) ( not ( = ?auto_2346412 ?auto_2346422 ) ) ( not ( = ?auto_2346412 ?auto_2346423 ) ) ( not ( = ?auto_2346412 ?auto_2346424 ) ) ( not ( = ?auto_2346412 ?auto_2346425 ) ) ( not ( = ?auto_2346412 ?auto_2346426 ) ) ( not ( = ?auto_2346412 ?auto_2346427 ) ) ( not ( = ?auto_2346412 ?auto_2346429 ) ) ( not ( = ?auto_2346416 ?auto_2346418 ) ) ( not ( = ?auto_2346416 ?auto_2346417 ) ) ( not ( = ?auto_2346416 ?auto_2346419 ) ) ( not ( = ?auto_2346416 ?auto_2346420 ) ) ( not ( = ?auto_2346416 ?auto_2346421 ) ) ( not ( = ?auto_2346416 ?auto_2346422 ) ) ( not ( = ?auto_2346416 ?auto_2346423 ) ) ( not ( = ?auto_2346416 ?auto_2346424 ) ) ( not ( = ?auto_2346416 ?auto_2346425 ) ) ( not ( = ?auto_2346416 ?auto_2346426 ) ) ( not ( = ?auto_2346416 ?auto_2346427 ) ) ( not ( = ?auto_2346416 ?auto_2346429 ) ) ( not ( = ?auto_2346418 ?auto_2346417 ) ) ( not ( = ?auto_2346418 ?auto_2346419 ) ) ( not ( = ?auto_2346418 ?auto_2346420 ) ) ( not ( = ?auto_2346418 ?auto_2346421 ) ) ( not ( = ?auto_2346418 ?auto_2346422 ) ) ( not ( = ?auto_2346418 ?auto_2346423 ) ) ( not ( = ?auto_2346418 ?auto_2346424 ) ) ( not ( = ?auto_2346418 ?auto_2346425 ) ) ( not ( = ?auto_2346418 ?auto_2346426 ) ) ( not ( = ?auto_2346418 ?auto_2346427 ) ) ( not ( = ?auto_2346418 ?auto_2346429 ) ) ( not ( = ?auto_2346417 ?auto_2346419 ) ) ( not ( = ?auto_2346417 ?auto_2346420 ) ) ( not ( = ?auto_2346417 ?auto_2346421 ) ) ( not ( = ?auto_2346417 ?auto_2346422 ) ) ( not ( = ?auto_2346417 ?auto_2346423 ) ) ( not ( = ?auto_2346417 ?auto_2346424 ) ) ( not ( = ?auto_2346417 ?auto_2346425 ) ) ( not ( = ?auto_2346417 ?auto_2346426 ) ) ( not ( = ?auto_2346417 ?auto_2346427 ) ) ( not ( = ?auto_2346417 ?auto_2346429 ) ) ( not ( = ?auto_2346419 ?auto_2346420 ) ) ( not ( = ?auto_2346419 ?auto_2346421 ) ) ( not ( = ?auto_2346419 ?auto_2346422 ) ) ( not ( = ?auto_2346419 ?auto_2346423 ) ) ( not ( = ?auto_2346419 ?auto_2346424 ) ) ( not ( = ?auto_2346419 ?auto_2346425 ) ) ( not ( = ?auto_2346419 ?auto_2346426 ) ) ( not ( = ?auto_2346419 ?auto_2346427 ) ) ( not ( = ?auto_2346419 ?auto_2346429 ) ) ( not ( = ?auto_2346420 ?auto_2346421 ) ) ( not ( = ?auto_2346420 ?auto_2346422 ) ) ( not ( = ?auto_2346420 ?auto_2346423 ) ) ( not ( = ?auto_2346420 ?auto_2346424 ) ) ( not ( = ?auto_2346420 ?auto_2346425 ) ) ( not ( = ?auto_2346420 ?auto_2346426 ) ) ( not ( = ?auto_2346420 ?auto_2346427 ) ) ( not ( = ?auto_2346420 ?auto_2346429 ) ) ( not ( = ?auto_2346421 ?auto_2346422 ) ) ( not ( = ?auto_2346421 ?auto_2346423 ) ) ( not ( = ?auto_2346421 ?auto_2346424 ) ) ( not ( = ?auto_2346421 ?auto_2346425 ) ) ( not ( = ?auto_2346421 ?auto_2346426 ) ) ( not ( = ?auto_2346421 ?auto_2346427 ) ) ( not ( = ?auto_2346421 ?auto_2346429 ) ) ( not ( = ?auto_2346422 ?auto_2346423 ) ) ( not ( = ?auto_2346422 ?auto_2346424 ) ) ( not ( = ?auto_2346422 ?auto_2346425 ) ) ( not ( = ?auto_2346422 ?auto_2346426 ) ) ( not ( = ?auto_2346422 ?auto_2346427 ) ) ( not ( = ?auto_2346422 ?auto_2346429 ) ) ( not ( = ?auto_2346423 ?auto_2346424 ) ) ( not ( = ?auto_2346423 ?auto_2346425 ) ) ( not ( = ?auto_2346423 ?auto_2346426 ) ) ( not ( = ?auto_2346423 ?auto_2346427 ) ) ( not ( = ?auto_2346423 ?auto_2346429 ) ) ( not ( = ?auto_2346424 ?auto_2346425 ) ) ( not ( = ?auto_2346424 ?auto_2346426 ) ) ( not ( = ?auto_2346424 ?auto_2346427 ) ) ( not ( = ?auto_2346424 ?auto_2346429 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2346425 ?auto_2346426 ?auto_2346427 )
      ( MAKE-15CRATE-VERIFY ?auto_2346413 ?auto_2346414 ?auto_2346415 ?auto_2346412 ?auto_2346416 ?auto_2346418 ?auto_2346417 ?auto_2346419 ?auto_2346420 ?auto_2346421 ?auto_2346422 ?auto_2346423 ?auto_2346424 ?auto_2346425 ?auto_2346426 ?auto_2346427 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2346639 - SURFACE
      ?auto_2346640 - SURFACE
      ?auto_2346641 - SURFACE
      ?auto_2346638 - SURFACE
      ?auto_2346642 - SURFACE
      ?auto_2346644 - SURFACE
      ?auto_2346643 - SURFACE
      ?auto_2346645 - SURFACE
      ?auto_2346646 - SURFACE
      ?auto_2346647 - SURFACE
      ?auto_2346648 - SURFACE
      ?auto_2346649 - SURFACE
      ?auto_2346650 - SURFACE
      ?auto_2346651 - SURFACE
      ?auto_2346652 - SURFACE
      ?auto_2346653 - SURFACE
    )
    :vars
    (
      ?auto_2346655 - HOIST
      ?auto_2346659 - PLACE
      ?auto_2346658 - PLACE
      ?auto_2346657 - HOIST
      ?auto_2346654 - SURFACE
      ?auto_2346656 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2346655 ?auto_2346659 ) ( IS-CRATE ?auto_2346653 ) ( not ( = ?auto_2346652 ?auto_2346653 ) ) ( not ( = ?auto_2346651 ?auto_2346652 ) ) ( not ( = ?auto_2346651 ?auto_2346653 ) ) ( not ( = ?auto_2346658 ?auto_2346659 ) ) ( HOIST-AT ?auto_2346657 ?auto_2346658 ) ( not ( = ?auto_2346655 ?auto_2346657 ) ) ( AVAILABLE ?auto_2346657 ) ( SURFACE-AT ?auto_2346653 ?auto_2346658 ) ( ON ?auto_2346653 ?auto_2346654 ) ( CLEAR ?auto_2346653 ) ( not ( = ?auto_2346652 ?auto_2346654 ) ) ( not ( = ?auto_2346653 ?auto_2346654 ) ) ( not ( = ?auto_2346651 ?auto_2346654 ) ) ( TRUCK-AT ?auto_2346656 ?auto_2346659 ) ( SURFACE-AT ?auto_2346651 ?auto_2346659 ) ( CLEAR ?auto_2346651 ) ( LIFTING ?auto_2346655 ?auto_2346652 ) ( IS-CRATE ?auto_2346652 ) ( ON ?auto_2346640 ?auto_2346639 ) ( ON ?auto_2346641 ?auto_2346640 ) ( ON ?auto_2346638 ?auto_2346641 ) ( ON ?auto_2346642 ?auto_2346638 ) ( ON ?auto_2346644 ?auto_2346642 ) ( ON ?auto_2346643 ?auto_2346644 ) ( ON ?auto_2346645 ?auto_2346643 ) ( ON ?auto_2346646 ?auto_2346645 ) ( ON ?auto_2346647 ?auto_2346646 ) ( ON ?auto_2346648 ?auto_2346647 ) ( ON ?auto_2346649 ?auto_2346648 ) ( ON ?auto_2346650 ?auto_2346649 ) ( ON ?auto_2346651 ?auto_2346650 ) ( not ( = ?auto_2346639 ?auto_2346640 ) ) ( not ( = ?auto_2346639 ?auto_2346641 ) ) ( not ( = ?auto_2346639 ?auto_2346638 ) ) ( not ( = ?auto_2346639 ?auto_2346642 ) ) ( not ( = ?auto_2346639 ?auto_2346644 ) ) ( not ( = ?auto_2346639 ?auto_2346643 ) ) ( not ( = ?auto_2346639 ?auto_2346645 ) ) ( not ( = ?auto_2346639 ?auto_2346646 ) ) ( not ( = ?auto_2346639 ?auto_2346647 ) ) ( not ( = ?auto_2346639 ?auto_2346648 ) ) ( not ( = ?auto_2346639 ?auto_2346649 ) ) ( not ( = ?auto_2346639 ?auto_2346650 ) ) ( not ( = ?auto_2346639 ?auto_2346651 ) ) ( not ( = ?auto_2346639 ?auto_2346652 ) ) ( not ( = ?auto_2346639 ?auto_2346653 ) ) ( not ( = ?auto_2346639 ?auto_2346654 ) ) ( not ( = ?auto_2346640 ?auto_2346641 ) ) ( not ( = ?auto_2346640 ?auto_2346638 ) ) ( not ( = ?auto_2346640 ?auto_2346642 ) ) ( not ( = ?auto_2346640 ?auto_2346644 ) ) ( not ( = ?auto_2346640 ?auto_2346643 ) ) ( not ( = ?auto_2346640 ?auto_2346645 ) ) ( not ( = ?auto_2346640 ?auto_2346646 ) ) ( not ( = ?auto_2346640 ?auto_2346647 ) ) ( not ( = ?auto_2346640 ?auto_2346648 ) ) ( not ( = ?auto_2346640 ?auto_2346649 ) ) ( not ( = ?auto_2346640 ?auto_2346650 ) ) ( not ( = ?auto_2346640 ?auto_2346651 ) ) ( not ( = ?auto_2346640 ?auto_2346652 ) ) ( not ( = ?auto_2346640 ?auto_2346653 ) ) ( not ( = ?auto_2346640 ?auto_2346654 ) ) ( not ( = ?auto_2346641 ?auto_2346638 ) ) ( not ( = ?auto_2346641 ?auto_2346642 ) ) ( not ( = ?auto_2346641 ?auto_2346644 ) ) ( not ( = ?auto_2346641 ?auto_2346643 ) ) ( not ( = ?auto_2346641 ?auto_2346645 ) ) ( not ( = ?auto_2346641 ?auto_2346646 ) ) ( not ( = ?auto_2346641 ?auto_2346647 ) ) ( not ( = ?auto_2346641 ?auto_2346648 ) ) ( not ( = ?auto_2346641 ?auto_2346649 ) ) ( not ( = ?auto_2346641 ?auto_2346650 ) ) ( not ( = ?auto_2346641 ?auto_2346651 ) ) ( not ( = ?auto_2346641 ?auto_2346652 ) ) ( not ( = ?auto_2346641 ?auto_2346653 ) ) ( not ( = ?auto_2346641 ?auto_2346654 ) ) ( not ( = ?auto_2346638 ?auto_2346642 ) ) ( not ( = ?auto_2346638 ?auto_2346644 ) ) ( not ( = ?auto_2346638 ?auto_2346643 ) ) ( not ( = ?auto_2346638 ?auto_2346645 ) ) ( not ( = ?auto_2346638 ?auto_2346646 ) ) ( not ( = ?auto_2346638 ?auto_2346647 ) ) ( not ( = ?auto_2346638 ?auto_2346648 ) ) ( not ( = ?auto_2346638 ?auto_2346649 ) ) ( not ( = ?auto_2346638 ?auto_2346650 ) ) ( not ( = ?auto_2346638 ?auto_2346651 ) ) ( not ( = ?auto_2346638 ?auto_2346652 ) ) ( not ( = ?auto_2346638 ?auto_2346653 ) ) ( not ( = ?auto_2346638 ?auto_2346654 ) ) ( not ( = ?auto_2346642 ?auto_2346644 ) ) ( not ( = ?auto_2346642 ?auto_2346643 ) ) ( not ( = ?auto_2346642 ?auto_2346645 ) ) ( not ( = ?auto_2346642 ?auto_2346646 ) ) ( not ( = ?auto_2346642 ?auto_2346647 ) ) ( not ( = ?auto_2346642 ?auto_2346648 ) ) ( not ( = ?auto_2346642 ?auto_2346649 ) ) ( not ( = ?auto_2346642 ?auto_2346650 ) ) ( not ( = ?auto_2346642 ?auto_2346651 ) ) ( not ( = ?auto_2346642 ?auto_2346652 ) ) ( not ( = ?auto_2346642 ?auto_2346653 ) ) ( not ( = ?auto_2346642 ?auto_2346654 ) ) ( not ( = ?auto_2346644 ?auto_2346643 ) ) ( not ( = ?auto_2346644 ?auto_2346645 ) ) ( not ( = ?auto_2346644 ?auto_2346646 ) ) ( not ( = ?auto_2346644 ?auto_2346647 ) ) ( not ( = ?auto_2346644 ?auto_2346648 ) ) ( not ( = ?auto_2346644 ?auto_2346649 ) ) ( not ( = ?auto_2346644 ?auto_2346650 ) ) ( not ( = ?auto_2346644 ?auto_2346651 ) ) ( not ( = ?auto_2346644 ?auto_2346652 ) ) ( not ( = ?auto_2346644 ?auto_2346653 ) ) ( not ( = ?auto_2346644 ?auto_2346654 ) ) ( not ( = ?auto_2346643 ?auto_2346645 ) ) ( not ( = ?auto_2346643 ?auto_2346646 ) ) ( not ( = ?auto_2346643 ?auto_2346647 ) ) ( not ( = ?auto_2346643 ?auto_2346648 ) ) ( not ( = ?auto_2346643 ?auto_2346649 ) ) ( not ( = ?auto_2346643 ?auto_2346650 ) ) ( not ( = ?auto_2346643 ?auto_2346651 ) ) ( not ( = ?auto_2346643 ?auto_2346652 ) ) ( not ( = ?auto_2346643 ?auto_2346653 ) ) ( not ( = ?auto_2346643 ?auto_2346654 ) ) ( not ( = ?auto_2346645 ?auto_2346646 ) ) ( not ( = ?auto_2346645 ?auto_2346647 ) ) ( not ( = ?auto_2346645 ?auto_2346648 ) ) ( not ( = ?auto_2346645 ?auto_2346649 ) ) ( not ( = ?auto_2346645 ?auto_2346650 ) ) ( not ( = ?auto_2346645 ?auto_2346651 ) ) ( not ( = ?auto_2346645 ?auto_2346652 ) ) ( not ( = ?auto_2346645 ?auto_2346653 ) ) ( not ( = ?auto_2346645 ?auto_2346654 ) ) ( not ( = ?auto_2346646 ?auto_2346647 ) ) ( not ( = ?auto_2346646 ?auto_2346648 ) ) ( not ( = ?auto_2346646 ?auto_2346649 ) ) ( not ( = ?auto_2346646 ?auto_2346650 ) ) ( not ( = ?auto_2346646 ?auto_2346651 ) ) ( not ( = ?auto_2346646 ?auto_2346652 ) ) ( not ( = ?auto_2346646 ?auto_2346653 ) ) ( not ( = ?auto_2346646 ?auto_2346654 ) ) ( not ( = ?auto_2346647 ?auto_2346648 ) ) ( not ( = ?auto_2346647 ?auto_2346649 ) ) ( not ( = ?auto_2346647 ?auto_2346650 ) ) ( not ( = ?auto_2346647 ?auto_2346651 ) ) ( not ( = ?auto_2346647 ?auto_2346652 ) ) ( not ( = ?auto_2346647 ?auto_2346653 ) ) ( not ( = ?auto_2346647 ?auto_2346654 ) ) ( not ( = ?auto_2346648 ?auto_2346649 ) ) ( not ( = ?auto_2346648 ?auto_2346650 ) ) ( not ( = ?auto_2346648 ?auto_2346651 ) ) ( not ( = ?auto_2346648 ?auto_2346652 ) ) ( not ( = ?auto_2346648 ?auto_2346653 ) ) ( not ( = ?auto_2346648 ?auto_2346654 ) ) ( not ( = ?auto_2346649 ?auto_2346650 ) ) ( not ( = ?auto_2346649 ?auto_2346651 ) ) ( not ( = ?auto_2346649 ?auto_2346652 ) ) ( not ( = ?auto_2346649 ?auto_2346653 ) ) ( not ( = ?auto_2346649 ?auto_2346654 ) ) ( not ( = ?auto_2346650 ?auto_2346651 ) ) ( not ( = ?auto_2346650 ?auto_2346652 ) ) ( not ( = ?auto_2346650 ?auto_2346653 ) ) ( not ( = ?auto_2346650 ?auto_2346654 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2346651 ?auto_2346652 ?auto_2346653 )
      ( MAKE-15CRATE-VERIFY ?auto_2346639 ?auto_2346640 ?auto_2346641 ?auto_2346638 ?auto_2346642 ?auto_2346644 ?auto_2346643 ?auto_2346645 ?auto_2346646 ?auto_2346647 ?auto_2346648 ?auto_2346649 ?auto_2346650 ?auto_2346651 ?auto_2346652 ?auto_2346653 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2346865 - SURFACE
      ?auto_2346866 - SURFACE
      ?auto_2346867 - SURFACE
      ?auto_2346864 - SURFACE
      ?auto_2346868 - SURFACE
      ?auto_2346870 - SURFACE
      ?auto_2346869 - SURFACE
      ?auto_2346871 - SURFACE
      ?auto_2346872 - SURFACE
      ?auto_2346873 - SURFACE
      ?auto_2346874 - SURFACE
      ?auto_2346875 - SURFACE
      ?auto_2346876 - SURFACE
      ?auto_2346877 - SURFACE
      ?auto_2346878 - SURFACE
      ?auto_2346879 - SURFACE
    )
    :vars
    (
      ?auto_2346883 - HOIST
      ?auto_2346884 - PLACE
      ?auto_2346881 - PLACE
      ?auto_2346885 - HOIST
      ?auto_2346882 - SURFACE
      ?auto_2346880 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2346883 ?auto_2346884 ) ( IS-CRATE ?auto_2346879 ) ( not ( = ?auto_2346878 ?auto_2346879 ) ) ( not ( = ?auto_2346877 ?auto_2346878 ) ) ( not ( = ?auto_2346877 ?auto_2346879 ) ) ( not ( = ?auto_2346881 ?auto_2346884 ) ) ( HOIST-AT ?auto_2346885 ?auto_2346881 ) ( not ( = ?auto_2346883 ?auto_2346885 ) ) ( AVAILABLE ?auto_2346885 ) ( SURFACE-AT ?auto_2346879 ?auto_2346881 ) ( ON ?auto_2346879 ?auto_2346882 ) ( CLEAR ?auto_2346879 ) ( not ( = ?auto_2346878 ?auto_2346882 ) ) ( not ( = ?auto_2346879 ?auto_2346882 ) ) ( not ( = ?auto_2346877 ?auto_2346882 ) ) ( TRUCK-AT ?auto_2346880 ?auto_2346884 ) ( SURFACE-AT ?auto_2346877 ?auto_2346884 ) ( CLEAR ?auto_2346877 ) ( IS-CRATE ?auto_2346878 ) ( AVAILABLE ?auto_2346883 ) ( IN ?auto_2346878 ?auto_2346880 ) ( ON ?auto_2346866 ?auto_2346865 ) ( ON ?auto_2346867 ?auto_2346866 ) ( ON ?auto_2346864 ?auto_2346867 ) ( ON ?auto_2346868 ?auto_2346864 ) ( ON ?auto_2346870 ?auto_2346868 ) ( ON ?auto_2346869 ?auto_2346870 ) ( ON ?auto_2346871 ?auto_2346869 ) ( ON ?auto_2346872 ?auto_2346871 ) ( ON ?auto_2346873 ?auto_2346872 ) ( ON ?auto_2346874 ?auto_2346873 ) ( ON ?auto_2346875 ?auto_2346874 ) ( ON ?auto_2346876 ?auto_2346875 ) ( ON ?auto_2346877 ?auto_2346876 ) ( not ( = ?auto_2346865 ?auto_2346866 ) ) ( not ( = ?auto_2346865 ?auto_2346867 ) ) ( not ( = ?auto_2346865 ?auto_2346864 ) ) ( not ( = ?auto_2346865 ?auto_2346868 ) ) ( not ( = ?auto_2346865 ?auto_2346870 ) ) ( not ( = ?auto_2346865 ?auto_2346869 ) ) ( not ( = ?auto_2346865 ?auto_2346871 ) ) ( not ( = ?auto_2346865 ?auto_2346872 ) ) ( not ( = ?auto_2346865 ?auto_2346873 ) ) ( not ( = ?auto_2346865 ?auto_2346874 ) ) ( not ( = ?auto_2346865 ?auto_2346875 ) ) ( not ( = ?auto_2346865 ?auto_2346876 ) ) ( not ( = ?auto_2346865 ?auto_2346877 ) ) ( not ( = ?auto_2346865 ?auto_2346878 ) ) ( not ( = ?auto_2346865 ?auto_2346879 ) ) ( not ( = ?auto_2346865 ?auto_2346882 ) ) ( not ( = ?auto_2346866 ?auto_2346867 ) ) ( not ( = ?auto_2346866 ?auto_2346864 ) ) ( not ( = ?auto_2346866 ?auto_2346868 ) ) ( not ( = ?auto_2346866 ?auto_2346870 ) ) ( not ( = ?auto_2346866 ?auto_2346869 ) ) ( not ( = ?auto_2346866 ?auto_2346871 ) ) ( not ( = ?auto_2346866 ?auto_2346872 ) ) ( not ( = ?auto_2346866 ?auto_2346873 ) ) ( not ( = ?auto_2346866 ?auto_2346874 ) ) ( not ( = ?auto_2346866 ?auto_2346875 ) ) ( not ( = ?auto_2346866 ?auto_2346876 ) ) ( not ( = ?auto_2346866 ?auto_2346877 ) ) ( not ( = ?auto_2346866 ?auto_2346878 ) ) ( not ( = ?auto_2346866 ?auto_2346879 ) ) ( not ( = ?auto_2346866 ?auto_2346882 ) ) ( not ( = ?auto_2346867 ?auto_2346864 ) ) ( not ( = ?auto_2346867 ?auto_2346868 ) ) ( not ( = ?auto_2346867 ?auto_2346870 ) ) ( not ( = ?auto_2346867 ?auto_2346869 ) ) ( not ( = ?auto_2346867 ?auto_2346871 ) ) ( not ( = ?auto_2346867 ?auto_2346872 ) ) ( not ( = ?auto_2346867 ?auto_2346873 ) ) ( not ( = ?auto_2346867 ?auto_2346874 ) ) ( not ( = ?auto_2346867 ?auto_2346875 ) ) ( not ( = ?auto_2346867 ?auto_2346876 ) ) ( not ( = ?auto_2346867 ?auto_2346877 ) ) ( not ( = ?auto_2346867 ?auto_2346878 ) ) ( not ( = ?auto_2346867 ?auto_2346879 ) ) ( not ( = ?auto_2346867 ?auto_2346882 ) ) ( not ( = ?auto_2346864 ?auto_2346868 ) ) ( not ( = ?auto_2346864 ?auto_2346870 ) ) ( not ( = ?auto_2346864 ?auto_2346869 ) ) ( not ( = ?auto_2346864 ?auto_2346871 ) ) ( not ( = ?auto_2346864 ?auto_2346872 ) ) ( not ( = ?auto_2346864 ?auto_2346873 ) ) ( not ( = ?auto_2346864 ?auto_2346874 ) ) ( not ( = ?auto_2346864 ?auto_2346875 ) ) ( not ( = ?auto_2346864 ?auto_2346876 ) ) ( not ( = ?auto_2346864 ?auto_2346877 ) ) ( not ( = ?auto_2346864 ?auto_2346878 ) ) ( not ( = ?auto_2346864 ?auto_2346879 ) ) ( not ( = ?auto_2346864 ?auto_2346882 ) ) ( not ( = ?auto_2346868 ?auto_2346870 ) ) ( not ( = ?auto_2346868 ?auto_2346869 ) ) ( not ( = ?auto_2346868 ?auto_2346871 ) ) ( not ( = ?auto_2346868 ?auto_2346872 ) ) ( not ( = ?auto_2346868 ?auto_2346873 ) ) ( not ( = ?auto_2346868 ?auto_2346874 ) ) ( not ( = ?auto_2346868 ?auto_2346875 ) ) ( not ( = ?auto_2346868 ?auto_2346876 ) ) ( not ( = ?auto_2346868 ?auto_2346877 ) ) ( not ( = ?auto_2346868 ?auto_2346878 ) ) ( not ( = ?auto_2346868 ?auto_2346879 ) ) ( not ( = ?auto_2346868 ?auto_2346882 ) ) ( not ( = ?auto_2346870 ?auto_2346869 ) ) ( not ( = ?auto_2346870 ?auto_2346871 ) ) ( not ( = ?auto_2346870 ?auto_2346872 ) ) ( not ( = ?auto_2346870 ?auto_2346873 ) ) ( not ( = ?auto_2346870 ?auto_2346874 ) ) ( not ( = ?auto_2346870 ?auto_2346875 ) ) ( not ( = ?auto_2346870 ?auto_2346876 ) ) ( not ( = ?auto_2346870 ?auto_2346877 ) ) ( not ( = ?auto_2346870 ?auto_2346878 ) ) ( not ( = ?auto_2346870 ?auto_2346879 ) ) ( not ( = ?auto_2346870 ?auto_2346882 ) ) ( not ( = ?auto_2346869 ?auto_2346871 ) ) ( not ( = ?auto_2346869 ?auto_2346872 ) ) ( not ( = ?auto_2346869 ?auto_2346873 ) ) ( not ( = ?auto_2346869 ?auto_2346874 ) ) ( not ( = ?auto_2346869 ?auto_2346875 ) ) ( not ( = ?auto_2346869 ?auto_2346876 ) ) ( not ( = ?auto_2346869 ?auto_2346877 ) ) ( not ( = ?auto_2346869 ?auto_2346878 ) ) ( not ( = ?auto_2346869 ?auto_2346879 ) ) ( not ( = ?auto_2346869 ?auto_2346882 ) ) ( not ( = ?auto_2346871 ?auto_2346872 ) ) ( not ( = ?auto_2346871 ?auto_2346873 ) ) ( not ( = ?auto_2346871 ?auto_2346874 ) ) ( not ( = ?auto_2346871 ?auto_2346875 ) ) ( not ( = ?auto_2346871 ?auto_2346876 ) ) ( not ( = ?auto_2346871 ?auto_2346877 ) ) ( not ( = ?auto_2346871 ?auto_2346878 ) ) ( not ( = ?auto_2346871 ?auto_2346879 ) ) ( not ( = ?auto_2346871 ?auto_2346882 ) ) ( not ( = ?auto_2346872 ?auto_2346873 ) ) ( not ( = ?auto_2346872 ?auto_2346874 ) ) ( not ( = ?auto_2346872 ?auto_2346875 ) ) ( not ( = ?auto_2346872 ?auto_2346876 ) ) ( not ( = ?auto_2346872 ?auto_2346877 ) ) ( not ( = ?auto_2346872 ?auto_2346878 ) ) ( not ( = ?auto_2346872 ?auto_2346879 ) ) ( not ( = ?auto_2346872 ?auto_2346882 ) ) ( not ( = ?auto_2346873 ?auto_2346874 ) ) ( not ( = ?auto_2346873 ?auto_2346875 ) ) ( not ( = ?auto_2346873 ?auto_2346876 ) ) ( not ( = ?auto_2346873 ?auto_2346877 ) ) ( not ( = ?auto_2346873 ?auto_2346878 ) ) ( not ( = ?auto_2346873 ?auto_2346879 ) ) ( not ( = ?auto_2346873 ?auto_2346882 ) ) ( not ( = ?auto_2346874 ?auto_2346875 ) ) ( not ( = ?auto_2346874 ?auto_2346876 ) ) ( not ( = ?auto_2346874 ?auto_2346877 ) ) ( not ( = ?auto_2346874 ?auto_2346878 ) ) ( not ( = ?auto_2346874 ?auto_2346879 ) ) ( not ( = ?auto_2346874 ?auto_2346882 ) ) ( not ( = ?auto_2346875 ?auto_2346876 ) ) ( not ( = ?auto_2346875 ?auto_2346877 ) ) ( not ( = ?auto_2346875 ?auto_2346878 ) ) ( not ( = ?auto_2346875 ?auto_2346879 ) ) ( not ( = ?auto_2346875 ?auto_2346882 ) ) ( not ( = ?auto_2346876 ?auto_2346877 ) ) ( not ( = ?auto_2346876 ?auto_2346878 ) ) ( not ( = ?auto_2346876 ?auto_2346879 ) ) ( not ( = ?auto_2346876 ?auto_2346882 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2346877 ?auto_2346878 ?auto_2346879 )
      ( MAKE-15CRATE-VERIFY ?auto_2346865 ?auto_2346866 ?auto_2346867 ?auto_2346864 ?auto_2346868 ?auto_2346870 ?auto_2346869 ?auto_2346871 ?auto_2346872 ?auto_2346873 ?auto_2346874 ?auto_2346875 ?auto_2346876 ?auto_2346877 ?auto_2346878 ?auto_2346879 ) )
  )

  ( :method MAKE-16CRATE
    :parameters
    (
      ?auto_2367357 - SURFACE
      ?auto_2367358 - SURFACE
      ?auto_2367359 - SURFACE
      ?auto_2367356 - SURFACE
      ?auto_2367360 - SURFACE
      ?auto_2367362 - SURFACE
      ?auto_2367361 - SURFACE
      ?auto_2367363 - SURFACE
      ?auto_2367364 - SURFACE
      ?auto_2367365 - SURFACE
      ?auto_2367366 - SURFACE
      ?auto_2367367 - SURFACE
      ?auto_2367368 - SURFACE
      ?auto_2367369 - SURFACE
      ?auto_2367370 - SURFACE
      ?auto_2367371 - SURFACE
      ?auto_2367372 - SURFACE
    )
    :vars
    (
      ?auto_2367374 - HOIST
      ?auto_2367373 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2367374 ?auto_2367373 ) ( SURFACE-AT ?auto_2367371 ?auto_2367373 ) ( CLEAR ?auto_2367371 ) ( LIFTING ?auto_2367374 ?auto_2367372 ) ( IS-CRATE ?auto_2367372 ) ( not ( = ?auto_2367371 ?auto_2367372 ) ) ( ON ?auto_2367358 ?auto_2367357 ) ( ON ?auto_2367359 ?auto_2367358 ) ( ON ?auto_2367356 ?auto_2367359 ) ( ON ?auto_2367360 ?auto_2367356 ) ( ON ?auto_2367362 ?auto_2367360 ) ( ON ?auto_2367361 ?auto_2367362 ) ( ON ?auto_2367363 ?auto_2367361 ) ( ON ?auto_2367364 ?auto_2367363 ) ( ON ?auto_2367365 ?auto_2367364 ) ( ON ?auto_2367366 ?auto_2367365 ) ( ON ?auto_2367367 ?auto_2367366 ) ( ON ?auto_2367368 ?auto_2367367 ) ( ON ?auto_2367369 ?auto_2367368 ) ( ON ?auto_2367370 ?auto_2367369 ) ( ON ?auto_2367371 ?auto_2367370 ) ( not ( = ?auto_2367357 ?auto_2367358 ) ) ( not ( = ?auto_2367357 ?auto_2367359 ) ) ( not ( = ?auto_2367357 ?auto_2367356 ) ) ( not ( = ?auto_2367357 ?auto_2367360 ) ) ( not ( = ?auto_2367357 ?auto_2367362 ) ) ( not ( = ?auto_2367357 ?auto_2367361 ) ) ( not ( = ?auto_2367357 ?auto_2367363 ) ) ( not ( = ?auto_2367357 ?auto_2367364 ) ) ( not ( = ?auto_2367357 ?auto_2367365 ) ) ( not ( = ?auto_2367357 ?auto_2367366 ) ) ( not ( = ?auto_2367357 ?auto_2367367 ) ) ( not ( = ?auto_2367357 ?auto_2367368 ) ) ( not ( = ?auto_2367357 ?auto_2367369 ) ) ( not ( = ?auto_2367357 ?auto_2367370 ) ) ( not ( = ?auto_2367357 ?auto_2367371 ) ) ( not ( = ?auto_2367357 ?auto_2367372 ) ) ( not ( = ?auto_2367358 ?auto_2367359 ) ) ( not ( = ?auto_2367358 ?auto_2367356 ) ) ( not ( = ?auto_2367358 ?auto_2367360 ) ) ( not ( = ?auto_2367358 ?auto_2367362 ) ) ( not ( = ?auto_2367358 ?auto_2367361 ) ) ( not ( = ?auto_2367358 ?auto_2367363 ) ) ( not ( = ?auto_2367358 ?auto_2367364 ) ) ( not ( = ?auto_2367358 ?auto_2367365 ) ) ( not ( = ?auto_2367358 ?auto_2367366 ) ) ( not ( = ?auto_2367358 ?auto_2367367 ) ) ( not ( = ?auto_2367358 ?auto_2367368 ) ) ( not ( = ?auto_2367358 ?auto_2367369 ) ) ( not ( = ?auto_2367358 ?auto_2367370 ) ) ( not ( = ?auto_2367358 ?auto_2367371 ) ) ( not ( = ?auto_2367358 ?auto_2367372 ) ) ( not ( = ?auto_2367359 ?auto_2367356 ) ) ( not ( = ?auto_2367359 ?auto_2367360 ) ) ( not ( = ?auto_2367359 ?auto_2367362 ) ) ( not ( = ?auto_2367359 ?auto_2367361 ) ) ( not ( = ?auto_2367359 ?auto_2367363 ) ) ( not ( = ?auto_2367359 ?auto_2367364 ) ) ( not ( = ?auto_2367359 ?auto_2367365 ) ) ( not ( = ?auto_2367359 ?auto_2367366 ) ) ( not ( = ?auto_2367359 ?auto_2367367 ) ) ( not ( = ?auto_2367359 ?auto_2367368 ) ) ( not ( = ?auto_2367359 ?auto_2367369 ) ) ( not ( = ?auto_2367359 ?auto_2367370 ) ) ( not ( = ?auto_2367359 ?auto_2367371 ) ) ( not ( = ?auto_2367359 ?auto_2367372 ) ) ( not ( = ?auto_2367356 ?auto_2367360 ) ) ( not ( = ?auto_2367356 ?auto_2367362 ) ) ( not ( = ?auto_2367356 ?auto_2367361 ) ) ( not ( = ?auto_2367356 ?auto_2367363 ) ) ( not ( = ?auto_2367356 ?auto_2367364 ) ) ( not ( = ?auto_2367356 ?auto_2367365 ) ) ( not ( = ?auto_2367356 ?auto_2367366 ) ) ( not ( = ?auto_2367356 ?auto_2367367 ) ) ( not ( = ?auto_2367356 ?auto_2367368 ) ) ( not ( = ?auto_2367356 ?auto_2367369 ) ) ( not ( = ?auto_2367356 ?auto_2367370 ) ) ( not ( = ?auto_2367356 ?auto_2367371 ) ) ( not ( = ?auto_2367356 ?auto_2367372 ) ) ( not ( = ?auto_2367360 ?auto_2367362 ) ) ( not ( = ?auto_2367360 ?auto_2367361 ) ) ( not ( = ?auto_2367360 ?auto_2367363 ) ) ( not ( = ?auto_2367360 ?auto_2367364 ) ) ( not ( = ?auto_2367360 ?auto_2367365 ) ) ( not ( = ?auto_2367360 ?auto_2367366 ) ) ( not ( = ?auto_2367360 ?auto_2367367 ) ) ( not ( = ?auto_2367360 ?auto_2367368 ) ) ( not ( = ?auto_2367360 ?auto_2367369 ) ) ( not ( = ?auto_2367360 ?auto_2367370 ) ) ( not ( = ?auto_2367360 ?auto_2367371 ) ) ( not ( = ?auto_2367360 ?auto_2367372 ) ) ( not ( = ?auto_2367362 ?auto_2367361 ) ) ( not ( = ?auto_2367362 ?auto_2367363 ) ) ( not ( = ?auto_2367362 ?auto_2367364 ) ) ( not ( = ?auto_2367362 ?auto_2367365 ) ) ( not ( = ?auto_2367362 ?auto_2367366 ) ) ( not ( = ?auto_2367362 ?auto_2367367 ) ) ( not ( = ?auto_2367362 ?auto_2367368 ) ) ( not ( = ?auto_2367362 ?auto_2367369 ) ) ( not ( = ?auto_2367362 ?auto_2367370 ) ) ( not ( = ?auto_2367362 ?auto_2367371 ) ) ( not ( = ?auto_2367362 ?auto_2367372 ) ) ( not ( = ?auto_2367361 ?auto_2367363 ) ) ( not ( = ?auto_2367361 ?auto_2367364 ) ) ( not ( = ?auto_2367361 ?auto_2367365 ) ) ( not ( = ?auto_2367361 ?auto_2367366 ) ) ( not ( = ?auto_2367361 ?auto_2367367 ) ) ( not ( = ?auto_2367361 ?auto_2367368 ) ) ( not ( = ?auto_2367361 ?auto_2367369 ) ) ( not ( = ?auto_2367361 ?auto_2367370 ) ) ( not ( = ?auto_2367361 ?auto_2367371 ) ) ( not ( = ?auto_2367361 ?auto_2367372 ) ) ( not ( = ?auto_2367363 ?auto_2367364 ) ) ( not ( = ?auto_2367363 ?auto_2367365 ) ) ( not ( = ?auto_2367363 ?auto_2367366 ) ) ( not ( = ?auto_2367363 ?auto_2367367 ) ) ( not ( = ?auto_2367363 ?auto_2367368 ) ) ( not ( = ?auto_2367363 ?auto_2367369 ) ) ( not ( = ?auto_2367363 ?auto_2367370 ) ) ( not ( = ?auto_2367363 ?auto_2367371 ) ) ( not ( = ?auto_2367363 ?auto_2367372 ) ) ( not ( = ?auto_2367364 ?auto_2367365 ) ) ( not ( = ?auto_2367364 ?auto_2367366 ) ) ( not ( = ?auto_2367364 ?auto_2367367 ) ) ( not ( = ?auto_2367364 ?auto_2367368 ) ) ( not ( = ?auto_2367364 ?auto_2367369 ) ) ( not ( = ?auto_2367364 ?auto_2367370 ) ) ( not ( = ?auto_2367364 ?auto_2367371 ) ) ( not ( = ?auto_2367364 ?auto_2367372 ) ) ( not ( = ?auto_2367365 ?auto_2367366 ) ) ( not ( = ?auto_2367365 ?auto_2367367 ) ) ( not ( = ?auto_2367365 ?auto_2367368 ) ) ( not ( = ?auto_2367365 ?auto_2367369 ) ) ( not ( = ?auto_2367365 ?auto_2367370 ) ) ( not ( = ?auto_2367365 ?auto_2367371 ) ) ( not ( = ?auto_2367365 ?auto_2367372 ) ) ( not ( = ?auto_2367366 ?auto_2367367 ) ) ( not ( = ?auto_2367366 ?auto_2367368 ) ) ( not ( = ?auto_2367366 ?auto_2367369 ) ) ( not ( = ?auto_2367366 ?auto_2367370 ) ) ( not ( = ?auto_2367366 ?auto_2367371 ) ) ( not ( = ?auto_2367366 ?auto_2367372 ) ) ( not ( = ?auto_2367367 ?auto_2367368 ) ) ( not ( = ?auto_2367367 ?auto_2367369 ) ) ( not ( = ?auto_2367367 ?auto_2367370 ) ) ( not ( = ?auto_2367367 ?auto_2367371 ) ) ( not ( = ?auto_2367367 ?auto_2367372 ) ) ( not ( = ?auto_2367368 ?auto_2367369 ) ) ( not ( = ?auto_2367368 ?auto_2367370 ) ) ( not ( = ?auto_2367368 ?auto_2367371 ) ) ( not ( = ?auto_2367368 ?auto_2367372 ) ) ( not ( = ?auto_2367369 ?auto_2367370 ) ) ( not ( = ?auto_2367369 ?auto_2367371 ) ) ( not ( = ?auto_2367369 ?auto_2367372 ) ) ( not ( = ?auto_2367370 ?auto_2367371 ) ) ( not ( = ?auto_2367370 ?auto_2367372 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2367371 ?auto_2367372 )
      ( MAKE-16CRATE-VERIFY ?auto_2367357 ?auto_2367358 ?auto_2367359 ?auto_2367356 ?auto_2367360 ?auto_2367362 ?auto_2367361 ?auto_2367363 ?auto_2367364 ?auto_2367365 ?auto_2367366 ?auto_2367367 ?auto_2367368 ?auto_2367369 ?auto_2367370 ?auto_2367371 ?auto_2367372 ) )
  )

  ( :method MAKE-16CRATE
    :parameters
    (
      ?auto_2367556 - SURFACE
      ?auto_2367557 - SURFACE
      ?auto_2367558 - SURFACE
      ?auto_2367555 - SURFACE
      ?auto_2367559 - SURFACE
      ?auto_2367561 - SURFACE
      ?auto_2367560 - SURFACE
      ?auto_2367562 - SURFACE
      ?auto_2367563 - SURFACE
      ?auto_2367564 - SURFACE
      ?auto_2367565 - SURFACE
      ?auto_2367566 - SURFACE
      ?auto_2367567 - SURFACE
      ?auto_2367568 - SURFACE
      ?auto_2367569 - SURFACE
      ?auto_2367570 - SURFACE
      ?auto_2367571 - SURFACE
    )
    :vars
    (
      ?auto_2367574 - HOIST
      ?auto_2367572 - PLACE
      ?auto_2367573 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2367574 ?auto_2367572 ) ( SURFACE-AT ?auto_2367570 ?auto_2367572 ) ( CLEAR ?auto_2367570 ) ( IS-CRATE ?auto_2367571 ) ( not ( = ?auto_2367570 ?auto_2367571 ) ) ( TRUCK-AT ?auto_2367573 ?auto_2367572 ) ( AVAILABLE ?auto_2367574 ) ( IN ?auto_2367571 ?auto_2367573 ) ( ON ?auto_2367570 ?auto_2367569 ) ( not ( = ?auto_2367569 ?auto_2367570 ) ) ( not ( = ?auto_2367569 ?auto_2367571 ) ) ( ON ?auto_2367557 ?auto_2367556 ) ( ON ?auto_2367558 ?auto_2367557 ) ( ON ?auto_2367555 ?auto_2367558 ) ( ON ?auto_2367559 ?auto_2367555 ) ( ON ?auto_2367561 ?auto_2367559 ) ( ON ?auto_2367560 ?auto_2367561 ) ( ON ?auto_2367562 ?auto_2367560 ) ( ON ?auto_2367563 ?auto_2367562 ) ( ON ?auto_2367564 ?auto_2367563 ) ( ON ?auto_2367565 ?auto_2367564 ) ( ON ?auto_2367566 ?auto_2367565 ) ( ON ?auto_2367567 ?auto_2367566 ) ( ON ?auto_2367568 ?auto_2367567 ) ( ON ?auto_2367569 ?auto_2367568 ) ( not ( = ?auto_2367556 ?auto_2367557 ) ) ( not ( = ?auto_2367556 ?auto_2367558 ) ) ( not ( = ?auto_2367556 ?auto_2367555 ) ) ( not ( = ?auto_2367556 ?auto_2367559 ) ) ( not ( = ?auto_2367556 ?auto_2367561 ) ) ( not ( = ?auto_2367556 ?auto_2367560 ) ) ( not ( = ?auto_2367556 ?auto_2367562 ) ) ( not ( = ?auto_2367556 ?auto_2367563 ) ) ( not ( = ?auto_2367556 ?auto_2367564 ) ) ( not ( = ?auto_2367556 ?auto_2367565 ) ) ( not ( = ?auto_2367556 ?auto_2367566 ) ) ( not ( = ?auto_2367556 ?auto_2367567 ) ) ( not ( = ?auto_2367556 ?auto_2367568 ) ) ( not ( = ?auto_2367556 ?auto_2367569 ) ) ( not ( = ?auto_2367556 ?auto_2367570 ) ) ( not ( = ?auto_2367556 ?auto_2367571 ) ) ( not ( = ?auto_2367557 ?auto_2367558 ) ) ( not ( = ?auto_2367557 ?auto_2367555 ) ) ( not ( = ?auto_2367557 ?auto_2367559 ) ) ( not ( = ?auto_2367557 ?auto_2367561 ) ) ( not ( = ?auto_2367557 ?auto_2367560 ) ) ( not ( = ?auto_2367557 ?auto_2367562 ) ) ( not ( = ?auto_2367557 ?auto_2367563 ) ) ( not ( = ?auto_2367557 ?auto_2367564 ) ) ( not ( = ?auto_2367557 ?auto_2367565 ) ) ( not ( = ?auto_2367557 ?auto_2367566 ) ) ( not ( = ?auto_2367557 ?auto_2367567 ) ) ( not ( = ?auto_2367557 ?auto_2367568 ) ) ( not ( = ?auto_2367557 ?auto_2367569 ) ) ( not ( = ?auto_2367557 ?auto_2367570 ) ) ( not ( = ?auto_2367557 ?auto_2367571 ) ) ( not ( = ?auto_2367558 ?auto_2367555 ) ) ( not ( = ?auto_2367558 ?auto_2367559 ) ) ( not ( = ?auto_2367558 ?auto_2367561 ) ) ( not ( = ?auto_2367558 ?auto_2367560 ) ) ( not ( = ?auto_2367558 ?auto_2367562 ) ) ( not ( = ?auto_2367558 ?auto_2367563 ) ) ( not ( = ?auto_2367558 ?auto_2367564 ) ) ( not ( = ?auto_2367558 ?auto_2367565 ) ) ( not ( = ?auto_2367558 ?auto_2367566 ) ) ( not ( = ?auto_2367558 ?auto_2367567 ) ) ( not ( = ?auto_2367558 ?auto_2367568 ) ) ( not ( = ?auto_2367558 ?auto_2367569 ) ) ( not ( = ?auto_2367558 ?auto_2367570 ) ) ( not ( = ?auto_2367558 ?auto_2367571 ) ) ( not ( = ?auto_2367555 ?auto_2367559 ) ) ( not ( = ?auto_2367555 ?auto_2367561 ) ) ( not ( = ?auto_2367555 ?auto_2367560 ) ) ( not ( = ?auto_2367555 ?auto_2367562 ) ) ( not ( = ?auto_2367555 ?auto_2367563 ) ) ( not ( = ?auto_2367555 ?auto_2367564 ) ) ( not ( = ?auto_2367555 ?auto_2367565 ) ) ( not ( = ?auto_2367555 ?auto_2367566 ) ) ( not ( = ?auto_2367555 ?auto_2367567 ) ) ( not ( = ?auto_2367555 ?auto_2367568 ) ) ( not ( = ?auto_2367555 ?auto_2367569 ) ) ( not ( = ?auto_2367555 ?auto_2367570 ) ) ( not ( = ?auto_2367555 ?auto_2367571 ) ) ( not ( = ?auto_2367559 ?auto_2367561 ) ) ( not ( = ?auto_2367559 ?auto_2367560 ) ) ( not ( = ?auto_2367559 ?auto_2367562 ) ) ( not ( = ?auto_2367559 ?auto_2367563 ) ) ( not ( = ?auto_2367559 ?auto_2367564 ) ) ( not ( = ?auto_2367559 ?auto_2367565 ) ) ( not ( = ?auto_2367559 ?auto_2367566 ) ) ( not ( = ?auto_2367559 ?auto_2367567 ) ) ( not ( = ?auto_2367559 ?auto_2367568 ) ) ( not ( = ?auto_2367559 ?auto_2367569 ) ) ( not ( = ?auto_2367559 ?auto_2367570 ) ) ( not ( = ?auto_2367559 ?auto_2367571 ) ) ( not ( = ?auto_2367561 ?auto_2367560 ) ) ( not ( = ?auto_2367561 ?auto_2367562 ) ) ( not ( = ?auto_2367561 ?auto_2367563 ) ) ( not ( = ?auto_2367561 ?auto_2367564 ) ) ( not ( = ?auto_2367561 ?auto_2367565 ) ) ( not ( = ?auto_2367561 ?auto_2367566 ) ) ( not ( = ?auto_2367561 ?auto_2367567 ) ) ( not ( = ?auto_2367561 ?auto_2367568 ) ) ( not ( = ?auto_2367561 ?auto_2367569 ) ) ( not ( = ?auto_2367561 ?auto_2367570 ) ) ( not ( = ?auto_2367561 ?auto_2367571 ) ) ( not ( = ?auto_2367560 ?auto_2367562 ) ) ( not ( = ?auto_2367560 ?auto_2367563 ) ) ( not ( = ?auto_2367560 ?auto_2367564 ) ) ( not ( = ?auto_2367560 ?auto_2367565 ) ) ( not ( = ?auto_2367560 ?auto_2367566 ) ) ( not ( = ?auto_2367560 ?auto_2367567 ) ) ( not ( = ?auto_2367560 ?auto_2367568 ) ) ( not ( = ?auto_2367560 ?auto_2367569 ) ) ( not ( = ?auto_2367560 ?auto_2367570 ) ) ( not ( = ?auto_2367560 ?auto_2367571 ) ) ( not ( = ?auto_2367562 ?auto_2367563 ) ) ( not ( = ?auto_2367562 ?auto_2367564 ) ) ( not ( = ?auto_2367562 ?auto_2367565 ) ) ( not ( = ?auto_2367562 ?auto_2367566 ) ) ( not ( = ?auto_2367562 ?auto_2367567 ) ) ( not ( = ?auto_2367562 ?auto_2367568 ) ) ( not ( = ?auto_2367562 ?auto_2367569 ) ) ( not ( = ?auto_2367562 ?auto_2367570 ) ) ( not ( = ?auto_2367562 ?auto_2367571 ) ) ( not ( = ?auto_2367563 ?auto_2367564 ) ) ( not ( = ?auto_2367563 ?auto_2367565 ) ) ( not ( = ?auto_2367563 ?auto_2367566 ) ) ( not ( = ?auto_2367563 ?auto_2367567 ) ) ( not ( = ?auto_2367563 ?auto_2367568 ) ) ( not ( = ?auto_2367563 ?auto_2367569 ) ) ( not ( = ?auto_2367563 ?auto_2367570 ) ) ( not ( = ?auto_2367563 ?auto_2367571 ) ) ( not ( = ?auto_2367564 ?auto_2367565 ) ) ( not ( = ?auto_2367564 ?auto_2367566 ) ) ( not ( = ?auto_2367564 ?auto_2367567 ) ) ( not ( = ?auto_2367564 ?auto_2367568 ) ) ( not ( = ?auto_2367564 ?auto_2367569 ) ) ( not ( = ?auto_2367564 ?auto_2367570 ) ) ( not ( = ?auto_2367564 ?auto_2367571 ) ) ( not ( = ?auto_2367565 ?auto_2367566 ) ) ( not ( = ?auto_2367565 ?auto_2367567 ) ) ( not ( = ?auto_2367565 ?auto_2367568 ) ) ( not ( = ?auto_2367565 ?auto_2367569 ) ) ( not ( = ?auto_2367565 ?auto_2367570 ) ) ( not ( = ?auto_2367565 ?auto_2367571 ) ) ( not ( = ?auto_2367566 ?auto_2367567 ) ) ( not ( = ?auto_2367566 ?auto_2367568 ) ) ( not ( = ?auto_2367566 ?auto_2367569 ) ) ( not ( = ?auto_2367566 ?auto_2367570 ) ) ( not ( = ?auto_2367566 ?auto_2367571 ) ) ( not ( = ?auto_2367567 ?auto_2367568 ) ) ( not ( = ?auto_2367567 ?auto_2367569 ) ) ( not ( = ?auto_2367567 ?auto_2367570 ) ) ( not ( = ?auto_2367567 ?auto_2367571 ) ) ( not ( = ?auto_2367568 ?auto_2367569 ) ) ( not ( = ?auto_2367568 ?auto_2367570 ) ) ( not ( = ?auto_2367568 ?auto_2367571 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2367569 ?auto_2367570 ?auto_2367571 )
      ( MAKE-16CRATE-VERIFY ?auto_2367556 ?auto_2367557 ?auto_2367558 ?auto_2367555 ?auto_2367559 ?auto_2367561 ?auto_2367560 ?auto_2367562 ?auto_2367563 ?auto_2367564 ?auto_2367565 ?auto_2367566 ?auto_2367567 ?auto_2367568 ?auto_2367569 ?auto_2367570 ?auto_2367571 ) )
  )

  ( :method MAKE-16CRATE
    :parameters
    (
      ?auto_2367772 - SURFACE
      ?auto_2367773 - SURFACE
      ?auto_2367774 - SURFACE
      ?auto_2367771 - SURFACE
      ?auto_2367775 - SURFACE
      ?auto_2367777 - SURFACE
      ?auto_2367776 - SURFACE
      ?auto_2367778 - SURFACE
      ?auto_2367779 - SURFACE
      ?auto_2367780 - SURFACE
      ?auto_2367781 - SURFACE
      ?auto_2367782 - SURFACE
      ?auto_2367783 - SURFACE
      ?auto_2367784 - SURFACE
      ?auto_2367785 - SURFACE
      ?auto_2367786 - SURFACE
      ?auto_2367787 - SURFACE
    )
    :vars
    (
      ?auto_2367791 - HOIST
      ?auto_2367788 - PLACE
      ?auto_2367789 - TRUCK
      ?auto_2367790 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2367791 ?auto_2367788 ) ( SURFACE-AT ?auto_2367786 ?auto_2367788 ) ( CLEAR ?auto_2367786 ) ( IS-CRATE ?auto_2367787 ) ( not ( = ?auto_2367786 ?auto_2367787 ) ) ( AVAILABLE ?auto_2367791 ) ( IN ?auto_2367787 ?auto_2367789 ) ( ON ?auto_2367786 ?auto_2367785 ) ( not ( = ?auto_2367785 ?auto_2367786 ) ) ( not ( = ?auto_2367785 ?auto_2367787 ) ) ( TRUCK-AT ?auto_2367789 ?auto_2367790 ) ( not ( = ?auto_2367790 ?auto_2367788 ) ) ( ON ?auto_2367773 ?auto_2367772 ) ( ON ?auto_2367774 ?auto_2367773 ) ( ON ?auto_2367771 ?auto_2367774 ) ( ON ?auto_2367775 ?auto_2367771 ) ( ON ?auto_2367777 ?auto_2367775 ) ( ON ?auto_2367776 ?auto_2367777 ) ( ON ?auto_2367778 ?auto_2367776 ) ( ON ?auto_2367779 ?auto_2367778 ) ( ON ?auto_2367780 ?auto_2367779 ) ( ON ?auto_2367781 ?auto_2367780 ) ( ON ?auto_2367782 ?auto_2367781 ) ( ON ?auto_2367783 ?auto_2367782 ) ( ON ?auto_2367784 ?auto_2367783 ) ( ON ?auto_2367785 ?auto_2367784 ) ( not ( = ?auto_2367772 ?auto_2367773 ) ) ( not ( = ?auto_2367772 ?auto_2367774 ) ) ( not ( = ?auto_2367772 ?auto_2367771 ) ) ( not ( = ?auto_2367772 ?auto_2367775 ) ) ( not ( = ?auto_2367772 ?auto_2367777 ) ) ( not ( = ?auto_2367772 ?auto_2367776 ) ) ( not ( = ?auto_2367772 ?auto_2367778 ) ) ( not ( = ?auto_2367772 ?auto_2367779 ) ) ( not ( = ?auto_2367772 ?auto_2367780 ) ) ( not ( = ?auto_2367772 ?auto_2367781 ) ) ( not ( = ?auto_2367772 ?auto_2367782 ) ) ( not ( = ?auto_2367772 ?auto_2367783 ) ) ( not ( = ?auto_2367772 ?auto_2367784 ) ) ( not ( = ?auto_2367772 ?auto_2367785 ) ) ( not ( = ?auto_2367772 ?auto_2367786 ) ) ( not ( = ?auto_2367772 ?auto_2367787 ) ) ( not ( = ?auto_2367773 ?auto_2367774 ) ) ( not ( = ?auto_2367773 ?auto_2367771 ) ) ( not ( = ?auto_2367773 ?auto_2367775 ) ) ( not ( = ?auto_2367773 ?auto_2367777 ) ) ( not ( = ?auto_2367773 ?auto_2367776 ) ) ( not ( = ?auto_2367773 ?auto_2367778 ) ) ( not ( = ?auto_2367773 ?auto_2367779 ) ) ( not ( = ?auto_2367773 ?auto_2367780 ) ) ( not ( = ?auto_2367773 ?auto_2367781 ) ) ( not ( = ?auto_2367773 ?auto_2367782 ) ) ( not ( = ?auto_2367773 ?auto_2367783 ) ) ( not ( = ?auto_2367773 ?auto_2367784 ) ) ( not ( = ?auto_2367773 ?auto_2367785 ) ) ( not ( = ?auto_2367773 ?auto_2367786 ) ) ( not ( = ?auto_2367773 ?auto_2367787 ) ) ( not ( = ?auto_2367774 ?auto_2367771 ) ) ( not ( = ?auto_2367774 ?auto_2367775 ) ) ( not ( = ?auto_2367774 ?auto_2367777 ) ) ( not ( = ?auto_2367774 ?auto_2367776 ) ) ( not ( = ?auto_2367774 ?auto_2367778 ) ) ( not ( = ?auto_2367774 ?auto_2367779 ) ) ( not ( = ?auto_2367774 ?auto_2367780 ) ) ( not ( = ?auto_2367774 ?auto_2367781 ) ) ( not ( = ?auto_2367774 ?auto_2367782 ) ) ( not ( = ?auto_2367774 ?auto_2367783 ) ) ( not ( = ?auto_2367774 ?auto_2367784 ) ) ( not ( = ?auto_2367774 ?auto_2367785 ) ) ( not ( = ?auto_2367774 ?auto_2367786 ) ) ( not ( = ?auto_2367774 ?auto_2367787 ) ) ( not ( = ?auto_2367771 ?auto_2367775 ) ) ( not ( = ?auto_2367771 ?auto_2367777 ) ) ( not ( = ?auto_2367771 ?auto_2367776 ) ) ( not ( = ?auto_2367771 ?auto_2367778 ) ) ( not ( = ?auto_2367771 ?auto_2367779 ) ) ( not ( = ?auto_2367771 ?auto_2367780 ) ) ( not ( = ?auto_2367771 ?auto_2367781 ) ) ( not ( = ?auto_2367771 ?auto_2367782 ) ) ( not ( = ?auto_2367771 ?auto_2367783 ) ) ( not ( = ?auto_2367771 ?auto_2367784 ) ) ( not ( = ?auto_2367771 ?auto_2367785 ) ) ( not ( = ?auto_2367771 ?auto_2367786 ) ) ( not ( = ?auto_2367771 ?auto_2367787 ) ) ( not ( = ?auto_2367775 ?auto_2367777 ) ) ( not ( = ?auto_2367775 ?auto_2367776 ) ) ( not ( = ?auto_2367775 ?auto_2367778 ) ) ( not ( = ?auto_2367775 ?auto_2367779 ) ) ( not ( = ?auto_2367775 ?auto_2367780 ) ) ( not ( = ?auto_2367775 ?auto_2367781 ) ) ( not ( = ?auto_2367775 ?auto_2367782 ) ) ( not ( = ?auto_2367775 ?auto_2367783 ) ) ( not ( = ?auto_2367775 ?auto_2367784 ) ) ( not ( = ?auto_2367775 ?auto_2367785 ) ) ( not ( = ?auto_2367775 ?auto_2367786 ) ) ( not ( = ?auto_2367775 ?auto_2367787 ) ) ( not ( = ?auto_2367777 ?auto_2367776 ) ) ( not ( = ?auto_2367777 ?auto_2367778 ) ) ( not ( = ?auto_2367777 ?auto_2367779 ) ) ( not ( = ?auto_2367777 ?auto_2367780 ) ) ( not ( = ?auto_2367777 ?auto_2367781 ) ) ( not ( = ?auto_2367777 ?auto_2367782 ) ) ( not ( = ?auto_2367777 ?auto_2367783 ) ) ( not ( = ?auto_2367777 ?auto_2367784 ) ) ( not ( = ?auto_2367777 ?auto_2367785 ) ) ( not ( = ?auto_2367777 ?auto_2367786 ) ) ( not ( = ?auto_2367777 ?auto_2367787 ) ) ( not ( = ?auto_2367776 ?auto_2367778 ) ) ( not ( = ?auto_2367776 ?auto_2367779 ) ) ( not ( = ?auto_2367776 ?auto_2367780 ) ) ( not ( = ?auto_2367776 ?auto_2367781 ) ) ( not ( = ?auto_2367776 ?auto_2367782 ) ) ( not ( = ?auto_2367776 ?auto_2367783 ) ) ( not ( = ?auto_2367776 ?auto_2367784 ) ) ( not ( = ?auto_2367776 ?auto_2367785 ) ) ( not ( = ?auto_2367776 ?auto_2367786 ) ) ( not ( = ?auto_2367776 ?auto_2367787 ) ) ( not ( = ?auto_2367778 ?auto_2367779 ) ) ( not ( = ?auto_2367778 ?auto_2367780 ) ) ( not ( = ?auto_2367778 ?auto_2367781 ) ) ( not ( = ?auto_2367778 ?auto_2367782 ) ) ( not ( = ?auto_2367778 ?auto_2367783 ) ) ( not ( = ?auto_2367778 ?auto_2367784 ) ) ( not ( = ?auto_2367778 ?auto_2367785 ) ) ( not ( = ?auto_2367778 ?auto_2367786 ) ) ( not ( = ?auto_2367778 ?auto_2367787 ) ) ( not ( = ?auto_2367779 ?auto_2367780 ) ) ( not ( = ?auto_2367779 ?auto_2367781 ) ) ( not ( = ?auto_2367779 ?auto_2367782 ) ) ( not ( = ?auto_2367779 ?auto_2367783 ) ) ( not ( = ?auto_2367779 ?auto_2367784 ) ) ( not ( = ?auto_2367779 ?auto_2367785 ) ) ( not ( = ?auto_2367779 ?auto_2367786 ) ) ( not ( = ?auto_2367779 ?auto_2367787 ) ) ( not ( = ?auto_2367780 ?auto_2367781 ) ) ( not ( = ?auto_2367780 ?auto_2367782 ) ) ( not ( = ?auto_2367780 ?auto_2367783 ) ) ( not ( = ?auto_2367780 ?auto_2367784 ) ) ( not ( = ?auto_2367780 ?auto_2367785 ) ) ( not ( = ?auto_2367780 ?auto_2367786 ) ) ( not ( = ?auto_2367780 ?auto_2367787 ) ) ( not ( = ?auto_2367781 ?auto_2367782 ) ) ( not ( = ?auto_2367781 ?auto_2367783 ) ) ( not ( = ?auto_2367781 ?auto_2367784 ) ) ( not ( = ?auto_2367781 ?auto_2367785 ) ) ( not ( = ?auto_2367781 ?auto_2367786 ) ) ( not ( = ?auto_2367781 ?auto_2367787 ) ) ( not ( = ?auto_2367782 ?auto_2367783 ) ) ( not ( = ?auto_2367782 ?auto_2367784 ) ) ( not ( = ?auto_2367782 ?auto_2367785 ) ) ( not ( = ?auto_2367782 ?auto_2367786 ) ) ( not ( = ?auto_2367782 ?auto_2367787 ) ) ( not ( = ?auto_2367783 ?auto_2367784 ) ) ( not ( = ?auto_2367783 ?auto_2367785 ) ) ( not ( = ?auto_2367783 ?auto_2367786 ) ) ( not ( = ?auto_2367783 ?auto_2367787 ) ) ( not ( = ?auto_2367784 ?auto_2367785 ) ) ( not ( = ?auto_2367784 ?auto_2367786 ) ) ( not ( = ?auto_2367784 ?auto_2367787 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2367785 ?auto_2367786 ?auto_2367787 )
      ( MAKE-16CRATE-VERIFY ?auto_2367772 ?auto_2367773 ?auto_2367774 ?auto_2367771 ?auto_2367775 ?auto_2367777 ?auto_2367776 ?auto_2367778 ?auto_2367779 ?auto_2367780 ?auto_2367781 ?auto_2367782 ?auto_2367783 ?auto_2367784 ?auto_2367785 ?auto_2367786 ?auto_2367787 ) )
  )

  ( :method MAKE-16CRATE
    :parameters
    (
      ?auto_2368004 - SURFACE
      ?auto_2368005 - SURFACE
      ?auto_2368006 - SURFACE
      ?auto_2368003 - SURFACE
      ?auto_2368007 - SURFACE
      ?auto_2368009 - SURFACE
      ?auto_2368008 - SURFACE
      ?auto_2368010 - SURFACE
      ?auto_2368011 - SURFACE
      ?auto_2368012 - SURFACE
      ?auto_2368013 - SURFACE
      ?auto_2368014 - SURFACE
      ?auto_2368015 - SURFACE
      ?auto_2368016 - SURFACE
      ?auto_2368017 - SURFACE
      ?auto_2368018 - SURFACE
      ?auto_2368019 - SURFACE
    )
    :vars
    (
      ?auto_2368022 - HOIST
      ?auto_2368023 - PLACE
      ?auto_2368020 - TRUCK
      ?auto_2368021 - PLACE
      ?auto_2368024 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2368022 ?auto_2368023 ) ( SURFACE-AT ?auto_2368018 ?auto_2368023 ) ( CLEAR ?auto_2368018 ) ( IS-CRATE ?auto_2368019 ) ( not ( = ?auto_2368018 ?auto_2368019 ) ) ( AVAILABLE ?auto_2368022 ) ( ON ?auto_2368018 ?auto_2368017 ) ( not ( = ?auto_2368017 ?auto_2368018 ) ) ( not ( = ?auto_2368017 ?auto_2368019 ) ) ( TRUCK-AT ?auto_2368020 ?auto_2368021 ) ( not ( = ?auto_2368021 ?auto_2368023 ) ) ( HOIST-AT ?auto_2368024 ?auto_2368021 ) ( LIFTING ?auto_2368024 ?auto_2368019 ) ( not ( = ?auto_2368022 ?auto_2368024 ) ) ( ON ?auto_2368005 ?auto_2368004 ) ( ON ?auto_2368006 ?auto_2368005 ) ( ON ?auto_2368003 ?auto_2368006 ) ( ON ?auto_2368007 ?auto_2368003 ) ( ON ?auto_2368009 ?auto_2368007 ) ( ON ?auto_2368008 ?auto_2368009 ) ( ON ?auto_2368010 ?auto_2368008 ) ( ON ?auto_2368011 ?auto_2368010 ) ( ON ?auto_2368012 ?auto_2368011 ) ( ON ?auto_2368013 ?auto_2368012 ) ( ON ?auto_2368014 ?auto_2368013 ) ( ON ?auto_2368015 ?auto_2368014 ) ( ON ?auto_2368016 ?auto_2368015 ) ( ON ?auto_2368017 ?auto_2368016 ) ( not ( = ?auto_2368004 ?auto_2368005 ) ) ( not ( = ?auto_2368004 ?auto_2368006 ) ) ( not ( = ?auto_2368004 ?auto_2368003 ) ) ( not ( = ?auto_2368004 ?auto_2368007 ) ) ( not ( = ?auto_2368004 ?auto_2368009 ) ) ( not ( = ?auto_2368004 ?auto_2368008 ) ) ( not ( = ?auto_2368004 ?auto_2368010 ) ) ( not ( = ?auto_2368004 ?auto_2368011 ) ) ( not ( = ?auto_2368004 ?auto_2368012 ) ) ( not ( = ?auto_2368004 ?auto_2368013 ) ) ( not ( = ?auto_2368004 ?auto_2368014 ) ) ( not ( = ?auto_2368004 ?auto_2368015 ) ) ( not ( = ?auto_2368004 ?auto_2368016 ) ) ( not ( = ?auto_2368004 ?auto_2368017 ) ) ( not ( = ?auto_2368004 ?auto_2368018 ) ) ( not ( = ?auto_2368004 ?auto_2368019 ) ) ( not ( = ?auto_2368005 ?auto_2368006 ) ) ( not ( = ?auto_2368005 ?auto_2368003 ) ) ( not ( = ?auto_2368005 ?auto_2368007 ) ) ( not ( = ?auto_2368005 ?auto_2368009 ) ) ( not ( = ?auto_2368005 ?auto_2368008 ) ) ( not ( = ?auto_2368005 ?auto_2368010 ) ) ( not ( = ?auto_2368005 ?auto_2368011 ) ) ( not ( = ?auto_2368005 ?auto_2368012 ) ) ( not ( = ?auto_2368005 ?auto_2368013 ) ) ( not ( = ?auto_2368005 ?auto_2368014 ) ) ( not ( = ?auto_2368005 ?auto_2368015 ) ) ( not ( = ?auto_2368005 ?auto_2368016 ) ) ( not ( = ?auto_2368005 ?auto_2368017 ) ) ( not ( = ?auto_2368005 ?auto_2368018 ) ) ( not ( = ?auto_2368005 ?auto_2368019 ) ) ( not ( = ?auto_2368006 ?auto_2368003 ) ) ( not ( = ?auto_2368006 ?auto_2368007 ) ) ( not ( = ?auto_2368006 ?auto_2368009 ) ) ( not ( = ?auto_2368006 ?auto_2368008 ) ) ( not ( = ?auto_2368006 ?auto_2368010 ) ) ( not ( = ?auto_2368006 ?auto_2368011 ) ) ( not ( = ?auto_2368006 ?auto_2368012 ) ) ( not ( = ?auto_2368006 ?auto_2368013 ) ) ( not ( = ?auto_2368006 ?auto_2368014 ) ) ( not ( = ?auto_2368006 ?auto_2368015 ) ) ( not ( = ?auto_2368006 ?auto_2368016 ) ) ( not ( = ?auto_2368006 ?auto_2368017 ) ) ( not ( = ?auto_2368006 ?auto_2368018 ) ) ( not ( = ?auto_2368006 ?auto_2368019 ) ) ( not ( = ?auto_2368003 ?auto_2368007 ) ) ( not ( = ?auto_2368003 ?auto_2368009 ) ) ( not ( = ?auto_2368003 ?auto_2368008 ) ) ( not ( = ?auto_2368003 ?auto_2368010 ) ) ( not ( = ?auto_2368003 ?auto_2368011 ) ) ( not ( = ?auto_2368003 ?auto_2368012 ) ) ( not ( = ?auto_2368003 ?auto_2368013 ) ) ( not ( = ?auto_2368003 ?auto_2368014 ) ) ( not ( = ?auto_2368003 ?auto_2368015 ) ) ( not ( = ?auto_2368003 ?auto_2368016 ) ) ( not ( = ?auto_2368003 ?auto_2368017 ) ) ( not ( = ?auto_2368003 ?auto_2368018 ) ) ( not ( = ?auto_2368003 ?auto_2368019 ) ) ( not ( = ?auto_2368007 ?auto_2368009 ) ) ( not ( = ?auto_2368007 ?auto_2368008 ) ) ( not ( = ?auto_2368007 ?auto_2368010 ) ) ( not ( = ?auto_2368007 ?auto_2368011 ) ) ( not ( = ?auto_2368007 ?auto_2368012 ) ) ( not ( = ?auto_2368007 ?auto_2368013 ) ) ( not ( = ?auto_2368007 ?auto_2368014 ) ) ( not ( = ?auto_2368007 ?auto_2368015 ) ) ( not ( = ?auto_2368007 ?auto_2368016 ) ) ( not ( = ?auto_2368007 ?auto_2368017 ) ) ( not ( = ?auto_2368007 ?auto_2368018 ) ) ( not ( = ?auto_2368007 ?auto_2368019 ) ) ( not ( = ?auto_2368009 ?auto_2368008 ) ) ( not ( = ?auto_2368009 ?auto_2368010 ) ) ( not ( = ?auto_2368009 ?auto_2368011 ) ) ( not ( = ?auto_2368009 ?auto_2368012 ) ) ( not ( = ?auto_2368009 ?auto_2368013 ) ) ( not ( = ?auto_2368009 ?auto_2368014 ) ) ( not ( = ?auto_2368009 ?auto_2368015 ) ) ( not ( = ?auto_2368009 ?auto_2368016 ) ) ( not ( = ?auto_2368009 ?auto_2368017 ) ) ( not ( = ?auto_2368009 ?auto_2368018 ) ) ( not ( = ?auto_2368009 ?auto_2368019 ) ) ( not ( = ?auto_2368008 ?auto_2368010 ) ) ( not ( = ?auto_2368008 ?auto_2368011 ) ) ( not ( = ?auto_2368008 ?auto_2368012 ) ) ( not ( = ?auto_2368008 ?auto_2368013 ) ) ( not ( = ?auto_2368008 ?auto_2368014 ) ) ( not ( = ?auto_2368008 ?auto_2368015 ) ) ( not ( = ?auto_2368008 ?auto_2368016 ) ) ( not ( = ?auto_2368008 ?auto_2368017 ) ) ( not ( = ?auto_2368008 ?auto_2368018 ) ) ( not ( = ?auto_2368008 ?auto_2368019 ) ) ( not ( = ?auto_2368010 ?auto_2368011 ) ) ( not ( = ?auto_2368010 ?auto_2368012 ) ) ( not ( = ?auto_2368010 ?auto_2368013 ) ) ( not ( = ?auto_2368010 ?auto_2368014 ) ) ( not ( = ?auto_2368010 ?auto_2368015 ) ) ( not ( = ?auto_2368010 ?auto_2368016 ) ) ( not ( = ?auto_2368010 ?auto_2368017 ) ) ( not ( = ?auto_2368010 ?auto_2368018 ) ) ( not ( = ?auto_2368010 ?auto_2368019 ) ) ( not ( = ?auto_2368011 ?auto_2368012 ) ) ( not ( = ?auto_2368011 ?auto_2368013 ) ) ( not ( = ?auto_2368011 ?auto_2368014 ) ) ( not ( = ?auto_2368011 ?auto_2368015 ) ) ( not ( = ?auto_2368011 ?auto_2368016 ) ) ( not ( = ?auto_2368011 ?auto_2368017 ) ) ( not ( = ?auto_2368011 ?auto_2368018 ) ) ( not ( = ?auto_2368011 ?auto_2368019 ) ) ( not ( = ?auto_2368012 ?auto_2368013 ) ) ( not ( = ?auto_2368012 ?auto_2368014 ) ) ( not ( = ?auto_2368012 ?auto_2368015 ) ) ( not ( = ?auto_2368012 ?auto_2368016 ) ) ( not ( = ?auto_2368012 ?auto_2368017 ) ) ( not ( = ?auto_2368012 ?auto_2368018 ) ) ( not ( = ?auto_2368012 ?auto_2368019 ) ) ( not ( = ?auto_2368013 ?auto_2368014 ) ) ( not ( = ?auto_2368013 ?auto_2368015 ) ) ( not ( = ?auto_2368013 ?auto_2368016 ) ) ( not ( = ?auto_2368013 ?auto_2368017 ) ) ( not ( = ?auto_2368013 ?auto_2368018 ) ) ( not ( = ?auto_2368013 ?auto_2368019 ) ) ( not ( = ?auto_2368014 ?auto_2368015 ) ) ( not ( = ?auto_2368014 ?auto_2368016 ) ) ( not ( = ?auto_2368014 ?auto_2368017 ) ) ( not ( = ?auto_2368014 ?auto_2368018 ) ) ( not ( = ?auto_2368014 ?auto_2368019 ) ) ( not ( = ?auto_2368015 ?auto_2368016 ) ) ( not ( = ?auto_2368015 ?auto_2368017 ) ) ( not ( = ?auto_2368015 ?auto_2368018 ) ) ( not ( = ?auto_2368015 ?auto_2368019 ) ) ( not ( = ?auto_2368016 ?auto_2368017 ) ) ( not ( = ?auto_2368016 ?auto_2368018 ) ) ( not ( = ?auto_2368016 ?auto_2368019 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2368017 ?auto_2368018 ?auto_2368019 )
      ( MAKE-16CRATE-VERIFY ?auto_2368004 ?auto_2368005 ?auto_2368006 ?auto_2368003 ?auto_2368007 ?auto_2368009 ?auto_2368008 ?auto_2368010 ?auto_2368011 ?auto_2368012 ?auto_2368013 ?auto_2368014 ?auto_2368015 ?auto_2368016 ?auto_2368017 ?auto_2368018 ?auto_2368019 ) )
  )

  ( :method MAKE-16CRATE
    :parameters
    (
      ?auto_2368252 - SURFACE
      ?auto_2368253 - SURFACE
      ?auto_2368254 - SURFACE
      ?auto_2368251 - SURFACE
      ?auto_2368255 - SURFACE
      ?auto_2368257 - SURFACE
      ?auto_2368256 - SURFACE
      ?auto_2368258 - SURFACE
      ?auto_2368259 - SURFACE
      ?auto_2368260 - SURFACE
      ?auto_2368261 - SURFACE
      ?auto_2368262 - SURFACE
      ?auto_2368263 - SURFACE
      ?auto_2368264 - SURFACE
      ?auto_2368265 - SURFACE
      ?auto_2368266 - SURFACE
      ?auto_2368267 - SURFACE
    )
    :vars
    (
      ?auto_2368268 - HOIST
      ?auto_2368273 - PLACE
      ?auto_2368272 - TRUCK
      ?auto_2368271 - PLACE
      ?auto_2368270 - HOIST
      ?auto_2368269 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2368268 ?auto_2368273 ) ( SURFACE-AT ?auto_2368266 ?auto_2368273 ) ( CLEAR ?auto_2368266 ) ( IS-CRATE ?auto_2368267 ) ( not ( = ?auto_2368266 ?auto_2368267 ) ) ( AVAILABLE ?auto_2368268 ) ( ON ?auto_2368266 ?auto_2368265 ) ( not ( = ?auto_2368265 ?auto_2368266 ) ) ( not ( = ?auto_2368265 ?auto_2368267 ) ) ( TRUCK-AT ?auto_2368272 ?auto_2368271 ) ( not ( = ?auto_2368271 ?auto_2368273 ) ) ( HOIST-AT ?auto_2368270 ?auto_2368271 ) ( not ( = ?auto_2368268 ?auto_2368270 ) ) ( AVAILABLE ?auto_2368270 ) ( SURFACE-AT ?auto_2368267 ?auto_2368271 ) ( ON ?auto_2368267 ?auto_2368269 ) ( CLEAR ?auto_2368267 ) ( not ( = ?auto_2368266 ?auto_2368269 ) ) ( not ( = ?auto_2368267 ?auto_2368269 ) ) ( not ( = ?auto_2368265 ?auto_2368269 ) ) ( ON ?auto_2368253 ?auto_2368252 ) ( ON ?auto_2368254 ?auto_2368253 ) ( ON ?auto_2368251 ?auto_2368254 ) ( ON ?auto_2368255 ?auto_2368251 ) ( ON ?auto_2368257 ?auto_2368255 ) ( ON ?auto_2368256 ?auto_2368257 ) ( ON ?auto_2368258 ?auto_2368256 ) ( ON ?auto_2368259 ?auto_2368258 ) ( ON ?auto_2368260 ?auto_2368259 ) ( ON ?auto_2368261 ?auto_2368260 ) ( ON ?auto_2368262 ?auto_2368261 ) ( ON ?auto_2368263 ?auto_2368262 ) ( ON ?auto_2368264 ?auto_2368263 ) ( ON ?auto_2368265 ?auto_2368264 ) ( not ( = ?auto_2368252 ?auto_2368253 ) ) ( not ( = ?auto_2368252 ?auto_2368254 ) ) ( not ( = ?auto_2368252 ?auto_2368251 ) ) ( not ( = ?auto_2368252 ?auto_2368255 ) ) ( not ( = ?auto_2368252 ?auto_2368257 ) ) ( not ( = ?auto_2368252 ?auto_2368256 ) ) ( not ( = ?auto_2368252 ?auto_2368258 ) ) ( not ( = ?auto_2368252 ?auto_2368259 ) ) ( not ( = ?auto_2368252 ?auto_2368260 ) ) ( not ( = ?auto_2368252 ?auto_2368261 ) ) ( not ( = ?auto_2368252 ?auto_2368262 ) ) ( not ( = ?auto_2368252 ?auto_2368263 ) ) ( not ( = ?auto_2368252 ?auto_2368264 ) ) ( not ( = ?auto_2368252 ?auto_2368265 ) ) ( not ( = ?auto_2368252 ?auto_2368266 ) ) ( not ( = ?auto_2368252 ?auto_2368267 ) ) ( not ( = ?auto_2368252 ?auto_2368269 ) ) ( not ( = ?auto_2368253 ?auto_2368254 ) ) ( not ( = ?auto_2368253 ?auto_2368251 ) ) ( not ( = ?auto_2368253 ?auto_2368255 ) ) ( not ( = ?auto_2368253 ?auto_2368257 ) ) ( not ( = ?auto_2368253 ?auto_2368256 ) ) ( not ( = ?auto_2368253 ?auto_2368258 ) ) ( not ( = ?auto_2368253 ?auto_2368259 ) ) ( not ( = ?auto_2368253 ?auto_2368260 ) ) ( not ( = ?auto_2368253 ?auto_2368261 ) ) ( not ( = ?auto_2368253 ?auto_2368262 ) ) ( not ( = ?auto_2368253 ?auto_2368263 ) ) ( not ( = ?auto_2368253 ?auto_2368264 ) ) ( not ( = ?auto_2368253 ?auto_2368265 ) ) ( not ( = ?auto_2368253 ?auto_2368266 ) ) ( not ( = ?auto_2368253 ?auto_2368267 ) ) ( not ( = ?auto_2368253 ?auto_2368269 ) ) ( not ( = ?auto_2368254 ?auto_2368251 ) ) ( not ( = ?auto_2368254 ?auto_2368255 ) ) ( not ( = ?auto_2368254 ?auto_2368257 ) ) ( not ( = ?auto_2368254 ?auto_2368256 ) ) ( not ( = ?auto_2368254 ?auto_2368258 ) ) ( not ( = ?auto_2368254 ?auto_2368259 ) ) ( not ( = ?auto_2368254 ?auto_2368260 ) ) ( not ( = ?auto_2368254 ?auto_2368261 ) ) ( not ( = ?auto_2368254 ?auto_2368262 ) ) ( not ( = ?auto_2368254 ?auto_2368263 ) ) ( not ( = ?auto_2368254 ?auto_2368264 ) ) ( not ( = ?auto_2368254 ?auto_2368265 ) ) ( not ( = ?auto_2368254 ?auto_2368266 ) ) ( not ( = ?auto_2368254 ?auto_2368267 ) ) ( not ( = ?auto_2368254 ?auto_2368269 ) ) ( not ( = ?auto_2368251 ?auto_2368255 ) ) ( not ( = ?auto_2368251 ?auto_2368257 ) ) ( not ( = ?auto_2368251 ?auto_2368256 ) ) ( not ( = ?auto_2368251 ?auto_2368258 ) ) ( not ( = ?auto_2368251 ?auto_2368259 ) ) ( not ( = ?auto_2368251 ?auto_2368260 ) ) ( not ( = ?auto_2368251 ?auto_2368261 ) ) ( not ( = ?auto_2368251 ?auto_2368262 ) ) ( not ( = ?auto_2368251 ?auto_2368263 ) ) ( not ( = ?auto_2368251 ?auto_2368264 ) ) ( not ( = ?auto_2368251 ?auto_2368265 ) ) ( not ( = ?auto_2368251 ?auto_2368266 ) ) ( not ( = ?auto_2368251 ?auto_2368267 ) ) ( not ( = ?auto_2368251 ?auto_2368269 ) ) ( not ( = ?auto_2368255 ?auto_2368257 ) ) ( not ( = ?auto_2368255 ?auto_2368256 ) ) ( not ( = ?auto_2368255 ?auto_2368258 ) ) ( not ( = ?auto_2368255 ?auto_2368259 ) ) ( not ( = ?auto_2368255 ?auto_2368260 ) ) ( not ( = ?auto_2368255 ?auto_2368261 ) ) ( not ( = ?auto_2368255 ?auto_2368262 ) ) ( not ( = ?auto_2368255 ?auto_2368263 ) ) ( not ( = ?auto_2368255 ?auto_2368264 ) ) ( not ( = ?auto_2368255 ?auto_2368265 ) ) ( not ( = ?auto_2368255 ?auto_2368266 ) ) ( not ( = ?auto_2368255 ?auto_2368267 ) ) ( not ( = ?auto_2368255 ?auto_2368269 ) ) ( not ( = ?auto_2368257 ?auto_2368256 ) ) ( not ( = ?auto_2368257 ?auto_2368258 ) ) ( not ( = ?auto_2368257 ?auto_2368259 ) ) ( not ( = ?auto_2368257 ?auto_2368260 ) ) ( not ( = ?auto_2368257 ?auto_2368261 ) ) ( not ( = ?auto_2368257 ?auto_2368262 ) ) ( not ( = ?auto_2368257 ?auto_2368263 ) ) ( not ( = ?auto_2368257 ?auto_2368264 ) ) ( not ( = ?auto_2368257 ?auto_2368265 ) ) ( not ( = ?auto_2368257 ?auto_2368266 ) ) ( not ( = ?auto_2368257 ?auto_2368267 ) ) ( not ( = ?auto_2368257 ?auto_2368269 ) ) ( not ( = ?auto_2368256 ?auto_2368258 ) ) ( not ( = ?auto_2368256 ?auto_2368259 ) ) ( not ( = ?auto_2368256 ?auto_2368260 ) ) ( not ( = ?auto_2368256 ?auto_2368261 ) ) ( not ( = ?auto_2368256 ?auto_2368262 ) ) ( not ( = ?auto_2368256 ?auto_2368263 ) ) ( not ( = ?auto_2368256 ?auto_2368264 ) ) ( not ( = ?auto_2368256 ?auto_2368265 ) ) ( not ( = ?auto_2368256 ?auto_2368266 ) ) ( not ( = ?auto_2368256 ?auto_2368267 ) ) ( not ( = ?auto_2368256 ?auto_2368269 ) ) ( not ( = ?auto_2368258 ?auto_2368259 ) ) ( not ( = ?auto_2368258 ?auto_2368260 ) ) ( not ( = ?auto_2368258 ?auto_2368261 ) ) ( not ( = ?auto_2368258 ?auto_2368262 ) ) ( not ( = ?auto_2368258 ?auto_2368263 ) ) ( not ( = ?auto_2368258 ?auto_2368264 ) ) ( not ( = ?auto_2368258 ?auto_2368265 ) ) ( not ( = ?auto_2368258 ?auto_2368266 ) ) ( not ( = ?auto_2368258 ?auto_2368267 ) ) ( not ( = ?auto_2368258 ?auto_2368269 ) ) ( not ( = ?auto_2368259 ?auto_2368260 ) ) ( not ( = ?auto_2368259 ?auto_2368261 ) ) ( not ( = ?auto_2368259 ?auto_2368262 ) ) ( not ( = ?auto_2368259 ?auto_2368263 ) ) ( not ( = ?auto_2368259 ?auto_2368264 ) ) ( not ( = ?auto_2368259 ?auto_2368265 ) ) ( not ( = ?auto_2368259 ?auto_2368266 ) ) ( not ( = ?auto_2368259 ?auto_2368267 ) ) ( not ( = ?auto_2368259 ?auto_2368269 ) ) ( not ( = ?auto_2368260 ?auto_2368261 ) ) ( not ( = ?auto_2368260 ?auto_2368262 ) ) ( not ( = ?auto_2368260 ?auto_2368263 ) ) ( not ( = ?auto_2368260 ?auto_2368264 ) ) ( not ( = ?auto_2368260 ?auto_2368265 ) ) ( not ( = ?auto_2368260 ?auto_2368266 ) ) ( not ( = ?auto_2368260 ?auto_2368267 ) ) ( not ( = ?auto_2368260 ?auto_2368269 ) ) ( not ( = ?auto_2368261 ?auto_2368262 ) ) ( not ( = ?auto_2368261 ?auto_2368263 ) ) ( not ( = ?auto_2368261 ?auto_2368264 ) ) ( not ( = ?auto_2368261 ?auto_2368265 ) ) ( not ( = ?auto_2368261 ?auto_2368266 ) ) ( not ( = ?auto_2368261 ?auto_2368267 ) ) ( not ( = ?auto_2368261 ?auto_2368269 ) ) ( not ( = ?auto_2368262 ?auto_2368263 ) ) ( not ( = ?auto_2368262 ?auto_2368264 ) ) ( not ( = ?auto_2368262 ?auto_2368265 ) ) ( not ( = ?auto_2368262 ?auto_2368266 ) ) ( not ( = ?auto_2368262 ?auto_2368267 ) ) ( not ( = ?auto_2368262 ?auto_2368269 ) ) ( not ( = ?auto_2368263 ?auto_2368264 ) ) ( not ( = ?auto_2368263 ?auto_2368265 ) ) ( not ( = ?auto_2368263 ?auto_2368266 ) ) ( not ( = ?auto_2368263 ?auto_2368267 ) ) ( not ( = ?auto_2368263 ?auto_2368269 ) ) ( not ( = ?auto_2368264 ?auto_2368265 ) ) ( not ( = ?auto_2368264 ?auto_2368266 ) ) ( not ( = ?auto_2368264 ?auto_2368267 ) ) ( not ( = ?auto_2368264 ?auto_2368269 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2368265 ?auto_2368266 ?auto_2368267 )
      ( MAKE-16CRATE-VERIFY ?auto_2368252 ?auto_2368253 ?auto_2368254 ?auto_2368251 ?auto_2368255 ?auto_2368257 ?auto_2368256 ?auto_2368258 ?auto_2368259 ?auto_2368260 ?auto_2368261 ?auto_2368262 ?auto_2368263 ?auto_2368264 ?auto_2368265 ?auto_2368266 ?auto_2368267 ) )
  )

  ( :method MAKE-16CRATE
    :parameters
    (
      ?auto_2368501 - SURFACE
      ?auto_2368502 - SURFACE
      ?auto_2368503 - SURFACE
      ?auto_2368500 - SURFACE
      ?auto_2368504 - SURFACE
      ?auto_2368506 - SURFACE
      ?auto_2368505 - SURFACE
      ?auto_2368507 - SURFACE
      ?auto_2368508 - SURFACE
      ?auto_2368509 - SURFACE
      ?auto_2368510 - SURFACE
      ?auto_2368511 - SURFACE
      ?auto_2368512 - SURFACE
      ?auto_2368513 - SURFACE
      ?auto_2368514 - SURFACE
      ?auto_2368515 - SURFACE
      ?auto_2368516 - SURFACE
    )
    :vars
    (
      ?auto_2368517 - HOIST
      ?auto_2368519 - PLACE
      ?auto_2368522 - PLACE
      ?auto_2368520 - HOIST
      ?auto_2368521 - SURFACE
      ?auto_2368518 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2368517 ?auto_2368519 ) ( SURFACE-AT ?auto_2368515 ?auto_2368519 ) ( CLEAR ?auto_2368515 ) ( IS-CRATE ?auto_2368516 ) ( not ( = ?auto_2368515 ?auto_2368516 ) ) ( AVAILABLE ?auto_2368517 ) ( ON ?auto_2368515 ?auto_2368514 ) ( not ( = ?auto_2368514 ?auto_2368515 ) ) ( not ( = ?auto_2368514 ?auto_2368516 ) ) ( not ( = ?auto_2368522 ?auto_2368519 ) ) ( HOIST-AT ?auto_2368520 ?auto_2368522 ) ( not ( = ?auto_2368517 ?auto_2368520 ) ) ( AVAILABLE ?auto_2368520 ) ( SURFACE-AT ?auto_2368516 ?auto_2368522 ) ( ON ?auto_2368516 ?auto_2368521 ) ( CLEAR ?auto_2368516 ) ( not ( = ?auto_2368515 ?auto_2368521 ) ) ( not ( = ?auto_2368516 ?auto_2368521 ) ) ( not ( = ?auto_2368514 ?auto_2368521 ) ) ( TRUCK-AT ?auto_2368518 ?auto_2368519 ) ( ON ?auto_2368502 ?auto_2368501 ) ( ON ?auto_2368503 ?auto_2368502 ) ( ON ?auto_2368500 ?auto_2368503 ) ( ON ?auto_2368504 ?auto_2368500 ) ( ON ?auto_2368506 ?auto_2368504 ) ( ON ?auto_2368505 ?auto_2368506 ) ( ON ?auto_2368507 ?auto_2368505 ) ( ON ?auto_2368508 ?auto_2368507 ) ( ON ?auto_2368509 ?auto_2368508 ) ( ON ?auto_2368510 ?auto_2368509 ) ( ON ?auto_2368511 ?auto_2368510 ) ( ON ?auto_2368512 ?auto_2368511 ) ( ON ?auto_2368513 ?auto_2368512 ) ( ON ?auto_2368514 ?auto_2368513 ) ( not ( = ?auto_2368501 ?auto_2368502 ) ) ( not ( = ?auto_2368501 ?auto_2368503 ) ) ( not ( = ?auto_2368501 ?auto_2368500 ) ) ( not ( = ?auto_2368501 ?auto_2368504 ) ) ( not ( = ?auto_2368501 ?auto_2368506 ) ) ( not ( = ?auto_2368501 ?auto_2368505 ) ) ( not ( = ?auto_2368501 ?auto_2368507 ) ) ( not ( = ?auto_2368501 ?auto_2368508 ) ) ( not ( = ?auto_2368501 ?auto_2368509 ) ) ( not ( = ?auto_2368501 ?auto_2368510 ) ) ( not ( = ?auto_2368501 ?auto_2368511 ) ) ( not ( = ?auto_2368501 ?auto_2368512 ) ) ( not ( = ?auto_2368501 ?auto_2368513 ) ) ( not ( = ?auto_2368501 ?auto_2368514 ) ) ( not ( = ?auto_2368501 ?auto_2368515 ) ) ( not ( = ?auto_2368501 ?auto_2368516 ) ) ( not ( = ?auto_2368501 ?auto_2368521 ) ) ( not ( = ?auto_2368502 ?auto_2368503 ) ) ( not ( = ?auto_2368502 ?auto_2368500 ) ) ( not ( = ?auto_2368502 ?auto_2368504 ) ) ( not ( = ?auto_2368502 ?auto_2368506 ) ) ( not ( = ?auto_2368502 ?auto_2368505 ) ) ( not ( = ?auto_2368502 ?auto_2368507 ) ) ( not ( = ?auto_2368502 ?auto_2368508 ) ) ( not ( = ?auto_2368502 ?auto_2368509 ) ) ( not ( = ?auto_2368502 ?auto_2368510 ) ) ( not ( = ?auto_2368502 ?auto_2368511 ) ) ( not ( = ?auto_2368502 ?auto_2368512 ) ) ( not ( = ?auto_2368502 ?auto_2368513 ) ) ( not ( = ?auto_2368502 ?auto_2368514 ) ) ( not ( = ?auto_2368502 ?auto_2368515 ) ) ( not ( = ?auto_2368502 ?auto_2368516 ) ) ( not ( = ?auto_2368502 ?auto_2368521 ) ) ( not ( = ?auto_2368503 ?auto_2368500 ) ) ( not ( = ?auto_2368503 ?auto_2368504 ) ) ( not ( = ?auto_2368503 ?auto_2368506 ) ) ( not ( = ?auto_2368503 ?auto_2368505 ) ) ( not ( = ?auto_2368503 ?auto_2368507 ) ) ( not ( = ?auto_2368503 ?auto_2368508 ) ) ( not ( = ?auto_2368503 ?auto_2368509 ) ) ( not ( = ?auto_2368503 ?auto_2368510 ) ) ( not ( = ?auto_2368503 ?auto_2368511 ) ) ( not ( = ?auto_2368503 ?auto_2368512 ) ) ( not ( = ?auto_2368503 ?auto_2368513 ) ) ( not ( = ?auto_2368503 ?auto_2368514 ) ) ( not ( = ?auto_2368503 ?auto_2368515 ) ) ( not ( = ?auto_2368503 ?auto_2368516 ) ) ( not ( = ?auto_2368503 ?auto_2368521 ) ) ( not ( = ?auto_2368500 ?auto_2368504 ) ) ( not ( = ?auto_2368500 ?auto_2368506 ) ) ( not ( = ?auto_2368500 ?auto_2368505 ) ) ( not ( = ?auto_2368500 ?auto_2368507 ) ) ( not ( = ?auto_2368500 ?auto_2368508 ) ) ( not ( = ?auto_2368500 ?auto_2368509 ) ) ( not ( = ?auto_2368500 ?auto_2368510 ) ) ( not ( = ?auto_2368500 ?auto_2368511 ) ) ( not ( = ?auto_2368500 ?auto_2368512 ) ) ( not ( = ?auto_2368500 ?auto_2368513 ) ) ( not ( = ?auto_2368500 ?auto_2368514 ) ) ( not ( = ?auto_2368500 ?auto_2368515 ) ) ( not ( = ?auto_2368500 ?auto_2368516 ) ) ( not ( = ?auto_2368500 ?auto_2368521 ) ) ( not ( = ?auto_2368504 ?auto_2368506 ) ) ( not ( = ?auto_2368504 ?auto_2368505 ) ) ( not ( = ?auto_2368504 ?auto_2368507 ) ) ( not ( = ?auto_2368504 ?auto_2368508 ) ) ( not ( = ?auto_2368504 ?auto_2368509 ) ) ( not ( = ?auto_2368504 ?auto_2368510 ) ) ( not ( = ?auto_2368504 ?auto_2368511 ) ) ( not ( = ?auto_2368504 ?auto_2368512 ) ) ( not ( = ?auto_2368504 ?auto_2368513 ) ) ( not ( = ?auto_2368504 ?auto_2368514 ) ) ( not ( = ?auto_2368504 ?auto_2368515 ) ) ( not ( = ?auto_2368504 ?auto_2368516 ) ) ( not ( = ?auto_2368504 ?auto_2368521 ) ) ( not ( = ?auto_2368506 ?auto_2368505 ) ) ( not ( = ?auto_2368506 ?auto_2368507 ) ) ( not ( = ?auto_2368506 ?auto_2368508 ) ) ( not ( = ?auto_2368506 ?auto_2368509 ) ) ( not ( = ?auto_2368506 ?auto_2368510 ) ) ( not ( = ?auto_2368506 ?auto_2368511 ) ) ( not ( = ?auto_2368506 ?auto_2368512 ) ) ( not ( = ?auto_2368506 ?auto_2368513 ) ) ( not ( = ?auto_2368506 ?auto_2368514 ) ) ( not ( = ?auto_2368506 ?auto_2368515 ) ) ( not ( = ?auto_2368506 ?auto_2368516 ) ) ( not ( = ?auto_2368506 ?auto_2368521 ) ) ( not ( = ?auto_2368505 ?auto_2368507 ) ) ( not ( = ?auto_2368505 ?auto_2368508 ) ) ( not ( = ?auto_2368505 ?auto_2368509 ) ) ( not ( = ?auto_2368505 ?auto_2368510 ) ) ( not ( = ?auto_2368505 ?auto_2368511 ) ) ( not ( = ?auto_2368505 ?auto_2368512 ) ) ( not ( = ?auto_2368505 ?auto_2368513 ) ) ( not ( = ?auto_2368505 ?auto_2368514 ) ) ( not ( = ?auto_2368505 ?auto_2368515 ) ) ( not ( = ?auto_2368505 ?auto_2368516 ) ) ( not ( = ?auto_2368505 ?auto_2368521 ) ) ( not ( = ?auto_2368507 ?auto_2368508 ) ) ( not ( = ?auto_2368507 ?auto_2368509 ) ) ( not ( = ?auto_2368507 ?auto_2368510 ) ) ( not ( = ?auto_2368507 ?auto_2368511 ) ) ( not ( = ?auto_2368507 ?auto_2368512 ) ) ( not ( = ?auto_2368507 ?auto_2368513 ) ) ( not ( = ?auto_2368507 ?auto_2368514 ) ) ( not ( = ?auto_2368507 ?auto_2368515 ) ) ( not ( = ?auto_2368507 ?auto_2368516 ) ) ( not ( = ?auto_2368507 ?auto_2368521 ) ) ( not ( = ?auto_2368508 ?auto_2368509 ) ) ( not ( = ?auto_2368508 ?auto_2368510 ) ) ( not ( = ?auto_2368508 ?auto_2368511 ) ) ( not ( = ?auto_2368508 ?auto_2368512 ) ) ( not ( = ?auto_2368508 ?auto_2368513 ) ) ( not ( = ?auto_2368508 ?auto_2368514 ) ) ( not ( = ?auto_2368508 ?auto_2368515 ) ) ( not ( = ?auto_2368508 ?auto_2368516 ) ) ( not ( = ?auto_2368508 ?auto_2368521 ) ) ( not ( = ?auto_2368509 ?auto_2368510 ) ) ( not ( = ?auto_2368509 ?auto_2368511 ) ) ( not ( = ?auto_2368509 ?auto_2368512 ) ) ( not ( = ?auto_2368509 ?auto_2368513 ) ) ( not ( = ?auto_2368509 ?auto_2368514 ) ) ( not ( = ?auto_2368509 ?auto_2368515 ) ) ( not ( = ?auto_2368509 ?auto_2368516 ) ) ( not ( = ?auto_2368509 ?auto_2368521 ) ) ( not ( = ?auto_2368510 ?auto_2368511 ) ) ( not ( = ?auto_2368510 ?auto_2368512 ) ) ( not ( = ?auto_2368510 ?auto_2368513 ) ) ( not ( = ?auto_2368510 ?auto_2368514 ) ) ( not ( = ?auto_2368510 ?auto_2368515 ) ) ( not ( = ?auto_2368510 ?auto_2368516 ) ) ( not ( = ?auto_2368510 ?auto_2368521 ) ) ( not ( = ?auto_2368511 ?auto_2368512 ) ) ( not ( = ?auto_2368511 ?auto_2368513 ) ) ( not ( = ?auto_2368511 ?auto_2368514 ) ) ( not ( = ?auto_2368511 ?auto_2368515 ) ) ( not ( = ?auto_2368511 ?auto_2368516 ) ) ( not ( = ?auto_2368511 ?auto_2368521 ) ) ( not ( = ?auto_2368512 ?auto_2368513 ) ) ( not ( = ?auto_2368512 ?auto_2368514 ) ) ( not ( = ?auto_2368512 ?auto_2368515 ) ) ( not ( = ?auto_2368512 ?auto_2368516 ) ) ( not ( = ?auto_2368512 ?auto_2368521 ) ) ( not ( = ?auto_2368513 ?auto_2368514 ) ) ( not ( = ?auto_2368513 ?auto_2368515 ) ) ( not ( = ?auto_2368513 ?auto_2368516 ) ) ( not ( = ?auto_2368513 ?auto_2368521 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2368514 ?auto_2368515 ?auto_2368516 )
      ( MAKE-16CRATE-VERIFY ?auto_2368501 ?auto_2368502 ?auto_2368503 ?auto_2368500 ?auto_2368504 ?auto_2368506 ?auto_2368505 ?auto_2368507 ?auto_2368508 ?auto_2368509 ?auto_2368510 ?auto_2368511 ?auto_2368512 ?auto_2368513 ?auto_2368514 ?auto_2368515 ?auto_2368516 ) )
  )

  ( :method MAKE-16CRATE
    :parameters
    (
      ?auto_2368750 - SURFACE
      ?auto_2368751 - SURFACE
      ?auto_2368752 - SURFACE
      ?auto_2368749 - SURFACE
      ?auto_2368753 - SURFACE
      ?auto_2368755 - SURFACE
      ?auto_2368754 - SURFACE
      ?auto_2368756 - SURFACE
      ?auto_2368757 - SURFACE
      ?auto_2368758 - SURFACE
      ?auto_2368759 - SURFACE
      ?auto_2368760 - SURFACE
      ?auto_2368761 - SURFACE
      ?auto_2368762 - SURFACE
      ?auto_2368763 - SURFACE
      ?auto_2368764 - SURFACE
      ?auto_2368765 - SURFACE
    )
    :vars
    (
      ?auto_2368771 - HOIST
      ?auto_2368769 - PLACE
      ?auto_2368767 - PLACE
      ?auto_2368768 - HOIST
      ?auto_2368766 - SURFACE
      ?auto_2368770 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2368771 ?auto_2368769 ) ( IS-CRATE ?auto_2368765 ) ( not ( = ?auto_2368764 ?auto_2368765 ) ) ( not ( = ?auto_2368763 ?auto_2368764 ) ) ( not ( = ?auto_2368763 ?auto_2368765 ) ) ( not ( = ?auto_2368767 ?auto_2368769 ) ) ( HOIST-AT ?auto_2368768 ?auto_2368767 ) ( not ( = ?auto_2368771 ?auto_2368768 ) ) ( AVAILABLE ?auto_2368768 ) ( SURFACE-AT ?auto_2368765 ?auto_2368767 ) ( ON ?auto_2368765 ?auto_2368766 ) ( CLEAR ?auto_2368765 ) ( not ( = ?auto_2368764 ?auto_2368766 ) ) ( not ( = ?auto_2368765 ?auto_2368766 ) ) ( not ( = ?auto_2368763 ?auto_2368766 ) ) ( TRUCK-AT ?auto_2368770 ?auto_2368769 ) ( SURFACE-AT ?auto_2368763 ?auto_2368769 ) ( CLEAR ?auto_2368763 ) ( LIFTING ?auto_2368771 ?auto_2368764 ) ( IS-CRATE ?auto_2368764 ) ( ON ?auto_2368751 ?auto_2368750 ) ( ON ?auto_2368752 ?auto_2368751 ) ( ON ?auto_2368749 ?auto_2368752 ) ( ON ?auto_2368753 ?auto_2368749 ) ( ON ?auto_2368755 ?auto_2368753 ) ( ON ?auto_2368754 ?auto_2368755 ) ( ON ?auto_2368756 ?auto_2368754 ) ( ON ?auto_2368757 ?auto_2368756 ) ( ON ?auto_2368758 ?auto_2368757 ) ( ON ?auto_2368759 ?auto_2368758 ) ( ON ?auto_2368760 ?auto_2368759 ) ( ON ?auto_2368761 ?auto_2368760 ) ( ON ?auto_2368762 ?auto_2368761 ) ( ON ?auto_2368763 ?auto_2368762 ) ( not ( = ?auto_2368750 ?auto_2368751 ) ) ( not ( = ?auto_2368750 ?auto_2368752 ) ) ( not ( = ?auto_2368750 ?auto_2368749 ) ) ( not ( = ?auto_2368750 ?auto_2368753 ) ) ( not ( = ?auto_2368750 ?auto_2368755 ) ) ( not ( = ?auto_2368750 ?auto_2368754 ) ) ( not ( = ?auto_2368750 ?auto_2368756 ) ) ( not ( = ?auto_2368750 ?auto_2368757 ) ) ( not ( = ?auto_2368750 ?auto_2368758 ) ) ( not ( = ?auto_2368750 ?auto_2368759 ) ) ( not ( = ?auto_2368750 ?auto_2368760 ) ) ( not ( = ?auto_2368750 ?auto_2368761 ) ) ( not ( = ?auto_2368750 ?auto_2368762 ) ) ( not ( = ?auto_2368750 ?auto_2368763 ) ) ( not ( = ?auto_2368750 ?auto_2368764 ) ) ( not ( = ?auto_2368750 ?auto_2368765 ) ) ( not ( = ?auto_2368750 ?auto_2368766 ) ) ( not ( = ?auto_2368751 ?auto_2368752 ) ) ( not ( = ?auto_2368751 ?auto_2368749 ) ) ( not ( = ?auto_2368751 ?auto_2368753 ) ) ( not ( = ?auto_2368751 ?auto_2368755 ) ) ( not ( = ?auto_2368751 ?auto_2368754 ) ) ( not ( = ?auto_2368751 ?auto_2368756 ) ) ( not ( = ?auto_2368751 ?auto_2368757 ) ) ( not ( = ?auto_2368751 ?auto_2368758 ) ) ( not ( = ?auto_2368751 ?auto_2368759 ) ) ( not ( = ?auto_2368751 ?auto_2368760 ) ) ( not ( = ?auto_2368751 ?auto_2368761 ) ) ( not ( = ?auto_2368751 ?auto_2368762 ) ) ( not ( = ?auto_2368751 ?auto_2368763 ) ) ( not ( = ?auto_2368751 ?auto_2368764 ) ) ( not ( = ?auto_2368751 ?auto_2368765 ) ) ( not ( = ?auto_2368751 ?auto_2368766 ) ) ( not ( = ?auto_2368752 ?auto_2368749 ) ) ( not ( = ?auto_2368752 ?auto_2368753 ) ) ( not ( = ?auto_2368752 ?auto_2368755 ) ) ( not ( = ?auto_2368752 ?auto_2368754 ) ) ( not ( = ?auto_2368752 ?auto_2368756 ) ) ( not ( = ?auto_2368752 ?auto_2368757 ) ) ( not ( = ?auto_2368752 ?auto_2368758 ) ) ( not ( = ?auto_2368752 ?auto_2368759 ) ) ( not ( = ?auto_2368752 ?auto_2368760 ) ) ( not ( = ?auto_2368752 ?auto_2368761 ) ) ( not ( = ?auto_2368752 ?auto_2368762 ) ) ( not ( = ?auto_2368752 ?auto_2368763 ) ) ( not ( = ?auto_2368752 ?auto_2368764 ) ) ( not ( = ?auto_2368752 ?auto_2368765 ) ) ( not ( = ?auto_2368752 ?auto_2368766 ) ) ( not ( = ?auto_2368749 ?auto_2368753 ) ) ( not ( = ?auto_2368749 ?auto_2368755 ) ) ( not ( = ?auto_2368749 ?auto_2368754 ) ) ( not ( = ?auto_2368749 ?auto_2368756 ) ) ( not ( = ?auto_2368749 ?auto_2368757 ) ) ( not ( = ?auto_2368749 ?auto_2368758 ) ) ( not ( = ?auto_2368749 ?auto_2368759 ) ) ( not ( = ?auto_2368749 ?auto_2368760 ) ) ( not ( = ?auto_2368749 ?auto_2368761 ) ) ( not ( = ?auto_2368749 ?auto_2368762 ) ) ( not ( = ?auto_2368749 ?auto_2368763 ) ) ( not ( = ?auto_2368749 ?auto_2368764 ) ) ( not ( = ?auto_2368749 ?auto_2368765 ) ) ( not ( = ?auto_2368749 ?auto_2368766 ) ) ( not ( = ?auto_2368753 ?auto_2368755 ) ) ( not ( = ?auto_2368753 ?auto_2368754 ) ) ( not ( = ?auto_2368753 ?auto_2368756 ) ) ( not ( = ?auto_2368753 ?auto_2368757 ) ) ( not ( = ?auto_2368753 ?auto_2368758 ) ) ( not ( = ?auto_2368753 ?auto_2368759 ) ) ( not ( = ?auto_2368753 ?auto_2368760 ) ) ( not ( = ?auto_2368753 ?auto_2368761 ) ) ( not ( = ?auto_2368753 ?auto_2368762 ) ) ( not ( = ?auto_2368753 ?auto_2368763 ) ) ( not ( = ?auto_2368753 ?auto_2368764 ) ) ( not ( = ?auto_2368753 ?auto_2368765 ) ) ( not ( = ?auto_2368753 ?auto_2368766 ) ) ( not ( = ?auto_2368755 ?auto_2368754 ) ) ( not ( = ?auto_2368755 ?auto_2368756 ) ) ( not ( = ?auto_2368755 ?auto_2368757 ) ) ( not ( = ?auto_2368755 ?auto_2368758 ) ) ( not ( = ?auto_2368755 ?auto_2368759 ) ) ( not ( = ?auto_2368755 ?auto_2368760 ) ) ( not ( = ?auto_2368755 ?auto_2368761 ) ) ( not ( = ?auto_2368755 ?auto_2368762 ) ) ( not ( = ?auto_2368755 ?auto_2368763 ) ) ( not ( = ?auto_2368755 ?auto_2368764 ) ) ( not ( = ?auto_2368755 ?auto_2368765 ) ) ( not ( = ?auto_2368755 ?auto_2368766 ) ) ( not ( = ?auto_2368754 ?auto_2368756 ) ) ( not ( = ?auto_2368754 ?auto_2368757 ) ) ( not ( = ?auto_2368754 ?auto_2368758 ) ) ( not ( = ?auto_2368754 ?auto_2368759 ) ) ( not ( = ?auto_2368754 ?auto_2368760 ) ) ( not ( = ?auto_2368754 ?auto_2368761 ) ) ( not ( = ?auto_2368754 ?auto_2368762 ) ) ( not ( = ?auto_2368754 ?auto_2368763 ) ) ( not ( = ?auto_2368754 ?auto_2368764 ) ) ( not ( = ?auto_2368754 ?auto_2368765 ) ) ( not ( = ?auto_2368754 ?auto_2368766 ) ) ( not ( = ?auto_2368756 ?auto_2368757 ) ) ( not ( = ?auto_2368756 ?auto_2368758 ) ) ( not ( = ?auto_2368756 ?auto_2368759 ) ) ( not ( = ?auto_2368756 ?auto_2368760 ) ) ( not ( = ?auto_2368756 ?auto_2368761 ) ) ( not ( = ?auto_2368756 ?auto_2368762 ) ) ( not ( = ?auto_2368756 ?auto_2368763 ) ) ( not ( = ?auto_2368756 ?auto_2368764 ) ) ( not ( = ?auto_2368756 ?auto_2368765 ) ) ( not ( = ?auto_2368756 ?auto_2368766 ) ) ( not ( = ?auto_2368757 ?auto_2368758 ) ) ( not ( = ?auto_2368757 ?auto_2368759 ) ) ( not ( = ?auto_2368757 ?auto_2368760 ) ) ( not ( = ?auto_2368757 ?auto_2368761 ) ) ( not ( = ?auto_2368757 ?auto_2368762 ) ) ( not ( = ?auto_2368757 ?auto_2368763 ) ) ( not ( = ?auto_2368757 ?auto_2368764 ) ) ( not ( = ?auto_2368757 ?auto_2368765 ) ) ( not ( = ?auto_2368757 ?auto_2368766 ) ) ( not ( = ?auto_2368758 ?auto_2368759 ) ) ( not ( = ?auto_2368758 ?auto_2368760 ) ) ( not ( = ?auto_2368758 ?auto_2368761 ) ) ( not ( = ?auto_2368758 ?auto_2368762 ) ) ( not ( = ?auto_2368758 ?auto_2368763 ) ) ( not ( = ?auto_2368758 ?auto_2368764 ) ) ( not ( = ?auto_2368758 ?auto_2368765 ) ) ( not ( = ?auto_2368758 ?auto_2368766 ) ) ( not ( = ?auto_2368759 ?auto_2368760 ) ) ( not ( = ?auto_2368759 ?auto_2368761 ) ) ( not ( = ?auto_2368759 ?auto_2368762 ) ) ( not ( = ?auto_2368759 ?auto_2368763 ) ) ( not ( = ?auto_2368759 ?auto_2368764 ) ) ( not ( = ?auto_2368759 ?auto_2368765 ) ) ( not ( = ?auto_2368759 ?auto_2368766 ) ) ( not ( = ?auto_2368760 ?auto_2368761 ) ) ( not ( = ?auto_2368760 ?auto_2368762 ) ) ( not ( = ?auto_2368760 ?auto_2368763 ) ) ( not ( = ?auto_2368760 ?auto_2368764 ) ) ( not ( = ?auto_2368760 ?auto_2368765 ) ) ( not ( = ?auto_2368760 ?auto_2368766 ) ) ( not ( = ?auto_2368761 ?auto_2368762 ) ) ( not ( = ?auto_2368761 ?auto_2368763 ) ) ( not ( = ?auto_2368761 ?auto_2368764 ) ) ( not ( = ?auto_2368761 ?auto_2368765 ) ) ( not ( = ?auto_2368761 ?auto_2368766 ) ) ( not ( = ?auto_2368762 ?auto_2368763 ) ) ( not ( = ?auto_2368762 ?auto_2368764 ) ) ( not ( = ?auto_2368762 ?auto_2368765 ) ) ( not ( = ?auto_2368762 ?auto_2368766 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2368763 ?auto_2368764 ?auto_2368765 )
      ( MAKE-16CRATE-VERIFY ?auto_2368750 ?auto_2368751 ?auto_2368752 ?auto_2368749 ?auto_2368753 ?auto_2368755 ?auto_2368754 ?auto_2368756 ?auto_2368757 ?auto_2368758 ?auto_2368759 ?auto_2368760 ?auto_2368761 ?auto_2368762 ?auto_2368763 ?auto_2368764 ?auto_2368765 ) )
  )

  ( :method MAKE-16CRATE
    :parameters
    (
      ?auto_2368999 - SURFACE
      ?auto_2369000 - SURFACE
      ?auto_2369001 - SURFACE
      ?auto_2368998 - SURFACE
      ?auto_2369002 - SURFACE
      ?auto_2369004 - SURFACE
      ?auto_2369003 - SURFACE
      ?auto_2369005 - SURFACE
      ?auto_2369006 - SURFACE
      ?auto_2369007 - SURFACE
      ?auto_2369008 - SURFACE
      ?auto_2369009 - SURFACE
      ?auto_2369010 - SURFACE
      ?auto_2369011 - SURFACE
      ?auto_2369012 - SURFACE
      ?auto_2369013 - SURFACE
      ?auto_2369014 - SURFACE
    )
    :vars
    (
      ?auto_2369018 - HOIST
      ?auto_2369017 - PLACE
      ?auto_2369019 - PLACE
      ?auto_2369016 - HOIST
      ?auto_2369015 - SURFACE
      ?auto_2369020 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2369018 ?auto_2369017 ) ( IS-CRATE ?auto_2369014 ) ( not ( = ?auto_2369013 ?auto_2369014 ) ) ( not ( = ?auto_2369012 ?auto_2369013 ) ) ( not ( = ?auto_2369012 ?auto_2369014 ) ) ( not ( = ?auto_2369019 ?auto_2369017 ) ) ( HOIST-AT ?auto_2369016 ?auto_2369019 ) ( not ( = ?auto_2369018 ?auto_2369016 ) ) ( AVAILABLE ?auto_2369016 ) ( SURFACE-AT ?auto_2369014 ?auto_2369019 ) ( ON ?auto_2369014 ?auto_2369015 ) ( CLEAR ?auto_2369014 ) ( not ( = ?auto_2369013 ?auto_2369015 ) ) ( not ( = ?auto_2369014 ?auto_2369015 ) ) ( not ( = ?auto_2369012 ?auto_2369015 ) ) ( TRUCK-AT ?auto_2369020 ?auto_2369017 ) ( SURFACE-AT ?auto_2369012 ?auto_2369017 ) ( CLEAR ?auto_2369012 ) ( IS-CRATE ?auto_2369013 ) ( AVAILABLE ?auto_2369018 ) ( IN ?auto_2369013 ?auto_2369020 ) ( ON ?auto_2369000 ?auto_2368999 ) ( ON ?auto_2369001 ?auto_2369000 ) ( ON ?auto_2368998 ?auto_2369001 ) ( ON ?auto_2369002 ?auto_2368998 ) ( ON ?auto_2369004 ?auto_2369002 ) ( ON ?auto_2369003 ?auto_2369004 ) ( ON ?auto_2369005 ?auto_2369003 ) ( ON ?auto_2369006 ?auto_2369005 ) ( ON ?auto_2369007 ?auto_2369006 ) ( ON ?auto_2369008 ?auto_2369007 ) ( ON ?auto_2369009 ?auto_2369008 ) ( ON ?auto_2369010 ?auto_2369009 ) ( ON ?auto_2369011 ?auto_2369010 ) ( ON ?auto_2369012 ?auto_2369011 ) ( not ( = ?auto_2368999 ?auto_2369000 ) ) ( not ( = ?auto_2368999 ?auto_2369001 ) ) ( not ( = ?auto_2368999 ?auto_2368998 ) ) ( not ( = ?auto_2368999 ?auto_2369002 ) ) ( not ( = ?auto_2368999 ?auto_2369004 ) ) ( not ( = ?auto_2368999 ?auto_2369003 ) ) ( not ( = ?auto_2368999 ?auto_2369005 ) ) ( not ( = ?auto_2368999 ?auto_2369006 ) ) ( not ( = ?auto_2368999 ?auto_2369007 ) ) ( not ( = ?auto_2368999 ?auto_2369008 ) ) ( not ( = ?auto_2368999 ?auto_2369009 ) ) ( not ( = ?auto_2368999 ?auto_2369010 ) ) ( not ( = ?auto_2368999 ?auto_2369011 ) ) ( not ( = ?auto_2368999 ?auto_2369012 ) ) ( not ( = ?auto_2368999 ?auto_2369013 ) ) ( not ( = ?auto_2368999 ?auto_2369014 ) ) ( not ( = ?auto_2368999 ?auto_2369015 ) ) ( not ( = ?auto_2369000 ?auto_2369001 ) ) ( not ( = ?auto_2369000 ?auto_2368998 ) ) ( not ( = ?auto_2369000 ?auto_2369002 ) ) ( not ( = ?auto_2369000 ?auto_2369004 ) ) ( not ( = ?auto_2369000 ?auto_2369003 ) ) ( not ( = ?auto_2369000 ?auto_2369005 ) ) ( not ( = ?auto_2369000 ?auto_2369006 ) ) ( not ( = ?auto_2369000 ?auto_2369007 ) ) ( not ( = ?auto_2369000 ?auto_2369008 ) ) ( not ( = ?auto_2369000 ?auto_2369009 ) ) ( not ( = ?auto_2369000 ?auto_2369010 ) ) ( not ( = ?auto_2369000 ?auto_2369011 ) ) ( not ( = ?auto_2369000 ?auto_2369012 ) ) ( not ( = ?auto_2369000 ?auto_2369013 ) ) ( not ( = ?auto_2369000 ?auto_2369014 ) ) ( not ( = ?auto_2369000 ?auto_2369015 ) ) ( not ( = ?auto_2369001 ?auto_2368998 ) ) ( not ( = ?auto_2369001 ?auto_2369002 ) ) ( not ( = ?auto_2369001 ?auto_2369004 ) ) ( not ( = ?auto_2369001 ?auto_2369003 ) ) ( not ( = ?auto_2369001 ?auto_2369005 ) ) ( not ( = ?auto_2369001 ?auto_2369006 ) ) ( not ( = ?auto_2369001 ?auto_2369007 ) ) ( not ( = ?auto_2369001 ?auto_2369008 ) ) ( not ( = ?auto_2369001 ?auto_2369009 ) ) ( not ( = ?auto_2369001 ?auto_2369010 ) ) ( not ( = ?auto_2369001 ?auto_2369011 ) ) ( not ( = ?auto_2369001 ?auto_2369012 ) ) ( not ( = ?auto_2369001 ?auto_2369013 ) ) ( not ( = ?auto_2369001 ?auto_2369014 ) ) ( not ( = ?auto_2369001 ?auto_2369015 ) ) ( not ( = ?auto_2368998 ?auto_2369002 ) ) ( not ( = ?auto_2368998 ?auto_2369004 ) ) ( not ( = ?auto_2368998 ?auto_2369003 ) ) ( not ( = ?auto_2368998 ?auto_2369005 ) ) ( not ( = ?auto_2368998 ?auto_2369006 ) ) ( not ( = ?auto_2368998 ?auto_2369007 ) ) ( not ( = ?auto_2368998 ?auto_2369008 ) ) ( not ( = ?auto_2368998 ?auto_2369009 ) ) ( not ( = ?auto_2368998 ?auto_2369010 ) ) ( not ( = ?auto_2368998 ?auto_2369011 ) ) ( not ( = ?auto_2368998 ?auto_2369012 ) ) ( not ( = ?auto_2368998 ?auto_2369013 ) ) ( not ( = ?auto_2368998 ?auto_2369014 ) ) ( not ( = ?auto_2368998 ?auto_2369015 ) ) ( not ( = ?auto_2369002 ?auto_2369004 ) ) ( not ( = ?auto_2369002 ?auto_2369003 ) ) ( not ( = ?auto_2369002 ?auto_2369005 ) ) ( not ( = ?auto_2369002 ?auto_2369006 ) ) ( not ( = ?auto_2369002 ?auto_2369007 ) ) ( not ( = ?auto_2369002 ?auto_2369008 ) ) ( not ( = ?auto_2369002 ?auto_2369009 ) ) ( not ( = ?auto_2369002 ?auto_2369010 ) ) ( not ( = ?auto_2369002 ?auto_2369011 ) ) ( not ( = ?auto_2369002 ?auto_2369012 ) ) ( not ( = ?auto_2369002 ?auto_2369013 ) ) ( not ( = ?auto_2369002 ?auto_2369014 ) ) ( not ( = ?auto_2369002 ?auto_2369015 ) ) ( not ( = ?auto_2369004 ?auto_2369003 ) ) ( not ( = ?auto_2369004 ?auto_2369005 ) ) ( not ( = ?auto_2369004 ?auto_2369006 ) ) ( not ( = ?auto_2369004 ?auto_2369007 ) ) ( not ( = ?auto_2369004 ?auto_2369008 ) ) ( not ( = ?auto_2369004 ?auto_2369009 ) ) ( not ( = ?auto_2369004 ?auto_2369010 ) ) ( not ( = ?auto_2369004 ?auto_2369011 ) ) ( not ( = ?auto_2369004 ?auto_2369012 ) ) ( not ( = ?auto_2369004 ?auto_2369013 ) ) ( not ( = ?auto_2369004 ?auto_2369014 ) ) ( not ( = ?auto_2369004 ?auto_2369015 ) ) ( not ( = ?auto_2369003 ?auto_2369005 ) ) ( not ( = ?auto_2369003 ?auto_2369006 ) ) ( not ( = ?auto_2369003 ?auto_2369007 ) ) ( not ( = ?auto_2369003 ?auto_2369008 ) ) ( not ( = ?auto_2369003 ?auto_2369009 ) ) ( not ( = ?auto_2369003 ?auto_2369010 ) ) ( not ( = ?auto_2369003 ?auto_2369011 ) ) ( not ( = ?auto_2369003 ?auto_2369012 ) ) ( not ( = ?auto_2369003 ?auto_2369013 ) ) ( not ( = ?auto_2369003 ?auto_2369014 ) ) ( not ( = ?auto_2369003 ?auto_2369015 ) ) ( not ( = ?auto_2369005 ?auto_2369006 ) ) ( not ( = ?auto_2369005 ?auto_2369007 ) ) ( not ( = ?auto_2369005 ?auto_2369008 ) ) ( not ( = ?auto_2369005 ?auto_2369009 ) ) ( not ( = ?auto_2369005 ?auto_2369010 ) ) ( not ( = ?auto_2369005 ?auto_2369011 ) ) ( not ( = ?auto_2369005 ?auto_2369012 ) ) ( not ( = ?auto_2369005 ?auto_2369013 ) ) ( not ( = ?auto_2369005 ?auto_2369014 ) ) ( not ( = ?auto_2369005 ?auto_2369015 ) ) ( not ( = ?auto_2369006 ?auto_2369007 ) ) ( not ( = ?auto_2369006 ?auto_2369008 ) ) ( not ( = ?auto_2369006 ?auto_2369009 ) ) ( not ( = ?auto_2369006 ?auto_2369010 ) ) ( not ( = ?auto_2369006 ?auto_2369011 ) ) ( not ( = ?auto_2369006 ?auto_2369012 ) ) ( not ( = ?auto_2369006 ?auto_2369013 ) ) ( not ( = ?auto_2369006 ?auto_2369014 ) ) ( not ( = ?auto_2369006 ?auto_2369015 ) ) ( not ( = ?auto_2369007 ?auto_2369008 ) ) ( not ( = ?auto_2369007 ?auto_2369009 ) ) ( not ( = ?auto_2369007 ?auto_2369010 ) ) ( not ( = ?auto_2369007 ?auto_2369011 ) ) ( not ( = ?auto_2369007 ?auto_2369012 ) ) ( not ( = ?auto_2369007 ?auto_2369013 ) ) ( not ( = ?auto_2369007 ?auto_2369014 ) ) ( not ( = ?auto_2369007 ?auto_2369015 ) ) ( not ( = ?auto_2369008 ?auto_2369009 ) ) ( not ( = ?auto_2369008 ?auto_2369010 ) ) ( not ( = ?auto_2369008 ?auto_2369011 ) ) ( not ( = ?auto_2369008 ?auto_2369012 ) ) ( not ( = ?auto_2369008 ?auto_2369013 ) ) ( not ( = ?auto_2369008 ?auto_2369014 ) ) ( not ( = ?auto_2369008 ?auto_2369015 ) ) ( not ( = ?auto_2369009 ?auto_2369010 ) ) ( not ( = ?auto_2369009 ?auto_2369011 ) ) ( not ( = ?auto_2369009 ?auto_2369012 ) ) ( not ( = ?auto_2369009 ?auto_2369013 ) ) ( not ( = ?auto_2369009 ?auto_2369014 ) ) ( not ( = ?auto_2369009 ?auto_2369015 ) ) ( not ( = ?auto_2369010 ?auto_2369011 ) ) ( not ( = ?auto_2369010 ?auto_2369012 ) ) ( not ( = ?auto_2369010 ?auto_2369013 ) ) ( not ( = ?auto_2369010 ?auto_2369014 ) ) ( not ( = ?auto_2369010 ?auto_2369015 ) ) ( not ( = ?auto_2369011 ?auto_2369012 ) ) ( not ( = ?auto_2369011 ?auto_2369013 ) ) ( not ( = ?auto_2369011 ?auto_2369014 ) ) ( not ( = ?auto_2369011 ?auto_2369015 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2369012 ?auto_2369013 ?auto_2369014 )
      ( MAKE-16CRATE-VERIFY ?auto_2368999 ?auto_2369000 ?auto_2369001 ?auto_2368998 ?auto_2369002 ?auto_2369004 ?auto_2369003 ?auto_2369005 ?auto_2369006 ?auto_2369007 ?auto_2369008 ?auto_2369009 ?auto_2369010 ?auto_2369011 ?auto_2369012 ?auto_2369013 ?auto_2369014 ) )
  )

)

