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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_10313 - SURFACE
      ?auto_10314 - SURFACE
    )
    :vars
    (
      ?auto_10315 - HOIST
      ?auto_10316 - PLACE
      ?auto_10318 - PLACE
      ?auto_10319 - HOIST
      ?auto_10320 - SURFACE
      ?auto_10317 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10315 ?auto_10316 ) ( SURFACE-AT ?auto_10313 ?auto_10316 ) ( CLEAR ?auto_10313 ) ( IS-CRATE ?auto_10314 ) ( AVAILABLE ?auto_10315 ) ( not ( = ?auto_10318 ?auto_10316 ) ) ( HOIST-AT ?auto_10319 ?auto_10318 ) ( AVAILABLE ?auto_10319 ) ( SURFACE-AT ?auto_10314 ?auto_10318 ) ( ON ?auto_10314 ?auto_10320 ) ( CLEAR ?auto_10314 ) ( TRUCK-AT ?auto_10317 ?auto_10316 ) ( not ( = ?auto_10313 ?auto_10314 ) ) ( not ( = ?auto_10313 ?auto_10320 ) ) ( not ( = ?auto_10314 ?auto_10320 ) ) ( not ( = ?auto_10315 ?auto_10319 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_10317 ?auto_10316 ?auto_10318 )
      ( !LIFT ?auto_10319 ?auto_10314 ?auto_10320 ?auto_10318 )
      ( !LOAD ?auto_10319 ?auto_10314 ?auto_10317 ?auto_10318 )
      ( !DRIVE ?auto_10317 ?auto_10318 ?auto_10316 )
      ( !UNLOAD ?auto_10315 ?auto_10314 ?auto_10317 ?auto_10316 )
      ( !DROP ?auto_10315 ?auto_10314 ?auto_10313 ?auto_10316 )
      ( MAKE-1CRATE-VERIFY ?auto_10313 ?auto_10314 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_10323 - SURFACE
      ?auto_10324 - SURFACE
    )
    :vars
    (
      ?auto_10325 - HOIST
      ?auto_10326 - PLACE
      ?auto_10328 - PLACE
      ?auto_10329 - HOIST
      ?auto_10330 - SURFACE
      ?auto_10327 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10325 ?auto_10326 ) ( SURFACE-AT ?auto_10323 ?auto_10326 ) ( CLEAR ?auto_10323 ) ( IS-CRATE ?auto_10324 ) ( AVAILABLE ?auto_10325 ) ( not ( = ?auto_10328 ?auto_10326 ) ) ( HOIST-AT ?auto_10329 ?auto_10328 ) ( AVAILABLE ?auto_10329 ) ( SURFACE-AT ?auto_10324 ?auto_10328 ) ( ON ?auto_10324 ?auto_10330 ) ( CLEAR ?auto_10324 ) ( TRUCK-AT ?auto_10327 ?auto_10326 ) ( not ( = ?auto_10323 ?auto_10324 ) ) ( not ( = ?auto_10323 ?auto_10330 ) ) ( not ( = ?auto_10324 ?auto_10330 ) ) ( not ( = ?auto_10325 ?auto_10329 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_10327 ?auto_10326 ?auto_10328 )
      ( !LIFT ?auto_10329 ?auto_10324 ?auto_10330 ?auto_10328 )
      ( !LOAD ?auto_10329 ?auto_10324 ?auto_10327 ?auto_10328 )
      ( !DRIVE ?auto_10327 ?auto_10328 ?auto_10326 )
      ( !UNLOAD ?auto_10325 ?auto_10324 ?auto_10327 ?auto_10326 )
      ( !DROP ?auto_10325 ?auto_10324 ?auto_10323 ?auto_10326 )
      ( MAKE-1CRATE-VERIFY ?auto_10323 ?auto_10324 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_10334 - SURFACE
      ?auto_10335 - SURFACE
      ?auto_10336 - SURFACE
    )
    :vars
    (
      ?auto_10341 - HOIST
      ?auto_10337 - PLACE
      ?auto_10340 - PLACE
      ?auto_10338 - HOIST
      ?auto_10339 - SURFACE
      ?auto_10345 - PLACE
      ?auto_10344 - HOIST
      ?auto_10343 - SURFACE
      ?auto_10342 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10341 ?auto_10337 ) ( IS-CRATE ?auto_10336 ) ( not ( = ?auto_10340 ?auto_10337 ) ) ( HOIST-AT ?auto_10338 ?auto_10340 ) ( AVAILABLE ?auto_10338 ) ( SURFACE-AT ?auto_10336 ?auto_10340 ) ( ON ?auto_10336 ?auto_10339 ) ( CLEAR ?auto_10336 ) ( not ( = ?auto_10335 ?auto_10336 ) ) ( not ( = ?auto_10335 ?auto_10339 ) ) ( not ( = ?auto_10336 ?auto_10339 ) ) ( not ( = ?auto_10341 ?auto_10338 ) ) ( SURFACE-AT ?auto_10334 ?auto_10337 ) ( CLEAR ?auto_10334 ) ( IS-CRATE ?auto_10335 ) ( AVAILABLE ?auto_10341 ) ( not ( = ?auto_10345 ?auto_10337 ) ) ( HOIST-AT ?auto_10344 ?auto_10345 ) ( AVAILABLE ?auto_10344 ) ( SURFACE-AT ?auto_10335 ?auto_10345 ) ( ON ?auto_10335 ?auto_10343 ) ( CLEAR ?auto_10335 ) ( TRUCK-AT ?auto_10342 ?auto_10337 ) ( not ( = ?auto_10334 ?auto_10335 ) ) ( not ( = ?auto_10334 ?auto_10343 ) ) ( not ( = ?auto_10335 ?auto_10343 ) ) ( not ( = ?auto_10341 ?auto_10344 ) ) ( not ( = ?auto_10334 ?auto_10336 ) ) ( not ( = ?auto_10334 ?auto_10339 ) ) ( not ( = ?auto_10336 ?auto_10343 ) ) ( not ( = ?auto_10340 ?auto_10345 ) ) ( not ( = ?auto_10338 ?auto_10344 ) ) ( not ( = ?auto_10339 ?auto_10343 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_10334 ?auto_10335 )
      ( MAKE-1CRATE ?auto_10335 ?auto_10336 )
      ( MAKE-2CRATE-VERIFY ?auto_10334 ?auto_10335 ?auto_10336 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_10348 - SURFACE
      ?auto_10349 - SURFACE
    )
    :vars
    (
      ?auto_10350 - HOIST
      ?auto_10351 - PLACE
      ?auto_10353 - PLACE
      ?auto_10354 - HOIST
      ?auto_10355 - SURFACE
      ?auto_10352 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10350 ?auto_10351 ) ( SURFACE-AT ?auto_10348 ?auto_10351 ) ( CLEAR ?auto_10348 ) ( IS-CRATE ?auto_10349 ) ( AVAILABLE ?auto_10350 ) ( not ( = ?auto_10353 ?auto_10351 ) ) ( HOIST-AT ?auto_10354 ?auto_10353 ) ( AVAILABLE ?auto_10354 ) ( SURFACE-AT ?auto_10349 ?auto_10353 ) ( ON ?auto_10349 ?auto_10355 ) ( CLEAR ?auto_10349 ) ( TRUCK-AT ?auto_10352 ?auto_10351 ) ( not ( = ?auto_10348 ?auto_10349 ) ) ( not ( = ?auto_10348 ?auto_10355 ) ) ( not ( = ?auto_10349 ?auto_10355 ) ) ( not ( = ?auto_10350 ?auto_10354 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_10352 ?auto_10351 ?auto_10353 )
      ( !LIFT ?auto_10354 ?auto_10349 ?auto_10355 ?auto_10353 )
      ( !LOAD ?auto_10354 ?auto_10349 ?auto_10352 ?auto_10353 )
      ( !DRIVE ?auto_10352 ?auto_10353 ?auto_10351 )
      ( !UNLOAD ?auto_10350 ?auto_10349 ?auto_10352 ?auto_10351 )
      ( !DROP ?auto_10350 ?auto_10349 ?auto_10348 ?auto_10351 )
      ( MAKE-1CRATE-VERIFY ?auto_10348 ?auto_10349 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_10360 - SURFACE
      ?auto_10361 - SURFACE
      ?auto_10362 - SURFACE
      ?auto_10363 - SURFACE
    )
    :vars
    (
      ?auto_10364 - HOIST
      ?auto_10366 - PLACE
      ?auto_10367 - PLACE
      ?auto_10369 - HOIST
      ?auto_10365 - SURFACE
      ?auto_10375 - PLACE
      ?auto_10371 - HOIST
      ?auto_10370 - SURFACE
      ?auto_10373 - PLACE
      ?auto_10372 - HOIST
      ?auto_10374 - SURFACE
      ?auto_10368 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10364 ?auto_10366 ) ( IS-CRATE ?auto_10363 ) ( not ( = ?auto_10367 ?auto_10366 ) ) ( HOIST-AT ?auto_10369 ?auto_10367 ) ( AVAILABLE ?auto_10369 ) ( SURFACE-AT ?auto_10363 ?auto_10367 ) ( ON ?auto_10363 ?auto_10365 ) ( CLEAR ?auto_10363 ) ( not ( = ?auto_10362 ?auto_10363 ) ) ( not ( = ?auto_10362 ?auto_10365 ) ) ( not ( = ?auto_10363 ?auto_10365 ) ) ( not ( = ?auto_10364 ?auto_10369 ) ) ( IS-CRATE ?auto_10362 ) ( not ( = ?auto_10375 ?auto_10366 ) ) ( HOIST-AT ?auto_10371 ?auto_10375 ) ( AVAILABLE ?auto_10371 ) ( SURFACE-AT ?auto_10362 ?auto_10375 ) ( ON ?auto_10362 ?auto_10370 ) ( CLEAR ?auto_10362 ) ( not ( = ?auto_10361 ?auto_10362 ) ) ( not ( = ?auto_10361 ?auto_10370 ) ) ( not ( = ?auto_10362 ?auto_10370 ) ) ( not ( = ?auto_10364 ?auto_10371 ) ) ( SURFACE-AT ?auto_10360 ?auto_10366 ) ( CLEAR ?auto_10360 ) ( IS-CRATE ?auto_10361 ) ( AVAILABLE ?auto_10364 ) ( not ( = ?auto_10373 ?auto_10366 ) ) ( HOIST-AT ?auto_10372 ?auto_10373 ) ( AVAILABLE ?auto_10372 ) ( SURFACE-AT ?auto_10361 ?auto_10373 ) ( ON ?auto_10361 ?auto_10374 ) ( CLEAR ?auto_10361 ) ( TRUCK-AT ?auto_10368 ?auto_10366 ) ( not ( = ?auto_10360 ?auto_10361 ) ) ( not ( = ?auto_10360 ?auto_10374 ) ) ( not ( = ?auto_10361 ?auto_10374 ) ) ( not ( = ?auto_10364 ?auto_10372 ) ) ( not ( = ?auto_10360 ?auto_10362 ) ) ( not ( = ?auto_10360 ?auto_10370 ) ) ( not ( = ?auto_10362 ?auto_10374 ) ) ( not ( = ?auto_10375 ?auto_10373 ) ) ( not ( = ?auto_10371 ?auto_10372 ) ) ( not ( = ?auto_10370 ?auto_10374 ) ) ( not ( = ?auto_10360 ?auto_10363 ) ) ( not ( = ?auto_10360 ?auto_10365 ) ) ( not ( = ?auto_10361 ?auto_10363 ) ) ( not ( = ?auto_10361 ?auto_10365 ) ) ( not ( = ?auto_10363 ?auto_10370 ) ) ( not ( = ?auto_10363 ?auto_10374 ) ) ( not ( = ?auto_10367 ?auto_10375 ) ) ( not ( = ?auto_10367 ?auto_10373 ) ) ( not ( = ?auto_10369 ?auto_10371 ) ) ( not ( = ?auto_10369 ?auto_10372 ) ) ( not ( = ?auto_10365 ?auto_10370 ) ) ( not ( = ?auto_10365 ?auto_10374 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_10360 ?auto_10361 ?auto_10362 )
      ( MAKE-1CRATE ?auto_10362 ?auto_10363 )
      ( MAKE-3CRATE-VERIFY ?auto_10360 ?auto_10361 ?auto_10362 ?auto_10363 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_10378 - SURFACE
      ?auto_10379 - SURFACE
    )
    :vars
    (
      ?auto_10380 - HOIST
      ?auto_10381 - PLACE
      ?auto_10383 - PLACE
      ?auto_10384 - HOIST
      ?auto_10385 - SURFACE
      ?auto_10382 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10380 ?auto_10381 ) ( SURFACE-AT ?auto_10378 ?auto_10381 ) ( CLEAR ?auto_10378 ) ( IS-CRATE ?auto_10379 ) ( AVAILABLE ?auto_10380 ) ( not ( = ?auto_10383 ?auto_10381 ) ) ( HOIST-AT ?auto_10384 ?auto_10383 ) ( AVAILABLE ?auto_10384 ) ( SURFACE-AT ?auto_10379 ?auto_10383 ) ( ON ?auto_10379 ?auto_10385 ) ( CLEAR ?auto_10379 ) ( TRUCK-AT ?auto_10382 ?auto_10381 ) ( not ( = ?auto_10378 ?auto_10379 ) ) ( not ( = ?auto_10378 ?auto_10385 ) ) ( not ( = ?auto_10379 ?auto_10385 ) ) ( not ( = ?auto_10380 ?auto_10384 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_10382 ?auto_10381 ?auto_10383 )
      ( !LIFT ?auto_10384 ?auto_10379 ?auto_10385 ?auto_10383 )
      ( !LOAD ?auto_10384 ?auto_10379 ?auto_10382 ?auto_10383 )
      ( !DRIVE ?auto_10382 ?auto_10383 ?auto_10381 )
      ( !UNLOAD ?auto_10380 ?auto_10379 ?auto_10382 ?auto_10381 )
      ( !DROP ?auto_10380 ?auto_10379 ?auto_10378 ?auto_10381 )
      ( MAKE-1CRATE-VERIFY ?auto_10378 ?auto_10379 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_10391 - SURFACE
      ?auto_10392 - SURFACE
      ?auto_10393 - SURFACE
      ?auto_10394 - SURFACE
      ?auto_10395 - SURFACE
    )
    :vars
    (
      ?auto_10399 - HOIST
      ?auto_10400 - PLACE
      ?auto_10398 - PLACE
      ?auto_10397 - HOIST
      ?auto_10401 - SURFACE
      ?auto_10402 - SURFACE
      ?auto_10403 - PLACE
      ?auto_10408 - HOIST
      ?auto_10407 - SURFACE
      ?auto_10404 - PLACE
      ?auto_10406 - HOIST
      ?auto_10405 - SURFACE
      ?auto_10396 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10399 ?auto_10400 ) ( IS-CRATE ?auto_10395 ) ( not ( = ?auto_10398 ?auto_10400 ) ) ( HOIST-AT ?auto_10397 ?auto_10398 ) ( SURFACE-AT ?auto_10395 ?auto_10398 ) ( ON ?auto_10395 ?auto_10401 ) ( CLEAR ?auto_10395 ) ( not ( = ?auto_10394 ?auto_10395 ) ) ( not ( = ?auto_10394 ?auto_10401 ) ) ( not ( = ?auto_10395 ?auto_10401 ) ) ( not ( = ?auto_10399 ?auto_10397 ) ) ( IS-CRATE ?auto_10394 ) ( AVAILABLE ?auto_10397 ) ( SURFACE-AT ?auto_10394 ?auto_10398 ) ( ON ?auto_10394 ?auto_10402 ) ( CLEAR ?auto_10394 ) ( not ( = ?auto_10393 ?auto_10394 ) ) ( not ( = ?auto_10393 ?auto_10402 ) ) ( not ( = ?auto_10394 ?auto_10402 ) ) ( IS-CRATE ?auto_10393 ) ( not ( = ?auto_10403 ?auto_10400 ) ) ( HOIST-AT ?auto_10408 ?auto_10403 ) ( AVAILABLE ?auto_10408 ) ( SURFACE-AT ?auto_10393 ?auto_10403 ) ( ON ?auto_10393 ?auto_10407 ) ( CLEAR ?auto_10393 ) ( not ( = ?auto_10392 ?auto_10393 ) ) ( not ( = ?auto_10392 ?auto_10407 ) ) ( not ( = ?auto_10393 ?auto_10407 ) ) ( not ( = ?auto_10399 ?auto_10408 ) ) ( SURFACE-AT ?auto_10391 ?auto_10400 ) ( CLEAR ?auto_10391 ) ( IS-CRATE ?auto_10392 ) ( AVAILABLE ?auto_10399 ) ( not ( = ?auto_10404 ?auto_10400 ) ) ( HOIST-AT ?auto_10406 ?auto_10404 ) ( AVAILABLE ?auto_10406 ) ( SURFACE-AT ?auto_10392 ?auto_10404 ) ( ON ?auto_10392 ?auto_10405 ) ( CLEAR ?auto_10392 ) ( TRUCK-AT ?auto_10396 ?auto_10400 ) ( not ( = ?auto_10391 ?auto_10392 ) ) ( not ( = ?auto_10391 ?auto_10405 ) ) ( not ( = ?auto_10392 ?auto_10405 ) ) ( not ( = ?auto_10399 ?auto_10406 ) ) ( not ( = ?auto_10391 ?auto_10393 ) ) ( not ( = ?auto_10391 ?auto_10407 ) ) ( not ( = ?auto_10393 ?auto_10405 ) ) ( not ( = ?auto_10403 ?auto_10404 ) ) ( not ( = ?auto_10408 ?auto_10406 ) ) ( not ( = ?auto_10407 ?auto_10405 ) ) ( not ( = ?auto_10391 ?auto_10394 ) ) ( not ( = ?auto_10391 ?auto_10402 ) ) ( not ( = ?auto_10392 ?auto_10394 ) ) ( not ( = ?auto_10392 ?auto_10402 ) ) ( not ( = ?auto_10394 ?auto_10407 ) ) ( not ( = ?auto_10394 ?auto_10405 ) ) ( not ( = ?auto_10398 ?auto_10403 ) ) ( not ( = ?auto_10398 ?auto_10404 ) ) ( not ( = ?auto_10397 ?auto_10408 ) ) ( not ( = ?auto_10397 ?auto_10406 ) ) ( not ( = ?auto_10402 ?auto_10407 ) ) ( not ( = ?auto_10402 ?auto_10405 ) ) ( not ( = ?auto_10391 ?auto_10395 ) ) ( not ( = ?auto_10391 ?auto_10401 ) ) ( not ( = ?auto_10392 ?auto_10395 ) ) ( not ( = ?auto_10392 ?auto_10401 ) ) ( not ( = ?auto_10393 ?auto_10395 ) ) ( not ( = ?auto_10393 ?auto_10401 ) ) ( not ( = ?auto_10395 ?auto_10402 ) ) ( not ( = ?auto_10395 ?auto_10407 ) ) ( not ( = ?auto_10395 ?auto_10405 ) ) ( not ( = ?auto_10401 ?auto_10402 ) ) ( not ( = ?auto_10401 ?auto_10407 ) ) ( not ( = ?auto_10401 ?auto_10405 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_10391 ?auto_10392 ?auto_10393 ?auto_10394 )
      ( MAKE-1CRATE ?auto_10394 ?auto_10395 )
      ( MAKE-4CRATE-VERIFY ?auto_10391 ?auto_10392 ?auto_10393 ?auto_10394 ?auto_10395 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_10411 - SURFACE
      ?auto_10412 - SURFACE
    )
    :vars
    (
      ?auto_10413 - HOIST
      ?auto_10414 - PLACE
      ?auto_10416 - PLACE
      ?auto_10417 - HOIST
      ?auto_10418 - SURFACE
      ?auto_10415 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10413 ?auto_10414 ) ( SURFACE-AT ?auto_10411 ?auto_10414 ) ( CLEAR ?auto_10411 ) ( IS-CRATE ?auto_10412 ) ( AVAILABLE ?auto_10413 ) ( not ( = ?auto_10416 ?auto_10414 ) ) ( HOIST-AT ?auto_10417 ?auto_10416 ) ( AVAILABLE ?auto_10417 ) ( SURFACE-AT ?auto_10412 ?auto_10416 ) ( ON ?auto_10412 ?auto_10418 ) ( CLEAR ?auto_10412 ) ( TRUCK-AT ?auto_10415 ?auto_10414 ) ( not ( = ?auto_10411 ?auto_10412 ) ) ( not ( = ?auto_10411 ?auto_10418 ) ) ( not ( = ?auto_10412 ?auto_10418 ) ) ( not ( = ?auto_10413 ?auto_10417 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_10415 ?auto_10414 ?auto_10416 )
      ( !LIFT ?auto_10417 ?auto_10412 ?auto_10418 ?auto_10416 )
      ( !LOAD ?auto_10417 ?auto_10412 ?auto_10415 ?auto_10416 )
      ( !DRIVE ?auto_10415 ?auto_10416 ?auto_10414 )
      ( !UNLOAD ?auto_10413 ?auto_10412 ?auto_10415 ?auto_10414 )
      ( !DROP ?auto_10413 ?auto_10412 ?auto_10411 ?auto_10414 )
      ( MAKE-1CRATE-VERIFY ?auto_10411 ?auto_10412 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_10425 - SURFACE
      ?auto_10426 - SURFACE
      ?auto_10427 - SURFACE
      ?auto_10428 - SURFACE
      ?auto_10429 - SURFACE
      ?auto_10430 - SURFACE
    )
    :vars
    (
      ?auto_10436 - HOIST
      ?auto_10435 - PLACE
      ?auto_10432 - PLACE
      ?auto_10431 - HOIST
      ?auto_10434 - SURFACE
      ?auto_10441 - PLACE
      ?auto_10442 - HOIST
      ?auto_10437 - SURFACE
      ?auto_10443 - SURFACE
      ?auto_10438 - PLACE
      ?auto_10440 - HOIST
      ?auto_10446 - SURFACE
      ?auto_10444 - PLACE
      ?auto_10445 - HOIST
      ?auto_10439 - SURFACE
      ?auto_10433 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10436 ?auto_10435 ) ( IS-CRATE ?auto_10430 ) ( not ( = ?auto_10432 ?auto_10435 ) ) ( HOIST-AT ?auto_10431 ?auto_10432 ) ( AVAILABLE ?auto_10431 ) ( SURFACE-AT ?auto_10430 ?auto_10432 ) ( ON ?auto_10430 ?auto_10434 ) ( CLEAR ?auto_10430 ) ( not ( = ?auto_10429 ?auto_10430 ) ) ( not ( = ?auto_10429 ?auto_10434 ) ) ( not ( = ?auto_10430 ?auto_10434 ) ) ( not ( = ?auto_10436 ?auto_10431 ) ) ( IS-CRATE ?auto_10429 ) ( not ( = ?auto_10441 ?auto_10435 ) ) ( HOIST-AT ?auto_10442 ?auto_10441 ) ( SURFACE-AT ?auto_10429 ?auto_10441 ) ( ON ?auto_10429 ?auto_10437 ) ( CLEAR ?auto_10429 ) ( not ( = ?auto_10428 ?auto_10429 ) ) ( not ( = ?auto_10428 ?auto_10437 ) ) ( not ( = ?auto_10429 ?auto_10437 ) ) ( not ( = ?auto_10436 ?auto_10442 ) ) ( IS-CRATE ?auto_10428 ) ( AVAILABLE ?auto_10442 ) ( SURFACE-AT ?auto_10428 ?auto_10441 ) ( ON ?auto_10428 ?auto_10443 ) ( CLEAR ?auto_10428 ) ( not ( = ?auto_10427 ?auto_10428 ) ) ( not ( = ?auto_10427 ?auto_10443 ) ) ( not ( = ?auto_10428 ?auto_10443 ) ) ( IS-CRATE ?auto_10427 ) ( not ( = ?auto_10438 ?auto_10435 ) ) ( HOIST-AT ?auto_10440 ?auto_10438 ) ( AVAILABLE ?auto_10440 ) ( SURFACE-AT ?auto_10427 ?auto_10438 ) ( ON ?auto_10427 ?auto_10446 ) ( CLEAR ?auto_10427 ) ( not ( = ?auto_10426 ?auto_10427 ) ) ( not ( = ?auto_10426 ?auto_10446 ) ) ( not ( = ?auto_10427 ?auto_10446 ) ) ( not ( = ?auto_10436 ?auto_10440 ) ) ( SURFACE-AT ?auto_10425 ?auto_10435 ) ( CLEAR ?auto_10425 ) ( IS-CRATE ?auto_10426 ) ( AVAILABLE ?auto_10436 ) ( not ( = ?auto_10444 ?auto_10435 ) ) ( HOIST-AT ?auto_10445 ?auto_10444 ) ( AVAILABLE ?auto_10445 ) ( SURFACE-AT ?auto_10426 ?auto_10444 ) ( ON ?auto_10426 ?auto_10439 ) ( CLEAR ?auto_10426 ) ( TRUCK-AT ?auto_10433 ?auto_10435 ) ( not ( = ?auto_10425 ?auto_10426 ) ) ( not ( = ?auto_10425 ?auto_10439 ) ) ( not ( = ?auto_10426 ?auto_10439 ) ) ( not ( = ?auto_10436 ?auto_10445 ) ) ( not ( = ?auto_10425 ?auto_10427 ) ) ( not ( = ?auto_10425 ?auto_10446 ) ) ( not ( = ?auto_10427 ?auto_10439 ) ) ( not ( = ?auto_10438 ?auto_10444 ) ) ( not ( = ?auto_10440 ?auto_10445 ) ) ( not ( = ?auto_10446 ?auto_10439 ) ) ( not ( = ?auto_10425 ?auto_10428 ) ) ( not ( = ?auto_10425 ?auto_10443 ) ) ( not ( = ?auto_10426 ?auto_10428 ) ) ( not ( = ?auto_10426 ?auto_10443 ) ) ( not ( = ?auto_10428 ?auto_10446 ) ) ( not ( = ?auto_10428 ?auto_10439 ) ) ( not ( = ?auto_10441 ?auto_10438 ) ) ( not ( = ?auto_10441 ?auto_10444 ) ) ( not ( = ?auto_10442 ?auto_10440 ) ) ( not ( = ?auto_10442 ?auto_10445 ) ) ( not ( = ?auto_10443 ?auto_10446 ) ) ( not ( = ?auto_10443 ?auto_10439 ) ) ( not ( = ?auto_10425 ?auto_10429 ) ) ( not ( = ?auto_10425 ?auto_10437 ) ) ( not ( = ?auto_10426 ?auto_10429 ) ) ( not ( = ?auto_10426 ?auto_10437 ) ) ( not ( = ?auto_10427 ?auto_10429 ) ) ( not ( = ?auto_10427 ?auto_10437 ) ) ( not ( = ?auto_10429 ?auto_10443 ) ) ( not ( = ?auto_10429 ?auto_10446 ) ) ( not ( = ?auto_10429 ?auto_10439 ) ) ( not ( = ?auto_10437 ?auto_10443 ) ) ( not ( = ?auto_10437 ?auto_10446 ) ) ( not ( = ?auto_10437 ?auto_10439 ) ) ( not ( = ?auto_10425 ?auto_10430 ) ) ( not ( = ?auto_10425 ?auto_10434 ) ) ( not ( = ?auto_10426 ?auto_10430 ) ) ( not ( = ?auto_10426 ?auto_10434 ) ) ( not ( = ?auto_10427 ?auto_10430 ) ) ( not ( = ?auto_10427 ?auto_10434 ) ) ( not ( = ?auto_10428 ?auto_10430 ) ) ( not ( = ?auto_10428 ?auto_10434 ) ) ( not ( = ?auto_10430 ?auto_10437 ) ) ( not ( = ?auto_10430 ?auto_10443 ) ) ( not ( = ?auto_10430 ?auto_10446 ) ) ( not ( = ?auto_10430 ?auto_10439 ) ) ( not ( = ?auto_10432 ?auto_10441 ) ) ( not ( = ?auto_10432 ?auto_10438 ) ) ( not ( = ?auto_10432 ?auto_10444 ) ) ( not ( = ?auto_10431 ?auto_10442 ) ) ( not ( = ?auto_10431 ?auto_10440 ) ) ( not ( = ?auto_10431 ?auto_10445 ) ) ( not ( = ?auto_10434 ?auto_10437 ) ) ( not ( = ?auto_10434 ?auto_10443 ) ) ( not ( = ?auto_10434 ?auto_10446 ) ) ( not ( = ?auto_10434 ?auto_10439 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_10425 ?auto_10426 ?auto_10427 ?auto_10428 ?auto_10429 )
      ( MAKE-1CRATE ?auto_10429 ?auto_10430 )
      ( MAKE-5CRATE-VERIFY ?auto_10425 ?auto_10426 ?auto_10427 ?auto_10428 ?auto_10429 ?auto_10430 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_10449 - SURFACE
      ?auto_10450 - SURFACE
    )
    :vars
    (
      ?auto_10451 - HOIST
      ?auto_10452 - PLACE
      ?auto_10454 - PLACE
      ?auto_10455 - HOIST
      ?auto_10456 - SURFACE
      ?auto_10453 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10451 ?auto_10452 ) ( SURFACE-AT ?auto_10449 ?auto_10452 ) ( CLEAR ?auto_10449 ) ( IS-CRATE ?auto_10450 ) ( AVAILABLE ?auto_10451 ) ( not ( = ?auto_10454 ?auto_10452 ) ) ( HOIST-AT ?auto_10455 ?auto_10454 ) ( AVAILABLE ?auto_10455 ) ( SURFACE-AT ?auto_10450 ?auto_10454 ) ( ON ?auto_10450 ?auto_10456 ) ( CLEAR ?auto_10450 ) ( TRUCK-AT ?auto_10453 ?auto_10452 ) ( not ( = ?auto_10449 ?auto_10450 ) ) ( not ( = ?auto_10449 ?auto_10456 ) ) ( not ( = ?auto_10450 ?auto_10456 ) ) ( not ( = ?auto_10451 ?auto_10455 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_10453 ?auto_10452 ?auto_10454 )
      ( !LIFT ?auto_10455 ?auto_10450 ?auto_10456 ?auto_10454 )
      ( !LOAD ?auto_10455 ?auto_10450 ?auto_10453 ?auto_10454 )
      ( !DRIVE ?auto_10453 ?auto_10454 ?auto_10452 )
      ( !UNLOAD ?auto_10451 ?auto_10450 ?auto_10453 ?auto_10452 )
      ( !DROP ?auto_10451 ?auto_10450 ?auto_10449 ?auto_10452 )
      ( MAKE-1CRATE-VERIFY ?auto_10449 ?auto_10450 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_10464 - SURFACE
      ?auto_10465 - SURFACE
      ?auto_10466 - SURFACE
      ?auto_10467 - SURFACE
      ?auto_10468 - SURFACE
      ?auto_10470 - SURFACE
      ?auto_10469 - SURFACE
    )
    :vars
    (
      ?auto_10471 - HOIST
      ?auto_10475 - PLACE
      ?auto_10476 - PLACE
      ?auto_10474 - HOIST
      ?auto_10472 - SURFACE
      ?auto_10484 - PLACE
      ?auto_10480 - HOIST
      ?auto_10479 - SURFACE
      ?auto_10485 - PLACE
      ?auto_10481 - HOIST
      ?auto_10477 - SURFACE
      ?auto_10482 - SURFACE
      ?auto_10487 - PLACE
      ?auto_10483 - HOIST
      ?auto_10478 - SURFACE
      ?auto_10486 - SURFACE
      ?auto_10473 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10471 ?auto_10475 ) ( IS-CRATE ?auto_10469 ) ( not ( = ?auto_10476 ?auto_10475 ) ) ( HOIST-AT ?auto_10474 ?auto_10476 ) ( SURFACE-AT ?auto_10469 ?auto_10476 ) ( ON ?auto_10469 ?auto_10472 ) ( CLEAR ?auto_10469 ) ( not ( = ?auto_10470 ?auto_10469 ) ) ( not ( = ?auto_10470 ?auto_10472 ) ) ( not ( = ?auto_10469 ?auto_10472 ) ) ( not ( = ?auto_10471 ?auto_10474 ) ) ( IS-CRATE ?auto_10470 ) ( not ( = ?auto_10484 ?auto_10475 ) ) ( HOIST-AT ?auto_10480 ?auto_10484 ) ( AVAILABLE ?auto_10480 ) ( SURFACE-AT ?auto_10470 ?auto_10484 ) ( ON ?auto_10470 ?auto_10479 ) ( CLEAR ?auto_10470 ) ( not ( = ?auto_10468 ?auto_10470 ) ) ( not ( = ?auto_10468 ?auto_10479 ) ) ( not ( = ?auto_10470 ?auto_10479 ) ) ( not ( = ?auto_10471 ?auto_10480 ) ) ( IS-CRATE ?auto_10468 ) ( not ( = ?auto_10485 ?auto_10475 ) ) ( HOIST-AT ?auto_10481 ?auto_10485 ) ( SURFACE-AT ?auto_10468 ?auto_10485 ) ( ON ?auto_10468 ?auto_10477 ) ( CLEAR ?auto_10468 ) ( not ( = ?auto_10467 ?auto_10468 ) ) ( not ( = ?auto_10467 ?auto_10477 ) ) ( not ( = ?auto_10468 ?auto_10477 ) ) ( not ( = ?auto_10471 ?auto_10481 ) ) ( IS-CRATE ?auto_10467 ) ( AVAILABLE ?auto_10481 ) ( SURFACE-AT ?auto_10467 ?auto_10485 ) ( ON ?auto_10467 ?auto_10482 ) ( CLEAR ?auto_10467 ) ( not ( = ?auto_10466 ?auto_10467 ) ) ( not ( = ?auto_10466 ?auto_10482 ) ) ( not ( = ?auto_10467 ?auto_10482 ) ) ( IS-CRATE ?auto_10466 ) ( not ( = ?auto_10487 ?auto_10475 ) ) ( HOIST-AT ?auto_10483 ?auto_10487 ) ( AVAILABLE ?auto_10483 ) ( SURFACE-AT ?auto_10466 ?auto_10487 ) ( ON ?auto_10466 ?auto_10478 ) ( CLEAR ?auto_10466 ) ( not ( = ?auto_10465 ?auto_10466 ) ) ( not ( = ?auto_10465 ?auto_10478 ) ) ( not ( = ?auto_10466 ?auto_10478 ) ) ( not ( = ?auto_10471 ?auto_10483 ) ) ( SURFACE-AT ?auto_10464 ?auto_10475 ) ( CLEAR ?auto_10464 ) ( IS-CRATE ?auto_10465 ) ( AVAILABLE ?auto_10471 ) ( AVAILABLE ?auto_10474 ) ( SURFACE-AT ?auto_10465 ?auto_10476 ) ( ON ?auto_10465 ?auto_10486 ) ( CLEAR ?auto_10465 ) ( TRUCK-AT ?auto_10473 ?auto_10475 ) ( not ( = ?auto_10464 ?auto_10465 ) ) ( not ( = ?auto_10464 ?auto_10486 ) ) ( not ( = ?auto_10465 ?auto_10486 ) ) ( not ( = ?auto_10464 ?auto_10466 ) ) ( not ( = ?auto_10464 ?auto_10478 ) ) ( not ( = ?auto_10466 ?auto_10486 ) ) ( not ( = ?auto_10487 ?auto_10476 ) ) ( not ( = ?auto_10483 ?auto_10474 ) ) ( not ( = ?auto_10478 ?auto_10486 ) ) ( not ( = ?auto_10464 ?auto_10467 ) ) ( not ( = ?auto_10464 ?auto_10482 ) ) ( not ( = ?auto_10465 ?auto_10467 ) ) ( not ( = ?auto_10465 ?auto_10482 ) ) ( not ( = ?auto_10467 ?auto_10478 ) ) ( not ( = ?auto_10467 ?auto_10486 ) ) ( not ( = ?auto_10485 ?auto_10487 ) ) ( not ( = ?auto_10485 ?auto_10476 ) ) ( not ( = ?auto_10481 ?auto_10483 ) ) ( not ( = ?auto_10481 ?auto_10474 ) ) ( not ( = ?auto_10482 ?auto_10478 ) ) ( not ( = ?auto_10482 ?auto_10486 ) ) ( not ( = ?auto_10464 ?auto_10468 ) ) ( not ( = ?auto_10464 ?auto_10477 ) ) ( not ( = ?auto_10465 ?auto_10468 ) ) ( not ( = ?auto_10465 ?auto_10477 ) ) ( not ( = ?auto_10466 ?auto_10468 ) ) ( not ( = ?auto_10466 ?auto_10477 ) ) ( not ( = ?auto_10468 ?auto_10482 ) ) ( not ( = ?auto_10468 ?auto_10478 ) ) ( not ( = ?auto_10468 ?auto_10486 ) ) ( not ( = ?auto_10477 ?auto_10482 ) ) ( not ( = ?auto_10477 ?auto_10478 ) ) ( not ( = ?auto_10477 ?auto_10486 ) ) ( not ( = ?auto_10464 ?auto_10470 ) ) ( not ( = ?auto_10464 ?auto_10479 ) ) ( not ( = ?auto_10465 ?auto_10470 ) ) ( not ( = ?auto_10465 ?auto_10479 ) ) ( not ( = ?auto_10466 ?auto_10470 ) ) ( not ( = ?auto_10466 ?auto_10479 ) ) ( not ( = ?auto_10467 ?auto_10470 ) ) ( not ( = ?auto_10467 ?auto_10479 ) ) ( not ( = ?auto_10470 ?auto_10477 ) ) ( not ( = ?auto_10470 ?auto_10482 ) ) ( not ( = ?auto_10470 ?auto_10478 ) ) ( not ( = ?auto_10470 ?auto_10486 ) ) ( not ( = ?auto_10484 ?auto_10485 ) ) ( not ( = ?auto_10484 ?auto_10487 ) ) ( not ( = ?auto_10484 ?auto_10476 ) ) ( not ( = ?auto_10480 ?auto_10481 ) ) ( not ( = ?auto_10480 ?auto_10483 ) ) ( not ( = ?auto_10480 ?auto_10474 ) ) ( not ( = ?auto_10479 ?auto_10477 ) ) ( not ( = ?auto_10479 ?auto_10482 ) ) ( not ( = ?auto_10479 ?auto_10478 ) ) ( not ( = ?auto_10479 ?auto_10486 ) ) ( not ( = ?auto_10464 ?auto_10469 ) ) ( not ( = ?auto_10464 ?auto_10472 ) ) ( not ( = ?auto_10465 ?auto_10469 ) ) ( not ( = ?auto_10465 ?auto_10472 ) ) ( not ( = ?auto_10466 ?auto_10469 ) ) ( not ( = ?auto_10466 ?auto_10472 ) ) ( not ( = ?auto_10467 ?auto_10469 ) ) ( not ( = ?auto_10467 ?auto_10472 ) ) ( not ( = ?auto_10468 ?auto_10469 ) ) ( not ( = ?auto_10468 ?auto_10472 ) ) ( not ( = ?auto_10469 ?auto_10479 ) ) ( not ( = ?auto_10469 ?auto_10477 ) ) ( not ( = ?auto_10469 ?auto_10482 ) ) ( not ( = ?auto_10469 ?auto_10478 ) ) ( not ( = ?auto_10469 ?auto_10486 ) ) ( not ( = ?auto_10472 ?auto_10479 ) ) ( not ( = ?auto_10472 ?auto_10477 ) ) ( not ( = ?auto_10472 ?auto_10482 ) ) ( not ( = ?auto_10472 ?auto_10478 ) ) ( not ( = ?auto_10472 ?auto_10486 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_10464 ?auto_10465 ?auto_10466 ?auto_10467 ?auto_10468 ?auto_10470 )
      ( MAKE-1CRATE ?auto_10470 ?auto_10469 )
      ( MAKE-6CRATE-VERIFY ?auto_10464 ?auto_10465 ?auto_10466 ?auto_10467 ?auto_10468 ?auto_10470 ?auto_10469 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_10490 - SURFACE
      ?auto_10491 - SURFACE
    )
    :vars
    (
      ?auto_10492 - HOIST
      ?auto_10493 - PLACE
      ?auto_10495 - PLACE
      ?auto_10496 - HOIST
      ?auto_10497 - SURFACE
      ?auto_10494 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10492 ?auto_10493 ) ( SURFACE-AT ?auto_10490 ?auto_10493 ) ( CLEAR ?auto_10490 ) ( IS-CRATE ?auto_10491 ) ( AVAILABLE ?auto_10492 ) ( not ( = ?auto_10495 ?auto_10493 ) ) ( HOIST-AT ?auto_10496 ?auto_10495 ) ( AVAILABLE ?auto_10496 ) ( SURFACE-AT ?auto_10491 ?auto_10495 ) ( ON ?auto_10491 ?auto_10497 ) ( CLEAR ?auto_10491 ) ( TRUCK-AT ?auto_10494 ?auto_10493 ) ( not ( = ?auto_10490 ?auto_10491 ) ) ( not ( = ?auto_10490 ?auto_10497 ) ) ( not ( = ?auto_10491 ?auto_10497 ) ) ( not ( = ?auto_10492 ?auto_10496 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_10494 ?auto_10493 ?auto_10495 )
      ( !LIFT ?auto_10496 ?auto_10491 ?auto_10497 ?auto_10495 )
      ( !LOAD ?auto_10496 ?auto_10491 ?auto_10494 ?auto_10495 )
      ( !DRIVE ?auto_10494 ?auto_10495 ?auto_10493 )
      ( !UNLOAD ?auto_10492 ?auto_10491 ?auto_10494 ?auto_10493 )
      ( !DROP ?auto_10492 ?auto_10491 ?auto_10490 ?auto_10493 )
      ( MAKE-1CRATE-VERIFY ?auto_10490 ?auto_10491 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_10506 - SURFACE
      ?auto_10507 - SURFACE
      ?auto_10508 - SURFACE
      ?auto_10509 - SURFACE
      ?auto_10510 - SURFACE
      ?auto_10512 - SURFACE
      ?auto_10511 - SURFACE
      ?auto_10513 - SURFACE
    )
    :vars
    (
      ?auto_10518 - HOIST
      ?auto_10516 - PLACE
      ?auto_10519 - PLACE
      ?auto_10515 - HOIST
      ?auto_10514 - SURFACE
      ?auto_10532 - PLACE
      ?auto_10527 - HOIST
      ?auto_10526 - SURFACE
      ?auto_10522 - PLACE
      ?auto_10530 - HOIST
      ?auto_10531 - SURFACE
      ?auto_10533 - PLACE
      ?auto_10525 - HOIST
      ?auto_10529 - SURFACE
      ?auto_10524 - SURFACE
      ?auto_10520 - PLACE
      ?auto_10523 - HOIST
      ?auto_10528 - SURFACE
      ?auto_10521 - SURFACE
      ?auto_10517 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10518 ?auto_10516 ) ( IS-CRATE ?auto_10513 ) ( not ( = ?auto_10519 ?auto_10516 ) ) ( HOIST-AT ?auto_10515 ?auto_10519 ) ( AVAILABLE ?auto_10515 ) ( SURFACE-AT ?auto_10513 ?auto_10519 ) ( ON ?auto_10513 ?auto_10514 ) ( CLEAR ?auto_10513 ) ( not ( = ?auto_10511 ?auto_10513 ) ) ( not ( = ?auto_10511 ?auto_10514 ) ) ( not ( = ?auto_10513 ?auto_10514 ) ) ( not ( = ?auto_10518 ?auto_10515 ) ) ( IS-CRATE ?auto_10511 ) ( not ( = ?auto_10532 ?auto_10516 ) ) ( HOIST-AT ?auto_10527 ?auto_10532 ) ( SURFACE-AT ?auto_10511 ?auto_10532 ) ( ON ?auto_10511 ?auto_10526 ) ( CLEAR ?auto_10511 ) ( not ( = ?auto_10512 ?auto_10511 ) ) ( not ( = ?auto_10512 ?auto_10526 ) ) ( not ( = ?auto_10511 ?auto_10526 ) ) ( not ( = ?auto_10518 ?auto_10527 ) ) ( IS-CRATE ?auto_10512 ) ( not ( = ?auto_10522 ?auto_10516 ) ) ( HOIST-AT ?auto_10530 ?auto_10522 ) ( AVAILABLE ?auto_10530 ) ( SURFACE-AT ?auto_10512 ?auto_10522 ) ( ON ?auto_10512 ?auto_10531 ) ( CLEAR ?auto_10512 ) ( not ( = ?auto_10510 ?auto_10512 ) ) ( not ( = ?auto_10510 ?auto_10531 ) ) ( not ( = ?auto_10512 ?auto_10531 ) ) ( not ( = ?auto_10518 ?auto_10530 ) ) ( IS-CRATE ?auto_10510 ) ( not ( = ?auto_10533 ?auto_10516 ) ) ( HOIST-AT ?auto_10525 ?auto_10533 ) ( SURFACE-AT ?auto_10510 ?auto_10533 ) ( ON ?auto_10510 ?auto_10529 ) ( CLEAR ?auto_10510 ) ( not ( = ?auto_10509 ?auto_10510 ) ) ( not ( = ?auto_10509 ?auto_10529 ) ) ( not ( = ?auto_10510 ?auto_10529 ) ) ( not ( = ?auto_10518 ?auto_10525 ) ) ( IS-CRATE ?auto_10509 ) ( AVAILABLE ?auto_10525 ) ( SURFACE-AT ?auto_10509 ?auto_10533 ) ( ON ?auto_10509 ?auto_10524 ) ( CLEAR ?auto_10509 ) ( not ( = ?auto_10508 ?auto_10509 ) ) ( not ( = ?auto_10508 ?auto_10524 ) ) ( not ( = ?auto_10509 ?auto_10524 ) ) ( IS-CRATE ?auto_10508 ) ( not ( = ?auto_10520 ?auto_10516 ) ) ( HOIST-AT ?auto_10523 ?auto_10520 ) ( AVAILABLE ?auto_10523 ) ( SURFACE-AT ?auto_10508 ?auto_10520 ) ( ON ?auto_10508 ?auto_10528 ) ( CLEAR ?auto_10508 ) ( not ( = ?auto_10507 ?auto_10508 ) ) ( not ( = ?auto_10507 ?auto_10528 ) ) ( not ( = ?auto_10508 ?auto_10528 ) ) ( not ( = ?auto_10518 ?auto_10523 ) ) ( SURFACE-AT ?auto_10506 ?auto_10516 ) ( CLEAR ?auto_10506 ) ( IS-CRATE ?auto_10507 ) ( AVAILABLE ?auto_10518 ) ( AVAILABLE ?auto_10527 ) ( SURFACE-AT ?auto_10507 ?auto_10532 ) ( ON ?auto_10507 ?auto_10521 ) ( CLEAR ?auto_10507 ) ( TRUCK-AT ?auto_10517 ?auto_10516 ) ( not ( = ?auto_10506 ?auto_10507 ) ) ( not ( = ?auto_10506 ?auto_10521 ) ) ( not ( = ?auto_10507 ?auto_10521 ) ) ( not ( = ?auto_10506 ?auto_10508 ) ) ( not ( = ?auto_10506 ?auto_10528 ) ) ( not ( = ?auto_10508 ?auto_10521 ) ) ( not ( = ?auto_10520 ?auto_10532 ) ) ( not ( = ?auto_10523 ?auto_10527 ) ) ( not ( = ?auto_10528 ?auto_10521 ) ) ( not ( = ?auto_10506 ?auto_10509 ) ) ( not ( = ?auto_10506 ?auto_10524 ) ) ( not ( = ?auto_10507 ?auto_10509 ) ) ( not ( = ?auto_10507 ?auto_10524 ) ) ( not ( = ?auto_10509 ?auto_10528 ) ) ( not ( = ?auto_10509 ?auto_10521 ) ) ( not ( = ?auto_10533 ?auto_10520 ) ) ( not ( = ?auto_10533 ?auto_10532 ) ) ( not ( = ?auto_10525 ?auto_10523 ) ) ( not ( = ?auto_10525 ?auto_10527 ) ) ( not ( = ?auto_10524 ?auto_10528 ) ) ( not ( = ?auto_10524 ?auto_10521 ) ) ( not ( = ?auto_10506 ?auto_10510 ) ) ( not ( = ?auto_10506 ?auto_10529 ) ) ( not ( = ?auto_10507 ?auto_10510 ) ) ( not ( = ?auto_10507 ?auto_10529 ) ) ( not ( = ?auto_10508 ?auto_10510 ) ) ( not ( = ?auto_10508 ?auto_10529 ) ) ( not ( = ?auto_10510 ?auto_10524 ) ) ( not ( = ?auto_10510 ?auto_10528 ) ) ( not ( = ?auto_10510 ?auto_10521 ) ) ( not ( = ?auto_10529 ?auto_10524 ) ) ( not ( = ?auto_10529 ?auto_10528 ) ) ( not ( = ?auto_10529 ?auto_10521 ) ) ( not ( = ?auto_10506 ?auto_10512 ) ) ( not ( = ?auto_10506 ?auto_10531 ) ) ( not ( = ?auto_10507 ?auto_10512 ) ) ( not ( = ?auto_10507 ?auto_10531 ) ) ( not ( = ?auto_10508 ?auto_10512 ) ) ( not ( = ?auto_10508 ?auto_10531 ) ) ( not ( = ?auto_10509 ?auto_10512 ) ) ( not ( = ?auto_10509 ?auto_10531 ) ) ( not ( = ?auto_10512 ?auto_10529 ) ) ( not ( = ?auto_10512 ?auto_10524 ) ) ( not ( = ?auto_10512 ?auto_10528 ) ) ( not ( = ?auto_10512 ?auto_10521 ) ) ( not ( = ?auto_10522 ?auto_10533 ) ) ( not ( = ?auto_10522 ?auto_10520 ) ) ( not ( = ?auto_10522 ?auto_10532 ) ) ( not ( = ?auto_10530 ?auto_10525 ) ) ( not ( = ?auto_10530 ?auto_10523 ) ) ( not ( = ?auto_10530 ?auto_10527 ) ) ( not ( = ?auto_10531 ?auto_10529 ) ) ( not ( = ?auto_10531 ?auto_10524 ) ) ( not ( = ?auto_10531 ?auto_10528 ) ) ( not ( = ?auto_10531 ?auto_10521 ) ) ( not ( = ?auto_10506 ?auto_10511 ) ) ( not ( = ?auto_10506 ?auto_10526 ) ) ( not ( = ?auto_10507 ?auto_10511 ) ) ( not ( = ?auto_10507 ?auto_10526 ) ) ( not ( = ?auto_10508 ?auto_10511 ) ) ( not ( = ?auto_10508 ?auto_10526 ) ) ( not ( = ?auto_10509 ?auto_10511 ) ) ( not ( = ?auto_10509 ?auto_10526 ) ) ( not ( = ?auto_10510 ?auto_10511 ) ) ( not ( = ?auto_10510 ?auto_10526 ) ) ( not ( = ?auto_10511 ?auto_10531 ) ) ( not ( = ?auto_10511 ?auto_10529 ) ) ( not ( = ?auto_10511 ?auto_10524 ) ) ( not ( = ?auto_10511 ?auto_10528 ) ) ( not ( = ?auto_10511 ?auto_10521 ) ) ( not ( = ?auto_10526 ?auto_10531 ) ) ( not ( = ?auto_10526 ?auto_10529 ) ) ( not ( = ?auto_10526 ?auto_10524 ) ) ( not ( = ?auto_10526 ?auto_10528 ) ) ( not ( = ?auto_10526 ?auto_10521 ) ) ( not ( = ?auto_10506 ?auto_10513 ) ) ( not ( = ?auto_10506 ?auto_10514 ) ) ( not ( = ?auto_10507 ?auto_10513 ) ) ( not ( = ?auto_10507 ?auto_10514 ) ) ( not ( = ?auto_10508 ?auto_10513 ) ) ( not ( = ?auto_10508 ?auto_10514 ) ) ( not ( = ?auto_10509 ?auto_10513 ) ) ( not ( = ?auto_10509 ?auto_10514 ) ) ( not ( = ?auto_10510 ?auto_10513 ) ) ( not ( = ?auto_10510 ?auto_10514 ) ) ( not ( = ?auto_10512 ?auto_10513 ) ) ( not ( = ?auto_10512 ?auto_10514 ) ) ( not ( = ?auto_10513 ?auto_10526 ) ) ( not ( = ?auto_10513 ?auto_10531 ) ) ( not ( = ?auto_10513 ?auto_10529 ) ) ( not ( = ?auto_10513 ?auto_10524 ) ) ( not ( = ?auto_10513 ?auto_10528 ) ) ( not ( = ?auto_10513 ?auto_10521 ) ) ( not ( = ?auto_10519 ?auto_10532 ) ) ( not ( = ?auto_10519 ?auto_10522 ) ) ( not ( = ?auto_10519 ?auto_10533 ) ) ( not ( = ?auto_10519 ?auto_10520 ) ) ( not ( = ?auto_10515 ?auto_10527 ) ) ( not ( = ?auto_10515 ?auto_10530 ) ) ( not ( = ?auto_10515 ?auto_10525 ) ) ( not ( = ?auto_10515 ?auto_10523 ) ) ( not ( = ?auto_10514 ?auto_10526 ) ) ( not ( = ?auto_10514 ?auto_10531 ) ) ( not ( = ?auto_10514 ?auto_10529 ) ) ( not ( = ?auto_10514 ?auto_10524 ) ) ( not ( = ?auto_10514 ?auto_10528 ) ) ( not ( = ?auto_10514 ?auto_10521 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_10506 ?auto_10507 ?auto_10508 ?auto_10509 ?auto_10510 ?auto_10512 ?auto_10511 )
      ( MAKE-1CRATE ?auto_10511 ?auto_10513 )
      ( MAKE-7CRATE-VERIFY ?auto_10506 ?auto_10507 ?auto_10508 ?auto_10509 ?auto_10510 ?auto_10512 ?auto_10511 ?auto_10513 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_10536 - SURFACE
      ?auto_10537 - SURFACE
    )
    :vars
    (
      ?auto_10538 - HOIST
      ?auto_10539 - PLACE
      ?auto_10541 - PLACE
      ?auto_10542 - HOIST
      ?auto_10543 - SURFACE
      ?auto_10540 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10538 ?auto_10539 ) ( SURFACE-AT ?auto_10536 ?auto_10539 ) ( CLEAR ?auto_10536 ) ( IS-CRATE ?auto_10537 ) ( AVAILABLE ?auto_10538 ) ( not ( = ?auto_10541 ?auto_10539 ) ) ( HOIST-AT ?auto_10542 ?auto_10541 ) ( AVAILABLE ?auto_10542 ) ( SURFACE-AT ?auto_10537 ?auto_10541 ) ( ON ?auto_10537 ?auto_10543 ) ( CLEAR ?auto_10537 ) ( TRUCK-AT ?auto_10540 ?auto_10539 ) ( not ( = ?auto_10536 ?auto_10537 ) ) ( not ( = ?auto_10536 ?auto_10543 ) ) ( not ( = ?auto_10537 ?auto_10543 ) ) ( not ( = ?auto_10538 ?auto_10542 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_10540 ?auto_10539 ?auto_10541 )
      ( !LIFT ?auto_10542 ?auto_10537 ?auto_10543 ?auto_10541 )
      ( !LOAD ?auto_10542 ?auto_10537 ?auto_10540 ?auto_10541 )
      ( !DRIVE ?auto_10540 ?auto_10541 ?auto_10539 )
      ( !UNLOAD ?auto_10538 ?auto_10537 ?auto_10540 ?auto_10539 )
      ( !DROP ?auto_10538 ?auto_10537 ?auto_10536 ?auto_10539 )
      ( MAKE-1CRATE-VERIFY ?auto_10536 ?auto_10537 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_10553 - SURFACE
      ?auto_10554 - SURFACE
      ?auto_10555 - SURFACE
      ?auto_10556 - SURFACE
      ?auto_10557 - SURFACE
      ?auto_10559 - SURFACE
      ?auto_10558 - SURFACE
      ?auto_10561 - SURFACE
      ?auto_10560 - SURFACE
    )
    :vars
    (
      ?auto_10567 - HOIST
      ?auto_10566 - PLACE
      ?auto_10565 - PLACE
      ?auto_10563 - HOIST
      ?auto_10562 - SURFACE
      ?auto_10568 - PLACE
      ?auto_10577 - HOIST
      ?auto_10576 - SURFACE
      ?auto_10573 - SURFACE
      ?auto_10579 - PLACE
      ?auto_10582 - HOIST
      ?auto_10571 - SURFACE
      ?auto_10572 - PLACE
      ?auto_10574 - HOIST
      ?auto_10570 - SURFACE
      ?auto_10575 - SURFACE
      ?auto_10580 - PLACE
      ?auto_10578 - HOIST
      ?auto_10581 - SURFACE
      ?auto_10569 - SURFACE
      ?auto_10564 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10567 ?auto_10566 ) ( IS-CRATE ?auto_10560 ) ( not ( = ?auto_10565 ?auto_10566 ) ) ( HOIST-AT ?auto_10563 ?auto_10565 ) ( SURFACE-AT ?auto_10560 ?auto_10565 ) ( ON ?auto_10560 ?auto_10562 ) ( CLEAR ?auto_10560 ) ( not ( = ?auto_10561 ?auto_10560 ) ) ( not ( = ?auto_10561 ?auto_10562 ) ) ( not ( = ?auto_10560 ?auto_10562 ) ) ( not ( = ?auto_10567 ?auto_10563 ) ) ( IS-CRATE ?auto_10561 ) ( not ( = ?auto_10568 ?auto_10566 ) ) ( HOIST-AT ?auto_10577 ?auto_10568 ) ( AVAILABLE ?auto_10577 ) ( SURFACE-AT ?auto_10561 ?auto_10568 ) ( ON ?auto_10561 ?auto_10576 ) ( CLEAR ?auto_10561 ) ( not ( = ?auto_10558 ?auto_10561 ) ) ( not ( = ?auto_10558 ?auto_10576 ) ) ( not ( = ?auto_10561 ?auto_10576 ) ) ( not ( = ?auto_10567 ?auto_10577 ) ) ( IS-CRATE ?auto_10558 ) ( SURFACE-AT ?auto_10558 ?auto_10565 ) ( ON ?auto_10558 ?auto_10573 ) ( CLEAR ?auto_10558 ) ( not ( = ?auto_10559 ?auto_10558 ) ) ( not ( = ?auto_10559 ?auto_10573 ) ) ( not ( = ?auto_10558 ?auto_10573 ) ) ( IS-CRATE ?auto_10559 ) ( not ( = ?auto_10579 ?auto_10566 ) ) ( HOIST-AT ?auto_10582 ?auto_10579 ) ( AVAILABLE ?auto_10582 ) ( SURFACE-AT ?auto_10559 ?auto_10579 ) ( ON ?auto_10559 ?auto_10571 ) ( CLEAR ?auto_10559 ) ( not ( = ?auto_10557 ?auto_10559 ) ) ( not ( = ?auto_10557 ?auto_10571 ) ) ( not ( = ?auto_10559 ?auto_10571 ) ) ( not ( = ?auto_10567 ?auto_10582 ) ) ( IS-CRATE ?auto_10557 ) ( not ( = ?auto_10572 ?auto_10566 ) ) ( HOIST-AT ?auto_10574 ?auto_10572 ) ( SURFACE-AT ?auto_10557 ?auto_10572 ) ( ON ?auto_10557 ?auto_10570 ) ( CLEAR ?auto_10557 ) ( not ( = ?auto_10556 ?auto_10557 ) ) ( not ( = ?auto_10556 ?auto_10570 ) ) ( not ( = ?auto_10557 ?auto_10570 ) ) ( not ( = ?auto_10567 ?auto_10574 ) ) ( IS-CRATE ?auto_10556 ) ( AVAILABLE ?auto_10574 ) ( SURFACE-AT ?auto_10556 ?auto_10572 ) ( ON ?auto_10556 ?auto_10575 ) ( CLEAR ?auto_10556 ) ( not ( = ?auto_10555 ?auto_10556 ) ) ( not ( = ?auto_10555 ?auto_10575 ) ) ( not ( = ?auto_10556 ?auto_10575 ) ) ( IS-CRATE ?auto_10555 ) ( not ( = ?auto_10580 ?auto_10566 ) ) ( HOIST-AT ?auto_10578 ?auto_10580 ) ( AVAILABLE ?auto_10578 ) ( SURFACE-AT ?auto_10555 ?auto_10580 ) ( ON ?auto_10555 ?auto_10581 ) ( CLEAR ?auto_10555 ) ( not ( = ?auto_10554 ?auto_10555 ) ) ( not ( = ?auto_10554 ?auto_10581 ) ) ( not ( = ?auto_10555 ?auto_10581 ) ) ( not ( = ?auto_10567 ?auto_10578 ) ) ( SURFACE-AT ?auto_10553 ?auto_10566 ) ( CLEAR ?auto_10553 ) ( IS-CRATE ?auto_10554 ) ( AVAILABLE ?auto_10567 ) ( AVAILABLE ?auto_10563 ) ( SURFACE-AT ?auto_10554 ?auto_10565 ) ( ON ?auto_10554 ?auto_10569 ) ( CLEAR ?auto_10554 ) ( TRUCK-AT ?auto_10564 ?auto_10566 ) ( not ( = ?auto_10553 ?auto_10554 ) ) ( not ( = ?auto_10553 ?auto_10569 ) ) ( not ( = ?auto_10554 ?auto_10569 ) ) ( not ( = ?auto_10553 ?auto_10555 ) ) ( not ( = ?auto_10553 ?auto_10581 ) ) ( not ( = ?auto_10555 ?auto_10569 ) ) ( not ( = ?auto_10580 ?auto_10565 ) ) ( not ( = ?auto_10578 ?auto_10563 ) ) ( not ( = ?auto_10581 ?auto_10569 ) ) ( not ( = ?auto_10553 ?auto_10556 ) ) ( not ( = ?auto_10553 ?auto_10575 ) ) ( not ( = ?auto_10554 ?auto_10556 ) ) ( not ( = ?auto_10554 ?auto_10575 ) ) ( not ( = ?auto_10556 ?auto_10581 ) ) ( not ( = ?auto_10556 ?auto_10569 ) ) ( not ( = ?auto_10572 ?auto_10580 ) ) ( not ( = ?auto_10572 ?auto_10565 ) ) ( not ( = ?auto_10574 ?auto_10578 ) ) ( not ( = ?auto_10574 ?auto_10563 ) ) ( not ( = ?auto_10575 ?auto_10581 ) ) ( not ( = ?auto_10575 ?auto_10569 ) ) ( not ( = ?auto_10553 ?auto_10557 ) ) ( not ( = ?auto_10553 ?auto_10570 ) ) ( not ( = ?auto_10554 ?auto_10557 ) ) ( not ( = ?auto_10554 ?auto_10570 ) ) ( not ( = ?auto_10555 ?auto_10557 ) ) ( not ( = ?auto_10555 ?auto_10570 ) ) ( not ( = ?auto_10557 ?auto_10575 ) ) ( not ( = ?auto_10557 ?auto_10581 ) ) ( not ( = ?auto_10557 ?auto_10569 ) ) ( not ( = ?auto_10570 ?auto_10575 ) ) ( not ( = ?auto_10570 ?auto_10581 ) ) ( not ( = ?auto_10570 ?auto_10569 ) ) ( not ( = ?auto_10553 ?auto_10559 ) ) ( not ( = ?auto_10553 ?auto_10571 ) ) ( not ( = ?auto_10554 ?auto_10559 ) ) ( not ( = ?auto_10554 ?auto_10571 ) ) ( not ( = ?auto_10555 ?auto_10559 ) ) ( not ( = ?auto_10555 ?auto_10571 ) ) ( not ( = ?auto_10556 ?auto_10559 ) ) ( not ( = ?auto_10556 ?auto_10571 ) ) ( not ( = ?auto_10559 ?auto_10570 ) ) ( not ( = ?auto_10559 ?auto_10575 ) ) ( not ( = ?auto_10559 ?auto_10581 ) ) ( not ( = ?auto_10559 ?auto_10569 ) ) ( not ( = ?auto_10579 ?auto_10572 ) ) ( not ( = ?auto_10579 ?auto_10580 ) ) ( not ( = ?auto_10579 ?auto_10565 ) ) ( not ( = ?auto_10582 ?auto_10574 ) ) ( not ( = ?auto_10582 ?auto_10578 ) ) ( not ( = ?auto_10582 ?auto_10563 ) ) ( not ( = ?auto_10571 ?auto_10570 ) ) ( not ( = ?auto_10571 ?auto_10575 ) ) ( not ( = ?auto_10571 ?auto_10581 ) ) ( not ( = ?auto_10571 ?auto_10569 ) ) ( not ( = ?auto_10553 ?auto_10558 ) ) ( not ( = ?auto_10553 ?auto_10573 ) ) ( not ( = ?auto_10554 ?auto_10558 ) ) ( not ( = ?auto_10554 ?auto_10573 ) ) ( not ( = ?auto_10555 ?auto_10558 ) ) ( not ( = ?auto_10555 ?auto_10573 ) ) ( not ( = ?auto_10556 ?auto_10558 ) ) ( not ( = ?auto_10556 ?auto_10573 ) ) ( not ( = ?auto_10557 ?auto_10558 ) ) ( not ( = ?auto_10557 ?auto_10573 ) ) ( not ( = ?auto_10558 ?auto_10571 ) ) ( not ( = ?auto_10558 ?auto_10570 ) ) ( not ( = ?auto_10558 ?auto_10575 ) ) ( not ( = ?auto_10558 ?auto_10581 ) ) ( not ( = ?auto_10558 ?auto_10569 ) ) ( not ( = ?auto_10573 ?auto_10571 ) ) ( not ( = ?auto_10573 ?auto_10570 ) ) ( not ( = ?auto_10573 ?auto_10575 ) ) ( not ( = ?auto_10573 ?auto_10581 ) ) ( not ( = ?auto_10573 ?auto_10569 ) ) ( not ( = ?auto_10553 ?auto_10561 ) ) ( not ( = ?auto_10553 ?auto_10576 ) ) ( not ( = ?auto_10554 ?auto_10561 ) ) ( not ( = ?auto_10554 ?auto_10576 ) ) ( not ( = ?auto_10555 ?auto_10561 ) ) ( not ( = ?auto_10555 ?auto_10576 ) ) ( not ( = ?auto_10556 ?auto_10561 ) ) ( not ( = ?auto_10556 ?auto_10576 ) ) ( not ( = ?auto_10557 ?auto_10561 ) ) ( not ( = ?auto_10557 ?auto_10576 ) ) ( not ( = ?auto_10559 ?auto_10561 ) ) ( not ( = ?auto_10559 ?auto_10576 ) ) ( not ( = ?auto_10561 ?auto_10573 ) ) ( not ( = ?auto_10561 ?auto_10571 ) ) ( not ( = ?auto_10561 ?auto_10570 ) ) ( not ( = ?auto_10561 ?auto_10575 ) ) ( not ( = ?auto_10561 ?auto_10581 ) ) ( not ( = ?auto_10561 ?auto_10569 ) ) ( not ( = ?auto_10568 ?auto_10565 ) ) ( not ( = ?auto_10568 ?auto_10579 ) ) ( not ( = ?auto_10568 ?auto_10572 ) ) ( not ( = ?auto_10568 ?auto_10580 ) ) ( not ( = ?auto_10577 ?auto_10563 ) ) ( not ( = ?auto_10577 ?auto_10582 ) ) ( not ( = ?auto_10577 ?auto_10574 ) ) ( not ( = ?auto_10577 ?auto_10578 ) ) ( not ( = ?auto_10576 ?auto_10573 ) ) ( not ( = ?auto_10576 ?auto_10571 ) ) ( not ( = ?auto_10576 ?auto_10570 ) ) ( not ( = ?auto_10576 ?auto_10575 ) ) ( not ( = ?auto_10576 ?auto_10581 ) ) ( not ( = ?auto_10576 ?auto_10569 ) ) ( not ( = ?auto_10553 ?auto_10560 ) ) ( not ( = ?auto_10553 ?auto_10562 ) ) ( not ( = ?auto_10554 ?auto_10560 ) ) ( not ( = ?auto_10554 ?auto_10562 ) ) ( not ( = ?auto_10555 ?auto_10560 ) ) ( not ( = ?auto_10555 ?auto_10562 ) ) ( not ( = ?auto_10556 ?auto_10560 ) ) ( not ( = ?auto_10556 ?auto_10562 ) ) ( not ( = ?auto_10557 ?auto_10560 ) ) ( not ( = ?auto_10557 ?auto_10562 ) ) ( not ( = ?auto_10559 ?auto_10560 ) ) ( not ( = ?auto_10559 ?auto_10562 ) ) ( not ( = ?auto_10558 ?auto_10560 ) ) ( not ( = ?auto_10558 ?auto_10562 ) ) ( not ( = ?auto_10560 ?auto_10576 ) ) ( not ( = ?auto_10560 ?auto_10573 ) ) ( not ( = ?auto_10560 ?auto_10571 ) ) ( not ( = ?auto_10560 ?auto_10570 ) ) ( not ( = ?auto_10560 ?auto_10575 ) ) ( not ( = ?auto_10560 ?auto_10581 ) ) ( not ( = ?auto_10560 ?auto_10569 ) ) ( not ( = ?auto_10562 ?auto_10576 ) ) ( not ( = ?auto_10562 ?auto_10573 ) ) ( not ( = ?auto_10562 ?auto_10571 ) ) ( not ( = ?auto_10562 ?auto_10570 ) ) ( not ( = ?auto_10562 ?auto_10575 ) ) ( not ( = ?auto_10562 ?auto_10581 ) ) ( not ( = ?auto_10562 ?auto_10569 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_10553 ?auto_10554 ?auto_10555 ?auto_10556 ?auto_10557 ?auto_10559 ?auto_10558 ?auto_10561 )
      ( MAKE-1CRATE ?auto_10561 ?auto_10560 )
      ( MAKE-8CRATE-VERIFY ?auto_10553 ?auto_10554 ?auto_10555 ?auto_10556 ?auto_10557 ?auto_10559 ?auto_10558 ?auto_10561 ?auto_10560 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_10585 - SURFACE
      ?auto_10586 - SURFACE
    )
    :vars
    (
      ?auto_10587 - HOIST
      ?auto_10588 - PLACE
      ?auto_10590 - PLACE
      ?auto_10591 - HOIST
      ?auto_10592 - SURFACE
      ?auto_10589 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10587 ?auto_10588 ) ( SURFACE-AT ?auto_10585 ?auto_10588 ) ( CLEAR ?auto_10585 ) ( IS-CRATE ?auto_10586 ) ( AVAILABLE ?auto_10587 ) ( not ( = ?auto_10590 ?auto_10588 ) ) ( HOIST-AT ?auto_10591 ?auto_10590 ) ( AVAILABLE ?auto_10591 ) ( SURFACE-AT ?auto_10586 ?auto_10590 ) ( ON ?auto_10586 ?auto_10592 ) ( CLEAR ?auto_10586 ) ( TRUCK-AT ?auto_10589 ?auto_10588 ) ( not ( = ?auto_10585 ?auto_10586 ) ) ( not ( = ?auto_10585 ?auto_10592 ) ) ( not ( = ?auto_10586 ?auto_10592 ) ) ( not ( = ?auto_10587 ?auto_10591 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_10589 ?auto_10588 ?auto_10590 )
      ( !LIFT ?auto_10591 ?auto_10586 ?auto_10592 ?auto_10590 )
      ( !LOAD ?auto_10591 ?auto_10586 ?auto_10589 ?auto_10590 )
      ( !DRIVE ?auto_10589 ?auto_10590 ?auto_10588 )
      ( !UNLOAD ?auto_10587 ?auto_10586 ?auto_10589 ?auto_10588 )
      ( !DROP ?auto_10587 ?auto_10586 ?auto_10585 ?auto_10588 )
      ( MAKE-1CRATE-VERIFY ?auto_10585 ?auto_10586 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_10603 - SURFACE
      ?auto_10604 - SURFACE
      ?auto_10605 - SURFACE
      ?auto_10606 - SURFACE
      ?auto_10607 - SURFACE
      ?auto_10610 - SURFACE
      ?auto_10608 - SURFACE
      ?auto_10612 - SURFACE
      ?auto_10611 - SURFACE
      ?auto_10609 - SURFACE
    )
    :vars
    (
      ?auto_10615 - HOIST
      ?auto_10617 - PLACE
      ?auto_10616 - PLACE
      ?auto_10614 - HOIST
      ?auto_10618 - SURFACE
      ?auto_10634 - PLACE
      ?auto_10624 - HOIST
      ?auto_10628 - SURFACE
      ?auto_10629 - PLACE
      ?auto_10631 - HOIST
      ?auto_10633 - SURFACE
      ?auto_10622 - SURFACE
      ?auto_10627 - SURFACE
      ?auto_10623 - PLACE
      ?auto_10621 - HOIST
      ?auto_10626 - SURFACE
      ?auto_10619 - SURFACE
      ?auto_10630 - PLACE
      ?auto_10632 - HOIST
      ?auto_10620 - SURFACE
      ?auto_10625 - SURFACE
      ?auto_10613 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10615 ?auto_10617 ) ( IS-CRATE ?auto_10609 ) ( not ( = ?auto_10616 ?auto_10617 ) ) ( HOIST-AT ?auto_10614 ?auto_10616 ) ( SURFACE-AT ?auto_10609 ?auto_10616 ) ( ON ?auto_10609 ?auto_10618 ) ( CLEAR ?auto_10609 ) ( not ( = ?auto_10611 ?auto_10609 ) ) ( not ( = ?auto_10611 ?auto_10618 ) ) ( not ( = ?auto_10609 ?auto_10618 ) ) ( not ( = ?auto_10615 ?auto_10614 ) ) ( IS-CRATE ?auto_10611 ) ( not ( = ?auto_10634 ?auto_10617 ) ) ( HOIST-AT ?auto_10624 ?auto_10634 ) ( SURFACE-AT ?auto_10611 ?auto_10634 ) ( ON ?auto_10611 ?auto_10628 ) ( CLEAR ?auto_10611 ) ( not ( = ?auto_10612 ?auto_10611 ) ) ( not ( = ?auto_10612 ?auto_10628 ) ) ( not ( = ?auto_10611 ?auto_10628 ) ) ( not ( = ?auto_10615 ?auto_10624 ) ) ( IS-CRATE ?auto_10612 ) ( not ( = ?auto_10629 ?auto_10617 ) ) ( HOIST-AT ?auto_10631 ?auto_10629 ) ( AVAILABLE ?auto_10631 ) ( SURFACE-AT ?auto_10612 ?auto_10629 ) ( ON ?auto_10612 ?auto_10633 ) ( CLEAR ?auto_10612 ) ( not ( = ?auto_10608 ?auto_10612 ) ) ( not ( = ?auto_10608 ?auto_10633 ) ) ( not ( = ?auto_10612 ?auto_10633 ) ) ( not ( = ?auto_10615 ?auto_10631 ) ) ( IS-CRATE ?auto_10608 ) ( SURFACE-AT ?auto_10608 ?auto_10634 ) ( ON ?auto_10608 ?auto_10622 ) ( CLEAR ?auto_10608 ) ( not ( = ?auto_10610 ?auto_10608 ) ) ( not ( = ?auto_10610 ?auto_10622 ) ) ( not ( = ?auto_10608 ?auto_10622 ) ) ( IS-CRATE ?auto_10610 ) ( AVAILABLE ?auto_10614 ) ( SURFACE-AT ?auto_10610 ?auto_10616 ) ( ON ?auto_10610 ?auto_10627 ) ( CLEAR ?auto_10610 ) ( not ( = ?auto_10607 ?auto_10610 ) ) ( not ( = ?auto_10607 ?auto_10627 ) ) ( not ( = ?auto_10610 ?auto_10627 ) ) ( IS-CRATE ?auto_10607 ) ( not ( = ?auto_10623 ?auto_10617 ) ) ( HOIST-AT ?auto_10621 ?auto_10623 ) ( SURFACE-AT ?auto_10607 ?auto_10623 ) ( ON ?auto_10607 ?auto_10626 ) ( CLEAR ?auto_10607 ) ( not ( = ?auto_10606 ?auto_10607 ) ) ( not ( = ?auto_10606 ?auto_10626 ) ) ( not ( = ?auto_10607 ?auto_10626 ) ) ( not ( = ?auto_10615 ?auto_10621 ) ) ( IS-CRATE ?auto_10606 ) ( AVAILABLE ?auto_10621 ) ( SURFACE-AT ?auto_10606 ?auto_10623 ) ( ON ?auto_10606 ?auto_10619 ) ( CLEAR ?auto_10606 ) ( not ( = ?auto_10605 ?auto_10606 ) ) ( not ( = ?auto_10605 ?auto_10619 ) ) ( not ( = ?auto_10606 ?auto_10619 ) ) ( IS-CRATE ?auto_10605 ) ( not ( = ?auto_10630 ?auto_10617 ) ) ( HOIST-AT ?auto_10632 ?auto_10630 ) ( AVAILABLE ?auto_10632 ) ( SURFACE-AT ?auto_10605 ?auto_10630 ) ( ON ?auto_10605 ?auto_10620 ) ( CLEAR ?auto_10605 ) ( not ( = ?auto_10604 ?auto_10605 ) ) ( not ( = ?auto_10604 ?auto_10620 ) ) ( not ( = ?auto_10605 ?auto_10620 ) ) ( not ( = ?auto_10615 ?auto_10632 ) ) ( SURFACE-AT ?auto_10603 ?auto_10617 ) ( CLEAR ?auto_10603 ) ( IS-CRATE ?auto_10604 ) ( AVAILABLE ?auto_10615 ) ( AVAILABLE ?auto_10624 ) ( SURFACE-AT ?auto_10604 ?auto_10634 ) ( ON ?auto_10604 ?auto_10625 ) ( CLEAR ?auto_10604 ) ( TRUCK-AT ?auto_10613 ?auto_10617 ) ( not ( = ?auto_10603 ?auto_10604 ) ) ( not ( = ?auto_10603 ?auto_10625 ) ) ( not ( = ?auto_10604 ?auto_10625 ) ) ( not ( = ?auto_10603 ?auto_10605 ) ) ( not ( = ?auto_10603 ?auto_10620 ) ) ( not ( = ?auto_10605 ?auto_10625 ) ) ( not ( = ?auto_10630 ?auto_10634 ) ) ( not ( = ?auto_10632 ?auto_10624 ) ) ( not ( = ?auto_10620 ?auto_10625 ) ) ( not ( = ?auto_10603 ?auto_10606 ) ) ( not ( = ?auto_10603 ?auto_10619 ) ) ( not ( = ?auto_10604 ?auto_10606 ) ) ( not ( = ?auto_10604 ?auto_10619 ) ) ( not ( = ?auto_10606 ?auto_10620 ) ) ( not ( = ?auto_10606 ?auto_10625 ) ) ( not ( = ?auto_10623 ?auto_10630 ) ) ( not ( = ?auto_10623 ?auto_10634 ) ) ( not ( = ?auto_10621 ?auto_10632 ) ) ( not ( = ?auto_10621 ?auto_10624 ) ) ( not ( = ?auto_10619 ?auto_10620 ) ) ( not ( = ?auto_10619 ?auto_10625 ) ) ( not ( = ?auto_10603 ?auto_10607 ) ) ( not ( = ?auto_10603 ?auto_10626 ) ) ( not ( = ?auto_10604 ?auto_10607 ) ) ( not ( = ?auto_10604 ?auto_10626 ) ) ( not ( = ?auto_10605 ?auto_10607 ) ) ( not ( = ?auto_10605 ?auto_10626 ) ) ( not ( = ?auto_10607 ?auto_10619 ) ) ( not ( = ?auto_10607 ?auto_10620 ) ) ( not ( = ?auto_10607 ?auto_10625 ) ) ( not ( = ?auto_10626 ?auto_10619 ) ) ( not ( = ?auto_10626 ?auto_10620 ) ) ( not ( = ?auto_10626 ?auto_10625 ) ) ( not ( = ?auto_10603 ?auto_10610 ) ) ( not ( = ?auto_10603 ?auto_10627 ) ) ( not ( = ?auto_10604 ?auto_10610 ) ) ( not ( = ?auto_10604 ?auto_10627 ) ) ( not ( = ?auto_10605 ?auto_10610 ) ) ( not ( = ?auto_10605 ?auto_10627 ) ) ( not ( = ?auto_10606 ?auto_10610 ) ) ( not ( = ?auto_10606 ?auto_10627 ) ) ( not ( = ?auto_10610 ?auto_10626 ) ) ( not ( = ?auto_10610 ?auto_10619 ) ) ( not ( = ?auto_10610 ?auto_10620 ) ) ( not ( = ?auto_10610 ?auto_10625 ) ) ( not ( = ?auto_10616 ?auto_10623 ) ) ( not ( = ?auto_10616 ?auto_10630 ) ) ( not ( = ?auto_10616 ?auto_10634 ) ) ( not ( = ?auto_10614 ?auto_10621 ) ) ( not ( = ?auto_10614 ?auto_10632 ) ) ( not ( = ?auto_10614 ?auto_10624 ) ) ( not ( = ?auto_10627 ?auto_10626 ) ) ( not ( = ?auto_10627 ?auto_10619 ) ) ( not ( = ?auto_10627 ?auto_10620 ) ) ( not ( = ?auto_10627 ?auto_10625 ) ) ( not ( = ?auto_10603 ?auto_10608 ) ) ( not ( = ?auto_10603 ?auto_10622 ) ) ( not ( = ?auto_10604 ?auto_10608 ) ) ( not ( = ?auto_10604 ?auto_10622 ) ) ( not ( = ?auto_10605 ?auto_10608 ) ) ( not ( = ?auto_10605 ?auto_10622 ) ) ( not ( = ?auto_10606 ?auto_10608 ) ) ( not ( = ?auto_10606 ?auto_10622 ) ) ( not ( = ?auto_10607 ?auto_10608 ) ) ( not ( = ?auto_10607 ?auto_10622 ) ) ( not ( = ?auto_10608 ?auto_10627 ) ) ( not ( = ?auto_10608 ?auto_10626 ) ) ( not ( = ?auto_10608 ?auto_10619 ) ) ( not ( = ?auto_10608 ?auto_10620 ) ) ( not ( = ?auto_10608 ?auto_10625 ) ) ( not ( = ?auto_10622 ?auto_10627 ) ) ( not ( = ?auto_10622 ?auto_10626 ) ) ( not ( = ?auto_10622 ?auto_10619 ) ) ( not ( = ?auto_10622 ?auto_10620 ) ) ( not ( = ?auto_10622 ?auto_10625 ) ) ( not ( = ?auto_10603 ?auto_10612 ) ) ( not ( = ?auto_10603 ?auto_10633 ) ) ( not ( = ?auto_10604 ?auto_10612 ) ) ( not ( = ?auto_10604 ?auto_10633 ) ) ( not ( = ?auto_10605 ?auto_10612 ) ) ( not ( = ?auto_10605 ?auto_10633 ) ) ( not ( = ?auto_10606 ?auto_10612 ) ) ( not ( = ?auto_10606 ?auto_10633 ) ) ( not ( = ?auto_10607 ?auto_10612 ) ) ( not ( = ?auto_10607 ?auto_10633 ) ) ( not ( = ?auto_10610 ?auto_10612 ) ) ( not ( = ?auto_10610 ?auto_10633 ) ) ( not ( = ?auto_10612 ?auto_10622 ) ) ( not ( = ?auto_10612 ?auto_10627 ) ) ( not ( = ?auto_10612 ?auto_10626 ) ) ( not ( = ?auto_10612 ?auto_10619 ) ) ( not ( = ?auto_10612 ?auto_10620 ) ) ( not ( = ?auto_10612 ?auto_10625 ) ) ( not ( = ?auto_10629 ?auto_10634 ) ) ( not ( = ?auto_10629 ?auto_10616 ) ) ( not ( = ?auto_10629 ?auto_10623 ) ) ( not ( = ?auto_10629 ?auto_10630 ) ) ( not ( = ?auto_10631 ?auto_10624 ) ) ( not ( = ?auto_10631 ?auto_10614 ) ) ( not ( = ?auto_10631 ?auto_10621 ) ) ( not ( = ?auto_10631 ?auto_10632 ) ) ( not ( = ?auto_10633 ?auto_10622 ) ) ( not ( = ?auto_10633 ?auto_10627 ) ) ( not ( = ?auto_10633 ?auto_10626 ) ) ( not ( = ?auto_10633 ?auto_10619 ) ) ( not ( = ?auto_10633 ?auto_10620 ) ) ( not ( = ?auto_10633 ?auto_10625 ) ) ( not ( = ?auto_10603 ?auto_10611 ) ) ( not ( = ?auto_10603 ?auto_10628 ) ) ( not ( = ?auto_10604 ?auto_10611 ) ) ( not ( = ?auto_10604 ?auto_10628 ) ) ( not ( = ?auto_10605 ?auto_10611 ) ) ( not ( = ?auto_10605 ?auto_10628 ) ) ( not ( = ?auto_10606 ?auto_10611 ) ) ( not ( = ?auto_10606 ?auto_10628 ) ) ( not ( = ?auto_10607 ?auto_10611 ) ) ( not ( = ?auto_10607 ?auto_10628 ) ) ( not ( = ?auto_10610 ?auto_10611 ) ) ( not ( = ?auto_10610 ?auto_10628 ) ) ( not ( = ?auto_10608 ?auto_10611 ) ) ( not ( = ?auto_10608 ?auto_10628 ) ) ( not ( = ?auto_10611 ?auto_10633 ) ) ( not ( = ?auto_10611 ?auto_10622 ) ) ( not ( = ?auto_10611 ?auto_10627 ) ) ( not ( = ?auto_10611 ?auto_10626 ) ) ( not ( = ?auto_10611 ?auto_10619 ) ) ( not ( = ?auto_10611 ?auto_10620 ) ) ( not ( = ?auto_10611 ?auto_10625 ) ) ( not ( = ?auto_10628 ?auto_10633 ) ) ( not ( = ?auto_10628 ?auto_10622 ) ) ( not ( = ?auto_10628 ?auto_10627 ) ) ( not ( = ?auto_10628 ?auto_10626 ) ) ( not ( = ?auto_10628 ?auto_10619 ) ) ( not ( = ?auto_10628 ?auto_10620 ) ) ( not ( = ?auto_10628 ?auto_10625 ) ) ( not ( = ?auto_10603 ?auto_10609 ) ) ( not ( = ?auto_10603 ?auto_10618 ) ) ( not ( = ?auto_10604 ?auto_10609 ) ) ( not ( = ?auto_10604 ?auto_10618 ) ) ( not ( = ?auto_10605 ?auto_10609 ) ) ( not ( = ?auto_10605 ?auto_10618 ) ) ( not ( = ?auto_10606 ?auto_10609 ) ) ( not ( = ?auto_10606 ?auto_10618 ) ) ( not ( = ?auto_10607 ?auto_10609 ) ) ( not ( = ?auto_10607 ?auto_10618 ) ) ( not ( = ?auto_10610 ?auto_10609 ) ) ( not ( = ?auto_10610 ?auto_10618 ) ) ( not ( = ?auto_10608 ?auto_10609 ) ) ( not ( = ?auto_10608 ?auto_10618 ) ) ( not ( = ?auto_10612 ?auto_10609 ) ) ( not ( = ?auto_10612 ?auto_10618 ) ) ( not ( = ?auto_10609 ?auto_10628 ) ) ( not ( = ?auto_10609 ?auto_10633 ) ) ( not ( = ?auto_10609 ?auto_10622 ) ) ( not ( = ?auto_10609 ?auto_10627 ) ) ( not ( = ?auto_10609 ?auto_10626 ) ) ( not ( = ?auto_10609 ?auto_10619 ) ) ( not ( = ?auto_10609 ?auto_10620 ) ) ( not ( = ?auto_10609 ?auto_10625 ) ) ( not ( = ?auto_10618 ?auto_10628 ) ) ( not ( = ?auto_10618 ?auto_10633 ) ) ( not ( = ?auto_10618 ?auto_10622 ) ) ( not ( = ?auto_10618 ?auto_10627 ) ) ( not ( = ?auto_10618 ?auto_10626 ) ) ( not ( = ?auto_10618 ?auto_10619 ) ) ( not ( = ?auto_10618 ?auto_10620 ) ) ( not ( = ?auto_10618 ?auto_10625 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_10603 ?auto_10604 ?auto_10605 ?auto_10606 ?auto_10607 ?auto_10610 ?auto_10608 ?auto_10612 ?auto_10611 )
      ( MAKE-1CRATE ?auto_10611 ?auto_10609 )
      ( MAKE-9CRATE-VERIFY ?auto_10603 ?auto_10604 ?auto_10605 ?auto_10606 ?auto_10607 ?auto_10610 ?auto_10608 ?auto_10612 ?auto_10611 ?auto_10609 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_10637 - SURFACE
      ?auto_10638 - SURFACE
    )
    :vars
    (
      ?auto_10639 - HOIST
      ?auto_10640 - PLACE
      ?auto_10642 - PLACE
      ?auto_10643 - HOIST
      ?auto_10644 - SURFACE
      ?auto_10641 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10639 ?auto_10640 ) ( SURFACE-AT ?auto_10637 ?auto_10640 ) ( CLEAR ?auto_10637 ) ( IS-CRATE ?auto_10638 ) ( AVAILABLE ?auto_10639 ) ( not ( = ?auto_10642 ?auto_10640 ) ) ( HOIST-AT ?auto_10643 ?auto_10642 ) ( AVAILABLE ?auto_10643 ) ( SURFACE-AT ?auto_10638 ?auto_10642 ) ( ON ?auto_10638 ?auto_10644 ) ( CLEAR ?auto_10638 ) ( TRUCK-AT ?auto_10641 ?auto_10640 ) ( not ( = ?auto_10637 ?auto_10638 ) ) ( not ( = ?auto_10637 ?auto_10644 ) ) ( not ( = ?auto_10638 ?auto_10644 ) ) ( not ( = ?auto_10639 ?auto_10643 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_10641 ?auto_10640 ?auto_10642 )
      ( !LIFT ?auto_10643 ?auto_10638 ?auto_10644 ?auto_10642 )
      ( !LOAD ?auto_10643 ?auto_10638 ?auto_10641 ?auto_10642 )
      ( !DRIVE ?auto_10641 ?auto_10642 ?auto_10640 )
      ( !UNLOAD ?auto_10639 ?auto_10638 ?auto_10641 ?auto_10640 )
      ( !DROP ?auto_10639 ?auto_10638 ?auto_10637 ?auto_10640 )
      ( MAKE-1CRATE-VERIFY ?auto_10637 ?auto_10638 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_10656 - SURFACE
      ?auto_10657 - SURFACE
      ?auto_10658 - SURFACE
      ?auto_10659 - SURFACE
      ?auto_10660 - SURFACE
      ?auto_10663 - SURFACE
      ?auto_10661 - SURFACE
      ?auto_10665 - SURFACE
      ?auto_10664 - SURFACE
      ?auto_10662 - SURFACE
      ?auto_10666 - SURFACE
    )
    :vars
    (
      ?auto_10669 - HOIST
      ?auto_10672 - PLACE
      ?auto_10670 - PLACE
      ?auto_10667 - HOIST
      ?auto_10668 - SURFACE
      ?auto_10673 - PLACE
      ?auto_10689 - HOIST
      ?auto_10676 - SURFACE
      ?auto_10683 - PLACE
      ?auto_10686 - HOIST
      ?auto_10682 - SURFACE
      ?auto_10677 - PLACE
      ?auto_10681 - HOIST
      ?auto_10688 - SURFACE
      ?auto_10679 - SURFACE
      ?auto_10680 - SURFACE
      ?auto_10687 - PLACE
      ?auto_10678 - HOIST
      ?auto_10684 - SURFACE
      ?auto_10674 - SURFACE
      ?auto_10675 - SURFACE
      ?auto_10685 - SURFACE
      ?auto_10671 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10669 ?auto_10672 ) ( IS-CRATE ?auto_10666 ) ( not ( = ?auto_10670 ?auto_10672 ) ) ( HOIST-AT ?auto_10667 ?auto_10670 ) ( SURFACE-AT ?auto_10666 ?auto_10670 ) ( ON ?auto_10666 ?auto_10668 ) ( CLEAR ?auto_10666 ) ( not ( = ?auto_10662 ?auto_10666 ) ) ( not ( = ?auto_10662 ?auto_10668 ) ) ( not ( = ?auto_10666 ?auto_10668 ) ) ( not ( = ?auto_10669 ?auto_10667 ) ) ( IS-CRATE ?auto_10662 ) ( not ( = ?auto_10673 ?auto_10672 ) ) ( HOIST-AT ?auto_10689 ?auto_10673 ) ( SURFACE-AT ?auto_10662 ?auto_10673 ) ( ON ?auto_10662 ?auto_10676 ) ( CLEAR ?auto_10662 ) ( not ( = ?auto_10664 ?auto_10662 ) ) ( not ( = ?auto_10664 ?auto_10676 ) ) ( not ( = ?auto_10662 ?auto_10676 ) ) ( not ( = ?auto_10669 ?auto_10689 ) ) ( IS-CRATE ?auto_10664 ) ( not ( = ?auto_10683 ?auto_10672 ) ) ( HOIST-AT ?auto_10686 ?auto_10683 ) ( SURFACE-AT ?auto_10664 ?auto_10683 ) ( ON ?auto_10664 ?auto_10682 ) ( CLEAR ?auto_10664 ) ( not ( = ?auto_10665 ?auto_10664 ) ) ( not ( = ?auto_10665 ?auto_10682 ) ) ( not ( = ?auto_10664 ?auto_10682 ) ) ( not ( = ?auto_10669 ?auto_10686 ) ) ( IS-CRATE ?auto_10665 ) ( not ( = ?auto_10677 ?auto_10672 ) ) ( HOIST-AT ?auto_10681 ?auto_10677 ) ( AVAILABLE ?auto_10681 ) ( SURFACE-AT ?auto_10665 ?auto_10677 ) ( ON ?auto_10665 ?auto_10688 ) ( CLEAR ?auto_10665 ) ( not ( = ?auto_10661 ?auto_10665 ) ) ( not ( = ?auto_10661 ?auto_10688 ) ) ( not ( = ?auto_10665 ?auto_10688 ) ) ( not ( = ?auto_10669 ?auto_10681 ) ) ( IS-CRATE ?auto_10661 ) ( SURFACE-AT ?auto_10661 ?auto_10683 ) ( ON ?auto_10661 ?auto_10679 ) ( CLEAR ?auto_10661 ) ( not ( = ?auto_10663 ?auto_10661 ) ) ( not ( = ?auto_10663 ?auto_10679 ) ) ( not ( = ?auto_10661 ?auto_10679 ) ) ( IS-CRATE ?auto_10663 ) ( AVAILABLE ?auto_10689 ) ( SURFACE-AT ?auto_10663 ?auto_10673 ) ( ON ?auto_10663 ?auto_10680 ) ( CLEAR ?auto_10663 ) ( not ( = ?auto_10660 ?auto_10663 ) ) ( not ( = ?auto_10660 ?auto_10680 ) ) ( not ( = ?auto_10663 ?auto_10680 ) ) ( IS-CRATE ?auto_10660 ) ( not ( = ?auto_10687 ?auto_10672 ) ) ( HOIST-AT ?auto_10678 ?auto_10687 ) ( SURFACE-AT ?auto_10660 ?auto_10687 ) ( ON ?auto_10660 ?auto_10684 ) ( CLEAR ?auto_10660 ) ( not ( = ?auto_10659 ?auto_10660 ) ) ( not ( = ?auto_10659 ?auto_10684 ) ) ( not ( = ?auto_10660 ?auto_10684 ) ) ( not ( = ?auto_10669 ?auto_10678 ) ) ( IS-CRATE ?auto_10659 ) ( AVAILABLE ?auto_10678 ) ( SURFACE-AT ?auto_10659 ?auto_10687 ) ( ON ?auto_10659 ?auto_10674 ) ( CLEAR ?auto_10659 ) ( not ( = ?auto_10658 ?auto_10659 ) ) ( not ( = ?auto_10658 ?auto_10674 ) ) ( not ( = ?auto_10659 ?auto_10674 ) ) ( IS-CRATE ?auto_10658 ) ( AVAILABLE ?auto_10667 ) ( SURFACE-AT ?auto_10658 ?auto_10670 ) ( ON ?auto_10658 ?auto_10675 ) ( CLEAR ?auto_10658 ) ( not ( = ?auto_10657 ?auto_10658 ) ) ( not ( = ?auto_10657 ?auto_10675 ) ) ( not ( = ?auto_10658 ?auto_10675 ) ) ( SURFACE-AT ?auto_10656 ?auto_10672 ) ( CLEAR ?auto_10656 ) ( IS-CRATE ?auto_10657 ) ( AVAILABLE ?auto_10669 ) ( AVAILABLE ?auto_10686 ) ( SURFACE-AT ?auto_10657 ?auto_10683 ) ( ON ?auto_10657 ?auto_10685 ) ( CLEAR ?auto_10657 ) ( TRUCK-AT ?auto_10671 ?auto_10672 ) ( not ( = ?auto_10656 ?auto_10657 ) ) ( not ( = ?auto_10656 ?auto_10685 ) ) ( not ( = ?auto_10657 ?auto_10685 ) ) ( not ( = ?auto_10656 ?auto_10658 ) ) ( not ( = ?auto_10656 ?auto_10675 ) ) ( not ( = ?auto_10658 ?auto_10685 ) ) ( not ( = ?auto_10670 ?auto_10683 ) ) ( not ( = ?auto_10667 ?auto_10686 ) ) ( not ( = ?auto_10675 ?auto_10685 ) ) ( not ( = ?auto_10656 ?auto_10659 ) ) ( not ( = ?auto_10656 ?auto_10674 ) ) ( not ( = ?auto_10657 ?auto_10659 ) ) ( not ( = ?auto_10657 ?auto_10674 ) ) ( not ( = ?auto_10659 ?auto_10675 ) ) ( not ( = ?auto_10659 ?auto_10685 ) ) ( not ( = ?auto_10687 ?auto_10670 ) ) ( not ( = ?auto_10687 ?auto_10683 ) ) ( not ( = ?auto_10678 ?auto_10667 ) ) ( not ( = ?auto_10678 ?auto_10686 ) ) ( not ( = ?auto_10674 ?auto_10675 ) ) ( not ( = ?auto_10674 ?auto_10685 ) ) ( not ( = ?auto_10656 ?auto_10660 ) ) ( not ( = ?auto_10656 ?auto_10684 ) ) ( not ( = ?auto_10657 ?auto_10660 ) ) ( not ( = ?auto_10657 ?auto_10684 ) ) ( not ( = ?auto_10658 ?auto_10660 ) ) ( not ( = ?auto_10658 ?auto_10684 ) ) ( not ( = ?auto_10660 ?auto_10674 ) ) ( not ( = ?auto_10660 ?auto_10675 ) ) ( not ( = ?auto_10660 ?auto_10685 ) ) ( not ( = ?auto_10684 ?auto_10674 ) ) ( not ( = ?auto_10684 ?auto_10675 ) ) ( not ( = ?auto_10684 ?auto_10685 ) ) ( not ( = ?auto_10656 ?auto_10663 ) ) ( not ( = ?auto_10656 ?auto_10680 ) ) ( not ( = ?auto_10657 ?auto_10663 ) ) ( not ( = ?auto_10657 ?auto_10680 ) ) ( not ( = ?auto_10658 ?auto_10663 ) ) ( not ( = ?auto_10658 ?auto_10680 ) ) ( not ( = ?auto_10659 ?auto_10663 ) ) ( not ( = ?auto_10659 ?auto_10680 ) ) ( not ( = ?auto_10663 ?auto_10684 ) ) ( not ( = ?auto_10663 ?auto_10674 ) ) ( not ( = ?auto_10663 ?auto_10675 ) ) ( not ( = ?auto_10663 ?auto_10685 ) ) ( not ( = ?auto_10673 ?auto_10687 ) ) ( not ( = ?auto_10673 ?auto_10670 ) ) ( not ( = ?auto_10673 ?auto_10683 ) ) ( not ( = ?auto_10689 ?auto_10678 ) ) ( not ( = ?auto_10689 ?auto_10667 ) ) ( not ( = ?auto_10689 ?auto_10686 ) ) ( not ( = ?auto_10680 ?auto_10684 ) ) ( not ( = ?auto_10680 ?auto_10674 ) ) ( not ( = ?auto_10680 ?auto_10675 ) ) ( not ( = ?auto_10680 ?auto_10685 ) ) ( not ( = ?auto_10656 ?auto_10661 ) ) ( not ( = ?auto_10656 ?auto_10679 ) ) ( not ( = ?auto_10657 ?auto_10661 ) ) ( not ( = ?auto_10657 ?auto_10679 ) ) ( not ( = ?auto_10658 ?auto_10661 ) ) ( not ( = ?auto_10658 ?auto_10679 ) ) ( not ( = ?auto_10659 ?auto_10661 ) ) ( not ( = ?auto_10659 ?auto_10679 ) ) ( not ( = ?auto_10660 ?auto_10661 ) ) ( not ( = ?auto_10660 ?auto_10679 ) ) ( not ( = ?auto_10661 ?auto_10680 ) ) ( not ( = ?auto_10661 ?auto_10684 ) ) ( not ( = ?auto_10661 ?auto_10674 ) ) ( not ( = ?auto_10661 ?auto_10675 ) ) ( not ( = ?auto_10661 ?auto_10685 ) ) ( not ( = ?auto_10679 ?auto_10680 ) ) ( not ( = ?auto_10679 ?auto_10684 ) ) ( not ( = ?auto_10679 ?auto_10674 ) ) ( not ( = ?auto_10679 ?auto_10675 ) ) ( not ( = ?auto_10679 ?auto_10685 ) ) ( not ( = ?auto_10656 ?auto_10665 ) ) ( not ( = ?auto_10656 ?auto_10688 ) ) ( not ( = ?auto_10657 ?auto_10665 ) ) ( not ( = ?auto_10657 ?auto_10688 ) ) ( not ( = ?auto_10658 ?auto_10665 ) ) ( not ( = ?auto_10658 ?auto_10688 ) ) ( not ( = ?auto_10659 ?auto_10665 ) ) ( not ( = ?auto_10659 ?auto_10688 ) ) ( not ( = ?auto_10660 ?auto_10665 ) ) ( not ( = ?auto_10660 ?auto_10688 ) ) ( not ( = ?auto_10663 ?auto_10665 ) ) ( not ( = ?auto_10663 ?auto_10688 ) ) ( not ( = ?auto_10665 ?auto_10679 ) ) ( not ( = ?auto_10665 ?auto_10680 ) ) ( not ( = ?auto_10665 ?auto_10684 ) ) ( not ( = ?auto_10665 ?auto_10674 ) ) ( not ( = ?auto_10665 ?auto_10675 ) ) ( not ( = ?auto_10665 ?auto_10685 ) ) ( not ( = ?auto_10677 ?auto_10683 ) ) ( not ( = ?auto_10677 ?auto_10673 ) ) ( not ( = ?auto_10677 ?auto_10687 ) ) ( not ( = ?auto_10677 ?auto_10670 ) ) ( not ( = ?auto_10681 ?auto_10686 ) ) ( not ( = ?auto_10681 ?auto_10689 ) ) ( not ( = ?auto_10681 ?auto_10678 ) ) ( not ( = ?auto_10681 ?auto_10667 ) ) ( not ( = ?auto_10688 ?auto_10679 ) ) ( not ( = ?auto_10688 ?auto_10680 ) ) ( not ( = ?auto_10688 ?auto_10684 ) ) ( not ( = ?auto_10688 ?auto_10674 ) ) ( not ( = ?auto_10688 ?auto_10675 ) ) ( not ( = ?auto_10688 ?auto_10685 ) ) ( not ( = ?auto_10656 ?auto_10664 ) ) ( not ( = ?auto_10656 ?auto_10682 ) ) ( not ( = ?auto_10657 ?auto_10664 ) ) ( not ( = ?auto_10657 ?auto_10682 ) ) ( not ( = ?auto_10658 ?auto_10664 ) ) ( not ( = ?auto_10658 ?auto_10682 ) ) ( not ( = ?auto_10659 ?auto_10664 ) ) ( not ( = ?auto_10659 ?auto_10682 ) ) ( not ( = ?auto_10660 ?auto_10664 ) ) ( not ( = ?auto_10660 ?auto_10682 ) ) ( not ( = ?auto_10663 ?auto_10664 ) ) ( not ( = ?auto_10663 ?auto_10682 ) ) ( not ( = ?auto_10661 ?auto_10664 ) ) ( not ( = ?auto_10661 ?auto_10682 ) ) ( not ( = ?auto_10664 ?auto_10688 ) ) ( not ( = ?auto_10664 ?auto_10679 ) ) ( not ( = ?auto_10664 ?auto_10680 ) ) ( not ( = ?auto_10664 ?auto_10684 ) ) ( not ( = ?auto_10664 ?auto_10674 ) ) ( not ( = ?auto_10664 ?auto_10675 ) ) ( not ( = ?auto_10664 ?auto_10685 ) ) ( not ( = ?auto_10682 ?auto_10688 ) ) ( not ( = ?auto_10682 ?auto_10679 ) ) ( not ( = ?auto_10682 ?auto_10680 ) ) ( not ( = ?auto_10682 ?auto_10684 ) ) ( not ( = ?auto_10682 ?auto_10674 ) ) ( not ( = ?auto_10682 ?auto_10675 ) ) ( not ( = ?auto_10682 ?auto_10685 ) ) ( not ( = ?auto_10656 ?auto_10662 ) ) ( not ( = ?auto_10656 ?auto_10676 ) ) ( not ( = ?auto_10657 ?auto_10662 ) ) ( not ( = ?auto_10657 ?auto_10676 ) ) ( not ( = ?auto_10658 ?auto_10662 ) ) ( not ( = ?auto_10658 ?auto_10676 ) ) ( not ( = ?auto_10659 ?auto_10662 ) ) ( not ( = ?auto_10659 ?auto_10676 ) ) ( not ( = ?auto_10660 ?auto_10662 ) ) ( not ( = ?auto_10660 ?auto_10676 ) ) ( not ( = ?auto_10663 ?auto_10662 ) ) ( not ( = ?auto_10663 ?auto_10676 ) ) ( not ( = ?auto_10661 ?auto_10662 ) ) ( not ( = ?auto_10661 ?auto_10676 ) ) ( not ( = ?auto_10665 ?auto_10662 ) ) ( not ( = ?auto_10665 ?auto_10676 ) ) ( not ( = ?auto_10662 ?auto_10682 ) ) ( not ( = ?auto_10662 ?auto_10688 ) ) ( not ( = ?auto_10662 ?auto_10679 ) ) ( not ( = ?auto_10662 ?auto_10680 ) ) ( not ( = ?auto_10662 ?auto_10684 ) ) ( not ( = ?auto_10662 ?auto_10674 ) ) ( not ( = ?auto_10662 ?auto_10675 ) ) ( not ( = ?auto_10662 ?auto_10685 ) ) ( not ( = ?auto_10676 ?auto_10682 ) ) ( not ( = ?auto_10676 ?auto_10688 ) ) ( not ( = ?auto_10676 ?auto_10679 ) ) ( not ( = ?auto_10676 ?auto_10680 ) ) ( not ( = ?auto_10676 ?auto_10684 ) ) ( not ( = ?auto_10676 ?auto_10674 ) ) ( not ( = ?auto_10676 ?auto_10675 ) ) ( not ( = ?auto_10676 ?auto_10685 ) ) ( not ( = ?auto_10656 ?auto_10666 ) ) ( not ( = ?auto_10656 ?auto_10668 ) ) ( not ( = ?auto_10657 ?auto_10666 ) ) ( not ( = ?auto_10657 ?auto_10668 ) ) ( not ( = ?auto_10658 ?auto_10666 ) ) ( not ( = ?auto_10658 ?auto_10668 ) ) ( not ( = ?auto_10659 ?auto_10666 ) ) ( not ( = ?auto_10659 ?auto_10668 ) ) ( not ( = ?auto_10660 ?auto_10666 ) ) ( not ( = ?auto_10660 ?auto_10668 ) ) ( not ( = ?auto_10663 ?auto_10666 ) ) ( not ( = ?auto_10663 ?auto_10668 ) ) ( not ( = ?auto_10661 ?auto_10666 ) ) ( not ( = ?auto_10661 ?auto_10668 ) ) ( not ( = ?auto_10665 ?auto_10666 ) ) ( not ( = ?auto_10665 ?auto_10668 ) ) ( not ( = ?auto_10664 ?auto_10666 ) ) ( not ( = ?auto_10664 ?auto_10668 ) ) ( not ( = ?auto_10666 ?auto_10676 ) ) ( not ( = ?auto_10666 ?auto_10682 ) ) ( not ( = ?auto_10666 ?auto_10688 ) ) ( not ( = ?auto_10666 ?auto_10679 ) ) ( not ( = ?auto_10666 ?auto_10680 ) ) ( not ( = ?auto_10666 ?auto_10684 ) ) ( not ( = ?auto_10666 ?auto_10674 ) ) ( not ( = ?auto_10666 ?auto_10675 ) ) ( not ( = ?auto_10666 ?auto_10685 ) ) ( not ( = ?auto_10668 ?auto_10676 ) ) ( not ( = ?auto_10668 ?auto_10682 ) ) ( not ( = ?auto_10668 ?auto_10688 ) ) ( not ( = ?auto_10668 ?auto_10679 ) ) ( not ( = ?auto_10668 ?auto_10680 ) ) ( not ( = ?auto_10668 ?auto_10684 ) ) ( not ( = ?auto_10668 ?auto_10674 ) ) ( not ( = ?auto_10668 ?auto_10675 ) ) ( not ( = ?auto_10668 ?auto_10685 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_10656 ?auto_10657 ?auto_10658 ?auto_10659 ?auto_10660 ?auto_10663 ?auto_10661 ?auto_10665 ?auto_10664 ?auto_10662 )
      ( MAKE-1CRATE ?auto_10662 ?auto_10666 )
      ( MAKE-10CRATE-VERIFY ?auto_10656 ?auto_10657 ?auto_10658 ?auto_10659 ?auto_10660 ?auto_10663 ?auto_10661 ?auto_10665 ?auto_10664 ?auto_10662 ?auto_10666 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_10692 - SURFACE
      ?auto_10693 - SURFACE
    )
    :vars
    (
      ?auto_10694 - HOIST
      ?auto_10695 - PLACE
      ?auto_10697 - PLACE
      ?auto_10698 - HOIST
      ?auto_10699 - SURFACE
      ?auto_10696 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10694 ?auto_10695 ) ( SURFACE-AT ?auto_10692 ?auto_10695 ) ( CLEAR ?auto_10692 ) ( IS-CRATE ?auto_10693 ) ( AVAILABLE ?auto_10694 ) ( not ( = ?auto_10697 ?auto_10695 ) ) ( HOIST-AT ?auto_10698 ?auto_10697 ) ( AVAILABLE ?auto_10698 ) ( SURFACE-AT ?auto_10693 ?auto_10697 ) ( ON ?auto_10693 ?auto_10699 ) ( CLEAR ?auto_10693 ) ( TRUCK-AT ?auto_10696 ?auto_10695 ) ( not ( = ?auto_10692 ?auto_10693 ) ) ( not ( = ?auto_10692 ?auto_10699 ) ) ( not ( = ?auto_10693 ?auto_10699 ) ) ( not ( = ?auto_10694 ?auto_10698 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_10696 ?auto_10695 ?auto_10697 )
      ( !LIFT ?auto_10698 ?auto_10693 ?auto_10699 ?auto_10697 )
      ( !LOAD ?auto_10698 ?auto_10693 ?auto_10696 ?auto_10697 )
      ( !DRIVE ?auto_10696 ?auto_10697 ?auto_10695 )
      ( !UNLOAD ?auto_10694 ?auto_10693 ?auto_10696 ?auto_10695 )
      ( !DROP ?auto_10694 ?auto_10693 ?auto_10692 ?auto_10695 )
      ( MAKE-1CRATE-VERIFY ?auto_10692 ?auto_10693 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_10712 - SURFACE
      ?auto_10713 - SURFACE
      ?auto_10714 - SURFACE
      ?auto_10715 - SURFACE
      ?auto_10716 - SURFACE
      ?auto_10719 - SURFACE
      ?auto_10717 - SURFACE
      ?auto_10721 - SURFACE
      ?auto_10720 - SURFACE
      ?auto_10718 - SURFACE
      ?auto_10723 - SURFACE
      ?auto_10722 - SURFACE
    )
    :vars
    (
      ?auto_10725 - HOIST
      ?auto_10726 - PLACE
      ?auto_10727 - PLACE
      ?auto_10729 - HOIST
      ?auto_10728 - SURFACE
      ?auto_10742 - PLACE
      ?auto_10731 - HOIST
      ?auto_10730 - SURFACE
      ?auto_10745 - SURFACE
      ?auto_10740 - PLACE
      ?auto_10737 - HOIST
      ?auto_10741 - SURFACE
      ?auto_10733 - PLACE
      ?auto_10743 - HOIST
      ?auto_10738 - SURFACE
      ?auto_10736 - SURFACE
      ?auto_10734 - SURFACE
      ?auto_10732 - PLACE
      ?auto_10744 - HOIST
      ?auto_10746 - SURFACE
      ?auto_10735 - SURFACE
      ?auto_10747 - SURFACE
      ?auto_10739 - SURFACE
      ?auto_10724 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10725 ?auto_10726 ) ( IS-CRATE ?auto_10722 ) ( not ( = ?auto_10727 ?auto_10726 ) ) ( HOIST-AT ?auto_10729 ?auto_10727 ) ( SURFACE-AT ?auto_10722 ?auto_10727 ) ( ON ?auto_10722 ?auto_10728 ) ( CLEAR ?auto_10722 ) ( not ( = ?auto_10723 ?auto_10722 ) ) ( not ( = ?auto_10723 ?auto_10728 ) ) ( not ( = ?auto_10722 ?auto_10728 ) ) ( not ( = ?auto_10725 ?auto_10729 ) ) ( IS-CRATE ?auto_10723 ) ( not ( = ?auto_10742 ?auto_10726 ) ) ( HOIST-AT ?auto_10731 ?auto_10742 ) ( SURFACE-AT ?auto_10723 ?auto_10742 ) ( ON ?auto_10723 ?auto_10730 ) ( CLEAR ?auto_10723 ) ( not ( = ?auto_10718 ?auto_10723 ) ) ( not ( = ?auto_10718 ?auto_10730 ) ) ( not ( = ?auto_10723 ?auto_10730 ) ) ( not ( = ?auto_10725 ?auto_10731 ) ) ( IS-CRATE ?auto_10718 ) ( SURFACE-AT ?auto_10718 ?auto_10727 ) ( ON ?auto_10718 ?auto_10745 ) ( CLEAR ?auto_10718 ) ( not ( = ?auto_10720 ?auto_10718 ) ) ( not ( = ?auto_10720 ?auto_10745 ) ) ( not ( = ?auto_10718 ?auto_10745 ) ) ( IS-CRATE ?auto_10720 ) ( not ( = ?auto_10740 ?auto_10726 ) ) ( HOIST-AT ?auto_10737 ?auto_10740 ) ( SURFACE-AT ?auto_10720 ?auto_10740 ) ( ON ?auto_10720 ?auto_10741 ) ( CLEAR ?auto_10720 ) ( not ( = ?auto_10721 ?auto_10720 ) ) ( not ( = ?auto_10721 ?auto_10741 ) ) ( not ( = ?auto_10720 ?auto_10741 ) ) ( not ( = ?auto_10725 ?auto_10737 ) ) ( IS-CRATE ?auto_10721 ) ( not ( = ?auto_10733 ?auto_10726 ) ) ( HOIST-AT ?auto_10743 ?auto_10733 ) ( AVAILABLE ?auto_10743 ) ( SURFACE-AT ?auto_10721 ?auto_10733 ) ( ON ?auto_10721 ?auto_10738 ) ( CLEAR ?auto_10721 ) ( not ( = ?auto_10717 ?auto_10721 ) ) ( not ( = ?auto_10717 ?auto_10738 ) ) ( not ( = ?auto_10721 ?auto_10738 ) ) ( not ( = ?auto_10725 ?auto_10743 ) ) ( IS-CRATE ?auto_10717 ) ( SURFACE-AT ?auto_10717 ?auto_10740 ) ( ON ?auto_10717 ?auto_10736 ) ( CLEAR ?auto_10717 ) ( not ( = ?auto_10719 ?auto_10717 ) ) ( not ( = ?auto_10719 ?auto_10736 ) ) ( not ( = ?auto_10717 ?auto_10736 ) ) ( IS-CRATE ?auto_10719 ) ( AVAILABLE ?auto_10729 ) ( SURFACE-AT ?auto_10719 ?auto_10727 ) ( ON ?auto_10719 ?auto_10734 ) ( CLEAR ?auto_10719 ) ( not ( = ?auto_10716 ?auto_10719 ) ) ( not ( = ?auto_10716 ?auto_10734 ) ) ( not ( = ?auto_10719 ?auto_10734 ) ) ( IS-CRATE ?auto_10716 ) ( not ( = ?auto_10732 ?auto_10726 ) ) ( HOIST-AT ?auto_10744 ?auto_10732 ) ( SURFACE-AT ?auto_10716 ?auto_10732 ) ( ON ?auto_10716 ?auto_10746 ) ( CLEAR ?auto_10716 ) ( not ( = ?auto_10715 ?auto_10716 ) ) ( not ( = ?auto_10715 ?auto_10746 ) ) ( not ( = ?auto_10716 ?auto_10746 ) ) ( not ( = ?auto_10725 ?auto_10744 ) ) ( IS-CRATE ?auto_10715 ) ( AVAILABLE ?auto_10744 ) ( SURFACE-AT ?auto_10715 ?auto_10732 ) ( ON ?auto_10715 ?auto_10735 ) ( CLEAR ?auto_10715 ) ( not ( = ?auto_10714 ?auto_10715 ) ) ( not ( = ?auto_10714 ?auto_10735 ) ) ( not ( = ?auto_10715 ?auto_10735 ) ) ( IS-CRATE ?auto_10714 ) ( AVAILABLE ?auto_10731 ) ( SURFACE-AT ?auto_10714 ?auto_10742 ) ( ON ?auto_10714 ?auto_10747 ) ( CLEAR ?auto_10714 ) ( not ( = ?auto_10713 ?auto_10714 ) ) ( not ( = ?auto_10713 ?auto_10747 ) ) ( not ( = ?auto_10714 ?auto_10747 ) ) ( SURFACE-AT ?auto_10712 ?auto_10726 ) ( CLEAR ?auto_10712 ) ( IS-CRATE ?auto_10713 ) ( AVAILABLE ?auto_10725 ) ( AVAILABLE ?auto_10737 ) ( SURFACE-AT ?auto_10713 ?auto_10740 ) ( ON ?auto_10713 ?auto_10739 ) ( CLEAR ?auto_10713 ) ( TRUCK-AT ?auto_10724 ?auto_10726 ) ( not ( = ?auto_10712 ?auto_10713 ) ) ( not ( = ?auto_10712 ?auto_10739 ) ) ( not ( = ?auto_10713 ?auto_10739 ) ) ( not ( = ?auto_10712 ?auto_10714 ) ) ( not ( = ?auto_10712 ?auto_10747 ) ) ( not ( = ?auto_10714 ?auto_10739 ) ) ( not ( = ?auto_10742 ?auto_10740 ) ) ( not ( = ?auto_10731 ?auto_10737 ) ) ( not ( = ?auto_10747 ?auto_10739 ) ) ( not ( = ?auto_10712 ?auto_10715 ) ) ( not ( = ?auto_10712 ?auto_10735 ) ) ( not ( = ?auto_10713 ?auto_10715 ) ) ( not ( = ?auto_10713 ?auto_10735 ) ) ( not ( = ?auto_10715 ?auto_10747 ) ) ( not ( = ?auto_10715 ?auto_10739 ) ) ( not ( = ?auto_10732 ?auto_10742 ) ) ( not ( = ?auto_10732 ?auto_10740 ) ) ( not ( = ?auto_10744 ?auto_10731 ) ) ( not ( = ?auto_10744 ?auto_10737 ) ) ( not ( = ?auto_10735 ?auto_10747 ) ) ( not ( = ?auto_10735 ?auto_10739 ) ) ( not ( = ?auto_10712 ?auto_10716 ) ) ( not ( = ?auto_10712 ?auto_10746 ) ) ( not ( = ?auto_10713 ?auto_10716 ) ) ( not ( = ?auto_10713 ?auto_10746 ) ) ( not ( = ?auto_10714 ?auto_10716 ) ) ( not ( = ?auto_10714 ?auto_10746 ) ) ( not ( = ?auto_10716 ?auto_10735 ) ) ( not ( = ?auto_10716 ?auto_10747 ) ) ( not ( = ?auto_10716 ?auto_10739 ) ) ( not ( = ?auto_10746 ?auto_10735 ) ) ( not ( = ?auto_10746 ?auto_10747 ) ) ( not ( = ?auto_10746 ?auto_10739 ) ) ( not ( = ?auto_10712 ?auto_10719 ) ) ( not ( = ?auto_10712 ?auto_10734 ) ) ( not ( = ?auto_10713 ?auto_10719 ) ) ( not ( = ?auto_10713 ?auto_10734 ) ) ( not ( = ?auto_10714 ?auto_10719 ) ) ( not ( = ?auto_10714 ?auto_10734 ) ) ( not ( = ?auto_10715 ?auto_10719 ) ) ( not ( = ?auto_10715 ?auto_10734 ) ) ( not ( = ?auto_10719 ?auto_10746 ) ) ( not ( = ?auto_10719 ?auto_10735 ) ) ( not ( = ?auto_10719 ?auto_10747 ) ) ( not ( = ?auto_10719 ?auto_10739 ) ) ( not ( = ?auto_10727 ?auto_10732 ) ) ( not ( = ?auto_10727 ?auto_10742 ) ) ( not ( = ?auto_10727 ?auto_10740 ) ) ( not ( = ?auto_10729 ?auto_10744 ) ) ( not ( = ?auto_10729 ?auto_10731 ) ) ( not ( = ?auto_10729 ?auto_10737 ) ) ( not ( = ?auto_10734 ?auto_10746 ) ) ( not ( = ?auto_10734 ?auto_10735 ) ) ( not ( = ?auto_10734 ?auto_10747 ) ) ( not ( = ?auto_10734 ?auto_10739 ) ) ( not ( = ?auto_10712 ?auto_10717 ) ) ( not ( = ?auto_10712 ?auto_10736 ) ) ( not ( = ?auto_10713 ?auto_10717 ) ) ( not ( = ?auto_10713 ?auto_10736 ) ) ( not ( = ?auto_10714 ?auto_10717 ) ) ( not ( = ?auto_10714 ?auto_10736 ) ) ( not ( = ?auto_10715 ?auto_10717 ) ) ( not ( = ?auto_10715 ?auto_10736 ) ) ( not ( = ?auto_10716 ?auto_10717 ) ) ( not ( = ?auto_10716 ?auto_10736 ) ) ( not ( = ?auto_10717 ?auto_10734 ) ) ( not ( = ?auto_10717 ?auto_10746 ) ) ( not ( = ?auto_10717 ?auto_10735 ) ) ( not ( = ?auto_10717 ?auto_10747 ) ) ( not ( = ?auto_10717 ?auto_10739 ) ) ( not ( = ?auto_10736 ?auto_10734 ) ) ( not ( = ?auto_10736 ?auto_10746 ) ) ( not ( = ?auto_10736 ?auto_10735 ) ) ( not ( = ?auto_10736 ?auto_10747 ) ) ( not ( = ?auto_10736 ?auto_10739 ) ) ( not ( = ?auto_10712 ?auto_10721 ) ) ( not ( = ?auto_10712 ?auto_10738 ) ) ( not ( = ?auto_10713 ?auto_10721 ) ) ( not ( = ?auto_10713 ?auto_10738 ) ) ( not ( = ?auto_10714 ?auto_10721 ) ) ( not ( = ?auto_10714 ?auto_10738 ) ) ( not ( = ?auto_10715 ?auto_10721 ) ) ( not ( = ?auto_10715 ?auto_10738 ) ) ( not ( = ?auto_10716 ?auto_10721 ) ) ( not ( = ?auto_10716 ?auto_10738 ) ) ( not ( = ?auto_10719 ?auto_10721 ) ) ( not ( = ?auto_10719 ?auto_10738 ) ) ( not ( = ?auto_10721 ?auto_10736 ) ) ( not ( = ?auto_10721 ?auto_10734 ) ) ( not ( = ?auto_10721 ?auto_10746 ) ) ( not ( = ?auto_10721 ?auto_10735 ) ) ( not ( = ?auto_10721 ?auto_10747 ) ) ( not ( = ?auto_10721 ?auto_10739 ) ) ( not ( = ?auto_10733 ?auto_10740 ) ) ( not ( = ?auto_10733 ?auto_10727 ) ) ( not ( = ?auto_10733 ?auto_10732 ) ) ( not ( = ?auto_10733 ?auto_10742 ) ) ( not ( = ?auto_10743 ?auto_10737 ) ) ( not ( = ?auto_10743 ?auto_10729 ) ) ( not ( = ?auto_10743 ?auto_10744 ) ) ( not ( = ?auto_10743 ?auto_10731 ) ) ( not ( = ?auto_10738 ?auto_10736 ) ) ( not ( = ?auto_10738 ?auto_10734 ) ) ( not ( = ?auto_10738 ?auto_10746 ) ) ( not ( = ?auto_10738 ?auto_10735 ) ) ( not ( = ?auto_10738 ?auto_10747 ) ) ( not ( = ?auto_10738 ?auto_10739 ) ) ( not ( = ?auto_10712 ?auto_10720 ) ) ( not ( = ?auto_10712 ?auto_10741 ) ) ( not ( = ?auto_10713 ?auto_10720 ) ) ( not ( = ?auto_10713 ?auto_10741 ) ) ( not ( = ?auto_10714 ?auto_10720 ) ) ( not ( = ?auto_10714 ?auto_10741 ) ) ( not ( = ?auto_10715 ?auto_10720 ) ) ( not ( = ?auto_10715 ?auto_10741 ) ) ( not ( = ?auto_10716 ?auto_10720 ) ) ( not ( = ?auto_10716 ?auto_10741 ) ) ( not ( = ?auto_10719 ?auto_10720 ) ) ( not ( = ?auto_10719 ?auto_10741 ) ) ( not ( = ?auto_10717 ?auto_10720 ) ) ( not ( = ?auto_10717 ?auto_10741 ) ) ( not ( = ?auto_10720 ?auto_10738 ) ) ( not ( = ?auto_10720 ?auto_10736 ) ) ( not ( = ?auto_10720 ?auto_10734 ) ) ( not ( = ?auto_10720 ?auto_10746 ) ) ( not ( = ?auto_10720 ?auto_10735 ) ) ( not ( = ?auto_10720 ?auto_10747 ) ) ( not ( = ?auto_10720 ?auto_10739 ) ) ( not ( = ?auto_10741 ?auto_10738 ) ) ( not ( = ?auto_10741 ?auto_10736 ) ) ( not ( = ?auto_10741 ?auto_10734 ) ) ( not ( = ?auto_10741 ?auto_10746 ) ) ( not ( = ?auto_10741 ?auto_10735 ) ) ( not ( = ?auto_10741 ?auto_10747 ) ) ( not ( = ?auto_10741 ?auto_10739 ) ) ( not ( = ?auto_10712 ?auto_10718 ) ) ( not ( = ?auto_10712 ?auto_10745 ) ) ( not ( = ?auto_10713 ?auto_10718 ) ) ( not ( = ?auto_10713 ?auto_10745 ) ) ( not ( = ?auto_10714 ?auto_10718 ) ) ( not ( = ?auto_10714 ?auto_10745 ) ) ( not ( = ?auto_10715 ?auto_10718 ) ) ( not ( = ?auto_10715 ?auto_10745 ) ) ( not ( = ?auto_10716 ?auto_10718 ) ) ( not ( = ?auto_10716 ?auto_10745 ) ) ( not ( = ?auto_10719 ?auto_10718 ) ) ( not ( = ?auto_10719 ?auto_10745 ) ) ( not ( = ?auto_10717 ?auto_10718 ) ) ( not ( = ?auto_10717 ?auto_10745 ) ) ( not ( = ?auto_10721 ?auto_10718 ) ) ( not ( = ?auto_10721 ?auto_10745 ) ) ( not ( = ?auto_10718 ?auto_10741 ) ) ( not ( = ?auto_10718 ?auto_10738 ) ) ( not ( = ?auto_10718 ?auto_10736 ) ) ( not ( = ?auto_10718 ?auto_10734 ) ) ( not ( = ?auto_10718 ?auto_10746 ) ) ( not ( = ?auto_10718 ?auto_10735 ) ) ( not ( = ?auto_10718 ?auto_10747 ) ) ( not ( = ?auto_10718 ?auto_10739 ) ) ( not ( = ?auto_10745 ?auto_10741 ) ) ( not ( = ?auto_10745 ?auto_10738 ) ) ( not ( = ?auto_10745 ?auto_10736 ) ) ( not ( = ?auto_10745 ?auto_10734 ) ) ( not ( = ?auto_10745 ?auto_10746 ) ) ( not ( = ?auto_10745 ?auto_10735 ) ) ( not ( = ?auto_10745 ?auto_10747 ) ) ( not ( = ?auto_10745 ?auto_10739 ) ) ( not ( = ?auto_10712 ?auto_10723 ) ) ( not ( = ?auto_10712 ?auto_10730 ) ) ( not ( = ?auto_10713 ?auto_10723 ) ) ( not ( = ?auto_10713 ?auto_10730 ) ) ( not ( = ?auto_10714 ?auto_10723 ) ) ( not ( = ?auto_10714 ?auto_10730 ) ) ( not ( = ?auto_10715 ?auto_10723 ) ) ( not ( = ?auto_10715 ?auto_10730 ) ) ( not ( = ?auto_10716 ?auto_10723 ) ) ( not ( = ?auto_10716 ?auto_10730 ) ) ( not ( = ?auto_10719 ?auto_10723 ) ) ( not ( = ?auto_10719 ?auto_10730 ) ) ( not ( = ?auto_10717 ?auto_10723 ) ) ( not ( = ?auto_10717 ?auto_10730 ) ) ( not ( = ?auto_10721 ?auto_10723 ) ) ( not ( = ?auto_10721 ?auto_10730 ) ) ( not ( = ?auto_10720 ?auto_10723 ) ) ( not ( = ?auto_10720 ?auto_10730 ) ) ( not ( = ?auto_10723 ?auto_10745 ) ) ( not ( = ?auto_10723 ?auto_10741 ) ) ( not ( = ?auto_10723 ?auto_10738 ) ) ( not ( = ?auto_10723 ?auto_10736 ) ) ( not ( = ?auto_10723 ?auto_10734 ) ) ( not ( = ?auto_10723 ?auto_10746 ) ) ( not ( = ?auto_10723 ?auto_10735 ) ) ( not ( = ?auto_10723 ?auto_10747 ) ) ( not ( = ?auto_10723 ?auto_10739 ) ) ( not ( = ?auto_10730 ?auto_10745 ) ) ( not ( = ?auto_10730 ?auto_10741 ) ) ( not ( = ?auto_10730 ?auto_10738 ) ) ( not ( = ?auto_10730 ?auto_10736 ) ) ( not ( = ?auto_10730 ?auto_10734 ) ) ( not ( = ?auto_10730 ?auto_10746 ) ) ( not ( = ?auto_10730 ?auto_10735 ) ) ( not ( = ?auto_10730 ?auto_10747 ) ) ( not ( = ?auto_10730 ?auto_10739 ) ) ( not ( = ?auto_10712 ?auto_10722 ) ) ( not ( = ?auto_10712 ?auto_10728 ) ) ( not ( = ?auto_10713 ?auto_10722 ) ) ( not ( = ?auto_10713 ?auto_10728 ) ) ( not ( = ?auto_10714 ?auto_10722 ) ) ( not ( = ?auto_10714 ?auto_10728 ) ) ( not ( = ?auto_10715 ?auto_10722 ) ) ( not ( = ?auto_10715 ?auto_10728 ) ) ( not ( = ?auto_10716 ?auto_10722 ) ) ( not ( = ?auto_10716 ?auto_10728 ) ) ( not ( = ?auto_10719 ?auto_10722 ) ) ( not ( = ?auto_10719 ?auto_10728 ) ) ( not ( = ?auto_10717 ?auto_10722 ) ) ( not ( = ?auto_10717 ?auto_10728 ) ) ( not ( = ?auto_10721 ?auto_10722 ) ) ( not ( = ?auto_10721 ?auto_10728 ) ) ( not ( = ?auto_10720 ?auto_10722 ) ) ( not ( = ?auto_10720 ?auto_10728 ) ) ( not ( = ?auto_10718 ?auto_10722 ) ) ( not ( = ?auto_10718 ?auto_10728 ) ) ( not ( = ?auto_10722 ?auto_10730 ) ) ( not ( = ?auto_10722 ?auto_10745 ) ) ( not ( = ?auto_10722 ?auto_10741 ) ) ( not ( = ?auto_10722 ?auto_10738 ) ) ( not ( = ?auto_10722 ?auto_10736 ) ) ( not ( = ?auto_10722 ?auto_10734 ) ) ( not ( = ?auto_10722 ?auto_10746 ) ) ( not ( = ?auto_10722 ?auto_10735 ) ) ( not ( = ?auto_10722 ?auto_10747 ) ) ( not ( = ?auto_10722 ?auto_10739 ) ) ( not ( = ?auto_10728 ?auto_10730 ) ) ( not ( = ?auto_10728 ?auto_10745 ) ) ( not ( = ?auto_10728 ?auto_10741 ) ) ( not ( = ?auto_10728 ?auto_10738 ) ) ( not ( = ?auto_10728 ?auto_10736 ) ) ( not ( = ?auto_10728 ?auto_10734 ) ) ( not ( = ?auto_10728 ?auto_10746 ) ) ( not ( = ?auto_10728 ?auto_10735 ) ) ( not ( = ?auto_10728 ?auto_10747 ) ) ( not ( = ?auto_10728 ?auto_10739 ) ) )
    :subtasks
    ( ( MAKE-10CRATE ?auto_10712 ?auto_10713 ?auto_10714 ?auto_10715 ?auto_10716 ?auto_10719 ?auto_10717 ?auto_10721 ?auto_10720 ?auto_10718 ?auto_10723 )
      ( MAKE-1CRATE ?auto_10723 ?auto_10722 )
      ( MAKE-11CRATE-VERIFY ?auto_10712 ?auto_10713 ?auto_10714 ?auto_10715 ?auto_10716 ?auto_10719 ?auto_10717 ?auto_10721 ?auto_10720 ?auto_10718 ?auto_10723 ?auto_10722 ) )
  )

)

