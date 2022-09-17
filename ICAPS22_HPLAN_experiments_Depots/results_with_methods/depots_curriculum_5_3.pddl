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
      ?auto_602 - SURFACE
      ?auto_603 - SURFACE
    )
    :vars
    (
      ?auto_604 - HOIST
      ?auto_605 - PLACE
      ?auto_607 - PLACE
      ?auto_608 - HOIST
      ?auto_609 - SURFACE
      ?auto_606 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_604 ?auto_605 ) ( SURFACE-AT ?auto_603 ?auto_605 ) ( CLEAR ?auto_603 ) ( IS-CRATE ?auto_602 ) ( AVAILABLE ?auto_604 ) ( not ( = ?auto_607 ?auto_605 ) ) ( HOIST-AT ?auto_608 ?auto_607 ) ( AVAILABLE ?auto_608 ) ( SURFACE-AT ?auto_602 ?auto_607 ) ( ON ?auto_602 ?auto_609 ) ( CLEAR ?auto_602 ) ( TRUCK-AT ?auto_606 ?auto_605 ) ( not ( = ?auto_602 ?auto_603 ) ) ( not ( = ?auto_602 ?auto_609 ) ) ( not ( = ?auto_603 ?auto_609 ) ) ( not ( = ?auto_604 ?auto_608 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_606 ?auto_605 ?auto_607 )
      ( !LIFT ?auto_608 ?auto_602 ?auto_609 ?auto_607 )
      ( !LOAD ?auto_608 ?auto_602 ?auto_606 ?auto_607 )
      ( !DRIVE ?auto_606 ?auto_607 ?auto_605 )
      ( !UNLOAD ?auto_604 ?auto_602 ?auto_606 ?auto_605 )
      ( !DROP ?auto_604 ?auto_602 ?auto_603 ?auto_605 )
      ( MAKE-ON-VERIFY ?auto_602 ?auto_603 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_612 - SURFACE
      ?auto_613 - SURFACE
    )
    :vars
    (
      ?auto_614 - HOIST
      ?auto_615 - PLACE
      ?auto_617 - PLACE
      ?auto_618 - HOIST
      ?auto_619 - SURFACE
      ?auto_616 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_614 ?auto_615 ) ( SURFACE-AT ?auto_613 ?auto_615 ) ( CLEAR ?auto_613 ) ( IS-CRATE ?auto_612 ) ( AVAILABLE ?auto_614 ) ( not ( = ?auto_617 ?auto_615 ) ) ( HOIST-AT ?auto_618 ?auto_617 ) ( AVAILABLE ?auto_618 ) ( SURFACE-AT ?auto_612 ?auto_617 ) ( ON ?auto_612 ?auto_619 ) ( CLEAR ?auto_612 ) ( TRUCK-AT ?auto_616 ?auto_615 ) ( not ( = ?auto_612 ?auto_613 ) ) ( not ( = ?auto_612 ?auto_619 ) ) ( not ( = ?auto_613 ?auto_619 ) ) ( not ( = ?auto_614 ?auto_618 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_616 ?auto_615 ?auto_617 )
      ( !LIFT ?auto_618 ?auto_612 ?auto_619 ?auto_617 )
      ( !LOAD ?auto_618 ?auto_612 ?auto_616 ?auto_617 )
      ( !DRIVE ?auto_616 ?auto_617 ?auto_615 )
      ( !UNLOAD ?auto_614 ?auto_612 ?auto_616 ?auto_615 )
      ( !DROP ?auto_614 ?auto_612 ?auto_613 ?auto_615 )
      ( MAKE-ON-VERIFY ?auto_612 ?auto_613 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_622 - SURFACE
      ?auto_623 - SURFACE
    )
    :vars
    (
      ?auto_624 - HOIST
      ?auto_625 - PLACE
      ?auto_627 - PLACE
      ?auto_628 - HOIST
      ?auto_629 - SURFACE
      ?auto_626 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_624 ?auto_625 ) ( SURFACE-AT ?auto_623 ?auto_625 ) ( CLEAR ?auto_623 ) ( IS-CRATE ?auto_622 ) ( AVAILABLE ?auto_624 ) ( not ( = ?auto_627 ?auto_625 ) ) ( HOIST-AT ?auto_628 ?auto_627 ) ( AVAILABLE ?auto_628 ) ( SURFACE-AT ?auto_622 ?auto_627 ) ( ON ?auto_622 ?auto_629 ) ( CLEAR ?auto_622 ) ( TRUCK-AT ?auto_626 ?auto_625 ) ( not ( = ?auto_622 ?auto_623 ) ) ( not ( = ?auto_622 ?auto_629 ) ) ( not ( = ?auto_623 ?auto_629 ) ) ( not ( = ?auto_624 ?auto_628 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_626 ?auto_625 ?auto_627 )
      ( !LIFT ?auto_628 ?auto_622 ?auto_629 ?auto_627 )
      ( !LOAD ?auto_628 ?auto_622 ?auto_626 ?auto_627 )
      ( !DRIVE ?auto_626 ?auto_627 ?auto_625 )
      ( !UNLOAD ?auto_624 ?auto_622 ?auto_626 ?auto_625 )
      ( !DROP ?auto_624 ?auto_622 ?auto_623 ?auto_625 )
      ( MAKE-ON-VERIFY ?auto_622 ?auto_623 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_632 - SURFACE
      ?auto_633 - SURFACE
    )
    :vars
    (
      ?auto_634 - HOIST
      ?auto_635 - PLACE
      ?auto_637 - PLACE
      ?auto_638 - HOIST
      ?auto_639 - SURFACE
      ?auto_636 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_634 ?auto_635 ) ( SURFACE-AT ?auto_633 ?auto_635 ) ( CLEAR ?auto_633 ) ( IS-CRATE ?auto_632 ) ( AVAILABLE ?auto_634 ) ( not ( = ?auto_637 ?auto_635 ) ) ( HOIST-AT ?auto_638 ?auto_637 ) ( AVAILABLE ?auto_638 ) ( SURFACE-AT ?auto_632 ?auto_637 ) ( ON ?auto_632 ?auto_639 ) ( CLEAR ?auto_632 ) ( TRUCK-AT ?auto_636 ?auto_635 ) ( not ( = ?auto_632 ?auto_633 ) ) ( not ( = ?auto_632 ?auto_639 ) ) ( not ( = ?auto_633 ?auto_639 ) ) ( not ( = ?auto_634 ?auto_638 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_636 ?auto_635 ?auto_637 )
      ( !LIFT ?auto_638 ?auto_632 ?auto_639 ?auto_637 )
      ( !LOAD ?auto_638 ?auto_632 ?auto_636 ?auto_637 )
      ( !DRIVE ?auto_636 ?auto_637 ?auto_635 )
      ( !UNLOAD ?auto_634 ?auto_632 ?auto_636 ?auto_635 )
      ( !DROP ?auto_634 ?auto_632 ?auto_633 ?auto_635 )
      ( MAKE-ON-VERIFY ?auto_632 ?auto_633 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_642 - SURFACE
      ?auto_643 - SURFACE
    )
    :vars
    (
      ?auto_644 - HOIST
      ?auto_645 - PLACE
      ?auto_647 - PLACE
      ?auto_648 - HOIST
      ?auto_649 - SURFACE
      ?auto_646 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_644 ?auto_645 ) ( SURFACE-AT ?auto_643 ?auto_645 ) ( CLEAR ?auto_643 ) ( IS-CRATE ?auto_642 ) ( AVAILABLE ?auto_644 ) ( not ( = ?auto_647 ?auto_645 ) ) ( HOIST-AT ?auto_648 ?auto_647 ) ( AVAILABLE ?auto_648 ) ( SURFACE-AT ?auto_642 ?auto_647 ) ( ON ?auto_642 ?auto_649 ) ( CLEAR ?auto_642 ) ( TRUCK-AT ?auto_646 ?auto_645 ) ( not ( = ?auto_642 ?auto_643 ) ) ( not ( = ?auto_642 ?auto_649 ) ) ( not ( = ?auto_643 ?auto_649 ) ) ( not ( = ?auto_644 ?auto_648 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_646 ?auto_645 ?auto_647 )
      ( !LIFT ?auto_648 ?auto_642 ?auto_649 ?auto_647 )
      ( !LOAD ?auto_648 ?auto_642 ?auto_646 ?auto_647 )
      ( !DRIVE ?auto_646 ?auto_647 ?auto_645 )
      ( !UNLOAD ?auto_644 ?auto_642 ?auto_646 ?auto_645 )
      ( !DROP ?auto_644 ?auto_642 ?auto_643 ?auto_645 )
      ( MAKE-ON-VERIFY ?auto_642 ?auto_643 ) )
  )

)

