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
      ?auto_10338 - PLACE
      ?auto_10337 - PLACE
      ?auto_10342 - HOIST
      ?auto_10339 - SURFACE
      ?auto_10343 - PLACE
      ?auto_10344 - HOIST
      ?auto_10345 - SURFACE
      ?auto_10340 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10341 ?auto_10338 ) ( IS-CRATE ?auto_10336 ) ( not ( = ?auto_10337 ?auto_10338 ) ) ( HOIST-AT ?auto_10342 ?auto_10337 ) ( AVAILABLE ?auto_10342 ) ( SURFACE-AT ?auto_10336 ?auto_10337 ) ( ON ?auto_10336 ?auto_10339 ) ( CLEAR ?auto_10336 ) ( not ( = ?auto_10335 ?auto_10336 ) ) ( not ( = ?auto_10335 ?auto_10339 ) ) ( not ( = ?auto_10336 ?auto_10339 ) ) ( not ( = ?auto_10341 ?auto_10342 ) ) ( SURFACE-AT ?auto_10334 ?auto_10338 ) ( CLEAR ?auto_10334 ) ( IS-CRATE ?auto_10335 ) ( AVAILABLE ?auto_10341 ) ( not ( = ?auto_10343 ?auto_10338 ) ) ( HOIST-AT ?auto_10344 ?auto_10343 ) ( AVAILABLE ?auto_10344 ) ( SURFACE-AT ?auto_10335 ?auto_10343 ) ( ON ?auto_10335 ?auto_10345 ) ( CLEAR ?auto_10335 ) ( TRUCK-AT ?auto_10340 ?auto_10338 ) ( not ( = ?auto_10334 ?auto_10335 ) ) ( not ( = ?auto_10334 ?auto_10345 ) ) ( not ( = ?auto_10335 ?auto_10345 ) ) ( not ( = ?auto_10341 ?auto_10344 ) ) ( not ( = ?auto_10334 ?auto_10336 ) ) ( not ( = ?auto_10334 ?auto_10339 ) ) ( not ( = ?auto_10336 ?auto_10345 ) ) ( not ( = ?auto_10337 ?auto_10343 ) ) ( not ( = ?auto_10342 ?auto_10344 ) ) ( not ( = ?auto_10339 ?auto_10345 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_10334 ?auto_10335 )
      ( MAKE-1CRATE ?auto_10335 ?auto_10336 )
      ( MAKE-2CRATE-VERIFY ?auto_10334 ?auto_10335 ?auto_10336 ) )
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
      ?auto_10365 - PLACE
      ?auto_10369 - PLACE
      ?auto_10368 - HOIST
      ?auto_10367 - SURFACE
      ?auto_10371 - PLACE
      ?auto_10370 - HOIST
      ?auto_10375 - SURFACE
      ?auto_10374 - PLACE
      ?auto_10372 - HOIST
      ?auto_10373 - SURFACE
      ?auto_10366 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10364 ?auto_10365 ) ( IS-CRATE ?auto_10363 ) ( not ( = ?auto_10369 ?auto_10365 ) ) ( HOIST-AT ?auto_10368 ?auto_10369 ) ( AVAILABLE ?auto_10368 ) ( SURFACE-AT ?auto_10363 ?auto_10369 ) ( ON ?auto_10363 ?auto_10367 ) ( CLEAR ?auto_10363 ) ( not ( = ?auto_10362 ?auto_10363 ) ) ( not ( = ?auto_10362 ?auto_10367 ) ) ( not ( = ?auto_10363 ?auto_10367 ) ) ( not ( = ?auto_10364 ?auto_10368 ) ) ( IS-CRATE ?auto_10362 ) ( not ( = ?auto_10371 ?auto_10365 ) ) ( HOIST-AT ?auto_10370 ?auto_10371 ) ( AVAILABLE ?auto_10370 ) ( SURFACE-AT ?auto_10362 ?auto_10371 ) ( ON ?auto_10362 ?auto_10375 ) ( CLEAR ?auto_10362 ) ( not ( = ?auto_10361 ?auto_10362 ) ) ( not ( = ?auto_10361 ?auto_10375 ) ) ( not ( = ?auto_10362 ?auto_10375 ) ) ( not ( = ?auto_10364 ?auto_10370 ) ) ( SURFACE-AT ?auto_10360 ?auto_10365 ) ( CLEAR ?auto_10360 ) ( IS-CRATE ?auto_10361 ) ( AVAILABLE ?auto_10364 ) ( not ( = ?auto_10374 ?auto_10365 ) ) ( HOIST-AT ?auto_10372 ?auto_10374 ) ( AVAILABLE ?auto_10372 ) ( SURFACE-AT ?auto_10361 ?auto_10374 ) ( ON ?auto_10361 ?auto_10373 ) ( CLEAR ?auto_10361 ) ( TRUCK-AT ?auto_10366 ?auto_10365 ) ( not ( = ?auto_10360 ?auto_10361 ) ) ( not ( = ?auto_10360 ?auto_10373 ) ) ( not ( = ?auto_10361 ?auto_10373 ) ) ( not ( = ?auto_10364 ?auto_10372 ) ) ( not ( = ?auto_10360 ?auto_10362 ) ) ( not ( = ?auto_10360 ?auto_10375 ) ) ( not ( = ?auto_10362 ?auto_10373 ) ) ( not ( = ?auto_10371 ?auto_10374 ) ) ( not ( = ?auto_10370 ?auto_10372 ) ) ( not ( = ?auto_10375 ?auto_10373 ) ) ( not ( = ?auto_10360 ?auto_10363 ) ) ( not ( = ?auto_10360 ?auto_10367 ) ) ( not ( = ?auto_10361 ?auto_10363 ) ) ( not ( = ?auto_10361 ?auto_10367 ) ) ( not ( = ?auto_10363 ?auto_10375 ) ) ( not ( = ?auto_10363 ?auto_10373 ) ) ( not ( = ?auto_10369 ?auto_10371 ) ) ( not ( = ?auto_10369 ?auto_10374 ) ) ( not ( = ?auto_10368 ?auto_10370 ) ) ( not ( = ?auto_10368 ?auto_10372 ) ) ( not ( = ?auto_10367 ?auto_10375 ) ) ( not ( = ?auto_10367 ?auto_10373 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_10360 ?auto_10361 ?auto_10362 )
      ( MAKE-1CRATE ?auto_10362 ?auto_10363 )
      ( MAKE-3CRATE-VERIFY ?auto_10360 ?auto_10361 ?auto_10362 ?auto_10363 ) )
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
      ?auto_10401 - PLACE
      ?auto_10400 - PLACE
      ?auto_10397 - HOIST
      ?auto_10396 - SURFACE
      ?auto_10408 - SURFACE
      ?auto_10406 - PLACE
      ?auto_10405 - HOIST
      ?auto_10402 - SURFACE
      ?auto_10404 - PLACE
      ?auto_10403 - HOIST
      ?auto_10407 - SURFACE
      ?auto_10398 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10399 ?auto_10401 ) ( IS-CRATE ?auto_10395 ) ( not ( = ?auto_10400 ?auto_10401 ) ) ( HOIST-AT ?auto_10397 ?auto_10400 ) ( SURFACE-AT ?auto_10395 ?auto_10400 ) ( ON ?auto_10395 ?auto_10396 ) ( CLEAR ?auto_10395 ) ( not ( = ?auto_10394 ?auto_10395 ) ) ( not ( = ?auto_10394 ?auto_10396 ) ) ( not ( = ?auto_10395 ?auto_10396 ) ) ( not ( = ?auto_10399 ?auto_10397 ) ) ( IS-CRATE ?auto_10394 ) ( AVAILABLE ?auto_10397 ) ( SURFACE-AT ?auto_10394 ?auto_10400 ) ( ON ?auto_10394 ?auto_10408 ) ( CLEAR ?auto_10394 ) ( not ( = ?auto_10393 ?auto_10394 ) ) ( not ( = ?auto_10393 ?auto_10408 ) ) ( not ( = ?auto_10394 ?auto_10408 ) ) ( IS-CRATE ?auto_10393 ) ( not ( = ?auto_10406 ?auto_10401 ) ) ( HOIST-AT ?auto_10405 ?auto_10406 ) ( AVAILABLE ?auto_10405 ) ( SURFACE-AT ?auto_10393 ?auto_10406 ) ( ON ?auto_10393 ?auto_10402 ) ( CLEAR ?auto_10393 ) ( not ( = ?auto_10392 ?auto_10393 ) ) ( not ( = ?auto_10392 ?auto_10402 ) ) ( not ( = ?auto_10393 ?auto_10402 ) ) ( not ( = ?auto_10399 ?auto_10405 ) ) ( SURFACE-AT ?auto_10391 ?auto_10401 ) ( CLEAR ?auto_10391 ) ( IS-CRATE ?auto_10392 ) ( AVAILABLE ?auto_10399 ) ( not ( = ?auto_10404 ?auto_10401 ) ) ( HOIST-AT ?auto_10403 ?auto_10404 ) ( AVAILABLE ?auto_10403 ) ( SURFACE-AT ?auto_10392 ?auto_10404 ) ( ON ?auto_10392 ?auto_10407 ) ( CLEAR ?auto_10392 ) ( TRUCK-AT ?auto_10398 ?auto_10401 ) ( not ( = ?auto_10391 ?auto_10392 ) ) ( not ( = ?auto_10391 ?auto_10407 ) ) ( not ( = ?auto_10392 ?auto_10407 ) ) ( not ( = ?auto_10399 ?auto_10403 ) ) ( not ( = ?auto_10391 ?auto_10393 ) ) ( not ( = ?auto_10391 ?auto_10402 ) ) ( not ( = ?auto_10393 ?auto_10407 ) ) ( not ( = ?auto_10406 ?auto_10404 ) ) ( not ( = ?auto_10405 ?auto_10403 ) ) ( not ( = ?auto_10402 ?auto_10407 ) ) ( not ( = ?auto_10391 ?auto_10394 ) ) ( not ( = ?auto_10391 ?auto_10408 ) ) ( not ( = ?auto_10392 ?auto_10394 ) ) ( not ( = ?auto_10392 ?auto_10408 ) ) ( not ( = ?auto_10394 ?auto_10402 ) ) ( not ( = ?auto_10394 ?auto_10407 ) ) ( not ( = ?auto_10400 ?auto_10406 ) ) ( not ( = ?auto_10400 ?auto_10404 ) ) ( not ( = ?auto_10397 ?auto_10405 ) ) ( not ( = ?auto_10397 ?auto_10403 ) ) ( not ( = ?auto_10408 ?auto_10402 ) ) ( not ( = ?auto_10408 ?auto_10407 ) ) ( not ( = ?auto_10391 ?auto_10395 ) ) ( not ( = ?auto_10391 ?auto_10396 ) ) ( not ( = ?auto_10392 ?auto_10395 ) ) ( not ( = ?auto_10392 ?auto_10396 ) ) ( not ( = ?auto_10393 ?auto_10395 ) ) ( not ( = ?auto_10393 ?auto_10396 ) ) ( not ( = ?auto_10395 ?auto_10408 ) ) ( not ( = ?auto_10395 ?auto_10402 ) ) ( not ( = ?auto_10395 ?auto_10407 ) ) ( not ( = ?auto_10396 ?auto_10408 ) ) ( not ( = ?auto_10396 ?auto_10402 ) ) ( not ( = ?auto_10396 ?auto_10407 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_10391 ?auto_10392 ?auto_10393 ?auto_10394 )
      ( MAKE-1CRATE ?auto_10394 ?auto_10395 )
      ( MAKE-4CRATE-VERIFY ?auto_10391 ?auto_10392 ?auto_10393 ?auto_10394 ?auto_10395 ) )
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
      ?auto_10431 - HOIST
      ?auto_10435 - PLACE
      ?auto_10433 - PLACE
      ?auto_10432 - HOIST
      ?auto_10436 - SURFACE
      ?auto_10441 - PLACE
      ?auto_10442 - HOIST
      ?auto_10440 - SURFACE
      ?auto_10439 - SURFACE
      ?auto_10445 - PLACE
      ?auto_10444 - HOIST
      ?auto_10443 - SURFACE
      ?auto_10437 - PLACE
      ?auto_10438 - HOIST
      ?auto_10446 - SURFACE
      ?auto_10434 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10431 ?auto_10435 ) ( IS-CRATE ?auto_10430 ) ( not ( = ?auto_10433 ?auto_10435 ) ) ( HOIST-AT ?auto_10432 ?auto_10433 ) ( AVAILABLE ?auto_10432 ) ( SURFACE-AT ?auto_10430 ?auto_10433 ) ( ON ?auto_10430 ?auto_10436 ) ( CLEAR ?auto_10430 ) ( not ( = ?auto_10429 ?auto_10430 ) ) ( not ( = ?auto_10429 ?auto_10436 ) ) ( not ( = ?auto_10430 ?auto_10436 ) ) ( not ( = ?auto_10431 ?auto_10432 ) ) ( IS-CRATE ?auto_10429 ) ( not ( = ?auto_10441 ?auto_10435 ) ) ( HOIST-AT ?auto_10442 ?auto_10441 ) ( SURFACE-AT ?auto_10429 ?auto_10441 ) ( ON ?auto_10429 ?auto_10440 ) ( CLEAR ?auto_10429 ) ( not ( = ?auto_10428 ?auto_10429 ) ) ( not ( = ?auto_10428 ?auto_10440 ) ) ( not ( = ?auto_10429 ?auto_10440 ) ) ( not ( = ?auto_10431 ?auto_10442 ) ) ( IS-CRATE ?auto_10428 ) ( AVAILABLE ?auto_10442 ) ( SURFACE-AT ?auto_10428 ?auto_10441 ) ( ON ?auto_10428 ?auto_10439 ) ( CLEAR ?auto_10428 ) ( not ( = ?auto_10427 ?auto_10428 ) ) ( not ( = ?auto_10427 ?auto_10439 ) ) ( not ( = ?auto_10428 ?auto_10439 ) ) ( IS-CRATE ?auto_10427 ) ( not ( = ?auto_10445 ?auto_10435 ) ) ( HOIST-AT ?auto_10444 ?auto_10445 ) ( AVAILABLE ?auto_10444 ) ( SURFACE-AT ?auto_10427 ?auto_10445 ) ( ON ?auto_10427 ?auto_10443 ) ( CLEAR ?auto_10427 ) ( not ( = ?auto_10426 ?auto_10427 ) ) ( not ( = ?auto_10426 ?auto_10443 ) ) ( not ( = ?auto_10427 ?auto_10443 ) ) ( not ( = ?auto_10431 ?auto_10444 ) ) ( SURFACE-AT ?auto_10425 ?auto_10435 ) ( CLEAR ?auto_10425 ) ( IS-CRATE ?auto_10426 ) ( AVAILABLE ?auto_10431 ) ( not ( = ?auto_10437 ?auto_10435 ) ) ( HOIST-AT ?auto_10438 ?auto_10437 ) ( AVAILABLE ?auto_10438 ) ( SURFACE-AT ?auto_10426 ?auto_10437 ) ( ON ?auto_10426 ?auto_10446 ) ( CLEAR ?auto_10426 ) ( TRUCK-AT ?auto_10434 ?auto_10435 ) ( not ( = ?auto_10425 ?auto_10426 ) ) ( not ( = ?auto_10425 ?auto_10446 ) ) ( not ( = ?auto_10426 ?auto_10446 ) ) ( not ( = ?auto_10431 ?auto_10438 ) ) ( not ( = ?auto_10425 ?auto_10427 ) ) ( not ( = ?auto_10425 ?auto_10443 ) ) ( not ( = ?auto_10427 ?auto_10446 ) ) ( not ( = ?auto_10445 ?auto_10437 ) ) ( not ( = ?auto_10444 ?auto_10438 ) ) ( not ( = ?auto_10443 ?auto_10446 ) ) ( not ( = ?auto_10425 ?auto_10428 ) ) ( not ( = ?auto_10425 ?auto_10439 ) ) ( not ( = ?auto_10426 ?auto_10428 ) ) ( not ( = ?auto_10426 ?auto_10439 ) ) ( not ( = ?auto_10428 ?auto_10443 ) ) ( not ( = ?auto_10428 ?auto_10446 ) ) ( not ( = ?auto_10441 ?auto_10445 ) ) ( not ( = ?auto_10441 ?auto_10437 ) ) ( not ( = ?auto_10442 ?auto_10444 ) ) ( not ( = ?auto_10442 ?auto_10438 ) ) ( not ( = ?auto_10439 ?auto_10443 ) ) ( not ( = ?auto_10439 ?auto_10446 ) ) ( not ( = ?auto_10425 ?auto_10429 ) ) ( not ( = ?auto_10425 ?auto_10440 ) ) ( not ( = ?auto_10426 ?auto_10429 ) ) ( not ( = ?auto_10426 ?auto_10440 ) ) ( not ( = ?auto_10427 ?auto_10429 ) ) ( not ( = ?auto_10427 ?auto_10440 ) ) ( not ( = ?auto_10429 ?auto_10439 ) ) ( not ( = ?auto_10429 ?auto_10443 ) ) ( not ( = ?auto_10429 ?auto_10446 ) ) ( not ( = ?auto_10440 ?auto_10439 ) ) ( not ( = ?auto_10440 ?auto_10443 ) ) ( not ( = ?auto_10440 ?auto_10446 ) ) ( not ( = ?auto_10425 ?auto_10430 ) ) ( not ( = ?auto_10425 ?auto_10436 ) ) ( not ( = ?auto_10426 ?auto_10430 ) ) ( not ( = ?auto_10426 ?auto_10436 ) ) ( not ( = ?auto_10427 ?auto_10430 ) ) ( not ( = ?auto_10427 ?auto_10436 ) ) ( not ( = ?auto_10428 ?auto_10430 ) ) ( not ( = ?auto_10428 ?auto_10436 ) ) ( not ( = ?auto_10430 ?auto_10440 ) ) ( not ( = ?auto_10430 ?auto_10439 ) ) ( not ( = ?auto_10430 ?auto_10443 ) ) ( not ( = ?auto_10430 ?auto_10446 ) ) ( not ( = ?auto_10433 ?auto_10441 ) ) ( not ( = ?auto_10433 ?auto_10445 ) ) ( not ( = ?auto_10433 ?auto_10437 ) ) ( not ( = ?auto_10432 ?auto_10442 ) ) ( not ( = ?auto_10432 ?auto_10444 ) ) ( not ( = ?auto_10432 ?auto_10438 ) ) ( not ( = ?auto_10436 ?auto_10440 ) ) ( not ( = ?auto_10436 ?auto_10439 ) ) ( not ( = ?auto_10436 ?auto_10443 ) ) ( not ( = ?auto_10436 ?auto_10446 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_10425 ?auto_10426 ?auto_10427 ?auto_10428 ?auto_10429 )
      ( MAKE-1CRATE ?auto_10429 ?auto_10430 )
      ( MAKE-5CRATE-VERIFY ?auto_10425 ?auto_10426 ?auto_10427 ?auto_10428 ?auto_10429 ?auto_10430 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_10464 - SURFACE
      ?auto_10465 - SURFACE
      ?auto_10466 - SURFACE
      ?auto_10467 - SURFACE
      ?auto_10468 - SURFACE
      ?auto_10469 - SURFACE
      ?auto_10470 - SURFACE
    )
    :vars
    (
      ?auto_10476 - HOIST
      ?auto_10472 - PLACE
      ?auto_10475 - PLACE
      ?auto_10474 - HOIST
      ?auto_10471 - SURFACE
      ?auto_10477 - PLACE
      ?auto_10484 - HOIST
      ?auto_10487 - SURFACE
      ?auto_10482 - PLACE
      ?auto_10480 - HOIST
      ?auto_10479 - SURFACE
      ?auto_10486 - SURFACE
      ?auto_10481 - PLACE
      ?auto_10478 - HOIST
      ?auto_10483 - SURFACE
      ?auto_10485 - SURFACE
      ?auto_10473 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10476 ?auto_10472 ) ( IS-CRATE ?auto_10470 ) ( not ( = ?auto_10475 ?auto_10472 ) ) ( HOIST-AT ?auto_10474 ?auto_10475 ) ( SURFACE-AT ?auto_10470 ?auto_10475 ) ( ON ?auto_10470 ?auto_10471 ) ( CLEAR ?auto_10470 ) ( not ( = ?auto_10469 ?auto_10470 ) ) ( not ( = ?auto_10469 ?auto_10471 ) ) ( not ( = ?auto_10470 ?auto_10471 ) ) ( not ( = ?auto_10476 ?auto_10474 ) ) ( IS-CRATE ?auto_10469 ) ( not ( = ?auto_10477 ?auto_10472 ) ) ( HOIST-AT ?auto_10484 ?auto_10477 ) ( AVAILABLE ?auto_10484 ) ( SURFACE-AT ?auto_10469 ?auto_10477 ) ( ON ?auto_10469 ?auto_10487 ) ( CLEAR ?auto_10469 ) ( not ( = ?auto_10468 ?auto_10469 ) ) ( not ( = ?auto_10468 ?auto_10487 ) ) ( not ( = ?auto_10469 ?auto_10487 ) ) ( not ( = ?auto_10476 ?auto_10484 ) ) ( IS-CRATE ?auto_10468 ) ( not ( = ?auto_10482 ?auto_10472 ) ) ( HOIST-AT ?auto_10480 ?auto_10482 ) ( SURFACE-AT ?auto_10468 ?auto_10482 ) ( ON ?auto_10468 ?auto_10479 ) ( CLEAR ?auto_10468 ) ( not ( = ?auto_10467 ?auto_10468 ) ) ( not ( = ?auto_10467 ?auto_10479 ) ) ( not ( = ?auto_10468 ?auto_10479 ) ) ( not ( = ?auto_10476 ?auto_10480 ) ) ( IS-CRATE ?auto_10467 ) ( AVAILABLE ?auto_10480 ) ( SURFACE-AT ?auto_10467 ?auto_10482 ) ( ON ?auto_10467 ?auto_10486 ) ( CLEAR ?auto_10467 ) ( not ( = ?auto_10466 ?auto_10467 ) ) ( not ( = ?auto_10466 ?auto_10486 ) ) ( not ( = ?auto_10467 ?auto_10486 ) ) ( IS-CRATE ?auto_10466 ) ( not ( = ?auto_10481 ?auto_10472 ) ) ( HOIST-AT ?auto_10478 ?auto_10481 ) ( AVAILABLE ?auto_10478 ) ( SURFACE-AT ?auto_10466 ?auto_10481 ) ( ON ?auto_10466 ?auto_10483 ) ( CLEAR ?auto_10466 ) ( not ( = ?auto_10465 ?auto_10466 ) ) ( not ( = ?auto_10465 ?auto_10483 ) ) ( not ( = ?auto_10466 ?auto_10483 ) ) ( not ( = ?auto_10476 ?auto_10478 ) ) ( SURFACE-AT ?auto_10464 ?auto_10472 ) ( CLEAR ?auto_10464 ) ( IS-CRATE ?auto_10465 ) ( AVAILABLE ?auto_10476 ) ( AVAILABLE ?auto_10474 ) ( SURFACE-AT ?auto_10465 ?auto_10475 ) ( ON ?auto_10465 ?auto_10485 ) ( CLEAR ?auto_10465 ) ( TRUCK-AT ?auto_10473 ?auto_10472 ) ( not ( = ?auto_10464 ?auto_10465 ) ) ( not ( = ?auto_10464 ?auto_10485 ) ) ( not ( = ?auto_10465 ?auto_10485 ) ) ( not ( = ?auto_10464 ?auto_10466 ) ) ( not ( = ?auto_10464 ?auto_10483 ) ) ( not ( = ?auto_10466 ?auto_10485 ) ) ( not ( = ?auto_10481 ?auto_10475 ) ) ( not ( = ?auto_10478 ?auto_10474 ) ) ( not ( = ?auto_10483 ?auto_10485 ) ) ( not ( = ?auto_10464 ?auto_10467 ) ) ( not ( = ?auto_10464 ?auto_10486 ) ) ( not ( = ?auto_10465 ?auto_10467 ) ) ( not ( = ?auto_10465 ?auto_10486 ) ) ( not ( = ?auto_10467 ?auto_10483 ) ) ( not ( = ?auto_10467 ?auto_10485 ) ) ( not ( = ?auto_10482 ?auto_10481 ) ) ( not ( = ?auto_10482 ?auto_10475 ) ) ( not ( = ?auto_10480 ?auto_10478 ) ) ( not ( = ?auto_10480 ?auto_10474 ) ) ( not ( = ?auto_10486 ?auto_10483 ) ) ( not ( = ?auto_10486 ?auto_10485 ) ) ( not ( = ?auto_10464 ?auto_10468 ) ) ( not ( = ?auto_10464 ?auto_10479 ) ) ( not ( = ?auto_10465 ?auto_10468 ) ) ( not ( = ?auto_10465 ?auto_10479 ) ) ( not ( = ?auto_10466 ?auto_10468 ) ) ( not ( = ?auto_10466 ?auto_10479 ) ) ( not ( = ?auto_10468 ?auto_10486 ) ) ( not ( = ?auto_10468 ?auto_10483 ) ) ( not ( = ?auto_10468 ?auto_10485 ) ) ( not ( = ?auto_10479 ?auto_10486 ) ) ( not ( = ?auto_10479 ?auto_10483 ) ) ( not ( = ?auto_10479 ?auto_10485 ) ) ( not ( = ?auto_10464 ?auto_10469 ) ) ( not ( = ?auto_10464 ?auto_10487 ) ) ( not ( = ?auto_10465 ?auto_10469 ) ) ( not ( = ?auto_10465 ?auto_10487 ) ) ( not ( = ?auto_10466 ?auto_10469 ) ) ( not ( = ?auto_10466 ?auto_10487 ) ) ( not ( = ?auto_10467 ?auto_10469 ) ) ( not ( = ?auto_10467 ?auto_10487 ) ) ( not ( = ?auto_10469 ?auto_10479 ) ) ( not ( = ?auto_10469 ?auto_10486 ) ) ( not ( = ?auto_10469 ?auto_10483 ) ) ( not ( = ?auto_10469 ?auto_10485 ) ) ( not ( = ?auto_10477 ?auto_10482 ) ) ( not ( = ?auto_10477 ?auto_10481 ) ) ( not ( = ?auto_10477 ?auto_10475 ) ) ( not ( = ?auto_10484 ?auto_10480 ) ) ( not ( = ?auto_10484 ?auto_10478 ) ) ( not ( = ?auto_10484 ?auto_10474 ) ) ( not ( = ?auto_10487 ?auto_10479 ) ) ( not ( = ?auto_10487 ?auto_10486 ) ) ( not ( = ?auto_10487 ?auto_10483 ) ) ( not ( = ?auto_10487 ?auto_10485 ) ) ( not ( = ?auto_10464 ?auto_10470 ) ) ( not ( = ?auto_10464 ?auto_10471 ) ) ( not ( = ?auto_10465 ?auto_10470 ) ) ( not ( = ?auto_10465 ?auto_10471 ) ) ( not ( = ?auto_10466 ?auto_10470 ) ) ( not ( = ?auto_10466 ?auto_10471 ) ) ( not ( = ?auto_10467 ?auto_10470 ) ) ( not ( = ?auto_10467 ?auto_10471 ) ) ( not ( = ?auto_10468 ?auto_10470 ) ) ( not ( = ?auto_10468 ?auto_10471 ) ) ( not ( = ?auto_10470 ?auto_10487 ) ) ( not ( = ?auto_10470 ?auto_10479 ) ) ( not ( = ?auto_10470 ?auto_10486 ) ) ( not ( = ?auto_10470 ?auto_10483 ) ) ( not ( = ?auto_10470 ?auto_10485 ) ) ( not ( = ?auto_10471 ?auto_10487 ) ) ( not ( = ?auto_10471 ?auto_10479 ) ) ( not ( = ?auto_10471 ?auto_10486 ) ) ( not ( = ?auto_10471 ?auto_10483 ) ) ( not ( = ?auto_10471 ?auto_10485 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_10464 ?auto_10465 ?auto_10466 ?auto_10467 ?auto_10468 ?auto_10469 )
      ( MAKE-1CRATE ?auto_10469 ?auto_10470 )
      ( MAKE-6CRATE-VERIFY ?auto_10464 ?auto_10465 ?auto_10466 ?auto_10467 ?auto_10468 ?auto_10469 ?auto_10470 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_10506 - SURFACE
      ?auto_10507 - SURFACE
      ?auto_10508 - SURFACE
      ?auto_10509 - SURFACE
      ?auto_10510 - SURFACE
      ?auto_10511 - SURFACE
      ?auto_10512 - SURFACE
      ?auto_10513 - SURFACE
    )
    :vars
    (
      ?auto_10518 - HOIST
      ?auto_10516 - PLACE
      ?auto_10514 - PLACE
      ?auto_10517 - HOIST
      ?auto_10515 - SURFACE
      ?auto_10533 - PLACE
      ?auto_10531 - HOIST
      ?auto_10520 - SURFACE
      ?auto_10521 - PLACE
      ?auto_10524 - HOIST
      ?auto_10522 - SURFACE
      ?auto_10532 - PLACE
      ?auto_10525 - HOIST
      ?auto_10530 - SURFACE
      ?auto_10523 - SURFACE
      ?auto_10527 - PLACE
      ?auto_10528 - HOIST
      ?auto_10529 - SURFACE
      ?auto_10526 - SURFACE
      ?auto_10519 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10518 ?auto_10516 ) ( IS-CRATE ?auto_10513 ) ( not ( = ?auto_10514 ?auto_10516 ) ) ( HOIST-AT ?auto_10517 ?auto_10514 ) ( AVAILABLE ?auto_10517 ) ( SURFACE-AT ?auto_10513 ?auto_10514 ) ( ON ?auto_10513 ?auto_10515 ) ( CLEAR ?auto_10513 ) ( not ( = ?auto_10512 ?auto_10513 ) ) ( not ( = ?auto_10512 ?auto_10515 ) ) ( not ( = ?auto_10513 ?auto_10515 ) ) ( not ( = ?auto_10518 ?auto_10517 ) ) ( IS-CRATE ?auto_10512 ) ( not ( = ?auto_10533 ?auto_10516 ) ) ( HOIST-AT ?auto_10531 ?auto_10533 ) ( SURFACE-AT ?auto_10512 ?auto_10533 ) ( ON ?auto_10512 ?auto_10520 ) ( CLEAR ?auto_10512 ) ( not ( = ?auto_10511 ?auto_10512 ) ) ( not ( = ?auto_10511 ?auto_10520 ) ) ( not ( = ?auto_10512 ?auto_10520 ) ) ( not ( = ?auto_10518 ?auto_10531 ) ) ( IS-CRATE ?auto_10511 ) ( not ( = ?auto_10521 ?auto_10516 ) ) ( HOIST-AT ?auto_10524 ?auto_10521 ) ( AVAILABLE ?auto_10524 ) ( SURFACE-AT ?auto_10511 ?auto_10521 ) ( ON ?auto_10511 ?auto_10522 ) ( CLEAR ?auto_10511 ) ( not ( = ?auto_10510 ?auto_10511 ) ) ( not ( = ?auto_10510 ?auto_10522 ) ) ( not ( = ?auto_10511 ?auto_10522 ) ) ( not ( = ?auto_10518 ?auto_10524 ) ) ( IS-CRATE ?auto_10510 ) ( not ( = ?auto_10532 ?auto_10516 ) ) ( HOIST-AT ?auto_10525 ?auto_10532 ) ( SURFACE-AT ?auto_10510 ?auto_10532 ) ( ON ?auto_10510 ?auto_10530 ) ( CLEAR ?auto_10510 ) ( not ( = ?auto_10509 ?auto_10510 ) ) ( not ( = ?auto_10509 ?auto_10530 ) ) ( not ( = ?auto_10510 ?auto_10530 ) ) ( not ( = ?auto_10518 ?auto_10525 ) ) ( IS-CRATE ?auto_10509 ) ( AVAILABLE ?auto_10525 ) ( SURFACE-AT ?auto_10509 ?auto_10532 ) ( ON ?auto_10509 ?auto_10523 ) ( CLEAR ?auto_10509 ) ( not ( = ?auto_10508 ?auto_10509 ) ) ( not ( = ?auto_10508 ?auto_10523 ) ) ( not ( = ?auto_10509 ?auto_10523 ) ) ( IS-CRATE ?auto_10508 ) ( not ( = ?auto_10527 ?auto_10516 ) ) ( HOIST-AT ?auto_10528 ?auto_10527 ) ( AVAILABLE ?auto_10528 ) ( SURFACE-AT ?auto_10508 ?auto_10527 ) ( ON ?auto_10508 ?auto_10529 ) ( CLEAR ?auto_10508 ) ( not ( = ?auto_10507 ?auto_10508 ) ) ( not ( = ?auto_10507 ?auto_10529 ) ) ( not ( = ?auto_10508 ?auto_10529 ) ) ( not ( = ?auto_10518 ?auto_10528 ) ) ( SURFACE-AT ?auto_10506 ?auto_10516 ) ( CLEAR ?auto_10506 ) ( IS-CRATE ?auto_10507 ) ( AVAILABLE ?auto_10518 ) ( AVAILABLE ?auto_10531 ) ( SURFACE-AT ?auto_10507 ?auto_10533 ) ( ON ?auto_10507 ?auto_10526 ) ( CLEAR ?auto_10507 ) ( TRUCK-AT ?auto_10519 ?auto_10516 ) ( not ( = ?auto_10506 ?auto_10507 ) ) ( not ( = ?auto_10506 ?auto_10526 ) ) ( not ( = ?auto_10507 ?auto_10526 ) ) ( not ( = ?auto_10506 ?auto_10508 ) ) ( not ( = ?auto_10506 ?auto_10529 ) ) ( not ( = ?auto_10508 ?auto_10526 ) ) ( not ( = ?auto_10527 ?auto_10533 ) ) ( not ( = ?auto_10528 ?auto_10531 ) ) ( not ( = ?auto_10529 ?auto_10526 ) ) ( not ( = ?auto_10506 ?auto_10509 ) ) ( not ( = ?auto_10506 ?auto_10523 ) ) ( not ( = ?auto_10507 ?auto_10509 ) ) ( not ( = ?auto_10507 ?auto_10523 ) ) ( not ( = ?auto_10509 ?auto_10529 ) ) ( not ( = ?auto_10509 ?auto_10526 ) ) ( not ( = ?auto_10532 ?auto_10527 ) ) ( not ( = ?auto_10532 ?auto_10533 ) ) ( not ( = ?auto_10525 ?auto_10528 ) ) ( not ( = ?auto_10525 ?auto_10531 ) ) ( not ( = ?auto_10523 ?auto_10529 ) ) ( not ( = ?auto_10523 ?auto_10526 ) ) ( not ( = ?auto_10506 ?auto_10510 ) ) ( not ( = ?auto_10506 ?auto_10530 ) ) ( not ( = ?auto_10507 ?auto_10510 ) ) ( not ( = ?auto_10507 ?auto_10530 ) ) ( not ( = ?auto_10508 ?auto_10510 ) ) ( not ( = ?auto_10508 ?auto_10530 ) ) ( not ( = ?auto_10510 ?auto_10523 ) ) ( not ( = ?auto_10510 ?auto_10529 ) ) ( not ( = ?auto_10510 ?auto_10526 ) ) ( not ( = ?auto_10530 ?auto_10523 ) ) ( not ( = ?auto_10530 ?auto_10529 ) ) ( not ( = ?auto_10530 ?auto_10526 ) ) ( not ( = ?auto_10506 ?auto_10511 ) ) ( not ( = ?auto_10506 ?auto_10522 ) ) ( not ( = ?auto_10507 ?auto_10511 ) ) ( not ( = ?auto_10507 ?auto_10522 ) ) ( not ( = ?auto_10508 ?auto_10511 ) ) ( not ( = ?auto_10508 ?auto_10522 ) ) ( not ( = ?auto_10509 ?auto_10511 ) ) ( not ( = ?auto_10509 ?auto_10522 ) ) ( not ( = ?auto_10511 ?auto_10530 ) ) ( not ( = ?auto_10511 ?auto_10523 ) ) ( not ( = ?auto_10511 ?auto_10529 ) ) ( not ( = ?auto_10511 ?auto_10526 ) ) ( not ( = ?auto_10521 ?auto_10532 ) ) ( not ( = ?auto_10521 ?auto_10527 ) ) ( not ( = ?auto_10521 ?auto_10533 ) ) ( not ( = ?auto_10524 ?auto_10525 ) ) ( not ( = ?auto_10524 ?auto_10528 ) ) ( not ( = ?auto_10524 ?auto_10531 ) ) ( not ( = ?auto_10522 ?auto_10530 ) ) ( not ( = ?auto_10522 ?auto_10523 ) ) ( not ( = ?auto_10522 ?auto_10529 ) ) ( not ( = ?auto_10522 ?auto_10526 ) ) ( not ( = ?auto_10506 ?auto_10512 ) ) ( not ( = ?auto_10506 ?auto_10520 ) ) ( not ( = ?auto_10507 ?auto_10512 ) ) ( not ( = ?auto_10507 ?auto_10520 ) ) ( not ( = ?auto_10508 ?auto_10512 ) ) ( not ( = ?auto_10508 ?auto_10520 ) ) ( not ( = ?auto_10509 ?auto_10512 ) ) ( not ( = ?auto_10509 ?auto_10520 ) ) ( not ( = ?auto_10510 ?auto_10512 ) ) ( not ( = ?auto_10510 ?auto_10520 ) ) ( not ( = ?auto_10512 ?auto_10522 ) ) ( not ( = ?auto_10512 ?auto_10530 ) ) ( not ( = ?auto_10512 ?auto_10523 ) ) ( not ( = ?auto_10512 ?auto_10529 ) ) ( not ( = ?auto_10512 ?auto_10526 ) ) ( not ( = ?auto_10520 ?auto_10522 ) ) ( not ( = ?auto_10520 ?auto_10530 ) ) ( not ( = ?auto_10520 ?auto_10523 ) ) ( not ( = ?auto_10520 ?auto_10529 ) ) ( not ( = ?auto_10520 ?auto_10526 ) ) ( not ( = ?auto_10506 ?auto_10513 ) ) ( not ( = ?auto_10506 ?auto_10515 ) ) ( not ( = ?auto_10507 ?auto_10513 ) ) ( not ( = ?auto_10507 ?auto_10515 ) ) ( not ( = ?auto_10508 ?auto_10513 ) ) ( not ( = ?auto_10508 ?auto_10515 ) ) ( not ( = ?auto_10509 ?auto_10513 ) ) ( not ( = ?auto_10509 ?auto_10515 ) ) ( not ( = ?auto_10510 ?auto_10513 ) ) ( not ( = ?auto_10510 ?auto_10515 ) ) ( not ( = ?auto_10511 ?auto_10513 ) ) ( not ( = ?auto_10511 ?auto_10515 ) ) ( not ( = ?auto_10513 ?auto_10520 ) ) ( not ( = ?auto_10513 ?auto_10522 ) ) ( not ( = ?auto_10513 ?auto_10530 ) ) ( not ( = ?auto_10513 ?auto_10523 ) ) ( not ( = ?auto_10513 ?auto_10529 ) ) ( not ( = ?auto_10513 ?auto_10526 ) ) ( not ( = ?auto_10514 ?auto_10533 ) ) ( not ( = ?auto_10514 ?auto_10521 ) ) ( not ( = ?auto_10514 ?auto_10532 ) ) ( not ( = ?auto_10514 ?auto_10527 ) ) ( not ( = ?auto_10517 ?auto_10531 ) ) ( not ( = ?auto_10517 ?auto_10524 ) ) ( not ( = ?auto_10517 ?auto_10525 ) ) ( not ( = ?auto_10517 ?auto_10528 ) ) ( not ( = ?auto_10515 ?auto_10520 ) ) ( not ( = ?auto_10515 ?auto_10522 ) ) ( not ( = ?auto_10515 ?auto_10530 ) ) ( not ( = ?auto_10515 ?auto_10523 ) ) ( not ( = ?auto_10515 ?auto_10529 ) ) ( not ( = ?auto_10515 ?auto_10526 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_10506 ?auto_10507 ?auto_10508 ?auto_10509 ?auto_10510 ?auto_10511 ?auto_10512 )
      ( MAKE-1CRATE ?auto_10512 ?auto_10513 )
      ( MAKE-7CRATE-VERIFY ?auto_10506 ?auto_10507 ?auto_10508 ?auto_10509 ?auto_10510 ?auto_10511 ?auto_10512 ?auto_10513 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_10553 - SURFACE
      ?auto_10554 - SURFACE
      ?auto_10555 - SURFACE
      ?auto_10556 - SURFACE
      ?auto_10557 - SURFACE
      ?auto_10558 - SURFACE
      ?auto_10559 - SURFACE
      ?auto_10560 - SURFACE
      ?auto_10561 - SURFACE
    )
    :vars
    (
      ?auto_10567 - HOIST
      ?auto_10566 - PLACE
      ?auto_10563 - PLACE
      ?auto_10564 - HOIST
      ?auto_10562 - SURFACE
      ?auto_10574 - PLACE
      ?auto_10577 - HOIST
      ?auto_10572 - SURFACE
      ?auto_10578 - SURFACE
      ?auto_10575 - PLACE
      ?auto_10580 - HOIST
      ?auto_10576 - SURFACE
      ?auto_10571 - PLACE
      ?auto_10570 - HOIST
      ?auto_10581 - SURFACE
      ?auto_10579 - SURFACE
      ?auto_10569 - PLACE
      ?auto_10573 - HOIST
      ?auto_10582 - SURFACE
      ?auto_10568 - SURFACE
      ?auto_10565 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10567 ?auto_10566 ) ( IS-CRATE ?auto_10561 ) ( not ( = ?auto_10563 ?auto_10566 ) ) ( HOIST-AT ?auto_10564 ?auto_10563 ) ( SURFACE-AT ?auto_10561 ?auto_10563 ) ( ON ?auto_10561 ?auto_10562 ) ( CLEAR ?auto_10561 ) ( not ( = ?auto_10560 ?auto_10561 ) ) ( not ( = ?auto_10560 ?auto_10562 ) ) ( not ( = ?auto_10561 ?auto_10562 ) ) ( not ( = ?auto_10567 ?auto_10564 ) ) ( IS-CRATE ?auto_10560 ) ( not ( = ?auto_10574 ?auto_10566 ) ) ( HOIST-AT ?auto_10577 ?auto_10574 ) ( AVAILABLE ?auto_10577 ) ( SURFACE-AT ?auto_10560 ?auto_10574 ) ( ON ?auto_10560 ?auto_10572 ) ( CLEAR ?auto_10560 ) ( not ( = ?auto_10559 ?auto_10560 ) ) ( not ( = ?auto_10559 ?auto_10572 ) ) ( not ( = ?auto_10560 ?auto_10572 ) ) ( not ( = ?auto_10567 ?auto_10577 ) ) ( IS-CRATE ?auto_10559 ) ( SURFACE-AT ?auto_10559 ?auto_10563 ) ( ON ?auto_10559 ?auto_10578 ) ( CLEAR ?auto_10559 ) ( not ( = ?auto_10558 ?auto_10559 ) ) ( not ( = ?auto_10558 ?auto_10578 ) ) ( not ( = ?auto_10559 ?auto_10578 ) ) ( IS-CRATE ?auto_10558 ) ( not ( = ?auto_10575 ?auto_10566 ) ) ( HOIST-AT ?auto_10580 ?auto_10575 ) ( AVAILABLE ?auto_10580 ) ( SURFACE-AT ?auto_10558 ?auto_10575 ) ( ON ?auto_10558 ?auto_10576 ) ( CLEAR ?auto_10558 ) ( not ( = ?auto_10557 ?auto_10558 ) ) ( not ( = ?auto_10557 ?auto_10576 ) ) ( not ( = ?auto_10558 ?auto_10576 ) ) ( not ( = ?auto_10567 ?auto_10580 ) ) ( IS-CRATE ?auto_10557 ) ( not ( = ?auto_10571 ?auto_10566 ) ) ( HOIST-AT ?auto_10570 ?auto_10571 ) ( SURFACE-AT ?auto_10557 ?auto_10571 ) ( ON ?auto_10557 ?auto_10581 ) ( CLEAR ?auto_10557 ) ( not ( = ?auto_10556 ?auto_10557 ) ) ( not ( = ?auto_10556 ?auto_10581 ) ) ( not ( = ?auto_10557 ?auto_10581 ) ) ( not ( = ?auto_10567 ?auto_10570 ) ) ( IS-CRATE ?auto_10556 ) ( AVAILABLE ?auto_10570 ) ( SURFACE-AT ?auto_10556 ?auto_10571 ) ( ON ?auto_10556 ?auto_10579 ) ( CLEAR ?auto_10556 ) ( not ( = ?auto_10555 ?auto_10556 ) ) ( not ( = ?auto_10555 ?auto_10579 ) ) ( not ( = ?auto_10556 ?auto_10579 ) ) ( IS-CRATE ?auto_10555 ) ( not ( = ?auto_10569 ?auto_10566 ) ) ( HOIST-AT ?auto_10573 ?auto_10569 ) ( AVAILABLE ?auto_10573 ) ( SURFACE-AT ?auto_10555 ?auto_10569 ) ( ON ?auto_10555 ?auto_10582 ) ( CLEAR ?auto_10555 ) ( not ( = ?auto_10554 ?auto_10555 ) ) ( not ( = ?auto_10554 ?auto_10582 ) ) ( not ( = ?auto_10555 ?auto_10582 ) ) ( not ( = ?auto_10567 ?auto_10573 ) ) ( SURFACE-AT ?auto_10553 ?auto_10566 ) ( CLEAR ?auto_10553 ) ( IS-CRATE ?auto_10554 ) ( AVAILABLE ?auto_10567 ) ( AVAILABLE ?auto_10564 ) ( SURFACE-AT ?auto_10554 ?auto_10563 ) ( ON ?auto_10554 ?auto_10568 ) ( CLEAR ?auto_10554 ) ( TRUCK-AT ?auto_10565 ?auto_10566 ) ( not ( = ?auto_10553 ?auto_10554 ) ) ( not ( = ?auto_10553 ?auto_10568 ) ) ( not ( = ?auto_10554 ?auto_10568 ) ) ( not ( = ?auto_10553 ?auto_10555 ) ) ( not ( = ?auto_10553 ?auto_10582 ) ) ( not ( = ?auto_10555 ?auto_10568 ) ) ( not ( = ?auto_10569 ?auto_10563 ) ) ( not ( = ?auto_10573 ?auto_10564 ) ) ( not ( = ?auto_10582 ?auto_10568 ) ) ( not ( = ?auto_10553 ?auto_10556 ) ) ( not ( = ?auto_10553 ?auto_10579 ) ) ( not ( = ?auto_10554 ?auto_10556 ) ) ( not ( = ?auto_10554 ?auto_10579 ) ) ( not ( = ?auto_10556 ?auto_10582 ) ) ( not ( = ?auto_10556 ?auto_10568 ) ) ( not ( = ?auto_10571 ?auto_10569 ) ) ( not ( = ?auto_10571 ?auto_10563 ) ) ( not ( = ?auto_10570 ?auto_10573 ) ) ( not ( = ?auto_10570 ?auto_10564 ) ) ( not ( = ?auto_10579 ?auto_10582 ) ) ( not ( = ?auto_10579 ?auto_10568 ) ) ( not ( = ?auto_10553 ?auto_10557 ) ) ( not ( = ?auto_10553 ?auto_10581 ) ) ( not ( = ?auto_10554 ?auto_10557 ) ) ( not ( = ?auto_10554 ?auto_10581 ) ) ( not ( = ?auto_10555 ?auto_10557 ) ) ( not ( = ?auto_10555 ?auto_10581 ) ) ( not ( = ?auto_10557 ?auto_10579 ) ) ( not ( = ?auto_10557 ?auto_10582 ) ) ( not ( = ?auto_10557 ?auto_10568 ) ) ( not ( = ?auto_10581 ?auto_10579 ) ) ( not ( = ?auto_10581 ?auto_10582 ) ) ( not ( = ?auto_10581 ?auto_10568 ) ) ( not ( = ?auto_10553 ?auto_10558 ) ) ( not ( = ?auto_10553 ?auto_10576 ) ) ( not ( = ?auto_10554 ?auto_10558 ) ) ( not ( = ?auto_10554 ?auto_10576 ) ) ( not ( = ?auto_10555 ?auto_10558 ) ) ( not ( = ?auto_10555 ?auto_10576 ) ) ( not ( = ?auto_10556 ?auto_10558 ) ) ( not ( = ?auto_10556 ?auto_10576 ) ) ( not ( = ?auto_10558 ?auto_10581 ) ) ( not ( = ?auto_10558 ?auto_10579 ) ) ( not ( = ?auto_10558 ?auto_10582 ) ) ( not ( = ?auto_10558 ?auto_10568 ) ) ( not ( = ?auto_10575 ?auto_10571 ) ) ( not ( = ?auto_10575 ?auto_10569 ) ) ( not ( = ?auto_10575 ?auto_10563 ) ) ( not ( = ?auto_10580 ?auto_10570 ) ) ( not ( = ?auto_10580 ?auto_10573 ) ) ( not ( = ?auto_10580 ?auto_10564 ) ) ( not ( = ?auto_10576 ?auto_10581 ) ) ( not ( = ?auto_10576 ?auto_10579 ) ) ( not ( = ?auto_10576 ?auto_10582 ) ) ( not ( = ?auto_10576 ?auto_10568 ) ) ( not ( = ?auto_10553 ?auto_10559 ) ) ( not ( = ?auto_10553 ?auto_10578 ) ) ( not ( = ?auto_10554 ?auto_10559 ) ) ( not ( = ?auto_10554 ?auto_10578 ) ) ( not ( = ?auto_10555 ?auto_10559 ) ) ( not ( = ?auto_10555 ?auto_10578 ) ) ( not ( = ?auto_10556 ?auto_10559 ) ) ( not ( = ?auto_10556 ?auto_10578 ) ) ( not ( = ?auto_10557 ?auto_10559 ) ) ( not ( = ?auto_10557 ?auto_10578 ) ) ( not ( = ?auto_10559 ?auto_10576 ) ) ( not ( = ?auto_10559 ?auto_10581 ) ) ( not ( = ?auto_10559 ?auto_10579 ) ) ( not ( = ?auto_10559 ?auto_10582 ) ) ( not ( = ?auto_10559 ?auto_10568 ) ) ( not ( = ?auto_10578 ?auto_10576 ) ) ( not ( = ?auto_10578 ?auto_10581 ) ) ( not ( = ?auto_10578 ?auto_10579 ) ) ( not ( = ?auto_10578 ?auto_10582 ) ) ( not ( = ?auto_10578 ?auto_10568 ) ) ( not ( = ?auto_10553 ?auto_10560 ) ) ( not ( = ?auto_10553 ?auto_10572 ) ) ( not ( = ?auto_10554 ?auto_10560 ) ) ( not ( = ?auto_10554 ?auto_10572 ) ) ( not ( = ?auto_10555 ?auto_10560 ) ) ( not ( = ?auto_10555 ?auto_10572 ) ) ( not ( = ?auto_10556 ?auto_10560 ) ) ( not ( = ?auto_10556 ?auto_10572 ) ) ( not ( = ?auto_10557 ?auto_10560 ) ) ( not ( = ?auto_10557 ?auto_10572 ) ) ( not ( = ?auto_10558 ?auto_10560 ) ) ( not ( = ?auto_10558 ?auto_10572 ) ) ( not ( = ?auto_10560 ?auto_10578 ) ) ( not ( = ?auto_10560 ?auto_10576 ) ) ( not ( = ?auto_10560 ?auto_10581 ) ) ( not ( = ?auto_10560 ?auto_10579 ) ) ( not ( = ?auto_10560 ?auto_10582 ) ) ( not ( = ?auto_10560 ?auto_10568 ) ) ( not ( = ?auto_10574 ?auto_10563 ) ) ( not ( = ?auto_10574 ?auto_10575 ) ) ( not ( = ?auto_10574 ?auto_10571 ) ) ( not ( = ?auto_10574 ?auto_10569 ) ) ( not ( = ?auto_10577 ?auto_10564 ) ) ( not ( = ?auto_10577 ?auto_10580 ) ) ( not ( = ?auto_10577 ?auto_10570 ) ) ( not ( = ?auto_10577 ?auto_10573 ) ) ( not ( = ?auto_10572 ?auto_10578 ) ) ( not ( = ?auto_10572 ?auto_10576 ) ) ( not ( = ?auto_10572 ?auto_10581 ) ) ( not ( = ?auto_10572 ?auto_10579 ) ) ( not ( = ?auto_10572 ?auto_10582 ) ) ( not ( = ?auto_10572 ?auto_10568 ) ) ( not ( = ?auto_10553 ?auto_10561 ) ) ( not ( = ?auto_10553 ?auto_10562 ) ) ( not ( = ?auto_10554 ?auto_10561 ) ) ( not ( = ?auto_10554 ?auto_10562 ) ) ( not ( = ?auto_10555 ?auto_10561 ) ) ( not ( = ?auto_10555 ?auto_10562 ) ) ( not ( = ?auto_10556 ?auto_10561 ) ) ( not ( = ?auto_10556 ?auto_10562 ) ) ( not ( = ?auto_10557 ?auto_10561 ) ) ( not ( = ?auto_10557 ?auto_10562 ) ) ( not ( = ?auto_10558 ?auto_10561 ) ) ( not ( = ?auto_10558 ?auto_10562 ) ) ( not ( = ?auto_10559 ?auto_10561 ) ) ( not ( = ?auto_10559 ?auto_10562 ) ) ( not ( = ?auto_10561 ?auto_10572 ) ) ( not ( = ?auto_10561 ?auto_10578 ) ) ( not ( = ?auto_10561 ?auto_10576 ) ) ( not ( = ?auto_10561 ?auto_10581 ) ) ( not ( = ?auto_10561 ?auto_10579 ) ) ( not ( = ?auto_10561 ?auto_10582 ) ) ( not ( = ?auto_10561 ?auto_10568 ) ) ( not ( = ?auto_10562 ?auto_10572 ) ) ( not ( = ?auto_10562 ?auto_10578 ) ) ( not ( = ?auto_10562 ?auto_10576 ) ) ( not ( = ?auto_10562 ?auto_10581 ) ) ( not ( = ?auto_10562 ?auto_10579 ) ) ( not ( = ?auto_10562 ?auto_10582 ) ) ( not ( = ?auto_10562 ?auto_10568 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_10553 ?auto_10554 ?auto_10555 ?auto_10556 ?auto_10557 ?auto_10558 ?auto_10559 ?auto_10560 )
      ( MAKE-1CRATE ?auto_10560 ?auto_10561 )
      ( MAKE-8CRATE-VERIFY ?auto_10553 ?auto_10554 ?auto_10555 ?auto_10556 ?auto_10557 ?auto_10558 ?auto_10559 ?auto_10560 ?auto_10561 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_10603 - SURFACE
      ?auto_10604 - SURFACE
      ?auto_10605 - SURFACE
      ?auto_10606 - SURFACE
      ?auto_10607 - SURFACE
      ?auto_10608 - SURFACE
      ?auto_10609 - SURFACE
      ?auto_10610 - SURFACE
      ?auto_10611 - SURFACE
      ?auto_10612 - SURFACE
    )
    :vars
    (
      ?auto_10618 - HOIST
      ?auto_10617 - PLACE
      ?auto_10615 - PLACE
      ?auto_10613 - HOIST
      ?auto_10614 - SURFACE
      ?auto_10621 - PLACE
      ?auto_10629 - HOIST
      ?auto_10620 - SURFACE
      ?auto_10623 - PLACE
      ?auto_10628 - HOIST
      ?auto_10630 - SURFACE
      ?auto_10631 - SURFACE
      ?auto_10626 - SURFACE
      ?auto_10619 - PLACE
      ?auto_10633 - HOIST
      ?auto_10622 - SURFACE
      ?auto_10632 - SURFACE
      ?auto_10627 - PLACE
      ?auto_10634 - HOIST
      ?auto_10625 - SURFACE
      ?auto_10624 - SURFACE
      ?auto_10616 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10618 ?auto_10617 ) ( IS-CRATE ?auto_10612 ) ( not ( = ?auto_10615 ?auto_10617 ) ) ( HOIST-AT ?auto_10613 ?auto_10615 ) ( SURFACE-AT ?auto_10612 ?auto_10615 ) ( ON ?auto_10612 ?auto_10614 ) ( CLEAR ?auto_10612 ) ( not ( = ?auto_10611 ?auto_10612 ) ) ( not ( = ?auto_10611 ?auto_10614 ) ) ( not ( = ?auto_10612 ?auto_10614 ) ) ( not ( = ?auto_10618 ?auto_10613 ) ) ( IS-CRATE ?auto_10611 ) ( not ( = ?auto_10621 ?auto_10617 ) ) ( HOIST-AT ?auto_10629 ?auto_10621 ) ( SURFACE-AT ?auto_10611 ?auto_10621 ) ( ON ?auto_10611 ?auto_10620 ) ( CLEAR ?auto_10611 ) ( not ( = ?auto_10610 ?auto_10611 ) ) ( not ( = ?auto_10610 ?auto_10620 ) ) ( not ( = ?auto_10611 ?auto_10620 ) ) ( not ( = ?auto_10618 ?auto_10629 ) ) ( IS-CRATE ?auto_10610 ) ( not ( = ?auto_10623 ?auto_10617 ) ) ( HOIST-AT ?auto_10628 ?auto_10623 ) ( AVAILABLE ?auto_10628 ) ( SURFACE-AT ?auto_10610 ?auto_10623 ) ( ON ?auto_10610 ?auto_10630 ) ( CLEAR ?auto_10610 ) ( not ( = ?auto_10609 ?auto_10610 ) ) ( not ( = ?auto_10609 ?auto_10630 ) ) ( not ( = ?auto_10610 ?auto_10630 ) ) ( not ( = ?auto_10618 ?auto_10628 ) ) ( IS-CRATE ?auto_10609 ) ( SURFACE-AT ?auto_10609 ?auto_10621 ) ( ON ?auto_10609 ?auto_10631 ) ( CLEAR ?auto_10609 ) ( not ( = ?auto_10608 ?auto_10609 ) ) ( not ( = ?auto_10608 ?auto_10631 ) ) ( not ( = ?auto_10609 ?auto_10631 ) ) ( IS-CRATE ?auto_10608 ) ( AVAILABLE ?auto_10613 ) ( SURFACE-AT ?auto_10608 ?auto_10615 ) ( ON ?auto_10608 ?auto_10626 ) ( CLEAR ?auto_10608 ) ( not ( = ?auto_10607 ?auto_10608 ) ) ( not ( = ?auto_10607 ?auto_10626 ) ) ( not ( = ?auto_10608 ?auto_10626 ) ) ( IS-CRATE ?auto_10607 ) ( not ( = ?auto_10619 ?auto_10617 ) ) ( HOIST-AT ?auto_10633 ?auto_10619 ) ( SURFACE-AT ?auto_10607 ?auto_10619 ) ( ON ?auto_10607 ?auto_10622 ) ( CLEAR ?auto_10607 ) ( not ( = ?auto_10606 ?auto_10607 ) ) ( not ( = ?auto_10606 ?auto_10622 ) ) ( not ( = ?auto_10607 ?auto_10622 ) ) ( not ( = ?auto_10618 ?auto_10633 ) ) ( IS-CRATE ?auto_10606 ) ( AVAILABLE ?auto_10633 ) ( SURFACE-AT ?auto_10606 ?auto_10619 ) ( ON ?auto_10606 ?auto_10632 ) ( CLEAR ?auto_10606 ) ( not ( = ?auto_10605 ?auto_10606 ) ) ( not ( = ?auto_10605 ?auto_10632 ) ) ( not ( = ?auto_10606 ?auto_10632 ) ) ( IS-CRATE ?auto_10605 ) ( not ( = ?auto_10627 ?auto_10617 ) ) ( HOIST-AT ?auto_10634 ?auto_10627 ) ( AVAILABLE ?auto_10634 ) ( SURFACE-AT ?auto_10605 ?auto_10627 ) ( ON ?auto_10605 ?auto_10625 ) ( CLEAR ?auto_10605 ) ( not ( = ?auto_10604 ?auto_10605 ) ) ( not ( = ?auto_10604 ?auto_10625 ) ) ( not ( = ?auto_10605 ?auto_10625 ) ) ( not ( = ?auto_10618 ?auto_10634 ) ) ( SURFACE-AT ?auto_10603 ?auto_10617 ) ( CLEAR ?auto_10603 ) ( IS-CRATE ?auto_10604 ) ( AVAILABLE ?auto_10618 ) ( AVAILABLE ?auto_10629 ) ( SURFACE-AT ?auto_10604 ?auto_10621 ) ( ON ?auto_10604 ?auto_10624 ) ( CLEAR ?auto_10604 ) ( TRUCK-AT ?auto_10616 ?auto_10617 ) ( not ( = ?auto_10603 ?auto_10604 ) ) ( not ( = ?auto_10603 ?auto_10624 ) ) ( not ( = ?auto_10604 ?auto_10624 ) ) ( not ( = ?auto_10603 ?auto_10605 ) ) ( not ( = ?auto_10603 ?auto_10625 ) ) ( not ( = ?auto_10605 ?auto_10624 ) ) ( not ( = ?auto_10627 ?auto_10621 ) ) ( not ( = ?auto_10634 ?auto_10629 ) ) ( not ( = ?auto_10625 ?auto_10624 ) ) ( not ( = ?auto_10603 ?auto_10606 ) ) ( not ( = ?auto_10603 ?auto_10632 ) ) ( not ( = ?auto_10604 ?auto_10606 ) ) ( not ( = ?auto_10604 ?auto_10632 ) ) ( not ( = ?auto_10606 ?auto_10625 ) ) ( not ( = ?auto_10606 ?auto_10624 ) ) ( not ( = ?auto_10619 ?auto_10627 ) ) ( not ( = ?auto_10619 ?auto_10621 ) ) ( not ( = ?auto_10633 ?auto_10634 ) ) ( not ( = ?auto_10633 ?auto_10629 ) ) ( not ( = ?auto_10632 ?auto_10625 ) ) ( not ( = ?auto_10632 ?auto_10624 ) ) ( not ( = ?auto_10603 ?auto_10607 ) ) ( not ( = ?auto_10603 ?auto_10622 ) ) ( not ( = ?auto_10604 ?auto_10607 ) ) ( not ( = ?auto_10604 ?auto_10622 ) ) ( not ( = ?auto_10605 ?auto_10607 ) ) ( not ( = ?auto_10605 ?auto_10622 ) ) ( not ( = ?auto_10607 ?auto_10632 ) ) ( not ( = ?auto_10607 ?auto_10625 ) ) ( not ( = ?auto_10607 ?auto_10624 ) ) ( not ( = ?auto_10622 ?auto_10632 ) ) ( not ( = ?auto_10622 ?auto_10625 ) ) ( not ( = ?auto_10622 ?auto_10624 ) ) ( not ( = ?auto_10603 ?auto_10608 ) ) ( not ( = ?auto_10603 ?auto_10626 ) ) ( not ( = ?auto_10604 ?auto_10608 ) ) ( not ( = ?auto_10604 ?auto_10626 ) ) ( not ( = ?auto_10605 ?auto_10608 ) ) ( not ( = ?auto_10605 ?auto_10626 ) ) ( not ( = ?auto_10606 ?auto_10608 ) ) ( not ( = ?auto_10606 ?auto_10626 ) ) ( not ( = ?auto_10608 ?auto_10622 ) ) ( not ( = ?auto_10608 ?auto_10632 ) ) ( not ( = ?auto_10608 ?auto_10625 ) ) ( not ( = ?auto_10608 ?auto_10624 ) ) ( not ( = ?auto_10615 ?auto_10619 ) ) ( not ( = ?auto_10615 ?auto_10627 ) ) ( not ( = ?auto_10615 ?auto_10621 ) ) ( not ( = ?auto_10613 ?auto_10633 ) ) ( not ( = ?auto_10613 ?auto_10634 ) ) ( not ( = ?auto_10613 ?auto_10629 ) ) ( not ( = ?auto_10626 ?auto_10622 ) ) ( not ( = ?auto_10626 ?auto_10632 ) ) ( not ( = ?auto_10626 ?auto_10625 ) ) ( not ( = ?auto_10626 ?auto_10624 ) ) ( not ( = ?auto_10603 ?auto_10609 ) ) ( not ( = ?auto_10603 ?auto_10631 ) ) ( not ( = ?auto_10604 ?auto_10609 ) ) ( not ( = ?auto_10604 ?auto_10631 ) ) ( not ( = ?auto_10605 ?auto_10609 ) ) ( not ( = ?auto_10605 ?auto_10631 ) ) ( not ( = ?auto_10606 ?auto_10609 ) ) ( not ( = ?auto_10606 ?auto_10631 ) ) ( not ( = ?auto_10607 ?auto_10609 ) ) ( not ( = ?auto_10607 ?auto_10631 ) ) ( not ( = ?auto_10609 ?auto_10626 ) ) ( not ( = ?auto_10609 ?auto_10622 ) ) ( not ( = ?auto_10609 ?auto_10632 ) ) ( not ( = ?auto_10609 ?auto_10625 ) ) ( not ( = ?auto_10609 ?auto_10624 ) ) ( not ( = ?auto_10631 ?auto_10626 ) ) ( not ( = ?auto_10631 ?auto_10622 ) ) ( not ( = ?auto_10631 ?auto_10632 ) ) ( not ( = ?auto_10631 ?auto_10625 ) ) ( not ( = ?auto_10631 ?auto_10624 ) ) ( not ( = ?auto_10603 ?auto_10610 ) ) ( not ( = ?auto_10603 ?auto_10630 ) ) ( not ( = ?auto_10604 ?auto_10610 ) ) ( not ( = ?auto_10604 ?auto_10630 ) ) ( not ( = ?auto_10605 ?auto_10610 ) ) ( not ( = ?auto_10605 ?auto_10630 ) ) ( not ( = ?auto_10606 ?auto_10610 ) ) ( not ( = ?auto_10606 ?auto_10630 ) ) ( not ( = ?auto_10607 ?auto_10610 ) ) ( not ( = ?auto_10607 ?auto_10630 ) ) ( not ( = ?auto_10608 ?auto_10610 ) ) ( not ( = ?auto_10608 ?auto_10630 ) ) ( not ( = ?auto_10610 ?auto_10631 ) ) ( not ( = ?auto_10610 ?auto_10626 ) ) ( not ( = ?auto_10610 ?auto_10622 ) ) ( not ( = ?auto_10610 ?auto_10632 ) ) ( not ( = ?auto_10610 ?auto_10625 ) ) ( not ( = ?auto_10610 ?auto_10624 ) ) ( not ( = ?auto_10623 ?auto_10621 ) ) ( not ( = ?auto_10623 ?auto_10615 ) ) ( not ( = ?auto_10623 ?auto_10619 ) ) ( not ( = ?auto_10623 ?auto_10627 ) ) ( not ( = ?auto_10628 ?auto_10629 ) ) ( not ( = ?auto_10628 ?auto_10613 ) ) ( not ( = ?auto_10628 ?auto_10633 ) ) ( not ( = ?auto_10628 ?auto_10634 ) ) ( not ( = ?auto_10630 ?auto_10631 ) ) ( not ( = ?auto_10630 ?auto_10626 ) ) ( not ( = ?auto_10630 ?auto_10622 ) ) ( not ( = ?auto_10630 ?auto_10632 ) ) ( not ( = ?auto_10630 ?auto_10625 ) ) ( not ( = ?auto_10630 ?auto_10624 ) ) ( not ( = ?auto_10603 ?auto_10611 ) ) ( not ( = ?auto_10603 ?auto_10620 ) ) ( not ( = ?auto_10604 ?auto_10611 ) ) ( not ( = ?auto_10604 ?auto_10620 ) ) ( not ( = ?auto_10605 ?auto_10611 ) ) ( not ( = ?auto_10605 ?auto_10620 ) ) ( not ( = ?auto_10606 ?auto_10611 ) ) ( not ( = ?auto_10606 ?auto_10620 ) ) ( not ( = ?auto_10607 ?auto_10611 ) ) ( not ( = ?auto_10607 ?auto_10620 ) ) ( not ( = ?auto_10608 ?auto_10611 ) ) ( not ( = ?auto_10608 ?auto_10620 ) ) ( not ( = ?auto_10609 ?auto_10611 ) ) ( not ( = ?auto_10609 ?auto_10620 ) ) ( not ( = ?auto_10611 ?auto_10630 ) ) ( not ( = ?auto_10611 ?auto_10631 ) ) ( not ( = ?auto_10611 ?auto_10626 ) ) ( not ( = ?auto_10611 ?auto_10622 ) ) ( not ( = ?auto_10611 ?auto_10632 ) ) ( not ( = ?auto_10611 ?auto_10625 ) ) ( not ( = ?auto_10611 ?auto_10624 ) ) ( not ( = ?auto_10620 ?auto_10630 ) ) ( not ( = ?auto_10620 ?auto_10631 ) ) ( not ( = ?auto_10620 ?auto_10626 ) ) ( not ( = ?auto_10620 ?auto_10622 ) ) ( not ( = ?auto_10620 ?auto_10632 ) ) ( not ( = ?auto_10620 ?auto_10625 ) ) ( not ( = ?auto_10620 ?auto_10624 ) ) ( not ( = ?auto_10603 ?auto_10612 ) ) ( not ( = ?auto_10603 ?auto_10614 ) ) ( not ( = ?auto_10604 ?auto_10612 ) ) ( not ( = ?auto_10604 ?auto_10614 ) ) ( not ( = ?auto_10605 ?auto_10612 ) ) ( not ( = ?auto_10605 ?auto_10614 ) ) ( not ( = ?auto_10606 ?auto_10612 ) ) ( not ( = ?auto_10606 ?auto_10614 ) ) ( not ( = ?auto_10607 ?auto_10612 ) ) ( not ( = ?auto_10607 ?auto_10614 ) ) ( not ( = ?auto_10608 ?auto_10612 ) ) ( not ( = ?auto_10608 ?auto_10614 ) ) ( not ( = ?auto_10609 ?auto_10612 ) ) ( not ( = ?auto_10609 ?auto_10614 ) ) ( not ( = ?auto_10610 ?auto_10612 ) ) ( not ( = ?auto_10610 ?auto_10614 ) ) ( not ( = ?auto_10612 ?auto_10620 ) ) ( not ( = ?auto_10612 ?auto_10630 ) ) ( not ( = ?auto_10612 ?auto_10631 ) ) ( not ( = ?auto_10612 ?auto_10626 ) ) ( not ( = ?auto_10612 ?auto_10622 ) ) ( not ( = ?auto_10612 ?auto_10632 ) ) ( not ( = ?auto_10612 ?auto_10625 ) ) ( not ( = ?auto_10612 ?auto_10624 ) ) ( not ( = ?auto_10614 ?auto_10620 ) ) ( not ( = ?auto_10614 ?auto_10630 ) ) ( not ( = ?auto_10614 ?auto_10631 ) ) ( not ( = ?auto_10614 ?auto_10626 ) ) ( not ( = ?auto_10614 ?auto_10622 ) ) ( not ( = ?auto_10614 ?auto_10632 ) ) ( not ( = ?auto_10614 ?auto_10625 ) ) ( not ( = ?auto_10614 ?auto_10624 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_10603 ?auto_10604 ?auto_10605 ?auto_10606 ?auto_10607 ?auto_10608 ?auto_10609 ?auto_10610 ?auto_10611 )
      ( MAKE-1CRATE ?auto_10611 ?auto_10612 )
      ( MAKE-9CRATE-VERIFY ?auto_10603 ?auto_10604 ?auto_10605 ?auto_10606 ?auto_10607 ?auto_10608 ?auto_10609 ?auto_10610 ?auto_10611 ?auto_10612 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_10656 - SURFACE
      ?auto_10657 - SURFACE
      ?auto_10658 - SURFACE
      ?auto_10659 - SURFACE
      ?auto_10660 - SURFACE
      ?auto_10661 - SURFACE
      ?auto_10662 - SURFACE
      ?auto_10663 - SURFACE
      ?auto_10664 - SURFACE
      ?auto_10665 - SURFACE
      ?auto_10666 - SURFACE
    )
    :vars
    (
      ?auto_10667 - HOIST
      ?auto_10670 - PLACE
      ?auto_10668 - PLACE
      ?auto_10669 - HOIST
      ?auto_10672 - SURFACE
      ?auto_10676 - PLACE
      ?auto_10689 - HOIST
      ?auto_10679 - SURFACE
      ?auto_10686 - PLACE
      ?auto_10688 - HOIST
      ?auto_10678 - SURFACE
      ?auto_10687 - PLACE
      ?auto_10684 - HOIST
      ?auto_10680 - SURFACE
      ?auto_10675 - SURFACE
      ?auto_10683 - SURFACE
      ?auto_10677 - PLACE
      ?auto_10681 - HOIST
      ?auto_10685 - SURFACE
      ?auto_10674 - SURFACE
      ?auto_10673 - SURFACE
      ?auto_10682 - SURFACE
      ?auto_10671 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10667 ?auto_10670 ) ( IS-CRATE ?auto_10666 ) ( not ( = ?auto_10668 ?auto_10670 ) ) ( HOIST-AT ?auto_10669 ?auto_10668 ) ( SURFACE-AT ?auto_10666 ?auto_10668 ) ( ON ?auto_10666 ?auto_10672 ) ( CLEAR ?auto_10666 ) ( not ( = ?auto_10665 ?auto_10666 ) ) ( not ( = ?auto_10665 ?auto_10672 ) ) ( not ( = ?auto_10666 ?auto_10672 ) ) ( not ( = ?auto_10667 ?auto_10669 ) ) ( IS-CRATE ?auto_10665 ) ( not ( = ?auto_10676 ?auto_10670 ) ) ( HOIST-AT ?auto_10689 ?auto_10676 ) ( SURFACE-AT ?auto_10665 ?auto_10676 ) ( ON ?auto_10665 ?auto_10679 ) ( CLEAR ?auto_10665 ) ( not ( = ?auto_10664 ?auto_10665 ) ) ( not ( = ?auto_10664 ?auto_10679 ) ) ( not ( = ?auto_10665 ?auto_10679 ) ) ( not ( = ?auto_10667 ?auto_10689 ) ) ( IS-CRATE ?auto_10664 ) ( not ( = ?auto_10686 ?auto_10670 ) ) ( HOIST-AT ?auto_10688 ?auto_10686 ) ( SURFACE-AT ?auto_10664 ?auto_10686 ) ( ON ?auto_10664 ?auto_10678 ) ( CLEAR ?auto_10664 ) ( not ( = ?auto_10663 ?auto_10664 ) ) ( not ( = ?auto_10663 ?auto_10678 ) ) ( not ( = ?auto_10664 ?auto_10678 ) ) ( not ( = ?auto_10667 ?auto_10688 ) ) ( IS-CRATE ?auto_10663 ) ( not ( = ?auto_10687 ?auto_10670 ) ) ( HOIST-AT ?auto_10684 ?auto_10687 ) ( AVAILABLE ?auto_10684 ) ( SURFACE-AT ?auto_10663 ?auto_10687 ) ( ON ?auto_10663 ?auto_10680 ) ( CLEAR ?auto_10663 ) ( not ( = ?auto_10662 ?auto_10663 ) ) ( not ( = ?auto_10662 ?auto_10680 ) ) ( not ( = ?auto_10663 ?auto_10680 ) ) ( not ( = ?auto_10667 ?auto_10684 ) ) ( IS-CRATE ?auto_10662 ) ( SURFACE-AT ?auto_10662 ?auto_10686 ) ( ON ?auto_10662 ?auto_10675 ) ( CLEAR ?auto_10662 ) ( not ( = ?auto_10661 ?auto_10662 ) ) ( not ( = ?auto_10661 ?auto_10675 ) ) ( not ( = ?auto_10662 ?auto_10675 ) ) ( IS-CRATE ?auto_10661 ) ( AVAILABLE ?auto_10689 ) ( SURFACE-AT ?auto_10661 ?auto_10676 ) ( ON ?auto_10661 ?auto_10683 ) ( CLEAR ?auto_10661 ) ( not ( = ?auto_10660 ?auto_10661 ) ) ( not ( = ?auto_10660 ?auto_10683 ) ) ( not ( = ?auto_10661 ?auto_10683 ) ) ( IS-CRATE ?auto_10660 ) ( not ( = ?auto_10677 ?auto_10670 ) ) ( HOIST-AT ?auto_10681 ?auto_10677 ) ( SURFACE-AT ?auto_10660 ?auto_10677 ) ( ON ?auto_10660 ?auto_10685 ) ( CLEAR ?auto_10660 ) ( not ( = ?auto_10659 ?auto_10660 ) ) ( not ( = ?auto_10659 ?auto_10685 ) ) ( not ( = ?auto_10660 ?auto_10685 ) ) ( not ( = ?auto_10667 ?auto_10681 ) ) ( IS-CRATE ?auto_10659 ) ( AVAILABLE ?auto_10681 ) ( SURFACE-AT ?auto_10659 ?auto_10677 ) ( ON ?auto_10659 ?auto_10674 ) ( CLEAR ?auto_10659 ) ( not ( = ?auto_10658 ?auto_10659 ) ) ( not ( = ?auto_10658 ?auto_10674 ) ) ( not ( = ?auto_10659 ?auto_10674 ) ) ( IS-CRATE ?auto_10658 ) ( AVAILABLE ?auto_10669 ) ( SURFACE-AT ?auto_10658 ?auto_10668 ) ( ON ?auto_10658 ?auto_10673 ) ( CLEAR ?auto_10658 ) ( not ( = ?auto_10657 ?auto_10658 ) ) ( not ( = ?auto_10657 ?auto_10673 ) ) ( not ( = ?auto_10658 ?auto_10673 ) ) ( SURFACE-AT ?auto_10656 ?auto_10670 ) ( CLEAR ?auto_10656 ) ( IS-CRATE ?auto_10657 ) ( AVAILABLE ?auto_10667 ) ( AVAILABLE ?auto_10688 ) ( SURFACE-AT ?auto_10657 ?auto_10686 ) ( ON ?auto_10657 ?auto_10682 ) ( CLEAR ?auto_10657 ) ( TRUCK-AT ?auto_10671 ?auto_10670 ) ( not ( = ?auto_10656 ?auto_10657 ) ) ( not ( = ?auto_10656 ?auto_10682 ) ) ( not ( = ?auto_10657 ?auto_10682 ) ) ( not ( = ?auto_10656 ?auto_10658 ) ) ( not ( = ?auto_10656 ?auto_10673 ) ) ( not ( = ?auto_10658 ?auto_10682 ) ) ( not ( = ?auto_10668 ?auto_10686 ) ) ( not ( = ?auto_10669 ?auto_10688 ) ) ( not ( = ?auto_10673 ?auto_10682 ) ) ( not ( = ?auto_10656 ?auto_10659 ) ) ( not ( = ?auto_10656 ?auto_10674 ) ) ( not ( = ?auto_10657 ?auto_10659 ) ) ( not ( = ?auto_10657 ?auto_10674 ) ) ( not ( = ?auto_10659 ?auto_10673 ) ) ( not ( = ?auto_10659 ?auto_10682 ) ) ( not ( = ?auto_10677 ?auto_10668 ) ) ( not ( = ?auto_10677 ?auto_10686 ) ) ( not ( = ?auto_10681 ?auto_10669 ) ) ( not ( = ?auto_10681 ?auto_10688 ) ) ( not ( = ?auto_10674 ?auto_10673 ) ) ( not ( = ?auto_10674 ?auto_10682 ) ) ( not ( = ?auto_10656 ?auto_10660 ) ) ( not ( = ?auto_10656 ?auto_10685 ) ) ( not ( = ?auto_10657 ?auto_10660 ) ) ( not ( = ?auto_10657 ?auto_10685 ) ) ( not ( = ?auto_10658 ?auto_10660 ) ) ( not ( = ?auto_10658 ?auto_10685 ) ) ( not ( = ?auto_10660 ?auto_10674 ) ) ( not ( = ?auto_10660 ?auto_10673 ) ) ( not ( = ?auto_10660 ?auto_10682 ) ) ( not ( = ?auto_10685 ?auto_10674 ) ) ( not ( = ?auto_10685 ?auto_10673 ) ) ( not ( = ?auto_10685 ?auto_10682 ) ) ( not ( = ?auto_10656 ?auto_10661 ) ) ( not ( = ?auto_10656 ?auto_10683 ) ) ( not ( = ?auto_10657 ?auto_10661 ) ) ( not ( = ?auto_10657 ?auto_10683 ) ) ( not ( = ?auto_10658 ?auto_10661 ) ) ( not ( = ?auto_10658 ?auto_10683 ) ) ( not ( = ?auto_10659 ?auto_10661 ) ) ( not ( = ?auto_10659 ?auto_10683 ) ) ( not ( = ?auto_10661 ?auto_10685 ) ) ( not ( = ?auto_10661 ?auto_10674 ) ) ( not ( = ?auto_10661 ?auto_10673 ) ) ( not ( = ?auto_10661 ?auto_10682 ) ) ( not ( = ?auto_10676 ?auto_10677 ) ) ( not ( = ?auto_10676 ?auto_10668 ) ) ( not ( = ?auto_10676 ?auto_10686 ) ) ( not ( = ?auto_10689 ?auto_10681 ) ) ( not ( = ?auto_10689 ?auto_10669 ) ) ( not ( = ?auto_10689 ?auto_10688 ) ) ( not ( = ?auto_10683 ?auto_10685 ) ) ( not ( = ?auto_10683 ?auto_10674 ) ) ( not ( = ?auto_10683 ?auto_10673 ) ) ( not ( = ?auto_10683 ?auto_10682 ) ) ( not ( = ?auto_10656 ?auto_10662 ) ) ( not ( = ?auto_10656 ?auto_10675 ) ) ( not ( = ?auto_10657 ?auto_10662 ) ) ( not ( = ?auto_10657 ?auto_10675 ) ) ( not ( = ?auto_10658 ?auto_10662 ) ) ( not ( = ?auto_10658 ?auto_10675 ) ) ( not ( = ?auto_10659 ?auto_10662 ) ) ( not ( = ?auto_10659 ?auto_10675 ) ) ( not ( = ?auto_10660 ?auto_10662 ) ) ( not ( = ?auto_10660 ?auto_10675 ) ) ( not ( = ?auto_10662 ?auto_10683 ) ) ( not ( = ?auto_10662 ?auto_10685 ) ) ( not ( = ?auto_10662 ?auto_10674 ) ) ( not ( = ?auto_10662 ?auto_10673 ) ) ( not ( = ?auto_10662 ?auto_10682 ) ) ( not ( = ?auto_10675 ?auto_10683 ) ) ( not ( = ?auto_10675 ?auto_10685 ) ) ( not ( = ?auto_10675 ?auto_10674 ) ) ( not ( = ?auto_10675 ?auto_10673 ) ) ( not ( = ?auto_10675 ?auto_10682 ) ) ( not ( = ?auto_10656 ?auto_10663 ) ) ( not ( = ?auto_10656 ?auto_10680 ) ) ( not ( = ?auto_10657 ?auto_10663 ) ) ( not ( = ?auto_10657 ?auto_10680 ) ) ( not ( = ?auto_10658 ?auto_10663 ) ) ( not ( = ?auto_10658 ?auto_10680 ) ) ( not ( = ?auto_10659 ?auto_10663 ) ) ( not ( = ?auto_10659 ?auto_10680 ) ) ( not ( = ?auto_10660 ?auto_10663 ) ) ( not ( = ?auto_10660 ?auto_10680 ) ) ( not ( = ?auto_10661 ?auto_10663 ) ) ( not ( = ?auto_10661 ?auto_10680 ) ) ( not ( = ?auto_10663 ?auto_10675 ) ) ( not ( = ?auto_10663 ?auto_10683 ) ) ( not ( = ?auto_10663 ?auto_10685 ) ) ( not ( = ?auto_10663 ?auto_10674 ) ) ( not ( = ?auto_10663 ?auto_10673 ) ) ( not ( = ?auto_10663 ?auto_10682 ) ) ( not ( = ?auto_10687 ?auto_10686 ) ) ( not ( = ?auto_10687 ?auto_10676 ) ) ( not ( = ?auto_10687 ?auto_10677 ) ) ( not ( = ?auto_10687 ?auto_10668 ) ) ( not ( = ?auto_10684 ?auto_10688 ) ) ( not ( = ?auto_10684 ?auto_10689 ) ) ( not ( = ?auto_10684 ?auto_10681 ) ) ( not ( = ?auto_10684 ?auto_10669 ) ) ( not ( = ?auto_10680 ?auto_10675 ) ) ( not ( = ?auto_10680 ?auto_10683 ) ) ( not ( = ?auto_10680 ?auto_10685 ) ) ( not ( = ?auto_10680 ?auto_10674 ) ) ( not ( = ?auto_10680 ?auto_10673 ) ) ( not ( = ?auto_10680 ?auto_10682 ) ) ( not ( = ?auto_10656 ?auto_10664 ) ) ( not ( = ?auto_10656 ?auto_10678 ) ) ( not ( = ?auto_10657 ?auto_10664 ) ) ( not ( = ?auto_10657 ?auto_10678 ) ) ( not ( = ?auto_10658 ?auto_10664 ) ) ( not ( = ?auto_10658 ?auto_10678 ) ) ( not ( = ?auto_10659 ?auto_10664 ) ) ( not ( = ?auto_10659 ?auto_10678 ) ) ( not ( = ?auto_10660 ?auto_10664 ) ) ( not ( = ?auto_10660 ?auto_10678 ) ) ( not ( = ?auto_10661 ?auto_10664 ) ) ( not ( = ?auto_10661 ?auto_10678 ) ) ( not ( = ?auto_10662 ?auto_10664 ) ) ( not ( = ?auto_10662 ?auto_10678 ) ) ( not ( = ?auto_10664 ?auto_10680 ) ) ( not ( = ?auto_10664 ?auto_10675 ) ) ( not ( = ?auto_10664 ?auto_10683 ) ) ( not ( = ?auto_10664 ?auto_10685 ) ) ( not ( = ?auto_10664 ?auto_10674 ) ) ( not ( = ?auto_10664 ?auto_10673 ) ) ( not ( = ?auto_10664 ?auto_10682 ) ) ( not ( = ?auto_10678 ?auto_10680 ) ) ( not ( = ?auto_10678 ?auto_10675 ) ) ( not ( = ?auto_10678 ?auto_10683 ) ) ( not ( = ?auto_10678 ?auto_10685 ) ) ( not ( = ?auto_10678 ?auto_10674 ) ) ( not ( = ?auto_10678 ?auto_10673 ) ) ( not ( = ?auto_10678 ?auto_10682 ) ) ( not ( = ?auto_10656 ?auto_10665 ) ) ( not ( = ?auto_10656 ?auto_10679 ) ) ( not ( = ?auto_10657 ?auto_10665 ) ) ( not ( = ?auto_10657 ?auto_10679 ) ) ( not ( = ?auto_10658 ?auto_10665 ) ) ( not ( = ?auto_10658 ?auto_10679 ) ) ( not ( = ?auto_10659 ?auto_10665 ) ) ( not ( = ?auto_10659 ?auto_10679 ) ) ( not ( = ?auto_10660 ?auto_10665 ) ) ( not ( = ?auto_10660 ?auto_10679 ) ) ( not ( = ?auto_10661 ?auto_10665 ) ) ( not ( = ?auto_10661 ?auto_10679 ) ) ( not ( = ?auto_10662 ?auto_10665 ) ) ( not ( = ?auto_10662 ?auto_10679 ) ) ( not ( = ?auto_10663 ?auto_10665 ) ) ( not ( = ?auto_10663 ?auto_10679 ) ) ( not ( = ?auto_10665 ?auto_10678 ) ) ( not ( = ?auto_10665 ?auto_10680 ) ) ( not ( = ?auto_10665 ?auto_10675 ) ) ( not ( = ?auto_10665 ?auto_10683 ) ) ( not ( = ?auto_10665 ?auto_10685 ) ) ( not ( = ?auto_10665 ?auto_10674 ) ) ( not ( = ?auto_10665 ?auto_10673 ) ) ( not ( = ?auto_10665 ?auto_10682 ) ) ( not ( = ?auto_10679 ?auto_10678 ) ) ( not ( = ?auto_10679 ?auto_10680 ) ) ( not ( = ?auto_10679 ?auto_10675 ) ) ( not ( = ?auto_10679 ?auto_10683 ) ) ( not ( = ?auto_10679 ?auto_10685 ) ) ( not ( = ?auto_10679 ?auto_10674 ) ) ( not ( = ?auto_10679 ?auto_10673 ) ) ( not ( = ?auto_10679 ?auto_10682 ) ) ( not ( = ?auto_10656 ?auto_10666 ) ) ( not ( = ?auto_10656 ?auto_10672 ) ) ( not ( = ?auto_10657 ?auto_10666 ) ) ( not ( = ?auto_10657 ?auto_10672 ) ) ( not ( = ?auto_10658 ?auto_10666 ) ) ( not ( = ?auto_10658 ?auto_10672 ) ) ( not ( = ?auto_10659 ?auto_10666 ) ) ( not ( = ?auto_10659 ?auto_10672 ) ) ( not ( = ?auto_10660 ?auto_10666 ) ) ( not ( = ?auto_10660 ?auto_10672 ) ) ( not ( = ?auto_10661 ?auto_10666 ) ) ( not ( = ?auto_10661 ?auto_10672 ) ) ( not ( = ?auto_10662 ?auto_10666 ) ) ( not ( = ?auto_10662 ?auto_10672 ) ) ( not ( = ?auto_10663 ?auto_10666 ) ) ( not ( = ?auto_10663 ?auto_10672 ) ) ( not ( = ?auto_10664 ?auto_10666 ) ) ( not ( = ?auto_10664 ?auto_10672 ) ) ( not ( = ?auto_10666 ?auto_10679 ) ) ( not ( = ?auto_10666 ?auto_10678 ) ) ( not ( = ?auto_10666 ?auto_10680 ) ) ( not ( = ?auto_10666 ?auto_10675 ) ) ( not ( = ?auto_10666 ?auto_10683 ) ) ( not ( = ?auto_10666 ?auto_10685 ) ) ( not ( = ?auto_10666 ?auto_10674 ) ) ( not ( = ?auto_10666 ?auto_10673 ) ) ( not ( = ?auto_10666 ?auto_10682 ) ) ( not ( = ?auto_10672 ?auto_10679 ) ) ( not ( = ?auto_10672 ?auto_10678 ) ) ( not ( = ?auto_10672 ?auto_10680 ) ) ( not ( = ?auto_10672 ?auto_10675 ) ) ( not ( = ?auto_10672 ?auto_10683 ) ) ( not ( = ?auto_10672 ?auto_10685 ) ) ( not ( = ?auto_10672 ?auto_10674 ) ) ( not ( = ?auto_10672 ?auto_10673 ) ) ( not ( = ?auto_10672 ?auto_10682 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_10656 ?auto_10657 ?auto_10658 ?auto_10659 ?auto_10660 ?auto_10661 ?auto_10662 ?auto_10663 ?auto_10664 ?auto_10665 )
      ( MAKE-1CRATE ?auto_10665 ?auto_10666 )
      ( MAKE-10CRATE-VERIFY ?auto_10656 ?auto_10657 ?auto_10658 ?auto_10659 ?auto_10660 ?auto_10661 ?auto_10662 ?auto_10663 ?auto_10664 ?auto_10665 ?auto_10666 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_10712 - SURFACE
      ?auto_10713 - SURFACE
      ?auto_10714 - SURFACE
      ?auto_10715 - SURFACE
      ?auto_10716 - SURFACE
      ?auto_10717 - SURFACE
      ?auto_10718 - SURFACE
      ?auto_10719 - SURFACE
      ?auto_10720 - SURFACE
      ?auto_10721 - SURFACE
      ?auto_10722 - SURFACE
      ?auto_10723 - SURFACE
    )
    :vars
    (
      ?auto_10727 - HOIST
      ?auto_10728 - PLACE
      ?auto_10725 - PLACE
      ?auto_10724 - HOIST
      ?auto_10729 - SURFACE
      ?auto_10744 - PLACE
      ?auto_10734 - HOIST
      ?auto_10738 - SURFACE
      ?auto_10742 - SURFACE
      ?auto_10736 - PLACE
      ?auto_10746 - HOIST
      ?auto_10745 - SURFACE
      ?auto_10743 - PLACE
      ?auto_10740 - HOIST
      ?auto_10730 - SURFACE
      ?auto_10739 - SURFACE
      ?auto_10747 - SURFACE
      ?auto_10731 - PLACE
      ?auto_10733 - HOIST
      ?auto_10732 - SURFACE
      ?auto_10737 - SURFACE
      ?auto_10741 - SURFACE
      ?auto_10735 - SURFACE
      ?auto_10726 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10727 ?auto_10728 ) ( IS-CRATE ?auto_10723 ) ( not ( = ?auto_10725 ?auto_10728 ) ) ( HOIST-AT ?auto_10724 ?auto_10725 ) ( SURFACE-AT ?auto_10723 ?auto_10725 ) ( ON ?auto_10723 ?auto_10729 ) ( CLEAR ?auto_10723 ) ( not ( = ?auto_10722 ?auto_10723 ) ) ( not ( = ?auto_10722 ?auto_10729 ) ) ( not ( = ?auto_10723 ?auto_10729 ) ) ( not ( = ?auto_10727 ?auto_10724 ) ) ( IS-CRATE ?auto_10722 ) ( not ( = ?auto_10744 ?auto_10728 ) ) ( HOIST-AT ?auto_10734 ?auto_10744 ) ( SURFACE-AT ?auto_10722 ?auto_10744 ) ( ON ?auto_10722 ?auto_10738 ) ( CLEAR ?auto_10722 ) ( not ( = ?auto_10721 ?auto_10722 ) ) ( not ( = ?auto_10721 ?auto_10738 ) ) ( not ( = ?auto_10722 ?auto_10738 ) ) ( not ( = ?auto_10727 ?auto_10734 ) ) ( IS-CRATE ?auto_10721 ) ( SURFACE-AT ?auto_10721 ?auto_10725 ) ( ON ?auto_10721 ?auto_10742 ) ( CLEAR ?auto_10721 ) ( not ( = ?auto_10720 ?auto_10721 ) ) ( not ( = ?auto_10720 ?auto_10742 ) ) ( not ( = ?auto_10721 ?auto_10742 ) ) ( IS-CRATE ?auto_10720 ) ( not ( = ?auto_10736 ?auto_10728 ) ) ( HOIST-AT ?auto_10746 ?auto_10736 ) ( SURFACE-AT ?auto_10720 ?auto_10736 ) ( ON ?auto_10720 ?auto_10745 ) ( CLEAR ?auto_10720 ) ( not ( = ?auto_10719 ?auto_10720 ) ) ( not ( = ?auto_10719 ?auto_10745 ) ) ( not ( = ?auto_10720 ?auto_10745 ) ) ( not ( = ?auto_10727 ?auto_10746 ) ) ( IS-CRATE ?auto_10719 ) ( not ( = ?auto_10743 ?auto_10728 ) ) ( HOIST-AT ?auto_10740 ?auto_10743 ) ( AVAILABLE ?auto_10740 ) ( SURFACE-AT ?auto_10719 ?auto_10743 ) ( ON ?auto_10719 ?auto_10730 ) ( CLEAR ?auto_10719 ) ( not ( = ?auto_10718 ?auto_10719 ) ) ( not ( = ?auto_10718 ?auto_10730 ) ) ( not ( = ?auto_10719 ?auto_10730 ) ) ( not ( = ?auto_10727 ?auto_10740 ) ) ( IS-CRATE ?auto_10718 ) ( SURFACE-AT ?auto_10718 ?auto_10736 ) ( ON ?auto_10718 ?auto_10739 ) ( CLEAR ?auto_10718 ) ( not ( = ?auto_10717 ?auto_10718 ) ) ( not ( = ?auto_10717 ?auto_10739 ) ) ( not ( = ?auto_10718 ?auto_10739 ) ) ( IS-CRATE ?auto_10717 ) ( AVAILABLE ?auto_10724 ) ( SURFACE-AT ?auto_10717 ?auto_10725 ) ( ON ?auto_10717 ?auto_10747 ) ( CLEAR ?auto_10717 ) ( not ( = ?auto_10716 ?auto_10717 ) ) ( not ( = ?auto_10716 ?auto_10747 ) ) ( not ( = ?auto_10717 ?auto_10747 ) ) ( IS-CRATE ?auto_10716 ) ( not ( = ?auto_10731 ?auto_10728 ) ) ( HOIST-AT ?auto_10733 ?auto_10731 ) ( SURFACE-AT ?auto_10716 ?auto_10731 ) ( ON ?auto_10716 ?auto_10732 ) ( CLEAR ?auto_10716 ) ( not ( = ?auto_10715 ?auto_10716 ) ) ( not ( = ?auto_10715 ?auto_10732 ) ) ( not ( = ?auto_10716 ?auto_10732 ) ) ( not ( = ?auto_10727 ?auto_10733 ) ) ( IS-CRATE ?auto_10715 ) ( AVAILABLE ?auto_10733 ) ( SURFACE-AT ?auto_10715 ?auto_10731 ) ( ON ?auto_10715 ?auto_10737 ) ( CLEAR ?auto_10715 ) ( not ( = ?auto_10714 ?auto_10715 ) ) ( not ( = ?auto_10714 ?auto_10737 ) ) ( not ( = ?auto_10715 ?auto_10737 ) ) ( IS-CRATE ?auto_10714 ) ( AVAILABLE ?auto_10734 ) ( SURFACE-AT ?auto_10714 ?auto_10744 ) ( ON ?auto_10714 ?auto_10741 ) ( CLEAR ?auto_10714 ) ( not ( = ?auto_10713 ?auto_10714 ) ) ( not ( = ?auto_10713 ?auto_10741 ) ) ( not ( = ?auto_10714 ?auto_10741 ) ) ( SURFACE-AT ?auto_10712 ?auto_10728 ) ( CLEAR ?auto_10712 ) ( IS-CRATE ?auto_10713 ) ( AVAILABLE ?auto_10727 ) ( AVAILABLE ?auto_10746 ) ( SURFACE-AT ?auto_10713 ?auto_10736 ) ( ON ?auto_10713 ?auto_10735 ) ( CLEAR ?auto_10713 ) ( TRUCK-AT ?auto_10726 ?auto_10728 ) ( not ( = ?auto_10712 ?auto_10713 ) ) ( not ( = ?auto_10712 ?auto_10735 ) ) ( not ( = ?auto_10713 ?auto_10735 ) ) ( not ( = ?auto_10712 ?auto_10714 ) ) ( not ( = ?auto_10712 ?auto_10741 ) ) ( not ( = ?auto_10714 ?auto_10735 ) ) ( not ( = ?auto_10744 ?auto_10736 ) ) ( not ( = ?auto_10734 ?auto_10746 ) ) ( not ( = ?auto_10741 ?auto_10735 ) ) ( not ( = ?auto_10712 ?auto_10715 ) ) ( not ( = ?auto_10712 ?auto_10737 ) ) ( not ( = ?auto_10713 ?auto_10715 ) ) ( not ( = ?auto_10713 ?auto_10737 ) ) ( not ( = ?auto_10715 ?auto_10741 ) ) ( not ( = ?auto_10715 ?auto_10735 ) ) ( not ( = ?auto_10731 ?auto_10744 ) ) ( not ( = ?auto_10731 ?auto_10736 ) ) ( not ( = ?auto_10733 ?auto_10734 ) ) ( not ( = ?auto_10733 ?auto_10746 ) ) ( not ( = ?auto_10737 ?auto_10741 ) ) ( not ( = ?auto_10737 ?auto_10735 ) ) ( not ( = ?auto_10712 ?auto_10716 ) ) ( not ( = ?auto_10712 ?auto_10732 ) ) ( not ( = ?auto_10713 ?auto_10716 ) ) ( not ( = ?auto_10713 ?auto_10732 ) ) ( not ( = ?auto_10714 ?auto_10716 ) ) ( not ( = ?auto_10714 ?auto_10732 ) ) ( not ( = ?auto_10716 ?auto_10737 ) ) ( not ( = ?auto_10716 ?auto_10741 ) ) ( not ( = ?auto_10716 ?auto_10735 ) ) ( not ( = ?auto_10732 ?auto_10737 ) ) ( not ( = ?auto_10732 ?auto_10741 ) ) ( not ( = ?auto_10732 ?auto_10735 ) ) ( not ( = ?auto_10712 ?auto_10717 ) ) ( not ( = ?auto_10712 ?auto_10747 ) ) ( not ( = ?auto_10713 ?auto_10717 ) ) ( not ( = ?auto_10713 ?auto_10747 ) ) ( not ( = ?auto_10714 ?auto_10717 ) ) ( not ( = ?auto_10714 ?auto_10747 ) ) ( not ( = ?auto_10715 ?auto_10717 ) ) ( not ( = ?auto_10715 ?auto_10747 ) ) ( not ( = ?auto_10717 ?auto_10732 ) ) ( not ( = ?auto_10717 ?auto_10737 ) ) ( not ( = ?auto_10717 ?auto_10741 ) ) ( not ( = ?auto_10717 ?auto_10735 ) ) ( not ( = ?auto_10725 ?auto_10731 ) ) ( not ( = ?auto_10725 ?auto_10744 ) ) ( not ( = ?auto_10725 ?auto_10736 ) ) ( not ( = ?auto_10724 ?auto_10733 ) ) ( not ( = ?auto_10724 ?auto_10734 ) ) ( not ( = ?auto_10724 ?auto_10746 ) ) ( not ( = ?auto_10747 ?auto_10732 ) ) ( not ( = ?auto_10747 ?auto_10737 ) ) ( not ( = ?auto_10747 ?auto_10741 ) ) ( not ( = ?auto_10747 ?auto_10735 ) ) ( not ( = ?auto_10712 ?auto_10718 ) ) ( not ( = ?auto_10712 ?auto_10739 ) ) ( not ( = ?auto_10713 ?auto_10718 ) ) ( not ( = ?auto_10713 ?auto_10739 ) ) ( not ( = ?auto_10714 ?auto_10718 ) ) ( not ( = ?auto_10714 ?auto_10739 ) ) ( not ( = ?auto_10715 ?auto_10718 ) ) ( not ( = ?auto_10715 ?auto_10739 ) ) ( not ( = ?auto_10716 ?auto_10718 ) ) ( not ( = ?auto_10716 ?auto_10739 ) ) ( not ( = ?auto_10718 ?auto_10747 ) ) ( not ( = ?auto_10718 ?auto_10732 ) ) ( not ( = ?auto_10718 ?auto_10737 ) ) ( not ( = ?auto_10718 ?auto_10741 ) ) ( not ( = ?auto_10718 ?auto_10735 ) ) ( not ( = ?auto_10739 ?auto_10747 ) ) ( not ( = ?auto_10739 ?auto_10732 ) ) ( not ( = ?auto_10739 ?auto_10737 ) ) ( not ( = ?auto_10739 ?auto_10741 ) ) ( not ( = ?auto_10739 ?auto_10735 ) ) ( not ( = ?auto_10712 ?auto_10719 ) ) ( not ( = ?auto_10712 ?auto_10730 ) ) ( not ( = ?auto_10713 ?auto_10719 ) ) ( not ( = ?auto_10713 ?auto_10730 ) ) ( not ( = ?auto_10714 ?auto_10719 ) ) ( not ( = ?auto_10714 ?auto_10730 ) ) ( not ( = ?auto_10715 ?auto_10719 ) ) ( not ( = ?auto_10715 ?auto_10730 ) ) ( not ( = ?auto_10716 ?auto_10719 ) ) ( not ( = ?auto_10716 ?auto_10730 ) ) ( not ( = ?auto_10717 ?auto_10719 ) ) ( not ( = ?auto_10717 ?auto_10730 ) ) ( not ( = ?auto_10719 ?auto_10739 ) ) ( not ( = ?auto_10719 ?auto_10747 ) ) ( not ( = ?auto_10719 ?auto_10732 ) ) ( not ( = ?auto_10719 ?auto_10737 ) ) ( not ( = ?auto_10719 ?auto_10741 ) ) ( not ( = ?auto_10719 ?auto_10735 ) ) ( not ( = ?auto_10743 ?auto_10736 ) ) ( not ( = ?auto_10743 ?auto_10725 ) ) ( not ( = ?auto_10743 ?auto_10731 ) ) ( not ( = ?auto_10743 ?auto_10744 ) ) ( not ( = ?auto_10740 ?auto_10746 ) ) ( not ( = ?auto_10740 ?auto_10724 ) ) ( not ( = ?auto_10740 ?auto_10733 ) ) ( not ( = ?auto_10740 ?auto_10734 ) ) ( not ( = ?auto_10730 ?auto_10739 ) ) ( not ( = ?auto_10730 ?auto_10747 ) ) ( not ( = ?auto_10730 ?auto_10732 ) ) ( not ( = ?auto_10730 ?auto_10737 ) ) ( not ( = ?auto_10730 ?auto_10741 ) ) ( not ( = ?auto_10730 ?auto_10735 ) ) ( not ( = ?auto_10712 ?auto_10720 ) ) ( not ( = ?auto_10712 ?auto_10745 ) ) ( not ( = ?auto_10713 ?auto_10720 ) ) ( not ( = ?auto_10713 ?auto_10745 ) ) ( not ( = ?auto_10714 ?auto_10720 ) ) ( not ( = ?auto_10714 ?auto_10745 ) ) ( not ( = ?auto_10715 ?auto_10720 ) ) ( not ( = ?auto_10715 ?auto_10745 ) ) ( not ( = ?auto_10716 ?auto_10720 ) ) ( not ( = ?auto_10716 ?auto_10745 ) ) ( not ( = ?auto_10717 ?auto_10720 ) ) ( not ( = ?auto_10717 ?auto_10745 ) ) ( not ( = ?auto_10718 ?auto_10720 ) ) ( not ( = ?auto_10718 ?auto_10745 ) ) ( not ( = ?auto_10720 ?auto_10730 ) ) ( not ( = ?auto_10720 ?auto_10739 ) ) ( not ( = ?auto_10720 ?auto_10747 ) ) ( not ( = ?auto_10720 ?auto_10732 ) ) ( not ( = ?auto_10720 ?auto_10737 ) ) ( not ( = ?auto_10720 ?auto_10741 ) ) ( not ( = ?auto_10720 ?auto_10735 ) ) ( not ( = ?auto_10745 ?auto_10730 ) ) ( not ( = ?auto_10745 ?auto_10739 ) ) ( not ( = ?auto_10745 ?auto_10747 ) ) ( not ( = ?auto_10745 ?auto_10732 ) ) ( not ( = ?auto_10745 ?auto_10737 ) ) ( not ( = ?auto_10745 ?auto_10741 ) ) ( not ( = ?auto_10745 ?auto_10735 ) ) ( not ( = ?auto_10712 ?auto_10721 ) ) ( not ( = ?auto_10712 ?auto_10742 ) ) ( not ( = ?auto_10713 ?auto_10721 ) ) ( not ( = ?auto_10713 ?auto_10742 ) ) ( not ( = ?auto_10714 ?auto_10721 ) ) ( not ( = ?auto_10714 ?auto_10742 ) ) ( not ( = ?auto_10715 ?auto_10721 ) ) ( not ( = ?auto_10715 ?auto_10742 ) ) ( not ( = ?auto_10716 ?auto_10721 ) ) ( not ( = ?auto_10716 ?auto_10742 ) ) ( not ( = ?auto_10717 ?auto_10721 ) ) ( not ( = ?auto_10717 ?auto_10742 ) ) ( not ( = ?auto_10718 ?auto_10721 ) ) ( not ( = ?auto_10718 ?auto_10742 ) ) ( not ( = ?auto_10719 ?auto_10721 ) ) ( not ( = ?auto_10719 ?auto_10742 ) ) ( not ( = ?auto_10721 ?auto_10745 ) ) ( not ( = ?auto_10721 ?auto_10730 ) ) ( not ( = ?auto_10721 ?auto_10739 ) ) ( not ( = ?auto_10721 ?auto_10747 ) ) ( not ( = ?auto_10721 ?auto_10732 ) ) ( not ( = ?auto_10721 ?auto_10737 ) ) ( not ( = ?auto_10721 ?auto_10741 ) ) ( not ( = ?auto_10721 ?auto_10735 ) ) ( not ( = ?auto_10742 ?auto_10745 ) ) ( not ( = ?auto_10742 ?auto_10730 ) ) ( not ( = ?auto_10742 ?auto_10739 ) ) ( not ( = ?auto_10742 ?auto_10747 ) ) ( not ( = ?auto_10742 ?auto_10732 ) ) ( not ( = ?auto_10742 ?auto_10737 ) ) ( not ( = ?auto_10742 ?auto_10741 ) ) ( not ( = ?auto_10742 ?auto_10735 ) ) ( not ( = ?auto_10712 ?auto_10722 ) ) ( not ( = ?auto_10712 ?auto_10738 ) ) ( not ( = ?auto_10713 ?auto_10722 ) ) ( not ( = ?auto_10713 ?auto_10738 ) ) ( not ( = ?auto_10714 ?auto_10722 ) ) ( not ( = ?auto_10714 ?auto_10738 ) ) ( not ( = ?auto_10715 ?auto_10722 ) ) ( not ( = ?auto_10715 ?auto_10738 ) ) ( not ( = ?auto_10716 ?auto_10722 ) ) ( not ( = ?auto_10716 ?auto_10738 ) ) ( not ( = ?auto_10717 ?auto_10722 ) ) ( not ( = ?auto_10717 ?auto_10738 ) ) ( not ( = ?auto_10718 ?auto_10722 ) ) ( not ( = ?auto_10718 ?auto_10738 ) ) ( not ( = ?auto_10719 ?auto_10722 ) ) ( not ( = ?auto_10719 ?auto_10738 ) ) ( not ( = ?auto_10720 ?auto_10722 ) ) ( not ( = ?auto_10720 ?auto_10738 ) ) ( not ( = ?auto_10722 ?auto_10742 ) ) ( not ( = ?auto_10722 ?auto_10745 ) ) ( not ( = ?auto_10722 ?auto_10730 ) ) ( not ( = ?auto_10722 ?auto_10739 ) ) ( not ( = ?auto_10722 ?auto_10747 ) ) ( not ( = ?auto_10722 ?auto_10732 ) ) ( not ( = ?auto_10722 ?auto_10737 ) ) ( not ( = ?auto_10722 ?auto_10741 ) ) ( not ( = ?auto_10722 ?auto_10735 ) ) ( not ( = ?auto_10738 ?auto_10742 ) ) ( not ( = ?auto_10738 ?auto_10745 ) ) ( not ( = ?auto_10738 ?auto_10730 ) ) ( not ( = ?auto_10738 ?auto_10739 ) ) ( not ( = ?auto_10738 ?auto_10747 ) ) ( not ( = ?auto_10738 ?auto_10732 ) ) ( not ( = ?auto_10738 ?auto_10737 ) ) ( not ( = ?auto_10738 ?auto_10741 ) ) ( not ( = ?auto_10738 ?auto_10735 ) ) ( not ( = ?auto_10712 ?auto_10723 ) ) ( not ( = ?auto_10712 ?auto_10729 ) ) ( not ( = ?auto_10713 ?auto_10723 ) ) ( not ( = ?auto_10713 ?auto_10729 ) ) ( not ( = ?auto_10714 ?auto_10723 ) ) ( not ( = ?auto_10714 ?auto_10729 ) ) ( not ( = ?auto_10715 ?auto_10723 ) ) ( not ( = ?auto_10715 ?auto_10729 ) ) ( not ( = ?auto_10716 ?auto_10723 ) ) ( not ( = ?auto_10716 ?auto_10729 ) ) ( not ( = ?auto_10717 ?auto_10723 ) ) ( not ( = ?auto_10717 ?auto_10729 ) ) ( not ( = ?auto_10718 ?auto_10723 ) ) ( not ( = ?auto_10718 ?auto_10729 ) ) ( not ( = ?auto_10719 ?auto_10723 ) ) ( not ( = ?auto_10719 ?auto_10729 ) ) ( not ( = ?auto_10720 ?auto_10723 ) ) ( not ( = ?auto_10720 ?auto_10729 ) ) ( not ( = ?auto_10721 ?auto_10723 ) ) ( not ( = ?auto_10721 ?auto_10729 ) ) ( not ( = ?auto_10723 ?auto_10738 ) ) ( not ( = ?auto_10723 ?auto_10742 ) ) ( not ( = ?auto_10723 ?auto_10745 ) ) ( not ( = ?auto_10723 ?auto_10730 ) ) ( not ( = ?auto_10723 ?auto_10739 ) ) ( not ( = ?auto_10723 ?auto_10747 ) ) ( not ( = ?auto_10723 ?auto_10732 ) ) ( not ( = ?auto_10723 ?auto_10737 ) ) ( not ( = ?auto_10723 ?auto_10741 ) ) ( not ( = ?auto_10723 ?auto_10735 ) ) ( not ( = ?auto_10729 ?auto_10738 ) ) ( not ( = ?auto_10729 ?auto_10742 ) ) ( not ( = ?auto_10729 ?auto_10745 ) ) ( not ( = ?auto_10729 ?auto_10730 ) ) ( not ( = ?auto_10729 ?auto_10739 ) ) ( not ( = ?auto_10729 ?auto_10747 ) ) ( not ( = ?auto_10729 ?auto_10732 ) ) ( not ( = ?auto_10729 ?auto_10737 ) ) ( not ( = ?auto_10729 ?auto_10741 ) ) ( not ( = ?auto_10729 ?auto_10735 ) ) )
    :subtasks
    ( ( MAKE-10CRATE ?auto_10712 ?auto_10713 ?auto_10714 ?auto_10715 ?auto_10716 ?auto_10717 ?auto_10718 ?auto_10719 ?auto_10720 ?auto_10721 ?auto_10722 )
      ( MAKE-1CRATE ?auto_10722 ?auto_10723 )
      ( MAKE-11CRATE-VERIFY ?auto_10712 ?auto_10713 ?auto_10714 ?auto_10715 ?auto_10716 ?auto_10717 ?auto_10718 ?auto_10719 ?auto_10720 ?auto_10721 ?auto_10722 ?auto_10723 ) )
  )

)

