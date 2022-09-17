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
      ?auto_222 - SURFACE
      ?auto_223 - SURFACE
    )
    :vars
    (
      ?auto_224 - HOIST
      ?auto_225 - PLACE
      ?auto_227 - PLACE
      ?auto_228 - HOIST
      ?auto_229 - SURFACE
      ?auto_226 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_224 ?auto_225 ) ( SURFACE-AT ?auto_223 ?auto_225 ) ( CLEAR ?auto_223 ) ( IS-CRATE ?auto_222 ) ( AVAILABLE ?auto_224 ) ( not ( = ?auto_227 ?auto_225 ) ) ( HOIST-AT ?auto_228 ?auto_227 ) ( AVAILABLE ?auto_228 ) ( SURFACE-AT ?auto_222 ?auto_227 ) ( ON ?auto_222 ?auto_229 ) ( CLEAR ?auto_222 ) ( TRUCK-AT ?auto_226 ?auto_225 ) ( not ( = ?auto_222 ?auto_223 ) ) ( not ( = ?auto_222 ?auto_229 ) ) ( not ( = ?auto_223 ?auto_229 ) ) ( not ( = ?auto_224 ?auto_228 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_226 ?auto_225 ?auto_227 )
      ( !LIFT ?auto_228 ?auto_222 ?auto_229 ?auto_227 )
      ( !LOAD ?auto_228 ?auto_222 ?auto_226 ?auto_227 )
      ( !DRIVE ?auto_226 ?auto_227 ?auto_225 )
      ( !UNLOAD ?auto_224 ?auto_222 ?auto_226 ?auto_225 )
      ( !DROP ?auto_224 ?auto_222 ?auto_223 ?auto_225 )
      ( MAKE-ON-VERIFY ?auto_222 ?auto_223 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_232 - SURFACE
      ?auto_233 - SURFACE
    )
    :vars
    (
      ?auto_234 - HOIST
      ?auto_235 - PLACE
      ?auto_237 - PLACE
      ?auto_238 - HOIST
      ?auto_239 - SURFACE
      ?auto_236 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_234 ?auto_235 ) ( SURFACE-AT ?auto_233 ?auto_235 ) ( CLEAR ?auto_233 ) ( IS-CRATE ?auto_232 ) ( AVAILABLE ?auto_234 ) ( not ( = ?auto_237 ?auto_235 ) ) ( HOIST-AT ?auto_238 ?auto_237 ) ( AVAILABLE ?auto_238 ) ( SURFACE-AT ?auto_232 ?auto_237 ) ( ON ?auto_232 ?auto_239 ) ( CLEAR ?auto_232 ) ( TRUCK-AT ?auto_236 ?auto_235 ) ( not ( = ?auto_232 ?auto_233 ) ) ( not ( = ?auto_232 ?auto_239 ) ) ( not ( = ?auto_233 ?auto_239 ) ) ( not ( = ?auto_234 ?auto_238 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_236 ?auto_235 ?auto_237 )
      ( !LIFT ?auto_238 ?auto_232 ?auto_239 ?auto_237 )
      ( !LOAD ?auto_238 ?auto_232 ?auto_236 ?auto_237 )
      ( !DRIVE ?auto_236 ?auto_237 ?auto_235 )
      ( !UNLOAD ?auto_234 ?auto_232 ?auto_236 ?auto_235 )
      ( !DROP ?auto_234 ?auto_232 ?auto_233 ?auto_235 )
      ( MAKE-ON-VERIFY ?auto_232 ?auto_233 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_242 - SURFACE
      ?auto_243 - SURFACE
    )
    :vars
    (
      ?auto_244 - HOIST
      ?auto_245 - PLACE
      ?auto_247 - PLACE
      ?auto_248 - HOIST
      ?auto_249 - SURFACE
      ?auto_246 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_244 ?auto_245 ) ( SURFACE-AT ?auto_243 ?auto_245 ) ( CLEAR ?auto_243 ) ( IS-CRATE ?auto_242 ) ( AVAILABLE ?auto_244 ) ( not ( = ?auto_247 ?auto_245 ) ) ( HOIST-AT ?auto_248 ?auto_247 ) ( AVAILABLE ?auto_248 ) ( SURFACE-AT ?auto_242 ?auto_247 ) ( ON ?auto_242 ?auto_249 ) ( CLEAR ?auto_242 ) ( TRUCK-AT ?auto_246 ?auto_245 ) ( not ( = ?auto_242 ?auto_243 ) ) ( not ( = ?auto_242 ?auto_249 ) ) ( not ( = ?auto_243 ?auto_249 ) ) ( not ( = ?auto_244 ?auto_248 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_246 ?auto_245 ?auto_247 )
      ( !LIFT ?auto_248 ?auto_242 ?auto_249 ?auto_247 )
      ( !LOAD ?auto_248 ?auto_242 ?auto_246 ?auto_247 )
      ( !DRIVE ?auto_246 ?auto_247 ?auto_245 )
      ( !UNLOAD ?auto_244 ?auto_242 ?auto_246 ?auto_245 )
      ( !DROP ?auto_244 ?auto_242 ?auto_243 ?auto_245 )
      ( MAKE-ON-VERIFY ?auto_242 ?auto_243 ) )
  )

)

