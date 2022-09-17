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

  ( :method MAKE-13CRATE-VERIFY
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
      ?c13 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( ON ?c11 ?c10 ) ( ON ?c12 ?c11 ) ( ON ?c13 ?c12 ) ( CLEAR ?c13 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-14CRATE-VERIFY
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
      ?c13 - SURFACE
      ?c14 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( ON ?c11 ?c10 ) ( ON ?c12 ?c11 ) ( ON ?c13 ?c12 ) ( ON ?c14 ?c13 ) ( CLEAR ?c14 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1259283 - SURFACE
      ?auto_1259284 - SURFACE
    )
    :vars
    (
      ?auto_1259285 - HOIST
      ?auto_1259286 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1259285 ?auto_1259286 ) ( SURFACE-AT ?auto_1259283 ?auto_1259286 ) ( CLEAR ?auto_1259283 ) ( LIFTING ?auto_1259285 ?auto_1259284 ) ( IS-CRATE ?auto_1259284 ) ( not ( = ?auto_1259283 ?auto_1259284 ) ) )
    :subtasks
    ( ( !DROP ?auto_1259285 ?auto_1259284 ?auto_1259283 ?auto_1259286 )
      ( MAKE-1CRATE-VERIFY ?auto_1259283 ?auto_1259284 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1259287 - SURFACE
      ?auto_1259288 - SURFACE
    )
    :vars
    (
      ?auto_1259289 - HOIST
      ?auto_1259290 - PLACE
      ?auto_1259291 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1259289 ?auto_1259290 ) ( SURFACE-AT ?auto_1259287 ?auto_1259290 ) ( CLEAR ?auto_1259287 ) ( IS-CRATE ?auto_1259288 ) ( not ( = ?auto_1259287 ?auto_1259288 ) ) ( TRUCK-AT ?auto_1259291 ?auto_1259290 ) ( AVAILABLE ?auto_1259289 ) ( IN ?auto_1259288 ?auto_1259291 ) )
    :subtasks
    ( ( !UNLOAD ?auto_1259289 ?auto_1259288 ?auto_1259291 ?auto_1259290 )
      ( MAKE-1CRATE ?auto_1259287 ?auto_1259288 )
      ( MAKE-1CRATE-VERIFY ?auto_1259287 ?auto_1259288 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1259292 - SURFACE
      ?auto_1259293 - SURFACE
    )
    :vars
    (
      ?auto_1259296 - HOIST
      ?auto_1259294 - PLACE
      ?auto_1259295 - TRUCK
      ?auto_1259297 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1259296 ?auto_1259294 ) ( SURFACE-AT ?auto_1259292 ?auto_1259294 ) ( CLEAR ?auto_1259292 ) ( IS-CRATE ?auto_1259293 ) ( not ( = ?auto_1259292 ?auto_1259293 ) ) ( AVAILABLE ?auto_1259296 ) ( IN ?auto_1259293 ?auto_1259295 ) ( TRUCK-AT ?auto_1259295 ?auto_1259297 ) ( not ( = ?auto_1259297 ?auto_1259294 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1259295 ?auto_1259297 ?auto_1259294 )
      ( MAKE-1CRATE ?auto_1259292 ?auto_1259293 )
      ( MAKE-1CRATE-VERIFY ?auto_1259292 ?auto_1259293 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1259298 - SURFACE
      ?auto_1259299 - SURFACE
    )
    :vars
    (
      ?auto_1259300 - HOIST
      ?auto_1259303 - PLACE
      ?auto_1259301 - TRUCK
      ?auto_1259302 - PLACE
      ?auto_1259304 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1259300 ?auto_1259303 ) ( SURFACE-AT ?auto_1259298 ?auto_1259303 ) ( CLEAR ?auto_1259298 ) ( IS-CRATE ?auto_1259299 ) ( not ( = ?auto_1259298 ?auto_1259299 ) ) ( AVAILABLE ?auto_1259300 ) ( TRUCK-AT ?auto_1259301 ?auto_1259302 ) ( not ( = ?auto_1259302 ?auto_1259303 ) ) ( HOIST-AT ?auto_1259304 ?auto_1259302 ) ( LIFTING ?auto_1259304 ?auto_1259299 ) ( not ( = ?auto_1259300 ?auto_1259304 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1259304 ?auto_1259299 ?auto_1259301 ?auto_1259302 )
      ( MAKE-1CRATE ?auto_1259298 ?auto_1259299 )
      ( MAKE-1CRATE-VERIFY ?auto_1259298 ?auto_1259299 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1259305 - SURFACE
      ?auto_1259306 - SURFACE
    )
    :vars
    (
      ?auto_1259309 - HOIST
      ?auto_1259308 - PLACE
      ?auto_1259307 - TRUCK
      ?auto_1259311 - PLACE
      ?auto_1259310 - HOIST
      ?auto_1259312 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1259309 ?auto_1259308 ) ( SURFACE-AT ?auto_1259305 ?auto_1259308 ) ( CLEAR ?auto_1259305 ) ( IS-CRATE ?auto_1259306 ) ( not ( = ?auto_1259305 ?auto_1259306 ) ) ( AVAILABLE ?auto_1259309 ) ( TRUCK-AT ?auto_1259307 ?auto_1259311 ) ( not ( = ?auto_1259311 ?auto_1259308 ) ) ( HOIST-AT ?auto_1259310 ?auto_1259311 ) ( not ( = ?auto_1259309 ?auto_1259310 ) ) ( AVAILABLE ?auto_1259310 ) ( SURFACE-AT ?auto_1259306 ?auto_1259311 ) ( ON ?auto_1259306 ?auto_1259312 ) ( CLEAR ?auto_1259306 ) ( not ( = ?auto_1259305 ?auto_1259312 ) ) ( not ( = ?auto_1259306 ?auto_1259312 ) ) )
    :subtasks
    ( ( !LIFT ?auto_1259310 ?auto_1259306 ?auto_1259312 ?auto_1259311 )
      ( MAKE-1CRATE ?auto_1259305 ?auto_1259306 )
      ( MAKE-1CRATE-VERIFY ?auto_1259305 ?auto_1259306 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1259313 - SURFACE
      ?auto_1259314 - SURFACE
    )
    :vars
    (
      ?auto_1259320 - HOIST
      ?auto_1259319 - PLACE
      ?auto_1259316 - PLACE
      ?auto_1259318 - HOIST
      ?auto_1259317 - SURFACE
      ?auto_1259315 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1259320 ?auto_1259319 ) ( SURFACE-AT ?auto_1259313 ?auto_1259319 ) ( CLEAR ?auto_1259313 ) ( IS-CRATE ?auto_1259314 ) ( not ( = ?auto_1259313 ?auto_1259314 ) ) ( AVAILABLE ?auto_1259320 ) ( not ( = ?auto_1259316 ?auto_1259319 ) ) ( HOIST-AT ?auto_1259318 ?auto_1259316 ) ( not ( = ?auto_1259320 ?auto_1259318 ) ) ( AVAILABLE ?auto_1259318 ) ( SURFACE-AT ?auto_1259314 ?auto_1259316 ) ( ON ?auto_1259314 ?auto_1259317 ) ( CLEAR ?auto_1259314 ) ( not ( = ?auto_1259313 ?auto_1259317 ) ) ( not ( = ?auto_1259314 ?auto_1259317 ) ) ( TRUCK-AT ?auto_1259315 ?auto_1259319 ) )
    :subtasks
    ( ( !DRIVE ?auto_1259315 ?auto_1259319 ?auto_1259316 )
      ( MAKE-1CRATE ?auto_1259313 ?auto_1259314 )
      ( MAKE-1CRATE-VERIFY ?auto_1259313 ?auto_1259314 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1259330 - SURFACE
      ?auto_1259331 - SURFACE
      ?auto_1259332 - SURFACE
    )
    :vars
    (
      ?auto_1259333 - HOIST
      ?auto_1259334 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1259333 ?auto_1259334 ) ( SURFACE-AT ?auto_1259331 ?auto_1259334 ) ( CLEAR ?auto_1259331 ) ( LIFTING ?auto_1259333 ?auto_1259332 ) ( IS-CRATE ?auto_1259332 ) ( not ( = ?auto_1259331 ?auto_1259332 ) ) ( ON ?auto_1259331 ?auto_1259330 ) ( not ( = ?auto_1259330 ?auto_1259331 ) ) ( not ( = ?auto_1259330 ?auto_1259332 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1259331 ?auto_1259332 )
      ( MAKE-2CRATE-VERIFY ?auto_1259330 ?auto_1259331 ?auto_1259332 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1259340 - SURFACE
      ?auto_1259341 - SURFACE
      ?auto_1259342 - SURFACE
    )
    :vars
    (
      ?auto_1259344 - HOIST
      ?auto_1259345 - PLACE
      ?auto_1259343 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1259344 ?auto_1259345 ) ( SURFACE-AT ?auto_1259341 ?auto_1259345 ) ( CLEAR ?auto_1259341 ) ( IS-CRATE ?auto_1259342 ) ( not ( = ?auto_1259341 ?auto_1259342 ) ) ( TRUCK-AT ?auto_1259343 ?auto_1259345 ) ( AVAILABLE ?auto_1259344 ) ( IN ?auto_1259342 ?auto_1259343 ) ( ON ?auto_1259341 ?auto_1259340 ) ( not ( = ?auto_1259340 ?auto_1259341 ) ) ( not ( = ?auto_1259340 ?auto_1259342 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1259341 ?auto_1259342 )
      ( MAKE-2CRATE-VERIFY ?auto_1259340 ?auto_1259341 ?auto_1259342 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1259346 - SURFACE
      ?auto_1259347 - SURFACE
    )
    :vars
    (
      ?auto_1259350 - HOIST
      ?auto_1259348 - PLACE
      ?auto_1259349 - TRUCK
      ?auto_1259351 - SURFACE
      ?auto_1259352 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1259350 ?auto_1259348 ) ( SURFACE-AT ?auto_1259346 ?auto_1259348 ) ( CLEAR ?auto_1259346 ) ( IS-CRATE ?auto_1259347 ) ( not ( = ?auto_1259346 ?auto_1259347 ) ) ( AVAILABLE ?auto_1259350 ) ( IN ?auto_1259347 ?auto_1259349 ) ( ON ?auto_1259346 ?auto_1259351 ) ( not ( = ?auto_1259351 ?auto_1259346 ) ) ( not ( = ?auto_1259351 ?auto_1259347 ) ) ( TRUCK-AT ?auto_1259349 ?auto_1259352 ) ( not ( = ?auto_1259352 ?auto_1259348 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1259349 ?auto_1259352 ?auto_1259348 )
      ( MAKE-2CRATE ?auto_1259351 ?auto_1259346 ?auto_1259347 )
      ( MAKE-1CRATE-VERIFY ?auto_1259346 ?auto_1259347 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1259353 - SURFACE
      ?auto_1259354 - SURFACE
      ?auto_1259355 - SURFACE
    )
    :vars
    (
      ?auto_1259359 - HOIST
      ?auto_1259356 - PLACE
      ?auto_1259358 - TRUCK
      ?auto_1259357 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1259359 ?auto_1259356 ) ( SURFACE-AT ?auto_1259354 ?auto_1259356 ) ( CLEAR ?auto_1259354 ) ( IS-CRATE ?auto_1259355 ) ( not ( = ?auto_1259354 ?auto_1259355 ) ) ( AVAILABLE ?auto_1259359 ) ( IN ?auto_1259355 ?auto_1259358 ) ( ON ?auto_1259354 ?auto_1259353 ) ( not ( = ?auto_1259353 ?auto_1259354 ) ) ( not ( = ?auto_1259353 ?auto_1259355 ) ) ( TRUCK-AT ?auto_1259358 ?auto_1259357 ) ( not ( = ?auto_1259357 ?auto_1259356 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1259354 ?auto_1259355 )
      ( MAKE-2CRATE-VERIFY ?auto_1259353 ?auto_1259354 ?auto_1259355 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1259360 - SURFACE
      ?auto_1259361 - SURFACE
    )
    :vars
    (
      ?auto_1259366 - HOIST
      ?auto_1259365 - PLACE
      ?auto_1259362 - SURFACE
      ?auto_1259363 - TRUCK
      ?auto_1259364 - PLACE
      ?auto_1259367 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1259366 ?auto_1259365 ) ( SURFACE-AT ?auto_1259360 ?auto_1259365 ) ( CLEAR ?auto_1259360 ) ( IS-CRATE ?auto_1259361 ) ( not ( = ?auto_1259360 ?auto_1259361 ) ) ( AVAILABLE ?auto_1259366 ) ( ON ?auto_1259360 ?auto_1259362 ) ( not ( = ?auto_1259362 ?auto_1259360 ) ) ( not ( = ?auto_1259362 ?auto_1259361 ) ) ( TRUCK-AT ?auto_1259363 ?auto_1259364 ) ( not ( = ?auto_1259364 ?auto_1259365 ) ) ( HOIST-AT ?auto_1259367 ?auto_1259364 ) ( LIFTING ?auto_1259367 ?auto_1259361 ) ( not ( = ?auto_1259366 ?auto_1259367 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1259367 ?auto_1259361 ?auto_1259363 ?auto_1259364 )
      ( MAKE-2CRATE ?auto_1259362 ?auto_1259360 ?auto_1259361 )
      ( MAKE-1CRATE-VERIFY ?auto_1259360 ?auto_1259361 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1259368 - SURFACE
      ?auto_1259369 - SURFACE
      ?auto_1259370 - SURFACE
    )
    :vars
    (
      ?auto_1259372 - HOIST
      ?auto_1259374 - PLACE
      ?auto_1259371 - TRUCK
      ?auto_1259373 - PLACE
      ?auto_1259375 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1259372 ?auto_1259374 ) ( SURFACE-AT ?auto_1259369 ?auto_1259374 ) ( CLEAR ?auto_1259369 ) ( IS-CRATE ?auto_1259370 ) ( not ( = ?auto_1259369 ?auto_1259370 ) ) ( AVAILABLE ?auto_1259372 ) ( ON ?auto_1259369 ?auto_1259368 ) ( not ( = ?auto_1259368 ?auto_1259369 ) ) ( not ( = ?auto_1259368 ?auto_1259370 ) ) ( TRUCK-AT ?auto_1259371 ?auto_1259373 ) ( not ( = ?auto_1259373 ?auto_1259374 ) ) ( HOIST-AT ?auto_1259375 ?auto_1259373 ) ( LIFTING ?auto_1259375 ?auto_1259370 ) ( not ( = ?auto_1259372 ?auto_1259375 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1259369 ?auto_1259370 )
      ( MAKE-2CRATE-VERIFY ?auto_1259368 ?auto_1259369 ?auto_1259370 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1259376 - SURFACE
      ?auto_1259377 - SURFACE
    )
    :vars
    (
      ?auto_1259381 - HOIST
      ?auto_1259378 - PLACE
      ?auto_1259379 - SURFACE
      ?auto_1259383 - TRUCK
      ?auto_1259380 - PLACE
      ?auto_1259382 - HOIST
      ?auto_1259384 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1259381 ?auto_1259378 ) ( SURFACE-AT ?auto_1259376 ?auto_1259378 ) ( CLEAR ?auto_1259376 ) ( IS-CRATE ?auto_1259377 ) ( not ( = ?auto_1259376 ?auto_1259377 ) ) ( AVAILABLE ?auto_1259381 ) ( ON ?auto_1259376 ?auto_1259379 ) ( not ( = ?auto_1259379 ?auto_1259376 ) ) ( not ( = ?auto_1259379 ?auto_1259377 ) ) ( TRUCK-AT ?auto_1259383 ?auto_1259380 ) ( not ( = ?auto_1259380 ?auto_1259378 ) ) ( HOIST-AT ?auto_1259382 ?auto_1259380 ) ( not ( = ?auto_1259381 ?auto_1259382 ) ) ( AVAILABLE ?auto_1259382 ) ( SURFACE-AT ?auto_1259377 ?auto_1259380 ) ( ON ?auto_1259377 ?auto_1259384 ) ( CLEAR ?auto_1259377 ) ( not ( = ?auto_1259376 ?auto_1259384 ) ) ( not ( = ?auto_1259377 ?auto_1259384 ) ) ( not ( = ?auto_1259379 ?auto_1259384 ) ) )
    :subtasks
    ( ( !LIFT ?auto_1259382 ?auto_1259377 ?auto_1259384 ?auto_1259380 )
      ( MAKE-2CRATE ?auto_1259379 ?auto_1259376 ?auto_1259377 )
      ( MAKE-1CRATE-VERIFY ?auto_1259376 ?auto_1259377 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1259385 - SURFACE
      ?auto_1259386 - SURFACE
      ?auto_1259387 - SURFACE
    )
    :vars
    (
      ?auto_1259393 - HOIST
      ?auto_1259390 - PLACE
      ?auto_1259392 - TRUCK
      ?auto_1259388 - PLACE
      ?auto_1259389 - HOIST
      ?auto_1259391 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1259393 ?auto_1259390 ) ( SURFACE-AT ?auto_1259386 ?auto_1259390 ) ( CLEAR ?auto_1259386 ) ( IS-CRATE ?auto_1259387 ) ( not ( = ?auto_1259386 ?auto_1259387 ) ) ( AVAILABLE ?auto_1259393 ) ( ON ?auto_1259386 ?auto_1259385 ) ( not ( = ?auto_1259385 ?auto_1259386 ) ) ( not ( = ?auto_1259385 ?auto_1259387 ) ) ( TRUCK-AT ?auto_1259392 ?auto_1259388 ) ( not ( = ?auto_1259388 ?auto_1259390 ) ) ( HOIST-AT ?auto_1259389 ?auto_1259388 ) ( not ( = ?auto_1259393 ?auto_1259389 ) ) ( AVAILABLE ?auto_1259389 ) ( SURFACE-AT ?auto_1259387 ?auto_1259388 ) ( ON ?auto_1259387 ?auto_1259391 ) ( CLEAR ?auto_1259387 ) ( not ( = ?auto_1259386 ?auto_1259391 ) ) ( not ( = ?auto_1259387 ?auto_1259391 ) ) ( not ( = ?auto_1259385 ?auto_1259391 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1259386 ?auto_1259387 )
      ( MAKE-2CRATE-VERIFY ?auto_1259385 ?auto_1259386 ?auto_1259387 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1259394 - SURFACE
      ?auto_1259395 - SURFACE
    )
    :vars
    (
      ?auto_1259400 - HOIST
      ?auto_1259398 - PLACE
      ?auto_1259402 - SURFACE
      ?auto_1259399 - PLACE
      ?auto_1259396 - HOIST
      ?auto_1259397 - SURFACE
      ?auto_1259401 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1259400 ?auto_1259398 ) ( SURFACE-AT ?auto_1259394 ?auto_1259398 ) ( CLEAR ?auto_1259394 ) ( IS-CRATE ?auto_1259395 ) ( not ( = ?auto_1259394 ?auto_1259395 ) ) ( AVAILABLE ?auto_1259400 ) ( ON ?auto_1259394 ?auto_1259402 ) ( not ( = ?auto_1259402 ?auto_1259394 ) ) ( not ( = ?auto_1259402 ?auto_1259395 ) ) ( not ( = ?auto_1259399 ?auto_1259398 ) ) ( HOIST-AT ?auto_1259396 ?auto_1259399 ) ( not ( = ?auto_1259400 ?auto_1259396 ) ) ( AVAILABLE ?auto_1259396 ) ( SURFACE-AT ?auto_1259395 ?auto_1259399 ) ( ON ?auto_1259395 ?auto_1259397 ) ( CLEAR ?auto_1259395 ) ( not ( = ?auto_1259394 ?auto_1259397 ) ) ( not ( = ?auto_1259395 ?auto_1259397 ) ) ( not ( = ?auto_1259402 ?auto_1259397 ) ) ( TRUCK-AT ?auto_1259401 ?auto_1259398 ) )
    :subtasks
    ( ( !DRIVE ?auto_1259401 ?auto_1259398 ?auto_1259399 )
      ( MAKE-2CRATE ?auto_1259402 ?auto_1259394 ?auto_1259395 )
      ( MAKE-1CRATE-VERIFY ?auto_1259394 ?auto_1259395 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1259403 - SURFACE
      ?auto_1259404 - SURFACE
      ?auto_1259405 - SURFACE
    )
    :vars
    (
      ?auto_1259406 - HOIST
      ?auto_1259411 - PLACE
      ?auto_1259410 - PLACE
      ?auto_1259407 - HOIST
      ?auto_1259408 - SURFACE
      ?auto_1259409 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1259406 ?auto_1259411 ) ( SURFACE-AT ?auto_1259404 ?auto_1259411 ) ( CLEAR ?auto_1259404 ) ( IS-CRATE ?auto_1259405 ) ( not ( = ?auto_1259404 ?auto_1259405 ) ) ( AVAILABLE ?auto_1259406 ) ( ON ?auto_1259404 ?auto_1259403 ) ( not ( = ?auto_1259403 ?auto_1259404 ) ) ( not ( = ?auto_1259403 ?auto_1259405 ) ) ( not ( = ?auto_1259410 ?auto_1259411 ) ) ( HOIST-AT ?auto_1259407 ?auto_1259410 ) ( not ( = ?auto_1259406 ?auto_1259407 ) ) ( AVAILABLE ?auto_1259407 ) ( SURFACE-AT ?auto_1259405 ?auto_1259410 ) ( ON ?auto_1259405 ?auto_1259408 ) ( CLEAR ?auto_1259405 ) ( not ( = ?auto_1259404 ?auto_1259408 ) ) ( not ( = ?auto_1259405 ?auto_1259408 ) ) ( not ( = ?auto_1259403 ?auto_1259408 ) ) ( TRUCK-AT ?auto_1259409 ?auto_1259411 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1259404 ?auto_1259405 )
      ( MAKE-2CRATE-VERIFY ?auto_1259403 ?auto_1259404 ?auto_1259405 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1259412 - SURFACE
      ?auto_1259413 - SURFACE
    )
    :vars
    (
      ?auto_1259416 - HOIST
      ?auto_1259414 - PLACE
      ?auto_1259415 - SURFACE
      ?auto_1259420 - PLACE
      ?auto_1259418 - HOIST
      ?auto_1259417 - SURFACE
      ?auto_1259419 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1259416 ?auto_1259414 ) ( IS-CRATE ?auto_1259413 ) ( not ( = ?auto_1259412 ?auto_1259413 ) ) ( not ( = ?auto_1259415 ?auto_1259412 ) ) ( not ( = ?auto_1259415 ?auto_1259413 ) ) ( not ( = ?auto_1259420 ?auto_1259414 ) ) ( HOIST-AT ?auto_1259418 ?auto_1259420 ) ( not ( = ?auto_1259416 ?auto_1259418 ) ) ( AVAILABLE ?auto_1259418 ) ( SURFACE-AT ?auto_1259413 ?auto_1259420 ) ( ON ?auto_1259413 ?auto_1259417 ) ( CLEAR ?auto_1259413 ) ( not ( = ?auto_1259412 ?auto_1259417 ) ) ( not ( = ?auto_1259413 ?auto_1259417 ) ) ( not ( = ?auto_1259415 ?auto_1259417 ) ) ( TRUCK-AT ?auto_1259419 ?auto_1259414 ) ( SURFACE-AT ?auto_1259415 ?auto_1259414 ) ( CLEAR ?auto_1259415 ) ( LIFTING ?auto_1259416 ?auto_1259412 ) ( IS-CRATE ?auto_1259412 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1259415 ?auto_1259412 )
      ( MAKE-2CRATE ?auto_1259415 ?auto_1259412 ?auto_1259413 )
      ( MAKE-1CRATE-VERIFY ?auto_1259412 ?auto_1259413 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1259421 - SURFACE
      ?auto_1259422 - SURFACE
      ?auto_1259423 - SURFACE
    )
    :vars
    (
      ?auto_1259428 - HOIST
      ?auto_1259427 - PLACE
      ?auto_1259426 - PLACE
      ?auto_1259424 - HOIST
      ?auto_1259429 - SURFACE
      ?auto_1259425 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1259428 ?auto_1259427 ) ( IS-CRATE ?auto_1259423 ) ( not ( = ?auto_1259422 ?auto_1259423 ) ) ( not ( = ?auto_1259421 ?auto_1259422 ) ) ( not ( = ?auto_1259421 ?auto_1259423 ) ) ( not ( = ?auto_1259426 ?auto_1259427 ) ) ( HOIST-AT ?auto_1259424 ?auto_1259426 ) ( not ( = ?auto_1259428 ?auto_1259424 ) ) ( AVAILABLE ?auto_1259424 ) ( SURFACE-AT ?auto_1259423 ?auto_1259426 ) ( ON ?auto_1259423 ?auto_1259429 ) ( CLEAR ?auto_1259423 ) ( not ( = ?auto_1259422 ?auto_1259429 ) ) ( not ( = ?auto_1259423 ?auto_1259429 ) ) ( not ( = ?auto_1259421 ?auto_1259429 ) ) ( TRUCK-AT ?auto_1259425 ?auto_1259427 ) ( SURFACE-AT ?auto_1259421 ?auto_1259427 ) ( CLEAR ?auto_1259421 ) ( LIFTING ?auto_1259428 ?auto_1259422 ) ( IS-CRATE ?auto_1259422 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1259422 ?auto_1259423 )
      ( MAKE-2CRATE-VERIFY ?auto_1259421 ?auto_1259422 ?auto_1259423 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1259430 - SURFACE
      ?auto_1259431 - SURFACE
    )
    :vars
    (
      ?auto_1259434 - HOIST
      ?auto_1259437 - PLACE
      ?auto_1259435 - SURFACE
      ?auto_1259432 - PLACE
      ?auto_1259438 - HOIST
      ?auto_1259436 - SURFACE
      ?auto_1259433 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1259434 ?auto_1259437 ) ( IS-CRATE ?auto_1259431 ) ( not ( = ?auto_1259430 ?auto_1259431 ) ) ( not ( = ?auto_1259435 ?auto_1259430 ) ) ( not ( = ?auto_1259435 ?auto_1259431 ) ) ( not ( = ?auto_1259432 ?auto_1259437 ) ) ( HOIST-AT ?auto_1259438 ?auto_1259432 ) ( not ( = ?auto_1259434 ?auto_1259438 ) ) ( AVAILABLE ?auto_1259438 ) ( SURFACE-AT ?auto_1259431 ?auto_1259432 ) ( ON ?auto_1259431 ?auto_1259436 ) ( CLEAR ?auto_1259431 ) ( not ( = ?auto_1259430 ?auto_1259436 ) ) ( not ( = ?auto_1259431 ?auto_1259436 ) ) ( not ( = ?auto_1259435 ?auto_1259436 ) ) ( TRUCK-AT ?auto_1259433 ?auto_1259437 ) ( SURFACE-AT ?auto_1259435 ?auto_1259437 ) ( CLEAR ?auto_1259435 ) ( IS-CRATE ?auto_1259430 ) ( AVAILABLE ?auto_1259434 ) ( IN ?auto_1259430 ?auto_1259433 ) )
    :subtasks
    ( ( !UNLOAD ?auto_1259434 ?auto_1259430 ?auto_1259433 ?auto_1259437 )
      ( MAKE-2CRATE ?auto_1259435 ?auto_1259430 ?auto_1259431 )
      ( MAKE-1CRATE-VERIFY ?auto_1259430 ?auto_1259431 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1259439 - SURFACE
      ?auto_1259440 - SURFACE
      ?auto_1259441 - SURFACE
    )
    :vars
    (
      ?auto_1259444 - HOIST
      ?auto_1259442 - PLACE
      ?auto_1259443 - PLACE
      ?auto_1259445 - HOIST
      ?auto_1259446 - SURFACE
      ?auto_1259447 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1259444 ?auto_1259442 ) ( IS-CRATE ?auto_1259441 ) ( not ( = ?auto_1259440 ?auto_1259441 ) ) ( not ( = ?auto_1259439 ?auto_1259440 ) ) ( not ( = ?auto_1259439 ?auto_1259441 ) ) ( not ( = ?auto_1259443 ?auto_1259442 ) ) ( HOIST-AT ?auto_1259445 ?auto_1259443 ) ( not ( = ?auto_1259444 ?auto_1259445 ) ) ( AVAILABLE ?auto_1259445 ) ( SURFACE-AT ?auto_1259441 ?auto_1259443 ) ( ON ?auto_1259441 ?auto_1259446 ) ( CLEAR ?auto_1259441 ) ( not ( = ?auto_1259440 ?auto_1259446 ) ) ( not ( = ?auto_1259441 ?auto_1259446 ) ) ( not ( = ?auto_1259439 ?auto_1259446 ) ) ( TRUCK-AT ?auto_1259447 ?auto_1259442 ) ( SURFACE-AT ?auto_1259439 ?auto_1259442 ) ( CLEAR ?auto_1259439 ) ( IS-CRATE ?auto_1259440 ) ( AVAILABLE ?auto_1259444 ) ( IN ?auto_1259440 ?auto_1259447 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1259440 ?auto_1259441 )
      ( MAKE-2CRATE-VERIFY ?auto_1259439 ?auto_1259440 ?auto_1259441 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1259484 - SURFACE
      ?auto_1259485 - SURFACE
    )
    :vars
    (
      ?auto_1259488 - HOIST
      ?auto_1259492 - PLACE
      ?auto_1259491 - SURFACE
      ?auto_1259490 - PLACE
      ?auto_1259489 - HOIST
      ?auto_1259487 - SURFACE
      ?auto_1259486 - TRUCK
      ?auto_1259493 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1259488 ?auto_1259492 ) ( SURFACE-AT ?auto_1259484 ?auto_1259492 ) ( CLEAR ?auto_1259484 ) ( IS-CRATE ?auto_1259485 ) ( not ( = ?auto_1259484 ?auto_1259485 ) ) ( AVAILABLE ?auto_1259488 ) ( ON ?auto_1259484 ?auto_1259491 ) ( not ( = ?auto_1259491 ?auto_1259484 ) ) ( not ( = ?auto_1259491 ?auto_1259485 ) ) ( not ( = ?auto_1259490 ?auto_1259492 ) ) ( HOIST-AT ?auto_1259489 ?auto_1259490 ) ( not ( = ?auto_1259488 ?auto_1259489 ) ) ( AVAILABLE ?auto_1259489 ) ( SURFACE-AT ?auto_1259485 ?auto_1259490 ) ( ON ?auto_1259485 ?auto_1259487 ) ( CLEAR ?auto_1259485 ) ( not ( = ?auto_1259484 ?auto_1259487 ) ) ( not ( = ?auto_1259485 ?auto_1259487 ) ) ( not ( = ?auto_1259491 ?auto_1259487 ) ) ( TRUCK-AT ?auto_1259486 ?auto_1259493 ) ( not ( = ?auto_1259493 ?auto_1259492 ) ) ( not ( = ?auto_1259490 ?auto_1259493 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1259486 ?auto_1259493 ?auto_1259492 )
      ( MAKE-1CRATE ?auto_1259484 ?auto_1259485 )
      ( MAKE-1CRATE-VERIFY ?auto_1259484 ?auto_1259485 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1259524 - SURFACE
      ?auto_1259525 - SURFACE
      ?auto_1259526 - SURFACE
      ?auto_1259523 - SURFACE
    )
    :vars
    (
      ?auto_1259528 - HOIST
      ?auto_1259527 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1259528 ?auto_1259527 ) ( SURFACE-AT ?auto_1259526 ?auto_1259527 ) ( CLEAR ?auto_1259526 ) ( LIFTING ?auto_1259528 ?auto_1259523 ) ( IS-CRATE ?auto_1259523 ) ( not ( = ?auto_1259526 ?auto_1259523 ) ) ( ON ?auto_1259525 ?auto_1259524 ) ( ON ?auto_1259526 ?auto_1259525 ) ( not ( = ?auto_1259524 ?auto_1259525 ) ) ( not ( = ?auto_1259524 ?auto_1259526 ) ) ( not ( = ?auto_1259524 ?auto_1259523 ) ) ( not ( = ?auto_1259525 ?auto_1259526 ) ) ( not ( = ?auto_1259525 ?auto_1259523 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1259526 ?auto_1259523 )
      ( MAKE-3CRATE-VERIFY ?auto_1259524 ?auto_1259525 ?auto_1259526 ?auto_1259523 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1259541 - SURFACE
      ?auto_1259542 - SURFACE
      ?auto_1259543 - SURFACE
      ?auto_1259540 - SURFACE
    )
    :vars
    (
      ?auto_1259546 - HOIST
      ?auto_1259544 - PLACE
      ?auto_1259545 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1259546 ?auto_1259544 ) ( SURFACE-AT ?auto_1259543 ?auto_1259544 ) ( CLEAR ?auto_1259543 ) ( IS-CRATE ?auto_1259540 ) ( not ( = ?auto_1259543 ?auto_1259540 ) ) ( TRUCK-AT ?auto_1259545 ?auto_1259544 ) ( AVAILABLE ?auto_1259546 ) ( IN ?auto_1259540 ?auto_1259545 ) ( ON ?auto_1259543 ?auto_1259542 ) ( not ( = ?auto_1259542 ?auto_1259543 ) ) ( not ( = ?auto_1259542 ?auto_1259540 ) ) ( ON ?auto_1259542 ?auto_1259541 ) ( not ( = ?auto_1259541 ?auto_1259542 ) ) ( not ( = ?auto_1259541 ?auto_1259543 ) ) ( not ( = ?auto_1259541 ?auto_1259540 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1259542 ?auto_1259543 ?auto_1259540 )
      ( MAKE-3CRATE-VERIFY ?auto_1259541 ?auto_1259542 ?auto_1259543 ?auto_1259540 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1259562 - SURFACE
      ?auto_1259563 - SURFACE
      ?auto_1259564 - SURFACE
      ?auto_1259561 - SURFACE
    )
    :vars
    (
      ?auto_1259566 - HOIST
      ?auto_1259567 - PLACE
      ?auto_1259568 - TRUCK
      ?auto_1259565 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1259566 ?auto_1259567 ) ( SURFACE-AT ?auto_1259564 ?auto_1259567 ) ( CLEAR ?auto_1259564 ) ( IS-CRATE ?auto_1259561 ) ( not ( = ?auto_1259564 ?auto_1259561 ) ) ( AVAILABLE ?auto_1259566 ) ( IN ?auto_1259561 ?auto_1259568 ) ( ON ?auto_1259564 ?auto_1259563 ) ( not ( = ?auto_1259563 ?auto_1259564 ) ) ( not ( = ?auto_1259563 ?auto_1259561 ) ) ( TRUCK-AT ?auto_1259568 ?auto_1259565 ) ( not ( = ?auto_1259565 ?auto_1259567 ) ) ( ON ?auto_1259563 ?auto_1259562 ) ( not ( = ?auto_1259562 ?auto_1259563 ) ) ( not ( = ?auto_1259562 ?auto_1259564 ) ) ( not ( = ?auto_1259562 ?auto_1259561 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1259563 ?auto_1259564 ?auto_1259561 )
      ( MAKE-3CRATE-VERIFY ?auto_1259562 ?auto_1259563 ?auto_1259564 ?auto_1259561 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1259586 - SURFACE
      ?auto_1259587 - SURFACE
      ?auto_1259588 - SURFACE
      ?auto_1259585 - SURFACE
    )
    :vars
    (
      ?auto_1259589 - HOIST
      ?auto_1259593 - PLACE
      ?auto_1259590 - TRUCK
      ?auto_1259592 - PLACE
      ?auto_1259591 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1259589 ?auto_1259593 ) ( SURFACE-AT ?auto_1259588 ?auto_1259593 ) ( CLEAR ?auto_1259588 ) ( IS-CRATE ?auto_1259585 ) ( not ( = ?auto_1259588 ?auto_1259585 ) ) ( AVAILABLE ?auto_1259589 ) ( ON ?auto_1259588 ?auto_1259587 ) ( not ( = ?auto_1259587 ?auto_1259588 ) ) ( not ( = ?auto_1259587 ?auto_1259585 ) ) ( TRUCK-AT ?auto_1259590 ?auto_1259592 ) ( not ( = ?auto_1259592 ?auto_1259593 ) ) ( HOIST-AT ?auto_1259591 ?auto_1259592 ) ( LIFTING ?auto_1259591 ?auto_1259585 ) ( not ( = ?auto_1259589 ?auto_1259591 ) ) ( ON ?auto_1259587 ?auto_1259586 ) ( not ( = ?auto_1259586 ?auto_1259587 ) ) ( not ( = ?auto_1259586 ?auto_1259588 ) ) ( not ( = ?auto_1259586 ?auto_1259585 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1259587 ?auto_1259588 ?auto_1259585 )
      ( MAKE-3CRATE-VERIFY ?auto_1259586 ?auto_1259587 ?auto_1259588 ?auto_1259585 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1259613 - SURFACE
      ?auto_1259614 - SURFACE
      ?auto_1259615 - SURFACE
      ?auto_1259612 - SURFACE
    )
    :vars
    (
      ?auto_1259621 - HOIST
      ?auto_1259616 - PLACE
      ?auto_1259617 - TRUCK
      ?auto_1259619 - PLACE
      ?auto_1259618 - HOIST
      ?auto_1259620 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1259621 ?auto_1259616 ) ( SURFACE-AT ?auto_1259615 ?auto_1259616 ) ( CLEAR ?auto_1259615 ) ( IS-CRATE ?auto_1259612 ) ( not ( = ?auto_1259615 ?auto_1259612 ) ) ( AVAILABLE ?auto_1259621 ) ( ON ?auto_1259615 ?auto_1259614 ) ( not ( = ?auto_1259614 ?auto_1259615 ) ) ( not ( = ?auto_1259614 ?auto_1259612 ) ) ( TRUCK-AT ?auto_1259617 ?auto_1259619 ) ( not ( = ?auto_1259619 ?auto_1259616 ) ) ( HOIST-AT ?auto_1259618 ?auto_1259619 ) ( not ( = ?auto_1259621 ?auto_1259618 ) ) ( AVAILABLE ?auto_1259618 ) ( SURFACE-AT ?auto_1259612 ?auto_1259619 ) ( ON ?auto_1259612 ?auto_1259620 ) ( CLEAR ?auto_1259612 ) ( not ( = ?auto_1259615 ?auto_1259620 ) ) ( not ( = ?auto_1259612 ?auto_1259620 ) ) ( not ( = ?auto_1259614 ?auto_1259620 ) ) ( ON ?auto_1259614 ?auto_1259613 ) ( not ( = ?auto_1259613 ?auto_1259614 ) ) ( not ( = ?auto_1259613 ?auto_1259615 ) ) ( not ( = ?auto_1259613 ?auto_1259612 ) ) ( not ( = ?auto_1259613 ?auto_1259620 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1259614 ?auto_1259615 ?auto_1259612 )
      ( MAKE-3CRATE-VERIFY ?auto_1259613 ?auto_1259614 ?auto_1259615 ?auto_1259612 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1259641 - SURFACE
      ?auto_1259642 - SURFACE
      ?auto_1259643 - SURFACE
      ?auto_1259640 - SURFACE
    )
    :vars
    (
      ?auto_1259645 - HOIST
      ?auto_1259646 - PLACE
      ?auto_1259648 - PLACE
      ?auto_1259644 - HOIST
      ?auto_1259649 - SURFACE
      ?auto_1259647 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1259645 ?auto_1259646 ) ( SURFACE-AT ?auto_1259643 ?auto_1259646 ) ( CLEAR ?auto_1259643 ) ( IS-CRATE ?auto_1259640 ) ( not ( = ?auto_1259643 ?auto_1259640 ) ) ( AVAILABLE ?auto_1259645 ) ( ON ?auto_1259643 ?auto_1259642 ) ( not ( = ?auto_1259642 ?auto_1259643 ) ) ( not ( = ?auto_1259642 ?auto_1259640 ) ) ( not ( = ?auto_1259648 ?auto_1259646 ) ) ( HOIST-AT ?auto_1259644 ?auto_1259648 ) ( not ( = ?auto_1259645 ?auto_1259644 ) ) ( AVAILABLE ?auto_1259644 ) ( SURFACE-AT ?auto_1259640 ?auto_1259648 ) ( ON ?auto_1259640 ?auto_1259649 ) ( CLEAR ?auto_1259640 ) ( not ( = ?auto_1259643 ?auto_1259649 ) ) ( not ( = ?auto_1259640 ?auto_1259649 ) ) ( not ( = ?auto_1259642 ?auto_1259649 ) ) ( TRUCK-AT ?auto_1259647 ?auto_1259646 ) ( ON ?auto_1259642 ?auto_1259641 ) ( not ( = ?auto_1259641 ?auto_1259642 ) ) ( not ( = ?auto_1259641 ?auto_1259643 ) ) ( not ( = ?auto_1259641 ?auto_1259640 ) ) ( not ( = ?auto_1259641 ?auto_1259649 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1259642 ?auto_1259643 ?auto_1259640 )
      ( MAKE-3CRATE-VERIFY ?auto_1259641 ?auto_1259642 ?auto_1259643 ?auto_1259640 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1259669 - SURFACE
      ?auto_1259670 - SURFACE
      ?auto_1259671 - SURFACE
      ?auto_1259668 - SURFACE
    )
    :vars
    (
      ?auto_1259675 - HOIST
      ?auto_1259672 - PLACE
      ?auto_1259677 - PLACE
      ?auto_1259676 - HOIST
      ?auto_1259673 - SURFACE
      ?auto_1259674 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1259675 ?auto_1259672 ) ( IS-CRATE ?auto_1259668 ) ( not ( = ?auto_1259671 ?auto_1259668 ) ) ( not ( = ?auto_1259670 ?auto_1259671 ) ) ( not ( = ?auto_1259670 ?auto_1259668 ) ) ( not ( = ?auto_1259677 ?auto_1259672 ) ) ( HOIST-AT ?auto_1259676 ?auto_1259677 ) ( not ( = ?auto_1259675 ?auto_1259676 ) ) ( AVAILABLE ?auto_1259676 ) ( SURFACE-AT ?auto_1259668 ?auto_1259677 ) ( ON ?auto_1259668 ?auto_1259673 ) ( CLEAR ?auto_1259668 ) ( not ( = ?auto_1259671 ?auto_1259673 ) ) ( not ( = ?auto_1259668 ?auto_1259673 ) ) ( not ( = ?auto_1259670 ?auto_1259673 ) ) ( TRUCK-AT ?auto_1259674 ?auto_1259672 ) ( SURFACE-AT ?auto_1259670 ?auto_1259672 ) ( CLEAR ?auto_1259670 ) ( LIFTING ?auto_1259675 ?auto_1259671 ) ( IS-CRATE ?auto_1259671 ) ( ON ?auto_1259670 ?auto_1259669 ) ( not ( = ?auto_1259669 ?auto_1259670 ) ) ( not ( = ?auto_1259669 ?auto_1259671 ) ) ( not ( = ?auto_1259669 ?auto_1259668 ) ) ( not ( = ?auto_1259669 ?auto_1259673 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1259670 ?auto_1259671 ?auto_1259668 )
      ( MAKE-3CRATE-VERIFY ?auto_1259669 ?auto_1259670 ?auto_1259671 ?auto_1259668 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1259697 - SURFACE
      ?auto_1259698 - SURFACE
      ?auto_1259699 - SURFACE
      ?auto_1259696 - SURFACE
    )
    :vars
    (
      ?auto_1259704 - HOIST
      ?auto_1259705 - PLACE
      ?auto_1259703 - PLACE
      ?auto_1259700 - HOIST
      ?auto_1259702 - SURFACE
      ?auto_1259701 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1259704 ?auto_1259705 ) ( IS-CRATE ?auto_1259696 ) ( not ( = ?auto_1259699 ?auto_1259696 ) ) ( not ( = ?auto_1259698 ?auto_1259699 ) ) ( not ( = ?auto_1259698 ?auto_1259696 ) ) ( not ( = ?auto_1259703 ?auto_1259705 ) ) ( HOIST-AT ?auto_1259700 ?auto_1259703 ) ( not ( = ?auto_1259704 ?auto_1259700 ) ) ( AVAILABLE ?auto_1259700 ) ( SURFACE-AT ?auto_1259696 ?auto_1259703 ) ( ON ?auto_1259696 ?auto_1259702 ) ( CLEAR ?auto_1259696 ) ( not ( = ?auto_1259699 ?auto_1259702 ) ) ( not ( = ?auto_1259696 ?auto_1259702 ) ) ( not ( = ?auto_1259698 ?auto_1259702 ) ) ( TRUCK-AT ?auto_1259701 ?auto_1259705 ) ( SURFACE-AT ?auto_1259698 ?auto_1259705 ) ( CLEAR ?auto_1259698 ) ( IS-CRATE ?auto_1259699 ) ( AVAILABLE ?auto_1259704 ) ( IN ?auto_1259699 ?auto_1259701 ) ( ON ?auto_1259698 ?auto_1259697 ) ( not ( = ?auto_1259697 ?auto_1259698 ) ) ( not ( = ?auto_1259697 ?auto_1259699 ) ) ( not ( = ?auto_1259697 ?auto_1259696 ) ) ( not ( = ?auto_1259697 ?auto_1259702 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1259698 ?auto_1259699 ?auto_1259696 )
      ( MAKE-3CRATE-VERIFY ?auto_1259697 ?auto_1259698 ?auto_1259699 ?auto_1259696 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1259706 - SURFACE
      ?auto_1259707 - SURFACE
    )
    :vars
    (
      ?auto_1259713 - HOIST
      ?auto_1259714 - PLACE
      ?auto_1259708 - SURFACE
      ?auto_1259712 - PLACE
      ?auto_1259709 - HOIST
      ?auto_1259711 - SURFACE
      ?auto_1259710 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1259713 ?auto_1259714 ) ( IS-CRATE ?auto_1259707 ) ( not ( = ?auto_1259706 ?auto_1259707 ) ) ( not ( = ?auto_1259708 ?auto_1259706 ) ) ( not ( = ?auto_1259708 ?auto_1259707 ) ) ( not ( = ?auto_1259712 ?auto_1259714 ) ) ( HOIST-AT ?auto_1259709 ?auto_1259712 ) ( not ( = ?auto_1259713 ?auto_1259709 ) ) ( AVAILABLE ?auto_1259709 ) ( SURFACE-AT ?auto_1259707 ?auto_1259712 ) ( ON ?auto_1259707 ?auto_1259711 ) ( CLEAR ?auto_1259707 ) ( not ( = ?auto_1259706 ?auto_1259711 ) ) ( not ( = ?auto_1259707 ?auto_1259711 ) ) ( not ( = ?auto_1259708 ?auto_1259711 ) ) ( SURFACE-AT ?auto_1259708 ?auto_1259714 ) ( CLEAR ?auto_1259708 ) ( IS-CRATE ?auto_1259706 ) ( AVAILABLE ?auto_1259713 ) ( IN ?auto_1259706 ?auto_1259710 ) ( TRUCK-AT ?auto_1259710 ?auto_1259712 ) )
    :subtasks
    ( ( !DRIVE ?auto_1259710 ?auto_1259712 ?auto_1259714 )
      ( MAKE-2CRATE ?auto_1259708 ?auto_1259706 ?auto_1259707 )
      ( MAKE-1CRATE-VERIFY ?auto_1259706 ?auto_1259707 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1259715 - SURFACE
      ?auto_1259716 - SURFACE
      ?auto_1259717 - SURFACE
    )
    :vars
    (
      ?auto_1259721 - HOIST
      ?auto_1259720 - PLACE
      ?auto_1259718 - PLACE
      ?auto_1259719 - HOIST
      ?auto_1259722 - SURFACE
      ?auto_1259723 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1259721 ?auto_1259720 ) ( IS-CRATE ?auto_1259717 ) ( not ( = ?auto_1259716 ?auto_1259717 ) ) ( not ( = ?auto_1259715 ?auto_1259716 ) ) ( not ( = ?auto_1259715 ?auto_1259717 ) ) ( not ( = ?auto_1259718 ?auto_1259720 ) ) ( HOIST-AT ?auto_1259719 ?auto_1259718 ) ( not ( = ?auto_1259721 ?auto_1259719 ) ) ( AVAILABLE ?auto_1259719 ) ( SURFACE-AT ?auto_1259717 ?auto_1259718 ) ( ON ?auto_1259717 ?auto_1259722 ) ( CLEAR ?auto_1259717 ) ( not ( = ?auto_1259716 ?auto_1259722 ) ) ( not ( = ?auto_1259717 ?auto_1259722 ) ) ( not ( = ?auto_1259715 ?auto_1259722 ) ) ( SURFACE-AT ?auto_1259715 ?auto_1259720 ) ( CLEAR ?auto_1259715 ) ( IS-CRATE ?auto_1259716 ) ( AVAILABLE ?auto_1259721 ) ( IN ?auto_1259716 ?auto_1259723 ) ( TRUCK-AT ?auto_1259723 ?auto_1259718 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1259716 ?auto_1259717 )
      ( MAKE-2CRATE-VERIFY ?auto_1259715 ?auto_1259716 ?auto_1259717 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1259725 - SURFACE
      ?auto_1259726 - SURFACE
      ?auto_1259727 - SURFACE
      ?auto_1259724 - SURFACE
    )
    :vars
    (
      ?auto_1259733 - HOIST
      ?auto_1259731 - PLACE
      ?auto_1259728 - PLACE
      ?auto_1259732 - HOIST
      ?auto_1259729 - SURFACE
      ?auto_1259730 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1259733 ?auto_1259731 ) ( IS-CRATE ?auto_1259724 ) ( not ( = ?auto_1259727 ?auto_1259724 ) ) ( not ( = ?auto_1259726 ?auto_1259727 ) ) ( not ( = ?auto_1259726 ?auto_1259724 ) ) ( not ( = ?auto_1259728 ?auto_1259731 ) ) ( HOIST-AT ?auto_1259732 ?auto_1259728 ) ( not ( = ?auto_1259733 ?auto_1259732 ) ) ( AVAILABLE ?auto_1259732 ) ( SURFACE-AT ?auto_1259724 ?auto_1259728 ) ( ON ?auto_1259724 ?auto_1259729 ) ( CLEAR ?auto_1259724 ) ( not ( = ?auto_1259727 ?auto_1259729 ) ) ( not ( = ?auto_1259724 ?auto_1259729 ) ) ( not ( = ?auto_1259726 ?auto_1259729 ) ) ( SURFACE-AT ?auto_1259726 ?auto_1259731 ) ( CLEAR ?auto_1259726 ) ( IS-CRATE ?auto_1259727 ) ( AVAILABLE ?auto_1259733 ) ( IN ?auto_1259727 ?auto_1259730 ) ( TRUCK-AT ?auto_1259730 ?auto_1259728 ) ( ON ?auto_1259726 ?auto_1259725 ) ( not ( = ?auto_1259725 ?auto_1259726 ) ) ( not ( = ?auto_1259725 ?auto_1259727 ) ) ( not ( = ?auto_1259725 ?auto_1259724 ) ) ( not ( = ?auto_1259725 ?auto_1259729 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1259726 ?auto_1259727 ?auto_1259724 )
      ( MAKE-3CRATE-VERIFY ?auto_1259725 ?auto_1259726 ?auto_1259727 ?auto_1259724 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1259734 - SURFACE
      ?auto_1259735 - SURFACE
    )
    :vars
    (
      ?auto_1259742 - HOIST
      ?auto_1259740 - PLACE
      ?auto_1259738 - SURFACE
      ?auto_1259736 - PLACE
      ?auto_1259741 - HOIST
      ?auto_1259737 - SURFACE
      ?auto_1259739 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1259742 ?auto_1259740 ) ( IS-CRATE ?auto_1259735 ) ( not ( = ?auto_1259734 ?auto_1259735 ) ) ( not ( = ?auto_1259738 ?auto_1259734 ) ) ( not ( = ?auto_1259738 ?auto_1259735 ) ) ( not ( = ?auto_1259736 ?auto_1259740 ) ) ( HOIST-AT ?auto_1259741 ?auto_1259736 ) ( not ( = ?auto_1259742 ?auto_1259741 ) ) ( SURFACE-AT ?auto_1259735 ?auto_1259736 ) ( ON ?auto_1259735 ?auto_1259737 ) ( CLEAR ?auto_1259735 ) ( not ( = ?auto_1259734 ?auto_1259737 ) ) ( not ( = ?auto_1259735 ?auto_1259737 ) ) ( not ( = ?auto_1259738 ?auto_1259737 ) ) ( SURFACE-AT ?auto_1259738 ?auto_1259740 ) ( CLEAR ?auto_1259738 ) ( IS-CRATE ?auto_1259734 ) ( AVAILABLE ?auto_1259742 ) ( TRUCK-AT ?auto_1259739 ?auto_1259736 ) ( LIFTING ?auto_1259741 ?auto_1259734 ) )
    :subtasks
    ( ( !LOAD ?auto_1259741 ?auto_1259734 ?auto_1259739 ?auto_1259736 )
      ( MAKE-2CRATE ?auto_1259738 ?auto_1259734 ?auto_1259735 )
      ( MAKE-1CRATE-VERIFY ?auto_1259734 ?auto_1259735 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1259743 - SURFACE
      ?auto_1259744 - SURFACE
      ?auto_1259745 - SURFACE
    )
    :vars
    (
      ?auto_1259748 - HOIST
      ?auto_1259749 - PLACE
      ?auto_1259747 - PLACE
      ?auto_1259746 - HOIST
      ?auto_1259751 - SURFACE
      ?auto_1259750 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1259748 ?auto_1259749 ) ( IS-CRATE ?auto_1259745 ) ( not ( = ?auto_1259744 ?auto_1259745 ) ) ( not ( = ?auto_1259743 ?auto_1259744 ) ) ( not ( = ?auto_1259743 ?auto_1259745 ) ) ( not ( = ?auto_1259747 ?auto_1259749 ) ) ( HOIST-AT ?auto_1259746 ?auto_1259747 ) ( not ( = ?auto_1259748 ?auto_1259746 ) ) ( SURFACE-AT ?auto_1259745 ?auto_1259747 ) ( ON ?auto_1259745 ?auto_1259751 ) ( CLEAR ?auto_1259745 ) ( not ( = ?auto_1259744 ?auto_1259751 ) ) ( not ( = ?auto_1259745 ?auto_1259751 ) ) ( not ( = ?auto_1259743 ?auto_1259751 ) ) ( SURFACE-AT ?auto_1259743 ?auto_1259749 ) ( CLEAR ?auto_1259743 ) ( IS-CRATE ?auto_1259744 ) ( AVAILABLE ?auto_1259748 ) ( TRUCK-AT ?auto_1259750 ?auto_1259747 ) ( LIFTING ?auto_1259746 ?auto_1259744 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1259744 ?auto_1259745 )
      ( MAKE-2CRATE-VERIFY ?auto_1259743 ?auto_1259744 ?auto_1259745 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1259753 - SURFACE
      ?auto_1259754 - SURFACE
      ?auto_1259755 - SURFACE
      ?auto_1259752 - SURFACE
    )
    :vars
    (
      ?auto_1259761 - HOIST
      ?auto_1259758 - PLACE
      ?auto_1259757 - PLACE
      ?auto_1259760 - HOIST
      ?auto_1259759 - SURFACE
      ?auto_1259756 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1259761 ?auto_1259758 ) ( IS-CRATE ?auto_1259752 ) ( not ( = ?auto_1259755 ?auto_1259752 ) ) ( not ( = ?auto_1259754 ?auto_1259755 ) ) ( not ( = ?auto_1259754 ?auto_1259752 ) ) ( not ( = ?auto_1259757 ?auto_1259758 ) ) ( HOIST-AT ?auto_1259760 ?auto_1259757 ) ( not ( = ?auto_1259761 ?auto_1259760 ) ) ( SURFACE-AT ?auto_1259752 ?auto_1259757 ) ( ON ?auto_1259752 ?auto_1259759 ) ( CLEAR ?auto_1259752 ) ( not ( = ?auto_1259755 ?auto_1259759 ) ) ( not ( = ?auto_1259752 ?auto_1259759 ) ) ( not ( = ?auto_1259754 ?auto_1259759 ) ) ( SURFACE-AT ?auto_1259754 ?auto_1259758 ) ( CLEAR ?auto_1259754 ) ( IS-CRATE ?auto_1259755 ) ( AVAILABLE ?auto_1259761 ) ( TRUCK-AT ?auto_1259756 ?auto_1259757 ) ( LIFTING ?auto_1259760 ?auto_1259755 ) ( ON ?auto_1259754 ?auto_1259753 ) ( not ( = ?auto_1259753 ?auto_1259754 ) ) ( not ( = ?auto_1259753 ?auto_1259755 ) ) ( not ( = ?auto_1259753 ?auto_1259752 ) ) ( not ( = ?auto_1259753 ?auto_1259759 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1259754 ?auto_1259755 ?auto_1259752 )
      ( MAKE-3CRATE-VERIFY ?auto_1259753 ?auto_1259754 ?auto_1259755 ?auto_1259752 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1259762 - SURFACE
      ?auto_1259763 - SURFACE
    )
    :vars
    (
      ?auto_1259770 - HOIST
      ?auto_1259767 - PLACE
      ?auto_1259766 - SURFACE
      ?auto_1259765 - PLACE
      ?auto_1259769 - HOIST
      ?auto_1259768 - SURFACE
      ?auto_1259764 - TRUCK
      ?auto_1259771 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1259770 ?auto_1259767 ) ( IS-CRATE ?auto_1259763 ) ( not ( = ?auto_1259762 ?auto_1259763 ) ) ( not ( = ?auto_1259766 ?auto_1259762 ) ) ( not ( = ?auto_1259766 ?auto_1259763 ) ) ( not ( = ?auto_1259765 ?auto_1259767 ) ) ( HOIST-AT ?auto_1259769 ?auto_1259765 ) ( not ( = ?auto_1259770 ?auto_1259769 ) ) ( SURFACE-AT ?auto_1259763 ?auto_1259765 ) ( ON ?auto_1259763 ?auto_1259768 ) ( CLEAR ?auto_1259763 ) ( not ( = ?auto_1259762 ?auto_1259768 ) ) ( not ( = ?auto_1259763 ?auto_1259768 ) ) ( not ( = ?auto_1259766 ?auto_1259768 ) ) ( SURFACE-AT ?auto_1259766 ?auto_1259767 ) ( CLEAR ?auto_1259766 ) ( IS-CRATE ?auto_1259762 ) ( AVAILABLE ?auto_1259770 ) ( TRUCK-AT ?auto_1259764 ?auto_1259765 ) ( AVAILABLE ?auto_1259769 ) ( SURFACE-AT ?auto_1259762 ?auto_1259765 ) ( ON ?auto_1259762 ?auto_1259771 ) ( CLEAR ?auto_1259762 ) ( not ( = ?auto_1259762 ?auto_1259771 ) ) ( not ( = ?auto_1259763 ?auto_1259771 ) ) ( not ( = ?auto_1259766 ?auto_1259771 ) ) ( not ( = ?auto_1259768 ?auto_1259771 ) ) )
    :subtasks
    ( ( !LIFT ?auto_1259769 ?auto_1259762 ?auto_1259771 ?auto_1259765 )
      ( MAKE-2CRATE ?auto_1259766 ?auto_1259762 ?auto_1259763 )
      ( MAKE-1CRATE-VERIFY ?auto_1259762 ?auto_1259763 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1259772 - SURFACE
      ?auto_1259773 - SURFACE
      ?auto_1259774 - SURFACE
    )
    :vars
    (
      ?auto_1259778 - HOIST
      ?auto_1259775 - PLACE
      ?auto_1259776 - PLACE
      ?auto_1259780 - HOIST
      ?auto_1259777 - SURFACE
      ?auto_1259779 - TRUCK
      ?auto_1259781 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1259778 ?auto_1259775 ) ( IS-CRATE ?auto_1259774 ) ( not ( = ?auto_1259773 ?auto_1259774 ) ) ( not ( = ?auto_1259772 ?auto_1259773 ) ) ( not ( = ?auto_1259772 ?auto_1259774 ) ) ( not ( = ?auto_1259776 ?auto_1259775 ) ) ( HOIST-AT ?auto_1259780 ?auto_1259776 ) ( not ( = ?auto_1259778 ?auto_1259780 ) ) ( SURFACE-AT ?auto_1259774 ?auto_1259776 ) ( ON ?auto_1259774 ?auto_1259777 ) ( CLEAR ?auto_1259774 ) ( not ( = ?auto_1259773 ?auto_1259777 ) ) ( not ( = ?auto_1259774 ?auto_1259777 ) ) ( not ( = ?auto_1259772 ?auto_1259777 ) ) ( SURFACE-AT ?auto_1259772 ?auto_1259775 ) ( CLEAR ?auto_1259772 ) ( IS-CRATE ?auto_1259773 ) ( AVAILABLE ?auto_1259778 ) ( TRUCK-AT ?auto_1259779 ?auto_1259776 ) ( AVAILABLE ?auto_1259780 ) ( SURFACE-AT ?auto_1259773 ?auto_1259776 ) ( ON ?auto_1259773 ?auto_1259781 ) ( CLEAR ?auto_1259773 ) ( not ( = ?auto_1259773 ?auto_1259781 ) ) ( not ( = ?auto_1259774 ?auto_1259781 ) ) ( not ( = ?auto_1259772 ?auto_1259781 ) ) ( not ( = ?auto_1259777 ?auto_1259781 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1259773 ?auto_1259774 )
      ( MAKE-2CRATE-VERIFY ?auto_1259772 ?auto_1259773 ?auto_1259774 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1259783 - SURFACE
      ?auto_1259784 - SURFACE
      ?auto_1259785 - SURFACE
      ?auto_1259782 - SURFACE
    )
    :vars
    (
      ?auto_1259791 - HOIST
      ?auto_1259786 - PLACE
      ?auto_1259787 - PLACE
      ?auto_1259792 - HOIST
      ?auto_1259790 - SURFACE
      ?auto_1259789 - TRUCK
      ?auto_1259788 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1259791 ?auto_1259786 ) ( IS-CRATE ?auto_1259782 ) ( not ( = ?auto_1259785 ?auto_1259782 ) ) ( not ( = ?auto_1259784 ?auto_1259785 ) ) ( not ( = ?auto_1259784 ?auto_1259782 ) ) ( not ( = ?auto_1259787 ?auto_1259786 ) ) ( HOIST-AT ?auto_1259792 ?auto_1259787 ) ( not ( = ?auto_1259791 ?auto_1259792 ) ) ( SURFACE-AT ?auto_1259782 ?auto_1259787 ) ( ON ?auto_1259782 ?auto_1259790 ) ( CLEAR ?auto_1259782 ) ( not ( = ?auto_1259785 ?auto_1259790 ) ) ( not ( = ?auto_1259782 ?auto_1259790 ) ) ( not ( = ?auto_1259784 ?auto_1259790 ) ) ( SURFACE-AT ?auto_1259784 ?auto_1259786 ) ( CLEAR ?auto_1259784 ) ( IS-CRATE ?auto_1259785 ) ( AVAILABLE ?auto_1259791 ) ( TRUCK-AT ?auto_1259789 ?auto_1259787 ) ( AVAILABLE ?auto_1259792 ) ( SURFACE-AT ?auto_1259785 ?auto_1259787 ) ( ON ?auto_1259785 ?auto_1259788 ) ( CLEAR ?auto_1259785 ) ( not ( = ?auto_1259785 ?auto_1259788 ) ) ( not ( = ?auto_1259782 ?auto_1259788 ) ) ( not ( = ?auto_1259784 ?auto_1259788 ) ) ( not ( = ?auto_1259790 ?auto_1259788 ) ) ( ON ?auto_1259784 ?auto_1259783 ) ( not ( = ?auto_1259783 ?auto_1259784 ) ) ( not ( = ?auto_1259783 ?auto_1259785 ) ) ( not ( = ?auto_1259783 ?auto_1259782 ) ) ( not ( = ?auto_1259783 ?auto_1259790 ) ) ( not ( = ?auto_1259783 ?auto_1259788 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1259784 ?auto_1259785 ?auto_1259782 )
      ( MAKE-3CRATE-VERIFY ?auto_1259783 ?auto_1259784 ?auto_1259785 ?auto_1259782 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1259793 - SURFACE
      ?auto_1259794 - SURFACE
    )
    :vars
    (
      ?auto_1259800 - HOIST
      ?auto_1259795 - PLACE
      ?auto_1259801 - SURFACE
      ?auto_1259796 - PLACE
      ?auto_1259802 - HOIST
      ?auto_1259799 - SURFACE
      ?auto_1259797 - SURFACE
      ?auto_1259798 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1259800 ?auto_1259795 ) ( IS-CRATE ?auto_1259794 ) ( not ( = ?auto_1259793 ?auto_1259794 ) ) ( not ( = ?auto_1259801 ?auto_1259793 ) ) ( not ( = ?auto_1259801 ?auto_1259794 ) ) ( not ( = ?auto_1259796 ?auto_1259795 ) ) ( HOIST-AT ?auto_1259802 ?auto_1259796 ) ( not ( = ?auto_1259800 ?auto_1259802 ) ) ( SURFACE-AT ?auto_1259794 ?auto_1259796 ) ( ON ?auto_1259794 ?auto_1259799 ) ( CLEAR ?auto_1259794 ) ( not ( = ?auto_1259793 ?auto_1259799 ) ) ( not ( = ?auto_1259794 ?auto_1259799 ) ) ( not ( = ?auto_1259801 ?auto_1259799 ) ) ( SURFACE-AT ?auto_1259801 ?auto_1259795 ) ( CLEAR ?auto_1259801 ) ( IS-CRATE ?auto_1259793 ) ( AVAILABLE ?auto_1259800 ) ( AVAILABLE ?auto_1259802 ) ( SURFACE-AT ?auto_1259793 ?auto_1259796 ) ( ON ?auto_1259793 ?auto_1259797 ) ( CLEAR ?auto_1259793 ) ( not ( = ?auto_1259793 ?auto_1259797 ) ) ( not ( = ?auto_1259794 ?auto_1259797 ) ) ( not ( = ?auto_1259801 ?auto_1259797 ) ) ( not ( = ?auto_1259799 ?auto_1259797 ) ) ( TRUCK-AT ?auto_1259798 ?auto_1259795 ) )
    :subtasks
    ( ( !DRIVE ?auto_1259798 ?auto_1259795 ?auto_1259796 )
      ( MAKE-2CRATE ?auto_1259801 ?auto_1259793 ?auto_1259794 )
      ( MAKE-1CRATE-VERIFY ?auto_1259793 ?auto_1259794 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1259803 - SURFACE
      ?auto_1259804 - SURFACE
      ?auto_1259805 - SURFACE
    )
    :vars
    (
      ?auto_1259809 - HOIST
      ?auto_1259811 - PLACE
      ?auto_1259812 - PLACE
      ?auto_1259807 - HOIST
      ?auto_1259808 - SURFACE
      ?auto_1259806 - SURFACE
      ?auto_1259810 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1259809 ?auto_1259811 ) ( IS-CRATE ?auto_1259805 ) ( not ( = ?auto_1259804 ?auto_1259805 ) ) ( not ( = ?auto_1259803 ?auto_1259804 ) ) ( not ( = ?auto_1259803 ?auto_1259805 ) ) ( not ( = ?auto_1259812 ?auto_1259811 ) ) ( HOIST-AT ?auto_1259807 ?auto_1259812 ) ( not ( = ?auto_1259809 ?auto_1259807 ) ) ( SURFACE-AT ?auto_1259805 ?auto_1259812 ) ( ON ?auto_1259805 ?auto_1259808 ) ( CLEAR ?auto_1259805 ) ( not ( = ?auto_1259804 ?auto_1259808 ) ) ( not ( = ?auto_1259805 ?auto_1259808 ) ) ( not ( = ?auto_1259803 ?auto_1259808 ) ) ( SURFACE-AT ?auto_1259803 ?auto_1259811 ) ( CLEAR ?auto_1259803 ) ( IS-CRATE ?auto_1259804 ) ( AVAILABLE ?auto_1259809 ) ( AVAILABLE ?auto_1259807 ) ( SURFACE-AT ?auto_1259804 ?auto_1259812 ) ( ON ?auto_1259804 ?auto_1259806 ) ( CLEAR ?auto_1259804 ) ( not ( = ?auto_1259804 ?auto_1259806 ) ) ( not ( = ?auto_1259805 ?auto_1259806 ) ) ( not ( = ?auto_1259803 ?auto_1259806 ) ) ( not ( = ?auto_1259808 ?auto_1259806 ) ) ( TRUCK-AT ?auto_1259810 ?auto_1259811 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1259804 ?auto_1259805 )
      ( MAKE-2CRATE-VERIFY ?auto_1259803 ?auto_1259804 ?auto_1259805 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1259814 - SURFACE
      ?auto_1259815 - SURFACE
      ?auto_1259816 - SURFACE
      ?auto_1259813 - SURFACE
    )
    :vars
    (
      ?auto_1259821 - HOIST
      ?auto_1259818 - PLACE
      ?auto_1259820 - PLACE
      ?auto_1259819 - HOIST
      ?auto_1259823 - SURFACE
      ?auto_1259817 - SURFACE
      ?auto_1259822 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1259821 ?auto_1259818 ) ( IS-CRATE ?auto_1259813 ) ( not ( = ?auto_1259816 ?auto_1259813 ) ) ( not ( = ?auto_1259815 ?auto_1259816 ) ) ( not ( = ?auto_1259815 ?auto_1259813 ) ) ( not ( = ?auto_1259820 ?auto_1259818 ) ) ( HOIST-AT ?auto_1259819 ?auto_1259820 ) ( not ( = ?auto_1259821 ?auto_1259819 ) ) ( SURFACE-AT ?auto_1259813 ?auto_1259820 ) ( ON ?auto_1259813 ?auto_1259823 ) ( CLEAR ?auto_1259813 ) ( not ( = ?auto_1259816 ?auto_1259823 ) ) ( not ( = ?auto_1259813 ?auto_1259823 ) ) ( not ( = ?auto_1259815 ?auto_1259823 ) ) ( SURFACE-AT ?auto_1259815 ?auto_1259818 ) ( CLEAR ?auto_1259815 ) ( IS-CRATE ?auto_1259816 ) ( AVAILABLE ?auto_1259821 ) ( AVAILABLE ?auto_1259819 ) ( SURFACE-AT ?auto_1259816 ?auto_1259820 ) ( ON ?auto_1259816 ?auto_1259817 ) ( CLEAR ?auto_1259816 ) ( not ( = ?auto_1259816 ?auto_1259817 ) ) ( not ( = ?auto_1259813 ?auto_1259817 ) ) ( not ( = ?auto_1259815 ?auto_1259817 ) ) ( not ( = ?auto_1259823 ?auto_1259817 ) ) ( TRUCK-AT ?auto_1259822 ?auto_1259818 ) ( ON ?auto_1259815 ?auto_1259814 ) ( not ( = ?auto_1259814 ?auto_1259815 ) ) ( not ( = ?auto_1259814 ?auto_1259816 ) ) ( not ( = ?auto_1259814 ?auto_1259813 ) ) ( not ( = ?auto_1259814 ?auto_1259823 ) ) ( not ( = ?auto_1259814 ?auto_1259817 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1259815 ?auto_1259816 ?auto_1259813 )
      ( MAKE-3CRATE-VERIFY ?auto_1259814 ?auto_1259815 ?auto_1259816 ?auto_1259813 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1259824 - SURFACE
      ?auto_1259825 - SURFACE
    )
    :vars
    (
      ?auto_1259830 - HOIST
      ?auto_1259827 - PLACE
      ?auto_1259832 - SURFACE
      ?auto_1259829 - PLACE
      ?auto_1259828 - HOIST
      ?auto_1259833 - SURFACE
      ?auto_1259826 - SURFACE
      ?auto_1259831 - TRUCK
      ?auto_1259834 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1259830 ?auto_1259827 ) ( IS-CRATE ?auto_1259825 ) ( not ( = ?auto_1259824 ?auto_1259825 ) ) ( not ( = ?auto_1259832 ?auto_1259824 ) ) ( not ( = ?auto_1259832 ?auto_1259825 ) ) ( not ( = ?auto_1259829 ?auto_1259827 ) ) ( HOIST-AT ?auto_1259828 ?auto_1259829 ) ( not ( = ?auto_1259830 ?auto_1259828 ) ) ( SURFACE-AT ?auto_1259825 ?auto_1259829 ) ( ON ?auto_1259825 ?auto_1259833 ) ( CLEAR ?auto_1259825 ) ( not ( = ?auto_1259824 ?auto_1259833 ) ) ( not ( = ?auto_1259825 ?auto_1259833 ) ) ( not ( = ?auto_1259832 ?auto_1259833 ) ) ( IS-CRATE ?auto_1259824 ) ( AVAILABLE ?auto_1259828 ) ( SURFACE-AT ?auto_1259824 ?auto_1259829 ) ( ON ?auto_1259824 ?auto_1259826 ) ( CLEAR ?auto_1259824 ) ( not ( = ?auto_1259824 ?auto_1259826 ) ) ( not ( = ?auto_1259825 ?auto_1259826 ) ) ( not ( = ?auto_1259832 ?auto_1259826 ) ) ( not ( = ?auto_1259833 ?auto_1259826 ) ) ( TRUCK-AT ?auto_1259831 ?auto_1259827 ) ( SURFACE-AT ?auto_1259834 ?auto_1259827 ) ( CLEAR ?auto_1259834 ) ( LIFTING ?auto_1259830 ?auto_1259832 ) ( IS-CRATE ?auto_1259832 ) ( not ( = ?auto_1259834 ?auto_1259832 ) ) ( not ( = ?auto_1259824 ?auto_1259834 ) ) ( not ( = ?auto_1259825 ?auto_1259834 ) ) ( not ( = ?auto_1259833 ?auto_1259834 ) ) ( not ( = ?auto_1259826 ?auto_1259834 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1259834 ?auto_1259832 )
      ( MAKE-2CRATE ?auto_1259832 ?auto_1259824 ?auto_1259825 )
      ( MAKE-1CRATE-VERIFY ?auto_1259824 ?auto_1259825 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1259835 - SURFACE
      ?auto_1259836 - SURFACE
      ?auto_1259837 - SURFACE
    )
    :vars
    (
      ?auto_1259842 - HOIST
      ?auto_1259845 - PLACE
      ?auto_1259838 - PLACE
      ?auto_1259844 - HOIST
      ?auto_1259839 - SURFACE
      ?auto_1259840 - SURFACE
      ?auto_1259841 - TRUCK
      ?auto_1259843 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1259842 ?auto_1259845 ) ( IS-CRATE ?auto_1259837 ) ( not ( = ?auto_1259836 ?auto_1259837 ) ) ( not ( = ?auto_1259835 ?auto_1259836 ) ) ( not ( = ?auto_1259835 ?auto_1259837 ) ) ( not ( = ?auto_1259838 ?auto_1259845 ) ) ( HOIST-AT ?auto_1259844 ?auto_1259838 ) ( not ( = ?auto_1259842 ?auto_1259844 ) ) ( SURFACE-AT ?auto_1259837 ?auto_1259838 ) ( ON ?auto_1259837 ?auto_1259839 ) ( CLEAR ?auto_1259837 ) ( not ( = ?auto_1259836 ?auto_1259839 ) ) ( not ( = ?auto_1259837 ?auto_1259839 ) ) ( not ( = ?auto_1259835 ?auto_1259839 ) ) ( IS-CRATE ?auto_1259836 ) ( AVAILABLE ?auto_1259844 ) ( SURFACE-AT ?auto_1259836 ?auto_1259838 ) ( ON ?auto_1259836 ?auto_1259840 ) ( CLEAR ?auto_1259836 ) ( not ( = ?auto_1259836 ?auto_1259840 ) ) ( not ( = ?auto_1259837 ?auto_1259840 ) ) ( not ( = ?auto_1259835 ?auto_1259840 ) ) ( not ( = ?auto_1259839 ?auto_1259840 ) ) ( TRUCK-AT ?auto_1259841 ?auto_1259845 ) ( SURFACE-AT ?auto_1259843 ?auto_1259845 ) ( CLEAR ?auto_1259843 ) ( LIFTING ?auto_1259842 ?auto_1259835 ) ( IS-CRATE ?auto_1259835 ) ( not ( = ?auto_1259843 ?auto_1259835 ) ) ( not ( = ?auto_1259836 ?auto_1259843 ) ) ( not ( = ?auto_1259837 ?auto_1259843 ) ) ( not ( = ?auto_1259839 ?auto_1259843 ) ) ( not ( = ?auto_1259840 ?auto_1259843 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1259836 ?auto_1259837 )
      ( MAKE-2CRATE-VERIFY ?auto_1259835 ?auto_1259836 ?auto_1259837 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1259847 - SURFACE
      ?auto_1259848 - SURFACE
      ?auto_1259849 - SURFACE
      ?auto_1259846 - SURFACE
    )
    :vars
    (
      ?auto_1259851 - HOIST
      ?auto_1259855 - PLACE
      ?auto_1259854 - PLACE
      ?auto_1259850 - HOIST
      ?auto_1259853 - SURFACE
      ?auto_1259852 - SURFACE
      ?auto_1259856 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1259851 ?auto_1259855 ) ( IS-CRATE ?auto_1259846 ) ( not ( = ?auto_1259849 ?auto_1259846 ) ) ( not ( = ?auto_1259848 ?auto_1259849 ) ) ( not ( = ?auto_1259848 ?auto_1259846 ) ) ( not ( = ?auto_1259854 ?auto_1259855 ) ) ( HOIST-AT ?auto_1259850 ?auto_1259854 ) ( not ( = ?auto_1259851 ?auto_1259850 ) ) ( SURFACE-AT ?auto_1259846 ?auto_1259854 ) ( ON ?auto_1259846 ?auto_1259853 ) ( CLEAR ?auto_1259846 ) ( not ( = ?auto_1259849 ?auto_1259853 ) ) ( not ( = ?auto_1259846 ?auto_1259853 ) ) ( not ( = ?auto_1259848 ?auto_1259853 ) ) ( IS-CRATE ?auto_1259849 ) ( AVAILABLE ?auto_1259850 ) ( SURFACE-AT ?auto_1259849 ?auto_1259854 ) ( ON ?auto_1259849 ?auto_1259852 ) ( CLEAR ?auto_1259849 ) ( not ( = ?auto_1259849 ?auto_1259852 ) ) ( not ( = ?auto_1259846 ?auto_1259852 ) ) ( not ( = ?auto_1259848 ?auto_1259852 ) ) ( not ( = ?auto_1259853 ?auto_1259852 ) ) ( TRUCK-AT ?auto_1259856 ?auto_1259855 ) ( SURFACE-AT ?auto_1259847 ?auto_1259855 ) ( CLEAR ?auto_1259847 ) ( LIFTING ?auto_1259851 ?auto_1259848 ) ( IS-CRATE ?auto_1259848 ) ( not ( = ?auto_1259847 ?auto_1259848 ) ) ( not ( = ?auto_1259849 ?auto_1259847 ) ) ( not ( = ?auto_1259846 ?auto_1259847 ) ) ( not ( = ?auto_1259853 ?auto_1259847 ) ) ( not ( = ?auto_1259852 ?auto_1259847 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1259848 ?auto_1259849 ?auto_1259846 )
      ( MAKE-3CRATE-VERIFY ?auto_1259847 ?auto_1259848 ?auto_1259849 ?auto_1259846 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1259993 - SURFACE
      ?auto_1259994 - SURFACE
      ?auto_1259995 - SURFACE
      ?auto_1259992 - SURFACE
      ?auto_1259996 - SURFACE
    )
    :vars
    (
      ?auto_1259997 - HOIST
      ?auto_1259998 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1259997 ?auto_1259998 ) ( SURFACE-AT ?auto_1259992 ?auto_1259998 ) ( CLEAR ?auto_1259992 ) ( LIFTING ?auto_1259997 ?auto_1259996 ) ( IS-CRATE ?auto_1259996 ) ( not ( = ?auto_1259992 ?auto_1259996 ) ) ( ON ?auto_1259994 ?auto_1259993 ) ( ON ?auto_1259995 ?auto_1259994 ) ( ON ?auto_1259992 ?auto_1259995 ) ( not ( = ?auto_1259993 ?auto_1259994 ) ) ( not ( = ?auto_1259993 ?auto_1259995 ) ) ( not ( = ?auto_1259993 ?auto_1259992 ) ) ( not ( = ?auto_1259993 ?auto_1259996 ) ) ( not ( = ?auto_1259994 ?auto_1259995 ) ) ( not ( = ?auto_1259994 ?auto_1259992 ) ) ( not ( = ?auto_1259994 ?auto_1259996 ) ) ( not ( = ?auto_1259995 ?auto_1259992 ) ) ( not ( = ?auto_1259995 ?auto_1259996 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1259992 ?auto_1259996 )
      ( MAKE-4CRATE-VERIFY ?auto_1259993 ?auto_1259994 ?auto_1259995 ?auto_1259992 ?auto_1259996 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1260018 - SURFACE
      ?auto_1260019 - SURFACE
      ?auto_1260020 - SURFACE
      ?auto_1260017 - SURFACE
      ?auto_1260021 - SURFACE
    )
    :vars
    (
      ?auto_1260023 - HOIST
      ?auto_1260024 - PLACE
      ?auto_1260022 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1260023 ?auto_1260024 ) ( SURFACE-AT ?auto_1260017 ?auto_1260024 ) ( CLEAR ?auto_1260017 ) ( IS-CRATE ?auto_1260021 ) ( not ( = ?auto_1260017 ?auto_1260021 ) ) ( TRUCK-AT ?auto_1260022 ?auto_1260024 ) ( AVAILABLE ?auto_1260023 ) ( IN ?auto_1260021 ?auto_1260022 ) ( ON ?auto_1260017 ?auto_1260020 ) ( not ( = ?auto_1260020 ?auto_1260017 ) ) ( not ( = ?auto_1260020 ?auto_1260021 ) ) ( ON ?auto_1260019 ?auto_1260018 ) ( ON ?auto_1260020 ?auto_1260019 ) ( not ( = ?auto_1260018 ?auto_1260019 ) ) ( not ( = ?auto_1260018 ?auto_1260020 ) ) ( not ( = ?auto_1260018 ?auto_1260017 ) ) ( not ( = ?auto_1260018 ?auto_1260021 ) ) ( not ( = ?auto_1260019 ?auto_1260020 ) ) ( not ( = ?auto_1260019 ?auto_1260017 ) ) ( not ( = ?auto_1260019 ?auto_1260021 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1260020 ?auto_1260017 ?auto_1260021 )
      ( MAKE-4CRATE-VERIFY ?auto_1260018 ?auto_1260019 ?auto_1260020 ?auto_1260017 ?auto_1260021 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1260048 - SURFACE
      ?auto_1260049 - SURFACE
      ?auto_1260050 - SURFACE
      ?auto_1260047 - SURFACE
      ?auto_1260051 - SURFACE
    )
    :vars
    (
      ?auto_1260055 - HOIST
      ?auto_1260052 - PLACE
      ?auto_1260053 - TRUCK
      ?auto_1260054 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1260055 ?auto_1260052 ) ( SURFACE-AT ?auto_1260047 ?auto_1260052 ) ( CLEAR ?auto_1260047 ) ( IS-CRATE ?auto_1260051 ) ( not ( = ?auto_1260047 ?auto_1260051 ) ) ( AVAILABLE ?auto_1260055 ) ( IN ?auto_1260051 ?auto_1260053 ) ( ON ?auto_1260047 ?auto_1260050 ) ( not ( = ?auto_1260050 ?auto_1260047 ) ) ( not ( = ?auto_1260050 ?auto_1260051 ) ) ( TRUCK-AT ?auto_1260053 ?auto_1260054 ) ( not ( = ?auto_1260054 ?auto_1260052 ) ) ( ON ?auto_1260049 ?auto_1260048 ) ( ON ?auto_1260050 ?auto_1260049 ) ( not ( = ?auto_1260048 ?auto_1260049 ) ) ( not ( = ?auto_1260048 ?auto_1260050 ) ) ( not ( = ?auto_1260048 ?auto_1260047 ) ) ( not ( = ?auto_1260048 ?auto_1260051 ) ) ( not ( = ?auto_1260049 ?auto_1260050 ) ) ( not ( = ?auto_1260049 ?auto_1260047 ) ) ( not ( = ?auto_1260049 ?auto_1260051 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1260050 ?auto_1260047 ?auto_1260051 )
      ( MAKE-4CRATE-VERIFY ?auto_1260048 ?auto_1260049 ?auto_1260050 ?auto_1260047 ?auto_1260051 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1260082 - SURFACE
      ?auto_1260083 - SURFACE
      ?auto_1260084 - SURFACE
      ?auto_1260081 - SURFACE
      ?auto_1260085 - SURFACE
    )
    :vars
    (
      ?auto_1260088 - HOIST
      ?auto_1260087 - PLACE
      ?auto_1260089 - TRUCK
      ?auto_1260090 - PLACE
      ?auto_1260086 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1260088 ?auto_1260087 ) ( SURFACE-AT ?auto_1260081 ?auto_1260087 ) ( CLEAR ?auto_1260081 ) ( IS-CRATE ?auto_1260085 ) ( not ( = ?auto_1260081 ?auto_1260085 ) ) ( AVAILABLE ?auto_1260088 ) ( ON ?auto_1260081 ?auto_1260084 ) ( not ( = ?auto_1260084 ?auto_1260081 ) ) ( not ( = ?auto_1260084 ?auto_1260085 ) ) ( TRUCK-AT ?auto_1260089 ?auto_1260090 ) ( not ( = ?auto_1260090 ?auto_1260087 ) ) ( HOIST-AT ?auto_1260086 ?auto_1260090 ) ( LIFTING ?auto_1260086 ?auto_1260085 ) ( not ( = ?auto_1260088 ?auto_1260086 ) ) ( ON ?auto_1260083 ?auto_1260082 ) ( ON ?auto_1260084 ?auto_1260083 ) ( not ( = ?auto_1260082 ?auto_1260083 ) ) ( not ( = ?auto_1260082 ?auto_1260084 ) ) ( not ( = ?auto_1260082 ?auto_1260081 ) ) ( not ( = ?auto_1260082 ?auto_1260085 ) ) ( not ( = ?auto_1260083 ?auto_1260084 ) ) ( not ( = ?auto_1260083 ?auto_1260081 ) ) ( not ( = ?auto_1260083 ?auto_1260085 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1260084 ?auto_1260081 ?auto_1260085 )
      ( MAKE-4CRATE-VERIFY ?auto_1260082 ?auto_1260083 ?auto_1260084 ?auto_1260081 ?auto_1260085 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1260120 - SURFACE
      ?auto_1260121 - SURFACE
      ?auto_1260122 - SURFACE
      ?auto_1260119 - SURFACE
      ?auto_1260123 - SURFACE
    )
    :vars
    (
      ?auto_1260127 - HOIST
      ?auto_1260128 - PLACE
      ?auto_1260126 - TRUCK
      ?auto_1260125 - PLACE
      ?auto_1260129 - HOIST
      ?auto_1260124 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1260127 ?auto_1260128 ) ( SURFACE-AT ?auto_1260119 ?auto_1260128 ) ( CLEAR ?auto_1260119 ) ( IS-CRATE ?auto_1260123 ) ( not ( = ?auto_1260119 ?auto_1260123 ) ) ( AVAILABLE ?auto_1260127 ) ( ON ?auto_1260119 ?auto_1260122 ) ( not ( = ?auto_1260122 ?auto_1260119 ) ) ( not ( = ?auto_1260122 ?auto_1260123 ) ) ( TRUCK-AT ?auto_1260126 ?auto_1260125 ) ( not ( = ?auto_1260125 ?auto_1260128 ) ) ( HOIST-AT ?auto_1260129 ?auto_1260125 ) ( not ( = ?auto_1260127 ?auto_1260129 ) ) ( AVAILABLE ?auto_1260129 ) ( SURFACE-AT ?auto_1260123 ?auto_1260125 ) ( ON ?auto_1260123 ?auto_1260124 ) ( CLEAR ?auto_1260123 ) ( not ( = ?auto_1260119 ?auto_1260124 ) ) ( not ( = ?auto_1260123 ?auto_1260124 ) ) ( not ( = ?auto_1260122 ?auto_1260124 ) ) ( ON ?auto_1260121 ?auto_1260120 ) ( ON ?auto_1260122 ?auto_1260121 ) ( not ( = ?auto_1260120 ?auto_1260121 ) ) ( not ( = ?auto_1260120 ?auto_1260122 ) ) ( not ( = ?auto_1260120 ?auto_1260119 ) ) ( not ( = ?auto_1260120 ?auto_1260123 ) ) ( not ( = ?auto_1260120 ?auto_1260124 ) ) ( not ( = ?auto_1260121 ?auto_1260122 ) ) ( not ( = ?auto_1260121 ?auto_1260119 ) ) ( not ( = ?auto_1260121 ?auto_1260123 ) ) ( not ( = ?auto_1260121 ?auto_1260124 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1260122 ?auto_1260119 ?auto_1260123 )
      ( MAKE-4CRATE-VERIFY ?auto_1260120 ?auto_1260121 ?auto_1260122 ?auto_1260119 ?auto_1260123 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1260159 - SURFACE
      ?auto_1260160 - SURFACE
      ?auto_1260161 - SURFACE
      ?auto_1260158 - SURFACE
      ?auto_1260162 - SURFACE
    )
    :vars
    (
      ?auto_1260168 - HOIST
      ?auto_1260167 - PLACE
      ?auto_1260166 - PLACE
      ?auto_1260165 - HOIST
      ?auto_1260164 - SURFACE
      ?auto_1260163 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1260168 ?auto_1260167 ) ( SURFACE-AT ?auto_1260158 ?auto_1260167 ) ( CLEAR ?auto_1260158 ) ( IS-CRATE ?auto_1260162 ) ( not ( = ?auto_1260158 ?auto_1260162 ) ) ( AVAILABLE ?auto_1260168 ) ( ON ?auto_1260158 ?auto_1260161 ) ( not ( = ?auto_1260161 ?auto_1260158 ) ) ( not ( = ?auto_1260161 ?auto_1260162 ) ) ( not ( = ?auto_1260166 ?auto_1260167 ) ) ( HOIST-AT ?auto_1260165 ?auto_1260166 ) ( not ( = ?auto_1260168 ?auto_1260165 ) ) ( AVAILABLE ?auto_1260165 ) ( SURFACE-AT ?auto_1260162 ?auto_1260166 ) ( ON ?auto_1260162 ?auto_1260164 ) ( CLEAR ?auto_1260162 ) ( not ( = ?auto_1260158 ?auto_1260164 ) ) ( not ( = ?auto_1260162 ?auto_1260164 ) ) ( not ( = ?auto_1260161 ?auto_1260164 ) ) ( TRUCK-AT ?auto_1260163 ?auto_1260167 ) ( ON ?auto_1260160 ?auto_1260159 ) ( ON ?auto_1260161 ?auto_1260160 ) ( not ( = ?auto_1260159 ?auto_1260160 ) ) ( not ( = ?auto_1260159 ?auto_1260161 ) ) ( not ( = ?auto_1260159 ?auto_1260158 ) ) ( not ( = ?auto_1260159 ?auto_1260162 ) ) ( not ( = ?auto_1260159 ?auto_1260164 ) ) ( not ( = ?auto_1260160 ?auto_1260161 ) ) ( not ( = ?auto_1260160 ?auto_1260158 ) ) ( not ( = ?auto_1260160 ?auto_1260162 ) ) ( not ( = ?auto_1260160 ?auto_1260164 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1260161 ?auto_1260158 ?auto_1260162 )
      ( MAKE-4CRATE-VERIFY ?auto_1260159 ?auto_1260160 ?auto_1260161 ?auto_1260158 ?auto_1260162 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1260198 - SURFACE
      ?auto_1260199 - SURFACE
      ?auto_1260200 - SURFACE
      ?auto_1260197 - SURFACE
      ?auto_1260201 - SURFACE
    )
    :vars
    (
      ?auto_1260205 - HOIST
      ?auto_1260203 - PLACE
      ?auto_1260207 - PLACE
      ?auto_1260202 - HOIST
      ?auto_1260204 - SURFACE
      ?auto_1260206 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1260205 ?auto_1260203 ) ( IS-CRATE ?auto_1260201 ) ( not ( = ?auto_1260197 ?auto_1260201 ) ) ( not ( = ?auto_1260200 ?auto_1260197 ) ) ( not ( = ?auto_1260200 ?auto_1260201 ) ) ( not ( = ?auto_1260207 ?auto_1260203 ) ) ( HOIST-AT ?auto_1260202 ?auto_1260207 ) ( not ( = ?auto_1260205 ?auto_1260202 ) ) ( AVAILABLE ?auto_1260202 ) ( SURFACE-AT ?auto_1260201 ?auto_1260207 ) ( ON ?auto_1260201 ?auto_1260204 ) ( CLEAR ?auto_1260201 ) ( not ( = ?auto_1260197 ?auto_1260204 ) ) ( not ( = ?auto_1260201 ?auto_1260204 ) ) ( not ( = ?auto_1260200 ?auto_1260204 ) ) ( TRUCK-AT ?auto_1260206 ?auto_1260203 ) ( SURFACE-AT ?auto_1260200 ?auto_1260203 ) ( CLEAR ?auto_1260200 ) ( LIFTING ?auto_1260205 ?auto_1260197 ) ( IS-CRATE ?auto_1260197 ) ( ON ?auto_1260199 ?auto_1260198 ) ( ON ?auto_1260200 ?auto_1260199 ) ( not ( = ?auto_1260198 ?auto_1260199 ) ) ( not ( = ?auto_1260198 ?auto_1260200 ) ) ( not ( = ?auto_1260198 ?auto_1260197 ) ) ( not ( = ?auto_1260198 ?auto_1260201 ) ) ( not ( = ?auto_1260198 ?auto_1260204 ) ) ( not ( = ?auto_1260199 ?auto_1260200 ) ) ( not ( = ?auto_1260199 ?auto_1260197 ) ) ( not ( = ?auto_1260199 ?auto_1260201 ) ) ( not ( = ?auto_1260199 ?auto_1260204 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1260200 ?auto_1260197 ?auto_1260201 )
      ( MAKE-4CRATE-VERIFY ?auto_1260198 ?auto_1260199 ?auto_1260200 ?auto_1260197 ?auto_1260201 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1260237 - SURFACE
      ?auto_1260238 - SURFACE
      ?auto_1260239 - SURFACE
      ?auto_1260236 - SURFACE
      ?auto_1260240 - SURFACE
    )
    :vars
    (
      ?auto_1260244 - HOIST
      ?auto_1260242 - PLACE
      ?auto_1260245 - PLACE
      ?auto_1260243 - HOIST
      ?auto_1260241 - SURFACE
      ?auto_1260246 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1260244 ?auto_1260242 ) ( IS-CRATE ?auto_1260240 ) ( not ( = ?auto_1260236 ?auto_1260240 ) ) ( not ( = ?auto_1260239 ?auto_1260236 ) ) ( not ( = ?auto_1260239 ?auto_1260240 ) ) ( not ( = ?auto_1260245 ?auto_1260242 ) ) ( HOIST-AT ?auto_1260243 ?auto_1260245 ) ( not ( = ?auto_1260244 ?auto_1260243 ) ) ( AVAILABLE ?auto_1260243 ) ( SURFACE-AT ?auto_1260240 ?auto_1260245 ) ( ON ?auto_1260240 ?auto_1260241 ) ( CLEAR ?auto_1260240 ) ( not ( = ?auto_1260236 ?auto_1260241 ) ) ( not ( = ?auto_1260240 ?auto_1260241 ) ) ( not ( = ?auto_1260239 ?auto_1260241 ) ) ( TRUCK-AT ?auto_1260246 ?auto_1260242 ) ( SURFACE-AT ?auto_1260239 ?auto_1260242 ) ( CLEAR ?auto_1260239 ) ( IS-CRATE ?auto_1260236 ) ( AVAILABLE ?auto_1260244 ) ( IN ?auto_1260236 ?auto_1260246 ) ( ON ?auto_1260238 ?auto_1260237 ) ( ON ?auto_1260239 ?auto_1260238 ) ( not ( = ?auto_1260237 ?auto_1260238 ) ) ( not ( = ?auto_1260237 ?auto_1260239 ) ) ( not ( = ?auto_1260237 ?auto_1260236 ) ) ( not ( = ?auto_1260237 ?auto_1260240 ) ) ( not ( = ?auto_1260237 ?auto_1260241 ) ) ( not ( = ?auto_1260238 ?auto_1260239 ) ) ( not ( = ?auto_1260238 ?auto_1260236 ) ) ( not ( = ?auto_1260238 ?auto_1260240 ) ) ( not ( = ?auto_1260238 ?auto_1260241 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1260239 ?auto_1260236 ?auto_1260240 )
      ( MAKE-4CRATE-VERIFY ?auto_1260237 ?auto_1260238 ?auto_1260239 ?auto_1260236 ?auto_1260240 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1260509 - SURFACE
      ?auto_1260510 - SURFACE
    )
    :vars
    (
      ?auto_1260514 - HOIST
      ?auto_1260516 - PLACE
      ?auto_1260513 - SURFACE
      ?auto_1260517 - PLACE
      ?auto_1260511 - HOIST
      ?auto_1260515 - SURFACE
      ?auto_1260512 - TRUCK
      ?auto_1260518 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1260514 ?auto_1260516 ) ( SURFACE-AT ?auto_1260509 ?auto_1260516 ) ( CLEAR ?auto_1260509 ) ( IS-CRATE ?auto_1260510 ) ( not ( = ?auto_1260509 ?auto_1260510 ) ) ( ON ?auto_1260509 ?auto_1260513 ) ( not ( = ?auto_1260513 ?auto_1260509 ) ) ( not ( = ?auto_1260513 ?auto_1260510 ) ) ( not ( = ?auto_1260517 ?auto_1260516 ) ) ( HOIST-AT ?auto_1260511 ?auto_1260517 ) ( not ( = ?auto_1260514 ?auto_1260511 ) ) ( AVAILABLE ?auto_1260511 ) ( SURFACE-AT ?auto_1260510 ?auto_1260517 ) ( ON ?auto_1260510 ?auto_1260515 ) ( CLEAR ?auto_1260510 ) ( not ( = ?auto_1260509 ?auto_1260515 ) ) ( not ( = ?auto_1260510 ?auto_1260515 ) ) ( not ( = ?auto_1260513 ?auto_1260515 ) ) ( TRUCK-AT ?auto_1260512 ?auto_1260516 ) ( LIFTING ?auto_1260514 ?auto_1260518 ) ( IS-CRATE ?auto_1260518 ) ( not ( = ?auto_1260509 ?auto_1260518 ) ) ( not ( = ?auto_1260510 ?auto_1260518 ) ) ( not ( = ?auto_1260513 ?auto_1260518 ) ) ( not ( = ?auto_1260515 ?auto_1260518 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1260514 ?auto_1260518 ?auto_1260512 ?auto_1260516 )
      ( MAKE-1CRATE ?auto_1260509 ?auto_1260510 )
      ( MAKE-1CRATE-VERIFY ?auto_1260509 ?auto_1260510 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1260896 - SURFACE
      ?auto_1260897 - SURFACE
      ?auto_1260898 - SURFACE
      ?auto_1260895 - SURFACE
      ?auto_1260899 - SURFACE
      ?auto_1260900 - SURFACE
    )
    :vars
    (
      ?auto_1260902 - HOIST
      ?auto_1260901 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1260902 ?auto_1260901 ) ( SURFACE-AT ?auto_1260899 ?auto_1260901 ) ( CLEAR ?auto_1260899 ) ( LIFTING ?auto_1260902 ?auto_1260900 ) ( IS-CRATE ?auto_1260900 ) ( not ( = ?auto_1260899 ?auto_1260900 ) ) ( ON ?auto_1260897 ?auto_1260896 ) ( ON ?auto_1260898 ?auto_1260897 ) ( ON ?auto_1260895 ?auto_1260898 ) ( ON ?auto_1260899 ?auto_1260895 ) ( not ( = ?auto_1260896 ?auto_1260897 ) ) ( not ( = ?auto_1260896 ?auto_1260898 ) ) ( not ( = ?auto_1260896 ?auto_1260895 ) ) ( not ( = ?auto_1260896 ?auto_1260899 ) ) ( not ( = ?auto_1260896 ?auto_1260900 ) ) ( not ( = ?auto_1260897 ?auto_1260898 ) ) ( not ( = ?auto_1260897 ?auto_1260895 ) ) ( not ( = ?auto_1260897 ?auto_1260899 ) ) ( not ( = ?auto_1260897 ?auto_1260900 ) ) ( not ( = ?auto_1260898 ?auto_1260895 ) ) ( not ( = ?auto_1260898 ?auto_1260899 ) ) ( not ( = ?auto_1260898 ?auto_1260900 ) ) ( not ( = ?auto_1260895 ?auto_1260899 ) ) ( not ( = ?auto_1260895 ?auto_1260900 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1260899 ?auto_1260900 )
      ( MAKE-5CRATE-VERIFY ?auto_1260896 ?auto_1260897 ?auto_1260898 ?auto_1260895 ?auto_1260899 ?auto_1260900 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1260930 - SURFACE
      ?auto_1260931 - SURFACE
      ?auto_1260932 - SURFACE
      ?auto_1260929 - SURFACE
      ?auto_1260933 - SURFACE
      ?auto_1260934 - SURFACE
    )
    :vars
    (
      ?auto_1260936 - HOIST
      ?auto_1260935 - PLACE
      ?auto_1260937 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1260936 ?auto_1260935 ) ( SURFACE-AT ?auto_1260933 ?auto_1260935 ) ( CLEAR ?auto_1260933 ) ( IS-CRATE ?auto_1260934 ) ( not ( = ?auto_1260933 ?auto_1260934 ) ) ( TRUCK-AT ?auto_1260937 ?auto_1260935 ) ( AVAILABLE ?auto_1260936 ) ( IN ?auto_1260934 ?auto_1260937 ) ( ON ?auto_1260933 ?auto_1260929 ) ( not ( = ?auto_1260929 ?auto_1260933 ) ) ( not ( = ?auto_1260929 ?auto_1260934 ) ) ( ON ?auto_1260931 ?auto_1260930 ) ( ON ?auto_1260932 ?auto_1260931 ) ( ON ?auto_1260929 ?auto_1260932 ) ( not ( = ?auto_1260930 ?auto_1260931 ) ) ( not ( = ?auto_1260930 ?auto_1260932 ) ) ( not ( = ?auto_1260930 ?auto_1260929 ) ) ( not ( = ?auto_1260930 ?auto_1260933 ) ) ( not ( = ?auto_1260930 ?auto_1260934 ) ) ( not ( = ?auto_1260931 ?auto_1260932 ) ) ( not ( = ?auto_1260931 ?auto_1260929 ) ) ( not ( = ?auto_1260931 ?auto_1260933 ) ) ( not ( = ?auto_1260931 ?auto_1260934 ) ) ( not ( = ?auto_1260932 ?auto_1260929 ) ) ( not ( = ?auto_1260932 ?auto_1260933 ) ) ( not ( = ?auto_1260932 ?auto_1260934 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1260929 ?auto_1260933 ?auto_1260934 )
      ( MAKE-5CRATE-VERIFY ?auto_1260930 ?auto_1260931 ?auto_1260932 ?auto_1260929 ?auto_1260933 ?auto_1260934 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1260970 - SURFACE
      ?auto_1260971 - SURFACE
      ?auto_1260972 - SURFACE
      ?auto_1260969 - SURFACE
      ?auto_1260973 - SURFACE
      ?auto_1260974 - SURFACE
    )
    :vars
    (
      ?auto_1260977 - HOIST
      ?auto_1260975 - PLACE
      ?auto_1260976 - TRUCK
      ?auto_1260978 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1260977 ?auto_1260975 ) ( SURFACE-AT ?auto_1260973 ?auto_1260975 ) ( CLEAR ?auto_1260973 ) ( IS-CRATE ?auto_1260974 ) ( not ( = ?auto_1260973 ?auto_1260974 ) ) ( AVAILABLE ?auto_1260977 ) ( IN ?auto_1260974 ?auto_1260976 ) ( ON ?auto_1260973 ?auto_1260969 ) ( not ( = ?auto_1260969 ?auto_1260973 ) ) ( not ( = ?auto_1260969 ?auto_1260974 ) ) ( TRUCK-AT ?auto_1260976 ?auto_1260978 ) ( not ( = ?auto_1260978 ?auto_1260975 ) ) ( ON ?auto_1260971 ?auto_1260970 ) ( ON ?auto_1260972 ?auto_1260971 ) ( ON ?auto_1260969 ?auto_1260972 ) ( not ( = ?auto_1260970 ?auto_1260971 ) ) ( not ( = ?auto_1260970 ?auto_1260972 ) ) ( not ( = ?auto_1260970 ?auto_1260969 ) ) ( not ( = ?auto_1260970 ?auto_1260973 ) ) ( not ( = ?auto_1260970 ?auto_1260974 ) ) ( not ( = ?auto_1260971 ?auto_1260972 ) ) ( not ( = ?auto_1260971 ?auto_1260969 ) ) ( not ( = ?auto_1260971 ?auto_1260973 ) ) ( not ( = ?auto_1260971 ?auto_1260974 ) ) ( not ( = ?auto_1260972 ?auto_1260969 ) ) ( not ( = ?auto_1260972 ?auto_1260973 ) ) ( not ( = ?auto_1260972 ?auto_1260974 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1260969 ?auto_1260973 ?auto_1260974 )
      ( MAKE-5CRATE-VERIFY ?auto_1260970 ?auto_1260971 ?auto_1260972 ?auto_1260969 ?auto_1260973 ?auto_1260974 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1261015 - SURFACE
      ?auto_1261016 - SURFACE
      ?auto_1261017 - SURFACE
      ?auto_1261014 - SURFACE
      ?auto_1261018 - SURFACE
      ?auto_1261019 - SURFACE
    )
    :vars
    (
      ?auto_1261021 - HOIST
      ?auto_1261024 - PLACE
      ?auto_1261020 - TRUCK
      ?auto_1261022 - PLACE
      ?auto_1261023 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1261021 ?auto_1261024 ) ( SURFACE-AT ?auto_1261018 ?auto_1261024 ) ( CLEAR ?auto_1261018 ) ( IS-CRATE ?auto_1261019 ) ( not ( = ?auto_1261018 ?auto_1261019 ) ) ( AVAILABLE ?auto_1261021 ) ( ON ?auto_1261018 ?auto_1261014 ) ( not ( = ?auto_1261014 ?auto_1261018 ) ) ( not ( = ?auto_1261014 ?auto_1261019 ) ) ( TRUCK-AT ?auto_1261020 ?auto_1261022 ) ( not ( = ?auto_1261022 ?auto_1261024 ) ) ( HOIST-AT ?auto_1261023 ?auto_1261022 ) ( LIFTING ?auto_1261023 ?auto_1261019 ) ( not ( = ?auto_1261021 ?auto_1261023 ) ) ( ON ?auto_1261016 ?auto_1261015 ) ( ON ?auto_1261017 ?auto_1261016 ) ( ON ?auto_1261014 ?auto_1261017 ) ( not ( = ?auto_1261015 ?auto_1261016 ) ) ( not ( = ?auto_1261015 ?auto_1261017 ) ) ( not ( = ?auto_1261015 ?auto_1261014 ) ) ( not ( = ?auto_1261015 ?auto_1261018 ) ) ( not ( = ?auto_1261015 ?auto_1261019 ) ) ( not ( = ?auto_1261016 ?auto_1261017 ) ) ( not ( = ?auto_1261016 ?auto_1261014 ) ) ( not ( = ?auto_1261016 ?auto_1261018 ) ) ( not ( = ?auto_1261016 ?auto_1261019 ) ) ( not ( = ?auto_1261017 ?auto_1261014 ) ) ( not ( = ?auto_1261017 ?auto_1261018 ) ) ( not ( = ?auto_1261017 ?auto_1261019 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1261014 ?auto_1261018 ?auto_1261019 )
      ( MAKE-5CRATE-VERIFY ?auto_1261015 ?auto_1261016 ?auto_1261017 ?auto_1261014 ?auto_1261018 ?auto_1261019 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1261065 - SURFACE
      ?auto_1261066 - SURFACE
      ?auto_1261067 - SURFACE
      ?auto_1261064 - SURFACE
      ?auto_1261068 - SURFACE
      ?auto_1261069 - SURFACE
    )
    :vars
    (
      ?auto_1261072 - HOIST
      ?auto_1261070 - PLACE
      ?auto_1261071 - TRUCK
      ?auto_1261074 - PLACE
      ?auto_1261073 - HOIST
      ?auto_1261075 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1261072 ?auto_1261070 ) ( SURFACE-AT ?auto_1261068 ?auto_1261070 ) ( CLEAR ?auto_1261068 ) ( IS-CRATE ?auto_1261069 ) ( not ( = ?auto_1261068 ?auto_1261069 ) ) ( AVAILABLE ?auto_1261072 ) ( ON ?auto_1261068 ?auto_1261064 ) ( not ( = ?auto_1261064 ?auto_1261068 ) ) ( not ( = ?auto_1261064 ?auto_1261069 ) ) ( TRUCK-AT ?auto_1261071 ?auto_1261074 ) ( not ( = ?auto_1261074 ?auto_1261070 ) ) ( HOIST-AT ?auto_1261073 ?auto_1261074 ) ( not ( = ?auto_1261072 ?auto_1261073 ) ) ( AVAILABLE ?auto_1261073 ) ( SURFACE-AT ?auto_1261069 ?auto_1261074 ) ( ON ?auto_1261069 ?auto_1261075 ) ( CLEAR ?auto_1261069 ) ( not ( = ?auto_1261068 ?auto_1261075 ) ) ( not ( = ?auto_1261069 ?auto_1261075 ) ) ( not ( = ?auto_1261064 ?auto_1261075 ) ) ( ON ?auto_1261066 ?auto_1261065 ) ( ON ?auto_1261067 ?auto_1261066 ) ( ON ?auto_1261064 ?auto_1261067 ) ( not ( = ?auto_1261065 ?auto_1261066 ) ) ( not ( = ?auto_1261065 ?auto_1261067 ) ) ( not ( = ?auto_1261065 ?auto_1261064 ) ) ( not ( = ?auto_1261065 ?auto_1261068 ) ) ( not ( = ?auto_1261065 ?auto_1261069 ) ) ( not ( = ?auto_1261065 ?auto_1261075 ) ) ( not ( = ?auto_1261066 ?auto_1261067 ) ) ( not ( = ?auto_1261066 ?auto_1261064 ) ) ( not ( = ?auto_1261066 ?auto_1261068 ) ) ( not ( = ?auto_1261066 ?auto_1261069 ) ) ( not ( = ?auto_1261066 ?auto_1261075 ) ) ( not ( = ?auto_1261067 ?auto_1261064 ) ) ( not ( = ?auto_1261067 ?auto_1261068 ) ) ( not ( = ?auto_1261067 ?auto_1261069 ) ) ( not ( = ?auto_1261067 ?auto_1261075 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1261064 ?auto_1261068 ?auto_1261069 )
      ( MAKE-5CRATE-VERIFY ?auto_1261065 ?auto_1261066 ?auto_1261067 ?auto_1261064 ?auto_1261068 ?auto_1261069 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1261116 - SURFACE
      ?auto_1261117 - SURFACE
      ?auto_1261118 - SURFACE
      ?auto_1261115 - SURFACE
      ?auto_1261119 - SURFACE
      ?auto_1261120 - SURFACE
    )
    :vars
    (
      ?auto_1261122 - HOIST
      ?auto_1261121 - PLACE
      ?auto_1261125 - PLACE
      ?auto_1261123 - HOIST
      ?auto_1261126 - SURFACE
      ?auto_1261124 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1261122 ?auto_1261121 ) ( SURFACE-AT ?auto_1261119 ?auto_1261121 ) ( CLEAR ?auto_1261119 ) ( IS-CRATE ?auto_1261120 ) ( not ( = ?auto_1261119 ?auto_1261120 ) ) ( AVAILABLE ?auto_1261122 ) ( ON ?auto_1261119 ?auto_1261115 ) ( not ( = ?auto_1261115 ?auto_1261119 ) ) ( not ( = ?auto_1261115 ?auto_1261120 ) ) ( not ( = ?auto_1261125 ?auto_1261121 ) ) ( HOIST-AT ?auto_1261123 ?auto_1261125 ) ( not ( = ?auto_1261122 ?auto_1261123 ) ) ( AVAILABLE ?auto_1261123 ) ( SURFACE-AT ?auto_1261120 ?auto_1261125 ) ( ON ?auto_1261120 ?auto_1261126 ) ( CLEAR ?auto_1261120 ) ( not ( = ?auto_1261119 ?auto_1261126 ) ) ( not ( = ?auto_1261120 ?auto_1261126 ) ) ( not ( = ?auto_1261115 ?auto_1261126 ) ) ( TRUCK-AT ?auto_1261124 ?auto_1261121 ) ( ON ?auto_1261117 ?auto_1261116 ) ( ON ?auto_1261118 ?auto_1261117 ) ( ON ?auto_1261115 ?auto_1261118 ) ( not ( = ?auto_1261116 ?auto_1261117 ) ) ( not ( = ?auto_1261116 ?auto_1261118 ) ) ( not ( = ?auto_1261116 ?auto_1261115 ) ) ( not ( = ?auto_1261116 ?auto_1261119 ) ) ( not ( = ?auto_1261116 ?auto_1261120 ) ) ( not ( = ?auto_1261116 ?auto_1261126 ) ) ( not ( = ?auto_1261117 ?auto_1261118 ) ) ( not ( = ?auto_1261117 ?auto_1261115 ) ) ( not ( = ?auto_1261117 ?auto_1261119 ) ) ( not ( = ?auto_1261117 ?auto_1261120 ) ) ( not ( = ?auto_1261117 ?auto_1261126 ) ) ( not ( = ?auto_1261118 ?auto_1261115 ) ) ( not ( = ?auto_1261118 ?auto_1261119 ) ) ( not ( = ?auto_1261118 ?auto_1261120 ) ) ( not ( = ?auto_1261118 ?auto_1261126 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1261115 ?auto_1261119 ?auto_1261120 )
      ( MAKE-5CRATE-VERIFY ?auto_1261116 ?auto_1261117 ?auto_1261118 ?auto_1261115 ?auto_1261119 ?auto_1261120 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1261167 - SURFACE
      ?auto_1261168 - SURFACE
      ?auto_1261169 - SURFACE
      ?auto_1261166 - SURFACE
      ?auto_1261170 - SURFACE
      ?auto_1261171 - SURFACE
    )
    :vars
    (
      ?auto_1261176 - HOIST
      ?auto_1261172 - PLACE
      ?auto_1261174 - PLACE
      ?auto_1261177 - HOIST
      ?auto_1261175 - SURFACE
      ?auto_1261173 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1261176 ?auto_1261172 ) ( IS-CRATE ?auto_1261171 ) ( not ( = ?auto_1261170 ?auto_1261171 ) ) ( not ( = ?auto_1261166 ?auto_1261170 ) ) ( not ( = ?auto_1261166 ?auto_1261171 ) ) ( not ( = ?auto_1261174 ?auto_1261172 ) ) ( HOIST-AT ?auto_1261177 ?auto_1261174 ) ( not ( = ?auto_1261176 ?auto_1261177 ) ) ( AVAILABLE ?auto_1261177 ) ( SURFACE-AT ?auto_1261171 ?auto_1261174 ) ( ON ?auto_1261171 ?auto_1261175 ) ( CLEAR ?auto_1261171 ) ( not ( = ?auto_1261170 ?auto_1261175 ) ) ( not ( = ?auto_1261171 ?auto_1261175 ) ) ( not ( = ?auto_1261166 ?auto_1261175 ) ) ( TRUCK-AT ?auto_1261173 ?auto_1261172 ) ( SURFACE-AT ?auto_1261166 ?auto_1261172 ) ( CLEAR ?auto_1261166 ) ( LIFTING ?auto_1261176 ?auto_1261170 ) ( IS-CRATE ?auto_1261170 ) ( ON ?auto_1261168 ?auto_1261167 ) ( ON ?auto_1261169 ?auto_1261168 ) ( ON ?auto_1261166 ?auto_1261169 ) ( not ( = ?auto_1261167 ?auto_1261168 ) ) ( not ( = ?auto_1261167 ?auto_1261169 ) ) ( not ( = ?auto_1261167 ?auto_1261166 ) ) ( not ( = ?auto_1261167 ?auto_1261170 ) ) ( not ( = ?auto_1261167 ?auto_1261171 ) ) ( not ( = ?auto_1261167 ?auto_1261175 ) ) ( not ( = ?auto_1261168 ?auto_1261169 ) ) ( not ( = ?auto_1261168 ?auto_1261166 ) ) ( not ( = ?auto_1261168 ?auto_1261170 ) ) ( not ( = ?auto_1261168 ?auto_1261171 ) ) ( not ( = ?auto_1261168 ?auto_1261175 ) ) ( not ( = ?auto_1261169 ?auto_1261166 ) ) ( not ( = ?auto_1261169 ?auto_1261170 ) ) ( not ( = ?auto_1261169 ?auto_1261171 ) ) ( not ( = ?auto_1261169 ?auto_1261175 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1261166 ?auto_1261170 ?auto_1261171 )
      ( MAKE-5CRATE-VERIFY ?auto_1261167 ?auto_1261168 ?auto_1261169 ?auto_1261166 ?auto_1261170 ?auto_1261171 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1261218 - SURFACE
      ?auto_1261219 - SURFACE
      ?auto_1261220 - SURFACE
      ?auto_1261217 - SURFACE
      ?auto_1261221 - SURFACE
      ?auto_1261222 - SURFACE
    )
    :vars
    (
      ?auto_1261225 - HOIST
      ?auto_1261228 - PLACE
      ?auto_1261224 - PLACE
      ?auto_1261226 - HOIST
      ?auto_1261223 - SURFACE
      ?auto_1261227 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1261225 ?auto_1261228 ) ( IS-CRATE ?auto_1261222 ) ( not ( = ?auto_1261221 ?auto_1261222 ) ) ( not ( = ?auto_1261217 ?auto_1261221 ) ) ( not ( = ?auto_1261217 ?auto_1261222 ) ) ( not ( = ?auto_1261224 ?auto_1261228 ) ) ( HOIST-AT ?auto_1261226 ?auto_1261224 ) ( not ( = ?auto_1261225 ?auto_1261226 ) ) ( AVAILABLE ?auto_1261226 ) ( SURFACE-AT ?auto_1261222 ?auto_1261224 ) ( ON ?auto_1261222 ?auto_1261223 ) ( CLEAR ?auto_1261222 ) ( not ( = ?auto_1261221 ?auto_1261223 ) ) ( not ( = ?auto_1261222 ?auto_1261223 ) ) ( not ( = ?auto_1261217 ?auto_1261223 ) ) ( TRUCK-AT ?auto_1261227 ?auto_1261228 ) ( SURFACE-AT ?auto_1261217 ?auto_1261228 ) ( CLEAR ?auto_1261217 ) ( IS-CRATE ?auto_1261221 ) ( AVAILABLE ?auto_1261225 ) ( IN ?auto_1261221 ?auto_1261227 ) ( ON ?auto_1261219 ?auto_1261218 ) ( ON ?auto_1261220 ?auto_1261219 ) ( ON ?auto_1261217 ?auto_1261220 ) ( not ( = ?auto_1261218 ?auto_1261219 ) ) ( not ( = ?auto_1261218 ?auto_1261220 ) ) ( not ( = ?auto_1261218 ?auto_1261217 ) ) ( not ( = ?auto_1261218 ?auto_1261221 ) ) ( not ( = ?auto_1261218 ?auto_1261222 ) ) ( not ( = ?auto_1261218 ?auto_1261223 ) ) ( not ( = ?auto_1261219 ?auto_1261220 ) ) ( not ( = ?auto_1261219 ?auto_1261217 ) ) ( not ( = ?auto_1261219 ?auto_1261221 ) ) ( not ( = ?auto_1261219 ?auto_1261222 ) ) ( not ( = ?auto_1261219 ?auto_1261223 ) ) ( not ( = ?auto_1261220 ?auto_1261217 ) ) ( not ( = ?auto_1261220 ?auto_1261221 ) ) ( not ( = ?auto_1261220 ?auto_1261222 ) ) ( not ( = ?auto_1261220 ?auto_1261223 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1261217 ?auto_1261221 ?auto_1261222 )
      ( MAKE-5CRATE-VERIFY ?auto_1261218 ?auto_1261219 ?auto_1261220 ?auto_1261217 ?auto_1261221 ?auto_1261222 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1262427 - SURFACE
      ?auto_1262428 - SURFACE
      ?auto_1262429 - SURFACE
      ?auto_1262426 - SURFACE
      ?auto_1262430 - SURFACE
      ?auto_1262432 - SURFACE
      ?auto_1262431 - SURFACE
    )
    :vars
    (
      ?auto_1262433 - HOIST
      ?auto_1262434 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1262433 ?auto_1262434 ) ( SURFACE-AT ?auto_1262432 ?auto_1262434 ) ( CLEAR ?auto_1262432 ) ( LIFTING ?auto_1262433 ?auto_1262431 ) ( IS-CRATE ?auto_1262431 ) ( not ( = ?auto_1262432 ?auto_1262431 ) ) ( ON ?auto_1262428 ?auto_1262427 ) ( ON ?auto_1262429 ?auto_1262428 ) ( ON ?auto_1262426 ?auto_1262429 ) ( ON ?auto_1262430 ?auto_1262426 ) ( ON ?auto_1262432 ?auto_1262430 ) ( not ( = ?auto_1262427 ?auto_1262428 ) ) ( not ( = ?auto_1262427 ?auto_1262429 ) ) ( not ( = ?auto_1262427 ?auto_1262426 ) ) ( not ( = ?auto_1262427 ?auto_1262430 ) ) ( not ( = ?auto_1262427 ?auto_1262432 ) ) ( not ( = ?auto_1262427 ?auto_1262431 ) ) ( not ( = ?auto_1262428 ?auto_1262429 ) ) ( not ( = ?auto_1262428 ?auto_1262426 ) ) ( not ( = ?auto_1262428 ?auto_1262430 ) ) ( not ( = ?auto_1262428 ?auto_1262432 ) ) ( not ( = ?auto_1262428 ?auto_1262431 ) ) ( not ( = ?auto_1262429 ?auto_1262426 ) ) ( not ( = ?auto_1262429 ?auto_1262430 ) ) ( not ( = ?auto_1262429 ?auto_1262432 ) ) ( not ( = ?auto_1262429 ?auto_1262431 ) ) ( not ( = ?auto_1262426 ?auto_1262430 ) ) ( not ( = ?auto_1262426 ?auto_1262432 ) ) ( not ( = ?auto_1262426 ?auto_1262431 ) ) ( not ( = ?auto_1262430 ?auto_1262432 ) ) ( not ( = ?auto_1262430 ?auto_1262431 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1262432 ?auto_1262431 )
      ( MAKE-6CRATE-VERIFY ?auto_1262427 ?auto_1262428 ?auto_1262429 ?auto_1262426 ?auto_1262430 ?auto_1262432 ?auto_1262431 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1262471 - SURFACE
      ?auto_1262472 - SURFACE
      ?auto_1262473 - SURFACE
      ?auto_1262470 - SURFACE
      ?auto_1262474 - SURFACE
      ?auto_1262476 - SURFACE
      ?auto_1262475 - SURFACE
    )
    :vars
    (
      ?auto_1262477 - HOIST
      ?auto_1262478 - PLACE
      ?auto_1262479 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1262477 ?auto_1262478 ) ( SURFACE-AT ?auto_1262476 ?auto_1262478 ) ( CLEAR ?auto_1262476 ) ( IS-CRATE ?auto_1262475 ) ( not ( = ?auto_1262476 ?auto_1262475 ) ) ( TRUCK-AT ?auto_1262479 ?auto_1262478 ) ( AVAILABLE ?auto_1262477 ) ( IN ?auto_1262475 ?auto_1262479 ) ( ON ?auto_1262476 ?auto_1262474 ) ( not ( = ?auto_1262474 ?auto_1262476 ) ) ( not ( = ?auto_1262474 ?auto_1262475 ) ) ( ON ?auto_1262472 ?auto_1262471 ) ( ON ?auto_1262473 ?auto_1262472 ) ( ON ?auto_1262470 ?auto_1262473 ) ( ON ?auto_1262474 ?auto_1262470 ) ( not ( = ?auto_1262471 ?auto_1262472 ) ) ( not ( = ?auto_1262471 ?auto_1262473 ) ) ( not ( = ?auto_1262471 ?auto_1262470 ) ) ( not ( = ?auto_1262471 ?auto_1262474 ) ) ( not ( = ?auto_1262471 ?auto_1262476 ) ) ( not ( = ?auto_1262471 ?auto_1262475 ) ) ( not ( = ?auto_1262472 ?auto_1262473 ) ) ( not ( = ?auto_1262472 ?auto_1262470 ) ) ( not ( = ?auto_1262472 ?auto_1262474 ) ) ( not ( = ?auto_1262472 ?auto_1262476 ) ) ( not ( = ?auto_1262472 ?auto_1262475 ) ) ( not ( = ?auto_1262473 ?auto_1262470 ) ) ( not ( = ?auto_1262473 ?auto_1262474 ) ) ( not ( = ?auto_1262473 ?auto_1262476 ) ) ( not ( = ?auto_1262473 ?auto_1262475 ) ) ( not ( = ?auto_1262470 ?auto_1262474 ) ) ( not ( = ?auto_1262470 ?auto_1262476 ) ) ( not ( = ?auto_1262470 ?auto_1262475 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1262474 ?auto_1262476 ?auto_1262475 )
      ( MAKE-6CRATE-VERIFY ?auto_1262471 ?auto_1262472 ?auto_1262473 ?auto_1262470 ?auto_1262474 ?auto_1262476 ?auto_1262475 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1262522 - SURFACE
      ?auto_1262523 - SURFACE
      ?auto_1262524 - SURFACE
      ?auto_1262521 - SURFACE
      ?auto_1262525 - SURFACE
      ?auto_1262527 - SURFACE
      ?auto_1262526 - SURFACE
    )
    :vars
    (
      ?auto_1262529 - HOIST
      ?auto_1262531 - PLACE
      ?auto_1262528 - TRUCK
      ?auto_1262530 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1262529 ?auto_1262531 ) ( SURFACE-AT ?auto_1262527 ?auto_1262531 ) ( CLEAR ?auto_1262527 ) ( IS-CRATE ?auto_1262526 ) ( not ( = ?auto_1262527 ?auto_1262526 ) ) ( AVAILABLE ?auto_1262529 ) ( IN ?auto_1262526 ?auto_1262528 ) ( ON ?auto_1262527 ?auto_1262525 ) ( not ( = ?auto_1262525 ?auto_1262527 ) ) ( not ( = ?auto_1262525 ?auto_1262526 ) ) ( TRUCK-AT ?auto_1262528 ?auto_1262530 ) ( not ( = ?auto_1262530 ?auto_1262531 ) ) ( ON ?auto_1262523 ?auto_1262522 ) ( ON ?auto_1262524 ?auto_1262523 ) ( ON ?auto_1262521 ?auto_1262524 ) ( ON ?auto_1262525 ?auto_1262521 ) ( not ( = ?auto_1262522 ?auto_1262523 ) ) ( not ( = ?auto_1262522 ?auto_1262524 ) ) ( not ( = ?auto_1262522 ?auto_1262521 ) ) ( not ( = ?auto_1262522 ?auto_1262525 ) ) ( not ( = ?auto_1262522 ?auto_1262527 ) ) ( not ( = ?auto_1262522 ?auto_1262526 ) ) ( not ( = ?auto_1262523 ?auto_1262524 ) ) ( not ( = ?auto_1262523 ?auto_1262521 ) ) ( not ( = ?auto_1262523 ?auto_1262525 ) ) ( not ( = ?auto_1262523 ?auto_1262527 ) ) ( not ( = ?auto_1262523 ?auto_1262526 ) ) ( not ( = ?auto_1262524 ?auto_1262521 ) ) ( not ( = ?auto_1262524 ?auto_1262525 ) ) ( not ( = ?auto_1262524 ?auto_1262527 ) ) ( not ( = ?auto_1262524 ?auto_1262526 ) ) ( not ( = ?auto_1262521 ?auto_1262525 ) ) ( not ( = ?auto_1262521 ?auto_1262527 ) ) ( not ( = ?auto_1262521 ?auto_1262526 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1262525 ?auto_1262527 ?auto_1262526 )
      ( MAKE-6CRATE-VERIFY ?auto_1262522 ?auto_1262523 ?auto_1262524 ?auto_1262521 ?auto_1262525 ?auto_1262527 ?auto_1262526 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1262579 - SURFACE
      ?auto_1262580 - SURFACE
      ?auto_1262581 - SURFACE
      ?auto_1262578 - SURFACE
      ?auto_1262582 - SURFACE
      ?auto_1262584 - SURFACE
      ?auto_1262583 - SURFACE
    )
    :vars
    (
      ?auto_1262589 - HOIST
      ?auto_1262588 - PLACE
      ?auto_1262587 - TRUCK
      ?auto_1262585 - PLACE
      ?auto_1262586 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1262589 ?auto_1262588 ) ( SURFACE-AT ?auto_1262584 ?auto_1262588 ) ( CLEAR ?auto_1262584 ) ( IS-CRATE ?auto_1262583 ) ( not ( = ?auto_1262584 ?auto_1262583 ) ) ( AVAILABLE ?auto_1262589 ) ( ON ?auto_1262584 ?auto_1262582 ) ( not ( = ?auto_1262582 ?auto_1262584 ) ) ( not ( = ?auto_1262582 ?auto_1262583 ) ) ( TRUCK-AT ?auto_1262587 ?auto_1262585 ) ( not ( = ?auto_1262585 ?auto_1262588 ) ) ( HOIST-AT ?auto_1262586 ?auto_1262585 ) ( LIFTING ?auto_1262586 ?auto_1262583 ) ( not ( = ?auto_1262589 ?auto_1262586 ) ) ( ON ?auto_1262580 ?auto_1262579 ) ( ON ?auto_1262581 ?auto_1262580 ) ( ON ?auto_1262578 ?auto_1262581 ) ( ON ?auto_1262582 ?auto_1262578 ) ( not ( = ?auto_1262579 ?auto_1262580 ) ) ( not ( = ?auto_1262579 ?auto_1262581 ) ) ( not ( = ?auto_1262579 ?auto_1262578 ) ) ( not ( = ?auto_1262579 ?auto_1262582 ) ) ( not ( = ?auto_1262579 ?auto_1262584 ) ) ( not ( = ?auto_1262579 ?auto_1262583 ) ) ( not ( = ?auto_1262580 ?auto_1262581 ) ) ( not ( = ?auto_1262580 ?auto_1262578 ) ) ( not ( = ?auto_1262580 ?auto_1262582 ) ) ( not ( = ?auto_1262580 ?auto_1262584 ) ) ( not ( = ?auto_1262580 ?auto_1262583 ) ) ( not ( = ?auto_1262581 ?auto_1262578 ) ) ( not ( = ?auto_1262581 ?auto_1262582 ) ) ( not ( = ?auto_1262581 ?auto_1262584 ) ) ( not ( = ?auto_1262581 ?auto_1262583 ) ) ( not ( = ?auto_1262578 ?auto_1262582 ) ) ( not ( = ?auto_1262578 ?auto_1262584 ) ) ( not ( = ?auto_1262578 ?auto_1262583 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1262582 ?auto_1262584 ?auto_1262583 )
      ( MAKE-6CRATE-VERIFY ?auto_1262579 ?auto_1262580 ?auto_1262581 ?auto_1262578 ?auto_1262582 ?auto_1262584 ?auto_1262583 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1262642 - SURFACE
      ?auto_1262643 - SURFACE
      ?auto_1262644 - SURFACE
      ?auto_1262641 - SURFACE
      ?auto_1262645 - SURFACE
      ?auto_1262647 - SURFACE
      ?auto_1262646 - SURFACE
    )
    :vars
    (
      ?auto_1262653 - HOIST
      ?auto_1262648 - PLACE
      ?auto_1262649 - TRUCK
      ?auto_1262652 - PLACE
      ?auto_1262651 - HOIST
      ?auto_1262650 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1262653 ?auto_1262648 ) ( SURFACE-AT ?auto_1262647 ?auto_1262648 ) ( CLEAR ?auto_1262647 ) ( IS-CRATE ?auto_1262646 ) ( not ( = ?auto_1262647 ?auto_1262646 ) ) ( AVAILABLE ?auto_1262653 ) ( ON ?auto_1262647 ?auto_1262645 ) ( not ( = ?auto_1262645 ?auto_1262647 ) ) ( not ( = ?auto_1262645 ?auto_1262646 ) ) ( TRUCK-AT ?auto_1262649 ?auto_1262652 ) ( not ( = ?auto_1262652 ?auto_1262648 ) ) ( HOIST-AT ?auto_1262651 ?auto_1262652 ) ( not ( = ?auto_1262653 ?auto_1262651 ) ) ( AVAILABLE ?auto_1262651 ) ( SURFACE-AT ?auto_1262646 ?auto_1262652 ) ( ON ?auto_1262646 ?auto_1262650 ) ( CLEAR ?auto_1262646 ) ( not ( = ?auto_1262647 ?auto_1262650 ) ) ( not ( = ?auto_1262646 ?auto_1262650 ) ) ( not ( = ?auto_1262645 ?auto_1262650 ) ) ( ON ?auto_1262643 ?auto_1262642 ) ( ON ?auto_1262644 ?auto_1262643 ) ( ON ?auto_1262641 ?auto_1262644 ) ( ON ?auto_1262645 ?auto_1262641 ) ( not ( = ?auto_1262642 ?auto_1262643 ) ) ( not ( = ?auto_1262642 ?auto_1262644 ) ) ( not ( = ?auto_1262642 ?auto_1262641 ) ) ( not ( = ?auto_1262642 ?auto_1262645 ) ) ( not ( = ?auto_1262642 ?auto_1262647 ) ) ( not ( = ?auto_1262642 ?auto_1262646 ) ) ( not ( = ?auto_1262642 ?auto_1262650 ) ) ( not ( = ?auto_1262643 ?auto_1262644 ) ) ( not ( = ?auto_1262643 ?auto_1262641 ) ) ( not ( = ?auto_1262643 ?auto_1262645 ) ) ( not ( = ?auto_1262643 ?auto_1262647 ) ) ( not ( = ?auto_1262643 ?auto_1262646 ) ) ( not ( = ?auto_1262643 ?auto_1262650 ) ) ( not ( = ?auto_1262644 ?auto_1262641 ) ) ( not ( = ?auto_1262644 ?auto_1262645 ) ) ( not ( = ?auto_1262644 ?auto_1262647 ) ) ( not ( = ?auto_1262644 ?auto_1262646 ) ) ( not ( = ?auto_1262644 ?auto_1262650 ) ) ( not ( = ?auto_1262641 ?auto_1262645 ) ) ( not ( = ?auto_1262641 ?auto_1262647 ) ) ( not ( = ?auto_1262641 ?auto_1262646 ) ) ( not ( = ?auto_1262641 ?auto_1262650 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1262645 ?auto_1262647 ?auto_1262646 )
      ( MAKE-6CRATE-VERIFY ?auto_1262642 ?auto_1262643 ?auto_1262644 ?auto_1262641 ?auto_1262645 ?auto_1262647 ?auto_1262646 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1262706 - SURFACE
      ?auto_1262707 - SURFACE
      ?auto_1262708 - SURFACE
      ?auto_1262705 - SURFACE
      ?auto_1262709 - SURFACE
      ?auto_1262711 - SURFACE
      ?auto_1262710 - SURFACE
    )
    :vars
    (
      ?auto_1262715 - HOIST
      ?auto_1262717 - PLACE
      ?auto_1262713 - PLACE
      ?auto_1262712 - HOIST
      ?auto_1262714 - SURFACE
      ?auto_1262716 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1262715 ?auto_1262717 ) ( SURFACE-AT ?auto_1262711 ?auto_1262717 ) ( CLEAR ?auto_1262711 ) ( IS-CRATE ?auto_1262710 ) ( not ( = ?auto_1262711 ?auto_1262710 ) ) ( AVAILABLE ?auto_1262715 ) ( ON ?auto_1262711 ?auto_1262709 ) ( not ( = ?auto_1262709 ?auto_1262711 ) ) ( not ( = ?auto_1262709 ?auto_1262710 ) ) ( not ( = ?auto_1262713 ?auto_1262717 ) ) ( HOIST-AT ?auto_1262712 ?auto_1262713 ) ( not ( = ?auto_1262715 ?auto_1262712 ) ) ( AVAILABLE ?auto_1262712 ) ( SURFACE-AT ?auto_1262710 ?auto_1262713 ) ( ON ?auto_1262710 ?auto_1262714 ) ( CLEAR ?auto_1262710 ) ( not ( = ?auto_1262711 ?auto_1262714 ) ) ( not ( = ?auto_1262710 ?auto_1262714 ) ) ( not ( = ?auto_1262709 ?auto_1262714 ) ) ( TRUCK-AT ?auto_1262716 ?auto_1262717 ) ( ON ?auto_1262707 ?auto_1262706 ) ( ON ?auto_1262708 ?auto_1262707 ) ( ON ?auto_1262705 ?auto_1262708 ) ( ON ?auto_1262709 ?auto_1262705 ) ( not ( = ?auto_1262706 ?auto_1262707 ) ) ( not ( = ?auto_1262706 ?auto_1262708 ) ) ( not ( = ?auto_1262706 ?auto_1262705 ) ) ( not ( = ?auto_1262706 ?auto_1262709 ) ) ( not ( = ?auto_1262706 ?auto_1262711 ) ) ( not ( = ?auto_1262706 ?auto_1262710 ) ) ( not ( = ?auto_1262706 ?auto_1262714 ) ) ( not ( = ?auto_1262707 ?auto_1262708 ) ) ( not ( = ?auto_1262707 ?auto_1262705 ) ) ( not ( = ?auto_1262707 ?auto_1262709 ) ) ( not ( = ?auto_1262707 ?auto_1262711 ) ) ( not ( = ?auto_1262707 ?auto_1262710 ) ) ( not ( = ?auto_1262707 ?auto_1262714 ) ) ( not ( = ?auto_1262708 ?auto_1262705 ) ) ( not ( = ?auto_1262708 ?auto_1262709 ) ) ( not ( = ?auto_1262708 ?auto_1262711 ) ) ( not ( = ?auto_1262708 ?auto_1262710 ) ) ( not ( = ?auto_1262708 ?auto_1262714 ) ) ( not ( = ?auto_1262705 ?auto_1262709 ) ) ( not ( = ?auto_1262705 ?auto_1262711 ) ) ( not ( = ?auto_1262705 ?auto_1262710 ) ) ( not ( = ?auto_1262705 ?auto_1262714 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1262709 ?auto_1262711 ?auto_1262710 )
      ( MAKE-6CRATE-VERIFY ?auto_1262706 ?auto_1262707 ?auto_1262708 ?auto_1262705 ?auto_1262709 ?auto_1262711 ?auto_1262710 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1262770 - SURFACE
      ?auto_1262771 - SURFACE
      ?auto_1262772 - SURFACE
      ?auto_1262769 - SURFACE
      ?auto_1262773 - SURFACE
      ?auto_1262775 - SURFACE
      ?auto_1262774 - SURFACE
    )
    :vars
    (
      ?auto_1262776 - HOIST
      ?auto_1262779 - PLACE
      ?auto_1262777 - PLACE
      ?auto_1262781 - HOIST
      ?auto_1262780 - SURFACE
      ?auto_1262778 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1262776 ?auto_1262779 ) ( IS-CRATE ?auto_1262774 ) ( not ( = ?auto_1262775 ?auto_1262774 ) ) ( not ( = ?auto_1262773 ?auto_1262775 ) ) ( not ( = ?auto_1262773 ?auto_1262774 ) ) ( not ( = ?auto_1262777 ?auto_1262779 ) ) ( HOIST-AT ?auto_1262781 ?auto_1262777 ) ( not ( = ?auto_1262776 ?auto_1262781 ) ) ( AVAILABLE ?auto_1262781 ) ( SURFACE-AT ?auto_1262774 ?auto_1262777 ) ( ON ?auto_1262774 ?auto_1262780 ) ( CLEAR ?auto_1262774 ) ( not ( = ?auto_1262775 ?auto_1262780 ) ) ( not ( = ?auto_1262774 ?auto_1262780 ) ) ( not ( = ?auto_1262773 ?auto_1262780 ) ) ( TRUCK-AT ?auto_1262778 ?auto_1262779 ) ( SURFACE-AT ?auto_1262773 ?auto_1262779 ) ( CLEAR ?auto_1262773 ) ( LIFTING ?auto_1262776 ?auto_1262775 ) ( IS-CRATE ?auto_1262775 ) ( ON ?auto_1262771 ?auto_1262770 ) ( ON ?auto_1262772 ?auto_1262771 ) ( ON ?auto_1262769 ?auto_1262772 ) ( ON ?auto_1262773 ?auto_1262769 ) ( not ( = ?auto_1262770 ?auto_1262771 ) ) ( not ( = ?auto_1262770 ?auto_1262772 ) ) ( not ( = ?auto_1262770 ?auto_1262769 ) ) ( not ( = ?auto_1262770 ?auto_1262773 ) ) ( not ( = ?auto_1262770 ?auto_1262775 ) ) ( not ( = ?auto_1262770 ?auto_1262774 ) ) ( not ( = ?auto_1262770 ?auto_1262780 ) ) ( not ( = ?auto_1262771 ?auto_1262772 ) ) ( not ( = ?auto_1262771 ?auto_1262769 ) ) ( not ( = ?auto_1262771 ?auto_1262773 ) ) ( not ( = ?auto_1262771 ?auto_1262775 ) ) ( not ( = ?auto_1262771 ?auto_1262774 ) ) ( not ( = ?auto_1262771 ?auto_1262780 ) ) ( not ( = ?auto_1262772 ?auto_1262769 ) ) ( not ( = ?auto_1262772 ?auto_1262773 ) ) ( not ( = ?auto_1262772 ?auto_1262775 ) ) ( not ( = ?auto_1262772 ?auto_1262774 ) ) ( not ( = ?auto_1262772 ?auto_1262780 ) ) ( not ( = ?auto_1262769 ?auto_1262773 ) ) ( not ( = ?auto_1262769 ?auto_1262775 ) ) ( not ( = ?auto_1262769 ?auto_1262774 ) ) ( not ( = ?auto_1262769 ?auto_1262780 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1262773 ?auto_1262775 ?auto_1262774 )
      ( MAKE-6CRATE-VERIFY ?auto_1262770 ?auto_1262771 ?auto_1262772 ?auto_1262769 ?auto_1262773 ?auto_1262775 ?auto_1262774 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1262834 - SURFACE
      ?auto_1262835 - SURFACE
      ?auto_1262836 - SURFACE
      ?auto_1262833 - SURFACE
      ?auto_1262837 - SURFACE
      ?auto_1262839 - SURFACE
      ?auto_1262838 - SURFACE
    )
    :vars
    (
      ?auto_1262840 - HOIST
      ?auto_1262843 - PLACE
      ?auto_1262844 - PLACE
      ?auto_1262845 - HOIST
      ?auto_1262842 - SURFACE
      ?auto_1262841 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1262840 ?auto_1262843 ) ( IS-CRATE ?auto_1262838 ) ( not ( = ?auto_1262839 ?auto_1262838 ) ) ( not ( = ?auto_1262837 ?auto_1262839 ) ) ( not ( = ?auto_1262837 ?auto_1262838 ) ) ( not ( = ?auto_1262844 ?auto_1262843 ) ) ( HOIST-AT ?auto_1262845 ?auto_1262844 ) ( not ( = ?auto_1262840 ?auto_1262845 ) ) ( AVAILABLE ?auto_1262845 ) ( SURFACE-AT ?auto_1262838 ?auto_1262844 ) ( ON ?auto_1262838 ?auto_1262842 ) ( CLEAR ?auto_1262838 ) ( not ( = ?auto_1262839 ?auto_1262842 ) ) ( not ( = ?auto_1262838 ?auto_1262842 ) ) ( not ( = ?auto_1262837 ?auto_1262842 ) ) ( TRUCK-AT ?auto_1262841 ?auto_1262843 ) ( SURFACE-AT ?auto_1262837 ?auto_1262843 ) ( CLEAR ?auto_1262837 ) ( IS-CRATE ?auto_1262839 ) ( AVAILABLE ?auto_1262840 ) ( IN ?auto_1262839 ?auto_1262841 ) ( ON ?auto_1262835 ?auto_1262834 ) ( ON ?auto_1262836 ?auto_1262835 ) ( ON ?auto_1262833 ?auto_1262836 ) ( ON ?auto_1262837 ?auto_1262833 ) ( not ( = ?auto_1262834 ?auto_1262835 ) ) ( not ( = ?auto_1262834 ?auto_1262836 ) ) ( not ( = ?auto_1262834 ?auto_1262833 ) ) ( not ( = ?auto_1262834 ?auto_1262837 ) ) ( not ( = ?auto_1262834 ?auto_1262839 ) ) ( not ( = ?auto_1262834 ?auto_1262838 ) ) ( not ( = ?auto_1262834 ?auto_1262842 ) ) ( not ( = ?auto_1262835 ?auto_1262836 ) ) ( not ( = ?auto_1262835 ?auto_1262833 ) ) ( not ( = ?auto_1262835 ?auto_1262837 ) ) ( not ( = ?auto_1262835 ?auto_1262839 ) ) ( not ( = ?auto_1262835 ?auto_1262838 ) ) ( not ( = ?auto_1262835 ?auto_1262842 ) ) ( not ( = ?auto_1262836 ?auto_1262833 ) ) ( not ( = ?auto_1262836 ?auto_1262837 ) ) ( not ( = ?auto_1262836 ?auto_1262839 ) ) ( not ( = ?auto_1262836 ?auto_1262838 ) ) ( not ( = ?auto_1262836 ?auto_1262842 ) ) ( not ( = ?auto_1262833 ?auto_1262837 ) ) ( not ( = ?auto_1262833 ?auto_1262839 ) ) ( not ( = ?auto_1262833 ?auto_1262838 ) ) ( not ( = ?auto_1262833 ?auto_1262842 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1262837 ?auto_1262839 ?auto_1262838 )
      ( MAKE-6CRATE-VERIFY ?auto_1262834 ?auto_1262835 ?auto_1262836 ?auto_1262833 ?auto_1262837 ?auto_1262839 ?auto_1262838 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1264790 - SURFACE
      ?auto_1264791 - SURFACE
      ?auto_1264792 - SURFACE
      ?auto_1264789 - SURFACE
      ?auto_1264793 - SURFACE
      ?auto_1264795 - SURFACE
      ?auto_1264794 - SURFACE
      ?auto_1264796 - SURFACE
    )
    :vars
    (
      ?auto_1264797 - HOIST
      ?auto_1264798 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1264797 ?auto_1264798 ) ( SURFACE-AT ?auto_1264794 ?auto_1264798 ) ( CLEAR ?auto_1264794 ) ( LIFTING ?auto_1264797 ?auto_1264796 ) ( IS-CRATE ?auto_1264796 ) ( not ( = ?auto_1264794 ?auto_1264796 ) ) ( ON ?auto_1264791 ?auto_1264790 ) ( ON ?auto_1264792 ?auto_1264791 ) ( ON ?auto_1264789 ?auto_1264792 ) ( ON ?auto_1264793 ?auto_1264789 ) ( ON ?auto_1264795 ?auto_1264793 ) ( ON ?auto_1264794 ?auto_1264795 ) ( not ( = ?auto_1264790 ?auto_1264791 ) ) ( not ( = ?auto_1264790 ?auto_1264792 ) ) ( not ( = ?auto_1264790 ?auto_1264789 ) ) ( not ( = ?auto_1264790 ?auto_1264793 ) ) ( not ( = ?auto_1264790 ?auto_1264795 ) ) ( not ( = ?auto_1264790 ?auto_1264794 ) ) ( not ( = ?auto_1264790 ?auto_1264796 ) ) ( not ( = ?auto_1264791 ?auto_1264792 ) ) ( not ( = ?auto_1264791 ?auto_1264789 ) ) ( not ( = ?auto_1264791 ?auto_1264793 ) ) ( not ( = ?auto_1264791 ?auto_1264795 ) ) ( not ( = ?auto_1264791 ?auto_1264794 ) ) ( not ( = ?auto_1264791 ?auto_1264796 ) ) ( not ( = ?auto_1264792 ?auto_1264789 ) ) ( not ( = ?auto_1264792 ?auto_1264793 ) ) ( not ( = ?auto_1264792 ?auto_1264795 ) ) ( not ( = ?auto_1264792 ?auto_1264794 ) ) ( not ( = ?auto_1264792 ?auto_1264796 ) ) ( not ( = ?auto_1264789 ?auto_1264793 ) ) ( not ( = ?auto_1264789 ?auto_1264795 ) ) ( not ( = ?auto_1264789 ?auto_1264794 ) ) ( not ( = ?auto_1264789 ?auto_1264796 ) ) ( not ( = ?auto_1264793 ?auto_1264795 ) ) ( not ( = ?auto_1264793 ?auto_1264794 ) ) ( not ( = ?auto_1264793 ?auto_1264796 ) ) ( not ( = ?auto_1264795 ?auto_1264794 ) ) ( not ( = ?auto_1264795 ?auto_1264796 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1264794 ?auto_1264796 )
      ( MAKE-7CRATE-VERIFY ?auto_1264790 ?auto_1264791 ?auto_1264792 ?auto_1264789 ?auto_1264793 ?auto_1264795 ?auto_1264794 ?auto_1264796 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1264845 - SURFACE
      ?auto_1264846 - SURFACE
      ?auto_1264847 - SURFACE
      ?auto_1264844 - SURFACE
      ?auto_1264848 - SURFACE
      ?auto_1264850 - SURFACE
      ?auto_1264849 - SURFACE
      ?auto_1264851 - SURFACE
    )
    :vars
    (
      ?auto_1264852 - HOIST
      ?auto_1264853 - PLACE
      ?auto_1264854 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1264852 ?auto_1264853 ) ( SURFACE-AT ?auto_1264849 ?auto_1264853 ) ( CLEAR ?auto_1264849 ) ( IS-CRATE ?auto_1264851 ) ( not ( = ?auto_1264849 ?auto_1264851 ) ) ( TRUCK-AT ?auto_1264854 ?auto_1264853 ) ( AVAILABLE ?auto_1264852 ) ( IN ?auto_1264851 ?auto_1264854 ) ( ON ?auto_1264849 ?auto_1264850 ) ( not ( = ?auto_1264850 ?auto_1264849 ) ) ( not ( = ?auto_1264850 ?auto_1264851 ) ) ( ON ?auto_1264846 ?auto_1264845 ) ( ON ?auto_1264847 ?auto_1264846 ) ( ON ?auto_1264844 ?auto_1264847 ) ( ON ?auto_1264848 ?auto_1264844 ) ( ON ?auto_1264850 ?auto_1264848 ) ( not ( = ?auto_1264845 ?auto_1264846 ) ) ( not ( = ?auto_1264845 ?auto_1264847 ) ) ( not ( = ?auto_1264845 ?auto_1264844 ) ) ( not ( = ?auto_1264845 ?auto_1264848 ) ) ( not ( = ?auto_1264845 ?auto_1264850 ) ) ( not ( = ?auto_1264845 ?auto_1264849 ) ) ( not ( = ?auto_1264845 ?auto_1264851 ) ) ( not ( = ?auto_1264846 ?auto_1264847 ) ) ( not ( = ?auto_1264846 ?auto_1264844 ) ) ( not ( = ?auto_1264846 ?auto_1264848 ) ) ( not ( = ?auto_1264846 ?auto_1264850 ) ) ( not ( = ?auto_1264846 ?auto_1264849 ) ) ( not ( = ?auto_1264846 ?auto_1264851 ) ) ( not ( = ?auto_1264847 ?auto_1264844 ) ) ( not ( = ?auto_1264847 ?auto_1264848 ) ) ( not ( = ?auto_1264847 ?auto_1264850 ) ) ( not ( = ?auto_1264847 ?auto_1264849 ) ) ( not ( = ?auto_1264847 ?auto_1264851 ) ) ( not ( = ?auto_1264844 ?auto_1264848 ) ) ( not ( = ?auto_1264844 ?auto_1264850 ) ) ( not ( = ?auto_1264844 ?auto_1264849 ) ) ( not ( = ?auto_1264844 ?auto_1264851 ) ) ( not ( = ?auto_1264848 ?auto_1264850 ) ) ( not ( = ?auto_1264848 ?auto_1264849 ) ) ( not ( = ?auto_1264848 ?auto_1264851 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1264850 ?auto_1264849 ?auto_1264851 )
      ( MAKE-7CRATE-VERIFY ?auto_1264845 ?auto_1264846 ?auto_1264847 ?auto_1264844 ?auto_1264848 ?auto_1264850 ?auto_1264849 ?auto_1264851 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1264908 - SURFACE
      ?auto_1264909 - SURFACE
      ?auto_1264910 - SURFACE
      ?auto_1264907 - SURFACE
      ?auto_1264911 - SURFACE
      ?auto_1264913 - SURFACE
      ?auto_1264912 - SURFACE
      ?auto_1264914 - SURFACE
    )
    :vars
    (
      ?auto_1264918 - HOIST
      ?auto_1264915 - PLACE
      ?auto_1264917 - TRUCK
      ?auto_1264916 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1264918 ?auto_1264915 ) ( SURFACE-AT ?auto_1264912 ?auto_1264915 ) ( CLEAR ?auto_1264912 ) ( IS-CRATE ?auto_1264914 ) ( not ( = ?auto_1264912 ?auto_1264914 ) ) ( AVAILABLE ?auto_1264918 ) ( IN ?auto_1264914 ?auto_1264917 ) ( ON ?auto_1264912 ?auto_1264913 ) ( not ( = ?auto_1264913 ?auto_1264912 ) ) ( not ( = ?auto_1264913 ?auto_1264914 ) ) ( TRUCK-AT ?auto_1264917 ?auto_1264916 ) ( not ( = ?auto_1264916 ?auto_1264915 ) ) ( ON ?auto_1264909 ?auto_1264908 ) ( ON ?auto_1264910 ?auto_1264909 ) ( ON ?auto_1264907 ?auto_1264910 ) ( ON ?auto_1264911 ?auto_1264907 ) ( ON ?auto_1264913 ?auto_1264911 ) ( not ( = ?auto_1264908 ?auto_1264909 ) ) ( not ( = ?auto_1264908 ?auto_1264910 ) ) ( not ( = ?auto_1264908 ?auto_1264907 ) ) ( not ( = ?auto_1264908 ?auto_1264911 ) ) ( not ( = ?auto_1264908 ?auto_1264913 ) ) ( not ( = ?auto_1264908 ?auto_1264912 ) ) ( not ( = ?auto_1264908 ?auto_1264914 ) ) ( not ( = ?auto_1264909 ?auto_1264910 ) ) ( not ( = ?auto_1264909 ?auto_1264907 ) ) ( not ( = ?auto_1264909 ?auto_1264911 ) ) ( not ( = ?auto_1264909 ?auto_1264913 ) ) ( not ( = ?auto_1264909 ?auto_1264912 ) ) ( not ( = ?auto_1264909 ?auto_1264914 ) ) ( not ( = ?auto_1264910 ?auto_1264907 ) ) ( not ( = ?auto_1264910 ?auto_1264911 ) ) ( not ( = ?auto_1264910 ?auto_1264913 ) ) ( not ( = ?auto_1264910 ?auto_1264912 ) ) ( not ( = ?auto_1264910 ?auto_1264914 ) ) ( not ( = ?auto_1264907 ?auto_1264911 ) ) ( not ( = ?auto_1264907 ?auto_1264913 ) ) ( not ( = ?auto_1264907 ?auto_1264912 ) ) ( not ( = ?auto_1264907 ?auto_1264914 ) ) ( not ( = ?auto_1264911 ?auto_1264913 ) ) ( not ( = ?auto_1264911 ?auto_1264912 ) ) ( not ( = ?auto_1264911 ?auto_1264914 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1264913 ?auto_1264912 ?auto_1264914 )
      ( MAKE-7CRATE-VERIFY ?auto_1264908 ?auto_1264909 ?auto_1264910 ?auto_1264907 ?auto_1264911 ?auto_1264913 ?auto_1264912 ?auto_1264914 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1264978 - SURFACE
      ?auto_1264979 - SURFACE
      ?auto_1264980 - SURFACE
      ?auto_1264977 - SURFACE
      ?auto_1264981 - SURFACE
      ?auto_1264983 - SURFACE
      ?auto_1264982 - SURFACE
      ?auto_1264984 - SURFACE
    )
    :vars
    (
      ?auto_1264988 - HOIST
      ?auto_1264989 - PLACE
      ?auto_1264985 - TRUCK
      ?auto_1264987 - PLACE
      ?auto_1264986 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1264988 ?auto_1264989 ) ( SURFACE-AT ?auto_1264982 ?auto_1264989 ) ( CLEAR ?auto_1264982 ) ( IS-CRATE ?auto_1264984 ) ( not ( = ?auto_1264982 ?auto_1264984 ) ) ( AVAILABLE ?auto_1264988 ) ( ON ?auto_1264982 ?auto_1264983 ) ( not ( = ?auto_1264983 ?auto_1264982 ) ) ( not ( = ?auto_1264983 ?auto_1264984 ) ) ( TRUCK-AT ?auto_1264985 ?auto_1264987 ) ( not ( = ?auto_1264987 ?auto_1264989 ) ) ( HOIST-AT ?auto_1264986 ?auto_1264987 ) ( LIFTING ?auto_1264986 ?auto_1264984 ) ( not ( = ?auto_1264988 ?auto_1264986 ) ) ( ON ?auto_1264979 ?auto_1264978 ) ( ON ?auto_1264980 ?auto_1264979 ) ( ON ?auto_1264977 ?auto_1264980 ) ( ON ?auto_1264981 ?auto_1264977 ) ( ON ?auto_1264983 ?auto_1264981 ) ( not ( = ?auto_1264978 ?auto_1264979 ) ) ( not ( = ?auto_1264978 ?auto_1264980 ) ) ( not ( = ?auto_1264978 ?auto_1264977 ) ) ( not ( = ?auto_1264978 ?auto_1264981 ) ) ( not ( = ?auto_1264978 ?auto_1264983 ) ) ( not ( = ?auto_1264978 ?auto_1264982 ) ) ( not ( = ?auto_1264978 ?auto_1264984 ) ) ( not ( = ?auto_1264979 ?auto_1264980 ) ) ( not ( = ?auto_1264979 ?auto_1264977 ) ) ( not ( = ?auto_1264979 ?auto_1264981 ) ) ( not ( = ?auto_1264979 ?auto_1264983 ) ) ( not ( = ?auto_1264979 ?auto_1264982 ) ) ( not ( = ?auto_1264979 ?auto_1264984 ) ) ( not ( = ?auto_1264980 ?auto_1264977 ) ) ( not ( = ?auto_1264980 ?auto_1264981 ) ) ( not ( = ?auto_1264980 ?auto_1264983 ) ) ( not ( = ?auto_1264980 ?auto_1264982 ) ) ( not ( = ?auto_1264980 ?auto_1264984 ) ) ( not ( = ?auto_1264977 ?auto_1264981 ) ) ( not ( = ?auto_1264977 ?auto_1264983 ) ) ( not ( = ?auto_1264977 ?auto_1264982 ) ) ( not ( = ?auto_1264977 ?auto_1264984 ) ) ( not ( = ?auto_1264981 ?auto_1264983 ) ) ( not ( = ?auto_1264981 ?auto_1264982 ) ) ( not ( = ?auto_1264981 ?auto_1264984 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1264983 ?auto_1264982 ?auto_1264984 )
      ( MAKE-7CRATE-VERIFY ?auto_1264978 ?auto_1264979 ?auto_1264980 ?auto_1264977 ?auto_1264981 ?auto_1264983 ?auto_1264982 ?auto_1264984 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1265055 - SURFACE
      ?auto_1265056 - SURFACE
      ?auto_1265057 - SURFACE
      ?auto_1265054 - SURFACE
      ?auto_1265058 - SURFACE
      ?auto_1265060 - SURFACE
      ?auto_1265059 - SURFACE
      ?auto_1265061 - SURFACE
    )
    :vars
    (
      ?auto_1265066 - HOIST
      ?auto_1265067 - PLACE
      ?auto_1265064 - TRUCK
      ?auto_1265065 - PLACE
      ?auto_1265062 - HOIST
      ?auto_1265063 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1265066 ?auto_1265067 ) ( SURFACE-AT ?auto_1265059 ?auto_1265067 ) ( CLEAR ?auto_1265059 ) ( IS-CRATE ?auto_1265061 ) ( not ( = ?auto_1265059 ?auto_1265061 ) ) ( AVAILABLE ?auto_1265066 ) ( ON ?auto_1265059 ?auto_1265060 ) ( not ( = ?auto_1265060 ?auto_1265059 ) ) ( not ( = ?auto_1265060 ?auto_1265061 ) ) ( TRUCK-AT ?auto_1265064 ?auto_1265065 ) ( not ( = ?auto_1265065 ?auto_1265067 ) ) ( HOIST-AT ?auto_1265062 ?auto_1265065 ) ( not ( = ?auto_1265066 ?auto_1265062 ) ) ( AVAILABLE ?auto_1265062 ) ( SURFACE-AT ?auto_1265061 ?auto_1265065 ) ( ON ?auto_1265061 ?auto_1265063 ) ( CLEAR ?auto_1265061 ) ( not ( = ?auto_1265059 ?auto_1265063 ) ) ( not ( = ?auto_1265061 ?auto_1265063 ) ) ( not ( = ?auto_1265060 ?auto_1265063 ) ) ( ON ?auto_1265056 ?auto_1265055 ) ( ON ?auto_1265057 ?auto_1265056 ) ( ON ?auto_1265054 ?auto_1265057 ) ( ON ?auto_1265058 ?auto_1265054 ) ( ON ?auto_1265060 ?auto_1265058 ) ( not ( = ?auto_1265055 ?auto_1265056 ) ) ( not ( = ?auto_1265055 ?auto_1265057 ) ) ( not ( = ?auto_1265055 ?auto_1265054 ) ) ( not ( = ?auto_1265055 ?auto_1265058 ) ) ( not ( = ?auto_1265055 ?auto_1265060 ) ) ( not ( = ?auto_1265055 ?auto_1265059 ) ) ( not ( = ?auto_1265055 ?auto_1265061 ) ) ( not ( = ?auto_1265055 ?auto_1265063 ) ) ( not ( = ?auto_1265056 ?auto_1265057 ) ) ( not ( = ?auto_1265056 ?auto_1265054 ) ) ( not ( = ?auto_1265056 ?auto_1265058 ) ) ( not ( = ?auto_1265056 ?auto_1265060 ) ) ( not ( = ?auto_1265056 ?auto_1265059 ) ) ( not ( = ?auto_1265056 ?auto_1265061 ) ) ( not ( = ?auto_1265056 ?auto_1265063 ) ) ( not ( = ?auto_1265057 ?auto_1265054 ) ) ( not ( = ?auto_1265057 ?auto_1265058 ) ) ( not ( = ?auto_1265057 ?auto_1265060 ) ) ( not ( = ?auto_1265057 ?auto_1265059 ) ) ( not ( = ?auto_1265057 ?auto_1265061 ) ) ( not ( = ?auto_1265057 ?auto_1265063 ) ) ( not ( = ?auto_1265054 ?auto_1265058 ) ) ( not ( = ?auto_1265054 ?auto_1265060 ) ) ( not ( = ?auto_1265054 ?auto_1265059 ) ) ( not ( = ?auto_1265054 ?auto_1265061 ) ) ( not ( = ?auto_1265054 ?auto_1265063 ) ) ( not ( = ?auto_1265058 ?auto_1265060 ) ) ( not ( = ?auto_1265058 ?auto_1265059 ) ) ( not ( = ?auto_1265058 ?auto_1265061 ) ) ( not ( = ?auto_1265058 ?auto_1265063 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1265060 ?auto_1265059 ?auto_1265061 )
      ( MAKE-7CRATE-VERIFY ?auto_1265055 ?auto_1265056 ?auto_1265057 ?auto_1265054 ?auto_1265058 ?auto_1265060 ?auto_1265059 ?auto_1265061 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1265133 - SURFACE
      ?auto_1265134 - SURFACE
      ?auto_1265135 - SURFACE
      ?auto_1265132 - SURFACE
      ?auto_1265136 - SURFACE
      ?auto_1265138 - SURFACE
      ?auto_1265137 - SURFACE
      ?auto_1265139 - SURFACE
    )
    :vars
    (
      ?auto_1265142 - HOIST
      ?auto_1265141 - PLACE
      ?auto_1265143 - PLACE
      ?auto_1265144 - HOIST
      ?auto_1265140 - SURFACE
      ?auto_1265145 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1265142 ?auto_1265141 ) ( SURFACE-AT ?auto_1265137 ?auto_1265141 ) ( CLEAR ?auto_1265137 ) ( IS-CRATE ?auto_1265139 ) ( not ( = ?auto_1265137 ?auto_1265139 ) ) ( AVAILABLE ?auto_1265142 ) ( ON ?auto_1265137 ?auto_1265138 ) ( not ( = ?auto_1265138 ?auto_1265137 ) ) ( not ( = ?auto_1265138 ?auto_1265139 ) ) ( not ( = ?auto_1265143 ?auto_1265141 ) ) ( HOIST-AT ?auto_1265144 ?auto_1265143 ) ( not ( = ?auto_1265142 ?auto_1265144 ) ) ( AVAILABLE ?auto_1265144 ) ( SURFACE-AT ?auto_1265139 ?auto_1265143 ) ( ON ?auto_1265139 ?auto_1265140 ) ( CLEAR ?auto_1265139 ) ( not ( = ?auto_1265137 ?auto_1265140 ) ) ( not ( = ?auto_1265139 ?auto_1265140 ) ) ( not ( = ?auto_1265138 ?auto_1265140 ) ) ( TRUCK-AT ?auto_1265145 ?auto_1265141 ) ( ON ?auto_1265134 ?auto_1265133 ) ( ON ?auto_1265135 ?auto_1265134 ) ( ON ?auto_1265132 ?auto_1265135 ) ( ON ?auto_1265136 ?auto_1265132 ) ( ON ?auto_1265138 ?auto_1265136 ) ( not ( = ?auto_1265133 ?auto_1265134 ) ) ( not ( = ?auto_1265133 ?auto_1265135 ) ) ( not ( = ?auto_1265133 ?auto_1265132 ) ) ( not ( = ?auto_1265133 ?auto_1265136 ) ) ( not ( = ?auto_1265133 ?auto_1265138 ) ) ( not ( = ?auto_1265133 ?auto_1265137 ) ) ( not ( = ?auto_1265133 ?auto_1265139 ) ) ( not ( = ?auto_1265133 ?auto_1265140 ) ) ( not ( = ?auto_1265134 ?auto_1265135 ) ) ( not ( = ?auto_1265134 ?auto_1265132 ) ) ( not ( = ?auto_1265134 ?auto_1265136 ) ) ( not ( = ?auto_1265134 ?auto_1265138 ) ) ( not ( = ?auto_1265134 ?auto_1265137 ) ) ( not ( = ?auto_1265134 ?auto_1265139 ) ) ( not ( = ?auto_1265134 ?auto_1265140 ) ) ( not ( = ?auto_1265135 ?auto_1265132 ) ) ( not ( = ?auto_1265135 ?auto_1265136 ) ) ( not ( = ?auto_1265135 ?auto_1265138 ) ) ( not ( = ?auto_1265135 ?auto_1265137 ) ) ( not ( = ?auto_1265135 ?auto_1265139 ) ) ( not ( = ?auto_1265135 ?auto_1265140 ) ) ( not ( = ?auto_1265132 ?auto_1265136 ) ) ( not ( = ?auto_1265132 ?auto_1265138 ) ) ( not ( = ?auto_1265132 ?auto_1265137 ) ) ( not ( = ?auto_1265132 ?auto_1265139 ) ) ( not ( = ?auto_1265132 ?auto_1265140 ) ) ( not ( = ?auto_1265136 ?auto_1265138 ) ) ( not ( = ?auto_1265136 ?auto_1265137 ) ) ( not ( = ?auto_1265136 ?auto_1265139 ) ) ( not ( = ?auto_1265136 ?auto_1265140 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1265138 ?auto_1265137 ?auto_1265139 )
      ( MAKE-7CRATE-VERIFY ?auto_1265133 ?auto_1265134 ?auto_1265135 ?auto_1265132 ?auto_1265136 ?auto_1265138 ?auto_1265137 ?auto_1265139 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1265211 - SURFACE
      ?auto_1265212 - SURFACE
      ?auto_1265213 - SURFACE
      ?auto_1265210 - SURFACE
      ?auto_1265214 - SURFACE
      ?auto_1265216 - SURFACE
      ?auto_1265215 - SURFACE
      ?auto_1265217 - SURFACE
    )
    :vars
    (
      ?auto_1265221 - HOIST
      ?auto_1265219 - PLACE
      ?auto_1265223 - PLACE
      ?auto_1265218 - HOIST
      ?auto_1265220 - SURFACE
      ?auto_1265222 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1265221 ?auto_1265219 ) ( IS-CRATE ?auto_1265217 ) ( not ( = ?auto_1265215 ?auto_1265217 ) ) ( not ( = ?auto_1265216 ?auto_1265215 ) ) ( not ( = ?auto_1265216 ?auto_1265217 ) ) ( not ( = ?auto_1265223 ?auto_1265219 ) ) ( HOIST-AT ?auto_1265218 ?auto_1265223 ) ( not ( = ?auto_1265221 ?auto_1265218 ) ) ( AVAILABLE ?auto_1265218 ) ( SURFACE-AT ?auto_1265217 ?auto_1265223 ) ( ON ?auto_1265217 ?auto_1265220 ) ( CLEAR ?auto_1265217 ) ( not ( = ?auto_1265215 ?auto_1265220 ) ) ( not ( = ?auto_1265217 ?auto_1265220 ) ) ( not ( = ?auto_1265216 ?auto_1265220 ) ) ( TRUCK-AT ?auto_1265222 ?auto_1265219 ) ( SURFACE-AT ?auto_1265216 ?auto_1265219 ) ( CLEAR ?auto_1265216 ) ( LIFTING ?auto_1265221 ?auto_1265215 ) ( IS-CRATE ?auto_1265215 ) ( ON ?auto_1265212 ?auto_1265211 ) ( ON ?auto_1265213 ?auto_1265212 ) ( ON ?auto_1265210 ?auto_1265213 ) ( ON ?auto_1265214 ?auto_1265210 ) ( ON ?auto_1265216 ?auto_1265214 ) ( not ( = ?auto_1265211 ?auto_1265212 ) ) ( not ( = ?auto_1265211 ?auto_1265213 ) ) ( not ( = ?auto_1265211 ?auto_1265210 ) ) ( not ( = ?auto_1265211 ?auto_1265214 ) ) ( not ( = ?auto_1265211 ?auto_1265216 ) ) ( not ( = ?auto_1265211 ?auto_1265215 ) ) ( not ( = ?auto_1265211 ?auto_1265217 ) ) ( not ( = ?auto_1265211 ?auto_1265220 ) ) ( not ( = ?auto_1265212 ?auto_1265213 ) ) ( not ( = ?auto_1265212 ?auto_1265210 ) ) ( not ( = ?auto_1265212 ?auto_1265214 ) ) ( not ( = ?auto_1265212 ?auto_1265216 ) ) ( not ( = ?auto_1265212 ?auto_1265215 ) ) ( not ( = ?auto_1265212 ?auto_1265217 ) ) ( not ( = ?auto_1265212 ?auto_1265220 ) ) ( not ( = ?auto_1265213 ?auto_1265210 ) ) ( not ( = ?auto_1265213 ?auto_1265214 ) ) ( not ( = ?auto_1265213 ?auto_1265216 ) ) ( not ( = ?auto_1265213 ?auto_1265215 ) ) ( not ( = ?auto_1265213 ?auto_1265217 ) ) ( not ( = ?auto_1265213 ?auto_1265220 ) ) ( not ( = ?auto_1265210 ?auto_1265214 ) ) ( not ( = ?auto_1265210 ?auto_1265216 ) ) ( not ( = ?auto_1265210 ?auto_1265215 ) ) ( not ( = ?auto_1265210 ?auto_1265217 ) ) ( not ( = ?auto_1265210 ?auto_1265220 ) ) ( not ( = ?auto_1265214 ?auto_1265216 ) ) ( not ( = ?auto_1265214 ?auto_1265215 ) ) ( not ( = ?auto_1265214 ?auto_1265217 ) ) ( not ( = ?auto_1265214 ?auto_1265220 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1265216 ?auto_1265215 ?auto_1265217 )
      ( MAKE-7CRATE-VERIFY ?auto_1265211 ?auto_1265212 ?auto_1265213 ?auto_1265210 ?auto_1265214 ?auto_1265216 ?auto_1265215 ?auto_1265217 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1265289 - SURFACE
      ?auto_1265290 - SURFACE
      ?auto_1265291 - SURFACE
      ?auto_1265288 - SURFACE
      ?auto_1265292 - SURFACE
      ?auto_1265294 - SURFACE
      ?auto_1265293 - SURFACE
      ?auto_1265295 - SURFACE
    )
    :vars
    (
      ?auto_1265299 - HOIST
      ?auto_1265296 - PLACE
      ?auto_1265297 - PLACE
      ?auto_1265300 - HOIST
      ?auto_1265298 - SURFACE
      ?auto_1265301 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1265299 ?auto_1265296 ) ( IS-CRATE ?auto_1265295 ) ( not ( = ?auto_1265293 ?auto_1265295 ) ) ( not ( = ?auto_1265294 ?auto_1265293 ) ) ( not ( = ?auto_1265294 ?auto_1265295 ) ) ( not ( = ?auto_1265297 ?auto_1265296 ) ) ( HOIST-AT ?auto_1265300 ?auto_1265297 ) ( not ( = ?auto_1265299 ?auto_1265300 ) ) ( AVAILABLE ?auto_1265300 ) ( SURFACE-AT ?auto_1265295 ?auto_1265297 ) ( ON ?auto_1265295 ?auto_1265298 ) ( CLEAR ?auto_1265295 ) ( not ( = ?auto_1265293 ?auto_1265298 ) ) ( not ( = ?auto_1265295 ?auto_1265298 ) ) ( not ( = ?auto_1265294 ?auto_1265298 ) ) ( TRUCK-AT ?auto_1265301 ?auto_1265296 ) ( SURFACE-AT ?auto_1265294 ?auto_1265296 ) ( CLEAR ?auto_1265294 ) ( IS-CRATE ?auto_1265293 ) ( AVAILABLE ?auto_1265299 ) ( IN ?auto_1265293 ?auto_1265301 ) ( ON ?auto_1265290 ?auto_1265289 ) ( ON ?auto_1265291 ?auto_1265290 ) ( ON ?auto_1265288 ?auto_1265291 ) ( ON ?auto_1265292 ?auto_1265288 ) ( ON ?auto_1265294 ?auto_1265292 ) ( not ( = ?auto_1265289 ?auto_1265290 ) ) ( not ( = ?auto_1265289 ?auto_1265291 ) ) ( not ( = ?auto_1265289 ?auto_1265288 ) ) ( not ( = ?auto_1265289 ?auto_1265292 ) ) ( not ( = ?auto_1265289 ?auto_1265294 ) ) ( not ( = ?auto_1265289 ?auto_1265293 ) ) ( not ( = ?auto_1265289 ?auto_1265295 ) ) ( not ( = ?auto_1265289 ?auto_1265298 ) ) ( not ( = ?auto_1265290 ?auto_1265291 ) ) ( not ( = ?auto_1265290 ?auto_1265288 ) ) ( not ( = ?auto_1265290 ?auto_1265292 ) ) ( not ( = ?auto_1265290 ?auto_1265294 ) ) ( not ( = ?auto_1265290 ?auto_1265293 ) ) ( not ( = ?auto_1265290 ?auto_1265295 ) ) ( not ( = ?auto_1265290 ?auto_1265298 ) ) ( not ( = ?auto_1265291 ?auto_1265288 ) ) ( not ( = ?auto_1265291 ?auto_1265292 ) ) ( not ( = ?auto_1265291 ?auto_1265294 ) ) ( not ( = ?auto_1265291 ?auto_1265293 ) ) ( not ( = ?auto_1265291 ?auto_1265295 ) ) ( not ( = ?auto_1265291 ?auto_1265298 ) ) ( not ( = ?auto_1265288 ?auto_1265292 ) ) ( not ( = ?auto_1265288 ?auto_1265294 ) ) ( not ( = ?auto_1265288 ?auto_1265293 ) ) ( not ( = ?auto_1265288 ?auto_1265295 ) ) ( not ( = ?auto_1265288 ?auto_1265298 ) ) ( not ( = ?auto_1265292 ?auto_1265294 ) ) ( not ( = ?auto_1265292 ?auto_1265293 ) ) ( not ( = ?auto_1265292 ?auto_1265295 ) ) ( not ( = ?auto_1265292 ?auto_1265298 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1265294 ?auto_1265293 ?auto_1265295 )
      ( MAKE-7CRATE-VERIFY ?auto_1265289 ?auto_1265290 ?auto_1265291 ?auto_1265288 ?auto_1265292 ?auto_1265294 ?auto_1265293 ?auto_1265295 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1268208 - SURFACE
      ?auto_1268209 - SURFACE
      ?auto_1268210 - SURFACE
      ?auto_1268207 - SURFACE
      ?auto_1268211 - SURFACE
      ?auto_1268213 - SURFACE
      ?auto_1268212 - SURFACE
      ?auto_1268214 - SURFACE
      ?auto_1268215 - SURFACE
    )
    :vars
    (
      ?auto_1268217 - HOIST
      ?auto_1268216 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1268217 ?auto_1268216 ) ( SURFACE-AT ?auto_1268214 ?auto_1268216 ) ( CLEAR ?auto_1268214 ) ( LIFTING ?auto_1268217 ?auto_1268215 ) ( IS-CRATE ?auto_1268215 ) ( not ( = ?auto_1268214 ?auto_1268215 ) ) ( ON ?auto_1268209 ?auto_1268208 ) ( ON ?auto_1268210 ?auto_1268209 ) ( ON ?auto_1268207 ?auto_1268210 ) ( ON ?auto_1268211 ?auto_1268207 ) ( ON ?auto_1268213 ?auto_1268211 ) ( ON ?auto_1268212 ?auto_1268213 ) ( ON ?auto_1268214 ?auto_1268212 ) ( not ( = ?auto_1268208 ?auto_1268209 ) ) ( not ( = ?auto_1268208 ?auto_1268210 ) ) ( not ( = ?auto_1268208 ?auto_1268207 ) ) ( not ( = ?auto_1268208 ?auto_1268211 ) ) ( not ( = ?auto_1268208 ?auto_1268213 ) ) ( not ( = ?auto_1268208 ?auto_1268212 ) ) ( not ( = ?auto_1268208 ?auto_1268214 ) ) ( not ( = ?auto_1268208 ?auto_1268215 ) ) ( not ( = ?auto_1268209 ?auto_1268210 ) ) ( not ( = ?auto_1268209 ?auto_1268207 ) ) ( not ( = ?auto_1268209 ?auto_1268211 ) ) ( not ( = ?auto_1268209 ?auto_1268213 ) ) ( not ( = ?auto_1268209 ?auto_1268212 ) ) ( not ( = ?auto_1268209 ?auto_1268214 ) ) ( not ( = ?auto_1268209 ?auto_1268215 ) ) ( not ( = ?auto_1268210 ?auto_1268207 ) ) ( not ( = ?auto_1268210 ?auto_1268211 ) ) ( not ( = ?auto_1268210 ?auto_1268213 ) ) ( not ( = ?auto_1268210 ?auto_1268212 ) ) ( not ( = ?auto_1268210 ?auto_1268214 ) ) ( not ( = ?auto_1268210 ?auto_1268215 ) ) ( not ( = ?auto_1268207 ?auto_1268211 ) ) ( not ( = ?auto_1268207 ?auto_1268213 ) ) ( not ( = ?auto_1268207 ?auto_1268212 ) ) ( not ( = ?auto_1268207 ?auto_1268214 ) ) ( not ( = ?auto_1268207 ?auto_1268215 ) ) ( not ( = ?auto_1268211 ?auto_1268213 ) ) ( not ( = ?auto_1268211 ?auto_1268212 ) ) ( not ( = ?auto_1268211 ?auto_1268214 ) ) ( not ( = ?auto_1268211 ?auto_1268215 ) ) ( not ( = ?auto_1268213 ?auto_1268212 ) ) ( not ( = ?auto_1268213 ?auto_1268214 ) ) ( not ( = ?auto_1268213 ?auto_1268215 ) ) ( not ( = ?auto_1268212 ?auto_1268214 ) ) ( not ( = ?auto_1268212 ?auto_1268215 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1268214 ?auto_1268215 )
      ( MAKE-8CRATE-VERIFY ?auto_1268208 ?auto_1268209 ?auto_1268210 ?auto_1268207 ?auto_1268211 ?auto_1268213 ?auto_1268212 ?auto_1268214 ?auto_1268215 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1268275 - SURFACE
      ?auto_1268276 - SURFACE
      ?auto_1268277 - SURFACE
      ?auto_1268274 - SURFACE
      ?auto_1268278 - SURFACE
      ?auto_1268280 - SURFACE
      ?auto_1268279 - SURFACE
      ?auto_1268281 - SURFACE
      ?auto_1268282 - SURFACE
    )
    :vars
    (
      ?auto_1268284 - HOIST
      ?auto_1268285 - PLACE
      ?auto_1268283 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1268284 ?auto_1268285 ) ( SURFACE-AT ?auto_1268281 ?auto_1268285 ) ( CLEAR ?auto_1268281 ) ( IS-CRATE ?auto_1268282 ) ( not ( = ?auto_1268281 ?auto_1268282 ) ) ( TRUCK-AT ?auto_1268283 ?auto_1268285 ) ( AVAILABLE ?auto_1268284 ) ( IN ?auto_1268282 ?auto_1268283 ) ( ON ?auto_1268281 ?auto_1268279 ) ( not ( = ?auto_1268279 ?auto_1268281 ) ) ( not ( = ?auto_1268279 ?auto_1268282 ) ) ( ON ?auto_1268276 ?auto_1268275 ) ( ON ?auto_1268277 ?auto_1268276 ) ( ON ?auto_1268274 ?auto_1268277 ) ( ON ?auto_1268278 ?auto_1268274 ) ( ON ?auto_1268280 ?auto_1268278 ) ( ON ?auto_1268279 ?auto_1268280 ) ( not ( = ?auto_1268275 ?auto_1268276 ) ) ( not ( = ?auto_1268275 ?auto_1268277 ) ) ( not ( = ?auto_1268275 ?auto_1268274 ) ) ( not ( = ?auto_1268275 ?auto_1268278 ) ) ( not ( = ?auto_1268275 ?auto_1268280 ) ) ( not ( = ?auto_1268275 ?auto_1268279 ) ) ( not ( = ?auto_1268275 ?auto_1268281 ) ) ( not ( = ?auto_1268275 ?auto_1268282 ) ) ( not ( = ?auto_1268276 ?auto_1268277 ) ) ( not ( = ?auto_1268276 ?auto_1268274 ) ) ( not ( = ?auto_1268276 ?auto_1268278 ) ) ( not ( = ?auto_1268276 ?auto_1268280 ) ) ( not ( = ?auto_1268276 ?auto_1268279 ) ) ( not ( = ?auto_1268276 ?auto_1268281 ) ) ( not ( = ?auto_1268276 ?auto_1268282 ) ) ( not ( = ?auto_1268277 ?auto_1268274 ) ) ( not ( = ?auto_1268277 ?auto_1268278 ) ) ( not ( = ?auto_1268277 ?auto_1268280 ) ) ( not ( = ?auto_1268277 ?auto_1268279 ) ) ( not ( = ?auto_1268277 ?auto_1268281 ) ) ( not ( = ?auto_1268277 ?auto_1268282 ) ) ( not ( = ?auto_1268274 ?auto_1268278 ) ) ( not ( = ?auto_1268274 ?auto_1268280 ) ) ( not ( = ?auto_1268274 ?auto_1268279 ) ) ( not ( = ?auto_1268274 ?auto_1268281 ) ) ( not ( = ?auto_1268274 ?auto_1268282 ) ) ( not ( = ?auto_1268278 ?auto_1268280 ) ) ( not ( = ?auto_1268278 ?auto_1268279 ) ) ( not ( = ?auto_1268278 ?auto_1268281 ) ) ( not ( = ?auto_1268278 ?auto_1268282 ) ) ( not ( = ?auto_1268280 ?auto_1268279 ) ) ( not ( = ?auto_1268280 ?auto_1268281 ) ) ( not ( = ?auto_1268280 ?auto_1268282 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1268279 ?auto_1268281 ?auto_1268282 )
      ( MAKE-8CRATE-VERIFY ?auto_1268275 ?auto_1268276 ?auto_1268277 ?auto_1268274 ?auto_1268278 ?auto_1268280 ?auto_1268279 ?auto_1268281 ?auto_1268282 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1268351 - SURFACE
      ?auto_1268352 - SURFACE
      ?auto_1268353 - SURFACE
      ?auto_1268350 - SURFACE
      ?auto_1268354 - SURFACE
      ?auto_1268356 - SURFACE
      ?auto_1268355 - SURFACE
      ?auto_1268357 - SURFACE
      ?auto_1268358 - SURFACE
    )
    :vars
    (
      ?auto_1268359 - HOIST
      ?auto_1268360 - PLACE
      ?auto_1268362 - TRUCK
      ?auto_1268361 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1268359 ?auto_1268360 ) ( SURFACE-AT ?auto_1268357 ?auto_1268360 ) ( CLEAR ?auto_1268357 ) ( IS-CRATE ?auto_1268358 ) ( not ( = ?auto_1268357 ?auto_1268358 ) ) ( AVAILABLE ?auto_1268359 ) ( IN ?auto_1268358 ?auto_1268362 ) ( ON ?auto_1268357 ?auto_1268355 ) ( not ( = ?auto_1268355 ?auto_1268357 ) ) ( not ( = ?auto_1268355 ?auto_1268358 ) ) ( TRUCK-AT ?auto_1268362 ?auto_1268361 ) ( not ( = ?auto_1268361 ?auto_1268360 ) ) ( ON ?auto_1268352 ?auto_1268351 ) ( ON ?auto_1268353 ?auto_1268352 ) ( ON ?auto_1268350 ?auto_1268353 ) ( ON ?auto_1268354 ?auto_1268350 ) ( ON ?auto_1268356 ?auto_1268354 ) ( ON ?auto_1268355 ?auto_1268356 ) ( not ( = ?auto_1268351 ?auto_1268352 ) ) ( not ( = ?auto_1268351 ?auto_1268353 ) ) ( not ( = ?auto_1268351 ?auto_1268350 ) ) ( not ( = ?auto_1268351 ?auto_1268354 ) ) ( not ( = ?auto_1268351 ?auto_1268356 ) ) ( not ( = ?auto_1268351 ?auto_1268355 ) ) ( not ( = ?auto_1268351 ?auto_1268357 ) ) ( not ( = ?auto_1268351 ?auto_1268358 ) ) ( not ( = ?auto_1268352 ?auto_1268353 ) ) ( not ( = ?auto_1268352 ?auto_1268350 ) ) ( not ( = ?auto_1268352 ?auto_1268354 ) ) ( not ( = ?auto_1268352 ?auto_1268356 ) ) ( not ( = ?auto_1268352 ?auto_1268355 ) ) ( not ( = ?auto_1268352 ?auto_1268357 ) ) ( not ( = ?auto_1268352 ?auto_1268358 ) ) ( not ( = ?auto_1268353 ?auto_1268350 ) ) ( not ( = ?auto_1268353 ?auto_1268354 ) ) ( not ( = ?auto_1268353 ?auto_1268356 ) ) ( not ( = ?auto_1268353 ?auto_1268355 ) ) ( not ( = ?auto_1268353 ?auto_1268357 ) ) ( not ( = ?auto_1268353 ?auto_1268358 ) ) ( not ( = ?auto_1268350 ?auto_1268354 ) ) ( not ( = ?auto_1268350 ?auto_1268356 ) ) ( not ( = ?auto_1268350 ?auto_1268355 ) ) ( not ( = ?auto_1268350 ?auto_1268357 ) ) ( not ( = ?auto_1268350 ?auto_1268358 ) ) ( not ( = ?auto_1268354 ?auto_1268356 ) ) ( not ( = ?auto_1268354 ?auto_1268355 ) ) ( not ( = ?auto_1268354 ?auto_1268357 ) ) ( not ( = ?auto_1268354 ?auto_1268358 ) ) ( not ( = ?auto_1268356 ?auto_1268355 ) ) ( not ( = ?auto_1268356 ?auto_1268357 ) ) ( not ( = ?auto_1268356 ?auto_1268358 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1268355 ?auto_1268357 ?auto_1268358 )
      ( MAKE-8CRATE-VERIFY ?auto_1268351 ?auto_1268352 ?auto_1268353 ?auto_1268350 ?auto_1268354 ?auto_1268356 ?auto_1268355 ?auto_1268357 ?auto_1268358 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1268435 - SURFACE
      ?auto_1268436 - SURFACE
      ?auto_1268437 - SURFACE
      ?auto_1268434 - SURFACE
      ?auto_1268438 - SURFACE
      ?auto_1268440 - SURFACE
      ?auto_1268439 - SURFACE
      ?auto_1268441 - SURFACE
      ?auto_1268442 - SURFACE
    )
    :vars
    (
      ?auto_1268443 - HOIST
      ?auto_1268445 - PLACE
      ?auto_1268444 - TRUCK
      ?auto_1268446 - PLACE
      ?auto_1268447 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1268443 ?auto_1268445 ) ( SURFACE-AT ?auto_1268441 ?auto_1268445 ) ( CLEAR ?auto_1268441 ) ( IS-CRATE ?auto_1268442 ) ( not ( = ?auto_1268441 ?auto_1268442 ) ) ( AVAILABLE ?auto_1268443 ) ( ON ?auto_1268441 ?auto_1268439 ) ( not ( = ?auto_1268439 ?auto_1268441 ) ) ( not ( = ?auto_1268439 ?auto_1268442 ) ) ( TRUCK-AT ?auto_1268444 ?auto_1268446 ) ( not ( = ?auto_1268446 ?auto_1268445 ) ) ( HOIST-AT ?auto_1268447 ?auto_1268446 ) ( LIFTING ?auto_1268447 ?auto_1268442 ) ( not ( = ?auto_1268443 ?auto_1268447 ) ) ( ON ?auto_1268436 ?auto_1268435 ) ( ON ?auto_1268437 ?auto_1268436 ) ( ON ?auto_1268434 ?auto_1268437 ) ( ON ?auto_1268438 ?auto_1268434 ) ( ON ?auto_1268440 ?auto_1268438 ) ( ON ?auto_1268439 ?auto_1268440 ) ( not ( = ?auto_1268435 ?auto_1268436 ) ) ( not ( = ?auto_1268435 ?auto_1268437 ) ) ( not ( = ?auto_1268435 ?auto_1268434 ) ) ( not ( = ?auto_1268435 ?auto_1268438 ) ) ( not ( = ?auto_1268435 ?auto_1268440 ) ) ( not ( = ?auto_1268435 ?auto_1268439 ) ) ( not ( = ?auto_1268435 ?auto_1268441 ) ) ( not ( = ?auto_1268435 ?auto_1268442 ) ) ( not ( = ?auto_1268436 ?auto_1268437 ) ) ( not ( = ?auto_1268436 ?auto_1268434 ) ) ( not ( = ?auto_1268436 ?auto_1268438 ) ) ( not ( = ?auto_1268436 ?auto_1268440 ) ) ( not ( = ?auto_1268436 ?auto_1268439 ) ) ( not ( = ?auto_1268436 ?auto_1268441 ) ) ( not ( = ?auto_1268436 ?auto_1268442 ) ) ( not ( = ?auto_1268437 ?auto_1268434 ) ) ( not ( = ?auto_1268437 ?auto_1268438 ) ) ( not ( = ?auto_1268437 ?auto_1268440 ) ) ( not ( = ?auto_1268437 ?auto_1268439 ) ) ( not ( = ?auto_1268437 ?auto_1268441 ) ) ( not ( = ?auto_1268437 ?auto_1268442 ) ) ( not ( = ?auto_1268434 ?auto_1268438 ) ) ( not ( = ?auto_1268434 ?auto_1268440 ) ) ( not ( = ?auto_1268434 ?auto_1268439 ) ) ( not ( = ?auto_1268434 ?auto_1268441 ) ) ( not ( = ?auto_1268434 ?auto_1268442 ) ) ( not ( = ?auto_1268438 ?auto_1268440 ) ) ( not ( = ?auto_1268438 ?auto_1268439 ) ) ( not ( = ?auto_1268438 ?auto_1268441 ) ) ( not ( = ?auto_1268438 ?auto_1268442 ) ) ( not ( = ?auto_1268440 ?auto_1268439 ) ) ( not ( = ?auto_1268440 ?auto_1268441 ) ) ( not ( = ?auto_1268440 ?auto_1268442 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1268439 ?auto_1268441 ?auto_1268442 )
      ( MAKE-8CRATE-VERIFY ?auto_1268435 ?auto_1268436 ?auto_1268437 ?auto_1268434 ?auto_1268438 ?auto_1268440 ?auto_1268439 ?auto_1268441 ?auto_1268442 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1268527 - SURFACE
      ?auto_1268528 - SURFACE
      ?auto_1268529 - SURFACE
      ?auto_1268526 - SURFACE
      ?auto_1268530 - SURFACE
      ?auto_1268532 - SURFACE
      ?auto_1268531 - SURFACE
      ?auto_1268533 - SURFACE
      ?auto_1268534 - SURFACE
    )
    :vars
    (
      ?auto_1268536 - HOIST
      ?auto_1268537 - PLACE
      ?auto_1268539 - TRUCK
      ?auto_1268538 - PLACE
      ?auto_1268535 - HOIST
      ?auto_1268540 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1268536 ?auto_1268537 ) ( SURFACE-AT ?auto_1268533 ?auto_1268537 ) ( CLEAR ?auto_1268533 ) ( IS-CRATE ?auto_1268534 ) ( not ( = ?auto_1268533 ?auto_1268534 ) ) ( AVAILABLE ?auto_1268536 ) ( ON ?auto_1268533 ?auto_1268531 ) ( not ( = ?auto_1268531 ?auto_1268533 ) ) ( not ( = ?auto_1268531 ?auto_1268534 ) ) ( TRUCK-AT ?auto_1268539 ?auto_1268538 ) ( not ( = ?auto_1268538 ?auto_1268537 ) ) ( HOIST-AT ?auto_1268535 ?auto_1268538 ) ( not ( = ?auto_1268536 ?auto_1268535 ) ) ( AVAILABLE ?auto_1268535 ) ( SURFACE-AT ?auto_1268534 ?auto_1268538 ) ( ON ?auto_1268534 ?auto_1268540 ) ( CLEAR ?auto_1268534 ) ( not ( = ?auto_1268533 ?auto_1268540 ) ) ( not ( = ?auto_1268534 ?auto_1268540 ) ) ( not ( = ?auto_1268531 ?auto_1268540 ) ) ( ON ?auto_1268528 ?auto_1268527 ) ( ON ?auto_1268529 ?auto_1268528 ) ( ON ?auto_1268526 ?auto_1268529 ) ( ON ?auto_1268530 ?auto_1268526 ) ( ON ?auto_1268532 ?auto_1268530 ) ( ON ?auto_1268531 ?auto_1268532 ) ( not ( = ?auto_1268527 ?auto_1268528 ) ) ( not ( = ?auto_1268527 ?auto_1268529 ) ) ( not ( = ?auto_1268527 ?auto_1268526 ) ) ( not ( = ?auto_1268527 ?auto_1268530 ) ) ( not ( = ?auto_1268527 ?auto_1268532 ) ) ( not ( = ?auto_1268527 ?auto_1268531 ) ) ( not ( = ?auto_1268527 ?auto_1268533 ) ) ( not ( = ?auto_1268527 ?auto_1268534 ) ) ( not ( = ?auto_1268527 ?auto_1268540 ) ) ( not ( = ?auto_1268528 ?auto_1268529 ) ) ( not ( = ?auto_1268528 ?auto_1268526 ) ) ( not ( = ?auto_1268528 ?auto_1268530 ) ) ( not ( = ?auto_1268528 ?auto_1268532 ) ) ( not ( = ?auto_1268528 ?auto_1268531 ) ) ( not ( = ?auto_1268528 ?auto_1268533 ) ) ( not ( = ?auto_1268528 ?auto_1268534 ) ) ( not ( = ?auto_1268528 ?auto_1268540 ) ) ( not ( = ?auto_1268529 ?auto_1268526 ) ) ( not ( = ?auto_1268529 ?auto_1268530 ) ) ( not ( = ?auto_1268529 ?auto_1268532 ) ) ( not ( = ?auto_1268529 ?auto_1268531 ) ) ( not ( = ?auto_1268529 ?auto_1268533 ) ) ( not ( = ?auto_1268529 ?auto_1268534 ) ) ( not ( = ?auto_1268529 ?auto_1268540 ) ) ( not ( = ?auto_1268526 ?auto_1268530 ) ) ( not ( = ?auto_1268526 ?auto_1268532 ) ) ( not ( = ?auto_1268526 ?auto_1268531 ) ) ( not ( = ?auto_1268526 ?auto_1268533 ) ) ( not ( = ?auto_1268526 ?auto_1268534 ) ) ( not ( = ?auto_1268526 ?auto_1268540 ) ) ( not ( = ?auto_1268530 ?auto_1268532 ) ) ( not ( = ?auto_1268530 ?auto_1268531 ) ) ( not ( = ?auto_1268530 ?auto_1268533 ) ) ( not ( = ?auto_1268530 ?auto_1268534 ) ) ( not ( = ?auto_1268530 ?auto_1268540 ) ) ( not ( = ?auto_1268532 ?auto_1268531 ) ) ( not ( = ?auto_1268532 ?auto_1268533 ) ) ( not ( = ?auto_1268532 ?auto_1268534 ) ) ( not ( = ?auto_1268532 ?auto_1268540 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1268531 ?auto_1268533 ?auto_1268534 )
      ( MAKE-8CRATE-VERIFY ?auto_1268527 ?auto_1268528 ?auto_1268529 ?auto_1268526 ?auto_1268530 ?auto_1268532 ?auto_1268531 ?auto_1268533 ?auto_1268534 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1268620 - SURFACE
      ?auto_1268621 - SURFACE
      ?auto_1268622 - SURFACE
      ?auto_1268619 - SURFACE
      ?auto_1268623 - SURFACE
      ?auto_1268625 - SURFACE
      ?auto_1268624 - SURFACE
      ?auto_1268626 - SURFACE
      ?auto_1268627 - SURFACE
    )
    :vars
    (
      ?auto_1268630 - HOIST
      ?auto_1268631 - PLACE
      ?auto_1268632 - PLACE
      ?auto_1268629 - HOIST
      ?auto_1268633 - SURFACE
      ?auto_1268628 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1268630 ?auto_1268631 ) ( SURFACE-AT ?auto_1268626 ?auto_1268631 ) ( CLEAR ?auto_1268626 ) ( IS-CRATE ?auto_1268627 ) ( not ( = ?auto_1268626 ?auto_1268627 ) ) ( AVAILABLE ?auto_1268630 ) ( ON ?auto_1268626 ?auto_1268624 ) ( not ( = ?auto_1268624 ?auto_1268626 ) ) ( not ( = ?auto_1268624 ?auto_1268627 ) ) ( not ( = ?auto_1268632 ?auto_1268631 ) ) ( HOIST-AT ?auto_1268629 ?auto_1268632 ) ( not ( = ?auto_1268630 ?auto_1268629 ) ) ( AVAILABLE ?auto_1268629 ) ( SURFACE-AT ?auto_1268627 ?auto_1268632 ) ( ON ?auto_1268627 ?auto_1268633 ) ( CLEAR ?auto_1268627 ) ( not ( = ?auto_1268626 ?auto_1268633 ) ) ( not ( = ?auto_1268627 ?auto_1268633 ) ) ( not ( = ?auto_1268624 ?auto_1268633 ) ) ( TRUCK-AT ?auto_1268628 ?auto_1268631 ) ( ON ?auto_1268621 ?auto_1268620 ) ( ON ?auto_1268622 ?auto_1268621 ) ( ON ?auto_1268619 ?auto_1268622 ) ( ON ?auto_1268623 ?auto_1268619 ) ( ON ?auto_1268625 ?auto_1268623 ) ( ON ?auto_1268624 ?auto_1268625 ) ( not ( = ?auto_1268620 ?auto_1268621 ) ) ( not ( = ?auto_1268620 ?auto_1268622 ) ) ( not ( = ?auto_1268620 ?auto_1268619 ) ) ( not ( = ?auto_1268620 ?auto_1268623 ) ) ( not ( = ?auto_1268620 ?auto_1268625 ) ) ( not ( = ?auto_1268620 ?auto_1268624 ) ) ( not ( = ?auto_1268620 ?auto_1268626 ) ) ( not ( = ?auto_1268620 ?auto_1268627 ) ) ( not ( = ?auto_1268620 ?auto_1268633 ) ) ( not ( = ?auto_1268621 ?auto_1268622 ) ) ( not ( = ?auto_1268621 ?auto_1268619 ) ) ( not ( = ?auto_1268621 ?auto_1268623 ) ) ( not ( = ?auto_1268621 ?auto_1268625 ) ) ( not ( = ?auto_1268621 ?auto_1268624 ) ) ( not ( = ?auto_1268621 ?auto_1268626 ) ) ( not ( = ?auto_1268621 ?auto_1268627 ) ) ( not ( = ?auto_1268621 ?auto_1268633 ) ) ( not ( = ?auto_1268622 ?auto_1268619 ) ) ( not ( = ?auto_1268622 ?auto_1268623 ) ) ( not ( = ?auto_1268622 ?auto_1268625 ) ) ( not ( = ?auto_1268622 ?auto_1268624 ) ) ( not ( = ?auto_1268622 ?auto_1268626 ) ) ( not ( = ?auto_1268622 ?auto_1268627 ) ) ( not ( = ?auto_1268622 ?auto_1268633 ) ) ( not ( = ?auto_1268619 ?auto_1268623 ) ) ( not ( = ?auto_1268619 ?auto_1268625 ) ) ( not ( = ?auto_1268619 ?auto_1268624 ) ) ( not ( = ?auto_1268619 ?auto_1268626 ) ) ( not ( = ?auto_1268619 ?auto_1268627 ) ) ( not ( = ?auto_1268619 ?auto_1268633 ) ) ( not ( = ?auto_1268623 ?auto_1268625 ) ) ( not ( = ?auto_1268623 ?auto_1268624 ) ) ( not ( = ?auto_1268623 ?auto_1268626 ) ) ( not ( = ?auto_1268623 ?auto_1268627 ) ) ( not ( = ?auto_1268623 ?auto_1268633 ) ) ( not ( = ?auto_1268625 ?auto_1268624 ) ) ( not ( = ?auto_1268625 ?auto_1268626 ) ) ( not ( = ?auto_1268625 ?auto_1268627 ) ) ( not ( = ?auto_1268625 ?auto_1268633 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1268624 ?auto_1268626 ?auto_1268627 )
      ( MAKE-8CRATE-VERIFY ?auto_1268620 ?auto_1268621 ?auto_1268622 ?auto_1268619 ?auto_1268623 ?auto_1268625 ?auto_1268624 ?auto_1268626 ?auto_1268627 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1268713 - SURFACE
      ?auto_1268714 - SURFACE
      ?auto_1268715 - SURFACE
      ?auto_1268712 - SURFACE
      ?auto_1268716 - SURFACE
      ?auto_1268718 - SURFACE
      ?auto_1268717 - SURFACE
      ?auto_1268719 - SURFACE
      ?auto_1268720 - SURFACE
    )
    :vars
    (
      ?auto_1268722 - HOIST
      ?auto_1268725 - PLACE
      ?auto_1268723 - PLACE
      ?auto_1268724 - HOIST
      ?auto_1268721 - SURFACE
      ?auto_1268726 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1268722 ?auto_1268725 ) ( IS-CRATE ?auto_1268720 ) ( not ( = ?auto_1268719 ?auto_1268720 ) ) ( not ( = ?auto_1268717 ?auto_1268719 ) ) ( not ( = ?auto_1268717 ?auto_1268720 ) ) ( not ( = ?auto_1268723 ?auto_1268725 ) ) ( HOIST-AT ?auto_1268724 ?auto_1268723 ) ( not ( = ?auto_1268722 ?auto_1268724 ) ) ( AVAILABLE ?auto_1268724 ) ( SURFACE-AT ?auto_1268720 ?auto_1268723 ) ( ON ?auto_1268720 ?auto_1268721 ) ( CLEAR ?auto_1268720 ) ( not ( = ?auto_1268719 ?auto_1268721 ) ) ( not ( = ?auto_1268720 ?auto_1268721 ) ) ( not ( = ?auto_1268717 ?auto_1268721 ) ) ( TRUCK-AT ?auto_1268726 ?auto_1268725 ) ( SURFACE-AT ?auto_1268717 ?auto_1268725 ) ( CLEAR ?auto_1268717 ) ( LIFTING ?auto_1268722 ?auto_1268719 ) ( IS-CRATE ?auto_1268719 ) ( ON ?auto_1268714 ?auto_1268713 ) ( ON ?auto_1268715 ?auto_1268714 ) ( ON ?auto_1268712 ?auto_1268715 ) ( ON ?auto_1268716 ?auto_1268712 ) ( ON ?auto_1268718 ?auto_1268716 ) ( ON ?auto_1268717 ?auto_1268718 ) ( not ( = ?auto_1268713 ?auto_1268714 ) ) ( not ( = ?auto_1268713 ?auto_1268715 ) ) ( not ( = ?auto_1268713 ?auto_1268712 ) ) ( not ( = ?auto_1268713 ?auto_1268716 ) ) ( not ( = ?auto_1268713 ?auto_1268718 ) ) ( not ( = ?auto_1268713 ?auto_1268717 ) ) ( not ( = ?auto_1268713 ?auto_1268719 ) ) ( not ( = ?auto_1268713 ?auto_1268720 ) ) ( not ( = ?auto_1268713 ?auto_1268721 ) ) ( not ( = ?auto_1268714 ?auto_1268715 ) ) ( not ( = ?auto_1268714 ?auto_1268712 ) ) ( not ( = ?auto_1268714 ?auto_1268716 ) ) ( not ( = ?auto_1268714 ?auto_1268718 ) ) ( not ( = ?auto_1268714 ?auto_1268717 ) ) ( not ( = ?auto_1268714 ?auto_1268719 ) ) ( not ( = ?auto_1268714 ?auto_1268720 ) ) ( not ( = ?auto_1268714 ?auto_1268721 ) ) ( not ( = ?auto_1268715 ?auto_1268712 ) ) ( not ( = ?auto_1268715 ?auto_1268716 ) ) ( not ( = ?auto_1268715 ?auto_1268718 ) ) ( not ( = ?auto_1268715 ?auto_1268717 ) ) ( not ( = ?auto_1268715 ?auto_1268719 ) ) ( not ( = ?auto_1268715 ?auto_1268720 ) ) ( not ( = ?auto_1268715 ?auto_1268721 ) ) ( not ( = ?auto_1268712 ?auto_1268716 ) ) ( not ( = ?auto_1268712 ?auto_1268718 ) ) ( not ( = ?auto_1268712 ?auto_1268717 ) ) ( not ( = ?auto_1268712 ?auto_1268719 ) ) ( not ( = ?auto_1268712 ?auto_1268720 ) ) ( not ( = ?auto_1268712 ?auto_1268721 ) ) ( not ( = ?auto_1268716 ?auto_1268718 ) ) ( not ( = ?auto_1268716 ?auto_1268717 ) ) ( not ( = ?auto_1268716 ?auto_1268719 ) ) ( not ( = ?auto_1268716 ?auto_1268720 ) ) ( not ( = ?auto_1268716 ?auto_1268721 ) ) ( not ( = ?auto_1268718 ?auto_1268717 ) ) ( not ( = ?auto_1268718 ?auto_1268719 ) ) ( not ( = ?auto_1268718 ?auto_1268720 ) ) ( not ( = ?auto_1268718 ?auto_1268721 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1268717 ?auto_1268719 ?auto_1268720 )
      ( MAKE-8CRATE-VERIFY ?auto_1268713 ?auto_1268714 ?auto_1268715 ?auto_1268712 ?auto_1268716 ?auto_1268718 ?auto_1268717 ?auto_1268719 ?auto_1268720 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1268806 - SURFACE
      ?auto_1268807 - SURFACE
      ?auto_1268808 - SURFACE
      ?auto_1268805 - SURFACE
      ?auto_1268809 - SURFACE
      ?auto_1268811 - SURFACE
      ?auto_1268810 - SURFACE
      ?auto_1268812 - SURFACE
      ?auto_1268813 - SURFACE
    )
    :vars
    (
      ?auto_1268816 - HOIST
      ?auto_1268819 - PLACE
      ?auto_1268814 - PLACE
      ?auto_1268817 - HOIST
      ?auto_1268815 - SURFACE
      ?auto_1268818 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1268816 ?auto_1268819 ) ( IS-CRATE ?auto_1268813 ) ( not ( = ?auto_1268812 ?auto_1268813 ) ) ( not ( = ?auto_1268810 ?auto_1268812 ) ) ( not ( = ?auto_1268810 ?auto_1268813 ) ) ( not ( = ?auto_1268814 ?auto_1268819 ) ) ( HOIST-AT ?auto_1268817 ?auto_1268814 ) ( not ( = ?auto_1268816 ?auto_1268817 ) ) ( AVAILABLE ?auto_1268817 ) ( SURFACE-AT ?auto_1268813 ?auto_1268814 ) ( ON ?auto_1268813 ?auto_1268815 ) ( CLEAR ?auto_1268813 ) ( not ( = ?auto_1268812 ?auto_1268815 ) ) ( not ( = ?auto_1268813 ?auto_1268815 ) ) ( not ( = ?auto_1268810 ?auto_1268815 ) ) ( TRUCK-AT ?auto_1268818 ?auto_1268819 ) ( SURFACE-AT ?auto_1268810 ?auto_1268819 ) ( CLEAR ?auto_1268810 ) ( IS-CRATE ?auto_1268812 ) ( AVAILABLE ?auto_1268816 ) ( IN ?auto_1268812 ?auto_1268818 ) ( ON ?auto_1268807 ?auto_1268806 ) ( ON ?auto_1268808 ?auto_1268807 ) ( ON ?auto_1268805 ?auto_1268808 ) ( ON ?auto_1268809 ?auto_1268805 ) ( ON ?auto_1268811 ?auto_1268809 ) ( ON ?auto_1268810 ?auto_1268811 ) ( not ( = ?auto_1268806 ?auto_1268807 ) ) ( not ( = ?auto_1268806 ?auto_1268808 ) ) ( not ( = ?auto_1268806 ?auto_1268805 ) ) ( not ( = ?auto_1268806 ?auto_1268809 ) ) ( not ( = ?auto_1268806 ?auto_1268811 ) ) ( not ( = ?auto_1268806 ?auto_1268810 ) ) ( not ( = ?auto_1268806 ?auto_1268812 ) ) ( not ( = ?auto_1268806 ?auto_1268813 ) ) ( not ( = ?auto_1268806 ?auto_1268815 ) ) ( not ( = ?auto_1268807 ?auto_1268808 ) ) ( not ( = ?auto_1268807 ?auto_1268805 ) ) ( not ( = ?auto_1268807 ?auto_1268809 ) ) ( not ( = ?auto_1268807 ?auto_1268811 ) ) ( not ( = ?auto_1268807 ?auto_1268810 ) ) ( not ( = ?auto_1268807 ?auto_1268812 ) ) ( not ( = ?auto_1268807 ?auto_1268813 ) ) ( not ( = ?auto_1268807 ?auto_1268815 ) ) ( not ( = ?auto_1268808 ?auto_1268805 ) ) ( not ( = ?auto_1268808 ?auto_1268809 ) ) ( not ( = ?auto_1268808 ?auto_1268811 ) ) ( not ( = ?auto_1268808 ?auto_1268810 ) ) ( not ( = ?auto_1268808 ?auto_1268812 ) ) ( not ( = ?auto_1268808 ?auto_1268813 ) ) ( not ( = ?auto_1268808 ?auto_1268815 ) ) ( not ( = ?auto_1268805 ?auto_1268809 ) ) ( not ( = ?auto_1268805 ?auto_1268811 ) ) ( not ( = ?auto_1268805 ?auto_1268810 ) ) ( not ( = ?auto_1268805 ?auto_1268812 ) ) ( not ( = ?auto_1268805 ?auto_1268813 ) ) ( not ( = ?auto_1268805 ?auto_1268815 ) ) ( not ( = ?auto_1268809 ?auto_1268811 ) ) ( not ( = ?auto_1268809 ?auto_1268810 ) ) ( not ( = ?auto_1268809 ?auto_1268812 ) ) ( not ( = ?auto_1268809 ?auto_1268813 ) ) ( not ( = ?auto_1268809 ?auto_1268815 ) ) ( not ( = ?auto_1268811 ?auto_1268810 ) ) ( not ( = ?auto_1268811 ?auto_1268812 ) ) ( not ( = ?auto_1268811 ?auto_1268813 ) ) ( not ( = ?auto_1268811 ?auto_1268815 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1268810 ?auto_1268812 ?auto_1268813 )
      ( MAKE-8CRATE-VERIFY ?auto_1268806 ?auto_1268807 ?auto_1268808 ?auto_1268805 ?auto_1268809 ?auto_1268811 ?auto_1268810 ?auto_1268812 ?auto_1268813 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1268849 - SURFACE
      ?auto_1268850 - SURFACE
      ?auto_1268851 - SURFACE
      ?auto_1268848 - SURFACE
      ?auto_1268852 - SURFACE
    )
    :vars
    (
      ?auto_1268855 - HOIST
      ?auto_1268856 - PLACE
      ?auto_1268857 - PLACE
      ?auto_1268858 - HOIST
      ?auto_1268854 - SURFACE
      ?auto_1268853 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1268855 ?auto_1268856 ) ( IS-CRATE ?auto_1268852 ) ( not ( = ?auto_1268848 ?auto_1268852 ) ) ( not ( = ?auto_1268851 ?auto_1268848 ) ) ( not ( = ?auto_1268851 ?auto_1268852 ) ) ( not ( = ?auto_1268857 ?auto_1268856 ) ) ( HOIST-AT ?auto_1268858 ?auto_1268857 ) ( not ( = ?auto_1268855 ?auto_1268858 ) ) ( AVAILABLE ?auto_1268858 ) ( SURFACE-AT ?auto_1268852 ?auto_1268857 ) ( ON ?auto_1268852 ?auto_1268854 ) ( CLEAR ?auto_1268852 ) ( not ( = ?auto_1268848 ?auto_1268854 ) ) ( not ( = ?auto_1268852 ?auto_1268854 ) ) ( not ( = ?auto_1268851 ?auto_1268854 ) ) ( SURFACE-AT ?auto_1268851 ?auto_1268856 ) ( CLEAR ?auto_1268851 ) ( IS-CRATE ?auto_1268848 ) ( AVAILABLE ?auto_1268855 ) ( IN ?auto_1268848 ?auto_1268853 ) ( TRUCK-AT ?auto_1268853 ?auto_1268857 ) ( ON ?auto_1268850 ?auto_1268849 ) ( ON ?auto_1268851 ?auto_1268850 ) ( not ( = ?auto_1268849 ?auto_1268850 ) ) ( not ( = ?auto_1268849 ?auto_1268851 ) ) ( not ( = ?auto_1268849 ?auto_1268848 ) ) ( not ( = ?auto_1268849 ?auto_1268852 ) ) ( not ( = ?auto_1268849 ?auto_1268854 ) ) ( not ( = ?auto_1268850 ?auto_1268851 ) ) ( not ( = ?auto_1268850 ?auto_1268848 ) ) ( not ( = ?auto_1268850 ?auto_1268852 ) ) ( not ( = ?auto_1268850 ?auto_1268854 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1268851 ?auto_1268848 ?auto_1268852 )
      ( MAKE-4CRATE-VERIFY ?auto_1268849 ?auto_1268850 ?auto_1268851 ?auto_1268848 ?auto_1268852 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1268860 - SURFACE
      ?auto_1268861 - SURFACE
      ?auto_1268862 - SURFACE
      ?auto_1268859 - SURFACE
      ?auto_1268863 - SURFACE
      ?auto_1268864 - SURFACE
    )
    :vars
    (
      ?auto_1268867 - HOIST
      ?auto_1268868 - PLACE
      ?auto_1268869 - PLACE
      ?auto_1268870 - HOIST
      ?auto_1268866 - SURFACE
      ?auto_1268865 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1268867 ?auto_1268868 ) ( IS-CRATE ?auto_1268864 ) ( not ( = ?auto_1268863 ?auto_1268864 ) ) ( not ( = ?auto_1268859 ?auto_1268863 ) ) ( not ( = ?auto_1268859 ?auto_1268864 ) ) ( not ( = ?auto_1268869 ?auto_1268868 ) ) ( HOIST-AT ?auto_1268870 ?auto_1268869 ) ( not ( = ?auto_1268867 ?auto_1268870 ) ) ( AVAILABLE ?auto_1268870 ) ( SURFACE-AT ?auto_1268864 ?auto_1268869 ) ( ON ?auto_1268864 ?auto_1268866 ) ( CLEAR ?auto_1268864 ) ( not ( = ?auto_1268863 ?auto_1268866 ) ) ( not ( = ?auto_1268864 ?auto_1268866 ) ) ( not ( = ?auto_1268859 ?auto_1268866 ) ) ( SURFACE-AT ?auto_1268859 ?auto_1268868 ) ( CLEAR ?auto_1268859 ) ( IS-CRATE ?auto_1268863 ) ( AVAILABLE ?auto_1268867 ) ( IN ?auto_1268863 ?auto_1268865 ) ( TRUCK-AT ?auto_1268865 ?auto_1268869 ) ( ON ?auto_1268861 ?auto_1268860 ) ( ON ?auto_1268862 ?auto_1268861 ) ( ON ?auto_1268859 ?auto_1268862 ) ( not ( = ?auto_1268860 ?auto_1268861 ) ) ( not ( = ?auto_1268860 ?auto_1268862 ) ) ( not ( = ?auto_1268860 ?auto_1268859 ) ) ( not ( = ?auto_1268860 ?auto_1268863 ) ) ( not ( = ?auto_1268860 ?auto_1268864 ) ) ( not ( = ?auto_1268860 ?auto_1268866 ) ) ( not ( = ?auto_1268861 ?auto_1268862 ) ) ( not ( = ?auto_1268861 ?auto_1268859 ) ) ( not ( = ?auto_1268861 ?auto_1268863 ) ) ( not ( = ?auto_1268861 ?auto_1268864 ) ) ( not ( = ?auto_1268861 ?auto_1268866 ) ) ( not ( = ?auto_1268862 ?auto_1268859 ) ) ( not ( = ?auto_1268862 ?auto_1268863 ) ) ( not ( = ?auto_1268862 ?auto_1268864 ) ) ( not ( = ?auto_1268862 ?auto_1268866 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1268859 ?auto_1268863 ?auto_1268864 )
      ( MAKE-5CRATE-VERIFY ?auto_1268860 ?auto_1268861 ?auto_1268862 ?auto_1268859 ?auto_1268863 ?auto_1268864 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1268872 - SURFACE
      ?auto_1268873 - SURFACE
      ?auto_1268874 - SURFACE
      ?auto_1268871 - SURFACE
      ?auto_1268875 - SURFACE
      ?auto_1268877 - SURFACE
      ?auto_1268876 - SURFACE
    )
    :vars
    (
      ?auto_1268880 - HOIST
      ?auto_1268881 - PLACE
      ?auto_1268882 - PLACE
      ?auto_1268883 - HOIST
      ?auto_1268879 - SURFACE
      ?auto_1268878 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1268880 ?auto_1268881 ) ( IS-CRATE ?auto_1268876 ) ( not ( = ?auto_1268877 ?auto_1268876 ) ) ( not ( = ?auto_1268875 ?auto_1268877 ) ) ( not ( = ?auto_1268875 ?auto_1268876 ) ) ( not ( = ?auto_1268882 ?auto_1268881 ) ) ( HOIST-AT ?auto_1268883 ?auto_1268882 ) ( not ( = ?auto_1268880 ?auto_1268883 ) ) ( AVAILABLE ?auto_1268883 ) ( SURFACE-AT ?auto_1268876 ?auto_1268882 ) ( ON ?auto_1268876 ?auto_1268879 ) ( CLEAR ?auto_1268876 ) ( not ( = ?auto_1268877 ?auto_1268879 ) ) ( not ( = ?auto_1268876 ?auto_1268879 ) ) ( not ( = ?auto_1268875 ?auto_1268879 ) ) ( SURFACE-AT ?auto_1268875 ?auto_1268881 ) ( CLEAR ?auto_1268875 ) ( IS-CRATE ?auto_1268877 ) ( AVAILABLE ?auto_1268880 ) ( IN ?auto_1268877 ?auto_1268878 ) ( TRUCK-AT ?auto_1268878 ?auto_1268882 ) ( ON ?auto_1268873 ?auto_1268872 ) ( ON ?auto_1268874 ?auto_1268873 ) ( ON ?auto_1268871 ?auto_1268874 ) ( ON ?auto_1268875 ?auto_1268871 ) ( not ( = ?auto_1268872 ?auto_1268873 ) ) ( not ( = ?auto_1268872 ?auto_1268874 ) ) ( not ( = ?auto_1268872 ?auto_1268871 ) ) ( not ( = ?auto_1268872 ?auto_1268875 ) ) ( not ( = ?auto_1268872 ?auto_1268877 ) ) ( not ( = ?auto_1268872 ?auto_1268876 ) ) ( not ( = ?auto_1268872 ?auto_1268879 ) ) ( not ( = ?auto_1268873 ?auto_1268874 ) ) ( not ( = ?auto_1268873 ?auto_1268871 ) ) ( not ( = ?auto_1268873 ?auto_1268875 ) ) ( not ( = ?auto_1268873 ?auto_1268877 ) ) ( not ( = ?auto_1268873 ?auto_1268876 ) ) ( not ( = ?auto_1268873 ?auto_1268879 ) ) ( not ( = ?auto_1268874 ?auto_1268871 ) ) ( not ( = ?auto_1268874 ?auto_1268875 ) ) ( not ( = ?auto_1268874 ?auto_1268877 ) ) ( not ( = ?auto_1268874 ?auto_1268876 ) ) ( not ( = ?auto_1268874 ?auto_1268879 ) ) ( not ( = ?auto_1268871 ?auto_1268875 ) ) ( not ( = ?auto_1268871 ?auto_1268877 ) ) ( not ( = ?auto_1268871 ?auto_1268876 ) ) ( not ( = ?auto_1268871 ?auto_1268879 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1268875 ?auto_1268877 ?auto_1268876 )
      ( MAKE-6CRATE-VERIFY ?auto_1268872 ?auto_1268873 ?auto_1268874 ?auto_1268871 ?auto_1268875 ?auto_1268877 ?auto_1268876 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1268885 - SURFACE
      ?auto_1268886 - SURFACE
      ?auto_1268887 - SURFACE
      ?auto_1268884 - SURFACE
      ?auto_1268888 - SURFACE
      ?auto_1268890 - SURFACE
      ?auto_1268889 - SURFACE
      ?auto_1268891 - SURFACE
    )
    :vars
    (
      ?auto_1268894 - HOIST
      ?auto_1268895 - PLACE
      ?auto_1268896 - PLACE
      ?auto_1268897 - HOIST
      ?auto_1268893 - SURFACE
      ?auto_1268892 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1268894 ?auto_1268895 ) ( IS-CRATE ?auto_1268891 ) ( not ( = ?auto_1268889 ?auto_1268891 ) ) ( not ( = ?auto_1268890 ?auto_1268889 ) ) ( not ( = ?auto_1268890 ?auto_1268891 ) ) ( not ( = ?auto_1268896 ?auto_1268895 ) ) ( HOIST-AT ?auto_1268897 ?auto_1268896 ) ( not ( = ?auto_1268894 ?auto_1268897 ) ) ( AVAILABLE ?auto_1268897 ) ( SURFACE-AT ?auto_1268891 ?auto_1268896 ) ( ON ?auto_1268891 ?auto_1268893 ) ( CLEAR ?auto_1268891 ) ( not ( = ?auto_1268889 ?auto_1268893 ) ) ( not ( = ?auto_1268891 ?auto_1268893 ) ) ( not ( = ?auto_1268890 ?auto_1268893 ) ) ( SURFACE-AT ?auto_1268890 ?auto_1268895 ) ( CLEAR ?auto_1268890 ) ( IS-CRATE ?auto_1268889 ) ( AVAILABLE ?auto_1268894 ) ( IN ?auto_1268889 ?auto_1268892 ) ( TRUCK-AT ?auto_1268892 ?auto_1268896 ) ( ON ?auto_1268886 ?auto_1268885 ) ( ON ?auto_1268887 ?auto_1268886 ) ( ON ?auto_1268884 ?auto_1268887 ) ( ON ?auto_1268888 ?auto_1268884 ) ( ON ?auto_1268890 ?auto_1268888 ) ( not ( = ?auto_1268885 ?auto_1268886 ) ) ( not ( = ?auto_1268885 ?auto_1268887 ) ) ( not ( = ?auto_1268885 ?auto_1268884 ) ) ( not ( = ?auto_1268885 ?auto_1268888 ) ) ( not ( = ?auto_1268885 ?auto_1268890 ) ) ( not ( = ?auto_1268885 ?auto_1268889 ) ) ( not ( = ?auto_1268885 ?auto_1268891 ) ) ( not ( = ?auto_1268885 ?auto_1268893 ) ) ( not ( = ?auto_1268886 ?auto_1268887 ) ) ( not ( = ?auto_1268886 ?auto_1268884 ) ) ( not ( = ?auto_1268886 ?auto_1268888 ) ) ( not ( = ?auto_1268886 ?auto_1268890 ) ) ( not ( = ?auto_1268886 ?auto_1268889 ) ) ( not ( = ?auto_1268886 ?auto_1268891 ) ) ( not ( = ?auto_1268886 ?auto_1268893 ) ) ( not ( = ?auto_1268887 ?auto_1268884 ) ) ( not ( = ?auto_1268887 ?auto_1268888 ) ) ( not ( = ?auto_1268887 ?auto_1268890 ) ) ( not ( = ?auto_1268887 ?auto_1268889 ) ) ( not ( = ?auto_1268887 ?auto_1268891 ) ) ( not ( = ?auto_1268887 ?auto_1268893 ) ) ( not ( = ?auto_1268884 ?auto_1268888 ) ) ( not ( = ?auto_1268884 ?auto_1268890 ) ) ( not ( = ?auto_1268884 ?auto_1268889 ) ) ( not ( = ?auto_1268884 ?auto_1268891 ) ) ( not ( = ?auto_1268884 ?auto_1268893 ) ) ( not ( = ?auto_1268888 ?auto_1268890 ) ) ( not ( = ?auto_1268888 ?auto_1268889 ) ) ( not ( = ?auto_1268888 ?auto_1268891 ) ) ( not ( = ?auto_1268888 ?auto_1268893 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1268890 ?auto_1268889 ?auto_1268891 )
      ( MAKE-7CRATE-VERIFY ?auto_1268885 ?auto_1268886 ?auto_1268887 ?auto_1268884 ?auto_1268888 ?auto_1268890 ?auto_1268889 ?auto_1268891 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1268899 - SURFACE
      ?auto_1268900 - SURFACE
      ?auto_1268901 - SURFACE
      ?auto_1268898 - SURFACE
      ?auto_1268902 - SURFACE
      ?auto_1268904 - SURFACE
      ?auto_1268903 - SURFACE
      ?auto_1268905 - SURFACE
      ?auto_1268906 - SURFACE
    )
    :vars
    (
      ?auto_1268909 - HOIST
      ?auto_1268910 - PLACE
      ?auto_1268911 - PLACE
      ?auto_1268912 - HOIST
      ?auto_1268908 - SURFACE
      ?auto_1268907 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1268909 ?auto_1268910 ) ( IS-CRATE ?auto_1268906 ) ( not ( = ?auto_1268905 ?auto_1268906 ) ) ( not ( = ?auto_1268903 ?auto_1268905 ) ) ( not ( = ?auto_1268903 ?auto_1268906 ) ) ( not ( = ?auto_1268911 ?auto_1268910 ) ) ( HOIST-AT ?auto_1268912 ?auto_1268911 ) ( not ( = ?auto_1268909 ?auto_1268912 ) ) ( AVAILABLE ?auto_1268912 ) ( SURFACE-AT ?auto_1268906 ?auto_1268911 ) ( ON ?auto_1268906 ?auto_1268908 ) ( CLEAR ?auto_1268906 ) ( not ( = ?auto_1268905 ?auto_1268908 ) ) ( not ( = ?auto_1268906 ?auto_1268908 ) ) ( not ( = ?auto_1268903 ?auto_1268908 ) ) ( SURFACE-AT ?auto_1268903 ?auto_1268910 ) ( CLEAR ?auto_1268903 ) ( IS-CRATE ?auto_1268905 ) ( AVAILABLE ?auto_1268909 ) ( IN ?auto_1268905 ?auto_1268907 ) ( TRUCK-AT ?auto_1268907 ?auto_1268911 ) ( ON ?auto_1268900 ?auto_1268899 ) ( ON ?auto_1268901 ?auto_1268900 ) ( ON ?auto_1268898 ?auto_1268901 ) ( ON ?auto_1268902 ?auto_1268898 ) ( ON ?auto_1268904 ?auto_1268902 ) ( ON ?auto_1268903 ?auto_1268904 ) ( not ( = ?auto_1268899 ?auto_1268900 ) ) ( not ( = ?auto_1268899 ?auto_1268901 ) ) ( not ( = ?auto_1268899 ?auto_1268898 ) ) ( not ( = ?auto_1268899 ?auto_1268902 ) ) ( not ( = ?auto_1268899 ?auto_1268904 ) ) ( not ( = ?auto_1268899 ?auto_1268903 ) ) ( not ( = ?auto_1268899 ?auto_1268905 ) ) ( not ( = ?auto_1268899 ?auto_1268906 ) ) ( not ( = ?auto_1268899 ?auto_1268908 ) ) ( not ( = ?auto_1268900 ?auto_1268901 ) ) ( not ( = ?auto_1268900 ?auto_1268898 ) ) ( not ( = ?auto_1268900 ?auto_1268902 ) ) ( not ( = ?auto_1268900 ?auto_1268904 ) ) ( not ( = ?auto_1268900 ?auto_1268903 ) ) ( not ( = ?auto_1268900 ?auto_1268905 ) ) ( not ( = ?auto_1268900 ?auto_1268906 ) ) ( not ( = ?auto_1268900 ?auto_1268908 ) ) ( not ( = ?auto_1268901 ?auto_1268898 ) ) ( not ( = ?auto_1268901 ?auto_1268902 ) ) ( not ( = ?auto_1268901 ?auto_1268904 ) ) ( not ( = ?auto_1268901 ?auto_1268903 ) ) ( not ( = ?auto_1268901 ?auto_1268905 ) ) ( not ( = ?auto_1268901 ?auto_1268906 ) ) ( not ( = ?auto_1268901 ?auto_1268908 ) ) ( not ( = ?auto_1268898 ?auto_1268902 ) ) ( not ( = ?auto_1268898 ?auto_1268904 ) ) ( not ( = ?auto_1268898 ?auto_1268903 ) ) ( not ( = ?auto_1268898 ?auto_1268905 ) ) ( not ( = ?auto_1268898 ?auto_1268906 ) ) ( not ( = ?auto_1268898 ?auto_1268908 ) ) ( not ( = ?auto_1268902 ?auto_1268904 ) ) ( not ( = ?auto_1268902 ?auto_1268903 ) ) ( not ( = ?auto_1268902 ?auto_1268905 ) ) ( not ( = ?auto_1268902 ?auto_1268906 ) ) ( not ( = ?auto_1268902 ?auto_1268908 ) ) ( not ( = ?auto_1268904 ?auto_1268903 ) ) ( not ( = ?auto_1268904 ?auto_1268905 ) ) ( not ( = ?auto_1268904 ?auto_1268906 ) ) ( not ( = ?auto_1268904 ?auto_1268908 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1268903 ?auto_1268905 ?auto_1268906 )
      ( MAKE-8CRATE-VERIFY ?auto_1268899 ?auto_1268900 ?auto_1268901 ?auto_1268898 ?auto_1268902 ?auto_1268904 ?auto_1268903 ?auto_1268905 ?auto_1268906 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1268942 - SURFACE
      ?auto_1268943 - SURFACE
      ?auto_1268944 - SURFACE
      ?auto_1268941 - SURFACE
      ?auto_1268945 - SURFACE
    )
    :vars
    (
      ?auto_1268946 - HOIST
      ?auto_1268951 - PLACE
      ?auto_1268950 - PLACE
      ?auto_1268947 - HOIST
      ?auto_1268949 - SURFACE
      ?auto_1268948 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1268946 ?auto_1268951 ) ( IS-CRATE ?auto_1268945 ) ( not ( = ?auto_1268941 ?auto_1268945 ) ) ( not ( = ?auto_1268944 ?auto_1268941 ) ) ( not ( = ?auto_1268944 ?auto_1268945 ) ) ( not ( = ?auto_1268950 ?auto_1268951 ) ) ( HOIST-AT ?auto_1268947 ?auto_1268950 ) ( not ( = ?auto_1268946 ?auto_1268947 ) ) ( SURFACE-AT ?auto_1268945 ?auto_1268950 ) ( ON ?auto_1268945 ?auto_1268949 ) ( CLEAR ?auto_1268945 ) ( not ( = ?auto_1268941 ?auto_1268949 ) ) ( not ( = ?auto_1268945 ?auto_1268949 ) ) ( not ( = ?auto_1268944 ?auto_1268949 ) ) ( SURFACE-AT ?auto_1268944 ?auto_1268951 ) ( CLEAR ?auto_1268944 ) ( IS-CRATE ?auto_1268941 ) ( AVAILABLE ?auto_1268946 ) ( TRUCK-AT ?auto_1268948 ?auto_1268950 ) ( LIFTING ?auto_1268947 ?auto_1268941 ) ( ON ?auto_1268943 ?auto_1268942 ) ( ON ?auto_1268944 ?auto_1268943 ) ( not ( = ?auto_1268942 ?auto_1268943 ) ) ( not ( = ?auto_1268942 ?auto_1268944 ) ) ( not ( = ?auto_1268942 ?auto_1268941 ) ) ( not ( = ?auto_1268942 ?auto_1268945 ) ) ( not ( = ?auto_1268942 ?auto_1268949 ) ) ( not ( = ?auto_1268943 ?auto_1268944 ) ) ( not ( = ?auto_1268943 ?auto_1268941 ) ) ( not ( = ?auto_1268943 ?auto_1268945 ) ) ( not ( = ?auto_1268943 ?auto_1268949 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1268944 ?auto_1268941 ?auto_1268945 )
      ( MAKE-4CRATE-VERIFY ?auto_1268942 ?auto_1268943 ?auto_1268944 ?auto_1268941 ?auto_1268945 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1268953 - SURFACE
      ?auto_1268954 - SURFACE
      ?auto_1268955 - SURFACE
      ?auto_1268952 - SURFACE
      ?auto_1268956 - SURFACE
      ?auto_1268957 - SURFACE
    )
    :vars
    (
      ?auto_1268958 - HOIST
      ?auto_1268963 - PLACE
      ?auto_1268962 - PLACE
      ?auto_1268959 - HOIST
      ?auto_1268961 - SURFACE
      ?auto_1268960 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1268958 ?auto_1268963 ) ( IS-CRATE ?auto_1268957 ) ( not ( = ?auto_1268956 ?auto_1268957 ) ) ( not ( = ?auto_1268952 ?auto_1268956 ) ) ( not ( = ?auto_1268952 ?auto_1268957 ) ) ( not ( = ?auto_1268962 ?auto_1268963 ) ) ( HOIST-AT ?auto_1268959 ?auto_1268962 ) ( not ( = ?auto_1268958 ?auto_1268959 ) ) ( SURFACE-AT ?auto_1268957 ?auto_1268962 ) ( ON ?auto_1268957 ?auto_1268961 ) ( CLEAR ?auto_1268957 ) ( not ( = ?auto_1268956 ?auto_1268961 ) ) ( not ( = ?auto_1268957 ?auto_1268961 ) ) ( not ( = ?auto_1268952 ?auto_1268961 ) ) ( SURFACE-AT ?auto_1268952 ?auto_1268963 ) ( CLEAR ?auto_1268952 ) ( IS-CRATE ?auto_1268956 ) ( AVAILABLE ?auto_1268958 ) ( TRUCK-AT ?auto_1268960 ?auto_1268962 ) ( LIFTING ?auto_1268959 ?auto_1268956 ) ( ON ?auto_1268954 ?auto_1268953 ) ( ON ?auto_1268955 ?auto_1268954 ) ( ON ?auto_1268952 ?auto_1268955 ) ( not ( = ?auto_1268953 ?auto_1268954 ) ) ( not ( = ?auto_1268953 ?auto_1268955 ) ) ( not ( = ?auto_1268953 ?auto_1268952 ) ) ( not ( = ?auto_1268953 ?auto_1268956 ) ) ( not ( = ?auto_1268953 ?auto_1268957 ) ) ( not ( = ?auto_1268953 ?auto_1268961 ) ) ( not ( = ?auto_1268954 ?auto_1268955 ) ) ( not ( = ?auto_1268954 ?auto_1268952 ) ) ( not ( = ?auto_1268954 ?auto_1268956 ) ) ( not ( = ?auto_1268954 ?auto_1268957 ) ) ( not ( = ?auto_1268954 ?auto_1268961 ) ) ( not ( = ?auto_1268955 ?auto_1268952 ) ) ( not ( = ?auto_1268955 ?auto_1268956 ) ) ( not ( = ?auto_1268955 ?auto_1268957 ) ) ( not ( = ?auto_1268955 ?auto_1268961 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1268952 ?auto_1268956 ?auto_1268957 )
      ( MAKE-5CRATE-VERIFY ?auto_1268953 ?auto_1268954 ?auto_1268955 ?auto_1268952 ?auto_1268956 ?auto_1268957 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1268965 - SURFACE
      ?auto_1268966 - SURFACE
      ?auto_1268967 - SURFACE
      ?auto_1268964 - SURFACE
      ?auto_1268968 - SURFACE
      ?auto_1268970 - SURFACE
      ?auto_1268969 - SURFACE
    )
    :vars
    (
      ?auto_1268971 - HOIST
      ?auto_1268976 - PLACE
      ?auto_1268975 - PLACE
      ?auto_1268972 - HOIST
      ?auto_1268974 - SURFACE
      ?auto_1268973 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1268971 ?auto_1268976 ) ( IS-CRATE ?auto_1268969 ) ( not ( = ?auto_1268970 ?auto_1268969 ) ) ( not ( = ?auto_1268968 ?auto_1268970 ) ) ( not ( = ?auto_1268968 ?auto_1268969 ) ) ( not ( = ?auto_1268975 ?auto_1268976 ) ) ( HOIST-AT ?auto_1268972 ?auto_1268975 ) ( not ( = ?auto_1268971 ?auto_1268972 ) ) ( SURFACE-AT ?auto_1268969 ?auto_1268975 ) ( ON ?auto_1268969 ?auto_1268974 ) ( CLEAR ?auto_1268969 ) ( not ( = ?auto_1268970 ?auto_1268974 ) ) ( not ( = ?auto_1268969 ?auto_1268974 ) ) ( not ( = ?auto_1268968 ?auto_1268974 ) ) ( SURFACE-AT ?auto_1268968 ?auto_1268976 ) ( CLEAR ?auto_1268968 ) ( IS-CRATE ?auto_1268970 ) ( AVAILABLE ?auto_1268971 ) ( TRUCK-AT ?auto_1268973 ?auto_1268975 ) ( LIFTING ?auto_1268972 ?auto_1268970 ) ( ON ?auto_1268966 ?auto_1268965 ) ( ON ?auto_1268967 ?auto_1268966 ) ( ON ?auto_1268964 ?auto_1268967 ) ( ON ?auto_1268968 ?auto_1268964 ) ( not ( = ?auto_1268965 ?auto_1268966 ) ) ( not ( = ?auto_1268965 ?auto_1268967 ) ) ( not ( = ?auto_1268965 ?auto_1268964 ) ) ( not ( = ?auto_1268965 ?auto_1268968 ) ) ( not ( = ?auto_1268965 ?auto_1268970 ) ) ( not ( = ?auto_1268965 ?auto_1268969 ) ) ( not ( = ?auto_1268965 ?auto_1268974 ) ) ( not ( = ?auto_1268966 ?auto_1268967 ) ) ( not ( = ?auto_1268966 ?auto_1268964 ) ) ( not ( = ?auto_1268966 ?auto_1268968 ) ) ( not ( = ?auto_1268966 ?auto_1268970 ) ) ( not ( = ?auto_1268966 ?auto_1268969 ) ) ( not ( = ?auto_1268966 ?auto_1268974 ) ) ( not ( = ?auto_1268967 ?auto_1268964 ) ) ( not ( = ?auto_1268967 ?auto_1268968 ) ) ( not ( = ?auto_1268967 ?auto_1268970 ) ) ( not ( = ?auto_1268967 ?auto_1268969 ) ) ( not ( = ?auto_1268967 ?auto_1268974 ) ) ( not ( = ?auto_1268964 ?auto_1268968 ) ) ( not ( = ?auto_1268964 ?auto_1268970 ) ) ( not ( = ?auto_1268964 ?auto_1268969 ) ) ( not ( = ?auto_1268964 ?auto_1268974 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1268968 ?auto_1268970 ?auto_1268969 )
      ( MAKE-6CRATE-VERIFY ?auto_1268965 ?auto_1268966 ?auto_1268967 ?auto_1268964 ?auto_1268968 ?auto_1268970 ?auto_1268969 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1268978 - SURFACE
      ?auto_1268979 - SURFACE
      ?auto_1268980 - SURFACE
      ?auto_1268977 - SURFACE
      ?auto_1268981 - SURFACE
      ?auto_1268983 - SURFACE
      ?auto_1268982 - SURFACE
      ?auto_1268984 - SURFACE
    )
    :vars
    (
      ?auto_1268985 - HOIST
      ?auto_1268990 - PLACE
      ?auto_1268989 - PLACE
      ?auto_1268986 - HOIST
      ?auto_1268988 - SURFACE
      ?auto_1268987 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1268985 ?auto_1268990 ) ( IS-CRATE ?auto_1268984 ) ( not ( = ?auto_1268982 ?auto_1268984 ) ) ( not ( = ?auto_1268983 ?auto_1268982 ) ) ( not ( = ?auto_1268983 ?auto_1268984 ) ) ( not ( = ?auto_1268989 ?auto_1268990 ) ) ( HOIST-AT ?auto_1268986 ?auto_1268989 ) ( not ( = ?auto_1268985 ?auto_1268986 ) ) ( SURFACE-AT ?auto_1268984 ?auto_1268989 ) ( ON ?auto_1268984 ?auto_1268988 ) ( CLEAR ?auto_1268984 ) ( not ( = ?auto_1268982 ?auto_1268988 ) ) ( not ( = ?auto_1268984 ?auto_1268988 ) ) ( not ( = ?auto_1268983 ?auto_1268988 ) ) ( SURFACE-AT ?auto_1268983 ?auto_1268990 ) ( CLEAR ?auto_1268983 ) ( IS-CRATE ?auto_1268982 ) ( AVAILABLE ?auto_1268985 ) ( TRUCK-AT ?auto_1268987 ?auto_1268989 ) ( LIFTING ?auto_1268986 ?auto_1268982 ) ( ON ?auto_1268979 ?auto_1268978 ) ( ON ?auto_1268980 ?auto_1268979 ) ( ON ?auto_1268977 ?auto_1268980 ) ( ON ?auto_1268981 ?auto_1268977 ) ( ON ?auto_1268983 ?auto_1268981 ) ( not ( = ?auto_1268978 ?auto_1268979 ) ) ( not ( = ?auto_1268978 ?auto_1268980 ) ) ( not ( = ?auto_1268978 ?auto_1268977 ) ) ( not ( = ?auto_1268978 ?auto_1268981 ) ) ( not ( = ?auto_1268978 ?auto_1268983 ) ) ( not ( = ?auto_1268978 ?auto_1268982 ) ) ( not ( = ?auto_1268978 ?auto_1268984 ) ) ( not ( = ?auto_1268978 ?auto_1268988 ) ) ( not ( = ?auto_1268979 ?auto_1268980 ) ) ( not ( = ?auto_1268979 ?auto_1268977 ) ) ( not ( = ?auto_1268979 ?auto_1268981 ) ) ( not ( = ?auto_1268979 ?auto_1268983 ) ) ( not ( = ?auto_1268979 ?auto_1268982 ) ) ( not ( = ?auto_1268979 ?auto_1268984 ) ) ( not ( = ?auto_1268979 ?auto_1268988 ) ) ( not ( = ?auto_1268980 ?auto_1268977 ) ) ( not ( = ?auto_1268980 ?auto_1268981 ) ) ( not ( = ?auto_1268980 ?auto_1268983 ) ) ( not ( = ?auto_1268980 ?auto_1268982 ) ) ( not ( = ?auto_1268980 ?auto_1268984 ) ) ( not ( = ?auto_1268980 ?auto_1268988 ) ) ( not ( = ?auto_1268977 ?auto_1268981 ) ) ( not ( = ?auto_1268977 ?auto_1268983 ) ) ( not ( = ?auto_1268977 ?auto_1268982 ) ) ( not ( = ?auto_1268977 ?auto_1268984 ) ) ( not ( = ?auto_1268977 ?auto_1268988 ) ) ( not ( = ?auto_1268981 ?auto_1268983 ) ) ( not ( = ?auto_1268981 ?auto_1268982 ) ) ( not ( = ?auto_1268981 ?auto_1268984 ) ) ( not ( = ?auto_1268981 ?auto_1268988 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1268983 ?auto_1268982 ?auto_1268984 )
      ( MAKE-7CRATE-VERIFY ?auto_1268978 ?auto_1268979 ?auto_1268980 ?auto_1268977 ?auto_1268981 ?auto_1268983 ?auto_1268982 ?auto_1268984 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1268992 - SURFACE
      ?auto_1268993 - SURFACE
      ?auto_1268994 - SURFACE
      ?auto_1268991 - SURFACE
      ?auto_1268995 - SURFACE
      ?auto_1268997 - SURFACE
      ?auto_1268996 - SURFACE
      ?auto_1268998 - SURFACE
      ?auto_1268999 - SURFACE
    )
    :vars
    (
      ?auto_1269000 - HOIST
      ?auto_1269005 - PLACE
      ?auto_1269004 - PLACE
      ?auto_1269001 - HOIST
      ?auto_1269003 - SURFACE
      ?auto_1269002 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1269000 ?auto_1269005 ) ( IS-CRATE ?auto_1268999 ) ( not ( = ?auto_1268998 ?auto_1268999 ) ) ( not ( = ?auto_1268996 ?auto_1268998 ) ) ( not ( = ?auto_1268996 ?auto_1268999 ) ) ( not ( = ?auto_1269004 ?auto_1269005 ) ) ( HOIST-AT ?auto_1269001 ?auto_1269004 ) ( not ( = ?auto_1269000 ?auto_1269001 ) ) ( SURFACE-AT ?auto_1268999 ?auto_1269004 ) ( ON ?auto_1268999 ?auto_1269003 ) ( CLEAR ?auto_1268999 ) ( not ( = ?auto_1268998 ?auto_1269003 ) ) ( not ( = ?auto_1268999 ?auto_1269003 ) ) ( not ( = ?auto_1268996 ?auto_1269003 ) ) ( SURFACE-AT ?auto_1268996 ?auto_1269005 ) ( CLEAR ?auto_1268996 ) ( IS-CRATE ?auto_1268998 ) ( AVAILABLE ?auto_1269000 ) ( TRUCK-AT ?auto_1269002 ?auto_1269004 ) ( LIFTING ?auto_1269001 ?auto_1268998 ) ( ON ?auto_1268993 ?auto_1268992 ) ( ON ?auto_1268994 ?auto_1268993 ) ( ON ?auto_1268991 ?auto_1268994 ) ( ON ?auto_1268995 ?auto_1268991 ) ( ON ?auto_1268997 ?auto_1268995 ) ( ON ?auto_1268996 ?auto_1268997 ) ( not ( = ?auto_1268992 ?auto_1268993 ) ) ( not ( = ?auto_1268992 ?auto_1268994 ) ) ( not ( = ?auto_1268992 ?auto_1268991 ) ) ( not ( = ?auto_1268992 ?auto_1268995 ) ) ( not ( = ?auto_1268992 ?auto_1268997 ) ) ( not ( = ?auto_1268992 ?auto_1268996 ) ) ( not ( = ?auto_1268992 ?auto_1268998 ) ) ( not ( = ?auto_1268992 ?auto_1268999 ) ) ( not ( = ?auto_1268992 ?auto_1269003 ) ) ( not ( = ?auto_1268993 ?auto_1268994 ) ) ( not ( = ?auto_1268993 ?auto_1268991 ) ) ( not ( = ?auto_1268993 ?auto_1268995 ) ) ( not ( = ?auto_1268993 ?auto_1268997 ) ) ( not ( = ?auto_1268993 ?auto_1268996 ) ) ( not ( = ?auto_1268993 ?auto_1268998 ) ) ( not ( = ?auto_1268993 ?auto_1268999 ) ) ( not ( = ?auto_1268993 ?auto_1269003 ) ) ( not ( = ?auto_1268994 ?auto_1268991 ) ) ( not ( = ?auto_1268994 ?auto_1268995 ) ) ( not ( = ?auto_1268994 ?auto_1268997 ) ) ( not ( = ?auto_1268994 ?auto_1268996 ) ) ( not ( = ?auto_1268994 ?auto_1268998 ) ) ( not ( = ?auto_1268994 ?auto_1268999 ) ) ( not ( = ?auto_1268994 ?auto_1269003 ) ) ( not ( = ?auto_1268991 ?auto_1268995 ) ) ( not ( = ?auto_1268991 ?auto_1268997 ) ) ( not ( = ?auto_1268991 ?auto_1268996 ) ) ( not ( = ?auto_1268991 ?auto_1268998 ) ) ( not ( = ?auto_1268991 ?auto_1268999 ) ) ( not ( = ?auto_1268991 ?auto_1269003 ) ) ( not ( = ?auto_1268995 ?auto_1268997 ) ) ( not ( = ?auto_1268995 ?auto_1268996 ) ) ( not ( = ?auto_1268995 ?auto_1268998 ) ) ( not ( = ?auto_1268995 ?auto_1268999 ) ) ( not ( = ?auto_1268995 ?auto_1269003 ) ) ( not ( = ?auto_1268997 ?auto_1268996 ) ) ( not ( = ?auto_1268997 ?auto_1268998 ) ) ( not ( = ?auto_1268997 ?auto_1268999 ) ) ( not ( = ?auto_1268997 ?auto_1269003 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1268996 ?auto_1268998 ?auto_1268999 )
      ( MAKE-8CRATE-VERIFY ?auto_1268992 ?auto_1268993 ?auto_1268994 ?auto_1268991 ?auto_1268995 ?auto_1268997 ?auto_1268996 ?auto_1268998 ?auto_1268999 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1269038 - SURFACE
      ?auto_1269039 - SURFACE
      ?auto_1269040 - SURFACE
      ?auto_1269037 - SURFACE
      ?auto_1269041 - SURFACE
    )
    :vars
    (
      ?auto_1269042 - HOIST
      ?auto_1269047 - PLACE
      ?auto_1269044 - PLACE
      ?auto_1269048 - HOIST
      ?auto_1269045 - SURFACE
      ?auto_1269046 - TRUCK
      ?auto_1269043 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1269042 ?auto_1269047 ) ( IS-CRATE ?auto_1269041 ) ( not ( = ?auto_1269037 ?auto_1269041 ) ) ( not ( = ?auto_1269040 ?auto_1269037 ) ) ( not ( = ?auto_1269040 ?auto_1269041 ) ) ( not ( = ?auto_1269044 ?auto_1269047 ) ) ( HOIST-AT ?auto_1269048 ?auto_1269044 ) ( not ( = ?auto_1269042 ?auto_1269048 ) ) ( SURFACE-AT ?auto_1269041 ?auto_1269044 ) ( ON ?auto_1269041 ?auto_1269045 ) ( CLEAR ?auto_1269041 ) ( not ( = ?auto_1269037 ?auto_1269045 ) ) ( not ( = ?auto_1269041 ?auto_1269045 ) ) ( not ( = ?auto_1269040 ?auto_1269045 ) ) ( SURFACE-AT ?auto_1269040 ?auto_1269047 ) ( CLEAR ?auto_1269040 ) ( IS-CRATE ?auto_1269037 ) ( AVAILABLE ?auto_1269042 ) ( TRUCK-AT ?auto_1269046 ?auto_1269044 ) ( AVAILABLE ?auto_1269048 ) ( SURFACE-AT ?auto_1269037 ?auto_1269044 ) ( ON ?auto_1269037 ?auto_1269043 ) ( CLEAR ?auto_1269037 ) ( not ( = ?auto_1269037 ?auto_1269043 ) ) ( not ( = ?auto_1269041 ?auto_1269043 ) ) ( not ( = ?auto_1269040 ?auto_1269043 ) ) ( not ( = ?auto_1269045 ?auto_1269043 ) ) ( ON ?auto_1269039 ?auto_1269038 ) ( ON ?auto_1269040 ?auto_1269039 ) ( not ( = ?auto_1269038 ?auto_1269039 ) ) ( not ( = ?auto_1269038 ?auto_1269040 ) ) ( not ( = ?auto_1269038 ?auto_1269037 ) ) ( not ( = ?auto_1269038 ?auto_1269041 ) ) ( not ( = ?auto_1269038 ?auto_1269045 ) ) ( not ( = ?auto_1269038 ?auto_1269043 ) ) ( not ( = ?auto_1269039 ?auto_1269040 ) ) ( not ( = ?auto_1269039 ?auto_1269037 ) ) ( not ( = ?auto_1269039 ?auto_1269041 ) ) ( not ( = ?auto_1269039 ?auto_1269045 ) ) ( not ( = ?auto_1269039 ?auto_1269043 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1269040 ?auto_1269037 ?auto_1269041 )
      ( MAKE-4CRATE-VERIFY ?auto_1269038 ?auto_1269039 ?auto_1269040 ?auto_1269037 ?auto_1269041 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1269050 - SURFACE
      ?auto_1269051 - SURFACE
      ?auto_1269052 - SURFACE
      ?auto_1269049 - SURFACE
      ?auto_1269053 - SURFACE
      ?auto_1269054 - SURFACE
    )
    :vars
    (
      ?auto_1269055 - HOIST
      ?auto_1269060 - PLACE
      ?auto_1269057 - PLACE
      ?auto_1269061 - HOIST
      ?auto_1269058 - SURFACE
      ?auto_1269059 - TRUCK
      ?auto_1269056 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1269055 ?auto_1269060 ) ( IS-CRATE ?auto_1269054 ) ( not ( = ?auto_1269053 ?auto_1269054 ) ) ( not ( = ?auto_1269049 ?auto_1269053 ) ) ( not ( = ?auto_1269049 ?auto_1269054 ) ) ( not ( = ?auto_1269057 ?auto_1269060 ) ) ( HOIST-AT ?auto_1269061 ?auto_1269057 ) ( not ( = ?auto_1269055 ?auto_1269061 ) ) ( SURFACE-AT ?auto_1269054 ?auto_1269057 ) ( ON ?auto_1269054 ?auto_1269058 ) ( CLEAR ?auto_1269054 ) ( not ( = ?auto_1269053 ?auto_1269058 ) ) ( not ( = ?auto_1269054 ?auto_1269058 ) ) ( not ( = ?auto_1269049 ?auto_1269058 ) ) ( SURFACE-AT ?auto_1269049 ?auto_1269060 ) ( CLEAR ?auto_1269049 ) ( IS-CRATE ?auto_1269053 ) ( AVAILABLE ?auto_1269055 ) ( TRUCK-AT ?auto_1269059 ?auto_1269057 ) ( AVAILABLE ?auto_1269061 ) ( SURFACE-AT ?auto_1269053 ?auto_1269057 ) ( ON ?auto_1269053 ?auto_1269056 ) ( CLEAR ?auto_1269053 ) ( not ( = ?auto_1269053 ?auto_1269056 ) ) ( not ( = ?auto_1269054 ?auto_1269056 ) ) ( not ( = ?auto_1269049 ?auto_1269056 ) ) ( not ( = ?auto_1269058 ?auto_1269056 ) ) ( ON ?auto_1269051 ?auto_1269050 ) ( ON ?auto_1269052 ?auto_1269051 ) ( ON ?auto_1269049 ?auto_1269052 ) ( not ( = ?auto_1269050 ?auto_1269051 ) ) ( not ( = ?auto_1269050 ?auto_1269052 ) ) ( not ( = ?auto_1269050 ?auto_1269049 ) ) ( not ( = ?auto_1269050 ?auto_1269053 ) ) ( not ( = ?auto_1269050 ?auto_1269054 ) ) ( not ( = ?auto_1269050 ?auto_1269058 ) ) ( not ( = ?auto_1269050 ?auto_1269056 ) ) ( not ( = ?auto_1269051 ?auto_1269052 ) ) ( not ( = ?auto_1269051 ?auto_1269049 ) ) ( not ( = ?auto_1269051 ?auto_1269053 ) ) ( not ( = ?auto_1269051 ?auto_1269054 ) ) ( not ( = ?auto_1269051 ?auto_1269058 ) ) ( not ( = ?auto_1269051 ?auto_1269056 ) ) ( not ( = ?auto_1269052 ?auto_1269049 ) ) ( not ( = ?auto_1269052 ?auto_1269053 ) ) ( not ( = ?auto_1269052 ?auto_1269054 ) ) ( not ( = ?auto_1269052 ?auto_1269058 ) ) ( not ( = ?auto_1269052 ?auto_1269056 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1269049 ?auto_1269053 ?auto_1269054 )
      ( MAKE-5CRATE-VERIFY ?auto_1269050 ?auto_1269051 ?auto_1269052 ?auto_1269049 ?auto_1269053 ?auto_1269054 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1269063 - SURFACE
      ?auto_1269064 - SURFACE
      ?auto_1269065 - SURFACE
      ?auto_1269062 - SURFACE
      ?auto_1269066 - SURFACE
      ?auto_1269068 - SURFACE
      ?auto_1269067 - SURFACE
    )
    :vars
    (
      ?auto_1269069 - HOIST
      ?auto_1269074 - PLACE
      ?auto_1269071 - PLACE
      ?auto_1269075 - HOIST
      ?auto_1269072 - SURFACE
      ?auto_1269073 - TRUCK
      ?auto_1269070 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1269069 ?auto_1269074 ) ( IS-CRATE ?auto_1269067 ) ( not ( = ?auto_1269068 ?auto_1269067 ) ) ( not ( = ?auto_1269066 ?auto_1269068 ) ) ( not ( = ?auto_1269066 ?auto_1269067 ) ) ( not ( = ?auto_1269071 ?auto_1269074 ) ) ( HOIST-AT ?auto_1269075 ?auto_1269071 ) ( not ( = ?auto_1269069 ?auto_1269075 ) ) ( SURFACE-AT ?auto_1269067 ?auto_1269071 ) ( ON ?auto_1269067 ?auto_1269072 ) ( CLEAR ?auto_1269067 ) ( not ( = ?auto_1269068 ?auto_1269072 ) ) ( not ( = ?auto_1269067 ?auto_1269072 ) ) ( not ( = ?auto_1269066 ?auto_1269072 ) ) ( SURFACE-AT ?auto_1269066 ?auto_1269074 ) ( CLEAR ?auto_1269066 ) ( IS-CRATE ?auto_1269068 ) ( AVAILABLE ?auto_1269069 ) ( TRUCK-AT ?auto_1269073 ?auto_1269071 ) ( AVAILABLE ?auto_1269075 ) ( SURFACE-AT ?auto_1269068 ?auto_1269071 ) ( ON ?auto_1269068 ?auto_1269070 ) ( CLEAR ?auto_1269068 ) ( not ( = ?auto_1269068 ?auto_1269070 ) ) ( not ( = ?auto_1269067 ?auto_1269070 ) ) ( not ( = ?auto_1269066 ?auto_1269070 ) ) ( not ( = ?auto_1269072 ?auto_1269070 ) ) ( ON ?auto_1269064 ?auto_1269063 ) ( ON ?auto_1269065 ?auto_1269064 ) ( ON ?auto_1269062 ?auto_1269065 ) ( ON ?auto_1269066 ?auto_1269062 ) ( not ( = ?auto_1269063 ?auto_1269064 ) ) ( not ( = ?auto_1269063 ?auto_1269065 ) ) ( not ( = ?auto_1269063 ?auto_1269062 ) ) ( not ( = ?auto_1269063 ?auto_1269066 ) ) ( not ( = ?auto_1269063 ?auto_1269068 ) ) ( not ( = ?auto_1269063 ?auto_1269067 ) ) ( not ( = ?auto_1269063 ?auto_1269072 ) ) ( not ( = ?auto_1269063 ?auto_1269070 ) ) ( not ( = ?auto_1269064 ?auto_1269065 ) ) ( not ( = ?auto_1269064 ?auto_1269062 ) ) ( not ( = ?auto_1269064 ?auto_1269066 ) ) ( not ( = ?auto_1269064 ?auto_1269068 ) ) ( not ( = ?auto_1269064 ?auto_1269067 ) ) ( not ( = ?auto_1269064 ?auto_1269072 ) ) ( not ( = ?auto_1269064 ?auto_1269070 ) ) ( not ( = ?auto_1269065 ?auto_1269062 ) ) ( not ( = ?auto_1269065 ?auto_1269066 ) ) ( not ( = ?auto_1269065 ?auto_1269068 ) ) ( not ( = ?auto_1269065 ?auto_1269067 ) ) ( not ( = ?auto_1269065 ?auto_1269072 ) ) ( not ( = ?auto_1269065 ?auto_1269070 ) ) ( not ( = ?auto_1269062 ?auto_1269066 ) ) ( not ( = ?auto_1269062 ?auto_1269068 ) ) ( not ( = ?auto_1269062 ?auto_1269067 ) ) ( not ( = ?auto_1269062 ?auto_1269072 ) ) ( not ( = ?auto_1269062 ?auto_1269070 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1269066 ?auto_1269068 ?auto_1269067 )
      ( MAKE-6CRATE-VERIFY ?auto_1269063 ?auto_1269064 ?auto_1269065 ?auto_1269062 ?auto_1269066 ?auto_1269068 ?auto_1269067 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1269077 - SURFACE
      ?auto_1269078 - SURFACE
      ?auto_1269079 - SURFACE
      ?auto_1269076 - SURFACE
      ?auto_1269080 - SURFACE
      ?auto_1269082 - SURFACE
      ?auto_1269081 - SURFACE
      ?auto_1269083 - SURFACE
    )
    :vars
    (
      ?auto_1269084 - HOIST
      ?auto_1269089 - PLACE
      ?auto_1269086 - PLACE
      ?auto_1269090 - HOIST
      ?auto_1269087 - SURFACE
      ?auto_1269088 - TRUCK
      ?auto_1269085 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1269084 ?auto_1269089 ) ( IS-CRATE ?auto_1269083 ) ( not ( = ?auto_1269081 ?auto_1269083 ) ) ( not ( = ?auto_1269082 ?auto_1269081 ) ) ( not ( = ?auto_1269082 ?auto_1269083 ) ) ( not ( = ?auto_1269086 ?auto_1269089 ) ) ( HOIST-AT ?auto_1269090 ?auto_1269086 ) ( not ( = ?auto_1269084 ?auto_1269090 ) ) ( SURFACE-AT ?auto_1269083 ?auto_1269086 ) ( ON ?auto_1269083 ?auto_1269087 ) ( CLEAR ?auto_1269083 ) ( not ( = ?auto_1269081 ?auto_1269087 ) ) ( not ( = ?auto_1269083 ?auto_1269087 ) ) ( not ( = ?auto_1269082 ?auto_1269087 ) ) ( SURFACE-AT ?auto_1269082 ?auto_1269089 ) ( CLEAR ?auto_1269082 ) ( IS-CRATE ?auto_1269081 ) ( AVAILABLE ?auto_1269084 ) ( TRUCK-AT ?auto_1269088 ?auto_1269086 ) ( AVAILABLE ?auto_1269090 ) ( SURFACE-AT ?auto_1269081 ?auto_1269086 ) ( ON ?auto_1269081 ?auto_1269085 ) ( CLEAR ?auto_1269081 ) ( not ( = ?auto_1269081 ?auto_1269085 ) ) ( not ( = ?auto_1269083 ?auto_1269085 ) ) ( not ( = ?auto_1269082 ?auto_1269085 ) ) ( not ( = ?auto_1269087 ?auto_1269085 ) ) ( ON ?auto_1269078 ?auto_1269077 ) ( ON ?auto_1269079 ?auto_1269078 ) ( ON ?auto_1269076 ?auto_1269079 ) ( ON ?auto_1269080 ?auto_1269076 ) ( ON ?auto_1269082 ?auto_1269080 ) ( not ( = ?auto_1269077 ?auto_1269078 ) ) ( not ( = ?auto_1269077 ?auto_1269079 ) ) ( not ( = ?auto_1269077 ?auto_1269076 ) ) ( not ( = ?auto_1269077 ?auto_1269080 ) ) ( not ( = ?auto_1269077 ?auto_1269082 ) ) ( not ( = ?auto_1269077 ?auto_1269081 ) ) ( not ( = ?auto_1269077 ?auto_1269083 ) ) ( not ( = ?auto_1269077 ?auto_1269087 ) ) ( not ( = ?auto_1269077 ?auto_1269085 ) ) ( not ( = ?auto_1269078 ?auto_1269079 ) ) ( not ( = ?auto_1269078 ?auto_1269076 ) ) ( not ( = ?auto_1269078 ?auto_1269080 ) ) ( not ( = ?auto_1269078 ?auto_1269082 ) ) ( not ( = ?auto_1269078 ?auto_1269081 ) ) ( not ( = ?auto_1269078 ?auto_1269083 ) ) ( not ( = ?auto_1269078 ?auto_1269087 ) ) ( not ( = ?auto_1269078 ?auto_1269085 ) ) ( not ( = ?auto_1269079 ?auto_1269076 ) ) ( not ( = ?auto_1269079 ?auto_1269080 ) ) ( not ( = ?auto_1269079 ?auto_1269082 ) ) ( not ( = ?auto_1269079 ?auto_1269081 ) ) ( not ( = ?auto_1269079 ?auto_1269083 ) ) ( not ( = ?auto_1269079 ?auto_1269087 ) ) ( not ( = ?auto_1269079 ?auto_1269085 ) ) ( not ( = ?auto_1269076 ?auto_1269080 ) ) ( not ( = ?auto_1269076 ?auto_1269082 ) ) ( not ( = ?auto_1269076 ?auto_1269081 ) ) ( not ( = ?auto_1269076 ?auto_1269083 ) ) ( not ( = ?auto_1269076 ?auto_1269087 ) ) ( not ( = ?auto_1269076 ?auto_1269085 ) ) ( not ( = ?auto_1269080 ?auto_1269082 ) ) ( not ( = ?auto_1269080 ?auto_1269081 ) ) ( not ( = ?auto_1269080 ?auto_1269083 ) ) ( not ( = ?auto_1269080 ?auto_1269087 ) ) ( not ( = ?auto_1269080 ?auto_1269085 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1269082 ?auto_1269081 ?auto_1269083 )
      ( MAKE-7CRATE-VERIFY ?auto_1269077 ?auto_1269078 ?auto_1269079 ?auto_1269076 ?auto_1269080 ?auto_1269082 ?auto_1269081 ?auto_1269083 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1269092 - SURFACE
      ?auto_1269093 - SURFACE
      ?auto_1269094 - SURFACE
      ?auto_1269091 - SURFACE
      ?auto_1269095 - SURFACE
      ?auto_1269097 - SURFACE
      ?auto_1269096 - SURFACE
      ?auto_1269098 - SURFACE
      ?auto_1269099 - SURFACE
    )
    :vars
    (
      ?auto_1269100 - HOIST
      ?auto_1269105 - PLACE
      ?auto_1269102 - PLACE
      ?auto_1269106 - HOIST
      ?auto_1269103 - SURFACE
      ?auto_1269104 - TRUCK
      ?auto_1269101 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1269100 ?auto_1269105 ) ( IS-CRATE ?auto_1269099 ) ( not ( = ?auto_1269098 ?auto_1269099 ) ) ( not ( = ?auto_1269096 ?auto_1269098 ) ) ( not ( = ?auto_1269096 ?auto_1269099 ) ) ( not ( = ?auto_1269102 ?auto_1269105 ) ) ( HOIST-AT ?auto_1269106 ?auto_1269102 ) ( not ( = ?auto_1269100 ?auto_1269106 ) ) ( SURFACE-AT ?auto_1269099 ?auto_1269102 ) ( ON ?auto_1269099 ?auto_1269103 ) ( CLEAR ?auto_1269099 ) ( not ( = ?auto_1269098 ?auto_1269103 ) ) ( not ( = ?auto_1269099 ?auto_1269103 ) ) ( not ( = ?auto_1269096 ?auto_1269103 ) ) ( SURFACE-AT ?auto_1269096 ?auto_1269105 ) ( CLEAR ?auto_1269096 ) ( IS-CRATE ?auto_1269098 ) ( AVAILABLE ?auto_1269100 ) ( TRUCK-AT ?auto_1269104 ?auto_1269102 ) ( AVAILABLE ?auto_1269106 ) ( SURFACE-AT ?auto_1269098 ?auto_1269102 ) ( ON ?auto_1269098 ?auto_1269101 ) ( CLEAR ?auto_1269098 ) ( not ( = ?auto_1269098 ?auto_1269101 ) ) ( not ( = ?auto_1269099 ?auto_1269101 ) ) ( not ( = ?auto_1269096 ?auto_1269101 ) ) ( not ( = ?auto_1269103 ?auto_1269101 ) ) ( ON ?auto_1269093 ?auto_1269092 ) ( ON ?auto_1269094 ?auto_1269093 ) ( ON ?auto_1269091 ?auto_1269094 ) ( ON ?auto_1269095 ?auto_1269091 ) ( ON ?auto_1269097 ?auto_1269095 ) ( ON ?auto_1269096 ?auto_1269097 ) ( not ( = ?auto_1269092 ?auto_1269093 ) ) ( not ( = ?auto_1269092 ?auto_1269094 ) ) ( not ( = ?auto_1269092 ?auto_1269091 ) ) ( not ( = ?auto_1269092 ?auto_1269095 ) ) ( not ( = ?auto_1269092 ?auto_1269097 ) ) ( not ( = ?auto_1269092 ?auto_1269096 ) ) ( not ( = ?auto_1269092 ?auto_1269098 ) ) ( not ( = ?auto_1269092 ?auto_1269099 ) ) ( not ( = ?auto_1269092 ?auto_1269103 ) ) ( not ( = ?auto_1269092 ?auto_1269101 ) ) ( not ( = ?auto_1269093 ?auto_1269094 ) ) ( not ( = ?auto_1269093 ?auto_1269091 ) ) ( not ( = ?auto_1269093 ?auto_1269095 ) ) ( not ( = ?auto_1269093 ?auto_1269097 ) ) ( not ( = ?auto_1269093 ?auto_1269096 ) ) ( not ( = ?auto_1269093 ?auto_1269098 ) ) ( not ( = ?auto_1269093 ?auto_1269099 ) ) ( not ( = ?auto_1269093 ?auto_1269103 ) ) ( not ( = ?auto_1269093 ?auto_1269101 ) ) ( not ( = ?auto_1269094 ?auto_1269091 ) ) ( not ( = ?auto_1269094 ?auto_1269095 ) ) ( not ( = ?auto_1269094 ?auto_1269097 ) ) ( not ( = ?auto_1269094 ?auto_1269096 ) ) ( not ( = ?auto_1269094 ?auto_1269098 ) ) ( not ( = ?auto_1269094 ?auto_1269099 ) ) ( not ( = ?auto_1269094 ?auto_1269103 ) ) ( not ( = ?auto_1269094 ?auto_1269101 ) ) ( not ( = ?auto_1269091 ?auto_1269095 ) ) ( not ( = ?auto_1269091 ?auto_1269097 ) ) ( not ( = ?auto_1269091 ?auto_1269096 ) ) ( not ( = ?auto_1269091 ?auto_1269098 ) ) ( not ( = ?auto_1269091 ?auto_1269099 ) ) ( not ( = ?auto_1269091 ?auto_1269103 ) ) ( not ( = ?auto_1269091 ?auto_1269101 ) ) ( not ( = ?auto_1269095 ?auto_1269097 ) ) ( not ( = ?auto_1269095 ?auto_1269096 ) ) ( not ( = ?auto_1269095 ?auto_1269098 ) ) ( not ( = ?auto_1269095 ?auto_1269099 ) ) ( not ( = ?auto_1269095 ?auto_1269103 ) ) ( not ( = ?auto_1269095 ?auto_1269101 ) ) ( not ( = ?auto_1269097 ?auto_1269096 ) ) ( not ( = ?auto_1269097 ?auto_1269098 ) ) ( not ( = ?auto_1269097 ?auto_1269099 ) ) ( not ( = ?auto_1269097 ?auto_1269103 ) ) ( not ( = ?auto_1269097 ?auto_1269101 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1269096 ?auto_1269098 ?auto_1269099 )
      ( MAKE-8CRATE-VERIFY ?auto_1269092 ?auto_1269093 ?auto_1269094 ?auto_1269091 ?auto_1269095 ?auto_1269097 ?auto_1269096 ?auto_1269098 ?auto_1269099 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1269139 - SURFACE
      ?auto_1269140 - SURFACE
      ?auto_1269141 - SURFACE
      ?auto_1269138 - SURFACE
      ?auto_1269142 - SURFACE
    )
    :vars
    (
      ?auto_1269148 - HOIST
      ?auto_1269144 - PLACE
      ?auto_1269149 - PLACE
      ?auto_1269146 - HOIST
      ?auto_1269147 - SURFACE
      ?auto_1269145 - SURFACE
      ?auto_1269143 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1269148 ?auto_1269144 ) ( IS-CRATE ?auto_1269142 ) ( not ( = ?auto_1269138 ?auto_1269142 ) ) ( not ( = ?auto_1269141 ?auto_1269138 ) ) ( not ( = ?auto_1269141 ?auto_1269142 ) ) ( not ( = ?auto_1269149 ?auto_1269144 ) ) ( HOIST-AT ?auto_1269146 ?auto_1269149 ) ( not ( = ?auto_1269148 ?auto_1269146 ) ) ( SURFACE-AT ?auto_1269142 ?auto_1269149 ) ( ON ?auto_1269142 ?auto_1269147 ) ( CLEAR ?auto_1269142 ) ( not ( = ?auto_1269138 ?auto_1269147 ) ) ( not ( = ?auto_1269142 ?auto_1269147 ) ) ( not ( = ?auto_1269141 ?auto_1269147 ) ) ( SURFACE-AT ?auto_1269141 ?auto_1269144 ) ( CLEAR ?auto_1269141 ) ( IS-CRATE ?auto_1269138 ) ( AVAILABLE ?auto_1269148 ) ( AVAILABLE ?auto_1269146 ) ( SURFACE-AT ?auto_1269138 ?auto_1269149 ) ( ON ?auto_1269138 ?auto_1269145 ) ( CLEAR ?auto_1269138 ) ( not ( = ?auto_1269138 ?auto_1269145 ) ) ( not ( = ?auto_1269142 ?auto_1269145 ) ) ( not ( = ?auto_1269141 ?auto_1269145 ) ) ( not ( = ?auto_1269147 ?auto_1269145 ) ) ( TRUCK-AT ?auto_1269143 ?auto_1269144 ) ( ON ?auto_1269140 ?auto_1269139 ) ( ON ?auto_1269141 ?auto_1269140 ) ( not ( = ?auto_1269139 ?auto_1269140 ) ) ( not ( = ?auto_1269139 ?auto_1269141 ) ) ( not ( = ?auto_1269139 ?auto_1269138 ) ) ( not ( = ?auto_1269139 ?auto_1269142 ) ) ( not ( = ?auto_1269139 ?auto_1269147 ) ) ( not ( = ?auto_1269139 ?auto_1269145 ) ) ( not ( = ?auto_1269140 ?auto_1269141 ) ) ( not ( = ?auto_1269140 ?auto_1269138 ) ) ( not ( = ?auto_1269140 ?auto_1269142 ) ) ( not ( = ?auto_1269140 ?auto_1269147 ) ) ( not ( = ?auto_1269140 ?auto_1269145 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1269141 ?auto_1269138 ?auto_1269142 )
      ( MAKE-4CRATE-VERIFY ?auto_1269139 ?auto_1269140 ?auto_1269141 ?auto_1269138 ?auto_1269142 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1269151 - SURFACE
      ?auto_1269152 - SURFACE
      ?auto_1269153 - SURFACE
      ?auto_1269150 - SURFACE
      ?auto_1269154 - SURFACE
      ?auto_1269155 - SURFACE
    )
    :vars
    (
      ?auto_1269161 - HOIST
      ?auto_1269157 - PLACE
      ?auto_1269162 - PLACE
      ?auto_1269159 - HOIST
      ?auto_1269160 - SURFACE
      ?auto_1269158 - SURFACE
      ?auto_1269156 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1269161 ?auto_1269157 ) ( IS-CRATE ?auto_1269155 ) ( not ( = ?auto_1269154 ?auto_1269155 ) ) ( not ( = ?auto_1269150 ?auto_1269154 ) ) ( not ( = ?auto_1269150 ?auto_1269155 ) ) ( not ( = ?auto_1269162 ?auto_1269157 ) ) ( HOIST-AT ?auto_1269159 ?auto_1269162 ) ( not ( = ?auto_1269161 ?auto_1269159 ) ) ( SURFACE-AT ?auto_1269155 ?auto_1269162 ) ( ON ?auto_1269155 ?auto_1269160 ) ( CLEAR ?auto_1269155 ) ( not ( = ?auto_1269154 ?auto_1269160 ) ) ( not ( = ?auto_1269155 ?auto_1269160 ) ) ( not ( = ?auto_1269150 ?auto_1269160 ) ) ( SURFACE-AT ?auto_1269150 ?auto_1269157 ) ( CLEAR ?auto_1269150 ) ( IS-CRATE ?auto_1269154 ) ( AVAILABLE ?auto_1269161 ) ( AVAILABLE ?auto_1269159 ) ( SURFACE-AT ?auto_1269154 ?auto_1269162 ) ( ON ?auto_1269154 ?auto_1269158 ) ( CLEAR ?auto_1269154 ) ( not ( = ?auto_1269154 ?auto_1269158 ) ) ( not ( = ?auto_1269155 ?auto_1269158 ) ) ( not ( = ?auto_1269150 ?auto_1269158 ) ) ( not ( = ?auto_1269160 ?auto_1269158 ) ) ( TRUCK-AT ?auto_1269156 ?auto_1269157 ) ( ON ?auto_1269152 ?auto_1269151 ) ( ON ?auto_1269153 ?auto_1269152 ) ( ON ?auto_1269150 ?auto_1269153 ) ( not ( = ?auto_1269151 ?auto_1269152 ) ) ( not ( = ?auto_1269151 ?auto_1269153 ) ) ( not ( = ?auto_1269151 ?auto_1269150 ) ) ( not ( = ?auto_1269151 ?auto_1269154 ) ) ( not ( = ?auto_1269151 ?auto_1269155 ) ) ( not ( = ?auto_1269151 ?auto_1269160 ) ) ( not ( = ?auto_1269151 ?auto_1269158 ) ) ( not ( = ?auto_1269152 ?auto_1269153 ) ) ( not ( = ?auto_1269152 ?auto_1269150 ) ) ( not ( = ?auto_1269152 ?auto_1269154 ) ) ( not ( = ?auto_1269152 ?auto_1269155 ) ) ( not ( = ?auto_1269152 ?auto_1269160 ) ) ( not ( = ?auto_1269152 ?auto_1269158 ) ) ( not ( = ?auto_1269153 ?auto_1269150 ) ) ( not ( = ?auto_1269153 ?auto_1269154 ) ) ( not ( = ?auto_1269153 ?auto_1269155 ) ) ( not ( = ?auto_1269153 ?auto_1269160 ) ) ( not ( = ?auto_1269153 ?auto_1269158 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1269150 ?auto_1269154 ?auto_1269155 )
      ( MAKE-5CRATE-VERIFY ?auto_1269151 ?auto_1269152 ?auto_1269153 ?auto_1269150 ?auto_1269154 ?auto_1269155 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1269164 - SURFACE
      ?auto_1269165 - SURFACE
      ?auto_1269166 - SURFACE
      ?auto_1269163 - SURFACE
      ?auto_1269167 - SURFACE
      ?auto_1269169 - SURFACE
      ?auto_1269168 - SURFACE
    )
    :vars
    (
      ?auto_1269175 - HOIST
      ?auto_1269171 - PLACE
      ?auto_1269176 - PLACE
      ?auto_1269173 - HOIST
      ?auto_1269174 - SURFACE
      ?auto_1269172 - SURFACE
      ?auto_1269170 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1269175 ?auto_1269171 ) ( IS-CRATE ?auto_1269168 ) ( not ( = ?auto_1269169 ?auto_1269168 ) ) ( not ( = ?auto_1269167 ?auto_1269169 ) ) ( not ( = ?auto_1269167 ?auto_1269168 ) ) ( not ( = ?auto_1269176 ?auto_1269171 ) ) ( HOIST-AT ?auto_1269173 ?auto_1269176 ) ( not ( = ?auto_1269175 ?auto_1269173 ) ) ( SURFACE-AT ?auto_1269168 ?auto_1269176 ) ( ON ?auto_1269168 ?auto_1269174 ) ( CLEAR ?auto_1269168 ) ( not ( = ?auto_1269169 ?auto_1269174 ) ) ( not ( = ?auto_1269168 ?auto_1269174 ) ) ( not ( = ?auto_1269167 ?auto_1269174 ) ) ( SURFACE-AT ?auto_1269167 ?auto_1269171 ) ( CLEAR ?auto_1269167 ) ( IS-CRATE ?auto_1269169 ) ( AVAILABLE ?auto_1269175 ) ( AVAILABLE ?auto_1269173 ) ( SURFACE-AT ?auto_1269169 ?auto_1269176 ) ( ON ?auto_1269169 ?auto_1269172 ) ( CLEAR ?auto_1269169 ) ( not ( = ?auto_1269169 ?auto_1269172 ) ) ( not ( = ?auto_1269168 ?auto_1269172 ) ) ( not ( = ?auto_1269167 ?auto_1269172 ) ) ( not ( = ?auto_1269174 ?auto_1269172 ) ) ( TRUCK-AT ?auto_1269170 ?auto_1269171 ) ( ON ?auto_1269165 ?auto_1269164 ) ( ON ?auto_1269166 ?auto_1269165 ) ( ON ?auto_1269163 ?auto_1269166 ) ( ON ?auto_1269167 ?auto_1269163 ) ( not ( = ?auto_1269164 ?auto_1269165 ) ) ( not ( = ?auto_1269164 ?auto_1269166 ) ) ( not ( = ?auto_1269164 ?auto_1269163 ) ) ( not ( = ?auto_1269164 ?auto_1269167 ) ) ( not ( = ?auto_1269164 ?auto_1269169 ) ) ( not ( = ?auto_1269164 ?auto_1269168 ) ) ( not ( = ?auto_1269164 ?auto_1269174 ) ) ( not ( = ?auto_1269164 ?auto_1269172 ) ) ( not ( = ?auto_1269165 ?auto_1269166 ) ) ( not ( = ?auto_1269165 ?auto_1269163 ) ) ( not ( = ?auto_1269165 ?auto_1269167 ) ) ( not ( = ?auto_1269165 ?auto_1269169 ) ) ( not ( = ?auto_1269165 ?auto_1269168 ) ) ( not ( = ?auto_1269165 ?auto_1269174 ) ) ( not ( = ?auto_1269165 ?auto_1269172 ) ) ( not ( = ?auto_1269166 ?auto_1269163 ) ) ( not ( = ?auto_1269166 ?auto_1269167 ) ) ( not ( = ?auto_1269166 ?auto_1269169 ) ) ( not ( = ?auto_1269166 ?auto_1269168 ) ) ( not ( = ?auto_1269166 ?auto_1269174 ) ) ( not ( = ?auto_1269166 ?auto_1269172 ) ) ( not ( = ?auto_1269163 ?auto_1269167 ) ) ( not ( = ?auto_1269163 ?auto_1269169 ) ) ( not ( = ?auto_1269163 ?auto_1269168 ) ) ( not ( = ?auto_1269163 ?auto_1269174 ) ) ( not ( = ?auto_1269163 ?auto_1269172 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1269167 ?auto_1269169 ?auto_1269168 )
      ( MAKE-6CRATE-VERIFY ?auto_1269164 ?auto_1269165 ?auto_1269166 ?auto_1269163 ?auto_1269167 ?auto_1269169 ?auto_1269168 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1269178 - SURFACE
      ?auto_1269179 - SURFACE
      ?auto_1269180 - SURFACE
      ?auto_1269177 - SURFACE
      ?auto_1269181 - SURFACE
      ?auto_1269183 - SURFACE
      ?auto_1269182 - SURFACE
      ?auto_1269184 - SURFACE
    )
    :vars
    (
      ?auto_1269190 - HOIST
      ?auto_1269186 - PLACE
      ?auto_1269191 - PLACE
      ?auto_1269188 - HOIST
      ?auto_1269189 - SURFACE
      ?auto_1269187 - SURFACE
      ?auto_1269185 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1269190 ?auto_1269186 ) ( IS-CRATE ?auto_1269184 ) ( not ( = ?auto_1269182 ?auto_1269184 ) ) ( not ( = ?auto_1269183 ?auto_1269182 ) ) ( not ( = ?auto_1269183 ?auto_1269184 ) ) ( not ( = ?auto_1269191 ?auto_1269186 ) ) ( HOIST-AT ?auto_1269188 ?auto_1269191 ) ( not ( = ?auto_1269190 ?auto_1269188 ) ) ( SURFACE-AT ?auto_1269184 ?auto_1269191 ) ( ON ?auto_1269184 ?auto_1269189 ) ( CLEAR ?auto_1269184 ) ( not ( = ?auto_1269182 ?auto_1269189 ) ) ( not ( = ?auto_1269184 ?auto_1269189 ) ) ( not ( = ?auto_1269183 ?auto_1269189 ) ) ( SURFACE-AT ?auto_1269183 ?auto_1269186 ) ( CLEAR ?auto_1269183 ) ( IS-CRATE ?auto_1269182 ) ( AVAILABLE ?auto_1269190 ) ( AVAILABLE ?auto_1269188 ) ( SURFACE-AT ?auto_1269182 ?auto_1269191 ) ( ON ?auto_1269182 ?auto_1269187 ) ( CLEAR ?auto_1269182 ) ( not ( = ?auto_1269182 ?auto_1269187 ) ) ( not ( = ?auto_1269184 ?auto_1269187 ) ) ( not ( = ?auto_1269183 ?auto_1269187 ) ) ( not ( = ?auto_1269189 ?auto_1269187 ) ) ( TRUCK-AT ?auto_1269185 ?auto_1269186 ) ( ON ?auto_1269179 ?auto_1269178 ) ( ON ?auto_1269180 ?auto_1269179 ) ( ON ?auto_1269177 ?auto_1269180 ) ( ON ?auto_1269181 ?auto_1269177 ) ( ON ?auto_1269183 ?auto_1269181 ) ( not ( = ?auto_1269178 ?auto_1269179 ) ) ( not ( = ?auto_1269178 ?auto_1269180 ) ) ( not ( = ?auto_1269178 ?auto_1269177 ) ) ( not ( = ?auto_1269178 ?auto_1269181 ) ) ( not ( = ?auto_1269178 ?auto_1269183 ) ) ( not ( = ?auto_1269178 ?auto_1269182 ) ) ( not ( = ?auto_1269178 ?auto_1269184 ) ) ( not ( = ?auto_1269178 ?auto_1269189 ) ) ( not ( = ?auto_1269178 ?auto_1269187 ) ) ( not ( = ?auto_1269179 ?auto_1269180 ) ) ( not ( = ?auto_1269179 ?auto_1269177 ) ) ( not ( = ?auto_1269179 ?auto_1269181 ) ) ( not ( = ?auto_1269179 ?auto_1269183 ) ) ( not ( = ?auto_1269179 ?auto_1269182 ) ) ( not ( = ?auto_1269179 ?auto_1269184 ) ) ( not ( = ?auto_1269179 ?auto_1269189 ) ) ( not ( = ?auto_1269179 ?auto_1269187 ) ) ( not ( = ?auto_1269180 ?auto_1269177 ) ) ( not ( = ?auto_1269180 ?auto_1269181 ) ) ( not ( = ?auto_1269180 ?auto_1269183 ) ) ( not ( = ?auto_1269180 ?auto_1269182 ) ) ( not ( = ?auto_1269180 ?auto_1269184 ) ) ( not ( = ?auto_1269180 ?auto_1269189 ) ) ( not ( = ?auto_1269180 ?auto_1269187 ) ) ( not ( = ?auto_1269177 ?auto_1269181 ) ) ( not ( = ?auto_1269177 ?auto_1269183 ) ) ( not ( = ?auto_1269177 ?auto_1269182 ) ) ( not ( = ?auto_1269177 ?auto_1269184 ) ) ( not ( = ?auto_1269177 ?auto_1269189 ) ) ( not ( = ?auto_1269177 ?auto_1269187 ) ) ( not ( = ?auto_1269181 ?auto_1269183 ) ) ( not ( = ?auto_1269181 ?auto_1269182 ) ) ( not ( = ?auto_1269181 ?auto_1269184 ) ) ( not ( = ?auto_1269181 ?auto_1269189 ) ) ( not ( = ?auto_1269181 ?auto_1269187 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1269183 ?auto_1269182 ?auto_1269184 )
      ( MAKE-7CRATE-VERIFY ?auto_1269178 ?auto_1269179 ?auto_1269180 ?auto_1269177 ?auto_1269181 ?auto_1269183 ?auto_1269182 ?auto_1269184 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1269193 - SURFACE
      ?auto_1269194 - SURFACE
      ?auto_1269195 - SURFACE
      ?auto_1269192 - SURFACE
      ?auto_1269196 - SURFACE
      ?auto_1269198 - SURFACE
      ?auto_1269197 - SURFACE
      ?auto_1269199 - SURFACE
      ?auto_1269200 - SURFACE
    )
    :vars
    (
      ?auto_1269206 - HOIST
      ?auto_1269202 - PLACE
      ?auto_1269207 - PLACE
      ?auto_1269204 - HOIST
      ?auto_1269205 - SURFACE
      ?auto_1269203 - SURFACE
      ?auto_1269201 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1269206 ?auto_1269202 ) ( IS-CRATE ?auto_1269200 ) ( not ( = ?auto_1269199 ?auto_1269200 ) ) ( not ( = ?auto_1269197 ?auto_1269199 ) ) ( not ( = ?auto_1269197 ?auto_1269200 ) ) ( not ( = ?auto_1269207 ?auto_1269202 ) ) ( HOIST-AT ?auto_1269204 ?auto_1269207 ) ( not ( = ?auto_1269206 ?auto_1269204 ) ) ( SURFACE-AT ?auto_1269200 ?auto_1269207 ) ( ON ?auto_1269200 ?auto_1269205 ) ( CLEAR ?auto_1269200 ) ( not ( = ?auto_1269199 ?auto_1269205 ) ) ( not ( = ?auto_1269200 ?auto_1269205 ) ) ( not ( = ?auto_1269197 ?auto_1269205 ) ) ( SURFACE-AT ?auto_1269197 ?auto_1269202 ) ( CLEAR ?auto_1269197 ) ( IS-CRATE ?auto_1269199 ) ( AVAILABLE ?auto_1269206 ) ( AVAILABLE ?auto_1269204 ) ( SURFACE-AT ?auto_1269199 ?auto_1269207 ) ( ON ?auto_1269199 ?auto_1269203 ) ( CLEAR ?auto_1269199 ) ( not ( = ?auto_1269199 ?auto_1269203 ) ) ( not ( = ?auto_1269200 ?auto_1269203 ) ) ( not ( = ?auto_1269197 ?auto_1269203 ) ) ( not ( = ?auto_1269205 ?auto_1269203 ) ) ( TRUCK-AT ?auto_1269201 ?auto_1269202 ) ( ON ?auto_1269194 ?auto_1269193 ) ( ON ?auto_1269195 ?auto_1269194 ) ( ON ?auto_1269192 ?auto_1269195 ) ( ON ?auto_1269196 ?auto_1269192 ) ( ON ?auto_1269198 ?auto_1269196 ) ( ON ?auto_1269197 ?auto_1269198 ) ( not ( = ?auto_1269193 ?auto_1269194 ) ) ( not ( = ?auto_1269193 ?auto_1269195 ) ) ( not ( = ?auto_1269193 ?auto_1269192 ) ) ( not ( = ?auto_1269193 ?auto_1269196 ) ) ( not ( = ?auto_1269193 ?auto_1269198 ) ) ( not ( = ?auto_1269193 ?auto_1269197 ) ) ( not ( = ?auto_1269193 ?auto_1269199 ) ) ( not ( = ?auto_1269193 ?auto_1269200 ) ) ( not ( = ?auto_1269193 ?auto_1269205 ) ) ( not ( = ?auto_1269193 ?auto_1269203 ) ) ( not ( = ?auto_1269194 ?auto_1269195 ) ) ( not ( = ?auto_1269194 ?auto_1269192 ) ) ( not ( = ?auto_1269194 ?auto_1269196 ) ) ( not ( = ?auto_1269194 ?auto_1269198 ) ) ( not ( = ?auto_1269194 ?auto_1269197 ) ) ( not ( = ?auto_1269194 ?auto_1269199 ) ) ( not ( = ?auto_1269194 ?auto_1269200 ) ) ( not ( = ?auto_1269194 ?auto_1269205 ) ) ( not ( = ?auto_1269194 ?auto_1269203 ) ) ( not ( = ?auto_1269195 ?auto_1269192 ) ) ( not ( = ?auto_1269195 ?auto_1269196 ) ) ( not ( = ?auto_1269195 ?auto_1269198 ) ) ( not ( = ?auto_1269195 ?auto_1269197 ) ) ( not ( = ?auto_1269195 ?auto_1269199 ) ) ( not ( = ?auto_1269195 ?auto_1269200 ) ) ( not ( = ?auto_1269195 ?auto_1269205 ) ) ( not ( = ?auto_1269195 ?auto_1269203 ) ) ( not ( = ?auto_1269192 ?auto_1269196 ) ) ( not ( = ?auto_1269192 ?auto_1269198 ) ) ( not ( = ?auto_1269192 ?auto_1269197 ) ) ( not ( = ?auto_1269192 ?auto_1269199 ) ) ( not ( = ?auto_1269192 ?auto_1269200 ) ) ( not ( = ?auto_1269192 ?auto_1269205 ) ) ( not ( = ?auto_1269192 ?auto_1269203 ) ) ( not ( = ?auto_1269196 ?auto_1269198 ) ) ( not ( = ?auto_1269196 ?auto_1269197 ) ) ( not ( = ?auto_1269196 ?auto_1269199 ) ) ( not ( = ?auto_1269196 ?auto_1269200 ) ) ( not ( = ?auto_1269196 ?auto_1269205 ) ) ( not ( = ?auto_1269196 ?auto_1269203 ) ) ( not ( = ?auto_1269198 ?auto_1269197 ) ) ( not ( = ?auto_1269198 ?auto_1269199 ) ) ( not ( = ?auto_1269198 ?auto_1269200 ) ) ( not ( = ?auto_1269198 ?auto_1269205 ) ) ( not ( = ?auto_1269198 ?auto_1269203 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1269197 ?auto_1269199 ?auto_1269200 )
      ( MAKE-8CRATE-VERIFY ?auto_1269193 ?auto_1269194 ?auto_1269195 ?auto_1269192 ?auto_1269196 ?auto_1269198 ?auto_1269197 ?auto_1269199 ?auto_1269200 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1269242 - SURFACE
      ?auto_1269243 - SURFACE
      ?auto_1269244 - SURFACE
      ?auto_1269241 - SURFACE
      ?auto_1269245 - SURFACE
    )
    :vars
    (
      ?auto_1269249 - HOIST
      ?auto_1269247 - PLACE
      ?auto_1269252 - PLACE
      ?auto_1269248 - HOIST
      ?auto_1269250 - SURFACE
      ?auto_1269246 - SURFACE
      ?auto_1269251 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1269249 ?auto_1269247 ) ( IS-CRATE ?auto_1269245 ) ( not ( = ?auto_1269241 ?auto_1269245 ) ) ( not ( = ?auto_1269244 ?auto_1269241 ) ) ( not ( = ?auto_1269244 ?auto_1269245 ) ) ( not ( = ?auto_1269252 ?auto_1269247 ) ) ( HOIST-AT ?auto_1269248 ?auto_1269252 ) ( not ( = ?auto_1269249 ?auto_1269248 ) ) ( SURFACE-AT ?auto_1269245 ?auto_1269252 ) ( ON ?auto_1269245 ?auto_1269250 ) ( CLEAR ?auto_1269245 ) ( not ( = ?auto_1269241 ?auto_1269250 ) ) ( not ( = ?auto_1269245 ?auto_1269250 ) ) ( not ( = ?auto_1269244 ?auto_1269250 ) ) ( IS-CRATE ?auto_1269241 ) ( AVAILABLE ?auto_1269248 ) ( SURFACE-AT ?auto_1269241 ?auto_1269252 ) ( ON ?auto_1269241 ?auto_1269246 ) ( CLEAR ?auto_1269241 ) ( not ( = ?auto_1269241 ?auto_1269246 ) ) ( not ( = ?auto_1269245 ?auto_1269246 ) ) ( not ( = ?auto_1269244 ?auto_1269246 ) ) ( not ( = ?auto_1269250 ?auto_1269246 ) ) ( TRUCK-AT ?auto_1269251 ?auto_1269247 ) ( SURFACE-AT ?auto_1269243 ?auto_1269247 ) ( CLEAR ?auto_1269243 ) ( LIFTING ?auto_1269249 ?auto_1269244 ) ( IS-CRATE ?auto_1269244 ) ( not ( = ?auto_1269243 ?auto_1269244 ) ) ( not ( = ?auto_1269241 ?auto_1269243 ) ) ( not ( = ?auto_1269245 ?auto_1269243 ) ) ( not ( = ?auto_1269250 ?auto_1269243 ) ) ( not ( = ?auto_1269246 ?auto_1269243 ) ) ( ON ?auto_1269243 ?auto_1269242 ) ( not ( = ?auto_1269242 ?auto_1269243 ) ) ( not ( = ?auto_1269242 ?auto_1269244 ) ) ( not ( = ?auto_1269242 ?auto_1269241 ) ) ( not ( = ?auto_1269242 ?auto_1269245 ) ) ( not ( = ?auto_1269242 ?auto_1269250 ) ) ( not ( = ?auto_1269242 ?auto_1269246 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1269244 ?auto_1269241 ?auto_1269245 )
      ( MAKE-4CRATE-VERIFY ?auto_1269242 ?auto_1269243 ?auto_1269244 ?auto_1269241 ?auto_1269245 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1269254 - SURFACE
      ?auto_1269255 - SURFACE
      ?auto_1269256 - SURFACE
      ?auto_1269253 - SURFACE
      ?auto_1269257 - SURFACE
      ?auto_1269258 - SURFACE
    )
    :vars
    (
      ?auto_1269262 - HOIST
      ?auto_1269260 - PLACE
      ?auto_1269265 - PLACE
      ?auto_1269261 - HOIST
      ?auto_1269263 - SURFACE
      ?auto_1269259 - SURFACE
      ?auto_1269264 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1269262 ?auto_1269260 ) ( IS-CRATE ?auto_1269258 ) ( not ( = ?auto_1269257 ?auto_1269258 ) ) ( not ( = ?auto_1269253 ?auto_1269257 ) ) ( not ( = ?auto_1269253 ?auto_1269258 ) ) ( not ( = ?auto_1269265 ?auto_1269260 ) ) ( HOIST-AT ?auto_1269261 ?auto_1269265 ) ( not ( = ?auto_1269262 ?auto_1269261 ) ) ( SURFACE-AT ?auto_1269258 ?auto_1269265 ) ( ON ?auto_1269258 ?auto_1269263 ) ( CLEAR ?auto_1269258 ) ( not ( = ?auto_1269257 ?auto_1269263 ) ) ( not ( = ?auto_1269258 ?auto_1269263 ) ) ( not ( = ?auto_1269253 ?auto_1269263 ) ) ( IS-CRATE ?auto_1269257 ) ( AVAILABLE ?auto_1269261 ) ( SURFACE-AT ?auto_1269257 ?auto_1269265 ) ( ON ?auto_1269257 ?auto_1269259 ) ( CLEAR ?auto_1269257 ) ( not ( = ?auto_1269257 ?auto_1269259 ) ) ( not ( = ?auto_1269258 ?auto_1269259 ) ) ( not ( = ?auto_1269253 ?auto_1269259 ) ) ( not ( = ?auto_1269263 ?auto_1269259 ) ) ( TRUCK-AT ?auto_1269264 ?auto_1269260 ) ( SURFACE-AT ?auto_1269256 ?auto_1269260 ) ( CLEAR ?auto_1269256 ) ( LIFTING ?auto_1269262 ?auto_1269253 ) ( IS-CRATE ?auto_1269253 ) ( not ( = ?auto_1269256 ?auto_1269253 ) ) ( not ( = ?auto_1269257 ?auto_1269256 ) ) ( not ( = ?auto_1269258 ?auto_1269256 ) ) ( not ( = ?auto_1269263 ?auto_1269256 ) ) ( not ( = ?auto_1269259 ?auto_1269256 ) ) ( ON ?auto_1269255 ?auto_1269254 ) ( ON ?auto_1269256 ?auto_1269255 ) ( not ( = ?auto_1269254 ?auto_1269255 ) ) ( not ( = ?auto_1269254 ?auto_1269256 ) ) ( not ( = ?auto_1269254 ?auto_1269253 ) ) ( not ( = ?auto_1269254 ?auto_1269257 ) ) ( not ( = ?auto_1269254 ?auto_1269258 ) ) ( not ( = ?auto_1269254 ?auto_1269263 ) ) ( not ( = ?auto_1269254 ?auto_1269259 ) ) ( not ( = ?auto_1269255 ?auto_1269256 ) ) ( not ( = ?auto_1269255 ?auto_1269253 ) ) ( not ( = ?auto_1269255 ?auto_1269257 ) ) ( not ( = ?auto_1269255 ?auto_1269258 ) ) ( not ( = ?auto_1269255 ?auto_1269263 ) ) ( not ( = ?auto_1269255 ?auto_1269259 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1269253 ?auto_1269257 ?auto_1269258 )
      ( MAKE-5CRATE-VERIFY ?auto_1269254 ?auto_1269255 ?auto_1269256 ?auto_1269253 ?auto_1269257 ?auto_1269258 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1269267 - SURFACE
      ?auto_1269268 - SURFACE
      ?auto_1269269 - SURFACE
      ?auto_1269266 - SURFACE
      ?auto_1269270 - SURFACE
      ?auto_1269272 - SURFACE
      ?auto_1269271 - SURFACE
    )
    :vars
    (
      ?auto_1269276 - HOIST
      ?auto_1269274 - PLACE
      ?auto_1269279 - PLACE
      ?auto_1269275 - HOIST
      ?auto_1269277 - SURFACE
      ?auto_1269273 - SURFACE
      ?auto_1269278 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1269276 ?auto_1269274 ) ( IS-CRATE ?auto_1269271 ) ( not ( = ?auto_1269272 ?auto_1269271 ) ) ( not ( = ?auto_1269270 ?auto_1269272 ) ) ( not ( = ?auto_1269270 ?auto_1269271 ) ) ( not ( = ?auto_1269279 ?auto_1269274 ) ) ( HOIST-AT ?auto_1269275 ?auto_1269279 ) ( not ( = ?auto_1269276 ?auto_1269275 ) ) ( SURFACE-AT ?auto_1269271 ?auto_1269279 ) ( ON ?auto_1269271 ?auto_1269277 ) ( CLEAR ?auto_1269271 ) ( not ( = ?auto_1269272 ?auto_1269277 ) ) ( not ( = ?auto_1269271 ?auto_1269277 ) ) ( not ( = ?auto_1269270 ?auto_1269277 ) ) ( IS-CRATE ?auto_1269272 ) ( AVAILABLE ?auto_1269275 ) ( SURFACE-AT ?auto_1269272 ?auto_1269279 ) ( ON ?auto_1269272 ?auto_1269273 ) ( CLEAR ?auto_1269272 ) ( not ( = ?auto_1269272 ?auto_1269273 ) ) ( not ( = ?auto_1269271 ?auto_1269273 ) ) ( not ( = ?auto_1269270 ?auto_1269273 ) ) ( not ( = ?auto_1269277 ?auto_1269273 ) ) ( TRUCK-AT ?auto_1269278 ?auto_1269274 ) ( SURFACE-AT ?auto_1269266 ?auto_1269274 ) ( CLEAR ?auto_1269266 ) ( LIFTING ?auto_1269276 ?auto_1269270 ) ( IS-CRATE ?auto_1269270 ) ( not ( = ?auto_1269266 ?auto_1269270 ) ) ( not ( = ?auto_1269272 ?auto_1269266 ) ) ( not ( = ?auto_1269271 ?auto_1269266 ) ) ( not ( = ?auto_1269277 ?auto_1269266 ) ) ( not ( = ?auto_1269273 ?auto_1269266 ) ) ( ON ?auto_1269268 ?auto_1269267 ) ( ON ?auto_1269269 ?auto_1269268 ) ( ON ?auto_1269266 ?auto_1269269 ) ( not ( = ?auto_1269267 ?auto_1269268 ) ) ( not ( = ?auto_1269267 ?auto_1269269 ) ) ( not ( = ?auto_1269267 ?auto_1269266 ) ) ( not ( = ?auto_1269267 ?auto_1269270 ) ) ( not ( = ?auto_1269267 ?auto_1269272 ) ) ( not ( = ?auto_1269267 ?auto_1269271 ) ) ( not ( = ?auto_1269267 ?auto_1269277 ) ) ( not ( = ?auto_1269267 ?auto_1269273 ) ) ( not ( = ?auto_1269268 ?auto_1269269 ) ) ( not ( = ?auto_1269268 ?auto_1269266 ) ) ( not ( = ?auto_1269268 ?auto_1269270 ) ) ( not ( = ?auto_1269268 ?auto_1269272 ) ) ( not ( = ?auto_1269268 ?auto_1269271 ) ) ( not ( = ?auto_1269268 ?auto_1269277 ) ) ( not ( = ?auto_1269268 ?auto_1269273 ) ) ( not ( = ?auto_1269269 ?auto_1269266 ) ) ( not ( = ?auto_1269269 ?auto_1269270 ) ) ( not ( = ?auto_1269269 ?auto_1269272 ) ) ( not ( = ?auto_1269269 ?auto_1269271 ) ) ( not ( = ?auto_1269269 ?auto_1269277 ) ) ( not ( = ?auto_1269269 ?auto_1269273 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1269270 ?auto_1269272 ?auto_1269271 )
      ( MAKE-6CRATE-VERIFY ?auto_1269267 ?auto_1269268 ?auto_1269269 ?auto_1269266 ?auto_1269270 ?auto_1269272 ?auto_1269271 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1269281 - SURFACE
      ?auto_1269282 - SURFACE
      ?auto_1269283 - SURFACE
      ?auto_1269280 - SURFACE
      ?auto_1269284 - SURFACE
      ?auto_1269286 - SURFACE
      ?auto_1269285 - SURFACE
      ?auto_1269287 - SURFACE
    )
    :vars
    (
      ?auto_1269291 - HOIST
      ?auto_1269289 - PLACE
      ?auto_1269294 - PLACE
      ?auto_1269290 - HOIST
      ?auto_1269292 - SURFACE
      ?auto_1269288 - SURFACE
      ?auto_1269293 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1269291 ?auto_1269289 ) ( IS-CRATE ?auto_1269287 ) ( not ( = ?auto_1269285 ?auto_1269287 ) ) ( not ( = ?auto_1269286 ?auto_1269285 ) ) ( not ( = ?auto_1269286 ?auto_1269287 ) ) ( not ( = ?auto_1269294 ?auto_1269289 ) ) ( HOIST-AT ?auto_1269290 ?auto_1269294 ) ( not ( = ?auto_1269291 ?auto_1269290 ) ) ( SURFACE-AT ?auto_1269287 ?auto_1269294 ) ( ON ?auto_1269287 ?auto_1269292 ) ( CLEAR ?auto_1269287 ) ( not ( = ?auto_1269285 ?auto_1269292 ) ) ( not ( = ?auto_1269287 ?auto_1269292 ) ) ( not ( = ?auto_1269286 ?auto_1269292 ) ) ( IS-CRATE ?auto_1269285 ) ( AVAILABLE ?auto_1269290 ) ( SURFACE-AT ?auto_1269285 ?auto_1269294 ) ( ON ?auto_1269285 ?auto_1269288 ) ( CLEAR ?auto_1269285 ) ( not ( = ?auto_1269285 ?auto_1269288 ) ) ( not ( = ?auto_1269287 ?auto_1269288 ) ) ( not ( = ?auto_1269286 ?auto_1269288 ) ) ( not ( = ?auto_1269292 ?auto_1269288 ) ) ( TRUCK-AT ?auto_1269293 ?auto_1269289 ) ( SURFACE-AT ?auto_1269284 ?auto_1269289 ) ( CLEAR ?auto_1269284 ) ( LIFTING ?auto_1269291 ?auto_1269286 ) ( IS-CRATE ?auto_1269286 ) ( not ( = ?auto_1269284 ?auto_1269286 ) ) ( not ( = ?auto_1269285 ?auto_1269284 ) ) ( not ( = ?auto_1269287 ?auto_1269284 ) ) ( not ( = ?auto_1269292 ?auto_1269284 ) ) ( not ( = ?auto_1269288 ?auto_1269284 ) ) ( ON ?auto_1269282 ?auto_1269281 ) ( ON ?auto_1269283 ?auto_1269282 ) ( ON ?auto_1269280 ?auto_1269283 ) ( ON ?auto_1269284 ?auto_1269280 ) ( not ( = ?auto_1269281 ?auto_1269282 ) ) ( not ( = ?auto_1269281 ?auto_1269283 ) ) ( not ( = ?auto_1269281 ?auto_1269280 ) ) ( not ( = ?auto_1269281 ?auto_1269284 ) ) ( not ( = ?auto_1269281 ?auto_1269286 ) ) ( not ( = ?auto_1269281 ?auto_1269285 ) ) ( not ( = ?auto_1269281 ?auto_1269287 ) ) ( not ( = ?auto_1269281 ?auto_1269292 ) ) ( not ( = ?auto_1269281 ?auto_1269288 ) ) ( not ( = ?auto_1269282 ?auto_1269283 ) ) ( not ( = ?auto_1269282 ?auto_1269280 ) ) ( not ( = ?auto_1269282 ?auto_1269284 ) ) ( not ( = ?auto_1269282 ?auto_1269286 ) ) ( not ( = ?auto_1269282 ?auto_1269285 ) ) ( not ( = ?auto_1269282 ?auto_1269287 ) ) ( not ( = ?auto_1269282 ?auto_1269292 ) ) ( not ( = ?auto_1269282 ?auto_1269288 ) ) ( not ( = ?auto_1269283 ?auto_1269280 ) ) ( not ( = ?auto_1269283 ?auto_1269284 ) ) ( not ( = ?auto_1269283 ?auto_1269286 ) ) ( not ( = ?auto_1269283 ?auto_1269285 ) ) ( not ( = ?auto_1269283 ?auto_1269287 ) ) ( not ( = ?auto_1269283 ?auto_1269292 ) ) ( not ( = ?auto_1269283 ?auto_1269288 ) ) ( not ( = ?auto_1269280 ?auto_1269284 ) ) ( not ( = ?auto_1269280 ?auto_1269286 ) ) ( not ( = ?auto_1269280 ?auto_1269285 ) ) ( not ( = ?auto_1269280 ?auto_1269287 ) ) ( not ( = ?auto_1269280 ?auto_1269292 ) ) ( not ( = ?auto_1269280 ?auto_1269288 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1269286 ?auto_1269285 ?auto_1269287 )
      ( MAKE-7CRATE-VERIFY ?auto_1269281 ?auto_1269282 ?auto_1269283 ?auto_1269280 ?auto_1269284 ?auto_1269286 ?auto_1269285 ?auto_1269287 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1269296 - SURFACE
      ?auto_1269297 - SURFACE
      ?auto_1269298 - SURFACE
      ?auto_1269295 - SURFACE
      ?auto_1269299 - SURFACE
      ?auto_1269301 - SURFACE
      ?auto_1269300 - SURFACE
      ?auto_1269302 - SURFACE
      ?auto_1269303 - SURFACE
    )
    :vars
    (
      ?auto_1269307 - HOIST
      ?auto_1269305 - PLACE
      ?auto_1269310 - PLACE
      ?auto_1269306 - HOIST
      ?auto_1269308 - SURFACE
      ?auto_1269304 - SURFACE
      ?auto_1269309 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1269307 ?auto_1269305 ) ( IS-CRATE ?auto_1269303 ) ( not ( = ?auto_1269302 ?auto_1269303 ) ) ( not ( = ?auto_1269300 ?auto_1269302 ) ) ( not ( = ?auto_1269300 ?auto_1269303 ) ) ( not ( = ?auto_1269310 ?auto_1269305 ) ) ( HOIST-AT ?auto_1269306 ?auto_1269310 ) ( not ( = ?auto_1269307 ?auto_1269306 ) ) ( SURFACE-AT ?auto_1269303 ?auto_1269310 ) ( ON ?auto_1269303 ?auto_1269308 ) ( CLEAR ?auto_1269303 ) ( not ( = ?auto_1269302 ?auto_1269308 ) ) ( not ( = ?auto_1269303 ?auto_1269308 ) ) ( not ( = ?auto_1269300 ?auto_1269308 ) ) ( IS-CRATE ?auto_1269302 ) ( AVAILABLE ?auto_1269306 ) ( SURFACE-AT ?auto_1269302 ?auto_1269310 ) ( ON ?auto_1269302 ?auto_1269304 ) ( CLEAR ?auto_1269302 ) ( not ( = ?auto_1269302 ?auto_1269304 ) ) ( not ( = ?auto_1269303 ?auto_1269304 ) ) ( not ( = ?auto_1269300 ?auto_1269304 ) ) ( not ( = ?auto_1269308 ?auto_1269304 ) ) ( TRUCK-AT ?auto_1269309 ?auto_1269305 ) ( SURFACE-AT ?auto_1269301 ?auto_1269305 ) ( CLEAR ?auto_1269301 ) ( LIFTING ?auto_1269307 ?auto_1269300 ) ( IS-CRATE ?auto_1269300 ) ( not ( = ?auto_1269301 ?auto_1269300 ) ) ( not ( = ?auto_1269302 ?auto_1269301 ) ) ( not ( = ?auto_1269303 ?auto_1269301 ) ) ( not ( = ?auto_1269308 ?auto_1269301 ) ) ( not ( = ?auto_1269304 ?auto_1269301 ) ) ( ON ?auto_1269297 ?auto_1269296 ) ( ON ?auto_1269298 ?auto_1269297 ) ( ON ?auto_1269295 ?auto_1269298 ) ( ON ?auto_1269299 ?auto_1269295 ) ( ON ?auto_1269301 ?auto_1269299 ) ( not ( = ?auto_1269296 ?auto_1269297 ) ) ( not ( = ?auto_1269296 ?auto_1269298 ) ) ( not ( = ?auto_1269296 ?auto_1269295 ) ) ( not ( = ?auto_1269296 ?auto_1269299 ) ) ( not ( = ?auto_1269296 ?auto_1269301 ) ) ( not ( = ?auto_1269296 ?auto_1269300 ) ) ( not ( = ?auto_1269296 ?auto_1269302 ) ) ( not ( = ?auto_1269296 ?auto_1269303 ) ) ( not ( = ?auto_1269296 ?auto_1269308 ) ) ( not ( = ?auto_1269296 ?auto_1269304 ) ) ( not ( = ?auto_1269297 ?auto_1269298 ) ) ( not ( = ?auto_1269297 ?auto_1269295 ) ) ( not ( = ?auto_1269297 ?auto_1269299 ) ) ( not ( = ?auto_1269297 ?auto_1269301 ) ) ( not ( = ?auto_1269297 ?auto_1269300 ) ) ( not ( = ?auto_1269297 ?auto_1269302 ) ) ( not ( = ?auto_1269297 ?auto_1269303 ) ) ( not ( = ?auto_1269297 ?auto_1269308 ) ) ( not ( = ?auto_1269297 ?auto_1269304 ) ) ( not ( = ?auto_1269298 ?auto_1269295 ) ) ( not ( = ?auto_1269298 ?auto_1269299 ) ) ( not ( = ?auto_1269298 ?auto_1269301 ) ) ( not ( = ?auto_1269298 ?auto_1269300 ) ) ( not ( = ?auto_1269298 ?auto_1269302 ) ) ( not ( = ?auto_1269298 ?auto_1269303 ) ) ( not ( = ?auto_1269298 ?auto_1269308 ) ) ( not ( = ?auto_1269298 ?auto_1269304 ) ) ( not ( = ?auto_1269295 ?auto_1269299 ) ) ( not ( = ?auto_1269295 ?auto_1269301 ) ) ( not ( = ?auto_1269295 ?auto_1269300 ) ) ( not ( = ?auto_1269295 ?auto_1269302 ) ) ( not ( = ?auto_1269295 ?auto_1269303 ) ) ( not ( = ?auto_1269295 ?auto_1269308 ) ) ( not ( = ?auto_1269295 ?auto_1269304 ) ) ( not ( = ?auto_1269299 ?auto_1269301 ) ) ( not ( = ?auto_1269299 ?auto_1269300 ) ) ( not ( = ?auto_1269299 ?auto_1269302 ) ) ( not ( = ?auto_1269299 ?auto_1269303 ) ) ( not ( = ?auto_1269299 ?auto_1269308 ) ) ( not ( = ?auto_1269299 ?auto_1269304 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1269300 ?auto_1269302 ?auto_1269303 )
      ( MAKE-8CRATE-VERIFY ?auto_1269296 ?auto_1269297 ?auto_1269298 ?auto_1269295 ?auto_1269299 ?auto_1269301 ?auto_1269300 ?auto_1269302 ?auto_1269303 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1272861 - SURFACE
      ?auto_1272862 - SURFACE
      ?auto_1272863 - SURFACE
      ?auto_1272860 - SURFACE
      ?auto_1272864 - SURFACE
      ?auto_1272866 - SURFACE
      ?auto_1272865 - SURFACE
      ?auto_1272867 - SURFACE
      ?auto_1272868 - SURFACE
      ?auto_1272869 - SURFACE
    )
    :vars
    (
      ?auto_1272871 - HOIST
      ?auto_1272870 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1272871 ?auto_1272870 ) ( SURFACE-AT ?auto_1272868 ?auto_1272870 ) ( CLEAR ?auto_1272868 ) ( LIFTING ?auto_1272871 ?auto_1272869 ) ( IS-CRATE ?auto_1272869 ) ( not ( = ?auto_1272868 ?auto_1272869 ) ) ( ON ?auto_1272862 ?auto_1272861 ) ( ON ?auto_1272863 ?auto_1272862 ) ( ON ?auto_1272860 ?auto_1272863 ) ( ON ?auto_1272864 ?auto_1272860 ) ( ON ?auto_1272866 ?auto_1272864 ) ( ON ?auto_1272865 ?auto_1272866 ) ( ON ?auto_1272867 ?auto_1272865 ) ( ON ?auto_1272868 ?auto_1272867 ) ( not ( = ?auto_1272861 ?auto_1272862 ) ) ( not ( = ?auto_1272861 ?auto_1272863 ) ) ( not ( = ?auto_1272861 ?auto_1272860 ) ) ( not ( = ?auto_1272861 ?auto_1272864 ) ) ( not ( = ?auto_1272861 ?auto_1272866 ) ) ( not ( = ?auto_1272861 ?auto_1272865 ) ) ( not ( = ?auto_1272861 ?auto_1272867 ) ) ( not ( = ?auto_1272861 ?auto_1272868 ) ) ( not ( = ?auto_1272861 ?auto_1272869 ) ) ( not ( = ?auto_1272862 ?auto_1272863 ) ) ( not ( = ?auto_1272862 ?auto_1272860 ) ) ( not ( = ?auto_1272862 ?auto_1272864 ) ) ( not ( = ?auto_1272862 ?auto_1272866 ) ) ( not ( = ?auto_1272862 ?auto_1272865 ) ) ( not ( = ?auto_1272862 ?auto_1272867 ) ) ( not ( = ?auto_1272862 ?auto_1272868 ) ) ( not ( = ?auto_1272862 ?auto_1272869 ) ) ( not ( = ?auto_1272863 ?auto_1272860 ) ) ( not ( = ?auto_1272863 ?auto_1272864 ) ) ( not ( = ?auto_1272863 ?auto_1272866 ) ) ( not ( = ?auto_1272863 ?auto_1272865 ) ) ( not ( = ?auto_1272863 ?auto_1272867 ) ) ( not ( = ?auto_1272863 ?auto_1272868 ) ) ( not ( = ?auto_1272863 ?auto_1272869 ) ) ( not ( = ?auto_1272860 ?auto_1272864 ) ) ( not ( = ?auto_1272860 ?auto_1272866 ) ) ( not ( = ?auto_1272860 ?auto_1272865 ) ) ( not ( = ?auto_1272860 ?auto_1272867 ) ) ( not ( = ?auto_1272860 ?auto_1272868 ) ) ( not ( = ?auto_1272860 ?auto_1272869 ) ) ( not ( = ?auto_1272864 ?auto_1272866 ) ) ( not ( = ?auto_1272864 ?auto_1272865 ) ) ( not ( = ?auto_1272864 ?auto_1272867 ) ) ( not ( = ?auto_1272864 ?auto_1272868 ) ) ( not ( = ?auto_1272864 ?auto_1272869 ) ) ( not ( = ?auto_1272866 ?auto_1272865 ) ) ( not ( = ?auto_1272866 ?auto_1272867 ) ) ( not ( = ?auto_1272866 ?auto_1272868 ) ) ( not ( = ?auto_1272866 ?auto_1272869 ) ) ( not ( = ?auto_1272865 ?auto_1272867 ) ) ( not ( = ?auto_1272865 ?auto_1272868 ) ) ( not ( = ?auto_1272865 ?auto_1272869 ) ) ( not ( = ?auto_1272867 ?auto_1272868 ) ) ( not ( = ?auto_1272867 ?auto_1272869 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1272868 ?auto_1272869 )
      ( MAKE-9CRATE-VERIFY ?auto_1272861 ?auto_1272862 ?auto_1272863 ?auto_1272860 ?auto_1272864 ?auto_1272866 ?auto_1272865 ?auto_1272867 ?auto_1272868 ?auto_1272869 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1272941 - SURFACE
      ?auto_1272942 - SURFACE
      ?auto_1272943 - SURFACE
      ?auto_1272940 - SURFACE
      ?auto_1272944 - SURFACE
      ?auto_1272946 - SURFACE
      ?auto_1272945 - SURFACE
      ?auto_1272947 - SURFACE
      ?auto_1272948 - SURFACE
      ?auto_1272949 - SURFACE
    )
    :vars
    (
      ?auto_1272951 - HOIST
      ?auto_1272952 - PLACE
      ?auto_1272950 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1272951 ?auto_1272952 ) ( SURFACE-AT ?auto_1272948 ?auto_1272952 ) ( CLEAR ?auto_1272948 ) ( IS-CRATE ?auto_1272949 ) ( not ( = ?auto_1272948 ?auto_1272949 ) ) ( TRUCK-AT ?auto_1272950 ?auto_1272952 ) ( AVAILABLE ?auto_1272951 ) ( IN ?auto_1272949 ?auto_1272950 ) ( ON ?auto_1272948 ?auto_1272947 ) ( not ( = ?auto_1272947 ?auto_1272948 ) ) ( not ( = ?auto_1272947 ?auto_1272949 ) ) ( ON ?auto_1272942 ?auto_1272941 ) ( ON ?auto_1272943 ?auto_1272942 ) ( ON ?auto_1272940 ?auto_1272943 ) ( ON ?auto_1272944 ?auto_1272940 ) ( ON ?auto_1272946 ?auto_1272944 ) ( ON ?auto_1272945 ?auto_1272946 ) ( ON ?auto_1272947 ?auto_1272945 ) ( not ( = ?auto_1272941 ?auto_1272942 ) ) ( not ( = ?auto_1272941 ?auto_1272943 ) ) ( not ( = ?auto_1272941 ?auto_1272940 ) ) ( not ( = ?auto_1272941 ?auto_1272944 ) ) ( not ( = ?auto_1272941 ?auto_1272946 ) ) ( not ( = ?auto_1272941 ?auto_1272945 ) ) ( not ( = ?auto_1272941 ?auto_1272947 ) ) ( not ( = ?auto_1272941 ?auto_1272948 ) ) ( not ( = ?auto_1272941 ?auto_1272949 ) ) ( not ( = ?auto_1272942 ?auto_1272943 ) ) ( not ( = ?auto_1272942 ?auto_1272940 ) ) ( not ( = ?auto_1272942 ?auto_1272944 ) ) ( not ( = ?auto_1272942 ?auto_1272946 ) ) ( not ( = ?auto_1272942 ?auto_1272945 ) ) ( not ( = ?auto_1272942 ?auto_1272947 ) ) ( not ( = ?auto_1272942 ?auto_1272948 ) ) ( not ( = ?auto_1272942 ?auto_1272949 ) ) ( not ( = ?auto_1272943 ?auto_1272940 ) ) ( not ( = ?auto_1272943 ?auto_1272944 ) ) ( not ( = ?auto_1272943 ?auto_1272946 ) ) ( not ( = ?auto_1272943 ?auto_1272945 ) ) ( not ( = ?auto_1272943 ?auto_1272947 ) ) ( not ( = ?auto_1272943 ?auto_1272948 ) ) ( not ( = ?auto_1272943 ?auto_1272949 ) ) ( not ( = ?auto_1272940 ?auto_1272944 ) ) ( not ( = ?auto_1272940 ?auto_1272946 ) ) ( not ( = ?auto_1272940 ?auto_1272945 ) ) ( not ( = ?auto_1272940 ?auto_1272947 ) ) ( not ( = ?auto_1272940 ?auto_1272948 ) ) ( not ( = ?auto_1272940 ?auto_1272949 ) ) ( not ( = ?auto_1272944 ?auto_1272946 ) ) ( not ( = ?auto_1272944 ?auto_1272945 ) ) ( not ( = ?auto_1272944 ?auto_1272947 ) ) ( not ( = ?auto_1272944 ?auto_1272948 ) ) ( not ( = ?auto_1272944 ?auto_1272949 ) ) ( not ( = ?auto_1272946 ?auto_1272945 ) ) ( not ( = ?auto_1272946 ?auto_1272947 ) ) ( not ( = ?auto_1272946 ?auto_1272948 ) ) ( not ( = ?auto_1272946 ?auto_1272949 ) ) ( not ( = ?auto_1272945 ?auto_1272947 ) ) ( not ( = ?auto_1272945 ?auto_1272948 ) ) ( not ( = ?auto_1272945 ?auto_1272949 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1272947 ?auto_1272948 ?auto_1272949 )
      ( MAKE-9CRATE-VERIFY ?auto_1272941 ?auto_1272942 ?auto_1272943 ?auto_1272940 ?auto_1272944 ?auto_1272946 ?auto_1272945 ?auto_1272947 ?auto_1272948 ?auto_1272949 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1273031 - SURFACE
      ?auto_1273032 - SURFACE
      ?auto_1273033 - SURFACE
      ?auto_1273030 - SURFACE
      ?auto_1273034 - SURFACE
      ?auto_1273036 - SURFACE
      ?auto_1273035 - SURFACE
      ?auto_1273037 - SURFACE
      ?auto_1273038 - SURFACE
      ?auto_1273039 - SURFACE
    )
    :vars
    (
      ?auto_1273040 - HOIST
      ?auto_1273043 - PLACE
      ?auto_1273041 - TRUCK
      ?auto_1273042 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1273040 ?auto_1273043 ) ( SURFACE-AT ?auto_1273038 ?auto_1273043 ) ( CLEAR ?auto_1273038 ) ( IS-CRATE ?auto_1273039 ) ( not ( = ?auto_1273038 ?auto_1273039 ) ) ( AVAILABLE ?auto_1273040 ) ( IN ?auto_1273039 ?auto_1273041 ) ( ON ?auto_1273038 ?auto_1273037 ) ( not ( = ?auto_1273037 ?auto_1273038 ) ) ( not ( = ?auto_1273037 ?auto_1273039 ) ) ( TRUCK-AT ?auto_1273041 ?auto_1273042 ) ( not ( = ?auto_1273042 ?auto_1273043 ) ) ( ON ?auto_1273032 ?auto_1273031 ) ( ON ?auto_1273033 ?auto_1273032 ) ( ON ?auto_1273030 ?auto_1273033 ) ( ON ?auto_1273034 ?auto_1273030 ) ( ON ?auto_1273036 ?auto_1273034 ) ( ON ?auto_1273035 ?auto_1273036 ) ( ON ?auto_1273037 ?auto_1273035 ) ( not ( = ?auto_1273031 ?auto_1273032 ) ) ( not ( = ?auto_1273031 ?auto_1273033 ) ) ( not ( = ?auto_1273031 ?auto_1273030 ) ) ( not ( = ?auto_1273031 ?auto_1273034 ) ) ( not ( = ?auto_1273031 ?auto_1273036 ) ) ( not ( = ?auto_1273031 ?auto_1273035 ) ) ( not ( = ?auto_1273031 ?auto_1273037 ) ) ( not ( = ?auto_1273031 ?auto_1273038 ) ) ( not ( = ?auto_1273031 ?auto_1273039 ) ) ( not ( = ?auto_1273032 ?auto_1273033 ) ) ( not ( = ?auto_1273032 ?auto_1273030 ) ) ( not ( = ?auto_1273032 ?auto_1273034 ) ) ( not ( = ?auto_1273032 ?auto_1273036 ) ) ( not ( = ?auto_1273032 ?auto_1273035 ) ) ( not ( = ?auto_1273032 ?auto_1273037 ) ) ( not ( = ?auto_1273032 ?auto_1273038 ) ) ( not ( = ?auto_1273032 ?auto_1273039 ) ) ( not ( = ?auto_1273033 ?auto_1273030 ) ) ( not ( = ?auto_1273033 ?auto_1273034 ) ) ( not ( = ?auto_1273033 ?auto_1273036 ) ) ( not ( = ?auto_1273033 ?auto_1273035 ) ) ( not ( = ?auto_1273033 ?auto_1273037 ) ) ( not ( = ?auto_1273033 ?auto_1273038 ) ) ( not ( = ?auto_1273033 ?auto_1273039 ) ) ( not ( = ?auto_1273030 ?auto_1273034 ) ) ( not ( = ?auto_1273030 ?auto_1273036 ) ) ( not ( = ?auto_1273030 ?auto_1273035 ) ) ( not ( = ?auto_1273030 ?auto_1273037 ) ) ( not ( = ?auto_1273030 ?auto_1273038 ) ) ( not ( = ?auto_1273030 ?auto_1273039 ) ) ( not ( = ?auto_1273034 ?auto_1273036 ) ) ( not ( = ?auto_1273034 ?auto_1273035 ) ) ( not ( = ?auto_1273034 ?auto_1273037 ) ) ( not ( = ?auto_1273034 ?auto_1273038 ) ) ( not ( = ?auto_1273034 ?auto_1273039 ) ) ( not ( = ?auto_1273036 ?auto_1273035 ) ) ( not ( = ?auto_1273036 ?auto_1273037 ) ) ( not ( = ?auto_1273036 ?auto_1273038 ) ) ( not ( = ?auto_1273036 ?auto_1273039 ) ) ( not ( = ?auto_1273035 ?auto_1273037 ) ) ( not ( = ?auto_1273035 ?auto_1273038 ) ) ( not ( = ?auto_1273035 ?auto_1273039 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1273037 ?auto_1273038 ?auto_1273039 )
      ( MAKE-9CRATE-VERIFY ?auto_1273031 ?auto_1273032 ?auto_1273033 ?auto_1273030 ?auto_1273034 ?auto_1273036 ?auto_1273035 ?auto_1273037 ?auto_1273038 ?auto_1273039 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1273130 - SURFACE
      ?auto_1273131 - SURFACE
      ?auto_1273132 - SURFACE
      ?auto_1273129 - SURFACE
      ?auto_1273133 - SURFACE
      ?auto_1273135 - SURFACE
      ?auto_1273134 - SURFACE
      ?auto_1273136 - SURFACE
      ?auto_1273137 - SURFACE
      ?auto_1273138 - SURFACE
    )
    :vars
    (
      ?auto_1273141 - HOIST
      ?auto_1273143 - PLACE
      ?auto_1273139 - TRUCK
      ?auto_1273140 - PLACE
      ?auto_1273142 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1273141 ?auto_1273143 ) ( SURFACE-AT ?auto_1273137 ?auto_1273143 ) ( CLEAR ?auto_1273137 ) ( IS-CRATE ?auto_1273138 ) ( not ( = ?auto_1273137 ?auto_1273138 ) ) ( AVAILABLE ?auto_1273141 ) ( ON ?auto_1273137 ?auto_1273136 ) ( not ( = ?auto_1273136 ?auto_1273137 ) ) ( not ( = ?auto_1273136 ?auto_1273138 ) ) ( TRUCK-AT ?auto_1273139 ?auto_1273140 ) ( not ( = ?auto_1273140 ?auto_1273143 ) ) ( HOIST-AT ?auto_1273142 ?auto_1273140 ) ( LIFTING ?auto_1273142 ?auto_1273138 ) ( not ( = ?auto_1273141 ?auto_1273142 ) ) ( ON ?auto_1273131 ?auto_1273130 ) ( ON ?auto_1273132 ?auto_1273131 ) ( ON ?auto_1273129 ?auto_1273132 ) ( ON ?auto_1273133 ?auto_1273129 ) ( ON ?auto_1273135 ?auto_1273133 ) ( ON ?auto_1273134 ?auto_1273135 ) ( ON ?auto_1273136 ?auto_1273134 ) ( not ( = ?auto_1273130 ?auto_1273131 ) ) ( not ( = ?auto_1273130 ?auto_1273132 ) ) ( not ( = ?auto_1273130 ?auto_1273129 ) ) ( not ( = ?auto_1273130 ?auto_1273133 ) ) ( not ( = ?auto_1273130 ?auto_1273135 ) ) ( not ( = ?auto_1273130 ?auto_1273134 ) ) ( not ( = ?auto_1273130 ?auto_1273136 ) ) ( not ( = ?auto_1273130 ?auto_1273137 ) ) ( not ( = ?auto_1273130 ?auto_1273138 ) ) ( not ( = ?auto_1273131 ?auto_1273132 ) ) ( not ( = ?auto_1273131 ?auto_1273129 ) ) ( not ( = ?auto_1273131 ?auto_1273133 ) ) ( not ( = ?auto_1273131 ?auto_1273135 ) ) ( not ( = ?auto_1273131 ?auto_1273134 ) ) ( not ( = ?auto_1273131 ?auto_1273136 ) ) ( not ( = ?auto_1273131 ?auto_1273137 ) ) ( not ( = ?auto_1273131 ?auto_1273138 ) ) ( not ( = ?auto_1273132 ?auto_1273129 ) ) ( not ( = ?auto_1273132 ?auto_1273133 ) ) ( not ( = ?auto_1273132 ?auto_1273135 ) ) ( not ( = ?auto_1273132 ?auto_1273134 ) ) ( not ( = ?auto_1273132 ?auto_1273136 ) ) ( not ( = ?auto_1273132 ?auto_1273137 ) ) ( not ( = ?auto_1273132 ?auto_1273138 ) ) ( not ( = ?auto_1273129 ?auto_1273133 ) ) ( not ( = ?auto_1273129 ?auto_1273135 ) ) ( not ( = ?auto_1273129 ?auto_1273134 ) ) ( not ( = ?auto_1273129 ?auto_1273136 ) ) ( not ( = ?auto_1273129 ?auto_1273137 ) ) ( not ( = ?auto_1273129 ?auto_1273138 ) ) ( not ( = ?auto_1273133 ?auto_1273135 ) ) ( not ( = ?auto_1273133 ?auto_1273134 ) ) ( not ( = ?auto_1273133 ?auto_1273136 ) ) ( not ( = ?auto_1273133 ?auto_1273137 ) ) ( not ( = ?auto_1273133 ?auto_1273138 ) ) ( not ( = ?auto_1273135 ?auto_1273134 ) ) ( not ( = ?auto_1273135 ?auto_1273136 ) ) ( not ( = ?auto_1273135 ?auto_1273137 ) ) ( not ( = ?auto_1273135 ?auto_1273138 ) ) ( not ( = ?auto_1273134 ?auto_1273136 ) ) ( not ( = ?auto_1273134 ?auto_1273137 ) ) ( not ( = ?auto_1273134 ?auto_1273138 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1273136 ?auto_1273137 ?auto_1273138 )
      ( MAKE-9CRATE-VERIFY ?auto_1273130 ?auto_1273131 ?auto_1273132 ?auto_1273129 ?auto_1273133 ?auto_1273135 ?auto_1273134 ?auto_1273136 ?auto_1273137 ?auto_1273138 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1273238 - SURFACE
      ?auto_1273239 - SURFACE
      ?auto_1273240 - SURFACE
      ?auto_1273237 - SURFACE
      ?auto_1273241 - SURFACE
      ?auto_1273243 - SURFACE
      ?auto_1273242 - SURFACE
      ?auto_1273244 - SURFACE
      ?auto_1273245 - SURFACE
      ?auto_1273246 - SURFACE
    )
    :vars
    (
      ?auto_1273252 - HOIST
      ?auto_1273249 - PLACE
      ?auto_1273250 - TRUCK
      ?auto_1273248 - PLACE
      ?auto_1273247 - HOIST
      ?auto_1273251 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1273252 ?auto_1273249 ) ( SURFACE-AT ?auto_1273245 ?auto_1273249 ) ( CLEAR ?auto_1273245 ) ( IS-CRATE ?auto_1273246 ) ( not ( = ?auto_1273245 ?auto_1273246 ) ) ( AVAILABLE ?auto_1273252 ) ( ON ?auto_1273245 ?auto_1273244 ) ( not ( = ?auto_1273244 ?auto_1273245 ) ) ( not ( = ?auto_1273244 ?auto_1273246 ) ) ( TRUCK-AT ?auto_1273250 ?auto_1273248 ) ( not ( = ?auto_1273248 ?auto_1273249 ) ) ( HOIST-AT ?auto_1273247 ?auto_1273248 ) ( not ( = ?auto_1273252 ?auto_1273247 ) ) ( AVAILABLE ?auto_1273247 ) ( SURFACE-AT ?auto_1273246 ?auto_1273248 ) ( ON ?auto_1273246 ?auto_1273251 ) ( CLEAR ?auto_1273246 ) ( not ( = ?auto_1273245 ?auto_1273251 ) ) ( not ( = ?auto_1273246 ?auto_1273251 ) ) ( not ( = ?auto_1273244 ?auto_1273251 ) ) ( ON ?auto_1273239 ?auto_1273238 ) ( ON ?auto_1273240 ?auto_1273239 ) ( ON ?auto_1273237 ?auto_1273240 ) ( ON ?auto_1273241 ?auto_1273237 ) ( ON ?auto_1273243 ?auto_1273241 ) ( ON ?auto_1273242 ?auto_1273243 ) ( ON ?auto_1273244 ?auto_1273242 ) ( not ( = ?auto_1273238 ?auto_1273239 ) ) ( not ( = ?auto_1273238 ?auto_1273240 ) ) ( not ( = ?auto_1273238 ?auto_1273237 ) ) ( not ( = ?auto_1273238 ?auto_1273241 ) ) ( not ( = ?auto_1273238 ?auto_1273243 ) ) ( not ( = ?auto_1273238 ?auto_1273242 ) ) ( not ( = ?auto_1273238 ?auto_1273244 ) ) ( not ( = ?auto_1273238 ?auto_1273245 ) ) ( not ( = ?auto_1273238 ?auto_1273246 ) ) ( not ( = ?auto_1273238 ?auto_1273251 ) ) ( not ( = ?auto_1273239 ?auto_1273240 ) ) ( not ( = ?auto_1273239 ?auto_1273237 ) ) ( not ( = ?auto_1273239 ?auto_1273241 ) ) ( not ( = ?auto_1273239 ?auto_1273243 ) ) ( not ( = ?auto_1273239 ?auto_1273242 ) ) ( not ( = ?auto_1273239 ?auto_1273244 ) ) ( not ( = ?auto_1273239 ?auto_1273245 ) ) ( not ( = ?auto_1273239 ?auto_1273246 ) ) ( not ( = ?auto_1273239 ?auto_1273251 ) ) ( not ( = ?auto_1273240 ?auto_1273237 ) ) ( not ( = ?auto_1273240 ?auto_1273241 ) ) ( not ( = ?auto_1273240 ?auto_1273243 ) ) ( not ( = ?auto_1273240 ?auto_1273242 ) ) ( not ( = ?auto_1273240 ?auto_1273244 ) ) ( not ( = ?auto_1273240 ?auto_1273245 ) ) ( not ( = ?auto_1273240 ?auto_1273246 ) ) ( not ( = ?auto_1273240 ?auto_1273251 ) ) ( not ( = ?auto_1273237 ?auto_1273241 ) ) ( not ( = ?auto_1273237 ?auto_1273243 ) ) ( not ( = ?auto_1273237 ?auto_1273242 ) ) ( not ( = ?auto_1273237 ?auto_1273244 ) ) ( not ( = ?auto_1273237 ?auto_1273245 ) ) ( not ( = ?auto_1273237 ?auto_1273246 ) ) ( not ( = ?auto_1273237 ?auto_1273251 ) ) ( not ( = ?auto_1273241 ?auto_1273243 ) ) ( not ( = ?auto_1273241 ?auto_1273242 ) ) ( not ( = ?auto_1273241 ?auto_1273244 ) ) ( not ( = ?auto_1273241 ?auto_1273245 ) ) ( not ( = ?auto_1273241 ?auto_1273246 ) ) ( not ( = ?auto_1273241 ?auto_1273251 ) ) ( not ( = ?auto_1273243 ?auto_1273242 ) ) ( not ( = ?auto_1273243 ?auto_1273244 ) ) ( not ( = ?auto_1273243 ?auto_1273245 ) ) ( not ( = ?auto_1273243 ?auto_1273246 ) ) ( not ( = ?auto_1273243 ?auto_1273251 ) ) ( not ( = ?auto_1273242 ?auto_1273244 ) ) ( not ( = ?auto_1273242 ?auto_1273245 ) ) ( not ( = ?auto_1273242 ?auto_1273246 ) ) ( not ( = ?auto_1273242 ?auto_1273251 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1273244 ?auto_1273245 ?auto_1273246 )
      ( MAKE-9CRATE-VERIFY ?auto_1273238 ?auto_1273239 ?auto_1273240 ?auto_1273237 ?auto_1273241 ?auto_1273243 ?auto_1273242 ?auto_1273244 ?auto_1273245 ?auto_1273246 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1273347 - SURFACE
      ?auto_1273348 - SURFACE
      ?auto_1273349 - SURFACE
      ?auto_1273346 - SURFACE
      ?auto_1273350 - SURFACE
      ?auto_1273352 - SURFACE
      ?auto_1273351 - SURFACE
      ?auto_1273353 - SURFACE
      ?auto_1273354 - SURFACE
      ?auto_1273355 - SURFACE
    )
    :vars
    (
      ?auto_1273356 - HOIST
      ?auto_1273357 - PLACE
      ?auto_1273359 - PLACE
      ?auto_1273360 - HOIST
      ?auto_1273358 - SURFACE
      ?auto_1273361 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1273356 ?auto_1273357 ) ( SURFACE-AT ?auto_1273354 ?auto_1273357 ) ( CLEAR ?auto_1273354 ) ( IS-CRATE ?auto_1273355 ) ( not ( = ?auto_1273354 ?auto_1273355 ) ) ( AVAILABLE ?auto_1273356 ) ( ON ?auto_1273354 ?auto_1273353 ) ( not ( = ?auto_1273353 ?auto_1273354 ) ) ( not ( = ?auto_1273353 ?auto_1273355 ) ) ( not ( = ?auto_1273359 ?auto_1273357 ) ) ( HOIST-AT ?auto_1273360 ?auto_1273359 ) ( not ( = ?auto_1273356 ?auto_1273360 ) ) ( AVAILABLE ?auto_1273360 ) ( SURFACE-AT ?auto_1273355 ?auto_1273359 ) ( ON ?auto_1273355 ?auto_1273358 ) ( CLEAR ?auto_1273355 ) ( not ( = ?auto_1273354 ?auto_1273358 ) ) ( not ( = ?auto_1273355 ?auto_1273358 ) ) ( not ( = ?auto_1273353 ?auto_1273358 ) ) ( TRUCK-AT ?auto_1273361 ?auto_1273357 ) ( ON ?auto_1273348 ?auto_1273347 ) ( ON ?auto_1273349 ?auto_1273348 ) ( ON ?auto_1273346 ?auto_1273349 ) ( ON ?auto_1273350 ?auto_1273346 ) ( ON ?auto_1273352 ?auto_1273350 ) ( ON ?auto_1273351 ?auto_1273352 ) ( ON ?auto_1273353 ?auto_1273351 ) ( not ( = ?auto_1273347 ?auto_1273348 ) ) ( not ( = ?auto_1273347 ?auto_1273349 ) ) ( not ( = ?auto_1273347 ?auto_1273346 ) ) ( not ( = ?auto_1273347 ?auto_1273350 ) ) ( not ( = ?auto_1273347 ?auto_1273352 ) ) ( not ( = ?auto_1273347 ?auto_1273351 ) ) ( not ( = ?auto_1273347 ?auto_1273353 ) ) ( not ( = ?auto_1273347 ?auto_1273354 ) ) ( not ( = ?auto_1273347 ?auto_1273355 ) ) ( not ( = ?auto_1273347 ?auto_1273358 ) ) ( not ( = ?auto_1273348 ?auto_1273349 ) ) ( not ( = ?auto_1273348 ?auto_1273346 ) ) ( not ( = ?auto_1273348 ?auto_1273350 ) ) ( not ( = ?auto_1273348 ?auto_1273352 ) ) ( not ( = ?auto_1273348 ?auto_1273351 ) ) ( not ( = ?auto_1273348 ?auto_1273353 ) ) ( not ( = ?auto_1273348 ?auto_1273354 ) ) ( not ( = ?auto_1273348 ?auto_1273355 ) ) ( not ( = ?auto_1273348 ?auto_1273358 ) ) ( not ( = ?auto_1273349 ?auto_1273346 ) ) ( not ( = ?auto_1273349 ?auto_1273350 ) ) ( not ( = ?auto_1273349 ?auto_1273352 ) ) ( not ( = ?auto_1273349 ?auto_1273351 ) ) ( not ( = ?auto_1273349 ?auto_1273353 ) ) ( not ( = ?auto_1273349 ?auto_1273354 ) ) ( not ( = ?auto_1273349 ?auto_1273355 ) ) ( not ( = ?auto_1273349 ?auto_1273358 ) ) ( not ( = ?auto_1273346 ?auto_1273350 ) ) ( not ( = ?auto_1273346 ?auto_1273352 ) ) ( not ( = ?auto_1273346 ?auto_1273351 ) ) ( not ( = ?auto_1273346 ?auto_1273353 ) ) ( not ( = ?auto_1273346 ?auto_1273354 ) ) ( not ( = ?auto_1273346 ?auto_1273355 ) ) ( not ( = ?auto_1273346 ?auto_1273358 ) ) ( not ( = ?auto_1273350 ?auto_1273352 ) ) ( not ( = ?auto_1273350 ?auto_1273351 ) ) ( not ( = ?auto_1273350 ?auto_1273353 ) ) ( not ( = ?auto_1273350 ?auto_1273354 ) ) ( not ( = ?auto_1273350 ?auto_1273355 ) ) ( not ( = ?auto_1273350 ?auto_1273358 ) ) ( not ( = ?auto_1273352 ?auto_1273351 ) ) ( not ( = ?auto_1273352 ?auto_1273353 ) ) ( not ( = ?auto_1273352 ?auto_1273354 ) ) ( not ( = ?auto_1273352 ?auto_1273355 ) ) ( not ( = ?auto_1273352 ?auto_1273358 ) ) ( not ( = ?auto_1273351 ?auto_1273353 ) ) ( not ( = ?auto_1273351 ?auto_1273354 ) ) ( not ( = ?auto_1273351 ?auto_1273355 ) ) ( not ( = ?auto_1273351 ?auto_1273358 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1273353 ?auto_1273354 ?auto_1273355 )
      ( MAKE-9CRATE-VERIFY ?auto_1273347 ?auto_1273348 ?auto_1273349 ?auto_1273346 ?auto_1273350 ?auto_1273352 ?auto_1273351 ?auto_1273353 ?auto_1273354 ?auto_1273355 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1273456 - SURFACE
      ?auto_1273457 - SURFACE
      ?auto_1273458 - SURFACE
      ?auto_1273455 - SURFACE
      ?auto_1273459 - SURFACE
      ?auto_1273461 - SURFACE
      ?auto_1273460 - SURFACE
      ?auto_1273462 - SURFACE
      ?auto_1273463 - SURFACE
      ?auto_1273464 - SURFACE
    )
    :vars
    (
      ?auto_1273466 - HOIST
      ?auto_1273465 - PLACE
      ?auto_1273468 - PLACE
      ?auto_1273470 - HOIST
      ?auto_1273467 - SURFACE
      ?auto_1273469 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1273466 ?auto_1273465 ) ( IS-CRATE ?auto_1273464 ) ( not ( = ?auto_1273463 ?auto_1273464 ) ) ( not ( = ?auto_1273462 ?auto_1273463 ) ) ( not ( = ?auto_1273462 ?auto_1273464 ) ) ( not ( = ?auto_1273468 ?auto_1273465 ) ) ( HOIST-AT ?auto_1273470 ?auto_1273468 ) ( not ( = ?auto_1273466 ?auto_1273470 ) ) ( AVAILABLE ?auto_1273470 ) ( SURFACE-AT ?auto_1273464 ?auto_1273468 ) ( ON ?auto_1273464 ?auto_1273467 ) ( CLEAR ?auto_1273464 ) ( not ( = ?auto_1273463 ?auto_1273467 ) ) ( not ( = ?auto_1273464 ?auto_1273467 ) ) ( not ( = ?auto_1273462 ?auto_1273467 ) ) ( TRUCK-AT ?auto_1273469 ?auto_1273465 ) ( SURFACE-AT ?auto_1273462 ?auto_1273465 ) ( CLEAR ?auto_1273462 ) ( LIFTING ?auto_1273466 ?auto_1273463 ) ( IS-CRATE ?auto_1273463 ) ( ON ?auto_1273457 ?auto_1273456 ) ( ON ?auto_1273458 ?auto_1273457 ) ( ON ?auto_1273455 ?auto_1273458 ) ( ON ?auto_1273459 ?auto_1273455 ) ( ON ?auto_1273461 ?auto_1273459 ) ( ON ?auto_1273460 ?auto_1273461 ) ( ON ?auto_1273462 ?auto_1273460 ) ( not ( = ?auto_1273456 ?auto_1273457 ) ) ( not ( = ?auto_1273456 ?auto_1273458 ) ) ( not ( = ?auto_1273456 ?auto_1273455 ) ) ( not ( = ?auto_1273456 ?auto_1273459 ) ) ( not ( = ?auto_1273456 ?auto_1273461 ) ) ( not ( = ?auto_1273456 ?auto_1273460 ) ) ( not ( = ?auto_1273456 ?auto_1273462 ) ) ( not ( = ?auto_1273456 ?auto_1273463 ) ) ( not ( = ?auto_1273456 ?auto_1273464 ) ) ( not ( = ?auto_1273456 ?auto_1273467 ) ) ( not ( = ?auto_1273457 ?auto_1273458 ) ) ( not ( = ?auto_1273457 ?auto_1273455 ) ) ( not ( = ?auto_1273457 ?auto_1273459 ) ) ( not ( = ?auto_1273457 ?auto_1273461 ) ) ( not ( = ?auto_1273457 ?auto_1273460 ) ) ( not ( = ?auto_1273457 ?auto_1273462 ) ) ( not ( = ?auto_1273457 ?auto_1273463 ) ) ( not ( = ?auto_1273457 ?auto_1273464 ) ) ( not ( = ?auto_1273457 ?auto_1273467 ) ) ( not ( = ?auto_1273458 ?auto_1273455 ) ) ( not ( = ?auto_1273458 ?auto_1273459 ) ) ( not ( = ?auto_1273458 ?auto_1273461 ) ) ( not ( = ?auto_1273458 ?auto_1273460 ) ) ( not ( = ?auto_1273458 ?auto_1273462 ) ) ( not ( = ?auto_1273458 ?auto_1273463 ) ) ( not ( = ?auto_1273458 ?auto_1273464 ) ) ( not ( = ?auto_1273458 ?auto_1273467 ) ) ( not ( = ?auto_1273455 ?auto_1273459 ) ) ( not ( = ?auto_1273455 ?auto_1273461 ) ) ( not ( = ?auto_1273455 ?auto_1273460 ) ) ( not ( = ?auto_1273455 ?auto_1273462 ) ) ( not ( = ?auto_1273455 ?auto_1273463 ) ) ( not ( = ?auto_1273455 ?auto_1273464 ) ) ( not ( = ?auto_1273455 ?auto_1273467 ) ) ( not ( = ?auto_1273459 ?auto_1273461 ) ) ( not ( = ?auto_1273459 ?auto_1273460 ) ) ( not ( = ?auto_1273459 ?auto_1273462 ) ) ( not ( = ?auto_1273459 ?auto_1273463 ) ) ( not ( = ?auto_1273459 ?auto_1273464 ) ) ( not ( = ?auto_1273459 ?auto_1273467 ) ) ( not ( = ?auto_1273461 ?auto_1273460 ) ) ( not ( = ?auto_1273461 ?auto_1273462 ) ) ( not ( = ?auto_1273461 ?auto_1273463 ) ) ( not ( = ?auto_1273461 ?auto_1273464 ) ) ( not ( = ?auto_1273461 ?auto_1273467 ) ) ( not ( = ?auto_1273460 ?auto_1273462 ) ) ( not ( = ?auto_1273460 ?auto_1273463 ) ) ( not ( = ?auto_1273460 ?auto_1273464 ) ) ( not ( = ?auto_1273460 ?auto_1273467 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1273462 ?auto_1273463 ?auto_1273464 )
      ( MAKE-9CRATE-VERIFY ?auto_1273456 ?auto_1273457 ?auto_1273458 ?auto_1273455 ?auto_1273459 ?auto_1273461 ?auto_1273460 ?auto_1273462 ?auto_1273463 ?auto_1273464 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1273565 - SURFACE
      ?auto_1273566 - SURFACE
      ?auto_1273567 - SURFACE
      ?auto_1273564 - SURFACE
      ?auto_1273568 - SURFACE
      ?auto_1273570 - SURFACE
      ?auto_1273569 - SURFACE
      ?auto_1273571 - SURFACE
      ?auto_1273572 - SURFACE
      ?auto_1273573 - SURFACE
    )
    :vars
    (
      ?auto_1273575 - HOIST
      ?auto_1273577 - PLACE
      ?auto_1273579 - PLACE
      ?auto_1273574 - HOIST
      ?auto_1273576 - SURFACE
      ?auto_1273578 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1273575 ?auto_1273577 ) ( IS-CRATE ?auto_1273573 ) ( not ( = ?auto_1273572 ?auto_1273573 ) ) ( not ( = ?auto_1273571 ?auto_1273572 ) ) ( not ( = ?auto_1273571 ?auto_1273573 ) ) ( not ( = ?auto_1273579 ?auto_1273577 ) ) ( HOIST-AT ?auto_1273574 ?auto_1273579 ) ( not ( = ?auto_1273575 ?auto_1273574 ) ) ( AVAILABLE ?auto_1273574 ) ( SURFACE-AT ?auto_1273573 ?auto_1273579 ) ( ON ?auto_1273573 ?auto_1273576 ) ( CLEAR ?auto_1273573 ) ( not ( = ?auto_1273572 ?auto_1273576 ) ) ( not ( = ?auto_1273573 ?auto_1273576 ) ) ( not ( = ?auto_1273571 ?auto_1273576 ) ) ( TRUCK-AT ?auto_1273578 ?auto_1273577 ) ( SURFACE-AT ?auto_1273571 ?auto_1273577 ) ( CLEAR ?auto_1273571 ) ( IS-CRATE ?auto_1273572 ) ( AVAILABLE ?auto_1273575 ) ( IN ?auto_1273572 ?auto_1273578 ) ( ON ?auto_1273566 ?auto_1273565 ) ( ON ?auto_1273567 ?auto_1273566 ) ( ON ?auto_1273564 ?auto_1273567 ) ( ON ?auto_1273568 ?auto_1273564 ) ( ON ?auto_1273570 ?auto_1273568 ) ( ON ?auto_1273569 ?auto_1273570 ) ( ON ?auto_1273571 ?auto_1273569 ) ( not ( = ?auto_1273565 ?auto_1273566 ) ) ( not ( = ?auto_1273565 ?auto_1273567 ) ) ( not ( = ?auto_1273565 ?auto_1273564 ) ) ( not ( = ?auto_1273565 ?auto_1273568 ) ) ( not ( = ?auto_1273565 ?auto_1273570 ) ) ( not ( = ?auto_1273565 ?auto_1273569 ) ) ( not ( = ?auto_1273565 ?auto_1273571 ) ) ( not ( = ?auto_1273565 ?auto_1273572 ) ) ( not ( = ?auto_1273565 ?auto_1273573 ) ) ( not ( = ?auto_1273565 ?auto_1273576 ) ) ( not ( = ?auto_1273566 ?auto_1273567 ) ) ( not ( = ?auto_1273566 ?auto_1273564 ) ) ( not ( = ?auto_1273566 ?auto_1273568 ) ) ( not ( = ?auto_1273566 ?auto_1273570 ) ) ( not ( = ?auto_1273566 ?auto_1273569 ) ) ( not ( = ?auto_1273566 ?auto_1273571 ) ) ( not ( = ?auto_1273566 ?auto_1273572 ) ) ( not ( = ?auto_1273566 ?auto_1273573 ) ) ( not ( = ?auto_1273566 ?auto_1273576 ) ) ( not ( = ?auto_1273567 ?auto_1273564 ) ) ( not ( = ?auto_1273567 ?auto_1273568 ) ) ( not ( = ?auto_1273567 ?auto_1273570 ) ) ( not ( = ?auto_1273567 ?auto_1273569 ) ) ( not ( = ?auto_1273567 ?auto_1273571 ) ) ( not ( = ?auto_1273567 ?auto_1273572 ) ) ( not ( = ?auto_1273567 ?auto_1273573 ) ) ( not ( = ?auto_1273567 ?auto_1273576 ) ) ( not ( = ?auto_1273564 ?auto_1273568 ) ) ( not ( = ?auto_1273564 ?auto_1273570 ) ) ( not ( = ?auto_1273564 ?auto_1273569 ) ) ( not ( = ?auto_1273564 ?auto_1273571 ) ) ( not ( = ?auto_1273564 ?auto_1273572 ) ) ( not ( = ?auto_1273564 ?auto_1273573 ) ) ( not ( = ?auto_1273564 ?auto_1273576 ) ) ( not ( = ?auto_1273568 ?auto_1273570 ) ) ( not ( = ?auto_1273568 ?auto_1273569 ) ) ( not ( = ?auto_1273568 ?auto_1273571 ) ) ( not ( = ?auto_1273568 ?auto_1273572 ) ) ( not ( = ?auto_1273568 ?auto_1273573 ) ) ( not ( = ?auto_1273568 ?auto_1273576 ) ) ( not ( = ?auto_1273570 ?auto_1273569 ) ) ( not ( = ?auto_1273570 ?auto_1273571 ) ) ( not ( = ?auto_1273570 ?auto_1273572 ) ) ( not ( = ?auto_1273570 ?auto_1273573 ) ) ( not ( = ?auto_1273570 ?auto_1273576 ) ) ( not ( = ?auto_1273569 ?auto_1273571 ) ) ( not ( = ?auto_1273569 ?auto_1273572 ) ) ( not ( = ?auto_1273569 ?auto_1273573 ) ) ( not ( = ?auto_1273569 ?auto_1273576 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1273571 ?auto_1273572 ?auto_1273573 )
      ( MAKE-9CRATE-VERIFY ?auto_1273565 ?auto_1273566 ?auto_1273567 ?auto_1273564 ?auto_1273568 ?auto_1273570 ?auto_1273569 ?auto_1273571 ?auto_1273572 ?auto_1273573 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1279114 - SURFACE
      ?auto_1279115 - SURFACE
      ?auto_1279116 - SURFACE
      ?auto_1279113 - SURFACE
      ?auto_1279117 - SURFACE
      ?auto_1279119 - SURFACE
      ?auto_1279118 - SURFACE
      ?auto_1279120 - SURFACE
      ?auto_1279121 - SURFACE
      ?auto_1279122 - SURFACE
      ?auto_1279123 - SURFACE
    )
    :vars
    (
      ?auto_1279125 - HOIST
      ?auto_1279124 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1279125 ?auto_1279124 ) ( SURFACE-AT ?auto_1279122 ?auto_1279124 ) ( CLEAR ?auto_1279122 ) ( LIFTING ?auto_1279125 ?auto_1279123 ) ( IS-CRATE ?auto_1279123 ) ( not ( = ?auto_1279122 ?auto_1279123 ) ) ( ON ?auto_1279115 ?auto_1279114 ) ( ON ?auto_1279116 ?auto_1279115 ) ( ON ?auto_1279113 ?auto_1279116 ) ( ON ?auto_1279117 ?auto_1279113 ) ( ON ?auto_1279119 ?auto_1279117 ) ( ON ?auto_1279118 ?auto_1279119 ) ( ON ?auto_1279120 ?auto_1279118 ) ( ON ?auto_1279121 ?auto_1279120 ) ( ON ?auto_1279122 ?auto_1279121 ) ( not ( = ?auto_1279114 ?auto_1279115 ) ) ( not ( = ?auto_1279114 ?auto_1279116 ) ) ( not ( = ?auto_1279114 ?auto_1279113 ) ) ( not ( = ?auto_1279114 ?auto_1279117 ) ) ( not ( = ?auto_1279114 ?auto_1279119 ) ) ( not ( = ?auto_1279114 ?auto_1279118 ) ) ( not ( = ?auto_1279114 ?auto_1279120 ) ) ( not ( = ?auto_1279114 ?auto_1279121 ) ) ( not ( = ?auto_1279114 ?auto_1279122 ) ) ( not ( = ?auto_1279114 ?auto_1279123 ) ) ( not ( = ?auto_1279115 ?auto_1279116 ) ) ( not ( = ?auto_1279115 ?auto_1279113 ) ) ( not ( = ?auto_1279115 ?auto_1279117 ) ) ( not ( = ?auto_1279115 ?auto_1279119 ) ) ( not ( = ?auto_1279115 ?auto_1279118 ) ) ( not ( = ?auto_1279115 ?auto_1279120 ) ) ( not ( = ?auto_1279115 ?auto_1279121 ) ) ( not ( = ?auto_1279115 ?auto_1279122 ) ) ( not ( = ?auto_1279115 ?auto_1279123 ) ) ( not ( = ?auto_1279116 ?auto_1279113 ) ) ( not ( = ?auto_1279116 ?auto_1279117 ) ) ( not ( = ?auto_1279116 ?auto_1279119 ) ) ( not ( = ?auto_1279116 ?auto_1279118 ) ) ( not ( = ?auto_1279116 ?auto_1279120 ) ) ( not ( = ?auto_1279116 ?auto_1279121 ) ) ( not ( = ?auto_1279116 ?auto_1279122 ) ) ( not ( = ?auto_1279116 ?auto_1279123 ) ) ( not ( = ?auto_1279113 ?auto_1279117 ) ) ( not ( = ?auto_1279113 ?auto_1279119 ) ) ( not ( = ?auto_1279113 ?auto_1279118 ) ) ( not ( = ?auto_1279113 ?auto_1279120 ) ) ( not ( = ?auto_1279113 ?auto_1279121 ) ) ( not ( = ?auto_1279113 ?auto_1279122 ) ) ( not ( = ?auto_1279113 ?auto_1279123 ) ) ( not ( = ?auto_1279117 ?auto_1279119 ) ) ( not ( = ?auto_1279117 ?auto_1279118 ) ) ( not ( = ?auto_1279117 ?auto_1279120 ) ) ( not ( = ?auto_1279117 ?auto_1279121 ) ) ( not ( = ?auto_1279117 ?auto_1279122 ) ) ( not ( = ?auto_1279117 ?auto_1279123 ) ) ( not ( = ?auto_1279119 ?auto_1279118 ) ) ( not ( = ?auto_1279119 ?auto_1279120 ) ) ( not ( = ?auto_1279119 ?auto_1279121 ) ) ( not ( = ?auto_1279119 ?auto_1279122 ) ) ( not ( = ?auto_1279119 ?auto_1279123 ) ) ( not ( = ?auto_1279118 ?auto_1279120 ) ) ( not ( = ?auto_1279118 ?auto_1279121 ) ) ( not ( = ?auto_1279118 ?auto_1279122 ) ) ( not ( = ?auto_1279118 ?auto_1279123 ) ) ( not ( = ?auto_1279120 ?auto_1279121 ) ) ( not ( = ?auto_1279120 ?auto_1279122 ) ) ( not ( = ?auto_1279120 ?auto_1279123 ) ) ( not ( = ?auto_1279121 ?auto_1279122 ) ) ( not ( = ?auto_1279121 ?auto_1279123 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1279122 ?auto_1279123 )
      ( MAKE-10CRATE-VERIFY ?auto_1279114 ?auto_1279115 ?auto_1279116 ?auto_1279113 ?auto_1279117 ?auto_1279119 ?auto_1279118 ?auto_1279120 ?auto_1279121 ?auto_1279122 ?auto_1279123 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1279208 - SURFACE
      ?auto_1279209 - SURFACE
      ?auto_1279210 - SURFACE
      ?auto_1279207 - SURFACE
      ?auto_1279211 - SURFACE
      ?auto_1279213 - SURFACE
      ?auto_1279212 - SURFACE
      ?auto_1279214 - SURFACE
      ?auto_1279215 - SURFACE
      ?auto_1279216 - SURFACE
      ?auto_1279217 - SURFACE
    )
    :vars
    (
      ?auto_1279220 - HOIST
      ?auto_1279219 - PLACE
      ?auto_1279218 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1279220 ?auto_1279219 ) ( SURFACE-AT ?auto_1279216 ?auto_1279219 ) ( CLEAR ?auto_1279216 ) ( IS-CRATE ?auto_1279217 ) ( not ( = ?auto_1279216 ?auto_1279217 ) ) ( TRUCK-AT ?auto_1279218 ?auto_1279219 ) ( AVAILABLE ?auto_1279220 ) ( IN ?auto_1279217 ?auto_1279218 ) ( ON ?auto_1279216 ?auto_1279215 ) ( not ( = ?auto_1279215 ?auto_1279216 ) ) ( not ( = ?auto_1279215 ?auto_1279217 ) ) ( ON ?auto_1279209 ?auto_1279208 ) ( ON ?auto_1279210 ?auto_1279209 ) ( ON ?auto_1279207 ?auto_1279210 ) ( ON ?auto_1279211 ?auto_1279207 ) ( ON ?auto_1279213 ?auto_1279211 ) ( ON ?auto_1279212 ?auto_1279213 ) ( ON ?auto_1279214 ?auto_1279212 ) ( ON ?auto_1279215 ?auto_1279214 ) ( not ( = ?auto_1279208 ?auto_1279209 ) ) ( not ( = ?auto_1279208 ?auto_1279210 ) ) ( not ( = ?auto_1279208 ?auto_1279207 ) ) ( not ( = ?auto_1279208 ?auto_1279211 ) ) ( not ( = ?auto_1279208 ?auto_1279213 ) ) ( not ( = ?auto_1279208 ?auto_1279212 ) ) ( not ( = ?auto_1279208 ?auto_1279214 ) ) ( not ( = ?auto_1279208 ?auto_1279215 ) ) ( not ( = ?auto_1279208 ?auto_1279216 ) ) ( not ( = ?auto_1279208 ?auto_1279217 ) ) ( not ( = ?auto_1279209 ?auto_1279210 ) ) ( not ( = ?auto_1279209 ?auto_1279207 ) ) ( not ( = ?auto_1279209 ?auto_1279211 ) ) ( not ( = ?auto_1279209 ?auto_1279213 ) ) ( not ( = ?auto_1279209 ?auto_1279212 ) ) ( not ( = ?auto_1279209 ?auto_1279214 ) ) ( not ( = ?auto_1279209 ?auto_1279215 ) ) ( not ( = ?auto_1279209 ?auto_1279216 ) ) ( not ( = ?auto_1279209 ?auto_1279217 ) ) ( not ( = ?auto_1279210 ?auto_1279207 ) ) ( not ( = ?auto_1279210 ?auto_1279211 ) ) ( not ( = ?auto_1279210 ?auto_1279213 ) ) ( not ( = ?auto_1279210 ?auto_1279212 ) ) ( not ( = ?auto_1279210 ?auto_1279214 ) ) ( not ( = ?auto_1279210 ?auto_1279215 ) ) ( not ( = ?auto_1279210 ?auto_1279216 ) ) ( not ( = ?auto_1279210 ?auto_1279217 ) ) ( not ( = ?auto_1279207 ?auto_1279211 ) ) ( not ( = ?auto_1279207 ?auto_1279213 ) ) ( not ( = ?auto_1279207 ?auto_1279212 ) ) ( not ( = ?auto_1279207 ?auto_1279214 ) ) ( not ( = ?auto_1279207 ?auto_1279215 ) ) ( not ( = ?auto_1279207 ?auto_1279216 ) ) ( not ( = ?auto_1279207 ?auto_1279217 ) ) ( not ( = ?auto_1279211 ?auto_1279213 ) ) ( not ( = ?auto_1279211 ?auto_1279212 ) ) ( not ( = ?auto_1279211 ?auto_1279214 ) ) ( not ( = ?auto_1279211 ?auto_1279215 ) ) ( not ( = ?auto_1279211 ?auto_1279216 ) ) ( not ( = ?auto_1279211 ?auto_1279217 ) ) ( not ( = ?auto_1279213 ?auto_1279212 ) ) ( not ( = ?auto_1279213 ?auto_1279214 ) ) ( not ( = ?auto_1279213 ?auto_1279215 ) ) ( not ( = ?auto_1279213 ?auto_1279216 ) ) ( not ( = ?auto_1279213 ?auto_1279217 ) ) ( not ( = ?auto_1279212 ?auto_1279214 ) ) ( not ( = ?auto_1279212 ?auto_1279215 ) ) ( not ( = ?auto_1279212 ?auto_1279216 ) ) ( not ( = ?auto_1279212 ?auto_1279217 ) ) ( not ( = ?auto_1279214 ?auto_1279215 ) ) ( not ( = ?auto_1279214 ?auto_1279216 ) ) ( not ( = ?auto_1279214 ?auto_1279217 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1279215 ?auto_1279216 ?auto_1279217 )
      ( MAKE-10CRATE-VERIFY ?auto_1279208 ?auto_1279209 ?auto_1279210 ?auto_1279207 ?auto_1279211 ?auto_1279213 ?auto_1279212 ?auto_1279214 ?auto_1279215 ?auto_1279216 ?auto_1279217 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1279313 - SURFACE
      ?auto_1279314 - SURFACE
      ?auto_1279315 - SURFACE
      ?auto_1279312 - SURFACE
      ?auto_1279316 - SURFACE
      ?auto_1279318 - SURFACE
      ?auto_1279317 - SURFACE
      ?auto_1279319 - SURFACE
      ?auto_1279320 - SURFACE
      ?auto_1279321 - SURFACE
      ?auto_1279322 - SURFACE
    )
    :vars
    (
      ?auto_1279325 - HOIST
      ?auto_1279324 - PLACE
      ?auto_1279323 - TRUCK
      ?auto_1279326 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1279325 ?auto_1279324 ) ( SURFACE-AT ?auto_1279321 ?auto_1279324 ) ( CLEAR ?auto_1279321 ) ( IS-CRATE ?auto_1279322 ) ( not ( = ?auto_1279321 ?auto_1279322 ) ) ( AVAILABLE ?auto_1279325 ) ( IN ?auto_1279322 ?auto_1279323 ) ( ON ?auto_1279321 ?auto_1279320 ) ( not ( = ?auto_1279320 ?auto_1279321 ) ) ( not ( = ?auto_1279320 ?auto_1279322 ) ) ( TRUCK-AT ?auto_1279323 ?auto_1279326 ) ( not ( = ?auto_1279326 ?auto_1279324 ) ) ( ON ?auto_1279314 ?auto_1279313 ) ( ON ?auto_1279315 ?auto_1279314 ) ( ON ?auto_1279312 ?auto_1279315 ) ( ON ?auto_1279316 ?auto_1279312 ) ( ON ?auto_1279318 ?auto_1279316 ) ( ON ?auto_1279317 ?auto_1279318 ) ( ON ?auto_1279319 ?auto_1279317 ) ( ON ?auto_1279320 ?auto_1279319 ) ( not ( = ?auto_1279313 ?auto_1279314 ) ) ( not ( = ?auto_1279313 ?auto_1279315 ) ) ( not ( = ?auto_1279313 ?auto_1279312 ) ) ( not ( = ?auto_1279313 ?auto_1279316 ) ) ( not ( = ?auto_1279313 ?auto_1279318 ) ) ( not ( = ?auto_1279313 ?auto_1279317 ) ) ( not ( = ?auto_1279313 ?auto_1279319 ) ) ( not ( = ?auto_1279313 ?auto_1279320 ) ) ( not ( = ?auto_1279313 ?auto_1279321 ) ) ( not ( = ?auto_1279313 ?auto_1279322 ) ) ( not ( = ?auto_1279314 ?auto_1279315 ) ) ( not ( = ?auto_1279314 ?auto_1279312 ) ) ( not ( = ?auto_1279314 ?auto_1279316 ) ) ( not ( = ?auto_1279314 ?auto_1279318 ) ) ( not ( = ?auto_1279314 ?auto_1279317 ) ) ( not ( = ?auto_1279314 ?auto_1279319 ) ) ( not ( = ?auto_1279314 ?auto_1279320 ) ) ( not ( = ?auto_1279314 ?auto_1279321 ) ) ( not ( = ?auto_1279314 ?auto_1279322 ) ) ( not ( = ?auto_1279315 ?auto_1279312 ) ) ( not ( = ?auto_1279315 ?auto_1279316 ) ) ( not ( = ?auto_1279315 ?auto_1279318 ) ) ( not ( = ?auto_1279315 ?auto_1279317 ) ) ( not ( = ?auto_1279315 ?auto_1279319 ) ) ( not ( = ?auto_1279315 ?auto_1279320 ) ) ( not ( = ?auto_1279315 ?auto_1279321 ) ) ( not ( = ?auto_1279315 ?auto_1279322 ) ) ( not ( = ?auto_1279312 ?auto_1279316 ) ) ( not ( = ?auto_1279312 ?auto_1279318 ) ) ( not ( = ?auto_1279312 ?auto_1279317 ) ) ( not ( = ?auto_1279312 ?auto_1279319 ) ) ( not ( = ?auto_1279312 ?auto_1279320 ) ) ( not ( = ?auto_1279312 ?auto_1279321 ) ) ( not ( = ?auto_1279312 ?auto_1279322 ) ) ( not ( = ?auto_1279316 ?auto_1279318 ) ) ( not ( = ?auto_1279316 ?auto_1279317 ) ) ( not ( = ?auto_1279316 ?auto_1279319 ) ) ( not ( = ?auto_1279316 ?auto_1279320 ) ) ( not ( = ?auto_1279316 ?auto_1279321 ) ) ( not ( = ?auto_1279316 ?auto_1279322 ) ) ( not ( = ?auto_1279318 ?auto_1279317 ) ) ( not ( = ?auto_1279318 ?auto_1279319 ) ) ( not ( = ?auto_1279318 ?auto_1279320 ) ) ( not ( = ?auto_1279318 ?auto_1279321 ) ) ( not ( = ?auto_1279318 ?auto_1279322 ) ) ( not ( = ?auto_1279317 ?auto_1279319 ) ) ( not ( = ?auto_1279317 ?auto_1279320 ) ) ( not ( = ?auto_1279317 ?auto_1279321 ) ) ( not ( = ?auto_1279317 ?auto_1279322 ) ) ( not ( = ?auto_1279319 ?auto_1279320 ) ) ( not ( = ?auto_1279319 ?auto_1279321 ) ) ( not ( = ?auto_1279319 ?auto_1279322 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1279320 ?auto_1279321 ?auto_1279322 )
      ( MAKE-10CRATE-VERIFY ?auto_1279313 ?auto_1279314 ?auto_1279315 ?auto_1279312 ?auto_1279316 ?auto_1279318 ?auto_1279317 ?auto_1279319 ?auto_1279320 ?auto_1279321 ?auto_1279322 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1279428 - SURFACE
      ?auto_1279429 - SURFACE
      ?auto_1279430 - SURFACE
      ?auto_1279427 - SURFACE
      ?auto_1279431 - SURFACE
      ?auto_1279433 - SURFACE
      ?auto_1279432 - SURFACE
      ?auto_1279434 - SURFACE
      ?auto_1279435 - SURFACE
      ?auto_1279436 - SURFACE
      ?auto_1279437 - SURFACE
    )
    :vars
    (
      ?auto_1279442 - HOIST
      ?auto_1279438 - PLACE
      ?auto_1279439 - TRUCK
      ?auto_1279441 - PLACE
      ?auto_1279440 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1279442 ?auto_1279438 ) ( SURFACE-AT ?auto_1279436 ?auto_1279438 ) ( CLEAR ?auto_1279436 ) ( IS-CRATE ?auto_1279437 ) ( not ( = ?auto_1279436 ?auto_1279437 ) ) ( AVAILABLE ?auto_1279442 ) ( ON ?auto_1279436 ?auto_1279435 ) ( not ( = ?auto_1279435 ?auto_1279436 ) ) ( not ( = ?auto_1279435 ?auto_1279437 ) ) ( TRUCK-AT ?auto_1279439 ?auto_1279441 ) ( not ( = ?auto_1279441 ?auto_1279438 ) ) ( HOIST-AT ?auto_1279440 ?auto_1279441 ) ( LIFTING ?auto_1279440 ?auto_1279437 ) ( not ( = ?auto_1279442 ?auto_1279440 ) ) ( ON ?auto_1279429 ?auto_1279428 ) ( ON ?auto_1279430 ?auto_1279429 ) ( ON ?auto_1279427 ?auto_1279430 ) ( ON ?auto_1279431 ?auto_1279427 ) ( ON ?auto_1279433 ?auto_1279431 ) ( ON ?auto_1279432 ?auto_1279433 ) ( ON ?auto_1279434 ?auto_1279432 ) ( ON ?auto_1279435 ?auto_1279434 ) ( not ( = ?auto_1279428 ?auto_1279429 ) ) ( not ( = ?auto_1279428 ?auto_1279430 ) ) ( not ( = ?auto_1279428 ?auto_1279427 ) ) ( not ( = ?auto_1279428 ?auto_1279431 ) ) ( not ( = ?auto_1279428 ?auto_1279433 ) ) ( not ( = ?auto_1279428 ?auto_1279432 ) ) ( not ( = ?auto_1279428 ?auto_1279434 ) ) ( not ( = ?auto_1279428 ?auto_1279435 ) ) ( not ( = ?auto_1279428 ?auto_1279436 ) ) ( not ( = ?auto_1279428 ?auto_1279437 ) ) ( not ( = ?auto_1279429 ?auto_1279430 ) ) ( not ( = ?auto_1279429 ?auto_1279427 ) ) ( not ( = ?auto_1279429 ?auto_1279431 ) ) ( not ( = ?auto_1279429 ?auto_1279433 ) ) ( not ( = ?auto_1279429 ?auto_1279432 ) ) ( not ( = ?auto_1279429 ?auto_1279434 ) ) ( not ( = ?auto_1279429 ?auto_1279435 ) ) ( not ( = ?auto_1279429 ?auto_1279436 ) ) ( not ( = ?auto_1279429 ?auto_1279437 ) ) ( not ( = ?auto_1279430 ?auto_1279427 ) ) ( not ( = ?auto_1279430 ?auto_1279431 ) ) ( not ( = ?auto_1279430 ?auto_1279433 ) ) ( not ( = ?auto_1279430 ?auto_1279432 ) ) ( not ( = ?auto_1279430 ?auto_1279434 ) ) ( not ( = ?auto_1279430 ?auto_1279435 ) ) ( not ( = ?auto_1279430 ?auto_1279436 ) ) ( not ( = ?auto_1279430 ?auto_1279437 ) ) ( not ( = ?auto_1279427 ?auto_1279431 ) ) ( not ( = ?auto_1279427 ?auto_1279433 ) ) ( not ( = ?auto_1279427 ?auto_1279432 ) ) ( not ( = ?auto_1279427 ?auto_1279434 ) ) ( not ( = ?auto_1279427 ?auto_1279435 ) ) ( not ( = ?auto_1279427 ?auto_1279436 ) ) ( not ( = ?auto_1279427 ?auto_1279437 ) ) ( not ( = ?auto_1279431 ?auto_1279433 ) ) ( not ( = ?auto_1279431 ?auto_1279432 ) ) ( not ( = ?auto_1279431 ?auto_1279434 ) ) ( not ( = ?auto_1279431 ?auto_1279435 ) ) ( not ( = ?auto_1279431 ?auto_1279436 ) ) ( not ( = ?auto_1279431 ?auto_1279437 ) ) ( not ( = ?auto_1279433 ?auto_1279432 ) ) ( not ( = ?auto_1279433 ?auto_1279434 ) ) ( not ( = ?auto_1279433 ?auto_1279435 ) ) ( not ( = ?auto_1279433 ?auto_1279436 ) ) ( not ( = ?auto_1279433 ?auto_1279437 ) ) ( not ( = ?auto_1279432 ?auto_1279434 ) ) ( not ( = ?auto_1279432 ?auto_1279435 ) ) ( not ( = ?auto_1279432 ?auto_1279436 ) ) ( not ( = ?auto_1279432 ?auto_1279437 ) ) ( not ( = ?auto_1279434 ?auto_1279435 ) ) ( not ( = ?auto_1279434 ?auto_1279436 ) ) ( not ( = ?auto_1279434 ?auto_1279437 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1279435 ?auto_1279436 ?auto_1279437 )
      ( MAKE-10CRATE-VERIFY ?auto_1279428 ?auto_1279429 ?auto_1279430 ?auto_1279427 ?auto_1279431 ?auto_1279433 ?auto_1279432 ?auto_1279434 ?auto_1279435 ?auto_1279436 ?auto_1279437 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1279553 - SURFACE
      ?auto_1279554 - SURFACE
      ?auto_1279555 - SURFACE
      ?auto_1279552 - SURFACE
      ?auto_1279556 - SURFACE
      ?auto_1279558 - SURFACE
      ?auto_1279557 - SURFACE
      ?auto_1279559 - SURFACE
      ?auto_1279560 - SURFACE
      ?auto_1279561 - SURFACE
      ?auto_1279562 - SURFACE
    )
    :vars
    (
      ?auto_1279565 - HOIST
      ?auto_1279568 - PLACE
      ?auto_1279563 - TRUCK
      ?auto_1279566 - PLACE
      ?auto_1279567 - HOIST
      ?auto_1279564 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1279565 ?auto_1279568 ) ( SURFACE-AT ?auto_1279561 ?auto_1279568 ) ( CLEAR ?auto_1279561 ) ( IS-CRATE ?auto_1279562 ) ( not ( = ?auto_1279561 ?auto_1279562 ) ) ( AVAILABLE ?auto_1279565 ) ( ON ?auto_1279561 ?auto_1279560 ) ( not ( = ?auto_1279560 ?auto_1279561 ) ) ( not ( = ?auto_1279560 ?auto_1279562 ) ) ( TRUCK-AT ?auto_1279563 ?auto_1279566 ) ( not ( = ?auto_1279566 ?auto_1279568 ) ) ( HOIST-AT ?auto_1279567 ?auto_1279566 ) ( not ( = ?auto_1279565 ?auto_1279567 ) ) ( AVAILABLE ?auto_1279567 ) ( SURFACE-AT ?auto_1279562 ?auto_1279566 ) ( ON ?auto_1279562 ?auto_1279564 ) ( CLEAR ?auto_1279562 ) ( not ( = ?auto_1279561 ?auto_1279564 ) ) ( not ( = ?auto_1279562 ?auto_1279564 ) ) ( not ( = ?auto_1279560 ?auto_1279564 ) ) ( ON ?auto_1279554 ?auto_1279553 ) ( ON ?auto_1279555 ?auto_1279554 ) ( ON ?auto_1279552 ?auto_1279555 ) ( ON ?auto_1279556 ?auto_1279552 ) ( ON ?auto_1279558 ?auto_1279556 ) ( ON ?auto_1279557 ?auto_1279558 ) ( ON ?auto_1279559 ?auto_1279557 ) ( ON ?auto_1279560 ?auto_1279559 ) ( not ( = ?auto_1279553 ?auto_1279554 ) ) ( not ( = ?auto_1279553 ?auto_1279555 ) ) ( not ( = ?auto_1279553 ?auto_1279552 ) ) ( not ( = ?auto_1279553 ?auto_1279556 ) ) ( not ( = ?auto_1279553 ?auto_1279558 ) ) ( not ( = ?auto_1279553 ?auto_1279557 ) ) ( not ( = ?auto_1279553 ?auto_1279559 ) ) ( not ( = ?auto_1279553 ?auto_1279560 ) ) ( not ( = ?auto_1279553 ?auto_1279561 ) ) ( not ( = ?auto_1279553 ?auto_1279562 ) ) ( not ( = ?auto_1279553 ?auto_1279564 ) ) ( not ( = ?auto_1279554 ?auto_1279555 ) ) ( not ( = ?auto_1279554 ?auto_1279552 ) ) ( not ( = ?auto_1279554 ?auto_1279556 ) ) ( not ( = ?auto_1279554 ?auto_1279558 ) ) ( not ( = ?auto_1279554 ?auto_1279557 ) ) ( not ( = ?auto_1279554 ?auto_1279559 ) ) ( not ( = ?auto_1279554 ?auto_1279560 ) ) ( not ( = ?auto_1279554 ?auto_1279561 ) ) ( not ( = ?auto_1279554 ?auto_1279562 ) ) ( not ( = ?auto_1279554 ?auto_1279564 ) ) ( not ( = ?auto_1279555 ?auto_1279552 ) ) ( not ( = ?auto_1279555 ?auto_1279556 ) ) ( not ( = ?auto_1279555 ?auto_1279558 ) ) ( not ( = ?auto_1279555 ?auto_1279557 ) ) ( not ( = ?auto_1279555 ?auto_1279559 ) ) ( not ( = ?auto_1279555 ?auto_1279560 ) ) ( not ( = ?auto_1279555 ?auto_1279561 ) ) ( not ( = ?auto_1279555 ?auto_1279562 ) ) ( not ( = ?auto_1279555 ?auto_1279564 ) ) ( not ( = ?auto_1279552 ?auto_1279556 ) ) ( not ( = ?auto_1279552 ?auto_1279558 ) ) ( not ( = ?auto_1279552 ?auto_1279557 ) ) ( not ( = ?auto_1279552 ?auto_1279559 ) ) ( not ( = ?auto_1279552 ?auto_1279560 ) ) ( not ( = ?auto_1279552 ?auto_1279561 ) ) ( not ( = ?auto_1279552 ?auto_1279562 ) ) ( not ( = ?auto_1279552 ?auto_1279564 ) ) ( not ( = ?auto_1279556 ?auto_1279558 ) ) ( not ( = ?auto_1279556 ?auto_1279557 ) ) ( not ( = ?auto_1279556 ?auto_1279559 ) ) ( not ( = ?auto_1279556 ?auto_1279560 ) ) ( not ( = ?auto_1279556 ?auto_1279561 ) ) ( not ( = ?auto_1279556 ?auto_1279562 ) ) ( not ( = ?auto_1279556 ?auto_1279564 ) ) ( not ( = ?auto_1279558 ?auto_1279557 ) ) ( not ( = ?auto_1279558 ?auto_1279559 ) ) ( not ( = ?auto_1279558 ?auto_1279560 ) ) ( not ( = ?auto_1279558 ?auto_1279561 ) ) ( not ( = ?auto_1279558 ?auto_1279562 ) ) ( not ( = ?auto_1279558 ?auto_1279564 ) ) ( not ( = ?auto_1279557 ?auto_1279559 ) ) ( not ( = ?auto_1279557 ?auto_1279560 ) ) ( not ( = ?auto_1279557 ?auto_1279561 ) ) ( not ( = ?auto_1279557 ?auto_1279562 ) ) ( not ( = ?auto_1279557 ?auto_1279564 ) ) ( not ( = ?auto_1279559 ?auto_1279560 ) ) ( not ( = ?auto_1279559 ?auto_1279561 ) ) ( not ( = ?auto_1279559 ?auto_1279562 ) ) ( not ( = ?auto_1279559 ?auto_1279564 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1279560 ?auto_1279561 ?auto_1279562 )
      ( MAKE-10CRATE-VERIFY ?auto_1279553 ?auto_1279554 ?auto_1279555 ?auto_1279552 ?auto_1279556 ?auto_1279558 ?auto_1279557 ?auto_1279559 ?auto_1279560 ?auto_1279561 ?auto_1279562 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1279679 - SURFACE
      ?auto_1279680 - SURFACE
      ?auto_1279681 - SURFACE
      ?auto_1279678 - SURFACE
      ?auto_1279682 - SURFACE
      ?auto_1279684 - SURFACE
      ?auto_1279683 - SURFACE
      ?auto_1279685 - SURFACE
      ?auto_1279686 - SURFACE
      ?auto_1279687 - SURFACE
      ?auto_1279688 - SURFACE
    )
    :vars
    (
      ?auto_1279692 - HOIST
      ?auto_1279694 - PLACE
      ?auto_1279691 - PLACE
      ?auto_1279690 - HOIST
      ?auto_1279693 - SURFACE
      ?auto_1279689 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1279692 ?auto_1279694 ) ( SURFACE-AT ?auto_1279687 ?auto_1279694 ) ( CLEAR ?auto_1279687 ) ( IS-CRATE ?auto_1279688 ) ( not ( = ?auto_1279687 ?auto_1279688 ) ) ( AVAILABLE ?auto_1279692 ) ( ON ?auto_1279687 ?auto_1279686 ) ( not ( = ?auto_1279686 ?auto_1279687 ) ) ( not ( = ?auto_1279686 ?auto_1279688 ) ) ( not ( = ?auto_1279691 ?auto_1279694 ) ) ( HOIST-AT ?auto_1279690 ?auto_1279691 ) ( not ( = ?auto_1279692 ?auto_1279690 ) ) ( AVAILABLE ?auto_1279690 ) ( SURFACE-AT ?auto_1279688 ?auto_1279691 ) ( ON ?auto_1279688 ?auto_1279693 ) ( CLEAR ?auto_1279688 ) ( not ( = ?auto_1279687 ?auto_1279693 ) ) ( not ( = ?auto_1279688 ?auto_1279693 ) ) ( not ( = ?auto_1279686 ?auto_1279693 ) ) ( TRUCK-AT ?auto_1279689 ?auto_1279694 ) ( ON ?auto_1279680 ?auto_1279679 ) ( ON ?auto_1279681 ?auto_1279680 ) ( ON ?auto_1279678 ?auto_1279681 ) ( ON ?auto_1279682 ?auto_1279678 ) ( ON ?auto_1279684 ?auto_1279682 ) ( ON ?auto_1279683 ?auto_1279684 ) ( ON ?auto_1279685 ?auto_1279683 ) ( ON ?auto_1279686 ?auto_1279685 ) ( not ( = ?auto_1279679 ?auto_1279680 ) ) ( not ( = ?auto_1279679 ?auto_1279681 ) ) ( not ( = ?auto_1279679 ?auto_1279678 ) ) ( not ( = ?auto_1279679 ?auto_1279682 ) ) ( not ( = ?auto_1279679 ?auto_1279684 ) ) ( not ( = ?auto_1279679 ?auto_1279683 ) ) ( not ( = ?auto_1279679 ?auto_1279685 ) ) ( not ( = ?auto_1279679 ?auto_1279686 ) ) ( not ( = ?auto_1279679 ?auto_1279687 ) ) ( not ( = ?auto_1279679 ?auto_1279688 ) ) ( not ( = ?auto_1279679 ?auto_1279693 ) ) ( not ( = ?auto_1279680 ?auto_1279681 ) ) ( not ( = ?auto_1279680 ?auto_1279678 ) ) ( not ( = ?auto_1279680 ?auto_1279682 ) ) ( not ( = ?auto_1279680 ?auto_1279684 ) ) ( not ( = ?auto_1279680 ?auto_1279683 ) ) ( not ( = ?auto_1279680 ?auto_1279685 ) ) ( not ( = ?auto_1279680 ?auto_1279686 ) ) ( not ( = ?auto_1279680 ?auto_1279687 ) ) ( not ( = ?auto_1279680 ?auto_1279688 ) ) ( not ( = ?auto_1279680 ?auto_1279693 ) ) ( not ( = ?auto_1279681 ?auto_1279678 ) ) ( not ( = ?auto_1279681 ?auto_1279682 ) ) ( not ( = ?auto_1279681 ?auto_1279684 ) ) ( not ( = ?auto_1279681 ?auto_1279683 ) ) ( not ( = ?auto_1279681 ?auto_1279685 ) ) ( not ( = ?auto_1279681 ?auto_1279686 ) ) ( not ( = ?auto_1279681 ?auto_1279687 ) ) ( not ( = ?auto_1279681 ?auto_1279688 ) ) ( not ( = ?auto_1279681 ?auto_1279693 ) ) ( not ( = ?auto_1279678 ?auto_1279682 ) ) ( not ( = ?auto_1279678 ?auto_1279684 ) ) ( not ( = ?auto_1279678 ?auto_1279683 ) ) ( not ( = ?auto_1279678 ?auto_1279685 ) ) ( not ( = ?auto_1279678 ?auto_1279686 ) ) ( not ( = ?auto_1279678 ?auto_1279687 ) ) ( not ( = ?auto_1279678 ?auto_1279688 ) ) ( not ( = ?auto_1279678 ?auto_1279693 ) ) ( not ( = ?auto_1279682 ?auto_1279684 ) ) ( not ( = ?auto_1279682 ?auto_1279683 ) ) ( not ( = ?auto_1279682 ?auto_1279685 ) ) ( not ( = ?auto_1279682 ?auto_1279686 ) ) ( not ( = ?auto_1279682 ?auto_1279687 ) ) ( not ( = ?auto_1279682 ?auto_1279688 ) ) ( not ( = ?auto_1279682 ?auto_1279693 ) ) ( not ( = ?auto_1279684 ?auto_1279683 ) ) ( not ( = ?auto_1279684 ?auto_1279685 ) ) ( not ( = ?auto_1279684 ?auto_1279686 ) ) ( not ( = ?auto_1279684 ?auto_1279687 ) ) ( not ( = ?auto_1279684 ?auto_1279688 ) ) ( not ( = ?auto_1279684 ?auto_1279693 ) ) ( not ( = ?auto_1279683 ?auto_1279685 ) ) ( not ( = ?auto_1279683 ?auto_1279686 ) ) ( not ( = ?auto_1279683 ?auto_1279687 ) ) ( not ( = ?auto_1279683 ?auto_1279688 ) ) ( not ( = ?auto_1279683 ?auto_1279693 ) ) ( not ( = ?auto_1279685 ?auto_1279686 ) ) ( not ( = ?auto_1279685 ?auto_1279687 ) ) ( not ( = ?auto_1279685 ?auto_1279688 ) ) ( not ( = ?auto_1279685 ?auto_1279693 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1279686 ?auto_1279687 ?auto_1279688 )
      ( MAKE-10CRATE-VERIFY ?auto_1279679 ?auto_1279680 ?auto_1279681 ?auto_1279678 ?auto_1279682 ?auto_1279684 ?auto_1279683 ?auto_1279685 ?auto_1279686 ?auto_1279687 ?auto_1279688 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1279805 - SURFACE
      ?auto_1279806 - SURFACE
      ?auto_1279807 - SURFACE
      ?auto_1279804 - SURFACE
      ?auto_1279808 - SURFACE
      ?auto_1279810 - SURFACE
      ?auto_1279809 - SURFACE
      ?auto_1279811 - SURFACE
      ?auto_1279812 - SURFACE
      ?auto_1279813 - SURFACE
      ?auto_1279814 - SURFACE
    )
    :vars
    (
      ?auto_1279817 - HOIST
      ?auto_1279816 - PLACE
      ?auto_1279819 - PLACE
      ?auto_1279815 - HOIST
      ?auto_1279820 - SURFACE
      ?auto_1279818 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1279817 ?auto_1279816 ) ( IS-CRATE ?auto_1279814 ) ( not ( = ?auto_1279813 ?auto_1279814 ) ) ( not ( = ?auto_1279812 ?auto_1279813 ) ) ( not ( = ?auto_1279812 ?auto_1279814 ) ) ( not ( = ?auto_1279819 ?auto_1279816 ) ) ( HOIST-AT ?auto_1279815 ?auto_1279819 ) ( not ( = ?auto_1279817 ?auto_1279815 ) ) ( AVAILABLE ?auto_1279815 ) ( SURFACE-AT ?auto_1279814 ?auto_1279819 ) ( ON ?auto_1279814 ?auto_1279820 ) ( CLEAR ?auto_1279814 ) ( not ( = ?auto_1279813 ?auto_1279820 ) ) ( not ( = ?auto_1279814 ?auto_1279820 ) ) ( not ( = ?auto_1279812 ?auto_1279820 ) ) ( TRUCK-AT ?auto_1279818 ?auto_1279816 ) ( SURFACE-AT ?auto_1279812 ?auto_1279816 ) ( CLEAR ?auto_1279812 ) ( LIFTING ?auto_1279817 ?auto_1279813 ) ( IS-CRATE ?auto_1279813 ) ( ON ?auto_1279806 ?auto_1279805 ) ( ON ?auto_1279807 ?auto_1279806 ) ( ON ?auto_1279804 ?auto_1279807 ) ( ON ?auto_1279808 ?auto_1279804 ) ( ON ?auto_1279810 ?auto_1279808 ) ( ON ?auto_1279809 ?auto_1279810 ) ( ON ?auto_1279811 ?auto_1279809 ) ( ON ?auto_1279812 ?auto_1279811 ) ( not ( = ?auto_1279805 ?auto_1279806 ) ) ( not ( = ?auto_1279805 ?auto_1279807 ) ) ( not ( = ?auto_1279805 ?auto_1279804 ) ) ( not ( = ?auto_1279805 ?auto_1279808 ) ) ( not ( = ?auto_1279805 ?auto_1279810 ) ) ( not ( = ?auto_1279805 ?auto_1279809 ) ) ( not ( = ?auto_1279805 ?auto_1279811 ) ) ( not ( = ?auto_1279805 ?auto_1279812 ) ) ( not ( = ?auto_1279805 ?auto_1279813 ) ) ( not ( = ?auto_1279805 ?auto_1279814 ) ) ( not ( = ?auto_1279805 ?auto_1279820 ) ) ( not ( = ?auto_1279806 ?auto_1279807 ) ) ( not ( = ?auto_1279806 ?auto_1279804 ) ) ( not ( = ?auto_1279806 ?auto_1279808 ) ) ( not ( = ?auto_1279806 ?auto_1279810 ) ) ( not ( = ?auto_1279806 ?auto_1279809 ) ) ( not ( = ?auto_1279806 ?auto_1279811 ) ) ( not ( = ?auto_1279806 ?auto_1279812 ) ) ( not ( = ?auto_1279806 ?auto_1279813 ) ) ( not ( = ?auto_1279806 ?auto_1279814 ) ) ( not ( = ?auto_1279806 ?auto_1279820 ) ) ( not ( = ?auto_1279807 ?auto_1279804 ) ) ( not ( = ?auto_1279807 ?auto_1279808 ) ) ( not ( = ?auto_1279807 ?auto_1279810 ) ) ( not ( = ?auto_1279807 ?auto_1279809 ) ) ( not ( = ?auto_1279807 ?auto_1279811 ) ) ( not ( = ?auto_1279807 ?auto_1279812 ) ) ( not ( = ?auto_1279807 ?auto_1279813 ) ) ( not ( = ?auto_1279807 ?auto_1279814 ) ) ( not ( = ?auto_1279807 ?auto_1279820 ) ) ( not ( = ?auto_1279804 ?auto_1279808 ) ) ( not ( = ?auto_1279804 ?auto_1279810 ) ) ( not ( = ?auto_1279804 ?auto_1279809 ) ) ( not ( = ?auto_1279804 ?auto_1279811 ) ) ( not ( = ?auto_1279804 ?auto_1279812 ) ) ( not ( = ?auto_1279804 ?auto_1279813 ) ) ( not ( = ?auto_1279804 ?auto_1279814 ) ) ( not ( = ?auto_1279804 ?auto_1279820 ) ) ( not ( = ?auto_1279808 ?auto_1279810 ) ) ( not ( = ?auto_1279808 ?auto_1279809 ) ) ( not ( = ?auto_1279808 ?auto_1279811 ) ) ( not ( = ?auto_1279808 ?auto_1279812 ) ) ( not ( = ?auto_1279808 ?auto_1279813 ) ) ( not ( = ?auto_1279808 ?auto_1279814 ) ) ( not ( = ?auto_1279808 ?auto_1279820 ) ) ( not ( = ?auto_1279810 ?auto_1279809 ) ) ( not ( = ?auto_1279810 ?auto_1279811 ) ) ( not ( = ?auto_1279810 ?auto_1279812 ) ) ( not ( = ?auto_1279810 ?auto_1279813 ) ) ( not ( = ?auto_1279810 ?auto_1279814 ) ) ( not ( = ?auto_1279810 ?auto_1279820 ) ) ( not ( = ?auto_1279809 ?auto_1279811 ) ) ( not ( = ?auto_1279809 ?auto_1279812 ) ) ( not ( = ?auto_1279809 ?auto_1279813 ) ) ( not ( = ?auto_1279809 ?auto_1279814 ) ) ( not ( = ?auto_1279809 ?auto_1279820 ) ) ( not ( = ?auto_1279811 ?auto_1279812 ) ) ( not ( = ?auto_1279811 ?auto_1279813 ) ) ( not ( = ?auto_1279811 ?auto_1279814 ) ) ( not ( = ?auto_1279811 ?auto_1279820 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1279812 ?auto_1279813 ?auto_1279814 )
      ( MAKE-10CRATE-VERIFY ?auto_1279805 ?auto_1279806 ?auto_1279807 ?auto_1279804 ?auto_1279808 ?auto_1279810 ?auto_1279809 ?auto_1279811 ?auto_1279812 ?auto_1279813 ?auto_1279814 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1279931 - SURFACE
      ?auto_1279932 - SURFACE
      ?auto_1279933 - SURFACE
      ?auto_1279930 - SURFACE
      ?auto_1279934 - SURFACE
      ?auto_1279936 - SURFACE
      ?auto_1279935 - SURFACE
      ?auto_1279937 - SURFACE
      ?auto_1279938 - SURFACE
      ?auto_1279939 - SURFACE
      ?auto_1279940 - SURFACE
    )
    :vars
    (
      ?auto_1279944 - HOIST
      ?auto_1279945 - PLACE
      ?auto_1279942 - PLACE
      ?auto_1279946 - HOIST
      ?auto_1279943 - SURFACE
      ?auto_1279941 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1279944 ?auto_1279945 ) ( IS-CRATE ?auto_1279940 ) ( not ( = ?auto_1279939 ?auto_1279940 ) ) ( not ( = ?auto_1279938 ?auto_1279939 ) ) ( not ( = ?auto_1279938 ?auto_1279940 ) ) ( not ( = ?auto_1279942 ?auto_1279945 ) ) ( HOIST-AT ?auto_1279946 ?auto_1279942 ) ( not ( = ?auto_1279944 ?auto_1279946 ) ) ( AVAILABLE ?auto_1279946 ) ( SURFACE-AT ?auto_1279940 ?auto_1279942 ) ( ON ?auto_1279940 ?auto_1279943 ) ( CLEAR ?auto_1279940 ) ( not ( = ?auto_1279939 ?auto_1279943 ) ) ( not ( = ?auto_1279940 ?auto_1279943 ) ) ( not ( = ?auto_1279938 ?auto_1279943 ) ) ( TRUCK-AT ?auto_1279941 ?auto_1279945 ) ( SURFACE-AT ?auto_1279938 ?auto_1279945 ) ( CLEAR ?auto_1279938 ) ( IS-CRATE ?auto_1279939 ) ( AVAILABLE ?auto_1279944 ) ( IN ?auto_1279939 ?auto_1279941 ) ( ON ?auto_1279932 ?auto_1279931 ) ( ON ?auto_1279933 ?auto_1279932 ) ( ON ?auto_1279930 ?auto_1279933 ) ( ON ?auto_1279934 ?auto_1279930 ) ( ON ?auto_1279936 ?auto_1279934 ) ( ON ?auto_1279935 ?auto_1279936 ) ( ON ?auto_1279937 ?auto_1279935 ) ( ON ?auto_1279938 ?auto_1279937 ) ( not ( = ?auto_1279931 ?auto_1279932 ) ) ( not ( = ?auto_1279931 ?auto_1279933 ) ) ( not ( = ?auto_1279931 ?auto_1279930 ) ) ( not ( = ?auto_1279931 ?auto_1279934 ) ) ( not ( = ?auto_1279931 ?auto_1279936 ) ) ( not ( = ?auto_1279931 ?auto_1279935 ) ) ( not ( = ?auto_1279931 ?auto_1279937 ) ) ( not ( = ?auto_1279931 ?auto_1279938 ) ) ( not ( = ?auto_1279931 ?auto_1279939 ) ) ( not ( = ?auto_1279931 ?auto_1279940 ) ) ( not ( = ?auto_1279931 ?auto_1279943 ) ) ( not ( = ?auto_1279932 ?auto_1279933 ) ) ( not ( = ?auto_1279932 ?auto_1279930 ) ) ( not ( = ?auto_1279932 ?auto_1279934 ) ) ( not ( = ?auto_1279932 ?auto_1279936 ) ) ( not ( = ?auto_1279932 ?auto_1279935 ) ) ( not ( = ?auto_1279932 ?auto_1279937 ) ) ( not ( = ?auto_1279932 ?auto_1279938 ) ) ( not ( = ?auto_1279932 ?auto_1279939 ) ) ( not ( = ?auto_1279932 ?auto_1279940 ) ) ( not ( = ?auto_1279932 ?auto_1279943 ) ) ( not ( = ?auto_1279933 ?auto_1279930 ) ) ( not ( = ?auto_1279933 ?auto_1279934 ) ) ( not ( = ?auto_1279933 ?auto_1279936 ) ) ( not ( = ?auto_1279933 ?auto_1279935 ) ) ( not ( = ?auto_1279933 ?auto_1279937 ) ) ( not ( = ?auto_1279933 ?auto_1279938 ) ) ( not ( = ?auto_1279933 ?auto_1279939 ) ) ( not ( = ?auto_1279933 ?auto_1279940 ) ) ( not ( = ?auto_1279933 ?auto_1279943 ) ) ( not ( = ?auto_1279930 ?auto_1279934 ) ) ( not ( = ?auto_1279930 ?auto_1279936 ) ) ( not ( = ?auto_1279930 ?auto_1279935 ) ) ( not ( = ?auto_1279930 ?auto_1279937 ) ) ( not ( = ?auto_1279930 ?auto_1279938 ) ) ( not ( = ?auto_1279930 ?auto_1279939 ) ) ( not ( = ?auto_1279930 ?auto_1279940 ) ) ( not ( = ?auto_1279930 ?auto_1279943 ) ) ( not ( = ?auto_1279934 ?auto_1279936 ) ) ( not ( = ?auto_1279934 ?auto_1279935 ) ) ( not ( = ?auto_1279934 ?auto_1279937 ) ) ( not ( = ?auto_1279934 ?auto_1279938 ) ) ( not ( = ?auto_1279934 ?auto_1279939 ) ) ( not ( = ?auto_1279934 ?auto_1279940 ) ) ( not ( = ?auto_1279934 ?auto_1279943 ) ) ( not ( = ?auto_1279936 ?auto_1279935 ) ) ( not ( = ?auto_1279936 ?auto_1279937 ) ) ( not ( = ?auto_1279936 ?auto_1279938 ) ) ( not ( = ?auto_1279936 ?auto_1279939 ) ) ( not ( = ?auto_1279936 ?auto_1279940 ) ) ( not ( = ?auto_1279936 ?auto_1279943 ) ) ( not ( = ?auto_1279935 ?auto_1279937 ) ) ( not ( = ?auto_1279935 ?auto_1279938 ) ) ( not ( = ?auto_1279935 ?auto_1279939 ) ) ( not ( = ?auto_1279935 ?auto_1279940 ) ) ( not ( = ?auto_1279935 ?auto_1279943 ) ) ( not ( = ?auto_1279937 ?auto_1279938 ) ) ( not ( = ?auto_1279937 ?auto_1279939 ) ) ( not ( = ?auto_1279937 ?auto_1279940 ) ) ( not ( = ?auto_1279937 ?auto_1279943 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1279938 ?auto_1279939 ?auto_1279940 )
      ( MAKE-10CRATE-VERIFY ?auto_1279931 ?auto_1279932 ?auto_1279933 ?auto_1279930 ?auto_1279934 ?auto_1279936 ?auto_1279935 ?auto_1279937 ?auto_1279938 ?auto_1279939 ?auto_1279940 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1287215 - SURFACE
      ?auto_1287216 - SURFACE
      ?auto_1287217 - SURFACE
      ?auto_1287214 - SURFACE
      ?auto_1287218 - SURFACE
      ?auto_1287220 - SURFACE
      ?auto_1287219 - SURFACE
      ?auto_1287221 - SURFACE
      ?auto_1287222 - SURFACE
      ?auto_1287223 - SURFACE
      ?auto_1287224 - SURFACE
      ?auto_1287225 - SURFACE
    )
    :vars
    (
      ?auto_1287226 - HOIST
      ?auto_1287227 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1287226 ?auto_1287227 ) ( SURFACE-AT ?auto_1287224 ?auto_1287227 ) ( CLEAR ?auto_1287224 ) ( LIFTING ?auto_1287226 ?auto_1287225 ) ( IS-CRATE ?auto_1287225 ) ( not ( = ?auto_1287224 ?auto_1287225 ) ) ( ON ?auto_1287216 ?auto_1287215 ) ( ON ?auto_1287217 ?auto_1287216 ) ( ON ?auto_1287214 ?auto_1287217 ) ( ON ?auto_1287218 ?auto_1287214 ) ( ON ?auto_1287220 ?auto_1287218 ) ( ON ?auto_1287219 ?auto_1287220 ) ( ON ?auto_1287221 ?auto_1287219 ) ( ON ?auto_1287222 ?auto_1287221 ) ( ON ?auto_1287223 ?auto_1287222 ) ( ON ?auto_1287224 ?auto_1287223 ) ( not ( = ?auto_1287215 ?auto_1287216 ) ) ( not ( = ?auto_1287215 ?auto_1287217 ) ) ( not ( = ?auto_1287215 ?auto_1287214 ) ) ( not ( = ?auto_1287215 ?auto_1287218 ) ) ( not ( = ?auto_1287215 ?auto_1287220 ) ) ( not ( = ?auto_1287215 ?auto_1287219 ) ) ( not ( = ?auto_1287215 ?auto_1287221 ) ) ( not ( = ?auto_1287215 ?auto_1287222 ) ) ( not ( = ?auto_1287215 ?auto_1287223 ) ) ( not ( = ?auto_1287215 ?auto_1287224 ) ) ( not ( = ?auto_1287215 ?auto_1287225 ) ) ( not ( = ?auto_1287216 ?auto_1287217 ) ) ( not ( = ?auto_1287216 ?auto_1287214 ) ) ( not ( = ?auto_1287216 ?auto_1287218 ) ) ( not ( = ?auto_1287216 ?auto_1287220 ) ) ( not ( = ?auto_1287216 ?auto_1287219 ) ) ( not ( = ?auto_1287216 ?auto_1287221 ) ) ( not ( = ?auto_1287216 ?auto_1287222 ) ) ( not ( = ?auto_1287216 ?auto_1287223 ) ) ( not ( = ?auto_1287216 ?auto_1287224 ) ) ( not ( = ?auto_1287216 ?auto_1287225 ) ) ( not ( = ?auto_1287217 ?auto_1287214 ) ) ( not ( = ?auto_1287217 ?auto_1287218 ) ) ( not ( = ?auto_1287217 ?auto_1287220 ) ) ( not ( = ?auto_1287217 ?auto_1287219 ) ) ( not ( = ?auto_1287217 ?auto_1287221 ) ) ( not ( = ?auto_1287217 ?auto_1287222 ) ) ( not ( = ?auto_1287217 ?auto_1287223 ) ) ( not ( = ?auto_1287217 ?auto_1287224 ) ) ( not ( = ?auto_1287217 ?auto_1287225 ) ) ( not ( = ?auto_1287214 ?auto_1287218 ) ) ( not ( = ?auto_1287214 ?auto_1287220 ) ) ( not ( = ?auto_1287214 ?auto_1287219 ) ) ( not ( = ?auto_1287214 ?auto_1287221 ) ) ( not ( = ?auto_1287214 ?auto_1287222 ) ) ( not ( = ?auto_1287214 ?auto_1287223 ) ) ( not ( = ?auto_1287214 ?auto_1287224 ) ) ( not ( = ?auto_1287214 ?auto_1287225 ) ) ( not ( = ?auto_1287218 ?auto_1287220 ) ) ( not ( = ?auto_1287218 ?auto_1287219 ) ) ( not ( = ?auto_1287218 ?auto_1287221 ) ) ( not ( = ?auto_1287218 ?auto_1287222 ) ) ( not ( = ?auto_1287218 ?auto_1287223 ) ) ( not ( = ?auto_1287218 ?auto_1287224 ) ) ( not ( = ?auto_1287218 ?auto_1287225 ) ) ( not ( = ?auto_1287220 ?auto_1287219 ) ) ( not ( = ?auto_1287220 ?auto_1287221 ) ) ( not ( = ?auto_1287220 ?auto_1287222 ) ) ( not ( = ?auto_1287220 ?auto_1287223 ) ) ( not ( = ?auto_1287220 ?auto_1287224 ) ) ( not ( = ?auto_1287220 ?auto_1287225 ) ) ( not ( = ?auto_1287219 ?auto_1287221 ) ) ( not ( = ?auto_1287219 ?auto_1287222 ) ) ( not ( = ?auto_1287219 ?auto_1287223 ) ) ( not ( = ?auto_1287219 ?auto_1287224 ) ) ( not ( = ?auto_1287219 ?auto_1287225 ) ) ( not ( = ?auto_1287221 ?auto_1287222 ) ) ( not ( = ?auto_1287221 ?auto_1287223 ) ) ( not ( = ?auto_1287221 ?auto_1287224 ) ) ( not ( = ?auto_1287221 ?auto_1287225 ) ) ( not ( = ?auto_1287222 ?auto_1287223 ) ) ( not ( = ?auto_1287222 ?auto_1287224 ) ) ( not ( = ?auto_1287222 ?auto_1287225 ) ) ( not ( = ?auto_1287223 ?auto_1287224 ) ) ( not ( = ?auto_1287223 ?auto_1287225 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1287224 ?auto_1287225 )
      ( MAKE-11CRATE-VERIFY ?auto_1287215 ?auto_1287216 ?auto_1287217 ?auto_1287214 ?auto_1287218 ?auto_1287220 ?auto_1287219 ?auto_1287221 ?auto_1287222 ?auto_1287223 ?auto_1287224 ?auto_1287225 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1287324 - SURFACE
      ?auto_1287325 - SURFACE
      ?auto_1287326 - SURFACE
      ?auto_1287323 - SURFACE
      ?auto_1287327 - SURFACE
      ?auto_1287329 - SURFACE
      ?auto_1287328 - SURFACE
      ?auto_1287330 - SURFACE
      ?auto_1287331 - SURFACE
      ?auto_1287332 - SURFACE
      ?auto_1287333 - SURFACE
      ?auto_1287334 - SURFACE
    )
    :vars
    (
      ?auto_1287336 - HOIST
      ?auto_1287337 - PLACE
      ?auto_1287335 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1287336 ?auto_1287337 ) ( SURFACE-AT ?auto_1287333 ?auto_1287337 ) ( CLEAR ?auto_1287333 ) ( IS-CRATE ?auto_1287334 ) ( not ( = ?auto_1287333 ?auto_1287334 ) ) ( TRUCK-AT ?auto_1287335 ?auto_1287337 ) ( AVAILABLE ?auto_1287336 ) ( IN ?auto_1287334 ?auto_1287335 ) ( ON ?auto_1287333 ?auto_1287332 ) ( not ( = ?auto_1287332 ?auto_1287333 ) ) ( not ( = ?auto_1287332 ?auto_1287334 ) ) ( ON ?auto_1287325 ?auto_1287324 ) ( ON ?auto_1287326 ?auto_1287325 ) ( ON ?auto_1287323 ?auto_1287326 ) ( ON ?auto_1287327 ?auto_1287323 ) ( ON ?auto_1287329 ?auto_1287327 ) ( ON ?auto_1287328 ?auto_1287329 ) ( ON ?auto_1287330 ?auto_1287328 ) ( ON ?auto_1287331 ?auto_1287330 ) ( ON ?auto_1287332 ?auto_1287331 ) ( not ( = ?auto_1287324 ?auto_1287325 ) ) ( not ( = ?auto_1287324 ?auto_1287326 ) ) ( not ( = ?auto_1287324 ?auto_1287323 ) ) ( not ( = ?auto_1287324 ?auto_1287327 ) ) ( not ( = ?auto_1287324 ?auto_1287329 ) ) ( not ( = ?auto_1287324 ?auto_1287328 ) ) ( not ( = ?auto_1287324 ?auto_1287330 ) ) ( not ( = ?auto_1287324 ?auto_1287331 ) ) ( not ( = ?auto_1287324 ?auto_1287332 ) ) ( not ( = ?auto_1287324 ?auto_1287333 ) ) ( not ( = ?auto_1287324 ?auto_1287334 ) ) ( not ( = ?auto_1287325 ?auto_1287326 ) ) ( not ( = ?auto_1287325 ?auto_1287323 ) ) ( not ( = ?auto_1287325 ?auto_1287327 ) ) ( not ( = ?auto_1287325 ?auto_1287329 ) ) ( not ( = ?auto_1287325 ?auto_1287328 ) ) ( not ( = ?auto_1287325 ?auto_1287330 ) ) ( not ( = ?auto_1287325 ?auto_1287331 ) ) ( not ( = ?auto_1287325 ?auto_1287332 ) ) ( not ( = ?auto_1287325 ?auto_1287333 ) ) ( not ( = ?auto_1287325 ?auto_1287334 ) ) ( not ( = ?auto_1287326 ?auto_1287323 ) ) ( not ( = ?auto_1287326 ?auto_1287327 ) ) ( not ( = ?auto_1287326 ?auto_1287329 ) ) ( not ( = ?auto_1287326 ?auto_1287328 ) ) ( not ( = ?auto_1287326 ?auto_1287330 ) ) ( not ( = ?auto_1287326 ?auto_1287331 ) ) ( not ( = ?auto_1287326 ?auto_1287332 ) ) ( not ( = ?auto_1287326 ?auto_1287333 ) ) ( not ( = ?auto_1287326 ?auto_1287334 ) ) ( not ( = ?auto_1287323 ?auto_1287327 ) ) ( not ( = ?auto_1287323 ?auto_1287329 ) ) ( not ( = ?auto_1287323 ?auto_1287328 ) ) ( not ( = ?auto_1287323 ?auto_1287330 ) ) ( not ( = ?auto_1287323 ?auto_1287331 ) ) ( not ( = ?auto_1287323 ?auto_1287332 ) ) ( not ( = ?auto_1287323 ?auto_1287333 ) ) ( not ( = ?auto_1287323 ?auto_1287334 ) ) ( not ( = ?auto_1287327 ?auto_1287329 ) ) ( not ( = ?auto_1287327 ?auto_1287328 ) ) ( not ( = ?auto_1287327 ?auto_1287330 ) ) ( not ( = ?auto_1287327 ?auto_1287331 ) ) ( not ( = ?auto_1287327 ?auto_1287332 ) ) ( not ( = ?auto_1287327 ?auto_1287333 ) ) ( not ( = ?auto_1287327 ?auto_1287334 ) ) ( not ( = ?auto_1287329 ?auto_1287328 ) ) ( not ( = ?auto_1287329 ?auto_1287330 ) ) ( not ( = ?auto_1287329 ?auto_1287331 ) ) ( not ( = ?auto_1287329 ?auto_1287332 ) ) ( not ( = ?auto_1287329 ?auto_1287333 ) ) ( not ( = ?auto_1287329 ?auto_1287334 ) ) ( not ( = ?auto_1287328 ?auto_1287330 ) ) ( not ( = ?auto_1287328 ?auto_1287331 ) ) ( not ( = ?auto_1287328 ?auto_1287332 ) ) ( not ( = ?auto_1287328 ?auto_1287333 ) ) ( not ( = ?auto_1287328 ?auto_1287334 ) ) ( not ( = ?auto_1287330 ?auto_1287331 ) ) ( not ( = ?auto_1287330 ?auto_1287332 ) ) ( not ( = ?auto_1287330 ?auto_1287333 ) ) ( not ( = ?auto_1287330 ?auto_1287334 ) ) ( not ( = ?auto_1287331 ?auto_1287332 ) ) ( not ( = ?auto_1287331 ?auto_1287333 ) ) ( not ( = ?auto_1287331 ?auto_1287334 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1287332 ?auto_1287333 ?auto_1287334 )
      ( MAKE-11CRATE-VERIFY ?auto_1287324 ?auto_1287325 ?auto_1287326 ?auto_1287323 ?auto_1287327 ?auto_1287329 ?auto_1287328 ?auto_1287330 ?auto_1287331 ?auto_1287332 ?auto_1287333 ?auto_1287334 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1287445 - SURFACE
      ?auto_1287446 - SURFACE
      ?auto_1287447 - SURFACE
      ?auto_1287444 - SURFACE
      ?auto_1287448 - SURFACE
      ?auto_1287450 - SURFACE
      ?auto_1287449 - SURFACE
      ?auto_1287451 - SURFACE
      ?auto_1287452 - SURFACE
      ?auto_1287453 - SURFACE
      ?auto_1287454 - SURFACE
      ?auto_1287455 - SURFACE
    )
    :vars
    (
      ?auto_1287456 - HOIST
      ?auto_1287458 - PLACE
      ?auto_1287459 - TRUCK
      ?auto_1287457 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1287456 ?auto_1287458 ) ( SURFACE-AT ?auto_1287454 ?auto_1287458 ) ( CLEAR ?auto_1287454 ) ( IS-CRATE ?auto_1287455 ) ( not ( = ?auto_1287454 ?auto_1287455 ) ) ( AVAILABLE ?auto_1287456 ) ( IN ?auto_1287455 ?auto_1287459 ) ( ON ?auto_1287454 ?auto_1287453 ) ( not ( = ?auto_1287453 ?auto_1287454 ) ) ( not ( = ?auto_1287453 ?auto_1287455 ) ) ( TRUCK-AT ?auto_1287459 ?auto_1287457 ) ( not ( = ?auto_1287457 ?auto_1287458 ) ) ( ON ?auto_1287446 ?auto_1287445 ) ( ON ?auto_1287447 ?auto_1287446 ) ( ON ?auto_1287444 ?auto_1287447 ) ( ON ?auto_1287448 ?auto_1287444 ) ( ON ?auto_1287450 ?auto_1287448 ) ( ON ?auto_1287449 ?auto_1287450 ) ( ON ?auto_1287451 ?auto_1287449 ) ( ON ?auto_1287452 ?auto_1287451 ) ( ON ?auto_1287453 ?auto_1287452 ) ( not ( = ?auto_1287445 ?auto_1287446 ) ) ( not ( = ?auto_1287445 ?auto_1287447 ) ) ( not ( = ?auto_1287445 ?auto_1287444 ) ) ( not ( = ?auto_1287445 ?auto_1287448 ) ) ( not ( = ?auto_1287445 ?auto_1287450 ) ) ( not ( = ?auto_1287445 ?auto_1287449 ) ) ( not ( = ?auto_1287445 ?auto_1287451 ) ) ( not ( = ?auto_1287445 ?auto_1287452 ) ) ( not ( = ?auto_1287445 ?auto_1287453 ) ) ( not ( = ?auto_1287445 ?auto_1287454 ) ) ( not ( = ?auto_1287445 ?auto_1287455 ) ) ( not ( = ?auto_1287446 ?auto_1287447 ) ) ( not ( = ?auto_1287446 ?auto_1287444 ) ) ( not ( = ?auto_1287446 ?auto_1287448 ) ) ( not ( = ?auto_1287446 ?auto_1287450 ) ) ( not ( = ?auto_1287446 ?auto_1287449 ) ) ( not ( = ?auto_1287446 ?auto_1287451 ) ) ( not ( = ?auto_1287446 ?auto_1287452 ) ) ( not ( = ?auto_1287446 ?auto_1287453 ) ) ( not ( = ?auto_1287446 ?auto_1287454 ) ) ( not ( = ?auto_1287446 ?auto_1287455 ) ) ( not ( = ?auto_1287447 ?auto_1287444 ) ) ( not ( = ?auto_1287447 ?auto_1287448 ) ) ( not ( = ?auto_1287447 ?auto_1287450 ) ) ( not ( = ?auto_1287447 ?auto_1287449 ) ) ( not ( = ?auto_1287447 ?auto_1287451 ) ) ( not ( = ?auto_1287447 ?auto_1287452 ) ) ( not ( = ?auto_1287447 ?auto_1287453 ) ) ( not ( = ?auto_1287447 ?auto_1287454 ) ) ( not ( = ?auto_1287447 ?auto_1287455 ) ) ( not ( = ?auto_1287444 ?auto_1287448 ) ) ( not ( = ?auto_1287444 ?auto_1287450 ) ) ( not ( = ?auto_1287444 ?auto_1287449 ) ) ( not ( = ?auto_1287444 ?auto_1287451 ) ) ( not ( = ?auto_1287444 ?auto_1287452 ) ) ( not ( = ?auto_1287444 ?auto_1287453 ) ) ( not ( = ?auto_1287444 ?auto_1287454 ) ) ( not ( = ?auto_1287444 ?auto_1287455 ) ) ( not ( = ?auto_1287448 ?auto_1287450 ) ) ( not ( = ?auto_1287448 ?auto_1287449 ) ) ( not ( = ?auto_1287448 ?auto_1287451 ) ) ( not ( = ?auto_1287448 ?auto_1287452 ) ) ( not ( = ?auto_1287448 ?auto_1287453 ) ) ( not ( = ?auto_1287448 ?auto_1287454 ) ) ( not ( = ?auto_1287448 ?auto_1287455 ) ) ( not ( = ?auto_1287450 ?auto_1287449 ) ) ( not ( = ?auto_1287450 ?auto_1287451 ) ) ( not ( = ?auto_1287450 ?auto_1287452 ) ) ( not ( = ?auto_1287450 ?auto_1287453 ) ) ( not ( = ?auto_1287450 ?auto_1287454 ) ) ( not ( = ?auto_1287450 ?auto_1287455 ) ) ( not ( = ?auto_1287449 ?auto_1287451 ) ) ( not ( = ?auto_1287449 ?auto_1287452 ) ) ( not ( = ?auto_1287449 ?auto_1287453 ) ) ( not ( = ?auto_1287449 ?auto_1287454 ) ) ( not ( = ?auto_1287449 ?auto_1287455 ) ) ( not ( = ?auto_1287451 ?auto_1287452 ) ) ( not ( = ?auto_1287451 ?auto_1287453 ) ) ( not ( = ?auto_1287451 ?auto_1287454 ) ) ( not ( = ?auto_1287451 ?auto_1287455 ) ) ( not ( = ?auto_1287452 ?auto_1287453 ) ) ( not ( = ?auto_1287452 ?auto_1287454 ) ) ( not ( = ?auto_1287452 ?auto_1287455 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1287453 ?auto_1287454 ?auto_1287455 )
      ( MAKE-11CRATE-VERIFY ?auto_1287445 ?auto_1287446 ?auto_1287447 ?auto_1287444 ?auto_1287448 ?auto_1287450 ?auto_1287449 ?auto_1287451 ?auto_1287452 ?auto_1287453 ?auto_1287454 ?auto_1287455 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1287577 - SURFACE
      ?auto_1287578 - SURFACE
      ?auto_1287579 - SURFACE
      ?auto_1287576 - SURFACE
      ?auto_1287580 - SURFACE
      ?auto_1287582 - SURFACE
      ?auto_1287581 - SURFACE
      ?auto_1287583 - SURFACE
      ?auto_1287584 - SURFACE
      ?auto_1287585 - SURFACE
      ?auto_1287586 - SURFACE
      ?auto_1287587 - SURFACE
    )
    :vars
    (
      ?auto_1287588 - HOIST
      ?auto_1287591 - PLACE
      ?auto_1287590 - TRUCK
      ?auto_1287592 - PLACE
      ?auto_1287589 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1287588 ?auto_1287591 ) ( SURFACE-AT ?auto_1287586 ?auto_1287591 ) ( CLEAR ?auto_1287586 ) ( IS-CRATE ?auto_1287587 ) ( not ( = ?auto_1287586 ?auto_1287587 ) ) ( AVAILABLE ?auto_1287588 ) ( ON ?auto_1287586 ?auto_1287585 ) ( not ( = ?auto_1287585 ?auto_1287586 ) ) ( not ( = ?auto_1287585 ?auto_1287587 ) ) ( TRUCK-AT ?auto_1287590 ?auto_1287592 ) ( not ( = ?auto_1287592 ?auto_1287591 ) ) ( HOIST-AT ?auto_1287589 ?auto_1287592 ) ( LIFTING ?auto_1287589 ?auto_1287587 ) ( not ( = ?auto_1287588 ?auto_1287589 ) ) ( ON ?auto_1287578 ?auto_1287577 ) ( ON ?auto_1287579 ?auto_1287578 ) ( ON ?auto_1287576 ?auto_1287579 ) ( ON ?auto_1287580 ?auto_1287576 ) ( ON ?auto_1287582 ?auto_1287580 ) ( ON ?auto_1287581 ?auto_1287582 ) ( ON ?auto_1287583 ?auto_1287581 ) ( ON ?auto_1287584 ?auto_1287583 ) ( ON ?auto_1287585 ?auto_1287584 ) ( not ( = ?auto_1287577 ?auto_1287578 ) ) ( not ( = ?auto_1287577 ?auto_1287579 ) ) ( not ( = ?auto_1287577 ?auto_1287576 ) ) ( not ( = ?auto_1287577 ?auto_1287580 ) ) ( not ( = ?auto_1287577 ?auto_1287582 ) ) ( not ( = ?auto_1287577 ?auto_1287581 ) ) ( not ( = ?auto_1287577 ?auto_1287583 ) ) ( not ( = ?auto_1287577 ?auto_1287584 ) ) ( not ( = ?auto_1287577 ?auto_1287585 ) ) ( not ( = ?auto_1287577 ?auto_1287586 ) ) ( not ( = ?auto_1287577 ?auto_1287587 ) ) ( not ( = ?auto_1287578 ?auto_1287579 ) ) ( not ( = ?auto_1287578 ?auto_1287576 ) ) ( not ( = ?auto_1287578 ?auto_1287580 ) ) ( not ( = ?auto_1287578 ?auto_1287582 ) ) ( not ( = ?auto_1287578 ?auto_1287581 ) ) ( not ( = ?auto_1287578 ?auto_1287583 ) ) ( not ( = ?auto_1287578 ?auto_1287584 ) ) ( not ( = ?auto_1287578 ?auto_1287585 ) ) ( not ( = ?auto_1287578 ?auto_1287586 ) ) ( not ( = ?auto_1287578 ?auto_1287587 ) ) ( not ( = ?auto_1287579 ?auto_1287576 ) ) ( not ( = ?auto_1287579 ?auto_1287580 ) ) ( not ( = ?auto_1287579 ?auto_1287582 ) ) ( not ( = ?auto_1287579 ?auto_1287581 ) ) ( not ( = ?auto_1287579 ?auto_1287583 ) ) ( not ( = ?auto_1287579 ?auto_1287584 ) ) ( not ( = ?auto_1287579 ?auto_1287585 ) ) ( not ( = ?auto_1287579 ?auto_1287586 ) ) ( not ( = ?auto_1287579 ?auto_1287587 ) ) ( not ( = ?auto_1287576 ?auto_1287580 ) ) ( not ( = ?auto_1287576 ?auto_1287582 ) ) ( not ( = ?auto_1287576 ?auto_1287581 ) ) ( not ( = ?auto_1287576 ?auto_1287583 ) ) ( not ( = ?auto_1287576 ?auto_1287584 ) ) ( not ( = ?auto_1287576 ?auto_1287585 ) ) ( not ( = ?auto_1287576 ?auto_1287586 ) ) ( not ( = ?auto_1287576 ?auto_1287587 ) ) ( not ( = ?auto_1287580 ?auto_1287582 ) ) ( not ( = ?auto_1287580 ?auto_1287581 ) ) ( not ( = ?auto_1287580 ?auto_1287583 ) ) ( not ( = ?auto_1287580 ?auto_1287584 ) ) ( not ( = ?auto_1287580 ?auto_1287585 ) ) ( not ( = ?auto_1287580 ?auto_1287586 ) ) ( not ( = ?auto_1287580 ?auto_1287587 ) ) ( not ( = ?auto_1287582 ?auto_1287581 ) ) ( not ( = ?auto_1287582 ?auto_1287583 ) ) ( not ( = ?auto_1287582 ?auto_1287584 ) ) ( not ( = ?auto_1287582 ?auto_1287585 ) ) ( not ( = ?auto_1287582 ?auto_1287586 ) ) ( not ( = ?auto_1287582 ?auto_1287587 ) ) ( not ( = ?auto_1287581 ?auto_1287583 ) ) ( not ( = ?auto_1287581 ?auto_1287584 ) ) ( not ( = ?auto_1287581 ?auto_1287585 ) ) ( not ( = ?auto_1287581 ?auto_1287586 ) ) ( not ( = ?auto_1287581 ?auto_1287587 ) ) ( not ( = ?auto_1287583 ?auto_1287584 ) ) ( not ( = ?auto_1287583 ?auto_1287585 ) ) ( not ( = ?auto_1287583 ?auto_1287586 ) ) ( not ( = ?auto_1287583 ?auto_1287587 ) ) ( not ( = ?auto_1287584 ?auto_1287585 ) ) ( not ( = ?auto_1287584 ?auto_1287586 ) ) ( not ( = ?auto_1287584 ?auto_1287587 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1287585 ?auto_1287586 ?auto_1287587 )
      ( MAKE-11CRATE-VERIFY ?auto_1287577 ?auto_1287578 ?auto_1287579 ?auto_1287576 ?auto_1287580 ?auto_1287582 ?auto_1287581 ?auto_1287583 ?auto_1287584 ?auto_1287585 ?auto_1287586 ?auto_1287587 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1287720 - SURFACE
      ?auto_1287721 - SURFACE
      ?auto_1287722 - SURFACE
      ?auto_1287719 - SURFACE
      ?auto_1287723 - SURFACE
      ?auto_1287725 - SURFACE
      ?auto_1287724 - SURFACE
      ?auto_1287726 - SURFACE
      ?auto_1287727 - SURFACE
      ?auto_1287728 - SURFACE
      ?auto_1287729 - SURFACE
      ?auto_1287730 - SURFACE
    )
    :vars
    (
      ?auto_1287736 - HOIST
      ?auto_1287735 - PLACE
      ?auto_1287732 - TRUCK
      ?auto_1287733 - PLACE
      ?auto_1287731 - HOIST
      ?auto_1287734 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1287736 ?auto_1287735 ) ( SURFACE-AT ?auto_1287729 ?auto_1287735 ) ( CLEAR ?auto_1287729 ) ( IS-CRATE ?auto_1287730 ) ( not ( = ?auto_1287729 ?auto_1287730 ) ) ( AVAILABLE ?auto_1287736 ) ( ON ?auto_1287729 ?auto_1287728 ) ( not ( = ?auto_1287728 ?auto_1287729 ) ) ( not ( = ?auto_1287728 ?auto_1287730 ) ) ( TRUCK-AT ?auto_1287732 ?auto_1287733 ) ( not ( = ?auto_1287733 ?auto_1287735 ) ) ( HOIST-AT ?auto_1287731 ?auto_1287733 ) ( not ( = ?auto_1287736 ?auto_1287731 ) ) ( AVAILABLE ?auto_1287731 ) ( SURFACE-AT ?auto_1287730 ?auto_1287733 ) ( ON ?auto_1287730 ?auto_1287734 ) ( CLEAR ?auto_1287730 ) ( not ( = ?auto_1287729 ?auto_1287734 ) ) ( not ( = ?auto_1287730 ?auto_1287734 ) ) ( not ( = ?auto_1287728 ?auto_1287734 ) ) ( ON ?auto_1287721 ?auto_1287720 ) ( ON ?auto_1287722 ?auto_1287721 ) ( ON ?auto_1287719 ?auto_1287722 ) ( ON ?auto_1287723 ?auto_1287719 ) ( ON ?auto_1287725 ?auto_1287723 ) ( ON ?auto_1287724 ?auto_1287725 ) ( ON ?auto_1287726 ?auto_1287724 ) ( ON ?auto_1287727 ?auto_1287726 ) ( ON ?auto_1287728 ?auto_1287727 ) ( not ( = ?auto_1287720 ?auto_1287721 ) ) ( not ( = ?auto_1287720 ?auto_1287722 ) ) ( not ( = ?auto_1287720 ?auto_1287719 ) ) ( not ( = ?auto_1287720 ?auto_1287723 ) ) ( not ( = ?auto_1287720 ?auto_1287725 ) ) ( not ( = ?auto_1287720 ?auto_1287724 ) ) ( not ( = ?auto_1287720 ?auto_1287726 ) ) ( not ( = ?auto_1287720 ?auto_1287727 ) ) ( not ( = ?auto_1287720 ?auto_1287728 ) ) ( not ( = ?auto_1287720 ?auto_1287729 ) ) ( not ( = ?auto_1287720 ?auto_1287730 ) ) ( not ( = ?auto_1287720 ?auto_1287734 ) ) ( not ( = ?auto_1287721 ?auto_1287722 ) ) ( not ( = ?auto_1287721 ?auto_1287719 ) ) ( not ( = ?auto_1287721 ?auto_1287723 ) ) ( not ( = ?auto_1287721 ?auto_1287725 ) ) ( not ( = ?auto_1287721 ?auto_1287724 ) ) ( not ( = ?auto_1287721 ?auto_1287726 ) ) ( not ( = ?auto_1287721 ?auto_1287727 ) ) ( not ( = ?auto_1287721 ?auto_1287728 ) ) ( not ( = ?auto_1287721 ?auto_1287729 ) ) ( not ( = ?auto_1287721 ?auto_1287730 ) ) ( not ( = ?auto_1287721 ?auto_1287734 ) ) ( not ( = ?auto_1287722 ?auto_1287719 ) ) ( not ( = ?auto_1287722 ?auto_1287723 ) ) ( not ( = ?auto_1287722 ?auto_1287725 ) ) ( not ( = ?auto_1287722 ?auto_1287724 ) ) ( not ( = ?auto_1287722 ?auto_1287726 ) ) ( not ( = ?auto_1287722 ?auto_1287727 ) ) ( not ( = ?auto_1287722 ?auto_1287728 ) ) ( not ( = ?auto_1287722 ?auto_1287729 ) ) ( not ( = ?auto_1287722 ?auto_1287730 ) ) ( not ( = ?auto_1287722 ?auto_1287734 ) ) ( not ( = ?auto_1287719 ?auto_1287723 ) ) ( not ( = ?auto_1287719 ?auto_1287725 ) ) ( not ( = ?auto_1287719 ?auto_1287724 ) ) ( not ( = ?auto_1287719 ?auto_1287726 ) ) ( not ( = ?auto_1287719 ?auto_1287727 ) ) ( not ( = ?auto_1287719 ?auto_1287728 ) ) ( not ( = ?auto_1287719 ?auto_1287729 ) ) ( not ( = ?auto_1287719 ?auto_1287730 ) ) ( not ( = ?auto_1287719 ?auto_1287734 ) ) ( not ( = ?auto_1287723 ?auto_1287725 ) ) ( not ( = ?auto_1287723 ?auto_1287724 ) ) ( not ( = ?auto_1287723 ?auto_1287726 ) ) ( not ( = ?auto_1287723 ?auto_1287727 ) ) ( not ( = ?auto_1287723 ?auto_1287728 ) ) ( not ( = ?auto_1287723 ?auto_1287729 ) ) ( not ( = ?auto_1287723 ?auto_1287730 ) ) ( not ( = ?auto_1287723 ?auto_1287734 ) ) ( not ( = ?auto_1287725 ?auto_1287724 ) ) ( not ( = ?auto_1287725 ?auto_1287726 ) ) ( not ( = ?auto_1287725 ?auto_1287727 ) ) ( not ( = ?auto_1287725 ?auto_1287728 ) ) ( not ( = ?auto_1287725 ?auto_1287729 ) ) ( not ( = ?auto_1287725 ?auto_1287730 ) ) ( not ( = ?auto_1287725 ?auto_1287734 ) ) ( not ( = ?auto_1287724 ?auto_1287726 ) ) ( not ( = ?auto_1287724 ?auto_1287727 ) ) ( not ( = ?auto_1287724 ?auto_1287728 ) ) ( not ( = ?auto_1287724 ?auto_1287729 ) ) ( not ( = ?auto_1287724 ?auto_1287730 ) ) ( not ( = ?auto_1287724 ?auto_1287734 ) ) ( not ( = ?auto_1287726 ?auto_1287727 ) ) ( not ( = ?auto_1287726 ?auto_1287728 ) ) ( not ( = ?auto_1287726 ?auto_1287729 ) ) ( not ( = ?auto_1287726 ?auto_1287730 ) ) ( not ( = ?auto_1287726 ?auto_1287734 ) ) ( not ( = ?auto_1287727 ?auto_1287728 ) ) ( not ( = ?auto_1287727 ?auto_1287729 ) ) ( not ( = ?auto_1287727 ?auto_1287730 ) ) ( not ( = ?auto_1287727 ?auto_1287734 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1287728 ?auto_1287729 ?auto_1287730 )
      ( MAKE-11CRATE-VERIFY ?auto_1287720 ?auto_1287721 ?auto_1287722 ?auto_1287719 ?auto_1287723 ?auto_1287725 ?auto_1287724 ?auto_1287726 ?auto_1287727 ?auto_1287728 ?auto_1287729 ?auto_1287730 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1287864 - SURFACE
      ?auto_1287865 - SURFACE
      ?auto_1287866 - SURFACE
      ?auto_1287863 - SURFACE
      ?auto_1287867 - SURFACE
      ?auto_1287869 - SURFACE
      ?auto_1287868 - SURFACE
      ?auto_1287870 - SURFACE
      ?auto_1287871 - SURFACE
      ?auto_1287872 - SURFACE
      ?auto_1287873 - SURFACE
      ?auto_1287874 - SURFACE
    )
    :vars
    (
      ?auto_1287875 - HOIST
      ?auto_1287877 - PLACE
      ?auto_1287878 - PLACE
      ?auto_1287876 - HOIST
      ?auto_1287879 - SURFACE
      ?auto_1287880 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1287875 ?auto_1287877 ) ( SURFACE-AT ?auto_1287873 ?auto_1287877 ) ( CLEAR ?auto_1287873 ) ( IS-CRATE ?auto_1287874 ) ( not ( = ?auto_1287873 ?auto_1287874 ) ) ( AVAILABLE ?auto_1287875 ) ( ON ?auto_1287873 ?auto_1287872 ) ( not ( = ?auto_1287872 ?auto_1287873 ) ) ( not ( = ?auto_1287872 ?auto_1287874 ) ) ( not ( = ?auto_1287878 ?auto_1287877 ) ) ( HOIST-AT ?auto_1287876 ?auto_1287878 ) ( not ( = ?auto_1287875 ?auto_1287876 ) ) ( AVAILABLE ?auto_1287876 ) ( SURFACE-AT ?auto_1287874 ?auto_1287878 ) ( ON ?auto_1287874 ?auto_1287879 ) ( CLEAR ?auto_1287874 ) ( not ( = ?auto_1287873 ?auto_1287879 ) ) ( not ( = ?auto_1287874 ?auto_1287879 ) ) ( not ( = ?auto_1287872 ?auto_1287879 ) ) ( TRUCK-AT ?auto_1287880 ?auto_1287877 ) ( ON ?auto_1287865 ?auto_1287864 ) ( ON ?auto_1287866 ?auto_1287865 ) ( ON ?auto_1287863 ?auto_1287866 ) ( ON ?auto_1287867 ?auto_1287863 ) ( ON ?auto_1287869 ?auto_1287867 ) ( ON ?auto_1287868 ?auto_1287869 ) ( ON ?auto_1287870 ?auto_1287868 ) ( ON ?auto_1287871 ?auto_1287870 ) ( ON ?auto_1287872 ?auto_1287871 ) ( not ( = ?auto_1287864 ?auto_1287865 ) ) ( not ( = ?auto_1287864 ?auto_1287866 ) ) ( not ( = ?auto_1287864 ?auto_1287863 ) ) ( not ( = ?auto_1287864 ?auto_1287867 ) ) ( not ( = ?auto_1287864 ?auto_1287869 ) ) ( not ( = ?auto_1287864 ?auto_1287868 ) ) ( not ( = ?auto_1287864 ?auto_1287870 ) ) ( not ( = ?auto_1287864 ?auto_1287871 ) ) ( not ( = ?auto_1287864 ?auto_1287872 ) ) ( not ( = ?auto_1287864 ?auto_1287873 ) ) ( not ( = ?auto_1287864 ?auto_1287874 ) ) ( not ( = ?auto_1287864 ?auto_1287879 ) ) ( not ( = ?auto_1287865 ?auto_1287866 ) ) ( not ( = ?auto_1287865 ?auto_1287863 ) ) ( not ( = ?auto_1287865 ?auto_1287867 ) ) ( not ( = ?auto_1287865 ?auto_1287869 ) ) ( not ( = ?auto_1287865 ?auto_1287868 ) ) ( not ( = ?auto_1287865 ?auto_1287870 ) ) ( not ( = ?auto_1287865 ?auto_1287871 ) ) ( not ( = ?auto_1287865 ?auto_1287872 ) ) ( not ( = ?auto_1287865 ?auto_1287873 ) ) ( not ( = ?auto_1287865 ?auto_1287874 ) ) ( not ( = ?auto_1287865 ?auto_1287879 ) ) ( not ( = ?auto_1287866 ?auto_1287863 ) ) ( not ( = ?auto_1287866 ?auto_1287867 ) ) ( not ( = ?auto_1287866 ?auto_1287869 ) ) ( not ( = ?auto_1287866 ?auto_1287868 ) ) ( not ( = ?auto_1287866 ?auto_1287870 ) ) ( not ( = ?auto_1287866 ?auto_1287871 ) ) ( not ( = ?auto_1287866 ?auto_1287872 ) ) ( not ( = ?auto_1287866 ?auto_1287873 ) ) ( not ( = ?auto_1287866 ?auto_1287874 ) ) ( not ( = ?auto_1287866 ?auto_1287879 ) ) ( not ( = ?auto_1287863 ?auto_1287867 ) ) ( not ( = ?auto_1287863 ?auto_1287869 ) ) ( not ( = ?auto_1287863 ?auto_1287868 ) ) ( not ( = ?auto_1287863 ?auto_1287870 ) ) ( not ( = ?auto_1287863 ?auto_1287871 ) ) ( not ( = ?auto_1287863 ?auto_1287872 ) ) ( not ( = ?auto_1287863 ?auto_1287873 ) ) ( not ( = ?auto_1287863 ?auto_1287874 ) ) ( not ( = ?auto_1287863 ?auto_1287879 ) ) ( not ( = ?auto_1287867 ?auto_1287869 ) ) ( not ( = ?auto_1287867 ?auto_1287868 ) ) ( not ( = ?auto_1287867 ?auto_1287870 ) ) ( not ( = ?auto_1287867 ?auto_1287871 ) ) ( not ( = ?auto_1287867 ?auto_1287872 ) ) ( not ( = ?auto_1287867 ?auto_1287873 ) ) ( not ( = ?auto_1287867 ?auto_1287874 ) ) ( not ( = ?auto_1287867 ?auto_1287879 ) ) ( not ( = ?auto_1287869 ?auto_1287868 ) ) ( not ( = ?auto_1287869 ?auto_1287870 ) ) ( not ( = ?auto_1287869 ?auto_1287871 ) ) ( not ( = ?auto_1287869 ?auto_1287872 ) ) ( not ( = ?auto_1287869 ?auto_1287873 ) ) ( not ( = ?auto_1287869 ?auto_1287874 ) ) ( not ( = ?auto_1287869 ?auto_1287879 ) ) ( not ( = ?auto_1287868 ?auto_1287870 ) ) ( not ( = ?auto_1287868 ?auto_1287871 ) ) ( not ( = ?auto_1287868 ?auto_1287872 ) ) ( not ( = ?auto_1287868 ?auto_1287873 ) ) ( not ( = ?auto_1287868 ?auto_1287874 ) ) ( not ( = ?auto_1287868 ?auto_1287879 ) ) ( not ( = ?auto_1287870 ?auto_1287871 ) ) ( not ( = ?auto_1287870 ?auto_1287872 ) ) ( not ( = ?auto_1287870 ?auto_1287873 ) ) ( not ( = ?auto_1287870 ?auto_1287874 ) ) ( not ( = ?auto_1287870 ?auto_1287879 ) ) ( not ( = ?auto_1287871 ?auto_1287872 ) ) ( not ( = ?auto_1287871 ?auto_1287873 ) ) ( not ( = ?auto_1287871 ?auto_1287874 ) ) ( not ( = ?auto_1287871 ?auto_1287879 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1287872 ?auto_1287873 ?auto_1287874 )
      ( MAKE-11CRATE-VERIFY ?auto_1287864 ?auto_1287865 ?auto_1287866 ?auto_1287863 ?auto_1287867 ?auto_1287869 ?auto_1287868 ?auto_1287870 ?auto_1287871 ?auto_1287872 ?auto_1287873 ?auto_1287874 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1288008 - SURFACE
      ?auto_1288009 - SURFACE
      ?auto_1288010 - SURFACE
      ?auto_1288007 - SURFACE
      ?auto_1288011 - SURFACE
      ?auto_1288013 - SURFACE
      ?auto_1288012 - SURFACE
      ?auto_1288014 - SURFACE
      ?auto_1288015 - SURFACE
      ?auto_1288016 - SURFACE
      ?auto_1288017 - SURFACE
      ?auto_1288018 - SURFACE
    )
    :vars
    (
      ?auto_1288021 - HOIST
      ?auto_1288019 - PLACE
      ?auto_1288020 - PLACE
      ?auto_1288024 - HOIST
      ?auto_1288022 - SURFACE
      ?auto_1288023 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1288021 ?auto_1288019 ) ( IS-CRATE ?auto_1288018 ) ( not ( = ?auto_1288017 ?auto_1288018 ) ) ( not ( = ?auto_1288016 ?auto_1288017 ) ) ( not ( = ?auto_1288016 ?auto_1288018 ) ) ( not ( = ?auto_1288020 ?auto_1288019 ) ) ( HOIST-AT ?auto_1288024 ?auto_1288020 ) ( not ( = ?auto_1288021 ?auto_1288024 ) ) ( AVAILABLE ?auto_1288024 ) ( SURFACE-AT ?auto_1288018 ?auto_1288020 ) ( ON ?auto_1288018 ?auto_1288022 ) ( CLEAR ?auto_1288018 ) ( not ( = ?auto_1288017 ?auto_1288022 ) ) ( not ( = ?auto_1288018 ?auto_1288022 ) ) ( not ( = ?auto_1288016 ?auto_1288022 ) ) ( TRUCK-AT ?auto_1288023 ?auto_1288019 ) ( SURFACE-AT ?auto_1288016 ?auto_1288019 ) ( CLEAR ?auto_1288016 ) ( LIFTING ?auto_1288021 ?auto_1288017 ) ( IS-CRATE ?auto_1288017 ) ( ON ?auto_1288009 ?auto_1288008 ) ( ON ?auto_1288010 ?auto_1288009 ) ( ON ?auto_1288007 ?auto_1288010 ) ( ON ?auto_1288011 ?auto_1288007 ) ( ON ?auto_1288013 ?auto_1288011 ) ( ON ?auto_1288012 ?auto_1288013 ) ( ON ?auto_1288014 ?auto_1288012 ) ( ON ?auto_1288015 ?auto_1288014 ) ( ON ?auto_1288016 ?auto_1288015 ) ( not ( = ?auto_1288008 ?auto_1288009 ) ) ( not ( = ?auto_1288008 ?auto_1288010 ) ) ( not ( = ?auto_1288008 ?auto_1288007 ) ) ( not ( = ?auto_1288008 ?auto_1288011 ) ) ( not ( = ?auto_1288008 ?auto_1288013 ) ) ( not ( = ?auto_1288008 ?auto_1288012 ) ) ( not ( = ?auto_1288008 ?auto_1288014 ) ) ( not ( = ?auto_1288008 ?auto_1288015 ) ) ( not ( = ?auto_1288008 ?auto_1288016 ) ) ( not ( = ?auto_1288008 ?auto_1288017 ) ) ( not ( = ?auto_1288008 ?auto_1288018 ) ) ( not ( = ?auto_1288008 ?auto_1288022 ) ) ( not ( = ?auto_1288009 ?auto_1288010 ) ) ( not ( = ?auto_1288009 ?auto_1288007 ) ) ( not ( = ?auto_1288009 ?auto_1288011 ) ) ( not ( = ?auto_1288009 ?auto_1288013 ) ) ( not ( = ?auto_1288009 ?auto_1288012 ) ) ( not ( = ?auto_1288009 ?auto_1288014 ) ) ( not ( = ?auto_1288009 ?auto_1288015 ) ) ( not ( = ?auto_1288009 ?auto_1288016 ) ) ( not ( = ?auto_1288009 ?auto_1288017 ) ) ( not ( = ?auto_1288009 ?auto_1288018 ) ) ( not ( = ?auto_1288009 ?auto_1288022 ) ) ( not ( = ?auto_1288010 ?auto_1288007 ) ) ( not ( = ?auto_1288010 ?auto_1288011 ) ) ( not ( = ?auto_1288010 ?auto_1288013 ) ) ( not ( = ?auto_1288010 ?auto_1288012 ) ) ( not ( = ?auto_1288010 ?auto_1288014 ) ) ( not ( = ?auto_1288010 ?auto_1288015 ) ) ( not ( = ?auto_1288010 ?auto_1288016 ) ) ( not ( = ?auto_1288010 ?auto_1288017 ) ) ( not ( = ?auto_1288010 ?auto_1288018 ) ) ( not ( = ?auto_1288010 ?auto_1288022 ) ) ( not ( = ?auto_1288007 ?auto_1288011 ) ) ( not ( = ?auto_1288007 ?auto_1288013 ) ) ( not ( = ?auto_1288007 ?auto_1288012 ) ) ( not ( = ?auto_1288007 ?auto_1288014 ) ) ( not ( = ?auto_1288007 ?auto_1288015 ) ) ( not ( = ?auto_1288007 ?auto_1288016 ) ) ( not ( = ?auto_1288007 ?auto_1288017 ) ) ( not ( = ?auto_1288007 ?auto_1288018 ) ) ( not ( = ?auto_1288007 ?auto_1288022 ) ) ( not ( = ?auto_1288011 ?auto_1288013 ) ) ( not ( = ?auto_1288011 ?auto_1288012 ) ) ( not ( = ?auto_1288011 ?auto_1288014 ) ) ( not ( = ?auto_1288011 ?auto_1288015 ) ) ( not ( = ?auto_1288011 ?auto_1288016 ) ) ( not ( = ?auto_1288011 ?auto_1288017 ) ) ( not ( = ?auto_1288011 ?auto_1288018 ) ) ( not ( = ?auto_1288011 ?auto_1288022 ) ) ( not ( = ?auto_1288013 ?auto_1288012 ) ) ( not ( = ?auto_1288013 ?auto_1288014 ) ) ( not ( = ?auto_1288013 ?auto_1288015 ) ) ( not ( = ?auto_1288013 ?auto_1288016 ) ) ( not ( = ?auto_1288013 ?auto_1288017 ) ) ( not ( = ?auto_1288013 ?auto_1288018 ) ) ( not ( = ?auto_1288013 ?auto_1288022 ) ) ( not ( = ?auto_1288012 ?auto_1288014 ) ) ( not ( = ?auto_1288012 ?auto_1288015 ) ) ( not ( = ?auto_1288012 ?auto_1288016 ) ) ( not ( = ?auto_1288012 ?auto_1288017 ) ) ( not ( = ?auto_1288012 ?auto_1288018 ) ) ( not ( = ?auto_1288012 ?auto_1288022 ) ) ( not ( = ?auto_1288014 ?auto_1288015 ) ) ( not ( = ?auto_1288014 ?auto_1288016 ) ) ( not ( = ?auto_1288014 ?auto_1288017 ) ) ( not ( = ?auto_1288014 ?auto_1288018 ) ) ( not ( = ?auto_1288014 ?auto_1288022 ) ) ( not ( = ?auto_1288015 ?auto_1288016 ) ) ( not ( = ?auto_1288015 ?auto_1288017 ) ) ( not ( = ?auto_1288015 ?auto_1288018 ) ) ( not ( = ?auto_1288015 ?auto_1288022 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1288016 ?auto_1288017 ?auto_1288018 )
      ( MAKE-11CRATE-VERIFY ?auto_1288008 ?auto_1288009 ?auto_1288010 ?auto_1288007 ?auto_1288011 ?auto_1288013 ?auto_1288012 ?auto_1288014 ?auto_1288015 ?auto_1288016 ?auto_1288017 ?auto_1288018 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1288152 - SURFACE
      ?auto_1288153 - SURFACE
      ?auto_1288154 - SURFACE
      ?auto_1288151 - SURFACE
      ?auto_1288155 - SURFACE
      ?auto_1288157 - SURFACE
      ?auto_1288156 - SURFACE
      ?auto_1288158 - SURFACE
      ?auto_1288159 - SURFACE
      ?auto_1288160 - SURFACE
      ?auto_1288161 - SURFACE
      ?auto_1288162 - SURFACE
    )
    :vars
    (
      ?auto_1288163 - HOIST
      ?auto_1288167 - PLACE
      ?auto_1288165 - PLACE
      ?auto_1288164 - HOIST
      ?auto_1288166 - SURFACE
      ?auto_1288168 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1288163 ?auto_1288167 ) ( IS-CRATE ?auto_1288162 ) ( not ( = ?auto_1288161 ?auto_1288162 ) ) ( not ( = ?auto_1288160 ?auto_1288161 ) ) ( not ( = ?auto_1288160 ?auto_1288162 ) ) ( not ( = ?auto_1288165 ?auto_1288167 ) ) ( HOIST-AT ?auto_1288164 ?auto_1288165 ) ( not ( = ?auto_1288163 ?auto_1288164 ) ) ( AVAILABLE ?auto_1288164 ) ( SURFACE-AT ?auto_1288162 ?auto_1288165 ) ( ON ?auto_1288162 ?auto_1288166 ) ( CLEAR ?auto_1288162 ) ( not ( = ?auto_1288161 ?auto_1288166 ) ) ( not ( = ?auto_1288162 ?auto_1288166 ) ) ( not ( = ?auto_1288160 ?auto_1288166 ) ) ( TRUCK-AT ?auto_1288168 ?auto_1288167 ) ( SURFACE-AT ?auto_1288160 ?auto_1288167 ) ( CLEAR ?auto_1288160 ) ( IS-CRATE ?auto_1288161 ) ( AVAILABLE ?auto_1288163 ) ( IN ?auto_1288161 ?auto_1288168 ) ( ON ?auto_1288153 ?auto_1288152 ) ( ON ?auto_1288154 ?auto_1288153 ) ( ON ?auto_1288151 ?auto_1288154 ) ( ON ?auto_1288155 ?auto_1288151 ) ( ON ?auto_1288157 ?auto_1288155 ) ( ON ?auto_1288156 ?auto_1288157 ) ( ON ?auto_1288158 ?auto_1288156 ) ( ON ?auto_1288159 ?auto_1288158 ) ( ON ?auto_1288160 ?auto_1288159 ) ( not ( = ?auto_1288152 ?auto_1288153 ) ) ( not ( = ?auto_1288152 ?auto_1288154 ) ) ( not ( = ?auto_1288152 ?auto_1288151 ) ) ( not ( = ?auto_1288152 ?auto_1288155 ) ) ( not ( = ?auto_1288152 ?auto_1288157 ) ) ( not ( = ?auto_1288152 ?auto_1288156 ) ) ( not ( = ?auto_1288152 ?auto_1288158 ) ) ( not ( = ?auto_1288152 ?auto_1288159 ) ) ( not ( = ?auto_1288152 ?auto_1288160 ) ) ( not ( = ?auto_1288152 ?auto_1288161 ) ) ( not ( = ?auto_1288152 ?auto_1288162 ) ) ( not ( = ?auto_1288152 ?auto_1288166 ) ) ( not ( = ?auto_1288153 ?auto_1288154 ) ) ( not ( = ?auto_1288153 ?auto_1288151 ) ) ( not ( = ?auto_1288153 ?auto_1288155 ) ) ( not ( = ?auto_1288153 ?auto_1288157 ) ) ( not ( = ?auto_1288153 ?auto_1288156 ) ) ( not ( = ?auto_1288153 ?auto_1288158 ) ) ( not ( = ?auto_1288153 ?auto_1288159 ) ) ( not ( = ?auto_1288153 ?auto_1288160 ) ) ( not ( = ?auto_1288153 ?auto_1288161 ) ) ( not ( = ?auto_1288153 ?auto_1288162 ) ) ( not ( = ?auto_1288153 ?auto_1288166 ) ) ( not ( = ?auto_1288154 ?auto_1288151 ) ) ( not ( = ?auto_1288154 ?auto_1288155 ) ) ( not ( = ?auto_1288154 ?auto_1288157 ) ) ( not ( = ?auto_1288154 ?auto_1288156 ) ) ( not ( = ?auto_1288154 ?auto_1288158 ) ) ( not ( = ?auto_1288154 ?auto_1288159 ) ) ( not ( = ?auto_1288154 ?auto_1288160 ) ) ( not ( = ?auto_1288154 ?auto_1288161 ) ) ( not ( = ?auto_1288154 ?auto_1288162 ) ) ( not ( = ?auto_1288154 ?auto_1288166 ) ) ( not ( = ?auto_1288151 ?auto_1288155 ) ) ( not ( = ?auto_1288151 ?auto_1288157 ) ) ( not ( = ?auto_1288151 ?auto_1288156 ) ) ( not ( = ?auto_1288151 ?auto_1288158 ) ) ( not ( = ?auto_1288151 ?auto_1288159 ) ) ( not ( = ?auto_1288151 ?auto_1288160 ) ) ( not ( = ?auto_1288151 ?auto_1288161 ) ) ( not ( = ?auto_1288151 ?auto_1288162 ) ) ( not ( = ?auto_1288151 ?auto_1288166 ) ) ( not ( = ?auto_1288155 ?auto_1288157 ) ) ( not ( = ?auto_1288155 ?auto_1288156 ) ) ( not ( = ?auto_1288155 ?auto_1288158 ) ) ( not ( = ?auto_1288155 ?auto_1288159 ) ) ( not ( = ?auto_1288155 ?auto_1288160 ) ) ( not ( = ?auto_1288155 ?auto_1288161 ) ) ( not ( = ?auto_1288155 ?auto_1288162 ) ) ( not ( = ?auto_1288155 ?auto_1288166 ) ) ( not ( = ?auto_1288157 ?auto_1288156 ) ) ( not ( = ?auto_1288157 ?auto_1288158 ) ) ( not ( = ?auto_1288157 ?auto_1288159 ) ) ( not ( = ?auto_1288157 ?auto_1288160 ) ) ( not ( = ?auto_1288157 ?auto_1288161 ) ) ( not ( = ?auto_1288157 ?auto_1288162 ) ) ( not ( = ?auto_1288157 ?auto_1288166 ) ) ( not ( = ?auto_1288156 ?auto_1288158 ) ) ( not ( = ?auto_1288156 ?auto_1288159 ) ) ( not ( = ?auto_1288156 ?auto_1288160 ) ) ( not ( = ?auto_1288156 ?auto_1288161 ) ) ( not ( = ?auto_1288156 ?auto_1288162 ) ) ( not ( = ?auto_1288156 ?auto_1288166 ) ) ( not ( = ?auto_1288158 ?auto_1288159 ) ) ( not ( = ?auto_1288158 ?auto_1288160 ) ) ( not ( = ?auto_1288158 ?auto_1288161 ) ) ( not ( = ?auto_1288158 ?auto_1288162 ) ) ( not ( = ?auto_1288158 ?auto_1288166 ) ) ( not ( = ?auto_1288159 ?auto_1288160 ) ) ( not ( = ?auto_1288159 ?auto_1288161 ) ) ( not ( = ?auto_1288159 ?auto_1288162 ) ) ( not ( = ?auto_1288159 ?auto_1288166 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1288160 ?auto_1288161 ?auto_1288162 )
      ( MAKE-11CRATE-VERIFY ?auto_1288152 ?auto_1288153 ?auto_1288154 ?auto_1288151 ?auto_1288155 ?auto_1288157 ?auto_1288156 ?auto_1288158 ?auto_1288159 ?auto_1288160 ?auto_1288161 ?auto_1288162 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1297443 - SURFACE
      ?auto_1297444 - SURFACE
      ?auto_1297445 - SURFACE
      ?auto_1297442 - SURFACE
      ?auto_1297446 - SURFACE
      ?auto_1297448 - SURFACE
      ?auto_1297447 - SURFACE
      ?auto_1297449 - SURFACE
      ?auto_1297450 - SURFACE
      ?auto_1297451 - SURFACE
      ?auto_1297452 - SURFACE
      ?auto_1297453 - SURFACE
      ?auto_1297454 - SURFACE
    )
    :vars
    (
      ?auto_1297456 - HOIST
      ?auto_1297455 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1297456 ?auto_1297455 ) ( SURFACE-AT ?auto_1297453 ?auto_1297455 ) ( CLEAR ?auto_1297453 ) ( LIFTING ?auto_1297456 ?auto_1297454 ) ( IS-CRATE ?auto_1297454 ) ( not ( = ?auto_1297453 ?auto_1297454 ) ) ( ON ?auto_1297444 ?auto_1297443 ) ( ON ?auto_1297445 ?auto_1297444 ) ( ON ?auto_1297442 ?auto_1297445 ) ( ON ?auto_1297446 ?auto_1297442 ) ( ON ?auto_1297448 ?auto_1297446 ) ( ON ?auto_1297447 ?auto_1297448 ) ( ON ?auto_1297449 ?auto_1297447 ) ( ON ?auto_1297450 ?auto_1297449 ) ( ON ?auto_1297451 ?auto_1297450 ) ( ON ?auto_1297452 ?auto_1297451 ) ( ON ?auto_1297453 ?auto_1297452 ) ( not ( = ?auto_1297443 ?auto_1297444 ) ) ( not ( = ?auto_1297443 ?auto_1297445 ) ) ( not ( = ?auto_1297443 ?auto_1297442 ) ) ( not ( = ?auto_1297443 ?auto_1297446 ) ) ( not ( = ?auto_1297443 ?auto_1297448 ) ) ( not ( = ?auto_1297443 ?auto_1297447 ) ) ( not ( = ?auto_1297443 ?auto_1297449 ) ) ( not ( = ?auto_1297443 ?auto_1297450 ) ) ( not ( = ?auto_1297443 ?auto_1297451 ) ) ( not ( = ?auto_1297443 ?auto_1297452 ) ) ( not ( = ?auto_1297443 ?auto_1297453 ) ) ( not ( = ?auto_1297443 ?auto_1297454 ) ) ( not ( = ?auto_1297444 ?auto_1297445 ) ) ( not ( = ?auto_1297444 ?auto_1297442 ) ) ( not ( = ?auto_1297444 ?auto_1297446 ) ) ( not ( = ?auto_1297444 ?auto_1297448 ) ) ( not ( = ?auto_1297444 ?auto_1297447 ) ) ( not ( = ?auto_1297444 ?auto_1297449 ) ) ( not ( = ?auto_1297444 ?auto_1297450 ) ) ( not ( = ?auto_1297444 ?auto_1297451 ) ) ( not ( = ?auto_1297444 ?auto_1297452 ) ) ( not ( = ?auto_1297444 ?auto_1297453 ) ) ( not ( = ?auto_1297444 ?auto_1297454 ) ) ( not ( = ?auto_1297445 ?auto_1297442 ) ) ( not ( = ?auto_1297445 ?auto_1297446 ) ) ( not ( = ?auto_1297445 ?auto_1297448 ) ) ( not ( = ?auto_1297445 ?auto_1297447 ) ) ( not ( = ?auto_1297445 ?auto_1297449 ) ) ( not ( = ?auto_1297445 ?auto_1297450 ) ) ( not ( = ?auto_1297445 ?auto_1297451 ) ) ( not ( = ?auto_1297445 ?auto_1297452 ) ) ( not ( = ?auto_1297445 ?auto_1297453 ) ) ( not ( = ?auto_1297445 ?auto_1297454 ) ) ( not ( = ?auto_1297442 ?auto_1297446 ) ) ( not ( = ?auto_1297442 ?auto_1297448 ) ) ( not ( = ?auto_1297442 ?auto_1297447 ) ) ( not ( = ?auto_1297442 ?auto_1297449 ) ) ( not ( = ?auto_1297442 ?auto_1297450 ) ) ( not ( = ?auto_1297442 ?auto_1297451 ) ) ( not ( = ?auto_1297442 ?auto_1297452 ) ) ( not ( = ?auto_1297442 ?auto_1297453 ) ) ( not ( = ?auto_1297442 ?auto_1297454 ) ) ( not ( = ?auto_1297446 ?auto_1297448 ) ) ( not ( = ?auto_1297446 ?auto_1297447 ) ) ( not ( = ?auto_1297446 ?auto_1297449 ) ) ( not ( = ?auto_1297446 ?auto_1297450 ) ) ( not ( = ?auto_1297446 ?auto_1297451 ) ) ( not ( = ?auto_1297446 ?auto_1297452 ) ) ( not ( = ?auto_1297446 ?auto_1297453 ) ) ( not ( = ?auto_1297446 ?auto_1297454 ) ) ( not ( = ?auto_1297448 ?auto_1297447 ) ) ( not ( = ?auto_1297448 ?auto_1297449 ) ) ( not ( = ?auto_1297448 ?auto_1297450 ) ) ( not ( = ?auto_1297448 ?auto_1297451 ) ) ( not ( = ?auto_1297448 ?auto_1297452 ) ) ( not ( = ?auto_1297448 ?auto_1297453 ) ) ( not ( = ?auto_1297448 ?auto_1297454 ) ) ( not ( = ?auto_1297447 ?auto_1297449 ) ) ( not ( = ?auto_1297447 ?auto_1297450 ) ) ( not ( = ?auto_1297447 ?auto_1297451 ) ) ( not ( = ?auto_1297447 ?auto_1297452 ) ) ( not ( = ?auto_1297447 ?auto_1297453 ) ) ( not ( = ?auto_1297447 ?auto_1297454 ) ) ( not ( = ?auto_1297449 ?auto_1297450 ) ) ( not ( = ?auto_1297449 ?auto_1297451 ) ) ( not ( = ?auto_1297449 ?auto_1297452 ) ) ( not ( = ?auto_1297449 ?auto_1297453 ) ) ( not ( = ?auto_1297449 ?auto_1297454 ) ) ( not ( = ?auto_1297450 ?auto_1297451 ) ) ( not ( = ?auto_1297450 ?auto_1297452 ) ) ( not ( = ?auto_1297450 ?auto_1297453 ) ) ( not ( = ?auto_1297450 ?auto_1297454 ) ) ( not ( = ?auto_1297451 ?auto_1297452 ) ) ( not ( = ?auto_1297451 ?auto_1297453 ) ) ( not ( = ?auto_1297451 ?auto_1297454 ) ) ( not ( = ?auto_1297452 ?auto_1297453 ) ) ( not ( = ?auto_1297452 ?auto_1297454 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1297453 ?auto_1297454 )
      ( MAKE-12CRATE-VERIFY ?auto_1297443 ?auto_1297444 ?auto_1297445 ?auto_1297442 ?auto_1297446 ?auto_1297448 ?auto_1297447 ?auto_1297449 ?auto_1297450 ?auto_1297451 ?auto_1297452 ?auto_1297453 ?auto_1297454 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1297568 - SURFACE
      ?auto_1297569 - SURFACE
      ?auto_1297570 - SURFACE
      ?auto_1297567 - SURFACE
      ?auto_1297571 - SURFACE
      ?auto_1297573 - SURFACE
      ?auto_1297572 - SURFACE
      ?auto_1297574 - SURFACE
      ?auto_1297575 - SURFACE
      ?auto_1297576 - SURFACE
      ?auto_1297577 - SURFACE
      ?auto_1297578 - SURFACE
      ?auto_1297579 - SURFACE
    )
    :vars
    (
      ?auto_1297582 - HOIST
      ?auto_1297581 - PLACE
      ?auto_1297580 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1297582 ?auto_1297581 ) ( SURFACE-AT ?auto_1297578 ?auto_1297581 ) ( CLEAR ?auto_1297578 ) ( IS-CRATE ?auto_1297579 ) ( not ( = ?auto_1297578 ?auto_1297579 ) ) ( TRUCK-AT ?auto_1297580 ?auto_1297581 ) ( AVAILABLE ?auto_1297582 ) ( IN ?auto_1297579 ?auto_1297580 ) ( ON ?auto_1297578 ?auto_1297577 ) ( not ( = ?auto_1297577 ?auto_1297578 ) ) ( not ( = ?auto_1297577 ?auto_1297579 ) ) ( ON ?auto_1297569 ?auto_1297568 ) ( ON ?auto_1297570 ?auto_1297569 ) ( ON ?auto_1297567 ?auto_1297570 ) ( ON ?auto_1297571 ?auto_1297567 ) ( ON ?auto_1297573 ?auto_1297571 ) ( ON ?auto_1297572 ?auto_1297573 ) ( ON ?auto_1297574 ?auto_1297572 ) ( ON ?auto_1297575 ?auto_1297574 ) ( ON ?auto_1297576 ?auto_1297575 ) ( ON ?auto_1297577 ?auto_1297576 ) ( not ( = ?auto_1297568 ?auto_1297569 ) ) ( not ( = ?auto_1297568 ?auto_1297570 ) ) ( not ( = ?auto_1297568 ?auto_1297567 ) ) ( not ( = ?auto_1297568 ?auto_1297571 ) ) ( not ( = ?auto_1297568 ?auto_1297573 ) ) ( not ( = ?auto_1297568 ?auto_1297572 ) ) ( not ( = ?auto_1297568 ?auto_1297574 ) ) ( not ( = ?auto_1297568 ?auto_1297575 ) ) ( not ( = ?auto_1297568 ?auto_1297576 ) ) ( not ( = ?auto_1297568 ?auto_1297577 ) ) ( not ( = ?auto_1297568 ?auto_1297578 ) ) ( not ( = ?auto_1297568 ?auto_1297579 ) ) ( not ( = ?auto_1297569 ?auto_1297570 ) ) ( not ( = ?auto_1297569 ?auto_1297567 ) ) ( not ( = ?auto_1297569 ?auto_1297571 ) ) ( not ( = ?auto_1297569 ?auto_1297573 ) ) ( not ( = ?auto_1297569 ?auto_1297572 ) ) ( not ( = ?auto_1297569 ?auto_1297574 ) ) ( not ( = ?auto_1297569 ?auto_1297575 ) ) ( not ( = ?auto_1297569 ?auto_1297576 ) ) ( not ( = ?auto_1297569 ?auto_1297577 ) ) ( not ( = ?auto_1297569 ?auto_1297578 ) ) ( not ( = ?auto_1297569 ?auto_1297579 ) ) ( not ( = ?auto_1297570 ?auto_1297567 ) ) ( not ( = ?auto_1297570 ?auto_1297571 ) ) ( not ( = ?auto_1297570 ?auto_1297573 ) ) ( not ( = ?auto_1297570 ?auto_1297572 ) ) ( not ( = ?auto_1297570 ?auto_1297574 ) ) ( not ( = ?auto_1297570 ?auto_1297575 ) ) ( not ( = ?auto_1297570 ?auto_1297576 ) ) ( not ( = ?auto_1297570 ?auto_1297577 ) ) ( not ( = ?auto_1297570 ?auto_1297578 ) ) ( not ( = ?auto_1297570 ?auto_1297579 ) ) ( not ( = ?auto_1297567 ?auto_1297571 ) ) ( not ( = ?auto_1297567 ?auto_1297573 ) ) ( not ( = ?auto_1297567 ?auto_1297572 ) ) ( not ( = ?auto_1297567 ?auto_1297574 ) ) ( not ( = ?auto_1297567 ?auto_1297575 ) ) ( not ( = ?auto_1297567 ?auto_1297576 ) ) ( not ( = ?auto_1297567 ?auto_1297577 ) ) ( not ( = ?auto_1297567 ?auto_1297578 ) ) ( not ( = ?auto_1297567 ?auto_1297579 ) ) ( not ( = ?auto_1297571 ?auto_1297573 ) ) ( not ( = ?auto_1297571 ?auto_1297572 ) ) ( not ( = ?auto_1297571 ?auto_1297574 ) ) ( not ( = ?auto_1297571 ?auto_1297575 ) ) ( not ( = ?auto_1297571 ?auto_1297576 ) ) ( not ( = ?auto_1297571 ?auto_1297577 ) ) ( not ( = ?auto_1297571 ?auto_1297578 ) ) ( not ( = ?auto_1297571 ?auto_1297579 ) ) ( not ( = ?auto_1297573 ?auto_1297572 ) ) ( not ( = ?auto_1297573 ?auto_1297574 ) ) ( not ( = ?auto_1297573 ?auto_1297575 ) ) ( not ( = ?auto_1297573 ?auto_1297576 ) ) ( not ( = ?auto_1297573 ?auto_1297577 ) ) ( not ( = ?auto_1297573 ?auto_1297578 ) ) ( not ( = ?auto_1297573 ?auto_1297579 ) ) ( not ( = ?auto_1297572 ?auto_1297574 ) ) ( not ( = ?auto_1297572 ?auto_1297575 ) ) ( not ( = ?auto_1297572 ?auto_1297576 ) ) ( not ( = ?auto_1297572 ?auto_1297577 ) ) ( not ( = ?auto_1297572 ?auto_1297578 ) ) ( not ( = ?auto_1297572 ?auto_1297579 ) ) ( not ( = ?auto_1297574 ?auto_1297575 ) ) ( not ( = ?auto_1297574 ?auto_1297576 ) ) ( not ( = ?auto_1297574 ?auto_1297577 ) ) ( not ( = ?auto_1297574 ?auto_1297578 ) ) ( not ( = ?auto_1297574 ?auto_1297579 ) ) ( not ( = ?auto_1297575 ?auto_1297576 ) ) ( not ( = ?auto_1297575 ?auto_1297577 ) ) ( not ( = ?auto_1297575 ?auto_1297578 ) ) ( not ( = ?auto_1297575 ?auto_1297579 ) ) ( not ( = ?auto_1297576 ?auto_1297577 ) ) ( not ( = ?auto_1297576 ?auto_1297578 ) ) ( not ( = ?auto_1297576 ?auto_1297579 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1297577 ?auto_1297578 ?auto_1297579 )
      ( MAKE-12CRATE-VERIFY ?auto_1297568 ?auto_1297569 ?auto_1297570 ?auto_1297567 ?auto_1297571 ?auto_1297573 ?auto_1297572 ?auto_1297574 ?auto_1297575 ?auto_1297576 ?auto_1297577 ?auto_1297578 ?auto_1297579 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1297706 - SURFACE
      ?auto_1297707 - SURFACE
      ?auto_1297708 - SURFACE
      ?auto_1297705 - SURFACE
      ?auto_1297709 - SURFACE
      ?auto_1297711 - SURFACE
      ?auto_1297710 - SURFACE
      ?auto_1297712 - SURFACE
      ?auto_1297713 - SURFACE
      ?auto_1297714 - SURFACE
      ?auto_1297715 - SURFACE
      ?auto_1297716 - SURFACE
      ?auto_1297717 - SURFACE
    )
    :vars
    (
      ?auto_1297720 - HOIST
      ?auto_1297718 - PLACE
      ?auto_1297719 - TRUCK
      ?auto_1297721 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1297720 ?auto_1297718 ) ( SURFACE-AT ?auto_1297716 ?auto_1297718 ) ( CLEAR ?auto_1297716 ) ( IS-CRATE ?auto_1297717 ) ( not ( = ?auto_1297716 ?auto_1297717 ) ) ( AVAILABLE ?auto_1297720 ) ( IN ?auto_1297717 ?auto_1297719 ) ( ON ?auto_1297716 ?auto_1297715 ) ( not ( = ?auto_1297715 ?auto_1297716 ) ) ( not ( = ?auto_1297715 ?auto_1297717 ) ) ( TRUCK-AT ?auto_1297719 ?auto_1297721 ) ( not ( = ?auto_1297721 ?auto_1297718 ) ) ( ON ?auto_1297707 ?auto_1297706 ) ( ON ?auto_1297708 ?auto_1297707 ) ( ON ?auto_1297705 ?auto_1297708 ) ( ON ?auto_1297709 ?auto_1297705 ) ( ON ?auto_1297711 ?auto_1297709 ) ( ON ?auto_1297710 ?auto_1297711 ) ( ON ?auto_1297712 ?auto_1297710 ) ( ON ?auto_1297713 ?auto_1297712 ) ( ON ?auto_1297714 ?auto_1297713 ) ( ON ?auto_1297715 ?auto_1297714 ) ( not ( = ?auto_1297706 ?auto_1297707 ) ) ( not ( = ?auto_1297706 ?auto_1297708 ) ) ( not ( = ?auto_1297706 ?auto_1297705 ) ) ( not ( = ?auto_1297706 ?auto_1297709 ) ) ( not ( = ?auto_1297706 ?auto_1297711 ) ) ( not ( = ?auto_1297706 ?auto_1297710 ) ) ( not ( = ?auto_1297706 ?auto_1297712 ) ) ( not ( = ?auto_1297706 ?auto_1297713 ) ) ( not ( = ?auto_1297706 ?auto_1297714 ) ) ( not ( = ?auto_1297706 ?auto_1297715 ) ) ( not ( = ?auto_1297706 ?auto_1297716 ) ) ( not ( = ?auto_1297706 ?auto_1297717 ) ) ( not ( = ?auto_1297707 ?auto_1297708 ) ) ( not ( = ?auto_1297707 ?auto_1297705 ) ) ( not ( = ?auto_1297707 ?auto_1297709 ) ) ( not ( = ?auto_1297707 ?auto_1297711 ) ) ( not ( = ?auto_1297707 ?auto_1297710 ) ) ( not ( = ?auto_1297707 ?auto_1297712 ) ) ( not ( = ?auto_1297707 ?auto_1297713 ) ) ( not ( = ?auto_1297707 ?auto_1297714 ) ) ( not ( = ?auto_1297707 ?auto_1297715 ) ) ( not ( = ?auto_1297707 ?auto_1297716 ) ) ( not ( = ?auto_1297707 ?auto_1297717 ) ) ( not ( = ?auto_1297708 ?auto_1297705 ) ) ( not ( = ?auto_1297708 ?auto_1297709 ) ) ( not ( = ?auto_1297708 ?auto_1297711 ) ) ( not ( = ?auto_1297708 ?auto_1297710 ) ) ( not ( = ?auto_1297708 ?auto_1297712 ) ) ( not ( = ?auto_1297708 ?auto_1297713 ) ) ( not ( = ?auto_1297708 ?auto_1297714 ) ) ( not ( = ?auto_1297708 ?auto_1297715 ) ) ( not ( = ?auto_1297708 ?auto_1297716 ) ) ( not ( = ?auto_1297708 ?auto_1297717 ) ) ( not ( = ?auto_1297705 ?auto_1297709 ) ) ( not ( = ?auto_1297705 ?auto_1297711 ) ) ( not ( = ?auto_1297705 ?auto_1297710 ) ) ( not ( = ?auto_1297705 ?auto_1297712 ) ) ( not ( = ?auto_1297705 ?auto_1297713 ) ) ( not ( = ?auto_1297705 ?auto_1297714 ) ) ( not ( = ?auto_1297705 ?auto_1297715 ) ) ( not ( = ?auto_1297705 ?auto_1297716 ) ) ( not ( = ?auto_1297705 ?auto_1297717 ) ) ( not ( = ?auto_1297709 ?auto_1297711 ) ) ( not ( = ?auto_1297709 ?auto_1297710 ) ) ( not ( = ?auto_1297709 ?auto_1297712 ) ) ( not ( = ?auto_1297709 ?auto_1297713 ) ) ( not ( = ?auto_1297709 ?auto_1297714 ) ) ( not ( = ?auto_1297709 ?auto_1297715 ) ) ( not ( = ?auto_1297709 ?auto_1297716 ) ) ( not ( = ?auto_1297709 ?auto_1297717 ) ) ( not ( = ?auto_1297711 ?auto_1297710 ) ) ( not ( = ?auto_1297711 ?auto_1297712 ) ) ( not ( = ?auto_1297711 ?auto_1297713 ) ) ( not ( = ?auto_1297711 ?auto_1297714 ) ) ( not ( = ?auto_1297711 ?auto_1297715 ) ) ( not ( = ?auto_1297711 ?auto_1297716 ) ) ( not ( = ?auto_1297711 ?auto_1297717 ) ) ( not ( = ?auto_1297710 ?auto_1297712 ) ) ( not ( = ?auto_1297710 ?auto_1297713 ) ) ( not ( = ?auto_1297710 ?auto_1297714 ) ) ( not ( = ?auto_1297710 ?auto_1297715 ) ) ( not ( = ?auto_1297710 ?auto_1297716 ) ) ( not ( = ?auto_1297710 ?auto_1297717 ) ) ( not ( = ?auto_1297712 ?auto_1297713 ) ) ( not ( = ?auto_1297712 ?auto_1297714 ) ) ( not ( = ?auto_1297712 ?auto_1297715 ) ) ( not ( = ?auto_1297712 ?auto_1297716 ) ) ( not ( = ?auto_1297712 ?auto_1297717 ) ) ( not ( = ?auto_1297713 ?auto_1297714 ) ) ( not ( = ?auto_1297713 ?auto_1297715 ) ) ( not ( = ?auto_1297713 ?auto_1297716 ) ) ( not ( = ?auto_1297713 ?auto_1297717 ) ) ( not ( = ?auto_1297714 ?auto_1297715 ) ) ( not ( = ?auto_1297714 ?auto_1297716 ) ) ( not ( = ?auto_1297714 ?auto_1297717 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1297715 ?auto_1297716 ?auto_1297717 )
      ( MAKE-12CRATE-VERIFY ?auto_1297706 ?auto_1297707 ?auto_1297708 ?auto_1297705 ?auto_1297709 ?auto_1297711 ?auto_1297710 ?auto_1297712 ?auto_1297713 ?auto_1297714 ?auto_1297715 ?auto_1297716 ?auto_1297717 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1297856 - SURFACE
      ?auto_1297857 - SURFACE
      ?auto_1297858 - SURFACE
      ?auto_1297855 - SURFACE
      ?auto_1297859 - SURFACE
      ?auto_1297861 - SURFACE
      ?auto_1297860 - SURFACE
      ?auto_1297862 - SURFACE
      ?auto_1297863 - SURFACE
      ?auto_1297864 - SURFACE
      ?auto_1297865 - SURFACE
      ?auto_1297866 - SURFACE
      ?auto_1297867 - SURFACE
    )
    :vars
    (
      ?auto_1297868 - HOIST
      ?auto_1297869 - PLACE
      ?auto_1297871 - TRUCK
      ?auto_1297870 - PLACE
      ?auto_1297872 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1297868 ?auto_1297869 ) ( SURFACE-AT ?auto_1297866 ?auto_1297869 ) ( CLEAR ?auto_1297866 ) ( IS-CRATE ?auto_1297867 ) ( not ( = ?auto_1297866 ?auto_1297867 ) ) ( AVAILABLE ?auto_1297868 ) ( ON ?auto_1297866 ?auto_1297865 ) ( not ( = ?auto_1297865 ?auto_1297866 ) ) ( not ( = ?auto_1297865 ?auto_1297867 ) ) ( TRUCK-AT ?auto_1297871 ?auto_1297870 ) ( not ( = ?auto_1297870 ?auto_1297869 ) ) ( HOIST-AT ?auto_1297872 ?auto_1297870 ) ( LIFTING ?auto_1297872 ?auto_1297867 ) ( not ( = ?auto_1297868 ?auto_1297872 ) ) ( ON ?auto_1297857 ?auto_1297856 ) ( ON ?auto_1297858 ?auto_1297857 ) ( ON ?auto_1297855 ?auto_1297858 ) ( ON ?auto_1297859 ?auto_1297855 ) ( ON ?auto_1297861 ?auto_1297859 ) ( ON ?auto_1297860 ?auto_1297861 ) ( ON ?auto_1297862 ?auto_1297860 ) ( ON ?auto_1297863 ?auto_1297862 ) ( ON ?auto_1297864 ?auto_1297863 ) ( ON ?auto_1297865 ?auto_1297864 ) ( not ( = ?auto_1297856 ?auto_1297857 ) ) ( not ( = ?auto_1297856 ?auto_1297858 ) ) ( not ( = ?auto_1297856 ?auto_1297855 ) ) ( not ( = ?auto_1297856 ?auto_1297859 ) ) ( not ( = ?auto_1297856 ?auto_1297861 ) ) ( not ( = ?auto_1297856 ?auto_1297860 ) ) ( not ( = ?auto_1297856 ?auto_1297862 ) ) ( not ( = ?auto_1297856 ?auto_1297863 ) ) ( not ( = ?auto_1297856 ?auto_1297864 ) ) ( not ( = ?auto_1297856 ?auto_1297865 ) ) ( not ( = ?auto_1297856 ?auto_1297866 ) ) ( not ( = ?auto_1297856 ?auto_1297867 ) ) ( not ( = ?auto_1297857 ?auto_1297858 ) ) ( not ( = ?auto_1297857 ?auto_1297855 ) ) ( not ( = ?auto_1297857 ?auto_1297859 ) ) ( not ( = ?auto_1297857 ?auto_1297861 ) ) ( not ( = ?auto_1297857 ?auto_1297860 ) ) ( not ( = ?auto_1297857 ?auto_1297862 ) ) ( not ( = ?auto_1297857 ?auto_1297863 ) ) ( not ( = ?auto_1297857 ?auto_1297864 ) ) ( not ( = ?auto_1297857 ?auto_1297865 ) ) ( not ( = ?auto_1297857 ?auto_1297866 ) ) ( not ( = ?auto_1297857 ?auto_1297867 ) ) ( not ( = ?auto_1297858 ?auto_1297855 ) ) ( not ( = ?auto_1297858 ?auto_1297859 ) ) ( not ( = ?auto_1297858 ?auto_1297861 ) ) ( not ( = ?auto_1297858 ?auto_1297860 ) ) ( not ( = ?auto_1297858 ?auto_1297862 ) ) ( not ( = ?auto_1297858 ?auto_1297863 ) ) ( not ( = ?auto_1297858 ?auto_1297864 ) ) ( not ( = ?auto_1297858 ?auto_1297865 ) ) ( not ( = ?auto_1297858 ?auto_1297866 ) ) ( not ( = ?auto_1297858 ?auto_1297867 ) ) ( not ( = ?auto_1297855 ?auto_1297859 ) ) ( not ( = ?auto_1297855 ?auto_1297861 ) ) ( not ( = ?auto_1297855 ?auto_1297860 ) ) ( not ( = ?auto_1297855 ?auto_1297862 ) ) ( not ( = ?auto_1297855 ?auto_1297863 ) ) ( not ( = ?auto_1297855 ?auto_1297864 ) ) ( not ( = ?auto_1297855 ?auto_1297865 ) ) ( not ( = ?auto_1297855 ?auto_1297866 ) ) ( not ( = ?auto_1297855 ?auto_1297867 ) ) ( not ( = ?auto_1297859 ?auto_1297861 ) ) ( not ( = ?auto_1297859 ?auto_1297860 ) ) ( not ( = ?auto_1297859 ?auto_1297862 ) ) ( not ( = ?auto_1297859 ?auto_1297863 ) ) ( not ( = ?auto_1297859 ?auto_1297864 ) ) ( not ( = ?auto_1297859 ?auto_1297865 ) ) ( not ( = ?auto_1297859 ?auto_1297866 ) ) ( not ( = ?auto_1297859 ?auto_1297867 ) ) ( not ( = ?auto_1297861 ?auto_1297860 ) ) ( not ( = ?auto_1297861 ?auto_1297862 ) ) ( not ( = ?auto_1297861 ?auto_1297863 ) ) ( not ( = ?auto_1297861 ?auto_1297864 ) ) ( not ( = ?auto_1297861 ?auto_1297865 ) ) ( not ( = ?auto_1297861 ?auto_1297866 ) ) ( not ( = ?auto_1297861 ?auto_1297867 ) ) ( not ( = ?auto_1297860 ?auto_1297862 ) ) ( not ( = ?auto_1297860 ?auto_1297863 ) ) ( not ( = ?auto_1297860 ?auto_1297864 ) ) ( not ( = ?auto_1297860 ?auto_1297865 ) ) ( not ( = ?auto_1297860 ?auto_1297866 ) ) ( not ( = ?auto_1297860 ?auto_1297867 ) ) ( not ( = ?auto_1297862 ?auto_1297863 ) ) ( not ( = ?auto_1297862 ?auto_1297864 ) ) ( not ( = ?auto_1297862 ?auto_1297865 ) ) ( not ( = ?auto_1297862 ?auto_1297866 ) ) ( not ( = ?auto_1297862 ?auto_1297867 ) ) ( not ( = ?auto_1297863 ?auto_1297864 ) ) ( not ( = ?auto_1297863 ?auto_1297865 ) ) ( not ( = ?auto_1297863 ?auto_1297866 ) ) ( not ( = ?auto_1297863 ?auto_1297867 ) ) ( not ( = ?auto_1297864 ?auto_1297865 ) ) ( not ( = ?auto_1297864 ?auto_1297866 ) ) ( not ( = ?auto_1297864 ?auto_1297867 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1297865 ?auto_1297866 ?auto_1297867 )
      ( MAKE-12CRATE-VERIFY ?auto_1297856 ?auto_1297857 ?auto_1297858 ?auto_1297855 ?auto_1297859 ?auto_1297861 ?auto_1297860 ?auto_1297862 ?auto_1297863 ?auto_1297864 ?auto_1297865 ?auto_1297866 ?auto_1297867 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1298018 - SURFACE
      ?auto_1298019 - SURFACE
      ?auto_1298020 - SURFACE
      ?auto_1298017 - SURFACE
      ?auto_1298021 - SURFACE
      ?auto_1298023 - SURFACE
      ?auto_1298022 - SURFACE
      ?auto_1298024 - SURFACE
      ?auto_1298025 - SURFACE
      ?auto_1298026 - SURFACE
      ?auto_1298027 - SURFACE
      ?auto_1298028 - SURFACE
      ?auto_1298029 - SURFACE
    )
    :vars
    (
      ?auto_1298032 - HOIST
      ?auto_1298030 - PLACE
      ?auto_1298031 - TRUCK
      ?auto_1298033 - PLACE
      ?auto_1298034 - HOIST
      ?auto_1298035 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1298032 ?auto_1298030 ) ( SURFACE-AT ?auto_1298028 ?auto_1298030 ) ( CLEAR ?auto_1298028 ) ( IS-CRATE ?auto_1298029 ) ( not ( = ?auto_1298028 ?auto_1298029 ) ) ( AVAILABLE ?auto_1298032 ) ( ON ?auto_1298028 ?auto_1298027 ) ( not ( = ?auto_1298027 ?auto_1298028 ) ) ( not ( = ?auto_1298027 ?auto_1298029 ) ) ( TRUCK-AT ?auto_1298031 ?auto_1298033 ) ( not ( = ?auto_1298033 ?auto_1298030 ) ) ( HOIST-AT ?auto_1298034 ?auto_1298033 ) ( not ( = ?auto_1298032 ?auto_1298034 ) ) ( AVAILABLE ?auto_1298034 ) ( SURFACE-AT ?auto_1298029 ?auto_1298033 ) ( ON ?auto_1298029 ?auto_1298035 ) ( CLEAR ?auto_1298029 ) ( not ( = ?auto_1298028 ?auto_1298035 ) ) ( not ( = ?auto_1298029 ?auto_1298035 ) ) ( not ( = ?auto_1298027 ?auto_1298035 ) ) ( ON ?auto_1298019 ?auto_1298018 ) ( ON ?auto_1298020 ?auto_1298019 ) ( ON ?auto_1298017 ?auto_1298020 ) ( ON ?auto_1298021 ?auto_1298017 ) ( ON ?auto_1298023 ?auto_1298021 ) ( ON ?auto_1298022 ?auto_1298023 ) ( ON ?auto_1298024 ?auto_1298022 ) ( ON ?auto_1298025 ?auto_1298024 ) ( ON ?auto_1298026 ?auto_1298025 ) ( ON ?auto_1298027 ?auto_1298026 ) ( not ( = ?auto_1298018 ?auto_1298019 ) ) ( not ( = ?auto_1298018 ?auto_1298020 ) ) ( not ( = ?auto_1298018 ?auto_1298017 ) ) ( not ( = ?auto_1298018 ?auto_1298021 ) ) ( not ( = ?auto_1298018 ?auto_1298023 ) ) ( not ( = ?auto_1298018 ?auto_1298022 ) ) ( not ( = ?auto_1298018 ?auto_1298024 ) ) ( not ( = ?auto_1298018 ?auto_1298025 ) ) ( not ( = ?auto_1298018 ?auto_1298026 ) ) ( not ( = ?auto_1298018 ?auto_1298027 ) ) ( not ( = ?auto_1298018 ?auto_1298028 ) ) ( not ( = ?auto_1298018 ?auto_1298029 ) ) ( not ( = ?auto_1298018 ?auto_1298035 ) ) ( not ( = ?auto_1298019 ?auto_1298020 ) ) ( not ( = ?auto_1298019 ?auto_1298017 ) ) ( not ( = ?auto_1298019 ?auto_1298021 ) ) ( not ( = ?auto_1298019 ?auto_1298023 ) ) ( not ( = ?auto_1298019 ?auto_1298022 ) ) ( not ( = ?auto_1298019 ?auto_1298024 ) ) ( not ( = ?auto_1298019 ?auto_1298025 ) ) ( not ( = ?auto_1298019 ?auto_1298026 ) ) ( not ( = ?auto_1298019 ?auto_1298027 ) ) ( not ( = ?auto_1298019 ?auto_1298028 ) ) ( not ( = ?auto_1298019 ?auto_1298029 ) ) ( not ( = ?auto_1298019 ?auto_1298035 ) ) ( not ( = ?auto_1298020 ?auto_1298017 ) ) ( not ( = ?auto_1298020 ?auto_1298021 ) ) ( not ( = ?auto_1298020 ?auto_1298023 ) ) ( not ( = ?auto_1298020 ?auto_1298022 ) ) ( not ( = ?auto_1298020 ?auto_1298024 ) ) ( not ( = ?auto_1298020 ?auto_1298025 ) ) ( not ( = ?auto_1298020 ?auto_1298026 ) ) ( not ( = ?auto_1298020 ?auto_1298027 ) ) ( not ( = ?auto_1298020 ?auto_1298028 ) ) ( not ( = ?auto_1298020 ?auto_1298029 ) ) ( not ( = ?auto_1298020 ?auto_1298035 ) ) ( not ( = ?auto_1298017 ?auto_1298021 ) ) ( not ( = ?auto_1298017 ?auto_1298023 ) ) ( not ( = ?auto_1298017 ?auto_1298022 ) ) ( not ( = ?auto_1298017 ?auto_1298024 ) ) ( not ( = ?auto_1298017 ?auto_1298025 ) ) ( not ( = ?auto_1298017 ?auto_1298026 ) ) ( not ( = ?auto_1298017 ?auto_1298027 ) ) ( not ( = ?auto_1298017 ?auto_1298028 ) ) ( not ( = ?auto_1298017 ?auto_1298029 ) ) ( not ( = ?auto_1298017 ?auto_1298035 ) ) ( not ( = ?auto_1298021 ?auto_1298023 ) ) ( not ( = ?auto_1298021 ?auto_1298022 ) ) ( not ( = ?auto_1298021 ?auto_1298024 ) ) ( not ( = ?auto_1298021 ?auto_1298025 ) ) ( not ( = ?auto_1298021 ?auto_1298026 ) ) ( not ( = ?auto_1298021 ?auto_1298027 ) ) ( not ( = ?auto_1298021 ?auto_1298028 ) ) ( not ( = ?auto_1298021 ?auto_1298029 ) ) ( not ( = ?auto_1298021 ?auto_1298035 ) ) ( not ( = ?auto_1298023 ?auto_1298022 ) ) ( not ( = ?auto_1298023 ?auto_1298024 ) ) ( not ( = ?auto_1298023 ?auto_1298025 ) ) ( not ( = ?auto_1298023 ?auto_1298026 ) ) ( not ( = ?auto_1298023 ?auto_1298027 ) ) ( not ( = ?auto_1298023 ?auto_1298028 ) ) ( not ( = ?auto_1298023 ?auto_1298029 ) ) ( not ( = ?auto_1298023 ?auto_1298035 ) ) ( not ( = ?auto_1298022 ?auto_1298024 ) ) ( not ( = ?auto_1298022 ?auto_1298025 ) ) ( not ( = ?auto_1298022 ?auto_1298026 ) ) ( not ( = ?auto_1298022 ?auto_1298027 ) ) ( not ( = ?auto_1298022 ?auto_1298028 ) ) ( not ( = ?auto_1298022 ?auto_1298029 ) ) ( not ( = ?auto_1298022 ?auto_1298035 ) ) ( not ( = ?auto_1298024 ?auto_1298025 ) ) ( not ( = ?auto_1298024 ?auto_1298026 ) ) ( not ( = ?auto_1298024 ?auto_1298027 ) ) ( not ( = ?auto_1298024 ?auto_1298028 ) ) ( not ( = ?auto_1298024 ?auto_1298029 ) ) ( not ( = ?auto_1298024 ?auto_1298035 ) ) ( not ( = ?auto_1298025 ?auto_1298026 ) ) ( not ( = ?auto_1298025 ?auto_1298027 ) ) ( not ( = ?auto_1298025 ?auto_1298028 ) ) ( not ( = ?auto_1298025 ?auto_1298029 ) ) ( not ( = ?auto_1298025 ?auto_1298035 ) ) ( not ( = ?auto_1298026 ?auto_1298027 ) ) ( not ( = ?auto_1298026 ?auto_1298028 ) ) ( not ( = ?auto_1298026 ?auto_1298029 ) ) ( not ( = ?auto_1298026 ?auto_1298035 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1298027 ?auto_1298028 ?auto_1298029 )
      ( MAKE-12CRATE-VERIFY ?auto_1298018 ?auto_1298019 ?auto_1298020 ?auto_1298017 ?auto_1298021 ?auto_1298023 ?auto_1298022 ?auto_1298024 ?auto_1298025 ?auto_1298026 ?auto_1298027 ?auto_1298028 ?auto_1298029 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1298181 - SURFACE
      ?auto_1298182 - SURFACE
      ?auto_1298183 - SURFACE
      ?auto_1298180 - SURFACE
      ?auto_1298184 - SURFACE
      ?auto_1298186 - SURFACE
      ?auto_1298185 - SURFACE
      ?auto_1298187 - SURFACE
      ?auto_1298188 - SURFACE
      ?auto_1298189 - SURFACE
      ?auto_1298190 - SURFACE
      ?auto_1298191 - SURFACE
      ?auto_1298192 - SURFACE
    )
    :vars
    (
      ?auto_1298194 - HOIST
      ?auto_1298196 - PLACE
      ?auto_1298195 - PLACE
      ?auto_1298198 - HOIST
      ?auto_1298197 - SURFACE
      ?auto_1298193 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1298194 ?auto_1298196 ) ( SURFACE-AT ?auto_1298191 ?auto_1298196 ) ( CLEAR ?auto_1298191 ) ( IS-CRATE ?auto_1298192 ) ( not ( = ?auto_1298191 ?auto_1298192 ) ) ( AVAILABLE ?auto_1298194 ) ( ON ?auto_1298191 ?auto_1298190 ) ( not ( = ?auto_1298190 ?auto_1298191 ) ) ( not ( = ?auto_1298190 ?auto_1298192 ) ) ( not ( = ?auto_1298195 ?auto_1298196 ) ) ( HOIST-AT ?auto_1298198 ?auto_1298195 ) ( not ( = ?auto_1298194 ?auto_1298198 ) ) ( AVAILABLE ?auto_1298198 ) ( SURFACE-AT ?auto_1298192 ?auto_1298195 ) ( ON ?auto_1298192 ?auto_1298197 ) ( CLEAR ?auto_1298192 ) ( not ( = ?auto_1298191 ?auto_1298197 ) ) ( not ( = ?auto_1298192 ?auto_1298197 ) ) ( not ( = ?auto_1298190 ?auto_1298197 ) ) ( TRUCK-AT ?auto_1298193 ?auto_1298196 ) ( ON ?auto_1298182 ?auto_1298181 ) ( ON ?auto_1298183 ?auto_1298182 ) ( ON ?auto_1298180 ?auto_1298183 ) ( ON ?auto_1298184 ?auto_1298180 ) ( ON ?auto_1298186 ?auto_1298184 ) ( ON ?auto_1298185 ?auto_1298186 ) ( ON ?auto_1298187 ?auto_1298185 ) ( ON ?auto_1298188 ?auto_1298187 ) ( ON ?auto_1298189 ?auto_1298188 ) ( ON ?auto_1298190 ?auto_1298189 ) ( not ( = ?auto_1298181 ?auto_1298182 ) ) ( not ( = ?auto_1298181 ?auto_1298183 ) ) ( not ( = ?auto_1298181 ?auto_1298180 ) ) ( not ( = ?auto_1298181 ?auto_1298184 ) ) ( not ( = ?auto_1298181 ?auto_1298186 ) ) ( not ( = ?auto_1298181 ?auto_1298185 ) ) ( not ( = ?auto_1298181 ?auto_1298187 ) ) ( not ( = ?auto_1298181 ?auto_1298188 ) ) ( not ( = ?auto_1298181 ?auto_1298189 ) ) ( not ( = ?auto_1298181 ?auto_1298190 ) ) ( not ( = ?auto_1298181 ?auto_1298191 ) ) ( not ( = ?auto_1298181 ?auto_1298192 ) ) ( not ( = ?auto_1298181 ?auto_1298197 ) ) ( not ( = ?auto_1298182 ?auto_1298183 ) ) ( not ( = ?auto_1298182 ?auto_1298180 ) ) ( not ( = ?auto_1298182 ?auto_1298184 ) ) ( not ( = ?auto_1298182 ?auto_1298186 ) ) ( not ( = ?auto_1298182 ?auto_1298185 ) ) ( not ( = ?auto_1298182 ?auto_1298187 ) ) ( not ( = ?auto_1298182 ?auto_1298188 ) ) ( not ( = ?auto_1298182 ?auto_1298189 ) ) ( not ( = ?auto_1298182 ?auto_1298190 ) ) ( not ( = ?auto_1298182 ?auto_1298191 ) ) ( not ( = ?auto_1298182 ?auto_1298192 ) ) ( not ( = ?auto_1298182 ?auto_1298197 ) ) ( not ( = ?auto_1298183 ?auto_1298180 ) ) ( not ( = ?auto_1298183 ?auto_1298184 ) ) ( not ( = ?auto_1298183 ?auto_1298186 ) ) ( not ( = ?auto_1298183 ?auto_1298185 ) ) ( not ( = ?auto_1298183 ?auto_1298187 ) ) ( not ( = ?auto_1298183 ?auto_1298188 ) ) ( not ( = ?auto_1298183 ?auto_1298189 ) ) ( not ( = ?auto_1298183 ?auto_1298190 ) ) ( not ( = ?auto_1298183 ?auto_1298191 ) ) ( not ( = ?auto_1298183 ?auto_1298192 ) ) ( not ( = ?auto_1298183 ?auto_1298197 ) ) ( not ( = ?auto_1298180 ?auto_1298184 ) ) ( not ( = ?auto_1298180 ?auto_1298186 ) ) ( not ( = ?auto_1298180 ?auto_1298185 ) ) ( not ( = ?auto_1298180 ?auto_1298187 ) ) ( not ( = ?auto_1298180 ?auto_1298188 ) ) ( not ( = ?auto_1298180 ?auto_1298189 ) ) ( not ( = ?auto_1298180 ?auto_1298190 ) ) ( not ( = ?auto_1298180 ?auto_1298191 ) ) ( not ( = ?auto_1298180 ?auto_1298192 ) ) ( not ( = ?auto_1298180 ?auto_1298197 ) ) ( not ( = ?auto_1298184 ?auto_1298186 ) ) ( not ( = ?auto_1298184 ?auto_1298185 ) ) ( not ( = ?auto_1298184 ?auto_1298187 ) ) ( not ( = ?auto_1298184 ?auto_1298188 ) ) ( not ( = ?auto_1298184 ?auto_1298189 ) ) ( not ( = ?auto_1298184 ?auto_1298190 ) ) ( not ( = ?auto_1298184 ?auto_1298191 ) ) ( not ( = ?auto_1298184 ?auto_1298192 ) ) ( not ( = ?auto_1298184 ?auto_1298197 ) ) ( not ( = ?auto_1298186 ?auto_1298185 ) ) ( not ( = ?auto_1298186 ?auto_1298187 ) ) ( not ( = ?auto_1298186 ?auto_1298188 ) ) ( not ( = ?auto_1298186 ?auto_1298189 ) ) ( not ( = ?auto_1298186 ?auto_1298190 ) ) ( not ( = ?auto_1298186 ?auto_1298191 ) ) ( not ( = ?auto_1298186 ?auto_1298192 ) ) ( not ( = ?auto_1298186 ?auto_1298197 ) ) ( not ( = ?auto_1298185 ?auto_1298187 ) ) ( not ( = ?auto_1298185 ?auto_1298188 ) ) ( not ( = ?auto_1298185 ?auto_1298189 ) ) ( not ( = ?auto_1298185 ?auto_1298190 ) ) ( not ( = ?auto_1298185 ?auto_1298191 ) ) ( not ( = ?auto_1298185 ?auto_1298192 ) ) ( not ( = ?auto_1298185 ?auto_1298197 ) ) ( not ( = ?auto_1298187 ?auto_1298188 ) ) ( not ( = ?auto_1298187 ?auto_1298189 ) ) ( not ( = ?auto_1298187 ?auto_1298190 ) ) ( not ( = ?auto_1298187 ?auto_1298191 ) ) ( not ( = ?auto_1298187 ?auto_1298192 ) ) ( not ( = ?auto_1298187 ?auto_1298197 ) ) ( not ( = ?auto_1298188 ?auto_1298189 ) ) ( not ( = ?auto_1298188 ?auto_1298190 ) ) ( not ( = ?auto_1298188 ?auto_1298191 ) ) ( not ( = ?auto_1298188 ?auto_1298192 ) ) ( not ( = ?auto_1298188 ?auto_1298197 ) ) ( not ( = ?auto_1298189 ?auto_1298190 ) ) ( not ( = ?auto_1298189 ?auto_1298191 ) ) ( not ( = ?auto_1298189 ?auto_1298192 ) ) ( not ( = ?auto_1298189 ?auto_1298197 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1298190 ?auto_1298191 ?auto_1298192 )
      ( MAKE-12CRATE-VERIFY ?auto_1298181 ?auto_1298182 ?auto_1298183 ?auto_1298180 ?auto_1298184 ?auto_1298186 ?auto_1298185 ?auto_1298187 ?auto_1298188 ?auto_1298189 ?auto_1298190 ?auto_1298191 ?auto_1298192 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1298344 - SURFACE
      ?auto_1298345 - SURFACE
      ?auto_1298346 - SURFACE
      ?auto_1298343 - SURFACE
      ?auto_1298347 - SURFACE
      ?auto_1298349 - SURFACE
      ?auto_1298348 - SURFACE
      ?auto_1298350 - SURFACE
      ?auto_1298351 - SURFACE
      ?auto_1298352 - SURFACE
      ?auto_1298353 - SURFACE
      ?auto_1298354 - SURFACE
      ?auto_1298355 - SURFACE
    )
    :vars
    (
      ?auto_1298356 - HOIST
      ?auto_1298358 - PLACE
      ?auto_1298360 - PLACE
      ?auto_1298361 - HOIST
      ?auto_1298359 - SURFACE
      ?auto_1298357 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1298356 ?auto_1298358 ) ( IS-CRATE ?auto_1298355 ) ( not ( = ?auto_1298354 ?auto_1298355 ) ) ( not ( = ?auto_1298353 ?auto_1298354 ) ) ( not ( = ?auto_1298353 ?auto_1298355 ) ) ( not ( = ?auto_1298360 ?auto_1298358 ) ) ( HOIST-AT ?auto_1298361 ?auto_1298360 ) ( not ( = ?auto_1298356 ?auto_1298361 ) ) ( AVAILABLE ?auto_1298361 ) ( SURFACE-AT ?auto_1298355 ?auto_1298360 ) ( ON ?auto_1298355 ?auto_1298359 ) ( CLEAR ?auto_1298355 ) ( not ( = ?auto_1298354 ?auto_1298359 ) ) ( not ( = ?auto_1298355 ?auto_1298359 ) ) ( not ( = ?auto_1298353 ?auto_1298359 ) ) ( TRUCK-AT ?auto_1298357 ?auto_1298358 ) ( SURFACE-AT ?auto_1298353 ?auto_1298358 ) ( CLEAR ?auto_1298353 ) ( LIFTING ?auto_1298356 ?auto_1298354 ) ( IS-CRATE ?auto_1298354 ) ( ON ?auto_1298345 ?auto_1298344 ) ( ON ?auto_1298346 ?auto_1298345 ) ( ON ?auto_1298343 ?auto_1298346 ) ( ON ?auto_1298347 ?auto_1298343 ) ( ON ?auto_1298349 ?auto_1298347 ) ( ON ?auto_1298348 ?auto_1298349 ) ( ON ?auto_1298350 ?auto_1298348 ) ( ON ?auto_1298351 ?auto_1298350 ) ( ON ?auto_1298352 ?auto_1298351 ) ( ON ?auto_1298353 ?auto_1298352 ) ( not ( = ?auto_1298344 ?auto_1298345 ) ) ( not ( = ?auto_1298344 ?auto_1298346 ) ) ( not ( = ?auto_1298344 ?auto_1298343 ) ) ( not ( = ?auto_1298344 ?auto_1298347 ) ) ( not ( = ?auto_1298344 ?auto_1298349 ) ) ( not ( = ?auto_1298344 ?auto_1298348 ) ) ( not ( = ?auto_1298344 ?auto_1298350 ) ) ( not ( = ?auto_1298344 ?auto_1298351 ) ) ( not ( = ?auto_1298344 ?auto_1298352 ) ) ( not ( = ?auto_1298344 ?auto_1298353 ) ) ( not ( = ?auto_1298344 ?auto_1298354 ) ) ( not ( = ?auto_1298344 ?auto_1298355 ) ) ( not ( = ?auto_1298344 ?auto_1298359 ) ) ( not ( = ?auto_1298345 ?auto_1298346 ) ) ( not ( = ?auto_1298345 ?auto_1298343 ) ) ( not ( = ?auto_1298345 ?auto_1298347 ) ) ( not ( = ?auto_1298345 ?auto_1298349 ) ) ( not ( = ?auto_1298345 ?auto_1298348 ) ) ( not ( = ?auto_1298345 ?auto_1298350 ) ) ( not ( = ?auto_1298345 ?auto_1298351 ) ) ( not ( = ?auto_1298345 ?auto_1298352 ) ) ( not ( = ?auto_1298345 ?auto_1298353 ) ) ( not ( = ?auto_1298345 ?auto_1298354 ) ) ( not ( = ?auto_1298345 ?auto_1298355 ) ) ( not ( = ?auto_1298345 ?auto_1298359 ) ) ( not ( = ?auto_1298346 ?auto_1298343 ) ) ( not ( = ?auto_1298346 ?auto_1298347 ) ) ( not ( = ?auto_1298346 ?auto_1298349 ) ) ( not ( = ?auto_1298346 ?auto_1298348 ) ) ( not ( = ?auto_1298346 ?auto_1298350 ) ) ( not ( = ?auto_1298346 ?auto_1298351 ) ) ( not ( = ?auto_1298346 ?auto_1298352 ) ) ( not ( = ?auto_1298346 ?auto_1298353 ) ) ( not ( = ?auto_1298346 ?auto_1298354 ) ) ( not ( = ?auto_1298346 ?auto_1298355 ) ) ( not ( = ?auto_1298346 ?auto_1298359 ) ) ( not ( = ?auto_1298343 ?auto_1298347 ) ) ( not ( = ?auto_1298343 ?auto_1298349 ) ) ( not ( = ?auto_1298343 ?auto_1298348 ) ) ( not ( = ?auto_1298343 ?auto_1298350 ) ) ( not ( = ?auto_1298343 ?auto_1298351 ) ) ( not ( = ?auto_1298343 ?auto_1298352 ) ) ( not ( = ?auto_1298343 ?auto_1298353 ) ) ( not ( = ?auto_1298343 ?auto_1298354 ) ) ( not ( = ?auto_1298343 ?auto_1298355 ) ) ( not ( = ?auto_1298343 ?auto_1298359 ) ) ( not ( = ?auto_1298347 ?auto_1298349 ) ) ( not ( = ?auto_1298347 ?auto_1298348 ) ) ( not ( = ?auto_1298347 ?auto_1298350 ) ) ( not ( = ?auto_1298347 ?auto_1298351 ) ) ( not ( = ?auto_1298347 ?auto_1298352 ) ) ( not ( = ?auto_1298347 ?auto_1298353 ) ) ( not ( = ?auto_1298347 ?auto_1298354 ) ) ( not ( = ?auto_1298347 ?auto_1298355 ) ) ( not ( = ?auto_1298347 ?auto_1298359 ) ) ( not ( = ?auto_1298349 ?auto_1298348 ) ) ( not ( = ?auto_1298349 ?auto_1298350 ) ) ( not ( = ?auto_1298349 ?auto_1298351 ) ) ( not ( = ?auto_1298349 ?auto_1298352 ) ) ( not ( = ?auto_1298349 ?auto_1298353 ) ) ( not ( = ?auto_1298349 ?auto_1298354 ) ) ( not ( = ?auto_1298349 ?auto_1298355 ) ) ( not ( = ?auto_1298349 ?auto_1298359 ) ) ( not ( = ?auto_1298348 ?auto_1298350 ) ) ( not ( = ?auto_1298348 ?auto_1298351 ) ) ( not ( = ?auto_1298348 ?auto_1298352 ) ) ( not ( = ?auto_1298348 ?auto_1298353 ) ) ( not ( = ?auto_1298348 ?auto_1298354 ) ) ( not ( = ?auto_1298348 ?auto_1298355 ) ) ( not ( = ?auto_1298348 ?auto_1298359 ) ) ( not ( = ?auto_1298350 ?auto_1298351 ) ) ( not ( = ?auto_1298350 ?auto_1298352 ) ) ( not ( = ?auto_1298350 ?auto_1298353 ) ) ( not ( = ?auto_1298350 ?auto_1298354 ) ) ( not ( = ?auto_1298350 ?auto_1298355 ) ) ( not ( = ?auto_1298350 ?auto_1298359 ) ) ( not ( = ?auto_1298351 ?auto_1298352 ) ) ( not ( = ?auto_1298351 ?auto_1298353 ) ) ( not ( = ?auto_1298351 ?auto_1298354 ) ) ( not ( = ?auto_1298351 ?auto_1298355 ) ) ( not ( = ?auto_1298351 ?auto_1298359 ) ) ( not ( = ?auto_1298352 ?auto_1298353 ) ) ( not ( = ?auto_1298352 ?auto_1298354 ) ) ( not ( = ?auto_1298352 ?auto_1298355 ) ) ( not ( = ?auto_1298352 ?auto_1298359 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1298353 ?auto_1298354 ?auto_1298355 )
      ( MAKE-12CRATE-VERIFY ?auto_1298344 ?auto_1298345 ?auto_1298346 ?auto_1298343 ?auto_1298347 ?auto_1298349 ?auto_1298348 ?auto_1298350 ?auto_1298351 ?auto_1298352 ?auto_1298353 ?auto_1298354 ?auto_1298355 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1298507 - SURFACE
      ?auto_1298508 - SURFACE
      ?auto_1298509 - SURFACE
      ?auto_1298506 - SURFACE
      ?auto_1298510 - SURFACE
      ?auto_1298512 - SURFACE
      ?auto_1298511 - SURFACE
      ?auto_1298513 - SURFACE
      ?auto_1298514 - SURFACE
      ?auto_1298515 - SURFACE
      ?auto_1298516 - SURFACE
      ?auto_1298517 - SURFACE
      ?auto_1298518 - SURFACE
    )
    :vars
    (
      ?auto_1298521 - HOIST
      ?auto_1298519 - PLACE
      ?auto_1298524 - PLACE
      ?auto_1298520 - HOIST
      ?auto_1298522 - SURFACE
      ?auto_1298523 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1298521 ?auto_1298519 ) ( IS-CRATE ?auto_1298518 ) ( not ( = ?auto_1298517 ?auto_1298518 ) ) ( not ( = ?auto_1298516 ?auto_1298517 ) ) ( not ( = ?auto_1298516 ?auto_1298518 ) ) ( not ( = ?auto_1298524 ?auto_1298519 ) ) ( HOIST-AT ?auto_1298520 ?auto_1298524 ) ( not ( = ?auto_1298521 ?auto_1298520 ) ) ( AVAILABLE ?auto_1298520 ) ( SURFACE-AT ?auto_1298518 ?auto_1298524 ) ( ON ?auto_1298518 ?auto_1298522 ) ( CLEAR ?auto_1298518 ) ( not ( = ?auto_1298517 ?auto_1298522 ) ) ( not ( = ?auto_1298518 ?auto_1298522 ) ) ( not ( = ?auto_1298516 ?auto_1298522 ) ) ( TRUCK-AT ?auto_1298523 ?auto_1298519 ) ( SURFACE-AT ?auto_1298516 ?auto_1298519 ) ( CLEAR ?auto_1298516 ) ( IS-CRATE ?auto_1298517 ) ( AVAILABLE ?auto_1298521 ) ( IN ?auto_1298517 ?auto_1298523 ) ( ON ?auto_1298508 ?auto_1298507 ) ( ON ?auto_1298509 ?auto_1298508 ) ( ON ?auto_1298506 ?auto_1298509 ) ( ON ?auto_1298510 ?auto_1298506 ) ( ON ?auto_1298512 ?auto_1298510 ) ( ON ?auto_1298511 ?auto_1298512 ) ( ON ?auto_1298513 ?auto_1298511 ) ( ON ?auto_1298514 ?auto_1298513 ) ( ON ?auto_1298515 ?auto_1298514 ) ( ON ?auto_1298516 ?auto_1298515 ) ( not ( = ?auto_1298507 ?auto_1298508 ) ) ( not ( = ?auto_1298507 ?auto_1298509 ) ) ( not ( = ?auto_1298507 ?auto_1298506 ) ) ( not ( = ?auto_1298507 ?auto_1298510 ) ) ( not ( = ?auto_1298507 ?auto_1298512 ) ) ( not ( = ?auto_1298507 ?auto_1298511 ) ) ( not ( = ?auto_1298507 ?auto_1298513 ) ) ( not ( = ?auto_1298507 ?auto_1298514 ) ) ( not ( = ?auto_1298507 ?auto_1298515 ) ) ( not ( = ?auto_1298507 ?auto_1298516 ) ) ( not ( = ?auto_1298507 ?auto_1298517 ) ) ( not ( = ?auto_1298507 ?auto_1298518 ) ) ( not ( = ?auto_1298507 ?auto_1298522 ) ) ( not ( = ?auto_1298508 ?auto_1298509 ) ) ( not ( = ?auto_1298508 ?auto_1298506 ) ) ( not ( = ?auto_1298508 ?auto_1298510 ) ) ( not ( = ?auto_1298508 ?auto_1298512 ) ) ( not ( = ?auto_1298508 ?auto_1298511 ) ) ( not ( = ?auto_1298508 ?auto_1298513 ) ) ( not ( = ?auto_1298508 ?auto_1298514 ) ) ( not ( = ?auto_1298508 ?auto_1298515 ) ) ( not ( = ?auto_1298508 ?auto_1298516 ) ) ( not ( = ?auto_1298508 ?auto_1298517 ) ) ( not ( = ?auto_1298508 ?auto_1298518 ) ) ( not ( = ?auto_1298508 ?auto_1298522 ) ) ( not ( = ?auto_1298509 ?auto_1298506 ) ) ( not ( = ?auto_1298509 ?auto_1298510 ) ) ( not ( = ?auto_1298509 ?auto_1298512 ) ) ( not ( = ?auto_1298509 ?auto_1298511 ) ) ( not ( = ?auto_1298509 ?auto_1298513 ) ) ( not ( = ?auto_1298509 ?auto_1298514 ) ) ( not ( = ?auto_1298509 ?auto_1298515 ) ) ( not ( = ?auto_1298509 ?auto_1298516 ) ) ( not ( = ?auto_1298509 ?auto_1298517 ) ) ( not ( = ?auto_1298509 ?auto_1298518 ) ) ( not ( = ?auto_1298509 ?auto_1298522 ) ) ( not ( = ?auto_1298506 ?auto_1298510 ) ) ( not ( = ?auto_1298506 ?auto_1298512 ) ) ( not ( = ?auto_1298506 ?auto_1298511 ) ) ( not ( = ?auto_1298506 ?auto_1298513 ) ) ( not ( = ?auto_1298506 ?auto_1298514 ) ) ( not ( = ?auto_1298506 ?auto_1298515 ) ) ( not ( = ?auto_1298506 ?auto_1298516 ) ) ( not ( = ?auto_1298506 ?auto_1298517 ) ) ( not ( = ?auto_1298506 ?auto_1298518 ) ) ( not ( = ?auto_1298506 ?auto_1298522 ) ) ( not ( = ?auto_1298510 ?auto_1298512 ) ) ( not ( = ?auto_1298510 ?auto_1298511 ) ) ( not ( = ?auto_1298510 ?auto_1298513 ) ) ( not ( = ?auto_1298510 ?auto_1298514 ) ) ( not ( = ?auto_1298510 ?auto_1298515 ) ) ( not ( = ?auto_1298510 ?auto_1298516 ) ) ( not ( = ?auto_1298510 ?auto_1298517 ) ) ( not ( = ?auto_1298510 ?auto_1298518 ) ) ( not ( = ?auto_1298510 ?auto_1298522 ) ) ( not ( = ?auto_1298512 ?auto_1298511 ) ) ( not ( = ?auto_1298512 ?auto_1298513 ) ) ( not ( = ?auto_1298512 ?auto_1298514 ) ) ( not ( = ?auto_1298512 ?auto_1298515 ) ) ( not ( = ?auto_1298512 ?auto_1298516 ) ) ( not ( = ?auto_1298512 ?auto_1298517 ) ) ( not ( = ?auto_1298512 ?auto_1298518 ) ) ( not ( = ?auto_1298512 ?auto_1298522 ) ) ( not ( = ?auto_1298511 ?auto_1298513 ) ) ( not ( = ?auto_1298511 ?auto_1298514 ) ) ( not ( = ?auto_1298511 ?auto_1298515 ) ) ( not ( = ?auto_1298511 ?auto_1298516 ) ) ( not ( = ?auto_1298511 ?auto_1298517 ) ) ( not ( = ?auto_1298511 ?auto_1298518 ) ) ( not ( = ?auto_1298511 ?auto_1298522 ) ) ( not ( = ?auto_1298513 ?auto_1298514 ) ) ( not ( = ?auto_1298513 ?auto_1298515 ) ) ( not ( = ?auto_1298513 ?auto_1298516 ) ) ( not ( = ?auto_1298513 ?auto_1298517 ) ) ( not ( = ?auto_1298513 ?auto_1298518 ) ) ( not ( = ?auto_1298513 ?auto_1298522 ) ) ( not ( = ?auto_1298514 ?auto_1298515 ) ) ( not ( = ?auto_1298514 ?auto_1298516 ) ) ( not ( = ?auto_1298514 ?auto_1298517 ) ) ( not ( = ?auto_1298514 ?auto_1298518 ) ) ( not ( = ?auto_1298514 ?auto_1298522 ) ) ( not ( = ?auto_1298515 ?auto_1298516 ) ) ( not ( = ?auto_1298515 ?auto_1298517 ) ) ( not ( = ?auto_1298515 ?auto_1298518 ) ) ( not ( = ?auto_1298515 ?auto_1298522 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1298516 ?auto_1298517 ?auto_1298518 )
      ( MAKE-12CRATE-VERIFY ?auto_1298507 ?auto_1298508 ?auto_1298509 ?auto_1298506 ?auto_1298510 ?auto_1298512 ?auto_1298511 ?auto_1298513 ?auto_1298514 ?auto_1298515 ?auto_1298516 ?auto_1298517 ?auto_1298518 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1306143 - SURFACE
      ?auto_1306144 - SURFACE
    )
    :vars
    (
      ?auto_1306149 - HOIST
      ?auto_1306145 - PLACE
      ?auto_1306147 - SURFACE
      ?auto_1306151 - TRUCK
      ?auto_1306148 - PLACE
      ?auto_1306146 - HOIST
      ?auto_1306150 - SURFACE
      ?auto_1306152 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1306149 ?auto_1306145 ) ( SURFACE-AT ?auto_1306143 ?auto_1306145 ) ( CLEAR ?auto_1306143 ) ( IS-CRATE ?auto_1306144 ) ( not ( = ?auto_1306143 ?auto_1306144 ) ) ( AVAILABLE ?auto_1306149 ) ( ON ?auto_1306143 ?auto_1306147 ) ( not ( = ?auto_1306147 ?auto_1306143 ) ) ( not ( = ?auto_1306147 ?auto_1306144 ) ) ( TRUCK-AT ?auto_1306151 ?auto_1306148 ) ( not ( = ?auto_1306148 ?auto_1306145 ) ) ( HOIST-AT ?auto_1306146 ?auto_1306148 ) ( not ( = ?auto_1306149 ?auto_1306146 ) ) ( SURFACE-AT ?auto_1306144 ?auto_1306148 ) ( ON ?auto_1306144 ?auto_1306150 ) ( CLEAR ?auto_1306144 ) ( not ( = ?auto_1306143 ?auto_1306150 ) ) ( not ( = ?auto_1306144 ?auto_1306150 ) ) ( not ( = ?auto_1306147 ?auto_1306150 ) ) ( LIFTING ?auto_1306146 ?auto_1306152 ) ( IS-CRATE ?auto_1306152 ) ( not ( = ?auto_1306143 ?auto_1306152 ) ) ( not ( = ?auto_1306144 ?auto_1306152 ) ) ( not ( = ?auto_1306147 ?auto_1306152 ) ) ( not ( = ?auto_1306150 ?auto_1306152 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1306146 ?auto_1306152 ?auto_1306151 ?auto_1306148 )
      ( MAKE-1CRATE ?auto_1306143 ?auto_1306144 )
      ( MAKE-1CRATE-VERIFY ?auto_1306143 ?auto_1306144 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1310092 - SURFACE
      ?auto_1310093 - SURFACE
      ?auto_1310094 - SURFACE
      ?auto_1310091 - SURFACE
      ?auto_1310095 - SURFACE
      ?auto_1310097 - SURFACE
      ?auto_1310096 - SURFACE
      ?auto_1310098 - SURFACE
      ?auto_1310099 - SURFACE
      ?auto_1310100 - SURFACE
      ?auto_1310101 - SURFACE
      ?auto_1310102 - SURFACE
      ?auto_1310103 - SURFACE
      ?auto_1310104 - SURFACE
    )
    :vars
    (
      ?auto_1310106 - HOIST
      ?auto_1310105 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1310106 ?auto_1310105 ) ( SURFACE-AT ?auto_1310103 ?auto_1310105 ) ( CLEAR ?auto_1310103 ) ( LIFTING ?auto_1310106 ?auto_1310104 ) ( IS-CRATE ?auto_1310104 ) ( not ( = ?auto_1310103 ?auto_1310104 ) ) ( ON ?auto_1310093 ?auto_1310092 ) ( ON ?auto_1310094 ?auto_1310093 ) ( ON ?auto_1310091 ?auto_1310094 ) ( ON ?auto_1310095 ?auto_1310091 ) ( ON ?auto_1310097 ?auto_1310095 ) ( ON ?auto_1310096 ?auto_1310097 ) ( ON ?auto_1310098 ?auto_1310096 ) ( ON ?auto_1310099 ?auto_1310098 ) ( ON ?auto_1310100 ?auto_1310099 ) ( ON ?auto_1310101 ?auto_1310100 ) ( ON ?auto_1310102 ?auto_1310101 ) ( ON ?auto_1310103 ?auto_1310102 ) ( not ( = ?auto_1310092 ?auto_1310093 ) ) ( not ( = ?auto_1310092 ?auto_1310094 ) ) ( not ( = ?auto_1310092 ?auto_1310091 ) ) ( not ( = ?auto_1310092 ?auto_1310095 ) ) ( not ( = ?auto_1310092 ?auto_1310097 ) ) ( not ( = ?auto_1310092 ?auto_1310096 ) ) ( not ( = ?auto_1310092 ?auto_1310098 ) ) ( not ( = ?auto_1310092 ?auto_1310099 ) ) ( not ( = ?auto_1310092 ?auto_1310100 ) ) ( not ( = ?auto_1310092 ?auto_1310101 ) ) ( not ( = ?auto_1310092 ?auto_1310102 ) ) ( not ( = ?auto_1310092 ?auto_1310103 ) ) ( not ( = ?auto_1310092 ?auto_1310104 ) ) ( not ( = ?auto_1310093 ?auto_1310094 ) ) ( not ( = ?auto_1310093 ?auto_1310091 ) ) ( not ( = ?auto_1310093 ?auto_1310095 ) ) ( not ( = ?auto_1310093 ?auto_1310097 ) ) ( not ( = ?auto_1310093 ?auto_1310096 ) ) ( not ( = ?auto_1310093 ?auto_1310098 ) ) ( not ( = ?auto_1310093 ?auto_1310099 ) ) ( not ( = ?auto_1310093 ?auto_1310100 ) ) ( not ( = ?auto_1310093 ?auto_1310101 ) ) ( not ( = ?auto_1310093 ?auto_1310102 ) ) ( not ( = ?auto_1310093 ?auto_1310103 ) ) ( not ( = ?auto_1310093 ?auto_1310104 ) ) ( not ( = ?auto_1310094 ?auto_1310091 ) ) ( not ( = ?auto_1310094 ?auto_1310095 ) ) ( not ( = ?auto_1310094 ?auto_1310097 ) ) ( not ( = ?auto_1310094 ?auto_1310096 ) ) ( not ( = ?auto_1310094 ?auto_1310098 ) ) ( not ( = ?auto_1310094 ?auto_1310099 ) ) ( not ( = ?auto_1310094 ?auto_1310100 ) ) ( not ( = ?auto_1310094 ?auto_1310101 ) ) ( not ( = ?auto_1310094 ?auto_1310102 ) ) ( not ( = ?auto_1310094 ?auto_1310103 ) ) ( not ( = ?auto_1310094 ?auto_1310104 ) ) ( not ( = ?auto_1310091 ?auto_1310095 ) ) ( not ( = ?auto_1310091 ?auto_1310097 ) ) ( not ( = ?auto_1310091 ?auto_1310096 ) ) ( not ( = ?auto_1310091 ?auto_1310098 ) ) ( not ( = ?auto_1310091 ?auto_1310099 ) ) ( not ( = ?auto_1310091 ?auto_1310100 ) ) ( not ( = ?auto_1310091 ?auto_1310101 ) ) ( not ( = ?auto_1310091 ?auto_1310102 ) ) ( not ( = ?auto_1310091 ?auto_1310103 ) ) ( not ( = ?auto_1310091 ?auto_1310104 ) ) ( not ( = ?auto_1310095 ?auto_1310097 ) ) ( not ( = ?auto_1310095 ?auto_1310096 ) ) ( not ( = ?auto_1310095 ?auto_1310098 ) ) ( not ( = ?auto_1310095 ?auto_1310099 ) ) ( not ( = ?auto_1310095 ?auto_1310100 ) ) ( not ( = ?auto_1310095 ?auto_1310101 ) ) ( not ( = ?auto_1310095 ?auto_1310102 ) ) ( not ( = ?auto_1310095 ?auto_1310103 ) ) ( not ( = ?auto_1310095 ?auto_1310104 ) ) ( not ( = ?auto_1310097 ?auto_1310096 ) ) ( not ( = ?auto_1310097 ?auto_1310098 ) ) ( not ( = ?auto_1310097 ?auto_1310099 ) ) ( not ( = ?auto_1310097 ?auto_1310100 ) ) ( not ( = ?auto_1310097 ?auto_1310101 ) ) ( not ( = ?auto_1310097 ?auto_1310102 ) ) ( not ( = ?auto_1310097 ?auto_1310103 ) ) ( not ( = ?auto_1310097 ?auto_1310104 ) ) ( not ( = ?auto_1310096 ?auto_1310098 ) ) ( not ( = ?auto_1310096 ?auto_1310099 ) ) ( not ( = ?auto_1310096 ?auto_1310100 ) ) ( not ( = ?auto_1310096 ?auto_1310101 ) ) ( not ( = ?auto_1310096 ?auto_1310102 ) ) ( not ( = ?auto_1310096 ?auto_1310103 ) ) ( not ( = ?auto_1310096 ?auto_1310104 ) ) ( not ( = ?auto_1310098 ?auto_1310099 ) ) ( not ( = ?auto_1310098 ?auto_1310100 ) ) ( not ( = ?auto_1310098 ?auto_1310101 ) ) ( not ( = ?auto_1310098 ?auto_1310102 ) ) ( not ( = ?auto_1310098 ?auto_1310103 ) ) ( not ( = ?auto_1310098 ?auto_1310104 ) ) ( not ( = ?auto_1310099 ?auto_1310100 ) ) ( not ( = ?auto_1310099 ?auto_1310101 ) ) ( not ( = ?auto_1310099 ?auto_1310102 ) ) ( not ( = ?auto_1310099 ?auto_1310103 ) ) ( not ( = ?auto_1310099 ?auto_1310104 ) ) ( not ( = ?auto_1310100 ?auto_1310101 ) ) ( not ( = ?auto_1310100 ?auto_1310102 ) ) ( not ( = ?auto_1310100 ?auto_1310103 ) ) ( not ( = ?auto_1310100 ?auto_1310104 ) ) ( not ( = ?auto_1310101 ?auto_1310102 ) ) ( not ( = ?auto_1310101 ?auto_1310103 ) ) ( not ( = ?auto_1310101 ?auto_1310104 ) ) ( not ( = ?auto_1310102 ?auto_1310103 ) ) ( not ( = ?auto_1310102 ?auto_1310104 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1310103 ?auto_1310104 )
      ( MAKE-13CRATE-VERIFY ?auto_1310092 ?auto_1310093 ?auto_1310094 ?auto_1310091 ?auto_1310095 ?auto_1310097 ?auto_1310096 ?auto_1310098 ?auto_1310099 ?auto_1310100 ?auto_1310101 ?auto_1310102 ?auto_1310103 ?auto_1310104 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1310234 - SURFACE
      ?auto_1310235 - SURFACE
      ?auto_1310236 - SURFACE
      ?auto_1310233 - SURFACE
      ?auto_1310237 - SURFACE
      ?auto_1310239 - SURFACE
      ?auto_1310238 - SURFACE
      ?auto_1310240 - SURFACE
      ?auto_1310241 - SURFACE
      ?auto_1310242 - SURFACE
      ?auto_1310243 - SURFACE
      ?auto_1310244 - SURFACE
      ?auto_1310245 - SURFACE
      ?auto_1310246 - SURFACE
    )
    :vars
    (
      ?auto_1310247 - HOIST
      ?auto_1310248 - PLACE
      ?auto_1310249 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1310247 ?auto_1310248 ) ( SURFACE-AT ?auto_1310245 ?auto_1310248 ) ( CLEAR ?auto_1310245 ) ( IS-CRATE ?auto_1310246 ) ( not ( = ?auto_1310245 ?auto_1310246 ) ) ( TRUCK-AT ?auto_1310249 ?auto_1310248 ) ( AVAILABLE ?auto_1310247 ) ( IN ?auto_1310246 ?auto_1310249 ) ( ON ?auto_1310245 ?auto_1310244 ) ( not ( = ?auto_1310244 ?auto_1310245 ) ) ( not ( = ?auto_1310244 ?auto_1310246 ) ) ( ON ?auto_1310235 ?auto_1310234 ) ( ON ?auto_1310236 ?auto_1310235 ) ( ON ?auto_1310233 ?auto_1310236 ) ( ON ?auto_1310237 ?auto_1310233 ) ( ON ?auto_1310239 ?auto_1310237 ) ( ON ?auto_1310238 ?auto_1310239 ) ( ON ?auto_1310240 ?auto_1310238 ) ( ON ?auto_1310241 ?auto_1310240 ) ( ON ?auto_1310242 ?auto_1310241 ) ( ON ?auto_1310243 ?auto_1310242 ) ( ON ?auto_1310244 ?auto_1310243 ) ( not ( = ?auto_1310234 ?auto_1310235 ) ) ( not ( = ?auto_1310234 ?auto_1310236 ) ) ( not ( = ?auto_1310234 ?auto_1310233 ) ) ( not ( = ?auto_1310234 ?auto_1310237 ) ) ( not ( = ?auto_1310234 ?auto_1310239 ) ) ( not ( = ?auto_1310234 ?auto_1310238 ) ) ( not ( = ?auto_1310234 ?auto_1310240 ) ) ( not ( = ?auto_1310234 ?auto_1310241 ) ) ( not ( = ?auto_1310234 ?auto_1310242 ) ) ( not ( = ?auto_1310234 ?auto_1310243 ) ) ( not ( = ?auto_1310234 ?auto_1310244 ) ) ( not ( = ?auto_1310234 ?auto_1310245 ) ) ( not ( = ?auto_1310234 ?auto_1310246 ) ) ( not ( = ?auto_1310235 ?auto_1310236 ) ) ( not ( = ?auto_1310235 ?auto_1310233 ) ) ( not ( = ?auto_1310235 ?auto_1310237 ) ) ( not ( = ?auto_1310235 ?auto_1310239 ) ) ( not ( = ?auto_1310235 ?auto_1310238 ) ) ( not ( = ?auto_1310235 ?auto_1310240 ) ) ( not ( = ?auto_1310235 ?auto_1310241 ) ) ( not ( = ?auto_1310235 ?auto_1310242 ) ) ( not ( = ?auto_1310235 ?auto_1310243 ) ) ( not ( = ?auto_1310235 ?auto_1310244 ) ) ( not ( = ?auto_1310235 ?auto_1310245 ) ) ( not ( = ?auto_1310235 ?auto_1310246 ) ) ( not ( = ?auto_1310236 ?auto_1310233 ) ) ( not ( = ?auto_1310236 ?auto_1310237 ) ) ( not ( = ?auto_1310236 ?auto_1310239 ) ) ( not ( = ?auto_1310236 ?auto_1310238 ) ) ( not ( = ?auto_1310236 ?auto_1310240 ) ) ( not ( = ?auto_1310236 ?auto_1310241 ) ) ( not ( = ?auto_1310236 ?auto_1310242 ) ) ( not ( = ?auto_1310236 ?auto_1310243 ) ) ( not ( = ?auto_1310236 ?auto_1310244 ) ) ( not ( = ?auto_1310236 ?auto_1310245 ) ) ( not ( = ?auto_1310236 ?auto_1310246 ) ) ( not ( = ?auto_1310233 ?auto_1310237 ) ) ( not ( = ?auto_1310233 ?auto_1310239 ) ) ( not ( = ?auto_1310233 ?auto_1310238 ) ) ( not ( = ?auto_1310233 ?auto_1310240 ) ) ( not ( = ?auto_1310233 ?auto_1310241 ) ) ( not ( = ?auto_1310233 ?auto_1310242 ) ) ( not ( = ?auto_1310233 ?auto_1310243 ) ) ( not ( = ?auto_1310233 ?auto_1310244 ) ) ( not ( = ?auto_1310233 ?auto_1310245 ) ) ( not ( = ?auto_1310233 ?auto_1310246 ) ) ( not ( = ?auto_1310237 ?auto_1310239 ) ) ( not ( = ?auto_1310237 ?auto_1310238 ) ) ( not ( = ?auto_1310237 ?auto_1310240 ) ) ( not ( = ?auto_1310237 ?auto_1310241 ) ) ( not ( = ?auto_1310237 ?auto_1310242 ) ) ( not ( = ?auto_1310237 ?auto_1310243 ) ) ( not ( = ?auto_1310237 ?auto_1310244 ) ) ( not ( = ?auto_1310237 ?auto_1310245 ) ) ( not ( = ?auto_1310237 ?auto_1310246 ) ) ( not ( = ?auto_1310239 ?auto_1310238 ) ) ( not ( = ?auto_1310239 ?auto_1310240 ) ) ( not ( = ?auto_1310239 ?auto_1310241 ) ) ( not ( = ?auto_1310239 ?auto_1310242 ) ) ( not ( = ?auto_1310239 ?auto_1310243 ) ) ( not ( = ?auto_1310239 ?auto_1310244 ) ) ( not ( = ?auto_1310239 ?auto_1310245 ) ) ( not ( = ?auto_1310239 ?auto_1310246 ) ) ( not ( = ?auto_1310238 ?auto_1310240 ) ) ( not ( = ?auto_1310238 ?auto_1310241 ) ) ( not ( = ?auto_1310238 ?auto_1310242 ) ) ( not ( = ?auto_1310238 ?auto_1310243 ) ) ( not ( = ?auto_1310238 ?auto_1310244 ) ) ( not ( = ?auto_1310238 ?auto_1310245 ) ) ( not ( = ?auto_1310238 ?auto_1310246 ) ) ( not ( = ?auto_1310240 ?auto_1310241 ) ) ( not ( = ?auto_1310240 ?auto_1310242 ) ) ( not ( = ?auto_1310240 ?auto_1310243 ) ) ( not ( = ?auto_1310240 ?auto_1310244 ) ) ( not ( = ?auto_1310240 ?auto_1310245 ) ) ( not ( = ?auto_1310240 ?auto_1310246 ) ) ( not ( = ?auto_1310241 ?auto_1310242 ) ) ( not ( = ?auto_1310241 ?auto_1310243 ) ) ( not ( = ?auto_1310241 ?auto_1310244 ) ) ( not ( = ?auto_1310241 ?auto_1310245 ) ) ( not ( = ?auto_1310241 ?auto_1310246 ) ) ( not ( = ?auto_1310242 ?auto_1310243 ) ) ( not ( = ?auto_1310242 ?auto_1310244 ) ) ( not ( = ?auto_1310242 ?auto_1310245 ) ) ( not ( = ?auto_1310242 ?auto_1310246 ) ) ( not ( = ?auto_1310243 ?auto_1310244 ) ) ( not ( = ?auto_1310243 ?auto_1310245 ) ) ( not ( = ?auto_1310243 ?auto_1310246 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1310244 ?auto_1310245 ?auto_1310246 )
      ( MAKE-13CRATE-VERIFY ?auto_1310234 ?auto_1310235 ?auto_1310236 ?auto_1310233 ?auto_1310237 ?auto_1310239 ?auto_1310238 ?auto_1310240 ?auto_1310241 ?auto_1310242 ?auto_1310243 ?auto_1310244 ?auto_1310245 ?auto_1310246 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1310390 - SURFACE
      ?auto_1310391 - SURFACE
      ?auto_1310392 - SURFACE
      ?auto_1310389 - SURFACE
      ?auto_1310393 - SURFACE
      ?auto_1310395 - SURFACE
      ?auto_1310394 - SURFACE
      ?auto_1310396 - SURFACE
      ?auto_1310397 - SURFACE
      ?auto_1310398 - SURFACE
      ?auto_1310399 - SURFACE
      ?auto_1310400 - SURFACE
      ?auto_1310401 - SURFACE
      ?auto_1310402 - SURFACE
    )
    :vars
    (
      ?auto_1310405 - HOIST
      ?auto_1310404 - PLACE
      ?auto_1310403 - TRUCK
      ?auto_1310406 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1310405 ?auto_1310404 ) ( SURFACE-AT ?auto_1310401 ?auto_1310404 ) ( CLEAR ?auto_1310401 ) ( IS-CRATE ?auto_1310402 ) ( not ( = ?auto_1310401 ?auto_1310402 ) ) ( AVAILABLE ?auto_1310405 ) ( IN ?auto_1310402 ?auto_1310403 ) ( ON ?auto_1310401 ?auto_1310400 ) ( not ( = ?auto_1310400 ?auto_1310401 ) ) ( not ( = ?auto_1310400 ?auto_1310402 ) ) ( TRUCK-AT ?auto_1310403 ?auto_1310406 ) ( not ( = ?auto_1310406 ?auto_1310404 ) ) ( ON ?auto_1310391 ?auto_1310390 ) ( ON ?auto_1310392 ?auto_1310391 ) ( ON ?auto_1310389 ?auto_1310392 ) ( ON ?auto_1310393 ?auto_1310389 ) ( ON ?auto_1310395 ?auto_1310393 ) ( ON ?auto_1310394 ?auto_1310395 ) ( ON ?auto_1310396 ?auto_1310394 ) ( ON ?auto_1310397 ?auto_1310396 ) ( ON ?auto_1310398 ?auto_1310397 ) ( ON ?auto_1310399 ?auto_1310398 ) ( ON ?auto_1310400 ?auto_1310399 ) ( not ( = ?auto_1310390 ?auto_1310391 ) ) ( not ( = ?auto_1310390 ?auto_1310392 ) ) ( not ( = ?auto_1310390 ?auto_1310389 ) ) ( not ( = ?auto_1310390 ?auto_1310393 ) ) ( not ( = ?auto_1310390 ?auto_1310395 ) ) ( not ( = ?auto_1310390 ?auto_1310394 ) ) ( not ( = ?auto_1310390 ?auto_1310396 ) ) ( not ( = ?auto_1310390 ?auto_1310397 ) ) ( not ( = ?auto_1310390 ?auto_1310398 ) ) ( not ( = ?auto_1310390 ?auto_1310399 ) ) ( not ( = ?auto_1310390 ?auto_1310400 ) ) ( not ( = ?auto_1310390 ?auto_1310401 ) ) ( not ( = ?auto_1310390 ?auto_1310402 ) ) ( not ( = ?auto_1310391 ?auto_1310392 ) ) ( not ( = ?auto_1310391 ?auto_1310389 ) ) ( not ( = ?auto_1310391 ?auto_1310393 ) ) ( not ( = ?auto_1310391 ?auto_1310395 ) ) ( not ( = ?auto_1310391 ?auto_1310394 ) ) ( not ( = ?auto_1310391 ?auto_1310396 ) ) ( not ( = ?auto_1310391 ?auto_1310397 ) ) ( not ( = ?auto_1310391 ?auto_1310398 ) ) ( not ( = ?auto_1310391 ?auto_1310399 ) ) ( not ( = ?auto_1310391 ?auto_1310400 ) ) ( not ( = ?auto_1310391 ?auto_1310401 ) ) ( not ( = ?auto_1310391 ?auto_1310402 ) ) ( not ( = ?auto_1310392 ?auto_1310389 ) ) ( not ( = ?auto_1310392 ?auto_1310393 ) ) ( not ( = ?auto_1310392 ?auto_1310395 ) ) ( not ( = ?auto_1310392 ?auto_1310394 ) ) ( not ( = ?auto_1310392 ?auto_1310396 ) ) ( not ( = ?auto_1310392 ?auto_1310397 ) ) ( not ( = ?auto_1310392 ?auto_1310398 ) ) ( not ( = ?auto_1310392 ?auto_1310399 ) ) ( not ( = ?auto_1310392 ?auto_1310400 ) ) ( not ( = ?auto_1310392 ?auto_1310401 ) ) ( not ( = ?auto_1310392 ?auto_1310402 ) ) ( not ( = ?auto_1310389 ?auto_1310393 ) ) ( not ( = ?auto_1310389 ?auto_1310395 ) ) ( not ( = ?auto_1310389 ?auto_1310394 ) ) ( not ( = ?auto_1310389 ?auto_1310396 ) ) ( not ( = ?auto_1310389 ?auto_1310397 ) ) ( not ( = ?auto_1310389 ?auto_1310398 ) ) ( not ( = ?auto_1310389 ?auto_1310399 ) ) ( not ( = ?auto_1310389 ?auto_1310400 ) ) ( not ( = ?auto_1310389 ?auto_1310401 ) ) ( not ( = ?auto_1310389 ?auto_1310402 ) ) ( not ( = ?auto_1310393 ?auto_1310395 ) ) ( not ( = ?auto_1310393 ?auto_1310394 ) ) ( not ( = ?auto_1310393 ?auto_1310396 ) ) ( not ( = ?auto_1310393 ?auto_1310397 ) ) ( not ( = ?auto_1310393 ?auto_1310398 ) ) ( not ( = ?auto_1310393 ?auto_1310399 ) ) ( not ( = ?auto_1310393 ?auto_1310400 ) ) ( not ( = ?auto_1310393 ?auto_1310401 ) ) ( not ( = ?auto_1310393 ?auto_1310402 ) ) ( not ( = ?auto_1310395 ?auto_1310394 ) ) ( not ( = ?auto_1310395 ?auto_1310396 ) ) ( not ( = ?auto_1310395 ?auto_1310397 ) ) ( not ( = ?auto_1310395 ?auto_1310398 ) ) ( not ( = ?auto_1310395 ?auto_1310399 ) ) ( not ( = ?auto_1310395 ?auto_1310400 ) ) ( not ( = ?auto_1310395 ?auto_1310401 ) ) ( not ( = ?auto_1310395 ?auto_1310402 ) ) ( not ( = ?auto_1310394 ?auto_1310396 ) ) ( not ( = ?auto_1310394 ?auto_1310397 ) ) ( not ( = ?auto_1310394 ?auto_1310398 ) ) ( not ( = ?auto_1310394 ?auto_1310399 ) ) ( not ( = ?auto_1310394 ?auto_1310400 ) ) ( not ( = ?auto_1310394 ?auto_1310401 ) ) ( not ( = ?auto_1310394 ?auto_1310402 ) ) ( not ( = ?auto_1310396 ?auto_1310397 ) ) ( not ( = ?auto_1310396 ?auto_1310398 ) ) ( not ( = ?auto_1310396 ?auto_1310399 ) ) ( not ( = ?auto_1310396 ?auto_1310400 ) ) ( not ( = ?auto_1310396 ?auto_1310401 ) ) ( not ( = ?auto_1310396 ?auto_1310402 ) ) ( not ( = ?auto_1310397 ?auto_1310398 ) ) ( not ( = ?auto_1310397 ?auto_1310399 ) ) ( not ( = ?auto_1310397 ?auto_1310400 ) ) ( not ( = ?auto_1310397 ?auto_1310401 ) ) ( not ( = ?auto_1310397 ?auto_1310402 ) ) ( not ( = ?auto_1310398 ?auto_1310399 ) ) ( not ( = ?auto_1310398 ?auto_1310400 ) ) ( not ( = ?auto_1310398 ?auto_1310401 ) ) ( not ( = ?auto_1310398 ?auto_1310402 ) ) ( not ( = ?auto_1310399 ?auto_1310400 ) ) ( not ( = ?auto_1310399 ?auto_1310401 ) ) ( not ( = ?auto_1310399 ?auto_1310402 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1310400 ?auto_1310401 ?auto_1310402 )
      ( MAKE-13CRATE-VERIFY ?auto_1310390 ?auto_1310391 ?auto_1310392 ?auto_1310389 ?auto_1310393 ?auto_1310395 ?auto_1310394 ?auto_1310396 ?auto_1310397 ?auto_1310398 ?auto_1310399 ?auto_1310400 ?auto_1310401 ?auto_1310402 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1310559 - SURFACE
      ?auto_1310560 - SURFACE
      ?auto_1310561 - SURFACE
      ?auto_1310558 - SURFACE
      ?auto_1310562 - SURFACE
      ?auto_1310564 - SURFACE
      ?auto_1310563 - SURFACE
      ?auto_1310565 - SURFACE
      ?auto_1310566 - SURFACE
      ?auto_1310567 - SURFACE
      ?auto_1310568 - SURFACE
      ?auto_1310569 - SURFACE
      ?auto_1310570 - SURFACE
      ?auto_1310571 - SURFACE
    )
    :vars
    (
      ?auto_1310575 - HOIST
      ?auto_1310573 - PLACE
      ?auto_1310572 - TRUCK
      ?auto_1310576 - PLACE
      ?auto_1310574 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1310575 ?auto_1310573 ) ( SURFACE-AT ?auto_1310570 ?auto_1310573 ) ( CLEAR ?auto_1310570 ) ( IS-CRATE ?auto_1310571 ) ( not ( = ?auto_1310570 ?auto_1310571 ) ) ( AVAILABLE ?auto_1310575 ) ( ON ?auto_1310570 ?auto_1310569 ) ( not ( = ?auto_1310569 ?auto_1310570 ) ) ( not ( = ?auto_1310569 ?auto_1310571 ) ) ( TRUCK-AT ?auto_1310572 ?auto_1310576 ) ( not ( = ?auto_1310576 ?auto_1310573 ) ) ( HOIST-AT ?auto_1310574 ?auto_1310576 ) ( LIFTING ?auto_1310574 ?auto_1310571 ) ( not ( = ?auto_1310575 ?auto_1310574 ) ) ( ON ?auto_1310560 ?auto_1310559 ) ( ON ?auto_1310561 ?auto_1310560 ) ( ON ?auto_1310558 ?auto_1310561 ) ( ON ?auto_1310562 ?auto_1310558 ) ( ON ?auto_1310564 ?auto_1310562 ) ( ON ?auto_1310563 ?auto_1310564 ) ( ON ?auto_1310565 ?auto_1310563 ) ( ON ?auto_1310566 ?auto_1310565 ) ( ON ?auto_1310567 ?auto_1310566 ) ( ON ?auto_1310568 ?auto_1310567 ) ( ON ?auto_1310569 ?auto_1310568 ) ( not ( = ?auto_1310559 ?auto_1310560 ) ) ( not ( = ?auto_1310559 ?auto_1310561 ) ) ( not ( = ?auto_1310559 ?auto_1310558 ) ) ( not ( = ?auto_1310559 ?auto_1310562 ) ) ( not ( = ?auto_1310559 ?auto_1310564 ) ) ( not ( = ?auto_1310559 ?auto_1310563 ) ) ( not ( = ?auto_1310559 ?auto_1310565 ) ) ( not ( = ?auto_1310559 ?auto_1310566 ) ) ( not ( = ?auto_1310559 ?auto_1310567 ) ) ( not ( = ?auto_1310559 ?auto_1310568 ) ) ( not ( = ?auto_1310559 ?auto_1310569 ) ) ( not ( = ?auto_1310559 ?auto_1310570 ) ) ( not ( = ?auto_1310559 ?auto_1310571 ) ) ( not ( = ?auto_1310560 ?auto_1310561 ) ) ( not ( = ?auto_1310560 ?auto_1310558 ) ) ( not ( = ?auto_1310560 ?auto_1310562 ) ) ( not ( = ?auto_1310560 ?auto_1310564 ) ) ( not ( = ?auto_1310560 ?auto_1310563 ) ) ( not ( = ?auto_1310560 ?auto_1310565 ) ) ( not ( = ?auto_1310560 ?auto_1310566 ) ) ( not ( = ?auto_1310560 ?auto_1310567 ) ) ( not ( = ?auto_1310560 ?auto_1310568 ) ) ( not ( = ?auto_1310560 ?auto_1310569 ) ) ( not ( = ?auto_1310560 ?auto_1310570 ) ) ( not ( = ?auto_1310560 ?auto_1310571 ) ) ( not ( = ?auto_1310561 ?auto_1310558 ) ) ( not ( = ?auto_1310561 ?auto_1310562 ) ) ( not ( = ?auto_1310561 ?auto_1310564 ) ) ( not ( = ?auto_1310561 ?auto_1310563 ) ) ( not ( = ?auto_1310561 ?auto_1310565 ) ) ( not ( = ?auto_1310561 ?auto_1310566 ) ) ( not ( = ?auto_1310561 ?auto_1310567 ) ) ( not ( = ?auto_1310561 ?auto_1310568 ) ) ( not ( = ?auto_1310561 ?auto_1310569 ) ) ( not ( = ?auto_1310561 ?auto_1310570 ) ) ( not ( = ?auto_1310561 ?auto_1310571 ) ) ( not ( = ?auto_1310558 ?auto_1310562 ) ) ( not ( = ?auto_1310558 ?auto_1310564 ) ) ( not ( = ?auto_1310558 ?auto_1310563 ) ) ( not ( = ?auto_1310558 ?auto_1310565 ) ) ( not ( = ?auto_1310558 ?auto_1310566 ) ) ( not ( = ?auto_1310558 ?auto_1310567 ) ) ( not ( = ?auto_1310558 ?auto_1310568 ) ) ( not ( = ?auto_1310558 ?auto_1310569 ) ) ( not ( = ?auto_1310558 ?auto_1310570 ) ) ( not ( = ?auto_1310558 ?auto_1310571 ) ) ( not ( = ?auto_1310562 ?auto_1310564 ) ) ( not ( = ?auto_1310562 ?auto_1310563 ) ) ( not ( = ?auto_1310562 ?auto_1310565 ) ) ( not ( = ?auto_1310562 ?auto_1310566 ) ) ( not ( = ?auto_1310562 ?auto_1310567 ) ) ( not ( = ?auto_1310562 ?auto_1310568 ) ) ( not ( = ?auto_1310562 ?auto_1310569 ) ) ( not ( = ?auto_1310562 ?auto_1310570 ) ) ( not ( = ?auto_1310562 ?auto_1310571 ) ) ( not ( = ?auto_1310564 ?auto_1310563 ) ) ( not ( = ?auto_1310564 ?auto_1310565 ) ) ( not ( = ?auto_1310564 ?auto_1310566 ) ) ( not ( = ?auto_1310564 ?auto_1310567 ) ) ( not ( = ?auto_1310564 ?auto_1310568 ) ) ( not ( = ?auto_1310564 ?auto_1310569 ) ) ( not ( = ?auto_1310564 ?auto_1310570 ) ) ( not ( = ?auto_1310564 ?auto_1310571 ) ) ( not ( = ?auto_1310563 ?auto_1310565 ) ) ( not ( = ?auto_1310563 ?auto_1310566 ) ) ( not ( = ?auto_1310563 ?auto_1310567 ) ) ( not ( = ?auto_1310563 ?auto_1310568 ) ) ( not ( = ?auto_1310563 ?auto_1310569 ) ) ( not ( = ?auto_1310563 ?auto_1310570 ) ) ( not ( = ?auto_1310563 ?auto_1310571 ) ) ( not ( = ?auto_1310565 ?auto_1310566 ) ) ( not ( = ?auto_1310565 ?auto_1310567 ) ) ( not ( = ?auto_1310565 ?auto_1310568 ) ) ( not ( = ?auto_1310565 ?auto_1310569 ) ) ( not ( = ?auto_1310565 ?auto_1310570 ) ) ( not ( = ?auto_1310565 ?auto_1310571 ) ) ( not ( = ?auto_1310566 ?auto_1310567 ) ) ( not ( = ?auto_1310566 ?auto_1310568 ) ) ( not ( = ?auto_1310566 ?auto_1310569 ) ) ( not ( = ?auto_1310566 ?auto_1310570 ) ) ( not ( = ?auto_1310566 ?auto_1310571 ) ) ( not ( = ?auto_1310567 ?auto_1310568 ) ) ( not ( = ?auto_1310567 ?auto_1310569 ) ) ( not ( = ?auto_1310567 ?auto_1310570 ) ) ( not ( = ?auto_1310567 ?auto_1310571 ) ) ( not ( = ?auto_1310568 ?auto_1310569 ) ) ( not ( = ?auto_1310568 ?auto_1310570 ) ) ( not ( = ?auto_1310568 ?auto_1310571 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1310569 ?auto_1310570 ?auto_1310571 )
      ( MAKE-13CRATE-VERIFY ?auto_1310559 ?auto_1310560 ?auto_1310561 ?auto_1310558 ?auto_1310562 ?auto_1310564 ?auto_1310563 ?auto_1310565 ?auto_1310566 ?auto_1310567 ?auto_1310568 ?auto_1310569 ?auto_1310570 ?auto_1310571 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1310741 - SURFACE
      ?auto_1310742 - SURFACE
      ?auto_1310743 - SURFACE
      ?auto_1310740 - SURFACE
      ?auto_1310744 - SURFACE
      ?auto_1310746 - SURFACE
      ?auto_1310745 - SURFACE
      ?auto_1310747 - SURFACE
      ?auto_1310748 - SURFACE
      ?auto_1310749 - SURFACE
      ?auto_1310750 - SURFACE
      ?auto_1310751 - SURFACE
      ?auto_1310752 - SURFACE
      ?auto_1310753 - SURFACE
    )
    :vars
    (
      ?auto_1310759 - HOIST
      ?auto_1310754 - PLACE
      ?auto_1310755 - TRUCK
      ?auto_1310758 - PLACE
      ?auto_1310757 - HOIST
      ?auto_1310756 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1310759 ?auto_1310754 ) ( SURFACE-AT ?auto_1310752 ?auto_1310754 ) ( CLEAR ?auto_1310752 ) ( IS-CRATE ?auto_1310753 ) ( not ( = ?auto_1310752 ?auto_1310753 ) ) ( AVAILABLE ?auto_1310759 ) ( ON ?auto_1310752 ?auto_1310751 ) ( not ( = ?auto_1310751 ?auto_1310752 ) ) ( not ( = ?auto_1310751 ?auto_1310753 ) ) ( TRUCK-AT ?auto_1310755 ?auto_1310758 ) ( not ( = ?auto_1310758 ?auto_1310754 ) ) ( HOIST-AT ?auto_1310757 ?auto_1310758 ) ( not ( = ?auto_1310759 ?auto_1310757 ) ) ( AVAILABLE ?auto_1310757 ) ( SURFACE-AT ?auto_1310753 ?auto_1310758 ) ( ON ?auto_1310753 ?auto_1310756 ) ( CLEAR ?auto_1310753 ) ( not ( = ?auto_1310752 ?auto_1310756 ) ) ( not ( = ?auto_1310753 ?auto_1310756 ) ) ( not ( = ?auto_1310751 ?auto_1310756 ) ) ( ON ?auto_1310742 ?auto_1310741 ) ( ON ?auto_1310743 ?auto_1310742 ) ( ON ?auto_1310740 ?auto_1310743 ) ( ON ?auto_1310744 ?auto_1310740 ) ( ON ?auto_1310746 ?auto_1310744 ) ( ON ?auto_1310745 ?auto_1310746 ) ( ON ?auto_1310747 ?auto_1310745 ) ( ON ?auto_1310748 ?auto_1310747 ) ( ON ?auto_1310749 ?auto_1310748 ) ( ON ?auto_1310750 ?auto_1310749 ) ( ON ?auto_1310751 ?auto_1310750 ) ( not ( = ?auto_1310741 ?auto_1310742 ) ) ( not ( = ?auto_1310741 ?auto_1310743 ) ) ( not ( = ?auto_1310741 ?auto_1310740 ) ) ( not ( = ?auto_1310741 ?auto_1310744 ) ) ( not ( = ?auto_1310741 ?auto_1310746 ) ) ( not ( = ?auto_1310741 ?auto_1310745 ) ) ( not ( = ?auto_1310741 ?auto_1310747 ) ) ( not ( = ?auto_1310741 ?auto_1310748 ) ) ( not ( = ?auto_1310741 ?auto_1310749 ) ) ( not ( = ?auto_1310741 ?auto_1310750 ) ) ( not ( = ?auto_1310741 ?auto_1310751 ) ) ( not ( = ?auto_1310741 ?auto_1310752 ) ) ( not ( = ?auto_1310741 ?auto_1310753 ) ) ( not ( = ?auto_1310741 ?auto_1310756 ) ) ( not ( = ?auto_1310742 ?auto_1310743 ) ) ( not ( = ?auto_1310742 ?auto_1310740 ) ) ( not ( = ?auto_1310742 ?auto_1310744 ) ) ( not ( = ?auto_1310742 ?auto_1310746 ) ) ( not ( = ?auto_1310742 ?auto_1310745 ) ) ( not ( = ?auto_1310742 ?auto_1310747 ) ) ( not ( = ?auto_1310742 ?auto_1310748 ) ) ( not ( = ?auto_1310742 ?auto_1310749 ) ) ( not ( = ?auto_1310742 ?auto_1310750 ) ) ( not ( = ?auto_1310742 ?auto_1310751 ) ) ( not ( = ?auto_1310742 ?auto_1310752 ) ) ( not ( = ?auto_1310742 ?auto_1310753 ) ) ( not ( = ?auto_1310742 ?auto_1310756 ) ) ( not ( = ?auto_1310743 ?auto_1310740 ) ) ( not ( = ?auto_1310743 ?auto_1310744 ) ) ( not ( = ?auto_1310743 ?auto_1310746 ) ) ( not ( = ?auto_1310743 ?auto_1310745 ) ) ( not ( = ?auto_1310743 ?auto_1310747 ) ) ( not ( = ?auto_1310743 ?auto_1310748 ) ) ( not ( = ?auto_1310743 ?auto_1310749 ) ) ( not ( = ?auto_1310743 ?auto_1310750 ) ) ( not ( = ?auto_1310743 ?auto_1310751 ) ) ( not ( = ?auto_1310743 ?auto_1310752 ) ) ( not ( = ?auto_1310743 ?auto_1310753 ) ) ( not ( = ?auto_1310743 ?auto_1310756 ) ) ( not ( = ?auto_1310740 ?auto_1310744 ) ) ( not ( = ?auto_1310740 ?auto_1310746 ) ) ( not ( = ?auto_1310740 ?auto_1310745 ) ) ( not ( = ?auto_1310740 ?auto_1310747 ) ) ( not ( = ?auto_1310740 ?auto_1310748 ) ) ( not ( = ?auto_1310740 ?auto_1310749 ) ) ( not ( = ?auto_1310740 ?auto_1310750 ) ) ( not ( = ?auto_1310740 ?auto_1310751 ) ) ( not ( = ?auto_1310740 ?auto_1310752 ) ) ( not ( = ?auto_1310740 ?auto_1310753 ) ) ( not ( = ?auto_1310740 ?auto_1310756 ) ) ( not ( = ?auto_1310744 ?auto_1310746 ) ) ( not ( = ?auto_1310744 ?auto_1310745 ) ) ( not ( = ?auto_1310744 ?auto_1310747 ) ) ( not ( = ?auto_1310744 ?auto_1310748 ) ) ( not ( = ?auto_1310744 ?auto_1310749 ) ) ( not ( = ?auto_1310744 ?auto_1310750 ) ) ( not ( = ?auto_1310744 ?auto_1310751 ) ) ( not ( = ?auto_1310744 ?auto_1310752 ) ) ( not ( = ?auto_1310744 ?auto_1310753 ) ) ( not ( = ?auto_1310744 ?auto_1310756 ) ) ( not ( = ?auto_1310746 ?auto_1310745 ) ) ( not ( = ?auto_1310746 ?auto_1310747 ) ) ( not ( = ?auto_1310746 ?auto_1310748 ) ) ( not ( = ?auto_1310746 ?auto_1310749 ) ) ( not ( = ?auto_1310746 ?auto_1310750 ) ) ( not ( = ?auto_1310746 ?auto_1310751 ) ) ( not ( = ?auto_1310746 ?auto_1310752 ) ) ( not ( = ?auto_1310746 ?auto_1310753 ) ) ( not ( = ?auto_1310746 ?auto_1310756 ) ) ( not ( = ?auto_1310745 ?auto_1310747 ) ) ( not ( = ?auto_1310745 ?auto_1310748 ) ) ( not ( = ?auto_1310745 ?auto_1310749 ) ) ( not ( = ?auto_1310745 ?auto_1310750 ) ) ( not ( = ?auto_1310745 ?auto_1310751 ) ) ( not ( = ?auto_1310745 ?auto_1310752 ) ) ( not ( = ?auto_1310745 ?auto_1310753 ) ) ( not ( = ?auto_1310745 ?auto_1310756 ) ) ( not ( = ?auto_1310747 ?auto_1310748 ) ) ( not ( = ?auto_1310747 ?auto_1310749 ) ) ( not ( = ?auto_1310747 ?auto_1310750 ) ) ( not ( = ?auto_1310747 ?auto_1310751 ) ) ( not ( = ?auto_1310747 ?auto_1310752 ) ) ( not ( = ?auto_1310747 ?auto_1310753 ) ) ( not ( = ?auto_1310747 ?auto_1310756 ) ) ( not ( = ?auto_1310748 ?auto_1310749 ) ) ( not ( = ?auto_1310748 ?auto_1310750 ) ) ( not ( = ?auto_1310748 ?auto_1310751 ) ) ( not ( = ?auto_1310748 ?auto_1310752 ) ) ( not ( = ?auto_1310748 ?auto_1310753 ) ) ( not ( = ?auto_1310748 ?auto_1310756 ) ) ( not ( = ?auto_1310749 ?auto_1310750 ) ) ( not ( = ?auto_1310749 ?auto_1310751 ) ) ( not ( = ?auto_1310749 ?auto_1310752 ) ) ( not ( = ?auto_1310749 ?auto_1310753 ) ) ( not ( = ?auto_1310749 ?auto_1310756 ) ) ( not ( = ?auto_1310750 ?auto_1310751 ) ) ( not ( = ?auto_1310750 ?auto_1310752 ) ) ( not ( = ?auto_1310750 ?auto_1310753 ) ) ( not ( = ?auto_1310750 ?auto_1310756 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1310751 ?auto_1310752 ?auto_1310753 )
      ( MAKE-13CRATE-VERIFY ?auto_1310741 ?auto_1310742 ?auto_1310743 ?auto_1310740 ?auto_1310744 ?auto_1310746 ?auto_1310745 ?auto_1310747 ?auto_1310748 ?auto_1310749 ?auto_1310750 ?auto_1310751 ?auto_1310752 ?auto_1310753 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1310924 - SURFACE
      ?auto_1310925 - SURFACE
      ?auto_1310926 - SURFACE
      ?auto_1310923 - SURFACE
      ?auto_1310927 - SURFACE
      ?auto_1310929 - SURFACE
      ?auto_1310928 - SURFACE
      ?auto_1310930 - SURFACE
      ?auto_1310931 - SURFACE
      ?auto_1310932 - SURFACE
      ?auto_1310933 - SURFACE
      ?auto_1310934 - SURFACE
      ?auto_1310935 - SURFACE
      ?auto_1310936 - SURFACE
    )
    :vars
    (
      ?auto_1310938 - HOIST
      ?auto_1310942 - PLACE
      ?auto_1310939 - PLACE
      ?auto_1310941 - HOIST
      ?auto_1310937 - SURFACE
      ?auto_1310940 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1310938 ?auto_1310942 ) ( SURFACE-AT ?auto_1310935 ?auto_1310942 ) ( CLEAR ?auto_1310935 ) ( IS-CRATE ?auto_1310936 ) ( not ( = ?auto_1310935 ?auto_1310936 ) ) ( AVAILABLE ?auto_1310938 ) ( ON ?auto_1310935 ?auto_1310934 ) ( not ( = ?auto_1310934 ?auto_1310935 ) ) ( not ( = ?auto_1310934 ?auto_1310936 ) ) ( not ( = ?auto_1310939 ?auto_1310942 ) ) ( HOIST-AT ?auto_1310941 ?auto_1310939 ) ( not ( = ?auto_1310938 ?auto_1310941 ) ) ( AVAILABLE ?auto_1310941 ) ( SURFACE-AT ?auto_1310936 ?auto_1310939 ) ( ON ?auto_1310936 ?auto_1310937 ) ( CLEAR ?auto_1310936 ) ( not ( = ?auto_1310935 ?auto_1310937 ) ) ( not ( = ?auto_1310936 ?auto_1310937 ) ) ( not ( = ?auto_1310934 ?auto_1310937 ) ) ( TRUCK-AT ?auto_1310940 ?auto_1310942 ) ( ON ?auto_1310925 ?auto_1310924 ) ( ON ?auto_1310926 ?auto_1310925 ) ( ON ?auto_1310923 ?auto_1310926 ) ( ON ?auto_1310927 ?auto_1310923 ) ( ON ?auto_1310929 ?auto_1310927 ) ( ON ?auto_1310928 ?auto_1310929 ) ( ON ?auto_1310930 ?auto_1310928 ) ( ON ?auto_1310931 ?auto_1310930 ) ( ON ?auto_1310932 ?auto_1310931 ) ( ON ?auto_1310933 ?auto_1310932 ) ( ON ?auto_1310934 ?auto_1310933 ) ( not ( = ?auto_1310924 ?auto_1310925 ) ) ( not ( = ?auto_1310924 ?auto_1310926 ) ) ( not ( = ?auto_1310924 ?auto_1310923 ) ) ( not ( = ?auto_1310924 ?auto_1310927 ) ) ( not ( = ?auto_1310924 ?auto_1310929 ) ) ( not ( = ?auto_1310924 ?auto_1310928 ) ) ( not ( = ?auto_1310924 ?auto_1310930 ) ) ( not ( = ?auto_1310924 ?auto_1310931 ) ) ( not ( = ?auto_1310924 ?auto_1310932 ) ) ( not ( = ?auto_1310924 ?auto_1310933 ) ) ( not ( = ?auto_1310924 ?auto_1310934 ) ) ( not ( = ?auto_1310924 ?auto_1310935 ) ) ( not ( = ?auto_1310924 ?auto_1310936 ) ) ( not ( = ?auto_1310924 ?auto_1310937 ) ) ( not ( = ?auto_1310925 ?auto_1310926 ) ) ( not ( = ?auto_1310925 ?auto_1310923 ) ) ( not ( = ?auto_1310925 ?auto_1310927 ) ) ( not ( = ?auto_1310925 ?auto_1310929 ) ) ( not ( = ?auto_1310925 ?auto_1310928 ) ) ( not ( = ?auto_1310925 ?auto_1310930 ) ) ( not ( = ?auto_1310925 ?auto_1310931 ) ) ( not ( = ?auto_1310925 ?auto_1310932 ) ) ( not ( = ?auto_1310925 ?auto_1310933 ) ) ( not ( = ?auto_1310925 ?auto_1310934 ) ) ( not ( = ?auto_1310925 ?auto_1310935 ) ) ( not ( = ?auto_1310925 ?auto_1310936 ) ) ( not ( = ?auto_1310925 ?auto_1310937 ) ) ( not ( = ?auto_1310926 ?auto_1310923 ) ) ( not ( = ?auto_1310926 ?auto_1310927 ) ) ( not ( = ?auto_1310926 ?auto_1310929 ) ) ( not ( = ?auto_1310926 ?auto_1310928 ) ) ( not ( = ?auto_1310926 ?auto_1310930 ) ) ( not ( = ?auto_1310926 ?auto_1310931 ) ) ( not ( = ?auto_1310926 ?auto_1310932 ) ) ( not ( = ?auto_1310926 ?auto_1310933 ) ) ( not ( = ?auto_1310926 ?auto_1310934 ) ) ( not ( = ?auto_1310926 ?auto_1310935 ) ) ( not ( = ?auto_1310926 ?auto_1310936 ) ) ( not ( = ?auto_1310926 ?auto_1310937 ) ) ( not ( = ?auto_1310923 ?auto_1310927 ) ) ( not ( = ?auto_1310923 ?auto_1310929 ) ) ( not ( = ?auto_1310923 ?auto_1310928 ) ) ( not ( = ?auto_1310923 ?auto_1310930 ) ) ( not ( = ?auto_1310923 ?auto_1310931 ) ) ( not ( = ?auto_1310923 ?auto_1310932 ) ) ( not ( = ?auto_1310923 ?auto_1310933 ) ) ( not ( = ?auto_1310923 ?auto_1310934 ) ) ( not ( = ?auto_1310923 ?auto_1310935 ) ) ( not ( = ?auto_1310923 ?auto_1310936 ) ) ( not ( = ?auto_1310923 ?auto_1310937 ) ) ( not ( = ?auto_1310927 ?auto_1310929 ) ) ( not ( = ?auto_1310927 ?auto_1310928 ) ) ( not ( = ?auto_1310927 ?auto_1310930 ) ) ( not ( = ?auto_1310927 ?auto_1310931 ) ) ( not ( = ?auto_1310927 ?auto_1310932 ) ) ( not ( = ?auto_1310927 ?auto_1310933 ) ) ( not ( = ?auto_1310927 ?auto_1310934 ) ) ( not ( = ?auto_1310927 ?auto_1310935 ) ) ( not ( = ?auto_1310927 ?auto_1310936 ) ) ( not ( = ?auto_1310927 ?auto_1310937 ) ) ( not ( = ?auto_1310929 ?auto_1310928 ) ) ( not ( = ?auto_1310929 ?auto_1310930 ) ) ( not ( = ?auto_1310929 ?auto_1310931 ) ) ( not ( = ?auto_1310929 ?auto_1310932 ) ) ( not ( = ?auto_1310929 ?auto_1310933 ) ) ( not ( = ?auto_1310929 ?auto_1310934 ) ) ( not ( = ?auto_1310929 ?auto_1310935 ) ) ( not ( = ?auto_1310929 ?auto_1310936 ) ) ( not ( = ?auto_1310929 ?auto_1310937 ) ) ( not ( = ?auto_1310928 ?auto_1310930 ) ) ( not ( = ?auto_1310928 ?auto_1310931 ) ) ( not ( = ?auto_1310928 ?auto_1310932 ) ) ( not ( = ?auto_1310928 ?auto_1310933 ) ) ( not ( = ?auto_1310928 ?auto_1310934 ) ) ( not ( = ?auto_1310928 ?auto_1310935 ) ) ( not ( = ?auto_1310928 ?auto_1310936 ) ) ( not ( = ?auto_1310928 ?auto_1310937 ) ) ( not ( = ?auto_1310930 ?auto_1310931 ) ) ( not ( = ?auto_1310930 ?auto_1310932 ) ) ( not ( = ?auto_1310930 ?auto_1310933 ) ) ( not ( = ?auto_1310930 ?auto_1310934 ) ) ( not ( = ?auto_1310930 ?auto_1310935 ) ) ( not ( = ?auto_1310930 ?auto_1310936 ) ) ( not ( = ?auto_1310930 ?auto_1310937 ) ) ( not ( = ?auto_1310931 ?auto_1310932 ) ) ( not ( = ?auto_1310931 ?auto_1310933 ) ) ( not ( = ?auto_1310931 ?auto_1310934 ) ) ( not ( = ?auto_1310931 ?auto_1310935 ) ) ( not ( = ?auto_1310931 ?auto_1310936 ) ) ( not ( = ?auto_1310931 ?auto_1310937 ) ) ( not ( = ?auto_1310932 ?auto_1310933 ) ) ( not ( = ?auto_1310932 ?auto_1310934 ) ) ( not ( = ?auto_1310932 ?auto_1310935 ) ) ( not ( = ?auto_1310932 ?auto_1310936 ) ) ( not ( = ?auto_1310932 ?auto_1310937 ) ) ( not ( = ?auto_1310933 ?auto_1310934 ) ) ( not ( = ?auto_1310933 ?auto_1310935 ) ) ( not ( = ?auto_1310933 ?auto_1310936 ) ) ( not ( = ?auto_1310933 ?auto_1310937 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1310934 ?auto_1310935 ?auto_1310936 )
      ( MAKE-13CRATE-VERIFY ?auto_1310924 ?auto_1310925 ?auto_1310926 ?auto_1310923 ?auto_1310927 ?auto_1310929 ?auto_1310928 ?auto_1310930 ?auto_1310931 ?auto_1310932 ?auto_1310933 ?auto_1310934 ?auto_1310935 ?auto_1310936 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1311107 - SURFACE
      ?auto_1311108 - SURFACE
      ?auto_1311109 - SURFACE
      ?auto_1311106 - SURFACE
      ?auto_1311110 - SURFACE
      ?auto_1311112 - SURFACE
      ?auto_1311111 - SURFACE
      ?auto_1311113 - SURFACE
      ?auto_1311114 - SURFACE
      ?auto_1311115 - SURFACE
      ?auto_1311116 - SURFACE
      ?auto_1311117 - SURFACE
      ?auto_1311118 - SURFACE
      ?auto_1311119 - SURFACE
    )
    :vars
    (
      ?auto_1311121 - HOIST
      ?auto_1311122 - PLACE
      ?auto_1311124 - PLACE
      ?auto_1311123 - HOIST
      ?auto_1311125 - SURFACE
      ?auto_1311120 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1311121 ?auto_1311122 ) ( IS-CRATE ?auto_1311119 ) ( not ( = ?auto_1311118 ?auto_1311119 ) ) ( not ( = ?auto_1311117 ?auto_1311118 ) ) ( not ( = ?auto_1311117 ?auto_1311119 ) ) ( not ( = ?auto_1311124 ?auto_1311122 ) ) ( HOIST-AT ?auto_1311123 ?auto_1311124 ) ( not ( = ?auto_1311121 ?auto_1311123 ) ) ( AVAILABLE ?auto_1311123 ) ( SURFACE-AT ?auto_1311119 ?auto_1311124 ) ( ON ?auto_1311119 ?auto_1311125 ) ( CLEAR ?auto_1311119 ) ( not ( = ?auto_1311118 ?auto_1311125 ) ) ( not ( = ?auto_1311119 ?auto_1311125 ) ) ( not ( = ?auto_1311117 ?auto_1311125 ) ) ( TRUCK-AT ?auto_1311120 ?auto_1311122 ) ( SURFACE-AT ?auto_1311117 ?auto_1311122 ) ( CLEAR ?auto_1311117 ) ( LIFTING ?auto_1311121 ?auto_1311118 ) ( IS-CRATE ?auto_1311118 ) ( ON ?auto_1311108 ?auto_1311107 ) ( ON ?auto_1311109 ?auto_1311108 ) ( ON ?auto_1311106 ?auto_1311109 ) ( ON ?auto_1311110 ?auto_1311106 ) ( ON ?auto_1311112 ?auto_1311110 ) ( ON ?auto_1311111 ?auto_1311112 ) ( ON ?auto_1311113 ?auto_1311111 ) ( ON ?auto_1311114 ?auto_1311113 ) ( ON ?auto_1311115 ?auto_1311114 ) ( ON ?auto_1311116 ?auto_1311115 ) ( ON ?auto_1311117 ?auto_1311116 ) ( not ( = ?auto_1311107 ?auto_1311108 ) ) ( not ( = ?auto_1311107 ?auto_1311109 ) ) ( not ( = ?auto_1311107 ?auto_1311106 ) ) ( not ( = ?auto_1311107 ?auto_1311110 ) ) ( not ( = ?auto_1311107 ?auto_1311112 ) ) ( not ( = ?auto_1311107 ?auto_1311111 ) ) ( not ( = ?auto_1311107 ?auto_1311113 ) ) ( not ( = ?auto_1311107 ?auto_1311114 ) ) ( not ( = ?auto_1311107 ?auto_1311115 ) ) ( not ( = ?auto_1311107 ?auto_1311116 ) ) ( not ( = ?auto_1311107 ?auto_1311117 ) ) ( not ( = ?auto_1311107 ?auto_1311118 ) ) ( not ( = ?auto_1311107 ?auto_1311119 ) ) ( not ( = ?auto_1311107 ?auto_1311125 ) ) ( not ( = ?auto_1311108 ?auto_1311109 ) ) ( not ( = ?auto_1311108 ?auto_1311106 ) ) ( not ( = ?auto_1311108 ?auto_1311110 ) ) ( not ( = ?auto_1311108 ?auto_1311112 ) ) ( not ( = ?auto_1311108 ?auto_1311111 ) ) ( not ( = ?auto_1311108 ?auto_1311113 ) ) ( not ( = ?auto_1311108 ?auto_1311114 ) ) ( not ( = ?auto_1311108 ?auto_1311115 ) ) ( not ( = ?auto_1311108 ?auto_1311116 ) ) ( not ( = ?auto_1311108 ?auto_1311117 ) ) ( not ( = ?auto_1311108 ?auto_1311118 ) ) ( not ( = ?auto_1311108 ?auto_1311119 ) ) ( not ( = ?auto_1311108 ?auto_1311125 ) ) ( not ( = ?auto_1311109 ?auto_1311106 ) ) ( not ( = ?auto_1311109 ?auto_1311110 ) ) ( not ( = ?auto_1311109 ?auto_1311112 ) ) ( not ( = ?auto_1311109 ?auto_1311111 ) ) ( not ( = ?auto_1311109 ?auto_1311113 ) ) ( not ( = ?auto_1311109 ?auto_1311114 ) ) ( not ( = ?auto_1311109 ?auto_1311115 ) ) ( not ( = ?auto_1311109 ?auto_1311116 ) ) ( not ( = ?auto_1311109 ?auto_1311117 ) ) ( not ( = ?auto_1311109 ?auto_1311118 ) ) ( not ( = ?auto_1311109 ?auto_1311119 ) ) ( not ( = ?auto_1311109 ?auto_1311125 ) ) ( not ( = ?auto_1311106 ?auto_1311110 ) ) ( not ( = ?auto_1311106 ?auto_1311112 ) ) ( not ( = ?auto_1311106 ?auto_1311111 ) ) ( not ( = ?auto_1311106 ?auto_1311113 ) ) ( not ( = ?auto_1311106 ?auto_1311114 ) ) ( not ( = ?auto_1311106 ?auto_1311115 ) ) ( not ( = ?auto_1311106 ?auto_1311116 ) ) ( not ( = ?auto_1311106 ?auto_1311117 ) ) ( not ( = ?auto_1311106 ?auto_1311118 ) ) ( not ( = ?auto_1311106 ?auto_1311119 ) ) ( not ( = ?auto_1311106 ?auto_1311125 ) ) ( not ( = ?auto_1311110 ?auto_1311112 ) ) ( not ( = ?auto_1311110 ?auto_1311111 ) ) ( not ( = ?auto_1311110 ?auto_1311113 ) ) ( not ( = ?auto_1311110 ?auto_1311114 ) ) ( not ( = ?auto_1311110 ?auto_1311115 ) ) ( not ( = ?auto_1311110 ?auto_1311116 ) ) ( not ( = ?auto_1311110 ?auto_1311117 ) ) ( not ( = ?auto_1311110 ?auto_1311118 ) ) ( not ( = ?auto_1311110 ?auto_1311119 ) ) ( not ( = ?auto_1311110 ?auto_1311125 ) ) ( not ( = ?auto_1311112 ?auto_1311111 ) ) ( not ( = ?auto_1311112 ?auto_1311113 ) ) ( not ( = ?auto_1311112 ?auto_1311114 ) ) ( not ( = ?auto_1311112 ?auto_1311115 ) ) ( not ( = ?auto_1311112 ?auto_1311116 ) ) ( not ( = ?auto_1311112 ?auto_1311117 ) ) ( not ( = ?auto_1311112 ?auto_1311118 ) ) ( not ( = ?auto_1311112 ?auto_1311119 ) ) ( not ( = ?auto_1311112 ?auto_1311125 ) ) ( not ( = ?auto_1311111 ?auto_1311113 ) ) ( not ( = ?auto_1311111 ?auto_1311114 ) ) ( not ( = ?auto_1311111 ?auto_1311115 ) ) ( not ( = ?auto_1311111 ?auto_1311116 ) ) ( not ( = ?auto_1311111 ?auto_1311117 ) ) ( not ( = ?auto_1311111 ?auto_1311118 ) ) ( not ( = ?auto_1311111 ?auto_1311119 ) ) ( not ( = ?auto_1311111 ?auto_1311125 ) ) ( not ( = ?auto_1311113 ?auto_1311114 ) ) ( not ( = ?auto_1311113 ?auto_1311115 ) ) ( not ( = ?auto_1311113 ?auto_1311116 ) ) ( not ( = ?auto_1311113 ?auto_1311117 ) ) ( not ( = ?auto_1311113 ?auto_1311118 ) ) ( not ( = ?auto_1311113 ?auto_1311119 ) ) ( not ( = ?auto_1311113 ?auto_1311125 ) ) ( not ( = ?auto_1311114 ?auto_1311115 ) ) ( not ( = ?auto_1311114 ?auto_1311116 ) ) ( not ( = ?auto_1311114 ?auto_1311117 ) ) ( not ( = ?auto_1311114 ?auto_1311118 ) ) ( not ( = ?auto_1311114 ?auto_1311119 ) ) ( not ( = ?auto_1311114 ?auto_1311125 ) ) ( not ( = ?auto_1311115 ?auto_1311116 ) ) ( not ( = ?auto_1311115 ?auto_1311117 ) ) ( not ( = ?auto_1311115 ?auto_1311118 ) ) ( not ( = ?auto_1311115 ?auto_1311119 ) ) ( not ( = ?auto_1311115 ?auto_1311125 ) ) ( not ( = ?auto_1311116 ?auto_1311117 ) ) ( not ( = ?auto_1311116 ?auto_1311118 ) ) ( not ( = ?auto_1311116 ?auto_1311119 ) ) ( not ( = ?auto_1311116 ?auto_1311125 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1311117 ?auto_1311118 ?auto_1311119 )
      ( MAKE-13CRATE-VERIFY ?auto_1311107 ?auto_1311108 ?auto_1311109 ?auto_1311106 ?auto_1311110 ?auto_1311112 ?auto_1311111 ?auto_1311113 ?auto_1311114 ?auto_1311115 ?auto_1311116 ?auto_1311117 ?auto_1311118 ?auto_1311119 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1311290 - SURFACE
      ?auto_1311291 - SURFACE
      ?auto_1311292 - SURFACE
      ?auto_1311289 - SURFACE
      ?auto_1311293 - SURFACE
      ?auto_1311295 - SURFACE
      ?auto_1311294 - SURFACE
      ?auto_1311296 - SURFACE
      ?auto_1311297 - SURFACE
      ?auto_1311298 - SURFACE
      ?auto_1311299 - SURFACE
      ?auto_1311300 - SURFACE
      ?auto_1311301 - SURFACE
      ?auto_1311302 - SURFACE
    )
    :vars
    (
      ?auto_1311303 - HOIST
      ?auto_1311306 - PLACE
      ?auto_1311307 - PLACE
      ?auto_1311305 - HOIST
      ?auto_1311308 - SURFACE
      ?auto_1311304 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1311303 ?auto_1311306 ) ( IS-CRATE ?auto_1311302 ) ( not ( = ?auto_1311301 ?auto_1311302 ) ) ( not ( = ?auto_1311300 ?auto_1311301 ) ) ( not ( = ?auto_1311300 ?auto_1311302 ) ) ( not ( = ?auto_1311307 ?auto_1311306 ) ) ( HOIST-AT ?auto_1311305 ?auto_1311307 ) ( not ( = ?auto_1311303 ?auto_1311305 ) ) ( AVAILABLE ?auto_1311305 ) ( SURFACE-AT ?auto_1311302 ?auto_1311307 ) ( ON ?auto_1311302 ?auto_1311308 ) ( CLEAR ?auto_1311302 ) ( not ( = ?auto_1311301 ?auto_1311308 ) ) ( not ( = ?auto_1311302 ?auto_1311308 ) ) ( not ( = ?auto_1311300 ?auto_1311308 ) ) ( TRUCK-AT ?auto_1311304 ?auto_1311306 ) ( SURFACE-AT ?auto_1311300 ?auto_1311306 ) ( CLEAR ?auto_1311300 ) ( IS-CRATE ?auto_1311301 ) ( AVAILABLE ?auto_1311303 ) ( IN ?auto_1311301 ?auto_1311304 ) ( ON ?auto_1311291 ?auto_1311290 ) ( ON ?auto_1311292 ?auto_1311291 ) ( ON ?auto_1311289 ?auto_1311292 ) ( ON ?auto_1311293 ?auto_1311289 ) ( ON ?auto_1311295 ?auto_1311293 ) ( ON ?auto_1311294 ?auto_1311295 ) ( ON ?auto_1311296 ?auto_1311294 ) ( ON ?auto_1311297 ?auto_1311296 ) ( ON ?auto_1311298 ?auto_1311297 ) ( ON ?auto_1311299 ?auto_1311298 ) ( ON ?auto_1311300 ?auto_1311299 ) ( not ( = ?auto_1311290 ?auto_1311291 ) ) ( not ( = ?auto_1311290 ?auto_1311292 ) ) ( not ( = ?auto_1311290 ?auto_1311289 ) ) ( not ( = ?auto_1311290 ?auto_1311293 ) ) ( not ( = ?auto_1311290 ?auto_1311295 ) ) ( not ( = ?auto_1311290 ?auto_1311294 ) ) ( not ( = ?auto_1311290 ?auto_1311296 ) ) ( not ( = ?auto_1311290 ?auto_1311297 ) ) ( not ( = ?auto_1311290 ?auto_1311298 ) ) ( not ( = ?auto_1311290 ?auto_1311299 ) ) ( not ( = ?auto_1311290 ?auto_1311300 ) ) ( not ( = ?auto_1311290 ?auto_1311301 ) ) ( not ( = ?auto_1311290 ?auto_1311302 ) ) ( not ( = ?auto_1311290 ?auto_1311308 ) ) ( not ( = ?auto_1311291 ?auto_1311292 ) ) ( not ( = ?auto_1311291 ?auto_1311289 ) ) ( not ( = ?auto_1311291 ?auto_1311293 ) ) ( not ( = ?auto_1311291 ?auto_1311295 ) ) ( not ( = ?auto_1311291 ?auto_1311294 ) ) ( not ( = ?auto_1311291 ?auto_1311296 ) ) ( not ( = ?auto_1311291 ?auto_1311297 ) ) ( not ( = ?auto_1311291 ?auto_1311298 ) ) ( not ( = ?auto_1311291 ?auto_1311299 ) ) ( not ( = ?auto_1311291 ?auto_1311300 ) ) ( not ( = ?auto_1311291 ?auto_1311301 ) ) ( not ( = ?auto_1311291 ?auto_1311302 ) ) ( not ( = ?auto_1311291 ?auto_1311308 ) ) ( not ( = ?auto_1311292 ?auto_1311289 ) ) ( not ( = ?auto_1311292 ?auto_1311293 ) ) ( not ( = ?auto_1311292 ?auto_1311295 ) ) ( not ( = ?auto_1311292 ?auto_1311294 ) ) ( not ( = ?auto_1311292 ?auto_1311296 ) ) ( not ( = ?auto_1311292 ?auto_1311297 ) ) ( not ( = ?auto_1311292 ?auto_1311298 ) ) ( not ( = ?auto_1311292 ?auto_1311299 ) ) ( not ( = ?auto_1311292 ?auto_1311300 ) ) ( not ( = ?auto_1311292 ?auto_1311301 ) ) ( not ( = ?auto_1311292 ?auto_1311302 ) ) ( not ( = ?auto_1311292 ?auto_1311308 ) ) ( not ( = ?auto_1311289 ?auto_1311293 ) ) ( not ( = ?auto_1311289 ?auto_1311295 ) ) ( not ( = ?auto_1311289 ?auto_1311294 ) ) ( not ( = ?auto_1311289 ?auto_1311296 ) ) ( not ( = ?auto_1311289 ?auto_1311297 ) ) ( not ( = ?auto_1311289 ?auto_1311298 ) ) ( not ( = ?auto_1311289 ?auto_1311299 ) ) ( not ( = ?auto_1311289 ?auto_1311300 ) ) ( not ( = ?auto_1311289 ?auto_1311301 ) ) ( not ( = ?auto_1311289 ?auto_1311302 ) ) ( not ( = ?auto_1311289 ?auto_1311308 ) ) ( not ( = ?auto_1311293 ?auto_1311295 ) ) ( not ( = ?auto_1311293 ?auto_1311294 ) ) ( not ( = ?auto_1311293 ?auto_1311296 ) ) ( not ( = ?auto_1311293 ?auto_1311297 ) ) ( not ( = ?auto_1311293 ?auto_1311298 ) ) ( not ( = ?auto_1311293 ?auto_1311299 ) ) ( not ( = ?auto_1311293 ?auto_1311300 ) ) ( not ( = ?auto_1311293 ?auto_1311301 ) ) ( not ( = ?auto_1311293 ?auto_1311302 ) ) ( not ( = ?auto_1311293 ?auto_1311308 ) ) ( not ( = ?auto_1311295 ?auto_1311294 ) ) ( not ( = ?auto_1311295 ?auto_1311296 ) ) ( not ( = ?auto_1311295 ?auto_1311297 ) ) ( not ( = ?auto_1311295 ?auto_1311298 ) ) ( not ( = ?auto_1311295 ?auto_1311299 ) ) ( not ( = ?auto_1311295 ?auto_1311300 ) ) ( not ( = ?auto_1311295 ?auto_1311301 ) ) ( not ( = ?auto_1311295 ?auto_1311302 ) ) ( not ( = ?auto_1311295 ?auto_1311308 ) ) ( not ( = ?auto_1311294 ?auto_1311296 ) ) ( not ( = ?auto_1311294 ?auto_1311297 ) ) ( not ( = ?auto_1311294 ?auto_1311298 ) ) ( not ( = ?auto_1311294 ?auto_1311299 ) ) ( not ( = ?auto_1311294 ?auto_1311300 ) ) ( not ( = ?auto_1311294 ?auto_1311301 ) ) ( not ( = ?auto_1311294 ?auto_1311302 ) ) ( not ( = ?auto_1311294 ?auto_1311308 ) ) ( not ( = ?auto_1311296 ?auto_1311297 ) ) ( not ( = ?auto_1311296 ?auto_1311298 ) ) ( not ( = ?auto_1311296 ?auto_1311299 ) ) ( not ( = ?auto_1311296 ?auto_1311300 ) ) ( not ( = ?auto_1311296 ?auto_1311301 ) ) ( not ( = ?auto_1311296 ?auto_1311302 ) ) ( not ( = ?auto_1311296 ?auto_1311308 ) ) ( not ( = ?auto_1311297 ?auto_1311298 ) ) ( not ( = ?auto_1311297 ?auto_1311299 ) ) ( not ( = ?auto_1311297 ?auto_1311300 ) ) ( not ( = ?auto_1311297 ?auto_1311301 ) ) ( not ( = ?auto_1311297 ?auto_1311302 ) ) ( not ( = ?auto_1311297 ?auto_1311308 ) ) ( not ( = ?auto_1311298 ?auto_1311299 ) ) ( not ( = ?auto_1311298 ?auto_1311300 ) ) ( not ( = ?auto_1311298 ?auto_1311301 ) ) ( not ( = ?auto_1311298 ?auto_1311302 ) ) ( not ( = ?auto_1311298 ?auto_1311308 ) ) ( not ( = ?auto_1311299 ?auto_1311300 ) ) ( not ( = ?auto_1311299 ?auto_1311301 ) ) ( not ( = ?auto_1311299 ?auto_1311302 ) ) ( not ( = ?auto_1311299 ?auto_1311308 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1311300 ?auto_1311301 ?auto_1311302 )
      ( MAKE-13CRATE-VERIFY ?auto_1311290 ?auto_1311291 ?auto_1311292 ?auto_1311289 ?auto_1311293 ?auto_1311295 ?auto_1311294 ?auto_1311296 ?auto_1311297 ?auto_1311298 ?auto_1311299 ?auto_1311300 ?auto_1311301 ?auto_1311302 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1311403 - SURFACE
      ?auto_1311404 - SURFACE
      ?auto_1311405 - SURFACE
      ?auto_1311402 - SURFACE
      ?auto_1311406 - SURFACE
      ?auto_1311408 - SURFACE
      ?auto_1311407 - SURFACE
      ?auto_1311409 - SURFACE
      ?auto_1311410 - SURFACE
      ?auto_1311411 - SURFACE
    )
    :vars
    (
      ?auto_1311415 - HOIST
      ?auto_1311412 - PLACE
      ?auto_1311416 - PLACE
      ?auto_1311414 - HOIST
      ?auto_1311413 - SURFACE
      ?auto_1311417 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1311415 ?auto_1311412 ) ( IS-CRATE ?auto_1311411 ) ( not ( = ?auto_1311410 ?auto_1311411 ) ) ( not ( = ?auto_1311409 ?auto_1311410 ) ) ( not ( = ?auto_1311409 ?auto_1311411 ) ) ( not ( = ?auto_1311416 ?auto_1311412 ) ) ( HOIST-AT ?auto_1311414 ?auto_1311416 ) ( not ( = ?auto_1311415 ?auto_1311414 ) ) ( AVAILABLE ?auto_1311414 ) ( SURFACE-AT ?auto_1311411 ?auto_1311416 ) ( ON ?auto_1311411 ?auto_1311413 ) ( CLEAR ?auto_1311411 ) ( not ( = ?auto_1311410 ?auto_1311413 ) ) ( not ( = ?auto_1311411 ?auto_1311413 ) ) ( not ( = ?auto_1311409 ?auto_1311413 ) ) ( SURFACE-AT ?auto_1311409 ?auto_1311412 ) ( CLEAR ?auto_1311409 ) ( IS-CRATE ?auto_1311410 ) ( AVAILABLE ?auto_1311415 ) ( IN ?auto_1311410 ?auto_1311417 ) ( TRUCK-AT ?auto_1311417 ?auto_1311416 ) ( ON ?auto_1311404 ?auto_1311403 ) ( ON ?auto_1311405 ?auto_1311404 ) ( ON ?auto_1311402 ?auto_1311405 ) ( ON ?auto_1311406 ?auto_1311402 ) ( ON ?auto_1311408 ?auto_1311406 ) ( ON ?auto_1311407 ?auto_1311408 ) ( ON ?auto_1311409 ?auto_1311407 ) ( not ( = ?auto_1311403 ?auto_1311404 ) ) ( not ( = ?auto_1311403 ?auto_1311405 ) ) ( not ( = ?auto_1311403 ?auto_1311402 ) ) ( not ( = ?auto_1311403 ?auto_1311406 ) ) ( not ( = ?auto_1311403 ?auto_1311408 ) ) ( not ( = ?auto_1311403 ?auto_1311407 ) ) ( not ( = ?auto_1311403 ?auto_1311409 ) ) ( not ( = ?auto_1311403 ?auto_1311410 ) ) ( not ( = ?auto_1311403 ?auto_1311411 ) ) ( not ( = ?auto_1311403 ?auto_1311413 ) ) ( not ( = ?auto_1311404 ?auto_1311405 ) ) ( not ( = ?auto_1311404 ?auto_1311402 ) ) ( not ( = ?auto_1311404 ?auto_1311406 ) ) ( not ( = ?auto_1311404 ?auto_1311408 ) ) ( not ( = ?auto_1311404 ?auto_1311407 ) ) ( not ( = ?auto_1311404 ?auto_1311409 ) ) ( not ( = ?auto_1311404 ?auto_1311410 ) ) ( not ( = ?auto_1311404 ?auto_1311411 ) ) ( not ( = ?auto_1311404 ?auto_1311413 ) ) ( not ( = ?auto_1311405 ?auto_1311402 ) ) ( not ( = ?auto_1311405 ?auto_1311406 ) ) ( not ( = ?auto_1311405 ?auto_1311408 ) ) ( not ( = ?auto_1311405 ?auto_1311407 ) ) ( not ( = ?auto_1311405 ?auto_1311409 ) ) ( not ( = ?auto_1311405 ?auto_1311410 ) ) ( not ( = ?auto_1311405 ?auto_1311411 ) ) ( not ( = ?auto_1311405 ?auto_1311413 ) ) ( not ( = ?auto_1311402 ?auto_1311406 ) ) ( not ( = ?auto_1311402 ?auto_1311408 ) ) ( not ( = ?auto_1311402 ?auto_1311407 ) ) ( not ( = ?auto_1311402 ?auto_1311409 ) ) ( not ( = ?auto_1311402 ?auto_1311410 ) ) ( not ( = ?auto_1311402 ?auto_1311411 ) ) ( not ( = ?auto_1311402 ?auto_1311413 ) ) ( not ( = ?auto_1311406 ?auto_1311408 ) ) ( not ( = ?auto_1311406 ?auto_1311407 ) ) ( not ( = ?auto_1311406 ?auto_1311409 ) ) ( not ( = ?auto_1311406 ?auto_1311410 ) ) ( not ( = ?auto_1311406 ?auto_1311411 ) ) ( not ( = ?auto_1311406 ?auto_1311413 ) ) ( not ( = ?auto_1311408 ?auto_1311407 ) ) ( not ( = ?auto_1311408 ?auto_1311409 ) ) ( not ( = ?auto_1311408 ?auto_1311410 ) ) ( not ( = ?auto_1311408 ?auto_1311411 ) ) ( not ( = ?auto_1311408 ?auto_1311413 ) ) ( not ( = ?auto_1311407 ?auto_1311409 ) ) ( not ( = ?auto_1311407 ?auto_1311410 ) ) ( not ( = ?auto_1311407 ?auto_1311411 ) ) ( not ( = ?auto_1311407 ?auto_1311413 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1311409 ?auto_1311410 ?auto_1311411 )
      ( MAKE-9CRATE-VERIFY ?auto_1311403 ?auto_1311404 ?auto_1311405 ?auto_1311402 ?auto_1311406 ?auto_1311408 ?auto_1311407 ?auto_1311409 ?auto_1311410 ?auto_1311411 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1311419 - SURFACE
      ?auto_1311420 - SURFACE
      ?auto_1311421 - SURFACE
      ?auto_1311418 - SURFACE
      ?auto_1311422 - SURFACE
      ?auto_1311424 - SURFACE
      ?auto_1311423 - SURFACE
      ?auto_1311425 - SURFACE
      ?auto_1311426 - SURFACE
      ?auto_1311427 - SURFACE
      ?auto_1311428 - SURFACE
    )
    :vars
    (
      ?auto_1311432 - HOIST
      ?auto_1311429 - PLACE
      ?auto_1311433 - PLACE
      ?auto_1311431 - HOIST
      ?auto_1311430 - SURFACE
      ?auto_1311434 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1311432 ?auto_1311429 ) ( IS-CRATE ?auto_1311428 ) ( not ( = ?auto_1311427 ?auto_1311428 ) ) ( not ( = ?auto_1311426 ?auto_1311427 ) ) ( not ( = ?auto_1311426 ?auto_1311428 ) ) ( not ( = ?auto_1311433 ?auto_1311429 ) ) ( HOIST-AT ?auto_1311431 ?auto_1311433 ) ( not ( = ?auto_1311432 ?auto_1311431 ) ) ( AVAILABLE ?auto_1311431 ) ( SURFACE-AT ?auto_1311428 ?auto_1311433 ) ( ON ?auto_1311428 ?auto_1311430 ) ( CLEAR ?auto_1311428 ) ( not ( = ?auto_1311427 ?auto_1311430 ) ) ( not ( = ?auto_1311428 ?auto_1311430 ) ) ( not ( = ?auto_1311426 ?auto_1311430 ) ) ( SURFACE-AT ?auto_1311426 ?auto_1311429 ) ( CLEAR ?auto_1311426 ) ( IS-CRATE ?auto_1311427 ) ( AVAILABLE ?auto_1311432 ) ( IN ?auto_1311427 ?auto_1311434 ) ( TRUCK-AT ?auto_1311434 ?auto_1311433 ) ( ON ?auto_1311420 ?auto_1311419 ) ( ON ?auto_1311421 ?auto_1311420 ) ( ON ?auto_1311418 ?auto_1311421 ) ( ON ?auto_1311422 ?auto_1311418 ) ( ON ?auto_1311424 ?auto_1311422 ) ( ON ?auto_1311423 ?auto_1311424 ) ( ON ?auto_1311425 ?auto_1311423 ) ( ON ?auto_1311426 ?auto_1311425 ) ( not ( = ?auto_1311419 ?auto_1311420 ) ) ( not ( = ?auto_1311419 ?auto_1311421 ) ) ( not ( = ?auto_1311419 ?auto_1311418 ) ) ( not ( = ?auto_1311419 ?auto_1311422 ) ) ( not ( = ?auto_1311419 ?auto_1311424 ) ) ( not ( = ?auto_1311419 ?auto_1311423 ) ) ( not ( = ?auto_1311419 ?auto_1311425 ) ) ( not ( = ?auto_1311419 ?auto_1311426 ) ) ( not ( = ?auto_1311419 ?auto_1311427 ) ) ( not ( = ?auto_1311419 ?auto_1311428 ) ) ( not ( = ?auto_1311419 ?auto_1311430 ) ) ( not ( = ?auto_1311420 ?auto_1311421 ) ) ( not ( = ?auto_1311420 ?auto_1311418 ) ) ( not ( = ?auto_1311420 ?auto_1311422 ) ) ( not ( = ?auto_1311420 ?auto_1311424 ) ) ( not ( = ?auto_1311420 ?auto_1311423 ) ) ( not ( = ?auto_1311420 ?auto_1311425 ) ) ( not ( = ?auto_1311420 ?auto_1311426 ) ) ( not ( = ?auto_1311420 ?auto_1311427 ) ) ( not ( = ?auto_1311420 ?auto_1311428 ) ) ( not ( = ?auto_1311420 ?auto_1311430 ) ) ( not ( = ?auto_1311421 ?auto_1311418 ) ) ( not ( = ?auto_1311421 ?auto_1311422 ) ) ( not ( = ?auto_1311421 ?auto_1311424 ) ) ( not ( = ?auto_1311421 ?auto_1311423 ) ) ( not ( = ?auto_1311421 ?auto_1311425 ) ) ( not ( = ?auto_1311421 ?auto_1311426 ) ) ( not ( = ?auto_1311421 ?auto_1311427 ) ) ( not ( = ?auto_1311421 ?auto_1311428 ) ) ( not ( = ?auto_1311421 ?auto_1311430 ) ) ( not ( = ?auto_1311418 ?auto_1311422 ) ) ( not ( = ?auto_1311418 ?auto_1311424 ) ) ( not ( = ?auto_1311418 ?auto_1311423 ) ) ( not ( = ?auto_1311418 ?auto_1311425 ) ) ( not ( = ?auto_1311418 ?auto_1311426 ) ) ( not ( = ?auto_1311418 ?auto_1311427 ) ) ( not ( = ?auto_1311418 ?auto_1311428 ) ) ( not ( = ?auto_1311418 ?auto_1311430 ) ) ( not ( = ?auto_1311422 ?auto_1311424 ) ) ( not ( = ?auto_1311422 ?auto_1311423 ) ) ( not ( = ?auto_1311422 ?auto_1311425 ) ) ( not ( = ?auto_1311422 ?auto_1311426 ) ) ( not ( = ?auto_1311422 ?auto_1311427 ) ) ( not ( = ?auto_1311422 ?auto_1311428 ) ) ( not ( = ?auto_1311422 ?auto_1311430 ) ) ( not ( = ?auto_1311424 ?auto_1311423 ) ) ( not ( = ?auto_1311424 ?auto_1311425 ) ) ( not ( = ?auto_1311424 ?auto_1311426 ) ) ( not ( = ?auto_1311424 ?auto_1311427 ) ) ( not ( = ?auto_1311424 ?auto_1311428 ) ) ( not ( = ?auto_1311424 ?auto_1311430 ) ) ( not ( = ?auto_1311423 ?auto_1311425 ) ) ( not ( = ?auto_1311423 ?auto_1311426 ) ) ( not ( = ?auto_1311423 ?auto_1311427 ) ) ( not ( = ?auto_1311423 ?auto_1311428 ) ) ( not ( = ?auto_1311423 ?auto_1311430 ) ) ( not ( = ?auto_1311425 ?auto_1311426 ) ) ( not ( = ?auto_1311425 ?auto_1311427 ) ) ( not ( = ?auto_1311425 ?auto_1311428 ) ) ( not ( = ?auto_1311425 ?auto_1311430 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1311426 ?auto_1311427 ?auto_1311428 )
      ( MAKE-10CRATE-VERIFY ?auto_1311419 ?auto_1311420 ?auto_1311421 ?auto_1311418 ?auto_1311422 ?auto_1311424 ?auto_1311423 ?auto_1311425 ?auto_1311426 ?auto_1311427 ?auto_1311428 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1311436 - SURFACE
      ?auto_1311437 - SURFACE
      ?auto_1311438 - SURFACE
      ?auto_1311435 - SURFACE
      ?auto_1311439 - SURFACE
      ?auto_1311441 - SURFACE
      ?auto_1311440 - SURFACE
      ?auto_1311442 - SURFACE
      ?auto_1311443 - SURFACE
      ?auto_1311444 - SURFACE
      ?auto_1311445 - SURFACE
      ?auto_1311446 - SURFACE
    )
    :vars
    (
      ?auto_1311450 - HOIST
      ?auto_1311447 - PLACE
      ?auto_1311451 - PLACE
      ?auto_1311449 - HOIST
      ?auto_1311448 - SURFACE
      ?auto_1311452 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1311450 ?auto_1311447 ) ( IS-CRATE ?auto_1311446 ) ( not ( = ?auto_1311445 ?auto_1311446 ) ) ( not ( = ?auto_1311444 ?auto_1311445 ) ) ( not ( = ?auto_1311444 ?auto_1311446 ) ) ( not ( = ?auto_1311451 ?auto_1311447 ) ) ( HOIST-AT ?auto_1311449 ?auto_1311451 ) ( not ( = ?auto_1311450 ?auto_1311449 ) ) ( AVAILABLE ?auto_1311449 ) ( SURFACE-AT ?auto_1311446 ?auto_1311451 ) ( ON ?auto_1311446 ?auto_1311448 ) ( CLEAR ?auto_1311446 ) ( not ( = ?auto_1311445 ?auto_1311448 ) ) ( not ( = ?auto_1311446 ?auto_1311448 ) ) ( not ( = ?auto_1311444 ?auto_1311448 ) ) ( SURFACE-AT ?auto_1311444 ?auto_1311447 ) ( CLEAR ?auto_1311444 ) ( IS-CRATE ?auto_1311445 ) ( AVAILABLE ?auto_1311450 ) ( IN ?auto_1311445 ?auto_1311452 ) ( TRUCK-AT ?auto_1311452 ?auto_1311451 ) ( ON ?auto_1311437 ?auto_1311436 ) ( ON ?auto_1311438 ?auto_1311437 ) ( ON ?auto_1311435 ?auto_1311438 ) ( ON ?auto_1311439 ?auto_1311435 ) ( ON ?auto_1311441 ?auto_1311439 ) ( ON ?auto_1311440 ?auto_1311441 ) ( ON ?auto_1311442 ?auto_1311440 ) ( ON ?auto_1311443 ?auto_1311442 ) ( ON ?auto_1311444 ?auto_1311443 ) ( not ( = ?auto_1311436 ?auto_1311437 ) ) ( not ( = ?auto_1311436 ?auto_1311438 ) ) ( not ( = ?auto_1311436 ?auto_1311435 ) ) ( not ( = ?auto_1311436 ?auto_1311439 ) ) ( not ( = ?auto_1311436 ?auto_1311441 ) ) ( not ( = ?auto_1311436 ?auto_1311440 ) ) ( not ( = ?auto_1311436 ?auto_1311442 ) ) ( not ( = ?auto_1311436 ?auto_1311443 ) ) ( not ( = ?auto_1311436 ?auto_1311444 ) ) ( not ( = ?auto_1311436 ?auto_1311445 ) ) ( not ( = ?auto_1311436 ?auto_1311446 ) ) ( not ( = ?auto_1311436 ?auto_1311448 ) ) ( not ( = ?auto_1311437 ?auto_1311438 ) ) ( not ( = ?auto_1311437 ?auto_1311435 ) ) ( not ( = ?auto_1311437 ?auto_1311439 ) ) ( not ( = ?auto_1311437 ?auto_1311441 ) ) ( not ( = ?auto_1311437 ?auto_1311440 ) ) ( not ( = ?auto_1311437 ?auto_1311442 ) ) ( not ( = ?auto_1311437 ?auto_1311443 ) ) ( not ( = ?auto_1311437 ?auto_1311444 ) ) ( not ( = ?auto_1311437 ?auto_1311445 ) ) ( not ( = ?auto_1311437 ?auto_1311446 ) ) ( not ( = ?auto_1311437 ?auto_1311448 ) ) ( not ( = ?auto_1311438 ?auto_1311435 ) ) ( not ( = ?auto_1311438 ?auto_1311439 ) ) ( not ( = ?auto_1311438 ?auto_1311441 ) ) ( not ( = ?auto_1311438 ?auto_1311440 ) ) ( not ( = ?auto_1311438 ?auto_1311442 ) ) ( not ( = ?auto_1311438 ?auto_1311443 ) ) ( not ( = ?auto_1311438 ?auto_1311444 ) ) ( not ( = ?auto_1311438 ?auto_1311445 ) ) ( not ( = ?auto_1311438 ?auto_1311446 ) ) ( not ( = ?auto_1311438 ?auto_1311448 ) ) ( not ( = ?auto_1311435 ?auto_1311439 ) ) ( not ( = ?auto_1311435 ?auto_1311441 ) ) ( not ( = ?auto_1311435 ?auto_1311440 ) ) ( not ( = ?auto_1311435 ?auto_1311442 ) ) ( not ( = ?auto_1311435 ?auto_1311443 ) ) ( not ( = ?auto_1311435 ?auto_1311444 ) ) ( not ( = ?auto_1311435 ?auto_1311445 ) ) ( not ( = ?auto_1311435 ?auto_1311446 ) ) ( not ( = ?auto_1311435 ?auto_1311448 ) ) ( not ( = ?auto_1311439 ?auto_1311441 ) ) ( not ( = ?auto_1311439 ?auto_1311440 ) ) ( not ( = ?auto_1311439 ?auto_1311442 ) ) ( not ( = ?auto_1311439 ?auto_1311443 ) ) ( not ( = ?auto_1311439 ?auto_1311444 ) ) ( not ( = ?auto_1311439 ?auto_1311445 ) ) ( not ( = ?auto_1311439 ?auto_1311446 ) ) ( not ( = ?auto_1311439 ?auto_1311448 ) ) ( not ( = ?auto_1311441 ?auto_1311440 ) ) ( not ( = ?auto_1311441 ?auto_1311442 ) ) ( not ( = ?auto_1311441 ?auto_1311443 ) ) ( not ( = ?auto_1311441 ?auto_1311444 ) ) ( not ( = ?auto_1311441 ?auto_1311445 ) ) ( not ( = ?auto_1311441 ?auto_1311446 ) ) ( not ( = ?auto_1311441 ?auto_1311448 ) ) ( not ( = ?auto_1311440 ?auto_1311442 ) ) ( not ( = ?auto_1311440 ?auto_1311443 ) ) ( not ( = ?auto_1311440 ?auto_1311444 ) ) ( not ( = ?auto_1311440 ?auto_1311445 ) ) ( not ( = ?auto_1311440 ?auto_1311446 ) ) ( not ( = ?auto_1311440 ?auto_1311448 ) ) ( not ( = ?auto_1311442 ?auto_1311443 ) ) ( not ( = ?auto_1311442 ?auto_1311444 ) ) ( not ( = ?auto_1311442 ?auto_1311445 ) ) ( not ( = ?auto_1311442 ?auto_1311446 ) ) ( not ( = ?auto_1311442 ?auto_1311448 ) ) ( not ( = ?auto_1311443 ?auto_1311444 ) ) ( not ( = ?auto_1311443 ?auto_1311445 ) ) ( not ( = ?auto_1311443 ?auto_1311446 ) ) ( not ( = ?auto_1311443 ?auto_1311448 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1311444 ?auto_1311445 ?auto_1311446 )
      ( MAKE-11CRATE-VERIFY ?auto_1311436 ?auto_1311437 ?auto_1311438 ?auto_1311435 ?auto_1311439 ?auto_1311441 ?auto_1311440 ?auto_1311442 ?auto_1311443 ?auto_1311444 ?auto_1311445 ?auto_1311446 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1311454 - SURFACE
      ?auto_1311455 - SURFACE
      ?auto_1311456 - SURFACE
      ?auto_1311453 - SURFACE
      ?auto_1311457 - SURFACE
      ?auto_1311459 - SURFACE
      ?auto_1311458 - SURFACE
      ?auto_1311460 - SURFACE
      ?auto_1311461 - SURFACE
      ?auto_1311462 - SURFACE
      ?auto_1311463 - SURFACE
      ?auto_1311464 - SURFACE
      ?auto_1311465 - SURFACE
    )
    :vars
    (
      ?auto_1311469 - HOIST
      ?auto_1311466 - PLACE
      ?auto_1311470 - PLACE
      ?auto_1311468 - HOIST
      ?auto_1311467 - SURFACE
      ?auto_1311471 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1311469 ?auto_1311466 ) ( IS-CRATE ?auto_1311465 ) ( not ( = ?auto_1311464 ?auto_1311465 ) ) ( not ( = ?auto_1311463 ?auto_1311464 ) ) ( not ( = ?auto_1311463 ?auto_1311465 ) ) ( not ( = ?auto_1311470 ?auto_1311466 ) ) ( HOIST-AT ?auto_1311468 ?auto_1311470 ) ( not ( = ?auto_1311469 ?auto_1311468 ) ) ( AVAILABLE ?auto_1311468 ) ( SURFACE-AT ?auto_1311465 ?auto_1311470 ) ( ON ?auto_1311465 ?auto_1311467 ) ( CLEAR ?auto_1311465 ) ( not ( = ?auto_1311464 ?auto_1311467 ) ) ( not ( = ?auto_1311465 ?auto_1311467 ) ) ( not ( = ?auto_1311463 ?auto_1311467 ) ) ( SURFACE-AT ?auto_1311463 ?auto_1311466 ) ( CLEAR ?auto_1311463 ) ( IS-CRATE ?auto_1311464 ) ( AVAILABLE ?auto_1311469 ) ( IN ?auto_1311464 ?auto_1311471 ) ( TRUCK-AT ?auto_1311471 ?auto_1311470 ) ( ON ?auto_1311455 ?auto_1311454 ) ( ON ?auto_1311456 ?auto_1311455 ) ( ON ?auto_1311453 ?auto_1311456 ) ( ON ?auto_1311457 ?auto_1311453 ) ( ON ?auto_1311459 ?auto_1311457 ) ( ON ?auto_1311458 ?auto_1311459 ) ( ON ?auto_1311460 ?auto_1311458 ) ( ON ?auto_1311461 ?auto_1311460 ) ( ON ?auto_1311462 ?auto_1311461 ) ( ON ?auto_1311463 ?auto_1311462 ) ( not ( = ?auto_1311454 ?auto_1311455 ) ) ( not ( = ?auto_1311454 ?auto_1311456 ) ) ( not ( = ?auto_1311454 ?auto_1311453 ) ) ( not ( = ?auto_1311454 ?auto_1311457 ) ) ( not ( = ?auto_1311454 ?auto_1311459 ) ) ( not ( = ?auto_1311454 ?auto_1311458 ) ) ( not ( = ?auto_1311454 ?auto_1311460 ) ) ( not ( = ?auto_1311454 ?auto_1311461 ) ) ( not ( = ?auto_1311454 ?auto_1311462 ) ) ( not ( = ?auto_1311454 ?auto_1311463 ) ) ( not ( = ?auto_1311454 ?auto_1311464 ) ) ( not ( = ?auto_1311454 ?auto_1311465 ) ) ( not ( = ?auto_1311454 ?auto_1311467 ) ) ( not ( = ?auto_1311455 ?auto_1311456 ) ) ( not ( = ?auto_1311455 ?auto_1311453 ) ) ( not ( = ?auto_1311455 ?auto_1311457 ) ) ( not ( = ?auto_1311455 ?auto_1311459 ) ) ( not ( = ?auto_1311455 ?auto_1311458 ) ) ( not ( = ?auto_1311455 ?auto_1311460 ) ) ( not ( = ?auto_1311455 ?auto_1311461 ) ) ( not ( = ?auto_1311455 ?auto_1311462 ) ) ( not ( = ?auto_1311455 ?auto_1311463 ) ) ( not ( = ?auto_1311455 ?auto_1311464 ) ) ( not ( = ?auto_1311455 ?auto_1311465 ) ) ( not ( = ?auto_1311455 ?auto_1311467 ) ) ( not ( = ?auto_1311456 ?auto_1311453 ) ) ( not ( = ?auto_1311456 ?auto_1311457 ) ) ( not ( = ?auto_1311456 ?auto_1311459 ) ) ( not ( = ?auto_1311456 ?auto_1311458 ) ) ( not ( = ?auto_1311456 ?auto_1311460 ) ) ( not ( = ?auto_1311456 ?auto_1311461 ) ) ( not ( = ?auto_1311456 ?auto_1311462 ) ) ( not ( = ?auto_1311456 ?auto_1311463 ) ) ( not ( = ?auto_1311456 ?auto_1311464 ) ) ( not ( = ?auto_1311456 ?auto_1311465 ) ) ( not ( = ?auto_1311456 ?auto_1311467 ) ) ( not ( = ?auto_1311453 ?auto_1311457 ) ) ( not ( = ?auto_1311453 ?auto_1311459 ) ) ( not ( = ?auto_1311453 ?auto_1311458 ) ) ( not ( = ?auto_1311453 ?auto_1311460 ) ) ( not ( = ?auto_1311453 ?auto_1311461 ) ) ( not ( = ?auto_1311453 ?auto_1311462 ) ) ( not ( = ?auto_1311453 ?auto_1311463 ) ) ( not ( = ?auto_1311453 ?auto_1311464 ) ) ( not ( = ?auto_1311453 ?auto_1311465 ) ) ( not ( = ?auto_1311453 ?auto_1311467 ) ) ( not ( = ?auto_1311457 ?auto_1311459 ) ) ( not ( = ?auto_1311457 ?auto_1311458 ) ) ( not ( = ?auto_1311457 ?auto_1311460 ) ) ( not ( = ?auto_1311457 ?auto_1311461 ) ) ( not ( = ?auto_1311457 ?auto_1311462 ) ) ( not ( = ?auto_1311457 ?auto_1311463 ) ) ( not ( = ?auto_1311457 ?auto_1311464 ) ) ( not ( = ?auto_1311457 ?auto_1311465 ) ) ( not ( = ?auto_1311457 ?auto_1311467 ) ) ( not ( = ?auto_1311459 ?auto_1311458 ) ) ( not ( = ?auto_1311459 ?auto_1311460 ) ) ( not ( = ?auto_1311459 ?auto_1311461 ) ) ( not ( = ?auto_1311459 ?auto_1311462 ) ) ( not ( = ?auto_1311459 ?auto_1311463 ) ) ( not ( = ?auto_1311459 ?auto_1311464 ) ) ( not ( = ?auto_1311459 ?auto_1311465 ) ) ( not ( = ?auto_1311459 ?auto_1311467 ) ) ( not ( = ?auto_1311458 ?auto_1311460 ) ) ( not ( = ?auto_1311458 ?auto_1311461 ) ) ( not ( = ?auto_1311458 ?auto_1311462 ) ) ( not ( = ?auto_1311458 ?auto_1311463 ) ) ( not ( = ?auto_1311458 ?auto_1311464 ) ) ( not ( = ?auto_1311458 ?auto_1311465 ) ) ( not ( = ?auto_1311458 ?auto_1311467 ) ) ( not ( = ?auto_1311460 ?auto_1311461 ) ) ( not ( = ?auto_1311460 ?auto_1311462 ) ) ( not ( = ?auto_1311460 ?auto_1311463 ) ) ( not ( = ?auto_1311460 ?auto_1311464 ) ) ( not ( = ?auto_1311460 ?auto_1311465 ) ) ( not ( = ?auto_1311460 ?auto_1311467 ) ) ( not ( = ?auto_1311461 ?auto_1311462 ) ) ( not ( = ?auto_1311461 ?auto_1311463 ) ) ( not ( = ?auto_1311461 ?auto_1311464 ) ) ( not ( = ?auto_1311461 ?auto_1311465 ) ) ( not ( = ?auto_1311461 ?auto_1311467 ) ) ( not ( = ?auto_1311462 ?auto_1311463 ) ) ( not ( = ?auto_1311462 ?auto_1311464 ) ) ( not ( = ?auto_1311462 ?auto_1311465 ) ) ( not ( = ?auto_1311462 ?auto_1311467 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1311463 ?auto_1311464 ?auto_1311465 )
      ( MAKE-12CRATE-VERIFY ?auto_1311454 ?auto_1311455 ?auto_1311456 ?auto_1311453 ?auto_1311457 ?auto_1311459 ?auto_1311458 ?auto_1311460 ?auto_1311461 ?auto_1311462 ?auto_1311463 ?auto_1311464 ?auto_1311465 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1311473 - SURFACE
      ?auto_1311474 - SURFACE
      ?auto_1311475 - SURFACE
      ?auto_1311472 - SURFACE
      ?auto_1311476 - SURFACE
      ?auto_1311478 - SURFACE
      ?auto_1311477 - SURFACE
      ?auto_1311479 - SURFACE
      ?auto_1311480 - SURFACE
      ?auto_1311481 - SURFACE
      ?auto_1311482 - SURFACE
      ?auto_1311483 - SURFACE
      ?auto_1311484 - SURFACE
      ?auto_1311485 - SURFACE
    )
    :vars
    (
      ?auto_1311489 - HOIST
      ?auto_1311486 - PLACE
      ?auto_1311490 - PLACE
      ?auto_1311488 - HOIST
      ?auto_1311487 - SURFACE
      ?auto_1311491 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1311489 ?auto_1311486 ) ( IS-CRATE ?auto_1311485 ) ( not ( = ?auto_1311484 ?auto_1311485 ) ) ( not ( = ?auto_1311483 ?auto_1311484 ) ) ( not ( = ?auto_1311483 ?auto_1311485 ) ) ( not ( = ?auto_1311490 ?auto_1311486 ) ) ( HOIST-AT ?auto_1311488 ?auto_1311490 ) ( not ( = ?auto_1311489 ?auto_1311488 ) ) ( AVAILABLE ?auto_1311488 ) ( SURFACE-AT ?auto_1311485 ?auto_1311490 ) ( ON ?auto_1311485 ?auto_1311487 ) ( CLEAR ?auto_1311485 ) ( not ( = ?auto_1311484 ?auto_1311487 ) ) ( not ( = ?auto_1311485 ?auto_1311487 ) ) ( not ( = ?auto_1311483 ?auto_1311487 ) ) ( SURFACE-AT ?auto_1311483 ?auto_1311486 ) ( CLEAR ?auto_1311483 ) ( IS-CRATE ?auto_1311484 ) ( AVAILABLE ?auto_1311489 ) ( IN ?auto_1311484 ?auto_1311491 ) ( TRUCK-AT ?auto_1311491 ?auto_1311490 ) ( ON ?auto_1311474 ?auto_1311473 ) ( ON ?auto_1311475 ?auto_1311474 ) ( ON ?auto_1311472 ?auto_1311475 ) ( ON ?auto_1311476 ?auto_1311472 ) ( ON ?auto_1311478 ?auto_1311476 ) ( ON ?auto_1311477 ?auto_1311478 ) ( ON ?auto_1311479 ?auto_1311477 ) ( ON ?auto_1311480 ?auto_1311479 ) ( ON ?auto_1311481 ?auto_1311480 ) ( ON ?auto_1311482 ?auto_1311481 ) ( ON ?auto_1311483 ?auto_1311482 ) ( not ( = ?auto_1311473 ?auto_1311474 ) ) ( not ( = ?auto_1311473 ?auto_1311475 ) ) ( not ( = ?auto_1311473 ?auto_1311472 ) ) ( not ( = ?auto_1311473 ?auto_1311476 ) ) ( not ( = ?auto_1311473 ?auto_1311478 ) ) ( not ( = ?auto_1311473 ?auto_1311477 ) ) ( not ( = ?auto_1311473 ?auto_1311479 ) ) ( not ( = ?auto_1311473 ?auto_1311480 ) ) ( not ( = ?auto_1311473 ?auto_1311481 ) ) ( not ( = ?auto_1311473 ?auto_1311482 ) ) ( not ( = ?auto_1311473 ?auto_1311483 ) ) ( not ( = ?auto_1311473 ?auto_1311484 ) ) ( not ( = ?auto_1311473 ?auto_1311485 ) ) ( not ( = ?auto_1311473 ?auto_1311487 ) ) ( not ( = ?auto_1311474 ?auto_1311475 ) ) ( not ( = ?auto_1311474 ?auto_1311472 ) ) ( not ( = ?auto_1311474 ?auto_1311476 ) ) ( not ( = ?auto_1311474 ?auto_1311478 ) ) ( not ( = ?auto_1311474 ?auto_1311477 ) ) ( not ( = ?auto_1311474 ?auto_1311479 ) ) ( not ( = ?auto_1311474 ?auto_1311480 ) ) ( not ( = ?auto_1311474 ?auto_1311481 ) ) ( not ( = ?auto_1311474 ?auto_1311482 ) ) ( not ( = ?auto_1311474 ?auto_1311483 ) ) ( not ( = ?auto_1311474 ?auto_1311484 ) ) ( not ( = ?auto_1311474 ?auto_1311485 ) ) ( not ( = ?auto_1311474 ?auto_1311487 ) ) ( not ( = ?auto_1311475 ?auto_1311472 ) ) ( not ( = ?auto_1311475 ?auto_1311476 ) ) ( not ( = ?auto_1311475 ?auto_1311478 ) ) ( not ( = ?auto_1311475 ?auto_1311477 ) ) ( not ( = ?auto_1311475 ?auto_1311479 ) ) ( not ( = ?auto_1311475 ?auto_1311480 ) ) ( not ( = ?auto_1311475 ?auto_1311481 ) ) ( not ( = ?auto_1311475 ?auto_1311482 ) ) ( not ( = ?auto_1311475 ?auto_1311483 ) ) ( not ( = ?auto_1311475 ?auto_1311484 ) ) ( not ( = ?auto_1311475 ?auto_1311485 ) ) ( not ( = ?auto_1311475 ?auto_1311487 ) ) ( not ( = ?auto_1311472 ?auto_1311476 ) ) ( not ( = ?auto_1311472 ?auto_1311478 ) ) ( not ( = ?auto_1311472 ?auto_1311477 ) ) ( not ( = ?auto_1311472 ?auto_1311479 ) ) ( not ( = ?auto_1311472 ?auto_1311480 ) ) ( not ( = ?auto_1311472 ?auto_1311481 ) ) ( not ( = ?auto_1311472 ?auto_1311482 ) ) ( not ( = ?auto_1311472 ?auto_1311483 ) ) ( not ( = ?auto_1311472 ?auto_1311484 ) ) ( not ( = ?auto_1311472 ?auto_1311485 ) ) ( not ( = ?auto_1311472 ?auto_1311487 ) ) ( not ( = ?auto_1311476 ?auto_1311478 ) ) ( not ( = ?auto_1311476 ?auto_1311477 ) ) ( not ( = ?auto_1311476 ?auto_1311479 ) ) ( not ( = ?auto_1311476 ?auto_1311480 ) ) ( not ( = ?auto_1311476 ?auto_1311481 ) ) ( not ( = ?auto_1311476 ?auto_1311482 ) ) ( not ( = ?auto_1311476 ?auto_1311483 ) ) ( not ( = ?auto_1311476 ?auto_1311484 ) ) ( not ( = ?auto_1311476 ?auto_1311485 ) ) ( not ( = ?auto_1311476 ?auto_1311487 ) ) ( not ( = ?auto_1311478 ?auto_1311477 ) ) ( not ( = ?auto_1311478 ?auto_1311479 ) ) ( not ( = ?auto_1311478 ?auto_1311480 ) ) ( not ( = ?auto_1311478 ?auto_1311481 ) ) ( not ( = ?auto_1311478 ?auto_1311482 ) ) ( not ( = ?auto_1311478 ?auto_1311483 ) ) ( not ( = ?auto_1311478 ?auto_1311484 ) ) ( not ( = ?auto_1311478 ?auto_1311485 ) ) ( not ( = ?auto_1311478 ?auto_1311487 ) ) ( not ( = ?auto_1311477 ?auto_1311479 ) ) ( not ( = ?auto_1311477 ?auto_1311480 ) ) ( not ( = ?auto_1311477 ?auto_1311481 ) ) ( not ( = ?auto_1311477 ?auto_1311482 ) ) ( not ( = ?auto_1311477 ?auto_1311483 ) ) ( not ( = ?auto_1311477 ?auto_1311484 ) ) ( not ( = ?auto_1311477 ?auto_1311485 ) ) ( not ( = ?auto_1311477 ?auto_1311487 ) ) ( not ( = ?auto_1311479 ?auto_1311480 ) ) ( not ( = ?auto_1311479 ?auto_1311481 ) ) ( not ( = ?auto_1311479 ?auto_1311482 ) ) ( not ( = ?auto_1311479 ?auto_1311483 ) ) ( not ( = ?auto_1311479 ?auto_1311484 ) ) ( not ( = ?auto_1311479 ?auto_1311485 ) ) ( not ( = ?auto_1311479 ?auto_1311487 ) ) ( not ( = ?auto_1311480 ?auto_1311481 ) ) ( not ( = ?auto_1311480 ?auto_1311482 ) ) ( not ( = ?auto_1311480 ?auto_1311483 ) ) ( not ( = ?auto_1311480 ?auto_1311484 ) ) ( not ( = ?auto_1311480 ?auto_1311485 ) ) ( not ( = ?auto_1311480 ?auto_1311487 ) ) ( not ( = ?auto_1311481 ?auto_1311482 ) ) ( not ( = ?auto_1311481 ?auto_1311483 ) ) ( not ( = ?auto_1311481 ?auto_1311484 ) ) ( not ( = ?auto_1311481 ?auto_1311485 ) ) ( not ( = ?auto_1311481 ?auto_1311487 ) ) ( not ( = ?auto_1311482 ?auto_1311483 ) ) ( not ( = ?auto_1311482 ?auto_1311484 ) ) ( not ( = ?auto_1311482 ?auto_1311485 ) ) ( not ( = ?auto_1311482 ?auto_1311487 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1311483 ?auto_1311484 ?auto_1311485 )
      ( MAKE-13CRATE-VERIFY ?auto_1311473 ?auto_1311474 ?auto_1311475 ?auto_1311472 ?auto_1311476 ?auto_1311478 ?auto_1311477 ?auto_1311479 ?auto_1311480 ?auto_1311481 ?auto_1311482 ?auto_1311483 ?auto_1311484 ?auto_1311485 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1311586 - SURFACE
      ?auto_1311587 - SURFACE
      ?auto_1311588 - SURFACE
      ?auto_1311585 - SURFACE
      ?auto_1311589 - SURFACE
      ?auto_1311591 - SURFACE
      ?auto_1311590 - SURFACE
      ?auto_1311592 - SURFACE
      ?auto_1311593 - SURFACE
      ?auto_1311594 - SURFACE
    )
    :vars
    (
      ?auto_1311599 - HOIST
      ?auto_1311600 - PLACE
      ?auto_1311596 - PLACE
      ?auto_1311598 - HOIST
      ?auto_1311597 - SURFACE
      ?auto_1311595 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1311599 ?auto_1311600 ) ( IS-CRATE ?auto_1311594 ) ( not ( = ?auto_1311593 ?auto_1311594 ) ) ( not ( = ?auto_1311592 ?auto_1311593 ) ) ( not ( = ?auto_1311592 ?auto_1311594 ) ) ( not ( = ?auto_1311596 ?auto_1311600 ) ) ( HOIST-AT ?auto_1311598 ?auto_1311596 ) ( not ( = ?auto_1311599 ?auto_1311598 ) ) ( SURFACE-AT ?auto_1311594 ?auto_1311596 ) ( ON ?auto_1311594 ?auto_1311597 ) ( CLEAR ?auto_1311594 ) ( not ( = ?auto_1311593 ?auto_1311597 ) ) ( not ( = ?auto_1311594 ?auto_1311597 ) ) ( not ( = ?auto_1311592 ?auto_1311597 ) ) ( SURFACE-AT ?auto_1311592 ?auto_1311600 ) ( CLEAR ?auto_1311592 ) ( IS-CRATE ?auto_1311593 ) ( AVAILABLE ?auto_1311599 ) ( TRUCK-AT ?auto_1311595 ?auto_1311596 ) ( LIFTING ?auto_1311598 ?auto_1311593 ) ( ON ?auto_1311587 ?auto_1311586 ) ( ON ?auto_1311588 ?auto_1311587 ) ( ON ?auto_1311585 ?auto_1311588 ) ( ON ?auto_1311589 ?auto_1311585 ) ( ON ?auto_1311591 ?auto_1311589 ) ( ON ?auto_1311590 ?auto_1311591 ) ( ON ?auto_1311592 ?auto_1311590 ) ( not ( = ?auto_1311586 ?auto_1311587 ) ) ( not ( = ?auto_1311586 ?auto_1311588 ) ) ( not ( = ?auto_1311586 ?auto_1311585 ) ) ( not ( = ?auto_1311586 ?auto_1311589 ) ) ( not ( = ?auto_1311586 ?auto_1311591 ) ) ( not ( = ?auto_1311586 ?auto_1311590 ) ) ( not ( = ?auto_1311586 ?auto_1311592 ) ) ( not ( = ?auto_1311586 ?auto_1311593 ) ) ( not ( = ?auto_1311586 ?auto_1311594 ) ) ( not ( = ?auto_1311586 ?auto_1311597 ) ) ( not ( = ?auto_1311587 ?auto_1311588 ) ) ( not ( = ?auto_1311587 ?auto_1311585 ) ) ( not ( = ?auto_1311587 ?auto_1311589 ) ) ( not ( = ?auto_1311587 ?auto_1311591 ) ) ( not ( = ?auto_1311587 ?auto_1311590 ) ) ( not ( = ?auto_1311587 ?auto_1311592 ) ) ( not ( = ?auto_1311587 ?auto_1311593 ) ) ( not ( = ?auto_1311587 ?auto_1311594 ) ) ( not ( = ?auto_1311587 ?auto_1311597 ) ) ( not ( = ?auto_1311588 ?auto_1311585 ) ) ( not ( = ?auto_1311588 ?auto_1311589 ) ) ( not ( = ?auto_1311588 ?auto_1311591 ) ) ( not ( = ?auto_1311588 ?auto_1311590 ) ) ( not ( = ?auto_1311588 ?auto_1311592 ) ) ( not ( = ?auto_1311588 ?auto_1311593 ) ) ( not ( = ?auto_1311588 ?auto_1311594 ) ) ( not ( = ?auto_1311588 ?auto_1311597 ) ) ( not ( = ?auto_1311585 ?auto_1311589 ) ) ( not ( = ?auto_1311585 ?auto_1311591 ) ) ( not ( = ?auto_1311585 ?auto_1311590 ) ) ( not ( = ?auto_1311585 ?auto_1311592 ) ) ( not ( = ?auto_1311585 ?auto_1311593 ) ) ( not ( = ?auto_1311585 ?auto_1311594 ) ) ( not ( = ?auto_1311585 ?auto_1311597 ) ) ( not ( = ?auto_1311589 ?auto_1311591 ) ) ( not ( = ?auto_1311589 ?auto_1311590 ) ) ( not ( = ?auto_1311589 ?auto_1311592 ) ) ( not ( = ?auto_1311589 ?auto_1311593 ) ) ( not ( = ?auto_1311589 ?auto_1311594 ) ) ( not ( = ?auto_1311589 ?auto_1311597 ) ) ( not ( = ?auto_1311591 ?auto_1311590 ) ) ( not ( = ?auto_1311591 ?auto_1311592 ) ) ( not ( = ?auto_1311591 ?auto_1311593 ) ) ( not ( = ?auto_1311591 ?auto_1311594 ) ) ( not ( = ?auto_1311591 ?auto_1311597 ) ) ( not ( = ?auto_1311590 ?auto_1311592 ) ) ( not ( = ?auto_1311590 ?auto_1311593 ) ) ( not ( = ?auto_1311590 ?auto_1311594 ) ) ( not ( = ?auto_1311590 ?auto_1311597 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1311592 ?auto_1311593 ?auto_1311594 )
      ( MAKE-9CRATE-VERIFY ?auto_1311586 ?auto_1311587 ?auto_1311588 ?auto_1311585 ?auto_1311589 ?auto_1311591 ?auto_1311590 ?auto_1311592 ?auto_1311593 ?auto_1311594 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1311602 - SURFACE
      ?auto_1311603 - SURFACE
      ?auto_1311604 - SURFACE
      ?auto_1311601 - SURFACE
      ?auto_1311605 - SURFACE
      ?auto_1311607 - SURFACE
      ?auto_1311606 - SURFACE
      ?auto_1311608 - SURFACE
      ?auto_1311609 - SURFACE
      ?auto_1311610 - SURFACE
      ?auto_1311611 - SURFACE
    )
    :vars
    (
      ?auto_1311616 - HOIST
      ?auto_1311617 - PLACE
      ?auto_1311613 - PLACE
      ?auto_1311615 - HOIST
      ?auto_1311614 - SURFACE
      ?auto_1311612 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1311616 ?auto_1311617 ) ( IS-CRATE ?auto_1311611 ) ( not ( = ?auto_1311610 ?auto_1311611 ) ) ( not ( = ?auto_1311609 ?auto_1311610 ) ) ( not ( = ?auto_1311609 ?auto_1311611 ) ) ( not ( = ?auto_1311613 ?auto_1311617 ) ) ( HOIST-AT ?auto_1311615 ?auto_1311613 ) ( not ( = ?auto_1311616 ?auto_1311615 ) ) ( SURFACE-AT ?auto_1311611 ?auto_1311613 ) ( ON ?auto_1311611 ?auto_1311614 ) ( CLEAR ?auto_1311611 ) ( not ( = ?auto_1311610 ?auto_1311614 ) ) ( not ( = ?auto_1311611 ?auto_1311614 ) ) ( not ( = ?auto_1311609 ?auto_1311614 ) ) ( SURFACE-AT ?auto_1311609 ?auto_1311617 ) ( CLEAR ?auto_1311609 ) ( IS-CRATE ?auto_1311610 ) ( AVAILABLE ?auto_1311616 ) ( TRUCK-AT ?auto_1311612 ?auto_1311613 ) ( LIFTING ?auto_1311615 ?auto_1311610 ) ( ON ?auto_1311603 ?auto_1311602 ) ( ON ?auto_1311604 ?auto_1311603 ) ( ON ?auto_1311601 ?auto_1311604 ) ( ON ?auto_1311605 ?auto_1311601 ) ( ON ?auto_1311607 ?auto_1311605 ) ( ON ?auto_1311606 ?auto_1311607 ) ( ON ?auto_1311608 ?auto_1311606 ) ( ON ?auto_1311609 ?auto_1311608 ) ( not ( = ?auto_1311602 ?auto_1311603 ) ) ( not ( = ?auto_1311602 ?auto_1311604 ) ) ( not ( = ?auto_1311602 ?auto_1311601 ) ) ( not ( = ?auto_1311602 ?auto_1311605 ) ) ( not ( = ?auto_1311602 ?auto_1311607 ) ) ( not ( = ?auto_1311602 ?auto_1311606 ) ) ( not ( = ?auto_1311602 ?auto_1311608 ) ) ( not ( = ?auto_1311602 ?auto_1311609 ) ) ( not ( = ?auto_1311602 ?auto_1311610 ) ) ( not ( = ?auto_1311602 ?auto_1311611 ) ) ( not ( = ?auto_1311602 ?auto_1311614 ) ) ( not ( = ?auto_1311603 ?auto_1311604 ) ) ( not ( = ?auto_1311603 ?auto_1311601 ) ) ( not ( = ?auto_1311603 ?auto_1311605 ) ) ( not ( = ?auto_1311603 ?auto_1311607 ) ) ( not ( = ?auto_1311603 ?auto_1311606 ) ) ( not ( = ?auto_1311603 ?auto_1311608 ) ) ( not ( = ?auto_1311603 ?auto_1311609 ) ) ( not ( = ?auto_1311603 ?auto_1311610 ) ) ( not ( = ?auto_1311603 ?auto_1311611 ) ) ( not ( = ?auto_1311603 ?auto_1311614 ) ) ( not ( = ?auto_1311604 ?auto_1311601 ) ) ( not ( = ?auto_1311604 ?auto_1311605 ) ) ( not ( = ?auto_1311604 ?auto_1311607 ) ) ( not ( = ?auto_1311604 ?auto_1311606 ) ) ( not ( = ?auto_1311604 ?auto_1311608 ) ) ( not ( = ?auto_1311604 ?auto_1311609 ) ) ( not ( = ?auto_1311604 ?auto_1311610 ) ) ( not ( = ?auto_1311604 ?auto_1311611 ) ) ( not ( = ?auto_1311604 ?auto_1311614 ) ) ( not ( = ?auto_1311601 ?auto_1311605 ) ) ( not ( = ?auto_1311601 ?auto_1311607 ) ) ( not ( = ?auto_1311601 ?auto_1311606 ) ) ( not ( = ?auto_1311601 ?auto_1311608 ) ) ( not ( = ?auto_1311601 ?auto_1311609 ) ) ( not ( = ?auto_1311601 ?auto_1311610 ) ) ( not ( = ?auto_1311601 ?auto_1311611 ) ) ( not ( = ?auto_1311601 ?auto_1311614 ) ) ( not ( = ?auto_1311605 ?auto_1311607 ) ) ( not ( = ?auto_1311605 ?auto_1311606 ) ) ( not ( = ?auto_1311605 ?auto_1311608 ) ) ( not ( = ?auto_1311605 ?auto_1311609 ) ) ( not ( = ?auto_1311605 ?auto_1311610 ) ) ( not ( = ?auto_1311605 ?auto_1311611 ) ) ( not ( = ?auto_1311605 ?auto_1311614 ) ) ( not ( = ?auto_1311607 ?auto_1311606 ) ) ( not ( = ?auto_1311607 ?auto_1311608 ) ) ( not ( = ?auto_1311607 ?auto_1311609 ) ) ( not ( = ?auto_1311607 ?auto_1311610 ) ) ( not ( = ?auto_1311607 ?auto_1311611 ) ) ( not ( = ?auto_1311607 ?auto_1311614 ) ) ( not ( = ?auto_1311606 ?auto_1311608 ) ) ( not ( = ?auto_1311606 ?auto_1311609 ) ) ( not ( = ?auto_1311606 ?auto_1311610 ) ) ( not ( = ?auto_1311606 ?auto_1311611 ) ) ( not ( = ?auto_1311606 ?auto_1311614 ) ) ( not ( = ?auto_1311608 ?auto_1311609 ) ) ( not ( = ?auto_1311608 ?auto_1311610 ) ) ( not ( = ?auto_1311608 ?auto_1311611 ) ) ( not ( = ?auto_1311608 ?auto_1311614 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1311609 ?auto_1311610 ?auto_1311611 )
      ( MAKE-10CRATE-VERIFY ?auto_1311602 ?auto_1311603 ?auto_1311604 ?auto_1311601 ?auto_1311605 ?auto_1311607 ?auto_1311606 ?auto_1311608 ?auto_1311609 ?auto_1311610 ?auto_1311611 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1311619 - SURFACE
      ?auto_1311620 - SURFACE
      ?auto_1311621 - SURFACE
      ?auto_1311618 - SURFACE
      ?auto_1311622 - SURFACE
      ?auto_1311624 - SURFACE
      ?auto_1311623 - SURFACE
      ?auto_1311625 - SURFACE
      ?auto_1311626 - SURFACE
      ?auto_1311627 - SURFACE
      ?auto_1311628 - SURFACE
      ?auto_1311629 - SURFACE
    )
    :vars
    (
      ?auto_1311634 - HOIST
      ?auto_1311635 - PLACE
      ?auto_1311631 - PLACE
      ?auto_1311633 - HOIST
      ?auto_1311632 - SURFACE
      ?auto_1311630 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1311634 ?auto_1311635 ) ( IS-CRATE ?auto_1311629 ) ( not ( = ?auto_1311628 ?auto_1311629 ) ) ( not ( = ?auto_1311627 ?auto_1311628 ) ) ( not ( = ?auto_1311627 ?auto_1311629 ) ) ( not ( = ?auto_1311631 ?auto_1311635 ) ) ( HOIST-AT ?auto_1311633 ?auto_1311631 ) ( not ( = ?auto_1311634 ?auto_1311633 ) ) ( SURFACE-AT ?auto_1311629 ?auto_1311631 ) ( ON ?auto_1311629 ?auto_1311632 ) ( CLEAR ?auto_1311629 ) ( not ( = ?auto_1311628 ?auto_1311632 ) ) ( not ( = ?auto_1311629 ?auto_1311632 ) ) ( not ( = ?auto_1311627 ?auto_1311632 ) ) ( SURFACE-AT ?auto_1311627 ?auto_1311635 ) ( CLEAR ?auto_1311627 ) ( IS-CRATE ?auto_1311628 ) ( AVAILABLE ?auto_1311634 ) ( TRUCK-AT ?auto_1311630 ?auto_1311631 ) ( LIFTING ?auto_1311633 ?auto_1311628 ) ( ON ?auto_1311620 ?auto_1311619 ) ( ON ?auto_1311621 ?auto_1311620 ) ( ON ?auto_1311618 ?auto_1311621 ) ( ON ?auto_1311622 ?auto_1311618 ) ( ON ?auto_1311624 ?auto_1311622 ) ( ON ?auto_1311623 ?auto_1311624 ) ( ON ?auto_1311625 ?auto_1311623 ) ( ON ?auto_1311626 ?auto_1311625 ) ( ON ?auto_1311627 ?auto_1311626 ) ( not ( = ?auto_1311619 ?auto_1311620 ) ) ( not ( = ?auto_1311619 ?auto_1311621 ) ) ( not ( = ?auto_1311619 ?auto_1311618 ) ) ( not ( = ?auto_1311619 ?auto_1311622 ) ) ( not ( = ?auto_1311619 ?auto_1311624 ) ) ( not ( = ?auto_1311619 ?auto_1311623 ) ) ( not ( = ?auto_1311619 ?auto_1311625 ) ) ( not ( = ?auto_1311619 ?auto_1311626 ) ) ( not ( = ?auto_1311619 ?auto_1311627 ) ) ( not ( = ?auto_1311619 ?auto_1311628 ) ) ( not ( = ?auto_1311619 ?auto_1311629 ) ) ( not ( = ?auto_1311619 ?auto_1311632 ) ) ( not ( = ?auto_1311620 ?auto_1311621 ) ) ( not ( = ?auto_1311620 ?auto_1311618 ) ) ( not ( = ?auto_1311620 ?auto_1311622 ) ) ( not ( = ?auto_1311620 ?auto_1311624 ) ) ( not ( = ?auto_1311620 ?auto_1311623 ) ) ( not ( = ?auto_1311620 ?auto_1311625 ) ) ( not ( = ?auto_1311620 ?auto_1311626 ) ) ( not ( = ?auto_1311620 ?auto_1311627 ) ) ( not ( = ?auto_1311620 ?auto_1311628 ) ) ( not ( = ?auto_1311620 ?auto_1311629 ) ) ( not ( = ?auto_1311620 ?auto_1311632 ) ) ( not ( = ?auto_1311621 ?auto_1311618 ) ) ( not ( = ?auto_1311621 ?auto_1311622 ) ) ( not ( = ?auto_1311621 ?auto_1311624 ) ) ( not ( = ?auto_1311621 ?auto_1311623 ) ) ( not ( = ?auto_1311621 ?auto_1311625 ) ) ( not ( = ?auto_1311621 ?auto_1311626 ) ) ( not ( = ?auto_1311621 ?auto_1311627 ) ) ( not ( = ?auto_1311621 ?auto_1311628 ) ) ( not ( = ?auto_1311621 ?auto_1311629 ) ) ( not ( = ?auto_1311621 ?auto_1311632 ) ) ( not ( = ?auto_1311618 ?auto_1311622 ) ) ( not ( = ?auto_1311618 ?auto_1311624 ) ) ( not ( = ?auto_1311618 ?auto_1311623 ) ) ( not ( = ?auto_1311618 ?auto_1311625 ) ) ( not ( = ?auto_1311618 ?auto_1311626 ) ) ( not ( = ?auto_1311618 ?auto_1311627 ) ) ( not ( = ?auto_1311618 ?auto_1311628 ) ) ( not ( = ?auto_1311618 ?auto_1311629 ) ) ( not ( = ?auto_1311618 ?auto_1311632 ) ) ( not ( = ?auto_1311622 ?auto_1311624 ) ) ( not ( = ?auto_1311622 ?auto_1311623 ) ) ( not ( = ?auto_1311622 ?auto_1311625 ) ) ( not ( = ?auto_1311622 ?auto_1311626 ) ) ( not ( = ?auto_1311622 ?auto_1311627 ) ) ( not ( = ?auto_1311622 ?auto_1311628 ) ) ( not ( = ?auto_1311622 ?auto_1311629 ) ) ( not ( = ?auto_1311622 ?auto_1311632 ) ) ( not ( = ?auto_1311624 ?auto_1311623 ) ) ( not ( = ?auto_1311624 ?auto_1311625 ) ) ( not ( = ?auto_1311624 ?auto_1311626 ) ) ( not ( = ?auto_1311624 ?auto_1311627 ) ) ( not ( = ?auto_1311624 ?auto_1311628 ) ) ( not ( = ?auto_1311624 ?auto_1311629 ) ) ( not ( = ?auto_1311624 ?auto_1311632 ) ) ( not ( = ?auto_1311623 ?auto_1311625 ) ) ( not ( = ?auto_1311623 ?auto_1311626 ) ) ( not ( = ?auto_1311623 ?auto_1311627 ) ) ( not ( = ?auto_1311623 ?auto_1311628 ) ) ( not ( = ?auto_1311623 ?auto_1311629 ) ) ( not ( = ?auto_1311623 ?auto_1311632 ) ) ( not ( = ?auto_1311625 ?auto_1311626 ) ) ( not ( = ?auto_1311625 ?auto_1311627 ) ) ( not ( = ?auto_1311625 ?auto_1311628 ) ) ( not ( = ?auto_1311625 ?auto_1311629 ) ) ( not ( = ?auto_1311625 ?auto_1311632 ) ) ( not ( = ?auto_1311626 ?auto_1311627 ) ) ( not ( = ?auto_1311626 ?auto_1311628 ) ) ( not ( = ?auto_1311626 ?auto_1311629 ) ) ( not ( = ?auto_1311626 ?auto_1311632 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1311627 ?auto_1311628 ?auto_1311629 )
      ( MAKE-11CRATE-VERIFY ?auto_1311619 ?auto_1311620 ?auto_1311621 ?auto_1311618 ?auto_1311622 ?auto_1311624 ?auto_1311623 ?auto_1311625 ?auto_1311626 ?auto_1311627 ?auto_1311628 ?auto_1311629 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1311637 - SURFACE
      ?auto_1311638 - SURFACE
      ?auto_1311639 - SURFACE
      ?auto_1311636 - SURFACE
      ?auto_1311640 - SURFACE
      ?auto_1311642 - SURFACE
      ?auto_1311641 - SURFACE
      ?auto_1311643 - SURFACE
      ?auto_1311644 - SURFACE
      ?auto_1311645 - SURFACE
      ?auto_1311646 - SURFACE
      ?auto_1311647 - SURFACE
      ?auto_1311648 - SURFACE
    )
    :vars
    (
      ?auto_1311653 - HOIST
      ?auto_1311654 - PLACE
      ?auto_1311650 - PLACE
      ?auto_1311652 - HOIST
      ?auto_1311651 - SURFACE
      ?auto_1311649 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1311653 ?auto_1311654 ) ( IS-CRATE ?auto_1311648 ) ( not ( = ?auto_1311647 ?auto_1311648 ) ) ( not ( = ?auto_1311646 ?auto_1311647 ) ) ( not ( = ?auto_1311646 ?auto_1311648 ) ) ( not ( = ?auto_1311650 ?auto_1311654 ) ) ( HOIST-AT ?auto_1311652 ?auto_1311650 ) ( not ( = ?auto_1311653 ?auto_1311652 ) ) ( SURFACE-AT ?auto_1311648 ?auto_1311650 ) ( ON ?auto_1311648 ?auto_1311651 ) ( CLEAR ?auto_1311648 ) ( not ( = ?auto_1311647 ?auto_1311651 ) ) ( not ( = ?auto_1311648 ?auto_1311651 ) ) ( not ( = ?auto_1311646 ?auto_1311651 ) ) ( SURFACE-AT ?auto_1311646 ?auto_1311654 ) ( CLEAR ?auto_1311646 ) ( IS-CRATE ?auto_1311647 ) ( AVAILABLE ?auto_1311653 ) ( TRUCK-AT ?auto_1311649 ?auto_1311650 ) ( LIFTING ?auto_1311652 ?auto_1311647 ) ( ON ?auto_1311638 ?auto_1311637 ) ( ON ?auto_1311639 ?auto_1311638 ) ( ON ?auto_1311636 ?auto_1311639 ) ( ON ?auto_1311640 ?auto_1311636 ) ( ON ?auto_1311642 ?auto_1311640 ) ( ON ?auto_1311641 ?auto_1311642 ) ( ON ?auto_1311643 ?auto_1311641 ) ( ON ?auto_1311644 ?auto_1311643 ) ( ON ?auto_1311645 ?auto_1311644 ) ( ON ?auto_1311646 ?auto_1311645 ) ( not ( = ?auto_1311637 ?auto_1311638 ) ) ( not ( = ?auto_1311637 ?auto_1311639 ) ) ( not ( = ?auto_1311637 ?auto_1311636 ) ) ( not ( = ?auto_1311637 ?auto_1311640 ) ) ( not ( = ?auto_1311637 ?auto_1311642 ) ) ( not ( = ?auto_1311637 ?auto_1311641 ) ) ( not ( = ?auto_1311637 ?auto_1311643 ) ) ( not ( = ?auto_1311637 ?auto_1311644 ) ) ( not ( = ?auto_1311637 ?auto_1311645 ) ) ( not ( = ?auto_1311637 ?auto_1311646 ) ) ( not ( = ?auto_1311637 ?auto_1311647 ) ) ( not ( = ?auto_1311637 ?auto_1311648 ) ) ( not ( = ?auto_1311637 ?auto_1311651 ) ) ( not ( = ?auto_1311638 ?auto_1311639 ) ) ( not ( = ?auto_1311638 ?auto_1311636 ) ) ( not ( = ?auto_1311638 ?auto_1311640 ) ) ( not ( = ?auto_1311638 ?auto_1311642 ) ) ( not ( = ?auto_1311638 ?auto_1311641 ) ) ( not ( = ?auto_1311638 ?auto_1311643 ) ) ( not ( = ?auto_1311638 ?auto_1311644 ) ) ( not ( = ?auto_1311638 ?auto_1311645 ) ) ( not ( = ?auto_1311638 ?auto_1311646 ) ) ( not ( = ?auto_1311638 ?auto_1311647 ) ) ( not ( = ?auto_1311638 ?auto_1311648 ) ) ( not ( = ?auto_1311638 ?auto_1311651 ) ) ( not ( = ?auto_1311639 ?auto_1311636 ) ) ( not ( = ?auto_1311639 ?auto_1311640 ) ) ( not ( = ?auto_1311639 ?auto_1311642 ) ) ( not ( = ?auto_1311639 ?auto_1311641 ) ) ( not ( = ?auto_1311639 ?auto_1311643 ) ) ( not ( = ?auto_1311639 ?auto_1311644 ) ) ( not ( = ?auto_1311639 ?auto_1311645 ) ) ( not ( = ?auto_1311639 ?auto_1311646 ) ) ( not ( = ?auto_1311639 ?auto_1311647 ) ) ( not ( = ?auto_1311639 ?auto_1311648 ) ) ( not ( = ?auto_1311639 ?auto_1311651 ) ) ( not ( = ?auto_1311636 ?auto_1311640 ) ) ( not ( = ?auto_1311636 ?auto_1311642 ) ) ( not ( = ?auto_1311636 ?auto_1311641 ) ) ( not ( = ?auto_1311636 ?auto_1311643 ) ) ( not ( = ?auto_1311636 ?auto_1311644 ) ) ( not ( = ?auto_1311636 ?auto_1311645 ) ) ( not ( = ?auto_1311636 ?auto_1311646 ) ) ( not ( = ?auto_1311636 ?auto_1311647 ) ) ( not ( = ?auto_1311636 ?auto_1311648 ) ) ( not ( = ?auto_1311636 ?auto_1311651 ) ) ( not ( = ?auto_1311640 ?auto_1311642 ) ) ( not ( = ?auto_1311640 ?auto_1311641 ) ) ( not ( = ?auto_1311640 ?auto_1311643 ) ) ( not ( = ?auto_1311640 ?auto_1311644 ) ) ( not ( = ?auto_1311640 ?auto_1311645 ) ) ( not ( = ?auto_1311640 ?auto_1311646 ) ) ( not ( = ?auto_1311640 ?auto_1311647 ) ) ( not ( = ?auto_1311640 ?auto_1311648 ) ) ( not ( = ?auto_1311640 ?auto_1311651 ) ) ( not ( = ?auto_1311642 ?auto_1311641 ) ) ( not ( = ?auto_1311642 ?auto_1311643 ) ) ( not ( = ?auto_1311642 ?auto_1311644 ) ) ( not ( = ?auto_1311642 ?auto_1311645 ) ) ( not ( = ?auto_1311642 ?auto_1311646 ) ) ( not ( = ?auto_1311642 ?auto_1311647 ) ) ( not ( = ?auto_1311642 ?auto_1311648 ) ) ( not ( = ?auto_1311642 ?auto_1311651 ) ) ( not ( = ?auto_1311641 ?auto_1311643 ) ) ( not ( = ?auto_1311641 ?auto_1311644 ) ) ( not ( = ?auto_1311641 ?auto_1311645 ) ) ( not ( = ?auto_1311641 ?auto_1311646 ) ) ( not ( = ?auto_1311641 ?auto_1311647 ) ) ( not ( = ?auto_1311641 ?auto_1311648 ) ) ( not ( = ?auto_1311641 ?auto_1311651 ) ) ( not ( = ?auto_1311643 ?auto_1311644 ) ) ( not ( = ?auto_1311643 ?auto_1311645 ) ) ( not ( = ?auto_1311643 ?auto_1311646 ) ) ( not ( = ?auto_1311643 ?auto_1311647 ) ) ( not ( = ?auto_1311643 ?auto_1311648 ) ) ( not ( = ?auto_1311643 ?auto_1311651 ) ) ( not ( = ?auto_1311644 ?auto_1311645 ) ) ( not ( = ?auto_1311644 ?auto_1311646 ) ) ( not ( = ?auto_1311644 ?auto_1311647 ) ) ( not ( = ?auto_1311644 ?auto_1311648 ) ) ( not ( = ?auto_1311644 ?auto_1311651 ) ) ( not ( = ?auto_1311645 ?auto_1311646 ) ) ( not ( = ?auto_1311645 ?auto_1311647 ) ) ( not ( = ?auto_1311645 ?auto_1311648 ) ) ( not ( = ?auto_1311645 ?auto_1311651 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1311646 ?auto_1311647 ?auto_1311648 )
      ( MAKE-12CRATE-VERIFY ?auto_1311637 ?auto_1311638 ?auto_1311639 ?auto_1311636 ?auto_1311640 ?auto_1311642 ?auto_1311641 ?auto_1311643 ?auto_1311644 ?auto_1311645 ?auto_1311646 ?auto_1311647 ?auto_1311648 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1311656 - SURFACE
      ?auto_1311657 - SURFACE
      ?auto_1311658 - SURFACE
      ?auto_1311655 - SURFACE
      ?auto_1311659 - SURFACE
      ?auto_1311661 - SURFACE
      ?auto_1311660 - SURFACE
      ?auto_1311662 - SURFACE
      ?auto_1311663 - SURFACE
      ?auto_1311664 - SURFACE
      ?auto_1311665 - SURFACE
      ?auto_1311666 - SURFACE
      ?auto_1311667 - SURFACE
      ?auto_1311668 - SURFACE
    )
    :vars
    (
      ?auto_1311673 - HOIST
      ?auto_1311674 - PLACE
      ?auto_1311670 - PLACE
      ?auto_1311672 - HOIST
      ?auto_1311671 - SURFACE
      ?auto_1311669 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1311673 ?auto_1311674 ) ( IS-CRATE ?auto_1311668 ) ( not ( = ?auto_1311667 ?auto_1311668 ) ) ( not ( = ?auto_1311666 ?auto_1311667 ) ) ( not ( = ?auto_1311666 ?auto_1311668 ) ) ( not ( = ?auto_1311670 ?auto_1311674 ) ) ( HOIST-AT ?auto_1311672 ?auto_1311670 ) ( not ( = ?auto_1311673 ?auto_1311672 ) ) ( SURFACE-AT ?auto_1311668 ?auto_1311670 ) ( ON ?auto_1311668 ?auto_1311671 ) ( CLEAR ?auto_1311668 ) ( not ( = ?auto_1311667 ?auto_1311671 ) ) ( not ( = ?auto_1311668 ?auto_1311671 ) ) ( not ( = ?auto_1311666 ?auto_1311671 ) ) ( SURFACE-AT ?auto_1311666 ?auto_1311674 ) ( CLEAR ?auto_1311666 ) ( IS-CRATE ?auto_1311667 ) ( AVAILABLE ?auto_1311673 ) ( TRUCK-AT ?auto_1311669 ?auto_1311670 ) ( LIFTING ?auto_1311672 ?auto_1311667 ) ( ON ?auto_1311657 ?auto_1311656 ) ( ON ?auto_1311658 ?auto_1311657 ) ( ON ?auto_1311655 ?auto_1311658 ) ( ON ?auto_1311659 ?auto_1311655 ) ( ON ?auto_1311661 ?auto_1311659 ) ( ON ?auto_1311660 ?auto_1311661 ) ( ON ?auto_1311662 ?auto_1311660 ) ( ON ?auto_1311663 ?auto_1311662 ) ( ON ?auto_1311664 ?auto_1311663 ) ( ON ?auto_1311665 ?auto_1311664 ) ( ON ?auto_1311666 ?auto_1311665 ) ( not ( = ?auto_1311656 ?auto_1311657 ) ) ( not ( = ?auto_1311656 ?auto_1311658 ) ) ( not ( = ?auto_1311656 ?auto_1311655 ) ) ( not ( = ?auto_1311656 ?auto_1311659 ) ) ( not ( = ?auto_1311656 ?auto_1311661 ) ) ( not ( = ?auto_1311656 ?auto_1311660 ) ) ( not ( = ?auto_1311656 ?auto_1311662 ) ) ( not ( = ?auto_1311656 ?auto_1311663 ) ) ( not ( = ?auto_1311656 ?auto_1311664 ) ) ( not ( = ?auto_1311656 ?auto_1311665 ) ) ( not ( = ?auto_1311656 ?auto_1311666 ) ) ( not ( = ?auto_1311656 ?auto_1311667 ) ) ( not ( = ?auto_1311656 ?auto_1311668 ) ) ( not ( = ?auto_1311656 ?auto_1311671 ) ) ( not ( = ?auto_1311657 ?auto_1311658 ) ) ( not ( = ?auto_1311657 ?auto_1311655 ) ) ( not ( = ?auto_1311657 ?auto_1311659 ) ) ( not ( = ?auto_1311657 ?auto_1311661 ) ) ( not ( = ?auto_1311657 ?auto_1311660 ) ) ( not ( = ?auto_1311657 ?auto_1311662 ) ) ( not ( = ?auto_1311657 ?auto_1311663 ) ) ( not ( = ?auto_1311657 ?auto_1311664 ) ) ( not ( = ?auto_1311657 ?auto_1311665 ) ) ( not ( = ?auto_1311657 ?auto_1311666 ) ) ( not ( = ?auto_1311657 ?auto_1311667 ) ) ( not ( = ?auto_1311657 ?auto_1311668 ) ) ( not ( = ?auto_1311657 ?auto_1311671 ) ) ( not ( = ?auto_1311658 ?auto_1311655 ) ) ( not ( = ?auto_1311658 ?auto_1311659 ) ) ( not ( = ?auto_1311658 ?auto_1311661 ) ) ( not ( = ?auto_1311658 ?auto_1311660 ) ) ( not ( = ?auto_1311658 ?auto_1311662 ) ) ( not ( = ?auto_1311658 ?auto_1311663 ) ) ( not ( = ?auto_1311658 ?auto_1311664 ) ) ( not ( = ?auto_1311658 ?auto_1311665 ) ) ( not ( = ?auto_1311658 ?auto_1311666 ) ) ( not ( = ?auto_1311658 ?auto_1311667 ) ) ( not ( = ?auto_1311658 ?auto_1311668 ) ) ( not ( = ?auto_1311658 ?auto_1311671 ) ) ( not ( = ?auto_1311655 ?auto_1311659 ) ) ( not ( = ?auto_1311655 ?auto_1311661 ) ) ( not ( = ?auto_1311655 ?auto_1311660 ) ) ( not ( = ?auto_1311655 ?auto_1311662 ) ) ( not ( = ?auto_1311655 ?auto_1311663 ) ) ( not ( = ?auto_1311655 ?auto_1311664 ) ) ( not ( = ?auto_1311655 ?auto_1311665 ) ) ( not ( = ?auto_1311655 ?auto_1311666 ) ) ( not ( = ?auto_1311655 ?auto_1311667 ) ) ( not ( = ?auto_1311655 ?auto_1311668 ) ) ( not ( = ?auto_1311655 ?auto_1311671 ) ) ( not ( = ?auto_1311659 ?auto_1311661 ) ) ( not ( = ?auto_1311659 ?auto_1311660 ) ) ( not ( = ?auto_1311659 ?auto_1311662 ) ) ( not ( = ?auto_1311659 ?auto_1311663 ) ) ( not ( = ?auto_1311659 ?auto_1311664 ) ) ( not ( = ?auto_1311659 ?auto_1311665 ) ) ( not ( = ?auto_1311659 ?auto_1311666 ) ) ( not ( = ?auto_1311659 ?auto_1311667 ) ) ( not ( = ?auto_1311659 ?auto_1311668 ) ) ( not ( = ?auto_1311659 ?auto_1311671 ) ) ( not ( = ?auto_1311661 ?auto_1311660 ) ) ( not ( = ?auto_1311661 ?auto_1311662 ) ) ( not ( = ?auto_1311661 ?auto_1311663 ) ) ( not ( = ?auto_1311661 ?auto_1311664 ) ) ( not ( = ?auto_1311661 ?auto_1311665 ) ) ( not ( = ?auto_1311661 ?auto_1311666 ) ) ( not ( = ?auto_1311661 ?auto_1311667 ) ) ( not ( = ?auto_1311661 ?auto_1311668 ) ) ( not ( = ?auto_1311661 ?auto_1311671 ) ) ( not ( = ?auto_1311660 ?auto_1311662 ) ) ( not ( = ?auto_1311660 ?auto_1311663 ) ) ( not ( = ?auto_1311660 ?auto_1311664 ) ) ( not ( = ?auto_1311660 ?auto_1311665 ) ) ( not ( = ?auto_1311660 ?auto_1311666 ) ) ( not ( = ?auto_1311660 ?auto_1311667 ) ) ( not ( = ?auto_1311660 ?auto_1311668 ) ) ( not ( = ?auto_1311660 ?auto_1311671 ) ) ( not ( = ?auto_1311662 ?auto_1311663 ) ) ( not ( = ?auto_1311662 ?auto_1311664 ) ) ( not ( = ?auto_1311662 ?auto_1311665 ) ) ( not ( = ?auto_1311662 ?auto_1311666 ) ) ( not ( = ?auto_1311662 ?auto_1311667 ) ) ( not ( = ?auto_1311662 ?auto_1311668 ) ) ( not ( = ?auto_1311662 ?auto_1311671 ) ) ( not ( = ?auto_1311663 ?auto_1311664 ) ) ( not ( = ?auto_1311663 ?auto_1311665 ) ) ( not ( = ?auto_1311663 ?auto_1311666 ) ) ( not ( = ?auto_1311663 ?auto_1311667 ) ) ( not ( = ?auto_1311663 ?auto_1311668 ) ) ( not ( = ?auto_1311663 ?auto_1311671 ) ) ( not ( = ?auto_1311664 ?auto_1311665 ) ) ( not ( = ?auto_1311664 ?auto_1311666 ) ) ( not ( = ?auto_1311664 ?auto_1311667 ) ) ( not ( = ?auto_1311664 ?auto_1311668 ) ) ( not ( = ?auto_1311664 ?auto_1311671 ) ) ( not ( = ?auto_1311665 ?auto_1311666 ) ) ( not ( = ?auto_1311665 ?auto_1311667 ) ) ( not ( = ?auto_1311665 ?auto_1311668 ) ) ( not ( = ?auto_1311665 ?auto_1311671 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1311666 ?auto_1311667 ?auto_1311668 )
      ( MAKE-13CRATE-VERIFY ?auto_1311656 ?auto_1311657 ?auto_1311658 ?auto_1311655 ?auto_1311659 ?auto_1311661 ?auto_1311660 ?auto_1311662 ?auto_1311663 ?auto_1311664 ?auto_1311665 ?auto_1311666 ?auto_1311667 ?auto_1311668 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1311777 - SURFACE
      ?auto_1311778 - SURFACE
      ?auto_1311779 - SURFACE
      ?auto_1311776 - SURFACE
      ?auto_1311780 - SURFACE
      ?auto_1311782 - SURFACE
      ?auto_1311781 - SURFACE
      ?auto_1311783 - SURFACE
      ?auto_1311784 - SURFACE
      ?auto_1311785 - SURFACE
    )
    :vars
    (
      ?auto_1311786 - HOIST
      ?auto_1311789 - PLACE
      ?auto_1311791 - PLACE
      ?auto_1311792 - HOIST
      ?auto_1311790 - SURFACE
      ?auto_1311788 - TRUCK
      ?auto_1311787 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1311786 ?auto_1311789 ) ( IS-CRATE ?auto_1311785 ) ( not ( = ?auto_1311784 ?auto_1311785 ) ) ( not ( = ?auto_1311783 ?auto_1311784 ) ) ( not ( = ?auto_1311783 ?auto_1311785 ) ) ( not ( = ?auto_1311791 ?auto_1311789 ) ) ( HOIST-AT ?auto_1311792 ?auto_1311791 ) ( not ( = ?auto_1311786 ?auto_1311792 ) ) ( SURFACE-AT ?auto_1311785 ?auto_1311791 ) ( ON ?auto_1311785 ?auto_1311790 ) ( CLEAR ?auto_1311785 ) ( not ( = ?auto_1311784 ?auto_1311790 ) ) ( not ( = ?auto_1311785 ?auto_1311790 ) ) ( not ( = ?auto_1311783 ?auto_1311790 ) ) ( SURFACE-AT ?auto_1311783 ?auto_1311789 ) ( CLEAR ?auto_1311783 ) ( IS-CRATE ?auto_1311784 ) ( AVAILABLE ?auto_1311786 ) ( TRUCK-AT ?auto_1311788 ?auto_1311791 ) ( AVAILABLE ?auto_1311792 ) ( SURFACE-AT ?auto_1311784 ?auto_1311791 ) ( ON ?auto_1311784 ?auto_1311787 ) ( CLEAR ?auto_1311784 ) ( not ( = ?auto_1311784 ?auto_1311787 ) ) ( not ( = ?auto_1311785 ?auto_1311787 ) ) ( not ( = ?auto_1311783 ?auto_1311787 ) ) ( not ( = ?auto_1311790 ?auto_1311787 ) ) ( ON ?auto_1311778 ?auto_1311777 ) ( ON ?auto_1311779 ?auto_1311778 ) ( ON ?auto_1311776 ?auto_1311779 ) ( ON ?auto_1311780 ?auto_1311776 ) ( ON ?auto_1311782 ?auto_1311780 ) ( ON ?auto_1311781 ?auto_1311782 ) ( ON ?auto_1311783 ?auto_1311781 ) ( not ( = ?auto_1311777 ?auto_1311778 ) ) ( not ( = ?auto_1311777 ?auto_1311779 ) ) ( not ( = ?auto_1311777 ?auto_1311776 ) ) ( not ( = ?auto_1311777 ?auto_1311780 ) ) ( not ( = ?auto_1311777 ?auto_1311782 ) ) ( not ( = ?auto_1311777 ?auto_1311781 ) ) ( not ( = ?auto_1311777 ?auto_1311783 ) ) ( not ( = ?auto_1311777 ?auto_1311784 ) ) ( not ( = ?auto_1311777 ?auto_1311785 ) ) ( not ( = ?auto_1311777 ?auto_1311790 ) ) ( not ( = ?auto_1311777 ?auto_1311787 ) ) ( not ( = ?auto_1311778 ?auto_1311779 ) ) ( not ( = ?auto_1311778 ?auto_1311776 ) ) ( not ( = ?auto_1311778 ?auto_1311780 ) ) ( not ( = ?auto_1311778 ?auto_1311782 ) ) ( not ( = ?auto_1311778 ?auto_1311781 ) ) ( not ( = ?auto_1311778 ?auto_1311783 ) ) ( not ( = ?auto_1311778 ?auto_1311784 ) ) ( not ( = ?auto_1311778 ?auto_1311785 ) ) ( not ( = ?auto_1311778 ?auto_1311790 ) ) ( not ( = ?auto_1311778 ?auto_1311787 ) ) ( not ( = ?auto_1311779 ?auto_1311776 ) ) ( not ( = ?auto_1311779 ?auto_1311780 ) ) ( not ( = ?auto_1311779 ?auto_1311782 ) ) ( not ( = ?auto_1311779 ?auto_1311781 ) ) ( not ( = ?auto_1311779 ?auto_1311783 ) ) ( not ( = ?auto_1311779 ?auto_1311784 ) ) ( not ( = ?auto_1311779 ?auto_1311785 ) ) ( not ( = ?auto_1311779 ?auto_1311790 ) ) ( not ( = ?auto_1311779 ?auto_1311787 ) ) ( not ( = ?auto_1311776 ?auto_1311780 ) ) ( not ( = ?auto_1311776 ?auto_1311782 ) ) ( not ( = ?auto_1311776 ?auto_1311781 ) ) ( not ( = ?auto_1311776 ?auto_1311783 ) ) ( not ( = ?auto_1311776 ?auto_1311784 ) ) ( not ( = ?auto_1311776 ?auto_1311785 ) ) ( not ( = ?auto_1311776 ?auto_1311790 ) ) ( not ( = ?auto_1311776 ?auto_1311787 ) ) ( not ( = ?auto_1311780 ?auto_1311782 ) ) ( not ( = ?auto_1311780 ?auto_1311781 ) ) ( not ( = ?auto_1311780 ?auto_1311783 ) ) ( not ( = ?auto_1311780 ?auto_1311784 ) ) ( not ( = ?auto_1311780 ?auto_1311785 ) ) ( not ( = ?auto_1311780 ?auto_1311790 ) ) ( not ( = ?auto_1311780 ?auto_1311787 ) ) ( not ( = ?auto_1311782 ?auto_1311781 ) ) ( not ( = ?auto_1311782 ?auto_1311783 ) ) ( not ( = ?auto_1311782 ?auto_1311784 ) ) ( not ( = ?auto_1311782 ?auto_1311785 ) ) ( not ( = ?auto_1311782 ?auto_1311790 ) ) ( not ( = ?auto_1311782 ?auto_1311787 ) ) ( not ( = ?auto_1311781 ?auto_1311783 ) ) ( not ( = ?auto_1311781 ?auto_1311784 ) ) ( not ( = ?auto_1311781 ?auto_1311785 ) ) ( not ( = ?auto_1311781 ?auto_1311790 ) ) ( not ( = ?auto_1311781 ?auto_1311787 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1311783 ?auto_1311784 ?auto_1311785 )
      ( MAKE-9CRATE-VERIFY ?auto_1311777 ?auto_1311778 ?auto_1311779 ?auto_1311776 ?auto_1311780 ?auto_1311782 ?auto_1311781 ?auto_1311783 ?auto_1311784 ?auto_1311785 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1311794 - SURFACE
      ?auto_1311795 - SURFACE
      ?auto_1311796 - SURFACE
      ?auto_1311793 - SURFACE
      ?auto_1311797 - SURFACE
      ?auto_1311799 - SURFACE
      ?auto_1311798 - SURFACE
      ?auto_1311800 - SURFACE
      ?auto_1311801 - SURFACE
      ?auto_1311802 - SURFACE
      ?auto_1311803 - SURFACE
    )
    :vars
    (
      ?auto_1311804 - HOIST
      ?auto_1311807 - PLACE
      ?auto_1311809 - PLACE
      ?auto_1311810 - HOIST
      ?auto_1311808 - SURFACE
      ?auto_1311806 - TRUCK
      ?auto_1311805 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1311804 ?auto_1311807 ) ( IS-CRATE ?auto_1311803 ) ( not ( = ?auto_1311802 ?auto_1311803 ) ) ( not ( = ?auto_1311801 ?auto_1311802 ) ) ( not ( = ?auto_1311801 ?auto_1311803 ) ) ( not ( = ?auto_1311809 ?auto_1311807 ) ) ( HOIST-AT ?auto_1311810 ?auto_1311809 ) ( not ( = ?auto_1311804 ?auto_1311810 ) ) ( SURFACE-AT ?auto_1311803 ?auto_1311809 ) ( ON ?auto_1311803 ?auto_1311808 ) ( CLEAR ?auto_1311803 ) ( not ( = ?auto_1311802 ?auto_1311808 ) ) ( not ( = ?auto_1311803 ?auto_1311808 ) ) ( not ( = ?auto_1311801 ?auto_1311808 ) ) ( SURFACE-AT ?auto_1311801 ?auto_1311807 ) ( CLEAR ?auto_1311801 ) ( IS-CRATE ?auto_1311802 ) ( AVAILABLE ?auto_1311804 ) ( TRUCK-AT ?auto_1311806 ?auto_1311809 ) ( AVAILABLE ?auto_1311810 ) ( SURFACE-AT ?auto_1311802 ?auto_1311809 ) ( ON ?auto_1311802 ?auto_1311805 ) ( CLEAR ?auto_1311802 ) ( not ( = ?auto_1311802 ?auto_1311805 ) ) ( not ( = ?auto_1311803 ?auto_1311805 ) ) ( not ( = ?auto_1311801 ?auto_1311805 ) ) ( not ( = ?auto_1311808 ?auto_1311805 ) ) ( ON ?auto_1311795 ?auto_1311794 ) ( ON ?auto_1311796 ?auto_1311795 ) ( ON ?auto_1311793 ?auto_1311796 ) ( ON ?auto_1311797 ?auto_1311793 ) ( ON ?auto_1311799 ?auto_1311797 ) ( ON ?auto_1311798 ?auto_1311799 ) ( ON ?auto_1311800 ?auto_1311798 ) ( ON ?auto_1311801 ?auto_1311800 ) ( not ( = ?auto_1311794 ?auto_1311795 ) ) ( not ( = ?auto_1311794 ?auto_1311796 ) ) ( not ( = ?auto_1311794 ?auto_1311793 ) ) ( not ( = ?auto_1311794 ?auto_1311797 ) ) ( not ( = ?auto_1311794 ?auto_1311799 ) ) ( not ( = ?auto_1311794 ?auto_1311798 ) ) ( not ( = ?auto_1311794 ?auto_1311800 ) ) ( not ( = ?auto_1311794 ?auto_1311801 ) ) ( not ( = ?auto_1311794 ?auto_1311802 ) ) ( not ( = ?auto_1311794 ?auto_1311803 ) ) ( not ( = ?auto_1311794 ?auto_1311808 ) ) ( not ( = ?auto_1311794 ?auto_1311805 ) ) ( not ( = ?auto_1311795 ?auto_1311796 ) ) ( not ( = ?auto_1311795 ?auto_1311793 ) ) ( not ( = ?auto_1311795 ?auto_1311797 ) ) ( not ( = ?auto_1311795 ?auto_1311799 ) ) ( not ( = ?auto_1311795 ?auto_1311798 ) ) ( not ( = ?auto_1311795 ?auto_1311800 ) ) ( not ( = ?auto_1311795 ?auto_1311801 ) ) ( not ( = ?auto_1311795 ?auto_1311802 ) ) ( not ( = ?auto_1311795 ?auto_1311803 ) ) ( not ( = ?auto_1311795 ?auto_1311808 ) ) ( not ( = ?auto_1311795 ?auto_1311805 ) ) ( not ( = ?auto_1311796 ?auto_1311793 ) ) ( not ( = ?auto_1311796 ?auto_1311797 ) ) ( not ( = ?auto_1311796 ?auto_1311799 ) ) ( not ( = ?auto_1311796 ?auto_1311798 ) ) ( not ( = ?auto_1311796 ?auto_1311800 ) ) ( not ( = ?auto_1311796 ?auto_1311801 ) ) ( not ( = ?auto_1311796 ?auto_1311802 ) ) ( not ( = ?auto_1311796 ?auto_1311803 ) ) ( not ( = ?auto_1311796 ?auto_1311808 ) ) ( not ( = ?auto_1311796 ?auto_1311805 ) ) ( not ( = ?auto_1311793 ?auto_1311797 ) ) ( not ( = ?auto_1311793 ?auto_1311799 ) ) ( not ( = ?auto_1311793 ?auto_1311798 ) ) ( not ( = ?auto_1311793 ?auto_1311800 ) ) ( not ( = ?auto_1311793 ?auto_1311801 ) ) ( not ( = ?auto_1311793 ?auto_1311802 ) ) ( not ( = ?auto_1311793 ?auto_1311803 ) ) ( not ( = ?auto_1311793 ?auto_1311808 ) ) ( not ( = ?auto_1311793 ?auto_1311805 ) ) ( not ( = ?auto_1311797 ?auto_1311799 ) ) ( not ( = ?auto_1311797 ?auto_1311798 ) ) ( not ( = ?auto_1311797 ?auto_1311800 ) ) ( not ( = ?auto_1311797 ?auto_1311801 ) ) ( not ( = ?auto_1311797 ?auto_1311802 ) ) ( not ( = ?auto_1311797 ?auto_1311803 ) ) ( not ( = ?auto_1311797 ?auto_1311808 ) ) ( not ( = ?auto_1311797 ?auto_1311805 ) ) ( not ( = ?auto_1311799 ?auto_1311798 ) ) ( not ( = ?auto_1311799 ?auto_1311800 ) ) ( not ( = ?auto_1311799 ?auto_1311801 ) ) ( not ( = ?auto_1311799 ?auto_1311802 ) ) ( not ( = ?auto_1311799 ?auto_1311803 ) ) ( not ( = ?auto_1311799 ?auto_1311808 ) ) ( not ( = ?auto_1311799 ?auto_1311805 ) ) ( not ( = ?auto_1311798 ?auto_1311800 ) ) ( not ( = ?auto_1311798 ?auto_1311801 ) ) ( not ( = ?auto_1311798 ?auto_1311802 ) ) ( not ( = ?auto_1311798 ?auto_1311803 ) ) ( not ( = ?auto_1311798 ?auto_1311808 ) ) ( not ( = ?auto_1311798 ?auto_1311805 ) ) ( not ( = ?auto_1311800 ?auto_1311801 ) ) ( not ( = ?auto_1311800 ?auto_1311802 ) ) ( not ( = ?auto_1311800 ?auto_1311803 ) ) ( not ( = ?auto_1311800 ?auto_1311808 ) ) ( not ( = ?auto_1311800 ?auto_1311805 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1311801 ?auto_1311802 ?auto_1311803 )
      ( MAKE-10CRATE-VERIFY ?auto_1311794 ?auto_1311795 ?auto_1311796 ?auto_1311793 ?auto_1311797 ?auto_1311799 ?auto_1311798 ?auto_1311800 ?auto_1311801 ?auto_1311802 ?auto_1311803 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1311812 - SURFACE
      ?auto_1311813 - SURFACE
      ?auto_1311814 - SURFACE
      ?auto_1311811 - SURFACE
      ?auto_1311815 - SURFACE
      ?auto_1311817 - SURFACE
      ?auto_1311816 - SURFACE
      ?auto_1311818 - SURFACE
      ?auto_1311819 - SURFACE
      ?auto_1311820 - SURFACE
      ?auto_1311821 - SURFACE
      ?auto_1311822 - SURFACE
    )
    :vars
    (
      ?auto_1311823 - HOIST
      ?auto_1311826 - PLACE
      ?auto_1311828 - PLACE
      ?auto_1311829 - HOIST
      ?auto_1311827 - SURFACE
      ?auto_1311825 - TRUCK
      ?auto_1311824 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1311823 ?auto_1311826 ) ( IS-CRATE ?auto_1311822 ) ( not ( = ?auto_1311821 ?auto_1311822 ) ) ( not ( = ?auto_1311820 ?auto_1311821 ) ) ( not ( = ?auto_1311820 ?auto_1311822 ) ) ( not ( = ?auto_1311828 ?auto_1311826 ) ) ( HOIST-AT ?auto_1311829 ?auto_1311828 ) ( not ( = ?auto_1311823 ?auto_1311829 ) ) ( SURFACE-AT ?auto_1311822 ?auto_1311828 ) ( ON ?auto_1311822 ?auto_1311827 ) ( CLEAR ?auto_1311822 ) ( not ( = ?auto_1311821 ?auto_1311827 ) ) ( not ( = ?auto_1311822 ?auto_1311827 ) ) ( not ( = ?auto_1311820 ?auto_1311827 ) ) ( SURFACE-AT ?auto_1311820 ?auto_1311826 ) ( CLEAR ?auto_1311820 ) ( IS-CRATE ?auto_1311821 ) ( AVAILABLE ?auto_1311823 ) ( TRUCK-AT ?auto_1311825 ?auto_1311828 ) ( AVAILABLE ?auto_1311829 ) ( SURFACE-AT ?auto_1311821 ?auto_1311828 ) ( ON ?auto_1311821 ?auto_1311824 ) ( CLEAR ?auto_1311821 ) ( not ( = ?auto_1311821 ?auto_1311824 ) ) ( not ( = ?auto_1311822 ?auto_1311824 ) ) ( not ( = ?auto_1311820 ?auto_1311824 ) ) ( not ( = ?auto_1311827 ?auto_1311824 ) ) ( ON ?auto_1311813 ?auto_1311812 ) ( ON ?auto_1311814 ?auto_1311813 ) ( ON ?auto_1311811 ?auto_1311814 ) ( ON ?auto_1311815 ?auto_1311811 ) ( ON ?auto_1311817 ?auto_1311815 ) ( ON ?auto_1311816 ?auto_1311817 ) ( ON ?auto_1311818 ?auto_1311816 ) ( ON ?auto_1311819 ?auto_1311818 ) ( ON ?auto_1311820 ?auto_1311819 ) ( not ( = ?auto_1311812 ?auto_1311813 ) ) ( not ( = ?auto_1311812 ?auto_1311814 ) ) ( not ( = ?auto_1311812 ?auto_1311811 ) ) ( not ( = ?auto_1311812 ?auto_1311815 ) ) ( not ( = ?auto_1311812 ?auto_1311817 ) ) ( not ( = ?auto_1311812 ?auto_1311816 ) ) ( not ( = ?auto_1311812 ?auto_1311818 ) ) ( not ( = ?auto_1311812 ?auto_1311819 ) ) ( not ( = ?auto_1311812 ?auto_1311820 ) ) ( not ( = ?auto_1311812 ?auto_1311821 ) ) ( not ( = ?auto_1311812 ?auto_1311822 ) ) ( not ( = ?auto_1311812 ?auto_1311827 ) ) ( not ( = ?auto_1311812 ?auto_1311824 ) ) ( not ( = ?auto_1311813 ?auto_1311814 ) ) ( not ( = ?auto_1311813 ?auto_1311811 ) ) ( not ( = ?auto_1311813 ?auto_1311815 ) ) ( not ( = ?auto_1311813 ?auto_1311817 ) ) ( not ( = ?auto_1311813 ?auto_1311816 ) ) ( not ( = ?auto_1311813 ?auto_1311818 ) ) ( not ( = ?auto_1311813 ?auto_1311819 ) ) ( not ( = ?auto_1311813 ?auto_1311820 ) ) ( not ( = ?auto_1311813 ?auto_1311821 ) ) ( not ( = ?auto_1311813 ?auto_1311822 ) ) ( not ( = ?auto_1311813 ?auto_1311827 ) ) ( not ( = ?auto_1311813 ?auto_1311824 ) ) ( not ( = ?auto_1311814 ?auto_1311811 ) ) ( not ( = ?auto_1311814 ?auto_1311815 ) ) ( not ( = ?auto_1311814 ?auto_1311817 ) ) ( not ( = ?auto_1311814 ?auto_1311816 ) ) ( not ( = ?auto_1311814 ?auto_1311818 ) ) ( not ( = ?auto_1311814 ?auto_1311819 ) ) ( not ( = ?auto_1311814 ?auto_1311820 ) ) ( not ( = ?auto_1311814 ?auto_1311821 ) ) ( not ( = ?auto_1311814 ?auto_1311822 ) ) ( not ( = ?auto_1311814 ?auto_1311827 ) ) ( not ( = ?auto_1311814 ?auto_1311824 ) ) ( not ( = ?auto_1311811 ?auto_1311815 ) ) ( not ( = ?auto_1311811 ?auto_1311817 ) ) ( not ( = ?auto_1311811 ?auto_1311816 ) ) ( not ( = ?auto_1311811 ?auto_1311818 ) ) ( not ( = ?auto_1311811 ?auto_1311819 ) ) ( not ( = ?auto_1311811 ?auto_1311820 ) ) ( not ( = ?auto_1311811 ?auto_1311821 ) ) ( not ( = ?auto_1311811 ?auto_1311822 ) ) ( not ( = ?auto_1311811 ?auto_1311827 ) ) ( not ( = ?auto_1311811 ?auto_1311824 ) ) ( not ( = ?auto_1311815 ?auto_1311817 ) ) ( not ( = ?auto_1311815 ?auto_1311816 ) ) ( not ( = ?auto_1311815 ?auto_1311818 ) ) ( not ( = ?auto_1311815 ?auto_1311819 ) ) ( not ( = ?auto_1311815 ?auto_1311820 ) ) ( not ( = ?auto_1311815 ?auto_1311821 ) ) ( not ( = ?auto_1311815 ?auto_1311822 ) ) ( not ( = ?auto_1311815 ?auto_1311827 ) ) ( not ( = ?auto_1311815 ?auto_1311824 ) ) ( not ( = ?auto_1311817 ?auto_1311816 ) ) ( not ( = ?auto_1311817 ?auto_1311818 ) ) ( not ( = ?auto_1311817 ?auto_1311819 ) ) ( not ( = ?auto_1311817 ?auto_1311820 ) ) ( not ( = ?auto_1311817 ?auto_1311821 ) ) ( not ( = ?auto_1311817 ?auto_1311822 ) ) ( not ( = ?auto_1311817 ?auto_1311827 ) ) ( not ( = ?auto_1311817 ?auto_1311824 ) ) ( not ( = ?auto_1311816 ?auto_1311818 ) ) ( not ( = ?auto_1311816 ?auto_1311819 ) ) ( not ( = ?auto_1311816 ?auto_1311820 ) ) ( not ( = ?auto_1311816 ?auto_1311821 ) ) ( not ( = ?auto_1311816 ?auto_1311822 ) ) ( not ( = ?auto_1311816 ?auto_1311827 ) ) ( not ( = ?auto_1311816 ?auto_1311824 ) ) ( not ( = ?auto_1311818 ?auto_1311819 ) ) ( not ( = ?auto_1311818 ?auto_1311820 ) ) ( not ( = ?auto_1311818 ?auto_1311821 ) ) ( not ( = ?auto_1311818 ?auto_1311822 ) ) ( not ( = ?auto_1311818 ?auto_1311827 ) ) ( not ( = ?auto_1311818 ?auto_1311824 ) ) ( not ( = ?auto_1311819 ?auto_1311820 ) ) ( not ( = ?auto_1311819 ?auto_1311821 ) ) ( not ( = ?auto_1311819 ?auto_1311822 ) ) ( not ( = ?auto_1311819 ?auto_1311827 ) ) ( not ( = ?auto_1311819 ?auto_1311824 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1311820 ?auto_1311821 ?auto_1311822 )
      ( MAKE-11CRATE-VERIFY ?auto_1311812 ?auto_1311813 ?auto_1311814 ?auto_1311811 ?auto_1311815 ?auto_1311817 ?auto_1311816 ?auto_1311818 ?auto_1311819 ?auto_1311820 ?auto_1311821 ?auto_1311822 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1311831 - SURFACE
      ?auto_1311832 - SURFACE
      ?auto_1311833 - SURFACE
      ?auto_1311830 - SURFACE
      ?auto_1311834 - SURFACE
      ?auto_1311836 - SURFACE
      ?auto_1311835 - SURFACE
      ?auto_1311837 - SURFACE
      ?auto_1311838 - SURFACE
      ?auto_1311839 - SURFACE
      ?auto_1311840 - SURFACE
      ?auto_1311841 - SURFACE
      ?auto_1311842 - SURFACE
    )
    :vars
    (
      ?auto_1311843 - HOIST
      ?auto_1311846 - PLACE
      ?auto_1311848 - PLACE
      ?auto_1311849 - HOIST
      ?auto_1311847 - SURFACE
      ?auto_1311845 - TRUCK
      ?auto_1311844 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1311843 ?auto_1311846 ) ( IS-CRATE ?auto_1311842 ) ( not ( = ?auto_1311841 ?auto_1311842 ) ) ( not ( = ?auto_1311840 ?auto_1311841 ) ) ( not ( = ?auto_1311840 ?auto_1311842 ) ) ( not ( = ?auto_1311848 ?auto_1311846 ) ) ( HOIST-AT ?auto_1311849 ?auto_1311848 ) ( not ( = ?auto_1311843 ?auto_1311849 ) ) ( SURFACE-AT ?auto_1311842 ?auto_1311848 ) ( ON ?auto_1311842 ?auto_1311847 ) ( CLEAR ?auto_1311842 ) ( not ( = ?auto_1311841 ?auto_1311847 ) ) ( not ( = ?auto_1311842 ?auto_1311847 ) ) ( not ( = ?auto_1311840 ?auto_1311847 ) ) ( SURFACE-AT ?auto_1311840 ?auto_1311846 ) ( CLEAR ?auto_1311840 ) ( IS-CRATE ?auto_1311841 ) ( AVAILABLE ?auto_1311843 ) ( TRUCK-AT ?auto_1311845 ?auto_1311848 ) ( AVAILABLE ?auto_1311849 ) ( SURFACE-AT ?auto_1311841 ?auto_1311848 ) ( ON ?auto_1311841 ?auto_1311844 ) ( CLEAR ?auto_1311841 ) ( not ( = ?auto_1311841 ?auto_1311844 ) ) ( not ( = ?auto_1311842 ?auto_1311844 ) ) ( not ( = ?auto_1311840 ?auto_1311844 ) ) ( not ( = ?auto_1311847 ?auto_1311844 ) ) ( ON ?auto_1311832 ?auto_1311831 ) ( ON ?auto_1311833 ?auto_1311832 ) ( ON ?auto_1311830 ?auto_1311833 ) ( ON ?auto_1311834 ?auto_1311830 ) ( ON ?auto_1311836 ?auto_1311834 ) ( ON ?auto_1311835 ?auto_1311836 ) ( ON ?auto_1311837 ?auto_1311835 ) ( ON ?auto_1311838 ?auto_1311837 ) ( ON ?auto_1311839 ?auto_1311838 ) ( ON ?auto_1311840 ?auto_1311839 ) ( not ( = ?auto_1311831 ?auto_1311832 ) ) ( not ( = ?auto_1311831 ?auto_1311833 ) ) ( not ( = ?auto_1311831 ?auto_1311830 ) ) ( not ( = ?auto_1311831 ?auto_1311834 ) ) ( not ( = ?auto_1311831 ?auto_1311836 ) ) ( not ( = ?auto_1311831 ?auto_1311835 ) ) ( not ( = ?auto_1311831 ?auto_1311837 ) ) ( not ( = ?auto_1311831 ?auto_1311838 ) ) ( not ( = ?auto_1311831 ?auto_1311839 ) ) ( not ( = ?auto_1311831 ?auto_1311840 ) ) ( not ( = ?auto_1311831 ?auto_1311841 ) ) ( not ( = ?auto_1311831 ?auto_1311842 ) ) ( not ( = ?auto_1311831 ?auto_1311847 ) ) ( not ( = ?auto_1311831 ?auto_1311844 ) ) ( not ( = ?auto_1311832 ?auto_1311833 ) ) ( not ( = ?auto_1311832 ?auto_1311830 ) ) ( not ( = ?auto_1311832 ?auto_1311834 ) ) ( not ( = ?auto_1311832 ?auto_1311836 ) ) ( not ( = ?auto_1311832 ?auto_1311835 ) ) ( not ( = ?auto_1311832 ?auto_1311837 ) ) ( not ( = ?auto_1311832 ?auto_1311838 ) ) ( not ( = ?auto_1311832 ?auto_1311839 ) ) ( not ( = ?auto_1311832 ?auto_1311840 ) ) ( not ( = ?auto_1311832 ?auto_1311841 ) ) ( not ( = ?auto_1311832 ?auto_1311842 ) ) ( not ( = ?auto_1311832 ?auto_1311847 ) ) ( not ( = ?auto_1311832 ?auto_1311844 ) ) ( not ( = ?auto_1311833 ?auto_1311830 ) ) ( not ( = ?auto_1311833 ?auto_1311834 ) ) ( not ( = ?auto_1311833 ?auto_1311836 ) ) ( not ( = ?auto_1311833 ?auto_1311835 ) ) ( not ( = ?auto_1311833 ?auto_1311837 ) ) ( not ( = ?auto_1311833 ?auto_1311838 ) ) ( not ( = ?auto_1311833 ?auto_1311839 ) ) ( not ( = ?auto_1311833 ?auto_1311840 ) ) ( not ( = ?auto_1311833 ?auto_1311841 ) ) ( not ( = ?auto_1311833 ?auto_1311842 ) ) ( not ( = ?auto_1311833 ?auto_1311847 ) ) ( not ( = ?auto_1311833 ?auto_1311844 ) ) ( not ( = ?auto_1311830 ?auto_1311834 ) ) ( not ( = ?auto_1311830 ?auto_1311836 ) ) ( not ( = ?auto_1311830 ?auto_1311835 ) ) ( not ( = ?auto_1311830 ?auto_1311837 ) ) ( not ( = ?auto_1311830 ?auto_1311838 ) ) ( not ( = ?auto_1311830 ?auto_1311839 ) ) ( not ( = ?auto_1311830 ?auto_1311840 ) ) ( not ( = ?auto_1311830 ?auto_1311841 ) ) ( not ( = ?auto_1311830 ?auto_1311842 ) ) ( not ( = ?auto_1311830 ?auto_1311847 ) ) ( not ( = ?auto_1311830 ?auto_1311844 ) ) ( not ( = ?auto_1311834 ?auto_1311836 ) ) ( not ( = ?auto_1311834 ?auto_1311835 ) ) ( not ( = ?auto_1311834 ?auto_1311837 ) ) ( not ( = ?auto_1311834 ?auto_1311838 ) ) ( not ( = ?auto_1311834 ?auto_1311839 ) ) ( not ( = ?auto_1311834 ?auto_1311840 ) ) ( not ( = ?auto_1311834 ?auto_1311841 ) ) ( not ( = ?auto_1311834 ?auto_1311842 ) ) ( not ( = ?auto_1311834 ?auto_1311847 ) ) ( not ( = ?auto_1311834 ?auto_1311844 ) ) ( not ( = ?auto_1311836 ?auto_1311835 ) ) ( not ( = ?auto_1311836 ?auto_1311837 ) ) ( not ( = ?auto_1311836 ?auto_1311838 ) ) ( not ( = ?auto_1311836 ?auto_1311839 ) ) ( not ( = ?auto_1311836 ?auto_1311840 ) ) ( not ( = ?auto_1311836 ?auto_1311841 ) ) ( not ( = ?auto_1311836 ?auto_1311842 ) ) ( not ( = ?auto_1311836 ?auto_1311847 ) ) ( not ( = ?auto_1311836 ?auto_1311844 ) ) ( not ( = ?auto_1311835 ?auto_1311837 ) ) ( not ( = ?auto_1311835 ?auto_1311838 ) ) ( not ( = ?auto_1311835 ?auto_1311839 ) ) ( not ( = ?auto_1311835 ?auto_1311840 ) ) ( not ( = ?auto_1311835 ?auto_1311841 ) ) ( not ( = ?auto_1311835 ?auto_1311842 ) ) ( not ( = ?auto_1311835 ?auto_1311847 ) ) ( not ( = ?auto_1311835 ?auto_1311844 ) ) ( not ( = ?auto_1311837 ?auto_1311838 ) ) ( not ( = ?auto_1311837 ?auto_1311839 ) ) ( not ( = ?auto_1311837 ?auto_1311840 ) ) ( not ( = ?auto_1311837 ?auto_1311841 ) ) ( not ( = ?auto_1311837 ?auto_1311842 ) ) ( not ( = ?auto_1311837 ?auto_1311847 ) ) ( not ( = ?auto_1311837 ?auto_1311844 ) ) ( not ( = ?auto_1311838 ?auto_1311839 ) ) ( not ( = ?auto_1311838 ?auto_1311840 ) ) ( not ( = ?auto_1311838 ?auto_1311841 ) ) ( not ( = ?auto_1311838 ?auto_1311842 ) ) ( not ( = ?auto_1311838 ?auto_1311847 ) ) ( not ( = ?auto_1311838 ?auto_1311844 ) ) ( not ( = ?auto_1311839 ?auto_1311840 ) ) ( not ( = ?auto_1311839 ?auto_1311841 ) ) ( not ( = ?auto_1311839 ?auto_1311842 ) ) ( not ( = ?auto_1311839 ?auto_1311847 ) ) ( not ( = ?auto_1311839 ?auto_1311844 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1311840 ?auto_1311841 ?auto_1311842 )
      ( MAKE-12CRATE-VERIFY ?auto_1311831 ?auto_1311832 ?auto_1311833 ?auto_1311830 ?auto_1311834 ?auto_1311836 ?auto_1311835 ?auto_1311837 ?auto_1311838 ?auto_1311839 ?auto_1311840 ?auto_1311841 ?auto_1311842 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1311851 - SURFACE
      ?auto_1311852 - SURFACE
      ?auto_1311853 - SURFACE
      ?auto_1311850 - SURFACE
      ?auto_1311854 - SURFACE
      ?auto_1311856 - SURFACE
      ?auto_1311855 - SURFACE
      ?auto_1311857 - SURFACE
      ?auto_1311858 - SURFACE
      ?auto_1311859 - SURFACE
      ?auto_1311860 - SURFACE
      ?auto_1311861 - SURFACE
      ?auto_1311862 - SURFACE
      ?auto_1311863 - SURFACE
    )
    :vars
    (
      ?auto_1311864 - HOIST
      ?auto_1311867 - PLACE
      ?auto_1311869 - PLACE
      ?auto_1311870 - HOIST
      ?auto_1311868 - SURFACE
      ?auto_1311866 - TRUCK
      ?auto_1311865 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1311864 ?auto_1311867 ) ( IS-CRATE ?auto_1311863 ) ( not ( = ?auto_1311862 ?auto_1311863 ) ) ( not ( = ?auto_1311861 ?auto_1311862 ) ) ( not ( = ?auto_1311861 ?auto_1311863 ) ) ( not ( = ?auto_1311869 ?auto_1311867 ) ) ( HOIST-AT ?auto_1311870 ?auto_1311869 ) ( not ( = ?auto_1311864 ?auto_1311870 ) ) ( SURFACE-AT ?auto_1311863 ?auto_1311869 ) ( ON ?auto_1311863 ?auto_1311868 ) ( CLEAR ?auto_1311863 ) ( not ( = ?auto_1311862 ?auto_1311868 ) ) ( not ( = ?auto_1311863 ?auto_1311868 ) ) ( not ( = ?auto_1311861 ?auto_1311868 ) ) ( SURFACE-AT ?auto_1311861 ?auto_1311867 ) ( CLEAR ?auto_1311861 ) ( IS-CRATE ?auto_1311862 ) ( AVAILABLE ?auto_1311864 ) ( TRUCK-AT ?auto_1311866 ?auto_1311869 ) ( AVAILABLE ?auto_1311870 ) ( SURFACE-AT ?auto_1311862 ?auto_1311869 ) ( ON ?auto_1311862 ?auto_1311865 ) ( CLEAR ?auto_1311862 ) ( not ( = ?auto_1311862 ?auto_1311865 ) ) ( not ( = ?auto_1311863 ?auto_1311865 ) ) ( not ( = ?auto_1311861 ?auto_1311865 ) ) ( not ( = ?auto_1311868 ?auto_1311865 ) ) ( ON ?auto_1311852 ?auto_1311851 ) ( ON ?auto_1311853 ?auto_1311852 ) ( ON ?auto_1311850 ?auto_1311853 ) ( ON ?auto_1311854 ?auto_1311850 ) ( ON ?auto_1311856 ?auto_1311854 ) ( ON ?auto_1311855 ?auto_1311856 ) ( ON ?auto_1311857 ?auto_1311855 ) ( ON ?auto_1311858 ?auto_1311857 ) ( ON ?auto_1311859 ?auto_1311858 ) ( ON ?auto_1311860 ?auto_1311859 ) ( ON ?auto_1311861 ?auto_1311860 ) ( not ( = ?auto_1311851 ?auto_1311852 ) ) ( not ( = ?auto_1311851 ?auto_1311853 ) ) ( not ( = ?auto_1311851 ?auto_1311850 ) ) ( not ( = ?auto_1311851 ?auto_1311854 ) ) ( not ( = ?auto_1311851 ?auto_1311856 ) ) ( not ( = ?auto_1311851 ?auto_1311855 ) ) ( not ( = ?auto_1311851 ?auto_1311857 ) ) ( not ( = ?auto_1311851 ?auto_1311858 ) ) ( not ( = ?auto_1311851 ?auto_1311859 ) ) ( not ( = ?auto_1311851 ?auto_1311860 ) ) ( not ( = ?auto_1311851 ?auto_1311861 ) ) ( not ( = ?auto_1311851 ?auto_1311862 ) ) ( not ( = ?auto_1311851 ?auto_1311863 ) ) ( not ( = ?auto_1311851 ?auto_1311868 ) ) ( not ( = ?auto_1311851 ?auto_1311865 ) ) ( not ( = ?auto_1311852 ?auto_1311853 ) ) ( not ( = ?auto_1311852 ?auto_1311850 ) ) ( not ( = ?auto_1311852 ?auto_1311854 ) ) ( not ( = ?auto_1311852 ?auto_1311856 ) ) ( not ( = ?auto_1311852 ?auto_1311855 ) ) ( not ( = ?auto_1311852 ?auto_1311857 ) ) ( not ( = ?auto_1311852 ?auto_1311858 ) ) ( not ( = ?auto_1311852 ?auto_1311859 ) ) ( not ( = ?auto_1311852 ?auto_1311860 ) ) ( not ( = ?auto_1311852 ?auto_1311861 ) ) ( not ( = ?auto_1311852 ?auto_1311862 ) ) ( not ( = ?auto_1311852 ?auto_1311863 ) ) ( not ( = ?auto_1311852 ?auto_1311868 ) ) ( not ( = ?auto_1311852 ?auto_1311865 ) ) ( not ( = ?auto_1311853 ?auto_1311850 ) ) ( not ( = ?auto_1311853 ?auto_1311854 ) ) ( not ( = ?auto_1311853 ?auto_1311856 ) ) ( not ( = ?auto_1311853 ?auto_1311855 ) ) ( not ( = ?auto_1311853 ?auto_1311857 ) ) ( not ( = ?auto_1311853 ?auto_1311858 ) ) ( not ( = ?auto_1311853 ?auto_1311859 ) ) ( not ( = ?auto_1311853 ?auto_1311860 ) ) ( not ( = ?auto_1311853 ?auto_1311861 ) ) ( not ( = ?auto_1311853 ?auto_1311862 ) ) ( not ( = ?auto_1311853 ?auto_1311863 ) ) ( not ( = ?auto_1311853 ?auto_1311868 ) ) ( not ( = ?auto_1311853 ?auto_1311865 ) ) ( not ( = ?auto_1311850 ?auto_1311854 ) ) ( not ( = ?auto_1311850 ?auto_1311856 ) ) ( not ( = ?auto_1311850 ?auto_1311855 ) ) ( not ( = ?auto_1311850 ?auto_1311857 ) ) ( not ( = ?auto_1311850 ?auto_1311858 ) ) ( not ( = ?auto_1311850 ?auto_1311859 ) ) ( not ( = ?auto_1311850 ?auto_1311860 ) ) ( not ( = ?auto_1311850 ?auto_1311861 ) ) ( not ( = ?auto_1311850 ?auto_1311862 ) ) ( not ( = ?auto_1311850 ?auto_1311863 ) ) ( not ( = ?auto_1311850 ?auto_1311868 ) ) ( not ( = ?auto_1311850 ?auto_1311865 ) ) ( not ( = ?auto_1311854 ?auto_1311856 ) ) ( not ( = ?auto_1311854 ?auto_1311855 ) ) ( not ( = ?auto_1311854 ?auto_1311857 ) ) ( not ( = ?auto_1311854 ?auto_1311858 ) ) ( not ( = ?auto_1311854 ?auto_1311859 ) ) ( not ( = ?auto_1311854 ?auto_1311860 ) ) ( not ( = ?auto_1311854 ?auto_1311861 ) ) ( not ( = ?auto_1311854 ?auto_1311862 ) ) ( not ( = ?auto_1311854 ?auto_1311863 ) ) ( not ( = ?auto_1311854 ?auto_1311868 ) ) ( not ( = ?auto_1311854 ?auto_1311865 ) ) ( not ( = ?auto_1311856 ?auto_1311855 ) ) ( not ( = ?auto_1311856 ?auto_1311857 ) ) ( not ( = ?auto_1311856 ?auto_1311858 ) ) ( not ( = ?auto_1311856 ?auto_1311859 ) ) ( not ( = ?auto_1311856 ?auto_1311860 ) ) ( not ( = ?auto_1311856 ?auto_1311861 ) ) ( not ( = ?auto_1311856 ?auto_1311862 ) ) ( not ( = ?auto_1311856 ?auto_1311863 ) ) ( not ( = ?auto_1311856 ?auto_1311868 ) ) ( not ( = ?auto_1311856 ?auto_1311865 ) ) ( not ( = ?auto_1311855 ?auto_1311857 ) ) ( not ( = ?auto_1311855 ?auto_1311858 ) ) ( not ( = ?auto_1311855 ?auto_1311859 ) ) ( not ( = ?auto_1311855 ?auto_1311860 ) ) ( not ( = ?auto_1311855 ?auto_1311861 ) ) ( not ( = ?auto_1311855 ?auto_1311862 ) ) ( not ( = ?auto_1311855 ?auto_1311863 ) ) ( not ( = ?auto_1311855 ?auto_1311868 ) ) ( not ( = ?auto_1311855 ?auto_1311865 ) ) ( not ( = ?auto_1311857 ?auto_1311858 ) ) ( not ( = ?auto_1311857 ?auto_1311859 ) ) ( not ( = ?auto_1311857 ?auto_1311860 ) ) ( not ( = ?auto_1311857 ?auto_1311861 ) ) ( not ( = ?auto_1311857 ?auto_1311862 ) ) ( not ( = ?auto_1311857 ?auto_1311863 ) ) ( not ( = ?auto_1311857 ?auto_1311868 ) ) ( not ( = ?auto_1311857 ?auto_1311865 ) ) ( not ( = ?auto_1311858 ?auto_1311859 ) ) ( not ( = ?auto_1311858 ?auto_1311860 ) ) ( not ( = ?auto_1311858 ?auto_1311861 ) ) ( not ( = ?auto_1311858 ?auto_1311862 ) ) ( not ( = ?auto_1311858 ?auto_1311863 ) ) ( not ( = ?auto_1311858 ?auto_1311868 ) ) ( not ( = ?auto_1311858 ?auto_1311865 ) ) ( not ( = ?auto_1311859 ?auto_1311860 ) ) ( not ( = ?auto_1311859 ?auto_1311861 ) ) ( not ( = ?auto_1311859 ?auto_1311862 ) ) ( not ( = ?auto_1311859 ?auto_1311863 ) ) ( not ( = ?auto_1311859 ?auto_1311868 ) ) ( not ( = ?auto_1311859 ?auto_1311865 ) ) ( not ( = ?auto_1311860 ?auto_1311861 ) ) ( not ( = ?auto_1311860 ?auto_1311862 ) ) ( not ( = ?auto_1311860 ?auto_1311863 ) ) ( not ( = ?auto_1311860 ?auto_1311868 ) ) ( not ( = ?auto_1311860 ?auto_1311865 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1311861 ?auto_1311862 ?auto_1311863 )
      ( MAKE-13CRATE-VERIFY ?auto_1311851 ?auto_1311852 ?auto_1311853 ?auto_1311850 ?auto_1311854 ?auto_1311856 ?auto_1311855 ?auto_1311857 ?auto_1311858 ?auto_1311859 ?auto_1311860 ?auto_1311861 ?auto_1311862 ?auto_1311863 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1311973 - SURFACE
      ?auto_1311974 - SURFACE
      ?auto_1311975 - SURFACE
      ?auto_1311972 - SURFACE
      ?auto_1311976 - SURFACE
      ?auto_1311978 - SURFACE
      ?auto_1311977 - SURFACE
      ?auto_1311979 - SURFACE
      ?auto_1311980 - SURFACE
      ?auto_1311981 - SURFACE
    )
    :vars
    (
      ?auto_1311988 - HOIST
      ?auto_1311985 - PLACE
      ?auto_1311982 - PLACE
      ?auto_1311984 - HOIST
      ?auto_1311986 - SURFACE
      ?auto_1311987 - SURFACE
      ?auto_1311983 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1311988 ?auto_1311985 ) ( IS-CRATE ?auto_1311981 ) ( not ( = ?auto_1311980 ?auto_1311981 ) ) ( not ( = ?auto_1311979 ?auto_1311980 ) ) ( not ( = ?auto_1311979 ?auto_1311981 ) ) ( not ( = ?auto_1311982 ?auto_1311985 ) ) ( HOIST-AT ?auto_1311984 ?auto_1311982 ) ( not ( = ?auto_1311988 ?auto_1311984 ) ) ( SURFACE-AT ?auto_1311981 ?auto_1311982 ) ( ON ?auto_1311981 ?auto_1311986 ) ( CLEAR ?auto_1311981 ) ( not ( = ?auto_1311980 ?auto_1311986 ) ) ( not ( = ?auto_1311981 ?auto_1311986 ) ) ( not ( = ?auto_1311979 ?auto_1311986 ) ) ( SURFACE-AT ?auto_1311979 ?auto_1311985 ) ( CLEAR ?auto_1311979 ) ( IS-CRATE ?auto_1311980 ) ( AVAILABLE ?auto_1311988 ) ( AVAILABLE ?auto_1311984 ) ( SURFACE-AT ?auto_1311980 ?auto_1311982 ) ( ON ?auto_1311980 ?auto_1311987 ) ( CLEAR ?auto_1311980 ) ( not ( = ?auto_1311980 ?auto_1311987 ) ) ( not ( = ?auto_1311981 ?auto_1311987 ) ) ( not ( = ?auto_1311979 ?auto_1311987 ) ) ( not ( = ?auto_1311986 ?auto_1311987 ) ) ( TRUCK-AT ?auto_1311983 ?auto_1311985 ) ( ON ?auto_1311974 ?auto_1311973 ) ( ON ?auto_1311975 ?auto_1311974 ) ( ON ?auto_1311972 ?auto_1311975 ) ( ON ?auto_1311976 ?auto_1311972 ) ( ON ?auto_1311978 ?auto_1311976 ) ( ON ?auto_1311977 ?auto_1311978 ) ( ON ?auto_1311979 ?auto_1311977 ) ( not ( = ?auto_1311973 ?auto_1311974 ) ) ( not ( = ?auto_1311973 ?auto_1311975 ) ) ( not ( = ?auto_1311973 ?auto_1311972 ) ) ( not ( = ?auto_1311973 ?auto_1311976 ) ) ( not ( = ?auto_1311973 ?auto_1311978 ) ) ( not ( = ?auto_1311973 ?auto_1311977 ) ) ( not ( = ?auto_1311973 ?auto_1311979 ) ) ( not ( = ?auto_1311973 ?auto_1311980 ) ) ( not ( = ?auto_1311973 ?auto_1311981 ) ) ( not ( = ?auto_1311973 ?auto_1311986 ) ) ( not ( = ?auto_1311973 ?auto_1311987 ) ) ( not ( = ?auto_1311974 ?auto_1311975 ) ) ( not ( = ?auto_1311974 ?auto_1311972 ) ) ( not ( = ?auto_1311974 ?auto_1311976 ) ) ( not ( = ?auto_1311974 ?auto_1311978 ) ) ( not ( = ?auto_1311974 ?auto_1311977 ) ) ( not ( = ?auto_1311974 ?auto_1311979 ) ) ( not ( = ?auto_1311974 ?auto_1311980 ) ) ( not ( = ?auto_1311974 ?auto_1311981 ) ) ( not ( = ?auto_1311974 ?auto_1311986 ) ) ( not ( = ?auto_1311974 ?auto_1311987 ) ) ( not ( = ?auto_1311975 ?auto_1311972 ) ) ( not ( = ?auto_1311975 ?auto_1311976 ) ) ( not ( = ?auto_1311975 ?auto_1311978 ) ) ( not ( = ?auto_1311975 ?auto_1311977 ) ) ( not ( = ?auto_1311975 ?auto_1311979 ) ) ( not ( = ?auto_1311975 ?auto_1311980 ) ) ( not ( = ?auto_1311975 ?auto_1311981 ) ) ( not ( = ?auto_1311975 ?auto_1311986 ) ) ( not ( = ?auto_1311975 ?auto_1311987 ) ) ( not ( = ?auto_1311972 ?auto_1311976 ) ) ( not ( = ?auto_1311972 ?auto_1311978 ) ) ( not ( = ?auto_1311972 ?auto_1311977 ) ) ( not ( = ?auto_1311972 ?auto_1311979 ) ) ( not ( = ?auto_1311972 ?auto_1311980 ) ) ( not ( = ?auto_1311972 ?auto_1311981 ) ) ( not ( = ?auto_1311972 ?auto_1311986 ) ) ( not ( = ?auto_1311972 ?auto_1311987 ) ) ( not ( = ?auto_1311976 ?auto_1311978 ) ) ( not ( = ?auto_1311976 ?auto_1311977 ) ) ( not ( = ?auto_1311976 ?auto_1311979 ) ) ( not ( = ?auto_1311976 ?auto_1311980 ) ) ( not ( = ?auto_1311976 ?auto_1311981 ) ) ( not ( = ?auto_1311976 ?auto_1311986 ) ) ( not ( = ?auto_1311976 ?auto_1311987 ) ) ( not ( = ?auto_1311978 ?auto_1311977 ) ) ( not ( = ?auto_1311978 ?auto_1311979 ) ) ( not ( = ?auto_1311978 ?auto_1311980 ) ) ( not ( = ?auto_1311978 ?auto_1311981 ) ) ( not ( = ?auto_1311978 ?auto_1311986 ) ) ( not ( = ?auto_1311978 ?auto_1311987 ) ) ( not ( = ?auto_1311977 ?auto_1311979 ) ) ( not ( = ?auto_1311977 ?auto_1311980 ) ) ( not ( = ?auto_1311977 ?auto_1311981 ) ) ( not ( = ?auto_1311977 ?auto_1311986 ) ) ( not ( = ?auto_1311977 ?auto_1311987 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1311979 ?auto_1311980 ?auto_1311981 )
      ( MAKE-9CRATE-VERIFY ?auto_1311973 ?auto_1311974 ?auto_1311975 ?auto_1311972 ?auto_1311976 ?auto_1311978 ?auto_1311977 ?auto_1311979 ?auto_1311980 ?auto_1311981 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1311990 - SURFACE
      ?auto_1311991 - SURFACE
      ?auto_1311992 - SURFACE
      ?auto_1311989 - SURFACE
      ?auto_1311993 - SURFACE
      ?auto_1311995 - SURFACE
      ?auto_1311994 - SURFACE
      ?auto_1311996 - SURFACE
      ?auto_1311997 - SURFACE
      ?auto_1311998 - SURFACE
      ?auto_1311999 - SURFACE
    )
    :vars
    (
      ?auto_1312006 - HOIST
      ?auto_1312003 - PLACE
      ?auto_1312000 - PLACE
      ?auto_1312002 - HOIST
      ?auto_1312004 - SURFACE
      ?auto_1312005 - SURFACE
      ?auto_1312001 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1312006 ?auto_1312003 ) ( IS-CRATE ?auto_1311999 ) ( not ( = ?auto_1311998 ?auto_1311999 ) ) ( not ( = ?auto_1311997 ?auto_1311998 ) ) ( not ( = ?auto_1311997 ?auto_1311999 ) ) ( not ( = ?auto_1312000 ?auto_1312003 ) ) ( HOIST-AT ?auto_1312002 ?auto_1312000 ) ( not ( = ?auto_1312006 ?auto_1312002 ) ) ( SURFACE-AT ?auto_1311999 ?auto_1312000 ) ( ON ?auto_1311999 ?auto_1312004 ) ( CLEAR ?auto_1311999 ) ( not ( = ?auto_1311998 ?auto_1312004 ) ) ( not ( = ?auto_1311999 ?auto_1312004 ) ) ( not ( = ?auto_1311997 ?auto_1312004 ) ) ( SURFACE-AT ?auto_1311997 ?auto_1312003 ) ( CLEAR ?auto_1311997 ) ( IS-CRATE ?auto_1311998 ) ( AVAILABLE ?auto_1312006 ) ( AVAILABLE ?auto_1312002 ) ( SURFACE-AT ?auto_1311998 ?auto_1312000 ) ( ON ?auto_1311998 ?auto_1312005 ) ( CLEAR ?auto_1311998 ) ( not ( = ?auto_1311998 ?auto_1312005 ) ) ( not ( = ?auto_1311999 ?auto_1312005 ) ) ( not ( = ?auto_1311997 ?auto_1312005 ) ) ( not ( = ?auto_1312004 ?auto_1312005 ) ) ( TRUCK-AT ?auto_1312001 ?auto_1312003 ) ( ON ?auto_1311991 ?auto_1311990 ) ( ON ?auto_1311992 ?auto_1311991 ) ( ON ?auto_1311989 ?auto_1311992 ) ( ON ?auto_1311993 ?auto_1311989 ) ( ON ?auto_1311995 ?auto_1311993 ) ( ON ?auto_1311994 ?auto_1311995 ) ( ON ?auto_1311996 ?auto_1311994 ) ( ON ?auto_1311997 ?auto_1311996 ) ( not ( = ?auto_1311990 ?auto_1311991 ) ) ( not ( = ?auto_1311990 ?auto_1311992 ) ) ( not ( = ?auto_1311990 ?auto_1311989 ) ) ( not ( = ?auto_1311990 ?auto_1311993 ) ) ( not ( = ?auto_1311990 ?auto_1311995 ) ) ( not ( = ?auto_1311990 ?auto_1311994 ) ) ( not ( = ?auto_1311990 ?auto_1311996 ) ) ( not ( = ?auto_1311990 ?auto_1311997 ) ) ( not ( = ?auto_1311990 ?auto_1311998 ) ) ( not ( = ?auto_1311990 ?auto_1311999 ) ) ( not ( = ?auto_1311990 ?auto_1312004 ) ) ( not ( = ?auto_1311990 ?auto_1312005 ) ) ( not ( = ?auto_1311991 ?auto_1311992 ) ) ( not ( = ?auto_1311991 ?auto_1311989 ) ) ( not ( = ?auto_1311991 ?auto_1311993 ) ) ( not ( = ?auto_1311991 ?auto_1311995 ) ) ( not ( = ?auto_1311991 ?auto_1311994 ) ) ( not ( = ?auto_1311991 ?auto_1311996 ) ) ( not ( = ?auto_1311991 ?auto_1311997 ) ) ( not ( = ?auto_1311991 ?auto_1311998 ) ) ( not ( = ?auto_1311991 ?auto_1311999 ) ) ( not ( = ?auto_1311991 ?auto_1312004 ) ) ( not ( = ?auto_1311991 ?auto_1312005 ) ) ( not ( = ?auto_1311992 ?auto_1311989 ) ) ( not ( = ?auto_1311992 ?auto_1311993 ) ) ( not ( = ?auto_1311992 ?auto_1311995 ) ) ( not ( = ?auto_1311992 ?auto_1311994 ) ) ( not ( = ?auto_1311992 ?auto_1311996 ) ) ( not ( = ?auto_1311992 ?auto_1311997 ) ) ( not ( = ?auto_1311992 ?auto_1311998 ) ) ( not ( = ?auto_1311992 ?auto_1311999 ) ) ( not ( = ?auto_1311992 ?auto_1312004 ) ) ( not ( = ?auto_1311992 ?auto_1312005 ) ) ( not ( = ?auto_1311989 ?auto_1311993 ) ) ( not ( = ?auto_1311989 ?auto_1311995 ) ) ( not ( = ?auto_1311989 ?auto_1311994 ) ) ( not ( = ?auto_1311989 ?auto_1311996 ) ) ( not ( = ?auto_1311989 ?auto_1311997 ) ) ( not ( = ?auto_1311989 ?auto_1311998 ) ) ( not ( = ?auto_1311989 ?auto_1311999 ) ) ( not ( = ?auto_1311989 ?auto_1312004 ) ) ( not ( = ?auto_1311989 ?auto_1312005 ) ) ( not ( = ?auto_1311993 ?auto_1311995 ) ) ( not ( = ?auto_1311993 ?auto_1311994 ) ) ( not ( = ?auto_1311993 ?auto_1311996 ) ) ( not ( = ?auto_1311993 ?auto_1311997 ) ) ( not ( = ?auto_1311993 ?auto_1311998 ) ) ( not ( = ?auto_1311993 ?auto_1311999 ) ) ( not ( = ?auto_1311993 ?auto_1312004 ) ) ( not ( = ?auto_1311993 ?auto_1312005 ) ) ( not ( = ?auto_1311995 ?auto_1311994 ) ) ( not ( = ?auto_1311995 ?auto_1311996 ) ) ( not ( = ?auto_1311995 ?auto_1311997 ) ) ( not ( = ?auto_1311995 ?auto_1311998 ) ) ( not ( = ?auto_1311995 ?auto_1311999 ) ) ( not ( = ?auto_1311995 ?auto_1312004 ) ) ( not ( = ?auto_1311995 ?auto_1312005 ) ) ( not ( = ?auto_1311994 ?auto_1311996 ) ) ( not ( = ?auto_1311994 ?auto_1311997 ) ) ( not ( = ?auto_1311994 ?auto_1311998 ) ) ( not ( = ?auto_1311994 ?auto_1311999 ) ) ( not ( = ?auto_1311994 ?auto_1312004 ) ) ( not ( = ?auto_1311994 ?auto_1312005 ) ) ( not ( = ?auto_1311996 ?auto_1311997 ) ) ( not ( = ?auto_1311996 ?auto_1311998 ) ) ( not ( = ?auto_1311996 ?auto_1311999 ) ) ( not ( = ?auto_1311996 ?auto_1312004 ) ) ( not ( = ?auto_1311996 ?auto_1312005 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1311997 ?auto_1311998 ?auto_1311999 )
      ( MAKE-10CRATE-VERIFY ?auto_1311990 ?auto_1311991 ?auto_1311992 ?auto_1311989 ?auto_1311993 ?auto_1311995 ?auto_1311994 ?auto_1311996 ?auto_1311997 ?auto_1311998 ?auto_1311999 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1312008 - SURFACE
      ?auto_1312009 - SURFACE
      ?auto_1312010 - SURFACE
      ?auto_1312007 - SURFACE
      ?auto_1312011 - SURFACE
      ?auto_1312013 - SURFACE
      ?auto_1312012 - SURFACE
      ?auto_1312014 - SURFACE
      ?auto_1312015 - SURFACE
      ?auto_1312016 - SURFACE
      ?auto_1312017 - SURFACE
      ?auto_1312018 - SURFACE
    )
    :vars
    (
      ?auto_1312025 - HOIST
      ?auto_1312022 - PLACE
      ?auto_1312019 - PLACE
      ?auto_1312021 - HOIST
      ?auto_1312023 - SURFACE
      ?auto_1312024 - SURFACE
      ?auto_1312020 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1312025 ?auto_1312022 ) ( IS-CRATE ?auto_1312018 ) ( not ( = ?auto_1312017 ?auto_1312018 ) ) ( not ( = ?auto_1312016 ?auto_1312017 ) ) ( not ( = ?auto_1312016 ?auto_1312018 ) ) ( not ( = ?auto_1312019 ?auto_1312022 ) ) ( HOIST-AT ?auto_1312021 ?auto_1312019 ) ( not ( = ?auto_1312025 ?auto_1312021 ) ) ( SURFACE-AT ?auto_1312018 ?auto_1312019 ) ( ON ?auto_1312018 ?auto_1312023 ) ( CLEAR ?auto_1312018 ) ( not ( = ?auto_1312017 ?auto_1312023 ) ) ( not ( = ?auto_1312018 ?auto_1312023 ) ) ( not ( = ?auto_1312016 ?auto_1312023 ) ) ( SURFACE-AT ?auto_1312016 ?auto_1312022 ) ( CLEAR ?auto_1312016 ) ( IS-CRATE ?auto_1312017 ) ( AVAILABLE ?auto_1312025 ) ( AVAILABLE ?auto_1312021 ) ( SURFACE-AT ?auto_1312017 ?auto_1312019 ) ( ON ?auto_1312017 ?auto_1312024 ) ( CLEAR ?auto_1312017 ) ( not ( = ?auto_1312017 ?auto_1312024 ) ) ( not ( = ?auto_1312018 ?auto_1312024 ) ) ( not ( = ?auto_1312016 ?auto_1312024 ) ) ( not ( = ?auto_1312023 ?auto_1312024 ) ) ( TRUCK-AT ?auto_1312020 ?auto_1312022 ) ( ON ?auto_1312009 ?auto_1312008 ) ( ON ?auto_1312010 ?auto_1312009 ) ( ON ?auto_1312007 ?auto_1312010 ) ( ON ?auto_1312011 ?auto_1312007 ) ( ON ?auto_1312013 ?auto_1312011 ) ( ON ?auto_1312012 ?auto_1312013 ) ( ON ?auto_1312014 ?auto_1312012 ) ( ON ?auto_1312015 ?auto_1312014 ) ( ON ?auto_1312016 ?auto_1312015 ) ( not ( = ?auto_1312008 ?auto_1312009 ) ) ( not ( = ?auto_1312008 ?auto_1312010 ) ) ( not ( = ?auto_1312008 ?auto_1312007 ) ) ( not ( = ?auto_1312008 ?auto_1312011 ) ) ( not ( = ?auto_1312008 ?auto_1312013 ) ) ( not ( = ?auto_1312008 ?auto_1312012 ) ) ( not ( = ?auto_1312008 ?auto_1312014 ) ) ( not ( = ?auto_1312008 ?auto_1312015 ) ) ( not ( = ?auto_1312008 ?auto_1312016 ) ) ( not ( = ?auto_1312008 ?auto_1312017 ) ) ( not ( = ?auto_1312008 ?auto_1312018 ) ) ( not ( = ?auto_1312008 ?auto_1312023 ) ) ( not ( = ?auto_1312008 ?auto_1312024 ) ) ( not ( = ?auto_1312009 ?auto_1312010 ) ) ( not ( = ?auto_1312009 ?auto_1312007 ) ) ( not ( = ?auto_1312009 ?auto_1312011 ) ) ( not ( = ?auto_1312009 ?auto_1312013 ) ) ( not ( = ?auto_1312009 ?auto_1312012 ) ) ( not ( = ?auto_1312009 ?auto_1312014 ) ) ( not ( = ?auto_1312009 ?auto_1312015 ) ) ( not ( = ?auto_1312009 ?auto_1312016 ) ) ( not ( = ?auto_1312009 ?auto_1312017 ) ) ( not ( = ?auto_1312009 ?auto_1312018 ) ) ( not ( = ?auto_1312009 ?auto_1312023 ) ) ( not ( = ?auto_1312009 ?auto_1312024 ) ) ( not ( = ?auto_1312010 ?auto_1312007 ) ) ( not ( = ?auto_1312010 ?auto_1312011 ) ) ( not ( = ?auto_1312010 ?auto_1312013 ) ) ( not ( = ?auto_1312010 ?auto_1312012 ) ) ( not ( = ?auto_1312010 ?auto_1312014 ) ) ( not ( = ?auto_1312010 ?auto_1312015 ) ) ( not ( = ?auto_1312010 ?auto_1312016 ) ) ( not ( = ?auto_1312010 ?auto_1312017 ) ) ( not ( = ?auto_1312010 ?auto_1312018 ) ) ( not ( = ?auto_1312010 ?auto_1312023 ) ) ( not ( = ?auto_1312010 ?auto_1312024 ) ) ( not ( = ?auto_1312007 ?auto_1312011 ) ) ( not ( = ?auto_1312007 ?auto_1312013 ) ) ( not ( = ?auto_1312007 ?auto_1312012 ) ) ( not ( = ?auto_1312007 ?auto_1312014 ) ) ( not ( = ?auto_1312007 ?auto_1312015 ) ) ( not ( = ?auto_1312007 ?auto_1312016 ) ) ( not ( = ?auto_1312007 ?auto_1312017 ) ) ( not ( = ?auto_1312007 ?auto_1312018 ) ) ( not ( = ?auto_1312007 ?auto_1312023 ) ) ( not ( = ?auto_1312007 ?auto_1312024 ) ) ( not ( = ?auto_1312011 ?auto_1312013 ) ) ( not ( = ?auto_1312011 ?auto_1312012 ) ) ( not ( = ?auto_1312011 ?auto_1312014 ) ) ( not ( = ?auto_1312011 ?auto_1312015 ) ) ( not ( = ?auto_1312011 ?auto_1312016 ) ) ( not ( = ?auto_1312011 ?auto_1312017 ) ) ( not ( = ?auto_1312011 ?auto_1312018 ) ) ( not ( = ?auto_1312011 ?auto_1312023 ) ) ( not ( = ?auto_1312011 ?auto_1312024 ) ) ( not ( = ?auto_1312013 ?auto_1312012 ) ) ( not ( = ?auto_1312013 ?auto_1312014 ) ) ( not ( = ?auto_1312013 ?auto_1312015 ) ) ( not ( = ?auto_1312013 ?auto_1312016 ) ) ( not ( = ?auto_1312013 ?auto_1312017 ) ) ( not ( = ?auto_1312013 ?auto_1312018 ) ) ( not ( = ?auto_1312013 ?auto_1312023 ) ) ( not ( = ?auto_1312013 ?auto_1312024 ) ) ( not ( = ?auto_1312012 ?auto_1312014 ) ) ( not ( = ?auto_1312012 ?auto_1312015 ) ) ( not ( = ?auto_1312012 ?auto_1312016 ) ) ( not ( = ?auto_1312012 ?auto_1312017 ) ) ( not ( = ?auto_1312012 ?auto_1312018 ) ) ( not ( = ?auto_1312012 ?auto_1312023 ) ) ( not ( = ?auto_1312012 ?auto_1312024 ) ) ( not ( = ?auto_1312014 ?auto_1312015 ) ) ( not ( = ?auto_1312014 ?auto_1312016 ) ) ( not ( = ?auto_1312014 ?auto_1312017 ) ) ( not ( = ?auto_1312014 ?auto_1312018 ) ) ( not ( = ?auto_1312014 ?auto_1312023 ) ) ( not ( = ?auto_1312014 ?auto_1312024 ) ) ( not ( = ?auto_1312015 ?auto_1312016 ) ) ( not ( = ?auto_1312015 ?auto_1312017 ) ) ( not ( = ?auto_1312015 ?auto_1312018 ) ) ( not ( = ?auto_1312015 ?auto_1312023 ) ) ( not ( = ?auto_1312015 ?auto_1312024 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1312016 ?auto_1312017 ?auto_1312018 )
      ( MAKE-11CRATE-VERIFY ?auto_1312008 ?auto_1312009 ?auto_1312010 ?auto_1312007 ?auto_1312011 ?auto_1312013 ?auto_1312012 ?auto_1312014 ?auto_1312015 ?auto_1312016 ?auto_1312017 ?auto_1312018 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1312027 - SURFACE
      ?auto_1312028 - SURFACE
      ?auto_1312029 - SURFACE
      ?auto_1312026 - SURFACE
      ?auto_1312030 - SURFACE
      ?auto_1312032 - SURFACE
      ?auto_1312031 - SURFACE
      ?auto_1312033 - SURFACE
      ?auto_1312034 - SURFACE
      ?auto_1312035 - SURFACE
      ?auto_1312036 - SURFACE
      ?auto_1312037 - SURFACE
      ?auto_1312038 - SURFACE
    )
    :vars
    (
      ?auto_1312045 - HOIST
      ?auto_1312042 - PLACE
      ?auto_1312039 - PLACE
      ?auto_1312041 - HOIST
      ?auto_1312043 - SURFACE
      ?auto_1312044 - SURFACE
      ?auto_1312040 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1312045 ?auto_1312042 ) ( IS-CRATE ?auto_1312038 ) ( not ( = ?auto_1312037 ?auto_1312038 ) ) ( not ( = ?auto_1312036 ?auto_1312037 ) ) ( not ( = ?auto_1312036 ?auto_1312038 ) ) ( not ( = ?auto_1312039 ?auto_1312042 ) ) ( HOIST-AT ?auto_1312041 ?auto_1312039 ) ( not ( = ?auto_1312045 ?auto_1312041 ) ) ( SURFACE-AT ?auto_1312038 ?auto_1312039 ) ( ON ?auto_1312038 ?auto_1312043 ) ( CLEAR ?auto_1312038 ) ( not ( = ?auto_1312037 ?auto_1312043 ) ) ( not ( = ?auto_1312038 ?auto_1312043 ) ) ( not ( = ?auto_1312036 ?auto_1312043 ) ) ( SURFACE-AT ?auto_1312036 ?auto_1312042 ) ( CLEAR ?auto_1312036 ) ( IS-CRATE ?auto_1312037 ) ( AVAILABLE ?auto_1312045 ) ( AVAILABLE ?auto_1312041 ) ( SURFACE-AT ?auto_1312037 ?auto_1312039 ) ( ON ?auto_1312037 ?auto_1312044 ) ( CLEAR ?auto_1312037 ) ( not ( = ?auto_1312037 ?auto_1312044 ) ) ( not ( = ?auto_1312038 ?auto_1312044 ) ) ( not ( = ?auto_1312036 ?auto_1312044 ) ) ( not ( = ?auto_1312043 ?auto_1312044 ) ) ( TRUCK-AT ?auto_1312040 ?auto_1312042 ) ( ON ?auto_1312028 ?auto_1312027 ) ( ON ?auto_1312029 ?auto_1312028 ) ( ON ?auto_1312026 ?auto_1312029 ) ( ON ?auto_1312030 ?auto_1312026 ) ( ON ?auto_1312032 ?auto_1312030 ) ( ON ?auto_1312031 ?auto_1312032 ) ( ON ?auto_1312033 ?auto_1312031 ) ( ON ?auto_1312034 ?auto_1312033 ) ( ON ?auto_1312035 ?auto_1312034 ) ( ON ?auto_1312036 ?auto_1312035 ) ( not ( = ?auto_1312027 ?auto_1312028 ) ) ( not ( = ?auto_1312027 ?auto_1312029 ) ) ( not ( = ?auto_1312027 ?auto_1312026 ) ) ( not ( = ?auto_1312027 ?auto_1312030 ) ) ( not ( = ?auto_1312027 ?auto_1312032 ) ) ( not ( = ?auto_1312027 ?auto_1312031 ) ) ( not ( = ?auto_1312027 ?auto_1312033 ) ) ( not ( = ?auto_1312027 ?auto_1312034 ) ) ( not ( = ?auto_1312027 ?auto_1312035 ) ) ( not ( = ?auto_1312027 ?auto_1312036 ) ) ( not ( = ?auto_1312027 ?auto_1312037 ) ) ( not ( = ?auto_1312027 ?auto_1312038 ) ) ( not ( = ?auto_1312027 ?auto_1312043 ) ) ( not ( = ?auto_1312027 ?auto_1312044 ) ) ( not ( = ?auto_1312028 ?auto_1312029 ) ) ( not ( = ?auto_1312028 ?auto_1312026 ) ) ( not ( = ?auto_1312028 ?auto_1312030 ) ) ( not ( = ?auto_1312028 ?auto_1312032 ) ) ( not ( = ?auto_1312028 ?auto_1312031 ) ) ( not ( = ?auto_1312028 ?auto_1312033 ) ) ( not ( = ?auto_1312028 ?auto_1312034 ) ) ( not ( = ?auto_1312028 ?auto_1312035 ) ) ( not ( = ?auto_1312028 ?auto_1312036 ) ) ( not ( = ?auto_1312028 ?auto_1312037 ) ) ( not ( = ?auto_1312028 ?auto_1312038 ) ) ( not ( = ?auto_1312028 ?auto_1312043 ) ) ( not ( = ?auto_1312028 ?auto_1312044 ) ) ( not ( = ?auto_1312029 ?auto_1312026 ) ) ( not ( = ?auto_1312029 ?auto_1312030 ) ) ( not ( = ?auto_1312029 ?auto_1312032 ) ) ( not ( = ?auto_1312029 ?auto_1312031 ) ) ( not ( = ?auto_1312029 ?auto_1312033 ) ) ( not ( = ?auto_1312029 ?auto_1312034 ) ) ( not ( = ?auto_1312029 ?auto_1312035 ) ) ( not ( = ?auto_1312029 ?auto_1312036 ) ) ( not ( = ?auto_1312029 ?auto_1312037 ) ) ( not ( = ?auto_1312029 ?auto_1312038 ) ) ( not ( = ?auto_1312029 ?auto_1312043 ) ) ( not ( = ?auto_1312029 ?auto_1312044 ) ) ( not ( = ?auto_1312026 ?auto_1312030 ) ) ( not ( = ?auto_1312026 ?auto_1312032 ) ) ( not ( = ?auto_1312026 ?auto_1312031 ) ) ( not ( = ?auto_1312026 ?auto_1312033 ) ) ( not ( = ?auto_1312026 ?auto_1312034 ) ) ( not ( = ?auto_1312026 ?auto_1312035 ) ) ( not ( = ?auto_1312026 ?auto_1312036 ) ) ( not ( = ?auto_1312026 ?auto_1312037 ) ) ( not ( = ?auto_1312026 ?auto_1312038 ) ) ( not ( = ?auto_1312026 ?auto_1312043 ) ) ( not ( = ?auto_1312026 ?auto_1312044 ) ) ( not ( = ?auto_1312030 ?auto_1312032 ) ) ( not ( = ?auto_1312030 ?auto_1312031 ) ) ( not ( = ?auto_1312030 ?auto_1312033 ) ) ( not ( = ?auto_1312030 ?auto_1312034 ) ) ( not ( = ?auto_1312030 ?auto_1312035 ) ) ( not ( = ?auto_1312030 ?auto_1312036 ) ) ( not ( = ?auto_1312030 ?auto_1312037 ) ) ( not ( = ?auto_1312030 ?auto_1312038 ) ) ( not ( = ?auto_1312030 ?auto_1312043 ) ) ( not ( = ?auto_1312030 ?auto_1312044 ) ) ( not ( = ?auto_1312032 ?auto_1312031 ) ) ( not ( = ?auto_1312032 ?auto_1312033 ) ) ( not ( = ?auto_1312032 ?auto_1312034 ) ) ( not ( = ?auto_1312032 ?auto_1312035 ) ) ( not ( = ?auto_1312032 ?auto_1312036 ) ) ( not ( = ?auto_1312032 ?auto_1312037 ) ) ( not ( = ?auto_1312032 ?auto_1312038 ) ) ( not ( = ?auto_1312032 ?auto_1312043 ) ) ( not ( = ?auto_1312032 ?auto_1312044 ) ) ( not ( = ?auto_1312031 ?auto_1312033 ) ) ( not ( = ?auto_1312031 ?auto_1312034 ) ) ( not ( = ?auto_1312031 ?auto_1312035 ) ) ( not ( = ?auto_1312031 ?auto_1312036 ) ) ( not ( = ?auto_1312031 ?auto_1312037 ) ) ( not ( = ?auto_1312031 ?auto_1312038 ) ) ( not ( = ?auto_1312031 ?auto_1312043 ) ) ( not ( = ?auto_1312031 ?auto_1312044 ) ) ( not ( = ?auto_1312033 ?auto_1312034 ) ) ( not ( = ?auto_1312033 ?auto_1312035 ) ) ( not ( = ?auto_1312033 ?auto_1312036 ) ) ( not ( = ?auto_1312033 ?auto_1312037 ) ) ( not ( = ?auto_1312033 ?auto_1312038 ) ) ( not ( = ?auto_1312033 ?auto_1312043 ) ) ( not ( = ?auto_1312033 ?auto_1312044 ) ) ( not ( = ?auto_1312034 ?auto_1312035 ) ) ( not ( = ?auto_1312034 ?auto_1312036 ) ) ( not ( = ?auto_1312034 ?auto_1312037 ) ) ( not ( = ?auto_1312034 ?auto_1312038 ) ) ( not ( = ?auto_1312034 ?auto_1312043 ) ) ( not ( = ?auto_1312034 ?auto_1312044 ) ) ( not ( = ?auto_1312035 ?auto_1312036 ) ) ( not ( = ?auto_1312035 ?auto_1312037 ) ) ( not ( = ?auto_1312035 ?auto_1312038 ) ) ( not ( = ?auto_1312035 ?auto_1312043 ) ) ( not ( = ?auto_1312035 ?auto_1312044 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1312036 ?auto_1312037 ?auto_1312038 )
      ( MAKE-12CRATE-VERIFY ?auto_1312027 ?auto_1312028 ?auto_1312029 ?auto_1312026 ?auto_1312030 ?auto_1312032 ?auto_1312031 ?auto_1312033 ?auto_1312034 ?auto_1312035 ?auto_1312036 ?auto_1312037 ?auto_1312038 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1312047 - SURFACE
      ?auto_1312048 - SURFACE
      ?auto_1312049 - SURFACE
      ?auto_1312046 - SURFACE
      ?auto_1312050 - SURFACE
      ?auto_1312052 - SURFACE
      ?auto_1312051 - SURFACE
      ?auto_1312053 - SURFACE
      ?auto_1312054 - SURFACE
      ?auto_1312055 - SURFACE
      ?auto_1312056 - SURFACE
      ?auto_1312057 - SURFACE
      ?auto_1312058 - SURFACE
      ?auto_1312059 - SURFACE
    )
    :vars
    (
      ?auto_1312066 - HOIST
      ?auto_1312063 - PLACE
      ?auto_1312060 - PLACE
      ?auto_1312062 - HOIST
      ?auto_1312064 - SURFACE
      ?auto_1312065 - SURFACE
      ?auto_1312061 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1312066 ?auto_1312063 ) ( IS-CRATE ?auto_1312059 ) ( not ( = ?auto_1312058 ?auto_1312059 ) ) ( not ( = ?auto_1312057 ?auto_1312058 ) ) ( not ( = ?auto_1312057 ?auto_1312059 ) ) ( not ( = ?auto_1312060 ?auto_1312063 ) ) ( HOIST-AT ?auto_1312062 ?auto_1312060 ) ( not ( = ?auto_1312066 ?auto_1312062 ) ) ( SURFACE-AT ?auto_1312059 ?auto_1312060 ) ( ON ?auto_1312059 ?auto_1312064 ) ( CLEAR ?auto_1312059 ) ( not ( = ?auto_1312058 ?auto_1312064 ) ) ( not ( = ?auto_1312059 ?auto_1312064 ) ) ( not ( = ?auto_1312057 ?auto_1312064 ) ) ( SURFACE-AT ?auto_1312057 ?auto_1312063 ) ( CLEAR ?auto_1312057 ) ( IS-CRATE ?auto_1312058 ) ( AVAILABLE ?auto_1312066 ) ( AVAILABLE ?auto_1312062 ) ( SURFACE-AT ?auto_1312058 ?auto_1312060 ) ( ON ?auto_1312058 ?auto_1312065 ) ( CLEAR ?auto_1312058 ) ( not ( = ?auto_1312058 ?auto_1312065 ) ) ( not ( = ?auto_1312059 ?auto_1312065 ) ) ( not ( = ?auto_1312057 ?auto_1312065 ) ) ( not ( = ?auto_1312064 ?auto_1312065 ) ) ( TRUCK-AT ?auto_1312061 ?auto_1312063 ) ( ON ?auto_1312048 ?auto_1312047 ) ( ON ?auto_1312049 ?auto_1312048 ) ( ON ?auto_1312046 ?auto_1312049 ) ( ON ?auto_1312050 ?auto_1312046 ) ( ON ?auto_1312052 ?auto_1312050 ) ( ON ?auto_1312051 ?auto_1312052 ) ( ON ?auto_1312053 ?auto_1312051 ) ( ON ?auto_1312054 ?auto_1312053 ) ( ON ?auto_1312055 ?auto_1312054 ) ( ON ?auto_1312056 ?auto_1312055 ) ( ON ?auto_1312057 ?auto_1312056 ) ( not ( = ?auto_1312047 ?auto_1312048 ) ) ( not ( = ?auto_1312047 ?auto_1312049 ) ) ( not ( = ?auto_1312047 ?auto_1312046 ) ) ( not ( = ?auto_1312047 ?auto_1312050 ) ) ( not ( = ?auto_1312047 ?auto_1312052 ) ) ( not ( = ?auto_1312047 ?auto_1312051 ) ) ( not ( = ?auto_1312047 ?auto_1312053 ) ) ( not ( = ?auto_1312047 ?auto_1312054 ) ) ( not ( = ?auto_1312047 ?auto_1312055 ) ) ( not ( = ?auto_1312047 ?auto_1312056 ) ) ( not ( = ?auto_1312047 ?auto_1312057 ) ) ( not ( = ?auto_1312047 ?auto_1312058 ) ) ( not ( = ?auto_1312047 ?auto_1312059 ) ) ( not ( = ?auto_1312047 ?auto_1312064 ) ) ( not ( = ?auto_1312047 ?auto_1312065 ) ) ( not ( = ?auto_1312048 ?auto_1312049 ) ) ( not ( = ?auto_1312048 ?auto_1312046 ) ) ( not ( = ?auto_1312048 ?auto_1312050 ) ) ( not ( = ?auto_1312048 ?auto_1312052 ) ) ( not ( = ?auto_1312048 ?auto_1312051 ) ) ( not ( = ?auto_1312048 ?auto_1312053 ) ) ( not ( = ?auto_1312048 ?auto_1312054 ) ) ( not ( = ?auto_1312048 ?auto_1312055 ) ) ( not ( = ?auto_1312048 ?auto_1312056 ) ) ( not ( = ?auto_1312048 ?auto_1312057 ) ) ( not ( = ?auto_1312048 ?auto_1312058 ) ) ( not ( = ?auto_1312048 ?auto_1312059 ) ) ( not ( = ?auto_1312048 ?auto_1312064 ) ) ( not ( = ?auto_1312048 ?auto_1312065 ) ) ( not ( = ?auto_1312049 ?auto_1312046 ) ) ( not ( = ?auto_1312049 ?auto_1312050 ) ) ( not ( = ?auto_1312049 ?auto_1312052 ) ) ( not ( = ?auto_1312049 ?auto_1312051 ) ) ( not ( = ?auto_1312049 ?auto_1312053 ) ) ( not ( = ?auto_1312049 ?auto_1312054 ) ) ( not ( = ?auto_1312049 ?auto_1312055 ) ) ( not ( = ?auto_1312049 ?auto_1312056 ) ) ( not ( = ?auto_1312049 ?auto_1312057 ) ) ( not ( = ?auto_1312049 ?auto_1312058 ) ) ( not ( = ?auto_1312049 ?auto_1312059 ) ) ( not ( = ?auto_1312049 ?auto_1312064 ) ) ( not ( = ?auto_1312049 ?auto_1312065 ) ) ( not ( = ?auto_1312046 ?auto_1312050 ) ) ( not ( = ?auto_1312046 ?auto_1312052 ) ) ( not ( = ?auto_1312046 ?auto_1312051 ) ) ( not ( = ?auto_1312046 ?auto_1312053 ) ) ( not ( = ?auto_1312046 ?auto_1312054 ) ) ( not ( = ?auto_1312046 ?auto_1312055 ) ) ( not ( = ?auto_1312046 ?auto_1312056 ) ) ( not ( = ?auto_1312046 ?auto_1312057 ) ) ( not ( = ?auto_1312046 ?auto_1312058 ) ) ( not ( = ?auto_1312046 ?auto_1312059 ) ) ( not ( = ?auto_1312046 ?auto_1312064 ) ) ( not ( = ?auto_1312046 ?auto_1312065 ) ) ( not ( = ?auto_1312050 ?auto_1312052 ) ) ( not ( = ?auto_1312050 ?auto_1312051 ) ) ( not ( = ?auto_1312050 ?auto_1312053 ) ) ( not ( = ?auto_1312050 ?auto_1312054 ) ) ( not ( = ?auto_1312050 ?auto_1312055 ) ) ( not ( = ?auto_1312050 ?auto_1312056 ) ) ( not ( = ?auto_1312050 ?auto_1312057 ) ) ( not ( = ?auto_1312050 ?auto_1312058 ) ) ( not ( = ?auto_1312050 ?auto_1312059 ) ) ( not ( = ?auto_1312050 ?auto_1312064 ) ) ( not ( = ?auto_1312050 ?auto_1312065 ) ) ( not ( = ?auto_1312052 ?auto_1312051 ) ) ( not ( = ?auto_1312052 ?auto_1312053 ) ) ( not ( = ?auto_1312052 ?auto_1312054 ) ) ( not ( = ?auto_1312052 ?auto_1312055 ) ) ( not ( = ?auto_1312052 ?auto_1312056 ) ) ( not ( = ?auto_1312052 ?auto_1312057 ) ) ( not ( = ?auto_1312052 ?auto_1312058 ) ) ( not ( = ?auto_1312052 ?auto_1312059 ) ) ( not ( = ?auto_1312052 ?auto_1312064 ) ) ( not ( = ?auto_1312052 ?auto_1312065 ) ) ( not ( = ?auto_1312051 ?auto_1312053 ) ) ( not ( = ?auto_1312051 ?auto_1312054 ) ) ( not ( = ?auto_1312051 ?auto_1312055 ) ) ( not ( = ?auto_1312051 ?auto_1312056 ) ) ( not ( = ?auto_1312051 ?auto_1312057 ) ) ( not ( = ?auto_1312051 ?auto_1312058 ) ) ( not ( = ?auto_1312051 ?auto_1312059 ) ) ( not ( = ?auto_1312051 ?auto_1312064 ) ) ( not ( = ?auto_1312051 ?auto_1312065 ) ) ( not ( = ?auto_1312053 ?auto_1312054 ) ) ( not ( = ?auto_1312053 ?auto_1312055 ) ) ( not ( = ?auto_1312053 ?auto_1312056 ) ) ( not ( = ?auto_1312053 ?auto_1312057 ) ) ( not ( = ?auto_1312053 ?auto_1312058 ) ) ( not ( = ?auto_1312053 ?auto_1312059 ) ) ( not ( = ?auto_1312053 ?auto_1312064 ) ) ( not ( = ?auto_1312053 ?auto_1312065 ) ) ( not ( = ?auto_1312054 ?auto_1312055 ) ) ( not ( = ?auto_1312054 ?auto_1312056 ) ) ( not ( = ?auto_1312054 ?auto_1312057 ) ) ( not ( = ?auto_1312054 ?auto_1312058 ) ) ( not ( = ?auto_1312054 ?auto_1312059 ) ) ( not ( = ?auto_1312054 ?auto_1312064 ) ) ( not ( = ?auto_1312054 ?auto_1312065 ) ) ( not ( = ?auto_1312055 ?auto_1312056 ) ) ( not ( = ?auto_1312055 ?auto_1312057 ) ) ( not ( = ?auto_1312055 ?auto_1312058 ) ) ( not ( = ?auto_1312055 ?auto_1312059 ) ) ( not ( = ?auto_1312055 ?auto_1312064 ) ) ( not ( = ?auto_1312055 ?auto_1312065 ) ) ( not ( = ?auto_1312056 ?auto_1312057 ) ) ( not ( = ?auto_1312056 ?auto_1312058 ) ) ( not ( = ?auto_1312056 ?auto_1312059 ) ) ( not ( = ?auto_1312056 ?auto_1312064 ) ) ( not ( = ?auto_1312056 ?auto_1312065 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1312057 ?auto_1312058 ?auto_1312059 )
      ( MAKE-13CRATE-VERIFY ?auto_1312047 ?auto_1312048 ?auto_1312049 ?auto_1312046 ?auto_1312050 ?auto_1312052 ?auto_1312051 ?auto_1312053 ?auto_1312054 ?auto_1312055 ?auto_1312056 ?auto_1312057 ?auto_1312058 ?auto_1312059 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1312171 - SURFACE
      ?auto_1312172 - SURFACE
      ?auto_1312173 - SURFACE
      ?auto_1312170 - SURFACE
      ?auto_1312174 - SURFACE
      ?auto_1312176 - SURFACE
      ?auto_1312175 - SURFACE
      ?auto_1312177 - SURFACE
      ?auto_1312178 - SURFACE
      ?auto_1312179 - SURFACE
    )
    :vars
    (
      ?auto_1312183 - HOIST
      ?auto_1312180 - PLACE
      ?auto_1312184 - PLACE
      ?auto_1312185 - HOIST
      ?auto_1312181 - SURFACE
      ?auto_1312182 - SURFACE
      ?auto_1312186 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1312183 ?auto_1312180 ) ( IS-CRATE ?auto_1312179 ) ( not ( = ?auto_1312178 ?auto_1312179 ) ) ( not ( = ?auto_1312177 ?auto_1312178 ) ) ( not ( = ?auto_1312177 ?auto_1312179 ) ) ( not ( = ?auto_1312184 ?auto_1312180 ) ) ( HOIST-AT ?auto_1312185 ?auto_1312184 ) ( not ( = ?auto_1312183 ?auto_1312185 ) ) ( SURFACE-AT ?auto_1312179 ?auto_1312184 ) ( ON ?auto_1312179 ?auto_1312181 ) ( CLEAR ?auto_1312179 ) ( not ( = ?auto_1312178 ?auto_1312181 ) ) ( not ( = ?auto_1312179 ?auto_1312181 ) ) ( not ( = ?auto_1312177 ?auto_1312181 ) ) ( IS-CRATE ?auto_1312178 ) ( AVAILABLE ?auto_1312185 ) ( SURFACE-AT ?auto_1312178 ?auto_1312184 ) ( ON ?auto_1312178 ?auto_1312182 ) ( CLEAR ?auto_1312178 ) ( not ( = ?auto_1312178 ?auto_1312182 ) ) ( not ( = ?auto_1312179 ?auto_1312182 ) ) ( not ( = ?auto_1312177 ?auto_1312182 ) ) ( not ( = ?auto_1312181 ?auto_1312182 ) ) ( TRUCK-AT ?auto_1312186 ?auto_1312180 ) ( SURFACE-AT ?auto_1312175 ?auto_1312180 ) ( CLEAR ?auto_1312175 ) ( LIFTING ?auto_1312183 ?auto_1312177 ) ( IS-CRATE ?auto_1312177 ) ( not ( = ?auto_1312175 ?auto_1312177 ) ) ( not ( = ?auto_1312178 ?auto_1312175 ) ) ( not ( = ?auto_1312179 ?auto_1312175 ) ) ( not ( = ?auto_1312181 ?auto_1312175 ) ) ( not ( = ?auto_1312182 ?auto_1312175 ) ) ( ON ?auto_1312172 ?auto_1312171 ) ( ON ?auto_1312173 ?auto_1312172 ) ( ON ?auto_1312170 ?auto_1312173 ) ( ON ?auto_1312174 ?auto_1312170 ) ( ON ?auto_1312176 ?auto_1312174 ) ( ON ?auto_1312175 ?auto_1312176 ) ( not ( = ?auto_1312171 ?auto_1312172 ) ) ( not ( = ?auto_1312171 ?auto_1312173 ) ) ( not ( = ?auto_1312171 ?auto_1312170 ) ) ( not ( = ?auto_1312171 ?auto_1312174 ) ) ( not ( = ?auto_1312171 ?auto_1312176 ) ) ( not ( = ?auto_1312171 ?auto_1312175 ) ) ( not ( = ?auto_1312171 ?auto_1312177 ) ) ( not ( = ?auto_1312171 ?auto_1312178 ) ) ( not ( = ?auto_1312171 ?auto_1312179 ) ) ( not ( = ?auto_1312171 ?auto_1312181 ) ) ( not ( = ?auto_1312171 ?auto_1312182 ) ) ( not ( = ?auto_1312172 ?auto_1312173 ) ) ( not ( = ?auto_1312172 ?auto_1312170 ) ) ( not ( = ?auto_1312172 ?auto_1312174 ) ) ( not ( = ?auto_1312172 ?auto_1312176 ) ) ( not ( = ?auto_1312172 ?auto_1312175 ) ) ( not ( = ?auto_1312172 ?auto_1312177 ) ) ( not ( = ?auto_1312172 ?auto_1312178 ) ) ( not ( = ?auto_1312172 ?auto_1312179 ) ) ( not ( = ?auto_1312172 ?auto_1312181 ) ) ( not ( = ?auto_1312172 ?auto_1312182 ) ) ( not ( = ?auto_1312173 ?auto_1312170 ) ) ( not ( = ?auto_1312173 ?auto_1312174 ) ) ( not ( = ?auto_1312173 ?auto_1312176 ) ) ( not ( = ?auto_1312173 ?auto_1312175 ) ) ( not ( = ?auto_1312173 ?auto_1312177 ) ) ( not ( = ?auto_1312173 ?auto_1312178 ) ) ( not ( = ?auto_1312173 ?auto_1312179 ) ) ( not ( = ?auto_1312173 ?auto_1312181 ) ) ( not ( = ?auto_1312173 ?auto_1312182 ) ) ( not ( = ?auto_1312170 ?auto_1312174 ) ) ( not ( = ?auto_1312170 ?auto_1312176 ) ) ( not ( = ?auto_1312170 ?auto_1312175 ) ) ( not ( = ?auto_1312170 ?auto_1312177 ) ) ( not ( = ?auto_1312170 ?auto_1312178 ) ) ( not ( = ?auto_1312170 ?auto_1312179 ) ) ( not ( = ?auto_1312170 ?auto_1312181 ) ) ( not ( = ?auto_1312170 ?auto_1312182 ) ) ( not ( = ?auto_1312174 ?auto_1312176 ) ) ( not ( = ?auto_1312174 ?auto_1312175 ) ) ( not ( = ?auto_1312174 ?auto_1312177 ) ) ( not ( = ?auto_1312174 ?auto_1312178 ) ) ( not ( = ?auto_1312174 ?auto_1312179 ) ) ( not ( = ?auto_1312174 ?auto_1312181 ) ) ( not ( = ?auto_1312174 ?auto_1312182 ) ) ( not ( = ?auto_1312176 ?auto_1312175 ) ) ( not ( = ?auto_1312176 ?auto_1312177 ) ) ( not ( = ?auto_1312176 ?auto_1312178 ) ) ( not ( = ?auto_1312176 ?auto_1312179 ) ) ( not ( = ?auto_1312176 ?auto_1312181 ) ) ( not ( = ?auto_1312176 ?auto_1312182 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1312177 ?auto_1312178 ?auto_1312179 )
      ( MAKE-9CRATE-VERIFY ?auto_1312171 ?auto_1312172 ?auto_1312173 ?auto_1312170 ?auto_1312174 ?auto_1312176 ?auto_1312175 ?auto_1312177 ?auto_1312178 ?auto_1312179 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1312188 - SURFACE
      ?auto_1312189 - SURFACE
      ?auto_1312190 - SURFACE
      ?auto_1312187 - SURFACE
      ?auto_1312191 - SURFACE
      ?auto_1312193 - SURFACE
      ?auto_1312192 - SURFACE
      ?auto_1312194 - SURFACE
      ?auto_1312195 - SURFACE
      ?auto_1312196 - SURFACE
      ?auto_1312197 - SURFACE
    )
    :vars
    (
      ?auto_1312201 - HOIST
      ?auto_1312198 - PLACE
      ?auto_1312202 - PLACE
      ?auto_1312203 - HOIST
      ?auto_1312199 - SURFACE
      ?auto_1312200 - SURFACE
      ?auto_1312204 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1312201 ?auto_1312198 ) ( IS-CRATE ?auto_1312197 ) ( not ( = ?auto_1312196 ?auto_1312197 ) ) ( not ( = ?auto_1312195 ?auto_1312196 ) ) ( not ( = ?auto_1312195 ?auto_1312197 ) ) ( not ( = ?auto_1312202 ?auto_1312198 ) ) ( HOIST-AT ?auto_1312203 ?auto_1312202 ) ( not ( = ?auto_1312201 ?auto_1312203 ) ) ( SURFACE-AT ?auto_1312197 ?auto_1312202 ) ( ON ?auto_1312197 ?auto_1312199 ) ( CLEAR ?auto_1312197 ) ( not ( = ?auto_1312196 ?auto_1312199 ) ) ( not ( = ?auto_1312197 ?auto_1312199 ) ) ( not ( = ?auto_1312195 ?auto_1312199 ) ) ( IS-CRATE ?auto_1312196 ) ( AVAILABLE ?auto_1312203 ) ( SURFACE-AT ?auto_1312196 ?auto_1312202 ) ( ON ?auto_1312196 ?auto_1312200 ) ( CLEAR ?auto_1312196 ) ( not ( = ?auto_1312196 ?auto_1312200 ) ) ( not ( = ?auto_1312197 ?auto_1312200 ) ) ( not ( = ?auto_1312195 ?auto_1312200 ) ) ( not ( = ?auto_1312199 ?auto_1312200 ) ) ( TRUCK-AT ?auto_1312204 ?auto_1312198 ) ( SURFACE-AT ?auto_1312194 ?auto_1312198 ) ( CLEAR ?auto_1312194 ) ( LIFTING ?auto_1312201 ?auto_1312195 ) ( IS-CRATE ?auto_1312195 ) ( not ( = ?auto_1312194 ?auto_1312195 ) ) ( not ( = ?auto_1312196 ?auto_1312194 ) ) ( not ( = ?auto_1312197 ?auto_1312194 ) ) ( not ( = ?auto_1312199 ?auto_1312194 ) ) ( not ( = ?auto_1312200 ?auto_1312194 ) ) ( ON ?auto_1312189 ?auto_1312188 ) ( ON ?auto_1312190 ?auto_1312189 ) ( ON ?auto_1312187 ?auto_1312190 ) ( ON ?auto_1312191 ?auto_1312187 ) ( ON ?auto_1312193 ?auto_1312191 ) ( ON ?auto_1312192 ?auto_1312193 ) ( ON ?auto_1312194 ?auto_1312192 ) ( not ( = ?auto_1312188 ?auto_1312189 ) ) ( not ( = ?auto_1312188 ?auto_1312190 ) ) ( not ( = ?auto_1312188 ?auto_1312187 ) ) ( not ( = ?auto_1312188 ?auto_1312191 ) ) ( not ( = ?auto_1312188 ?auto_1312193 ) ) ( not ( = ?auto_1312188 ?auto_1312192 ) ) ( not ( = ?auto_1312188 ?auto_1312194 ) ) ( not ( = ?auto_1312188 ?auto_1312195 ) ) ( not ( = ?auto_1312188 ?auto_1312196 ) ) ( not ( = ?auto_1312188 ?auto_1312197 ) ) ( not ( = ?auto_1312188 ?auto_1312199 ) ) ( not ( = ?auto_1312188 ?auto_1312200 ) ) ( not ( = ?auto_1312189 ?auto_1312190 ) ) ( not ( = ?auto_1312189 ?auto_1312187 ) ) ( not ( = ?auto_1312189 ?auto_1312191 ) ) ( not ( = ?auto_1312189 ?auto_1312193 ) ) ( not ( = ?auto_1312189 ?auto_1312192 ) ) ( not ( = ?auto_1312189 ?auto_1312194 ) ) ( not ( = ?auto_1312189 ?auto_1312195 ) ) ( not ( = ?auto_1312189 ?auto_1312196 ) ) ( not ( = ?auto_1312189 ?auto_1312197 ) ) ( not ( = ?auto_1312189 ?auto_1312199 ) ) ( not ( = ?auto_1312189 ?auto_1312200 ) ) ( not ( = ?auto_1312190 ?auto_1312187 ) ) ( not ( = ?auto_1312190 ?auto_1312191 ) ) ( not ( = ?auto_1312190 ?auto_1312193 ) ) ( not ( = ?auto_1312190 ?auto_1312192 ) ) ( not ( = ?auto_1312190 ?auto_1312194 ) ) ( not ( = ?auto_1312190 ?auto_1312195 ) ) ( not ( = ?auto_1312190 ?auto_1312196 ) ) ( not ( = ?auto_1312190 ?auto_1312197 ) ) ( not ( = ?auto_1312190 ?auto_1312199 ) ) ( not ( = ?auto_1312190 ?auto_1312200 ) ) ( not ( = ?auto_1312187 ?auto_1312191 ) ) ( not ( = ?auto_1312187 ?auto_1312193 ) ) ( not ( = ?auto_1312187 ?auto_1312192 ) ) ( not ( = ?auto_1312187 ?auto_1312194 ) ) ( not ( = ?auto_1312187 ?auto_1312195 ) ) ( not ( = ?auto_1312187 ?auto_1312196 ) ) ( not ( = ?auto_1312187 ?auto_1312197 ) ) ( not ( = ?auto_1312187 ?auto_1312199 ) ) ( not ( = ?auto_1312187 ?auto_1312200 ) ) ( not ( = ?auto_1312191 ?auto_1312193 ) ) ( not ( = ?auto_1312191 ?auto_1312192 ) ) ( not ( = ?auto_1312191 ?auto_1312194 ) ) ( not ( = ?auto_1312191 ?auto_1312195 ) ) ( not ( = ?auto_1312191 ?auto_1312196 ) ) ( not ( = ?auto_1312191 ?auto_1312197 ) ) ( not ( = ?auto_1312191 ?auto_1312199 ) ) ( not ( = ?auto_1312191 ?auto_1312200 ) ) ( not ( = ?auto_1312193 ?auto_1312192 ) ) ( not ( = ?auto_1312193 ?auto_1312194 ) ) ( not ( = ?auto_1312193 ?auto_1312195 ) ) ( not ( = ?auto_1312193 ?auto_1312196 ) ) ( not ( = ?auto_1312193 ?auto_1312197 ) ) ( not ( = ?auto_1312193 ?auto_1312199 ) ) ( not ( = ?auto_1312193 ?auto_1312200 ) ) ( not ( = ?auto_1312192 ?auto_1312194 ) ) ( not ( = ?auto_1312192 ?auto_1312195 ) ) ( not ( = ?auto_1312192 ?auto_1312196 ) ) ( not ( = ?auto_1312192 ?auto_1312197 ) ) ( not ( = ?auto_1312192 ?auto_1312199 ) ) ( not ( = ?auto_1312192 ?auto_1312200 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1312195 ?auto_1312196 ?auto_1312197 )
      ( MAKE-10CRATE-VERIFY ?auto_1312188 ?auto_1312189 ?auto_1312190 ?auto_1312187 ?auto_1312191 ?auto_1312193 ?auto_1312192 ?auto_1312194 ?auto_1312195 ?auto_1312196 ?auto_1312197 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1312206 - SURFACE
      ?auto_1312207 - SURFACE
      ?auto_1312208 - SURFACE
      ?auto_1312205 - SURFACE
      ?auto_1312209 - SURFACE
      ?auto_1312211 - SURFACE
      ?auto_1312210 - SURFACE
      ?auto_1312212 - SURFACE
      ?auto_1312213 - SURFACE
      ?auto_1312214 - SURFACE
      ?auto_1312215 - SURFACE
      ?auto_1312216 - SURFACE
    )
    :vars
    (
      ?auto_1312220 - HOIST
      ?auto_1312217 - PLACE
      ?auto_1312221 - PLACE
      ?auto_1312222 - HOIST
      ?auto_1312218 - SURFACE
      ?auto_1312219 - SURFACE
      ?auto_1312223 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1312220 ?auto_1312217 ) ( IS-CRATE ?auto_1312216 ) ( not ( = ?auto_1312215 ?auto_1312216 ) ) ( not ( = ?auto_1312214 ?auto_1312215 ) ) ( not ( = ?auto_1312214 ?auto_1312216 ) ) ( not ( = ?auto_1312221 ?auto_1312217 ) ) ( HOIST-AT ?auto_1312222 ?auto_1312221 ) ( not ( = ?auto_1312220 ?auto_1312222 ) ) ( SURFACE-AT ?auto_1312216 ?auto_1312221 ) ( ON ?auto_1312216 ?auto_1312218 ) ( CLEAR ?auto_1312216 ) ( not ( = ?auto_1312215 ?auto_1312218 ) ) ( not ( = ?auto_1312216 ?auto_1312218 ) ) ( not ( = ?auto_1312214 ?auto_1312218 ) ) ( IS-CRATE ?auto_1312215 ) ( AVAILABLE ?auto_1312222 ) ( SURFACE-AT ?auto_1312215 ?auto_1312221 ) ( ON ?auto_1312215 ?auto_1312219 ) ( CLEAR ?auto_1312215 ) ( not ( = ?auto_1312215 ?auto_1312219 ) ) ( not ( = ?auto_1312216 ?auto_1312219 ) ) ( not ( = ?auto_1312214 ?auto_1312219 ) ) ( not ( = ?auto_1312218 ?auto_1312219 ) ) ( TRUCK-AT ?auto_1312223 ?auto_1312217 ) ( SURFACE-AT ?auto_1312213 ?auto_1312217 ) ( CLEAR ?auto_1312213 ) ( LIFTING ?auto_1312220 ?auto_1312214 ) ( IS-CRATE ?auto_1312214 ) ( not ( = ?auto_1312213 ?auto_1312214 ) ) ( not ( = ?auto_1312215 ?auto_1312213 ) ) ( not ( = ?auto_1312216 ?auto_1312213 ) ) ( not ( = ?auto_1312218 ?auto_1312213 ) ) ( not ( = ?auto_1312219 ?auto_1312213 ) ) ( ON ?auto_1312207 ?auto_1312206 ) ( ON ?auto_1312208 ?auto_1312207 ) ( ON ?auto_1312205 ?auto_1312208 ) ( ON ?auto_1312209 ?auto_1312205 ) ( ON ?auto_1312211 ?auto_1312209 ) ( ON ?auto_1312210 ?auto_1312211 ) ( ON ?auto_1312212 ?auto_1312210 ) ( ON ?auto_1312213 ?auto_1312212 ) ( not ( = ?auto_1312206 ?auto_1312207 ) ) ( not ( = ?auto_1312206 ?auto_1312208 ) ) ( not ( = ?auto_1312206 ?auto_1312205 ) ) ( not ( = ?auto_1312206 ?auto_1312209 ) ) ( not ( = ?auto_1312206 ?auto_1312211 ) ) ( not ( = ?auto_1312206 ?auto_1312210 ) ) ( not ( = ?auto_1312206 ?auto_1312212 ) ) ( not ( = ?auto_1312206 ?auto_1312213 ) ) ( not ( = ?auto_1312206 ?auto_1312214 ) ) ( not ( = ?auto_1312206 ?auto_1312215 ) ) ( not ( = ?auto_1312206 ?auto_1312216 ) ) ( not ( = ?auto_1312206 ?auto_1312218 ) ) ( not ( = ?auto_1312206 ?auto_1312219 ) ) ( not ( = ?auto_1312207 ?auto_1312208 ) ) ( not ( = ?auto_1312207 ?auto_1312205 ) ) ( not ( = ?auto_1312207 ?auto_1312209 ) ) ( not ( = ?auto_1312207 ?auto_1312211 ) ) ( not ( = ?auto_1312207 ?auto_1312210 ) ) ( not ( = ?auto_1312207 ?auto_1312212 ) ) ( not ( = ?auto_1312207 ?auto_1312213 ) ) ( not ( = ?auto_1312207 ?auto_1312214 ) ) ( not ( = ?auto_1312207 ?auto_1312215 ) ) ( not ( = ?auto_1312207 ?auto_1312216 ) ) ( not ( = ?auto_1312207 ?auto_1312218 ) ) ( not ( = ?auto_1312207 ?auto_1312219 ) ) ( not ( = ?auto_1312208 ?auto_1312205 ) ) ( not ( = ?auto_1312208 ?auto_1312209 ) ) ( not ( = ?auto_1312208 ?auto_1312211 ) ) ( not ( = ?auto_1312208 ?auto_1312210 ) ) ( not ( = ?auto_1312208 ?auto_1312212 ) ) ( not ( = ?auto_1312208 ?auto_1312213 ) ) ( not ( = ?auto_1312208 ?auto_1312214 ) ) ( not ( = ?auto_1312208 ?auto_1312215 ) ) ( not ( = ?auto_1312208 ?auto_1312216 ) ) ( not ( = ?auto_1312208 ?auto_1312218 ) ) ( not ( = ?auto_1312208 ?auto_1312219 ) ) ( not ( = ?auto_1312205 ?auto_1312209 ) ) ( not ( = ?auto_1312205 ?auto_1312211 ) ) ( not ( = ?auto_1312205 ?auto_1312210 ) ) ( not ( = ?auto_1312205 ?auto_1312212 ) ) ( not ( = ?auto_1312205 ?auto_1312213 ) ) ( not ( = ?auto_1312205 ?auto_1312214 ) ) ( not ( = ?auto_1312205 ?auto_1312215 ) ) ( not ( = ?auto_1312205 ?auto_1312216 ) ) ( not ( = ?auto_1312205 ?auto_1312218 ) ) ( not ( = ?auto_1312205 ?auto_1312219 ) ) ( not ( = ?auto_1312209 ?auto_1312211 ) ) ( not ( = ?auto_1312209 ?auto_1312210 ) ) ( not ( = ?auto_1312209 ?auto_1312212 ) ) ( not ( = ?auto_1312209 ?auto_1312213 ) ) ( not ( = ?auto_1312209 ?auto_1312214 ) ) ( not ( = ?auto_1312209 ?auto_1312215 ) ) ( not ( = ?auto_1312209 ?auto_1312216 ) ) ( not ( = ?auto_1312209 ?auto_1312218 ) ) ( not ( = ?auto_1312209 ?auto_1312219 ) ) ( not ( = ?auto_1312211 ?auto_1312210 ) ) ( not ( = ?auto_1312211 ?auto_1312212 ) ) ( not ( = ?auto_1312211 ?auto_1312213 ) ) ( not ( = ?auto_1312211 ?auto_1312214 ) ) ( not ( = ?auto_1312211 ?auto_1312215 ) ) ( not ( = ?auto_1312211 ?auto_1312216 ) ) ( not ( = ?auto_1312211 ?auto_1312218 ) ) ( not ( = ?auto_1312211 ?auto_1312219 ) ) ( not ( = ?auto_1312210 ?auto_1312212 ) ) ( not ( = ?auto_1312210 ?auto_1312213 ) ) ( not ( = ?auto_1312210 ?auto_1312214 ) ) ( not ( = ?auto_1312210 ?auto_1312215 ) ) ( not ( = ?auto_1312210 ?auto_1312216 ) ) ( not ( = ?auto_1312210 ?auto_1312218 ) ) ( not ( = ?auto_1312210 ?auto_1312219 ) ) ( not ( = ?auto_1312212 ?auto_1312213 ) ) ( not ( = ?auto_1312212 ?auto_1312214 ) ) ( not ( = ?auto_1312212 ?auto_1312215 ) ) ( not ( = ?auto_1312212 ?auto_1312216 ) ) ( not ( = ?auto_1312212 ?auto_1312218 ) ) ( not ( = ?auto_1312212 ?auto_1312219 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1312214 ?auto_1312215 ?auto_1312216 )
      ( MAKE-11CRATE-VERIFY ?auto_1312206 ?auto_1312207 ?auto_1312208 ?auto_1312205 ?auto_1312209 ?auto_1312211 ?auto_1312210 ?auto_1312212 ?auto_1312213 ?auto_1312214 ?auto_1312215 ?auto_1312216 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1312225 - SURFACE
      ?auto_1312226 - SURFACE
      ?auto_1312227 - SURFACE
      ?auto_1312224 - SURFACE
      ?auto_1312228 - SURFACE
      ?auto_1312230 - SURFACE
      ?auto_1312229 - SURFACE
      ?auto_1312231 - SURFACE
      ?auto_1312232 - SURFACE
      ?auto_1312233 - SURFACE
      ?auto_1312234 - SURFACE
      ?auto_1312235 - SURFACE
      ?auto_1312236 - SURFACE
    )
    :vars
    (
      ?auto_1312240 - HOIST
      ?auto_1312237 - PLACE
      ?auto_1312241 - PLACE
      ?auto_1312242 - HOIST
      ?auto_1312238 - SURFACE
      ?auto_1312239 - SURFACE
      ?auto_1312243 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1312240 ?auto_1312237 ) ( IS-CRATE ?auto_1312236 ) ( not ( = ?auto_1312235 ?auto_1312236 ) ) ( not ( = ?auto_1312234 ?auto_1312235 ) ) ( not ( = ?auto_1312234 ?auto_1312236 ) ) ( not ( = ?auto_1312241 ?auto_1312237 ) ) ( HOIST-AT ?auto_1312242 ?auto_1312241 ) ( not ( = ?auto_1312240 ?auto_1312242 ) ) ( SURFACE-AT ?auto_1312236 ?auto_1312241 ) ( ON ?auto_1312236 ?auto_1312238 ) ( CLEAR ?auto_1312236 ) ( not ( = ?auto_1312235 ?auto_1312238 ) ) ( not ( = ?auto_1312236 ?auto_1312238 ) ) ( not ( = ?auto_1312234 ?auto_1312238 ) ) ( IS-CRATE ?auto_1312235 ) ( AVAILABLE ?auto_1312242 ) ( SURFACE-AT ?auto_1312235 ?auto_1312241 ) ( ON ?auto_1312235 ?auto_1312239 ) ( CLEAR ?auto_1312235 ) ( not ( = ?auto_1312235 ?auto_1312239 ) ) ( not ( = ?auto_1312236 ?auto_1312239 ) ) ( not ( = ?auto_1312234 ?auto_1312239 ) ) ( not ( = ?auto_1312238 ?auto_1312239 ) ) ( TRUCK-AT ?auto_1312243 ?auto_1312237 ) ( SURFACE-AT ?auto_1312233 ?auto_1312237 ) ( CLEAR ?auto_1312233 ) ( LIFTING ?auto_1312240 ?auto_1312234 ) ( IS-CRATE ?auto_1312234 ) ( not ( = ?auto_1312233 ?auto_1312234 ) ) ( not ( = ?auto_1312235 ?auto_1312233 ) ) ( not ( = ?auto_1312236 ?auto_1312233 ) ) ( not ( = ?auto_1312238 ?auto_1312233 ) ) ( not ( = ?auto_1312239 ?auto_1312233 ) ) ( ON ?auto_1312226 ?auto_1312225 ) ( ON ?auto_1312227 ?auto_1312226 ) ( ON ?auto_1312224 ?auto_1312227 ) ( ON ?auto_1312228 ?auto_1312224 ) ( ON ?auto_1312230 ?auto_1312228 ) ( ON ?auto_1312229 ?auto_1312230 ) ( ON ?auto_1312231 ?auto_1312229 ) ( ON ?auto_1312232 ?auto_1312231 ) ( ON ?auto_1312233 ?auto_1312232 ) ( not ( = ?auto_1312225 ?auto_1312226 ) ) ( not ( = ?auto_1312225 ?auto_1312227 ) ) ( not ( = ?auto_1312225 ?auto_1312224 ) ) ( not ( = ?auto_1312225 ?auto_1312228 ) ) ( not ( = ?auto_1312225 ?auto_1312230 ) ) ( not ( = ?auto_1312225 ?auto_1312229 ) ) ( not ( = ?auto_1312225 ?auto_1312231 ) ) ( not ( = ?auto_1312225 ?auto_1312232 ) ) ( not ( = ?auto_1312225 ?auto_1312233 ) ) ( not ( = ?auto_1312225 ?auto_1312234 ) ) ( not ( = ?auto_1312225 ?auto_1312235 ) ) ( not ( = ?auto_1312225 ?auto_1312236 ) ) ( not ( = ?auto_1312225 ?auto_1312238 ) ) ( not ( = ?auto_1312225 ?auto_1312239 ) ) ( not ( = ?auto_1312226 ?auto_1312227 ) ) ( not ( = ?auto_1312226 ?auto_1312224 ) ) ( not ( = ?auto_1312226 ?auto_1312228 ) ) ( not ( = ?auto_1312226 ?auto_1312230 ) ) ( not ( = ?auto_1312226 ?auto_1312229 ) ) ( not ( = ?auto_1312226 ?auto_1312231 ) ) ( not ( = ?auto_1312226 ?auto_1312232 ) ) ( not ( = ?auto_1312226 ?auto_1312233 ) ) ( not ( = ?auto_1312226 ?auto_1312234 ) ) ( not ( = ?auto_1312226 ?auto_1312235 ) ) ( not ( = ?auto_1312226 ?auto_1312236 ) ) ( not ( = ?auto_1312226 ?auto_1312238 ) ) ( not ( = ?auto_1312226 ?auto_1312239 ) ) ( not ( = ?auto_1312227 ?auto_1312224 ) ) ( not ( = ?auto_1312227 ?auto_1312228 ) ) ( not ( = ?auto_1312227 ?auto_1312230 ) ) ( not ( = ?auto_1312227 ?auto_1312229 ) ) ( not ( = ?auto_1312227 ?auto_1312231 ) ) ( not ( = ?auto_1312227 ?auto_1312232 ) ) ( not ( = ?auto_1312227 ?auto_1312233 ) ) ( not ( = ?auto_1312227 ?auto_1312234 ) ) ( not ( = ?auto_1312227 ?auto_1312235 ) ) ( not ( = ?auto_1312227 ?auto_1312236 ) ) ( not ( = ?auto_1312227 ?auto_1312238 ) ) ( not ( = ?auto_1312227 ?auto_1312239 ) ) ( not ( = ?auto_1312224 ?auto_1312228 ) ) ( not ( = ?auto_1312224 ?auto_1312230 ) ) ( not ( = ?auto_1312224 ?auto_1312229 ) ) ( not ( = ?auto_1312224 ?auto_1312231 ) ) ( not ( = ?auto_1312224 ?auto_1312232 ) ) ( not ( = ?auto_1312224 ?auto_1312233 ) ) ( not ( = ?auto_1312224 ?auto_1312234 ) ) ( not ( = ?auto_1312224 ?auto_1312235 ) ) ( not ( = ?auto_1312224 ?auto_1312236 ) ) ( not ( = ?auto_1312224 ?auto_1312238 ) ) ( not ( = ?auto_1312224 ?auto_1312239 ) ) ( not ( = ?auto_1312228 ?auto_1312230 ) ) ( not ( = ?auto_1312228 ?auto_1312229 ) ) ( not ( = ?auto_1312228 ?auto_1312231 ) ) ( not ( = ?auto_1312228 ?auto_1312232 ) ) ( not ( = ?auto_1312228 ?auto_1312233 ) ) ( not ( = ?auto_1312228 ?auto_1312234 ) ) ( not ( = ?auto_1312228 ?auto_1312235 ) ) ( not ( = ?auto_1312228 ?auto_1312236 ) ) ( not ( = ?auto_1312228 ?auto_1312238 ) ) ( not ( = ?auto_1312228 ?auto_1312239 ) ) ( not ( = ?auto_1312230 ?auto_1312229 ) ) ( not ( = ?auto_1312230 ?auto_1312231 ) ) ( not ( = ?auto_1312230 ?auto_1312232 ) ) ( not ( = ?auto_1312230 ?auto_1312233 ) ) ( not ( = ?auto_1312230 ?auto_1312234 ) ) ( not ( = ?auto_1312230 ?auto_1312235 ) ) ( not ( = ?auto_1312230 ?auto_1312236 ) ) ( not ( = ?auto_1312230 ?auto_1312238 ) ) ( not ( = ?auto_1312230 ?auto_1312239 ) ) ( not ( = ?auto_1312229 ?auto_1312231 ) ) ( not ( = ?auto_1312229 ?auto_1312232 ) ) ( not ( = ?auto_1312229 ?auto_1312233 ) ) ( not ( = ?auto_1312229 ?auto_1312234 ) ) ( not ( = ?auto_1312229 ?auto_1312235 ) ) ( not ( = ?auto_1312229 ?auto_1312236 ) ) ( not ( = ?auto_1312229 ?auto_1312238 ) ) ( not ( = ?auto_1312229 ?auto_1312239 ) ) ( not ( = ?auto_1312231 ?auto_1312232 ) ) ( not ( = ?auto_1312231 ?auto_1312233 ) ) ( not ( = ?auto_1312231 ?auto_1312234 ) ) ( not ( = ?auto_1312231 ?auto_1312235 ) ) ( not ( = ?auto_1312231 ?auto_1312236 ) ) ( not ( = ?auto_1312231 ?auto_1312238 ) ) ( not ( = ?auto_1312231 ?auto_1312239 ) ) ( not ( = ?auto_1312232 ?auto_1312233 ) ) ( not ( = ?auto_1312232 ?auto_1312234 ) ) ( not ( = ?auto_1312232 ?auto_1312235 ) ) ( not ( = ?auto_1312232 ?auto_1312236 ) ) ( not ( = ?auto_1312232 ?auto_1312238 ) ) ( not ( = ?auto_1312232 ?auto_1312239 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1312234 ?auto_1312235 ?auto_1312236 )
      ( MAKE-12CRATE-VERIFY ?auto_1312225 ?auto_1312226 ?auto_1312227 ?auto_1312224 ?auto_1312228 ?auto_1312230 ?auto_1312229 ?auto_1312231 ?auto_1312232 ?auto_1312233 ?auto_1312234 ?auto_1312235 ?auto_1312236 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1312245 - SURFACE
      ?auto_1312246 - SURFACE
      ?auto_1312247 - SURFACE
      ?auto_1312244 - SURFACE
      ?auto_1312248 - SURFACE
      ?auto_1312250 - SURFACE
      ?auto_1312249 - SURFACE
      ?auto_1312251 - SURFACE
      ?auto_1312252 - SURFACE
      ?auto_1312253 - SURFACE
      ?auto_1312254 - SURFACE
      ?auto_1312255 - SURFACE
      ?auto_1312256 - SURFACE
      ?auto_1312257 - SURFACE
    )
    :vars
    (
      ?auto_1312261 - HOIST
      ?auto_1312258 - PLACE
      ?auto_1312262 - PLACE
      ?auto_1312263 - HOIST
      ?auto_1312259 - SURFACE
      ?auto_1312260 - SURFACE
      ?auto_1312264 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1312261 ?auto_1312258 ) ( IS-CRATE ?auto_1312257 ) ( not ( = ?auto_1312256 ?auto_1312257 ) ) ( not ( = ?auto_1312255 ?auto_1312256 ) ) ( not ( = ?auto_1312255 ?auto_1312257 ) ) ( not ( = ?auto_1312262 ?auto_1312258 ) ) ( HOIST-AT ?auto_1312263 ?auto_1312262 ) ( not ( = ?auto_1312261 ?auto_1312263 ) ) ( SURFACE-AT ?auto_1312257 ?auto_1312262 ) ( ON ?auto_1312257 ?auto_1312259 ) ( CLEAR ?auto_1312257 ) ( not ( = ?auto_1312256 ?auto_1312259 ) ) ( not ( = ?auto_1312257 ?auto_1312259 ) ) ( not ( = ?auto_1312255 ?auto_1312259 ) ) ( IS-CRATE ?auto_1312256 ) ( AVAILABLE ?auto_1312263 ) ( SURFACE-AT ?auto_1312256 ?auto_1312262 ) ( ON ?auto_1312256 ?auto_1312260 ) ( CLEAR ?auto_1312256 ) ( not ( = ?auto_1312256 ?auto_1312260 ) ) ( not ( = ?auto_1312257 ?auto_1312260 ) ) ( not ( = ?auto_1312255 ?auto_1312260 ) ) ( not ( = ?auto_1312259 ?auto_1312260 ) ) ( TRUCK-AT ?auto_1312264 ?auto_1312258 ) ( SURFACE-AT ?auto_1312254 ?auto_1312258 ) ( CLEAR ?auto_1312254 ) ( LIFTING ?auto_1312261 ?auto_1312255 ) ( IS-CRATE ?auto_1312255 ) ( not ( = ?auto_1312254 ?auto_1312255 ) ) ( not ( = ?auto_1312256 ?auto_1312254 ) ) ( not ( = ?auto_1312257 ?auto_1312254 ) ) ( not ( = ?auto_1312259 ?auto_1312254 ) ) ( not ( = ?auto_1312260 ?auto_1312254 ) ) ( ON ?auto_1312246 ?auto_1312245 ) ( ON ?auto_1312247 ?auto_1312246 ) ( ON ?auto_1312244 ?auto_1312247 ) ( ON ?auto_1312248 ?auto_1312244 ) ( ON ?auto_1312250 ?auto_1312248 ) ( ON ?auto_1312249 ?auto_1312250 ) ( ON ?auto_1312251 ?auto_1312249 ) ( ON ?auto_1312252 ?auto_1312251 ) ( ON ?auto_1312253 ?auto_1312252 ) ( ON ?auto_1312254 ?auto_1312253 ) ( not ( = ?auto_1312245 ?auto_1312246 ) ) ( not ( = ?auto_1312245 ?auto_1312247 ) ) ( not ( = ?auto_1312245 ?auto_1312244 ) ) ( not ( = ?auto_1312245 ?auto_1312248 ) ) ( not ( = ?auto_1312245 ?auto_1312250 ) ) ( not ( = ?auto_1312245 ?auto_1312249 ) ) ( not ( = ?auto_1312245 ?auto_1312251 ) ) ( not ( = ?auto_1312245 ?auto_1312252 ) ) ( not ( = ?auto_1312245 ?auto_1312253 ) ) ( not ( = ?auto_1312245 ?auto_1312254 ) ) ( not ( = ?auto_1312245 ?auto_1312255 ) ) ( not ( = ?auto_1312245 ?auto_1312256 ) ) ( not ( = ?auto_1312245 ?auto_1312257 ) ) ( not ( = ?auto_1312245 ?auto_1312259 ) ) ( not ( = ?auto_1312245 ?auto_1312260 ) ) ( not ( = ?auto_1312246 ?auto_1312247 ) ) ( not ( = ?auto_1312246 ?auto_1312244 ) ) ( not ( = ?auto_1312246 ?auto_1312248 ) ) ( not ( = ?auto_1312246 ?auto_1312250 ) ) ( not ( = ?auto_1312246 ?auto_1312249 ) ) ( not ( = ?auto_1312246 ?auto_1312251 ) ) ( not ( = ?auto_1312246 ?auto_1312252 ) ) ( not ( = ?auto_1312246 ?auto_1312253 ) ) ( not ( = ?auto_1312246 ?auto_1312254 ) ) ( not ( = ?auto_1312246 ?auto_1312255 ) ) ( not ( = ?auto_1312246 ?auto_1312256 ) ) ( not ( = ?auto_1312246 ?auto_1312257 ) ) ( not ( = ?auto_1312246 ?auto_1312259 ) ) ( not ( = ?auto_1312246 ?auto_1312260 ) ) ( not ( = ?auto_1312247 ?auto_1312244 ) ) ( not ( = ?auto_1312247 ?auto_1312248 ) ) ( not ( = ?auto_1312247 ?auto_1312250 ) ) ( not ( = ?auto_1312247 ?auto_1312249 ) ) ( not ( = ?auto_1312247 ?auto_1312251 ) ) ( not ( = ?auto_1312247 ?auto_1312252 ) ) ( not ( = ?auto_1312247 ?auto_1312253 ) ) ( not ( = ?auto_1312247 ?auto_1312254 ) ) ( not ( = ?auto_1312247 ?auto_1312255 ) ) ( not ( = ?auto_1312247 ?auto_1312256 ) ) ( not ( = ?auto_1312247 ?auto_1312257 ) ) ( not ( = ?auto_1312247 ?auto_1312259 ) ) ( not ( = ?auto_1312247 ?auto_1312260 ) ) ( not ( = ?auto_1312244 ?auto_1312248 ) ) ( not ( = ?auto_1312244 ?auto_1312250 ) ) ( not ( = ?auto_1312244 ?auto_1312249 ) ) ( not ( = ?auto_1312244 ?auto_1312251 ) ) ( not ( = ?auto_1312244 ?auto_1312252 ) ) ( not ( = ?auto_1312244 ?auto_1312253 ) ) ( not ( = ?auto_1312244 ?auto_1312254 ) ) ( not ( = ?auto_1312244 ?auto_1312255 ) ) ( not ( = ?auto_1312244 ?auto_1312256 ) ) ( not ( = ?auto_1312244 ?auto_1312257 ) ) ( not ( = ?auto_1312244 ?auto_1312259 ) ) ( not ( = ?auto_1312244 ?auto_1312260 ) ) ( not ( = ?auto_1312248 ?auto_1312250 ) ) ( not ( = ?auto_1312248 ?auto_1312249 ) ) ( not ( = ?auto_1312248 ?auto_1312251 ) ) ( not ( = ?auto_1312248 ?auto_1312252 ) ) ( not ( = ?auto_1312248 ?auto_1312253 ) ) ( not ( = ?auto_1312248 ?auto_1312254 ) ) ( not ( = ?auto_1312248 ?auto_1312255 ) ) ( not ( = ?auto_1312248 ?auto_1312256 ) ) ( not ( = ?auto_1312248 ?auto_1312257 ) ) ( not ( = ?auto_1312248 ?auto_1312259 ) ) ( not ( = ?auto_1312248 ?auto_1312260 ) ) ( not ( = ?auto_1312250 ?auto_1312249 ) ) ( not ( = ?auto_1312250 ?auto_1312251 ) ) ( not ( = ?auto_1312250 ?auto_1312252 ) ) ( not ( = ?auto_1312250 ?auto_1312253 ) ) ( not ( = ?auto_1312250 ?auto_1312254 ) ) ( not ( = ?auto_1312250 ?auto_1312255 ) ) ( not ( = ?auto_1312250 ?auto_1312256 ) ) ( not ( = ?auto_1312250 ?auto_1312257 ) ) ( not ( = ?auto_1312250 ?auto_1312259 ) ) ( not ( = ?auto_1312250 ?auto_1312260 ) ) ( not ( = ?auto_1312249 ?auto_1312251 ) ) ( not ( = ?auto_1312249 ?auto_1312252 ) ) ( not ( = ?auto_1312249 ?auto_1312253 ) ) ( not ( = ?auto_1312249 ?auto_1312254 ) ) ( not ( = ?auto_1312249 ?auto_1312255 ) ) ( not ( = ?auto_1312249 ?auto_1312256 ) ) ( not ( = ?auto_1312249 ?auto_1312257 ) ) ( not ( = ?auto_1312249 ?auto_1312259 ) ) ( not ( = ?auto_1312249 ?auto_1312260 ) ) ( not ( = ?auto_1312251 ?auto_1312252 ) ) ( not ( = ?auto_1312251 ?auto_1312253 ) ) ( not ( = ?auto_1312251 ?auto_1312254 ) ) ( not ( = ?auto_1312251 ?auto_1312255 ) ) ( not ( = ?auto_1312251 ?auto_1312256 ) ) ( not ( = ?auto_1312251 ?auto_1312257 ) ) ( not ( = ?auto_1312251 ?auto_1312259 ) ) ( not ( = ?auto_1312251 ?auto_1312260 ) ) ( not ( = ?auto_1312252 ?auto_1312253 ) ) ( not ( = ?auto_1312252 ?auto_1312254 ) ) ( not ( = ?auto_1312252 ?auto_1312255 ) ) ( not ( = ?auto_1312252 ?auto_1312256 ) ) ( not ( = ?auto_1312252 ?auto_1312257 ) ) ( not ( = ?auto_1312252 ?auto_1312259 ) ) ( not ( = ?auto_1312252 ?auto_1312260 ) ) ( not ( = ?auto_1312253 ?auto_1312254 ) ) ( not ( = ?auto_1312253 ?auto_1312255 ) ) ( not ( = ?auto_1312253 ?auto_1312256 ) ) ( not ( = ?auto_1312253 ?auto_1312257 ) ) ( not ( = ?auto_1312253 ?auto_1312259 ) ) ( not ( = ?auto_1312253 ?auto_1312260 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1312255 ?auto_1312256 ?auto_1312257 )
      ( MAKE-13CRATE-VERIFY ?auto_1312245 ?auto_1312246 ?auto_1312247 ?auto_1312244 ?auto_1312248 ?auto_1312250 ?auto_1312249 ?auto_1312251 ?auto_1312252 ?auto_1312253 ?auto_1312254 ?auto_1312255 ?auto_1312256 ?auto_1312257 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1320861 - SURFACE
      ?auto_1320862 - SURFACE
    )
    :vars
    (
      ?auto_1320868 - HOIST
      ?auto_1320869 - PLACE
      ?auto_1320866 - SURFACE
      ?auto_1320863 - PLACE
      ?auto_1320864 - HOIST
      ?auto_1320865 - SURFACE
      ?auto_1320870 - TRUCK
      ?auto_1320867 - SURFACE
      ?auto_1320871 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1320868 ?auto_1320869 ) ( IS-CRATE ?auto_1320862 ) ( not ( = ?auto_1320861 ?auto_1320862 ) ) ( not ( = ?auto_1320866 ?auto_1320861 ) ) ( not ( = ?auto_1320866 ?auto_1320862 ) ) ( not ( = ?auto_1320863 ?auto_1320869 ) ) ( HOIST-AT ?auto_1320864 ?auto_1320863 ) ( not ( = ?auto_1320868 ?auto_1320864 ) ) ( SURFACE-AT ?auto_1320862 ?auto_1320863 ) ( ON ?auto_1320862 ?auto_1320865 ) ( CLEAR ?auto_1320862 ) ( not ( = ?auto_1320861 ?auto_1320865 ) ) ( not ( = ?auto_1320862 ?auto_1320865 ) ) ( not ( = ?auto_1320866 ?auto_1320865 ) ) ( SURFACE-AT ?auto_1320866 ?auto_1320869 ) ( CLEAR ?auto_1320866 ) ( IS-CRATE ?auto_1320861 ) ( AVAILABLE ?auto_1320868 ) ( TRUCK-AT ?auto_1320870 ?auto_1320863 ) ( SURFACE-AT ?auto_1320861 ?auto_1320863 ) ( ON ?auto_1320861 ?auto_1320867 ) ( CLEAR ?auto_1320861 ) ( not ( = ?auto_1320861 ?auto_1320867 ) ) ( not ( = ?auto_1320862 ?auto_1320867 ) ) ( not ( = ?auto_1320866 ?auto_1320867 ) ) ( not ( = ?auto_1320865 ?auto_1320867 ) ) ( LIFTING ?auto_1320864 ?auto_1320871 ) ( IS-CRATE ?auto_1320871 ) ( not ( = ?auto_1320861 ?auto_1320871 ) ) ( not ( = ?auto_1320862 ?auto_1320871 ) ) ( not ( = ?auto_1320866 ?auto_1320871 ) ) ( not ( = ?auto_1320865 ?auto_1320871 ) ) ( not ( = ?auto_1320867 ?auto_1320871 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1320864 ?auto_1320871 ?auto_1320870 ?auto_1320863 )
      ( MAKE-2CRATE ?auto_1320866 ?auto_1320861 ?auto_1320862 )
      ( MAKE-1CRATE-VERIFY ?auto_1320861 ?auto_1320862 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1320872 - SURFACE
      ?auto_1320873 - SURFACE
      ?auto_1320874 - SURFACE
    )
    :vars
    (
      ?auto_1320880 - HOIST
      ?auto_1320882 - PLACE
      ?auto_1320879 - PLACE
      ?auto_1320878 - HOIST
      ?auto_1320881 - SURFACE
      ?auto_1320875 - TRUCK
      ?auto_1320876 - SURFACE
      ?auto_1320877 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1320880 ?auto_1320882 ) ( IS-CRATE ?auto_1320874 ) ( not ( = ?auto_1320873 ?auto_1320874 ) ) ( not ( = ?auto_1320872 ?auto_1320873 ) ) ( not ( = ?auto_1320872 ?auto_1320874 ) ) ( not ( = ?auto_1320879 ?auto_1320882 ) ) ( HOIST-AT ?auto_1320878 ?auto_1320879 ) ( not ( = ?auto_1320880 ?auto_1320878 ) ) ( SURFACE-AT ?auto_1320874 ?auto_1320879 ) ( ON ?auto_1320874 ?auto_1320881 ) ( CLEAR ?auto_1320874 ) ( not ( = ?auto_1320873 ?auto_1320881 ) ) ( not ( = ?auto_1320874 ?auto_1320881 ) ) ( not ( = ?auto_1320872 ?auto_1320881 ) ) ( SURFACE-AT ?auto_1320872 ?auto_1320882 ) ( CLEAR ?auto_1320872 ) ( IS-CRATE ?auto_1320873 ) ( AVAILABLE ?auto_1320880 ) ( TRUCK-AT ?auto_1320875 ?auto_1320879 ) ( SURFACE-AT ?auto_1320873 ?auto_1320879 ) ( ON ?auto_1320873 ?auto_1320876 ) ( CLEAR ?auto_1320873 ) ( not ( = ?auto_1320873 ?auto_1320876 ) ) ( not ( = ?auto_1320874 ?auto_1320876 ) ) ( not ( = ?auto_1320872 ?auto_1320876 ) ) ( not ( = ?auto_1320881 ?auto_1320876 ) ) ( LIFTING ?auto_1320878 ?auto_1320877 ) ( IS-CRATE ?auto_1320877 ) ( not ( = ?auto_1320873 ?auto_1320877 ) ) ( not ( = ?auto_1320874 ?auto_1320877 ) ) ( not ( = ?auto_1320872 ?auto_1320877 ) ) ( not ( = ?auto_1320881 ?auto_1320877 ) ) ( not ( = ?auto_1320876 ?auto_1320877 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1320873 ?auto_1320874 )
      ( MAKE-2CRATE-VERIFY ?auto_1320872 ?auto_1320873 ?auto_1320874 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1325323 - SURFACE
      ?auto_1325324 - SURFACE
      ?auto_1325325 - SURFACE
      ?auto_1325322 - SURFACE
      ?auto_1325326 - SURFACE
      ?auto_1325328 - SURFACE
      ?auto_1325327 - SURFACE
      ?auto_1325329 - SURFACE
      ?auto_1325330 - SURFACE
      ?auto_1325331 - SURFACE
      ?auto_1325332 - SURFACE
      ?auto_1325333 - SURFACE
      ?auto_1325334 - SURFACE
      ?auto_1325335 - SURFACE
      ?auto_1325336 - SURFACE
    )
    :vars
    (
      ?auto_1325337 - HOIST
      ?auto_1325338 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1325337 ?auto_1325338 ) ( SURFACE-AT ?auto_1325335 ?auto_1325338 ) ( CLEAR ?auto_1325335 ) ( LIFTING ?auto_1325337 ?auto_1325336 ) ( IS-CRATE ?auto_1325336 ) ( not ( = ?auto_1325335 ?auto_1325336 ) ) ( ON ?auto_1325324 ?auto_1325323 ) ( ON ?auto_1325325 ?auto_1325324 ) ( ON ?auto_1325322 ?auto_1325325 ) ( ON ?auto_1325326 ?auto_1325322 ) ( ON ?auto_1325328 ?auto_1325326 ) ( ON ?auto_1325327 ?auto_1325328 ) ( ON ?auto_1325329 ?auto_1325327 ) ( ON ?auto_1325330 ?auto_1325329 ) ( ON ?auto_1325331 ?auto_1325330 ) ( ON ?auto_1325332 ?auto_1325331 ) ( ON ?auto_1325333 ?auto_1325332 ) ( ON ?auto_1325334 ?auto_1325333 ) ( ON ?auto_1325335 ?auto_1325334 ) ( not ( = ?auto_1325323 ?auto_1325324 ) ) ( not ( = ?auto_1325323 ?auto_1325325 ) ) ( not ( = ?auto_1325323 ?auto_1325322 ) ) ( not ( = ?auto_1325323 ?auto_1325326 ) ) ( not ( = ?auto_1325323 ?auto_1325328 ) ) ( not ( = ?auto_1325323 ?auto_1325327 ) ) ( not ( = ?auto_1325323 ?auto_1325329 ) ) ( not ( = ?auto_1325323 ?auto_1325330 ) ) ( not ( = ?auto_1325323 ?auto_1325331 ) ) ( not ( = ?auto_1325323 ?auto_1325332 ) ) ( not ( = ?auto_1325323 ?auto_1325333 ) ) ( not ( = ?auto_1325323 ?auto_1325334 ) ) ( not ( = ?auto_1325323 ?auto_1325335 ) ) ( not ( = ?auto_1325323 ?auto_1325336 ) ) ( not ( = ?auto_1325324 ?auto_1325325 ) ) ( not ( = ?auto_1325324 ?auto_1325322 ) ) ( not ( = ?auto_1325324 ?auto_1325326 ) ) ( not ( = ?auto_1325324 ?auto_1325328 ) ) ( not ( = ?auto_1325324 ?auto_1325327 ) ) ( not ( = ?auto_1325324 ?auto_1325329 ) ) ( not ( = ?auto_1325324 ?auto_1325330 ) ) ( not ( = ?auto_1325324 ?auto_1325331 ) ) ( not ( = ?auto_1325324 ?auto_1325332 ) ) ( not ( = ?auto_1325324 ?auto_1325333 ) ) ( not ( = ?auto_1325324 ?auto_1325334 ) ) ( not ( = ?auto_1325324 ?auto_1325335 ) ) ( not ( = ?auto_1325324 ?auto_1325336 ) ) ( not ( = ?auto_1325325 ?auto_1325322 ) ) ( not ( = ?auto_1325325 ?auto_1325326 ) ) ( not ( = ?auto_1325325 ?auto_1325328 ) ) ( not ( = ?auto_1325325 ?auto_1325327 ) ) ( not ( = ?auto_1325325 ?auto_1325329 ) ) ( not ( = ?auto_1325325 ?auto_1325330 ) ) ( not ( = ?auto_1325325 ?auto_1325331 ) ) ( not ( = ?auto_1325325 ?auto_1325332 ) ) ( not ( = ?auto_1325325 ?auto_1325333 ) ) ( not ( = ?auto_1325325 ?auto_1325334 ) ) ( not ( = ?auto_1325325 ?auto_1325335 ) ) ( not ( = ?auto_1325325 ?auto_1325336 ) ) ( not ( = ?auto_1325322 ?auto_1325326 ) ) ( not ( = ?auto_1325322 ?auto_1325328 ) ) ( not ( = ?auto_1325322 ?auto_1325327 ) ) ( not ( = ?auto_1325322 ?auto_1325329 ) ) ( not ( = ?auto_1325322 ?auto_1325330 ) ) ( not ( = ?auto_1325322 ?auto_1325331 ) ) ( not ( = ?auto_1325322 ?auto_1325332 ) ) ( not ( = ?auto_1325322 ?auto_1325333 ) ) ( not ( = ?auto_1325322 ?auto_1325334 ) ) ( not ( = ?auto_1325322 ?auto_1325335 ) ) ( not ( = ?auto_1325322 ?auto_1325336 ) ) ( not ( = ?auto_1325326 ?auto_1325328 ) ) ( not ( = ?auto_1325326 ?auto_1325327 ) ) ( not ( = ?auto_1325326 ?auto_1325329 ) ) ( not ( = ?auto_1325326 ?auto_1325330 ) ) ( not ( = ?auto_1325326 ?auto_1325331 ) ) ( not ( = ?auto_1325326 ?auto_1325332 ) ) ( not ( = ?auto_1325326 ?auto_1325333 ) ) ( not ( = ?auto_1325326 ?auto_1325334 ) ) ( not ( = ?auto_1325326 ?auto_1325335 ) ) ( not ( = ?auto_1325326 ?auto_1325336 ) ) ( not ( = ?auto_1325328 ?auto_1325327 ) ) ( not ( = ?auto_1325328 ?auto_1325329 ) ) ( not ( = ?auto_1325328 ?auto_1325330 ) ) ( not ( = ?auto_1325328 ?auto_1325331 ) ) ( not ( = ?auto_1325328 ?auto_1325332 ) ) ( not ( = ?auto_1325328 ?auto_1325333 ) ) ( not ( = ?auto_1325328 ?auto_1325334 ) ) ( not ( = ?auto_1325328 ?auto_1325335 ) ) ( not ( = ?auto_1325328 ?auto_1325336 ) ) ( not ( = ?auto_1325327 ?auto_1325329 ) ) ( not ( = ?auto_1325327 ?auto_1325330 ) ) ( not ( = ?auto_1325327 ?auto_1325331 ) ) ( not ( = ?auto_1325327 ?auto_1325332 ) ) ( not ( = ?auto_1325327 ?auto_1325333 ) ) ( not ( = ?auto_1325327 ?auto_1325334 ) ) ( not ( = ?auto_1325327 ?auto_1325335 ) ) ( not ( = ?auto_1325327 ?auto_1325336 ) ) ( not ( = ?auto_1325329 ?auto_1325330 ) ) ( not ( = ?auto_1325329 ?auto_1325331 ) ) ( not ( = ?auto_1325329 ?auto_1325332 ) ) ( not ( = ?auto_1325329 ?auto_1325333 ) ) ( not ( = ?auto_1325329 ?auto_1325334 ) ) ( not ( = ?auto_1325329 ?auto_1325335 ) ) ( not ( = ?auto_1325329 ?auto_1325336 ) ) ( not ( = ?auto_1325330 ?auto_1325331 ) ) ( not ( = ?auto_1325330 ?auto_1325332 ) ) ( not ( = ?auto_1325330 ?auto_1325333 ) ) ( not ( = ?auto_1325330 ?auto_1325334 ) ) ( not ( = ?auto_1325330 ?auto_1325335 ) ) ( not ( = ?auto_1325330 ?auto_1325336 ) ) ( not ( = ?auto_1325331 ?auto_1325332 ) ) ( not ( = ?auto_1325331 ?auto_1325333 ) ) ( not ( = ?auto_1325331 ?auto_1325334 ) ) ( not ( = ?auto_1325331 ?auto_1325335 ) ) ( not ( = ?auto_1325331 ?auto_1325336 ) ) ( not ( = ?auto_1325332 ?auto_1325333 ) ) ( not ( = ?auto_1325332 ?auto_1325334 ) ) ( not ( = ?auto_1325332 ?auto_1325335 ) ) ( not ( = ?auto_1325332 ?auto_1325336 ) ) ( not ( = ?auto_1325333 ?auto_1325334 ) ) ( not ( = ?auto_1325333 ?auto_1325335 ) ) ( not ( = ?auto_1325333 ?auto_1325336 ) ) ( not ( = ?auto_1325334 ?auto_1325335 ) ) ( not ( = ?auto_1325334 ?auto_1325336 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1325335 ?auto_1325336 )
      ( MAKE-14CRATE-VERIFY ?auto_1325323 ?auto_1325324 ?auto_1325325 ?auto_1325322 ?auto_1325326 ?auto_1325328 ?auto_1325327 ?auto_1325329 ?auto_1325330 ?auto_1325331 ?auto_1325332 ?auto_1325333 ?auto_1325334 ?auto_1325335 ?auto_1325336 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1325483 - SURFACE
      ?auto_1325484 - SURFACE
      ?auto_1325485 - SURFACE
      ?auto_1325482 - SURFACE
      ?auto_1325486 - SURFACE
      ?auto_1325488 - SURFACE
      ?auto_1325487 - SURFACE
      ?auto_1325489 - SURFACE
      ?auto_1325490 - SURFACE
      ?auto_1325491 - SURFACE
      ?auto_1325492 - SURFACE
      ?auto_1325493 - SURFACE
      ?auto_1325494 - SURFACE
      ?auto_1325495 - SURFACE
      ?auto_1325496 - SURFACE
    )
    :vars
    (
      ?auto_1325498 - HOIST
      ?auto_1325499 - PLACE
      ?auto_1325497 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1325498 ?auto_1325499 ) ( SURFACE-AT ?auto_1325495 ?auto_1325499 ) ( CLEAR ?auto_1325495 ) ( IS-CRATE ?auto_1325496 ) ( not ( = ?auto_1325495 ?auto_1325496 ) ) ( TRUCK-AT ?auto_1325497 ?auto_1325499 ) ( AVAILABLE ?auto_1325498 ) ( IN ?auto_1325496 ?auto_1325497 ) ( ON ?auto_1325495 ?auto_1325494 ) ( not ( = ?auto_1325494 ?auto_1325495 ) ) ( not ( = ?auto_1325494 ?auto_1325496 ) ) ( ON ?auto_1325484 ?auto_1325483 ) ( ON ?auto_1325485 ?auto_1325484 ) ( ON ?auto_1325482 ?auto_1325485 ) ( ON ?auto_1325486 ?auto_1325482 ) ( ON ?auto_1325488 ?auto_1325486 ) ( ON ?auto_1325487 ?auto_1325488 ) ( ON ?auto_1325489 ?auto_1325487 ) ( ON ?auto_1325490 ?auto_1325489 ) ( ON ?auto_1325491 ?auto_1325490 ) ( ON ?auto_1325492 ?auto_1325491 ) ( ON ?auto_1325493 ?auto_1325492 ) ( ON ?auto_1325494 ?auto_1325493 ) ( not ( = ?auto_1325483 ?auto_1325484 ) ) ( not ( = ?auto_1325483 ?auto_1325485 ) ) ( not ( = ?auto_1325483 ?auto_1325482 ) ) ( not ( = ?auto_1325483 ?auto_1325486 ) ) ( not ( = ?auto_1325483 ?auto_1325488 ) ) ( not ( = ?auto_1325483 ?auto_1325487 ) ) ( not ( = ?auto_1325483 ?auto_1325489 ) ) ( not ( = ?auto_1325483 ?auto_1325490 ) ) ( not ( = ?auto_1325483 ?auto_1325491 ) ) ( not ( = ?auto_1325483 ?auto_1325492 ) ) ( not ( = ?auto_1325483 ?auto_1325493 ) ) ( not ( = ?auto_1325483 ?auto_1325494 ) ) ( not ( = ?auto_1325483 ?auto_1325495 ) ) ( not ( = ?auto_1325483 ?auto_1325496 ) ) ( not ( = ?auto_1325484 ?auto_1325485 ) ) ( not ( = ?auto_1325484 ?auto_1325482 ) ) ( not ( = ?auto_1325484 ?auto_1325486 ) ) ( not ( = ?auto_1325484 ?auto_1325488 ) ) ( not ( = ?auto_1325484 ?auto_1325487 ) ) ( not ( = ?auto_1325484 ?auto_1325489 ) ) ( not ( = ?auto_1325484 ?auto_1325490 ) ) ( not ( = ?auto_1325484 ?auto_1325491 ) ) ( not ( = ?auto_1325484 ?auto_1325492 ) ) ( not ( = ?auto_1325484 ?auto_1325493 ) ) ( not ( = ?auto_1325484 ?auto_1325494 ) ) ( not ( = ?auto_1325484 ?auto_1325495 ) ) ( not ( = ?auto_1325484 ?auto_1325496 ) ) ( not ( = ?auto_1325485 ?auto_1325482 ) ) ( not ( = ?auto_1325485 ?auto_1325486 ) ) ( not ( = ?auto_1325485 ?auto_1325488 ) ) ( not ( = ?auto_1325485 ?auto_1325487 ) ) ( not ( = ?auto_1325485 ?auto_1325489 ) ) ( not ( = ?auto_1325485 ?auto_1325490 ) ) ( not ( = ?auto_1325485 ?auto_1325491 ) ) ( not ( = ?auto_1325485 ?auto_1325492 ) ) ( not ( = ?auto_1325485 ?auto_1325493 ) ) ( not ( = ?auto_1325485 ?auto_1325494 ) ) ( not ( = ?auto_1325485 ?auto_1325495 ) ) ( not ( = ?auto_1325485 ?auto_1325496 ) ) ( not ( = ?auto_1325482 ?auto_1325486 ) ) ( not ( = ?auto_1325482 ?auto_1325488 ) ) ( not ( = ?auto_1325482 ?auto_1325487 ) ) ( not ( = ?auto_1325482 ?auto_1325489 ) ) ( not ( = ?auto_1325482 ?auto_1325490 ) ) ( not ( = ?auto_1325482 ?auto_1325491 ) ) ( not ( = ?auto_1325482 ?auto_1325492 ) ) ( not ( = ?auto_1325482 ?auto_1325493 ) ) ( not ( = ?auto_1325482 ?auto_1325494 ) ) ( not ( = ?auto_1325482 ?auto_1325495 ) ) ( not ( = ?auto_1325482 ?auto_1325496 ) ) ( not ( = ?auto_1325486 ?auto_1325488 ) ) ( not ( = ?auto_1325486 ?auto_1325487 ) ) ( not ( = ?auto_1325486 ?auto_1325489 ) ) ( not ( = ?auto_1325486 ?auto_1325490 ) ) ( not ( = ?auto_1325486 ?auto_1325491 ) ) ( not ( = ?auto_1325486 ?auto_1325492 ) ) ( not ( = ?auto_1325486 ?auto_1325493 ) ) ( not ( = ?auto_1325486 ?auto_1325494 ) ) ( not ( = ?auto_1325486 ?auto_1325495 ) ) ( not ( = ?auto_1325486 ?auto_1325496 ) ) ( not ( = ?auto_1325488 ?auto_1325487 ) ) ( not ( = ?auto_1325488 ?auto_1325489 ) ) ( not ( = ?auto_1325488 ?auto_1325490 ) ) ( not ( = ?auto_1325488 ?auto_1325491 ) ) ( not ( = ?auto_1325488 ?auto_1325492 ) ) ( not ( = ?auto_1325488 ?auto_1325493 ) ) ( not ( = ?auto_1325488 ?auto_1325494 ) ) ( not ( = ?auto_1325488 ?auto_1325495 ) ) ( not ( = ?auto_1325488 ?auto_1325496 ) ) ( not ( = ?auto_1325487 ?auto_1325489 ) ) ( not ( = ?auto_1325487 ?auto_1325490 ) ) ( not ( = ?auto_1325487 ?auto_1325491 ) ) ( not ( = ?auto_1325487 ?auto_1325492 ) ) ( not ( = ?auto_1325487 ?auto_1325493 ) ) ( not ( = ?auto_1325487 ?auto_1325494 ) ) ( not ( = ?auto_1325487 ?auto_1325495 ) ) ( not ( = ?auto_1325487 ?auto_1325496 ) ) ( not ( = ?auto_1325489 ?auto_1325490 ) ) ( not ( = ?auto_1325489 ?auto_1325491 ) ) ( not ( = ?auto_1325489 ?auto_1325492 ) ) ( not ( = ?auto_1325489 ?auto_1325493 ) ) ( not ( = ?auto_1325489 ?auto_1325494 ) ) ( not ( = ?auto_1325489 ?auto_1325495 ) ) ( not ( = ?auto_1325489 ?auto_1325496 ) ) ( not ( = ?auto_1325490 ?auto_1325491 ) ) ( not ( = ?auto_1325490 ?auto_1325492 ) ) ( not ( = ?auto_1325490 ?auto_1325493 ) ) ( not ( = ?auto_1325490 ?auto_1325494 ) ) ( not ( = ?auto_1325490 ?auto_1325495 ) ) ( not ( = ?auto_1325490 ?auto_1325496 ) ) ( not ( = ?auto_1325491 ?auto_1325492 ) ) ( not ( = ?auto_1325491 ?auto_1325493 ) ) ( not ( = ?auto_1325491 ?auto_1325494 ) ) ( not ( = ?auto_1325491 ?auto_1325495 ) ) ( not ( = ?auto_1325491 ?auto_1325496 ) ) ( not ( = ?auto_1325492 ?auto_1325493 ) ) ( not ( = ?auto_1325492 ?auto_1325494 ) ) ( not ( = ?auto_1325492 ?auto_1325495 ) ) ( not ( = ?auto_1325492 ?auto_1325496 ) ) ( not ( = ?auto_1325493 ?auto_1325494 ) ) ( not ( = ?auto_1325493 ?auto_1325495 ) ) ( not ( = ?auto_1325493 ?auto_1325496 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1325494 ?auto_1325495 ?auto_1325496 )
      ( MAKE-14CRATE-VERIFY ?auto_1325483 ?auto_1325484 ?auto_1325485 ?auto_1325482 ?auto_1325486 ?auto_1325488 ?auto_1325487 ?auto_1325489 ?auto_1325490 ?auto_1325491 ?auto_1325492 ?auto_1325493 ?auto_1325494 ?auto_1325495 ?auto_1325496 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1325658 - SURFACE
      ?auto_1325659 - SURFACE
      ?auto_1325660 - SURFACE
      ?auto_1325657 - SURFACE
      ?auto_1325661 - SURFACE
      ?auto_1325663 - SURFACE
      ?auto_1325662 - SURFACE
      ?auto_1325664 - SURFACE
      ?auto_1325665 - SURFACE
      ?auto_1325666 - SURFACE
      ?auto_1325667 - SURFACE
      ?auto_1325668 - SURFACE
      ?auto_1325669 - SURFACE
      ?auto_1325670 - SURFACE
      ?auto_1325671 - SURFACE
    )
    :vars
    (
      ?auto_1325674 - HOIST
      ?auto_1325675 - PLACE
      ?auto_1325672 - TRUCK
      ?auto_1325673 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1325674 ?auto_1325675 ) ( SURFACE-AT ?auto_1325670 ?auto_1325675 ) ( CLEAR ?auto_1325670 ) ( IS-CRATE ?auto_1325671 ) ( not ( = ?auto_1325670 ?auto_1325671 ) ) ( AVAILABLE ?auto_1325674 ) ( IN ?auto_1325671 ?auto_1325672 ) ( ON ?auto_1325670 ?auto_1325669 ) ( not ( = ?auto_1325669 ?auto_1325670 ) ) ( not ( = ?auto_1325669 ?auto_1325671 ) ) ( TRUCK-AT ?auto_1325672 ?auto_1325673 ) ( not ( = ?auto_1325673 ?auto_1325675 ) ) ( ON ?auto_1325659 ?auto_1325658 ) ( ON ?auto_1325660 ?auto_1325659 ) ( ON ?auto_1325657 ?auto_1325660 ) ( ON ?auto_1325661 ?auto_1325657 ) ( ON ?auto_1325663 ?auto_1325661 ) ( ON ?auto_1325662 ?auto_1325663 ) ( ON ?auto_1325664 ?auto_1325662 ) ( ON ?auto_1325665 ?auto_1325664 ) ( ON ?auto_1325666 ?auto_1325665 ) ( ON ?auto_1325667 ?auto_1325666 ) ( ON ?auto_1325668 ?auto_1325667 ) ( ON ?auto_1325669 ?auto_1325668 ) ( not ( = ?auto_1325658 ?auto_1325659 ) ) ( not ( = ?auto_1325658 ?auto_1325660 ) ) ( not ( = ?auto_1325658 ?auto_1325657 ) ) ( not ( = ?auto_1325658 ?auto_1325661 ) ) ( not ( = ?auto_1325658 ?auto_1325663 ) ) ( not ( = ?auto_1325658 ?auto_1325662 ) ) ( not ( = ?auto_1325658 ?auto_1325664 ) ) ( not ( = ?auto_1325658 ?auto_1325665 ) ) ( not ( = ?auto_1325658 ?auto_1325666 ) ) ( not ( = ?auto_1325658 ?auto_1325667 ) ) ( not ( = ?auto_1325658 ?auto_1325668 ) ) ( not ( = ?auto_1325658 ?auto_1325669 ) ) ( not ( = ?auto_1325658 ?auto_1325670 ) ) ( not ( = ?auto_1325658 ?auto_1325671 ) ) ( not ( = ?auto_1325659 ?auto_1325660 ) ) ( not ( = ?auto_1325659 ?auto_1325657 ) ) ( not ( = ?auto_1325659 ?auto_1325661 ) ) ( not ( = ?auto_1325659 ?auto_1325663 ) ) ( not ( = ?auto_1325659 ?auto_1325662 ) ) ( not ( = ?auto_1325659 ?auto_1325664 ) ) ( not ( = ?auto_1325659 ?auto_1325665 ) ) ( not ( = ?auto_1325659 ?auto_1325666 ) ) ( not ( = ?auto_1325659 ?auto_1325667 ) ) ( not ( = ?auto_1325659 ?auto_1325668 ) ) ( not ( = ?auto_1325659 ?auto_1325669 ) ) ( not ( = ?auto_1325659 ?auto_1325670 ) ) ( not ( = ?auto_1325659 ?auto_1325671 ) ) ( not ( = ?auto_1325660 ?auto_1325657 ) ) ( not ( = ?auto_1325660 ?auto_1325661 ) ) ( not ( = ?auto_1325660 ?auto_1325663 ) ) ( not ( = ?auto_1325660 ?auto_1325662 ) ) ( not ( = ?auto_1325660 ?auto_1325664 ) ) ( not ( = ?auto_1325660 ?auto_1325665 ) ) ( not ( = ?auto_1325660 ?auto_1325666 ) ) ( not ( = ?auto_1325660 ?auto_1325667 ) ) ( not ( = ?auto_1325660 ?auto_1325668 ) ) ( not ( = ?auto_1325660 ?auto_1325669 ) ) ( not ( = ?auto_1325660 ?auto_1325670 ) ) ( not ( = ?auto_1325660 ?auto_1325671 ) ) ( not ( = ?auto_1325657 ?auto_1325661 ) ) ( not ( = ?auto_1325657 ?auto_1325663 ) ) ( not ( = ?auto_1325657 ?auto_1325662 ) ) ( not ( = ?auto_1325657 ?auto_1325664 ) ) ( not ( = ?auto_1325657 ?auto_1325665 ) ) ( not ( = ?auto_1325657 ?auto_1325666 ) ) ( not ( = ?auto_1325657 ?auto_1325667 ) ) ( not ( = ?auto_1325657 ?auto_1325668 ) ) ( not ( = ?auto_1325657 ?auto_1325669 ) ) ( not ( = ?auto_1325657 ?auto_1325670 ) ) ( not ( = ?auto_1325657 ?auto_1325671 ) ) ( not ( = ?auto_1325661 ?auto_1325663 ) ) ( not ( = ?auto_1325661 ?auto_1325662 ) ) ( not ( = ?auto_1325661 ?auto_1325664 ) ) ( not ( = ?auto_1325661 ?auto_1325665 ) ) ( not ( = ?auto_1325661 ?auto_1325666 ) ) ( not ( = ?auto_1325661 ?auto_1325667 ) ) ( not ( = ?auto_1325661 ?auto_1325668 ) ) ( not ( = ?auto_1325661 ?auto_1325669 ) ) ( not ( = ?auto_1325661 ?auto_1325670 ) ) ( not ( = ?auto_1325661 ?auto_1325671 ) ) ( not ( = ?auto_1325663 ?auto_1325662 ) ) ( not ( = ?auto_1325663 ?auto_1325664 ) ) ( not ( = ?auto_1325663 ?auto_1325665 ) ) ( not ( = ?auto_1325663 ?auto_1325666 ) ) ( not ( = ?auto_1325663 ?auto_1325667 ) ) ( not ( = ?auto_1325663 ?auto_1325668 ) ) ( not ( = ?auto_1325663 ?auto_1325669 ) ) ( not ( = ?auto_1325663 ?auto_1325670 ) ) ( not ( = ?auto_1325663 ?auto_1325671 ) ) ( not ( = ?auto_1325662 ?auto_1325664 ) ) ( not ( = ?auto_1325662 ?auto_1325665 ) ) ( not ( = ?auto_1325662 ?auto_1325666 ) ) ( not ( = ?auto_1325662 ?auto_1325667 ) ) ( not ( = ?auto_1325662 ?auto_1325668 ) ) ( not ( = ?auto_1325662 ?auto_1325669 ) ) ( not ( = ?auto_1325662 ?auto_1325670 ) ) ( not ( = ?auto_1325662 ?auto_1325671 ) ) ( not ( = ?auto_1325664 ?auto_1325665 ) ) ( not ( = ?auto_1325664 ?auto_1325666 ) ) ( not ( = ?auto_1325664 ?auto_1325667 ) ) ( not ( = ?auto_1325664 ?auto_1325668 ) ) ( not ( = ?auto_1325664 ?auto_1325669 ) ) ( not ( = ?auto_1325664 ?auto_1325670 ) ) ( not ( = ?auto_1325664 ?auto_1325671 ) ) ( not ( = ?auto_1325665 ?auto_1325666 ) ) ( not ( = ?auto_1325665 ?auto_1325667 ) ) ( not ( = ?auto_1325665 ?auto_1325668 ) ) ( not ( = ?auto_1325665 ?auto_1325669 ) ) ( not ( = ?auto_1325665 ?auto_1325670 ) ) ( not ( = ?auto_1325665 ?auto_1325671 ) ) ( not ( = ?auto_1325666 ?auto_1325667 ) ) ( not ( = ?auto_1325666 ?auto_1325668 ) ) ( not ( = ?auto_1325666 ?auto_1325669 ) ) ( not ( = ?auto_1325666 ?auto_1325670 ) ) ( not ( = ?auto_1325666 ?auto_1325671 ) ) ( not ( = ?auto_1325667 ?auto_1325668 ) ) ( not ( = ?auto_1325667 ?auto_1325669 ) ) ( not ( = ?auto_1325667 ?auto_1325670 ) ) ( not ( = ?auto_1325667 ?auto_1325671 ) ) ( not ( = ?auto_1325668 ?auto_1325669 ) ) ( not ( = ?auto_1325668 ?auto_1325670 ) ) ( not ( = ?auto_1325668 ?auto_1325671 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1325669 ?auto_1325670 ?auto_1325671 )
      ( MAKE-14CRATE-VERIFY ?auto_1325658 ?auto_1325659 ?auto_1325660 ?auto_1325657 ?auto_1325661 ?auto_1325663 ?auto_1325662 ?auto_1325664 ?auto_1325665 ?auto_1325666 ?auto_1325667 ?auto_1325668 ?auto_1325669 ?auto_1325670 ?auto_1325671 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1325847 - SURFACE
      ?auto_1325848 - SURFACE
      ?auto_1325849 - SURFACE
      ?auto_1325846 - SURFACE
      ?auto_1325850 - SURFACE
      ?auto_1325852 - SURFACE
      ?auto_1325851 - SURFACE
      ?auto_1325853 - SURFACE
      ?auto_1325854 - SURFACE
      ?auto_1325855 - SURFACE
      ?auto_1325856 - SURFACE
      ?auto_1325857 - SURFACE
      ?auto_1325858 - SURFACE
      ?auto_1325859 - SURFACE
      ?auto_1325860 - SURFACE
    )
    :vars
    (
      ?auto_1325863 - HOIST
      ?auto_1325861 - PLACE
      ?auto_1325865 - TRUCK
      ?auto_1325862 - PLACE
      ?auto_1325864 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1325863 ?auto_1325861 ) ( SURFACE-AT ?auto_1325859 ?auto_1325861 ) ( CLEAR ?auto_1325859 ) ( IS-CRATE ?auto_1325860 ) ( not ( = ?auto_1325859 ?auto_1325860 ) ) ( AVAILABLE ?auto_1325863 ) ( ON ?auto_1325859 ?auto_1325858 ) ( not ( = ?auto_1325858 ?auto_1325859 ) ) ( not ( = ?auto_1325858 ?auto_1325860 ) ) ( TRUCK-AT ?auto_1325865 ?auto_1325862 ) ( not ( = ?auto_1325862 ?auto_1325861 ) ) ( HOIST-AT ?auto_1325864 ?auto_1325862 ) ( LIFTING ?auto_1325864 ?auto_1325860 ) ( not ( = ?auto_1325863 ?auto_1325864 ) ) ( ON ?auto_1325848 ?auto_1325847 ) ( ON ?auto_1325849 ?auto_1325848 ) ( ON ?auto_1325846 ?auto_1325849 ) ( ON ?auto_1325850 ?auto_1325846 ) ( ON ?auto_1325852 ?auto_1325850 ) ( ON ?auto_1325851 ?auto_1325852 ) ( ON ?auto_1325853 ?auto_1325851 ) ( ON ?auto_1325854 ?auto_1325853 ) ( ON ?auto_1325855 ?auto_1325854 ) ( ON ?auto_1325856 ?auto_1325855 ) ( ON ?auto_1325857 ?auto_1325856 ) ( ON ?auto_1325858 ?auto_1325857 ) ( not ( = ?auto_1325847 ?auto_1325848 ) ) ( not ( = ?auto_1325847 ?auto_1325849 ) ) ( not ( = ?auto_1325847 ?auto_1325846 ) ) ( not ( = ?auto_1325847 ?auto_1325850 ) ) ( not ( = ?auto_1325847 ?auto_1325852 ) ) ( not ( = ?auto_1325847 ?auto_1325851 ) ) ( not ( = ?auto_1325847 ?auto_1325853 ) ) ( not ( = ?auto_1325847 ?auto_1325854 ) ) ( not ( = ?auto_1325847 ?auto_1325855 ) ) ( not ( = ?auto_1325847 ?auto_1325856 ) ) ( not ( = ?auto_1325847 ?auto_1325857 ) ) ( not ( = ?auto_1325847 ?auto_1325858 ) ) ( not ( = ?auto_1325847 ?auto_1325859 ) ) ( not ( = ?auto_1325847 ?auto_1325860 ) ) ( not ( = ?auto_1325848 ?auto_1325849 ) ) ( not ( = ?auto_1325848 ?auto_1325846 ) ) ( not ( = ?auto_1325848 ?auto_1325850 ) ) ( not ( = ?auto_1325848 ?auto_1325852 ) ) ( not ( = ?auto_1325848 ?auto_1325851 ) ) ( not ( = ?auto_1325848 ?auto_1325853 ) ) ( not ( = ?auto_1325848 ?auto_1325854 ) ) ( not ( = ?auto_1325848 ?auto_1325855 ) ) ( not ( = ?auto_1325848 ?auto_1325856 ) ) ( not ( = ?auto_1325848 ?auto_1325857 ) ) ( not ( = ?auto_1325848 ?auto_1325858 ) ) ( not ( = ?auto_1325848 ?auto_1325859 ) ) ( not ( = ?auto_1325848 ?auto_1325860 ) ) ( not ( = ?auto_1325849 ?auto_1325846 ) ) ( not ( = ?auto_1325849 ?auto_1325850 ) ) ( not ( = ?auto_1325849 ?auto_1325852 ) ) ( not ( = ?auto_1325849 ?auto_1325851 ) ) ( not ( = ?auto_1325849 ?auto_1325853 ) ) ( not ( = ?auto_1325849 ?auto_1325854 ) ) ( not ( = ?auto_1325849 ?auto_1325855 ) ) ( not ( = ?auto_1325849 ?auto_1325856 ) ) ( not ( = ?auto_1325849 ?auto_1325857 ) ) ( not ( = ?auto_1325849 ?auto_1325858 ) ) ( not ( = ?auto_1325849 ?auto_1325859 ) ) ( not ( = ?auto_1325849 ?auto_1325860 ) ) ( not ( = ?auto_1325846 ?auto_1325850 ) ) ( not ( = ?auto_1325846 ?auto_1325852 ) ) ( not ( = ?auto_1325846 ?auto_1325851 ) ) ( not ( = ?auto_1325846 ?auto_1325853 ) ) ( not ( = ?auto_1325846 ?auto_1325854 ) ) ( not ( = ?auto_1325846 ?auto_1325855 ) ) ( not ( = ?auto_1325846 ?auto_1325856 ) ) ( not ( = ?auto_1325846 ?auto_1325857 ) ) ( not ( = ?auto_1325846 ?auto_1325858 ) ) ( not ( = ?auto_1325846 ?auto_1325859 ) ) ( not ( = ?auto_1325846 ?auto_1325860 ) ) ( not ( = ?auto_1325850 ?auto_1325852 ) ) ( not ( = ?auto_1325850 ?auto_1325851 ) ) ( not ( = ?auto_1325850 ?auto_1325853 ) ) ( not ( = ?auto_1325850 ?auto_1325854 ) ) ( not ( = ?auto_1325850 ?auto_1325855 ) ) ( not ( = ?auto_1325850 ?auto_1325856 ) ) ( not ( = ?auto_1325850 ?auto_1325857 ) ) ( not ( = ?auto_1325850 ?auto_1325858 ) ) ( not ( = ?auto_1325850 ?auto_1325859 ) ) ( not ( = ?auto_1325850 ?auto_1325860 ) ) ( not ( = ?auto_1325852 ?auto_1325851 ) ) ( not ( = ?auto_1325852 ?auto_1325853 ) ) ( not ( = ?auto_1325852 ?auto_1325854 ) ) ( not ( = ?auto_1325852 ?auto_1325855 ) ) ( not ( = ?auto_1325852 ?auto_1325856 ) ) ( not ( = ?auto_1325852 ?auto_1325857 ) ) ( not ( = ?auto_1325852 ?auto_1325858 ) ) ( not ( = ?auto_1325852 ?auto_1325859 ) ) ( not ( = ?auto_1325852 ?auto_1325860 ) ) ( not ( = ?auto_1325851 ?auto_1325853 ) ) ( not ( = ?auto_1325851 ?auto_1325854 ) ) ( not ( = ?auto_1325851 ?auto_1325855 ) ) ( not ( = ?auto_1325851 ?auto_1325856 ) ) ( not ( = ?auto_1325851 ?auto_1325857 ) ) ( not ( = ?auto_1325851 ?auto_1325858 ) ) ( not ( = ?auto_1325851 ?auto_1325859 ) ) ( not ( = ?auto_1325851 ?auto_1325860 ) ) ( not ( = ?auto_1325853 ?auto_1325854 ) ) ( not ( = ?auto_1325853 ?auto_1325855 ) ) ( not ( = ?auto_1325853 ?auto_1325856 ) ) ( not ( = ?auto_1325853 ?auto_1325857 ) ) ( not ( = ?auto_1325853 ?auto_1325858 ) ) ( not ( = ?auto_1325853 ?auto_1325859 ) ) ( not ( = ?auto_1325853 ?auto_1325860 ) ) ( not ( = ?auto_1325854 ?auto_1325855 ) ) ( not ( = ?auto_1325854 ?auto_1325856 ) ) ( not ( = ?auto_1325854 ?auto_1325857 ) ) ( not ( = ?auto_1325854 ?auto_1325858 ) ) ( not ( = ?auto_1325854 ?auto_1325859 ) ) ( not ( = ?auto_1325854 ?auto_1325860 ) ) ( not ( = ?auto_1325855 ?auto_1325856 ) ) ( not ( = ?auto_1325855 ?auto_1325857 ) ) ( not ( = ?auto_1325855 ?auto_1325858 ) ) ( not ( = ?auto_1325855 ?auto_1325859 ) ) ( not ( = ?auto_1325855 ?auto_1325860 ) ) ( not ( = ?auto_1325856 ?auto_1325857 ) ) ( not ( = ?auto_1325856 ?auto_1325858 ) ) ( not ( = ?auto_1325856 ?auto_1325859 ) ) ( not ( = ?auto_1325856 ?auto_1325860 ) ) ( not ( = ?auto_1325857 ?auto_1325858 ) ) ( not ( = ?auto_1325857 ?auto_1325859 ) ) ( not ( = ?auto_1325857 ?auto_1325860 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1325858 ?auto_1325859 ?auto_1325860 )
      ( MAKE-14CRATE-VERIFY ?auto_1325847 ?auto_1325848 ?auto_1325849 ?auto_1325846 ?auto_1325850 ?auto_1325852 ?auto_1325851 ?auto_1325853 ?auto_1325854 ?auto_1325855 ?auto_1325856 ?auto_1325857 ?auto_1325858 ?auto_1325859 ?auto_1325860 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1326050 - SURFACE
      ?auto_1326051 - SURFACE
      ?auto_1326052 - SURFACE
      ?auto_1326049 - SURFACE
      ?auto_1326053 - SURFACE
      ?auto_1326055 - SURFACE
      ?auto_1326054 - SURFACE
      ?auto_1326056 - SURFACE
      ?auto_1326057 - SURFACE
      ?auto_1326058 - SURFACE
      ?auto_1326059 - SURFACE
      ?auto_1326060 - SURFACE
      ?auto_1326061 - SURFACE
      ?auto_1326062 - SURFACE
      ?auto_1326063 - SURFACE
    )
    :vars
    (
      ?auto_1326064 - HOIST
      ?auto_1326068 - PLACE
      ?auto_1326065 - TRUCK
      ?auto_1326067 - PLACE
      ?auto_1326066 - HOIST
      ?auto_1326069 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1326064 ?auto_1326068 ) ( SURFACE-AT ?auto_1326062 ?auto_1326068 ) ( CLEAR ?auto_1326062 ) ( IS-CRATE ?auto_1326063 ) ( not ( = ?auto_1326062 ?auto_1326063 ) ) ( AVAILABLE ?auto_1326064 ) ( ON ?auto_1326062 ?auto_1326061 ) ( not ( = ?auto_1326061 ?auto_1326062 ) ) ( not ( = ?auto_1326061 ?auto_1326063 ) ) ( TRUCK-AT ?auto_1326065 ?auto_1326067 ) ( not ( = ?auto_1326067 ?auto_1326068 ) ) ( HOIST-AT ?auto_1326066 ?auto_1326067 ) ( not ( = ?auto_1326064 ?auto_1326066 ) ) ( AVAILABLE ?auto_1326066 ) ( SURFACE-AT ?auto_1326063 ?auto_1326067 ) ( ON ?auto_1326063 ?auto_1326069 ) ( CLEAR ?auto_1326063 ) ( not ( = ?auto_1326062 ?auto_1326069 ) ) ( not ( = ?auto_1326063 ?auto_1326069 ) ) ( not ( = ?auto_1326061 ?auto_1326069 ) ) ( ON ?auto_1326051 ?auto_1326050 ) ( ON ?auto_1326052 ?auto_1326051 ) ( ON ?auto_1326049 ?auto_1326052 ) ( ON ?auto_1326053 ?auto_1326049 ) ( ON ?auto_1326055 ?auto_1326053 ) ( ON ?auto_1326054 ?auto_1326055 ) ( ON ?auto_1326056 ?auto_1326054 ) ( ON ?auto_1326057 ?auto_1326056 ) ( ON ?auto_1326058 ?auto_1326057 ) ( ON ?auto_1326059 ?auto_1326058 ) ( ON ?auto_1326060 ?auto_1326059 ) ( ON ?auto_1326061 ?auto_1326060 ) ( not ( = ?auto_1326050 ?auto_1326051 ) ) ( not ( = ?auto_1326050 ?auto_1326052 ) ) ( not ( = ?auto_1326050 ?auto_1326049 ) ) ( not ( = ?auto_1326050 ?auto_1326053 ) ) ( not ( = ?auto_1326050 ?auto_1326055 ) ) ( not ( = ?auto_1326050 ?auto_1326054 ) ) ( not ( = ?auto_1326050 ?auto_1326056 ) ) ( not ( = ?auto_1326050 ?auto_1326057 ) ) ( not ( = ?auto_1326050 ?auto_1326058 ) ) ( not ( = ?auto_1326050 ?auto_1326059 ) ) ( not ( = ?auto_1326050 ?auto_1326060 ) ) ( not ( = ?auto_1326050 ?auto_1326061 ) ) ( not ( = ?auto_1326050 ?auto_1326062 ) ) ( not ( = ?auto_1326050 ?auto_1326063 ) ) ( not ( = ?auto_1326050 ?auto_1326069 ) ) ( not ( = ?auto_1326051 ?auto_1326052 ) ) ( not ( = ?auto_1326051 ?auto_1326049 ) ) ( not ( = ?auto_1326051 ?auto_1326053 ) ) ( not ( = ?auto_1326051 ?auto_1326055 ) ) ( not ( = ?auto_1326051 ?auto_1326054 ) ) ( not ( = ?auto_1326051 ?auto_1326056 ) ) ( not ( = ?auto_1326051 ?auto_1326057 ) ) ( not ( = ?auto_1326051 ?auto_1326058 ) ) ( not ( = ?auto_1326051 ?auto_1326059 ) ) ( not ( = ?auto_1326051 ?auto_1326060 ) ) ( not ( = ?auto_1326051 ?auto_1326061 ) ) ( not ( = ?auto_1326051 ?auto_1326062 ) ) ( not ( = ?auto_1326051 ?auto_1326063 ) ) ( not ( = ?auto_1326051 ?auto_1326069 ) ) ( not ( = ?auto_1326052 ?auto_1326049 ) ) ( not ( = ?auto_1326052 ?auto_1326053 ) ) ( not ( = ?auto_1326052 ?auto_1326055 ) ) ( not ( = ?auto_1326052 ?auto_1326054 ) ) ( not ( = ?auto_1326052 ?auto_1326056 ) ) ( not ( = ?auto_1326052 ?auto_1326057 ) ) ( not ( = ?auto_1326052 ?auto_1326058 ) ) ( not ( = ?auto_1326052 ?auto_1326059 ) ) ( not ( = ?auto_1326052 ?auto_1326060 ) ) ( not ( = ?auto_1326052 ?auto_1326061 ) ) ( not ( = ?auto_1326052 ?auto_1326062 ) ) ( not ( = ?auto_1326052 ?auto_1326063 ) ) ( not ( = ?auto_1326052 ?auto_1326069 ) ) ( not ( = ?auto_1326049 ?auto_1326053 ) ) ( not ( = ?auto_1326049 ?auto_1326055 ) ) ( not ( = ?auto_1326049 ?auto_1326054 ) ) ( not ( = ?auto_1326049 ?auto_1326056 ) ) ( not ( = ?auto_1326049 ?auto_1326057 ) ) ( not ( = ?auto_1326049 ?auto_1326058 ) ) ( not ( = ?auto_1326049 ?auto_1326059 ) ) ( not ( = ?auto_1326049 ?auto_1326060 ) ) ( not ( = ?auto_1326049 ?auto_1326061 ) ) ( not ( = ?auto_1326049 ?auto_1326062 ) ) ( not ( = ?auto_1326049 ?auto_1326063 ) ) ( not ( = ?auto_1326049 ?auto_1326069 ) ) ( not ( = ?auto_1326053 ?auto_1326055 ) ) ( not ( = ?auto_1326053 ?auto_1326054 ) ) ( not ( = ?auto_1326053 ?auto_1326056 ) ) ( not ( = ?auto_1326053 ?auto_1326057 ) ) ( not ( = ?auto_1326053 ?auto_1326058 ) ) ( not ( = ?auto_1326053 ?auto_1326059 ) ) ( not ( = ?auto_1326053 ?auto_1326060 ) ) ( not ( = ?auto_1326053 ?auto_1326061 ) ) ( not ( = ?auto_1326053 ?auto_1326062 ) ) ( not ( = ?auto_1326053 ?auto_1326063 ) ) ( not ( = ?auto_1326053 ?auto_1326069 ) ) ( not ( = ?auto_1326055 ?auto_1326054 ) ) ( not ( = ?auto_1326055 ?auto_1326056 ) ) ( not ( = ?auto_1326055 ?auto_1326057 ) ) ( not ( = ?auto_1326055 ?auto_1326058 ) ) ( not ( = ?auto_1326055 ?auto_1326059 ) ) ( not ( = ?auto_1326055 ?auto_1326060 ) ) ( not ( = ?auto_1326055 ?auto_1326061 ) ) ( not ( = ?auto_1326055 ?auto_1326062 ) ) ( not ( = ?auto_1326055 ?auto_1326063 ) ) ( not ( = ?auto_1326055 ?auto_1326069 ) ) ( not ( = ?auto_1326054 ?auto_1326056 ) ) ( not ( = ?auto_1326054 ?auto_1326057 ) ) ( not ( = ?auto_1326054 ?auto_1326058 ) ) ( not ( = ?auto_1326054 ?auto_1326059 ) ) ( not ( = ?auto_1326054 ?auto_1326060 ) ) ( not ( = ?auto_1326054 ?auto_1326061 ) ) ( not ( = ?auto_1326054 ?auto_1326062 ) ) ( not ( = ?auto_1326054 ?auto_1326063 ) ) ( not ( = ?auto_1326054 ?auto_1326069 ) ) ( not ( = ?auto_1326056 ?auto_1326057 ) ) ( not ( = ?auto_1326056 ?auto_1326058 ) ) ( not ( = ?auto_1326056 ?auto_1326059 ) ) ( not ( = ?auto_1326056 ?auto_1326060 ) ) ( not ( = ?auto_1326056 ?auto_1326061 ) ) ( not ( = ?auto_1326056 ?auto_1326062 ) ) ( not ( = ?auto_1326056 ?auto_1326063 ) ) ( not ( = ?auto_1326056 ?auto_1326069 ) ) ( not ( = ?auto_1326057 ?auto_1326058 ) ) ( not ( = ?auto_1326057 ?auto_1326059 ) ) ( not ( = ?auto_1326057 ?auto_1326060 ) ) ( not ( = ?auto_1326057 ?auto_1326061 ) ) ( not ( = ?auto_1326057 ?auto_1326062 ) ) ( not ( = ?auto_1326057 ?auto_1326063 ) ) ( not ( = ?auto_1326057 ?auto_1326069 ) ) ( not ( = ?auto_1326058 ?auto_1326059 ) ) ( not ( = ?auto_1326058 ?auto_1326060 ) ) ( not ( = ?auto_1326058 ?auto_1326061 ) ) ( not ( = ?auto_1326058 ?auto_1326062 ) ) ( not ( = ?auto_1326058 ?auto_1326063 ) ) ( not ( = ?auto_1326058 ?auto_1326069 ) ) ( not ( = ?auto_1326059 ?auto_1326060 ) ) ( not ( = ?auto_1326059 ?auto_1326061 ) ) ( not ( = ?auto_1326059 ?auto_1326062 ) ) ( not ( = ?auto_1326059 ?auto_1326063 ) ) ( not ( = ?auto_1326059 ?auto_1326069 ) ) ( not ( = ?auto_1326060 ?auto_1326061 ) ) ( not ( = ?auto_1326060 ?auto_1326062 ) ) ( not ( = ?auto_1326060 ?auto_1326063 ) ) ( not ( = ?auto_1326060 ?auto_1326069 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1326061 ?auto_1326062 ?auto_1326063 )
      ( MAKE-14CRATE-VERIFY ?auto_1326050 ?auto_1326051 ?auto_1326052 ?auto_1326049 ?auto_1326053 ?auto_1326055 ?auto_1326054 ?auto_1326056 ?auto_1326057 ?auto_1326058 ?auto_1326059 ?auto_1326060 ?auto_1326061 ?auto_1326062 ?auto_1326063 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1326254 - SURFACE
      ?auto_1326255 - SURFACE
      ?auto_1326256 - SURFACE
      ?auto_1326253 - SURFACE
      ?auto_1326257 - SURFACE
      ?auto_1326259 - SURFACE
      ?auto_1326258 - SURFACE
      ?auto_1326260 - SURFACE
      ?auto_1326261 - SURFACE
      ?auto_1326262 - SURFACE
      ?auto_1326263 - SURFACE
      ?auto_1326264 - SURFACE
      ?auto_1326265 - SURFACE
      ?auto_1326266 - SURFACE
      ?auto_1326267 - SURFACE
    )
    :vars
    (
      ?auto_1326268 - HOIST
      ?auto_1326273 - PLACE
      ?auto_1326270 - PLACE
      ?auto_1326272 - HOIST
      ?auto_1326271 - SURFACE
      ?auto_1326269 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1326268 ?auto_1326273 ) ( SURFACE-AT ?auto_1326266 ?auto_1326273 ) ( CLEAR ?auto_1326266 ) ( IS-CRATE ?auto_1326267 ) ( not ( = ?auto_1326266 ?auto_1326267 ) ) ( AVAILABLE ?auto_1326268 ) ( ON ?auto_1326266 ?auto_1326265 ) ( not ( = ?auto_1326265 ?auto_1326266 ) ) ( not ( = ?auto_1326265 ?auto_1326267 ) ) ( not ( = ?auto_1326270 ?auto_1326273 ) ) ( HOIST-AT ?auto_1326272 ?auto_1326270 ) ( not ( = ?auto_1326268 ?auto_1326272 ) ) ( AVAILABLE ?auto_1326272 ) ( SURFACE-AT ?auto_1326267 ?auto_1326270 ) ( ON ?auto_1326267 ?auto_1326271 ) ( CLEAR ?auto_1326267 ) ( not ( = ?auto_1326266 ?auto_1326271 ) ) ( not ( = ?auto_1326267 ?auto_1326271 ) ) ( not ( = ?auto_1326265 ?auto_1326271 ) ) ( TRUCK-AT ?auto_1326269 ?auto_1326273 ) ( ON ?auto_1326255 ?auto_1326254 ) ( ON ?auto_1326256 ?auto_1326255 ) ( ON ?auto_1326253 ?auto_1326256 ) ( ON ?auto_1326257 ?auto_1326253 ) ( ON ?auto_1326259 ?auto_1326257 ) ( ON ?auto_1326258 ?auto_1326259 ) ( ON ?auto_1326260 ?auto_1326258 ) ( ON ?auto_1326261 ?auto_1326260 ) ( ON ?auto_1326262 ?auto_1326261 ) ( ON ?auto_1326263 ?auto_1326262 ) ( ON ?auto_1326264 ?auto_1326263 ) ( ON ?auto_1326265 ?auto_1326264 ) ( not ( = ?auto_1326254 ?auto_1326255 ) ) ( not ( = ?auto_1326254 ?auto_1326256 ) ) ( not ( = ?auto_1326254 ?auto_1326253 ) ) ( not ( = ?auto_1326254 ?auto_1326257 ) ) ( not ( = ?auto_1326254 ?auto_1326259 ) ) ( not ( = ?auto_1326254 ?auto_1326258 ) ) ( not ( = ?auto_1326254 ?auto_1326260 ) ) ( not ( = ?auto_1326254 ?auto_1326261 ) ) ( not ( = ?auto_1326254 ?auto_1326262 ) ) ( not ( = ?auto_1326254 ?auto_1326263 ) ) ( not ( = ?auto_1326254 ?auto_1326264 ) ) ( not ( = ?auto_1326254 ?auto_1326265 ) ) ( not ( = ?auto_1326254 ?auto_1326266 ) ) ( not ( = ?auto_1326254 ?auto_1326267 ) ) ( not ( = ?auto_1326254 ?auto_1326271 ) ) ( not ( = ?auto_1326255 ?auto_1326256 ) ) ( not ( = ?auto_1326255 ?auto_1326253 ) ) ( not ( = ?auto_1326255 ?auto_1326257 ) ) ( not ( = ?auto_1326255 ?auto_1326259 ) ) ( not ( = ?auto_1326255 ?auto_1326258 ) ) ( not ( = ?auto_1326255 ?auto_1326260 ) ) ( not ( = ?auto_1326255 ?auto_1326261 ) ) ( not ( = ?auto_1326255 ?auto_1326262 ) ) ( not ( = ?auto_1326255 ?auto_1326263 ) ) ( not ( = ?auto_1326255 ?auto_1326264 ) ) ( not ( = ?auto_1326255 ?auto_1326265 ) ) ( not ( = ?auto_1326255 ?auto_1326266 ) ) ( not ( = ?auto_1326255 ?auto_1326267 ) ) ( not ( = ?auto_1326255 ?auto_1326271 ) ) ( not ( = ?auto_1326256 ?auto_1326253 ) ) ( not ( = ?auto_1326256 ?auto_1326257 ) ) ( not ( = ?auto_1326256 ?auto_1326259 ) ) ( not ( = ?auto_1326256 ?auto_1326258 ) ) ( not ( = ?auto_1326256 ?auto_1326260 ) ) ( not ( = ?auto_1326256 ?auto_1326261 ) ) ( not ( = ?auto_1326256 ?auto_1326262 ) ) ( not ( = ?auto_1326256 ?auto_1326263 ) ) ( not ( = ?auto_1326256 ?auto_1326264 ) ) ( not ( = ?auto_1326256 ?auto_1326265 ) ) ( not ( = ?auto_1326256 ?auto_1326266 ) ) ( not ( = ?auto_1326256 ?auto_1326267 ) ) ( not ( = ?auto_1326256 ?auto_1326271 ) ) ( not ( = ?auto_1326253 ?auto_1326257 ) ) ( not ( = ?auto_1326253 ?auto_1326259 ) ) ( not ( = ?auto_1326253 ?auto_1326258 ) ) ( not ( = ?auto_1326253 ?auto_1326260 ) ) ( not ( = ?auto_1326253 ?auto_1326261 ) ) ( not ( = ?auto_1326253 ?auto_1326262 ) ) ( not ( = ?auto_1326253 ?auto_1326263 ) ) ( not ( = ?auto_1326253 ?auto_1326264 ) ) ( not ( = ?auto_1326253 ?auto_1326265 ) ) ( not ( = ?auto_1326253 ?auto_1326266 ) ) ( not ( = ?auto_1326253 ?auto_1326267 ) ) ( not ( = ?auto_1326253 ?auto_1326271 ) ) ( not ( = ?auto_1326257 ?auto_1326259 ) ) ( not ( = ?auto_1326257 ?auto_1326258 ) ) ( not ( = ?auto_1326257 ?auto_1326260 ) ) ( not ( = ?auto_1326257 ?auto_1326261 ) ) ( not ( = ?auto_1326257 ?auto_1326262 ) ) ( not ( = ?auto_1326257 ?auto_1326263 ) ) ( not ( = ?auto_1326257 ?auto_1326264 ) ) ( not ( = ?auto_1326257 ?auto_1326265 ) ) ( not ( = ?auto_1326257 ?auto_1326266 ) ) ( not ( = ?auto_1326257 ?auto_1326267 ) ) ( not ( = ?auto_1326257 ?auto_1326271 ) ) ( not ( = ?auto_1326259 ?auto_1326258 ) ) ( not ( = ?auto_1326259 ?auto_1326260 ) ) ( not ( = ?auto_1326259 ?auto_1326261 ) ) ( not ( = ?auto_1326259 ?auto_1326262 ) ) ( not ( = ?auto_1326259 ?auto_1326263 ) ) ( not ( = ?auto_1326259 ?auto_1326264 ) ) ( not ( = ?auto_1326259 ?auto_1326265 ) ) ( not ( = ?auto_1326259 ?auto_1326266 ) ) ( not ( = ?auto_1326259 ?auto_1326267 ) ) ( not ( = ?auto_1326259 ?auto_1326271 ) ) ( not ( = ?auto_1326258 ?auto_1326260 ) ) ( not ( = ?auto_1326258 ?auto_1326261 ) ) ( not ( = ?auto_1326258 ?auto_1326262 ) ) ( not ( = ?auto_1326258 ?auto_1326263 ) ) ( not ( = ?auto_1326258 ?auto_1326264 ) ) ( not ( = ?auto_1326258 ?auto_1326265 ) ) ( not ( = ?auto_1326258 ?auto_1326266 ) ) ( not ( = ?auto_1326258 ?auto_1326267 ) ) ( not ( = ?auto_1326258 ?auto_1326271 ) ) ( not ( = ?auto_1326260 ?auto_1326261 ) ) ( not ( = ?auto_1326260 ?auto_1326262 ) ) ( not ( = ?auto_1326260 ?auto_1326263 ) ) ( not ( = ?auto_1326260 ?auto_1326264 ) ) ( not ( = ?auto_1326260 ?auto_1326265 ) ) ( not ( = ?auto_1326260 ?auto_1326266 ) ) ( not ( = ?auto_1326260 ?auto_1326267 ) ) ( not ( = ?auto_1326260 ?auto_1326271 ) ) ( not ( = ?auto_1326261 ?auto_1326262 ) ) ( not ( = ?auto_1326261 ?auto_1326263 ) ) ( not ( = ?auto_1326261 ?auto_1326264 ) ) ( not ( = ?auto_1326261 ?auto_1326265 ) ) ( not ( = ?auto_1326261 ?auto_1326266 ) ) ( not ( = ?auto_1326261 ?auto_1326267 ) ) ( not ( = ?auto_1326261 ?auto_1326271 ) ) ( not ( = ?auto_1326262 ?auto_1326263 ) ) ( not ( = ?auto_1326262 ?auto_1326264 ) ) ( not ( = ?auto_1326262 ?auto_1326265 ) ) ( not ( = ?auto_1326262 ?auto_1326266 ) ) ( not ( = ?auto_1326262 ?auto_1326267 ) ) ( not ( = ?auto_1326262 ?auto_1326271 ) ) ( not ( = ?auto_1326263 ?auto_1326264 ) ) ( not ( = ?auto_1326263 ?auto_1326265 ) ) ( not ( = ?auto_1326263 ?auto_1326266 ) ) ( not ( = ?auto_1326263 ?auto_1326267 ) ) ( not ( = ?auto_1326263 ?auto_1326271 ) ) ( not ( = ?auto_1326264 ?auto_1326265 ) ) ( not ( = ?auto_1326264 ?auto_1326266 ) ) ( not ( = ?auto_1326264 ?auto_1326267 ) ) ( not ( = ?auto_1326264 ?auto_1326271 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1326265 ?auto_1326266 ?auto_1326267 )
      ( MAKE-14CRATE-VERIFY ?auto_1326254 ?auto_1326255 ?auto_1326256 ?auto_1326253 ?auto_1326257 ?auto_1326259 ?auto_1326258 ?auto_1326260 ?auto_1326261 ?auto_1326262 ?auto_1326263 ?auto_1326264 ?auto_1326265 ?auto_1326266 ?auto_1326267 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1326458 - SURFACE
      ?auto_1326459 - SURFACE
      ?auto_1326460 - SURFACE
      ?auto_1326457 - SURFACE
      ?auto_1326461 - SURFACE
      ?auto_1326463 - SURFACE
      ?auto_1326462 - SURFACE
      ?auto_1326464 - SURFACE
      ?auto_1326465 - SURFACE
      ?auto_1326466 - SURFACE
      ?auto_1326467 - SURFACE
      ?auto_1326468 - SURFACE
      ?auto_1326469 - SURFACE
      ?auto_1326470 - SURFACE
      ?auto_1326471 - SURFACE
    )
    :vars
    (
      ?auto_1326477 - HOIST
      ?auto_1326473 - PLACE
      ?auto_1326472 - PLACE
      ?auto_1326475 - HOIST
      ?auto_1326476 - SURFACE
      ?auto_1326474 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1326477 ?auto_1326473 ) ( IS-CRATE ?auto_1326471 ) ( not ( = ?auto_1326470 ?auto_1326471 ) ) ( not ( = ?auto_1326469 ?auto_1326470 ) ) ( not ( = ?auto_1326469 ?auto_1326471 ) ) ( not ( = ?auto_1326472 ?auto_1326473 ) ) ( HOIST-AT ?auto_1326475 ?auto_1326472 ) ( not ( = ?auto_1326477 ?auto_1326475 ) ) ( AVAILABLE ?auto_1326475 ) ( SURFACE-AT ?auto_1326471 ?auto_1326472 ) ( ON ?auto_1326471 ?auto_1326476 ) ( CLEAR ?auto_1326471 ) ( not ( = ?auto_1326470 ?auto_1326476 ) ) ( not ( = ?auto_1326471 ?auto_1326476 ) ) ( not ( = ?auto_1326469 ?auto_1326476 ) ) ( TRUCK-AT ?auto_1326474 ?auto_1326473 ) ( SURFACE-AT ?auto_1326469 ?auto_1326473 ) ( CLEAR ?auto_1326469 ) ( LIFTING ?auto_1326477 ?auto_1326470 ) ( IS-CRATE ?auto_1326470 ) ( ON ?auto_1326459 ?auto_1326458 ) ( ON ?auto_1326460 ?auto_1326459 ) ( ON ?auto_1326457 ?auto_1326460 ) ( ON ?auto_1326461 ?auto_1326457 ) ( ON ?auto_1326463 ?auto_1326461 ) ( ON ?auto_1326462 ?auto_1326463 ) ( ON ?auto_1326464 ?auto_1326462 ) ( ON ?auto_1326465 ?auto_1326464 ) ( ON ?auto_1326466 ?auto_1326465 ) ( ON ?auto_1326467 ?auto_1326466 ) ( ON ?auto_1326468 ?auto_1326467 ) ( ON ?auto_1326469 ?auto_1326468 ) ( not ( = ?auto_1326458 ?auto_1326459 ) ) ( not ( = ?auto_1326458 ?auto_1326460 ) ) ( not ( = ?auto_1326458 ?auto_1326457 ) ) ( not ( = ?auto_1326458 ?auto_1326461 ) ) ( not ( = ?auto_1326458 ?auto_1326463 ) ) ( not ( = ?auto_1326458 ?auto_1326462 ) ) ( not ( = ?auto_1326458 ?auto_1326464 ) ) ( not ( = ?auto_1326458 ?auto_1326465 ) ) ( not ( = ?auto_1326458 ?auto_1326466 ) ) ( not ( = ?auto_1326458 ?auto_1326467 ) ) ( not ( = ?auto_1326458 ?auto_1326468 ) ) ( not ( = ?auto_1326458 ?auto_1326469 ) ) ( not ( = ?auto_1326458 ?auto_1326470 ) ) ( not ( = ?auto_1326458 ?auto_1326471 ) ) ( not ( = ?auto_1326458 ?auto_1326476 ) ) ( not ( = ?auto_1326459 ?auto_1326460 ) ) ( not ( = ?auto_1326459 ?auto_1326457 ) ) ( not ( = ?auto_1326459 ?auto_1326461 ) ) ( not ( = ?auto_1326459 ?auto_1326463 ) ) ( not ( = ?auto_1326459 ?auto_1326462 ) ) ( not ( = ?auto_1326459 ?auto_1326464 ) ) ( not ( = ?auto_1326459 ?auto_1326465 ) ) ( not ( = ?auto_1326459 ?auto_1326466 ) ) ( not ( = ?auto_1326459 ?auto_1326467 ) ) ( not ( = ?auto_1326459 ?auto_1326468 ) ) ( not ( = ?auto_1326459 ?auto_1326469 ) ) ( not ( = ?auto_1326459 ?auto_1326470 ) ) ( not ( = ?auto_1326459 ?auto_1326471 ) ) ( not ( = ?auto_1326459 ?auto_1326476 ) ) ( not ( = ?auto_1326460 ?auto_1326457 ) ) ( not ( = ?auto_1326460 ?auto_1326461 ) ) ( not ( = ?auto_1326460 ?auto_1326463 ) ) ( not ( = ?auto_1326460 ?auto_1326462 ) ) ( not ( = ?auto_1326460 ?auto_1326464 ) ) ( not ( = ?auto_1326460 ?auto_1326465 ) ) ( not ( = ?auto_1326460 ?auto_1326466 ) ) ( not ( = ?auto_1326460 ?auto_1326467 ) ) ( not ( = ?auto_1326460 ?auto_1326468 ) ) ( not ( = ?auto_1326460 ?auto_1326469 ) ) ( not ( = ?auto_1326460 ?auto_1326470 ) ) ( not ( = ?auto_1326460 ?auto_1326471 ) ) ( not ( = ?auto_1326460 ?auto_1326476 ) ) ( not ( = ?auto_1326457 ?auto_1326461 ) ) ( not ( = ?auto_1326457 ?auto_1326463 ) ) ( not ( = ?auto_1326457 ?auto_1326462 ) ) ( not ( = ?auto_1326457 ?auto_1326464 ) ) ( not ( = ?auto_1326457 ?auto_1326465 ) ) ( not ( = ?auto_1326457 ?auto_1326466 ) ) ( not ( = ?auto_1326457 ?auto_1326467 ) ) ( not ( = ?auto_1326457 ?auto_1326468 ) ) ( not ( = ?auto_1326457 ?auto_1326469 ) ) ( not ( = ?auto_1326457 ?auto_1326470 ) ) ( not ( = ?auto_1326457 ?auto_1326471 ) ) ( not ( = ?auto_1326457 ?auto_1326476 ) ) ( not ( = ?auto_1326461 ?auto_1326463 ) ) ( not ( = ?auto_1326461 ?auto_1326462 ) ) ( not ( = ?auto_1326461 ?auto_1326464 ) ) ( not ( = ?auto_1326461 ?auto_1326465 ) ) ( not ( = ?auto_1326461 ?auto_1326466 ) ) ( not ( = ?auto_1326461 ?auto_1326467 ) ) ( not ( = ?auto_1326461 ?auto_1326468 ) ) ( not ( = ?auto_1326461 ?auto_1326469 ) ) ( not ( = ?auto_1326461 ?auto_1326470 ) ) ( not ( = ?auto_1326461 ?auto_1326471 ) ) ( not ( = ?auto_1326461 ?auto_1326476 ) ) ( not ( = ?auto_1326463 ?auto_1326462 ) ) ( not ( = ?auto_1326463 ?auto_1326464 ) ) ( not ( = ?auto_1326463 ?auto_1326465 ) ) ( not ( = ?auto_1326463 ?auto_1326466 ) ) ( not ( = ?auto_1326463 ?auto_1326467 ) ) ( not ( = ?auto_1326463 ?auto_1326468 ) ) ( not ( = ?auto_1326463 ?auto_1326469 ) ) ( not ( = ?auto_1326463 ?auto_1326470 ) ) ( not ( = ?auto_1326463 ?auto_1326471 ) ) ( not ( = ?auto_1326463 ?auto_1326476 ) ) ( not ( = ?auto_1326462 ?auto_1326464 ) ) ( not ( = ?auto_1326462 ?auto_1326465 ) ) ( not ( = ?auto_1326462 ?auto_1326466 ) ) ( not ( = ?auto_1326462 ?auto_1326467 ) ) ( not ( = ?auto_1326462 ?auto_1326468 ) ) ( not ( = ?auto_1326462 ?auto_1326469 ) ) ( not ( = ?auto_1326462 ?auto_1326470 ) ) ( not ( = ?auto_1326462 ?auto_1326471 ) ) ( not ( = ?auto_1326462 ?auto_1326476 ) ) ( not ( = ?auto_1326464 ?auto_1326465 ) ) ( not ( = ?auto_1326464 ?auto_1326466 ) ) ( not ( = ?auto_1326464 ?auto_1326467 ) ) ( not ( = ?auto_1326464 ?auto_1326468 ) ) ( not ( = ?auto_1326464 ?auto_1326469 ) ) ( not ( = ?auto_1326464 ?auto_1326470 ) ) ( not ( = ?auto_1326464 ?auto_1326471 ) ) ( not ( = ?auto_1326464 ?auto_1326476 ) ) ( not ( = ?auto_1326465 ?auto_1326466 ) ) ( not ( = ?auto_1326465 ?auto_1326467 ) ) ( not ( = ?auto_1326465 ?auto_1326468 ) ) ( not ( = ?auto_1326465 ?auto_1326469 ) ) ( not ( = ?auto_1326465 ?auto_1326470 ) ) ( not ( = ?auto_1326465 ?auto_1326471 ) ) ( not ( = ?auto_1326465 ?auto_1326476 ) ) ( not ( = ?auto_1326466 ?auto_1326467 ) ) ( not ( = ?auto_1326466 ?auto_1326468 ) ) ( not ( = ?auto_1326466 ?auto_1326469 ) ) ( not ( = ?auto_1326466 ?auto_1326470 ) ) ( not ( = ?auto_1326466 ?auto_1326471 ) ) ( not ( = ?auto_1326466 ?auto_1326476 ) ) ( not ( = ?auto_1326467 ?auto_1326468 ) ) ( not ( = ?auto_1326467 ?auto_1326469 ) ) ( not ( = ?auto_1326467 ?auto_1326470 ) ) ( not ( = ?auto_1326467 ?auto_1326471 ) ) ( not ( = ?auto_1326467 ?auto_1326476 ) ) ( not ( = ?auto_1326468 ?auto_1326469 ) ) ( not ( = ?auto_1326468 ?auto_1326470 ) ) ( not ( = ?auto_1326468 ?auto_1326471 ) ) ( not ( = ?auto_1326468 ?auto_1326476 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1326469 ?auto_1326470 ?auto_1326471 )
      ( MAKE-14CRATE-VERIFY ?auto_1326458 ?auto_1326459 ?auto_1326460 ?auto_1326457 ?auto_1326461 ?auto_1326463 ?auto_1326462 ?auto_1326464 ?auto_1326465 ?auto_1326466 ?auto_1326467 ?auto_1326468 ?auto_1326469 ?auto_1326470 ?auto_1326471 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1326662 - SURFACE
      ?auto_1326663 - SURFACE
      ?auto_1326664 - SURFACE
      ?auto_1326661 - SURFACE
      ?auto_1326665 - SURFACE
      ?auto_1326667 - SURFACE
      ?auto_1326666 - SURFACE
      ?auto_1326668 - SURFACE
      ?auto_1326669 - SURFACE
      ?auto_1326670 - SURFACE
      ?auto_1326671 - SURFACE
      ?auto_1326672 - SURFACE
      ?auto_1326673 - SURFACE
      ?auto_1326674 - SURFACE
      ?auto_1326675 - SURFACE
    )
    :vars
    (
      ?auto_1326680 - HOIST
      ?auto_1326677 - PLACE
      ?auto_1326679 - PLACE
      ?auto_1326676 - HOIST
      ?auto_1326681 - SURFACE
      ?auto_1326678 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1326680 ?auto_1326677 ) ( IS-CRATE ?auto_1326675 ) ( not ( = ?auto_1326674 ?auto_1326675 ) ) ( not ( = ?auto_1326673 ?auto_1326674 ) ) ( not ( = ?auto_1326673 ?auto_1326675 ) ) ( not ( = ?auto_1326679 ?auto_1326677 ) ) ( HOIST-AT ?auto_1326676 ?auto_1326679 ) ( not ( = ?auto_1326680 ?auto_1326676 ) ) ( AVAILABLE ?auto_1326676 ) ( SURFACE-AT ?auto_1326675 ?auto_1326679 ) ( ON ?auto_1326675 ?auto_1326681 ) ( CLEAR ?auto_1326675 ) ( not ( = ?auto_1326674 ?auto_1326681 ) ) ( not ( = ?auto_1326675 ?auto_1326681 ) ) ( not ( = ?auto_1326673 ?auto_1326681 ) ) ( TRUCK-AT ?auto_1326678 ?auto_1326677 ) ( SURFACE-AT ?auto_1326673 ?auto_1326677 ) ( CLEAR ?auto_1326673 ) ( IS-CRATE ?auto_1326674 ) ( AVAILABLE ?auto_1326680 ) ( IN ?auto_1326674 ?auto_1326678 ) ( ON ?auto_1326663 ?auto_1326662 ) ( ON ?auto_1326664 ?auto_1326663 ) ( ON ?auto_1326661 ?auto_1326664 ) ( ON ?auto_1326665 ?auto_1326661 ) ( ON ?auto_1326667 ?auto_1326665 ) ( ON ?auto_1326666 ?auto_1326667 ) ( ON ?auto_1326668 ?auto_1326666 ) ( ON ?auto_1326669 ?auto_1326668 ) ( ON ?auto_1326670 ?auto_1326669 ) ( ON ?auto_1326671 ?auto_1326670 ) ( ON ?auto_1326672 ?auto_1326671 ) ( ON ?auto_1326673 ?auto_1326672 ) ( not ( = ?auto_1326662 ?auto_1326663 ) ) ( not ( = ?auto_1326662 ?auto_1326664 ) ) ( not ( = ?auto_1326662 ?auto_1326661 ) ) ( not ( = ?auto_1326662 ?auto_1326665 ) ) ( not ( = ?auto_1326662 ?auto_1326667 ) ) ( not ( = ?auto_1326662 ?auto_1326666 ) ) ( not ( = ?auto_1326662 ?auto_1326668 ) ) ( not ( = ?auto_1326662 ?auto_1326669 ) ) ( not ( = ?auto_1326662 ?auto_1326670 ) ) ( not ( = ?auto_1326662 ?auto_1326671 ) ) ( not ( = ?auto_1326662 ?auto_1326672 ) ) ( not ( = ?auto_1326662 ?auto_1326673 ) ) ( not ( = ?auto_1326662 ?auto_1326674 ) ) ( not ( = ?auto_1326662 ?auto_1326675 ) ) ( not ( = ?auto_1326662 ?auto_1326681 ) ) ( not ( = ?auto_1326663 ?auto_1326664 ) ) ( not ( = ?auto_1326663 ?auto_1326661 ) ) ( not ( = ?auto_1326663 ?auto_1326665 ) ) ( not ( = ?auto_1326663 ?auto_1326667 ) ) ( not ( = ?auto_1326663 ?auto_1326666 ) ) ( not ( = ?auto_1326663 ?auto_1326668 ) ) ( not ( = ?auto_1326663 ?auto_1326669 ) ) ( not ( = ?auto_1326663 ?auto_1326670 ) ) ( not ( = ?auto_1326663 ?auto_1326671 ) ) ( not ( = ?auto_1326663 ?auto_1326672 ) ) ( not ( = ?auto_1326663 ?auto_1326673 ) ) ( not ( = ?auto_1326663 ?auto_1326674 ) ) ( not ( = ?auto_1326663 ?auto_1326675 ) ) ( not ( = ?auto_1326663 ?auto_1326681 ) ) ( not ( = ?auto_1326664 ?auto_1326661 ) ) ( not ( = ?auto_1326664 ?auto_1326665 ) ) ( not ( = ?auto_1326664 ?auto_1326667 ) ) ( not ( = ?auto_1326664 ?auto_1326666 ) ) ( not ( = ?auto_1326664 ?auto_1326668 ) ) ( not ( = ?auto_1326664 ?auto_1326669 ) ) ( not ( = ?auto_1326664 ?auto_1326670 ) ) ( not ( = ?auto_1326664 ?auto_1326671 ) ) ( not ( = ?auto_1326664 ?auto_1326672 ) ) ( not ( = ?auto_1326664 ?auto_1326673 ) ) ( not ( = ?auto_1326664 ?auto_1326674 ) ) ( not ( = ?auto_1326664 ?auto_1326675 ) ) ( not ( = ?auto_1326664 ?auto_1326681 ) ) ( not ( = ?auto_1326661 ?auto_1326665 ) ) ( not ( = ?auto_1326661 ?auto_1326667 ) ) ( not ( = ?auto_1326661 ?auto_1326666 ) ) ( not ( = ?auto_1326661 ?auto_1326668 ) ) ( not ( = ?auto_1326661 ?auto_1326669 ) ) ( not ( = ?auto_1326661 ?auto_1326670 ) ) ( not ( = ?auto_1326661 ?auto_1326671 ) ) ( not ( = ?auto_1326661 ?auto_1326672 ) ) ( not ( = ?auto_1326661 ?auto_1326673 ) ) ( not ( = ?auto_1326661 ?auto_1326674 ) ) ( not ( = ?auto_1326661 ?auto_1326675 ) ) ( not ( = ?auto_1326661 ?auto_1326681 ) ) ( not ( = ?auto_1326665 ?auto_1326667 ) ) ( not ( = ?auto_1326665 ?auto_1326666 ) ) ( not ( = ?auto_1326665 ?auto_1326668 ) ) ( not ( = ?auto_1326665 ?auto_1326669 ) ) ( not ( = ?auto_1326665 ?auto_1326670 ) ) ( not ( = ?auto_1326665 ?auto_1326671 ) ) ( not ( = ?auto_1326665 ?auto_1326672 ) ) ( not ( = ?auto_1326665 ?auto_1326673 ) ) ( not ( = ?auto_1326665 ?auto_1326674 ) ) ( not ( = ?auto_1326665 ?auto_1326675 ) ) ( not ( = ?auto_1326665 ?auto_1326681 ) ) ( not ( = ?auto_1326667 ?auto_1326666 ) ) ( not ( = ?auto_1326667 ?auto_1326668 ) ) ( not ( = ?auto_1326667 ?auto_1326669 ) ) ( not ( = ?auto_1326667 ?auto_1326670 ) ) ( not ( = ?auto_1326667 ?auto_1326671 ) ) ( not ( = ?auto_1326667 ?auto_1326672 ) ) ( not ( = ?auto_1326667 ?auto_1326673 ) ) ( not ( = ?auto_1326667 ?auto_1326674 ) ) ( not ( = ?auto_1326667 ?auto_1326675 ) ) ( not ( = ?auto_1326667 ?auto_1326681 ) ) ( not ( = ?auto_1326666 ?auto_1326668 ) ) ( not ( = ?auto_1326666 ?auto_1326669 ) ) ( not ( = ?auto_1326666 ?auto_1326670 ) ) ( not ( = ?auto_1326666 ?auto_1326671 ) ) ( not ( = ?auto_1326666 ?auto_1326672 ) ) ( not ( = ?auto_1326666 ?auto_1326673 ) ) ( not ( = ?auto_1326666 ?auto_1326674 ) ) ( not ( = ?auto_1326666 ?auto_1326675 ) ) ( not ( = ?auto_1326666 ?auto_1326681 ) ) ( not ( = ?auto_1326668 ?auto_1326669 ) ) ( not ( = ?auto_1326668 ?auto_1326670 ) ) ( not ( = ?auto_1326668 ?auto_1326671 ) ) ( not ( = ?auto_1326668 ?auto_1326672 ) ) ( not ( = ?auto_1326668 ?auto_1326673 ) ) ( not ( = ?auto_1326668 ?auto_1326674 ) ) ( not ( = ?auto_1326668 ?auto_1326675 ) ) ( not ( = ?auto_1326668 ?auto_1326681 ) ) ( not ( = ?auto_1326669 ?auto_1326670 ) ) ( not ( = ?auto_1326669 ?auto_1326671 ) ) ( not ( = ?auto_1326669 ?auto_1326672 ) ) ( not ( = ?auto_1326669 ?auto_1326673 ) ) ( not ( = ?auto_1326669 ?auto_1326674 ) ) ( not ( = ?auto_1326669 ?auto_1326675 ) ) ( not ( = ?auto_1326669 ?auto_1326681 ) ) ( not ( = ?auto_1326670 ?auto_1326671 ) ) ( not ( = ?auto_1326670 ?auto_1326672 ) ) ( not ( = ?auto_1326670 ?auto_1326673 ) ) ( not ( = ?auto_1326670 ?auto_1326674 ) ) ( not ( = ?auto_1326670 ?auto_1326675 ) ) ( not ( = ?auto_1326670 ?auto_1326681 ) ) ( not ( = ?auto_1326671 ?auto_1326672 ) ) ( not ( = ?auto_1326671 ?auto_1326673 ) ) ( not ( = ?auto_1326671 ?auto_1326674 ) ) ( not ( = ?auto_1326671 ?auto_1326675 ) ) ( not ( = ?auto_1326671 ?auto_1326681 ) ) ( not ( = ?auto_1326672 ?auto_1326673 ) ) ( not ( = ?auto_1326672 ?auto_1326674 ) ) ( not ( = ?auto_1326672 ?auto_1326675 ) ) ( not ( = ?auto_1326672 ?auto_1326681 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1326673 ?auto_1326674 ?auto_1326675 )
      ( MAKE-14CRATE-VERIFY ?auto_1326662 ?auto_1326663 ?auto_1326664 ?auto_1326661 ?auto_1326665 ?auto_1326667 ?auto_1326666 ?auto_1326668 ?auto_1326669 ?auto_1326670 ?auto_1326671 ?auto_1326672 ?auto_1326673 ?auto_1326674 ?auto_1326675 ) )
  )

)

