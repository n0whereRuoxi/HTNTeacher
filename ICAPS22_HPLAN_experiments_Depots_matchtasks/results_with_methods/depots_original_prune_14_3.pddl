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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1427739 - SURFACE
      ?auto_1427740 - SURFACE
    )
    :vars
    (
      ?auto_1427741 - HOIST
      ?auto_1427742 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1427741 ?auto_1427742 ) ( SURFACE-AT ?auto_1427739 ?auto_1427742 ) ( CLEAR ?auto_1427739 ) ( LIFTING ?auto_1427741 ?auto_1427740 ) ( IS-CRATE ?auto_1427740 ) ( not ( = ?auto_1427739 ?auto_1427740 ) ) )
    :subtasks
    ( ( !DROP ?auto_1427741 ?auto_1427740 ?auto_1427739 ?auto_1427742 )
      ( MAKE-1CRATE-VERIFY ?auto_1427739 ?auto_1427740 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1427743 - SURFACE
      ?auto_1427744 - SURFACE
    )
    :vars
    (
      ?auto_1427745 - HOIST
      ?auto_1427746 - PLACE
      ?auto_1427747 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1427745 ?auto_1427746 ) ( SURFACE-AT ?auto_1427743 ?auto_1427746 ) ( CLEAR ?auto_1427743 ) ( IS-CRATE ?auto_1427744 ) ( not ( = ?auto_1427743 ?auto_1427744 ) ) ( TRUCK-AT ?auto_1427747 ?auto_1427746 ) ( AVAILABLE ?auto_1427745 ) ( IN ?auto_1427744 ?auto_1427747 ) )
    :subtasks
    ( ( !UNLOAD ?auto_1427745 ?auto_1427744 ?auto_1427747 ?auto_1427746 )
      ( MAKE-1CRATE ?auto_1427743 ?auto_1427744 )
      ( MAKE-1CRATE-VERIFY ?auto_1427743 ?auto_1427744 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1427748 - SURFACE
      ?auto_1427749 - SURFACE
    )
    :vars
    (
      ?auto_1427751 - HOIST
      ?auto_1427750 - PLACE
      ?auto_1427752 - TRUCK
      ?auto_1427753 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1427751 ?auto_1427750 ) ( SURFACE-AT ?auto_1427748 ?auto_1427750 ) ( CLEAR ?auto_1427748 ) ( IS-CRATE ?auto_1427749 ) ( not ( = ?auto_1427748 ?auto_1427749 ) ) ( AVAILABLE ?auto_1427751 ) ( IN ?auto_1427749 ?auto_1427752 ) ( TRUCK-AT ?auto_1427752 ?auto_1427753 ) ( not ( = ?auto_1427753 ?auto_1427750 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1427752 ?auto_1427753 ?auto_1427750 )
      ( MAKE-1CRATE ?auto_1427748 ?auto_1427749 )
      ( MAKE-1CRATE-VERIFY ?auto_1427748 ?auto_1427749 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1427754 - SURFACE
      ?auto_1427755 - SURFACE
    )
    :vars
    (
      ?auto_1427756 - HOIST
      ?auto_1427759 - PLACE
      ?auto_1427758 - TRUCK
      ?auto_1427757 - PLACE
      ?auto_1427760 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1427756 ?auto_1427759 ) ( SURFACE-AT ?auto_1427754 ?auto_1427759 ) ( CLEAR ?auto_1427754 ) ( IS-CRATE ?auto_1427755 ) ( not ( = ?auto_1427754 ?auto_1427755 ) ) ( AVAILABLE ?auto_1427756 ) ( TRUCK-AT ?auto_1427758 ?auto_1427757 ) ( not ( = ?auto_1427757 ?auto_1427759 ) ) ( HOIST-AT ?auto_1427760 ?auto_1427757 ) ( LIFTING ?auto_1427760 ?auto_1427755 ) ( not ( = ?auto_1427756 ?auto_1427760 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1427760 ?auto_1427755 ?auto_1427758 ?auto_1427757 )
      ( MAKE-1CRATE ?auto_1427754 ?auto_1427755 )
      ( MAKE-1CRATE-VERIFY ?auto_1427754 ?auto_1427755 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1427761 - SURFACE
      ?auto_1427762 - SURFACE
    )
    :vars
    (
      ?auto_1427765 - HOIST
      ?auto_1427767 - PLACE
      ?auto_1427766 - TRUCK
      ?auto_1427763 - PLACE
      ?auto_1427764 - HOIST
      ?auto_1427768 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1427765 ?auto_1427767 ) ( SURFACE-AT ?auto_1427761 ?auto_1427767 ) ( CLEAR ?auto_1427761 ) ( IS-CRATE ?auto_1427762 ) ( not ( = ?auto_1427761 ?auto_1427762 ) ) ( AVAILABLE ?auto_1427765 ) ( TRUCK-AT ?auto_1427766 ?auto_1427763 ) ( not ( = ?auto_1427763 ?auto_1427767 ) ) ( HOIST-AT ?auto_1427764 ?auto_1427763 ) ( not ( = ?auto_1427765 ?auto_1427764 ) ) ( AVAILABLE ?auto_1427764 ) ( SURFACE-AT ?auto_1427762 ?auto_1427763 ) ( ON ?auto_1427762 ?auto_1427768 ) ( CLEAR ?auto_1427762 ) ( not ( = ?auto_1427761 ?auto_1427768 ) ) ( not ( = ?auto_1427762 ?auto_1427768 ) ) )
    :subtasks
    ( ( !LIFT ?auto_1427764 ?auto_1427762 ?auto_1427768 ?auto_1427763 )
      ( MAKE-1CRATE ?auto_1427761 ?auto_1427762 )
      ( MAKE-1CRATE-VERIFY ?auto_1427761 ?auto_1427762 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1427769 - SURFACE
      ?auto_1427770 - SURFACE
    )
    :vars
    (
      ?auto_1427774 - HOIST
      ?auto_1427776 - PLACE
      ?auto_1427775 - PLACE
      ?auto_1427771 - HOIST
      ?auto_1427772 - SURFACE
      ?auto_1427773 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1427774 ?auto_1427776 ) ( SURFACE-AT ?auto_1427769 ?auto_1427776 ) ( CLEAR ?auto_1427769 ) ( IS-CRATE ?auto_1427770 ) ( not ( = ?auto_1427769 ?auto_1427770 ) ) ( AVAILABLE ?auto_1427774 ) ( not ( = ?auto_1427775 ?auto_1427776 ) ) ( HOIST-AT ?auto_1427771 ?auto_1427775 ) ( not ( = ?auto_1427774 ?auto_1427771 ) ) ( AVAILABLE ?auto_1427771 ) ( SURFACE-AT ?auto_1427770 ?auto_1427775 ) ( ON ?auto_1427770 ?auto_1427772 ) ( CLEAR ?auto_1427770 ) ( not ( = ?auto_1427769 ?auto_1427772 ) ) ( not ( = ?auto_1427770 ?auto_1427772 ) ) ( TRUCK-AT ?auto_1427773 ?auto_1427776 ) )
    :subtasks
    ( ( !DRIVE ?auto_1427773 ?auto_1427776 ?auto_1427775 )
      ( MAKE-1CRATE ?auto_1427769 ?auto_1427770 )
      ( MAKE-1CRATE-VERIFY ?auto_1427769 ?auto_1427770 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1427786 - SURFACE
      ?auto_1427787 - SURFACE
      ?auto_1427788 - SURFACE
    )
    :vars
    (
      ?auto_1427789 - HOIST
      ?auto_1427790 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1427789 ?auto_1427790 ) ( SURFACE-AT ?auto_1427787 ?auto_1427790 ) ( CLEAR ?auto_1427787 ) ( LIFTING ?auto_1427789 ?auto_1427788 ) ( IS-CRATE ?auto_1427788 ) ( not ( = ?auto_1427787 ?auto_1427788 ) ) ( ON ?auto_1427787 ?auto_1427786 ) ( not ( = ?auto_1427786 ?auto_1427787 ) ) ( not ( = ?auto_1427786 ?auto_1427788 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1427787 ?auto_1427788 )
      ( MAKE-2CRATE-VERIFY ?auto_1427786 ?auto_1427787 ?auto_1427788 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1427796 - SURFACE
      ?auto_1427797 - SURFACE
      ?auto_1427798 - SURFACE
    )
    :vars
    (
      ?auto_1427800 - HOIST
      ?auto_1427799 - PLACE
      ?auto_1427801 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1427800 ?auto_1427799 ) ( SURFACE-AT ?auto_1427797 ?auto_1427799 ) ( CLEAR ?auto_1427797 ) ( IS-CRATE ?auto_1427798 ) ( not ( = ?auto_1427797 ?auto_1427798 ) ) ( TRUCK-AT ?auto_1427801 ?auto_1427799 ) ( AVAILABLE ?auto_1427800 ) ( IN ?auto_1427798 ?auto_1427801 ) ( ON ?auto_1427797 ?auto_1427796 ) ( not ( = ?auto_1427796 ?auto_1427797 ) ) ( not ( = ?auto_1427796 ?auto_1427798 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1427797 ?auto_1427798 )
      ( MAKE-2CRATE-VERIFY ?auto_1427796 ?auto_1427797 ?auto_1427798 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1427802 - SURFACE
      ?auto_1427803 - SURFACE
    )
    :vars
    (
      ?auto_1427806 - HOIST
      ?auto_1427807 - PLACE
      ?auto_1427804 - TRUCK
      ?auto_1427805 - SURFACE
      ?auto_1427808 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1427806 ?auto_1427807 ) ( SURFACE-AT ?auto_1427802 ?auto_1427807 ) ( CLEAR ?auto_1427802 ) ( IS-CRATE ?auto_1427803 ) ( not ( = ?auto_1427802 ?auto_1427803 ) ) ( AVAILABLE ?auto_1427806 ) ( IN ?auto_1427803 ?auto_1427804 ) ( ON ?auto_1427802 ?auto_1427805 ) ( not ( = ?auto_1427805 ?auto_1427802 ) ) ( not ( = ?auto_1427805 ?auto_1427803 ) ) ( TRUCK-AT ?auto_1427804 ?auto_1427808 ) ( not ( = ?auto_1427808 ?auto_1427807 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1427804 ?auto_1427808 ?auto_1427807 )
      ( MAKE-2CRATE ?auto_1427805 ?auto_1427802 ?auto_1427803 )
      ( MAKE-1CRATE-VERIFY ?auto_1427802 ?auto_1427803 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1427809 - SURFACE
      ?auto_1427810 - SURFACE
      ?auto_1427811 - SURFACE
    )
    :vars
    (
      ?auto_1427814 - HOIST
      ?auto_1427812 - PLACE
      ?auto_1427815 - TRUCK
      ?auto_1427813 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1427814 ?auto_1427812 ) ( SURFACE-AT ?auto_1427810 ?auto_1427812 ) ( CLEAR ?auto_1427810 ) ( IS-CRATE ?auto_1427811 ) ( not ( = ?auto_1427810 ?auto_1427811 ) ) ( AVAILABLE ?auto_1427814 ) ( IN ?auto_1427811 ?auto_1427815 ) ( ON ?auto_1427810 ?auto_1427809 ) ( not ( = ?auto_1427809 ?auto_1427810 ) ) ( not ( = ?auto_1427809 ?auto_1427811 ) ) ( TRUCK-AT ?auto_1427815 ?auto_1427813 ) ( not ( = ?auto_1427813 ?auto_1427812 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1427810 ?auto_1427811 )
      ( MAKE-2CRATE-VERIFY ?auto_1427809 ?auto_1427810 ?auto_1427811 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1427816 - SURFACE
      ?auto_1427817 - SURFACE
    )
    :vars
    (
      ?auto_1427820 - HOIST
      ?auto_1427818 - PLACE
      ?auto_1427822 - SURFACE
      ?auto_1427821 - TRUCK
      ?auto_1427819 - PLACE
      ?auto_1427823 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1427820 ?auto_1427818 ) ( SURFACE-AT ?auto_1427816 ?auto_1427818 ) ( CLEAR ?auto_1427816 ) ( IS-CRATE ?auto_1427817 ) ( not ( = ?auto_1427816 ?auto_1427817 ) ) ( AVAILABLE ?auto_1427820 ) ( ON ?auto_1427816 ?auto_1427822 ) ( not ( = ?auto_1427822 ?auto_1427816 ) ) ( not ( = ?auto_1427822 ?auto_1427817 ) ) ( TRUCK-AT ?auto_1427821 ?auto_1427819 ) ( not ( = ?auto_1427819 ?auto_1427818 ) ) ( HOIST-AT ?auto_1427823 ?auto_1427819 ) ( LIFTING ?auto_1427823 ?auto_1427817 ) ( not ( = ?auto_1427820 ?auto_1427823 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1427823 ?auto_1427817 ?auto_1427821 ?auto_1427819 )
      ( MAKE-2CRATE ?auto_1427822 ?auto_1427816 ?auto_1427817 )
      ( MAKE-1CRATE-VERIFY ?auto_1427816 ?auto_1427817 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1427824 - SURFACE
      ?auto_1427825 - SURFACE
      ?auto_1427826 - SURFACE
    )
    :vars
    (
      ?auto_1427830 - HOIST
      ?auto_1427829 - PLACE
      ?auto_1427827 - TRUCK
      ?auto_1427831 - PLACE
      ?auto_1427828 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1427830 ?auto_1427829 ) ( SURFACE-AT ?auto_1427825 ?auto_1427829 ) ( CLEAR ?auto_1427825 ) ( IS-CRATE ?auto_1427826 ) ( not ( = ?auto_1427825 ?auto_1427826 ) ) ( AVAILABLE ?auto_1427830 ) ( ON ?auto_1427825 ?auto_1427824 ) ( not ( = ?auto_1427824 ?auto_1427825 ) ) ( not ( = ?auto_1427824 ?auto_1427826 ) ) ( TRUCK-AT ?auto_1427827 ?auto_1427831 ) ( not ( = ?auto_1427831 ?auto_1427829 ) ) ( HOIST-AT ?auto_1427828 ?auto_1427831 ) ( LIFTING ?auto_1427828 ?auto_1427826 ) ( not ( = ?auto_1427830 ?auto_1427828 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1427825 ?auto_1427826 )
      ( MAKE-2CRATE-VERIFY ?auto_1427824 ?auto_1427825 ?auto_1427826 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1427832 - SURFACE
      ?auto_1427833 - SURFACE
    )
    :vars
    (
      ?auto_1427834 - HOIST
      ?auto_1427836 - PLACE
      ?auto_1427839 - SURFACE
      ?auto_1427838 - TRUCK
      ?auto_1427835 - PLACE
      ?auto_1427837 - HOIST
      ?auto_1427840 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1427834 ?auto_1427836 ) ( SURFACE-AT ?auto_1427832 ?auto_1427836 ) ( CLEAR ?auto_1427832 ) ( IS-CRATE ?auto_1427833 ) ( not ( = ?auto_1427832 ?auto_1427833 ) ) ( AVAILABLE ?auto_1427834 ) ( ON ?auto_1427832 ?auto_1427839 ) ( not ( = ?auto_1427839 ?auto_1427832 ) ) ( not ( = ?auto_1427839 ?auto_1427833 ) ) ( TRUCK-AT ?auto_1427838 ?auto_1427835 ) ( not ( = ?auto_1427835 ?auto_1427836 ) ) ( HOIST-AT ?auto_1427837 ?auto_1427835 ) ( not ( = ?auto_1427834 ?auto_1427837 ) ) ( AVAILABLE ?auto_1427837 ) ( SURFACE-AT ?auto_1427833 ?auto_1427835 ) ( ON ?auto_1427833 ?auto_1427840 ) ( CLEAR ?auto_1427833 ) ( not ( = ?auto_1427832 ?auto_1427840 ) ) ( not ( = ?auto_1427833 ?auto_1427840 ) ) ( not ( = ?auto_1427839 ?auto_1427840 ) ) )
    :subtasks
    ( ( !LIFT ?auto_1427837 ?auto_1427833 ?auto_1427840 ?auto_1427835 )
      ( MAKE-2CRATE ?auto_1427839 ?auto_1427832 ?auto_1427833 )
      ( MAKE-1CRATE-VERIFY ?auto_1427832 ?auto_1427833 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1427841 - SURFACE
      ?auto_1427842 - SURFACE
      ?auto_1427843 - SURFACE
    )
    :vars
    (
      ?auto_1427844 - HOIST
      ?auto_1427846 - PLACE
      ?auto_1427849 - TRUCK
      ?auto_1427848 - PLACE
      ?auto_1427845 - HOIST
      ?auto_1427847 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1427844 ?auto_1427846 ) ( SURFACE-AT ?auto_1427842 ?auto_1427846 ) ( CLEAR ?auto_1427842 ) ( IS-CRATE ?auto_1427843 ) ( not ( = ?auto_1427842 ?auto_1427843 ) ) ( AVAILABLE ?auto_1427844 ) ( ON ?auto_1427842 ?auto_1427841 ) ( not ( = ?auto_1427841 ?auto_1427842 ) ) ( not ( = ?auto_1427841 ?auto_1427843 ) ) ( TRUCK-AT ?auto_1427849 ?auto_1427848 ) ( not ( = ?auto_1427848 ?auto_1427846 ) ) ( HOIST-AT ?auto_1427845 ?auto_1427848 ) ( not ( = ?auto_1427844 ?auto_1427845 ) ) ( AVAILABLE ?auto_1427845 ) ( SURFACE-AT ?auto_1427843 ?auto_1427848 ) ( ON ?auto_1427843 ?auto_1427847 ) ( CLEAR ?auto_1427843 ) ( not ( = ?auto_1427842 ?auto_1427847 ) ) ( not ( = ?auto_1427843 ?auto_1427847 ) ) ( not ( = ?auto_1427841 ?auto_1427847 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1427842 ?auto_1427843 )
      ( MAKE-2CRATE-VERIFY ?auto_1427841 ?auto_1427842 ?auto_1427843 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1427850 - SURFACE
      ?auto_1427851 - SURFACE
    )
    :vars
    (
      ?auto_1427854 - HOIST
      ?auto_1427857 - PLACE
      ?auto_1427855 - SURFACE
      ?auto_1427853 - PLACE
      ?auto_1427858 - HOIST
      ?auto_1427852 - SURFACE
      ?auto_1427856 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1427854 ?auto_1427857 ) ( SURFACE-AT ?auto_1427850 ?auto_1427857 ) ( CLEAR ?auto_1427850 ) ( IS-CRATE ?auto_1427851 ) ( not ( = ?auto_1427850 ?auto_1427851 ) ) ( AVAILABLE ?auto_1427854 ) ( ON ?auto_1427850 ?auto_1427855 ) ( not ( = ?auto_1427855 ?auto_1427850 ) ) ( not ( = ?auto_1427855 ?auto_1427851 ) ) ( not ( = ?auto_1427853 ?auto_1427857 ) ) ( HOIST-AT ?auto_1427858 ?auto_1427853 ) ( not ( = ?auto_1427854 ?auto_1427858 ) ) ( AVAILABLE ?auto_1427858 ) ( SURFACE-AT ?auto_1427851 ?auto_1427853 ) ( ON ?auto_1427851 ?auto_1427852 ) ( CLEAR ?auto_1427851 ) ( not ( = ?auto_1427850 ?auto_1427852 ) ) ( not ( = ?auto_1427851 ?auto_1427852 ) ) ( not ( = ?auto_1427855 ?auto_1427852 ) ) ( TRUCK-AT ?auto_1427856 ?auto_1427857 ) )
    :subtasks
    ( ( !DRIVE ?auto_1427856 ?auto_1427857 ?auto_1427853 )
      ( MAKE-2CRATE ?auto_1427855 ?auto_1427850 ?auto_1427851 )
      ( MAKE-1CRATE-VERIFY ?auto_1427850 ?auto_1427851 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1427859 - SURFACE
      ?auto_1427860 - SURFACE
      ?auto_1427861 - SURFACE
    )
    :vars
    (
      ?auto_1427862 - HOIST
      ?auto_1427867 - PLACE
      ?auto_1427863 - PLACE
      ?auto_1427865 - HOIST
      ?auto_1427866 - SURFACE
      ?auto_1427864 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1427862 ?auto_1427867 ) ( SURFACE-AT ?auto_1427860 ?auto_1427867 ) ( CLEAR ?auto_1427860 ) ( IS-CRATE ?auto_1427861 ) ( not ( = ?auto_1427860 ?auto_1427861 ) ) ( AVAILABLE ?auto_1427862 ) ( ON ?auto_1427860 ?auto_1427859 ) ( not ( = ?auto_1427859 ?auto_1427860 ) ) ( not ( = ?auto_1427859 ?auto_1427861 ) ) ( not ( = ?auto_1427863 ?auto_1427867 ) ) ( HOIST-AT ?auto_1427865 ?auto_1427863 ) ( not ( = ?auto_1427862 ?auto_1427865 ) ) ( AVAILABLE ?auto_1427865 ) ( SURFACE-AT ?auto_1427861 ?auto_1427863 ) ( ON ?auto_1427861 ?auto_1427866 ) ( CLEAR ?auto_1427861 ) ( not ( = ?auto_1427860 ?auto_1427866 ) ) ( not ( = ?auto_1427861 ?auto_1427866 ) ) ( not ( = ?auto_1427859 ?auto_1427866 ) ) ( TRUCK-AT ?auto_1427864 ?auto_1427867 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1427860 ?auto_1427861 )
      ( MAKE-2CRATE-VERIFY ?auto_1427859 ?auto_1427860 ?auto_1427861 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1427868 - SURFACE
      ?auto_1427869 - SURFACE
    )
    :vars
    (
      ?auto_1427870 - HOIST
      ?auto_1427873 - PLACE
      ?auto_1427871 - SURFACE
      ?auto_1427875 - PLACE
      ?auto_1427874 - HOIST
      ?auto_1427872 - SURFACE
      ?auto_1427876 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1427870 ?auto_1427873 ) ( IS-CRATE ?auto_1427869 ) ( not ( = ?auto_1427868 ?auto_1427869 ) ) ( not ( = ?auto_1427871 ?auto_1427868 ) ) ( not ( = ?auto_1427871 ?auto_1427869 ) ) ( not ( = ?auto_1427875 ?auto_1427873 ) ) ( HOIST-AT ?auto_1427874 ?auto_1427875 ) ( not ( = ?auto_1427870 ?auto_1427874 ) ) ( AVAILABLE ?auto_1427874 ) ( SURFACE-AT ?auto_1427869 ?auto_1427875 ) ( ON ?auto_1427869 ?auto_1427872 ) ( CLEAR ?auto_1427869 ) ( not ( = ?auto_1427868 ?auto_1427872 ) ) ( not ( = ?auto_1427869 ?auto_1427872 ) ) ( not ( = ?auto_1427871 ?auto_1427872 ) ) ( TRUCK-AT ?auto_1427876 ?auto_1427873 ) ( SURFACE-AT ?auto_1427871 ?auto_1427873 ) ( CLEAR ?auto_1427871 ) ( LIFTING ?auto_1427870 ?auto_1427868 ) ( IS-CRATE ?auto_1427868 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1427871 ?auto_1427868 )
      ( MAKE-2CRATE ?auto_1427871 ?auto_1427868 ?auto_1427869 )
      ( MAKE-1CRATE-VERIFY ?auto_1427868 ?auto_1427869 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1427877 - SURFACE
      ?auto_1427878 - SURFACE
      ?auto_1427879 - SURFACE
    )
    :vars
    (
      ?auto_1427882 - HOIST
      ?auto_1427885 - PLACE
      ?auto_1427884 - PLACE
      ?auto_1427881 - HOIST
      ?auto_1427883 - SURFACE
      ?auto_1427880 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1427882 ?auto_1427885 ) ( IS-CRATE ?auto_1427879 ) ( not ( = ?auto_1427878 ?auto_1427879 ) ) ( not ( = ?auto_1427877 ?auto_1427878 ) ) ( not ( = ?auto_1427877 ?auto_1427879 ) ) ( not ( = ?auto_1427884 ?auto_1427885 ) ) ( HOIST-AT ?auto_1427881 ?auto_1427884 ) ( not ( = ?auto_1427882 ?auto_1427881 ) ) ( AVAILABLE ?auto_1427881 ) ( SURFACE-AT ?auto_1427879 ?auto_1427884 ) ( ON ?auto_1427879 ?auto_1427883 ) ( CLEAR ?auto_1427879 ) ( not ( = ?auto_1427878 ?auto_1427883 ) ) ( not ( = ?auto_1427879 ?auto_1427883 ) ) ( not ( = ?auto_1427877 ?auto_1427883 ) ) ( TRUCK-AT ?auto_1427880 ?auto_1427885 ) ( SURFACE-AT ?auto_1427877 ?auto_1427885 ) ( CLEAR ?auto_1427877 ) ( LIFTING ?auto_1427882 ?auto_1427878 ) ( IS-CRATE ?auto_1427878 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1427878 ?auto_1427879 )
      ( MAKE-2CRATE-VERIFY ?auto_1427877 ?auto_1427878 ?auto_1427879 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1427886 - SURFACE
      ?auto_1427887 - SURFACE
    )
    :vars
    (
      ?auto_1427892 - HOIST
      ?auto_1427891 - PLACE
      ?auto_1427893 - SURFACE
      ?auto_1427890 - PLACE
      ?auto_1427888 - HOIST
      ?auto_1427889 - SURFACE
      ?auto_1427894 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1427892 ?auto_1427891 ) ( IS-CRATE ?auto_1427887 ) ( not ( = ?auto_1427886 ?auto_1427887 ) ) ( not ( = ?auto_1427893 ?auto_1427886 ) ) ( not ( = ?auto_1427893 ?auto_1427887 ) ) ( not ( = ?auto_1427890 ?auto_1427891 ) ) ( HOIST-AT ?auto_1427888 ?auto_1427890 ) ( not ( = ?auto_1427892 ?auto_1427888 ) ) ( AVAILABLE ?auto_1427888 ) ( SURFACE-AT ?auto_1427887 ?auto_1427890 ) ( ON ?auto_1427887 ?auto_1427889 ) ( CLEAR ?auto_1427887 ) ( not ( = ?auto_1427886 ?auto_1427889 ) ) ( not ( = ?auto_1427887 ?auto_1427889 ) ) ( not ( = ?auto_1427893 ?auto_1427889 ) ) ( TRUCK-AT ?auto_1427894 ?auto_1427891 ) ( SURFACE-AT ?auto_1427893 ?auto_1427891 ) ( CLEAR ?auto_1427893 ) ( IS-CRATE ?auto_1427886 ) ( AVAILABLE ?auto_1427892 ) ( IN ?auto_1427886 ?auto_1427894 ) )
    :subtasks
    ( ( !UNLOAD ?auto_1427892 ?auto_1427886 ?auto_1427894 ?auto_1427891 )
      ( MAKE-2CRATE ?auto_1427893 ?auto_1427886 ?auto_1427887 )
      ( MAKE-1CRATE-VERIFY ?auto_1427886 ?auto_1427887 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1427895 - SURFACE
      ?auto_1427896 - SURFACE
      ?auto_1427897 - SURFACE
    )
    :vars
    (
      ?auto_1427899 - HOIST
      ?auto_1427898 - PLACE
      ?auto_1427902 - PLACE
      ?auto_1427900 - HOIST
      ?auto_1427903 - SURFACE
      ?auto_1427901 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1427899 ?auto_1427898 ) ( IS-CRATE ?auto_1427897 ) ( not ( = ?auto_1427896 ?auto_1427897 ) ) ( not ( = ?auto_1427895 ?auto_1427896 ) ) ( not ( = ?auto_1427895 ?auto_1427897 ) ) ( not ( = ?auto_1427902 ?auto_1427898 ) ) ( HOIST-AT ?auto_1427900 ?auto_1427902 ) ( not ( = ?auto_1427899 ?auto_1427900 ) ) ( AVAILABLE ?auto_1427900 ) ( SURFACE-AT ?auto_1427897 ?auto_1427902 ) ( ON ?auto_1427897 ?auto_1427903 ) ( CLEAR ?auto_1427897 ) ( not ( = ?auto_1427896 ?auto_1427903 ) ) ( not ( = ?auto_1427897 ?auto_1427903 ) ) ( not ( = ?auto_1427895 ?auto_1427903 ) ) ( TRUCK-AT ?auto_1427901 ?auto_1427898 ) ( SURFACE-AT ?auto_1427895 ?auto_1427898 ) ( CLEAR ?auto_1427895 ) ( IS-CRATE ?auto_1427896 ) ( AVAILABLE ?auto_1427899 ) ( IN ?auto_1427896 ?auto_1427901 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1427896 ?auto_1427897 )
      ( MAKE-2CRATE-VERIFY ?auto_1427895 ?auto_1427896 ?auto_1427897 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1427940 - SURFACE
      ?auto_1427941 - SURFACE
    )
    :vars
    (
      ?auto_1427944 - HOIST
      ?auto_1427943 - PLACE
      ?auto_1427946 - SURFACE
      ?auto_1427947 - PLACE
      ?auto_1427948 - HOIST
      ?auto_1427942 - SURFACE
      ?auto_1427945 - TRUCK
      ?auto_1427949 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1427944 ?auto_1427943 ) ( SURFACE-AT ?auto_1427940 ?auto_1427943 ) ( CLEAR ?auto_1427940 ) ( IS-CRATE ?auto_1427941 ) ( not ( = ?auto_1427940 ?auto_1427941 ) ) ( AVAILABLE ?auto_1427944 ) ( ON ?auto_1427940 ?auto_1427946 ) ( not ( = ?auto_1427946 ?auto_1427940 ) ) ( not ( = ?auto_1427946 ?auto_1427941 ) ) ( not ( = ?auto_1427947 ?auto_1427943 ) ) ( HOIST-AT ?auto_1427948 ?auto_1427947 ) ( not ( = ?auto_1427944 ?auto_1427948 ) ) ( AVAILABLE ?auto_1427948 ) ( SURFACE-AT ?auto_1427941 ?auto_1427947 ) ( ON ?auto_1427941 ?auto_1427942 ) ( CLEAR ?auto_1427941 ) ( not ( = ?auto_1427940 ?auto_1427942 ) ) ( not ( = ?auto_1427941 ?auto_1427942 ) ) ( not ( = ?auto_1427946 ?auto_1427942 ) ) ( TRUCK-AT ?auto_1427945 ?auto_1427949 ) ( not ( = ?auto_1427949 ?auto_1427943 ) ) ( not ( = ?auto_1427947 ?auto_1427949 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1427945 ?auto_1427949 ?auto_1427943 )
      ( MAKE-1CRATE ?auto_1427940 ?auto_1427941 )
      ( MAKE-1CRATE-VERIFY ?auto_1427940 ?auto_1427941 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1427980 - SURFACE
      ?auto_1427981 - SURFACE
      ?auto_1427982 - SURFACE
      ?auto_1427979 - SURFACE
    )
    :vars
    (
      ?auto_1427984 - HOIST
      ?auto_1427983 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1427984 ?auto_1427983 ) ( SURFACE-AT ?auto_1427982 ?auto_1427983 ) ( CLEAR ?auto_1427982 ) ( LIFTING ?auto_1427984 ?auto_1427979 ) ( IS-CRATE ?auto_1427979 ) ( not ( = ?auto_1427982 ?auto_1427979 ) ) ( ON ?auto_1427981 ?auto_1427980 ) ( ON ?auto_1427982 ?auto_1427981 ) ( not ( = ?auto_1427980 ?auto_1427981 ) ) ( not ( = ?auto_1427980 ?auto_1427982 ) ) ( not ( = ?auto_1427980 ?auto_1427979 ) ) ( not ( = ?auto_1427981 ?auto_1427982 ) ) ( not ( = ?auto_1427981 ?auto_1427979 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1427982 ?auto_1427979 )
      ( MAKE-3CRATE-VERIFY ?auto_1427980 ?auto_1427981 ?auto_1427982 ?auto_1427979 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1427997 - SURFACE
      ?auto_1427998 - SURFACE
      ?auto_1427999 - SURFACE
      ?auto_1427996 - SURFACE
    )
    :vars
    (
      ?auto_1428000 - HOIST
      ?auto_1428002 - PLACE
      ?auto_1428001 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1428000 ?auto_1428002 ) ( SURFACE-AT ?auto_1427999 ?auto_1428002 ) ( CLEAR ?auto_1427999 ) ( IS-CRATE ?auto_1427996 ) ( not ( = ?auto_1427999 ?auto_1427996 ) ) ( TRUCK-AT ?auto_1428001 ?auto_1428002 ) ( AVAILABLE ?auto_1428000 ) ( IN ?auto_1427996 ?auto_1428001 ) ( ON ?auto_1427999 ?auto_1427998 ) ( not ( = ?auto_1427998 ?auto_1427999 ) ) ( not ( = ?auto_1427998 ?auto_1427996 ) ) ( ON ?auto_1427998 ?auto_1427997 ) ( not ( = ?auto_1427997 ?auto_1427998 ) ) ( not ( = ?auto_1427997 ?auto_1427999 ) ) ( not ( = ?auto_1427997 ?auto_1427996 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1427998 ?auto_1427999 ?auto_1427996 )
      ( MAKE-3CRATE-VERIFY ?auto_1427997 ?auto_1427998 ?auto_1427999 ?auto_1427996 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1428018 - SURFACE
      ?auto_1428019 - SURFACE
      ?auto_1428020 - SURFACE
      ?auto_1428017 - SURFACE
    )
    :vars
    (
      ?auto_1428022 - HOIST
      ?auto_1428023 - PLACE
      ?auto_1428021 - TRUCK
      ?auto_1428024 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1428022 ?auto_1428023 ) ( SURFACE-AT ?auto_1428020 ?auto_1428023 ) ( CLEAR ?auto_1428020 ) ( IS-CRATE ?auto_1428017 ) ( not ( = ?auto_1428020 ?auto_1428017 ) ) ( AVAILABLE ?auto_1428022 ) ( IN ?auto_1428017 ?auto_1428021 ) ( ON ?auto_1428020 ?auto_1428019 ) ( not ( = ?auto_1428019 ?auto_1428020 ) ) ( not ( = ?auto_1428019 ?auto_1428017 ) ) ( TRUCK-AT ?auto_1428021 ?auto_1428024 ) ( not ( = ?auto_1428024 ?auto_1428023 ) ) ( ON ?auto_1428019 ?auto_1428018 ) ( not ( = ?auto_1428018 ?auto_1428019 ) ) ( not ( = ?auto_1428018 ?auto_1428020 ) ) ( not ( = ?auto_1428018 ?auto_1428017 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1428019 ?auto_1428020 ?auto_1428017 )
      ( MAKE-3CRATE-VERIFY ?auto_1428018 ?auto_1428019 ?auto_1428020 ?auto_1428017 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1428042 - SURFACE
      ?auto_1428043 - SURFACE
      ?auto_1428044 - SURFACE
      ?auto_1428041 - SURFACE
    )
    :vars
    (
      ?auto_1428046 - HOIST
      ?auto_1428048 - PLACE
      ?auto_1428049 - TRUCK
      ?auto_1428045 - PLACE
      ?auto_1428047 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1428046 ?auto_1428048 ) ( SURFACE-AT ?auto_1428044 ?auto_1428048 ) ( CLEAR ?auto_1428044 ) ( IS-CRATE ?auto_1428041 ) ( not ( = ?auto_1428044 ?auto_1428041 ) ) ( AVAILABLE ?auto_1428046 ) ( ON ?auto_1428044 ?auto_1428043 ) ( not ( = ?auto_1428043 ?auto_1428044 ) ) ( not ( = ?auto_1428043 ?auto_1428041 ) ) ( TRUCK-AT ?auto_1428049 ?auto_1428045 ) ( not ( = ?auto_1428045 ?auto_1428048 ) ) ( HOIST-AT ?auto_1428047 ?auto_1428045 ) ( LIFTING ?auto_1428047 ?auto_1428041 ) ( not ( = ?auto_1428046 ?auto_1428047 ) ) ( ON ?auto_1428043 ?auto_1428042 ) ( not ( = ?auto_1428042 ?auto_1428043 ) ) ( not ( = ?auto_1428042 ?auto_1428044 ) ) ( not ( = ?auto_1428042 ?auto_1428041 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1428043 ?auto_1428044 ?auto_1428041 )
      ( MAKE-3CRATE-VERIFY ?auto_1428042 ?auto_1428043 ?auto_1428044 ?auto_1428041 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1428069 - SURFACE
      ?auto_1428070 - SURFACE
      ?auto_1428071 - SURFACE
      ?auto_1428068 - SURFACE
    )
    :vars
    (
      ?auto_1428072 - HOIST
      ?auto_1428075 - PLACE
      ?auto_1428076 - TRUCK
      ?auto_1428073 - PLACE
      ?auto_1428074 - HOIST
      ?auto_1428077 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1428072 ?auto_1428075 ) ( SURFACE-AT ?auto_1428071 ?auto_1428075 ) ( CLEAR ?auto_1428071 ) ( IS-CRATE ?auto_1428068 ) ( not ( = ?auto_1428071 ?auto_1428068 ) ) ( AVAILABLE ?auto_1428072 ) ( ON ?auto_1428071 ?auto_1428070 ) ( not ( = ?auto_1428070 ?auto_1428071 ) ) ( not ( = ?auto_1428070 ?auto_1428068 ) ) ( TRUCK-AT ?auto_1428076 ?auto_1428073 ) ( not ( = ?auto_1428073 ?auto_1428075 ) ) ( HOIST-AT ?auto_1428074 ?auto_1428073 ) ( not ( = ?auto_1428072 ?auto_1428074 ) ) ( AVAILABLE ?auto_1428074 ) ( SURFACE-AT ?auto_1428068 ?auto_1428073 ) ( ON ?auto_1428068 ?auto_1428077 ) ( CLEAR ?auto_1428068 ) ( not ( = ?auto_1428071 ?auto_1428077 ) ) ( not ( = ?auto_1428068 ?auto_1428077 ) ) ( not ( = ?auto_1428070 ?auto_1428077 ) ) ( ON ?auto_1428070 ?auto_1428069 ) ( not ( = ?auto_1428069 ?auto_1428070 ) ) ( not ( = ?auto_1428069 ?auto_1428071 ) ) ( not ( = ?auto_1428069 ?auto_1428068 ) ) ( not ( = ?auto_1428069 ?auto_1428077 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1428070 ?auto_1428071 ?auto_1428068 )
      ( MAKE-3CRATE-VERIFY ?auto_1428069 ?auto_1428070 ?auto_1428071 ?auto_1428068 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1428097 - SURFACE
      ?auto_1428098 - SURFACE
      ?auto_1428099 - SURFACE
      ?auto_1428096 - SURFACE
    )
    :vars
    (
      ?auto_1428104 - HOIST
      ?auto_1428101 - PLACE
      ?auto_1428105 - PLACE
      ?auto_1428100 - HOIST
      ?auto_1428103 - SURFACE
      ?auto_1428102 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1428104 ?auto_1428101 ) ( SURFACE-AT ?auto_1428099 ?auto_1428101 ) ( CLEAR ?auto_1428099 ) ( IS-CRATE ?auto_1428096 ) ( not ( = ?auto_1428099 ?auto_1428096 ) ) ( AVAILABLE ?auto_1428104 ) ( ON ?auto_1428099 ?auto_1428098 ) ( not ( = ?auto_1428098 ?auto_1428099 ) ) ( not ( = ?auto_1428098 ?auto_1428096 ) ) ( not ( = ?auto_1428105 ?auto_1428101 ) ) ( HOIST-AT ?auto_1428100 ?auto_1428105 ) ( not ( = ?auto_1428104 ?auto_1428100 ) ) ( AVAILABLE ?auto_1428100 ) ( SURFACE-AT ?auto_1428096 ?auto_1428105 ) ( ON ?auto_1428096 ?auto_1428103 ) ( CLEAR ?auto_1428096 ) ( not ( = ?auto_1428099 ?auto_1428103 ) ) ( not ( = ?auto_1428096 ?auto_1428103 ) ) ( not ( = ?auto_1428098 ?auto_1428103 ) ) ( TRUCK-AT ?auto_1428102 ?auto_1428101 ) ( ON ?auto_1428098 ?auto_1428097 ) ( not ( = ?auto_1428097 ?auto_1428098 ) ) ( not ( = ?auto_1428097 ?auto_1428099 ) ) ( not ( = ?auto_1428097 ?auto_1428096 ) ) ( not ( = ?auto_1428097 ?auto_1428103 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1428098 ?auto_1428099 ?auto_1428096 )
      ( MAKE-3CRATE-VERIFY ?auto_1428097 ?auto_1428098 ?auto_1428099 ?auto_1428096 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1428125 - SURFACE
      ?auto_1428126 - SURFACE
      ?auto_1428127 - SURFACE
      ?auto_1428124 - SURFACE
    )
    :vars
    (
      ?auto_1428133 - HOIST
      ?auto_1428128 - PLACE
      ?auto_1428132 - PLACE
      ?auto_1428129 - HOIST
      ?auto_1428131 - SURFACE
      ?auto_1428130 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1428133 ?auto_1428128 ) ( IS-CRATE ?auto_1428124 ) ( not ( = ?auto_1428127 ?auto_1428124 ) ) ( not ( = ?auto_1428126 ?auto_1428127 ) ) ( not ( = ?auto_1428126 ?auto_1428124 ) ) ( not ( = ?auto_1428132 ?auto_1428128 ) ) ( HOIST-AT ?auto_1428129 ?auto_1428132 ) ( not ( = ?auto_1428133 ?auto_1428129 ) ) ( AVAILABLE ?auto_1428129 ) ( SURFACE-AT ?auto_1428124 ?auto_1428132 ) ( ON ?auto_1428124 ?auto_1428131 ) ( CLEAR ?auto_1428124 ) ( not ( = ?auto_1428127 ?auto_1428131 ) ) ( not ( = ?auto_1428124 ?auto_1428131 ) ) ( not ( = ?auto_1428126 ?auto_1428131 ) ) ( TRUCK-AT ?auto_1428130 ?auto_1428128 ) ( SURFACE-AT ?auto_1428126 ?auto_1428128 ) ( CLEAR ?auto_1428126 ) ( LIFTING ?auto_1428133 ?auto_1428127 ) ( IS-CRATE ?auto_1428127 ) ( ON ?auto_1428126 ?auto_1428125 ) ( not ( = ?auto_1428125 ?auto_1428126 ) ) ( not ( = ?auto_1428125 ?auto_1428127 ) ) ( not ( = ?auto_1428125 ?auto_1428124 ) ) ( not ( = ?auto_1428125 ?auto_1428131 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1428126 ?auto_1428127 ?auto_1428124 )
      ( MAKE-3CRATE-VERIFY ?auto_1428125 ?auto_1428126 ?auto_1428127 ?auto_1428124 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1428153 - SURFACE
      ?auto_1428154 - SURFACE
      ?auto_1428155 - SURFACE
      ?auto_1428152 - SURFACE
    )
    :vars
    (
      ?auto_1428159 - HOIST
      ?auto_1428158 - PLACE
      ?auto_1428160 - PLACE
      ?auto_1428161 - HOIST
      ?auto_1428157 - SURFACE
      ?auto_1428156 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1428159 ?auto_1428158 ) ( IS-CRATE ?auto_1428152 ) ( not ( = ?auto_1428155 ?auto_1428152 ) ) ( not ( = ?auto_1428154 ?auto_1428155 ) ) ( not ( = ?auto_1428154 ?auto_1428152 ) ) ( not ( = ?auto_1428160 ?auto_1428158 ) ) ( HOIST-AT ?auto_1428161 ?auto_1428160 ) ( not ( = ?auto_1428159 ?auto_1428161 ) ) ( AVAILABLE ?auto_1428161 ) ( SURFACE-AT ?auto_1428152 ?auto_1428160 ) ( ON ?auto_1428152 ?auto_1428157 ) ( CLEAR ?auto_1428152 ) ( not ( = ?auto_1428155 ?auto_1428157 ) ) ( not ( = ?auto_1428152 ?auto_1428157 ) ) ( not ( = ?auto_1428154 ?auto_1428157 ) ) ( TRUCK-AT ?auto_1428156 ?auto_1428158 ) ( SURFACE-AT ?auto_1428154 ?auto_1428158 ) ( CLEAR ?auto_1428154 ) ( IS-CRATE ?auto_1428155 ) ( AVAILABLE ?auto_1428159 ) ( IN ?auto_1428155 ?auto_1428156 ) ( ON ?auto_1428154 ?auto_1428153 ) ( not ( = ?auto_1428153 ?auto_1428154 ) ) ( not ( = ?auto_1428153 ?auto_1428155 ) ) ( not ( = ?auto_1428153 ?auto_1428152 ) ) ( not ( = ?auto_1428153 ?auto_1428157 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1428154 ?auto_1428155 ?auto_1428152 )
      ( MAKE-3CRATE-VERIFY ?auto_1428153 ?auto_1428154 ?auto_1428155 ?auto_1428152 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1428444 - SURFACE
      ?auto_1428445 - SURFACE
      ?auto_1428446 - SURFACE
      ?auto_1428443 - SURFACE
      ?auto_1428447 - SURFACE
    )
    :vars
    (
      ?auto_1428448 - HOIST
      ?auto_1428449 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1428448 ?auto_1428449 ) ( SURFACE-AT ?auto_1428443 ?auto_1428449 ) ( CLEAR ?auto_1428443 ) ( LIFTING ?auto_1428448 ?auto_1428447 ) ( IS-CRATE ?auto_1428447 ) ( not ( = ?auto_1428443 ?auto_1428447 ) ) ( ON ?auto_1428445 ?auto_1428444 ) ( ON ?auto_1428446 ?auto_1428445 ) ( ON ?auto_1428443 ?auto_1428446 ) ( not ( = ?auto_1428444 ?auto_1428445 ) ) ( not ( = ?auto_1428444 ?auto_1428446 ) ) ( not ( = ?auto_1428444 ?auto_1428443 ) ) ( not ( = ?auto_1428444 ?auto_1428447 ) ) ( not ( = ?auto_1428445 ?auto_1428446 ) ) ( not ( = ?auto_1428445 ?auto_1428443 ) ) ( not ( = ?auto_1428445 ?auto_1428447 ) ) ( not ( = ?auto_1428446 ?auto_1428443 ) ) ( not ( = ?auto_1428446 ?auto_1428447 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1428443 ?auto_1428447 )
      ( MAKE-4CRATE-VERIFY ?auto_1428444 ?auto_1428445 ?auto_1428446 ?auto_1428443 ?auto_1428447 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1428469 - SURFACE
      ?auto_1428470 - SURFACE
      ?auto_1428471 - SURFACE
      ?auto_1428468 - SURFACE
      ?auto_1428472 - SURFACE
    )
    :vars
    (
      ?auto_1428475 - HOIST
      ?auto_1428473 - PLACE
      ?auto_1428474 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1428475 ?auto_1428473 ) ( SURFACE-AT ?auto_1428468 ?auto_1428473 ) ( CLEAR ?auto_1428468 ) ( IS-CRATE ?auto_1428472 ) ( not ( = ?auto_1428468 ?auto_1428472 ) ) ( TRUCK-AT ?auto_1428474 ?auto_1428473 ) ( AVAILABLE ?auto_1428475 ) ( IN ?auto_1428472 ?auto_1428474 ) ( ON ?auto_1428468 ?auto_1428471 ) ( not ( = ?auto_1428471 ?auto_1428468 ) ) ( not ( = ?auto_1428471 ?auto_1428472 ) ) ( ON ?auto_1428470 ?auto_1428469 ) ( ON ?auto_1428471 ?auto_1428470 ) ( not ( = ?auto_1428469 ?auto_1428470 ) ) ( not ( = ?auto_1428469 ?auto_1428471 ) ) ( not ( = ?auto_1428469 ?auto_1428468 ) ) ( not ( = ?auto_1428469 ?auto_1428472 ) ) ( not ( = ?auto_1428470 ?auto_1428471 ) ) ( not ( = ?auto_1428470 ?auto_1428468 ) ) ( not ( = ?auto_1428470 ?auto_1428472 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1428471 ?auto_1428468 ?auto_1428472 )
      ( MAKE-4CRATE-VERIFY ?auto_1428469 ?auto_1428470 ?auto_1428471 ?auto_1428468 ?auto_1428472 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1428499 - SURFACE
      ?auto_1428500 - SURFACE
      ?auto_1428501 - SURFACE
      ?auto_1428498 - SURFACE
      ?auto_1428502 - SURFACE
    )
    :vars
    (
      ?auto_1428505 - HOIST
      ?auto_1428504 - PLACE
      ?auto_1428506 - TRUCK
      ?auto_1428503 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1428505 ?auto_1428504 ) ( SURFACE-AT ?auto_1428498 ?auto_1428504 ) ( CLEAR ?auto_1428498 ) ( IS-CRATE ?auto_1428502 ) ( not ( = ?auto_1428498 ?auto_1428502 ) ) ( AVAILABLE ?auto_1428505 ) ( IN ?auto_1428502 ?auto_1428506 ) ( ON ?auto_1428498 ?auto_1428501 ) ( not ( = ?auto_1428501 ?auto_1428498 ) ) ( not ( = ?auto_1428501 ?auto_1428502 ) ) ( TRUCK-AT ?auto_1428506 ?auto_1428503 ) ( not ( = ?auto_1428503 ?auto_1428504 ) ) ( ON ?auto_1428500 ?auto_1428499 ) ( ON ?auto_1428501 ?auto_1428500 ) ( not ( = ?auto_1428499 ?auto_1428500 ) ) ( not ( = ?auto_1428499 ?auto_1428501 ) ) ( not ( = ?auto_1428499 ?auto_1428498 ) ) ( not ( = ?auto_1428499 ?auto_1428502 ) ) ( not ( = ?auto_1428500 ?auto_1428501 ) ) ( not ( = ?auto_1428500 ?auto_1428498 ) ) ( not ( = ?auto_1428500 ?auto_1428502 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1428501 ?auto_1428498 ?auto_1428502 )
      ( MAKE-4CRATE-VERIFY ?auto_1428499 ?auto_1428500 ?auto_1428501 ?auto_1428498 ?auto_1428502 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1428533 - SURFACE
      ?auto_1428534 - SURFACE
      ?auto_1428535 - SURFACE
      ?auto_1428532 - SURFACE
      ?auto_1428536 - SURFACE
    )
    :vars
    (
      ?auto_1428537 - HOIST
      ?auto_1428539 - PLACE
      ?auto_1428538 - TRUCK
      ?auto_1428541 - PLACE
      ?auto_1428540 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1428537 ?auto_1428539 ) ( SURFACE-AT ?auto_1428532 ?auto_1428539 ) ( CLEAR ?auto_1428532 ) ( IS-CRATE ?auto_1428536 ) ( not ( = ?auto_1428532 ?auto_1428536 ) ) ( AVAILABLE ?auto_1428537 ) ( ON ?auto_1428532 ?auto_1428535 ) ( not ( = ?auto_1428535 ?auto_1428532 ) ) ( not ( = ?auto_1428535 ?auto_1428536 ) ) ( TRUCK-AT ?auto_1428538 ?auto_1428541 ) ( not ( = ?auto_1428541 ?auto_1428539 ) ) ( HOIST-AT ?auto_1428540 ?auto_1428541 ) ( LIFTING ?auto_1428540 ?auto_1428536 ) ( not ( = ?auto_1428537 ?auto_1428540 ) ) ( ON ?auto_1428534 ?auto_1428533 ) ( ON ?auto_1428535 ?auto_1428534 ) ( not ( = ?auto_1428533 ?auto_1428534 ) ) ( not ( = ?auto_1428533 ?auto_1428535 ) ) ( not ( = ?auto_1428533 ?auto_1428532 ) ) ( not ( = ?auto_1428533 ?auto_1428536 ) ) ( not ( = ?auto_1428534 ?auto_1428535 ) ) ( not ( = ?auto_1428534 ?auto_1428532 ) ) ( not ( = ?auto_1428534 ?auto_1428536 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1428535 ?auto_1428532 ?auto_1428536 )
      ( MAKE-4CRATE-VERIFY ?auto_1428533 ?auto_1428534 ?auto_1428535 ?auto_1428532 ?auto_1428536 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1428571 - SURFACE
      ?auto_1428572 - SURFACE
      ?auto_1428573 - SURFACE
      ?auto_1428570 - SURFACE
      ?auto_1428574 - SURFACE
    )
    :vars
    (
      ?auto_1428578 - HOIST
      ?auto_1428577 - PLACE
      ?auto_1428579 - TRUCK
      ?auto_1428575 - PLACE
      ?auto_1428580 - HOIST
      ?auto_1428576 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1428578 ?auto_1428577 ) ( SURFACE-AT ?auto_1428570 ?auto_1428577 ) ( CLEAR ?auto_1428570 ) ( IS-CRATE ?auto_1428574 ) ( not ( = ?auto_1428570 ?auto_1428574 ) ) ( AVAILABLE ?auto_1428578 ) ( ON ?auto_1428570 ?auto_1428573 ) ( not ( = ?auto_1428573 ?auto_1428570 ) ) ( not ( = ?auto_1428573 ?auto_1428574 ) ) ( TRUCK-AT ?auto_1428579 ?auto_1428575 ) ( not ( = ?auto_1428575 ?auto_1428577 ) ) ( HOIST-AT ?auto_1428580 ?auto_1428575 ) ( not ( = ?auto_1428578 ?auto_1428580 ) ) ( AVAILABLE ?auto_1428580 ) ( SURFACE-AT ?auto_1428574 ?auto_1428575 ) ( ON ?auto_1428574 ?auto_1428576 ) ( CLEAR ?auto_1428574 ) ( not ( = ?auto_1428570 ?auto_1428576 ) ) ( not ( = ?auto_1428574 ?auto_1428576 ) ) ( not ( = ?auto_1428573 ?auto_1428576 ) ) ( ON ?auto_1428572 ?auto_1428571 ) ( ON ?auto_1428573 ?auto_1428572 ) ( not ( = ?auto_1428571 ?auto_1428572 ) ) ( not ( = ?auto_1428571 ?auto_1428573 ) ) ( not ( = ?auto_1428571 ?auto_1428570 ) ) ( not ( = ?auto_1428571 ?auto_1428574 ) ) ( not ( = ?auto_1428571 ?auto_1428576 ) ) ( not ( = ?auto_1428572 ?auto_1428573 ) ) ( not ( = ?auto_1428572 ?auto_1428570 ) ) ( not ( = ?auto_1428572 ?auto_1428574 ) ) ( not ( = ?auto_1428572 ?auto_1428576 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1428573 ?auto_1428570 ?auto_1428574 )
      ( MAKE-4CRATE-VERIFY ?auto_1428571 ?auto_1428572 ?auto_1428573 ?auto_1428570 ?auto_1428574 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1428610 - SURFACE
      ?auto_1428611 - SURFACE
      ?auto_1428612 - SURFACE
      ?auto_1428609 - SURFACE
      ?auto_1428613 - SURFACE
    )
    :vars
    (
      ?auto_1428615 - HOIST
      ?auto_1428616 - PLACE
      ?auto_1428619 - PLACE
      ?auto_1428614 - HOIST
      ?auto_1428617 - SURFACE
      ?auto_1428618 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1428615 ?auto_1428616 ) ( SURFACE-AT ?auto_1428609 ?auto_1428616 ) ( CLEAR ?auto_1428609 ) ( IS-CRATE ?auto_1428613 ) ( not ( = ?auto_1428609 ?auto_1428613 ) ) ( AVAILABLE ?auto_1428615 ) ( ON ?auto_1428609 ?auto_1428612 ) ( not ( = ?auto_1428612 ?auto_1428609 ) ) ( not ( = ?auto_1428612 ?auto_1428613 ) ) ( not ( = ?auto_1428619 ?auto_1428616 ) ) ( HOIST-AT ?auto_1428614 ?auto_1428619 ) ( not ( = ?auto_1428615 ?auto_1428614 ) ) ( AVAILABLE ?auto_1428614 ) ( SURFACE-AT ?auto_1428613 ?auto_1428619 ) ( ON ?auto_1428613 ?auto_1428617 ) ( CLEAR ?auto_1428613 ) ( not ( = ?auto_1428609 ?auto_1428617 ) ) ( not ( = ?auto_1428613 ?auto_1428617 ) ) ( not ( = ?auto_1428612 ?auto_1428617 ) ) ( TRUCK-AT ?auto_1428618 ?auto_1428616 ) ( ON ?auto_1428611 ?auto_1428610 ) ( ON ?auto_1428612 ?auto_1428611 ) ( not ( = ?auto_1428610 ?auto_1428611 ) ) ( not ( = ?auto_1428610 ?auto_1428612 ) ) ( not ( = ?auto_1428610 ?auto_1428609 ) ) ( not ( = ?auto_1428610 ?auto_1428613 ) ) ( not ( = ?auto_1428610 ?auto_1428617 ) ) ( not ( = ?auto_1428611 ?auto_1428612 ) ) ( not ( = ?auto_1428611 ?auto_1428609 ) ) ( not ( = ?auto_1428611 ?auto_1428613 ) ) ( not ( = ?auto_1428611 ?auto_1428617 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1428612 ?auto_1428609 ?auto_1428613 )
      ( MAKE-4CRATE-VERIFY ?auto_1428610 ?auto_1428611 ?auto_1428612 ?auto_1428609 ?auto_1428613 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1428649 - SURFACE
      ?auto_1428650 - SURFACE
      ?auto_1428651 - SURFACE
      ?auto_1428648 - SURFACE
      ?auto_1428652 - SURFACE
    )
    :vars
    (
      ?auto_1428654 - HOIST
      ?auto_1428655 - PLACE
      ?auto_1428653 - PLACE
      ?auto_1428657 - HOIST
      ?auto_1428658 - SURFACE
      ?auto_1428656 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1428654 ?auto_1428655 ) ( IS-CRATE ?auto_1428652 ) ( not ( = ?auto_1428648 ?auto_1428652 ) ) ( not ( = ?auto_1428651 ?auto_1428648 ) ) ( not ( = ?auto_1428651 ?auto_1428652 ) ) ( not ( = ?auto_1428653 ?auto_1428655 ) ) ( HOIST-AT ?auto_1428657 ?auto_1428653 ) ( not ( = ?auto_1428654 ?auto_1428657 ) ) ( AVAILABLE ?auto_1428657 ) ( SURFACE-AT ?auto_1428652 ?auto_1428653 ) ( ON ?auto_1428652 ?auto_1428658 ) ( CLEAR ?auto_1428652 ) ( not ( = ?auto_1428648 ?auto_1428658 ) ) ( not ( = ?auto_1428652 ?auto_1428658 ) ) ( not ( = ?auto_1428651 ?auto_1428658 ) ) ( TRUCK-AT ?auto_1428656 ?auto_1428655 ) ( SURFACE-AT ?auto_1428651 ?auto_1428655 ) ( CLEAR ?auto_1428651 ) ( LIFTING ?auto_1428654 ?auto_1428648 ) ( IS-CRATE ?auto_1428648 ) ( ON ?auto_1428650 ?auto_1428649 ) ( ON ?auto_1428651 ?auto_1428650 ) ( not ( = ?auto_1428649 ?auto_1428650 ) ) ( not ( = ?auto_1428649 ?auto_1428651 ) ) ( not ( = ?auto_1428649 ?auto_1428648 ) ) ( not ( = ?auto_1428649 ?auto_1428652 ) ) ( not ( = ?auto_1428649 ?auto_1428658 ) ) ( not ( = ?auto_1428650 ?auto_1428651 ) ) ( not ( = ?auto_1428650 ?auto_1428648 ) ) ( not ( = ?auto_1428650 ?auto_1428652 ) ) ( not ( = ?auto_1428650 ?auto_1428658 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1428651 ?auto_1428648 ?auto_1428652 )
      ( MAKE-4CRATE-VERIFY ?auto_1428649 ?auto_1428650 ?auto_1428651 ?auto_1428648 ?auto_1428652 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1428688 - SURFACE
      ?auto_1428689 - SURFACE
      ?auto_1428690 - SURFACE
      ?auto_1428687 - SURFACE
      ?auto_1428691 - SURFACE
    )
    :vars
    (
      ?auto_1428694 - HOIST
      ?auto_1428692 - PLACE
      ?auto_1428697 - PLACE
      ?auto_1428693 - HOIST
      ?auto_1428695 - SURFACE
      ?auto_1428696 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1428694 ?auto_1428692 ) ( IS-CRATE ?auto_1428691 ) ( not ( = ?auto_1428687 ?auto_1428691 ) ) ( not ( = ?auto_1428690 ?auto_1428687 ) ) ( not ( = ?auto_1428690 ?auto_1428691 ) ) ( not ( = ?auto_1428697 ?auto_1428692 ) ) ( HOIST-AT ?auto_1428693 ?auto_1428697 ) ( not ( = ?auto_1428694 ?auto_1428693 ) ) ( AVAILABLE ?auto_1428693 ) ( SURFACE-AT ?auto_1428691 ?auto_1428697 ) ( ON ?auto_1428691 ?auto_1428695 ) ( CLEAR ?auto_1428691 ) ( not ( = ?auto_1428687 ?auto_1428695 ) ) ( not ( = ?auto_1428691 ?auto_1428695 ) ) ( not ( = ?auto_1428690 ?auto_1428695 ) ) ( TRUCK-AT ?auto_1428696 ?auto_1428692 ) ( SURFACE-AT ?auto_1428690 ?auto_1428692 ) ( CLEAR ?auto_1428690 ) ( IS-CRATE ?auto_1428687 ) ( AVAILABLE ?auto_1428694 ) ( IN ?auto_1428687 ?auto_1428696 ) ( ON ?auto_1428689 ?auto_1428688 ) ( ON ?auto_1428690 ?auto_1428689 ) ( not ( = ?auto_1428688 ?auto_1428689 ) ) ( not ( = ?auto_1428688 ?auto_1428690 ) ) ( not ( = ?auto_1428688 ?auto_1428687 ) ) ( not ( = ?auto_1428688 ?auto_1428691 ) ) ( not ( = ?auto_1428688 ?auto_1428695 ) ) ( not ( = ?auto_1428689 ?auto_1428690 ) ) ( not ( = ?auto_1428689 ?auto_1428687 ) ) ( not ( = ?auto_1428689 ?auto_1428691 ) ) ( not ( = ?auto_1428689 ?auto_1428695 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1428690 ?auto_1428687 ?auto_1428691 )
      ( MAKE-4CRATE-VERIFY ?auto_1428688 ?auto_1428689 ?auto_1428690 ?auto_1428687 ?auto_1428691 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1428960 - SURFACE
      ?auto_1428961 - SURFACE
    )
    :vars
    (
      ?auto_1428966 - HOIST
      ?auto_1428963 - PLACE
      ?auto_1428964 - SURFACE
      ?auto_1428965 - TRUCK
      ?auto_1428962 - PLACE
      ?auto_1428967 - HOIST
      ?auto_1428968 - SURFACE
      ?auto_1428969 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1428966 ?auto_1428963 ) ( SURFACE-AT ?auto_1428960 ?auto_1428963 ) ( CLEAR ?auto_1428960 ) ( IS-CRATE ?auto_1428961 ) ( not ( = ?auto_1428960 ?auto_1428961 ) ) ( AVAILABLE ?auto_1428966 ) ( ON ?auto_1428960 ?auto_1428964 ) ( not ( = ?auto_1428964 ?auto_1428960 ) ) ( not ( = ?auto_1428964 ?auto_1428961 ) ) ( TRUCK-AT ?auto_1428965 ?auto_1428962 ) ( not ( = ?auto_1428962 ?auto_1428963 ) ) ( HOIST-AT ?auto_1428967 ?auto_1428962 ) ( not ( = ?auto_1428966 ?auto_1428967 ) ) ( SURFACE-AT ?auto_1428961 ?auto_1428962 ) ( ON ?auto_1428961 ?auto_1428968 ) ( CLEAR ?auto_1428961 ) ( not ( = ?auto_1428960 ?auto_1428968 ) ) ( not ( = ?auto_1428961 ?auto_1428968 ) ) ( not ( = ?auto_1428964 ?auto_1428968 ) ) ( LIFTING ?auto_1428967 ?auto_1428969 ) ( IS-CRATE ?auto_1428969 ) ( not ( = ?auto_1428960 ?auto_1428969 ) ) ( not ( = ?auto_1428961 ?auto_1428969 ) ) ( not ( = ?auto_1428964 ?auto_1428969 ) ) ( not ( = ?auto_1428968 ?auto_1428969 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1428967 ?auto_1428969 ?auto_1428965 ?auto_1428962 )
      ( MAKE-1CRATE ?auto_1428960 ?auto_1428961 )
      ( MAKE-1CRATE-VERIFY ?auto_1428960 ?auto_1428961 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1429347 - SURFACE
      ?auto_1429348 - SURFACE
      ?auto_1429349 - SURFACE
      ?auto_1429346 - SURFACE
      ?auto_1429350 - SURFACE
      ?auto_1429351 - SURFACE
    )
    :vars
    (
      ?auto_1429352 - HOIST
      ?auto_1429353 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1429352 ?auto_1429353 ) ( SURFACE-AT ?auto_1429350 ?auto_1429353 ) ( CLEAR ?auto_1429350 ) ( LIFTING ?auto_1429352 ?auto_1429351 ) ( IS-CRATE ?auto_1429351 ) ( not ( = ?auto_1429350 ?auto_1429351 ) ) ( ON ?auto_1429348 ?auto_1429347 ) ( ON ?auto_1429349 ?auto_1429348 ) ( ON ?auto_1429346 ?auto_1429349 ) ( ON ?auto_1429350 ?auto_1429346 ) ( not ( = ?auto_1429347 ?auto_1429348 ) ) ( not ( = ?auto_1429347 ?auto_1429349 ) ) ( not ( = ?auto_1429347 ?auto_1429346 ) ) ( not ( = ?auto_1429347 ?auto_1429350 ) ) ( not ( = ?auto_1429347 ?auto_1429351 ) ) ( not ( = ?auto_1429348 ?auto_1429349 ) ) ( not ( = ?auto_1429348 ?auto_1429346 ) ) ( not ( = ?auto_1429348 ?auto_1429350 ) ) ( not ( = ?auto_1429348 ?auto_1429351 ) ) ( not ( = ?auto_1429349 ?auto_1429346 ) ) ( not ( = ?auto_1429349 ?auto_1429350 ) ) ( not ( = ?auto_1429349 ?auto_1429351 ) ) ( not ( = ?auto_1429346 ?auto_1429350 ) ) ( not ( = ?auto_1429346 ?auto_1429351 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1429350 ?auto_1429351 )
      ( MAKE-5CRATE-VERIFY ?auto_1429347 ?auto_1429348 ?auto_1429349 ?auto_1429346 ?auto_1429350 ?auto_1429351 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1429381 - SURFACE
      ?auto_1429382 - SURFACE
      ?auto_1429383 - SURFACE
      ?auto_1429380 - SURFACE
      ?auto_1429384 - SURFACE
      ?auto_1429385 - SURFACE
    )
    :vars
    (
      ?auto_1429388 - HOIST
      ?auto_1429386 - PLACE
      ?auto_1429387 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1429388 ?auto_1429386 ) ( SURFACE-AT ?auto_1429384 ?auto_1429386 ) ( CLEAR ?auto_1429384 ) ( IS-CRATE ?auto_1429385 ) ( not ( = ?auto_1429384 ?auto_1429385 ) ) ( TRUCK-AT ?auto_1429387 ?auto_1429386 ) ( AVAILABLE ?auto_1429388 ) ( IN ?auto_1429385 ?auto_1429387 ) ( ON ?auto_1429384 ?auto_1429380 ) ( not ( = ?auto_1429380 ?auto_1429384 ) ) ( not ( = ?auto_1429380 ?auto_1429385 ) ) ( ON ?auto_1429382 ?auto_1429381 ) ( ON ?auto_1429383 ?auto_1429382 ) ( ON ?auto_1429380 ?auto_1429383 ) ( not ( = ?auto_1429381 ?auto_1429382 ) ) ( not ( = ?auto_1429381 ?auto_1429383 ) ) ( not ( = ?auto_1429381 ?auto_1429380 ) ) ( not ( = ?auto_1429381 ?auto_1429384 ) ) ( not ( = ?auto_1429381 ?auto_1429385 ) ) ( not ( = ?auto_1429382 ?auto_1429383 ) ) ( not ( = ?auto_1429382 ?auto_1429380 ) ) ( not ( = ?auto_1429382 ?auto_1429384 ) ) ( not ( = ?auto_1429382 ?auto_1429385 ) ) ( not ( = ?auto_1429383 ?auto_1429380 ) ) ( not ( = ?auto_1429383 ?auto_1429384 ) ) ( not ( = ?auto_1429383 ?auto_1429385 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1429380 ?auto_1429384 ?auto_1429385 )
      ( MAKE-5CRATE-VERIFY ?auto_1429381 ?auto_1429382 ?auto_1429383 ?auto_1429380 ?auto_1429384 ?auto_1429385 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1429421 - SURFACE
      ?auto_1429422 - SURFACE
      ?auto_1429423 - SURFACE
      ?auto_1429420 - SURFACE
      ?auto_1429424 - SURFACE
      ?auto_1429425 - SURFACE
    )
    :vars
    (
      ?auto_1429429 - HOIST
      ?auto_1429427 - PLACE
      ?auto_1429426 - TRUCK
      ?auto_1429428 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1429429 ?auto_1429427 ) ( SURFACE-AT ?auto_1429424 ?auto_1429427 ) ( CLEAR ?auto_1429424 ) ( IS-CRATE ?auto_1429425 ) ( not ( = ?auto_1429424 ?auto_1429425 ) ) ( AVAILABLE ?auto_1429429 ) ( IN ?auto_1429425 ?auto_1429426 ) ( ON ?auto_1429424 ?auto_1429420 ) ( not ( = ?auto_1429420 ?auto_1429424 ) ) ( not ( = ?auto_1429420 ?auto_1429425 ) ) ( TRUCK-AT ?auto_1429426 ?auto_1429428 ) ( not ( = ?auto_1429428 ?auto_1429427 ) ) ( ON ?auto_1429422 ?auto_1429421 ) ( ON ?auto_1429423 ?auto_1429422 ) ( ON ?auto_1429420 ?auto_1429423 ) ( not ( = ?auto_1429421 ?auto_1429422 ) ) ( not ( = ?auto_1429421 ?auto_1429423 ) ) ( not ( = ?auto_1429421 ?auto_1429420 ) ) ( not ( = ?auto_1429421 ?auto_1429424 ) ) ( not ( = ?auto_1429421 ?auto_1429425 ) ) ( not ( = ?auto_1429422 ?auto_1429423 ) ) ( not ( = ?auto_1429422 ?auto_1429420 ) ) ( not ( = ?auto_1429422 ?auto_1429424 ) ) ( not ( = ?auto_1429422 ?auto_1429425 ) ) ( not ( = ?auto_1429423 ?auto_1429420 ) ) ( not ( = ?auto_1429423 ?auto_1429424 ) ) ( not ( = ?auto_1429423 ?auto_1429425 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1429420 ?auto_1429424 ?auto_1429425 )
      ( MAKE-5CRATE-VERIFY ?auto_1429421 ?auto_1429422 ?auto_1429423 ?auto_1429420 ?auto_1429424 ?auto_1429425 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1429466 - SURFACE
      ?auto_1429467 - SURFACE
      ?auto_1429468 - SURFACE
      ?auto_1429465 - SURFACE
      ?auto_1429469 - SURFACE
      ?auto_1429470 - SURFACE
    )
    :vars
    (
      ?auto_1429471 - HOIST
      ?auto_1429475 - PLACE
      ?auto_1429473 - TRUCK
      ?auto_1429474 - PLACE
      ?auto_1429472 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1429471 ?auto_1429475 ) ( SURFACE-AT ?auto_1429469 ?auto_1429475 ) ( CLEAR ?auto_1429469 ) ( IS-CRATE ?auto_1429470 ) ( not ( = ?auto_1429469 ?auto_1429470 ) ) ( AVAILABLE ?auto_1429471 ) ( ON ?auto_1429469 ?auto_1429465 ) ( not ( = ?auto_1429465 ?auto_1429469 ) ) ( not ( = ?auto_1429465 ?auto_1429470 ) ) ( TRUCK-AT ?auto_1429473 ?auto_1429474 ) ( not ( = ?auto_1429474 ?auto_1429475 ) ) ( HOIST-AT ?auto_1429472 ?auto_1429474 ) ( LIFTING ?auto_1429472 ?auto_1429470 ) ( not ( = ?auto_1429471 ?auto_1429472 ) ) ( ON ?auto_1429467 ?auto_1429466 ) ( ON ?auto_1429468 ?auto_1429467 ) ( ON ?auto_1429465 ?auto_1429468 ) ( not ( = ?auto_1429466 ?auto_1429467 ) ) ( not ( = ?auto_1429466 ?auto_1429468 ) ) ( not ( = ?auto_1429466 ?auto_1429465 ) ) ( not ( = ?auto_1429466 ?auto_1429469 ) ) ( not ( = ?auto_1429466 ?auto_1429470 ) ) ( not ( = ?auto_1429467 ?auto_1429468 ) ) ( not ( = ?auto_1429467 ?auto_1429465 ) ) ( not ( = ?auto_1429467 ?auto_1429469 ) ) ( not ( = ?auto_1429467 ?auto_1429470 ) ) ( not ( = ?auto_1429468 ?auto_1429465 ) ) ( not ( = ?auto_1429468 ?auto_1429469 ) ) ( not ( = ?auto_1429468 ?auto_1429470 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1429465 ?auto_1429469 ?auto_1429470 )
      ( MAKE-5CRATE-VERIFY ?auto_1429466 ?auto_1429467 ?auto_1429468 ?auto_1429465 ?auto_1429469 ?auto_1429470 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1429516 - SURFACE
      ?auto_1429517 - SURFACE
      ?auto_1429518 - SURFACE
      ?auto_1429515 - SURFACE
      ?auto_1429519 - SURFACE
      ?auto_1429520 - SURFACE
    )
    :vars
    (
      ?auto_1429525 - HOIST
      ?auto_1429524 - PLACE
      ?auto_1429526 - TRUCK
      ?auto_1429522 - PLACE
      ?auto_1429521 - HOIST
      ?auto_1429523 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1429525 ?auto_1429524 ) ( SURFACE-AT ?auto_1429519 ?auto_1429524 ) ( CLEAR ?auto_1429519 ) ( IS-CRATE ?auto_1429520 ) ( not ( = ?auto_1429519 ?auto_1429520 ) ) ( AVAILABLE ?auto_1429525 ) ( ON ?auto_1429519 ?auto_1429515 ) ( not ( = ?auto_1429515 ?auto_1429519 ) ) ( not ( = ?auto_1429515 ?auto_1429520 ) ) ( TRUCK-AT ?auto_1429526 ?auto_1429522 ) ( not ( = ?auto_1429522 ?auto_1429524 ) ) ( HOIST-AT ?auto_1429521 ?auto_1429522 ) ( not ( = ?auto_1429525 ?auto_1429521 ) ) ( AVAILABLE ?auto_1429521 ) ( SURFACE-AT ?auto_1429520 ?auto_1429522 ) ( ON ?auto_1429520 ?auto_1429523 ) ( CLEAR ?auto_1429520 ) ( not ( = ?auto_1429519 ?auto_1429523 ) ) ( not ( = ?auto_1429520 ?auto_1429523 ) ) ( not ( = ?auto_1429515 ?auto_1429523 ) ) ( ON ?auto_1429517 ?auto_1429516 ) ( ON ?auto_1429518 ?auto_1429517 ) ( ON ?auto_1429515 ?auto_1429518 ) ( not ( = ?auto_1429516 ?auto_1429517 ) ) ( not ( = ?auto_1429516 ?auto_1429518 ) ) ( not ( = ?auto_1429516 ?auto_1429515 ) ) ( not ( = ?auto_1429516 ?auto_1429519 ) ) ( not ( = ?auto_1429516 ?auto_1429520 ) ) ( not ( = ?auto_1429516 ?auto_1429523 ) ) ( not ( = ?auto_1429517 ?auto_1429518 ) ) ( not ( = ?auto_1429517 ?auto_1429515 ) ) ( not ( = ?auto_1429517 ?auto_1429519 ) ) ( not ( = ?auto_1429517 ?auto_1429520 ) ) ( not ( = ?auto_1429517 ?auto_1429523 ) ) ( not ( = ?auto_1429518 ?auto_1429515 ) ) ( not ( = ?auto_1429518 ?auto_1429519 ) ) ( not ( = ?auto_1429518 ?auto_1429520 ) ) ( not ( = ?auto_1429518 ?auto_1429523 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1429515 ?auto_1429519 ?auto_1429520 )
      ( MAKE-5CRATE-VERIFY ?auto_1429516 ?auto_1429517 ?auto_1429518 ?auto_1429515 ?auto_1429519 ?auto_1429520 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1429567 - SURFACE
      ?auto_1429568 - SURFACE
      ?auto_1429569 - SURFACE
      ?auto_1429566 - SURFACE
      ?auto_1429570 - SURFACE
      ?auto_1429571 - SURFACE
    )
    :vars
    (
      ?auto_1429576 - HOIST
      ?auto_1429572 - PLACE
      ?auto_1429575 - PLACE
      ?auto_1429574 - HOIST
      ?auto_1429577 - SURFACE
      ?auto_1429573 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1429576 ?auto_1429572 ) ( SURFACE-AT ?auto_1429570 ?auto_1429572 ) ( CLEAR ?auto_1429570 ) ( IS-CRATE ?auto_1429571 ) ( not ( = ?auto_1429570 ?auto_1429571 ) ) ( AVAILABLE ?auto_1429576 ) ( ON ?auto_1429570 ?auto_1429566 ) ( not ( = ?auto_1429566 ?auto_1429570 ) ) ( not ( = ?auto_1429566 ?auto_1429571 ) ) ( not ( = ?auto_1429575 ?auto_1429572 ) ) ( HOIST-AT ?auto_1429574 ?auto_1429575 ) ( not ( = ?auto_1429576 ?auto_1429574 ) ) ( AVAILABLE ?auto_1429574 ) ( SURFACE-AT ?auto_1429571 ?auto_1429575 ) ( ON ?auto_1429571 ?auto_1429577 ) ( CLEAR ?auto_1429571 ) ( not ( = ?auto_1429570 ?auto_1429577 ) ) ( not ( = ?auto_1429571 ?auto_1429577 ) ) ( not ( = ?auto_1429566 ?auto_1429577 ) ) ( TRUCK-AT ?auto_1429573 ?auto_1429572 ) ( ON ?auto_1429568 ?auto_1429567 ) ( ON ?auto_1429569 ?auto_1429568 ) ( ON ?auto_1429566 ?auto_1429569 ) ( not ( = ?auto_1429567 ?auto_1429568 ) ) ( not ( = ?auto_1429567 ?auto_1429569 ) ) ( not ( = ?auto_1429567 ?auto_1429566 ) ) ( not ( = ?auto_1429567 ?auto_1429570 ) ) ( not ( = ?auto_1429567 ?auto_1429571 ) ) ( not ( = ?auto_1429567 ?auto_1429577 ) ) ( not ( = ?auto_1429568 ?auto_1429569 ) ) ( not ( = ?auto_1429568 ?auto_1429566 ) ) ( not ( = ?auto_1429568 ?auto_1429570 ) ) ( not ( = ?auto_1429568 ?auto_1429571 ) ) ( not ( = ?auto_1429568 ?auto_1429577 ) ) ( not ( = ?auto_1429569 ?auto_1429566 ) ) ( not ( = ?auto_1429569 ?auto_1429570 ) ) ( not ( = ?auto_1429569 ?auto_1429571 ) ) ( not ( = ?auto_1429569 ?auto_1429577 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1429566 ?auto_1429570 ?auto_1429571 )
      ( MAKE-5CRATE-VERIFY ?auto_1429567 ?auto_1429568 ?auto_1429569 ?auto_1429566 ?auto_1429570 ?auto_1429571 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1429618 - SURFACE
      ?auto_1429619 - SURFACE
      ?auto_1429620 - SURFACE
      ?auto_1429617 - SURFACE
      ?auto_1429621 - SURFACE
      ?auto_1429622 - SURFACE
    )
    :vars
    (
      ?auto_1429625 - HOIST
      ?auto_1429627 - PLACE
      ?auto_1429623 - PLACE
      ?auto_1429624 - HOIST
      ?auto_1429628 - SURFACE
      ?auto_1429626 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1429625 ?auto_1429627 ) ( IS-CRATE ?auto_1429622 ) ( not ( = ?auto_1429621 ?auto_1429622 ) ) ( not ( = ?auto_1429617 ?auto_1429621 ) ) ( not ( = ?auto_1429617 ?auto_1429622 ) ) ( not ( = ?auto_1429623 ?auto_1429627 ) ) ( HOIST-AT ?auto_1429624 ?auto_1429623 ) ( not ( = ?auto_1429625 ?auto_1429624 ) ) ( AVAILABLE ?auto_1429624 ) ( SURFACE-AT ?auto_1429622 ?auto_1429623 ) ( ON ?auto_1429622 ?auto_1429628 ) ( CLEAR ?auto_1429622 ) ( not ( = ?auto_1429621 ?auto_1429628 ) ) ( not ( = ?auto_1429622 ?auto_1429628 ) ) ( not ( = ?auto_1429617 ?auto_1429628 ) ) ( TRUCK-AT ?auto_1429626 ?auto_1429627 ) ( SURFACE-AT ?auto_1429617 ?auto_1429627 ) ( CLEAR ?auto_1429617 ) ( LIFTING ?auto_1429625 ?auto_1429621 ) ( IS-CRATE ?auto_1429621 ) ( ON ?auto_1429619 ?auto_1429618 ) ( ON ?auto_1429620 ?auto_1429619 ) ( ON ?auto_1429617 ?auto_1429620 ) ( not ( = ?auto_1429618 ?auto_1429619 ) ) ( not ( = ?auto_1429618 ?auto_1429620 ) ) ( not ( = ?auto_1429618 ?auto_1429617 ) ) ( not ( = ?auto_1429618 ?auto_1429621 ) ) ( not ( = ?auto_1429618 ?auto_1429622 ) ) ( not ( = ?auto_1429618 ?auto_1429628 ) ) ( not ( = ?auto_1429619 ?auto_1429620 ) ) ( not ( = ?auto_1429619 ?auto_1429617 ) ) ( not ( = ?auto_1429619 ?auto_1429621 ) ) ( not ( = ?auto_1429619 ?auto_1429622 ) ) ( not ( = ?auto_1429619 ?auto_1429628 ) ) ( not ( = ?auto_1429620 ?auto_1429617 ) ) ( not ( = ?auto_1429620 ?auto_1429621 ) ) ( not ( = ?auto_1429620 ?auto_1429622 ) ) ( not ( = ?auto_1429620 ?auto_1429628 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1429617 ?auto_1429621 ?auto_1429622 )
      ( MAKE-5CRATE-VERIFY ?auto_1429618 ?auto_1429619 ?auto_1429620 ?auto_1429617 ?auto_1429621 ?auto_1429622 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1429669 - SURFACE
      ?auto_1429670 - SURFACE
      ?auto_1429671 - SURFACE
      ?auto_1429668 - SURFACE
      ?auto_1429672 - SURFACE
      ?auto_1429673 - SURFACE
    )
    :vars
    (
      ?auto_1429674 - HOIST
      ?auto_1429676 - PLACE
      ?auto_1429679 - PLACE
      ?auto_1429675 - HOIST
      ?auto_1429678 - SURFACE
      ?auto_1429677 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1429674 ?auto_1429676 ) ( IS-CRATE ?auto_1429673 ) ( not ( = ?auto_1429672 ?auto_1429673 ) ) ( not ( = ?auto_1429668 ?auto_1429672 ) ) ( not ( = ?auto_1429668 ?auto_1429673 ) ) ( not ( = ?auto_1429679 ?auto_1429676 ) ) ( HOIST-AT ?auto_1429675 ?auto_1429679 ) ( not ( = ?auto_1429674 ?auto_1429675 ) ) ( AVAILABLE ?auto_1429675 ) ( SURFACE-AT ?auto_1429673 ?auto_1429679 ) ( ON ?auto_1429673 ?auto_1429678 ) ( CLEAR ?auto_1429673 ) ( not ( = ?auto_1429672 ?auto_1429678 ) ) ( not ( = ?auto_1429673 ?auto_1429678 ) ) ( not ( = ?auto_1429668 ?auto_1429678 ) ) ( TRUCK-AT ?auto_1429677 ?auto_1429676 ) ( SURFACE-AT ?auto_1429668 ?auto_1429676 ) ( CLEAR ?auto_1429668 ) ( IS-CRATE ?auto_1429672 ) ( AVAILABLE ?auto_1429674 ) ( IN ?auto_1429672 ?auto_1429677 ) ( ON ?auto_1429670 ?auto_1429669 ) ( ON ?auto_1429671 ?auto_1429670 ) ( ON ?auto_1429668 ?auto_1429671 ) ( not ( = ?auto_1429669 ?auto_1429670 ) ) ( not ( = ?auto_1429669 ?auto_1429671 ) ) ( not ( = ?auto_1429669 ?auto_1429668 ) ) ( not ( = ?auto_1429669 ?auto_1429672 ) ) ( not ( = ?auto_1429669 ?auto_1429673 ) ) ( not ( = ?auto_1429669 ?auto_1429678 ) ) ( not ( = ?auto_1429670 ?auto_1429671 ) ) ( not ( = ?auto_1429670 ?auto_1429668 ) ) ( not ( = ?auto_1429670 ?auto_1429672 ) ) ( not ( = ?auto_1429670 ?auto_1429673 ) ) ( not ( = ?auto_1429670 ?auto_1429678 ) ) ( not ( = ?auto_1429671 ?auto_1429668 ) ) ( not ( = ?auto_1429671 ?auto_1429672 ) ) ( not ( = ?auto_1429671 ?auto_1429673 ) ) ( not ( = ?auto_1429671 ?auto_1429678 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1429668 ?auto_1429672 ?auto_1429673 )
      ( MAKE-5CRATE-VERIFY ?auto_1429669 ?auto_1429670 ?auto_1429671 ?auto_1429668 ?auto_1429672 ?auto_1429673 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1430348 - SURFACE
      ?auto_1430349 - SURFACE
    )
    :vars
    (
      ?auto_1430354 - HOIST
      ?auto_1430352 - PLACE
      ?auto_1430353 - SURFACE
      ?auto_1430350 - PLACE
      ?auto_1430356 - HOIST
      ?auto_1430355 - SURFACE
      ?auto_1430351 - TRUCK
      ?auto_1430357 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1430354 ?auto_1430352 ) ( SURFACE-AT ?auto_1430348 ?auto_1430352 ) ( CLEAR ?auto_1430348 ) ( IS-CRATE ?auto_1430349 ) ( not ( = ?auto_1430348 ?auto_1430349 ) ) ( ON ?auto_1430348 ?auto_1430353 ) ( not ( = ?auto_1430353 ?auto_1430348 ) ) ( not ( = ?auto_1430353 ?auto_1430349 ) ) ( not ( = ?auto_1430350 ?auto_1430352 ) ) ( HOIST-AT ?auto_1430356 ?auto_1430350 ) ( not ( = ?auto_1430354 ?auto_1430356 ) ) ( AVAILABLE ?auto_1430356 ) ( SURFACE-AT ?auto_1430349 ?auto_1430350 ) ( ON ?auto_1430349 ?auto_1430355 ) ( CLEAR ?auto_1430349 ) ( not ( = ?auto_1430348 ?auto_1430355 ) ) ( not ( = ?auto_1430349 ?auto_1430355 ) ) ( not ( = ?auto_1430353 ?auto_1430355 ) ) ( TRUCK-AT ?auto_1430351 ?auto_1430352 ) ( LIFTING ?auto_1430354 ?auto_1430357 ) ( IS-CRATE ?auto_1430357 ) ( not ( = ?auto_1430348 ?auto_1430357 ) ) ( not ( = ?auto_1430349 ?auto_1430357 ) ) ( not ( = ?auto_1430353 ?auto_1430357 ) ) ( not ( = ?auto_1430355 ?auto_1430357 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1430354 ?auto_1430357 ?auto_1430351 ?auto_1430352 )
      ( MAKE-1CRATE ?auto_1430348 ?auto_1430349 )
      ( MAKE-1CRATE-VERIFY ?auto_1430348 ?auto_1430349 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1430875 - SURFACE
      ?auto_1430876 - SURFACE
      ?auto_1430877 - SURFACE
      ?auto_1430874 - SURFACE
      ?auto_1430878 - SURFACE
      ?auto_1430880 - SURFACE
      ?auto_1430879 - SURFACE
    )
    :vars
    (
      ?auto_1430882 - HOIST
      ?auto_1430881 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1430882 ?auto_1430881 ) ( SURFACE-AT ?auto_1430880 ?auto_1430881 ) ( CLEAR ?auto_1430880 ) ( LIFTING ?auto_1430882 ?auto_1430879 ) ( IS-CRATE ?auto_1430879 ) ( not ( = ?auto_1430880 ?auto_1430879 ) ) ( ON ?auto_1430876 ?auto_1430875 ) ( ON ?auto_1430877 ?auto_1430876 ) ( ON ?auto_1430874 ?auto_1430877 ) ( ON ?auto_1430878 ?auto_1430874 ) ( ON ?auto_1430880 ?auto_1430878 ) ( not ( = ?auto_1430875 ?auto_1430876 ) ) ( not ( = ?auto_1430875 ?auto_1430877 ) ) ( not ( = ?auto_1430875 ?auto_1430874 ) ) ( not ( = ?auto_1430875 ?auto_1430878 ) ) ( not ( = ?auto_1430875 ?auto_1430880 ) ) ( not ( = ?auto_1430875 ?auto_1430879 ) ) ( not ( = ?auto_1430876 ?auto_1430877 ) ) ( not ( = ?auto_1430876 ?auto_1430874 ) ) ( not ( = ?auto_1430876 ?auto_1430878 ) ) ( not ( = ?auto_1430876 ?auto_1430880 ) ) ( not ( = ?auto_1430876 ?auto_1430879 ) ) ( not ( = ?auto_1430877 ?auto_1430874 ) ) ( not ( = ?auto_1430877 ?auto_1430878 ) ) ( not ( = ?auto_1430877 ?auto_1430880 ) ) ( not ( = ?auto_1430877 ?auto_1430879 ) ) ( not ( = ?auto_1430874 ?auto_1430878 ) ) ( not ( = ?auto_1430874 ?auto_1430880 ) ) ( not ( = ?auto_1430874 ?auto_1430879 ) ) ( not ( = ?auto_1430878 ?auto_1430880 ) ) ( not ( = ?auto_1430878 ?auto_1430879 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1430880 ?auto_1430879 )
      ( MAKE-6CRATE-VERIFY ?auto_1430875 ?auto_1430876 ?auto_1430877 ?auto_1430874 ?auto_1430878 ?auto_1430880 ?auto_1430879 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1430919 - SURFACE
      ?auto_1430920 - SURFACE
      ?auto_1430921 - SURFACE
      ?auto_1430918 - SURFACE
      ?auto_1430922 - SURFACE
      ?auto_1430924 - SURFACE
      ?auto_1430923 - SURFACE
    )
    :vars
    (
      ?auto_1430926 - HOIST
      ?auto_1430927 - PLACE
      ?auto_1430925 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1430926 ?auto_1430927 ) ( SURFACE-AT ?auto_1430924 ?auto_1430927 ) ( CLEAR ?auto_1430924 ) ( IS-CRATE ?auto_1430923 ) ( not ( = ?auto_1430924 ?auto_1430923 ) ) ( TRUCK-AT ?auto_1430925 ?auto_1430927 ) ( AVAILABLE ?auto_1430926 ) ( IN ?auto_1430923 ?auto_1430925 ) ( ON ?auto_1430924 ?auto_1430922 ) ( not ( = ?auto_1430922 ?auto_1430924 ) ) ( not ( = ?auto_1430922 ?auto_1430923 ) ) ( ON ?auto_1430920 ?auto_1430919 ) ( ON ?auto_1430921 ?auto_1430920 ) ( ON ?auto_1430918 ?auto_1430921 ) ( ON ?auto_1430922 ?auto_1430918 ) ( not ( = ?auto_1430919 ?auto_1430920 ) ) ( not ( = ?auto_1430919 ?auto_1430921 ) ) ( not ( = ?auto_1430919 ?auto_1430918 ) ) ( not ( = ?auto_1430919 ?auto_1430922 ) ) ( not ( = ?auto_1430919 ?auto_1430924 ) ) ( not ( = ?auto_1430919 ?auto_1430923 ) ) ( not ( = ?auto_1430920 ?auto_1430921 ) ) ( not ( = ?auto_1430920 ?auto_1430918 ) ) ( not ( = ?auto_1430920 ?auto_1430922 ) ) ( not ( = ?auto_1430920 ?auto_1430924 ) ) ( not ( = ?auto_1430920 ?auto_1430923 ) ) ( not ( = ?auto_1430921 ?auto_1430918 ) ) ( not ( = ?auto_1430921 ?auto_1430922 ) ) ( not ( = ?auto_1430921 ?auto_1430924 ) ) ( not ( = ?auto_1430921 ?auto_1430923 ) ) ( not ( = ?auto_1430918 ?auto_1430922 ) ) ( not ( = ?auto_1430918 ?auto_1430924 ) ) ( not ( = ?auto_1430918 ?auto_1430923 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1430922 ?auto_1430924 ?auto_1430923 )
      ( MAKE-6CRATE-VERIFY ?auto_1430919 ?auto_1430920 ?auto_1430921 ?auto_1430918 ?auto_1430922 ?auto_1430924 ?auto_1430923 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1430970 - SURFACE
      ?auto_1430971 - SURFACE
      ?auto_1430972 - SURFACE
      ?auto_1430969 - SURFACE
      ?auto_1430973 - SURFACE
      ?auto_1430975 - SURFACE
      ?auto_1430974 - SURFACE
    )
    :vars
    (
      ?auto_1430977 - HOIST
      ?auto_1430979 - PLACE
      ?auto_1430978 - TRUCK
      ?auto_1430976 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1430977 ?auto_1430979 ) ( SURFACE-AT ?auto_1430975 ?auto_1430979 ) ( CLEAR ?auto_1430975 ) ( IS-CRATE ?auto_1430974 ) ( not ( = ?auto_1430975 ?auto_1430974 ) ) ( AVAILABLE ?auto_1430977 ) ( IN ?auto_1430974 ?auto_1430978 ) ( ON ?auto_1430975 ?auto_1430973 ) ( not ( = ?auto_1430973 ?auto_1430975 ) ) ( not ( = ?auto_1430973 ?auto_1430974 ) ) ( TRUCK-AT ?auto_1430978 ?auto_1430976 ) ( not ( = ?auto_1430976 ?auto_1430979 ) ) ( ON ?auto_1430971 ?auto_1430970 ) ( ON ?auto_1430972 ?auto_1430971 ) ( ON ?auto_1430969 ?auto_1430972 ) ( ON ?auto_1430973 ?auto_1430969 ) ( not ( = ?auto_1430970 ?auto_1430971 ) ) ( not ( = ?auto_1430970 ?auto_1430972 ) ) ( not ( = ?auto_1430970 ?auto_1430969 ) ) ( not ( = ?auto_1430970 ?auto_1430973 ) ) ( not ( = ?auto_1430970 ?auto_1430975 ) ) ( not ( = ?auto_1430970 ?auto_1430974 ) ) ( not ( = ?auto_1430971 ?auto_1430972 ) ) ( not ( = ?auto_1430971 ?auto_1430969 ) ) ( not ( = ?auto_1430971 ?auto_1430973 ) ) ( not ( = ?auto_1430971 ?auto_1430975 ) ) ( not ( = ?auto_1430971 ?auto_1430974 ) ) ( not ( = ?auto_1430972 ?auto_1430969 ) ) ( not ( = ?auto_1430972 ?auto_1430973 ) ) ( not ( = ?auto_1430972 ?auto_1430975 ) ) ( not ( = ?auto_1430972 ?auto_1430974 ) ) ( not ( = ?auto_1430969 ?auto_1430973 ) ) ( not ( = ?auto_1430969 ?auto_1430975 ) ) ( not ( = ?auto_1430969 ?auto_1430974 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1430973 ?auto_1430975 ?auto_1430974 )
      ( MAKE-6CRATE-VERIFY ?auto_1430970 ?auto_1430971 ?auto_1430972 ?auto_1430969 ?auto_1430973 ?auto_1430975 ?auto_1430974 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1431027 - SURFACE
      ?auto_1431028 - SURFACE
      ?auto_1431029 - SURFACE
      ?auto_1431026 - SURFACE
      ?auto_1431030 - SURFACE
      ?auto_1431032 - SURFACE
      ?auto_1431031 - SURFACE
    )
    :vars
    (
      ?auto_1431036 - HOIST
      ?auto_1431034 - PLACE
      ?auto_1431033 - TRUCK
      ?auto_1431035 - PLACE
      ?auto_1431037 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1431036 ?auto_1431034 ) ( SURFACE-AT ?auto_1431032 ?auto_1431034 ) ( CLEAR ?auto_1431032 ) ( IS-CRATE ?auto_1431031 ) ( not ( = ?auto_1431032 ?auto_1431031 ) ) ( AVAILABLE ?auto_1431036 ) ( ON ?auto_1431032 ?auto_1431030 ) ( not ( = ?auto_1431030 ?auto_1431032 ) ) ( not ( = ?auto_1431030 ?auto_1431031 ) ) ( TRUCK-AT ?auto_1431033 ?auto_1431035 ) ( not ( = ?auto_1431035 ?auto_1431034 ) ) ( HOIST-AT ?auto_1431037 ?auto_1431035 ) ( LIFTING ?auto_1431037 ?auto_1431031 ) ( not ( = ?auto_1431036 ?auto_1431037 ) ) ( ON ?auto_1431028 ?auto_1431027 ) ( ON ?auto_1431029 ?auto_1431028 ) ( ON ?auto_1431026 ?auto_1431029 ) ( ON ?auto_1431030 ?auto_1431026 ) ( not ( = ?auto_1431027 ?auto_1431028 ) ) ( not ( = ?auto_1431027 ?auto_1431029 ) ) ( not ( = ?auto_1431027 ?auto_1431026 ) ) ( not ( = ?auto_1431027 ?auto_1431030 ) ) ( not ( = ?auto_1431027 ?auto_1431032 ) ) ( not ( = ?auto_1431027 ?auto_1431031 ) ) ( not ( = ?auto_1431028 ?auto_1431029 ) ) ( not ( = ?auto_1431028 ?auto_1431026 ) ) ( not ( = ?auto_1431028 ?auto_1431030 ) ) ( not ( = ?auto_1431028 ?auto_1431032 ) ) ( not ( = ?auto_1431028 ?auto_1431031 ) ) ( not ( = ?auto_1431029 ?auto_1431026 ) ) ( not ( = ?auto_1431029 ?auto_1431030 ) ) ( not ( = ?auto_1431029 ?auto_1431032 ) ) ( not ( = ?auto_1431029 ?auto_1431031 ) ) ( not ( = ?auto_1431026 ?auto_1431030 ) ) ( not ( = ?auto_1431026 ?auto_1431032 ) ) ( not ( = ?auto_1431026 ?auto_1431031 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1431030 ?auto_1431032 ?auto_1431031 )
      ( MAKE-6CRATE-VERIFY ?auto_1431027 ?auto_1431028 ?auto_1431029 ?auto_1431026 ?auto_1431030 ?auto_1431032 ?auto_1431031 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1431090 - SURFACE
      ?auto_1431091 - SURFACE
      ?auto_1431092 - SURFACE
      ?auto_1431089 - SURFACE
      ?auto_1431093 - SURFACE
      ?auto_1431095 - SURFACE
      ?auto_1431094 - SURFACE
    )
    :vars
    (
      ?auto_1431097 - HOIST
      ?auto_1431099 - PLACE
      ?auto_1431100 - TRUCK
      ?auto_1431096 - PLACE
      ?auto_1431101 - HOIST
      ?auto_1431098 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1431097 ?auto_1431099 ) ( SURFACE-AT ?auto_1431095 ?auto_1431099 ) ( CLEAR ?auto_1431095 ) ( IS-CRATE ?auto_1431094 ) ( not ( = ?auto_1431095 ?auto_1431094 ) ) ( AVAILABLE ?auto_1431097 ) ( ON ?auto_1431095 ?auto_1431093 ) ( not ( = ?auto_1431093 ?auto_1431095 ) ) ( not ( = ?auto_1431093 ?auto_1431094 ) ) ( TRUCK-AT ?auto_1431100 ?auto_1431096 ) ( not ( = ?auto_1431096 ?auto_1431099 ) ) ( HOIST-AT ?auto_1431101 ?auto_1431096 ) ( not ( = ?auto_1431097 ?auto_1431101 ) ) ( AVAILABLE ?auto_1431101 ) ( SURFACE-AT ?auto_1431094 ?auto_1431096 ) ( ON ?auto_1431094 ?auto_1431098 ) ( CLEAR ?auto_1431094 ) ( not ( = ?auto_1431095 ?auto_1431098 ) ) ( not ( = ?auto_1431094 ?auto_1431098 ) ) ( not ( = ?auto_1431093 ?auto_1431098 ) ) ( ON ?auto_1431091 ?auto_1431090 ) ( ON ?auto_1431092 ?auto_1431091 ) ( ON ?auto_1431089 ?auto_1431092 ) ( ON ?auto_1431093 ?auto_1431089 ) ( not ( = ?auto_1431090 ?auto_1431091 ) ) ( not ( = ?auto_1431090 ?auto_1431092 ) ) ( not ( = ?auto_1431090 ?auto_1431089 ) ) ( not ( = ?auto_1431090 ?auto_1431093 ) ) ( not ( = ?auto_1431090 ?auto_1431095 ) ) ( not ( = ?auto_1431090 ?auto_1431094 ) ) ( not ( = ?auto_1431090 ?auto_1431098 ) ) ( not ( = ?auto_1431091 ?auto_1431092 ) ) ( not ( = ?auto_1431091 ?auto_1431089 ) ) ( not ( = ?auto_1431091 ?auto_1431093 ) ) ( not ( = ?auto_1431091 ?auto_1431095 ) ) ( not ( = ?auto_1431091 ?auto_1431094 ) ) ( not ( = ?auto_1431091 ?auto_1431098 ) ) ( not ( = ?auto_1431092 ?auto_1431089 ) ) ( not ( = ?auto_1431092 ?auto_1431093 ) ) ( not ( = ?auto_1431092 ?auto_1431095 ) ) ( not ( = ?auto_1431092 ?auto_1431094 ) ) ( not ( = ?auto_1431092 ?auto_1431098 ) ) ( not ( = ?auto_1431089 ?auto_1431093 ) ) ( not ( = ?auto_1431089 ?auto_1431095 ) ) ( not ( = ?auto_1431089 ?auto_1431094 ) ) ( not ( = ?auto_1431089 ?auto_1431098 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1431093 ?auto_1431095 ?auto_1431094 )
      ( MAKE-6CRATE-VERIFY ?auto_1431090 ?auto_1431091 ?auto_1431092 ?auto_1431089 ?auto_1431093 ?auto_1431095 ?auto_1431094 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1431154 - SURFACE
      ?auto_1431155 - SURFACE
      ?auto_1431156 - SURFACE
      ?auto_1431153 - SURFACE
      ?auto_1431157 - SURFACE
      ?auto_1431159 - SURFACE
      ?auto_1431158 - SURFACE
    )
    :vars
    (
      ?auto_1431165 - HOIST
      ?auto_1431160 - PLACE
      ?auto_1431164 - PLACE
      ?auto_1431162 - HOIST
      ?auto_1431163 - SURFACE
      ?auto_1431161 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1431165 ?auto_1431160 ) ( SURFACE-AT ?auto_1431159 ?auto_1431160 ) ( CLEAR ?auto_1431159 ) ( IS-CRATE ?auto_1431158 ) ( not ( = ?auto_1431159 ?auto_1431158 ) ) ( AVAILABLE ?auto_1431165 ) ( ON ?auto_1431159 ?auto_1431157 ) ( not ( = ?auto_1431157 ?auto_1431159 ) ) ( not ( = ?auto_1431157 ?auto_1431158 ) ) ( not ( = ?auto_1431164 ?auto_1431160 ) ) ( HOIST-AT ?auto_1431162 ?auto_1431164 ) ( not ( = ?auto_1431165 ?auto_1431162 ) ) ( AVAILABLE ?auto_1431162 ) ( SURFACE-AT ?auto_1431158 ?auto_1431164 ) ( ON ?auto_1431158 ?auto_1431163 ) ( CLEAR ?auto_1431158 ) ( not ( = ?auto_1431159 ?auto_1431163 ) ) ( not ( = ?auto_1431158 ?auto_1431163 ) ) ( not ( = ?auto_1431157 ?auto_1431163 ) ) ( TRUCK-AT ?auto_1431161 ?auto_1431160 ) ( ON ?auto_1431155 ?auto_1431154 ) ( ON ?auto_1431156 ?auto_1431155 ) ( ON ?auto_1431153 ?auto_1431156 ) ( ON ?auto_1431157 ?auto_1431153 ) ( not ( = ?auto_1431154 ?auto_1431155 ) ) ( not ( = ?auto_1431154 ?auto_1431156 ) ) ( not ( = ?auto_1431154 ?auto_1431153 ) ) ( not ( = ?auto_1431154 ?auto_1431157 ) ) ( not ( = ?auto_1431154 ?auto_1431159 ) ) ( not ( = ?auto_1431154 ?auto_1431158 ) ) ( not ( = ?auto_1431154 ?auto_1431163 ) ) ( not ( = ?auto_1431155 ?auto_1431156 ) ) ( not ( = ?auto_1431155 ?auto_1431153 ) ) ( not ( = ?auto_1431155 ?auto_1431157 ) ) ( not ( = ?auto_1431155 ?auto_1431159 ) ) ( not ( = ?auto_1431155 ?auto_1431158 ) ) ( not ( = ?auto_1431155 ?auto_1431163 ) ) ( not ( = ?auto_1431156 ?auto_1431153 ) ) ( not ( = ?auto_1431156 ?auto_1431157 ) ) ( not ( = ?auto_1431156 ?auto_1431159 ) ) ( not ( = ?auto_1431156 ?auto_1431158 ) ) ( not ( = ?auto_1431156 ?auto_1431163 ) ) ( not ( = ?auto_1431153 ?auto_1431157 ) ) ( not ( = ?auto_1431153 ?auto_1431159 ) ) ( not ( = ?auto_1431153 ?auto_1431158 ) ) ( not ( = ?auto_1431153 ?auto_1431163 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1431157 ?auto_1431159 ?auto_1431158 )
      ( MAKE-6CRATE-VERIFY ?auto_1431154 ?auto_1431155 ?auto_1431156 ?auto_1431153 ?auto_1431157 ?auto_1431159 ?auto_1431158 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1431218 - SURFACE
      ?auto_1431219 - SURFACE
      ?auto_1431220 - SURFACE
      ?auto_1431217 - SURFACE
      ?auto_1431221 - SURFACE
      ?auto_1431223 - SURFACE
      ?auto_1431222 - SURFACE
    )
    :vars
    (
      ?auto_1431226 - HOIST
      ?auto_1431225 - PLACE
      ?auto_1431227 - PLACE
      ?auto_1431228 - HOIST
      ?auto_1431224 - SURFACE
      ?auto_1431229 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1431226 ?auto_1431225 ) ( IS-CRATE ?auto_1431222 ) ( not ( = ?auto_1431223 ?auto_1431222 ) ) ( not ( = ?auto_1431221 ?auto_1431223 ) ) ( not ( = ?auto_1431221 ?auto_1431222 ) ) ( not ( = ?auto_1431227 ?auto_1431225 ) ) ( HOIST-AT ?auto_1431228 ?auto_1431227 ) ( not ( = ?auto_1431226 ?auto_1431228 ) ) ( AVAILABLE ?auto_1431228 ) ( SURFACE-AT ?auto_1431222 ?auto_1431227 ) ( ON ?auto_1431222 ?auto_1431224 ) ( CLEAR ?auto_1431222 ) ( not ( = ?auto_1431223 ?auto_1431224 ) ) ( not ( = ?auto_1431222 ?auto_1431224 ) ) ( not ( = ?auto_1431221 ?auto_1431224 ) ) ( TRUCK-AT ?auto_1431229 ?auto_1431225 ) ( SURFACE-AT ?auto_1431221 ?auto_1431225 ) ( CLEAR ?auto_1431221 ) ( LIFTING ?auto_1431226 ?auto_1431223 ) ( IS-CRATE ?auto_1431223 ) ( ON ?auto_1431219 ?auto_1431218 ) ( ON ?auto_1431220 ?auto_1431219 ) ( ON ?auto_1431217 ?auto_1431220 ) ( ON ?auto_1431221 ?auto_1431217 ) ( not ( = ?auto_1431218 ?auto_1431219 ) ) ( not ( = ?auto_1431218 ?auto_1431220 ) ) ( not ( = ?auto_1431218 ?auto_1431217 ) ) ( not ( = ?auto_1431218 ?auto_1431221 ) ) ( not ( = ?auto_1431218 ?auto_1431223 ) ) ( not ( = ?auto_1431218 ?auto_1431222 ) ) ( not ( = ?auto_1431218 ?auto_1431224 ) ) ( not ( = ?auto_1431219 ?auto_1431220 ) ) ( not ( = ?auto_1431219 ?auto_1431217 ) ) ( not ( = ?auto_1431219 ?auto_1431221 ) ) ( not ( = ?auto_1431219 ?auto_1431223 ) ) ( not ( = ?auto_1431219 ?auto_1431222 ) ) ( not ( = ?auto_1431219 ?auto_1431224 ) ) ( not ( = ?auto_1431220 ?auto_1431217 ) ) ( not ( = ?auto_1431220 ?auto_1431221 ) ) ( not ( = ?auto_1431220 ?auto_1431223 ) ) ( not ( = ?auto_1431220 ?auto_1431222 ) ) ( not ( = ?auto_1431220 ?auto_1431224 ) ) ( not ( = ?auto_1431217 ?auto_1431221 ) ) ( not ( = ?auto_1431217 ?auto_1431223 ) ) ( not ( = ?auto_1431217 ?auto_1431222 ) ) ( not ( = ?auto_1431217 ?auto_1431224 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1431221 ?auto_1431223 ?auto_1431222 )
      ( MAKE-6CRATE-VERIFY ?auto_1431218 ?auto_1431219 ?auto_1431220 ?auto_1431217 ?auto_1431221 ?auto_1431223 ?auto_1431222 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1431282 - SURFACE
      ?auto_1431283 - SURFACE
      ?auto_1431284 - SURFACE
      ?auto_1431281 - SURFACE
      ?auto_1431285 - SURFACE
      ?auto_1431287 - SURFACE
      ?auto_1431286 - SURFACE
    )
    :vars
    (
      ?auto_1431292 - HOIST
      ?auto_1431291 - PLACE
      ?auto_1431288 - PLACE
      ?auto_1431290 - HOIST
      ?auto_1431289 - SURFACE
      ?auto_1431293 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1431292 ?auto_1431291 ) ( IS-CRATE ?auto_1431286 ) ( not ( = ?auto_1431287 ?auto_1431286 ) ) ( not ( = ?auto_1431285 ?auto_1431287 ) ) ( not ( = ?auto_1431285 ?auto_1431286 ) ) ( not ( = ?auto_1431288 ?auto_1431291 ) ) ( HOIST-AT ?auto_1431290 ?auto_1431288 ) ( not ( = ?auto_1431292 ?auto_1431290 ) ) ( AVAILABLE ?auto_1431290 ) ( SURFACE-AT ?auto_1431286 ?auto_1431288 ) ( ON ?auto_1431286 ?auto_1431289 ) ( CLEAR ?auto_1431286 ) ( not ( = ?auto_1431287 ?auto_1431289 ) ) ( not ( = ?auto_1431286 ?auto_1431289 ) ) ( not ( = ?auto_1431285 ?auto_1431289 ) ) ( TRUCK-AT ?auto_1431293 ?auto_1431291 ) ( SURFACE-AT ?auto_1431285 ?auto_1431291 ) ( CLEAR ?auto_1431285 ) ( IS-CRATE ?auto_1431287 ) ( AVAILABLE ?auto_1431292 ) ( IN ?auto_1431287 ?auto_1431293 ) ( ON ?auto_1431283 ?auto_1431282 ) ( ON ?auto_1431284 ?auto_1431283 ) ( ON ?auto_1431281 ?auto_1431284 ) ( ON ?auto_1431285 ?auto_1431281 ) ( not ( = ?auto_1431282 ?auto_1431283 ) ) ( not ( = ?auto_1431282 ?auto_1431284 ) ) ( not ( = ?auto_1431282 ?auto_1431281 ) ) ( not ( = ?auto_1431282 ?auto_1431285 ) ) ( not ( = ?auto_1431282 ?auto_1431287 ) ) ( not ( = ?auto_1431282 ?auto_1431286 ) ) ( not ( = ?auto_1431282 ?auto_1431289 ) ) ( not ( = ?auto_1431283 ?auto_1431284 ) ) ( not ( = ?auto_1431283 ?auto_1431281 ) ) ( not ( = ?auto_1431283 ?auto_1431285 ) ) ( not ( = ?auto_1431283 ?auto_1431287 ) ) ( not ( = ?auto_1431283 ?auto_1431286 ) ) ( not ( = ?auto_1431283 ?auto_1431289 ) ) ( not ( = ?auto_1431284 ?auto_1431281 ) ) ( not ( = ?auto_1431284 ?auto_1431285 ) ) ( not ( = ?auto_1431284 ?auto_1431287 ) ) ( not ( = ?auto_1431284 ?auto_1431286 ) ) ( not ( = ?auto_1431284 ?auto_1431289 ) ) ( not ( = ?auto_1431281 ?auto_1431285 ) ) ( not ( = ?auto_1431281 ?auto_1431287 ) ) ( not ( = ?auto_1431281 ?auto_1431286 ) ) ( not ( = ?auto_1431281 ?auto_1431289 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1431285 ?auto_1431287 ?auto_1431286 )
      ( MAKE-6CRATE-VERIFY ?auto_1431282 ?auto_1431283 ?auto_1431284 ?auto_1431281 ?auto_1431285 ?auto_1431287 ?auto_1431286 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1433226 - SURFACE
      ?auto_1433227 - SURFACE
      ?auto_1433228 - SURFACE
      ?auto_1433225 - SURFACE
      ?auto_1433229 - SURFACE
      ?auto_1433231 - SURFACE
      ?auto_1433230 - SURFACE
      ?auto_1433232 - SURFACE
    )
    :vars
    (
      ?auto_1433233 - HOIST
      ?auto_1433234 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1433233 ?auto_1433234 ) ( SURFACE-AT ?auto_1433230 ?auto_1433234 ) ( CLEAR ?auto_1433230 ) ( LIFTING ?auto_1433233 ?auto_1433232 ) ( IS-CRATE ?auto_1433232 ) ( not ( = ?auto_1433230 ?auto_1433232 ) ) ( ON ?auto_1433227 ?auto_1433226 ) ( ON ?auto_1433228 ?auto_1433227 ) ( ON ?auto_1433225 ?auto_1433228 ) ( ON ?auto_1433229 ?auto_1433225 ) ( ON ?auto_1433231 ?auto_1433229 ) ( ON ?auto_1433230 ?auto_1433231 ) ( not ( = ?auto_1433226 ?auto_1433227 ) ) ( not ( = ?auto_1433226 ?auto_1433228 ) ) ( not ( = ?auto_1433226 ?auto_1433225 ) ) ( not ( = ?auto_1433226 ?auto_1433229 ) ) ( not ( = ?auto_1433226 ?auto_1433231 ) ) ( not ( = ?auto_1433226 ?auto_1433230 ) ) ( not ( = ?auto_1433226 ?auto_1433232 ) ) ( not ( = ?auto_1433227 ?auto_1433228 ) ) ( not ( = ?auto_1433227 ?auto_1433225 ) ) ( not ( = ?auto_1433227 ?auto_1433229 ) ) ( not ( = ?auto_1433227 ?auto_1433231 ) ) ( not ( = ?auto_1433227 ?auto_1433230 ) ) ( not ( = ?auto_1433227 ?auto_1433232 ) ) ( not ( = ?auto_1433228 ?auto_1433225 ) ) ( not ( = ?auto_1433228 ?auto_1433229 ) ) ( not ( = ?auto_1433228 ?auto_1433231 ) ) ( not ( = ?auto_1433228 ?auto_1433230 ) ) ( not ( = ?auto_1433228 ?auto_1433232 ) ) ( not ( = ?auto_1433225 ?auto_1433229 ) ) ( not ( = ?auto_1433225 ?auto_1433231 ) ) ( not ( = ?auto_1433225 ?auto_1433230 ) ) ( not ( = ?auto_1433225 ?auto_1433232 ) ) ( not ( = ?auto_1433229 ?auto_1433231 ) ) ( not ( = ?auto_1433229 ?auto_1433230 ) ) ( not ( = ?auto_1433229 ?auto_1433232 ) ) ( not ( = ?auto_1433231 ?auto_1433230 ) ) ( not ( = ?auto_1433231 ?auto_1433232 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1433230 ?auto_1433232 )
      ( MAKE-7CRATE-VERIFY ?auto_1433226 ?auto_1433227 ?auto_1433228 ?auto_1433225 ?auto_1433229 ?auto_1433231 ?auto_1433230 ?auto_1433232 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1433281 - SURFACE
      ?auto_1433282 - SURFACE
      ?auto_1433283 - SURFACE
      ?auto_1433280 - SURFACE
      ?auto_1433284 - SURFACE
      ?auto_1433286 - SURFACE
      ?auto_1433285 - SURFACE
      ?auto_1433287 - SURFACE
    )
    :vars
    (
      ?auto_1433288 - HOIST
      ?auto_1433289 - PLACE
      ?auto_1433290 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1433288 ?auto_1433289 ) ( SURFACE-AT ?auto_1433285 ?auto_1433289 ) ( CLEAR ?auto_1433285 ) ( IS-CRATE ?auto_1433287 ) ( not ( = ?auto_1433285 ?auto_1433287 ) ) ( TRUCK-AT ?auto_1433290 ?auto_1433289 ) ( AVAILABLE ?auto_1433288 ) ( IN ?auto_1433287 ?auto_1433290 ) ( ON ?auto_1433285 ?auto_1433286 ) ( not ( = ?auto_1433286 ?auto_1433285 ) ) ( not ( = ?auto_1433286 ?auto_1433287 ) ) ( ON ?auto_1433282 ?auto_1433281 ) ( ON ?auto_1433283 ?auto_1433282 ) ( ON ?auto_1433280 ?auto_1433283 ) ( ON ?auto_1433284 ?auto_1433280 ) ( ON ?auto_1433286 ?auto_1433284 ) ( not ( = ?auto_1433281 ?auto_1433282 ) ) ( not ( = ?auto_1433281 ?auto_1433283 ) ) ( not ( = ?auto_1433281 ?auto_1433280 ) ) ( not ( = ?auto_1433281 ?auto_1433284 ) ) ( not ( = ?auto_1433281 ?auto_1433286 ) ) ( not ( = ?auto_1433281 ?auto_1433285 ) ) ( not ( = ?auto_1433281 ?auto_1433287 ) ) ( not ( = ?auto_1433282 ?auto_1433283 ) ) ( not ( = ?auto_1433282 ?auto_1433280 ) ) ( not ( = ?auto_1433282 ?auto_1433284 ) ) ( not ( = ?auto_1433282 ?auto_1433286 ) ) ( not ( = ?auto_1433282 ?auto_1433285 ) ) ( not ( = ?auto_1433282 ?auto_1433287 ) ) ( not ( = ?auto_1433283 ?auto_1433280 ) ) ( not ( = ?auto_1433283 ?auto_1433284 ) ) ( not ( = ?auto_1433283 ?auto_1433286 ) ) ( not ( = ?auto_1433283 ?auto_1433285 ) ) ( not ( = ?auto_1433283 ?auto_1433287 ) ) ( not ( = ?auto_1433280 ?auto_1433284 ) ) ( not ( = ?auto_1433280 ?auto_1433286 ) ) ( not ( = ?auto_1433280 ?auto_1433285 ) ) ( not ( = ?auto_1433280 ?auto_1433287 ) ) ( not ( = ?auto_1433284 ?auto_1433286 ) ) ( not ( = ?auto_1433284 ?auto_1433285 ) ) ( not ( = ?auto_1433284 ?auto_1433287 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1433286 ?auto_1433285 ?auto_1433287 )
      ( MAKE-7CRATE-VERIFY ?auto_1433281 ?auto_1433282 ?auto_1433283 ?auto_1433280 ?auto_1433284 ?auto_1433286 ?auto_1433285 ?auto_1433287 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1433344 - SURFACE
      ?auto_1433345 - SURFACE
      ?auto_1433346 - SURFACE
      ?auto_1433343 - SURFACE
      ?auto_1433347 - SURFACE
      ?auto_1433349 - SURFACE
      ?auto_1433348 - SURFACE
      ?auto_1433350 - SURFACE
    )
    :vars
    (
      ?auto_1433352 - HOIST
      ?auto_1433351 - PLACE
      ?auto_1433354 - TRUCK
      ?auto_1433353 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1433352 ?auto_1433351 ) ( SURFACE-AT ?auto_1433348 ?auto_1433351 ) ( CLEAR ?auto_1433348 ) ( IS-CRATE ?auto_1433350 ) ( not ( = ?auto_1433348 ?auto_1433350 ) ) ( AVAILABLE ?auto_1433352 ) ( IN ?auto_1433350 ?auto_1433354 ) ( ON ?auto_1433348 ?auto_1433349 ) ( not ( = ?auto_1433349 ?auto_1433348 ) ) ( not ( = ?auto_1433349 ?auto_1433350 ) ) ( TRUCK-AT ?auto_1433354 ?auto_1433353 ) ( not ( = ?auto_1433353 ?auto_1433351 ) ) ( ON ?auto_1433345 ?auto_1433344 ) ( ON ?auto_1433346 ?auto_1433345 ) ( ON ?auto_1433343 ?auto_1433346 ) ( ON ?auto_1433347 ?auto_1433343 ) ( ON ?auto_1433349 ?auto_1433347 ) ( not ( = ?auto_1433344 ?auto_1433345 ) ) ( not ( = ?auto_1433344 ?auto_1433346 ) ) ( not ( = ?auto_1433344 ?auto_1433343 ) ) ( not ( = ?auto_1433344 ?auto_1433347 ) ) ( not ( = ?auto_1433344 ?auto_1433349 ) ) ( not ( = ?auto_1433344 ?auto_1433348 ) ) ( not ( = ?auto_1433344 ?auto_1433350 ) ) ( not ( = ?auto_1433345 ?auto_1433346 ) ) ( not ( = ?auto_1433345 ?auto_1433343 ) ) ( not ( = ?auto_1433345 ?auto_1433347 ) ) ( not ( = ?auto_1433345 ?auto_1433349 ) ) ( not ( = ?auto_1433345 ?auto_1433348 ) ) ( not ( = ?auto_1433345 ?auto_1433350 ) ) ( not ( = ?auto_1433346 ?auto_1433343 ) ) ( not ( = ?auto_1433346 ?auto_1433347 ) ) ( not ( = ?auto_1433346 ?auto_1433349 ) ) ( not ( = ?auto_1433346 ?auto_1433348 ) ) ( not ( = ?auto_1433346 ?auto_1433350 ) ) ( not ( = ?auto_1433343 ?auto_1433347 ) ) ( not ( = ?auto_1433343 ?auto_1433349 ) ) ( not ( = ?auto_1433343 ?auto_1433348 ) ) ( not ( = ?auto_1433343 ?auto_1433350 ) ) ( not ( = ?auto_1433347 ?auto_1433349 ) ) ( not ( = ?auto_1433347 ?auto_1433348 ) ) ( not ( = ?auto_1433347 ?auto_1433350 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1433349 ?auto_1433348 ?auto_1433350 )
      ( MAKE-7CRATE-VERIFY ?auto_1433344 ?auto_1433345 ?auto_1433346 ?auto_1433343 ?auto_1433347 ?auto_1433349 ?auto_1433348 ?auto_1433350 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1433414 - SURFACE
      ?auto_1433415 - SURFACE
      ?auto_1433416 - SURFACE
      ?auto_1433413 - SURFACE
      ?auto_1433417 - SURFACE
      ?auto_1433419 - SURFACE
      ?auto_1433418 - SURFACE
      ?auto_1433420 - SURFACE
    )
    :vars
    (
      ?auto_1433422 - HOIST
      ?auto_1433423 - PLACE
      ?auto_1433425 - TRUCK
      ?auto_1433421 - PLACE
      ?auto_1433424 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1433422 ?auto_1433423 ) ( SURFACE-AT ?auto_1433418 ?auto_1433423 ) ( CLEAR ?auto_1433418 ) ( IS-CRATE ?auto_1433420 ) ( not ( = ?auto_1433418 ?auto_1433420 ) ) ( AVAILABLE ?auto_1433422 ) ( ON ?auto_1433418 ?auto_1433419 ) ( not ( = ?auto_1433419 ?auto_1433418 ) ) ( not ( = ?auto_1433419 ?auto_1433420 ) ) ( TRUCK-AT ?auto_1433425 ?auto_1433421 ) ( not ( = ?auto_1433421 ?auto_1433423 ) ) ( HOIST-AT ?auto_1433424 ?auto_1433421 ) ( LIFTING ?auto_1433424 ?auto_1433420 ) ( not ( = ?auto_1433422 ?auto_1433424 ) ) ( ON ?auto_1433415 ?auto_1433414 ) ( ON ?auto_1433416 ?auto_1433415 ) ( ON ?auto_1433413 ?auto_1433416 ) ( ON ?auto_1433417 ?auto_1433413 ) ( ON ?auto_1433419 ?auto_1433417 ) ( not ( = ?auto_1433414 ?auto_1433415 ) ) ( not ( = ?auto_1433414 ?auto_1433416 ) ) ( not ( = ?auto_1433414 ?auto_1433413 ) ) ( not ( = ?auto_1433414 ?auto_1433417 ) ) ( not ( = ?auto_1433414 ?auto_1433419 ) ) ( not ( = ?auto_1433414 ?auto_1433418 ) ) ( not ( = ?auto_1433414 ?auto_1433420 ) ) ( not ( = ?auto_1433415 ?auto_1433416 ) ) ( not ( = ?auto_1433415 ?auto_1433413 ) ) ( not ( = ?auto_1433415 ?auto_1433417 ) ) ( not ( = ?auto_1433415 ?auto_1433419 ) ) ( not ( = ?auto_1433415 ?auto_1433418 ) ) ( not ( = ?auto_1433415 ?auto_1433420 ) ) ( not ( = ?auto_1433416 ?auto_1433413 ) ) ( not ( = ?auto_1433416 ?auto_1433417 ) ) ( not ( = ?auto_1433416 ?auto_1433419 ) ) ( not ( = ?auto_1433416 ?auto_1433418 ) ) ( not ( = ?auto_1433416 ?auto_1433420 ) ) ( not ( = ?auto_1433413 ?auto_1433417 ) ) ( not ( = ?auto_1433413 ?auto_1433419 ) ) ( not ( = ?auto_1433413 ?auto_1433418 ) ) ( not ( = ?auto_1433413 ?auto_1433420 ) ) ( not ( = ?auto_1433417 ?auto_1433419 ) ) ( not ( = ?auto_1433417 ?auto_1433418 ) ) ( not ( = ?auto_1433417 ?auto_1433420 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1433419 ?auto_1433418 ?auto_1433420 )
      ( MAKE-7CRATE-VERIFY ?auto_1433414 ?auto_1433415 ?auto_1433416 ?auto_1433413 ?auto_1433417 ?auto_1433419 ?auto_1433418 ?auto_1433420 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1433491 - SURFACE
      ?auto_1433492 - SURFACE
      ?auto_1433493 - SURFACE
      ?auto_1433490 - SURFACE
      ?auto_1433494 - SURFACE
      ?auto_1433496 - SURFACE
      ?auto_1433495 - SURFACE
      ?auto_1433497 - SURFACE
    )
    :vars
    (
      ?auto_1433501 - HOIST
      ?auto_1433499 - PLACE
      ?auto_1433503 - TRUCK
      ?auto_1433500 - PLACE
      ?auto_1433502 - HOIST
      ?auto_1433498 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1433501 ?auto_1433499 ) ( SURFACE-AT ?auto_1433495 ?auto_1433499 ) ( CLEAR ?auto_1433495 ) ( IS-CRATE ?auto_1433497 ) ( not ( = ?auto_1433495 ?auto_1433497 ) ) ( AVAILABLE ?auto_1433501 ) ( ON ?auto_1433495 ?auto_1433496 ) ( not ( = ?auto_1433496 ?auto_1433495 ) ) ( not ( = ?auto_1433496 ?auto_1433497 ) ) ( TRUCK-AT ?auto_1433503 ?auto_1433500 ) ( not ( = ?auto_1433500 ?auto_1433499 ) ) ( HOIST-AT ?auto_1433502 ?auto_1433500 ) ( not ( = ?auto_1433501 ?auto_1433502 ) ) ( AVAILABLE ?auto_1433502 ) ( SURFACE-AT ?auto_1433497 ?auto_1433500 ) ( ON ?auto_1433497 ?auto_1433498 ) ( CLEAR ?auto_1433497 ) ( not ( = ?auto_1433495 ?auto_1433498 ) ) ( not ( = ?auto_1433497 ?auto_1433498 ) ) ( not ( = ?auto_1433496 ?auto_1433498 ) ) ( ON ?auto_1433492 ?auto_1433491 ) ( ON ?auto_1433493 ?auto_1433492 ) ( ON ?auto_1433490 ?auto_1433493 ) ( ON ?auto_1433494 ?auto_1433490 ) ( ON ?auto_1433496 ?auto_1433494 ) ( not ( = ?auto_1433491 ?auto_1433492 ) ) ( not ( = ?auto_1433491 ?auto_1433493 ) ) ( not ( = ?auto_1433491 ?auto_1433490 ) ) ( not ( = ?auto_1433491 ?auto_1433494 ) ) ( not ( = ?auto_1433491 ?auto_1433496 ) ) ( not ( = ?auto_1433491 ?auto_1433495 ) ) ( not ( = ?auto_1433491 ?auto_1433497 ) ) ( not ( = ?auto_1433491 ?auto_1433498 ) ) ( not ( = ?auto_1433492 ?auto_1433493 ) ) ( not ( = ?auto_1433492 ?auto_1433490 ) ) ( not ( = ?auto_1433492 ?auto_1433494 ) ) ( not ( = ?auto_1433492 ?auto_1433496 ) ) ( not ( = ?auto_1433492 ?auto_1433495 ) ) ( not ( = ?auto_1433492 ?auto_1433497 ) ) ( not ( = ?auto_1433492 ?auto_1433498 ) ) ( not ( = ?auto_1433493 ?auto_1433490 ) ) ( not ( = ?auto_1433493 ?auto_1433494 ) ) ( not ( = ?auto_1433493 ?auto_1433496 ) ) ( not ( = ?auto_1433493 ?auto_1433495 ) ) ( not ( = ?auto_1433493 ?auto_1433497 ) ) ( not ( = ?auto_1433493 ?auto_1433498 ) ) ( not ( = ?auto_1433490 ?auto_1433494 ) ) ( not ( = ?auto_1433490 ?auto_1433496 ) ) ( not ( = ?auto_1433490 ?auto_1433495 ) ) ( not ( = ?auto_1433490 ?auto_1433497 ) ) ( not ( = ?auto_1433490 ?auto_1433498 ) ) ( not ( = ?auto_1433494 ?auto_1433496 ) ) ( not ( = ?auto_1433494 ?auto_1433495 ) ) ( not ( = ?auto_1433494 ?auto_1433497 ) ) ( not ( = ?auto_1433494 ?auto_1433498 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1433496 ?auto_1433495 ?auto_1433497 )
      ( MAKE-7CRATE-VERIFY ?auto_1433491 ?auto_1433492 ?auto_1433493 ?auto_1433490 ?auto_1433494 ?auto_1433496 ?auto_1433495 ?auto_1433497 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1433569 - SURFACE
      ?auto_1433570 - SURFACE
      ?auto_1433571 - SURFACE
      ?auto_1433568 - SURFACE
      ?auto_1433572 - SURFACE
      ?auto_1433574 - SURFACE
      ?auto_1433573 - SURFACE
      ?auto_1433575 - SURFACE
    )
    :vars
    (
      ?auto_1433576 - HOIST
      ?auto_1433579 - PLACE
      ?auto_1433577 - PLACE
      ?auto_1433581 - HOIST
      ?auto_1433578 - SURFACE
      ?auto_1433580 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1433576 ?auto_1433579 ) ( SURFACE-AT ?auto_1433573 ?auto_1433579 ) ( CLEAR ?auto_1433573 ) ( IS-CRATE ?auto_1433575 ) ( not ( = ?auto_1433573 ?auto_1433575 ) ) ( AVAILABLE ?auto_1433576 ) ( ON ?auto_1433573 ?auto_1433574 ) ( not ( = ?auto_1433574 ?auto_1433573 ) ) ( not ( = ?auto_1433574 ?auto_1433575 ) ) ( not ( = ?auto_1433577 ?auto_1433579 ) ) ( HOIST-AT ?auto_1433581 ?auto_1433577 ) ( not ( = ?auto_1433576 ?auto_1433581 ) ) ( AVAILABLE ?auto_1433581 ) ( SURFACE-AT ?auto_1433575 ?auto_1433577 ) ( ON ?auto_1433575 ?auto_1433578 ) ( CLEAR ?auto_1433575 ) ( not ( = ?auto_1433573 ?auto_1433578 ) ) ( not ( = ?auto_1433575 ?auto_1433578 ) ) ( not ( = ?auto_1433574 ?auto_1433578 ) ) ( TRUCK-AT ?auto_1433580 ?auto_1433579 ) ( ON ?auto_1433570 ?auto_1433569 ) ( ON ?auto_1433571 ?auto_1433570 ) ( ON ?auto_1433568 ?auto_1433571 ) ( ON ?auto_1433572 ?auto_1433568 ) ( ON ?auto_1433574 ?auto_1433572 ) ( not ( = ?auto_1433569 ?auto_1433570 ) ) ( not ( = ?auto_1433569 ?auto_1433571 ) ) ( not ( = ?auto_1433569 ?auto_1433568 ) ) ( not ( = ?auto_1433569 ?auto_1433572 ) ) ( not ( = ?auto_1433569 ?auto_1433574 ) ) ( not ( = ?auto_1433569 ?auto_1433573 ) ) ( not ( = ?auto_1433569 ?auto_1433575 ) ) ( not ( = ?auto_1433569 ?auto_1433578 ) ) ( not ( = ?auto_1433570 ?auto_1433571 ) ) ( not ( = ?auto_1433570 ?auto_1433568 ) ) ( not ( = ?auto_1433570 ?auto_1433572 ) ) ( not ( = ?auto_1433570 ?auto_1433574 ) ) ( not ( = ?auto_1433570 ?auto_1433573 ) ) ( not ( = ?auto_1433570 ?auto_1433575 ) ) ( not ( = ?auto_1433570 ?auto_1433578 ) ) ( not ( = ?auto_1433571 ?auto_1433568 ) ) ( not ( = ?auto_1433571 ?auto_1433572 ) ) ( not ( = ?auto_1433571 ?auto_1433574 ) ) ( not ( = ?auto_1433571 ?auto_1433573 ) ) ( not ( = ?auto_1433571 ?auto_1433575 ) ) ( not ( = ?auto_1433571 ?auto_1433578 ) ) ( not ( = ?auto_1433568 ?auto_1433572 ) ) ( not ( = ?auto_1433568 ?auto_1433574 ) ) ( not ( = ?auto_1433568 ?auto_1433573 ) ) ( not ( = ?auto_1433568 ?auto_1433575 ) ) ( not ( = ?auto_1433568 ?auto_1433578 ) ) ( not ( = ?auto_1433572 ?auto_1433574 ) ) ( not ( = ?auto_1433572 ?auto_1433573 ) ) ( not ( = ?auto_1433572 ?auto_1433575 ) ) ( not ( = ?auto_1433572 ?auto_1433578 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1433574 ?auto_1433573 ?auto_1433575 )
      ( MAKE-7CRATE-VERIFY ?auto_1433569 ?auto_1433570 ?auto_1433571 ?auto_1433568 ?auto_1433572 ?auto_1433574 ?auto_1433573 ?auto_1433575 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1433647 - SURFACE
      ?auto_1433648 - SURFACE
      ?auto_1433649 - SURFACE
      ?auto_1433646 - SURFACE
      ?auto_1433650 - SURFACE
      ?auto_1433652 - SURFACE
      ?auto_1433651 - SURFACE
      ?auto_1433653 - SURFACE
    )
    :vars
    (
      ?auto_1433655 - HOIST
      ?auto_1433654 - PLACE
      ?auto_1433657 - PLACE
      ?auto_1433659 - HOIST
      ?auto_1433658 - SURFACE
      ?auto_1433656 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1433655 ?auto_1433654 ) ( IS-CRATE ?auto_1433653 ) ( not ( = ?auto_1433651 ?auto_1433653 ) ) ( not ( = ?auto_1433652 ?auto_1433651 ) ) ( not ( = ?auto_1433652 ?auto_1433653 ) ) ( not ( = ?auto_1433657 ?auto_1433654 ) ) ( HOIST-AT ?auto_1433659 ?auto_1433657 ) ( not ( = ?auto_1433655 ?auto_1433659 ) ) ( AVAILABLE ?auto_1433659 ) ( SURFACE-AT ?auto_1433653 ?auto_1433657 ) ( ON ?auto_1433653 ?auto_1433658 ) ( CLEAR ?auto_1433653 ) ( not ( = ?auto_1433651 ?auto_1433658 ) ) ( not ( = ?auto_1433653 ?auto_1433658 ) ) ( not ( = ?auto_1433652 ?auto_1433658 ) ) ( TRUCK-AT ?auto_1433656 ?auto_1433654 ) ( SURFACE-AT ?auto_1433652 ?auto_1433654 ) ( CLEAR ?auto_1433652 ) ( LIFTING ?auto_1433655 ?auto_1433651 ) ( IS-CRATE ?auto_1433651 ) ( ON ?auto_1433648 ?auto_1433647 ) ( ON ?auto_1433649 ?auto_1433648 ) ( ON ?auto_1433646 ?auto_1433649 ) ( ON ?auto_1433650 ?auto_1433646 ) ( ON ?auto_1433652 ?auto_1433650 ) ( not ( = ?auto_1433647 ?auto_1433648 ) ) ( not ( = ?auto_1433647 ?auto_1433649 ) ) ( not ( = ?auto_1433647 ?auto_1433646 ) ) ( not ( = ?auto_1433647 ?auto_1433650 ) ) ( not ( = ?auto_1433647 ?auto_1433652 ) ) ( not ( = ?auto_1433647 ?auto_1433651 ) ) ( not ( = ?auto_1433647 ?auto_1433653 ) ) ( not ( = ?auto_1433647 ?auto_1433658 ) ) ( not ( = ?auto_1433648 ?auto_1433649 ) ) ( not ( = ?auto_1433648 ?auto_1433646 ) ) ( not ( = ?auto_1433648 ?auto_1433650 ) ) ( not ( = ?auto_1433648 ?auto_1433652 ) ) ( not ( = ?auto_1433648 ?auto_1433651 ) ) ( not ( = ?auto_1433648 ?auto_1433653 ) ) ( not ( = ?auto_1433648 ?auto_1433658 ) ) ( not ( = ?auto_1433649 ?auto_1433646 ) ) ( not ( = ?auto_1433649 ?auto_1433650 ) ) ( not ( = ?auto_1433649 ?auto_1433652 ) ) ( not ( = ?auto_1433649 ?auto_1433651 ) ) ( not ( = ?auto_1433649 ?auto_1433653 ) ) ( not ( = ?auto_1433649 ?auto_1433658 ) ) ( not ( = ?auto_1433646 ?auto_1433650 ) ) ( not ( = ?auto_1433646 ?auto_1433652 ) ) ( not ( = ?auto_1433646 ?auto_1433651 ) ) ( not ( = ?auto_1433646 ?auto_1433653 ) ) ( not ( = ?auto_1433646 ?auto_1433658 ) ) ( not ( = ?auto_1433650 ?auto_1433652 ) ) ( not ( = ?auto_1433650 ?auto_1433651 ) ) ( not ( = ?auto_1433650 ?auto_1433653 ) ) ( not ( = ?auto_1433650 ?auto_1433658 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1433652 ?auto_1433651 ?auto_1433653 )
      ( MAKE-7CRATE-VERIFY ?auto_1433647 ?auto_1433648 ?auto_1433649 ?auto_1433646 ?auto_1433650 ?auto_1433652 ?auto_1433651 ?auto_1433653 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1433725 - SURFACE
      ?auto_1433726 - SURFACE
      ?auto_1433727 - SURFACE
      ?auto_1433724 - SURFACE
      ?auto_1433728 - SURFACE
      ?auto_1433730 - SURFACE
      ?auto_1433729 - SURFACE
      ?auto_1433731 - SURFACE
    )
    :vars
    (
      ?auto_1433732 - HOIST
      ?auto_1433737 - PLACE
      ?auto_1433733 - PLACE
      ?auto_1433734 - HOIST
      ?auto_1433736 - SURFACE
      ?auto_1433735 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1433732 ?auto_1433737 ) ( IS-CRATE ?auto_1433731 ) ( not ( = ?auto_1433729 ?auto_1433731 ) ) ( not ( = ?auto_1433730 ?auto_1433729 ) ) ( not ( = ?auto_1433730 ?auto_1433731 ) ) ( not ( = ?auto_1433733 ?auto_1433737 ) ) ( HOIST-AT ?auto_1433734 ?auto_1433733 ) ( not ( = ?auto_1433732 ?auto_1433734 ) ) ( AVAILABLE ?auto_1433734 ) ( SURFACE-AT ?auto_1433731 ?auto_1433733 ) ( ON ?auto_1433731 ?auto_1433736 ) ( CLEAR ?auto_1433731 ) ( not ( = ?auto_1433729 ?auto_1433736 ) ) ( not ( = ?auto_1433731 ?auto_1433736 ) ) ( not ( = ?auto_1433730 ?auto_1433736 ) ) ( TRUCK-AT ?auto_1433735 ?auto_1433737 ) ( SURFACE-AT ?auto_1433730 ?auto_1433737 ) ( CLEAR ?auto_1433730 ) ( IS-CRATE ?auto_1433729 ) ( AVAILABLE ?auto_1433732 ) ( IN ?auto_1433729 ?auto_1433735 ) ( ON ?auto_1433726 ?auto_1433725 ) ( ON ?auto_1433727 ?auto_1433726 ) ( ON ?auto_1433724 ?auto_1433727 ) ( ON ?auto_1433728 ?auto_1433724 ) ( ON ?auto_1433730 ?auto_1433728 ) ( not ( = ?auto_1433725 ?auto_1433726 ) ) ( not ( = ?auto_1433725 ?auto_1433727 ) ) ( not ( = ?auto_1433725 ?auto_1433724 ) ) ( not ( = ?auto_1433725 ?auto_1433728 ) ) ( not ( = ?auto_1433725 ?auto_1433730 ) ) ( not ( = ?auto_1433725 ?auto_1433729 ) ) ( not ( = ?auto_1433725 ?auto_1433731 ) ) ( not ( = ?auto_1433725 ?auto_1433736 ) ) ( not ( = ?auto_1433726 ?auto_1433727 ) ) ( not ( = ?auto_1433726 ?auto_1433724 ) ) ( not ( = ?auto_1433726 ?auto_1433728 ) ) ( not ( = ?auto_1433726 ?auto_1433730 ) ) ( not ( = ?auto_1433726 ?auto_1433729 ) ) ( not ( = ?auto_1433726 ?auto_1433731 ) ) ( not ( = ?auto_1433726 ?auto_1433736 ) ) ( not ( = ?auto_1433727 ?auto_1433724 ) ) ( not ( = ?auto_1433727 ?auto_1433728 ) ) ( not ( = ?auto_1433727 ?auto_1433730 ) ) ( not ( = ?auto_1433727 ?auto_1433729 ) ) ( not ( = ?auto_1433727 ?auto_1433731 ) ) ( not ( = ?auto_1433727 ?auto_1433736 ) ) ( not ( = ?auto_1433724 ?auto_1433728 ) ) ( not ( = ?auto_1433724 ?auto_1433730 ) ) ( not ( = ?auto_1433724 ?auto_1433729 ) ) ( not ( = ?auto_1433724 ?auto_1433731 ) ) ( not ( = ?auto_1433724 ?auto_1433736 ) ) ( not ( = ?auto_1433728 ?auto_1433730 ) ) ( not ( = ?auto_1433728 ?auto_1433729 ) ) ( not ( = ?auto_1433728 ?auto_1433731 ) ) ( not ( = ?auto_1433728 ?auto_1433736 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1433730 ?auto_1433729 ?auto_1433731 )
      ( MAKE-7CRATE-VERIFY ?auto_1433725 ?auto_1433726 ?auto_1433727 ?auto_1433724 ?auto_1433728 ?auto_1433730 ?auto_1433729 ?auto_1433731 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1436630 - SURFACE
      ?auto_1436631 - SURFACE
      ?auto_1436632 - SURFACE
      ?auto_1436629 - SURFACE
      ?auto_1436633 - SURFACE
      ?auto_1436635 - SURFACE
      ?auto_1436634 - SURFACE
      ?auto_1436636 - SURFACE
      ?auto_1436637 - SURFACE
    )
    :vars
    (
      ?auto_1436639 - HOIST
      ?auto_1436638 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1436639 ?auto_1436638 ) ( SURFACE-AT ?auto_1436636 ?auto_1436638 ) ( CLEAR ?auto_1436636 ) ( LIFTING ?auto_1436639 ?auto_1436637 ) ( IS-CRATE ?auto_1436637 ) ( not ( = ?auto_1436636 ?auto_1436637 ) ) ( ON ?auto_1436631 ?auto_1436630 ) ( ON ?auto_1436632 ?auto_1436631 ) ( ON ?auto_1436629 ?auto_1436632 ) ( ON ?auto_1436633 ?auto_1436629 ) ( ON ?auto_1436635 ?auto_1436633 ) ( ON ?auto_1436634 ?auto_1436635 ) ( ON ?auto_1436636 ?auto_1436634 ) ( not ( = ?auto_1436630 ?auto_1436631 ) ) ( not ( = ?auto_1436630 ?auto_1436632 ) ) ( not ( = ?auto_1436630 ?auto_1436629 ) ) ( not ( = ?auto_1436630 ?auto_1436633 ) ) ( not ( = ?auto_1436630 ?auto_1436635 ) ) ( not ( = ?auto_1436630 ?auto_1436634 ) ) ( not ( = ?auto_1436630 ?auto_1436636 ) ) ( not ( = ?auto_1436630 ?auto_1436637 ) ) ( not ( = ?auto_1436631 ?auto_1436632 ) ) ( not ( = ?auto_1436631 ?auto_1436629 ) ) ( not ( = ?auto_1436631 ?auto_1436633 ) ) ( not ( = ?auto_1436631 ?auto_1436635 ) ) ( not ( = ?auto_1436631 ?auto_1436634 ) ) ( not ( = ?auto_1436631 ?auto_1436636 ) ) ( not ( = ?auto_1436631 ?auto_1436637 ) ) ( not ( = ?auto_1436632 ?auto_1436629 ) ) ( not ( = ?auto_1436632 ?auto_1436633 ) ) ( not ( = ?auto_1436632 ?auto_1436635 ) ) ( not ( = ?auto_1436632 ?auto_1436634 ) ) ( not ( = ?auto_1436632 ?auto_1436636 ) ) ( not ( = ?auto_1436632 ?auto_1436637 ) ) ( not ( = ?auto_1436629 ?auto_1436633 ) ) ( not ( = ?auto_1436629 ?auto_1436635 ) ) ( not ( = ?auto_1436629 ?auto_1436634 ) ) ( not ( = ?auto_1436629 ?auto_1436636 ) ) ( not ( = ?auto_1436629 ?auto_1436637 ) ) ( not ( = ?auto_1436633 ?auto_1436635 ) ) ( not ( = ?auto_1436633 ?auto_1436634 ) ) ( not ( = ?auto_1436633 ?auto_1436636 ) ) ( not ( = ?auto_1436633 ?auto_1436637 ) ) ( not ( = ?auto_1436635 ?auto_1436634 ) ) ( not ( = ?auto_1436635 ?auto_1436636 ) ) ( not ( = ?auto_1436635 ?auto_1436637 ) ) ( not ( = ?auto_1436634 ?auto_1436636 ) ) ( not ( = ?auto_1436634 ?auto_1436637 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1436636 ?auto_1436637 )
      ( MAKE-8CRATE-VERIFY ?auto_1436630 ?auto_1436631 ?auto_1436632 ?auto_1436629 ?auto_1436633 ?auto_1436635 ?auto_1436634 ?auto_1436636 ?auto_1436637 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1436697 - SURFACE
      ?auto_1436698 - SURFACE
      ?auto_1436699 - SURFACE
      ?auto_1436696 - SURFACE
      ?auto_1436700 - SURFACE
      ?auto_1436702 - SURFACE
      ?auto_1436701 - SURFACE
      ?auto_1436703 - SURFACE
      ?auto_1436704 - SURFACE
    )
    :vars
    (
      ?auto_1436707 - HOIST
      ?auto_1436705 - PLACE
      ?auto_1436706 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1436707 ?auto_1436705 ) ( SURFACE-AT ?auto_1436703 ?auto_1436705 ) ( CLEAR ?auto_1436703 ) ( IS-CRATE ?auto_1436704 ) ( not ( = ?auto_1436703 ?auto_1436704 ) ) ( TRUCK-AT ?auto_1436706 ?auto_1436705 ) ( AVAILABLE ?auto_1436707 ) ( IN ?auto_1436704 ?auto_1436706 ) ( ON ?auto_1436703 ?auto_1436701 ) ( not ( = ?auto_1436701 ?auto_1436703 ) ) ( not ( = ?auto_1436701 ?auto_1436704 ) ) ( ON ?auto_1436698 ?auto_1436697 ) ( ON ?auto_1436699 ?auto_1436698 ) ( ON ?auto_1436696 ?auto_1436699 ) ( ON ?auto_1436700 ?auto_1436696 ) ( ON ?auto_1436702 ?auto_1436700 ) ( ON ?auto_1436701 ?auto_1436702 ) ( not ( = ?auto_1436697 ?auto_1436698 ) ) ( not ( = ?auto_1436697 ?auto_1436699 ) ) ( not ( = ?auto_1436697 ?auto_1436696 ) ) ( not ( = ?auto_1436697 ?auto_1436700 ) ) ( not ( = ?auto_1436697 ?auto_1436702 ) ) ( not ( = ?auto_1436697 ?auto_1436701 ) ) ( not ( = ?auto_1436697 ?auto_1436703 ) ) ( not ( = ?auto_1436697 ?auto_1436704 ) ) ( not ( = ?auto_1436698 ?auto_1436699 ) ) ( not ( = ?auto_1436698 ?auto_1436696 ) ) ( not ( = ?auto_1436698 ?auto_1436700 ) ) ( not ( = ?auto_1436698 ?auto_1436702 ) ) ( not ( = ?auto_1436698 ?auto_1436701 ) ) ( not ( = ?auto_1436698 ?auto_1436703 ) ) ( not ( = ?auto_1436698 ?auto_1436704 ) ) ( not ( = ?auto_1436699 ?auto_1436696 ) ) ( not ( = ?auto_1436699 ?auto_1436700 ) ) ( not ( = ?auto_1436699 ?auto_1436702 ) ) ( not ( = ?auto_1436699 ?auto_1436701 ) ) ( not ( = ?auto_1436699 ?auto_1436703 ) ) ( not ( = ?auto_1436699 ?auto_1436704 ) ) ( not ( = ?auto_1436696 ?auto_1436700 ) ) ( not ( = ?auto_1436696 ?auto_1436702 ) ) ( not ( = ?auto_1436696 ?auto_1436701 ) ) ( not ( = ?auto_1436696 ?auto_1436703 ) ) ( not ( = ?auto_1436696 ?auto_1436704 ) ) ( not ( = ?auto_1436700 ?auto_1436702 ) ) ( not ( = ?auto_1436700 ?auto_1436701 ) ) ( not ( = ?auto_1436700 ?auto_1436703 ) ) ( not ( = ?auto_1436700 ?auto_1436704 ) ) ( not ( = ?auto_1436702 ?auto_1436701 ) ) ( not ( = ?auto_1436702 ?auto_1436703 ) ) ( not ( = ?auto_1436702 ?auto_1436704 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1436701 ?auto_1436703 ?auto_1436704 )
      ( MAKE-8CRATE-VERIFY ?auto_1436697 ?auto_1436698 ?auto_1436699 ?auto_1436696 ?auto_1436700 ?auto_1436702 ?auto_1436701 ?auto_1436703 ?auto_1436704 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1436773 - SURFACE
      ?auto_1436774 - SURFACE
      ?auto_1436775 - SURFACE
      ?auto_1436772 - SURFACE
      ?auto_1436776 - SURFACE
      ?auto_1436778 - SURFACE
      ?auto_1436777 - SURFACE
      ?auto_1436779 - SURFACE
      ?auto_1436780 - SURFACE
    )
    :vars
    (
      ?auto_1436782 - HOIST
      ?auto_1436783 - PLACE
      ?auto_1436781 - TRUCK
      ?auto_1436784 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1436782 ?auto_1436783 ) ( SURFACE-AT ?auto_1436779 ?auto_1436783 ) ( CLEAR ?auto_1436779 ) ( IS-CRATE ?auto_1436780 ) ( not ( = ?auto_1436779 ?auto_1436780 ) ) ( AVAILABLE ?auto_1436782 ) ( IN ?auto_1436780 ?auto_1436781 ) ( ON ?auto_1436779 ?auto_1436777 ) ( not ( = ?auto_1436777 ?auto_1436779 ) ) ( not ( = ?auto_1436777 ?auto_1436780 ) ) ( TRUCK-AT ?auto_1436781 ?auto_1436784 ) ( not ( = ?auto_1436784 ?auto_1436783 ) ) ( ON ?auto_1436774 ?auto_1436773 ) ( ON ?auto_1436775 ?auto_1436774 ) ( ON ?auto_1436772 ?auto_1436775 ) ( ON ?auto_1436776 ?auto_1436772 ) ( ON ?auto_1436778 ?auto_1436776 ) ( ON ?auto_1436777 ?auto_1436778 ) ( not ( = ?auto_1436773 ?auto_1436774 ) ) ( not ( = ?auto_1436773 ?auto_1436775 ) ) ( not ( = ?auto_1436773 ?auto_1436772 ) ) ( not ( = ?auto_1436773 ?auto_1436776 ) ) ( not ( = ?auto_1436773 ?auto_1436778 ) ) ( not ( = ?auto_1436773 ?auto_1436777 ) ) ( not ( = ?auto_1436773 ?auto_1436779 ) ) ( not ( = ?auto_1436773 ?auto_1436780 ) ) ( not ( = ?auto_1436774 ?auto_1436775 ) ) ( not ( = ?auto_1436774 ?auto_1436772 ) ) ( not ( = ?auto_1436774 ?auto_1436776 ) ) ( not ( = ?auto_1436774 ?auto_1436778 ) ) ( not ( = ?auto_1436774 ?auto_1436777 ) ) ( not ( = ?auto_1436774 ?auto_1436779 ) ) ( not ( = ?auto_1436774 ?auto_1436780 ) ) ( not ( = ?auto_1436775 ?auto_1436772 ) ) ( not ( = ?auto_1436775 ?auto_1436776 ) ) ( not ( = ?auto_1436775 ?auto_1436778 ) ) ( not ( = ?auto_1436775 ?auto_1436777 ) ) ( not ( = ?auto_1436775 ?auto_1436779 ) ) ( not ( = ?auto_1436775 ?auto_1436780 ) ) ( not ( = ?auto_1436772 ?auto_1436776 ) ) ( not ( = ?auto_1436772 ?auto_1436778 ) ) ( not ( = ?auto_1436772 ?auto_1436777 ) ) ( not ( = ?auto_1436772 ?auto_1436779 ) ) ( not ( = ?auto_1436772 ?auto_1436780 ) ) ( not ( = ?auto_1436776 ?auto_1436778 ) ) ( not ( = ?auto_1436776 ?auto_1436777 ) ) ( not ( = ?auto_1436776 ?auto_1436779 ) ) ( not ( = ?auto_1436776 ?auto_1436780 ) ) ( not ( = ?auto_1436778 ?auto_1436777 ) ) ( not ( = ?auto_1436778 ?auto_1436779 ) ) ( not ( = ?auto_1436778 ?auto_1436780 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1436777 ?auto_1436779 ?auto_1436780 )
      ( MAKE-8CRATE-VERIFY ?auto_1436773 ?auto_1436774 ?auto_1436775 ?auto_1436772 ?auto_1436776 ?auto_1436778 ?auto_1436777 ?auto_1436779 ?auto_1436780 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1436857 - SURFACE
      ?auto_1436858 - SURFACE
      ?auto_1436859 - SURFACE
      ?auto_1436856 - SURFACE
      ?auto_1436860 - SURFACE
      ?auto_1436862 - SURFACE
      ?auto_1436861 - SURFACE
      ?auto_1436863 - SURFACE
      ?auto_1436864 - SURFACE
    )
    :vars
    (
      ?auto_1436869 - HOIST
      ?auto_1436868 - PLACE
      ?auto_1436865 - TRUCK
      ?auto_1436866 - PLACE
      ?auto_1436867 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1436869 ?auto_1436868 ) ( SURFACE-AT ?auto_1436863 ?auto_1436868 ) ( CLEAR ?auto_1436863 ) ( IS-CRATE ?auto_1436864 ) ( not ( = ?auto_1436863 ?auto_1436864 ) ) ( AVAILABLE ?auto_1436869 ) ( ON ?auto_1436863 ?auto_1436861 ) ( not ( = ?auto_1436861 ?auto_1436863 ) ) ( not ( = ?auto_1436861 ?auto_1436864 ) ) ( TRUCK-AT ?auto_1436865 ?auto_1436866 ) ( not ( = ?auto_1436866 ?auto_1436868 ) ) ( HOIST-AT ?auto_1436867 ?auto_1436866 ) ( LIFTING ?auto_1436867 ?auto_1436864 ) ( not ( = ?auto_1436869 ?auto_1436867 ) ) ( ON ?auto_1436858 ?auto_1436857 ) ( ON ?auto_1436859 ?auto_1436858 ) ( ON ?auto_1436856 ?auto_1436859 ) ( ON ?auto_1436860 ?auto_1436856 ) ( ON ?auto_1436862 ?auto_1436860 ) ( ON ?auto_1436861 ?auto_1436862 ) ( not ( = ?auto_1436857 ?auto_1436858 ) ) ( not ( = ?auto_1436857 ?auto_1436859 ) ) ( not ( = ?auto_1436857 ?auto_1436856 ) ) ( not ( = ?auto_1436857 ?auto_1436860 ) ) ( not ( = ?auto_1436857 ?auto_1436862 ) ) ( not ( = ?auto_1436857 ?auto_1436861 ) ) ( not ( = ?auto_1436857 ?auto_1436863 ) ) ( not ( = ?auto_1436857 ?auto_1436864 ) ) ( not ( = ?auto_1436858 ?auto_1436859 ) ) ( not ( = ?auto_1436858 ?auto_1436856 ) ) ( not ( = ?auto_1436858 ?auto_1436860 ) ) ( not ( = ?auto_1436858 ?auto_1436862 ) ) ( not ( = ?auto_1436858 ?auto_1436861 ) ) ( not ( = ?auto_1436858 ?auto_1436863 ) ) ( not ( = ?auto_1436858 ?auto_1436864 ) ) ( not ( = ?auto_1436859 ?auto_1436856 ) ) ( not ( = ?auto_1436859 ?auto_1436860 ) ) ( not ( = ?auto_1436859 ?auto_1436862 ) ) ( not ( = ?auto_1436859 ?auto_1436861 ) ) ( not ( = ?auto_1436859 ?auto_1436863 ) ) ( not ( = ?auto_1436859 ?auto_1436864 ) ) ( not ( = ?auto_1436856 ?auto_1436860 ) ) ( not ( = ?auto_1436856 ?auto_1436862 ) ) ( not ( = ?auto_1436856 ?auto_1436861 ) ) ( not ( = ?auto_1436856 ?auto_1436863 ) ) ( not ( = ?auto_1436856 ?auto_1436864 ) ) ( not ( = ?auto_1436860 ?auto_1436862 ) ) ( not ( = ?auto_1436860 ?auto_1436861 ) ) ( not ( = ?auto_1436860 ?auto_1436863 ) ) ( not ( = ?auto_1436860 ?auto_1436864 ) ) ( not ( = ?auto_1436862 ?auto_1436861 ) ) ( not ( = ?auto_1436862 ?auto_1436863 ) ) ( not ( = ?auto_1436862 ?auto_1436864 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1436861 ?auto_1436863 ?auto_1436864 )
      ( MAKE-8CRATE-VERIFY ?auto_1436857 ?auto_1436858 ?auto_1436859 ?auto_1436856 ?auto_1436860 ?auto_1436862 ?auto_1436861 ?auto_1436863 ?auto_1436864 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1436949 - SURFACE
      ?auto_1436950 - SURFACE
      ?auto_1436951 - SURFACE
      ?auto_1436948 - SURFACE
      ?auto_1436952 - SURFACE
      ?auto_1436954 - SURFACE
      ?auto_1436953 - SURFACE
      ?auto_1436955 - SURFACE
      ?auto_1436956 - SURFACE
    )
    :vars
    (
      ?auto_1436959 - HOIST
      ?auto_1436957 - PLACE
      ?auto_1436960 - TRUCK
      ?auto_1436958 - PLACE
      ?auto_1436962 - HOIST
      ?auto_1436961 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1436959 ?auto_1436957 ) ( SURFACE-AT ?auto_1436955 ?auto_1436957 ) ( CLEAR ?auto_1436955 ) ( IS-CRATE ?auto_1436956 ) ( not ( = ?auto_1436955 ?auto_1436956 ) ) ( AVAILABLE ?auto_1436959 ) ( ON ?auto_1436955 ?auto_1436953 ) ( not ( = ?auto_1436953 ?auto_1436955 ) ) ( not ( = ?auto_1436953 ?auto_1436956 ) ) ( TRUCK-AT ?auto_1436960 ?auto_1436958 ) ( not ( = ?auto_1436958 ?auto_1436957 ) ) ( HOIST-AT ?auto_1436962 ?auto_1436958 ) ( not ( = ?auto_1436959 ?auto_1436962 ) ) ( AVAILABLE ?auto_1436962 ) ( SURFACE-AT ?auto_1436956 ?auto_1436958 ) ( ON ?auto_1436956 ?auto_1436961 ) ( CLEAR ?auto_1436956 ) ( not ( = ?auto_1436955 ?auto_1436961 ) ) ( not ( = ?auto_1436956 ?auto_1436961 ) ) ( not ( = ?auto_1436953 ?auto_1436961 ) ) ( ON ?auto_1436950 ?auto_1436949 ) ( ON ?auto_1436951 ?auto_1436950 ) ( ON ?auto_1436948 ?auto_1436951 ) ( ON ?auto_1436952 ?auto_1436948 ) ( ON ?auto_1436954 ?auto_1436952 ) ( ON ?auto_1436953 ?auto_1436954 ) ( not ( = ?auto_1436949 ?auto_1436950 ) ) ( not ( = ?auto_1436949 ?auto_1436951 ) ) ( not ( = ?auto_1436949 ?auto_1436948 ) ) ( not ( = ?auto_1436949 ?auto_1436952 ) ) ( not ( = ?auto_1436949 ?auto_1436954 ) ) ( not ( = ?auto_1436949 ?auto_1436953 ) ) ( not ( = ?auto_1436949 ?auto_1436955 ) ) ( not ( = ?auto_1436949 ?auto_1436956 ) ) ( not ( = ?auto_1436949 ?auto_1436961 ) ) ( not ( = ?auto_1436950 ?auto_1436951 ) ) ( not ( = ?auto_1436950 ?auto_1436948 ) ) ( not ( = ?auto_1436950 ?auto_1436952 ) ) ( not ( = ?auto_1436950 ?auto_1436954 ) ) ( not ( = ?auto_1436950 ?auto_1436953 ) ) ( not ( = ?auto_1436950 ?auto_1436955 ) ) ( not ( = ?auto_1436950 ?auto_1436956 ) ) ( not ( = ?auto_1436950 ?auto_1436961 ) ) ( not ( = ?auto_1436951 ?auto_1436948 ) ) ( not ( = ?auto_1436951 ?auto_1436952 ) ) ( not ( = ?auto_1436951 ?auto_1436954 ) ) ( not ( = ?auto_1436951 ?auto_1436953 ) ) ( not ( = ?auto_1436951 ?auto_1436955 ) ) ( not ( = ?auto_1436951 ?auto_1436956 ) ) ( not ( = ?auto_1436951 ?auto_1436961 ) ) ( not ( = ?auto_1436948 ?auto_1436952 ) ) ( not ( = ?auto_1436948 ?auto_1436954 ) ) ( not ( = ?auto_1436948 ?auto_1436953 ) ) ( not ( = ?auto_1436948 ?auto_1436955 ) ) ( not ( = ?auto_1436948 ?auto_1436956 ) ) ( not ( = ?auto_1436948 ?auto_1436961 ) ) ( not ( = ?auto_1436952 ?auto_1436954 ) ) ( not ( = ?auto_1436952 ?auto_1436953 ) ) ( not ( = ?auto_1436952 ?auto_1436955 ) ) ( not ( = ?auto_1436952 ?auto_1436956 ) ) ( not ( = ?auto_1436952 ?auto_1436961 ) ) ( not ( = ?auto_1436954 ?auto_1436953 ) ) ( not ( = ?auto_1436954 ?auto_1436955 ) ) ( not ( = ?auto_1436954 ?auto_1436956 ) ) ( not ( = ?auto_1436954 ?auto_1436961 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1436953 ?auto_1436955 ?auto_1436956 )
      ( MAKE-8CRATE-VERIFY ?auto_1436949 ?auto_1436950 ?auto_1436951 ?auto_1436948 ?auto_1436952 ?auto_1436954 ?auto_1436953 ?auto_1436955 ?auto_1436956 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1437042 - SURFACE
      ?auto_1437043 - SURFACE
      ?auto_1437044 - SURFACE
      ?auto_1437041 - SURFACE
      ?auto_1437045 - SURFACE
      ?auto_1437047 - SURFACE
      ?auto_1437046 - SURFACE
      ?auto_1437048 - SURFACE
      ?auto_1437049 - SURFACE
    )
    :vars
    (
      ?auto_1437053 - HOIST
      ?auto_1437050 - PLACE
      ?auto_1437052 - PLACE
      ?auto_1437051 - HOIST
      ?auto_1437054 - SURFACE
      ?auto_1437055 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1437053 ?auto_1437050 ) ( SURFACE-AT ?auto_1437048 ?auto_1437050 ) ( CLEAR ?auto_1437048 ) ( IS-CRATE ?auto_1437049 ) ( not ( = ?auto_1437048 ?auto_1437049 ) ) ( AVAILABLE ?auto_1437053 ) ( ON ?auto_1437048 ?auto_1437046 ) ( not ( = ?auto_1437046 ?auto_1437048 ) ) ( not ( = ?auto_1437046 ?auto_1437049 ) ) ( not ( = ?auto_1437052 ?auto_1437050 ) ) ( HOIST-AT ?auto_1437051 ?auto_1437052 ) ( not ( = ?auto_1437053 ?auto_1437051 ) ) ( AVAILABLE ?auto_1437051 ) ( SURFACE-AT ?auto_1437049 ?auto_1437052 ) ( ON ?auto_1437049 ?auto_1437054 ) ( CLEAR ?auto_1437049 ) ( not ( = ?auto_1437048 ?auto_1437054 ) ) ( not ( = ?auto_1437049 ?auto_1437054 ) ) ( not ( = ?auto_1437046 ?auto_1437054 ) ) ( TRUCK-AT ?auto_1437055 ?auto_1437050 ) ( ON ?auto_1437043 ?auto_1437042 ) ( ON ?auto_1437044 ?auto_1437043 ) ( ON ?auto_1437041 ?auto_1437044 ) ( ON ?auto_1437045 ?auto_1437041 ) ( ON ?auto_1437047 ?auto_1437045 ) ( ON ?auto_1437046 ?auto_1437047 ) ( not ( = ?auto_1437042 ?auto_1437043 ) ) ( not ( = ?auto_1437042 ?auto_1437044 ) ) ( not ( = ?auto_1437042 ?auto_1437041 ) ) ( not ( = ?auto_1437042 ?auto_1437045 ) ) ( not ( = ?auto_1437042 ?auto_1437047 ) ) ( not ( = ?auto_1437042 ?auto_1437046 ) ) ( not ( = ?auto_1437042 ?auto_1437048 ) ) ( not ( = ?auto_1437042 ?auto_1437049 ) ) ( not ( = ?auto_1437042 ?auto_1437054 ) ) ( not ( = ?auto_1437043 ?auto_1437044 ) ) ( not ( = ?auto_1437043 ?auto_1437041 ) ) ( not ( = ?auto_1437043 ?auto_1437045 ) ) ( not ( = ?auto_1437043 ?auto_1437047 ) ) ( not ( = ?auto_1437043 ?auto_1437046 ) ) ( not ( = ?auto_1437043 ?auto_1437048 ) ) ( not ( = ?auto_1437043 ?auto_1437049 ) ) ( not ( = ?auto_1437043 ?auto_1437054 ) ) ( not ( = ?auto_1437044 ?auto_1437041 ) ) ( not ( = ?auto_1437044 ?auto_1437045 ) ) ( not ( = ?auto_1437044 ?auto_1437047 ) ) ( not ( = ?auto_1437044 ?auto_1437046 ) ) ( not ( = ?auto_1437044 ?auto_1437048 ) ) ( not ( = ?auto_1437044 ?auto_1437049 ) ) ( not ( = ?auto_1437044 ?auto_1437054 ) ) ( not ( = ?auto_1437041 ?auto_1437045 ) ) ( not ( = ?auto_1437041 ?auto_1437047 ) ) ( not ( = ?auto_1437041 ?auto_1437046 ) ) ( not ( = ?auto_1437041 ?auto_1437048 ) ) ( not ( = ?auto_1437041 ?auto_1437049 ) ) ( not ( = ?auto_1437041 ?auto_1437054 ) ) ( not ( = ?auto_1437045 ?auto_1437047 ) ) ( not ( = ?auto_1437045 ?auto_1437046 ) ) ( not ( = ?auto_1437045 ?auto_1437048 ) ) ( not ( = ?auto_1437045 ?auto_1437049 ) ) ( not ( = ?auto_1437045 ?auto_1437054 ) ) ( not ( = ?auto_1437047 ?auto_1437046 ) ) ( not ( = ?auto_1437047 ?auto_1437048 ) ) ( not ( = ?auto_1437047 ?auto_1437049 ) ) ( not ( = ?auto_1437047 ?auto_1437054 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1437046 ?auto_1437048 ?auto_1437049 )
      ( MAKE-8CRATE-VERIFY ?auto_1437042 ?auto_1437043 ?auto_1437044 ?auto_1437041 ?auto_1437045 ?auto_1437047 ?auto_1437046 ?auto_1437048 ?auto_1437049 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1437135 - SURFACE
      ?auto_1437136 - SURFACE
      ?auto_1437137 - SURFACE
      ?auto_1437134 - SURFACE
      ?auto_1437138 - SURFACE
      ?auto_1437140 - SURFACE
      ?auto_1437139 - SURFACE
      ?auto_1437141 - SURFACE
      ?auto_1437142 - SURFACE
    )
    :vars
    (
      ?auto_1437148 - HOIST
      ?auto_1437143 - PLACE
      ?auto_1437146 - PLACE
      ?auto_1437145 - HOIST
      ?auto_1437147 - SURFACE
      ?auto_1437144 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1437148 ?auto_1437143 ) ( IS-CRATE ?auto_1437142 ) ( not ( = ?auto_1437141 ?auto_1437142 ) ) ( not ( = ?auto_1437139 ?auto_1437141 ) ) ( not ( = ?auto_1437139 ?auto_1437142 ) ) ( not ( = ?auto_1437146 ?auto_1437143 ) ) ( HOIST-AT ?auto_1437145 ?auto_1437146 ) ( not ( = ?auto_1437148 ?auto_1437145 ) ) ( AVAILABLE ?auto_1437145 ) ( SURFACE-AT ?auto_1437142 ?auto_1437146 ) ( ON ?auto_1437142 ?auto_1437147 ) ( CLEAR ?auto_1437142 ) ( not ( = ?auto_1437141 ?auto_1437147 ) ) ( not ( = ?auto_1437142 ?auto_1437147 ) ) ( not ( = ?auto_1437139 ?auto_1437147 ) ) ( TRUCK-AT ?auto_1437144 ?auto_1437143 ) ( SURFACE-AT ?auto_1437139 ?auto_1437143 ) ( CLEAR ?auto_1437139 ) ( LIFTING ?auto_1437148 ?auto_1437141 ) ( IS-CRATE ?auto_1437141 ) ( ON ?auto_1437136 ?auto_1437135 ) ( ON ?auto_1437137 ?auto_1437136 ) ( ON ?auto_1437134 ?auto_1437137 ) ( ON ?auto_1437138 ?auto_1437134 ) ( ON ?auto_1437140 ?auto_1437138 ) ( ON ?auto_1437139 ?auto_1437140 ) ( not ( = ?auto_1437135 ?auto_1437136 ) ) ( not ( = ?auto_1437135 ?auto_1437137 ) ) ( not ( = ?auto_1437135 ?auto_1437134 ) ) ( not ( = ?auto_1437135 ?auto_1437138 ) ) ( not ( = ?auto_1437135 ?auto_1437140 ) ) ( not ( = ?auto_1437135 ?auto_1437139 ) ) ( not ( = ?auto_1437135 ?auto_1437141 ) ) ( not ( = ?auto_1437135 ?auto_1437142 ) ) ( not ( = ?auto_1437135 ?auto_1437147 ) ) ( not ( = ?auto_1437136 ?auto_1437137 ) ) ( not ( = ?auto_1437136 ?auto_1437134 ) ) ( not ( = ?auto_1437136 ?auto_1437138 ) ) ( not ( = ?auto_1437136 ?auto_1437140 ) ) ( not ( = ?auto_1437136 ?auto_1437139 ) ) ( not ( = ?auto_1437136 ?auto_1437141 ) ) ( not ( = ?auto_1437136 ?auto_1437142 ) ) ( not ( = ?auto_1437136 ?auto_1437147 ) ) ( not ( = ?auto_1437137 ?auto_1437134 ) ) ( not ( = ?auto_1437137 ?auto_1437138 ) ) ( not ( = ?auto_1437137 ?auto_1437140 ) ) ( not ( = ?auto_1437137 ?auto_1437139 ) ) ( not ( = ?auto_1437137 ?auto_1437141 ) ) ( not ( = ?auto_1437137 ?auto_1437142 ) ) ( not ( = ?auto_1437137 ?auto_1437147 ) ) ( not ( = ?auto_1437134 ?auto_1437138 ) ) ( not ( = ?auto_1437134 ?auto_1437140 ) ) ( not ( = ?auto_1437134 ?auto_1437139 ) ) ( not ( = ?auto_1437134 ?auto_1437141 ) ) ( not ( = ?auto_1437134 ?auto_1437142 ) ) ( not ( = ?auto_1437134 ?auto_1437147 ) ) ( not ( = ?auto_1437138 ?auto_1437140 ) ) ( not ( = ?auto_1437138 ?auto_1437139 ) ) ( not ( = ?auto_1437138 ?auto_1437141 ) ) ( not ( = ?auto_1437138 ?auto_1437142 ) ) ( not ( = ?auto_1437138 ?auto_1437147 ) ) ( not ( = ?auto_1437140 ?auto_1437139 ) ) ( not ( = ?auto_1437140 ?auto_1437141 ) ) ( not ( = ?auto_1437140 ?auto_1437142 ) ) ( not ( = ?auto_1437140 ?auto_1437147 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1437139 ?auto_1437141 ?auto_1437142 )
      ( MAKE-8CRATE-VERIFY ?auto_1437135 ?auto_1437136 ?auto_1437137 ?auto_1437134 ?auto_1437138 ?auto_1437140 ?auto_1437139 ?auto_1437141 ?auto_1437142 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1437228 - SURFACE
      ?auto_1437229 - SURFACE
      ?auto_1437230 - SURFACE
      ?auto_1437227 - SURFACE
      ?auto_1437231 - SURFACE
      ?auto_1437233 - SURFACE
      ?auto_1437232 - SURFACE
      ?auto_1437234 - SURFACE
      ?auto_1437235 - SURFACE
    )
    :vars
    (
      ?auto_1437237 - HOIST
      ?auto_1437241 - PLACE
      ?auto_1437238 - PLACE
      ?auto_1437236 - HOIST
      ?auto_1437239 - SURFACE
      ?auto_1437240 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1437237 ?auto_1437241 ) ( IS-CRATE ?auto_1437235 ) ( not ( = ?auto_1437234 ?auto_1437235 ) ) ( not ( = ?auto_1437232 ?auto_1437234 ) ) ( not ( = ?auto_1437232 ?auto_1437235 ) ) ( not ( = ?auto_1437238 ?auto_1437241 ) ) ( HOIST-AT ?auto_1437236 ?auto_1437238 ) ( not ( = ?auto_1437237 ?auto_1437236 ) ) ( AVAILABLE ?auto_1437236 ) ( SURFACE-AT ?auto_1437235 ?auto_1437238 ) ( ON ?auto_1437235 ?auto_1437239 ) ( CLEAR ?auto_1437235 ) ( not ( = ?auto_1437234 ?auto_1437239 ) ) ( not ( = ?auto_1437235 ?auto_1437239 ) ) ( not ( = ?auto_1437232 ?auto_1437239 ) ) ( TRUCK-AT ?auto_1437240 ?auto_1437241 ) ( SURFACE-AT ?auto_1437232 ?auto_1437241 ) ( CLEAR ?auto_1437232 ) ( IS-CRATE ?auto_1437234 ) ( AVAILABLE ?auto_1437237 ) ( IN ?auto_1437234 ?auto_1437240 ) ( ON ?auto_1437229 ?auto_1437228 ) ( ON ?auto_1437230 ?auto_1437229 ) ( ON ?auto_1437227 ?auto_1437230 ) ( ON ?auto_1437231 ?auto_1437227 ) ( ON ?auto_1437233 ?auto_1437231 ) ( ON ?auto_1437232 ?auto_1437233 ) ( not ( = ?auto_1437228 ?auto_1437229 ) ) ( not ( = ?auto_1437228 ?auto_1437230 ) ) ( not ( = ?auto_1437228 ?auto_1437227 ) ) ( not ( = ?auto_1437228 ?auto_1437231 ) ) ( not ( = ?auto_1437228 ?auto_1437233 ) ) ( not ( = ?auto_1437228 ?auto_1437232 ) ) ( not ( = ?auto_1437228 ?auto_1437234 ) ) ( not ( = ?auto_1437228 ?auto_1437235 ) ) ( not ( = ?auto_1437228 ?auto_1437239 ) ) ( not ( = ?auto_1437229 ?auto_1437230 ) ) ( not ( = ?auto_1437229 ?auto_1437227 ) ) ( not ( = ?auto_1437229 ?auto_1437231 ) ) ( not ( = ?auto_1437229 ?auto_1437233 ) ) ( not ( = ?auto_1437229 ?auto_1437232 ) ) ( not ( = ?auto_1437229 ?auto_1437234 ) ) ( not ( = ?auto_1437229 ?auto_1437235 ) ) ( not ( = ?auto_1437229 ?auto_1437239 ) ) ( not ( = ?auto_1437230 ?auto_1437227 ) ) ( not ( = ?auto_1437230 ?auto_1437231 ) ) ( not ( = ?auto_1437230 ?auto_1437233 ) ) ( not ( = ?auto_1437230 ?auto_1437232 ) ) ( not ( = ?auto_1437230 ?auto_1437234 ) ) ( not ( = ?auto_1437230 ?auto_1437235 ) ) ( not ( = ?auto_1437230 ?auto_1437239 ) ) ( not ( = ?auto_1437227 ?auto_1437231 ) ) ( not ( = ?auto_1437227 ?auto_1437233 ) ) ( not ( = ?auto_1437227 ?auto_1437232 ) ) ( not ( = ?auto_1437227 ?auto_1437234 ) ) ( not ( = ?auto_1437227 ?auto_1437235 ) ) ( not ( = ?auto_1437227 ?auto_1437239 ) ) ( not ( = ?auto_1437231 ?auto_1437233 ) ) ( not ( = ?auto_1437231 ?auto_1437232 ) ) ( not ( = ?auto_1437231 ?auto_1437234 ) ) ( not ( = ?auto_1437231 ?auto_1437235 ) ) ( not ( = ?auto_1437231 ?auto_1437239 ) ) ( not ( = ?auto_1437233 ?auto_1437232 ) ) ( not ( = ?auto_1437233 ?auto_1437234 ) ) ( not ( = ?auto_1437233 ?auto_1437235 ) ) ( not ( = ?auto_1437233 ?auto_1437239 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1437232 ?auto_1437234 ?auto_1437235 )
      ( MAKE-8CRATE-VERIFY ?auto_1437228 ?auto_1437229 ?auto_1437230 ?auto_1437227 ?auto_1437231 ?auto_1437233 ?auto_1437232 ?auto_1437234 ?auto_1437235 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1441334 - SURFACE
      ?auto_1441335 - SURFACE
      ?auto_1441336 - SURFACE
      ?auto_1441333 - SURFACE
      ?auto_1441337 - SURFACE
      ?auto_1441339 - SURFACE
      ?auto_1441338 - SURFACE
      ?auto_1441340 - SURFACE
      ?auto_1441341 - SURFACE
      ?auto_1441342 - SURFACE
    )
    :vars
    (
      ?auto_1441344 - HOIST
      ?auto_1441343 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1441344 ?auto_1441343 ) ( SURFACE-AT ?auto_1441341 ?auto_1441343 ) ( CLEAR ?auto_1441341 ) ( LIFTING ?auto_1441344 ?auto_1441342 ) ( IS-CRATE ?auto_1441342 ) ( not ( = ?auto_1441341 ?auto_1441342 ) ) ( ON ?auto_1441335 ?auto_1441334 ) ( ON ?auto_1441336 ?auto_1441335 ) ( ON ?auto_1441333 ?auto_1441336 ) ( ON ?auto_1441337 ?auto_1441333 ) ( ON ?auto_1441339 ?auto_1441337 ) ( ON ?auto_1441338 ?auto_1441339 ) ( ON ?auto_1441340 ?auto_1441338 ) ( ON ?auto_1441341 ?auto_1441340 ) ( not ( = ?auto_1441334 ?auto_1441335 ) ) ( not ( = ?auto_1441334 ?auto_1441336 ) ) ( not ( = ?auto_1441334 ?auto_1441333 ) ) ( not ( = ?auto_1441334 ?auto_1441337 ) ) ( not ( = ?auto_1441334 ?auto_1441339 ) ) ( not ( = ?auto_1441334 ?auto_1441338 ) ) ( not ( = ?auto_1441334 ?auto_1441340 ) ) ( not ( = ?auto_1441334 ?auto_1441341 ) ) ( not ( = ?auto_1441334 ?auto_1441342 ) ) ( not ( = ?auto_1441335 ?auto_1441336 ) ) ( not ( = ?auto_1441335 ?auto_1441333 ) ) ( not ( = ?auto_1441335 ?auto_1441337 ) ) ( not ( = ?auto_1441335 ?auto_1441339 ) ) ( not ( = ?auto_1441335 ?auto_1441338 ) ) ( not ( = ?auto_1441335 ?auto_1441340 ) ) ( not ( = ?auto_1441335 ?auto_1441341 ) ) ( not ( = ?auto_1441335 ?auto_1441342 ) ) ( not ( = ?auto_1441336 ?auto_1441333 ) ) ( not ( = ?auto_1441336 ?auto_1441337 ) ) ( not ( = ?auto_1441336 ?auto_1441339 ) ) ( not ( = ?auto_1441336 ?auto_1441338 ) ) ( not ( = ?auto_1441336 ?auto_1441340 ) ) ( not ( = ?auto_1441336 ?auto_1441341 ) ) ( not ( = ?auto_1441336 ?auto_1441342 ) ) ( not ( = ?auto_1441333 ?auto_1441337 ) ) ( not ( = ?auto_1441333 ?auto_1441339 ) ) ( not ( = ?auto_1441333 ?auto_1441338 ) ) ( not ( = ?auto_1441333 ?auto_1441340 ) ) ( not ( = ?auto_1441333 ?auto_1441341 ) ) ( not ( = ?auto_1441333 ?auto_1441342 ) ) ( not ( = ?auto_1441337 ?auto_1441339 ) ) ( not ( = ?auto_1441337 ?auto_1441338 ) ) ( not ( = ?auto_1441337 ?auto_1441340 ) ) ( not ( = ?auto_1441337 ?auto_1441341 ) ) ( not ( = ?auto_1441337 ?auto_1441342 ) ) ( not ( = ?auto_1441339 ?auto_1441338 ) ) ( not ( = ?auto_1441339 ?auto_1441340 ) ) ( not ( = ?auto_1441339 ?auto_1441341 ) ) ( not ( = ?auto_1441339 ?auto_1441342 ) ) ( not ( = ?auto_1441338 ?auto_1441340 ) ) ( not ( = ?auto_1441338 ?auto_1441341 ) ) ( not ( = ?auto_1441338 ?auto_1441342 ) ) ( not ( = ?auto_1441340 ?auto_1441341 ) ) ( not ( = ?auto_1441340 ?auto_1441342 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1441341 ?auto_1441342 )
      ( MAKE-9CRATE-VERIFY ?auto_1441334 ?auto_1441335 ?auto_1441336 ?auto_1441333 ?auto_1441337 ?auto_1441339 ?auto_1441338 ?auto_1441340 ?auto_1441341 ?auto_1441342 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1441414 - SURFACE
      ?auto_1441415 - SURFACE
      ?auto_1441416 - SURFACE
      ?auto_1441413 - SURFACE
      ?auto_1441417 - SURFACE
      ?auto_1441419 - SURFACE
      ?auto_1441418 - SURFACE
      ?auto_1441420 - SURFACE
      ?auto_1441421 - SURFACE
      ?auto_1441422 - SURFACE
    )
    :vars
    (
      ?auto_1441424 - HOIST
      ?auto_1441423 - PLACE
      ?auto_1441425 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1441424 ?auto_1441423 ) ( SURFACE-AT ?auto_1441421 ?auto_1441423 ) ( CLEAR ?auto_1441421 ) ( IS-CRATE ?auto_1441422 ) ( not ( = ?auto_1441421 ?auto_1441422 ) ) ( TRUCK-AT ?auto_1441425 ?auto_1441423 ) ( AVAILABLE ?auto_1441424 ) ( IN ?auto_1441422 ?auto_1441425 ) ( ON ?auto_1441421 ?auto_1441420 ) ( not ( = ?auto_1441420 ?auto_1441421 ) ) ( not ( = ?auto_1441420 ?auto_1441422 ) ) ( ON ?auto_1441415 ?auto_1441414 ) ( ON ?auto_1441416 ?auto_1441415 ) ( ON ?auto_1441413 ?auto_1441416 ) ( ON ?auto_1441417 ?auto_1441413 ) ( ON ?auto_1441419 ?auto_1441417 ) ( ON ?auto_1441418 ?auto_1441419 ) ( ON ?auto_1441420 ?auto_1441418 ) ( not ( = ?auto_1441414 ?auto_1441415 ) ) ( not ( = ?auto_1441414 ?auto_1441416 ) ) ( not ( = ?auto_1441414 ?auto_1441413 ) ) ( not ( = ?auto_1441414 ?auto_1441417 ) ) ( not ( = ?auto_1441414 ?auto_1441419 ) ) ( not ( = ?auto_1441414 ?auto_1441418 ) ) ( not ( = ?auto_1441414 ?auto_1441420 ) ) ( not ( = ?auto_1441414 ?auto_1441421 ) ) ( not ( = ?auto_1441414 ?auto_1441422 ) ) ( not ( = ?auto_1441415 ?auto_1441416 ) ) ( not ( = ?auto_1441415 ?auto_1441413 ) ) ( not ( = ?auto_1441415 ?auto_1441417 ) ) ( not ( = ?auto_1441415 ?auto_1441419 ) ) ( not ( = ?auto_1441415 ?auto_1441418 ) ) ( not ( = ?auto_1441415 ?auto_1441420 ) ) ( not ( = ?auto_1441415 ?auto_1441421 ) ) ( not ( = ?auto_1441415 ?auto_1441422 ) ) ( not ( = ?auto_1441416 ?auto_1441413 ) ) ( not ( = ?auto_1441416 ?auto_1441417 ) ) ( not ( = ?auto_1441416 ?auto_1441419 ) ) ( not ( = ?auto_1441416 ?auto_1441418 ) ) ( not ( = ?auto_1441416 ?auto_1441420 ) ) ( not ( = ?auto_1441416 ?auto_1441421 ) ) ( not ( = ?auto_1441416 ?auto_1441422 ) ) ( not ( = ?auto_1441413 ?auto_1441417 ) ) ( not ( = ?auto_1441413 ?auto_1441419 ) ) ( not ( = ?auto_1441413 ?auto_1441418 ) ) ( not ( = ?auto_1441413 ?auto_1441420 ) ) ( not ( = ?auto_1441413 ?auto_1441421 ) ) ( not ( = ?auto_1441413 ?auto_1441422 ) ) ( not ( = ?auto_1441417 ?auto_1441419 ) ) ( not ( = ?auto_1441417 ?auto_1441418 ) ) ( not ( = ?auto_1441417 ?auto_1441420 ) ) ( not ( = ?auto_1441417 ?auto_1441421 ) ) ( not ( = ?auto_1441417 ?auto_1441422 ) ) ( not ( = ?auto_1441419 ?auto_1441418 ) ) ( not ( = ?auto_1441419 ?auto_1441420 ) ) ( not ( = ?auto_1441419 ?auto_1441421 ) ) ( not ( = ?auto_1441419 ?auto_1441422 ) ) ( not ( = ?auto_1441418 ?auto_1441420 ) ) ( not ( = ?auto_1441418 ?auto_1441421 ) ) ( not ( = ?auto_1441418 ?auto_1441422 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1441420 ?auto_1441421 ?auto_1441422 )
      ( MAKE-9CRATE-VERIFY ?auto_1441414 ?auto_1441415 ?auto_1441416 ?auto_1441413 ?auto_1441417 ?auto_1441419 ?auto_1441418 ?auto_1441420 ?auto_1441421 ?auto_1441422 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1441504 - SURFACE
      ?auto_1441505 - SURFACE
      ?auto_1441506 - SURFACE
      ?auto_1441503 - SURFACE
      ?auto_1441507 - SURFACE
      ?auto_1441509 - SURFACE
      ?auto_1441508 - SURFACE
      ?auto_1441510 - SURFACE
      ?auto_1441511 - SURFACE
      ?auto_1441512 - SURFACE
    )
    :vars
    (
      ?auto_1441516 - HOIST
      ?auto_1441515 - PLACE
      ?auto_1441513 - TRUCK
      ?auto_1441514 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1441516 ?auto_1441515 ) ( SURFACE-AT ?auto_1441511 ?auto_1441515 ) ( CLEAR ?auto_1441511 ) ( IS-CRATE ?auto_1441512 ) ( not ( = ?auto_1441511 ?auto_1441512 ) ) ( AVAILABLE ?auto_1441516 ) ( IN ?auto_1441512 ?auto_1441513 ) ( ON ?auto_1441511 ?auto_1441510 ) ( not ( = ?auto_1441510 ?auto_1441511 ) ) ( not ( = ?auto_1441510 ?auto_1441512 ) ) ( TRUCK-AT ?auto_1441513 ?auto_1441514 ) ( not ( = ?auto_1441514 ?auto_1441515 ) ) ( ON ?auto_1441505 ?auto_1441504 ) ( ON ?auto_1441506 ?auto_1441505 ) ( ON ?auto_1441503 ?auto_1441506 ) ( ON ?auto_1441507 ?auto_1441503 ) ( ON ?auto_1441509 ?auto_1441507 ) ( ON ?auto_1441508 ?auto_1441509 ) ( ON ?auto_1441510 ?auto_1441508 ) ( not ( = ?auto_1441504 ?auto_1441505 ) ) ( not ( = ?auto_1441504 ?auto_1441506 ) ) ( not ( = ?auto_1441504 ?auto_1441503 ) ) ( not ( = ?auto_1441504 ?auto_1441507 ) ) ( not ( = ?auto_1441504 ?auto_1441509 ) ) ( not ( = ?auto_1441504 ?auto_1441508 ) ) ( not ( = ?auto_1441504 ?auto_1441510 ) ) ( not ( = ?auto_1441504 ?auto_1441511 ) ) ( not ( = ?auto_1441504 ?auto_1441512 ) ) ( not ( = ?auto_1441505 ?auto_1441506 ) ) ( not ( = ?auto_1441505 ?auto_1441503 ) ) ( not ( = ?auto_1441505 ?auto_1441507 ) ) ( not ( = ?auto_1441505 ?auto_1441509 ) ) ( not ( = ?auto_1441505 ?auto_1441508 ) ) ( not ( = ?auto_1441505 ?auto_1441510 ) ) ( not ( = ?auto_1441505 ?auto_1441511 ) ) ( not ( = ?auto_1441505 ?auto_1441512 ) ) ( not ( = ?auto_1441506 ?auto_1441503 ) ) ( not ( = ?auto_1441506 ?auto_1441507 ) ) ( not ( = ?auto_1441506 ?auto_1441509 ) ) ( not ( = ?auto_1441506 ?auto_1441508 ) ) ( not ( = ?auto_1441506 ?auto_1441510 ) ) ( not ( = ?auto_1441506 ?auto_1441511 ) ) ( not ( = ?auto_1441506 ?auto_1441512 ) ) ( not ( = ?auto_1441503 ?auto_1441507 ) ) ( not ( = ?auto_1441503 ?auto_1441509 ) ) ( not ( = ?auto_1441503 ?auto_1441508 ) ) ( not ( = ?auto_1441503 ?auto_1441510 ) ) ( not ( = ?auto_1441503 ?auto_1441511 ) ) ( not ( = ?auto_1441503 ?auto_1441512 ) ) ( not ( = ?auto_1441507 ?auto_1441509 ) ) ( not ( = ?auto_1441507 ?auto_1441508 ) ) ( not ( = ?auto_1441507 ?auto_1441510 ) ) ( not ( = ?auto_1441507 ?auto_1441511 ) ) ( not ( = ?auto_1441507 ?auto_1441512 ) ) ( not ( = ?auto_1441509 ?auto_1441508 ) ) ( not ( = ?auto_1441509 ?auto_1441510 ) ) ( not ( = ?auto_1441509 ?auto_1441511 ) ) ( not ( = ?auto_1441509 ?auto_1441512 ) ) ( not ( = ?auto_1441508 ?auto_1441510 ) ) ( not ( = ?auto_1441508 ?auto_1441511 ) ) ( not ( = ?auto_1441508 ?auto_1441512 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1441510 ?auto_1441511 ?auto_1441512 )
      ( MAKE-9CRATE-VERIFY ?auto_1441504 ?auto_1441505 ?auto_1441506 ?auto_1441503 ?auto_1441507 ?auto_1441509 ?auto_1441508 ?auto_1441510 ?auto_1441511 ?auto_1441512 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1441603 - SURFACE
      ?auto_1441604 - SURFACE
      ?auto_1441605 - SURFACE
      ?auto_1441602 - SURFACE
      ?auto_1441606 - SURFACE
      ?auto_1441608 - SURFACE
      ?auto_1441607 - SURFACE
      ?auto_1441609 - SURFACE
      ?auto_1441610 - SURFACE
      ?auto_1441611 - SURFACE
    )
    :vars
    (
      ?auto_1441615 - HOIST
      ?auto_1441612 - PLACE
      ?auto_1441614 - TRUCK
      ?auto_1441616 - PLACE
      ?auto_1441613 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1441615 ?auto_1441612 ) ( SURFACE-AT ?auto_1441610 ?auto_1441612 ) ( CLEAR ?auto_1441610 ) ( IS-CRATE ?auto_1441611 ) ( not ( = ?auto_1441610 ?auto_1441611 ) ) ( AVAILABLE ?auto_1441615 ) ( ON ?auto_1441610 ?auto_1441609 ) ( not ( = ?auto_1441609 ?auto_1441610 ) ) ( not ( = ?auto_1441609 ?auto_1441611 ) ) ( TRUCK-AT ?auto_1441614 ?auto_1441616 ) ( not ( = ?auto_1441616 ?auto_1441612 ) ) ( HOIST-AT ?auto_1441613 ?auto_1441616 ) ( LIFTING ?auto_1441613 ?auto_1441611 ) ( not ( = ?auto_1441615 ?auto_1441613 ) ) ( ON ?auto_1441604 ?auto_1441603 ) ( ON ?auto_1441605 ?auto_1441604 ) ( ON ?auto_1441602 ?auto_1441605 ) ( ON ?auto_1441606 ?auto_1441602 ) ( ON ?auto_1441608 ?auto_1441606 ) ( ON ?auto_1441607 ?auto_1441608 ) ( ON ?auto_1441609 ?auto_1441607 ) ( not ( = ?auto_1441603 ?auto_1441604 ) ) ( not ( = ?auto_1441603 ?auto_1441605 ) ) ( not ( = ?auto_1441603 ?auto_1441602 ) ) ( not ( = ?auto_1441603 ?auto_1441606 ) ) ( not ( = ?auto_1441603 ?auto_1441608 ) ) ( not ( = ?auto_1441603 ?auto_1441607 ) ) ( not ( = ?auto_1441603 ?auto_1441609 ) ) ( not ( = ?auto_1441603 ?auto_1441610 ) ) ( not ( = ?auto_1441603 ?auto_1441611 ) ) ( not ( = ?auto_1441604 ?auto_1441605 ) ) ( not ( = ?auto_1441604 ?auto_1441602 ) ) ( not ( = ?auto_1441604 ?auto_1441606 ) ) ( not ( = ?auto_1441604 ?auto_1441608 ) ) ( not ( = ?auto_1441604 ?auto_1441607 ) ) ( not ( = ?auto_1441604 ?auto_1441609 ) ) ( not ( = ?auto_1441604 ?auto_1441610 ) ) ( not ( = ?auto_1441604 ?auto_1441611 ) ) ( not ( = ?auto_1441605 ?auto_1441602 ) ) ( not ( = ?auto_1441605 ?auto_1441606 ) ) ( not ( = ?auto_1441605 ?auto_1441608 ) ) ( not ( = ?auto_1441605 ?auto_1441607 ) ) ( not ( = ?auto_1441605 ?auto_1441609 ) ) ( not ( = ?auto_1441605 ?auto_1441610 ) ) ( not ( = ?auto_1441605 ?auto_1441611 ) ) ( not ( = ?auto_1441602 ?auto_1441606 ) ) ( not ( = ?auto_1441602 ?auto_1441608 ) ) ( not ( = ?auto_1441602 ?auto_1441607 ) ) ( not ( = ?auto_1441602 ?auto_1441609 ) ) ( not ( = ?auto_1441602 ?auto_1441610 ) ) ( not ( = ?auto_1441602 ?auto_1441611 ) ) ( not ( = ?auto_1441606 ?auto_1441608 ) ) ( not ( = ?auto_1441606 ?auto_1441607 ) ) ( not ( = ?auto_1441606 ?auto_1441609 ) ) ( not ( = ?auto_1441606 ?auto_1441610 ) ) ( not ( = ?auto_1441606 ?auto_1441611 ) ) ( not ( = ?auto_1441608 ?auto_1441607 ) ) ( not ( = ?auto_1441608 ?auto_1441609 ) ) ( not ( = ?auto_1441608 ?auto_1441610 ) ) ( not ( = ?auto_1441608 ?auto_1441611 ) ) ( not ( = ?auto_1441607 ?auto_1441609 ) ) ( not ( = ?auto_1441607 ?auto_1441610 ) ) ( not ( = ?auto_1441607 ?auto_1441611 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1441609 ?auto_1441610 ?auto_1441611 )
      ( MAKE-9CRATE-VERIFY ?auto_1441603 ?auto_1441604 ?auto_1441605 ?auto_1441602 ?auto_1441606 ?auto_1441608 ?auto_1441607 ?auto_1441609 ?auto_1441610 ?auto_1441611 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1441711 - SURFACE
      ?auto_1441712 - SURFACE
      ?auto_1441713 - SURFACE
      ?auto_1441710 - SURFACE
      ?auto_1441714 - SURFACE
      ?auto_1441716 - SURFACE
      ?auto_1441715 - SURFACE
      ?auto_1441717 - SURFACE
      ?auto_1441718 - SURFACE
      ?auto_1441719 - SURFACE
    )
    :vars
    (
      ?auto_1441724 - HOIST
      ?auto_1441725 - PLACE
      ?auto_1441720 - TRUCK
      ?auto_1441721 - PLACE
      ?auto_1441722 - HOIST
      ?auto_1441723 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1441724 ?auto_1441725 ) ( SURFACE-AT ?auto_1441718 ?auto_1441725 ) ( CLEAR ?auto_1441718 ) ( IS-CRATE ?auto_1441719 ) ( not ( = ?auto_1441718 ?auto_1441719 ) ) ( AVAILABLE ?auto_1441724 ) ( ON ?auto_1441718 ?auto_1441717 ) ( not ( = ?auto_1441717 ?auto_1441718 ) ) ( not ( = ?auto_1441717 ?auto_1441719 ) ) ( TRUCK-AT ?auto_1441720 ?auto_1441721 ) ( not ( = ?auto_1441721 ?auto_1441725 ) ) ( HOIST-AT ?auto_1441722 ?auto_1441721 ) ( not ( = ?auto_1441724 ?auto_1441722 ) ) ( AVAILABLE ?auto_1441722 ) ( SURFACE-AT ?auto_1441719 ?auto_1441721 ) ( ON ?auto_1441719 ?auto_1441723 ) ( CLEAR ?auto_1441719 ) ( not ( = ?auto_1441718 ?auto_1441723 ) ) ( not ( = ?auto_1441719 ?auto_1441723 ) ) ( not ( = ?auto_1441717 ?auto_1441723 ) ) ( ON ?auto_1441712 ?auto_1441711 ) ( ON ?auto_1441713 ?auto_1441712 ) ( ON ?auto_1441710 ?auto_1441713 ) ( ON ?auto_1441714 ?auto_1441710 ) ( ON ?auto_1441716 ?auto_1441714 ) ( ON ?auto_1441715 ?auto_1441716 ) ( ON ?auto_1441717 ?auto_1441715 ) ( not ( = ?auto_1441711 ?auto_1441712 ) ) ( not ( = ?auto_1441711 ?auto_1441713 ) ) ( not ( = ?auto_1441711 ?auto_1441710 ) ) ( not ( = ?auto_1441711 ?auto_1441714 ) ) ( not ( = ?auto_1441711 ?auto_1441716 ) ) ( not ( = ?auto_1441711 ?auto_1441715 ) ) ( not ( = ?auto_1441711 ?auto_1441717 ) ) ( not ( = ?auto_1441711 ?auto_1441718 ) ) ( not ( = ?auto_1441711 ?auto_1441719 ) ) ( not ( = ?auto_1441711 ?auto_1441723 ) ) ( not ( = ?auto_1441712 ?auto_1441713 ) ) ( not ( = ?auto_1441712 ?auto_1441710 ) ) ( not ( = ?auto_1441712 ?auto_1441714 ) ) ( not ( = ?auto_1441712 ?auto_1441716 ) ) ( not ( = ?auto_1441712 ?auto_1441715 ) ) ( not ( = ?auto_1441712 ?auto_1441717 ) ) ( not ( = ?auto_1441712 ?auto_1441718 ) ) ( not ( = ?auto_1441712 ?auto_1441719 ) ) ( not ( = ?auto_1441712 ?auto_1441723 ) ) ( not ( = ?auto_1441713 ?auto_1441710 ) ) ( not ( = ?auto_1441713 ?auto_1441714 ) ) ( not ( = ?auto_1441713 ?auto_1441716 ) ) ( not ( = ?auto_1441713 ?auto_1441715 ) ) ( not ( = ?auto_1441713 ?auto_1441717 ) ) ( not ( = ?auto_1441713 ?auto_1441718 ) ) ( not ( = ?auto_1441713 ?auto_1441719 ) ) ( not ( = ?auto_1441713 ?auto_1441723 ) ) ( not ( = ?auto_1441710 ?auto_1441714 ) ) ( not ( = ?auto_1441710 ?auto_1441716 ) ) ( not ( = ?auto_1441710 ?auto_1441715 ) ) ( not ( = ?auto_1441710 ?auto_1441717 ) ) ( not ( = ?auto_1441710 ?auto_1441718 ) ) ( not ( = ?auto_1441710 ?auto_1441719 ) ) ( not ( = ?auto_1441710 ?auto_1441723 ) ) ( not ( = ?auto_1441714 ?auto_1441716 ) ) ( not ( = ?auto_1441714 ?auto_1441715 ) ) ( not ( = ?auto_1441714 ?auto_1441717 ) ) ( not ( = ?auto_1441714 ?auto_1441718 ) ) ( not ( = ?auto_1441714 ?auto_1441719 ) ) ( not ( = ?auto_1441714 ?auto_1441723 ) ) ( not ( = ?auto_1441716 ?auto_1441715 ) ) ( not ( = ?auto_1441716 ?auto_1441717 ) ) ( not ( = ?auto_1441716 ?auto_1441718 ) ) ( not ( = ?auto_1441716 ?auto_1441719 ) ) ( not ( = ?auto_1441716 ?auto_1441723 ) ) ( not ( = ?auto_1441715 ?auto_1441717 ) ) ( not ( = ?auto_1441715 ?auto_1441718 ) ) ( not ( = ?auto_1441715 ?auto_1441719 ) ) ( not ( = ?auto_1441715 ?auto_1441723 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1441717 ?auto_1441718 ?auto_1441719 )
      ( MAKE-9CRATE-VERIFY ?auto_1441711 ?auto_1441712 ?auto_1441713 ?auto_1441710 ?auto_1441714 ?auto_1441716 ?auto_1441715 ?auto_1441717 ?auto_1441718 ?auto_1441719 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1441820 - SURFACE
      ?auto_1441821 - SURFACE
      ?auto_1441822 - SURFACE
      ?auto_1441819 - SURFACE
      ?auto_1441823 - SURFACE
      ?auto_1441825 - SURFACE
      ?auto_1441824 - SURFACE
      ?auto_1441826 - SURFACE
      ?auto_1441827 - SURFACE
      ?auto_1441828 - SURFACE
    )
    :vars
    (
      ?auto_1441830 - HOIST
      ?auto_1441829 - PLACE
      ?auto_1441833 - PLACE
      ?auto_1441834 - HOIST
      ?auto_1441831 - SURFACE
      ?auto_1441832 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1441830 ?auto_1441829 ) ( SURFACE-AT ?auto_1441827 ?auto_1441829 ) ( CLEAR ?auto_1441827 ) ( IS-CRATE ?auto_1441828 ) ( not ( = ?auto_1441827 ?auto_1441828 ) ) ( AVAILABLE ?auto_1441830 ) ( ON ?auto_1441827 ?auto_1441826 ) ( not ( = ?auto_1441826 ?auto_1441827 ) ) ( not ( = ?auto_1441826 ?auto_1441828 ) ) ( not ( = ?auto_1441833 ?auto_1441829 ) ) ( HOIST-AT ?auto_1441834 ?auto_1441833 ) ( not ( = ?auto_1441830 ?auto_1441834 ) ) ( AVAILABLE ?auto_1441834 ) ( SURFACE-AT ?auto_1441828 ?auto_1441833 ) ( ON ?auto_1441828 ?auto_1441831 ) ( CLEAR ?auto_1441828 ) ( not ( = ?auto_1441827 ?auto_1441831 ) ) ( not ( = ?auto_1441828 ?auto_1441831 ) ) ( not ( = ?auto_1441826 ?auto_1441831 ) ) ( TRUCK-AT ?auto_1441832 ?auto_1441829 ) ( ON ?auto_1441821 ?auto_1441820 ) ( ON ?auto_1441822 ?auto_1441821 ) ( ON ?auto_1441819 ?auto_1441822 ) ( ON ?auto_1441823 ?auto_1441819 ) ( ON ?auto_1441825 ?auto_1441823 ) ( ON ?auto_1441824 ?auto_1441825 ) ( ON ?auto_1441826 ?auto_1441824 ) ( not ( = ?auto_1441820 ?auto_1441821 ) ) ( not ( = ?auto_1441820 ?auto_1441822 ) ) ( not ( = ?auto_1441820 ?auto_1441819 ) ) ( not ( = ?auto_1441820 ?auto_1441823 ) ) ( not ( = ?auto_1441820 ?auto_1441825 ) ) ( not ( = ?auto_1441820 ?auto_1441824 ) ) ( not ( = ?auto_1441820 ?auto_1441826 ) ) ( not ( = ?auto_1441820 ?auto_1441827 ) ) ( not ( = ?auto_1441820 ?auto_1441828 ) ) ( not ( = ?auto_1441820 ?auto_1441831 ) ) ( not ( = ?auto_1441821 ?auto_1441822 ) ) ( not ( = ?auto_1441821 ?auto_1441819 ) ) ( not ( = ?auto_1441821 ?auto_1441823 ) ) ( not ( = ?auto_1441821 ?auto_1441825 ) ) ( not ( = ?auto_1441821 ?auto_1441824 ) ) ( not ( = ?auto_1441821 ?auto_1441826 ) ) ( not ( = ?auto_1441821 ?auto_1441827 ) ) ( not ( = ?auto_1441821 ?auto_1441828 ) ) ( not ( = ?auto_1441821 ?auto_1441831 ) ) ( not ( = ?auto_1441822 ?auto_1441819 ) ) ( not ( = ?auto_1441822 ?auto_1441823 ) ) ( not ( = ?auto_1441822 ?auto_1441825 ) ) ( not ( = ?auto_1441822 ?auto_1441824 ) ) ( not ( = ?auto_1441822 ?auto_1441826 ) ) ( not ( = ?auto_1441822 ?auto_1441827 ) ) ( not ( = ?auto_1441822 ?auto_1441828 ) ) ( not ( = ?auto_1441822 ?auto_1441831 ) ) ( not ( = ?auto_1441819 ?auto_1441823 ) ) ( not ( = ?auto_1441819 ?auto_1441825 ) ) ( not ( = ?auto_1441819 ?auto_1441824 ) ) ( not ( = ?auto_1441819 ?auto_1441826 ) ) ( not ( = ?auto_1441819 ?auto_1441827 ) ) ( not ( = ?auto_1441819 ?auto_1441828 ) ) ( not ( = ?auto_1441819 ?auto_1441831 ) ) ( not ( = ?auto_1441823 ?auto_1441825 ) ) ( not ( = ?auto_1441823 ?auto_1441824 ) ) ( not ( = ?auto_1441823 ?auto_1441826 ) ) ( not ( = ?auto_1441823 ?auto_1441827 ) ) ( not ( = ?auto_1441823 ?auto_1441828 ) ) ( not ( = ?auto_1441823 ?auto_1441831 ) ) ( not ( = ?auto_1441825 ?auto_1441824 ) ) ( not ( = ?auto_1441825 ?auto_1441826 ) ) ( not ( = ?auto_1441825 ?auto_1441827 ) ) ( not ( = ?auto_1441825 ?auto_1441828 ) ) ( not ( = ?auto_1441825 ?auto_1441831 ) ) ( not ( = ?auto_1441824 ?auto_1441826 ) ) ( not ( = ?auto_1441824 ?auto_1441827 ) ) ( not ( = ?auto_1441824 ?auto_1441828 ) ) ( not ( = ?auto_1441824 ?auto_1441831 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1441826 ?auto_1441827 ?auto_1441828 )
      ( MAKE-9CRATE-VERIFY ?auto_1441820 ?auto_1441821 ?auto_1441822 ?auto_1441819 ?auto_1441823 ?auto_1441825 ?auto_1441824 ?auto_1441826 ?auto_1441827 ?auto_1441828 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1441929 - SURFACE
      ?auto_1441930 - SURFACE
      ?auto_1441931 - SURFACE
      ?auto_1441928 - SURFACE
      ?auto_1441932 - SURFACE
      ?auto_1441934 - SURFACE
      ?auto_1441933 - SURFACE
      ?auto_1441935 - SURFACE
      ?auto_1441936 - SURFACE
      ?auto_1441937 - SURFACE
    )
    :vars
    (
      ?auto_1441939 - HOIST
      ?auto_1441940 - PLACE
      ?auto_1441943 - PLACE
      ?auto_1441941 - HOIST
      ?auto_1441938 - SURFACE
      ?auto_1441942 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1441939 ?auto_1441940 ) ( IS-CRATE ?auto_1441937 ) ( not ( = ?auto_1441936 ?auto_1441937 ) ) ( not ( = ?auto_1441935 ?auto_1441936 ) ) ( not ( = ?auto_1441935 ?auto_1441937 ) ) ( not ( = ?auto_1441943 ?auto_1441940 ) ) ( HOIST-AT ?auto_1441941 ?auto_1441943 ) ( not ( = ?auto_1441939 ?auto_1441941 ) ) ( AVAILABLE ?auto_1441941 ) ( SURFACE-AT ?auto_1441937 ?auto_1441943 ) ( ON ?auto_1441937 ?auto_1441938 ) ( CLEAR ?auto_1441937 ) ( not ( = ?auto_1441936 ?auto_1441938 ) ) ( not ( = ?auto_1441937 ?auto_1441938 ) ) ( not ( = ?auto_1441935 ?auto_1441938 ) ) ( TRUCK-AT ?auto_1441942 ?auto_1441940 ) ( SURFACE-AT ?auto_1441935 ?auto_1441940 ) ( CLEAR ?auto_1441935 ) ( LIFTING ?auto_1441939 ?auto_1441936 ) ( IS-CRATE ?auto_1441936 ) ( ON ?auto_1441930 ?auto_1441929 ) ( ON ?auto_1441931 ?auto_1441930 ) ( ON ?auto_1441928 ?auto_1441931 ) ( ON ?auto_1441932 ?auto_1441928 ) ( ON ?auto_1441934 ?auto_1441932 ) ( ON ?auto_1441933 ?auto_1441934 ) ( ON ?auto_1441935 ?auto_1441933 ) ( not ( = ?auto_1441929 ?auto_1441930 ) ) ( not ( = ?auto_1441929 ?auto_1441931 ) ) ( not ( = ?auto_1441929 ?auto_1441928 ) ) ( not ( = ?auto_1441929 ?auto_1441932 ) ) ( not ( = ?auto_1441929 ?auto_1441934 ) ) ( not ( = ?auto_1441929 ?auto_1441933 ) ) ( not ( = ?auto_1441929 ?auto_1441935 ) ) ( not ( = ?auto_1441929 ?auto_1441936 ) ) ( not ( = ?auto_1441929 ?auto_1441937 ) ) ( not ( = ?auto_1441929 ?auto_1441938 ) ) ( not ( = ?auto_1441930 ?auto_1441931 ) ) ( not ( = ?auto_1441930 ?auto_1441928 ) ) ( not ( = ?auto_1441930 ?auto_1441932 ) ) ( not ( = ?auto_1441930 ?auto_1441934 ) ) ( not ( = ?auto_1441930 ?auto_1441933 ) ) ( not ( = ?auto_1441930 ?auto_1441935 ) ) ( not ( = ?auto_1441930 ?auto_1441936 ) ) ( not ( = ?auto_1441930 ?auto_1441937 ) ) ( not ( = ?auto_1441930 ?auto_1441938 ) ) ( not ( = ?auto_1441931 ?auto_1441928 ) ) ( not ( = ?auto_1441931 ?auto_1441932 ) ) ( not ( = ?auto_1441931 ?auto_1441934 ) ) ( not ( = ?auto_1441931 ?auto_1441933 ) ) ( not ( = ?auto_1441931 ?auto_1441935 ) ) ( not ( = ?auto_1441931 ?auto_1441936 ) ) ( not ( = ?auto_1441931 ?auto_1441937 ) ) ( not ( = ?auto_1441931 ?auto_1441938 ) ) ( not ( = ?auto_1441928 ?auto_1441932 ) ) ( not ( = ?auto_1441928 ?auto_1441934 ) ) ( not ( = ?auto_1441928 ?auto_1441933 ) ) ( not ( = ?auto_1441928 ?auto_1441935 ) ) ( not ( = ?auto_1441928 ?auto_1441936 ) ) ( not ( = ?auto_1441928 ?auto_1441937 ) ) ( not ( = ?auto_1441928 ?auto_1441938 ) ) ( not ( = ?auto_1441932 ?auto_1441934 ) ) ( not ( = ?auto_1441932 ?auto_1441933 ) ) ( not ( = ?auto_1441932 ?auto_1441935 ) ) ( not ( = ?auto_1441932 ?auto_1441936 ) ) ( not ( = ?auto_1441932 ?auto_1441937 ) ) ( not ( = ?auto_1441932 ?auto_1441938 ) ) ( not ( = ?auto_1441934 ?auto_1441933 ) ) ( not ( = ?auto_1441934 ?auto_1441935 ) ) ( not ( = ?auto_1441934 ?auto_1441936 ) ) ( not ( = ?auto_1441934 ?auto_1441937 ) ) ( not ( = ?auto_1441934 ?auto_1441938 ) ) ( not ( = ?auto_1441933 ?auto_1441935 ) ) ( not ( = ?auto_1441933 ?auto_1441936 ) ) ( not ( = ?auto_1441933 ?auto_1441937 ) ) ( not ( = ?auto_1441933 ?auto_1441938 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1441935 ?auto_1441936 ?auto_1441937 )
      ( MAKE-9CRATE-VERIFY ?auto_1441929 ?auto_1441930 ?auto_1441931 ?auto_1441928 ?auto_1441932 ?auto_1441934 ?auto_1441933 ?auto_1441935 ?auto_1441936 ?auto_1441937 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1442038 - SURFACE
      ?auto_1442039 - SURFACE
      ?auto_1442040 - SURFACE
      ?auto_1442037 - SURFACE
      ?auto_1442041 - SURFACE
      ?auto_1442043 - SURFACE
      ?auto_1442042 - SURFACE
      ?auto_1442044 - SURFACE
      ?auto_1442045 - SURFACE
      ?auto_1442046 - SURFACE
    )
    :vars
    (
      ?auto_1442051 - HOIST
      ?auto_1442048 - PLACE
      ?auto_1442052 - PLACE
      ?auto_1442050 - HOIST
      ?auto_1442047 - SURFACE
      ?auto_1442049 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1442051 ?auto_1442048 ) ( IS-CRATE ?auto_1442046 ) ( not ( = ?auto_1442045 ?auto_1442046 ) ) ( not ( = ?auto_1442044 ?auto_1442045 ) ) ( not ( = ?auto_1442044 ?auto_1442046 ) ) ( not ( = ?auto_1442052 ?auto_1442048 ) ) ( HOIST-AT ?auto_1442050 ?auto_1442052 ) ( not ( = ?auto_1442051 ?auto_1442050 ) ) ( AVAILABLE ?auto_1442050 ) ( SURFACE-AT ?auto_1442046 ?auto_1442052 ) ( ON ?auto_1442046 ?auto_1442047 ) ( CLEAR ?auto_1442046 ) ( not ( = ?auto_1442045 ?auto_1442047 ) ) ( not ( = ?auto_1442046 ?auto_1442047 ) ) ( not ( = ?auto_1442044 ?auto_1442047 ) ) ( TRUCK-AT ?auto_1442049 ?auto_1442048 ) ( SURFACE-AT ?auto_1442044 ?auto_1442048 ) ( CLEAR ?auto_1442044 ) ( IS-CRATE ?auto_1442045 ) ( AVAILABLE ?auto_1442051 ) ( IN ?auto_1442045 ?auto_1442049 ) ( ON ?auto_1442039 ?auto_1442038 ) ( ON ?auto_1442040 ?auto_1442039 ) ( ON ?auto_1442037 ?auto_1442040 ) ( ON ?auto_1442041 ?auto_1442037 ) ( ON ?auto_1442043 ?auto_1442041 ) ( ON ?auto_1442042 ?auto_1442043 ) ( ON ?auto_1442044 ?auto_1442042 ) ( not ( = ?auto_1442038 ?auto_1442039 ) ) ( not ( = ?auto_1442038 ?auto_1442040 ) ) ( not ( = ?auto_1442038 ?auto_1442037 ) ) ( not ( = ?auto_1442038 ?auto_1442041 ) ) ( not ( = ?auto_1442038 ?auto_1442043 ) ) ( not ( = ?auto_1442038 ?auto_1442042 ) ) ( not ( = ?auto_1442038 ?auto_1442044 ) ) ( not ( = ?auto_1442038 ?auto_1442045 ) ) ( not ( = ?auto_1442038 ?auto_1442046 ) ) ( not ( = ?auto_1442038 ?auto_1442047 ) ) ( not ( = ?auto_1442039 ?auto_1442040 ) ) ( not ( = ?auto_1442039 ?auto_1442037 ) ) ( not ( = ?auto_1442039 ?auto_1442041 ) ) ( not ( = ?auto_1442039 ?auto_1442043 ) ) ( not ( = ?auto_1442039 ?auto_1442042 ) ) ( not ( = ?auto_1442039 ?auto_1442044 ) ) ( not ( = ?auto_1442039 ?auto_1442045 ) ) ( not ( = ?auto_1442039 ?auto_1442046 ) ) ( not ( = ?auto_1442039 ?auto_1442047 ) ) ( not ( = ?auto_1442040 ?auto_1442037 ) ) ( not ( = ?auto_1442040 ?auto_1442041 ) ) ( not ( = ?auto_1442040 ?auto_1442043 ) ) ( not ( = ?auto_1442040 ?auto_1442042 ) ) ( not ( = ?auto_1442040 ?auto_1442044 ) ) ( not ( = ?auto_1442040 ?auto_1442045 ) ) ( not ( = ?auto_1442040 ?auto_1442046 ) ) ( not ( = ?auto_1442040 ?auto_1442047 ) ) ( not ( = ?auto_1442037 ?auto_1442041 ) ) ( not ( = ?auto_1442037 ?auto_1442043 ) ) ( not ( = ?auto_1442037 ?auto_1442042 ) ) ( not ( = ?auto_1442037 ?auto_1442044 ) ) ( not ( = ?auto_1442037 ?auto_1442045 ) ) ( not ( = ?auto_1442037 ?auto_1442046 ) ) ( not ( = ?auto_1442037 ?auto_1442047 ) ) ( not ( = ?auto_1442041 ?auto_1442043 ) ) ( not ( = ?auto_1442041 ?auto_1442042 ) ) ( not ( = ?auto_1442041 ?auto_1442044 ) ) ( not ( = ?auto_1442041 ?auto_1442045 ) ) ( not ( = ?auto_1442041 ?auto_1442046 ) ) ( not ( = ?auto_1442041 ?auto_1442047 ) ) ( not ( = ?auto_1442043 ?auto_1442042 ) ) ( not ( = ?auto_1442043 ?auto_1442044 ) ) ( not ( = ?auto_1442043 ?auto_1442045 ) ) ( not ( = ?auto_1442043 ?auto_1442046 ) ) ( not ( = ?auto_1442043 ?auto_1442047 ) ) ( not ( = ?auto_1442042 ?auto_1442044 ) ) ( not ( = ?auto_1442042 ?auto_1442045 ) ) ( not ( = ?auto_1442042 ?auto_1442046 ) ) ( not ( = ?auto_1442042 ?auto_1442047 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1442044 ?auto_1442045 ?auto_1442046 )
      ( MAKE-9CRATE-VERIFY ?auto_1442038 ?auto_1442039 ?auto_1442040 ?auto_1442037 ?auto_1442041 ?auto_1442043 ?auto_1442042 ?auto_1442044 ?auto_1442045 ?auto_1442046 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1447559 - SURFACE
      ?auto_1447560 - SURFACE
      ?auto_1447561 - SURFACE
      ?auto_1447558 - SURFACE
      ?auto_1447562 - SURFACE
      ?auto_1447564 - SURFACE
      ?auto_1447563 - SURFACE
      ?auto_1447565 - SURFACE
      ?auto_1447566 - SURFACE
      ?auto_1447567 - SURFACE
      ?auto_1447568 - SURFACE
    )
    :vars
    (
      ?auto_1447570 - HOIST
      ?auto_1447569 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1447570 ?auto_1447569 ) ( SURFACE-AT ?auto_1447567 ?auto_1447569 ) ( CLEAR ?auto_1447567 ) ( LIFTING ?auto_1447570 ?auto_1447568 ) ( IS-CRATE ?auto_1447568 ) ( not ( = ?auto_1447567 ?auto_1447568 ) ) ( ON ?auto_1447560 ?auto_1447559 ) ( ON ?auto_1447561 ?auto_1447560 ) ( ON ?auto_1447558 ?auto_1447561 ) ( ON ?auto_1447562 ?auto_1447558 ) ( ON ?auto_1447564 ?auto_1447562 ) ( ON ?auto_1447563 ?auto_1447564 ) ( ON ?auto_1447565 ?auto_1447563 ) ( ON ?auto_1447566 ?auto_1447565 ) ( ON ?auto_1447567 ?auto_1447566 ) ( not ( = ?auto_1447559 ?auto_1447560 ) ) ( not ( = ?auto_1447559 ?auto_1447561 ) ) ( not ( = ?auto_1447559 ?auto_1447558 ) ) ( not ( = ?auto_1447559 ?auto_1447562 ) ) ( not ( = ?auto_1447559 ?auto_1447564 ) ) ( not ( = ?auto_1447559 ?auto_1447563 ) ) ( not ( = ?auto_1447559 ?auto_1447565 ) ) ( not ( = ?auto_1447559 ?auto_1447566 ) ) ( not ( = ?auto_1447559 ?auto_1447567 ) ) ( not ( = ?auto_1447559 ?auto_1447568 ) ) ( not ( = ?auto_1447560 ?auto_1447561 ) ) ( not ( = ?auto_1447560 ?auto_1447558 ) ) ( not ( = ?auto_1447560 ?auto_1447562 ) ) ( not ( = ?auto_1447560 ?auto_1447564 ) ) ( not ( = ?auto_1447560 ?auto_1447563 ) ) ( not ( = ?auto_1447560 ?auto_1447565 ) ) ( not ( = ?auto_1447560 ?auto_1447566 ) ) ( not ( = ?auto_1447560 ?auto_1447567 ) ) ( not ( = ?auto_1447560 ?auto_1447568 ) ) ( not ( = ?auto_1447561 ?auto_1447558 ) ) ( not ( = ?auto_1447561 ?auto_1447562 ) ) ( not ( = ?auto_1447561 ?auto_1447564 ) ) ( not ( = ?auto_1447561 ?auto_1447563 ) ) ( not ( = ?auto_1447561 ?auto_1447565 ) ) ( not ( = ?auto_1447561 ?auto_1447566 ) ) ( not ( = ?auto_1447561 ?auto_1447567 ) ) ( not ( = ?auto_1447561 ?auto_1447568 ) ) ( not ( = ?auto_1447558 ?auto_1447562 ) ) ( not ( = ?auto_1447558 ?auto_1447564 ) ) ( not ( = ?auto_1447558 ?auto_1447563 ) ) ( not ( = ?auto_1447558 ?auto_1447565 ) ) ( not ( = ?auto_1447558 ?auto_1447566 ) ) ( not ( = ?auto_1447558 ?auto_1447567 ) ) ( not ( = ?auto_1447558 ?auto_1447568 ) ) ( not ( = ?auto_1447562 ?auto_1447564 ) ) ( not ( = ?auto_1447562 ?auto_1447563 ) ) ( not ( = ?auto_1447562 ?auto_1447565 ) ) ( not ( = ?auto_1447562 ?auto_1447566 ) ) ( not ( = ?auto_1447562 ?auto_1447567 ) ) ( not ( = ?auto_1447562 ?auto_1447568 ) ) ( not ( = ?auto_1447564 ?auto_1447563 ) ) ( not ( = ?auto_1447564 ?auto_1447565 ) ) ( not ( = ?auto_1447564 ?auto_1447566 ) ) ( not ( = ?auto_1447564 ?auto_1447567 ) ) ( not ( = ?auto_1447564 ?auto_1447568 ) ) ( not ( = ?auto_1447563 ?auto_1447565 ) ) ( not ( = ?auto_1447563 ?auto_1447566 ) ) ( not ( = ?auto_1447563 ?auto_1447567 ) ) ( not ( = ?auto_1447563 ?auto_1447568 ) ) ( not ( = ?auto_1447565 ?auto_1447566 ) ) ( not ( = ?auto_1447565 ?auto_1447567 ) ) ( not ( = ?auto_1447565 ?auto_1447568 ) ) ( not ( = ?auto_1447566 ?auto_1447567 ) ) ( not ( = ?auto_1447566 ?auto_1447568 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1447567 ?auto_1447568 )
      ( MAKE-10CRATE-VERIFY ?auto_1447559 ?auto_1447560 ?auto_1447561 ?auto_1447558 ?auto_1447562 ?auto_1447564 ?auto_1447563 ?auto_1447565 ?auto_1447566 ?auto_1447567 ?auto_1447568 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1447653 - SURFACE
      ?auto_1447654 - SURFACE
      ?auto_1447655 - SURFACE
      ?auto_1447652 - SURFACE
      ?auto_1447656 - SURFACE
      ?auto_1447658 - SURFACE
      ?auto_1447657 - SURFACE
      ?auto_1447659 - SURFACE
      ?auto_1447660 - SURFACE
      ?auto_1447661 - SURFACE
      ?auto_1447662 - SURFACE
    )
    :vars
    (
      ?auto_1447663 - HOIST
      ?auto_1447665 - PLACE
      ?auto_1447664 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1447663 ?auto_1447665 ) ( SURFACE-AT ?auto_1447661 ?auto_1447665 ) ( CLEAR ?auto_1447661 ) ( IS-CRATE ?auto_1447662 ) ( not ( = ?auto_1447661 ?auto_1447662 ) ) ( TRUCK-AT ?auto_1447664 ?auto_1447665 ) ( AVAILABLE ?auto_1447663 ) ( IN ?auto_1447662 ?auto_1447664 ) ( ON ?auto_1447661 ?auto_1447660 ) ( not ( = ?auto_1447660 ?auto_1447661 ) ) ( not ( = ?auto_1447660 ?auto_1447662 ) ) ( ON ?auto_1447654 ?auto_1447653 ) ( ON ?auto_1447655 ?auto_1447654 ) ( ON ?auto_1447652 ?auto_1447655 ) ( ON ?auto_1447656 ?auto_1447652 ) ( ON ?auto_1447658 ?auto_1447656 ) ( ON ?auto_1447657 ?auto_1447658 ) ( ON ?auto_1447659 ?auto_1447657 ) ( ON ?auto_1447660 ?auto_1447659 ) ( not ( = ?auto_1447653 ?auto_1447654 ) ) ( not ( = ?auto_1447653 ?auto_1447655 ) ) ( not ( = ?auto_1447653 ?auto_1447652 ) ) ( not ( = ?auto_1447653 ?auto_1447656 ) ) ( not ( = ?auto_1447653 ?auto_1447658 ) ) ( not ( = ?auto_1447653 ?auto_1447657 ) ) ( not ( = ?auto_1447653 ?auto_1447659 ) ) ( not ( = ?auto_1447653 ?auto_1447660 ) ) ( not ( = ?auto_1447653 ?auto_1447661 ) ) ( not ( = ?auto_1447653 ?auto_1447662 ) ) ( not ( = ?auto_1447654 ?auto_1447655 ) ) ( not ( = ?auto_1447654 ?auto_1447652 ) ) ( not ( = ?auto_1447654 ?auto_1447656 ) ) ( not ( = ?auto_1447654 ?auto_1447658 ) ) ( not ( = ?auto_1447654 ?auto_1447657 ) ) ( not ( = ?auto_1447654 ?auto_1447659 ) ) ( not ( = ?auto_1447654 ?auto_1447660 ) ) ( not ( = ?auto_1447654 ?auto_1447661 ) ) ( not ( = ?auto_1447654 ?auto_1447662 ) ) ( not ( = ?auto_1447655 ?auto_1447652 ) ) ( not ( = ?auto_1447655 ?auto_1447656 ) ) ( not ( = ?auto_1447655 ?auto_1447658 ) ) ( not ( = ?auto_1447655 ?auto_1447657 ) ) ( not ( = ?auto_1447655 ?auto_1447659 ) ) ( not ( = ?auto_1447655 ?auto_1447660 ) ) ( not ( = ?auto_1447655 ?auto_1447661 ) ) ( not ( = ?auto_1447655 ?auto_1447662 ) ) ( not ( = ?auto_1447652 ?auto_1447656 ) ) ( not ( = ?auto_1447652 ?auto_1447658 ) ) ( not ( = ?auto_1447652 ?auto_1447657 ) ) ( not ( = ?auto_1447652 ?auto_1447659 ) ) ( not ( = ?auto_1447652 ?auto_1447660 ) ) ( not ( = ?auto_1447652 ?auto_1447661 ) ) ( not ( = ?auto_1447652 ?auto_1447662 ) ) ( not ( = ?auto_1447656 ?auto_1447658 ) ) ( not ( = ?auto_1447656 ?auto_1447657 ) ) ( not ( = ?auto_1447656 ?auto_1447659 ) ) ( not ( = ?auto_1447656 ?auto_1447660 ) ) ( not ( = ?auto_1447656 ?auto_1447661 ) ) ( not ( = ?auto_1447656 ?auto_1447662 ) ) ( not ( = ?auto_1447658 ?auto_1447657 ) ) ( not ( = ?auto_1447658 ?auto_1447659 ) ) ( not ( = ?auto_1447658 ?auto_1447660 ) ) ( not ( = ?auto_1447658 ?auto_1447661 ) ) ( not ( = ?auto_1447658 ?auto_1447662 ) ) ( not ( = ?auto_1447657 ?auto_1447659 ) ) ( not ( = ?auto_1447657 ?auto_1447660 ) ) ( not ( = ?auto_1447657 ?auto_1447661 ) ) ( not ( = ?auto_1447657 ?auto_1447662 ) ) ( not ( = ?auto_1447659 ?auto_1447660 ) ) ( not ( = ?auto_1447659 ?auto_1447661 ) ) ( not ( = ?auto_1447659 ?auto_1447662 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1447660 ?auto_1447661 ?auto_1447662 )
      ( MAKE-10CRATE-VERIFY ?auto_1447653 ?auto_1447654 ?auto_1447655 ?auto_1447652 ?auto_1447656 ?auto_1447658 ?auto_1447657 ?auto_1447659 ?auto_1447660 ?auto_1447661 ?auto_1447662 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1447758 - SURFACE
      ?auto_1447759 - SURFACE
      ?auto_1447760 - SURFACE
      ?auto_1447757 - SURFACE
      ?auto_1447761 - SURFACE
      ?auto_1447763 - SURFACE
      ?auto_1447762 - SURFACE
      ?auto_1447764 - SURFACE
      ?auto_1447765 - SURFACE
      ?auto_1447766 - SURFACE
      ?auto_1447767 - SURFACE
    )
    :vars
    (
      ?auto_1447768 - HOIST
      ?auto_1447769 - PLACE
      ?auto_1447771 - TRUCK
      ?auto_1447770 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1447768 ?auto_1447769 ) ( SURFACE-AT ?auto_1447766 ?auto_1447769 ) ( CLEAR ?auto_1447766 ) ( IS-CRATE ?auto_1447767 ) ( not ( = ?auto_1447766 ?auto_1447767 ) ) ( AVAILABLE ?auto_1447768 ) ( IN ?auto_1447767 ?auto_1447771 ) ( ON ?auto_1447766 ?auto_1447765 ) ( not ( = ?auto_1447765 ?auto_1447766 ) ) ( not ( = ?auto_1447765 ?auto_1447767 ) ) ( TRUCK-AT ?auto_1447771 ?auto_1447770 ) ( not ( = ?auto_1447770 ?auto_1447769 ) ) ( ON ?auto_1447759 ?auto_1447758 ) ( ON ?auto_1447760 ?auto_1447759 ) ( ON ?auto_1447757 ?auto_1447760 ) ( ON ?auto_1447761 ?auto_1447757 ) ( ON ?auto_1447763 ?auto_1447761 ) ( ON ?auto_1447762 ?auto_1447763 ) ( ON ?auto_1447764 ?auto_1447762 ) ( ON ?auto_1447765 ?auto_1447764 ) ( not ( = ?auto_1447758 ?auto_1447759 ) ) ( not ( = ?auto_1447758 ?auto_1447760 ) ) ( not ( = ?auto_1447758 ?auto_1447757 ) ) ( not ( = ?auto_1447758 ?auto_1447761 ) ) ( not ( = ?auto_1447758 ?auto_1447763 ) ) ( not ( = ?auto_1447758 ?auto_1447762 ) ) ( not ( = ?auto_1447758 ?auto_1447764 ) ) ( not ( = ?auto_1447758 ?auto_1447765 ) ) ( not ( = ?auto_1447758 ?auto_1447766 ) ) ( not ( = ?auto_1447758 ?auto_1447767 ) ) ( not ( = ?auto_1447759 ?auto_1447760 ) ) ( not ( = ?auto_1447759 ?auto_1447757 ) ) ( not ( = ?auto_1447759 ?auto_1447761 ) ) ( not ( = ?auto_1447759 ?auto_1447763 ) ) ( not ( = ?auto_1447759 ?auto_1447762 ) ) ( not ( = ?auto_1447759 ?auto_1447764 ) ) ( not ( = ?auto_1447759 ?auto_1447765 ) ) ( not ( = ?auto_1447759 ?auto_1447766 ) ) ( not ( = ?auto_1447759 ?auto_1447767 ) ) ( not ( = ?auto_1447760 ?auto_1447757 ) ) ( not ( = ?auto_1447760 ?auto_1447761 ) ) ( not ( = ?auto_1447760 ?auto_1447763 ) ) ( not ( = ?auto_1447760 ?auto_1447762 ) ) ( not ( = ?auto_1447760 ?auto_1447764 ) ) ( not ( = ?auto_1447760 ?auto_1447765 ) ) ( not ( = ?auto_1447760 ?auto_1447766 ) ) ( not ( = ?auto_1447760 ?auto_1447767 ) ) ( not ( = ?auto_1447757 ?auto_1447761 ) ) ( not ( = ?auto_1447757 ?auto_1447763 ) ) ( not ( = ?auto_1447757 ?auto_1447762 ) ) ( not ( = ?auto_1447757 ?auto_1447764 ) ) ( not ( = ?auto_1447757 ?auto_1447765 ) ) ( not ( = ?auto_1447757 ?auto_1447766 ) ) ( not ( = ?auto_1447757 ?auto_1447767 ) ) ( not ( = ?auto_1447761 ?auto_1447763 ) ) ( not ( = ?auto_1447761 ?auto_1447762 ) ) ( not ( = ?auto_1447761 ?auto_1447764 ) ) ( not ( = ?auto_1447761 ?auto_1447765 ) ) ( not ( = ?auto_1447761 ?auto_1447766 ) ) ( not ( = ?auto_1447761 ?auto_1447767 ) ) ( not ( = ?auto_1447763 ?auto_1447762 ) ) ( not ( = ?auto_1447763 ?auto_1447764 ) ) ( not ( = ?auto_1447763 ?auto_1447765 ) ) ( not ( = ?auto_1447763 ?auto_1447766 ) ) ( not ( = ?auto_1447763 ?auto_1447767 ) ) ( not ( = ?auto_1447762 ?auto_1447764 ) ) ( not ( = ?auto_1447762 ?auto_1447765 ) ) ( not ( = ?auto_1447762 ?auto_1447766 ) ) ( not ( = ?auto_1447762 ?auto_1447767 ) ) ( not ( = ?auto_1447764 ?auto_1447765 ) ) ( not ( = ?auto_1447764 ?auto_1447766 ) ) ( not ( = ?auto_1447764 ?auto_1447767 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1447765 ?auto_1447766 ?auto_1447767 )
      ( MAKE-10CRATE-VERIFY ?auto_1447758 ?auto_1447759 ?auto_1447760 ?auto_1447757 ?auto_1447761 ?auto_1447763 ?auto_1447762 ?auto_1447764 ?auto_1447765 ?auto_1447766 ?auto_1447767 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1447873 - SURFACE
      ?auto_1447874 - SURFACE
      ?auto_1447875 - SURFACE
      ?auto_1447872 - SURFACE
      ?auto_1447876 - SURFACE
      ?auto_1447878 - SURFACE
      ?auto_1447877 - SURFACE
      ?auto_1447879 - SURFACE
      ?auto_1447880 - SURFACE
      ?auto_1447881 - SURFACE
      ?auto_1447882 - SURFACE
    )
    :vars
    (
      ?auto_1447887 - HOIST
      ?auto_1447885 - PLACE
      ?auto_1447886 - TRUCK
      ?auto_1447883 - PLACE
      ?auto_1447884 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1447887 ?auto_1447885 ) ( SURFACE-AT ?auto_1447881 ?auto_1447885 ) ( CLEAR ?auto_1447881 ) ( IS-CRATE ?auto_1447882 ) ( not ( = ?auto_1447881 ?auto_1447882 ) ) ( AVAILABLE ?auto_1447887 ) ( ON ?auto_1447881 ?auto_1447880 ) ( not ( = ?auto_1447880 ?auto_1447881 ) ) ( not ( = ?auto_1447880 ?auto_1447882 ) ) ( TRUCK-AT ?auto_1447886 ?auto_1447883 ) ( not ( = ?auto_1447883 ?auto_1447885 ) ) ( HOIST-AT ?auto_1447884 ?auto_1447883 ) ( LIFTING ?auto_1447884 ?auto_1447882 ) ( not ( = ?auto_1447887 ?auto_1447884 ) ) ( ON ?auto_1447874 ?auto_1447873 ) ( ON ?auto_1447875 ?auto_1447874 ) ( ON ?auto_1447872 ?auto_1447875 ) ( ON ?auto_1447876 ?auto_1447872 ) ( ON ?auto_1447878 ?auto_1447876 ) ( ON ?auto_1447877 ?auto_1447878 ) ( ON ?auto_1447879 ?auto_1447877 ) ( ON ?auto_1447880 ?auto_1447879 ) ( not ( = ?auto_1447873 ?auto_1447874 ) ) ( not ( = ?auto_1447873 ?auto_1447875 ) ) ( not ( = ?auto_1447873 ?auto_1447872 ) ) ( not ( = ?auto_1447873 ?auto_1447876 ) ) ( not ( = ?auto_1447873 ?auto_1447878 ) ) ( not ( = ?auto_1447873 ?auto_1447877 ) ) ( not ( = ?auto_1447873 ?auto_1447879 ) ) ( not ( = ?auto_1447873 ?auto_1447880 ) ) ( not ( = ?auto_1447873 ?auto_1447881 ) ) ( not ( = ?auto_1447873 ?auto_1447882 ) ) ( not ( = ?auto_1447874 ?auto_1447875 ) ) ( not ( = ?auto_1447874 ?auto_1447872 ) ) ( not ( = ?auto_1447874 ?auto_1447876 ) ) ( not ( = ?auto_1447874 ?auto_1447878 ) ) ( not ( = ?auto_1447874 ?auto_1447877 ) ) ( not ( = ?auto_1447874 ?auto_1447879 ) ) ( not ( = ?auto_1447874 ?auto_1447880 ) ) ( not ( = ?auto_1447874 ?auto_1447881 ) ) ( not ( = ?auto_1447874 ?auto_1447882 ) ) ( not ( = ?auto_1447875 ?auto_1447872 ) ) ( not ( = ?auto_1447875 ?auto_1447876 ) ) ( not ( = ?auto_1447875 ?auto_1447878 ) ) ( not ( = ?auto_1447875 ?auto_1447877 ) ) ( not ( = ?auto_1447875 ?auto_1447879 ) ) ( not ( = ?auto_1447875 ?auto_1447880 ) ) ( not ( = ?auto_1447875 ?auto_1447881 ) ) ( not ( = ?auto_1447875 ?auto_1447882 ) ) ( not ( = ?auto_1447872 ?auto_1447876 ) ) ( not ( = ?auto_1447872 ?auto_1447878 ) ) ( not ( = ?auto_1447872 ?auto_1447877 ) ) ( not ( = ?auto_1447872 ?auto_1447879 ) ) ( not ( = ?auto_1447872 ?auto_1447880 ) ) ( not ( = ?auto_1447872 ?auto_1447881 ) ) ( not ( = ?auto_1447872 ?auto_1447882 ) ) ( not ( = ?auto_1447876 ?auto_1447878 ) ) ( not ( = ?auto_1447876 ?auto_1447877 ) ) ( not ( = ?auto_1447876 ?auto_1447879 ) ) ( not ( = ?auto_1447876 ?auto_1447880 ) ) ( not ( = ?auto_1447876 ?auto_1447881 ) ) ( not ( = ?auto_1447876 ?auto_1447882 ) ) ( not ( = ?auto_1447878 ?auto_1447877 ) ) ( not ( = ?auto_1447878 ?auto_1447879 ) ) ( not ( = ?auto_1447878 ?auto_1447880 ) ) ( not ( = ?auto_1447878 ?auto_1447881 ) ) ( not ( = ?auto_1447878 ?auto_1447882 ) ) ( not ( = ?auto_1447877 ?auto_1447879 ) ) ( not ( = ?auto_1447877 ?auto_1447880 ) ) ( not ( = ?auto_1447877 ?auto_1447881 ) ) ( not ( = ?auto_1447877 ?auto_1447882 ) ) ( not ( = ?auto_1447879 ?auto_1447880 ) ) ( not ( = ?auto_1447879 ?auto_1447881 ) ) ( not ( = ?auto_1447879 ?auto_1447882 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1447880 ?auto_1447881 ?auto_1447882 )
      ( MAKE-10CRATE-VERIFY ?auto_1447873 ?auto_1447874 ?auto_1447875 ?auto_1447872 ?auto_1447876 ?auto_1447878 ?auto_1447877 ?auto_1447879 ?auto_1447880 ?auto_1447881 ?auto_1447882 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1447998 - SURFACE
      ?auto_1447999 - SURFACE
      ?auto_1448000 - SURFACE
      ?auto_1447997 - SURFACE
      ?auto_1448001 - SURFACE
      ?auto_1448003 - SURFACE
      ?auto_1448002 - SURFACE
      ?auto_1448004 - SURFACE
      ?auto_1448005 - SURFACE
      ?auto_1448006 - SURFACE
      ?auto_1448007 - SURFACE
    )
    :vars
    (
      ?auto_1448008 - HOIST
      ?auto_1448012 - PLACE
      ?auto_1448013 - TRUCK
      ?auto_1448009 - PLACE
      ?auto_1448010 - HOIST
      ?auto_1448011 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1448008 ?auto_1448012 ) ( SURFACE-AT ?auto_1448006 ?auto_1448012 ) ( CLEAR ?auto_1448006 ) ( IS-CRATE ?auto_1448007 ) ( not ( = ?auto_1448006 ?auto_1448007 ) ) ( AVAILABLE ?auto_1448008 ) ( ON ?auto_1448006 ?auto_1448005 ) ( not ( = ?auto_1448005 ?auto_1448006 ) ) ( not ( = ?auto_1448005 ?auto_1448007 ) ) ( TRUCK-AT ?auto_1448013 ?auto_1448009 ) ( not ( = ?auto_1448009 ?auto_1448012 ) ) ( HOIST-AT ?auto_1448010 ?auto_1448009 ) ( not ( = ?auto_1448008 ?auto_1448010 ) ) ( AVAILABLE ?auto_1448010 ) ( SURFACE-AT ?auto_1448007 ?auto_1448009 ) ( ON ?auto_1448007 ?auto_1448011 ) ( CLEAR ?auto_1448007 ) ( not ( = ?auto_1448006 ?auto_1448011 ) ) ( not ( = ?auto_1448007 ?auto_1448011 ) ) ( not ( = ?auto_1448005 ?auto_1448011 ) ) ( ON ?auto_1447999 ?auto_1447998 ) ( ON ?auto_1448000 ?auto_1447999 ) ( ON ?auto_1447997 ?auto_1448000 ) ( ON ?auto_1448001 ?auto_1447997 ) ( ON ?auto_1448003 ?auto_1448001 ) ( ON ?auto_1448002 ?auto_1448003 ) ( ON ?auto_1448004 ?auto_1448002 ) ( ON ?auto_1448005 ?auto_1448004 ) ( not ( = ?auto_1447998 ?auto_1447999 ) ) ( not ( = ?auto_1447998 ?auto_1448000 ) ) ( not ( = ?auto_1447998 ?auto_1447997 ) ) ( not ( = ?auto_1447998 ?auto_1448001 ) ) ( not ( = ?auto_1447998 ?auto_1448003 ) ) ( not ( = ?auto_1447998 ?auto_1448002 ) ) ( not ( = ?auto_1447998 ?auto_1448004 ) ) ( not ( = ?auto_1447998 ?auto_1448005 ) ) ( not ( = ?auto_1447998 ?auto_1448006 ) ) ( not ( = ?auto_1447998 ?auto_1448007 ) ) ( not ( = ?auto_1447998 ?auto_1448011 ) ) ( not ( = ?auto_1447999 ?auto_1448000 ) ) ( not ( = ?auto_1447999 ?auto_1447997 ) ) ( not ( = ?auto_1447999 ?auto_1448001 ) ) ( not ( = ?auto_1447999 ?auto_1448003 ) ) ( not ( = ?auto_1447999 ?auto_1448002 ) ) ( not ( = ?auto_1447999 ?auto_1448004 ) ) ( not ( = ?auto_1447999 ?auto_1448005 ) ) ( not ( = ?auto_1447999 ?auto_1448006 ) ) ( not ( = ?auto_1447999 ?auto_1448007 ) ) ( not ( = ?auto_1447999 ?auto_1448011 ) ) ( not ( = ?auto_1448000 ?auto_1447997 ) ) ( not ( = ?auto_1448000 ?auto_1448001 ) ) ( not ( = ?auto_1448000 ?auto_1448003 ) ) ( not ( = ?auto_1448000 ?auto_1448002 ) ) ( not ( = ?auto_1448000 ?auto_1448004 ) ) ( not ( = ?auto_1448000 ?auto_1448005 ) ) ( not ( = ?auto_1448000 ?auto_1448006 ) ) ( not ( = ?auto_1448000 ?auto_1448007 ) ) ( not ( = ?auto_1448000 ?auto_1448011 ) ) ( not ( = ?auto_1447997 ?auto_1448001 ) ) ( not ( = ?auto_1447997 ?auto_1448003 ) ) ( not ( = ?auto_1447997 ?auto_1448002 ) ) ( not ( = ?auto_1447997 ?auto_1448004 ) ) ( not ( = ?auto_1447997 ?auto_1448005 ) ) ( not ( = ?auto_1447997 ?auto_1448006 ) ) ( not ( = ?auto_1447997 ?auto_1448007 ) ) ( not ( = ?auto_1447997 ?auto_1448011 ) ) ( not ( = ?auto_1448001 ?auto_1448003 ) ) ( not ( = ?auto_1448001 ?auto_1448002 ) ) ( not ( = ?auto_1448001 ?auto_1448004 ) ) ( not ( = ?auto_1448001 ?auto_1448005 ) ) ( not ( = ?auto_1448001 ?auto_1448006 ) ) ( not ( = ?auto_1448001 ?auto_1448007 ) ) ( not ( = ?auto_1448001 ?auto_1448011 ) ) ( not ( = ?auto_1448003 ?auto_1448002 ) ) ( not ( = ?auto_1448003 ?auto_1448004 ) ) ( not ( = ?auto_1448003 ?auto_1448005 ) ) ( not ( = ?auto_1448003 ?auto_1448006 ) ) ( not ( = ?auto_1448003 ?auto_1448007 ) ) ( not ( = ?auto_1448003 ?auto_1448011 ) ) ( not ( = ?auto_1448002 ?auto_1448004 ) ) ( not ( = ?auto_1448002 ?auto_1448005 ) ) ( not ( = ?auto_1448002 ?auto_1448006 ) ) ( not ( = ?auto_1448002 ?auto_1448007 ) ) ( not ( = ?auto_1448002 ?auto_1448011 ) ) ( not ( = ?auto_1448004 ?auto_1448005 ) ) ( not ( = ?auto_1448004 ?auto_1448006 ) ) ( not ( = ?auto_1448004 ?auto_1448007 ) ) ( not ( = ?auto_1448004 ?auto_1448011 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1448005 ?auto_1448006 ?auto_1448007 )
      ( MAKE-10CRATE-VERIFY ?auto_1447998 ?auto_1447999 ?auto_1448000 ?auto_1447997 ?auto_1448001 ?auto_1448003 ?auto_1448002 ?auto_1448004 ?auto_1448005 ?auto_1448006 ?auto_1448007 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1448124 - SURFACE
      ?auto_1448125 - SURFACE
      ?auto_1448126 - SURFACE
      ?auto_1448123 - SURFACE
      ?auto_1448127 - SURFACE
      ?auto_1448129 - SURFACE
      ?auto_1448128 - SURFACE
      ?auto_1448130 - SURFACE
      ?auto_1448131 - SURFACE
      ?auto_1448132 - SURFACE
      ?auto_1448133 - SURFACE
    )
    :vars
    (
      ?auto_1448134 - HOIST
      ?auto_1448137 - PLACE
      ?auto_1448135 - PLACE
      ?auto_1448136 - HOIST
      ?auto_1448139 - SURFACE
      ?auto_1448138 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1448134 ?auto_1448137 ) ( SURFACE-AT ?auto_1448132 ?auto_1448137 ) ( CLEAR ?auto_1448132 ) ( IS-CRATE ?auto_1448133 ) ( not ( = ?auto_1448132 ?auto_1448133 ) ) ( AVAILABLE ?auto_1448134 ) ( ON ?auto_1448132 ?auto_1448131 ) ( not ( = ?auto_1448131 ?auto_1448132 ) ) ( not ( = ?auto_1448131 ?auto_1448133 ) ) ( not ( = ?auto_1448135 ?auto_1448137 ) ) ( HOIST-AT ?auto_1448136 ?auto_1448135 ) ( not ( = ?auto_1448134 ?auto_1448136 ) ) ( AVAILABLE ?auto_1448136 ) ( SURFACE-AT ?auto_1448133 ?auto_1448135 ) ( ON ?auto_1448133 ?auto_1448139 ) ( CLEAR ?auto_1448133 ) ( not ( = ?auto_1448132 ?auto_1448139 ) ) ( not ( = ?auto_1448133 ?auto_1448139 ) ) ( not ( = ?auto_1448131 ?auto_1448139 ) ) ( TRUCK-AT ?auto_1448138 ?auto_1448137 ) ( ON ?auto_1448125 ?auto_1448124 ) ( ON ?auto_1448126 ?auto_1448125 ) ( ON ?auto_1448123 ?auto_1448126 ) ( ON ?auto_1448127 ?auto_1448123 ) ( ON ?auto_1448129 ?auto_1448127 ) ( ON ?auto_1448128 ?auto_1448129 ) ( ON ?auto_1448130 ?auto_1448128 ) ( ON ?auto_1448131 ?auto_1448130 ) ( not ( = ?auto_1448124 ?auto_1448125 ) ) ( not ( = ?auto_1448124 ?auto_1448126 ) ) ( not ( = ?auto_1448124 ?auto_1448123 ) ) ( not ( = ?auto_1448124 ?auto_1448127 ) ) ( not ( = ?auto_1448124 ?auto_1448129 ) ) ( not ( = ?auto_1448124 ?auto_1448128 ) ) ( not ( = ?auto_1448124 ?auto_1448130 ) ) ( not ( = ?auto_1448124 ?auto_1448131 ) ) ( not ( = ?auto_1448124 ?auto_1448132 ) ) ( not ( = ?auto_1448124 ?auto_1448133 ) ) ( not ( = ?auto_1448124 ?auto_1448139 ) ) ( not ( = ?auto_1448125 ?auto_1448126 ) ) ( not ( = ?auto_1448125 ?auto_1448123 ) ) ( not ( = ?auto_1448125 ?auto_1448127 ) ) ( not ( = ?auto_1448125 ?auto_1448129 ) ) ( not ( = ?auto_1448125 ?auto_1448128 ) ) ( not ( = ?auto_1448125 ?auto_1448130 ) ) ( not ( = ?auto_1448125 ?auto_1448131 ) ) ( not ( = ?auto_1448125 ?auto_1448132 ) ) ( not ( = ?auto_1448125 ?auto_1448133 ) ) ( not ( = ?auto_1448125 ?auto_1448139 ) ) ( not ( = ?auto_1448126 ?auto_1448123 ) ) ( not ( = ?auto_1448126 ?auto_1448127 ) ) ( not ( = ?auto_1448126 ?auto_1448129 ) ) ( not ( = ?auto_1448126 ?auto_1448128 ) ) ( not ( = ?auto_1448126 ?auto_1448130 ) ) ( not ( = ?auto_1448126 ?auto_1448131 ) ) ( not ( = ?auto_1448126 ?auto_1448132 ) ) ( not ( = ?auto_1448126 ?auto_1448133 ) ) ( not ( = ?auto_1448126 ?auto_1448139 ) ) ( not ( = ?auto_1448123 ?auto_1448127 ) ) ( not ( = ?auto_1448123 ?auto_1448129 ) ) ( not ( = ?auto_1448123 ?auto_1448128 ) ) ( not ( = ?auto_1448123 ?auto_1448130 ) ) ( not ( = ?auto_1448123 ?auto_1448131 ) ) ( not ( = ?auto_1448123 ?auto_1448132 ) ) ( not ( = ?auto_1448123 ?auto_1448133 ) ) ( not ( = ?auto_1448123 ?auto_1448139 ) ) ( not ( = ?auto_1448127 ?auto_1448129 ) ) ( not ( = ?auto_1448127 ?auto_1448128 ) ) ( not ( = ?auto_1448127 ?auto_1448130 ) ) ( not ( = ?auto_1448127 ?auto_1448131 ) ) ( not ( = ?auto_1448127 ?auto_1448132 ) ) ( not ( = ?auto_1448127 ?auto_1448133 ) ) ( not ( = ?auto_1448127 ?auto_1448139 ) ) ( not ( = ?auto_1448129 ?auto_1448128 ) ) ( not ( = ?auto_1448129 ?auto_1448130 ) ) ( not ( = ?auto_1448129 ?auto_1448131 ) ) ( not ( = ?auto_1448129 ?auto_1448132 ) ) ( not ( = ?auto_1448129 ?auto_1448133 ) ) ( not ( = ?auto_1448129 ?auto_1448139 ) ) ( not ( = ?auto_1448128 ?auto_1448130 ) ) ( not ( = ?auto_1448128 ?auto_1448131 ) ) ( not ( = ?auto_1448128 ?auto_1448132 ) ) ( not ( = ?auto_1448128 ?auto_1448133 ) ) ( not ( = ?auto_1448128 ?auto_1448139 ) ) ( not ( = ?auto_1448130 ?auto_1448131 ) ) ( not ( = ?auto_1448130 ?auto_1448132 ) ) ( not ( = ?auto_1448130 ?auto_1448133 ) ) ( not ( = ?auto_1448130 ?auto_1448139 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1448131 ?auto_1448132 ?auto_1448133 )
      ( MAKE-10CRATE-VERIFY ?auto_1448124 ?auto_1448125 ?auto_1448126 ?auto_1448123 ?auto_1448127 ?auto_1448129 ?auto_1448128 ?auto_1448130 ?auto_1448131 ?auto_1448132 ?auto_1448133 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1448250 - SURFACE
      ?auto_1448251 - SURFACE
      ?auto_1448252 - SURFACE
      ?auto_1448249 - SURFACE
      ?auto_1448253 - SURFACE
      ?auto_1448255 - SURFACE
      ?auto_1448254 - SURFACE
      ?auto_1448256 - SURFACE
      ?auto_1448257 - SURFACE
      ?auto_1448258 - SURFACE
      ?auto_1448259 - SURFACE
    )
    :vars
    (
      ?auto_1448263 - HOIST
      ?auto_1448260 - PLACE
      ?auto_1448261 - PLACE
      ?auto_1448265 - HOIST
      ?auto_1448262 - SURFACE
      ?auto_1448264 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1448263 ?auto_1448260 ) ( IS-CRATE ?auto_1448259 ) ( not ( = ?auto_1448258 ?auto_1448259 ) ) ( not ( = ?auto_1448257 ?auto_1448258 ) ) ( not ( = ?auto_1448257 ?auto_1448259 ) ) ( not ( = ?auto_1448261 ?auto_1448260 ) ) ( HOIST-AT ?auto_1448265 ?auto_1448261 ) ( not ( = ?auto_1448263 ?auto_1448265 ) ) ( AVAILABLE ?auto_1448265 ) ( SURFACE-AT ?auto_1448259 ?auto_1448261 ) ( ON ?auto_1448259 ?auto_1448262 ) ( CLEAR ?auto_1448259 ) ( not ( = ?auto_1448258 ?auto_1448262 ) ) ( not ( = ?auto_1448259 ?auto_1448262 ) ) ( not ( = ?auto_1448257 ?auto_1448262 ) ) ( TRUCK-AT ?auto_1448264 ?auto_1448260 ) ( SURFACE-AT ?auto_1448257 ?auto_1448260 ) ( CLEAR ?auto_1448257 ) ( LIFTING ?auto_1448263 ?auto_1448258 ) ( IS-CRATE ?auto_1448258 ) ( ON ?auto_1448251 ?auto_1448250 ) ( ON ?auto_1448252 ?auto_1448251 ) ( ON ?auto_1448249 ?auto_1448252 ) ( ON ?auto_1448253 ?auto_1448249 ) ( ON ?auto_1448255 ?auto_1448253 ) ( ON ?auto_1448254 ?auto_1448255 ) ( ON ?auto_1448256 ?auto_1448254 ) ( ON ?auto_1448257 ?auto_1448256 ) ( not ( = ?auto_1448250 ?auto_1448251 ) ) ( not ( = ?auto_1448250 ?auto_1448252 ) ) ( not ( = ?auto_1448250 ?auto_1448249 ) ) ( not ( = ?auto_1448250 ?auto_1448253 ) ) ( not ( = ?auto_1448250 ?auto_1448255 ) ) ( not ( = ?auto_1448250 ?auto_1448254 ) ) ( not ( = ?auto_1448250 ?auto_1448256 ) ) ( not ( = ?auto_1448250 ?auto_1448257 ) ) ( not ( = ?auto_1448250 ?auto_1448258 ) ) ( not ( = ?auto_1448250 ?auto_1448259 ) ) ( not ( = ?auto_1448250 ?auto_1448262 ) ) ( not ( = ?auto_1448251 ?auto_1448252 ) ) ( not ( = ?auto_1448251 ?auto_1448249 ) ) ( not ( = ?auto_1448251 ?auto_1448253 ) ) ( not ( = ?auto_1448251 ?auto_1448255 ) ) ( not ( = ?auto_1448251 ?auto_1448254 ) ) ( not ( = ?auto_1448251 ?auto_1448256 ) ) ( not ( = ?auto_1448251 ?auto_1448257 ) ) ( not ( = ?auto_1448251 ?auto_1448258 ) ) ( not ( = ?auto_1448251 ?auto_1448259 ) ) ( not ( = ?auto_1448251 ?auto_1448262 ) ) ( not ( = ?auto_1448252 ?auto_1448249 ) ) ( not ( = ?auto_1448252 ?auto_1448253 ) ) ( not ( = ?auto_1448252 ?auto_1448255 ) ) ( not ( = ?auto_1448252 ?auto_1448254 ) ) ( not ( = ?auto_1448252 ?auto_1448256 ) ) ( not ( = ?auto_1448252 ?auto_1448257 ) ) ( not ( = ?auto_1448252 ?auto_1448258 ) ) ( not ( = ?auto_1448252 ?auto_1448259 ) ) ( not ( = ?auto_1448252 ?auto_1448262 ) ) ( not ( = ?auto_1448249 ?auto_1448253 ) ) ( not ( = ?auto_1448249 ?auto_1448255 ) ) ( not ( = ?auto_1448249 ?auto_1448254 ) ) ( not ( = ?auto_1448249 ?auto_1448256 ) ) ( not ( = ?auto_1448249 ?auto_1448257 ) ) ( not ( = ?auto_1448249 ?auto_1448258 ) ) ( not ( = ?auto_1448249 ?auto_1448259 ) ) ( not ( = ?auto_1448249 ?auto_1448262 ) ) ( not ( = ?auto_1448253 ?auto_1448255 ) ) ( not ( = ?auto_1448253 ?auto_1448254 ) ) ( not ( = ?auto_1448253 ?auto_1448256 ) ) ( not ( = ?auto_1448253 ?auto_1448257 ) ) ( not ( = ?auto_1448253 ?auto_1448258 ) ) ( not ( = ?auto_1448253 ?auto_1448259 ) ) ( not ( = ?auto_1448253 ?auto_1448262 ) ) ( not ( = ?auto_1448255 ?auto_1448254 ) ) ( not ( = ?auto_1448255 ?auto_1448256 ) ) ( not ( = ?auto_1448255 ?auto_1448257 ) ) ( not ( = ?auto_1448255 ?auto_1448258 ) ) ( not ( = ?auto_1448255 ?auto_1448259 ) ) ( not ( = ?auto_1448255 ?auto_1448262 ) ) ( not ( = ?auto_1448254 ?auto_1448256 ) ) ( not ( = ?auto_1448254 ?auto_1448257 ) ) ( not ( = ?auto_1448254 ?auto_1448258 ) ) ( not ( = ?auto_1448254 ?auto_1448259 ) ) ( not ( = ?auto_1448254 ?auto_1448262 ) ) ( not ( = ?auto_1448256 ?auto_1448257 ) ) ( not ( = ?auto_1448256 ?auto_1448258 ) ) ( not ( = ?auto_1448256 ?auto_1448259 ) ) ( not ( = ?auto_1448256 ?auto_1448262 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1448257 ?auto_1448258 ?auto_1448259 )
      ( MAKE-10CRATE-VERIFY ?auto_1448250 ?auto_1448251 ?auto_1448252 ?auto_1448249 ?auto_1448253 ?auto_1448255 ?auto_1448254 ?auto_1448256 ?auto_1448257 ?auto_1448258 ?auto_1448259 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1448376 - SURFACE
      ?auto_1448377 - SURFACE
      ?auto_1448378 - SURFACE
      ?auto_1448375 - SURFACE
      ?auto_1448379 - SURFACE
      ?auto_1448381 - SURFACE
      ?auto_1448380 - SURFACE
      ?auto_1448382 - SURFACE
      ?auto_1448383 - SURFACE
      ?auto_1448384 - SURFACE
      ?auto_1448385 - SURFACE
    )
    :vars
    (
      ?auto_1448390 - HOIST
      ?auto_1448391 - PLACE
      ?auto_1448387 - PLACE
      ?auto_1448389 - HOIST
      ?auto_1448388 - SURFACE
      ?auto_1448386 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1448390 ?auto_1448391 ) ( IS-CRATE ?auto_1448385 ) ( not ( = ?auto_1448384 ?auto_1448385 ) ) ( not ( = ?auto_1448383 ?auto_1448384 ) ) ( not ( = ?auto_1448383 ?auto_1448385 ) ) ( not ( = ?auto_1448387 ?auto_1448391 ) ) ( HOIST-AT ?auto_1448389 ?auto_1448387 ) ( not ( = ?auto_1448390 ?auto_1448389 ) ) ( AVAILABLE ?auto_1448389 ) ( SURFACE-AT ?auto_1448385 ?auto_1448387 ) ( ON ?auto_1448385 ?auto_1448388 ) ( CLEAR ?auto_1448385 ) ( not ( = ?auto_1448384 ?auto_1448388 ) ) ( not ( = ?auto_1448385 ?auto_1448388 ) ) ( not ( = ?auto_1448383 ?auto_1448388 ) ) ( TRUCK-AT ?auto_1448386 ?auto_1448391 ) ( SURFACE-AT ?auto_1448383 ?auto_1448391 ) ( CLEAR ?auto_1448383 ) ( IS-CRATE ?auto_1448384 ) ( AVAILABLE ?auto_1448390 ) ( IN ?auto_1448384 ?auto_1448386 ) ( ON ?auto_1448377 ?auto_1448376 ) ( ON ?auto_1448378 ?auto_1448377 ) ( ON ?auto_1448375 ?auto_1448378 ) ( ON ?auto_1448379 ?auto_1448375 ) ( ON ?auto_1448381 ?auto_1448379 ) ( ON ?auto_1448380 ?auto_1448381 ) ( ON ?auto_1448382 ?auto_1448380 ) ( ON ?auto_1448383 ?auto_1448382 ) ( not ( = ?auto_1448376 ?auto_1448377 ) ) ( not ( = ?auto_1448376 ?auto_1448378 ) ) ( not ( = ?auto_1448376 ?auto_1448375 ) ) ( not ( = ?auto_1448376 ?auto_1448379 ) ) ( not ( = ?auto_1448376 ?auto_1448381 ) ) ( not ( = ?auto_1448376 ?auto_1448380 ) ) ( not ( = ?auto_1448376 ?auto_1448382 ) ) ( not ( = ?auto_1448376 ?auto_1448383 ) ) ( not ( = ?auto_1448376 ?auto_1448384 ) ) ( not ( = ?auto_1448376 ?auto_1448385 ) ) ( not ( = ?auto_1448376 ?auto_1448388 ) ) ( not ( = ?auto_1448377 ?auto_1448378 ) ) ( not ( = ?auto_1448377 ?auto_1448375 ) ) ( not ( = ?auto_1448377 ?auto_1448379 ) ) ( not ( = ?auto_1448377 ?auto_1448381 ) ) ( not ( = ?auto_1448377 ?auto_1448380 ) ) ( not ( = ?auto_1448377 ?auto_1448382 ) ) ( not ( = ?auto_1448377 ?auto_1448383 ) ) ( not ( = ?auto_1448377 ?auto_1448384 ) ) ( not ( = ?auto_1448377 ?auto_1448385 ) ) ( not ( = ?auto_1448377 ?auto_1448388 ) ) ( not ( = ?auto_1448378 ?auto_1448375 ) ) ( not ( = ?auto_1448378 ?auto_1448379 ) ) ( not ( = ?auto_1448378 ?auto_1448381 ) ) ( not ( = ?auto_1448378 ?auto_1448380 ) ) ( not ( = ?auto_1448378 ?auto_1448382 ) ) ( not ( = ?auto_1448378 ?auto_1448383 ) ) ( not ( = ?auto_1448378 ?auto_1448384 ) ) ( not ( = ?auto_1448378 ?auto_1448385 ) ) ( not ( = ?auto_1448378 ?auto_1448388 ) ) ( not ( = ?auto_1448375 ?auto_1448379 ) ) ( not ( = ?auto_1448375 ?auto_1448381 ) ) ( not ( = ?auto_1448375 ?auto_1448380 ) ) ( not ( = ?auto_1448375 ?auto_1448382 ) ) ( not ( = ?auto_1448375 ?auto_1448383 ) ) ( not ( = ?auto_1448375 ?auto_1448384 ) ) ( not ( = ?auto_1448375 ?auto_1448385 ) ) ( not ( = ?auto_1448375 ?auto_1448388 ) ) ( not ( = ?auto_1448379 ?auto_1448381 ) ) ( not ( = ?auto_1448379 ?auto_1448380 ) ) ( not ( = ?auto_1448379 ?auto_1448382 ) ) ( not ( = ?auto_1448379 ?auto_1448383 ) ) ( not ( = ?auto_1448379 ?auto_1448384 ) ) ( not ( = ?auto_1448379 ?auto_1448385 ) ) ( not ( = ?auto_1448379 ?auto_1448388 ) ) ( not ( = ?auto_1448381 ?auto_1448380 ) ) ( not ( = ?auto_1448381 ?auto_1448382 ) ) ( not ( = ?auto_1448381 ?auto_1448383 ) ) ( not ( = ?auto_1448381 ?auto_1448384 ) ) ( not ( = ?auto_1448381 ?auto_1448385 ) ) ( not ( = ?auto_1448381 ?auto_1448388 ) ) ( not ( = ?auto_1448380 ?auto_1448382 ) ) ( not ( = ?auto_1448380 ?auto_1448383 ) ) ( not ( = ?auto_1448380 ?auto_1448384 ) ) ( not ( = ?auto_1448380 ?auto_1448385 ) ) ( not ( = ?auto_1448380 ?auto_1448388 ) ) ( not ( = ?auto_1448382 ?auto_1448383 ) ) ( not ( = ?auto_1448382 ?auto_1448384 ) ) ( not ( = ?auto_1448382 ?auto_1448385 ) ) ( not ( = ?auto_1448382 ?auto_1448388 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1448383 ?auto_1448384 ?auto_1448385 )
      ( MAKE-10CRATE-VERIFY ?auto_1448376 ?auto_1448377 ?auto_1448378 ?auto_1448375 ?auto_1448379 ?auto_1448381 ?auto_1448380 ?auto_1448382 ?auto_1448383 ?auto_1448384 ?auto_1448385 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1448392 - SURFACE
      ?auto_1448393 - SURFACE
    )
    :vars
    (
      ?auto_1448399 - HOIST
      ?auto_1448400 - PLACE
      ?auto_1448395 - SURFACE
      ?auto_1448396 - PLACE
      ?auto_1448398 - HOIST
      ?auto_1448397 - SURFACE
      ?auto_1448394 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1448399 ?auto_1448400 ) ( IS-CRATE ?auto_1448393 ) ( not ( = ?auto_1448392 ?auto_1448393 ) ) ( not ( = ?auto_1448395 ?auto_1448392 ) ) ( not ( = ?auto_1448395 ?auto_1448393 ) ) ( not ( = ?auto_1448396 ?auto_1448400 ) ) ( HOIST-AT ?auto_1448398 ?auto_1448396 ) ( not ( = ?auto_1448399 ?auto_1448398 ) ) ( AVAILABLE ?auto_1448398 ) ( SURFACE-AT ?auto_1448393 ?auto_1448396 ) ( ON ?auto_1448393 ?auto_1448397 ) ( CLEAR ?auto_1448393 ) ( not ( = ?auto_1448392 ?auto_1448397 ) ) ( not ( = ?auto_1448393 ?auto_1448397 ) ) ( not ( = ?auto_1448395 ?auto_1448397 ) ) ( SURFACE-AT ?auto_1448395 ?auto_1448400 ) ( CLEAR ?auto_1448395 ) ( IS-CRATE ?auto_1448392 ) ( AVAILABLE ?auto_1448399 ) ( IN ?auto_1448392 ?auto_1448394 ) ( TRUCK-AT ?auto_1448394 ?auto_1448396 ) )
    :subtasks
    ( ( !DRIVE ?auto_1448394 ?auto_1448396 ?auto_1448400 )
      ( MAKE-2CRATE ?auto_1448395 ?auto_1448392 ?auto_1448393 )
      ( MAKE-1CRATE-VERIFY ?auto_1448392 ?auto_1448393 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1448401 - SURFACE
      ?auto_1448402 - SURFACE
      ?auto_1448403 - SURFACE
    )
    :vars
    (
      ?auto_1448407 - HOIST
      ?auto_1448409 - PLACE
      ?auto_1448405 - PLACE
      ?auto_1448408 - HOIST
      ?auto_1448406 - SURFACE
      ?auto_1448404 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1448407 ?auto_1448409 ) ( IS-CRATE ?auto_1448403 ) ( not ( = ?auto_1448402 ?auto_1448403 ) ) ( not ( = ?auto_1448401 ?auto_1448402 ) ) ( not ( = ?auto_1448401 ?auto_1448403 ) ) ( not ( = ?auto_1448405 ?auto_1448409 ) ) ( HOIST-AT ?auto_1448408 ?auto_1448405 ) ( not ( = ?auto_1448407 ?auto_1448408 ) ) ( AVAILABLE ?auto_1448408 ) ( SURFACE-AT ?auto_1448403 ?auto_1448405 ) ( ON ?auto_1448403 ?auto_1448406 ) ( CLEAR ?auto_1448403 ) ( not ( = ?auto_1448402 ?auto_1448406 ) ) ( not ( = ?auto_1448403 ?auto_1448406 ) ) ( not ( = ?auto_1448401 ?auto_1448406 ) ) ( SURFACE-AT ?auto_1448401 ?auto_1448409 ) ( CLEAR ?auto_1448401 ) ( IS-CRATE ?auto_1448402 ) ( AVAILABLE ?auto_1448407 ) ( IN ?auto_1448402 ?auto_1448404 ) ( TRUCK-AT ?auto_1448404 ?auto_1448405 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1448402 ?auto_1448403 )
      ( MAKE-2CRATE-VERIFY ?auto_1448401 ?auto_1448402 ?auto_1448403 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1448411 - SURFACE
      ?auto_1448412 - SURFACE
      ?auto_1448413 - SURFACE
      ?auto_1448410 - SURFACE
    )
    :vars
    (
      ?auto_1448417 - HOIST
      ?auto_1448418 - PLACE
      ?auto_1448416 - PLACE
      ?auto_1448414 - HOIST
      ?auto_1448419 - SURFACE
      ?auto_1448415 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1448417 ?auto_1448418 ) ( IS-CRATE ?auto_1448410 ) ( not ( = ?auto_1448413 ?auto_1448410 ) ) ( not ( = ?auto_1448412 ?auto_1448413 ) ) ( not ( = ?auto_1448412 ?auto_1448410 ) ) ( not ( = ?auto_1448416 ?auto_1448418 ) ) ( HOIST-AT ?auto_1448414 ?auto_1448416 ) ( not ( = ?auto_1448417 ?auto_1448414 ) ) ( AVAILABLE ?auto_1448414 ) ( SURFACE-AT ?auto_1448410 ?auto_1448416 ) ( ON ?auto_1448410 ?auto_1448419 ) ( CLEAR ?auto_1448410 ) ( not ( = ?auto_1448413 ?auto_1448419 ) ) ( not ( = ?auto_1448410 ?auto_1448419 ) ) ( not ( = ?auto_1448412 ?auto_1448419 ) ) ( SURFACE-AT ?auto_1448412 ?auto_1448418 ) ( CLEAR ?auto_1448412 ) ( IS-CRATE ?auto_1448413 ) ( AVAILABLE ?auto_1448417 ) ( IN ?auto_1448413 ?auto_1448415 ) ( TRUCK-AT ?auto_1448415 ?auto_1448416 ) ( ON ?auto_1448412 ?auto_1448411 ) ( not ( = ?auto_1448411 ?auto_1448412 ) ) ( not ( = ?auto_1448411 ?auto_1448413 ) ) ( not ( = ?auto_1448411 ?auto_1448410 ) ) ( not ( = ?auto_1448411 ?auto_1448419 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1448412 ?auto_1448413 ?auto_1448410 )
      ( MAKE-3CRATE-VERIFY ?auto_1448411 ?auto_1448412 ?auto_1448413 ?auto_1448410 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1448421 - SURFACE
      ?auto_1448422 - SURFACE
      ?auto_1448423 - SURFACE
      ?auto_1448420 - SURFACE
      ?auto_1448424 - SURFACE
    )
    :vars
    (
      ?auto_1448428 - HOIST
      ?auto_1448429 - PLACE
      ?auto_1448427 - PLACE
      ?auto_1448425 - HOIST
      ?auto_1448430 - SURFACE
      ?auto_1448426 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1448428 ?auto_1448429 ) ( IS-CRATE ?auto_1448424 ) ( not ( = ?auto_1448420 ?auto_1448424 ) ) ( not ( = ?auto_1448423 ?auto_1448420 ) ) ( not ( = ?auto_1448423 ?auto_1448424 ) ) ( not ( = ?auto_1448427 ?auto_1448429 ) ) ( HOIST-AT ?auto_1448425 ?auto_1448427 ) ( not ( = ?auto_1448428 ?auto_1448425 ) ) ( AVAILABLE ?auto_1448425 ) ( SURFACE-AT ?auto_1448424 ?auto_1448427 ) ( ON ?auto_1448424 ?auto_1448430 ) ( CLEAR ?auto_1448424 ) ( not ( = ?auto_1448420 ?auto_1448430 ) ) ( not ( = ?auto_1448424 ?auto_1448430 ) ) ( not ( = ?auto_1448423 ?auto_1448430 ) ) ( SURFACE-AT ?auto_1448423 ?auto_1448429 ) ( CLEAR ?auto_1448423 ) ( IS-CRATE ?auto_1448420 ) ( AVAILABLE ?auto_1448428 ) ( IN ?auto_1448420 ?auto_1448426 ) ( TRUCK-AT ?auto_1448426 ?auto_1448427 ) ( ON ?auto_1448422 ?auto_1448421 ) ( ON ?auto_1448423 ?auto_1448422 ) ( not ( = ?auto_1448421 ?auto_1448422 ) ) ( not ( = ?auto_1448421 ?auto_1448423 ) ) ( not ( = ?auto_1448421 ?auto_1448420 ) ) ( not ( = ?auto_1448421 ?auto_1448424 ) ) ( not ( = ?auto_1448421 ?auto_1448430 ) ) ( not ( = ?auto_1448422 ?auto_1448423 ) ) ( not ( = ?auto_1448422 ?auto_1448420 ) ) ( not ( = ?auto_1448422 ?auto_1448424 ) ) ( not ( = ?auto_1448422 ?auto_1448430 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1448423 ?auto_1448420 ?auto_1448424 )
      ( MAKE-4CRATE-VERIFY ?auto_1448421 ?auto_1448422 ?auto_1448423 ?auto_1448420 ?auto_1448424 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1448432 - SURFACE
      ?auto_1448433 - SURFACE
      ?auto_1448434 - SURFACE
      ?auto_1448431 - SURFACE
      ?auto_1448435 - SURFACE
      ?auto_1448436 - SURFACE
    )
    :vars
    (
      ?auto_1448440 - HOIST
      ?auto_1448441 - PLACE
      ?auto_1448439 - PLACE
      ?auto_1448437 - HOIST
      ?auto_1448442 - SURFACE
      ?auto_1448438 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1448440 ?auto_1448441 ) ( IS-CRATE ?auto_1448436 ) ( not ( = ?auto_1448435 ?auto_1448436 ) ) ( not ( = ?auto_1448431 ?auto_1448435 ) ) ( not ( = ?auto_1448431 ?auto_1448436 ) ) ( not ( = ?auto_1448439 ?auto_1448441 ) ) ( HOIST-AT ?auto_1448437 ?auto_1448439 ) ( not ( = ?auto_1448440 ?auto_1448437 ) ) ( AVAILABLE ?auto_1448437 ) ( SURFACE-AT ?auto_1448436 ?auto_1448439 ) ( ON ?auto_1448436 ?auto_1448442 ) ( CLEAR ?auto_1448436 ) ( not ( = ?auto_1448435 ?auto_1448442 ) ) ( not ( = ?auto_1448436 ?auto_1448442 ) ) ( not ( = ?auto_1448431 ?auto_1448442 ) ) ( SURFACE-AT ?auto_1448431 ?auto_1448441 ) ( CLEAR ?auto_1448431 ) ( IS-CRATE ?auto_1448435 ) ( AVAILABLE ?auto_1448440 ) ( IN ?auto_1448435 ?auto_1448438 ) ( TRUCK-AT ?auto_1448438 ?auto_1448439 ) ( ON ?auto_1448433 ?auto_1448432 ) ( ON ?auto_1448434 ?auto_1448433 ) ( ON ?auto_1448431 ?auto_1448434 ) ( not ( = ?auto_1448432 ?auto_1448433 ) ) ( not ( = ?auto_1448432 ?auto_1448434 ) ) ( not ( = ?auto_1448432 ?auto_1448431 ) ) ( not ( = ?auto_1448432 ?auto_1448435 ) ) ( not ( = ?auto_1448432 ?auto_1448436 ) ) ( not ( = ?auto_1448432 ?auto_1448442 ) ) ( not ( = ?auto_1448433 ?auto_1448434 ) ) ( not ( = ?auto_1448433 ?auto_1448431 ) ) ( not ( = ?auto_1448433 ?auto_1448435 ) ) ( not ( = ?auto_1448433 ?auto_1448436 ) ) ( not ( = ?auto_1448433 ?auto_1448442 ) ) ( not ( = ?auto_1448434 ?auto_1448431 ) ) ( not ( = ?auto_1448434 ?auto_1448435 ) ) ( not ( = ?auto_1448434 ?auto_1448436 ) ) ( not ( = ?auto_1448434 ?auto_1448442 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1448431 ?auto_1448435 ?auto_1448436 )
      ( MAKE-5CRATE-VERIFY ?auto_1448432 ?auto_1448433 ?auto_1448434 ?auto_1448431 ?auto_1448435 ?auto_1448436 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1448444 - SURFACE
      ?auto_1448445 - SURFACE
      ?auto_1448446 - SURFACE
      ?auto_1448443 - SURFACE
      ?auto_1448447 - SURFACE
      ?auto_1448449 - SURFACE
      ?auto_1448448 - SURFACE
    )
    :vars
    (
      ?auto_1448453 - HOIST
      ?auto_1448454 - PLACE
      ?auto_1448452 - PLACE
      ?auto_1448450 - HOIST
      ?auto_1448455 - SURFACE
      ?auto_1448451 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1448453 ?auto_1448454 ) ( IS-CRATE ?auto_1448448 ) ( not ( = ?auto_1448449 ?auto_1448448 ) ) ( not ( = ?auto_1448447 ?auto_1448449 ) ) ( not ( = ?auto_1448447 ?auto_1448448 ) ) ( not ( = ?auto_1448452 ?auto_1448454 ) ) ( HOIST-AT ?auto_1448450 ?auto_1448452 ) ( not ( = ?auto_1448453 ?auto_1448450 ) ) ( AVAILABLE ?auto_1448450 ) ( SURFACE-AT ?auto_1448448 ?auto_1448452 ) ( ON ?auto_1448448 ?auto_1448455 ) ( CLEAR ?auto_1448448 ) ( not ( = ?auto_1448449 ?auto_1448455 ) ) ( not ( = ?auto_1448448 ?auto_1448455 ) ) ( not ( = ?auto_1448447 ?auto_1448455 ) ) ( SURFACE-AT ?auto_1448447 ?auto_1448454 ) ( CLEAR ?auto_1448447 ) ( IS-CRATE ?auto_1448449 ) ( AVAILABLE ?auto_1448453 ) ( IN ?auto_1448449 ?auto_1448451 ) ( TRUCK-AT ?auto_1448451 ?auto_1448452 ) ( ON ?auto_1448445 ?auto_1448444 ) ( ON ?auto_1448446 ?auto_1448445 ) ( ON ?auto_1448443 ?auto_1448446 ) ( ON ?auto_1448447 ?auto_1448443 ) ( not ( = ?auto_1448444 ?auto_1448445 ) ) ( not ( = ?auto_1448444 ?auto_1448446 ) ) ( not ( = ?auto_1448444 ?auto_1448443 ) ) ( not ( = ?auto_1448444 ?auto_1448447 ) ) ( not ( = ?auto_1448444 ?auto_1448449 ) ) ( not ( = ?auto_1448444 ?auto_1448448 ) ) ( not ( = ?auto_1448444 ?auto_1448455 ) ) ( not ( = ?auto_1448445 ?auto_1448446 ) ) ( not ( = ?auto_1448445 ?auto_1448443 ) ) ( not ( = ?auto_1448445 ?auto_1448447 ) ) ( not ( = ?auto_1448445 ?auto_1448449 ) ) ( not ( = ?auto_1448445 ?auto_1448448 ) ) ( not ( = ?auto_1448445 ?auto_1448455 ) ) ( not ( = ?auto_1448446 ?auto_1448443 ) ) ( not ( = ?auto_1448446 ?auto_1448447 ) ) ( not ( = ?auto_1448446 ?auto_1448449 ) ) ( not ( = ?auto_1448446 ?auto_1448448 ) ) ( not ( = ?auto_1448446 ?auto_1448455 ) ) ( not ( = ?auto_1448443 ?auto_1448447 ) ) ( not ( = ?auto_1448443 ?auto_1448449 ) ) ( not ( = ?auto_1448443 ?auto_1448448 ) ) ( not ( = ?auto_1448443 ?auto_1448455 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1448447 ?auto_1448449 ?auto_1448448 )
      ( MAKE-6CRATE-VERIFY ?auto_1448444 ?auto_1448445 ?auto_1448446 ?auto_1448443 ?auto_1448447 ?auto_1448449 ?auto_1448448 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1448457 - SURFACE
      ?auto_1448458 - SURFACE
      ?auto_1448459 - SURFACE
      ?auto_1448456 - SURFACE
      ?auto_1448460 - SURFACE
      ?auto_1448462 - SURFACE
      ?auto_1448461 - SURFACE
      ?auto_1448463 - SURFACE
    )
    :vars
    (
      ?auto_1448467 - HOIST
      ?auto_1448468 - PLACE
      ?auto_1448466 - PLACE
      ?auto_1448464 - HOIST
      ?auto_1448469 - SURFACE
      ?auto_1448465 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1448467 ?auto_1448468 ) ( IS-CRATE ?auto_1448463 ) ( not ( = ?auto_1448461 ?auto_1448463 ) ) ( not ( = ?auto_1448462 ?auto_1448461 ) ) ( not ( = ?auto_1448462 ?auto_1448463 ) ) ( not ( = ?auto_1448466 ?auto_1448468 ) ) ( HOIST-AT ?auto_1448464 ?auto_1448466 ) ( not ( = ?auto_1448467 ?auto_1448464 ) ) ( AVAILABLE ?auto_1448464 ) ( SURFACE-AT ?auto_1448463 ?auto_1448466 ) ( ON ?auto_1448463 ?auto_1448469 ) ( CLEAR ?auto_1448463 ) ( not ( = ?auto_1448461 ?auto_1448469 ) ) ( not ( = ?auto_1448463 ?auto_1448469 ) ) ( not ( = ?auto_1448462 ?auto_1448469 ) ) ( SURFACE-AT ?auto_1448462 ?auto_1448468 ) ( CLEAR ?auto_1448462 ) ( IS-CRATE ?auto_1448461 ) ( AVAILABLE ?auto_1448467 ) ( IN ?auto_1448461 ?auto_1448465 ) ( TRUCK-AT ?auto_1448465 ?auto_1448466 ) ( ON ?auto_1448458 ?auto_1448457 ) ( ON ?auto_1448459 ?auto_1448458 ) ( ON ?auto_1448456 ?auto_1448459 ) ( ON ?auto_1448460 ?auto_1448456 ) ( ON ?auto_1448462 ?auto_1448460 ) ( not ( = ?auto_1448457 ?auto_1448458 ) ) ( not ( = ?auto_1448457 ?auto_1448459 ) ) ( not ( = ?auto_1448457 ?auto_1448456 ) ) ( not ( = ?auto_1448457 ?auto_1448460 ) ) ( not ( = ?auto_1448457 ?auto_1448462 ) ) ( not ( = ?auto_1448457 ?auto_1448461 ) ) ( not ( = ?auto_1448457 ?auto_1448463 ) ) ( not ( = ?auto_1448457 ?auto_1448469 ) ) ( not ( = ?auto_1448458 ?auto_1448459 ) ) ( not ( = ?auto_1448458 ?auto_1448456 ) ) ( not ( = ?auto_1448458 ?auto_1448460 ) ) ( not ( = ?auto_1448458 ?auto_1448462 ) ) ( not ( = ?auto_1448458 ?auto_1448461 ) ) ( not ( = ?auto_1448458 ?auto_1448463 ) ) ( not ( = ?auto_1448458 ?auto_1448469 ) ) ( not ( = ?auto_1448459 ?auto_1448456 ) ) ( not ( = ?auto_1448459 ?auto_1448460 ) ) ( not ( = ?auto_1448459 ?auto_1448462 ) ) ( not ( = ?auto_1448459 ?auto_1448461 ) ) ( not ( = ?auto_1448459 ?auto_1448463 ) ) ( not ( = ?auto_1448459 ?auto_1448469 ) ) ( not ( = ?auto_1448456 ?auto_1448460 ) ) ( not ( = ?auto_1448456 ?auto_1448462 ) ) ( not ( = ?auto_1448456 ?auto_1448461 ) ) ( not ( = ?auto_1448456 ?auto_1448463 ) ) ( not ( = ?auto_1448456 ?auto_1448469 ) ) ( not ( = ?auto_1448460 ?auto_1448462 ) ) ( not ( = ?auto_1448460 ?auto_1448461 ) ) ( not ( = ?auto_1448460 ?auto_1448463 ) ) ( not ( = ?auto_1448460 ?auto_1448469 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1448462 ?auto_1448461 ?auto_1448463 )
      ( MAKE-7CRATE-VERIFY ?auto_1448457 ?auto_1448458 ?auto_1448459 ?auto_1448456 ?auto_1448460 ?auto_1448462 ?auto_1448461 ?auto_1448463 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1448471 - SURFACE
      ?auto_1448472 - SURFACE
      ?auto_1448473 - SURFACE
      ?auto_1448470 - SURFACE
      ?auto_1448474 - SURFACE
      ?auto_1448476 - SURFACE
      ?auto_1448475 - SURFACE
      ?auto_1448477 - SURFACE
      ?auto_1448478 - SURFACE
    )
    :vars
    (
      ?auto_1448482 - HOIST
      ?auto_1448483 - PLACE
      ?auto_1448481 - PLACE
      ?auto_1448479 - HOIST
      ?auto_1448484 - SURFACE
      ?auto_1448480 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1448482 ?auto_1448483 ) ( IS-CRATE ?auto_1448478 ) ( not ( = ?auto_1448477 ?auto_1448478 ) ) ( not ( = ?auto_1448475 ?auto_1448477 ) ) ( not ( = ?auto_1448475 ?auto_1448478 ) ) ( not ( = ?auto_1448481 ?auto_1448483 ) ) ( HOIST-AT ?auto_1448479 ?auto_1448481 ) ( not ( = ?auto_1448482 ?auto_1448479 ) ) ( AVAILABLE ?auto_1448479 ) ( SURFACE-AT ?auto_1448478 ?auto_1448481 ) ( ON ?auto_1448478 ?auto_1448484 ) ( CLEAR ?auto_1448478 ) ( not ( = ?auto_1448477 ?auto_1448484 ) ) ( not ( = ?auto_1448478 ?auto_1448484 ) ) ( not ( = ?auto_1448475 ?auto_1448484 ) ) ( SURFACE-AT ?auto_1448475 ?auto_1448483 ) ( CLEAR ?auto_1448475 ) ( IS-CRATE ?auto_1448477 ) ( AVAILABLE ?auto_1448482 ) ( IN ?auto_1448477 ?auto_1448480 ) ( TRUCK-AT ?auto_1448480 ?auto_1448481 ) ( ON ?auto_1448472 ?auto_1448471 ) ( ON ?auto_1448473 ?auto_1448472 ) ( ON ?auto_1448470 ?auto_1448473 ) ( ON ?auto_1448474 ?auto_1448470 ) ( ON ?auto_1448476 ?auto_1448474 ) ( ON ?auto_1448475 ?auto_1448476 ) ( not ( = ?auto_1448471 ?auto_1448472 ) ) ( not ( = ?auto_1448471 ?auto_1448473 ) ) ( not ( = ?auto_1448471 ?auto_1448470 ) ) ( not ( = ?auto_1448471 ?auto_1448474 ) ) ( not ( = ?auto_1448471 ?auto_1448476 ) ) ( not ( = ?auto_1448471 ?auto_1448475 ) ) ( not ( = ?auto_1448471 ?auto_1448477 ) ) ( not ( = ?auto_1448471 ?auto_1448478 ) ) ( not ( = ?auto_1448471 ?auto_1448484 ) ) ( not ( = ?auto_1448472 ?auto_1448473 ) ) ( not ( = ?auto_1448472 ?auto_1448470 ) ) ( not ( = ?auto_1448472 ?auto_1448474 ) ) ( not ( = ?auto_1448472 ?auto_1448476 ) ) ( not ( = ?auto_1448472 ?auto_1448475 ) ) ( not ( = ?auto_1448472 ?auto_1448477 ) ) ( not ( = ?auto_1448472 ?auto_1448478 ) ) ( not ( = ?auto_1448472 ?auto_1448484 ) ) ( not ( = ?auto_1448473 ?auto_1448470 ) ) ( not ( = ?auto_1448473 ?auto_1448474 ) ) ( not ( = ?auto_1448473 ?auto_1448476 ) ) ( not ( = ?auto_1448473 ?auto_1448475 ) ) ( not ( = ?auto_1448473 ?auto_1448477 ) ) ( not ( = ?auto_1448473 ?auto_1448478 ) ) ( not ( = ?auto_1448473 ?auto_1448484 ) ) ( not ( = ?auto_1448470 ?auto_1448474 ) ) ( not ( = ?auto_1448470 ?auto_1448476 ) ) ( not ( = ?auto_1448470 ?auto_1448475 ) ) ( not ( = ?auto_1448470 ?auto_1448477 ) ) ( not ( = ?auto_1448470 ?auto_1448478 ) ) ( not ( = ?auto_1448470 ?auto_1448484 ) ) ( not ( = ?auto_1448474 ?auto_1448476 ) ) ( not ( = ?auto_1448474 ?auto_1448475 ) ) ( not ( = ?auto_1448474 ?auto_1448477 ) ) ( not ( = ?auto_1448474 ?auto_1448478 ) ) ( not ( = ?auto_1448474 ?auto_1448484 ) ) ( not ( = ?auto_1448476 ?auto_1448475 ) ) ( not ( = ?auto_1448476 ?auto_1448477 ) ) ( not ( = ?auto_1448476 ?auto_1448478 ) ) ( not ( = ?auto_1448476 ?auto_1448484 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1448475 ?auto_1448477 ?auto_1448478 )
      ( MAKE-8CRATE-VERIFY ?auto_1448471 ?auto_1448472 ?auto_1448473 ?auto_1448470 ?auto_1448474 ?auto_1448476 ?auto_1448475 ?auto_1448477 ?auto_1448478 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1448486 - SURFACE
      ?auto_1448487 - SURFACE
      ?auto_1448488 - SURFACE
      ?auto_1448485 - SURFACE
      ?auto_1448489 - SURFACE
      ?auto_1448491 - SURFACE
      ?auto_1448490 - SURFACE
      ?auto_1448492 - SURFACE
      ?auto_1448493 - SURFACE
      ?auto_1448494 - SURFACE
    )
    :vars
    (
      ?auto_1448498 - HOIST
      ?auto_1448499 - PLACE
      ?auto_1448497 - PLACE
      ?auto_1448495 - HOIST
      ?auto_1448500 - SURFACE
      ?auto_1448496 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1448498 ?auto_1448499 ) ( IS-CRATE ?auto_1448494 ) ( not ( = ?auto_1448493 ?auto_1448494 ) ) ( not ( = ?auto_1448492 ?auto_1448493 ) ) ( not ( = ?auto_1448492 ?auto_1448494 ) ) ( not ( = ?auto_1448497 ?auto_1448499 ) ) ( HOIST-AT ?auto_1448495 ?auto_1448497 ) ( not ( = ?auto_1448498 ?auto_1448495 ) ) ( AVAILABLE ?auto_1448495 ) ( SURFACE-AT ?auto_1448494 ?auto_1448497 ) ( ON ?auto_1448494 ?auto_1448500 ) ( CLEAR ?auto_1448494 ) ( not ( = ?auto_1448493 ?auto_1448500 ) ) ( not ( = ?auto_1448494 ?auto_1448500 ) ) ( not ( = ?auto_1448492 ?auto_1448500 ) ) ( SURFACE-AT ?auto_1448492 ?auto_1448499 ) ( CLEAR ?auto_1448492 ) ( IS-CRATE ?auto_1448493 ) ( AVAILABLE ?auto_1448498 ) ( IN ?auto_1448493 ?auto_1448496 ) ( TRUCK-AT ?auto_1448496 ?auto_1448497 ) ( ON ?auto_1448487 ?auto_1448486 ) ( ON ?auto_1448488 ?auto_1448487 ) ( ON ?auto_1448485 ?auto_1448488 ) ( ON ?auto_1448489 ?auto_1448485 ) ( ON ?auto_1448491 ?auto_1448489 ) ( ON ?auto_1448490 ?auto_1448491 ) ( ON ?auto_1448492 ?auto_1448490 ) ( not ( = ?auto_1448486 ?auto_1448487 ) ) ( not ( = ?auto_1448486 ?auto_1448488 ) ) ( not ( = ?auto_1448486 ?auto_1448485 ) ) ( not ( = ?auto_1448486 ?auto_1448489 ) ) ( not ( = ?auto_1448486 ?auto_1448491 ) ) ( not ( = ?auto_1448486 ?auto_1448490 ) ) ( not ( = ?auto_1448486 ?auto_1448492 ) ) ( not ( = ?auto_1448486 ?auto_1448493 ) ) ( not ( = ?auto_1448486 ?auto_1448494 ) ) ( not ( = ?auto_1448486 ?auto_1448500 ) ) ( not ( = ?auto_1448487 ?auto_1448488 ) ) ( not ( = ?auto_1448487 ?auto_1448485 ) ) ( not ( = ?auto_1448487 ?auto_1448489 ) ) ( not ( = ?auto_1448487 ?auto_1448491 ) ) ( not ( = ?auto_1448487 ?auto_1448490 ) ) ( not ( = ?auto_1448487 ?auto_1448492 ) ) ( not ( = ?auto_1448487 ?auto_1448493 ) ) ( not ( = ?auto_1448487 ?auto_1448494 ) ) ( not ( = ?auto_1448487 ?auto_1448500 ) ) ( not ( = ?auto_1448488 ?auto_1448485 ) ) ( not ( = ?auto_1448488 ?auto_1448489 ) ) ( not ( = ?auto_1448488 ?auto_1448491 ) ) ( not ( = ?auto_1448488 ?auto_1448490 ) ) ( not ( = ?auto_1448488 ?auto_1448492 ) ) ( not ( = ?auto_1448488 ?auto_1448493 ) ) ( not ( = ?auto_1448488 ?auto_1448494 ) ) ( not ( = ?auto_1448488 ?auto_1448500 ) ) ( not ( = ?auto_1448485 ?auto_1448489 ) ) ( not ( = ?auto_1448485 ?auto_1448491 ) ) ( not ( = ?auto_1448485 ?auto_1448490 ) ) ( not ( = ?auto_1448485 ?auto_1448492 ) ) ( not ( = ?auto_1448485 ?auto_1448493 ) ) ( not ( = ?auto_1448485 ?auto_1448494 ) ) ( not ( = ?auto_1448485 ?auto_1448500 ) ) ( not ( = ?auto_1448489 ?auto_1448491 ) ) ( not ( = ?auto_1448489 ?auto_1448490 ) ) ( not ( = ?auto_1448489 ?auto_1448492 ) ) ( not ( = ?auto_1448489 ?auto_1448493 ) ) ( not ( = ?auto_1448489 ?auto_1448494 ) ) ( not ( = ?auto_1448489 ?auto_1448500 ) ) ( not ( = ?auto_1448491 ?auto_1448490 ) ) ( not ( = ?auto_1448491 ?auto_1448492 ) ) ( not ( = ?auto_1448491 ?auto_1448493 ) ) ( not ( = ?auto_1448491 ?auto_1448494 ) ) ( not ( = ?auto_1448491 ?auto_1448500 ) ) ( not ( = ?auto_1448490 ?auto_1448492 ) ) ( not ( = ?auto_1448490 ?auto_1448493 ) ) ( not ( = ?auto_1448490 ?auto_1448494 ) ) ( not ( = ?auto_1448490 ?auto_1448500 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1448492 ?auto_1448493 ?auto_1448494 )
      ( MAKE-9CRATE-VERIFY ?auto_1448486 ?auto_1448487 ?auto_1448488 ?auto_1448485 ?auto_1448489 ?auto_1448491 ?auto_1448490 ?auto_1448492 ?auto_1448493 ?auto_1448494 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1448502 - SURFACE
      ?auto_1448503 - SURFACE
      ?auto_1448504 - SURFACE
      ?auto_1448501 - SURFACE
      ?auto_1448505 - SURFACE
      ?auto_1448507 - SURFACE
      ?auto_1448506 - SURFACE
      ?auto_1448508 - SURFACE
      ?auto_1448509 - SURFACE
      ?auto_1448510 - SURFACE
      ?auto_1448511 - SURFACE
    )
    :vars
    (
      ?auto_1448515 - HOIST
      ?auto_1448516 - PLACE
      ?auto_1448514 - PLACE
      ?auto_1448512 - HOIST
      ?auto_1448517 - SURFACE
      ?auto_1448513 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1448515 ?auto_1448516 ) ( IS-CRATE ?auto_1448511 ) ( not ( = ?auto_1448510 ?auto_1448511 ) ) ( not ( = ?auto_1448509 ?auto_1448510 ) ) ( not ( = ?auto_1448509 ?auto_1448511 ) ) ( not ( = ?auto_1448514 ?auto_1448516 ) ) ( HOIST-AT ?auto_1448512 ?auto_1448514 ) ( not ( = ?auto_1448515 ?auto_1448512 ) ) ( AVAILABLE ?auto_1448512 ) ( SURFACE-AT ?auto_1448511 ?auto_1448514 ) ( ON ?auto_1448511 ?auto_1448517 ) ( CLEAR ?auto_1448511 ) ( not ( = ?auto_1448510 ?auto_1448517 ) ) ( not ( = ?auto_1448511 ?auto_1448517 ) ) ( not ( = ?auto_1448509 ?auto_1448517 ) ) ( SURFACE-AT ?auto_1448509 ?auto_1448516 ) ( CLEAR ?auto_1448509 ) ( IS-CRATE ?auto_1448510 ) ( AVAILABLE ?auto_1448515 ) ( IN ?auto_1448510 ?auto_1448513 ) ( TRUCK-AT ?auto_1448513 ?auto_1448514 ) ( ON ?auto_1448503 ?auto_1448502 ) ( ON ?auto_1448504 ?auto_1448503 ) ( ON ?auto_1448501 ?auto_1448504 ) ( ON ?auto_1448505 ?auto_1448501 ) ( ON ?auto_1448507 ?auto_1448505 ) ( ON ?auto_1448506 ?auto_1448507 ) ( ON ?auto_1448508 ?auto_1448506 ) ( ON ?auto_1448509 ?auto_1448508 ) ( not ( = ?auto_1448502 ?auto_1448503 ) ) ( not ( = ?auto_1448502 ?auto_1448504 ) ) ( not ( = ?auto_1448502 ?auto_1448501 ) ) ( not ( = ?auto_1448502 ?auto_1448505 ) ) ( not ( = ?auto_1448502 ?auto_1448507 ) ) ( not ( = ?auto_1448502 ?auto_1448506 ) ) ( not ( = ?auto_1448502 ?auto_1448508 ) ) ( not ( = ?auto_1448502 ?auto_1448509 ) ) ( not ( = ?auto_1448502 ?auto_1448510 ) ) ( not ( = ?auto_1448502 ?auto_1448511 ) ) ( not ( = ?auto_1448502 ?auto_1448517 ) ) ( not ( = ?auto_1448503 ?auto_1448504 ) ) ( not ( = ?auto_1448503 ?auto_1448501 ) ) ( not ( = ?auto_1448503 ?auto_1448505 ) ) ( not ( = ?auto_1448503 ?auto_1448507 ) ) ( not ( = ?auto_1448503 ?auto_1448506 ) ) ( not ( = ?auto_1448503 ?auto_1448508 ) ) ( not ( = ?auto_1448503 ?auto_1448509 ) ) ( not ( = ?auto_1448503 ?auto_1448510 ) ) ( not ( = ?auto_1448503 ?auto_1448511 ) ) ( not ( = ?auto_1448503 ?auto_1448517 ) ) ( not ( = ?auto_1448504 ?auto_1448501 ) ) ( not ( = ?auto_1448504 ?auto_1448505 ) ) ( not ( = ?auto_1448504 ?auto_1448507 ) ) ( not ( = ?auto_1448504 ?auto_1448506 ) ) ( not ( = ?auto_1448504 ?auto_1448508 ) ) ( not ( = ?auto_1448504 ?auto_1448509 ) ) ( not ( = ?auto_1448504 ?auto_1448510 ) ) ( not ( = ?auto_1448504 ?auto_1448511 ) ) ( not ( = ?auto_1448504 ?auto_1448517 ) ) ( not ( = ?auto_1448501 ?auto_1448505 ) ) ( not ( = ?auto_1448501 ?auto_1448507 ) ) ( not ( = ?auto_1448501 ?auto_1448506 ) ) ( not ( = ?auto_1448501 ?auto_1448508 ) ) ( not ( = ?auto_1448501 ?auto_1448509 ) ) ( not ( = ?auto_1448501 ?auto_1448510 ) ) ( not ( = ?auto_1448501 ?auto_1448511 ) ) ( not ( = ?auto_1448501 ?auto_1448517 ) ) ( not ( = ?auto_1448505 ?auto_1448507 ) ) ( not ( = ?auto_1448505 ?auto_1448506 ) ) ( not ( = ?auto_1448505 ?auto_1448508 ) ) ( not ( = ?auto_1448505 ?auto_1448509 ) ) ( not ( = ?auto_1448505 ?auto_1448510 ) ) ( not ( = ?auto_1448505 ?auto_1448511 ) ) ( not ( = ?auto_1448505 ?auto_1448517 ) ) ( not ( = ?auto_1448507 ?auto_1448506 ) ) ( not ( = ?auto_1448507 ?auto_1448508 ) ) ( not ( = ?auto_1448507 ?auto_1448509 ) ) ( not ( = ?auto_1448507 ?auto_1448510 ) ) ( not ( = ?auto_1448507 ?auto_1448511 ) ) ( not ( = ?auto_1448507 ?auto_1448517 ) ) ( not ( = ?auto_1448506 ?auto_1448508 ) ) ( not ( = ?auto_1448506 ?auto_1448509 ) ) ( not ( = ?auto_1448506 ?auto_1448510 ) ) ( not ( = ?auto_1448506 ?auto_1448511 ) ) ( not ( = ?auto_1448506 ?auto_1448517 ) ) ( not ( = ?auto_1448508 ?auto_1448509 ) ) ( not ( = ?auto_1448508 ?auto_1448510 ) ) ( not ( = ?auto_1448508 ?auto_1448511 ) ) ( not ( = ?auto_1448508 ?auto_1448517 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1448509 ?auto_1448510 ?auto_1448511 )
      ( MAKE-10CRATE-VERIFY ?auto_1448502 ?auto_1448503 ?auto_1448504 ?auto_1448501 ?auto_1448505 ?auto_1448507 ?auto_1448506 ?auto_1448508 ?auto_1448509 ?auto_1448510 ?auto_1448511 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1448518 - SURFACE
      ?auto_1448519 - SURFACE
    )
    :vars
    (
      ?auto_1448523 - HOIST
      ?auto_1448524 - PLACE
      ?auto_1448525 - SURFACE
      ?auto_1448522 - PLACE
      ?auto_1448520 - HOIST
      ?auto_1448526 - SURFACE
      ?auto_1448521 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1448523 ?auto_1448524 ) ( IS-CRATE ?auto_1448519 ) ( not ( = ?auto_1448518 ?auto_1448519 ) ) ( not ( = ?auto_1448525 ?auto_1448518 ) ) ( not ( = ?auto_1448525 ?auto_1448519 ) ) ( not ( = ?auto_1448522 ?auto_1448524 ) ) ( HOIST-AT ?auto_1448520 ?auto_1448522 ) ( not ( = ?auto_1448523 ?auto_1448520 ) ) ( SURFACE-AT ?auto_1448519 ?auto_1448522 ) ( ON ?auto_1448519 ?auto_1448526 ) ( CLEAR ?auto_1448519 ) ( not ( = ?auto_1448518 ?auto_1448526 ) ) ( not ( = ?auto_1448519 ?auto_1448526 ) ) ( not ( = ?auto_1448525 ?auto_1448526 ) ) ( SURFACE-AT ?auto_1448525 ?auto_1448524 ) ( CLEAR ?auto_1448525 ) ( IS-CRATE ?auto_1448518 ) ( AVAILABLE ?auto_1448523 ) ( TRUCK-AT ?auto_1448521 ?auto_1448522 ) ( LIFTING ?auto_1448520 ?auto_1448518 ) )
    :subtasks
    ( ( !LOAD ?auto_1448520 ?auto_1448518 ?auto_1448521 ?auto_1448522 )
      ( MAKE-2CRATE ?auto_1448525 ?auto_1448518 ?auto_1448519 )
      ( MAKE-1CRATE-VERIFY ?auto_1448518 ?auto_1448519 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1448527 - SURFACE
      ?auto_1448528 - SURFACE
      ?auto_1448529 - SURFACE
    )
    :vars
    (
      ?auto_1448534 - HOIST
      ?auto_1448533 - PLACE
      ?auto_1448530 - PLACE
      ?auto_1448535 - HOIST
      ?auto_1448531 - SURFACE
      ?auto_1448532 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1448534 ?auto_1448533 ) ( IS-CRATE ?auto_1448529 ) ( not ( = ?auto_1448528 ?auto_1448529 ) ) ( not ( = ?auto_1448527 ?auto_1448528 ) ) ( not ( = ?auto_1448527 ?auto_1448529 ) ) ( not ( = ?auto_1448530 ?auto_1448533 ) ) ( HOIST-AT ?auto_1448535 ?auto_1448530 ) ( not ( = ?auto_1448534 ?auto_1448535 ) ) ( SURFACE-AT ?auto_1448529 ?auto_1448530 ) ( ON ?auto_1448529 ?auto_1448531 ) ( CLEAR ?auto_1448529 ) ( not ( = ?auto_1448528 ?auto_1448531 ) ) ( not ( = ?auto_1448529 ?auto_1448531 ) ) ( not ( = ?auto_1448527 ?auto_1448531 ) ) ( SURFACE-AT ?auto_1448527 ?auto_1448533 ) ( CLEAR ?auto_1448527 ) ( IS-CRATE ?auto_1448528 ) ( AVAILABLE ?auto_1448534 ) ( TRUCK-AT ?auto_1448532 ?auto_1448530 ) ( LIFTING ?auto_1448535 ?auto_1448528 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1448528 ?auto_1448529 )
      ( MAKE-2CRATE-VERIFY ?auto_1448527 ?auto_1448528 ?auto_1448529 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1448537 - SURFACE
      ?auto_1448538 - SURFACE
      ?auto_1448539 - SURFACE
      ?auto_1448536 - SURFACE
    )
    :vars
    (
      ?auto_1448544 - HOIST
      ?auto_1448542 - PLACE
      ?auto_1448545 - PLACE
      ?auto_1448543 - HOIST
      ?auto_1448541 - SURFACE
      ?auto_1448540 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1448544 ?auto_1448542 ) ( IS-CRATE ?auto_1448536 ) ( not ( = ?auto_1448539 ?auto_1448536 ) ) ( not ( = ?auto_1448538 ?auto_1448539 ) ) ( not ( = ?auto_1448538 ?auto_1448536 ) ) ( not ( = ?auto_1448545 ?auto_1448542 ) ) ( HOIST-AT ?auto_1448543 ?auto_1448545 ) ( not ( = ?auto_1448544 ?auto_1448543 ) ) ( SURFACE-AT ?auto_1448536 ?auto_1448545 ) ( ON ?auto_1448536 ?auto_1448541 ) ( CLEAR ?auto_1448536 ) ( not ( = ?auto_1448539 ?auto_1448541 ) ) ( not ( = ?auto_1448536 ?auto_1448541 ) ) ( not ( = ?auto_1448538 ?auto_1448541 ) ) ( SURFACE-AT ?auto_1448538 ?auto_1448542 ) ( CLEAR ?auto_1448538 ) ( IS-CRATE ?auto_1448539 ) ( AVAILABLE ?auto_1448544 ) ( TRUCK-AT ?auto_1448540 ?auto_1448545 ) ( LIFTING ?auto_1448543 ?auto_1448539 ) ( ON ?auto_1448538 ?auto_1448537 ) ( not ( = ?auto_1448537 ?auto_1448538 ) ) ( not ( = ?auto_1448537 ?auto_1448539 ) ) ( not ( = ?auto_1448537 ?auto_1448536 ) ) ( not ( = ?auto_1448537 ?auto_1448541 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1448538 ?auto_1448539 ?auto_1448536 )
      ( MAKE-3CRATE-VERIFY ?auto_1448537 ?auto_1448538 ?auto_1448539 ?auto_1448536 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1448547 - SURFACE
      ?auto_1448548 - SURFACE
      ?auto_1448549 - SURFACE
      ?auto_1448546 - SURFACE
      ?auto_1448550 - SURFACE
    )
    :vars
    (
      ?auto_1448555 - HOIST
      ?auto_1448553 - PLACE
      ?auto_1448556 - PLACE
      ?auto_1448554 - HOIST
      ?auto_1448552 - SURFACE
      ?auto_1448551 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1448555 ?auto_1448553 ) ( IS-CRATE ?auto_1448550 ) ( not ( = ?auto_1448546 ?auto_1448550 ) ) ( not ( = ?auto_1448549 ?auto_1448546 ) ) ( not ( = ?auto_1448549 ?auto_1448550 ) ) ( not ( = ?auto_1448556 ?auto_1448553 ) ) ( HOIST-AT ?auto_1448554 ?auto_1448556 ) ( not ( = ?auto_1448555 ?auto_1448554 ) ) ( SURFACE-AT ?auto_1448550 ?auto_1448556 ) ( ON ?auto_1448550 ?auto_1448552 ) ( CLEAR ?auto_1448550 ) ( not ( = ?auto_1448546 ?auto_1448552 ) ) ( not ( = ?auto_1448550 ?auto_1448552 ) ) ( not ( = ?auto_1448549 ?auto_1448552 ) ) ( SURFACE-AT ?auto_1448549 ?auto_1448553 ) ( CLEAR ?auto_1448549 ) ( IS-CRATE ?auto_1448546 ) ( AVAILABLE ?auto_1448555 ) ( TRUCK-AT ?auto_1448551 ?auto_1448556 ) ( LIFTING ?auto_1448554 ?auto_1448546 ) ( ON ?auto_1448548 ?auto_1448547 ) ( ON ?auto_1448549 ?auto_1448548 ) ( not ( = ?auto_1448547 ?auto_1448548 ) ) ( not ( = ?auto_1448547 ?auto_1448549 ) ) ( not ( = ?auto_1448547 ?auto_1448546 ) ) ( not ( = ?auto_1448547 ?auto_1448550 ) ) ( not ( = ?auto_1448547 ?auto_1448552 ) ) ( not ( = ?auto_1448548 ?auto_1448549 ) ) ( not ( = ?auto_1448548 ?auto_1448546 ) ) ( not ( = ?auto_1448548 ?auto_1448550 ) ) ( not ( = ?auto_1448548 ?auto_1448552 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1448549 ?auto_1448546 ?auto_1448550 )
      ( MAKE-4CRATE-VERIFY ?auto_1448547 ?auto_1448548 ?auto_1448549 ?auto_1448546 ?auto_1448550 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1448558 - SURFACE
      ?auto_1448559 - SURFACE
      ?auto_1448560 - SURFACE
      ?auto_1448557 - SURFACE
      ?auto_1448561 - SURFACE
      ?auto_1448562 - SURFACE
    )
    :vars
    (
      ?auto_1448567 - HOIST
      ?auto_1448565 - PLACE
      ?auto_1448568 - PLACE
      ?auto_1448566 - HOIST
      ?auto_1448564 - SURFACE
      ?auto_1448563 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1448567 ?auto_1448565 ) ( IS-CRATE ?auto_1448562 ) ( not ( = ?auto_1448561 ?auto_1448562 ) ) ( not ( = ?auto_1448557 ?auto_1448561 ) ) ( not ( = ?auto_1448557 ?auto_1448562 ) ) ( not ( = ?auto_1448568 ?auto_1448565 ) ) ( HOIST-AT ?auto_1448566 ?auto_1448568 ) ( not ( = ?auto_1448567 ?auto_1448566 ) ) ( SURFACE-AT ?auto_1448562 ?auto_1448568 ) ( ON ?auto_1448562 ?auto_1448564 ) ( CLEAR ?auto_1448562 ) ( not ( = ?auto_1448561 ?auto_1448564 ) ) ( not ( = ?auto_1448562 ?auto_1448564 ) ) ( not ( = ?auto_1448557 ?auto_1448564 ) ) ( SURFACE-AT ?auto_1448557 ?auto_1448565 ) ( CLEAR ?auto_1448557 ) ( IS-CRATE ?auto_1448561 ) ( AVAILABLE ?auto_1448567 ) ( TRUCK-AT ?auto_1448563 ?auto_1448568 ) ( LIFTING ?auto_1448566 ?auto_1448561 ) ( ON ?auto_1448559 ?auto_1448558 ) ( ON ?auto_1448560 ?auto_1448559 ) ( ON ?auto_1448557 ?auto_1448560 ) ( not ( = ?auto_1448558 ?auto_1448559 ) ) ( not ( = ?auto_1448558 ?auto_1448560 ) ) ( not ( = ?auto_1448558 ?auto_1448557 ) ) ( not ( = ?auto_1448558 ?auto_1448561 ) ) ( not ( = ?auto_1448558 ?auto_1448562 ) ) ( not ( = ?auto_1448558 ?auto_1448564 ) ) ( not ( = ?auto_1448559 ?auto_1448560 ) ) ( not ( = ?auto_1448559 ?auto_1448557 ) ) ( not ( = ?auto_1448559 ?auto_1448561 ) ) ( not ( = ?auto_1448559 ?auto_1448562 ) ) ( not ( = ?auto_1448559 ?auto_1448564 ) ) ( not ( = ?auto_1448560 ?auto_1448557 ) ) ( not ( = ?auto_1448560 ?auto_1448561 ) ) ( not ( = ?auto_1448560 ?auto_1448562 ) ) ( not ( = ?auto_1448560 ?auto_1448564 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1448557 ?auto_1448561 ?auto_1448562 )
      ( MAKE-5CRATE-VERIFY ?auto_1448558 ?auto_1448559 ?auto_1448560 ?auto_1448557 ?auto_1448561 ?auto_1448562 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1448570 - SURFACE
      ?auto_1448571 - SURFACE
      ?auto_1448572 - SURFACE
      ?auto_1448569 - SURFACE
      ?auto_1448573 - SURFACE
      ?auto_1448575 - SURFACE
      ?auto_1448574 - SURFACE
    )
    :vars
    (
      ?auto_1448580 - HOIST
      ?auto_1448578 - PLACE
      ?auto_1448581 - PLACE
      ?auto_1448579 - HOIST
      ?auto_1448577 - SURFACE
      ?auto_1448576 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1448580 ?auto_1448578 ) ( IS-CRATE ?auto_1448574 ) ( not ( = ?auto_1448575 ?auto_1448574 ) ) ( not ( = ?auto_1448573 ?auto_1448575 ) ) ( not ( = ?auto_1448573 ?auto_1448574 ) ) ( not ( = ?auto_1448581 ?auto_1448578 ) ) ( HOIST-AT ?auto_1448579 ?auto_1448581 ) ( not ( = ?auto_1448580 ?auto_1448579 ) ) ( SURFACE-AT ?auto_1448574 ?auto_1448581 ) ( ON ?auto_1448574 ?auto_1448577 ) ( CLEAR ?auto_1448574 ) ( not ( = ?auto_1448575 ?auto_1448577 ) ) ( not ( = ?auto_1448574 ?auto_1448577 ) ) ( not ( = ?auto_1448573 ?auto_1448577 ) ) ( SURFACE-AT ?auto_1448573 ?auto_1448578 ) ( CLEAR ?auto_1448573 ) ( IS-CRATE ?auto_1448575 ) ( AVAILABLE ?auto_1448580 ) ( TRUCK-AT ?auto_1448576 ?auto_1448581 ) ( LIFTING ?auto_1448579 ?auto_1448575 ) ( ON ?auto_1448571 ?auto_1448570 ) ( ON ?auto_1448572 ?auto_1448571 ) ( ON ?auto_1448569 ?auto_1448572 ) ( ON ?auto_1448573 ?auto_1448569 ) ( not ( = ?auto_1448570 ?auto_1448571 ) ) ( not ( = ?auto_1448570 ?auto_1448572 ) ) ( not ( = ?auto_1448570 ?auto_1448569 ) ) ( not ( = ?auto_1448570 ?auto_1448573 ) ) ( not ( = ?auto_1448570 ?auto_1448575 ) ) ( not ( = ?auto_1448570 ?auto_1448574 ) ) ( not ( = ?auto_1448570 ?auto_1448577 ) ) ( not ( = ?auto_1448571 ?auto_1448572 ) ) ( not ( = ?auto_1448571 ?auto_1448569 ) ) ( not ( = ?auto_1448571 ?auto_1448573 ) ) ( not ( = ?auto_1448571 ?auto_1448575 ) ) ( not ( = ?auto_1448571 ?auto_1448574 ) ) ( not ( = ?auto_1448571 ?auto_1448577 ) ) ( not ( = ?auto_1448572 ?auto_1448569 ) ) ( not ( = ?auto_1448572 ?auto_1448573 ) ) ( not ( = ?auto_1448572 ?auto_1448575 ) ) ( not ( = ?auto_1448572 ?auto_1448574 ) ) ( not ( = ?auto_1448572 ?auto_1448577 ) ) ( not ( = ?auto_1448569 ?auto_1448573 ) ) ( not ( = ?auto_1448569 ?auto_1448575 ) ) ( not ( = ?auto_1448569 ?auto_1448574 ) ) ( not ( = ?auto_1448569 ?auto_1448577 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1448573 ?auto_1448575 ?auto_1448574 )
      ( MAKE-6CRATE-VERIFY ?auto_1448570 ?auto_1448571 ?auto_1448572 ?auto_1448569 ?auto_1448573 ?auto_1448575 ?auto_1448574 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1448583 - SURFACE
      ?auto_1448584 - SURFACE
      ?auto_1448585 - SURFACE
      ?auto_1448582 - SURFACE
      ?auto_1448586 - SURFACE
      ?auto_1448588 - SURFACE
      ?auto_1448587 - SURFACE
      ?auto_1448589 - SURFACE
    )
    :vars
    (
      ?auto_1448594 - HOIST
      ?auto_1448592 - PLACE
      ?auto_1448595 - PLACE
      ?auto_1448593 - HOIST
      ?auto_1448591 - SURFACE
      ?auto_1448590 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1448594 ?auto_1448592 ) ( IS-CRATE ?auto_1448589 ) ( not ( = ?auto_1448587 ?auto_1448589 ) ) ( not ( = ?auto_1448588 ?auto_1448587 ) ) ( not ( = ?auto_1448588 ?auto_1448589 ) ) ( not ( = ?auto_1448595 ?auto_1448592 ) ) ( HOIST-AT ?auto_1448593 ?auto_1448595 ) ( not ( = ?auto_1448594 ?auto_1448593 ) ) ( SURFACE-AT ?auto_1448589 ?auto_1448595 ) ( ON ?auto_1448589 ?auto_1448591 ) ( CLEAR ?auto_1448589 ) ( not ( = ?auto_1448587 ?auto_1448591 ) ) ( not ( = ?auto_1448589 ?auto_1448591 ) ) ( not ( = ?auto_1448588 ?auto_1448591 ) ) ( SURFACE-AT ?auto_1448588 ?auto_1448592 ) ( CLEAR ?auto_1448588 ) ( IS-CRATE ?auto_1448587 ) ( AVAILABLE ?auto_1448594 ) ( TRUCK-AT ?auto_1448590 ?auto_1448595 ) ( LIFTING ?auto_1448593 ?auto_1448587 ) ( ON ?auto_1448584 ?auto_1448583 ) ( ON ?auto_1448585 ?auto_1448584 ) ( ON ?auto_1448582 ?auto_1448585 ) ( ON ?auto_1448586 ?auto_1448582 ) ( ON ?auto_1448588 ?auto_1448586 ) ( not ( = ?auto_1448583 ?auto_1448584 ) ) ( not ( = ?auto_1448583 ?auto_1448585 ) ) ( not ( = ?auto_1448583 ?auto_1448582 ) ) ( not ( = ?auto_1448583 ?auto_1448586 ) ) ( not ( = ?auto_1448583 ?auto_1448588 ) ) ( not ( = ?auto_1448583 ?auto_1448587 ) ) ( not ( = ?auto_1448583 ?auto_1448589 ) ) ( not ( = ?auto_1448583 ?auto_1448591 ) ) ( not ( = ?auto_1448584 ?auto_1448585 ) ) ( not ( = ?auto_1448584 ?auto_1448582 ) ) ( not ( = ?auto_1448584 ?auto_1448586 ) ) ( not ( = ?auto_1448584 ?auto_1448588 ) ) ( not ( = ?auto_1448584 ?auto_1448587 ) ) ( not ( = ?auto_1448584 ?auto_1448589 ) ) ( not ( = ?auto_1448584 ?auto_1448591 ) ) ( not ( = ?auto_1448585 ?auto_1448582 ) ) ( not ( = ?auto_1448585 ?auto_1448586 ) ) ( not ( = ?auto_1448585 ?auto_1448588 ) ) ( not ( = ?auto_1448585 ?auto_1448587 ) ) ( not ( = ?auto_1448585 ?auto_1448589 ) ) ( not ( = ?auto_1448585 ?auto_1448591 ) ) ( not ( = ?auto_1448582 ?auto_1448586 ) ) ( not ( = ?auto_1448582 ?auto_1448588 ) ) ( not ( = ?auto_1448582 ?auto_1448587 ) ) ( not ( = ?auto_1448582 ?auto_1448589 ) ) ( not ( = ?auto_1448582 ?auto_1448591 ) ) ( not ( = ?auto_1448586 ?auto_1448588 ) ) ( not ( = ?auto_1448586 ?auto_1448587 ) ) ( not ( = ?auto_1448586 ?auto_1448589 ) ) ( not ( = ?auto_1448586 ?auto_1448591 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1448588 ?auto_1448587 ?auto_1448589 )
      ( MAKE-7CRATE-VERIFY ?auto_1448583 ?auto_1448584 ?auto_1448585 ?auto_1448582 ?auto_1448586 ?auto_1448588 ?auto_1448587 ?auto_1448589 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1448597 - SURFACE
      ?auto_1448598 - SURFACE
      ?auto_1448599 - SURFACE
      ?auto_1448596 - SURFACE
      ?auto_1448600 - SURFACE
      ?auto_1448602 - SURFACE
      ?auto_1448601 - SURFACE
      ?auto_1448603 - SURFACE
      ?auto_1448604 - SURFACE
    )
    :vars
    (
      ?auto_1448609 - HOIST
      ?auto_1448607 - PLACE
      ?auto_1448610 - PLACE
      ?auto_1448608 - HOIST
      ?auto_1448606 - SURFACE
      ?auto_1448605 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1448609 ?auto_1448607 ) ( IS-CRATE ?auto_1448604 ) ( not ( = ?auto_1448603 ?auto_1448604 ) ) ( not ( = ?auto_1448601 ?auto_1448603 ) ) ( not ( = ?auto_1448601 ?auto_1448604 ) ) ( not ( = ?auto_1448610 ?auto_1448607 ) ) ( HOIST-AT ?auto_1448608 ?auto_1448610 ) ( not ( = ?auto_1448609 ?auto_1448608 ) ) ( SURFACE-AT ?auto_1448604 ?auto_1448610 ) ( ON ?auto_1448604 ?auto_1448606 ) ( CLEAR ?auto_1448604 ) ( not ( = ?auto_1448603 ?auto_1448606 ) ) ( not ( = ?auto_1448604 ?auto_1448606 ) ) ( not ( = ?auto_1448601 ?auto_1448606 ) ) ( SURFACE-AT ?auto_1448601 ?auto_1448607 ) ( CLEAR ?auto_1448601 ) ( IS-CRATE ?auto_1448603 ) ( AVAILABLE ?auto_1448609 ) ( TRUCK-AT ?auto_1448605 ?auto_1448610 ) ( LIFTING ?auto_1448608 ?auto_1448603 ) ( ON ?auto_1448598 ?auto_1448597 ) ( ON ?auto_1448599 ?auto_1448598 ) ( ON ?auto_1448596 ?auto_1448599 ) ( ON ?auto_1448600 ?auto_1448596 ) ( ON ?auto_1448602 ?auto_1448600 ) ( ON ?auto_1448601 ?auto_1448602 ) ( not ( = ?auto_1448597 ?auto_1448598 ) ) ( not ( = ?auto_1448597 ?auto_1448599 ) ) ( not ( = ?auto_1448597 ?auto_1448596 ) ) ( not ( = ?auto_1448597 ?auto_1448600 ) ) ( not ( = ?auto_1448597 ?auto_1448602 ) ) ( not ( = ?auto_1448597 ?auto_1448601 ) ) ( not ( = ?auto_1448597 ?auto_1448603 ) ) ( not ( = ?auto_1448597 ?auto_1448604 ) ) ( not ( = ?auto_1448597 ?auto_1448606 ) ) ( not ( = ?auto_1448598 ?auto_1448599 ) ) ( not ( = ?auto_1448598 ?auto_1448596 ) ) ( not ( = ?auto_1448598 ?auto_1448600 ) ) ( not ( = ?auto_1448598 ?auto_1448602 ) ) ( not ( = ?auto_1448598 ?auto_1448601 ) ) ( not ( = ?auto_1448598 ?auto_1448603 ) ) ( not ( = ?auto_1448598 ?auto_1448604 ) ) ( not ( = ?auto_1448598 ?auto_1448606 ) ) ( not ( = ?auto_1448599 ?auto_1448596 ) ) ( not ( = ?auto_1448599 ?auto_1448600 ) ) ( not ( = ?auto_1448599 ?auto_1448602 ) ) ( not ( = ?auto_1448599 ?auto_1448601 ) ) ( not ( = ?auto_1448599 ?auto_1448603 ) ) ( not ( = ?auto_1448599 ?auto_1448604 ) ) ( not ( = ?auto_1448599 ?auto_1448606 ) ) ( not ( = ?auto_1448596 ?auto_1448600 ) ) ( not ( = ?auto_1448596 ?auto_1448602 ) ) ( not ( = ?auto_1448596 ?auto_1448601 ) ) ( not ( = ?auto_1448596 ?auto_1448603 ) ) ( not ( = ?auto_1448596 ?auto_1448604 ) ) ( not ( = ?auto_1448596 ?auto_1448606 ) ) ( not ( = ?auto_1448600 ?auto_1448602 ) ) ( not ( = ?auto_1448600 ?auto_1448601 ) ) ( not ( = ?auto_1448600 ?auto_1448603 ) ) ( not ( = ?auto_1448600 ?auto_1448604 ) ) ( not ( = ?auto_1448600 ?auto_1448606 ) ) ( not ( = ?auto_1448602 ?auto_1448601 ) ) ( not ( = ?auto_1448602 ?auto_1448603 ) ) ( not ( = ?auto_1448602 ?auto_1448604 ) ) ( not ( = ?auto_1448602 ?auto_1448606 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1448601 ?auto_1448603 ?auto_1448604 )
      ( MAKE-8CRATE-VERIFY ?auto_1448597 ?auto_1448598 ?auto_1448599 ?auto_1448596 ?auto_1448600 ?auto_1448602 ?auto_1448601 ?auto_1448603 ?auto_1448604 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1448612 - SURFACE
      ?auto_1448613 - SURFACE
      ?auto_1448614 - SURFACE
      ?auto_1448611 - SURFACE
      ?auto_1448615 - SURFACE
      ?auto_1448617 - SURFACE
      ?auto_1448616 - SURFACE
      ?auto_1448618 - SURFACE
      ?auto_1448619 - SURFACE
      ?auto_1448620 - SURFACE
    )
    :vars
    (
      ?auto_1448625 - HOIST
      ?auto_1448623 - PLACE
      ?auto_1448626 - PLACE
      ?auto_1448624 - HOIST
      ?auto_1448622 - SURFACE
      ?auto_1448621 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1448625 ?auto_1448623 ) ( IS-CRATE ?auto_1448620 ) ( not ( = ?auto_1448619 ?auto_1448620 ) ) ( not ( = ?auto_1448618 ?auto_1448619 ) ) ( not ( = ?auto_1448618 ?auto_1448620 ) ) ( not ( = ?auto_1448626 ?auto_1448623 ) ) ( HOIST-AT ?auto_1448624 ?auto_1448626 ) ( not ( = ?auto_1448625 ?auto_1448624 ) ) ( SURFACE-AT ?auto_1448620 ?auto_1448626 ) ( ON ?auto_1448620 ?auto_1448622 ) ( CLEAR ?auto_1448620 ) ( not ( = ?auto_1448619 ?auto_1448622 ) ) ( not ( = ?auto_1448620 ?auto_1448622 ) ) ( not ( = ?auto_1448618 ?auto_1448622 ) ) ( SURFACE-AT ?auto_1448618 ?auto_1448623 ) ( CLEAR ?auto_1448618 ) ( IS-CRATE ?auto_1448619 ) ( AVAILABLE ?auto_1448625 ) ( TRUCK-AT ?auto_1448621 ?auto_1448626 ) ( LIFTING ?auto_1448624 ?auto_1448619 ) ( ON ?auto_1448613 ?auto_1448612 ) ( ON ?auto_1448614 ?auto_1448613 ) ( ON ?auto_1448611 ?auto_1448614 ) ( ON ?auto_1448615 ?auto_1448611 ) ( ON ?auto_1448617 ?auto_1448615 ) ( ON ?auto_1448616 ?auto_1448617 ) ( ON ?auto_1448618 ?auto_1448616 ) ( not ( = ?auto_1448612 ?auto_1448613 ) ) ( not ( = ?auto_1448612 ?auto_1448614 ) ) ( not ( = ?auto_1448612 ?auto_1448611 ) ) ( not ( = ?auto_1448612 ?auto_1448615 ) ) ( not ( = ?auto_1448612 ?auto_1448617 ) ) ( not ( = ?auto_1448612 ?auto_1448616 ) ) ( not ( = ?auto_1448612 ?auto_1448618 ) ) ( not ( = ?auto_1448612 ?auto_1448619 ) ) ( not ( = ?auto_1448612 ?auto_1448620 ) ) ( not ( = ?auto_1448612 ?auto_1448622 ) ) ( not ( = ?auto_1448613 ?auto_1448614 ) ) ( not ( = ?auto_1448613 ?auto_1448611 ) ) ( not ( = ?auto_1448613 ?auto_1448615 ) ) ( not ( = ?auto_1448613 ?auto_1448617 ) ) ( not ( = ?auto_1448613 ?auto_1448616 ) ) ( not ( = ?auto_1448613 ?auto_1448618 ) ) ( not ( = ?auto_1448613 ?auto_1448619 ) ) ( not ( = ?auto_1448613 ?auto_1448620 ) ) ( not ( = ?auto_1448613 ?auto_1448622 ) ) ( not ( = ?auto_1448614 ?auto_1448611 ) ) ( not ( = ?auto_1448614 ?auto_1448615 ) ) ( not ( = ?auto_1448614 ?auto_1448617 ) ) ( not ( = ?auto_1448614 ?auto_1448616 ) ) ( not ( = ?auto_1448614 ?auto_1448618 ) ) ( not ( = ?auto_1448614 ?auto_1448619 ) ) ( not ( = ?auto_1448614 ?auto_1448620 ) ) ( not ( = ?auto_1448614 ?auto_1448622 ) ) ( not ( = ?auto_1448611 ?auto_1448615 ) ) ( not ( = ?auto_1448611 ?auto_1448617 ) ) ( not ( = ?auto_1448611 ?auto_1448616 ) ) ( not ( = ?auto_1448611 ?auto_1448618 ) ) ( not ( = ?auto_1448611 ?auto_1448619 ) ) ( not ( = ?auto_1448611 ?auto_1448620 ) ) ( not ( = ?auto_1448611 ?auto_1448622 ) ) ( not ( = ?auto_1448615 ?auto_1448617 ) ) ( not ( = ?auto_1448615 ?auto_1448616 ) ) ( not ( = ?auto_1448615 ?auto_1448618 ) ) ( not ( = ?auto_1448615 ?auto_1448619 ) ) ( not ( = ?auto_1448615 ?auto_1448620 ) ) ( not ( = ?auto_1448615 ?auto_1448622 ) ) ( not ( = ?auto_1448617 ?auto_1448616 ) ) ( not ( = ?auto_1448617 ?auto_1448618 ) ) ( not ( = ?auto_1448617 ?auto_1448619 ) ) ( not ( = ?auto_1448617 ?auto_1448620 ) ) ( not ( = ?auto_1448617 ?auto_1448622 ) ) ( not ( = ?auto_1448616 ?auto_1448618 ) ) ( not ( = ?auto_1448616 ?auto_1448619 ) ) ( not ( = ?auto_1448616 ?auto_1448620 ) ) ( not ( = ?auto_1448616 ?auto_1448622 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1448618 ?auto_1448619 ?auto_1448620 )
      ( MAKE-9CRATE-VERIFY ?auto_1448612 ?auto_1448613 ?auto_1448614 ?auto_1448611 ?auto_1448615 ?auto_1448617 ?auto_1448616 ?auto_1448618 ?auto_1448619 ?auto_1448620 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1448628 - SURFACE
      ?auto_1448629 - SURFACE
      ?auto_1448630 - SURFACE
      ?auto_1448627 - SURFACE
      ?auto_1448631 - SURFACE
      ?auto_1448633 - SURFACE
      ?auto_1448632 - SURFACE
      ?auto_1448634 - SURFACE
      ?auto_1448635 - SURFACE
      ?auto_1448636 - SURFACE
      ?auto_1448637 - SURFACE
    )
    :vars
    (
      ?auto_1448642 - HOIST
      ?auto_1448640 - PLACE
      ?auto_1448643 - PLACE
      ?auto_1448641 - HOIST
      ?auto_1448639 - SURFACE
      ?auto_1448638 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1448642 ?auto_1448640 ) ( IS-CRATE ?auto_1448637 ) ( not ( = ?auto_1448636 ?auto_1448637 ) ) ( not ( = ?auto_1448635 ?auto_1448636 ) ) ( not ( = ?auto_1448635 ?auto_1448637 ) ) ( not ( = ?auto_1448643 ?auto_1448640 ) ) ( HOIST-AT ?auto_1448641 ?auto_1448643 ) ( not ( = ?auto_1448642 ?auto_1448641 ) ) ( SURFACE-AT ?auto_1448637 ?auto_1448643 ) ( ON ?auto_1448637 ?auto_1448639 ) ( CLEAR ?auto_1448637 ) ( not ( = ?auto_1448636 ?auto_1448639 ) ) ( not ( = ?auto_1448637 ?auto_1448639 ) ) ( not ( = ?auto_1448635 ?auto_1448639 ) ) ( SURFACE-AT ?auto_1448635 ?auto_1448640 ) ( CLEAR ?auto_1448635 ) ( IS-CRATE ?auto_1448636 ) ( AVAILABLE ?auto_1448642 ) ( TRUCK-AT ?auto_1448638 ?auto_1448643 ) ( LIFTING ?auto_1448641 ?auto_1448636 ) ( ON ?auto_1448629 ?auto_1448628 ) ( ON ?auto_1448630 ?auto_1448629 ) ( ON ?auto_1448627 ?auto_1448630 ) ( ON ?auto_1448631 ?auto_1448627 ) ( ON ?auto_1448633 ?auto_1448631 ) ( ON ?auto_1448632 ?auto_1448633 ) ( ON ?auto_1448634 ?auto_1448632 ) ( ON ?auto_1448635 ?auto_1448634 ) ( not ( = ?auto_1448628 ?auto_1448629 ) ) ( not ( = ?auto_1448628 ?auto_1448630 ) ) ( not ( = ?auto_1448628 ?auto_1448627 ) ) ( not ( = ?auto_1448628 ?auto_1448631 ) ) ( not ( = ?auto_1448628 ?auto_1448633 ) ) ( not ( = ?auto_1448628 ?auto_1448632 ) ) ( not ( = ?auto_1448628 ?auto_1448634 ) ) ( not ( = ?auto_1448628 ?auto_1448635 ) ) ( not ( = ?auto_1448628 ?auto_1448636 ) ) ( not ( = ?auto_1448628 ?auto_1448637 ) ) ( not ( = ?auto_1448628 ?auto_1448639 ) ) ( not ( = ?auto_1448629 ?auto_1448630 ) ) ( not ( = ?auto_1448629 ?auto_1448627 ) ) ( not ( = ?auto_1448629 ?auto_1448631 ) ) ( not ( = ?auto_1448629 ?auto_1448633 ) ) ( not ( = ?auto_1448629 ?auto_1448632 ) ) ( not ( = ?auto_1448629 ?auto_1448634 ) ) ( not ( = ?auto_1448629 ?auto_1448635 ) ) ( not ( = ?auto_1448629 ?auto_1448636 ) ) ( not ( = ?auto_1448629 ?auto_1448637 ) ) ( not ( = ?auto_1448629 ?auto_1448639 ) ) ( not ( = ?auto_1448630 ?auto_1448627 ) ) ( not ( = ?auto_1448630 ?auto_1448631 ) ) ( not ( = ?auto_1448630 ?auto_1448633 ) ) ( not ( = ?auto_1448630 ?auto_1448632 ) ) ( not ( = ?auto_1448630 ?auto_1448634 ) ) ( not ( = ?auto_1448630 ?auto_1448635 ) ) ( not ( = ?auto_1448630 ?auto_1448636 ) ) ( not ( = ?auto_1448630 ?auto_1448637 ) ) ( not ( = ?auto_1448630 ?auto_1448639 ) ) ( not ( = ?auto_1448627 ?auto_1448631 ) ) ( not ( = ?auto_1448627 ?auto_1448633 ) ) ( not ( = ?auto_1448627 ?auto_1448632 ) ) ( not ( = ?auto_1448627 ?auto_1448634 ) ) ( not ( = ?auto_1448627 ?auto_1448635 ) ) ( not ( = ?auto_1448627 ?auto_1448636 ) ) ( not ( = ?auto_1448627 ?auto_1448637 ) ) ( not ( = ?auto_1448627 ?auto_1448639 ) ) ( not ( = ?auto_1448631 ?auto_1448633 ) ) ( not ( = ?auto_1448631 ?auto_1448632 ) ) ( not ( = ?auto_1448631 ?auto_1448634 ) ) ( not ( = ?auto_1448631 ?auto_1448635 ) ) ( not ( = ?auto_1448631 ?auto_1448636 ) ) ( not ( = ?auto_1448631 ?auto_1448637 ) ) ( not ( = ?auto_1448631 ?auto_1448639 ) ) ( not ( = ?auto_1448633 ?auto_1448632 ) ) ( not ( = ?auto_1448633 ?auto_1448634 ) ) ( not ( = ?auto_1448633 ?auto_1448635 ) ) ( not ( = ?auto_1448633 ?auto_1448636 ) ) ( not ( = ?auto_1448633 ?auto_1448637 ) ) ( not ( = ?auto_1448633 ?auto_1448639 ) ) ( not ( = ?auto_1448632 ?auto_1448634 ) ) ( not ( = ?auto_1448632 ?auto_1448635 ) ) ( not ( = ?auto_1448632 ?auto_1448636 ) ) ( not ( = ?auto_1448632 ?auto_1448637 ) ) ( not ( = ?auto_1448632 ?auto_1448639 ) ) ( not ( = ?auto_1448634 ?auto_1448635 ) ) ( not ( = ?auto_1448634 ?auto_1448636 ) ) ( not ( = ?auto_1448634 ?auto_1448637 ) ) ( not ( = ?auto_1448634 ?auto_1448639 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1448635 ?auto_1448636 ?auto_1448637 )
      ( MAKE-10CRATE-VERIFY ?auto_1448628 ?auto_1448629 ?auto_1448630 ?auto_1448627 ?auto_1448631 ?auto_1448633 ?auto_1448632 ?auto_1448634 ?auto_1448635 ?auto_1448636 ?auto_1448637 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1448644 - SURFACE
      ?auto_1448645 - SURFACE
    )
    :vars
    (
      ?auto_1448651 - HOIST
      ?auto_1448649 - PLACE
      ?auto_1448646 - SURFACE
      ?auto_1448652 - PLACE
      ?auto_1448650 - HOIST
      ?auto_1448648 - SURFACE
      ?auto_1448647 - TRUCK
      ?auto_1448653 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1448651 ?auto_1448649 ) ( IS-CRATE ?auto_1448645 ) ( not ( = ?auto_1448644 ?auto_1448645 ) ) ( not ( = ?auto_1448646 ?auto_1448644 ) ) ( not ( = ?auto_1448646 ?auto_1448645 ) ) ( not ( = ?auto_1448652 ?auto_1448649 ) ) ( HOIST-AT ?auto_1448650 ?auto_1448652 ) ( not ( = ?auto_1448651 ?auto_1448650 ) ) ( SURFACE-AT ?auto_1448645 ?auto_1448652 ) ( ON ?auto_1448645 ?auto_1448648 ) ( CLEAR ?auto_1448645 ) ( not ( = ?auto_1448644 ?auto_1448648 ) ) ( not ( = ?auto_1448645 ?auto_1448648 ) ) ( not ( = ?auto_1448646 ?auto_1448648 ) ) ( SURFACE-AT ?auto_1448646 ?auto_1448649 ) ( CLEAR ?auto_1448646 ) ( IS-CRATE ?auto_1448644 ) ( AVAILABLE ?auto_1448651 ) ( TRUCK-AT ?auto_1448647 ?auto_1448652 ) ( AVAILABLE ?auto_1448650 ) ( SURFACE-AT ?auto_1448644 ?auto_1448652 ) ( ON ?auto_1448644 ?auto_1448653 ) ( CLEAR ?auto_1448644 ) ( not ( = ?auto_1448644 ?auto_1448653 ) ) ( not ( = ?auto_1448645 ?auto_1448653 ) ) ( not ( = ?auto_1448646 ?auto_1448653 ) ) ( not ( = ?auto_1448648 ?auto_1448653 ) ) )
    :subtasks
    ( ( !LIFT ?auto_1448650 ?auto_1448644 ?auto_1448653 ?auto_1448652 )
      ( MAKE-2CRATE ?auto_1448646 ?auto_1448644 ?auto_1448645 )
      ( MAKE-1CRATE-VERIFY ?auto_1448644 ?auto_1448645 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1448654 - SURFACE
      ?auto_1448655 - SURFACE
      ?auto_1448656 - SURFACE
    )
    :vars
    (
      ?auto_1448658 - HOIST
      ?auto_1448662 - PLACE
      ?auto_1448661 - PLACE
      ?auto_1448663 - HOIST
      ?auto_1448657 - SURFACE
      ?auto_1448659 - TRUCK
      ?auto_1448660 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1448658 ?auto_1448662 ) ( IS-CRATE ?auto_1448656 ) ( not ( = ?auto_1448655 ?auto_1448656 ) ) ( not ( = ?auto_1448654 ?auto_1448655 ) ) ( not ( = ?auto_1448654 ?auto_1448656 ) ) ( not ( = ?auto_1448661 ?auto_1448662 ) ) ( HOIST-AT ?auto_1448663 ?auto_1448661 ) ( not ( = ?auto_1448658 ?auto_1448663 ) ) ( SURFACE-AT ?auto_1448656 ?auto_1448661 ) ( ON ?auto_1448656 ?auto_1448657 ) ( CLEAR ?auto_1448656 ) ( not ( = ?auto_1448655 ?auto_1448657 ) ) ( not ( = ?auto_1448656 ?auto_1448657 ) ) ( not ( = ?auto_1448654 ?auto_1448657 ) ) ( SURFACE-AT ?auto_1448654 ?auto_1448662 ) ( CLEAR ?auto_1448654 ) ( IS-CRATE ?auto_1448655 ) ( AVAILABLE ?auto_1448658 ) ( TRUCK-AT ?auto_1448659 ?auto_1448661 ) ( AVAILABLE ?auto_1448663 ) ( SURFACE-AT ?auto_1448655 ?auto_1448661 ) ( ON ?auto_1448655 ?auto_1448660 ) ( CLEAR ?auto_1448655 ) ( not ( = ?auto_1448655 ?auto_1448660 ) ) ( not ( = ?auto_1448656 ?auto_1448660 ) ) ( not ( = ?auto_1448654 ?auto_1448660 ) ) ( not ( = ?auto_1448657 ?auto_1448660 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1448655 ?auto_1448656 )
      ( MAKE-2CRATE-VERIFY ?auto_1448654 ?auto_1448655 ?auto_1448656 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1448665 - SURFACE
      ?auto_1448666 - SURFACE
      ?auto_1448667 - SURFACE
      ?auto_1448664 - SURFACE
    )
    :vars
    (
      ?auto_1448670 - HOIST
      ?auto_1448671 - PLACE
      ?auto_1448672 - PLACE
      ?auto_1448668 - HOIST
      ?auto_1448674 - SURFACE
      ?auto_1448673 - TRUCK
      ?auto_1448669 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1448670 ?auto_1448671 ) ( IS-CRATE ?auto_1448664 ) ( not ( = ?auto_1448667 ?auto_1448664 ) ) ( not ( = ?auto_1448666 ?auto_1448667 ) ) ( not ( = ?auto_1448666 ?auto_1448664 ) ) ( not ( = ?auto_1448672 ?auto_1448671 ) ) ( HOIST-AT ?auto_1448668 ?auto_1448672 ) ( not ( = ?auto_1448670 ?auto_1448668 ) ) ( SURFACE-AT ?auto_1448664 ?auto_1448672 ) ( ON ?auto_1448664 ?auto_1448674 ) ( CLEAR ?auto_1448664 ) ( not ( = ?auto_1448667 ?auto_1448674 ) ) ( not ( = ?auto_1448664 ?auto_1448674 ) ) ( not ( = ?auto_1448666 ?auto_1448674 ) ) ( SURFACE-AT ?auto_1448666 ?auto_1448671 ) ( CLEAR ?auto_1448666 ) ( IS-CRATE ?auto_1448667 ) ( AVAILABLE ?auto_1448670 ) ( TRUCK-AT ?auto_1448673 ?auto_1448672 ) ( AVAILABLE ?auto_1448668 ) ( SURFACE-AT ?auto_1448667 ?auto_1448672 ) ( ON ?auto_1448667 ?auto_1448669 ) ( CLEAR ?auto_1448667 ) ( not ( = ?auto_1448667 ?auto_1448669 ) ) ( not ( = ?auto_1448664 ?auto_1448669 ) ) ( not ( = ?auto_1448666 ?auto_1448669 ) ) ( not ( = ?auto_1448674 ?auto_1448669 ) ) ( ON ?auto_1448666 ?auto_1448665 ) ( not ( = ?auto_1448665 ?auto_1448666 ) ) ( not ( = ?auto_1448665 ?auto_1448667 ) ) ( not ( = ?auto_1448665 ?auto_1448664 ) ) ( not ( = ?auto_1448665 ?auto_1448674 ) ) ( not ( = ?auto_1448665 ?auto_1448669 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1448666 ?auto_1448667 ?auto_1448664 )
      ( MAKE-3CRATE-VERIFY ?auto_1448665 ?auto_1448666 ?auto_1448667 ?auto_1448664 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1448676 - SURFACE
      ?auto_1448677 - SURFACE
      ?auto_1448678 - SURFACE
      ?auto_1448675 - SURFACE
      ?auto_1448679 - SURFACE
    )
    :vars
    (
      ?auto_1448682 - HOIST
      ?auto_1448683 - PLACE
      ?auto_1448684 - PLACE
      ?auto_1448680 - HOIST
      ?auto_1448686 - SURFACE
      ?auto_1448685 - TRUCK
      ?auto_1448681 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1448682 ?auto_1448683 ) ( IS-CRATE ?auto_1448679 ) ( not ( = ?auto_1448675 ?auto_1448679 ) ) ( not ( = ?auto_1448678 ?auto_1448675 ) ) ( not ( = ?auto_1448678 ?auto_1448679 ) ) ( not ( = ?auto_1448684 ?auto_1448683 ) ) ( HOIST-AT ?auto_1448680 ?auto_1448684 ) ( not ( = ?auto_1448682 ?auto_1448680 ) ) ( SURFACE-AT ?auto_1448679 ?auto_1448684 ) ( ON ?auto_1448679 ?auto_1448686 ) ( CLEAR ?auto_1448679 ) ( not ( = ?auto_1448675 ?auto_1448686 ) ) ( not ( = ?auto_1448679 ?auto_1448686 ) ) ( not ( = ?auto_1448678 ?auto_1448686 ) ) ( SURFACE-AT ?auto_1448678 ?auto_1448683 ) ( CLEAR ?auto_1448678 ) ( IS-CRATE ?auto_1448675 ) ( AVAILABLE ?auto_1448682 ) ( TRUCK-AT ?auto_1448685 ?auto_1448684 ) ( AVAILABLE ?auto_1448680 ) ( SURFACE-AT ?auto_1448675 ?auto_1448684 ) ( ON ?auto_1448675 ?auto_1448681 ) ( CLEAR ?auto_1448675 ) ( not ( = ?auto_1448675 ?auto_1448681 ) ) ( not ( = ?auto_1448679 ?auto_1448681 ) ) ( not ( = ?auto_1448678 ?auto_1448681 ) ) ( not ( = ?auto_1448686 ?auto_1448681 ) ) ( ON ?auto_1448677 ?auto_1448676 ) ( ON ?auto_1448678 ?auto_1448677 ) ( not ( = ?auto_1448676 ?auto_1448677 ) ) ( not ( = ?auto_1448676 ?auto_1448678 ) ) ( not ( = ?auto_1448676 ?auto_1448675 ) ) ( not ( = ?auto_1448676 ?auto_1448679 ) ) ( not ( = ?auto_1448676 ?auto_1448686 ) ) ( not ( = ?auto_1448676 ?auto_1448681 ) ) ( not ( = ?auto_1448677 ?auto_1448678 ) ) ( not ( = ?auto_1448677 ?auto_1448675 ) ) ( not ( = ?auto_1448677 ?auto_1448679 ) ) ( not ( = ?auto_1448677 ?auto_1448686 ) ) ( not ( = ?auto_1448677 ?auto_1448681 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1448678 ?auto_1448675 ?auto_1448679 )
      ( MAKE-4CRATE-VERIFY ?auto_1448676 ?auto_1448677 ?auto_1448678 ?auto_1448675 ?auto_1448679 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1448688 - SURFACE
      ?auto_1448689 - SURFACE
      ?auto_1448690 - SURFACE
      ?auto_1448687 - SURFACE
      ?auto_1448691 - SURFACE
      ?auto_1448692 - SURFACE
    )
    :vars
    (
      ?auto_1448695 - HOIST
      ?auto_1448696 - PLACE
      ?auto_1448697 - PLACE
      ?auto_1448693 - HOIST
      ?auto_1448699 - SURFACE
      ?auto_1448698 - TRUCK
      ?auto_1448694 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1448695 ?auto_1448696 ) ( IS-CRATE ?auto_1448692 ) ( not ( = ?auto_1448691 ?auto_1448692 ) ) ( not ( = ?auto_1448687 ?auto_1448691 ) ) ( not ( = ?auto_1448687 ?auto_1448692 ) ) ( not ( = ?auto_1448697 ?auto_1448696 ) ) ( HOIST-AT ?auto_1448693 ?auto_1448697 ) ( not ( = ?auto_1448695 ?auto_1448693 ) ) ( SURFACE-AT ?auto_1448692 ?auto_1448697 ) ( ON ?auto_1448692 ?auto_1448699 ) ( CLEAR ?auto_1448692 ) ( not ( = ?auto_1448691 ?auto_1448699 ) ) ( not ( = ?auto_1448692 ?auto_1448699 ) ) ( not ( = ?auto_1448687 ?auto_1448699 ) ) ( SURFACE-AT ?auto_1448687 ?auto_1448696 ) ( CLEAR ?auto_1448687 ) ( IS-CRATE ?auto_1448691 ) ( AVAILABLE ?auto_1448695 ) ( TRUCK-AT ?auto_1448698 ?auto_1448697 ) ( AVAILABLE ?auto_1448693 ) ( SURFACE-AT ?auto_1448691 ?auto_1448697 ) ( ON ?auto_1448691 ?auto_1448694 ) ( CLEAR ?auto_1448691 ) ( not ( = ?auto_1448691 ?auto_1448694 ) ) ( not ( = ?auto_1448692 ?auto_1448694 ) ) ( not ( = ?auto_1448687 ?auto_1448694 ) ) ( not ( = ?auto_1448699 ?auto_1448694 ) ) ( ON ?auto_1448689 ?auto_1448688 ) ( ON ?auto_1448690 ?auto_1448689 ) ( ON ?auto_1448687 ?auto_1448690 ) ( not ( = ?auto_1448688 ?auto_1448689 ) ) ( not ( = ?auto_1448688 ?auto_1448690 ) ) ( not ( = ?auto_1448688 ?auto_1448687 ) ) ( not ( = ?auto_1448688 ?auto_1448691 ) ) ( not ( = ?auto_1448688 ?auto_1448692 ) ) ( not ( = ?auto_1448688 ?auto_1448699 ) ) ( not ( = ?auto_1448688 ?auto_1448694 ) ) ( not ( = ?auto_1448689 ?auto_1448690 ) ) ( not ( = ?auto_1448689 ?auto_1448687 ) ) ( not ( = ?auto_1448689 ?auto_1448691 ) ) ( not ( = ?auto_1448689 ?auto_1448692 ) ) ( not ( = ?auto_1448689 ?auto_1448699 ) ) ( not ( = ?auto_1448689 ?auto_1448694 ) ) ( not ( = ?auto_1448690 ?auto_1448687 ) ) ( not ( = ?auto_1448690 ?auto_1448691 ) ) ( not ( = ?auto_1448690 ?auto_1448692 ) ) ( not ( = ?auto_1448690 ?auto_1448699 ) ) ( not ( = ?auto_1448690 ?auto_1448694 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1448687 ?auto_1448691 ?auto_1448692 )
      ( MAKE-5CRATE-VERIFY ?auto_1448688 ?auto_1448689 ?auto_1448690 ?auto_1448687 ?auto_1448691 ?auto_1448692 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1448701 - SURFACE
      ?auto_1448702 - SURFACE
      ?auto_1448703 - SURFACE
      ?auto_1448700 - SURFACE
      ?auto_1448704 - SURFACE
      ?auto_1448706 - SURFACE
      ?auto_1448705 - SURFACE
    )
    :vars
    (
      ?auto_1448709 - HOIST
      ?auto_1448710 - PLACE
      ?auto_1448711 - PLACE
      ?auto_1448707 - HOIST
      ?auto_1448713 - SURFACE
      ?auto_1448712 - TRUCK
      ?auto_1448708 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1448709 ?auto_1448710 ) ( IS-CRATE ?auto_1448705 ) ( not ( = ?auto_1448706 ?auto_1448705 ) ) ( not ( = ?auto_1448704 ?auto_1448706 ) ) ( not ( = ?auto_1448704 ?auto_1448705 ) ) ( not ( = ?auto_1448711 ?auto_1448710 ) ) ( HOIST-AT ?auto_1448707 ?auto_1448711 ) ( not ( = ?auto_1448709 ?auto_1448707 ) ) ( SURFACE-AT ?auto_1448705 ?auto_1448711 ) ( ON ?auto_1448705 ?auto_1448713 ) ( CLEAR ?auto_1448705 ) ( not ( = ?auto_1448706 ?auto_1448713 ) ) ( not ( = ?auto_1448705 ?auto_1448713 ) ) ( not ( = ?auto_1448704 ?auto_1448713 ) ) ( SURFACE-AT ?auto_1448704 ?auto_1448710 ) ( CLEAR ?auto_1448704 ) ( IS-CRATE ?auto_1448706 ) ( AVAILABLE ?auto_1448709 ) ( TRUCK-AT ?auto_1448712 ?auto_1448711 ) ( AVAILABLE ?auto_1448707 ) ( SURFACE-AT ?auto_1448706 ?auto_1448711 ) ( ON ?auto_1448706 ?auto_1448708 ) ( CLEAR ?auto_1448706 ) ( not ( = ?auto_1448706 ?auto_1448708 ) ) ( not ( = ?auto_1448705 ?auto_1448708 ) ) ( not ( = ?auto_1448704 ?auto_1448708 ) ) ( not ( = ?auto_1448713 ?auto_1448708 ) ) ( ON ?auto_1448702 ?auto_1448701 ) ( ON ?auto_1448703 ?auto_1448702 ) ( ON ?auto_1448700 ?auto_1448703 ) ( ON ?auto_1448704 ?auto_1448700 ) ( not ( = ?auto_1448701 ?auto_1448702 ) ) ( not ( = ?auto_1448701 ?auto_1448703 ) ) ( not ( = ?auto_1448701 ?auto_1448700 ) ) ( not ( = ?auto_1448701 ?auto_1448704 ) ) ( not ( = ?auto_1448701 ?auto_1448706 ) ) ( not ( = ?auto_1448701 ?auto_1448705 ) ) ( not ( = ?auto_1448701 ?auto_1448713 ) ) ( not ( = ?auto_1448701 ?auto_1448708 ) ) ( not ( = ?auto_1448702 ?auto_1448703 ) ) ( not ( = ?auto_1448702 ?auto_1448700 ) ) ( not ( = ?auto_1448702 ?auto_1448704 ) ) ( not ( = ?auto_1448702 ?auto_1448706 ) ) ( not ( = ?auto_1448702 ?auto_1448705 ) ) ( not ( = ?auto_1448702 ?auto_1448713 ) ) ( not ( = ?auto_1448702 ?auto_1448708 ) ) ( not ( = ?auto_1448703 ?auto_1448700 ) ) ( not ( = ?auto_1448703 ?auto_1448704 ) ) ( not ( = ?auto_1448703 ?auto_1448706 ) ) ( not ( = ?auto_1448703 ?auto_1448705 ) ) ( not ( = ?auto_1448703 ?auto_1448713 ) ) ( not ( = ?auto_1448703 ?auto_1448708 ) ) ( not ( = ?auto_1448700 ?auto_1448704 ) ) ( not ( = ?auto_1448700 ?auto_1448706 ) ) ( not ( = ?auto_1448700 ?auto_1448705 ) ) ( not ( = ?auto_1448700 ?auto_1448713 ) ) ( not ( = ?auto_1448700 ?auto_1448708 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1448704 ?auto_1448706 ?auto_1448705 )
      ( MAKE-6CRATE-VERIFY ?auto_1448701 ?auto_1448702 ?auto_1448703 ?auto_1448700 ?auto_1448704 ?auto_1448706 ?auto_1448705 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1448715 - SURFACE
      ?auto_1448716 - SURFACE
      ?auto_1448717 - SURFACE
      ?auto_1448714 - SURFACE
      ?auto_1448718 - SURFACE
      ?auto_1448720 - SURFACE
      ?auto_1448719 - SURFACE
      ?auto_1448721 - SURFACE
    )
    :vars
    (
      ?auto_1448724 - HOIST
      ?auto_1448725 - PLACE
      ?auto_1448726 - PLACE
      ?auto_1448722 - HOIST
      ?auto_1448728 - SURFACE
      ?auto_1448727 - TRUCK
      ?auto_1448723 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1448724 ?auto_1448725 ) ( IS-CRATE ?auto_1448721 ) ( not ( = ?auto_1448719 ?auto_1448721 ) ) ( not ( = ?auto_1448720 ?auto_1448719 ) ) ( not ( = ?auto_1448720 ?auto_1448721 ) ) ( not ( = ?auto_1448726 ?auto_1448725 ) ) ( HOIST-AT ?auto_1448722 ?auto_1448726 ) ( not ( = ?auto_1448724 ?auto_1448722 ) ) ( SURFACE-AT ?auto_1448721 ?auto_1448726 ) ( ON ?auto_1448721 ?auto_1448728 ) ( CLEAR ?auto_1448721 ) ( not ( = ?auto_1448719 ?auto_1448728 ) ) ( not ( = ?auto_1448721 ?auto_1448728 ) ) ( not ( = ?auto_1448720 ?auto_1448728 ) ) ( SURFACE-AT ?auto_1448720 ?auto_1448725 ) ( CLEAR ?auto_1448720 ) ( IS-CRATE ?auto_1448719 ) ( AVAILABLE ?auto_1448724 ) ( TRUCK-AT ?auto_1448727 ?auto_1448726 ) ( AVAILABLE ?auto_1448722 ) ( SURFACE-AT ?auto_1448719 ?auto_1448726 ) ( ON ?auto_1448719 ?auto_1448723 ) ( CLEAR ?auto_1448719 ) ( not ( = ?auto_1448719 ?auto_1448723 ) ) ( not ( = ?auto_1448721 ?auto_1448723 ) ) ( not ( = ?auto_1448720 ?auto_1448723 ) ) ( not ( = ?auto_1448728 ?auto_1448723 ) ) ( ON ?auto_1448716 ?auto_1448715 ) ( ON ?auto_1448717 ?auto_1448716 ) ( ON ?auto_1448714 ?auto_1448717 ) ( ON ?auto_1448718 ?auto_1448714 ) ( ON ?auto_1448720 ?auto_1448718 ) ( not ( = ?auto_1448715 ?auto_1448716 ) ) ( not ( = ?auto_1448715 ?auto_1448717 ) ) ( not ( = ?auto_1448715 ?auto_1448714 ) ) ( not ( = ?auto_1448715 ?auto_1448718 ) ) ( not ( = ?auto_1448715 ?auto_1448720 ) ) ( not ( = ?auto_1448715 ?auto_1448719 ) ) ( not ( = ?auto_1448715 ?auto_1448721 ) ) ( not ( = ?auto_1448715 ?auto_1448728 ) ) ( not ( = ?auto_1448715 ?auto_1448723 ) ) ( not ( = ?auto_1448716 ?auto_1448717 ) ) ( not ( = ?auto_1448716 ?auto_1448714 ) ) ( not ( = ?auto_1448716 ?auto_1448718 ) ) ( not ( = ?auto_1448716 ?auto_1448720 ) ) ( not ( = ?auto_1448716 ?auto_1448719 ) ) ( not ( = ?auto_1448716 ?auto_1448721 ) ) ( not ( = ?auto_1448716 ?auto_1448728 ) ) ( not ( = ?auto_1448716 ?auto_1448723 ) ) ( not ( = ?auto_1448717 ?auto_1448714 ) ) ( not ( = ?auto_1448717 ?auto_1448718 ) ) ( not ( = ?auto_1448717 ?auto_1448720 ) ) ( not ( = ?auto_1448717 ?auto_1448719 ) ) ( not ( = ?auto_1448717 ?auto_1448721 ) ) ( not ( = ?auto_1448717 ?auto_1448728 ) ) ( not ( = ?auto_1448717 ?auto_1448723 ) ) ( not ( = ?auto_1448714 ?auto_1448718 ) ) ( not ( = ?auto_1448714 ?auto_1448720 ) ) ( not ( = ?auto_1448714 ?auto_1448719 ) ) ( not ( = ?auto_1448714 ?auto_1448721 ) ) ( not ( = ?auto_1448714 ?auto_1448728 ) ) ( not ( = ?auto_1448714 ?auto_1448723 ) ) ( not ( = ?auto_1448718 ?auto_1448720 ) ) ( not ( = ?auto_1448718 ?auto_1448719 ) ) ( not ( = ?auto_1448718 ?auto_1448721 ) ) ( not ( = ?auto_1448718 ?auto_1448728 ) ) ( not ( = ?auto_1448718 ?auto_1448723 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1448720 ?auto_1448719 ?auto_1448721 )
      ( MAKE-7CRATE-VERIFY ?auto_1448715 ?auto_1448716 ?auto_1448717 ?auto_1448714 ?auto_1448718 ?auto_1448720 ?auto_1448719 ?auto_1448721 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1448730 - SURFACE
      ?auto_1448731 - SURFACE
      ?auto_1448732 - SURFACE
      ?auto_1448729 - SURFACE
      ?auto_1448733 - SURFACE
      ?auto_1448735 - SURFACE
      ?auto_1448734 - SURFACE
      ?auto_1448736 - SURFACE
      ?auto_1448737 - SURFACE
    )
    :vars
    (
      ?auto_1448740 - HOIST
      ?auto_1448741 - PLACE
      ?auto_1448742 - PLACE
      ?auto_1448738 - HOIST
      ?auto_1448744 - SURFACE
      ?auto_1448743 - TRUCK
      ?auto_1448739 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1448740 ?auto_1448741 ) ( IS-CRATE ?auto_1448737 ) ( not ( = ?auto_1448736 ?auto_1448737 ) ) ( not ( = ?auto_1448734 ?auto_1448736 ) ) ( not ( = ?auto_1448734 ?auto_1448737 ) ) ( not ( = ?auto_1448742 ?auto_1448741 ) ) ( HOIST-AT ?auto_1448738 ?auto_1448742 ) ( not ( = ?auto_1448740 ?auto_1448738 ) ) ( SURFACE-AT ?auto_1448737 ?auto_1448742 ) ( ON ?auto_1448737 ?auto_1448744 ) ( CLEAR ?auto_1448737 ) ( not ( = ?auto_1448736 ?auto_1448744 ) ) ( not ( = ?auto_1448737 ?auto_1448744 ) ) ( not ( = ?auto_1448734 ?auto_1448744 ) ) ( SURFACE-AT ?auto_1448734 ?auto_1448741 ) ( CLEAR ?auto_1448734 ) ( IS-CRATE ?auto_1448736 ) ( AVAILABLE ?auto_1448740 ) ( TRUCK-AT ?auto_1448743 ?auto_1448742 ) ( AVAILABLE ?auto_1448738 ) ( SURFACE-AT ?auto_1448736 ?auto_1448742 ) ( ON ?auto_1448736 ?auto_1448739 ) ( CLEAR ?auto_1448736 ) ( not ( = ?auto_1448736 ?auto_1448739 ) ) ( not ( = ?auto_1448737 ?auto_1448739 ) ) ( not ( = ?auto_1448734 ?auto_1448739 ) ) ( not ( = ?auto_1448744 ?auto_1448739 ) ) ( ON ?auto_1448731 ?auto_1448730 ) ( ON ?auto_1448732 ?auto_1448731 ) ( ON ?auto_1448729 ?auto_1448732 ) ( ON ?auto_1448733 ?auto_1448729 ) ( ON ?auto_1448735 ?auto_1448733 ) ( ON ?auto_1448734 ?auto_1448735 ) ( not ( = ?auto_1448730 ?auto_1448731 ) ) ( not ( = ?auto_1448730 ?auto_1448732 ) ) ( not ( = ?auto_1448730 ?auto_1448729 ) ) ( not ( = ?auto_1448730 ?auto_1448733 ) ) ( not ( = ?auto_1448730 ?auto_1448735 ) ) ( not ( = ?auto_1448730 ?auto_1448734 ) ) ( not ( = ?auto_1448730 ?auto_1448736 ) ) ( not ( = ?auto_1448730 ?auto_1448737 ) ) ( not ( = ?auto_1448730 ?auto_1448744 ) ) ( not ( = ?auto_1448730 ?auto_1448739 ) ) ( not ( = ?auto_1448731 ?auto_1448732 ) ) ( not ( = ?auto_1448731 ?auto_1448729 ) ) ( not ( = ?auto_1448731 ?auto_1448733 ) ) ( not ( = ?auto_1448731 ?auto_1448735 ) ) ( not ( = ?auto_1448731 ?auto_1448734 ) ) ( not ( = ?auto_1448731 ?auto_1448736 ) ) ( not ( = ?auto_1448731 ?auto_1448737 ) ) ( not ( = ?auto_1448731 ?auto_1448744 ) ) ( not ( = ?auto_1448731 ?auto_1448739 ) ) ( not ( = ?auto_1448732 ?auto_1448729 ) ) ( not ( = ?auto_1448732 ?auto_1448733 ) ) ( not ( = ?auto_1448732 ?auto_1448735 ) ) ( not ( = ?auto_1448732 ?auto_1448734 ) ) ( not ( = ?auto_1448732 ?auto_1448736 ) ) ( not ( = ?auto_1448732 ?auto_1448737 ) ) ( not ( = ?auto_1448732 ?auto_1448744 ) ) ( not ( = ?auto_1448732 ?auto_1448739 ) ) ( not ( = ?auto_1448729 ?auto_1448733 ) ) ( not ( = ?auto_1448729 ?auto_1448735 ) ) ( not ( = ?auto_1448729 ?auto_1448734 ) ) ( not ( = ?auto_1448729 ?auto_1448736 ) ) ( not ( = ?auto_1448729 ?auto_1448737 ) ) ( not ( = ?auto_1448729 ?auto_1448744 ) ) ( not ( = ?auto_1448729 ?auto_1448739 ) ) ( not ( = ?auto_1448733 ?auto_1448735 ) ) ( not ( = ?auto_1448733 ?auto_1448734 ) ) ( not ( = ?auto_1448733 ?auto_1448736 ) ) ( not ( = ?auto_1448733 ?auto_1448737 ) ) ( not ( = ?auto_1448733 ?auto_1448744 ) ) ( not ( = ?auto_1448733 ?auto_1448739 ) ) ( not ( = ?auto_1448735 ?auto_1448734 ) ) ( not ( = ?auto_1448735 ?auto_1448736 ) ) ( not ( = ?auto_1448735 ?auto_1448737 ) ) ( not ( = ?auto_1448735 ?auto_1448744 ) ) ( not ( = ?auto_1448735 ?auto_1448739 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1448734 ?auto_1448736 ?auto_1448737 )
      ( MAKE-8CRATE-VERIFY ?auto_1448730 ?auto_1448731 ?auto_1448732 ?auto_1448729 ?auto_1448733 ?auto_1448735 ?auto_1448734 ?auto_1448736 ?auto_1448737 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1448746 - SURFACE
      ?auto_1448747 - SURFACE
      ?auto_1448748 - SURFACE
      ?auto_1448745 - SURFACE
      ?auto_1448749 - SURFACE
      ?auto_1448751 - SURFACE
      ?auto_1448750 - SURFACE
      ?auto_1448752 - SURFACE
      ?auto_1448753 - SURFACE
      ?auto_1448754 - SURFACE
    )
    :vars
    (
      ?auto_1448757 - HOIST
      ?auto_1448758 - PLACE
      ?auto_1448759 - PLACE
      ?auto_1448755 - HOIST
      ?auto_1448761 - SURFACE
      ?auto_1448760 - TRUCK
      ?auto_1448756 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1448757 ?auto_1448758 ) ( IS-CRATE ?auto_1448754 ) ( not ( = ?auto_1448753 ?auto_1448754 ) ) ( not ( = ?auto_1448752 ?auto_1448753 ) ) ( not ( = ?auto_1448752 ?auto_1448754 ) ) ( not ( = ?auto_1448759 ?auto_1448758 ) ) ( HOIST-AT ?auto_1448755 ?auto_1448759 ) ( not ( = ?auto_1448757 ?auto_1448755 ) ) ( SURFACE-AT ?auto_1448754 ?auto_1448759 ) ( ON ?auto_1448754 ?auto_1448761 ) ( CLEAR ?auto_1448754 ) ( not ( = ?auto_1448753 ?auto_1448761 ) ) ( not ( = ?auto_1448754 ?auto_1448761 ) ) ( not ( = ?auto_1448752 ?auto_1448761 ) ) ( SURFACE-AT ?auto_1448752 ?auto_1448758 ) ( CLEAR ?auto_1448752 ) ( IS-CRATE ?auto_1448753 ) ( AVAILABLE ?auto_1448757 ) ( TRUCK-AT ?auto_1448760 ?auto_1448759 ) ( AVAILABLE ?auto_1448755 ) ( SURFACE-AT ?auto_1448753 ?auto_1448759 ) ( ON ?auto_1448753 ?auto_1448756 ) ( CLEAR ?auto_1448753 ) ( not ( = ?auto_1448753 ?auto_1448756 ) ) ( not ( = ?auto_1448754 ?auto_1448756 ) ) ( not ( = ?auto_1448752 ?auto_1448756 ) ) ( not ( = ?auto_1448761 ?auto_1448756 ) ) ( ON ?auto_1448747 ?auto_1448746 ) ( ON ?auto_1448748 ?auto_1448747 ) ( ON ?auto_1448745 ?auto_1448748 ) ( ON ?auto_1448749 ?auto_1448745 ) ( ON ?auto_1448751 ?auto_1448749 ) ( ON ?auto_1448750 ?auto_1448751 ) ( ON ?auto_1448752 ?auto_1448750 ) ( not ( = ?auto_1448746 ?auto_1448747 ) ) ( not ( = ?auto_1448746 ?auto_1448748 ) ) ( not ( = ?auto_1448746 ?auto_1448745 ) ) ( not ( = ?auto_1448746 ?auto_1448749 ) ) ( not ( = ?auto_1448746 ?auto_1448751 ) ) ( not ( = ?auto_1448746 ?auto_1448750 ) ) ( not ( = ?auto_1448746 ?auto_1448752 ) ) ( not ( = ?auto_1448746 ?auto_1448753 ) ) ( not ( = ?auto_1448746 ?auto_1448754 ) ) ( not ( = ?auto_1448746 ?auto_1448761 ) ) ( not ( = ?auto_1448746 ?auto_1448756 ) ) ( not ( = ?auto_1448747 ?auto_1448748 ) ) ( not ( = ?auto_1448747 ?auto_1448745 ) ) ( not ( = ?auto_1448747 ?auto_1448749 ) ) ( not ( = ?auto_1448747 ?auto_1448751 ) ) ( not ( = ?auto_1448747 ?auto_1448750 ) ) ( not ( = ?auto_1448747 ?auto_1448752 ) ) ( not ( = ?auto_1448747 ?auto_1448753 ) ) ( not ( = ?auto_1448747 ?auto_1448754 ) ) ( not ( = ?auto_1448747 ?auto_1448761 ) ) ( not ( = ?auto_1448747 ?auto_1448756 ) ) ( not ( = ?auto_1448748 ?auto_1448745 ) ) ( not ( = ?auto_1448748 ?auto_1448749 ) ) ( not ( = ?auto_1448748 ?auto_1448751 ) ) ( not ( = ?auto_1448748 ?auto_1448750 ) ) ( not ( = ?auto_1448748 ?auto_1448752 ) ) ( not ( = ?auto_1448748 ?auto_1448753 ) ) ( not ( = ?auto_1448748 ?auto_1448754 ) ) ( not ( = ?auto_1448748 ?auto_1448761 ) ) ( not ( = ?auto_1448748 ?auto_1448756 ) ) ( not ( = ?auto_1448745 ?auto_1448749 ) ) ( not ( = ?auto_1448745 ?auto_1448751 ) ) ( not ( = ?auto_1448745 ?auto_1448750 ) ) ( not ( = ?auto_1448745 ?auto_1448752 ) ) ( not ( = ?auto_1448745 ?auto_1448753 ) ) ( not ( = ?auto_1448745 ?auto_1448754 ) ) ( not ( = ?auto_1448745 ?auto_1448761 ) ) ( not ( = ?auto_1448745 ?auto_1448756 ) ) ( not ( = ?auto_1448749 ?auto_1448751 ) ) ( not ( = ?auto_1448749 ?auto_1448750 ) ) ( not ( = ?auto_1448749 ?auto_1448752 ) ) ( not ( = ?auto_1448749 ?auto_1448753 ) ) ( not ( = ?auto_1448749 ?auto_1448754 ) ) ( not ( = ?auto_1448749 ?auto_1448761 ) ) ( not ( = ?auto_1448749 ?auto_1448756 ) ) ( not ( = ?auto_1448751 ?auto_1448750 ) ) ( not ( = ?auto_1448751 ?auto_1448752 ) ) ( not ( = ?auto_1448751 ?auto_1448753 ) ) ( not ( = ?auto_1448751 ?auto_1448754 ) ) ( not ( = ?auto_1448751 ?auto_1448761 ) ) ( not ( = ?auto_1448751 ?auto_1448756 ) ) ( not ( = ?auto_1448750 ?auto_1448752 ) ) ( not ( = ?auto_1448750 ?auto_1448753 ) ) ( not ( = ?auto_1448750 ?auto_1448754 ) ) ( not ( = ?auto_1448750 ?auto_1448761 ) ) ( not ( = ?auto_1448750 ?auto_1448756 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1448752 ?auto_1448753 ?auto_1448754 )
      ( MAKE-9CRATE-VERIFY ?auto_1448746 ?auto_1448747 ?auto_1448748 ?auto_1448745 ?auto_1448749 ?auto_1448751 ?auto_1448750 ?auto_1448752 ?auto_1448753 ?auto_1448754 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1448763 - SURFACE
      ?auto_1448764 - SURFACE
      ?auto_1448765 - SURFACE
      ?auto_1448762 - SURFACE
      ?auto_1448766 - SURFACE
      ?auto_1448768 - SURFACE
      ?auto_1448767 - SURFACE
      ?auto_1448769 - SURFACE
      ?auto_1448770 - SURFACE
      ?auto_1448771 - SURFACE
      ?auto_1448772 - SURFACE
    )
    :vars
    (
      ?auto_1448775 - HOIST
      ?auto_1448776 - PLACE
      ?auto_1448777 - PLACE
      ?auto_1448773 - HOIST
      ?auto_1448779 - SURFACE
      ?auto_1448778 - TRUCK
      ?auto_1448774 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1448775 ?auto_1448776 ) ( IS-CRATE ?auto_1448772 ) ( not ( = ?auto_1448771 ?auto_1448772 ) ) ( not ( = ?auto_1448770 ?auto_1448771 ) ) ( not ( = ?auto_1448770 ?auto_1448772 ) ) ( not ( = ?auto_1448777 ?auto_1448776 ) ) ( HOIST-AT ?auto_1448773 ?auto_1448777 ) ( not ( = ?auto_1448775 ?auto_1448773 ) ) ( SURFACE-AT ?auto_1448772 ?auto_1448777 ) ( ON ?auto_1448772 ?auto_1448779 ) ( CLEAR ?auto_1448772 ) ( not ( = ?auto_1448771 ?auto_1448779 ) ) ( not ( = ?auto_1448772 ?auto_1448779 ) ) ( not ( = ?auto_1448770 ?auto_1448779 ) ) ( SURFACE-AT ?auto_1448770 ?auto_1448776 ) ( CLEAR ?auto_1448770 ) ( IS-CRATE ?auto_1448771 ) ( AVAILABLE ?auto_1448775 ) ( TRUCK-AT ?auto_1448778 ?auto_1448777 ) ( AVAILABLE ?auto_1448773 ) ( SURFACE-AT ?auto_1448771 ?auto_1448777 ) ( ON ?auto_1448771 ?auto_1448774 ) ( CLEAR ?auto_1448771 ) ( not ( = ?auto_1448771 ?auto_1448774 ) ) ( not ( = ?auto_1448772 ?auto_1448774 ) ) ( not ( = ?auto_1448770 ?auto_1448774 ) ) ( not ( = ?auto_1448779 ?auto_1448774 ) ) ( ON ?auto_1448764 ?auto_1448763 ) ( ON ?auto_1448765 ?auto_1448764 ) ( ON ?auto_1448762 ?auto_1448765 ) ( ON ?auto_1448766 ?auto_1448762 ) ( ON ?auto_1448768 ?auto_1448766 ) ( ON ?auto_1448767 ?auto_1448768 ) ( ON ?auto_1448769 ?auto_1448767 ) ( ON ?auto_1448770 ?auto_1448769 ) ( not ( = ?auto_1448763 ?auto_1448764 ) ) ( not ( = ?auto_1448763 ?auto_1448765 ) ) ( not ( = ?auto_1448763 ?auto_1448762 ) ) ( not ( = ?auto_1448763 ?auto_1448766 ) ) ( not ( = ?auto_1448763 ?auto_1448768 ) ) ( not ( = ?auto_1448763 ?auto_1448767 ) ) ( not ( = ?auto_1448763 ?auto_1448769 ) ) ( not ( = ?auto_1448763 ?auto_1448770 ) ) ( not ( = ?auto_1448763 ?auto_1448771 ) ) ( not ( = ?auto_1448763 ?auto_1448772 ) ) ( not ( = ?auto_1448763 ?auto_1448779 ) ) ( not ( = ?auto_1448763 ?auto_1448774 ) ) ( not ( = ?auto_1448764 ?auto_1448765 ) ) ( not ( = ?auto_1448764 ?auto_1448762 ) ) ( not ( = ?auto_1448764 ?auto_1448766 ) ) ( not ( = ?auto_1448764 ?auto_1448768 ) ) ( not ( = ?auto_1448764 ?auto_1448767 ) ) ( not ( = ?auto_1448764 ?auto_1448769 ) ) ( not ( = ?auto_1448764 ?auto_1448770 ) ) ( not ( = ?auto_1448764 ?auto_1448771 ) ) ( not ( = ?auto_1448764 ?auto_1448772 ) ) ( not ( = ?auto_1448764 ?auto_1448779 ) ) ( not ( = ?auto_1448764 ?auto_1448774 ) ) ( not ( = ?auto_1448765 ?auto_1448762 ) ) ( not ( = ?auto_1448765 ?auto_1448766 ) ) ( not ( = ?auto_1448765 ?auto_1448768 ) ) ( not ( = ?auto_1448765 ?auto_1448767 ) ) ( not ( = ?auto_1448765 ?auto_1448769 ) ) ( not ( = ?auto_1448765 ?auto_1448770 ) ) ( not ( = ?auto_1448765 ?auto_1448771 ) ) ( not ( = ?auto_1448765 ?auto_1448772 ) ) ( not ( = ?auto_1448765 ?auto_1448779 ) ) ( not ( = ?auto_1448765 ?auto_1448774 ) ) ( not ( = ?auto_1448762 ?auto_1448766 ) ) ( not ( = ?auto_1448762 ?auto_1448768 ) ) ( not ( = ?auto_1448762 ?auto_1448767 ) ) ( not ( = ?auto_1448762 ?auto_1448769 ) ) ( not ( = ?auto_1448762 ?auto_1448770 ) ) ( not ( = ?auto_1448762 ?auto_1448771 ) ) ( not ( = ?auto_1448762 ?auto_1448772 ) ) ( not ( = ?auto_1448762 ?auto_1448779 ) ) ( not ( = ?auto_1448762 ?auto_1448774 ) ) ( not ( = ?auto_1448766 ?auto_1448768 ) ) ( not ( = ?auto_1448766 ?auto_1448767 ) ) ( not ( = ?auto_1448766 ?auto_1448769 ) ) ( not ( = ?auto_1448766 ?auto_1448770 ) ) ( not ( = ?auto_1448766 ?auto_1448771 ) ) ( not ( = ?auto_1448766 ?auto_1448772 ) ) ( not ( = ?auto_1448766 ?auto_1448779 ) ) ( not ( = ?auto_1448766 ?auto_1448774 ) ) ( not ( = ?auto_1448768 ?auto_1448767 ) ) ( not ( = ?auto_1448768 ?auto_1448769 ) ) ( not ( = ?auto_1448768 ?auto_1448770 ) ) ( not ( = ?auto_1448768 ?auto_1448771 ) ) ( not ( = ?auto_1448768 ?auto_1448772 ) ) ( not ( = ?auto_1448768 ?auto_1448779 ) ) ( not ( = ?auto_1448768 ?auto_1448774 ) ) ( not ( = ?auto_1448767 ?auto_1448769 ) ) ( not ( = ?auto_1448767 ?auto_1448770 ) ) ( not ( = ?auto_1448767 ?auto_1448771 ) ) ( not ( = ?auto_1448767 ?auto_1448772 ) ) ( not ( = ?auto_1448767 ?auto_1448779 ) ) ( not ( = ?auto_1448767 ?auto_1448774 ) ) ( not ( = ?auto_1448769 ?auto_1448770 ) ) ( not ( = ?auto_1448769 ?auto_1448771 ) ) ( not ( = ?auto_1448769 ?auto_1448772 ) ) ( not ( = ?auto_1448769 ?auto_1448779 ) ) ( not ( = ?auto_1448769 ?auto_1448774 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1448770 ?auto_1448771 ?auto_1448772 )
      ( MAKE-10CRATE-VERIFY ?auto_1448763 ?auto_1448764 ?auto_1448765 ?auto_1448762 ?auto_1448766 ?auto_1448768 ?auto_1448767 ?auto_1448769 ?auto_1448770 ?auto_1448771 ?auto_1448772 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1448780 - SURFACE
      ?auto_1448781 - SURFACE
    )
    :vars
    (
      ?auto_1448784 - HOIST
      ?auto_1448785 - PLACE
      ?auto_1448789 - SURFACE
      ?auto_1448786 - PLACE
      ?auto_1448782 - HOIST
      ?auto_1448788 - SURFACE
      ?auto_1448783 - SURFACE
      ?auto_1448787 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1448784 ?auto_1448785 ) ( IS-CRATE ?auto_1448781 ) ( not ( = ?auto_1448780 ?auto_1448781 ) ) ( not ( = ?auto_1448789 ?auto_1448780 ) ) ( not ( = ?auto_1448789 ?auto_1448781 ) ) ( not ( = ?auto_1448786 ?auto_1448785 ) ) ( HOIST-AT ?auto_1448782 ?auto_1448786 ) ( not ( = ?auto_1448784 ?auto_1448782 ) ) ( SURFACE-AT ?auto_1448781 ?auto_1448786 ) ( ON ?auto_1448781 ?auto_1448788 ) ( CLEAR ?auto_1448781 ) ( not ( = ?auto_1448780 ?auto_1448788 ) ) ( not ( = ?auto_1448781 ?auto_1448788 ) ) ( not ( = ?auto_1448789 ?auto_1448788 ) ) ( SURFACE-AT ?auto_1448789 ?auto_1448785 ) ( CLEAR ?auto_1448789 ) ( IS-CRATE ?auto_1448780 ) ( AVAILABLE ?auto_1448784 ) ( AVAILABLE ?auto_1448782 ) ( SURFACE-AT ?auto_1448780 ?auto_1448786 ) ( ON ?auto_1448780 ?auto_1448783 ) ( CLEAR ?auto_1448780 ) ( not ( = ?auto_1448780 ?auto_1448783 ) ) ( not ( = ?auto_1448781 ?auto_1448783 ) ) ( not ( = ?auto_1448789 ?auto_1448783 ) ) ( not ( = ?auto_1448788 ?auto_1448783 ) ) ( TRUCK-AT ?auto_1448787 ?auto_1448785 ) )
    :subtasks
    ( ( !DRIVE ?auto_1448787 ?auto_1448785 ?auto_1448786 )
      ( MAKE-2CRATE ?auto_1448789 ?auto_1448780 ?auto_1448781 )
      ( MAKE-1CRATE-VERIFY ?auto_1448780 ?auto_1448781 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1448790 - SURFACE
      ?auto_1448791 - SURFACE
      ?auto_1448792 - SURFACE
    )
    :vars
    (
      ?auto_1448794 - HOIST
      ?auto_1448796 - PLACE
      ?auto_1448799 - PLACE
      ?auto_1448793 - HOIST
      ?auto_1448798 - SURFACE
      ?auto_1448795 - SURFACE
      ?auto_1448797 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1448794 ?auto_1448796 ) ( IS-CRATE ?auto_1448792 ) ( not ( = ?auto_1448791 ?auto_1448792 ) ) ( not ( = ?auto_1448790 ?auto_1448791 ) ) ( not ( = ?auto_1448790 ?auto_1448792 ) ) ( not ( = ?auto_1448799 ?auto_1448796 ) ) ( HOIST-AT ?auto_1448793 ?auto_1448799 ) ( not ( = ?auto_1448794 ?auto_1448793 ) ) ( SURFACE-AT ?auto_1448792 ?auto_1448799 ) ( ON ?auto_1448792 ?auto_1448798 ) ( CLEAR ?auto_1448792 ) ( not ( = ?auto_1448791 ?auto_1448798 ) ) ( not ( = ?auto_1448792 ?auto_1448798 ) ) ( not ( = ?auto_1448790 ?auto_1448798 ) ) ( SURFACE-AT ?auto_1448790 ?auto_1448796 ) ( CLEAR ?auto_1448790 ) ( IS-CRATE ?auto_1448791 ) ( AVAILABLE ?auto_1448794 ) ( AVAILABLE ?auto_1448793 ) ( SURFACE-AT ?auto_1448791 ?auto_1448799 ) ( ON ?auto_1448791 ?auto_1448795 ) ( CLEAR ?auto_1448791 ) ( not ( = ?auto_1448791 ?auto_1448795 ) ) ( not ( = ?auto_1448792 ?auto_1448795 ) ) ( not ( = ?auto_1448790 ?auto_1448795 ) ) ( not ( = ?auto_1448798 ?auto_1448795 ) ) ( TRUCK-AT ?auto_1448797 ?auto_1448796 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1448791 ?auto_1448792 )
      ( MAKE-2CRATE-VERIFY ?auto_1448790 ?auto_1448791 ?auto_1448792 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1448801 - SURFACE
      ?auto_1448802 - SURFACE
      ?auto_1448803 - SURFACE
      ?auto_1448800 - SURFACE
    )
    :vars
    (
      ?auto_1448810 - HOIST
      ?auto_1448808 - PLACE
      ?auto_1448807 - PLACE
      ?auto_1448805 - HOIST
      ?auto_1448809 - SURFACE
      ?auto_1448806 - SURFACE
      ?auto_1448804 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1448810 ?auto_1448808 ) ( IS-CRATE ?auto_1448800 ) ( not ( = ?auto_1448803 ?auto_1448800 ) ) ( not ( = ?auto_1448802 ?auto_1448803 ) ) ( not ( = ?auto_1448802 ?auto_1448800 ) ) ( not ( = ?auto_1448807 ?auto_1448808 ) ) ( HOIST-AT ?auto_1448805 ?auto_1448807 ) ( not ( = ?auto_1448810 ?auto_1448805 ) ) ( SURFACE-AT ?auto_1448800 ?auto_1448807 ) ( ON ?auto_1448800 ?auto_1448809 ) ( CLEAR ?auto_1448800 ) ( not ( = ?auto_1448803 ?auto_1448809 ) ) ( not ( = ?auto_1448800 ?auto_1448809 ) ) ( not ( = ?auto_1448802 ?auto_1448809 ) ) ( SURFACE-AT ?auto_1448802 ?auto_1448808 ) ( CLEAR ?auto_1448802 ) ( IS-CRATE ?auto_1448803 ) ( AVAILABLE ?auto_1448810 ) ( AVAILABLE ?auto_1448805 ) ( SURFACE-AT ?auto_1448803 ?auto_1448807 ) ( ON ?auto_1448803 ?auto_1448806 ) ( CLEAR ?auto_1448803 ) ( not ( = ?auto_1448803 ?auto_1448806 ) ) ( not ( = ?auto_1448800 ?auto_1448806 ) ) ( not ( = ?auto_1448802 ?auto_1448806 ) ) ( not ( = ?auto_1448809 ?auto_1448806 ) ) ( TRUCK-AT ?auto_1448804 ?auto_1448808 ) ( ON ?auto_1448802 ?auto_1448801 ) ( not ( = ?auto_1448801 ?auto_1448802 ) ) ( not ( = ?auto_1448801 ?auto_1448803 ) ) ( not ( = ?auto_1448801 ?auto_1448800 ) ) ( not ( = ?auto_1448801 ?auto_1448809 ) ) ( not ( = ?auto_1448801 ?auto_1448806 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1448802 ?auto_1448803 ?auto_1448800 )
      ( MAKE-3CRATE-VERIFY ?auto_1448801 ?auto_1448802 ?auto_1448803 ?auto_1448800 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1448812 - SURFACE
      ?auto_1448813 - SURFACE
      ?auto_1448814 - SURFACE
      ?auto_1448811 - SURFACE
      ?auto_1448815 - SURFACE
    )
    :vars
    (
      ?auto_1448822 - HOIST
      ?auto_1448820 - PLACE
      ?auto_1448819 - PLACE
      ?auto_1448817 - HOIST
      ?auto_1448821 - SURFACE
      ?auto_1448818 - SURFACE
      ?auto_1448816 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1448822 ?auto_1448820 ) ( IS-CRATE ?auto_1448815 ) ( not ( = ?auto_1448811 ?auto_1448815 ) ) ( not ( = ?auto_1448814 ?auto_1448811 ) ) ( not ( = ?auto_1448814 ?auto_1448815 ) ) ( not ( = ?auto_1448819 ?auto_1448820 ) ) ( HOIST-AT ?auto_1448817 ?auto_1448819 ) ( not ( = ?auto_1448822 ?auto_1448817 ) ) ( SURFACE-AT ?auto_1448815 ?auto_1448819 ) ( ON ?auto_1448815 ?auto_1448821 ) ( CLEAR ?auto_1448815 ) ( not ( = ?auto_1448811 ?auto_1448821 ) ) ( not ( = ?auto_1448815 ?auto_1448821 ) ) ( not ( = ?auto_1448814 ?auto_1448821 ) ) ( SURFACE-AT ?auto_1448814 ?auto_1448820 ) ( CLEAR ?auto_1448814 ) ( IS-CRATE ?auto_1448811 ) ( AVAILABLE ?auto_1448822 ) ( AVAILABLE ?auto_1448817 ) ( SURFACE-AT ?auto_1448811 ?auto_1448819 ) ( ON ?auto_1448811 ?auto_1448818 ) ( CLEAR ?auto_1448811 ) ( not ( = ?auto_1448811 ?auto_1448818 ) ) ( not ( = ?auto_1448815 ?auto_1448818 ) ) ( not ( = ?auto_1448814 ?auto_1448818 ) ) ( not ( = ?auto_1448821 ?auto_1448818 ) ) ( TRUCK-AT ?auto_1448816 ?auto_1448820 ) ( ON ?auto_1448813 ?auto_1448812 ) ( ON ?auto_1448814 ?auto_1448813 ) ( not ( = ?auto_1448812 ?auto_1448813 ) ) ( not ( = ?auto_1448812 ?auto_1448814 ) ) ( not ( = ?auto_1448812 ?auto_1448811 ) ) ( not ( = ?auto_1448812 ?auto_1448815 ) ) ( not ( = ?auto_1448812 ?auto_1448821 ) ) ( not ( = ?auto_1448812 ?auto_1448818 ) ) ( not ( = ?auto_1448813 ?auto_1448814 ) ) ( not ( = ?auto_1448813 ?auto_1448811 ) ) ( not ( = ?auto_1448813 ?auto_1448815 ) ) ( not ( = ?auto_1448813 ?auto_1448821 ) ) ( not ( = ?auto_1448813 ?auto_1448818 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1448814 ?auto_1448811 ?auto_1448815 )
      ( MAKE-4CRATE-VERIFY ?auto_1448812 ?auto_1448813 ?auto_1448814 ?auto_1448811 ?auto_1448815 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1448824 - SURFACE
      ?auto_1448825 - SURFACE
      ?auto_1448826 - SURFACE
      ?auto_1448823 - SURFACE
      ?auto_1448827 - SURFACE
      ?auto_1448828 - SURFACE
    )
    :vars
    (
      ?auto_1448835 - HOIST
      ?auto_1448833 - PLACE
      ?auto_1448832 - PLACE
      ?auto_1448830 - HOIST
      ?auto_1448834 - SURFACE
      ?auto_1448831 - SURFACE
      ?auto_1448829 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1448835 ?auto_1448833 ) ( IS-CRATE ?auto_1448828 ) ( not ( = ?auto_1448827 ?auto_1448828 ) ) ( not ( = ?auto_1448823 ?auto_1448827 ) ) ( not ( = ?auto_1448823 ?auto_1448828 ) ) ( not ( = ?auto_1448832 ?auto_1448833 ) ) ( HOIST-AT ?auto_1448830 ?auto_1448832 ) ( not ( = ?auto_1448835 ?auto_1448830 ) ) ( SURFACE-AT ?auto_1448828 ?auto_1448832 ) ( ON ?auto_1448828 ?auto_1448834 ) ( CLEAR ?auto_1448828 ) ( not ( = ?auto_1448827 ?auto_1448834 ) ) ( not ( = ?auto_1448828 ?auto_1448834 ) ) ( not ( = ?auto_1448823 ?auto_1448834 ) ) ( SURFACE-AT ?auto_1448823 ?auto_1448833 ) ( CLEAR ?auto_1448823 ) ( IS-CRATE ?auto_1448827 ) ( AVAILABLE ?auto_1448835 ) ( AVAILABLE ?auto_1448830 ) ( SURFACE-AT ?auto_1448827 ?auto_1448832 ) ( ON ?auto_1448827 ?auto_1448831 ) ( CLEAR ?auto_1448827 ) ( not ( = ?auto_1448827 ?auto_1448831 ) ) ( not ( = ?auto_1448828 ?auto_1448831 ) ) ( not ( = ?auto_1448823 ?auto_1448831 ) ) ( not ( = ?auto_1448834 ?auto_1448831 ) ) ( TRUCK-AT ?auto_1448829 ?auto_1448833 ) ( ON ?auto_1448825 ?auto_1448824 ) ( ON ?auto_1448826 ?auto_1448825 ) ( ON ?auto_1448823 ?auto_1448826 ) ( not ( = ?auto_1448824 ?auto_1448825 ) ) ( not ( = ?auto_1448824 ?auto_1448826 ) ) ( not ( = ?auto_1448824 ?auto_1448823 ) ) ( not ( = ?auto_1448824 ?auto_1448827 ) ) ( not ( = ?auto_1448824 ?auto_1448828 ) ) ( not ( = ?auto_1448824 ?auto_1448834 ) ) ( not ( = ?auto_1448824 ?auto_1448831 ) ) ( not ( = ?auto_1448825 ?auto_1448826 ) ) ( not ( = ?auto_1448825 ?auto_1448823 ) ) ( not ( = ?auto_1448825 ?auto_1448827 ) ) ( not ( = ?auto_1448825 ?auto_1448828 ) ) ( not ( = ?auto_1448825 ?auto_1448834 ) ) ( not ( = ?auto_1448825 ?auto_1448831 ) ) ( not ( = ?auto_1448826 ?auto_1448823 ) ) ( not ( = ?auto_1448826 ?auto_1448827 ) ) ( not ( = ?auto_1448826 ?auto_1448828 ) ) ( not ( = ?auto_1448826 ?auto_1448834 ) ) ( not ( = ?auto_1448826 ?auto_1448831 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1448823 ?auto_1448827 ?auto_1448828 )
      ( MAKE-5CRATE-VERIFY ?auto_1448824 ?auto_1448825 ?auto_1448826 ?auto_1448823 ?auto_1448827 ?auto_1448828 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1448837 - SURFACE
      ?auto_1448838 - SURFACE
      ?auto_1448839 - SURFACE
      ?auto_1448836 - SURFACE
      ?auto_1448840 - SURFACE
      ?auto_1448842 - SURFACE
      ?auto_1448841 - SURFACE
    )
    :vars
    (
      ?auto_1448849 - HOIST
      ?auto_1448847 - PLACE
      ?auto_1448846 - PLACE
      ?auto_1448844 - HOIST
      ?auto_1448848 - SURFACE
      ?auto_1448845 - SURFACE
      ?auto_1448843 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1448849 ?auto_1448847 ) ( IS-CRATE ?auto_1448841 ) ( not ( = ?auto_1448842 ?auto_1448841 ) ) ( not ( = ?auto_1448840 ?auto_1448842 ) ) ( not ( = ?auto_1448840 ?auto_1448841 ) ) ( not ( = ?auto_1448846 ?auto_1448847 ) ) ( HOIST-AT ?auto_1448844 ?auto_1448846 ) ( not ( = ?auto_1448849 ?auto_1448844 ) ) ( SURFACE-AT ?auto_1448841 ?auto_1448846 ) ( ON ?auto_1448841 ?auto_1448848 ) ( CLEAR ?auto_1448841 ) ( not ( = ?auto_1448842 ?auto_1448848 ) ) ( not ( = ?auto_1448841 ?auto_1448848 ) ) ( not ( = ?auto_1448840 ?auto_1448848 ) ) ( SURFACE-AT ?auto_1448840 ?auto_1448847 ) ( CLEAR ?auto_1448840 ) ( IS-CRATE ?auto_1448842 ) ( AVAILABLE ?auto_1448849 ) ( AVAILABLE ?auto_1448844 ) ( SURFACE-AT ?auto_1448842 ?auto_1448846 ) ( ON ?auto_1448842 ?auto_1448845 ) ( CLEAR ?auto_1448842 ) ( not ( = ?auto_1448842 ?auto_1448845 ) ) ( not ( = ?auto_1448841 ?auto_1448845 ) ) ( not ( = ?auto_1448840 ?auto_1448845 ) ) ( not ( = ?auto_1448848 ?auto_1448845 ) ) ( TRUCK-AT ?auto_1448843 ?auto_1448847 ) ( ON ?auto_1448838 ?auto_1448837 ) ( ON ?auto_1448839 ?auto_1448838 ) ( ON ?auto_1448836 ?auto_1448839 ) ( ON ?auto_1448840 ?auto_1448836 ) ( not ( = ?auto_1448837 ?auto_1448838 ) ) ( not ( = ?auto_1448837 ?auto_1448839 ) ) ( not ( = ?auto_1448837 ?auto_1448836 ) ) ( not ( = ?auto_1448837 ?auto_1448840 ) ) ( not ( = ?auto_1448837 ?auto_1448842 ) ) ( not ( = ?auto_1448837 ?auto_1448841 ) ) ( not ( = ?auto_1448837 ?auto_1448848 ) ) ( not ( = ?auto_1448837 ?auto_1448845 ) ) ( not ( = ?auto_1448838 ?auto_1448839 ) ) ( not ( = ?auto_1448838 ?auto_1448836 ) ) ( not ( = ?auto_1448838 ?auto_1448840 ) ) ( not ( = ?auto_1448838 ?auto_1448842 ) ) ( not ( = ?auto_1448838 ?auto_1448841 ) ) ( not ( = ?auto_1448838 ?auto_1448848 ) ) ( not ( = ?auto_1448838 ?auto_1448845 ) ) ( not ( = ?auto_1448839 ?auto_1448836 ) ) ( not ( = ?auto_1448839 ?auto_1448840 ) ) ( not ( = ?auto_1448839 ?auto_1448842 ) ) ( not ( = ?auto_1448839 ?auto_1448841 ) ) ( not ( = ?auto_1448839 ?auto_1448848 ) ) ( not ( = ?auto_1448839 ?auto_1448845 ) ) ( not ( = ?auto_1448836 ?auto_1448840 ) ) ( not ( = ?auto_1448836 ?auto_1448842 ) ) ( not ( = ?auto_1448836 ?auto_1448841 ) ) ( not ( = ?auto_1448836 ?auto_1448848 ) ) ( not ( = ?auto_1448836 ?auto_1448845 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1448840 ?auto_1448842 ?auto_1448841 )
      ( MAKE-6CRATE-VERIFY ?auto_1448837 ?auto_1448838 ?auto_1448839 ?auto_1448836 ?auto_1448840 ?auto_1448842 ?auto_1448841 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1448851 - SURFACE
      ?auto_1448852 - SURFACE
      ?auto_1448853 - SURFACE
      ?auto_1448850 - SURFACE
      ?auto_1448854 - SURFACE
      ?auto_1448856 - SURFACE
      ?auto_1448855 - SURFACE
      ?auto_1448857 - SURFACE
    )
    :vars
    (
      ?auto_1448864 - HOIST
      ?auto_1448862 - PLACE
      ?auto_1448861 - PLACE
      ?auto_1448859 - HOIST
      ?auto_1448863 - SURFACE
      ?auto_1448860 - SURFACE
      ?auto_1448858 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1448864 ?auto_1448862 ) ( IS-CRATE ?auto_1448857 ) ( not ( = ?auto_1448855 ?auto_1448857 ) ) ( not ( = ?auto_1448856 ?auto_1448855 ) ) ( not ( = ?auto_1448856 ?auto_1448857 ) ) ( not ( = ?auto_1448861 ?auto_1448862 ) ) ( HOIST-AT ?auto_1448859 ?auto_1448861 ) ( not ( = ?auto_1448864 ?auto_1448859 ) ) ( SURFACE-AT ?auto_1448857 ?auto_1448861 ) ( ON ?auto_1448857 ?auto_1448863 ) ( CLEAR ?auto_1448857 ) ( not ( = ?auto_1448855 ?auto_1448863 ) ) ( not ( = ?auto_1448857 ?auto_1448863 ) ) ( not ( = ?auto_1448856 ?auto_1448863 ) ) ( SURFACE-AT ?auto_1448856 ?auto_1448862 ) ( CLEAR ?auto_1448856 ) ( IS-CRATE ?auto_1448855 ) ( AVAILABLE ?auto_1448864 ) ( AVAILABLE ?auto_1448859 ) ( SURFACE-AT ?auto_1448855 ?auto_1448861 ) ( ON ?auto_1448855 ?auto_1448860 ) ( CLEAR ?auto_1448855 ) ( not ( = ?auto_1448855 ?auto_1448860 ) ) ( not ( = ?auto_1448857 ?auto_1448860 ) ) ( not ( = ?auto_1448856 ?auto_1448860 ) ) ( not ( = ?auto_1448863 ?auto_1448860 ) ) ( TRUCK-AT ?auto_1448858 ?auto_1448862 ) ( ON ?auto_1448852 ?auto_1448851 ) ( ON ?auto_1448853 ?auto_1448852 ) ( ON ?auto_1448850 ?auto_1448853 ) ( ON ?auto_1448854 ?auto_1448850 ) ( ON ?auto_1448856 ?auto_1448854 ) ( not ( = ?auto_1448851 ?auto_1448852 ) ) ( not ( = ?auto_1448851 ?auto_1448853 ) ) ( not ( = ?auto_1448851 ?auto_1448850 ) ) ( not ( = ?auto_1448851 ?auto_1448854 ) ) ( not ( = ?auto_1448851 ?auto_1448856 ) ) ( not ( = ?auto_1448851 ?auto_1448855 ) ) ( not ( = ?auto_1448851 ?auto_1448857 ) ) ( not ( = ?auto_1448851 ?auto_1448863 ) ) ( not ( = ?auto_1448851 ?auto_1448860 ) ) ( not ( = ?auto_1448852 ?auto_1448853 ) ) ( not ( = ?auto_1448852 ?auto_1448850 ) ) ( not ( = ?auto_1448852 ?auto_1448854 ) ) ( not ( = ?auto_1448852 ?auto_1448856 ) ) ( not ( = ?auto_1448852 ?auto_1448855 ) ) ( not ( = ?auto_1448852 ?auto_1448857 ) ) ( not ( = ?auto_1448852 ?auto_1448863 ) ) ( not ( = ?auto_1448852 ?auto_1448860 ) ) ( not ( = ?auto_1448853 ?auto_1448850 ) ) ( not ( = ?auto_1448853 ?auto_1448854 ) ) ( not ( = ?auto_1448853 ?auto_1448856 ) ) ( not ( = ?auto_1448853 ?auto_1448855 ) ) ( not ( = ?auto_1448853 ?auto_1448857 ) ) ( not ( = ?auto_1448853 ?auto_1448863 ) ) ( not ( = ?auto_1448853 ?auto_1448860 ) ) ( not ( = ?auto_1448850 ?auto_1448854 ) ) ( not ( = ?auto_1448850 ?auto_1448856 ) ) ( not ( = ?auto_1448850 ?auto_1448855 ) ) ( not ( = ?auto_1448850 ?auto_1448857 ) ) ( not ( = ?auto_1448850 ?auto_1448863 ) ) ( not ( = ?auto_1448850 ?auto_1448860 ) ) ( not ( = ?auto_1448854 ?auto_1448856 ) ) ( not ( = ?auto_1448854 ?auto_1448855 ) ) ( not ( = ?auto_1448854 ?auto_1448857 ) ) ( not ( = ?auto_1448854 ?auto_1448863 ) ) ( not ( = ?auto_1448854 ?auto_1448860 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1448856 ?auto_1448855 ?auto_1448857 )
      ( MAKE-7CRATE-VERIFY ?auto_1448851 ?auto_1448852 ?auto_1448853 ?auto_1448850 ?auto_1448854 ?auto_1448856 ?auto_1448855 ?auto_1448857 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1448866 - SURFACE
      ?auto_1448867 - SURFACE
      ?auto_1448868 - SURFACE
      ?auto_1448865 - SURFACE
      ?auto_1448869 - SURFACE
      ?auto_1448871 - SURFACE
      ?auto_1448870 - SURFACE
      ?auto_1448872 - SURFACE
      ?auto_1448873 - SURFACE
    )
    :vars
    (
      ?auto_1448880 - HOIST
      ?auto_1448878 - PLACE
      ?auto_1448877 - PLACE
      ?auto_1448875 - HOIST
      ?auto_1448879 - SURFACE
      ?auto_1448876 - SURFACE
      ?auto_1448874 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1448880 ?auto_1448878 ) ( IS-CRATE ?auto_1448873 ) ( not ( = ?auto_1448872 ?auto_1448873 ) ) ( not ( = ?auto_1448870 ?auto_1448872 ) ) ( not ( = ?auto_1448870 ?auto_1448873 ) ) ( not ( = ?auto_1448877 ?auto_1448878 ) ) ( HOIST-AT ?auto_1448875 ?auto_1448877 ) ( not ( = ?auto_1448880 ?auto_1448875 ) ) ( SURFACE-AT ?auto_1448873 ?auto_1448877 ) ( ON ?auto_1448873 ?auto_1448879 ) ( CLEAR ?auto_1448873 ) ( not ( = ?auto_1448872 ?auto_1448879 ) ) ( not ( = ?auto_1448873 ?auto_1448879 ) ) ( not ( = ?auto_1448870 ?auto_1448879 ) ) ( SURFACE-AT ?auto_1448870 ?auto_1448878 ) ( CLEAR ?auto_1448870 ) ( IS-CRATE ?auto_1448872 ) ( AVAILABLE ?auto_1448880 ) ( AVAILABLE ?auto_1448875 ) ( SURFACE-AT ?auto_1448872 ?auto_1448877 ) ( ON ?auto_1448872 ?auto_1448876 ) ( CLEAR ?auto_1448872 ) ( not ( = ?auto_1448872 ?auto_1448876 ) ) ( not ( = ?auto_1448873 ?auto_1448876 ) ) ( not ( = ?auto_1448870 ?auto_1448876 ) ) ( not ( = ?auto_1448879 ?auto_1448876 ) ) ( TRUCK-AT ?auto_1448874 ?auto_1448878 ) ( ON ?auto_1448867 ?auto_1448866 ) ( ON ?auto_1448868 ?auto_1448867 ) ( ON ?auto_1448865 ?auto_1448868 ) ( ON ?auto_1448869 ?auto_1448865 ) ( ON ?auto_1448871 ?auto_1448869 ) ( ON ?auto_1448870 ?auto_1448871 ) ( not ( = ?auto_1448866 ?auto_1448867 ) ) ( not ( = ?auto_1448866 ?auto_1448868 ) ) ( not ( = ?auto_1448866 ?auto_1448865 ) ) ( not ( = ?auto_1448866 ?auto_1448869 ) ) ( not ( = ?auto_1448866 ?auto_1448871 ) ) ( not ( = ?auto_1448866 ?auto_1448870 ) ) ( not ( = ?auto_1448866 ?auto_1448872 ) ) ( not ( = ?auto_1448866 ?auto_1448873 ) ) ( not ( = ?auto_1448866 ?auto_1448879 ) ) ( not ( = ?auto_1448866 ?auto_1448876 ) ) ( not ( = ?auto_1448867 ?auto_1448868 ) ) ( not ( = ?auto_1448867 ?auto_1448865 ) ) ( not ( = ?auto_1448867 ?auto_1448869 ) ) ( not ( = ?auto_1448867 ?auto_1448871 ) ) ( not ( = ?auto_1448867 ?auto_1448870 ) ) ( not ( = ?auto_1448867 ?auto_1448872 ) ) ( not ( = ?auto_1448867 ?auto_1448873 ) ) ( not ( = ?auto_1448867 ?auto_1448879 ) ) ( not ( = ?auto_1448867 ?auto_1448876 ) ) ( not ( = ?auto_1448868 ?auto_1448865 ) ) ( not ( = ?auto_1448868 ?auto_1448869 ) ) ( not ( = ?auto_1448868 ?auto_1448871 ) ) ( not ( = ?auto_1448868 ?auto_1448870 ) ) ( not ( = ?auto_1448868 ?auto_1448872 ) ) ( not ( = ?auto_1448868 ?auto_1448873 ) ) ( not ( = ?auto_1448868 ?auto_1448879 ) ) ( not ( = ?auto_1448868 ?auto_1448876 ) ) ( not ( = ?auto_1448865 ?auto_1448869 ) ) ( not ( = ?auto_1448865 ?auto_1448871 ) ) ( not ( = ?auto_1448865 ?auto_1448870 ) ) ( not ( = ?auto_1448865 ?auto_1448872 ) ) ( not ( = ?auto_1448865 ?auto_1448873 ) ) ( not ( = ?auto_1448865 ?auto_1448879 ) ) ( not ( = ?auto_1448865 ?auto_1448876 ) ) ( not ( = ?auto_1448869 ?auto_1448871 ) ) ( not ( = ?auto_1448869 ?auto_1448870 ) ) ( not ( = ?auto_1448869 ?auto_1448872 ) ) ( not ( = ?auto_1448869 ?auto_1448873 ) ) ( not ( = ?auto_1448869 ?auto_1448879 ) ) ( not ( = ?auto_1448869 ?auto_1448876 ) ) ( not ( = ?auto_1448871 ?auto_1448870 ) ) ( not ( = ?auto_1448871 ?auto_1448872 ) ) ( not ( = ?auto_1448871 ?auto_1448873 ) ) ( not ( = ?auto_1448871 ?auto_1448879 ) ) ( not ( = ?auto_1448871 ?auto_1448876 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1448870 ?auto_1448872 ?auto_1448873 )
      ( MAKE-8CRATE-VERIFY ?auto_1448866 ?auto_1448867 ?auto_1448868 ?auto_1448865 ?auto_1448869 ?auto_1448871 ?auto_1448870 ?auto_1448872 ?auto_1448873 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1448882 - SURFACE
      ?auto_1448883 - SURFACE
      ?auto_1448884 - SURFACE
      ?auto_1448881 - SURFACE
      ?auto_1448885 - SURFACE
      ?auto_1448887 - SURFACE
      ?auto_1448886 - SURFACE
      ?auto_1448888 - SURFACE
      ?auto_1448889 - SURFACE
      ?auto_1448890 - SURFACE
    )
    :vars
    (
      ?auto_1448897 - HOIST
      ?auto_1448895 - PLACE
      ?auto_1448894 - PLACE
      ?auto_1448892 - HOIST
      ?auto_1448896 - SURFACE
      ?auto_1448893 - SURFACE
      ?auto_1448891 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1448897 ?auto_1448895 ) ( IS-CRATE ?auto_1448890 ) ( not ( = ?auto_1448889 ?auto_1448890 ) ) ( not ( = ?auto_1448888 ?auto_1448889 ) ) ( not ( = ?auto_1448888 ?auto_1448890 ) ) ( not ( = ?auto_1448894 ?auto_1448895 ) ) ( HOIST-AT ?auto_1448892 ?auto_1448894 ) ( not ( = ?auto_1448897 ?auto_1448892 ) ) ( SURFACE-AT ?auto_1448890 ?auto_1448894 ) ( ON ?auto_1448890 ?auto_1448896 ) ( CLEAR ?auto_1448890 ) ( not ( = ?auto_1448889 ?auto_1448896 ) ) ( not ( = ?auto_1448890 ?auto_1448896 ) ) ( not ( = ?auto_1448888 ?auto_1448896 ) ) ( SURFACE-AT ?auto_1448888 ?auto_1448895 ) ( CLEAR ?auto_1448888 ) ( IS-CRATE ?auto_1448889 ) ( AVAILABLE ?auto_1448897 ) ( AVAILABLE ?auto_1448892 ) ( SURFACE-AT ?auto_1448889 ?auto_1448894 ) ( ON ?auto_1448889 ?auto_1448893 ) ( CLEAR ?auto_1448889 ) ( not ( = ?auto_1448889 ?auto_1448893 ) ) ( not ( = ?auto_1448890 ?auto_1448893 ) ) ( not ( = ?auto_1448888 ?auto_1448893 ) ) ( not ( = ?auto_1448896 ?auto_1448893 ) ) ( TRUCK-AT ?auto_1448891 ?auto_1448895 ) ( ON ?auto_1448883 ?auto_1448882 ) ( ON ?auto_1448884 ?auto_1448883 ) ( ON ?auto_1448881 ?auto_1448884 ) ( ON ?auto_1448885 ?auto_1448881 ) ( ON ?auto_1448887 ?auto_1448885 ) ( ON ?auto_1448886 ?auto_1448887 ) ( ON ?auto_1448888 ?auto_1448886 ) ( not ( = ?auto_1448882 ?auto_1448883 ) ) ( not ( = ?auto_1448882 ?auto_1448884 ) ) ( not ( = ?auto_1448882 ?auto_1448881 ) ) ( not ( = ?auto_1448882 ?auto_1448885 ) ) ( not ( = ?auto_1448882 ?auto_1448887 ) ) ( not ( = ?auto_1448882 ?auto_1448886 ) ) ( not ( = ?auto_1448882 ?auto_1448888 ) ) ( not ( = ?auto_1448882 ?auto_1448889 ) ) ( not ( = ?auto_1448882 ?auto_1448890 ) ) ( not ( = ?auto_1448882 ?auto_1448896 ) ) ( not ( = ?auto_1448882 ?auto_1448893 ) ) ( not ( = ?auto_1448883 ?auto_1448884 ) ) ( not ( = ?auto_1448883 ?auto_1448881 ) ) ( not ( = ?auto_1448883 ?auto_1448885 ) ) ( not ( = ?auto_1448883 ?auto_1448887 ) ) ( not ( = ?auto_1448883 ?auto_1448886 ) ) ( not ( = ?auto_1448883 ?auto_1448888 ) ) ( not ( = ?auto_1448883 ?auto_1448889 ) ) ( not ( = ?auto_1448883 ?auto_1448890 ) ) ( not ( = ?auto_1448883 ?auto_1448896 ) ) ( not ( = ?auto_1448883 ?auto_1448893 ) ) ( not ( = ?auto_1448884 ?auto_1448881 ) ) ( not ( = ?auto_1448884 ?auto_1448885 ) ) ( not ( = ?auto_1448884 ?auto_1448887 ) ) ( not ( = ?auto_1448884 ?auto_1448886 ) ) ( not ( = ?auto_1448884 ?auto_1448888 ) ) ( not ( = ?auto_1448884 ?auto_1448889 ) ) ( not ( = ?auto_1448884 ?auto_1448890 ) ) ( not ( = ?auto_1448884 ?auto_1448896 ) ) ( not ( = ?auto_1448884 ?auto_1448893 ) ) ( not ( = ?auto_1448881 ?auto_1448885 ) ) ( not ( = ?auto_1448881 ?auto_1448887 ) ) ( not ( = ?auto_1448881 ?auto_1448886 ) ) ( not ( = ?auto_1448881 ?auto_1448888 ) ) ( not ( = ?auto_1448881 ?auto_1448889 ) ) ( not ( = ?auto_1448881 ?auto_1448890 ) ) ( not ( = ?auto_1448881 ?auto_1448896 ) ) ( not ( = ?auto_1448881 ?auto_1448893 ) ) ( not ( = ?auto_1448885 ?auto_1448887 ) ) ( not ( = ?auto_1448885 ?auto_1448886 ) ) ( not ( = ?auto_1448885 ?auto_1448888 ) ) ( not ( = ?auto_1448885 ?auto_1448889 ) ) ( not ( = ?auto_1448885 ?auto_1448890 ) ) ( not ( = ?auto_1448885 ?auto_1448896 ) ) ( not ( = ?auto_1448885 ?auto_1448893 ) ) ( not ( = ?auto_1448887 ?auto_1448886 ) ) ( not ( = ?auto_1448887 ?auto_1448888 ) ) ( not ( = ?auto_1448887 ?auto_1448889 ) ) ( not ( = ?auto_1448887 ?auto_1448890 ) ) ( not ( = ?auto_1448887 ?auto_1448896 ) ) ( not ( = ?auto_1448887 ?auto_1448893 ) ) ( not ( = ?auto_1448886 ?auto_1448888 ) ) ( not ( = ?auto_1448886 ?auto_1448889 ) ) ( not ( = ?auto_1448886 ?auto_1448890 ) ) ( not ( = ?auto_1448886 ?auto_1448896 ) ) ( not ( = ?auto_1448886 ?auto_1448893 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1448888 ?auto_1448889 ?auto_1448890 )
      ( MAKE-9CRATE-VERIFY ?auto_1448882 ?auto_1448883 ?auto_1448884 ?auto_1448881 ?auto_1448885 ?auto_1448887 ?auto_1448886 ?auto_1448888 ?auto_1448889 ?auto_1448890 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1448899 - SURFACE
      ?auto_1448900 - SURFACE
      ?auto_1448901 - SURFACE
      ?auto_1448898 - SURFACE
      ?auto_1448902 - SURFACE
      ?auto_1448904 - SURFACE
      ?auto_1448903 - SURFACE
      ?auto_1448905 - SURFACE
      ?auto_1448906 - SURFACE
      ?auto_1448907 - SURFACE
      ?auto_1448908 - SURFACE
    )
    :vars
    (
      ?auto_1448915 - HOIST
      ?auto_1448913 - PLACE
      ?auto_1448912 - PLACE
      ?auto_1448910 - HOIST
      ?auto_1448914 - SURFACE
      ?auto_1448911 - SURFACE
      ?auto_1448909 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1448915 ?auto_1448913 ) ( IS-CRATE ?auto_1448908 ) ( not ( = ?auto_1448907 ?auto_1448908 ) ) ( not ( = ?auto_1448906 ?auto_1448907 ) ) ( not ( = ?auto_1448906 ?auto_1448908 ) ) ( not ( = ?auto_1448912 ?auto_1448913 ) ) ( HOIST-AT ?auto_1448910 ?auto_1448912 ) ( not ( = ?auto_1448915 ?auto_1448910 ) ) ( SURFACE-AT ?auto_1448908 ?auto_1448912 ) ( ON ?auto_1448908 ?auto_1448914 ) ( CLEAR ?auto_1448908 ) ( not ( = ?auto_1448907 ?auto_1448914 ) ) ( not ( = ?auto_1448908 ?auto_1448914 ) ) ( not ( = ?auto_1448906 ?auto_1448914 ) ) ( SURFACE-AT ?auto_1448906 ?auto_1448913 ) ( CLEAR ?auto_1448906 ) ( IS-CRATE ?auto_1448907 ) ( AVAILABLE ?auto_1448915 ) ( AVAILABLE ?auto_1448910 ) ( SURFACE-AT ?auto_1448907 ?auto_1448912 ) ( ON ?auto_1448907 ?auto_1448911 ) ( CLEAR ?auto_1448907 ) ( not ( = ?auto_1448907 ?auto_1448911 ) ) ( not ( = ?auto_1448908 ?auto_1448911 ) ) ( not ( = ?auto_1448906 ?auto_1448911 ) ) ( not ( = ?auto_1448914 ?auto_1448911 ) ) ( TRUCK-AT ?auto_1448909 ?auto_1448913 ) ( ON ?auto_1448900 ?auto_1448899 ) ( ON ?auto_1448901 ?auto_1448900 ) ( ON ?auto_1448898 ?auto_1448901 ) ( ON ?auto_1448902 ?auto_1448898 ) ( ON ?auto_1448904 ?auto_1448902 ) ( ON ?auto_1448903 ?auto_1448904 ) ( ON ?auto_1448905 ?auto_1448903 ) ( ON ?auto_1448906 ?auto_1448905 ) ( not ( = ?auto_1448899 ?auto_1448900 ) ) ( not ( = ?auto_1448899 ?auto_1448901 ) ) ( not ( = ?auto_1448899 ?auto_1448898 ) ) ( not ( = ?auto_1448899 ?auto_1448902 ) ) ( not ( = ?auto_1448899 ?auto_1448904 ) ) ( not ( = ?auto_1448899 ?auto_1448903 ) ) ( not ( = ?auto_1448899 ?auto_1448905 ) ) ( not ( = ?auto_1448899 ?auto_1448906 ) ) ( not ( = ?auto_1448899 ?auto_1448907 ) ) ( not ( = ?auto_1448899 ?auto_1448908 ) ) ( not ( = ?auto_1448899 ?auto_1448914 ) ) ( not ( = ?auto_1448899 ?auto_1448911 ) ) ( not ( = ?auto_1448900 ?auto_1448901 ) ) ( not ( = ?auto_1448900 ?auto_1448898 ) ) ( not ( = ?auto_1448900 ?auto_1448902 ) ) ( not ( = ?auto_1448900 ?auto_1448904 ) ) ( not ( = ?auto_1448900 ?auto_1448903 ) ) ( not ( = ?auto_1448900 ?auto_1448905 ) ) ( not ( = ?auto_1448900 ?auto_1448906 ) ) ( not ( = ?auto_1448900 ?auto_1448907 ) ) ( not ( = ?auto_1448900 ?auto_1448908 ) ) ( not ( = ?auto_1448900 ?auto_1448914 ) ) ( not ( = ?auto_1448900 ?auto_1448911 ) ) ( not ( = ?auto_1448901 ?auto_1448898 ) ) ( not ( = ?auto_1448901 ?auto_1448902 ) ) ( not ( = ?auto_1448901 ?auto_1448904 ) ) ( not ( = ?auto_1448901 ?auto_1448903 ) ) ( not ( = ?auto_1448901 ?auto_1448905 ) ) ( not ( = ?auto_1448901 ?auto_1448906 ) ) ( not ( = ?auto_1448901 ?auto_1448907 ) ) ( not ( = ?auto_1448901 ?auto_1448908 ) ) ( not ( = ?auto_1448901 ?auto_1448914 ) ) ( not ( = ?auto_1448901 ?auto_1448911 ) ) ( not ( = ?auto_1448898 ?auto_1448902 ) ) ( not ( = ?auto_1448898 ?auto_1448904 ) ) ( not ( = ?auto_1448898 ?auto_1448903 ) ) ( not ( = ?auto_1448898 ?auto_1448905 ) ) ( not ( = ?auto_1448898 ?auto_1448906 ) ) ( not ( = ?auto_1448898 ?auto_1448907 ) ) ( not ( = ?auto_1448898 ?auto_1448908 ) ) ( not ( = ?auto_1448898 ?auto_1448914 ) ) ( not ( = ?auto_1448898 ?auto_1448911 ) ) ( not ( = ?auto_1448902 ?auto_1448904 ) ) ( not ( = ?auto_1448902 ?auto_1448903 ) ) ( not ( = ?auto_1448902 ?auto_1448905 ) ) ( not ( = ?auto_1448902 ?auto_1448906 ) ) ( not ( = ?auto_1448902 ?auto_1448907 ) ) ( not ( = ?auto_1448902 ?auto_1448908 ) ) ( not ( = ?auto_1448902 ?auto_1448914 ) ) ( not ( = ?auto_1448902 ?auto_1448911 ) ) ( not ( = ?auto_1448904 ?auto_1448903 ) ) ( not ( = ?auto_1448904 ?auto_1448905 ) ) ( not ( = ?auto_1448904 ?auto_1448906 ) ) ( not ( = ?auto_1448904 ?auto_1448907 ) ) ( not ( = ?auto_1448904 ?auto_1448908 ) ) ( not ( = ?auto_1448904 ?auto_1448914 ) ) ( not ( = ?auto_1448904 ?auto_1448911 ) ) ( not ( = ?auto_1448903 ?auto_1448905 ) ) ( not ( = ?auto_1448903 ?auto_1448906 ) ) ( not ( = ?auto_1448903 ?auto_1448907 ) ) ( not ( = ?auto_1448903 ?auto_1448908 ) ) ( not ( = ?auto_1448903 ?auto_1448914 ) ) ( not ( = ?auto_1448903 ?auto_1448911 ) ) ( not ( = ?auto_1448905 ?auto_1448906 ) ) ( not ( = ?auto_1448905 ?auto_1448907 ) ) ( not ( = ?auto_1448905 ?auto_1448908 ) ) ( not ( = ?auto_1448905 ?auto_1448914 ) ) ( not ( = ?auto_1448905 ?auto_1448911 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1448906 ?auto_1448907 ?auto_1448908 )
      ( MAKE-10CRATE-VERIFY ?auto_1448899 ?auto_1448900 ?auto_1448901 ?auto_1448898 ?auto_1448902 ?auto_1448904 ?auto_1448903 ?auto_1448905 ?auto_1448906 ?auto_1448907 ?auto_1448908 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1448916 - SURFACE
      ?auto_1448917 - SURFACE
    )
    :vars
    (
      ?auto_1448925 - HOIST
      ?auto_1448922 - PLACE
      ?auto_1448923 - SURFACE
      ?auto_1448921 - PLACE
      ?auto_1448919 - HOIST
      ?auto_1448924 - SURFACE
      ?auto_1448920 - SURFACE
      ?auto_1448918 - TRUCK
      ?auto_1448926 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1448925 ?auto_1448922 ) ( IS-CRATE ?auto_1448917 ) ( not ( = ?auto_1448916 ?auto_1448917 ) ) ( not ( = ?auto_1448923 ?auto_1448916 ) ) ( not ( = ?auto_1448923 ?auto_1448917 ) ) ( not ( = ?auto_1448921 ?auto_1448922 ) ) ( HOIST-AT ?auto_1448919 ?auto_1448921 ) ( not ( = ?auto_1448925 ?auto_1448919 ) ) ( SURFACE-AT ?auto_1448917 ?auto_1448921 ) ( ON ?auto_1448917 ?auto_1448924 ) ( CLEAR ?auto_1448917 ) ( not ( = ?auto_1448916 ?auto_1448924 ) ) ( not ( = ?auto_1448917 ?auto_1448924 ) ) ( not ( = ?auto_1448923 ?auto_1448924 ) ) ( IS-CRATE ?auto_1448916 ) ( AVAILABLE ?auto_1448919 ) ( SURFACE-AT ?auto_1448916 ?auto_1448921 ) ( ON ?auto_1448916 ?auto_1448920 ) ( CLEAR ?auto_1448916 ) ( not ( = ?auto_1448916 ?auto_1448920 ) ) ( not ( = ?auto_1448917 ?auto_1448920 ) ) ( not ( = ?auto_1448923 ?auto_1448920 ) ) ( not ( = ?auto_1448924 ?auto_1448920 ) ) ( TRUCK-AT ?auto_1448918 ?auto_1448922 ) ( SURFACE-AT ?auto_1448926 ?auto_1448922 ) ( CLEAR ?auto_1448926 ) ( LIFTING ?auto_1448925 ?auto_1448923 ) ( IS-CRATE ?auto_1448923 ) ( not ( = ?auto_1448926 ?auto_1448923 ) ) ( not ( = ?auto_1448916 ?auto_1448926 ) ) ( not ( = ?auto_1448917 ?auto_1448926 ) ) ( not ( = ?auto_1448924 ?auto_1448926 ) ) ( not ( = ?auto_1448920 ?auto_1448926 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1448926 ?auto_1448923 )
      ( MAKE-2CRATE ?auto_1448923 ?auto_1448916 ?auto_1448917 )
      ( MAKE-1CRATE-VERIFY ?auto_1448916 ?auto_1448917 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1448927 - SURFACE
      ?auto_1448928 - SURFACE
      ?auto_1448929 - SURFACE
    )
    :vars
    (
      ?auto_1448934 - HOIST
      ?auto_1448931 - PLACE
      ?auto_1448933 - PLACE
      ?auto_1448932 - HOIST
      ?auto_1448937 - SURFACE
      ?auto_1448935 - SURFACE
      ?auto_1448936 - TRUCK
      ?auto_1448930 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1448934 ?auto_1448931 ) ( IS-CRATE ?auto_1448929 ) ( not ( = ?auto_1448928 ?auto_1448929 ) ) ( not ( = ?auto_1448927 ?auto_1448928 ) ) ( not ( = ?auto_1448927 ?auto_1448929 ) ) ( not ( = ?auto_1448933 ?auto_1448931 ) ) ( HOIST-AT ?auto_1448932 ?auto_1448933 ) ( not ( = ?auto_1448934 ?auto_1448932 ) ) ( SURFACE-AT ?auto_1448929 ?auto_1448933 ) ( ON ?auto_1448929 ?auto_1448937 ) ( CLEAR ?auto_1448929 ) ( not ( = ?auto_1448928 ?auto_1448937 ) ) ( not ( = ?auto_1448929 ?auto_1448937 ) ) ( not ( = ?auto_1448927 ?auto_1448937 ) ) ( IS-CRATE ?auto_1448928 ) ( AVAILABLE ?auto_1448932 ) ( SURFACE-AT ?auto_1448928 ?auto_1448933 ) ( ON ?auto_1448928 ?auto_1448935 ) ( CLEAR ?auto_1448928 ) ( not ( = ?auto_1448928 ?auto_1448935 ) ) ( not ( = ?auto_1448929 ?auto_1448935 ) ) ( not ( = ?auto_1448927 ?auto_1448935 ) ) ( not ( = ?auto_1448937 ?auto_1448935 ) ) ( TRUCK-AT ?auto_1448936 ?auto_1448931 ) ( SURFACE-AT ?auto_1448930 ?auto_1448931 ) ( CLEAR ?auto_1448930 ) ( LIFTING ?auto_1448934 ?auto_1448927 ) ( IS-CRATE ?auto_1448927 ) ( not ( = ?auto_1448930 ?auto_1448927 ) ) ( not ( = ?auto_1448928 ?auto_1448930 ) ) ( not ( = ?auto_1448929 ?auto_1448930 ) ) ( not ( = ?auto_1448937 ?auto_1448930 ) ) ( not ( = ?auto_1448935 ?auto_1448930 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1448928 ?auto_1448929 )
      ( MAKE-2CRATE-VERIFY ?auto_1448927 ?auto_1448928 ?auto_1448929 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1448939 - SURFACE
      ?auto_1448940 - SURFACE
      ?auto_1448941 - SURFACE
      ?auto_1448938 - SURFACE
    )
    :vars
    (
      ?auto_1448944 - HOIST
      ?auto_1448948 - PLACE
      ?auto_1448946 - PLACE
      ?auto_1448943 - HOIST
      ?auto_1448947 - SURFACE
      ?auto_1448945 - SURFACE
      ?auto_1448942 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1448944 ?auto_1448948 ) ( IS-CRATE ?auto_1448938 ) ( not ( = ?auto_1448941 ?auto_1448938 ) ) ( not ( = ?auto_1448940 ?auto_1448941 ) ) ( not ( = ?auto_1448940 ?auto_1448938 ) ) ( not ( = ?auto_1448946 ?auto_1448948 ) ) ( HOIST-AT ?auto_1448943 ?auto_1448946 ) ( not ( = ?auto_1448944 ?auto_1448943 ) ) ( SURFACE-AT ?auto_1448938 ?auto_1448946 ) ( ON ?auto_1448938 ?auto_1448947 ) ( CLEAR ?auto_1448938 ) ( not ( = ?auto_1448941 ?auto_1448947 ) ) ( not ( = ?auto_1448938 ?auto_1448947 ) ) ( not ( = ?auto_1448940 ?auto_1448947 ) ) ( IS-CRATE ?auto_1448941 ) ( AVAILABLE ?auto_1448943 ) ( SURFACE-AT ?auto_1448941 ?auto_1448946 ) ( ON ?auto_1448941 ?auto_1448945 ) ( CLEAR ?auto_1448941 ) ( not ( = ?auto_1448941 ?auto_1448945 ) ) ( not ( = ?auto_1448938 ?auto_1448945 ) ) ( not ( = ?auto_1448940 ?auto_1448945 ) ) ( not ( = ?auto_1448947 ?auto_1448945 ) ) ( TRUCK-AT ?auto_1448942 ?auto_1448948 ) ( SURFACE-AT ?auto_1448939 ?auto_1448948 ) ( CLEAR ?auto_1448939 ) ( LIFTING ?auto_1448944 ?auto_1448940 ) ( IS-CRATE ?auto_1448940 ) ( not ( = ?auto_1448939 ?auto_1448940 ) ) ( not ( = ?auto_1448941 ?auto_1448939 ) ) ( not ( = ?auto_1448938 ?auto_1448939 ) ) ( not ( = ?auto_1448947 ?auto_1448939 ) ) ( not ( = ?auto_1448945 ?auto_1448939 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1448940 ?auto_1448941 ?auto_1448938 )
      ( MAKE-3CRATE-VERIFY ?auto_1448939 ?auto_1448940 ?auto_1448941 ?auto_1448938 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1448950 - SURFACE
      ?auto_1448951 - SURFACE
      ?auto_1448952 - SURFACE
      ?auto_1448949 - SURFACE
      ?auto_1448953 - SURFACE
    )
    :vars
    (
      ?auto_1448956 - HOIST
      ?auto_1448960 - PLACE
      ?auto_1448958 - PLACE
      ?auto_1448955 - HOIST
      ?auto_1448959 - SURFACE
      ?auto_1448957 - SURFACE
      ?auto_1448954 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1448956 ?auto_1448960 ) ( IS-CRATE ?auto_1448953 ) ( not ( = ?auto_1448949 ?auto_1448953 ) ) ( not ( = ?auto_1448952 ?auto_1448949 ) ) ( not ( = ?auto_1448952 ?auto_1448953 ) ) ( not ( = ?auto_1448958 ?auto_1448960 ) ) ( HOIST-AT ?auto_1448955 ?auto_1448958 ) ( not ( = ?auto_1448956 ?auto_1448955 ) ) ( SURFACE-AT ?auto_1448953 ?auto_1448958 ) ( ON ?auto_1448953 ?auto_1448959 ) ( CLEAR ?auto_1448953 ) ( not ( = ?auto_1448949 ?auto_1448959 ) ) ( not ( = ?auto_1448953 ?auto_1448959 ) ) ( not ( = ?auto_1448952 ?auto_1448959 ) ) ( IS-CRATE ?auto_1448949 ) ( AVAILABLE ?auto_1448955 ) ( SURFACE-AT ?auto_1448949 ?auto_1448958 ) ( ON ?auto_1448949 ?auto_1448957 ) ( CLEAR ?auto_1448949 ) ( not ( = ?auto_1448949 ?auto_1448957 ) ) ( not ( = ?auto_1448953 ?auto_1448957 ) ) ( not ( = ?auto_1448952 ?auto_1448957 ) ) ( not ( = ?auto_1448959 ?auto_1448957 ) ) ( TRUCK-AT ?auto_1448954 ?auto_1448960 ) ( SURFACE-AT ?auto_1448951 ?auto_1448960 ) ( CLEAR ?auto_1448951 ) ( LIFTING ?auto_1448956 ?auto_1448952 ) ( IS-CRATE ?auto_1448952 ) ( not ( = ?auto_1448951 ?auto_1448952 ) ) ( not ( = ?auto_1448949 ?auto_1448951 ) ) ( not ( = ?auto_1448953 ?auto_1448951 ) ) ( not ( = ?auto_1448959 ?auto_1448951 ) ) ( not ( = ?auto_1448957 ?auto_1448951 ) ) ( ON ?auto_1448951 ?auto_1448950 ) ( not ( = ?auto_1448950 ?auto_1448951 ) ) ( not ( = ?auto_1448950 ?auto_1448952 ) ) ( not ( = ?auto_1448950 ?auto_1448949 ) ) ( not ( = ?auto_1448950 ?auto_1448953 ) ) ( not ( = ?auto_1448950 ?auto_1448959 ) ) ( not ( = ?auto_1448950 ?auto_1448957 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1448952 ?auto_1448949 ?auto_1448953 )
      ( MAKE-4CRATE-VERIFY ?auto_1448950 ?auto_1448951 ?auto_1448952 ?auto_1448949 ?auto_1448953 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1448962 - SURFACE
      ?auto_1448963 - SURFACE
      ?auto_1448964 - SURFACE
      ?auto_1448961 - SURFACE
      ?auto_1448965 - SURFACE
      ?auto_1448966 - SURFACE
    )
    :vars
    (
      ?auto_1448969 - HOIST
      ?auto_1448973 - PLACE
      ?auto_1448971 - PLACE
      ?auto_1448968 - HOIST
      ?auto_1448972 - SURFACE
      ?auto_1448970 - SURFACE
      ?auto_1448967 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1448969 ?auto_1448973 ) ( IS-CRATE ?auto_1448966 ) ( not ( = ?auto_1448965 ?auto_1448966 ) ) ( not ( = ?auto_1448961 ?auto_1448965 ) ) ( not ( = ?auto_1448961 ?auto_1448966 ) ) ( not ( = ?auto_1448971 ?auto_1448973 ) ) ( HOIST-AT ?auto_1448968 ?auto_1448971 ) ( not ( = ?auto_1448969 ?auto_1448968 ) ) ( SURFACE-AT ?auto_1448966 ?auto_1448971 ) ( ON ?auto_1448966 ?auto_1448972 ) ( CLEAR ?auto_1448966 ) ( not ( = ?auto_1448965 ?auto_1448972 ) ) ( not ( = ?auto_1448966 ?auto_1448972 ) ) ( not ( = ?auto_1448961 ?auto_1448972 ) ) ( IS-CRATE ?auto_1448965 ) ( AVAILABLE ?auto_1448968 ) ( SURFACE-AT ?auto_1448965 ?auto_1448971 ) ( ON ?auto_1448965 ?auto_1448970 ) ( CLEAR ?auto_1448965 ) ( not ( = ?auto_1448965 ?auto_1448970 ) ) ( not ( = ?auto_1448966 ?auto_1448970 ) ) ( not ( = ?auto_1448961 ?auto_1448970 ) ) ( not ( = ?auto_1448972 ?auto_1448970 ) ) ( TRUCK-AT ?auto_1448967 ?auto_1448973 ) ( SURFACE-AT ?auto_1448964 ?auto_1448973 ) ( CLEAR ?auto_1448964 ) ( LIFTING ?auto_1448969 ?auto_1448961 ) ( IS-CRATE ?auto_1448961 ) ( not ( = ?auto_1448964 ?auto_1448961 ) ) ( not ( = ?auto_1448965 ?auto_1448964 ) ) ( not ( = ?auto_1448966 ?auto_1448964 ) ) ( not ( = ?auto_1448972 ?auto_1448964 ) ) ( not ( = ?auto_1448970 ?auto_1448964 ) ) ( ON ?auto_1448963 ?auto_1448962 ) ( ON ?auto_1448964 ?auto_1448963 ) ( not ( = ?auto_1448962 ?auto_1448963 ) ) ( not ( = ?auto_1448962 ?auto_1448964 ) ) ( not ( = ?auto_1448962 ?auto_1448961 ) ) ( not ( = ?auto_1448962 ?auto_1448965 ) ) ( not ( = ?auto_1448962 ?auto_1448966 ) ) ( not ( = ?auto_1448962 ?auto_1448972 ) ) ( not ( = ?auto_1448962 ?auto_1448970 ) ) ( not ( = ?auto_1448963 ?auto_1448964 ) ) ( not ( = ?auto_1448963 ?auto_1448961 ) ) ( not ( = ?auto_1448963 ?auto_1448965 ) ) ( not ( = ?auto_1448963 ?auto_1448966 ) ) ( not ( = ?auto_1448963 ?auto_1448972 ) ) ( not ( = ?auto_1448963 ?auto_1448970 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1448961 ?auto_1448965 ?auto_1448966 )
      ( MAKE-5CRATE-VERIFY ?auto_1448962 ?auto_1448963 ?auto_1448964 ?auto_1448961 ?auto_1448965 ?auto_1448966 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1448975 - SURFACE
      ?auto_1448976 - SURFACE
      ?auto_1448977 - SURFACE
      ?auto_1448974 - SURFACE
      ?auto_1448978 - SURFACE
      ?auto_1448980 - SURFACE
      ?auto_1448979 - SURFACE
    )
    :vars
    (
      ?auto_1448983 - HOIST
      ?auto_1448987 - PLACE
      ?auto_1448985 - PLACE
      ?auto_1448982 - HOIST
      ?auto_1448986 - SURFACE
      ?auto_1448984 - SURFACE
      ?auto_1448981 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1448983 ?auto_1448987 ) ( IS-CRATE ?auto_1448979 ) ( not ( = ?auto_1448980 ?auto_1448979 ) ) ( not ( = ?auto_1448978 ?auto_1448980 ) ) ( not ( = ?auto_1448978 ?auto_1448979 ) ) ( not ( = ?auto_1448985 ?auto_1448987 ) ) ( HOIST-AT ?auto_1448982 ?auto_1448985 ) ( not ( = ?auto_1448983 ?auto_1448982 ) ) ( SURFACE-AT ?auto_1448979 ?auto_1448985 ) ( ON ?auto_1448979 ?auto_1448986 ) ( CLEAR ?auto_1448979 ) ( not ( = ?auto_1448980 ?auto_1448986 ) ) ( not ( = ?auto_1448979 ?auto_1448986 ) ) ( not ( = ?auto_1448978 ?auto_1448986 ) ) ( IS-CRATE ?auto_1448980 ) ( AVAILABLE ?auto_1448982 ) ( SURFACE-AT ?auto_1448980 ?auto_1448985 ) ( ON ?auto_1448980 ?auto_1448984 ) ( CLEAR ?auto_1448980 ) ( not ( = ?auto_1448980 ?auto_1448984 ) ) ( not ( = ?auto_1448979 ?auto_1448984 ) ) ( not ( = ?auto_1448978 ?auto_1448984 ) ) ( not ( = ?auto_1448986 ?auto_1448984 ) ) ( TRUCK-AT ?auto_1448981 ?auto_1448987 ) ( SURFACE-AT ?auto_1448974 ?auto_1448987 ) ( CLEAR ?auto_1448974 ) ( LIFTING ?auto_1448983 ?auto_1448978 ) ( IS-CRATE ?auto_1448978 ) ( not ( = ?auto_1448974 ?auto_1448978 ) ) ( not ( = ?auto_1448980 ?auto_1448974 ) ) ( not ( = ?auto_1448979 ?auto_1448974 ) ) ( not ( = ?auto_1448986 ?auto_1448974 ) ) ( not ( = ?auto_1448984 ?auto_1448974 ) ) ( ON ?auto_1448976 ?auto_1448975 ) ( ON ?auto_1448977 ?auto_1448976 ) ( ON ?auto_1448974 ?auto_1448977 ) ( not ( = ?auto_1448975 ?auto_1448976 ) ) ( not ( = ?auto_1448975 ?auto_1448977 ) ) ( not ( = ?auto_1448975 ?auto_1448974 ) ) ( not ( = ?auto_1448975 ?auto_1448978 ) ) ( not ( = ?auto_1448975 ?auto_1448980 ) ) ( not ( = ?auto_1448975 ?auto_1448979 ) ) ( not ( = ?auto_1448975 ?auto_1448986 ) ) ( not ( = ?auto_1448975 ?auto_1448984 ) ) ( not ( = ?auto_1448976 ?auto_1448977 ) ) ( not ( = ?auto_1448976 ?auto_1448974 ) ) ( not ( = ?auto_1448976 ?auto_1448978 ) ) ( not ( = ?auto_1448976 ?auto_1448980 ) ) ( not ( = ?auto_1448976 ?auto_1448979 ) ) ( not ( = ?auto_1448976 ?auto_1448986 ) ) ( not ( = ?auto_1448976 ?auto_1448984 ) ) ( not ( = ?auto_1448977 ?auto_1448974 ) ) ( not ( = ?auto_1448977 ?auto_1448978 ) ) ( not ( = ?auto_1448977 ?auto_1448980 ) ) ( not ( = ?auto_1448977 ?auto_1448979 ) ) ( not ( = ?auto_1448977 ?auto_1448986 ) ) ( not ( = ?auto_1448977 ?auto_1448984 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1448978 ?auto_1448980 ?auto_1448979 )
      ( MAKE-6CRATE-VERIFY ?auto_1448975 ?auto_1448976 ?auto_1448977 ?auto_1448974 ?auto_1448978 ?auto_1448980 ?auto_1448979 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1448989 - SURFACE
      ?auto_1448990 - SURFACE
      ?auto_1448991 - SURFACE
      ?auto_1448988 - SURFACE
      ?auto_1448992 - SURFACE
      ?auto_1448994 - SURFACE
      ?auto_1448993 - SURFACE
      ?auto_1448995 - SURFACE
    )
    :vars
    (
      ?auto_1448998 - HOIST
      ?auto_1449002 - PLACE
      ?auto_1449000 - PLACE
      ?auto_1448997 - HOIST
      ?auto_1449001 - SURFACE
      ?auto_1448999 - SURFACE
      ?auto_1448996 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1448998 ?auto_1449002 ) ( IS-CRATE ?auto_1448995 ) ( not ( = ?auto_1448993 ?auto_1448995 ) ) ( not ( = ?auto_1448994 ?auto_1448993 ) ) ( not ( = ?auto_1448994 ?auto_1448995 ) ) ( not ( = ?auto_1449000 ?auto_1449002 ) ) ( HOIST-AT ?auto_1448997 ?auto_1449000 ) ( not ( = ?auto_1448998 ?auto_1448997 ) ) ( SURFACE-AT ?auto_1448995 ?auto_1449000 ) ( ON ?auto_1448995 ?auto_1449001 ) ( CLEAR ?auto_1448995 ) ( not ( = ?auto_1448993 ?auto_1449001 ) ) ( not ( = ?auto_1448995 ?auto_1449001 ) ) ( not ( = ?auto_1448994 ?auto_1449001 ) ) ( IS-CRATE ?auto_1448993 ) ( AVAILABLE ?auto_1448997 ) ( SURFACE-AT ?auto_1448993 ?auto_1449000 ) ( ON ?auto_1448993 ?auto_1448999 ) ( CLEAR ?auto_1448993 ) ( not ( = ?auto_1448993 ?auto_1448999 ) ) ( not ( = ?auto_1448995 ?auto_1448999 ) ) ( not ( = ?auto_1448994 ?auto_1448999 ) ) ( not ( = ?auto_1449001 ?auto_1448999 ) ) ( TRUCK-AT ?auto_1448996 ?auto_1449002 ) ( SURFACE-AT ?auto_1448992 ?auto_1449002 ) ( CLEAR ?auto_1448992 ) ( LIFTING ?auto_1448998 ?auto_1448994 ) ( IS-CRATE ?auto_1448994 ) ( not ( = ?auto_1448992 ?auto_1448994 ) ) ( not ( = ?auto_1448993 ?auto_1448992 ) ) ( not ( = ?auto_1448995 ?auto_1448992 ) ) ( not ( = ?auto_1449001 ?auto_1448992 ) ) ( not ( = ?auto_1448999 ?auto_1448992 ) ) ( ON ?auto_1448990 ?auto_1448989 ) ( ON ?auto_1448991 ?auto_1448990 ) ( ON ?auto_1448988 ?auto_1448991 ) ( ON ?auto_1448992 ?auto_1448988 ) ( not ( = ?auto_1448989 ?auto_1448990 ) ) ( not ( = ?auto_1448989 ?auto_1448991 ) ) ( not ( = ?auto_1448989 ?auto_1448988 ) ) ( not ( = ?auto_1448989 ?auto_1448992 ) ) ( not ( = ?auto_1448989 ?auto_1448994 ) ) ( not ( = ?auto_1448989 ?auto_1448993 ) ) ( not ( = ?auto_1448989 ?auto_1448995 ) ) ( not ( = ?auto_1448989 ?auto_1449001 ) ) ( not ( = ?auto_1448989 ?auto_1448999 ) ) ( not ( = ?auto_1448990 ?auto_1448991 ) ) ( not ( = ?auto_1448990 ?auto_1448988 ) ) ( not ( = ?auto_1448990 ?auto_1448992 ) ) ( not ( = ?auto_1448990 ?auto_1448994 ) ) ( not ( = ?auto_1448990 ?auto_1448993 ) ) ( not ( = ?auto_1448990 ?auto_1448995 ) ) ( not ( = ?auto_1448990 ?auto_1449001 ) ) ( not ( = ?auto_1448990 ?auto_1448999 ) ) ( not ( = ?auto_1448991 ?auto_1448988 ) ) ( not ( = ?auto_1448991 ?auto_1448992 ) ) ( not ( = ?auto_1448991 ?auto_1448994 ) ) ( not ( = ?auto_1448991 ?auto_1448993 ) ) ( not ( = ?auto_1448991 ?auto_1448995 ) ) ( not ( = ?auto_1448991 ?auto_1449001 ) ) ( not ( = ?auto_1448991 ?auto_1448999 ) ) ( not ( = ?auto_1448988 ?auto_1448992 ) ) ( not ( = ?auto_1448988 ?auto_1448994 ) ) ( not ( = ?auto_1448988 ?auto_1448993 ) ) ( not ( = ?auto_1448988 ?auto_1448995 ) ) ( not ( = ?auto_1448988 ?auto_1449001 ) ) ( not ( = ?auto_1448988 ?auto_1448999 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1448994 ?auto_1448993 ?auto_1448995 )
      ( MAKE-7CRATE-VERIFY ?auto_1448989 ?auto_1448990 ?auto_1448991 ?auto_1448988 ?auto_1448992 ?auto_1448994 ?auto_1448993 ?auto_1448995 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1449004 - SURFACE
      ?auto_1449005 - SURFACE
      ?auto_1449006 - SURFACE
      ?auto_1449003 - SURFACE
      ?auto_1449007 - SURFACE
      ?auto_1449009 - SURFACE
      ?auto_1449008 - SURFACE
      ?auto_1449010 - SURFACE
      ?auto_1449011 - SURFACE
    )
    :vars
    (
      ?auto_1449014 - HOIST
      ?auto_1449018 - PLACE
      ?auto_1449016 - PLACE
      ?auto_1449013 - HOIST
      ?auto_1449017 - SURFACE
      ?auto_1449015 - SURFACE
      ?auto_1449012 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1449014 ?auto_1449018 ) ( IS-CRATE ?auto_1449011 ) ( not ( = ?auto_1449010 ?auto_1449011 ) ) ( not ( = ?auto_1449008 ?auto_1449010 ) ) ( not ( = ?auto_1449008 ?auto_1449011 ) ) ( not ( = ?auto_1449016 ?auto_1449018 ) ) ( HOIST-AT ?auto_1449013 ?auto_1449016 ) ( not ( = ?auto_1449014 ?auto_1449013 ) ) ( SURFACE-AT ?auto_1449011 ?auto_1449016 ) ( ON ?auto_1449011 ?auto_1449017 ) ( CLEAR ?auto_1449011 ) ( not ( = ?auto_1449010 ?auto_1449017 ) ) ( not ( = ?auto_1449011 ?auto_1449017 ) ) ( not ( = ?auto_1449008 ?auto_1449017 ) ) ( IS-CRATE ?auto_1449010 ) ( AVAILABLE ?auto_1449013 ) ( SURFACE-AT ?auto_1449010 ?auto_1449016 ) ( ON ?auto_1449010 ?auto_1449015 ) ( CLEAR ?auto_1449010 ) ( not ( = ?auto_1449010 ?auto_1449015 ) ) ( not ( = ?auto_1449011 ?auto_1449015 ) ) ( not ( = ?auto_1449008 ?auto_1449015 ) ) ( not ( = ?auto_1449017 ?auto_1449015 ) ) ( TRUCK-AT ?auto_1449012 ?auto_1449018 ) ( SURFACE-AT ?auto_1449009 ?auto_1449018 ) ( CLEAR ?auto_1449009 ) ( LIFTING ?auto_1449014 ?auto_1449008 ) ( IS-CRATE ?auto_1449008 ) ( not ( = ?auto_1449009 ?auto_1449008 ) ) ( not ( = ?auto_1449010 ?auto_1449009 ) ) ( not ( = ?auto_1449011 ?auto_1449009 ) ) ( not ( = ?auto_1449017 ?auto_1449009 ) ) ( not ( = ?auto_1449015 ?auto_1449009 ) ) ( ON ?auto_1449005 ?auto_1449004 ) ( ON ?auto_1449006 ?auto_1449005 ) ( ON ?auto_1449003 ?auto_1449006 ) ( ON ?auto_1449007 ?auto_1449003 ) ( ON ?auto_1449009 ?auto_1449007 ) ( not ( = ?auto_1449004 ?auto_1449005 ) ) ( not ( = ?auto_1449004 ?auto_1449006 ) ) ( not ( = ?auto_1449004 ?auto_1449003 ) ) ( not ( = ?auto_1449004 ?auto_1449007 ) ) ( not ( = ?auto_1449004 ?auto_1449009 ) ) ( not ( = ?auto_1449004 ?auto_1449008 ) ) ( not ( = ?auto_1449004 ?auto_1449010 ) ) ( not ( = ?auto_1449004 ?auto_1449011 ) ) ( not ( = ?auto_1449004 ?auto_1449017 ) ) ( not ( = ?auto_1449004 ?auto_1449015 ) ) ( not ( = ?auto_1449005 ?auto_1449006 ) ) ( not ( = ?auto_1449005 ?auto_1449003 ) ) ( not ( = ?auto_1449005 ?auto_1449007 ) ) ( not ( = ?auto_1449005 ?auto_1449009 ) ) ( not ( = ?auto_1449005 ?auto_1449008 ) ) ( not ( = ?auto_1449005 ?auto_1449010 ) ) ( not ( = ?auto_1449005 ?auto_1449011 ) ) ( not ( = ?auto_1449005 ?auto_1449017 ) ) ( not ( = ?auto_1449005 ?auto_1449015 ) ) ( not ( = ?auto_1449006 ?auto_1449003 ) ) ( not ( = ?auto_1449006 ?auto_1449007 ) ) ( not ( = ?auto_1449006 ?auto_1449009 ) ) ( not ( = ?auto_1449006 ?auto_1449008 ) ) ( not ( = ?auto_1449006 ?auto_1449010 ) ) ( not ( = ?auto_1449006 ?auto_1449011 ) ) ( not ( = ?auto_1449006 ?auto_1449017 ) ) ( not ( = ?auto_1449006 ?auto_1449015 ) ) ( not ( = ?auto_1449003 ?auto_1449007 ) ) ( not ( = ?auto_1449003 ?auto_1449009 ) ) ( not ( = ?auto_1449003 ?auto_1449008 ) ) ( not ( = ?auto_1449003 ?auto_1449010 ) ) ( not ( = ?auto_1449003 ?auto_1449011 ) ) ( not ( = ?auto_1449003 ?auto_1449017 ) ) ( not ( = ?auto_1449003 ?auto_1449015 ) ) ( not ( = ?auto_1449007 ?auto_1449009 ) ) ( not ( = ?auto_1449007 ?auto_1449008 ) ) ( not ( = ?auto_1449007 ?auto_1449010 ) ) ( not ( = ?auto_1449007 ?auto_1449011 ) ) ( not ( = ?auto_1449007 ?auto_1449017 ) ) ( not ( = ?auto_1449007 ?auto_1449015 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1449008 ?auto_1449010 ?auto_1449011 )
      ( MAKE-8CRATE-VERIFY ?auto_1449004 ?auto_1449005 ?auto_1449006 ?auto_1449003 ?auto_1449007 ?auto_1449009 ?auto_1449008 ?auto_1449010 ?auto_1449011 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1449020 - SURFACE
      ?auto_1449021 - SURFACE
      ?auto_1449022 - SURFACE
      ?auto_1449019 - SURFACE
      ?auto_1449023 - SURFACE
      ?auto_1449025 - SURFACE
      ?auto_1449024 - SURFACE
      ?auto_1449026 - SURFACE
      ?auto_1449027 - SURFACE
      ?auto_1449028 - SURFACE
    )
    :vars
    (
      ?auto_1449031 - HOIST
      ?auto_1449035 - PLACE
      ?auto_1449033 - PLACE
      ?auto_1449030 - HOIST
      ?auto_1449034 - SURFACE
      ?auto_1449032 - SURFACE
      ?auto_1449029 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1449031 ?auto_1449035 ) ( IS-CRATE ?auto_1449028 ) ( not ( = ?auto_1449027 ?auto_1449028 ) ) ( not ( = ?auto_1449026 ?auto_1449027 ) ) ( not ( = ?auto_1449026 ?auto_1449028 ) ) ( not ( = ?auto_1449033 ?auto_1449035 ) ) ( HOIST-AT ?auto_1449030 ?auto_1449033 ) ( not ( = ?auto_1449031 ?auto_1449030 ) ) ( SURFACE-AT ?auto_1449028 ?auto_1449033 ) ( ON ?auto_1449028 ?auto_1449034 ) ( CLEAR ?auto_1449028 ) ( not ( = ?auto_1449027 ?auto_1449034 ) ) ( not ( = ?auto_1449028 ?auto_1449034 ) ) ( not ( = ?auto_1449026 ?auto_1449034 ) ) ( IS-CRATE ?auto_1449027 ) ( AVAILABLE ?auto_1449030 ) ( SURFACE-AT ?auto_1449027 ?auto_1449033 ) ( ON ?auto_1449027 ?auto_1449032 ) ( CLEAR ?auto_1449027 ) ( not ( = ?auto_1449027 ?auto_1449032 ) ) ( not ( = ?auto_1449028 ?auto_1449032 ) ) ( not ( = ?auto_1449026 ?auto_1449032 ) ) ( not ( = ?auto_1449034 ?auto_1449032 ) ) ( TRUCK-AT ?auto_1449029 ?auto_1449035 ) ( SURFACE-AT ?auto_1449024 ?auto_1449035 ) ( CLEAR ?auto_1449024 ) ( LIFTING ?auto_1449031 ?auto_1449026 ) ( IS-CRATE ?auto_1449026 ) ( not ( = ?auto_1449024 ?auto_1449026 ) ) ( not ( = ?auto_1449027 ?auto_1449024 ) ) ( not ( = ?auto_1449028 ?auto_1449024 ) ) ( not ( = ?auto_1449034 ?auto_1449024 ) ) ( not ( = ?auto_1449032 ?auto_1449024 ) ) ( ON ?auto_1449021 ?auto_1449020 ) ( ON ?auto_1449022 ?auto_1449021 ) ( ON ?auto_1449019 ?auto_1449022 ) ( ON ?auto_1449023 ?auto_1449019 ) ( ON ?auto_1449025 ?auto_1449023 ) ( ON ?auto_1449024 ?auto_1449025 ) ( not ( = ?auto_1449020 ?auto_1449021 ) ) ( not ( = ?auto_1449020 ?auto_1449022 ) ) ( not ( = ?auto_1449020 ?auto_1449019 ) ) ( not ( = ?auto_1449020 ?auto_1449023 ) ) ( not ( = ?auto_1449020 ?auto_1449025 ) ) ( not ( = ?auto_1449020 ?auto_1449024 ) ) ( not ( = ?auto_1449020 ?auto_1449026 ) ) ( not ( = ?auto_1449020 ?auto_1449027 ) ) ( not ( = ?auto_1449020 ?auto_1449028 ) ) ( not ( = ?auto_1449020 ?auto_1449034 ) ) ( not ( = ?auto_1449020 ?auto_1449032 ) ) ( not ( = ?auto_1449021 ?auto_1449022 ) ) ( not ( = ?auto_1449021 ?auto_1449019 ) ) ( not ( = ?auto_1449021 ?auto_1449023 ) ) ( not ( = ?auto_1449021 ?auto_1449025 ) ) ( not ( = ?auto_1449021 ?auto_1449024 ) ) ( not ( = ?auto_1449021 ?auto_1449026 ) ) ( not ( = ?auto_1449021 ?auto_1449027 ) ) ( not ( = ?auto_1449021 ?auto_1449028 ) ) ( not ( = ?auto_1449021 ?auto_1449034 ) ) ( not ( = ?auto_1449021 ?auto_1449032 ) ) ( not ( = ?auto_1449022 ?auto_1449019 ) ) ( not ( = ?auto_1449022 ?auto_1449023 ) ) ( not ( = ?auto_1449022 ?auto_1449025 ) ) ( not ( = ?auto_1449022 ?auto_1449024 ) ) ( not ( = ?auto_1449022 ?auto_1449026 ) ) ( not ( = ?auto_1449022 ?auto_1449027 ) ) ( not ( = ?auto_1449022 ?auto_1449028 ) ) ( not ( = ?auto_1449022 ?auto_1449034 ) ) ( not ( = ?auto_1449022 ?auto_1449032 ) ) ( not ( = ?auto_1449019 ?auto_1449023 ) ) ( not ( = ?auto_1449019 ?auto_1449025 ) ) ( not ( = ?auto_1449019 ?auto_1449024 ) ) ( not ( = ?auto_1449019 ?auto_1449026 ) ) ( not ( = ?auto_1449019 ?auto_1449027 ) ) ( not ( = ?auto_1449019 ?auto_1449028 ) ) ( not ( = ?auto_1449019 ?auto_1449034 ) ) ( not ( = ?auto_1449019 ?auto_1449032 ) ) ( not ( = ?auto_1449023 ?auto_1449025 ) ) ( not ( = ?auto_1449023 ?auto_1449024 ) ) ( not ( = ?auto_1449023 ?auto_1449026 ) ) ( not ( = ?auto_1449023 ?auto_1449027 ) ) ( not ( = ?auto_1449023 ?auto_1449028 ) ) ( not ( = ?auto_1449023 ?auto_1449034 ) ) ( not ( = ?auto_1449023 ?auto_1449032 ) ) ( not ( = ?auto_1449025 ?auto_1449024 ) ) ( not ( = ?auto_1449025 ?auto_1449026 ) ) ( not ( = ?auto_1449025 ?auto_1449027 ) ) ( not ( = ?auto_1449025 ?auto_1449028 ) ) ( not ( = ?auto_1449025 ?auto_1449034 ) ) ( not ( = ?auto_1449025 ?auto_1449032 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1449026 ?auto_1449027 ?auto_1449028 )
      ( MAKE-9CRATE-VERIFY ?auto_1449020 ?auto_1449021 ?auto_1449022 ?auto_1449019 ?auto_1449023 ?auto_1449025 ?auto_1449024 ?auto_1449026 ?auto_1449027 ?auto_1449028 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1449037 - SURFACE
      ?auto_1449038 - SURFACE
      ?auto_1449039 - SURFACE
      ?auto_1449036 - SURFACE
      ?auto_1449040 - SURFACE
      ?auto_1449042 - SURFACE
      ?auto_1449041 - SURFACE
      ?auto_1449043 - SURFACE
      ?auto_1449044 - SURFACE
      ?auto_1449045 - SURFACE
      ?auto_1449046 - SURFACE
    )
    :vars
    (
      ?auto_1449049 - HOIST
      ?auto_1449053 - PLACE
      ?auto_1449051 - PLACE
      ?auto_1449048 - HOIST
      ?auto_1449052 - SURFACE
      ?auto_1449050 - SURFACE
      ?auto_1449047 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1449049 ?auto_1449053 ) ( IS-CRATE ?auto_1449046 ) ( not ( = ?auto_1449045 ?auto_1449046 ) ) ( not ( = ?auto_1449044 ?auto_1449045 ) ) ( not ( = ?auto_1449044 ?auto_1449046 ) ) ( not ( = ?auto_1449051 ?auto_1449053 ) ) ( HOIST-AT ?auto_1449048 ?auto_1449051 ) ( not ( = ?auto_1449049 ?auto_1449048 ) ) ( SURFACE-AT ?auto_1449046 ?auto_1449051 ) ( ON ?auto_1449046 ?auto_1449052 ) ( CLEAR ?auto_1449046 ) ( not ( = ?auto_1449045 ?auto_1449052 ) ) ( not ( = ?auto_1449046 ?auto_1449052 ) ) ( not ( = ?auto_1449044 ?auto_1449052 ) ) ( IS-CRATE ?auto_1449045 ) ( AVAILABLE ?auto_1449048 ) ( SURFACE-AT ?auto_1449045 ?auto_1449051 ) ( ON ?auto_1449045 ?auto_1449050 ) ( CLEAR ?auto_1449045 ) ( not ( = ?auto_1449045 ?auto_1449050 ) ) ( not ( = ?auto_1449046 ?auto_1449050 ) ) ( not ( = ?auto_1449044 ?auto_1449050 ) ) ( not ( = ?auto_1449052 ?auto_1449050 ) ) ( TRUCK-AT ?auto_1449047 ?auto_1449053 ) ( SURFACE-AT ?auto_1449043 ?auto_1449053 ) ( CLEAR ?auto_1449043 ) ( LIFTING ?auto_1449049 ?auto_1449044 ) ( IS-CRATE ?auto_1449044 ) ( not ( = ?auto_1449043 ?auto_1449044 ) ) ( not ( = ?auto_1449045 ?auto_1449043 ) ) ( not ( = ?auto_1449046 ?auto_1449043 ) ) ( not ( = ?auto_1449052 ?auto_1449043 ) ) ( not ( = ?auto_1449050 ?auto_1449043 ) ) ( ON ?auto_1449038 ?auto_1449037 ) ( ON ?auto_1449039 ?auto_1449038 ) ( ON ?auto_1449036 ?auto_1449039 ) ( ON ?auto_1449040 ?auto_1449036 ) ( ON ?auto_1449042 ?auto_1449040 ) ( ON ?auto_1449041 ?auto_1449042 ) ( ON ?auto_1449043 ?auto_1449041 ) ( not ( = ?auto_1449037 ?auto_1449038 ) ) ( not ( = ?auto_1449037 ?auto_1449039 ) ) ( not ( = ?auto_1449037 ?auto_1449036 ) ) ( not ( = ?auto_1449037 ?auto_1449040 ) ) ( not ( = ?auto_1449037 ?auto_1449042 ) ) ( not ( = ?auto_1449037 ?auto_1449041 ) ) ( not ( = ?auto_1449037 ?auto_1449043 ) ) ( not ( = ?auto_1449037 ?auto_1449044 ) ) ( not ( = ?auto_1449037 ?auto_1449045 ) ) ( not ( = ?auto_1449037 ?auto_1449046 ) ) ( not ( = ?auto_1449037 ?auto_1449052 ) ) ( not ( = ?auto_1449037 ?auto_1449050 ) ) ( not ( = ?auto_1449038 ?auto_1449039 ) ) ( not ( = ?auto_1449038 ?auto_1449036 ) ) ( not ( = ?auto_1449038 ?auto_1449040 ) ) ( not ( = ?auto_1449038 ?auto_1449042 ) ) ( not ( = ?auto_1449038 ?auto_1449041 ) ) ( not ( = ?auto_1449038 ?auto_1449043 ) ) ( not ( = ?auto_1449038 ?auto_1449044 ) ) ( not ( = ?auto_1449038 ?auto_1449045 ) ) ( not ( = ?auto_1449038 ?auto_1449046 ) ) ( not ( = ?auto_1449038 ?auto_1449052 ) ) ( not ( = ?auto_1449038 ?auto_1449050 ) ) ( not ( = ?auto_1449039 ?auto_1449036 ) ) ( not ( = ?auto_1449039 ?auto_1449040 ) ) ( not ( = ?auto_1449039 ?auto_1449042 ) ) ( not ( = ?auto_1449039 ?auto_1449041 ) ) ( not ( = ?auto_1449039 ?auto_1449043 ) ) ( not ( = ?auto_1449039 ?auto_1449044 ) ) ( not ( = ?auto_1449039 ?auto_1449045 ) ) ( not ( = ?auto_1449039 ?auto_1449046 ) ) ( not ( = ?auto_1449039 ?auto_1449052 ) ) ( not ( = ?auto_1449039 ?auto_1449050 ) ) ( not ( = ?auto_1449036 ?auto_1449040 ) ) ( not ( = ?auto_1449036 ?auto_1449042 ) ) ( not ( = ?auto_1449036 ?auto_1449041 ) ) ( not ( = ?auto_1449036 ?auto_1449043 ) ) ( not ( = ?auto_1449036 ?auto_1449044 ) ) ( not ( = ?auto_1449036 ?auto_1449045 ) ) ( not ( = ?auto_1449036 ?auto_1449046 ) ) ( not ( = ?auto_1449036 ?auto_1449052 ) ) ( not ( = ?auto_1449036 ?auto_1449050 ) ) ( not ( = ?auto_1449040 ?auto_1449042 ) ) ( not ( = ?auto_1449040 ?auto_1449041 ) ) ( not ( = ?auto_1449040 ?auto_1449043 ) ) ( not ( = ?auto_1449040 ?auto_1449044 ) ) ( not ( = ?auto_1449040 ?auto_1449045 ) ) ( not ( = ?auto_1449040 ?auto_1449046 ) ) ( not ( = ?auto_1449040 ?auto_1449052 ) ) ( not ( = ?auto_1449040 ?auto_1449050 ) ) ( not ( = ?auto_1449042 ?auto_1449041 ) ) ( not ( = ?auto_1449042 ?auto_1449043 ) ) ( not ( = ?auto_1449042 ?auto_1449044 ) ) ( not ( = ?auto_1449042 ?auto_1449045 ) ) ( not ( = ?auto_1449042 ?auto_1449046 ) ) ( not ( = ?auto_1449042 ?auto_1449052 ) ) ( not ( = ?auto_1449042 ?auto_1449050 ) ) ( not ( = ?auto_1449041 ?auto_1449043 ) ) ( not ( = ?auto_1449041 ?auto_1449044 ) ) ( not ( = ?auto_1449041 ?auto_1449045 ) ) ( not ( = ?auto_1449041 ?auto_1449046 ) ) ( not ( = ?auto_1449041 ?auto_1449052 ) ) ( not ( = ?auto_1449041 ?auto_1449050 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1449044 ?auto_1449045 ?auto_1449046 )
      ( MAKE-10CRATE-VERIFY ?auto_1449037 ?auto_1449038 ?auto_1449039 ?auto_1449036 ?auto_1449040 ?auto_1449042 ?auto_1449041 ?auto_1449043 ?auto_1449044 ?auto_1449045 ?auto_1449046 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1452500 - SURFACE
      ?auto_1452501 - SURFACE
    )
    :vars
    (
      ?auto_1452504 - HOIST
      ?auto_1452508 - PLACE
      ?auto_1452503 - SURFACE
      ?auto_1452509 - PLACE
      ?auto_1452505 - HOIST
      ?auto_1452502 - SURFACE
      ?auto_1452507 - TRUCK
      ?auto_1452506 - SURFACE
      ?auto_1452510 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1452504 ?auto_1452508 ) ( IS-CRATE ?auto_1452501 ) ( not ( = ?auto_1452500 ?auto_1452501 ) ) ( not ( = ?auto_1452503 ?auto_1452500 ) ) ( not ( = ?auto_1452503 ?auto_1452501 ) ) ( not ( = ?auto_1452509 ?auto_1452508 ) ) ( HOIST-AT ?auto_1452505 ?auto_1452509 ) ( not ( = ?auto_1452504 ?auto_1452505 ) ) ( SURFACE-AT ?auto_1452501 ?auto_1452509 ) ( ON ?auto_1452501 ?auto_1452502 ) ( CLEAR ?auto_1452501 ) ( not ( = ?auto_1452500 ?auto_1452502 ) ) ( not ( = ?auto_1452501 ?auto_1452502 ) ) ( not ( = ?auto_1452503 ?auto_1452502 ) ) ( SURFACE-AT ?auto_1452503 ?auto_1452508 ) ( CLEAR ?auto_1452503 ) ( IS-CRATE ?auto_1452500 ) ( AVAILABLE ?auto_1452504 ) ( TRUCK-AT ?auto_1452507 ?auto_1452509 ) ( SURFACE-AT ?auto_1452500 ?auto_1452509 ) ( ON ?auto_1452500 ?auto_1452506 ) ( CLEAR ?auto_1452500 ) ( not ( = ?auto_1452500 ?auto_1452506 ) ) ( not ( = ?auto_1452501 ?auto_1452506 ) ) ( not ( = ?auto_1452503 ?auto_1452506 ) ) ( not ( = ?auto_1452502 ?auto_1452506 ) ) ( LIFTING ?auto_1452505 ?auto_1452510 ) ( IS-CRATE ?auto_1452510 ) ( not ( = ?auto_1452500 ?auto_1452510 ) ) ( not ( = ?auto_1452501 ?auto_1452510 ) ) ( not ( = ?auto_1452503 ?auto_1452510 ) ) ( not ( = ?auto_1452502 ?auto_1452510 ) ) ( not ( = ?auto_1452506 ?auto_1452510 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1452505 ?auto_1452510 ?auto_1452507 ?auto_1452509 )
      ( MAKE-2CRATE ?auto_1452503 ?auto_1452500 ?auto_1452501 )
      ( MAKE-1CRATE-VERIFY ?auto_1452500 ?auto_1452501 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1452511 - SURFACE
      ?auto_1452512 - SURFACE
      ?auto_1452513 - SURFACE
    )
    :vars
    (
      ?auto_1452521 - HOIST
      ?auto_1452518 - PLACE
      ?auto_1452515 - PLACE
      ?auto_1452520 - HOIST
      ?auto_1452514 - SURFACE
      ?auto_1452519 - TRUCK
      ?auto_1452516 - SURFACE
      ?auto_1452517 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1452521 ?auto_1452518 ) ( IS-CRATE ?auto_1452513 ) ( not ( = ?auto_1452512 ?auto_1452513 ) ) ( not ( = ?auto_1452511 ?auto_1452512 ) ) ( not ( = ?auto_1452511 ?auto_1452513 ) ) ( not ( = ?auto_1452515 ?auto_1452518 ) ) ( HOIST-AT ?auto_1452520 ?auto_1452515 ) ( not ( = ?auto_1452521 ?auto_1452520 ) ) ( SURFACE-AT ?auto_1452513 ?auto_1452515 ) ( ON ?auto_1452513 ?auto_1452514 ) ( CLEAR ?auto_1452513 ) ( not ( = ?auto_1452512 ?auto_1452514 ) ) ( not ( = ?auto_1452513 ?auto_1452514 ) ) ( not ( = ?auto_1452511 ?auto_1452514 ) ) ( SURFACE-AT ?auto_1452511 ?auto_1452518 ) ( CLEAR ?auto_1452511 ) ( IS-CRATE ?auto_1452512 ) ( AVAILABLE ?auto_1452521 ) ( TRUCK-AT ?auto_1452519 ?auto_1452515 ) ( SURFACE-AT ?auto_1452512 ?auto_1452515 ) ( ON ?auto_1452512 ?auto_1452516 ) ( CLEAR ?auto_1452512 ) ( not ( = ?auto_1452512 ?auto_1452516 ) ) ( not ( = ?auto_1452513 ?auto_1452516 ) ) ( not ( = ?auto_1452511 ?auto_1452516 ) ) ( not ( = ?auto_1452514 ?auto_1452516 ) ) ( LIFTING ?auto_1452520 ?auto_1452517 ) ( IS-CRATE ?auto_1452517 ) ( not ( = ?auto_1452512 ?auto_1452517 ) ) ( not ( = ?auto_1452513 ?auto_1452517 ) ) ( not ( = ?auto_1452511 ?auto_1452517 ) ) ( not ( = ?auto_1452514 ?auto_1452517 ) ) ( not ( = ?auto_1452516 ?auto_1452517 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1452512 ?auto_1452513 )
      ( MAKE-2CRATE-VERIFY ?auto_1452511 ?auto_1452512 ?auto_1452513 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1455459 - SURFACE
      ?auto_1455460 - SURFACE
      ?auto_1455461 - SURFACE
      ?auto_1455458 - SURFACE
      ?auto_1455462 - SURFACE
      ?auto_1455464 - SURFACE
      ?auto_1455463 - SURFACE
      ?auto_1455465 - SURFACE
      ?auto_1455466 - SURFACE
      ?auto_1455467 - SURFACE
      ?auto_1455468 - SURFACE
      ?auto_1455469 - SURFACE
    )
    :vars
    (
      ?auto_1455471 - HOIST
      ?auto_1455470 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1455471 ?auto_1455470 ) ( SURFACE-AT ?auto_1455468 ?auto_1455470 ) ( CLEAR ?auto_1455468 ) ( LIFTING ?auto_1455471 ?auto_1455469 ) ( IS-CRATE ?auto_1455469 ) ( not ( = ?auto_1455468 ?auto_1455469 ) ) ( ON ?auto_1455460 ?auto_1455459 ) ( ON ?auto_1455461 ?auto_1455460 ) ( ON ?auto_1455458 ?auto_1455461 ) ( ON ?auto_1455462 ?auto_1455458 ) ( ON ?auto_1455464 ?auto_1455462 ) ( ON ?auto_1455463 ?auto_1455464 ) ( ON ?auto_1455465 ?auto_1455463 ) ( ON ?auto_1455466 ?auto_1455465 ) ( ON ?auto_1455467 ?auto_1455466 ) ( ON ?auto_1455468 ?auto_1455467 ) ( not ( = ?auto_1455459 ?auto_1455460 ) ) ( not ( = ?auto_1455459 ?auto_1455461 ) ) ( not ( = ?auto_1455459 ?auto_1455458 ) ) ( not ( = ?auto_1455459 ?auto_1455462 ) ) ( not ( = ?auto_1455459 ?auto_1455464 ) ) ( not ( = ?auto_1455459 ?auto_1455463 ) ) ( not ( = ?auto_1455459 ?auto_1455465 ) ) ( not ( = ?auto_1455459 ?auto_1455466 ) ) ( not ( = ?auto_1455459 ?auto_1455467 ) ) ( not ( = ?auto_1455459 ?auto_1455468 ) ) ( not ( = ?auto_1455459 ?auto_1455469 ) ) ( not ( = ?auto_1455460 ?auto_1455461 ) ) ( not ( = ?auto_1455460 ?auto_1455458 ) ) ( not ( = ?auto_1455460 ?auto_1455462 ) ) ( not ( = ?auto_1455460 ?auto_1455464 ) ) ( not ( = ?auto_1455460 ?auto_1455463 ) ) ( not ( = ?auto_1455460 ?auto_1455465 ) ) ( not ( = ?auto_1455460 ?auto_1455466 ) ) ( not ( = ?auto_1455460 ?auto_1455467 ) ) ( not ( = ?auto_1455460 ?auto_1455468 ) ) ( not ( = ?auto_1455460 ?auto_1455469 ) ) ( not ( = ?auto_1455461 ?auto_1455458 ) ) ( not ( = ?auto_1455461 ?auto_1455462 ) ) ( not ( = ?auto_1455461 ?auto_1455464 ) ) ( not ( = ?auto_1455461 ?auto_1455463 ) ) ( not ( = ?auto_1455461 ?auto_1455465 ) ) ( not ( = ?auto_1455461 ?auto_1455466 ) ) ( not ( = ?auto_1455461 ?auto_1455467 ) ) ( not ( = ?auto_1455461 ?auto_1455468 ) ) ( not ( = ?auto_1455461 ?auto_1455469 ) ) ( not ( = ?auto_1455458 ?auto_1455462 ) ) ( not ( = ?auto_1455458 ?auto_1455464 ) ) ( not ( = ?auto_1455458 ?auto_1455463 ) ) ( not ( = ?auto_1455458 ?auto_1455465 ) ) ( not ( = ?auto_1455458 ?auto_1455466 ) ) ( not ( = ?auto_1455458 ?auto_1455467 ) ) ( not ( = ?auto_1455458 ?auto_1455468 ) ) ( not ( = ?auto_1455458 ?auto_1455469 ) ) ( not ( = ?auto_1455462 ?auto_1455464 ) ) ( not ( = ?auto_1455462 ?auto_1455463 ) ) ( not ( = ?auto_1455462 ?auto_1455465 ) ) ( not ( = ?auto_1455462 ?auto_1455466 ) ) ( not ( = ?auto_1455462 ?auto_1455467 ) ) ( not ( = ?auto_1455462 ?auto_1455468 ) ) ( not ( = ?auto_1455462 ?auto_1455469 ) ) ( not ( = ?auto_1455464 ?auto_1455463 ) ) ( not ( = ?auto_1455464 ?auto_1455465 ) ) ( not ( = ?auto_1455464 ?auto_1455466 ) ) ( not ( = ?auto_1455464 ?auto_1455467 ) ) ( not ( = ?auto_1455464 ?auto_1455468 ) ) ( not ( = ?auto_1455464 ?auto_1455469 ) ) ( not ( = ?auto_1455463 ?auto_1455465 ) ) ( not ( = ?auto_1455463 ?auto_1455466 ) ) ( not ( = ?auto_1455463 ?auto_1455467 ) ) ( not ( = ?auto_1455463 ?auto_1455468 ) ) ( not ( = ?auto_1455463 ?auto_1455469 ) ) ( not ( = ?auto_1455465 ?auto_1455466 ) ) ( not ( = ?auto_1455465 ?auto_1455467 ) ) ( not ( = ?auto_1455465 ?auto_1455468 ) ) ( not ( = ?auto_1455465 ?auto_1455469 ) ) ( not ( = ?auto_1455466 ?auto_1455467 ) ) ( not ( = ?auto_1455466 ?auto_1455468 ) ) ( not ( = ?auto_1455466 ?auto_1455469 ) ) ( not ( = ?auto_1455467 ?auto_1455468 ) ) ( not ( = ?auto_1455467 ?auto_1455469 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1455468 ?auto_1455469 )
      ( MAKE-11CRATE-VERIFY ?auto_1455459 ?auto_1455460 ?auto_1455461 ?auto_1455458 ?auto_1455462 ?auto_1455464 ?auto_1455463 ?auto_1455465 ?auto_1455466 ?auto_1455467 ?auto_1455468 ?auto_1455469 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1455568 - SURFACE
      ?auto_1455569 - SURFACE
      ?auto_1455570 - SURFACE
      ?auto_1455567 - SURFACE
      ?auto_1455571 - SURFACE
      ?auto_1455573 - SURFACE
      ?auto_1455572 - SURFACE
      ?auto_1455574 - SURFACE
      ?auto_1455575 - SURFACE
      ?auto_1455576 - SURFACE
      ?auto_1455577 - SURFACE
      ?auto_1455578 - SURFACE
    )
    :vars
    (
      ?auto_1455581 - HOIST
      ?auto_1455579 - PLACE
      ?auto_1455580 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1455581 ?auto_1455579 ) ( SURFACE-AT ?auto_1455577 ?auto_1455579 ) ( CLEAR ?auto_1455577 ) ( IS-CRATE ?auto_1455578 ) ( not ( = ?auto_1455577 ?auto_1455578 ) ) ( TRUCK-AT ?auto_1455580 ?auto_1455579 ) ( AVAILABLE ?auto_1455581 ) ( IN ?auto_1455578 ?auto_1455580 ) ( ON ?auto_1455577 ?auto_1455576 ) ( not ( = ?auto_1455576 ?auto_1455577 ) ) ( not ( = ?auto_1455576 ?auto_1455578 ) ) ( ON ?auto_1455569 ?auto_1455568 ) ( ON ?auto_1455570 ?auto_1455569 ) ( ON ?auto_1455567 ?auto_1455570 ) ( ON ?auto_1455571 ?auto_1455567 ) ( ON ?auto_1455573 ?auto_1455571 ) ( ON ?auto_1455572 ?auto_1455573 ) ( ON ?auto_1455574 ?auto_1455572 ) ( ON ?auto_1455575 ?auto_1455574 ) ( ON ?auto_1455576 ?auto_1455575 ) ( not ( = ?auto_1455568 ?auto_1455569 ) ) ( not ( = ?auto_1455568 ?auto_1455570 ) ) ( not ( = ?auto_1455568 ?auto_1455567 ) ) ( not ( = ?auto_1455568 ?auto_1455571 ) ) ( not ( = ?auto_1455568 ?auto_1455573 ) ) ( not ( = ?auto_1455568 ?auto_1455572 ) ) ( not ( = ?auto_1455568 ?auto_1455574 ) ) ( not ( = ?auto_1455568 ?auto_1455575 ) ) ( not ( = ?auto_1455568 ?auto_1455576 ) ) ( not ( = ?auto_1455568 ?auto_1455577 ) ) ( not ( = ?auto_1455568 ?auto_1455578 ) ) ( not ( = ?auto_1455569 ?auto_1455570 ) ) ( not ( = ?auto_1455569 ?auto_1455567 ) ) ( not ( = ?auto_1455569 ?auto_1455571 ) ) ( not ( = ?auto_1455569 ?auto_1455573 ) ) ( not ( = ?auto_1455569 ?auto_1455572 ) ) ( not ( = ?auto_1455569 ?auto_1455574 ) ) ( not ( = ?auto_1455569 ?auto_1455575 ) ) ( not ( = ?auto_1455569 ?auto_1455576 ) ) ( not ( = ?auto_1455569 ?auto_1455577 ) ) ( not ( = ?auto_1455569 ?auto_1455578 ) ) ( not ( = ?auto_1455570 ?auto_1455567 ) ) ( not ( = ?auto_1455570 ?auto_1455571 ) ) ( not ( = ?auto_1455570 ?auto_1455573 ) ) ( not ( = ?auto_1455570 ?auto_1455572 ) ) ( not ( = ?auto_1455570 ?auto_1455574 ) ) ( not ( = ?auto_1455570 ?auto_1455575 ) ) ( not ( = ?auto_1455570 ?auto_1455576 ) ) ( not ( = ?auto_1455570 ?auto_1455577 ) ) ( not ( = ?auto_1455570 ?auto_1455578 ) ) ( not ( = ?auto_1455567 ?auto_1455571 ) ) ( not ( = ?auto_1455567 ?auto_1455573 ) ) ( not ( = ?auto_1455567 ?auto_1455572 ) ) ( not ( = ?auto_1455567 ?auto_1455574 ) ) ( not ( = ?auto_1455567 ?auto_1455575 ) ) ( not ( = ?auto_1455567 ?auto_1455576 ) ) ( not ( = ?auto_1455567 ?auto_1455577 ) ) ( not ( = ?auto_1455567 ?auto_1455578 ) ) ( not ( = ?auto_1455571 ?auto_1455573 ) ) ( not ( = ?auto_1455571 ?auto_1455572 ) ) ( not ( = ?auto_1455571 ?auto_1455574 ) ) ( not ( = ?auto_1455571 ?auto_1455575 ) ) ( not ( = ?auto_1455571 ?auto_1455576 ) ) ( not ( = ?auto_1455571 ?auto_1455577 ) ) ( not ( = ?auto_1455571 ?auto_1455578 ) ) ( not ( = ?auto_1455573 ?auto_1455572 ) ) ( not ( = ?auto_1455573 ?auto_1455574 ) ) ( not ( = ?auto_1455573 ?auto_1455575 ) ) ( not ( = ?auto_1455573 ?auto_1455576 ) ) ( not ( = ?auto_1455573 ?auto_1455577 ) ) ( not ( = ?auto_1455573 ?auto_1455578 ) ) ( not ( = ?auto_1455572 ?auto_1455574 ) ) ( not ( = ?auto_1455572 ?auto_1455575 ) ) ( not ( = ?auto_1455572 ?auto_1455576 ) ) ( not ( = ?auto_1455572 ?auto_1455577 ) ) ( not ( = ?auto_1455572 ?auto_1455578 ) ) ( not ( = ?auto_1455574 ?auto_1455575 ) ) ( not ( = ?auto_1455574 ?auto_1455576 ) ) ( not ( = ?auto_1455574 ?auto_1455577 ) ) ( not ( = ?auto_1455574 ?auto_1455578 ) ) ( not ( = ?auto_1455575 ?auto_1455576 ) ) ( not ( = ?auto_1455575 ?auto_1455577 ) ) ( not ( = ?auto_1455575 ?auto_1455578 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1455576 ?auto_1455577 ?auto_1455578 )
      ( MAKE-11CRATE-VERIFY ?auto_1455568 ?auto_1455569 ?auto_1455570 ?auto_1455567 ?auto_1455571 ?auto_1455573 ?auto_1455572 ?auto_1455574 ?auto_1455575 ?auto_1455576 ?auto_1455577 ?auto_1455578 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1455689 - SURFACE
      ?auto_1455690 - SURFACE
      ?auto_1455691 - SURFACE
      ?auto_1455688 - SURFACE
      ?auto_1455692 - SURFACE
      ?auto_1455694 - SURFACE
      ?auto_1455693 - SURFACE
      ?auto_1455695 - SURFACE
      ?auto_1455696 - SURFACE
      ?auto_1455697 - SURFACE
      ?auto_1455698 - SURFACE
      ?auto_1455699 - SURFACE
    )
    :vars
    (
      ?auto_1455700 - HOIST
      ?auto_1455702 - PLACE
      ?auto_1455703 - TRUCK
      ?auto_1455701 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1455700 ?auto_1455702 ) ( SURFACE-AT ?auto_1455698 ?auto_1455702 ) ( CLEAR ?auto_1455698 ) ( IS-CRATE ?auto_1455699 ) ( not ( = ?auto_1455698 ?auto_1455699 ) ) ( AVAILABLE ?auto_1455700 ) ( IN ?auto_1455699 ?auto_1455703 ) ( ON ?auto_1455698 ?auto_1455697 ) ( not ( = ?auto_1455697 ?auto_1455698 ) ) ( not ( = ?auto_1455697 ?auto_1455699 ) ) ( TRUCK-AT ?auto_1455703 ?auto_1455701 ) ( not ( = ?auto_1455701 ?auto_1455702 ) ) ( ON ?auto_1455690 ?auto_1455689 ) ( ON ?auto_1455691 ?auto_1455690 ) ( ON ?auto_1455688 ?auto_1455691 ) ( ON ?auto_1455692 ?auto_1455688 ) ( ON ?auto_1455694 ?auto_1455692 ) ( ON ?auto_1455693 ?auto_1455694 ) ( ON ?auto_1455695 ?auto_1455693 ) ( ON ?auto_1455696 ?auto_1455695 ) ( ON ?auto_1455697 ?auto_1455696 ) ( not ( = ?auto_1455689 ?auto_1455690 ) ) ( not ( = ?auto_1455689 ?auto_1455691 ) ) ( not ( = ?auto_1455689 ?auto_1455688 ) ) ( not ( = ?auto_1455689 ?auto_1455692 ) ) ( not ( = ?auto_1455689 ?auto_1455694 ) ) ( not ( = ?auto_1455689 ?auto_1455693 ) ) ( not ( = ?auto_1455689 ?auto_1455695 ) ) ( not ( = ?auto_1455689 ?auto_1455696 ) ) ( not ( = ?auto_1455689 ?auto_1455697 ) ) ( not ( = ?auto_1455689 ?auto_1455698 ) ) ( not ( = ?auto_1455689 ?auto_1455699 ) ) ( not ( = ?auto_1455690 ?auto_1455691 ) ) ( not ( = ?auto_1455690 ?auto_1455688 ) ) ( not ( = ?auto_1455690 ?auto_1455692 ) ) ( not ( = ?auto_1455690 ?auto_1455694 ) ) ( not ( = ?auto_1455690 ?auto_1455693 ) ) ( not ( = ?auto_1455690 ?auto_1455695 ) ) ( not ( = ?auto_1455690 ?auto_1455696 ) ) ( not ( = ?auto_1455690 ?auto_1455697 ) ) ( not ( = ?auto_1455690 ?auto_1455698 ) ) ( not ( = ?auto_1455690 ?auto_1455699 ) ) ( not ( = ?auto_1455691 ?auto_1455688 ) ) ( not ( = ?auto_1455691 ?auto_1455692 ) ) ( not ( = ?auto_1455691 ?auto_1455694 ) ) ( not ( = ?auto_1455691 ?auto_1455693 ) ) ( not ( = ?auto_1455691 ?auto_1455695 ) ) ( not ( = ?auto_1455691 ?auto_1455696 ) ) ( not ( = ?auto_1455691 ?auto_1455697 ) ) ( not ( = ?auto_1455691 ?auto_1455698 ) ) ( not ( = ?auto_1455691 ?auto_1455699 ) ) ( not ( = ?auto_1455688 ?auto_1455692 ) ) ( not ( = ?auto_1455688 ?auto_1455694 ) ) ( not ( = ?auto_1455688 ?auto_1455693 ) ) ( not ( = ?auto_1455688 ?auto_1455695 ) ) ( not ( = ?auto_1455688 ?auto_1455696 ) ) ( not ( = ?auto_1455688 ?auto_1455697 ) ) ( not ( = ?auto_1455688 ?auto_1455698 ) ) ( not ( = ?auto_1455688 ?auto_1455699 ) ) ( not ( = ?auto_1455692 ?auto_1455694 ) ) ( not ( = ?auto_1455692 ?auto_1455693 ) ) ( not ( = ?auto_1455692 ?auto_1455695 ) ) ( not ( = ?auto_1455692 ?auto_1455696 ) ) ( not ( = ?auto_1455692 ?auto_1455697 ) ) ( not ( = ?auto_1455692 ?auto_1455698 ) ) ( not ( = ?auto_1455692 ?auto_1455699 ) ) ( not ( = ?auto_1455694 ?auto_1455693 ) ) ( not ( = ?auto_1455694 ?auto_1455695 ) ) ( not ( = ?auto_1455694 ?auto_1455696 ) ) ( not ( = ?auto_1455694 ?auto_1455697 ) ) ( not ( = ?auto_1455694 ?auto_1455698 ) ) ( not ( = ?auto_1455694 ?auto_1455699 ) ) ( not ( = ?auto_1455693 ?auto_1455695 ) ) ( not ( = ?auto_1455693 ?auto_1455696 ) ) ( not ( = ?auto_1455693 ?auto_1455697 ) ) ( not ( = ?auto_1455693 ?auto_1455698 ) ) ( not ( = ?auto_1455693 ?auto_1455699 ) ) ( not ( = ?auto_1455695 ?auto_1455696 ) ) ( not ( = ?auto_1455695 ?auto_1455697 ) ) ( not ( = ?auto_1455695 ?auto_1455698 ) ) ( not ( = ?auto_1455695 ?auto_1455699 ) ) ( not ( = ?auto_1455696 ?auto_1455697 ) ) ( not ( = ?auto_1455696 ?auto_1455698 ) ) ( not ( = ?auto_1455696 ?auto_1455699 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1455697 ?auto_1455698 ?auto_1455699 )
      ( MAKE-11CRATE-VERIFY ?auto_1455689 ?auto_1455690 ?auto_1455691 ?auto_1455688 ?auto_1455692 ?auto_1455694 ?auto_1455693 ?auto_1455695 ?auto_1455696 ?auto_1455697 ?auto_1455698 ?auto_1455699 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1455821 - SURFACE
      ?auto_1455822 - SURFACE
      ?auto_1455823 - SURFACE
      ?auto_1455820 - SURFACE
      ?auto_1455824 - SURFACE
      ?auto_1455826 - SURFACE
      ?auto_1455825 - SURFACE
      ?auto_1455827 - SURFACE
      ?auto_1455828 - SURFACE
      ?auto_1455829 - SURFACE
      ?auto_1455830 - SURFACE
      ?auto_1455831 - SURFACE
    )
    :vars
    (
      ?auto_1455834 - HOIST
      ?auto_1455833 - PLACE
      ?auto_1455836 - TRUCK
      ?auto_1455832 - PLACE
      ?auto_1455835 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1455834 ?auto_1455833 ) ( SURFACE-AT ?auto_1455830 ?auto_1455833 ) ( CLEAR ?auto_1455830 ) ( IS-CRATE ?auto_1455831 ) ( not ( = ?auto_1455830 ?auto_1455831 ) ) ( AVAILABLE ?auto_1455834 ) ( ON ?auto_1455830 ?auto_1455829 ) ( not ( = ?auto_1455829 ?auto_1455830 ) ) ( not ( = ?auto_1455829 ?auto_1455831 ) ) ( TRUCK-AT ?auto_1455836 ?auto_1455832 ) ( not ( = ?auto_1455832 ?auto_1455833 ) ) ( HOIST-AT ?auto_1455835 ?auto_1455832 ) ( LIFTING ?auto_1455835 ?auto_1455831 ) ( not ( = ?auto_1455834 ?auto_1455835 ) ) ( ON ?auto_1455822 ?auto_1455821 ) ( ON ?auto_1455823 ?auto_1455822 ) ( ON ?auto_1455820 ?auto_1455823 ) ( ON ?auto_1455824 ?auto_1455820 ) ( ON ?auto_1455826 ?auto_1455824 ) ( ON ?auto_1455825 ?auto_1455826 ) ( ON ?auto_1455827 ?auto_1455825 ) ( ON ?auto_1455828 ?auto_1455827 ) ( ON ?auto_1455829 ?auto_1455828 ) ( not ( = ?auto_1455821 ?auto_1455822 ) ) ( not ( = ?auto_1455821 ?auto_1455823 ) ) ( not ( = ?auto_1455821 ?auto_1455820 ) ) ( not ( = ?auto_1455821 ?auto_1455824 ) ) ( not ( = ?auto_1455821 ?auto_1455826 ) ) ( not ( = ?auto_1455821 ?auto_1455825 ) ) ( not ( = ?auto_1455821 ?auto_1455827 ) ) ( not ( = ?auto_1455821 ?auto_1455828 ) ) ( not ( = ?auto_1455821 ?auto_1455829 ) ) ( not ( = ?auto_1455821 ?auto_1455830 ) ) ( not ( = ?auto_1455821 ?auto_1455831 ) ) ( not ( = ?auto_1455822 ?auto_1455823 ) ) ( not ( = ?auto_1455822 ?auto_1455820 ) ) ( not ( = ?auto_1455822 ?auto_1455824 ) ) ( not ( = ?auto_1455822 ?auto_1455826 ) ) ( not ( = ?auto_1455822 ?auto_1455825 ) ) ( not ( = ?auto_1455822 ?auto_1455827 ) ) ( not ( = ?auto_1455822 ?auto_1455828 ) ) ( not ( = ?auto_1455822 ?auto_1455829 ) ) ( not ( = ?auto_1455822 ?auto_1455830 ) ) ( not ( = ?auto_1455822 ?auto_1455831 ) ) ( not ( = ?auto_1455823 ?auto_1455820 ) ) ( not ( = ?auto_1455823 ?auto_1455824 ) ) ( not ( = ?auto_1455823 ?auto_1455826 ) ) ( not ( = ?auto_1455823 ?auto_1455825 ) ) ( not ( = ?auto_1455823 ?auto_1455827 ) ) ( not ( = ?auto_1455823 ?auto_1455828 ) ) ( not ( = ?auto_1455823 ?auto_1455829 ) ) ( not ( = ?auto_1455823 ?auto_1455830 ) ) ( not ( = ?auto_1455823 ?auto_1455831 ) ) ( not ( = ?auto_1455820 ?auto_1455824 ) ) ( not ( = ?auto_1455820 ?auto_1455826 ) ) ( not ( = ?auto_1455820 ?auto_1455825 ) ) ( not ( = ?auto_1455820 ?auto_1455827 ) ) ( not ( = ?auto_1455820 ?auto_1455828 ) ) ( not ( = ?auto_1455820 ?auto_1455829 ) ) ( not ( = ?auto_1455820 ?auto_1455830 ) ) ( not ( = ?auto_1455820 ?auto_1455831 ) ) ( not ( = ?auto_1455824 ?auto_1455826 ) ) ( not ( = ?auto_1455824 ?auto_1455825 ) ) ( not ( = ?auto_1455824 ?auto_1455827 ) ) ( not ( = ?auto_1455824 ?auto_1455828 ) ) ( not ( = ?auto_1455824 ?auto_1455829 ) ) ( not ( = ?auto_1455824 ?auto_1455830 ) ) ( not ( = ?auto_1455824 ?auto_1455831 ) ) ( not ( = ?auto_1455826 ?auto_1455825 ) ) ( not ( = ?auto_1455826 ?auto_1455827 ) ) ( not ( = ?auto_1455826 ?auto_1455828 ) ) ( not ( = ?auto_1455826 ?auto_1455829 ) ) ( not ( = ?auto_1455826 ?auto_1455830 ) ) ( not ( = ?auto_1455826 ?auto_1455831 ) ) ( not ( = ?auto_1455825 ?auto_1455827 ) ) ( not ( = ?auto_1455825 ?auto_1455828 ) ) ( not ( = ?auto_1455825 ?auto_1455829 ) ) ( not ( = ?auto_1455825 ?auto_1455830 ) ) ( not ( = ?auto_1455825 ?auto_1455831 ) ) ( not ( = ?auto_1455827 ?auto_1455828 ) ) ( not ( = ?auto_1455827 ?auto_1455829 ) ) ( not ( = ?auto_1455827 ?auto_1455830 ) ) ( not ( = ?auto_1455827 ?auto_1455831 ) ) ( not ( = ?auto_1455828 ?auto_1455829 ) ) ( not ( = ?auto_1455828 ?auto_1455830 ) ) ( not ( = ?auto_1455828 ?auto_1455831 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1455829 ?auto_1455830 ?auto_1455831 )
      ( MAKE-11CRATE-VERIFY ?auto_1455821 ?auto_1455822 ?auto_1455823 ?auto_1455820 ?auto_1455824 ?auto_1455826 ?auto_1455825 ?auto_1455827 ?auto_1455828 ?auto_1455829 ?auto_1455830 ?auto_1455831 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1455964 - SURFACE
      ?auto_1455965 - SURFACE
      ?auto_1455966 - SURFACE
      ?auto_1455963 - SURFACE
      ?auto_1455967 - SURFACE
      ?auto_1455969 - SURFACE
      ?auto_1455968 - SURFACE
      ?auto_1455970 - SURFACE
      ?auto_1455971 - SURFACE
      ?auto_1455972 - SURFACE
      ?auto_1455973 - SURFACE
      ?auto_1455974 - SURFACE
    )
    :vars
    (
      ?auto_1455976 - HOIST
      ?auto_1455975 - PLACE
      ?auto_1455977 - TRUCK
      ?auto_1455978 - PLACE
      ?auto_1455980 - HOIST
      ?auto_1455979 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1455976 ?auto_1455975 ) ( SURFACE-AT ?auto_1455973 ?auto_1455975 ) ( CLEAR ?auto_1455973 ) ( IS-CRATE ?auto_1455974 ) ( not ( = ?auto_1455973 ?auto_1455974 ) ) ( AVAILABLE ?auto_1455976 ) ( ON ?auto_1455973 ?auto_1455972 ) ( not ( = ?auto_1455972 ?auto_1455973 ) ) ( not ( = ?auto_1455972 ?auto_1455974 ) ) ( TRUCK-AT ?auto_1455977 ?auto_1455978 ) ( not ( = ?auto_1455978 ?auto_1455975 ) ) ( HOIST-AT ?auto_1455980 ?auto_1455978 ) ( not ( = ?auto_1455976 ?auto_1455980 ) ) ( AVAILABLE ?auto_1455980 ) ( SURFACE-AT ?auto_1455974 ?auto_1455978 ) ( ON ?auto_1455974 ?auto_1455979 ) ( CLEAR ?auto_1455974 ) ( not ( = ?auto_1455973 ?auto_1455979 ) ) ( not ( = ?auto_1455974 ?auto_1455979 ) ) ( not ( = ?auto_1455972 ?auto_1455979 ) ) ( ON ?auto_1455965 ?auto_1455964 ) ( ON ?auto_1455966 ?auto_1455965 ) ( ON ?auto_1455963 ?auto_1455966 ) ( ON ?auto_1455967 ?auto_1455963 ) ( ON ?auto_1455969 ?auto_1455967 ) ( ON ?auto_1455968 ?auto_1455969 ) ( ON ?auto_1455970 ?auto_1455968 ) ( ON ?auto_1455971 ?auto_1455970 ) ( ON ?auto_1455972 ?auto_1455971 ) ( not ( = ?auto_1455964 ?auto_1455965 ) ) ( not ( = ?auto_1455964 ?auto_1455966 ) ) ( not ( = ?auto_1455964 ?auto_1455963 ) ) ( not ( = ?auto_1455964 ?auto_1455967 ) ) ( not ( = ?auto_1455964 ?auto_1455969 ) ) ( not ( = ?auto_1455964 ?auto_1455968 ) ) ( not ( = ?auto_1455964 ?auto_1455970 ) ) ( not ( = ?auto_1455964 ?auto_1455971 ) ) ( not ( = ?auto_1455964 ?auto_1455972 ) ) ( not ( = ?auto_1455964 ?auto_1455973 ) ) ( not ( = ?auto_1455964 ?auto_1455974 ) ) ( not ( = ?auto_1455964 ?auto_1455979 ) ) ( not ( = ?auto_1455965 ?auto_1455966 ) ) ( not ( = ?auto_1455965 ?auto_1455963 ) ) ( not ( = ?auto_1455965 ?auto_1455967 ) ) ( not ( = ?auto_1455965 ?auto_1455969 ) ) ( not ( = ?auto_1455965 ?auto_1455968 ) ) ( not ( = ?auto_1455965 ?auto_1455970 ) ) ( not ( = ?auto_1455965 ?auto_1455971 ) ) ( not ( = ?auto_1455965 ?auto_1455972 ) ) ( not ( = ?auto_1455965 ?auto_1455973 ) ) ( not ( = ?auto_1455965 ?auto_1455974 ) ) ( not ( = ?auto_1455965 ?auto_1455979 ) ) ( not ( = ?auto_1455966 ?auto_1455963 ) ) ( not ( = ?auto_1455966 ?auto_1455967 ) ) ( not ( = ?auto_1455966 ?auto_1455969 ) ) ( not ( = ?auto_1455966 ?auto_1455968 ) ) ( not ( = ?auto_1455966 ?auto_1455970 ) ) ( not ( = ?auto_1455966 ?auto_1455971 ) ) ( not ( = ?auto_1455966 ?auto_1455972 ) ) ( not ( = ?auto_1455966 ?auto_1455973 ) ) ( not ( = ?auto_1455966 ?auto_1455974 ) ) ( not ( = ?auto_1455966 ?auto_1455979 ) ) ( not ( = ?auto_1455963 ?auto_1455967 ) ) ( not ( = ?auto_1455963 ?auto_1455969 ) ) ( not ( = ?auto_1455963 ?auto_1455968 ) ) ( not ( = ?auto_1455963 ?auto_1455970 ) ) ( not ( = ?auto_1455963 ?auto_1455971 ) ) ( not ( = ?auto_1455963 ?auto_1455972 ) ) ( not ( = ?auto_1455963 ?auto_1455973 ) ) ( not ( = ?auto_1455963 ?auto_1455974 ) ) ( not ( = ?auto_1455963 ?auto_1455979 ) ) ( not ( = ?auto_1455967 ?auto_1455969 ) ) ( not ( = ?auto_1455967 ?auto_1455968 ) ) ( not ( = ?auto_1455967 ?auto_1455970 ) ) ( not ( = ?auto_1455967 ?auto_1455971 ) ) ( not ( = ?auto_1455967 ?auto_1455972 ) ) ( not ( = ?auto_1455967 ?auto_1455973 ) ) ( not ( = ?auto_1455967 ?auto_1455974 ) ) ( not ( = ?auto_1455967 ?auto_1455979 ) ) ( not ( = ?auto_1455969 ?auto_1455968 ) ) ( not ( = ?auto_1455969 ?auto_1455970 ) ) ( not ( = ?auto_1455969 ?auto_1455971 ) ) ( not ( = ?auto_1455969 ?auto_1455972 ) ) ( not ( = ?auto_1455969 ?auto_1455973 ) ) ( not ( = ?auto_1455969 ?auto_1455974 ) ) ( not ( = ?auto_1455969 ?auto_1455979 ) ) ( not ( = ?auto_1455968 ?auto_1455970 ) ) ( not ( = ?auto_1455968 ?auto_1455971 ) ) ( not ( = ?auto_1455968 ?auto_1455972 ) ) ( not ( = ?auto_1455968 ?auto_1455973 ) ) ( not ( = ?auto_1455968 ?auto_1455974 ) ) ( not ( = ?auto_1455968 ?auto_1455979 ) ) ( not ( = ?auto_1455970 ?auto_1455971 ) ) ( not ( = ?auto_1455970 ?auto_1455972 ) ) ( not ( = ?auto_1455970 ?auto_1455973 ) ) ( not ( = ?auto_1455970 ?auto_1455974 ) ) ( not ( = ?auto_1455970 ?auto_1455979 ) ) ( not ( = ?auto_1455971 ?auto_1455972 ) ) ( not ( = ?auto_1455971 ?auto_1455973 ) ) ( not ( = ?auto_1455971 ?auto_1455974 ) ) ( not ( = ?auto_1455971 ?auto_1455979 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1455972 ?auto_1455973 ?auto_1455974 )
      ( MAKE-11CRATE-VERIFY ?auto_1455964 ?auto_1455965 ?auto_1455966 ?auto_1455963 ?auto_1455967 ?auto_1455969 ?auto_1455968 ?auto_1455970 ?auto_1455971 ?auto_1455972 ?auto_1455973 ?auto_1455974 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1456108 - SURFACE
      ?auto_1456109 - SURFACE
      ?auto_1456110 - SURFACE
      ?auto_1456107 - SURFACE
      ?auto_1456111 - SURFACE
      ?auto_1456113 - SURFACE
      ?auto_1456112 - SURFACE
      ?auto_1456114 - SURFACE
      ?auto_1456115 - SURFACE
      ?auto_1456116 - SURFACE
      ?auto_1456117 - SURFACE
      ?auto_1456118 - SURFACE
    )
    :vars
    (
      ?auto_1456123 - HOIST
      ?auto_1456121 - PLACE
      ?auto_1456124 - PLACE
      ?auto_1456119 - HOIST
      ?auto_1456122 - SURFACE
      ?auto_1456120 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1456123 ?auto_1456121 ) ( SURFACE-AT ?auto_1456117 ?auto_1456121 ) ( CLEAR ?auto_1456117 ) ( IS-CRATE ?auto_1456118 ) ( not ( = ?auto_1456117 ?auto_1456118 ) ) ( AVAILABLE ?auto_1456123 ) ( ON ?auto_1456117 ?auto_1456116 ) ( not ( = ?auto_1456116 ?auto_1456117 ) ) ( not ( = ?auto_1456116 ?auto_1456118 ) ) ( not ( = ?auto_1456124 ?auto_1456121 ) ) ( HOIST-AT ?auto_1456119 ?auto_1456124 ) ( not ( = ?auto_1456123 ?auto_1456119 ) ) ( AVAILABLE ?auto_1456119 ) ( SURFACE-AT ?auto_1456118 ?auto_1456124 ) ( ON ?auto_1456118 ?auto_1456122 ) ( CLEAR ?auto_1456118 ) ( not ( = ?auto_1456117 ?auto_1456122 ) ) ( not ( = ?auto_1456118 ?auto_1456122 ) ) ( not ( = ?auto_1456116 ?auto_1456122 ) ) ( TRUCK-AT ?auto_1456120 ?auto_1456121 ) ( ON ?auto_1456109 ?auto_1456108 ) ( ON ?auto_1456110 ?auto_1456109 ) ( ON ?auto_1456107 ?auto_1456110 ) ( ON ?auto_1456111 ?auto_1456107 ) ( ON ?auto_1456113 ?auto_1456111 ) ( ON ?auto_1456112 ?auto_1456113 ) ( ON ?auto_1456114 ?auto_1456112 ) ( ON ?auto_1456115 ?auto_1456114 ) ( ON ?auto_1456116 ?auto_1456115 ) ( not ( = ?auto_1456108 ?auto_1456109 ) ) ( not ( = ?auto_1456108 ?auto_1456110 ) ) ( not ( = ?auto_1456108 ?auto_1456107 ) ) ( not ( = ?auto_1456108 ?auto_1456111 ) ) ( not ( = ?auto_1456108 ?auto_1456113 ) ) ( not ( = ?auto_1456108 ?auto_1456112 ) ) ( not ( = ?auto_1456108 ?auto_1456114 ) ) ( not ( = ?auto_1456108 ?auto_1456115 ) ) ( not ( = ?auto_1456108 ?auto_1456116 ) ) ( not ( = ?auto_1456108 ?auto_1456117 ) ) ( not ( = ?auto_1456108 ?auto_1456118 ) ) ( not ( = ?auto_1456108 ?auto_1456122 ) ) ( not ( = ?auto_1456109 ?auto_1456110 ) ) ( not ( = ?auto_1456109 ?auto_1456107 ) ) ( not ( = ?auto_1456109 ?auto_1456111 ) ) ( not ( = ?auto_1456109 ?auto_1456113 ) ) ( not ( = ?auto_1456109 ?auto_1456112 ) ) ( not ( = ?auto_1456109 ?auto_1456114 ) ) ( not ( = ?auto_1456109 ?auto_1456115 ) ) ( not ( = ?auto_1456109 ?auto_1456116 ) ) ( not ( = ?auto_1456109 ?auto_1456117 ) ) ( not ( = ?auto_1456109 ?auto_1456118 ) ) ( not ( = ?auto_1456109 ?auto_1456122 ) ) ( not ( = ?auto_1456110 ?auto_1456107 ) ) ( not ( = ?auto_1456110 ?auto_1456111 ) ) ( not ( = ?auto_1456110 ?auto_1456113 ) ) ( not ( = ?auto_1456110 ?auto_1456112 ) ) ( not ( = ?auto_1456110 ?auto_1456114 ) ) ( not ( = ?auto_1456110 ?auto_1456115 ) ) ( not ( = ?auto_1456110 ?auto_1456116 ) ) ( not ( = ?auto_1456110 ?auto_1456117 ) ) ( not ( = ?auto_1456110 ?auto_1456118 ) ) ( not ( = ?auto_1456110 ?auto_1456122 ) ) ( not ( = ?auto_1456107 ?auto_1456111 ) ) ( not ( = ?auto_1456107 ?auto_1456113 ) ) ( not ( = ?auto_1456107 ?auto_1456112 ) ) ( not ( = ?auto_1456107 ?auto_1456114 ) ) ( not ( = ?auto_1456107 ?auto_1456115 ) ) ( not ( = ?auto_1456107 ?auto_1456116 ) ) ( not ( = ?auto_1456107 ?auto_1456117 ) ) ( not ( = ?auto_1456107 ?auto_1456118 ) ) ( not ( = ?auto_1456107 ?auto_1456122 ) ) ( not ( = ?auto_1456111 ?auto_1456113 ) ) ( not ( = ?auto_1456111 ?auto_1456112 ) ) ( not ( = ?auto_1456111 ?auto_1456114 ) ) ( not ( = ?auto_1456111 ?auto_1456115 ) ) ( not ( = ?auto_1456111 ?auto_1456116 ) ) ( not ( = ?auto_1456111 ?auto_1456117 ) ) ( not ( = ?auto_1456111 ?auto_1456118 ) ) ( not ( = ?auto_1456111 ?auto_1456122 ) ) ( not ( = ?auto_1456113 ?auto_1456112 ) ) ( not ( = ?auto_1456113 ?auto_1456114 ) ) ( not ( = ?auto_1456113 ?auto_1456115 ) ) ( not ( = ?auto_1456113 ?auto_1456116 ) ) ( not ( = ?auto_1456113 ?auto_1456117 ) ) ( not ( = ?auto_1456113 ?auto_1456118 ) ) ( not ( = ?auto_1456113 ?auto_1456122 ) ) ( not ( = ?auto_1456112 ?auto_1456114 ) ) ( not ( = ?auto_1456112 ?auto_1456115 ) ) ( not ( = ?auto_1456112 ?auto_1456116 ) ) ( not ( = ?auto_1456112 ?auto_1456117 ) ) ( not ( = ?auto_1456112 ?auto_1456118 ) ) ( not ( = ?auto_1456112 ?auto_1456122 ) ) ( not ( = ?auto_1456114 ?auto_1456115 ) ) ( not ( = ?auto_1456114 ?auto_1456116 ) ) ( not ( = ?auto_1456114 ?auto_1456117 ) ) ( not ( = ?auto_1456114 ?auto_1456118 ) ) ( not ( = ?auto_1456114 ?auto_1456122 ) ) ( not ( = ?auto_1456115 ?auto_1456116 ) ) ( not ( = ?auto_1456115 ?auto_1456117 ) ) ( not ( = ?auto_1456115 ?auto_1456118 ) ) ( not ( = ?auto_1456115 ?auto_1456122 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1456116 ?auto_1456117 ?auto_1456118 )
      ( MAKE-11CRATE-VERIFY ?auto_1456108 ?auto_1456109 ?auto_1456110 ?auto_1456107 ?auto_1456111 ?auto_1456113 ?auto_1456112 ?auto_1456114 ?auto_1456115 ?auto_1456116 ?auto_1456117 ?auto_1456118 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1456252 - SURFACE
      ?auto_1456253 - SURFACE
      ?auto_1456254 - SURFACE
      ?auto_1456251 - SURFACE
      ?auto_1456255 - SURFACE
      ?auto_1456257 - SURFACE
      ?auto_1456256 - SURFACE
      ?auto_1456258 - SURFACE
      ?auto_1456259 - SURFACE
      ?auto_1456260 - SURFACE
      ?auto_1456261 - SURFACE
      ?auto_1456262 - SURFACE
    )
    :vars
    (
      ?auto_1456268 - HOIST
      ?auto_1456267 - PLACE
      ?auto_1456266 - PLACE
      ?auto_1456263 - HOIST
      ?auto_1456264 - SURFACE
      ?auto_1456265 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1456268 ?auto_1456267 ) ( IS-CRATE ?auto_1456262 ) ( not ( = ?auto_1456261 ?auto_1456262 ) ) ( not ( = ?auto_1456260 ?auto_1456261 ) ) ( not ( = ?auto_1456260 ?auto_1456262 ) ) ( not ( = ?auto_1456266 ?auto_1456267 ) ) ( HOIST-AT ?auto_1456263 ?auto_1456266 ) ( not ( = ?auto_1456268 ?auto_1456263 ) ) ( AVAILABLE ?auto_1456263 ) ( SURFACE-AT ?auto_1456262 ?auto_1456266 ) ( ON ?auto_1456262 ?auto_1456264 ) ( CLEAR ?auto_1456262 ) ( not ( = ?auto_1456261 ?auto_1456264 ) ) ( not ( = ?auto_1456262 ?auto_1456264 ) ) ( not ( = ?auto_1456260 ?auto_1456264 ) ) ( TRUCK-AT ?auto_1456265 ?auto_1456267 ) ( SURFACE-AT ?auto_1456260 ?auto_1456267 ) ( CLEAR ?auto_1456260 ) ( LIFTING ?auto_1456268 ?auto_1456261 ) ( IS-CRATE ?auto_1456261 ) ( ON ?auto_1456253 ?auto_1456252 ) ( ON ?auto_1456254 ?auto_1456253 ) ( ON ?auto_1456251 ?auto_1456254 ) ( ON ?auto_1456255 ?auto_1456251 ) ( ON ?auto_1456257 ?auto_1456255 ) ( ON ?auto_1456256 ?auto_1456257 ) ( ON ?auto_1456258 ?auto_1456256 ) ( ON ?auto_1456259 ?auto_1456258 ) ( ON ?auto_1456260 ?auto_1456259 ) ( not ( = ?auto_1456252 ?auto_1456253 ) ) ( not ( = ?auto_1456252 ?auto_1456254 ) ) ( not ( = ?auto_1456252 ?auto_1456251 ) ) ( not ( = ?auto_1456252 ?auto_1456255 ) ) ( not ( = ?auto_1456252 ?auto_1456257 ) ) ( not ( = ?auto_1456252 ?auto_1456256 ) ) ( not ( = ?auto_1456252 ?auto_1456258 ) ) ( not ( = ?auto_1456252 ?auto_1456259 ) ) ( not ( = ?auto_1456252 ?auto_1456260 ) ) ( not ( = ?auto_1456252 ?auto_1456261 ) ) ( not ( = ?auto_1456252 ?auto_1456262 ) ) ( not ( = ?auto_1456252 ?auto_1456264 ) ) ( not ( = ?auto_1456253 ?auto_1456254 ) ) ( not ( = ?auto_1456253 ?auto_1456251 ) ) ( not ( = ?auto_1456253 ?auto_1456255 ) ) ( not ( = ?auto_1456253 ?auto_1456257 ) ) ( not ( = ?auto_1456253 ?auto_1456256 ) ) ( not ( = ?auto_1456253 ?auto_1456258 ) ) ( not ( = ?auto_1456253 ?auto_1456259 ) ) ( not ( = ?auto_1456253 ?auto_1456260 ) ) ( not ( = ?auto_1456253 ?auto_1456261 ) ) ( not ( = ?auto_1456253 ?auto_1456262 ) ) ( not ( = ?auto_1456253 ?auto_1456264 ) ) ( not ( = ?auto_1456254 ?auto_1456251 ) ) ( not ( = ?auto_1456254 ?auto_1456255 ) ) ( not ( = ?auto_1456254 ?auto_1456257 ) ) ( not ( = ?auto_1456254 ?auto_1456256 ) ) ( not ( = ?auto_1456254 ?auto_1456258 ) ) ( not ( = ?auto_1456254 ?auto_1456259 ) ) ( not ( = ?auto_1456254 ?auto_1456260 ) ) ( not ( = ?auto_1456254 ?auto_1456261 ) ) ( not ( = ?auto_1456254 ?auto_1456262 ) ) ( not ( = ?auto_1456254 ?auto_1456264 ) ) ( not ( = ?auto_1456251 ?auto_1456255 ) ) ( not ( = ?auto_1456251 ?auto_1456257 ) ) ( not ( = ?auto_1456251 ?auto_1456256 ) ) ( not ( = ?auto_1456251 ?auto_1456258 ) ) ( not ( = ?auto_1456251 ?auto_1456259 ) ) ( not ( = ?auto_1456251 ?auto_1456260 ) ) ( not ( = ?auto_1456251 ?auto_1456261 ) ) ( not ( = ?auto_1456251 ?auto_1456262 ) ) ( not ( = ?auto_1456251 ?auto_1456264 ) ) ( not ( = ?auto_1456255 ?auto_1456257 ) ) ( not ( = ?auto_1456255 ?auto_1456256 ) ) ( not ( = ?auto_1456255 ?auto_1456258 ) ) ( not ( = ?auto_1456255 ?auto_1456259 ) ) ( not ( = ?auto_1456255 ?auto_1456260 ) ) ( not ( = ?auto_1456255 ?auto_1456261 ) ) ( not ( = ?auto_1456255 ?auto_1456262 ) ) ( not ( = ?auto_1456255 ?auto_1456264 ) ) ( not ( = ?auto_1456257 ?auto_1456256 ) ) ( not ( = ?auto_1456257 ?auto_1456258 ) ) ( not ( = ?auto_1456257 ?auto_1456259 ) ) ( not ( = ?auto_1456257 ?auto_1456260 ) ) ( not ( = ?auto_1456257 ?auto_1456261 ) ) ( not ( = ?auto_1456257 ?auto_1456262 ) ) ( not ( = ?auto_1456257 ?auto_1456264 ) ) ( not ( = ?auto_1456256 ?auto_1456258 ) ) ( not ( = ?auto_1456256 ?auto_1456259 ) ) ( not ( = ?auto_1456256 ?auto_1456260 ) ) ( not ( = ?auto_1456256 ?auto_1456261 ) ) ( not ( = ?auto_1456256 ?auto_1456262 ) ) ( not ( = ?auto_1456256 ?auto_1456264 ) ) ( not ( = ?auto_1456258 ?auto_1456259 ) ) ( not ( = ?auto_1456258 ?auto_1456260 ) ) ( not ( = ?auto_1456258 ?auto_1456261 ) ) ( not ( = ?auto_1456258 ?auto_1456262 ) ) ( not ( = ?auto_1456258 ?auto_1456264 ) ) ( not ( = ?auto_1456259 ?auto_1456260 ) ) ( not ( = ?auto_1456259 ?auto_1456261 ) ) ( not ( = ?auto_1456259 ?auto_1456262 ) ) ( not ( = ?auto_1456259 ?auto_1456264 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1456260 ?auto_1456261 ?auto_1456262 )
      ( MAKE-11CRATE-VERIFY ?auto_1456252 ?auto_1456253 ?auto_1456254 ?auto_1456251 ?auto_1456255 ?auto_1456257 ?auto_1456256 ?auto_1456258 ?auto_1456259 ?auto_1456260 ?auto_1456261 ?auto_1456262 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1456396 - SURFACE
      ?auto_1456397 - SURFACE
      ?auto_1456398 - SURFACE
      ?auto_1456395 - SURFACE
      ?auto_1456399 - SURFACE
      ?auto_1456401 - SURFACE
      ?auto_1456400 - SURFACE
      ?auto_1456402 - SURFACE
      ?auto_1456403 - SURFACE
      ?auto_1456404 - SURFACE
      ?auto_1456405 - SURFACE
      ?auto_1456406 - SURFACE
    )
    :vars
    (
      ?auto_1456409 - HOIST
      ?auto_1456412 - PLACE
      ?auto_1456411 - PLACE
      ?auto_1456408 - HOIST
      ?auto_1456410 - SURFACE
      ?auto_1456407 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1456409 ?auto_1456412 ) ( IS-CRATE ?auto_1456406 ) ( not ( = ?auto_1456405 ?auto_1456406 ) ) ( not ( = ?auto_1456404 ?auto_1456405 ) ) ( not ( = ?auto_1456404 ?auto_1456406 ) ) ( not ( = ?auto_1456411 ?auto_1456412 ) ) ( HOIST-AT ?auto_1456408 ?auto_1456411 ) ( not ( = ?auto_1456409 ?auto_1456408 ) ) ( AVAILABLE ?auto_1456408 ) ( SURFACE-AT ?auto_1456406 ?auto_1456411 ) ( ON ?auto_1456406 ?auto_1456410 ) ( CLEAR ?auto_1456406 ) ( not ( = ?auto_1456405 ?auto_1456410 ) ) ( not ( = ?auto_1456406 ?auto_1456410 ) ) ( not ( = ?auto_1456404 ?auto_1456410 ) ) ( TRUCK-AT ?auto_1456407 ?auto_1456412 ) ( SURFACE-AT ?auto_1456404 ?auto_1456412 ) ( CLEAR ?auto_1456404 ) ( IS-CRATE ?auto_1456405 ) ( AVAILABLE ?auto_1456409 ) ( IN ?auto_1456405 ?auto_1456407 ) ( ON ?auto_1456397 ?auto_1456396 ) ( ON ?auto_1456398 ?auto_1456397 ) ( ON ?auto_1456395 ?auto_1456398 ) ( ON ?auto_1456399 ?auto_1456395 ) ( ON ?auto_1456401 ?auto_1456399 ) ( ON ?auto_1456400 ?auto_1456401 ) ( ON ?auto_1456402 ?auto_1456400 ) ( ON ?auto_1456403 ?auto_1456402 ) ( ON ?auto_1456404 ?auto_1456403 ) ( not ( = ?auto_1456396 ?auto_1456397 ) ) ( not ( = ?auto_1456396 ?auto_1456398 ) ) ( not ( = ?auto_1456396 ?auto_1456395 ) ) ( not ( = ?auto_1456396 ?auto_1456399 ) ) ( not ( = ?auto_1456396 ?auto_1456401 ) ) ( not ( = ?auto_1456396 ?auto_1456400 ) ) ( not ( = ?auto_1456396 ?auto_1456402 ) ) ( not ( = ?auto_1456396 ?auto_1456403 ) ) ( not ( = ?auto_1456396 ?auto_1456404 ) ) ( not ( = ?auto_1456396 ?auto_1456405 ) ) ( not ( = ?auto_1456396 ?auto_1456406 ) ) ( not ( = ?auto_1456396 ?auto_1456410 ) ) ( not ( = ?auto_1456397 ?auto_1456398 ) ) ( not ( = ?auto_1456397 ?auto_1456395 ) ) ( not ( = ?auto_1456397 ?auto_1456399 ) ) ( not ( = ?auto_1456397 ?auto_1456401 ) ) ( not ( = ?auto_1456397 ?auto_1456400 ) ) ( not ( = ?auto_1456397 ?auto_1456402 ) ) ( not ( = ?auto_1456397 ?auto_1456403 ) ) ( not ( = ?auto_1456397 ?auto_1456404 ) ) ( not ( = ?auto_1456397 ?auto_1456405 ) ) ( not ( = ?auto_1456397 ?auto_1456406 ) ) ( not ( = ?auto_1456397 ?auto_1456410 ) ) ( not ( = ?auto_1456398 ?auto_1456395 ) ) ( not ( = ?auto_1456398 ?auto_1456399 ) ) ( not ( = ?auto_1456398 ?auto_1456401 ) ) ( not ( = ?auto_1456398 ?auto_1456400 ) ) ( not ( = ?auto_1456398 ?auto_1456402 ) ) ( not ( = ?auto_1456398 ?auto_1456403 ) ) ( not ( = ?auto_1456398 ?auto_1456404 ) ) ( not ( = ?auto_1456398 ?auto_1456405 ) ) ( not ( = ?auto_1456398 ?auto_1456406 ) ) ( not ( = ?auto_1456398 ?auto_1456410 ) ) ( not ( = ?auto_1456395 ?auto_1456399 ) ) ( not ( = ?auto_1456395 ?auto_1456401 ) ) ( not ( = ?auto_1456395 ?auto_1456400 ) ) ( not ( = ?auto_1456395 ?auto_1456402 ) ) ( not ( = ?auto_1456395 ?auto_1456403 ) ) ( not ( = ?auto_1456395 ?auto_1456404 ) ) ( not ( = ?auto_1456395 ?auto_1456405 ) ) ( not ( = ?auto_1456395 ?auto_1456406 ) ) ( not ( = ?auto_1456395 ?auto_1456410 ) ) ( not ( = ?auto_1456399 ?auto_1456401 ) ) ( not ( = ?auto_1456399 ?auto_1456400 ) ) ( not ( = ?auto_1456399 ?auto_1456402 ) ) ( not ( = ?auto_1456399 ?auto_1456403 ) ) ( not ( = ?auto_1456399 ?auto_1456404 ) ) ( not ( = ?auto_1456399 ?auto_1456405 ) ) ( not ( = ?auto_1456399 ?auto_1456406 ) ) ( not ( = ?auto_1456399 ?auto_1456410 ) ) ( not ( = ?auto_1456401 ?auto_1456400 ) ) ( not ( = ?auto_1456401 ?auto_1456402 ) ) ( not ( = ?auto_1456401 ?auto_1456403 ) ) ( not ( = ?auto_1456401 ?auto_1456404 ) ) ( not ( = ?auto_1456401 ?auto_1456405 ) ) ( not ( = ?auto_1456401 ?auto_1456406 ) ) ( not ( = ?auto_1456401 ?auto_1456410 ) ) ( not ( = ?auto_1456400 ?auto_1456402 ) ) ( not ( = ?auto_1456400 ?auto_1456403 ) ) ( not ( = ?auto_1456400 ?auto_1456404 ) ) ( not ( = ?auto_1456400 ?auto_1456405 ) ) ( not ( = ?auto_1456400 ?auto_1456406 ) ) ( not ( = ?auto_1456400 ?auto_1456410 ) ) ( not ( = ?auto_1456402 ?auto_1456403 ) ) ( not ( = ?auto_1456402 ?auto_1456404 ) ) ( not ( = ?auto_1456402 ?auto_1456405 ) ) ( not ( = ?auto_1456402 ?auto_1456406 ) ) ( not ( = ?auto_1456402 ?auto_1456410 ) ) ( not ( = ?auto_1456403 ?auto_1456404 ) ) ( not ( = ?auto_1456403 ?auto_1456405 ) ) ( not ( = ?auto_1456403 ?auto_1456406 ) ) ( not ( = ?auto_1456403 ?auto_1456410 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1456404 ?auto_1456405 ?auto_1456406 )
      ( MAKE-11CRATE-VERIFY ?auto_1456396 ?auto_1456397 ?auto_1456398 ?auto_1456395 ?auto_1456399 ?auto_1456401 ?auto_1456400 ?auto_1456402 ?auto_1456403 ?auto_1456404 ?auto_1456405 ?auto_1456406 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1465576 - SURFACE
      ?auto_1465577 - SURFACE
      ?auto_1465578 - SURFACE
      ?auto_1465575 - SURFACE
      ?auto_1465579 - SURFACE
      ?auto_1465581 - SURFACE
      ?auto_1465580 - SURFACE
      ?auto_1465582 - SURFACE
      ?auto_1465583 - SURFACE
      ?auto_1465584 - SURFACE
      ?auto_1465585 - SURFACE
      ?auto_1465586 - SURFACE
      ?auto_1465587 - SURFACE
    )
    :vars
    (
      ?auto_1465589 - HOIST
      ?auto_1465588 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1465589 ?auto_1465588 ) ( SURFACE-AT ?auto_1465586 ?auto_1465588 ) ( CLEAR ?auto_1465586 ) ( LIFTING ?auto_1465589 ?auto_1465587 ) ( IS-CRATE ?auto_1465587 ) ( not ( = ?auto_1465586 ?auto_1465587 ) ) ( ON ?auto_1465577 ?auto_1465576 ) ( ON ?auto_1465578 ?auto_1465577 ) ( ON ?auto_1465575 ?auto_1465578 ) ( ON ?auto_1465579 ?auto_1465575 ) ( ON ?auto_1465581 ?auto_1465579 ) ( ON ?auto_1465580 ?auto_1465581 ) ( ON ?auto_1465582 ?auto_1465580 ) ( ON ?auto_1465583 ?auto_1465582 ) ( ON ?auto_1465584 ?auto_1465583 ) ( ON ?auto_1465585 ?auto_1465584 ) ( ON ?auto_1465586 ?auto_1465585 ) ( not ( = ?auto_1465576 ?auto_1465577 ) ) ( not ( = ?auto_1465576 ?auto_1465578 ) ) ( not ( = ?auto_1465576 ?auto_1465575 ) ) ( not ( = ?auto_1465576 ?auto_1465579 ) ) ( not ( = ?auto_1465576 ?auto_1465581 ) ) ( not ( = ?auto_1465576 ?auto_1465580 ) ) ( not ( = ?auto_1465576 ?auto_1465582 ) ) ( not ( = ?auto_1465576 ?auto_1465583 ) ) ( not ( = ?auto_1465576 ?auto_1465584 ) ) ( not ( = ?auto_1465576 ?auto_1465585 ) ) ( not ( = ?auto_1465576 ?auto_1465586 ) ) ( not ( = ?auto_1465576 ?auto_1465587 ) ) ( not ( = ?auto_1465577 ?auto_1465578 ) ) ( not ( = ?auto_1465577 ?auto_1465575 ) ) ( not ( = ?auto_1465577 ?auto_1465579 ) ) ( not ( = ?auto_1465577 ?auto_1465581 ) ) ( not ( = ?auto_1465577 ?auto_1465580 ) ) ( not ( = ?auto_1465577 ?auto_1465582 ) ) ( not ( = ?auto_1465577 ?auto_1465583 ) ) ( not ( = ?auto_1465577 ?auto_1465584 ) ) ( not ( = ?auto_1465577 ?auto_1465585 ) ) ( not ( = ?auto_1465577 ?auto_1465586 ) ) ( not ( = ?auto_1465577 ?auto_1465587 ) ) ( not ( = ?auto_1465578 ?auto_1465575 ) ) ( not ( = ?auto_1465578 ?auto_1465579 ) ) ( not ( = ?auto_1465578 ?auto_1465581 ) ) ( not ( = ?auto_1465578 ?auto_1465580 ) ) ( not ( = ?auto_1465578 ?auto_1465582 ) ) ( not ( = ?auto_1465578 ?auto_1465583 ) ) ( not ( = ?auto_1465578 ?auto_1465584 ) ) ( not ( = ?auto_1465578 ?auto_1465585 ) ) ( not ( = ?auto_1465578 ?auto_1465586 ) ) ( not ( = ?auto_1465578 ?auto_1465587 ) ) ( not ( = ?auto_1465575 ?auto_1465579 ) ) ( not ( = ?auto_1465575 ?auto_1465581 ) ) ( not ( = ?auto_1465575 ?auto_1465580 ) ) ( not ( = ?auto_1465575 ?auto_1465582 ) ) ( not ( = ?auto_1465575 ?auto_1465583 ) ) ( not ( = ?auto_1465575 ?auto_1465584 ) ) ( not ( = ?auto_1465575 ?auto_1465585 ) ) ( not ( = ?auto_1465575 ?auto_1465586 ) ) ( not ( = ?auto_1465575 ?auto_1465587 ) ) ( not ( = ?auto_1465579 ?auto_1465581 ) ) ( not ( = ?auto_1465579 ?auto_1465580 ) ) ( not ( = ?auto_1465579 ?auto_1465582 ) ) ( not ( = ?auto_1465579 ?auto_1465583 ) ) ( not ( = ?auto_1465579 ?auto_1465584 ) ) ( not ( = ?auto_1465579 ?auto_1465585 ) ) ( not ( = ?auto_1465579 ?auto_1465586 ) ) ( not ( = ?auto_1465579 ?auto_1465587 ) ) ( not ( = ?auto_1465581 ?auto_1465580 ) ) ( not ( = ?auto_1465581 ?auto_1465582 ) ) ( not ( = ?auto_1465581 ?auto_1465583 ) ) ( not ( = ?auto_1465581 ?auto_1465584 ) ) ( not ( = ?auto_1465581 ?auto_1465585 ) ) ( not ( = ?auto_1465581 ?auto_1465586 ) ) ( not ( = ?auto_1465581 ?auto_1465587 ) ) ( not ( = ?auto_1465580 ?auto_1465582 ) ) ( not ( = ?auto_1465580 ?auto_1465583 ) ) ( not ( = ?auto_1465580 ?auto_1465584 ) ) ( not ( = ?auto_1465580 ?auto_1465585 ) ) ( not ( = ?auto_1465580 ?auto_1465586 ) ) ( not ( = ?auto_1465580 ?auto_1465587 ) ) ( not ( = ?auto_1465582 ?auto_1465583 ) ) ( not ( = ?auto_1465582 ?auto_1465584 ) ) ( not ( = ?auto_1465582 ?auto_1465585 ) ) ( not ( = ?auto_1465582 ?auto_1465586 ) ) ( not ( = ?auto_1465582 ?auto_1465587 ) ) ( not ( = ?auto_1465583 ?auto_1465584 ) ) ( not ( = ?auto_1465583 ?auto_1465585 ) ) ( not ( = ?auto_1465583 ?auto_1465586 ) ) ( not ( = ?auto_1465583 ?auto_1465587 ) ) ( not ( = ?auto_1465584 ?auto_1465585 ) ) ( not ( = ?auto_1465584 ?auto_1465586 ) ) ( not ( = ?auto_1465584 ?auto_1465587 ) ) ( not ( = ?auto_1465585 ?auto_1465586 ) ) ( not ( = ?auto_1465585 ?auto_1465587 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1465586 ?auto_1465587 )
      ( MAKE-12CRATE-VERIFY ?auto_1465576 ?auto_1465577 ?auto_1465578 ?auto_1465575 ?auto_1465579 ?auto_1465581 ?auto_1465580 ?auto_1465582 ?auto_1465583 ?auto_1465584 ?auto_1465585 ?auto_1465586 ?auto_1465587 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1465701 - SURFACE
      ?auto_1465702 - SURFACE
      ?auto_1465703 - SURFACE
      ?auto_1465700 - SURFACE
      ?auto_1465704 - SURFACE
      ?auto_1465706 - SURFACE
      ?auto_1465705 - SURFACE
      ?auto_1465707 - SURFACE
      ?auto_1465708 - SURFACE
      ?auto_1465709 - SURFACE
      ?auto_1465710 - SURFACE
      ?auto_1465711 - SURFACE
      ?auto_1465712 - SURFACE
    )
    :vars
    (
      ?auto_1465715 - HOIST
      ?auto_1465714 - PLACE
      ?auto_1465713 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1465715 ?auto_1465714 ) ( SURFACE-AT ?auto_1465711 ?auto_1465714 ) ( CLEAR ?auto_1465711 ) ( IS-CRATE ?auto_1465712 ) ( not ( = ?auto_1465711 ?auto_1465712 ) ) ( TRUCK-AT ?auto_1465713 ?auto_1465714 ) ( AVAILABLE ?auto_1465715 ) ( IN ?auto_1465712 ?auto_1465713 ) ( ON ?auto_1465711 ?auto_1465710 ) ( not ( = ?auto_1465710 ?auto_1465711 ) ) ( not ( = ?auto_1465710 ?auto_1465712 ) ) ( ON ?auto_1465702 ?auto_1465701 ) ( ON ?auto_1465703 ?auto_1465702 ) ( ON ?auto_1465700 ?auto_1465703 ) ( ON ?auto_1465704 ?auto_1465700 ) ( ON ?auto_1465706 ?auto_1465704 ) ( ON ?auto_1465705 ?auto_1465706 ) ( ON ?auto_1465707 ?auto_1465705 ) ( ON ?auto_1465708 ?auto_1465707 ) ( ON ?auto_1465709 ?auto_1465708 ) ( ON ?auto_1465710 ?auto_1465709 ) ( not ( = ?auto_1465701 ?auto_1465702 ) ) ( not ( = ?auto_1465701 ?auto_1465703 ) ) ( not ( = ?auto_1465701 ?auto_1465700 ) ) ( not ( = ?auto_1465701 ?auto_1465704 ) ) ( not ( = ?auto_1465701 ?auto_1465706 ) ) ( not ( = ?auto_1465701 ?auto_1465705 ) ) ( not ( = ?auto_1465701 ?auto_1465707 ) ) ( not ( = ?auto_1465701 ?auto_1465708 ) ) ( not ( = ?auto_1465701 ?auto_1465709 ) ) ( not ( = ?auto_1465701 ?auto_1465710 ) ) ( not ( = ?auto_1465701 ?auto_1465711 ) ) ( not ( = ?auto_1465701 ?auto_1465712 ) ) ( not ( = ?auto_1465702 ?auto_1465703 ) ) ( not ( = ?auto_1465702 ?auto_1465700 ) ) ( not ( = ?auto_1465702 ?auto_1465704 ) ) ( not ( = ?auto_1465702 ?auto_1465706 ) ) ( not ( = ?auto_1465702 ?auto_1465705 ) ) ( not ( = ?auto_1465702 ?auto_1465707 ) ) ( not ( = ?auto_1465702 ?auto_1465708 ) ) ( not ( = ?auto_1465702 ?auto_1465709 ) ) ( not ( = ?auto_1465702 ?auto_1465710 ) ) ( not ( = ?auto_1465702 ?auto_1465711 ) ) ( not ( = ?auto_1465702 ?auto_1465712 ) ) ( not ( = ?auto_1465703 ?auto_1465700 ) ) ( not ( = ?auto_1465703 ?auto_1465704 ) ) ( not ( = ?auto_1465703 ?auto_1465706 ) ) ( not ( = ?auto_1465703 ?auto_1465705 ) ) ( not ( = ?auto_1465703 ?auto_1465707 ) ) ( not ( = ?auto_1465703 ?auto_1465708 ) ) ( not ( = ?auto_1465703 ?auto_1465709 ) ) ( not ( = ?auto_1465703 ?auto_1465710 ) ) ( not ( = ?auto_1465703 ?auto_1465711 ) ) ( not ( = ?auto_1465703 ?auto_1465712 ) ) ( not ( = ?auto_1465700 ?auto_1465704 ) ) ( not ( = ?auto_1465700 ?auto_1465706 ) ) ( not ( = ?auto_1465700 ?auto_1465705 ) ) ( not ( = ?auto_1465700 ?auto_1465707 ) ) ( not ( = ?auto_1465700 ?auto_1465708 ) ) ( not ( = ?auto_1465700 ?auto_1465709 ) ) ( not ( = ?auto_1465700 ?auto_1465710 ) ) ( not ( = ?auto_1465700 ?auto_1465711 ) ) ( not ( = ?auto_1465700 ?auto_1465712 ) ) ( not ( = ?auto_1465704 ?auto_1465706 ) ) ( not ( = ?auto_1465704 ?auto_1465705 ) ) ( not ( = ?auto_1465704 ?auto_1465707 ) ) ( not ( = ?auto_1465704 ?auto_1465708 ) ) ( not ( = ?auto_1465704 ?auto_1465709 ) ) ( not ( = ?auto_1465704 ?auto_1465710 ) ) ( not ( = ?auto_1465704 ?auto_1465711 ) ) ( not ( = ?auto_1465704 ?auto_1465712 ) ) ( not ( = ?auto_1465706 ?auto_1465705 ) ) ( not ( = ?auto_1465706 ?auto_1465707 ) ) ( not ( = ?auto_1465706 ?auto_1465708 ) ) ( not ( = ?auto_1465706 ?auto_1465709 ) ) ( not ( = ?auto_1465706 ?auto_1465710 ) ) ( not ( = ?auto_1465706 ?auto_1465711 ) ) ( not ( = ?auto_1465706 ?auto_1465712 ) ) ( not ( = ?auto_1465705 ?auto_1465707 ) ) ( not ( = ?auto_1465705 ?auto_1465708 ) ) ( not ( = ?auto_1465705 ?auto_1465709 ) ) ( not ( = ?auto_1465705 ?auto_1465710 ) ) ( not ( = ?auto_1465705 ?auto_1465711 ) ) ( not ( = ?auto_1465705 ?auto_1465712 ) ) ( not ( = ?auto_1465707 ?auto_1465708 ) ) ( not ( = ?auto_1465707 ?auto_1465709 ) ) ( not ( = ?auto_1465707 ?auto_1465710 ) ) ( not ( = ?auto_1465707 ?auto_1465711 ) ) ( not ( = ?auto_1465707 ?auto_1465712 ) ) ( not ( = ?auto_1465708 ?auto_1465709 ) ) ( not ( = ?auto_1465708 ?auto_1465710 ) ) ( not ( = ?auto_1465708 ?auto_1465711 ) ) ( not ( = ?auto_1465708 ?auto_1465712 ) ) ( not ( = ?auto_1465709 ?auto_1465710 ) ) ( not ( = ?auto_1465709 ?auto_1465711 ) ) ( not ( = ?auto_1465709 ?auto_1465712 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1465710 ?auto_1465711 ?auto_1465712 )
      ( MAKE-12CRATE-VERIFY ?auto_1465701 ?auto_1465702 ?auto_1465703 ?auto_1465700 ?auto_1465704 ?auto_1465706 ?auto_1465705 ?auto_1465707 ?auto_1465708 ?auto_1465709 ?auto_1465710 ?auto_1465711 ?auto_1465712 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1465839 - SURFACE
      ?auto_1465840 - SURFACE
      ?auto_1465841 - SURFACE
      ?auto_1465838 - SURFACE
      ?auto_1465842 - SURFACE
      ?auto_1465844 - SURFACE
      ?auto_1465843 - SURFACE
      ?auto_1465845 - SURFACE
      ?auto_1465846 - SURFACE
      ?auto_1465847 - SURFACE
      ?auto_1465848 - SURFACE
      ?auto_1465849 - SURFACE
      ?auto_1465850 - SURFACE
    )
    :vars
    (
      ?auto_1465851 - HOIST
      ?auto_1465854 - PLACE
      ?auto_1465852 - TRUCK
      ?auto_1465853 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1465851 ?auto_1465854 ) ( SURFACE-AT ?auto_1465849 ?auto_1465854 ) ( CLEAR ?auto_1465849 ) ( IS-CRATE ?auto_1465850 ) ( not ( = ?auto_1465849 ?auto_1465850 ) ) ( AVAILABLE ?auto_1465851 ) ( IN ?auto_1465850 ?auto_1465852 ) ( ON ?auto_1465849 ?auto_1465848 ) ( not ( = ?auto_1465848 ?auto_1465849 ) ) ( not ( = ?auto_1465848 ?auto_1465850 ) ) ( TRUCK-AT ?auto_1465852 ?auto_1465853 ) ( not ( = ?auto_1465853 ?auto_1465854 ) ) ( ON ?auto_1465840 ?auto_1465839 ) ( ON ?auto_1465841 ?auto_1465840 ) ( ON ?auto_1465838 ?auto_1465841 ) ( ON ?auto_1465842 ?auto_1465838 ) ( ON ?auto_1465844 ?auto_1465842 ) ( ON ?auto_1465843 ?auto_1465844 ) ( ON ?auto_1465845 ?auto_1465843 ) ( ON ?auto_1465846 ?auto_1465845 ) ( ON ?auto_1465847 ?auto_1465846 ) ( ON ?auto_1465848 ?auto_1465847 ) ( not ( = ?auto_1465839 ?auto_1465840 ) ) ( not ( = ?auto_1465839 ?auto_1465841 ) ) ( not ( = ?auto_1465839 ?auto_1465838 ) ) ( not ( = ?auto_1465839 ?auto_1465842 ) ) ( not ( = ?auto_1465839 ?auto_1465844 ) ) ( not ( = ?auto_1465839 ?auto_1465843 ) ) ( not ( = ?auto_1465839 ?auto_1465845 ) ) ( not ( = ?auto_1465839 ?auto_1465846 ) ) ( not ( = ?auto_1465839 ?auto_1465847 ) ) ( not ( = ?auto_1465839 ?auto_1465848 ) ) ( not ( = ?auto_1465839 ?auto_1465849 ) ) ( not ( = ?auto_1465839 ?auto_1465850 ) ) ( not ( = ?auto_1465840 ?auto_1465841 ) ) ( not ( = ?auto_1465840 ?auto_1465838 ) ) ( not ( = ?auto_1465840 ?auto_1465842 ) ) ( not ( = ?auto_1465840 ?auto_1465844 ) ) ( not ( = ?auto_1465840 ?auto_1465843 ) ) ( not ( = ?auto_1465840 ?auto_1465845 ) ) ( not ( = ?auto_1465840 ?auto_1465846 ) ) ( not ( = ?auto_1465840 ?auto_1465847 ) ) ( not ( = ?auto_1465840 ?auto_1465848 ) ) ( not ( = ?auto_1465840 ?auto_1465849 ) ) ( not ( = ?auto_1465840 ?auto_1465850 ) ) ( not ( = ?auto_1465841 ?auto_1465838 ) ) ( not ( = ?auto_1465841 ?auto_1465842 ) ) ( not ( = ?auto_1465841 ?auto_1465844 ) ) ( not ( = ?auto_1465841 ?auto_1465843 ) ) ( not ( = ?auto_1465841 ?auto_1465845 ) ) ( not ( = ?auto_1465841 ?auto_1465846 ) ) ( not ( = ?auto_1465841 ?auto_1465847 ) ) ( not ( = ?auto_1465841 ?auto_1465848 ) ) ( not ( = ?auto_1465841 ?auto_1465849 ) ) ( not ( = ?auto_1465841 ?auto_1465850 ) ) ( not ( = ?auto_1465838 ?auto_1465842 ) ) ( not ( = ?auto_1465838 ?auto_1465844 ) ) ( not ( = ?auto_1465838 ?auto_1465843 ) ) ( not ( = ?auto_1465838 ?auto_1465845 ) ) ( not ( = ?auto_1465838 ?auto_1465846 ) ) ( not ( = ?auto_1465838 ?auto_1465847 ) ) ( not ( = ?auto_1465838 ?auto_1465848 ) ) ( not ( = ?auto_1465838 ?auto_1465849 ) ) ( not ( = ?auto_1465838 ?auto_1465850 ) ) ( not ( = ?auto_1465842 ?auto_1465844 ) ) ( not ( = ?auto_1465842 ?auto_1465843 ) ) ( not ( = ?auto_1465842 ?auto_1465845 ) ) ( not ( = ?auto_1465842 ?auto_1465846 ) ) ( not ( = ?auto_1465842 ?auto_1465847 ) ) ( not ( = ?auto_1465842 ?auto_1465848 ) ) ( not ( = ?auto_1465842 ?auto_1465849 ) ) ( not ( = ?auto_1465842 ?auto_1465850 ) ) ( not ( = ?auto_1465844 ?auto_1465843 ) ) ( not ( = ?auto_1465844 ?auto_1465845 ) ) ( not ( = ?auto_1465844 ?auto_1465846 ) ) ( not ( = ?auto_1465844 ?auto_1465847 ) ) ( not ( = ?auto_1465844 ?auto_1465848 ) ) ( not ( = ?auto_1465844 ?auto_1465849 ) ) ( not ( = ?auto_1465844 ?auto_1465850 ) ) ( not ( = ?auto_1465843 ?auto_1465845 ) ) ( not ( = ?auto_1465843 ?auto_1465846 ) ) ( not ( = ?auto_1465843 ?auto_1465847 ) ) ( not ( = ?auto_1465843 ?auto_1465848 ) ) ( not ( = ?auto_1465843 ?auto_1465849 ) ) ( not ( = ?auto_1465843 ?auto_1465850 ) ) ( not ( = ?auto_1465845 ?auto_1465846 ) ) ( not ( = ?auto_1465845 ?auto_1465847 ) ) ( not ( = ?auto_1465845 ?auto_1465848 ) ) ( not ( = ?auto_1465845 ?auto_1465849 ) ) ( not ( = ?auto_1465845 ?auto_1465850 ) ) ( not ( = ?auto_1465846 ?auto_1465847 ) ) ( not ( = ?auto_1465846 ?auto_1465848 ) ) ( not ( = ?auto_1465846 ?auto_1465849 ) ) ( not ( = ?auto_1465846 ?auto_1465850 ) ) ( not ( = ?auto_1465847 ?auto_1465848 ) ) ( not ( = ?auto_1465847 ?auto_1465849 ) ) ( not ( = ?auto_1465847 ?auto_1465850 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1465848 ?auto_1465849 ?auto_1465850 )
      ( MAKE-12CRATE-VERIFY ?auto_1465839 ?auto_1465840 ?auto_1465841 ?auto_1465838 ?auto_1465842 ?auto_1465844 ?auto_1465843 ?auto_1465845 ?auto_1465846 ?auto_1465847 ?auto_1465848 ?auto_1465849 ?auto_1465850 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1465989 - SURFACE
      ?auto_1465990 - SURFACE
      ?auto_1465991 - SURFACE
      ?auto_1465988 - SURFACE
      ?auto_1465992 - SURFACE
      ?auto_1465994 - SURFACE
      ?auto_1465993 - SURFACE
      ?auto_1465995 - SURFACE
      ?auto_1465996 - SURFACE
      ?auto_1465997 - SURFACE
      ?auto_1465998 - SURFACE
      ?auto_1465999 - SURFACE
      ?auto_1466000 - SURFACE
    )
    :vars
    (
      ?auto_1466004 - HOIST
      ?auto_1466003 - PLACE
      ?auto_1466002 - TRUCK
      ?auto_1466005 - PLACE
      ?auto_1466001 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1466004 ?auto_1466003 ) ( SURFACE-AT ?auto_1465999 ?auto_1466003 ) ( CLEAR ?auto_1465999 ) ( IS-CRATE ?auto_1466000 ) ( not ( = ?auto_1465999 ?auto_1466000 ) ) ( AVAILABLE ?auto_1466004 ) ( ON ?auto_1465999 ?auto_1465998 ) ( not ( = ?auto_1465998 ?auto_1465999 ) ) ( not ( = ?auto_1465998 ?auto_1466000 ) ) ( TRUCK-AT ?auto_1466002 ?auto_1466005 ) ( not ( = ?auto_1466005 ?auto_1466003 ) ) ( HOIST-AT ?auto_1466001 ?auto_1466005 ) ( LIFTING ?auto_1466001 ?auto_1466000 ) ( not ( = ?auto_1466004 ?auto_1466001 ) ) ( ON ?auto_1465990 ?auto_1465989 ) ( ON ?auto_1465991 ?auto_1465990 ) ( ON ?auto_1465988 ?auto_1465991 ) ( ON ?auto_1465992 ?auto_1465988 ) ( ON ?auto_1465994 ?auto_1465992 ) ( ON ?auto_1465993 ?auto_1465994 ) ( ON ?auto_1465995 ?auto_1465993 ) ( ON ?auto_1465996 ?auto_1465995 ) ( ON ?auto_1465997 ?auto_1465996 ) ( ON ?auto_1465998 ?auto_1465997 ) ( not ( = ?auto_1465989 ?auto_1465990 ) ) ( not ( = ?auto_1465989 ?auto_1465991 ) ) ( not ( = ?auto_1465989 ?auto_1465988 ) ) ( not ( = ?auto_1465989 ?auto_1465992 ) ) ( not ( = ?auto_1465989 ?auto_1465994 ) ) ( not ( = ?auto_1465989 ?auto_1465993 ) ) ( not ( = ?auto_1465989 ?auto_1465995 ) ) ( not ( = ?auto_1465989 ?auto_1465996 ) ) ( not ( = ?auto_1465989 ?auto_1465997 ) ) ( not ( = ?auto_1465989 ?auto_1465998 ) ) ( not ( = ?auto_1465989 ?auto_1465999 ) ) ( not ( = ?auto_1465989 ?auto_1466000 ) ) ( not ( = ?auto_1465990 ?auto_1465991 ) ) ( not ( = ?auto_1465990 ?auto_1465988 ) ) ( not ( = ?auto_1465990 ?auto_1465992 ) ) ( not ( = ?auto_1465990 ?auto_1465994 ) ) ( not ( = ?auto_1465990 ?auto_1465993 ) ) ( not ( = ?auto_1465990 ?auto_1465995 ) ) ( not ( = ?auto_1465990 ?auto_1465996 ) ) ( not ( = ?auto_1465990 ?auto_1465997 ) ) ( not ( = ?auto_1465990 ?auto_1465998 ) ) ( not ( = ?auto_1465990 ?auto_1465999 ) ) ( not ( = ?auto_1465990 ?auto_1466000 ) ) ( not ( = ?auto_1465991 ?auto_1465988 ) ) ( not ( = ?auto_1465991 ?auto_1465992 ) ) ( not ( = ?auto_1465991 ?auto_1465994 ) ) ( not ( = ?auto_1465991 ?auto_1465993 ) ) ( not ( = ?auto_1465991 ?auto_1465995 ) ) ( not ( = ?auto_1465991 ?auto_1465996 ) ) ( not ( = ?auto_1465991 ?auto_1465997 ) ) ( not ( = ?auto_1465991 ?auto_1465998 ) ) ( not ( = ?auto_1465991 ?auto_1465999 ) ) ( not ( = ?auto_1465991 ?auto_1466000 ) ) ( not ( = ?auto_1465988 ?auto_1465992 ) ) ( not ( = ?auto_1465988 ?auto_1465994 ) ) ( not ( = ?auto_1465988 ?auto_1465993 ) ) ( not ( = ?auto_1465988 ?auto_1465995 ) ) ( not ( = ?auto_1465988 ?auto_1465996 ) ) ( not ( = ?auto_1465988 ?auto_1465997 ) ) ( not ( = ?auto_1465988 ?auto_1465998 ) ) ( not ( = ?auto_1465988 ?auto_1465999 ) ) ( not ( = ?auto_1465988 ?auto_1466000 ) ) ( not ( = ?auto_1465992 ?auto_1465994 ) ) ( not ( = ?auto_1465992 ?auto_1465993 ) ) ( not ( = ?auto_1465992 ?auto_1465995 ) ) ( not ( = ?auto_1465992 ?auto_1465996 ) ) ( not ( = ?auto_1465992 ?auto_1465997 ) ) ( not ( = ?auto_1465992 ?auto_1465998 ) ) ( not ( = ?auto_1465992 ?auto_1465999 ) ) ( not ( = ?auto_1465992 ?auto_1466000 ) ) ( not ( = ?auto_1465994 ?auto_1465993 ) ) ( not ( = ?auto_1465994 ?auto_1465995 ) ) ( not ( = ?auto_1465994 ?auto_1465996 ) ) ( not ( = ?auto_1465994 ?auto_1465997 ) ) ( not ( = ?auto_1465994 ?auto_1465998 ) ) ( not ( = ?auto_1465994 ?auto_1465999 ) ) ( not ( = ?auto_1465994 ?auto_1466000 ) ) ( not ( = ?auto_1465993 ?auto_1465995 ) ) ( not ( = ?auto_1465993 ?auto_1465996 ) ) ( not ( = ?auto_1465993 ?auto_1465997 ) ) ( not ( = ?auto_1465993 ?auto_1465998 ) ) ( not ( = ?auto_1465993 ?auto_1465999 ) ) ( not ( = ?auto_1465993 ?auto_1466000 ) ) ( not ( = ?auto_1465995 ?auto_1465996 ) ) ( not ( = ?auto_1465995 ?auto_1465997 ) ) ( not ( = ?auto_1465995 ?auto_1465998 ) ) ( not ( = ?auto_1465995 ?auto_1465999 ) ) ( not ( = ?auto_1465995 ?auto_1466000 ) ) ( not ( = ?auto_1465996 ?auto_1465997 ) ) ( not ( = ?auto_1465996 ?auto_1465998 ) ) ( not ( = ?auto_1465996 ?auto_1465999 ) ) ( not ( = ?auto_1465996 ?auto_1466000 ) ) ( not ( = ?auto_1465997 ?auto_1465998 ) ) ( not ( = ?auto_1465997 ?auto_1465999 ) ) ( not ( = ?auto_1465997 ?auto_1466000 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1465998 ?auto_1465999 ?auto_1466000 )
      ( MAKE-12CRATE-VERIFY ?auto_1465989 ?auto_1465990 ?auto_1465991 ?auto_1465988 ?auto_1465992 ?auto_1465994 ?auto_1465993 ?auto_1465995 ?auto_1465996 ?auto_1465997 ?auto_1465998 ?auto_1465999 ?auto_1466000 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1466151 - SURFACE
      ?auto_1466152 - SURFACE
      ?auto_1466153 - SURFACE
      ?auto_1466150 - SURFACE
      ?auto_1466154 - SURFACE
      ?auto_1466156 - SURFACE
      ?auto_1466155 - SURFACE
      ?auto_1466157 - SURFACE
      ?auto_1466158 - SURFACE
      ?auto_1466159 - SURFACE
      ?auto_1466160 - SURFACE
      ?auto_1466161 - SURFACE
      ?auto_1466162 - SURFACE
    )
    :vars
    (
      ?auto_1466167 - HOIST
      ?auto_1466166 - PLACE
      ?auto_1466168 - TRUCK
      ?auto_1466165 - PLACE
      ?auto_1466163 - HOIST
      ?auto_1466164 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1466167 ?auto_1466166 ) ( SURFACE-AT ?auto_1466161 ?auto_1466166 ) ( CLEAR ?auto_1466161 ) ( IS-CRATE ?auto_1466162 ) ( not ( = ?auto_1466161 ?auto_1466162 ) ) ( AVAILABLE ?auto_1466167 ) ( ON ?auto_1466161 ?auto_1466160 ) ( not ( = ?auto_1466160 ?auto_1466161 ) ) ( not ( = ?auto_1466160 ?auto_1466162 ) ) ( TRUCK-AT ?auto_1466168 ?auto_1466165 ) ( not ( = ?auto_1466165 ?auto_1466166 ) ) ( HOIST-AT ?auto_1466163 ?auto_1466165 ) ( not ( = ?auto_1466167 ?auto_1466163 ) ) ( AVAILABLE ?auto_1466163 ) ( SURFACE-AT ?auto_1466162 ?auto_1466165 ) ( ON ?auto_1466162 ?auto_1466164 ) ( CLEAR ?auto_1466162 ) ( not ( = ?auto_1466161 ?auto_1466164 ) ) ( not ( = ?auto_1466162 ?auto_1466164 ) ) ( not ( = ?auto_1466160 ?auto_1466164 ) ) ( ON ?auto_1466152 ?auto_1466151 ) ( ON ?auto_1466153 ?auto_1466152 ) ( ON ?auto_1466150 ?auto_1466153 ) ( ON ?auto_1466154 ?auto_1466150 ) ( ON ?auto_1466156 ?auto_1466154 ) ( ON ?auto_1466155 ?auto_1466156 ) ( ON ?auto_1466157 ?auto_1466155 ) ( ON ?auto_1466158 ?auto_1466157 ) ( ON ?auto_1466159 ?auto_1466158 ) ( ON ?auto_1466160 ?auto_1466159 ) ( not ( = ?auto_1466151 ?auto_1466152 ) ) ( not ( = ?auto_1466151 ?auto_1466153 ) ) ( not ( = ?auto_1466151 ?auto_1466150 ) ) ( not ( = ?auto_1466151 ?auto_1466154 ) ) ( not ( = ?auto_1466151 ?auto_1466156 ) ) ( not ( = ?auto_1466151 ?auto_1466155 ) ) ( not ( = ?auto_1466151 ?auto_1466157 ) ) ( not ( = ?auto_1466151 ?auto_1466158 ) ) ( not ( = ?auto_1466151 ?auto_1466159 ) ) ( not ( = ?auto_1466151 ?auto_1466160 ) ) ( not ( = ?auto_1466151 ?auto_1466161 ) ) ( not ( = ?auto_1466151 ?auto_1466162 ) ) ( not ( = ?auto_1466151 ?auto_1466164 ) ) ( not ( = ?auto_1466152 ?auto_1466153 ) ) ( not ( = ?auto_1466152 ?auto_1466150 ) ) ( not ( = ?auto_1466152 ?auto_1466154 ) ) ( not ( = ?auto_1466152 ?auto_1466156 ) ) ( not ( = ?auto_1466152 ?auto_1466155 ) ) ( not ( = ?auto_1466152 ?auto_1466157 ) ) ( not ( = ?auto_1466152 ?auto_1466158 ) ) ( not ( = ?auto_1466152 ?auto_1466159 ) ) ( not ( = ?auto_1466152 ?auto_1466160 ) ) ( not ( = ?auto_1466152 ?auto_1466161 ) ) ( not ( = ?auto_1466152 ?auto_1466162 ) ) ( not ( = ?auto_1466152 ?auto_1466164 ) ) ( not ( = ?auto_1466153 ?auto_1466150 ) ) ( not ( = ?auto_1466153 ?auto_1466154 ) ) ( not ( = ?auto_1466153 ?auto_1466156 ) ) ( not ( = ?auto_1466153 ?auto_1466155 ) ) ( not ( = ?auto_1466153 ?auto_1466157 ) ) ( not ( = ?auto_1466153 ?auto_1466158 ) ) ( not ( = ?auto_1466153 ?auto_1466159 ) ) ( not ( = ?auto_1466153 ?auto_1466160 ) ) ( not ( = ?auto_1466153 ?auto_1466161 ) ) ( not ( = ?auto_1466153 ?auto_1466162 ) ) ( not ( = ?auto_1466153 ?auto_1466164 ) ) ( not ( = ?auto_1466150 ?auto_1466154 ) ) ( not ( = ?auto_1466150 ?auto_1466156 ) ) ( not ( = ?auto_1466150 ?auto_1466155 ) ) ( not ( = ?auto_1466150 ?auto_1466157 ) ) ( not ( = ?auto_1466150 ?auto_1466158 ) ) ( not ( = ?auto_1466150 ?auto_1466159 ) ) ( not ( = ?auto_1466150 ?auto_1466160 ) ) ( not ( = ?auto_1466150 ?auto_1466161 ) ) ( not ( = ?auto_1466150 ?auto_1466162 ) ) ( not ( = ?auto_1466150 ?auto_1466164 ) ) ( not ( = ?auto_1466154 ?auto_1466156 ) ) ( not ( = ?auto_1466154 ?auto_1466155 ) ) ( not ( = ?auto_1466154 ?auto_1466157 ) ) ( not ( = ?auto_1466154 ?auto_1466158 ) ) ( not ( = ?auto_1466154 ?auto_1466159 ) ) ( not ( = ?auto_1466154 ?auto_1466160 ) ) ( not ( = ?auto_1466154 ?auto_1466161 ) ) ( not ( = ?auto_1466154 ?auto_1466162 ) ) ( not ( = ?auto_1466154 ?auto_1466164 ) ) ( not ( = ?auto_1466156 ?auto_1466155 ) ) ( not ( = ?auto_1466156 ?auto_1466157 ) ) ( not ( = ?auto_1466156 ?auto_1466158 ) ) ( not ( = ?auto_1466156 ?auto_1466159 ) ) ( not ( = ?auto_1466156 ?auto_1466160 ) ) ( not ( = ?auto_1466156 ?auto_1466161 ) ) ( not ( = ?auto_1466156 ?auto_1466162 ) ) ( not ( = ?auto_1466156 ?auto_1466164 ) ) ( not ( = ?auto_1466155 ?auto_1466157 ) ) ( not ( = ?auto_1466155 ?auto_1466158 ) ) ( not ( = ?auto_1466155 ?auto_1466159 ) ) ( not ( = ?auto_1466155 ?auto_1466160 ) ) ( not ( = ?auto_1466155 ?auto_1466161 ) ) ( not ( = ?auto_1466155 ?auto_1466162 ) ) ( not ( = ?auto_1466155 ?auto_1466164 ) ) ( not ( = ?auto_1466157 ?auto_1466158 ) ) ( not ( = ?auto_1466157 ?auto_1466159 ) ) ( not ( = ?auto_1466157 ?auto_1466160 ) ) ( not ( = ?auto_1466157 ?auto_1466161 ) ) ( not ( = ?auto_1466157 ?auto_1466162 ) ) ( not ( = ?auto_1466157 ?auto_1466164 ) ) ( not ( = ?auto_1466158 ?auto_1466159 ) ) ( not ( = ?auto_1466158 ?auto_1466160 ) ) ( not ( = ?auto_1466158 ?auto_1466161 ) ) ( not ( = ?auto_1466158 ?auto_1466162 ) ) ( not ( = ?auto_1466158 ?auto_1466164 ) ) ( not ( = ?auto_1466159 ?auto_1466160 ) ) ( not ( = ?auto_1466159 ?auto_1466161 ) ) ( not ( = ?auto_1466159 ?auto_1466162 ) ) ( not ( = ?auto_1466159 ?auto_1466164 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1466160 ?auto_1466161 ?auto_1466162 )
      ( MAKE-12CRATE-VERIFY ?auto_1466151 ?auto_1466152 ?auto_1466153 ?auto_1466150 ?auto_1466154 ?auto_1466156 ?auto_1466155 ?auto_1466157 ?auto_1466158 ?auto_1466159 ?auto_1466160 ?auto_1466161 ?auto_1466162 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1466314 - SURFACE
      ?auto_1466315 - SURFACE
      ?auto_1466316 - SURFACE
      ?auto_1466313 - SURFACE
      ?auto_1466317 - SURFACE
      ?auto_1466319 - SURFACE
      ?auto_1466318 - SURFACE
      ?auto_1466320 - SURFACE
      ?auto_1466321 - SURFACE
      ?auto_1466322 - SURFACE
      ?auto_1466323 - SURFACE
      ?auto_1466324 - SURFACE
      ?auto_1466325 - SURFACE
    )
    :vars
    (
      ?auto_1466331 - HOIST
      ?auto_1466330 - PLACE
      ?auto_1466329 - PLACE
      ?auto_1466327 - HOIST
      ?auto_1466328 - SURFACE
      ?auto_1466326 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1466331 ?auto_1466330 ) ( SURFACE-AT ?auto_1466324 ?auto_1466330 ) ( CLEAR ?auto_1466324 ) ( IS-CRATE ?auto_1466325 ) ( not ( = ?auto_1466324 ?auto_1466325 ) ) ( AVAILABLE ?auto_1466331 ) ( ON ?auto_1466324 ?auto_1466323 ) ( not ( = ?auto_1466323 ?auto_1466324 ) ) ( not ( = ?auto_1466323 ?auto_1466325 ) ) ( not ( = ?auto_1466329 ?auto_1466330 ) ) ( HOIST-AT ?auto_1466327 ?auto_1466329 ) ( not ( = ?auto_1466331 ?auto_1466327 ) ) ( AVAILABLE ?auto_1466327 ) ( SURFACE-AT ?auto_1466325 ?auto_1466329 ) ( ON ?auto_1466325 ?auto_1466328 ) ( CLEAR ?auto_1466325 ) ( not ( = ?auto_1466324 ?auto_1466328 ) ) ( not ( = ?auto_1466325 ?auto_1466328 ) ) ( not ( = ?auto_1466323 ?auto_1466328 ) ) ( TRUCK-AT ?auto_1466326 ?auto_1466330 ) ( ON ?auto_1466315 ?auto_1466314 ) ( ON ?auto_1466316 ?auto_1466315 ) ( ON ?auto_1466313 ?auto_1466316 ) ( ON ?auto_1466317 ?auto_1466313 ) ( ON ?auto_1466319 ?auto_1466317 ) ( ON ?auto_1466318 ?auto_1466319 ) ( ON ?auto_1466320 ?auto_1466318 ) ( ON ?auto_1466321 ?auto_1466320 ) ( ON ?auto_1466322 ?auto_1466321 ) ( ON ?auto_1466323 ?auto_1466322 ) ( not ( = ?auto_1466314 ?auto_1466315 ) ) ( not ( = ?auto_1466314 ?auto_1466316 ) ) ( not ( = ?auto_1466314 ?auto_1466313 ) ) ( not ( = ?auto_1466314 ?auto_1466317 ) ) ( not ( = ?auto_1466314 ?auto_1466319 ) ) ( not ( = ?auto_1466314 ?auto_1466318 ) ) ( not ( = ?auto_1466314 ?auto_1466320 ) ) ( not ( = ?auto_1466314 ?auto_1466321 ) ) ( not ( = ?auto_1466314 ?auto_1466322 ) ) ( not ( = ?auto_1466314 ?auto_1466323 ) ) ( not ( = ?auto_1466314 ?auto_1466324 ) ) ( not ( = ?auto_1466314 ?auto_1466325 ) ) ( not ( = ?auto_1466314 ?auto_1466328 ) ) ( not ( = ?auto_1466315 ?auto_1466316 ) ) ( not ( = ?auto_1466315 ?auto_1466313 ) ) ( not ( = ?auto_1466315 ?auto_1466317 ) ) ( not ( = ?auto_1466315 ?auto_1466319 ) ) ( not ( = ?auto_1466315 ?auto_1466318 ) ) ( not ( = ?auto_1466315 ?auto_1466320 ) ) ( not ( = ?auto_1466315 ?auto_1466321 ) ) ( not ( = ?auto_1466315 ?auto_1466322 ) ) ( not ( = ?auto_1466315 ?auto_1466323 ) ) ( not ( = ?auto_1466315 ?auto_1466324 ) ) ( not ( = ?auto_1466315 ?auto_1466325 ) ) ( not ( = ?auto_1466315 ?auto_1466328 ) ) ( not ( = ?auto_1466316 ?auto_1466313 ) ) ( not ( = ?auto_1466316 ?auto_1466317 ) ) ( not ( = ?auto_1466316 ?auto_1466319 ) ) ( not ( = ?auto_1466316 ?auto_1466318 ) ) ( not ( = ?auto_1466316 ?auto_1466320 ) ) ( not ( = ?auto_1466316 ?auto_1466321 ) ) ( not ( = ?auto_1466316 ?auto_1466322 ) ) ( not ( = ?auto_1466316 ?auto_1466323 ) ) ( not ( = ?auto_1466316 ?auto_1466324 ) ) ( not ( = ?auto_1466316 ?auto_1466325 ) ) ( not ( = ?auto_1466316 ?auto_1466328 ) ) ( not ( = ?auto_1466313 ?auto_1466317 ) ) ( not ( = ?auto_1466313 ?auto_1466319 ) ) ( not ( = ?auto_1466313 ?auto_1466318 ) ) ( not ( = ?auto_1466313 ?auto_1466320 ) ) ( not ( = ?auto_1466313 ?auto_1466321 ) ) ( not ( = ?auto_1466313 ?auto_1466322 ) ) ( not ( = ?auto_1466313 ?auto_1466323 ) ) ( not ( = ?auto_1466313 ?auto_1466324 ) ) ( not ( = ?auto_1466313 ?auto_1466325 ) ) ( not ( = ?auto_1466313 ?auto_1466328 ) ) ( not ( = ?auto_1466317 ?auto_1466319 ) ) ( not ( = ?auto_1466317 ?auto_1466318 ) ) ( not ( = ?auto_1466317 ?auto_1466320 ) ) ( not ( = ?auto_1466317 ?auto_1466321 ) ) ( not ( = ?auto_1466317 ?auto_1466322 ) ) ( not ( = ?auto_1466317 ?auto_1466323 ) ) ( not ( = ?auto_1466317 ?auto_1466324 ) ) ( not ( = ?auto_1466317 ?auto_1466325 ) ) ( not ( = ?auto_1466317 ?auto_1466328 ) ) ( not ( = ?auto_1466319 ?auto_1466318 ) ) ( not ( = ?auto_1466319 ?auto_1466320 ) ) ( not ( = ?auto_1466319 ?auto_1466321 ) ) ( not ( = ?auto_1466319 ?auto_1466322 ) ) ( not ( = ?auto_1466319 ?auto_1466323 ) ) ( not ( = ?auto_1466319 ?auto_1466324 ) ) ( not ( = ?auto_1466319 ?auto_1466325 ) ) ( not ( = ?auto_1466319 ?auto_1466328 ) ) ( not ( = ?auto_1466318 ?auto_1466320 ) ) ( not ( = ?auto_1466318 ?auto_1466321 ) ) ( not ( = ?auto_1466318 ?auto_1466322 ) ) ( not ( = ?auto_1466318 ?auto_1466323 ) ) ( not ( = ?auto_1466318 ?auto_1466324 ) ) ( not ( = ?auto_1466318 ?auto_1466325 ) ) ( not ( = ?auto_1466318 ?auto_1466328 ) ) ( not ( = ?auto_1466320 ?auto_1466321 ) ) ( not ( = ?auto_1466320 ?auto_1466322 ) ) ( not ( = ?auto_1466320 ?auto_1466323 ) ) ( not ( = ?auto_1466320 ?auto_1466324 ) ) ( not ( = ?auto_1466320 ?auto_1466325 ) ) ( not ( = ?auto_1466320 ?auto_1466328 ) ) ( not ( = ?auto_1466321 ?auto_1466322 ) ) ( not ( = ?auto_1466321 ?auto_1466323 ) ) ( not ( = ?auto_1466321 ?auto_1466324 ) ) ( not ( = ?auto_1466321 ?auto_1466325 ) ) ( not ( = ?auto_1466321 ?auto_1466328 ) ) ( not ( = ?auto_1466322 ?auto_1466323 ) ) ( not ( = ?auto_1466322 ?auto_1466324 ) ) ( not ( = ?auto_1466322 ?auto_1466325 ) ) ( not ( = ?auto_1466322 ?auto_1466328 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1466323 ?auto_1466324 ?auto_1466325 )
      ( MAKE-12CRATE-VERIFY ?auto_1466314 ?auto_1466315 ?auto_1466316 ?auto_1466313 ?auto_1466317 ?auto_1466319 ?auto_1466318 ?auto_1466320 ?auto_1466321 ?auto_1466322 ?auto_1466323 ?auto_1466324 ?auto_1466325 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1466477 - SURFACE
      ?auto_1466478 - SURFACE
      ?auto_1466479 - SURFACE
      ?auto_1466476 - SURFACE
      ?auto_1466480 - SURFACE
      ?auto_1466482 - SURFACE
      ?auto_1466481 - SURFACE
      ?auto_1466483 - SURFACE
      ?auto_1466484 - SURFACE
      ?auto_1466485 - SURFACE
      ?auto_1466486 - SURFACE
      ?auto_1466487 - SURFACE
      ?auto_1466488 - SURFACE
    )
    :vars
    (
      ?auto_1466493 - HOIST
      ?auto_1466489 - PLACE
      ?auto_1466491 - PLACE
      ?auto_1466494 - HOIST
      ?auto_1466492 - SURFACE
      ?auto_1466490 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1466493 ?auto_1466489 ) ( IS-CRATE ?auto_1466488 ) ( not ( = ?auto_1466487 ?auto_1466488 ) ) ( not ( = ?auto_1466486 ?auto_1466487 ) ) ( not ( = ?auto_1466486 ?auto_1466488 ) ) ( not ( = ?auto_1466491 ?auto_1466489 ) ) ( HOIST-AT ?auto_1466494 ?auto_1466491 ) ( not ( = ?auto_1466493 ?auto_1466494 ) ) ( AVAILABLE ?auto_1466494 ) ( SURFACE-AT ?auto_1466488 ?auto_1466491 ) ( ON ?auto_1466488 ?auto_1466492 ) ( CLEAR ?auto_1466488 ) ( not ( = ?auto_1466487 ?auto_1466492 ) ) ( not ( = ?auto_1466488 ?auto_1466492 ) ) ( not ( = ?auto_1466486 ?auto_1466492 ) ) ( TRUCK-AT ?auto_1466490 ?auto_1466489 ) ( SURFACE-AT ?auto_1466486 ?auto_1466489 ) ( CLEAR ?auto_1466486 ) ( LIFTING ?auto_1466493 ?auto_1466487 ) ( IS-CRATE ?auto_1466487 ) ( ON ?auto_1466478 ?auto_1466477 ) ( ON ?auto_1466479 ?auto_1466478 ) ( ON ?auto_1466476 ?auto_1466479 ) ( ON ?auto_1466480 ?auto_1466476 ) ( ON ?auto_1466482 ?auto_1466480 ) ( ON ?auto_1466481 ?auto_1466482 ) ( ON ?auto_1466483 ?auto_1466481 ) ( ON ?auto_1466484 ?auto_1466483 ) ( ON ?auto_1466485 ?auto_1466484 ) ( ON ?auto_1466486 ?auto_1466485 ) ( not ( = ?auto_1466477 ?auto_1466478 ) ) ( not ( = ?auto_1466477 ?auto_1466479 ) ) ( not ( = ?auto_1466477 ?auto_1466476 ) ) ( not ( = ?auto_1466477 ?auto_1466480 ) ) ( not ( = ?auto_1466477 ?auto_1466482 ) ) ( not ( = ?auto_1466477 ?auto_1466481 ) ) ( not ( = ?auto_1466477 ?auto_1466483 ) ) ( not ( = ?auto_1466477 ?auto_1466484 ) ) ( not ( = ?auto_1466477 ?auto_1466485 ) ) ( not ( = ?auto_1466477 ?auto_1466486 ) ) ( not ( = ?auto_1466477 ?auto_1466487 ) ) ( not ( = ?auto_1466477 ?auto_1466488 ) ) ( not ( = ?auto_1466477 ?auto_1466492 ) ) ( not ( = ?auto_1466478 ?auto_1466479 ) ) ( not ( = ?auto_1466478 ?auto_1466476 ) ) ( not ( = ?auto_1466478 ?auto_1466480 ) ) ( not ( = ?auto_1466478 ?auto_1466482 ) ) ( not ( = ?auto_1466478 ?auto_1466481 ) ) ( not ( = ?auto_1466478 ?auto_1466483 ) ) ( not ( = ?auto_1466478 ?auto_1466484 ) ) ( not ( = ?auto_1466478 ?auto_1466485 ) ) ( not ( = ?auto_1466478 ?auto_1466486 ) ) ( not ( = ?auto_1466478 ?auto_1466487 ) ) ( not ( = ?auto_1466478 ?auto_1466488 ) ) ( not ( = ?auto_1466478 ?auto_1466492 ) ) ( not ( = ?auto_1466479 ?auto_1466476 ) ) ( not ( = ?auto_1466479 ?auto_1466480 ) ) ( not ( = ?auto_1466479 ?auto_1466482 ) ) ( not ( = ?auto_1466479 ?auto_1466481 ) ) ( not ( = ?auto_1466479 ?auto_1466483 ) ) ( not ( = ?auto_1466479 ?auto_1466484 ) ) ( not ( = ?auto_1466479 ?auto_1466485 ) ) ( not ( = ?auto_1466479 ?auto_1466486 ) ) ( not ( = ?auto_1466479 ?auto_1466487 ) ) ( not ( = ?auto_1466479 ?auto_1466488 ) ) ( not ( = ?auto_1466479 ?auto_1466492 ) ) ( not ( = ?auto_1466476 ?auto_1466480 ) ) ( not ( = ?auto_1466476 ?auto_1466482 ) ) ( not ( = ?auto_1466476 ?auto_1466481 ) ) ( not ( = ?auto_1466476 ?auto_1466483 ) ) ( not ( = ?auto_1466476 ?auto_1466484 ) ) ( not ( = ?auto_1466476 ?auto_1466485 ) ) ( not ( = ?auto_1466476 ?auto_1466486 ) ) ( not ( = ?auto_1466476 ?auto_1466487 ) ) ( not ( = ?auto_1466476 ?auto_1466488 ) ) ( not ( = ?auto_1466476 ?auto_1466492 ) ) ( not ( = ?auto_1466480 ?auto_1466482 ) ) ( not ( = ?auto_1466480 ?auto_1466481 ) ) ( not ( = ?auto_1466480 ?auto_1466483 ) ) ( not ( = ?auto_1466480 ?auto_1466484 ) ) ( not ( = ?auto_1466480 ?auto_1466485 ) ) ( not ( = ?auto_1466480 ?auto_1466486 ) ) ( not ( = ?auto_1466480 ?auto_1466487 ) ) ( not ( = ?auto_1466480 ?auto_1466488 ) ) ( not ( = ?auto_1466480 ?auto_1466492 ) ) ( not ( = ?auto_1466482 ?auto_1466481 ) ) ( not ( = ?auto_1466482 ?auto_1466483 ) ) ( not ( = ?auto_1466482 ?auto_1466484 ) ) ( not ( = ?auto_1466482 ?auto_1466485 ) ) ( not ( = ?auto_1466482 ?auto_1466486 ) ) ( not ( = ?auto_1466482 ?auto_1466487 ) ) ( not ( = ?auto_1466482 ?auto_1466488 ) ) ( not ( = ?auto_1466482 ?auto_1466492 ) ) ( not ( = ?auto_1466481 ?auto_1466483 ) ) ( not ( = ?auto_1466481 ?auto_1466484 ) ) ( not ( = ?auto_1466481 ?auto_1466485 ) ) ( not ( = ?auto_1466481 ?auto_1466486 ) ) ( not ( = ?auto_1466481 ?auto_1466487 ) ) ( not ( = ?auto_1466481 ?auto_1466488 ) ) ( not ( = ?auto_1466481 ?auto_1466492 ) ) ( not ( = ?auto_1466483 ?auto_1466484 ) ) ( not ( = ?auto_1466483 ?auto_1466485 ) ) ( not ( = ?auto_1466483 ?auto_1466486 ) ) ( not ( = ?auto_1466483 ?auto_1466487 ) ) ( not ( = ?auto_1466483 ?auto_1466488 ) ) ( not ( = ?auto_1466483 ?auto_1466492 ) ) ( not ( = ?auto_1466484 ?auto_1466485 ) ) ( not ( = ?auto_1466484 ?auto_1466486 ) ) ( not ( = ?auto_1466484 ?auto_1466487 ) ) ( not ( = ?auto_1466484 ?auto_1466488 ) ) ( not ( = ?auto_1466484 ?auto_1466492 ) ) ( not ( = ?auto_1466485 ?auto_1466486 ) ) ( not ( = ?auto_1466485 ?auto_1466487 ) ) ( not ( = ?auto_1466485 ?auto_1466488 ) ) ( not ( = ?auto_1466485 ?auto_1466492 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1466486 ?auto_1466487 ?auto_1466488 )
      ( MAKE-12CRATE-VERIFY ?auto_1466477 ?auto_1466478 ?auto_1466479 ?auto_1466476 ?auto_1466480 ?auto_1466482 ?auto_1466481 ?auto_1466483 ?auto_1466484 ?auto_1466485 ?auto_1466486 ?auto_1466487 ?auto_1466488 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1466640 - SURFACE
      ?auto_1466641 - SURFACE
      ?auto_1466642 - SURFACE
      ?auto_1466639 - SURFACE
      ?auto_1466643 - SURFACE
      ?auto_1466645 - SURFACE
      ?auto_1466644 - SURFACE
      ?auto_1466646 - SURFACE
      ?auto_1466647 - SURFACE
      ?auto_1466648 - SURFACE
      ?auto_1466649 - SURFACE
      ?auto_1466650 - SURFACE
      ?auto_1466651 - SURFACE
    )
    :vars
    (
      ?auto_1466655 - HOIST
      ?auto_1466652 - PLACE
      ?auto_1466657 - PLACE
      ?auto_1466656 - HOIST
      ?auto_1466654 - SURFACE
      ?auto_1466653 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1466655 ?auto_1466652 ) ( IS-CRATE ?auto_1466651 ) ( not ( = ?auto_1466650 ?auto_1466651 ) ) ( not ( = ?auto_1466649 ?auto_1466650 ) ) ( not ( = ?auto_1466649 ?auto_1466651 ) ) ( not ( = ?auto_1466657 ?auto_1466652 ) ) ( HOIST-AT ?auto_1466656 ?auto_1466657 ) ( not ( = ?auto_1466655 ?auto_1466656 ) ) ( AVAILABLE ?auto_1466656 ) ( SURFACE-AT ?auto_1466651 ?auto_1466657 ) ( ON ?auto_1466651 ?auto_1466654 ) ( CLEAR ?auto_1466651 ) ( not ( = ?auto_1466650 ?auto_1466654 ) ) ( not ( = ?auto_1466651 ?auto_1466654 ) ) ( not ( = ?auto_1466649 ?auto_1466654 ) ) ( TRUCK-AT ?auto_1466653 ?auto_1466652 ) ( SURFACE-AT ?auto_1466649 ?auto_1466652 ) ( CLEAR ?auto_1466649 ) ( IS-CRATE ?auto_1466650 ) ( AVAILABLE ?auto_1466655 ) ( IN ?auto_1466650 ?auto_1466653 ) ( ON ?auto_1466641 ?auto_1466640 ) ( ON ?auto_1466642 ?auto_1466641 ) ( ON ?auto_1466639 ?auto_1466642 ) ( ON ?auto_1466643 ?auto_1466639 ) ( ON ?auto_1466645 ?auto_1466643 ) ( ON ?auto_1466644 ?auto_1466645 ) ( ON ?auto_1466646 ?auto_1466644 ) ( ON ?auto_1466647 ?auto_1466646 ) ( ON ?auto_1466648 ?auto_1466647 ) ( ON ?auto_1466649 ?auto_1466648 ) ( not ( = ?auto_1466640 ?auto_1466641 ) ) ( not ( = ?auto_1466640 ?auto_1466642 ) ) ( not ( = ?auto_1466640 ?auto_1466639 ) ) ( not ( = ?auto_1466640 ?auto_1466643 ) ) ( not ( = ?auto_1466640 ?auto_1466645 ) ) ( not ( = ?auto_1466640 ?auto_1466644 ) ) ( not ( = ?auto_1466640 ?auto_1466646 ) ) ( not ( = ?auto_1466640 ?auto_1466647 ) ) ( not ( = ?auto_1466640 ?auto_1466648 ) ) ( not ( = ?auto_1466640 ?auto_1466649 ) ) ( not ( = ?auto_1466640 ?auto_1466650 ) ) ( not ( = ?auto_1466640 ?auto_1466651 ) ) ( not ( = ?auto_1466640 ?auto_1466654 ) ) ( not ( = ?auto_1466641 ?auto_1466642 ) ) ( not ( = ?auto_1466641 ?auto_1466639 ) ) ( not ( = ?auto_1466641 ?auto_1466643 ) ) ( not ( = ?auto_1466641 ?auto_1466645 ) ) ( not ( = ?auto_1466641 ?auto_1466644 ) ) ( not ( = ?auto_1466641 ?auto_1466646 ) ) ( not ( = ?auto_1466641 ?auto_1466647 ) ) ( not ( = ?auto_1466641 ?auto_1466648 ) ) ( not ( = ?auto_1466641 ?auto_1466649 ) ) ( not ( = ?auto_1466641 ?auto_1466650 ) ) ( not ( = ?auto_1466641 ?auto_1466651 ) ) ( not ( = ?auto_1466641 ?auto_1466654 ) ) ( not ( = ?auto_1466642 ?auto_1466639 ) ) ( not ( = ?auto_1466642 ?auto_1466643 ) ) ( not ( = ?auto_1466642 ?auto_1466645 ) ) ( not ( = ?auto_1466642 ?auto_1466644 ) ) ( not ( = ?auto_1466642 ?auto_1466646 ) ) ( not ( = ?auto_1466642 ?auto_1466647 ) ) ( not ( = ?auto_1466642 ?auto_1466648 ) ) ( not ( = ?auto_1466642 ?auto_1466649 ) ) ( not ( = ?auto_1466642 ?auto_1466650 ) ) ( not ( = ?auto_1466642 ?auto_1466651 ) ) ( not ( = ?auto_1466642 ?auto_1466654 ) ) ( not ( = ?auto_1466639 ?auto_1466643 ) ) ( not ( = ?auto_1466639 ?auto_1466645 ) ) ( not ( = ?auto_1466639 ?auto_1466644 ) ) ( not ( = ?auto_1466639 ?auto_1466646 ) ) ( not ( = ?auto_1466639 ?auto_1466647 ) ) ( not ( = ?auto_1466639 ?auto_1466648 ) ) ( not ( = ?auto_1466639 ?auto_1466649 ) ) ( not ( = ?auto_1466639 ?auto_1466650 ) ) ( not ( = ?auto_1466639 ?auto_1466651 ) ) ( not ( = ?auto_1466639 ?auto_1466654 ) ) ( not ( = ?auto_1466643 ?auto_1466645 ) ) ( not ( = ?auto_1466643 ?auto_1466644 ) ) ( not ( = ?auto_1466643 ?auto_1466646 ) ) ( not ( = ?auto_1466643 ?auto_1466647 ) ) ( not ( = ?auto_1466643 ?auto_1466648 ) ) ( not ( = ?auto_1466643 ?auto_1466649 ) ) ( not ( = ?auto_1466643 ?auto_1466650 ) ) ( not ( = ?auto_1466643 ?auto_1466651 ) ) ( not ( = ?auto_1466643 ?auto_1466654 ) ) ( not ( = ?auto_1466645 ?auto_1466644 ) ) ( not ( = ?auto_1466645 ?auto_1466646 ) ) ( not ( = ?auto_1466645 ?auto_1466647 ) ) ( not ( = ?auto_1466645 ?auto_1466648 ) ) ( not ( = ?auto_1466645 ?auto_1466649 ) ) ( not ( = ?auto_1466645 ?auto_1466650 ) ) ( not ( = ?auto_1466645 ?auto_1466651 ) ) ( not ( = ?auto_1466645 ?auto_1466654 ) ) ( not ( = ?auto_1466644 ?auto_1466646 ) ) ( not ( = ?auto_1466644 ?auto_1466647 ) ) ( not ( = ?auto_1466644 ?auto_1466648 ) ) ( not ( = ?auto_1466644 ?auto_1466649 ) ) ( not ( = ?auto_1466644 ?auto_1466650 ) ) ( not ( = ?auto_1466644 ?auto_1466651 ) ) ( not ( = ?auto_1466644 ?auto_1466654 ) ) ( not ( = ?auto_1466646 ?auto_1466647 ) ) ( not ( = ?auto_1466646 ?auto_1466648 ) ) ( not ( = ?auto_1466646 ?auto_1466649 ) ) ( not ( = ?auto_1466646 ?auto_1466650 ) ) ( not ( = ?auto_1466646 ?auto_1466651 ) ) ( not ( = ?auto_1466646 ?auto_1466654 ) ) ( not ( = ?auto_1466647 ?auto_1466648 ) ) ( not ( = ?auto_1466647 ?auto_1466649 ) ) ( not ( = ?auto_1466647 ?auto_1466650 ) ) ( not ( = ?auto_1466647 ?auto_1466651 ) ) ( not ( = ?auto_1466647 ?auto_1466654 ) ) ( not ( = ?auto_1466648 ?auto_1466649 ) ) ( not ( = ?auto_1466648 ?auto_1466650 ) ) ( not ( = ?auto_1466648 ?auto_1466651 ) ) ( not ( = ?auto_1466648 ?auto_1466654 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1466649 ?auto_1466650 ?auto_1466651 )
      ( MAKE-12CRATE-VERIFY ?auto_1466640 ?auto_1466641 ?auto_1466642 ?auto_1466639 ?auto_1466643 ?auto_1466645 ?auto_1466644 ?auto_1466646 ?auto_1466647 ?auto_1466648 ?auto_1466649 ?auto_1466650 ?auto_1466651 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1478191 - SURFACE
      ?auto_1478192 - SURFACE
      ?auto_1478193 - SURFACE
      ?auto_1478190 - SURFACE
      ?auto_1478194 - SURFACE
      ?auto_1478196 - SURFACE
      ?auto_1478195 - SURFACE
      ?auto_1478197 - SURFACE
      ?auto_1478198 - SURFACE
      ?auto_1478199 - SURFACE
      ?auto_1478200 - SURFACE
      ?auto_1478201 - SURFACE
      ?auto_1478202 - SURFACE
      ?auto_1478203 - SURFACE
    )
    :vars
    (
      ?auto_1478205 - HOIST
      ?auto_1478204 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1478205 ?auto_1478204 ) ( SURFACE-AT ?auto_1478202 ?auto_1478204 ) ( CLEAR ?auto_1478202 ) ( LIFTING ?auto_1478205 ?auto_1478203 ) ( IS-CRATE ?auto_1478203 ) ( not ( = ?auto_1478202 ?auto_1478203 ) ) ( ON ?auto_1478192 ?auto_1478191 ) ( ON ?auto_1478193 ?auto_1478192 ) ( ON ?auto_1478190 ?auto_1478193 ) ( ON ?auto_1478194 ?auto_1478190 ) ( ON ?auto_1478196 ?auto_1478194 ) ( ON ?auto_1478195 ?auto_1478196 ) ( ON ?auto_1478197 ?auto_1478195 ) ( ON ?auto_1478198 ?auto_1478197 ) ( ON ?auto_1478199 ?auto_1478198 ) ( ON ?auto_1478200 ?auto_1478199 ) ( ON ?auto_1478201 ?auto_1478200 ) ( ON ?auto_1478202 ?auto_1478201 ) ( not ( = ?auto_1478191 ?auto_1478192 ) ) ( not ( = ?auto_1478191 ?auto_1478193 ) ) ( not ( = ?auto_1478191 ?auto_1478190 ) ) ( not ( = ?auto_1478191 ?auto_1478194 ) ) ( not ( = ?auto_1478191 ?auto_1478196 ) ) ( not ( = ?auto_1478191 ?auto_1478195 ) ) ( not ( = ?auto_1478191 ?auto_1478197 ) ) ( not ( = ?auto_1478191 ?auto_1478198 ) ) ( not ( = ?auto_1478191 ?auto_1478199 ) ) ( not ( = ?auto_1478191 ?auto_1478200 ) ) ( not ( = ?auto_1478191 ?auto_1478201 ) ) ( not ( = ?auto_1478191 ?auto_1478202 ) ) ( not ( = ?auto_1478191 ?auto_1478203 ) ) ( not ( = ?auto_1478192 ?auto_1478193 ) ) ( not ( = ?auto_1478192 ?auto_1478190 ) ) ( not ( = ?auto_1478192 ?auto_1478194 ) ) ( not ( = ?auto_1478192 ?auto_1478196 ) ) ( not ( = ?auto_1478192 ?auto_1478195 ) ) ( not ( = ?auto_1478192 ?auto_1478197 ) ) ( not ( = ?auto_1478192 ?auto_1478198 ) ) ( not ( = ?auto_1478192 ?auto_1478199 ) ) ( not ( = ?auto_1478192 ?auto_1478200 ) ) ( not ( = ?auto_1478192 ?auto_1478201 ) ) ( not ( = ?auto_1478192 ?auto_1478202 ) ) ( not ( = ?auto_1478192 ?auto_1478203 ) ) ( not ( = ?auto_1478193 ?auto_1478190 ) ) ( not ( = ?auto_1478193 ?auto_1478194 ) ) ( not ( = ?auto_1478193 ?auto_1478196 ) ) ( not ( = ?auto_1478193 ?auto_1478195 ) ) ( not ( = ?auto_1478193 ?auto_1478197 ) ) ( not ( = ?auto_1478193 ?auto_1478198 ) ) ( not ( = ?auto_1478193 ?auto_1478199 ) ) ( not ( = ?auto_1478193 ?auto_1478200 ) ) ( not ( = ?auto_1478193 ?auto_1478201 ) ) ( not ( = ?auto_1478193 ?auto_1478202 ) ) ( not ( = ?auto_1478193 ?auto_1478203 ) ) ( not ( = ?auto_1478190 ?auto_1478194 ) ) ( not ( = ?auto_1478190 ?auto_1478196 ) ) ( not ( = ?auto_1478190 ?auto_1478195 ) ) ( not ( = ?auto_1478190 ?auto_1478197 ) ) ( not ( = ?auto_1478190 ?auto_1478198 ) ) ( not ( = ?auto_1478190 ?auto_1478199 ) ) ( not ( = ?auto_1478190 ?auto_1478200 ) ) ( not ( = ?auto_1478190 ?auto_1478201 ) ) ( not ( = ?auto_1478190 ?auto_1478202 ) ) ( not ( = ?auto_1478190 ?auto_1478203 ) ) ( not ( = ?auto_1478194 ?auto_1478196 ) ) ( not ( = ?auto_1478194 ?auto_1478195 ) ) ( not ( = ?auto_1478194 ?auto_1478197 ) ) ( not ( = ?auto_1478194 ?auto_1478198 ) ) ( not ( = ?auto_1478194 ?auto_1478199 ) ) ( not ( = ?auto_1478194 ?auto_1478200 ) ) ( not ( = ?auto_1478194 ?auto_1478201 ) ) ( not ( = ?auto_1478194 ?auto_1478202 ) ) ( not ( = ?auto_1478194 ?auto_1478203 ) ) ( not ( = ?auto_1478196 ?auto_1478195 ) ) ( not ( = ?auto_1478196 ?auto_1478197 ) ) ( not ( = ?auto_1478196 ?auto_1478198 ) ) ( not ( = ?auto_1478196 ?auto_1478199 ) ) ( not ( = ?auto_1478196 ?auto_1478200 ) ) ( not ( = ?auto_1478196 ?auto_1478201 ) ) ( not ( = ?auto_1478196 ?auto_1478202 ) ) ( not ( = ?auto_1478196 ?auto_1478203 ) ) ( not ( = ?auto_1478195 ?auto_1478197 ) ) ( not ( = ?auto_1478195 ?auto_1478198 ) ) ( not ( = ?auto_1478195 ?auto_1478199 ) ) ( not ( = ?auto_1478195 ?auto_1478200 ) ) ( not ( = ?auto_1478195 ?auto_1478201 ) ) ( not ( = ?auto_1478195 ?auto_1478202 ) ) ( not ( = ?auto_1478195 ?auto_1478203 ) ) ( not ( = ?auto_1478197 ?auto_1478198 ) ) ( not ( = ?auto_1478197 ?auto_1478199 ) ) ( not ( = ?auto_1478197 ?auto_1478200 ) ) ( not ( = ?auto_1478197 ?auto_1478201 ) ) ( not ( = ?auto_1478197 ?auto_1478202 ) ) ( not ( = ?auto_1478197 ?auto_1478203 ) ) ( not ( = ?auto_1478198 ?auto_1478199 ) ) ( not ( = ?auto_1478198 ?auto_1478200 ) ) ( not ( = ?auto_1478198 ?auto_1478201 ) ) ( not ( = ?auto_1478198 ?auto_1478202 ) ) ( not ( = ?auto_1478198 ?auto_1478203 ) ) ( not ( = ?auto_1478199 ?auto_1478200 ) ) ( not ( = ?auto_1478199 ?auto_1478201 ) ) ( not ( = ?auto_1478199 ?auto_1478202 ) ) ( not ( = ?auto_1478199 ?auto_1478203 ) ) ( not ( = ?auto_1478200 ?auto_1478201 ) ) ( not ( = ?auto_1478200 ?auto_1478202 ) ) ( not ( = ?auto_1478200 ?auto_1478203 ) ) ( not ( = ?auto_1478201 ?auto_1478202 ) ) ( not ( = ?auto_1478201 ?auto_1478203 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1478202 ?auto_1478203 )
      ( MAKE-13CRATE-VERIFY ?auto_1478191 ?auto_1478192 ?auto_1478193 ?auto_1478190 ?auto_1478194 ?auto_1478196 ?auto_1478195 ?auto_1478197 ?auto_1478198 ?auto_1478199 ?auto_1478200 ?auto_1478201 ?auto_1478202 ?auto_1478203 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1478333 - SURFACE
      ?auto_1478334 - SURFACE
      ?auto_1478335 - SURFACE
      ?auto_1478332 - SURFACE
      ?auto_1478336 - SURFACE
      ?auto_1478338 - SURFACE
      ?auto_1478337 - SURFACE
      ?auto_1478339 - SURFACE
      ?auto_1478340 - SURFACE
      ?auto_1478341 - SURFACE
      ?auto_1478342 - SURFACE
      ?auto_1478343 - SURFACE
      ?auto_1478344 - SURFACE
      ?auto_1478345 - SURFACE
    )
    :vars
    (
      ?auto_1478347 - HOIST
      ?auto_1478346 - PLACE
      ?auto_1478348 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1478347 ?auto_1478346 ) ( SURFACE-AT ?auto_1478344 ?auto_1478346 ) ( CLEAR ?auto_1478344 ) ( IS-CRATE ?auto_1478345 ) ( not ( = ?auto_1478344 ?auto_1478345 ) ) ( TRUCK-AT ?auto_1478348 ?auto_1478346 ) ( AVAILABLE ?auto_1478347 ) ( IN ?auto_1478345 ?auto_1478348 ) ( ON ?auto_1478344 ?auto_1478343 ) ( not ( = ?auto_1478343 ?auto_1478344 ) ) ( not ( = ?auto_1478343 ?auto_1478345 ) ) ( ON ?auto_1478334 ?auto_1478333 ) ( ON ?auto_1478335 ?auto_1478334 ) ( ON ?auto_1478332 ?auto_1478335 ) ( ON ?auto_1478336 ?auto_1478332 ) ( ON ?auto_1478338 ?auto_1478336 ) ( ON ?auto_1478337 ?auto_1478338 ) ( ON ?auto_1478339 ?auto_1478337 ) ( ON ?auto_1478340 ?auto_1478339 ) ( ON ?auto_1478341 ?auto_1478340 ) ( ON ?auto_1478342 ?auto_1478341 ) ( ON ?auto_1478343 ?auto_1478342 ) ( not ( = ?auto_1478333 ?auto_1478334 ) ) ( not ( = ?auto_1478333 ?auto_1478335 ) ) ( not ( = ?auto_1478333 ?auto_1478332 ) ) ( not ( = ?auto_1478333 ?auto_1478336 ) ) ( not ( = ?auto_1478333 ?auto_1478338 ) ) ( not ( = ?auto_1478333 ?auto_1478337 ) ) ( not ( = ?auto_1478333 ?auto_1478339 ) ) ( not ( = ?auto_1478333 ?auto_1478340 ) ) ( not ( = ?auto_1478333 ?auto_1478341 ) ) ( not ( = ?auto_1478333 ?auto_1478342 ) ) ( not ( = ?auto_1478333 ?auto_1478343 ) ) ( not ( = ?auto_1478333 ?auto_1478344 ) ) ( not ( = ?auto_1478333 ?auto_1478345 ) ) ( not ( = ?auto_1478334 ?auto_1478335 ) ) ( not ( = ?auto_1478334 ?auto_1478332 ) ) ( not ( = ?auto_1478334 ?auto_1478336 ) ) ( not ( = ?auto_1478334 ?auto_1478338 ) ) ( not ( = ?auto_1478334 ?auto_1478337 ) ) ( not ( = ?auto_1478334 ?auto_1478339 ) ) ( not ( = ?auto_1478334 ?auto_1478340 ) ) ( not ( = ?auto_1478334 ?auto_1478341 ) ) ( not ( = ?auto_1478334 ?auto_1478342 ) ) ( not ( = ?auto_1478334 ?auto_1478343 ) ) ( not ( = ?auto_1478334 ?auto_1478344 ) ) ( not ( = ?auto_1478334 ?auto_1478345 ) ) ( not ( = ?auto_1478335 ?auto_1478332 ) ) ( not ( = ?auto_1478335 ?auto_1478336 ) ) ( not ( = ?auto_1478335 ?auto_1478338 ) ) ( not ( = ?auto_1478335 ?auto_1478337 ) ) ( not ( = ?auto_1478335 ?auto_1478339 ) ) ( not ( = ?auto_1478335 ?auto_1478340 ) ) ( not ( = ?auto_1478335 ?auto_1478341 ) ) ( not ( = ?auto_1478335 ?auto_1478342 ) ) ( not ( = ?auto_1478335 ?auto_1478343 ) ) ( not ( = ?auto_1478335 ?auto_1478344 ) ) ( not ( = ?auto_1478335 ?auto_1478345 ) ) ( not ( = ?auto_1478332 ?auto_1478336 ) ) ( not ( = ?auto_1478332 ?auto_1478338 ) ) ( not ( = ?auto_1478332 ?auto_1478337 ) ) ( not ( = ?auto_1478332 ?auto_1478339 ) ) ( not ( = ?auto_1478332 ?auto_1478340 ) ) ( not ( = ?auto_1478332 ?auto_1478341 ) ) ( not ( = ?auto_1478332 ?auto_1478342 ) ) ( not ( = ?auto_1478332 ?auto_1478343 ) ) ( not ( = ?auto_1478332 ?auto_1478344 ) ) ( not ( = ?auto_1478332 ?auto_1478345 ) ) ( not ( = ?auto_1478336 ?auto_1478338 ) ) ( not ( = ?auto_1478336 ?auto_1478337 ) ) ( not ( = ?auto_1478336 ?auto_1478339 ) ) ( not ( = ?auto_1478336 ?auto_1478340 ) ) ( not ( = ?auto_1478336 ?auto_1478341 ) ) ( not ( = ?auto_1478336 ?auto_1478342 ) ) ( not ( = ?auto_1478336 ?auto_1478343 ) ) ( not ( = ?auto_1478336 ?auto_1478344 ) ) ( not ( = ?auto_1478336 ?auto_1478345 ) ) ( not ( = ?auto_1478338 ?auto_1478337 ) ) ( not ( = ?auto_1478338 ?auto_1478339 ) ) ( not ( = ?auto_1478338 ?auto_1478340 ) ) ( not ( = ?auto_1478338 ?auto_1478341 ) ) ( not ( = ?auto_1478338 ?auto_1478342 ) ) ( not ( = ?auto_1478338 ?auto_1478343 ) ) ( not ( = ?auto_1478338 ?auto_1478344 ) ) ( not ( = ?auto_1478338 ?auto_1478345 ) ) ( not ( = ?auto_1478337 ?auto_1478339 ) ) ( not ( = ?auto_1478337 ?auto_1478340 ) ) ( not ( = ?auto_1478337 ?auto_1478341 ) ) ( not ( = ?auto_1478337 ?auto_1478342 ) ) ( not ( = ?auto_1478337 ?auto_1478343 ) ) ( not ( = ?auto_1478337 ?auto_1478344 ) ) ( not ( = ?auto_1478337 ?auto_1478345 ) ) ( not ( = ?auto_1478339 ?auto_1478340 ) ) ( not ( = ?auto_1478339 ?auto_1478341 ) ) ( not ( = ?auto_1478339 ?auto_1478342 ) ) ( not ( = ?auto_1478339 ?auto_1478343 ) ) ( not ( = ?auto_1478339 ?auto_1478344 ) ) ( not ( = ?auto_1478339 ?auto_1478345 ) ) ( not ( = ?auto_1478340 ?auto_1478341 ) ) ( not ( = ?auto_1478340 ?auto_1478342 ) ) ( not ( = ?auto_1478340 ?auto_1478343 ) ) ( not ( = ?auto_1478340 ?auto_1478344 ) ) ( not ( = ?auto_1478340 ?auto_1478345 ) ) ( not ( = ?auto_1478341 ?auto_1478342 ) ) ( not ( = ?auto_1478341 ?auto_1478343 ) ) ( not ( = ?auto_1478341 ?auto_1478344 ) ) ( not ( = ?auto_1478341 ?auto_1478345 ) ) ( not ( = ?auto_1478342 ?auto_1478343 ) ) ( not ( = ?auto_1478342 ?auto_1478344 ) ) ( not ( = ?auto_1478342 ?auto_1478345 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1478343 ?auto_1478344 ?auto_1478345 )
      ( MAKE-13CRATE-VERIFY ?auto_1478333 ?auto_1478334 ?auto_1478335 ?auto_1478332 ?auto_1478336 ?auto_1478338 ?auto_1478337 ?auto_1478339 ?auto_1478340 ?auto_1478341 ?auto_1478342 ?auto_1478343 ?auto_1478344 ?auto_1478345 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1478489 - SURFACE
      ?auto_1478490 - SURFACE
      ?auto_1478491 - SURFACE
      ?auto_1478488 - SURFACE
      ?auto_1478492 - SURFACE
      ?auto_1478494 - SURFACE
      ?auto_1478493 - SURFACE
      ?auto_1478495 - SURFACE
      ?auto_1478496 - SURFACE
      ?auto_1478497 - SURFACE
      ?auto_1478498 - SURFACE
      ?auto_1478499 - SURFACE
      ?auto_1478500 - SURFACE
      ?auto_1478501 - SURFACE
    )
    :vars
    (
      ?auto_1478503 - HOIST
      ?auto_1478504 - PLACE
      ?auto_1478502 - TRUCK
      ?auto_1478505 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1478503 ?auto_1478504 ) ( SURFACE-AT ?auto_1478500 ?auto_1478504 ) ( CLEAR ?auto_1478500 ) ( IS-CRATE ?auto_1478501 ) ( not ( = ?auto_1478500 ?auto_1478501 ) ) ( AVAILABLE ?auto_1478503 ) ( IN ?auto_1478501 ?auto_1478502 ) ( ON ?auto_1478500 ?auto_1478499 ) ( not ( = ?auto_1478499 ?auto_1478500 ) ) ( not ( = ?auto_1478499 ?auto_1478501 ) ) ( TRUCK-AT ?auto_1478502 ?auto_1478505 ) ( not ( = ?auto_1478505 ?auto_1478504 ) ) ( ON ?auto_1478490 ?auto_1478489 ) ( ON ?auto_1478491 ?auto_1478490 ) ( ON ?auto_1478488 ?auto_1478491 ) ( ON ?auto_1478492 ?auto_1478488 ) ( ON ?auto_1478494 ?auto_1478492 ) ( ON ?auto_1478493 ?auto_1478494 ) ( ON ?auto_1478495 ?auto_1478493 ) ( ON ?auto_1478496 ?auto_1478495 ) ( ON ?auto_1478497 ?auto_1478496 ) ( ON ?auto_1478498 ?auto_1478497 ) ( ON ?auto_1478499 ?auto_1478498 ) ( not ( = ?auto_1478489 ?auto_1478490 ) ) ( not ( = ?auto_1478489 ?auto_1478491 ) ) ( not ( = ?auto_1478489 ?auto_1478488 ) ) ( not ( = ?auto_1478489 ?auto_1478492 ) ) ( not ( = ?auto_1478489 ?auto_1478494 ) ) ( not ( = ?auto_1478489 ?auto_1478493 ) ) ( not ( = ?auto_1478489 ?auto_1478495 ) ) ( not ( = ?auto_1478489 ?auto_1478496 ) ) ( not ( = ?auto_1478489 ?auto_1478497 ) ) ( not ( = ?auto_1478489 ?auto_1478498 ) ) ( not ( = ?auto_1478489 ?auto_1478499 ) ) ( not ( = ?auto_1478489 ?auto_1478500 ) ) ( not ( = ?auto_1478489 ?auto_1478501 ) ) ( not ( = ?auto_1478490 ?auto_1478491 ) ) ( not ( = ?auto_1478490 ?auto_1478488 ) ) ( not ( = ?auto_1478490 ?auto_1478492 ) ) ( not ( = ?auto_1478490 ?auto_1478494 ) ) ( not ( = ?auto_1478490 ?auto_1478493 ) ) ( not ( = ?auto_1478490 ?auto_1478495 ) ) ( not ( = ?auto_1478490 ?auto_1478496 ) ) ( not ( = ?auto_1478490 ?auto_1478497 ) ) ( not ( = ?auto_1478490 ?auto_1478498 ) ) ( not ( = ?auto_1478490 ?auto_1478499 ) ) ( not ( = ?auto_1478490 ?auto_1478500 ) ) ( not ( = ?auto_1478490 ?auto_1478501 ) ) ( not ( = ?auto_1478491 ?auto_1478488 ) ) ( not ( = ?auto_1478491 ?auto_1478492 ) ) ( not ( = ?auto_1478491 ?auto_1478494 ) ) ( not ( = ?auto_1478491 ?auto_1478493 ) ) ( not ( = ?auto_1478491 ?auto_1478495 ) ) ( not ( = ?auto_1478491 ?auto_1478496 ) ) ( not ( = ?auto_1478491 ?auto_1478497 ) ) ( not ( = ?auto_1478491 ?auto_1478498 ) ) ( not ( = ?auto_1478491 ?auto_1478499 ) ) ( not ( = ?auto_1478491 ?auto_1478500 ) ) ( not ( = ?auto_1478491 ?auto_1478501 ) ) ( not ( = ?auto_1478488 ?auto_1478492 ) ) ( not ( = ?auto_1478488 ?auto_1478494 ) ) ( not ( = ?auto_1478488 ?auto_1478493 ) ) ( not ( = ?auto_1478488 ?auto_1478495 ) ) ( not ( = ?auto_1478488 ?auto_1478496 ) ) ( not ( = ?auto_1478488 ?auto_1478497 ) ) ( not ( = ?auto_1478488 ?auto_1478498 ) ) ( not ( = ?auto_1478488 ?auto_1478499 ) ) ( not ( = ?auto_1478488 ?auto_1478500 ) ) ( not ( = ?auto_1478488 ?auto_1478501 ) ) ( not ( = ?auto_1478492 ?auto_1478494 ) ) ( not ( = ?auto_1478492 ?auto_1478493 ) ) ( not ( = ?auto_1478492 ?auto_1478495 ) ) ( not ( = ?auto_1478492 ?auto_1478496 ) ) ( not ( = ?auto_1478492 ?auto_1478497 ) ) ( not ( = ?auto_1478492 ?auto_1478498 ) ) ( not ( = ?auto_1478492 ?auto_1478499 ) ) ( not ( = ?auto_1478492 ?auto_1478500 ) ) ( not ( = ?auto_1478492 ?auto_1478501 ) ) ( not ( = ?auto_1478494 ?auto_1478493 ) ) ( not ( = ?auto_1478494 ?auto_1478495 ) ) ( not ( = ?auto_1478494 ?auto_1478496 ) ) ( not ( = ?auto_1478494 ?auto_1478497 ) ) ( not ( = ?auto_1478494 ?auto_1478498 ) ) ( not ( = ?auto_1478494 ?auto_1478499 ) ) ( not ( = ?auto_1478494 ?auto_1478500 ) ) ( not ( = ?auto_1478494 ?auto_1478501 ) ) ( not ( = ?auto_1478493 ?auto_1478495 ) ) ( not ( = ?auto_1478493 ?auto_1478496 ) ) ( not ( = ?auto_1478493 ?auto_1478497 ) ) ( not ( = ?auto_1478493 ?auto_1478498 ) ) ( not ( = ?auto_1478493 ?auto_1478499 ) ) ( not ( = ?auto_1478493 ?auto_1478500 ) ) ( not ( = ?auto_1478493 ?auto_1478501 ) ) ( not ( = ?auto_1478495 ?auto_1478496 ) ) ( not ( = ?auto_1478495 ?auto_1478497 ) ) ( not ( = ?auto_1478495 ?auto_1478498 ) ) ( not ( = ?auto_1478495 ?auto_1478499 ) ) ( not ( = ?auto_1478495 ?auto_1478500 ) ) ( not ( = ?auto_1478495 ?auto_1478501 ) ) ( not ( = ?auto_1478496 ?auto_1478497 ) ) ( not ( = ?auto_1478496 ?auto_1478498 ) ) ( not ( = ?auto_1478496 ?auto_1478499 ) ) ( not ( = ?auto_1478496 ?auto_1478500 ) ) ( not ( = ?auto_1478496 ?auto_1478501 ) ) ( not ( = ?auto_1478497 ?auto_1478498 ) ) ( not ( = ?auto_1478497 ?auto_1478499 ) ) ( not ( = ?auto_1478497 ?auto_1478500 ) ) ( not ( = ?auto_1478497 ?auto_1478501 ) ) ( not ( = ?auto_1478498 ?auto_1478499 ) ) ( not ( = ?auto_1478498 ?auto_1478500 ) ) ( not ( = ?auto_1478498 ?auto_1478501 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1478499 ?auto_1478500 ?auto_1478501 )
      ( MAKE-13CRATE-VERIFY ?auto_1478489 ?auto_1478490 ?auto_1478491 ?auto_1478488 ?auto_1478492 ?auto_1478494 ?auto_1478493 ?auto_1478495 ?auto_1478496 ?auto_1478497 ?auto_1478498 ?auto_1478499 ?auto_1478500 ?auto_1478501 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1478658 - SURFACE
      ?auto_1478659 - SURFACE
      ?auto_1478660 - SURFACE
      ?auto_1478657 - SURFACE
      ?auto_1478661 - SURFACE
      ?auto_1478663 - SURFACE
      ?auto_1478662 - SURFACE
      ?auto_1478664 - SURFACE
      ?auto_1478665 - SURFACE
      ?auto_1478666 - SURFACE
      ?auto_1478667 - SURFACE
      ?auto_1478668 - SURFACE
      ?auto_1478669 - SURFACE
      ?auto_1478670 - SURFACE
    )
    :vars
    (
      ?auto_1478674 - HOIST
      ?auto_1478671 - PLACE
      ?auto_1478672 - TRUCK
      ?auto_1478675 - PLACE
      ?auto_1478673 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1478674 ?auto_1478671 ) ( SURFACE-AT ?auto_1478669 ?auto_1478671 ) ( CLEAR ?auto_1478669 ) ( IS-CRATE ?auto_1478670 ) ( not ( = ?auto_1478669 ?auto_1478670 ) ) ( AVAILABLE ?auto_1478674 ) ( ON ?auto_1478669 ?auto_1478668 ) ( not ( = ?auto_1478668 ?auto_1478669 ) ) ( not ( = ?auto_1478668 ?auto_1478670 ) ) ( TRUCK-AT ?auto_1478672 ?auto_1478675 ) ( not ( = ?auto_1478675 ?auto_1478671 ) ) ( HOIST-AT ?auto_1478673 ?auto_1478675 ) ( LIFTING ?auto_1478673 ?auto_1478670 ) ( not ( = ?auto_1478674 ?auto_1478673 ) ) ( ON ?auto_1478659 ?auto_1478658 ) ( ON ?auto_1478660 ?auto_1478659 ) ( ON ?auto_1478657 ?auto_1478660 ) ( ON ?auto_1478661 ?auto_1478657 ) ( ON ?auto_1478663 ?auto_1478661 ) ( ON ?auto_1478662 ?auto_1478663 ) ( ON ?auto_1478664 ?auto_1478662 ) ( ON ?auto_1478665 ?auto_1478664 ) ( ON ?auto_1478666 ?auto_1478665 ) ( ON ?auto_1478667 ?auto_1478666 ) ( ON ?auto_1478668 ?auto_1478667 ) ( not ( = ?auto_1478658 ?auto_1478659 ) ) ( not ( = ?auto_1478658 ?auto_1478660 ) ) ( not ( = ?auto_1478658 ?auto_1478657 ) ) ( not ( = ?auto_1478658 ?auto_1478661 ) ) ( not ( = ?auto_1478658 ?auto_1478663 ) ) ( not ( = ?auto_1478658 ?auto_1478662 ) ) ( not ( = ?auto_1478658 ?auto_1478664 ) ) ( not ( = ?auto_1478658 ?auto_1478665 ) ) ( not ( = ?auto_1478658 ?auto_1478666 ) ) ( not ( = ?auto_1478658 ?auto_1478667 ) ) ( not ( = ?auto_1478658 ?auto_1478668 ) ) ( not ( = ?auto_1478658 ?auto_1478669 ) ) ( not ( = ?auto_1478658 ?auto_1478670 ) ) ( not ( = ?auto_1478659 ?auto_1478660 ) ) ( not ( = ?auto_1478659 ?auto_1478657 ) ) ( not ( = ?auto_1478659 ?auto_1478661 ) ) ( not ( = ?auto_1478659 ?auto_1478663 ) ) ( not ( = ?auto_1478659 ?auto_1478662 ) ) ( not ( = ?auto_1478659 ?auto_1478664 ) ) ( not ( = ?auto_1478659 ?auto_1478665 ) ) ( not ( = ?auto_1478659 ?auto_1478666 ) ) ( not ( = ?auto_1478659 ?auto_1478667 ) ) ( not ( = ?auto_1478659 ?auto_1478668 ) ) ( not ( = ?auto_1478659 ?auto_1478669 ) ) ( not ( = ?auto_1478659 ?auto_1478670 ) ) ( not ( = ?auto_1478660 ?auto_1478657 ) ) ( not ( = ?auto_1478660 ?auto_1478661 ) ) ( not ( = ?auto_1478660 ?auto_1478663 ) ) ( not ( = ?auto_1478660 ?auto_1478662 ) ) ( not ( = ?auto_1478660 ?auto_1478664 ) ) ( not ( = ?auto_1478660 ?auto_1478665 ) ) ( not ( = ?auto_1478660 ?auto_1478666 ) ) ( not ( = ?auto_1478660 ?auto_1478667 ) ) ( not ( = ?auto_1478660 ?auto_1478668 ) ) ( not ( = ?auto_1478660 ?auto_1478669 ) ) ( not ( = ?auto_1478660 ?auto_1478670 ) ) ( not ( = ?auto_1478657 ?auto_1478661 ) ) ( not ( = ?auto_1478657 ?auto_1478663 ) ) ( not ( = ?auto_1478657 ?auto_1478662 ) ) ( not ( = ?auto_1478657 ?auto_1478664 ) ) ( not ( = ?auto_1478657 ?auto_1478665 ) ) ( not ( = ?auto_1478657 ?auto_1478666 ) ) ( not ( = ?auto_1478657 ?auto_1478667 ) ) ( not ( = ?auto_1478657 ?auto_1478668 ) ) ( not ( = ?auto_1478657 ?auto_1478669 ) ) ( not ( = ?auto_1478657 ?auto_1478670 ) ) ( not ( = ?auto_1478661 ?auto_1478663 ) ) ( not ( = ?auto_1478661 ?auto_1478662 ) ) ( not ( = ?auto_1478661 ?auto_1478664 ) ) ( not ( = ?auto_1478661 ?auto_1478665 ) ) ( not ( = ?auto_1478661 ?auto_1478666 ) ) ( not ( = ?auto_1478661 ?auto_1478667 ) ) ( not ( = ?auto_1478661 ?auto_1478668 ) ) ( not ( = ?auto_1478661 ?auto_1478669 ) ) ( not ( = ?auto_1478661 ?auto_1478670 ) ) ( not ( = ?auto_1478663 ?auto_1478662 ) ) ( not ( = ?auto_1478663 ?auto_1478664 ) ) ( not ( = ?auto_1478663 ?auto_1478665 ) ) ( not ( = ?auto_1478663 ?auto_1478666 ) ) ( not ( = ?auto_1478663 ?auto_1478667 ) ) ( not ( = ?auto_1478663 ?auto_1478668 ) ) ( not ( = ?auto_1478663 ?auto_1478669 ) ) ( not ( = ?auto_1478663 ?auto_1478670 ) ) ( not ( = ?auto_1478662 ?auto_1478664 ) ) ( not ( = ?auto_1478662 ?auto_1478665 ) ) ( not ( = ?auto_1478662 ?auto_1478666 ) ) ( not ( = ?auto_1478662 ?auto_1478667 ) ) ( not ( = ?auto_1478662 ?auto_1478668 ) ) ( not ( = ?auto_1478662 ?auto_1478669 ) ) ( not ( = ?auto_1478662 ?auto_1478670 ) ) ( not ( = ?auto_1478664 ?auto_1478665 ) ) ( not ( = ?auto_1478664 ?auto_1478666 ) ) ( not ( = ?auto_1478664 ?auto_1478667 ) ) ( not ( = ?auto_1478664 ?auto_1478668 ) ) ( not ( = ?auto_1478664 ?auto_1478669 ) ) ( not ( = ?auto_1478664 ?auto_1478670 ) ) ( not ( = ?auto_1478665 ?auto_1478666 ) ) ( not ( = ?auto_1478665 ?auto_1478667 ) ) ( not ( = ?auto_1478665 ?auto_1478668 ) ) ( not ( = ?auto_1478665 ?auto_1478669 ) ) ( not ( = ?auto_1478665 ?auto_1478670 ) ) ( not ( = ?auto_1478666 ?auto_1478667 ) ) ( not ( = ?auto_1478666 ?auto_1478668 ) ) ( not ( = ?auto_1478666 ?auto_1478669 ) ) ( not ( = ?auto_1478666 ?auto_1478670 ) ) ( not ( = ?auto_1478667 ?auto_1478668 ) ) ( not ( = ?auto_1478667 ?auto_1478669 ) ) ( not ( = ?auto_1478667 ?auto_1478670 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1478668 ?auto_1478669 ?auto_1478670 )
      ( MAKE-13CRATE-VERIFY ?auto_1478658 ?auto_1478659 ?auto_1478660 ?auto_1478657 ?auto_1478661 ?auto_1478663 ?auto_1478662 ?auto_1478664 ?auto_1478665 ?auto_1478666 ?auto_1478667 ?auto_1478668 ?auto_1478669 ?auto_1478670 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1478840 - SURFACE
      ?auto_1478841 - SURFACE
      ?auto_1478842 - SURFACE
      ?auto_1478839 - SURFACE
      ?auto_1478843 - SURFACE
      ?auto_1478845 - SURFACE
      ?auto_1478844 - SURFACE
      ?auto_1478846 - SURFACE
      ?auto_1478847 - SURFACE
      ?auto_1478848 - SURFACE
      ?auto_1478849 - SURFACE
      ?auto_1478850 - SURFACE
      ?auto_1478851 - SURFACE
      ?auto_1478852 - SURFACE
    )
    :vars
    (
      ?auto_1478855 - HOIST
      ?auto_1478857 - PLACE
      ?auto_1478853 - TRUCK
      ?auto_1478858 - PLACE
      ?auto_1478854 - HOIST
      ?auto_1478856 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1478855 ?auto_1478857 ) ( SURFACE-AT ?auto_1478851 ?auto_1478857 ) ( CLEAR ?auto_1478851 ) ( IS-CRATE ?auto_1478852 ) ( not ( = ?auto_1478851 ?auto_1478852 ) ) ( AVAILABLE ?auto_1478855 ) ( ON ?auto_1478851 ?auto_1478850 ) ( not ( = ?auto_1478850 ?auto_1478851 ) ) ( not ( = ?auto_1478850 ?auto_1478852 ) ) ( TRUCK-AT ?auto_1478853 ?auto_1478858 ) ( not ( = ?auto_1478858 ?auto_1478857 ) ) ( HOIST-AT ?auto_1478854 ?auto_1478858 ) ( not ( = ?auto_1478855 ?auto_1478854 ) ) ( AVAILABLE ?auto_1478854 ) ( SURFACE-AT ?auto_1478852 ?auto_1478858 ) ( ON ?auto_1478852 ?auto_1478856 ) ( CLEAR ?auto_1478852 ) ( not ( = ?auto_1478851 ?auto_1478856 ) ) ( not ( = ?auto_1478852 ?auto_1478856 ) ) ( not ( = ?auto_1478850 ?auto_1478856 ) ) ( ON ?auto_1478841 ?auto_1478840 ) ( ON ?auto_1478842 ?auto_1478841 ) ( ON ?auto_1478839 ?auto_1478842 ) ( ON ?auto_1478843 ?auto_1478839 ) ( ON ?auto_1478845 ?auto_1478843 ) ( ON ?auto_1478844 ?auto_1478845 ) ( ON ?auto_1478846 ?auto_1478844 ) ( ON ?auto_1478847 ?auto_1478846 ) ( ON ?auto_1478848 ?auto_1478847 ) ( ON ?auto_1478849 ?auto_1478848 ) ( ON ?auto_1478850 ?auto_1478849 ) ( not ( = ?auto_1478840 ?auto_1478841 ) ) ( not ( = ?auto_1478840 ?auto_1478842 ) ) ( not ( = ?auto_1478840 ?auto_1478839 ) ) ( not ( = ?auto_1478840 ?auto_1478843 ) ) ( not ( = ?auto_1478840 ?auto_1478845 ) ) ( not ( = ?auto_1478840 ?auto_1478844 ) ) ( not ( = ?auto_1478840 ?auto_1478846 ) ) ( not ( = ?auto_1478840 ?auto_1478847 ) ) ( not ( = ?auto_1478840 ?auto_1478848 ) ) ( not ( = ?auto_1478840 ?auto_1478849 ) ) ( not ( = ?auto_1478840 ?auto_1478850 ) ) ( not ( = ?auto_1478840 ?auto_1478851 ) ) ( not ( = ?auto_1478840 ?auto_1478852 ) ) ( not ( = ?auto_1478840 ?auto_1478856 ) ) ( not ( = ?auto_1478841 ?auto_1478842 ) ) ( not ( = ?auto_1478841 ?auto_1478839 ) ) ( not ( = ?auto_1478841 ?auto_1478843 ) ) ( not ( = ?auto_1478841 ?auto_1478845 ) ) ( not ( = ?auto_1478841 ?auto_1478844 ) ) ( not ( = ?auto_1478841 ?auto_1478846 ) ) ( not ( = ?auto_1478841 ?auto_1478847 ) ) ( not ( = ?auto_1478841 ?auto_1478848 ) ) ( not ( = ?auto_1478841 ?auto_1478849 ) ) ( not ( = ?auto_1478841 ?auto_1478850 ) ) ( not ( = ?auto_1478841 ?auto_1478851 ) ) ( not ( = ?auto_1478841 ?auto_1478852 ) ) ( not ( = ?auto_1478841 ?auto_1478856 ) ) ( not ( = ?auto_1478842 ?auto_1478839 ) ) ( not ( = ?auto_1478842 ?auto_1478843 ) ) ( not ( = ?auto_1478842 ?auto_1478845 ) ) ( not ( = ?auto_1478842 ?auto_1478844 ) ) ( not ( = ?auto_1478842 ?auto_1478846 ) ) ( not ( = ?auto_1478842 ?auto_1478847 ) ) ( not ( = ?auto_1478842 ?auto_1478848 ) ) ( not ( = ?auto_1478842 ?auto_1478849 ) ) ( not ( = ?auto_1478842 ?auto_1478850 ) ) ( not ( = ?auto_1478842 ?auto_1478851 ) ) ( not ( = ?auto_1478842 ?auto_1478852 ) ) ( not ( = ?auto_1478842 ?auto_1478856 ) ) ( not ( = ?auto_1478839 ?auto_1478843 ) ) ( not ( = ?auto_1478839 ?auto_1478845 ) ) ( not ( = ?auto_1478839 ?auto_1478844 ) ) ( not ( = ?auto_1478839 ?auto_1478846 ) ) ( not ( = ?auto_1478839 ?auto_1478847 ) ) ( not ( = ?auto_1478839 ?auto_1478848 ) ) ( not ( = ?auto_1478839 ?auto_1478849 ) ) ( not ( = ?auto_1478839 ?auto_1478850 ) ) ( not ( = ?auto_1478839 ?auto_1478851 ) ) ( not ( = ?auto_1478839 ?auto_1478852 ) ) ( not ( = ?auto_1478839 ?auto_1478856 ) ) ( not ( = ?auto_1478843 ?auto_1478845 ) ) ( not ( = ?auto_1478843 ?auto_1478844 ) ) ( not ( = ?auto_1478843 ?auto_1478846 ) ) ( not ( = ?auto_1478843 ?auto_1478847 ) ) ( not ( = ?auto_1478843 ?auto_1478848 ) ) ( not ( = ?auto_1478843 ?auto_1478849 ) ) ( not ( = ?auto_1478843 ?auto_1478850 ) ) ( not ( = ?auto_1478843 ?auto_1478851 ) ) ( not ( = ?auto_1478843 ?auto_1478852 ) ) ( not ( = ?auto_1478843 ?auto_1478856 ) ) ( not ( = ?auto_1478845 ?auto_1478844 ) ) ( not ( = ?auto_1478845 ?auto_1478846 ) ) ( not ( = ?auto_1478845 ?auto_1478847 ) ) ( not ( = ?auto_1478845 ?auto_1478848 ) ) ( not ( = ?auto_1478845 ?auto_1478849 ) ) ( not ( = ?auto_1478845 ?auto_1478850 ) ) ( not ( = ?auto_1478845 ?auto_1478851 ) ) ( not ( = ?auto_1478845 ?auto_1478852 ) ) ( not ( = ?auto_1478845 ?auto_1478856 ) ) ( not ( = ?auto_1478844 ?auto_1478846 ) ) ( not ( = ?auto_1478844 ?auto_1478847 ) ) ( not ( = ?auto_1478844 ?auto_1478848 ) ) ( not ( = ?auto_1478844 ?auto_1478849 ) ) ( not ( = ?auto_1478844 ?auto_1478850 ) ) ( not ( = ?auto_1478844 ?auto_1478851 ) ) ( not ( = ?auto_1478844 ?auto_1478852 ) ) ( not ( = ?auto_1478844 ?auto_1478856 ) ) ( not ( = ?auto_1478846 ?auto_1478847 ) ) ( not ( = ?auto_1478846 ?auto_1478848 ) ) ( not ( = ?auto_1478846 ?auto_1478849 ) ) ( not ( = ?auto_1478846 ?auto_1478850 ) ) ( not ( = ?auto_1478846 ?auto_1478851 ) ) ( not ( = ?auto_1478846 ?auto_1478852 ) ) ( not ( = ?auto_1478846 ?auto_1478856 ) ) ( not ( = ?auto_1478847 ?auto_1478848 ) ) ( not ( = ?auto_1478847 ?auto_1478849 ) ) ( not ( = ?auto_1478847 ?auto_1478850 ) ) ( not ( = ?auto_1478847 ?auto_1478851 ) ) ( not ( = ?auto_1478847 ?auto_1478852 ) ) ( not ( = ?auto_1478847 ?auto_1478856 ) ) ( not ( = ?auto_1478848 ?auto_1478849 ) ) ( not ( = ?auto_1478848 ?auto_1478850 ) ) ( not ( = ?auto_1478848 ?auto_1478851 ) ) ( not ( = ?auto_1478848 ?auto_1478852 ) ) ( not ( = ?auto_1478848 ?auto_1478856 ) ) ( not ( = ?auto_1478849 ?auto_1478850 ) ) ( not ( = ?auto_1478849 ?auto_1478851 ) ) ( not ( = ?auto_1478849 ?auto_1478852 ) ) ( not ( = ?auto_1478849 ?auto_1478856 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1478850 ?auto_1478851 ?auto_1478852 )
      ( MAKE-13CRATE-VERIFY ?auto_1478840 ?auto_1478841 ?auto_1478842 ?auto_1478839 ?auto_1478843 ?auto_1478845 ?auto_1478844 ?auto_1478846 ?auto_1478847 ?auto_1478848 ?auto_1478849 ?auto_1478850 ?auto_1478851 ?auto_1478852 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1479023 - SURFACE
      ?auto_1479024 - SURFACE
      ?auto_1479025 - SURFACE
      ?auto_1479022 - SURFACE
      ?auto_1479026 - SURFACE
      ?auto_1479028 - SURFACE
      ?auto_1479027 - SURFACE
      ?auto_1479029 - SURFACE
      ?auto_1479030 - SURFACE
      ?auto_1479031 - SURFACE
      ?auto_1479032 - SURFACE
      ?auto_1479033 - SURFACE
      ?auto_1479034 - SURFACE
      ?auto_1479035 - SURFACE
    )
    :vars
    (
      ?auto_1479038 - HOIST
      ?auto_1479037 - PLACE
      ?auto_1479036 - PLACE
      ?auto_1479041 - HOIST
      ?auto_1479040 - SURFACE
      ?auto_1479039 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1479038 ?auto_1479037 ) ( SURFACE-AT ?auto_1479034 ?auto_1479037 ) ( CLEAR ?auto_1479034 ) ( IS-CRATE ?auto_1479035 ) ( not ( = ?auto_1479034 ?auto_1479035 ) ) ( AVAILABLE ?auto_1479038 ) ( ON ?auto_1479034 ?auto_1479033 ) ( not ( = ?auto_1479033 ?auto_1479034 ) ) ( not ( = ?auto_1479033 ?auto_1479035 ) ) ( not ( = ?auto_1479036 ?auto_1479037 ) ) ( HOIST-AT ?auto_1479041 ?auto_1479036 ) ( not ( = ?auto_1479038 ?auto_1479041 ) ) ( AVAILABLE ?auto_1479041 ) ( SURFACE-AT ?auto_1479035 ?auto_1479036 ) ( ON ?auto_1479035 ?auto_1479040 ) ( CLEAR ?auto_1479035 ) ( not ( = ?auto_1479034 ?auto_1479040 ) ) ( not ( = ?auto_1479035 ?auto_1479040 ) ) ( not ( = ?auto_1479033 ?auto_1479040 ) ) ( TRUCK-AT ?auto_1479039 ?auto_1479037 ) ( ON ?auto_1479024 ?auto_1479023 ) ( ON ?auto_1479025 ?auto_1479024 ) ( ON ?auto_1479022 ?auto_1479025 ) ( ON ?auto_1479026 ?auto_1479022 ) ( ON ?auto_1479028 ?auto_1479026 ) ( ON ?auto_1479027 ?auto_1479028 ) ( ON ?auto_1479029 ?auto_1479027 ) ( ON ?auto_1479030 ?auto_1479029 ) ( ON ?auto_1479031 ?auto_1479030 ) ( ON ?auto_1479032 ?auto_1479031 ) ( ON ?auto_1479033 ?auto_1479032 ) ( not ( = ?auto_1479023 ?auto_1479024 ) ) ( not ( = ?auto_1479023 ?auto_1479025 ) ) ( not ( = ?auto_1479023 ?auto_1479022 ) ) ( not ( = ?auto_1479023 ?auto_1479026 ) ) ( not ( = ?auto_1479023 ?auto_1479028 ) ) ( not ( = ?auto_1479023 ?auto_1479027 ) ) ( not ( = ?auto_1479023 ?auto_1479029 ) ) ( not ( = ?auto_1479023 ?auto_1479030 ) ) ( not ( = ?auto_1479023 ?auto_1479031 ) ) ( not ( = ?auto_1479023 ?auto_1479032 ) ) ( not ( = ?auto_1479023 ?auto_1479033 ) ) ( not ( = ?auto_1479023 ?auto_1479034 ) ) ( not ( = ?auto_1479023 ?auto_1479035 ) ) ( not ( = ?auto_1479023 ?auto_1479040 ) ) ( not ( = ?auto_1479024 ?auto_1479025 ) ) ( not ( = ?auto_1479024 ?auto_1479022 ) ) ( not ( = ?auto_1479024 ?auto_1479026 ) ) ( not ( = ?auto_1479024 ?auto_1479028 ) ) ( not ( = ?auto_1479024 ?auto_1479027 ) ) ( not ( = ?auto_1479024 ?auto_1479029 ) ) ( not ( = ?auto_1479024 ?auto_1479030 ) ) ( not ( = ?auto_1479024 ?auto_1479031 ) ) ( not ( = ?auto_1479024 ?auto_1479032 ) ) ( not ( = ?auto_1479024 ?auto_1479033 ) ) ( not ( = ?auto_1479024 ?auto_1479034 ) ) ( not ( = ?auto_1479024 ?auto_1479035 ) ) ( not ( = ?auto_1479024 ?auto_1479040 ) ) ( not ( = ?auto_1479025 ?auto_1479022 ) ) ( not ( = ?auto_1479025 ?auto_1479026 ) ) ( not ( = ?auto_1479025 ?auto_1479028 ) ) ( not ( = ?auto_1479025 ?auto_1479027 ) ) ( not ( = ?auto_1479025 ?auto_1479029 ) ) ( not ( = ?auto_1479025 ?auto_1479030 ) ) ( not ( = ?auto_1479025 ?auto_1479031 ) ) ( not ( = ?auto_1479025 ?auto_1479032 ) ) ( not ( = ?auto_1479025 ?auto_1479033 ) ) ( not ( = ?auto_1479025 ?auto_1479034 ) ) ( not ( = ?auto_1479025 ?auto_1479035 ) ) ( not ( = ?auto_1479025 ?auto_1479040 ) ) ( not ( = ?auto_1479022 ?auto_1479026 ) ) ( not ( = ?auto_1479022 ?auto_1479028 ) ) ( not ( = ?auto_1479022 ?auto_1479027 ) ) ( not ( = ?auto_1479022 ?auto_1479029 ) ) ( not ( = ?auto_1479022 ?auto_1479030 ) ) ( not ( = ?auto_1479022 ?auto_1479031 ) ) ( not ( = ?auto_1479022 ?auto_1479032 ) ) ( not ( = ?auto_1479022 ?auto_1479033 ) ) ( not ( = ?auto_1479022 ?auto_1479034 ) ) ( not ( = ?auto_1479022 ?auto_1479035 ) ) ( not ( = ?auto_1479022 ?auto_1479040 ) ) ( not ( = ?auto_1479026 ?auto_1479028 ) ) ( not ( = ?auto_1479026 ?auto_1479027 ) ) ( not ( = ?auto_1479026 ?auto_1479029 ) ) ( not ( = ?auto_1479026 ?auto_1479030 ) ) ( not ( = ?auto_1479026 ?auto_1479031 ) ) ( not ( = ?auto_1479026 ?auto_1479032 ) ) ( not ( = ?auto_1479026 ?auto_1479033 ) ) ( not ( = ?auto_1479026 ?auto_1479034 ) ) ( not ( = ?auto_1479026 ?auto_1479035 ) ) ( not ( = ?auto_1479026 ?auto_1479040 ) ) ( not ( = ?auto_1479028 ?auto_1479027 ) ) ( not ( = ?auto_1479028 ?auto_1479029 ) ) ( not ( = ?auto_1479028 ?auto_1479030 ) ) ( not ( = ?auto_1479028 ?auto_1479031 ) ) ( not ( = ?auto_1479028 ?auto_1479032 ) ) ( not ( = ?auto_1479028 ?auto_1479033 ) ) ( not ( = ?auto_1479028 ?auto_1479034 ) ) ( not ( = ?auto_1479028 ?auto_1479035 ) ) ( not ( = ?auto_1479028 ?auto_1479040 ) ) ( not ( = ?auto_1479027 ?auto_1479029 ) ) ( not ( = ?auto_1479027 ?auto_1479030 ) ) ( not ( = ?auto_1479027 ?auto_1479031 ) ) ( not ( = ?auto_1479027 ?auto_1479032 ) ) ( not ( = ?auto_1479027 ?auto_1479033 ) ) ( not ( = ?auto_1479027 ?auto_1479034 ) ) ( not ( = ?auto_1479027 ?auto_1479035 ) ) ( not ( = ?auto_1479027 ?auto_1479040 ) ) ( not ( = ?auto_1479029 ?auto_1479030 ) ) ( not ( = ?auto_1479029 ?auto_1479031 ) ) ( not ( = ?auto_1479029 ?auto_1479032 ) ) ( not ( = ?auto_1479029 ?auto_1479033 ) ) ( not ( = ?auto_1479029 ?auto_1479034 ) ) ( not ( = ?auto_1479029 ?auto_1479035 ) ) ( not ( = ?auto_1479029 ?auto_1479040 ) ) ( not ( = ?auto_1479030 ?auto_1479031 ) ) ( not ( = ?auto_1479030 ?auto_1479032 ) ) ( not ( = ?auto_1479030 ?auto_1479033 ) ) ( not ( = ?auto_1479030 ?auto_1479034 ) ) ( not ( = ?auto_1479030 ?auto_1479035 ) ) ( not ( = ?auto_1479030 ?auto_1479040 ) ) ( not ( = ?auto_1479031 ?auto_1479032 ) ) ( not ( = ?auto_1479031 ?auto_1479033 ) ) ( not ( = ?auto_1479031 ?auto_1479034 ) ) ( not ( = ?auto_1479031 ?auto_1479035 ) ) ( not ( = ?auto_1479031 ?auto_1479040 ) ) ( not ( = ?auto_1479032 ?auto_1479033 ) ) ( not ( = ?auto_1479032 ?auto_1479034 ) ) ( not ( = ?auto_1479032 ?auto_1479035 ) ) ( not ( = ?auto_1479032 ?auto_1479040 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1479033 ?auto_1479034 ?auto_1479035 )
      ( MAKE-13CRATE-VERIFY ?auto_1479023 ?auto_1479024 ?auto_1479025 ?auto_1479022 ?auto_1479026 ?auto_1479028 ?auto_1479027 ?auto_1479029 ?auto_1479030 ?auto_1479031 ?auto_1479032 ?auto_1479033 ?auto_1479034 ?auto_1479035 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1479206 - SURFACE
      ?auto_1479207 - SURFACE
      ?auto_1479208 - SURFACE
      ?auto_1479205 - SURFACE
      ?auto_1479209 - SURFACE
      ?auto_1479211 - SURFACE
      ?auto_1479210 - SURFACE
      ?auto_1479212 - SURFACE
      ?auto_1479213 - SURFACE
      ?auto_1479214 - SURFACE
      ?auto_1479215 - SURFACE
      ?auto_1479216 - SURFACE
      ?auto_1479217 - SURFACE
      ?auto_1479218 - SURFACE
    )
    :vars
    (
      ?auto_1479222 - HOIST
      ?auto_1479223 - PLACE
      ?auto_1479221 - PLACE
      ?auto_1479219 - HOIST
      ?auto_1479220 - SURFACE
      ?auto_1479224 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1479222 ?auto_1479223 ) ( IS-CRATE ?auto_1479218 ) ( not ( = ?auto_1479217 ?auto_1479218 ) ) ( not ( = ?auto_1479216 ?auto_1479217 ) ) ( not ( = ?auto_1479216 ?auto_1479218 ) ) ( not ( = ?auto_1479221 ?auto_1479223 ) ) ( HOIST-AT ?auto_1479219 ?auto_1479221 ) ( not ( = ?auto_1479222 ?auto_1479219 ) ) ( AVAILABLE ?auto_1479219 ) ( SURFACE-AT ?auto_1479218 ?auto_1479221 ) ( ON ?auto_1479218 ?auto_1479220 ) ( CLEAR ?auto_1479218 ) ( not ( = ?auto_1479217 ?auto_1479220 ) ) ( not ( = ?auto_1479218 ?auto_1479220 ) ) ( not ( = ?auto_1479216 ?auto_1479220 ) ) ( TRUCK-AT ?auto_1479224 ?auto_1479223 ) ( SURFACE-AT ?auto_1479216 ?auto_1479223 ) ( CLEAR ?auto_1479216 ) ( LIFTING ?auto_1479222 ?auto_1479217 ) ( IS-CRATE ?auto_1479217 ) ( ON ?auto_1479207 ?auto_1479206 ) ( ON ?auto_1479208 ?auto_1479207 ) ( ON ?auto_1479205 ?auto_1479208 ) ( ON ?auto_1479209 ?auto_1479205 ) ( ON ?auto_1479211 ?auto_1479209 ) ( ON ?auto_1479210 ?auto_1479211 ) ( ON ?auto_1479212 ?auto_1479210 ) ( ON ?auto_1479213 ?auto_1479212 ) ( ON ?auto_1479214 ?auto_1479213 ) ( ON ?auto_1479215 ?auto_1479214 ) ( ON ?auto_1479216 ?auto_1479215 ) ( not ( = ?auto_1479206 ?auto_1479207 ) ) ( not ( = ?auto_1479206 ?auto_1479208 ) ) ( not ( = ?auto_1479206 ?auto_1479205 ) ) ( not ( = ?auto_1479206 ?auto_1479209 ) ) ( not ( = ?auto_1479206 ?auto_1479211 ) ) ( not ( = ?auto_1479206 ?auto_1479210 ) ) ( not ( = ?auto_1479206 ?auto_1479212 ) ) ( not ( = ?auto_1479206 ?auto_1479213 ) ) ( not ( = ?auto_1479206 ?auto_1479214 ) ) ( not ( = ?auto_1479206 ?auto_1479215 ) ) ( not ( = ?auto_1479206 ?auto_1479216 ) ) ( not ( = ?auto_1479206 ?auto_1479217 ) ) ( not ( = ?auto_1479206 ?auto_1479218 ) ) ( not ( = ?auto_1479206 ?auto_1479220 ) ) ( not ( = ?auto_1479207 ?auto_1479208 ) ) ( not ( = ?auto_1479207 ?auto_1479205 ) ) ( not ( = ?auto_1479207 ?auto_1479209 ) ) ( not ( = ?auto_1479207 ?auto_1479211 ) ) ( not ( = ?auto_1479207 ?auto_1479210 ) ) ( not ( = ?auto_1479207 ?auto_1479212 ) ) ( not ( = ?auto_1479207 ?auto_1479213 ) ) ( not ( = ?auto_1479207 ?auto_1479214 ) ) ( not ( = ?auto_1479207 ?auto_1479215 ) ) ( not ( = ?auto_1479207 ?auto_1479216 ) ) ( not ( = ?auto_1479207 ?auto_1479217 ) ) ( not ( = ?auto_1479207 ?auto_1479218 ) ) ( not ( = ?auto_1479207 ?auto_1479220 ) ) ( not ( = ?auto_1479208 ?auto_1479205 ) ) ( not ( = ?auto_1479208 ?auto_1479209 ) ) ( not ( = ?auto_1479208 ?auto_1479211 ) ) ( not ( = ?auto_1479208 ?auto_1479210 ) ) ( not ( = ?auto_1479208 ?auto_1479212 ) ) ( not ( = ?auto_1479208 ?auto_1479213 ) ) ( not ( = ?auto_1479208 ?auto_1479214 ) ) ( not ( = ?auto_1479208 ?auto_1479215 ) ) ( not ( = ?auto_1479208 ?auto_1479216 ) ) ( not ( = ?auto_1479208 ?auto_1479217 ) ) ( not ( = ?auto_1479208 ?auto_1479218 ) ) ( not ( = ?auto_1479208 ?auto_1479220 ) ) ( not ( = ?auto_1479205 ?auto_1479209 ) ) ( not ( = ?auto_1479205 ?auto_1479211 ) ) ( not ( = ?auto_1479205 ?auto_1479210 ) ) ( not ( = ?auto_1479205 ?auto_1479212 ) ) ( not ( = ?auto_1479205 ?auto_1479213 ) ) ( not ( = ?auto_1479205 ?auto_1479214 ) ) ( not ( = ?auto_1479205 ?auto_1479215 ) ) ( not ( = ?auto_1479205 ?auto_1479216 ) ) ( not ( = ?auto_1479205 ?auto_1479217 ) ) ( not ( = ?auto_1479205 ?auto_1479218 ) ) ( not ( = ?auto_1479205 ?auto_1479220 ) ) ( not ( = ?auto_1479209 ?auto_1479211 ) ) ( not ( = ?auto_1479209 ?auto_1479210 ) ) ( not ( = ?auto_1479209 ?auto_1479212 ) ) ( not ( = ?auto_1479209 ?auto_1479213 ) ) ( not ( = ?auto_1479209 ?auto_1479214 ) ) ( not ( = ?auto_1479209 ?auto_1479215 ) ) ( not ( = ?auto_1479209 ?auto_1479216 ) ) ( not ( = ?auto_1479209 ?auto_1479217 ) ) ( not ( = ?auto_1479209 ?auto_1479218 ) ) ( not ( = ?auto_1479209 ?auto_1479220 ) ) ( not ( = ?auto_1479211 ?auto_1479210 ) ) ( not ( = ?auto_1479211 ?auto_1479212 ) ) ( not ( = ?auto_1479211 ?auto_1479213 ) ) ( not ( = ?auto_1479211 ?auto_1479214 ) ) ( not ( = ?auto_1479211 ?auto_1479215 ) ) ( not ( = ?auto_1479211 ?auto_1479216 ) ) ( not ( = ?auto_1479211 ?auto_1479217 ) ) ( not ( = ?auto_1479211 ?auto_1479218 ) ) ( not ( = ?auto_1479211 ?auto_1479220 ) ) ( not ( = ?auto_1479210 ?auto_1479212 ) ) ( not ( = ?auto_1479210 ?auto_1479213 ) ) ( not ( = ?auto_1479210 ?auto_1479214 ) ) ( not ( = ?auto_1479210 ?auto_1479215 ) ) ( not ( = ?auto_1479210 ?auto_1479216 ) ) ( not ( = ?auto_1479210 ?auto_1479217 ) ) ( not ( = ?auto_1479210 ?auto_1479218 ) ) ( not ( = ?auto_1479210 ?auto_1479220 ) ) ( not ( = ?auto_1479212 ?auto_1479213 ) ) ( not ( = ?auto_1479212 ?auto_1479214 ) ) ( not ( = ?auto_1479212 ?auto_1479215 ) ) ( not ( = ?auto_1479212 ?auto_1479216 ) ) ( not ( = ?auto_1479212 ?auto_1479217 ) ) ( not ( = ?auto_1479212 ?auto_1479218 ) ) ( not ( = ?auto_1479212 ?auto_1479220 ) ) ( not ( = ?auto_1479213 ?auto_1479214 ) ) ( not ( = ?auto_1479213 ?auto_1479215 ) ) ( not ( = ?auto_1479213 ?auto_1479216 ) ) ( not ( = ?auto_1479213 ?auto_1479217 ) ) ( not ( = ?auto_1479213 ?auto_1479218 ) ) ( not ( = ?auto_1479213 ?auto_1479220 ) ) ( not ( = ?auto_1479214 ?auto_1479215 ) ) ( not ( = ?auto_1479214 ?auto_1479216 ) ) ( not ( = ?auto_1479214 ?auto_1479217 ) ) ( not ( = ?auto_1479214 ?auto_1479218 ) ) ( not ( = ?auto_1479214 ?auto_1479220 ) ) ( not ( = ?auto_1479215 ?auto_1479216 ) ) ( not ( = ?auto_1479215 ?auto_1479217 ) ) ( not ( = ?auto_1479215 ?auto_1479218 ) ) ( not ( = ?auto_1479215 ?auto_1479220 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1479216 ?auto_1479217 ?auto_1479218 )
      ( MAKE-13CRATE-VERIFY ?auto_1479206 ?auto_1479207 ?auto_1479208 ?auto_1479205 ?auto_1479209 ?auto_1479211 ?auto_1479210 ?auto_1479212 ?auto_1479213 ?auto_1479214 ?auto_1479215 ?auto_1479216 ?auto_1479217 ?auto_1479218 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1479389 - SURFACE
      ?auto_1479390 - SURFACE
      ?auto_1479391 - SURFACE
      ?auto_1479388 - SURFACE
      ?auto_1479392 - SURFACE
      ?auto_1479394 - SURFACE
      ?auto_1479393 - SURFACE
      ?auto_1479395 - SURFACE
      ?auto_1479396 - SURFACE
      ?auto_1479397 - SURFACE
      ?auto_1479398 - SURFACE
      ?auto_1479399 - SURFACE
      ?auto_1479400 - SURFACE
      ?auto_1479401 - SURFACE
    )
    :vars
    (
      ?auto_1479405 - HOIST
      ?auto_1479402 - PLACE
      ?auto_1479406 - PLACE
      ?auto_1479403 - HOIST
      ?auto_1479404 - SURFACE
      ?auto_1479407 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1479405 ?auto_1479402 ) ( IS-CRATE ?auto_1479401 ) ( not ( = ?auto_1479400 ?auto_1479401 ) ) ( not ( = ?auto_1479399 ?auto_1479400 ) ) ( not ( = ?auto_1479399 ?auto_1479401 ) ) ( not ( = ?auto_1479406 ?auto_1479402 ) ) ( HOIST-AT ?auto_1479403 ?auto_1479406 ) ( not ( = ?auto_1479405 ?auto_1479403 ) ) ( AVAILABLE ?auto_1479403 ) ( SURFACE-AT ?auto_1479401 ?auto_1479406 ) ( ON ?auto_1479401 ?auto_1479404 ) ( CLEAR ?auto_1479401 ) ( not ( = ?auto_1479400 ?auto_1479404 ) ) ( not ( = ?auto_1479401 ?auto_1479404 ) ) ( not ( = ?auto_1479399 ?auto_1479404 ) ) ( TRUCK-AT ?auto_1479407 ?auto_1479402 ) ( SURFACE-AT ?auto_1479399 ?auto_1479402 ) ( CLEAR ?auto_1479399 ) ( IS-CRATE ?auto_1479400 ) ( AVAILABLE ?auto_1479405 ) ( IN ?auto_1479400 ?auto_1479407 ) ( ON ?auto_1479390 ?auto_1479389 ) ( ON ?auto_1479391 ?auto_1479390 ) ( ON ?auto_1479388 ?auto_1479391 ) ( ON ?auto_1479392 ?auto_1479388 ) ( ON ?auto_1479394 ?auto_1479392 ) ( ON ?auto_1479393 ?auto_1479394 ) ( ON ?auto_1479395 ?auto_1479393 ) ( ON ?auto_1479396 ?auto_1479395 ) ( ON ?auto_1479397 ?auto_1479396 ) ( ON ?auto_1479398 ?auto_1479397 ) ( ON ?auto_1479399 ?auto_1479398 ) ( not ( = ?auto_1479389 ?auto_1479390 ) ) ( not ( = ?auto_1479389 ?auto_1479391 ) ) ( not ( = ?auto_1479389 ?auto_1479388 ) ) ( not ( = ?auto_1479389 ?auto_1479392 ) ) ( not ( = ?auto_1479389 ?auto_1479394 ) ) ( not ( = ?auto_1479389 ?auto_1479393 ) ) ( not ( = ?auto_1479389 ?auto_1479395 ) ) ( not ( = ?auto_1479389 ?auto_1479396 ) ) ( not ( = ?auto_1479389 ?auto_1479397 ) ) ( not ( = ?auto_1479389 ?auto_1479398 ) ) ( not ( = ?auto_1479389 ?auto_1479399 ) ) ( not ( = ?auto_1479389 ?auto_1479400 ) ) ( not ( = ?auto_1479389 ?auto_1479401 ) ) ( not ( = ?auto_1479389 ?auto_1479404 ) ) ( not ( = ?auto_1479390 ?auto_1479391 ) ) ( not ( = ?auto_1479390 ?auto_1479388 ) ) ( not ( = ?auto_1479390 ?auto_1479392 ) ) ( not ( = ?auto_1479390 ?auto_1479394 ) ) ( not ( = ?auto_1479390 ?auto_1479393 ) ) ( not ( = ?auto_1479390 ?auto_1479395 ) ) ( not ( = ?auto_1479390 ?auto_1479396 ) ) ( not ( = ?auto_1479390 ?auto_1479397 ) ) ( not ( = ?auto_1479390 ?auto_1479398 ) ) ( not ( = ?auto_1479390 ?auto_1479399 ) ) ( not ( = ?auto_1479390 ?auto_1479400 ) ) ( not ( = ?auto_1479390 ?auto_1479401 ) ) ( not ( = ?auto_1479390 ?auto_1479404 ) ) ( not ( = ?auto_1479391 ?auto_1479388 ) ) ( not ( = ?auto_1479391 ?auto_1479392 ) ) ( not ( = ?auto_1479391 ?auto_1479394 ) ) ( not ( = ?auto_1479391 ?auto_1479393 ) ) ( not ( = ?auto_1479391 ?auto_1479395 ) ) ( not ( = ?auto_1479391 ?auto_1479396 ) ) ( not ( = ?auto_1479391 ?auto_1479397 ) ) ( not ( = ?auto_1479391 ?auto_1479398 ) ) ( not ( = ?auto_1479391 ?auto_1479399 ) ) ( not ( = ?auto_1479391 ?auto_1479400 ) ) ( not ( = ?auto_1479391 ?auto_1479401 ) ) ( not ( = ?auto_1479391 ?auto_1479404 ) ) ( not ( = ?auto_1479388 ?auto_1479392 ) ) ( not ( = ?auto_1479388 ?auto_1479394 ) ) ( not ( = ?auto_1479388 ?auto_1479393 ) ) ( not ( = ?auto_1479388 ?auto_1479395 ) ) ( not ( = ?auto_1479388 ?auto_1479396 ) ) ( not ( = ?auto_1479388 ?auto_1479397 ) ) ( not ( = ?auto_1479388 ?auto_1479398 ) ) ( not ( = ?auto_1479388 ?auto_1479399 ) ) ( not ( = ?auto_1479388 ?auto_1479400 ) ) ( not ( = ?auto_1479388 ?auto_1479401 ) ) ( not ( = ?auto_1479388 ?auto_1479404 ) ) ( not ( = ?auto_1479392 ?auto_1479394 ) ) ( not ( = ?auto_1479392 ?auto_1479393 ) ) ( not ( = ?auto_1479392 ?auto_1479395 ) ) ( not ( = ?auto_1479392 ?auto_1479396 ) ) ( not ( = ?auto_1479392 ?auto_1479397 ) ) ( not ( = ?auto_1479392 ?auto_1479398 ) ) ( not ( = ?auto_1479392 ?auto_1479399 ) ) ( not ( = ?auto_1479392 ?auto_1479400 ) ) ( not ( = ?auto_1479392 ?auto_1479401 ) ) ( not ( = ?auto_1479392 ?auto_1479404 ) ) ( not ( = ?auto_1479394 ?auto_1479393 ) ) ( not ( = ?auto_1479394 ?auto_1479395 ) ) ( not ( = ?auto_1479394 ?auto_1479396 ) ) ( not ( = ?auto_1479394 ?auto_1479397 ) ) ( not ( = ?auto_1479394 ?auto_1479398 ) ) ( not ( = ?auto_1479394 ?auto_1479399 ) ) ( not ( = ?auto_1479394 ?auto_1479400 ) ) ( not ( = ?auto_1479394 ?auto_1479401 ) ) ( not ( = ?auto_1479394 ?auto_1479404 ) ) ( not ( = ?auto_1479393 ?auto_1479395 ) ) ( not ( = ?auto_1479393 ?auto_1479396 ) ) ( not ( = ?auto_1479393 ?auto_1479397 ) ) ( not ( = ?auto_1479393 ?auto_1479398 ) ) ( not ( = ?auto_1479393 ?auto_1479399 ) ) ( not ( = ?auto_1479393 ?auto_1479400 ) ) ( not ( = ?auto_1479393 ?auto_1479401 ) ) ( not ( = ?auto_1479393 ?auto_1479404 ) ) ( not ( = ?auto_1479395 ?auto_1479396 ) ) ( not ( = ?auto_1479395 ?auto_1479397 ) ) ( not ( = ?auto_1479395 ?auto_1479398 ) ) ( not ( = ?auto_1479395 ?auto_1479399 ) ) ( not ( = ?auto_1479395 ?auto_1479400 ) ) ( not ( = ?auto_1479395 ?auto_1479401 ) ) ( not ( = ?auto_1479395 ?auto_1479404 ) ) ( not ( = ?auto_1479396 ?auto_1479397 ) ) ( not ( = ?auto_1479396 ?auto_1479398 ) ) ( not ( = ?auto_1479396 ?auto_1479399 ) ) ( not ( = ?auto_1479396 ?auto_1479400 ) ) ( not ( = ?auto_1479396 ?auto_1479401 ) ) ( not ( = ?auto_1479396 ?auto_1479404 ) ) ( not ( = ?auto_1479397 ?auto_1479398 ) ) ( not ( = ?auto_1479397 ?auto_1479399 ) ) ( not ( = ?auto_1479397 ?auto_1479400 ) ) ( not ( = ?auto_1479397 ?auto_1479401 ) ) ( not ( = ?auto_1479397 ?auto_1479404 ) ) ( not ( = ?auto_1479398 ?auto_1479399 ) ) ( not ( = ?auto_1479398 ?auto_1479400 ) ) ( not ( = ?auto_1479398 ?auto_1479401 ) ) ( not ( = ?auto_1479398 ?auto_1479404 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1479399 ?auto_1479400 ?auto_1479401 )
      ( MAKE-13CRATE-VERIFY ?auto_1479389 ?auto_1479390 ?auto_1479391 ?auto_1479388 ?auto_1479392 ?auto_1479394 ?auto_1479393 ?auto_1479395 ?auto_1479396 ?auto_1479397 ?auto_1479398 ?auto_1479399 ?auto_1479400 ?auto_1479401 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1493600 - SURFACE
      ?auto_1493601 - SURFACE
      ?auto_1493602 - SURFACE
      ?auto_1493599 - SURFACE
      ?auto_1493603 - SURFACE
      ?auto_1493605 - SURFACE
      ?auto_1493604 - SURFACE
      ?auto_1493606 - SURFACE
      ?auto_1493607 - SURFACE
      ?auto_1493608 - SURFACE
      ?auto_1493609 - SURFACE
      ?auto_1493610 - SURFACE
      ?auto_1493611 - SURFACE
      ?auto_1493612 - SURFACE
      ?auto_1493613 - SURFACE
    )
    :vars
    (
      ?auto_1493614 - HOIST
      ?auto_1493615 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1493614 ?auto_1493615 ) ( SURFACE-AT ?auto_1493612 ?auto_1493615 ) ( CLEAR ?auto_1493612 ) ( LIFTING ?auto_1493614 ?auto_1493613 ) ( IS-CRATE ?auto_1493613 ) ( not ( = ?auto_1493612 ?auto_1493613 ) ) ( ON ?auto_1493601 ?auto_1493600 ) ( ON ?auto_1493602 ?auto_1493601 ) ( ON ?auto_1493599 ?auto_1493602 ) ( ON ?auto_1493603 ?auto_1493599 ) ( ON ?auto_1493605 ?auto_1493603 ) ( ON ?auto_1493604 ?auto_1493605 ) ( ON ?auto_1493606 ?auto_1493604 ) ( ON ?auto_1493607 ?auto_1493606 ) ( ON ?auto_1493608 ?auto_1493607 ) ( ON ?auto_1493609 ?auto_1493608 ) ( ON ?auto_1493610 ?auto_1493609 ) ( ON ?auto_1493611 ?auto_1493610 ) ( ON ?auto_1493612 ?auto_1493611 ) ( not ( = ?auto_1493600 ?auto_1493601 ) ) ( not ( = ?auto_1493600 ?auto_1493602 ) ) ( not ( = ?auto_1493600 ?auto_1493599 ) ) ( not ( = ?auto_1493600 ?auto_1493603 ) ) ( not ( = ?auto_1493600 ?auto_1493605 ) ) ( not ( = ?auto_1493600 ?auto_1493604 ) ) ( not ( = ?auto_1493600 ?auto_1493606 ) ) ( not ( = ?auto_1493600 ?auto_1493607 ) ) ( not ( = ?auto_1493600 ?auto_1493608 ) ) ( not ( = ?auto_1493600 ?auto_1493609 ) ) ( not ( = ?auto_1493600 ?auto_1493610 ) ) ( not ( = ?auto_1493600 ?auto_1493611 ) ) ( not ( = ?auto_1493600 ?auto_1493612 ) ) ( not ( = ?auto_1493600 ?auto_1493613 ) ) ( not ( = ?auto_1493601 ?auto_1493602 ) ) ( not ( = ?auto_1493601 ?auto_1493599 ) ) ( not ( = ?auto_1493601 ?auto_1493603 ) ) ( not ( = ?auto_1493601 ?auto_1493605 ) ) ( not ( = ?auto_1493601 ?auto_1493604 ) ) ( not ( = ?auto_1493601 ?auto_1493606 ) ) ( not ( = ?auto_1493601 ?auto_1493607 ) ) ( not ( = ?auto_1493601 ?auto_1493608 ) ) ( not ( = ?auto_1493601 ?auto_1493609 ) ) ( not ( = ?auto_1493601 ?auto_1493610 ) ) ( not ( = ?auto_1493601 ?auto_1493611 ) ) ( not ( = ?auto_1493601 ?auto_1493612 ) ) ( not ( = ?auto_1493601 ?auto_1493613 ) ) ( not ( = ?auto_1493602 ?auto_1493599 ) ) ( not ( = ?auto_1493602 ?auto_1493603 ) ) ( not ( = ?auto_1493602 ?auto_1493605 ) ) ( not ( = ?auto_1493602 ?auto_1493604 ) ) ( not ( = ?auto_1493602 ?auto_1493606 ) ) ( not ( = ?auto_1493602 ?auto_1493607 ) ) ( not ( = ?auto_1493602 ?auto_1493608 ) ) ( not ( = ?auto_1493602 ?auto_1493609 ) ) ( not ( = ?auto_1493602 ?auto_1493610 ) ) ( not ( = ?auto_1493602 ?auto_1493611 ) ) ( not ( = ?auto_1493602 ?auto_1493612 ) ) ( not ( = ?auto_1493602 ?auto_1493613 ) ) ( not ( = ?auto_1493599 ?auto_1493603 ) ) ( not ( = ?auto_1493599 ?auto_1493605 ) ) ( not ( = ?auto_1493599 ?auto_1493604 ) ) ( not ( = ?auto_1493599 ?auto_1493606 ) ) ( not ( = ?auto_1493599 ?auto_1493607 ) ) ( not ( = ?auto_1493599 ?auto_1493608 ) ) ( not ( = ?auto_1493599 ?auto_1493609 ) ) ( not ( = ?auto_1493599 ?auto_1493610 ) ) ( not ( = ?auto_1493599 ?auto_1493611 ) ) ( not ( = ?auto_1493599 ?auto_1493612 ) ) ( not ( = ?auto_1493599 ?auto_1493613 ) ) ( not ( = ?auto_1493603 ?auto_1493605 ) ) ( not ( = ?auto_1493603 ?auto_1493604 ) ) ( not ( = ?auto_1493603 ?auto_1493606 ) ) ( not ( = ?auto_1493603 ?auto_1493607 ) ) ( not ( = ?auto_1493603 ?auto_1493608 ) ) ( not ( = ?auto_1493603 ?auto_1493609 ) ) ( not ( = ?auto_1493603 ?auto_1493610 ) ) ( not ( = ?auto_1493603 ?auto_1493611 ) ) ( not ( = ?auto_1493603 ?auto_1493612 ) ) ( not ( = ?auto_1493603 ?auto_1493613 ) ) ( not ( = ?auto_1493605 ?auto_1493604 ) ) ( not ( = ?auto_1493605 ?auto_1493606 ) ) ( not ( = ?auto_1493605 ?auto_1493607 ) ) ( not ( = ?auto_1493605 ?auto_1493608 ) ) ( not ( = ?auto_1493605 ?auto_1493609 ) ) ( not ( = ?auto_1493605 ?auto_1493610 ) ) ( not ( = ?auto_1493605 ?auto_1493611 ) ) ( not ( = ?auto_1493605 ?auto_1493612 ) ) ( not ( = ?auto_1493605 ?auto_1493613 ) ) ( not ( = ?auto_1493604 ?auto_1493606 ) ) ( not ( = ?auto_1493604 ?auto_1493607 ) ) ( not ( = ?auto_1493604 ?auto_1493608 ) ) ( not ( = ?auto_1493604 ?auto_1493609 ) ) ( not ( = ?auto_1493604 ?auto_1493610 ) ) ( not ( = ?auto_1493604 ?auto_1493611 ) ) ( not ( = ?auto_1493604 ?auto_1493612 ) ) ( not ( = ?auto_1493604 ?auto_1493613 ) ) ( not ( = ?auto_1493606 ?auto_1493607 ) ) ( not ( = ?auto_1493606 ?auto_1493608 ) ) ( not ( = ?auto_1493606 ?auto_1493609 ) ) ( not ( = ?auto_1493606 ?auto_1493610 ) ) ( not ( = ?auto_1493606 ?auto_1493611 ) ) ( not ( = ?auto_1493606 ?auto_1493612 ) ) ( not ( = ?auto_1493606 ?auto_1493613 ) ) ( not ( = ?auto_1493607 ?auto_1493608 ) ) ( not ( = ?auto_1493607 ?auto_1493609 ) ) ( not ( = ?auto_1493607 ?auto_1493610 ) ) ( not ( = ?auto_1493607 ?auto_1493611 ) ) ( not ( = ?auto_1493607 ?auto_1493612 ) ) ( not ( = ?auto_1493607 ?auto_1493613 ) ) ( not ( = ?auto_1493608 ?auto_1493609 ) ) ( not ( = ?auto_1493608 ?auto_1493610 ) ) ( not ( = ?auto_1493608 ?auto_1493611 ) ) ( not ( = ?auto_1493608 ?auto_1493612 ) ) ( not ( = ?auto_1493608 ?auto_1493613 ) ) ( not ( = ?auto_1493609 ?auto_1493610 ) ) ( not ( = ?auto_1493609 ?auto_1493611 ) ) ( not ( = ?auto_1493609 ?auto_1493612 ) ) ( not ( = ?auto_1493609 ?auto_1493613 ) ) ( not ( = ?auto_1493610 ?auto_1493611 ) ) ( not ( = ?auto_1493610 ?auto_1493612 ) ) ( not ( = ?auto_1493610 ?auto_1493613 ) ) ( not ( = ?auto_1493611 ?auto_1493612 ) ) ( not ( = ?auto_1493611 ?auto_1493613 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1493612 ?auto_1493613 )
      ( MAKE-14CRATE-VERIFY ?auto_1493600 ?auto_1493601 ?auto_1493602 ?auto_1493599 ?auto_1493603 ?auto_1493605 ?auto_1493604 ?auto_1493606 ?auto_1493607 ?auto_1493608 ?auto_1493609 ?auto_1493610 ?auto_1493611 ?auto_1493612 ?auto_1493613 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1493760 - SURFACE
      ?auto_1493761 - SURFACE
      ?auto_1493762 - SURFACE
      ?auto_1493759 - SURFACE
      ?auto_1493763 - SURFACE
      ?auto_1493765 - SURFACE
      ?auto_1493764 - SURFACE
      ?auto_1493766 - SURFACE
      ?auto_1493767 - SURFACE
      ?auto_1493768 - SURFACE
      ?auto_1493769 - SURFACE
      ?auto_1493770 - SURFACE
      ?auto_1493771 - SURFACE
      ?auto_1493772 - SURFACE
      ?auto_1493773 - SURFACE
    )
    :vars
    (
      ?auto_1493776 - HOIST
      ?auto_1493775 - PLACE
      ?auto_1493774 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1493776 ?auto_1493775 ) ( SURFACE-AT ?auto_1493772 ?auto_1493775 ) ( CLEAR ?auto_1493772 ) ( IS-CRATE ?auto_1493773 ) ( not ( = ?auto_1493772 ?auto_1493773 ) ) ( TRUCK-AT ?auto_1493774 ?auto_1493775 ) ( AVAILABLE ?auto_1493776 ) ( IN ?auto_1493773 ?auto_1493774 ) ( ON ?auto_1493772 ?auto_1493771 ) ( not ( = ?auto_1493771 ?auto_1493772 ) ) ( not ( = ?auto_1493771 ?auto_1493773 ) ) ( ON ?auto_1493761 ?auto_1493760 ) ( ON ?auto_1493762 ?auto_1493761 ) ( ON ?auto_1493759 ?auto_1493762 ) ( ON ?auto_1493763 ?auto_1493759 ) ( ON ?auto_1493765 ?auto_1493763 ) ( ON ?auto_1493764 ?auto_1493765 ) ( ON ?auto_1493766 ?auto_1493764 ) ( ON ?auto_1493767 ?auto_1493766 ) ( ON ?auto_1493768 ?auto_1493767 ) ( ON ?auto_1493769 ?auto_1493768 ) ( ON ?auto_1493770 ?auto_1493769 ) ( ON ?auto_1493771 ?auto_1493770 ) ( not ( = ?auto_1493760 ?auto_1493761 ) ) ( not ( = ?auto_1493760 ?auto_1493762 ) ) ( not ( = ?auto_1493760 ?auto_1493759 ) ) ( not ( = ?auto_1493760 ?auto_1493763 ) ) ( not ( = ?auto_1493760 ?auto_1493765 ) ) ( not ( = ?auto_1493760 ?auto_1493764 ) ) ( not ( = ?auto_1493760 ?auto_1493766 ) ) ( not ( = ?auto_1493760 ?auto_1493767 ) ) ( not ( = ?auto_1493760 ?auto_1493768 ) ) ( not ( = ?auto_1493760 ?auto_1493769 ) ) ( not ( = ?auto_1493760 ?auto_1493770 ) ) ( not ( = ?auto_1493760 ?auto_1493771 ) ) ( not ( = ?auto_1493760 ?auto_1493772 ) ) ( not ( = ?auto_1493760 ?auto_1493773 ) ) ( not ( = ?auto_1493761 ?auto_1493762 ) ) ( not ( = ?auto_1493761 ?auto_1493759 ) ) ( not ( = ?auto_1493761 ?auto_1493763 ) ) ( not ( = ?auto_1493761 ?auto_1493765 ) ) ( not ( = ?auto_1493761 ?auto_1493764 ) ) ( not ( = ?auto_1493761 ?auto_1493766 ) ) ( not ( = ?auto_1493761 ?auto_1493767 ) ) ( not ( = ?auto_1493761 ?auto_1493768 ) ) ( not ( = ?auto_1493761 ?auto_1493769 ) ) ( not ( = ?auto_1493761 ?auto_1493770 ) ) ( not ( = ?auto_1493761 ?auto_1493771 ) ) ( not ( = ?auto_1493761 ?auto_1493772 ) ) ( not ( = ?auto_1493761 ?auto_1493773 ) ) ( not ( = ?auto_1493762 ?auto_1493759 ) ) ( not ( = ?auto_1493762 ?auto_1493763 ) ) ( not ( = ?auto_1493762 ?auto_1493765 ) ) ( not ( = ?auto_1493762 ?auto_1493764 ) ) ( not ( = ?auto_1493762 ?auto_1493766 ) ) ( not ( = ?auto_1493762 ?auto_1493767 ) ) ( not ( = ?auto_1493762 ?auto_1493768 ) ) ( not ( = ?auto_1493762 ?auto_1493769 ) ) ( not ( = ?auto_1493762 ?auto_1493770 ) ) ( not ( = ?auto_1493762 ?auto_1493771 ) ) ( not ( = ?auto_1493762 ?auto_1493772 ) ) ( not ( = ?auto_1493762 ?auto_1493773 ) ) ( not ( = ?auto_1493759 ?auto_1493763 ) ) ( not ( = ?auto_1493759 ?auto_1493765 ) ) ( not ( = ?auto_1493759 ?auto_1493764 ) ) ( not ( = ?auto_1493759 ?auto_1493766 ) ) ( not ( = ?auto_1493759 ?auto_1493767 ) ) ( not ( = ?auto_1493759 ?auto_1493768 ) ) ( not ( = ?auto_1493759 ?auto_1493769 ) ) ( not ( = ?auto_1493759 ?auto_1493770 ) ) ( not ( = ?auto_1493759 ?auto_1493771 ) ) ( not ( = ?auto_1493759 ?auto_1493772 ) ) ( not ( = ?auto_1493759 ?auto_1493773 ) ) ( not ( = ?auto_1493763 ?auto_1493765 ) ) ( not ( = ?auto_1493763 ?auto_1493764 ) ) ( not ( = ?auto_1493763 ?auto_1493766 ) ) ( not ( = ?auto_1493763 ?auto_1493767 ) ) ( not ( = ?auto_1493763 ?auto_1493768 ) ) ( not ( = ?auto_1493763 ?auto_1493769 ) ) ( not ( = ?auto_1493763 ?auto_1493770 ) ) ( not ( = ?auto_1493763 ?auto_1493771 ) ) ( not ( = ?auto_1493763 ?auto_1493772 ) ) ( not ( = ?auto_1493763 ?auto_1493773 ) ) ( not ( = ?auto_1493765 ?auto_1493764 ) ) ( not ( = ?auto_1493765 ?auto_1493766 ) ) ( not ( = ?auto_1493765 ?auto_1493767 ) ) ( not ( = ?auto_1493765 ?auto_1493768 ) ) ( not ( = ?auto_1493765 ?auto_1493769 ) ) ( not ( = ?auto_1493765 ?auto_1493770 ) ) ( not ( = ?auto_1493765 ?auto_1493771 ) ) ( not ( = ?auto_1493765 ?auto_1493772 ) ) ( not ( = ?auto_1493765 ?auto_1493773 ) ) ( not ( = ?auto_1493764 ?auto_1493766 ) ) ( not ( = ?auto_1493764 ?auto_1493767 ) ) ( not ( = ?auto_1493764 ?auto_1493768 ) ) ( not ( = ?auto_1493764 ?auto_1493769 ) ) ( not ( = ?auto_1493764 ?auto_1493770 ) ) ( not ( = ?auto_1493764 ?auto_1493771 ) ) ( not ( = ?auto_1493764 ?auto_1493772 ) ) ( not ( = ?auto_1493764 ?auto_1493773 ) ) ( not ( = ?auto_1493766 ?auto_1493767 ) ) ( not ( = ?auto_1493766 ?auto_1493768 ) ) ( not ( = ?auto_1493766 ?auto_1493769 ) ) ( not ( = ?auto_1493766 ?auto_1493770 ) ) ( not ( = ?auto_1493766 ?auto_1493771 ) ) ( not ( = ?auto_1493766 ?auto_1493772 ) ) ( not ( = ?auto_1493766 ?auto_1493773 ) ) ( not ( = ?auto_1493767 ?auto_1493768 ) ) ( not ( = ?auto_1493767 ?auto_1493769 ) ) ( not ( = ?auto_1493767 ?auto_1493770 ) ) ( not ( = ?auto_1493767 ?auto_1493771 ) ) ( not ( = ?auto_1493767 ?auto_1493772 ) ) ( not ( = ?auto_1493767 ?auto_1493773 ) ) ( not ( = ?auto_1493768 ?auto_1493769 ) ) ( not ( = ?auto_1493768 ?auto_1493770 ) ) ( not ( = ?auto_1493768 ?auto_1493771 ) ) ( not ( = ?auto_1493768 ?auto_1493772 ) ) ( not ( = ?auto_1493768 ?auto_1493773 ) ) ( not ( = ?auto_1493769 ?auto_1493770 ) ) ( not ( = ?auto_1493769 ?auto_1493771 ) ) ( not ( = ?auto_1493769 ?auto_1493772 ) ) ( not ( = ?auto_1493769 ?auto_1493773 ) ) ( not ( = ?auto_1493770 ?auto_1493771 ) ) ( not ( = ?auto_1493770 ?auto_1493772 ) ) ( not ( = ?auto_1493770 ?auto_1493773 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1493771 ?auto_1493772 ?auto_1493773 )
      ( MAKE-14CRATE-VERIFY ?auto_1493760 ?auto_1493761 ?auto_1493762 ?auto_1493759 ?auto_1493763 ?auto_1493765 ?auto_1493764 ?auto_1493766 ?auto_1493767 ?auto_1493768 ?auto_1493769 ?auto_1493770 ?auto_1493771 ?auto_1493772 ?auto_1493773 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1493935 - SURFACE
      ?auto_1493936 - SURFACE
      ?auto_1493937 - SURFACE
      ?auto_1493934 - SURFACE
      ?auto_1493938 - SURFACE
      ?auto_1493940 - SURFACE
      ?auto_1493939 - SURFACE
      ?auto_1493941 - SURFACE
      ?auto_1493942 - SURFACE
      ?auto_1493943 - SURFACE
      ?auto_1493944 - SURFACE
      ?auto_1493945 - SURFACE
      ?auto_1493946 - SURFACE
      ?auto_1493947 - SURFACE
      ?auto_1493948 - SURFACE
    )
    :vars
    (
      ?auto_1493949 - HOIST
      ?auto_1493950 - PLACE
      ?auto_1493952 - TRUCK
      ?auto_1493951 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1493949 ?auto_1493950 ) ( SURFACE-AT ?auto_1493947 ?auto_1493950 ) ( CLEAR ?auto_1493947 ) ( IS-CRATE ?auto_1493948 ) ( not ( = ?auto_1493947 ?auto_1493948 ) ) ( AVAILABLE ?auto_1493949 ) ( IN ?auto_1493948 ?auto_1493952 ) ( ON ?auto_1493947 ?auto_1493946 ) ( not ( = ?auto_1493946 ?auto_1493947 ) ) ( not ( = ?auto_1493946 ?auto_1493948 ) ) ( TRUCK-AT ?auto_1493952 ?auto_1493951 ) ( not ( = ?auto_1493951 ?auto_1493950 ) ) ( ON ?auto_1493936 ?auto_1493935 ) ( ON ?auto_1493937 ?auto_1493936 ) ( ON ?auto_1493934 ?auto_1493937 ) ( ON ?auto_1493938 ?auto_1493934 ) ( ON ?auto_1493940 ?auto_1493938 ) ( ON ?auto_1493939 ?auto_1493940 ) ( ON ?auto_1493941 ?auto_1493939 ) ( ON ?auto_1493942 ?auto_1493941 ) ( ON ?auto_1493943 ?auto_1493942 ) ( ON ?auto_1493944 ?auto_1493943 ) ( ON ?auto_1493945 ?auto_1493944 ) ( ON ?auto_1493946 ?auto_1493945 ) ( not ( = ?auto_1493935 ?auto_1493936 ) ) ( not ( = ?auto_1493935 ?auto_1493937 ) ) ( not ( = ?auto_1493935 ?auto_1493934 ) ) ( not ( = ?auto_1493935 ?auto_1493938 ) ) ( not ( = ?auto_1493935 ?auto_1493940 ) ) ( not ( = ?auto_1493935 ?auto_1493939 ) ) ( not ( = ?auto_1493935 ?auto_1493941 ) ) ( not ( = ?auto_1493935 ?auto_1493942 ) ) ( not ( = ?auto_1493935 ?auto_1493943 ) ) ( not ( = ?auto_1493935 ?auto_1493944 ) ) ( not ( = ?auto_1493935 ?auto_1493945 ) ) ( not ( = ?auto_1493935 ?auto_1493946 ) ) ( not ( = ?auto_1493935 ?auto_1493947 ) ) ( not ( = ?auto_1493935 ?auto_1493948 ) ) ( not ( = ?auto_1493936 ?auto_1493937 ) ) ( not ( = ?auto_1493936 ?auto_1493934 ) ) ( not ( = ?auto_1493936 ?auto_1493938 ) ) ( not ( = ?auto_1493936 ?auto_1493940 ) ) ( not ( = ?auto_1493936 ?auto_1493939 ) ) ( not ( = ?auto_1493936 ?auto_1493941 ) ) ( not ( = ?auto_1493936 ?auto_1493942 ) ) ( not ( = ?auto_1493936 ?auto_1493943 ) ) ( not ( = ?auto_1493936 ?auto_1493944 ) ) ( not ( = ?auto_1493936 ?auto_1493945 ) ) ( not ( = ?auto_1493936 ?auto_1493946 ) ) ( not ( = ?auto_1493936 ?auto_1493947 ) ) ( not ( = ?auto_1493936 ?auto_1493948 ) ) ( not ( = ?auto_1493937 ?auto_1493934 ) ) ( not ( = ?auto_1493937 ?auto_1493938 ) ) ( not ( = ?auto_1493937 ?auto_1493940 ) ) ( not ( = ?auto_1493937 ?auto_1493939 ) ) ( not ( = ?auto_1493937 ?auto_1493941 ) ) ( not ( = ?auto_1493937 ?auto_1493942 ) ) ( not ( = ?auto_1493937 ?auto_1493943 ) ) ( not ( = ?auto_1493937 ?auto_1493944 ) ) ( not ( = ?auto_1493937 ?auto_1493945 ) ) ( not ( = ?auto_1493937 ?auto_1493946 ) ) ( not ( = ?auto_1493937 ?auto_1493947 ) ) ( not ( = ?auto_1493937 ?auto_1493948 ) ) ( not ( = ?auto_1493934 ?auto_1493938 ) ) ( not ( = ?auto_1493934 ?auto_1493940 ) ) ( not ( = ?auto_1493934 ?auto_1493939 ) ) ( not ( = ?auto_1493934 ?auto_1493941 ) ) ( not ( = ?auto_1493934 ?auto_1493942 ) ) ( not ( = ?auto_1493934 ?auto_1493943 ) ) ( not ( = ?auto_1493934 ?auto_1493944 ) ) ( not ( = ?auto_1493934 ?auto_1493945 ) ) ( not ( = ?auto_1493934 ?auto_1493946 ) ) ( not ( = ?auto_1493934 ?auto_1493947 ) ) ( not ( = ?auto_1493934 ?auto_1493948 ) ) ( not ( = ?auto_1493938 ?auto_1493940 ) ) ( not ( = ?auto_1493938 ?auto_1493939 ) ) ( not ( = ?auto_1493938 ?auto_1493941 ) ) ( not ( = ?auto_1493938 ?auto_1493942 ) ) ( not ( = ?auto_1493938 ?auto_1493943 ) ) ( not ( = ?auto_1493938 ?auto_1493944 ) ) ( not ( = ?auto_1493938 ?auto_1493945 ) ) ( not ( = ?auto_1493938 ?auto_1493946 ) ) ( not ( = ?auto_1493938 ?auto_1493947 ) ) ( not ( = ?auto_1493938 ?auto_1493948 ) ) ( not ( = ?auto_1493940 ?auto_1493939 ) ) ( not ( = ?auto_1493940 ?auto_1493941 ) ) ( not ( = ?auto_1493940 ?auto_1493942 ) ) ( not ( = ?auto_1493940 ?auto_1493943 ) ) ( not ( = ?auto_1493940 ?auto_1493944 ) ) ( not ( = ?auto_1493940 ?auto_1493945 ) ) ( not ( = ?auto_1493940 ?auto_1493946 ) ) ( not ( = ?auto_1493940 ?auto_1493947 ) ) ( not ( = ?auto_1493940 ?auto_1493948 ) ) ( not ( = ?auto_1493939 ?auto_1493941 ) ) ( not ( = ?auto_1493939 ?auto_1493942 ) ) ( not ( = ?auto_1493939 ?auto_1493943 ) ) ( not ( = ?auto_1493939 ?auto_1493944 ) ) ( not ( = ?auto_1493939 ?auto_1493945 ) ) ( not ( = ?auto_1493939 ?auto_1493946 ) ) ( not ( = ?auto_1493939 ?auto_1493947 ) ) ( not ( = ?auto_1493939 ?auto_1493948 ) ) ( not ( = ?auto_1493941 ?auto_1493942 ) ) ( not ( = ?auto_1493941 ?auto_1493943 ) ) ( not ( = ?auto_1493941 ?auto_1493944 ) ) ( not ( = ?auto_1493941 ?auto_1493945 ) ) ( not ( = ?auto_1493941 ?auto_1493946 ) ) ( not ( = ?auto_1493941 ?auto_1493947 ) ) ( not ( = ?auto_1493941 ?auto_1493948 ) ) ( not ( = ?auto_1493942 ?auto_1493943 ) ) ( not ( = ?auto_1493942 ?auto_1493944 ) ) ( not ( = ?auto_1493942 ?auto_1493945 ) ) ( not ( = ?auto_1493942 ?auto_1493946 ) ) ( not ( = ?auto_1493942 ?auto_1493947 ) ) ( not ( = ?auto_1493942 ?auto_1493948 ) ) ( not ( = ?auto_1493943 ?auto_1493944 ) ) ( not ( = ?auto_1493943 ?auto_1493945 ) ) ( not ( = ?auto_1493943 ?auto_1493946 ) ) ( not ( = ?auto_1493943 ?auto_1493947 ) ) ( not ( = ?auto_1493943 ?auto_1493948 ) ) ( not ( = ?auto_1493944 ?auto_1493945 ) ) ( not ( = ?auto_1493944 ?auto_1493946 ) ) ( not ( = ?auto_1493944 ?auto_1493947 ) ) ( not ( = ?auto_1493944 ?auto_1493948 ) ) ( not ( = ?auto_1493945 ?auto_1493946 ) ) ( not ( = ?auto_1493945 ?auto_1493947 ) ) ( not ( = ?auto_1493945 ?auto_1493948 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1493946 ?auto_1493947 ?auto_1493948 )
      ( MAKE-14CRATE-VERIFY ?auto_1493935 ?auto_1493936 ?auto_1493937 ?auto_1493934 ?auto_1493938 ?auto_1493940 ?auto_1493939 ?auto_1493941 ?auto_1493942 ?auto_1493943 ?auto_1493944 ?auto_1493945 ?auto_1493946 ?auto_1493947 ?auto_1493948 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1494124 - SURFACE
      ?auto_1494125 - SURFACE
      ?auto_1494126 - SURFACE
      ?auto_1494123 - SURFACE
      ?auto_1494127 - SURFACE
      ?auto_1494129 - SURFACE
      ?auto_1494128 - SURFACE
      ?auto_1494130 - SURFACE
      ?auto_1494131 - SURFACE
      ?auto_1494132 - SURFACE
      ?auto_1494133 - SURFACE
      ?auto_1494134 - SURFACE
      ?auto_1494135 - SURFACE
      ?auto_1494136 - SURFACE
      ?auto_1494137 - SURFACE
    )
    :vars
    (
      ?auto_1494140 - HOIST
      ?auto_1494142 - PLACE
      ?auto_1494138 - TRUCK
      ?auto_1494141 - PLACE
      ?auto_1494139 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1494140 ?auto_1494142 ) ( SURFACE-AT ?auto_1494136 ?auto_1494142 ) ( CLEAR ?auto_1494136 ) ( IS-CRATE ?auto_1494137 ) ( not ( = ?auto_1494136 ?auto_1494137 ) ) ( AVAILABLE ?auto_1494140 ) ( ON ?auto_1494136 ?auto_1494135 ) ( not ( = ?auto_1494135 ?auto_1494136 ) ) ( not ( = ?auto_1494135 ?auto_1494137 ) ) ( TRUCK-AT ?auto_1494138 ?auto_1494141 ) ( not ( = ?auto_1494141 ?auto_1494142 ) ) ( HOIST-AT ?auto_1494139 ?auto_1494141 ) ( LIFTING ?auto_1494139 ?auto_1494137 ) ( not ( = ?auto_1494140 ?auto_1494139 ) ) ( ON ?auto_1494125 ?auto_1494124 ) ( ON ?auto_1494126 ?auto_1494125 ) ( ON ?auto_1494123 ?auto_1494126 ) ( ON ?auto_1494127 ?auto_1494123 ) ( ON ?auto_1494129 ?auto_1494127 ) ( ON ?auto_1494128 ?auto_1494129 ) ( ON ?auto_1494130 ?auto_1494128 ) ( ON ?auto_1494131 ?auto_1494130 ) ( ON ?auto_1494132 ?auto_1494131 ) ( ON ?auto_1494133 ?auto_1494132 ) ( ON ?auto_1494134 ?auto_1494133 ) ( ON ?auto_1494135 ?auto_1494134 ) ( not ( = ?auto_1494124 ?auto_1494125 ) ) ( not ( = ?auto_1494124 ?auto_1494126 ) ) ( not ( = ?auto_1494124 ?auto_1494123 ) ) ( not ( = ?auto_1494124 ?auto_1494127 ) ) ( not ( = ?auto_1494124 ?auto_1494129 ) ) ( not ( = ?auto_1494124 ?auto_1494128 ) ) ( not ( = ?auto_1494124 ?auto_1494130 ) ) ( not ( = ?auto_1494124 ?auto_1494131 ) ) ( not ( = ?auto_1494124 ?auto_1494132 ) ) ( not ( = ?auto_1494124 ?auto_1494133 ) ) ( not ( = ?auto_1494124 ?auto_1494134 ) ) ( not ( = ?auto_1494124 ?auto_1494135 ) ) ( not ( = ?auto_1494124 ?auto_1494136 ) ) ( not ( = ?auto_1494124 ?auto_1494137 ) ) ( not ( = ?auto_1494125 ?auto_1494126 ) ) ( not ( = ?auto_1494125 ?auto_1494123 ) ) ( not ( = ?auto_1494125 ?auto_1494127 ) ) ( not ( = ?auto_1494125 ?auto_1494129 ) ) ( not ( = ?auto_1494125 ?auto_1494128 ) ) ( not ( = ?auto_1494125 ?auto_1494130 ) ) ( not ( = ?auto_1494125 ?auto_1494131 ) ) ( not ( = ?auto_1494125 ?auto_1494132 ) ) ( not ( = ?auto_1494125 ?auto_1494133 ) ) ( not ( = ?auto_1494125 ?auto_1494134 ) ) ( not ( = ?auto_1494125 ?auto_1494135 ) ) ( not ( = ?auto_1494125 ?auto_1494136 ) ) ( not ( = ?auto_1494125 ?auto_1494137 ) ) ( not ( = ?auto_1494126 ?auto_1494123 ) ) ( not ( = ?auto_1494126 ?auto_1494127 ) ) ( not ( = ?auto_1494126 ?auto_1494129 ) ) ( not ( = ?auto_1494126 ?auto_1494128 ) ) ( not ( = ?auto_1494126 ?auto_1494130 ) ) ( not ( = ?auto_1494126 ?auto_1494131 ) ) ( not ( = ?auto_1494126 ?auto_1494132 ) ) ( not ( = ?auto_1494126 ?auto_1494133 ) ) ( not ( = ?auto_1494126 ?auto_1494134 ) ) ( not ( = ?auto_1494126 ?auto_1494135 ) ) ( not ( = ?auto_1494126 ?auto_1494136 ) ) ( not ( = ?auto_1494126 ?auto_1494137 ) ) ( not ( = ?auto_1494123 ?auto_1494127 ) ) ( not ( = ?auto_1494123 ?auto_1494129 ) ) ( not ( = ?auto_1494123 ?auto_1494128 ) ) ( not ( = ?auto_1494123 ?auto_1494130 ) ) ( not ( = ?auto_1494123 ?auto_1494131 ) ) ( not ( = ?auto_1494123 ?auto_1494132 ) ) ( not ( = ?auto_1494123 ?auto_1494133 ) ) ( not ( = ?auto_1494123 ?auto_1494134 ) ) ( not ( = ?auto_1494123 ?auto_1494135 ) ) ( not ( = ?auto_1494123 ?auto_1494136 ) ) ( not ( = ?auto_1494123 ?auto_1494137 ) ) ( not ( = ?auto_1494127 ?auto_1494129 ) ) ( not ( = ?auto_1494127 ?auto_1494128 ) ) ( not ( = ?auto_1494127 ?auto_1494130 ) ) ( not ( = ?auto_1494127 ?auto_1494131 ) ) ( not ( = ?auto_1494127 ?auto_1494132 ) ) ( not ( = ?auto_1494127 ?auto_1494133 ) ) ( not ( = ?auto_1494127 ?auto_1494134 ) ) ( not ( = ?auto_1494127 ?auto_1494135 ) ) ( not ( = ?auto_1494127 ?auto_1494136 ) ) ( not ( = ?auto_1494127 ?auto_1494137 ) ) ( not ( = ?auto_1494129 ?auto_1494128 ) ) ( not ( = ?auto_1494129 ?auto_1494130 ) ) ( not ( = ?auto_1494129 ?auto_1494131 ) ) ( not ( = ?auto_1494129 ?auto_1494132 ) ) ( not ( = ?auto_1494129 ?auto_1494133 ) ) ( not ( = ?auto_1494129 ?auto_1494134 ) ) ( not ( = ?auto_1494129 ?auto_1494135 ) ) ( not ( = ?auto_1494129 ?auto_1494136 ) ) ( not ( = ?auto_1494129 ?auto_1494137 ) ) ( not ( = ?auto_1494128 ?auto_1494130 ) ) ( not ( = ?auto_1494128 ?auto_1494131 ) ) ( not ( = ?auto_1494128 ?auto_1494132 ) ) ( not ( = ?auto_1494128 ?auto_1494133 ) ) ( not ( = ?auto_1494128 ?auto_1494134 ) ) ( not ( = ?auto_1494128 ?auto_1494135 ) ) ( not ( = ?auto_1494128 ?auto_1494136 ) ) ( not ( = ?auto_1494128 ?auto_1494137 ) ) ( not ( = ?auto_1494130 ?auto_1494131 ) ) ( not ( = ?auto_1494130 ?auto_1494132 ) ) ( not ( = ?auto_1494130 ?auto_1494133 ) ) ( not ( = ?auto_1494130 ?auto_1494134 ) ) ( not ( = ?auto_1494130 ?auto_1494135 ) ) ( not ( = ?auto_1494130 ?auto_1494136 ) ) ( not ( = ?auto_1494130 ?auto_1494137 ) ) ( not ( = ?auto_1494131 ?auto_1494132 ) ) ( not ( = ?auto_1494131 ?auto_1494133 ) ) ( not ( = ?auto_1494131 ?auto_1494134 ) ) ( not ( = ?auto_1494131 ?auto_1494135 ) ) ( not ( = ?auto_1494131 ?auto_1494136 ) ) ( not ( = ?auto_1494131 ?auto_1494137 ) ) ( not ( = ?auto_1494132 ?auto_1494133 ) ) ( not ( = ?auto_1494132 ?auto_1494134 ) ) ( not ( = ?auto_1494132 ?auto_1494135 ) ) ( not ( = ?auto_1494132 ?auto_1494136 ) ) ( not ( = ?auto_1494132 ?auto_1494137 ) ) ( not ( = ?auto_1494133 ?auto_1494134 ) ) ( not ( = ?auto_1494133 ?auto_1494135 ) ) ( not ( = ?auto_1494133 ?auto_1494136 ) ) ( not ( = ?auto_1494133 ?auto_1494137 ) ) ( not ( = ?auto_1494134 ?auto_1494135 ) ) ( not ( = ?auto_1494134 ?auto_1494136 ) ) ( not ( = ?auto_1494134 ?auto_1494137 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1494135 ?auto_1494136 ?auto_1494137 )
      ( MAKE-14CRATE-VERIFY ?auto_1494124 ?auto_1494125 ?auto_1494126 ?auto_1494123 ?auto_1494127 ?auto_1494129 ?auto_1494128 ?auto_1494130 ?auto_1494131 ?auto_1494132 ?auto_1494133 ?auto_1494134 ?auto_1494135 ?auto_1494136 ?auto_1494137 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1494327 - SURFACE
      ?auto_1494328 - SURFACE
      ?auto_1494329 - SURFACE
      ?auto_1494326 - SURFACE
      ?auto_1494330 - SURFACE
      ?auto_1494332 - SURFACE
      ?auto_1494331 - SURFACE
      ?auto_1494333 - SURFACE
      ?auto_1494334 - SURFACE
      ?auto_1494335 - SURFACE
      ?auto_1494336 - SURFACE
      ?auto_1494337 - SURFACE
      ?auto_1494338 - SURFACE
      ?auto_1494339 - SURFACE
      ?auto_1494340 - SURFACE
    )
    :vars
    (
      ?auto_1494346 - HOIST
      ?auto_1494342 - PLACE
      ?auto_1494341 - TRUCK
      ?auto_1494345 - PLACE
      ?auto_1494343 - HOIST
      ?auto_1494344 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1494346 ?auto_1494342 ) ( SURFACE-AT ?auto_1494339 ?auto_1494342 ) ( CLEAR ?auto_1494339 ) ( IS-CRATE ?auto_1494340 ) ( not ( = ?auto_1494339 ?auto_1494340 ) ) ( AVAILABLE ?auto_1494346 ) ( ON ?auto_1494339 ?auto_1494338 ) ( not ( = ?auto_1494338 ?auto_1494339 ) ) ( not ( = ?auto_1494338 ?auto_1494340 ) ) ( TRUCK-AT ?auto_1494341 ?auto_1494345 ) ( not ( = ?auto_1494345 ?auto_1494342 ) ) ( HOIST-AT ?auto_1494343 ?auto_1494345 ) ( not ( = ?auto_1494346 ?auto_1494343 ) ) ( AVAILABLE ?auto_1494343 ) ( SURFACE-AT ?auto_1494340 ?auto_1494345 ) ( ON ?auto_1494340 ?auto_1494344 ) ( CLEAR ?auto_1494340 ) ( not ( = ?auto_1494339 ?auto_1494344 ) ) ( not ( = ?auto_1494340 ?auto_1494344 ) ) ( not ( = ?auto_1494338 ?auto_1494344 ) ) ( ON ?auto_1494328 ?auto_1494327 ) ( ON ?auto_1494329 ?auto_1494328 ) ( ON ?auto_1494326 ?auto_1494329 ) ( ON ?auto_1494330 ?auto_1494326 ) ( ON ?auto_1494332 ?auto_1494330 ) ( ON ?auto_1494331 ?auto_1494332 ) ( ON ?auto_1494333 ?auto_1494331 ) ( ON ?auto_1494334 ?auto_1494333 ) ( ON ?auto_1494335 ?auto_1494334 ) ( ON ?auto_1494336 ?auto_1494335 ) ( ON ?auto_1494337 ?auto_1494336 ) ( ON ?auto_1494338 ?auto_1494337 ) ( not ( = ?auto_1494327 ?auto_1494328 ) ) ( not ( = ?auto_1494327 ?auto_1494329 ) ) ( not ( = ?auto_1494327 ?auto_1494326 ) ) ( not ( = ?auto_1494327 ?auto_1494330 ) ) ( not ( = ?auto_1494327 ?auto_1494332 ) ) ( not ( = ?auto_1494327 ?auto_1494331 ) ) ( not ( = ?auto_1494327 ?auto_1494333 ) ) ( not ( = ?auto_1494327 ?auto_1494334 ) ) ( not ( = ?auto_1494327 ?auto_1494335 ) ) ( not ( = ?auto_1494327 ?auto_1494336 ) ) ( not ( = ?auto_1494327 ?auto_1494337 ) ) ( not ( = ?auto_1494327 ?auto_1494338 ) ) ( not ( = ?auto_1494327 ?auto_1494339 ) ) ( not ( = ?auto_1494327 ?auto_1494340 ) ) ( not ( = ?auto_1494327 ?auto_1494344 ) ) ( not ( = ?auto_1494328 ?auto_1494329 ) ) ( not ( = ?auto_1494328 ?auto_1494326 ) ) ( not ( = ?auto_1494328 ?auto_1494330 ) ) ( not ( = ?auto_1494328 ?auto_1494332 ) ) ( not ( = ?auto_1494328 ?auto_1494331 ) ) ( not ( = ?auto_1494328 ?auto_1494333 ) ) ( not ( = ?auto_1494328 ?auto_1494334 ) ) ( not ( = ?auto_1494328 ?auto_1494335 ) ) ( not ( = ?auto_1494328 ?auto_1494336 ) ) ( not ( = ?auto_1494328 ?auto_1494337 ) ) ( not ( = ?auto_1494328 ?auto_1494338 ) ) ( not ( = ?auto_1494328 ?auto_1494339 ) ) ( not ( = ?auto_1494328 ?auto_1494340 ) ) ( not ( = ?auto_1494328 ?auto_1494344 ) ) ( not ( = ?auto_1494329 ?auto_1494326 ) ) ( not ( = ?auto_1494329 ?auto_1494330 ) ) ( not ( = ?auto_1494329 ?auto_1494332 ) ) ( not ( = ?auto_1494329 ?auto_1494331 ) ) ( not ( = ?auto_1494329 ?auto_1494333 ) ) ( not ( = ?auto_1494329 ?auto_1494334 ) ) ( not ( = ?auto_1494329 ?auto_1494335 ) ) ( not ( = ?auto_1494329 ?auto_1494336 ) ) ( not ( = ?auto_1494329 ?auto_1494337 ) ) ( not ( = ?auto_1494329 ?auto_1494338 ) ) ( not ( = ?auto_1494329 ?auto_1494339 ) ) ( not ( = ?auto_1494329 ?auto_1494340 ) ) ( not ( = ?auto_1494329 ?auto_1494344 ) ) ( not ( = ?auto_1494326 ?auto_1494330 ) ) ( not ( = ?auto_1494326 ?auto_1494332 ) ) ( not ( = ?auto_1494326 ?auto_1494331 ) ) ( not ( = ?auto_1494326 ?auto_1494333 ) ) ( not ( = ?auto_1494326 ?auto_1494334 ) ) ( not ( = ?auto_1494326 ?auto_1494335 ) ) ( not ( = ?auto_1494326 ?auto_1494336 ) ) ( not ( = ?auto_1494326 ?auto_1494337 ) ) ( not ( = ?auto_1494326 ?auto_1494338 ) ) ( not ( = ?auto_1494326 ?auto_1494339 ) ) ( not ( = ?auto_1494326 ?auto_1494340 ) ) ( not ( = ?auto_1494326 ?auto_1494344 ) ) ( not ( = ?auto_1494330 ?auto_1494332 ) ) ( not ( = ?auto_1494330 ?auto_1494331 ) ) ( not ( = ?auto_1494330 ?auto_1494333 ) ) ( not ( = ?auto_1494330 ?auto_1494334 ) ) ( not ( = ?auto_1494330 ?auto_1494335 ) ) ( not ( = ?auto_1494330 ?auto_1494336 ) ) ( not ( = ?auto_1494330 ?auto_1494337 ) ) ( not ( = ?auto_1494330 ?auto_1494338 ) ) ( not ( = ?auto_1494330 ?auto_1494339 ) ) ( not ( = ?auto_1494330 ?auto_1494340 ) ) ( not ( = ?auto_1494330 ?auto_1494344 ) ) ( not ( = ?auto_1494332 ?auto_1494331 ) ) ( not ( = ?auto_1494332 ?auto_1494333 ) ) ( not ( = ?auto_1494332 ?auto_1494334 ) ) ( not ( = ?auto_1494332 ?auto_1494335 ) ) ( not ( = ?auto_1494332 ?auto_1494336 ) ) ( not ( = ?auto_1494332 ?auto_1494337 ) ) ( not ( = ?auto_1494332 ?auto_1494338 ) ) ( not ( = ?auto_1494332 ?auto_1494339 ) ) ( not ( = ?auto_1494332 ?auto_1494340 ) ) ( not ( = ?auto_1494332 ?auto_1494344 ) ) ( not ( = ?auto_1494331 ?auto_1494333 ) ) ( not ( = ?auto_1494331 ?auto_1494334 ) ) ( not ( = ?auto_1494331 ?auto_1494335 ) ) ( not ( = ?auto_1494331 ?auto_1494336 ) ) ( not ( = ?auto_1494331 ?auto_1494337 ) ) ( not ( = ?auto_1494331 ?auto_1494338 ) ) ( not ( = ?auto_1494331 ?auto_1494339 ) ) ( not ( = ?auto_1494331 ?auto_1494340 ) ) ( not ( = ?auto_1494331 ?auto_1494344 ) ) ( not ( = ?auto_1494333 ?auto_1494334 ) ) ( not ( = ?auto_1494333 ?auto_1494335 ) ) ( not ( = ?auto_1494333 ?auto_1494336 ) ) ( not ( = ?auto_1494333 ?auto_1494337 ) ) ( not ( = ?auto_1494333 ?auto_1494338 ) ) ( not ( = ?auto_1494333 ?auto_1494339 ) ) ( not ( = ?auto_1494333 ?auto_1494340 ) ) ( not ( = ?auto_1494333 ?auto_1494344 ) ) ( not ( = ?auto_1494334 ?auto_1494335 ) ) ( not ( = ?auto_1494334 ?auto_1494336 ) ) ( not ( = ?auto_1494334 ?auto_1494337 ) ) ( not ( = ?auto_1494334 ?auto_1494338 ) ) ( not ( = ?auto_1494334 ?auto_1494339 ) ) ( not ( = ?auto_1494334 ?auto_1494340 ) ) ( not ( = ?auto_1494334 ?auto_1494344 ) ) ( not ( = ?auto_1494335 ?auto_1494336 ) ) ( not ( = ?auto_1494335 ?auto_1494337 ) ) ( not ( = ?auto_1494335 ?auto_1494338 ) ) ( not ( = ?auto_1494335 ?auto_1494339 ) ) ( not ( = ?auto_1494335 ?auto_1494340 ) ) ( not ( = ?auto_1494335 ?auto_1494344 ) ) ( not ( = ?auto_1494336 ?auto_1494337 ) ) ( not ( = ?auto_1494336 ?auto_1494338 ) ) ( not ( = ?auto_1494336 ?auto_1494339 ) ) ( not ( = ?auto_1494336 ?auto_1494340 ) ) ( not ( = ?auto_1494336 ?auto_1494344 ) ) ( not ( = ?auto_1494337 ?auto_1494338 ) ) ( not ( = ?auto_1494337 ?auto_1494339 ) ) ( not ( = ?auto_1494337 ?auto_1494340 ) ) ( not ( = ?auto_1494337 ?auto_1494344 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1494338 ?auto_1494339 ?auto_1494340 )
      ( MAKE-14CRATE-VERIFY ?auto_1494327 ?auto_1494328 ?auto_1494329 ?auto_1494326 ?auto_1494330 ?auto_1494332 ?auto_1494331 ?auto_1494333 ?auto_1494334 ?auto_1494335 ?auto_1494336 ?auto_1494337 ?auto_1494338 ?auto_1494339 ?auto_1494340 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1494531 - SURFACE
      ?auto_1494532 - SURFACE
      ?auto_1494533 - SURFACE
      ?auto_1494530 - SURFACE
      ?auto_1494534 - SURFACE
      ?auto_1494536 - SURFACE
      ?auto_1494535 - SURFACE
      ?auto_1494537 - SURFACE
      ?auto_1494538 - SURFACE
      ?auto_1494539 - SURFACE
      ?auto_1494540 - SURFACE
      ?auto_1494541 - SURFACE
      ?auto_1494542 - SURFACE
      ?auto_1494543 - SURFACE
      ?auto_1494544 - SURFACE
    )
    :vars
    (
      ?auto_1494547 - HOIST
      ?auto_1494546 - PLACE
      ?auto_1494549 - PLACE
      ?auto_1494545 - HOIST
      ?auto_1494548 - SURFACE
      ?auto_1494550 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1494547 ?auto_1494546 ) ( SURFACE-AT ?auto_1494543 ?auto_1494546 ) ( CLEAR ?auto_1494543 ) ( IS-CRATE ?auto_1494544 ) ( not ( = ?auto_1494543 ?auto_1494544 ) ) ( AVAILABLE ?auto_1494547 ) ( ON ?auto_1494543 ?auto_1494542 ) ( not ( = ?auto_1494542 ?auto_1494543 ) ) ( not ( = ?auto_1494542 ?auto_1494544 ) ) ( not ( = ?auto_1494549 ?auto_1494546 ) ) ( HOIST-AT ?auto_1494545 ?auto_1494549 ) ( not ( = ?auto_1494547 ?auto_1494545 ) ) ( AVAILABLE ?auto_1494545 ) ( SURFACE-AT ?auto_1494544 ?auto_1494549 ) ( ON ?auto_1494544 ?auto_1494548 ) ( CLEAR ?auto_1494544 ) ( not ( = ?auto_1494543 ?auto_1494548 ) ) ( not ( = ?auto_1494544 ?auto_1494548 ) ) ( not ( = ?auto_1494542 ?auto_1494548 ) ) ( TRUCK-AT ?auto_1494550 ?auto_1494546 ) ( ON ?auto_1494532 ?auto_1494531 ) ( ON ?auto_1494533 ?auto_1494532 ) ( ON ?auto_1494530 ?auto_1494533 ) ( ON ?auto_1494534 ?auto_1494530 ) ( ON ?auto_1494536 ?auto_1494534 ) ( ON ?auto_1494535 ?auto_1494536 ) ( ON ?auto_1494537 ?auto_1494535 ) ( ON ?auto_1494538 ?auto_1494537 ) ( ON ?auto_1494539 ?auto_1494538 ) ( ON ?auto_1494540 ?auto_1494539 ) ( ON ?auto_1494541 ?auto_1494540 ) ( ON ?auto_1494542 ?auto_1494541 ) ( not ( = ?auto_1494531 ?auto_1494532 ) ) ( not ( = ?auto_1494531 ?auto_1494533 ) ) ( not ( = ?auto_1494531 ?auto_1494530 ) ) ( not ( = ?auto_1494531 ?auto_1494534 ) ) ( not ( = ?auto_1494531 ?auto_1494536 ) ) ( not ( = ?auto_1494531 ?auto_1494535 ) ) ( not ( = ?auto_1494531 ?auto_1494537 ) ) ( not ( = ?auto_1494531 ?auto_1494538 ) ) ( not ( = ?auto_1494531 ?auto_1494539 ) ) ( not ( = ?auto_1494531 ?auto_1494540 ) ) ( not ( = ?auto_1494531 ?auto_1494541 ) ) ( not ( = ?auto_1494531 ?auto_1494542 ) ) ( not ( = ?auto_1494531 ?auto_1494543 ) ) ( not ( = ?auto_1494531 ?auto_1494544 ) ) ( not ( = ?auto_1494531 ?auto_1494548 ) ) ( not ( = ?auto_1494532 ?auto_1494533 ) ) ( not ( = ?auto_1494532 ?auto_1494530 ) ) ( not ( = ?auto_1494532 ?auto_1494534 ) ) ( not ( = ?auto_1494532 ?auto_1494536 ) ) ( not ( = ?auto_1494532 ?auto_1494535 ) ) ( not ( = ?auto_1494532 ?auto_1494537 ) ) ( not ( = ?auto_1494532 ?auto_1494538 ) ) ( not ( = ?auto_1494532 ?auto_1494539 ) ) ( not ( = ?auto_1494532 ?auto_1494540 ) ) ( not ( = ?auto_1494532 ?auto_1494541 ) ) ( not ( = ?auto_1494532 ?auto_1494542 ) ) ( not ( = ?auto_1494532 ?auto_1494543 ) ) ( not ( = ?auto_1494532 ?auto_1494544 ) ) ( not ( = ?auto_1494532 ?auto_1494548 ) ) ( not ( = ?auto_1494533 ?auto_1494530 ) ) ( not ( = ?auto_1494533 ?auto_1494534 ) ) ( not ( = ?auto_1494533 ?auto_1494536 ) ) ( not ( = ?auto_1494533 ?auto_1494535 ) ) ( not ( = ?auto_1494533 ?auto_1494537 ) ) ( not ( = ?auto_1494533 ?auto_1494538 ) ) ( not ( = ?auto_1494533 ?auto_1494539 ) ) ( not ( = ?auto_1494533 ?auto_1494540 ) ) ( not ( = ?auto_1494533 ?auto_1494541 ) ) ( not ( = ?auto_1494533 ?auto_1494542 ) ) ( not ( = ?auto_1494533 ?auto_1494543 ) ) ( not ( = ?auto_1494533 ?auto_1494544 ) ) ( not ( = ?auto_1494533 ?auto_1494548 ) ) ( not ( = ?auto_1494530 ?auto_1494534 ) ) ( not ( = ?auto_1494530 ?auto_1494536 ) ) ( not ( = ?auto_1494530 ?auto_1494535 ) ) ( not ( = ?auto_1494530 ?auto_1494537 ) ) ( not ( = ?auto_1494530 ?auto_1494538 ) ) ( not ( = ?auto_1494530 ?auto_1494539 ) ) ( not ( = ?auto_1494530 ?auto_1494540 ) ) ( not ( = ?auto_1494530 ?auto_1494541 ) ) ( not ( = ?auto_1494530 ?auto_1494542 ) ) ( not ( = ?auto_1494530 ?auto_1494543 ) ) ( not ( = ?auto_1494530 ?auto_1494544 ) ) ( not ( = ?auto_1494530 ?auto_1494548 ) ) ( not ( = ?auto_1494534 ?auto_1494536 ) ) ( not ( = ?auto_1494534 ?auto_1494535 ) ) ( not ( = ?auto_1494534 ?auto_1494537 ) ) ( not ( = ?auto_1494534 ?auto_1494538 ) ) ( not ( = ?auto_1494534 ?auto_1494539 ) ) ( not ( = ?auto_1494534 ?auto_1494540 ) ) ( not ( = ?auto_1494534 ?auto_1494541 ) ) ( not ( = ?auto_1494534 ?auto_1494542 ) ) ( not ( = ?auto_1494534 ?auto_1494543 ) ) ( not ( = ?auto_1494534 ?auto_1494544 ) ) ( not ( = ?auto_1494534 ?auto_1494548 ) ) ( not ( = ?auto_1494536 ?auto_1494535 ) ) ( not ( = ?auto_1494536 ?auto_1494537 ) ) ( not ( = ?auto_1494536 ?auto_1494538 ) ) ( not ( = ?auto_1494536 ?auto_1494539 ) ) ( not ( = ?auto_1494536 ?auto_1494540 ) ) ( not ( = ?auto_1494536 ?auto_1494541 ) ) ( not ( = ?auto_1494536 ?auto_1494542 ) ) ( not ( = ?auto_1494536 ?auto_1494543 ) ) ( not ( = ?auto_1494536 ?auto_1494544 ) ) ( not ( = ?auto_1494536 ?auto_1494548 ) ) ( not ( = ?auto_1494535 ?auto_1494537 ) ) ( not ( = ?auto_1494535 ?auto_1494538 ) ) ( not ( = ?auto_1494535 ?auto_1494539 ) ) ( not ( = ?auto_1494535 ?auto_1494540 ) ) ( not ( = ?auto_1494535 ?auto_1494541 ) ) ( not ( = ?auto_1494535 ?auto_1494542 ) ) ( not ( = ?auto_1494535 ?auto_1494543 ) ) ( not ( = ?auto_1494535 ?auto_1494544 ) ) ( not ( = ?auto_1494535 ?auto_1494548 ) ) ( not ( = ?auto_1494537 ?auto_1494538 ) ) ( not ( = ?auto_1494537 ?auto_1494539 ) ) ( not ( = ?auto_1494537 ?auto_1494540 ) ) ( not ( = ?auto_1494537 ?auto_1494541 ) ) ( not ( = ?auto_1494537 ?auto_1494542 ) ) ( not ( = ?auto_1494537 ?auto_1494543 ) ) ( not ( = ?auto_1494537 ?auto_1494544 ) ) ( not ( = ?auto_1494537 ?auto_1494548 ) ) ( not ( = ?auto_1494538 ?auto_1494539 ) ) ( not ( = ?auto_1494538 ?auto_1494540 ) ) ( not ( = ?auto_1494538 ?auto_1494541 ) ) ( not ( = ?auto_1494538 ?auto_1494542 ) ) ( not ( = ?auto_1494538 ?auto_1494543 ) ) ( not ( = ?auto_1494538 ?auto_1494544 ) ) ( not ( = ?auto_1494538 ?auto_1494548 ) ) ( not ( = ?auto_1494539 ?auto_1494540 ) ) ( not ( = ?auto_1494539 ?auto_1494541 ) ) ( not ( = ?auto_1494539 ?auto_1494542 ) ) ( not ( = ?auto_1494539 ?auto_1494543 ) ) ( not ( = ?auto_1494539 ?auto_1494544 ) ) ( not ( = ?auto_1494539 ?auto_1494548 ) ) ( not ( = ?auto_1494540 ?auto_1494541 ) ) ( not ( = ?auto_1494540 ?auto_1494542 ) ) ( not ( = ?auto_1494540 ?auto_1494543 ) ) ( not ( = ?auto_1494540 ?auto_1494544 ) ) ( not ( = ?auto_1494540 ?auto_1494548 ) ) ( not ( = ?auto_1494541 ?auto_1494542 ) ) ( not ( = ?auto_1494541 ?auto_1494543 ) ) ( not ( = ?auto_1494541 ?auto_1494544 ) ) ( not ( = ?auto_1494541 ?auto_1494548 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1494542 ?auto_1494543 ?auto_1494544 )
      ( MAKE-14CRATE-VERIFY ?auto_1494531 ?auto_1494532 ?auto_1494533 ?auto_1494530 ?auto_1494534 ?auto_1494536 ?auto_1494535 ?auto_1494537 ?auto_1494538 ?auto_1494539 ?auto_1494540 ?auto_1494541 ?auto_1494542 ?auto_1494543 ?auto_1494544 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1494735 - SURFACE
      ?auto_1494736 - SURFACE
      ?auto_1494737 - SURFACE
      ?auto_1494734 - SURFACE
      ?auto_1494738 - SURFACE
      ?auto_1494740 - SURFACE
      ?auto_1494739 - SURFACE
      ?auto_1494741 - SURFACE
      ?auto_1494742 - SURFACE
      ?auto_1494743 - SURFACE
      ?auto_1494744 - SURFACE
      ?auto_1494745 - SURFACE
      ?auto_1494746 - SURFACE
      ?auto_1494747 - SURFACE
      ?auto_1494748 - SURFACE
    )
    :vars
    (
      ?auto_1494754 - HOIST
      ?auto_1494750 - PLACE
      ?auto_1494752 - PLACE
      ?auto_1494751 - HOIST
      ?auto_1494753 - SURFACE
      ?auto_1494749 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1494754 ?auto_1494750 ) ( IS-CRATE ?auto_1494748 ) ( not ( = ?auto_1494747 ?auto_1494748 ) ) ( not ( = ?auto_1494746 ?auto_1494747 ) ) ( not ( = ?auto_1494746 ?auto_1494748 ) ) ( not ( = ?auto_1494752 ?auto_1494750 ) ) ( HOIST-AT ?auto_1494751 ?auto_1494752 ) ( not ( = ?auto_1494754 ?auto_1494751 ) ) ( AVAILABLE ?auto_1494751 ) ( SURFACE-AT ?auto_1494748 ?auto_1494752 ) ( ON ?auto_1494748 ?auto_1494753 ) ( CLEAR ?auto_1494748 ) ( not ( = ?auto_1494747 ?auto_1494753 ) ) ( not ( = ?auto_1494748 ?auto_1494753 ) ) ( not ( = ?auto_1494746 ?auto_1494753 ) ) ( TRUCK-AT ?auto_1494749 ?auto_1494750 ) ( SURFACE-AT ?auto_1494746 ?auto_1494750 ) ( CLEAR ?auto_1494746 ) ( LIFTING ?auto_1494754 ?auto_1494747 ) ( IS-CRATE ?auto_1494747 ) ( ON ?auto_1494736 ?auto_1494735 ) ( ON ?auto_1494737 ?auto_1494736 ) ( ON ?auto_1494734 ?auto_1494737 ) ( ON ?auto_1494738 ?auto_1494734 ) ( ON ?auto_1494740 ?auto_1494738 ) ( ON ?auto_1494739 ?auto_1494740 ) ( ON ?auto_1494741 ?auto_1494739 ) ( ON ?auto_1494742 ?auto_1494741 ) ( ON ?auto_1494743 ?auto_1494742 ) ( ON ?auto_1494744 ?auto_1494743 ) ( ON ?auto_1494745 ?auto_1494744 ) ( ON ?auto_1494746 ?auto_1494745 ) ( not ( = ?auto_1494735 ?auto_1494736 ) ) ( not ( = ?auto_1494735 ?auto_1494737 ) ) ( not ( = ?auto_1494735 ?auto_1494734 ) ) ( not ( = ?auto_1494735 ?auto_1494738 ) ) ( not ( = ?auto_1494735 ?auto_1494740 ) ) ( not ( = ?auto_1494735 ?auto_1494739 ) ) ( not ( = ?auto_1494735 ?auto_1494741 ) ) ( not ( = ?auto_1494735 ?auto_1494742 ) ) ( not ( = ?auto_1494735 ?auto_1494743 ) ) ( not ( = ?auto_1494735 ?auto_1494744 ) ) ( not ( = ?auto_1494735 ?auto_1494745 ) ) ( not ( = ?auto_1494735 ?auto_1494746 ) ) ( not ( = ?auto_1494735 ?auto_1494747 ) ) ( not ( = ?auto_1494735 ?auto_1494748 ) ) ( not ( = ?auto_1494735 ?auto_1494753 ) ) ( not ( = ?auto_1494736 ?auto_1494737 ) ) ( not ( = ?auto_1494736 ?auto_1494734 ) ) ( not ( = ?auto_1494736 ?auto_1494738 ) ) ( not ( = ?auto_1494736 ?auto_1494740 ) ) ( not ( = ?auto_1494736 ?auto_1494739 ) ) ( not ( = ?auto_1494736 ?auto_1494741 ) ) ( not ( = ?auto_1494736 ?auto_1494742 ) ) ( not ( = ?auto_1494736 ?auto_1494743 ) ) ( not ( = ?auto_1494736 ?auto_1494744 ) ) ( not ( = ?auto_1494736 ?auto_1494745 ) ) ( not ( = ?auto_1494736 ?auto_1494746 ) ) ( not ( = ?auto_1494736 ?auto_1494747 ) ) ( not ( = ?auto_1494736 ?auto_1494748 ) ) ( not ( = ?auto_1494736 ?auto_1494753 ) ) ( not ( = ?auto_1494737 ?auto_1494734 ) ) ( not ( = ?auto_1494737 ?auto_1494738 ) ) ( not ( = ?auto_1494737 ?auto_1494740 ) ) ( not ( = ?auto_1494737 ?auto_1494739 ) ) ( not ( = ?auto_1494737 ?auto_1494741 ) ) ( not ( = ?auto_1494737 ?auto_1494742 ) ) ( not ( = ?auto_1494737 ?auto_1494743 ) ) ( not ( = ?auto_1494737 ?auto_1494744 ) ) ( not ( = ?auto_1494737 ?auto_1494745 ) ) ( not ( = ?auto_1494737 ?auto_1494746 ) ) ( not ( = ?auto_1494737 ?auto_1494747 ) ) ( not ( = ?auto_1494737 ?auto_1494748 ) ) ( not ( = ?auto_1494737 ?auto_1494753 ) ) ( not ( = ?auto_1494734 ?auto_1494738 ) ) ( not ( = ?auto_1494734 ?auto_1494740 ) ) ( not ( = ?auto_1494734 ?auto_1494739 ) ) ( not ( = ?auto_1494734 ?auto_1494741 ) ) ( not ( = ?auto_1494734 ?auto_1494742 ) ) ( not ( = ?auto_1494734 ?auto_1494743 ) ) ( not ( = ?auto_1494734 ?auto_1494744 ) ) ( not ( = ?auto_1494734 ?auto_1494745 ) ) ( not ( = ?auto_1494734 ?auto_1494746 ) ) ( not ( = ?auto_1494734 ?auto_1494747 ) ) ( not ( = ?auto_1494734 ?auto_1494748 ) ) ( not ( = ?auto_1494734 ?auto_1494753 ) ) ( not ( = ?auto_1494738 ?auto_1494740 ) ) ( not ( = ?auto_1494738 ?auto_1494739 ) ) ( not ( = ?auto_1494738 ?auto_1494741 ) ) ( not ( = ?auto_1494738 ?auto_1494742 ) ) ( not ( = ?auto_1494738 ?auto_1494743 ) ) ( not ( = ?auto_1494738 ?auto_1494744 ) ) ( not ( = ?auto_1494738 ?auto_1494745 ) ) ( not ( = ?auto_1494738 ?auto_1494746 ) ) ( not ( = ?auto_1494738 ?auto_1494747 ) ) ( not ( = ?auto_1494738 ?auto_1494748 ) ) ( not ( = ?auto_1494738 ?auto_1494753 ) ) ( not ( = ?auto_1494740 ?auto_1494739 ) ) ( not ( = ?auto_1494740 ?auto_1494741 ) ) ( not ( = ?auto_1494740 ?auto_1494742 ) ) ( not ( = ?auto_1494740 ?auto_1494743 ) ) ( not ( = ?auto_1494740 ?auto_1494744 ) ) ( not ( = ?auto_1494740 ?auto_1494745 ) ) ( not ( = ?auto_1494740 ?auto_1494746 ) ) ( not ( = ?auto_1494740 ?auto_1494747 ) ) ( not ( = ?auto_1494740 ?auto_1494748 ) ) ( not ( = ?auto_1494740 ?auto_1494753 ) ) ( not ( = ?auto_1494739 ?auto_1494741 ) ) ( not ( = ?auto_1494739 ?auto_1494742 ) ) ( not ( = ?auto_1494739 ?auto_1494743 ) ) ( not ( = ?auto_1494739 ?auto_1494744 ) ) ( not ( = ?auto_1494739 ?auto_1494745 ) ) ( not ( = ?auto_1494739 ?auto_1494746 ) ) ( not ( = ?auto_1494739 ?auto_1494747 ) ) ( not ( = ?auto_1494739 ?auto_1494748 ) ) ( not ( = ?auto_1494739 ?auto_1494753 ) ) ( not ( = ?auto_1494741 ?auto_1494742 ) ) ( not ( = ?auto_1494741 ?auto_1494743 ) ) ( not ( = ?auto_1494741 ?auto_1494744 ) ) ( not ( = ?auto_1494741 ?auto_1494745 ) ) ( not ( = ?auto_1494741 ?auto_1494746 ) ) ( not ( = ?auto_1494741 ?auto_1494747 ) ) ( not ( = ?auto_1494741 ?auto_1494748 ) ) ( not ( = ?auto_1494741 ?auto_1494753 ) ) ( not ( = ?auto_1494742 ?auto_1494743 ) ) ( not ( = ?auto_1494742 ?auto_1494744 ) ) ( not ( = ?auto_1494742 ?auto_1494745 ) ) ( not ( = ?auto_1494742 ?auto_1494746 ) ) ( not ( = ?auto_1494742 ?auto_1494747 ) ) ( not ( = ?auto_1494742 ?auto_1494748 ) ) ( not ( = ?auto_1494742 ?auto_1494753 ) ) ( not ( = ?auto_1494743 ?auto_1494744 ) ) ( not ( = ?auto_1494743 ?auto_1494745 ) ) ( not ( = ?auto_1494743 ?auto_1494746 ) ) ( not ( = ?auto_1494743 ?auto_1494747 ) ) ( not ( = ?auto_1494743 ?auto_1494748 ) ) ( not ( = ?auto_1494743 ?auto_1494753 ) ) ( not ( = ?auto_1494744 ?auto_1494745 ) ) ( not ( = ?auto_1494744 ?auto_1494746 ) ) ( not ( = ?auto_1494744 ?auto_1494747 ) ) ( not ( = ?auto_1494744 ?auto_1494748 ) ) ( not ( = ?auto_1494744 ?auto_1494753 ) ) ( not ( = ?auto_1494745 ?auto_1494746 ) ) ( not ( = ?auto_1494745 ?auto_1494747 ) ) ( not ( = ?auto_1494745 ?auto_1494748 ) ) ( not ( = ?auto_1494745 ?auto_1494753 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1494746 ?auto_1494747 ?auto_1494748 )
      ( MAKE-14CRATE-VERIFY ?auto_1494735 ?auto_1494736 ?auto_1494737 ?auto_1494734 ?auto_1494738 ?auto_1494740 ?auto_1494739 ?auto_1494741 ?auto_1494742 ?auto_1494743 ?auto_1494744 ?auto_1494745 ?auto_1494746 ?auto_1494747 ?auto_1494748 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1494939 - SURFACE
      ?auto_1494940 - SURFACE
      ?auto_1494941 - SURFACE
      ?auto_1494938 - SURFACE
      ?auto_1494942 - SURFACE
      ?auto_1494944 - SURFACE
      ?auto_1494943 - SURFACE
      ?auto_1494945 - SURFACE
      ?auto_1494946 - SURFACE
      ?auto_1494947 - SURFACE
      ?auto_1494948 - SURFACE
      ?auto_1494949 - SURFACE
      ?auto_1494950 - SURFACE
      ?auto_1494951 - SURFACE
      ?auto_1494952 - SURFACE
    )
    :vars
    (
      ?auto_1494956 - HOIST
      ?auto_1494955 - PLACE
      ?auto_1494954 - PLACE
      ?auto_1494957 - HOIST
      ?auto_1494953 - SURFACE
      ?auto_1494958 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1494956 ?auto_1494955 ) ( IS-CRATE ?auto_1494952 ) ( not ( = ?auto_1494951 ?auto_1494952 ) ) ( not ( = ?auto_1494950 ?auto_1494951 ) ) ( not ( = ?auto_1494950 ?auto_1494952 ) ) ( not ( = ?auto_1494954 ?auto_1494955 ) ) ( HOIST-AT ?auto_1494957 ?auto_1494954 ) ( not ( = ?auto_1494956 ?auto_1494957 ) ) ( AVAILABLE ?auto_1494957 ) ( SURFACE-AT ?auto_1494952 ?auto_1494954 ) ( ON ?auto_1494952 ?auto_1494953 ) ( CLEAR ?auto_1494952 ) ( not ( = ?auto_1494951 ?auto_1494953 ) ) ( not ( = ?auto_1494952 ?auto_1494953 ) ) ( not ( = ?auto_1494950 ?auto_1494953 ) ) ( TRUCK-AT ?auto_1494958 ?auto_1494955 ) ( SURFACE-AT ?auto_1494950 ?auto_1494955 ) ( CLEAR ?auto_1494950 ) ( IS-CRATE ?auto_1494951 ) ( AVAILABLE ?auto_1494956 ) ( IN ?auto_1494951 ?auto_1494958 ) ( ON ?auto_1494940 ?auto_1494939 ) ( ON ?auto_1494941 ?auto_1494940 ) ( ON ?auto_1494938 ?auto_1494941 ) ( ON ?auto_1494942 ?auto_1494938 ) ( ON ?auto_1494944 ?auto_1494942 ) ( ON ?auto_1494943 ?auto_1494944 ) ( ON ?auto_1494945 ?auto_1494943 ) ( ON ?auto_1494946 ?auto_1494945 ) ( ON ?auto_1494947 ?auto_1494946 ) ( ON ?auto_1494948 ?auto_1494947 ) ( ON ?auto_1494949 ?auto_1494948 ) ( ON ?auto_1494950 ?auto_1494949 ) ( not ( = ?auto_1494939 ?auto_1494940 ) ) ( not ( = ?auto_1494939 ?auto_1494941 ) ) ( not ( = ?auto_1494939 ?auto_1494938 ) ) ( not ( = ?auto_1494939 ?auto_1494942 ) ) ( not ( = ?auto_1494939 ?auto_1494944 ) ) ( not ( = ?auto_1494939 ?auto_1494943 ) ) ( not ( = ?auto_1494939 ?auto_1494945 ) ) ( not ( = ?auto_1494939 ?auto_1494946 ) ) ( not ( = ?auto_1494939 ?auto_1494947 ) ) ( not ( = ?auto_1494939 ?auto_1494948 ) ) ( not ( = ?auto_1494939 ?auto_1494949 ) ) ( not ( = ?auto_1494939 ?auto_1494950 ) ) ( not ( = ?auto_1494939 ?auto_1494951 ) ) ( not ( = ?auto_1494939 ?auto_1494952 ) ) ( not ( = ?auto_1494939 ?auto_1494953 ) ) ( not ( = ?auto_1494940 ?auto_1494941 ) ) ( not ( = ?auto_1494940 ?auto_1494938 ) ) ( not ( = ?auto_1494940 ?auto_1494942 ) ) ( not ( = ?auto_1494940 ?auto_1494944 ) ) ( not ( = ?auto_1494940 ?auto_1494943 ) ) ( not ( = ?auto_1494940 ?auto_1494945 ) ) ( not ( = ?auto_1494940 ?auto_1494946 ) ) ( not ( = ?auto_1494940 ?auto_1494947 ) ) ( not ( = ?auto_1494940 ?auto_1494948 ) ) ( not ( = ?auto_1494940 ?auto_1494949 ) ) ( not ( = ?auto_1494940 ?auto_1494950 ) ) ( not ( = ?auto_1494940 ?auto_1494951 ) ) ( not ( = ?auto_1494940 ?auto_1494952 ) ) ( not ( = ?auto_1494940 ?auto_1494953 ) ) ( not ( = ?auto_1494941 ?auto_1494938 ) ) ( not ( = ?auto_1494941 ?auto_1494942 ) ) ( not ( = ?auto_1494941 ?auto_1494944 ) ) ( not ( = ?auto_1494941 ?auto_1494943 ) ) ( not ( = ?auto_1494941 ?auto_1494945 ) ) ( not ( = ?auto_1494941 ?auto_1494946 ) ) ( not ( = ?auto_1494941 ?auto_1494947 ) ) ( not ( = ?auto_1494941 ?auto_1494948 ) ) ( not ( = ?auto_1494941 ?auto_1494949 ) ) ( not ( = ?auto_1494941 ?auto_1494950 ) ) ( not ( = ?auto_1494941 ?auto_1494951 ) ) ( not ( = ?auto_1494941 ?auto_1494952 ) ) ( not ( = ?auto_1494941 ?auto_1494953 ) ) ( not ( = ?auto_1494938 ?auto_1494942 ) ) ( not ( = ?auto_1494938 ?auto_1494944 ) ) ( not ( = ?auto_1494938 ?auto_1494943 ) ) ( not ( = ?auto_1494938 ?auto_1494945 ) ) ( not ( = ?auto_1494938 ?auto_1494946 ) ) ( not ( = ?auto_1494938 ?auto_1494947 ) ) ( not ( = ?auto_1494938 ?auto_1494948 ) ) ( not ( = ?auto_1494938 ?auto_1494949 ) ) ( not ( = ?auto_1494938 ?auto_1494950 ) ) ( not ( = ?auto_1494938 ?auto_1494951 ) ) ( not ( = ?auto_1494938 ?auto_1494952 ) ) ( not ( = ?auto_1494938 ?auto_1494953 ) ) ( not ( = ?auto_1494942 ?auto_1494944 ) ) ( not ( = ?auto_1494942 ?auto_1494943 ) ) ( not ( = ?auto_1494942 ?auto_1494945 ) ) ( not ( = ?auto_1494942 ?auto_1494946 ) ) ( not ( = ?auto_1494942 ?auto_1494947 ) ) ( not ( = ?auto_1494942 ?auto_1494948 ) ) ( not ( = ?auto_1494942 ?auto_1494949 ) ) ( not ( = ?auto_1494942 ?auto_1494950 ) ) ( not ( = ?auto_1494942 ?auto_1494951 ) ) ( not ( = ?auto_1494942 ?auto_1494952 ) ) ( not ( = ?auto_1494942 ?auto_1494953 ) ) ( not ( = ?auto_1494944 ?auto_1494943 ) ) ( not ( = ?auto_1494944 ?auto_1494945 ) ) ( not ( = ?auto_1494944 ?auto_1494946 ) ) ( not ( = ?auto_1494944 ?auto_1494947 ) ) ( not ( = ?auto_1494944 ?auto_1494948 ) ) ( not ( = ?auto_1494944 ?auto_1494949 ) ) ( not ( = ?auto_1494944 ?auto_1494950 ) ) ( not ( = ?auto_1494944 ?auto_1494951 ) ) ( not ( = ?auto_1494944 ?auto_1494952 ) ) ( not ( = ?auto_1494944 ?auto_1494953 ) ) ( not ( = ?auto_1494943 ?auto_1494945 ) ) ( not ( = ?auto_1494943 ?auto_1494946 ) ) ( not ( = ?auto_1494943 ?auto_1494947 ) ) ( not ( = ?auto_1494943 ?auto_1494948 ) ) ( not ( = ?auto_1494943 ?auto_1494949 ) ) ( not ( = ?auto_1494943 ?auto_1494950 ) ) ( not ( = ?auto_1494943 ?auto_1494951 ) ) ( not ( = ?auto_1494943 ?auto_1494952 ) ) ( not ( = ?auto_1494943 ?auto_1494953 ) ) ( not ( = ?auto_1494945 ?auto_1494946 ) ) ( not ( = ?auto_1494945 ?auto_1494947 ) ) ( not ( = ?auto_1494945 ?auto_1494948 ) ) ( not ( = ?auto_1494945 ?auto_1494949 ) ) ( not ( = ?auto_1494945 ?auto_1494950 ) ) ( not ( = ?auto_1494945 ?auto_1494951 ) ) ( not ( = ?auto_1494945 ?auto_1494952 ) ) ( not ( = ?auto_1494945 ?auto_1494953 ) ) ( not ( = ?auto_1494946 ?auto_1494947 ) ) ( not ( = ?auto_1494946 ?auto_1494948 ) ) ( not ( = ?auto_1494946 ?auto_1494949 ) ) ( not ( = ?auto_1494946 ?auto_1494950 ) ) ( not ( = ?auto_1494946 ?auto_1494951 ) ) ( not ( = ?auto_1494946 ?auto_1494952 ) ) ( not ( = ?auto_1494946 ?auto_1494953 ) ) ( not ( = ?auto_1494947 ?auto_1494948 ) ) ( not ( = ?auto_1494947 ?auto_1494949 ) ) ( not ( = ?auto_1494947 ?auto_1494950 ) ) ( not ( = ?auto_1494947 ?auto_1494951 ) ) ( not ( = ?auto_1494947 ?auto_1494952 ) ) ( not ( = ?auto_1494947 ?auto_1494953 ) ) ( not ( = ?auto_1494948 ?auto_1494949 ) ) ( not ( = ?auto_1494948 ?auto_1494950 ) ) ( not ( = ?auto_1494948 ?auto_1494951 ) ) ( not ( = ?auto_1494948 ?auto_1494952 ) ) ( not ( = ?auto_1494948 ?auto_1494953 ) ) ( not ( = ?auto_1494949 ?auto_1494950 ) ) ( not ( = ?auto_1494949 ?auto_1494951 ) ) ( not ( = ?auto_1494949 ?auto_1494952 ) ) ( not ( = ?auto_1494949 ?auto_1494953 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1494950 ?auto_1494951 ?auto_1494952 )
      ( MAKE-14CRATE-VERIFY ?auto_1494939 ?auto_1494940 ?auto_1494941 ?auto_1494938 ?auto_1494942 ?auto_1494944 ?auto_1494943 ?auto_1494945 ?auto_1494946 ?auto_1494947 ?auto_1494948 ?auto_1494949 ?auto_1494950 ?auto_1494951 ?auto_1494952 ) )
  )

)

