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
      ?auto_2 - SURFACE
      ?auto_3 - SURFACE
    )
    :vars
    (
      ?auto_4 - HOIST
      ?auto_5 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4 ?auto_5 ) ( SURFACE-AT ?auto_3 ?auto_5 ) ( CLEAR ?auto_3 ) ( LIFTING ?auto_4 ?auto_2 ) ( IS-CRATE ?auto_2 ) ( not ( = ?auto_2 ?auto_3 ) ) )
    :subtasks
    ( ( !DROP ?auto_4 ?auto_2 ?auto_3 ?auto_5 )
      ( MAKE-ON-VERIFY ?auto_2 ?auto_3 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_6 - SURFACE
      ?auto_7 - SURFACE
    )
    :vars
    (
      ?auto_9 - HOIST
      ?auto_8 - PLACE
      ?auto_10 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9 ?auto_8 ) ( SURFACE-AT ?auto_7 ?auto_8 ) ( CLEAR ?auto_7 ) ( IS-CRATE ?auto_6 ) ( not ( = ?auto_6 ?auto_7 ) ) ( TRUCK-AT ?auto_10 ?auto_8 ) ( AVAILABLE ?auto_9 ) ( IN ?auto_6 ?auto_10 ) )
    :subtasks
    ( ( !UNLOAD ?auto_9 ?auto_6 ?auto_10 ?auto_8 )
      ( MAKE-ON ?auto_6 ?auto_7 )
      ( MAKE-ON-VERIFY ?auto_6 ?auto_7 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_11 - SURFACE
      ?auto_12 - SURFACE
    )
    :vars
    (
      ?auto_14 - HOIST
      ?auto_15 - PLACE
      ?auto_13 - TRUCK
      ?auto_16 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14 ?auto_15 ) ( SURFACE-AT ?auto_12 ?auto_15 ) ( CLEAR ?auto_12 ) ( IS-CRATE ?auto_11 ) ( not ( = ?auto_11 ?auto_12 ) ) ( AVAILABLE ?auto_14 ) ( IN ?auto_11 ?auto_13 ) ( TRUCK-AT ?auto_13 ?auto_16 ) ( not ( = ?auto_16 ?auto_15 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_13 ?auto_16 ?auto_15 )
      ( MAKE-ON ?auto_11 ?auto_12 )
      ( MAKE-ON-VERIFY ?auto_11 ?auto_12 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_17 - SURFACE
      ?auto_18 - SURFACE
    )
    :vars
    (
      ?auto_21 - HOIST
      ?auto_20 - PLACE
      ?auto_19 - TRUCK
      ?auto_22 - PLACE
      ?auto_23 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_21 ?auto_20 ) ( SURFACE-AT ?auto_18 ?auto_20 ) ( CLEAR ?auto_18 ) ( IS-CRATE ?auto_17 ) ( not ( = ?auto_17 ?auto_18 ) ) ( AVAILABLE ?auto_21 ) ( TRUCK-AT ?auto_19 ?auto_22 ) ( not ( = ?auto_22 ?auto_20 ) ) ( HOIST-AT ?auto_23 ?auto_22 ) ( LIFTING ?auto_23 ?auto_17 ) ( not ( = ?auto_21 ?auto_23 ) ) )
    :subtasks
    ( ( !LOAD ?auto_23 ?auto_17 ?auto_19 ?auto_22 )
      ( MAKE-ON ?auto_17 ?auto_18 )
      ( MAKE-ON-VERIFY ?auto_17 ?auto_18 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_24 - SURFACE
      ?auto_25 - SURFACE
    )
    :vars
    (
      ?auto_28 - HOIST
      ?auto_26 - PLACE
      ?auto_27 - TRUCK
      ?auto_29 - PLACE
      ?auto_30 - HOIST
      ?auto_31 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28 ?auto_26 ) ( SURFACE-AT ?auto_25 ?auto_26 ) ( CLEAR ?auto_25 ) ( IS-CRATE ?auto_24 ) ( not ( = ?auto_24 ?auto_25 ) ) ( AVAILABLE ?auto_28 ) ( TRUCK-AT ?auto_27 ?auto_29 ) ( not ( = ?auto_29 ?auto_26 ) ) ( HOIST-AT ?auto_30 ?auto_29 ) ( not ( = ?auto_28 ?auto_30 ) ) ( AVAILABLE ?auto_30 ) ( SURFACE-AT ?auto_24 ?auto_29 ) ( ON ?auto_24 ?auto_31 ) ( CLEAR ?auto_24 ) ( not ( = ?auto_24 ?auto_31 ) ) ( not ( = ?auto_25 ?auto_31 ) ) )
    :subtasks
    ( ( !LIFT ?auto_30 ?auto_24 ?auto_31 ?auto_29 )
      ( MAKE-ON ?auto_24 ?auto_25 )
      ( MAKE-ON-VERIFY ?auto_24 ?auto_25 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_32 - SURFACE
      ?auto_33 - SURFACE
    )
    :vars
    (
      ?auto_35 - HOIST
      ?auto_38 - PLACE
      ?auto_36 - PLACE
      ?auto_39 - HOIST
      ?auto_34 - SURFACE
      ?auto_37 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_35 ?auto_38 ) ( SURFACE-AT ?auto_33 ?auto_38 ) ( CLEAR ?auto_33 ) ( IS-CRATE ?auto_32 ) ( not ( = ?auto_32 ?auto_33 ) ) ( AVAILABLE ?auto_35 ) ( not ( = ?auto_36 ?auto_38 ) ) ( HOIST-AT ?auto_39 ?auto_36 ) ( not ( = ?auto_35 ?auto_39 ) ) ( AVAILABLE ?auto_39 ) ( SURFACE-AT ?auto_32 ?auto_36 ) ( ON ?auto_32 ?auto_34 ) ( CLEAR ?auto_32 ) ( not ( = ?auto_32 ?auto_34 ) ) ( not ( = ?auto_33 ?auto_34 ) ) ( TRUCK-AT ?auto_37 ?auto_38 ) )
    :subtasks
    ( ( !DRIVE ?auto_37 ?auto_38 ?auto_36 )
      ( MAKE-ON ?auto_32 ?auto_33 )
      ( MAKE-ON-VERIFY ?auto_32 ?auto_33 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_80 - SURFACE
      ?auto_81 - SURFACE
    )
    :vars
    (
      ?auto_83 - HOIST
      ?auto_85 - PLACE
      ?auto_86 - PLACE
      ?auto_87 - HOIST
      ?auto_84 - SURFACE
      ?auto_82 - TRUCK
      ?auto_88 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_83 ?auto_85 ) ( IS-CRATE ?auto_80 ) ( not ( = ?auto_80 ?auto_81 ) ) ( not ( = ?auto_86 ?auto_85 ) ) ( HOIST-AT ?auto_87 ?auto_86 ) ( not ( = ?auto_83 ?auto_87 ) ) ( AVAILABLE ?auto_87 ) ( SURFACE-AT ?auto_80 ?auto_86 ) ( ON ?auto_80 ?auto_84 ) ( CLEAR ?auto_80 ) ( not ( = ?auto_80 ?auto_84 ) ) ( not ( = ?auto_81 ?auto_84 ) ) ( TRUCK-AT ?auto_82 ?auto_85 ) ( SURFACE-AT ?auto_88 ?auto_85 ) ( CLEAR ?auto_88 ) ( LIFTING ?auto_83 ?auto_81 ) ( IS-CRATE ?auto_81 ) ( not ( = ?auto_80 ?auto_88 ) ) ( not ( = ?auto_81 ?auto_88 ) ) ( not ( = ?auto_84 ?auto_88 ) ) )
    :subtasks
    ( ( !DROP ?auto_83 ?auto_81 ?auto_88 ?auto_85 )
      ( MAKE-ON ?auto_80 ?auto_81 )
      ( MAKE-ON-VERIFY ?auto_80 ?auto_81 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_89 - SURFACE
      ?auto_90 - SURFACE
    )
    :vars
    (
      ?auto_97 - HOIST
      ?auto_91 - PLACE
      ?auto_93 - PLACE
      ?auto_95 - HOIST
      ?auto_92 - SURFACE
      ?auto_96 - TRUCK
      ?auto_94 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_97 ?auto_91 ) ( IS-CRATE ?auto_89 ) ( not ( = ?auto_89 ?auto_90 ) ) ( not ( = ?auto_93 ?auto_91 ) ) ( HOIST-AT ?auto_95 ?auto_93 ) ( not ( = ?auto_97 ?auto_95 ) ) ( AVAILABLE ?auto_95 ) ( SURFACE-AT ?auto_89 ?auto_93 ) ( ON ?auto_89 ?auto_92 ) ( CLEAR ?auto_89 ) ( not ( = ?auto_89 ?auto_92 ) ) ( not ( = ?auto_90 ?auto_92 ) ) ( TRUCK-AT ?auto_96 ?auto_91 ) ( SURFACE-AT ?auto_94 ?auto_91 ) ( CLEAR ?auto_94 ) ( IS-CRATE ?auto_90 ) ( not ( = ?auto_89 ?auto_94 ) ) ( not ( = ?auto_90 ?auto_94 ) ) ( not ( = ?auto_92 ?auto_94 ) ) ( AVAILABLE ?auto_97 ) ( IN ?auto_90 ?auto_96 ) )
    :subtasks
    ( ( !UNLOAD ?auto_97 ?auto_90 ?auto_96 ?auto_91 )
      ( MAKE-ON ?auto_89 ?auto_90 )
      ( MAKE-ON-VERIFY ?auto_89 ?auto_90 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_104 - SURFACE
      ?auto_105 - SURFACE
    )
    :vars
    (
      ?auto_108 - HOIST
      ?auto_111 - PLACE
      ?auto_110 - PLACE
      ?auto_106 - HOIST
      ?auto_107 - SURFACE
      ?auto_109 - TRUCK
      ?auto_112 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_108 ?auto_111 ) ( SURFACE-AT ?auto_105 ?auto_111 ) ( CLEAR ?auto_105 ) ( IS-CRATE ?auto_104 ) ( not ( = ?auto_104 ?auto_105 ) ) ( AVAILABLE ?auto_108 ) ( not ( = ?auto_110 ?auto_111 ) ) ( HOIST-AT ?auto_106 ?auto_110 ) ( not ( = ?auto_108 ?auto_106 ) ) ( AVAILABLE ?auto_106 ) ( SURFACE-AT ?auto_104 ?auto_110 ) ( ON ?auto_104 ?auto_107 ) ( CLEAR ?auto_104 ) ( not ( = ?auto_104 ?auto_107 ) ) ( not ( = ?auto_105 ?auto_107 ) ) ( TRUCK-AT ?auto_109 ?auto_112 ) ( not ( = ?auto_112 ?auto_111 ) ) ( not ( = ?auto_110 ?auto_112 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_109 ?auto_112 ?auto_111 )
      ( MAKE-ON ?auto_104 ?auto_105 )
      ( MAKE-ON-VERIFY ?auto_104 ?auto_105 ) )
  )

)

