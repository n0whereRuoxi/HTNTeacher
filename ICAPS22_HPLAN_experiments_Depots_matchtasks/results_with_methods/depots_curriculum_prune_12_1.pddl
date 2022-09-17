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

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_11253 - SURFACE
      ?auto_11254 - SURFACE
      ?auto_11255 - SURFACE
    )
    :vars
    (
      ?auto_11259 - HOIST
      ?auto_11260 - PLACE
      ?auto_11258 - PLACE
      ?auto_11256 - HOIST
      ?auto_11257 - SURFACE
      ?auto_11264 - PLACE
      ?auto_11262 - HOIST
      ?auto_11263 - SURFACE
      ?auto_11261 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11259 ?auto_11260 ) ( IS-CRATE ?auto_11255 ) ( not ( = ?auto_11258 ?auto_11260 ) ) ( HOIST-AT ?auto_11256 ?auto_11258 ) ( AVAILABLE ?auto_11256 ) ( SURFACE-AT ?auto_11255 ?auto_11258 ) ( ON ?auto_11255 ?auto_11257 ) ( CLEAR ?auto_11255 ) ( not ( = ?auto_11254 ?auto_11255 ) ) ( not ( = ?auto_11254 ?auto_11257 ) ) ( not ( = ?auto_11255 ?auto_11257 ) ) ( not ( = ?auto_11259 ?auto_11256 ) ) ( SURFACE-AT ?auto_11253 ?auto_11260 ) ( CLEAR ?auto_11253 ) ( IS-CRATE ?auto_11254 ) ( AVAILABLE ?auto_11259 ) ( not ( = ?auto_11264 ?auto_11260 ) ) ( HOIST-AT ?auto_11262 ?auto_11264 ) ( AVAILABLE ?auto_11262 ) ( SURFACE-AT ?auto_11254 ?auto_11264 ) ( ON ?auto_11254 ?auto_11263 ) ( CLEAR ?auto_11254 ) ( TRUCK-AT ?auto_11261 ?auto_11260 ) ( not ( = ?auto_11253 ?auto_11254 ) ) ( not ( = ?auto_11253 ?auto_11263 ) ) ( not ( = ?auto_11254 ?auto_11263 ) ) ( not ( = ?auto_11259 ?auto_11262 ) ) ( not ( = ?auto_11253 ?auto_11255 ) ) ( not ( = ?auto_11253 ?auto_11257 ) ) ( not ( = ?auto_11255 ?auto_11263 ) ) ( not ( = ?auto_11258 ?auto_11264 ) ) ( not ( = ?auto_11256 ?auto_11262 ) ) ( not ( = ?auto_11257 ?auto_11263 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_11253 ?auto_11254 )
      ( MAKE-1CRATE ?auto_11254 ?auto_11255 )
      ( MAKE-2CRATE-VERIFY ?auto_11253 ?auto_11254 ?auto_11255 ) )
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
      ?auto_11287 - HOIST
      ?auto_11283 - PLACE
      ?auto_11286 - PLACE
      ?auto_11288 - HOIST
      ?auto_11285 - SURFACE
      ?auto_11289 - PLACE
      ?auto_11291 - HOIST
      ?auto_11294 - SURFACE
      ?auto_11293 - PLACE
      ?auto_11292 - HOIST
      ?auto_11290 - SURFACE
      ?auto_11284 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11287 ?auto_11283 ) ( IS-CRATE ?auto_11282 ) ( not ( = ?auto_11286 ?auto_11283 ) ) ( HOIST-AT ?auto_11288 ?auto_11286 ) ( AVAILABLE ?auto_11288 ) ( SURFACE-AT ?auto_11282 ?auto_11286 ) ( ON ?auto_11282 ?auto_11285 ) ( CLEAR ?auto_11282 ) ( not ( = ?auto_11281 ?auto_11282 ) ) ( not ( = ?auto_11281 ?auto_11285 ) ) ( not ( = ?auto_11282 ?auto_11285 ) ) ( not ( = ?auto_11287 ?auto_11288 ) ) ( IS-CRATE ?auto_11281 ) ( not ( = ?auto_11289 ?auto_11283 ) ) ( HOIST-AT ?auto_11291 ?auto_11289 ) ( AVAILABLE ?auto_11291 ) ( SURFACE-AT ?auto_11281 ?auto_11289 ) ( ON ?auto_11281 ?auto_11294 ) ( CLEAR ?auto_11281 ) ( not ( = ?auto_11280 ?auto_11281 ) ) ( not ( = ?auto_11280 ?auto_11294 ) ) ( not ( = ?auto_11281 ?auto_11294 ) ) ( not ( = ?auto_11287 ?auto_11291 ) ) ( SURFACE-AT ?auto_11279 ?auto_11283 ) ( CLEAR ?auto_11279 ) ( IS-CRATE ?auto_11280 ) ( AVAILABLE ?auto_11287 ) ( not ( = ?auto_11293 ?auto_11283 ) ) ( HOIST-AT ?auto_11292 ?auto_11293 ) ( AVAILABLE ?auto_11292 ) ( SURFACE-AT ?auto_11280 ?auto_11293 ) ( ON ?auto_11280 ?auto_11290 ) ( CLEAR ?auto_11280 ) ( TRUCK-AT ?auto_11284 ?auto_11283 ) ( not ( = ?auto_11279 ?auto_11280 ) ) ( not ( = ?auto_11279 ?auto_11290 ) ) ( not ( = ?auto_11280 ?auto_11290 ) ) ( not ( = ?auto_11287 ?auto_11292 ) ) ( not ( = ?auto_11279 ?auto_11281 ) ) ( not ( = ?auto_11279 ?auto_11294 ) ) ( not ( = ?auto_11281 ?auto_11290 ) ) ( not ( = ?auto_11289 ?auto_11293 ) ) ( not ( = ?auto_11291 ?auto_11292 ) ) ( not ( = ?auto_11294 ?auto_11290 ) ) ( not ( = ?auto_11279 ?auto_11282 ) ) ( not ( = ?auto_11279 ?auto_11285 ) ) ( not ( = ?auto_11280 ?auto_11282 ) ) ( not ( = ?auto_11280 ?auto_11285 ) ) ( not ( = ?auto_11282 ?auto_11294 ) ) ( not ( = ?auto_11282 ?auto_11290 ) ) ( not ( = ?auto_11286 ?auto_11289 ) ) ( not ( = ?auto_11286 ?auto_11293 ) ) ( not ( = ?auto_11288 ?auto_11291 ) ) ( not ( = ?auto_11288 ?auto_11292 ) ) ( not ( = ?auto_11285 ?auto_11294 ) ) ( not ( = ?auto_11285 ?auto_11290 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_11279 ?auto_11280 ?auto_11281 )
      ( MAKE-1CRATE ?auto_11281 ?auto_11282 )
      ( MAKE-3CRATE-VERIFY ?auto_11279 ?auto_11280 ?auto_11281 ?auto_11282 ) )
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
      ?auto_11318 - PLACE
      ?auto_11319 - PLACE
      ?auto_11317 - HOIST
      ?auto_11316 - SURFACE
      ?auto_11323 - PLACE
      ?auto_11324 - HOIST
      ?auto_11322 - SURFACE
      ?auto_11321 - PLACE
      ?auto_11328 - HOIST
      ?auto_11326 - SURFACE
      ?auto_11329 - PLACE
      ?auto_11325 - HOIST
      ?auto_11327 - SURFACE
      ?auto_11320 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11315 ?auto_11318 ) ( IS-CRATE ?auto_11314 ) ( not ( = ?auto_11319 ?auto_11318 ) ) ( HOIST-AT ?auto_11317 ?auto_11319 ) ( AVAILABLE ?auto_11317 ) ( SURFACE-AT ?auto_11314 ?auto_11319 ) ( ON ?auto_11314 ?auto_11316 ) ( CLEAR ?auto_11314 ) ( not ( = ?auto_11313 ?auto_11314 ) ) ( not ( = ?auto_11313 ?auto_11316 ) ) ( not ( = ?auto_11314 ?auto_11316 ) ) ( not ( = ?auto_11315 ?auto_11317 ) ) ( IS-CRATE ?auto_11313 ) ( not ( = ?auto_11323 ?auto_11318 ) ) ( HOIST-AT ?auto_11324 ?auto_11323 ) ( AVAILABLE ?auto_11324 ) ( SURFACE-AT ?auto_11313 ?auto_11323 ) ( ON ?auto_11313 ?auto_11322 ) ( CLEAR ?auto_11313 ) ( not ( = ?auto_11312 ?auto_11313 ) ) ( not ( = ?auto_11312 ?auto_11322 ) ) ( not ( = ?auto_11313 ?auto_11322 ) ) ( not ( = ?auto_11315 ?auto_11324 ) ) ( IS-CRATE ?auto_11312 ) ( not ( = ?auto_11321 ?auto_11318 ) ) ( HOIST-AT ?auto_11328 ?auto_11321 ) ( AVAILABLE ?auto_11328 ) ( SURFACE-AT ?auto_11312 ?auto_11321 ) ( ON ?auto_11312 ?auto_11326 ) ( CLEAR ?auto_11312 ) ( not ( = ?auto_11311 ?auto_11312 ) ) ( not ( = ?auto_11311 ?auto_11326 ) ) ( not ( = ?auto_11312 ?auto_11326 ) ) ( not ( = ?auto_11315 ?auto_11328 ) ) ( SURFACE-AT ?auto_11310 ?auto_11318 ) ( CLEAR ?auto_11310 ) ( IS-CRATE ?auto_11311 ) ( AVAILABLE ?auto_11315 ) ( not ( = ?auto_11329 ?auto_11318 ) ) ( HOIST-AT ?auto_11325 ?auto_11329 ) ( AVAILABLE ?auto_11325 ) ( SURFACE-AT ?auto_11311 ?auto_11329 ) ( ON ?auto_11311 ?auto_11327 ) ( CLEAR ?auto_11311 ) ( TRUCK-AT ?auto_11320 ?auto_11318 ) ( not ( = ?auto_11310 ?auto_11311 ) ) ( not ( = ?auto_11310 ?auto_11327 ) ) ( not ( = ?auto_11311 ?auto_11327 ) ) ( not ( = ?auto_11315 ?auto_11325 ) ) ( not ( = ?auto_11310 ?auto_11312 ) ) ( not ( = ?auto_11310 ?auto_11326 ) ) ( not ( = ?auto_11312 ?auto_11327 ) ) ( not ( = ?auto_11321 ?auto_11329 ) ) ( not ( = ?auto_11328 ?auto_11325 ) ) ( not ( = ?auto_11326 ?auto_11327 ) ) ( not ( = ?auto_11310 ?auto_11313 ) ) ( not ( = ?auto_11310 ?auto_11322 ) ) ( not ( = ?auto_11311 ?auto_11313 ) ) ( not ( = ?auto_11311 ?auto_11322 ) ) ( not ( = ?auto_11313 ?auto_11326 ) ) ( not ( = ?auto_11313 ?auto_11327 ) ) ( not ( = ?auto_11323 ?auto_11321 ) ) ( not ( = ?auto_11323 ?auto_11329 ) ) ( not ( = ?auto_11324 ?auto_11328 ) ) ( not ( = ?auto_11324 ?auto_11325 ) ) ( not ( = ?auto_11322 ?auto_11326 ) ) ( not ( = ?auto_11322 ?auto_11327 ) ) ( not ( = ?auto_11310 ?auto_11314 ) ) ( not ( = ?auto_11310 ?auto_11316 ) ) ( not ( = ?auto_11311 ?auto_11314 ) ) ( not ( = ?auto_11311 ?auto_11316 ) ) ( not ( = ?auto_11312 ?auto_11314 ) ) ( not ( = ?auto_11312 ?auto_11316 ) ) ( not ( = ?auto_11314 ?auto_11322 ) ) ( not ( = ?auto_11314 ?auto_11326 ) ) ( not ( = ?auto_11314 ?auto_11327 ) ) ( not ( = ?auto_11319 ?auto_11323 ) ) ( not ( = ?auto_11319 ?auto_11321 ) ) ( not ( = ?auto_11319 ?auto_11329 ) ) ( not ( = ?auto_11317 ?auto_11324 ) ) ( not ( = ?auto_11317 ?auto_11328 ) ) ( not ( = ?auto_11317 ?auto_11325 ) ) ( not ( = ?auto_11316 ?auto_11322 ) ) ( not ( = ?auto_11316 ?auto_11326 ) ) ( not ( = ?auto_11316 ?auto_11327 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_11310 ?auto_11311 ?auto_11312 ?auto_11313 )
      ( MAKE-1CRATE ?auto_11313 ?auto_11314 )
      ( MAKE-4CRATE-VERIFY ?auto_11310 ?auto_11311 ?auto_11312 ?auto_11313 ?auto_11314 ) )
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
      ?auto_11352 - HOIST
      ?auto_11356 - PLACE
      ?auto_11357 - PLACE
      ?auto_11353 - HOIST
      ?auto_11354 - SURFACE
      ?auto_11363 - PLACE
      ?auto_11365 - HOIST
      ?auto_11364 - SURFACE
      ?auto_11362 - PLACE
      ?auto_11360 - HOIST
      ?auto_11361 - SURFACE
      ?auto_11359 - PLACE
      ?auto_11369 - HOIST
      ?auto_11367 - SURFACE
      ?auto_11358 - PLACE
      ?auto_11366 - HOIST
      ?auto_11368 - SURFACE
      ?auto_11355 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11352 ?auto_11356 ) ( IS-CRATE ?auto_11351 ) ( not ( = ?auto_11357 ?auto_11356 ) ) ( HOIST-AT ?auto_11353 ?auto_11357 ) ( AVAILABLE ?auto_11353 ) ( SURFACE-AT ?auto_11351 ?auto_11357 ) ( ON ?auto_11351 ?auto_11354 ) ( CLEAR ?auto_11351 ) ( not ( = ?auto_11350 ?auto_11351 ) ) ( not ( = ?auto_11350 ?auto_11354 ) ) ( not ( = ?auto_11351 ?auto_11354 ) ) ( not ( = ?auto_11352 ?auto_11353 ) ) ( IS-CRATE ?auto_11350 ) ( not ( = ?auto_11363 ?auto_11356 ) ) ( HOIST-AT ?auto_11365 ?auto_11363 ) ( AVAILABLE ?auto_11365 ) ( SURFACE-AT ?auto_11350 ?auto_11363 ) ( ON ?auto_11350 ?auto_11364 ) ( CLEAR ?auto_11350 ) ( not ( = ?auto_11349 ?auto_11350 ) ) ( not ( = ?auto_11349 ?auto_11364 ) ) ( not ( = ?auto_11350 ?auto_11364 ) ) ( not ( = ?auto_11352 ?auto_11365 ) ) ( IS-CRATE ?auto_11349 ) ( not ( = ?auto_11362 ?auto_11356 ) ) ( HOIST-AT ?auto_11360 ?auto_11362 ) ( AVAILABLE ?auto_11360 ) ( SURFACE-AT ?auto_11349 ?auto_11362 ) ( ON ?auto_11349 ?auto_11361 ) ( CLEAR ?auto_11349 ) ( not ( = ?auto_11348 ?auto_11349 ) ) ( not ( = ?auto_11348 ?auto_11361 ) ) ( not ( = ?auto_11349 ?auto_11361 ) ) ( not ( = ?auto_11352 ?auto_11360 ) ) ( IS-CRATE ?auto_11348 ) ( not ( = ?auto_11359 ?auto_11356 ) ) ( HOIST-AT ?auto_11369 ?auto_11359 ) ( AVAILABLE ?auto_11369 ) ( SURFACE-AT ?auto_11348 ?auto_11359 ) ( ON ?auto_11348 ?auto_11367 ) ( CLEAR ?auto_11348 ) ( not ( = ?auto_11347 ?auto_11348 ) ) ( not ( = ?auto_11347 ?auto_11367 ) ) ( not ( = ?auto_11348 ?auto_11367 ) ) ( not ( = ?auto_11352 ?auto_11369 ) ) ( SURFACE-AT ?auto_11346 ?auto_11356 ) ( CLEAR ?auto_11346 ) ( IS-CRATE ?auto_11347 ) ( AVAILABLE ?auto_11352 ) ( not ( = ?auto_11358 ?auto_11356 ) ) ( HOIST-AT ?auto_11366 ?auto_11358 ) ( AVAILABLE ?auto_11366 ) ( SURFACE-AT ?auto_11347 ?auto_11358 ) ( ON ?auto_11347 ?auto_11368 ) ( CLEAR ?auto_11347 ) ( TRUCK-AT ?auto_11355 ?auto_11356 ) ( not ( = ?auto_11346 ?auto_11347 ) ) ( not ( = ?auto_11346 ?auto_11368 ) ) ( not ( = ?auto_11347 ?auto_11368 ) ) ( not ( = ?auto_11352 ?auto_11366 ) ) ( not ( = ?auto_11346 ?auto_11348 ) ) ( not ( = ?auto_11346 ?auto_11367 ) ) ( not ( = ?auto_11348 ?auto_11368 ) ) ( not ( = ?auto_11359 ?auto_11358 ) ) ( not ( = ?auto_11369 ?auto_11366 ) ) ( not ( = ?auto_11367 ?auto_11368 ) ) ( not ( = ?auto_11346 ?auto_11349 ) ) ( not ( = ?auto_11346 ?auto_11361 ) ) ( not ( = ?auto_11347 ?auto_11349 ) ) ( not ( = ?auto_11347 ?auto_11361 ) ) ( not ( = ?auto_11349 ?auto_11367 ) ) ( not ( = ?auto_11349 ?auto_11368 ) ) ( not ( = ?auto_11362 ?auto_11359 ) ) ( not ( = ?auto_11362 ?auto_11358 ) ) ( not ( = ?auto_11360 ?auto_11369 ) ) ( not ( = ?auto_11360 ?auto_11366 ) ) ( not ( = ?auto_11361 ?auto_11367 ) ) ( not ( = ?auto_11361 ?auto_11368 ) ) ( not ( = ?auto_11346 ?auto_11350 ) ) ( not ( = ?auto_11346 ?auto_11364 ) ) ( not ( = ?auto_11347 ?auto_11350 ) ) ( not ( = ?auto_11347 ?auto_11364 ) ) ( not ( = ?auto_11348 ?auto_11350 ) ) ( not ( = ?auto_11348 ?auto_11364 ) ) ( not ( = ?auto_11350 ?auto_11361 ) ) ( not ( = ?auto_11350 ?auto_11367 ) ) ( not ( = ?auto_11350 ?auto_11368 ) ) ( not ( = ?auto_11363 ?auto_11362 ) ) ( not ( = ?auto_11363 ?auto_11359 ) ) ( not ( = ?auto_11363 ?auto_11358 ) ) ( not ( = ?auto_11365 ?auto_11360 ) ) ( not ( = ?auto_11365 ?auto_11369 ) ) ( not ( = ?auto_11365 ?auto_11366 ) ) ( not ( = ?auto_11364 ?auto_11361 ) ) ( not ( = ?auto_11364 ?auto_11367 ) ) ( not ( = ?auto_11364 ?auto_11368 ) ) ( not ( = ?auto_11346 ?auto_11351 ) ) ( not ( = ?auto_11346 ?auto_11354 ) ) ( not ( = ?auto_11347 ?auto_11351 ) ) ( not ( = ?auto_11347 ?auto_11354 ) ) ( not ( = ?auto_11348 ?auto_11351 ) ) ( not ( = ?auto_11348 ?auto_11354 ) ) ( not ( = ?auto_11349 ?auto_11351 ) ) ( not ( = ?auto_11349 ?auto_11354 ) ) ( not ( = ?auto_11351 ?auto_11364 ) ) ( not ( = ?auto_11351 ?auto_11361 ) ) ( not ( = ?auto_11351 ?auto_11367 ) ) ( not ( = ?auto_11351 ?auto_11368 ) ) ( not ( = ?auto_11357 ?auto_11363 ) ) ( not ( = ?auto_11357 ?auto_11362 ) ) ( not ( = ?auto_11357 ?auto_11359 ) ) ( not ( = ?auto_11357 ?auto_11358 ) ) ( not ( = ?auto_11353 ?auto_11365 ) ) ( not ( = ?auto_11353 ?auto_11360 ) ) ( not ( = ?auto_11353 ?auto_11369 ) ) ( not ( = ?auto_11353 ?auto_11366 ) ) ( not ( = ?auto_11354 ?auto_11364 ) ) ( not ( = ?auto_11354 ?auto_11361 ) ) ( not ( = ?auto_11354 ?auto_11367 ) ) ( not ( = ?auto_11354 ?auto_11368 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_11346 ?auto_11347 ?auto_11348 ?auto_11349 ?auto_11350 )
      ( MAKE-1CRATE ?auto_11350 ?auto_11351 )
      ( MAKE-5CRATE-VERIFY ?auto_11346 ?auto_11347 ?auto_11348 ?auto_11349 ?auto_11350 ?auto_11351 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_11387 - SURFACE
      ?auto_11388 - SURFACE
      ?auto_11389 - SURFACE
      ?auto_11390 - SURFACE
      ?auto_11391 - SURFACE
      ?auto_11392 - SURFACE
      ?auto_11393 - SURFACE
    )
    :vars
    (
      ?auto_11398 - HOIST
      ?auto_11396 - PLACE
      ?auto_11395 - PLACE
      ?auto_11394 - HOIST
      ?auto_11397 - SURFACE
      ?auto_11413 - PLACE
      ?auto_11401 - HOIST
      ?auto_11412 - SURFACE
      ?auto_11410 - PLACE
      ?auto_11411 - HOIST
      ?auto_11409 - SURFACE
      ?auto_11408 - PLACE
      ?auto_11404 - HOIST
      ?auto_11407 - SURFACE
      ?auto_11403 - PLACE
      ?auto_11400 - HOIST
      ?auto_11402 - SURFACE
      ?auto_11406 - PLACE
      ?auto_11405 - HOIST
      ?auto_11414 - SURFACE
      ?auto_11399 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11398 ?auto_11396 ) ( IS-CRATE ?auto_11393 ) ( not ( = ?auto_11395 ?auto_11396 ) ) ( HOIST-AT ?auto_11394 ?auto_11395 ) ( AVAILABLE ?auto_11394 ) ( SURFACE-AT ?auto_11393 ?auto_11395 ) ( ON ?auto_11393 ?auto_11397 ) ( CLEAR ?auto_11393 ) ( not ( = ?auto_11392 ?auto_11393 ) ) ( not ( = ?auto_11392 ?auto_11397 ) ) ( not ( = ?auto_11393 ?auto_11397 ) ) ( not ( = ?auto_11398 ?auto_11394 ) ) ( IS-CRATE ?auto_11392 ) ( not ( = ?auto_11413 ?auto_11396 ) ) ( HOIST-AT ?auto_11401 ?auto_11413 ) ( AVAILABLE ?auto_11401 ) ( SURFACE-AT ?auto_11392 ?auto_11413 ) ( ON ?auto_11392 ?auto_11412 ) ( CLEAR ?auto_11392 ) ( not ( = ?auto_11391 ?auto_11392 ) ) ( not ( = ?auto_11391 ?auto_11412 ) ) ( not ( = ?auto_11392 ?auto_11412 ) ) ( not ( = ?auto_11398 ?auto_11401 ) ) ( IS-CRATE ?auto_11391 ) ( not ( = ?auto_11410 ?auto_11396 ) ) ( HOIST-AT ?auto_11411 ?auto_11410 ) ( AVAILABLE ?auto_11411 ) ( SURFACE-AT ?auto_11391 ?auto_11410 ) ( ON ?auto_11391 ?auto_11409 ) ( CLEAR ?auto_11391 ) ( not ( = ?auto_11390 ?auto_11391 ) ) ( not ( = ?auto_11390 ?auto_11409 ) ) ( not ( = ?auto_11391 ?auto_11409 ) ) ( not ( = ?auto_11398 ?auto_11411 ) ) ( IS-CRATE ?auto_11390 ) ( not ( = ?auto_11408 ?auto_11396 ) ) ( HOIST-AT ?auto_11404 ?auto_11408 ) ( AVAILABLE ?auto_11404 ) ( SURFACE-AT ?auto_11390 ?auto_11408 ) ( ON ?auto_11390 ?auto_11407 ) ( CLEAR ?auto_11390 ) ( not ( = ?auto_11389 ?auto_11390 ) ) ( not ( = ?auto_11389 ?auto_11407 ) ) ( not ( = ?auto_11390 ?auto_11407 ) ) ( not ( = ?auto_11398 ?auto_11404 ) ) ( IS-CRATE ?auto_11389 ) ( not ( = ?auto_11403 ?auto_11396 ) ) ( HOIST-AT ?auto_11400 ?auto_11403 ) ( AVAILABLE ?auto_11400 ) ( SURFACE-AT ?auto_11389 ?auto_11403 ) ( ON ?auto_11389 ?auto_11402 ) ( CLEAR ?auto_11389 ) ( not ( = ?auto_11388 ?auto_11389 ) ) ( not ( = ?auto_11388 ?auto_11402 ) ) ( not ( = ?auto_11389 ?auto_11402 ) ) ( not ( = ?auto_11398 ?auto_11400 ) ) ( SURFACE-AT ?auto_11387 ?auto_11396 ) ( CLEAR ?auto_11387 ) ( IS-CRATE ?auto_11388 ) ( AVAILABLE ?auto_11398 ) ( not ( = ?auto_11406 ?auto_11396 ) ) ( HOIST-AT ?auto_11405 ?auto_11406 ) ( AVAILABLE ?auto_11405 ) ( SURFACE-AT ?auto_11388 ?auto_11406 ) ( ON ?auto_11388 ?auto_11414 ) ( CLEAR ?auto_11388 ) ( TRUCK-AT ?auto_11399 ?auto_11396 ) ( not ( = ?auto_11387 ?auto_11388 ) ) ( not ( = ?auto_11387 ?auto_11414 ) ) ( not ( = ?auto_11388 ?auto_11414 ) ) ( not ( = ?auto_11398 ?auto_11405 ) ) ( not ( = ?auto_11387 ?auto_11389 ) ) ( not ( = ?auto_11387 ?auto_11402 ) ) ( not ( = ?auto_11389 ?auto_11414 ) ) ( not ( = ?auto_11403 ?auto_11406 ) ) ( not ( = ?auto_11400 ?auto_11405 ) ) ( not ( = ?auto_11402 ?auto_11414 ) ) ( not ( = ?auto_11387 ?auto_11390 ) ) ( not ( = ?auto_11387 ?auto_11407 ) ) ( not ( = ?auto_11388 ?auto_11390 ) ) ( not ( = ?auto_11388 ?auto_11407 ) ) ( not ( = ?auto_11390 ?auto_11402 ) ) ( not ( = ?auto_11390 ?auto_11414 ) ) ( not ( = ?auto_11408 ?auto_11403 ) ) ( not ( = ?auto_11408 ?auto_11406 ) ) ( not ( = ?auto_11404 ?auto_11400 ) ) ( not ( = ?auto_11404 ?auto_11405 ) ) ( not ( = ?auto_11407 ?auto_11402 ) ) ( not ( = ?auto_11407 ?auto_11414 ) ) ( not ( = ?auto_11387 ?auto_11391 ) ) ( not ( = ?auto_11387 ?auto_11409 ) ) ( not ( = ?auto_11388 ?auto_11391 ) ) ( not ( = ?auto_11388 ?auto_11409 ) ) ( not ( = ?auto_11389 ?auto_11391 ) ) ( not ( = ?auto_11389 ?auto_11409 ) ) ( not ( = ?auto_11391 ?auto_11407 ) ) ( not ( = ?auto_11391 ?auto_11402 ) ) ( not ( = ?auto_11391 ?auto_11414 ) ) ( not ( = ?auto_11410 ?auto_11408 ) ) ( not ( = ?auto_11410 ?auto_11403 ) ) ( not ( = ?auto_11410 ?auto_11406 ) ) ( not ( = ?auto_11411 ?auto_11404 ) ) ( not ( = ?auto_11411 ?auto_11400 ) ) ( not ( = ?auto_11411 ?auto_11405 ) ) ( not ( = ?auto_11409 ?auto_11407 ) ) ( not ( = ?auto_11409 ?auto_11402 ) ) ( not ( = ?auto_11409 ?auto_11414 ) ) ( not ( = ?auto_11387 ?auto_11392 ) ) ( not ( = ?auto_11387 ?auto_11412 ) ) ( not ( = ?auto_11388 ?auto_11392 ) ) ( not ( = ?auto_11388 ?auto_11412 ) ) ( not ( = ?auto_11389 ?auto_11392 ) ) ( not ( = ?auto_11389 ?auto_11412 ) ) ( not ( = ?auto_11390 ?auto_11392 ) ) ( not ( = ?auto_11390 ?auto_11412 ) ) ( not ( = ?auto_11392 ?auto_11409 ) ) ( not ( = ?auto_11392 ?auto_11407 ) ) ( not ( = ?auto_11392 ?auto_11402 ) ) ( not ( = ?auto_11392 ?auto_11414 ) ) ( not ( = ?auto_11413 ?auto_11410 ) ) ( not ( = ?auto_11413 ?auto_11408 ) ) ( not ( = ?auto_11413 ?auto_11403 ) ) ( not ( = ?auto_11413 ?auto_11406 ) ) ( not ( = ?auto_11401 ?auto_11411 ) ) ( not ( = ?auto_11401 ?auto_11404 ) ) ( not ( = ?auto_11401 ?auto_11400 ) ) ( not ( = ?auto_11401 ?auto_11405 ) ) ( not ( = ?auto_11412 ?auto_11409 ) ) ( not ( = ?auto_11412 ?auto_11407 ) ) ( not ( = ?auto_11412 ?auto_11402 ) ) ( not ( = ?auto_11412 ?auto_11414 ) ) ( not ( = ?auto_11387 ?auto_11393 ) ) ( not ( = ?auto_11387 ?auto_11397 ) ) ( not ( = ?auto_11388 ?auto_11393 ) ) ( not ( = ?auto_11388 ?auto_11397 ) ) ( not ( = ?auto_11389 ?auto_11393 ) ) ( not ( = ?auto_11389 ?auto_11397 ) ) ( not ( = ?auto_11390 ?auto_11393 ) ) ( not ( = ?auto_11390 ?auto_11397 ) ) ( not ( = ?auto_11391 ?auto_11393 ) ) ( not ( = ?auto_11391 ?auto_11397 ) ) ( not ( = ?auto_11393 ?auto_11412 ) ) ( not ( = ?auto_11393 ?auto_11409 ) ) ( not ( = ?auto_11393 ?auto_11407 ) ) ( not ( = ?auto_11393 ?auto_11402 ) ) ( not ( = ?auto_11393 ?auto_11414 ) ) ( not ( = ?auto_11395 ?auto_11413 ) ) ( not ( = ?auto_11395 ?auto_11410 ) ) ( not ( = ?auto_11395 ?auto_11408 ) ) ( not ( = ?auto_11395 ?auto_11403 ) ) ( not ( = ?auto_11395 ?auto_11406 ) ) ( not ( = ?auto_11394 ?auto_11401 ) ) ( not ( = ?auto_11394 ?auto_11411 ) ) ( not ( = ?auto_11394 ?auto_11404 ) ) ( not ( = ?auto_11394 ?auto_11400 ) ) ( not ( = ?auto_11394 ?auto_11405 ) ) ( not ( = ?auto_11397 ?auto_11412 ) ) ( not ( = ?auto_11397 ?auto_11409 ) ) ( not ( = ?auto_11397 ?auto_11407 ) ) ( not ( = ?auto_11397 ?auto_11402 ) ) ( not ( = ?auto_11397 ?auto_11414 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_11387 ?auto_11388 ?auto_11389 ?auto_11390 ?auto_11391 ?auto_11392 )
      ( MAKE-1CRATE ?auto_11392 ?auto_11393 )
      ( MAKE-6CRATE-VERIFY ?auto_11387 ?auto_11388 ?auto_11389 ?auto_11390 ?auto_11391 ?auto_11392 ?auto_11393 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_11433 - SURFACE
      ?auto_11434 - SURFACE
      ?auto_11435 - SURFACE
      ?auto_11436 - SURFACE
      ?auto_11437 - SURFACE
      ?auto_11438 - SURFACE
      ?auto_11439 - SURFACE
      ?auto_11440 - SURFACE
    )
    :vars
    (
      ?auto_11444 - HOIST
      ?auto_11446 - PLACE
      ?auto_11445 - PLACE
      ?auto_11441 - HOIST
      ?auto_11442 - SURFACE
      ?auto_11462 - PLACE
      ?auto_11455 - HOIST
      ?auto_11452 - SURFACE
      ?auto_11449 - PLACE
      ?auto_11448 - HOIST
      ?auto_11451 - SURFACE
      ?auto_11458 - PLACE
      ?auto_11464 - HOIST
      ?auto_11447 - SURFACE
      ?auto_11457 - PLACE
      ?auto_11460 - HOIST
      ?auto_11456 - SURFACE
      ?auto_11463 - PLACE
      ?auto_11459 - HOIST
      ?auto_11454 - SURFACE
      ?auto_11461 - PLACE
      ?auto_11450 - HOIST
      ?auto_11453 - SURFACE
      ?auto_11443 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11444 ?auto_11446 ) ( IS-CRATE ?auto_11440 ) ( not ( = ?auto_11445 ?auto_11446 ) ) ( HOIST-AT ?auto_11441 ?auto_11445 ) ( AVAILABLE ?auto_11441 ) ( SURFACE-AT ?auto_11440 ?auto_11445 ) ( ON ?auto_11440 ?auto_11442 ) ( CLEAR ?auto_11440 ) ( not ( = ?auto_11439 ?auto_11440 ) ) ( not ( = ?auto_11439 ?auto_11442 ) ) ( not ( = ?auto_11440 ?auto_11442 ) ) ( not ( = ?auto_11444 ?auto_11441 ) ) ( IS-CRATE ?auto_11439 ) ( not ( = ?auto_11462 ?auto_11446 ) ) ( HOIST-AT ?auto_11455 ?auto_11462 ) ( AVAILABLE ?auto_11455 ) ( SURFACE-AT ?auto_11439 ?auto_11462 ) ( ON ?auto_11439 ?auto_11452 ) ( CLEAR ?auto_11439 ) ( not ( = ?auto_11438 ?auto_11439 ) ) ( not ( = ?auto_11438 ?auto_11452 ) ) ( not ( = ?auto_11439 ?auto_11452 ) ) ( not ( = ?auto_11444 ?auto_11455 ) ) ( IS-CRATE ?auto_11438 ) ( not ( = ?auto_11449 ?auto_11446 ) ) ( HOIST-AT ?auto_11448 ?auto_11449 ) ( AVAILABLE ?auto_11448 ) ( SURFACE-AT ?auto_11438 ?auto_11449 ) ( ON ?auto_11438 ?auto_11451 ) ( CLEAR ?auto_11438 ) ( not ( = ?auto_11437 ?auto_11438 ) ) ( not ( = ?auto_11437 ?auto_11451 ) ) ( not ( = ?auto_11438 ?auto_11451 ) ) ( not ( = ?auto_11444 ?auto_11448 ) ) ( IS-CRATE ?auto_11437 ) ( not ( = ?auto_11458 ?auto_11446 ) ) ( HOIST-AT ?auto_11464 ?auto_11458 ) ( AVAILABLE ?auto_11464 ) ( SURFACE-AT ?auto_11437 ?auto_11458 ) ( ON ?auto_11437 ?auto_11447 ) ( CLEAR ?auto_11437 ) ( not ( = ?auto_11436 ?auto_11437 ) ) ( not ( = ?auto_11436 ?auto_11447 ) ) ( not ( = ?auto_11437 ?auto_11447 ) ) ( not ( = ?auto_11444 ?auto_11464 ) ) ( IS-CRATE ?auto_11436 ) ( not ( = ?auto_11457 ?auto_11446 ) ) ( HOIST-AT ?auto_11460 ?auto_11457 ) ( AVAILABLE ?auto_11460 ) ( SURFACE-AT ?auto_11436 ?auto_11457 ) ( ON ?auto_11436 ?auto_11456 ) ( CLEAR ?auto_11436 ) ( not ( = ?auto_11435 ?auto_11436 ) ) ( not ( = ?auto_11435 ?auto_11456 ) ) ( not ( = ?auto_11436 ?auto_11456 ) ) ( not ( = ?auto_11444 ?auto_11460 ) ) ( IS-CRATE ?auto_11435 ) ( not ( = ?auto_11463 ?auto_11446 ) ) ( HOIST-AT ?auto_11459 ?auto_11463 ) ( AVAILABLE ?auto_11459 ) ( SURFACE-AT ?auto_11435 ?auto_11463 ) ( ON ?auto_11435 ?auto_11454 ) ( CLEAR ?auto_11435 ) ( not ( = ?auto_11434 ?auto_11435 ) ) ( not ( = ?auto_11434 ?auto_11454 ) ) ( not ( = ?auto_11435 ?auto_11454 ) ) ( not ( = ?auto_11444 ?auto_11459 ) ) ( SURFACE-AT ?auto_11433 ?auto_11446 ) ( CLEAR ?auto_11433 ) ( IS-CRATE ?auto_11434 ) ( AVAILABLE ?auto_11444 ) ( not ( = ?auto_11461 ?auto_11446 ) ) ( HOIST-AT ?auto_11450 ?auto_11461 ) ( AVAILABLE ?auto_11450 ) ( SURFACE-AT ?auto_11434 ?auto_11461 ) ( ON ?auto_11434 ?auto_11453 ) ( CLEAR ?auto_11434 ) ( TRUCK-AT ?auto_11443 ?auto_11446 ) ( not ( = ?auto_11433 ?auto_11434 ) ) ( not ( = ?auto_11433 ?auto_11453 ) ) ( not ( = ?auto_11434 ?auto_11453 ) ) ( not ( = ?auto_11444 ?auto_11450 ) ) ( not ( = ?auto_11433 ?auto_11435 ) ) ( not ( = ?auto_11433 ?auto_11454 ) ) ( not ( = ?auto_11435 ?auto_11453 ) ) ( not ( = ?auto_11463 ?auto_11461 ) ) ( not ( = ?auto_11459 ?auto_11450 ) ) ( not ( = ?auto_11454 ?auto_11453 ) ) ( not ( = ?auto_11433 ?auto_11436 ) ) ( not ( = ?auto_11433 ?auto_11456 ) ) ( not ( = ?auto_11434 ?auto_11436 ) ) ( not ( = ?auto_11434 ?auto_11456 ) ) ( not ( = ?auto_11436 ?auto_11454 ) ) ( not ( = ?auto_11436 ?auto_11453 ) ) ( not ( = ?auto_11457 ?auto_11463 ) ) ( not ( = ?auto_11457 ?auto_11461 ) ) ( not ( = ?auto_11460 ?auto_11459 ) ) ( not ( = ?auto_11460 ?auto_11450 ) ) ( not ( = ?auto_11456 ?auto_11454 ) ) ( not ( = ?auto_11456 ?auto_11453 ) ) ( not ( = ?auto_11433 ?auto_11437 ) ) ( not ( = ?auto_11433 ?auto_11447 ) ) ( not ( = ?auto_11434 ?auto_11437 ) ) ( not ( = ?auto_11434 ?auto_11447 ) ) ( not ( = ?auto_11435 ?auto_11437 ) ) ( not ( = ?auto_11435 ?auto_11447 ) ) ( not ( = ?auto_11437 ?auto_11456 ) ) ( not ( = ?auto_11437 ?auto_11454 ) ) ( not ( = ?auto_11437 ?auto_11453 ) ) ( not ( = ?auto_11458 ?auto_11457 ) ) ( not ( = ?auto_11458 ?auto_11463 ) ) ( not ( = ?auto_11458 ?auto_11461 ) ) ( not ( = ?auto_11464 ?auto_11460 ) ) ( not ( = ?auto_11464 ?auto_11459 ) ) ( not ( = ?auto_11464 ?auto_11450 ) ) ( not ( = ?auto_11447 ?auto_11456 ) ) ( not ( = ?auto_11447 ?auto_11454 ) ) ( not ( = ?auto_11447 ?auto_11453 ) ) ( not ( = ?auto_11433 ?auto_11438 ) ) ( not ( = ?auto_11433 ?auto_11451 ) ) ( not ( = ?auto_11434 ?auto_11438 ) ) ( not ( = ?auto_11434 ?auto_11451 ) ) ( not ( = ?auto_11435 ?auto_11438 ) ) ( not ( = ?auto_11435 ?auto_11451 ) ) ( not ( = ?auto_11436 ?auto_11438 ) ) ( not ( = ?auto_11436 ?auto_11451 ) ) ( not ( = ?auto_11438 ?auto_11447 ) ) ( not ( = ?auto_11438 ?auto_11456 ) ) ( not ( = ?auto_11438 ?auto_11454 ) ) ( not ( = ?auto_11438 ?auto_11453 ) ) ( not ( = ?auto_11449 ?auto_11458 ) ) ( not ( = ?auto_11449 ?auto_11457 ) ) ( not ( = ?auto_11449 ?auto_11463 ) ) ( not ( = ?auto_11449 ?auto_11461 ) ) ( not ( = ?auto_11448 ?auto_11464 ) ) ( not ( = ?auto_11448 ?auto_11460 ) ) ( not ( = ?auto_11448 ?auto_11459 ) ) ( not ( = ?auto_11448 ?auto_11450 ) ) ( not ( = ?auto_11451 ?auto_11447 ) ) ( not ( = ?auto_11451 ?auto_11456 ) ) ( not ( = ?auto_11451 ?auto_11454 ) ) ( not ( = ?auto_11451 ?auto_11453 ) ) ( not ( = ?auto_11433 ?auto_11439 ) ) ( not ( = ?auto_11433 ?auto_11452 ) ) ( not ( = ?auto_11434 ?auto_11439 ) ) ( not ( = ?auto_11434 ?auto_11452 ) ) ( not ( = ?auto_11435 ?auto_11439 ) ) ( not ( = ?auto_11435 ?auto_11452 ) ) ( not ( = ?auto_11436 ?auto_11439 ) ) ( not ( = ?auto_11436 ?auto_11452 ) ) ( not ( = ?auto_11437 ?auto_11439 ) ) ( not ( = ?auto_11437 ?auto_11452 ) ) ( not ( = ?auto_11439 ?auto_11451 ) ) ( not ( = ?auto_11439 ?auto_11447 ) ) ( not ( = ?auto_11439 ?auto_11456 ) ) ( not ( = ?auto_11439 ?auto_11454 ) ) ( not ( = ?auto_11439 ?auto_11453 ) ) ( not ( = ?auto_11462 ?auto_11449 ) ) ( not ( = ?auto_11462 ?auto_11458 ) ) ( not ( = ?auto_11462 ?auto_11457 ) ) ( not ( = ?auto_11462 ?auto_11463 ) ) ( not ( = ?auto_11462 ?auto_11461 ) ) ( not ( = ?auto_11455 ?auto_11448 ) ) ( not ( = ?auto_11455 ?auto_11464 ) ) ( not ( = ?auto_11455 ?auto_11460 ) ) ( not ( = ?auto_11455 ?auto_11459 ) ) ( not ( = ?auto_11455 ?auto_11450 ) ) ( not ( = ?auto_11452 ?auto_11451 ) ) ( not ( = ?auto_11452 ?auto_11447 ) ) ( not ( = ?auto_11452 ?auto_11456 ) ) ( not ( = ?auto_11452 ?auto_11454 ) ) ( not ( = ?auto_11452 ?auto_11453 ) ) ( not ( = ?auto_11433 ?auto_11440 ) ) ( not ( = ?auto_11433 ?auto_11442 ) ) ( not ( = ?auto_11434 ?auto_11440 ) ) ( not ( = ?auto_11434 ?auto_11442 ) ) ( not ( = ?auto_11435 ?auto_11440 ) ) ( not ( = ?auto_11435 ?auto_11442 ) ) ( not ( = ?auto_11436 ?auto_11440 ) ) ( not ( = ?auto_11436 ?auto_11442 ) ) ( not ( = ?auto_11437 ?auto_11440 ) ) ( not ( = ?auto_11437 ?auto_11442 ) ) ( not ( = ?auto_11438 ?auto_11440 ) ) ( not ( = ?auto_11438 ?auto_11442 ) ) ( not ( = ?auto_11440 ?auto_11452 ) ) ( not ( = ?auto_11440 ?auto_11451 ) ) ( not ( = ?auto_11440 ?auto_11447 ) ) ( not ( = ?auto_11440 ?auto_11456 ) ) ( not ( = ?auto_11440 ?auto_11454 ) ) ( not ( = ?auto_11440 ?auto_11453 ) ) ( not ( = ?auto_11445 ?auto_11462 ) ) ( not ( = ?auto_11445 ?auto_11449 ) ) ( not ( = ?auto_11445 ?auto_11458 ) ) ( not ( = ?auto_11445 ?auto_11457 ) ) ( not ( = ?auto_11445 ?auto_11463 ) ) ( not ( = ?auto_11445 ?auto_11461 ) ) ( not ( = ?auto_11441 ?auto_11455 ) ) ( not ( = ?auto_11441 ?auto_11448 ) ) ( not ( = ?auto_11441 ?auto_11464 ) ) ( not ( = ?auto_11441 ?auto_11460 ) ) ( not ( = ?auto_11441 ?auto_11459 ) ) ( not ( = ?auto_11441 ?auto_11450 ) ) ( not ( = ?auto_11442 ?auto_11452 ) ) ( not ( = ?auto_11442 ?auto_11451 ) ) ( not ( = ?auto_11442 ?auto_11447 ) ) ( not ( = ?auto_11442 ?auto_11456 ) ) ( not ( = ?auto_11442 ?auto_11454 ) ) ( not ( = ?auto_11442 ?auto_11453 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_11433 ?auto_11434 ?auto_11435 ?auto_11436 ?auto_11437 ?auto_11438 ?auto_11439 )
      ( MAKE-1CRATE ?auto_11439 ?auto_11440 )
      ( MAKE-7CRATE-VERIFY ?auto_11433 ?auto_11434 ?auto_11435 ?auto_11436 ?auto_11437 ?auto_11438 ?auto_11439 ?auto_11440 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_11484 - SURFACE
      ?auto_11485 - SURFACE
      ?auto_11486 - SURFACE
      ?auto_11487 - SURFACE
      ?auto_11488 - SURFACE
      ?auto_11489 - SURFACE
      ?auto_11490 - SURFACE
      ?auto_11491 - SURFACE
      ?auto_11492 - SURFACE
    )
    :vars
    (
      ?auto_11493 - HOIST
      ?auto_11494 - PLACE
      ?auto_11497 - PLACE
      ?auto_11498 - HOIST
      ?auto_11496 - SURFACE
      ?auto_11502 - PLACE
      ?auto_11500 - HOIST
      ?auto_11510 - SURFACE
      ?auto_11505 - PLACE
      ?auto_11501 - HOIST
      ?auto_11516 - SURFACE
      ?auto_11511 - PLACE
      ?auto_11503 - HOIST
      ?auto_11515 - SURFACE
      ?auto_11507 - PLACE
      ?auto_11509 - HOIST
      ?auto_11512 - SURFACE
      ?auto_11513 - PLACE
      ?auto_11499 - HOIST
      ?auto_11506 - SURFACE
      ?auto_11508 - SURFACE
      ?auto_11504 - PLACE
      ?auto_11517 - HOIST
      ?auto_11514 - SURFACE
      ?auto_11495 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11493 ?auto_11494 ) ( IS-CRATE ?auto_11492 ) ( not ( = ?auto_11497 ?auto_11494 ) ) ( HOIST-AT ?auto_11498 ?auto_11497 ) ( SURFACE-AT ?auto_11492 ?auto_11497 ) ( ON ?auto_11492 ?auto_11496 ) ( CLEAR ?auto_11492 ) ( not ( = ?auto_11491 ?auto_11492 ) ) ( not ( = ?auto_11491 ?auto_11496 ) ) ( not ( = ?auto_11492 ?auto_11496 ) ) ( not ( = ?auto_11493 ?auto_11498 ) ) ( IS-CRATE ?auto_11491 ) ( not ( = ?auto_11502 ?auto_11494 ) ) ( HOIST-AT ?auto_11500 ?auto_11502 ) ( AVAILABLE ?auto_11500 ) ( SURFACE-AT ?auto_11491 ?auto_11502 ) ( ON ?auto_11491 ?auto_11510 ) ( CLEAR ?auto_11491 ) ( not ( = ?auto_11490 ?auto_11491 ) ) ( not ( = ?auto_11490 ?auto_11510 ) ) ( not ( = ?auto_11491 ?auto_11510 ) ) ( not ( = ?auto_11493 ?auto_11500 ) ) ( IS-CRATE ?auto_11490 ) ( not ( = ?auto_11505 ?auto_11494 ) ) ( HOIST-AT ?auto_11501 ?auto_11505 ) ( AVAILABLE ?auto_11501 ) ( SURFACE-AT ?auto_11490 ?auto_11505 ) ( ON ?auto_11490 ?auto_11516 ) ( CLEAR ?auto_11490 ) ( not ( = ?auto_11489 ?auto_11490 ) ) ( not ( = ?auto_11489 ?auto_11516 ) ) ( not ( = ?auto_11490 ?auto_11516 ) ) ( not ( = ?auto_11493 ?auto_11501 ) ) ( IS-CRATE ?auto_11489 ) ( not ( = ?auto_11511 ?auto_11494 ) ) ( HOIST-AT ?auto_11503 ?auto_11511 ) ( AVAILABLE ?auto_11503 ) ( SURFACE-AT ?auto_11489 ?auto_11511 ) ( ON ?auto_11489 ?auto_11515 ) ( CLEAR ?auto_11489 ) ( not ( = ?auto_11488 ?auto_11489 ) ) ( not ( = ?auto_11488 ?auto_11515 ) ) ( not ( = ?auto_11489 ?auto_11515 ) ) ( not ( = ?auto_11493 ?auto_11503 ) ) ( IS-CRATE ?auto_11488 ) ( not ( = ?auto_11507 ?auto_11494 ) ) ( HOIST-AT ?auto_11509 ?auto_11507 ) ( AVAILABLE ?auto_11509 ) ( SURFACE-AT ?auto_11488 ?auto_11507 ) ( ON ?auto_11488 ?auto_11512 ) ( CLEAR ?auto_11488 ) ( not ( = ?auto_11487 ?auto_11488 ) ) ( not ( = ?auto_11487 ?auto_11512 ) ) ( not ( = ?auto_11488 ?auto_11512 ) ) ( not ( = ?auto_11493 ?auto_11509 ) ) ( IS-CRATE ?auto_11487 ) ( not ( = ?auto_11513 ?auto_11494 ) ) ( HOIST-AT ?auto_11499 ?auto_11513 ) ( AVAILABLE ?auto_11499 ) ( SURFACE-AT ?auto_11487 ?auto_11513 ) ( ON ?auto_11487 ?auto_11506 ) ( CLEAR ?auto_11487 ) ( not ( = ?auto_11486 ?auto_11487 ) ) ( not ( = ?auto_11486 ?auto_11506 ) ) ( not ( = ?auto_11487 ?auto_11506 ) ) ( not ( = ?auto_11493 ?auto_11499 ) ) ( IS-CRATE ?auto_11486 ) ( AVAILABLE ?auto_11498 ) ( SURFACE-AT ?auto_11486 ?auto_11497 ) ( ON ?auto_11486 ?auto_11508 ) ( CLEAR ?auto_11486 ) ( not ( = ?auto_11485 ?auto_11486 ) ) ( not ( = ?auto_11485 ?auto_11508 ) ) ( not ( = ?auto_11486 ?auto_11508 ) ) ( SURFACE-AT ?auto_11484 ?auto_11494 ) ( CLEAR ?auto_11484 ) ( IS-CRATE ?auto_11485 ) ( AVAILABLE ?auto_11493 ) ( not ( = ?auto_11504 ?auto_11494 ) ) ( HOIST-AT ?auto_11517 ?auto_11504 ) ( AVAILABLE ?auto_11517 ) ( SURFACE-AT ?auto_11485 ?auto_11504 ) ( ON ?auto_11485 ?auto_11514 ) ( CLEAR ?auto_11485 ) ( TRUCK-AT ?auto_11495 ?auto_11494 ) ( not ( = ?auto_11484 ?auto_11485 ) ) ( not ( = ?auto_11484 ?auto_11514 ) ) ( not ( = ?auto_11485 ?auto_11514 ) ) ( not ( = ?auto_11493 ?auto_11517 ) ) ( not ( = ?auto_11484 ?auto_11486 ) ) ( not ( = ?auto_11484 ?auto_11508 ) ) ( not ( = ?auto_11486 ?auto_11514 ) ) ( not ( = ?auto_11497 ?auto_11504 ) ) ( not ( = ?auto_11498 ?auto_11517 ) ) ( not ( = ?auto_11508 ?auto_11514 ) ) ( not ( = ?auto_11484 ?auto_11487 ) ) ( not ( = ?auto_11484 ?auto_11506 ) ) ( not ( = ?auto_11485 ?auto_11487 ) ) ( not ( = ?auto_11485 ?auto_11506 ) ) ( not ( = ?auto_11487 ?auto_11508 ) ) ( not ( = ?auto_11487 ?auto_11514 ) ) ( not ( = ?auto_11513 ?auto_11497 ) ) ( not ( = ?auto_11513 ?auto_11504 ) ) ( not ( = ?auto_11499 ?auto_11498 ) ) ( not ( = ?auto_11499 ?auto_11517 ) ) ( not ( = ?auto_11506 ?auto_11508 ) ) ( not ( = ?auto_11506 ?auto_11514 ) ) ( not ( = ?auto_11484 ?auto_11488 ) ) ( not ( = ?auto_11484 ?auto_11512 ) ) ( not ( = ?auto_11485 ?auto_11488 ) ) ( not ( = ?auto_11485 ?auto_11512 ) ) ( not ( = ?auto_11486 ?auto_11488 ) ) ( not ( = ?auto_11486 ?auto_11512 ) ) ( not ( = ?auto_11488 ?auto_11506 ) ) ( not ( = ?auto_11488 ?auto_11508 ) ) ( not ( = ?auto_11488 ?auto_11514 ) ) ( not ( = ?auto_11507 ?auto_11513 ) ) ( not ( = ?auto_11507 ?auto_11497 ) ) ( not ( = ?auto_11507 ?auto_11504 ) ) ( not ( = ?auto_11509 ?auto_11499 ) ) ( not ( = ?auto_11509 ?auto_11498 ) ) ( not ( = ?auto_11509 ?auto_11517 ) ) ( not ( = ?auto_11512 ?auto_11506 ) ) ( not ( = ?auto_11512 ?auto_11508 ) ) ( not ( = ?auto_11512 ?auto_11514 ) ) ( not ( = ?auto_11484 ?auto_11489 ) ) ( not ( = ?auto_11484 ?auto_11515 ) ) ( not ( = ?auto_11485 ?auto_11489 ) ) ( not ( = ?auto_11485 ?auto_11515 ) ) ( not ( = ?auto_11486 ?auto_11489 ) ) ( not ( = ?auto_11486 ?auto_11515 ) ) ( not ( = ?auto_11487 ?auto_11489 ) ) ( not ( = ?auto_11487 ?auto_11515 ) ) ( not ( = ?auto_11489 ?auto_11512 ) ) ( not ( = ?auto_11489 ?auto_11506 ) ) ( not ( = ?auto_11489 ?auto_11508 ) ) ( not ( = ?auto_11489 ?auto_11514 ) ) ( not ( = ?auto_11511 ?auto_11507 ) ) ( not ( = ?auto_11511 ?auto_11513 ) ) ( not ( = ?auto_11511 ?auto_11497 ) ) ( not ( = ?auto_11511 ?auto_11504 ) ) ( not ( = ?auto_11503 ?auto_11509 ) ) ( not ( = ?auto_11503 ?auto_11499 ) ) ( not ( = ?auto_11503 ?auto_11498 ) ) ( not ( = ?auto_11503 ?auto_11517 ) ) ( not ( = ?auto_11515 ?auto_11512 ) ) ( not ( = ?auto_11515 ?auto_11506 ) ) ( not ( = ?auto_11515 ?auto_11508 ) ) ( not ( = ?auto_11515 ?auto_11514 ) ) ( not ( = ?auto_11484 ?auto_11490 ) ) ( not ( = ?auto_11484 ?auto_11516 ) ) ( not ( = ?auto_11485 ?auto_11490 ) ) ( not ( = ?auto_11485 ?auto_11516 ) ) ( not ( = ?auto_11486 ?auto_11490 ) ) ( not ( = ?auto_11486 ?auto_11516 ) ) ( not ( = ?auto_11487 ?auto_11490 ) ) ( not ( = ?auto_11487 ?auto_11516 ) ) ( not ( = ?auto_11488 ?auto_11490 ) ) ( not ( = ?auto_11488 ?auto_11516 ) ) ( not ( = ?auto_11490 ?auto_11515 ) ) ( not ( = ?auto_11490 ?auto_11512 ) ) ( not ( = ?auto_11490 ?auto_11506 ) ) ( not ( = ?auto_11490 ?auto_11508 ) ) ( not ( = ?auto_11490 ?auto_11514 ) ) ( not ( = ?auto_11505 ?auto_11511 ) ) ( not ( = ?auto_11505 ?auto_11507 ) ) ( not ( = ?auto_11505 ?auto_11513 ) ) ( not ( = ?auto_11505 ?auto_11497 ) ) ( not ( = ?auto_11505 ?auto_11504 ) ) ( not ( = ?auto_11501 ?auto_11503 ) ) ( not ( = ?auto_11501 ?auto_11509 ) ) ( not ( = ?auto_11501 ?auto_11499 ) ) ( not ( = ?auto_11501 ?auto_11498 ) ) ( not ( = ?auto_11501 ?auto_11517 ) ) ( not ( = ?auto_11516 ?auto_11515 ) ) ( not ( = ?auto_11516 ?auto_11512 ) ) ( not ( = ?auto_11516 ?auto_11506 ) ) ( not ( = ?auto_11516 ?auto_11508 ) ) ( not ( = ?auto_11516 ?auto_11514 ) ) ( not ( = ?auto_11484 ?auto_11491 ) ) ( not ( = ?auto_11484 ?auto_11510 ) ) ( not ( = ?auto_11485 ?auto_11491 ) ) ( not ( = ?auto_11485 ?auto_11510 ) ) ( not ( = ?auto_11486 ?auto_11491 ) ) ( not ( = ?auto_11486 ?auto_11510 ) ) ( not ( = ?auto_11487 ?auto_11491 ) ) ( not ( = ?auto_11487 ?auto_11510 ) ) ( not ( = ?auto_11488 ?auto_11491 ) ) ( not ( = ?auto_11488 ?auto_11510 ) ) ( not ( = ?auto_11489 ?auto_11491 ) ) ( not ( = ?auto_11489 ?auto_11510 ) ) ( not ( = ?auto_11491 ?auto_11516 ) ) ( not ( = ?auto_11491 ?auto_11515 ) ) ( not ( = ?auto_11491 ?auto_11512 ) ) ( not ( = ?auto_11491 ?auto_11506 ) ) ( not ( = ?auto_11491 ?auto_11508 ) ) ( not ( = ?auto_11491 ?auto_11514 ) ) ( not ( = ?auto_11502 ?auto_11505 ) ) ( not ( = ?auto_11502 ?auto_11511 ) ) ( not ( = ?auto_11502 ?auto_11507 ) ) ( not ( = ?auto_11502 ?auto_11513 ) ) ( not ( = ?auto_11502 ?auto_11497 ) ) ( not ( = ?auto_11502 ?auto_11504 ) ) ( not ( = ?auto_11500 ?auto_11501 ) ) ( not ( = ?auto_11500 ?auto_11503 ) ) ( not ( = ?auto_11500 ?auto_11509 ) ) ( not ( = ?auto_11500 ?auto_11499 ) ) ( not ( = ?auto_11500 ?auto_11498 ) ) ( not ( = ?auto_11500 ?auto_11517 ) ) ( not ( = ?auto_11510 ?auto_11516 ) ) ( not ( = ?auto_11510 ?auto_11515 ) ) ( not ( = ?auto_11510 ?auto_11512 ) ) ( not ( = ?auto_11510 ?auto_11506 ) ) ( not ( = ?auto_11510 ?auto_11508 ) ) ( not ( = ?auto_11510 ?auto_11514 ) ) ( not ( = ?auto_11484 ?auto_11492 ) ) ( not ( = ?auto_11484 ?auto_11496 ) ) ( not ( = ?auto_11485 ?auto_11492 ) ) ( not ( = ?auto_11485 ?auto_11496 ) ) ( not ( = ?auto_11486 ?auto_11492 ) ) ( not ( = ?auto_11486 ?auto_11496 ) ) ( not ( = ?auto_11487 ?auto_11492 ) ) ( not ( = ?auto_11487 ?auto_11496 ) ) ( not ( = ?auto_11488 ?auto_11492 ) ) ( not ( = ?auto_11488 ?auto_11496 ) ) ( not ( = ?auto_11489 ?auto_11492 ) ) ( not ( = ?auto_11489 ?auto_11496 ) ) ( not ( = ?auto_11490 ?auto_11492 ) ) ( not ( = ?auto_11490 ?auto_11496 ) ) ( not ( = ?auto_11492 ?auto_11510 ) ) ( not ( = ?auto_11492 ?auto_11516 ) ) ( not ( = ?auto_11492 ?auto_11515 ) ) ( not ( = ?auto_11492 ?auto_11512 ) ) ( not ( = ?auto_11492 ?auto_11506 ) ) ( not ( = ?auto_11492 ?auto_11508 ) ) ( not ( = ?auto_11492 ?auto_11514 ) ) ( not ( = ?auto_11496 ?auto_11510 ) ) ( not ( = ?auto_11496 ?auto_11516 ) ) ( not ( = ?auto_11496 ?auto_11515 ) ) ( not ( = ?auto_11496 ?auto_11512 ) ) ( not ( = ?auto_11496 ?auto_11506 ) ) ( not ( = ?auto_11496 ?auto_11508 ) ) ( not ( = ?auto_11496 ?auto_11514 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_11484 ?auto_11485 ?auto_11486 ?auto_11487 ?auto_11488 ?auto_11489 ?auto_11490 ?auto_11491 )
      ( MAKE-1CRATE ?auto_11491 ?auto_11492 )
      ( MAKE-8CRATE-VERIFY ?auto_11484 ?auto_11485 ?auto_11486 ?auto_11487 ?auto_11488 ?auto_11489 ?auto_11490 ?auto_11491 ?auto_11492 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_11538 - SURFACE
      ?auto_11539 - SURFACE
      ?auto_11540 - SURFACE
      ?auto_11541 - SURFACE
      ?auto_11542 - SURFACE
      ?auto_11543 - SURFACE
      ?auto_11544 - SURFACE
      ?auto_11545 - SURFACE
      ?auto_11546 - SURFACE
      ?auto_11547 - SURFACE
    )
    :vars
    (
      ?auto_11551 - HOIST
      ?auto_11553 - PLACE
      ?auto_11552 - PLACE
      ?auto_11549 - HOIST
      ?auto_11548 - SURFACE
      ?auto_11557 - SURFACE
      ?auto_11561 - PLACE
      ?auto_11566 - HOIST
      ?auto_11558 - SURFACE
      ?auto_11564 - PLACE
      ?auto_11560 - HOIST
      ?auto_11573 - SURFACE
      ?auto_11569 - PLACE
      ?auto_11572 - HOIST
      ?auto_11565 - SURFACE
      ?auto_11571 - PLACE
      ?auto_11555 - HOIST
      ?auto_11556 - SURFACE
      ?auto_11570 - PLACE
      ?auto_11562 - HOIST
      ?auto_11559 - SURFACE
      ?auto_11567 - SURFACE
      ?auto_11554 - PLACE
      ?auto_11568 - HOIST
      ?auto_11563 - SURFACE
      ?auto_11550 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11551 ?auto_11553 ) ( IS-CRATE ?auto_11547 ) ( not ( = ?auto_11552 ?auto_11553 ) ) ( HOIST-AT ?auto_11549 ?auto_11552 ) ( SURFACE-AT ?auto_11547 ?auto_11552 ) ( ON ?auto_11547 ?auto_11548 ) ( CLEAR ?auto_11547 ) ( not ( = ?auto_11546 ?auto_11547 ) ) ( not ( = ?auto_11546 ?auto_11548 ) ) ( not ( = ?auto_11547 ?auto_11548 ) ) ( not ( = ?auto_11551 ?auto_11549 ) ) ( IS-CRATE ?auto_11546 ) ( SURFACE-AT ?auto_11546 ?auto_11552 ) ( ON ?auto_11546 ?auto_11557 ) ( CLEAR ?auto_11546 ) ( not ( = ?auto_11545 ?auto_11546 ) ) ( not ( = ?auto_11545 ?auto_11557 ) ) ( not ( = ?auto_11546 ?auto_11557 ) ) ( IS-CRATE ?auto_11545 ) ( not ( = ?auto_11561 ?auto_11553 ) ) ( HOIST-AT ?auto_11566 ?auto_11561 ) ( AVAILABLE ?auto_11566 ) ( SURFACE-AT ?auto_11545 ?auto_11561 ) ( ON ?auto_11545 ?auto_11558 ) ( CLEAR ?auto_11545 ) ( not ( = ?auto_11544 ?auto_11545 ) ) ( not ( = ?auto_11544 ?auto_11558 ) ) ( not ( = ?auto_11545 ?auto_11558 ) ) ( not ( = ?auto_11551 ?auto_11566 ) ) ( IS-CRATE ?auto_11544 ) ( not ( = ?auto_11564 ?auto_11553 ) ) ( HOIST-AT ?auto_11560 ?auto_11564 ) ( AVAILABLE ?auto_11560 ) ( SURFACE-AT ?auto_11544 ?auto_11564 ) ( ON ?auto_11544 ?auto_11573 ) ( CLEAR ?auto_11544 ) ( not ( = ?auto_11543 ?auto_11544 ) ) ( not ( = ?auto_11543 ?auto_11573 ) ) ( not ( = ?auto_11544 ?auto_11573 ) ) ( not ( = ?auto_11551 ?auto_11560 ) ) ( IS-CRATE ?auto_11543 ) ( not ( = ?auto_11569 ?auto_11553 ) ) ( HOIST-AT ?auto_11572 ?auto_11569 ) ( AVAILABLE ?auto_11572 ) ( SURFACE-AT ?auto_11543 ?auto_11569 ) ( ON ?auto_11543 ?auto_11565 ) ( CLEAR ?auto_11543 ) ( not ( = ?auto_11542 ?auto_11543 ) ) ( not ( = ?auto_11542 ?auto_11565 ) ) ( not ( = ?auto_11543 ?auto_11565 ) ) ( not ( = ?auto_11551 ?auto_11572 ) ) ( IS-CRATE ?auto_11542 ) ( not ( = ?auto_11571 ?auto_11553 ) ) ( HOIST-AT ?auto_11555 ?auto_11571 ) ( AVAILABLE ?auto_11555 ) ( SURFACE-AT ?auto_11542 ?auto_11571 ) ( ON ?auto_11542 ?auto_11556 ) ( CLEAR ?auto_11542 ) ( not ( = ?auto_11541 ?auto_11542 ) ) ( not ( = ?auto_11541 ?auto_11556 ) ) ( not ( = ?auto_11542 ?auto_11556 ) ) ( not ( = ?auto_11551 ?auto_11555 ) ) ( IS-CRATE ?auto_11541 ) ( not ( = ?auto_11570 ?auto_11553 ) ) ( HOIST-AT ?auto_11562 ?auto_11570 ) ( AVAILABLE ?auto_11562 ) ( SURFACE-AT ?auto_11541 ?auto_11570 ) ( ON ?auto_11541 ?auto_11559 ) ( CLEAR ?auto_11541 ) ( not ( = ?auto_11540 ?auto_11541 ) ) ( not ( = ?auto_11540 ?auto_11559 ) ) ( not ( = ?auto_11541 ?auto_11559 ) ) ( not ( = ?auto_11551 ?auto_11562 ) ) ( IS-CRATE ?auto_11540 ) ( AVAILABLE ?auto_11549 ) ( SURFACE-AT ?auto_11540 ?auto_11552 ) ( ON ?auto_11540 ?auto_11567 ) ( CLEAR ?auto_11540 ) ( not ( = ?auto_11539 ?auto_11540 ) ) ( not ( = ?auto_11539 ?auto_11567 ) ) ( not ( = ?auto_11540 ?auto_11567 ) ) ( SURFACE-AT ?auto_11538 ?auto_11553 ) ( CLEAR ?auto_11538 ) ( IS-CRATE ?auto_11539 ) ( AVAILABLE ?auto_11551 ) ( not ( = ?auto_11554 ?auto_11553 ) ) ( HOIST-AT ?auto_11568 ?auto_11554 ) ( AVAILABLE ?auto_11568 ) ( SURFACE-AT ?auto_11539 ?auto_11554 ) ( ON ?auto_11539 ?auto_11563 ) ( CLEAR ?auto_11539 ) ( TRUCK-AT ?auto_11550 ?auto_11553 ) ( not ( = ?auto_11538 ?auto_11539 ) ) ( not ( = ?auto_11538 ?auto_11563 ) ) ( not ( = ?auto_11539 ?auto_11563 ) ) ( not ( = ?auto_11551 ?auto_11568 ) ) ( not ( = ?auto_11538 ?auto_11540 ) ) ( not ( = ?auto_11538 ?auto_11567 ) ) ( not ( = ?auto_11540 ?auto_11563 ) ) ( not ( = ?auto_11552 ?auto_11554 ) ) ( not ( = ?auto_11549 ?auto_11568 ) ) ( not ( = ?auto_11567 ?auto_11563 ) ) ( not ( = ?auto_11538 ?auto_11541 ) ) ( not ( = ?auto_11538 ?auto_11559 ) ) ( not ( = ?auto_11539 ?auto_11541 ) ) ( not ( = ?auto_11539 ?auto_11559 ) ) ( not ( = ?auto_11541 ?auto_11567 ) ) ( not ( = ?auto_11541 ?auto_11563 ) ) ( not ( = ?auto_11570 ?auto_11552 ) ) ( not ( = ?auto_11570 ?auto_11554 ) ) ( not ( = ?auto_11562 ?auto_11549 ) ) ( not ( = ?auto_11562 ?auto_11568 ) ) ( not ( = ?auto_11559 ?auto_11567 ) ) ( not ( = ?auto_11559 ?auto_11563 ) ) ( not ( = ?auto_11538 ?auto_11542 ) ) ( not ( = ?auto_11538 ?auto_11556 ) ) ( not ( = ?auto_11539 ?auto_11542 ) ) ( not ( = ?auto_11539 ?auto_11556 ) ) ( not ( = ?auto_11540 ?auto_11542 ) ) ( not ( = ?auto_11540 ?auto_11556 ) ) ( not ( = ?auto_11542 ?auto_11559 ) ) ( not ( = ?auto_11542 ?auto_11567 ) ) ( not ( = ?auto_11542 ?auto_11563 ) ) ( not ( = ?auto_11571 ?auto_11570 ) ) ( not ( = ?auto_11571 ?auto_11552 ) ) ( not ( = ?auto_11571 ?auto_11554 ) ) ( not ( = ?auto_11555 ?auto_11562 ) ) ( not ( = ?auto_11555 ?auto_11549 ) ) ( not ( = ?auto_11555 ?auto_11568 ) ) ( not ( = ?auto_11556 ?auto_11559 ) ) ( not ( = ?auto_11556 ?auto_11567 ) ) ( not ( = ?auto_11556 ?auto_11563 ) ) ( not ( = ?auto_11538 ?auto_11543 ) ) ( not ( = ?auto_11538 ?auto_11565 ) ) ( not ( = ?auto_11539 ?auto_11543 ) ) ( not ( = ?auto_11539 ?auto_11565 ) ) ( not ( = ?auto_11540 ?auto_11543 ) ) ( not ( = ?auto_11540 ?auto_11565 ) ) ( not ( = ?auto_11541 ?auto_11543 ) ) ( not ( = ?auto_11541 ?auto_11565 ) ) ( not ( = ?auto_11543 ?auto_11556 ) ) ( not ( = ?auto_11543 ?auto_11559 ) ) ( not ( = ?auto_11543 ?auto_11567 ) ) ( not ( = ?auto_11543 ?auto_11563 ) ) ( not ( = ?auto_11569 ?auto_11571 ) ) ( not ( = ?auto_11569 ?auto_11570 ) ) ( not ( = ?auto_11569 ?auto_11552 ) ) ( not ( = ?auto_11569 ?auto_11554 ) ) ( not ( = ?auto_11572 ?auto_11555 ) ) ( not ( = ?auto_11572 ?auto_11562 ) ) ( not ( = ?auto_11572 ?auto_11549 ) ) ( not ( = ?auto_11572 ?auto_11568 ) ) ( not ( = ?auto_11565 ?auto_11556 ) ) ( not ( = ?auto_11565 ?auto_11559 ) ) ( not ( = ?auto_11565 ?auto_11567 ) ) ( not ( = ?auto_11565 ?auto_11563 ) ) ( not ( = ?auto_11538 ?auto_11544 ) ) ( not ( = ?auto_11538 ?auto_11573 ) ) ( not ( = ?auto_11539 ?auto_11544 ) ) ( not ( = ?auto_11539 ?auto_11573 ) ) ( not ( = ?auto_11540 ?auto_11544 ) ) ( not ( = ?auto_11540 ?auto_11573 ) ) ( not ( = ?auto_11541 ?auto_11544 ) ) ( not ( = ?auto_11541 ?auto_11573 ) ) ( not ( = ?auto_11542 ?auto_11544 ) ) ( not ( = ?auto_11542 ?auto_11573 ) ) ( not ( = ?auto_11544 ?auto_11565 ) ) ( not ( = ?auto_11544 ?auto_11556 ) ) ( not ( = ?auto_11544 ?auto_11559 ) ) ( not ( = ?auto_11544 ?auto_11567 ) ) ( not ( = ?auto_11544 ?auto_11563 ) ) ( not ( = ?auto_11564 ?auto_11569 ) ) ( not ( = ?auto_11564 ?auto_11571 ) ) ( not ( = ?auto_11564 ?auto_11570 ) ) ( not ( = ?auto_11564 ?auto_11552 ) ) ( not ( = ?auto_11564 ?auto_11554 ) ) ( not ( = ?auto_11560 ?auto_11572 ) ) ( not ( = ?auto_11560 ?auto_11555 ) ) ( not ( = ?auto_11560 ?auto_11562 ) ) ( not ( = ?auto_11560 ?auto_11549 ) ) ( not ( = ?auto_11560 ?auto_11568 ) ) ( not ( = ?auto_11573 ?auto_11565 ) ) ( not ( = ?auto_11573 ?auto_11556 ) ) ( not ( = ?auto_11573 ?auto_11559 ) ) ( not ( = ?auto_11573 ?auto_11567 ) ) ( not ( = ?auto_11573 ?auto_11563 ) ) ( not ( = ?auto_11538 ?auto_11545 ) ) ( not ( = ?auto_11538 ?auto_11558 ) ) ( not ( = ?auto_11539 ?auto_11545 ) ) ( not ( = ?auto_11539 ?auto_11558 ) ) ( not ( = ?auto_11540 ?auto_11545 ) ) ( not ( = ?auto_11540 ?auto_11558 ) ) ( not ( = ?auto_11541 ?auto_11545 ) ) ( not ( = ?auto_11541 ?auto_11558 ) ) ( not ( = ?auto_11542 ?auto_11545 ) ) ( not ( = ?auto_11542 ?auto_11558 ) ) ( not ( = ?auto_11543 ?auto_11545 ) ) ( not ( = ?auto_11543 ?auto_11558 ) ) ( not ( = ?auto_11545 ?auto_11573 ) ) ( not ( = ?auto_11545 ?auto_11565 ) ) ( not ( = ?auto_11545 ?auto_11556 ) ) ( not ( = ?auto_11545 ?auto_11559 ) ) ( not ( = ?auto_11545 ?auto_11567 ) ) ( not ( = ?auto_11545 ?auto_11563 ) ) ( not ( = ?auto_11561 ?auto_11564 ) ) ( not ( = ?auto_11561 ?auto_11569 ) ) ( not ( = ?auto_11561 ?auto_11571 ) ) ( not ( = ?auto_11561 ?auto_11570 ) ) ( not ( = ?auto_11561 ?auto_11552 ) ) ( not ( = ?auto_11561 ?auto_11554 ) ) ( not ( = ?auto_11566 ?auto_11560 ) ) ( not ( = ?auto_11566 ?auto_11572 ) ) ( not ( = ?auto_11566 ?auto_11555 ) ) ( not ( = ?auto_11566 ?auto_11562 ) ) ( not ( = ?auto_11566 ?auto_11549 ) ) ( not ( = ?auto_11566 ?auto_11568 ) ) ( not ( = ?auto_11558 ?auto_11573 ) ) ( not ( = ?auto_11558 ?auto_11565 ) ) ( not ( = ?auto_11558 ?auto_11556 ) ) ( not ( = ?auto_11558 ?auto_11559 ) ) ( not ( = ?auto_11558 ?auto_11567 ) ) ( not ( = ?auto_11558 ?auto_11563 ) ) ( not ( = ?auto_11538 ?auto_11546 ) ) ( not ( = ?auto_11538 ?auto_11557 ) ) ( not ( = ?auto_11539 ?auto_11546 ) ) ( not ( = ?auto_11539 ?auto_11557 ) ) ( not ( = ?auto_11540 ?auto_11546 ) ) ( not ( = ?auto_11540 ?auto_11557 ) ) ( not ( = ?auto_11541 ?auto_11546 ) ) ( not ( = ?auto_11541 ?auto_11557 ) ) ( not ( = ?auto_11542 ?auto_11546 ) ) ( not ( = ?auto_11542 ?auto_11557 ) ) ( not ( = ?auto_11543 ?auto_11546 ) ) ( not ( = ?auto_11543 ?auto_11557 ) ) ( not ( = ?auto_11544 ?auto_11546 ) ) ( not ( = ?auto_11544 ?auto_11557 ) ) ( not ( = ?auto_11546 ?auto_11558 ) ) ( not ( = ?auto_11546 ?auto_11573 ) ) ( not ( = ?auto_11546 ?auto_11565 ) ) ( not ( = ?auto_11546 ?auto_11556 ) ) ( not ( = ?auto_11546 ?auto_11559 ) ) ( not ( = ?auto_11546 ?auto_11567 ) ) ( not ( = ?auto_11546 ?auto_11563 ) ) ( not ( = ?auto_11557 ?auto_11558 ) ) ( not ( = ?auto_11557 ?auto_11573 ) ) ( not ( = ?auto_11557 ?auto_11565 ) ) ( not ( = ?auto_11557 ?auto_11556 ) ) ( not ( = ?auto_11557 ?auto_11559 ) ) ( not ( = ?auto_11557 ?auto_11567 ) ) ( not ( = ?auto_11557 ?auto_11563 ) ) ( not ( = ?auto_11538 ?auto_11547 ) ) ( not ( = ?auto_11538 ?auto_11548 ) ) ( not ( = ?auto_11539 ?auto_11547 ) ) ( not ( = ?auto_11539 ?auto_11548 ) ) ( not ( = ?auto_11540 ?auto_11547 ) ) ( not ( = ?auto_11540 ?auto_11548 ) ) ( not ( = ?auto_11541 ?auto_11547 ) ) ( not ( = ?auto_11541 ?auto_11548 ) ) ( not ( = ?auto_11542 ?auto_11547 ) ) ( not ( = ?auto_11542 ?auto_11548 ) ) ( not ( = ?auto_11543 ?auto_11547 ) ) ( not ( = ?auto_11543 ?auto_11548 ) ) ( not ( = ?auto_11544 ?auto_11547 ) ) ( not ( = ?auto_11544 ?auto_11548 ) ) ( not ( = ?auto_11545 ?auto_11547 ) ) ( not ( = ?auto_11545 ?auto_11548 ) ) ( not ( = ?auto_11547 ?auto_11557 ) ) ( not ( = ?auto_11547 ?auto_11558 ) ) ( not ( = ?auto_11547 ?auto_11573 ) ) ( not ( = ?auto_11547 ?auto_11565 ) ) ( not ( = ?auto_11547 ?auto_11556 ) ) ( not ( = ?auto_11547 ?auto_11559 ) ) ( not ( = ?auto_11547 ?auto_11567 ) ) ( not ( = ?auto_11547 ?auto_11563 ) ) ( not ( = ?auto_11548 ?auto_11557 ) ) ( not ( = ?auto_11548 ?auto_11558 ) ) ( not ( = ?auto_11548 ?auto_11573 ) ) ( not ( = ?auto_11548 ?auto_11565 ) ) ( not ( = ?auto_11548 ?auto_11556 ) ) ( not ( = ?auto_11548 ?auto_11559 ) ) ( not ( = ?auto_11548 ?auto_11567 ) ) ( not ( = ?auto_11548 ?auto_11563 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_11538 ?auto_11539 ?auto_11540 ?auto_11541 ?auto_11542 ?auto_11543 ?auto_11544 ?auto_11545 ?auto_11546 )
      ( MAKE-1CRATE ?auto_11546 ?auto_11547 )
      ( MAKE-9CRATE-VERIFY ?auto_11538 ?auto_11539 ?auto_11540 ?auto_11541 ?auto_11542 ?auto_11543 ?auto_11544 ?auto_11545 ?auto_11546 ?auto_11547 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_11595 - SURFACE
      ?auto_11596 - SURFACE
      ?auto_11597 - SURFACE
      ?auto_11598 - SURFACE
      ?auto_11599 - SURFACE
      ?auto_11600 - SURFACE
      ?auto_11601 - SURFACE
      ?auto_11602 - SURFACE
      ?auto_11603 - SURFACE
      ?auto_11604 - SURFACE
      ?auto_11605 - SURFACE
    )
    :vars
    (
      ?auto_11606 - HOIST
      ?auto_11610 - PLACE
      ?auto_11611 - PLACE
      ?auto_11607 - HOIST
      ?auto_11608 - SURFACE
      ?auto_11629 - PLACE
      ?auto_11617 - HOIST
      ?auto_11618 - SURFACE
      ?auto_11630 - SURFACE
      ?auto_11619 - PLACE
      ?auto_11627 - HOIST
      ?auto_11625 - SURFACE
      ?auto_11614 - PLACE
      ?auto_11612 - HOIST
      ?auto_11621 - SURFACE
      ?auto_11624 - PLACE
      ?auto_11622 - HOIST
      ?auto_11615 - SURFACE
      ?auto_11620 - PLACE
      ?auto_11632 - HOIST
      ?auto_11623 - SURFACE
      ?auto_11631 - PLACE
      ?auto_11628 - HOIST
      ?auto_11613 - SURFACE
      ?auto_11626 - SURFACE
      ?auto_11616 - SURFACE
      ?auto_11609 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11606 ?auto_11610 ) ( IS-CRATE ?auto_11605 ) ( not ( = ?auto_11611 ?auto_11610 ) ) ( HOIST-AT ?auto_11607 ?auto_11611 ) ( SURFACE-AT ?auto_11605 ?auto_11611 ) ( ON ?auto_11605 ?auto_11608 ) ( CLEAR ?auto_11605 ) ( not ( = ?auto_11604 ?auto_11605 ) ) ( not ( = ?auto_11604 ?auto_11608 ) ) ( not ( = ?auto_11605 ?auto_11608 ) ) ( not ( = ?auto_11606 ?auto_11607 ) ) ( IS-CRATE ?auto_11604 ) ( not ( = ?auto_11629 ?auto_11610 ) ) ( HOIST-AT ?auto_11617 ?auto_11629 ) ( SURFACE-AT ?auto_11604 ?auto_11629 ) ( ON ?auto_11604 ?auto_11618 ) ( CLEAR ?auto_11604 ) ( not ( = ?auto_11603 ?auto_11604 ) ) ( not ( = ?auto_11603 ?auto_11618 ) ) ( not ( = ?auto_11604 ?auto_11618 ) ) ( not ( = ?auto_11606 ?auto_11617 ) ) ( IS-CRATE ?auto_11603 ) ( SURFACE-AT ?auto_11603 ?auto_11629 ) ( ON ?auto_11603 ?auto_11630 ) ( CLEAR ?auto_11603 ) ( not ( = ?auto_11602 ?auto_11603 ) ) ( not ( = ?auto_11602 ?auto_11630 ) ) ( not ( = ?auto_11603 ?auto_11630 ) ) ( IS-CRATE ?auto_11602 ) ( not ( = ?auto_11619 ?auto_11610 ) ) ( HOIST-AT ?auto_11627 ?auto_11619 ) ( AVAILABLE ?auto_11627 ) ( SURFACE-AT ?auto_11602 ?auto_11619 ) ( ON ?auto_11602 ?auto_11625 ) ( CLEAR ?auto_11602 ) ( not ( = ?auto_11601 ?auto_11602 ) ) ( not ( = ?auto_11601 ?auto_11625 ) ) ( not ( = ?auto_11602 ?auto_11625 ) ) ( not ( = ?auto_11606 ?auto_11627 ) ) ( IS-CRATE ?auto_11601 ) ( not ( = ?auto_11614 ?auto_11610 ) ) ( HOIST-AT ?auto_11612 ?auto_11614 ) ( AVAILABLE ?auto_11612 ) ( SURFACE-AT ?auto_11601 ?auto_11614 ) ( ON ?auto_11601 ?auto_11621 ) ( CLEAR ?auto_11601 ) ( not ( = ?auto_11600 ?auto_11601 ) ) ( not ( = ?auto_11600 ?auto_11621 ) ) ( not ( = ?auto_11601 ?auto_11621 ) ) ( not ( = ?auto_11606 ?auto_11612 ) ) ( IS-CRATE ?auto_11600 ) ( not ( = ?auto_11624 ?auto_11610 ) ) ( HOIST-AT ?auto_11622 ?auto_11624 ) ( AVAILABLE ?auto_11622 ) ( SURFACE-AT ?auto_11600 ?auto_11624 ) ( ON ?auto_11600 ?auto_11615 ) ( CLEAR ?auto_11600 ) ( not ( = ?auto_11599 ?auto_11600 ) ) ( not ( = ?auto_11599 ?auto_11615 ) ) ( not ( = ?auto_11600 ?auto_11615 ) ) ( not ( = ?auto_11606 ?auto_11622 ) ) ( IS-CRATE ?auto_11599 ) ( not ( = ?auto_11620 ?auto_11610 ) ) ( HOIST-AT ?auto_11632 ?auto_11620 ) ( AVAILABLE ?auto_11632 ) ( SURFACE-AT ?auto_11599 ?auto_11620 ) ( ON ?auto_11599 ?auto_11623 ) ( CLEAR ?auto_11599 ) ( not ( = ?auto_11598 ?auto_11599 ) ) ( not ( = ?auto_11598 ?auto_11623 ) ) ( not ( = ?auto_11599 ?auto_11623 ) ) ( not ( = ?auto_11606 ?auto_11632 ) ) ( IS-CRATE ?auto_11598 ) ( not ( = ?auto_11631 ?auto_11610 ) ) ( HOIST-AT ?auto_11628 ?auto_11631 ) ( AVAILABLE ?auto_11628 ) ( SURFACE-AT ?auto_11598 ?auto_11631 ) ( ON ?auto_11598 ?auto_11613 ) ( CLEAR ?auto_11598 ) ( not ( = ?auto_11597 ?auto_11598 ) ) ( not ( = ?auto_11597 ?auto_11613 ) ) ( not ( = ?auto_11598 ?auto_11613 ) ) ( not ( = ?auto_11606 ?auto_11628 ) ) ( IS-CRATE ?auto_11597 ) ( AVAILABLE ?auto_11617 ) ( SURFACE-AT ?auto_11597 ?auto_11629 ) ( ON ?auto_11597 ?auto_11626 ) ( CLEAR ?auto_11597 ) ( not ( = ?auto_11596 ?auto_11597 ) ) ( not ( = ?auto_11596 ?auto_11626 ) ) ( not ( = ?auto_11597 ?auto_11626 ) ) ( SURFACE-AT ?auto_11595 ?auto_11610 ) ( CLEAR ?auto_11595 ) ( IS-CRATE ?auto_11596 ) ( AVAILABLE ?auto_11606 ) ( AVAILABLE ?auto_11607 ) ( SURFACE-AT ?auto_11596 ?auto_11611 ) ( ON ?auto_11596 ?auto_11616 ) ( CLEAR ?auto_11596 ) ( TRUCK-AT ?auto_11609 ?auto_11610 ) ( not ( = ?auto_11595 ?auto_11596 ) ) ( not ( = ?auto_11595 ?auto_11616 ) ) ( not ( = ?auto_11596 ?auto_11616 ) ) ( not ( = ?auto_11595 ?auto_11597 ) ) ( not ( = ?auto_11595 ?auto_11626 ) ) ( not ( = ?auto_11597 ?auto_11616 ) ) ( not ( = ?auto_11629 ?auto_11611 ) ) ( not ( = ?auto_11617 ?auto_11607 ) ) ( not ( = ?auto_11626 ?auto_11616 ) ) ( not ( = ?auto_11595 ?auto_11598 ) ) ( not ( = ?auto_11595 ?auto_11613 ) ) ( not ( = ?auto_11596 ?auto_11598 ) ) ( not ( = ?auto_11596 ?auto_11613 ) ) ( not ( = ?auto_11598 ?auto_11626 ) ) ( not ( = ?auto_11598 ?auto_11616 ) ) ( not ( = ?auto_11631 ?auto_11629 ) ) ( not ( = ?auto_11631 ?auto_11611 ) ) ( not ( = ?auto_11628 ?auto_11617 ) ) ( not ( = ?auto_11628 ?auto_11607 ) ) ( not ( = ?auto_11613 ?auto_11626 ) ) ( not ( = ?auto_11613 ?auto_11616 ) ) ( not ( = ?auto_11595 ?auto_11599 ) ) ( not ( = ?auto_11595 ?auto_11623 ) ) ( not ( = ?auto_11596 ?auto_11599 ) ) ( not ( = ?auto_11596 ?auto_11623 ) ) ( not ( = ?auto_11597 ?auto_11599 ) ) ( not ( = ?auto_11597 ?auto_11623 ) ) ( not ( = ?auto_11599 ?auto_11613 ) ) ( not ( = ?auto_11599 ?auto_11626 ) ) ( not ( = ?auto_11599 ?auto_11616 ) ) ( not ( = ?auto_11620 ?auto_11631 ) ) ( not ( = ?auto_11620 ?auto_11629 ) ) ( not ( = ?auto_11620 ?auto_11611 ) ) ( not ( = ?auto_11632 ?auto_11628 ) ) ( not ( = ?auto_11632 ?auto_11617 ) ) ( not ( = ?auto_11632 ?auto_11607 ) ) ( not ( = ?auto_11623 ?auto_11613 ) ) ( not ( = ?auto_11623 ?auto_11626 ) ) ( not ( = ?auto_11623 ?auto_11616 ) ) ( not ( = ?auto_11595 ?auto_11600 ) ) ( not ( = ?auto_11595 ?auto_11615 ) ) ( not ( = ?auto_11596 ?auto_11600 ) ) ( not ( = ?auto_11596 ?auto_11615 ) ) ( not ( = ?auto_11597 ?auto_11600 ) ) ( not ( = ?auto_11597 ?auto_11615 ) ) ( not ( = ?auto_11598 ?auto_11600 ) ) ( not ( = ?auto_11598 ?auto_11615 ) ) ( not ( = ?auto_11600 ?auto_11623 ) ) ( not ( = ?auto_11600 ?auto_11613 ) ) ( not ( = ?auto_11600 ?auto_11626 ) ) ( not ( = ?auto_11600 ?auto_11616 ) ) ( not ( = ?auto_11624 ?auto_11620 ) ) ( not ( = ?auto_11624 ?auto_11631 ) ) ( not ( = ?auto_11624 ?auto_11629 ) ) ( not ( = ?auto_11624 ?auto_11611 ) ) ( not ( = ?auto_11622 ?auto_11632 ) ) ( not ( = ?auto_11622 ?auto_11628 ) ) ( not ( = ?auto_11622 ?auto_11617 ) ) ( not ( = ?auto_11622 ?auto_11607 ) ) ( not ( = ?auto_11615 ?auto_11623 ) ) ( not ( = ?auto_11615 ?auto_11613 ) ) ( not ( = ?auto_11615 ?auto_11626 ) ) ( not ( = ?auto_11615 ?auto_11616 ) ) ( not ( = ?auto_11595 ?auto_11601 ) ) ( not ( = ?auto_11595 ?auto_11621 ) ) ( not ( = ?auto_11596 ?auto_11601 ) ) ( not ( = ?auto_11596 ?auto_11621 ) ) ( not ( = ?auto_11597 ?auto_11601 ) ) ( not ( = ?auto_11597 ?auto_11621 ) ) ( not ( = ?auto_11598 ?auto_11601 ) ) ( not ( = ?auto_11598 ?auto_11621 ) ) ( not ( = ?auto_11599 ?auto_11601 ) ) ( not ( = ?auto_11599 ?auto_11621 ) ) ( not ( = ?auto_11601 ?auto_11615 ) ) ( not ( = ?auto_11601 ?auto_11623 ) ) ( not ( = ?auto_11601 ?auto_11613 ) ) ( not ( = ?auto_11601 ?auto_11626 ) ) ( not ( = ?auto_11601 ?auto_11616 ) ) ( not ( = ?auto_11614 ?auto_11624 ) ) ( not ( = ?auto_11614 ?auto_11620 ) ) ( not ( = ?auto_11614 ?auto_11631 ) ) ( not ( = ?auto_11614 ?auto_11629 ) ) ( not ( = ?auto_11614 ?auto_11611 ) ) ( not ( = ?auto_11612 ?auto_11622 ) ) ( not ( = ?auto_11612 ?auto_11632 ) ) ( not ( = ?auto_11612 ?auto_11628 ) ) ( not ( = ?auto_11612 ?auto_11617 ) ) ( not ( = ?auto_11612 ?auto_11607 ) ) ( not ( = ?auto_11621 ?auto_11615 ) ) ( not ( = ?auto_11621 ?auto_11623 ) ) ( not ( = ?auto_11621 ?auto_11613 ) ) ( not ( = ?auto_11621 ?auto_11626 ) ) ( not ( = ?auto_11621 ?auto_11616 ) ) ( not ( = ?auto_11595 ?auto_11602 ) ) ( not ( = ?auto_11595 ?auto_11625 ) ) ( not ( = ?auto_11596 ?auto_11602 ) ) ( not ( = ?auto_11596 ?auto_11625 ) ) ( not ( = ?auto_11597 ?auto_11602 ) ) ( not ( = ?auto_11597 ?auto_11625 ) ) ( not ( = ?auto_11598 ?auto_11602 ) ) ( not ( = ?auto_11598 ?auto_11625 ) ) ( not ( = ?auto_11599 ?auto_11602 ) ) ( not ( = ?auto_11599 ?auto_11625 ) ) ( not ( = ?auto_11600 ?auto_11602 ) ) ( not ( = ?auto_11600 ?auto_11625 ) ) ( not ( = ?auto_11602 ?auto_11621 ) ) ( not ( = ?auto_11602 ?auto_11615 ) ) ( not ( = ?auto_11602 ?auto_11623 ) ) ( not ( = ?auto_11602 ?auto_11613 ) ) ( not ( = ?auto_11602 ?auto_11626 ) ) ( not ( = ?auto_11602 ?auto_11616 ) ) ( not ( = ?auto_11619 ?auto_11614 ) ) ( not ( = ?auto_11619 ?auto_11624 ) ) ( not ( = ?auto_11619 ?auto_11620 ) ) ( not ( = ?auto_11619 ?auto_11631 ) ) ( not ( = ?auto_11619 ?auto_11629 ) ) ( not ( = ?auto_11619 ?auto_11611 ) ) ( not ( = ?auto_11627 ?auto_11612 ) ) ( not ( = ?auto_11627 ?auto_11622 ) ) ( not ( = ?auto_11627 ?auto_11632 ) ) ( not ( = ?auto_11627 ?auto_11628 ) ) ( not ( = ?auto_11627 ?auto_11617 ) ) ( not ( = ?auto_11627 ?auto_11607 ) ) ( not ( = ?auto_11625 ?auto_11621 ) ) ( not ( = ?auto_11625 ?auto_11615 ) ) ( not ( = ?auto_11625 ?auto_11623 ) ) ( not ( = ?auto_11625 ?auto_11613 ) ) ( not ( = ?auto_11625 ?auto_11626 ) ) ( not ( = ?auto_11625 ?auto_11616 ) ) ( not ( = ?auto_11595 ?auto_11603 ) ) ( not ( = ?auto_11595 ?auto_11630 ) ) ( not ( = ?auto_11596 ?auto_11603 ) ) ( not ( = ?auto_11596 ?auto_11630 ) ) ( not ( = ?auto_11597 ?auto_11603 ) ) ( not ( = ?auto_11597 ?auto_11630 ) ) ( not ( = ?auto_11598 ?auto_11603 ) ) ( not ( = ?auto_11598 ?auto_11630 ) ) ( not ( = ?auto_11599 ?auto_11603 ) ) ( not ( = ?auto_11599 ?auto_11630 ) ) ( not ( = ?auto_11600 ?auto_11603 ) ) ( not ( = ?auto_11600 ?auto_11630 ) ) ( not ( = ?auto_11601 ?auto_11603 ) ) ( not ( = ?auto_11601 ?auto_11630 ) ) ( not ( = ?auto_11603 ?auto_11625 ) ) ( not ( = ?auto_11603 ?auto_11621 ) ) ( not ( = ?auto_11603 ?auto_11615 ) ) ( not ( = ?auto_11603 ?auto_11623 ) ) ( not ( = ?auto_11603 ?auto_11613 ) ) ( not ( = ?auto_11603 ?auto_11626 ) ) ( not ( = ?auto_11603 ?auto_11616 ) ) ( not ( = ?auto_11630 ?auto_11625 ) ) ( not ( = ?auto_11630 ?auto_11621 ) ) ( not ( = ?auto_11630 ?auto_11615 ) ) ( not ( = ?auto_11630 ?auto_11623 ) ) ( not ( = ?auto_11630 ?auto_11613 ) ) ( not ( = ?auto_11630 ?auto_11626 ) ) ( not ( = ?auto_11630 ?auto_11616 ) ) ( not ( = ?auto_11595 ?auto_11604 ) ) ( not ( = ?auto_11595 ?auto_11618 ) ) ( not ( = ?auto_11596 ?auto_11604 ) ) ( not ( = ?auto_11596 ?auto_11618 ) ) ( not ( = ?auto_11597 ?auto_11604 ) ) ( not ( = ?auto_11597 ?auto_11618 ) ) ( not ( = ?auto_11598 ?auto_11604 ) ) ( not ( = ?auto_11598 ?auto_11618 ) ) ( not ( = ?auto_11599 ?auto_11604 ) ) ( not ( = ?auto_11599 ?auto_11618 ) ) ( not ( = ?auto_11600 ?auto_11604 ) ) ( not ( = ?auto_11600 ?auto_11618 ) ) ( not ( = ?auto_11601 ?auto_11604 ) ) ( not ( = ?auto_11601 ?auto_11618 ) ) ( not ( = ?auto_11602 ?auto_11604 ) ) ( not ( = ?auto_11602 ?auto_11618 ) ) ( not ( = ?auto_11604 ?auto_11630 ) ) ( not ( = ?auto_11604 ?auto_11625 ) ) ( not ( = ?auto_11604 ?auto_11621 ) ) ( not ( = ?auto_11604 ?auto_11615 ) ) ( not ( = ?auto_11604 ?auto_11623 ) ) ( not ( = ?auto_11604 ?auto_11613 ) ) ( not ( = ?auto_11604 ?auto_11626 ) ) ( not ( = ?auto_11604 ?auto_11616 ) ) ( not ( = ?auto_11618 ?auto_11630 ) ) ( not ( = ?auto_11618 ?auto_11625 ) ) ( not ( = ?auto_11618 ?auto_11621 ) ) ( not ( = ?auto_11618 ?auto_11615 ) ) ( not ( = ?auto_11618 ?auto_11623 ) ) ( not ( = ?auto_11618 ?auto_11613 ) ) ( not ( = ?auto_11618 ?auto_11626 ) ) ( not ( = ?auto_11618 ?auto_11616 ) ) ( not ( = ?auto_11595 ?auto_11605 ) ) ( not ( = ?auto_11595 ?auto_11608 ) ) ( not ( = ?auto_11596 ?auto_11605 ) ) ( not ( = ?auto_11596 ?auto_11608 ) ) ( not ( = ?auto_11597 ?auto_11605 ) ) ( not ( = ?auto_11597 ?auto_11608 ) ) ( not ( = ?auto_11598 ?auto_11605 ) ) ( not ( = ?auto_11598 ?auto_11608 ) ) ( not ( = ?auto_11599 ?auto_11605 ) ) ( not ( = ?auto_11599 ?auto_11608 ) ) ( not ( = ?auto_11600 ?auto_11605 ) ) ( not ( = ?auto_11600 ?auto_11608 ) ) ( not ( = ?auto_11601 ?auto_11605 ) ) ( not ( = ?auto_11601 ?auto_11608 ) ) ( not ( = ?auto_11602 ?auto_11605 ) ) ( not ( = ?auto_11602 ?auto_11608 ) ) ( not ( = ?auto_11603 ?auto_11605 ) ) ( not ( = ?auto_11603 ?auto_11608 ) ) ( not ( = ?auto_11605 ?auto_11618 ) ) ( not ( = ?auto_11605 ?auto_11630 ) ) ( not ( = ?auto_11605 ?auto_11625 ) ) ( not ( = ?auto_11605 ?auto_11621 ) ) ( not ( = ?auto_11605 ?auto_11615 ) ) ( not ( = ?auto_11605 ?auto_11623 ) ) ( not ( = ?auto_11605 ?auto_11613 ) ) ( not ( = ?auto_11605 ?auto_11626 ) ) ( not ( = ?auto_11605 ?auto_11616 ) ) ( not ( = ?auto_11608 ?auto_11618 ) ) ( not ( = ?auto_11608 ?auto_11630 ) ) ( not ( = ?auto_11608 ?auto_11625 ) ) ( not ( = ?auto_11608 ?auto_11621 ) ) ( not ( = ?auto_11608 ?auto_11615 ) ) ( not ( = ?auto_11608 ?auto_11623 ) ) ( not ( = ?auto_11608 ?auto_11613 ) ) ( not ( = ?auto_11608 ?auto_11626 ) ) ( not ( = ?auto_11608 ?auto_11616 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_11595 ?auto_11596 ?auto_11597 ?auto_11598 ?auto_11599 ?auto_11600 ?auto_11601 ?auto_11602 ?auto_11603 ?auto_11604 )
      ( MAKE-1CRATE ?auto_11604 ?auto_11605 )
      ( MAKE-10CRATE-VERIFY ?auto_11595 ?auto_11596 ?auto_11597 ?auto_11598 ?auto_11599 ?auto_11600 ?auto_11601 ?auto_11602 ?auto_11603 ?auto_11604 ?auto_11605 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_11655 - SURFACE
      ?auto_11656 - SURFACE
      ?auto_11657 - SURFACE
      ?auto_11658 - SURFACE
      ?auto_11659 - SURFACE
      ?auto_11660 - SURFACE
      ?auto_11661 - SURFACE
      ?auto_11662 - SURFACE
      ?auto_11663 - SURFACE
      ?auto_11664 - SURFACE
      ?auto_11665 - SURFACE
      ?auto_11666 - SURFACE
    )
    :vars
    (
      ?auto_11671 - HOIST
      ?auto_11668 - PLACE
      ?auto_11667 - PLACE
      ?auto_11669 - HOIST
      ?auto_11672 - SURFACE
      ?auto_11674 - PLACE
      ?auto_11692 - HOIST
      ?auto_11685 - SURFACE
      ?auto_11676 - PLACE
      ?auto_11683 - HOIST
      ?auto_11686 - SURFACE
      ?auto_11684 - SURFACE
      ?auto_11696 - PLACE
      ?auto_11687 - HOIST
      ?auto_11688 - SURFACE
      ?auto_11682 - PLACE
      ?auto_11678 - HOIST
      ?auto_11690 - SURFACE
      ?auto_11689 - PLACE
      ?auto_11679 - HOIST
      ?auto_11673 - SURFACE
      ?auto_11675 - PLACE
      ?auto_11691 - HOIST
      ?auto_11681 - SURFACE
      ?auto_11680 - PLACE
      ?auto_11677 - HOIST
      ?auto_11694 - SURFACE
      ?auto_11693 - SURFACE
      ?auto_11695 - SURFACE
      ?auto_11670 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11671 ?auto_11668 ) ( IS-CRATE ?auto_11666 ) ( not ( = ?auto_11667 ?auto_11668 ) ) ( HOIST-AT ?auto_11669 ?auto_11667 ) ( AVAILABLE ?auto_11669 ) ( SURFACE-AT ?auto_11666 ?auto_11667 ) ( ON ?auto_11666 ?auto_11672 ) ( CLEAR ?auto_11666 ) ( not ( = ?auto_11665 ?auto_11666 ) ) ( not ( = ?auto_11665 ?auto_11672 ) ) ( not ( = ?auto_11666 ?auto_11672 ) ) ( not ( = ?auto_11671 ?auto_11669 ) ) ( IS-CRATE ?auto_11665 ) ( not ( = ?auto_11674 ?auto_11668 ) ) ( HOIST-AT ?auto_11692 ?auto_11674 ) ( SURFACE-AT ?auto_11665 ?auto_11674 ) ( ON ?auto_11665 ?auto_11685 ) ( CLEAR ?auto_11665 ) ( not ( = ?auto_11664 ?auto_11665 ) ) ( not ( = ?auto_11664 ?auto_11685 ) ) ( not ( = ?auto_11665 ?auto_11685 ) ) ( not ( = ?auto_11671 ?auto_11692 ) ) ( IS-CRATE ?auto_11664 ) ( not ( = ?auto_11676 ?auto_11668 ) ) ( HOIST-AT ?auto_11683 ?auto_11676 ) ( SURFACE-AT ?auto_11664 ?auto_11676 ) ( ON ?auto_11664 ?auto_11686 ) ( CLEAR ?auto_11664 ) ( not ( = ?auto_11663 ?auto_11664 ) ) ( not ( = ?auto_11663 ?auto_11686 ) ) ( not ( = ?auto_11664 ?auto_11686 ) ) ( not ( = ?auto_11671 ?auto_11683 ) ) ( IS-CRATE ?auto_11663 ) ( SURFACE-AT ?auto_11663 ?auto_11676 ) ( ON ?auto_11663 ?auto_11684 ) ( CLEAR ?auto_11663 ) ( not ( = ?auto_11662 ?auto_11663 ) ) ( not ( = ?auto_11662 ?auto_11684 ) ) ( not ( = ?auto_11663 ?auto_11684 ) ) ( IS-CRATE ?auto_11662 ) ( not ( = ?auto_11696 ?auto_11668 ) ) ( HOIST-AT ?auto_11687 ?auto_11696 ) ( AVAILABLE ?auto_11687 ) ( SURFACE-AT ?auto_11662 ?auto_11696 ) ( ON ?auto_11662 ?auto_11688 ) ( CLEAR ?auto_11662 ) ( not ( = ?auto_11661 ?auto_11662 ) ) ( not ( = ?auto_11661 ?auto_11688 ) ) ( not ( = ?auto_11662 ?auto_11688 ) ) ( not ( = ?auto_11671 ?auto_11687 ) ) ( IS-CRATE ?auto_11661 ) ( not ( = ?auto_11682 ?auto_11668 ) ) ( HOIST-AT ?auto_11678 ?auto_11682 ) ( AVAILABLE ?auto_11678 ) ( SURFACE-AT ?auto_11661 ?auto_11682 ) ( ON ?auto_11661 ?auto_11690 ) ( CLEAR ?auto_11661 ) ( not ( = ?auto_11660 ?auto_11661 ) ) ( not ( = ?auto_11660 ?auto_11690 ) ) ( not ( = ?auto_11661 ?auto_11690 ) ) ( not ( = ?auto_11671 ?auto_11678 ) ) ( IS-CRATE ?auto_11660 ) ( not ( = ?auto_11689 ?auto_11668 ) ) ( HOIST-AT ?auto_11679 ?auto_11689 ) ( AVAILABLE ?auto_11679 ) ( SURFACE-AT ?auto_11660 ?auto_11689 ) ( ON ?auto_11660 ?auto_11673 ) ( CLEAR ?auto_11660 ) ( not ( = ?auto_11659 ?auto_11660 ) ) ( not ( = ?auto_11659 ?auto_11673 ) ) ( not ( = ?auto_11660 ?auto_11673 ) ) ( not ( = ?auto_11671 ?auto_11679 ) ) ( IS-CRATE ?auto_11659 ) ( not ( = ?auto_11675 ?auto_11668 ) ) ( HOIST-AT ?auto_11691 ?auto_11675 ) ( AVAILABLE ?auto_11691 ) ( SURFACE-AT ?auto_11659 ?auto_11675 ) ( ON ?auto_11659 ?auto_11681 ) ( CLEAR ?auto_11659 ) ( not ( = ?auto_11658 ?auto_11659 ) ) ( not ( = ?auto_11658 ?auto_11681 ) ) ( not ( = ?auto_11659 ?auto_11681 ) ) ( not ( = ?auto_11671 ?auto_11691 ) ) ( IS-CRATE ?auto_11658 ) ( not ( = ?auto_11680 ?auto_11668 ) ) ( HOIST-AT ?auto_11677 ?auto_11680 ) ( AVAILABLE ?auto_11677 ) ( SURFACE-AT ?auto_11658 ?auto_11680 ) ( ON ?auto_11658 ?auto_11694 ) ( CLEAR ?auto_11658 ) ( not ( = ?auto_11657 ?auto_11658 ) ) ( not ( = ?auto_11657 ?auto_11694 ) ) ( not ( = ?auto_11658 ?auto_11694 ) ) ( not ( = ?auto_11671 ?auto_11677 ) ) ( IS-CRATE ?auto_11657 ) ( AVAILABLE ?auto_11683 ) ( SURFACE-AT ?auto_11657 ?auto_11676 ) ( ON ?auto_11657 ?auto_11693 ) ( CLEAR ?auto_11657 ) ( not ( = ?auto_11656 ?auto_11657 ) ) ( not ( = ?auto_11656 ?auto_11693 ) ) ( not ( = ?auto_11657 ?auto_11693 ) ) ( SURFACE-AT ?auto_11655 ?auto_11668 ) ( CLEAR ?auto_11655 ) ( IS-CRATE ?auto_11656 ) ( AVAILABLE ?auto_11671 ) ( AVAILABLE ?auto_11692 ) ( SURFACE-AT ?auto_11656 ?auto_11674 ) ( ON ?auto_11656 ?auto_11695 ) ( CLEAR ?auto_11656 ) ( TRUCK-AT ?auto_11670 ?auto_11668 ) ( not ( = ?auto_11655 ?auto_11656 ) ) ( not ( = ?auto_11655 ?auto_11695 ) ) ( not ( = ?auto_11656 ?auto_11695 ) ) ( not ( = ?auto_11655 ?auto_11657 ) ) ( not ( = ?auto_11655 ?auto_11693 ) ) ( not ( = ?auto_11657 ?auto_11695 ) ) ( not ( = ?auto_11676 ?auto_11674 ) ) ( not ( = ?auto_11683 ?auto_11692 ) ) ( not ( = ?auto_11693 ?auto_11695 ) ) ( not ( = ?auto_11655 ?auto_11658 ) ) ( not ( = ?auto_11655 ?auto_11694 ) ) ( not ( = ?auto_11656 ?auto_11658 ) ) ( not ( = ?auto_11656 ?auto_11694 ) ) ( not ( = ?auto_11658 ?auto_11693 ) ) ( not ( = ?auto_11658 ?auto_11695 ) ) ( not ( = ?auto_11680 ?auto_11676 ) ) ( not ( = ?auto_11680 ?auto_11674 ) ) ( not ( = ?auto_11677 ?auto_11683 ) ) ( not ( = ?auto_11677 ?auto_11692 ) ) ( not ( = ?auto_11694 ?auto_11693 ) ) ( not ( = ?auto_11694 ?auto_11695 ) ) ( not ( = ?auto_11655 ?auto_11659 ) ) ( not ( = ?auto_11655 ?auto_11681 ) ) ( not ( = ?auto_11656 ?auto_11659 ) ) ( not ( = ?auto_11656 ?auto_11681 ) ) ( not ( = ?auto_11657 ?auto_11659 ) ) ( not ( = ?auto_11657 ?auto_11681 ) ) ( not ( = ?auto_11659 ?auto_11694 ) ) ( not ( = ?auto_11659 ?auto_11693 ) ) ( not ( = ?auto_11659 ?auto_11695 ) ) ( not ( = ?auto_11675 ?auto_11680 ) ) ( not ( = ?auto_11675 ?auto_11676 ) ) ( not ( = ?auto_11675 ?auto_11674 ) ) ( not ( = ?auto_11691 ?auto_11677 ) ) ( not ( = ?auto_11691 ?auto_11683 ) ) ( not ( = ?auto_11691 ?auto_11692 ) ) ( not ( = ?auto_11681 ?auto_11694 ) ) ( not ( = ?auto_11681 ?auto_11693 ) ) ( not ( = ?auto_11681 ?auto_11695 ) ) ( not ( = ?auto_11655 ?auto_11660 ) ) ( not ( = ?auto_11655 ?auto_11673 ) ) ( not ( = ?auto_11656 ?auto_11660 ) ) ( not ( = ?auto_11656 ?auto_11673 ) ) ( not ( = ?auto_11657 ?auto_11660 ) ) ( not ( = ?auto_11657 ?auto_11673 ) ) ( not ( = ?auto_11658 ?auto_11660 ) ) ( not ( = ?auto_11658 ?auto_11673 ) ) ( not ( = ?auto_11660 ?auto_11681 ) ) ( not ( = ?auto_11660 ?auto_11694 ) ) ( not ( = ?auto_11660 ?auto_11693 ) ) ( not ( = ?auto_11660 ?auto_11695 ) ) ( not ( = ?auto_11689 ?auto_11675 ) ) ( not ( = ?auto_11689 ?auto_11680 ) ) ( not ( = ?auto_11689 ?auto_11676 ) ) ( not ( = ?auto_11689 ?auto_11674 ) ) ( not ( = ?auto_11679 ?auto_11691 ) ) ( not ( = ?auto_11679 ?auto_11677 ) ) ( not ( = ?auto_11679 ?auto_11683 ) ) ( not ( = ?auto_11679 ?auto_11692 ) ) ( not ( = ?auto_11673 ?auto_11681 ) ) ( not ( = ?auto_11673 ?auto_11694 ) ) ( not ( = ?auto_11673 ?auto_11693 ) ) ( not ( = ?auto_11673 ?auto_11695 ) ) ( not ( = ?auto_11655 ?auto_11661 ) ) ( not ( = ?auto_11655 ?auto_11690 ) ) ( not ( = ?auto_11656 ?auto_11661 ) ) ( not ( = ?auto_11656 ?auto_11690 ) ) ( not ( = ?auto_11657 ?auto_11661 ) ) ( not ( = ?auto_11657 ?auto_11690 ) ) ( not ( = ?auto_11658 ?auto_11661 ) ) ( not ( = ?auto_11658 ?auto_11690 ) ) ( not ( = ?auto_11659 ?auto_11661 ) ) ( not ( = ?auto_11659 ?auto_11690 ) ) ( not ( = ?auto_11661 ?auto_11673 ) ) ( not ( = ?auto_11661 ?auto_11681 ) ) ( not ( = ?auto_11661 ?auto_11694 ) ) ( not ( = ?auto_11661 ?auto_11693 ) ) ( not ( = ?auto_11661 ?auto_11695 ) ) ( not ( = ?auto_11682 ?auto_11689 ) ) ( not ( = ?auto_11682 ?auto_11675 ) ) ( not ( = ?auto_11682 ?auto_11680 ) ) ( not ( = ?auto_11682 ?auto_11676 ) ) ( not ( = ?auto_11682 ?auto_11674 ) ) ( not ( = ?auto_11678 ?auto_11679 ) ) ( not ( = ?auto_11678 ?auto_11691 ) ) ( not ( = ?auto_11678 ?auto_11677 ) ) ( not ( = ?auto_11678 ?auto_11683 ) ) ( not ( = ?auto_11678 ?auto_11692 ) ) ( not ( = ?auto_11690 ?auto_11673 ) ) ( not ( = ?auto_11690 ?auto_11681 ) ) ( not ( = ?auto_11690 ?auto_11694 ) ) ( not ( = ?auto_11690 ?auto_11693 ) ) ( not ( = ?auto_11690 ?auto_11695 ) ) ( not ( = ?auto_11655 ?auto_11662 ) ) ( not ( = ?auto_11655 ?auto_11688 ) ) ( not ( = ?auto_11656 ?auto_11662 ) ) ( not ( = ?auto_11656 ?auto_11688 ) ) ( not ( = ?auto_11657 ?auto_11662 ) ) ( not ( = ?auto_11657 ?auto_11688 ) ) ( not ( = ?auto_11658 ?auto_11662 ) ) ( not ( = ?auto_11658 ?auto_11688 ) ) ( not ( = ?auto_11659 ?auto_11662 ) ) ( not ( = ?auto_11659 ?auto_11688 ) ) ( not ( = ?auto_11660 ?auto_11662 ) ) ( not ( = ?auto_11660 ?auto_11688 ) ) ( not ( = ?auto_11662 ?auto_11690 ) ) ( not ( = ?auto_11662 ?auto_11673 ) ) ( not ( = ?auto_11662 ?auto_11681 ) ) ( not ( = ?auto_11662 ?auto_11694 ) ) ( not ( = ?auto_11662 ?auto_11693 ) ) ( not ( = ?auto_11662 ?auto_11695 ) ) ( not ( = ?auto_11696 ?auto_11682 ) ) ( not ( = ?auto_11696 ?auto_11689 ) ) ( not ( = ?auto_11696 ?auto_11675 ) ) ( not ( = ?auto_11696 ?auto_11680 ) ) ( not ( = ?auto_11696 ?auto_11676 ) ) ( not ( = ?auto_11696 ?auto_11674 ) ) ( not ( = ?auto_11687 ?auto_11678 ) ) ( not ( = ?auto_11687 ?auto_11679 ) ) ( not ( = ?auto_11687 ?auto_11691 ) ) ( not ( = ?auto_11687 ?auto_11677 ) ) ( not ( = ?auto_11687 ?auto_11683 ) ) ( not ( = ?auto_11687 ?auto_11692 ) ) ( not ( = ?auto_11688 ?auto_11690 ) ) ( not ( = ?auto_11688 ?auto_11673 ) ) ( not ( = ?auto_11688 ?auto_11681 ) ) ( not ( = ?auto_11688 ?auto_11694 ) ) ( not ( = ?auto_11688 ?auto_11693 ) ) ( not ( = ?auto_11688 ?auto_11695 ) ) ( not ( = ?auto_11655 ?auto_11663 ) ) ( not ( = ?auto_11655 ?auto_11684 ) ) ( not ( = ?auto_11656 ?auto_11663 ) ) ( not ( = ?auto_11656 ?auto_11684 ) ) ( not ( = ?auto_11657 ?auto_11663 ) ) ( not ( = ?auto_11657 ?auto_11684 ) ) ( not ( = ?auto_11658 ?auto_11663 ) ) ( not ( = ?auto_11658 ?auto_11684 ) ) ( not ( = ?auto_11659 ?auto_11663 ) ) ( not ( = ?auto_11659 ?auto_11684 ) ) ( not ( = ?auto_11660 ?auto_11663 ) ) ( not ( = ?auto_11660 ?auto_11684 ) ) ( not ( = ?auto_11661 ?auto_11663 ) ) ( not ( = ?auto_11661 ?auto_11684 ) ) ( not ( = ?auto_11663 ?auto_11688 ) ) ( not ( = ?auto_11663 ?auto_11690 ) ) ( not ( = ?auto_11663 ?auto_11673 ) ) ( not ( = ?auto_11663 ?auto_11681 ) ) ( not ( = ?auto_11663 ?auto_11694 ) ) ( not ( = ?auto_11663 ?auto_11693 ) ) ( not ( = ?auto_11663 ?auto_11695 ) ) ( not ( = ?auto_11684 ?auto_11688 ) ) ( not ( = ?auto_11684 ?auto_11690 ) ) ( not ( = ?auto_11684 ?auto_11673 ) ) ( not ( = ?auto_11684 ?auto_11681 ) ) ( not ( = ?auto_11684 ?auto_11694 ) ) ( not ( = ?auto_11684 ?auto_11693 ) ) ( not ( = ?auto_11684 ?auto_11695 ) ) ( not ( = ?auto_11655 ?auto_11664 ) ) ( not ( = ?auto_11655 ?auto_11686 ) ) ( not ( = ?auto_11656 ?auto_11664 ) ) ( not ( = ?auto_11656 ?auto_11686 ) ) ( not ( = ?auto_11657 ?auto_11664 ) ) ( not ( = ?auto_11657 ?auto_11686 ) ) ( not ( = ?auto_11658 ?auto_11664 ) ) ( not ( = ?auto_11658 ?auto_11686 ) ) ( not ( = ?auto_11659 ?auto_11664 ) ) ( not ( = ?auto_11659 ?auto_11686 ) ) ( not ( = ?auto_11660 ?auto_11664 ) ) ( not ( = ?auto_11660 ?auto_11686 ) ) ( not ( = ?auto_11661 ?auto_11664 ) ) ( not ( = ?auto_11661 ?auto_11686 ) ) ( not ( = ?auto_11662 ?auto_11664 ) ) ( not ( = ?auto_11662 ?auto_11686 ) ) ( not ( = ?auto_11664 ?auto_11684 ) ) ( not ( = ?auto_11664 ?auto_11688 ) ) ( not ( = ?auto_11664 ?auto_11690 ) ) ( not ( = ?auto_11664 ?auto_11673 ) ) ( not ( = ?auto_11664 ?auto_11681 ) ) ( not ( = ?auto_11664 ?auto_11694 ) ) ( not ( = ?auto_11664 ?auto_11693 ) ) ( not ( = ?auto_11664 ?auto_11695 ) ) ( not ( = ?auto_11686 ?auto_11684 ) ) ( not ( = ?auto_11686 ?auto_11688 ) ) ( not ( = ?auto_11686 ?auto_11690 ) ) ( not ( = ?auto_11686 ?auto_11673 ) ) ( not ( = ?auto_11686 ?auto_11681 ) ) ( not ( = ?auto_11686 ?auto_11694 ) ) ( not ( = ?auto_11686 ?auto_11693 ) ) ( not ( = ?auto_11686 ?auto_11695 ) ) ( not ( = ?auto_11655 ?auto_11665 ) ) ( not ( = ?auto_11655 ?auto_11685 ) ) ( not ( = ?auto_11656 ?auto_11665 ) ) ( not ( = ?auto_11656 ?auto_11685 ) ) ( not ( = ?auto_11657 ?auto_11665 ) ) ( not ( = ?auto_11657 ?auto_11685 ) ) ( not ( = ?auto_11658 ?auto_11665 ) ) ( not ( = ?auto_11658 ?auto_11685 ) ) ( not ( = ?auto_11659 ?auto_11665 ) ) ( not ( = ?auto_11659 ?auto_11685 ) ) ( not ( = ?auto_11660 ?auto_11665 ) ) ( not ( = ?auto_11660 ?auto_11685 ) ) ( not ( = ?auto_11661 ?auto_11665 ) ) ( not ( = ?auto_11661 ?auto_11685 ) ) ( not ( = ?auto_11662 ?auto_11665 ) ) ( not ( = ?auto_11662 ?auto_11685 ) ) ( not ( = ?auto_11663 ?auto_11665 ) ) ( not ( = ?auto_11663 ?auto_11685 ) ) ( not ( = ?auto_11665 ?auto_11686 ) ) ( not ( = ?auto_11665 ?auto_11684 ) ) ( not ( = ?auto_11665 ?auto_11688 ) ) ( not ( = ?auto_11665 ?auto_11690 ) ) ( not ( = ?auto_11665 ?auto_11673 ) ) ( not ( = ?auto_11665 ?auto_11681 ) ) ( not ( = ?auto_11665 ?auto_11694 ) ) ( not ( = ?auto_11665 ?auto_11693 ) ) ( not ( = ?auto_11665 ?auto_11695 ) ) ( not ( = ?auto_11685 ?auto_11686 ) ) ( not ( = ?auto_11685 ?auto_11684 ) ) ( not ( = ?auto_11685 ?auto_11688 ) ) ( not ( = ?auto_11685 ?auto_11690 ) ) ( not ( = ?auto_11685 ?auto_11673 ) ) ( not ( = ?auto_11685 ?auto_11681 ) ) ( not ( = ?auto_11685 ?auto_11694 ) ) ( not ( = ?auto_11685 ?auto_11693 ) ) ( not ( = ?auto_11685 ?auto_11695 ) ) ( not ( = ?auto_11655 ?auto_11666 ) ) ( not ( = ?auto_11655 ?auto_11672 ) ) ( not ( = ?auto_11656 ?auto_11666 ) ) ( not ( = ?auto_11656 ?auto_11672 ) ) ( not ( = ?auto_11657 ?auto_11666 ) ) ( not ( = ?auto_11657 ?auto_11672 ) ) ( not ( = ?auto_11658 ?auto_11666 ) ) ( not ( = ?auto_11658 ?auto_11672 ) ) ( not ( = ?auto_11659 ?auto_11666 ) ) ( not ( = ?auto_11659 ?auto_11672 ) ) ( not ( = ?auto_11660 ?auto_11666 ) ) ( not ( = ?auto_11660 ?auto_11672 ) ) ( not ( = ?auto_11661 ?auto_11666 ) ) ( not ( = ?auto_11661 ?auto_11672 ) ) ( not ( = ?auto_11662 ?auto_11666 ) ) ( not ( = ?auto_11662 ?auto_11672 ) ) ( not ( = ?auto_11663 ?auto_11666 ) ) ( not ( = ?auto_11663 ?auto_11672 ) ) ( not ( = ?auto_11664 ?auto_11666 ) ) ( not ( = ?auto_11664 ?auto_11672 ) ) ( not ( = ?auto_11666 ?auto_11685 ) ) ( not ( = ?auto_11666 ?auto_11686 ) ) ( not ( = ?auto_11666 ?auto_11684 ) ) ( not ( = ?auto_11666 ?auto_11688 ) ) ( not ( = ?auto_11666 ?auto_11690 ) ) ( not ( = ?auto_11666 ?auto_11673 ) ) ( not ( = ?auto_11666 ?auto_11681 ) ) ( not ( = ?auto_11666 ?auto_11694 ) ) ( not ( = ?auto_11666 ?auto_11693 ) ) ( not ( = ?auto_11666 ?auto_11695 ) ) ( not ( = ?auto_11667 ?auto_11674 ) ) ( not ( = ?auto_11667 ?auto_11676 ) ) ( not ( = ?auto_11667 ?auto_11696 ) ) ( not ( = ?auto_11667 ?auto_11682 ) ) ( not ( = ?auto_11667 ?auto_11689 ) ) ( not ( = ?auto_11667 ?auto_11675 ) ) ( not ( = ?auto_11667 ?auto_11680 ) ) ( not ( = ?auto_11669 ?auto_11692 ) ) ( not ( = ?auto_11669 ?auto_11683 ) ) ( not ( = ?auto_11669 ?auto_11687 ) ) ( not ( = ?auto_11669 ?auto_11678 ) ) ( not ( = ?auto_11669 ?auto_11679 ) ) ( not ( = ?auto_11669 ?auto_11691 ) ) ( not ( = ?auto_11669 ?auto_11677 ) ) ( not ( = ?auto_11672 ?auto_11685 ) ) ( not ( = ?auto_11672 ?auto_11686 ) ) ( not ( = ?auto_11672 ?auto_11684 ) ) ( not ( = ?auto_11672 ?auto_11688 ) ) ( not ( = ?auto_11672 ?auto_11690 ) ) ( not ( = ?auto_11672 ?auto_11673 ) ) ( not ( = ?auto_11672 ?auto_11681 ) ) ( not ( = ?auto_11672 ?auto_11694 ) ) ( not ( = ?auto_11672 ?auto_11693 ) ) ( not ( = ?auto_11672 ?auto_11695 ) ) )
    :subtasks
    ( ( MAKE-10CRATE ?auto_11655 ?auto_11656 ?auto_11657 ?auto_11658 ?auto_11659 ?auto_11660 ?auto_11661 ?auto_11662 ?auto_11663 ?auto_11664 ?auto_11665 )
      ( MAKE-1CRATE ?auto_11665 ?auto_11666 )
      ( MAKE-11CRATE-VERIFY ?auto_11655 ?auto_11656 ?auto_11657 ?auto_11658 ?auto_11659 ?auto_11660 ?auto_11661 ?auto_11662 ?auto_11663 ?auto_11664 ?auto_11665 ?auto_11666 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_11720 - SURFACE
      ?auto_11721 - SURFACE
      ?auto_11722 - SURFACE
      ?auto_11723 - SURFACE
      ?auto_11724 - SURFACE
      ?auto_11725 - SURFACE
      ?auto_11726 - SURFACE
      ?auto_11727 - SURFACE
      ?auto_11728 - SURFACE
      ?auto_11729 - SURFACE
      ?auto_11730 - SURFACE
      ?auto_11731 - SURFACE
      ?auto_11732 - SURFACE
    )
    :vars
    (
      ?auto_11736 - HOIST
      ?auto_11737 - PLACE
      ?auto_11735 - PLACE
      ?auto_11734 - HOIST
      ?auto_11733 - SURFACE
      ?auto_11754 - PLACE
      ?auto_11763 - HOIST
      ?auto_11758 - SURFACE
      ?auto_11751 - PLACE
      ?auto_11742 - HOIST
      ?auto_11749 - SURFACE
      ?auto_11752 - SURFACE
      ?auto_11753 - SURFACE
      ?auto_11759 - PLACE
      ?auto_11739 - HOIST
      ?auto_11748 - SURFACE
      ?auto_11743 - PLACE
      ?auto_11762 - HOIST
      ?auto_11740 - SURFACE
      ?auto_11760 - PLACE
      ?auto_11744 - HOIST
      ?auto_11741 - SURFACE
      ?auto_11756 - PLACE
      ?auto_11761 - HOIST
      ?auto_11746 - SURFACE
      ?auto_11757 - PLACE
      ?auto_11745 - HOIST
      ?auto_11750 - SURFACE
      ?auto_11755 - SURFACE
      ?auto_11747 - SURFACE
      ?auto_11738 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11736 ?auto_11737 ) ( IS-CRATE ?auto_11732 ) ( not ( = ?auto_11735 ?auto_11737 ) ) ( HOIST-AT ?auto_11734 ?auto_11735 ) ( SURFACE-AT ?auto_11732 ?auto_11735 ) ( ON ?auto_11732 ?auto_11733 ) ( CLEAR ?auto_11732 ) ( not ( = ?auto_11731 ?auto_11732 ) ) ( not ( = ?auto_11731 ?auto_11733 ) ) ( not ( = ?auto_11732 ?auto_11733 ) ) ( not ( = ?auto_11736 ?auto_11734 ) ) ( IS-CRATE ?auto_11731 ) ( not ( = ?auto_11754 ?auto_11737 ) ) ( HOIST-AT ?auto_11763 ?auto_11754 ) ( AVAILABLE ?auto_11763 ) ( SURFACE-AT ?auto_11731 ?auto_11754 ) ( ON ?auto_11731 ?auto_11758 ) ( CLEAR ?auto_11731 ) ( not ( = ?auto_11730 ?auto_11731 ) ) ( not ( = ?auto_11730 ?auto_11758 ) ) ( not ( = ?auto_11731 ?auto_11758 ) ) ( not ( = ?auto_11736 ?auto_11763 ) ) ( IS-CRATE ?auto_11730 ) ( not ( = ?auto_11751 ?auto_11737 ) ) ( HOIST-AT ?auto_11742 ?auto_11751 ) ( SURFACE-AT ?auto_11730 ?auto_11751 ) ( ON ?auto_11730 ?auto_11749 ) ( CLEAR ?auto_11730 ) ( not ( = ?auto_11729 ?auto_11730 ) ) ( not ( = ?auto_11729 ?auto_11749 ) ) ( not ( = ?auto_11730 ?auto_11749 ) ) ( not ( = ?auto_11736 ?auto_11742 ) ) ( IS-CRATE ?auto_11729 ) ( SURFACE-AT ?auto_11729 ?auto_11735 ) ( ON ?auto_11729 ?auto_11752 ) ( CLEAR ?auto_11729 ) ( not ( = ?auto_11728 ?auto_11729 ) ) ( not ( = ?auto_11728 ?auto_11752 ) ) ( not ( = ?auto_11729 ?auto_11752 ) ) ( IS-CRATE ?auto_11728 ) ( SURFACE-AT ?auto_11728 ?auto_11735 ) ( ON ?auto_11728 ?auto_11753 ) ( CLEAR ?auto_11728 ) ( not ( = ?auto_11727 ?auto_11728 ) ) ( not ( = ?auto_11727 ?auto_11753 ) ) ( not ( = ?auto_11728 ?auto_11753 ) ) ( IS-CRATE ?auto_11727 ) ( not ( = ?auto_11759 ?auto_11737 ) ) ( HOIST-AT ?auto_11739 ?auto_11759 ) ( AVAILABLE ?auto_11739 ) ( SURFACE-AT ?auto_11727 ?auto_11759 ) ( ON ?auto_11727 ?auto_11748 ) ( CLEAR ?auto_11727 ) ( not ( = ?auto_11726 ?auto_11727 ) ) ( not ( = ?auto_11726 ?auto_11748 ) ) ( not ( = ?auto_11727 ?auto_11748 ) ) ( not ( = ?auto_11736 ?auto_11739 ) ) ( IS-CRATE ?auto_11726 ) ( not ( = ?auto_11743 ?auto_11737 ) ) ( HOIST-AT ?auto_11762 ?auto_11743 ) ( AVAILABLE ?auto_11762 ) ( SURFACE-AT ?auto_11726 ?auto_11743 ) ( ON ?auto_11726 ?auto_11740 ) ( CLEAR ?auto_11726 ) ( not ( = ?auto_11725 ?auto_11726 ) ) ( not ( = ?auto_11725 ?auto_11740 ) ) ( not ( = ?auto_11726 ?auto_11740 ) ) ( not ( = ?auto_11736 ?auto_11762 ) ) ( IS-CRATE ?auto_11725 ) ( not ( = ?auto_11760 ?auto_11737 ) ) ( HOIST-AT ?auto_11744 ?auto_11760 ) ( AVAILABLE ?auto_11744 ) ( SURFACE-AT ?auto_11725 ?auto_11760 ) ( ON ?auto_11725 ?auto_11741 ) ( CLEAR ?auto_11725 ) ( not ( = ?auto_11724 ?auto_11725 ) ) ( not ( = ?auto_11724 ?auto_11741 ) ) ( not ( = ?auto_11725 ?auto_11741 ) ) ( not ( = ?auto_11736 ?auto_11744 ) ) ( IS-CRATE ?auto_11724 ) ( not ( = ?auto_11756 ?auto_11737 ) ) ( HOIST-AT ?auto_11761 ?auto_11756 ) ( AVAILABLE ?auto_11761 ) ( SURFACE-AT ?auto_11724 ?auto_11756 ) ( ON ?auto_11724 ?auto_11746 ) ( CLEAR ?auto_11724 ) ( not ( = ?auto_11723 ?auto_11724 ) ) ( not ( = ?auto_11723 ?auto_11746 ) ) ( not ( = ?auto_11724 ?auto_11746 ) ) ( not ( = ?auto_11736 ?auto_11761 ) ) ( IS-CRATE ?auto_11723 ) ( not ( = ?auto_11757 ?auto_11737 ) ) ( HOIST-AT ?auto_11745 ?auto_11757 ) ( AVAILABLE ?auto_11745 ) ( SURFACE-AT ?auto_11723 ?auto_11757 ) ( ON ?auto_11723 ?auto_11750 ) ( CLEAR ?auto_11723 ) ( not ( = ?auto_11722 ?auto_11723 ) ) ( not ( = ?auto_11722 ?auto_11750 ) ) ( not ( = ?auto_11723 ?auto_11750 ) ) ( not ( = ?auto_11736 ?auto_11745 ) ) ( IS-CRATE ?auto_11722 ) ( AVAILABLE ?auto_11734 ) ( SURFACE-AT ?auto_11722 ?auto_11735 ) ( ON ?auto_11722 ?auto_11755 ) ( CLEAR ?auto_11722 ) ( not ( = ?auto_11721 ?auto_11722 ) ) ( not ( = ?auto_11721 ?auto_11755 ) ) ( not ( = ?auto_11722 ?auto_11755 ) ) ( SURFACE-AT ?auto_11720 ?auto_11737 ) ( CLEAR ?auto_11720 ) ( IS-CRATE ?auto_11721 ) ( AVAILABLE ?auto_11736 ) ( AVAILABLE ?auto_11742 ) ( SURFACE-AT ?auto_11721 ?auto_11751 ) ( ON ?auto_11721 ?auto_11747 ) ( CLEAR ?auto_11721 ) ( TRUCK-AT ?auto_11738 ?auto_11737 ) ( not ( = ?auto_11720 ?auto_11721 ) ) ( not ( = ?auto_11720 ?auto_11747 ) ) ( not ( = ?auto_11721 ?auto_11747 ) ) ( not ( = ?auto_11720 ?auto_11722 ) ) ( not ( = ?auto_11720 ?auto_11755 ) ) ( not ( = ?auto_11722 ?auto_11747 ) ) ( not ( = ?auto_11735 ?auto_11751 ) ) ( not ( = ?auto_11734 ?auto_11742 ) ) ( not ( = ?auto_11755 ?auto_11747 ) ) ( not ( = ?auto_11720 ?auto_11723 ) ) ( not ( = ?auto_11720 ?auto_11750 ) ) ( not ( = ?auto_11721 ?auto_11723 ) ) ( not ( = ?auto_11721 ?auto_11750 ) ) ( not ( = ?auto_11723 ?auto_11755 ) ) ( not ( = ?auto_11723 ?auto_11747 ) ) ( not ( = ?auto_11757 ?auto_11735 ) ) ( not ( = ?auto_11757 ?auto_11751 ) ) ( not ( = ?auto_11745 ?auto_11734 ) ) ( not ( = ?auto_11745 ?auto_11742 ) ) ( not ( = ?auto_11750 ?auto_11755 ) ) ( not ( = ?auto_11750 ?auto_11747 ) ) ( not ( = ?auto_11720 ?auto_11724 ) ) ( not ( = ?auto_11720 ?auto_11746 ) ) ( not ( = ?auto_11721 ?auto_11724 ) ) ( not ( = ?auto_11721 ?auto_11746 ) ) ( not ( = ?auto_11722 ?auto_11724 ) ) ( not ( = ?auto_11722 ?auto_11746 ) ) ( not ( = ?auto_11724 ?auto_11750 ) ) ( not ( = ?auto_11724 ?auto_11755 ) ) ( not ( = ?auto_11724 ?auto_11747 ) ) ( not ( = ?auto_11756 ?auto_11757 ) ) ( not ( = ?auto_11756 ?auto_11735 ) ) ( not ( = ?auto_11756 ?auto_11751 ) ) ( not ( = ?auto_11761 ?auto_11745 ) ) ( not ( = ?auto_11761 ?auto_11734 ) ) ( not ( = ?auto_11761 ?auto_11742 ) ) ( not ( = ?auto_11746 ?auto_11750 ) ) ( not ( = ?auto_11746 ?auto_11755 ) ) ( not ( = ?auto_11746 ?auto_11747 ) ) ( not ( = ?auto_11720 ?auto_11725 ) ) ( not ( = ?auto_11720 ?auto_11741 ) ) ( not ( = ?auto_11721 ?auto_11725 ) ) ( not ( = ?auto_11721 ?auto_11741 ) ) ( not ( = ?auto_11722 ?auto_11725 ) ) ( not ( = ?auto_11722 ?auto_11741 ) ) ( not ( = ?auto_11723 ?auto_11725 ) ) ( not ( = ?auto_11723 ?auto_11741 ) ) ( not ( = ?auto_11725 ?auto_11746 ) ) ( not ( = ?auto_11725 ?auto_11750 ) ) ( not ( = ?auto_11725 ?auto_11755 ) ) ( not ( = ?auto_11725 ?auto_11747 ) ) ( not ( = ?auto_11760 ?auto_11756 ) ) ( not ( = ?auto_11760 ?auto_11757 ) ) ( not ( = ?auto_11760 ?auto_11735 ) ) ( not ( = ?auto_11760 ?auto_11751 ) ) ( not ( = ?auto_11744 ?auto_11761 ) ) ( not ( = ?auto_11744 ?auto_11745 ) ) ( not ( = ?auto_11744 ?auto_11734 ) ) ( not ( = ?auto_11744 ?auto_11742 ) ) ( not ( = ?auto_11741 ?auto_11746 ) ) ( not ( = ?auto_11741 ?auto_11750 ) ) ( not ( = ?auto_11741 ?auto_11755 ) ) ( not ( = ?auto_11741 ?auto_11747 ) ) ( not ( = ?auto_11720 ?auto_11726 ) ) ( not ( = ?auto_11720 ?auto_11740 ) ) ( not ( = ?auto_11721 ?auto_11726 ) ) ( not ( = ?auto_11721 ?auto_11740 ) ) ( not ( = ?auto_11722 ?auto_11726 ) ) ( not ( = ?auto_11722 ?auto_11740 ) ) ( not ( = ?auto_11723 ?auto_11726 ) ) ( not ( = ?auto_11723 ?auto_11740 ) ) ( not ( = ?auto_11724 ?auto_11726 ) ) ( not ( = ?auto_11724 ?auto_11740 ) ) ( not ( = ?auto_11726 ?auto_11741 ) ) ( not ( = ?auto_11726 ?auto_11746 ) ) ( not ( = ?auto_11726 ?auto_11750 ) ) ( not ( = ?auto_11726 ?auto_11755 ) ) ( not ( = ?auto_11726 ?auto_11747 ) ) ( not ( = ?auto_11743 ?auto_11760 ) ) ( not ( = ?auto_11743 ?auto_11756 ) ) ( not ( = ?auto_11743 ?auto_11757 ) ) ( not ( = ?auto_11743 ?auto_11735 ) ) ( not ( = ?auto_11743 ?auto_11751 ) ) ( not ( = ?auto_11762 ?auto_11744 ) ) ( not ( = ?auto_11762 ?auto_11761 ) ) ( not ( = ?auto_11762 ?auto_11745 ) ) ( not ( = ?auto_11762 ?auto_11734 ) ) ( not ( = ?auto_11762 ?auto_11742 ) ) ( not ( = ?auto_11740 ?auto_11741 ) ) ( not ( = ?auto_11740 ?auto_11746 ) ) ( not ( = ?auto_11740 ?auto_11750 ) ) ( not ( = ?auto_11740 ?auto_11755 ) ) ( not ( = ?auto_11740 ?auto_11747 ) ) ( not ( = ?auto_11720 ?auto_11727 ) ) ( not ( = ?auto_11720 ?auto_11748 ) ) ( not ( = ?auto_11721 ?auto_11727 ) ) ( not ( = ?auto_11721 ?auto_11748 ) ) ( not ( = ?auto_11722 ?auto_11727 ) ) ( not ( = ?auto_11722 ?auto_11748 ) ) ( not ( = ?auto_11723 ?auto_11727 ) ) ( not ( = ?auto_11723 ?auto_11748 ) ) ( not ( = ?auto_11724 ?auto_11727 ) ) ( not ( = ?auto_11724 ?auto_11748 ) ) ( not ( = ?auto_11725 ?auto_11727 ) ) ( not ( = ?auto_11725 ?auto_11748 ) ) ( not ( = ?auto_11727 ?auto_11740 ) ) ( not ( = ?auto_11727 ?auto_11741 ) ) ( not ( = ?auto_11727 ?auto_11746 ) ) ( not ( = ?auto_11727 ?auto_11750 ) ) ( not ( = ?auto_11727 ?auto_11755 ) ) ( not ( = ?auto_11727 ?auto_11747 ) ) ( not ( = ?auto_11759 ?auto_11743 ) ) ( not ( = ?auto_11759 ?auto_11760 ) ) ( not ( = ?auto_11759 ?auto_11756 ) ) ( not ( = ?auto_11759 ?auto_11757 ) ) ( not ( = ?auto_11759 ?auto_11735 ) ) ( not ( = ?auto_11759 ?auto_11751 ) ) ( not ( = ?auto_11739 ?auto_11762 ) ) ( not ( = ?auto_11739 ?auto_11744 ) ) ( not ( = ?auto_11739 ?auto_11761 ) ) ( not ( = ?auto_11739 ?auto_11745 ) ) ( not ( = ?auto_11739 ?auto_11734 ) ) ( not ( = ?auto_11739 ?auto_11742 ) ) ( not ( = ?auto_11748 ?auto_11740 ) ) ( not ( = ?auto_11748 ?auto_11741 ) ) ( not ( = ?auto_11748 ?auto_11746 ) ) ( not ( = ?auto_11748 ?auto_11750 ) ) ( not ( = ?auto_11748 ?auto_11755 ) ) ( not ( = ?auto_11748 ?auto_11747 ) ) ( not ( = ?auto_11720 ?auto_11728 ) ) ( not ( = ?auto_11720 ?auto_11753 ) ) ( not ( = ?auto_11721 ?auto_11728 ) ) ( not ( = ?auto_11721 ?auto_11753 ) ) ( not ( = ?auto_11722 ?auto_11728 ) ) ( not ( = ?auto_11722 ?auto_11753 ) ) ( not ( = ?auto_11723 ?auto_11728 ) ) ( not ( = ?auto_11723 ?auto_11753 ) ) ( not ( = ?auto_11724 ?auto_11728 ) ) ( not ( = ?auto_11724 ?auto_11753 ) ) ( not ( = ?auto_11725 ?auto_11728 ) ) ( not ( = ?auto_11725 ?auto_11753 ) ) ( not ( = ?auto_11726 ?auto_11728 ) ) ( not ( = ?auto_11726 ?auto_11753 ) ) ( not ( = ?auto_11728 ?auto_11748 ) ) ( not ( = ?auto_11728 ?auto_11740 ) ) ( not ( = ?auto_11728 ?auto_11741 ) ) ( not ( = ?auto_11728 ?auto_11746 ) ) ( not ( = ?auto_11728 ?auto_11750 ) ) ( not ( = ?auto_11728 ?auto_11755 ) ) ( not ( = ?auto_11728 ?auto_11747 ) ) ( not ( = ?auto_11753 ?auto_11748 ) ) ( not ( = ?auto_11753 ?auto_11740 ) ) ( not ( = ?auto_11753 ?auto_11741 ) ) ( not ( = ?auto_11753 ?auto_11746 ) ) ( not ( = ?auto_11753 ?auto_11750 ) ) ( not ( = ?auto_11753 ?auto_11755 ) ) ( not ( = ?auto_11753 ?auto_11747 ) ) ( not ( = ?auto_11720 ?auto_11729 ) ) ( not ( = ?auto_11720 ?auto_11752 ) ) ( not ( = ?auto_11721 ?auto_11729 ) ) ( not ( = ?auto_11721 ?auto_11752 ) ) ( not ( = ?auto_11722 ?auto_11729 ) ) ( not ( = ?auto_11722 ?auto_11752 ) ) ( not ( = ?auto_11723 ?auto_11729 ) ) ( not ( = ?auto_11723 ?auto_11752 ) ) ( not ( = ?auto_11724 ?auto_11729 ) ) ( not ( = ?auto_11724 ?auto_11752 ) ) ( not ( = ?auto_11725 ?auto_11729 ) ) ( not ( = ?auto_11725 ?auto_11752 ) ) ( not ( = ?auto_11726 ?auto_11729 ) ) ( not ( = ?auto_11726 ?auto_11752 ) ) ( not ( = ?auto_11727 ?auto_11729 ) ) ( not ( = ?auto_11727 ?auto_11752 ) ) ( not ( = ?auto_11729 ?auto_11753 ) ) ( not ( = ?auto_11729 ?auto_11748 ) ) ( not ( = ?auto_11729 ?auto_11740 ) ) ( not ( = ?auto_11729 ?auto_11741 ) ) ( not ( = ?auto_11729 ?auto_11746 ) ) ( not ( = ?auto_11729 ?auto_11750 ) ) ( not ( = ?auto_11729 ?auto_11755 ) ) ( not ( = ?auto_11729 ?auto_11747 ) ) ( not ( = ?auto_11752 ?auto_11753 ) ) ( not ( = ?auto_11752 ?auto_11748 ) ) ( not ( = ?auto_11752 ?auto_11740 ) ) ( not ( = ?auto_11752 ?auto_11741 ) ) ( not ( = ?auto_11752 ?auto_11746 ) ) ( not ( = ?auto_11752 ?auto_11750 ) ) ( not ( = ?auto_11752 ?auto_11755 ) ) ( not ( = ?auto_11752 ?auto_11747 ) ) ( not ( = ?auto_11720 ?auto_11730 ) ) ( not ( = ?auto_11720 ?auto_11749 ) ) ( not ( = ?auto_11721 ?auto_11730 ) ) ( not ( = ?auto_11721 ?auto_11749 ) ) ( not ( = ?auto_11722 ?auto_11730 ) ) ( not ( = ?auto_11722 ?auto_11749 ) ) ( not ( = ?auto_11723 ?auto_11730 ) ) ( not ( = ?auto_11723 ?auto_11749 ) ) ( not ( = ?auto_11724 ?auto_11730 ) ) ( not ( = ?auto_11724 ?auto_11749 ) ) ( not ( = ?auto_11725 ?auto_11730 ) ) ( not ( = ?auto_11725 ?auto_11749 ) ) ( not ( = ?auto_11726 ?auto_11730 ) ) ( not ( = ?auto_11726 ?auto_11749 ) ) ( not ( = ?auto_11727 ?auto_11730 ) ) ( not ( = ?auto_11727 ?auto_11749 ) ) ( not ( = ?auto_11728 ?auto_11730 ) ) ( not ( = ?auto_11728 ?auto_11749 ) ) ( not ( = ?auto_11730 ?auto_11752 ) ) ( not ( = ?auto_11730 ?auto_11753 ) ) ( not ( = ?auto_11730 ?auto_11748 ) ) ( not ( = ?auto_11730 ?auto_11740 ) ) ( not ( = ?auto_11730 ?auto_11741 ) ) ( not ( = ?auto_11730 ?auto_11746 ) ) ( not ( = ?auto_11730 ?auto_11750 ) ) ( not ( = ?auto_11730 ?auto_11755 ) ) ( not ( = ?auto_11730 ?auto_11747 ) ) ( not ( = ?auto_11749 ?auto_11752 ) ) ( not ( = ?auto_11749 ?auto_11753 ) ) ( not ( = ?auto_11749 ?auto_11748 ) ) ( not ( = ?auto_11749 ?auto_11740 ) ) ( not ( = ?auto_11749 ?auto_11741 ) ) ( not ( = ?auto_11749 ?auto_11746 ) ) ( not ( = ?auto_11749 ?auto_11750 ) ) ( not ( = ?auto_11749 ?auto_11755 ) ) ( not ( = ?auto_11749 ?auto_11747 ) ) ( not ( = ?auto_11720 ?auto_11731 ) ) ( not ( = ?auto_11720 ?auto_11758 ) ) ( not ( = ?auto_11721 ?auto_11731 ) ) ( not ( = ?auto_11721 ?auto_11758 ) ) ( not ( = ?auto_11722 ?auto_11731 ) ) ( not ( = ?auto_11722 ?auto_11758 ) ) ( not ( = ?auto_11723 ?auto_11731 ) ) ( not ( = ?auto_11723 ?auto_11758 ) ) ( not ( = ?auto_11724 ?auto_11731 ) ) ( not ( = ?auto_11724 ?auto_11758 ) ) ( not ( = ?auto_11725 ?auto_11731 ) ) ( not ( = ?auto_11725 ?auto_11758 ) ) ( not ( = ?auto_11726 ?auto_11731 ) ) ( not ( = ?auto_11726 ?auto_11758 ) ) ( not ( = ?auto_11727 ?auto_11731 ) ) ( not ( = ?auto_11727 ?auto_11758 ) ) ( not ( = ?auto_11728 ?auto_11731 ) ) ( not ( = ?auto_11728 ?auto_11758 ) ) ( not ( = ?auto_11729 ?auto_11731 ) ) ( not ( = ?auto_11729 ?auto_11758 ) ) ( not ( = ?auto_11731 ?auto_11749 ) ) ( not ( = ?auto_11731 ?auto_11752 ) ) ( not ( = ?auto_11731 ?auto_11753 ) ) ( not ( = ?auto_11731 ?auto_11748 ) ) ( not ( = ?auto_11731 ?auto_11740 ) ) ( not ( = ?auto_11731 ?auto_11741 ) ) ( not ( = ?auto_11731 ?auto_11746 ) ) ( not ( = ?auto_11731 ?auto_11750 ) ) ( not ( = ?auto_11731 ?auto_11755 ) ) ( not ( = ?auto_11731 ?auto_11747 ) ) ( not ( = ?auto_11754 ?auto_11751 ) ) ( not ( = ?auto_11754 ?auto_11735 ) ) ( not ( = ?auto_11754 ?auto_11759 ) ) ( not ( = ?auto_11754 ?auto_11743 ) ) ( not ( = ?auto_11754 ?auto_11760 ) ) ( not ( = ?auto_11754 ?auto_11756 ) ) ( not ( = ?auto_11754 ?auto_11757 ) ) ( not ( = ?auto_11763 ?auto_11742 ) ) ( not ( = ?auto_11763 ?auto_11734 ) ) ( not ( = ?auto_11763 ?auto_11739 ) ) ( not ( = ?auto_11763 ?auto_11762 ) ) ( not ( = ?auto_11763 ?auto_11744 ) ) ( not ( = ?auto_11763 ?auto_11761 ) ) ( not ( = ?auto_11763 ?auto_11745 ) ) ( not ( = ?auto_11758 ?auto_11749 ) ) ( not ( = ?auto_11758 ?auto_11752 ) ) ( not ( = ?auto_11758 ?auto_11753 ) ) ( not ( = ?auto_11758 ?auto_11748 ) ) ( not ( = ?auto_11758 ?auto_11740 ) ) ( not ( = ?auto_11758 ?auto_11741 ) ) ( not ( = ?auto_11758 ?auto_11746 ) ) ( not ( = ?auto_11758 ?auto_11750 ) ) ( not ( = ?auto_11758 ?auto_11755 ) ) ( not ( = ?auto_11758 ?auto_11747 ) ) ( not ( = ?auto_11720 ?auto_11732 ) ) ( not ( = ?auto_11720 ?auto_11733 ) ) ( not ( = ?auto_11721 ?auto_11732 ) ) ( not ( = ?auto_11721 ?auto_11733 ) ) ( not ( = ?auto_11722 ?auto_11732 ) ) ( not ( = ?auto_11722 ?auto_11733 ) ) ( not ( = ?auto_11723 ?auto_11732 ) ) ( not ( = ?auto_11723 ?auto_11733 ) ) ( not ( = ?auto_11724 ?auto_11732 ) ) ( not ( = ?auto_11724 ?auto_11733 ) ) ( not ( = ?auto_11725 ?auto_11732 ) ) ( not ( = ?auto_11725 ?auto_11733 ) ) ( not ( = ?auto_11726 ?auto_11732 ) ) ( not ( = ?auto_11726 ?auto_11733 ) ) ( not ( = ?auto_11727 ?auto_11732 ) ) ( not ( = ?auto_11727 ?auto_11733 ) ) ( not ( = ?auto_11728 ?auto_11732 ) ) ( not ( = ?auto_11728 ?auto_11733 ) ) ( not ( = ?auto_11729 ?auto_11732 ) ) ( not ( = ?auto_11729 ?auto_11733 ) ) ( not ( = ?auto_11730 ?auto_11732 ) ) ( not ( = ?auto_11730 ?auto_11733 ) ) ( not ( = ?auto_11732 ?auto_11758 ) ) ( not ( = ?auto_11732 ?auto_11749 ) ) ( not ( = ?auto_11732 ?auto_11752 ) ) ( not ( = ?auto_11732 ?auto_11753 ) ) ( not ( = ?auto_11732 ?auto_11748 ) ) ( not ( = ?auto_11732 ?auto_11740 ) ) ( not ( = ?auto_11732 ?auto_11741 ) ) ( not ( = ?auto_11732 ?auto_11746 ) ) ( not ( = ?auto_11732 ?auto_11750 ) ) ( not ( = ?auto_11732 ?auto_11755 ) ) ( not ( = ?auto_11732 ?auto_11747 ) ) ( not ( = ?auto_11733 ?auto_11758 ) ) ( not ( = ?auto_11733 ?auto_11749 ) ) ( not ( = ?auto_11733 ?auto_11752 ) ) ( not ( = ?auto_11733 ?auto_11753 ) ) ( not ( = ?auto_11733 ?auto_11748 ) ) ( not ( = ?auto_11733 ?auto_11740 ) ) ( not ( = ?auto_11733 ?auto_11741 ) ) ( not ( = ?auto_11733 ?auto_11746 ) ) ( not ( = ?auto_11733 ?auto_11750 ) ) ( not ( = ?auto_11733 ?auto_11755 ) ) ( not ( = ?auto_11733 ?auto_11747 ) ) )
    :subtasks
    ( ( MAKE-11CRATE ?auto_11720 ?auto_11721 ?auto_11722 ?auto_11723 ?auto_11724 ?auto_11725 ?auto_11726 ?auto_11727 ?auto_11728 ?auto_11729 ?auto_11730 ?auto_11731 )
      ( MAKE-1CRATE ?auto_11731 ?auto_11732 )
      ( MAKE-12CRATE-VERIFY ?auto_11720 ?auto_11721 ?auto_11722 ?auto_11723 ?auto_11724 ?auto_11725 ?auto_11726 ?auto_11727 ?auto_11728 ?auto_11729 ?auto_11730 ?auto_11731 ?auto_11732 ) )
  )

)

