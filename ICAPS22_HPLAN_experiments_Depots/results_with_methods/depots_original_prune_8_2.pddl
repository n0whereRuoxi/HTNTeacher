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
      ?auto_13536 - SURFACE
      ?auto_13537 - SURFACE
    )
    :vars
    (
      ?auto_13538 - HOIST
      ?auto_13539 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13538 ?auto_13539 ) ( SURFACE-AT ?auto_13537 ?auto_13539 ) ( CLEAR ?auto_13537 ) ( LIFTING ?auto_13538 ?auto_13536 ) ( IS-CRATE ?auto_13536 ) ( not ( = ?auto_13536 ?auto_13537 ) ) )
    :subtasks
    ( ( !DROP ?auto_13538 ?auto_13536 ?auto_13537 ?auto_13539 )
      ( MAKE-ON-VERIFY ?auto_13536 ?auto_13537 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_13540 - SURFACE
      ?auto_13541 - SURFACE
    )
    :vars
    (
      ?auto_13543 - HOIST
      ?auto_13542 - PLACE
      ?auto_13544 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13543 ?auto_13542 ) ( SURFACE-AT ?auto_13541 ?auto_13542 ) ( CLEAR ?auto_13541 ) ( IS-CRATE ?auto_13540 ) ( not ( = ?auto_13540 ?auto_13541 ) ) ( TRUCK-AT ?auto_13544 ?auto_13542 ) ( AVAILABLE ?auto_13543 ) ( IN ?auto_13540 ?auto_13544 ) )
    :subtasks
    ( ( !UNLOAD ?auto_13543 ?auto_13540 ?auto_13544 ?auto_13542 )
      ( MAKE-ON ?auto_13540 ?auto_13541 )
      ( MAKE-ON-VERIFY ?auto_13540 ?auto_13541 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_13545 - SURFACE
      ?auto_13546 - SURFACE
    )
    :vars
    (
      ?auto_13547 - HOIST
      ?auto_13548 - PLACE
      ?auto_13549 - TRUCK
      ?auto_13550 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13547 ?auto_13548 ) ( SURFACE-AT ?auto_13546 ?auto_13548 ) ( CLEAR ?auto_13546 ) ( IS-CRATE ?auto_13545 ) ( not ( = ?auto_13545 ?auto_13546 ) ) ( AVAILABLE ?auto_13547 ) ( IN ?auto_13545 ?auto_13549 ) ( TRUCK-AT ?auto_13549 ?auto_13550 ) ( not ( = ?auto_13550 ?auto_13548 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_13549 ?auto_13550 ?auto_13548 )
      ( MAKE-ON ?auto_13545 ?auto_13546 )
      ( MAKE-ON-VERIFY ?auto_13545 ?auto_13546 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_13551 - SURFACE
      ?auto_13552 - SURFACE
    )
    :vars
    (
      ?auto_13556 - HOIST
      ?auto_13553 - PLACE
      ?auto_13554 - TRUCK
      ?auto_13555 - PLACE
      ?auto_13557 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_13556 ?auto_13553 ) ( SURFACE-AT ?auto_13552 ?auto_13553 ) ( CLEAR ?auto_13552 ) ( IS-CRATE ?auto_13551 ) ( not ( = ?auto_13551 ?auto_13552 ) ) ( AVAILABLE ?auto_13556 ) ( TRUCK-AT ?auto_13554 ?auto_13555 ) ( not ( = ?auto_13555 ?auto_13553 ) ) ( HOIST-AT ?auto_13557 ?auto_13555 ) ( LIFTING ?auto_13557 ?auto_13551 ) ( not ( = ?auto_13556 ?auto_13557 ) ) )
    :subtasks
    ( ( !LOAD ?auto_13557 ?auto_13551 ?auto_13554 ?auto_13555 )
      ( MAKE-ON ?auto_13551 ?auto_13552 )
      ( MAKE-ON-VERIFY ?auto_13551 ?auto_13552 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_13558 - SURFACE
      ?auto_13559 - SURFACE
    )
    :vars
    (
      ?auto_13562 - HOIST
      ?auto_13560 - PLACE
      ?auto_13564 - TRUCK
      ?auto_13561 - PLACE
      ?auto_13563 - HOIST
      ?auto_13565 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13562 ?auto_13560 ) ( SURFACE-AT ?auto_13559 ?auto_13560 ) ( CLEAR ?auto_13559 ) ( IS-CRATE ?auto_13558 ) ( not ( = ?auto_13558 ?auto_13559 ) ) ( AVAILABLE ?auto_13562 ) ( TRUCK-AT ?auto_13564 ?auto_13561 ) ( not ( = ?auto_13561 ?auto_13560 ) ) ( HOIST-AT ?auto_13563 ?auto_13561 ) ( not ( = ?auto_13562 ?auto_13563 ) ) ( AVAILABLE ?auto_13563 ) ( SURFACE-AT ?auto_13558 ?auto_13561 ) ( ON ?auto_13558 ?auto_13565 ) ( CLEAR ?auto_13558 ) ( not ( = ?auto_13558 ?auto_13565 ) ) ( not ( = ?auto_13559 ?auto_13565 ) ) )
    :subtasks
    ( ( !LIFT ?auto_13563 ?auto_13558 ?auto_13565 ?auto_13561 )
      ( MAKE-ON ?auto_13558 ?auto_13559 )
      ( MAKE-ON-VERIFY ?auto_13558 ?auto_13559 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_13566 - SURFACE
      ?auto_13567 - SURFACE
    )
    :vars
    (
      ?auto_13571 - HOIST
      ?auto_13572 - PLACE
      ?auto_13573 - PLACE
      ?auto_13570 - HOIST
      ?auto_13569 - SURFACE
      ?auto_13568 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13571 ?auto_13572 ) ( SURFACE-AT ?auto_13567 ?auto_13572 ) ( CLEAR ?auto_13567 ) ( IS-CRATE ?auto_13566 ) ( not ( = ?auto_13566 ?auto_13567 ) ) ( AVAILABLE ?auto_13571 ) ( not ( = ?auto_13573 ?auto_13572 ) ) ( HOIST-AT ?auto_13570 ?auto_13573 ) ( not ( = ?auto_13571 ?auto_13570 ) ) ( AVAILABLE ?auto_13570 ) ( SURFACE-AT ?auto_13566 ?auto_13573 ) ( ON ?auto_13566 ?auto_13569 ) ( CLEAR ?auto_13566 ) ( not ( = ?auto_13566 ?auto_13569 ) ) ( not ( = ?auto_13567 ?auto_13569 ) ) ( TRUCK-AT ?auto_13568 ?auto_13572 ) )
    :subtasks
    ( ( !DRIVE ?auto_13568 ?auto_13572 ?auto_13573 )
      ( MAKE-ON ?auto_13566 ?auto_13567 )
      ( MAKE-ON-VERIFY ?auto_13566 ?auto_13567 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_13614 - SURFACE
      ?auto_13615 - SURFACE
    )
    :vars
    (
      ?auto_13620 - HOIST
      ?auto_13617 - PLACE
      ?auto_13619 - PLACE
      ?auto_13618 - HOIST
      ?auto_13616 - SURFACE
      ?auto_13621 - TRUCK
      ?auto_13622 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13620 ?auto_13617 ) ( IS-CRATE ?auto_13614 ) ( not ( = ?auto_13614 ?auto_13615 ) ) ( not ( = ?auto_13619 ?auto_13617 ) ) ( HOIST-AT ?auto_13618 ?auto_13619 ) ( not ( = ?auto_13620 ?auto_13618 ) ) ( AVAILABLE ?auto_13618 ) ( SURFACE-AT ?auto_13614 ?auto_13619 ) ( ON ?auto_13614 ?auto_13616 ) ( CLEAR ?auto_13614 ) ( not ( = ?auto_13614 ?auto_13616 ) ) ( not ( = ?auto_13615 ?auto_13616 ) ) ( TRUCK-AT ?auto_13621 ?auto_13617 ) ( SURFACE-AT ?auto_13622 ?auto_13617 ) ( CLEAR ?auto_13622 ) ( LIFTING ?auto_13620 ?auto_13615 ) ( IS-CRATE ?auto_13615 ) ( not ( = ?auto_13614 ?auto_13622 ) ) ( not ( = ?auto_13615 ?auto_13622 ) ) ( not ( = ?auto_13616 ?auto_13622 ) ) )
    :subtasks
    ( ( !DROP ?auto_13620 ?auto_13615 ?auto_13622 ?auto_13617 )
      ( MAKE-ON ?auto_13614 ?auto_13615 )
      ( MAKE-ON-VERIFY ?auto_13614 ?auto_13615 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_13623 - SURFACE
      ?auto_13624 - SURFACE
    )
    :vars
    (
      ?auto_13627 - HOIST
      ?auto_13626 - PLACE
      ?auto_13630 - PLACE
      ?auto_13629 - HOIST
      ?auto_13628 - SURFACE
      ?auto_13631 - TRUCK
      ?auto_13625 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13627 ?auto_13626 ) ( IS-CRATE ?auto_13623 ) ( not ( = ?auto_13623 ?auto_13624 ) ) ( not ( = ?auto_13630 ?auto_13626 ) ) ( HOIST-AT ?auto_13629 ?auto_13630 ) ( not ( = ?auto_13627 ?auto_13629 ) ) ( AVAILABLE ?auto_13629 ) ( SURFACE-AT ?auto_13623 ?auto_13630 ) ( ON ?auto_13623 ?auto_13628 ) ( CLEAR ?auto_13623 ) ( not ( = ?auto_13623 ?auto_13628 ) ) ( not ( = ?auto_13624 ?auto_13628 ) ) ( TRUCK-AT ?auto_13631 ?auto_13626 ) ( SURFACE-AT ?auto_13625 ?auto_13626 ) ( CLEAR ?auto_13625 ) ( IS-CRATE ?auto_13624 ) ( not ( = ?auto_13623 ?auto_13625 ) ) ( not ( = ?auto_13624 ?auto_13625 ) ) ( not ( = ?auto_13628 ?auto_13625 ) ) ( AVAILABLE ?auto_13627 ) ( IN ?auto_13624 ?auto_13631 ) )
    :subtasks
    ( ( !UNLOAD ?auto_13627 ?auto_13624 ?auto_13631 ?auto_13626 )
      ( MAKE-ON ?auto_13623 ?auto_13624 )
      ( MAKE-ON-VERIFY ?auto_13623 ?auto_13624 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_13638 - SURFACE
      ?auto_13639 - SURFACE
    )
    :vars
    (
      ?auto_13645 - HOIST
      ?auto_13643 - PLACE
      ?auto_13641 - PLACE
      ?auto_13642 - HOIST
      ?auto_13640 - SURFACE
      ?auto_13644 - TRUCK
      ?auto_13646 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13645 ?auto_13643 ) ( SURFACE-AT ?auto_13639 ?auto_13643 ) ( CLEAR ?auto_13639 ) ( IS-CRATE ?auto_13638 ) ( not ( = ?auto_13638 ?auto_13639 ) ) ( AVAILABLE ?auto_13645 ) ( not ( = ?auto_13641 ?auto_13643 ) ) ( HOIST-AT ?auto_13642 ?auto_13641 ) ( not ( = ?auto_13645 ?auto_13642 ) ) ( AVAILABLE ?auto_13642 ) ( SURFACE-AT ?auto_13638 ?auto_13641 ) ( ON ?auto_13638 ?auto_13640 ) ( CLEAR ?auto_13638 ) ( not ( = ?auto_13638 ?auto_13640 ) ) ( not ( = ?auto_13639 ?auto_13640 ) ) ( TRUCK-AT ?auto_13644 ?auto_13646 ) ( not ( = ?auto_13646 ?auto_13643 ) ) ( not ( = ?auto_13641 ?auto_13646 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_13644 ?auto_13646 ?auto_13643 )
      ( MAKE-ON ?auto_13638 ?auto_13639 )
      ( MAKE-ON-VERIFY ?auto_13638 ?auto_13639 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_13920 - SURFACE
      ?auto_13921 - SURFACE
    )
    :vars
    (
      ?auto_13925 - HOIST
      ?auto_13922 - PLACE
      ?auto_13923 - TRUCK
      ?auto_13924 - PLACE
      ?auto_13926 - HOIST
      ?auto_13927 - SURFACE
      ?auto_13928 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13925 ?auto_13922 ) ( SURFACE-AT ?auto_13921 ?auto_13922 ) ( CLEAR ?auto_13921 ) ( IS-CRATE ?auto_13920 ) ( not ( = ?auto_13920 ?auto_13921 ) ) ( AVAILABLE ?auto_13925 ) ( TRUCK-AT ?auto_13923 ?auto_13924 ) ( not ( = ?auto_13924 ?auto_13922 ) ) ( HOIST-AT ?auto_13926 ?auto_13924 ) ( not ( = ?auto_13925 ?auto_13926 ) ) ( SURFACE-AT ?auto_13920 ?auto_13924 ) ( ON ?auto_13920 ?auto_13927 ) ( CLEAR ?auto_13920 ) ( not ( = ?auto_13920 ?auto_13927 ) ) ( not ( = ?auto_13921 ?auto_13927 ) ) ( LIFTING ?auto_13926 ?auto_13928 ) ( IS-CRATE ?auto_13928 ) ( not ( = ?auto_13920 ?auto_13928 ) ) ( not ( = ?auto_13921 ?auto_13928 ) ) ( not ( = ?auto_13927 ?auto_13928 ) ) )
    :subtasks
    ( ( !LOAD ?auto_13926 ?auto_13928 ?auto_13923 ?auto_13924 )
      ( MAKE-ON ?auto_13920 ?auto_13921 )
      ( MAKE-ON-VERIFY ?auto_13920 ?auto_13921 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_14048 - SURFACE
      ?auto_14049 - SURFACE
    )
    :vars
    (
      ?auto_14054 - HOIST
      ?auto_14052 - PLACE
      ?auto_14051 - PLACE
      ?auto_14055 - HOIST
      ?auto_14050 - SURFACE
      ?auto_14053 - TRUCK
      ?auto_14056 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14054 ?auto_14052 ) ( SURFACE-AT ?auto_14049 ?auto_14052 ) ( CLEAR ?auto_14049 ) ( IS-CRATE ?auto_14048 ) ( not ( = ?auto_14048 ?auto_14049 ) ) ( not ( = ?auto_14051 ?auto_14052 ) ) ( HOIST-AT ?auto_14055 ?auto_14051 ) ( not ( = ?auto_14054 ?auto_14055 ) ) ( AVAILABLE ?auto_14055 ) ( SURFACE-AT ?auto_14048 ?auto_14051 ) ( ON ?auto_14048 ?auto_14050 ) ( CLEAR ?auto_14048 ) ( not ( = ?auto_14048 ?auto_14050 ) ) ( not ( = ?auto_14049 ?auto_14050 ) ) ( TRUCK-AT ?auto_14053 ?auto_14052 ) ( LIFTING ?auto_14054 ?auto_14056 ) ( IS-CRATE ?auto_14056 ) ( not ( = ?auto_14048 ?auto_14056 ) ) ( not ( = ?auto_14049 ?auto_14056 ) ) ( not ( = ?auto_14050 ?auto_14056 ) ) )
    :subtasks
    ( ( !LOAD ?auto_14054 ?auto_14056 ?auto_14053 ?auto_14052 )
      ( MAKE-ON ?auto_14048 ?auto_14049 )
      ( MAKE-ON-VERIFY ?auto_14048 ?auto_14049 ) )
  )

)

