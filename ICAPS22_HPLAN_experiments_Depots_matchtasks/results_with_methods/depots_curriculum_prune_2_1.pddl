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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_37 - SURFACE
      ?auto_38 - SURFACE
    )
    :vars
    (
      ?auto_39 - HOIST
      ?auto_40 - PLACE
      ?auto_42 - PLACE
      ?auto_43 - HOIST
      ?auto_44 - SURFACE
      ?auto_41 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_39 ?auto_40 ) ( SURFACE-AT ?auto_37 ?auto_40 ) ( CLEAR ?auto_37 ) ( IS-CRATE ?auto_38 ) ( AVAILABLE ?auto_39 ) ( not ( = ?auto_42 ?auto_40 ) ) ( HOIST-AT ?auto_43 ?auto_42 ) ( AVAILABLE ?auto_43 ) ( SURFACE-AT ?auto_38 ?auto_42 ) ( ON ?auto_38 ?auto_44 ) ( CLEAR ?auto_38 ) ( TRUCK-AT ?auto_41 ?auto_40 ) ( not ( = ?auto_37 ?auto_38 ) ) ( not ( = ?auto_37 ?auto_44 ) ) ( not ( = ?auto_38 ?auto_44 ) ) ( not ( = ?auto_39 ?auto_43 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_41 ?auto_40 ?auto_42 )
      ( !LIFT ?auto_43 ?auto_38 ?auto_44 ?auto_42 )
      ( !LOAD ?auto_43 ?auto_38 ?auto_41 ?auto_42 )
      ( !DRIVE ?auto_41 ?auto_42 ?auto_40 )
      ( !UNLOAD ?auto_39 ?auto_38 ?auto_41 ?auto_40 )
      ( !DROP ?auto_39 ?auto_38 ?auto_37 ?auto_40 )
      ( MAKE-1CRATE-VERIFY ?auto_37 ?auto_38 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_58 - SURFACE
      ?auto_59 - SURFACE
      ?auto_60 - SURFACE
    )
    :vars
    (
      ?auto_61 - HOIST
      ?auto_65 - PLACE
      ?auto_64 - PLACE
      ?auto_66 - HOIST
      ?auto_63 - SURFACE
      ?auto_67 - PLACE
      ?auto_69 - HOIST
      ?auto_68 - SURFACE
      ?auto_62 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_61 ?auto_65 ) ( IS-CRATE ?auto_60 ) ( not ( = ?auto_64 ?auto_65 ) ) ( HOIST-AT ?auto_66 ?auto_64 ) ( AVAILABLE ?auto_66 ) ( SURFACE-AT ?auto_60 ?auto_64 ) ( ON ?auto_60 ?auto_63 ) ( CLEAR ?auto_60 ) ( not ( = ?auto_59 ?auto_60 ) ) ( not ( = ?auto_59 ?auto_63 ) ) ( not ( = ?auto_60 ?auto_63 ) ) ( not ( = ?auto_61 ?auto_66 ) ) ( SURFACE-AT ?auto_58 ?auto_65 ) ( CLEAR ?auto_58 ) ( IS-CRATE ?auto_59 ) ( AVAILABLE ?auto_61 ) ( not ( = ?auto_67 ?auto_65 ) ) ( HOIST-AT ?auto_69 ?auto_67 ) ( AVAILABLE ?auto_69 ) ( SURFACE-AT ?auto_59 ?auto_67 ) ( ON ?auto_59 ?auto_68 ) ( CLEAR ?auto_59 ) ( TRUCK-AT ?auto_62 ?auto_65 ) ( not ( = ?auto_58 ?auto_59 ) ) ( not ( = ?auto_58 ?auto_68 ) ) ( not ( = ?auto_59 ?auto_68 ) ) ( not ( = ?auto_61 ?auto_69 ) ) ( not ( = ?auto_58 ?auto_60 ) ) ( not ( = ?auto_58 ?auto_63 ) ) ( not ( = ?auto_60 ?auto_68 ) ) ( not ( = ?auto_64 ?auto_67 ) ) ( not ( = ?auto_66 ?auto_69 ) ) ( not ( = ?auto_63 ?auto_68 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_58 ?auto_59 )
      ( MAKE-1CRATE ?auto_59 ?auto_60 )
      ( MAKE-2CRATE-VERIFY ?auto_58 ?auto_59 ?auto_60 ) )
  )

)

