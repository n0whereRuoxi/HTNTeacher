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
      ?auto_140 - SURFACE
      ?auto_141 - SURFACE
    )
    :vars
    (
      ?auto_142 - HOIST
      ?auto_143 - PLACE
      ?auto_145 - PLACE
      ?auto_146 - HOIST
      ?auto_147 - SURFACE
      ?auto_144 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_142 ?auto_143 ) ( SURFACE-AT ?auto_140 ?auto_143 ) ( CLEAR ?auto_140 ) ( IS-CRATE ?auto_141 ) ( AVAILABLE ?auto_142 ) ( not ( = ?auto_145 ?auto_143 ) ) ( HOIST-AT ?auto_146 ?auto_145 ) ( AVAILABLE ?auto_146 ) ( SURFACE-AT ?auto_141 ?auto_145 ) ( ON ?auto_141 ?auto_147 ) ( CLEAR ?auto_141 ) ( TRUCK-AT ?auto_144 ?auto_143 ) ( not ( = ?auto_140 ?auto_141 ) ) ( not ( = ?auto_140 ?auto_147 ) ) ( not ( = ?auto_141 ?auto_147 ) ) ( not ( = ?auto_142 ?auto_146 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_144 ?auto_143 ?auto_145 )
      ( !LIFT ?auto_146 ?auto_141 ?auto_147 ?auto_145 )
      ( !LOAD ?auto_146 ?auto_141 ?auto_144 ?auto_145 )
      ( !DRIVE ?auto_144 ?auto_145 ?auto_143 )
      ( !UNLOAD ?auto_142 ?auto_141 ?auto_144 ?auto_143 )
      ( !DROP ?auto_142 ?auto_141 ?auto_140 ?auto_143 )
      ( MAKE-1CRATE-VERIFY ?auto_140 ?auto_141 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_161 - SURFACE
      ?auto_162 - SURFACE
      ?auto_163 - SURFACE
    )
    :vars
    (
      ?auto_164 - HOIST
      ?auto_168 - PLACE
      ?auto_167 - PLACE
      ?auto_166 - HOIST
      ?auto_169 - SURFACE
      ?auto_170 - SURFACE
      ?auto_165 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_164 ?auto_168 ) ( IS-CRATE ?auto_163 ) ( not ( = ?auto_167 ?auto_168 ) ) ( HOIST-AT ?auto_166 ?auto_167 ) ( SURFACE-AT ?auto_163 ?auto_167 ) ( ON ?auto_163 ?auto_169 ) ( CLEAR ?auto_163 ) ( not ( = ?auto_162 ?auto_163 ) ) ( not ( = ?auto_162 ?auto_169 ) ) ( not ( = ?auto_163 ?auto_169 ) ) ( not ( = ?auto_164 ?auto_166 ) ) ( SURFACE-AT ?auto_161 ?auto_168 ) ( CLEAR ?auto_161 ) ( IS-CRATE ?auto_162 ) ( AVAILABLE ?auto_164 ) ( AVAILABLE ?auto_166 ) ( SURFACE-AT ?auto_162 ?auto_167 ) ( ON ?auto_162 ?auto_170 ) ( CLEAR ?auto_162 ) ( TRUCK-AT ?auto_165 ?auto_168 ) ( not ( = ?auto_161 ?auto_162 ) ) ( not ( = ?auto_161 ?auto_170 ) ) ( not ( = ?auto_162 ?auto_170 ) ) ( not ( = ?auto_161 ?auto_163 ) ) ( not ( = ?auto_161 ?auto_169 ) ) ( not ( = ?auto_163 ?auto_170 ) ) ( not ( = ?auto_169 ?auto_170 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_161 ?auto_162 )
      ( MAKE-1CRATE ?auto_162 ?auto_163 )
      ( MAKE-2CRATE-VERIFY ?auto_161 ?auto_162 ?auto_163 ) )
  )

)

