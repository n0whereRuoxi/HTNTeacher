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
      ?auto_62 - SURFACE
      ?auto_63 - SURFACE
    )
    :vars
    (
      ?auto_64 - HOIST
      ?auto_65 - PLACE
      ?auto_67 - PLACE
      ?auto_68 - HOIST
      ?auto_69 - SURFACE
      ?auto_66 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_64 ?auto_65 ) ( SURFACE-AT ?auto_63 ?auto_65 ) ( CLEAR ?auto_63 ) ( IS-CRATE ?auto_62 ) ( AVAILABLE ?auto_64 ) ( not ( = ?auto_67 ?auto_65 ) ) ( HOIST-AT ?auto_68 ?auto_67 ) ( AVAILABLE ?auto_68 ) ( SURFACE-AT ?auto_62 ?auto_67 ) ( ON ?auto_62 ?auto_69 ) ( CLEAR ?auto_62 ) ( TRUCK-AT ?auto_66 ?auto_65 ) ( not ( = ?auto_62 ?auto_63 ) ) ( not ( = ?auto_62 ?auto_69 ) ) ( not ( = ?auto_63 ?auto_69 ) ) ( not ( = ?auto_64 ?auto_68 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_66 ?auto_65 ?auto_67 )
      ( !LIFT ?auto_68 ?auto_62 ?auto_69 ?auto_67 )
      ( !LOAD ?auto_68 ?auto_62 ?auto_66 ?auto_67 )
      ( !DRIVE ?auto_66 ?auto_67 ?auto_65 )
      ( !UNLOAD ?auto_64 ?auto_62 ?auto_66 ?auto_65 )
      ( !DROP ?auto_64 ?auto_62 ?auto_63 ?auto_65 )
      ( MAKE-ON-VERIFY ?auto_62 ?auto_63 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_72 - SURFACE
      ?auto_73 - SURFACE
    )
    :vars
    (
      ?auto_74 - HOIST
      ?auto_75 - PLACE
      ?auto_77 - PLACE
      ?auto_78 - HOIST
      ?auto_79 - SURFACE
      ?auto_76 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_74 ?auto_75 ) ( SURFACE-AT ?auto_73 ?auto_75 ) ( CLEAR ?auto_73 ) ( IS-CRATE ?auto_72 ) ( AVAILABLE ?auto_74 ) ( not ( = ?auto_77 ?auto_75 ) ) ( HOIST-AT ?auto_78 ?auto_77 ) ( AVAILABLE ?auto_78 ) ( SURFACE-AT ?auto_72 ?auto_77 ) ( ON ?auto_72 ?auto_79 ) ( CLEAR ?auto_72 ) ( TRUCK-AT ?auto_76 ?auto_75 ) ( not ( = ?auto_72 ?auto_73 ) ) ( not ( = ?auto_72 ?auto_79 ) ) ( not ( = ?auto_73 ?auto_79 ) ) ( not ( = ?auto_74 ?auto_78 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_76 ?auto_75 ?auto_77 )
      ( !LIFT ?auto_78 ?auto_72 ?auto_79 ?auto_77 )
      ( !LOAD ?auto_78 ?auto_72 ?auto_76 ?auto_77 )
      ( !DRIVE ?auto_76 ?auto_77 ?auto_75 )
      ( !UNLOAD ?auto_74 ?auto_72 ?auto_76 ?auto_75 )
      ( !DROP ?auto_74 ?auto_72 ?auto_73 ?auto_75 )
      ( MAKE-ON-VERIFY ?auto_72 ?auto_73 ) )
  )

)

