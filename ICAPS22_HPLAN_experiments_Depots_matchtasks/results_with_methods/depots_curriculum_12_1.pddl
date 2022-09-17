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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11232 - SURFACE
      ?auto_11233 - SURFACE
    )
    :vars
    (
      ?auto_11234 - HOIST
      ?auto_11235 - PLACE
      ?auto_11237 - PLACE
      ?auto_11238 - HOIST
      ?auto_11239 - SURFACE
      ?auto_11236 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11234 ?auto_11235 ) ( SURFACE-AT ?auto_11232 ?auto_11235 ) ( CLEAR ?auto_11232 ) ( IS-CRATE ?auto_11233 ) ( AVAILABLE ?auto_11234 ) ( not ( = ?auto_11237 ?auto_11235 ) ) ( HOIST-AT ?auto_11238 ?auto_11237 ) ( AVAILABLE ?auto_11238 ) ( SURFACE-AT ?auto_11233 ?auto_11237 ) ( ON ?auto_11233 ?auto_11239 ) ( CLEAR ?auto_11233 ) ( TRUCK-AT ?auto_11236 ?auto_11235 ) ( not ( = ?auto_11232 ?auto_11233 ) ) ( not ( = ?auto_11232 ?auto_11239 ) ) ( not ( = ?auto_11233 ?auto_11239 ) ) ( not ( = ?auto_11234 ?auto_11238 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_11236 ?auto_11235 ?auto_11237 )
      ( !LIFT ?auto_11238 ?auto_11233 ?auto_11239 ?auto_11237 )
      ( !LOAD ?auto_11238 ?auto_11233 ?auto_11236 ?auto_11237 )
      ( !DRIVE ?auto_11236 ?auto_11237 ?auto_11235 )
      ( !UNLOAD ?auto_11234 ?auto_11233 ?auto_11236 ?auto_11235 )
      ( !DROP ?auto_11234 ?auto_11233 ?auto_11232 ?auto_11235 )
      ( MAKE-1CRATE-VERIFY ?auto_11232 ?auto_11233 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11242 - SURFACE
      ?auto_11243 - SURFACE
    )
    :vars
    (
      ?auto_11244 - HOIST
      ?auto_11245 - PLACE
      ?auto_11247 - PLACE
      ?auto_11248 - HOIST
      ?auto_11249 - SURFACE
      ?auto_11246 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11244 ?auto_11245 ) ( SURFACE-AT ?auto_11242 ?auto_11245 ) ( CLEAR ?auto_11242 ) ( IS-CRATE ?auto_11243 ) ( AVAILABLE ?auto_11244 ) ( not ( = ?auto_11247 ?auto_11245 ) ) ( HOIST-AT ?auto_11248 ?auto_11247 ) ( AVAILABLE ?auto_11248 ) ( SURFACE-AT ?auto_11243 ?auto_11247 ) ( ON ?auto_11243 ?auto_11249 ) ( CLEAR ?auto_11243 ) ( TRUCK-AT ?auto_11246 ?auto_11245 ) ( not ( = ?auto_11242 ?auto_11243 ) ) ( not ( = ?auto_11242 ?auto_11249 ) ) ( not ( = ?auto_11243 ?auto_11249 ) ) ( not ( = ?auto_11244 ?auto_11248 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_11246 ?auto_11245 ?auto_11247 )
      ( !LIFT ?auto_11248 ?auto_11243 ?auto_11249 ?auto_11247 )
      ( !LOAD ?auto_11248 ?auto_11243 ?auto_11246 ?auto_11247 )
      ( !DRIVE ?auto_11246 ?auto_11247 ?auto_11245 )
      ( !UNLOAD ?auto_11244 ?auto_11243 ?auto_11246 ?auto_11245 )
      ( !DROP ?auto_11244 ?auto_11243 ?auto_11242 ?auto_11245 )
      ( MAKE-1CRATE-VERIFY ?auto_11242 ?auto_11243 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_11253 - SURFACE
      ?auto_11254 - SURFACE
      ?auto_11255 - SURFACE
    )
    :vars
    (
      ?auto_11258 - HOIST
      ?auto_11261 - PLACE
      ?auto_11260 - PLACE
      ?auto_11259 - HOIST
      ?auto_11257 - SURFACE
      ?auto_11262 - PLACE
      ?auto_11264 - HOIST
      ?auto_11263 - SURFACE
      ?auto_11256 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11258 ?auto_11261 ) ( IS-CRATE ?auto_11255 ) ( not ( = ?auto_11260 ?auto_11261 ) ) ( HOIST-AT ?auto_11259 ?auto_11260 ) ( AVAILABLE ?auto_11259 ) ( SURFACE-AT ?auto_11255 ?auto_11260 ) ( ON ?auto_11255 ?auto_11257 ) ( CLEAR ?auto_11255 ) ( not ( = ?auto_11254 ?auto_11255 ) ) ( not ( = ?auto_11254 ?auto_11257 ) ) ( not ( = ?auto_11255 ?auto_11257 ) ) ( not ( = ?auto_11258 ?auto_11259 ) ) ( SURFACE-AT ?auto_11253 ?auto_11261 ) ( CLEAR ?auto_11253 ) ( IS-CRATE ?auto_11254 ) ( AVAILABLE ?auto_11258 ) ( not ( = ?auto_11262 ?auto_11261 ) ) ( HOIST-AT ?auto_11264 ?auto_11262 ) ( AVAILABLE ?auto_11264 ) ( SURFACE-AT ?auto_11254 ?auto_11262 ) ( ON ?auto_11254 ?auto_11263 ) ( CLEAR ?auto_11254 ) ( TRUCK-AT ?auto_11256 ?auto_11261 ) ( not ( = ?auto_11253 ?auto_11254 ) ) ( not ( = ?auto_11253 ?auto_11263 ) ) ( not ( = ?auto_11254 ?auto_11263 ) ) ( not ( = ?auto_11258 ?auto_11264 ) ) ( not ( = ?auto_11253 ?auto_11255 ) ) ( not ( = ?auto_11253 ?auto_11257 ) ) ( not ( = ?auto_11255 ?auto_11263 ) ) ( not ( = ?auto_11260 ?auto_11262 ) ) ( not ( = ?auto_11259 ?auto_11264 ) ) ( not ( = ?auto_11257 ?auto_11263 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_11253 ?auto_11254 )
      ( MAKE-1CRATE ?auto_11254 ?auto_11255 )
      ( MAKE-2CRATE-VERIFY ?auto_11253 ?auto_11254 ?auto_11255 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11267 - SURFACE
      ?auto_11268 - SURFACE
    )
    :vars
    (
      ?auto_11269 - HOIST
      ?auto_11270 - PLACE
      ?auto_11272 - PLACE
      ?auto_11273 - HOIST
      ?auto_11274 - SURFACE
      ?auto_11271 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11269 ?auto_11270 ) ( SURFACE-AT ?auto_11267 ?auto_11270 ) ( CLEAR ?auto_11267 ) ( IS-CRATE ?auto_11268 ) ( AVAILABLE ?auto_11269 ) ( not ( = ?auto_11272 ?auto_11270 ) ) ( HOIST-AT ?auto_11273 ?auto_11272 ) ( AVAILABLE ?auto_11273 ) ( SURFACE-AT ?auto_11268 ?auto_11272 ) ( ON ?auto_11268 ?auto_11274 ) ( CLEAR ?auto_11268 ) ( TRUCK-AT ?auto_11271 ?auto_11270 ) ( not ( = ?auto_11267 ?auto_11268 ) ) ( not ( = ?auto_11267 ?auto_11274 ) ) ( not ( = ?auto_11268 ?auto_11274 ) ) ( not ( = ?auto_11269 ?auto_11273 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_11271 ?auto_11270 ?auto_11272 )
      ( !LIFT ?auto_11273 ?auto_11268 ?auto_11274 ?auto_11272 )
      ( !LOAD ?auto_11273 ?auto_11268 ?auto_11271 ?auto_11272 )
      ( !DRIVE ?auto_11271 ?auto_11272 ?auto_11270 )
      ( !UNLOAD ?auto_11269 ?auto_11268 ?auto_11271 ?auto_11270 )
      ( !DROP ?auto_11269 ?auto_11268 ?auto_11267 ?auto_11270 )
      ( MAKE-1CRATE-VERIFY ?auto_11267 ?auto_11268 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_11279 - SURFACE
      ?auto_11280 - SURFACE
      ?auto_11281 - SURFACE
      ?auto_11282 - SURFACE
    )
    :vars
    (
      ?auto_11285 - HOIST
      ?auto_11288 - PLACE
      ?auto_11283 - PLACE
      ?auto_11287 - HOIST
      ?auto_11284 - SURFACE
      ?auto_11293 - PLACE
      ?auto_11289 - HOIST
      ?auto_11292 - SURFACE
      ?auto_11290 - PLACE
      ?auto_11291 - HOIST
      ?auto_11294 - SURFACE
      ?auto_11286 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11285 ?auto_11288 ) ( IS-CRATE ?auto_11282 ) ( not ( = ?auto_11283 ?auto_11288 ) ) ( HOIST-AT ?auto_11287 ?auto_11283 ) ( AVAILABLE ?auto_11287 ) ( SURFACE-AT ?auto_11282 ?auto_11283 ) ( ON ?auto_11282 ?auto_11284 ) ( CLEAR ?auto_11282 ) ( not ( = ?auto_11281 ?auto_11282 ) ) ( not ( = ?auto_11281 ?auto_11284 ) ) ( not ( = ?auto_11282 ?auto_11284 ) ) ( not ( = ?auto_11285 ?auto_11287 ) ) ( IS-CRATE ?auto_11281 ) ( not ( = ?auto_11293 ?auto_11288 ) ) ( HOIST-AT ?auto_11289 ?auto_11293 ) ( AVAILABLE ?auto_11289 ) ( SURFACE-AT ?auto_11281 ?auto_11293 ) ( ON ?auto_11281 ?auto_11292 ) ( CLEAR ?auto_11281 ) ( not ( = ?auto_11280 ?auto_11281 ) ) ( not ( = ?auto_11280 ?auto_11292 ) ) ( not ( = ?auto_11281 ?auto_11292 ) ) ( not ( = ?auto_11285 ?auto_11289 ) ) ( SURFACE-AT ?auto_11279 ?auto_11288 ) ( CLEAR ?auto_11279 ) ( IS-CRATE ?auto_11280 ) ( AVAILABLE ?auto_11285 ) ( not ( = ?auto_11290 ?auto_11288 ) ) ( HOIST-AT ?auto_11291 ?auto_11290 ) ( AVAILABLE ?auto_11291 ) ( SURFACE-AT ?auto_11280 ?auto_11290 ) ( ON ?auto_11280 ?auto_11294 ) ( CLEAR ?auto_11280 ) ( TRUCK-AT ?auto_11286 ?auto_11288 ) ( not ( = ?auto_11279 ?auto_11280 ) ) ( not ( = ?auto_11279 ?auto_11294 ) ) ( not ( = ?auto_11280 ?auto_11294 ) ) ( not ( = ?auto_11285 ?auto_11291 ) ) ( not ( = ?auto_11279 ?auto_11281 ) ) ( not ( = ?auto_11279 ?auto_11292 ) ) ( not ( = ?auto_11281 ?auto_11294 ) ) ( not ( = ?auto_11293 ?auto_11290 ) ) ( not ( = ?auto_11289 ?auto_11291 ) ) ( not ( = ?auto_11292 ?auto_11294 ) ) ( not ( = ?auto_11279 ?auto_11282 ) ) ( not ( = ?auto_11279 ?auto_11284 ) ) ( not ( = ?auto_11280 ?auto_11282 ) ) ( not ( = ?auto_11280 ?auto_11284 ) ) ( not ( = ?auto_11282 ?auto_11292 ) ) ( not ( = ?auto_11282 ?auto_11294 ) ) ( not ( = ?auto_11283 ?auto_11293 ) ) ( not ( = ?auto_11283 ?auto_11290 ) ) ( not ( = ?auto_11287 ?auto_11289 ) ) ( not ( = ?auto_11287 ?auto_11291 ) ) ( not ( = ?auto_11284 ?auto_11292 ) ) ( not ( = ?auto_11284 ?auto_11294 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_11279 ?auto_11280 ?auto_11281 )
      ( MAKE-1CRATE ?auto_11281 ?auto_11282 )
      ( MAKE-3CRATE-VERIFY ?auto_11279 ?auto_11280 ?auto_11281 ?auto_11282 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11297 - SURFACE
      ?auto_11298 - SURFACE
    )
    :vars
    (
      ?auto_11299 - HOIST
      ?auto_11300 - PLACE
      ?auto_11302 - PLACE
      ?auto_11303 - HOIST
      ?auto_11304 - SURFACE
      ?auto_11301 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11299 ?auto_11300 ) ( SURFACE-AT ?auto_11297 ?auto_11300 ) ( CLEAR ?auto_11297 ) ( IS-CRATE ?auto_11298 ) ( AVAILABLE ?auto_11299 ) ( not ( = ?auto_11302 ?auto_11300 ) ) ( HOIST-AT ?auto_11303 ?auto_11302 ) ( AVAILABLE ?auto_11303 ) ( SURFACE-AT ?auto_11298 ?auto_11302 ) ( ON ?auto_11298 ?auto_11304 ) ( CLEAR ?auto_11298 ) ( TRUCK-AT ?auto_11301 ?auto_11300 ) ( not ( = ?auto_11297 ?auto_11298 ) ) ( not ( = ?auto_11297 ?auto_11304 ) ) ( not ( = ?auto_11298 ?auto_11304 ) ) ( not ( = ?auto_11299 ?auto_11303 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_11301 ?auto_11300 ?auto_11302 )
      ( !LIFT ?auto_11303 ?auto_11298 ?auto_11304 ?auto_11302 )
      ( !LOAD ?auto_11303 ?auto_11298 ?auto_11301 ?auto_11302 )
      ( !DRIVE ?auto_11301 ?auto_11302 ?auto_11300 )
      ( !UNLOAD ?auto_11299 ?auto_11298 ?auto_11301 ?auto_11300 )
      ( !DROP ?auto_11299 ?auto_11298 ?auto_11297 ?auto_11300 )
      ( MAKE-1CRATE-VERIFY ?auto_11297 ?auto_11298 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_11310 - SURFACE
      ?auto_11311 - SURFACE
      ?auto_11312 - SURFACE
      ?auto_11313 - SURFACE
      ?auto_11314 - SURFACE
    )
    :vars
    (
      ?auto_11315 - HOIST
      ?auto_11319 - PLACE
      ?auto_11318 - PLACE
      ?auto_11316 - HOIST
      ?auto_11320 - SURFACE
      ?auto_11321 - PLACE
      ?auto_11322 - HOIST
      ?auto_11325 - SURFACE
      ?auto_11324 - PLACE
      ?auto_11329 - HOIST
      ?auto_11323 - SURFACE
      ?auto_11328 - PLACE
      ?auto_11326 - HOIST
      ?auto_11327 - SURFACE
      ?auto_11317 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11315 ?auto_11319 ) ( IS-CRATE ?auto_11314 ) ( not ( = ?auto_11318 ?auto_11319 ) ) ( HOIST-AT ?auto_11316 ?auto_11318 ) ( AVAILABLE ?auto_11316 ) ( SURFACE-AT ?auto_11314 ?auto_11318 ) ( ON ?auto_11314 ?auto_11320 ) ( CLEAR ?auto_11314 ) ( not ( = ?auto_11313 ?auto_11314 ) ) ( not ( = ?auto_11313 ?auto_11320 ) ) ( not ( = ?auto_11314 ?auto_11320 ) ) ( not ( = ?auto_11315 ?auto_11316 ) ) ( IS-CRATE ?auto_11313 ) ( not ( = ?auto_11321 ?auto_11319 ) ) ( HOIST-AT ?auto_11322 ?auto_11321 ) ( AVAILABLE ?auto_11322 ) ( SURFACE-AT ?auto_11313 ?auto_11321 ) ( ON ?auto_11313 ?auto_11325 ) ( CLEAR ?auto_11313 ) ( not ( = ?auto_11312 ?auto_11313 ) ) ( not ( = ?auto_11312 ?auto_11325 ) ) ( not ( = ?auto_11313 ?auto_11325 ) ) ( not ( = ?auto_11315 ?auto_11322 ) ) ( IS-CRATE ?auto_11312 ) ( not ( = ?auto_11324 ?auto_11319 ) ) ( HOIST-AT ?auto_11329 ?auto_11324 ) ( AVAILABLE ?auto_11329 ) ( SURFACE-AT ?auto_11312 ?auto_11324 ) ( ON ?auto_11312 ?auto_11323 ) ( CLEAR ?auto_11312 ) ( not ( = ?auto_11311 ?auto_11312 ) ) ( not ( = ?auto_11311 ?auto_11323 ) ) ( not ( = ?auto_11312 ?auto_11323 ) ) ( not ( = ?auto_11315 ?auto_11329 ) ) ( SURFACE-AT ?auto_11310 ?auto_11319 ) ( CLEAR ?auto_11310 ) ( IS-CRATE ?auto_11311 ) ( AVAILABLE ?auto_11315 ) ( not ( = ?auto_11328 ?auto_11319 ) ) ( HOIST-AT ?auto_11326 ?auto_11328 ) ( AVAILABLE ?auto_11326 ) ( SURFACE-AT ?auto_11311 ?auto_11328 ) ( ON ?auto_11311 ?auto_11327 ) ( CLEAR ?auto_11311 ) ( TRUCK-AT ?auto_11317 ?auto_11319 ) ( not ( = ?auto_11310 ?auto_11311 ) ) ( not ( = ?auto_11310 ?auto_11327 ) ) ( not ( = ?auto_11311 ?auto_11327 ) ) ( not ( = ?auto_11315 ?auto_11326 ) ) ( not ( = ?auto_11310 ?auto_11312 ) ) ( not ( = ?auto_11310 ?auto_11323 ) ) ( not ( = ?auto_11312 ?auto_11327 ) ) ( not ( = ?auto_11324 ?auto_11328 ) ) ( not ( = ?auto_11329 ?auto_11326 ) ) ( not ( = ?auto_11323 ?auto_11327 ) ) ( not ( = ?auto_11310 ?auto_11313 ) ) ( not ( = ?auto_11310 ?auto_11325 ) ) ( not ( = ?auto_11311 ?auto_11313 ) ) ( not ( = ?auto_11311 ?auto_11325 ) ) ( not ( = ?auto_11313 ?auto_11323 ) ) ( not ( = ?auto_11313 ?auto_11327 ) ) ( not ( = ?auto_11321 ?auto_11324 ) ) ( not ( = ?auto_11321 ?auto_11328 ) ) ( not ( = ?auto_11322 ?auto_11329 ) ) ( not ( = ?auto_11322 ?auto_11326 ) ) ( not ( = ?auto_11325 ?auto_11323 ) ) ( not ( = ?auto_11325 ?auto_11327 ) ) ( not ( = ?auto_11310 ?auto_11314 ) ) ( not ( = ?auto_11310 ?auto_11320 ) ) ( not ( = ?auto_11311 ?auto_11314 ) ) ( not ( = ?auto_11311 ?auto_11320 ) ) ( not ( = ?auto_11312 ?auto_11314 ) ) ( not ( = ?auto_11312 ?auto_11320 ) ) ( not ( = ?auto_11314 ?auto_11325 ) ) ( not ( = ?auto_11314 ?auto_11323 ) ) ( not ( = ?auto_11314 ?auto_11327 ) ) ( not ( = ?auto_11318 ?auto_11321 ) ) ( not ( = ?auto_11318 ?auto_11324 ) ) ( not ( = ?auto_11318 ?auto_11328 ) ) ( not ( = ?auto_11316 ?auto_11322 ) ) ( not ( = ?auto_11316 ?auto_11329 ) ) ( not ( = ?auto_11316 ?auto_11326 ) ) ( not ( = ?auto_11320 ?auto_11325 ) ) ( not ( = ?auto_11320 ?auto_11323 ) ) ( not ( = ?auto_11320 ?auto_11327 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_11310 ?auto_11311 ?auto_11312 ?auto_11313 )
      ( MAKE-1CRATE ?auto_11313 ?auto_11314 )
      ( MAKE-4CRATE-VERIFY ?auto_11310 ?auto_11311 ?auto_11312 ?auto_11313 ?auto_11314 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11332 - SURFACE
      ?auto_11333 - SURFACE
    )
    :vars
    (
      ?auto_11334 - HOIST
      ?auto_11335 - PLACE
      ?auto_11337 - PLACE
      ?auto_11338 - HOIST
      ?auto_11339 - SURFACE
      ?auto_11336 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11334 ?auto_11335 ) ( SURFACE-AT ?auto_11332 ?auto_11335 ) ( CLEAR ?auto_11332 ) ( IS-CRATE ?auto_11333 ) ( AVAILABLE ?auto_11334 ) ( not ( = ?auto_11337 ?auto_11335 ) ) ( HOIST-AT ?auto_11338 ?auto_11337 ) ( AVAILABLE ?auto_11338 ) ( SURFACE-AT ?auto_11333 ?auto_11337 ) ( ON ?auto_11333 ?auto_11339 ) ( CLEAR ?auto_11333 ) ( TRUCK-AT ?auto_11336 ?auto_11335 ) ( not ( = ?auto_11332 ?auto_11333 ) ) ( not ( = ?auto_11332 ?auto_11339 ) ) ( not ( = ?auto_11333 ?auto_11339 ) ) ( not ( = ?auto_11334 ?auto_11338 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_11336 ?auto_11335 ?auto_11337 )
      ( !LIFT ?auto_11338 ?auto_11333 ?auto_11339 ?auto_11337 )
      ( !LOAD ?auto_11338 ?auto_11333 ?auto_11336 ?auto_11337 )
      ( !DRIVE ?auto_11336 ?auto_11337 ?auto_11335 )
      ( !UNLOAD ?auto_11334 ?auto_11333 ?auto_11336 ?auto_11335 )
      ( !DROP ?auto_11334 ?auto_11333 ?auto_11332 ?auto_11335 )
      ( MAKE-1CRATE-VERIFY ?auto_11332 ?auto_11333 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_11346 - SURFACE
      ?auto_11347 - SURFACE
      ?auto_11348 - SURFACE
      ?auto_11349 - SURFACE
      ?auto_11350 - SURFACE
      ?auto_11351 - SURFACE
    )
    :vars
    (
      ?auto_11353 - HOIST
      ?auto_11357 - PLACE
      ?auto_11352 - PLACE
      ?auto_11355 - HOIST
      ?auto_11356 - SURFACE
      ?auto_11360 - PLACE
      ?auto_11359 - HOIST
      ?auto_11369 - SURFACE
      ?auto_11366 - PLACE
      ?auto_11367 - HOIST
      ?auto_11361 - SURFACE
      ?auto_11362 - PLACE
      ?auto_11358 - HOIST
      ?auto_11365 - SURFACE
      ?auto_11363 - PLACE
      ?auto_11368 - HOIST
      ?auto_11364 - SURFACE
      ?auto_11354 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11353 ?auto_11357 ) ( IS-CRATE ?auto_11351 ) ( not ( = ?auto_11352 ?auto_11357 ) ) ( HOIST-AT ?auto_11355 ?auto_11352 ) ( AVAILABLE ?auto_11355 ) ( SURFACE-AT ?auto_11351 ?auto_11352 ) ( ON ?auto_11351 ?auto_11356 ) ( CLEAR ?auto_11351 ) ( not ( = ?auto_11350 ?auto_11351 ) ) ( not ( = ?auto_11350 ?auto_11356 ) ) ( not ( = ?auto_11351 ?auto_11356 ) ) ( not ( = ?auto_11353 ?auto_11355 ) ) ( IS-CRATE ?auto_11350 ) ( not ( = ?auto_11360 ?auto_11357 ) ) ( HOIST-AT ?auto_11359 ?auto_11360 ) ( AVAILABLE ?auto_11359 ) ( SURFACE-AT ?auto_11350 ?auto_11360 ) ( ON ?auto_11350 ?auto_11369 ) ( CLEAR ?auto_11350 ) ( not ( = ?auto_11349 ?auto_11350 ) ) ( not ( = ?auto_11349 ?auto_11369 ) ) ( not ( = ?auto_11350 ?auto_11369 ) ) ( not ( = ?auto_11353 ?auto_11359 ) ) ( IS-CRATE ?auto_11349 ) ( not ( = ?auto_11366 ?auto_11357 ) ) ( HOIST-AT ?auto_11367 ?auto_11366 ) ( AVAILABLE ?auto_11367 ) ( SURFACE-AT ?auto_11349 ?auto_11366 ) ( ON ?auto_11349 ?auto_11361 ) ( CLEAR ?auto_11349 ) ( not ( = ?auto_11348 ?auto_11349 ) ) ( not ( = ?auto_11348 ?auto_11361 ) ) ( not ( = ?auto_11349 ?auto_11361 ) ) ( not ( = ?auto_11353 ?auto_11367 ) ) ( IS-CRATE ?auto_11348 ) ( not ( = ?auto_11362 ?auto_11357 ) ) ( HOIST-AT ?auto_11358 ?auto_11362 ) ( AVAILABLE ?auto_11358 ) ( SURFACE-AT ?auto_11348 ?auto_11362 ) ( ON ?auto_11348 ?auto_11365 ) ( CLEAR ?auto_11348 ) ( not ( = ?auto_11347 ?auto_11348 ) ) ( not ( = ?auto_11347 ?auto_11365 ) ) ( not ( = ?auto_11348 ?auto_11365 ) ) ( not ( = ?auto_11353 ?auto_11358 ) ) ( SURFACE-AT ?auto_11346 ?auto_11357 ) ( CLEAR ?auto_11346 ) ( IS-CRATE ?auto_11347 ) ( AVAILABLE ?auto_11353 ) ( not ( = ?auto_11363 ?auto_11357 ) ) ( HOIST-AT ?auto_11368 ?auto_11363 ) ( AVAILABLE ?auto_11368 ) ( SURFACE-AT ?auto_11347 ?auto_11363 ) ( ON ?auto_11347 ?auto_11364 ) ( CLEAR ?auto_11347 ) ( TRUCK-AT ?auto_11354 ?auto_11357 ) ( not ( = ?auto_11346 ?auto_11347 ) ) ( not ( = ?auto_11346 ?auto_11364 ) ) ( not ( = ?auto_11347 ?auto_11364 ) ) ( not ( = ?auto_11353 ?auto_11368 ) ) ( not ( = ?auto_11346 ?auto_11348 ) ) ( not ( = ?auto_11346 ?auto_11365 ) ) ( not ( = ?auto_11348 ?auto_11364 ) ) ( not ( = ?auto_11362 ?auto_11363 ) ) ( not ( = ?auto_11358 ?auto_11368 ) ) ( not ( = ?auto_11365 ?auto_11364 ) ) ( not ( = ?auto_11346 ?auto_11349 ) ) ( not ( = ?auto_11346 ?auto_11361 ) ) ( not ( = ?auto_11347 ?auto_11349 ) ) ( not ( = ?auto_11347 ?auto_11361 ) ) ( not ( = ?auto_11349 ?auto_11365 ) ) ( not ( = ?auto_11349 ?auto_11364 ) ) ( not ( = ?auto_11366 ?auto_11362 ) ) ( not ( = ?auto_11366 ?auto_11363 ) ) ( not ( = ?auto_11367 ?auto_11358 ) ) ( not ( = ?auto_11367 ?auto_11368 ) ) ( not ( = ?auto_11361 ?auto_11365 ) ) ( not ( = ?auto_11361 ?auto_11364 ) ) ( not ( = ?auto_11346 ?auto_11350 ) ) ( not ( = ?auto_11346 ?auto_11369 ) ) ( not ( = ?auto_11347 ?auto_11350 ) ) ( not ( = ?auto_11347 ?auto_11369 ) ) ( not ( = ?auto_11348 ?auto_11350 ) ) ( not ( = ?auto_11348 ?auto_11369 ) ) ( not ( = ?auto_11350 ?auto_11361 ) ) ( not ( = ?auto_11350 ?auto_11365 ) ) ( not ( = ?auto_11350 ?auto_11364 ) ) ( not ( = ?auto_11360 ?auto_11366 ) ) ( not ( = ?auto_11360 ?auto_11362 ) ) ( not ( = ?auto_11360 ?auto_11363 ) ) ( not ( = ?auto_11359 ?auto_11367 ) ) ( not ( = ?auto_11359 ?auto_11358 ) ) ( not ( = ?auto_11359 ?auto_11368 ) ) ( not ( = ?auto_11369 ?auto_11361 ) ) ( not ( = ?auto_11369 ?auto_11365 ) ) ( not ( = ?auto_11369 ?auto_11364 ) ) ( not ( = ?auto_11346 ?auto_11351 ) ) ( not ( = ?auto_11346 ?auto_11356 ) ) ( not ( = ?auto_11347 ?auto_11351 ) ) ( not ( = ?auto_11347 ?auto_11356 ) ) ( not ( = ?auto_11348 ?auto_11351 ) ) ( not ( = ?auto_11348 ?auto_11356 ) ) ( not ( = ?auto_11349 ?auto_11351 ) ) ( not ( = ?auto_11349 ?auto_11356 ) ) ( not ( = ?auto_11351 ?auto_11369 ) ) ( not ( = ?auto_11351 ?auto_11361 ) ) ( not ( = ?auto_11351 ?auto_11365 ) ) ( not ( = ?auto_11351 ?auto_11364 ) ) ( not ( = ?auto_11352 ?auto_11360 ) ) ( not ( = ?auto_11352 ?auto_11366 ) ) ( not ( = ?auto_11352 ?auto_11362 ) ) ( not ( = ?auto_11352 ?auto_11363 ) ) ( not ( = ?auto_11355 ?auto_11359 ) ) ( not ( = ?auto_11355 ?auto_11367 ) ) ( not ( = ?auto_11355 ?auto_11358 ) ) ( not ( = ?auto_11355 ?auto_11368 ) ) ( not ( = ?auto_11356 ?auto_11369 ) ) ( not ( = ?auto_11356 ?auto_11361 ) ) ( not ( = ?auto_11356 ?auto_11365 ) ) ( not ( = ?auto_11356 ?auto_11364 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_11346 ?auto_11347 ?auto_11348 ?auto_11349 ?auto_11350 )
      ( MAKE-1CRATE ?auto_11350 ?auto_11351 )
      ( MAKE-5CRATE-VERIFY ?auto_11346 ?auto_11347 ?auto_11348 ?auto_11349 ?auto_11350 ?auto_11351 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11372 - SURFACE
      ?auto_11373 - SURFACE
    )
    :vars
    (
      ?auto_11374 - HOIST
      ?auto_11375 - PLACE
      ?auto_11377 - PLACE
      ?auto_11378 - HOIST
      ?auto_11379 - SURFACE
      ?auto_11376 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11374 ?auto_11375 ) ( SURFACE-AT ?auto_11372 ?auto_11375 ) ( CLEAR ?auto_11372 ) ( IS-CRATE ?auto_11373 ) ( AVAILABLE ?auto_11374 ) ( not ( = ?auto_11377 ?auto_11375 ) ) ( HOIST-AT ?auto_11378 ?auto_11377 ) ( AVAILABLE ?auto_11378 ) ( SURFACE-AT ?auto_11373 ?auto_11377 ) ( ON ?auto_11373 ?auto_11379 ) ( CLEAR ?auto_11373 ) ( TRUCK-AT ?auto_11376 ?auto_11375 ) ( not ( = ?auto_11372 ?auto_11373 ) ) ( not ( = ?auto_11372 ?auto_11379 ) ) ( not ( = ?auto_11373 ?auto_11379 ) ) ( not ( = ?auto_11374 ?auto_11378 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_11376 ?auto_11375 ?auto_11377 )
      ( !LIFT ?auto_11378 ?auto_11373 ?auto_11379 ?auto_11377 )
      ( !LOAD ?auto_11378 ?auto_11373 ?auto_11376 ?auto_11377 )
      ( !DRIVE ?auto_11376 ?auto_11377 ?auto_11375 )
      ( !UNLOAD ?auto_11374 ?auto_11373 ?auto_11376 ?auto_11375 )
      ( !DROP ?auto_11374 ?auto_11373 ?auto_11372 ?auto_11375 )
      ( MAKE-1CRATE-VERIFY ?auto_11372 ?auto_11373 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_11387 - SURFACE
      ?auto_11388 - SURFACE
      ?auto_11389 - SURFACE
      ?auto_11390 - SURFACE
      ?auto_11391 - SURFACE
      ?auto_11393 - SURFACE
      ?auto_11392 - SURFACE
    )
    :vars
    (
      ?auto_11399 - HOIST
      ?auto_11397 - PLACE
      ?auto_11394 - PLACE
      ?auto_11398 - HOIST
      ?auto_11395 - SURFACE
      ?auto_11401 - PLACE
      ?auto_11403 - HOIST
      ?auto_11402 - SURFACE
      ?auto_11404 - PLACE
      ?auto_11405 - HOIST
      ?auto_11400 - SURFACE
      ?auto_11412 - PLACE
      ?auto_11406 - HOIST
      ?auto_11411 - SURFACE
      ?auto_11413 - PLACE
      ?auto_11408 - HOIST
      ?auto_11410 - SURFACE
      ?auto_11407 - PLACE
      ?auto_11414 - HOIST
      ?auto_11409 - SURFACE
      ?auto_11396 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11399 ?auto_11397 ) ( IS-CRATE ?auto_11392 ) ( not ( = ?auto_11394 ?auto_11397 ) ) ( HOIST-AT ?auto_11398 ?auto_11394 ) ( AVAILABLE ?auto_11398 ) ( SURFACE-AT ?auto_11392 ?auto_11394 ) ( ON ?auto_11392 ?auto_11395 ) ( CLEAR ?auto_11392 ) ( not ( = ?auto_11393 ?auto_11392 ) ) ( not ( = ?auto_11393 ?auto_11395 ) ) ( not ( = ?auto_11392 ?auto_11395 ) ) ( not ( = ?auto_11399 ?auto_11398 ) ) ( IS-CRATE ?auto_11393 ) ( not ( = ?auto_11401 ?auto_11397 ) ) ( HOIST-AT ?auto_11403 ?auto_11401 ) ( AVAILABLE ?auto_11403 ) ( SURFACE-AT ?auto_11393 ?auto_11401 ) ( ON ?auto_11393 ?auto_11402 ) ( CLEAR ?auto_11393 ) ( not ( = ?auto_11391 ?auto_11393 ) ) ( not ( = ?auto_11391 ?auto_11402 ) ) ( not ( = ?auto_11393 ?auto_11402 ) ) ( not ( = ?auto_11399 ?auto_11403 ) ) ( IS-CRATE ?auto_11391 ) ( not ( = ?auto_11404 ?auto_11397 ) ) ( HOIST-AT ?auto_11405 ?auto_11404 ) ( AVAILABLE ?auto_11405 ) ( SURFACE-AT ?auto_11391 ?auto_11404 ) ( ON ?auto_11391 ?auto_11400 ) ( CLEAR ?auto_11391 ) ( not ( = ?auto_11390 ?auto_11391 ) ) ( not ( = ?auto_11390 ?auto_11400 ) ) ( not ( = ?auto_11391 ?auto_11400 ) ) ( not ( = ?auto_11399 ?auto_11405 ) ) ( IS-CRATE ?auto_11390 ) ( not ( = ?auto_11412 ?auto_11397 ) ) ( HOIST-AT ?auto_11406 ?auto_11412 ) ( AVAILABLE ?auto_11406 ) ( SURFACE-AT ?auto_11390 ?auto_11412 ) ( ON ?auto_11390 ?auto_11411 ) ( CLEAR ?auto_11390 ) ( not ( = ?auto_11389 ?auto_11390 ) ) ( not ( = ?auto_11389 ?auto_11411 ) ) ( not ( = ?auto_11390 ?auto_11411 ) ) ( not ( = ?auto_11399 ?auto_11406 ) ) ( IS-CRATE ?auto_11389 ) ( not ( = ?auto_11413 ?auto_11397 ) ) ( HOIST-AT ?auto_11408 ?auto_11413 ) ( AVAILABLE ?auto_11408 ) ( SURFACE-AT ?auto_11389 ?auto_11413 ) ( ON ?auto_11389 ?auto_11410 ) ( CLEAR ?auto_11389 ) ( not ( = ?auto_11388 ?auto_11389 ) ) ( not ( = ?auto_11388 ?auto_11410 ) ) ( not ( = ?auto_11389 ?auto_11410 ) ) ( not ( = ?auto_11399 ?auto_11408 ) ) ( SURFACE-AT ?auto_11387 ?auto_11397 ) ( CLEAR ?auto_11387 ) ( IS-CRATE ?auto_11388 ) ( AVAILABLE ?auto_11399 ) ( not ( = ?auto_11407 ?auto_11397 ) ) ( HOIST-AT ?auto_11414 ?auto_11407 ) ( AVAILABLE ?auto_11414 ) ( SURFACE-AT ?auto_11388 ?auto_11407 ) ( ON ?auto_11388 ?auto_11409 ) ( CLEAR ?auto_11388 ) ( TRUCK-AT ?auto_11396 ?auto_11397 ) ( not ( = ?auto_11387 ?auto_11388 ) ) ( not ( = ?auto_11387 ?auto_11409 ) ) ( not ( = ?auto_11388 ?auto_11409 ) ) ( not ( = ?auto_11399 ?auto_11414 ) ) ( not ( = ?auto_11387 ?auto_11389 ) ) ( not ( = ?auto_11387 ?auto_11410 ) ) ( not ( = ?auto_11389 ?auto_11409 ) ) ( not ( = ?auto_11413 ?auto_11407 ) ) ( not ( = ?auto_11408 ?auto_11414 ) ) ( not ( = ?auto_11410 ?auto_11409 ) ) ( not ( = ?auto_11387 ?auto_11390 ) ) ( not ( = ?auto_11387 ?auto_11411 ) ) ( not ( = ?auto_11388 ?auto_11390 ) ) ( not ( = ?auto_11388 ?auto_11411 ) ) ( not ( = ?auto_11390 ?auto_11410 ) ) ( not ( = ?auto_11390 ?auto_11409 ) ) ( not ( = ?auto_11412 ?auto_11413 ) ) ( not ( = ?auto_11412 ?auto_11407 ) ) ( not ( = ?auto_11406 ?auto_11408 ) ) ( not ( = ?auto_11406 ?auto_11414 ) ) ( not ( = ?auto_11411 ?auto_11410 ) ) ( not ( = ?auto_11411 ?auto_11409 ) ) ( not ( = ?auto_11387 ?auto_11391 ) ) ( not ( = ?auto_11387 ?auto_11400 ) ) ( not ( = ?auto_11388 ?auto_11391 ) ) ( not ( = ?auto_11388 ?auto_11400 ) ) ( not ( = ?auto_11389 ?auto_11391 ) ) ( not ( = ?auto_11389 ?auto_11400 ) ) ( not ( = ?auto_11391 ?auto_11411 ) ) ( not ( = ?auto_11391 ?auto_11410 ) ) ( not ( = ?auto_11391 ?auto_11409 ) ) ( not ( = ?auto_11404 ?auto_11412 ) ) ( not ( = ?auto_11404 ?auto_11413 ) ) ( not ( = ?auto_11404 ?auto_11407 ) ) ( not ( = ?auto_11405 ?auto_11406 ) ) ( not ( = ?auto_11405 ?auto_11408 ) ) ( not ( = ?auto_11405 ?auto_11414 ) ) ( not ( = ?auto_11400 ?auto_11411 ) ) ( not ( = ?auto_11400 ?auto_11410 ) ) ( not ( = ?auto_11400 ?auto_11409 ) ) ( not ( = ?auto_11387 ?auto_11393 ) ) ( not ( = ?auto_11387 ?auto_11402 ) ) ( not ( = ?auto_11388 ?auto_11393 ) ) ( not ( = ?auto_11388 ?auto_11402 ) ) ( not ( = ?auto_11389 ?auto_11393 ) ) ( not ( = ?auto_11389 ?auto_11402 ) ) ( not ( = ?auto_11390 ?auto_11393 ) ) ( not ( = ?auto_11390 ?auto_11402 ) ) ( not ( = ?auto_11393 ?auto_11400 ) ) ( not ( = ?auto_11393 ?auto_11411 ) ) ( not ( = ?auto_11393 ?auto_11410 ) ) ( not ( = ?auto_11393 ?auto_11409 ) ) ( not ( = ?auto_11401 ?auto_11404 ) ) ( not ( = ?auto_11401 ?auto_11412 ) ) ( not ( = ?auto_11401 ?auto_11413 ) ) ( not ( = ?auto_11401 ?auto_11407 ) ) ( not ( = ?auto_11403 ?auto_11405 ) ) ( not ( = ?auto_11403 ?auto_11406 ) ) ( not ( = ?auto_11403 ?auto_11408 ) ) ( not ( = ?auto_11403 ?auto_11414 ) ) ( not ( = ?auto_11402 ?auto_11400 ) ) ( not ( = ?auto_11402 ?auto_11411 ) ) ( not ( = ?auto_11402 ?auto_11410 ) ) ( not ( = ?auto_11402 ?auto_11409 ) ) ( not ( = ?auto_11387 ?auto_11392 ) ) ( not ( = ?auto_11387 ?auto_11395 ) ) ( not ( = ?auto_11388 ?auto_11392 ) ) ( not ( = ?auto_11388 ?auto_11395 ) ) ( not ( = ?auto_11389 ?auto_11392 ) ) ( not ( = ?auto_11389 ?auto_11395 ) ) ( not ( = ?auto_11390 ?auto_11392 ) ) ( not ( = ?auto_11390 ?auto_11395 ) ) ( not ( = ?auto_11391 ?auto_11392 ) ) ( not ( = ?auto_11391 ?auto_11395 ) ) ( not ( = ?auto_11392 ?auto_11402 ) ) ( not ( = ?auto_11392 ?auto_11400 ) ) ( not ( = ?auto_11392 ?auto_11411 ) ) ( not ( = ?auto_11392 ?auto_11410 ) ) ( not ( = ?auto_11392 ?auto_11409 ) ) ( not ( = ?auto_11394 ?auto_11401 ) ) ( not ( = ?auto_11394 ?auto_11404 ) ) ( not ( = ?auto_11394 ?auto_11412 ) ) ( not ( = ?auto_11394 ?auto_11413 ) ) ( not ( = ?auto_11394 ?auto_11407 ) ) ( not ( = ?auto_11398 ?auto_11403 ) ) ( not ( = ?auto_11398 ?auto_11405 ) ) ( not ( = ?auto_11398 ?auto_11406 ) ) ( not ( = ?auto_11398 ?auto_11408 ) ) ( not ( = ?auto_11398 ?auto_11414 ) ) ( not ( = ?auto_11395 ?auto_11402 ) ) ( not ( = ?auto_11395 ?auto_11400 ) ) ( not ( = ?auto_11395 ?auto_11411 ) ) ( not ( = ?auto_11395 ?auto_11410 ) ) ( not ( = ?auto_11395 ?auto_11409 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_11387 ?auto_11388 ?auto_11389 ?auto_11390 ?auto_11391 ?auto_11393 )
      ( MAKE-1CRATE ?auto_11393 ?auto_11392 )
      ( MAKE-6CRATE-VERIFY ?auto_11387 ?auto_11388 ?auto_11389 ?auto_11390 ?auto_11391 ?auto_11393 ?auto_11392 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11417 - SURFACE
      ?auto_11418 - SURFACE
    )
    :vars
    (
      ?auto_11419 - HOIST
      ?auto_11420 - PLACE
      ?auto_11422 - PLACE
      ?auto_11423 - HOIST
      ?auto_11424 - SURFACE
      ?auto_11421 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11419 ?auto_11420 ) ( SURFACE-AT ?auto_11417 ?auto_11420 ) ( CLEAR ?auto_11417 ) ( IS-CRATE ?auto_11418 ) ( AVAILABLE ?auto_11419 ) ( not ( = ?auto_11422 ?auto_11420 ) ) ( HOIST-AT ?auto_11423 ?auto_11422 ) ( AVAILABLE ?auto_11423 ) ( SURFACE-AT ?auto_11418 ?auto_11422 ) ( ON ?auto_11418 ?auto_11424 ) ( CLEAR ?auto_11418 ) ( TRUCK-AT ?auto_11421 ?auto_11420 ) ( not ( = ?auto_11417 ?auto_11418 ) ) ( not ( = ?auto_11417 ?auto_11424 ) ) ( not ( = ?auto_11418 ?auto_11424 ) ) ( not ( = ?auto_11419 ?auto_11423 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_11421 ?auto_11420 ?auto_11422 )
      ( !LIFT ?auto_11423 ?auto_11418 ?auto_11424 ?auto_11422 )
      ( !LOAD ?auto_11423 ?auto_11418 ?auto_11421 ?auto_11422 )
      ( !DRIVE ?auto_11421 ?auto_11422 ?auto_11420 )
      ( !UNLOAD ?auto_11419 ?auto_11418 ?auto_11421 ?auto_11420 )
      ( !DROP ?auto_11419 ?auto_11418 ?auto_11417 ?auto_11420 )
      ( MAKE-1CRATE-VERIFY ?auto_11417 ?auto_11418 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_11433 - SURFACE
      ?auto_11434 - SURFACE
      ?auto_11435 - SURFACE
      ?auto_11436 - SURFACE
      ?auto_11437 - SURFACE
      ?auto_11439 - SURFACE
      ?auto_11438 - SURFACE
      ?auto_11440 - SURFACE
    )
    :vars
    (
      ?auto_11444 - HOIST
      ?auto_11443 - PLACE
      ?auto_11441 - PLACE
      ?auto_11445 - HOIST
      ?auto_11446 - SURFACE
      ?auto_11457 - PLACE
      ?auto_11464 - HOIST
      ?auto_11460 - SURFACE
      ?auto_11462 - PLACE
      ?auto_11461 - HOIST
      ?auto_11458 - SURFACE
      ?auto_11456 - PLACE
      ?auto_11455 - HOIST
      ?auto_11447 - SURFACE
      ?auto_11451 - PLACE
      ?auto_11454 - HOIST
      ?auto_11450 - SURFACE
      ?auto_11452 - PLACE
      ?auto_11463 - HOIST
      ?auto_11448 - SURFACE
      ?auto_11453 - PLACE
      ?auto_11459 - HOIST
      ?auto_11449 - SURFACE
      ?auto_11442 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11444 ?auto_11443 ) ( IS-CRATE ?auto_11440 ) ( not ( = ?auto_11441 ?auto_11443 ) ) ( HOIST-AT ?auto_11445 ?auto_11441 ) ( AVAILABLE ?auto_11445 ) ( SURFACE-AT ?auto_11440 ?auto_11441 ) ( ON ?auto_11440 ?auto_11446 ) ( CLEAR ?auto_11440 ) ( not ( = ?auto_11438 ?auto_11440 ) ) ( not ( = ?auto_11438 ?auto_11446 ) ) ( not ( = ?auto_11440 ?auto_11446 ) ) ( not ( = ?auto_11444 ?auto_11445 ) ) ( IS-CRATE ?auto_11438 ) ( not ( = ?auto_11457 ?auto_11443 ) ) ( HOIST-AT ?auto_11464 ?auto_11457 ) ( AVAILABLE ?auto_11464 ) ( SURFACE-AT ?auto_11438 ?auto_11457 ) ( ON ?auto_11438 ?auto_11460 ) ( CLEAR ?auto_11438 ) ( not ( = ?auto_11439 ?auto_11438 ) ) ( not ( = ?auto_11439 ?auto_11460 ) ) ( not ( = ?auto_11438 ?auto_11460 ) ) ( not ( = ?auto_11444 ?auto_11464 ) ) ( IS-CRATE ?auto_11439 ) ( not ( = ?auto_11462 ?auto_11443 ) ) ( HOIST-AT ?auto_11461 ?auto_11462 ) ( AVAILABLE ?auto_11461 ) ( SURFACE-AT ?auto_11439 ?auto_11462 ) ( ON ?auto_11439 ?auto_11458 ) ( CLEAR ?auto_11439 ) ( not ( = ?auto_11437 ?auto_11439 ) ) ( not ( = ?auto_11437 ?auto_11458 ) ) ( not ( = ?auto_11439 ?auto_11458 ) ) ( not ( = ?auto_11444 ?auto_11461 ) ) ( IS-CRATE ?auto_11437 ) ( not ( = ?auto_11456 ?auto_11443 ) ) ( HOIST-AT ?auto_11455 ?auto_11456 ) ( AVAILABLE ?auto_11455 ) ( SURFACE-AT ?auto_11437 ?auto_11456 ) ( ON ?auto_11437 ?auto_11447 ) ( CLEAR ?auto_11437 ) ( not ( = ?auto_11436 ?auto_11437 ) ) ( not ( = ?auto_11436 ?auto_11447 ) ) ( not ( = ?auto_11437 ?auto_11447 ) ) ( not ( = ?auto_11444 ?auto_11455 ) ) ( IS-CRATE ?auto_11436 ) ( not ( = ?auto_11451 ?auto_11443 ) ) ( HOIST-AT ?auto_11454 ?auto_11451 ) ( AVAILABLE ?auto_11454 ) ( SURFACE-AT ?auto_11436 ?auto_11451 ) ( ON ?auto_11436 ?auto_11450 ) ( CLEAR ?auto_11436 ) ( not ( = ?auto_11435 ?auto_11436 ) ) ( not ( = ?auto_11435 ?auto_11450 ) ) ( not ( = ?auto_11436 ?auto_11450 ) ) ( not ( = ?auto_11444 ?auto_11454 ) ) ( IS-CRATE ?auto_11435 ) ( not ( = ?auto_11452 ?auto_11443 ) ) ( HOIST-AT ?auto_11463 ?auto_11452 ) ( AVAILABLE ?auto_11463 ) ( SURFACE-AT ?auto_11435 ?auto_11452 ) ( ON ?auto_11435 ?auto_11448 ) ( CLEAR ?auto_11435 ) ( not ( = ?auto_11434 ?auto_11435 ) ) ( not ( = ?auto_11434 ?auto_11448 ) ) ( not ( = ?auto_11435 ?auto_11448 ) ) ( not ( = ?auto_11444 ?auto_11463 ) ) ( SURFACE-AT ?auto_11433 ?auto_11443 ) ( CLEAR ?auto_11433 ) ( IS-CRATE ?auto_11434 ) ( AVAILABLE ?auto_11444 ) ( not ( = ?auto_11453 ?auto_11443 ) ) ( HOIST-AT ?auto_11459 ?auto_11453 ) ( AVAILABLE ?auto_11459 ) ( SURFACE-AT ?auto_11434 ?auto_11453 ) ( ON ?auto_11434 ?auto_11449 ) ( CLEAR ?auto_11434 ) ( TRUCK-AT ?auto_11442 ?auto_11443 ) ( not ( = ?auto_11433 ?auto_11434 ) ) ( not ( = ?auto_11433 ?auto_11449 ) ) ( not ( = ?auto_11434 ?auto_11449 ) ) ( not ( = ?auto_11444 ?auto_11459 ) ) ( not ( = ?auto_11433 ?auto_11435 ) ) ( not ( = ?auto_11433 ?auto_11448 ) ) ( not ( = ?auto_11435 ?auto_11449 ) ) ( not ( = ?auto_11452 ?auto_11453 ) ) ( not ( = ?auto_11463 ?auto_11459 ) ) ( not ( = ?auto_11448 ?auto_11449 ) ) ( not ( = ?auto_11433 ?auto_11436 ) ) ( not ( = ?auto_11433 ?auto_11450 ) ) ( not ( = ?auto_11434 ?auto_11436 ) ) ( not ( = ?auto_11434 ?auto_11450 ) ) ( not ( = ?auto_11436 ?auto_11448 ) ) ( not ( = ?auto_11436 ?auto_11449 ) ) ( not ( = ?auto_11451 ?auto_11452 ) ) ( not ( = ?auto_11451 ?auto_11453 ) ) ( not ( = ?auto_11454 ?auto_11463 ) ) ( not ( = ?auto_11454 ?auto_11459 ) ) ( not ( = ?auto_11450 ?auto_11448 ) ) ( not ( = ?auto_11450 ?auto_11449 ) ) ( not ( = ?auto_11433 ?auto_11437 ) ) ( not ( = ?auto_11433 ?auto_11447 ) ) ( not ( = ?auto_11434 ?auto_11437 ) ) ( not ( = ?auto_11434 ?auto_11447 ) ) ( not ( = ?auto_11435 ?auto_11437 ) ) ( not ( = ?auto_11435 ?auto_11447 ) ) ( not ( = ?auto_11437 ?auto_11450 ) ) ( not ( = ?auto_11437 ?auto_11448 ) ) ( not ( = ?auto_11437 ?auto_11449 ) ) ( not ( = ?auto_11456 ?auto_11451 ) ) ( not ( = ?auto_11456 ?auto_11452 ) ) ( not ( = ?auto_11456 ?auto_11453 ) ) ( not ( = ?auto_11455 ?auto_11454 ) ) ( not ( = ?auto_11455 ?auto_11463 ) ) ( not ( = ?auto_11455 ?auto_11459 ) ) ( not ( = ?auto_11447 ?auto_11450 ) ) ( not ( = ?auto_11447 ?auto_11448 ) ) ( not ( = ?auto_11447 ?auto_11449 ) ) ( not ( = ?auto_11433 ?auto_11439 ) ) ( not ( = ?auto_11433 ?auto_11458 ) ) ( not ( = ?auto_11434 ?auto_11439 ) ) ( not ( = ?auto_11434 ?auto_11458 ) ) ( not ( = ?auto_11435 ?auto_11439 ) ) ( not ( = ?auto_11435 ?auto_11458 ) ) ( not ( = ?auto_11436 ?auto_11439 ) ) ( not ( = ?auto_11436 ?auto_11458 ) ) ( not ( = ?auto_11439 ?auto_11447 ) ) ( not ( = ?auto_11439 ?auto_11450 ) ) ( not ( = ?auto_11439 ?auto_11448 ) ) ( not ( = ?auto_11439 ?auto_11449 ) ) ( not ( = ?auto_11462 ?auto_11456 ) ) ( not ( = ?auto_11462 ?auto_11451 ) ) ( not ( = ?auto_11462 ?auto_11452 ) ) ( not ( = ?auto_11462 ?auto_11453 ) ) ( not ( = ?auto_11461 ?auto_11455 ) ) ( not ( = ?auto_11461 ?auto_11454 ) ) ( not ( = ?auto_11461 ?auto_11463 ) ) ( not ( = ?auto_11461 ?auto_11459 ) ) ( not ( = ?auto_11458 ?auto_11447 ) ) ( not ( = ?auto_11458 ?auto_11450 ) ) ( not ( = ?auto_11458 ?auto_11448 ) ) ( not ( = ?auto_11458 ?auto_11449 ) ) ( not ( = ?auto_11433 ?auto_11438 ) ) ( not ( = ?auto_11433 ?auto_11460 ) ) ( not ( = ?auto_11434 ?auto_11438 ) ) ( not ( = ?auto_11434 ?auto_11460 ) ) ( not ( = ?auto_11435 ?auto_11438 ) ) ( not ( = ?auto_11435 ?auto_11460 ) ) ( not ( = ?auto_11436 ?auto_11438 ) ) ( not ( = ?auto_11436 ?auto_11460 ) ) ( not ( = ?auto_11437 ?auto_11438 ) ) ( not ( = ?auto_11437 ?auto_11460 ) ) ( not ( = ?auto_11438 ?auto_11458 ) ) ( not ( = ?auto_11438 ?auto_11447 ) ) ( not ( = ?auto_11438 ?auto_11450 ) ) ( not ( = ?auto_11438 ?auto_11448 ) ) ( not ( = ?auto_11438 ?auto_11449 ) ) ( not ( = ?auto_11457 ?auto_11462 ) ) ( not ( = ?auto_11457 ?auto_11456 ) ) ( not ( = ?auto_11457 ?auto_11451 ) ) ( not ( = ?auto_11457 ?auto_11452 ) ) ( not ( = ?auto_11457 ?auto_11453 ) ) ( not ( = ?auto_11464 ?auto_11461 ) ) ( not ( = ?auto_11464 ?auto_11455 ) ) ( not ( = ?auto_11464 ?auto_11454 ) ) ( not ( = ?auto_11464 ?auto_11463 ) ) ( not ( = ?auto_11464 ?auto_11459 ) ) ( not ( = ?auto_11460 ?auto_11458 ) ) ( not ( = ?auto_11460 ?auto_11447 ) ) ( not ( = ?auto_11460 ?auto_11450 ) ) ( not ( = ?auto_11460 ?auto_11448 ) ) ( not ( = ?auto_11460 ?auto_11449 ) ) ( not ( = ?auto_11433 ?auto_11440 ) ) ( not ( = ?auto_11433 ?auto_11446 ) ) ( not ( = ?auto_11434 ?auto_11440 ) ) ( not ( = ?auto_11434 ?auto_11446 ) ) ( not ( = ?auto_11435 ?auto_11440 ) ) ( not ( = ?auto_11435 ?auto_11446 ) ) ( not ( = ?auto_11436 ?auto_11440 ) ) ( not ( = ?auto_11436 ?auto_11446 ) ) ( not ( = ?auto_11437 ?auto_11440 ) ) ( not ( = ?auto_11437 ?auto_11446 ) ) ( not ( = ?auto_11439 ?auto_11440 ) ) ( not ( = ?auto_11439 ?auto_11446 ) ) ( not ( = ?auto_11440 ?auto_11460 ) ) ( not ( = ?auto_11440 ?auto_11458 ) ) ( not ( = ?auto_11440 ?auto_11447 ) ) ( not ( = ?auto_11440 ?auto_11450 ) ) ( not ( = ?auto_11440 ?auto_11448 ) ) ( not ( = ?auto_11440 ?auto_11449 ) ) ( not ( = ?auto_11441 ?auto_11457 ) ) ( not ( = ?auto_11441 ?auto_11462 ) ) ( not ( = ?auto_11441 ?auto_11456 ) ) ( not ( = ?auto_11441 ?auto_11451 ) ) ( not ( = ?auto_11441 ?auto_11452 ) ) ( not ( = ?auto_11441 ?auto_11453 ) ) ( not ( = ?auto_11445 ?auto_11464 ) ) ( not ( = ?auto_11445 ?auto_11461 ) ) ( not ( = ?auto_11445 ?auto_11455 ) ) ( not ( = ?auto_11445 ?auto_11454 ) ) ( not ( = ?auto_11445 ?auto_11463 ) ) ( not ( = ?auto_11445 ?auto_11459 ) ) ( not ( = ?auto_11446 ?auto_11460 ) ) ( not ( = ?auto_11446 ?auto_11458 ) ) ( not ( = ?auto_11446 ?auto_11447 ) ) ( not ( = ?auto_11446 ?auto_11450 ) ) ( not ( = ?auto_11446 ?auto_11448 ) ) ( not ( = ?auto_11446 ?auto_11449 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_11433 ?auto_11434 ?auto_11435 ?auto_11436 ?auto_11437 ?auto_11439 ?auto_11438 )
      ( MAKE-1CRATE ?auto_11438 ?auto_11440 )
      ( MAKE-7CRATE-VERIFY ?auto_11433 ?auto_11434 ?auto_11435 ?auto_11436 ?auto_11437 ?auto_11439 ?auto_11438 ?auto_11440 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11467 - SURFACE
      ?auto_11468 - SURFACE
    )
    :vars
    (
      ?auto_11469 - HOIST
      ?auto_11470 - PLACE
      ?auto_11472 - PLACE
      ?auto_11473 - HOIST
      ?auto_11474 - SURFACE
      ?auto_11471 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11469 ?auto_11470 ) ( SURFACE-AT ?auto_11467 ?auto_11470 ) ( CLEAR ?auto_11467 ) ( IS-CRATE ?auto_11468 ) ( AVAILABLE ?auto_11469 ) ( not ( = ?auto_11472 ?auto_11470 ) ) ( HOIST-AT ?auto_11473 ?auto_11472 ) ( AVAILABLE ?auto_11473 ) ( SURFACE-AT ?auto_11468 ?auto_11472 ) ( ON ?auto_11468 ?auto_11474 ) ( CLEAR ?auto_11468 ) ( TRUCK-AT ?auto_11471 ?auto_11470 ) ( not ( = ?auto_11467 ?auto_11468 ) ) ( not ( = ?auto_11467 ?auto_11474 ) ) ( not ( = ?auto_11468 ?auto_11474 ) ) ( not ( = ?auto_11469 ?auto_11473 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_11471 ?auto_11470 ?auto_11472 )
      ( !LIFT ?auto_11473 ?auto_11468 ?auto_11474 ?auto_11472 )
      ( !LOAD ?auto_11473 ?auto_11468 ?auto_11471 ?auto_11472 )
      ( !DRIVE ?auto_11471 ?auto_11472 ?auto_11470 )
      ( !UNLOAD ?auto_11469 ?auto_11468 ?auto_11471 ?auto_11470 )
      ( !DROP ?auto_11469 ?auto_11468 ?auto_11467 ?auto_11470 )
      ( MAKE-1CRATE-VERIFY ?auto_11467 ?auto_11468 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_11484 - SURFACE
      ?auto_11485 - SURFACE
      ?auto_11486 - SURFACE
      ?auto_11487 - SURFACE
      ?auto_11488 - SURFACE
      ?auto_11490 - SURFACE
      ?auto_11489 - SURFACE
      ?auto_11492 - SURFACE
      ?auto_11491 - SURFACE
    )
    :vars
    (
      ?auto_11494 - HOIST
      ?auto_11497 - PLACE
      ?auto_11498 - PLACE
      ?auto_11495 - HOIST
      ?auto_11496 - SURFACE
      ?auto_11505 - PLACE
      ?auto_11517 - HOIST
      ?auto_11509 - SURFACE
      ?auto_11508 - PLACE
      ?auto_11500 - HOIST
      ?auto_11513 - SURFACE
      ?auto_11504 - PLACE
      ?auto_11501 - HOIST
      ?auto_11511 - SURFACE
      ?auto_11510 - PLACE
      ?auto_11507 - HOIST
      ?auto_11499 - SURFACE
      ?auto_11516 - PLACE
      ?auto_11514 - HOIST
      ?auto_11506 - SURFACE
      ?auto_11503 - SURFACE
      ?auto_11515 - PLACE
      ?auto_11512 - HOIST
      ?auto_11502 - SURFACE
      ?auto_11493 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11494 ?auto_11497 ) ( IS-CRATE ?auto_11491 ) ( not ( = ?auto_11498 ?auto_11497 ) ) ( HOIST-AT ?auto_11495 ?auto_11498 ) ( SURFACE-AT ?auto_11491 ?auto_11498 ) ( ON ?auto_11491 ?auto_11496 ) ( CLEAR ?auto_11491 ) ( not ( = ?auto_11492 ?auto_11491 ) ) ( not ( = ?auto_11492 ?auto_11496 ) ) ( not ( = ?auto_11491 ?auto_11496 ) ) ( not ( = ?auto_11494 ?auto_11495 ) ) ( IS-CRATE ?auto_11492 ) ( not ( = ?auto_11505 ?auto_11497 ) ) ( HOIST-AT ?auto_11517 ?auto_11505 ) ( AVAILABLE ?auto_11517 ) ( SURFACE-AT ?auto_11492 ?auto_11505 ) ( ON ?auto_11492 ?auto_11509 ) ( CLEAR ?auto_11492 ) ( not ( = ?auto_11489 ?auto_11492 ) ) ( not ( = ?auto_11489 ?auto_11509 ) ) ( not ( = ?auto_11492 ?auto_11509 ) ) ( not ( = ?auto_11494 ?auto_11517 ) ) ( IS-CRATE ?auto_11489 ) ( not ( = ?auto_11508 ?auto_11497 ) ) ( HOIST-AT ?auto_11500 ?auto_11508 ) ( AVAILABLE ?auto_11500 ) ( SURFACE-AT ?auto_11489 ?auto_11508 ) ( ON ?auto_11489 ?auto_11513 ) ( CLEAR ?auto_11489 ) ( not ( = ?auto_11490 ?auto_11489 ) ) ( not ( = ?auto_11490 ?auto_11513 ) ) ( not ( = ?auto_11489 ?auto_11513 ) ) ( not ( = ?auto_11494 ?auto_11500 ) ) ( IS-CRATE ?auto_11490 ) ( not ( = ?auto_11504 ?auto_11497 ) ) ( HOIST-AT ?auto_11501 ?auto_11504 ) ( AVAILABLE ?auto_11501 ) ( SURFACE-AT ?auto_11490 ?auto_11504 ) ( ON ?auto_11490 ?auto_11511 ) ( CLEAR ?auto_11490 ) ( not ( = ?auto_11488 ?auto_11490 ) ) ( not ( = ?auto_11488 ?auto_11511 ) ) ( not ( = ?auto_11490 ?auto_11511 ) ) ( not ( = ?auto_11494 ?auto_11501 ) ) ( IS-CRATE ?auto_11488 ) ( not ( = ?auto_11510 ?auto_11497 ) ) ( HOIST-AT ?auto_11507 ?auto_11510 ) ( AVAILABLE ?auto_11507 ) ( SURFACE-AT ?auto_11488 ?auto_11510 ) ( ON ?auto_11488 ?auto_11499 ) ( CLEAR ?auto_11488 ) ( not ( = ?auto_11487 ?auto_11488 ) ) ( not ( = ?auto_11487 ?auto_11499 ) ) ( not ( = ?auto_11488 ?auto_11499 ) ) ( not ( = ?auto_11494 ?auto_11507 ) ) ( IS-CRATE ?auto_11487 ) ( not ( = ?auto_11516 ?auto_11497 ) ) ( HOIST-AT ?auto_11514 ?auto_11516 ) ( AVAILABLE ?auto_11514 ) ( SURFACE-AT ?auto_11487 ?auto_11516 ) ( ON ?auto_11487 ?auto_11506 ) ( CLEAR ?auto_11487 ) ( not ( = ?auto_11486 ?auto_11487 ) ) ( not ( = ?auto_11486 ?auto_11506 ) ) ( not ( = ?auto_11487 ?auto_11506 ) ) ( not ( = ?auto_11494 ?auto_11514 ) ) ( IS-CRATE ?auto_11486 ) ( AVAILABLE ?auto_11495 ) ( SURFACE-AT ?auto_11486 ?auto_11498 ) ( ON ?auto_11486 ?auto_11503 ) ( CLEAR ?auto_11486 ) ( not ( = ?auto_11485 ?auto_11486 ) ) ( not ( = ?auto_11485 ?auto_11503 ) ) ( not ( = ?auto_11486 ?auto_11503 ) ) ( SURFACE-AT ?auto_11484 ?auto_11497 ) ( CLEAR ?auto_11484 ) ( IS-CRATE ?auto_11485 ) ( AVAILABLE ?auto_11494 ) ( not ( = ?auto_11515 ?auto_11497 ) ) ( HOIST-AT ?auto_11512 ?auto_11515 ) ( AVAILABLE ?auto_11512 ) ( SURFACE-AT ?auto_11485 ?auto_11515 ) ( ON ?auto_11485 ?auto_11502 ) ( CLEAR ?auto_11485 ) ( TRUCK-AT ?auto_11493 ?auto_11497 ) ( not ( = ?auto_11484 ?auto_11485 ) ) ( not ( = ?auto_11484 ?auto_11502 ) ) ( not ( = ?auto_11485 ?auto_11502 ) ) ( not ( = ?auto_11494 ?auto_11512 ) ) ( not ( = ?auto_11484 ?auto_11486 ) ) ( not ( = ?auto_11484 ?auto_11503 ) ) ( not ( = ?auto_11486 ?auto_11502 ) ) ( not ( = ?auto_11498 ?auto_11515 ) ) ( not ( = ?auto_11495 ?auto_11512 ) ) ( not ( = ?auto_11503 ?auto_11502 ) ) ( not ( = ?auto_11484 ?auto_11487 ) ) ( not ( = ?auto_11484 ?auto_11506 ) ) ( not ( = ?auto_11485 ?auto_11487 ) ) ( not ( = ?auto_11485 ?auto_11506 ) ) ( not ( = ?auto_11487 ?auto_11503 ) ) ( not ( = ?auto_11487 ?auto_11502 ) ) ( not ( = ?auto_11516 ?auto_11498 ) ) ( not ( = ?auto_11516 ?auto_11515 ) ) ( not ( = ?auto_11514 ?auto_11495 ) ) ( not ( = ?auto_11514 ?auto_11512 ) ) ( not ( = ?auto_11506 ?auto_11503 ) ) ( not ( = ?auto_11506 ?auto_11502 ) ) ( not ( = ?auto_11484 ?auto_11488 ) ) ( not ( = ?auto_11484 ?auto_11499 ) ) ( not ( = ?auto_11485 ?auto_11488 ) ) ( not ( = ?auto_11485 ?auto_11499 ) ) ( not ( = ?auto_11486 ?auto_11488 ) ) ( not ( = ?auto_11486 ?auto_11499 ) ) ( not ( = ?auto_11488 ?auto_11506 ) ) ( not ( = ?auto_11488 ?auto_11503 ) ) ( not ( = ?auto_11488 ?auto_11502 ) ) ( not ( = ?auto_11510 ?auto_11516 ) ) ( not ( = ?auto_11510 ?auto_11498 ) ) ( not ( = ?auto_11510 ?auto_11515 ) ) ( not ( = ?auto_11507 ?auto_11514 ) ) ( not ( = ?auto_11507 ?auto_11495 ) ) ( not ( = ?auto_11507 ?auto_11512 ) ) ( not ( = ?auto_11499 ?auto_11506 ) ) ( not ( = ?auto_11499 ?auto_11503 ) ) ( not ( = ?auto_11499 ?auto_11502 ) ) ( not ( = ?auto_11484 ?auto_11490 ) ) ( not ( = ?auto_11484 ?auto_11511 ) ) ( not ( = ?auto_11485 ?auto_11490 ) ) ( not ( = ?auto_11485 ?auto_11511 ) ) ( not ( = ?auto_11486 ?auto_11490 ) ) ( not ( = ?auto_11486 ?auto_11511 ) ) ( not ( = ?auto_11487 ?auto_11490 ) ) ( not ( = ?auto_11487 ?auto_11511 ) ) ( not ( = ?auto_11490 ?auto_11499 ) ) ( not ( = ?auto_11490 ?auto_11506 ) ) ( not ( = ?auto_11490 ?auto_11503 ) ) ( not ( = ?auto_11490 ?auto_11502 ) ) ( not ( = ?auto_11504 ?auto_11510 ) ) ( not ( = ?auto_11504 ?auto_11516 ) ) ( not ( = ?auto_11504 ?auto_11498 ) ) ( not ( = ?auto_11504 ?auto_11515 ) ) ( not ( = ?auto_11501 ?auto_11507 ) ) ( not ( = ?auto_11501 ?auto_11514 ) ) ( not ( = ?auto_11501 ?auto_11495 ) ) ( not ( = ?auto_11501 ?auto_11512 ) ) ( not ( = ?auto_11511 ?auto_11499 ) ) ( not ( = ?auto_11511 ?auto_11506 ) ) ( not ( = ?auto_11511 ?auto_11503 ) ) ( not ( = ?auto_11511 ?auto_11502 ) ) ( not ( = ?auto_11484 ?auto_11489 ) ) ( not ( = ?auto_11484 ?auto_11513 ) ) ( not ( = ?auto_11485 ?auto_11489 ) ) ( not ( = ?auto_11485 ?auto_11513 ) ) ( not ( = ?auto_11486 ?auto_11489 ) ) ( not ( = ?auto_11486 ?auto_11513 ) ) ( not ( = ?auto_11487 ?auto_11489 ) ) ( not ( = ?auto_11487 ?auto_11513 ) ) ( not ( = ?auto_11488 ?auto_11489 ) ) ( not ( = ?auto_11488 ?auto_11513 ) ) ( not ( = ?auto_11489 ?auto_11511 ) ) ( not ( = ?auto_11489 ?auto_11499 ) ) ( not ( = ?auto_11489 ?auto_11506 ) ) ( not ( = ?auto_11489 ?auto_11503 ) ) ( not ( = ?auto_11489 ?auto_11502 ) ) ( not ( = ?auto_11508 ?auto_11504 ) ) ( not ( = ?auto_11508 ?auto_11510 ) ) ( not ( = ?auto_11508 ?auto_11516 ) ) ( not ( = ?auto_11508 ?auto_11498 ) ) ( not ( = ?auto_11508 ?auto_11515 ) ) ( not ( = ?auto_11500 ?auto_11501 ) ) ( not ( = ?auto_11500 ?auto_11507 ) ) ( not ( = ?auto_11500 ?auto_11514 ) ) ( not ( = ?auto_11500 ?auto_11495 ) ) ( not ( = ?auto_11500 ?auto_11512 ) ) ( not ( = ?auto_11513 ?auto_11511 ) ) ( not ( = ?auto_11513 ?auto_11499 ) ) ( not ( = ?auto_11513 ?auto_11506 ) ) ( not ( = ?auto_11513 ?auto_11503 ) ) ( not ( = ?auto_11513 ?auto_11502 ) ) ( not ( = ?auto_11484 ?auto_11492 ) ) ( not ( = ?auto_11484 ?auto_11509 ) ) ( not ( = ?auto_11485 ?auto_11492 ) ) ( not ( = ?auto_11485 ?auto_11509 ) ) ( not ( = ?auto_11486 ?auto_11492 ) ) ( not ( = ?auto_11486 ?auto_11509 ) ) ( not ( = ?auto_11487 ?auto_11492 ) ) ( not ( = ?auto_11487 ?auto_11509 ) ) ( not ( = ?auto_11488 ?auto_11492 ) ) ( not ( = ?auto_11488 ?auto_11509 ) ) ( not ( = ?auto_11490 ?auto_11492 ) ) ( not ( = ?auto_11490 ?auto_11509 ) ) ( not ( = ?auto_11492 ?auto_11513 ) ) ( not ( = ?auto_11492 ?auto_11511 ) ) ( not ( = ?auto_11492 ?auto_11499 ) ) ( not ( = ?auto_11492 ?auto_11506 ) ) ( not ( = ?auto_11492 ?auto_11503 ) ) ( not ( = ?auto_11492 ?auto_11502 ) ) ( not ( = ?auto_11505 ?auto_11508 ) ) ( not ( = ?auto_11505 ?auto_11504 ) ) ( not ( = ?auto_11505 ?auto_11510 ) ) ( not ( = ?auto_11505 ?auto_11516 ) ) ( not ( = ?auto_11505 ?auto_11498 ) ) ( not ( = ?auto_11505 ?auto_11515 ) ) ( not ( = ?auto_11517 ?auto_11500 ) ) ( not ( = ?auto_11517 ?auto_11501 ) ) ( not ( = ?auto_11517 ?auto_11507 ) ) ( not ( = ?auto_11517 ?auto_11514 ) ) ( not ( = ?auto_11517 ?auto_11495 ) ) ( not ( = ?auto_11517 ?auto_11512 ) ) ( not ( = ?auto_11509 ?auto_11513 ) ) ( not ( = ?auto_11509 ?auto_11511 ) ) ( not ( = ?auto_11509 ?auto_11499 ) ) ( not ( = ?auto_11509 ?auto_11506 ) ) ( not ( = ?auto_11509 ?auto_11503 ) ) ( not ( = ?auto_11509 ?auto_11502 ) ) ( not ( = ?auto_11484 ?auto_11491 ) ) ( not ( = ?auto_11484 ?auto_11496 ) ) ( not ( = ?auto_11485 ?auto_11491 ) ) ( not ( = ?auto_11485 ?auto_11496 ) ) ( not ( = ?auto_11486 ?auto_11491 ) ) ( not ( = ?auto_11486 ?auto_11496 ) ) ( not ( = ?auto_11487 ?auto_11491 ) ) ( not ( = ?auto_11487 ?auto_11496 ) ) ( not ( = ?auto_11488 ?auto_11491 ) ) ( not ( = ?auto_11488 ?auto_11496 ) ) ( not ( = ?auto_11490 ?auto_11491 ) ) ( not ( = ?auto_11490 ?auto_11496 ) ) ( not ( = ?auto_11489 ?auto_11491 ) ) ( not ( = ?auto_11489 ?auto_11496 ) ) ( not ( = ?auto_11491 ?auto_11509 ) ) ( not ( = ?auto_11491 ?auto_11513 ) ) ( not ( = ?auto_11491 ?auto_11511 ) ) ( not ( = ?auto_11491 ?auto_11499 ) ) ( not ( = ?auto_11491 ?auto_11506 ) ) ( not ( = ?auto_11491 ?auto_11503 ) ) ( not ( = ?auto_11491 ?auto_11502 ) ) ( not ( = ?auto_11496 ?auto_11509 ) ) ( not ( = ?auto_11496 ?auto_11513 ) ) ( not ( = ?auto_11496 ?auto_11511 ) ) ( not ( = ?auto_11496 ?auto_11499 ) ) ( not ( = ?auto_11496 ?auto_11506 ) ) ( not ( = ?auto_11496 ?auto_11503 ) ) ( not ( = ?auto_11496 ?auto_11502 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_11484 ?auto_11485 ?auto_11486 ?auto_11487 ?auto_11488 ?auto_11490 ?auto_11489 ?auto_11492 )
      ( MAKE-1CRATE ?auto_11492 ?auto_11491 )
      ( MAKE-8CRATE-VERIFY ?auto_11484 ?auto_11485 ?auto_11486 ?auto_11487 ?auto_11488 ?auto_11490 ?auto_11489 ?auto_11492 ?auto_11491 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11520 - SURFACE
      ?auto_11521 - SURFACE
    )
    :vars
    (
      ?auto_11522 - HOIST
      ?auto_11523 - PLACE
      ?auto_11525 - PLACE
      ?auto_11526 - HOIST
      ?auto_11527 - SURFACE
      ?auto_11524 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11522 ?auto_11523 ) ( SURFACE-AT ?auto_11520 ?auto_11523 ) ( CLEAR ?auto_11520 ) ( IS-CRATE ?auto_11521 ) ( AVAILABLE ?auto_11522 ) ( not ( = ?auto_11525 ?auto_11523 ) ) ( HOIST-AT ?auto_11526 ?auto_11525 ) ( AVAILABLE ?auto_11526 ) ( SURFACE-AT ?auto_11521 ?auto_11525 ) ( ON ?auto_11521 ?auto_11527 ) ( CLEAR ?auto_11521 ) ( TRUCK-AT ?auto_11524 ?auto_11523 ) ( not ( = ?auto_11520 ?auto_11521 ) ) ( not ( = ?auto_11520 ?auto_11527 ) ) ( not ( = ?auto_11521 ?auto_11527 ) ) ( not ( = ?auto_11522 ?auto_11526 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_11524 ?auto_11523 ?auto_11525 )
      ( !LIFT ?auto_11526 ?auto_11521 ?auto_11527 ?auto_11525 )
      ( !LOAD ?auto_11526 ?auto_11521 ?auto_11524 ?auto_11525 )
      ( !DRIVE ?auto_11524 ?auto_11525 ?auto_11523 )
      ( !UNLOAD ?auto_11522 ?auto_11521 ?auto_11524 ?auto_11523 )
      ( !DROP ?auto_11522 ?auto_11521 ?auto_11520 ?auto_11523 )
      ( MAKE-1CRATE-VERIFY ?auto_11520 ?auto_11521 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_11538 - SURFACE
      ?auto_11539 - SURFACE
      ?auto_11540 - SURFACE
      ?auto_11541 - SURFACE
      ?auto_11542 - SURFACE
      ?auto_11545 - SURFACE
      ?auto_11543 - SURFACE
      ?auto_11547 - SURFACE
      ?auto_11546 - SURFACE
      ?auto_11544 - SURFACE
    )
    :vars
    (
      ?auto_11549 - HOIST
      ?auto_11552 - PLACE
      ?auto_11550 - PLACE
      ?auto_11551 - HOIST
      ?auto_11553 - SURFACE
      ?auto_11567 - SURFACE
      ?auto_11563 - PLACE
      ?auto_11554 - HOIST
      ?auto_11557 - SURFACE
      ?auto_11558 - PLACE
      ?auto_11569 - HOIST
      ?auto_11568 - SURFACE
      ?auto_11564 - PLACE
      ?auto_11572 - HOIST
      ?auto_11560 - SURFACE
      ?auto_11559 - PLACE
      ?auto_11556 - HOIST
      ?auto_11573 - SURFACE
      ?auto_11571 - PLACE
      ?auto_11570 - HOIST
      ?auto_11562 - SURFACE
      ?auto_11565 - SURFACE
      ?auto_11555 - PLACE
      ?auto_11561 - HOIST
      ?auto_11566 - SURFACE
      ?auto_11548 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11549 ?auto_11552 ) ( IS-CRATE ?auto_11544 ) ( not ( = ?auto_11550 ?auto_11552 ) ) ( HOIST-AT ?auto_11551 ?auto_11550 ) ( SURFACE-AT ?auto_11544 ?auto_11550 ) ( ON ?auto_11544 ?auto_11553 ) ( CLEAR ?auto_11544 ) ( not ( = ?auto_11546 ?auto_11544 ) ) ( not ( = ?auto_11546 ?auto_11553 ) ) ( not ( = ?auto_11544 ?auto_11553 ) ) ( not ( = ?auto_11549 ?auto_11551 ) ) ( IS-CRATE ?auto_11546 ) ( SURFACE-AT ?auto_11546 ?auto_11550 ) ( ON ?auto_11546 ?auto_11567 ) ( CLEAR ?auto_11546 ) ( not ( = ?auto_11547 ?auto_11546 ) ) ( not ( = ?auto_11547 ?auto_11567 ) ) ( not ( = ?auto_11546 ?auto_11567 ) ) ( IS-CRATE ?auto_11547 ) ( not ( = ?auto_11563 ?auto_11552 ) ) ( HOIST-AT ?auto_11554 ?auto_11563 ) ( AVAILABLE ?auto_11554 ) ( SURFACE-AT ?auto_11547 ?auto_11563 ) ( ON ?auto_11547 ?auto_11557 ) ( CLEAR ?auto_11547 ) ( not ( = ?auto_11543 ?auto_11547 ) ) ( not ( = ?auto_11543 ?auto_11557 ) ) ( not ( = ?auto_11547 ?auto_11557 ) ) ( not ( = ?auto_11549 ?auto_11554 ) ) ( IS-CRATE ?auto_11543 ) ( not ( = ?auto_11558 ?auto_11552 ) ) ( HOIST-AT ?auto_11569 ?auto_11558 ) ( AVAILABLE ?auto_11569 ) ( SURFACE-AT ?auto_11543 ?auto_11558 ) ( ON ?auto_11543 ?auto_11568 ) ( CLEAR ?auto_11543 ) ( not ( = ?auto_11545 ?auto_11543 ) ) ( not ( = ?auto_11545 ?auto_11568 ) ) ( not ( = ?auto_11543 ?auto_11568 ) ) ( not ( = ?auto_11549 ?auto_11569 ) ) ( IS-CRATE ?auto_11545 ) ( not ( = ?auto_11564 ?auto_11552 ) ) ( HOIST-AT ?auto_11572 ?auto_11564 ) ( AVAILABLE ?auto_11572 ) ( SURFACE-AT ?auto_11545 ?auto_11564 ) ( ON ?auto_11545 ?auto_11560 ) ( CLEAR ?auto_11545 ) ( not ( = ?auto_11542 ?auto_11545 ) ) ( not ( = ?auto_11542 ?auto_11560 ) ) ( not ( = ?auto_11545 ?auto_11560 ) ) ( not ( = ?auto_11549 ?auto_11572 ) ) ( IS-CRATE ?auto_11542 ) ( not ( = ?auto_11559 ?auto_11552 ) ) ( HOIST-AT ?auto_11556 ?auto_11559 ) ( AVAILABLE ?auto_11556 ) ( SURFACE-AT ?auto_11542 ?auto_11559 ) ( ON ?auto_11542 ?auto_11573 ) ( CLEAR ?auto_11542 ) ( not ( = ?auto_11541 ?auto_11542 ) ) ( not ( = ?auto_11541 ?auto_11573 ) ) ( not ( = ?auto_11542 ?auto_11573 ) ) ( not ( = ?auto_11549 ?auto_11556 ) ) ( IS-CRATE ?auto_11541 ) ( not ( = ?auto_11571 ?auto_11552 ) ) ( HOIST-AT ?auto_11570 ?auto_11571 ) ( AVAILABLE ?auto_11570 ) ( SURFACE-AT ?auto_11541 ?auto_11571 ) ( ON ?auto_11541 ?auto_11562 ) ( CLEAR ?auto_11541 ) ( not ( = ?auto_11540 ?auto_11541 ) ) ( not ( = ?auto_11540 ?auto_11562 ) ) ( not ( = ?auto_11541 ?auto_11562 ) ) ( not ( = ?auto_11549 ?auto_11570 ) ) ( IS-CRATE ?auto_11540 ) ( AVAILABLE ?auto_11551 ) ( SURFACE-AT ?auto_11540 ?auto_11550 ) ( ON ?auto_11540 ?auto_11565 ) ( CLEAR ?auto_11540 ) ( not ( = ?auto_11539 ?auto_11540 ) ) ( not ( = ?auto_11539 ?auto_11565 ) ) ( not ( = ?auto_11540 ?auto_11565 ) ) ( SURFACE-AT ?auto_11538 ?auto_11552 ) ( CLEAR ?auto_11538 ) ( IS-CRATE ?auto_11539 ) ( AVAILABLE ?auto_11549 ) ( not ( = ?auto_11555 ?auto_11552 ) ) ( HOIST-AT ?auto_11561 ?auto_11555 ) ( AVAILABLE ?auto_11561 ) ( SURFACE-AT ?auto_11539 ?auto_11555 ) ( ON ?auto_11539 ?auto_11566 ) ( CLEAR ?auto_11539 ) ( TRUCK-AT ?auto_11548 ?auto_11552 ) ( not ( = ?auto_11538 ?auto_11539 ) ) ( not ( = ?auto_11538 ?auto_11566 ) ) ( not ( = ?auto_11539 ?auto_11566 ) ) ( not ( = ?auto_11549 ?auto_11561 ) ) ( not ( = ?auto_11538 ?auto_11540 ) ) ( not ( = ?auto_11538 ?auto_11565 ) ) ( not ( = ?auto_11540 ?auto_11566 ) ) ( not ( = ?auto_11550 ?auto_11555 ) ) ( not ( = ?auto_11551 ?auto_11561 ) ) ( not ( = ?auto_11565 ?auto_11566 ) ) ( not ( = ?auto_11538 ?auto_11541 ) ) ( not ( = ?auto_11538 ?auto_11562 ) ) ( not ( = ?auto_11539 ?auto_11541 ) ) ( not ( = ?auto_11539 ?auto_11562 ) ) ( not ( = ?auto_11541 ?auto_11565 ) ) ( not ( = ?auto_11541 ?auto_11566 ) ) ( not ( = ?auto_11571 ?auto_11550 ) ) ( not ( = ?auto_11571 ?auto_11555 ) ) ( not ( = ?auto_11570 ?auto_11551 ) ) ( not ( = ?auto_11570 ?auto_11561 ) ) ( not ( = ?auto_11562 ?auto_11565 ) ) ( not ( = ?auto_11562 ?auto_11566 ) ) ( not ( = ?auto_11538 ?auto_11542 ) ) ( not ( = ?auto_11538 ?auto_11573 ) ) ( not ( = ?auto_11539 ?auto_11542 ) ) ( not ( = ?auto_11539 ?auto_11573 ) ) ( not ( = ?auto_11540 ?auto_11542 ) ) ( not ( = ?auto_11540 ?auto_11573 ) ) ( not ( = ?auto_11542 ?auto_11562 ) ) ( not ( = ?auto_11542 ?auto_11565 ) ) ( not ( = ?auto_11542 ?auto_11566 ) ) ( not ( = ?auto_11559 ?auto_11571 ) ) ( not ( = ?auto_11559 ?auto_11550 ) ) ( not ( = ?auto_11559 ?auto_11555 ) ) ( not ( = ?auto_11556 ?auto_11570 ) ) ( not ( = ?auto_11556 ?auto_11551 ) ) ( not ( = ?auto_11556 ?auto_11561 ) ) ( not ( = ?auto_11573 ?auto_11562 ) ) ( not ( = ?auto_11573 ?auto_11565 ) ) ( not ( = ?auto_11573 ?auto_11566 ) ) ( not ( = ?auto_11538 ?auto_11545 ) ) ( not ( = ?auto_11538 ?auto_11560 ) ) ( not ( = ?auto_11539 ?auto_11545 ) ) ( not ( = ?auto_11539 ?auto_11560 ) ) ( not ( = ?auto_11540 ?auto_11545 ) ) ( not ( = ?auto_11540 ?auto_11560 ) ) ( not ( = ?auto_11541 ?auto_11545 ) ) ( not ( = ?auto_11541 ?auto_11560 ) ) ( not ( = ?auto_11545 ?auto_11573 ) ) ( not ( = ?auto_11545 ?auto_11562 ) ) ( not ( = ?auto_11545 ?auto_11565 ) ) ( not ( = ?auto_11545 ?auto_11566 ) ) ( not ( = ?auto_11564 ?auto_11559 ) ) ( not ( = ?auto_11564 ?auto_11571 ) ) ( not ( = ?auto_11564 ?auto_11550 ) ) ( not ( = ?auto_11564 ?auto_11555 ) ) ( not ( = ?auto_11572 ?auto_11556 ) ) ( not ( = ?auto_11572 ?auto_11570 ) ) ( not ( = ?auto_11572 ?auto_11551 ) ) ( not ( = ?auto_11572 ?auto_11561 ) ) ( not ( = ?auto_11560 ?auto_11573 ) ) ( not ( = ?auto_11560 ?auto_11562 ) ) ( not ( = ?auto_11560 ?auto_11565 ) ) ( not ( = ?auto_11560 ?auto_11566 ) ) ( not ( = ?auto_11538 ?auto_11543 ) ) ( not ( = ?auto_11538 ?auto_11568 ) ) ( not ( = ?auto_11539 ?auto_11543 ) ) ( not ( = ?auto_11539 ?auto_11568 ) ) ( not ( = ?auto_11540 ?auto_11543 ) ) ( not ( = ?auto_11540 ?auto_11568 ) ) ( not ( = ?auto_11541 ?auto_11543 ) ) ( not ( = ?auto_11541 ?auto_11568 ) ) ( not ( = ?auto_11542 ?auto_11543 ) ) ( not ( = ?auto_11542 ?auto_11568 ) ) ( not ( = ?auto_11543 ?auto_11560 ) ) ( not ( = ?auto_11543 ?auto_11573 ) ) ( not ( = ?auto_11543 ?auto_11562 ) ) ( not ( = ?auto_11543 ?auto_11565 ) ) ( not ( = ?auto_11543 ?auto_11566 ) ) ( not ( = ?auto_11558 ?auto_11564 ) ) ( not ( = ?auto_11558 ?auto_11559 ) ) ( not ( = ?auto_11558 ?auto_11571 ) ) ( not ( = ?auto_11558 ?auto_11550 ) ) ( not ( = ?auto_11558 ?auto_11555 ) ) ( not ( = ?auto_11569 ?auto_11572 ) ) ( not ( = ?auto_11569 ?auto_11556 ) ) ( not ( = ?auto_11569 ?auto_11570 ) ) ( not ( = ?auto_11569 ?auto_11551 ) ) ( not ( = ?auto_11569 ?auto_11561 ) ) ( not ( = ?auto_11568 ?auto_11560 ) ) ( not ( = ?auto_11568 ?auto_11573 ) ) ( not ( = ?auto_11568 ?auto_11562 ) ) ( not ( = ?auto_11568 ?auto_11565 ) ) ( not ( = ?auto_11568 ?auto_11566 ) ) ( not ( = ?auto_11538 ?auto_11547 ) ) ( not ( = ?auto_11538 ?auto_11557 ) ) ( not ( = ?auto_11539 ?auto_11547 ) ) ( not ( = ?auto_11539 ?auto_11557 ) ) ( not ( = ?auto_11540 ?auto_11547 ) ) ( not ( = ?auto_11540 ?auto_11557 ) ) ( not ( = ?auto_11541 ?auto_11547 ) ) ( not ( = ?auto_11541 ?auto_11557 ) ) ( not ( = ?auto_11542 ?auto_11547 ) ) ( not ( = ?auto_11542 ?auto_11557 ) ) ( not ( = ?auto_11545 ?auto_11547 ) ) ( not ( = ?auto_11545 ?auto_11557 ) ) ( not ( = ?auto_11547 ?auto_11568 ) ) ( not ( = ?auto_11547 ?auto_11560 ) ) ( not ( = ?auto_11547 ?auto_11573 ) ) ( not ( = ?auto_11547 ?auto_11562 ) ) ( not ( = ?auto_11547 ?auto_11565 ) ) ( not ( = ?auto_11547 ?auto_11566 ) ) ( not ( = ?auto_11563 ?auto_11558 ) ) ( not ( = ?auto_11563 ?auto_11564 ) ) ( not ( = ?auto_11563 ?auto_11559 ) ) ( not ( = ?auto_11563 ?auto_11571 ) ) ( not ( = ?auto_11563 ?auto_11550 ) ) ( not ( = ?auto_11563 ?auto_11555 ) ) ( not ( = ?auto_11554 ?auto_11569 ) ) ( not ( = ?auto_11554 ?auto_11572 ) ) ( not ( = ?auto_11554 ?auto_11556 ) ) ( not ( = ?auto_11554 ?auto_11570 ) ) ( not ( = ?auto_11554 ?auto_11551 ) ) ( not ( = ?auto_11554 ?auto_11561 ) ) ( not ( = ?auto_11557 ?auto_11568 ) ) ( not ( = ?auto_11557 ?auto_11560 ) ) ( not ( = ?auto_11557 ?auto_11573 ) ) ( not ( = ?auto_11557 ?auto_11562 ) ) ( not ( = ?auto_11557 ?auto_11565 ) ) ( not ( = ?auto_11557 ?auto_11566 ) ) ( not ( = ?auto_11538 ?auto_11546 ) ) ( not ( = ?auto_11538 ?auto_11567 ) ) ( not ( = ?auto_11539 ?auto_11546 ) ) ( not ( = ?auto_11539 ?auto_11567 ) ) ( not ( = ?auto_11540 ?auto_11546 ) ) ( not ( = ?auto_11540 ?auto_11567 ) ) ( not ( = ?auto_11541 ?auto_11546 ) ) ( not ( = ?auto_11541 ?auto_11567 ) ) ( not ( = ?auto_11542 ?auto_11546 ) ) ( not ( = ?auto_11542 ?auto_11567 ) ) ( not ( = ?auto_11545 ?auto_11546 ) ) ( not ( = ?auto_11545 ?auto_11567 ) ) ( not ( = ?auto_11543 ?auto_11546 ) ) ( not ( = ?auto_11543 ?auto_11567 ) ) ( not ( = ?auto_11546 ?auto_11557 ) ) ( not ( = ?auto_11546 ?auto_11568 ) ) ( not ( = ?auto_11546 ?auto_11560 ) ) ( not ( = ?auto_11546 ?auto_11573 ) ) ( not ( = ?auto_11546 ?auto_11562 ) ) ( not ( = ?auto_11546 ?auto_11565 ) ) ( not ( = ?auto_11546 ?auto_11566 ) ) ( not ( = ?auto_11567 ?auto_11557 ) ) ( not ( = ?auto_11567 ?auto_11568 ) ) ( not ( = ?auto_11567 ?auto_11560 ) ) ( not ( = ?auto_11567 ?auto_11573 ) ) ( not ( = ?auto_11567 ?auto_11562 ) ) ( not ( = ?auto_11567 ?auto_11565 ) ) ( not ( = ?auto_11567 ?auto_11566 ) ) ( not ( = ?auto_11538 ?auto_11544 ) ) ( not ( = ?auto_11538 ?auto_11553 ) ) ( not ( = ?auto_11539 ?auto_11544 ) ) ( not ( = ?auto_11539 ?auto_11553 ) ) ( not ( = ?auto_11540 ?auto_11544 ) ) ( not ( = ?auto_11540 ?auto_11553 ) ) ( not ( = ?auto_11541 ?auto_11544 ) ) ( not ( = ?auto_11541 ?auto_11553 ) ) ( not ( = ?auto_11542 ?auto_11544 ) ) ( not ( = ?auto_11542 ?auto_11553 ) ) ( not ( = ?auto_11545 ?auto_11544 ) ) ( not ( = ?auto_11545 ?auto_11553 ) ) ( not ( = ?auto_11543 ?auto_11544 ) ) ( not ( = ?auto_11543 ?auto_11553 ) ) ( not ( = ?auto_11547 ?auto_11544 ) ) ( not ( = ?auto_11547 ?auto_11553 ) ) ( not ( = ?auto_11544 ?auto_11567 ) ) ( not ( = ?auto_11544 ?auto_11557 ) ) ( not ( = ?auto_11544 ?auto_11568 ) ) ( not ( = ?auto_11544 ?auto_11560 ) ) ( not ( = ?auto_11544 ?auto_11573 ) ) ( not ( = ?auto_11544 ?auto_11562 ) ) ( not ( = ?auto_11544 ?auto_11565 ) ) ( not ( = ?auto_11544 ?auto_11566 ) ) ( not ( = ?auto_11553 ?auto_11567 ) ) ( not ( = ?auto_11553 ?auto_11557 ) ) ( not ( = ?auto_11553 ?auto_11568 ) ) ( not ( = ?auto_11553 ?auto_11560 ) ) ( not ( = ?auto_11553 ?auto_11573 ) ) ( not ( = ?auto_11553 ?auto_11562 ) ) ( not ( = ?auto_11553 ?auto_11565 ) ) ( not ( = ?auto_11553 ?auto_11566 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_11538 ?auto_11539 ?auto_11540 ?auto_11541 ?auto_11542 ?auto_11545 ?auto_11543 ?auto_11547 ?auto_11546 )
      ( MAKE-1CRATE ?auto_11546 ?auto_11544 )
      ( MAKE-9CRATE-VERIFY ?auto_11538 ?auto_11539 ?auto_11540 ?auto_11541 ?auto_11542 ?auto_11545 ?auto_11543 ?auto_11547 ?auto_11546 ?auto_11544 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11576 - SURFACE
      ?auto_11577 - SURFACE
    )
    :vars
    (
      ?auto_11578 - HOIST
      ?auto_11579 - PLACE
      ?auto_11581 - PLACE
      ?auto_11582 - HOIST
      ?auto_11583 - SURFACE
      ?auto_11580 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11578 ?auto_11579 ) ( SURFACE-AT ?auto_11576 ?auto_11579 ) ( CLEAR ?auto_11576 ) ( IS-CRATE ?auto_11577 ) ( AVAILABLE ?auto_11578 ) ( not ( = ?auto_11581 ?auto_11579 ) ) ( HOIST-AT ?auto_11582 ?auto_11581 ) ( AVAILABLE ?auto_11582 ) ( SURFACE-AT ?auto_11577 ?auto_11581 ) ( ON ?auto_11577 ?auto_11583 ) ( CLEAR ?auto_11577 ) ( TRUCK-AT ?auto_11580 ?auto_11579 ) ( not ( = ?auto_11576 ?auto_11577 ) ) ( not ( = ?auto_11576 ?auto_11583 ) ) ( not ( = ?auto_11577 ?auto_11583 ) ) ( not ( = ?auto_11578 ?auto_11582 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_11580 ?auto_11579 ?auto_11581 )
      ( !LIFT ?auto_11582 ?auto_11577 ?auto_11583 ?auto_11581 )
      ( !LOAD ?auto_11582 ?auto_11577 ?auto_11580 ?auto_11581 )
      ( !DRIVE ?auto_11580 ?auto_11581 ?auto_11579 )
      ( !UNLOAD ?auto_11578 ?auto_11577 ?auto_11580 ?auto_11579 )
      ( !DROP ?auto_11578 ?auto_11577 ?auto_11576 ?auto_11579 )
      ( MAKE-1CRATE-VERIFY ?auto_11576 ?auto_11577 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_11595 - SURFACE
      ?auto_11596 - SURFACE
      ?auto_11597 - SURFACE
      ?auto_11598 - SURFACE
      ?auto_11599 - SURFACE
      ?auto_11602 - SURFACE
      ?auto_11600 - SURFACE
      ?auto_11604 - SURFACE
      ?auto_11603 - SURFACE
      ?auto_11601 - SURFACE
      ?auto_11605 - SURFACE
    )
    :vars
    (
      ?auto_11611 - HOIST
      ?auto_11609 - PLACE
      ?auto_11608 - PLACE
      ?auto_11607 - HOIST
      ?auto_11606 - SURFACE
      ?auto_11620 - PLACE
      ?auto_11622 - HOIST
      ?auto_11623 - SURFACE
      ?auto_11630 - SURFACE
      ?auto_11629 - PLACE
      ?auto_11613 - HOIST
      ?auto_11619 - SURFACE
      ?auto_11624 - PLACE
      ?auto_11632 - HOIST
      ?auto_11621 - SURFACE
      ?auto_11617 - PLACE
      ?auto_11626 - HOIST
      ?auto_11627 - SURFACE
      ?auto_11625 - PLACE
      ?auto_11616 - HOIST
      ?auto_11614 - SURFACE
      ?auto_11618 - PLACE
      ?auto_11615 - HOIST
      ?auto_11628 - SURFACE
      ?auto_11631 - SURFACE
      ?auto_11612 - SURFACE
      ?auto_11610 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11611 ?auto_11609 ) ( IS-CRATE ?auto_11605 ) ( not ( = ?auto_11608 ?auto_11609 ) ) ( HOIST-AT ?auto_11607 ?auto_11608 ) ( SURFACE-AT ?auto_11605 ?auto_11608 ) ( ON ?auto_11605 ?auto_11606 ) ( CLEAR ?auto_11605 ) ( not ( = ?auto_11601 ?auto_11605 ) ) ( not ( = ?auto_11601 ?auto_11606 ) ) ( not ( = ?auto_11605 ?auto_11606 ) ) ( not ( = ?auto_11611 ?auto_11607 ) ) ( IS-CRATE ?auto_11601 ) ( not ( = ?auto_11620 ?auto_11609 ) ) ( HOIST-AT ?auto_11622 ?auto_11620 ) ( SURFACE-AT ?auto_11601 ?auto_11620 ) ( ON ?auto_11601 ?auto_11623 ) ( CLEAR ?auto_11601 ) ( not ( = ?auto_11603 ?auto_11601 ) ) ( not ( = ?auto_11603 ?auto_11623 ) ) ( not ( = ?auto_11601 ?auto_11623 ) ) ( not ( = ?auto_11611 ?auto_11622 ) ) ( IS-CRATE ?auto_11603 ) ( SURFACE-AT ?auto_11603 ?auto_11620 ) ( ON ?auto_11603 ?auto_11630 ) ( CLEAR ?auto_11603 ) ( not ( = ?auto_11604 ?auto_11603 ) ) ( not ( = ?auto_11604 ?auto_11630 ) ) ( not ( = ?auto_11603 ?auto_11630 ) ) ( IS-CRATE ?auto_11604 ) ( not ( = ?auto_11629 ?auto_11609 ) ) ( HOIST-AT ?auto_11613 ?auto_11629 ) ( AVAILABLE ?auto_11613 ) ( SURFACE-AT ?auto_11604 ?auto_11629 ) ( ON ?auto_11604 ?auto_11619 ) ( CLEAR ?auto_11604 ) ( not ( = ?auto_11600 ?auto_11604 ) ) ( not ( = ?auto_11600 ?auto_11619 ) ) ( not ( = ?auto_11604 ?auto_11619 ) ) ( not ( = ?auto_11611 ?auto_11613 ) ) ( IS-CRATE ?auto_11600 ) ( not ( = ?auto_11624 ?auto_11609 ) ) ( HOIST-AT ?auto_11632 ?auto_11624 ) ( AVAILABLE ?auto_11632 ) ( SURFACE-AT ?auto_11600 ?auto_11624 ) ( ON ?auto_11600 ?auto_11621 ) ( CLEAR ?auto_11600 ) ( not ( = ?auto_11602 ?auto_11600 ) ) ( not ( = ?auto_11602 ?auto_11621 ) ) ( not ( = ?auto_11600 ?auto_11621 ) ) ( not ( = ?auto_11611 ?auto_11632 ) ) ( IS-CRATE ?auto_11602 ) ( not ( = ?auto_11617 ?auto_11609 ) ) ( HOIST-AT ?auto_11626 ?auto_11617 ) ( AVAILABLE ?auto_11626 ) ( SURFACE-AT ?auto_11602 ?auto_11617 ) ( ON ?auto_11602 ?auto_11627 ) ( CLEAR ?auto_11602 ) ( not ( = ?auto_11599 ?auto_11602 ) ) ( not ( = ?auto_11599 ?auto_11627 ) ) ( not ( = ?auto_11602 ?auto_11627 ) ) ( not ( = ?auto_11611 ?auto_11626 ) ) ( IS-CRATE ?auto_11599 ) ( not ( = ?auto_11625 ?auto_11609 ) ) ( HOIST-AT ?auto_11616 ?auto_11625 ) ( AVAILABLE ?auto_11616 ) ( SURFACE-AT ?auto_11599 ?auto_11625 ) ( ON ?auto_11599 ?auto_11614 ) ( CLEAR ?auto_11599 ) ( not ( = ?auto_11598 ?auto_11599 ) ) ( not ( = ?auto_11598 ?auto_11614 ) ) ( not ( = ?auto_11599 ?auto_11614 ) ) ( not ( = ?auto_11611 ?auto_11616 ) ) ( IS-CRATE ?auto_11598 ) ( not ( = ?auto_11618 ?auto_11609 ) ) ( HOIST-AT ?auto_11615 ?auto_11618 ) ( AVAILABLE ?auto_11615 ) ( SURFACE-AT ?auto_11598 ?auto_11618 ) ( ON ?auto_11598 ?auto_11628 ) ( CLEAR ?auto_11598 ) ( not ( = ?auto_11597 ?auto_11598 ) ) ( not ( = ?auto_11597 ?auto_11628 ) ) ( not ( = ?auto_11598 ?auto_11628 ) ) ( not ( = ?auto_11611 ?auto_11615 ) ) ( IS-CRATE ?auto_11597 ) ( AVAILABLE ?auto_11622 ) ( SURFACE-AT ?auto_11597 ?auto_11620 ) ( ON ?auto_11597 ?auto_11631 ) ( CLEAR ?auto_11597 ) ( not ( = ?auto_11596 ?auto_11597 ) ) ( not ( = ?auto_11596 ?auto_11631 ) ) ( not ( = ?auto_11597 ?auto_11631 ) ) ( SURFACE-AT ?auto_11595 ?auto_11609 ) ( CLEAR ?auto_11595 ) ( IS-CRATE ?auto_11596 ) ( AVAILABLE ?auto_11611 ) ( AVAILABLE ?auto_11607 ) ( SURFACE-AT ?auto_11596 ?auto_11608 ) ( ON ?auto_11596 ?auto_11612 ) ( CLEAR ?auto_11596 ) ( TRUCK-AT ?auto_11610 ?auto_11609 ) ( not ( = ?auto_11595 ?auto_11596 ) ) ( not ( = ?auto_11595 ?auto_11612 ) ) ( not ( = ?auto_11596 ?auto_11612 ) ) ( not ( = ?auto_11595 ?auto_11597 ) ) ( not ( = ?auto_11595 ?auto_11631 ) ) ( not ( = ?auto_11597 ?auto_11612 ) ) ( not ( = ?auto_11620 ?auto_11608 ) ) ( not ( = ?auto_11622 ?auto_11607 ) ) ( not ( = ?auto_11631 ?auto_11612 ) ) ( not ( = ?auto_11595 ?auto_11598 ) ) ( not ( = ?auto_11595 ?auto_11628 ) ) ( not ( = ?auto_11596 ?auto_11598 ) ) ( not ( = ?auto_11596 ?auto_11628 ) ) ( not ( = ?auto_11598 ?auto_11631 ) ) ( not ( = ?auto_11598 ?auto_11612 ) ) ( not ( = ?auto_11618 ?auto_11620 ) ) ( not ( = ?auto_11618 ?auto_11608 ) ) ( not ( = ?auto_11615 ?auto_11622 ) ) ( not ( = ?auto_11615 ?auto_11607 ) ) ( not ( = ?auto_11628 ?auto_11631 ) ) ( not ( = ?auto_11628 ?auto_11612 ) ) ( not ( = ?auto_11595 ?auto_11599 ) ) ( not ( = ?auto_11595 ?auto_11614 ) ) ( not ( = ?auto_11596 ?auto_11599 ) ) ( not ( = ?auto_11596 ?auto_11614 ) ) ( not ( = ?auto_11597 ?auto_11599 ) ) ( not ( = ?auto_11597 ?auto_11614 ) ) ( not ( = ?auto_11599 ?auto_11628 ) ) ( not ( = ?auto_11599 ?auto_11631 ) ) ( not ( = ?auto_11599 ?auto_11612 ) ) ( not ( = ?auto_11625 ?auto_11618 ) ) ( not ( = ?auto_11625 ?auto_11620 ) ) ( not ( = ?auto_11625 ?auto_11608 ) ) ( not ( = ?auto_11616 ?auto_11615 ) ) ( not ( = ?auto_11616 ?auto_11622 ) ) ( not ( = ?auto_11616 ?auto_11607 ) ) ( not ( = ?auto_11614 ?auto_11628 ) ) ( not ( = ?auto_11614 ?auto_11631 ) ) ( not ( = ?auto_11614 ?auto_11612 ) ) ( not ( = ?auto_11595 ?auto_11602 ) ) ( not ( = ?auto_11595 ?auto_11627 ) ) ( not ( = ?auto_11596 ?auto_11602 ) ) ( not ( = ?auto_11596 ?auto_11627 ) ) ( not ( = ?auto_11597 ?auto_11602 ) ) ( not ( = ?auto_11597 ?auto_11627 ) ) ( not ( = ?auto_11598 ?auto_11602 ) ) ( not ( = ?auto_11598 ?auto_11627 ) ) ( not ( = ?auto_11602 ?auto_11614 ) ) ( not ( = ?auto_11602 ?auto_11628 ) ) ( not ( = ?auto_11602 ?auto_11631 ) ) ( not ( = ?auto_11602 ?auto_11612 ) ) ( not ( = ?auto_11617 ?auto_11625 ) ) ( not ( = ?auto_11617 ?auto_11618 ) ) ( not ( = ?auto_11617 ?auto_11620 ) ) ( not ( = ?auto_11617 ?auto_11608 ) ) ( not ( = ?auto_11626 ?auto_11616 ) ) ( not ( = ?auto_11626 ?auto_11615 ) ) ( not ( = ?auto_11626 ?auto_11622 ) ) ( not ( = ?auto_11626 ?auto_11607 ) ) ( not ( = ?auto_11627 ?auto_11614 ) ) ( not ( = ?auto_11627 ?auto_11628 ) ) ( not ( = ?auto_11627 ?auto_11631 ) ) ( not ( = ?auto_11627 ?auto_11612 ) ) ( not ( = ?auto_11595 ?auto_11600 ) ) ( not ( = ?auto_11595 ?auto_11621 ) ) ( not ( = ?auto_11596 ?auto_11600 ) ) ( not ( = ?auto_11596 ?auto_11621 ) ) ( not ( = ?auto_11597 ?auto_11600 ) ) ( not ( = ?auto_11597 ?auto_11621 ) ) ( not ( = ?auto_11598 ?auto_11600 ) ) ( not ( = ?auto_11598 ?auto_11621 ) ) ( not ( = ?auto_11599 ?auto_11600 ) ) ( not ( = ?auto_11599 ?auto_11621 ) ) ( not ( = ?auto_11600 ?auto_11627 ) ) ( not ( = ?auto_11600 ?auto_11614 ) ) ( not ( = ?auto_11600 ?auto_11628 ) ) ( not ( = ?auto_11600 ?auto_11631 ) ) ( not ( = ?auto_11600 ?auto_11612 ) ) ( not ( = ?auto_11624 ?auto_11617 ) ) ( not ( = ?auto_11624 ?auto_11625 ) ) ( not ( = ?auto_11624 ?auto_11618 ) ) ( not ( = ?auto_11624 ?auto_11620 ) ) ( not ( = ?auto_11624 ?auto_11608 ) ) ( not ( = ?auto_11632 ?auto_11626 ) ) ( not ( = ?auto_11632 ?auto_11616 ) ) ( not ( = ?auto_11632 ?auto_11615 ) ) ( not ( = ?auto_11632 ?auto_11622 ) ) ( not ( = ?auto_11632 ?auto_11607 ) ) ( not ( = ?auto_11621 ?auto_11627 ) ) ( not ( = ?auto_11621 ?auto_11614 ) ) ( not ( = ?auto_11621 ?auto_11628 ) ) ( not ( = ?auto_11621 ?auto_11631 ) ) ( not ( = ?auto_11621 ?auto_11612 ) ) ( not ( = ?auto_11595 ?auto_11604 ) ) ( not ( = ?auto_11595 ?auto_11619 ) ) ( not ( = ?auto_11596 ?auto_11604 ) ) ( not ( = ?auto_11596 ?auto_11619 ) ) ( not ( = ?auto_11597 ?auto_11604 ) ) ( not ( = ?auto_11597 ?auto_11619 ) ) ( not ( = ?auto_11598 ?auto_11604 ) ) ( not ( = ?auto_11598 ?auto_11619 ) ) ( not ( = ?auto_11599 ?auto_11604 ) ) ( not ( = ?auto_11599 ?auto_11619 ) ) ( not ( = ?auto_11602 ?auto_11604 ) ) ( not ( = ?auto_11602 ?auto_11619 ) ) ( not ( = ?auto_11604 ?auto_11621 ) ) ( not ( = ?auto_11604 ?auto_11627 ) ) ( not ( = ?auto_11604 ?auto_11614 ) ) ( not ( = ?auto_11604 ?auto_11628 ) ) ( not ( = ?auto_11604 ?auto_11631 ) ) ( not ( = ?auto_11604 ?auto_11612 ) ) ( not ( = ?auto_11629 ?auto_11624 ) ) ( not ( = ?auto_11629 ?auto_11617 ) ) ( not ( = ?auto_11629 ?auto_11625 ) ) ( not ( = ?auto_11629 ?auto_11618 ) ) ( not ( = ?auto_11629 ?auto_11620 ) ) ( not ( = ?auto_11629 ?auto_11608 ) ) ( not ( = ?auto_11613 ?auto_11632 ) ) ( not ( = ?auto_11613 ?auto_11626 ) ) ( not ( = ?auto_11613 ?auto_11616 ) ) ( not ( = ?auto_11613 ?auto_11615 ) ) ( not ( = ?auto_11613 ?auto_11622 ) ) ( not ( = ?auto_11613 ?auto_11607 ) ) ( not ( = ?auto_11619 ?auto_11621 ) ) ( not ( = ?auto_11619 ?auto_11627 ) ) ( not ( = ?auto_11619 ?auto_11614 ) ) ( not ( = ?auto_11619 ?auto_11628 ) ) ( not ( = ?auto_11619 ?auto_11631 ) ) ( not ( = ?auto_11619 ?auto_11612 ) ) ( not ( = ?auto_11595 ?auto_11603 ) ) ( not ( = ?auto_11595 ?auto_11630 ) ) ( not ( = ?auto_11596 ?auto_11603 ) ) ( not ( = ?auto_11596 ?auto_11630 ) ) ( not ( = ?auto_11597 ?auto_11603 ) ) ( not ( = ?auto_11597 ?auto_11630 ) ) ( not ( = ?auto_11598 ?auto_11603 ) ) ( not ( = ?auto_11598 ?auto_11630 ) ) ( not ( = ?auto_11599 ?auto_11603 ) ) ( not ( = ?auto_11599 ?auto_11630 ) ) ( not ( = ?auto_11602 ?auto_11603 ) ) ( not ( = ?auto_11602 ?auto_11630 ) ) ( not ( = ?auto_11600 ?auto_11603 ) ) ( not ( = ?auto_11600 ?auto_11630 ) ) ( not ( = ?auto_11603 ?auto_11619 ) ) ( not ( = ?auto_11603 ?auto_11621 ) ) ( not ( = ?auto_11603 ?auto_11627 ) ) ( not ( = ?auto_11603 ?auto_11614 ) ) ( not ( = ?auto_11603 ?auto_11628 ) ) ( not ( = ?auto_11603 ?auto_11631 ) ) ( not ( = ?auto_11603 ?auto_11612 ) ) ( not ( = ?auto_11630 ?auto_11619 ) ) ( not ( = ?auto_11630 ?auto_11621 ) ) ( not ( = ?auto_11630 ?auto_11627 ) ) ( not ( = ?auto_11630 ?auto_11614 ) ) ( not ( = ?auto_11630 ?auto_11628 ) ) ( not ( = ?auto_11630 ?auto_11631 ) ) ( not ( = ?auto_11630 ?auto_11612 ) ) ( not ( = ?auto_11595 ?auto_11601 ) ) ( not ( = ?auto_11595 ?auto_11623 ) ) ( not ( = ?auto_11596 ?auto_11601 ) ) ( not ( = ?auto_11596 ?auto_11623 ) ) ( not ( = ?auto_11597 ?auto_11601 ) ) ( not ( = ?auto_11597 ?auto_11623 ) ) ( not ( = ?auto_11598 ?auto_11601 ) ) ( not ( = ?auto_11598 ?auto_11623 ) ) ( not ( = ?auto_11599 ?auto_11601 ) ) ( not ( = ?auto_11599 ?auto_11623 ) ) ( not ( = ?auto_11602 ?auto_11601 ) ) ( not ( = ?auto_11602 ?auto_11623 ) ) ( not ( = ?auto_11600 ?auto_11601 ) ) ( not ( = ?auto_11600 ?auto_11623 ) ) ( not ( = ?auto_11604 ?auto_11601 ) ) ( not ( = ?auto_11604 ?auto_11623 ) ) ( not ( = ?auto_11601 ?auto_11630 ) ) ( not ( = ?auto_11601 ?auto_11619 ) ) ( not ( = ?auto_11601 ?auto_11621 ) ) ( not ( = ?auto_11601 ?auto_11627 ) ) ( not ( = ?auto_11601 ?auto_11614 ) ) ( not ( = ?auto_11601 ?auto_11628 ) ) ( not ( = ?auto_11601 ?auto_11631 ) ) ( not ( = ?auto_11601 ?auto_11612 ) ) ( not ( = ?auto_11623 ?auto_11630 ) ) ( not ( = ?auto_11623 ?auto_11619 ) ) ( not ( = ?auto_11623 ?auto_11621 ) ) ( not ( = ?auto_11623 ?auto_11627 ) ) ( not ( = ?auto_11623 ?auto_11614 ) ) ( not ( = ?auto_11623 ?auto_11628 ) ) ( not ( = ?auto_11623 ?auto_11631 ) ) ( not ( = ?auto_11623 ?auto_11612 ) ) ( not ( = ?auto_11595 ?auto_11605 ) ) ( not ( = ?auto_11595 ?auto_11606 ) ) ( not ( = ?auto_11596 ?auto_11605 ) ) ( not ( = ?auto_11596 ?auto_11606 ) ) ( not ( = ?auto_11597 ?auto_11605 ) ) ( not ( = ?auto_11597 ?auto_11606 ) ) ( not ( = ?auto_11598 ?auto_11605 ) ) ( not ( = ?auto_11598 ?auto_11606 ) ) ( not ( = ?auto_11599 ?auto_11605 ) ) ( not ( = ?auto_11599 ?auto_11606 ) ) ( not ( = ?auto_11602 ?auto_11605 ) ) ( not ( = ?auto_11602 ?auto_11606 ) ) ( not ( = ?auto_11600 ?auto_11605 ) ) ( not ( = ?auto_11600 ?auto_11606 ) ) ( not ( = ?auto_11604 ?auto_11605 ) ) ( not ( = ?auto_11604 ?auto_11606 ) ) ( not ( = ?auto_11603 ?auto_11605 ) ) ( not ( = ?auto_11603 ?auto_11606 ) ) ( not ( = ?auto_11605 ?auto_11623 ) ) ( not ( = ?auto_11605 ?auto_11630 ) ) ( not ( = ?auto_11605 ?auto_11619 ) ) ( not ( = ?auto_11605 ?auto_11621 ) ) ( not ( = ?auto_11605 ?auto_11627 ) ) ( not ( = ?auto_11605 ?auto_11614 ) ) ( not ( = ?auto_11605 ?auto_11628 ) ) ( not ( = ?auto_11605 ?auto_11631 ) ) ( not ( = ?auto_11605 ?auto_11612 ) ) ( not ( = ?auto_11606 ?auto_11623 ) ) ( not ( = ?auto_11606 ?auto_11630 ) ) ( not ( = ?auto_11606 ?auto_11619 ) ) ( not ( = ?auto_11606 ?auto_11621 ) ) ( not ( = ?auto_11606 ?auto_11627 ) ) ( not ( = ?auto_11606 ?auto_11614 ) ) ( not ( = ?auto_11606 ?auto_11628 ) ) ( not ( = ?auto_11606 ?auto_11631 ) ) ( not ( = ?auto_11606 ?auto_11612 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_11595 ?auto_11596 ?auto_11597 ?auto_11598 ?auto_11599 ?auto_11602 ?auto_11600 ?auto_11604 ?auto_11603 ?auto_11601 )
      ( MAKE-1CRATE ?auto_11601 ?auto_11605 )
      ( MAKE-10CRATE-VERIFY ?auto_11595 ?auto_11596 ?auto_11597 ?auto_11598 ?auto_11599 ?auto_11602 ?auto_11600 ?auto_11604 ?auto_11603 ?auto_11601 ?auto_11605 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11635 - SURFACE
      ?auto_11636 - SURFACE
    )
    :vars
    (
      ?auto_11637 - HOIST
      ?auto_11638 - PLACE
      ?auto_11640 - PLACE
      ?auto_11641 - HOIST
      ?auto_11642 - SURFACE
      ?auto_11639 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11637 ?auto_11638 ) ( SURFACE-AT ?auto_11635 ?auto_11638 ) ( CLEAR ?auto_11635 ) ( IS-CRATE ?auto_11636 ) ( AVAILABLE ?auto_11637 ) ( not ( = ?auto_11640 ?auto_11638 ) ) ( HOIST-AT ?auto_11641 ?auto_11640 ) ( AVAILABLE ?auto_11641 ) ( SURFACE-AT ?auto_11636 ?auto_11640 ) ( ON ?auto_11636 ?auto_11642 ) ( CLEAR ?auto_11636 ) ( TRUCK-AT ?auto_11639 ?auto_11638 ) ( not ( = ?auto_11635 ?auto_11636 ) ) ( not ( = ?auto_11635 ?auto_11642 ) ) ( not ( = ?auto_11636 ?auto_11642 ) ) ( not ( = ?auto_11637 ?auto_11641 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_11639 ?auto_11638 ?auto_11640 )
      ( !LIFT ?auto_11641 ?auto_11636 ?auto_11642 ?auto_11640 )
      ( !LOAD ?auto_11641 ?auto_11636 ?auto_11639 ?auto_11640 )
      ( !DRIVE ?auto_11639 ?auto_11640 ?auto_11638 )
      ( !UNLOAD ?auto_11637 ?auto_11636 ?auto_11639 ?auto_11638 )
      ( !DROP ?auto_11637 ?auto_11636 ?auto_11635 ?auto_11638 )
      ( MAKE-1CRATE-VERIFY ?auto_11635 ?auto_11636 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_11655 - SURFACE
      ?auto_11656 - SURFACE
      ?auto_11657 - SURFACE
      ?auto_11658 - SURFACE
      ?auto_11659 - SURFACE
      ?auto_11662 - SURFACE
      ?auto_11660 - SURFACE
      ?auto_11664 - SURFACE
      ?auto_11663 - SURFACE
      ?auto_11661 - SURFACE
      ?auto_11666 - SURFACE
      ?auto_11665 - SURFACE
    )
    :vars
    (
      ?auto_11671 - HOIST
      ?auto_11667 - PLACE
      ?auto_11669 - PLACE
      ?auto_11672 - HOIST
      ?auto_11670 - SURFACE
      ?auto_11691 - PLACE
      ?auto_11674 - HOIST
      ?auto_11690 - SURFACE
      ?auto_11675 - PLACE
      ?auto_11696 - HOIST
      ?auto_11684 - SURFACE
      ?auto_11679 - SURFACE
      ?auto_11685 - PLACE
      ?auto_11680 - HOIST
      ?auto_11688 - SURFACE
      ?auto_11695 - PLACE
      ?auto_11687 - HOIST
      ?auto_11681 - SURFACE
      ?auto_11676 - PLACE
      ?auto_11673 - HOIST
      ?auto_11694 - SURFACE
      ?auto_11693 - PLACE
      ?auto_11686 - HOIST
      ?auto_11683 - SURFACE
      ?auto_11692 - PLACE
      ?auto_11678 - HOIST
      ?auto_11682 - SURFACE
      ?auto_11689 - SURFACE
      ?auto_11677 - SURFACE
      ?auto_11668 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11671 ?auto_11667 ) ( IS-CRATE ?auto_11665 ) ( not ( = ?auto_11669 ?auto_11667 ) ) ( HOIST-AT ?auto_11672 ?auto_11669 ) ( AVAILABLE ?auto_11672 ) ( SURFACE-AT ?auto_11665 ?auto_11669 ) ( ON ?auto_11665 ?auto_11670 ) ( CLEAR ?auto_11665 ) ( not ( = ?auto_11666 ?auto_11665 ) ) ( not ( = ?auto_11666 ?auto_11670 ) ) ( not ( = ?auto_11665 ?auto_11670 ) ) ( not ( = ?auto_11671 ?auto_11672 ) ) ( IS-CRATE ?auto_11666 ) ( not ( = ?auto_11691 ?auto_11667 ) ) ( HOIST-AT ?auto_11674 ?auto_11691 ) ( SURFACE-AT ?auto_11666 ?auto_11691 ) ( ON ?auto_11666 ?auto_11690 ) ( CLEAR ?auto_11666 ) ( not ( = ?auto_11661 ?auto_11666 ) ) ( not ( = ?auto_11661 ?auto_11690 ) ) ( not ( = ?auto_11666 ?auto_11690 ) ) ( not ( = ?auto_11671 ?auto_11674 ) ) ( IS-CRATE ?auto_11661 ) ( not ( = ?auto_11675 ?auto_11667 ) ) ( HOIST-AT ?auto_11696 ?auto_11675 ) ( SURFACE-AT ?auto_11661 ?auto_11675 ) ( ON ?auto_11661 ?auto_11684 ) ( CLEAR ?auto_11661 ) ( not ( = ?auto_11663 ?auto_11661 ) ) ( not ( = ?auto_11663 ?auto_11684 ) ) ( not ( = ?auto_11661 ?auto_11684 ) ) ( not ( = ?auto_11671 ?auto_11696 ) ) ( IS-CRATE ?auto_11663 ) ( SURFACE-AT ?auto_11663 ?auto_11675 ) ( ON ?auto_11663 ?auto_11679 ) ( CLEAR ?auto_11663 ) ( not ( = ?auto_11664 ?auto_11663 ) ) ( not ( = ?auto_11664 ?auto_11679 ) ) ( not ( = ?auto_11663 ?auto_11679 ) ) ( IS-CRATE ?auto_11664 ) ( not ( = ?auto_11685 ?auto_11667 ) ) ( HOIST-AT ?auto_11680 ?auto_11685 ) ( AVAILABLE ?auto_11680 ) ( SURFACE-AT ?auto_11664 ?auto_11685 ) ( ON ?auto_11664 ?auto_11688 ) ( CLEAR ?auto_11664 ) ( not ( = ?auto_11660 ?auto_11664 ) ) ( not ( = ?auto_11660 ?auto_11688 ) ) ( not ( = ?auto_11664 ?auto_11688 ) ) ( not ( = ?auto_11671 ?auto_11680 ) ) ( IS-CRATE ?auto_11660 ) ( not ( = ?auto_11695 ?auto_11667 ) ) ( HOIST-AT ?auto_11687 ?auto_11695 ) ( AVAILABLE ?auto_11687 ) ( SURFACE-AT ?auto_11660 ?auto_11695 ) ( ON ?auto_11660 ?auto_11681 ) ( CLEAR ?auto_11660 ) ( not ( = ?auto_11662 ?auto_11660 ) ) ( not ( = ?auto_11662 ?auto_11681 ) ) ( not ( = ?auto_11660 ?auto_11681 ) ) ( not ( = ?auto_11671 ?auto_11687 ) ) ( IS-CRATE ?auto_11662 ) ( not ( = ?auto_11676 ?auto_11667 ) ) ( HOIST-AT ?auto_11673 ?auto_11676 ) ( AVAILABLE ?auto_11673 ) ( SURFACE-AT ?auto_11662 ?auto_11676 ) ( ON ?auto_11662 ?auto_11694 ) ( CLEAR ?auto_11662 ) ( not ( = ?auto_11659 ?auto_11662 ) ) ( not ( = ?auto_11659 ?auto_11694 ) ) ( not ( = ?auto_11662 ?auto_11694 ) ) ( not ( = ?auto_11671 ?auto_11673 ) ) ( IS-CRATE ?auto_11659 ) ( not ( = ?auto_11693 ?auto_11667 ) ) ( HOIST-AT ?auto_11686 ?auto_11693 ) ( AVAILABLE ?auto_11686 ) ( SURFACE-AT ?auto_11659 ?auto_11693 ) ( ON ?auto_11659 ?auto_11683 ) ( CLEAR ?auto_11659 ) ( not ( = ?auto_11658 ?auto_11659 ) ) ( not ( = ?auto_11658 ?auto_11683 ) ) ( not ( = ?auto_11659 ?auto_11683 ) ) ( not ( = ?auto_11671 ?auto_11686 ) ) ( IS-CRATE ?auto_11658 ) ( not ( = ?auto_11692 ?auto_11667 ) ) ( HOIST-AT ?auto_11678 ?auto_11692 ) ( AVAILABLE ?auto_11678 ) ( SURFACE-AT ?auto_11658 ?auto_11692 ) ( ON ?auto_11658 ?auto_11682 ) ( CLEAR ?auto_11658 ) ( not ( = ?auto_11657 ?auto_11658 ) ) ( not ( = ?auto_11657 ?auto_11682 ) ) ( not ( = ?auto_11658 ?auto_11682 ) ) ( not ( = ?auto_11671 ?auto_11678 ) ) ( IS-CRATE ?auto_11657 ) ( AVAILABLE ?auto_11696 ) ( SURFACE-AT ?auto_11657 ?auto_11675 ) ( ON ?auto_11657 ?auto_11689 ) ( CLEAR ?auto_11657 ) ( not ( = ?auto_11656 ?auto_11657 ) ) ( not ( = ?auto_11656 ?auto_11689 ) ) ( not ( = ?auto_11657 ?auto_11689 ) ) ( SURFACE-AT ?auto_11655 ?auto_11667 ) ( CLEAR ?auto_11655 ) ( IS-CRATE ?auto_11656 ) ( AVAILABLE ?auto_11671 ) ( AVAILABLE ?auto_11674 ) ( SURFACE-AT ?auto_11656 ?auto_11691 ) ( ON ?auto_11656 ?auto_11677 ) ( CLEAR ?auto_11656 ) ( TRUCK-AT ?auto_11668 ?auto_11667 ) ( not ( = ?auto_11655 ?auto_11656 ) ) ( not ( = ?auto_11655 ?auto_11677 ) ) ( not ( = ?auto_11656 ?auto_11677 ) ) ( not ( = ?auto_11655 ?auto_11657 ) ) ( not ( = ?auto_11655 ?auto_11689 ) ) ( not ( = ?auto_11657 ?auto_11677 ) ) ( not ( = ?auto_11675 ?auto_11691 ) ) ( not ( = ?auto_11696 ?auto_11674 ) ) ( not ( = ?auto_11689 ?auto_11677 ) ) ( not ( = ?auto_11655 ?auto_11658 ) ) ( not ( = ?auto_11655 ?auto_11682 ) ) ( not ( = ?auto_11656 ?auto_11658 ) ) ( not ( = ?auto_11656 ?auto_11682 ) ) ( not ( = ?auto_11658 ?auto_11689 ) ) ( not ( = ?auto_11658 ?auto_11677 ) ) ( not ( = ?auto_11692 ?auto_11675 ) ) ( not ( = ?auto_11692 ?auto_11691 ) ) ( not ( = ?auto_11678 ?auto_11696 ) ) ( not ( = ?auto_11678 ?auto_11674 ) ) ( not ( = ?auto_11682 ?auto_11689 ) ) ( not ( = ?auto_11682 ?auto_11677 ) ) ( not ( = ?auto_11655 ?auto_11659 ) ) ( not ( = ?auto_11655 ?auto_11683 ) ) ( not ( = ?auto_11656 ?auto_11659 ) ) ( not ( = ?auto_11656 ?auto_11683 ) ) ( not ( = ?auto_11657 ?auto_11659 ) ) ( not ( = ?auto_11657 ?auto_11683 ) ) ( not ( = ?auto_11659 ?auto_11682 ) ) ( not ( = ?auto_11659 ?auto_11689 ) ) ( not ( = ?auto_11659 ?auto_11677 ) ) ( not ( = ?auto_11693 ?auto_11692 ) ) ( not ( = ?auto_11693 ?auto_11675 ) ) ( not ( = ?auto_11693 ?auto_11691 ) ) ( not ( = ?auto_11686 ?auto_11678 ) ) ( not ( = ?auto_11686 ?auto_11696 ) ) ( not ( = ?auto_11686 ?auto_11674 ) ) ( not ( = ?auto_11683 ?auto_11682 ) ) ( not ( = ?auto_11683 ?auto_11689 ) ) ( not ( = ?auto_11683 ?auto_11677 ) ) ( not ( = ?auto_11655 ?auto_11662 ) ) ( not ( = ?auto_11655 ?auto_11694 ) ) ( not ( = ?auto_11656 ?auto_11662 ) ) ( not ( = ?auto_11656 ?auto_11694 ) ) ( not ( = ?auto_11657 ?auto_11662 ) ) ( not ( = ?auto_11657 ?auto_11694 ) ) ( not ( = ?auto_11658 ?auto_11662 ) ) ( not ( = ?auto_11658 ?auto_11694 ) ) ( not ( = ?auto_11662 ?auto_11683 ) ) ( not ( = ?auto_11662 ?auto_11682 ) ) ( not ( = ?auto_11662 ?auto_11689 ) ) ( not ( = ?auto_11662 ?auto_11677 ) ) ( not ( = ?auto_11676 ?auto_11693 ) ) ( not ( = ?auto_11676 ?auto_11692 ) ) ( not ( = ?auto_11676 ?auto_11675 ) ) ( not ( = ?auto_11676 ?auto_11691 ) ) ( not ( = ?auto_11673 ?auto_11686 ) ) ( not ( = ?auto_11673 ?auto_11678 ) ) ( not ( = ?auto_11673 ?auto_11696 ) ) ( not ( = ?auto_11673 ?auto_11674 ) ) ( not ( = ?auto_11694 ?auto_11683 ) ) ( not ( = ?auto_11694 ?auto_11682 ) ) ( not ( = ?auto_11694 ?auto_11689 ) ) ( not ( = ?auto_11694 ?auto_11677 ) ) ( not ( = ?auto_11655 ?auto_11660 ) ) ( not ( = ?auto_11655 ?auto_11681 ) ) ( not ( = ?auto_11656 ?auto_11660 ) ) ( not ( = ?auto_11656 ?auto_11681 ) ) ( not ( = ?auto_11657 ?auto_11660 ) ) ( not ( = ?auto_11657 ?auto_11681 ) ) ( not ( = ?auto_11658 ?auto_11660 ) ) ( not ( = ?auto_11658 ?auto_11681 ) ) ( not ( = ?auto_11659 ?auto_11660 ) ) ( not ( = ?auto_11659 ?auto_11681 ) ) ( not ( = ?auto_11660 ?auto_11694 ) ) ( not ( = ?auto_11660 ?auto_11683 ) ) ( not ( = ?auto_11660 ?auto_11682 ) ) ( not ( = ?auto_11660 ?auto_11689 ) ) ( not ( = ?auto_11660 ?auto_11677 ) ) ( not ( = ?auto_11695 ?auto_11676 ) ) ( not ( = ?auto_11695 ?auto_11693 ) ) ( not ( = ?auto_11695 ?auto_11692 ) ) ( not ( = ?auto_11695 ?auto_11675 ) ) ( not ( = ?auto_11695 ?auto_11691 ) ) ( not ( = ?auto_11687 ?auto_11673 ) ) ( not ( = ?auto_11687 ?auto_11686 ) ) ( not ( = ?auto_11687 ?auto_11678 ) ) ( not ( = ?auto_11687 ?auto_11696 ) ) ( not ( = ?auto_11687 ?auto_11674 ) ) ( not ( = ?auto_11681 ?auto_11694 ) ) ( not ( = ?auto_11681 ?auto_11683 ) ) ( not ( = ?auto_11681 ?auto_11682 ) ) ( not ( = ?auto_11681 ?auto_11689 ) ) ( not ( = ?auto_11681 ?auto_11677 ) ) ( not ( = ?auto_11655 ?auto_11664 ) ) ( not ( = ?auto_11655 ?auto_11688 ) ) ( not ( = ?auto_11656 ?auto_11664 ) ) ( not ( = ?auto_11656 ?auto_11688 ) ) ( not ( = ?auto_11657 ?auto_11664 ) ) ( not ( = ?auto_11657 ?auto_11688 ) ) ( not ( = ?auto_11658 ?auto_11664 ) ) ( not ( = ?auto_11658 ?auto_11688 ) ) ( not ( = ?auto_11659 ?auto_11664 ) ) ( not ( = ?auto_11659 ?auto_11688 ) ) ( not ( = ?auto_11662 ?auto_11664 ) ) ( not ( = ?auto_11662 ?auto_11688 ) ) ( not ( = ?auto_11664 ?auto_11681 ) ) ( not ( = ?auto_11664 ?auto_11694 ) ) ( not ( = ?auto_11664 ?auto_11683 ) ) ( not ( = ?auto_11664 ?auto_11682 ) ) ( not ( = ?auto_11664 ?auto_11689 ) ) ( not ( = ?auto_11664 ?auto_11677 ) ) ( not ( = ?auto_11685 ?auto_11695 ) ) ( not ( = ?auto_11685 ?auto_11676 ) ) ( not ( = ?auto_11685 ?auto_11693 ) ) ( not ( = ?auto_11685 ?auto_11692 ) ) ( not ( = ?auto_11685 ?auto_11675 ) ) ( not ( = ?auto_11685 ?auto_11691 ) ) ( not ( = ?auto_11680 ?auto_11687 ) ) ( not ( = ?auto_11680 ?auto_11673 ) ) ( not ( = ?auto_11680 ?auto_11686 ) ) ( not ( = ?auto_11680 ?auto_11678 ) ) ( not ( = ?auto_11680 ?auto_11696 ) ) ( not ( = ?auto_11680 ?auto_11674 ) ) ( not ( = ?auto_11688 ?auto_11681 ) ) ( not ( = ?auto_11688 ?auto_11694 ) ) ( not ( = ?auto_11688 ?auto_11683 ) ) ( not ( = ?auto_11688 ?auto_11682 ) ) ( not ( = ?auto_11688 ?auto_11689 ) ) ( not ( = ?auto_11688 ?auto_11677 ) ) ( not ( = ?auto_11655 ?auto_11663 ) ) ( not ( = ?auto_11655 ?auto_11679 ) ) ( not ( = ?auto_11656 ?auto_11663 ) ) ( not ( = ?auto_11656 ?auto_11679 ) ) ( not ( = ?auto_11657 ?auto_11663 ) ) ( not ( = ?auto_11657 ?auto_11679 ) ) ( not ( = ?auto_11658 ?auto_11663 ) ) ( not ( = ?auto_11658 ?auto_11679 ) ) ( not ( = ?auto_11659 ?auto_11663 ) ) ( not ( = ?auto_11659 ?auto_11679 ) ) ( not ( = ?auto_11662 ?auto_11663 ) ) ( not ( = ?auto_11662 ?auto_11679 ) ) ( not ( = ?auto_11660 ?auto_11663 ) ) ( not ( = ?auto_11660 ?auto_11679 ) ) ( not ( = ?auto_11663 ?auto_11688 ) ) ( not ( = ?auto_11663 ?auto_11681 ) ) ( not ( = ?auto_11663 ?auto_11694 ) ) ( not ( = ?auto_11663 ?auto_11683 ) ) ( not ( = ?auto_11663 ?auto_11682 ) ) ( not ( = ?auto_11663 ?auto_11689 ) ) ( not ( = ?auto_11663 ?auto_11677 ) ) ( not ( = ?auto_11679 ?auto_11688 ) ) ( not ( = ?auto_11679 ?auto_11681 ) ) ( not ( = ?auto_11679 ?auto_11694 ) ) ( not ( = ?auto_11679 ?auto_11683 ) ) ( not ( = ?auto_11679 ?auto_11682 ) ) ( not ( = ?auto_11679 ?auto_11689 ) ) ( not ( = ?auto_11679 ?auto_11677 ) ) ( not ( = ?auto_11655 ?auto_11661 ) ) ( not ( = ?auto_11655 ?auto_11684 ) ) ( not ( = ?auto_11656 ?auto_11661 ) ) ( not ( = ?auto_11656 ?auto_11684 ) ) ( not ( = ?auto_11657 ?auto_11661 ) ) ( not ( = ?auto_11657 ?auto_11684 ) ) ( not ( = ?auto_11658 ?auto_11661 ) ) ( not ( = ?auto_11658 ?auto_11684 ) ) ( not ( = ?auto_11659 ?auto_11661 ) ) ( not ( = ?auto_11659 ?auto_11684 ) ) ( not ( = ?auto_11662 ?auto_11661 ) ) ( not ( = ?auto_11662 ?auto_11684 ) ) ( not ( = ?auto_11660 ?auto_11661 ) ) ( not ( = ?auto_11660 ?auto_11684 ) ) ( not ( = ?auto_11664 ?auto_11661 ) ) ( not ( = ?auto_11664 ?auto_11684 ) ) ( not ( = ?auto_11661 ?auto_11679 ) ) ( not ( = ?auto_11661 ?auto_11688 ) ) ( not ( = ?auto_11661 ?auto_11681 ) ) ( not ( = ?auto_11661 ?auto_11694 ) ) ( not ( = ?auto_11661 ?auto_11683 ) ) ( not ( = ?auto_11661 ?auto_11682 ) ) ( not ( = ?auto_11661 ?auto_11689 ) ) ( not ( = ?auto_11661 ?auto_11677 ) ) ( not ( = ?auto_11684 ?auto_11679 ) ) ( not ( = ?auto_11684 ?auto_11688 ) ) ( not ( = ?auto_11684 ?auto_11681 ) ) ( not ( = ?auto_11684 ?auto_11694 ) ) ( not ( = ?auto_11684 ?auto_11683 ) ) ( not ( = ?auto_11684 ?auto_11682 ) ) ( not ( = ?auto_11684 ?auto_11689 ) ) ( not ( = ?auto_11684 ?auto_11677 ) ) ( not ( = ?auto_11655 ?auto_11666 ) ) ( not ( = ?auto_11655 ?auto_11690 ) ) ( not ( = ?auto_11656 ?auto_11666 ) ) ( not ( = ?auto_11656 ?auto_11690 ) ) ( not ( = ?auto_11657 ?auto_11666 ) ) ( not ( = ?auto_11657 ?auto_11690 ) ) ( not ( = ?auto_11658 ?auto_11666 ) ) ( not ( = ?auto_11658 ?auto_11690 ) ) ( not ( = ?auto_11659 ?auto_11666 ) ) ( not ( = ?auto_11659 ?auto_11690 ) ) ( not ( = ?auto_11662 ?auto_11666 ) ) ( not ( = ?auto_11662 ?auto_11690 ) ) ( not ( = ?auto_11660 ?auto_11666 ) ) ( not ( = ?auto_11660 ?auto_11690 ) ) ( not ( = ?auto_11664 ?auto_11666 ) ) ( not ( = ?auto_11664 ?auto_11690 ) ) ( not ( = ?auto_11663 ?auto_11666 ) ) ( not ( = ?auto_11663 ?auto_11690 ) ) ( not ( = ?auto_11666 ?auto_11684 ) ) ( not ( = ?auto_11666 ?auto_11679 ) ) ( not ( = ?auto_11666 ?auto_11688 ) ) ( not ( = ?auto_11666 ?auto_11681 ) ) ( not ( = ?auto_11666 ?auto_11694 ) ) ( not ( = ?auto_11666 ?auto_11683 ) ) ( not ( = ?auto_11666 ?auto_11682 ) ) ( not ( = ?auto_11666 ?auto_11689 ) ) ( not ( = ?auto_11666 ?auto_11677 ) ) ( not ( = ?auto_11690 ?auto_11684 ) ) ( not ( = ?auto_11690 ?auto_11679 ) ) ( not ( = ?auto_11690 ?auto_11688 ) ) ( not ( = ?auto_11690 ?auto_11681 ) ) ( not ( = ?auto_11690 ?auto_11694 ) ) ( not ( = ?auto_11690 ?auto_11683 ) ) ( not ( = ?auto_11690 ?auto_11682 ) ) ( not ( = ?auto_11690 ?auto_11689 ) ) ( not ( = ?auto_11690 ?auto_11677 ) ) ( not ( = ?auto_11655 ?auto_11665 ) ) ( not ( = ?auto_11655 ?auto_11670 ) ) ( not ( = ?auto_11656 ?auto_11665 ) ) ( not ( = ?auto_11656 ?auto_11670 ) ) ( not ( = ?auto_11657 ?auto_11665 ) ) ( not ( = ?auto_11657 ?auto_11670 ) ) ( not ( = ?auto_11658 ?auto_11665 ) ) ( not ( = ?auto_11658 ?auto_11670 ) ) ( not ( = ?auto_11659 ?auto_11665 ) ) ( not ( = ?auto_11659 ?auto_11670 ) ) ( not ( = ?auto_11662 ?auto_11665 ) ) ( not ( = ?auto_11662 ?auto_11670 ) ) ( not ( = ?auto_11660 ?auto_11665 ) ) ( not ( = ?auto_11660 ?auto_11670 ) ) ( not ( = ?auto_11664 ?auto_11665 ) ) ( not ( = ?auto_11664 ?auto_11670 ) ) ( not ( = ?auto_11663 ?auto_11665 ) ) ( not ( = ?auto_11663 ?auto_11670 ) ) ( not ( = ?auto_11661 ?auto_11665 ) ) ( not ( = ?auto_11661 ?auto_11670 ) ) ( not ( = ?auto_11665 ?auto_11690 ) ) ( not ( = ?auto_11665 ?auto_11684 ) ) ( not ( = ?auto_11665 ?auto_11679 ) ) ( not ( = ?auto_11665 ?auto_11688 ) ) ( not ( = ?auto_11665 ?auto_11681 ) ) ( not ( = ?auto_11665 ?auto_11694 ) ) ( not ( = ?auto_11665 ?auto_11683 ) ) ( not ( = ?auto_11665 ?auto_11682 ) ) ( not ( = ?auto_11665 ?auto_11689 ) ) ( not ( = ?auto_11665 ?auto_11677 ) ) ( not ( = ?auto_11669 ?auto_11691 ) ) ( not ( = ?auto_11669 ?auto_11675 ) ) ( not ( = ?auto_11669 ?auto_11685 ) ) ( not ( = ?auto_11669 ?auto_11695 ) ) ( not ( = ?auto_11669 ?auto_11676 ) ) ( not ( = ?auto_11669 ?auto_11693 ) ) ( not ( = ?auto_11669 ?auto_11692 ) ) ( not ( = ?auto_11672 ?auto_11674 ) ) ( not ( = ?auto_11672 ?auto_11696 ) ) ( not ( = ?auto_11672 ?auto_11680 ) ) ( not ( = ?auto_11672 ?auto_11687 ) ) ( not ( = ?auto_11672 ?auto_11673 ) ) ( not ( = ?auto_11672 ?auto_11686 ) ) ( not ( = ?auto_11672 ?auto_11678 ) ) ( not ( = ?auto_11670 ?auto_11690 ) ) ( not ( = ?auto_11670 ?auto_11684 ) ) ( not ( = ?auto_11670 ?auto_11679 ) ) ( not ( = ?auto_11670 ?auto_11688 ) ) ( not ( = ?auto_11670 ?auto_11681 ) ) ( not ( = ?auto_11670 ?auto_11694 ) ) ( not ( = ?auto_11670 ?auto_11683 ) ) ( not ( = ?auto_11670 ?auto_11682 ) ) ( not ( = ?auto_11670 ?auto_11689 ) ) ( not ( = ?auto_11670 ?auto_11677 ) ) )
    :subtasks
    ( ( MAKE-10CRATE ?auto_11655 ?auto_11656 ?auto_11657 ?auto_11658 ?auto_11659 ?auto_11662 ?auto_11660 ?auto_11664 ?auto_11663 ?auto_11661 ?auto_11666 )
      ( MAKE-1CRATE ?auto_11666 ?auto_11665 )
      ( MAKE-11CRATE-VERIFY ?auto_11655 ?auto_11656 ?auto_11657 ?auto_11658 ?auto_11659 ?auto_11662 ?auto_11660 ?auto_11664 ?auto_11663 ?auto_11661 ?auto_11666 ?auto_11665 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11699 - SURFACE
      ?auto_11700 - SURFACE
    )
    :vars
    (
      ?auto_11701 - HOIST
      ?auto_11702 - PLACE
      ?auto_11704 - PLACE
      ?auto_11705 - HOIST
      ?auto_11706 - SURFACE
      ?auto_11703 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11701 ?auto_11702 ) ( SURFACE-AT ?auto_11699 ?auto_11702 ) ( CLEAR ?auto_11699 ) ( IS-CRATE ?auto_11700 ) ( AVAILABLE ?auto_11701 ) ( not ( = ?auto_11704 ?auto_11702 ) ) ( HOIST-AT ?auto_11705 ?auto_11704 ) ( AVAILABLE ?auto_11705 ) ( SURFACE-AT ?auto_11700 ?auto_11704 ) ( ON ?auto_11700 ?auto_11706 ) ( CLEAR ?auto_11700 ) ( TRUCK-AT ?auto_11703 ?auto_11702 ) ( not ( = ?auto_11699 ?auto_11700 ) ) ( not ( = ?auto_11699 ?auto_11706 ) ) ( not ( = ?auto_11700 ?auto_11706 ) ) ( not ( = ?auto_11701 ?auto_11705 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_11703 ?auto_11702 ?auto_11704 )
      ( !LIFT ?auto_11705 ?auto_11700 ?auto_11706 ?auto_11704 )
      ( !LOAD ?auto_11705 ?auto_11700 ?auto_11703 ?auto_11704 )
      ( !DRIVE ?auto_11703 ?auto_11704 ?auto_11702 )
      ( !UNLOAD ?auto_11701 ?auto_11700 ?auto_11703 ?auto_11702 )
      ( !DROP ?auto_11701 ?auto_11700 ?auto_11699 ?auto_11702 )
      ( MAKE-1CRATE-VERIFY ?auto_11699 ?auto_11700 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_11720 - SURFACE
      ?auto_11721 - SURFACE
      ?auto_11722 - SURFACE
      ?auto_11723 - SURFACE
      ?auto_11724 - SURFACE
      ?auto_11727 - SURFACE
      ?auto_11725 - SURFACE
      ?auto_11729 - SURFACE
      ?auto_11728 - SURFACE
      ?auto_11726 - SURFACE
      ?auto_11731 - SURFACE
      ?auto_11730 - SURFACE
      ?auto_11732 - SURFACE
    )
    :vars
    (
      ?auto_11736 - HOIST
      ?auto_11738 - PLACE
      ?auto_11735 - PLACE
      ?auto_11734 - HOIST
      ?auto_11737 - SURFACE
      ?auto_11748 - PLACE
      ?auto_11749 - HOIST
      ?auto_11752 - SURFACE
      ?auto_11741 - PLACE
      ?auto_11750 - HOIST
      ?auto_11760 - SURFACE
      ?auto_11756 - SURFACE
      ?auto_11759 - SURFACE
      ?auto_11762 - PLACE
      ?auto_11761 - HOIST
      ?auto_11739 - SURFACE
      ?auto_11744 - PLACE
      ?auto_11740 - HOIST
      ?auto_11746 - SURFACE
      ?auto_11742 - PLACE
      ?auto_11743 - HOIST
      ?auto_11751 - SURFACE
      ?auto_11753 - PLACE
      ?auto_11757 - HOIST
      ?auto_11754 - SURFACE
      ?auto_11763 - PLACE
      ?auto_11747 - HOIST
      ?auto_11745 - SURFACE
      ?auto_11758 - SURFACE
      ?auto_11755 - SURFACE
      ?auto_11733 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11736 ?auto_11738 ) ( IS-CRATE ?auto_11732 ) ( not ( = ?auto_11735 ?auto_11738 ) ) ( HOIST-AT ?auto_11734 ?auto_11735 ) ( SURFACE-AT ?auto_11732 ?auto_11735 ) ( ON ?auto_11732 ?auto_11737 ) ( CLEAR ?auto_11732 ) ( not ( = ?auto_11730 ?auto_11732 ) ) ( not ( = ?auto_11730 ?auto_11737 ) ) ( not ( = ?auto_11732 ?auto_11737 ) ) ( not ( = ?auto_11736 ?auto_11734 ) ) ( IS-CRATE ?auto_11730 ) ( not ( = ?auto_11748 ?auto_11738 ) ) ( HOIST-AT ?auto_11749 ?auto_11748 ) ( AVAILABLE ?auto_11749 ) ( SURFACE-AT ?auto_11730 ?auto_11748 ) ( ON ?auto_11730 ?auto_11752 ) ( CLEAR ?auto_11730 ) ( not ( = ?auto_11731 ?auto_11730 ) ) ( not ( = ?auto_11731 ?auto_11752 ) ) ( not ( = ?auto_11730 ?auto_11752 ) ) ( not ( = ?auto_11736 ?auto_11749 ) ) ( IS-CRATE ?auto_11731 ) ( not ( = ?auto_11741 ?auto_11738 ) ) ( HOIST-AT ?auto_11750 ?auto_11741 ) ( SURFACE-AT ?auto_11731 ?auto_11741 ) ( ON ?auto_11731 ?auto_11760 ) ( CLEAR ?auto_11731 ) ( not ( = ?auto_11726 ?auto_11731 ) ) ( not ( = ?auto_11726 ?auto_11760 ) ) ( not ( = ?auto_11731 ?auto_11760 ) ) ( not ( = ?auto_11736 ?auto_11750 ) ) ( IS-CRATE ?auto_11726 ) ( SURFACE-AT ?auto_11726 ?auto_11735 ) ( ON ?auto_11726 ?auto_11756 ) ( CLEAR ?auto_11726 ) ( not ( = ?auto_11728 ?auto_11726 ) ) ( not ( = ?auto_11728 ?auto_11756 ) ) ( not ( = ?auto_11726 ?auto_11756 ) ) ( IS-CRATE ?auto_11728 ) ( SURFACE-AT ?auto_11728 ?auto_11735 ) ( ON ?auto_11728 ?auto_11759 ) ( CLEAR ?auto_11728 ) ( not ( = ?auto_11729 ?auto_11728 ) ) ( not ( = ?auto_11729 ?auto_11759 ) ) ( not ( = ?auto_11728 ?auto_11759 ) ) ( IS-CRATE ?auto_11729 ) ( not ( = ?auto_11762 ?auto_11738 ) ) ( HOIST-AT ?auto_11761 ?auto_11762 ) ( AVAILABLE ?auto_11761 ) ( SURFACE-AT ?auto_11729 ?auto_11762 ) ( ON ?auto_11729 ?auto_11739 ) ( CLEAR ?auto_11729 ) ( not ( = ?auto_11725 ?auto_11729 ) ) ( not ( = ?auto_11725 ?auto_11739 ) ) ( not ( = ?auto_11729 ?auto_11739 ) ) ( not ( = ?auto_11736 ?auto_11761 ) ) ( IS-CRATE ?auto_11725 ) ( not ( = ?auto_11744 ?auto_11738 ) ) ( HOIST-AT ?auto_11740 ?auto_11744 ) ( AVAILABLE ?auto_11740 ) ( SURFACE-AT ?auto_11725 ?auto_11744 ) ( ON ?auto_11725 ?auto_11746 ) ( CLEAR ?auto_11725 ) ( not ( = ?auto_11727 ?auto_11725 ) ) ( not ( = ?auto_11727 ?auto_11746 ) ) ( not ( = ?auto_11725 ?auto_11746 ) ) ( not ( = ?auto_11736 ?auto_11740 ) ) ( IS-CRATE ?auto_11727 ) ( not ( = ?auto_11742 ?auto_11738 ) ) ( HOIST-AT ?auto_11743 ?auto_11742 ) ( AVAILABLE ?auto_11743 ) ( SURFACE-AT ?auto_11727 ?auto_11742 ) ( ON ?auto_11727 ?auto_11751 ) ( CLEAR ?auto_11727 ) ( not ( = ?auto_11724 ?auto_11727 ) ) ( not ( = ?auto_11724 ?auto_11751 ) ) ( not ( = ?auto_11727 ?auto_11751 ) ) ( not ( = ?auto_11736 ?auto_11743 ) ) ( IS-CRATE ?auto_11724 ) ( not ( = ?auto_11753 ?auto_11738 ) ) ( HOIST-AT ?auto_11757 ?auto_11753 ) ( AVAILABLE ?auto_11757 ) ( SURFACE-AT ?auto_11724 ?auto_11753 ) ( ON ?auto_11724 ?auto_11754 ) ( CLEAR ?auto_11724 ) ( not ( = ?auto_11723 ?auto_11724 ) ) ( not ( = ?auto_11723 ?auto_11754 ) ) ( not ( = ?auto_11724 ?auto_11754 ) ) ( not ( = ?auto_11736 ?auto_11757 ) ) ( IS-CRATE ?auto_11723 ) ( not ( = ?auto_11763 ?auto_11738 ) ) ( HOIST-AT ?auto_11747 ?auto_11763 ) ( AVAILABLE ?auto_11747 ) ( SURFACE-AT ?auto_11723 ?auto_11763 ) ( ON ?auto_11723 ?auto_11745 ) ( CLEAR ?auto_11723 ) ( not ( = ?auto_11722 ?auto_11723 ) ) ( not ( = ?auto_11722 ?auto_11745 ) ) ( not ( = ?auto_11723 ?auto_11745 ) ) ( not ( = ?auto_11736 ?auto_11747 ) ) ( IS-CRATE ?auto_11722 ) ( AVAILABLE ?auto_11734 ) ( SURFACE-AT ?auto_11722 ?auto_11735 ) ( ON ?auto_11722 ?auto_11758 ) ( CLEAR ?auto_11722 ) ( not ( = ?auto_11721 ?auto_11722 ) ) ( not ( = ?auto_11721 ?auto_11758 ) ) ( not ( = ?auto_11722 ?auto_11758 ) ) ( SURFACE-AT ?auto_11720 ?auto_11738 ) ( CLEAR ?auto_11720 ) ( IS-CRATE ?auto_11721 ) ( AVAILABLE ?auto_11736 ) ( AVAILABLE ?auto_11750 ) ( SURFACE-AT ?auto_11721 ?auto_11741 ) ( ON ?auto_11721 ?auto_11755 ) ( CLEAR ?auto_11721 ) ( TRUCK-AT ?auto_11733 ?auto_11738 ) ( not ( = ?auto_11720 ?auto_11721 ) ) ( not ( = ?auto_11720 ?auto_11755 ) ) ( not ( = ?auto_11721 ?auto_11755 ) ) ( not ( = ?auto_11720 ?auto_11722 ) ) ( not ( = ?auto_11720 ?auto_11758 ) ) ( not ( = ?auto_11722 ?auto_11755 ) ) ( not ( = ?auto_11735 ?auto_11741 ) ) ( not ( = ?auto_11734 ?auto_11750 ) ) ( not ( = ?auto_11758 ?auto_11755 ) ) ( not ( = ?auto_11720 ?auto_11723 ) ) ( not ( = ?auto_11720 ?auto_11745 ) ) ( not ( = ?auto_11721 ?auto_11723 ) ) ( not ( = ?auto_11721 ?auto_11745 ) ) ( not ( = ?auto_11723 ?auto_11758 ) ) ( not ( = ?auto_11723 ?auto_11755 ) ) ( not ( = ?auto_11763 ?auto_11735 ) ) ( not ( = ?auto_11763 ?auto_11741 ) ) ( not ( = ?auto_11747 ?auto_11734 ) ) ( not ( = ?auto_11747 ?auto_11750 ) ) ( not ( = ?auto_11745 ?auto_11758 ) ) ( not ( = ?auto_11745 ?auto_11755 ) ) ( not ( = ?auto_11720 ?auto_11724 ) ) ( not ( = ?auto_11720 ?auto_11754 ) ) ( not ( = ?auto_11721 ?auto_11724 ) ) ( not ( = ?auto_11721 ?auto_11754 ) ) ( not ( = ?auto_11722 ?auto_11724 ) ) ( not ( = ?auto_11722 ?auto_11754 ) ) ( not ( = ?auto_11724 ?auto_11745 ) ) ( not ( = ?auto_11724 ?auto_11758 ) ) ( not ( = ?auto_11724 ?auto_11755 ) ) ( not ( = ?auto_11753 ?auto_11763 ) ) ( not ( = ?auto_11753 ?auto_11735 ) ) ( not ( = ?auto_11753 ?auto_11741 ) ) ( not ( = ?auto_11757 ?auto_11747 ) ) ( not ( = ?auto_11757 ?auto_11734 ) ) ( not ( = ?auto_11757 ?auto_11750 ) ) ( not ( = ?auto_11754 ?auto_11745 ) ) ( not ( = ?auto_11754 ?auto_11758 ) ) ( not ( = ?auto_11754 ?auto_11755 ) ) ( not ( = ?auto_11720 ?auto_11727 ) ) ( not ( = ?auto_11720 ?auto_11751 ) ) ( not ( = ?auto_11721 ?auto_11727 ) ) ( not ( = ?auto_11721 ?auto_11751 ) ) ( not ( = ?auto_11722 ?auto_11727 ) ) ( not ( = ?auto_11722 ?auto_11751 ) ) ( not ( = ?auto_11723 ?auto_11727 ) ) ( not ( = ?auto_11723 ?auto_11751 ) ) ( not ( = ?auto_11727 ?auto_11754 ) ) ( not ( = ?auto_11727 ?auto_11745 ) ) ( not ( = ?auto_11727 ?auto_11758 ) ) ( not ( = ?auto_11727 ?auto_11755 ) ) ( not ( = ?auto_11742 ?auto_11753 ) ) ( not ( = ?auto_11742 ?auto_11763 ) ) ( not ( = ?auto_11742 ?auto_11735 ) ) ( not ( = ?auto_11742 ?auto_11741 ) ) ( not ( = ?auto_11743 ?auto_11757 ) ) ( not ( = ?auto_11743 ?auto_11747 ) ) ( not ( = ?auto_11743 ?auto_11734 ) ) ( not ( = ?auto_11743 ?auto_11750 ) ) ( not ( = ?auto_11751 ?auto_11754 ) ) ( not ( = ?auto_11751 ?auto_11745 ) ) ( not ( = ?auto_11751 ?auto_11758 ) ) ( not ( = ?auto_11751 ?auto_11755 ) ) ( not ( = ?auto_11720 ?auto_11725 ) ) ( not ( = ?auto_11720 ?auto_11746 ) ) ( not ( = ?auto_11721 ?auto_11725 ) ) ( not ( = ?auto_11721 ?auto_11746 ) ) ( not ( = ?auto_11722 ?auto_11725 ) ) ( not ( = ?auto_11722 ?auto_11746 ) ) ( not ( = ?auto_11723 ?auto_11725 ) ) ( not ( = ?auto_11723 ?auto_11746 ) ) ( not ( = ?auto_11724 ?auto_11725 ) ) ( not ( = ?auto_11724 ?auto_11746 ) ) ( not ( = ?auto_11725 ?auto_11751 ) ) ( not ( = ?auto_11725 ?auto_11754 ) ) ( not ( = ?auto_11725 ?auto_11745 ) ) ( not ( = ?auto_11725 ?auto_11758 ) ) ( not ( = ?auto_11725 ?auto_11755 ) ) ( not ( = ?auto_11744 ?auto_11742 ) ) ( not ( = ?auto_11744 ?auto_11753 ) ) ( not ( = ?auto_11744 ?auto_11763 ) ) ( not ( = ?auto_11744 ?auto_11735 ) ) ( not ( = ?auto_11744 ?auto_11741 ) ) ( not ( = ?auto_11740 ?auto_11743 ) ) ( not ( = ?auto_11740 ?auto_11757 ) ) ( not ( = ?auto_11740 ?auto_11747 ) ) ( not ( = ?auto_11740 ?auto_11734 ) ) ( not ( = ?auto_11740 ?auto_11750 ) ) ( not ( = ?auto_11746 ?auto_11751 ) ) ( not ( = ?auto_11746 ?auto_11754 ) ) ( not ( = ?auto_11746 ?auto_11745 ) ) ( not ( = ?auto_11746 ?auto_11758 ) ) ( not ( = ?auto_11746 ?auto_11755 ) ) ( not ( = ?auto_11720 ?auto_11729 ) ) ( not ( = ?auto_11720 ?auto_11739 ) ) ( not ( = ?auto_11721 ?auto_11729 ) ) ( not ( = ?auto_11721 ?auto_11739 ) ) ( not ( = ?auto_11722 ?auto_11729 ) ) ( not ( = ?auto_11722 ?auto_11739 ) ) ( not ( = ?auto_11723 ?auto_11729 ) ) ( not ( = ?auto_11723 ?auto_11739 ) ) ( not ( = ?auto_11724 ?auto_11729 ) ) ( not ( = ?auto_11724 ?auto_11739 ) ) ( not ( = ?auto_11727 ?auto_11729 ) ) ( not ( = ?auto_11727 ?auto_11739 ) ) ( not ( = ?auto_11729 ?auto_11746 ) ) ( not ( = ?auto_11729 ?auto_11751 ) ) ( not ( = ?auto_11729 ?auto_11754 ) ) ( not ( = ?auto_11729 ?auto_11745 ) ) ( not ( = ?auto_11729 ?auto_11758 ) ) ( not ( = ?auto_11729 ?auto_11755 ) ) ( not ( = ?auto_11762 ?auto_11744 ) ) ( not ( = ?auto_11762 ?auto_11742 ) ) ( not ( = ?auto_11762 ?auto_11753 ) ) ( not ( = ?auto_11762 ?auto_11763 ) ) ( not ( = ?auto_11762 ?auto_11735 ) ) ( not ( = ?auto_11762 ?auto_11741 ) ) ( not ( = ?auto_11761 ?auto_11740 ) ) ( not ( = ?auto_11761 ?auto_11743 ) ) ( not ( = ?auto_11761 ?auto_11757 ) ) ( not ( = ?auto_11761 ?auto_11747 ) ) ( not ( = ?auto_11761 ?auto_11734 ) ) ( not ( = ?auto_11761 ?auto_11750 ) ) ( not ( = ?auto_11739 ?auto_11746 ) ) ( not ( = ?auto_11739 ?auto_11751 ) ) ( not ( = ?auto_11739 ?auto_11754 ) ) ( not ( = ?auto_11739 ?auto_11745 ) ) ( not ( = ?auto_11739 ?auto_11758 ) ) ( not ( = ?auto_11739 ?auto_11755 ) ) ( not ( = ?auto_11720 ?auto_11728 ) ) ( not ( = ?auto_11720 ?auto_11759 ) ) ( not ( = ?auto_11721 ?auto_11728 ) ) ( not ( = ?auto_11721 ?auto_11759 ) ) ( not ( = ?auto_11722 ?auto_11728 ) ) ( not ( = ?auto_11722 ?auto_11759 ) ) ( not ( = ?auto_11723 ?auto_11728 ) ) ( not ( = ?auto_11723 ?auto_11759 ) ) ( not ( = ?auto_11724 ?auto_11728 ) ) ( not ( = ?auto_11724 ?auto_11759 ) ) ( not ( = ?auto_11727 ?auto_11728 ) ) ( not ( = ?auto_11727 ?auto_11759 ) ) ( not ( = ?auto_11725 ?auto_11728 ) ) ( not ( = ?auto_11725 ?auto_11759 ) ) ( not ( = ?auto_11728 ?auto_11739 ) ) ( not ( = ?auto_11728 ?auto_11746 ) ) ( not ( = ?auto_11728 ?auto_11751 ) ) ( not ( = ?auto_11728 ?auto_11754 ) ) ( not ( = ?auto_11728 ?auto_11745 ) ) ( not ( = ?auto_11728 ?auto_11758 ) ) ( not ( = ?auto_11728 ?auto_11755 ) ) ( not ( = ?auto_11759 ?auto_11739 ) ) ( not ( = ?auto_11759 ?auto_11746 ) ) ( not ( = ?auto_11759 ?auto_11751 ) ) ( not ( = ?auto_11759 ?auto_11754 ) ) ( not ( = ?auto_11759 ?auto_11745 ) ) ( not ( = ?auto_11759 ?auto_11758 ) ) ( not ( = ?auto_11759 ?auto_11755 ) ) ( not ( = ?auto_11720 ?auto_11726 ) ) ( not ( = ?auto_11720 ?auto_11756 ) ) ( not ( = ?auto_11721 ?auto_11726 ) ) ( not ( = ?auto_11721 ?auto_11756 ) ) ( not ( = ?auto_11722 ?auto_11726 ) ) ( not ( = ?auto_11722 ?auto_11756 ) ) ( not ( = ?auto_11723 ?auto_11726 ) ) ( not ( = ?auto_11723 ?auto_11756 ) ) ( not ( = ?auto_11724 ?auto_11726 ) ) ( not ( = ?auto_11724 ?auto_11756 ) ) ( not ( = ?auto_11727 ?auto_11726 ) ) ( not ( = ?auto_11727 ?auto_11756 ) ) ( not ( = ?auto_11725 ?auto_11726 ) ) ( not ( = ?auto_11725 ?auto_11756 ) ) ( not ( = ?auto_11729 ?auto_11726 ) ) ( not ( = ?auto_11729 ?auto_11756 ) ) ( not ( = ?auto_11726 ?auto_11759 ) ) ( not ( = ?auto_11726 ?auto_11739 ) ) ( not ( = ?auto_11726 ?auto_11746 ) ) ( not ( = ?auto_11726 ?auto_11751 ) ) ( not ( = ?auto_11726 ?auto_11754 ) ) ( not ( = ?auto_11726 ?auto_11745 ) ) ( not ( = ?auto_11726 ?auto_11758 ) ) ( not ( = ?auto_11726 ?auto_11755 ) ) ( not ( = ?auto_11756 ?auto_11759 ) ) ( not ( = ?auto_11756 ?auto_11739 ) ) ( not ( = ?auto_11756 ?auto_11746 ) ) ( not ( = ?auto_11756 ?auto_11751 ) ) ( not ( = ?auto_11756 ?auto_11754 ) ) ( not ( = ?auto_11756 ?auto_11745 ) ) ( not ( = ?auto_11756 ?auto_11758 ) ) ( not ( = ?auto_11756 ?auto_11755 ) ) ( not ( = ?auto_11720 ?auto_11731 ) ) ( not ( = ?auto_11720 ?auto_11760 ) ) ( not ( = ?auto_11721 ?auto_11731 ) ) ( not ( = ?auto_11721 ?auto_11760 ) ) ( not ( = ?auto_11722 ?auto_11731 ) ) ( not ( = ?auto_11722 ?auto_11760 ) ) ( not ( = ?auto_11723 ?auto_11731 ) ) ( not ( = ?auto_11723 ?auto_11760 ) ) ( not ( = ?auto_11724 ?auto_11731 ) ) ( not ( = ?auto_11724 ?auto_11760 ) ) ( not ( = ?auto_11727 ?auto_11731 ) ) ( not ( = ?auto_11727 ?auto_11760 ) ) ( not ( = ?auto_11725 ?auto_11731 ) ) ( not ( = ?auto_11725 ?auto_11760 ) ) ( not ( = ?auto_11729 ?auto_11731 ) ) ( not ( = ?auto_11729 ?auto_11760 ) ) ( not ( = ?auto_11728 ?auto_11731 ) ) ( not ( = ?auto_11728 ?auto_11760 ) ) ( not ( = ?auto_11731 ?auto_11756 ) ) ( not ( = ?auto_11731 ?auto_11759 ) ) ( not ( = ?auto_11731 ?auto_11739 ) ) ( not ( = ?auto_11731 ?auto_11746 ) ) ( not ( = ?auto_11731 ?auto_11751 ) ) ( not ( = ?auto_11731 ?auto_11754 ) ) ( not ( = ?auto_11731 ?auto_11745 ) ) ( not ( = ?auto_11731 ?auto_11758 ) ) ( not ( = ?auto_11731 ?auto_11755 ) ) ( not ( = ?auto_11760 ?auto_11756 ) ) ( not ( = ?auto_11760 ?auto_11759 ) ) ( not ( = ?auto_11760 ?auto_11739 ) ) ( not ( = ?auto_11760 ?auto_11746 ) ) ( not ( = ?auto_11760 ?auto_11751 ) ) ( not ( = ?auto_11760 ?auto_11754 ) ) ( not ( = ?auto_11760 ?auto_11745 ) ) ( not ( = ?auto_11760 ?auto_11758 ) ) ( not ( = ?auto_11760 ?auto_11755 ) ) ( not ( = ?auto_11720 ?auto_11730 ) ) ( not ( = ?auto_11720 ?auto_11752 ) ) ( not ( = ?auto_11721 ?auto_11730 ) ) ( not ( = ?auto_11721 ?auto_11752 ) ) ( not ( = ?auto_11722 ?auto_11730 ) ) ( not ( = ?auto_11722 ?auto_11752 ) ) ( not ( = ?auto_11723 ?auto_11730 ) ) ( not ( = ?auto_11723 ?auto_11752 ) ) ( not ( = ?auto_11724 ?auto_11730 ) ) ( not ( = ?auto_11724 ?auto_11752 ) ) ( not ( = ?auto_11727 ?auto_11730 ) ) ( not ( = ?auto_11727 ?auto_11752 ) ) ( not ( = ?auto_11725 ?auto_11730 ) ) ( not ( = ?auto_11725 ?auto_11752 ) ) ( not ( = ?auto_11729 ?auto_11730 ) ) ( not ( = ?auto_11729 ?auto_11752 ) ) ( not ( = ?auto_11728 ?auto_11730 ) ) ( not ( = ?auto_11728 ?auto_11752 ) ) ( not ( = ?auto_11726 ?auto_11730 ) ) ( not ( = ?auto_11726 ?auto_11752 ) ) ( not ( = ?auto_11730 ?auto_11760 ) ) ( not ( = ?auto_11730 ?auto_11756 ) ) ( not ( = ?auto_11730 ?auto_11759 ) ) ( not ( = ?auto_11730 ?auto_11739 ) ) ( not ( = ?auto_11730 ?auto_11746 ) ) ( not ( = ?auto_11730 ?auto_11751 ) ) ( not ( = ?auto_11730 ?auto_11754 ) ) ( not ( = ?auto_11730 ?auto_11745 ) ) ( not ( = ?auto_11730 ?auto_11758 ) ) ( not ( = ?auto_11730 ?auto_11755 ) ) ( not ( = ?auto_11748 ?auto_11741 ) ) ( not ( = ?auto_11748 ?auto_11735 ) ) ( not ( = ?auto_11748 ?auto_11762 ) ) ( not ( = ?auto_11748 ?auto_11744 ) ) ( not ( = ?auto_11748 ?auto_11742 ) ) ( not ( = ?auto_11748 ?auto_11753 ) ) ( not ( = ?auto_11748 ?auto_11763 ) ) ( not ( = ?auto_11749 ?auto_11750 ) ) ( not ( = ?auto_11749 ?auto_11734 ) ) ( not ( = ?auto_11749 ?auto_11761 ) ) ( not ( = ?auto_11749 ?auto_11740 ) ) ( not ( = ?auto_11749 ?auto_11743 ) ) ( not ( = ?auto_11749 ?auto_11757 ) ) ( not ( = ?auto_11749 ?auto_11747 ) ) ( not ( = ?auto_11752 ?auto_11760 ) ) ( not ( = ?auto_11752 ?auto_11756 ) ) ( not ( = ?auto_11752 ?auto_11759 ) ) ( not ( = ?auto_11752 ?auto_11739 ) ) ( not ( = ?auto_11752 ?auto_11746 ) ) ( not ( = ?auto_11752 ?auto_11751 ) ) ( not ( = ?auto_11752 ?auto_11754 ) ) ( not ( = ?auto_11752 ?auto_11745 ) ) ( not ( = ?auto_11752 ?auto_11758 ) ) ( not ( = ?auto_11752 ?auto_11755 ) ) ( not ( = ?auto_11720 ?auto_11732 ) ) ( not ( = ?auto_11720 ?auto_11737 ) ) ( not ( = ?auto_11721 ?auto_11732 ) ) ( not ( = ?auto_11721 ?auto_11737 ) ) ( not ( = ?auto_11722 ?auto_11732 ) ) ( not ( = ?auto_11722 ?auto_11737 ) ) ( not ( = ?auto_11723 ?auto_11732 ) ) ( not ( = ?auto_11723 ?auto_11737 ) ) ( not ( = ?auto_11724 ?auto_11732 ) ) ( not ( = ?auto_11724 ?auto_11737 ) ) ( not ( = ?auto_11727 ?auto_11732 ) ) ( not ( = ?auto_11727 ?auto_11737 ) ) ( not ( = ?auto_11725 ?auto_11732 ) ) ( not ( = ?auto_11725 ?auto_11737 ) ) ( not ( = ?auto_11729 ?auto_11732 ) ) ( not ( = ?auto_11729 ?auto_11737 ) ) ( not ( = ?auto_11728 ?auto_11732 ) ) ( not ( = ?auto_11728 ?auto_11737 ) ) ( not ( = ?auto_11726 ?auto_11732 ) ) ( not ( = ?auto_11726 ?auto_11737 ) ) ( not ( = ?auto_11731 ?auto_11732 ) ) ( not ( = ?auto_11731 ?auto_11737 ) ) ( not ( = ?auto_11732 ?auto_11752 ) ) ( not ( = ?auto_11732 ?auto_11760 ) ) ( not ( = ?auto_11732 ?auto_11756 ) ) ( not ( = ?auto_11732 ?auto_11759 ) ) ( not ( = ?auto_11732 ?auto_11739 ) ) ( not ( = ?auto_11732 ?auto_11746 ) ) ( not ( = ?auto_11732 ?auto_11751 ) ) ( not ( = ?auto_11732 ?auto_11754 ) ) ( not ( = ?auto_11732 ?auto_11745 ) ) ( not ( = ?auto_11732 ?auto_11758 ) ) ( not ( = ?auto_11732 ?auto_11755 ) ) ( not ( = ?auto_11737 ?auto_11752 ) ) ( not ( = ?auto_11737 ?auto_11760 ) ) ( not ( = ?auto_11737 ?auto_11756 ) ) ( not ( = ?auto_11737 ?auto_11759 ) ) ( not ( = ?auto_11737 ?auto_11739 ) ) ( not ( = ?auto_11737 ?auto_11746 ) ) ( not ( = ?auto_11737 ?auto_11751 ) ) ( not ( = ?auto_11737 ?auto_11754 ) ) ( not ( = ?auto_11737 ?auto_11745 ) ) ( not ( = ?auto_11737 ?auto_11758 ) ) ( not ( = ?auto_11737 ?auto_11755 ) ) )
    :subtasks
    ( ( MAKE-11CRATE ?auto_11720 ?auto_11721 ?auto_11722 ?auto_11723 ?auto_11724 ?auto_11727 ?auto_11725 ?auto_11729 ?auto_11728 ?auto_11726 ?auto_11731 ?auto_11730 )
      ( MAKE-1CRATE ?auto_11730 ?auto_11732 )
      ( MAKE-12CRATE-VERIFY ?auto_11720 ?auto_11721 ?auto_11722 ?auto_11723 ?auto_11724 ?auto_11727 ?auto_11725 ?auto_11729 ?auto_11728 ?auto_11726 ?auto_11731 ?auto_11730 ?auto_11732 ) )
  )

)

