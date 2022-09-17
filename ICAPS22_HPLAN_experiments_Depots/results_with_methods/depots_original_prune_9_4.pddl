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
      ?auto_20040 - SURFACE
      ?auto_20041 - SURFACE
    )
    :vars
    (
      ?auto_20042 - HOIST
      ?auto_20043 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20042 ?auto_20043 ) ( SURFACE-AT ?auto_20041 ?auto_20043 ) ( CLEAR ?auto_20041 ) ( LIFTING ?auto_20042 ?auto_20040 ) ( IS-CRATE ?auto_20040 ) ( not ( = ?auto_20040 ?auto_20041 ) ) )
    :subtasks
    ( ( !DROP ?auto_20042 ?auto_20040 ?auto_20041 ?auto_20043 )
      ( MAKE-ON-VERIFY ?auto_20040 ?auto_20041 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_20044 - SURFACE
      ?auto_20045 - SURFACE
    )
    :vars
    (
      ?auto_20046 - HOIST
      ?auto_20047 - PLACE
      ?auto_20048 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20046 ?auto_20047 ) ( SURFACE-AT ?auto_20045 ?auto_20047 ) ( CLEAR ?auto_20045 ) ( IS-CRATE ?auto_20044 ) ( not ( = ?auto_20044 ?auto_20045 ) ) ( TRUCK-AT ?auto_20048 ?auto_20047 ) ( AVAILABLE ?auto_20046 ) ( IN ?auto_20044 ?auto_20048 ) )
    :subtasks
    ( ( !UNLOAD ?auto_20046 ?auto_20044 ?auto_20048 ?auto_20047 )
      ( MAKE-ON ?auto_20044 ?auto_20045 )
      ( MAKE-ON-VERIFY ?auto_20044 ?auto_20045 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_20049 - SURFACE
      ?auto_20050 - SURFACE
    )
    :vars
    (
      ?auto_20052 - HOIST
      ?auto_20051 - PLACE
      ?auto_20053 - TRUCK
      ?auto_20054 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20052 ?auto_20051 ) ( SURFACE-AT ?auto_20050 ?auto_20051 ) ( CLEAR ?auto_20050 ) ( IS-CRATE ?auto_20049 ) ( not ( = ?auto_20049 ?auto_20050 ) ) ( AVAILABLE ?auto_20052 ) ( IN ?auto_20049 ?auto_20053 ) ( TRUCK-AT ?auto_20053 ?auto_20054 ) ( not ( = ?auto_20054 ?auto_20051 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_20053 ?auto_20054 ?auto_20051 )
      ( MAKE-ON ?auto_20049 ?auto_20050 )
      ( MAKE-ON-VERIFY ?auto_20049 ?auto_20050 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_20055 - SURFACE
      ?auto_20056 - SURFACE
    )
    :vars
    (
      ?auto_20059 - HOIST
      ?auto_20058 - PLACE
      ?auto_20060 - TRUCK
      ?auto_20057 - PLACE
      ?auto_20061 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_20059 ?auto_20058 ) ( SURFACE-AT ?auto_20056 ?auto_20058 ) ( CLEAR ?auto_20056 ) ( IS-CRATE ?auto_20055 ) ( not ( = ?auto_20055 ?auto_20056 ) ) ( AVAILABLE ?auto_20059 ) ( TRUCK-AT ?auto_20060 ?auto_20057 ) ( not ( = ?auto_20057 ?auto_20058 ) ) ( HOIST-AT ?auto_20061 ?auto_20057 ) ( LIFTING ?auto_20061 ?auto_20055 ) ( not ( = ?auto_20059 ?auto_20061 ) ) )
    :subtasks
    ( ( !LOAD ?auto_20061 ?auto_20055 ?auto_20060 ?auto_20057 )
      ( MAKE-ON ?auto_20055 ?auto_20056 )
      ( MAKE-ON-VERIFY ?auto_20055 ?auto_20056 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_20062 - SURFACE
      ?auto_20063 - SURFACE
    )
    :vars
    (
      ?auto_20064 - HOIST
      ?auto_20066 - PLACE
      ?auto_20067 - TRUCK
      ?auto_20068 - PLACE
      ?auto_20065 - HOIST
      ?auto_20069 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20064 ?auto_20066 ) ( SURFACE-AT ?auto_20063 ?auto_20066 ) ( CLEAR ?auto_20063 ) ( IS-CRATE ?auto_20062 ) ( not ( = ?auto_20062 ?auto_20063 ) ) ( AVAILABLE ?auto_20064 ) ( TRUCK-AT ?auto_20067 ?auto_20068 ) ( not ( = ?auto_20068 ?auto_20066 ) ) ( HOIST-AT ?auto_20065 ?auto_20068 ) ( not ( = ?auto_20064 ?auto_20065 ) ) ( AVAILABLE ?auto_20065 ) ( SURFACE-AT ?auto_20062 ?auto_20068 ) ( ON ?auto_20062 ?auto_20069 ) ( CLEAR ?auto_20062 ) ( not ( = ?auto_20062 ?auto_20069 ) ) ( not ( = ?auto_20063 ?auto_20069 ) ) )
    :subtasks
    ( ( !LIFT ?auto_20065 ?auto_20062 ?auto_20069 ?auto_20068 )
      ( MAKE-ON ?auto_20062 ?auto_20063 )
      ( MAKE-ON-VERIFY ?auto_20062 ?auto_20063 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_20070 - SURFACE
      ?auto_20071 - SURFACE
    )
    :vars
    (
      ?auto_20073 - HOIST
      ?auto_20077 - PLACE
      ?auto_20072 - PLACE
      ?auto_20074 - HOIST
      ?auto_20075 - SURFACE
      ?auto_20076 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20073 ?auto_20077 ) ( SURFACE-AT ?auto_20071 ?auto_20077 ) ( CLEAR ?auto_20071 ) ( IS-CRATE ?auto_20070 ) ( not ( = ?auto_20070 ?auto_20071 ) ) ( AVAILABLE ?auto_20073 ) ( not ( = ?auto_20072 ?auto_20077 ) ) ( HOIST-AT ?auto_20074 ?auto_20072 ) ( not ( = ?auto_20073 ?auto_20074 ) ) ( AVAILABLE ?auto_20074 ) ( SURFACE-AT ?auto_20070 ?auto_20072 ) ( ON ?auto_20070 ?auto_20075 ) ( CLEAR ?auto_20070 ) ( not ( = ?auto_20070 ?auto_20075 ) ) ( not ( = ?auto_20071 ?auto_20075 ) ) ( TRUCK-AT ?auto_20076 ?auto_20077 ) )
    :subtasks
    ( ( !DRIVE ?auto_20076 ?auto_20077 ?auto_20072 )
      ( MAKE-ON ?auto_20070 ?auto_20071 )
      ( MAKE-ON-VERIFY ?auto_20070 ?auto_20071 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_20118 - SURFACE
      ?auto_20119 - SURFACE
    )
    :vars
    (
      ?auto_20121 - HOIST
      ?auto_20125 - PLACE
      ?auto_20122 - PLACE
      ?auto_20123 - HOIST
      ?auto_20124 - SURFACE
      ?auto_20120 - TRUCK
      ?auto_20126 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20121 ?auto_20125 ) ( IS-CRATE ?auto_20118 ) ( not ( = ?auto_20118 ?auto_20119 ) ) ( not ( = ?auto_20122 ?auto_20125 ) ) ( HOIST-AT ?auto_20123 ?auto_20122 ) ( not ( = ?auto_20121 ?auto_20123 ) ) ( AVAILABLE ?auto_20123 ) ( SURFACE-AT ?auto_20118 ?auto_20122 ) ( ON ?auto_20118 ?auto_20124 ) ( CLEAR ?auto_20118 ) ( not ( = ?auto_20118 ?auto_20124 ) ) ( not ( = ?auto_20119 ?auto_20124 ) ) ( TRUCK-AT ?auto_20120 ?auto_20125 ) ( SURFACE-AT ?auto_20126 ?auto_20125 ) ( CLEAR ?auto_20126 ) ( LIFTING ?auto_20121 ?auto_20119 ) ( IS-CRATE ?auto_20119 ) ( not ( = ?auto_20118 ?auto_20126 ) ) ( not ( = ?auto_20119 ?auto_20126 ) ) ( not ( = ?auto_20124 ?auto_20126 ) ) )
    :subtasks
    ( ( !DROP ?auto_20121 ?auto_20119 ?auto_20126 ?auto_20125 )
      ( MAKE-ON ?auto_20118 ?auto_20119 )
      ( MAKE-ON-VERIFY ?auto_20118 ?auto_20119 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_20127 - SURFACE
      ?auto_20128 - SURFACE
    )
    :vars
    (
      ?auto_20132 - HOIST
      ?auto_20133 - PLACE
      ?auto_20131 - PLACE
      ?auto_20130 - HOIST
      ?auto_20129 - SURFACE
      ?auto_20134 - TRUCK
      ?auto_20135 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20132 ?auto_20133 ) ( IS-CRATE ?auto_20127 ) ( not ( = ?auto_20127 ?auto_20128 ) ) ( not ( = ?auto_20131 ?auto_20133 ) ) ( HOIST-AT ?auto_20130 ?auto_20131 ) ( not ( = ?auto_20132 ?auto_20130 ) ) ( AVAILABLE ?auto_20130 ) ( SURFACE-AT ?auto_20127 ?auto_20131 ) ( ON ?auto_20127 ?auto_20129 ) ( CLEAR ?auto_20127 ) ( not ( = ?auto_20127 ?auto_20129 ) ) ( not ( = ?auto_20128 ?auto_20129 ) ) ( TRUCK-AT ?auto_20134 ?auto_20133 ) ( SURFACE-AT ?auto_20135 ?auto_20133 ) ( CLEAR ?auto_20135 ) ( IS-CRATE ?auto_20128 ) ( not ( = ?auto_20127 ?auto_20135 ) ) ( not ( = ?auto_20128 ?auto_20135 ) ) ( not ( = ?auto_20129 ?auto_20135 ) ) ( AVAILABLE ?auto_20132 ) ( IN ?auto_20128 ?auto_20134 ) )
    :subtasks
    ( ( !UNLOAD ?auto_20132 ?auto_20128 ?auto_20134 ?auto_20133 )
      ( MAKE-ON ?auto_20127 ?auto_20128 )
      ( MAKE-ON-VERIFY ?auto_20127 ?auto_20128 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_20142 - SURFACE
      ?auto_20143 - SURFACE
    )
    :vars
    (
      ?auto_20144 - HOIST
      ?auto_20149 - PLACE
      ?auto_20146 - PLACE
      ?auto_20145 - HOIST
      ?auto_20148 - SURFACE
      ?auto_20147 - TRUCK
      ?auto_20150 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20144 ?auto_20149 ) ( SURFACE-AT ?auto_20143 ?auto_20149 ) ( CLEAR ?auto_20143 ) ( IS-CRATE ?auto_20142 ) ( not ( = ?auto_20142 ?auto_20143 ) ) ( AVAILABLE ?auto_20144 ) ( not ( = ?auto_20146 ?auto_20149 ) ) ( HOIST-AT ?auto_20145 ?auto_20146 ) ( not ( = ?auto_20144 ?auto_20145 ) ) ( AVAILABLE ?auto_20145 ) ( SURFACE-AT ?auto_20142 ?auto_20146 ) ( ON ?auto_20142 ?auto_20148 ) ( CLEAR ?auto_20142 ) ( not ( = ?auto_20142 ?auto_20148 ) ) ( not ( = ?auto_20143 ?auto_20148 ) ) ( TRUCK-AT ?auto_20147 ?auto_20150 ) ( not ( = ?auto_20150 ?auto_20149 ) ) ( not ( = ?auto_20146 ?auto_20150 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_20147 ?auto_20150 ?auto_20149 )
      ( MAKE-ON ?auto_20142 ?auto_20143 )
      ( MAKE-ON-VERIFY ?auto_20142 ?auto_20143 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_20621 - SURFACE
      ?auto_20622 - SURFACE
    )
    :vars
    (
      ?auto_20626 - HOIST
      ?auto_20628 - PLACE
      ?auto_20625 - PLACE
      ?auto_20624 - HOIST
      ?auto_20629 - SURFACE
      ?auto_20623 - SURFACE
      ?auto_20627 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20626 ?auto_20628 ) ( IS-CRATE ?auto_20621 ) ( not ( = ?auto_20621 ?auto_20622 ) ) ( not ( = ?auto_20625 ?auto_20628 ) ) ( HOIST-AT ?auto_20624 ?auto_20625 ) ( not ( = ?auto_20626 ?auto_20624 ) ) ( AVAILABLE ?auto_20624 ) ( SURFACE-AT ?auto_20621 ?auto_20625 ) ( ON ?auto_20621 ?auto_20629 ) ( CLEAR ?auto_20621 ) ( not ( = ?auto_20621 ?auto_20629 ) ) ( not ( = ?auto_20622 ?auto_20629 ) ) ( SURFACE-AT ?auto_20623 ?auto_20628 ) ( CLEAR ?auto_20623 ) ( IS-CRATE ?auto_20622 ) ( not ( = ?auto_20621 ?auto_20623 ) ) ( not ( = ?auto_20622 ?auto_20623 ) ) ( not ( = ?auto_20629 ?auto_20623 ) ) ( AVAILABLE ?auto_20626 ) ( IN ?auto_20622 ?auto_20627 ) ( TRUCK-AT ?auto_20627 ?auto_20625 ) )
    :subtasks
    ( ( !DRIVE ?auto_20627 ?auto_20625 ?auto_20628 )
      ( MAKE-ON ?auto_20621 ?auto_20622 )
      ( MAKE-ON-VERIFY ?auto_20621 ?auto_20622 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_20630 - SURFACE
      ?auto_20631 - SURFACE
    )
    :vars
    (
      ?auto_20635 - HOIST
      ?auto_20634 - PLACE
      ?auto_20637 - PLACE
      ?auto_20636 - HOIST
      ?auto_20632 - SURFACE
      ?auto_20633 - SURFACE
      ?auto_20638 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20635 ?auto_20634 ) ( IS-CRATE ?auto_20630 ) ( not ( = ?auto_20630 ?auto_20631 ) ) ( not ( = ?auto_20637 ?auto_20634 ) ) ( HOIST-AT ?auto_20636 ?auto_20637 ) ( not ( = ?auto_20635 ?auto_20636 ) ) ( SURFACE-AT ?auto_20630 ?auto_20637 ) ( ON ?auto_20630 ?auto_20632 ) ( CLEAR ?auto_20630 ) ( not ( = ?auto_20630 ?auto_20632 ) ) ( not ( = ?auto_20631 ?auto_20632 ) ) ( SURFACE-AT ?auto_20633 ?auto_20634 ) ( CLEAR ?auto_20633 ) ( IS-CRATE ?auto_20631 ) ( not ( = ?auto_20630 ?auto_20633 ) ) ( not ( = ?auto_20631 ?auto_20633 ) ) ( not ( = ?auto_20632 ?auto_20633 ) ) ( AVAILABLE ?auto_20635 ) ( TRUCK-AT ?auto_20638 ?auto_20637 ) ( LIFTING ?auto_20636 ?auto_20631 ) )
    :subtasks
    ( ( !LOAD ?auto_20636 ?auto_20631 ?auto_20638 ?auto_20637 )
      ( MAKE-ON ?auto_20630 ?auto_20631 )
      ( MAKE-ON-VERIFY ?auto_20630 ?auto_20631 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_20639 - SURFACE
      ?auto_20640 - SURFACE
    )
    :vars
    (
      ?auto_20641 - HOIST
      ?auto_20646 - PLACE
      ?auto_20644 - PLACE
      ?auto_20645 - HOIST
      ?auto_20642 - SURFACE
      ?auto_20647 - SURFACE
      ?auto_20643 - TRUCK
      ?auto_20648 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20641 ?auto_20646 ) ( IS-CRATE ?auto_20639 ) ( not ( = ?auto_20639 ?auto_20640 ) ) ( not ( = ?auto_20644 ?auto_20646 ) ) ( HOIST-AT ?auto_20645 ?auto_20644 ) ( not ( = ?auto_20641 ?auto_20645 ) ) ( SURFACE-AT ?auto_20639 ?auto_20644 ) ( ON ?auto_20639 ?auto_20642 ) ( CLEAR ?auto_20639 ) ( not ( = ?auto_20639 ?auto_20642 ) ) ( not ( = ?auto_20640 ?auto_20642 ) ) ( SURFACE-AT ?auto_20647 ?auto_20646 ) ( CLEAR ?auto_20647 ) ( IS-CRATE ?auto_20640 ) ( not ( = ?auto_20639 ?auto_20647 ) ) ( not ( = ?auto_20640 ?auto_20647 ) ) ( not ( = ?auto_20642 ?auto_20647 ) ) ( AVAILABLE ?auto_20641 ) ( TRUCK-AT ?auto_20643 ?auto_20644 ) ( AVAILABLE ?auto_20645 ) ( SURFACE-AT ?auto_20640 ?auto_20644 ) ( ON ?auto_20640 ?auto_20648 ) ( CLEAR ?auto_20640 ) ( not ( = ?auto_20639 ?auto_20648 ) ) ( not ( = ?auto_20640 ?auto_20648 ) ) ( not ( = ?auto_20642 ?auto_20648 ) ) ( not ( = ?auto_20647 ?auto_20648 ) ) )
    :subtasks
    ( ( !LIFT ?auto_20645 ?auto_20640 ?auto_20648 ?auto_20644 )
      ( MAKE-ON ?auto_20639 ?auto_20640 )
      ( MAKE-ON-VERIFY ?auto_20639 ?auto_20640 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_20649 - SURFACE
      ?auto_20650 - SURFACE
    )
    :vars
    (
      ?auto_20656 - HOIST
      ?auto_20654 - PLACE
      ?auto_20655 - PLACE
      ?auto_20651 - HOIST
      ?auto_20657 - SURFACE
      ?auto_20658 - SURFACE
      ?auto_20653 - SURFACE
      ?auto_20652 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20656 ?auto_20654 ) ( IS-CRATE ?auto_20649 ) ( not ( = ?auto_20649 ?auto_20650 ) ) ( not ( = ?auto_20655 ?auto_20654 ) ) ( HOIST-AT ?auto_20651 ?auto_20655 ) ( not ( = ?auto_20656 ?auto_20651 ) ) ( SURFACE-AT ?auto_20649 ?auto_20655 ) ( ON ?auto_20649 ?auto_20657 ) ( CLEAR ?auto_20649 ) ( not ( = ?auto_20649 ?auto_20657 ) ) ( not ( = ?auto_20650 ?auto_20657 ) ) ( SURFACE-AT ?auto_20658 ?auto_20654 ) ( CLEAR ?auto_20658 ) ( IS-CRATE ?auto_20650 ) ( not ( = ?auto_20649 ?auto_20658 ) ) ( not ( = ?auto_20650 ?auto_20658 ) ) ( not ( = ?auto_20657 ?auto_20658 ) ) ( AVAILABLE ?auto_20656 ) ( AVAILABLE ?auto_20651 ) ( SURFACE-AT ?auto_20650 ?auto_20655 ) ( ON ?auto_20650 ?auto_20653 ) ( CLEAR ?auto_20650 ) ( not ( = ?auto_20649 ?auto_20653 ) ) ( not ( = ?auto_20650 ?auto_20653 ) ) ( not ( = ?auto_20657 ?auto_20653 ) ) ( not ( = ?auto_20658 ?auto_20653 ) ) ( TRUCK-AT ?auto_20652 ?auto_20654 ) )
    :subtasks
    ( ( !DRIVE ?auto_20652 ?auto_20654 ?auto_20655 )
      ( MAKE-ON ?auto_20649 ?auto_20650 )
      ( MAKE-ON-VERIFY ?auto_20649 ?auto_20650 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_20659 - SURFACE
      ?auto_20660 - SURFACE
    )
    :vars
    (
      ?auto_20668 - HOIST
      ?auto_20663 - PLACE
      ?auto_20662 - PLACE
      ?auto_20665 - HOIST
      ?auto_20661 - SURFACE
      ?auto_20664 - SURFACE
      ?auto_20667 - SURFACE
      ?auto_20666 - TRUCK
      ?auto_20669 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20668 ?auto_20663 ) ( IS-CRATE ?auto_20659 ) ( not ( = ?auto_20659 ?auto_20660 ) ) ( not ( = ?auto_20662 ?auto_20663 ) ) ( HOIST-AT ?auto_20665 ?auto_20662 ) ( not ( = ?auto_20668 ?auto_20665 ) ) ( SURFACE-AT ?auto_20659 ?auto_20662 ) ( ON ?auto_20659 ?auto_20661 ) ( CLEAR ?auto_20659 ) ( not ( = ?auto_20659 ?auto_20661 ) ) ( not ( = ?auto_20660 ?auto_20661 ) ) ( IS-CRATE ?auto_20660 ) ( not ( = ?auto_20659 ?auto_20664 ) ) ( not ( = ?auto_20660 ?auto_20664 ) ) ( not ( = ?auto_20661 ?auto_20664 ) ) ( AVAILABLE ?auto_20665 ) ( SURFACE-AT ?auto_20660 ?auto_20662 ) ( ON ?auto_20660 ?auto_20667 ) ( CLEAR ?auto_20660 ) ( not ( = ?auto_20659 ?auto_20667 ) ) ( not ( = ?auto_20660 ?auto_20667 ) ) ( not ( = ?auto_20661 ?auto_20667 ) ) ( not ( = ?auto_20664 ?auto_20667 ) ) ( TRUCK-AT ?auto_20666 ?auto_20663 ) ( SURFACE-AT ?auto_20669 ?auto_20663 ) ( CLEAR ?auto_20669 ) ( LIFTING ?auto_20668 ?auto_20664 ) ( IS-CRATE ?auto_20664 ) ( not ( = ?auto_20659 ?auto_20669 ) ) ( not ( = ?auto_20660 ?auto_20669 ) ) ( not ( = ?auto_20661 ?auto_20669 ) ) ( not ( = ?auto_20664 ?auto_20669 ) ) ( not ( = ?auto_20667 ?auto_20669 ) ) )
    :subtasks
    ( ( !DROP ?auto_20668 ?auto_20664 ?auto_20669 ?auto_20663 )
      ( MAKE-ON ?auto_20659 ?auto_20660 )
      ( MAKE-ON-VERIFY ?auto_20659 ?auto_20660 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_20807 - SURFACE
      ?auto_20808 - SURFACE
    )
    :vars
    (
      ?auto_20814 - HOIST
      ?auto_20811 - PLACE
      ?auto_20809 - PLACE
      ?auto_20813 - HOIST
      ?auto_20810 - SURFACE
      ?auto_20812 - TRUCK
      ?auto_20815 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20814 ?auto_20811 ) ( SURFACE-AT ?auto_20808 ?auto_20811 ) ( CLEAR ?auto_20808 ) ( IS-CRATE ?auto_20807 ) ( not ( = ?auto_20807 ?auto_20808 ) ) ( not ( = ?auto_20809 ?auto_20811 ) ) ( HOIST-AT ?auto_20813 ?auto_20809 ) ( not ( = ?auto_20814 ?auto_20813 ) ) ( AVAILABLE ?auto_20813 ) ( SURFACE-AT ?auto_20807 ?auto_20809 ) ( ON ?auto_20807 ?auto_20810 ) ( CLEAR ?auto_20807 ) ( not ( = ?auto_20807 ?auto_20810 ) ) ( not ( = ?auto_20808 ?auto_20810 ) ) ( TRUCK-AT ?auto_20812 ?auto_20811 ) ( LIFTING ?auto_20814 ?auto_20815 ) ( IS-CRATE ?auto_20815 ) ( not ( = ?auto_20807 ?auto_20815 ) ) ( not ( = ?auto_20808 ?auto_20815 ) ) ( not ( = ?auto_20810 ?auto_20815 ) ) )
    :subtasks
    ( ( !LOAD ?auto_20814 ?auto_20815 ?auto_20812 ?auto_20811 )
      ( MAKE-ON ?auto_20807 ?auto_20808 )
      ( MAKE-ON-VERIFY ?auto_20807 ?auto_20808 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_20850 - SURFACE
      ?auto_20851 - SURFACE
    )
    :vars
    (
      ?auto_20854 - HOIST
      ?auto_20855 - PLACE
      ?auto_20852 - TRUCK
      ?auto_20853 - PLACE
      ?auto_20856 - HOIST
      ?auto_20857 - SURFACE
      ?auto_20858 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20854 ?auto_20855 ) ( SURFACE-AT ?auto_20851 ?auto_20855 ) ( CLEAR ?auto_20851 ) ( IS-CRATE ?auto_20850 ) ( not ( = ?auto_20850 ?auto_20851 ) ) ( AVAILABLE ?auto_20854 ) ( TRUCK-AT ?auto_20852 ?auto_20853 ) ( not ( = ?auto_20853 ?auto_20855 ) ) ( HOIST-AT ?auto_20856 ?auto_20853 ) ( not ( = ?auto_20854 ?auto_20856 ) ) ( SURFACE-AT ?auto_20850 ?auto_20853 ) ( ON ?auto_20850 ?auto_20857 ) ( CLEAR ?auto_20850 ) ( not ( = ?auto_20850 ?auto_20857 ) ) ( not ( = ?auto_20851 ?auto_20857 ) ) ( LIFTING ?auto_20856 ?auto_20858 ) ( IS-CRATE ?auto_20858 ) ( not ( = ?auto_20850 ?auto_20858 ) ) ( not ( = ?auto_20851 ?auto_20858 ) ) ( not ( = ?auto_20857 ?auto_20858 ) ) )
    :subtasks
    ( ( !LOAD ?auto_20856 ?auto_20858 ?auto_20852 ?auto_20853 )
      ( MAKE-ON ?auto_20850 ?auto_20851 )
      ( MAKE-ON-VERIFY ?auto_20850 ?auto_20851 ) )
  )

)

