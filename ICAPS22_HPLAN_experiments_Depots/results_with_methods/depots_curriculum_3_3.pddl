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
      ?auto_192 - SURFACE
      ?auto_193 - SURFACE
    )
    :vars
    (
      ?auto_194 - HOIST
      ?auto_195 - PLACE
      ?auto_197 - PLACE
      ?auto_198 - HOIST
      ?auto_199 - SURFACE
      ?auto_196 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_194 ?auto_195 ) ( SURFACE-AT ?auto_193 ?auto_195 ) ( CLEAR ?auto_193 ) ( IS-CRATE ?auto_192 ) ( AVAILABLE ?auto_194 ) ( not ( = ?auto_197 ?auto_195 ) ) ( HOIST-AT ?auto_198 ?auto_197 ) ( AVAILABLE ?auto_198 ) ( SURFACE-AT ?auto_192 ?auto_197 ) ( ON ?auto_192 ?auto_199 ) ( CLEAR ?auto_192 ) ( TRUCK-AT ?auto_196 ?auto_195 ) ( not ( = ?auto_192 ?auto_193 ) ) ( not ( = ?auto_192 ?auto_199 ) ) ( not ( = ?auto_193 ?auto_199 ) ) ( not ( = ?auto_194 ?auto_198 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_196 ?auto_195 ?auto_197 )
      ( !LIFT ?auto_198 ?auto_192 ?auto_199 ?auto_197 )
      ( !LOAD ?auto_198 ?auto_192 ?auto_196 ?auto_197 )
      ( !DRIVE ?auto_196 ?auto_197 ?auto_195 )
      ( !UNLOAD ?auto_194 ?auto_192 ?auto_196 ?auto_195 )
      ( !DROP ?auto_194 ?auto_192 ?auto_193 ?auto_195 )
      ( MAKE-ON-VERIFY ?auto_192 ?auto_193 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_202 - SURFACE
      ?auto_203 - SURFACE
    )
    :vars
    (
      ?auto_204 - HOIST
      ?auto_205 - PLACE
      ?auto_207 - PLACE
      ?auto_208 - HOIST
      ?auto_209 - SURFACE
      ?auto_206 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_204 ?auto_205 ) ( SURFACE-AT ?auto_203 ?auto_205 ) ( CLEAR ?auto_203 ) ( IS-CRATE ?auto_202 ) ( AVAILABLE ?auto_204 ) ( not ( = ?auto_207 ?auto_205 ) ) ( HOIST-AT ?auto_208 ?auto_207 ) ( AVAILABLE ?auto_208 ) ( SURFACE-AT ?auto_202 ?auto_207 ) ( ON ?auto_202 ?auto_209 ) ( CLEAR ?auto_202 ) ( TRUCK-AT ?auto_206 ?auto_205 ) ( not ( = ?auto_202 ?auto_203 ) ) ( not ( = ?auto_202 ?auto_209 ) ) ( not ( = ?auto_203 ?auto_209 ) ) ( not ( = ?auto_204 ?auto_208 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_206 ?auto_205 ?auto_207 )
      ( !LIFT ?auto_208 ?auto_202 ?auto_209 ?auto_207 )
      ( !LOAD ?auto_208 ?auto_202 ?auto_206 ?auto_207 )
      ( !DRIVE ?auto_206 ?auto_207 ?auto_205 )
      ( !UNLOAD ?auto_204 ?auto_202 ?auto_206 ?auto_205 )
      ( !DROP ?auto_204 ?auto_202 ?auto_203 ?auto_205 )
      ( MAKE-ON-VERIFY ?auto_202 ?auto_203 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_212 - SURFACE
      ?auto_213 - SURFACE
    )
    :vars
    (
      ?auto_214 - HOIST
      ?auto_215 - PLACE
      ?auto_217 - PLACE
      ?auto_218 - HOIST
      ?auto_219 - SURFACE
      ?auto_216 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_214 ?auto_215 ) ( SURFACE-AT ?auto_213 ?auto_215 ) ( CLEAR ?auto_213 ) ( IS-CRATE ?auto_212 ) ( AVAILABLE ?auto_214 ) ( not ( = ?auto_217 ?auto_215 ) ) ( HOIST-AT ?auto_218 ?auto_217 ) ( AVAILABLE ?auto_218 ) ( SURFACE-AT ?auto_212 ?auto_217 ) ( ON ?auto_212 ?auto_219 ) ( CLEAR ?auto_212 ) ( TRUCK-AT ?auto_216 ?auto_215 ) ( not ( = ?auto_212 ?auto_213 ) ) ( not ( = ?auto_212 ?auto_219 ) ) ( not ( = ?auto_213 ?auto_219 ) ) ( not ( = ?auto_214 ?auto_218 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_216 ?auto_215 ?auto_217 )
      ( !LIFT ?auto_218 ?auto_212 ?auto_219 ?auto_217 )
      ( !LOAD ?auto_218 ?auto_212 ?auto_216 ?auto_217 )
      ( !DRIVE ?auto_216 ?auto_217 ?auto_215 )
      ( !UNLOAD ?auto_214 ?auto_212 ?auto_216 ?auto_215 )
      ( !DROP ?auto_214 ?auto_212 ?auto_213 ?auto_215 )
      ( MAKE-ON-VERIFY ?auto_212 ?auto_213 ) )
  )

)

