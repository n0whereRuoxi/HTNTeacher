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

  ( :method MAKE-15CRATE-VERIFY
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
      ?c15 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( ON ?c11 ?c10 ) ( ON ?c12 ?c11 ) ( ON ?c13 ?c12 ) ( ON ?c14 ?c13 ) ( ON ?c15 ?c14 ) ( CLEAR ?c15 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-16CRATE-VERIFY
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
      ?c15 - SURFACE
      ?c16 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( ON ?c11 ?c10 ) ( ON ?c12 ?c11 ) ( ON ?c13 ?c12 ) ( ON ?c14 ?c13 ) ( ON ?c15 ?c14 ) ( ON ?c16 ?c15 ) ( CLEAR ?c16 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2128328 - SURFACE
      ?auto_2128329 - SURFACE
    )
    :vars
    (
      ?auto_2128330 - HOIST
      ?auto_2128331 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2128330 ?auto_2128331 ) ( SURFACE-AT ?auto_2128328 ?auto_2128331 ) ( CLEAR ?auto_2128328 ) ( LIFTING ?auto_2128330 ?auto_2128329 ) ( IS-CRATE ?auto_2128329 ) ( not ( = ?auto_2128328 ?auto_2128329 ) ) )
    :subtasks
    ( ( !DROP ?auto_2128330 ?auto_2128329 ?auto_2128328 ?auto_2128331 )
      ( MAKE-1CRATE-VERIFY ?auto_2128328 ?auto_2128329 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2128332 - SURFACE
      ?auto_2128333 - SURFACE
    )
    :vars
    (
      ?auto_2128335 - HOIST
      ?auto_2128334 - PLACE
      ?auto_2128336 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2128335 ?auto_2128334 ) ( SURFACE-AT ?auto_2128332 ?auto_2128334 ) ( CLEAR ?auto_2128332 ) ( IS-CRATE ?auto_2128333 ) ( not ( = ?auto_2128332 ?auto_2128333 ) ) ( TRUCK-AT ?auto_2128336 ?auto_2128334 ) ( AVAILABLE ?auto_2128335 ) ( IN ?auto_2128333 ?auto_2128336 ) )
    :subtasks
    ( ( !UNLOAD ?auto_2128335 ?auto_2128333 ?auto_2128336 ?auto_2128334 )
      ( MAKE-1CRATE ?auto_2128332 ?auto_2128333 )
      ( MAKE-1CRATE-VERIFY ?auto_2128332 ?auto_2128333 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2128337 - SURFACE
      ?auto_2128338 - SURFACE
    )
    :vars
    (
      ?auto_2128341 - HOIST
      ?auto_2128339 - PLACE
      ?auto_2128340 - TRUCK
      ?auto_2128342 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2128341 ?auto_2128339 ) ( SURFACE-AT ?auto_2128337 ?auto_2128339 ) ( CLEAR ?auto_2128337 ) ( IS-CRATE ?auto_2128338 ) ( not ( = ?auto_2128337 ?auto_2128338 ) ) ( AVAILABLE ?auto_2128341 ) ( IN ?auto_2128338 ?auto_2128340 ) ( TRUCK-AT ?auto_2128340 ?auto_2128342 ) ( not ( = ?auto_2128342 ?auto_2128339 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2128340 ?auto_2128342 ?auto_2128339 )
      ( MAKE-1CRATE ?auto_2128337 ?auto_2128338 )
      ( MAKE-1CRATE-VERIFY ?auto_2128337 ?auto_2128338 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2128343 - SURFACE
      ?auto_2128344 - SURFACE
    )
    :vars
    (
      ?auto_2128348 - HOIST
      ?auto_2128347 - PLACE
      ?auto_2128345 - TRUCK
      ?auto_2128346 - PLACE
      ?auto_2128349 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2128348 ?auto_2128347 ) ( SURFACE-AT ?auto_2128343 ?auto_2128347 ) ( CLEAR ?auto_2128343 ) ( IS-CRATE ?auto_2128344 ) ( not ( = ?auto_2128343 ?auto_2128344 ) ) ( AVAILABLE ?auto_2128348 ) ( TRUCK-AT ?auto_2128345 ?auto_2128346 ) ( not ( = ?auto_2128346 ?auto_2128347 ) ) ( HOIST-AT ?auto_2128349 ?auto_2128346 ) ( LIFTING ?auto_2128349 ?auto_2128344 ) ( not ( = ?auto_2128348 ?auto_2128349 ) ) )
    :subtasks
    ( ( !LOAD ?auto_2128349 ?auto_2128344 ?auto_2128345 ?auto_2128346 )
      ( MAKE-1CRATE ?auto_2128343 ?auto_2128344 )
      ( MAKE-1CRATE-VERIFY ?auto_2128343 ?auto_2128344 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2128350 - SURFACE
      ?auto_2128351 - SURFACE
    )
    :vars
    (
      ?auto_2128356 - HOIST
      ?auto_2128352 - PLACE
      ?auto_2128354 - TRUCK
      ?auto_2128355 - PLACE
      ?auto_2128353 - HOIST
      ?auto_2128357 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2128356 ?auto_2128352 ) ( SURFACE-AT ?auto_2128350 ?auto_2128352 ) ( CLEAR ?auto_2128350 ) ( IS-CRATE ?auto_2128351 ) ( not ( = ?auto_2128350 ?auto_2128351 ) ) ( AVAILABLE ?auto_2128356 ) ( TRUCK-AT ?auto_2128354 ?auto_2128355 ) ( not ( = ?auto_2128355 ?auto_2128352 ) ) ( HOIST-AT ?auto_2128353 ?auto_2128355 ) ( not ( = ?auto_2128356 ?auto_2128353 ) ) ( AVAILABLE ?auto_2128353 ) ( SURFACE-AT ?auto_2128351 ?auto_2128355 ) ( ON ?auto_2128351 ?auto_2128357 ) ( CLEAR ?auto_2128351 ) ( not ( = ?auto_2128350 ?auto_2128357 ) ) ( not ( = ?auto_2128351 ?auto_2128357 ) ) )
    :subtasks
    ( ( !LIFT ?auto_2128353 ?auto_2128351 ?auto_2128357 ?auto_2128355 )
      ( MAKE-1CRATE ?auto_2128350 ?auto_2128351 )
      ( MAKE-1CRATE-VERIFY ?auto_2128350 ?auto_2128351 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2128358 - SURFACE
      ?auto_2128359 - SURFACE
    )
    :vars
    (
      ?auto_2128365 - HOIST
      ?auto_2128364 - PLACE
      ?auto_2128361 - PLACE
      ?auto_2128360 - HOIST
      ?auto_2128363 - SURFACE
      ?auto_2128362 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2128365 ?auto_2128364 ) ( SURFACE-AT ?auto_2128358 ?auto_2128364 ) ( CLEAR ?auto_2128358 ) ( IS-CRATE ?auto_2128359 ) ( not ( = ?auto_2128358 ?auto_2128359 ) ) ( AVAILABLE ?auto_2128365 ) ( not ( = ?auto_2128361 ?auto_2128364 ) ) ( HOIST-AT ?auto_2128360 ?auto_2128361 ) ( not ( = ?auto_2128365 ?auto_2128360 ) ) ( AVAILABLE ?auto_2128360 ) ( SURFACE-AT ?auto_2128359 ?auto_2128361 ) ( ON ?auto_2128359 ?auto_2128363 ) ( CLEAR ?auto_2128359 ) ( not ( = ?auto_2128358 ?auto_2128363 ) ) ( not ( = ?auto_2128359 ?auto_2128363 ) ) ( TRUCK-AT ?auto_2128362 ?auto_2128364 ) )
    :subtasks
    ( ( !DRIVE ?auto_2128362 ?auto_2128364 ?auto_2128361 )
      ( MAKE-1CRATE ?auto_2128358 ?auto_2128359 )
      ( MAKE-1CRATE-VERIFY ?auto_2128358 ?auto_2128359 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2128375 - SURFACE
      ?auto_2128376 - SURFACE
      ?auto_2128377 - SURFACE
    )
    :vars
    (
      ?auto_2128379 - HOIST
      ?auto_2128378 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2128379 ?auto_2128378 ) ( SURFACE-AT ?auto_2128376 ?auto_2128378 ) ( CLEAR ?auto_2128376 ) ( LIFTING ?auto_2128379 ?auto_2128377 ) ( IS-CRATE ?auto_2128377 ) ( not ( = ?auto_2128376 ?auto_2128377 ) ) ( ON ?auto_2128376 ?auto_2128375 ) ( not ( = ?auto_2128375 ?auto_2128376 ) ) ( not ( = ?auto_2128375 ?auto_2128377 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2128376 ?auto_2128377 )
      ( MAKE-2CRATE-VERIFY ?auto_2128375 ?auto_2128376 ?auto_2128377 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2128385 - SURFACE
      ?auto_2128386 - SURFACE
      ?auto_2128387 - SURFACE
    )
    :vars
    (
      ?auto_2128390 - HOIST
      ?auto_2128389 - PLACE
      ?auto_2128388 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2128390 ?auto_2128389 ) ( SURFACE-AT ?auto_2128386 ?auto_2128389 ) ( CLEAR ?auto_2128386 ) ( IS-CRATE ?auto_2128387 ) ( not ( = ?auto_2128386 ?auto_2128387 ) ) ( TRUCK-AT ?auto_2128388 ?auto_2128389 ) ( AVAILABLE ?auto_2128390 ) ( IN ?auto_2128387 ?auto_2128388 ) ( ON ?auto_2128386 ?auto_2128385 ) ( not ( = ?auto_2128385 ?auto_2128386 ) ) ( not ( = ?auto_2128385 ?auto_2128387 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2128386 ?auto_2128387 )
      ( MAKE-2CRATE-VERIFY ?auto_2128385 ?auto_2128386 ?auto_2128387 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2128391 - SURFACE
      ?auto_2128392 - SURFACE
    )
    :vars
    (
      ?auto_2128394 - HOIST
      ?auto_2128395 - PLACE
      ?auto_2128396 - TRUCK
      ?auto_2128393 - SURFACE
      ?auto_2128397 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2128394 ?auto_2128395 ) ( SURFACE-AT ?auto_2128391 ?auto_2128395 ) ( CLEAR ?auto_2128391 ) ( IS-CRATE ?auto_2128392 ) ( not ( = ?auto_2128391 ?auto_2128392 ) ) ( AVAILABLE ?auto_2128394 ) ( IN ?auto_2128392 ?auto_2128396 ) ( ON ?auto_2128391 ?auto_2128393 ) ( not ( = ?auto_2128393 ?auto_2128391 ) ) ( not ( = ?auto_2128393 ?auto_2128392 ) ) ( TRUCK-AT ?auto_2128396 ?auto_2128397 ) ( not ( = ?auto_2128397 ?auto_2128395 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2128396 ?auto_2128397 ?auto_2128395 )
      ( MAKE-2CRATE ?auto_2128393 ?auto_2128391 ?auto_2128392 )
      ( MAKE-1CRATE-VERIFY ?auto_2128391 ?auto_2128392 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2128398 - SURFACE
      ?auto_2128399 - SURFACE
      ?auto_2128400 - SURFACE
    )
    :vars
    (
      ?auto_2128403 - HOIST
      ?auto_2128402 - PLACE
      ?auto_2128401 - TRUCK
      ?auto_2128404 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2128403 ?auto_2128402 ) ( SURFACE-AT ?auto_2128399 ?auto_2128402 ) ( CLEAR ?auto_2128399 ) ( IS-CRATE ?auto_2128400 ) ( not ( = ?auto_2128399 ?auto_2128400 ) ) ( AVAILABLE ?auto_2128403 ) ( IN ?auto_2128400 ?auto_2128401 ) ( ON ?auto_2128399 ?auto_2128398 ) ( not ( = ?auto_2128398 ?auto_2128399 ) ) ( not ( = ?auto_2128398 ?auto_2128400 ) ) ( TRUCK-AT ?auto_2128401 ?auto_2128404 ) ( not ( = ?auto_2128404 ?auto_2128402 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2128399 ?auto_2128400 )
      ( MAKE-2CRATE-VERIFY ?auto_2128398 ?auto_2128399 ?auto_2128400 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2128405 - SURFACE
      ?auto_2128406 - SURFACE
    )
    :vars
    (
      ?auto_2128407 - HOIST
      ?auto_2128409 - PLACE
      ?auto_2128410 - SURFACE
      ?auto_2128411 - TRUCK
      ?auto_2128408 - PLACE
      ?auto_2128412 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2128407 ?auto_2128409 ) ( SURFACE-AT ?auto_2128405 ?auto_2128409 ) ( CLEAR ?auto_2128405 ) ( IS-CRATE ?auto_2128406 ) ( not ( = ?auto_2128405 ?auto_2128406 ) ) ( AVAILABLE ?auto_2128407 ) ( ON ?auto_2128405 ?auto_2128410 ) ( not ( = ?auto_2128410 ?auto_2128405 ) ) ( not ( = ?auto_2128410 ?auto_2128406 ) ) ( TRUCK-AT ?auto_2128411 ?auto_2128408 ) ( not ( = ?auto_2128408 ?auto_2128409 ) ) ( HOIST-AT ?auto_2128412 ?auto_2128408 ) ( LIFTING ?auto_2128412 ?auto_2128406 ) ( not ( = ?auto_2128407 ?auto_2128412 ) ) )
    :subtasks
    ( ( !LOAD ?auto_2128412 ?auto_2128406 ?auto_2128411 ?auto_2128408 )
      ( MAKE-2CRATE ?auto_2128410 ?auto_2128405 ?auto_2128406 )
      ( MAKE-1CRATE-VERIFY ?auto_2128405 ?auto_2128406 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2128413 - SURFACE
      ?auto_2128414 - SURFACE
      ?auto_2128415 - SURFACE
    )
    :vars
    (
      ?auto_2128420 - HOIST
      ?auto_2128416 - PLACE
      ?auto_2128419 - TRUCK
      ?auto_2128417 - PLACE
      ?auto_2128418 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2128420 ?auto_2128416 ) ( SURFACE-AT ?auto_2128414 ?auto_2128416 ) ( CLEAR ?auto_2128414 ) ( IS-CRATE ?auto_2128415 ) ( not ( = ?auto_2128414 ?auto_2128415 ) ) ( AVAILABLE ?auto_2128420 ) ( ON ?auto_2128414 ?auto_2128413 ) ( not ( = ?auto_2128413 ?auto_2128414 ) ) ( not ( = ?auto_2128413 ?auto_2128415 ) ) ( TRUCK-AT ?auto_2128419 ?auto_2128417 ) ( not ( = ?auto_2128417 ?auto_2128416 ) ) ( HOIST-AT ?auto_2128418 ?auto_2128417 ) ( LIFTING ?auto_2128418 ?auto_2128415 ) ( not ( = ?auto_2128420 ?auto_2128418 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2128414 ?auto_2128415 )
      ( MAKE-2CRATE-VERIFY ?auto_2128413 ?auto_2128414 ?auto_2128415 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2128421 - SURFACE
      ?auto_2128422 - SURFACE
    )
    :vars
    (
      ?auto_2128424 - HOIST
      ?auto_2128426 - PLACE
      ?auto_2128425 - SURFACE
      ?auto_2128423 - TRUCK
      ?auto_2128427 - PLACE
      ?auto_2128428 - HOIST
      ?auto_2128429 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2128424 ?auto_2128426 ) ( SURFACE-AT ?auto_2128421 ?auto_2128426 ) ( CLEAR ?auto_2128421 ) ( IS-CRATE ?auto_2128422 ) ( not ( = ?auto_2128421 ?auto_2128422 ) ) ( AVAILABLE ?auto_2128424 ) ( ON ?auto_2128421 ?auto_2128425 ) ( not ( = ?auto_2128425 ?auto_2128421 ) ) ( not ( = ?auto_2128425 ?auto_2128422 ) ) ( TRUCK-AT ?auto_2128423 ?auto_2128427 ) ( not ( = ?auto_2128427 ?auto_2128426 ) ) ( HOIST-AT ?auto_2128428 ?auto_2128427 ) ( not ( = ?auto_2128424 ?auto_2128428 ) ) ( AVAILABLE ?auto_2128428 ) ( SURFACE-AT ?auto_2128422 ?auto_2128427 ) ( ON ?auto_2128422 ?auto_2128429 ) ( CLEAR ?auto_2128422 ) ( not ( = ?auto_2128421 ?auto_2128429 ) ) ( not ( = ?auto_2128422 ?auto_2128429 ) ) ( not ( = ?auto_2128425 ?auto_2128429 ) ) )
    :subtasks
    ( ( !LIFT ?auto_2128428 ?auto_2128422 ?auto_2128429 ?auto_2128427 )
      ( MAKE-2CRATE ?auto_2128425 ?auto_2128421 ?auto_2128422 )
      ( MAKE-1CRATE-VERIFY ?auto_2128421 ?auto_2128422 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2128430 - SURFACE
      ?auto_2128431 - SURFACE
      ?auto_2128432 - SURFACE
    )
    :vars
    (
      ?auto_2128433 - HOIST
      ?auto_2128437 - PLACE
      ?auto_2128438 - TRUCK
      ?auto_2128434 - PLACE
      ?auto_2128435 - HOIST
      ?auto_2128436 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2128433 ?auto_2128437 ) ( SURFACE-AT ?auto_2128431 ?auto_2128437 ) ( CLEAR ?auto_2128431 ) ( IS-CRATE ?auto_2128432 ) ( not ( = ?auto_2128431 ?auto_2128432 ) ) ( AVAILABLE ?auto_2128433 ) ( ON ?auto_2128431 ?auto_2128430 ) ( not ( = ?auto_2128430 ?auto_2128431 ) ) ( not ( = ?auto_2128430 ?auto_2128432 ) ) ( TRUCK-AT ?auto_2128438 ?auto_2128434 ) ( not ( = ?auto_2128434 ?auto_2128437 ) ) ( HOIST-AT ?auto_2128435 ?auto_2128434 ) ( not ( = ?auto_2128433 ?auto_2128435 ) ) ( AVAILABLE ?auto_2128435 ) ( SURFACE-AT ?auto_2128432 ?auto_2128434 ) ( ON ?auto_2128432 ?auto_2128436 ) ( CLEAR ?auto_2128432 ) ( not ( = ?auto_2128431 ?auto_2128436 ) ) ( not ( = ?auto_2128432 ?auto_2128436 ) ) ( not ( = ?auto_2128430 ?auto_2128436 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2128431 ?auto_2128432 )
      ( MAKE-2CRATE-VERIFY ?auto_2128430 ?auto_2128431 ?auto_2128432 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2128439 - SURFACE
      ?auto_2128440 - SURFACE
    )
    :vars
    (
      ?auto_2128443 - HOIST
      ?auto_2128441 - PLACE
      ?auto_2128442 - SURFACE
      ?auto_2128444 - PLACE
      ?auto_2128445 - HOIST
      ?auto_2128446 - SURFACE
      ?auto_2128447 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2128443 ?auto_2128441 ) ( SURFACE-AT ?auto_2128439 ?auto_2128441 ) ( CLEAR ?auto_2128439 ) ( IS-CRATE ?auto_2128440 ) ( not ( = ?auto_2128439 ?auto_2128440 ) ) ( AVAILABLE ?auto_2128443 ) ( ON ?auto_2128439 ?auto_2128442 ) ( not ( = ?auto_2128442 ?auto_2128439 ) ) ( not ( = ?auto_2128442 ?auto_2128440 ) ) ( not ( = ?auto_2128444 ?auto_2128441 ) ) ( HOIST-AT ?auto_2128445 ?auto_2128444 ) ( not ( = ?auto_2128443 ?auto_2128445 ) ) ( AVAILABLE ?auto_2128445 ) ( SURFACE-AT ?auto_2128440 ?auto_2128444 ) ( ON ?auto_2128440 ?auto_2128446 ) ( CLEAR ?auto_2128440 ) ( not ( = ?auto_2128439 ?auto_2128446 ) ) ( not ( = ?auto_2128440 ?auto_2128446 ) ) ( not ( = ?auto_2128442 ?auto_2128446 ) ) ( TRUCK-AT ?auto_2128447 ?auto_2128441 ) )
    :subtasks
    ( ( !DRIVE ?auto_2128447 ?auto_2128441 ?auto_2128444 )
      ( MAKE-2CRATE ?auto_2128442 ?auto_2128439 ?auto_2128440 )
      ( MAKE-1CRATE-VERIFY ?auto_2128439 ?auto_2128440 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2128448 - SURFACE
      ?auto_2128449 - SURFACE
      ?auto_2128450 - SURFACE
    )
    :vars
    (
      ?auto_2128454 - HOIST
      ?auto_2128452 - PLACE
      ?auto_2128456 - PLACE
      ?auto_2128455 - HOIST
      ?auto_2128451 - SURFACE
      ?auto_2128453 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2128454 ?auto_2128452 ) ( SURFACE-AT ?auto_2128449 ?auto_2128452 ) ( CLEAR ?auto_2128449 ) ( IS-CRATE ?auto_2128450 ) ( not ( = ?auto_2128449 ?auto_2128450 ) ) ( AVAILABLE ?auto_2128454 ) ( ON ?auto_2128449 ?auto_2128448 ) ( not ( = ?auto_2128448 ?auto_2128449 ) ) ( not ( = ?auto_2128448 ?auto_2128450 ) ) ( not ( = ?auto_2128456 ?auto_2128452 ) ) ( HOIST-AT ?auto_2128455 ?auto_2128456 ) ( not ( = ?auto_2128454 ?auto_2128455 ) ) ( AVAILABLE ?auto_2128455 ) ( SURFACE-AT ?auto_2128450 ?auto_2128456 ) ( ON ?auto_2128450 ?auto_2128451 ) ( CLEAR ?auto_2128450 ) ( not ( = ?auto_2128449 ?auto_2128451 ) ) ( not ( = ?auto_2128450 ?auto_2128451 ) ) ( not ( = ?auto_2128448 ?auto_2128451 ) ) ( TRUCK-AT ?auto_2128453 ?auto_2128452 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2128449 ?auto_2128450 )
      ( MAKE-2CRATE-VERIFY ?auto_2128448 ?auto_2128449 ?auto_2128450 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2128457 - SURFACE
      ?auto_2128458 - SURFACE
    )
    :vars
    (
      ?auto_2128464 - HOIST
      ?auto_2128460 - PLACE
      ?auto_2128461 - SURFACE
      ?auto_2128463 - PLACE
      ?auto_2128465 - HOIST
      ?auto_2128462 - SURFACE
      ?auto_2128459 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2128464 ?auto_2128460 ) ( IS-CRATE ?auto_2128458 ) ( not ( = ?auto_2128457 ?auto_2128458 ) ) ( not ( = ?auto_2128461 ?auto_2128457 ) ) ( not ( = ?auto_2128461 ?auto_2128458 ) ) ( not ( = ?auto_2128463 ?auto_2128460 ) ) ( HOIST-AT ?auto_2128465 ?auto_2128463 ) ( not ( = ?auto_2128464 ?auto_2128465 ) ) ( AVAILABLE ?auto_2128465 ) ( SURFACE-AT ?auto_2128458 ?auto_2128463 ) ( ON ?auto_2128458 ?auto_2128462 ) ( CLEAR ?auto_2128458 ) ( not ( = ?auto_2128457 ?auto_2128462 ) ) ( not ( = ?auto_2128458 ?auto_2128462 ) ) ( not ( = ?auto_2128461 ?auto_2128462 ) ) ( TRUCK-AT ?auto_2128459 ?auto_2128460 ) ( SURFACE-AT ?auto_2128461 ?auto_2128460 ) ( CLEAR ?auto_2128461 ) ( LIFTING ?auto_2128464 ?auto_2128457 ) ( IS-CRATE ?auto_2128457 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2128461 ?auto_2128457 )
      ( MAKE-2CRATE ?auto_2128461 ?auto_2128457 ?auto_2128458 )
      ( MAKE-1CRATE-VERIFY ?auto_2128457 ?auto_2128458 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2128466 - SURFACE
      ?auto_2128467 - SURFACE
      ?auto_2128468 - SURFACE
    )
    :vars
    (
      ?auto_2128470 - HOIST
      ?auto_2128473 - PLACE
      ?auto_2128469 - PLACE
      ?auto_2128471 - HOIST
      ?auto_2128472 - SURFACE
      ?auto_2128474 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2128470 ?auto_2128473 ) ( IS-CRATE ?auto_2128468 ) ( not ( = ?auto_2128467 ?auto_2128468 ) ) ( not ( = ?auto_2128466 ?auto_2128467 ) ) ( not ( = ?auto_2128466 ?auto_2128468 ) ) ( not ( = ?auto_2128469 ?auto_2128473 ) ) ( HOIST-AT ?auto_2128471 ?auto_2128469 ) ( not ( = ?auto_2128470 ?auto_2128471 ) ) ( AVAILABLE ?auto_2128471 ) ( SURFACE-AT ?auto_2128468 ?auto_2128469 ) ( ON ?auto_2128468 ?auto_2128472 ) ( CLEAR ?auto_2128468 ) ( not ( = ?auto_2128467 ?auto_2128472 ) ) ( not ( = ?auto_2128468 ?auto_2128472 ) ) ( not ( = ?auto_2128466 ?auto_2128472 ) ) ( TRUCK-AT ?auto_2128474 ?auto_2128473 ) ( SURFACE-AT ?auto_2128466 ?auto_2128473 ) ( CLEAR ?auto_2128466 ) ( LIFTING ?auto_2128470 ?auto_2128467 ) ( IS-CRATE ?auto_2128467 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2128467 ?auto_2128468 )
      ( MAKE-2CRATE-VERIFY ?auto_2128466 ?auto_2128467 ?auto_2128468 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2128475 - SURFACE
      ?auto_2128476 - SURFACE
    )
    :vars
    (
      ?auto_2128480 - HOIST
      ?auto_2128483 - PLACE
      ?auto_2128477 - SURFACE
      ?auto_2128478 - PLACE
      ?auto_2128481 - HOIST
      ?auto_2128482 - SURFACE
      ?auto_2128479 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2128480 ?auto_2128483 ) ( IS-CRATE ?auto_2128476 ) ( not ( = ?auto_2128475 ?auto_2128476 ) ) ( not ( = ?auto_2128477 ?auto_2128475 ) ) ( not ( = ?auto_2128477 ?auto_2128476 ) ) ( not ( = ?auto_2128478 ?auto_2128483 ) ) ( HOIST-AT ?auto_2128481 ?auto_2128478 ) ( not ( = ?auto_2128480 ?auto_2128481 ) ) ( AVAILABLE ?auto_2128481 ) ( SURFACE-AT ?auto_2128476 ?auto_2128478 ) ( ON ?auto_2128476 ?auto_2128482 ) ( CLEAR ?auto_2128476 ) ( not ( = ?auto_2128475 ?auto_2128482 ) ) ( not ( = ?auto_2128476 ?auto_2128482 ) ) ( not ( = ?auto_2128477 ?auto_2128482 ) ) ( TRUCK-AT ?auto_2128479 ?auto_2128483 ) ( SURFACE-AT ?auto_2128477 ?auto_2128483 ) ( CLEAR ?auto_2128477 ) ( IS-CRATE ?auto_2128475 ) ( AVAILABLE ?auto_2128480 ) ( IN ?auto_2128475 ?auto_2128479 ) )
    :subtasks
    ( ( !UNLOAD ?auto_2128480 ?auto_2128475 ?auto_2128479 ?auto_2128483 )
      ( MAKE-2CRATE ?auto_2128477 ?auto_2128475 ?auto_2128476 )
      ( MAKE-1CRATE-VERIFY ?auto_2128475 ?auto_2128476 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2128484 - SURFACE
      ?auto_2128485 - SURFACE
      ?auto_2128486 - SURFACE
    )
    :vars
    (
      ?auto_2128490 - HOIST
      ?auto_2128488 - PLACE
      ?auto_2128492 - PLACE
      ?auto_2128489 - HOIST
      ?auto_2128491 - SURFACE
      ?auto_2128487 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2128490 ?auto_2128488 ) ( IS-CRATE ?auto_2128486 ) ( not ( = ?auto_2128485 ?auto_2128486 ) ) ( not ( = ?auto_2128484 ?auto_2128485 ) ) ( not ( = ?auto_2128484 ?auto_2128486 ) ) ( not ( = ?auto_2128492 ?auto_2128488 ) ) ( HOIST-AT ?auto_2128489 ?auto_2128492 ) ( not ( = ?auto_2128490 ?auto_2128489 ) ) ( AVAILABLE ?auto_2128489 ) ( SURFACE-AT ?auto_2128486 ?auto_2128492 ) ( ON ?auto_2128486 ?auto_2128491 ) ( CLEAR ?auto_2128486 ) ( not ( = ?auto_2128485 ?auto_2128491 ) ) ( not ( = ?auto_2128486 ?auto_2128491 ) ) ( not ( = ?auto_2128484 ?auto_2128491 ) ) ( TRUCK-AT ?auto_2128487 ?auto_2128488 ) ( SURFACE-AT ?auto_2128484 ?auto_2128488 ) ( CLEAR ?auto_2128484 ) ( IS-CRATE ?auto_2128485 ) ( AVAILABLE ?auto_2128490 ) ( IN ?auto_2128485 ?auto_2128487 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2128485 ?auto_2128486 )
      ( MAKE-2CRATE-VERIFY ?auto_2128484 ?auto_2128485 ?auto_2128486 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2128529 - SURFACE
      ?auto_2128530 - SURFACE
    )
    :vars
    (
      ?auto_2128535 - HOIST
      ?auto_2128532 - PLACE
      ?auto_2128531 - SURFACE
      ?auto_2128536 - PLACE
      ?auto_2128537 - HOIST
      ?auto_2128534 - SURFACE
      ?auto_2128533 - TRUCK
      ?auto_2128538 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2128535 ?auto_2128532 ) ( SURFACE-AT ?auto_2128529 ?auto_2128532 ) ( CLEAR ?auto_2128529 ) ( IS-CRATE ?auto_2128530 ) ( not ( = ?auto_2128529 ?auto_2128530 ) ) ( AVAILABLE ?auto_2128535 ) ( ON ?auto_2128529 ?auto_2128531 ) ( not ( = ?auto_2128531 ?auto_2128529 ) ) ( not ( = ?auto_2128531 ?auto_2128530 ) ) ( not ( = ?auto_2128536 ?auto_2128532 ) ) ( HOIST-AT ?auto_2128537 ?auto_2128536 ) ( not ( = ?auto_2128535 ?auto_2128537 ) ) ( AVAILABLE ?auto_2128537 ) ( SURFACE-AT ?auto_2128530 ?auto_2128536 ) ( ON ?auto_2128530 ?auto_2128534 ) ( CLEAR ?auto_2128530 ) ( not ( = ?auto_2128529 ?auto_2128534 ) ) ( not ( = ?auto_2128530 ?auto_2128534 ) ) ( not ( = ?auto_2128531 ?auto_2128534 ) ) ( TRUCK-AT ?auto_2128533 ?auto_2128538 ) ( not ( = ?auto_2128538 ?auto_2128532 ) ) ( not ( = ?auto_2128536 ?auto_2128538 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2128533 ?auto_2128538 ?auto_2128532 )
      ( MAKE-1CRATE ?auto_2128529 ?auto_2128530 )
      ( MAKE-1CRATE-VERIFY ?auto_2128529 ?auto_2128530 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2128569 - SURFACE
      ?auto_2128570 - SURFACE
      ?auto_2128571 - SURFACE
      ?auto_2128568 - SURFACE
    )
    :vars
    (
      ?auto_2128573 - HOIST
      ?auto_2128572 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2128573 ?auto_2128572 ) ( SURFACE-AT ?auto_2128571 ?auto_2128572 ) ( CLEAR ?auto_2128571 ) ( LIFTING ?auto_2128573 ?auto_2128568 ) ( IS-CRATE ?auto_2128568 ) ( not ( = ?auto_2128571 ?auto_2128568 ) ) ( ON ?auto_2128570 ?auto_2128569 ) ( ON ?auto_2128571 ?auto_2128570 ) ( not ( = ?auto_2128569 ?auto_2128570 ) ) ( not ( = ?auto_2128569 ?auto_2128571 ) ) ( not ( = ?auto_2128569 ?auto_2128568 ) ) ( not ( = ?auto_2128570 ?auto_2128571 ) ) ( not ( = ?auto_2128570 ?auto_2128568 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2128571 ?auto_2128568 )
      ( MAKE-3CRATE-VERIFY ?auto_2128569 ?auto_2128570 ?auto_2128571 ?auto_2128568 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2128586 - SURFACE
      ?auto_2128587 - SURFACE
      ?auto_2128588 - SURFACE
      ?auto_2128585 - SURFACE
    )
    :vars
    (
      ?auto_2128590 - HOIST
      ?auto_2128591 - PLACE
      ?auto_2128589 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2128590 ?auto_2128591 ) ( SURFACE-AT ?auto_2128588 ?auto_2128591 ) ( CLEAR ?auto_2128588 ) ( IS-CRATE ?auto_2128585 ) ( not ( = ?auto_2128588 ?auto_2128585 ) ) ( TRUCK-AT ?auto_2128589 ?auto_2128591 ) ( AVAILABLE ?auto_2128590 ) ( IN ?auto_2128585 ?auto_2128589 ) ( ON ?auto_2128588 ?auto_2128587 ) ( not ( = ?auto_2128587 ?auto_2128588 ) ) ( not ( = ?auto_2128587 ?auto_2128585 ) ) ( ON ?auto_2128587 ?auto_2128586 ) ( not ( = ?auto_2128586 ?auto_2128587 ) ) ( not ( = ?auto_2128586 ?auto_2128588 ) ) ( not ( = ?auto_2128586 ?auto_2128585 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2128587 ?auto_2128588 ?auto_2128585 )
      ( MAKE-3CRATE-VERIFY ?auto_2128586 ?auto_2128587 ?auto_2128588 ?auto_2128585 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2128607 - SURFACE
      ?auto_2128608 - SURFACE
      ?auto_2128609 - SURFACE
      ?auto_2128606 - SURFACE
    )
    :vars
    (
      ?auto_2128612 - HOIST
      ?auto_2128611 - PLACE
      ?auto_2128610 - TRUCK
      ?auto_2128613 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2128612 ?auto_2128611 ) ( SURFACE-AT ?auto_2128609 ?auto_2128611 ) ( CLEAR ?auto_2128609 ) ( IS-CRATE ?auto_2128606 ) ( not ( = ?auto_2128609 ?auto_2128606 ) ) ( AVAILABLE ?auto_2128612 ) ( IN ?auto_2128606 ?auto_2128610 ) ( ON ?auto_2128609 ?auto_2128608 ) ( not ( = ?auto_2128608 ?auto_2128609 ) ) ( not ( = ?auto_2128608 ?auto_2128606 ) ) ( TRUCK-AT ?auto_2128610 ?auto_2128613 ) ( not ( = ?auto_2128613 ?auto_2128611 ) ) ( ON ?auto_2128608 ?auto_2128607 ) ( not ( = ?auto_2128607 ?auto_2128608 ) ) ( not ( = ?auto_2128607 ?auto_2128609 ) ) ( not ( = ?auto_2128607 ?auto_2128606 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2128608 ?auto_2128609 ?auto_2128606 )
      ( MAKE-3CRATE-VERIFY ?auto_2128607 ?auto_2128608 ?auto_2128609 ?auto_2128606 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2128631 - SURFACE
      ?auto_2128632 - SURFACE
      ?auto_2128633 - SURFACE
      ?auto_2128630 - SURFACE
    )
    :vars
    (
      ?auto_2128636 - HOIST
      ?auto_2128634 - PLACE
      ?auto_2128637 - TRUCK
      ?auto_2128638 - PLACE
      ?auto_2128635 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2128636 ?auto_2128634 ) ( SURFACE-AT ?auto_2128633 ?auto_2128634 ) ( CLEAR ?auto_2128633 ) ( IS-CRATE ?auto_2128630 ) ( not ( = ?auto_2128633 ?auto_2128630 ) ) ( AVAILABLE ?auto_2128636 ) ( ON ?auto_2128633 ?auto_2128632 ) ( not ( = ?auto_2128632 ?auto_2128633 ) ) ( not ( = ?auto_2128632 ?auto_2128630 ) ) ( TRUCK-AT ?auto_2128637 ?auto_2128638 ) ( not ( = ?auto_2128638 ?auto_2128634 ) ) ( HOIST-AT ?auto_2128635 ?auto_2128638 ) ( LIFTING ?auto_2128635 ?auto_2128630 ) ( not ( = ?auto_2128636 ?auto_2128635 ) ) ( ON ?auto_2128632 ?auto_2128631 ) ( not ( = ?auto_2128631 ?auto_2128632 ) ) ( not ( = ?auto_2128631 ?auto_2128633 ) ) ( not ( = ?auto_2128631 ?auto_2128630 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2128632 ?auto_2128633 ?auto_2128630 )
      ( MAKE-3CRATE-VERIFY ?auto_2128631 ?auto_2128632 ?auto_2128633 ?auto_2128630 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2128658 - SURFACE
      ?auto_2128659 - SURFACE
      ?auto_2128660 - SURFACE
      ?auto_2128657 - SURFACE
    )
    :vars
    (
      ?auto_2128663 - HOIST
      ?auto_2128661 - PLACE
      ?auto_2128664 - TRUCK
      ?auto_2128666 - PLACE
      ?auto_2128662 - HOIST
      ?auto_2128665 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2128663 ?auto_2128661 ) ( SURFACE-AT ?auto_2128660 ?auto_2128661 ) ( CLEAR ?auto_2128660 ) ( IS-CRATE ?auto_2128657 ) ( not ( = ?auto_2128660 ?auto_2128657 ) ) ( AVAILABLE ?auto_2128663 ) ( ON ?auto_2128660 ?auto_2128659 ) ( not ( = ?auto_2128659 ?auto_2128660 ) ) ( not ( = ?auto_2128659 ?auto_2128657 ) ) ( TRUCK-AT ?auto_2128664 ?auto_2128666 ) ( not ( = ?auto_2128666 ?auto_2128661 ) ) ( HOIST-AT ?auto_2128662 ?auto_2128666 ) ( not ( = ?auto_2128663 ?auto_2128662 ) ) ( AVAILABLE ?auto_2128662 ) ( SURFACE-AT ?auto_2128657 ?auto_2128666 ) ( ON ?auto_2128657 ?auto_2128665 ) ( CLEAR ?auto_2128657 ) ( not ( = ?auto_2128660 ?auto_2128665 ) ) ( not ( = ?auto_2128657 ?auto_2128665 ) ) ( not ( = ?auto_2128659 ?auto_2128665 ) ) ( ON ?auto_2128659 ?auto_2128658 ) ( not ( = ?auto_2128658 ?auto_2128659 ) ) ( not ( = ?auto_2128658 ?auto_2128660 ) ) ( not ( = ?auto_2128658 ?auto_2128657 ) ) ( not ( = ?auto_2128658 ?auto_2128665 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2128659 ?auto_2128660 ?auto_2128657 )
      ( MAKE-3CRATE-VERIFY ?auto_2128658 ?auto_2128659 ?auto_2128660 ?auto_2128657 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2128686 - SURFACE
      ?auto_2128687 - SURFACE
      ?auto_2128688 - SURFACE
      ?auto_2128685 - SURFACE
    )
    :vars
    (
      ?auto_2128689 - HOIST
      ?auto_2128690 - PLACE
      ?auto_2128693 - PLACE
      ?auto_2128692 - HOIST
      ?auto_2128691 - SURFACE
      ?auto_2128694 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2128689 ?auto_2128690 ) ( SURFACE-AT ?auto_2128688 ?auto_2128690 ) ( CLEAR ?auto_2128688 ) ( IS-CRATE ?auto_2128685 ) ( not ( = ?auto_2128688 ?auto_2128685 ) ) ( AVAILABLE ?auto_2128689 ) ( ON ?auto_2128688 ?auto_2128687 ) ( not ( = ?auto_2128687 ?auto_2128688 ) ) ( not ( = ?auto_2128687 ?auto_2128685 ) ) ( not ( = ?auto_2128693 ?auto_2128690 ) ) ( HOIST-AT ?auto_2128692 ?auto_2128693 ) ( not ( = ?auto_2128689 ?auto_2128692 ) ) ( AVAILABLE ?auto_2128692 ) ( SURFACE-AT ?auto_2128685 ?auto_2128693 ) ( ON ?auto_2128685 ?auto_2128691 ) ( CLEAR ?auto_2128685 ) ( not ( = ?auto_2128688 ?auto_2128691 ) ) ( not ( = ?auto_2128685 ?auto_2128691 ) ) ( not ( = ?auto_2128687 ?auto_2128691 ) ) ( TRUCK-AT ?auto_2128694 ?auto_2128690 ) ( ON ?auto_2128687 ?auto_2128686 ) ( not ( = ?auto_2128686 ?auto_2128687 ) ) ( not ( = ?auto_2128686 ?auto_2128688 ) ) ( not ( = ?auto_2128686 ?auto_2128685 ) ) ( not ( = ?auto_2128686 ?auto_2128691 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2128687 ?auto_2128688 ?auto_2128685 )
      ( MAKE-3CRATE-VERIFY ?auto_2128686 ?auto_2128687 ?auto_2128688 ?auto_2128685 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2128714 - SURFACE
      ?auto_2128715 - SURFACE
      ?auto_2128716 - SURFACE
      ?auto_2128713 - SURFACE
    )
    :vars
    (
      ?auto_2128717 - HOIST
      ?auto_2128722 - PLACE
      ?auto_2128719 - PLACE
      ?auto_2128720 - HOIST
      ?auto_2128718 - SURFACE
      ?auto_2128721 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2128717 ?auto_2128722 ) ( IS-CRATE ?auto_2128713 ) ( not ( = ?auto_2128716 ?auto_2128713 ) ) ( not ( = ?auto_2128715 ?auto_2128716 ) ) ( not ( = ?auto_2128715 ?auto_2128713 ) ) ( not ( = ?auto_2128719 ?auto_2128722 ) ) ( HOIST-AT ?auto_2128720 ?auto_2128719 ) ( not ( = ?auto_2128717 ?auto_2128720 ) ) ( AVAILABLE ?auto_2128720 ) ( SURFACE-AT ?auto_2128713 ?auto_2128719 ) ( ON ?auto_2128713 ?auto_2128718 ) ( CLEAR ?auto_2128713 ) ( not ( = ?auto_2128716 ?auto_2128718 ) ) ( not ( = ?auto_2128713 ?auto_2128718 ) ) ( not ( = ?auto_2128715 ?auto_2128718 ) ) ( TRUCK-AT ?auto_2128721 ?auto_2128722 ) ( SURFACE-AT ?auto_2128715 ?auto_2128722 ) ( CLEAR ?auto_2128715 ) ( LIFTING ?auto_2128717 ?auto_2128716 ) ( IS-CRATE ?auto_2128716 ) ( ON ?auto_2128715 ?auto_2128714 ) ( not ( = ?auto_2128714 ?auto_2128715 ) ) ( not ( = ?auto_2128714 ?auto_2128716 ) ) ( not ( = ?auto_2128714 ?auto_2128713 ) ) ( not ( = ?auto_2128714 ?auto_2128718 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2128715 ?auto_2128716 ?auto_2128713 )
      ( MAKE-3CRATE-VERIFY ?auto_2128714 ?auto_2128715 ?auto_2128716 ?auto_2128713 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2128742 - SURFACE
      ?auto_2128743 - SURFACE
      ?auto_2128744 - SURFACE
      ?auto_2128741 - SURFACE
    )
    :vars
    (
      ?auto_2128750 - HOIST
      ?auto_2128749 - PLACE
      ?auto_2128745 - PLACE
      ?auto_2128747 - HOIST
      ?auto_2128746 - SURFACE
      ?auto_2128748 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2128750 ?auto_2128749 ) ( IS-CRATE ?auto_2128741 ) ( not ( = ?auto_2128744 ?auto_2128741 ) ) ( not ( = ?auto_2128743 ?auto_2128744 ) ) ( not ( = ?auto_2128743 ?auto_2128741 ) ) ( not ( = ?auto_2128745 ?auto_2128749 ) ) ( HOIST-AT ?auto_2128747 ?auto_2128745 ) ( not ( = ?auto_2128750 ?auto_2128747 ) ) ( AVAILABLE ?auto_2128747 ) ( SURFACE-AT ?auto_2128741 ?auto_2128745 ) ( ON ?auto_2128741 ?auto_2128746 ) ( CLEAR ?auto_2128741 ) ( not ( = ?auto_2128744 ?auto_2128746 ) ) ( not ( = ?auto_2128741 ?auto_2128746 ) ) ( not ( = ?auto_2128743 ?auto_2128746 ) ) ( TRUCK-AT ?auto_2128748 ?auto_2128749 ) ( SURFACE-AT ?auto_2128743 ?auto_2128749 ) ( CLEAR ?auto_2128743 ) ( IS-CRATE ?auto_2128744 ) ( AVAILABLE ?auto_2128750 ) ( IN ?auto_2128744 ?auto_2128748 ) ( ON ?auto_2128743 ?auto_2128742 ) ( not ( = ?auto_2128742 ?auto_2128743 ) ) ( not ( = ?auto_2128742 ?auto_2128744 ) ) ( not ( = ?auto_2128742 ?auto_2128741 ) ) ( not ( = ?auto_2128742 ?auto_2128746 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2128743 ?auto_2128744 ?auto_2128741 )
      ( MAKE-3CRATE-VERIFY ?auto_2128742 ?auto_2128743 ?auto_2128744 ?auto_2128741 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2129033 - SURFACE
      ?auto_2129034 - SURFACE
      ?auto_2129035 - SURFACE
      ?auto_2129032 - SURFACE
      ?auto_2129036 - SURFACE
    )
    :vars
    (
      ?auto_2129038 - HOIST
      ?auto_2129037 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2129038 ?auto_2129037 ) ( SURFACE-AT ?auto_2129032 ?auto_2129037 ) ( CLEAR ?auto_2129032 ) ( LIFTING ?auto_2129038 ?auto_2129036 ) ( IS-CRATE ?auto_2129036 ) ( not ( = ?auto_2129032 ?auto_2129036 ) ) ( ON ?auto_2129034 ?auto_2129033 ) ( ON ?auto_2129035 ?auto_2129034 ) ( ON ?auto_2129032 ?auto_2129035 ) ( not ( = ?auto_2129033 ?auto_2129034 ) ) ( not ( = ?auto_2129033 ?auto_2129035 ) ) ( not ( = ?auto_2129033 ?auto_2129032 ) ) ( not ( = ?auto_2129033 ?auto_2129036 ) ) ( not ( = ?auto_2129034 ?auto_2129035 ) ) ( not ( = ?auto_2129034 ?auto_2129032 ) ) ( not ( = ?auto_2129034 ?auto_2129036 ) ) ( not ( = ?auto_2129035 ?auto_2129032 ) ) ( not ( = ?auto_2129035 ?auto_2129036 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2129032 ?auto_2129036 )
      ( MAKE-4CRATE-VERIFY ?auto_2129033 ?auto_2129034 ?auto_2129035 ?auto_2129032 ?auto_2129036 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2129058 - SURFACE
      ?auto_2129059 - SURFACE
      ?auto_2129060 - SURFACE
      ?auto_2129057 - SURFACE
      ?auto_2129061 - SURFACE
    )
    :vars
    (
      ?auto_2129062 - HOIST
      ?auto_2129064 - PLACE
      ?auto_2129063 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2129062 ?auto_2129064 ) ( SURFACE-AT ?auto_2129057 ?auto_2129064 ) ( CLEAR ?auto_2129057 ) ( IS-CRATE ?auto_2129061 ) ( not ( = ?auto_2129057 ?auto_2129061 ) ) ( TRUCK-AT ?auto_2129063 ?auto_2129064 ) ( AVAILABLE ?auto_2129062 ) ( IN ?auto_2129061 ?auto_2129063 ) ( ON ?auto_2129057 ?auto_2129060 ) ( not ( = ?auto_2129060 ?auto_2129057 ) ) ( not ( = ?auto_2129060 ?auto_2129061 ) ) ( ON ?auto_2129059 ?auto_2129058 ) ( ON ?auto_2129060 ?auto_2129059 ) ( not ( = ?auto_2129058 ?auto_2129059 ) ) ( not ( = ?auto_2129058 ?auto_2129060 ) ) ( not ( = ?auto_2129058 ?auto_2129057 ) ) ( not ( = ?auto_2129058 ?auto_2129061 ) ) ( not ( = ?auto_2129059 ?auto_2129060 ) ) ( not ( = ?auto_2129059 ?auto_2129057 ) ) ( not ( = ?auto_2129059 ?auto_2129061 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2129060 ?auto_2129057 ?auto_2129061 )
      ( MAKE-4CRATE-VERIFY ?auto_2129058 ?auto_2129059 ?auto_2129060 ?auto_2129057 ?auto_2129061 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2129088 - SURFACE
      ?auto_2129089 - SURFACE
      ?auto_2129090 - SURFACE
      ?auto_2129087 - SURFACE
      ?auto_2129091 - SURFACE
    )
    :vars
    (
      ?auto_2129093 - HOIST
      ?auto_2129095 - PLACE
      ?auto_2129092 - TRUCK
      ?auto_2129094 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2129093 ?auto_2129095 ) ( SURFACE-AT ?auto_2129087 ?auto_2129095 ) ( CLEAR ?auto_2129087 ) ( IS-CRATE ?auto_2129091 ) ( not ( = ?auto_2129087 ?auto_2129091 ) ) ( AVAILABLE ?auto_2129093 ) ( IN ?auto_2129091 ?auto_2129092 ) ( ON ?auto_2129087 ?auto_2129090 ) ( not ( = ?auto_2129090 ?auto_2129087 ) ) ( not ( = ?auto_2129090 ?auto_2129091 ) ) ( TRUCK-AT ?auto_2129092 ?auto_2129094 ) ( not ( = ?auto_2129094 ?auto_2129095 ) ) ( ON ?auto_2129089 ?auto_2129088 ) ( ON ?auto_2129090 ?auto_2129089 ) ( not ( = ?auto_2129088 ?auto_2129089 ) ) ( not ( = ?auto_2129088 ?auto_2129090 ) ) ( not ( = ?auto_2129088 ?auto_2129087 ) ) ( not ( = ?auto_2129088 ?auto_2129091 ) ) ( not ( = ?auto_2129089 ?auto_2129090 ) ) ( not ( = ?auto_2129089 ?auto_2129087 ) ) ( not ( = ?auto_2129089 ?auto_2129091 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2129090 ?auto_2129087 ?auto_2129091 )
      ( MAKE-4CRATE-VERIFY ?auto_2129088 ?auto_2129089 ?auto_2129090 ?auto_2129087 ?auto_2129091 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2129122 - SURFACE
      ?auto_2129123 - SURFACE
      ?auto_2129124 - SURFACE
      ?auto_2129121 - SURFACE
      ?auto_2129125 - SURFACE
    )
    :vars
    (
      ?auto_2129126 - HOIST
      ?auto_2129129 - PLACE
      ?auto_2129128 - TRUCK
      ?auto_2129130 - PLACE
      ?auto_2129127 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2129126 ?auto_2129129 ) ( SURFACE-AT ?auto_2129121 ?auto_2129129 ) ( CLEAR ?auto_2129121 ) ( IS-CRATE ?auto_2129125 ) ( not ( = ?auto_2129121 ?auto_2129125 ) ) ( AVAILABLE ?auto_2129126 ) ( ON ?auto_2129121 ?auto_2129124 ) ( not ( = ?auto_2129124 ?auto_2129121 ) ) ( not ( = ?auto_2129124 ?auto_2129125 ) ) ( TRUCK-AT ?auto_2129128 ?auto_2129130 ) ( not ( = ?auto_2129130 ?auto_2129129 ) ) ( HOIST-AT ?auto_2129127 ?auto_2129130 ) ( LIFTING ?auto_2129127 ?auto_2129125 ) ( not ( = ?auto_2129126 ?auto_2129127 ) ) ( ON ?auto_2129123 ?auto_2129122 ) ( ON ?auto_2129124 ?auto_2129123 ) ( not ( = ?auto_2129122 ?auto_2129123 ) ) ( not ( = ?auto_2129122 ?auto_2129124 ) ) ( not ( = ?auto_2129122 ?auto_2129121 ) ) ( not ( = ?auto_2129122 ?auto_2129125 ) ) ( not ( = ?auto_2129123 ?auto_2129124 ) ) ( not ( = ?auto_2129123 ?auto_2129121 ) ) ( not ( = ?auto_2129123 ?auto_2129125 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2129124 ?auto_2129121 ?auto_2129125 )
      ( MAKE-4CRATE-VERIFY ?auto_2129122 ?auto_2129123 ?auto_2129124 ?auto_2129121 ?auto_2129125 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2129160 - SURFACE
      ?auto_2129161 - SURFACE
      ?auto_2129162 - SURFACE
      ?auto_2129159 - SURFACE
      ?auto_2129163 - SURFACE
    )
    :vars
    (
      ?auto_2129166 - HOIST
      ?auto_2129164 - PLACE
      ?auto_2129168 - TRUCK
      ?auto_2129169 - PLACE
      ?auto_2129167 - HOIST
      ?auto_2129165 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2129166 ?auto_2129164 ) ( SURFACE-AT ?auto_2129159 ?auto_2129164 ) ( CLEAR ?auto_2129159 ) ( IS-CRATE ?auto_2129163 ) ( not ( = ?auto_2129159 ?auto_2129163 ) ) ( AVAILABLE ?auto_2129166 ) ( ON ?auto_2129159 ?auto_2129162 ) ( not ( = ?auto_2129162 ?auto_2129159 ) ) ( not ( = ?auto_2129162 ?auto_2129163 ) ) ( TRUCK-AT ?auto_2129168 ?auto_2129169 ) ( not ( = ?auto_2129169 ?auto_2129164 ) ) ( HOIST-AT ?auto_2129167 ?auto_2129169 ) ( not ( = ?auto_2129166 ?auto_2129167 ) ) ( AVAILABLE ?auto_2129167 ) ( SURFACE-AT ?auto_2129163 ?auto_2129169 ) ( ON ?auto_2129163 ?auto_2129165 ) ( CLEAR ?auto_2129163 ) ( not ( = ?auto_2129159 ?auto_2129165 ) ) ( not ( = ?auto_2129163 ?auto_2129165 ) ) ( not ( = ?auto_2129162 ?auto_2129165 ) ) ( ON ?auto_2129161 ?auto_2129160 ) ( ON ?auto_2129162 ?auto_2129161 ) ( not ( = ?auto_2129160 ?auto_2129161 ) ) ( not ( = ?auto_2129160 ?auto_2129162 ) ) ( not ( = ?auto_2129160 ?auto_2129159 ) ) ( not ( = ?auto_2129160 ?auto_2129163 ) ) ( not ( = ?auto_2129160 ?auto_2129165 ) ) ( not ( = ?auto_2129161 ?auto_2129162 ) ) ( not ( = ?auto_2129161 ?auto_2129159 ) ) ( not ( = ?auto_2129161 ?auto_2129163 ) ) ( not ( = ?auto_2129161 ?auto_2129165 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2129162 ?auto_2129159 ?auto_2129163 )
      ( MAKE-4CRATE-VERIFY ?auto_2129160 ?auto_2129161 ?auto_2129162 ?auto_2129159 ?auto_2129163 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2129199 - SURFACE
      ?auto_2129200 - SURFACE
      ?auto_2129201 - SURFACE
      ?auto_2129198 - SURFACE
      ?auto_2129202 - SURFACE
    )
    :vars
    (
      ?auto_2129207 - HOIST
      ?auto_2129204 - PLACE
      ?auto_2129208 - PLACE
      ?auto_2129206 - HOIST
      ?auto_2129205 - SURFACE
      ?auto_2129203 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2129207 ?auto_2129204 ) ( SURFACE-AT ?auto_2129198 ?auto_2129204 ) ( CLEAR ?auto_2129198 ) ( IS-CRATE ?auto_2129202 ) ( not ( = ?auto_2129198 ?auto_2129202 ) ) ( AVAILABLE ?auto_2129207 ) ( ON ?auto_2129198 ?auto_2129201 ) ( not ( = ?auto_2129201 ?auto_2129198 ) ) ( not ( = ?auto_2129201 ?auto_2129202 ) ) ( not ( = ?auto_2129208 ?auto_2129204 ) ) ( HOIST-AT ?auto_2129206 ?auto_2129208 ) ( not ( = ?auto_2129207 ?auto_2129206 ) ) ( AVAILABLE ?auto_2129206 ) ( SURFACE-AT ?auto_2129202 ?auto_2129208 ) ( ON ?auto_2129202 ?auto_2129205 ) ( CLEAR ?auto_2129202 ) ( not ( = ?auto_2129198 ?auto_2129205 ) ) ( not ( = ?auto_2129202 ?auto_2129205 ) ) ( not ( = ?auto_2129201 ?auto_2129205 ) ) ( TRUCK-AT ?auto_2129203 ?auto_2129204 ) ( ON ?auto_2129200 ?auto_2129199 ) ( ON ?auto_2129201 ?auto_2129200 ) ( not ( = ?auto_2129199 ?auto_2129200 ) ) ( not ( = ?auto_2129199 ?auto_2129201 ) ) ( not ( = ?auto_2129199 ?auto_2129198 ) ) ( not ( = ?auto_2129199 ?auto_2129202 ) ) ( not ( = ?auto_2129199 ?auto_2129205 ) ) ( not ( = ?auto_2129200 ?auto_2129201 ) ) ( not ( = ?auto_2129200 ?auto_2129198 ) ) ( not ( = ?auto_2129200 ?auto_2129202 ) ) ( not ( = ?auto_2129200 ?auto_2129205 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2129201 ?auto_2129198 ?auto_2129202 )
      ( MAKE-4CRATE-VERIFY ?auto_2129199 ?auto_2129200 ?auto_2129201 ?auto_2129198 ?auto_2129202 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2129238 - SURFACE
      ?auto_2129239 - SURFACE
      ?auto_2129240 - SURFACE
      ?auto_2129237 - SURFACE
      ?auto_2129241 - SURFACE
    )
    :vars
    (
      ?auto_2129246 - HOIST
      ?auto_2129243 - PLACE
      ?auto_2129245 - PLACE
      ?auto_2129247 - HOIST
      ?auto_2129244 - SURFACE
      ?auto_2129242 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2129246 ?auto_2129243 ) ( IS-CRATE ?auto_2129241 ) ( not ( = ?auto_2129237 ?auto_2129241 ) ) ( not ( = ?auto_2129240 ?auto_2129237 ) ) ( not ( = ?auto_2129240 ?auto_2129241 ) ) ( not ( = ?auto_2129245 ?auto_2129243 ) ) ( HOIST-AT ?auto_2129247 ?auto_2129245 ) ( not ( = ?auto_2129246 ?auto_2129247 ) ) ( AVAILABLE ?auto_2129247 ) ( SURFACE-AT ?auto_2129241 ?auto_2129245 ) ( ON ?auto_2129241 ?auto_2129244 ) ( CLEAR ?auto_2129241 ) ( not ( = ?auto_2129237 ?auto_2129244 ) ) ( not ( = ?auto_2129241 ?auto_2129244 ) ) ( not ( = ?auto_2129240 ?auto_2129244 ) ) ( TRUCK-AT ?auto_2129242 ?auto_2129243 ) ( SURFACE-AT ?auto_2129240 ?auto_2129243 ) ( CLEAR ?auto_2129240 ) ( LIFTING ?auto_2129246 ?auto_2129237 ) ( IS-CRATE ?auto_2129237 ) ( ON ?auto_2129239 ?auto_2129238 ) ( ON ?auto_2129240 ?auto_2129239 ) ( not ( = ?auto_2129238 ?auto_2129239 ) ) ( not ( = ?auto_2129238 ?auto_2129240 ) ) ( not ( = ?auto_2129238 ?auto_2129237 ) ) ( not ( = ?auto_2129238 ?auto_2129241 ) ) ( not ( = ?auto_2129238 ?auto_2129244 ) ) ( not ( = ?auto_2129239 ?auto_2129240 ) ) ( not ( = ?auto_2129239 ?auto_2129237 ) ) ( not ( = ?auto_2129239 ?auto_2129241 ) ) ( not ( = ?auto_2129239 ?auto_2129244 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2129240 ?auto_2129237 ?auto_2129241 )
      ( MAKE-4CRATE-VERIFY ?auto_2129238 ?auto_2129239 ?auto_2129240 ?auto_2129237 ?auto_2129241 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2129277 - SURFACE
      ?auto_2129278 - SURFACE
      ?auto_2129279 - SURFACE
      ?auto_2129276 - SURFACE
      ?auto_2129280 - SURFACE
    )
    :vars
    (
      ?auto_2129282 - HOIST
      ?auto_2129286 - PLACE
      ?auto_2129281 - PLACE
      ?auto_2129285 - HOIST
      ?auto_2129283 - SURFACE
      ?auto_2129284 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2129282 ?auto_2129286 ) ( IS-CRATE ?auto_2129280 ) ( not ( = ?auto_2129276 ?auto_2129280 ) ) ( not ( = ?auto_2129279 ?auto_2129276 ) ) ( not ( = ?auto_2129279 ?auto_2129280 ) ) ( not ( = ?auto_2129281 ?auto_2129286 ) ) ( HOIST-AT ?auto_2129285 ?auto_2129281 ) ( not ( = ?auto_2129282 ?auto_2129285 ) ) ( AVAILABLE ?auto_2129285 ) ( SURFACE-AT ?auto_2129280 ?auto_2129281 ) ( ON ?auto_2129280 ?auto_2129283 ) ( CLEAR ?auto_2129280 ) ( not ( = ?auto_2129276 ?auto_2129283 ) ) ( not ( = ?auto_2129280 ?auto_2129283 ) ) ( not ( = ?auto_2129279 ?auto_2129283 ) ) ( TRUCK-AT ?auto_2129284 ?auto_2129286 ) ( SURFACE-AT ?auto_2129279 ?auto_2129286 ) ( CLEAR ?auto_2129279 ) ( IS-CRATE ?auto_2129276 ) ( AVAILABLE ?auto_2129282 ) ( IN ?auto_2129276 ?auto_2129284 ) ( ON ?auto_2129278 ?auto_2129277 ) ( ON ?auto_2129279 ?auto_2129278 ) ( not ( = ?auto_2129277 ?auto_2129278 ) ) ( not ( = ?auto_2129277 ?auto_2129279 ) ) ( not ( = ?auto_2129277 ?auto_2129276 ) ) ( not ( = ?auto_2129277 ?auto_2129280 ) ) ( not ( = ?auto_2129277 ?auto_2129283 ) ) ( not ( = ?auto_2129278 ?auto_2129279 ) ) ( not ( = ?auto_2129278 ?auto_2129276 ) ) ( not ( = ?auto_2129278 ?auto_2129280 ) ) ( not ( = ?auto_2129278 ?auto_2129283 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2129279 ?auto_2129276 ?auto_2129280 )
      ( MAKE-4CRATE-VERIFY ?auto_2129277 ?auto_2129278 ?auto_2129279 ?auto_2129276 ?auto_2129280 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2129937 - SURFACE
      ?auto_2129938 - SURFACE
      ?auto_2129939 - SURFACE
      ?auto_2129936 - SURFACE
      ?auto_2129940 - SURFACE
      ?auto_2129941 - SURFACE
    )
    :vars
    (
      ?auto_2129943 - HOIST
      ?auto_2129942 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2129943 ?auto_2129942 ) ( SURFACE-AT ?auto_2129940 ?auto_2129942 ) ( CLEAR ?auto_2129940 ) ( LIFTING ?auto_2129943 ?auto_2129941 ) ( IS-CRATE ?auto_2129941 ) ( not ( = ?auto_2129940 ?auto_2129941 ) ) ( ON ?auto_2129938 ?auto_2129937 ) ( ON ?auto_2129939 ?auto_2129938 ) ( ON ?auto_2129936 ?auto_2129939 ) ( ON ?auto_2129940 ?auto_2129936 ) ( not ( = ?auto_2129937 ?auto_2129938 ) ) ( not ( = ?auto_2129937 ?auto_2129939 ) ) ( not ( = ?auto_2129937 ?auto_2129936 ) ) ( not ( = ?auto_2129937 ?auto_2129940 ) ) ( not ( = ?auto_2129937 ?auto_2129941 ) ) ( not ( = ?auto_2129938 ?auto_2129939 ) ) ( not ( = ?auto_2129938 ?auto_2129936 ) ) ( not ( = ?auto_2129938 ?auto_2129940 ) ) ( not ( = ?auto_2129938 ?auto_2129941 ) ) ( not ( = ?auto_2129939 ?auto_2129936 ) ) ( not ( = ?auto_2129939 ?auto_2129940 ) ) ( not ( = ?auto_2129939 ?auto_2129941 ) ) ( not ( = ?auto_2129936 ?auto_2129940 ) ) ( not ( = ?auto_2129936 ?auto_2129941 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2129940 ?auto_2129941 )
      ( MAKE-5CRATE-VERIFY ?auto_2129937 ?auto_2129938 ?auto_2129939 ?auto_2129936 ?auto_2129940 ?auto_2129941 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2129971 - SURFACE
      ?auto_2129972 - SURFACE
      ?auto_2129973 - SURFACE
      ?auto_2129970 - SURFACE
      ?auto_2129974 - SURFACE
      ?auto_2129975 - SURFACE
    )
    :vars
    (
      ?auto_2129976 - HOIST
      ?auto_2129978 - PLACE
      ?auto_2129977 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2129976 ?auto_2129978 ) ( SURFACE-AT ?auto_2129974 ?auto_2129978 ) ( CLEAR ?auto_2129974 ) ( IS-CRATE ?auto_2129975 ) ( not ( = ?auto_2129974 ?auto_2129975 ) ) ( TRUCK-AT ?auto_2129977 ?auto_2129978 ) ( AVAILABLE ?auto_2129976 ) ( IN ?auto_2129975 ?auto_2129977 ) ( ON ?auto_2129974 ?auto_2129970 ) ( not ( = ?auto_2129970 ?auto_2129974 ) ) ( not ( = ?auto_2129970 ?auto_2129975 ) ) ( ON ?auto_2129972 ?auto_2129971 ) ( ON ?auto_2129973 ?auto_2129972 ) ( ON ?auto_2129970 ?auto_2129973 ) ( not ( = ?auto_2129971 ?auto_2129972 ) ) ( not ( = ?auto_2129971 ?auto_2129973 ) ) ( not ( = ?auto_2129971 ?auto_2129970 ) ) ( not ( = ?auto_2129971 ?auto_2129974 ) ) ( not ( = ?auto_2129971 ?auto_2129975 ) ) ( not ( = ?auto_2129972 ?auto_2129973 ) ) ( not ( = ?auto_2129972 ?auto_2129970 ) ) ( not ( = ?auto_2129972 ?auto_2129974 ) ) ( not ( = ?auto_2129972 ?auto_2129975 ) ) ( not ( = ?auto_2129973 ?auto_2129970 ) ) ( not ( = ?auto_2129973 ?auto_2129974 ) ) ( not ( = ?auto_2129973 ?auto_2129975 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2129970 ?auto_2129974 ?auto_2129975 )
      ( MAKE-5CRATE-VERIFY ?auto_2129971 ?auto_2129972 ?auto_2129973 ?auto_2129970 ?auto_2129974 ?auto_2129975 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2130011 - SURFACE
      ?auto_2130012 - SURFACE
      ?auto_2130013 - SURFACE
      ?auto_2130010 - SURFACE
      ?auto_2130014 - SURFACE
      ?auto_2130015 - SURFACE
    )
    :vars
    (
      ?auto_2130019 - HOIST
      ?auto_2130018 - PLACE
      ?auto_2130017 - TRUCK
      ?auto_2130016 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2130019 ?auto_2130018 ) ( SURFACE-AT ?auto_2130014 ?auto_2130018 ) ( CLEAR ?auto_2130014 ) ( IS-CRATE ?auto_2130015 ) ( not ( = ?auto_2130014 ?auto_2130015 ) ) ( AVAILABLE ?auto_2130019 ) ( IN ?auto_2130015 ?auto_2130017 ) ( ON ?auto_2130014 ?auto_2130010 ) ( not ( = ?auto_2130010 ?auto_2130014 ) ) ( not ( = ?auto_2130010 ?auto_2130015 ) ) ( TRUCK-AT ?auto_2130017 ?auto_2130016 ) ( not ( = ?auto_2130016 ?auto_2130018 ) ) ( ON ?auto_2130012 ?auto_2130011 ) ( ON ?auto_2130013 ?auto_2130012 ) ( ON ?auto_2130010 ?auto_2130013 ) ( not ( = ?auto_2130011 ?auto_2130012 ) ) ( not ( = ?auto_2130011 ?auto_2130013 ) ) ( not ( = ?auto_2130011 ?auto_2130010 ) ) ( not ( = ?auto_2130011 ?auto_2130014 ) ) ( not ( = ?auto_2130011 ?auto_2130015 ) ) ( not ( = ?auto_2130012 ?auto_2130013 ) ) ( not ( = ?auto_2130012 ?auto_2130010 ) ) ( not ( = ?auto_2130012 ?auto_2130014 ) ) ( not ( = ?auto_2130012 ?auto_2130015 ) ) ( not ( = ?auto_2130013 ?auto_2130010 ) ) ( not ( = ?auto_2130013 ?auto_2130014 ) ) ( not ( = ?auto_2130013 ?auto_2130015 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2130010 ?auto_2130014 ?auto_2130015 )
      ( MAKE-5CRATE-VERIFY ?auto_2130011 ?auto_2130012 ?auto_2130013 ?auto_2130010 ?auto_2130014 ?auto_2130015 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2130056 - SURFACE
      ?auto_2130057 - SURFACE
      ?auto_2130058 - SURFACE
      ?auto_2130055 - SURFACE
      ?auto_2130059 - SURFACE
      ?auto_2130060 - SURFACE
    )
    :vars
    (
      ?auto_2130062 - HOIST
      ?auto_2130064 - PLACE
      ?auto_2130061 - TRUCK
      ?auto_2130063 - PLACE
      ?auto_2130065 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2130062 ?auto_2130064 ) ( SURFACE-AT ?auto_2130059 ?auto_2130064 ) ( CLEAR ?auto_2130059 ) ( IS-CRATE ?auto_2130060 ) ( not ( = ?auto_2130059 ?auto_2130060 ) ) ( AVAILABLE ?auto_2130062 ) ( ON ?auto_2130059 ?auto_2130055 ) ( not ( = ?auto_2130055 ?auto_2130059 ) ) ( not ( = ?auto_2130055 ?auto_2130060 ) ) ( TRUCK-AT ?auto_2130061 ?auto_2130063 ) ( not ( = ?auto_2130063 ?auto_2130064 ) ) ( HOIST-AT ?auto_2130065 ?auto_2130063 ) ( LIFTING ?auto_2130065 ?auto_2130060 ) ( not ( = ?auto_2130062 ?auto_2130065 ) ) ( ON ?auto_2130057 ?auto_2130056 ) ( ON ?auto_2130058 ?auto_2130057 ) ( ON ?auto_2130055 ?auto_2130058 ) ( not ( = ?auto_2130056 ?auto_2130057 ) ) ( not ( = ?auto_2130056 ?auto_2130058 ) ) ( not ( = ?auto_2130056 ?auto_2130055 ) ) ( not ( = ?auto_2130056 ?auto_2130059 ) ) ( not ( = ?auto_2130056 ?auto_2130060 ) ) ( not ( = ?auto_2130057 ?auto_2130058 ) ) ( not ( = ?auto_2130057 ?auto_2130055 ) ) ( not ( = ?auto_2130057 ?auto_2130059 ) ) ( not ( = ?auto_2130057 ?auto_2130060 ) ) ( not ( = ?auto_2130058 ?auto_2130055 ) ) ( not ( = ?auto_2130058 ?auto_2130059 ) ) ( not ( = ?auto_2130058 ?auto_2130060 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2130055 ?auto_2130059 ?auto_2130060 )
      ( MAKE-5CRATE-VERIFY ?auto_2130056 ?auto_2130057 ?auto_2130058 ?auto_2130055 ?auto_2130059 ?auto_2130060 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2130106 - SURFACE
      ?auto_2130107 - SURFACE
      ?auto_2130108 - SURFACE
      ?auto_2130105 - SURFACE
      ?auto_2130109 - SURFACE
      ?auto_2130110 - SURFACE
    )
    :vars
    (
      ?auto_2130115 - HOIST
      ?auto_2130116 - PLACE
      ?auto_2130111 - TRUCK
      ?auto_2130113 - PLACE
      ?auto_2130114 - HOIST
      ?auto_2130112 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2130115 ?auto_2130116 ) ( SURFACE-AT ?auto_2130109 ?auto_2130116 ) ( CLEAR ?auto_2130109 ) ( IS-CRATE ?auto_2130110 ) ( not ( = ?auto_2130109 ?auto_2130110 ) ) ( AVAILABLE ?auto_2130115 ) ( ON ?auto_2130109 ?auto_2130105 ) ( not ( = ?auto_2130105 ?auto_2130109 ) ) ( not ( = ?auto_2130105 ?auto_2130110 ) ) ( TRUCK-AT ?auto_2130111 ?auto_2130113 ) ( not ( = ?auto_2130113 ?auto_2130116 ) ) ( HOIST-AT ?auto_2130114 ?auto_2130113 ) ( not ( = ?auto_2130115 ?auto_2130114 ) ) ( AVAILABLE ?auto_2130114 ) ( SURFACE-AT ?auto_2130110 ?auto_2130113 ) ( ON ?auto_2130110 ?auto_2130112 ) ( CLEAR ?auto_2130110 ) ( not ( = ?auto_2130109 ?auto_2130112 ) ) ( not ( = ?auto_2130110 ?auto_2130112 ) ) ( not ( = ?auto_2130105 ?auto_2130112 ) ) ( ON ?auto_2130107 ?auto_2130106 ) ( ON ?auto_2130108 ?auto_2130107 ) ( ON ?auto_2130105 ?auto_2130108 ) ( not ( = ?auto_2130106 ?auto_2130107 ) ) ( not ( = ?auto_2130106 ?auto_2130108 ) ) ( not ( = ?auto_2130106 ?auto_2130105 ) ) ( not ( = ?auto_2130106 ?auto_2130109 ) ) ( not ( = ?auto_2130106 ?auto_2130110 ) ) ( not ( = ?auto_2130106 ?auto_2130112 ) ) ( not ( = ?auto_2130107 ?auto_2130108 ) ) ( not ( = ?auto_2130107 ?auto_2130105 ) ) ( not ( = ?auto_2130107 ?auto_2130109 ) ) ( not ( = ?auto_2130107 ?auto_2130110 ) ) ( not ( = ?auto_2130107 ?auto_2130112 ) ) ( not ( = ?auto_2130108 ?auto_2130105 ) ) ( not ( = ?auto_2130108 ?auto_2130109 ) ) ( not ( = ?auto_2130108 ?auto_2130110 ) ) ( not ( = ?auto_2130108 ?auto_2130112 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2130105 ?auto_2130109 ?auto_2130110 )
      ( MAKE-5CRATE-VERIFY ?auto_2130106 ?auto_2130107 ?auto_2130108 ?auto_2130105 ?auto_2130109 ?auto_2130110 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2130157 - SURFACE
      ?auto_2130158 - SURFACE
      ?auto_2130159 - SURFACE
      ?auto_2130156 - SURFACE
      ?auto_2130160 - SURFACE
      ?auto_2130161 - SURFACE
    )
    :vars
    (
      ?auto_2130162 - HOIST
      ?auto_2130167 - PLACE
      ?auto_2130165 - PLACE
      ?auto_2130163 - HOIST
      ?auto_2130164 - SURFACE
      ?auto_2130166 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2130162 ?auto_2130167 ) ( SURFACE-AT ?auto_2130160 ?auto_2130167 ) ( CLEAR ?auto_2130160 ) ( IS-CRATE ?auto_2130161 ) ( not ( = ?auto_2130160 ?auto_2130161 ) ) ( AVAILABLE ?auto_2130162 ) ( ON ?auto_2130160 ?auto_2130156 ) ( not ( = ?auto_2130156 ?auto_2130160 ) ) ( not ( = ?auto_2130156 ?auto_2130161 ) ) ( not ( = ?auto_2130165 ?auto_2130167 ) ) ( HOIST-AT ?auto_2130163 ?auto_2130165 ) ( not ( = ?auto_2130162 ?auto_2130163 ) ) ( AVAILABLE ?auto_2130163 ) ( SURFACE-AT ?auto_2130161 ?auto_2130165 ) ( ON ?auto_2130161 ?auto_2130164 ) ( CLEAR ?auto_2130161 ) ( not ( = ?auto_2130160 ?auto_2130164 ) ) ( not ( = ?auto_2130161 ?auto_2130164 ) ) ( not ( = ?auto_2130156 ?auto_2130164 ) ) ( TRUCK-AT ?auto_2130166 ?auto_2130167 ) ( ON ?auto_2130158 ?auto_2130157 ) ( ON ?auto_2130159 ?auto_2130158 ) ( ON ?auto_2130156 ?auto_2130159 ) ( not ( = ?auto_2130157 ?auto_2130158 ) ) ( not ( = ?auto_2130157 ?auto_2130159 ) ) ( not ( = ?auto_2130157 ?auto_2130156 ) ) ( not ( = ?auto_2130157 ?auto_2130160 ) ) ( not ( = ?auto_2130157 ?auto_2130161 ) ) ( not ( = ?auto_2130157 ?auto_2130164 ) ) ( not ( = ?auto_2130158 ?auto_2130159 ) ) ( not ( = ?auto_2130158 ?auto_2130156 ) ) ( not ( = ?auto_2130158 ?auto_2130160 ) ) ( not ( = ?auto_2130158 ?auto_2130161 ) ) ( not ( = ?auto_2130158 ?auto_2130164 ) ) ( not ( = ?auto_2130159 ?auto_2130156 ) ) ( not ( = ?auto_2130159 ?auto_2130160 ) ) ( not ( = ?auto_2130159 ?auto_2130161 ) ) ( not ( = ?auto_2130159 ?auto_2130164 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2130156 ?auto_2130160 ?auto_2130161 )
      ( MAKE-5CRATE-VERIFY ?auto_2130157 ?auto_2130158 ?auto_2130159 ?auto_2130156 ?auto_2130160 ?auto_2130161 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2130208 - SURFACE
      ?auto_2130209 - SURFACE
      ?auto_2130210 - SURFACE
      ?auto_2130207 - SURFACE
      ?auto_2130211 - SURFACE
      ?auto_2130212 - SURFACE
    )
    :vars
    (
      ?auto_2130214 - HOIST
      ?auto_2130213 - PLACE
      ?auto_2130217 - PLACE
      ?auto_2130215 - HOIST
      ?auto_2130218 - SURFACE
      ?auto_2130216 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2130214 ?auto_2130213 ) ( IS-CRATE ?auto_2130212 ) ( not ( = ?auto_2130211 ?auto_2130212 ) ) ( not ( = ?auto_2130207 ?auto_2130211 ) ) ( not ( = ?auto_2130207 ?auto_2130212 ) ) ( not ( = ?auto_2130217 ?auto_2130213 ) ) ( HOIST-AT ?auto_2130215 ?auto_2130217 ) ( not ( = ?auto_2130214 ?auto_2130215 ) ) ( AVAILABLE ?auto_2130215 ) ( SURFACE-AT ?auto_2130212 ?auto_2130217 ) ( ON ?auto_2130212 ?auto_2130218 ) ( CLEAR ?auto_2130212 ) ( not ( = ?auto_2130211 ?auto_2130218 ) ) ( not ( = ?auto_2130212 ?auto_2130218 ) ) ( not ( = ?auto_2130207 ?auto_2130218 ) ) ( TRUCK-AT ?auto_2130216 ?auto_2130213 ) ( SURFACE-AT ?auto_2130207 ?auto_2130213 ) ( CLEAR ?auto_2130207 ) ( LIFTING ?auto_2130214 ?auto_2130211 ) ( IS-CRATE ?auto_2130211 ) ( ON ?auto_2130209 ?auto_2130208 ) ( ON ?auto_2130210 ?auto_2130209 ) ( ON ?auto_2130207 ?auto_2130210 ) ( not ( = ?auto_2130208 ?auto_2130209 ) ) ( not ( = ?auto_2130208 ?auto_2130210 ) ) ( not ( = ?auto_2130208 ?auto_2130207 ) ) ( not ( = ?auto_2130208 ?auto_2130211 ) ) ( not ( = ?auto_2130208 ?auto_2130212 ) ) ( not ( = ?auto_2130208 ?auto_2130218 ) ) ( not ( = ?auto_2130209 ?auto_2130210 ) ) ( not ( = ?auto_2130209 ?auto_2130207 ) ) ( not ( = ?auto_2130209 ?auto_2130211 ) ) ( not ( = ?auto_2130209 ?auto_2130212 ) ) ( not ( = ?auto_2130209 ?auto_2130218 ) ) ( not ( = ?auto_2130210 ?auto_2130207 ) ) ( not ( = ?auto_2130210 ?auto_2130211 ) ) ( not ( = ?auto_2130210 ?auto_2130212 ) ) ( not ( = ?auto_2130210 ?auto_2130218 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2130207 ?auto_2130211 ?auto_2130212 )
      ( MAKE-5CRATE-VERIFY ?auto_2130208 ?auto_2130209 ?auto_2130210 ?auto_2130207 ?auto_2130211 ?auto_2130212 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2130259 - SURFACE
      ?auto_2130260 - SURFACE
      ?auto_2130261 - SURFACE
      ?auto_2130258 - SURFACE
      ?auto_2130262 - SURFACE
      ?auto_2130263 - SURFACE
    )
    :vars
    (
      ?auto_2130264 - HOIST
      ?auto_2130268 - PLACE
      ?auto_2130267 - PLACE
      ?auto_2130266 - HOIST
      ?auto_2130265 - SURFACE
      ?auto_2130269 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2130264 ?auto_2130268 ) ( IS-CRATE ?auto_2130263 ) ( not ( = ?auto_2130262 ?auto_2130263 ) ) ( not ( = ?auto_2130258 ?auto_2130262 ) ) ( not ( = ?auto_2130258 ?auto_2130263 ) ) ( not ( = ?auto_2130267 ?auto_2130268 ) ) ( HOIST-AT ?auto_2130266 ?auto_2130267 ) ( not ( = ?auto_2130264 ?auto_2130266 ) ) ( AVAILABLE ?auto_2130266 ) ( SURFACE-AT ?auto_2130263 ?auto_2130267 ) ( ON ?auto_2130263 ?auto_2130265 ) ( CLEAR ?auto_2130263 ) ( not ( = ?auto_2130262 ?auto_2130265 ) ) ( not ( = ?auto_2130263 ?auto_2130265 ) ) ( not ( = ?auto_2130258 ?auto_2130265 ) ) ( TRUCK-AT ?auto_2130269 ?auto_2130268 ) ( SURFACE-AT ?auto_2130258 ?auto_2130268 ) ( CLEAR ?auto_2130258 ) ( IS-CRATE ?auto_2130262 ) ( AVAILABLE ?auto_2130264 ) ( IN ?auto_2130262 ?auto_2130269 ) ( ON ?auto_2130260 ?auto_2130259 ) ( ON ?auto_2130261 ?auto_2130260 ) ( ON ?auto_2130258 ?auto_2130261 ) ( not ( = ?auto_2130259 ?auto_2130260 ) ) ( not ( = ?auto_2130259 ?auto_2130261 ) ) ( not ( = ?auto_2130259 ?auto_2130258 ) ) ( not ( = ?auto_2130259 ?auto_2130262 ) ) ( not ( = ?auto_2130259 ?auto_2130263 ) ) ( not ( = ?auto_2130259 ?auto_2130265 ) ) ( not ( = ?auto_2130260 ?auto_2130261 ) ) ( not ( = ?auto_2130260 ?auto_2130258 ) ) ( not ( = ?auto_2130260 ?auto_2130262 ) ) ( not ( = ?auto_2130260 ?auto_2130263 ) ) ( not ( = ?auto_2130260 ?auto_2130265 ) ) ( not ( = ?auto_2130261 ?auto_2130258 ) ) ( not ( = ?auto_2130261 ?auto_2130262 ) ) ( not ( = ?auto_2130261 ?auto_2130263 ) ) ( not ( = ?auto_2130261 ?auto_2130265 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2130258 ?auto_2130262 ?auto_2130263 )
      ( MAKE-5CRATE-VERIFY ?auto_2130259 ?auto_2130260 ?auto_2130261 ?auto_2130258 ?auto_2130262 ?auto_2130263 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2131468 - SURFACE
      ?auto_2131469 - SURFACE
      ?auto_2131470 - SURFACE
      ?auto_2131467 - SURFACE
      ?auto_2131471 - SURFACE
      ?auto_2131473 - SURFACE
      ?auto_2131472 - SURFACE
    )
    :vars
    (
      ?auto_2131474 - HOIST
      ?auto_2131475 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2131474 ?auto_2131475 ) ( SURFACE-AT ?auto_2131473 ?auto_2131475 ) ( CLEAR ?auto_2131473 ) ( LIFTING ?auto_2131474 ?auto_2131472 ) ( IS-CRATE ?auto_2131472 ) ( not ( = ?auto_2131473 ?auto_2131472 ) ) ( ON ?auto_2131469 ?auto_2131468 ) ( ON ?auto_2131470 ?auto_2131469 ) ( ON ?auto_2131467 ?auto_2131470 ) ( ON ?auto_2131471 ?auto_2131467 ) ( ON ?auto_2131473 ?auto_2131471 ) ( not ( = ?auto_2131468 ?auto_2131469 ) ) ( not ( = ?auto_2131468 ?auto_2131470 ) ) ( not ( = ?auto_2131468 ?auto_2131467 ) ) ( not ( = ?auto_2131468 ?auto_2131471 ) ) ( not ( = ?auto_2131468 ?auto_2131473 ) ) ( not ( = ?auto_2131468 ?auto_2131472 ) ) ( not ( = ?auto_2131469 ?auto_2131470 ) ) ( not ( = ?auto_2131469 ?auto_2131467 ) ) ( not ( = ?auto_2131469 ?auto_2131471 ) ) ( not ( = ?auto_2131469 ?auto_2131473 ) ) ( not ( = ?auto_2131469 ?auto_2131472 ) ) ( not ( = ?auto_2131470 ?auto_2131467 ) ) ( not ( = ?auto_2131470 ?auto_2131471 ) ) ( not ( = ?auto_2131470 ?auto_2131473 ) ) ( not ( = ?auto_2131470 ?auto_2131472 ) ) ( not ( = ?auto_2131467 ?auto_2131471 ) ) ( not ( = ?auto_2131467 ?auto_2131473 ) ) ( not ( = ?auto_2131467 ?auto_2131472 ) ) ( not ( = ?auto_2131471 ?auto_2131473 ) ) ( not ( = ?auto_2131471 ?auto_2131472 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2131473 ?auto_2131472 )
      ( MAKE-6CRATE-VERIFY ?auto_2131468 ?auto_2131469 ?auto_2131470 ?auto_2131467 ?auto_2131471 ?auto_2131473 ?auto_2131472 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2131512 - SURFACE
      ?auto_2131513 - SURFACE
      ?auto_2131514 - SURFACE
      ?auto_2131511 - SURFACE
      ?auto_2131515 - SURFACE
      ?auto_2131517 - SURFACE
      ?auto_2131516 - SURFACE
    )
    :vars
    (
      ?auto_2131520 - HOIST
      ?auto_2131519 - PLACE
      ?auto_2131518 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2131520 ?auto_2131519 ) ( SURFACE-AT ?auto_2131517 ?auto_2131519 ) ( CLEAR ?auto_2131517 ) ( IS-CRATE ?auto_2131516 ) ( not ( = ?auto_2131517 ?auto_2131516 ) ) ( TRUCK-AT ?auto_2131518 ?auto_2131519 ) ( AVAILABLE ?auto_2131520 ) ( IN ?auto_2131516 ?auto_2131518 ) ( ON ?auto_2131517 ?auto_2131515 ) ( not ( = ?auto_2131515 ?auto_2131517 ) ) ( not ( = ?auto_2131515 ?auto_2131516 ) ) ( ON ?auto_2131513 ?auto_2131512 ) ( ON ?auto_2131514 ?auto_2131513 ) ( ON ?auto_2131511 ?auto_2131514 ) ( ON ?auto_2131515 ?auto_2131511 ) ( not ( = ?auto_2131512 ?auto_2131513 ) ) ( not ( = ?auto_2131512 ?auto_2131514 ) ) ( not ( = ?auto_2131512 ?auto_2131511 ) ) ( not ( = ?auto_2131512 ?auto_2131515 ) ) ( not ( = ?auto_2131512 ?auto_2131517 ) ) ( not ( = ?auto_2131512 ?auto_2131516 ) ) ( not ( = ?auto_2131513 ?auto_2131514 ) ) ( not ( = ?auto_2131513 ?auto_2131511 ) ) ( not ( = ?auto_2131513 ?auto_2131515 ) ) ( not ( = ?auto_2131513 ?auto_2131517 ) ) ( not ( = ?auto_2131513 ?auto_2131516 ) ) ( not ( = ?auto_2131514 ?auto_2131511 ) ) ( not ( = ?auto_2131514 ?auto_2131515 ) ) ( not ( = ?auto_2131514 ?auto_2131517 ) ) ( not ( = ?auto_2131514 ?auto_2131516 ) ) ( not ( = ?auto_2131511 ?auto_2131515 ) ) ( not ( = ?auto_2131511 ?auto_2131517 ) ) ( not ( = ?auto_2131511 ?auto_2131516 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2131515 ?auto_2131517 ?auto_2131516 )
      ( MAKE-6CRATE-VERIFY ?auto_2131512 ?auto_2131513 ?auto_2131514 ?auto_2131511 ?auto_2131515 ?auto_2131517 ?auto_2131516 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2131563 - SURFACE
      ?auto_2131564 - SURFACE
      ?auto_2131565 - SURFACE
      ?auto_2131562 - SURFACE
      ?auto_2131566 - SURFACE
      ?auto_2131568 - SURFACE
      ?auto_2131567 - SURFACE
    )
    :vars
    (
      ?auto_2131571 - HOIST
      ?auto_2131570 - PLACE
      ?auto_2131569 - TRUCK
      ?auto_2131572 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2131571 ?auto_2131570 ) ( SURFACE-AT ?auto_2131568 ?auto_2131570 ) ( CLEAR ?auto_2131568 ) ( IS-CRATE ?auto_2131567 ) ( not ( = ?auto_2131568 ?auto_2131567 ) ) ( AVAILABLE ?auto_2131571 ) ( IN ?auto_2131567 ?auto_2131569 ) ( ON ?auto_2131568 ?auto_2131566 ) ( not ( = ?auto_2131566 ?auto_2131568 ) ) ( not ( = ?auto_2131566 ?auto_2131567 ) ) ( TRUCK-AT ?auto_2131569 ?auto_2131572 ) ( not ( = ?auto_2131572 ?auto_2131570 ) ) ( ON ?auto_2131564 ?auto_2131563 ) ( ON ?auto_2131565 ?auto_2131564 ) ( ON ?auto_2131562 ?auto_2131565 ) ( ON ?auto_2131566 ?auto_2131562 ) ( not ( = ?auto_2131563 ?auto_2131564 ) ) ( not ( = ?auto_2131563 ?auto_2131565 ) ) ( not ( = ?auto_2131563 ?auto_2131562 ) ) ( not ( = ?auto_2131563 ?auto_2131566 ) ) ( not ( = ?auto_2131563 ?auto_2131568 ) ) ( not ( = ?auto_2131563 ?auto_2131567 ) ) ( not ( = ?auto_2131564 ?auto_2131565 ) ) ( not ( = ?auto_2131564 ?auto_2131562 ) ) ( not ( = ?auto_2131564 ?auto_2131566 ) ) ( not ( = ?auto_2131564 ?auto_2131568 ) ) ( not ( = ?auto_2131564 ?auto_2131567 ) ) ( not ( = ?auto_2131565 ?auto_2131562 ) ) ( not ( = ?auto_2131565 ?auto_2131566 ) ) ( not ( = ?auto_2131565 ?auto_2131568 ) ) ( not ( = ?auto_2131565 ?auto_2131567 ) ) ( not ( = ?auto_2131562 ?auto_2131566 ) ) ( not ( = ?auto_2131562 ?auto_2131568 ) ) ( not ( = ?auto_2131562 ?auto_2131567 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2131566 ?auto_2131568 ?auto_2131567 )
      ( MAKE-6CRATE-VERIFY ?auto_2131563 ?auto_2131564 ?auto_2131565 ?auto_2131562 ?auto_2131566 ?auto_2131568 ?auto_2131567 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2131620 - SURFACE
      ?auto_2131621 - SURFACE
      ?auto_2131622 - SURFACE
      ?auto_2131619 - SURFACE
      ?auto_2131623 - SURFACE
      ?auto_2131625 - SURFACE
      ?auto_2131624 - SURFACE
    )
    :vars
    (
      ?auto_2131628 - HOIST
      ?auto_2131630 - PLACE
      ?auto_2131626 - TRUCK
      ?auto_2131629 - PLACE
      ?auto_2131627 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2131628 ?auto_2131630 ) ( SURFACE-AT ?auto_2131625 ?auto_2131630 ) ( CLEAR ?auto_2131625 ) ( IS-CRATE ?auto_2131624 ) ( not ( = ?auto_2131625 ?auto_2131624 ) ) ( AVAILABLE ?auto_2131628 ) ( ON ?auto_2131625 ?auto_2131623 ) ( not ( = ?auto_2131623 ?auto_2131625 ) ) ( not ( = ?auto_2131623 ?auto_2131624 ) ) ( TRUCK-AT ?auto_2131626 ?auto_2131629 ) ( not ( = ?auto_2131629 ?auto_2131630 ) ) ( HOIST-AT ?auto_2131627 ?auto_2131629 ) ( LIFTING ?auto_2131627 ?auto_2131624 ) ( not ( = ?auto_2131628 ?auto_2131627 ) ) ( ON ?auto_2131621 ?auto_2131620 ) ( ON ?auto_2131622 ?auto_2131621 ) ( ON ?auto_2131619 ?auto_2131622 ) ( ON ?auto_2131623 ?auto_2131619 ) ( not ( = ?auto_2131620 ?auto_2131621 ) ) ( not ( = ?auto_2131620 ?auto_2131622 ) ) ( not ( = ?auto_2131620 ?auto_2131619 ) ) ( not ( = ?auto_2131620 ?auto_2131623 ) ) ( not ( = ?auto_2131620 ?auto_2131625 ) ) ( not ( = ?auto_2131620 ?auto_2131624 ) ) ( not ( = ?auto_2131621 ?auto_2131622 ) ) ( not ( = ?auto_2131621 ?auto_2131619 ) ) ( not ( = ?auto_2131621 ?auto_2131623 ) ) ( not ( = ?auto_2131621 ?auto_2131625 ) ) ( not ( = ?auto_2131621 ?auto_2131624 ) ) ( not ( = ?auto_2131622 ?auto_2131619 ) ) ( not ( = ?auto_2131622 ?auto_2131623 ) ) ( not ( = ?auto_2131622 ?auto_2131625 ) ) ( not ( = ?auto_2131622 ?auto_2131624 ) ) ( not ( = ?auto_2131619 ?auto_2131623 ) ) ( not ( = ?auto_2131619 ?auto_2131625 ) ) ( not ( = ?auto_2131619 ?auto_2131624 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2131623 ?auto_2131625 ?auto_2131624 )
      ( MAKE-6CRATE-VERIFY ?auto_2131620 ?auto_2131621 ?auto_2131622 ?auto_2131619 ?auto_2131623 ?auto_2131625 ?auto_2131624 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2131683 - SURFACE
      ?auto_2131684 - SURFACE
      ?auto_2131685 - SURFACE
      ?auto_2131682 - SURFACE
      ?auto_2131686 - SURFACE
      ?auto_2131688 - SURFACE
      ?auto_2131687 - SURFACE
    )
    :vars
    (
      ?auto_2131693 - HOIST
      ?auto_2131692 - PLACE
      ?auto_2131690 - TRUCK
      ?auto_2131691 - PLACE
      ?auto_2131689 - HOIST
      ?auto_2131694 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2131693 ?auto_2131692 ) ( SURFACE-AT ?auto_2131688 ?auto_2131692 ) ( CLEAR ?auto_2131688 ) ( IS-CRATE ?auto_2131687 ) ( not ( = ?auto_2131688 ?auto_2131687 ) ) ( AVAILABLE ?auto_2131693 ) ( ON ?auto_2131688 ?auto_2131686 ) ( not ( = ?auto_2131686 ?auto_2131688 ) ) ( not ( = ?auto_2131686 ?auto_2131687 ) ) ( TRUCK-AT ?auto_2131690 ?auto_2131691 ) ( not ( = ?auto_2131691 ?auto_2131692 ) ) ( HOIST-AT ?auto_2131689 ?auto_2131691 ) ( not ( = ?auto_2131693 ?auto_2131689 ) ) ( AVAILABLE ?auto_2131689 ) ( SURFACE-AT ?auto_2131687 ?auto_2131691 ) ( ON ?auto_2131687 ?auto_2131694 ) ( CLEAR ?auto_2131687 ) ( not ( = ?auto_2131688 ?auto_2131694 ) ) ( not ( = ?auto_2131687 ?auto_2131694 ) ) ( not ( = ?auto_2131686 ?auto_2131694 ) ) ( ON ?auto_2131684 ?auto_2131683 ) ( ON ?auto_2131685 ?auto_2131684 ) ( ON ?auto_2131682 ?auto_2131685 ) ( ON ?auto_2131686 ?auto_2131682 ) ( not ( = ?auto_2131683 ?auto_2131684 ) ) ( not ( = ?auto_2131683 ?auto_2131685 ) ) ( not ( = ?auto_2131683 ?auto_2131682 ) ) ( not ( = ?auto_2131683 ?auto_2131686 ) ) ( not ( = ?auto_2131683 ?auto_2131688 ) ) ( not ( = ?auto_2131683 ?auto_2131687 ) ) ( not ( = ?auto_2131683 ?auto_2131694 ) ) ( not ( = ?auto_2131684 ?auto_2131685 ) ) ( not ( = ?auto_2131684 ?auto_2131682 ) ) ( not ( = ?auto_2131684 ?auto_2131686 ) ) ( not ( = ?auto_2131684 ?auto_2131688 ) ) ( not ( = ?auto_2131684 ?auto_2131687 ) ) ( not ( = ?auto_2131684 ?auto_2131694 ) ) ( not ( = ?auto_2131685 ?auto_2131682 ) ) ( not ( = ?auto_2131685 ?auto_2131686 ) ) ( not ( = ?auto_2131685 ?auto_2131688 ) ) ( not ( = ?auto_2131685 ?auto_2131687 ) ) ( not ( = ?auto_2131685 ?auto_2131694 ) ) ( not ( = ?auto_2131682 ?auto_2131686 ) ) ( not ( = ?auto_2131682 ?auto_2131688 ) ) ( not ( = ?auto_2131682 ?auto_2131687 ) ) ( not ( = ?auto_2131682 ?auto_2131694 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2131686 ?auto_2131688 ?auto_2131687 )
      ( MAKE-6CRATE-VERIFY ?auto_2131683 ?auto_2131684 ?auto_2131685 ?auto_2131682 ?auto_2131686 ?auto_2131688 ?auto_2131687 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2131747 - SURFACE
      ?auto_2131748 - SURFACE
      ?auto_2131749 - SURFACE
      ?auto_2131746 - SURFACE
      ?auto_2131750 - SURFACE
      ?auto_2131752 - SURFACE
      ?auto_2131751 - SURFACE
    )
    :vars
    (
      ?auto_2131756 - HOIST
      ?auto_2131758 - PLACE
      ?auto_2131757 - PLACE
      ?auto_2131753 - HOIST
      ?auto_2131755 - SURFACE
      ?auto_2131754 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2131756 ?auto_2131758 ) ( SURFACE-AT ?auto_2131752 ?auto_2131758 ) ( CLEAR ?auto_2131752 ) ( IS-CRATE ?auto_2131751 ) ( not ( = ?auto_2131752 ?auto_2131751 ) ) ( AVAILABLE ?auto_2131756 ) ( ON ?auto_2131752 ?auto_2131750 ) ( not ( = ?auto_2131750 ?auto_2131752 ) ) ( not ( = ?auto_2131750 ?auto_2131751 ) ) ( not ( = ?auto_2131757 ?auto_2131758 ) ) ( HOIST-AT ?auto_2131753 ?auto_2131757 ) ( not ( = ?auto_2131756 ?auto_2131753 ) ) ( AVAILABLE ?auto_2131753 ) ( SURFACE-AT ?auto_2131751 ?auto_2131757 ) ( ON ?auto_2131751 ?auto_2131755 ) ( CLEAR ?auto_2131751 ) ( not ( = ?auto_2131752 ?auto_2131755 ) ) ( not ( = ?auto_2131751 ?auto_2131755 ) ) ( not ( = ?auto_2131750 ?auto_2131755 ) ) ( TRUCK-AT ?auto_2131754 ?auto_2131758 ) ( ON ?auto_2131748 ?auto_2131747 ) ( ON ?auto_2131749 ?auto_2131748 ) ( ON ?auto_2131746 ?auto_2131749 ) ( ON ?auto_2131750 ?auto_2131746 ) ( not ( = ?auto_2131747 ?auto_2131748 ) ) ( not ( = ?auto_2131747 ?auto_2131749 ) ) ( not ( = ?auto_2131747 ?auto_2131746 ) ) ( not ( = ?auto_2131747 ?auto_2131750 ) ) ( not ( = ?auto_2131747 ?auto_2131752 ) ) ( not ( = ?auto_2131747 ?auto_2131751 ) ) ( not ( = ?auto_2131747 ?auto_2131755 ) ) ( not ( = ?auto_2131748 ?auto_2131749 ) ) ( not ( = ?auto_2131748 ?auto_2131746 ) ) ( not ( = ?auto_2131748 ?auto_2131750 ) ) ( not ( = ?auto_2131748 ?auto_2131752 ) ) ( not ( = ?auto_2131748 ?auto_2131751 ) ) ( not ( = ?auto_2131748 ?auto_2131755 ) ) ( not ( = ?auto_2131749 ?auto_2131746 ) ) ( not ( = ?auto_2131749 ?auto_2131750 ) ) ( not ( = ?auto_2131749 ?auto_2131752 ) ) ( not ( = ?auto_2131749 ?auto_2131751 ) ) ( not ( = ?auto_2131749 ?auto_2131755 ) ) ( not ( = ?auto_2131746 ?auto_2131750 ) ) ( not ( = ?auto_2131746 ?auto_2131752 ) ) ( not ( = ?auto_2131746 ?auto_2131751 ) ) ( not ( = ?auto_2131746 ?auto_2131755 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2131750 ?auto_2131752 ?auto_2131751 )
      ( MAKE-6CRATE-VERIFY ?auto_2131747 ?auto_2131748 ?auto_2131749 ?auto_2131746 ?auto_2131750 ?auto_2131752 ?auto_2131751 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2131811 - SURFACE
      ?auto_2131812 - SURFACE
      ?auto_2131813 - SURFACE
      ?auto_2131810 - SURFACE
      ?auto_2131814 - SURFACE
      ?auto_2131816 - SURFACE
      ?auto_2131815 - SURFACE
    )
    :vars
    (
      ?auto_2131821 - HOIST
      ?auto_2131817 - PLACE
      ?auto_2131818 - PLACE
      ?auto_2131820 - HOIST
      ?auto_2131819 - SURFACE
      ?auto_2131822 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2131821 ?auto_2131817 ) ( IS-CRATE ?auto_2131815 ) ( not ( = ?auto_2131816 ?auto_2131815 ) ) ( not ( = ?auto_2131814 ?auto_2131816 ) ) ( not ( = ?auto_2131814 ?auto_2131815 ) ) ( not ( = ?auto_2131818 ?auto_2131817 ) ) ( HOIST-AT ?auto_2131820 ?auto_2131818 ) ( not ( = ?auto_2131821 ?auto_2131820 ) ) ( AVAILABLE ?auto_2131820 ) ( SURFACE-AT ?auto_2131815 ?auto_2131818 ) ( ON ?auto_2131815 ?auto_2131819 ) ( CLEAR ?auto_2131815 ) ( not ( = ?auto_2131816 ?auto_2131819 ) ) ( not ( = ?auto_2131815 ?auto_2131819 ) ) ( not ( = ?auto_2131814 ?auto_2131819 ) ) ( TRUCK-AT ?auto_2131822 ?auto_2131817 ) ( SURFACE-AT ?auto_2131814 ?auto_2131817 ) ( CLEAR ?auto_2131814 ) ( LIFTING ?auto_2131821 ?auto_2131816 ) ( IS-CRATE ?auto_2131816 ) ( ON ?auto_2131812 ?auto_2131811 ) ( ON ?auto_2131813 ?auto_2131812 ) ( ON ?auto_2131810 ?auto_2131813 ) ( ON ?auto_2131814 ?auto_2131810 ) ( not ( = ?auto_2131811 ?auto_2131812 ) ) ( not ( = ?auto_2131811 ?auto_2131813 ) ) ( not ( = ?auto_2131811 ?auto_2131810 ) ) ( not ( = ?auto_2131811 ?auto_2131814 ) ) ( not ( = ?auto_2131811 ?auto_2131816 ) ) ( not ( = ?auto_2131811 ?auto_2131815 ) ) ( not ( = ?auto_2131811 ?auto_2131819 ) ) ( not ( = ?auto_2131812 ?auto_2131813 ) ) ( not ( = ?auto_2131812 ?auto_2131810 ) ) ( not ( = ?auto_2131812 ?auto_2131814 ) ) ( not ( = ?auto_2131812 ?auto_2131816 ) ) ( not ( = ?auto_2131812 ?auto_2131815 ) ) ( not ( = ?auto_2131812 ?auto_2131819 ) ) ( not ( = ?auto_2131813 ?auto_2131810 ) ) ( not ( = ?auto_2131813 ?auto_2131814 ) ) ( not ( = ?auto_2131813 ?auto_2131816 ) ) ( not ( = ?auto_2131813 ?auto_2131815 ) ) ( not ( = ?auto_2131813 ?auto_2131819 ) ) ( not ( = ?auto_2131810 ?auto_2131814 ) ) ( not ( = ?auto_2131810 ?auto_2131816 ) ) ( not ( = ?auto_2131810 ?auto_2131815 ) ) ( not ( = ?auto_2131810 ?auto_2131819 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2131814 ?auto_2131816 ?auto_2131815 )
      ( MAKE-6CRATE-VERIFY ?auto_2131811 ?auto_2131812 ?auto_2131813 ?auto_2131810 ?auto_2131814 ?auto_2131816 ?auto_2131815 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2131875 - SURFACE
      ?auto_2131876 - SURFACE
      ?auto_2131877 - SURFACE
      ?auto_2131874 - SURFACE
      ?auto_2131878 - SURFACE
      ?auto_2131880 - SURFACE
      ?auto_2131879 - SURFACE
    )
    :vars
    (
      ?auto_2131886 - HOIST
      ?auto_2131883 - PLACE
      ?auto_2131884 - PLACE
      ?auto_2131881 - HOIST
      ?auto_2131885 - SURFACE
      ?auto_2131882 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2131886 ?auto_2131883 ) ( IS-CRATE ?auto_2131879 ) ( not ( = ?auto_2131880 ?auto_2131879 ) ) ( not ( = ?auto_2131878 ?auto_2131880 ) ) ( not ( = ?auto_2131878 ?auto_2131879 ) ) ( not ( = ?auto_2131884 ?auto_2131883 ) ) ( HOIST-AT ?auto_2131881 ?auto_2131884 ) ( not ( = ?auto_2131886 ?auto_2131881 ) ) ( AVAILABLE ?auto_2131881 ) ( SURFACE-AT ?auto_2131879 ?auto_2131884 ) ( ON ?auto_2131879 ?auto_2131885 ) ( CLEAR ?auto_2131879 ) ( not ( = ?auto_2131880 ?auto_2131885 ) ) ( not ( = ?auto_2131879 ?auto_2131885 ) ) ( not ( = ?auto_2131878 ?auto_2131885 ) ) ( TRUCK-AT ?auto_2131882 ?auto_2131883 ) ( SURFACE-AT ?auto_2131878 ?auto_2131883 ) ( CLEAR ?auto_2131878 ) ( IS-CRATE ?auto_2131880 ) ( AVAILABLE ?auto_2131886 ) ( IN ?auto_2131880 ?auto_2131882 ) ( ON ?auto_2131876 ?auto_2131875 ) ( ON ?auto_2131877 ?auto_2131876 ) ( ON ?auto_2131874 ?auto_2131877 ) ( ON ?auto_2131878 ?auto_2131874 ) ( not ( = ?auto_2131875 ?auto_2131876 ) ) ( not ( = ?auto_2131875 ?auto_2131877 ) ) ( not ( = ?auto_2131875 ?auto_2131874 ) ) ( not ( = ?auto_2131875 ?auto_2131878 ) ) ( not ( = ?auto_2131875 ?auto_2131880 ) ) ( not ( = ?auto_2131875 ?auto_2131879 ) ) ( not ( = ?auto_2131875 ?auto_2131885 ) ) ( not ( = ?auto_2131876 ?auto_2131877 ) ) ( not ( = ?auto_2131876 ?auto_2131874 ) ) ( not ( = ?auto_2131876 ?auto_2131878 ) ) ( not ( = ?auto_2131876 ?auto_2131880 ) ) ( not ( = ?auto_2131876 ?auto_2131879 ) ) ( not ( = ?auto_2131876 ?auto_2131885 ) ) ( not ( = ?auto_2131877 ?auto_2131874 ) ) ( not ( = ?auto_2131877 ?auto_2131878 ) ) ( not ( = ?auto_2131877 ?auto_2131880 ) ) ( not ( = ?auto_2131877 ?auto_2131879 ) ) ( not ( = ?auto_2131877 ?auto_2131885 ) ) ( not ( = ?auto_2131874 ?auto_2131878 ) ) ( not ( = ?auto_2131874 ?auto_2131880 ) ) ( not ( = ?auto_2131874 ?auto_2131879 ) ) ( not ( = ?auto_2131874 ?auto_2131885 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2131878 ?auto_2131880 ?auto_2131879 )
      ( MAKE-6CRATE-VERIFY ?auto_2131875 ?auto_2131876 ?auto_2131877 ?auto_2131874 ?auto_2131878 ?auto_2131880 ?auto_2131879 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2133831 - SURFACE
      ?auto_2133832 - SURFACE
      ?auto_2133833 - SURFACE
      ?auto_2133830 - SURFACE
      ?auto_2133834 - SURFACE
      ?auto_2133836 - SURFACE
      ?auto_2133835 - SURFACE
      ?auto_2133837 - SURFACE
    )
    :vars
    (
      ?auto_2133839 - HOIST
      ?auto_2133838 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2133839 ?auto_2133838 ) ( SURFACE-AT ?auto_2133835 ?auto_2133838 ) ( CLEAR ?auto_2133835 ) ( LIFTING ?auto_2133839 ?auto_2133837 ) ( IS-CRATE ?auto_2133837 ) ( not ( = ?auto_2133835 ?auto_2133837 ) ) ( ON ?auto_2133832 ?auto_2133831 ) ( ON ?auto_2133833 ?auto_2133832 ) ( ON ?auto_2133830 ?auto_2133833 ) ( ON ?auto_2133834 ?auto_2133830 ) ( ON ?auto_2133836 ?auto_2133834 ) ( ON ?auto_2133835 ?auto_2133836 ) ( not ( = ?auto_2133831 ?auto_2133832 ) ) ( not ( = ?auto_2133831 ?auto_2133833 ) ) ( not ( = ?auto_2133831 ?auto_2133830 ) ) ( not ( = ?auto_2133831 ?auto_2133834 ) ) ( not ( = ?auto_2133831 ?auto_2133836 ) ) ( not ( = ?auto_2133831 ?auto_2133835 ) ) ( not ( = ?auto_2133831 ?auto_2133837 ) ) ( not ( = ?auto_2133832 ?auto_2133833 ) ) ( not ( = ?auto_2133832 ?auto_2133830 ) ) ( not ( = ?auto_2133832 ?auto_2133834 ) ) ( not ( = ?auto_2133832 ?auto_2133836 ) ) ( not ( = ?auto_2133832 ?auto_2133835 ) ) ( not ( = ?auto_2133832 ?auto_2133837 ) ) ( not ( = ?auto_2133833 ?auto_2133830 ) ) ( not ( = ?auto_2133833 ?auto_2133834 ) ) ( not ( = ?auto_2133833 ?auto_2133836 ) ) ( not ( = ?auto_2133833 ?auto_2133835 ) ) ( not ( = ?auto_2133833 ?auto_2133837 ) ) ( not ( = ?auto_2133830 ?auto_2133834 ) ) ( not ( = ?auto_2133830 ?auto_2133836 ) ) ( not ( = ?auto_2133830 ?auto_2133835 ) ) ( not ( = ?auto_2133830 ?auto_2133837 ) ) ( not ( = ?auto_2133834 ?auto_2133836 ) ) ( not ( = ?auto_2133834 ?auto_2133835 ) ) ( not ( = ?auto_2133834 ?auto_2133837 ) ) ( not ( = ?auto_2133836 ?auto_2133835 ) ) ( not ( = ?auto_2133836 ?auto_2133837 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2133835 ?auto_2133837 )
      ( MAKE-7CRATE-VERIFY ?auto_2133831 ?auto_2133832 ?auto_2133833 ?auto_2133830 ?auto_2133834 ?auto_2133836 ?auto_2133835 ?auto_2133837 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2133886 - SURFACE
      ?auto_2133887 - SURFACE
      ?auto_2133888 - SURFACE
      ?auto_2133885 - SURFACE
      ?auto_2133889 - SURFACE
      ?auto_2133891 - SURFACE
      ?auto_2133890 - SURFACE
      ?auto_2133892 - SURFACE
    )
    :vars
    (
      ?auto_2133895 - HOIST
      ?auto_2133893 - PLACE
      ?auto_2133894 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2133895 ?auto_2133893 ) ( SURFACE-AT ?auto_2133890 ?auto_2133893 ) ( CLEAR ?auto_2133890 ) ( IS-CRATE ?auto_2133892 ) ( not ( = ?auto_2133890 ?auto_2133892 ) ) ( TRUCK-AT ?auto_2133894 ?auto_2133893 ) ( AVAILABLE ?auto_2133895 ) ( IN ?auto_2133892 ?auto_2133894 ) ( ON ?auto_2133890 ?auto_2133891 ) ( not ( = ?auto_2133891 ?auto_2133890 ) ) ( not ( = ?auto_2133891 ?auto_2133892 ) ) ( ON ?auto_2133887 ?auto_2133886 ) ( ON ?auto_2133888 ?auto_2133887 ) ( ON ?auto_2133885 ?auto_2133888 ) ( ON ?auto_2133889 ?auto_2133885 ) ( ON ?auto_2133891 ?auto_2133889 ) ( not ( = ?auto_2133886 ?auto_2133887 ) ) ( not ( = ?auto_2133886 ?auto_2133888 ) ) ( not ( = ?auto_2133886 ?auto_2133885 ) ) ( not ( = ?auto_2133886 ?auto_2133889 ) ) ( not ( = ?auto_2133886 ?auto_2133891 ) ) ( not ( = ?auto_2133886 ?auto_2133890 ) ) ( not ( = ?auto_2133886 ?auto_2133892 ) ) ( not ( = ?auto_2133887 ?auto_2133888 ) ) ( not ( = ?auto_2133887 ?auto_2133885 ) ) ( not ( = ?auto_2133887 ?auto_2133889 ) ) ( not ( = ?auto_2133887 ?auto_2133891 ) ) ( not ( = ?auto_2133887 ?auto_2133890 ) ) ( not ( = ?auto_2133887 ?auto_2133892 ) ) ( not ( = ?auto_2133888 ?auto_2133885 ) ) ( not ( = ?auto_2133888 ?auto_2133889 ) ) ( not ( = ?auto_2133888 ?auto_2133891 ) ) ( not ( = ?auto_2133888 ?auto_2133890 ) ) ( not ( = ?auto_2133888 ?auto_2133892 ) ) ( not ( = ?auto_2133885 ?auto_2133889 ) ) ( not ( = ?auto_2133885 ?auto_2133891 ) ) ( not ( = ?auto_2133885 ?auto_2133890 ) ) ( not ( = ?auto_2133885 ?auto_2133892 ) ) ( not ( = ?auto_2133889 ?auto_2133891 ) ) ( not ( = ?auto_2133889 ?auto_2133890 ) ) ( not ( = ?auto_2133889 ?auto_2133892 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2133891 ?auto_2133890 ?auto_2133892 )
      ( MAKE-7CRATE-VERIFY ?auto_2133886 ?auto_2133887 ?auto_2133888 ?auto_2133885 ?auto_2133889 ?auto_2133891 ?auto_2133890 ?auto_2133892 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2133949 - SURFACE
      ?auto_2133950 - SURFACE
      ?auto_2133951 - SURFACE
      ?auto_2133948 - SURFACE
      ?auto_2133952 - SURFACE
      ?auto_2133954 - SURFACE
      ?auto_2133953 - SURFACE
      ?auto_2133955 - SURFACE
    )
    :vars
    (
      ?auto_2133957 - HOIST
      ?auto_2133956 - PLACE
      ?auto_2133959 - TRUCK
      ?auto_2133958 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2133957 ?auto_2133956 ) ( SURFACE-AT ?auto_2133953 ?auto_2133956 ) ( CLEAR ?auto_2133953 ) ( IS-CRATE ?auto_2133955 ) ( not ( = ?auto_2133953 ?auto_2133955 ) ) ( AVAILABLE ?auto_2133957 ) ( IN ?auto_2133955 ?auto_2133959 ) ( ON ?auto_2133953 ?auto_2133954 ) ( not ( = ?auto_2133954 ?auto_2133953 ) ) ( not ( = ?auto_2133954 ?auto_2133955 ) ) ( TRUCK-AT ?auto_2133959 ?auto_2133958 ) ( not ( = ?auto_2133958 ?auto_2133956 ) ) ( ON ?auto_2133950 ?auto_2133949 ) ( ON ?auto_2133951 ?auto_2133950 ) ( ON ?auto_2133948 ?auto_2133951 ) ( ON ?auto_2133952 ?auto_2133948 ) ( ON ?auto_2133954 ?auto_2133952 ) ( not ( = ?auto_2133949 ?auto_2133950 ) ) ( not ( = ?auto_2133949 ?auto_2133951 ) ) ( not ( = ?auto_2133949 ?auto_2133948 ) ) ( not ( = ?auto_2133949 ?auto_2133952 ) ) ( not ( = ?auto_2133949 ?auto_2133954 ) ) ( not ( = ?auto_2133949 ?auto_2133953 ) ) ( not ( = ?auto_2133949 ?auto_2133955 ) ) ( not ( = ?auto_2133950 ?auto_2133951 ) ) ( not ( = ?auto_2133950 ?auto_2133948 ) ) ( not ( = ?auto_2133950 ?auto_2133952 ) ) ( not ( = ?auto_2133950 ?auto_2133954 ) ) ( not ( = ?auto_2133950 ?auto_2133953 ) ) ( not ( = ?auto_2133950 ?auto_2133955 ) ) ( not ( = ?auto_2133951 ?auto_2133948 ) ) ( not ( = ?auto_2133951 ?auto_2133952 ) ) ( not ( = ?auto_2133951 ?auto_2133954 ) ) ( not ( = ?auto_2133951 ?auto_2133953 ) ) ( not ( = ?auto_2133951 ?auto_2133955 ) ) ( not ( = ?auto_2133948 ?auto_2133952 ) ) ( not ( = ?auto_2133948 ?auto_2133954 ) ) ( not ( = ?auto_2133948 ?auto_2133953 ) ) ( not ( = ?auto_2133948 ?auto_2133955 ) ) ( not ( = ?auto_2133952 ?auto_2133954 ) ) ( not ( = ?auto_2133952 ?auto_2133953 ) ) ( not ( = ?auto_2133952 ?auto_2133955 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2133954 ?auto_2133953 ?auto_2133955 )
      ( MAKE-7CRATE-VERIFY ?auto_2133949 ?auto_2133950 ?auto_2133951 ?auto_2133948 ?auto_2133952 ?auto_2133954 ?auto_2133953 ?auto_2133955 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2134019 - SURFACE
      ?auto_2134020 - SURFACE
      ?auto_2134021 - SURFACE
      ?auto_2134018 - SURFACE
      ?auto_2134022 - SURFACE
      ?auto_2134024 - SURFACE
      ?auto_2134023 - SURFACE
      ?auto_2134025 - SURFACE
    )
    :vars
    (
      ?auto_2134029 - HOIST
      ?auto_2134027 - PLACE
      ?auto_2134030 - TRUCK
      ?auto_2134026 - PLACE
      ?auto_2134028 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2134029 ?auto_2134027 ) ( SURFACE-AT ?auto_2134023 ?auto_2134027 ) ( CLEAR ?auto_2134023 ) ( IS-CRATE ?auto_2134025 ) ( not ( = ?auto_2134023 ?auto_2134025 ) ) ( AVAILABLE ?auto_2134029 ) ( ON ?auto_2134023 ?auto_2134024 ) ( not ( = ?auto_2134024 ?auto_2134023 ) ) ( not ( = ?auto_2134024 ?auto_2134025 ) ) ( TRUCK-AT ?auto_2134030 ?auto_2134026 ) ( not ( = ?auto_2134026 ?auto_2134027 ) ) ( HOIST-AT ?auto_2134028 ?auto_2134026 ) ( LIFTING ?auto_2134028 ?auto_2134025 ) ( not ( = ?auto_2134029 ?auto_2134028 ) ) ( ON ?auto_2134020 ?auto_2134019 ) ( ON ?auto_2134021 ?auto_2134020 ) ( ON ?auto_2134018 ?auto_2134021 ) ( ON ?auto_2134022 ?auto_2134018 ) ( ON ?auto_2134024 ?auto_2134022 ) ( not ( = ?auto_2134019 ?auto_2134020 ) ) ( not ( = ?auto_2134019 ?auto_2134021 ) ) ( not ( = ?auto_2134019 ?auto_2134018 ) ) ( not ( = ?auto_2134019 ?auto_2134022 ) ) ( not ( = ?auto_2134019 ?auto_2134024 ) ) ( not ( = ?auto_2134019 ?auto_2134023 ) ) ( not ( = ?auto_2134019 ?auto_2134025 ) ) ( not ( = ?auto_2134020 ?auto_2134021 ) ) ( not ( = ?auto_2134020 ?auto_2134018 ) ) ( not ( = ?auto_2134020 ?auto_2134022 ) ) ( not ( = ?auto_2134020 ?auto_2134024 ) ) ( not ( = ?auto_2134020 ?auto_2134023 ) ) ( not ( = ?auto_2134020 ?auto_2134025 ) ) ( not ( = ?auto_2134021 ?auto_2134018 ) ) ( not ( = ?auto_2134021 ?auto_2134022 ) ) ( not ( = ?auto_2134021 ?auto_2134024 ) ) ( not ( = ?auto_2134021 ?auto_2134023 ) ) ( not ( = ?auto_2134021 ?auto_2134025 ) ) ( not ( = ?auto_2134018 ?auto_2134022 ) ) ( not ( = ?auto_2134018 ?auto_2134024 ) ) ( not ( = ?auto_2134018 ?auto_2134023 ) ) ( not ( = ?auto_2134018 ?auto_2134025 ) ) ( not ( = ?auto_2134022 ?auto_2134024 ) ) ( not ( = ?auto_2134022 ?auto_2134023 ) ) ( not ( = ?auto_2134022 ?auto_2134025 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2134024 ?auto_2134023 ?auto_2134025 )
      ( MAKE-7CRATE-VERIFY ?auto_2134019 ?auto_2134020 ?auto_2134021 ?auto_2134018 ?auto_2134022 ?auto_2134024 ?auto_2134023 ?auto_2134025 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2134096 - SURFACE
      ?auto_2134097 - SURFACE
      ?auto_2134098 - SURFACE
      ?auto_2134095 - SURFACE
      ?auto_2134099 - SURFACE
      ?auto_2134101 - SURFACE
      ?auto_2134100 - SURFACE
      ?auto_2134102 - SURFACE
    )
    :vars
    (
      ?auto_2134107 - HOIST
      ?auto_2134103 - PLACE
      ?auto_2134108 - TRUCK
      ?auto_2134105 - PLACE
      ?auto_2134104 - HOIST
      ?auto_2134106 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2134107 ?auto_2134103 ) ( SURFACE-AT ?auto_2134100 ?auto_2134103 ) ( CLEAR ?auto_2134100 ) ( IS-CRATE ?auto_2134102 ) ( not ( = ?auto_2134100 ?auto_2134102 ) ) ( AVAILABLE ?auto_2134107 ) ( ON ?auto_2134100 ?auto_2134101 ) ( not ( = ?auto_2134101 ?auto_2134100 ) ) ( not ( = ?auto_2134101 ?auto_2134102 ) ) ( TRUCK-AT ?auto_2134108 ?auto_2134105 ) ( not ( = ?auto_2134105 ?auto_2134103 ) ) ( HOIST-AT ?auto_2134104 ?auto_2134105 ) ( not ( = ?auto_2134107 ?auto_2134104 ) ) ( AVAILABLE ?auto_2134104 ) ( SURFACE-AT ?auto_2134102 ?auto_2134105 ) ( ON ?auto_2134102 ?auto_2134106 ) ( CLEAR ?auto_2134102 ) ( not ( = ?auto_2134100 ?auto_2134106 ) ) ( not ( = ?auto_2134102 ?auto_2134106 ) ) ( not ( = ?auto_2134101 ?auto_2134106 ) ) ( ON ?auto_2134097 ?auto_2134096 ) ( ON ?auto_2134098 ?auto_2134097 ) ( ON ?auto_2134095 ?auto_2134098 ) ( ON ?auto_2134099 ?auto_2134095 ) ( ON ?auto_2134101 ?auto_2134099 ) ( not ( = ?auto_2134096 ?auto_2134097 ) ) ( not ( = ?auto_2134096 ?auto_2134098 ) ) ( not ( = ?auto_2134096 ?auto_2134095 ) ) ( not ( = ?auto_2134096 ?auto_2134099 ) ) ( not ( = ?auto_2134096 ?auto_2134101 ) ) ( not ( = ?auto_2134096 ?auto_2134100 ) ) ( not ( = ?auto_2134096 ?auto_2134102 ) ) ( not ( = ?auto_2134096 ?auto_2134106 ) ) ( not ( = ?auto_2134097 ?auto_2134098 ) ) ( not ( = ?auto_2134097 ?auto_2134095 ) ) ( not ( = ?auto_2134097 ?auto_2134099 ) ) ( not ( = ?auto_2134097 ?auto_2134101 ) ) ( not ( = ?auto_2134097 ?auto_2134100 ) ) ( not ( = ?auto_2134097 ?auto_2134102 ) ) ( not ( = ?auto_2134097 ?auto_2134106 ) ) ( not ( = ?auto_2134098 ?auto_2134095 ) ) ( not ( = ?auto_2134098 ?auto_2134099 ) ) ( not ( = ?auto_2134098 ?auto_2134101 ) ) ( not ( = ?auto_2134098 ?auto_2134100 ) ) ( not ( = ?auto_2134098 ?auto_2134102 ) ) ( not ( = ?auto_2134098 ?auto_2134106 ) ) ( not ( = ?auto_2134095 ?auto_2134099 ) ) ( not ( = ?auto_2134095 ?auto_2134101 ) ) ( not ( = ?auto_2134095 ?auto_2134100 ) ) ( not ( = ?auto_2134095 ?auto_2134102 ) ) ( not ( = ?auto_2134095 ?auto_2134106 ) ) ( not ( = ?auto_2134099 ?auto_2134101 ) ) ( not ( = ?auto_2134099 ?auto_2134100 ) ) ( not ( = ?auto_2134099 ?auto_2134102 ) ) ( not ( = ?auto_2134099 ?auto_2134106 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2134101 ?auto_2134100 ?auto_2134102 )
      ( MAKE-7CRATE-VERIFY ?auto_2134096 ?auto_2134097 ?auto_2134098 ?auto_2134095 ?auto_2134099 ?auto_2134101 ?auto_2134100 ?auto_2134102 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2134174 - SURFACE
      ?auto_2134175 - SURFACE
      ?auto_2134176 - SURFACE
      ?auto_2134173 - SURFACE
      ?auto_2134177 - SURFACE
      ?auto_2134179 - SURFACE
      ?auto_2134178 - SURFACE
      ?auto_2134180 - SURFACE
    )
    :vars
    (
      ?auto_2134184 - HOIST
      ?auto_2134186 - PLACE
      ?auto_2134183 - PLACE
      ?auto_2134185 - HOIST
      ?auto_2134182 - SURFACE
      ?auto_2134181 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2134184 ?auto_2134186 ) ( SURFACE-AT ?auto_2134178 ?auto_2134186 ) ( CLEAR ?auto_2134178 ) ( IS-CRATE ?auto_2134180 ) ( not ( = ?auto_2134178 ?auto_2134180 ) ) ( AVAILABLE ?auto_2134184 ) ( ON ?auto_2134178 ?auto_2134179 ) ( not ( = ?auto_2134179 ?auto_2134178 ) ) ( not ( = ?auto_2134179 ?auto_2134180 ) ) ( not ( = ?auto_2134183 ?auto_2134186 ) ) ( HOIST-AT ?auto_2134185 ?auto_2134183 ) ( not ( = ?auto_2134184 ?auto_2134185 ) ) ( AVAILABLE ?auto_2134185 ) ( SURFACE-AT ?auto_2134180 ?auto_2134183 ) ( ON ?auto_2134180 ?auto_2134182 ) ( CLEAR ?auto_2134180 ) ( not ( = ?auto_2134178 ?auto_2134182 ) ) ( not ( = ?auto_2134180 ?auto_2134182 ) ) ( not ( = ?auto_2134179 ?auto_2134182 ) ) ( TRUCK-AT ?auto_2134181 ?auto_2134186 ) ( ON ?auto_2134175 ?auto_2134174 ) ( ON ?auto_2134176 ?auto_2134175 ) ( ON ?auto_2134173 ?auto_2134176 ) ( ON ?auto_2134177 ?auto_2134173 ) ( ON ?auto_2134179 ?auto_2134177 ) ( not ( = ?auto_2134174 ?auto_2134175 ) ) ( not ( = ?auto_2134174 ?auto_2134176 ) ) ( not ( = ?auto_2134174 ?auto_2134173 ) ) ( not ( = ?auto_2134174 ?auto_2134177 ) ) ( not ( = ?auto_2134174 ?auto_2134179 ) ) ( not ( = ?auto_2134174 ?auto_2134178 ) ) ( not ( = ?auto_2134174 ?auto_2134180 ) ) ( not ( = ?auto_2134174 ?auto_2134182 ) ) ( not ( = ?auto_2134175 ?auto_2134176 ) ) ( not ( = ?auto_2134175 ?auto_2134173 ) ) ( not ( = ?auto_2134175 ?auto_2134177 ) ) ( not ( = ?auto_2134175 ?auto_2134179 ) ) ( not ( = ?auto_2134175 ?auto_2134178 ) ) ( not ( = ?auto_2134175 ?auto_2134180 ) ) ( not ( = ?auto_2134175 ?auto_2134182 ) ) ( not ( = ?auto_2134176 ?auto_2134173 ) ) ( not ( = ?auto_2134176 ?auto_2134177 ) ) ( not ( = ?auto_2134176 ?auto_2134179 ) ) ( not ( = ?auto_2134176 ?auto_2134178 ) ) ( not ( = ?auto_2134176 ?auto_2134180 ) ) ( not ( = ?auto_2134176 ?auto_2134182 ) ) ( not ( = ?auto_2134173 ?auto_2134177 ) ) ( not ( = ?auto_2134173 ?auto_2134179 ) ) ( not ( = ?auto_2134173 ?auto_2134178 ) ) ( not ( = ?auto_2134173 ?auto_2134180 ) ) ( not ( = ?auto_2134173 ?auto_2134182 ) ) ( not ( = ?auto_2134177 ?auto_2134179 ) ) ( not ( = ?auto_2134177 ?auto_2134178 ) ) ( not ( = ?auto_2134177 ?auto_2134180 ) ) ( not ( = ?auto_2134177 ?auto_2134182 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2134179 ?auto_2134178 ?auto_2134180 )
      ( MAKE-7CRATE-VERIFY ?auto_2134174 ?auto_2134175 ?auto_2134176 ?auto_2134173 ?auto_2134177 ?auto_2134179 ?auto_2134178 ?auto_2134180 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2134252 - SURFACE
      ?auto_2134253 - SURFACE
      ?auto_2134254 - SURFACE
      ?auto_2134251 - SURFACE
      ?auto_2134255 - SURFACE
      ?auto_2134257 - SURFACE
      ?auto_2134256 - SURFACE
      ?auto_2134258 - SURFACE
    )
    :vars
    (
      ?auto_2134259 - HOIST
      ?auto_2134263 - PLACE
      ?auto_2134262 - PLACE
      ?auto_2134261 - HOIST
      ?auto_2134264 - SURFACE
      ?auto_2134260 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2134259 ?auto_2134263 ) ( IS-CRATE ?auto_2134258 ) ( not ( = ?auto_2134256 ?auto_2134258 ) ) ( not ( = ?auto_2134257 ?auto_2134256 ) ) ( not ( = ?auto_2134257 ?auto_2134258 ) ) ( not ( = ?auto_2134262 ?auto_2134263 ) ) ( HOIST-AT ?auto_2134261 ?auto_2134262 ) ( not ( = ?auto_2134259 ?auto_2134261 ) ) ( AVAILABLE ?auto_2134261 ) ( SURFACE-AT ?auto_2134258 ?auto_2134262 ) ( ON ?auto_2134258 ?auto_2134264 ) ( CLEAR ?auto_2134258 ) ( not ( = ?auto_2134256 ?auto_2134264 ) ) ( not ( = ?auto_2134258 ?auto_2134264 ) ) ( not ( = ?auto_2134257 ?auto_2134264 ) ) ( TRUCK-AT ?auto_2134260 ?auto_2134263 ) ( SURFACE-AT ?auto_2134257 ?auto_2134263 ) ( CLEAR ?auto_2134257 ) ( LIFTING ?auto_2134259 ?auto_2134256 ) ( IS-CRATE ?auto_2134256 ) ( ON ?auto_2134253 ?auto_2134252 ) ( ON ?auto_2134254 ?auto_2134253 ) ( ON ?auto_2134251 ?auto_2134254 ) ( ON ?auto_2134255 ?auto_2134251 ) ( ON ?auto_2134257 ?auto_2134255 ) ( not ( = ?auto_2134252 ?auto_2134253 ) ) ( not ( = ?auto_2134252 ?auto_2134254 ) ) ( not ( = ?auto_2134252 ?auto_2134251 ) ) ( not ( = ?auto_2134252 ?auto_2134255 ) ) ( not ( = ?auto_2134252 ?auto_2134257 ) ) ( not ( = ?auto_2134252 ?auto_2134256 ) ) ( not ( = ?auto_2134252 ?auto_2134258 ) ) ( not ( = ?auto_2134252 ?auto_2134264 ) ) ( not ( = ?auto_2134253 ?auto_2134254 ) ) ( not ( = ?auto_2134253 ?auto_2134251 ) ) ( not ( = ?auto_2134253 ?auto_2134255 ) ) ( not ( = ?auto_2134253 ?auto_2134257 ) ) ( not ( = ?auto_2134253 ?auto_2134256 ) ) ( not ( = ?auto_2134253 ?auto_2134258 ) ) ( not ( = ?auto_2134253 ?auto_2134264 ) ) ( not ( = ?auto_2134254 ?auto_2134251 ) ) ( not ( = ?auto_2134254 ?auto_2134255 ) ) ( not ( = ?auto_2134254 ?auto_2134257 ) ) ( not ( = ?auto_2134254 ?auto_2134256 ) ) ( not ( = ?auto_2134254 ?auto_2134258 ) ) ( not ( = ?auto_2134254 ?auto_2134264 ) ) ( not ( = ?auto_2134251 ?auto_2134255 ) ) ( not ( = ?auto_2134251 ?auto_2134257 ) ) ( not ( = ?auto_2134251 ?auto_2134256 ) ) ( not ( = ?auto_2134251 ?auto_2134258 ) ) ( not ( = ?auto_2134251 ?auto_2134264 ) ) ( not ( = ?auto_2134255 ?auto_2134257 ) ) ( not ( = ?auto_2134255 ?auto_2134256 ) ) ( not ( = ?auto_2134255 ?auto_2134258 ) ) ( not ( = ?auto_2134255 ?auto_2134264 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2134257 ?auto_2134256 ?auto_2134258 )
      ( MAKE-7CRATE-VERIFY ?auto_2134252 ?auto_2134253 ?auto_2134254 ?auto_2134251 ?auto_2134255 ?auto_2134257 ?auto_2134256 ?auto_2134258 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2134330 - SURFACE
      ?auto_2134331 - SURFACE
      ?auto_2134332 - SURFACE
      ?auto_2134329 - SURFACE
      ?auto_2134333 - SURFACE
      ?auto_2134335 - SURFACE
      ?auto_2134334 - SURFACE
      ?auto_2134336 - SURFACE
    )
    :vars
    (
      ?auto_2134341 - HOIST
      ?auto_2134340 - PLACE
      ?auto_2134338 - PLACE
      ?auto_2134342 - HOIST
      ?auto_2134337 - SURFACE
      ?auto_2134339 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2134341 ?auto_2134340 ) ( IS-CRATE ?auto_2134336 ) ( not ( = ?auto_2134334 ?auto_2134336 ) ) ( not ( = ?auto_2134335 ?auto_2134334 ) ) ( not ( = ?auto_2134335 ?auto_2134336 ) ) ( not ( = ?auto_2134338 ?auto_2134340 ) ) ( HOIST-AT ?auto_2134342 ?auto_2134338 ) ( not ( = ?auto_2134341 ?auto_2134342 ) ) ( AVAILABLE ?auto_2134342 ) ( SURFACE-AT ?auto_2134336 ?auto_2134338 ) ( ON ?auto_2134336 ?auto_2134337 ) ( CLEAR ?auto_2134336 ) ( not ( = ?auto_2134334 ?auto_2134337 ) ) ( not ( = ?auto_2134336 ?auto_2134337 ) ) ( not ( = ?auto_2134335 ?auto_2134337 ) ) ( TRUCK-AT ?auto_2134339 ?auto_2134340 ) ( SURFACE-AT ?auto_2134335 ?auto_2134340 ) ( CLEAR ?auto_2134335 ) ( IS-CRATE ?auto_2134334 ) ( AVAILABLE ?auto_2134341 ) ( IN ?auto_2134334 ?auto_2134339 ) ( ON ?auto_2134331 ?auto_2134330 ) ( ON ?auto_2134332 ?auto_2134331 ) ( ON ?auto_2134329 ?auto_2134332 ) ( ON ?auto_2134333 ?auto_2134329 ) ( ON ?auto_2134335 ?auto_2134333 ) ( not ( = ?auto_2134330 ?auto_2134331 ) ) ( not ( = ?auto_2134330 ?auto_2134332 ) ) ( not ( = ?auto_2134330 ?auto_2134329 ) ) ( not ( = ?auto_2134330 ?auto_2134333 ) ) ( not ( = ?auto_2134330 ?auto_2134335 ) ) ( not ( = ?auto_2134330 ?auto_2134334 ) ) ( not ( = ?auto_2134330 ?auto_2134336 ) ) ( not ( = ?auto_2134330 ?auto_2134337 ) ) ( not ( = ?auto_2134331 ?auto_2134332 ) ) ( not ( = ?auto_2134331 ?auto_2134329 ) ) ( not ( = ?auto_2134331 ?auto_2134333 ) ) ( not ( = ?auto_2134331 ?auto_2134335 ) ) ( not ( = ?auto_2134331 ?auto_2134334 ) ) ( not ( = ?auto_2134331 ?auto_2134336 ) ) ( not ( = ?auto_2134331 ?auto_2134337 ) ) ( not ( = ?auto_2134332 ?auto_2134329 ) ) ( not ( = ?auto_2134332 ?auto_2134333 ) ) ( not ( = ?auto_2134332 ?auto_2134335 ) ) ( not ( = ?auto_2134332 ?auto_2134334 ) ) ( not ( = ?auto_2134332 ?auto_2134336 ) ) ( not ( = ?auto_2134332 ?auto_2134337 ) ) ( not ( = ?auto_2134329 ?auto_2134333 ) ) ( not ( = ?auto_2134329 ?auto_2134335 ) ) ( not ( = ?auto_2134329 ?auto_2134334 ) ) ( not ( = ?auto_2134329 ?auto_2134336 ) ) ( not ( = ?auto_2134329 ?auto_2134337 ) ) ( not ( = ?auto_2134333 ?auto_2134335 ) ) ( not ( = ?auto_2134333 ?auto_2134334 ) ) ( not ( = ?auto_2134333 ?auto_2134336 ) ) ( not ( = ?auto_2134333 ?auto_2134337 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2134335 ?auto_2134334 ?auto_2134336 )
      ( MAKE-7CRATE-VERIFY ?auto_2134330 ?auto_2134331 ?auto_2134332 ?auto_2134329 ?auto_2134333 ?auto_2134335 ?auto_2134334 ?auto_2134336 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2137249 - SURFACE
      ?auto_2137250 - SURFACE
      ?auto_2137251 - SURFACE
      ?auto_2137248 - SURFACE
      ?auto_2137252 - SURFACE
      ?auto_2137254 - SURFACE
      ?auto_2137253 - SURFACE
      ?auto_2137255 - SURFACE
      ?auto_2137256 - SURFACE
    )
    :vars
    (
      ?auto_2137258 - HOIST
      ?auto_2137257 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2137258 ?auto_2137257 ) ( SURFACE-AT ?auto_2137255 ?auto_2137257 ) ( CLEAR ?auto_2137255 ) ( LIFTING ?auto_2137258 ?auto_2137256 ) ( IS-CRATE ?auto_2137256 ) ( not ( = ?auto_2137255 ?auto_2137256 ) ) ( ON ?auto_2137250 ?auto_2137249 ) ( ON ?auto_2137251 ?auto_2137250 ) ( ON ?auto_2137248 ?auto_2137251 ) ( ON ?auto_2137252 ?auto_2137248 ) ( ON ?auto_2137254 ?auto_2137252 ) ( ON ?auto_2137253 ?auto_2137254 ) ( ON ?auto_2137255 ?auto_2137253 ) ( not ( = ?auto_2137249 ?auto_2137250 ) ) ( not ( = ?auto_2137249 ?auto_2137251 ) ) ( not ( = ?auto_2137249 ?auto_2137248 ) ) ( not ( = ?auto_2137249 ?auto_2137252 ) ) ( not ( = ?auto_2137249 ?auto_2137254 ) ) ( not ( = ?auto_2137249 ?auto_2137253 ) ) ( not ( = ?auto_2137249 ?auto_2137255 ) ) ( not ( = ?auto_2137249 ?auto_2137256 ) ) ( not ( = ?auto_2137250 ?auto_2137251 ) ) ( not ( = ?auto_2137250 ?auto_2137248 ) ) ( not ( = ?auto_2137250 ?auto_2137252 ) ) ( not ( = ?auto_2137250 ?auto_2137254 ) ) ( not ( = ?auto_2137250 ?auto_2137253 ) ) ( not ( = ?auto_2137250 ?auto_2137255 ) ) ( not ( = ?auto_2137250 ?auto_2137256 ) ) ( not ( = ?auto_2137251 ?auto_2137248 ) ) ( not ( = ?auto_2137251 ?auto_2137252 ) ) ( not ( = ?auto_2137251 ?auto_2137254 ) ) ( not ( = ?auto_2137251 ?auto_2137253 ) ) ( not ( = ?auto_2137251 ?auto_2137255 ) ) ( not ( = ?auto_2137251 ?auto_2137256 ) ) ( not ( = ?auto_2137248 ?auto_2137252 ) ) ( not ( = ?auto_2137248 ?auto_2137254 ) ) ( not ( = ?auto_2137248 ?auto_2137253 ) ) ( not ( = ?auto_2137248 ?auto_2137255 ) ) ( not ( = ?auto_2137248 ?auto_2137256 ) ) ( not ( = ?auto_2137252 ?auto_2137254 ) ) ( not ( = ?auto_2137252 ?auto_2137253 ) ) ( not ( = ?auto_2137252 ?auto_2137255 ) ) ( not ( = ?auto_2137252 ?auto_2137256 ) ) ( not ( = ?auto_2137254 ?auto_2137253 ) ) ( not ( = ?auto_2137254 ?auto_2137255 ) ) ( not ( = ?auto_2137254 ?auto_2137256 ) ) ( not ( = ?auto_2137253 ?auto_2137255 ) ) ( not ( = ?auto_2137253 ?auto_2137256 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2137255 ?auto_2137256 )
      ( MAKE-8CRATE-VERIFY ?auto_2137249 ?auto_2137250 ?auto_2137251 ?auto_2137248 ?auto_2137252 ?auto_2137254 ?auto_2137253 ?auto_2137255 ?auto_2137256 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2137316 - SURFACE
      ?auto_2137317 - SURFACE
      ?auto_2137318 - SURFACE
      ?auto_2137315 - SURFACE
      ?auto_2137319 - SURFACE
      ?auto_2137321 - SURFACE
      ?auto_2137320 - SURFACE
      ?auto_2137322 - SURFACE
      ?auto_2137323 - SURFACE
    )
    :vars
    (
      ?auto_2137325 - HOIST
      ?auto_2137324 - PLACE
      ?auto_2137326 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2137325 ?auto_2137324 ) ( SURFACE-AT ?auto_2137322 ?auto_2137324 ) ( CLEAR ?auto_2137322 ) ( IS-CRATE ?auto_2137323 ) ( not ( = ?auto_2137322 ?auto_2137323 ) ) ( TRUCK-AT ?auto_2137326 ?auto_2137324 ) ( AVAILABLE ?auto_2137325 ) ( IN ?auto_2137323 ?auto_2137326 ) ( ON ?auto_2137322 ?auto_2137320 ) ( not ( = ?auto_2137320 ?auto_2137322 ) ) ( not ( = ?auto_2137320 ?auto_2137323 ) ) ( ON ?auto_2137317 ?auto_2137316 ) ( ON ?auto_2137318 ?auto_2137317 ) ( ON ?auto_2137315 ?auto_2137318 ) ( ON ?auto_2137319 ?auto_2137315 ) ( ON ?auto_2137321 ?auto_2137319 ) ( ON ?auto_2137320 ?auto_2137321 ) ( not ( = ?auto_2137316 ?auto_2137317 ) ) ( not ( = ?auto_2137316 ?auto_2137318 ) ) ( not ( = ?auto_2137316 ?auto_2137315 ) ) ( not ( = ?auto_2137316 ?auto_2137319 ) ) ( not ( = ?auto_2137316 ?auto_2137321 ) ) ( not ( = ?auto_2137316 ?auto_2137320 ) ) ( not ( = ?auto_2137316 ?auto_2137322 ) ) ( not ( = ?auto_2137316 ?auto_2137323 ) ) ( not ( = ?auto_2137317 ?auto_2137318 ) ) ( not ( = ?auto_2137317 ?auto_2137315 ) ) ( not ( = ?auto_2137317 ?auto_2137319 ) ) ( not ( = ?auto_2137317 ?auto_2137321 ) ) ( not ( = ?auto_2137317 ?auto_2137320 ) ) ( not ( = ?auto_2137317 ?auto_2137322 ) ) ( not ( = ?auto_2137317 ?auto_2137323 ) ) ( not ( = ?auto_2137318 ?auto_2137315 ) ) ( not ( = ?auto_2137318 ?auto_2137319 ) ) ( not ( = ?auto_2137318 ?auto_2137321 ) ) ( not ( = ?auto_2137318 ?auto_2137320 ) ) ( not ( = ?auto_2137318 ?auto_2137322 ) ) ( not ( = ?auto_2137318 ?auto_2137323 ) ) ( not ( = ?auto_2137315 ?auto_2137319 ) ) ( not ( = ?auto_2137315 ?auto_2137321 ) ) ( not ( = ?auto_2137315 ?auto_2137320 ) ) ( not ( = ?auto_2137315 ?auto_2137322 ) ) ( not ( = ?auto_2137315 ?auto_2137323 ) ) ( not ( = ?auto_2137319 ?auto_2137321 ) ) ( not ( = ?auto_2137319 ?auto_2137320 ) ) ( not ( = ?auto_2137319 ?auto_2137322 ) ) ( not ( = ?auto_2137319 ?auto_2137323 ) ) ( not ( = ?auto_2137321 ?auto_2137320 ) ) ( not ( = ?auto_2137321 ?auto_2137322 ) ) ( not ( = ?auto_2137321 ?auto_2137323 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2137320 ?auto_2137322 ?auto_2137323 )
      ( MAKE-8CRATE-VERIFY ?auto_2137316 ?auto_2137317 ?auto_2137318 ?auto_2137315 ?auto_2137319 ?auto_2137321 ?auto_2137320 ?auto_2137322 ?auto_2137323 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2137392 - SURFACE
      ?auto_2137393 - SURFACE
      ?auto_2137394 - SURFACE
      ?auto_2137391 - SURFACE
      ?auto_2137395 - SURFACE
      ?auto_2137397 - SURFACE
      ?auto_2137396 - SURFACE
      ?auto_2137398 - SURFACE
      ?auto_2137399 - SURFACE
    )
    :vars
    (
      ?auto_2137400 - HOIST
      ?auto_2137403 - PLACE
      ?auto_2137401 - TRUCK
      ?auto_2137402 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2137400 ?auto_2137403 ) ( SURFACE-AT ?auto_2137398 ?auto_2137403 ) ( CLEAR ?auto_2137398 ) ( IS-CRATE ?auto_2137399 ) ( not ( = ?auto_2137398 ?auto_2137399 ) ) ( AVAILABLE ?auto_2137400 ) ( IN ?auto_2137399 ?auto_2137401 ) ( ON ?auto_2137398 ?auto_2137396 ) ( not ( = ?auto_2137396 ?auto_2137398 ) ) ( not ( = ?auto_2137396 ?auto_2137399 ) ) ( TRUCK-AT ?auto_2137401 ?auto_2137402 ) ( not ( = ?auto_2137402 ?auto_2137403 ) ) ( ON ?auto_2137393 ?auto_2137392 ) ( ON ?auto_2137394 ?auto_2137393 ) ( ON ?auto_2137391 ?auto_2137394 ) ( ON ?auto_2137395 ?auto_2137391 ) ( ON ?auto_2137397 ?auto_2137395 ) ( ON ?auto_2137396 ?auto_2137397 ) ( not ( = ?auto_2137392 ?auto_2137393 ) ) ( not ( = ?auto_2137392 ?auto_2137394 ) ) ( not ( = ?auto_2137392 ?auto_2137391 ) ) ( not ( = ?auto_2137392 ?auto_2137395 ) ) ( not ( = ?auto_2137392 ?auto_2137397 ) ) ( not ( = ?auto_2137392 ?auto_2137396 ) ) ( not ( = ?auto_2137392 ?auto_2137398 ) ) ( not ( = ?auto_2137392 ?auto_2137399 ) ) ( not ( = ?auto_2137393 ?auto_2137394 ) ) ( not ( = ?auto_2137393 ?auto_2137391 ) ) ( not ( = ?auto_2137393 ?auto_2137395 ) ) ( not ( = ?auto_2137393 ?auto_2137397 ) ) ( not ( = ?auto_2137393 ?auto_2137396 ) ) ( not ( = ?auto_2137393 ?auto_2137398 ) ) ( not ( = ?auto_2137393 ?auto_2137399 ) ) ( not ( = ?auto_2137394 ?auto_2137391 ) ) ( not ( = ?auto_2137394 ?auto_2137395 ) ) ( not ( = ?auto_2137394 ?auto_2137397 ) ) ( not ( = ?auto_2137394 ?auto_2137396 ) ) ( not ( = ?auto_2137394 ?auto_2137398 ) ) ( not ( = ?auto_2137394 ?auto_2137399 ) ) ( not ( = ?auto_2137391 ?auto_2137395 ) ) ( not ( = ?auto_2137391 ?auto_2137397 ) ) ( not ( = ?auto_2137391 ?auto_2137396 ) ) ( not ( = ?auto_2137391 ?auto_2137398 ) ) ( not ( = ?auto_2137391 ?auto_2137399 ) ) ( not ( = ?auto_2137395 ?auto_2137397 ) ) ( not ( = ?auto_2137395 ?auto_2137396 ) ) ( not ( = ?auto_2137395 ?auto_2137398 ) ) ( not ( = ?auto_2137395 ?auto_2137399 ) ) ( not ( = ?auto_2137397 ?auto_2137396 ) ) ( not ( = ?auto_2137397 ?auto_2137398 ) ) ( not ( = ?auto_2137397 ?auto_2137399 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2137396 ?auto_2137398 ?auto_2137399 )
      ( MAKE-8CRATE-VERIFY ?auto_2137392 ?auto_2137393 ?auto_2137394 ?auto_2137391 ?auto_2137395 ?auto_2137397 ?auto_2137396 ?auto_2137398 ?auto_2137399 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2137476 - SURFACE
      ?auto_2137477 - SURFACE
      ?auto_2137478 - SURFACE
      ?auto_2137475 - SURFACE
      ?auto_2137479 - SURFACE
      ?auto_2137481 - SURFACE
      ?auto_2137480 - SURFACE
      ?auto_2137482 - SURFACE
      ?auto_2137483 - SURFACE
    )
    :vars
    (
      ?auto_2137487 - HOIST
      ?auto_2137485 - PLACE
      ?auto_2137484 - TRUCK
      ?auto_2137486 - PLACE
      ?auto_2137488 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2137487 ?auto_2137485 ) ( SURFACE-AT ?auto_2137482 ?auto_2137485 ) ( CLEAR ?auto_2137482 ) ( IS-CRATE ?auto_2137483 ) ( not ( = ?auto_2137482 ?auto_2137483 ) ) ( AVAILABLE ?auto_2137487 ) ( ON ?auto_2137482 ?auto_2137480 ) ( not ( = ?auto_2137480 ?auto_2137482 ) ) ( not ( = ?auto_2137480 ?auto_2137483 ) ) ( TRUCK-AT ?auto_2137484 ?auto_2137486 ) ( not ( = ?auto_2137486 ?auto_2137485 ) ) ( HOIST-AT ?auto_2137488 ?auto_2137486 ) ( LIFTING ?auto_2137488 ?auto_2137483 ) ( not ( = ?auto_2137487 ?auto_2137488 ) ) ( ON ?auto_2137477 ?auto_2137476 ) ( ON ?auto_2137478 ?auto_2137477 ) ( ON ?auto_2137475 ?auto_2137478 ) ( ON ?auto_2137479 ?auto_2137475 ) ( ON ?auto_2137481 ?auto_2137479 ) ( ON ?auto_2137480 ?auto_2137481 ) ( not ( = ?auto_2137476 ?auto_2137477 ) ) ( not ( = ?auto_2137476 ?auto_2137478 ) ) ( not ( = ?auto_2137476 ?auto_2137475 ) ) ( not ( = ?auto_2137476 ?auto_2137479 ) ) ( not ( = ?auto_2137476 ?auto_2137481 ) ) ( not ( = ?auto_2137476 ?auto_2137480 ) ) ( not ( = ?auto_2137476 ?auto_2137482 ) ) ( not ( = ?auto_2137476 ?auto_2137483 ) ) ( not ( = ?auto_2137477 ?auto_2137478 ) ) ( not ( = ?auto_2137477 ?auto_2137475 ) ) ( not ( = ?auto_2137477 ?auto_2137479 ) ) ( not ( = ?auto_2137477 ?auto_2137481 ) ) ( not ( = ?auto_2137477 ?auto_2137480 ) ) ( not ( = ?auto_2137477 ?auto_2137482 ) ) ( not ( = ?auto_2137477 ?auto_2137483 ) ) ( not ( = ?auto_2137478 ?auto_2137475 ) ) ( not ( = ?auto_2137478 ?auto_2137479 ) ) ( not ( = ?auto_2137478 ?auto_2137481 ) ) ( not ( = ?auto_2137478 ?auto_2137480 ) ) ( not ( = ?auto_2137478 ?auto_2137482 ) ) ( not ( = ?auto_2137478 ?auto_2137483 ) ) ( not ( = ?auto_2137475 ?auto_2137479 ) ) ( not ( = ?auto_2137475 ?auto_2137481 ) ) ( not ( = ?auto_2137475 ?auto_2137480 ) ) ( not ( = ?auto_2137475 ?auto_2137482 ) ) ( not ( = ?auto_2137475 ?auto_2137483 ) ) ( not ( = ?auto_2137479 ?auto_2137481 ) ) ( not ( = ?auto_2137479 ?auto_2137480 ) ) ( not ( = ?auto_2137479 ?auto_2137482 ) ) ( not ( = ?auto_2137479 ?auto_2137483 ) ) ( not ( = ?auto_2137481 ?auto_2137480 ) ) ( not ( = ?auto_2137481 ?auto_2137482 ) ) ( not ( = ?auto_2137481 ?auto_2137483 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2137480 ?auto_2137482 ?auto_2137483 )
      ( MAKE-8CRATE-VERIFY ?auto_2137476 ?auto_2137477 ?auto_2137478 ?auto_2137475 ?auto_2137479 ?auto_2137481 ?auto_2137480 ?auto_2137482 ?auto_2137483 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2137568 - SURFACE
      ?auto_2137569 - SURFACE
      ?auto_2137570 - SURFACE
      ?auto_2137567 - SURFACE
      ?auto_2137571 - SURFACE
      ?auto_2137573 - SURFACE
      ?auto_2137572 - SURFACE
      ?auto_2137574 - SURFACE
      ?auto_2137575 - SURFACE
    )
    :vars
    (
      ?auto_2137579 - HOIST
      ?auto_2137577 - PLACE
      ?auto_2137576 - TRUCK
      ?auto_2137581 - PLACE
      ?auto_2137578 - HOIST
      ?auto_2137580 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2137579 ?auto_2137577 ) ( SURFACE-AT ?auto_2137574 ?auto_2137577 ) ( CLEAR ?auto_2137574 ) ( IS-CRATE ?auto_2137575 ) ( not ( = ?auto_2137574 ?auto_2137575 ) ) ( AVAILABLE ?auto_2137579 ) ( ON ?auto_2137574 ?auto_2137572 ) ( not ( = ?auto_2137572 ?auto_2137574 ) ) ( not ( = ?auto_2137572 ?auto_2137575 ) ) ( TRUCK-AT ?auto_2137576 ?auto_2137581 ) ( not ( = ?auto_2137581 ?auto_2137577 ) ) ( HOIST-AT ?auto_2137578 ?auto_2137581 ) ( not ( = ?auto_2137579 ?auto_2137578 ) ) ( AVAILABLE ?auto_2137578 ) ( SURFACE-AT ?auto_2137575 ?auto_2137581 ) ( ON ?auto_2137575 ?auto_2137580 ) ( CLEAR ?auto_2137575 ) ( not ( = ?auto_2137574 ?auto_2137580 ) ) ( not ( = ?auto_2137575 ?auto_2137580 ) ) ( not ( = ?auto_2137572 ?auto_2137580 ) ) ( ON ?auto_2137569 ?auto_2137568 ) ( ON ?auto_2137570 ?auto_2137569 ) ( ON ?auto_2137567 ?auto_2137570 ) ( ON ?auto_2137571 ?auto_2137567 ) ( ON ?auto_2137573 ?auto_2137571 ) ( ON ?auto_2137572 ?auto_2137573 ) ( not ( = ?auto_2137568 ?auto_2137569 ) ) ( not ( = ?auto_2137568 ?auto_2137570 ) ) ( not ( = ?auto_2137568 ?auto_2137567 ) ) ( not ( = ?auto_2137568 ?auto_2137571 ) ) ( not ( = ?auto_2137568 ?auto_2137573 ) ) ( not ( = ?auto_2137568 ?auto_2137572 ) ) ( not ( = ?auto_2137568 ?auto_2137574 ) ) ( not ( = ?auto_2137568 ?auto_2137575 ) ) ( not ( = ?auto_2137568 ?auto_2137580 ) ) ( not ( = ?auto_2137569 ?auto_2137570 ) ) ( not ( = ?auto_2137569 ?auto_2137567 ) ) ( not ( = ?auto_2137569 ?auto_2137571 ) ) ( not ( = ?auto_2137569 ?auto_2137573 ) ) ( not ( = ?auto_2137569 ?auto_2137572 ) ) ( not ( = ?auto_2137569 ?auto_2137574 ) ) ( not ( = ?auto_2137569 ?auto_2137575 ) ) ( not ( = ?auto_2137569 ?auto_2137580 ) ) ( not ( = ?auto_2137570 ?auto_2137567 ) ) ( not ( = ?auto_2137570 ?auto_2137571 ) ) ( not ( = ?auto_2137570 ?auto_2137573 ) ) ( not ( = ?auto_2137570 ?auto_2137572 ) ) ( not ( = ?auto_2137570 ?auto_2137574 ) ) ( not ( = ?auto_2137570 ?auto_2137575 ) ) ( not ( = ?auto_2137570 ?auto_2137580 ) ) ( not ( = ?auto_2137567 ?auto_2137571 ) ) ( not ( = ?auto_2137567 ?auto_2137573 ) ) ( not ( = ?auto_2137567 ?auto_2137572 ) ) ( not ( = ?auto_2137567 ?auto_2137574 ) ) ( not ( = ?auto_2137567 ?auto_2137575 ) ) ( not ( = ?auto_2137567 ?auto_2137580 ) ) ( not ( = ?auto_2137571 ?auto_2137573 ) ) ( not ( = ?auto_2137571 ?auto_2137572 ) ) ( not ( = ?auto_2137571 ?auto_2137574 ) ) ( not ( = ?auto_2137571 ?auto_2137575 ) ) ( not ( = ?auto_2137571 ?auto_2137580 ) ) ( not ( = ?auto_2137573 ?auto_2137572 ) ) ( not ( = ?auto_2137573 ?auto_2137574 ) ) ( not ( = ?auto_2137573 ?auto_2137575 ) ) ( not ( = ?auto_2137573 ?auto_2137580 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2137572 ?auto_2137574 ?auto_2137575 )
      ( MAKE-8CRATE-VERIFY ?auto_2137568 ?auto_2137569 ?auto_2137570 ?auto_2137567 ?auto_2137571 ?auto_2137573 ?auto_2137572 ?auto_2137574 ?auto_2137575 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2137661 - SURFACE
      ?auto_2137662 - SURFACE
      ?auto_2137663 - SURFACE
      ?auto_2137660 - SURFACE
      ?auto_2137664 - SURFACE
      ?auto_2137666 - SURFACE
      ?auto_2137665 - SURFACE
      ?auto_2137667 - SURFACE
      ?auto_2137668 - SURFACE
    )
    :vars
    (
      ?auto_2137672 - HOIST
      ?auto_2137669 - PLACE
      ?auto_2137671 - PLACE
      ?auto_2137674 - HOIST
      ?auto_2137673 - SURFACE
      ?auto_2137670 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2137672 ?auto_2137669 ) ( SURFACE-AT ?auto_2137667 ?auto_2137669 ) ( CLEAR ?auto_2137667 ) ( IS-CRATE ?auto_2137668 ) ( not ( = ?auto_2137667 ?auto_2137668 ) ) ( AVAILABLE ?auto_2137672 ) ( ON ?auto_2137667 ?auto_2137665 ) ( not ( = ?auto_2137665 ?auto_2137667 ) ) ( not ( = ?auto_2137665 ?auto_2137668 ) ) ( not ( = ?auto_2137671 ?auto_2137669 ) ) ( HOIST-AT ?auto_2137674 ?auto_2137671 ) ( not ( = ?auto_2137672 ?auto_2137674 ) ) ( AVAILABLE ?auto_2137674 ) ( SURFACE-AT ?auto_2137668 ?auto_2137671 ) ( ON ?auto_2137668 ?auto_2137673 ) ( CLEAR ?auto_2137668 ) ( not ( = ?auto_2137667 ?auto_2137673 ) ) ( not ( = ?auto_2137668 ?auto_2137673 ) ) ( not ( = ?auto_2137665 ?auto_2137673 ) ) ( TRUCK-AT ?auto_2137670 ?auto_2137669 ) ( ON ?auto_2137662 ?auto_2137661 ) ( ON ?auto_2137663 ?auto_2137662 ) ( ON ?auto_2137660 ?auto_2137663 ) ( ON ?auto_2137664 ?auto_2137660 ) ( ON ?auto_2137666 ?auto_2137664 ) ( ON ?auto_2137665 ?auto_2137666 ) ( not ( = ?auto_2137661 ?auto_2137662 ) ) ( not ( = ?auto_2137661 ?auto_2137663 ) ) ( not ( = ?auto_2137661 ?auto_2137660 ) ) ( not ( = ?auto_2137661 ?auto_2137664 ) ) ( not ( = ?auto_2137661 ?auto_2137666 ) ) ( not ( = ?auto_2137661 ?auto_2137665 ) ) ( not ( = ?auto_2137661 ?auto_2137667 ) ) ( not ( = ?auto_2137661 ?auto_2137668 ) ) ( not ( = ?auto_2137661 ?auto_2137673 ) ) ( not ( = ?auto_2137662 ?auto_2137663 ) ) ( not ( = ?auto_2137662 ?auto_2137660 ) ) ( not ( = ?auto_2137662 ?auto_2137664 ) ) ( not ( = ?auto_2137662 ?auto_2137666 ) ) ( not ( = ?auto_2137662 ?auto_2137665 ) ) ( not ( = ?auto_2137662 ?auto_2137667 ) ) ( not ( = ?auto_2137662 ?auto_2137668 ) ) ( not ( = ?auto_2137662 ?auto_2137673 ) ) ( not ( = ?auto_2137663 ?auto_2137660 ) ) ( not ( = ?auto_2137663 ?auto_2137664 ) ) ( not ( = ?auto_2137663 ?auto_2137666 ) ) ( not ( = ?auto_2137663 ?auto_2137665 ) ) ( not ( = ?auto_2137663 ?auto_2137667 ) ) ( not ( = ?auto_2137663 ?auto_2137668 ) ) ( not ( = ?auto_2137663 ?auto_2137673 ) ) ( not ( = ?auto_2137660 ?auto_2137664 ) ) ( not ( = ?auto_2137660 ?auto_2137666 ) ) ( not ( = ?auto_2137660 ?auto_2137665 ) ) ( not ( = ?auto_2137660 ?auto_2137667 ) ) ( not ( = ?auto_2137660 ?auto_2137668 ) ) ( not ( = ?auto_2137660 ?auto_2137673 ) ) ( not ( = ?auto_2137664 ?auto_2137666 ) ) ( not ( = ?auto_2137664 ?auto_2137665 ) ) ( not ( = ?auto_2137664 ?auto_2137667 ) ) ( not ( = ?auto_2137664 ?auto_2137668 ) ) ( not ( = ?auto_2137664 ?auto_2137673 ) ) ( not ( = ?auto_2137666 ?auto_2137665 ) ) ( not ( = ?auto_2137666 ?auto_2137667 ) ) ( not ( = ?auto_2137666 ?auto_2137668 ) ) ( not ( = ?auto_2137666 ?auto_2137673 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2137665 ?auto_2137667 ?auto_2137668 )
      ( MAKE-8CRATE-VERIFY ?auto_2137661 ?auto_2137662 ?auto_2137663 ?auto_2137660 ?auto_2137664 ?auto_2137666 ?auto_2137665 ?auto_2137667 ?auto_2137668 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2137754 - SURFACE
      ?auto_2137755 - SURFACE
      ?auto_2137756 - SURFACE
      ?auto_2137753 - SURFACE
      ?auto_2137757 - SURFACE
      ?auto_2137759 - SURFACE
      ?auto_2137758 - SURFACE
      ?auto_2137760 - SURFACE
      ?auto_2137761 - SURFACE
    )
    :vars
    (
      ?auto_2137767 - HOIST
      ?auto_2137762 - PLACE
      ?auto_2137764 - PLACE
      ?auto_2137765 - HOIST
      ?auto_2137766 - SURFACE
      ?auto_2137763 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2137767 ?auto_2137762 ) ( IS-CRATE ?auto_2137761 ) ( not ( = ?auto_2137760 ?auto_2137761 ) ) ( not ( = ?auto_2137758 ?auto_2137760 ) ) ( not ( = ?auto_2137758 ?auto_2137761 ) ) ( not ( = ?auto_2137764 ?auto_2137762 ) ) ( HOIST-AT ?auto_2137765 ?auto_2137764 ) ( not ( = ?auto_2137767 ?auto_2137765 ) ) ( AVAILABLE ?auto_2137765 ) ( SURFACE-AT ?auto_2137761 ?auto_2137764 ) ( ON ?auto_2137761 ?auto_2137766 ) ( CLEAR ?auto_2137761 ) ( not ( = ?auto_2137760 ?auto_2137766 ) ) ( not ( = ?auto_2137761 ?auto_2137766 ) ) ( not ( = ?auto_2137758 ?auto_2137766 ) ) ( TRUCK-AT ?auto_2137763 ?auto_2137762 ) ( SURFACE-AT ?auto_2137758 ?auto_2137762 ) ( CLEAR ?auto_2137758 ) ( LIFTING ?auto_2137767 ?auto_2137760 ) ( IS-CRATE ?auto_2137760 ) ( ON ?auto_2137755 ?auto_2137754 ) ( ON ?auto_2137756 ?auto_2137755 ) ( ON ?auto_2137753 ?auto_2137756 ) ( ON ?auto_2137757 ?auto_2137753 ) ( ON ?auto_2137759 ?auto_2137757 ) ( ON ?auto_2137758 ?auto_2137759 ) ( not ( = ?auto_2137754 ?auto_2137755 ) ) ( not ( = ?auto_2137754 ?auto_2137756 ) ) ( not ( = ?auto_2137754 ?auto_2137753 ) ) ( not ( = ?auto_2137754 ?auto_2137757 ) ) ( not ( = ?auto_2137754 ?auto_2137759 ) ) ( not ( = ?auto_2137754 ?auto_2137758 ) ) ( not ( = ?auto_2137754 ?auto_2137760 ) ) ( not ( = ?auto_2137754 ?auto_2137761 ) ) ( not ( = ?auto_2137754 ?auto_2137766 ) ) ( not ( = ?auto_2137755 ?auto_2137756 ) ) ( not ( = ?auto_2137755 ?auto_2137753 ) ) ( not ( = ?auto_2137755 ?auto_2137757 ) ) ( not ( = ?auto_2137755 ?auto_2137759 ) ) ( not ( = ?auto_2137755 ?auto_2137758 ) ) ( not ( = ?auto_2137755 ?auto_2137760 ) ) ( not ( = ?auto_2137755 ?auto_2137761 ) ) ( not ( = ?auto_2137755 ?auto_2137766 ) ) ( not ( = ?auto_2137756 ?auto_2137753 ) ) ( not ( = ?auto_2137756 ?auto_2137757 ) ) ( not ( = ?auto_2137756 ?auto_2137759 ) ) ( not ( = ?auto_2137756 ?auto_2137758 ) ) ( not ( = ?auto_2137756 ?auto_2137760 ) ) ( not ( = ?auto_2137756 ?auto_2137761 ) ) ( not ( = ?auto_2137756 ?auto_2137766 ) ) ( not ( = ?auto_2137753 ?auto_2137757 ) ) ( not ( = ?auto_2137753 ?auto_2137759 ) ) ( not ( = ?auto_2137753 ?auto_2137758 ) ) ( not ( = ?auto_2137753 ?auto_2137760 ) ) ( not ( = ?auto_2137753 ?auto_2137761 ) ) ( not ( = ?auto_2137753 ?auto_2137766 ) ) ( not ( = ?auto_2137757 ?auto_2137759 ) ) ( not ( = ?auto_2137757 ?auto_2137758 ) ) ( not ( = ?auto_2137757 ?auto_2137760 ) ) ( not ( = ?auto_2137757 ?auto_2137761 ) ) ( not ( = ?auto_2137757 ?auto_2137766 ) ) ( not ( = ?auto_2137759 ?auto_2137758 ) ) ( not ( = ?auto_2137759 ?auto_2137760 ) ) ( not ( = ?auto_2137759 ?auto_2137761 ) ) ( not ( = ?auto_2137759 ?auto_2137766 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2137758 ?auto_2137760 ?auto_2137761 )
      ( MAKE-8CRATE-VERIFY ?auto_2137754 ?auto_2137755 ?auto_2137756 ?auto_2137753 ?auto_2137757 ?auto_2137759 ?auto_2137758 ?auto_2137760 ?auto_2137761 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2137847 - SURFACE
      ?auto_2137848 - SURFACE
      ?auto_2137849 - SURFACE
      ?auto_2137846 - SURFACE
      ?auto_2137850 - SURFACE
      ?auto_2137852 - SURFACE
      ?auto_2137851 - SURFACE
      ?auto_2137853 - SURFACE
      ?auto_2137854 - SURFACE
    )
    :vars
    (
      ?auto_2137859 - HOIST
      ?auto_2137855 - PLACE
      ?auto_2137860 - PLACE
      ?auto_2137857 - HOIST
      ?auto_2137858 - SURFACE
      ?auto_2137856 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2137859 ?auto_2137855 ) ( IS-CRATE ?auto_2137854 ) ( not ( = ?auto_2137853 ?auto_2137854 ) ) ( not ( = ?auto_2137851 ?auto_2137853 ) ) ( not ( = ?auto_2137851 ?auto_2137854 ) ) ( not ( = ?auto_2137860 ?auto_2137855 ) ) ( HOIST-AT ?auto_2137857 ?auto_2137860 ) ( not ( = ?auto_2137859 ?auto_2137857 ) ) ( AVAILABLE ?auto_2137857 ) ( SURFACE-AT ?auto_2137854 ?auto_2137860 ) ( ON ?auto_2137854 ?auto_2137858 ) ( CLEAR ?auto_2137854 ) ( not ( = ?auto_2137853 ?auto_2137858 ) ) ( not ( = ?auto_2137854 ?auto_2137858 ) ) ( not ( = ?auto_2137851 ?auto_2137858 ) ) ( TRUCK-AT ?auto_2137856 ?auto_2137855 ) ( SURFACE-AT ?auto_2137851 ?auto_2137855 ) ( CLEAR ?auto_2137851 ) ( IS-CRATE ?auto_2137853 ) ( AVAILABLE ?auto_2137859 ) ( IN ?auto_2137853 ?auto_2137856 ) ( ON ?auto_2137848 ?auto_2137847 ) ( ON ?auto_2137849 ?auto_2137848 ) ( ON ?auto_2137846 ?auto_2137849 ) ( ON ?auto_2137850 ?auto_2137846 ) ( ON ?auto_2137852 ?auto_2137850 ) ( ON ?auto_2137851 ?auto_2137852 ) ( not ( = ?auto_2137847 ?auto_2137848 ) ) ( not ( = ?auto_2137847 ?auto_2137849 ) ) ( not ( = ?auto_2137847 ?auto_2137846 ) ) ( not ( = ?auto_2137847 ?auto_2137850 ) ) ( not ( = ?auto_2137847 ?auto_2137852 ) ) ( not ( = ?auto_2137847 ?auto_2137851 ) ) ( not ( = ?auto_2137847 ?auto_2137853 ) ) ( not ( = ?auto_2137847 ?auto_2137854 ) ) ( not ( = ?auto_2137847 ?auto_2137858 ) ) ( not ( = ?auto_2137848 ?auto_2137849 ) ) ( not ( = ?auto_2137848 ?auto_2137846 ) ) ( not ( = ?auto_2137848 ?auto_2137850 ) ) ( not ( = ?auto_2137848 ?auto_2137852 ) ) ( not ( = ?auto_2137848 ?auto_2137851 ) ) ( not ( = ?auto_2137848 ?auto_2137853 ) ) ( not ( = ?auto_2137848 ?auto_2137854 ) ) ( not ( = ?auto_2137848 ?auto_2137858 ) ) ( not ( = ?auto_2137849 ?auto_2137846 ) ) ( not ( = ?auto_2137849 ?auto_2137850 ) ) ( not ( = ?auto_2137849 ?auto_2137852 ) ) ( not ( = ?auto_2137849 ?auto_2137851 ) ) ( not ( = ?auto_2137849 ?auto_2137853 ) ) ( not ( = ?auto_2137849 ?auto_2137854 ) ) ( not ( = ?auto_2137849 ?auto_2137858 ) ) ( not ( = ?auto_2137846 ?auto_2137850 ) ) ( not ( = ?auto_2137846 ?auto_2137852 ) ) ( not ( = ?auto_2137846 ?auto_2137851 ) ) ( not ( = ?auto_2137846 ?auto_2137853 ) ) ( not ( = ?auto_2137846 ?auto_2137854 ) ) ( not ( = ?auto_2137846 ?auto_2137858 ) ) ( not ( = ?auto_2137850 ?auto_2137852 ) ) ( not ( = ?auto_2137850 ?auto_2137851 ) ) ( not ( = ?auto_2137850 ?auto_2137853 ) ) ( not ( = ?auto_2137850 ?auto_2137854 ) ) ( not ( = ?auto_2137850 ?auto_2137858 ) ) ( not ( = ?auto_2137852 ?auto_2137851 ) ) ( not ( = ?auto_2137852 ?auto_2137853 ) ) ( not ( = ?auto_2137852 ?auto_2137854 ) ) ( not ( = ?auto_2137852 ?auto_2137858 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2137851 ?auto_2137853 ?auto_2137854 )
      ( MAKE-8CRATE-VERIFY ?auto_2137847 ?auto_2137848 ?auto_2137849 ?auto_2137846 ?auto_2137850 ?auto_2137852 ?auto_2137851 ?auto_2137853 ?auto_2137854 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2137861 - SURFACE
      ?auto_2137862 - SURFACE
    )
    :vars
    (
      ?auto_2137867 - HOIST
      ?auto_2137863 - PLACE
      ?auto_2137868 - SURFACE
      ?auto_2137869 - PLACE
      ?auto_2137865 - HOIST
      ?auto_2137866 - SURFACE
      ?auto_2137864 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2137867 ?auto_2137863 ) ( IS-CRATE ?auto_2137862 ) ( not ( = ?auto_2137861 ?auto_2137862 ) ) ( not ( = ?auto_2137868 ?auto_2137861 ) ) ( not ( = ?auto_2137868 ?auto_2137862 ) ) ( not ( = ?auto_2137869 ?auto_2137863 ) ) ( HOIST-AT ?auto_2137865 ?auto_2137869 ) ( not ( = ?auto_2137867 ?auto_2137865 ) ) ( AVAILABLE ?auto_2137865 ) ( SURFACE-AT ?auto_2137862 ?auto_2137869 ) ( ON ?auto_2137862 ?auto_2137866 ) ( CLEAR ?auto_2137862 ) ( not ( = ?auto_2137861 ?auto_2137866 ) ) ( not ( = ?auto_2137862 ?auto_2137866 ) ) ( not ( = ?auto_2137868 ?auto_2137866 ) ) ( SURFACE-AT ?auto_2137868 ?auto_2137863 ) ( CLEAR ?auto_2137868 ) ( IS-CRATE ?auto_2137861 ) ( AVAILABLE ?auto_2137867 ) ( IN ?auto_2137861 ?auto_2137864 ) ( TRUCK-AT ?auto_2137864 ?auto_2137869 ) )
    :subtasks
    ( ( !DRIVE ?auto_2137864 ?auto_2137869 ?auto_2137863 )
      ( MAKE-2CRATE ?auto_2137868 ?auto_2137861 ?auto_2137862 )
      ( MAKE-1CRATE-VERIFY ?auto_2137861 ?auto_2137862 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2137870 - SURFACE
      ?auto_2137871 - SURFACE
      ?auto_2137872 - SURFACE
    )
    :vars
    (
      ?auto_2137877 - HOIST
      ?auto_2137876 - PLACE
      ?auto_2137875 - PLACE
      ?auto_2137878 - HOIST
      ?auto_2137874 - SURFACE
      ?auto_2137873 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2137877 ?auto_2137876 ) ( IS-CRATE ?auto_2137872 ) ( not ( = ?auto_2137871 ?auto_2137872 ) ) ( not ( = ?auto_2137870 ?auto_2137871 ) ) ( not ( = ?auto_2137870 ?auto_2137872 ) ) ( not ( = ?auto_2137875 ?auto_2137876 ) ) ( HOIST-AT ?auto_2137878 ?auto_2137875 ) ( not ( = ?auto_2137877 ?auto_2137878 ) ) ( AVAILABLE ?auto_2137878 ) ( SURFACE-AT ?auto_2137872 ?auto_2137875 ) ( ON ?auto_2137872 ?auto_2137874 ) ( CLEAR ?auto_2137872 ) ( not ( = ?auto_2137871 ?auto_2137874 ) ) ( not ( = ?auto_2137872 ?auto_2137874 ) ) ( not ( = ?auto_2137870 ?auto_2137874 ) ) ( SURFACE-AT ?auto_2137870 ?auto_2137876 ) ( CLEAR ?auto_2137870 ) ( IS-CRATE ?auto_2137871 ) ( AVAILABLE ?auto_2137877 ) ( IN ?auto_2137871 ?auto_2137873 ) ( TRUCK-AT ?auto_2137873 ?auto_2137875 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2137871 ?auto_2137872 )
      ( MAKE-2CRATE-VERIFY ?auto_2137870 ?auto_2137871 ?auto_2137872 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2137880 - SURFACE
      ?auto_2137881 - SURFACE
      ?auto_2137882 - SURFACE
      ?auto_2137879 - SURFACE
    )
    :vars
    (
      ?auto_2137885 - HOIST
      ?auto_2137887 - PLACE
      ?auto_2137884 - PLACE
      ?auto_2137883 - HOIST
      ?auto_2137886 - SURFACE
      ?auto_2137888 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2137885 ?auto_2137887 ) ( IS-CRATE ?auto_2137879 ) ( not ( = ?auto_2137882 ?auto_2137879 ) ) ( not ( = ?auto_2137881 ?auto_2137882 ) ) ( not ( = ?auto_2137881 ?auto_2137879 ) ) ( not ( = ?auto_2137884 ?auto_2137887 ) ) ( HOIST-AT ?auto_2137883 ?auto_2137884 ) ( not ( = ?auto_2137885 ?auto_2137883 ) ) ( AVAILABLE ?auto_2137883 ) ( SURFACE-AT ?auto_2137879 ?auto_2137884 ) ( ON ?auto_2137879 ?auto_2137886 ) ( CLEAR ?auto_2137879 ) ( not ( = ?auto_2137882 ?auto_2137886 ) ) ( not ( = ?auto_2137879 ?auto_2137886 ) ) ( not ( = ?auto_2137881 ?auto_2137886 ) ) ( SURFACE-AT ?auto_2137881 ?auto_2137887 ) ( CLEAR ?auto_2137881 ) ( IS-CRATE ?auto_2137882 ) ( AVAILABLE ?auto_2137885 ) ( IN ?auto_2137882 ?auto_2137888 ) ( TRUCK-AT ?auto_2137888 ?auto_2137884 ) ( ON ?auto_2137881 ?auto_2137880 ) ( not ( = ?auto_2137880 ?auto_2137881 ) ) ( not ( = ?auto_2137880 ?auto_2137882 ) ) ( not ( = ?auto_2137880 ?auto_2137879 ) ) ( not ( = ?auto_2137880 ?auto_2137886 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2137881 ?auto_2137882 ?auto_2137879 )
      ( MAKE-3CRATE-VERIFY ?auto_2137880 ?auto_2137881 ?auto_2137882 ?auto_2137879 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2137890 - SURFACE
      ?auto_2137891 - SURFACE
      ?auto_2137892 - SURFACE
      ?auto_2137889 - SURFACE
      ?auto_2137893 - SURFACE
    )
    :vars
    (
      ?auto_2137896 - HOIST
      ?auto_2137898 - PLACE
      ?auto_2137895 - PLACE
      ?auto_2137894 - HOIST
      ?auto_2137897 - SURFACE
      ?auto_2137899 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2137896 ?auto_2137898 ) ( IS-CRATE ?auto_2137893 ) ( not ( = ?auto_2137889 ?auto_2137893 ) ) ( not ( = ?auto_2137892 ?auto_2137889 ) ) ( not ( = ?auto_2137892 ?auto_2137893 ) ) ( not ( = ?auto_2137895 ?auto_2137898 ) ) ( HOIST-AT ?auto_2137894 ?auto_2137895 ) ( not ( = ?auto_2137896 ?auto_2137894 ) ) ( AVAILABLE ?auto_2137894 ) ( SURFACE-AT ?auto_2137893 ?auto_2137895 ) ( ON ?auto_2137893 ?auto_2137897 ) ( CLEAR ?auto_2137893 ) ( not ( = ?auto_2137889 ?auto_2137897 ) ) ( not ( = ?auto_2137893 ?auto_2137897 ) ) ( not ( = ?auto_2137892 ?auto_2137897 ) ) ( SURFACE-AT ?auto_2137892 ?auto_2137898 ) ( CLEAR ?auto_2137892 ) ( IS-CRATE ?auto_2137889 ) ( AVAILABLE ?auto_2137896 ) ( IN ?auto_2137889 ?auto_2137899 ) ( TRUCK-AT ?auto_2137899 ?auto_2137895 ) ( ON ?auto_2137891 ?auto_2137890 ) ( ON ?auto_2137892 ?auto_2137891 ) ( not ( = ?auto_2137890 ?auto_2137891 ) ) ( not ( = ?auto_2137890 ?auto_2137892 ) ) ( not ( = ?auto_2137890 ?auto_2137889 ) ) ( not ( = ?auto_2137890 ?auto_2137893 ) ) ( not ( = ?auto_2137890 ?auto_2137897 ) ) ( not ( = ?auto_2137891 ?auto_2137892 ) ) ( not ( = ?auto_2137891 ?auto_2137889 ) ) ( not ( = ?auto_2137891 ?auto_2137893 ) ) ( not ( = ?auto_2137891 ?auto_2137897 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2137892 ?auto_2137889 ?auto_2137893 )
      ( MAKE-4CRATE-VERIFY ?auto_2137890 ?auto_2137891 ?auto_2137892 ?auto_2137889 ?auto_2137893 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2137901 - SURFACE
      ?auto_2137902 - SURFACE
      ?auto_2137903 - SURFACE
      ?auto_2137900 - SURFACE
      ?auto_2137904 - SURFACE
      ?auto_2137905 - SURFACE
    )
    :vars
    (
      ?auto_2137908 - HOIST
      ?auto_2137910 - PLACE
      ?auto_2137907 - PLACE
      ?auto_2137906 - HOIST
      ?auto_2137909 - SURFACE
      ?auto_2137911 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2137908 ?auto_2137910 ) ( IS-CRATE ?auto_2137905 ) ( not ( = ?auto_2137904 ?auto_2137905 ) ) ( not ( = ?auto_2137900 ?auto_2137904 ) ) ( not ( = ?auto_2137900 ?auto_2137905 ) ) ( not ( = ?auto_2137907 ?auto_2137910 ) ) ( HOIST-AT ?auto_2137906 ?auto_2137907 ) ( not ( = ?auto_2137908 ?auto_2137906 ) ) ( AVAILABLE ?auto_2137906 ) ( SURFACE-AT ?auto_2137905 ?auto_2137907 ) ( ON ?auto_2137905 ?auto_2137909 ) ( CLEAR ?auto_2137905 ) ( not ( = ?auto_2137904 ?auto_2137909 ) ) ( not ( = ?auto_2137905 ?auto_2137909 ) ) ( not ( = ?auto_2137900 ?auto_2137909 ) ) ( SURFACE-AT ?auto_2137900 ?auto_2137910 ) ( CLEAR ?auto_2137900 ) ( IS-CRATE ?auto_2137904 ) ( AVAILABLE ?auto_2137908 ) ( IN ?auto_2137904 ?auto_2137911 ) ( TRUCK-AT ?auto_2137911 ?auto_2137907 ) ( ON ?auto_2137902 ?auto_2137901 ) ( ON ?auto_2137903 ?auto_2137902 ) ( ON ?auto_2137900 ?auto_2137903 ) ( not ( = ?auto_2137901 ?auto_2137902 ) ) ( not ( = ?auto_2137901 ?auto_2137903 ) ) ( not ( = ?auto_2137901 ?auto_2137900 ) ) ( not ( = ?auto_2137901 ?auto_2137904 ) ) ( not ( = ?auto_2137901 ?auto_2137905 ) ) ( not ( = ?auto_2137901 ?auto_2137909 ) ) ( not ( = ?auto_2137902 ?auto_2137903 ) ) ( not ( = ?auto_2137902 ?auto_2137900 ) ) ( not ( = ?auto_2137902 ?auto_2137904 ) ) ( not ( = ?auto_2137902 ?auto_2137905 ) ) ( not ( = ?auto_2137902 ?auto_2137909 ) ) ( not ( = ?auto_2137903 ?auto_2137900 ) ) ( not ( = ?auto_2137903 ?auto_2137904 ) ) ( not ( = ?auto_2137903 ?auto_2137905 ) ) ( not ( = ?auto_2137903 ?auto_2137909 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2137900 ?auto_2137904 ?auto_2137905 )
      ( MAKE-5CRATE-VERIFY ?auto_2137901 ?auto_2137902 ?auto_2137903 ?auto_2137900 ?auto_2137904 ?auto_2137905 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2137913 - SURFACE
      ?auto_2137914 - SURFACE
      ?auto_2137915 - SURFACE
      ?auto_2137912 - SURFACE
      ?auto_2137916 - SURFACE
      ?auto_2137918 - SURFACE
      ?auto_2137917 - SURFACE
    )
    :vars
    (
      ?auto_2137921 - HOIST
      ?auto_2137923 - PLACE
      ?auto_2137920 - PLACE
      ?auto_2137919 - HOIST
      ?auto_2137922 - SURFACE
      ?auto_2137924 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2137921 ?auto_2137923 ) ( IS-CRATE ?auto_2137917 ) ( not ( = ?auto_2137918 ?auto_2137917 ) ) ( not ( = ?auto_2137916 ?auto_2137918 ) ) ( not ( = ?auto_2137916 ?auto_2137917 ) ) ( not ( = ?auto_2137920 ?auto_2137923 ) ) ( HOIST-AT ?auto_2137919 ?auto_2137920 ) ( not ( = ?auto_2137921 ?auto_2137919 ) ) ( AVAILABLE ?auto_2137919 ) ( SURFACE-AT ?auto_2137917 ?auto_2137920 ) ( ON ?auto_2137917 ?auto_2137922 ) ( CLEAR ?auto_2137917 ) ( not ( = ?auto_2137918 ?auto_2137922 ) ) ( not ( = ?auto_2137917 ?auto_2137922 ) ) ( not ( = ?auto_2137916 ?auto_2137922 ) ) ( SURFACE-AT ?auto_2137916 ?auto_2137923 ) ( CLEAR ?auto_2137916 ) ( IS-CRATE ?auto_2137918 ) ( AVAILABLE ?auto_2137921 ) ( IN ?auto_2137918 ?auto_2137924 ) ( TRUCK-AT ?auto_2137924 ?auto_2137920 ) ( ON ?auto_2137914 ?auto_2137913 ) ( ON ?auto_2137915 ?auto_2137914 ) ( ON ?auto_2137912 ?auto_2137915 ) ( ON ?auto_2137916 ?auto_2137912 ) ( not ( = ?auto_2137913 ?auto_2137914 ) ) ( not ( = ?auto_2137913 ?auto_2137915 ) ) ( not ( = ?auto_2137913 ?auto_2137912 ) ) ( not ( = ?auto_2137913 ?auto_2137916 ) ) ( not ( = ?auto_2137913 ?auto_2137918 ) ) ( not ( = ?auto_2137913 ?auto_2137917 ) ) ( not ( = ?auto_2137913 ?auto_2137922 ) ) ( not ( = ?auto_2137914 ?auto_2137915 ) ) ( not ( = ?auto_2137914 ?auto_2137912 ) ) ( not ( = ?auto_2137914 ?auto_2137916 ) ) ( not ( = ?auto_2137914 ?auto_2137918 ) ) ( not ( = ?auto_2137914 ?auto_2137917 ) ) ( not ( = ?auto_2137914 ?auto_2137922 ) ) ( not ( = ?auto_2137915 ?auto_2137912 ) ) ( not ( = ?auto_2137915 ?auto_2137916 ) ) ( not ( = ?auto_2137915 ?auto_2137918 ) ) ( not ( = ?auto_2137915 ?auto_2137917 ) ) ( not ( = ?auto_2137915 ?auto_2137922 ) ) ( not ( = ?auto_2137912 ?auto_2137916 ) ) ( not ( = ?auto_2137912 ?auto_2137918 ) ) ( not ( = ?auto_2137912 ?auto_2137917 ) ) ( not ( = ?auto_2137912 ?auto_2137922 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2137916 ?auto_2137918 ?auto_2137917 )
      ( MAKE-6CRATE-VERIFY ?auto_2137913 ?auto_2137914 ?auto_2137915 ?auto_2137912 ?auto_2137916 ?auto_2137918 ?auto_2137917 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2137926 - SURFACE
      ?auto_2137927 - SURFACE
      ?auto_2137928 - SURFACE
      ?auto_2137925 - SURFACE
      ?auto_2137929 - SURFACE
      ?auto_2137931 - SURFACE
      ?auto_2137930 - SURFACE
      ?auto_2137932 - SURFACE
    )
    :vars
    (
      ?auto_2137935 - HOIST
      ?auto_2137937 - PLACE
      ?auto_2137934 - PLACE
      ?auto_2137933 - HOIST
      ?auto_2137936 - SURFACE
      ?auto_2137938 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2137935 ?auto_2137937 ) ( IS-CRATE ?auto_2137932 ) ( not ( = ?auto_2137930 ?auto_2137932 ) ) ( not ( = ?auto_2137931 ?auto_2137930 ) ) ( not ( = ?auto_2137931 ?auto_2137932 ) ) ( not ( = ?auto_2137934 ?auto_2137937 ) ) ( HOIST-AT ?auto_2137933 ?auto_2137934 ) ( not ( = ?auto_2137935 ?auto_2137933 ) ) ( AVAILABLE ?auto_2137933 ) ( SURFACE-AT ?auto_2137932 ?auto_2137934 ) ( ON ?auto_2137932 ?auto_2137936 ) ( CLEAR ?auto_2137932 ) ( not ( = ?auto_2137930 ?auto_2137936 ) ) ( not ( = ?auto_2137932 ?auto_2137936 ) ) ( not ( = ?auto_2137931 ?auto_2137936 ) ) ( SURFACE-AT ?auto_2137931 ?auto_2137937 ) ( CLEAR ?auto_2137931 ) ( IS-CRATE ?auto_2137930 ) ( AVAILABLE ?auto_2137935 ) ( IN ?auto_2137930 ?auto_2137938 ) ( TRUCK-AT ?auto_2137938 ?auto_2137934 ) ( ON ?auto_2137927 ?auto_2137926 ) ( ON ?auto_2137928 ?auto_2137927 ) ( ON ?auto_2137925 ?auto_2137928 ) ( ON ?auto_2137929 ?auto_2137925 ) ( ON ?auto_2137931 ?auto_2137929 ) ( not ( = ?auto_2137926 ?auto_2137927 ) ) ( not ( = ?auto_2137926 ?auto_2137928 ) ) ( not ( = ?auto_2137926 ?auto_2137925 ) ) ( not ( = ?auto_2137926 ?auto_2137929 ) ) ( not ( = ?auto_2137926 ?auto_2137931 ) ) ( not ( = ?auto_2137926 ?auto_2137930 ) ) ( not ( = ?auto_2137926 ?auto_2137932 ) ) ( not ( = ?auto_2137926 ?auto_2137936 ) ) ( not ( = ?auto_2137927 ?auto_2137928 ) ) ( not ( = ?auto_2137927 ?auto_2137925 ) ) ( not ( = ?auto_2137927 ?auto_2137929 ) ) ( not ( = ?auto_2137927 ?auto_2137931 ) ) ( not ( = ?auto_2137927 ?auto_2137930 ) ) ( not ( = ?auto_2137927 ?auto_2137932 ) ) ( not ( = ?auto_2137927 ?auto_2137936 ) ) ( not ( = ?auto_2137928 ?auto_2137925 ) ) ( not ( = ?auto_2137928 ?auto_2137929 ) ) ( not ( = ?auto_2137928 ?auto_2137931 ) ) ( not ( = ?auto_2137928 ?auto_2137930 ) ) ( not ( = ?auto_2137928 ?auto_2137932 ) ) ( not ( = ?auto_2137928 ?auto_2137936 ) ) ( not ( = ?auto_2137925 ?auto_2137929 ) ) ( not ( = ?auto_2137925 ?auto_2137931 ) ) ( not ( = ?auto_2137925 ?auto_2137930 ) ) ( not ( = ?auto_2137925 ?auto_2137932 ) ) ( not ( = ?auto_2137925 ?auto_2137936 ) ) ( not ( = ?auto_2137929 ?auto_2137931 ) ) ( not ( = ?auto_2137929 ?auto_2137930 ) ) ( not ( = ?auto_2137929 ?auto_2137932 ) ) ( not ( = ?auto_2137929 ?auto_2137936 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2137931 ?auto_2137930 ?auto_2137932 )
      ( MAKE-7CRATE-VERIFY ?auto_2137926 ?auto_2137927 ?auto_2137928 ?auto_2137925 ?auto_2137929 ?auto_2137931 ?auto_2137930 ?auto_2137932 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2137940 - SURFACE
      ?auto_2137941 - SURFACE
      ?auto_2137942 - SURFACE
      ?auto_2137939 - SURFACE
      ?auto_2137943 - SURFACE
      ?auto_2137945 - SURFACE
      ?auto_2137944 - SURFACE
      ?auto_2137946 - SURFACE
      ?auto_2137947 - SURFACE
    )
    :vars
    (
      ?auto_2137950 - HOIST
      ?auto_2137952 - PLACE
      ?auto_2137949 - PLACE
      ?auto_2137948 - HOIST
      ?auto_2137951 - SURFACE
      ?auto_2137953 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2137950 ?auto_2137952 ) ( IS-CRATE ?auto_2137947 ) ( not ( = ?auto_2137946 ?auto_2137947 ) ) ( not ( = ?auto_2137944 ?auto_2137946 ) ) ( not ( = ?auto_2137944 ?auto_2137947 ) ) ( not ( = ?auto_2137949 ?auto_2137952 ) ) ( HOIST-AT ?auto_2137948 ?auto_2137949 ) ( not ( = ?auto_2137950 ?auto_2137948 ) ) ( AVAILABLE ?auto_2137948 ) ( SURFACE-AT ?auto_2137947 ?auto_2137949 ) ( ON ?auto_2137947 ?auto_2137951 ) ( CLEAR ?auto_2137947 ) ( not ( = ?auto_2137946 ?auto_2137951 ) ) ( not ( = ?auto_2137947 ?auto_2137951 ) ) ( not ( = ?auto_2137944 ?auto_2137951 ) ) ( SURFACE-AT ?auto_2137944 ?auto_2137952 ) ( CLEAR ?auto_2137944 ) ( IS-CRATE ?auto_2137946 ) ( AVAILABLE ?auto_2137950 ) ( IN ?auto_2137946 ?auto_2137953 ) ( TRUCK-AT ?auto_2137953 ?auto_2137949 ) ( ON ?auto_2137941 ?auto_2137940 ) ( ON ?auto_2137942 ?auto_2137941 ) ( ON ?auto_2137939 ?auto_2137942 ) ( ON ?auto_2137943 ?auto_2137939 ) ( ON ?auto_2137945 ?auto_2137943 ) ( ON ?auto_2137944 ?auto_2137945 ) ( not ( = ?auto_2137940 ?auto_2137941 ) ) ( not ( = ?auto_2137940 ?auto_2137942 ) ) ( not ( = ?auto_2137940 ?auto_2137939 ) ) ( not ( = ?auto_2137940 ?auto_2137943 ) ) ( not ( = ?auto_2137940 ?auto_2137945 ) ) ( not ( = ?auto_2137940 ?auto_2137944 ) ) ( not ( = ?auto_2137940 ?auto_2137946 ) ) ( not ( = ?auto_2137940 ?auto_2137947 ) ) ( not ( = ?auto_2137940 ?auto_2137951 ) ) ( not ( = ?auto_2137941 ?auto_2137942 ) ) ( not ( = ?auto_2137941 ?auto_2137939 ) ) ( not ( = ?auto_2137941 ?auto_2137943 ) ) ( not ( = ?auto_2137941 ?auto_2137945 ) ) ( not ( = ?auto_2137941 ?auto_2137944 ) ) ( not ( = ?auto_2137941 ?auto_2137946 ) ) ( not ( = ?auto_2137941 ?auto_2137947 ) ) ( not ( = ?auto_2137941 ?auto_2137951 ) ) ( not ( = ?auto_2137942 ?auto_2137939 ) ) ( not ( = ?auto_2137942 ?auto_2137943 ) ) ( not ( = ?auto_2137942 ?auto_2137945 ) ) ( not ( = ?auto_2137942 ?auto_2137944 ) ) ( not ( = ?auto_2137942 ?auto_2137946 ) ) ( not ( = ?auto_2137942 ?auto_2137947 ) ) ( not ( = ?auto_2137942 ?auto_2137951 ) ) ( not ( = ?auto_2137939 ?auto_2137943 ) ) ( not ( = ?auto_2137939 ?auto_2137945 ) ) ( not ( = ?auto_2137939 ?auto_2137944 ) ) ( not ( = ?auto_2137939 ?auto_2137946 ) ) ( not ( = ?auto_2137939 ?auto_2137947 ) ) ( not ( = ?auto_2137939 ?auto_2137951 ) ) ( not ( = ?auto_2137943 ?auto_2137945 ) ) ( not ( = ?auto_2137943 ?auto_2137944 ) ) ( not ( = ?auto_2137943 ?auto_2137946 ) ) ( not ( = ?auto_2137943 ?auto_2137947 ) ) ( not ( = ?auto_2137943 ?auto_2137951 ) ) ( not ( = ?auto_2137945 ?auto_2137944 ) ) ( not ( = ?auto_2137945 ?auto_2137946 ) ) ( not ( = ?auto_2137945 ?auto_2137947 ) ) ( not ( = ?auto_2137945 ?auto_2137951 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2137944 ?auto_2137946 ?auto_2137947 )
      ( MAKE-8CRATE-VERIFY ?auto_2137940 ?auto_2137941 ?auto_2137942 ?auto_2137939 ?auto_2137943 ?auto_2137945 ?auto_2137944 ?auto_2137946 ?auto_2137947 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2137954 - SURFACE
      ?auto_2137955 - SURFACE
    )
    :vars
    (
      ?auto_2137959 - HOIST
      ?auto_2137961 - PLACE
      ?auto_2137956 - SURFACE
      ?auto_2137958 - PLACE
      ?auto_2137957 - HOIST
      ?auto_2137960 - SURFACE
      ?auto_2137962 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2137959 ?auto_2137961 ) ( IS-CRATE ?auto_2137955 ) ( not ( = ?auto_2137954 ?auto_2137955 ) ) ( not ( = ?auto_2137956 ?auto_2137954 ) ) ( not ( = ?auto_2137956 ?auto_2137955 ) ) ( not ( = ?auto_2137958 ?auto_2137961 ) ) ( HOIST-AT ?auto_2137957 ?auto_2137958 ) ( not ( = ?auto_2137959 ?auto_2137957 ) ) ( SURFACE-AT ?auto_2137955 ?auto_2137958 ) ( ON ?auto_2137955 ?auto_2137960 ) ( CLEAR ?auto_2137955 ) ( not ( = ?auto_2137954 ?auto_2137960 ) ) ( not ( = ?auto_2137955 ?auto_2137960 ) ) ( not ( = ?auto_2137956 ?auto_2137960 ) ) ( SURFACE-AT ?auto_2137956 ?auto_2137961 ) ( CLEAR ?auto_2137956 ) ( IS-CRATE ?auto_2137954 ) ( AVAILABLE ?auto_2137959 ) ( TRUCK-AT ?auto_2137962 ?auto_2137958 ) ( LIFTING ?auto_2137957 ?auto_2137954 ) )
    :subtasks
    ( ( !LOAD ?auto_2137957 ?auto_2137954 ?auto_2137962 ?auto_2137958 )
      ( MAKE-2CRATE ?auto_2137956 ?auto_2137954 ?auto_2137955 )
      ( MAKE-1CRATE-VERIFY ?auto_2137954 ?auto_2137955 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2137963 - SURFACE
      ?auto_2137964 - SURFACE
      ?auto_2137965 - SURFACE
    )
    :vars
    (
      ?auto_2137971 - HOIST
      ?auto_2137970 - PLACE
      ?auto_2137966 - PLACE
      ?auto_2137968 - HOIST
      ?auto_2137967 - SURFACE
      ?auto_2137969 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2137971 ?auto_2137970 ) ( IS-CRATE ?auto_2137965 ) ( not ( = ?auto_2137964 ?auto_2137965 ) ) ( not ( = ?auto_2137963 ?auto_2137964 ) ) ( not ( = ?auto_2137963 ?auto_2137965 ) ) ( not ( = ?auto_2137966 ?auto_2137970 ) ) ( HOIST-AT ?auto_2137968 ?auto_2137966 ) ( not ( = ?auto_2137971 ?auto_2137968 ) ) ( SURFACE-AT ?auto_2137965 ?auto_2137966 ) ( ON ?auto_2137965 ?auto_2137967 ) ( CLEAR ?auto_2137965 ) ( not ( = ?auto_2137964 ?auto_2137967 ) ) ( not ( = ?auto_2137965 ?auto_2137967 ) ) ( not ( = ?auto_2137963 ?auto_2137967 ) ) ( SURFACE-AT ?auto_2137963 ?auto_2137970 ) ( CLEAR ?auto_2137963 ) ( IS-CRATE ?auto_2137964 ) ( AVAILABLE ?auto_2137971 ) ( TRUCK-AT ?auto_2137969 ?auto_2137966 ) ( LIFTING ?auto_2137968 ?auto_2137964 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2137964 ?auto_2137965 )
      ( MAKE-2CRATE-VERIFY ?auto_2137963 ?auto_2137964 ?auto_2137965 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2137973 - SURFACE
      ?auto_2137974 - SURFACE
      ?auto_2137975 - SURFACE
      ?auto_2137972 - SURFACE
    )
    :vars
    (
      ?auto_2137978 - HOIST
      ?auto_2137976 - PLACE
      ?auto_2137980 - PLACE
      ?auto_2137981 - HOIST
      ?auto_2137977 - SURFACE
      ?auto_2137979 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2137978 ?auto_2137976 ) ( IS-CRATE ?auto_2137972 ) ( not ( = ?auto_2137975 ?auto_2137972 ) ) ( not ( = ?auto_2137974 ?auto_2137975 ) ) ( not ( = ?auto_2137974 ?auto_2137972 ) ) ( not ( = ?auto_2137980 ?auto_2137976 ) ) ( HOIST-AT ?auto_2137981 ?auto_2137980 ) ( not ( = ?auto_2137978 ?auto_2137981 ) ) ( SURFACE-AT ?auto_2137972 ?auto_2137980 ) ( ON ?auto_2137972 ?auto_2137977 ) ( CLEAR ?auto_2137972 ) ( not ( = ?auto_2137975 ?auto_2137977 ) ) ( not ( = ?auto_2137972 ?auto_2137977 ) ) ( not ( = ?auto_2137974 ?auto_2137977 ) ) ( SURFACE-AT ?auto_2137974 ?auto_2137976 ) ( CLEAR ?auto_2137974 ) ( IS-CRATE ?auto_2137975 ) ( AVAILABLE ?auto_2137978 ) ( TRUCK-AT ?auto_2137979 ?auto_2137980 ) ( LIFTING ?auto_2137981 ?auto_2137975 ) ( ON ?auto_2137974 ?auto_2137973 ) ( not ( = ?auto_2137973 ?auto_2137974 ) ) ( not ( = ?auto_2137973 ?auto_2137975 ) ) ( not ( = ?auto_2137973 ?auto_2137972 ) ) ( not ( = ?auto_2137973 ?auto_2137977 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2137974 ?auto_2137975 ?auto_2137972 )
      ( MAKE-3CRATE-VERIFY ?auto_2137973 ?auto_2137974 ?auto_2137975 ?auto_2137972 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2137983 - SURFACE
      ?auto_2137984 - SURFACE
      ?auto_2137985 - SURFACE
      ?auto_2137982 - SURFACE
      ?auto_2137986 - SURFACE
    )
    :vars
    (
      ?auto_2137989 - HOIST
      ?auto_2137987 - PLACE
      ?auto_2137991 - PLACE
      ?auto_2137992 - HOIST
      ?auto_2137988 - SURFACE
      ?auto_2137990 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2137989 ?auto_2137987 ) ( IS-CRATE ?auto_2137986 ) ( not ( = ?auto_2137982 ?auto_2137986 ) ) ( not ( = ?auto_2137985 ?auto_2137982 ) ) ( not ( = ?auto_2137985 ?auto_2137986 ) ) ( not ( = ?auto_2137991 ?auto_2137987 ) ) ( HOIST-AT ?auto_2137992 ?auto_2137991 ) ( not ( = ?auto_2137989 ?auto_2137992 ) ) ( SURFACE-AT ?auto_2137986 ?auto_2137991 ) ( ON ?auto_2137986 ?auto_2137988 ) ( CLEAR ?auto_2137986 ) ( not ( = ?auto_2137982 ?auto_2137988 ) ) ( not ( = ?auto_2137986 ?auto_2137988 ) ) ( not ( = ?auto_2137985 ?auto_2137988 ) ) ( SURFACE-AT ?auto_2137985 ?auto_2137987 ) ( CLEAR ?auto_2137985 ) ( IS-CRATE ?auto_2137982 ) ( AVAILABLE ?auto_2137989 ) ( TRUCK-AT ?auto_2137990 ?auto_2137991 ) ( LIFTING ?auto_2137992 ?auto_2137982 ) ( ON ?auto_2137984 ?auto_2137983 ) ( ON ?auto_2137985 ?auto_2137984 ) ( not ( = ?auto_2137983 ?auto_2137984 ) ) ( not ( = ?auto_2137983 ?auto_2137985 ) ) ( not ( = ?auto_2137983 ?auto_2137982 ) ) ( not ( = ?auto_2137983 ?auto_2137986 ) ) ( not ( = ?auto_2137983 ?auto_2137988 ) ) ( not ( = ?auto_2137984 ?auto_2137985 ) ) ( not ( = ?auto_2137984 ?auto_2137982 ) ) ( not ( = ?auto_2137984 ?auto_2137986 ) ) ( not ( = ?auto_2137984 ?auto_2137988 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2137985 ?auto_2137982 ?auto_2137986 )
      ( MAKE-4CRATE-VERIFY ?auto_2137983 ?auto_2137984 ?auto_2137985 ?auto_2137982 ?auto_2137986 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2137994 - SURFACE
      ?auto_2137995 - SURFACE
      ?auto_2137996 - SURFACE
      ?auto_2137993 - SURFACE
      ?auto_2137997 - SURFACE
      ?auto_2137998 - SURFACE
    )
    :vars
    (
      ?auto_2138001 - HOIST
      ?auto_2137999 - PLACE
      ?auto_2138003 - PLACE
      ?auto_2138004 - HOIST
      ?auto_2138000 - SURFACE
      ?auto_2138002 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2138001 ?auto_2137999 ) ( IS-CRATE ?auto_2137998 ) ( not ( = ?auto_2137997 ?auto_2137998 ) ) ( not ( = ?auto_2137993 ?auto_2137997 ) ) ( not ( = ?auto_2137993 ?auto_2137998 ) ) ( not ( = ?auto_2138003 ?auto_2137999 ) ) ( HOIST-AT ?auto_2138004 ?auto_2138003 ) ( not ( = ?auto_2138001 ?auto_2138004 ) ) ( SURFACE-AT ?auto_2137998 ?auto_2138003 ) ( ON ?auto_2137998 ?auto_2138000 ) ( CLEAR ?auto_2137998 ) ( not ( = ?auto_2137997 ?auto_2138000 ) ) ( not ( = ?auto_2137998 ?auto_2138000 ) ) ( not ( = ?auto_2137993 ?auto_2138000 ) ) ( SURFACE-AT ?auto_2137993 ?auto_2137999 ) ( CLEAR ?auto_2137993 ) ( IS-CRATE ?auto_2137997 ) ( AVAILABLE ?auto_2138001 ) ( TRUCK-AT ?auto_2138002 ?auto_2138003 ) ( LIFTING ?auto_2138004 ?auto_2137997 ) ( ON ?auto_2137995 ?auto_2137994 ) ( ON ?auto_2137996 ?auto_2137995 ) ( ON ?auto_2137993 ?auto_2137996 ) ( not ( = ?auto_2137994 ?auto_2137995 ) ) ( not ( = ?auto_2137994 ?auto_2137996 ) ) ( not ( = ?auto_2137994 ?auto_2137993 ) ) ( not ( = ?auto_2137994 ?auto_2137997 ) ) ( not ( = ?auto_2137994 ?auto_2137998 ) ) ( not ( = ?auto_2137994 ?auto_2138000 ) ) ( not ( = ?auto_2137995 ?auto_2137996 ) ) ( not ( = ?auto_2137995 ?auto_2137993 ) ) ( not ( = ?auto_2137995 ?auto_2137997 ) ) ( not ( = ?auto_2137995 ?auto_2137998 ) ) ( not ( = ?auto_2137995 ?auto_2138000 ) ) ( not ( = ?auto_2137996 ?auto_2137993 ) ) ( not ( = ?auto_2137996 ?auto_2137997 ) ) ( not ( = ?auto_2137996 ?auto_2137998 ) ) ( not ( = ?auto_2137996 ?auto_2138000 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2137993 ?auto_2137997 ?auto_2137998 )
      ( MAKE-5CRATE-VERIFY ?auto_2137994 ?auto_2137995 ?auto_2137996 ?auto_2137993 ?auto_2137997 ?auto_2137998 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2138006 - SURFACE
      ?auto_2138007 - SURFACE
      ?auto_2138008 - SURFACE
      ?auto_2138005 - SURFACE
      ?auto_2138009 - SURFACE
      ?auto_2138011 - SURFACE
      ?auto_2138010 - SURFACE
    )
    :vars
    (
      ?auto_2138014 - HOIST
      ?auto_2138012 - PLACE
      ?auto_2138016 - PLACE
      ?auto_2138017 - HOIST
      ?auto_2138013 - SURFACE
      ?auto_2138015 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2138014 ?auto_2138012 ) ( IS-CRATE ?auto_2138010 ) ( not ( = ?auto_2138011 ?auto_2138010 ) ) ( not ( = ?auto_2138009 ?auto_2138011 ) ) ( not ( = ?auto_2138009 ?auto_2138010 ) ) ( not ( = ?auto_2138016 ?auto_2138012 ) ) ( HOIST-AT ?auto_2138017 ?auto_2138016 ) ( not ( = ?auto_2138014 ?auto_2138017 ) ) ( SURFACE-AT ?auto_2138010 ?auto_2138016 ) ( ON ?auto_2138010 ?auto_2138013 ) ( CLEAR ?auto_2138010 ) ( not ( = ?auto_2138011 ?auto_2138013 ) ) ( not ( = ?auto_2138010 ?auto_2138013 ) ) ( not ( = ?auto_2138009 ?auto_2138013 ) ) ( SURFACE-AT ?auto_2138009 ?auto_2138012 ) ( CLEAR ?auto_2138009 ) ( IS-CRATE ?auto_2138011 ) ( AVAILABLE ?auto_2138014 ) ( TRUCK-AT ?auto_2138015 ?auto_2138016 ) ( LIFTING ?auto_2138017 ?auto_2138011 ) ( ON ?auto_2138007 ?auto_2138006 ) ( ON ?auto_2138008 ?auto_2138007 ) ( ON ?auto_2138005 ?auto_2138008 ) ( ON ?auto_2138009 ?auto_2138005 ) ( not ( = ?auto_2138006 ?auto_2138007 ) ) ( not ( = ?auto_2138006 ?auto_2138008 ) ) ( not ( = ?auto_2138006 ?auto_2138005 ) ) ( not ( = ?auto_2138006 ?auto_2138009 ) ) ( not ( = ?auto_2138006 ?auto_2138011 ) ) ( not ( = ?auto_2138006 ?auto_2138010 ) ) ( not ( = ?auto_2138006 ?auto_2138013 ) ) ( not ( = ?auto_2138007 ?auto_2138008 ) ) ( not ( = ?auto_2138007 ?auto_2138005 ) ) ( not ( = ?auto_2138007 ?auto_2138009 ) ) ( not ( = ?auto_2138007 ?auto_2138011 ) ) ( not ( = ?auto_2138007 ?auto_2138010 ) ) ( not ( = ?auto_2138007 ?auto_2138013 ) ) ( not ( = ?auto_2138008 ?auto_2138005 ) ) ( not ( = ?auto_2138008 ?auto_2138009 ) ) ( not ( = ?auto_2138008 ?auto_2138011 ) ) ( not ( = ?auto_2138008 ?auto_2138010 ) ) ( not ( = ?auto_2138008 ?auto_2138013 ) ) ( not ( = ?auto_2138005 ?auto_2138009 ) ) ( not ( = ?auto_2138005 ?auto_2138011 ) ) ( not ( = ?auto_2138005 ?auto_2138010 ) ) ( not ( = ?auto_2138005 ?auto_2138013 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2138009 ?auto_2138011 ?auto_2138010 )
      ( MAKE-6CRATE-VERIFY ?auto_2138006 ?auto_2138007 ?auto_2138008 ?auto_2138005 ?auto_2138009 ?auto_2138011 ?auto_2138010 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2138019 - SURFACE
      ?auto_2138020 - SURFACE
      ?auto_2138021 - SURFACE
      ?auto_2138018 - SURFACE
      ?auto_2138022 - SURFACE
      ?auto_2138024 - SURFACE
      ?auto_2138023 - SURFACE
      ?auto_2138025 - SURFACE
    )
    :vars
    (
      ?auto_2138028 - HOIST
      ?auto_2138026 - PLACE
      ?auto_2138030 - PLACE
      ?auto_2138031 - HOIST
      ?auto_2138027 - SURFACE
      ?auto_2138029 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2138028 ?auto_2138026 ) ( IS-CRATE ?auto_2138025 ) ( not ( = ?auto_2138023 ?auto_2138025 ) ) ( not ( = ?auto_2138024 ?auto_2138023 ) ) ( not ( = ?auto_2138024 ?auto_2138025 ) ) ( not ( = ?auto_2138030 ?auto_2138026 ) ) ( HOIST-AT ?auto_2138031 ?auto_2138030 ) ( not ( = ?auto_2138028 ?auto_2138031 ) ) ( SURFACE-AT ?auto_2138025 ?auto_2138030 ) ( ON ?auto_2138025 ?auto_2138027 ) ( CLEAR ?auto_2138025 ) ( not ( = ?auto_2138023 ?auto_2138027 ) ) ( not ( = ?auto_2138025 ?auto_2138027 ) ) ( not ( = ?auto_2138024 ?auto_2138027 ) ) ( SURFACE-AT ?auto_2138024 ?auto_2138026 ) ( CLEAR ?auto_2138024 ) ( IS-CRATE ?auto_2138023 ) ( AVAILABLE ?auto_2138028 ) ( TRUCK-AT ?auto_2138029 ?auto_2138030 ) ( LIFTING ?auto_2138031 ?auto_2138023 ) ( ON ?auto_2138020 ?auto_2138019 ) ( ON ?auto_2138021 ?auto_2138020 ) ( ON ?auto_2138018 ?auto_2138021 ) ( ON ?auto_2138022 ?auto_2138018 ) ( ON ?auto_2138024 ?auto_2138022 ) ( not ( = ?auto_2138019 ?auto_2138020 ) ) ( not ( = ?auto_2138019 ?auto_2138021 ) ) ( not ( = ?auto_2138019 ?auto_2138018 ) ) ( not ( = ?auto_2138019 ?auto_2138022 ) ) ( not ( = ?auto_2138019 ?auto_2138024 ) ) ( not ( = ?auto_2138019 ?auto_2138023 ) ) ( not ( = ?auto_2138019 ?auto_2138025 ) ) ( not ( = ?auto_2138019 ?auto_2138027 ) ) ( not ( = ?auto_2138020 ?auto_2138021 ) ) ( not ( = ?auto_2138020 ?auto_2138018 ) ) ( not ( = ?auto_2138020 ?auto_2138022 ) ) ( not ( = ?auto_2138020 ?auto_2138024 ) ) ( not ( = ?auto_2138020 ?auto_2138023 ) ) ( not ( = ?auto_2138020 ?auto_2138025 ) ) ( not ( = ?auto_2138020 ?auto_2138027 ) ) ( not ( = ?auto_2138021 ?auto_2138018 ) ) ( not ( = ?auto_2138021 ?auto_2138022 ) ) ( not ( = ?auto_2138021 ?auto_2138024 ) ) ( not ( = ?auto_2138021 ?auto_2138023 ) ) ( not ( = ?auto_2138021 ?auto_2138025 ) ) ( not ( = ?auto_2138021 ?auto_2138027 ) ) ( not ( = ?auto_2138018 ?auto_2138022 ) ) ( not ( = ?auto_2138018 ?auto_2138024 ) ) ( not ( = ?auto_2138018 ?auto_2138023 ) ) ( not ( = ?auto_2138018 ?auto_2138025 ) ) ( not ( = ?auto_2138018 ?auto_2138027 ) ) ( not ( = ?auto_2138022 ?auto_2138024 ) ) ( not ( = ?auto_2138022 ?auto_2138023 ) ) ( not ( = ?auto_2138022 ?auto_2138025 ) ) ( not ( = ?auto_2138022 ?auto_2138027 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2138024 ?auto_2138023 ?auto_2138025 )
      ( MAKE-7CRATE-VERIFY ?auto_2138019 ?auto_2138020 ?auto_2138021 ?auto_2138018 ?auto_2138022 ?auto_2138024 ?auto_2138023 ?auto_2138025 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2138033 - SURFACE
      ?auto_2138034 - SURFACE
      ?auto_2138035 - SURFACE
      ?auto_2138032 - SURFACE
      ?auto_2138036 - SURFACE
      ?auto_2138038 - SURFACE
      ?auto_2138037 - SURFACE
      ?auto_2138039 - SURFACE
      ?auto_2138040 - SURFACE
    )
    :vars
    (
      ?auto_2138043 - HOIST
      ?auto_2138041 - PLACE
      ?auto_2138045 - PLACE
      ?auto_2138046 - HOIST
      ?auto_2138042 - SURFACE
      ?auto_2138044 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2138043 ?auto_2138041 ) ( IS-CRATE ?auto_2138040 ) ( not ( = ?auto_2138039 ?auto_2138040 ) ) ( not ( = ?auto_2138037 ?auto_2138039 ) ) ( not ( = ?auto_2138037 ?auto_2138040 ) ) ( not ( = ?auto_2138045 ?auto_2138041 ) ) ( HOIST-AT ?auto_2138046 ?auto_2138045 ) ( not ( = ?auto_2138043 ?auto_2138046 ) ) ( SURFACE-AT ?auto_2138040 ?auto_2138045 ) ( ON ?auto_2138040 ?auto_2138042 ) ( CLEAR ?auto_2138040 ) ( not ( = ?auto_2138039 ?auto_2138042 ) ) ( not ( = ?auto_2138040 ?auto_2138042 ) ) ( not ( = ?auto_2138037 ?auto_2138042 ) ) ( SURFACE-AT ?auto_2138037 ?auto_2138041 ) ( CLEAR ?auto_2138037 ) ( IS-CRATE ?auto_2138039 ) ( AVAILABLE ?auto_2138043 ) ( TRUCK-AT ?auto_2138044 ?auto_2138045 ) ( LIFTING ?auto_2138046 ?auto_2138039 ) ( ON ?auto_2138034 ?auto_2138033 ) ( ON ?auto_2138035 ?auto_2138034 ) ( ON ?auto_2138032 ?auto_2138035 ) ( ON ?auto_2138036 ?auto_2138032 ) ( ON ?auto_2138038 ?auto_2138036 ) ( ON ?auto_2138037 ?auto_2138038 ) ( not ( = ?auto_2138033 ?auto_2138034 ) ) ( not ( = ?auto_2138033 ?auto_2138035 ) ) ( not ( = ?auto_2138033 ?auto_2138032 ) ) ( not ( = ?auto_2138033 ?auto_2138036 ) ) ( not ( = ?auto_2138033 ?auto_2138038 ) ) ( not ( = ?auto_2138033 ?auto_2138037 ) ) ( not ( = ?auto_2138033 ?auto_2138039 ) ) ( not ( = ?auto_2138033 ?auto_2138040 ) ) ( not ( = ?auto_2138033 ?auto_2138042 ) ) ( not ( = ?auto_2138034 ?auto_2138035 ) ) ( not ( = ?auto_2138034 ?auto_2138032 ) ) ( not ( = ?auto_2138034 ?auto_2138036 ) ) ( not ( = ?auto_2138034 ?auto_2138038 ) ) ( not ( = ?auto_2138034 ?auto_2138037 ) ) ( not ( = ?auto_2138034 ?auto_2138039 ) ) ( not ( = ?auto_2138034 ?auto_2138040 ) ) ( not ( = ?auto_2138034 ?auto_2138042 ) ) ( not ( = ?auto_2138035 ?auto_2138032 ) ) ( not ( = ?auto_2138035 ?auto_2138036 ) ) ( not ( = ?auto_2138035 ?auto_2138038 ) ) ( not ( = ?auto_2138035 ?auto_2138037 ) ) ( not ( = ?auto_2138035 ?auto_2138039 ) ) ( not ( = ?auto_2138035 ?auto_2138040 ) ) ( not ( = ?auto_2138035 ?auto_2138042 ) ) ( not ( = ?auto_2138032 ?auto_2138036 ) ) ( not ( = ?auto_2138032 ?auto_2138038 ) ) ( not ( = ?auto_2138032 ?auto_2138037 ) ) ( not ( = ?auto_2138032 ?auto_2138039 ) ) ( not ( = ?auto_2138032 ?auto_2138040 ) ) ( not ( = ?auto_2138032 ?auto_2138042 ) ) ( not ( = ?auto_2138036 ?auto_2138038 ) ) ( not ( = ?auto_2138036 ?auto_2138037 ) ) ( not ( = ?auto_2138036 ?auto_2138039 ) ) ( not ( = ?auto_2138036 ?auto_2138040 ) ) ( not ( = ?auto_2138036 ?auto_2138042 ) ) ( not ( = ?auto_2138038 ?auto_2138037 ) ) ( not ( = ?auto_2138038 ?auto_2138039 ) ) ( not ( = ?auto_2138038 ?auto_2138040 ) ) ( not ( = ?auto_2138038 ?auto_2138042 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2138037 ?auto_2138039 ?auto_2138040 )
      ( MAKE-8CRATE-VERIFY ?auto_2138033 ?auto_2138034 ?auto_2138035 ?auto_2138032 ?auto_2138036 ?auto_2138038 ?auto_2138037 ?auto_2138039 ?auto_2138040 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2138047 - SURFACE
      ?auto_2138048 - SURFACE
    )
    :vars
    (
      ?auto_2138051 - HOIST
      ?auto_2138049 - PLACE
      ?auto_2138055 - SURFACE
      ?auto_2138053 - PLACE
      ?auto_2138054 - HOIST
      ?auto_2138050 - SURFACE
      ?auto_2138052 - TRUCK
      ?auto_2138056 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2138051 ?auto_2138049 ) ( IS-CRATE ?auto_2138048 ) ( not ( = ?auto_2138047 ?auto_2138048 ) ) ( not ( = ?auto_2138055 ?auto_2138047 ) ) ( not ( = ?auto_2138055 ?auto_2138048 ) ) ( not ( = ?auto_2138053 ?auto_2138049 ) ) ( HOIST-AT ?auto_2138054 ?auto_2138053 ) ( not ( = ?auto_2138051 ?auto_2138054 ) ) ( SURFACE-AT ?auto_2138048 ?auto_2138053 ) ( ON ?auto_2138048 ?auto_2138050 ) ( CLEAR ?auto_2138048 ) ( not ( = ?auto_2138047 ?auto_2138050 ) ) ( not ( = ?auto_2138048 ?auto_2138050 ) ) ( not ( = ?auto_2138055 ?auto_2138050 ) ) ( SURFACE-AT ?auto_2138055 ?auto_2138049 ) ( CLEAR ?auto_2138055 ) ( IS-CRATE ?auto_2138047 ) ( AVAILABLE ?auto_2138051 ) ( TRUCK-AT ?auto_2138052 ?auto_2138053 ) ( AVAILABLE ?auto_2138054 ) ( SURFACE-AT ?auto_2138047 ?auto_2138053 ) ( ON ?auto_2138047 ?auto_2138056 ) ( CLEAR ?auto_2138047 ) ( not ( = ?auto_2138047 ?auto_2138056 ) ) ( not ( = ?auto_2138048 ?auto_2138056 ) ) ( not ( = ?auto_2138055 ?auto_2138056 ) ) ( not ( = ?auto_2138050 ?auto_2138056 ) ) )
    :subtasks
    ( ( !LIFT ?auto_2138054 ?auto_2138047 ?auto_2138056 ?auto_2138053 )
      ( MAKE-2CRATE ?auto_2138055 ?auto_2138047 ?auto_2138048 )
      ( MAKE-1CRATE-VERIFY ?auto_2138047 ?auto_2138048 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2138057 - SURFACE
      ?auto_2138058 - SURFACE
      ?auto_2138059 - SURFACE
    )
    :vars
    (
      ?auto_2138065 - HOIST
      ?auto_2138060 - PLACE
      ?auto_2138066 - PLACE
      ?auto_2138063 - HOIST
      ?auto_2138064 - SURFACE
      ?auto_2138061 - TRUCK
      ?auto_2138062 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2138065 ?auto_2138060 ) ( IS-CRATE ?auto_2138059 ) ( not ( = ?auto_2138058 ?auto_2138059 ) ) ( not ( = ?auto_2138057 ?auto_2138058 ) ) ( not ( = ?auto_2138057 ?auto_2138059 ) ) ( not ( = ?auto_2138066 ?auto_2138060 ) ) ( HOIST-AT ?auto_2138063 ?auto_2138066 ) ( not ( = ?auto_2138065 ?auto_2138063 ) ) ( SURFACE-AT ?auto_2138059 ?auto_2138066 ) ( ON ?auto_2138059 ?auto_2138064 ) ( CLEAR ?auto_2138059 ) ( not ( = ?auto_2138058 ?auto_2138064 ) ) ( not ( = ?auto_2138059 ?auto_2138064 ) ) ( not ( = ?auto_2138057 ?auto_2138064 ) ) ( SURFACE-AT ?auto_2138057 ?auto_2138060 ) ( CLEAR ?auto_2138057 ) ( IS-CRATE ?auto_2138058 ) ( AVAILABLE ?auto_2138065 ) ( TRUCK-AT ?auto_2138061 ?auto_2138066 ) ( AVAILABLE ?auto_2138063 ) ( SURFACE-AT ?auto_2138058 ?auto_2138066 ) ( ON ?auto_2138058 ?auto_2138062 ) ( CLEAR ?auto_2138058 ) ( not ( = ?auto_2138058 ?auto_2138062 ) ) ( not ( = ?auto_2138059 ?auto_2138062 ) ) ( not ( = ?auto_2138057 ?auto_2138062 ) ) ( not ( = ?auto_2138064 ?auto_2138062 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2138058 ?auto_2138059 )
      ( MAKE-2CRATE-VERIFY ?auto_2138057 ?auto_2138058 ?auto_2138059 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2138068 - SURFACE
      ?auto_2138069 - SURFACE
      ?auto_2138070 - SURFACE
      ?auto_2138067 - SURFACE
    )
    :vars
    (
      ?auto_2138072 - HOIST
      ?auto_2138074 - PLACE
      ?auto_2138075 - PLACE
      ?auto_2138071 - HOIST
      ?auto_2138073 - SURFACE
      ?auto_2138076 - TRUCK
      ?auto_2138077 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2138072 ?auto_2138074 ) ( IS-CRATE ?auto_2138067 ) ( not ( = ?auto_2138070 ?auto_2138067 ) ) ( not ( = ?auto_2138069 ?auto_2138070 ) ) ( not ( = ?auto_2138069 ?auto_2138067 ) ) ( not ( = ?auto_2138075 ?auto_2138074 ) ) ( HOIST-AT ?auto_2138071 ?auto_2138075 ) ( not ( = ?auto_2138072 ?auto_2138071 ) ) ( SURFACE-AT ?auto_2138067 ?auto_2138075 ) ( ON ?auto_2138067 ?auto_2138073 ) ( CLEAR ?auto_2138067 ) ( not ( = ?auto_2138070 ?auto_2138073 ) ) ( not ( = ?auto_2138067 ?auto_2138073 ) ) ( not ( = ?auto_2138069 ?auto_2138073 ) ) ( SURFACE-AT ?auto_2138069 ?auto_2138074 ) ( CLEAR ?auto_2138069 ) ( IS-CRATE ?auto_2138070 ) ( AVAILABLE ?auto_2138072 ) ( TRUCK-AT ?auto_2138076 ?auto_2138075 ) ( AVAILABLE ?auto_2138071 ) ( SURFACE-AT ?auto_2138070 ?auto_2138075 ) ( ON ?auto_2138070 ?auto_2138077 ) ( CLEAR ?auto_2138070 ) ( not ( = ?auto_2138070 ?auto_2138077 ) ) ( not ( = ?auto_2138067 ?auto_2138077 ) ) ( not ( = ?auto_2138069 ?auto_2138077 ) ) ( not ( = ?auto_2138073 ?auto_2138077 ) ) ( ON ?auto_2138069 ?auto_2138068 ) ( not ( = ?auto_2138068 ?auto_2138069 ) ) ( not ( = ?auto_2138068 ?auto_2138070 ) ) ( not ( = ?auto_2138068 ?auto_2138067 ) ) ( not ( = ?auto_2138068 ?auto_2138073 ) ) ( not ( = ?auto_2138068 ?auto_2138077 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2138069 ?auto_2138070 ?auto_2138067 )
      ( MAKE-3CRATE-VERIFY ?auto_2138068 ?auto_2138069 ?auto_2138070 ?auto_2138067 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2138079 - SURFACE
      ?auto_2138080 - SURFACE
      ?auto_2138081 - SURFACE
      ?auto_2138078 - SURFACE
      ?auto_2138082 - SURFACE
    )
    :vars
    (
      ?auto_2138084 - HOIST
      ?auto_2138086 - PLACE
      ?auto_2138087 - PLACE
      ?auto_2138083 - HOIST
      ?auto_2138085 - SURFACE
      ?auto_2138088 - TRUCK
      ?auto_2138089 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2138084 ?auto_2138086 ) ( IS-CRATE ?auto_2138082 ) ( not ( = ?auto_2138078 ?auto_2138082 ) ) ( not ( = ?auto_2138081 ?auto_2138078 ) ) ( not ( = ?auto_2138081 ?auto_2138082 ) ) ( not ( = ?auto_2138087 ?auto_2138086 ) ) ( HOIST-AT ?auto_2138083 ?auto_2138087 ) ( not ( = ?auto_2138084 ?auto_2138083 ) ) ( SURFACE-AT ?auto_2138082 ?auto_2138087 ) ( ON ?auto_2138082 ?auto_2138085 ) ( CLEAR ?auto_2138082 ) ( not ( = ?auto_2138078 ?auto_2138085 ) ) ( not ( = ?auto_2138082 ?auto_2138085 ) ) ( not ( = ?auto_2138081 ?auto_2138085 ) ) ( SURFACE-AT ?auto_2138081 ?auto_2138086 ) ( CLEAR ?auto_2138081 ) ( IS-CRATE ?auto_2138078 ) ( AVAILABLE ?auto_2138084 ) ( TRUCK-AT ?auto_2138088 ?auto_2138087 ) ( AVAILABLE ?auto_2138083 ) ( SURFACE-AT ?auto_2138078 ?auto_2138087 ) ( ON ?auto_2138078 ?auto_2138089 ) ( CLEAR ?auto_2138078 ) ( not ( = ?auto_2138078 ?auto_2138089 ) ) ( not ( = ?auto_2138082 ?auto_2138089 ) ) ( not ( = ?auto_2138081 ?auto_2138089 ) ) ( not ( = ?auto_2138085 ?auto_2138089 ) ) ( ON ?auto_2138080 ?auto_2138079 ) ( ON ?auto_2138081 ?auto_2138080 ) ( not ( = ?auto_2138079 ?auto_2138080 ) ) ( not ( = ?auto_2138079 ?auto_2138081 ) ) ( not ( = ?auto_2138079 ?auto_2138078 ) ) ( not ( = ?auto_2138079 ?auto_2138082 ) ) ( not ( = ?auto_2138079 ?auto_2138085 ) ) ( not ( = ?auto_2138079 ?auto_2138089 ) ) ( not ( = ?auto_2138080 ?auto_2138081 ) ) ( not ( = ?auto_2138080 ?auto_2138078 ) ) ( not ( = ?auto_2138080 ?auto_2138082 ) ) ( not ( = ?auto_2138080 ?auto_2138085 ) ) ( not ( = ?auto_2138080 ?auto_2138089 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2138081 ?auto_2138078 ?auto_2138082 )
      ( MAKE-4CRATE-VERIFY ?auto_2138079 ?auto_2138080 ?auto_2138081 ?auto_2138078 ?auto_2138082 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2138091 - SURFACE
      ?auto_2138092 - SURFACE
      ?auto_2138093 - SURFACE
      ?auto_2138090 - SURFACE
      ?auto_2138094 - SURFACE
      ?auto_2138095 - SURFACE
    )
    :vars
    (
      ?auto_2138097 - HOIST
      ?auto_2138099 - PLACE
      ?auto_2138100 - PLACE
      ?auto_2138096 - HOIST
      ?auto_2138098 - SURFACE
      ?auto_2138101 - TRUCK
      ?auto_2138102 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2138097 ?auto_2138099 ) ( IS-CRATE ?auto_2138095 ) ( not ( = ?auto_2138094 ?auto_2138095 ) ) ( not ( = ?auto_2138090 ?auto_2138094 ) ) ( not ( = ?auto_2138090 ?auto_2138095 ) ) ( not ( = ?auto_2138100 ?auto_2138099 ) ) ( HOIST-AT ?auto_2138096 ?auto_2138100 ) ( not ( = ?auto_2138097 ?auto_2138096 ) ) ( SURFACE-AT ?auto_2138095 ?auto_2138100 ) ( ON ?auto_2138095 ?auto_2138098 ) ( CLEAR ?auto_2138095 ) ( not ( = ?auto_2138094 ?auto_2138098 ) ) ( not ( = ?auto_2138095 ?auto_2138098 ) ) ( not ( = ?auto_2138090 ?auto_2138098 ) ) ( SURFACE-AT ?auto_2138090 ?auto_2138099 ) ( CLEAR ?auto_2138090 ) ( IS-CRATE ?auto_2138094 ) ( AVAILABLE ?auto_2138097 ) ( TRUCK-AT ?auto_2138101 ?auto_2138100 ) ( AVAILABLE ?auto_2138096 ) ( SURFACE-AT ?auto_2138094 ?auto_2138100 ) ( ON ?auto_2138094 ?auto_2138102 ) ( CLEAR ?auto_2138094 ) ( not ( = ?auto_2138094 ?auto_2138102 ) ) ( not ( = ?auto_2138095 ?auto_2138102 ) ) ( not ( = ?auto_2138090 ?auto_2138102 ) ) ( not ( = ?auto_2138098 ?auto_2138102 ) ) ( ON ?auto_2138092 ?auto_2138091 ) ( ON ?auto_2138093 ?auto_2138092 ) ( ON ?auto_2138090 ?auto_2138093 ) ( not ( = ?auto_2138091 ?auto_2138092 ) ) ( not ( = ?auto_2138091 ?auto_2138093 ) ) ( not ( = ?auto_2138091 ?auto_2138090 ) ) ( not ( = ?auto_2138091 ?auto_2138094 ) ) ( not ( = ?auto_2138091 ?auto_2138095 ) ) ( not ( = ?auto_2138091 ?auto_2138098 ) ) ( not ( = ?auto_2138091 ?auto_2138102 ) ) ( not ( = ?auto_2138092 ?auto_2138093 ) ) ( not ( = ?auto_2138092 ?auto_2138090 ) ) ( not ( = ?auto_2138092 ?auto_2138094 ) ) ( not ( = ?auto_2138092 ?auto_2138095 ) ) ( not ( = ?auto_2138092 ?auto_2138098 ) ) ( not ( = ?auto_2138092 ?auto_2138102 ) ) ( not ( = ?auto_2138093 ?auto_2138090 ) ) ( not ( = ?auto_2138093 ?auto_2138094 ) ) ( not ( = ?auto_2138093 ?auto_2138095 ) ) ( not ( = ?auto_2138093 ?auto_2138098 ) ) ( not ( = ?auto_2138093 ?auto_2138102 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2138090 ?auto_2138094 ?auto_2138095 )
      ( MAKE-5CRATE-VERIFY ?auto_2138091 ?auto_2138092 ?auto_2138093 ?auto_2138090 ?auto_2138094 ?auto_2138095 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2138104 - SURFACE
      ?auto_2138105 - SURFACE
      ?auto_2138106 - SURFACE
      ?auto_2138103 - SURFACE
      ?auto_2138107 - SURFACE
      ?auto_2138109 - SURFACE
      ?auto_2138108 - SURFACE
    )
    :vars
    (
      ?auto_2138111 - HOIST
      ?auto_2138113 - PLACE
      ?auto_2138114 - PLACE
      ?auto_2138110 - HOIST
      ?auto_2138112 - SURFACE
      ?auto_2138115 - TRUCK
      ?auto_2138116 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2138111 ?auto_2138113 ) ( IS-CRATE ?auto_2138108 ) ( not ( = ?auto_2138109 ?auto_2138108 ) ) ( not ( = ?auto_2138107 ?auto_2138109 ) ) ( not ( = ?auto_2138107 ?auto_2138108 ) ) ( not ( = ?auto_2138114 ?auto_2138113 ) ) ( HOIST-AT ?auto_2138110 ?auto_2138114 ) ( not ( = ?auto_2138111 ?auto_2138110 ) ) ( SURFACE-AT ?auto_2138108 ?auto_2138114 ) ( ON ?auto_2138108 ?auto_2138112 ) ( CLEAR ?auto_2138108 ) ( not ( = ?auto_2138109 ?auto_2138112 ) ) ( not ( = ?auto_2138108 ?auto_2138112 ) ) ( not ( = ?auto_2138107 ?auto_2138112 ) ) ( SURFACE-AT ?auto_2138107 ?auto_2138113 ) ( CLEAR ?auto_2138107 ) ( IS-CRATE ?auto_2138109 ) ( AVAILABLE ?auto_2138111 ) ( TRUCK-AT ?auto_2138115 ?auto_2138114 ) ( AVAILABLE ?auto_2138110 ) ( SURFACE-AT ?auto_2138109 ?auto_2138114 ) ( ON ?auto_2138109 ?auto_2138116 ) ( CLEAR ?auto_2138109 ) ( not ( = ?auto_2138109 ?auto_2138116 ) ) ( not ( = ?auto_2138108 ?auto_2138116 ) ) ( not ( = ?auto_2138107 ?auto_2138116 ) ) ( not ( = ?auto_2138112 ?auto_2138116 ) ) ( ON ?auto_2138105 ?auto_2138104 ) ( ON ?auto_2138106 ?auto_2138105 ) ( ON ?auto_2138103 ?auto_2138106 ) ( ON ?auto_2138107 ?auto_2138103 ) ( not ( = ?auto_2138104 ?auto_2138105 ) ) ( not ( = ?auto_2138104 ?auto_2138106 ) ) ( not ( = ?auto_2138104 ?auto_2138103 ) ) ( not ( = ?auto_2138104 ?auto_2138107 ) ) ( not ( = ?auto_2138104 ?auto_2138109 ) ) ( not ( = ?auto_2138104 ?auto_2138108 ) ) ( not ( = ?auto_2138104 ?auto_2138112 ) ) ( not ( = ?auto_2138104 ?auto_2138116 ) ) ( not ( = ?auto_2138105 ?auto_2138106 ) ) ( not ( = ?auto_2138105 ?auto_2138103 ) ) ( not ( = ?auto_2138105 ?auto_2138107 ) ) ( not ( = ?auto_2138105 ?auto_2138109 ) ) ( not ( = ?auto_2138105 ?auto_2138108 ) ) ( not ( = ?auto_2138105 ?auto_2138112 ) ) ( not ( = ?auto_2138105 ?auto_2138116 ) ) ( not ( = ?auto_2138106 ?auto_2138103 ) ) ( not ( = ?auto_2138106 ?auto_2138107 ) ) ( not ( = ?auto_2138106 ?auto_2138109 ) ) ( not ( = ?auto_2138106 ?auto_2138108 ) ) ( not ( = ?auto_2138106 ?auto_2138112 ) ) ( not ( = ?auto_2138106 ?auto_2138116 ) ) ( not ( = ?auto_2138103 ?auto_2138107 ) ) ( not ( = ?auto_2138103 ?auto_2138109 ) ) ( not ( = ?auto_2138103 ?auto_2138108 ) ) ( not ( = ?auto_2138103 ?auto_2138112 ) ) ( not ( = ?auto_2138103 ?auto_2138116 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2138107 ?auto_2138109 ?auto_2138108 )
      ( MAKE-6CRATE-VERIFY ?auto_2138104 ?auto_2138105 ?auto_2138106 ?auto_2138103 ?auto_2138107 ?auto_2138109 ?auto_2138108 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2138118 - SURFACE
      ?auto_2138119 - SURFACE
      ?auto_2138120 - SURFACE
      ?auto_2138117 - SURFACE
      ?auto_2138121 - SURFACE
      ?auto_2138123 - SURFACE
      ?auto_2138122 - SURFACE
      ?auto_2138124 - SURFACE
    )
    :vars
    (
      ?auto_2138126 - HOIST
      ?auto_2138128 - PLACE
      ?auto_2138129 - PLACE
      ?auto_2138125 - HOIST
      ?auto_2138127 - SURFACE
      ?auto_2138130 - TRUCK
      ?auto_2138131 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2138126 ?auto_2138128 ) ( IS-CRATE ?auto_2138124 ) ( not ( = ?auto_2138122 ?auto_2138124 ) ) ( not ( = ?auto_2138123 ?auto_2138122 ) ) ( not ( = ?auto_2138123 ?auto_2138124 ) ) ( not ( = ?auto_2138129 ?auto_2138128 ) ) ( HOIST-AT ?auto_2138125 ?auto_2138129 ) ( not ( = ?auto_2138126 ?auto_2138125 ) ) ( SURFACE-AT ?auto_2138124 ?auto_2138129 ) ( ON ?auto_2138124 ?auto_2138127 ) ( CLEAR ?auto_2138124 ) ( not ( = ?auto_2138122 ?auto_2138127 ) ) ( not ( = ?auto_2138124 ?auto_2138127 ) ) ( not ( = ?auto_2138123 ?auto_2138127 ) ) ( SURFACE-AT ?auto_2138123 ?auto_2138128 ) ( CLEAR ?auto_2138123 ) ( IS-CRATE ?auto_2138122 ) ( AVAILABLE ?auto_2138126 ) ( TRUCK-AT ?auto_2138130 ?auto_2138129 ) ( AVAILABLE ?auto_2138125 ) ( SURFACE-AT ?auto_2138122 ?auto_2138129 ) ( ON ?auto_2138122 ?auto_2138131 ) ( CLEAR ?auto_2138122 ) ( not ( = ?auto_2138122 ?auto_2138131 ) ) ( not ( = ?auto_2138124 ?auto_2138131 ) ) ( not ( = ?auto_2138123 ?auto_2138131 ) ) ( not ( = ?auto_2138127 ?auto_2138131 ) ) ( ON ?auto_2138119 ?auto_2138118 ) ( ON ?auto_2138120 ?auto_2138119 ) ( ON ?auto_2138117 ?auto_2138120 ) ( ON ?auto_2138121 ?auto_2138117 ) ( ON ?auto_2138123 ?auto_2138121 ) ( not ( = ?auto_2138118 ?auto_2138119 ) ) ( not ( = ?auto_2138118 ?auto_2138120 ) ) ( not ( = ?auto_2138118 ?auto_2138117 ) ) ( not ( = ?auto_2138118 ?auto_2138121 ) ) ( not ( = ?auto_2138118 ?auto_2138123 ) ) ( not ( = ?auto_2138118 ?auto_2138122 ) ) ( not ( = ?auto_2138118 ?auto_2138124 ) ) ( not ( = ?auto_2138118 ?auto_2138127 ) ) ( not ( = ?auto_2138118 ?auto_2138131 ) ) ( not ( = ?auto_2138119 ?auto_2138120 ) ) ( not ( = ?auto_2138119 ?auto_2138117 ) ) ( not ( = ?auto_2138119 ?auto_2138121 ) ) ( not ( = ?auto_2138119 ?auto_2138123 ) ) ( not ( = ?auto_2138119 ?auto_2138122 ) ) ( not ( = ?auto_2138119 ?auto_2138124 ) ) ( not ( = ?auto_2138119 ?auto_2138127 ) ) ( not ( = ?auto_2138119 ?auto_2138131 ) ) ( not ( = ?auto_2138120 ?auto_2138117 ) ) ( not ( = ?auto_2138120 ?auto_2138121 ) ) ( not ( = ?auto_2138120 ?auto_2138123 ) ) ( not ( = ?auto_2138120 ?auto_2138122 ) ) ( not ( = ?auto_2138120 ?auto_2138124 ) ) ( not ( = ?auto_2138120 ?auto_2138127 ) ) ( not ( = ?auto_2138120 ?auto_2138131 ) ) ( not ( = ?auto_2138117 ?auto_2138121 ) ) ( not ( = ?auto_2138117 ?auto_2138123 ) ) ( not ( = ?auto_2138117 ?auto_2138122 ) ) ( not ( = ?auto_2138117 ?auto_2138124 ) ) ( not ( = ?auto_2138117 ?auto_2138127 ) ) ( not ( = ?auto_2138117 ?auto_2138131 ) ) ( not ( = ?auto_2138121 ?auto_2138123 ) ) ( not ( = ?auto_2138121 ?auto_2138122 ) ) ( not ( = ?auto_2138121 ?auto_2138124 ) ) ( not ( = ?auto_2138121 ?auto_2138127 ) ) ( not ( = ?auto_2138121 ?auto_2138131 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2138123 ?auto_2138122 ?auto_2138124 )
      ( MAKE-7CRATE-VERIFY ?auto_2138118 ?auto_2138119 ?auto_2138120 ?auto_2138117 ?auto_2138121 ?auto_2138123 ?auto_2138122 ?auto_2138124 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2138133 - SURFACE
      ?auto_2138134 - SURFACE
      ?auto_2138135 - SURFACE
      ?auto_2138132 - SURFACE
      ?auto_2138136 - SURFACE
      ?auto_2138138 - SURFACE
      ?auto_2138137 - SURFACE
      ?auto_2138139 - SURFACE
      ?auto_2138140 - SURFACE
    )
    :vars
    (
      ?auto_2138142 - HOIST
      ?auto_2138144 - PLACE
      ?auto_2138145 - PLACE
      ?auto_2138141 - HOIST
      ?auto_2138143 - SURFACE
      ?auto_2138146 - TRUCK
      ?auto_2138147 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2138142 ?auto_2138144 ) ( IS-CRATE ?auto_2138140 ) ( not ( = ?auto_2138139 ?auto_2138140 ) ) ( not ( = ?auto_2138137 ?auto_2138139 ) ) ( not ( = ?auto_2138137 ?auto_2138140 ) ) ( not ( = ?auto_2138145 ?auto_2138144 ) ) ( HOIST-AT ?auto_2138141 ?auto_2138145 ) ( not ( = ?auto_2138142 ?auto_2138141 ) ) ( SURFACE-AT ?auto_2138140 ?auto_2138145 ) ( ON ?auto_2138140 ?auto_2138143 ) ( CLEAR ?auto_2138140 ) ( not ( = ?auto_2138139 ?auto_2138143 ) ) ( not ( = ?auto_2138140 ?auto_2138143 ) ) ( not ( = ?auto_2138137 ?auto_2138143 ) ) ( SURFACE-AT ?auto_2138137 ?auto_2138144 ) ( CLEAR ?auto_2138137 ) ( IS-CRATE ?auto_2138139 ) ( AVAILABLE ?auto_2138142 ) ( TRUCK-AT ?auto_2138146 ?auto_2138145 ) ( AVAILABLE ?auto_2138141 ) ( SURFACE-AT ?auto_2138139 ?auto_2138145 ) ( ON ?auto_2138139 ?auto_2138147 ) ( CLEAR ?auto_2138139 ) ( not ( = ?auto_2138139 ?auto_2138147 ) ) ( not ( = ?auto_2138140 ?auto_2138147 ) ) ( not ( = ?auto_2138137 ?auto_2138147 ) ) ( not ( = ?auto_2138143 ?auto_2138147 ) ) ( ON ?auto_2138134 ?auto_2138133 ) ( ON ?auto_2138135 ?auto_2138134 ) ( ON ?auto_2138132 ?auto_2138135 ) ( ON ?auto_2138136 ?auto_2138132 ) ( ON ?auto_2138138 ?auto_2138136 ) ( ON ?auto_2138137 ?auto_2138138 ) ( not ( = ?auto_2138133 ?auto_2138134 ) ) ( not ( = ?auto_2138133 ?auto_2138135 ) ) ( not ( = ?auto_2138133 ?auto_2138132 ) ) ( not ( = ?auto_2138133 ?auto_2138136 ) ) ( not ( = ?auto_2138133 ?auto_2138138 ) ) ( not ( = ?auto_2138133 ?auto_2138137 ) ) ( not ( = ?auto_2138133 ?auto_2138139 ) ) ( not ( = ?auto_2138133 ?auto_2138140 ) ) ( not ( = ?auto_2138133 ?auto_2138143 ) ) ( not ( = ?auto_2138133 ?auto_2138147 ) ) ( not ( = ?auto_2138134 ?auto_2138135 ) ) ( not ( = ?auto_2138134 ?auto_2138132 ) ) ( not ( = ?auto_2138134 ?auto_2138136 ) ) ( not ( = ?auto_2138134 ?auto_2138138 ) ) ( not ( = ?auto_2138134 ?auto_2138137 ) ) ( not ( = ?auto_2138134 ?auto_2138139 ) ) ( not ( = ?auto_2138134 ?auto_2138140 ) ) ( not ( = ?auto_2138134 ?auto_2138143 ) ) ( not ( = ?auto_2138134 ?auto_2138147 ) ) ( not ( = ?auto_2138135 ?auto_2138132 ) ) ( not ( = ?auto_2138135 ?auto_2138136 ) ) ( not ( = ?auto_2138135 ?auto_2138138 ) ) ( not ( = ?auto_2138135 ?auto_2138137 ) ) ( not ( = ?auto_2138135 ?auto_2138139 ) ) ( not ( = ?auto_2138135 ?auto_2138140 ) ) ( not ( = ?auto_2138135 ?auto_2138143 ) ) ( not ( = ?auto_2138135 ?auto_2138147 ) ) ( not ( = ?auto_2138132 ?auto_2138136 ) ) ( not ( = ?auto_2138132 ?auto_2138138 ) ) ( not ( = ?auto_2138132 ?auto_2138137 ) ) ( not ( = ?auto_2138132 ?auto_2138139 ) ) ( not ( = ?auto_2138132 ?auto_2138140 ) ) ( not ( = ?auto_2138132 ?auto_2138143 ) ) ( not ( = ?auto_2138132 ?auto_2138147 ) ) ( not ( = ?auto_2138136 ?auto_2138138 ) ) ( not ( = ?auto_2138136 ?auto_2138137 ) ) ( not ( = ?auto_2138136 ?auto_2138139 ) ) ( not ( = ?auto_2138136 ?auto_2138140 ) ) ( not ( = ?auto_2138136 ?auto_2138143 ) ) ( not ( = ?auto_2138136 ?auto_2138147 ) ) ( not ( = ?auto_2138138 ?auto_2138137 ) ) ( not ( = ?auto_2138138 ?auto_2138139 ) ) ( not ( = ?auto_2138138 ?auto_2138140 ) ) ( not ( = ?auto_2138138 ?auto_2138143 ) ) ( not ( = ?auto_2138138 ?auto_2138147 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2138137 ?auto_2138139 ?auto_2138140 )
      ( MAKE-8CRATE-VERIFY ?auto_2138133 ?auto_2138134 ?auto_2138135 ?auto_2138132 ?auto_2138136 ?auto_2138138 ?auto_2138137 ?auto_2138139 ?auto_2138140 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2138148 - SURFACE
      ?auto_2138149 - SURFACE
    )
    :vars
    (
      ?auto_2138151 - HOIST
      ?auto_2138153 - PLACE
      ?auto_2138154 - SURFACE
      ?auto_2138155 - PLACE
      ?auto_2138150 - HOIST
      ?auto_2138152 - SURFACE
      ?auto_2138157 - SURFACE
      ?auto_2138156 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2138151 ?auto_2138153 ) ( IS-CRATE ?auto_2138149 ) ( not ( = ?auto_2138148 ?auto_2138149 ) ) ( not ( = ?auto_2138154 ?auto_2138148 ) ) ( not ( = ?auto_2138154 ?auto_2138149 ) ) ( not ( = ?auto_2138155 ?auto_2138153 ) ) ( HOIST-AT ?auto_2138150 ?auto_2138155 ) ( not ( = ?auto_2138151 ?auto_2138150 ) ) ( SURFACE-AT ?auto_2138149 ?auto_2138155 ) ( ON ?auto_2138149 ?auto_2138152 ) ( CLEAR ?auto_2138149 ) ( not ( = ?auto_2138148 ?auto_2138152 ) ) ( not ( = ?auto_2138149 ?auto_2138152 ) ) ( not ( = ?auto_2138154 ?auto_2138152 ) ) ( SURFACE-AT ?auto_2138154 ?auto_2138153 ) ( CLEAR ?auto_2138154 ) ( IS-CRATE ?auto_2138148 ) ( AVAILABLE ?auto_2138151 ) ( AVAILABLE ?auto_2138150 ) ( SURFACE-AT ?auto_2138148 ?auto_2138155 ) ( ON ?auto_2138148 ?auto_2138157 ) ( CLEAR ?auto_2138148 ) ( not ( = ?auto_2138148 ?auto_2138157 ) ) ( not ( = ?auto_2138149 ?auto_2138157 ) ) ( not ( = ?auto_2138154 ?auto_2138157 ) ) ( not ( = ?auto_2138152 ?auto_2138157 ) ) ( TRUCK-AT ?auto_2138156 ?auto_2138153 ) )
    :subtasks
    ( ( !DRIVE ?auto_2138156 ?auto_2138153 ?auto_2138155 )
      ( MAKE-2CRATE ?auto_2138154 ?auto_2138148 ?auto_2138149 )
      ( MAKE-1CRATE-VERIFY ?auto_2138148 ?auto_2138149 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2138158 - SURFACE
      ?auto_2138159 - SURFACE
      ?auto_2138160 - SURFACE
    )
    :vars
    (
      ?auto_2138161 - HOIST
      ?auto_2138162 - PLACE
      ?auto_2138164 - PLACE
      ?auto_2138166 - HOIST
      ?auto_2138163 - SURFACE
      ?auto_2138167 - SURFACE
      ?auto_2138165 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2138161 ?auto_2138162 ) ( IS-CRATE ?auto_2138160 ) ( not ( = ?auto_2138159 ?auto_2138160 ) ) ( not ( = ?auto_2138158 ?auto_2138159 ) ) ( not ( = ?auto_2138158 ?auto_2138160 ) ) ( not ( = ?auto_2138164 ?auto_2138162 ) ) ( HOIST-AT ?auto_2138166 ?auto_2138164 ) ( not ( = ?auto_2138161 ?auto_2138166 ) ) ( SURFACE-AT ?auto_2138160 ?auto_2138164 ) ( ON ?auto_2138160 ?auto_2138163 ) ( CLEAR ?auto_2138160 ) ( not ( = ?auto_2138159 ?auto_2138163 ) ) ( not ( = ?auto_2138160 ?auto_2138163 ) ) ( not ( = ?auto_2138158 ?auto_2138163 ) ) ( SURFACE-AT ?auto_2138158 ?auto_2138162 ) ( CLEAR ?auto_2138158 ) ( IS-CRATE ?auto_2138159 ) ( AVAILABLE ?auto_2138161 ) ( AVAILABLE ?auto_2138166 ) ( SURFACE-AT ?auto_2138159 ?auto_2138164 ) ( ON ?auto_2138159 ?auto_2138167 ) ( CLEAR ?auto_2138159 ) ( not ( = ?auto_2138159 ?auto_2138167 ) ) ( not ( = ?auto_2138160 ?auto_2138167 ) ) ( not ( = ?auto_2138158 ?auto_2138167 ) ) ( not ( = ?auto_2138163 ?auto_2138167 ) ) ( TRUCK-AT ?auto_2138165 ?auto_2138162 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2138159 ?auto_2138160 )
      ( MAKE-2CRATE-VERIFY ?auto_2138158 ?auto_2138159 ?auto_2138160 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2138169 - SURFACE
      ?auto_2138170 - SURFACE
      ?auto_2138171 - SURFACE
      ?auto_2138168 - SURFACE
    )
    :vars
    (
      ?auto_2138176 - HOIST
      ?auto_2138173 - PLACE
      ?auto_2138174 - PLACE
      ?auto_2138172 - HOIST
      ?auto_2138178 - SURFACE
      ?auto_2138177 - SURFACE
      ?auto_2138175 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2138176 ?auto_2138173 ) ( IS-CRATE ?auto_2138168 ) ( not ( = ?auto_2138171 ?auto_2138168 ) ) ( not ( = ?auto_2138170 ?auto_2138171 ) ) ( not ( = ?auto_2138170 ?auto_2138168 ) ) ( not ( = ?auto_2138174 ?auto_2138173 ) ) ( HOIST-AT ?auto_2138172 ?auto_2138174 ) ( not ( = ?auto_2138176 ?auto_2138172 ) ) ( SURFACE-AT ?auto_2138168 ?auto_2138174 ) ( ON ?auto_2138168 ?auto_2138178 ) ( CLEAR ?auto_2138168 ) ( not ( = ?auto_2138171 ?auto_2138178 ) ) ( not ( = ?auto_2138168 ?auto_2138178 ) ) ( not ( = ?auto_2138170 ?auto_2138178 ) ) ( SURFACE-AT ?auto_2138170 ?auto_2138173 ) ( CLEAR ?auto_2138170 ) ( IS-CRATE ?auto_2138171 ) ( AVAILABLE ?auto_2138176 ) ( AVAILABLE ?auto_2138172 ) ( SURFACE-AT ?auto_2138171 ?auto_2138174 ) ( ON ?auto_2138171 ?auto_2138177 ) ( CLEAR ?auto_2138171 ) ( not ( = ?auto_2138171 ?auto_2138177 ) ) ( not ( = ?auto_2138168 ?auto_2138177 ) ) ( not ( = ?auto_2138170 ?auto_2138177 ) ) ( not ( = ?auto_2138178 ?auto_2138177 ) ) ( TRUCK-AT ?auto_2138175 ?auto_2138173 ) ( ON ?auto_2138170 ?auto_2138169 ) ( not ( = ?auto_2138169 ?auto_2138170 ) ) ( not ( = ?auto_2138169 ?auto_2138171 ) ) ( not ( = ?auto_2138169 ?auto_2138168 ) ) ( not ( = ?auto_2138169 ?auto_2138178 ) ) ( not ( = ?auto_2138169 ?auto_2138177 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2138170 ?auto_2138171 ?auto_2138168 )
      ( MAKE-3CRATE-VERIFY ?auto_2138169 ?auto_2138170 ?auto_2138171 ?auto_2138168 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2138180 - SURFACE
      ?auto_2138181 - SURFACE
      ?auto_2138182 - SURFACE
      ?auto_2138179 - SURFACE
      ?auto_2138183 - SURFACE
    )
    :vars
    (
      ?auto_2138188 - HOIST
      ?auto_2138185 - PLACE
      ?auto_2138186 - PLACE
      ?auto_2138184 - HOIST
      ?auto_2138190 - SURFACE
      ?auto_2138189 - SURFACE
      ?auto_2138187 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2138188 ?auto_2138185 ) ( IS-CRATE ?auto_2138183 ) ( not ( = ?auto_2138179 ?auto_2138183 ) ) ( not ( = ?auto_2138182 ?auto_2138179 ) ) ( not ( = ?auto_2138182 ?auto_2138183 ) ) ( not ( = ?auto_2138186 ?auto_2138185 ) ) ( HOIST-AT ?auto_2138184 ?auto_2138186 ) ( not ( = ?auto_2138188 ?auto_2138184 ) ) ( SURFACE-AT ?auto_2138183 ?auto_2138186 ) ( ON ?auto_2138183 ?auto_2138190 ) ( CLEAR ?auto_2138183 ) ( not ( = ?auto_2138179 ?auto_2138190 ) ) ( not ( = ?auto_2138183 ?auto_2138190 ) ) ( not ( = ?auto_2138182 ?auto_2138190 ) ) ( SURFACE-AT ?auto_2138182 ?auto_2138185 ) ( CLEAR ?auto_2138182 ) ( IS-CRATE ?auto_2138179 ) ( AVAILABLE ?auto_2138188 ) ( AVAILABLE ?auto_2138184 ) ( SURFACE-AT ?auto_2138179 ?auto_2138186 ) ( ON ?auto_2138179 ?auto_2138189 ) ( CLEAR ?auto_2138179 ) ( not ( = ?auto_2138179 ?auto_2138189 ) ) ( not ( = ?auto_2138183 ?auto_2138189 ) ) ( not ( = ?auto_2138182 ?auto_2138189 ) ) ( not ( = ?auto_2138190 ?auto_2138189 ) ) ( TRUCK-AT ?auto_2138187 ?auto_2138185 ) ( ON ?auto_2138181 ?auto_2138180 ) ( ON ?auto_2138182 ?auto_2138181 ) ( not ( = ?auto_2138180 ?auto_2138181 ) ) ( not ( = ?auto_2138180 ?auto_2138182 ) ) ( not ( = ?auto_2138180 ?auto_2138179 ) ) ( not ( = ?auto_2138180 ?auto_2138183 ) ) ( not ( = ?auto_2138180 ?auto_2138190 ) ) ( not ( = ?auto_2138180 ?auto_2138189 ) ) ( not ( = ?auto_2138181 ?auto_2138182 ) ) ( not ( = ?auto_2138181 ?auto_2138179 ) ) ( not ( = ?auto_2138181 ?auto_2138183 ) ) ( not ( = ?auto_2138181 ?auto_2138190 ) ) ( not ( = ?auto_2138181 ?auto_2138189 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2138182 ?auto_2138179 ?auto_2138183 )
      ( MAKE-4CRATE-VERIFY ?auto_2138180 ?auto_2138181 ?auto_2138182 ?auto_2138179 ?auto_2138183 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2138192 - SURFACE
      ?auto_2138193 - SURFACE
      ?auto_2138194 - SURFACE
      ?auto_2138191 - SURFACE
      ?auto_2138195 - SURFACE
      ?auto_2138196 - SURFACE
    )
    :vars
    (
      ?auto_2138201 - HOIST
      ?auto_2138198 - PLACE
      ?auto_2138199 - PLACE
      ?auto_2138197 - HOIST
      ?auto_2138203 - SURFACE
      ?auto_2138202 - SURFACE
      ?auto_2138200 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2138201 ?auto_2138198 ) ( IS-CRATE ?auto_2138196 ) ( not ( = ?auto_2138195 ?auto_2138196 ) ) ( not ( = ?auto_2138191 ?auto_2138195 ) ) ( not ( = ?auto_2138191 ?auto_2138196 ) ) ( not ( = ?auto_2138199 ?auto_2138198 ) ) ( HOIST-AT ?auto_2138197 ?auto_2138199 ) ( not ( = ?auto_2138201 ?auto_2138197 ) ) ( SURFACE-AT ?auto_2138196 ?auto_2138199 ) ( ON ?auto_2138196 ?auto_2138203 ) ( CLEAR ?auto_2138196 ) ( not ( = ?auto_2138195 ?auto_2138203 ) ) ( not ( = ?auto_2138196 ?auto_2138203 ) ) ( not ( = ?auto_2138191 ?auto_2138203 ) ) ( SURFACE-AT ?auto_2138191 ?auto_2138198 ) ( CLEAR ?auto_2138191 ) ( IS-CRATE ?auto_2138195 ) ( AVAILABLE ?auto_2138201 ) ( AVAILABLE ?auto_2138197 ) ( SURFACE-AT ?auto_2138195 ?auto_2138199 ) ( ON ?auto_2138195 ?auto_2138202 ) ( CLEAR ?auto_2138195 ) ( not ( = ?auto_2138195 ?auto_2138202 ) ) ( not ( = ?auto_2138196 ?auto_2138202 ) ) ( not ( = ?auto_2138191 ?auto_2138202 ) ) ( not ( = ?auto_2138203 ?auto_2138202 ) ) ( TRUCK-AT ?auto_2138200 ?auto_2138198 ) ( ON ?auto_2138193 ?auto_2138192 ) ( ON ?auto_2138194 ?auto_2138193 ) ( ON ?auto_2138191 ?auto_2138194 ) ( not ( = ?auto_2138192 ?auto_2138193 ) ) ( not ( = ?auto_2138192 ?auto_2138194 ) ) ( not ( = ?auto_2138192 ?auto_2138191 ) ) ( not ( = ?auto_2138192 ?auto_2138195 ) ) ( not ( = ?auto_2138192 ?auto_2138196 ) ) ( not ( = ?auto_2138192 ?auto_2138203 ) ) ( not ( = ?auto_2138192 ?auto_2138202 ) ) ( not ( = ?auto_2138193 ?auto_2138194 ) ) ( not ( = ?auto_2138193 ?auto_2138191 ) ) ( not ( = ?auto_2138193 ?auto_2138195 ) ) ( not ( = ?auto_2138193 ?auto_2138196 ) ) ( not ( = ?auto_2138193 ?auto_2138203 ) ) ( not ( = ?auto_2138193 ?auto_2138202 ) ) ( not ( = ?auto_2138194 ?auto_2138191 ) ) ( not ( = ?auto_2138194 ?auto_2138195 ) ) ( not ( = ?auto_2138194 ?auto_2138196 ) ) ( not ( = ?auto_2138194 ?auto_2138203 ) ) ( not ( = ?auto_2138194 ?auto_2138202 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2138191 ?auto_2138195 ?auto_2138196 )
      ( MAKE-5CRATE-VERIFY ?auto_2138192 ?auto_2138193 ?auto_2138194 ?auto_2138191 ?auto_2138195 ?auto_2138196 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2138205 - SURFACE
      ?auto_2138206 - SURFACE
      ?auto_2138207 - SURFACE
      ?auto_2138204 - SURFACE
      ?auto_2138208 - SURFACE
      ?auto_2138210 - SURFACE
      ?auto_2138209 - SURFACE
    )
    :vars
    (
      ?auto_2138215 - HOIST
      ?auto_2138212 - PLACE
      ?auto_2138213 - PLACE
      ?auto_2138211 - HOIST
      ?auto_2138217 - SURFACE
      ?auto_2138216 - SURFACE
      ?auto_2138214 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2138215 ?auto_2138212 ) ( IS-CRATE ?auto_2138209 ) ( not ( = ?auto_2138210 ?auto_2138209 ) ) ( not ( = ?auto_2138208 ?auto_2138210 ) ) ( not ( = ?auto_2138208 ?auto_2138209 ) ) ( not ( = ?auto_2138213 ?auto_2138212 ) ) ( HOIST-AT ?auto_2138211 ?auto_2138213 ) ( not ( = ?auto_2138215 ?auto_2138211 ) ) ( SURFACE-AT ?auto_2138209 ?auto_2138213 ) ( ON ?auto_2138209 ?auto_2138217 ) ( CLEAR ?auto_2138209 ) ( not ( = ?auto_2138210 ?auto_2138217 ) ) ( not ( = ?auto_2138209 ?auto_2138217 ) ) ( not ( = ?auto_2138208 ?auto_2138217 ) ) ( SURFACE-AT ?auto_2138208 ?auto_2138212 ) ( CLEAR ?auto_2138208 ) ( IS-CRATE ?auto_2138210 ) ( AVAILABLE ?auto_2138215 ) ( AVAILABLE ?auto_2138211 ) ( SURFACE-AT ?auto_2138210 ?auto_2138213 ) ( ON ?auto_2138210 ?auto_2138216 ) ( CLEAR ?auto_2138210 ) ( not ( = ?auto_2138210 ?auto_2138216 ) ) ( not ( = ?auto_2138209 ?auto_2138216 ) ) ( not ( = ?auto_2138208 ?auto_2138216 ) ) ( not ( = ?auto_2138217 ?auto_2138216 ) ) ( TRUCK-AT ?auto_2138214 ?auto_2138212 ) ( ON ?auto_2138206 ?auto_2138205 ) ( ON ?auto_2138207 ?auto_2138206 ) ( ON ?auto_2138204 ?auto_2138207 ) ( ON ?auto_2138208 ?auto_2138204 ) ( not ( = ?auto_2138205 ?auto_2138206 ) ) ( not ( = ?auto_2138205 ?auto_2138207 ) ) ( not ( = ?auto_2138205 ?auto_2138204 ) ) ( not ( = ?auto_2138205 ?auto_2138208 ) ) ( not ( = ?auto_2138205 ?auto_2138210 ) ) ( not ( = ?auto_2138205 ?auto_2138209 ) ) ( not ( = ?auto_2138205 ?auto_2138217 ) ) ( not ( = ?auto_2138205 ?auto_2138216 ) ) ( not ( = ?auto_2138206 ?auto_2138207 ) ) ( not ( = ?auto_2138206 ?auto_2138204 ) ) ( not ( = ?auto_2138206 ?auto_2138208 ) ) ( not ( = ?auto_2138206 ?auto_2138210 ) ) ( not ( = ?auto_2138206 ?auto_2138209 ) ) ( not ( = ?auto_2138206 ?auto_2138217 ) ) ( not ( = ?auto_2138206 ?auto_2138216 ) ) ( not ( = ?auto_2138207 ?auto_2138204 ) ) ( not ( = ?auto_2138207 ?auto_2138208 ) ) ( not ( = ?auto_2138207 ?auto_2138210 ) ) ( not ( = ?auto_2138207 ?auto_2138209 ) ) ( not ( = ?auto_2138207 ?auto_2138217 ) ) ( not ( = ?auto_2138207 ?auto_2138216 ) ) ( not ( = ?auto_2138204 ?auto_2138208 ) ) ( not ( = ?auto_2138204 ?auto_2138210 ) ) ( not ( = ?auto_2138204 ?auto_2138209 ) ) ( not ( = ?auto_2138204 ?auto_2138217 ) ) ( not ( = ?auto_2138204 ?auto_2138216 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2138208 ?auto_2138210 ?auto_2138209 )
      ( MAKE-6CRATE-VERIFY ?auto_2138205 ?auto_2138206 ?auto_2138207 ?auto_2138204 ?auto_2138208 ?auto_2138210 ?auto_2138209 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2138219 - SURFACE
      ?auto_2138220 - SURFACE
      ?auto_2138221 - SURFACE
      ?auto_2138218 - SURFACE
      ?auto_2138222 - SURFACE
      ?auto_2138224 - SURFACE
      ?auto_2138223 - SURFACE
      ?auto_2138225 - SURFACE
    )
    :vars
    (
      ?auto_2138230 - HOIST
      ?auto_2138227 - PLACE
      ?auto_2138228 - PLACE
      ?auto_2138226 - HOIST
      ?auto_2138232 - SURFACE
      ?auto_2138231 - SURFACE
      ?auto_2138229 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2138230 ?auto_2138227 ) ( IS-CRATE ?auto_2138225 ) ( not ( = ?auto_2138223 ?auto_2138225 ) ) ( not ( = ?auto_2138224 ?auto_2138223 ) ) ( not ( = ?auto_2138224 ?auto_2138225 ) ) ( not ( = ?auto_2138228 ?auto_2138227 ) ) ( HOIST-AT ?auto_2138226 ?auto_2138228 ) ( not ( = ?auto_2138230 ?auto_2138226 ) ) ( SURFACE-AT ?auto_2138225 ?auto_2138228 ) ( ON ?auto_2138225 ?auto_2138232 ) ( CLEAR ?auto_2138225 ) ( not ( = ?auto_2138223 ?auto_2138232 ) ) ( not ( = ?auto_2138225 ?auto_2138232 ) ) ( not ( = ?auto_2138224 ?auto_2138232 ) ) ( SURFACE-AT ?auto_2138224 ?auto_2138227 ) ( CLEAR ?auto_2138224 ) ( IS-CRATE ?auto_2138223 ) ( AVAILABLE ?auto_2138230 ) ( AVAILABLE ?auto_2138226 ) ( SURFACE-AT ?auto_2138223 ?auto_2138228 ) ( ON ?auto_2138223 ?auto_2138231 ) ( CLEAR ?auto_2138223 ) ( not ( = ?auto_2138223 ?auto_2138231 ) ) ( not ( = ?auto_2138225 ?auto_2138231 ) ) ( not ( = ?auto_2138224 ?auto_2138231 ) ) ( not ( = ?auto_2138232 ?auto_2138231 ) ) ( TRUCK-AT ?auto_2138229 ?auto_2138227 ) ( ON ?auto_2138220 ?auto_2138219 ) ( ON ?auto_2138221 ?auto_2138220 ) ( ON ?auto_2138218 ?auto_2138221 ) ( ON ?auto_2138222 ?auto_2138218 ) ( ON ?auto_2138224 ?auto_2138222 ) ( not ( = ?auto_2138219 ?auto_2138220 ) ) ( not ( = ?auto_2138219 ?auto_2138221 ) ) ( not ( = ?auto_2138219 ?auto_2138218 ) ) ( not ( = ?auto_2138219 ?auto_2138222 ) ) ( not ( = ?auto_2138219 ?auto_2138224 ) ) ( not ( = ?auto_2138219 ?auto_2138223 ) ) ( not ( = ?auto_2138219 ?auto_2138225 ) ) ( not ( = ?auto_2138219 ?auto_2138232 ) ) ( not ( = ?auto_2138219 ?auto_2138231 ) ) ( not ( = ?auto_2138220 ?auto_2138221 ) ) ( not ( = ?auto_2138220 ?auto_2138218 ) ) ( not ( = ?auto_2138220 ?auto_2138222 ) ) ( not ( = ?auto_2138220 ?auto_2138224 ) ) ( not ( = ?auto_2138220 ?auto_2138223 ) ) ( not ( = ?auto_2138220 ?auto_2138225 ) ) ( not ( = ?auto_2138220 ?auto_2138232 ) ) ( not ( = ?auto_2138220 ?auto_2138231 ) ) ( not ( = ?auto_2138221 ?auto_2138218 ) ) ( not ( = ?auto_2138221 ?auto_2138222 ) ) ( not ( = ?auto_2138221 ?auto_2138224 ) ) ( not ( = ?auto_2138221 ?auto_2138223 ) ) ( not ( = ?auto_2138221 ?auto_2138225 ) ) ( not ( = ?auto_2138221 ?auto_2138232 ) ) ( not ( = ?auto_2138221 ?auto_2138231 ) ) ( not ( = ?auto_2138218 ?auto_2138222 ) ) ( not ( = ?auto_2138218 ?auto_2138224 ) ) ( not ( = ?auto_2138218 ?auto_2138223 ) ) ( not ( = ?auto_2138218 ?auto_2138225 ) ) ( not ( = ?auto_2138218 ?auto_2138232 ) ) ( not ( = ?auto_2138218 ?auto_2138231 ) ) ( not ( = ?auto_2138222 ?auto_2138224 ) ) ( not ( = ?auto_2138222 ?auto_2138223 ) ) ( not ( = ?auto_2138222 ?auto_2138225 ) ) ( not ( = ?auto_2138222 ?auto_2138232 ) ) ( not ( = ?auto_2138222 ?auto_2138231 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2138224 ?auto_2138223 ?auto_2138225 )
      ( MAKE-7CRATE-VERIFY ?auto_2138219 ?auto_2138220 ?auto_2138221 ?auto_2138218 ?auto_2138222 ?auto_2138224 ?auto_2138223 ?auto_2138225 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2138234 - SURFACE
      ?auto_2138235 - SURFACE
      ?auto_2138236 - SURFACE
      ?auto_2138233 - SURFACE
      ?auto_2138237 - SURFACE
      ?auto_2138239 - SURFACE
      ?auto_2138238 - SURFACE
      ?auto_2138240 - SURFACE
      ?auto_2138241 - SURFACE
    )
    :vars
    (
      ?auto_2138246 - HOIST
      ?auto_2138243 - PLACE
      ?auto_2138244 - PLACE
      ?auto_2138242 - HOIST
      ?auto_2138248 - SURFACE
      ?auto_2138247 - SURFACE
      ?auto_2138245 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2138246 ?auto_2138243 ) ( IS-CRATE ?auto_2138241 ) ( not ( = ?auto_2138240 ?auto_2138241 ) ) ( not ( = ?auto_2138238 ?auto_2138240 ) ) ( not ( = ?auto_2138238 ?auto_2138241 ) ) ( not ( = ?auto_2138244 ?auto_2138243 ) ) ( HOIST-AT ?auto_2138242 ?auto_2138244 ) ( not ( = ?auto_2138246 ?auto_2138242 ) ) ( SURFACE-AT ?auto_2138241 ?auto_2138244 ) ( ON ?auto_2138241 ?auto_2138248 ) ( CLEAR ?auto_2138241 ) ( not ( = ?auto_2138240 ?auto_2138248 ) ) ( not ( = ?auto_2138241 ?auto_2138248 ) ) ( not ( = ?auto_2138238 ?auto_2138248 ) ) ( SURFACE-AT ?auto_2138238 ?auto_2138243 ) ( CLEAR ?auto_2138238 ) ( IS-CRATE ?auto_2138240 ) ( AVAILABLE ?auto_2138246 ) ( AVAILABLE ?auto_2138242 ) ( SURFACE-AT ?auto_2138240 ?auto_2138244 ) ( ON ?auto_2138240 ?auto_2138247 ) ( CLEAR ?auto_2138240 ) ( not ( = ?auto_2138240 ?auto_2138247 ) ) ( not ( = ?auto_2138241 ?auto_2138247 ) ) ( not ( = ?auto_2138238 ?auto_2138247 ) ) ( not ( = ?auto_2138248 ?auto_2138247 ) ) ( TRUCK-AT ?auto_2138245 ?auto_2138243 ) ( ON ?auto_2138235 ?auto_2138234 ) ( ON ?auto_2138236 ?auto_2138235 ) ( ON ?auto_2138233 ?auto_2138236 ) ( ON ?auto_2138237 ?auto_2138233 ) ( ON ?auto_2138239 ?auto_2138237 ) ( ON ?auto_2138238 ?auto_2138239 ) ( not ( = ?auto_2138234 ?auto_2138235 ) ) ( not ( = ?auto_2138234 ?auto_2138236 ) ) ( not ( = ?auto_2138234 ?auto_2138233 ) ) ( not ( = ?auto_2138234 ?auto_2138237 ) ) ( not ( = ?auto_2138234 ?auto_2138239 ) ) ( not ( = ?auto_2138234 ?auto_2138238 ) ) ( not ( = ?auto_2138234 ?auto_2138240 ) ) ( not ( = ?auto_2138234 ?auto_2138241 ) ) ( not ( = ?auto_2138234 ?auto_2138248 ) ) ( not ( = ?auto_2138234 ?auto_2138247 ) ) ( not ( = ?auto_2138235 ?auto_2138236 ) ) ( not ( = ?auto_2138235 ?auto_2138233 ) ) ( not ( = ?auto_2138235 ?auto_2138237 ) ) ( not ( = ?auto_2138235 ?auto_2138239 ) ) ( not ( = ?auto_2138235 ?auto_2138238 ) ) ( not ( = ?auto_2138235 ?auto_2138240 ) ) ( not ( = ?auto_2138235 ?auto_2138241 ) ) ( not ( = ?auto_2138235 ?auto_2138248 ) ) ( not ( = ?auto_2138235 ?auto_2138247 ) ) ( not ( = ?auto_2138236 ?auto_2138233 ) ) ( not ( = ?auto_2138236 ?auto_2138237 ) ) ( not ( = ?auto_2138236 ?auto_2138239 ) ) ( not ( = ?auto_2138236 ?auto_2138238 ) ) ( not ( = ?auto_2138236 ?auto_2138240 ) ) ( not ( = ?auto_2138236 ?auto_2138241 ) ) ( not ( = ?auto_2138236 ?auto_2138248 ) ) ( not ( = ?auto_2138236 ?auto_2138247 ) ) ( not ( = ?auto_2138233 ?auto_2138237 ) ) ( not ( = ?auto_2138233 ?auto_2138239 ) ) ( not ( = ?auto_2138233 ?auto_2138238 ) ) ( not ( = ?auto_2138233 ?auto_2138240 ) ) ( not ( = ?auto_2138233 ?auto_2138241 ) ) ( not ( = ?auto_2138233 ?auto_2138248 ) ) ( not ( = ?auto_2138233 ?auto_2138247 ) ) ( not ( = ?auto_2138237 ?auto_2138239 ) ) ( not ( = ?auto_2138237 ?auto_2138238 ) ) ( not ( = ?auto_2138237 ?auto_2138240 ) ) ( not ( = ?auto_2138237 ?auto_2138241 ) ) ( not ( = ?auto_2138237 ?auto_2138248 ) ) ( not ( = ?auto_2138237 ?auto_2138247 ) ) ( not ( = ?auto_2138239 ?auto_2138238 ) ) ( not ( = ?auto_2138239 ?auto_2138240 ) ) ( not ( = ?auto_2138239 ?auto_2138241 ) ) ( not ( = ?auto_2138239 ?auto_2138248 ) ) ( not ( = ?auto_2138239 ?auto_2138247 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2138238 ?auto_2138240 ?auto_2138241 )
      ( MAKE-8CRATE-VERIFY ?auto_2138234 ?auto_2138235 ?auto_2138236 ?auto_2138233 ?auto_2138237 ?auto_2138239 ?auto_2138238 ?auto_2138240 ?auto_2138241 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2138249 - SURFACE
      ?auto_2138250 - SURFACE
    )
    :vars
    (
      ?auto_2138256 - HOIST
      ?auto_2138252 - PLACE
      ?auto_2138255 - SURFACE
      ?auto_2138253 - PLACE
      ?auto_2138251 - HOIST
      ?auto_2138258 - SURFACE
      ?auto_2138257 - SURFACE
      ?auto_2138254 - TRUCK
      ?auto_2138259 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2138256 ?auto_2138252 ) ( IS-CRATE ?auto_2138250 ) ( not ( = ?auto_2138249 ?auto_2138250 ) ) ( not ( = ?auto_2138255 ?auto_2138249 ) ) ( not ( = ?auto_2138255 ?auto_2138250 ) ) ( not ( = ?auto_2138253 ?auto_2138252 ) ) ( HOIST-AT ?auto_2138251 ?auto_2138253 ) ( not ( = ?auto_2138256 ?auto_2138251 ) ) ( SURFACE-AT ?auto_2138250 ?auto_2138253 ) ( ON ?auto_2138250 ?auto_2138258 ) ( CLEAR ?auto_2138250 ) ( not ( = ?auto_2138249 ?auto_2138258 ) ) ( not ( = ?auto_2138250 ?auto_2138258 ) ) ( not ( = ?auto_2138255 ?auto_2138258 ) ) ( IS-CRATE ?auto_2138249 ) ( AVAILABLE ?auto_2138251 ) ( SURFACE-AT ?auto_2138249 ?auto_2138253 ) ( ON ?auto_2138249 ?auto_2138257 ) ( CLEAR ?auto_2138249 ) ( not ( = ?auto_2138249 ?auto_2138257 ) ) ( not ( = ?auto_2138250 ?auto_2138257 ) ) ( not ( = ?auto_2138255 ?auto_2138257 ) ) ( not ( = ?auto_2138258 ?auto_2138257 ) ) ( TRUCK-AT ?auto_2138254 ?auto_2138252 ) ( SURFACE-AT ?auto_2138259 ?auto_2138252 ) ( CLEAR ?auto_2138259 ) ( LIFTING ?auto_2138256 ?auto_2138255 ) ( IS-CRATE ?auto_2138255 ) ( not ( = ?auto_2138259 ?auto_2138255 ) ) ( not ( = ?auto_2138249 ?auto_2138259 ) ) ( not ( = ?auto_2138250 ?auto_2138259 ) ) ( not ( = ?auto_2138258 ?auto_2138259 ) ) ( not ( = ?auto_2138257 ?auto_2138259 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2138259 ?auto_2138255 )
      ( MAKE-2CRATE ?auto_2138255 ?auto_2138249 ?auto_2138250 )
      ( MAKE-1CRATE-VERIFY ?auto_2138249 ?auto_2138250 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2138260 - SURFACE
      ?auto_2138261 - SURFACE
      ?auto_2138262 - SURFACE
    )
    :vars
    (
      ?auto_2138265 - HOIST
      ?auto_2138268 - PLACE
      ?auto_2138267 - PLACE
      ?auto_2138263 - HOIST
      ?auto_2138264 - SURFACE
      ?auto_2138270 - SURFACE
      ?auto_2138266 - TRUCK
      ?auto_2138269 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2138265 ?auto_2138268 ) ( IS-CRATE ?auto_2138262 ) ( not ( = ?auto_2138261 ?auto_2138262 ) ) ( not ( = ?auto_2138260 ?auto_2138261 ) ) ( not ( = ?auto_2138260 ?auto_2138262 ) ) ( not ( = ?auto_2138267 ?auto_2138268 ) ) ( HOIST-AT ?auto_2138263 ?auto_2138267 ) ( not ( = ?auto_2138265 ?auto_2138263 ) ) ( SURFACE-AT ?auto_2138262 ?auto_2138267 ) ( ON ?auto_2138262 ?auto_2138264 ) ( CLEAR ?auto_2138262 ) ( not ( = ?auto_2138261 ?auto_2138264 ) ) ( not ( = ?auto_2138262 ?auto_2138264 ) ) ( not ( = ?auto_2138260 ?auto_2138264 ) ) ( IS-CRATE ?auto_2138261 ) ( AVAILABLE ?auto_2138263 ) ( SURFACE-AT ?auto_2138261 ?auto_2138267 ) ( ON ?auto_2138261 ?auto_2138270 ) ( CLEAR ?auto_2138261 ) ( not ( = ?auto_2138261 ?auto_2138270 ) ) ( not ( = ?auto_2138262 ?auto_2138270 ) ) ( not ( = ?auto_2138260 ?auto_2138270 ) ) ( not ( = ?auto_2138264 ?auto_2138270 ) ) ( TRUCK-AT ?auto_2138266 ?auto_2138268 ) ( SURFACE-AT ?auto_2138269 ?auto_2138268 ) ( CLEAR ?auto_2138269 ) ( LIFTING ?auto_2138265 ?auto_2138260 ) ( IS-CRATE ?auto_2138260 ) ( not ( = ?auto_2138269 ?auto_2138260 ) ) ( not ( = ?auto_2138261 ?auto_2138269 ) ) ( not ( = ?auto_2138262 ?auto_2138269 ) ) ( not ( = ?auto_2138264 ?auto_2138269 ) ) ( not ( = ?auto_2138270 ?auto_2138269 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2138261 ?auto_2138262 )
      ( MAKE-2CRATE-VERIFY ?auto_2138260 ?auto_2138261 ?auto_2138262 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2138272 - SURFACE
      ?auto_2138273 - SURFACE
      ?auto_2138274 - SURFACE
      ?auto_2138271 - SURFACE
    )
    :vars
    (
      ?auto_2138277 - HOIST
      ?auto_2138281 - PLACE
      ?auto_2138279 - PLACE
      ?auto_2138280 - HOIST
      ?auto_2138276 - SURFACE
      ?auto_2138275 - SURFACE
      ?auto_2138278 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2138277 ?auto_2138281 ) ( IS-CRATE ?auto_2138271 ) ( not ( = ?auto_2138274 ?auto_2138271 ) ) ( not ( = ?auto_2138273 ?auto_2138274 ) ) ( not ( = ?auto_2138273 ?auto_2138271 ) ) ( not ( = ?auto_2138279 ?auto_2138281 ) ) ( HOIST-AT ?auto_2138280 ?auto_2138279 ) ( not ( = ?auto_2138277 ?auto_2138280 ) ) ( SURFACE-AT ?auto_2138271 ?auto_2138279 ) ( ON ?auto_2138271 ?auto_2138276 ) ( CLEAR ?auto_2138271 ) ( not ( = ?auto_2138274 ?auto_2138276 ) ) ( not ( = ?auto_2138271 ?auto_2138276 ) ) ( not ( = ?auto_2138273 ?auto_2138276 ) ) ( IS-CRATE ?auto_2138274 ) ( AVAILABLE ?auto_2138280 ) ( SURFACE-AT ?auto_2138274 ?auto_2138279 ) ( ON ?auto_2138274 ?auto_2138275 ) ( CLEAR ?auto_2138274 ) ( not ( = ?auto_2138274 ?auto_2138275 ) ) ( not ( = ?auto_2138271 ?auto_2138275 ) ) ( not ( = ?auto_2138273 ?auto_2138275 ) ) ( not ( = ?auto_2138276 ?auto_2138275 ) ) ( TRUCK-AT ?auto_2138278 ?auto_2138281 ) ( SURFACE-AT ?auto_2138272 ?auto_2138281 ) ( CLEAR ?auto_2138272 ) ( LIFTING ?auto_2138277 ?auto_2138273 ) ( IS-CRATE ?auto_2138273 ) ( not ( = ?auto_2138272 ?auto_2138273 ) ) ( not ( = ?auto_2138274 ?auto_2138272 ) ) ( not ( = ?auto_2138271 ?auto_2138272 ) ) ( not ( = ?auto_2138276 ?auto_2138272 ) ) ( not ( = ?auto_2138275 ?auto_2138272 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2138273 ?auto_2138274 ?auto_2138271 )
      ( MAKE-3CRATE-VERIFY ?auto_2138272 ?auto_2138273 ?auto_2138274 ?auto_2138271 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2138283 - SURFACE
      ?auto_2138284 - SURFACE
      ?auto_2138285 - SURFACE
      ?auto_2138282 - SURFACE
      ?auto_2138286 - SURFACE
    )
    :vars
    (
      ?auto_2138289 - HOIST
      ?auto_2138293 - PLACE
      ?auto_2138291 - PLACE
      ?auto_2138292 - HOIST
      ?auto_2138288 - SURFACE
      ?auto_2138287 - SURFACE
      ?auto_2138290 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2138289 ?auto_2138293 ) ( IS-CRATE ?auto_2138286 ) ( not ( = ?auto_2138282 ?auto_2138286 ) ) ( not ( = ?auto_2138285 ?auto_2138282 ) ) ( not ( = ?auto_2138285 ?auto_2138286 ) ) ( not ( = ?auto_2138291 ?auto_2138293 ) ) ( HOIST-AT ?auto_2138292 ?auto_2138291 ) ( not ( = ?auto_2138289 ?auto_2138292 ) ) ( SURFACE-AT ?auto_2138286 ?auto_2138291 ) ( ON ?auto_2138286 ?auto_2138288 ) ( CLEAR ?auto_2138286 ) ( not ( = ?auto_2138282 ?auto_2138288 ) ) ( not ( = ?auto_2138286 ?auto_2138288 ) ) ( not ( = ?auto_2138285 ?auto_2138288 ) ) ( IS-CRATE ?auto_2138282 ) ( AVAILABLE ?auto_2138292 ) ( SURFACE-AT ?auto_2138282 ?auto_2138291 ) ( ON ?auto_2138282 ?auto_2138287 ) ( CLEAR ?auto_2138282 ) ( not ( = ?auto_2138282 ?auto_2138287 ) ) ( not ( = ?auto_2138286 ?auto_2138287 ) ) ( not ( = ?auto_2138285 ?auto_2138287 ) ) ( not ( = ?auto_2138288 ?auto_2138287 ) ) ( TRUCK-AT ?auto_2138290 ?auto_2138293 ) ( SURFACE-AT ?auto_2138284 ?auto_2138293 ) ( CLEAR ?auto_2138284 ) ( LIFTING ?auto_2138289 ?auto_2138285 ) ( IS-CRATE ?auto_2138285 ) ( not ( = ?auto_2138284 ?auto_2138285 ) ) ( not ( = ?auto_2138282 ?auto_2138284 ) ) ( not ( = ?auto_2138286 ?auto_2138284 ) ) ( not ( = ?auto_2138288 ?auto_2138284 ) ) ( not ( = ?auto_2138287 ?auto_2138284 ) ) ( ON ?auto_2138284 ?auto_2138283 ) ( not ( = ?auto_2138283 ?auto_2138284 ) ) ( not ( = ?auto_2138283 ?auto_2138285 ) ) ( not ( = ?auto_2138283 ?auto_2138282 ) ) ( not ( = ?auto_2138283 ?auto_2138286 ) ) ( not ( = ?auto_2138283 ?auto_2138288 ) ) ( not ( = ?auto_2138283 ?auto_2138287 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2138285 ?auto_2138282 ?auto_2138286 )
      ( MAKE-4CRATE-VERIFY ?auto_2138283 ?auto_2138284 ?auto_2138285 ?auto_2138282 ?auto_2138286 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2138295 - SURFACE
      ?auto_2138296 - SURFACE
      ?auto_2138297 - SURFACE
      ?auto_2138294 - SURFACE
      ?auto_2138298 - SURFACE
      ?auto_2138299 - SURFACE
    )
    :vars
    (
      ?auto_2138302 - HOIST
      ?auto_2138306 - PLACE
      ?auto_2138304 - PLACE
      ?auto_2138305 - HOIST
      ?auto_2138301 - SURFACE
      ?auto_2138300 - SURFACE
      ?auto_2138303 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2138302 ?auto_2138306 ) ( IS-CRATE ?auto_2138299 ) ( not ( = ?auto_2138298 ?auto_2138299 ) ) ( not ( = ?auto_2138294 ?auto_2138298 ) ) ( not ( = ?auto_2138294 ?auto_2138299 ) ) ( not ( = ?auto_2138304 ?auto_2138306 ) ) ( HOIST-AT ?auto_2138305 ?auto_2138304 ) ( not ( = ?auto_2138302 ?auto_2138305 ) ) ( SURFACE-AT ?auto_2138299 ?auto_2138304 ) ( ON ?auto_2138299 ?auto_2138301 ) ( CLEAR ?auto_2138299 ) ( not ( = ?auto_2138298 ?auto_2138301 ) ) ( not ( = ?auto_2138299 ?auto_2138301 ) ) ( not ( = ?auto_2138294 ?auto_2138301 ) ) ( IS-CRATE ?auto_2138298 ) ( AVAILABLE ?auto_2138305 ) ( SURFACE-AT ?auto_2138298 ?auto_2138304 ) ( ON ?auto_2138298 ?auto_2138300 ) ( CLEAR ?auto_2138298 ) ( not ( = ?auto_2138298 ?auto_2138300 ) ) ( not ( = ?auto_2138299 ?auto_2138300 ) ) ( not ( = ?auto_2138294 ?auto_2138300 ) ) ( not ( = ?auto_2138301 ?auto_2138300 ) ) ( TRUCK-AT ?auto_2138303 ?auto_2138306 ) ( SURFACE-AT ?auto_2138297 ?auto_2138306 ) ( CLEAR ?auto_2138297 ) ( LIFTING ?auto_2138302 ?auto_2138294 ) ( IS-CRATE ?auto_2138294 ) ( not ( = ?auto_2138297 ?auto_2138294 ) ) ( not ( = ?auto_2138298 ?auto_2138297 ) ) ( not ( = ?auto_2138299 ?auto_2138297 ) ) ( not ( = ?auto_2138301 ?auto_2138297 ) ) ( not ( = ?auto_2138300 ?auto_2138297 ) ) ( ON ?auto_2138296 ?auto_2138295 ) ( ON ?auto_2138297 ?auto_2138296 ) ( not ( = ?auto_2138295 ?auto_2138296 ) ) ( not ( = ?auto_2138295 ?auto_2138297 ) ) ( not ( = ?auto_2138295 ?auto_2138294 ) ) ( not ( = ?auto_2138295 ?auto_2138298 ) ) ( not ( = ?auto_2138295 ?auto_2138299 ) ) ( not ( = ?auto_2138295 ?auto_2138301 ) ) ( not ( = ?auto_2138295 ?auto_2138300 ) ) ( not ( = ?auto_2138296 ?auto_2138297 ) ) ( not ( = ?auto_2138296 ?auto_2138294 ) ) ( not ( = ?auto_2138296 ?auto_2138298 ) ) ( not ( = ?auto_2138296 ?auto_2138299 ) ) ( not ( = ?auto_2138296 ?auto_2138301 ) ) ( not ( = ?auto_2138296 ?auto_2138300 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2138294 ?auto_2138298 ?auto_2138299 )
      ( MAKE-5CRATE-VERIFY ?auto_2138295 ?auto_2138296 ?auto_2138297 ?auto_2138294 ?auto_2138298 ?auto_2138299 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2138308 - SURFACE
      ?auto_2138309 - SURFACE
      ?auto_2138310 - SURFACE
      ?auto_2138307 - SURFACE
      ?auto_2138311 - SURFACE
      ?auto_2138313 - SURFACE
      ?auto_2138312 - SURFACE
    )
    :vars
    (
      ?auto_2138316 - HOIST
      ?auto_2138320 - PLACE
      ?auto_2138318 - PLACE
      ?auto_2138319 - HOIST
      ?auto_2138315 - SURFACE
      ?auto_2138314 - SURFACE
      ?auto_2138317 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2138316 ?auto_2138320 ) ( IS-CRATE ?auto_2138312 ) ( not ( = ?auto_2138313 ?auto_2138312 ) ) ( not ( = ?auto_2138311 ?auto_2138313 ) ) ( not ( = ?auto_2138311 ?auto_2138312 ) ) ( not ( = ?auto_2138318 ?auto_2138320 ) ) ( HOIST-AT ?auto_2138319 ?auto_2138318 ) ( not ( = ?auto_2138316 ?auto_2138319 ) ) ( SURFACE-AT ?auto_2138312 ?auto_2138318 ) ( ON ?auto_2138312 ?auto_2138315 ) ( CLEAR ?auto_2138312 ) ( not ( = ?auto_2138313 ?auto_2138315 ) ) ( not ( = ?auto_2138312 ?auto_2138315 ) ) ( not ( = ?auto_2138311 ?auto_2138315 ) ) ( IS-CRATE ?auto_2138313 ) ( AVAILABLE ?auto_2138319 ) ( SURFACE-AT ?auto_2138313 ?auto_2138318 ) ( ON ?auto_2138313 ?auto_2138314 ) ( CLEAR ?auto_2138313 ) ( not ( = ?auto_2138313 ?auto_2138314 ) ) ( not ( = ?auto_2138312 ?auto_2138314 ) ) ( not ( = ?auto_2138311 ?auto_2138314 ) ) ( not ( = ?auto_2138315 ?auto_2138314 ) ) ( TRUCK-AT ?auto_2138317 ?auto_2138320 ) ( SURFACE-AT ?auto_2138307 ?auto_2138320 ) ( CLEAR ?auto_2138307 ) ( LIFTING ?auto_2138316 ?auto_2138311 ) ( IS-CRATE ?auto_2138311 ) ( not ( = ?auto_2138307 ?auto_2138311 ) ) ( not ( = ?auto_2138313 ?auto_2138307 ) ) ( not ( = ?auto_2138312 ?auto_2138307 ) ) ( not ( = ?auto_2138315 ?auto_2138307 ) ) ( not ( = ?auto_2138314 ?auto_2138307 ) ) ( ON ?auto_2138309 ?auto_2138308 ) ( ON ?auto_2138310 ?auto_2138309 ) ( ON ?auto_2138307 ?auto_2138310 ) ( not ( = ?auto_2138308 ?auto_2138309 ) ) ( not ( = ?auto_2138308 ?auto_2138310 ) ) ( not ( = ?auto_2138308 ?auto_2138307 ) ) ( not ( = ?auto_2138308 ?auto_2138311 ) ) ( not ( = ?auto_2138308 ?auto_2138313 ) ) ( not ( = ?auto_2138308 ?auto_2138312 ) ) ( not ( = ?auto_2138308 ?auto_2138315 ) ) ( not ( = ?auto_2138308 ?auto_2138314 ) ) ( not ( = ?auto_2138309 ?auto_2138310 ) ) ( not ( = ?auto_2138309 ?auto_2138307 ) ) ( not ( = ?auto_2138309 ?auto_2138311 ) ) ( not ( = ?auto_2138309 ?auto_2138313 ) ) ( not ( = ?auto_2138309 ?auto_2138312 ) ) ( not ( = ?auto_2138309 ?auto_2138315 ) ) ( not ( = ?auto_2138309 ?auto_2138314 ) ) ( not ( = ?auto_2138310 ?auto_2138307 ) ) ( not ( = ?auto_2138310 ?auto_2138311 ) ) ( not ( = ?auto_2138310 ?auto_2138313 ) ) ( not ( = ?auto_2138310 ?auto_2138312 ) ) ( not ( = ?auto_2138310 ?auto_2138315 ) ) ( not ( = ?auto_2138310 ?auto_2138314 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2138311 ?auto_2138313 ?auto_2138312 )
      ( MAKE-6CRATE-VERIFY ?auto_2138308 ?auto_2138309 ?auto_2138310 ?auto_2138307 ?auto_2138311 ?auto_2138313 ?auto_2138312 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2138322 - SURFACE
      ?auto_2138323 - SURFACE
      ?auto_2138324 - SURFACE
      ?auto_2138321 - SURFACE
      ?auto_2138325 - SURFACE
      ?auto_2138327 - SURFACE
      ?auto_2138326 - SURFACE
      ?auto_2138328 - SURFACE
    )
    :vars
    (
      ?auto_2138331 - HOIST
      ?auto_2138335 - PLACE
      ?auto_2138333 - PLACE
      ?auto_2138334 - HOIST
      ?auto_2138330 - SURFACE
      ?auto_2138329 - SURFACE
      ?auto_2138332 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2138331 ?auto_2138335 ) ( IS-CRATE ?auto_2138328 ) ( not ( = ?auto_2138326 ?auto_2138328 ) ) ( not ( = ?auto_2138327 ?auto_2138326 ) ) ( not ( = ?auto_2138327 ?auto_2138328 ) ) ( not ( = ?auto_2138333 ?auto_2138335 ) ) ( HOIST-AT ?auto_2138334 ?auto_2138333 ) ( not ( = ?auto_2138331 ?auto_2138334 ) ) ( SURFACE-AT ?auto_2138328 ?auto_2138333 ) ( ON ?auto_2138328 ?auto_2138330 ) ( CLEAR ?auto_2138328 ) ( not ( = ?auto_2138326 ?auto_2138330 ) ) ( not ( = ?auto_2138328 ?auto_2138330 ) ) ( not ( = ?auto_2138327 ?auto_2138330 ) ) ( IS-CRATE ?auto_2138326 ) ( AVAILABLE ?auto_2138334 ) ( SURFACE-AT ?auto_2138326 ?auto_2138333 ) ( ON ?auto_2138326 ?auto_2138329 ) ( CLEAR ?auto_2138326 ) ( not ( = ?auto_2138326 ?auto_2138329 ) ) ( not ( = ?auto_2138328 ?auto_2138329 ) ) ( not ( = ?auto_2138327 ?auto_2138329 ) ) ( not ( = ?auto_2138330 ?auto_2138329 ) ) ( TRUCK-AT ?auto_2138332 ?auto_2138335 ) ( SURFACE-AT ?auto_2138325 ?auto_2138335 ) ( CLEAR ?auto_2138325 ) ( LIFTING ?auto_2138331 ?auto_2138327 ) ( IS-CRATE ?auto_2138327 ) ( not ( = ?auto_2138325 ?auto_2138327 ) ) ( not ( = ?auto_2138326 ?auto_2138325 ) ) ( not ( = ?auto_2138328 ?auto_2138325 ) ) ( not ( = ?auto_2138330 ?auto_2138325 ) ) ( not ( = ?auto_2138329 ?auto_2138325 ) ) ( ON ?auto_2138323 ?auto_2138322 ) ( ON ?auto_2138324 ?auto_2138323 ) ( ON ?auto_2138321 ?auto_2138324 ) ( ON ?auto_2138325 ?auto_2138321 ) ( not ( = ?auto_2138322 ?auto_2138323 ) ) ( not ( = ?auto_2138322 ?auto_2138324 ) ) ( not ( = ?auto_2138322 ?auto_2138321 ) ) ( not ( = ?auto_2138322 ?auto_2138325 ) ) ( not ( = ?auto_2138322 ?auto_2138327 ) ) ( not ( = ?auto_2138322 ?auto_2138326 ) ) ( not ( = ?auto_2138322 ?auto_2138328 ) ) ( not ( = ?auto_2138322 ?auto_2138330 ) ) ( not ( = ?auto_2138322 ?auto_2138329 ) ) ( not ( = ?auto_2138323 ?auto_2138324 ) ) ( not ( = ?auto_2138323 ?auto_2138321 ) ) ( not ( = ?auto_2138323 ?auto_2138325 ) ) ( not ( = ?auto_2138323 ?auto_2138327 ) ) ( not ( = ?auto_2138323 ?auto_2138326 ) ) ( not ( = ?auto_2138323 ?auto_2138328 ) ) ( not ( = ?auto_2138323 ?auto_2138330 ) ) ( not ( = ?auto_2138323 ?auto_2138329 ) ) ( not ( = ?auto_2138324 ?auto_2138321 ) ) ( not ( = ?auto_2138324 ?auto_2138325 ) ) ( not ( = ?auto_2138324 ?auto_2138327 ) ) ( not ( = ?auto_2138324 ?auto_2138326 ) ) ( not ( = ?auto_2138324 ?auto_2138328 ) ) ( not ( = ?auto_2138324 ?auto_2138330 ) ) ( not ( = ?auto_2138324 ?auto_2138329 ) ) ( not ( = ?auto_2138321 ?auto_2138325 ) ) ( not ( = ?auto_2138321 ?auto_2138327 ) ) ( not ( = ?auto_2138321 ?auto_2138326 ) ) ( not ( = ?auto_2138321 ?auto_2138328 ) ) ( not ( = ?auto_2138321 ?auto_2138330 ) ) ( not ( = ?auto_2138321 ?auto_2138329 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2138327 ?auto_2138326 ?auto_2138328 )
      ( MAKE-7CRATE-VERIFY ?auto_2138322 ?auto_2138323 ?auto_2138324 ?auto_2138321 ?auto_2138325 ?auto_2138327 ?auto_2138326 ?auto_2138328 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2138337 - SURFACE
      ?auto_2138338 - SURFACE
      ?auto_2138339 - SURFACE
      ?auto_2138336 - SURFACE
      ?auto_2138340 - SURFACE
      ?auto_2138342 - SURFACE
      ?auto_2138341 - SURFACE
      ?auto_2138343 - SURFACE
      ?auto_2138344 - SURFACE
    )
    :vars
    (
      ?auto_2138347 - HOIST
      ?auto_2138351 - PLACE
      ?auto_2138349 - PLACE
      ?auto_2138350 - HOIST
      ?auto_2138346 - SURFACE
      ?auto_2138345 - SURFACE
      ?auto_2138348 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2138347 ?auto_2138351 ) ( IS-CRATE ?auto_2138344 ) ( not ( = ?auto_2138343 ?auto_2138344 ) ) ( not ( = ?auto_2138341 ?auto_2138343 ) ) ( not ( = ?auto_2138341 ?auto_2138344 ) ) ( not ( = ?auto_2138349 ?auto_2138351 ) ) ( HOIST-AT ?auto_2138350 ?auto_2138349 ) ( not ( = ?auto_2138347 ?auto_2138350 ) ) ( SURFACE-AT ?auto_2138344 ?auto_2138349 ) ( ON ?auto_2138344 ?auto_2138346 ) ( CLEAR ?auto_2138344 ) ( not ( = ?auto_2138343 ?auto_2138346 ) ) ( not ( = ?auto_2138344 ?auto_2138346 ) ) ( not ( = ?auto_2138341 ?auto_2138346 ) ) ( IS-CRATE ?auto_2138343 ) ( AVAILABLE ?auto_2138350 ) ( SURFACE-AT ?auto_2138343 ?auto_2138349 ) ( ON ?auto_2138343 ?auto_2138345 ) ( CLEAR ?auto_2138343 ) ( not ( = ?auto_2138343 ?auto_2138345 ) ) ( not ( = ?auto_2138344 ?auto_2138345 ) ) ( not ( = ?auto_2138341 ?auto_2138345 ) ) ( not ( = ?auto_2138346 ?auto_2138345 ) ) ( TRUCK-AT ?auto_2138348 ?auto_2138351 ) ( SURFACE-AT ?auto_2138342 ?auto_2138351 ) ( CLEAR ?auto_2138342 ) ( LIFTING ?auto_2138347 ?auto_2138341 ) ( IS-CRATE ?auto_2138341 ) ( not ( = ?auto_2138342 ?auto_2138341 ) ) ( not ( = ?auto_2138343 ?auto_2138342 ) ) ( not ( = ?auto_2138344 ?auto_2138342 ) ) ( not ( = ?auto_2138346 ?auto_2138342 ) ) ( not ( = ?auto_2138345 ?auto_2138342 ) ) ( ON ?auto_2138338 ?auto_2138337 ) ( ON ?auto_2138339 ?auto_2138338 ) ( ON ?auto_2138336 ?auto_2138339 ) ( ON ?auto_2138340 ?auto_2138336 ) ( ON ?auto_2138342 ?auto_2138340 ) ( not ( = ?auto_2138337 ?auto_2138338 ) ) ( not ( = ?auto_2138337 ?auto_2138339 ) ) ( not ( = ?auto_2138337 ?auto_2138336 ) ) ( not ( = ?auto_2138337 ?auto_2138340 ) ) ( not ( = ?auto_2138337 ?auto_2138342 ) ) ( not ( = ?auto_2138337 ?auto_2138341 ) ) ( not ( = ?auto_2138337 ?auto_2138343 ) ) ( not ( = ?auto_2138337 ?auto_2138344 ) ) ( not ( = ?auto_2138337 ?auto_2138346 ) ) ( not ( = ?auto_2138337 ?auto_2138345 ) ) ( not ( = ?auto_2138338 ?auto_2138339 ) ) ( not ( = ?auto_2138338 ?auto_2138336 ) ) ( not ( = ?auto_2138338 ?auto_2138340 ) ) ( not ( = ?auto_2138338 ?auto_2138342 ) ) ( not ( = ?auto_2138338 ?auto_2138341 ) ) ( not ( = ?auto_2138338 ?auto_2138343 ) ) ( not ( = ?auto_2138338 ?auto_2138344 ) ) ( not ( = ?auto_2138338 ?auto_2138346 ) ) ( not ( = ?auto_2138338 ?auto_2138345 ) ) ( not ( = ?auto_2138339 ?auto_2138336 ) ) ( not ( = ?auto_2138339 ?auto_2138340 ) ) ( not ( = ?auto_2138339 ?auto_2138342 ) ) ( not ( = ?auto_2138339 ?auto_2138341 ) ) ( not ( = ?auto_2138339 ?auto_2138343 ) ) ( not ( = ?auto_2138339 ?auto_2138344 ) ) ( not ( = ?auto_2138339 ?auto_2138346 ) ) ( not ( = ?auto_2138339 ?auto_2138345 ) ) ( not ( = ?auto_2138336 ?auto_2138340 ) ) ( not ( = ?auto_2138336 ?auto_2138342 ) ) ( not ( = ?auto_2138336 ?auto_2138341 ) ) ( not ( = ?auto_2138336 ?auto_2138343 ) ) ( not ( = ?auto_2138336 ?auto_2138344 ) ) ( not ( = ?auto_2138336 ?auto_2138346 ) ) ( not ( = ?auto_2138336 ?auto_2138345 ) ) ( not ( = ?auto_2138340 ?auto_2138342 ) ) ( not ( = ?auto_2138340 ?auto_2138341 ) ) ( not ( = ?auto_2138340 ?auto_2138343 ) ) ( not ( = ?auto_2138340 ?auto_2138344 ) ) ( not ( = ?auto_2138340 ?auto_2138346 ) ) ( not ( = ?auto_2138340 ?auto_2138345 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2138341 ?auto_2138343 ?auto_2138344 )
      ( MAKE-8CRATE-VERIFY ?auto_2138337 ?auto_2138338 ?auto_2138339 ?auto_2138336 ?auto_2138340 ?auto_2138342 ?auto_2138341 ?auto_2138343 ?auto_2138344 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2141898 - SURFACE
      ?auto_2141899 - SURFACE
      ?auto_2141900 - SURFACE
      ?auto_2141897 - SURFACE
      ?auto_2141901 - SURFACE
      ?auto_2141903 - SURFACE
      ?auto_2141902 - SURFACE
      ?auto_2141904 - SURFACE
      ?auto_2141905 - SURFACE
      ?auto_2141906 - SURFACE
    )
    :vars
    (
      ?auto_2141907 - HOIST
      ?auto_2141908 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2141907 ?auto_2141908 ) ( SURFACE-AT ?auto_2141905 ?auto_2141908 ) ( CLEAR ?auto_2141905 ) ( LIFTING ?auto_2141907 ?auto_2141906 ) ( IS-CRATE ?auto_2141906 ) ( not ( = ?auto_2141905 ?auto_2141906 ) ) ( ON ?auto_2141899 ?auto_2141898 ) ( ON ?auto_2141900 ?auto_2141899 ) ( ON ?auto_2141897 ?auto_2141900 ) ( ON ?auto_2141901 ?auto_2141897 ) ( ON ?auto_2141903 ?auto_2141901 ) ( ON ?auto_2141902 ?auto_2141903 ) ( ON ?auto_2141904 ?auto_2141902 ) ( ON ?auto_2141905 ?auto_2141904 ) ( not ( = ?auto_2141898 ?auto_2141899 ) ) ( not ( = ?auto_2141898 ?auto_2141900 ) ) ( not ( = ?auto_2141898 ?auto_2141897 ) ) ( not ( = ?auto_2141898 ?auto_2141901 ) ) ( not ( = ?auto_2141898 ?auto_2141903 ) ) ( not ( = ?auto_2141898 ?auto_2141902 ) ) ( not ( = ?auto_2141898 ?auto_2141904 ) ) ( not ( = ?auto_2141898 ?auto_2141905 ) ) ( not ( = ?auto_2141898 ?auto_2141906 ) ) ( not ( = ?auto_2141899 ?auto_2141900 ) ) ( not ( = ?auto_2141899 ?auto_2141897 ) ) ( not ( = ?auto_2141899 ?auto_2141901 ) ) ( not ( = ?auto_2141899 ?auto_2141903 ) ) ( not ( = ?auto_2141899 ?auto_2141902 ) ) ( not ( = ?auto_2141899 ?auto_2141904 ) ) ( not ( = ?auto_2141899 ?auto_2141905 ) ) ( not ( = ?auto_2141899 ?auto_2141906 ) ) ( not ( = ?auto_2141900 ?auto_2141897 ) ) ( not ( = ?auto_2141900 ?auto_2141901 ) ) ( not ( = ?auto_2141900 ?auto_2141903 ) ) ( not ( = ?auto_2141900 ?auto_2141902 ) ) ( not ( = ?auto_2141900 ?auto_2141904 ) ) ( not ( = ?auto_2141900 ?auto_2141905 ) ) ( not ( = ?auto_2141900 ?auto_2141906 ) ) ( not ( = ?auto_2141897 ?auto_2141901 ) ) ( not ( = ?auto_2141897 ?auto_2141903 ) ) ( not ( = ?auto_2141897 ?auto_2141902 ) ) ( not ( = ?auto_2141897 ?auto_2141904 ) ) ( not ( = ?auto_2141897 ?auto_2141905 ) ) ( not ( = ?auto_2141897 ?auto_2141906 ) ) ( not ( = ?auto_2141901 ?auto_2141903 ) ) ( not ( = ?auto_2141901 ?auto_2141902 ) ) ( not ( = ?auto_2141901 ?auto_2141904 ) ) ( not ( = ?auto_2141901 ?auto_2141905 ) ) ( not ( = ?auto_2141901 ?auto_2141906 ) ) ( not ( = ?auto_2141903 ?auto_2141902 ) ) ( not ( = ?auto_2141903 ?auto_2141904 ) ) ( not ( = ?auto_2141903 ?auto_2141905 ) ) ( not ( = ?auto_2141903 ?auto_2141906 ) ) ( not ( = ?auto_2141902 ?auto_2141904 ) ) ( not ( = ?auto_2141902 ?auto_2141905 ) ) ( not ( = ?auto_2141902 ?auto_2141906 ) ) ( not ( = ?auto_2141904 ?auto_2141905 ) ) ( not ( = ?auto_2141904 ?auto_2141906 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2141905 ?auto_2141906 )
      ( MAKE-9CRATE-VERIFY ?auto_2141898 ?auto_2141899 ?auto_2141900 ?auto_2141897 ?auto_2141901 ?auto_2141903 ?auto_2141902 ?auto_2141904 ?auto_2141905 ?auto_2141906 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2141978 - SURFACE
      ?auto_2141979 - SURFACE
      ?auto_2141980 - SURFACE
      ?auto_2141977 - SURFACE
      ?auto_2141981 - SURFACE
      ?auto_2141983 - SURFACE
      ?auto_2141982 - SURFACE
      ?auto_2141984 - SURFACE
      ?auto_2141985 - SURFACE
      ?auto_2141986 - SURFACE
    )
    :vars
    (
      ?auto_2141989 - HOIST
      ?auto_2141988 - PLACE
      ?auto_2141987 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2141989 ?auto_2141988 ) ( SURFACE-AT ?auto_2141985 ?auto_2141988 ) ( CLEAR ?auto_2141985 ) ( IS-CRATE ?auto_2141986 ) ( not ( = ?auto_2141985 ?auto_2141986 ) ) ( TRUCK-AT ?auto_2141987 ?auto_2141988 ) ( AVAILABLE ?auto_2141989 ) ( IN ?auto_2141986 ?auto_2141987 ) ( ON ?auto_2141985 ?auto_2141984 ) ( not ( = ?auto_2141984 ?auto_2141985 ) ) ( not ( = ?auto_2141984 ?auto_2141986 ) ) ( ON ?auto_2141979 ?auto_2141978 ) ( ON ?auto_2141980 ?auto_2141979 ) ( ON ?auto_2141977 ?auto_2141980 ) ( ON ?auto_2141981 ?auto_2141977 ) ( ON ?auto_2141983 ?auto_2141981 ) ( ON ?auto_2141982 ?auto_2141983 ) ( ON ?auto_2141984 ?auto_2141982 ) ( not ( = ?auto_2141978 ?auto_2141979 ) ) ( not ( = ?auto_2141978 ?auto_2141980 ) ) ( not ( = ?auto_2141978 ?auto_2141977 ) ) ( not ( = ?auto_2141978 ?auto_2141981 ) ) ( not ( = ?auto_2141978 ?auto_2141983 ) ) ( not ( = ?auto_2141978 ?auto_2141982 ) ) ( not ( = ?auto_2141978 ?auto_2141984 ) ) ( not ( = ?auto_2141978 ?auto_2141985 ) ) ( not ( = ?auto_2141978 ?auto_2141986 ) ) ( not ( = ?auto_2141979 ?auto_2141980 ) ) ( not ( = ?auto_2141979 ?auto_2141977 ) ) ( not ( = ?auto_2141979 ?auto_2141981 ) ) ( not ( = ?auto_2141979 ?auto_2141983 ) ) ( not ( = ?auto_2141979 ?auto_2141982 ) ) ( not ( = ?auto_2141979 ?auto_2141984 ) ) ( not ( = ?auto_2141979 ?auto_2141985 ) ) ( not ( = ?auto_2141979 ?auto_2141986 ) ) ( not ( = ?auto_2141980 ?auto_2141977 ) ) ( not ( = ?auto_2141980 ?auto_2141981 ) ) ( not ( = ?auto_2141980 ?auto_2141983 ) ) ( not ( = ?auto_2141980 ?auto_2141982 ) ) ( not ( = ?auto_2141980 ?auto_2141984 ) ) ( not ( = ?auto_2141980 ?auto_2141985 ) ) ( not ( = ?auto_2141980 ?auto_2141986 ) ) ( not ( = ?auto_2141977 ?auto_2141981 ) ) ( not ( = ?auto_2141977 ?auto_2141983 ) ) ( not ( = ?auto_2141977 ?auto_2141982 ) ) ( not ( = ?auto_2141977 ?auto_2141984 ) ) ( not ( = ?auto_2141977 ?auto_2141985 ) ) ( not ( = ?auto_2141977 ?auto_2141986 ) ) ( not ( = ?auto_2141981 ?auto_2141983 ) ) ( not ( = ?auto_2141981 ?auto_2141982 ) ) ( not ( = ?auto_2141981 ?auto_2141984 ) ) ( not ( = ?auto_2141981 ?auto_2141985 ) ) ( not ( = ?auto_2141981 ?auto_2141986 ) ) ( not ( = ?auto_2141983 ?auto_2141982 ) ) ( not ( = ?auto_2141983 ?auto_2141984 ) ) ( not ( = ?auto_2141983 ?auto_2141985 ) ) ( not ( = ?auto_2141983 ?auto_2141986 ) ) ( not ( = ?auto_2141982 ?auto_2141984 ) ) ( not ( = ?auto_2141982 ?auto_2141985 ) ) ( not ( = ?auto_2141982 ?auto_2141986 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2141984 ?auto_2141985 ?auto_2141986 )
      ( MAKE-9CRATE-VERIFY ?auto_2141978 ?auto_2141979 ?auto_2141980 ?auto_2141977 ?auto_2141981 ?auto_2141983 ?auto_2141982 ?auto_2141984 ?auto_2141985 ?auto_2141986 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2142068 - SURFACE
      ?auto_2142069 - SURFACE
      ?auto_2142070 - SURFACE
      ?auto_2142067 - SURFACE
      ?auto_2142071 - SURFACE
      ?auto_2142073 - SURFACE
      ?auto_2142072 - SURFACE
      ?auto_2142074 - SURFACE
      ?auto_2142075 - SURFACE
      ?auto_2142076 - SURFACE
    )
    :vars
    (
      ?auto_2142078 - HOIST
      ?auto_2142080 - PLACE
      ?auto_2142077 - TRUCK
      ?auto_2142079 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2142078 ?auto_2142080 ) ( SURFACE-AT ?auto_2142075 ?auto_2142080 ) ( CLEAR ?auto_2142075 ) ( IS-CRATE ?auto_2142076 ) ( not ( = ?auto_2142075 ?auto_2142076 ) ) ( AVAILABLE ?auto_2142078 ) ( IN ?auto_2142076 ?auto_2142077 ) ( ON ?auto_2142075 ?auto_2142074 ) ( not ( = ?auto_2142074 ?auto_2142075 ) ) ( not ( = ?auto_2142074 ?auto_2142076 ) ) ( TRUCK-AT ?auto_2142077 ?auto_2142079 ) ( not ( = ?auto_2142079 ?auto_2142080 ) ) ( ON ?auto_2142069 ?auto_2142068 ) ( ON ?auto_2142070 ?auto_2142069 ) ( ON ?auto_2142067 ?auto_2142070 ) ( ON ?auto_2142071 ?auto_2142067 ) ( ON ?auto_2142073 ?auto_2142071 ) ( ON ?auto_2142072 ?auto_2142073 ) ( ON ?auto_2142074 ?auto_2142072 ) ( not ( = ?auto_2142068 ?auto_2142069 ) ) ( not ( = ?auto_2142068 ?auto_2142070 ) ) ( not ( = ?auto_2142068 ?auto_2142067 ) ) ( not ( = ?auto_2142068 ?auto_2142071 ) ) ( not ( = ?auto_2142068 ?auto_2142073 ) ) ( not ( = ?auto_2142068 ?auto_2142072 ) ) ( not ( = ?auto_2142068 ?auto_2142074 ) ) ( not ( = ?auto_2142068 ?auto_2142075 ) ) ( not ( = ?auto_2142068 ?auto_2142076 ) ) ( not ( = ?auto_2142069 ?auto_2142070 ) ) ( not ( = ?auto_2142069 ?auto_2142067 ) ) ( not ( = ?auto_2142069 ?auto_2142071 ) ) ( not ( = ?auto_2142069 ?auto_2142073 ) ) ( not ( = ?auto_2142069 ?auto_2142072 ) ) ( not ( = ?auto_2142069 ?auto_2142074 ) ) ( not ( = ?auto_2142069 ?auto_2142075 ) ) ( not ( = ?auto_2142069 ?auto_2142076 ) ) ( not ( = ?auto_2142070 ?auto_2142067 ) ) ( not ( = ?auto_2142070 ?auto_2142071 ) ) ( not ( = ?auto_2142070 ?auto_2142073 ) ) ( not ( = ?auto_2142070 ?auto_2142072 ) ) ( not ( = ?auto_2142070 ?auto_2142074 ) ) ( not ( = ?auto_2142070 ?auto_2142075 ) ) ( not ( = ?auto_2142070 ?auto_2142076 ) ) ( not ( = ?auto_2142067 ?auto_2142071 ) ) ( not ( = ?auto_2142067 ?auto_2142073 ) ) ( not ( = ?auto_2142067 ?auto_2142072 ) ) ( not ( = ?auto_2142067 ?auto_2142074 ) ) ( not ( = ?auto_2142067 ?auto_2142075 ) ) ( not ( = ?auto_2142067 ?auto_2142076 ) ) ( not ( = ?auto_2142071 ?auto_2142073 ) ) ( not ( = ?auto_2142071 ?auto_2142072 ) ) ( not ( = ?auto_2142071 ?auto_2142074 ) ) ( not ( = ?auto_2142071 ?auto_2142075 ) ) ( not ( = ?auto_2142071 ?auto_2142076 ) ) ( not ( = ?auto_2142073 ?auto_2142072 ) ) ( not ( = ?auto_2142073 ?auto_2142074 ) ) ( not ( = ?auto_2142073 ?auto_2142075 ) ) ( not ( = ?auto_2142073 ?auto_2142076 ) ) ( not ( = ?auto_2142072 ?auto_2142074 ) ) ( not ( = ?auto_2142072 ?auto_2142075 ) ) ( not ( = ?auto_2142072 ?auto_2142076 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2142074 ?auto_2142075 ?auto_2142076 )
      ( MAKE-9CRATE-VERIFY ?auto_2142068 ?auto_2142069 ?auto_2142070 ?auto_2142067 ?auto_2142071 ?auto_2142073 ?auto_2142072 ?auto_2142074 ?auto_2142075 ?auto_2142076 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2142167 - SURFACE
      ?auto_2142168 - SURFACE
      ?auto_2142169 - SURFACE
      ?auto_2142166 - SURFACE
      ?auto_2142170 - SURFACE
      ?auto_2142172 - SURFACE
      ?auto_2142171 - SURFACE
      ?auto_2142173 - SURFACE
      ?auto_2142174 - SURFACE
      ?auto_2142175 - SURFACE
    )
    :vars
    (
      ?auto_2142180 - HOIST
      ?auto_2142176 - PLACE
      ?auto_2142179 - TRUCK
      ?auto_2142177 - PLACE
      ?auto_2142178 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2142180 ?auto_2142176 ) ( SURFACE-AT ?auto_2142174 ?auto_2142176 ) ( CLEAR ?auto_2142174 ) ( IS-CRATE ?auto_2142175 ) ( not ( = ?auto_2142174 ?auto_2142175 ) ) ( AVAILABLE ?auto_2142180 ) ( ON ?auto_2142174 ?auto_2142173 ) ( not ( = ?auto_2142173 ?auto_2142174 ) ) ( not ( = ?auto_2142173 ?auto_2142175 ) ) ( TRUCK-AT ?auto_2142179 ?auto_2142177 ) ( not ( = ?auto_2142177 ?auto_2142176 ) ) ( HOIST-AT ?auto_2142178 ?auto_2142177 ) ( LIFTING ?auto_2142178 ?auto_2142175 ) ( not ( = ?auto_2142180 ?auto_2142178 ) ) ( ON ?auto_2142168 ?auto_2142167 ) ( ON ?auto_2142169 ?auto_2142168 ) ( ON ?auto_2142166 ?auto_2142169 ) ( ON ?auto_2142170 ?auto_2142166 ) ( ON ?auto_2142172 ?auto_2142170 ) ( ON ?auto_2142171 ?auto_2142172 ) ( ON ?auto_2142173 ?auto_2142171 ) ( not ( = ?auto_2142167 ?auto_2142168 ) ) ( not ( = ?auto_2142167 ?auto_2142169 ) ) ( not ( = ?auto_2142167 ?auto_2142166 ) ) ( not ( = ?auto_2142167 ?auto_2142170 ) ) ( not ( = ?auto_2142167 ?auto_2142172 ) ) ( not ( = ?auto_2142167 ?auto_2142171 ) ) ( not ( = ?auto_2142167 ?auto_2142173 ) ) ( not ( = ?auto_2142167 ?auto_2142174 ) ) ( not ( = ?auto_2142167 ?auto_2142175 ) ) ( not ( = ?auto_2142168 ?auto_2142169 ) ) ( not ( = ?auto_2142168 ?auto_2142166 ) ) ( not ( = ?auto_2142168 ?auto_2142170 ) ) ( not ( = ?auto_2142168 ?auto_2142172 ) ) ( not ( = ?auto_2142168 ?auto_2142171 ) ) ( not ( = ?auto_2142168 ?auto_2142173 ) ) ( not ( = ?auto_2142168 ?auto_2142174 ) ) ( not ( = ?auto_2142168 ?auto_2142175 ) ) ( not ( = ?auto_2142169 ?auto_2142166 ) ) ( not ( = ?auto_2142169 ?auto_2142170 ) ) ( not ( = ?auto_2142169 ?auto_2142172 ) ) ( not ( = ?auto_2142169 ?auto_2142171 ) ) ( not ( = ?auto_2142169 ?auto_2142173 ) ) ( not ( = ?auto_2142169 ?auto_2142174 ) ) ( not ( = ?auto_2142169 ?auto_2142175 ) ) ( not ( = ?auto_2142166 ?auto_2142170 ) ) ( not ( = ?auto_2142166 ?auto_2142172 ) ) ( not ( = ?auto_2142166 ?auto_2142171 ) ) ( not ( = ?auto_2142166 ?auto_2142173 ) ) ( not ( = ?auto_2142166 ?auto_2142174 ) ) ( not ( = ?auto_2142166 ?auto_2142175 ) ) ( not ( = ?auto_2142170 ?auto_2142172 ) ) ( not ( = ?auto_2142170 ?auto_2142171 ) ) ( not ( = ?auto_2142170 ?auto_2142173 ) ) ( not ( = ?auto_2142170 ?auto_2142174 ) ) ( not ( = ?auto_2142170 ?auto_2142175 ) ) ( not ( = ?auto_2142172 ?auto_2142171 ) ) ( not ( = ?auto_2142172 ?auto_2142173 ) ) ( not ( = ?auto_2142172 ?auto_2142174 ) ) ( not ( = ?auto_2142172 ?auto_2142175 ) ) ( not ( = ?auto_2142171 ?auto_2142173 ) ) ( not ( = ?auto_2142171 ?auto_2142174 ) ) ( not ( = ?auto_2142171 ?auto_2142175 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2142173 ?auto_2142174 ?auto_2142175 )
      ( MAKE-9CRATE-VERIFY ?auto_2142167 ?auto_2142168 ?auto_2142169 ?auto_2142166 ?auto_2142170 ?auto_2142172 ?auto_2142171 ?auto_2142173 ?auto_2142174 ?auto_2142175 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2142275 - SURFACE
      ?auto_2142276 - SURFACE
      ?auto_2142277 - SURFACE
      ?auto_2142274 - SURFACE
      ?auto_2142278 - SURFACE
      ?auto_2142280 - SURFACE
      ?auto_2142279 - SURFACE
      ?auto_2142281 - SURFACE
      ?auto_2142282 - SURFACE
      ?auto_2142283 - SURFACE
    )
    :vars
    (
      ?auto_2142287 - HOIST
      ?auto_2142285 - PLACE
      ?auto_2142289 - TRUCK
      ?auto_2142286 - PLACE
      ?auto_2142284 - HOIST
      ?auto_2142288 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2142287 ?auto_2142285 ) ( SURFACE-AT ?auto_2142282 ?auto_2142285 ) ( CLEAR ?auto_2142282 ) ( IS-CRATE ?auto_2142283 ) ( not ( = ?auto_2142282 ?auto_2142283 ) ) ( AVAILABLE ?auto_2142287 ) ( ON ?auto_2142282 ?auto_2142281 ) ( not ( = ?auto_2142281 ?auto_2142282 ) ) ( not ( = ?auto_2142281 ?auto_2142283 ) ) ( TRUCK-AT ?auto_2142289 ?auto_2142286 ) ( not ( = ?auto_2142286 ?auto_2142285 ) ) ( HOIST-AT ?auto_2142284 ?auto_2142286 ) ( not ( = ?auto_2142287 ?auto_2142284 ) ) ( AVAILABLE ?auto_2142284 ) ( SURFACE-AT ?auto_2142283 ?auto_2142286 ) ( ON ?auto_2142283 ?auto_2142288 ) ( CLEAR ?auto_2142283 ) ( not ( = ?auto_2142282 ?auto_2142288 ) ) ( not ( = ?auto_2142283 ?auto_2142288 ) ) ( not ( = ?auto_2142281 ?auto_2142288 ) ) ( ON ?auto_2142276 ?auto_2142275 ) ( ON ?auto_2142277 ?auto_2142276 ) ( ON ?auto_2142274 ?auto_2142277 ) ( ON ?auto_2142278 ?auto_2142274 ) ( ON ?auto_2142280 ?auto_2142278 ) ( ON ?auto_2142279 ?auto_2142280 ) ( ON ?auto_2142281 ?auto_2142279 ) ( not ( = ?auto_2142275 ?auto_2142276 ) ) ( not ( = ?auto_2142275 ?auto_2142277 ) ) ( not ( = ?auto_2142275 ?auto_2142274 ) ) ( not ( = ?auto_2142275 ?auto_2142278 ) ) ( not ( = ?auto_2142275 ?auto_2142280 ) ) ( not ( = ?auto_2142275 ?auto_2142279 ) ) ( not ( = ?auto_2142275 ?auto_2142281 ) ) ( not ( = ?auto_2142275 ?auto_2142282 ) ) ( not ( = ?auto_2142275 ?auto_2142283 ) ) ( not ( = ?auto_2142275 ?auto_2142288 ) ) ( not ( = ?auto_2142276 ?auto_2142277 ) ) ( not ( = ?auto_2142276 ?auto_2142274 ) ) ( not ( = ?auto_2142276 ?auto_2142278 ) ) ( not ( = ?auto_2142276 ?auto_2142280 ) ) ( not ( = ?auto_2142276 ?auto_2142279 ) ) ( not ( = ?auto_2142276 ?auto_2142281 ) ) ( not ( = ?auto_2142276 ?auto_2142282 ) ) ( not ( = ?auto_2142276 ?auto_2142283 ) ) ( not ( = ?auto_2142276 ?auto_2142288 ) ) ( not ( = ?auto_2142277 ?auto_2142274 ) ) ( not ( = ?auto_2142277 ?auto_2142278 ) ) ( not ( = ?auto_2142277 ?auto_2142280 ) ) ( not ( = ?auto_2142277 ?auto_2142279 ) ) ( not ( = ?auto_2142277 ?auto_2142281 ) ) ( not ( = ?auto_2142277 ?auto_2142282 ) ) ( not ( = ?auto_2142277 ?auto_2142283 ) ) ( not ( = ?auto_2142277 ?auto_2142288 ) ) ( not ( = ?auto_2142274 ?auto_2142278 ) ) ( not ( = ?auto_2142274 ?auto_2142280 ) ) ( not ( = ?auto_2142274 ?auto_2142279 ) ) ( not ( = ?auto_2142274 ?auto_2142281 ) ) ( not ( = ?auto_2142274 ?auto_2142282 ) ) ( not ( = ?auto_2142274 ?auto_2142283 ) ) ( not ( = ?auto_2142274 ?auto_2142288 ) ) ( not ( = ?auto_2142278 ?auto_2142280 ) ) ( not ( = ?auto_2142278 ?auto_2142279 ) ) ( not ( = ?auto_2142278 ?auto_2142281 ) ) ( not ( = ?auto_2142278 ?auto_2142282 ) ) ( not ( = ?auto_2142278 ?auto_2142283 ) ) ( not ( = ?auto_2142278 ?auto_2142288 ) ) ( not ( = ?auto_2142280 ?auto_2142279 ) ) ( not ( = ?auto_2142280 ?auto_2142281 ) ) ( not ( = ?auto_2142280 ?auto_2142282 ) ) ( not ( = ?auto_2142280 ?auto_2142283 ) ) ( not ( = ?auto_2142280 ?auto_2142288 ) ) ( not ( = ?auto_2142279 ?auto_2142281 ) ) ( not ( = ?auto_2142279 ?auto_2142282 ) ) ( not ( = ?auto_2142279 ?auto_2142283 ) ) ( not ( = ?auto_2142279 ?auto_2142288 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2142281 ?auto_2142282 ?auto_2142283 )
      ( MAKE-9CRATE-VERIFY ?auto_2142275 ?auto_2142276 ?auto_2142277 ?auto_2142274 ?auto_2142278 ?auto_2142280 ?auto_2142279 ?auto_2142281 ?auto_2142282 ?auto_2142283 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2142384 - SURFACE
      ?auto_2142385 - SURFACE
      ?auto_2142386 - SURFACE
      ?auto_2142383 - SURFACE
      ?auto_2142387 - SURFACE
      ?auto_2142389 - SURFACE
      ?auto_2142388 - SURFACE
      ?auto_2142390 - SURFACE
      ?auto_2142391 - SURFACE
      ?auto_2142392 - SURFACE
    )
    :vars
    (
      ?auto_2142393 - HOIST
      ?auto_2142395 - PLACE
      ?auto_2142398 - PLACE
      ?auto_2142394 - HOIST
      ?auto_2142396 - SURFACE
      ?auto_2142397 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2142393 ?auto_2142395 ) ( SURFACE-AT ?auto_2142391 ?auto_2142395 ) ( CLEAR ?auto_2142391 ) ( IS-CRATE ?auto_2142392 ) ( not ( = ?auto_2142391 ?auto_2142392 ) ) ( AVAILABLE ?auto_2142393 ) ( ON ?auto_2142391 ?auto_2142390 ) ( not ( = ?auto_2142390 ?auto_2142391 ) ) ( not ( = ?auto_2142390 ?auto_2142392 ) ) ( not ( = ?auto_2142398 ?auto_2142395 ) ) ( HOIST-AT ?auto_2142394 ?auto_2142398 ) ( not ( = ?auto_2142393 ?auto_2142394 ) ) ( AVAILABLE ?auto_2142394 ) ( SURFACE-AT ?auto_2142392 ?auto_2142398 ) ( ON ?auto_2142392 ?auto_2142396 ) ( CLEAR ?auto_2142392 ) ( not ( = ?auto_2142391 ?auto_2142396 ) ) ( not ( = ?auto_2142392 ?auto_2142396 ) ) ( not ( = ?auto_2142390 ?auto_2142396 ) ) ( TRUCK-AT ?auto_2142397 ?auto_2142395 ) ( ON ?auto_2142385 ?auto_2142384 ) ( ON ?auto_2142386 ?auto_2142385 ) ( ON ?auto_2142383 ?auto_2142386 ) ( ON ?auto_2142387 ?auto_2142383 ) ( ON ?auto_2142389 ?auto_2142387 ) ( ON ?auto_2142388 ?auto_2142389 ) ( ON ?auto_2142390 ?auto_2142388 ) ( not ( = ?auto_2142384 ?auto_2142385 ) ) ( not ( = ?auto_2142384 ?auto_2142386 ) ) ( not ( = ?auto_2142384 ?auto_2142383 ) ) ( not ( = ?auto_2142384 ?auto_2142387 ) ) ( not ( = ?auto_2142384 ?auto_2142389 ) ) ( not ( = ?auto_2142384 ?auto_2142388 ) ) ( not ( = ?auto_2142384 ?auto_2142390 ) ) ( not ( = ?auto_2142384 ?auto_2142391 ) ) ( not ( = ?auto_2142384 ?auto_2142392 ) ) ( not ( = ?auto_2142384 ?auto_2142396 ) ) ( not ( = ?auto_2142385 ?auto_2142386 ) ) ( not ( = ?auto_2142385 ?auto_2142383 ) ) ( not ( = ?auto_2142385 ?auto_2142387 ) ) ( not ( = ?auto_2142385 ?auto_2142389 ) ) ( not ( = ?auto_2142385 ?auto_2142388 ) ) ( not ( = ?auto_2142385 ?auto_2142390 ) ) ( not ( = ?auto_2142385 ?auto_2142391 ) ) ( not ( = ?auto_2142385 ?auto_2142392 ) ) ( not ( = ?auto_2142385 ?auto_2142396 ) ) ( not ( = ?auto_2142386 ?auto_2142383 ) ) ( not ( = ?auto_2142386 ?auto_2142387 ) ) ( not ( = ?auto_2142386 ?auto_2142389 ) ) ( not ( = ?auto_2142386 ?auto_2142388 ) ) ( not ( = ?auto_2142386 ?auto_2142390 ) ) ( not ( = ?auto_2142386 ?auto_2142391 ) ) ( not ( = ?auto_2142386 ?auto_2142392 ) ) ( not ( = ?auto_2142386 ?auto_2142396 ) ) ( not ( = ?auto_2142383 ?auto_2142387 ) ) ( not ( = ?auto_2142383 ?auto_2142389 ) ) ( not ( = ?auto_2142383 ?auto_2142388 ) ) ( not ( = ?auto_2142383 ?auto_2142390 ) ) ( not ( = ?auto_2142383 ?auto_2142391 ) ) ( not ( = ?auto_2142383 ?auto_2142392 ) ) ( not ( = ?auto_2142383 ?auto_2142396 ) ) ( not ( = ?auto_2142387 ?auto_2142389 ) ) ( not ( = ?auto_2142387 ?auto_2142388 ) ) ( not ( = ?auto_2142387 ?auto_2142390 ) ) ( not ( = ?auto_2142387 ?auto_2142391 ) ) ( not ( = ?auto_2142387 ?auto_2142392 ) ) ( not ( = ?auto_2142387 ?auto_2142396 ) ) ( not ( = ?auto_2142389 ?auto_2142388 ) ) ( not ( = ?auto_2142389 ?auto_2142390 ) ) ( not ( = ?auto_2142389 ?auto_2142391 ) ) ( not ( = ?auto_2142389 ?auto_2142392 ) ) ( not ( = ?auto_2142389 ?auto_2142396 ) ) ( not ( = ?auto_2142388 ?auto_2142390 ) ) ( not ( = ?auto_2142388 ?auto_2142391 ) ) ( not ( = ?auto_2142388 ?auto_2142392 ) ) ( not ( = ?auto_2142388 ?auto_2142396 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2142390 ?auto_2142391 ?auto_2142392 )
      ( MAKE-9CRATE-VERIFY ?auto_2142384 ?auto_2142385 ?auto_2142386 ?auto_2142383 ?auto_2142387 ?auto_2142389 ?auto_2142388 ?auto_2142390 ?auto_2142391 ?auto_2142392 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2142493 - SURFACE
      ?auto_2142494 - SURFACE
      ?auto_2142495 - SURFACE
      ?auto_2142492 - SURFACE
      ?auto_2142496 - SURFACE
      ?auto_2142498 - SURFACE
      ?auto_2142497 - SURFACE
      ?auto_2142499 - SURFACE
      ?auto_2142500 - SURFACE
      ?auto_2142501 - SURFACE
    )
    :vars
    (
      ?auto_2142504 - HOIST
      ?auto_2142506 - PLACE
      ?auto_2142503 - PLACE
      ?auto_2142502 - HOIST
      ?auto_2142505 - SURFACE
      ?auto_2142507 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2142504 ?auto_2142506 ) ( IS-CRATE ?auto_2142501 ) ( not ( = ?auto_2142500 ?auto_2142501 ) ) ( not ( = ?auto_2142499 ?auto_2142500 ) ) ( not ( = ?auto_2142499 ?auto_2142501 ) ) ( not ( = ?auto_2142503 ?auto_2142506 ) ) ( HOIST-AT ?auto_2142502 ?auto_2142503 ) ( not ( = ?auto_2142504 ?auto_2142502 ) ) ( AVAILABLE ?auto_2142502 ) ( SURFACE-AT ?auto_2142501 ?auto_2142503 ) ( ON ?auto_2142501 ?auto_2142505 ) ( CLEAR ?auto_2142501 ) ( not ( = ?auto_2142500 ?auto_2142505 ) ) ( not ( = ?auto_2142501 ?auto_2142505 ) ) ( not ( = ?auto_2142499 ?auto_2142505 ) ) ( TRUCK-AT ?auto_2142507 ?auto_2142506 ) ( SURFACE-AT ?auto_2142499 ?auto_2142506 ) ( CLEAR ?auto_2142499 ) ( LIFTING ?auto_2142504 ?auto_2142500 ) ( IS-CRATE ?auto_2142500 ) ( ON ?auto_2142494 ?auto_2142493 ) ( ON ?auto_2142495 ?auto_2142494 ) ( ON ?auto_2142492 ?auto_2142495 ) ( ON ?auto_2142496 ?auto_2142492 ) ( ON ?auto_2142498 ?auto_2142496 ) ( ON ?auto_2142497 ?auto_2142498 ) ( ON ?auto_2142499 ?auto_2142497 ) ( not ( = ?auto_2142493 ?auto_2142494 ) ) ( not ( = ?auto_2142493 ?auto_2142495 ) ) ( not ( = ?auto_2142493 ?auto_2142492 ) ) ( not ( = ?auto_2142493 ?auto_2142496 ) ) ( not ( = ?auto_2142493 ?auto_2142498 ) ) ( not ( = ?auto_2142493 ?auto_2142497 ) ) ( not ( = ?auto_2142493 ?auto_2142499 ) ) ( not ( = ?auto_2142493 ?auto_2142500 ) ) ( not ( = ?auto_2142493 ?auto_2142501 ) ) ( not ( = ?auto_2142493 ?auto_2142505 ) ) ( not ( = ?auto_2142494 ?auto_2142495 ) ) ( not ( = ?auto_2142494 ?auto_2142492 ) ) ( not ( = ?auto_2142494 ?auto_2142496 ) ) ( not ( = ?auto_2142494 ?auto_2142498 ) ) ( not ( = ?auto_2142494 ?auto_2142497 ) ) ( not ( = ?auto_2142494 ?auto_2142499 ) ) ( not ( = ?auto_2142494 ?auto_2142500 ) ) ( not ( = ?auto_2142494 ?auto_2142501 ) ) ( not ( = ?auto_2142494 ?auto_2142505 ) ) ( not ( = ?auto_2142495 ?auto_2142492 ) ) ( not ( = ?auto_2142495 ?auto_2142496 ) ) ( not ( = ?auto_2142495 ?auto_2142498 ) ) ( not ( = ?auto_2142495 ?auto_2142497 ) ) ( not ( = ?auto_2142495 ?auto_2142499 ) ) ( not ( = ?auto_2142495 ?auto_2142500 ) ) ( not ( = ?auto_2142495 ?auto_2142501 ) ) ( not ( = ?auto_2142495 ?auto_2142505 ) ) ( not ( = ?auto_2142492 ?auto_2142496 ) ) ( not ( = ?auto_2142492 ?auto_2142498 ) ) ( not ( = ?auto_2142492 ?auto_2142497 ) ) ( not ( = ?auto_2142492 ?auto_2142499 ) ) ( not ( = ?auto_2142492 ?auto_2142500 ) ) ( not ( = ?auto_2142492 ?auto_2142501 ) ) ( not ( = ?auto_2142492 ?auto_2142505 ) ) ( not ( = ?auto_2142496 ?auto_2142498 ) ) ( not ( = ?auto_2142496 ?auto_2142497 ) ) ( not ( = ?auto_2142496 ?auto_2142499 ) ) ( not ( = ?auto_2142496 ?auto_2142500 ) ) ( not ( = ?auto_2142496 ?auto_2142501 ) ) ( not ( = ?auto_2142496 ?auto_2142505 ) ) ( not ( = ?auto_2142498 ?auto_2142497 ) ) ( not ( = ?auto_2142498 ?auto_2142499 ) ) ( not ( = ?auto_2142498 ?auto_2142500 ) ) ( not ( = ?auto_2142498 ?auto_2142501 ) ) ( not ( = ?auto_2142498 ?auto_2142505 ) ) ( not ( = ?auto_2142497 ?auto_2142499 ) ) ( not ( = ?auto_2142497 ?auto_2142500 ) ) ( not ( = ?auto_2142497 ?auto_2142501 ) ) ( not ( = ?auto_2142497 ?auto_2142505 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2142499 ?auto_2142500 ?auto_2142501 )
      ( MAKE-9CRATE-VERIFY ?auto_2142493 ?auto_2142494 ?auto_2142495 ?auto_2142492 ?auto_2142496 ?auto_2142498 ?auto_2142497 ?auto_2142499 ?auto_2142500 ?auto_2142501 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2142602 - SURFACE
      ?auto_2142603 - SURFACE
      ?auto_2142604 - SURFACE
      ?auto_2142601 - SURFACE
      ?auto_2142605 - SURFACE
      ?auto_2142607 - SURFACE
      ?auto_2142606 - SURFACE
      ?auto_2142608 - SURFACE
      ?auto_2142609 - SURFACE
      ?auto_2142610 - SURFACE
    )
    :vars
    (
      ?auto_2142613 - HOIST
      ?auto_2142616 - PLACE
      ?auto_2142614 - PLACE
      ?auto_2142612 - HOIST
      ?auto_2142611 - SURFACE
      ?auto_2142615 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2142613 ?auto_2142616 ) ( IS-CRATE ?auto_2142610 ) ( not ( = ?auto_2142609 ?auto_2142610 ) ) ( not ( = ?auto_2142608 ?auto_2142609 ) ) ( not ( = ?auto_2142608 ?auto_2142610 ) ) ( not ( = ?auto_2142614 ?auto_2142616 ) ) ( HOIST-AT ?auto_2142612 ?auto_2142614 ) ( not ( = ?auto_2142613 ?auto_2142612 ) ) ( AVAILABLE ?auto_2142612 ) ( SURFACE-AT ?auto_2142610 ?auto_2142614 ) ( ON ?auto_2142610 ?auto_2142611 ) ( CLEAR ?auto_2142610 ) ( not ( = ?auto_2142609 ?auto_2142611 ) ) ( not ( = ?auto_2142610 ?auto_2142611 ) ) ( not ( = ?auto_2142608 ?auto_2142611 ) ) ( TRUCK-AT ?auto_2142615 ?auto_2142616 ) ( SURFACE-AT ?auto_2142608 ?auto_2142616 ) ( CLEAR ?auto_2142608 ) ( IS-CRATE ?auto_2142609 ) ( AVAILABLE ?auto_2142613 ) ( IN ?auto_2142609 ?auto_2142615 ) ( ON ?auto_2142603 ?auto_2142602 ) ( ON ?auto_2142604 ?auto_2142603 ) ( ON ?auto_2142601 ?auto_2142604 ) ( ON ?auto_2142605 ?auto_2142601 ) ( ON ?auto_2142607 ?auto_2142605 ) ( ON ?auto_2142606 ?auto_2142607 ) ( ON ?auto_2142608 ?auto_2142606 ) ( not ( = ?auto_2142602 ?auto_2142603 ) ) ( not ( = ?auto_2142602 ?auto_2142604 ) ) ( not ( = ?auto_2142602 ?auto_2142601 ) ) ( not ( = ?auto_2142602 ?auto_2142605 ) ) ( not ( = ?auto_2142602 ?auto_2142607 ) ) ( not ( = ?auto_2142602 ?auto_2142606 ) ) ( not ( = ?auto_2142602 ?auto_2142608 ) ) ( not ( = ?auto_2142602 ?auto_2142609 ) ) ( not ( = ?auto_2142602 ?auto_2142610 ) ) ( not ( = ?auto_2142602 ?auto_2142611 ) ) ( not ( = ?auto_2142603 ?auto_2142604 ) ) ( not ( = ?auto_2142603 ?auto_2142601 ) ) ( not ( = ?auto_2142603 ?auto_2142605 ) ) ( not ( = ?auto_2142603 ?auto_2142607 ) ) ( not ( = ?auto_2142603 ?auto_2142606 ) ) ( not ( = ?auto_2142603 ?auto_2142608 ) ) ( not ( = ?auto_2142603 ?auto_2142609 ) ) ( not ( = ?auto_2142603 ?auto_2142610 ) ) ( not ( = ?auto_2142603 ?auto_2142611 ) ) ( not ( = ?auto_2142604 ?auto_2142601 ) ) ( not ( = ?auto_2142604 ?auto_2142605 ) ) ( not ( = ?auto_2142604 ?auto_2142607 ) ) ( not ( = ?auto_2142604 ?auto_2142606 ) ) ( not ( = ?auto_2142604 ?auto_2142608 ) ) ( not ( = ?auto_2142604 ?auto_2142609 ) ) ( not ( = ?auto_2142604 ?auto_2142610 ) ) ( not ( = ?auto_2142604 ?auto_2142611 ) ) ( not ( = ?auto_2142601 ?auto_2142605 ) ) ( not ( = ?auto_2142601 ?auto_2142607 ) ) ( not ( = ?auto_2142601 ?auto_2142606 ) ) ( not ( = ?auto_2142601 ?auto_2142608 ) ) ( not ( = ?auto_2142601 ?auto_2142609 ) ) ( not ( = ?auto_2142601 ?auto_2142610 ) ) ( not ( = ?auto_2142601 ?auto_2142611 ) ) ( not ( = ?auto_2142605 ?auto_2142607 ) ) ( not ( = ?auto_2142605 ?auto_2142606 ) ) ( not ( = ?auto_2142605 ?auto_2142608 ) ) ( not ( = ?auto_2142605 ?auto_2142609 ) ) ( not ( = ?auto_2142605 ?auto_2142610 ) ) ( not ( = ?auto_2142605 ?auto_2142611 ) ) ( not ( = ?auto_2142607 ?auto_2142606 ) ) ( not ( = ?auto_2142607 ?auto_2142608 ) ) ( not ( = ?auto_2142607 ?auto_2142609 ) ) ( not ( = ?auto_2142607 ?auto_2142610 ) ) ( not ( = ?auto_2142607 ?auto_2142611 ) ) ( not ( = ?auto_2142606 ?auto_2142608 ) ) ( not ( = ?auto_2142606 ?auto_2142609 ) ) ( not ( = ?auto_2142606 ?auto_2142610 ) ) ( not ( = ?auto_2142606 ?auto_2142611 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2142608 ?auto_2142609 ?auto_2142610 )
      ( MAKE-9CRATE-VERIFY ?auto_2142602 ?auto_2142603 ?auto_2142604 ?auto_2142601 ?auto_2142605 ?auto_2142607 ?auto_2142606 ?auto_2142608 ?auto_2142609 ?auto_2142610 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2143419 - SURFACE
      ?auto_2143420 - SURFACE
    )
    :vars
    (
      ?auto_2143424 - HOIST
      ?auto_2143423 - PLACE
      ?auto_2143421 - SURFACE
      ?auto_2143425 - PLACE
      ?auto_2143422 - HOIST
      ?auto_2143427 - SURFACE
      ?auto_2143426 - TRUCK
      ?auto_2143428 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2143424 ?auto_2143423 ) ( SURFACE-AT ?auto_2143419 ?auto_2143423 ) ( CLEAR ?auto_2143419 ) ( IS-CRATE ?auto_2143420 ) ( not ( = ?auto_2143419 ?auto_2143420 ) ) ( ON ?auto_2143419 ?auto_2143421 ) ( not ( = ?auto_2143421 ?auto_2143419 ) ) ( not ( = ?auto_2143421 ?auto_2143420 ) ) ( not ( = ?auto_2143425 ?auto_2143423 ) ) ( HOIST-AT ?auto_2143422 ?auto_2143425 ) ( not ( = ?auto_2143424 ?auto_2143422 ) ) ( AVAILABLE ?auto_2143422 ) ( SURFACE-AT ?auto_2143420 ?auto_2143425 ) ( ON ?auto_2143420 ?auto_2143427 ) ( CLEAR ?auto_2143420 ) ( not ( = ?auto_2143419 ?auto_2143427 ) ) ( not ( = ?auto_2143420 ?auto_2143427 ) ) ( not ( = ?auto_2143421 ?auto_2143427 ) ) ( TRUCK-AT ?auto_2143426 ?auto_2143423 ) ( LIFTING ?auto_2143424 ?auto_2143428 ) ( IS-CRATE ?auto_2143428 ) ( not ( = ?auto_2143419 ?auto_2143428 ) ) ( not ( = ?auto_2143420 ?auto_2143428 ) ) ( not ( = ?auto_2143421 ?auto_2143428 ) ) ( not ( = ?auto_2143427 ?auto_2143428 ) ) )
    :subtasks
    ( ( !LOAD ?auto_2143424 ?auto_2143428 ?auto_2143426 ?auto_2143423 )
      ( MAKE-1CRATE ?auto_2143419 ?auto_2143420 )
      ( MAKE-1CRATE-VERIFY ?auto_2143419 ?auto_2143420 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2148151 - SURFACE
      ?auto_2148152 - SURFACE
      ?auto_2148153 - SURFACE
      ?auto_2148150 - SURFACE
      ?auto_2148154 - SURFACE
      ?auto_2148156 - SURFACE
      ?auto_2148155 - SURFACE
      ?auto_2148157 - SURFACE
      ?auto_2148158 - SURFACE
      ?auto_2148159 - SURFACE
      ?auto_2148160 - SURFACE
    )
    :vars
    (
      ?auto_2148162 - HOIST
      ?auto_2148161 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2148162 ?auto_2148161 ) ( SURFACE-AT ?auto_2148159 ?auto_2148161 ) ( CLEAR ?auto_2148159 ) ( LIFTING ?auto_2148162 ?auto_2148160 ) ( IS-CRATE ?auto_2148160 ) ( not ( = ?auto_2148159 ?auto_2148160 ) ) ( ON ?auto_2148152 ?auto_2148151 ) ( ON ?auto_2148153 ?auto_2148152 ) ( ON ?auto_2148150 ?auto_2148153 ) ( ON ?auto_2148154 ?auto_2148150 ) ( ON ?auto_2148156 ?auto_2148154 ) ( ON ?auto_2148155 ?auto_2148156 ) ( ON ?auto_2148157 ?auto_2148155 ) ( ON ?auto_2148158 ?auto_2148157 ) ( ON ?auto_2148159 ?auto_2148158 ) ( not ( = ?auto_2148151 ?auto_2148152 ) ) ( not ( = ?auto_2148151 ?auto_2148153 ) ) ( not ( = ?auto_2148151 ?auto_2148150 ) ) ( not ( = ?auto_2148151 ?auto_2148154 ) ) ( not ( = ?auto_2148151 ?auto_2148156 ) ) ( not ( = ?auto_2148151 ?auto_2148155 ) ) ( not ( = ?auto_2148151 ?auto_2148157 ) ) ( not ( = ?auto_2148151 ?auto_2148158 ) ) ( not ( = ?auto_2148151 ?auto_2148159 ) ) ( not ( = ?auto_2148151 ?auto_2148160 ) ) ( not ( = ?auto_2148152 ?auto_2148153 ) ) ( not ( = ?auto_2148152 ?auto_2148150 ) ) ( not ( = ?auto_2148152 ?auto_2148154 ) ) ( not ( = ?auto_2148152 ?auto_2148156 ) ) ( not ( = ?auto_2148152 ?auto_2148155 ) ) ( not ( = ?auto_2148152 ?auto_2148157 ) ) ( not ( = ?auto_2148152 ?auto_2148158 ) ) ( not ( = ?auto_2148152 ?auto_2148159 ) ) ( not ( = ?auto_2148152 ?auto_2148160 ) ) ( not ( = ?auto_2148153 ?auto_2148150 ) ) ( not ( = ?auto_2148153 ?auto_2148154 ) ) ( not ( = ?auto_2148153 ?auto_2148156 ) ) ( not ( = ?auto_2148153 ?auto_2148155 ) ) ( not ( = ?auto_2148153 ?auto_2148157 ) ) ( not ( = ?auto_2148153 ?auto_2148158 ) ) ( not ( = ?auto_2148153 ?auto_2148159 ) ) ( not ( = ?auto_2148153 ?auto_2148160 ) ) ( not ( = ?auto_2148150 ?auto_2148154 ) ) ( not ( = ?auto_2148150 ?auto_2148156 ) ) ( not ( = ?auto_2148150 ?auto_2148155 ) ) ( not ( = ?auto_2148150 ?auto_2148157 ) ) ( not ( = ?auto_2148150 ?auto_2148158 ) ) ( not ( = ?auto_2148150 ?auto_2148159 ) ) ( not ( = ?auto_2148150 ?auto_2148160 ) ) ( not ( = ?auto_2148154 ?auto_2148156 ) ) ( not ( = ?auto_2148154 ?auto_2148155 ) ) ( not ( = ?auto_2148154 ?auto_2148157 ) ) ( not ( = ?auto_2148154 ?auto_2148158 ) ) ( not ( = ?auto_2148154 ?auto_2148159 ) ) ( not ( = ?auto_2148154 ?auto_2148160 ) ) ( not ( = ?auto_2148156 ?auto_2148155 ) ) ( not ( = ?auto_2148156 ?auto_2148157 ) ) ( not ( = ?auto_2148156 ?auto_2148158 ) ) ( not ( = ?auto_2148156 ?auto_2148159 ) ) ( not ( = ?auto_2148156 ?auto_2148160 ) ) ( not ( = ?auto_2148155 ?auto_2148157 ) ) ( not ( = ?auto_2148155 ?auto_2148158 ) ) ( not ( = ?auto_2148155 ?auto_2148159 ) ) ( not ( = ?auto_2148155 ?auto_2148160 ) ) ( not ( = ?auto_2148157 ?auto_2148158 ) ) ( not ( = ?auto_2148157 ?auto_2148159 ) ) ( not ( = ?auto_2148157 ?auto_2148160 ) ) ( not ( = ?auto_2148158 ?auto_2148159 ) ) ( not ( = ?auto_2148158 ?auto_2148160 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2148159 ?auto_2148160 )
      ( MAKE-10CRATE-VERIFY ?auto_2148151 ?auto_2148152 ?auto_2148153 ?auto_2148150 ?auto_2148154 ?auto_2148156 ?auto_2148155 ?auto_2148157 ?auto_2148158 ?auto_2148159 ?auto_2148160 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2148245 - SURFACE
      ?auto_2148246 - SURFACE
      ?auto_2148247 - SURFACE
      ?auto_2148244 - SURFACE
      ?auto_2148248 - SURFACE
      ?auto_2148250 - SURFACE
      ?auto_2148249 - SURFACE
      ?auto_2148251 - SURFACE
      ?auto_2148252 - SURFACE
      ?auto_2148253 - SURFACE
      ?auto_2148254 - SURFACE
    )
    :vars
    (
      ?auto_2148255 - HOIST
      ?auto_2148256 - PLACE
      ?auto_2148257 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2148255 ?auto_2148256 ) ( SURFACE-AT ?auto_2148253 ?auto_2148256 ) ( CLEAR ?auto_2148253 ) ( IS-CRATE ?auto_2148254 ) ( not ( = ?auto_2148253 ?auto_2148254 ) ) ( TRUCK-AT ?auto_2148257 ?auto_2148256 ) ( AVAILABLE ?auto_2148255 ) ( IN ?auto_2148254 ?auto_2148257 ) ( ON ?auto_2148253 ?auto_2148252 ) ( not ( = ?auto_2148252 ?auto_2148253 ) ) ( not ( = ?auto_2148252 ?auto_2148254 ) ) ( ON ?auto_2148246 ?auto_2148245 ) ( ON ?auto_2148247 ?auto_2148246 ) ( ON ?auto_2148244 ?auto_2148247 ) ( ON ?auto_2148248 ?auto_2148244 ) ( ON ?auto_2148250 ?auto_2148248 ) ( ON ?auto_2148249 ?auto_2148250 ) ( ON ?auto_2148251 ?auto_2148249 ) ( ON ?auto_2148252 ?auto_2148251 ) ( not ( = ?auto_2148245 ?auto_2148246 ) ) ( not ( = ?auto_2148245 ?auto_2148247 ) ) ( not ( = ?auto_2148245 ?auto_2148244 ) ) ( not ( = ?auto_2148245 ?auto_2148248 ) ) ( not ( = ?auto_2148245 ?auto_2148250 ) ) ( not ( = ?auto_2148245 ?auto_2148249 ) ) ( not ( = ?auto_2148245 ?auto_2148251 ) ) ( not ( = ?auto_2148245 ?auto_2148252 ) ) ( not ( = ?auto_2148245 ?auto_2148253 ) ) ( not ( = ?auto_2148245 ?auto_2148254 ) ) ( not ( = ?auto_2148246 ?auto_2148247 ) ) ( not ( = ?auto_2148246 ?auto_2148244 ) ) ( not ( = ?auto_2148246 ?auto_2148248 ) ) ( not ( = ?auto_2148246 ?auto_2148250 ) ) ( not ( = ?auto_2148246 ?auto_2148249 ) ) ( not ( = ?auto_2148246 ?auto_2148251 ) ) ( not ( = ?auto_2148246 ?auto_2148252 ) ) ( not ( = ?auto_2148246 ?auto_2148253 ) ) ( not ( = ?auto_2148246 ?auto_2148254 ) ) ( not ( = ?auto_2148247 ?auto_2148244 ) ) ( not ( = ?auto_2148247 ?auto_2148248 ) ) ( not ( = ?auto_2148247 ?auto_2148250 ) ) ( not ( = ?auto_2148247 ?auto_2148249 ) ) ( not ( = ?auto_2148247 ?auto_2148251 ) ) ( not ( = ?auto_2148247 ?auto_2148252 ) ) ( not ( = ?auto_2148247 ?auto_2148253 ) ) ( not ( = ?auto_2148247 ?auto_2148254 ) ) ( not ( = ?auto_2148244 ?auto_2148248 ) ) ( not ( = ?auto_2148244 ?auto_2148250 ) ) ( not ( = ?auto_2148244 ?auto_2148249 ) ) ( not ( = ?auto_2148244 ?auto_2148251 ) ) ( not ( = ?auto_2148244 ?auto_2148252 ) ) ( not ( = ?auto_2148244 ?auto_2148253 ) ) ( not ( = ?auto_2148244 ?auto_2148254 ) ) ( not ( = ?auto_2148248 ?auto_2148250 ) ) ( not ( = ?auto_2148248 ?auto_2148249 ) ) ( not ( = ?auto_2148248 ?auto_2148251 ) ) ( not ( = ?auto_2148248 ?auto_2148252 ) ) ( not ( = ?auto_2148248 ?auto_2148253 ) ) ( not ( = ?auto_2148248 ?auto_2148254 ) ) ( not ( = ?auto_2148250 ?auto_2148249 ) ) ( not ( = ?auto_2148250 ?auto_2148251 ) ) ( not ( = ?auto_2148250 ?auto_2148252 ) ) ( not ( = ?auto_2148250 ?auto_2148253 ) ) ( not ( = ?auto_2148250 ?auto_2148254 ) ) ( not ( = ?auto_2148249 ?auto_2148251 ) ) ( not ( = ?auto_2148249 ?auto_2148252 ) ) ( not ( = ?auto_2148249 ?auto_2148253 ) ) ( not ( = ?auto_2148249 ?auto_2148254 ) ) ( not ( = ?auto_2148251 ?auto_2148252 ) ) ( not ( = ?auto_2148251 ?auto_2148253 ) ) ( not ( = ?auto_2148251 ?auto_2148254 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2148252 ?auto_2148253 ?auto_2148254 )
      ( MAKE-10CRATE-VERIFY ?auto_2148245 ?auto_2148246 ?auto_2148247 ?auto_2148244 ?auto_2148248 ?auto_2148250 ?auto_2148249 ?auto_2148251 ?auto_2148252 ?auto_2148253 ?auto_2148254 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2148350 - SURFACE
      ?auto_2148351 - SURFACE
      ?auto_2148352 - SURFACE
      ?auto_2148349 - SURFACE
      ?auto_2148353 - SURFACE
      ?auto_2148355 - SURFACE
      ?auto_2148354 - SURFACE
      ?auto_2148356 - SURFACE
      ?auto_2148357 - SURFACE
      ?auto_2148358 - SURFACE
      ?auto_2148359 - SURFACE
    )
    :vars
    (
      ?auto_2148360 - HOIST
      ?auto_2148363 - PLACE
      ?auto_2148361 - TRUCK
      ?auto_2148362 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2148360 ?auto_2148363 ) ( SURFACE-AT ?auto_2148358 ?auto_2148363 ) ( CLEAR ?auto_2148358 ) ( IS-CRATE ?auto_2148359 ) ( not ( = ?auto_2148358 ?auto_2148359 ) ) ( AVAILABLE ?auto_2148360 ) ( IN ?auto_2148359 ?auto_2148361 ) ( ON ?auto_2148358 ?auto_2148357 ) ( not ( = ?auto_2148357 ?auto_2148358 ) ) ( not ( = ?auto_2148357 ?auto_2148359 ) ) ( TRUCK-AT ?auto_2148361 ?auto_2148362 ) ( not ( = ?auto_2148362 ?auto_2148363 ) ) ( ON ?auto_2148351 ?auto_2148350 ) ( ON ?auto_2148352 ?auto_2148351 ) ( ON ?auto_2148349 ?auto_2148352 ) ( ON ?auto_2148353 ?auto_2148349 ) ( ON ?auto_2148355 ?auto_2148353 ) ( ON ?auto_2148354 ?auto_2148355 ) ( ON ?auto_2148356 ?auto_2148354 ) ( ON ?auto_2148357 ?auto_2148356 ) ( not ( = ?auto_2148350 ?auto_2148351 ) ) ( not ( = ?auto_2148350 ?auto_2148352 ) ) ( not ( = ?auto_2148350 ?auto_2148349 ) ) ( not ( = ?auto_2148350 ?auto_2148353 ) ) ( not ( = ?auto_2148350 ?auto_2148355 ) ) ( not ( = ?auto_2148350 ?auto_2148354 ) ) ( not ( = ?auto_2148350 ?auto_2148356 ) ) ( not ( = ?auto_2148350 ?auto_2148357 ) ) ( not ( = ?auto_2148350 ?auto_2148358 ) ) ( not ( = ?auto_2148350 ?auto_2148359 ) ) ( not ( = ?auto_2148351 ?auto_2148352 ) ) ( not ( = ?auto_2148351 ?auto_2148349 ) ) ( not ( = ?auto_2148351 ?auto_2148353 ) ) ( not ( = ?auto_2148351 ?auto_2148355 ) ) ( not ( = ?auto_2148351 ?auto_2148354 ) ) ( not ( = ?auto_2148351 ?auto_2148356 ) ) ( not ( = ?auto_2148351 ?auto_2148357 ) ) ( not ( = ?auto_2148351 ?auto_2148358 ) ) ( not ( = ?auto_2148351 ?auto_2148359 ) ) ( not ( = ?auto_2148352 ?auto_2148349 ) ) ( not ( = ?auto_2148352 ?auto_2148353 ) ) ( not ( = ?auto_2148352 ?auto_2148355 ) ) ( not ( = ?auto_2148352 ?auto_2148354 ) ) ( not ( = ?auto_2148352 ?auto_2148356 ) ) ( not ( = ?auto_2148352 ?auto_2148357 ) ) ( not ( = ?auto_2148352 ?auto_2148358 ) ) ( not ( = ?auto_2148352 ?auto_2148359 ) ) ( not ( = ?auto_2148349 ?auto_2148353 ) ) ( not ( = ?auto_2148349 ?auto_2148355 ) ) ( not ( = ?auto_2148349 ?auto_2148354 ) ) ( not ( = ?auto_2148349 ?auto_2148356 ) ) ( not ( = ?auto_2148349 ?auto_2148357 ) ) ( not ( = ?auto_2148349 ?auto_2148358 ) ) ( not ( = ?auto_2148349 ?auto_2148359 ) ) ( not ( = ?auto_2148353 ?auto_2148355 ) ) ( not ( = ?auto_2148353 ?auto_2148354 ) ) ( not ( = ?auto_2148353 ?auto_2148356 ) ) ( not ( = ?auto_2148353 ?auto_2148357 ) ) ( not ( = ?auto_2148353 ?auto_2148358 ) ) ( not ( = ?auto_2148353 ?auto_2148359 ) ) ( not ( = ?auto_2148355 ?auto_2148354 ) ) ( not ( = ?auto_2148355 ?auto_2148356 ) ) ( not ( = ?auto_2148355 ?auto_2148357 ) ) ( not ( = ?auto_2148355 ?auto_2148358 ) ) ( not ( = ?auto_2148355 ?auto_2148359 ) ) ( not ( = ?auto_2148354 ?auto_2148356 ) ) ( not ( = ?auto_2148354 ?auto_2148357 ) ) ( not ( = ?auto_2148354 ?auto_2148358 ) ) ( not ( = ?auto_2148354 ?auto_2148359 ) ) ( not ( = ?auto_2148356 ?auto_2148357 ) ) ( not ( = ?auto_2148356 ?auto_2148358 ) ) ( not ( = ?auto_2148356 ?auto_2148359 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2148357 ?auto_2148358 ?auto_2148359 )
      ( MAKE-10CRATE-VERIFY ?auto_2148350 ?auto_2148351 ?auto_2148352 ?auto_2148349 ?auto_2148353 ?auto_2148355 ?auto_2148354 ?auto_2148356 ?auto_2148357 ?auto_2148358 ?auto_2148359 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2148465 - SURFACE
      ?auto_2148466 - SURFACE
      ?auto_2148467 - SURFACE
      ?auto_2148464 - SURFACE
      ?auto_2148468 - SURFACE
      ?auto_2148470 - SURFACE
      ?auto_2148469 - SURFACE
      ?auto_2148471 - SURFACE
      ?auto_2148472 - SURFACE
      ?auto_2148473 - SURFACE
      ?auto_2148474 - SURFACE
    )
    :vars
    (
      ?auto_2148477 - HOIST
      ?auto_2148475 - PLACE
      ?auto_2148476 - TRUCK
      ?auto_2148478 - PLACE
      ?auto_2148479 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2148477 ?auto_2148475 ) ( SURFACE-AT ?auto_2148473 ?auto_2148475 ) ( CLEAR ?auto_2148473 ) ( IS-CRATE ?auto_2148474 ) ( not ( = ?auto_2148473 ?auto_2148474 ) ) ( AVAILABLE ?auto_2148477 ) ( ON ?auto_2148473 ?auto_2148472 ) ( not ( = ?auto_2148472 ?auto_2148473 ) ) ( not ( = ?auto_2148472 ?auto_2148474 ) ) ( TRUCK-AT ?auto_2148476 ?auto_2148478 ) ( not ( = ?auto_2148478 ?auto_2148475 ) ) ( HOIST-AT ?auto_2148479 ?auto_2148478 ) ( LIFTING ?auto_2148479 ?auto_2148474 ) ( not ( = ?auto_2148477 ?auto_2148479 ) ) ( ON ?auto_2148466 ?auto_2148465 ) ( ON ?auto_2148467 ?auto_2148466 ) ( ON ?auto_2148464 ?auto_2148467 ) ( ON ?auto_2148468 ?auto_2148464 ) ( ON ?auto_2148470 ?auto_2148468 ) ( ON ?auto_2148469 ?auto_2148470 ) ( ON ?auto_2148471 ?auto_2148469 ) ( ON ?auto_2148472 ?auto_2148471 ) ( not ( = ?auto_2148465 ?auto_2148466 ) ) ( not ( = ?auto_2148465 ?auto_2148467 ) ) ( not ( = ?auto_2148465 ?auto_2148464 ) ) ( not ( = ?auto_2148465 ?auto_2148468 ) ) ( not ( = ?auto_2148465 ?auto_2148470 ) ) ( not ( = ?auto_2148465 ?auto_2148469 ) ) ( not ( = ?auto_2148465 ?auto_2148471 ) ) ( not ( = ?auto_2148465 ?auto_2148472 ) ) ( not ( = ?auto_2148465 ?auto_2148473 ) ) ( not ( = ?auto_2148465 ?auto_2148474 ) ) ( not ( = ?auto_2148466 ?auto_2148467 ) ) ( not ( = ?auto_2148466 ?auto_2148464 ) ) ( not ( = ?auto_2148466 ?auto_2148468 ) ) ( not ( = ?auto_2148466 ?auto_2148470 ) ) ( not ( = ?auto_2148466 ?auto_2148469 ) ) ( not ( = ?auto_2148466 ?auto_2148471 ) ) ( not ( = ?auto_2148466 ?auto_2148472 ) ) ( not ( = ?auto_2148466 ?auto_2148473 ) ) ( not ( = ?auto_2148466 ?auto_2148474 ) ) ( not ( = ?auto_2148467 ?auto_2148464 ) ) ( not ( = ?auto_2148467 ?auto_2148468 ) ) ( not ( = ?auto_2148467 ?auto_2148470 ) ) ( not ( = ?auto_2148467 ?auto_2148469 ) ) ( not ( = ?auto_2148467 ?auto_2148471 ) ) ( not ( = ?auto_2148467 ?auto_2148472 ) ) ( not ( = ?auto_2148467 ?auto_2148473 ) ) ( not ( = ?auto_2148467 ?auto_2148474 ) ) ( not ( = ?auto_2148464 ?auto_2148468 ) ) ( not ( = ?auto_2148464 ?auto_2148470 ) ) ( not ( = ?auto_2148464 ?auto_2148469 ) ) ( not ( = ?auto_2148464 ?auto_2148471 ) ) ( not ( = ?auto_2148464 ?auto_2148472 ) ) ( not ( = ?auto_2148464 ?auto_2148473 ) ) ( not ( = ?auto_2148464 ?auto_2148474 ) ) ( not ( = ?auto_2148468 ?auto_2148470 ) ) ( not ( = ?auto_2148468 ?auto_2148469 ) ) ( not ( = ?auto_2148468 ?auto_2148471 ) ) ( not ( = ?auto_2148468 ?auto_2148472 ) ) ( not ( = ?auto_2148468 ?auto_2148473 ) ) ( not ( = ?auto_2148468 ?auto_2148474 ) ) ( not ( = ?auto_2148470 ?auto_2148469 ) ) ( not ( = ?auto_2148470 ?auto_2148471 ) ) ( not ( = ?auto_2148470 ?auto_2148472 ) ) ( not ( = ?auto_2148470 ?auto_2148473 ) ) ( not ( = ?auto_2148470 ?auto_2148474 ) ) ( not ( = ?auto_2148469 ?auto_2148471 ) ) ( not ( = ?auto_2148469 ?auto_2148472 ) ) ( not ( = ?auto_2148469 ?auto_2148473 ) ) ( not ( = ?auto_2148469 ?auto_2148474 ) ) ( not ( = ?auto_2148471 ?auto_2148472 ) ) ( not ( = ?auto_2148471 ?auto_2148473 ) ) ( not ( = ?auto_2148471 ?auto_2148474 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2148472 ?auto_2148473 ?auto_2148474 )
      ( MAKE-10CRATE-VERIFY ?auto_2148465 ?auto_2148466 ?auto_2148467 ?auto_2148464 ?auto_2148468 ?auto_2148470 ?auto_2148469 ?auto_2148471 ?auto_2148472 ?auto_2148473 ?auto_2148474 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2148590 - SURFACE
      ?auto_2148591 - SURFACE
      ?auto_2148592 - SURFACE
      ?auto_2148589 - SURFACE
      ?auto_2148593 - SURFACE
      ?auto_2148595 - SURFACE
      ?auto_2148594 - SURFACE
      ?auto_2148596 - SURFACE
      ?auto_2148597 - SURFACE
      ?auto_2148598 - SURFACE
      ?auto_2148599 - SURFACE
    )
    :vars
    (
      ?auto_2148603 - HOIST
      ?auto_2148605 - PLACE
      ?auto_2148602 - TRUCK
      ?auto_2148600 - PLACE
      ?auto_2148601 - HOIST
      ?auto_2148604 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2148603 ?auto_2148605 ) ( SURFACE-AT ?auto_2148598 ?auto_2148605 ) ( CLEAR ?auto_2148598 ) ( IS-CRATE ?auto_2148599 ) ( not ( = ?auto_2148598 ?auto_2148599 ) ) ( AVAILABLE ?auto_2148603 ) ( ON ?auto_2148598 ?auto_2148597 ) ( not ( = ?auto_2148597 ?auto_2148598 ) ) ( not ( = ?auto_2148597 ?auto_2148599 ) ) ( TRUCK-AT ?auto_2148602 ?auto_2148600 ) ( not ( = ?auto_2148600 ?auto_2148605 ) ) ( HOIST-AT ?auto_2148601 ?auto_2148600 ) ( not ( = ?auto_2148603 ?auto_2148601 ) ) ( AVAILABLE ?auto_2148601 ) ( SURFACE-AT ?auto_2148599 ?auto_2148600 ) ( ON ?auto_2148599 ?auto_2148604 ) ( CLEAR ?auto_2148599 ) ( not ( = ?auto_2148598 ?auto_2148604 ) ) ( not ( = ?auto_2148599 ?auto_2148604 ) ) ( not ( = ?auto_2148597 ?auto_2148604 ) ) ( ON ?auto_2148591 ?auto_2148590 ) ( ON ?auto_2148592 ?auto_2148591 ) ( ON ?auto_2148589 ?auto_2148592 ) ( ON ?auto_2148593 ?auto_2148589 ) ( ON ?auto_2148595 ?auto_2148593 ) ( ON ?auto_2148594 ?auto_2148595 ) ( ON ?auto_2148596 ?auto_2148594 ) ( ON ?auto_2148597 ?auto_2148596 ) ( not ( = ?auto_2148590 ?auto_2148591 ) ) ( not ( = ?auto_2148590 ?auto_2148592 ) ) ( not ( = ?auto_2148590 ?auto_2148589 ) ) ( not ( = ?auto_2148590 ?auto_2148593 ) ) ( not ( = ?auto_2148590 ?auto_2148595 ) ) ( not ( = ?auto_2148590 ?auto_2148594 ) ) ( not ( = ?auto_2148590 ?auto_2148596 ) ) ( not ( = ?auto_2148590 ?auto_2148597 ) ) ( not ( = ?auto_2148590 ?auto_2148598 ) ) ( not ( = ?auto_2148590 ?auto_2148599 ) ) ( not ( = ?auto_2148590 ?auto_2148604 ) ) ( not ( = ?auto_2148591 ?auto_2148592 ) ) ( not ( = ?auto_2148591 ?auto_2148589 ) ) ( not ( = ?auto_2148591 ?auto_2148593 ) ) ( not ( = ?auto_2148591 ?auto_2148595 ) ) ( not ( = ?auto_2148591 ?auto_2148594 ) ) ( not ( = ?auto_2148591 ?auto_2148596 ) ) ( not ( = ?auto_2148591 ?auto_2148597 ) ) ( not ( = ?auto_2148591 ?auto_2148598 ) ) ( not ( = ?auto_2148591 ?auto_2148599 ) ) ( not ( = ?auto_2148591 ?auto_2148604 ) ) ( not ( = ?auto_2148592 ?auto_2148589 ) ) ( not ( = ?auto_2148592 ?auto_2148593 ) ) ( not ( = ?auto_2148592 ?auto_2148595 ) ) ( not ( = ?auto_2148592 ?auto_2148594 ) ) ( not ( = ?auto_2148592 ?auto_2148596 ) ) ( not ( = ?auto_2148592 ?auto_2148597 ) ) ( not ( = ?auto_2148592 ?auto_2148598 ) ) ( not ( = ?auto_2148592 ?auto_2148599 ) ) ( not ( = ?auto_2148592 ?auto_2148604 ) ) ( not ( = ?auto_2148589 ?auto_2148593 ) ) ( not ( = ?auto_2148589 ?auto_2148595 ) ) ( not ( = ?auto_2148589 ?auto_2148594 ) ) ( not ( = ?auto_2148589 ?auto_2148596 ) ) ( not ( = ?auto_2148589 ?auto_2148597 ) ) ( not ( = ?auto_2148589 ?auto_2148598 ) ) ( not ( = ?auto_2148589 ?auto_2148599 ) ) ( not ( = ?auto_2148589 ?auto_2148604 ) ) ( not ( = ?auto_2148593 ?auto_2148595 ) ) ( not ( = ?auto_2148593 ?auto_2148594 ) ) ( not ( = ?auto_2148593 ?auto_2148596 ) ) ( not ( = ?auto_2148593 ?auto_2148597 ) ) ( not ( = ?auto_2148593 ?auto_2148598 ) ) ( not ( = ?auto_2148593 ?auto_2148599 ) ) ( not ( = ?auto_2148593 ?auto_2148604 ) ) ( not ( = ?auto_2148595 ?auto_2148594 ) ) ( not ( = ?auto_2148595 ?auto_2148596 ) ) ( not ( = ?auto_2148595 ?auto_2148597 ) ) ( not ( = ?auto_2148595 ?auto_2148598 ) ) ( not ( = ?auto_2148595 ?auto_2148599 ) ) ( not ( = ?auto_2148595 ?auto_2148604 ) ) ( not ( = ?auto_2148594 ?auto_2148596 ) ) ( not ( = ?auto_2148594 ?auto_2148597 ) ) ( not ( = ?auto_2148594 ?auto_2148598 ) ) ( not ( = ?auto_2148594 ?auto_2148599 ) ) ( not ( = ?auto_2148594 ?auto_2148604 ) ) ( not ( = ?auto_2148596 ?auto_2148597 ) ) ( not ( = ?auto_2148596 ?auto_2148598 ) ) ( not ( = ?auto_2148596 ?auto_2148599 ) ) ( not ( = ?auto_2148596 ?auto_2148604 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2148597 ?auto_2148598 ?auto_2148599 )
      ( MAKE-10CRATE-VERIFY ?auto_2148590 ?auto_2148591 ?auto_2148592 ?auto_2148589 ?auto_2148593 ?auto_2148595 ?auto_2148594 ?auto_2148596 ?auto_2148597 ?auto_2148598 ?auto_2148599 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2148716 - SURFACE
      ?auto_2148717 - SURFACE
      ?auto_2148718 - SURFACE
      ?auto_2148715 - SURFACE
      ?auto_2148719 - SURFACE
      ?auto_2148721 - SURFACE
      ?auto_2148720 - SURFACE
      ?auto_2148722 - SURFACE
      ?auto_2148723 - SURFACE
      ?auto_2148724 - SURFACE
      ?auto_2148725 - SURFACE
    )
    :vars
    (
      ?auto_2148731 - HOIST
      ?auto_2148727 - PLACE
      ?auto_2148729 - PLACE
      ?auto_2148730 - HOIST
      ?auto_2148726 - SURFACE
      ?auto_2148728 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2148731 ?auto_2148727 ) ( SURFACE-AT ?auto_2148724 ?auto_2148727 ) ( CLEAR ?auto_2148724 ) ( IS-CRATE ?auto_2148725 ) ( not ( = ?auto_2148724 ?auto_2148725 ) ) ( AVAILABLE ?auto_2148731 ) ( ON ?auto_2148724 ?auto_2148723 ) ( not ( = ?auto_2148723 ?auto_2148724 ) ) ( not ( = ?auto_2148723 ?auto_2148725 ) ) ( not ( = ?auto_2148729 ?auto_2148727 ) ) ( HOIST-AT ?auto_2148730 ?auto_2148729 ) ( not ( = ?auto_2148731 ?auto_2148730 ) ) ( AVAILABLE ?auto_2148730 ) ( SURFACE-AT ?auto_2148725 ?auto_2148729 ) ( ON ?auto_2148725 ?auto_2148726 ) ( CLEAR ?auto_2148725 ) ( not ( = ?auto_2148724 ?auto_2148726 ) ) ( not ( = ?auto_2148725 ?auto_2148726 ) ) ( not ( = ?auto_2148723 ?auto_2148726 ) ) ( TRUCK-AT ?auto_2148728 ?auto_2148727 ) ( ON ?auto_2148717 ?auto_2148716 ) ( ON ?auto_2148718 ?auto_2148717 ) ( ON ?auto_2148715 ?auto_2148718 ) ( ON ?auto_2148719 ?auto_2148715 ) ( ON ?auto_2148721 ?auto_2148719 ) ( ON ?auto_2148720 ?auto_2148721 ) ( ON ?auto_2148722 ?auto_2148720 ) ( ON ?auto_2148723 ?auto_2148722 ) ( not ( = ?auto_2148716 ?auto_2148717 ) ) ( not ( = ?auto_2148716 ?auto_2148718 ) ) ( not ( = ?auto_2148716 ?auto_2148715 ) ) ( not ( = ?auto_2148716 ?auto_2148719 ) ) ( not ( = ?auto_2148716 ?auto_2148721 ) ) ( not ( = ?auto_2148716 ?auto_2148720 ) ) ( not ( = ?auto_2148716 ?auto_2148722 ) ) ( not ( = ?auto_2148716 ?auto_2148723 ) ) ( not ( = ?auto_2148716 ?auto_2148724 ) ) ( not ( = ?auto_2148716 ?auto_2148725 ) ) ( not ( = ?auto_2148716 ?auto_2148726 ) ) ( not ( = ?auto_2148717 ?auto_2148718 ) ) ( not ( = ?auto_2148717 ?auto_2148715 ) ) ( not ( = ?auto_2148717 ?auto_2148719 ) ) ( not ( = ?auto_2148717 ?auto_2148721 ) ) ( not ( = ?auto_2148717 ?auto_2148720 ) ) ( not ( = ?auto_2148717 ?auto_2148722 ) ) ( not ( = ?auto_2148717 ?auto_2148723 ) ) ( not ( = ?auto_2148717 ?auto_2148724 ) ) ( not ( = ?auto_2148717 ?auto_2148725 ) ) ( not ( = ?auto_2148717 ?auto_2148726 ) ) ( not ( = ?auto_2148718 ?auto_2148715 ) ) ( not ( = ?auto_2148718 ?auto_2148719 ) ) ( not ( = ?auto_2148718 ?auto_2148721 ) ) ( not ( = ?auto_2148718 ?auto_2148720 ) ) ( not ( = ?auto_2148718 ?auto_2148722 ) ) ( not ( = ?auto_2148718 ?auto_2148723 ) ) ( not ( = ?auto_2148718 ?auto_2148724 ) ) ( not ( = ?auto_2148718 ?auto_2148725 ) ) ( not ( = ?auto_2148718 ?auto_2148726 ) ) ( not ( = ?auto_2148715 ?auto_2148719 ) ) ( not ( = ?auto_2148715 ?auto_2148721 ) ) ( not ( = ?auto_2148715 ?auto_2148720 ) ) ( not ( = ?auto_2148715 ?auto_2148722 ) ) ( not ( = ?auto_2148715 ?auto_2148723 ) ) ( not ( = ?auto_2148715 ?auto_2148724 ) ) ( not ( = ?auto_2148715 ?auto_2148725 ) ) ( not ( = ?auto_2148715 ?auto_2148726 ) ) ( not ( = ?auto_2148719 ?auto_2148721 ) ) ( not ( = ?auto_2148719 ?auto_2148720 ) ) ( not ( = ?auto_2148719 ?auto_2148722 ) ) ( not ( = ?auto_2148719 ?auto_2148723 ) ) ( not ( = ?auto_2148719 ?auto_2148724 ) ) ( not ( = ?auto_2148719 ?auto_2148725 ) ) ( not ( = ?auto_2148719 ?auto_2148726 ) ) ( not ( = ?auto_2148721 ?auto_2148720 ) ) ( not ( = ?auto_2148721 ?auto_2148722 ) ) ( not ( = ?auto_2148721 ?auto_2148723 ) ) ( not ( = ?auto_2148721 ?auto_2148724 ) ) ( not ( = ?auto_2148721 ?auto_2148725 ) ) ( not ( = ?auto_2148721 ?auto_2148726 ) ) ( not ( = ?auto_2148720 ?auto_2148722 ) ) ( not ( = ?auto_2148720 ?auto_2148723 ) ) ( not ( = ?auto_2148720 ?auto_2148724 ) ) ( not ( = ?auto_2148720 ?auto_2148725 ) ) ( not ( = ?auto_2148720 ?auto_2148726 ) ) ( not ( = ?auto_2148722 ?auto_2148723 ) ) ( not ( = ?auto_2148722 ?auto_2148724 ) ) ( not ( = ?auto_2148722 ?auto_2148725 ) ) ( not ( = ?auto_2148722 ?auto_2148726 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2148723 ?auto_2148724 ?auto_2148725 )
      ( MAKE-10CRATE-VERIFY ?auto_2148716 ?auto_2148717 ?auto_2148718 ?auto_2148715 ?auto_2148719 ?auto_2148721 ?auto_2148720 ?auto_2148722 ?auto_2148723 ?auto_2148724 ?auto_2148725 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2148842 - SURFACE
      ?auto_2148843 - SURFACE
      ?auto_2148844 - SURFACE
      ?auto_2148841 - SURFACE
      ?auto_2148845 - SURFACE
      ?auto_2148847 - SURFACE
      ?auto_2148846 - SURFACE
      ?auto_2148848 - SURFACE
      ?auto_2148849 - SURFACE
      ?auto_2148850 - SURFACE
      ?auto_2148851 - SURFACE
    )
    :vars
    (
      ?auto_2148852 - HOIST
      ?auto_2148854 - PLACE
      ?auto_2148855 - PLACE
      ?auto_2148856 - HOIST
      ?auto_2148853 - SURFACE
      ?auto_2148857 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2148852 ?auto_2148854 ) ( IS-CRATE ?auto_2148851 ) ( not ( = ?auto_2148850 ?auto_2148851 ) ) ( not ( = ?auto_2148849 ?auto_2148850 ) ) ( not ( = ?auto_2148849 ?auto_2148851 ) ) ( not ( = ?auto_2148855 ?auto_2148854 ) ) ( HOIST-AT ?auto_2148856 ?auto_2148855 ) ( not ( = ?auto_2148852 ?auto_2148856 ) ) ( AVAILABLE ?auto_2148856 ) ( SURFACE-AT ?auto_2148851 ?auto_2148855 ) ( ON ?auto_2148851 ?auto_2148853 ) ( CLEAR ?auto_2148851 ) ( not ( = ?auto_2148850 ?auto_2148853 ) ) ( not ( = ?auto_2148851 ?auto_2148853 ) ) ( not ( = ?auto_2148849 ?auto_2148853 ) ) ( TRUCK-AT ?auto_2148857 ?auto_2148854 ) ( SURFACE-AT ?auto_2148849 ?auto_2148854 ) ( CLEAR ?auto_2148849 ) ( LIFTING ?auto_2148852 ?auto_2148850 ) ( IS-CRATE ?auto_2148850 ) ( ON ?auto_2148843 ?auto_2148842 ) ( ON ?auto_2148844 ?auto_2148843 ) ( ON ?auto_2148841 ?auto_2148844 ) ( ON ?auto_2148845 ?auto_2148841 ) ( ON ?auto_2148847 ?auto_2148845 ) ( ON ?auto_2148846 ?auto_2148847 ) ( ON ?auto_2148848 ?auto_2148846 ) ( ON ?auto_2148849 ?auto_2148848 ) ( not ( = ?auto_2148842 ?auto_2148843 ) ) ( not ( = ?auto_2148842 ?auto_2148844 ) ) ( not ( = ?auto_2148842 ?auto_2148841 ) ) ( not ( = ?auto_2148842 ?auto_2148845 ) ) ( not ( = ?auto_2148842 ?auto_2148847 ) ) ( not ( = ?auto_2148842 ?auto_2148846 ) ) ( not ( = ?auto_2148842 ?auto_2148848 ) ) ( not ( = ?auto_2148842 ?auto_2148849 ) ) ( not ( = ?auto_2148842 ?auto_2148850 ) ) ( not ( = ?auto_2148842 ?auto_2148851 ) ) ( not ( = ?auto_2148842 ?auto_2148853 ) ) ( not ( = ?auto_2148843 ?auto_2148844 ) ) ( not ( = ?auto_2148843 ?auto_2148841 ) ) ( not ( = ?auto_2148843 ?auto_2148845 ) ) ( not ( = ?auto_2148843 ?auto_2148847 ) ) ( not ( = ?auto_2148843 ?auto_2148846 ) ) ( not ( = ?auto_2148843 ?auto_2148848 ) ) ( not ( = ?auto_2148843 ?auto_2148849 ) ) ( not ( = ?auto_2148843 ?auto_2148850 ) ) ( not ( = ?auto_2148843 ?auto_2148851 ) ) ( not ( = ?auto_2148843 ?auto_2148853 ) ) ( not ( = ?auto_2148844 ?auto_2148841 ) ) ( not ( = ?auto_2148844 ?auto_2148845 ) ) ( not ( = ?auto_2148844 ?auto_2148847 ) ) ( not ( = ?auto_2148844 ?auto_2148846 ) ) ( not ( = ?auto_2148844 ?auto_2148848 ) ) ( not ( = ?auto_2148844 ?auto_2148849 ) ) ( not ( = ?auto_2148844 ?auto_2148850 ) ) ( not ( = ?auto_2148844 ?auto_2148851 ) ) ( not ( = ?auto_2148844 ?auto_2148853 ) ) ( not ( = ?auto_2148841 ?auto_2148845 ) ) ( not ( = ?auto_2148841 ?auto_2148847 ) ) ( not ( = ?auto_2148841 ?auto_2148846 ) ) ( not ( = ?auto_2148841 ?auto_2148848 ) ) ( not ( = ?auto_2148841 ?auto_2148849 ) ) ( not ( = ?auto_2148841 ?auto_2148850 ) ) ( not ( = ?auto_2148841 ?auto_2148851 ) ) ( not ( = ?auto_2148841 ?auto_2148853 ) ) ( not ( = ?auto_2148845 ?auto_2148847 ) ) ( not ( = ?auto_2148845 ?auto_2148846 ) ) ( not ( = ?auto_2148845 ?auto_2148848 ) ) ( not ( = ?auto_2148845 ?auto_2148849 ) ) ( not ( = ?auto_2148845 ?auto_2148850 ) ) ( not ( = ?auto_2148845 ?auto_2148851 ) ) ( not ( = ?auto_2148845 ?auto_2148853 ) ) ( not ( = ?auto_2148847 ?auto_2148846 ) ) ( not ( = ?auto_2148847 ?auto_2148848 ) ) ( not ( = ?auto_2148847 ?auto_2148849 ) ) ( not ( = ?auto_2148847 ?auto_2148850 ) ) ( not ( = ?auto_2148847 ?auto_2148851 ) ) ( not ( = ?auto_2148847 ?auto_2148853 ) ) ( not ( = ?auto_2148846 ?auto_2148848 ) ) ( not ( = ?auto_2148846 ?auto_2148849 ) ) ( not ( = ?auto_2148846 ?auto_2148850 ) ) ( not ( = ?auto_2148846 ?auto_2148851 ) ) ( not ( = ?auto_2148846 ?auto_2148853 ) ) ( not ( = ?auto_2148848 ?auto_2148849 ) ) ( not ( = ?auto_2148848 ?auto_2148850 ) ) ( not ( = ?auto_2148848 ?auto_2148851 ) ) ( not ( = ?auto_2148848 ?auto_2148853 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2148849 ?auto_2148850 ?auto_2148851 )
      ( MAKE-10CRATE-VERIFY ?auto_2148842 ?auto_2148843 ?auto_2148844 ?auto_2148841 ?auto_2148845 ?auto_2148847 ?auto_2148846 ?auto_2148848 ?auto_2148849 ?auto_2148850 ?auto_2148851 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2148968 - SURFACE
      ?auto_2148969 - SURFACE
      ?auto_2148970 - SURFACE
      ?auto_2148967 - SURFACE
      ?auto_2148971 - SURFACE
      ?auto_2148973 - SURFACE
      ?auto_2148972 - SURFACE
      ?auto_2148974 - SURFACE
      ?auto_2148975 - SURFACE
      ?auto_2148976 - SURFACE
      ?auto_2148977 - SURFACE
    )
    :vars
    (
      ?auto_2148979 - HOIST
      ?auto_2148980 - PLACE
      ?auto_2148982 - PLACE
      ?auto_2148978 - HOIST
      ?auto_2148983 - SURFACE
      ?auto_2148981 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2148979 ?auto_2148980 ) ( IS-CRATE ?auto_2148977 ) ( not ( = ?auto_2148976 ?auto_2148977 ) ) ( not ( = ?auto_2148975 ?auto_2148976 ) ) ( not ( = ?auto_2148975 ?auto_2148977 ) ) ( not ( = ?auto_2148982 ?auto_2148980 ) ) ( HOIST-AT ?auto_2148978 ?auto_2148982 ) ( not ( = ?auto_2148979 ?auto_2148978 ) ) ( AVAILABLE ?auto_2148978 ) ( SURFACE-AT ?auto_2148977 ?auto_2148982 ) ( ON ?auto_2148977 ?auto_2148983 ) ( CLEAR ?auto_2148977 ) ( not ( = ?auto_2148976 ?auto_2148983 ) ) ( not ( = ?auto_2148977 ?auto_2148983 ) ) ( not ( = ?auto_2148975 ?auto_2148983 ) ) ( TRUCK-AT ?auto_2148981 ?auto_2148980 ) ( SURFACE-AT ?auto_2148975 ?auto_2148980 ) ( CLEAR ?auto_2148975 ) ( IS-CRATE ?auto_2148976 ) ( AVAILABLE ?auto_2148979 ) ( IN ?auto_2148976 ?auto_2148981 ) ( ON ?auto_2148969 ?auto_2148968 ) ( ON ?auto_2148970 ?auto_2148969 ) ( ON ?auto_2148967 ?auto_2148970 ) ( ON ?auto_2148971 ?auto_2148967 ) ( ON ?auto_2148973 ?auto_2148971 ) ( ON ?auto_2148972 ?auto_2148973 ) ( ON ?auto_2148974 ?auto_2148972 ) ( ON ?auto_2148975 ?auto_2148974 ) ( not ( = ?auto_2148968 ?auto_2148969 ) ) ( not ( = ?auto_2148968 ?auto_2148970 ) ) ( not ( = ?auto_2148968 ?auto_2148967 ) ) ( not ( = ?auto_2148968 ?auto_2148971 ) ) ( not ( = ?auto_2148968 ?auto_2148973 ) ) ( not ( = ?auto_2148968 ?auto_2148972 ) ) ( not ( = ?auto_2148968 ?auto_2148974 ) ) ( not ( = ?auto_2148968 ?auto_2148975 ) ) ( not ( = ?auto_2148968 ?auto_2148976 ) ) ( not ( = ?auto_2148968 ?auto_2148977 ) ) ( not ( = ?auto_2148968 ?auto_2148983 ) ) ( not ( = ?auto_2148969 ?auto_2148970 ) ) ( not ( = ?auto_2148969 ?auto_2148967 ) ) ( not ( = ?auto_2148969 ?auto_2148971 ) ) ( not ( = ?auto_2148969 ?auto_2148973 ) ) ( not ( = ?auto_2148969 ?auto_2148972 ) ) ( not ( = ?auto_2148969 ?auto_2148974 ) ) ( not ( = ?auto_2148969 ?auto_2148975 ) ) ( not ( = ?auto_2148969 ?auto_2148976 ) ) ( not ( = ?auto_2148969 ?auto_2148977 ) ) ( not ( = ?auto_2148969 ?auto_2148983 ) ) ( not ( = ?auto_2148970 ?auto_2148967 ) ) ( not ( = ?auto_2148970 ?auto_2148971 ) ) ( not ( = ?auto_2148970 ?auto_2148973 ) ) ( not ( = ?auto_2148970 ?auto_2148972 ) ) ( not ( = ?auto_2148970 ?auto_2148974 ) ) ( not ( = ?auto_2148970 ?auto_2148975 ) ) ( not ( = ?auto_2148970 ?auto_2148976 ) ) ( not ( = ?auto_2148970 ?auto_2148977 ) ) ( not ( = ?auto_2148970 ?auto_2148983 ) ) ( not ( = ?auto_2148967 ?auto_2148971 ) ) ( not ( = ?auto_2148967 ?auto_2148973 ) ) ( not ( = ?auto_2148967 ?auto_2148972 ) ) ( not ( = ?auto_2148967 ?auto_2148974 ) ) ( not ( = ?auto_2148967 ?auto_2148975 ) ) ( not ( = ?auto_2148967 ?auto_2148976 ) ) ( not ( = ?auto_2148967 ?auto_2148977 ) ) ( not ( = ?auto_2148967 ?auto_2148983 ) ) ( not ( = ?auto_2148971 ?auto_2148973 ) ) ( not ( = ?auto_2148971 ?auto_2148972 ) ) ( not ( = ?auto_2148971 ?auto_2148974 ) ) ( not ( = ?auto_2148971 ?auto_2148975 ) ) ( not ( = ?auto_2148971 ?auto_2148976 ) ) ( not ( = ?auto_2148971 ?auto_2148977 ) ) ( not ( = ?auto_2148971 ?auto_2148983 ) ) ( not ( = ?auto_2148973 ?auto_2148972 ) ) ( not ( = ?auto_2148973 ?auto_2148974 ) ) ( not ( = ?auto_2148973 ?auto_2148975 ) ) ( not ( = ?auto_2148973 ?auto_2148976 ) ) ( not ( = ?auto_2148973 ?auto_2148977 ) ) ( not ( = ?auto_2148973 ?auto_2148983 ) ) ( not ( = ?auto_2148972 ?auto_2148974 ) ) ( not ( = ?auto_2148972 ?auto_2148975 ) ) ( not ( = ?auto_2148972 ?auto_2148976 ) ) ( not ( = ?auto_2148972 ?auto_2148977 ) ) ( not ( = ?auto_2148972 ?auto_2148983 ) ) ( not ( = ?auto_2148974 ?auto_2148975 ) ) ( not ( = ?auto_2148974 ?auto_2148976 ) ) ( not ( = ?auto_2148974 ?auto_2148977 ) ) ( not ( = ?auto_2148974 ?auto_2148983 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2148975 ?auto_2148976 ?auto_2148977 )
      ( MAKE-10CRATE-VERIFY ?auto_2148968 ?auto_2148969 ?auto_2148970 ?auto_2148967 ?auto_2148971 ?auto_2148973 ?auto_2148972 ?auto_2148974 ?auto_2148975 ?auto_2148976 ?auto_2148977 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2156252 - SURFACE
      ?auto_2156253 - SURFACE
      ?auto_2156254 - SURFACE
      ?auto_2156251 - SURFACE
      ?auto_2156255 - SURFACE
      ?auto_2156257 - SURFACE
      ?auto_2156256 - SURFACE
      ?auto_2156258 - SURFACE
      ?auto_2156259 - SURFACE
      ?auto_2156260 - SURFACE
      ?auto_2156261 - SURFACE
      ?auto_2156262 - SURFACE
    )
    :vars
    (
      ?auto_2156264 - HOIST
      ?auto_2156263 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2156264 ?auto_2156263 ) ( SURFACE-AT ?auto_2156261 ?auto_2156263 ) ( CLEAR ?auto_2156261 ) ( LIFTING ?auto_2156264 ?auto_2156262 ) ( IS-CRATE ?auto_2156262 ) ( not ( = ?auto_2156261 ?auto_2156262 ) ) ( ON ?auto_2156253 ?auto_2156252 ) ( ON ?auto_2156254 ?auto_2156253 ) ( ON ?auto_2156251 ?auto_2156254 ) ( ON ?auto_2156255 ?auto_2156251 ) ( ON ?auto_2156257 ?auto_2156255 ) ( ON ?auto_2156256 ?auto_2156257 ) ( ON ?auto_2156258 ?auto_2156256 ) ( ON ?auto_2156259 ?auto_2156258 ) ( ON ?auto_2156260 ?auto_2156259 ) ( ON ?auto_2156261 ?auto_2156260 ) ( not ( = ?auto_2156252 ?auto_2156253 ) ) ( not ( = ?auto_2156252 ?auto_2156254 ) ) ( not ( = ?auto_2156252 ?auto_2156251 ) ) ( not ( = ?auto_2156252 ?auto_2156255 ) ) ( not ( = ?auto_2156252 ?auto_2156257 ) ) ( not ( = ?auto_2156252 ?auto_2156256 ) ) ( not ( = ?auto_2156252 ?auto_2156258 ) ) ( not ( = ?auto_2156252 ?auto_2156259 ) ) ( not ( = ?auto_2156252 ?auto_2156260 ) ) ( not ( = ?auto_2156252 ?auto_2156261 ) ) ( not ( = ?auto_2156252 ?auto_2156262 ) ) ( not ( = ?auto_2156253 ?auto_2156254 ) ) ( not ( = ?auto_2156253 ?auto_2156251 ) ) ( not ( = ?auto_2156253 ?auto_2156255 ) ) ( not ( = ?auto_2156253 ?auto_2156257 ) ) ( not ( = ?auto_2156253 ?auto_2156256 ) ) ( not ( = ?auto_2156253 ?auto_2156258 ) ) ( not ( = ?auto_2156253 ?auto_2156259 ) ) ( not ( = ?auto_2156253 ?auto_2156260 ) ) ( not ( = ?auto_2156253 ?auto_2156261 ) ) ( not ( = ?auto_2156253 ?auto_2156262 ) ) ( not ( = ?auto_2156254 ?auto_2156251 ) ) ( not ( = ?auto_2156254 ?auto_2156255 ) ) ( not ( = ?auto_2156254 ?auto_2156257 ) ) ( not ( = ?auto_2156254 ?auto_2156256 ) ) ( not ( = ?auto_2156254 ?auto_2156258 ) ) ( not ( = ?auto_2156254 ?auto_2156259 ) ) ( not ( = ?auto_2156254 ?auto_2156260 ) ) ( not ( = ?auto_2156254 ?auto_2156261 ) ) ( not ( = ?auto_2156254 ?auto_2156262 ) ) ( not ( = ?auto_2156251 ?auto_2156255 ) ) ( not ( = ?auto_2156251 ?auto_2156257 ) ) ( not ( = ?auto_2156251 ?auto_2156256 ) ) ( not ( = ?auto_2156251 ?auto_2156258 ) ) ( not ( = ?auto_2156251 ?auto_2156259 ) ) ( not ( = ?auto_2156251 ?auto_2156260 ) ) ( not ( = ?auto_2156251 ?auto_2156261 ) ) ( not ( = ?auto_2156251 ?auto_2156262 ) ) ( not ( = ?auto_2156255 ?auto_2156257 ) ) ( not ( = ?auto_2156255 ?auto_2156256 ) ) ( not ( = ?auto_2156255 ?auto_2156258 ) ) ( not ( = ?auto_2156255 ?auto_2156259 ) ) ( not ( = ?auto_2156255 ?auto_2156260 ) ) ( not ( = ?auto_2156255 ?auto_2156261 ) ) ( not ( = ?auto_2156255 ?auto_2156262 ) ) ( not ( = ?auto_2156257 ?auto_2156256 ) ) ( not ( = ?auto_2156257 ?auto_2156258 ) ) ( not ( = ?auto_2156257 ?auto_2156259 ) ) ( not ( = ?auto_2156257 ?auto_2156260 ) ) ( not ( = ?auto_2156257 ?auto_2156261 ) ) ( not ( = ?auto_2156257 ?auto_2156262 ) ) ( not ( = ?auto_2156256 ?auto_2156258 ) ) ( not ( = ?auto_2156256 ?auto_2156259 ) ) ( not ( = ?auto_2156256 ?auto_2156260 ) ) ( not ( = ?auto_2156256 ?auto_2156261 ) ) ( not ( = ?auto_2156256 ?auto_2156262 ) ) ( not ( = ?auto_2156258 ?auto_2156259 ) ) ( not ( = ?auto_2156258 ?auto_2156260 ) ) ( not ( = ?auto_2156258 ?auto_2156261 ) ) ( not ( = ?auto_2156258 ?auto_2156262 ) ) ( not ( = ?auto_2156259 ?auto_2156260 ) ) ( not ( = ?auto_2156259 ?auto_2156261 ) ) ( not ( = ?auto_2156259 ?auto_2156262 ) ) ( not ( = ?auto_2156260 ?auto_2156261 ) ) ( not ( = ?auto_2156260 ?auto_2156262 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2156261 ?auto_2156262 )
      ( MAKE-11CRATE-VERIFY ?auto_2156252 ?auto_2156253 ?auto_2156254 ?auto_2156251 ?auto_2156255 ?auto_2156257 ?auto_2156256 ?auto_2156258 ?auto_2156259 ?auto_2156260 ?auto_2156261 ?auto_2156262 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2156361 - SURFACE
      ?auto_2156362 - SURFACE
      ?auto_2156363 - SURFACE
      ?auto_2156360 - SURFACE
      ?auto_2156364 - SURFACE
      ?auto_2156366 - SURFACE
      ?auto_2156365 - SURFACE
      ?auto_2156367 - SURFACE
      ?auto_2156368 - SURFACE
      ?auto_2156369 - SURFACE
      ?auto_2156370 - SURFACE
      ?auto_2156371 - SURFACE
    )
    :vars
    (
      ?auto_2156372 - HOIST
      ?auto_2156374 - PLACE
      ?auto_2156373 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2156372 ?auto_2156374 ) ( SURFACE-AT ?auto_2156370 ?auto_2156374 ) ( CLEAR ?auto_2156370 ) ( IS-CRATE ?auto_2156371 ) ( not ( = ?auto_2156370 ?auto_2156371 ) ) ( TRUCK-AT ?auto_2156373 ?auto_2156374 ) ( AVAILABLE ?auto_2156372 ) ( IN ?auto_2156371 ?auto_2156373 ) ( ON ?auto_2156370 ?auto_2156369 ) ( not ( = ?auto_2156369 ?auto_2156370 ) ) ( not ( = ?auto_2156369 ?auto_2156371 ) ) ( ON ?auto_2156362 ?auto_2156361 ) ( ON ?auto_2156363 ?auto_2156362 ) ( ON ?auto_2156360 ?auto_2156363 ) ( ON ?auto_2156364 ?auto_2156360 ) ( ON ?auto_2156366 ?auto_2156364 ) ( ON ?auto_2156365 ?auto_2156366 ) ( ON ?auto_2156367 ?auto_2156365 ) ( ON ?auto_2156368 ?auto_2156367 ) ( ON ?auto_2156369 ?auto_2156368 ) ( not ( = ?auto_2156361 ?auto_2156362 ) ) ( not ( = ?auto_2156361 ?auto_2156363 ) ) ( not ( = ?auto_2156361 ?auto_2156360 ) ) ( not ( = ?auto_2156361 ?auto_2156364 ) ) ( not ( = ?auto_2156361 ?auto_2156366 ) ) ( not ( = ?auto_2156361 ?auto_2156365 ) ) ( not ( = ?auto_2156361 ?auto_2156367 ) ) ( not ( = ?auto_2156361 ?auto_2156368 ) ) ( not ( = ?auto_2156361 ?auto_2156369 ) ) ( not ( = ?auto_2156361 ?auto_2156370 ) ) ( not ( = ?auto_2156361 ?auto_2156371 ) ) ( not ( = ?auto_2156362 ?auto_2156363 ) ) ( not ( = ?auto_2156362 ?auto_2156360 ) ) ( not ( = ?auto_2156362 ?auto_2156364 ) ) ( not ( = ?auto_2156362 ?auto_2156366 ) ) ( not ( = ?auto_2156362 ?auto_2156365 ) ) ( not ( = ?auto_2156362 ?auto_2156367 ) ) ( not ( = ?auto_2156362 ?auto_2156368 ) ) ( not ( = ?auto_2156362 ?auto_2156369 ) ) ( not ( = ?auto_2156362 ?auto_2156370 ) ) ( not ( = ?auto_2156362 ?auto_2156371 ) ) ( not ( = ?auto_2156363 ?auto_2156360 ) ) ( not ( = ?auto_2156363 ?auto_2156364 ) ) ( not ( = ?auto_2156363 ?auto_2156366 ) ) ( not ( = ?auto_2156363 ?auto_2156365 ) ) ( not ( = ?auto_2156363 ?auto_2156367 ) ) ( not ( = ?auto_2156363 ?auto_2156368 ) ) ( not ( = ?auto_2156363 ?auto_2156369 ) ) ( not ( = ?auto_2156363 ?auto_2156370 ) ) ( not ( = ?auto_2156363 ?auto_2156371 ) ) ( not ( = ?auto_2156360 ?auto_2156364 ) ) ( not ( = ?auto_2156360 ?auto_2156366 ) ) ( not ( = ?auto_2156360 ?auto_2156365 ) ) ( not ( = ?auto_2156360 ?auto_2156367 ) ) ( not ( = ?auto_2156360 ?auto_2156368 ) ) ( not ( = ?auto_2156360 ?auto_2156369 ) ) ( not ( = ?auto_2156360 ?auto_2156370 ) ) ( not ( = ?auto_2156360 ?auto_2156371 ) ) ( not ( = ?auto_2156364 ?auto_2156366 ) ) ( not ( = ?auto_2156364 ?auto_2156365 ) ) ( not ( = ?auto_2156364 ?auto_2156367 ) ) ( not ( = ?auto_2156364 ?auto_2156368 ) ) ( not ( = ?auto_2156364 ?auto_2156369 ) ) ( not ( = ?auto_2156364 ?auto_2156370 ) ) ( not ( = ?auto_2156364 ?auto_2156371 ) ) ( not ( = ?auto_2156366 ?auto_2156365 ) ) ( not ( = ?auto_2156366 ?auto_2156367 ) ) ( not ( = ?auto_2156366 ?auto_2156368 ) ) ( not ( = ?auto_2156366 ?auto_2156369 ) ) ( not ( = ?auto_2156366 ?auto_2156370 ) ) ( not ( = ?auto_2156366 ?auto_2156371 ) ) ( not ( = ?auto_2156365 ?auto_2156367 ) ) ( not ( = ?auto_2156365 ?auto_2156368 ) ) ( not ( = ?auto_2156365 ?auto_2156369 ) ) ( not ( = ?auto_2156365 ?auto_2156370 ) ) ( not ( = ?auto_2156365 ?auto_2156371 ) ) ( not ( = ?auto_2156367 ?auto_2156368 ) ) ( not ( = ?auto_2156367 ?auto_2156369 ) ) ( not ( = ?auto_2156367 ?auto_2156370 ) ) ( not ( = ?auto_2156367 ?auto_2156371 ) ) ( not ( = ?auto_2156368 ?auto_2156369 ) ) ( not ( = ?auto_2156368 ?auto_2156370 ) ) ( not ( = ?auto_2156368 ?auto_2156371 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2156369 ?auto_2156370 ?auto_2156371 )
      ( MAKE-11CRATE-VERIFY ?auto_2156361 ?auto_2156362 ?auto_2156363 ?auto_2156360 ?auto_2156364 ?auto_2156366 ?auto_2156365 ?auto_2156367 ?auto_2156368 ?auto_2156369 ?auto_2156370 ?auto_2156371 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2156482 - SURFACE
      ?auto_2156483 - SURFACE
      ?auto_2156484 - SURFACE
      ?auto_2156481 - SURFACE
      ?auto_2156485 - SURFACE
      ?auto_2156487 - SURFACE
      ?auto_2156486 - SURFACE
      ?auto_2156488 - SURFACE
      ?auto_2156489 - SURFACE
      ?auto_2156490 - SURFACE
      ?auto_2156491 - SURFACE
      ?auto_2156492 - SURFACE
    )
    :vars
    (
      ?auto_2156496 - HOIST
      ?auto_2156494 - PLACE
      ?auto_2156493 - TRUCK
      ?auto_2156495 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2156496 ?auto_2156494 ) ( SURFACE-AT ?auto_2156491 ?auto_2156494 ) ( CLEAR ?auto_2156491 ) ( IS-CRATE ?auto_2156492 ) ( not ( = ?auto_2156491 ?auto_2156492 ) ) ( AVAILABLE ?auto_2156496 ) ( IN ?auto_2156492 ?auto_2156493 ) ( ON ?auto_2156491 ?auto_2156490 ) ( not ( = ?auto_2156490 ?auto_2156491 ) ) ( not ( = ?auto_2156490 ?auto_2156492 ) ) ( TRUCK-AT ?auto_2156493 ?auto_2156495 ) ( not ( = ?auto_2156495 ?auto_2156494 ) ) ( ON ?auto_2156483 ?auto_2156482 ) ( ON ?auto_2156484 ?auto_2156483 ) ( ON ?auto_2156481 ?auto_2156484 ) ( ON ?auto_2156485 ?auto_2156481 ) ( ON ?auto_2156487 ?auto_2156485 ) ( ON ?auto_2156486 ?auto_2156487 ) ( ON ?auto_2156488 ?auto_2156486 ) ( ON ?auto_2156489 ?auto_2156488 ) ( ON ?auto_2156490 ?auto_2156489 ) ( not ( = ?auto_2156482 ?auto_2156483 ) ) ( not ( = ?auto_2156482 ?auto_2156484 ) ) ( not ( = ?auto_2156482 ?auto_2156481 ) ) ( not ( = ?auto_2156482 ?auto_2156485 ) ) ( not ( = ?auto_2156482 ?auto_2156487 ) ) ( not ( = ?auto_2156482 ?auto_2156486 ) ) ( not ( = ?auto_2156482 ?auto_2156488 ) ) ( not ( = ?auto_2156482 ?auto_2156489 ) ) ( not ( = ?auto_2156482 ?auto_2156490 ) ) ( not ( = ?auto_2156482 ?auto_2156491 ) ) ( not ( = ?auto_2156482 ?auto_2156492 ) ) ( not ( = ?auto_2156483 ?auto_2156484 ) ) ( not ( = ?auto_2156483 ?auto_2156481 ) ) ( not ( = ?auto_2156483 ?auto_2156485 ) ) ( not ( = ?auto_2156483 ?auto_2156487 ) ) ( not ( = ?auto_2156483 ?auto_2156486 ) ) ( not ( = ?auto_2156483 ?auto_2156488 ) ) ( not ( = ?auto_2156483 ?auto_2156489 ) ) ( not ( = ?auto_2156483 ?auto_2156490 ) ) ( not ( = ?auto_2156483 ?auto_2156491 ) ) ( not ( = ?auto_2156483 ?auto_2156492 ) ) ( not ( = ?auto_2156484 ?auto_2156481 ) ) ( not ( = ?auto_2156484 ?auto_2156485 ) ) ( not ( = ?auto_2156484 ?auto_2156487 ) ) ( not ( = ?auto_2156484 ?auto_2156486 ) ) ( not ( = ?auto_2156484 ?auto_2156488 ) ) ( not ( = ?auto_2156484 ?auto_2156489 ) ) ( not ( = ?auto_2156484 ?auto_2156490 ) ) ( not ( = ?auto_2156484 ?auto_2156491 ) ) ( not ( = ?auto_2156484 ?auto_2156492 ) ) ( not ( = ?auto_2156481 ?auto_2156485 ) ) ( not ( = ?auto_2156481 ?auto_2156487 ) ) ( not ( = ?auto_2156481 ?auto_2156486 ) ) ( not ( = ?auto_2156481 ?auto_2156488 ) ) ( not ( = ?auto_2156481 ?auto_2156489 ) ) ( not ( = ?auto_2156481 ?auto_2156490 ) ) ( not ( = ?auto_2156481 ?auto_2156491 ) ) ( not ( = ?auto_2156481 ?auto_2156492 ) ) ( not ( = ?auto_2156485 ?auto_2156487 ) ) ( not ( = ?auto_2156485 ?auto_2156486 ) ) ( not ( = ?auto_2156485 ?auto_2156488 ) ) ( not ( = ?auto_2156485 ?auto_2156489 ) ) ( not ( = ?auto_2156485 ?auto_2156490 ) ) ( not ( = ?auto_2156485 ?auto_2156491 ) ) ( not ( = ?auto_2156485 ?auto_2156492 ) ) ( not ( = ?auto_2156487 ?auto_2156486 ) ) ( not ( = ?auto_2156487 ?auto_2156488 ) ) ( not ( = ?auto_2156487 ?auto_2156489 ) ) ( not ( = ?auto_2156487 ?auto_2156490 ) ) ( not ( = ?auto_2156487 ?auto_2156491 ) ) ( not ( = ?auto_2156487 ?auto_2156492 ) ) ( not ( = ?auto_2156486 ?auto_2156488 ) ) ( not ( = ?auto_2156486 ?auto_2156489 ) ) ( not ( = ?auto_2156486 ?auto_2156490 ) ) ( not ( = ?auto_2156486 ?auto_2156491 ) ) ( not ( = ?auto_2156486 ?auto_2156492 ) ) ( not ( = ?auto_2156488 ?auto_2156489 ) ) ( not ( = ?auto_2156488 ?auto_2156490 ) ) ( not ( = ?auto_2156488 ?auto_2156491 ) ) ( not ( = ?auto_2156488 ?auto_2156492 ) ) ( not ( = ?auto_2156489 ?auto_2156490 ) ) ( not ( = ?auto_2156489 ?auto_2156491 ) ) ( not ( = ?auto_2156489 ?auto_2156492 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2156490 ?auto_2156491 ?auto_2156492 )
      ( MAKE-11CRATE-VERIFY ?auto_2156482 ?auto_2156483 ?auto_2156484 ?auto_2156481 ?auto_2156485 ?auto_2156487 ?auto_2156486 ?auto_2156488 ?auto_2156489 ?auto_2156490 ?auto_2156491 ?auto_2156492 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2156614 - SURFACE
      ?auto_2156615 - SURFACE
      ?auto_2156616 - SURFACE
      ?auto_2156613 - SURFACE
      ?auto_2156617 - SURFACE
      ?auto_2156619 - SURFACE
      ?auto_2156618 - SURFACE
      ?auto_2156620 - SURFACE
      ?auto_2156621 - SURFACE
      ?auto_2156622 - SURFACE
      ?auto_2156623 - SURFACE
      ?auto_2156624 - SURFACE
    )
    :vars
    (
      ?auto_2156625 - HOIST
      ?auto_2156627 - PLACE
      ?auto_2156626 - TRUCK
      ?auto_2156628 - PLACE
      ?auto_2156629 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2156625 ?auto_2156627 ) ( SURFACE-AT ?auto_2156623 ?auto_2156627 ) ( CLEAR ?auto_2156623 ) ( IS-CRATE ?auto_2156624 ) ( not ( = ?auto_2156623 ?auto_2156624 ) ) ( AVAILABLE ?auto_2156625 ) ( ON ?auto_2156623 ?auto_2156622 ) ( not ( = ?auto_2156622 ?auto_2156623 ) ) ( not ( = ?auto_2156622 ?auto_2156624 ) ) ( TRUCK-AT ?auto_2156626 ?auto_2156628 ) ( not ( = ?auto_2156628 ?auto_2156627 ) ) ( HOIST-AT ?auto_2156629 ?auto_2156628 ) ( LIFTING ?auto_2156629 ?auto_2156624 ) ( not ( = ?auto_2156625 ?auto_2156629 ) ) ( ON ?auto_2156615 ?auto_2156614 ) ( ON ?auto_2156616 ?auto_2156615 ) ( ON ?auto_2156613 ?auto_2156616 ) ( ON ?auto_2156617 ?auto_2156613 ) ( ON ?auto_2156619 ?auto_2156617 ) ( ON ?auto_2156618 ?auto_2156619 ) ( ON ?auto_2156620 ?auto_2156618 ) ( ON ?auto_2156621 ?auto_2156620 ) ( ON ?auto_2156622 ?auto_2156621 ) ( not ( = ?auto_2156614 ?auto_2156615 ) ) ( not ( = ?auto_2156614 ?auto_2156616 ) ) ( not ( = ?auto_2156614 ?auto_2156613 ) ) ( not ( = ?auto_2156614 ?auto_2156617 ) ) ( not ( = ?auto_2156614 ?auto_2156619 ) ) ( not ( = ?auto_2156614 ?auto_2156618 ) ) ( not ( = ?auto_2156614 ?auto_2156620 ) ) ( not ( = ?auto_2156614 ?auto_2156621 ) ) ( not ( = ?auto_2156614 ?auto_2156622 ) ) ( not ( = ?auto_2156614 ?auto_2156623 ) ) ( not ( = ?auto_2156614 ?auto_2156624 ) ) ( not ( = ?auto_2156615 ?auto_2156616 ) ) ( not ( = ?auto_2156615 ?auto_2156613 ) ) ( not ( = ?auto_2156615 ?auto_2156617 ) ) ( not ( = ?auto_2156615 ?auto_2156619 ) ) ( not ( = ?auto_2156615 ?auto_2156618 ) ) ( not ( = ?auto_2156615 ?auto_2156620 ) ) ( not ( = ?auto_2156615 ?auto_2156621 ) ) ( not ( = ?auto_2156615 ?auto_2156622 ) ) ( not ( = ?auto_2156615 ?auto_2156623 ) ) ( not ( = ?auto_2156615 ?auto_2156624 ) ) ( not ( = ?auto_2156616 ?auto_2156613 ) ) ( not ( = ?auto_2156616 ?auto_2156617 ) ) ( not ( = ?auto_2156616 ?auto_2156619 ) ) ( not ( = ?auto_2156616 ?auto_2156618 ) ) ( not ( = ?auto_2156616 ?auto_2156620 ) ) ( not ( = ?auto_2156616 ?auto_2156621 ) ) ( not ( = ?auto_2156616 ?auto_2156622 ) ) ( not ( = ?auto_2156616 ?auto_2156623 ) ) ( not ( = ?auto_2156616 ?auto_2156624 ) ) ( not ( = ?auto_2156613 ?auto_2156617 ) ) ( not ( = ?auto_2156613 ?auto_2156619 ) ) ( not ( = ?auto_2156613 ?auto_2156618 ) ) ( not ( = ?auto_2156613 ?auto_2156620 ) ) ( not ( = ?auto_2156613 ?auto_2156621 ) ) ( not ( = ?auto_2156613 ?auto_2156622 ) ) ( not ( = ?auto_2156613 ?auto_2156623 ) ) ( not ( = ?auto_2156613 ?auto_2156624 ) ) ( not ( = ?auto_2156617 ?auto_2156619 ) ) ( not ( = ?auto_2156617 ?auto_2156618 ) ) ( not ( = ?auto_2156617 ?auto_2156620 ) ) ( not ( = ?auto_2156617 ?auto_2156621 ) ) ( not ( = ?auto_2156617 ?auto_2156622 ) ) ( not ( = ?auto_2156617 ?auto_2156623 ) ) ( not ( = ?auto_2156617 ?auto_2156624 ) ) ( not ( = ?auto_2156619 ?auto_2156618 ) ) ( not ( = ?auto_2156619 ?auto_2156620 ) ) ( not ( = ?auto_2156619 ?auto_2156621 ) ) ( not ( = ?auto_2156619 ?auto_2156622 ) ) ( not ( = ?auto_2156619 ?auto_2156623 ) ) ( not ( = ?auto_2156619 ?auto_2156624 ) ) ( not ( = ?auto_2156618 ?auto_2156620 ) ) ( not ( = ?auto_2156618 ?auto_2156621 ) ) ( not ( = ?auto_2156618 ?auto_2156622 ) ) ( not ( = ?auto_2156618 ?auto_2156623 ) ) ( not ( = ?auto_2156618 ?auto_2156624 ) ) ( not ( = ?auto_2156620 ?auto_2156621 ) ) ( not ( = ?auto_2156620 ?auto_2156622 ) ) ( not ( = ?auto_2156620 ?auto_2156623 ) ) ( not ( = ?auto_2156620 ?auto_2156624 ) ) ( not ( = ?auto_2156621 ?auto_2156622 ) ) ( not ( = ?auto_2156621 ?auto_2156623 ) ) ( not ( = ?auto_2156621 ?auto_2156624 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2156622 ?auto_2156623 ?auto_2156624 )
      ( MAKE-11CRATE-VERIFY ?auto_2156614 ?auto_2156615 ?auto_2156616 ?auto_2156613 ?auto_2156617 ?auto_2156619 ?auto_2156618 ?auto_2156620 ?auto_2156621 ?auto_2156622 ?auto_2156623 ?auto_2156624 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2156757 - SURFACE
      ?auto_2156758 - SURFACE
      ?auto_2156759 - SURFACE
      ?auto_2156756 - SURFACE
      ?auto_2156760 - SURFACE
      ?auto_2156762 - SURFACE
      ?auto_2156761 - SURFACE
      ?auto_2156763 - SURFACE
      ?auto_2156764 - SURFACE
      ?auto_2156765 - SURFACE
      ?auto_2156766 - SURFACE
      ?auto_2156767 - SURFACE
    )
    :vars
    (
      ?auto_2156769 - HOIST
      ?auto_2156771 - PLACE
      ?auto_2156770 - TRUCK
      ?auto_2156768 - PLACE
      ?auto_2156772 - HOIST
      ?auto_2156773 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2156769 ?auto_2156771 ) ( SURFACE-AT ?auto_2156766 ?auto_2156771 ) ( CLEAR ?auto_2156766 ) ( IS-CRATE ?auto_2156767 ) ( not ( = ?auto_2156766 ?auto_2156767 ) ) ( AVAILABLE ?auto_2156769 ) ( ON ?auto_2156766 ?auto_2156765 ) ( not ( = ?auto_2156765 ?auto_2156766 ) ) ( not ( = ?auto_2156765 ?auto_2156767 ) ) ( TRUCK-AT ?auto_2156770 ?auto_2156768 ) ( not ( = ?auto_2156768 ?auto_2156771 ) ) ( HOIST-AT ?auto_2156772 ?auto_2156768 ) ( not ( = ?auto_2156769 ?auto_2156772 ) ) ( AVAILABLE ?auto_2156772 ) ( SURFACE-AT ?auto_2156767 ?auto_2156768 ) ( ON ?auto_2156767 ?auto_2156773 ) ( CLEAR ?auto_2156767 ) ( not ( = ?auto_2156766 ?auto_2156773 ) ) ( not ( = ?auto_2156767 ?auto_2156773 ) ) ( not ( = ?auto_2156765 ?auto_2156773 ) ) ( ON ?auto_2156758 ?auto_2156757 ) ( ON ?auto_2156759 ?auto_2156758 ) ( ON ?auto_2156756 ?auto_2156759 ) ( ON ?auto_2156760 ?auto_2156756 ) ( ON ?auto_2156762 ?auto_2156760 ) ( ON ?auto_2156761 ?auto_2156762 ) ( ON ?auto_2156763 ?auto_2156761 ) ( ON ?auto_2156764 ?auto_2156763 ) ( ON ?auto_2156765 ?auto_2156764 ) ( not ( = ?auto_2156757 ?auto_2156758 ) ) ( not ( = ?auto_2156757 ?auto_2156759 ) ) ( not ( = ?auto_2156757 ?auto_2156756 ) ) ( not ( = ?auto_2156757 ?auto_2156760 ) ) ( not ( = ?auto_2156757 ?auto_2156762 ) ) ( not ( = ?auto_2156757 ?auto_2156761 ) ) ( not ( = ?auto_2156757 ?auto_2156763 ) ) ( not ( = ?auto_2156757 ?auto_2156764 ) ) ( not ( = ?auto_2156757 ?auto_2156765 ) ) ( not ( = ?auto_2156757 ?auto_2156766 ) ) ( not ( = ?auto_2156757 ?auto_2156767 ) ) ( not ( = ?auto_2156757 ?auto_2156773 ) ) ( not ( = ?auto_2156758 ?auto_2156759 ) ) ( not ( = ?auto_2156758 ?auto_2156756 ) ) ( not ( = ?auto_2156758 ?auto_2156760 ) ) ( not ( = ?auto_2156758 ?auto_2156762 ) ) ( not ( = ?auto_2156758 ?auto_2156761 ) ) ( not ( = ?auto_2156758 ?auto_2156763 ) ) ( not ( = ?auto_2156758 ?auto_2156764 ) ) ( not ( = ?auto_2156758 ?auto_2156765 ) ) ( not ( = ?auto_2156758 ?auto_2156766 ) ) ( not ( = ?auto_2156758 ?auto_2156767 ) ) ( not ( = ?auto_2156758 ?auto_2156773 ) ) ( not ( = ?auto_2156759 ?auto_2156756 ) ) ( not ( = ?auto_2156759 ?auto_2156760 ) ) ( not ( = ?auto_2156759 ?auto_2156762 ) ) ( not ( = ?auto_2156759 ?auto_2156761 ) ) ( not ( = ?auto_2156759 ?auto_2156763 ) ) ( not ( = ?auto_2156759 ?auto_2156764 ) ) ( not ( = ?auto_2156759 ?auto_2156765 ) ) ( not ( = ?auto_2156759 ?auto_2156766 ) ) ( not ( = ?auto_2156759 ?auto_2156767 ) ) ( not ( = ?auto_2156759 ?auto_2156773 ) ) ( not ( = ?auto_2156756 ?auto_2156760 ) ) ( not ( = ?auto_2156756 ?auto_2156762 ) ) ( not ( = ?auto_2156756 ?auto_2156761 ) ) ( not ( = ?auto_2156756 ?auto_2156763 ) ) ( not ( = ?auto_2156756 ?auto_2156764 ) ) ( not ( = ?auto_2156756 ?auto_2156765 ) ) ( not ( = ?auto_2156756 ?auto_2156766 ) ) ( not ( = ?auto_2156756 ?auto_2156767 ) ) ( not ( = ?auto_2156756 ?auto_2156773 ) ) ( not ( = ?auto_2156760 ?auto_2156762 ) ) ( not ( = ?auto_2156760 ?auto_2156761 ) ) ( not ( = ?auto_2156760 ?auto_2156763 ) ) ( not ( = ?auto_2156760 ?auto_2156764 ) ) ( not ( = ?auto_2156760 ?auto_2156765 ) ) ( not ( = ?auto_2156760 ?auto_2156766 ) ) ( not ( = ?auto_2156760 ?auto_2156767 ) ) ( not ( = ?auto_2156760 ?auto_2156773 ) ) ( not ( = ?auto_2156762 ?auto_2156761 ) ) ( not ( = ?auto_2156762 ?auto_2156763 ) ) ( not ( = ?auto_2156762 ?auto_2156764 ) ) ( not ( = ?auto_2156762 ?auto_2156765 ) ) ( not ( = ?auto_2156762 ?auto_2156766 ) ) ( not ( = ?auto_2156762 ?auto_2156767 ) ) ( not ( = ?auto_2156762 ?auto_2156773 ) ) ( not ( = ?auto_2156761 ?auto_2156763 ) ) ( not ( = ?auto_2156761 ?auto_2156764 ) ) ( not ( = ?auto_2156761 ?auto_2156765 ) ) ( not ( = ?auto_2156761 ?auto_2156766 ) ) ( not ( = ?auto_2156761 ?auto_2156767 ) ) ( not ( = ?auto_2156761 ?auto_2156773 ) ) ( not ( = ?auto_2156763 ?auto_2156764 ) ) ( not ( = ?auto_2156763 ?auto_2156765 ) ) ( not ( = ?auto_2156763 ?auto_2156766 ) ) ( not ( = ?auto_2156763 ?auto_2156767 ) ) ( not ( = ?auto_2156763 ?auto_2156773 ) ) ( not ( = ?auto_2156764 ?auto_2156765 ) ) ( not ( = ?auto_2156764 ?auto_2156766 ) ) ( not ( = ?auto_2156764 ?auto_2156767 ) ) ( not ( = ?auto_2156764 ?auto_2156773 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2156765 ?auto_2156766 ?auto_2156767 )
      ( MAKE-11CRATE-VERIFY ?auto_2156757 ?auto_2156758 ?auto_2156759 ?auto_2156756 ?auto_2156760 ?auto_2156762 ?auto_2156761 ?auto_2156763 ?auto_2156764 ?auto_2156765 ?auto_2156766 ?auto_2156767 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2156901 - SURFACE
      ?auto_2156902 - SURFACE
      ?auto_2156903 - SURFACE
      ?auto_2156900 - SURFACE
      ?auto_2156904 - SURFACE
      ?auto_2156906 - SURFACE
      ?auto_2156905 - SURFACE
      ?auto_2156907 - SURFACE
      ?auto_2156908 - SURFACE
      ?auto_2156909 - SURFACE
      ?auto_2156910 - SURFACE
      ?auto_2156911 - SURFACE
    )
    :vars
    (
      ?auto_2156917 - HOIST
      ?auto_2156913 - PLACE
      ?auto_2156912 - PLACE
      ?auto_2156916 - HOIST
      ?auto_2156914 - SURFACE
      ?auto_2156915 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2156917 ?auto_2156913 ) ( SURFACE-AT ?auto_2156910 ?auto_2156913 ) ( CLEAR ?auto_2156910 ) ( IS-CRATE ?auto_2156911 ) ( not ( = ?auto_2156910 ?auto_2156911 ) ) ( AVAILABLE ?auto_2156917 ) ( ON ?auto_2156910 ?auto_2156909 ) ( not ( = ?auto_2156909 ?auto_2156910 ) ) ( not ( = ?auto_2156909 ?auto_2156911 ) ) ( not ( = ?auto_2156912 ?auto_2156913 ) ) ( HOIST-AT ?auto_2156916 ?auto_2156912 ) ( not ( = ?auto_2156917 ?auto_2156916 ) ) ( AVAILABLE ?auto_2156916 ) ( SURFACE-AT ?auto_2156911 ?auto_2156912 ) ( ON ?auto_2156911 ?auto_2156914 ) ( CLEAR ?auto_2156911 ) ( not ( = ?auto_2156910 ?auto_2156914 ) ) ( not ( = ?auto_2156911 ?auto_2156914 ) ) ( not ( = ?auto_2156909 ?auto_2156914 ) ) ( TRUCK-AT ?auto_2156915 ?auto_2156913 ) ( ON ?auto_2156902 ?auto_2156901 ) ( ON ?auto_2156903 ?auto_2156902 ) ( ON ?auto_2156900 ?auto_2156903 ) ( ON ?auto_2156904 ?auto_2156900 ) ( ON ?auto_2156906 ?auto_2156904 ) ( ON ?auto_2156905 ?auto_2156906 ) ( ON ?auto_2156907 ?auto_2156905 ) ( ON ?auto_2156908 ?auto_2156907 ) ( ON ?auto_2156909 ?auto_2156908 ) ( not ( = ?auto_2156901 ?auto_2156902 ) ) ( not ( = ?auto_2156901 ?auto_2156903 ) ) ( not ( = ?auto_2156901 ?auto_2156900 ) ) ( not ( = ?auto_2156901 ?auto_2156904 ) ) ( not ( = ?auto_2156901 ?auto_2156906 ) ) ( not ( = ?auto_2156901 ?auto_2156905 ) ) ( not ( = ?auto_2156901 ?auto_2156907 ) ) ( not ( = ?auto_2156901 ?auto_2156908 ) ) ( not ( = ?auto_2156901 ?auto_2156909 ) ) ( not ( = ?auto_2156901 ?auto_2156910 ) ) ( not ( = ?auto_2156901 ?auto_2156911 ) ) ( not ( = ?auto_2156901 ?auto_2156914 ) ) ( not ( = ?auto_2156902 ?auto_2156903 ) ) ( not ( = ?auto_2156902 ?auto_2156900 ) ) ( not ( = ?auto_2156902 ?auto_2156904 ) ) ( not ( = ?auto_2156902 ?auto_2156906 ) ) ( not ( = ?auto_2156902 ?auto_2156905 ) ) ( not ( = ?auto_2156902 ?auto_2156907 ) ) ( not ( = ?auto_2156902 ?auto_2156908 ) ) ( not ( = ?auto_2156902 ?auto_2156909 ) ) ( not ( = ?auto_2156902 ?auto_2156910 ) ) ( not ( = ?auto_2156902 ?auto_2156911 ) ) ( not ( = ?auto_2156902 ?auto_2156914 ) ) ( not ( = ?auto_2156903 ?auto_2156900 ) ) ( not ( = ?auto_2156903 ?auto_2156904 ) ) ( not ( = ?auto_2156903 ?auto_2156906 ) ) ( not ( = ?auto_2156903 ?auto_2156905 ) ) ( not ( = ?auto_2156903 ?auto_2156907 ) ) ( not ( = ?auto_2156903 ?auto_2156908 ) ) ( not ( = ?auto_2156903 ?auto_2156909 ) ) ( not ( = ?auto_2156903 ?auto_2156910 ) ) ( not ( = ?auto_2156903 ?auto_2156911 ) ) ( not ( = ?auto_2156903 ?auto_2156914 ) ) ( not ( = ?auto_2156900 ?auto_2156904 ) ) ( not ( = ?auto_2156900 ?auto_2156906 ) ) ( not ( = ?auto_2156900 ?auto_2156905 ) ) ( not ( = ?auto_2156900 ?auto_2156907 ) ) ( not ( = ?auto_2156900 ?auto_2156908 ) ) ( not ( = ?auto_2156900 ?auto_2156909 ) ) ( not ( = ?auto_2156900 ?auto_2156910 ) ) ( not ( = ?auto_2156900 ?auto_2156911 ) ) ( not ( = ?auto_2156900 ?auto_2156914 ) ) ( not ( = ?auto_2156904 ?auto_2156906 ) ) ( not ( = ?auto_2156904 ?auto_2156905 ) ) ( not ( = ?auto_2156904 ?auto_2156907 ) ) ( not ( = ?auto_2156904 ?auto_2156908 ) ) ( not ( = ?auto_2156904 ?auto_2156909 ) ) ( not ( = ?auto_2156904 ?auto_2156910 ) ) ( not ( = ?auto_2156904 ?auto_2156911 ) ) ( not ( = ?auto_2156904 ?auto_2156914 ) ) ( not ( = ?auto_2156906 ?auto_2156905 ) ) ( not ( = ?auto_2156906 ?auto_2156907 ) ) ( not ( = ?auto_2156906 ?auto_2156908 ) ) ( not ( = ?auto_2156906 ?auto_2156909 ) ) ( not ( = ?auto_2156906 ?auto_2156910 ) ) ( not ( = ?auto_2156906 ?auto_2156911 ) ) ( not ( = ?auto_2156906 ?auto_2156914 ) ) ( not ( = ?auto_2156905 ?auto_2156907 ) ) ( not ( = ?auto_2156905 ?auto_2156908 ) ) ( not ( = ?auto_2156905 ?auto_2156909 ) ) ( not ( = ?auto_2156905 ?auto_2156910 ) ) ( not ( = ?auto_2156905 ?auto_2156911 ) ) ( not ( = ?auto_2156905 ?auto_2156914 ) ) ( not ( = ?auto_2156907 ?auto_2156908 ) ) ( not ( = ?auto_2156907 ?auto_2156909 ) ) ( not ( = ?auto_2156907 ?auto_2156910 ) ) ( not ( = ?auto_2156907 ?auto_2156911 ) ) ( not ( = ?auto_2156907 ?auto_2156914 ) ) ( not ( = ?auto_2156908 ?auto_2156909 ) ) ( not ( = ?auto_2156908 ?auto_2156910 ) ) ( not ( = ?auto_2156908 ?auto_2156911 ) ) ( not ( = ?auto_2156908 ?auto_2156914 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2156909 ?auto_2156910 ?auto_2156911 )
      ( MAKE-11CRATE-VERIFY ?auto_2156901 ?auto_2156902 ?auto_2156903 ?auto_2156900 ?auto_2156904 ?auto_2156906 ?auto_2156905 ?auto_2156907 ?auto_2156908 ?auto_2156909 ?auto_2156910 ?auto_2156911 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2157045 - SURFACE
      ?auto_2157046 - SURFACE
      ?auto_2157047 - SURFACE
      ?auto_2157044 - SURFACE
      ?auto_2157048 - SURFACE
      ?auto_2157050 - SURFACE
      ?auto_2157049 - SURFACE
      ?auto_2157051 - SURFACE
      ?auto_2157052 - SURFACE
      ?auto_2157053 - SURFACE
      ?auto_2157054 - SURFACE
      ?auto_2157055 - SURFACE
    )
    :vars
    (
      ?auto_2157060 - HOIST
      ?auto_2157061 - PLACE
      ?auto_2157059 - PLACE
      ?auto_2157057 - HOIST
      ?auto_2157058 - SURFACE
      ?auto_2157056 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2157060 ?auto_2157061 ) ( IS-CRATE ?auto_2157055 ) ( not ( = ?auto_2157054 ?auto_2157055 ) ) ( not ( = ?auto_2157053 ?auto_2157054 ) ) ( not ( = ?auto_2157053 ?auto_2157055 ) ) ( not ( = ?auto_2157059 ?auto_2157061 ) ) ( HOIST-AT ?auto_2157057 ?auto_2157059 ) ( not ( = ?auto_2157060 ?auto_2157057 ) ) ( AVAILABLE ?auto_2157057 ) ( SURFACE-AT ?auto_2157055 ?auto_2157059 ) ( ON ?auto_2157055 ?auto_2157058 ) ( CLEAR ?auto_2157055 ) ( not ( = ?auto_2157054 ?auto_2157058 ) ) ( not ( = ?auto_2157055 ?auto_2157058 ) ) ( not ( = ?auto_2157053 ?auto_2157058 ) ) ( TRUCK-AT ?auto_2157056 ?auto_2157061 ) ( SURFACE-AT ?auto_2157053 ?auto_2157061 ) ( CLEAR ?auto_2157053 ) ( LIFTING ?auto_2157060 ?auto_2157054 ) ( IS-CRATE ?auto_2157054 ) ( ON ?auto_2157046 ?auto_2157045 ) ( ON ?auto_2157047 ?auto_2157046 ) ( ON ?auto_2157044 ?auto_2157047 ) ( ON ?auto_2157048 ?auto_2157044 ) ( ON ?auto_2157050 ?auto_2157048 ) ( ON ?auto_2157049 ?auto_2157050 ) ( ON ?auto_2157051 ?auto_2157049 ) ( ON ?auto_2157052 ?auto_2157051 ) ( ON ?auto_2157053 ?auto_2157052 ) ( not ( = ?auto_2157045 ?auto_2157046 ) ) ( not ( = ?auto_2157045 ?auto_2157047 ) ) ( not ( = ?auto_2157045 ?auto_2157044 ) ) ( not ( = ?auto_2157045 ?auto_2157048 ) ) ( not ( = ?auto_2157045 ?auto_2157050 ) ) ( not ( = ?auto_2157045 ?auto_2157049 ) ) ( not ( = ?auto_2157045 ?auto_2157051 ) ) ( not ( = ?auto_2157045 ?auto_2157052 ) ) ( not ( = ?auto_2157045 ?auto_2157053 ) ) ( not ( = ?auto_2157045 ?auto_2157054 ) ) ( not ( = ?auto_2157045 ?auto_2157055 ) ) ( not ( = ?auto_2157045 ?auto_2157058 ) ) ( not ( = ?auto_2157046 ?auto_2157047 ) ) ( not ( = ?auto_2157046 ?auto_2157044 ) ) ( not ( = ?auto_2157046 ?auto_2157048 ) ) ( not ( = ?auto_2157046 ?auto_2157050 ) ) ( not ( = ?auto_2157046 ?auto_2157049 ) ) ( not ( = ?auto_2157046 ?auto_2157051 ) ) ( not ( = ?auto_2157046 ?auto_2157052 ) ) ( not ( = ?auto_2157046 ?auto_2157053 ) ) ( not ( = ?auto_2157046 ?auto_2157054 ) ) ( not ( = ?auto_2157046 ?auto_2157055 ) ) ( not ( = ?auto_2157046 ?auto_2157058 ) ) ( not ( = ?auto_2157047 ?auto_2157044 ) ) ( not ( = ?auto_2157047 ?auto_2157048 ) ) ( not ( = ?auto_2157047 ?auto_2157050 ) ) ( not ( = ?auto_2157047 ?auto_2157049 ) ) ( not ( = ?auto_2157047 ?auto_2157051 ) ) ( not ( = ?auto_2157047 ?auto_2157052 ) ) ( not ( = ?auto_2157047 ?auto_2157053 ) ) ( not ( = ?auto_2157047 ?auto_2157054 ) ) ( not ( = ?auto_2157047 ?auto_2157055 ) ) ( not ( = ?auto_2157047 ?auto_2157058 ) ) ( not ( = ?auto_2157044 ?auto_2157048 ) ) ( not ( = ?auto_2157044 ?auto_2157050 ) ) ( not ( = ?auto_2157044 ?auto_2157049 ) ) ( not ( = ?auto_2157044 ?auto_2157051 ) ) ( not ( = ?auto_2157044 ?auto_2157052 ) ) ( not ( = ?auto_2157044 ?auto_2157053 ) ) ( not ( = ?auto_2157044 ?auto_2157054 ) ) ( not ( = ?auto_2157044 ?auto_2157055 ) ) ( not ( = ?auto_2157044 ?auto_2157058 ) ) ( not ( = ?auto_2157048 ?auto_2157050 ) ) ( not ( = ?auto_2157048 ?auto_2157049 ) ) ( not ( = ?auto_2157048 ?auto_2157051 ) ) ( not ( = ?auto_2157048 ?auto_2157052 ) ) ( not ( = ?auto_2157048 ?auto_2157053 ) ) ( not ( = ?auto_2157048 ?auto_2157054 ) ) ( not ( = ?auto_2157048 ?auto_2157055 ) ) ( not ( = ?auto_2157048 ?auto_2157058 ) ) ( not ( = ?auto_2157050 ?auto_2157049 ) ) ( not ( = ?auto_2157050 ?auto_2157051 ) ) ( not ( = ?auto_2157050 ?auto_2157052 ) ) ( not ( = ?auto_2157050 ?auto_2157053 ) ) ( not ( = ?auto_2157050 ?auto_2157054 ) ) ( not ( = ?auto_2157050 ?auto_2157055 ) ) ( not ( = ?auto_2157050 ?auto_2157058 ) ) ( not ( = ?auto_2157049 ?auto_2157051 ) ) ( not ( = ?auto_2157049 ?auto_2157052 ) ) ( not ( = ?auto_2157049 ?auto_2157053 ) ) ( not ( = ?auto_2157049 ?auto_2157054 ) ) ( not ( = ?auto_2157049 ?auto_2157055 ) ) ( not ( = ?auto_2157049 ?auto_2157058 ) ) ( not ( = ?auto_2157051 ?auto_2157052 ) ) ( not ( = ?auto_2157051 ?auto_2157053 ) ) ( not ( = ?auto_2157051 ?auto_2157054 ) ) ( not ( = ?auto_2157051 ?auto_2157055 ) ) ( not ( = ?auto_2157051 ?auto_2157058 ) ) ( not ( = ?auto_2157052 ?auto_2157053 ) ) ( not ( = ?auto_2157052 ?auto_2157054 ) ) ( not ( = ?auto_2157052 ?auto_2157055 ) ) ( not ( = ?auto_2157052 ?auto_2157058 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2157053 ?auto_2157054 ?auto_2157055 )
      ( MAKE-11CRATE-VERIFY ?auto_2157045 ?auto_2157046 ?auto_2157047 ?auto_2157044 ?auto_2157048 ?auto_2157050 ?auto_2157049 ?auto_2157051 ?auto_2157052 ?auto_2157053 ?auto_2157054 ?auto_2157055 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2157189 - SURFACE
      ?auto_2157190 - SURFACE
      ?auto_2157191 - SURFACE
      ?auto_2157188 - SURFACE
      ?auto_2157192 - SURFACE
      ?auto_2157194 - SURFACE
      ?auto_2157193 - SURFACE
      ?auto_2157195 - SURFACE
      ?auto_2157196 - SURFACE
      ?auto_2157197 - SURFACE
      ?auto_2157198 - SURFACE
      ?auto_2157199 - SURFACE
    )
    :vars
    (
      ?auto_2157202 - HOIST
      ?auto_2157205 - PLACE
      ?auto_2157201 - PLACE
      ?auto_2157204 - HOIST
      ?auto_2157200 - SURFACE
      ?auto_2157203 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2157202 ?auto_2157205 ) ( IS-CRATE ?auto_2157199 ) ( not ( = ?auto_2157198 ?auto_2157199 ) ) ( not ( = ?auto_2157197 ?auto_2157198 ) ) ( not ( = ?auto_2157197 ?auto_2157199 ) ) ( not ( = ?auto_2157201 ?auto_2157205 ) ) ( HOIST-AT ?auto_2157204 ?auto_2157201 ) ( not ( = ?auto_2157202 ?auto_2157204 ) ) ( AVAILABLE ?auto_2157204 ) ( SURFACE-AT ?auto_2157199 ?auto_2157201 ) ( ON ?auto_2157199 ?auto_2157200 ) ( CLEAR ?auto_2157199 ) ( not ( = ?auto_2157198 ?auto_2157200 ) ) ( not ( = ?auto_2157199 ?auto_2157200 ) ) ( not ( = ?auto_2157197 ?auto_2157200 ) ) ( TRUCK-AT ?auto_2157203 ?auto_2157205 ) ( SURFACE-AT ?auto_2157197 ?auto_2157205 ) ( CLEAR ?auto_2157197 ) ( IS-CRATE ?auto_2157198 ) ( AVAILABLE ?auto_2157202 ) ( IN ?auto_2157198 ?auto_2157203 ) ( ON ?auto_2157190 ?auto_2157189 ) ( ON ?auto_2157191 ?auto_2157190 ) ( ON ?auto_2157188 ?auto_2157191 ) ( ON ?auto_2157192 ?auto_2157188 ) ( ON ?auto_2157194 ?auto_2157192 ) ( ON ?auto_2157193 ?auto_2157194 ) ( ON ?auto_2157195 ?auto_2157193 ) ( ON ?auto_2157196 ?auto_2157195 ) ( ON ?auto_2157197 ?auto_2157196 ) ( not ( = ?auto_2157189 ?auto_2157190 ) ) ( not ( = ?auto_2157189 ?auto_2157191 ) ) ( not ( = ?auto_2157189 ?auto_2157188 ) ) ( not ( = ?auto_2157189 ?auto_2157192 ) ) ( not ( = ?auto_2157189 ?auto_2157194 ) ) ( not ( = ?auto_2157189 ?auto_2157193 ) ) ( not ( = ?auto_2157189 ?auto_2157195 ) ) ( not ( = ?auto_2157189 ?auto_2157196 ) ) ( not ( = ?auto_2157189 ?auto_2157197 ) ) ( not ( = ?auto_2157189 ?auto_2157198 ) ) ( not ( = ?auto_2157189 ?auto_2157199 ) ) ( not ( = ?auto_2157189 ?auto_2157200 ) ) ( not ( = ?auto_2157190 ?auto_2157191 ) ) ( not ( = ?auto_2157190 ?auto_2157188 ) ) ( not ( = ?auto_2157190 ?auto_2157192 ) ) ( not ( = ?auto_2157190 ?auto_2157194 ) ) ( not ( = ?auto_2157190 ?auto_2157193 ) ) ( not ( = ?auto_2157190 ?auto_2157195 ) ) ( not ( = ?auto_2157190 ?auto_2157196 ) ) ( not ( = ?auto_2157190 ?auto_2157197 ) ) ( not ( = ?auto_2157190 ?auto_2157198 ) ) ( not ( = ?auto_2157190 ?auto_2157199 ) ) ( not ( = ?auto_2157190 ?auto_2157200 ) ) ( not ( = ?auto_2157191 ?auto_2157188 ) ) ( not ( = ?auto_2157191 ?auto_2157192 ) ) ( not ( = ?auto_2157191 ?auto_2157194 ) ) ( not ( = ?auto_2157191 ?auto_2157193 ) ) ( not ( = ?auto_2157191 ?auto_2157195 ) ) ( not ( = ?auto_2157191 ?auto_2157196 ) ) ( not ( = ?auto_2157191 ?auto_2157197 ) ) ( not ( = ?auto_2157191 ?auto_2157198 ) ) ( not ( = ?auto_2157191 ?auto_2157199 ) ) ( not ( = ?auto_2157191 ?auto_2157200 ) ) ( not ( = ?auto_2157188 ?auto_2157192 ) ) ( not ( = ?auto_2157188 ?auto_2157194 ) ) ( not ( = ?auto_2157188 ?auto_2157193 ) ) ( not ( = ?auto_2157188 ?auto_2157195 ) ) ( not ( = ?auto_2157188 ?auto_2157196 ) ) ( not ( = ?auto_2157188 ?auto_2157197 ) ) ( not ( = ?auto_2157188 ?auto_2157198 ) ) ( not ( = ?auto_2157188 ?auto_2157199 ) ) ( not ( = ?auto_2157188 ?auto_2157200 ) ) ( not ( = ?auto_2157192 ?auto_2157194 ) ) ( not ( = ?auto_2157192 ?auto_2157193 ) ) ( not ( = ?auto_2157192 ?auto_2157195 ) ) ( not ( = ?auto_2157192 ?auto_2157196 ) ) ( not ( = ?auto_2157192 ?auto_2157197 ) ) ( not ( = ?auto_2157192 ?auto_2157198 ) ) ( not ( = ?auto_2157192 ?auto_2157199 ) ) ( not ( = ?auto_2157192 ?auto_2157200 ) ) ( not ( = ?auto_2157194 ?auto_2157193 ) ) ( not ( = ?auto_2157194 ?auto_2157195 ) ) ( not ( = ?auto_2157194 ?auto_2157196 ) ) ( not ( = ?auto_2157194 ?auto_2157197 ) ) ( not ( = ?auto_2157194 ?auto_2157198 ) ) ( not ( = ?auto_2157194 ?auto_2157199 ) ) ( not ( = ?auto_2157194 ?auto_2157200 ) ) ( not ( = ?auto_2157193 ?auto_2157195 ) ) ( not ( = ?auto_2157193 ?auto_2157196 ) ) ( not ( = ?auto_2157193 ?auto_2157197 ) ) ( not ( = ?auto_2157193 ?auto_2157198 ) ) ( not ( = ?auto_2157193 ?auto_2157199 ) ) ( not ( = ?auto_2157193 ?auto_2157200 ) ) ( not ( = ?auto_2157195 ?auto_2157196 ) ) ( not ( = ?auto_2157195 ?auto_2157197 ) ) ( not ( = ?auto_2157195 ?auto_2157198 ) ) ( not ( = ?auto_2157195 ?auto_2157199 ) ) ( not ( = ?auto_2157195 ?auto_2157200 ) ) ( not ( = ?auto_2157196 ?auto_2157197 ) ) ( not ( = ?auto_2157196 ?auto_2157198 ) ) ( not ( = ?auto_2157196 ?auto_2157199 ) ) ( not ( = ?auto_2157196 ?auto_2157200 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2157197 ?auto_2157198 ?auto_2157199 )
      ( MAKE-11CRATE-VERIFY ?auto_2157189 ?auto_2157190 ?auto_2157191 ?auto_2157188 ?auto_2157192 ?auto_2157194 ?auto_2157193 ?auto_2157195 ?auto_2157196 ?auto_2157197 ?auto_2157198 ?auto_2157199 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2166480 - SURFACE
      ?auto_2166481 - SURFACE
      ?auto_2166482 - SURFACE
      ?auto_2166479 - SURFACE
      ?auto_2166483 - SURFACE
      ?auto_2166485 - SURFACE
      ?auto_2166484 - SURFACE
      ?auto_2166486 - SURFACE
      ?auto_2166487 - SURFACE
      ?auto_2166488 - SURFACE
      ?auto_2166489 - SURFACE
      ?auto_2166490 - SURFACE
      ?auto_2166491 - SURFACE
    )
    :vars
    (
      ?auto_2166493 - HOIST
      ?auto_2166492 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2166493 ?auto_2166492 ) ( SURFACE-AT ?auto_2166490 ?auto_2166492 ) ( CLEAR ?auto_2166490 ) ( LIFTING ?auto_2166493 ?auto_2166491 ) ( IS-CRATE ?auto_2166491 ) ( not ( = ?auto_2166490 ?auto_2166491 ) ) ( ON ?auto_2166481 ?auto_2166480 ) ( ON ?auto_2166482 ?auto_2166481 ) ( ON ?auto_2166479 ?auto_2166482 ) ( ON ?auto_2166483 ?auto_2166479 ) ( ON ?auto_2166485 ?auto_2166483 ) ( ON ?auto_2166484 ?auto_2166485 ) ( ON ?auto_2166486 ?auto_2166484 ) ( ON ?auto_2166487 ?auto_2166486 ) ( ON ?auto_2166488 ?auto_2166487 ) ( ON ?auto_2166489 ?auto_2166488 ) ( ON ?auto_2166490 ?auto_2166489 ) ( not ( = ?auto_2166480 ?auto_2166481 ) ) ( not ( = ?auto_2166480 ?auto_2166482 ) ) ( not ( = ?auto_2166480 ?auto_2166479 ) ) ( not ( = ?auto_2166480 ?auto_2166483 ) ) ( not ( = ?auto_2166480 ?auto_2166485 ) ) ( not ( = ?auto_2166480 ?auto_2166484 ) ) ( not ( = ?auto_2166480 ?auto_2166486 ) ) ( not ( = ?auto_2166480 ?auto_2166487 ) ) ( not ( = ?auto_2166480 ?auto_2166488 ) ) ( not ( = ?auto_2166480 ?auto_2166489 ) ) ( not ( = ?auto_2166480 ?auto_2166490 ) ) ( not ( = ?auto_2166480 ?auto_2166491 ) ) ( not ( = ?auto_2166481 ?auto_2166482 ) ) ( not ( = ?auto_2166481 ?auto_2166479 ) ) ( not ( = ?auto_2166481 ?auto_2166483 ) ) ( not ( = ?auto_2166481 ?auto_2166485 ) ) ( not ( = ?auto_2166481 ?auto_2166484 ) ) ( not ( = ?auto_2166481 ?auto_2166486 ) ) ( not ( = ?auto_2166481 ?auto_2166487 ) ) ( not ( = ?auto_2166481 ?auto_2166488 ) ) ( not ( = ?auto_2166481 ?auto_2166489 ) ) ( not ( = ?auto_2166481 ?auto_2166490 ) ) ( not ( = ?auto_2166481 ?auto_2166491 ) ) ( not ( = ?auto_2166482 ?auto_2166479 ) ) ( not ( = ?auto_2166482 ?auto_2166483 ) ) ( not ( = ?auto_2166482 ?auto_2166485 ) ) ( not ( = ?auto_2166482 ?auto_2166484 ) ) ( not ( = ?auto_2166482 ?auto_2166486 ) ) ( not ( = ?auto_2166482 ?auto_2166487 ) ) ( not ( = ?auto_2166482 ?auto_2166488 ) ) ( not ( = ?auto_2166482 ?auto_2166489 ) ) ( not ( = ?auto_2166482 ?auto_2166490 ) ) ( not ( = ?auto_2166482 ?auto_2166491 ) ) ( not ( = ?auto_2166479 ?auto_2166483 ) ) ( not ( = ?auto_2166479 ?auto_2166485 ) ) ( not ( = ?auto_2166479 ?auto_2166484 ) ) ( not ( = ?auto_2166479 ?auto_2166486 ) ) ( not ( = ?auto_2166479 ?auto_2166487 ) ) ( not ( = ?auto_2166479 ?auto_2166488 ) ) ( not ( = ?auto_2166479 ?auto_2166489 ) ) ( not ( = ?auto_2166479 ?auto_2166490 ) ) ( not ( = ?auto_2166479 ?auto_2166491 ) ) ( not ( = ?auto_2166483 ?auto_2166485 ) ) ( not ( = ?auto_2166483 ?auto_2166484 ) ) ( not ( = ?auto_2166483 ?auto_2166486 ) ) ( not ( = ?auto_2166483 ?auto_2166487 ) ) ( not ( = ?auto_2166483 ?auto_2166488 ) ) ( not ( = ?auto_2166483 ?auto_2166489 ) ) ( not ( = ?auto_2166483 ?auto_2166490 ) ) ( not ( = ?auto_2166483 ?auto_2166491 ) ) ( not ( = ?auto_2166485 ?auto_2166484 ) ) ( not ( = ?auto_2166485 ?auto_2166486 ) ) ( not ( = ?auto_2166485 ?auto_2166487 ) ) ( not ( = ?auto_2166485 ?auto_2166488 ) ) ( not ( = ?auto_2166485 ?auto_2166489 ) ) ( not ( = ?auto_2166485 ?auto_2166490 ) ) ( not ( = ?auto_2166485 ?auto_2166491 ) ) ( not ( = ?auto_2166484 ?auto_2166486 ) ) ( not ( = ?auto_2166484 ?auto_2166487 ) ) ( not ( = ?auto_2166484 ?auto_2166488 ) ) ( not ( = ?auto_2166484 ?auto_2166489 ) ) ( not ( = ?auto_2166484 ?auto_2166490 ) ) ( not ( = ?auto_2166484 ?auto_2166491 ) ) ( not ( = ?auto_2166486 ?auto_2166487 ) ) ( not ( = ?auto_2166486 ?auto_2166488 ) ) ( not ( = ?auto_2166486 ?auto_2166489 ) ) ( not ( = ?auto_2166486 ?auto_2166490 ) ) ( not ( = ?auto_2166486 ?auto_2166491 ) ) ( not ( = ?auto_2166487 ?auto_2166488 ) ) ( not ( = ?auto_2166487 ?auto_2166489 ) ) ( not ( = ?auto_2166487 ?auto_2166490 ) ) ( not ( = ?auto_2166487 ?auto_2166491 ) ) ( not ( = ?auto_2166488 ?auto_2166489 ) ) ( not ( = ?auto_2166488 ?auto_2166490 ) ) ( not ( = ?auto_2166488 ?auto_2166491 ) ) ( not ( = ?auto_2166489 ?auto_2166490 ) ) ( not ( = ?auto_2166489 ?auto_2166491 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2166490 ?auto_2166491 )
      ( MAKE-12CRATE-VERIFY ?auto_2166480 ?auto_2166481 ?auto_2166482 ?auto_2166479 ?auto_2166483 ?auto_2166485 ?auto_2166484 ?auto_2166486 ?auto_2166487 ?auto_2166488 ?auto_2166489 ?auto_2166490 ?auto_2166491 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2166605 - SURFACE
      ?auto_2166606 - SURFACE
      ?auto_2166607 - SURFACE
      ?auto_2166604 - SURFACE
      ?auto_2166608 - SURFACE
      ?auto_2166610 - SURFACE
      ?auto_2166609 - SURFACE
      ?auto_2166611 - SURFACE
      ?auto_2166612 - SURFACE
      ?auto_2166613 - SURFACE
      ?auto_2166614 - SURFACE
      ?auto_2166615 - SURFACE
      ?auto_2166616 - SURFACE
    )
    :vars
    (
      ?auto_2166619 - HOIST
      ?auto_2166618 - PLACE
      ?auto_2166617 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2166619 ?auto_2166618 ) ( SURFACE-AT ?auto_2166615 ?auto_2166618 ) ( CLEAR ?auto_2166615 ) ( IS-CRATE ?auto_2166616 ) ( not ( = ?auto_2166615 ?auto_2166616 ) ) ( TRUCK-AT ?auto_2166617 ?auto_2166618 ) ( AVAILABLE ?auto_2166619 ) ( IN ?auto_2166616 ?auto_2166617 ) ( ON ?auto_2166615 ?auto_2166614 ) ( not ( = ?auto_2166614 ?auto_2166615 ) ) ( not ( = ?auto_2166614 ?auto_2166616 ) ) ( ON ?auto_2166606 ?auto_2166605 ) ( ON ?auto_2166607 ?auto_2166606 ) ( ON ?auto_2166604 ?auto_2166607 ) ( ON ?auto_2166608 ?auto_2166604 ) ( ON ?auto_2166610 ?auto_2166608 ) ( ON ?auto_2166609 ?auto_2166610 ) ( ON ?auto_2166611 ?auto_2166609 ) ( ON ?auto_2166612 ?auto_2166611 ) ( ON ?auto_2166613 ?auto_2166612 ) ( ON ?auto_2166614 ?auto_2166613 ) ( not ( = ?auto_2166605 ?auto_2166606 ) ) ( not ( = ?auto_2166605 ?auto_2166607 ) ) ( not ( = ?auto_2166605 ?auto_2166604 ) ) ( not ( = ?auto_2166605 ?auto_2166608 ) ) ( not ( = ?auto_2166605 ?auto_2166610 ) ) ( not ( = ?auto_2166605 ?auto_2166609 ) ) ( not ( = ?auto_2166605 ?auto_2166611 ) ) ( not ( = ?auto_2166605 ?auto_2166612 ) ) ( not ( = ?auto_2166605 ?auto_2166613 ) ) ( not ( = ?auto_2166605 ?auto_2166614 ) ) ( not ( = ?auto_2166605 ?auto_2166615 ) ) ( not ( = ?auto_2166605 ?auto_2166616 ) ) ( not ( = ?auto_2166606 ?auto_2166607 ) ) ( not ( = ?auto_2166606 ?auto_2166604 ) ) ( not ( = ?auto_2166606 ?auto_2166608 ) ) ( not ( = ?auto_2166606 ?auto_2166610 ) ) ( not ( = ?auto_2166606 ?auto_2166609 ) ) ( not ( = ?auto_2166606 ?auto_2166611 ) ) ( not ( = ?auto_2166606 ?auto_2166612 ) ) ( not ( = ?auto_2166606 ?auto_2166613 ) ) ( not ( = ?auto_2166606 ?auto_2166614 ) ) ( not ( = ?auto_2166606 ?auto_2166615 ) ) ( not ( = ?auto_2166606 ?auto_2166616 ) ) ( not ( = ?auto_2166607 ?auto_2166604 ) ) ( not ( = ?auto_2166607 ?auto_2166608 ) ) ( not ( = ?auto_2166607 ?auto_2166610 ) ) ( not ( = ?auto_2166607 ?auto_2166609 ) ) ( not ( = ?auto_2166607 ?auto_2166611 ) ) ( not ( = ?auto_2166607 ?auto_2166612 ) ) ( not ( = ?auto_2166607 ?auto_2166613 ) ) ( not ( = ?auto_2166607 ?auto_2166614 ) ) ( not ( = ?auto_2166607 ?auto_2166615 ) ) ( not ( = ?auto_2166607 ?auto_2166616 ) ) ( not ( = ?auto_2166604 ?auto_2166608 ) ) ( not ( = ?auto_2166604 ?auto_2166610 ) ) ( not ( = ?auto_2166604 ?auto_2166609 ) ) ( not ( = ?auto_2166604 ?auto_2166611 ) ) ( not ( = ?auto_2166604 ?auto_2166612 ) ) ( not ( = ?auto_2166604 ?auto_2166613 ) ) ( not ( = ?auto_2166604 ?auto_2166614 ) ) ( not ( = ?auto_2166604 ?auto_2166615 ) ) ( not ( = ?auto_2166604 ?auto_2166616 ) ) ( not ( = ?auto_2166608 ?auto_2166610 ) ) ( not ( = ?auto_2166608 ?auto_2166609 ) ) ( not ( = ?auto_2166608 ?auto_2166611 ) ) ( not ( = ?auto_2166608 ?auto_2166612 ) ) ( not ( = ?auto_2166608 ?auto_2166613 ) ) ( not ( = ?auto_2166608 ?auto_2166614 ) ) ( not ( = ?auto_2166608 ?auto_2166615 ) ) ( not ( = ?auto_2166608 ?auto_2166616 ) ) ( not ( = ?auto_2166610 ?auto_2166609 ) ) ( not ( = ?auto_2166610 ?auto_2166611 ) ) ( not ( = ?auto_2166610 ?auto_2166612 ) ) ( not ( = ?auto_2166610 ?auto_2166613 ) ) ( not ( = ?auto_2166610 ?auto_2166614 ) ) ( not ( = ?auto_2166610 ?auto_2166615 ) ) ( not ( = ?auto_2166610 ?auto_2166616 ) ) ( not ( = ?auto_2166609 ?auto_2166611 ) ) ( not ( = ?auto_2166609 ?auto_2166612 ) ) ( not ( = ?auto_2166609 ?auto_2166613 ) ) ( not ( = ?auto_2166609 ?auto_2166614 ) ) ( not ( = ?auto_2166609 ?auto_2166615 ) ) ( not ( = ?auto_2166609 ?auto_2166616 ) ) ( not ( = ?auto_2166611 ?auto_2166612 ) ) ( not ( = ?auto_2166611 ?auto_2166613 ) ) ( not ( = ?auto_2166611 ?auto_2166614 ) ) ( not ( = ?auto_2166611 ?auto_2166615 ) ) ( not ( = ?auto_2166611 ?auto_2166616 ) ) ( not ( = ?auto_2166612 ?auto_2166613 ) ) ( not ( = ?auto_2166612 ?auto_2166614 ) ) ( not ( = ?auto_2166612 ?auto_2166615 ) ) ( not ( = ?auto_2166612 ?auto_2166616 ) ) ( not ( = ?auto_2166613 ?auto_2166614 ) ) ( not ( = ?auto_2166613 ?auto_2166615 ) ) ( not ( = ?auto_2166613 ?auto_2166616 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2166614 ?auto_2166615 ?auto_2166616 )
      ( MAKE-12CRATE-VERIFY ?auto_2166605 ?auto_2166606 ?auto_2166607 ?auto_2166604 ?auto_2166608 ?auto_2166610 ?auto_2166609 ?auto_2166611 ?auto_2166612 ?auto_2166613 ?auto_2166614 ?auto_2166615 ?auto_2166616 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2166743 - SURFACE
      ?auto_2166744 - SURFACE
      ?auto_2166745 - SURFACE
      ?auto_2166742 - SURFACE
      ?auto_2166746 - SURFACE
      ?auto_2166748 - SURFACE
      ?auto_2166747 - SURFACE
      ?auto_2166749 - SURFACE
      ?auto_2166750 - SURFACE
      ?auto_2166751 - SURFACE
      ?auto_2166752 - SURFACE
      ?auto_2166753 - SURFACE
      ?auto_2166754 - SURFACE
    )
    :vars
    (
      ?auto_2166757 - HOIST
      ?auto_2166755 - PLACE
      ?auto_2166758 - TRUCK
      ?auto_2166756 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2166757 ?auto_2166755 ) ( SURFACE-AT ?auto_2166753 ?auto_2166755 ) ( CLEAR ?auto_2166753 ) ( IS-CRATE ?auto_2166754 ) ( not ( = ?auto_2166753 ?auto_2166754 ) ) ( AVAILABLE ?auto_2166757 ) ( IN ?auto_2166754 ?auto_2166758 ) ( ON ?auto_2166753 ?auto_2166752 ) ( not ( = ?auto_2166752 ?auto_2166753 ) ) ( not ( = ?auto_2166752 ?auto_2166754 ) ) ( TRUCK-AT ?auto_2166758 ?auto_2166756 ) ( not ( = ?auto_2166756 ?auto_2166755 ) ) ( ON ?auto_2166744 ?auto_2166743 ) ( ON ?auto_2166745 ?auto_2166744 ) ( ON ?auto_2166742 ?auto_2166745 ) ( ON ?auto_2166746 ?auto_2166742 ) ( ON ?auto_2166748 ?auto_2166746 ) ( ON ?auto_2166747 ?auto_2166748 ) ( ON ?auto_2166749 ?auto_2166747 ) ( ON ?auto_2166750 ?auto_2166749 ) ( ON ?auto_2166751 ?auto_2166750 ) ( ON ?auto_2166752 ?auto_2166751 ) ( not ( = ?auto_2166743 ?auto_2166744 ) ) ( not ( = ?auto_2166743 ?auto_2166745 ) ) ( not ( = ?auto_2166743 ?auto_2166742 ) ) ( not ( = ?auto_2166743 ?auto_2166746 ) ) ( not ( = ?auto_2166743 ?auto_2166748 ) ) ( not ( = ?auto_2166743 ?auto_2166747 ) ) ( not ( = ?auto_2166743 ?auto_2166749 ) ) ( not ( = ?auto_2166743 ?auto_2166750 ) ) ( not ( = ?auto_2166743 ?auto_2166751 ) ) ( not ( = ?auto_2166743 ?auto_2166752 ) ) ( not ( = ?auto_2166743 ?auto_2166753 ) ) ( not ( = ?auto_2166743 ?auto_2166754 ) ) ( not ( = ?auto_2166744 ?auto_2166745 ) ) ( not ( = ?auto_2166744 ?auto_2166742 ) ) ( not ( = ?auto_2166744 ?auto_2166746 ) ) ( not ( = ?auto_2166744 ?auto_2166748 ) ) ( not ( = ?auto_2166744 ?auto_2166747 ) ) ( not ( = ?auto_2166744 ?auto_2166749 ) ) ( not ( = ?auto_2166744 ?auto_2166750 ) ) ( not ( = ?auto_2166744 ?auto_2166751 ) ) ( not ( = ?auto_2166744 ?auto_2166752 ) ) ( not ( = ?auto_2166744 ?auto_2166753 ) ) ( not ( = ?auto_2166744 ?auto_2166754 ) ) ( not ( = ?auto_2166745 ?auto_2166742 ) ) ( not ( = ?auto_2166745 ?auto_2166746 ) ) ( not ( = ?auto_2166745 ?auto_2166748 ) ) ( not ( = ?auto_2166745 ?auto_2166747 ) ) ( not ( = ?auto_2166745 ?auto_2166749 ) ) ( not ( = ?auto_2166745 ?auto_2166750 ) ) ( not ( = ?auto_2166745 ?auto_2166751 ) ) ( not ( = ?auto_2166745 ?auto_2166752 ) ) ( not ( = ?auto_2166745 ?auto_2166753 ) ) ( not ( = ?auto_2166745 ?auto_2166754 ) ) ( not ( = ?auto_2166742 ?auto_2166746 ) ) ( not ( = ?auto_2166742 ?auto_2166748 ) ) ( not ( = ?auto_2166742 ?auto_2166747 ) ) ( not ( = ?auto_2166742 ?auto_2166749 ) ) ( not ( = ?auto_2166742 ?auto_2166750 ) ) ( not ( = ?auto_2166742 ?auto_2166751 ) ) ( not ( = ?auto_2166742 ?auto_2166752 ) ) ( not ( = ?auto_2166742 ?auto_2166753 ) ) ( not ( = ?auto_2166742 ?auto_2166754 ) ) ( not ( = ?auto_2166746 ?auto_2166748 ) ) ( not ( = ?auto_2166746 ?auto_2166747 ) ) ( not ( = ?auto_2166746 ?auto_2166749 ) ) ( not ( = ?auto_2166746 ?auto_2166750 ) ) ( not ( = ?auto_2166746 ?auto_2166751 ) ) ( not ( = ?auto_2166746 ?auto_2166752 ) ) ( not ( = ?auto_2166746 ?auto_2166753 ) ) ( not ( = ?auto_2166746 ?auto_2166754 ) ) ( not ( = ?auto_2166748 ?auto_2166747 ) ) ( not ( = ?auto_2166748 ?auto_2166749 ) ) ( not ( = ?auto_2166748 ?auto_2166750 ) ) ( not ( = ?auto_2166748 ?auto_2166751 ) ) ( not ( = ?auto_2166748 ?auto_2166752 ) ) ( not ( = ?auto_2166748 ?auto_2166753 ) ) ( not ( = ?auto_2166748 ?auto_2166754 ) ) ( not ( = ?auto_2166747 ?auto_2166749 ) ) ( not ( = ?auto_2166747 ?auto_2166750 ) ) ( not ( = ?auto_2166747 ?auto_2166751 ) ) ( not ( = ?auto_2166747 ?auto_2166752 ) ) ( not ( = ?auto_2166747 ?auto_2166753 ) ) ( not ( = ?auto_2166747 ?auto_2166754 ) ) ( not ( = ?auto_2166749 ?auto_2166750 ) ) ( not ( = ?auto_2166749 ?auto_2166751 ) ) ( not ( = ?auto_2166749 ?auto_2166752 ) ) ( not ( = ?auto_2166749 ?auto_2166753 ) ) ( not ( = ?auto_2166749 ?auto_2166754 ) ) ( not ( = ?auto_2166750 ?auto_2166751 ) ) ( not ( = ?auto_2166750 ?auto_2166752 ) ) ( not ( = ?auto_2166750 ?auto_2166753 ) ) ( not ( = ?auto_2166750 ?auto_2166754 ) ) ( not ( = ?auto_2166751 ?auto_2166752 ) ) ( not ( = ?auto_2166751 ?auto_2166753 ) ) ( not ( = ?auto_2166751 ?auto_2166754 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2166752 ?auto_2166753 ?auto_2166754 )
      ( MAKE-12CRATE-VERIFY ?auto_2166743 ?auto_2166744 ?auto_2166745 ?auto_2166742 ?auto_2166746 ?auto_2166748 ?auto_2166747 ?auto_2166749 ?auto_2166750 ?auto_2166751 ?auto_2166752 ?auto_2166753 ?auto_2166754 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2166893 - SURFACE
      ?auto_2166894 - SURFACE
      ?auto_2166895 - SURFACE
      ?auto_2166892 - SURFACE
      ?auto_2166896 - SURFACE
      ?auto_2166898 - SURFACE
      ?auto_2166897 - SURFACE
      ?auto_2166899 - SURFACE
      ?auto_2166900 - SURFACE
      ?auto_2166901 - SURFACE
      ?auto_2166902 - SURFACE
      ?auto_2166903 - SURFACE
      ?auto_2166904 - SURFACE
    )
    :vars
    (
      ?auto_2166906 - HOIST
      ?auto_2166908 - PLACE
      ?auto_2166907 - TRUCK
      ?auto_2166905 - PLACE
      ?auto_2166909 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2166906 ?auto_2166908 ) ( SURFACE-AT ?auto_2166903 ?auto_2166908 ) ( CLEAR ?auto_2166903 ) ( IS-CRATE ?auto_2166904 ) ( not ( = ?auto_2166903 ?auto_2166904 ) ) ( AVAILABLE ?auto_2166906 ) ( ON ?auto_2166903 ?auto_2166902 ) ( not ( = ?auto_2166902 ?auto_2166903 ) ) ( not ( = ?auto_2166902 ?auto_2166904 ) ) ( TRUCK-AT ?auto_2166907 ?auto_2166905 ) ( not ( = ?auto_2166905 ?auto_2166908 ) ) ( HOIST-AT ?auto_2166909 ?auto_2166905 ) ( LIFTING ?auto_2166909 ?auto_2166904 ) ( not ( = ?auto_2166906 ?auto_2166909 ) ) ( ON ?auto_2166894 ?auto_2166893 ) ( ON ?auto_2166895 ?auto_2166894 ) ( ON ?auto_2166892 ?auto_2166895 ) ( ON ?auto_2166896 ?auto_2166892 ) ( ON ?auto_2166898 ?auto_2166896 ) ( ON ?auto_2166897 ?auto_2166898 ) ( ON ?auto_2166899 ?auto_2166897 ) ( ON ?auto_2166900 ?auto_2166899 ) ( ON ?auto_2166901 ?auto_2166900 ) ( ON ?auto_2166902 ?auto_2166901 ) ( not ( = ?auto_2166893 ?auto_2166894 ) ) ( not ( = ?auto_2166893 ?auto_2166895 ) ) ( not ( = ?auto_2166893 ?auto_2166892 ) ) ( not ( = ?auto_2166893 ?auto_2166896 ) ) ( not ( = ?auto_2166893 ?auto_2166898 ) ) ( not ( = ?auto_2166893 ?auto_2166897 ) ) ( not ( = ?auto_2166893 ?auto_2166899 ) ) ( not ( = ?auto_2166893 ?auto_2166900 ) ) ( not ( = ?auto_2166893 ?auto_2166901 ) ) ( not ( = ?auto_2166893 ?auto_2166902 ) ) ( not ( = ?auto_2166893 ?auto_2166903 ) ) ( not ( = ?auto_2166893 ?auto_2166904 ) ) ( not ( = ?auto_2166894 ?auto_2166895 ) ) ( not ( = ?auto_2166894 ?auto_2166892 ) ) ( not ( = ?auto_2166894 ?auto_2166896 ) ) ( not ( = ?auto_2166894 ?auto_2166898 ) ) ( not ( = ?auto_2166894 ?auto_2166897 ) ) ( not ( = ?auto_2166894 ?auto_2166899 ) ) ( not ( = ?auto_2166894 ?auto_2166900 ) ) ( not ( = ?auto_2166894 ?auto_2166901 ) ) ( not ( = ?auto_2166894 ?auto_2166902 ) ) ( not ( = ?auto_2166894 ?auto_2166903 ) ) ( not ( = ?auto_2166894 ?auto_2166904 ) ) ( not ( = ?auto_2166895 ?auto_2166892 ) ) ( not ( = ?auto_2166895 ?auto_2166896 ) ) ( not ( = ?auto_2166895 ?auto_2166898 ) ) ( not ( = ?auto_2166895 ?auto_2166897 ) ) ( not ( = ?auto_2166895 ?auto_2166899 ) ) ( not ( = ?auto_2166895 ?auto_2166900 ) ) ( not ( = ?auto_2166895 ?auto_2166901 ) ) ( not ( = ?auto_2166895 ?auto_2166902 ) ) ( not ( = ?auto_2166895 ?auto_2166903 ) ) ( not ( = ?auto_2166895 ?auto_2166904 ) ) ( not ( = ?auto_2166892 ?auto_2166896 ) ) ( not ( = ?auto_2166892 ?auto_2166898 ) ) ( not ( = ?auto_2166892 ?auto_2166897 ) ) ( not ( = ?auto_2166892 ?auto_2166899 ) ) ( not ( = ?auto_2166892 ?auto_2166900 ) ) ( not ( = ?auto_2166892 ?auto_2166901 ) ) ( not ( = ?auto_2166892 ?auto_2166902 ) ) ( not ( = ?auto_2166892 ?auto_2166903 ) ) ( not ( = ?auto_2166892 ?auto_2166904 ) ) ( not ( = ?auto_2166896 ?auto_2166898 ) ) ( not ( = ?auto_2166896 ?auto_2166897 ) ) ( not ( = ?auto_2166896 ?auto_2166899 ) ) ( not ( = ?auto_2166896 ?auto_2166900 ) ) ( not ( = ?auto_2166896 ?auto_2166901 ) ) ( not ( = ?auto_2166896 ?auto_2166902 ) ) ( not ( = ?auto_2166896 ?auto_2166903 ) ) ( not ( = ?auto_2166896 ?auto_2166904 ) ) ( not ( = ?auto_2166898 ?auto_2166897 ) ) ( not ( = ?auto_2166898 ?auto_2166899 ) ) ( not ( = ?auto_2166898 ?auto_2166900 ) ) ( not ( = ?auto_2166898 ?auto_2166901 ) ) ( not ( = ?auto_2166898 ?auto_2166902 ) ) ( not ( = ?auto_2166898 ?auto_2166903 ) ) ( not ( = ?auto_2166898 ?auto_2166904 ) ) ( not ( = ?auto_2166897 ?auto_2166899 ) ) ( not ( = ?auto_2166897 ?auto_2166900 ) ) ( not ( = ?auto_2166897 ?auto_2166901 ) ) ( not ( = ?auto_2166897 ?auto_2166902 ) ) ( not ( = ?auto_2166897 ?auto_2166903 ) ) ( not ( = ?auto_2166897 ?auto_2166904 ) ) ( not ( = ?auto_2166899 ?auto_2166900 ) ) ( not ( = ?auto_2166899 ?auto_2166901 ) ) ( not ( = ?auto_2166899 ?auto_2166902 ) ) ( not ( = ?auto_2166899 ?auto_2166903 ) ) ( not ( = ?auto_2166899 ?auto_2166904 ) ) ( not ( = ?auto_2166900 ?auto_2166901 ) ) ( not ( = ?auto_2166900 ?auto_2166902 ) ) ( not ( = ?auto_2166900 ?auto_2166903 ) ) ( not ( = ?auto_2166900 ?auto_2166904 ) ) ( not ( = ?auto_2166901 ?auto_2166902 ) ) ( not ( = ?auto_2166901 ?auto_2166903 ) ) ( not ( = ?auto_2166901 ?auto_2166904 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2166902 ?auto_2166903 ?auto_2166904 )
      ( MAKE-12CRATE-VERIFY ?auto_2166893 ?auto_2166894 ?auto_2166895 ?auto_2166892 ?auto_2166896 ?auto_2166898 ?auto_2166897 ?auto_2166899 ?auto_2166900 ?auto_2166901 ?auto_2166902 ?auto_2166903 ?auto_2166904 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2167055 - SURFACE
      ?auto_2167056 - SURFACE
      ?auto_2167057 - SURFACE
      ?auto_2167054 - SURFACE
      ?auto_2167058 - SURFACE
      ?auto_2167060 - SURFACE
      ?auto_2167059 - SURFACE
      ?auto_2167061 - SURFACE
      ?auto_2167062 - SURFACE
      ?auto_2167063 - SURFACE
      ?auto_2167064 - SURFACE
      ?auto_2167065 - SURFACE
      ?auto_2167066 - SURFACE
    )
    :vars
    (
      ?auto_2167068 - HOIST
      ?auto_2167067 - PLACE
      ?auto_2167071 - TRUCK
      ?auto_2167069 - PLACE
      ?auto_2167070 - HOIST
      ?auto_2167072 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2167068 ?auto_2167067 ) ( SURFACE-AT ?auto_2167065 ?auto_2167067 ) ( CLEAR ?auto_2167065 ) ( IS-CRATE ?auto_2167066 ) ( not ( = ?auto_2167065 ?auto_2167066 ) ) ( AVAILABLE ?auto_2167068 ) ( ON ?auto_2167065 ?auto_2167064 ) ( not ( = ?auto_2167064 ?auto_2167065 ) ) ( not ( = ?auto_2167064 ?auto_2167066 ) ) ( TRUCK-AT ?auto_2167071 ?auto_2167069 ) ( not ( = ?auto_2167069 ?auto_2167067 ) ) ( HOIST-AT ?auto_2167070 ?auto_2167069 ) ( not ( = ?auto_2167068 ?auto_2167070 ) ) ( AVAILABLE ?auto_2167070 ) ( SURFACE-AT ?auto_2167066 ?auto_2167069 ) ( ON ?auto_2167066 ?auto_2167072 ) ( CLEAR ?auto_2167066 ) ( not ( = ?auto_2167065 ?auto_2167072 ) ) ( not ( = ?auto_2167066 ?auto_2167072 ) ) ( not ( = ?auto_2167064 ?auto_2167072 ) ) ( ON ?auto_2167056 ?auto_2167055 ) ( ON ?auto_2167057 ?auto_2167056 ) ( ON ?auto_2167054 ?auto_2167057 ) ( ON ?auto_2167058 ?auto_2167054 ) ( ON ?auto_2167060 ?auto_2167058 ) ( ON ?auto_2167059 ?auto_2167060 ) ( ON ?auto_2167061 ?auto_2167059 ) ( ON ?auto_2167062 ?auto_2167061 ) ( ON ?auto_2167063 ?auto_2167062 ) ( ON ?auto_2167064 ?auto_2167063 ) ( not ( = ?auto_2167055 ?auto_2167056 ) ) ( not ( = ?auto_2167055 ?auto_2167057 ) ) ( not ( = ?auto_2167055 ?auto_2167054 ) ) ( not ( = ?auto_2167055 ?auto_2167058 ) ) ( not ( = ?auto_2167055 ?auto_2167060 ) ) ( not ( = ?auto_2167055 ?auto_2167059 ) ) ( not ( = ?auto_2167055 ?auto_2167061 ) ) ( not ( = ?auto_2167055 ?auto_2167062 ) ) ( not ( = ?auto_2167055 ?auto_2167063 ) ) ( not ( = ?auto_2167055 ?auto_2167064 ) ) ( not ( = ?auto_2167055 ?auto_2167065 ) ) ( not ( = ?auto_2167055 ?auto_2167066 ) ) ( not ( = ?auto_2167055 ?auto_2167072 ) ) ( not ( = ?auto_2167056 ?auto_2167057 ) ) ( not ( = ?auto_2167056 ?auto_2167054 ) ) ( not ( = ?auto_2167056 ?auto_2167058 ) ) ( not ( = ?auto_2167056 ?auto_2167060 ) ) ( not ( = ?auto_2167056 ?auto_2167059 ) ) ( not ( = ?auto_2167056 ?auto_2167061 ) ) ( not ( = ?auto_2167056 ?auto_2167062 ) ) ( not ( = ?auto_2167056 ?auto_2167063 ) ) ( not ( = ?auto_2167056 ?auto_2167064 ) ) ( not ( = ?auto_2167056 ?auto_2167065 ) ) ( not ( = ?auto_2167056 ?auto_2167066 ) ) ( not ( = ?auto_2167056 ?auto_2167072 ) ) ( not ( = ?auto_2167057 ?auto_2167054 ) ) ( not ( = ?auto_2167057 ?auto_2167058 ) ) ( not ( = ?auto_2167057 ?auto_2167060 ) ) ( not ( = ?auto_2167057 ?auto_2167059 ) ) ( not ( = ?auto_2167057 ?auto_2167061 ) ) ( not ( = ?auto_2167057 ?auto_2167062 ) ) ( not ( = ?auto_2167057 ?auto_2167063 ) ) ( not ( = ?auto_2167057 ?auto_2167064 ) ) ( not ( = ?auto_2167057 ?auto_2167065 ) ) ( not ( = ?auto_2167057 ?auto_2167066 ) ) ( not ( = ?auto_2167057 ?auto_2167072 ) ) ( not ( = ?auto_2167054 ?auto_2167058 ) ) ( not ( = ?auto_2167054 ?auto_2167060 ) ) ( not ( = ?auto_2167054 ?auto_2167059 ) ) ( not ( = ?auto_2167054 ?auto_2167061 ) ) ( not ( = ?auto_2167054 ?auto_2167062 ) ) ( not ( = ?auto_2167054 ?auto_2167063 ) ) ( not ( = ?auto_2167054 ?auto_2167064 ) ) ( not ( = ?auto_2167054 ?auto_2167065 ) ) ( not ( = ?auto_2167054 ?auto_2167066 ) ) ( not ( = ?auto_2167054 ?auto_2167072 ) ) ( not ( = ?auto_2167058 ?auto_2167060 ) ) ( not ( = ?auto_2167058 ?auto_2167059 ) ) ( not ( = ?auto_2167058 ?auto_2167061 ) ) ( not ( = ?auto_2167058 ?auto_2167062 ) ) ( not ( = ?auto_2167058 ?auto_2167063 ) ) ( not ( = ?auto_2167058 ?auto_2167064 ) ) ( not ( = ?auto_2167058 ?auto_2167065 ) ) ( not ( = ?auto_2167058 ?auto_2167066 ) ) ( not ( = ?auto_2167058 ?auto_2167072 ) ) ( not ( = ?auto_2167060 ?auto_2167059 ) ) ( not ( = ?auto_2167060 ?auto_2167061 ) ) ( not ( = ?auto_2167060 ?auto_2167062 ) ) ( not ( = ?auto_2167060 ?auto_2167063 ) ) ( not ( = ?auto_2167060 ?auto_2167064 ) ) ( not ( = ?auto_2167060 ?auto_2167065 ) ) ( not ( = ?auto_2167060 ?auto_2167066 ) ) ( not ( = ?auto_2167060 ?auto_2167072 ) ) ( not ( = ?auto_2167059 ?auto_2167061 ) ) ( not ( = ?auto_2167059 ?auto_2167062 ) ) ( not ( = ?auto_2167059 ?auto_2167063 ) ) ( not ( = ?auto_2167059 ?auto_2167064 ) ) ( not ( = ?auto_2167059 ?auto_2167065 ) ) ( not ( = ?auto_2167059 ?auto_2167066 ) ) ( not ( = ?auto_2167059 ?auto_2167072 ) ) ( not ( = ?auto_2167061 ?auto_2167062 ) ) ( not ( = ?auto_2167061 ?auto_2167063 ) ) ( not ( = ?auto_2167061 ?auto_2167064 ) ) ( not ( = ?auto_2167061 ?auto_2167065 ) ) ( not ( = ?auto_2167061 ?auto_2167066 ) ) ( not ( = ?auto_2167061 ?auto_2167072 ) ) ( not ( = ?auto_2167062 ?auto_2167063 ) ) ( not ( = ?auto_2167062 ?auto_2167064 ) ) ( not ( = ?auto_2167062 ?auto_2167065 ) ) ( not ( = ?auto_2167062 ?auto_2167066 ) ) ( not ( = ?auto_2167062 ?auto_2167072 ) ) ( not ( = ?auto_2167063 ?auto_2167064 ) ) ( not ( = ?auto_2167063 ?auto_2167065 ) ) ( not ( = ?auto_2167063 ?auto_2167066 ) ) ( not ( = ?auto_2167063 ?auto_2167072 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2167064 ?auto_2167065 ?auto_2167066 )
      ( MAKE-12CRATE-VERIFY ?auto_2167055 ?auto_2167056 ?auto_2167057 ?auto_2167054 ?auto_2167058 ?auto_2167060 ?auto_2167059 ?auto_2167061 ?auto_2167062 ?auto_2167063 ?auto_2167064 ?auto_2167065 ?auto_2167066 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2167218 - SURFACE
      ?auto_2167219 - SURFACE
      ?auto_2167220 - SURFACE
      ?auto_2167217 - SURFACE
      ?auto_2167221 - SURFACE
      ?auto_2167223 - SURFACE
      ?auto_2167222 - SURFACE
      ?auto_2167224 - SURFACE
      ?auto_2167225 - SURFACE
      ?auto_2167226 - SURFACE
      ?auto_2167227 - SURFACE
      ?auto_2167228 - SURFACE
      ?auto_2167229 - SURFACE
    )
    :vars
    (
      ?auto_2167235 - HOIST
      ?auto_2167230 - PLACE
      ?auto_2167231 - PLACE
      ?auto_2167232 - HOIST
      ?auto_2167233 - SURFACE
      ?auto_2167234 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2167235 ?auto_2167230 ) ( SURFACE-AT ?auto_2167228 ?auto_2167230 ) ( CLEAR ?auto_2167228 ) ( IS-CRATE ?auto_2167229 ) ( not ( = ?auto_2167228 ?auto_2167229 ) ) ( AVAILABLE ?auto_2167235 ) ( ON ?auto_2167228 ?auto_2167227 ) ( not ( = ?auto_2167227 ?auto_2167228 ) ) ( not ( = ?auto_2167227 ?auto_2167229 ) ) ( not ( = ?auto_2167231 ?auto_2167230 ) ) ( HOIST-AT ?auto_2167232 ?auto_2167231 ) ( not ( = ?auto_2167235 ?auto_2167232 ) ) ( AVAILABLE ?auto_2167232 ) ( SURFACE-AT ?auto_2167229 ?auto_2167231 ) ( ON ?auto_2167229 ?auto_2167233 ) ( CLEAR ?auto_2167229 ) ( not ( = ?auto_2167228 ?auto_2167233 ) ) ( not ( = ?auto_2167229 ?auto_2167233 ) ) ( not ( = ?auto_2167227 ?auto_2167233 ) ) ( TRUCK-AT ?auto_2167234 ?auto_2167230 ) ( ON ?auto_2167219 ?auto_2167218 ) ( ON ?auto_2167220 ?auto_2167219 ) ( ON ?auto_2167217 ?auto_2167220 ) ( ON ?auto_2167221 ?auto_2167217 ) ( ON ?auto_2167223 ?auto_2167221 ) ( ON ?auto_2167222 ?auto_2167223 ) ( ON ?auto_2167224 ?auto_2167222 ) ( ON ?auto_2167225 ?auto_2167224 ) ( ON ?auto_2167226 ?auto_2167225 ) ( ON ?auto_2167227 ?auto_2167226 ) ( not ( = ?auto_2167218 ?auto_2167219 ) ) ( not ( = ?auto_2167218 ?auto_2167220 ) ) ( not ( = ?auto_2167218 ?auto_2167217 ) ) ( not ( = ?auto_2167218 ?auto_2167221 ) ) ( not ( = ?auto_2167218 ?auto_2167223 ) ) ( not ( = ?auto_2167218 ?auto_2167222 ) ) ( not ( = ?auto_2167218 ?auto_2167224 ) ) ( not ( = ?auto_2167218 ?auto_2167225 ) ) ( not ( = ?auto_2167218 ?auto_2167226 ) ) ( not ( = ?auto_2167218 ?auto_2167227 ) ) ( not ( = ?auto_2167218 ?auto_2167228 ) ) ( not ( = ?auto_2167218 ?auto_2167229 ) ) ( not ( = ?auto_2167218 ?auto_2167233 ) ) ( not ( = ?auto_2167219 ?auto_2167220 ) ) ( not ( = ?auto_2167219 ?auto_2167217 ) ) ( not ( = ?auto_2167219 ?auto_2167221 ) ) ( not ( = ?auto_2167219 ?auto_2167223 ) ) ( not ( = ?auto_2167219 ?auto_2167222 ) ) ( not ( = ?auto_2167219 ?auto_2167224 ) ) ( not ( = ?auto_2167219 ?auto_2167225 ) ) ( not ( = ?auto_2167219 ?auto_2167226 ) ) ( not ( = ?auto_2167219 ?auto_2167227 ) ) ( not ( = ?auto_2167219 ?auto_2167228 ) ) ( not ( = ?auto_2167219 ?auto_2167229 ) ) ( not ( = ?auto_2167219 ?auto_2167233 ) ) ( not ( = ?auto_2167220 ?auto_2167217 ) ) ( not ( = ?auto_2167220 ?auto_2167221 ) ) ( not ( = ?auto_2167220 ?auto_2167223 ) ) ( not ( = ?auto_2167220 ?auto_2167222 ) ) ( not ( = ?auto_2167220 ?auto_2167224 ) ) ( not ( = ?auto_2167220 ?auto_2167225 ) ) ( not ( = ?auto_2167220 ?auto_2167226 ) ) ( not ( = ?auto_2167220 ?auto_2167227 ) ) ( not ( = ?auto_2167220 ?auto_2167228 ) ) ( not ( = ?auto_2167220 ?auto_2167229 ) ) ( not ( = ?auto_2167220 ?auto_2167233 ) ) ( not ( = ?auto_2167217 ?auto_2167221 ) ) ( not ( = ?auto_2167217 ?auto_2167223 ) ) ( not ( = ?auto_2167217 ?auto_2167222 ) ) ( not ( = ?auto_2167217 ?auto_2167224 ) ) ( not ( = ?auto_2167217 ?auto_2167225 ) ) ( not ( = ?auto_2167217 ?auto_2167226 ) ) ( not ( = ?auto_2167217 ?auto_2167227 ) ) ( not ( = ?auto_2167217 ?auto_2167228 ) ) ( not ( = ?auto_2167217 ?auto_2167229 ) ) ( not ( = ?auto_2167217 ?auto_2167233 ) ) ( not ( = ?auto_2167221 ?auto_2167223 ) ) ( not ( = ?auto_2167221 ?auto_2167222 ) ) ( not ( = ?auto_2167221 ?auto_2167224 ) ) ( not ( = ?auto_2167221 ?auto_2167225 ) ) ( not ( = ?auto_2167221 ?auto_2167226 ) ) ( not ( = ?auto_2167221 ?auto_2167227 ) ) ( not ( = ?auto_2167221 ?auto_2167228 ) ) ( not ( = ?auto_2167221 ?auto_2167229 ) ) ( not ( = ?auto_2167221 ?auto_2167233 ) ) ( not ( = ?auto_2167223 ?auto_2167222 ) ) ( not ( = ?auto_2167223 ?auto_2167224 ) ) ( not ( = ?auto_2167223 ?auto_2167225 ) ) ( not ( = ?auto_2167223 ?auto_2167226 ) ) ( not ( = ?auto_2167223 ?auto_2167227 ) ) ( not ( = ?auto_2167223 ?auto_2167228 ) ) ( not ( = ?auto_2167223 ?auto_2167229 ) ) ( not ( = ?auto_2167223 ?auto_2167233 ) ) ( not ( = ?auto_2167222 ?auto_2167224 ) ) ( not ( = ?auto_2167222 ?auto_2167225 ) ) ( not ( = ?auto_2167222 ?auto_2167226 ) ) ( not ( = ?auto_2167222 ?auto_2167227 ) ) ( not ( = ?auto_2167222 ?auto_2167228 ) ) ( not ( = ?auto_2167222 ?auto_2167229 ) ) ( not ( = ?auto_2167222 ?auto_2167233 ) ) ( not ( = ?auto_2167224 ?auto_2167225 ) ) ( not ( = ?auto_2167224 ?auto_2167226 ) ) ( not ( = ?auto_2167224 ?auto_2167227 ) ) ( not ( = ?auto_2167224 ?auto_2167228 ) ) ( not ( = ?auto_2167224 ?auto_2167229 ) ) ( not ( = ?auto_2167224 ?auto_2167233 ) ) ( not ( = ?auto_2167225 ?auto_2167226 ) ) ( not ( = ?auto_2167225 ?auto_2167227 ) ) ( not ( = ?auto_2167225 ?auto_2167228 ) ) ( not ( = ?auto_2167225 ?auto_2167229 ) ) ( not ( = ?auto_2167225 ?auto_2167233 ) ) ( not ( = ?auto_2167226 ?auto_2167227 ) ) ( not ( = ?auto_2167226 ?auto_2167228 ) ) ( not ( = ?auto_2167226 ?auto_2167229 ) ) ( not ( = ?auto_2167226 ?auto_2167233 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2167227 ?auto_2167228 ?auto_2167229 )
      ( MAKE-12CRATE-VERIFY ?auto_2167218 ?auto_2167219 ?auto_2167220 ?auto_2167217 ?auto_2167221 ?auto_2167223 ?auto_2167222 ?auto_2167224 ?auto_2167225 ?auto_2167226 ?auto_2167227 ?auto_2167228 ?auto_2167229 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2167381 - SURFACE
      ?auto_2167382 - SURFACE
      ?auto_2167383 - SURFACE
      ?auto_2167380 - SURFACE
      ?auto_2167384 - SURFACE
      ?auto_2167386 - SURFACE
      ?auto_2167385 - SURFACE
      ?auto_2167387 - SURFACE
      ?auto_2167388 - SURFACE
      ?auto_2167389 - SURFACE
      ?auto_2167390 - SURFACE
      ?auto_2167391 - SURFACE
      ?auto_2167392 - SURFACE
    )
    :vars
    (
      ?auto_2167395 - HOIST
      ?auto_2167396 - PLACE
      ?auto_2167394 - PLACE
      ?auto_2167397 - HOIST
      ?auto_2167398 - SURFACE
      ?auto_2167393 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2167395 ?auto_2167396 ) ( IS-CRATE ?auto_2167392 ) ( not ( = ?auto_2167391 ?auto_2167392 ) ) ( not ( = ?auto_2167390 ?auto_2167391 ) ) ( not ( = ?auto_2167390 ?auto_2167392 ) ) ( not ( = ?auto_2167394 ?auto_2167396 ) ) ( HOIST-AT ?auto_2167397 ?auto_2167394 ) ( not ( = ?auto_2167395 ?auto_2167397 ) ) ( AVAILABLE ?auto_2167397 ) ( SURFACE-AT ?auto_2167392 ?auto_2167394 ) ( ON ?auto_2167392 ?auto_2167398 ) ( CLEAR ?auto_2167392 ) ( not ( = ?auto_2167391 ?auto_2167398 ) ) ( not ( = ?auto_2167392 ?auto_2167398 ) ) ( not ( = ?auto_2167390 ?auto_2167398 ) ) ( TRUCK-AT ?auto_2167393 ?auto_2167396 ) ( SURFACE-AT ?auto_2167390 ?auto_2167396 ) ( CLEAR ?auto_2167390 ) ( LIFTING ?auto_2167395 ?auto_2167391 ) ( IS-CRATE ?auto_2167391 ) ( ON ?auto_2167382 ?auto_2167381 ) ( ON ?auto_2167383 ?auto_2167382 ) ( ON ?auto_2167380 ?auto_2167383 ) ( ON ?auto_2167384 ?auto_2167380 ) ( ON ?auto_2167386 ?auto_2167384 ) ( ON ?auto_2167385 ?auto_2167386 ) ( ON ?auto_2167387 ?auto_2167385 ) ( ON ?auto_2167388 ?auto_2167387 ) ( ON ?auto_2167389 ?auto_2167388 ) ( ON ?auto_2167390 ?auto_2167389 ) ( not ( = ?auto_2167381 ?auto_2167382 ) ) ( not ( = ?auto_2167381 ?auto_2167383 ) ) ( not ( = ?auto_2167381 ?auto_2167380 ) ) ( not ( = ?auto_2167381 ?auto_2167384 ) ) ( not ( = ?auto_2167381 ?auto_2167386 ) ) ( not ( = ?auto_2167381 ?auto_2167385 ) ) ( not ( = ?auto_2167381 ?auto_2167387 ) ) ( not ( = ?auto_2167381 ?auto_2167388 ) ) ( not ( = ?auto_2167381 ?auto_2167389 ) ) ( not ( = ?auto_2167381 ?auto_2167390 ) ) ( not ( = ?auto_2167381 ?auto_2167391 ) ) ( not ( = ?auto_2167381 ?auto_2167392 ) ) ( not ( = ?auto_2167381 ?auto_2167398 ) ) ( not ( = ?auto_2167382 ?auto_2167383 ) ) ( not ( = ?auto_2167382 ?auto_2167380 ) ) ( not ( = ?auto_2167382 ?auto_2167384 ) ) ( not ( = ?auto_2167382 ?auto_2167386 ) ) ( not ( = ?auto_2167382 ?auto_2167385 ) ) ( not ( = ?auto_2167382 ?auto_2167387 ) ) ( not ( = ?auto_2167382 ?auto_2167388 ) ) ( not ( = ?auto_2167382 ?auto_2167389 ) ) ( not ( = ?auto_2167382 ?auto_2167390 ) ) ( not ( = ?auto_2167382 ?auto_2167391 ) ) ( not ( = ?auto_2167382 ?auto_2167392 ) ) ( not ( = ?auto_2167382 ?auto_2167398 ) ) ( not ( = ?auto_2167383 ?auto_2167380 ) ) ( not ( = ?auto_2167383 ?auto_2167384 ) ) ( not ( = ?auto_2167383 ?auto_2167386 ) ) ( not ( = ?auto_2167383 ?auto_2167385 ) ) ( not ( = ?auto_2167383 ?auto_2167387 ) ) ( not ( = ?auto_2167383 ?auto_2167388 ) ) ( not ( = ?auto_2167383 ?auto_2167389 ) ) ( not ( = ?auto_2167383 ?auto_2167390 ) ) ( not ( = ?auto_2167383 ?auto_2167391 ) ) ( not ( = ?auto_2167383 ?auto_2167392 ) ) ( not ( = ?auto_2167383 ?auto_2167398 ) ) ( not ( = ?auto_2167380 ?auto_2167384 ) ) ( not ( = ?auto_2167380 ?auto_2167386 ) ) ( not ( = ?auto_2167380 ?auto_2167385 ) ) ( not ( = ?auto_2167380 ?auto_2167387 ) ) ( not ( = ?auto_2167380 ?auto_2167388 ) ) ( not ( = ?auto_2167380 ?auto_2167389 ) ) ( not ( = ?auto_2167380 ?auto_2167390 ) ) ( not ( = ?auto_2167380 ?auto_2167391 ) ) ( not ( = ?auto_2167380 ?auto_2167392 ) ) ( not ( = ?auto_2167380 ?auto_2167398 ) ) ( not ( = ?auto_2167384 ?auto_2167386 ) ) ( not ( = ?auto_2167384 ?auto_2167385 ) ) ( not ( = ?auto_2167384 ?auto_2167387 ) ) ( not ( = ?auto_2167384 ?auto_2167388 ) ) ( not ( = ?auto_2167384 ?auto_2167389 ) ) ( not ( = ?auto_2167384 ?auto_2167390 ) ) ( not ( = ?auto_2167384 ?auto_2167391 ) ) ( not ( = ?auto_2167384 ?auto_2167392 ) ) ( not ( = ?auto_2167384 ?auto_2167398 ) ) ( not ( = ?auto_2167386 ?auto_2167385 ) ) ( not ( = ?auto_2167386 ?auto_2167387 ) ) ( not ( = ?auto_2167386 ?auto_2167388 ) ) ( not ( = ?auto_2167386 ?auto_2167389 ) ) ( not ( = ?auto_2167386 ?auto_2167390 ) ) ( not ( = ?auto_2167386 ?auto_2167391 ) ) ( not ( = ?auto_2167386 ?auto_2167392 ) ) ( not ( = ?auto_2167386 ?auto_2167398 ) ) ( not ( = ?auto_2167385 ?auto_2167387 ) ) ( not ( = ?auto_2167385 ?auto_2167388 ) ) ( not ( = ?auto_2167385 ?auto_2167389 ) ) ( not ( = ?auto_2167385 ?auto_2167390 ) ) ( not ( = ?auto_2167385 ?auto_2167391 ) ) ( not ( = ?auto_2167385 ?auto_2167392 ) ) ( not ( = ?auto_2167385 ?auto_2167398 ) ) ( not ( = ?auto_2167387 ?auto_2167388 ) ) ( not ( = ?auto_2167387 ?auto_2167389 ) ) ( not ( = ?auto_2167387 ?auto_2167390 ) ) ( not ( = ?auto_2167387 ?auto_2167391 ) ) ( not ( = ?auto_2167387 ?auto_2167392 ) ) ( not ( = ?auto_2167387 ?auto_2167398 ) ) ( not ( = ?auto_2167388 ?auto_2167389 ) ) ( not ( = ?auto_2167388 ?auto_2167390 ) ) ( not ( = ?auto_2167388 ?auto_2167391 ) ) ( not ( = ?auto_2167388 ?auto_2167392 ) ) ( not ( = ?auto_2167388 ?auto_2167398 ) ) ( not ( = ?auto_2167389 ?auto_2167390 ) ) ( not ( = ?auto_2167389 ?auto_2167391 ) ) ( not ( = ?auto_2167389 ?auto_2167392 ) ) ( not ( = ?auto_2167389 ?auto_2167398 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2167390 ?auto_2167391 ?auto_2167392 )
      ( MAKE-12CRATE-VERIFY ?auto_2167381 ?auto_2167382 ?auto_2167383 ?auto_2167380 ?auto_2167384 ?auto_2167386 ?auto_2167385 ?auto_2167387 ?auto_2167388 ?auto_2167389 ?auto_2167390 ?auto_2167391 ?auto_2167392 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2167544 - SURFACE
      ?auto_2167545 - SURFACE
      ?auto_2167546 - SURFACE
      ?auto_2167543 - SURFACE
      ?auto_2167547 - SURFACE
      ?auto_2167549 - SURFACE
      ?auto_2167548 - SURFACE
      ?auto_2167550 - SURFACE
      ?auto_2167551 - SURFACE
      ?auto_2167552 - SURFACE
      ?auto_2167553 - SURFACE
      ?auto_2167554 - SURFACE
      ?auto_2167555 - SURFACE
    )
    :vars
    (
      ?auto_2167561 - HOIST
      ?auto_2167559 - PLACE
      ?auto_2167556 - PLACE
      ?auto_2167560 - HOIST
      ?auto_2167557 - SURFACE
      ?auto_2167558 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2167561 ?auto_2167559 ) ( IS-CRATE ?auto_2167555 ) ( not ( = ?auto_2167554 ?auto_2167555 ) ) ( not ( = ?auto_2167553 ?auto_2167554 ) ) ( not ( = ?auto_2167553 ?auto_2167555 ) ) ( not ( = ?auto_2167556 ?auto_2167559 ) ) ( HOIST-AT ?auto_2167560 ?auto_2167556 ) ( not ( = ?auto_2167561 ?auto_2167560 ) ) ( AVAILABLE ?auto_2167560 ) ( SURFACE-AT ?auto_2167555 ?auto_2167556 ) ( ON ?auto_2167555 ?auto_2167557 ) ( CLEAR ?auto_2167555 ) ( not ( = ?auto_2167554 ?auto_2167557 ) ) ( not ( = ?auto_2167555 ?auto_2167557 ) ) ( not ( = ?auto_2167553 ?auto_2167557 ) ) ( TRUCK-AT ?auto_2167558 ?auto_2167559 ) ( SURFACE-AT ?auto_2167553 ?auto_2167559 ) ( CLEAR ?auto_2167553 ) ( IS-CRATE ?auto_2167554 ) ( AVAILABLE ?auto_2167561 ) ( IN ?auto_2167554 ?auto_2167558 ) ( ON ?auto_2167545 ?auto_2167544 ) ( ON ?auto_2167546 ?auto_2167545 ) ( ON ?auto_2167543 ?auto_2167546 ) ( ON ?auto_2167547 ?auto_2167543 ) ( ON ?auto_2167549 ?auto_2167547 ) ( ON ?auto_2167548 ?auto_2167549 ) ( ON ?auto_2167550 ?auto_2167548 ) ( ON ?auto_2167551 ?auto_2167550 ) ( ON ?auto_2167552 ?auto_2167551 ) ( ON ?auto_2167553 ?auto_2167552 ) ( not ( = ?auto_2167544 ?auto_2167545 ) ) ( not ( = ?auto_2167544 ?auto_2167546 ) ) ( not ( = ?auto_2167544 ?auto_2167543 ) ) ( not ( = ?auto_2167544 ?auto_2167547 ) ) ( not ( = ?auto_2167544 ?auto_2167549 ) ) ( not ( = ?auto_2167544 ?auto_2167548 ) ) ( not ( = ?auto_2167544 ?auto_2167550 ) ) ( not ( = ?auto_2167544 ?auto_2167551 ) ) ( not ( = ?auto_2167544 ?auto_2167552 ) ) ( not ( = ?auto_2167544 ?auto_2167553 ) ) ( not ( = ?auto_2167544 ?auto_2167554 ) ) ( not ( = ?auto_2167544 ?auto_2167555 ) ) ( not ( = ?auto_2167544 ?auto_2167557 ) ) ( not ( = ?auto_2167545 ?auto_2167546 ) ) ( not ( = ?auto_2167545 ?auto_2167543 ) ) ( not ( = ?auto_2167545 ?auto_2167547 ) ) ( not ( = ?auto_2167545 ?auto_2167549 ) ) ( not ( = ?auto_2167545 ?auto_2167548 ) ) ( not ( = ?auto_2167545 ?auto_2167550 ) ) ( not ( = ?auto_2167545 ?auto_2167551 ) ) ( not ( = ?auto_2167545 ?auto_2167552 ) ) ( not ( = ?auto_2167545 ?auto_2167553 ) ) ( not ( = ?auto_2167545 ?auto_2167554 ) ) ( not ( = ?auto_2167545 ?auto_2167555 ) ) ( not ( = ?auto_2167545 ?auto_2167557 ) ) ( not ( = ?auto_2167546 ?auto_2167543 ) ) ( not ( = ?auto_2167546 ?auto_2167547 ) ) ( not ( = ?auto_2167546 ?auto_2167549 ) ) ( not ( = ?auto_2167546 ?auto_2167548 ) ) ( not ( = ?auto_2167546 ?auto_2167550 ) ) ( not ( = ?auto_2167546 ?auto_2167551 ) ) ( not ( = ?auto_2167546 ?auto_2167552 ) ) ( not ( = ?auto_2167546 ?auto_2167553 ) ) ( not ( = ?auto_2167546 ?auto_2167554 ) ) ( not ( = ?auto_2167546 ?auto_2167555 ) ) ( not ( = ?auto_2167546 ?auto_2167557 ) ) ( not ( = ?auto_2167543 ?auto_2167547 ) ) ( not ( = ?auto_2167543 ?auto_2167549 ) ) ( not ( = ?auto_2167543 ?auto_2167548 ) ) ( not ( = ?auto_2167543 ?auto_2167550 ) ) ( not ( = ?auto_2167543 ?auto_2167551 ) ) ( not ( = ?auto_2167543 ?auto_2167552 ) ) ( not ( = ?auto_2167543 ?auto_2167553 ) ) ( not ( = ?auto_2167543 ?auto_2167554 ) ) ( not ( = ?auto_2167543 ?auto_2167555 ) ) ( not ( = ?auto_2167543 ?auto_2167557 ) ) ( not ( = ?auto_2167547 ?auto_2167549 ) ) ( not ( = ?auto_2167547 ?auto_2167548 ) ) ( not ( = ?auto_2167547 ?auto_2167550 ) ) ( not ( = ?auto_2167547 ?auto_2167551 ) ) ( not ( = ?auto_2167547 ?auto_2167552 ) ) ( not ( = ?auto_2167547 ?auto_2167553 ) ) ( not ( = ?auto_2167547 ?auto_2167554 ) ) ( not ( = ?auto_2167547 ?auto_2167555 ) ) ( not ( = ?auto_2167547 ?auto_2167557 ) ) ( not ( = ?auto_2167549 ?auto_2167548 ) ) ( not ( = ?auto_2167549 ?auto_2167550 ) ) ( not ( = ?auto_2167549 ?auto_2167551 ) ) ( not ( = ?auto_2167549 ?auto_2167552 ) ) ( not ( = ?auto_2167549 ?auto_2167553 ) ) ( not ( = ?auto_2167549 ?auto_2167554 ) ) ( not ( = ?auto_2167549 ?auto_2167555 ) ) ( not ( = ?auto_2167549 ?auto_2167557 ) ) ( not ( = ?auto_2167548 ?auto_2167550 ) ) ( not ( = ?auto_2167548 ?auto_2167551 ) ) ( not ( = ?auto_2167548 ?auto_2167552 ) ) ( not ( = ?auto_2167548 ?auto_2167553 ) ) ( not ( = ?auto_2167548 ?auto_2167554 ) ) ( not ( = ?auto_2167548 ?auto_2167555 ) ) ( not ( = ?auto_2167548 ?auto_2167557 ) ) ( not ( = ?auto_2167550 ?auto_2167551 ) ) ( not ( = ?auto_2167550 ?auto_2167552 ) ) ( not ( = ?auto_2167550 ?auto_2167553 ) ) ( not ( = ?auto_2167550 ?auto_2167554 ) ) ( not ( = ?auto_2167550 ?auto_2167555 ) ) ( not ( = ?auto_2167550 ?auto_2167557 ) ) ( not ( = ?auto_2167551 ?auto_2167552 ) ) ( not ( = ?auto_2167551 ?auto_2167553 ) ) ( not ( = ?auto_2167551 ?auto_2167554 ) ) ( not ( = ?auto_2167551 ?auto_2167555 ) ) ( not ( = ?auto_2167551 ?auto_2167557 ) ) ( not ( = ?auto_2167552 ?auto_2167553 ) ) ( not ( = ?auto_2167552 ?auto_2167554 ) ) ( not ( = ?auto_2167552 ?auto_2167555 ) ) ( not ( = ?auto_2167552 ?auto_2167557 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2167553 ?auto_2167554 ?auto_2167555 )
      ( MAKE-12CRATE-VERIFY ?auto_2167544 ?auto_2167545 ?auto_2167546 ?auto_2167543 ?auto_2167547 ?auto_2167549 ?auto_2167548 ?auto_2167550 ?auto_2167551 ?auto_2167552 ?auto_2167553 ?auto_2167554 ?auto_2167555 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_2179148 - SURFACE
      ?auto_2179149 - SURFACE
      ?auto_2179150 - SURFACE
      ?auto_2179147 - SURFACE
      ?auto_2179151 - SURFACE
      ?auto_2179153 - SURFACE
      ?auto_2179152 - SURFACE
      ?auto_2179154 - SURFACE
      ?auto_2179155 - SURFACE
      ?auto_2179156 - SURFACE
      ?auto_2179157 - SURFACE
      ?auto_2179158 - SURFACE
      ?auto_2179159 - SURFACE
      ?auto_2179160 - SURFACE
    )
    :vars
    (
      ?auto_2179161 - HOIST
      ?auto_2179162 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2179161 ?auto_2179162 ) ( SURFACE-AT ?auto_2179159 ?auto_2179162 ) ( CLEAR ?auto_2179159 ) ( LIFTING ?auto_2179161 ?auto_2179160 ) ( IS-CRATE ?auto_2179160 ) ( not ( = ?auto_2179159 ?auto_2179160 ) ) ( ON ?auto_2179149 ?auto_2179148 ) ( ON ?auto_2179150 ?auto_2179149 ) ( ON ?auto_2179147 ?auto_2179150 ) ( ON ?auto_2179151 ?auto_2179147 ) ( ON ?auto_2179153 ?auto_2179151 ) ( ON ?auto_2179152 ?auto_2179153 ) ( ON ?auto_2179154 ?auto_2179152 ) ( ON ?auto_2179155 ?auto_2179154 ) ( ON ?auto_2179156 ?auto_2179155 ) ( ON ?auto_2179157 ?auto_2179156 ) ( ON ?auto_2179158 ?auto_2179157 ) ( ON ?auto_2179159 ?auto_2179158 ) ( not ( = ?auto_2179148 ?auto_2179149 ) ) ( not ( = ?auto_2179148 ?auto_2179150 ) ) ( not ( = ?auto_2179148 ?auto_2179147 ) ) ( not ( = ?auto_2179148 ?auto_2179151 ) ) ( not ( = ?auto_2179148 ?auto_2179153 ) ) ( not ( = ?auto_2179148 ?auto_2179152 ) ) ( not ( = ?auto_2179148 ?auto_2179154 ) ) ( not ( = ?auto_2179148 ?auto_2179155 ) ) ( not ( = ?auto_2179148 ?auto_2179156 ) ) ( not ( = ?auto_2179148 ?auto_2179157 ) ) ( not ( = ?auto_2179148 ?auto_2179158 ) ) ( not ( = ?auto_2179148 ?auto_2179159 ) ) ( not ( = ?auto_2179148 ?auto_2179160 ) ) ( not ( = ?auto_2179149 ?auto_2179150 ) ) ( not ( = ?auto_2179149 ?auto_2179147 ) ) ( not ( = ?auto_2179149 ?auto_2179151 ) ) ( not ( = ?auto_2179149 ?auto_2179153 ) ) ( not ( = ?auto_2179149 ?auto_2179152 ) ) ( not ( = ?auto_2179149 ?auto_2179154 ) ) ( not ( = ?auto_2179149 ?auto_2179155 ) ) ( not ( = ?auto_2179149 ?auto_2179156 ) ) ( not ( = ?auto_2179149 ?auto_2179157 ) ) ( not ( = ?auto_2179149 ?auto_2179158 ) ) ( not ( = ?auto_2179149 ?auto_2179159 ) ) ( not ( = ?auto_2179149 ?auto_2179160 ) ) ( not ( = ?auto_2179150 ?auto_2179147 ) ) ( not ( = ?auto_2179150 ?auto_2179151 ) ) ( not ( = ?auto_2179150 ?auto_2179153 ) ) ( not ( = ?auto_2179150 ?auto_2179152 ) ) ( not ( = ?auto_2179150 ?auto_2179154 ) ) ( not ( = ?auto_2179150 ?auto_2179155 ) ) ( not ( = ?auto_2179150 ?auto_2179156 ) ) ( not ( = ?auto_2179150 ?auto_2179157 ) ) ( not ( = ?auto_2179150 ?auto_2179158 ) ) ( not ( = ?auto_2179150 ?auto_2179159 ) ) ( not ( = ?auto_2179150 ?auto_2179160 ) ) ( not ( = ?auto_2179147 ?auto_2179151 ) ) ( not ( = ?auto_2179147 ?auto_2179153 ) ) ( not ( = ?auto_2179147 ?auto_2179152 ) ) ( not ( = ?auto_2179147 ?auto_2179154 ) ) ( not ( = ?auto_2179147 ?auto_2179155 ) ) ( not ( = ?auto_2179147 ?auto_2179156 ) ) ( not ( = ?auto_2179147 ?auto_2179157 ) ) ( not ( = ?auto_2179147 ?auto_2179158 ) ) ( not ( = ?auto_2179147 ?auto_2179159 ) ) ( not ( = ?auto_2179147 ?auto_2179160 ) ) ( not ( = ?auto_2179151 ?auto_2179153 ) ) ( not ( = ?auto_2179151 ?auto_2179152 ) ) ( not ( = ?auto_2179151 ?auto_2179154 ) ) ( not ( = ?auto_2179151 ?auto_2179155 ) ) ( not ( = ?auto_2179151 ?auto_2179156 ) ) ( not ( = ?auto_2179151 ?auto_2179157 ) ) ( not ( = ?auto_2179151 ?auto_2179158 ) ) ( not ( = ?auto_2179151 ?auto_2179159 ) ) ( not ( = ?auto_2179151 ?auto_2179160 ) ) ( not ( = ?auto_2179153 ?auto_2179152 ) ) ( not ( = ?auto_2179153 ?auto_2179154 ) ) ( not ( = ?auto_2179153 ?auto_2179155 ) ) ( not ( = ?auto_2179153 ?auto_2179156 ) ) ( not ( = ?auto_2179153 ?auto_2179157 ) ) ( not ( = ?auto_2179153 ?auto_2179158 ) ) ( not ( = ?auto_2179153 ?auto_2179159 ) ) ( not ( = ?auto_2179153 ?auto_2179160 ) ) ( not ( = ?auto_2179152 ?auto_2179154 ) ) ( not ( = ?auto_2179152 ?auto_2179155 ) ) ( not ( = ?auto_2179152 ?auto_2179156 ) ) ( not ( = ?auto_2179152 ?auto_2179157 ) ) ( not ( = ?auto_2179152 ?auto_2179158 ) ) ( not ( = ?auto_2179152 ?auto_2179159 ) ) ( not ( = ?auto_2179152 ?auto_2179160 ) ) ( not ( = ?auto_2179154 ?auto_2179155 ) ) ( not ( = ?auto_2179154 ?auto_2179156 ) ) ( not ( = ?auto_2179154 ?auto_2179157 ) ) ( not ( = ?auto_2179154 ?auto_2179158 ) ) ( not ( = ?auto_2179154 ?auto_2179159 ) ) ( not ( = ?auto_2179154 ?auto_2179160 ) ) ( not ( = ?auto_2179155 ?auto_2179156 ) ) ( not ( = ?auto_2179155 ?auto_2179157 ) ) ( not ( = ?auto_2179155 ?auto_2179158 ) ) ( not ( = ?auto_2179155 ?auto_2179159 ) ) ( not ( = ?auto_2179155 ?auto_2179160 ) ) ( not ( = ?auto_2179156 ?auto_2179157 ) ) ( not ( = ?auto_2179156 ?auto_2179158 ) ) ( not ( = ?auto_2179156 ?auto_2179159 ) ) ( not ( = ?auto_2179156 ?auto_2179160 ) ) ( not ( = ?auto_2179157 ?auto_2179158 ) ) ( not ( = ?auto_2179157 ?auto_2179159 ) ) ( not ( = ?auto_2179157 ?auto_2179160 ) ) ( not ( = ?auto_2179158 ?auto_2179159 ) ) ( not ( = ?auto_2179158 ?auto_2179160 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2179159 ?auto_2179160 )
      ( MAKE-13CRATE-VERIFY ?auto_2179148 ?auto_2179149 ?auto_2179150 ?auto_2179147 ?auto_2179151 ?auto_2179153 ?auto_2179152 ?auto_2179154 ?auto_2179155 ?auto_2179156 ?auto_2179157 ?auto_2179158 ?auto_2179159 ?auto_2179160 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_2179290 - SURFACE
      ?auto_2179291 - SURFACE
      ?auto_2179292 - SURFACE
      ?auto_2179289 - SURFACE
      ?auto_2179293 - SURFACE
      ?auto_2179295 - SURFACE
      ?auto_2179294 - SURFACE
      ?auto_2179296 - SURFACE
      ?auto_2179297 - SURFACE
      ?auto_2179298 - SURFACE
      ?auto_2179299 - SURFACE
      ?auto_2179300 - SURFACE
      ?auto_2179301 - SURFACE
      ?auto_2179302 - SURFACE
    )
    :vars
    (
      ?auto_2179304 - HOIST
      ?auto_2179305 - PLACE
      ?auto_2179303 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2179304 ?auto_2179305 ) ( SURFACE-AT ?auto_2179301 ?auto_2179305 ) ( CLEAR ?auto_2179301 ) ( IS-CRATE ?auto_2179302 ) ( not ( = ?auto_2179301 ?auto_2179302 ) ) ( TRUCK-AT ?auto_2179303 ?auto_2179305 ) ( AVAILABLE ?auto_2179304 ) ( IN ?auto_2179302 ?auto_2179303 ) ( ON ?auto_2179301 ?auto_2179300 ) ( not ( = ?auto_2179300 ?auto_2179301 ) ) ( not ( = ?auto_2179300 ?auto_2179302 ) ) ( ON ?auto_2179291 ?auto_2179290 ) ( ON ?auto_2179292 ?auto_2179291 ) ( ON ?auto_2179289 ?auto_2179292 ) ( ON ?auto_2179293 ?auto_2179289 ) ( ON ?auto_2179295 ?auto_2179293 ) ( ON ?auto_2179294 ?auto_2179295 ) ( ON ?auto_2179296 ?auto_2179294 ) ( ON ?auto_2179297 ?auto_2179296 ) ( ON ?auto_2179298 ?auto_2179297 ) ( ON ?auto_2179299 ?auto_2179298 ) ( ON ?auto_2179300 ?auto_2179299 ) ( not ( = ?auto_2179290 ?auto_2179291 ) ) ( not ( = ?auto_2179290 ?auto_2179292 ) ) ( not ( = ?auto_2179290 ?auto_2179289 ) ) ( not ( = ?auto_2179290 ?auto_2179293 ) ) ( not ( = ?auto_2179290 ?auto_2179295 ) ) ( not ( = ?auto_2179290 ?auto_2179294 ) ) ( not ( = ?auto_2179290 ?auto_2179296 ) ) ( not ( = ?auto_2179290 ?auto_2179297 ) ) ( not ( = ?auto_2179290 ?auto_2179298 ) ) ( not ( = ?auto_2179290 ?auto_2179299 ) ) ( not ( = ?auto_2179290 ?auto_2179300 ) ) ( not ( = ?auto_2179290 ?auto_2179301 ) ) ( not ( = ?auto_2179290 ?auto_2179302 ) ) ( not ( = ?auto_2179291 ?auto_2179292 ) ) ( not ( = ?auto_2179291 ?auto_2179289 ) ) ( not ( = ?auto_2179291 ?auto_2179293 ) ) ( not ( = ?auto_2179291 ?auto_2179295 ) ) ( not ( = ?auto_2179291 ?auto_2179294 ) ) ( not ( = ?auto_2179291 ?auto_2179296 ) ) ( not ( = ?auto_2179291 ?auto_2179297 ) ) ( not ( = ?auto_2179291 ?auto_2179298 ) ) ( not ( = ?auto_2179291 ?auto_2179299 ) ) ( not ( = ?auto_2179291 ?auto_2179300 ) ) ( not ( = ?auto_2179291 ?auto_2179301 ) ) ( not ( = ?auto_2179291 ?auto_2179302 ) ) ( not ( = ?auto_2179292 ?auto_2179289 ) ) ( not ( = ?auto_2179292 ?auto_2179293 ) ) ( not ( = ?auto_2179292 ?auto_2179295 ) ) ( not ( = ?auto_2179292 ?auto_2179294 ) ) ( not ( = ?auto_2179292 ?auto_2179296 ) ) ( not ( = ?auto_2179292 ?auto_2179297 ) ) ( not ( = ?auto_2179292 ?auto_2179298 ) ) ( not ( = ?auto_2179292 ?auto_2179299 ) ) ( not ( = ?auto_2179292 ?auto_2179300 ) ) ( not ( = ?auto_2179292 ?auto_2179301 ) ) ( not ( = ?auto_2179292 ?auto_2179302 ) ) ( not ( = ?auto_2179289 ?auto_2179293 ) ) ( not ( = ?auto_2179289 ?auto_2179295 ) ) ( not ( = ?auto_2179289 ?auto_2179294 ) ) ( not ( = ?auto_2179289 ?auto_2179296 ) ) ( not ( = ?auto_2179289 ?auto_2179297 ) ) ( not ( = ?auto_2179289 ?auto_2179298 ) ) ( not ( = ?auto_2179289 ?auto_2179299 ) ) ( not ( = ?auto_2179289 ?auto_2179300 ) ) ( not ( = ?auto_2179289 ?auto_2179301 ) ) ( not ( = ?auto_2179289 ?auto_2179302 ) ) ( not ( = ?auto_2179293 ?auto_2179295 ) ) ( not ( = ?auto_2179293 ?auto_2179294 ) ) ( not ( = ?auto_2179293 ?auto_2179296 ) ) ( not ( = ?auto_2179293 ?auto_2179297 ) ) ( not ( = ?auto_2179293 ?auto_2179298 ) ) ( not ( = ?auto_2179293 ?auto_2179299 ) ) ( not ( = ?auto_2179293 ?auto_2179300 ) ) ( not ( = ?auto_2179293 ?auto_2179301 ) ) ( not ( = ?auto_2179293 ?auto_2179302 ) ) ( not ( = ?auto_2179295 ?auto_2179294 ) ) ( not ( = ?auto_2179295 ?auto_2179296 ) ) ( not ( = ?auto_2179295 ?auto_2179297 ) ) ( not ( = ?auto_2179295 ?auto_2179298 ) ) ( not ( = ?auto_2179295 ?auto_2179299 ) ) ( not ( = ?auto_2179295 ?auto_2179300 ) ) ( not ( = ?auto_2179295 ?auto_2179301 ) ) ( not ( = ?auto_2179295 ?auto_2179302 ) ) ( not ( = ?auto_2179294 ?auto_2179296 ) ) ( not ( = ?auto_2179294 ?auto_2179297 ) ) ( not ( = ?auto_2179294 ?auto_2179298 ) ) ( not ( = ?auto_2179294 ?auto_2179299 ) ) ( not ( = ?auto_2179294 ?auto_2179300 ) ) ( not ( = ?auto_2179294 ?auto_2179301 ) ) ( not ( = ?auto_2179294 ?auto_2179302 ) ) ( not ( = ?auto_2179296 ?auto_2179297 ) ) ( not ( = ?auto_2179296 ?auto_2179298 ) ) ( not ( = ?auto_2179296 ?auto_2179299 ) ) ( not ( = ?auto_2179296 ?auto_2179300 ) ) ( not ( = ?auto_2179296 ?auto_2179301 ) ) ( not ( = ?auto_2179296 ?auto_2179302 ) ) ( not ( = ?auto_2179297 ?auto_2179298 ) ) ( not ( = ?auto_2179297 ?auto_2179299 ) ) ( not ( = ?auto_2179297 ?auto_2179300 ) ) ( not ( = ?auto_2179297 ?auto_2179301 ) ) ( not ( = ?auto_2179297 ?auto_2179302 ) ) ( not ( = ?auto_2179298 ?auto_2179299 ) ) ( not ( = ?auto_2179298 ?auto_2179300 ) ) ( not ( = ?auto_2179298 ?auto_2179301 ) ) ( not ( = ?auto_2179298 ?auto_2179302 ) ) ( not ( = ?auto_2179299 ?auto_2179300 ) ) ( not ( = ?auto_2179299 ?auto_2179301 ) ) ( not ( = ?auto_2179299 ?auto_2179302 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2179300 ?auto_2179301 ?auto_2179302 )
      ( MAKE-13CRATE-VERIFY ?auto_2179290 ?auto_2179291 ?auto_2179292 ?auto_2179289 ?auto_2179293 ?auto_2179295 ?auto_2179294 ?auto_2179296 ?auto_2179297 ?auto_2179298 ?auto_2179299 ?auto_2179300 ?auto_2179301 ?auto_2179302 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_2179446 - SURFACE
      ?auto_2179447 - SURFACE
      ?auto_2179448 - SURFACE
      ?auto_2179445 - SURFACE
      ?auto_2179449 - SURFACE
      ?auto_2179451 - SURFACE
      ?auto_2179450 - SURFACE
      ?auto_2179452 - SURFACE
      ?auto_2179453 - SURFACE
      ?auto_2179454 - SURFACE
      ?auto_2179455 - SURFACE
      ?auto_2179456 - SURFACE
      ?auto_2179457 - SURFACE
      ?auto_2179458 - SURFACE
    )
    :vars
    (
      ?auto_2179461 - HOIST
      ?auto_2179459 - PLACE
      ?auto_2179460 - TRUCK
      ?auto_2179462 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2179461 ?auto_2179459 ) ( SURFACE-AT ?auto_2179457 ?auto_2179459 ) ( CLEAR ?auto_2179457 ) ( IS-CRATE ?auto_2179458 ) ( not ( = ?auto_2179457 ?auto_2179458 ) ) ( AVAILABLE ?auto_2179461 ) ( IN ?auto_2179458 ?auto_2179460 ) ( ON ?auto_2179457 ?auto_2179456 ) ( not ( = ?auto_2179456 ?auto_2179457 ) ) ( not ( = ?auto_2179456 ?auto_2179458 ) ) ( TRUCK-AT ?auto_2179460 ?auto_2179462 ) ( not ( = ?auto_2179462 ?auto_2179459 ) ) ( ON ?auto_2179447 ?auto_2179446 ) ( ON ?auto_2179448 ?auto_2179447 ) ( ON ?auto_2179445 ?auto_2179448 ) ( ON ?auto_2179449 ?auto_2179445 ) ( ON ?auto_2179451 ?auto_2179449 ) ( ON ?auto_2179450 ?auto_2179451 ) ( ON ?auto_2179452 ?auto_2179450 ) ( ON ?auto_2179453 ?auto_2179452 ) ( ON ?auto_2179454 ?auto_2179453 ) ( ON ?auto_2179455 ?auto_2179454 ) ( ON ?auto_2179456 ?auto_2179455 ) ( not ( = ?auto_2179446 ?auto_2179447 ) ) ( not ( = ?auto_2179446 ?auto_2179448 ) ) ( not ( = ?auto_2179446 ?auto_2179445 ) ) ( not ( = ?auto_2179446 ?auto_2179449 ) ) ( not ( = ?auto_2179446 ?auto_2179451 ) ) ( not ( = ?auto_2179446 ?auto_2179450 ) ) ( not ( = ?auto_2179446 ?auto_2179452 ) ) ( not ( = ?auto_2179446 ?auto_2179453 ) ) ( not ( = ?auto_2179446 ?auto_2179454 ) ) ( not ( = ?auto_2179446 ?auto_2179455 ) ) ( not ( = ?auto_2179446 ?auto_2179456 ) ) ( not ( = ?auto_2179446 ?auto_2179457 ) ) ( not ( = ?auto_2179446 ?auto_2179458 ) ) ( not ( = ?auto_2179447 ?auto_2179448 ) ) ( not ( = ?auto_2179447 ?auto_2179445 ) ) ( not ( = ?auto_2179447 ?auto_2179449 ) ) ( not ( = ?auto_2179447 ?auto_2179451 ) ) ( not ( = ?auto_2179447 ?auto_2179450 ) ) ( not ( = ?auto_2179447 ?auto_2179452 ) ) ( not ( = ?auto_2179447 ?auto_2179453 ) ) ( not ( = ?auto_2179447 ?auto_2179454 ) ) ( not ( = ?auto_2179447 ?auto_2179455 ) ) ( not ( = ?auto_2179447 ?auto_2179456 ) ) ( not ( = ?auto_2179447 ?auto_2179457 ) ) ( not ( = ?auto_2179447 ?auto_2179458 ) ) ( not ( = ?auto_2179448 ?auto_2179445 ) ) ( not ( = ?auto_2179448 ?auto_2179449 ) ) ( not ( = ?auto_2179448 ?auto_2179451 ) ) ( not ( = ?auto_2179448 ?auto_2179450 ) ) ( not ( = ?auto_2179448 ?auto_2179452 ) ) ( not ( = ?auto_2179448 ?auto_2179453 ) ) ( not ( = ?auto_2179448 ?auto_2179454 ) ) ( not ( = ?auto_2179448 ?auto_2179455 ) ) ( not ( = ?auto_2179448 ?auto_2179456 ) ) ( not ( = ?auto_2179448 ?auto_2179457 ) ) ( not ( = ?auto_2179448 ?auto_2179458 ) ) ( not ( = ?auto_2179445 ?auto_2179449 ) ) ( not ( = ?auto_2179445 ?auto_2179451 ) ) ( not ( = ?auto_2179445 ?auto_2179450 ) ) ( not ( = ?auto_2179445 ?auto_2179452 ) ) ( not ( = ?auto_2179445 ?auto_2179453 ) ) ( not ( = ?auto_2179445 ?auto_2179454 ) ) ( not ( = ?auto_2179445 ?auto_2179455 ) ) ( not ( = ?auto_2179445 ?auto_2179456 ) ) ( not ( = ?auto_2179445 ?auto_2179457 ) ) ( not ( = ?auto_2179445 ?auto_2179458 ) ) ( not ( = ?auto_2179449 ?auto_2179451 ) ) ( not ( = ?auto_2179449 ?auto_2179450 ) ) ( not ( = ?auto_2179449 ?auto_2179452 ) ) ( not ( = ?auto_2179449 ?auto_2179453 ) ) ( not ( = ?auto_2179449 ?auto_2179454 ) ) ( not ( = ?auto_2179449 ?auto_2179455 ) ) ( not ( = ?auto_2179449 ?auto_2179456 ) ) ( not ( = ?auto_2179449 ?auto_2179457 ) ) ( not ( = ?auto_2179449 ?auto_2179458 ) ) ( not ( = ?auto_2179451 ?auto_2179450 ) ) ( not ( = ?auto_2179451 ?auto_2179452 ) ) ( not ( = ?auto_2179451 ?auto_2179453 ) ) ( not ( = ?auto_2179451 ?auto_2179454 ) ) ( not ( = ?auto_2179451 ?auto_2179455 ) ) ( not ( = ?auto_2179451 ?auto_2179456 ) ) ( not ( = ?auto_2179451 ?auto_2179457 ) ) ( not ( = ?auto_2179451 ?auto_2179458 ) ) ( not ( = ?auto_2179450 ?auto_2179452 ) ) ( not ( = ?auto_2179450 ?auto_2179453 ) ) ( not ( = ?auto_2179450 ?auto_2179454 ) ) ( not ( = ?auto_2179450 ?auto_2179455 ) ) ( not ( = ?auto_2179450 ?auto_2179456 ) ) ( not ( = ?auto_2179450 ?auto_2179457 ) ) ( not ( = ?auto_2179450 ?auto_2179458 ) ) ( not ( = ?auto_2179452 ?auto_2179453 ) ) ( not ( = ?auto_2179452 ?auto_2179454 ) ) ( not ( = ?auto_2179452 ?auto_2179455 ) ) ( not ( = ?auto_2179452 ?auto_2179456 ) ) ( not ( = ?auto_2179452 ?auto_2179457 ) ) ( not ( = ?auto_2179452 ?auto_2179458 ) ) ( not ( = ?auto_2179453 ?auto_2179454 ) ) ( not ( = ?auto_2179453 ?auto_2179455 ) ) ( not ( = ?auto_2179453 ?auto_2179456 ) ) ( not ( = ?auto_2179453 ?auto_2179457 ) ) ( not ( = ?auto_2179453 ?auto_2179458 ) ) ( not ( = ?auto_2179454 ?auto_2179455 ) ) ( not ( = ?auto_2179454 ?auto_2179456 ) ) ( not ( = ?auto_2179454 ?auto_2179457 ) ) ( not ( = ?auto_2179454 ?auto_2179458 ) ) ( not ( = ?auto_2179455 ?auto_2179456 ) ) ( not ( = ?auto_2179455 ?auto_2179457 ) ) ( not ( = ?auto_2179455 ?auto_2179458 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2179456 ?auto_2179457 ?auto_2179458 )
      ( MAKE-13CRATE-VERIFY ?auto_2179446 ?auto_2179447 ?auto_2179448 ?auto_2179445 ?auto_2179449 ?auto_2179451 ?auto_2179450 ?auto_2179452 ?auto_2179453 ?auto_2179454 ?auto_2179455 ?auto_2179456 ?auto_2179457 ?auto_2179458 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_2179615 - SURFACE
      ?auto_2179616 - SURFACE
      ?auto_2179617 - SURFACE
      ?auto_2179614 - SURFACE
      ?auto_2179618 - SURFACE
      ?auto_2179620 - SURFACE
      ?auto_2179619 - SURFACE
      ?auto_2179621 - SURFACE
      ?auto_2179622 - SURFACE
      ?auto_2179623 - SURFACE
      ?auto_2179624 - SURFACE
      ?auto_2179625 - SURFACE
      ?auto_2179626 - SURFACE
      ?auto_2179627 - SURFACE
    )
    :vars
    (
      ?auto_2179629 - HOIST
      ?auto_2179631 - PLACE
      ?auto_2179628 - TRUCK
      ?auto_2179630 - PLACE
      ?auto_2179632 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2179629 ?auto_2179631 ) ( SURFACE-AT ?auto_2179626 ?auto_2179631 ) ( CLEAR ?auto_2179626 ) ( IS-CRATE ?auto_2179627 ) ( not ( = ?auto_2179626 ?auto_2179627 ) ) ( AVAILABLE ?auto_2179629 ) ( ON ?auto_2179626 ?auto_2179625 ) ( not ( = ?auto_2179625 ?auto_2179626 ) ) ( not ( = ?auto_2179625 ?auto_2179627 ) ) ( TRUCK-AT ?auto_2179628 ?auto_2179630 ) ( not ( = ?auto_2179630 ?auto_2179631 ) ) ( HOIST-AT ?auto_2179632 ?auto_2179630 ) ( LIFTING ?auto_2179632 ?auto_2179627 ) ( not ( = ?auto_2179629 ?auto_2179632 ) ) ( ON ?auto_2179616 ?auto_2179615 ) ( ON ?auto_2179617 ?auto_2179616 ) ( ON ?auto_2179614 ?auto_2179617 ) ( ON ?auto_2179618 ?auto_2179614 ) ( ON ?auto_2179620 ?auto_2179618 ) ( ON ?auto_2179619 ?auto_2179620 ) ( ON ?auto_2179621 ?auto_2179619 ) ( ON ?auto_2179622 ?auto_2179621 ) ( ON ?auto_2179623 ?auto_2179622 ) ( ON ?auto_2179624 ?auto_2179623 ) ( ON ?auto_2179625 ?auto_2179624 ) ( not ( = ?auto_2179615 ?auto_2179616 ) ) ( not ( = ?auto_2179615 ?auto_2179617 ) ) ( not ( = ?auto_2179615 ?auto_2179614 ) ) ( not ( = ?auto_2179615 ?auto_2179618 ) ) ( not ( = ?auto_2179615 ?auto_2179620 ) ) ( not ( = ?auto_2179615 ?auto_2179619 ) ) ( not ( = ?auto_2179615 ?auto_2179621 ) ) ( not ( = ?auto_2179615 ?auto_2179622 ) ) ( not ( = ?auto_2179615 ?auto_2179623 ) ) ( not ( = ?auto_2179615 ?auto_2179624 ) ) ( not ( = ?auto_2179615 ?auto_2179625 ) ) ( not ( = ?auto_2179615 ?auto_2179626 ) ) ( not ( = ?auto_2179615 ?auto_2179627 ) ) ( not ( = ?auto_2179616 ?auto_2179617 ) ) ( not ( = ?auto_2179616 ?auto_2179614 ) ) ( not ( = ?auto_2179616 ?auto_2179618 ) ) ( not ( = ?auto_2179616 ?auto_2179620 ) ) ( not ( = ?auto_2179616 ?auto_2179619 ) ) ( not ( = ?auto_2179616 ?auto_2179621 ) ) ( not ( = ?auto_2179616 ?auto_2179622 ) ) ( not ( = ?auto_2179616 ?auto_2179623 ) ) ( not ( = ?auto_2179616 ?auto_2179624 ) ) ( not ( = ?auto_2179616 ?auto_2179625 ) ) ( not ( = ?auto_2179616 ?auto_2179626 ) ) ( not ( = ?auto_2179616 ?auto_2179627 ) ) ( not ( = ?auto_2179617 ?auto_2179614 ) ) ( not ( = ?auto_2179617 ?auto_2179618 ) ) ( not ( = ?auto_2179617 ?auto_2179620 ) ) ( not ( = ?auto_2179617 ?auto_2179619 ) ) ( not ( = ?auto_2179617 ?auto_2179621 ) ) ( not ( = ?auto_2179617 ?auto_2179622 ) ) ( not ( = ?auto_2179617 ?auto_2179623 ) ) ( not ( = ?auto_2179617 ?auto_2179624 ) ) ( not ( = ?auto_2179617 ?auto_2179625 ) ) ( not ( = ?auto_2179617 ?auto_2179626 ) ) ( not ( = ?auto_2179617 ?auto_2179627 ) ) ( not ( = ?auto_2179614 ?auto_2179618 ) ) ( not ( = ?auto_2179614 ?auto_2179620 ) ) ( not ( = ?auto_2179614 ?auto_2179619 ) ) ( not ( = ?auto_2179614 ?auto_2179621 ) ) ( not ( = ?auto_2179614 ?auto_2179622 ) ) ( not ( = ?auto_2179614 ?auto_2179623 ) ) ( not ( = ?auto_2179614 ?auto_2179624 ) ) ( not ( = ?auto_2179614 ?auto_2179625 ) ) ( not ( = ?auto_2179614 ?auto_2179626 ) ) ( not ( = ?auto_2179614 ?auto_2179627 ) ) ( not ( = ?auto_2179618 ?auto_2179620 ) ) ( not ( = ?auto_2179618 ?auto_2179619 ) ) ( not ( = ?auto_2179618 ?auto_2179621 ) ) ( not ( = ?auto_2179618 ?auto_2179622 ) ) ( not ( = ?auto_2179618 ?auto_2179623 ) ) ( not ( = ?auto_2179618 ?auto_2179624 ) ) ( not ( = ?auto_2179618 ?auto_2179625 ) ) ( not ( = ?auto_2179618 ?auto_2179626 ) ) ( not ( = ?auto_2179618 ?auto_2179627 ) ) ( not ( = ?auto_2179620 ?auto_2179619 ) ) ( not ( = ?auto_2179620 ?auto_2179621 ) ) ( not ( = ?auto_2179620 ?auto_2179622 ) ) ( not ( = ?auto_2179620 ?auto_2179623 ) ) ( not ( = ?auto_2179620 ?auto_2179624 ) ) ( not ( = ?auto_2179620 ?auto_2179625 ) ) ( not ( = ?auto_2179620 ?auto_2179626 ) ) ( not ( = ?auto_2179620 ?auto_2179627 ) ) ( not ( = ?auto_2179619 ?auto_2179621 ) ) ( not ( = ?auto_2179619 ?auto_2179622 ) ) ( not ( = ?auto_2179619 ?auto_2179623 ) ) ( not ( = ?auto_2179619 ?auto_2179624 ) ) ( not ( = ?auto_2179619 ?auto_2179625 ) ) ( not ( = ?auto_2179619 ?auto_2179626 ) ) ( not ( = ?auto_2179619 ?auto_2179627 ) ) ( not ( = ?auto_2179621 ?auto_2179622 ) ) ( not ( = ?auto_2179621 ?auto_2179623 ) ) ( not ( = ?auto_2179621 ?auto_2179624 ) ) ( not ( = ?auto_2179621 ?auto_2179625 ) ) ( not ( = ?auto_2179621 ?auto_2179626 ) ) ( not ( = ?auto_2179621 ?auto_2179627 ) ) ( not ( = ?auto_2179622 ?auto_2179623 ) ) ( not ( = ?auto_2179622 ?auto_2179624 ) ) ( not ( = ?auto_2179622 ?auto_2179625 ) ) ( not ( = ?auto_2179622 ?auto_2179626 ) ) ( not ( = ?auto_2179622 ?auto_2179627 ) ) ( not ( = ?auto_2179623 ?auto_2179624 ) ) ( not ( = ?auto_2179623 ?auto_2179625 ) ) ( not ( = ?auto_2179623 ?auto_2179626 ) ) ( not ( = ?auto_2179623 ?auto_2179627 ) ) ( not ( = ?auto_2179624 ?auto_2179625 ) ) ( not ( = ?auto_2179624 ?auto_2179626 ) ) ( not ( = ?auto_2179624 ?auto_2179627 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2179625 ?auto_2179626 ?auto_2179627 )
      ( MAKE-13CRATE-VERIFY ?auto_2179615 ?auto_2179616 ?auto_2179617 ?auto_2179614 ?auto_2179618 ?auto_2179620 ?auto_2179619 ?auto_2179621 ?auto_2179622 ?auto_2179623 ?auto_2179624 ?auto_2179625 ?auto_2179626 ?auto_2179627 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_2179797 - SURFACE
      ?auto_2179798 - SURFACE
      ?auto_2179799 - SURFACE
      ?auto_2179796 - SURFACE
      ?auto_2179800 - SURFACE
      ?auto_2179802 - SURFACE
      ?auto_2179801 - SURFACE
      ?auto_2179803 - SURFACE
      ?auto_2179804 - SURFACE
      ?auto_2179805 - SURFACE
      ?auto_2179806 - SURFACE
      ?auto_2179807 - SURFACE
      ?auto_2179808 - SURFACE
      ?auto_2179809 - SURFACE
    )
    :vars
    (
      ?auto_2179815 - HOIST
      ?auto_2179810 - PLACE
      ?auto_2179811 - TRUCK
      ?auto_2179813 - PLACE
      ?auto_2179814 - HOIST
      ?auto_2179812 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2179815 ?auto_2179810 ) ( SURFACE-AT ?auto_2179808 ?auto_2179810 ) ( CLEAR ?auto_2179808 ) ( IS-CRATE ?auto_2179809 ) ( not ( = ?auto_2179808 ?auto_2179809 ) ) ( AVAILABLE ?auto_2179815 ) ( ON ?auto_2179808 ?auto_2179807 ) ( not ( = ?auto_2179807 ?auto_2179808 ) ) ( not ( = ?auto_2179807 ?auto_2179809 ) ) ( TRUCK-AT ?auto_2179811 ?auto_2179813 ) ( not ( = ?auto_2179813 ?auto_2179810 ) ) ( HOIST-AT ?auto_2179814 ?auto_2179813 ) ( not ( = ?auto_2179815 ?auto_2179814 ) ) ( AVAILABLE ?auto_2179814 ) ( SURFACE-AT ?auto_2179809 ?auto_2179813 ) ( ON ?auto_2179809 ?auto_2179812 ) ( CLEAR ?auto_2179809 ) ( not ( = ?auto_2179808 ?auto_2179812 ) ) ( not ( = ?auto_2179809 ?auto_2179812 ) ) ( not ( = ?auto_2179807 ?auto_2179812 ) ) ( ON ?auto_2179798 ?auto_2179797 ) ( ON ?auto_2179799 ?auto_2179798 ) ( ON ?auto_2179796 ?auto_2179799 ) ( ON ?auto_2179800 ?auto_2179796 ) ( ON ?auto_2179802 ?auto_2179800 ) ( ON ?auto_2179801 ?auto_2179802 ) ( ON ?auto_2179803 ?auto_2179801 ) ( ON ?auto_2179804 ?auto_2179803 ) ( ON ?auto_2179805 ?auto_2179804 ) ( ON ?auto_2179806 ?auto_2179805 ) ( ON ?auto_2179807 ?auto_2179806 ) ( not ( = ?auto_2179797 ?auto_2179798 ) ) ( not ( = ?auto_2179797 ?auto_2179799 ) ) ( not ( = ?auto_2179797 ?auto_2179796 ) ) ( not ( = ?auto_2179797 ?auto_2179800 ) ) ( not ( = ?auto_2179797 ?auto_2179802 ) ) ( not ( = ?auto_2179797 ?auto_2179801 ) ) ( not ( = ?auto_2179797 ?auto_2179803 ) ) ( not ( = ?auto_2179797 ?auto_2179804 ) ) ( not ( = ?auto_2179797 ?auto_2179805 ) ) ( not ( = ?auto_2179797 ?auto_2179806 ) ) ( not ( = ?auto_2179797 ?auto_2179807 ) ) ( not ( = ?auto_2179797 ?auto_2179808 ) ) ( not ( = ?auto_2179797 ?auto_2179809 ) ) ( not ( = ?auto_2179797 ?auto_2179812 ) ) ( not ( = ?auto_2179798 ?auto_2179799 ) ) ( not ( = ?auto_2179798 ?auto_2179796 ) ) ( not ( = ?auto_2179798 ?auto_2179800 ) ) ( not ( = ?auto_2179798 ?auto_2179802 ) ) ( not ( = ?auto_2179798 ?auto_2179801 ) ) ( not ( = ?auto_2179798 ?auto_2179803 ) ) ( not ( = ?auto_2179798 ?auto_2179804 ) ) ( not ( = ?auto_2179798 ?auto_2179805 ) ) ( not ( = ?auto_2179798 ?auto_2179806 ) ) ( not ( = ?auto_2179798 ?auto_2179807 ) ) ( not ( = ?auto_2179798 ?auto_2179808 ) ) ( not ( = ?auto_2179798 ?auto_2179809 ) ) ( not ( = ?auto_2179798 ?auto_2179812 ) ) ( not ( = ?auto_2179799 ?auto_2179796 ) ) ( not ( = ?auto_2179799 ?auto_2179800 ) ) ( not ( = ?auto_2179799 ?auto_2179802 ) ) ( not ( = ?auto_2179799 ?auto_2179801 ) ) ( not ( = ?auto_2179799 ?auto_2179803 ) ) ( not ( = ?auto_2179799 ?auto_2179804 ) ) ( not ( = ?auto_2179799 ?auto_2179805 ) ) ( not ( = ?auto_2179799 ?auto_2179806 ) ) ( not ( = ?auto_2179799 ?auto_2179807 ) ) ( not ( = ?auto_2179799 ?auto_2179808 ) ) ( not ( = ?auto_2179799 ?auto_2179809 ) ) ( not ( = ?auto_2179799 ?auto_2179812 ) ) ( not ( = ?auto_2179796 ?auto_2179800 ) ) ( not ( = ?auto_2179796 ?auto_2179802 ) ) ( not ( = ?auto_2179796 ?auto_2179801 ) ) ( not ( = ?auto_2179796 ?auto_2179803 ) ) ( not ( = ?auto_2179796 ?auto_2179804 ) ) ( not ( = ?auto_2179796 ?auto_2179805 ) ) ( not ( = ?auto_2179796 ?auto_2179806 ) ) ( not ( = ?auto_2179796 ?auto_2179807 ) ) ( not ( = ?auto_2179796 ?auto_2179808 ) ) ( not ( = ?auto_2179796 ?auto_2179809 ) ) ( not ( = ?auto_2179796 ?auto_2179812 ) ) ( not ( = ?auto_2179800 ?auto_2179802 ) ) ( not ( = ?auto_2179800 ?auto_2179801 ) ) ( not ( = ?auto_2179800 ?auto_2179803 ) ) ( not ( = ?auto_2179800 ?auto_2179804 ) ) ( not ( = ?auto_2179800 ?auto_2179805 ) ) ( not ( = ?auto_2179800 ?auto_2179806 ) ) ( not ( = ?auto_2179800 ?auto_2179807 ) ) ( not ( = ?auto_2179800 ?auto_2179808 ) ) ( not ( = ?auto_2179800 ?auto_2179809 ) ) ( not ( = ?auto_2179800 ?auto_2179812 ) ) ( not ( = ?auto_2179802 ?auto_2179801 ) ) ( not ( = ?auto_2179802 ?auto_2179803 ) ) ( not ( = ?auto_2179802 ?auto_2179804 ) ) ( not ( = ?auto_2179802 ?auto_2179805 ) ) ( not ( = ?auto_2179802 ?auto_2179806 ) ) ( not ( = ?auto_2179802 ?auto_2179807 ) ) ( not ( = ?auto_2179802 ?auto_2179808 ) ) ( not ( = ?auto_2179802 ?auto_2179809 ) ) ( not ( = ?auto_2179802 ?auto_2179812 ) ) ( not ( = ?auto_2179801 ?auto_2179803 ) ) ( not ( = ?auto_2179801 ?auto_2179804 ) ) ( not ( = ?auto_2179801 ?auto_2179805 ) ) ( not ( = ?auto_2179801 ?auto_2179806 ) ) ( not ( = ?auto_2179801 ?auto_2179807 ) ) ( not ( = ?auto_2179801 ?auto_2179808 ) ) ( not ( = ?auto_2179801 ?auto_2179809 ) ) ( not ( = ?auto_2179801 ?auto_2179812 ) ) ( not ( = ?auto_2179803 ?auto_2179804 ) ) ( not ( = ?auto_2179803 ?auto_2179805 ) ) ( not ( = ?auto_2179803 ?auto_2179806 ) ) ( not ( = ?auto_2179803 ?auto_2179807 ) ) ( not ( = ?auto_2179803 ?auto_2179808 ) ) ( not ( = ?auto_2179803 ?auto_2179809 ) ) ( not ( = ?auto_2179803 ?auto_2179812 ) ) ( not ( = ?auto_2179804 ?auto_2179805 ) ) ( not ( = ?auto_2179804 ?auto_2179806 ) ) ( not ( = ?auto_2179804 ?auto_2179807 ) ) ( not ( = ?auto_2179804 ?auto_2179808 ) ) ( not ( = ?auto_2179804 ?auto_2179809 ) ) ( not ( = ?auto_2179804 ?auto_2179812 ) ) ( not ( = ?auto_2179805 ?auto_2179806 ) ) ( not ( = ?auto_2179805 ?auto_2179807 ) ) ( not ( = ?auto_2179805 ?auto_2179808 ) ) ( not ( = ?auto_2179805 ?auto_2179809 ) ) ( not ( = ?auto_2179805 ?auto_2179812 ) ) ( not ( = ?auto_2179806 ?auto_2179807 ) ) ( not ( = ?auto_2179806 ?auto_2179808 ) ) ( not ( = ?auto_2179806 ?auto_2179809 ) ) ( not ( = ?auto_2179806 ?auto_2179812 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2179807 ?auto_2179808 ?auto_2179809 )
      ( MAKE-13CRATE-VERIFY ?auto_2179797 ?auto_2179798 ?auto_2179799 ?auto_2179796 ?auto_2179800 ?auto_2179802 ?auto_2179801 ?auto_2179803 ?auto_2179804 ?auto_2179805 ?auto_2179806 ?auto_2179807 ?auto_2179808 ?auto_2179809 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_2179980 - SURFACE
      ?auto_2179981 - SURFACE
      ?auto_2179982 - SURFACE
      ?auto_2179979 - SURFACE
      ?auto_2179983 - SURFACE
      ?auto_2179985 - SURFACE
      ?auto_2179984 - SURFACE
      ?auto_2179986 - SURFACE
      ?auto_2179987 - SURFACE
      ?auto_2179988 - SURFACE
      ?auto_2179989 - SURFACE
      ?auto_2179990 - SURFACE
      ?auto_2179991 - SURFACE
      ?auto_2179992 - SURFACE
    )
    :vars
    (
      ?auto_2179996 - HOIST
      ?auto_2179994 - PLACE
      ?auto_2179995 - PLACE
      ?auto_2179998 - HOIST
      ?auto_2179997 - SURFACE
      ?auto_2179993 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2179996 ?auto_2179994 ) ( SURFACE-AT ?auto_2179991 ?auto_2179994 ) ( CLEAR ?auto_2179991 ) ( IS-CRATE ?auto_2179992 ) ( not ( = ?auto_2179991 ?auto_2179992 ) ) ( AVAILABLE ?auto_2179996 ) ( ON ?auto_2179991 ?auto_2179990 ) ( not ( = ?auto_2179990 ?auto_2179991 ) ) ( not ( = ?auto_2179990 ?auto_2179992 ) ) ( not ( = ?auto_2179995 ?auto_2179994 ) ) ( HOIST-AT ?auto_2179998 ?auto_2179995 ) ( not ( = ?auto_2179996 ?auto_2179998 ) ) ( AVAILABLE ?auto_2179998 ) ( SURFACE-AT ?auto_2179992 ?auto_2179995 ) ( ON ?auto_2179992 ?auto_2179997 ) ( CLEAR ?auto_2179992 ) ( not ( = ?auto_2179991 ?auto_2179997 ) ) ( not ( = ?auto_2179992 ?auto_2179997 ) ) ( not ( = ?auto_2179990 ?auto_2179997 ) ) ( TRUCK-AT ?auto_2179993 ?auto_2179994 ) ( ON ?auto_2179981 ?auto_2179980 ) ( ON ?auto_2179982 ?auto_2179981 ) ( ON ?auto_2179979 ?auto_2179982 ) ( ON ?auto_2179983 ?auto_2179979 ) ( ON ?auto_2179985 ?auto_2179983 ) ( ON ?auto_2179984 ?auto_2179985 ) ( ON ?auto_2179986 ?auto_2179984 ) ( ON ?auto_2179987 ?auto_2179986 ) ( ON ?auto_2179988 ?auto_2179987 ) ( ON ?auto_2179989 ?auto_2179988 ) ( ON ?auto_2179990 ?auto_2179989 ) ( not ( = ?auto_2179980 ?auto_2179981 ) ) ( not ( = ?auto_2179980 ?auto_2179982 ) ) ( not ( = ?auto_2179980 ?auto_2179979 ) ) ( not ( = ?auto_2179980 ?auto_2179983 ) ) ( not ( = ?auto_2179980 ?auto_2179985 ) ) ( not ( = ?auto_2179980 ?auto_2179984 ) ) ( not ( = ?auto_2179980 ?auto_2179986 ) ) ( not ( = ?auto_2179980 ?auto_2179987 ) ) ( not ( = ?auto_2179980 ?auto_2179988 ) ) ( not ( = ?auto_2179980 ?auto_2179989 ) ) ( not ( = ?auto_2179980 ?auto_2179990 ) ) ( not ( = ?auto_2179980 ?auto_2179991 ) ) ( not ( = ?auto_2179980 ?auto_2179992 ) ) ( not ( = ?auto_2179980 ?auto_2179997 ) ) ( not ( = ?auto_2179981 ?auto_2179982 ) ) ( not ( = ?auto_2179981 ?auto_2179979 ) ) ( not ( = ?auto_2179981 ?auto_2179983 ) ) ( not ( = ?auto_2179981 ?auto_2179985 ) ) ( not ( = ?auto_2179981 ?auto_2179984 ) ) ( not ( = ?auto_2179981 ?auto_2179986 ) ) ( not ( = ?auto_2179981 ?auto_2179987 ) ) ( not ( = ?auto_2179981 ?auto_2179988 ) ) ( not ( = ?auto_2179981 ?auto_2179989 ) ) ( not ( = ?auto_2179981 ?auto_2179990 ) ) ( not ( = ?auto_2179981 ?auto_2179991 ) ) ( not ( = ?auto_2179981 ?auto_2179992 ) ) ( not ( = ?auto_2179981 ?auto_2179997 ) ) ( not ( = ?auto_2179982 ?auto_2179979 ) ) ( not ( = ?auto_2179982 ?auto_2179983 ) ) ( not ( = ?auto_2179982 ?auto_2179985 ) ) ( not ( = ?auto_2179982 ?auto_2179984 ) ) ( not ( = ?auto_2179982 ?auto_2179986 ) ) ( not ( = ?auto_2179982 ?auto_2179987 ) ) ( not ( = ?auto_2179982 ?auto_2179988 ) ) ( not ( = ?auto_2179982 ?auto_2179989 ) ) ( not ( = ?auto_2179982 ?auto_2179990 ) ) ( not ( = ?auto_2179982 ?auto_2179991 ) ) ( not ( = ?auto_2179982 ?auto_2179992 ) ) ( not ( = ?auto_2179982 ?auto_2179997 ) ) ( not ( = ?auto_2179979 ?auto_2179983 ) ) ( not ( = ?auto_2179979 ?auto_2179985 ) ) ( not ( = ?auto_2179979 ?auto_2179984 ) ) ( not ( = ?auto_2179979 ?auto_2179986 ) ) ( not ( = ?auto_2179979 ?auto_2179987 ) ) ( not ( = ?auto_2179979 ?auto_2179988 ) ) ( not ( = ?auto_2179979 ?auto_2179989 ) ) ( not ( = ?auto_2179979 ?auto_2179990 ) ) ( not ( = ?auto_2179979 ?auto_2179991 ) ) ( not ( = ?auto_2179979 ?auto_2179992 ) ) ( not ( = ?auto_2179979 ?auto_2179997 ) ) ( not ( = ?auto_2179983 ?auto_2179985 ) ) ( not ( = ?auto_2179983 ?auto_2179984 ) ) ( not ( = ?auto_2179983 ?auto_2179986 ) ) ( not ( = ?auto_2179983 ?auto_2179987 ) ) ( not ( = ?auto_2179983 ?auto_2179988 ) ) ( not ( = ?auto_2179983 ?auto_2179989 ) ) ( not ( = ?auto_2179983 ?auto_2179990 ) ) ( not ( = ?auto_2179983 ?auto_2179991 ) ) ( not ( = ?auto_2179983 ?auto_2179992 ) ) ( not ( = ?auto_2179983 ?auto_2179997 ) ) ( not ( = ?auto_2179985 ?auto_2179984 ) ) ( not ( = ?auto_2179985 ?auto_2179986 ) ) ( not ( = ?auto_2179985 ?auto_2179987 ) ) ( not ( = ?auto_2179985 ?auto_2179988 ) ) ( not ( = ?auto_2179985 ?auto_2179989 ) ) ( not ( = ?auto_2179985 ?auto_2179990 ) ) ( not ( = ?auto_2179985 ?auto_2179991 ) ) ( not ( = ?auto_2179985 ?auto_2179992 ) ) ( not ( = ?auto_2179985 ?auto_2179997 ) ) ( not ( = ?auto_2179984 ?auto_2179986 ) ) ( not ( = ?auto_2179984 ?auto_2179987 ) ) ( not ( = ?auto_2179984 ?auto_2179988 ) ) ( not ( = ?auto_2179984 ?auto_2179989 ) ) ( not ( = ?auto_2179984 ?auto_2179990 ) ) ( not ( = ?auto_2179984 ?auto_2179991 ) ) ( not ( = ?auto_2179984 ?auto_2179992 ) ) ( not ( = ?auto_2179984 ?auto_2179997 ) ) ( not ( = ?auto_2179986 ?auto_2179987 ) ) ( not ( = ?auto_2179986 ?auto_2179988 ) ) ( not ( = ?auto_2179986 ?auto_2179989 ) ) ( not ( = ?auto_2179986 ?auto_2179990 ) ) ( not ( = ?auto_2179986 ?auto_2179991 ) ) ( not ( = ?auto_2179986 ?auto_2179992 ) ) ( not ( = ?auto_2179986 ?auto_2179997 ) ) ( not ( = ?auto_2179987 ?auto_2179988 ) ) ( not ( = ?auto_2179987 ?auto_2179989 ) ) ( not ( = ?auto_2179987 ?auto_2179990 ) ) ( not ( = ?auto_2179987 ?auto_2179991 ) ) ( not ( = ?auto_2179987 ?auto_2179992 ) ) ( not ( = ?auto_2179987 ?auto_2179997 ) ) ( not ( = ?auto_2179988 ?auto_2179989 ) ) ( not ( = ?auto_2179988 ?auto_2179990 ) ) ( not ( = ?auto_2179988 ?auto_2179991 ) ) ( not ( = ?auto_2179988 ?auto_2179992 ) ) ( not ( = ?auto_2179988 ?auto_2179997 ) ) ( not ( = ?auto_2179989 ?auto_2179990 ) ) ( not ( = ?auto_2179989 ?auto_2179991 ) ) ( not ( = ?auto_2179989 ?auto_2179992 ) ) ( not ( = ?auto_2179989 ?auto_2179997 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2179990 ?auto_2179991 ?auto_2179992 )
      ( MAKE-13CRATE-VERIFY ?auto_2179980 ?auto_2179981 ?auto_2179982 ?auto_2179979 ?auto_2179983 ?auto_2179985 ?auto_2179984 ?auto_2179986 ?auto_2179987 ?auto_2179988 ?auto_2179989 ?auto_2179990 ?auto_2179991 ?auto_2179992 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_2180163 - SURFACE
      ?auto_2180164 - SURFACE
      ?auto_2180165 - SURFACE
      ?auto_2180162 - SURFACE
      ?auto_2180166 - SURFACE
      ?auto_2180168 - SURFACE
      ?auto_2180167 - SURFACE
      ?auto_2180169 - SURFACE
      ?auto_2180170 - SURFACE
      ?auto_2180171 - SURFACE
      ?auto_2180172 - SURFACE
      ?auto_2180173 - SURFACE
      ?auto_2180174 - SURFACE
      ?auto_2180175 - SURFACE
    )
    :vars
    (
      ?auto_2180176 - HOIST
      ?auto_2180179 - PLACE
      ?auto_2180181 - PLACE
      ?auto_2180180 - HOIST
      ?auto_2180178 - SURFACE
      ?auto_2180177 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2180176 ?auto_2180179 ) ( IS-CRATE ?auto_2180175 ) ( not ( = ?auto_2180174 ?auto_2180175 ) ) ( not ( = ?auto_2180173 ?auto_2180174 ) ) ( not ( = ?auto_2180173 ?auto_2180175 ) ) ( not ( = ?auto_2180181 ?auto_2180179 ) ) ( HOIST-AT ?auto_2180180 ?auto_2180181 ) ( not ( = ?auto_2180176 ?auto_2180180 ) ) ( AVAILABLE ?auto_2180180 ) ( SURFACE-AT ?auto_2180175 ?auto_2180181 ) ( ON ?auto_2180175 ?auto_2180178 ) ( CLEAR ?auto_2180175 ) ( not ( = ?auto_2180174 ?auto_2180178 ) ) ( not ( = ?auto_2180175 ?auto_2180178 ) ) ( not ( = ?auto_2180173 ?auto_2180178 ) ) ( TRUCK-AT ?auto_2180177 ?auto_2180179 ) ( SURFACE-AT ?auto_2180173 ?auto_2180179 ) ( CLEAR ?auto_2180173 ) ( LIFTING ?auto_2180176 ?auto_2180174 ) ( IS-CRATE ?auto_2180174 ) ( ON ?auto_2180164 ?auto_2180163 ) ( ON ?auto_2180165 ?auto_2180164 ) ( ON ?auto_2180162 ?auto_2180165 ) ( ON ?auto_2180166 ?auto_2180162 ) ( ON ?auto_2180168 ?auto_2180166 ) ( ON ?auto_2180167 ?auto_2180168 ) ( ON ?auto_2180169 ?auto_2180167 ) ( ON ?auto_2180170 ?auto_2180169 ) ( ON ?auto_2180171 ?auto_2180170 ) ( ON ?auto_2180172 ?auto_2180171 ) ( ON ?auto_2180173 ?auto_2180172 ) ( not ( = ?auto_2180163 ?auto_2180164 ) ) ( not ( = ?auto_2180163 ?auto_2180165 ) ) ( not ( = ?auto_2180163 ?auto_2180162 ) ) ( not ( = ?auto_2180163 ?auto_2180166 ) ) ( not ( = ?auto_2180163 ?auto_2180168 ) ) ( not ( = ?auto_2180163 ?auto_2180167 ) ) ( not ( = ?auto_2180163 ?auto_2180169 ) ) ( not ( = ?auto_2180163 ?auto_2180170 ) ) ( not ( = ?auto_2180163 ?auto_2180171 ) ) ( not ( = ?auto_2180163 ?auto_2180172 ) ) ( not ( = ?auto_2180163 ?auto_2180173 ) ) ( not ( = ?auto_2180163 ?auto_2180174 ) ) ( not ( = ?auto_2180163 ?auto_2180175 ) ) ( not ( = ?auto_2180163 ?auto_2180178 ) ) ( not ( = ?auto_2180164 ?auto_2180165 ) ) ( not ( = ?auto_2180164 ?auto_2180162 ) ) ( not ( = ?auto_2180164 ?auto_2180166 ) ) ( not ( = ?auto_2180164 ?auto_2180168 ) ) ( not ( = ?auto_2180164 ?auto_2180167 ) ) ( not ( = ?auto_2180164 ?auto_2180169 ) ) ( not ( = ?auto_2180164 ?auto_2180170 ) ) ( not ( = ?auto_2180164 ?auto_2180171 ) ) ( not ( = ?auto_2180164 ?auto_2180172 ) ) ( not ( = ?auto_2180164 ?auto_2180173 ) ) ( not ( = ?auto_2180164 ?auto_2180174 ) ) ( not ( = ?auto_2180164 ?auto_2180175 ) ) ( not ( = ?auto_2180164 ?auto_2180178 ) ) ( not ( = ?auto_2180165 ?auto_2180162 ) ) ( not ( = ?auto_2180165 ?auto_2180166 ) ) ( not ( = ?auto_2180165 ?auto_2180168 ) ) ( not ( = ?auto_2180165 ?auto_2180167 ) ) ( not ( = ?auto_2180165 ?auto_2180169 ) ) ( not ( = ?auto_2180165 ?auto_2180170 ) ) ( not ( = ?auto_2180165 ?auto_2180171 ) ) ( not ( = ?auto_2180165 ?auto_2180172 ) ) ( not ( = ?auto_2180165 ?auto_2180173 ) ) ( not ( = ?auto_2180165 ?auto_2180174 ) ) ( not ( = ?auto_2180165 ?auto_2180175 ) ) ( not ( = ?auto_2180165 ?auto_2180178 ) ) ( not ( = ?auto_2180162 ?auto_2180166 ) ) ( not ( = ?auto_2180162 ?auto_2180168 ) ) ( not ( = ?auto_2180162 ?auto_2180167 ) ) ( not ( = ?auto_2180162 ?auto_2180169 ) ) ( not ( = ?auto_2180162 ?auto_2180170 ) ) ( not ( = ?auto_2180162 ?auto_2180171 ) ) ( not ( = ?auto_2180162 ?auto_2180172 ) ) ( not ( = ?auto_2180162 ?auto_2180173 ) ) ( not ( = ?auto_2180162 ?auto_2180174 ) ) ( not ( = ?auto_2180162 ?auto_2180175 ) ) ( not ( = ?auto_2180162 ?auto_2180178 ) ) ( not ( = ?auto_2180166 ?auto_2180168 ) ) ( not ( = ?auto_2180166 ?auto_2180167 ) ) ( not ( = ?auto_2180166 ?auto_2180169 ) ) ( not ( = ?auto_2180166 ?auto_2180170 ) ) ( not ( = ?auto_2180166 ?auto_2180171 ) ) ( not ( = ?auto_2180166 ?auto_2180172 ) ) ( not ( = ?auto_2180166 ?auto_2180173 ) ) ( not ( = ?auto_2180166 ?auto_2180174 ) ) ( not ( = ?auto_2180166 ?auto_2180175 ) ) ( not ( = ?auto_2180166 ?auto_2180178 ) ) ( not ( = ?auto_2180168 ?auto_2180167 ) ) ( not ( = ?auto_2180168 ?auto_2180169 ) ) ( not ( = ?auto_2180168 ?auto_2180170 ) ) ( not ( = ?auto_2180168 ?auto_2180171 ) ) ( not ( = ?auto_2180168 ?auto_2180172 ) ) ( not ( = ?auto_2180168 ?auto_2180173 ) ) ( not ( = ?auto_2180168 ?auto_2180174 ) ) ( not ( = ?auto_2180168 ?auto_2180175 ) ) ( not ( = ?auto_2180168 ?auto_2180178 ) ) ( not ( = ?auto_2180167 ?auto_2180169 ) ) ( not ( = ?auto_2180167 ?auto_2180170 ) ) ( not ( = ?auto_2180167 ?auto_2180171 ) ) ( not ( = ?auto_2180167 ?auto_2180172 ) ) ( not ( = ?auto_2180167 ?auto_2180173 ) ) ( not ( = ?auto_2180167 ?auto_2180174 ) ) ( not ( = ?auto_2180167 ?auto_2180175 ) ) ( not ( = ?auto_2180167 ?auto_2180178 ) ) ( not ( = ?auto_2180169 ?auto_2180170 ) ) ( not ( = ?auto_2180169 ?auto_2180171 ) ) ( not ( = ?auto_2180169 ?auto_2180172 ) ) ( not ( = ?auto_2180169 ?auto_2180173 ) ) ( not ( = ?auto_2180169 ?auto_2180174 ) ) ( not ( = ?auto_2180169 ?auto_2180175 ) ) ( not ( = ?auto_2180169 ?auto_2180178 ) ) ( not ( = ?auto_2180170 ?auto_2180171 ) ) ( not ( = ?auto_2180170 ?auto_2180172 ) ) ( not ( = ?auto_2180170 ?auto_2180173 ) ) ( not ( = ?auto_2180170 ?auto_2180174 ) ) ( not ( = ?auto_2180170 ?auto_2180175 ) ) ( not ( = ?auto_2180170 ?auto_2180178 ) ) ( not ( = ?auto_2180171 ?auto_2180172 ) ) ( not ( = ?auto_2180171 ?auto_2180173 ) ) ( not ( = ?auto_2180171 ?auto_2180174 ) ) ( not ( = ?auto_2180171 ?auto_2180175 ) ) ( not ( = ?auto_2180171 ?auto_2180178 ) ) ( not ( = ?auto_2180172 ?auto_2180173 ) ) ( not ( = ?auto_2180172 ?auto_2180174 ) ) ( not ( = ?auto_2180172 ?auto_2180175 ) ) ( not ( = ?auto_2180172 ?auto_2180178 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2180173 ?auto_2180174 ?auto_2180175 )
      ( MAKE-13CRATE-VERIFY ?auto_2180163 ?auto_2180164 ?auto_2180165 ?auto_2180162 ?auto_2180166 ?auto_2180168 ?auto_2180167 ?auto_2180169 ?auto_2180170 ?auto_2180171 ?auto_2180172 ?auto_2180173 ?auto_2180174 ?auto_2180175 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_2180346 - SURFACE
      ?auto_2180347 - SURFACE
      ?auto_2180348 - SURFACE
      ?auto_2180345 - SURFACE
      ?auto_2180349 - SURFACE
      ?auto_2180351 - SURFACE
      ?auto_2180350 - SURFACE
      ?auto_2180352 - SURFACE
      ?auto_2180353 - SURFACE
      ?auto_2180354 - SURFACE
      ?auto_2180355 - SURFACE
      ?auto_2180356 - SURFACE
      ?auto_2180357 - SURFACE
      ?auto_2180358 - SURFACE
    )
    :vars
    (
      ?auto_2180364 - HOIST
      ?auto_2180361 - PLACE
      ?auto_2180359 - PLACE
      ?auto_2180360 - HOIST
      ?auto_2180362 - SURFACE
      ?auto_2180363 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2180364 ?auto_2180361 ) ( IS-CRATE ?auto_2180358 ) ( not ( = ?auto_2180357 ?auto_2180358 ) ) ( not ( = ?auto_2180356 ?auto_2180357 ) ) ( not ( = ?auto_2180356 ?auto_2180358 ) ) ( not ( = ?auto_2180359 ?auto_2180361 ) ) ( HOIST-AT ?auto_2180360 ?auto_2180359 ) ( not ( = ?auto_2180364 ?auto_2180360 ) ) ( AVAILABLE ?auto_2180360 ) ( SURFACE-AT ?auto_2180358 ?auto_2180359 ) ( ON ?auto_2180358 ?auto_2180362 ) ( CLEAR ?auto_2180358 ) ( not ( = ?auto_2180357 ?auto_2180362 ) ) ( not ( = ?auto_2180358 ?auto_2180362 ) ) ( not ( = ?auto_2180356 ?auto_2180362 ) ) ( TRUCK-AT ?auto_2180363 ?auto_2180361 ) ( SURFACE-AT ?auto_2180356 ?auto_2180361 ) ( CLEAR ?auto_2180356 ) ( IS-CRATE ?auto_2180357 ) ( AVAILABLE ?auto_2180364 ) ( IN ?auto_2180357 ?auto_2180363 ) ( ON ?auto_2180347 ?auto_2180346 ) ( ON ?auto_2180348 ?auto_2180347 ) ( ON ?auto_2180345 ?auto_2180348 ) ( ON ?auto_2180349 ?auto_2180345 ) ( ON ?auto_2180351 ?auto_2180349 ) ( ON ?auto_2180350 ?auto_2180351 ) ( ON ?auto_2180352 ?auto_2180350 ) ( ON ?auto_2180353 ?auto_2180352 ) ( ON ?auto_2180354 ?auto_2180353 ) ( ON ?auto_2180355 ?auto_2180354 ) ( ON ?auto_2180356 ?auto_2180355 ) ( not ( = ?auto_2180346 ?auto_2180347 ) ) ( not ( = ?auto_2180346 ?auto_2180348 ) ) ( not ( = ?auto_2180346 ?auto_2180345 ) ) ( not ( = ?auto_2180346 ?auto_2180349 ) ) ( not ( = ?auto_2180346 ?auto_2180351 ) ) ( not ( = ?auto_2180346 ?auto_2180350 ) ) ( not ( = ?auto_2180346 ?auto_2180352 ) ) ( not ( = ?auto_2180346 ?auto_2180353 ) ) ( not ( = ?auto_2180346 ?auto_2180354 ) ) ( not ( = ?auto_2180346 ?auto_2180355 ) ) ( not ( = ?auto_2180346 ?auto_2180356 ) ) ( not ( = ?auto_2180346 ?auto_2180357 ) ) ( not ( = ?auto_2180346 ?auto_2180358 ) ) ( not ( = ?auto_2180346 ?auto_2180362 ) ) ( not ( = ?auto_2180347 ?auto_2180348 ) ) ( not ( = ?auto_2180347 ?auto_2180345 ) ) ( not ( = ?auto_2180347 ?auto_2180349 ) ) ( not ( = ?auto_2180347 ?auto_2180351 ) ) ( not ( = ?auto_2180347 ?auto_2180350 ) ) ( not ( = ?auto_2180347 ?auto_2180352 ) ) ( not ( = ?auto_2180347 ?auto_2180353 ) ) ( not ( = ?auto_2180347 ?auto_2180354 ) ) ( not ( = ?auto_2180347 ?auto_2180355 ) ) ( not ( = ?auto_2180347 ?auto_2180356 ) ) ( not ( = ?auto_2180347 ?auto_2180357 ) ) ( not ( = ?auto_2180347 ?auto_2180358 ) ) ( not ( = ?auto_2180347 ?auto_2180362 ) ) ( not ( = ?auto_2180348 ?auto_2180345 ) ) ( not ( = ?auto_2180348 ?auto_2180349 ) ) ( not ( = ?auto_2180348 ?auto_2180351 ) ) ( not ( = ?auto_2180348 ?auto_2180350 ) ) ( not ( = ?auto_2180348 ?auto_2180352 ) ) ( not ( = ?auto_2180348 ?auto_2180353 ) ) ( not ( = ?auto_2180348 ?auto_2180354 ) ) ( not ( = ?auto_2180348 ?auto_2180355 ) ) ( not ( = ?auto_2180348 ?auto_2180356 ) ) ( not ( = ?auto_2180348 ?auto_2180357 ) ) ( not ( = ?auto_2180348 ?auto_2180358 ) ) ( not ( = ?auto_2180348 ?auto_2180362 ) ) ( not ( = ?auto_2180345 ?auto_2180349 ) ) ( not ( = ?auto_2180345 ?auto_2180351 ) ) ( not ( = ?auto_2180345 ?auto_2180350 ) ) ( not ( = ?auto_2180345 ?auto_2180352 ) ) ( not ( = ?auto_2180345 ?auto_2180353 ) ) ( not ( = ?auto_2180345 ?auto_2180354 ) ) ( not ( = ?auto_2180345 ?auto_2180355 ) ) ( not ( = ?auto_2180345 ?auto_2180356 ) ) ( not ( = ?auto_2180345 ?auto_2180357 ) ) ( not ( = ?auto_2180345 ?auto_2180358 ) ) ( not ( = ?auto_2180345 ?auto_2180362 ) ) ( not ( = ?auto_2180349 ?auto_2180351 ) ) ( not ( = ?auto_2180349 ?auto_2180350 ) ) ( not ( = ?auto_2180349 ?auto_2180352 ) ) ( not ( = ?auto_2180349 ?auto_2180353 ) ) ( not ( = ?auto_2180349 ?auto_2180354 ) ) ( not ( = ?auto_2180349 ?auto_2180355 ) ) ( not ( = ?auto_2180349 ?auto_2180356 ) ) ( not ( = ?auto_2180349 ?auto_2180357 ) ) ( not ( = ?auto_2180349 ?auto_2180358 ) ) ( not ( = ?auto_2180349 ?auto_2180362 ) ) ( not ( = ?auto_2180351 ?auto_2180350 ) ) ( not ( = ?auto_2180351 ?auto_2180352 ) ) ( not ( = ?auto_2180351 ?auto_2180353 ) ) ( not ( = ?auto_2180351 ?auto_2180354 ) ) ( not ( = ?auto_2180351 ?auto_2180355 ) ) ( not ( = ?auto_2180351 ?auto_2180356 ) ) ( not ( = ?auto_2180351 ?auto_2180357 ) ) ( not ( = ?auto_2180351 ?auto_2180358 ) ) ( not ( = ?auto_2180351 ?auto_2180362 ) ) ( not ( = ?auto_2180350 ?auto_2180352 ) ) ( not ( = ?auto_2180350 ?auto_2180353 ) ) ( not ( = ?auto_2180350 ?auto_2180354 ) ) ( not ( = ?auto_2180350 ?auto_2180355 ) ) ( not ( = ?auto_2180350 ?auto_2180356 ) ) ( not ( = ?auto_2180350 ?auto_2180357 ) ) ( not ( = ?auto_2180350 ?auto_2180358 ) ) ( not ( = ?auto_2180350 ?auto_2180362 ) ) ( not ( = ?auto_2180352 ?auto_2180353 ) ) ( not ( = ?auto_2180352 ?auto_2180354 ) ) ( not ( = ?auto_2180352 ?auto_2180355 ) ) ( not ( = ?auto_2180352 ?auto_2180356 ) ) ( not ( = ?auto_2180352 ?auto_2180357 ) ) ( not ( = ?auto_2180352 ?auto_2180358 ) ) ( not ( = ?auto_2180352 ?auto_2180362 ) ) ( not ( = ?auto_2180353 ?auto_2180354 ) ) ( not ( = ?auto_2180353 ?auto_2180355 ) ) ( not ( = ?auto_2180353 ?auto_2180356 ) ) ( not ( = ?auto_2180353 ?auto_2180357 ) ) ( not ( = ?auto_2180353 ?auto_2180358 ) ) ( not ( = ?auto_2180353 ?auto_2180362 ) ) ( not ( = ?auto_2180354 ?auto_2180355 ) ) ( not ( = ?auto_2180354 ?auto_2180356 ) ) ( not ( = ?auto_2180354 ?auto_2180357 ) ) ( not ( = ?auto_2180354 ?auto_2180358 ) ) ( not ( = ?auto_2180354 ?auto_2180362 ) ) ( not ( = ?auto_2180355 ?auto_2180356 ) ) ( not ( = ?auto_2180355 ?auto_2180357 ) ) ( not ( = ?auto_2180355 ?auto_2180358 ) ) ( not ( = ?auto_2180355 ?auto_2180362 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2180356 ?auto_2180357 ?auto_2180358 )
      ( MAKE-13CRATE-VERIFY ?auto_2180346 ?auto_2180347 ?auto_2180348 ?auto_2180345 ?auto_2180349 ?auto_2180351 ?auto_2180350 ?auto_2180352 ?auto_2180353 ?auto_2180354 ?auto_2180355 ?auto_2180356 ?auto_2180357 ?auto_2180358 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_2194587 - SURFACE
      ?auto_2194588 - SURFACE
      ?auto_2194589 - SURFACE
      ?auto_2194586 - SURFACE
      ?auto_2194590 - SURFACE
      ?auto_2194592 - SURFACE
      ?auto_2194591 - SURFACE
      ?auto_2194593 - SURFACE
      ?auto_2194594 - SURFACE
      ?auto_2194595 - SURFACE
      ?auto_2194596 - SURFACE
      ?auto_2194597 - SURFACE
      ?auto_2194598 - SURFACE
      ?auto_2194599 - SURFACE
      ?auto_2194600 - SURFACE
    )
    :vars
    (
      ?auto_2194602 - HOIST
      ?auto_2194601 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2194602 ?auto_2194601 ) ( SURFACE-AT ?auto_2194599 ?auto_2194601 ) ( CLEAR ?auto_2194599 ) ( LIFTING ?auto_2194602 ?auto_2194600 ) ( IS-CRATE ?auto_2194600 ) ( not ( = ?auto_2194599 ?auto_2194600 ) ) ( ON ?auto_2194588 ?auto_2194587 ) ( ON ?auto_2194589 ?auto_2194588 ) ( ON ?auto_2194586 ?auto_2194589 ) ( ON ?auto_2194590 ?auto_2194586 ) ( ON ?auto_2194592 ?auto_2194590 ) ( ON ?auto_2194591 ?auto_2194592 ) ( ON ?auto_2194593 ?auto_2194591 ) ( ON ?auto_2194594 ?auto_2194593 ) ( ON ?auto_2194595 ?auto_2194594 ) ( ON ?auto_2194596 ?auto_2194595 ) ( ON ?auto_2194597 ?auto_2194596 ) ( ON ?auto_2194598 ?auto_2194597 ) ( ON ?auto_2194599 ?auto_2194598 ) ( not ( = ?auto_2194587 ?auto_2194588 ) ) ( not ( = ?auto_2194587 ?auto_2194589 ) ) ( not ( = ?auto_2194587 ?auto_2194586 ) ) ( not ( = ?auto_2194587 ?auto_2194590 ) ) ( not ( = ?auto_2194587 ?auto_2194592 ) ) ( not ( = ?auto_2194587 ?auto_2194591 ) ) ( not ( = ?auto_2194587 ?auto_2194593 ) ) ( not ( = ?auto_2194587 ?auto_2194594 ) ) ( not ( = ?auto_2194587 ?auto_2194595 ) ) ( not ( = ?auto_2194587 ?auto_2194596 ) ) ( not ( = ?auto_2194587 ?auto_2194597 ) ) ( not ( = ?auto_2194587 ?auto_2194598 ) ) ( not ( = ?auto_2194587 ?auto_2194599 ) ) ( not ( = ?auto_2194587 ?auto_2194600 ) ) ( not ( = ?auto_2194588 ?auto_2194589 ) ) ( not ( = ?auto_2194588 ?auto_2194586 ) ) ( not ( = ?auto_2194588 ?auto_2194590 ) ) ( not ( = ?auto_2194588 ?auto_2194592 ) ) ( not ( = ?auto_2194588 ?auto_2194591 ) ) ( not ( = ?auto_2194588 ?auto_2194593 ) ) ( not ( = ?auto_2194588 ?auto_2194594 ) ) ( not ( = ?auto_2194588 ?auto_2194595 ) ) ( not ( = ?auto_2194588 ?auto_2194596 ) ) ( not ( = ?auto_2194588 ?auto_2194597 ) ) ( not ( = ?auto_2194588 ?auto_2194598 ) ) ( not ( = ?auto_2194588 ?auto_2194599 ) ) ( not ( = ?auto_2194588 ?auto_2194600 ) ) ( not ( = ?auto_2194589 ?auto_2194586 ) ) ( not ( = ?auto_2194589 ?auto_2194590 ) ) ( not ( = ?auto_2194589 ?auto_2194592 ) ) ( not ( = ?auto_2194589 ?auto_2194591 ) ) ( not ( = ?auto_2194589 ?auto_2194593 ) ) ( not ( = ?auto_2194589 ?auto_2194594 ) ) ( not ( = ?auto_2194589 ?auto_2194595 ) ) ( not ( = ?auto_2194589 ?auto_2194596 ) ) ( not ( = ?auto_2194589 ?auto_2194597 ) ) ( not ( = ?auto_2194589 ?auto_2194598 ) ) ( not ( = ?auto_2194589 ?auto_2194599 ) ) ( not ( = ?auto_2194589 ?auto_2194600 ) ) ( not ( = ?auto_2194586 ?auto_2194590 ) ) ( not ( = ?auto_2194586 ?auto_2194592 ) ) ( not ( = ?auto_2194586 ?auto_2194591 ) ) ( not ( = ?auto_2194586 ?auto_2194593 ) ) ( not ( = ?auto_2194586 ?auto_2194594 ) ) ( not ( = ?auto_2194586 ?auto_2194595 ) ) ( not ( = ?auto_2194586 ?auto_2194596 ) ) ( not ( = ?auto_2194586 ?auto_2194597 ) ) ( not ( = ?auto_2194586 ?auto_2194598 ) ) ( not ( = ?auto_2194586 ?auto_2194599 ) ) ( not ( = ?auto_2194586 ?auto_2194600 ) ) ( not ( = ?auto_2194590 ?auto_2194592 ) ) ( not ( = ?auto_2194590 ?auto_2194591 ) ) ( not ( = ?auto_2194590 ?auto_2194593 ) ) ( not ( = ?auto_2194590 ?auto_2194594 ) ) ( not ( = ?auto_2194590 ?auto_2194595 ) ) ( not ( = ?auto_2194590 ?auto_2194596 ) ) ( not ( = ?auto_2194590 ?auto_2194597 ) ) ( not ( = ?auto_2194590 ?auto_2194598 ) ) ( not ( = ?auto_2194590 ?auto_2194599 ) ) ( not ( = ?auto_2194590 ?auto_2194600 ) ) ( not ( = ?auto_2194592 ?auto_2194591 ) ) ( not ( = ?auto_2194592 ?auto_2194593 ) ) ( not ( = ?auto_2194592 ?auto_2194594 ) ) ( not ( = ?auto_2194592 ?auto_2194595 ) ) ( not ( = ?auto_2194592 ?auto_2194596 ) ) ( not ( = ?auto_2194592 ?auto_2194597 ) ) ( not ( = ?auto_2194592 ?auto_2194598 ) ) ( not ( = ?auto_2194592 ?auto_2194599 ) ) ( not ( = ?auto_2194592 ?auto_2194600 ) ) ( not ( = ?auto_2194591 ?auto_2194593 ) ) ( not ( = ?auto_2194591 ?auto_2194594 ) ) ( not ( = ?auto_2194591 ?auto_2194595 ) ) ( not ( = ?auto_2194591 ?auto_2194596 ) ) ( not ( = ?auto_2194591 ?auto_2194597 ) ) ( not ( = ?auto_2194591 ?auto_2194598 ) ) ( not ( = ?auto_2194591 ?auto_2194599 ) ) ( not ( = ?auto_2194591 ?auto_2194600 ) ) ( not ( = ?auto_2194593 ?auto_2194594 ) ) ( not ( = ?auto_2194593 ?auto_2194595 ) ) ( not ( = ?auto_2194593 ?auto_2194596 ) ) ( not ( = ?auto_2194593 ?auto_2194597 ) ) ( not ( = ?auto_2194593 ?auto_2194598 ) ) ( not ( = ?auto_2194593 ?auto_2194599 ) ) ( not ( = ?auto_2194593 ?auto_2194600 ) ) ( not ( = ?auto_2194594 ?auto_2194595 ) ) ( not ( = ?auto_2194594 ?auto_2194596 ) ) ( not ( = ?auto_2194594 ?auto_2194597 ) ) ( not ( = ?auto_2194594 ?auto_2194598 ) ) ( not ( = ?auto_2194594 ?auto_2194599 ) ) ( not ( = ?auto_2194594 ?auto_2194600 ) ) ( not ( = ?auto_2194595 ?auto_2194596 ) ) ( not ( = ?auto_2194595 ?auto_2194597 ) ) ( not ( = ?auto_2194595 ?auto_2194598 ) ) ( not ( = ?auto_2194595 ?auto_2194599 ) ) ( not ( = ?auto_2194595 ?auto_2194600 ) ) ( not ( = ?auto_2194596 ?auto_2194597 ) ) ( not ( = ?auto_2194596 ?auto_2194598 ) ) ( not ( = ?auto_2194596 ?auto_2194599 ) ) ( not ( = ?auto_2194596 ?auto_2194600 ) ) ( not ( = ?auto_2194597 ?auto_2194598 ) ) ( not ( = ?auto_2194597 ?auto_2194599 ) ) ( not ( = ?auto_2194597 ?auto_2194600 ) ) ( not ( = ?auto_2194598 ?auto_2194599 ) ) ( not ( = ?auto_2194598 ?auto_2194600 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2194599 ?auto_2194600 )
      ( MAKE-14CRATE-VERIFY ?auto_2194587 ?auto_2194588 ?auto_2194589 ?auto_2194586 ?auto_2194590 ?auto_2194592 ?auto_2194591 ?auto_2194593 ?auto_2194594 ?auto_2194595 ?auto_2194596 ?auto_2194597 ?auto_2194598 ?auto_2194599 ?auto_2194600 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_2194747 - SURFACE
      ?auto_2194748 - SURFACE
      ?auto_2194749 - SURFACE
      ?auto_2194746 - SURFACE
      ?auto_2194750 - SURFACE
      ?auto_2194752 - SURFACE
      ?auto_2194751 - SURFACE
      ?auto_2194753 - SURFACE
      ?auto_2194754 - SURFACE
      ?auto_2194755 - SURFACE
      ?auto_2194756 - SURFACE
      ?auto_2194757 - SURFACE
      ?auto_2194758 - SURFACE
      ?auto_2194759 - SURFACE
      ?auto_2194760 - SURFACE
    )
    :vars
    (
      ?auto_2194761 - HOIST
      ?auto_2194763 - PLACE
      ?auto_2194762 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2194761 ?auto_2194763 ) ( SURFACE-AT ?auto_2194759 ?auto_2194763 ) ( CLEAR ?auto_2194759 ) ( IS-CRATE ?auto_2194760 ) ( not ( = ?auto_2194759 ?auto_2194760 ) ) ( TRUCK-AT ?auto_2194762 ?auto_2194763 ) ( AVAILABLE ?auto_2194761 ) ( IN ?auto_2194760 ?auto_2194762 ) ( ON ?auto_2194759 ?auto_2194758 ) ( not ( = ?auto_2194758 ?auto_2194759 ) ) ( not ( = ?auto_2194758 ?auto_2194760 ) ) ( ON ?auto_2194748 ?auto_2194747 ) ( ON ?auto_2194749 ?auto_2194748 ) ( ON ?auto_2194746 ?auto_2194749 ) ( ON ?auto_2194750 ?auto_2194746 ) ( ON ?auto_2194752 ?auto_2194750 ) ( ON ?auto_2194751 ?auto_2194752 ) ( ON ?auto_2194753 ?auto_2194751 ) ( ON ?auto_2194754 ?auto_2194753 ) ( ON ?auto_2194755 ?auto_2194754 ) ( ON ?auto_2194756 ?auto_2194755 ) ( ON ?auto_2194757 ?auto_2194756 ) ( ON ?auto_2194758 ?auto_2194757 ) ( not ( = ?auto_2194747 ?auto_2194748 ) ) ( not ( = ?auto_2194747 ?auto_2194749 ) ) ( not ( = ?auto_2194747 ?auto_2194746 ) ) ( not ( = ?auto_2194747 ?auto_2194750 ) ) ( not ( = ?auto_2194747 ?auto_2194752 ) ) ( not ( = ?auto_2194747 ?auto_2194751 ) ) ( not ( = ?auto_2194747 ?auto_2194753 ) ) ( not ( = ?auto_2194747 ?auto_2194754 ) ) ( not ( = ?auto_2194747 ?auto_2194755 ) ) ( not ( = ?auto_2194747 ?auto_2194756 ) ) ( not ( = ?auto_2194747 ?auto_2194757 ) ) ( not ( = ?auto_2194747 ?auto_2194758 ) ) ( not ( = ?auto_2194747 ?auto_2194759 ) ) ( not ( = ?auto_2194747 ?auto_2194760 ) ) ( not ( = ?auto_2194748 ?auto_2194749 ) ) ( not ( = ?auto_2194748 ?auto_2194746 ) ) ( not ( = ?auto_2194748 ?auto_2194750 ) ) ( not ( = ?auto_2194748 ?auto_2194752 ) ) ( not ( = ?auto_2194748 ?auto_2194751 ) ) ( not ( = ?auto_2194748 ?auto_2194753 ) ) ( not ( = ?auto_2194748 ?auto_2194754 ) ) ( not ( = ?auto_2194748 ?auto_2194755 ) ) ( not ( = ?auto_2194748 ?auto_2194756 ) ) ( not ( = ?auto_2194748 ?auto_2194757 ) ) ( not ( = ?auto_2194748 ?auto_2194758 ) ) ( not ( = ?auto_2194748 ?auto_2194759 ) ) ( not ( = ?auto_2194748 ?auto_2194760 ) ) ( not ( = ?auto_2194749 ?auto_2194746 ) ) ( not ( = ?auto_2194749 ?auto_2194750 ) ) ( not ( = ?auto_2194749 ?auto_2194752 ) ) ( not ( = ?auto_2194749 ?auto_2194751 ) ) ( not ( = ?auto_2194749 ?auto_2194753 ) ) ( not ( = ?auto_2194749 ?auto_2194754 ) ) ( not ( = ?auto_2194749 ?auto_2194755 ) ) ( not ( = ?auto_2194749 ?auto_2194756 ) ) ( not ( = ?auto_2194749 ?auto_2194757 ) ) ( not ( = ?auto_2194749 ?auto_2194758 ) ) ( not ( = ?auto_2194749 ?auto_2194759 ) ) ( not ( = ?auto_2194749 ?auto_2194760 ) ) ( not ( = ?auto_2194746 ?auto_2194750 ) ) ( not ( = ?auto_2194746 ?auto_2194752 ) ) ( not ( = ?auto_2194746 ?auto_2194751 ) ) ( not ( = ?auto_2194746 ?auto_2194753 ) ) ( not ( = ?auto_2194746 ?auto_2194754 ) ) ( not ( = ?auto_2194746 ?auto_2194755 ) ) ( not ( = ?auto_2194746 ?auto_2194756 ) ) ( not ( = ?auto_2194746 ?auto_2194757 ) ) ( not ( = ?auto_2194746 ?auto_2194758 ) ) ( not ( = ?auto_2194746 ?auto_2194759 ) ) ( not ( = ?auto_2194746 ?auto_2194760 ) ) ( not ( = ?auto_2194750 ?auto_2194752 ) ) ( not ( = ?auto_2194750 ?auto_2194751 ) ) ( not ( = ?auto_2194750 ?auto_2194753 ) ) ( not ( = ?auto_2194750 ?auto_2194754 ) ) ( not ( = ?auto_2194750 ?auto_2194755 ) ) ( not ( = ?auto_2194750 ?auto_2194756 ) ) ( not ( = ?auto_2194750 ?auto_2194757 ) ) ( not ( = ?auto_2194750 ?auto_2194758 ) ) ( not ( = ?auto_2194750 ?auto_2194759 ) ) ( not ( = ?auto_2194750 ?auto_2194760 ) ) ( not ( = ?auto_2194752 ?auto_2194751 ) ) ( not ( = ?auto_2194752 ?auto_2194753 ) ) ( not ( = ?auto_2194752 ?auto_2194754 ) ) ( not ( = ?auto_2194752 ?auto_2194755 ) ) ( not ( = ?auto_2194752 ?auto_2194756 ) ) ( not ( = ?auto_2194752 ?auto_2194757 ) ) ( not ( = ?auto_2194752 ?auto_2194758 ) ) ( not ( = ?auto_2194752 ?auto_2194759 ) ) ( not ( = ?auto_2194752 ?auto_2194760 ) ) ( not ( = ?auto_2194751 ?auto_2194753 ) ) ( not ( = ?auto_2194751 ?auto_2194754 ) ) ( not ( = ?auto_2194751 ?auto_2194755 ) ) ( not ( = ?auto_2194751 ?auto_2194756 ) ) ( not ( = ?auto_2194751 ?auto_2194757 ) ) ( not ( = ?auto_2194751 ?auto_2194758 ) ) ( not ( = ?auto_2194751 ?auto_2194759 ) ) ( not ( = ?auto_2194751 ?auto_2194760 ) ) ( not ( = ?auto_2194753 ?auto_2194754 ) ) ( not ( = ?auto_2194753 ?auto_2194755 ) ) ( not ( = ?auto_2194753 ?auto_2194756 ) ) ( not ( = ?auto_2194753 ?auto_2194757 ) ) ( not ( = ?auto_2194753 ?auto_2194758 ) ) ( not ( = ?auto_2194753 ?auto_2194759 ) ) ( not ( = ?auto_2194753 ?auto_2194760 ) ) ( not ( = ?auto_2194754 ?auto_2194755 ) ) ( not ( = ?auto_2194754 ?auto_2194756 ) ) ( not ( = ?auto_2194754 ?auto_2194757 ) ) ( not ( = ?auto_2194754 ?auto_2194758 ) ) ( not ( = ?auto_2194754 ?auto_2194759 ) ) ( not ( = ?auto_2194754 ?auto_2194760 ) ) ( not ( = ?auto_2194755 ?auto_2194756 ) ) ( not ( = ?auto_2194755 ?auto_2194757 ) ) ( not ( = ?auto_2194755 ?auto_2194758 ) ) ( not ( = ?auto_2194755 ?auto_2194759 ) ) ( not ( = ?auto_2194755 ?auto_2194760 ) ) ( not ( = ?auto_2194756 ?auto_2194757 ) ) ( not ( = ?auto_2194756 ?auto_2194758 ) ) ( not ( = ?auto_2194756 ?auto_2194759 ) ) ( not ( = ?auto_2194756 ?auto_2194760 ) ) ( not ( = ?auto_2194757 ?auto_2194758 ) ) ( not ( = ?auto_2194757 ?auto_2194759 ) ) ( not ( = ?auto_2194757 ?auto_2194760 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2194758 ?auto_2194759 ?auto_2194760 )
      ( MAKE-14CRATE-VERIFY ?auto_2194747 ?auto_2194748 ?auto_2194749 ?auto_2194746 ?auto_2194750 ?auto_2194752 ?auto_2194751 ?auto_2194753 ?auto_2194754 ?auto_2194755 ?auto_2194756 ?auto_2194757 ?auto_2194758 ?auto_2194759 ?auto_2194760 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_2194922 - SURFACE
      ?auto_2194923 - SURFACE
      ?auto_2194924 - SURFACE
      ?auto_2194921 - SURFACE
      ?auto_2194925 - SURFACE
      ?auto_2194927 - SURFACE
      ?auto_2194926 - SURFACE
      ?auto_2194928 - SURFACE
      ?auto_2194929 - SURFACE
      ?auto_2194930 - SURFACE
      ?auto_2194931 - SURFACE
      ?auto_2194932 - SURFACE
      ?auto_2194933 - SURFACE
      ?auto_2194934 - SURFACE
      ?auto_2194935 - SURFACE
    )
    :vars
    (
      ?auto_2194938 - HOIST
      ?auto_2194937 - PLACE
      ?auto_2194936 - TRUCK
      ?auto_2194939 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2194938 ?auto_2194937 ) ( SURFACE-AT ?auto_2194934 ?auto_2194937 ) ( CLEAR ?auto_2194934 ) ( IS-CRATE ?auto_2194935 ) ( not ( = ?auto_2194934 ?auto_2194935 ) ) ( AVAILABLE ?auto_2194938 ) ( IN ?auto_2194935 ?auto_2194936 ) ( ON ?auto_2194934 ?auto_2194933 ) ( not ( = ?auto_2194933 ?auto_2194934 ) ) ( not ( = ?auto_2194933 ?auto_2194935 ) ) ( TRUCK-AT ?auto_2194936 ?auto_2194939 ) ( not ( = ?auto_2194939 ?auto_2194937 ) ) ( ON ?auto_2194923 ?auto_2194922 ) ( ON ?auto_2194924 ?auto_2194923 ) ( ON ?auto_2194921 ?auto_2194924 ) ( ON ?auto_2194925 ?auto_2194921 ) ( ON ?auto_2194927 ?auto_2194925 ) ( ON ?auto_2194926 ?auto_2194927 ) ( ON ?auto_2194928 ?auto_2194926 ) ( ON ?auto_2194929 ?auto_2194928 ) ( ON ?auto_2194930 ?auto_2194929 ) ( ON ?auto_2194931 ?auto_2194930 ) ( ON ?auto_2194932 ?auto_2194931 ) ( ON ?auto_2194933 ?auto_2194932 ) ( not ( = ?auto_2194922 ?auto_2194923 ) ) ( not ( = ?auto_2194922 ?auto_2194924 ) ) ( not ( = ?auto_2194922 ?auto_2194921 ) ) ( not ( = ?auto_2194922 ?auto_2194925 ) ) ( not ( = ?auto_2194922 ?auto_2194927 ) ) ( not ( = ?auto_2194922 ?auto_2194926 ) ) ( not ( = ?auto_2194922 ?auto_2194928 ) ) ( not ( = ?auto_2194922 ?auto_2194929 ) ) ( not ( = ?auto_2194922 ?auto_2194930 ) ) ( not ( = ?auto_2194922 ?auto_2194931 ) ) ( not ( = ?auto_2194922 ?auto_2194932 ) ) ( not ( = ?auto_2194922 ?auto_2194933 ) ) ( not ( = ?auto_2194922 ?auto_2194934 ) ) ( not ( = ?auto_2194922 ?auto_2194935 ) ) ( not ( = ?auto_2194923 ?auto_2194924 ) ) ( not ( = ?auto_2194923 ?auto_2194921 ) ) ( not ( = ?auto_2194923 ?auto_2194925 ) ) ( not ( = ?auto_2194923 ?auto_2194927 ) ) ( not ( = ?auto_2194923 ?auto_2194926 ) ) ( not ( = ?auto_2194923 ?auto_2194928 ) ) ( not ( = ?auto_2194923 ?auto_2194929 ) ) ( not ( = ?auto_2194923 ?auto_2194930 ) ) ( not ( = ?auto_2194923 ?auto_2194931 ) ) ( not ( = ?auto_2194923 ?auto_2194932 ) ) ( not ( = ?auto_2194923 ?auto_2194933 ) ) ( not ( = ?auto_2194923 ?auto_2194934 ) ) ( not ( = ?auto_2194923 ?auto_2194935 ) ) ( not ( = ?auto_2194924 ?auto_2194921 ) ) ( not ( = ?auto_2194924 ?auto_2194925 ) ) ( not ( = ?auto_2194924 ?auto_2194927 ) ) ( not ( = ?auto_2194924 ?auto_2194926 ) ) ( not ( = ?auto_2194924 ?auto_2194928 ) ) ( not ( = ?auto_2194924 ?auto_2194929 ) ) ( not ( = ?auto_2194924 ?auto_2194930 ) ) ( not ( = ?auto_2194924 ?auto_2194931 ) ) ( not ( = ?auto_2194924 ?auto_2194932 ) ) ( not ( = ?auto_2194924 ?auto_2194933 ) ) ( not ( = ?auto_2194924 ?auto_2194934 ) ) ( not ( = ?auto_2194924 ?auto_2194935 ) ) ( not ( = ?auto_2194921 ?auto_2194925 ) ) ( not ( = ?auto_2194921 ?auto_2194927 ) ) ( not ( = ?auto_2194921 ?auto_2194926 ) ) ( not ( = ?auto_2194921 ?auto_2194928 ) ) ( not ( = ?auto_2194921 ?auto_2194929 ) ) ( not ( = ?auto_2194921 ?auto_2194930 ) ) ( not ( = ?auto_2194921 ?auto_2194931 ) ) ( not ( = ?auto_2194921 ?auto_2194932 ) ) ( not ( = ?auto_2194921 ?auto_2194933 ) ) ( not ( = ?auto_2194921 ?auto_2194934 ) ) ( not ( = ?auto_2194921 ?auto_2194935 ) ) ( not ( = ?auto_2194925 ?auto_2194927 ) ) ( not ( = ?auto_2194925 ?auto_2194926 ) ) ( not ( = ?auto_2194925 ?auto_2194928 ) ) ( not ( = ?auto_2194925 ?auto_2194929 ) ) ( not ( = ?auto_2194925 ?auto_2194930 ) ) ( not ( = ?auto_2194925 ?auto_2194931 ) ) ( not ( = ?auto_2194925 ?auto_2194932 ) ) ( not ( = ?auto_2194925 ?auto_2194933 ) ) ( not ( = ?auto_2194925 ?auto_2194934 ) ) ( not ( = ?auto_2194925 ?auto_2194935 ) ) ( not ( = ?auto_2194927 ?auto_2194926 ) ) ( not ( = ?auto_2194927 ?auto_2194928 ) ) ( not ( = ?auto_2194927 ?auto_2194929 ) ) ( not ( = ?auto_2194927 ?auto_2194930 ) ) ( not ( = ?auto_2194927 ?auto_2194931 ) ) ( not ( = ?auto_2194927 ?auto_2194932 ) ) ( not ( = ?auto_2194927 ?auto_2194933 ) ) ( not ( = ?auto_2194927 ?auto_2194934 ) ) ( not ( = ?auto_2194927 ?auto_2194935 ) ) ( not ( = ?auto_2194926 ?auto_2194928 ) ) ( not ( = ?auto_2194926 ?auto_2194929 ) ) ( not ( = ?auto_2194926 ?auto_2194930 ) ) ( not ( = ?auto_2194926 ?auto_2194931 ) ) ( not ( = ?auto_2194926 ?auto_2194932 ) ) ( not ( = ?auto_2194926 ?auto_2194933 ) ) ( not ( = ?auto_2194926 ?auto_2194934 ) ) ( not ( = ?auto_2194926 ?auto_2194935 ) ) ( not ( = ?auto_2194928 ?auto_2194929 ) ) ( not ( = ?auto_2194928 ?auto_2194930 ) ) ( not ( = ?auto_2194928 ?auto_2194931 ) ) ( not ( = ?auto_2194928 ?auto_2194932 ) ) ( not ( = ?auto_2194928 ?auto_2194933 ) ) ( not ( = ?auto_2194928 ?auto_2194934 ) ) ( not ( = ?auto_2194928 ?auto_2194935 ) ) ( not ( = ?auto_2194929 ?auto_2194930 ) ) ( not ( = ?auto_2194929 ?auto_2194931 ) ) ( not ( = ?auto_2194929 ?auto_2194932 ) ) ( not ( = ?auto_2194929 ?auto_2194933 ) ) ( not ( = ?auto_2194929 ?auto_2194934 ) ) ( not ( = ?auto_2194929 ?auto_2194935 ) ) ( not ( = ?auto_2194930 ?auto_2194931 ) ) ( not ( = ?auto_2194930 ?auto_2194932 ) ) ( not ( = ?auto_2194930 ?auto_2194933 ) ) ( not ( = ?auto_2194930 ?auto_2194934 ) ) ( not ( = ?auto_2194930 ?auto_2194935 ) ) ( not ( = ?auto_2194931 ?auto_2194932 ) ) ( not ( = ?auto_2194931 ?auto_2194933 ) ) ( not ( = ?auto_2194931 ?auto_2194934 ) ) ( not ( = ?auto_2194931 ?auto_2194935 ) ) ( not ( = ?auto_2194932 ?auto_2194933 ) ) ( not ( = ?auto_2194932 ?auto_2194934 ) ) ( not ( = ?auto_2194932 ?auto_2194935 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2194933 ?auto_2194934 ?auto_2194935 )
      ( MAKE-14CRATE-VERIFY ?auto_2194922 ?auto_2194923 ?auto_2194924 ?auto_2194921 ?auto_2194925 ?auto_2194927 ?auto_2194926 ?auto_2194928 ?auto_2194929 ?auto_2194930 ?auto_2194931 ?auto_2194932 ?auto_2194933 ?auto_2194934 ?auto_2194935 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_2195111 - SURFACE
      ?auto_2195112 - SURFACE
      ?auto_2195113 - SURFACE
      ?auto_2195110 - SURFACE
      ?auto_2195114 - SURFACE
      ?auto_2195116 - SURFACE
      ?auto_2195115 - SURFACE
      ?auto_2195117 - SURFACE
      ?auto_2195118 - SURFACE
      ?auto_2195119 - SURFACE
      ?auto_2195120 - SURFACE
      ?auto_2195121 - SURFACE
      ?auto_2195122 - SURFACE
      ?auto_2195123 - SURFACE
      ?auto_2195124 - SURFACE
    )
    :vars
    (
      ?auto_2195127 - HOIST
      ?auto_2195128 - PLACE
      ?auto_2195129 - TRUCK
      ?auto_2195125 - PLACE
      ?auto_2195126 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2195127 ?auto_2195128 ) ( SURFACE-AT ?auto_2195123 ?auto_2195128 ) ( CLEAR ?auto_2195123 ) ( IS-CRATE ?auto_2195124 ) ( not ( = ?auto_2195123 ?auto_2195124 ) ) ( AVAILABLE ?auto_2195127 ) ( ON ?auto_2195123 ?auto_2195122 ) ( not ( = ?auto_2195122 ?auto_2195123 ) ) ( not ( = ?auto_2195122 ?auto_2195124 ) ) ( TRUCK-AT ?auto_2195129 ?auto_2195125 ) ( not ( = ?auto_2195125 ?auto_2195128 ) ) ( HOIST-AT ?auto_2195126 ?auto_2195125 ) ( LIFTING ?auto_2195126 ?auto_2195124 ) ( not ( = ?auto_2195127 ?auto_2195126 ) ) ( ON ?auto_2195112 ?auto_2195111 ) ( ON ?auto_2195113 ?auto_2195112 ) ( ON ?auto_2195110 ?auto_2195113 ) ( ON ?auto_2195114 ?auto_2195110 ) ( ON ?auto_2195116 ?auto_2195114 ) ( ON ?auto_2195115 ?auto_2195116 ) ( ON ?auto_2195117 ?auto_2195115 ) ( ON ?auto_2195118 ?auto_2195117 ) ( ON ?auto_2195119 ?auto_2195118 ) ( ON ?auto_2195120 ?auto_2195119 ) ( ON ?auto_2195121 ?auto_2195120 ) ( ON ?auto_2195122 ?auto_2195121 ) ( not ( = ?auto_2195111 ?auto_2195112 ) ) ( not ( = ?auto_2195111 ?auto_2195113 ) ) ( not ( = ?auto_2195111 ?auto_2195110 ) ) ( not ( = ?auto_2195111 ?auto_2195114 ) ) ( not ( = ?auto_2195111 ?auto_2195116 ) ) ( not ( = ?auto_2195111 ?auto_2195115 ) ) ( not ( = ?auto_2195111 ?auto_2195117 ) ) ( not ( = ?auto_2195111 ?auto_2195118 ) ) ( not ( = ?auto_2195111 ?auto_2195119 ) ) ( not ( = ?auto_2195111 ?auto_2195120 ) ) ( not ( = ?auto_2195111 ?auto_2195121 ) ) ( not ( = ?auto_2195111 ?auto_2195122 ) ) ( not ( = ?auto_2195111 ?auto_2195123 ) ) ( not ( = ?auto_2195111 ?auto_2195124 ) ) ( not ( = ?auto_2195112 ?auto_2195113 ) ) ( not ( = ?auto_2195112 ?auto_2195110 ) ) ( not ( = ?auto_2195112 ?auto_2195114 ) ) ( not ( = ?auto_2195112 ?auto_2195116 ) ) ( not ( = ?auto_2195112 ?auto_2195115 ) ) ( not ( = ?auto_2195112 ?auto_2195117 ) ) ( not ( = ?auto_2195112 ?auto_2195118 ) ) ( not ( = ?auto_2195112 ?auto_2195119 ) ) ( not ( = ?auto_2195112 ?auto_2195120 ) ) ( not ( = ?auto_2195112 ?auto_2195121 ) ) ( not ( = ?auto_2195112 ?auto_2195122 ) ) ( not ( = ?auto_2195112 ?auto_2195123 ) ) ( not ( = ?auto_2195112 ?auto_2195124 ) ) ( not ( = ?auto_2195113 ?auto_2195110 ) ) ( not ( = ?auto_2195113 ?auto_2195114 ) ) ( not ( = ?auto_2195113 ?auto_2195116 ) ) ( not ( = ?auto_2195113 ?auto_2195115 ) ) ( not ( = ?auto_2195113 ?auto_2195117 ) ) ( not ( = ?auto_2195113 ?auto_2195118 ) ) ( not ( = ?auto_2195113 ?auto_2195119 ) ) ( not ( = ?auto_2195113 ?auto_2195120 ) ) ( not ( = ?auto_2195113 ?auto_2195121 ) ) ( not ( = ?auto_2195113 ?auto_2195122 ) ) ( not ( = ?auto_2195113 ?auto_2195123 ) ) ( not ( = ?auto_2195113 ?auto_2195124 ) ) ( not ( = ?auto_2195110 ?auto_2195114 ) ) ( not ( = ?auto_2195110 ?auto_2195116 ) ) ( not ( = ?auto_2195110 ?auto_2195115 ) ) ( not ( = ?auto_2195110 ?auto_2195117 ) ) ( not ( = ?auto_2195110 ?auto_2195118 ) ) ( not ( = ?auto_2195110 ?auto_2195119 ) ) ( not ( = ?auto_2195110 ?auto_2195120 ) ) ( not ( = ?auto_2195110 ?auto_2195121 ) ) ( not ( = ?auto_2195110 ?auto_2195122 ) ) ( not ( = ?auto_2195110 ?auto_2195123 ) ) ( not ( = ?auto_2195110 ?auto_2195124 ) ) ( not ( = ?auto_2195114 ?auto_2195116 ) ) ( not ( = ?auto_2195114 ?auto_2195115 ) ) ( not ( = ?auto_2195114 ?auto_2195117 ) ) ( not ( = ?auto_2195114 ?auto_2195118 ) ) ( not ( = ?auto_2195114 ?auto_2195119 ) ) ( not ( = ?auto_2195114 ?auto_2195120 ) ) ( not ( = ?auto_2195114 ?auto_2195121 ) ) ( not ( = ?auto_2195114 ?auto_2195122 ) ) ( not ( = ?auto_2195114 ?auto_2195123 ) ) ( not ( = ?auto_2195114 ?auto_2195124 ) ) ( not ( = ?auto_2195116 ?auto_2195115 ) ) ( not ( = ?auto_2195116 ?auto_2195117 ) ) ( not ( = ?auto_2195116 ?auto_2195118 ) ) ( not ( = ?auto_2195116 ?auto_2195119 ) ) ( not ( = ?auto_2195116 ?auto_2195120 ) ) ( not ( = ?auto_2195116 ?auto_2195121 ) ) ( not ( = ?auto_2195116 ?auto_2195122 ) ) ( not ( = ?auto_2195116 ?auto_2195123 ) ) ( not ( = ?auto_2195116 ?auto_2195124 ) ) ( not ( = ?auto_2195115 ?auto_2195117 ) ) ( not ( = ?auto_2195115 ?auto_2195118 ) ) ( not ( = ?auto_2195115 ?auto_2195119 ) ) ( not ( = ?auto_2195115 ?auto_2195120 ) ) ( not ( = ?auto_2195115 ?auto_2195121 ) ) ( not ( = ?auto_2195115 ?auto_2195122 ) ) ( not ( = ?auto_2195115 ?auto_2195123 ) ) ( not ( = ?auto_2195115 ?auto_2195124 ) ) ( not ( = ?auto_2195117 ?auto_2195118 ) ) ( not ( = ?auto_2195117 ?auto_2195119 ) ) ( not ( = ?auto_2195117 ?auto_2195120 ) ) ( not ( = ?auto_2195117 ?auto_2195121 ) ) ( not ( = ?auto_2195117 ?auto_2195122 ) ) ( not ( = ?auto_2195117 ?auto_2195123 ) ) ( not ( = ?auto_2195117 ?auto_2195124 ) ) ( not ( = ?auto_2195118 ?auto_2195119 ) ) ( not ( = ?auto_2195118 ?auto_2195120 ) ) ( not ( = ?auto_2195118 ?auto_2195121 ) ) ( not ( = ?auto_2195118 ?auto_2195122 ) ) ( not ( = ?auto_2195118 ?auto_2195123 ) ) ( not ( = ?auto_2195118 ?auto_2195124 ) ) ( not ( = ?auto_2195119 ?auto_2195120 ) ) ( not ( = ?auto_2195119 ?auto_2195121 ) ) ( not ( = ?auto_2195119 ?auto_2195122 ) ) ( not ( = ?auto_2195119 ?auto_2195123 ) ) ( not ( = ?auto_2195119 ?auto_2195124 ) ) ( not ( = ?auto_2195120 ?auto_2195121 ) ) ( not ( = ?auto_2195120 ?auto_2195122 ) ) ( not ( = ?auto_2195120 ?auto_2195123 ) ) ( not ( = ?auto_2195120 ?auto_2195124 ) ) ( not ( = ?auto_2195121 ?auto_2195122 ) ) ( not ( = ?auto_2195121 ?auto_2195123 ) ) ( not ( = ?auto_2195121 ?auto_2195124 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2195122 ?auto_2195123 ?auto_2195124 )
      ( MAKE-14CRATE-VERIFY ?auto_2195111 ?auto_2195112 ?auto_2195113 ?auto_2195110 ?auto_2195114 ?auto_2195116 ?auto_2195115 ?auto_2195117 ?auto_2195118 ?auto_2195119 ?auto_2195120 ?auto_2195121 ?auto_2195122 ?auto_2195123 ?auto_2195124 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_2195314 - SURFACE
      ?auto_2195315 - SURFACE
      ?auto_2195316 - SURFACE
      ?auto_2195313 - SURFACE
      ?auto_2195317 - SURFACE
      ?auto_2195319 - SURFACE
      ?auto_2195318 - SURFACE
      ?auto_2195320 - SURFACE
      ?auto_2195321 - SURFACE
      ?auto_2195322 - SURFACE
      ?auto_2195323 - SURFACE
      ?auto_2195324 - SURFACE
      ?auto_2195325 - SURFACE
      ?auto_2195326 - SURFACE
      ?auto_2195327 - SURFACE
    )
    :vars
    (
      ?auto_2195330 - HOIST
      ?auto_2195328 - PLACE
      ?auto_2195331 - TRUCK
      ?auto_2195329 - PLACE
      ?auto_2195333 - HOIST
      ?auto_2195332 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2195330 ?auto_2195328 ) ( SURFACE-AT ?auto_2195326 ?auto_2195328 ) ( CLEAR ?auto_2195326 ) ( IS-CRATE ?auto_2195327 ) ( not ( = ?auto_2195326 ?auto_2195327 ) ) ( AVAILABLE ?auto_2195330 ) ( ON ?auto_2195326 ?auto_2195325 ) ( not ( = ?auto_2195325 ?auto_2195326 ) ) ( not ( = ?auto_2195325 ?auto_2195327 ) ) ( TRUCK-AT ?auto_2195331 ?auto_2195329 ) ( not ( = ?auto_2195329 ?auto_2195328 ) ) ( HOIST-AT ?auto_2195333 ?auto_2195329 ) ( not ( = ?auto_2195330 ?auto_2195333 ) ) ( AVAILABLE ?auto_2195333 ) ( SURFACE-AT ?auto_2195327 ?auto_2195329 ) ( ON ?auto_2195327 ?auto_2195332 ) ( CLEAR ?auto_2195327 ) ( not ( = ?auto_2195326 ?auto_2195332 ) ) ( not ( = ?auto_2195327 ?auto_2195332 ) ) ( not ( = ?auto_2195325 ?auto_2195332 ) ) ( ON ?auto_2195315 ?auto_2195314 ) ( ON ?auto_2195316 ?auto_2195315 ) ( ON ?auto_2195313 ?auto_2195316 ) ( ON ?auto_2195317 ?auto_2195313 ) ( ON ?auto_2195319 ?auto_2195317 ) ( ON ?auto_2195318 ?auto_2195319 ) ( ON ?auto_2195320 ?auto_2195318 ) ( ON ?auto_2195321 ?auto_2195320 ) ( ON ?auto_2195322 ?auto_2195321 ) ( ON ?auto_2195323 ?auto_2195322 ) ( ON ?auto_2195324 ?auto_2195323 ) ( ON ?auto_2195325 ?auto_2195324 ) ( not ( = ?auto_2195314 ?auto_2195315 ) ) ( not ( = ?auto_2195314 ?auto_2195316 ) ) ( not ( = ?auto_2195314 ?auto_2195313 ) ) ( not ( = ?auto_2195314 ?auto_2195317 ) ) ( not ( = ?auto_2195314 ?auto_2195319 ) ) ( not ( = ?auto_2195314 ?auto_2195318 ) ) ( not ( = ?auto_2195314 ?auto_2195320 ) ) ( not ( = ?auto_2195314 ?auto_2195321 ) ) ( not ( = ?auto_2195314 ?auto_2195322 ) ) ( not ( = ?auto_2195314 ?auto_2195323 ) ) ( not ( = ?auto_2195314 ?auto_2195324 ) ) ( not ( = ?auto_2195314 ?auto_2195325 ) ) ( not ( = ?auto_2195314 ?auto_2195326 ) ) ( not ( = ?auto_2195314 ?auto_2195327 ) ) ( not ( = ?auto_2195314 ?auto_2195332 ) ) ( not ( = ?auto_2195315 ?auto_2195316 ) ) ( not ( = ?auto_2195315 ?auto_2195313 ) ) ( not ( = ?auto_2195315 ?auto_2195317 ) ) ( not ( = ?auto_2195315 ?auto_2195319 ) ) ( not ( = ?auto_2195315 ?auto_2195318 ) ) ( not ( = ?auto_2195315 ?auto_2195320 ) ) ( not ( = ?auto_2195315 ?auto_2195321 ) ) ( not ( = ?auto_2195315 ?auto_2195322 ) ) ( not ( = ?auto_2195315 ?auto_2195323 ) ) ( not ( = ?auto_2195315 ?auto_2195324 ) ) ( not ( = ?auto_2195315 ?auto_2195325 ) ) ( not ( = ?auto_2195315 ?auto_2195326 ) ) ( not ( = ?auto_2195315 ?auto_2195327 ) ) ( not ( = ?auto_2195315 ?auto_2195332 ) ) ( not ( = ?auto_2195316 ?auto_2195313 ) ) ( not ( = ?auto_2195316 ?auto_2195317 ) ) ( not ( = ?auto_2195316 ?auto_2195319 ) ) ( not ( = ?auto_2195316 ?auto_2195318 ) ) ( not ( = ?auto_2195316 ?auto_2195320 ) ) ( not ( = ?auto_2195316 ?auto_2195321 ) ) ( not ( = ?auto_2195316 ?auto_2195322 ) ) ( not ( = ?auto_2195316 ?auto_2195323 ) ) ( not ( = ?auto_2195316 ?auto_2195324 ) ) ( not ( = ?auto_2195316 ?auto_2195325 ) ) ( not ( = ?auto_2195316 ?auto_2195326 ) ) ( not ( = ?auto_2195316 ?auto_2195327 ) ) ( not ( = ?auto_2195316 ?auto_2195332 ) ) ( not ( = ?auto_2195313 ?auto_2195317 ) ) ( not ( = ?auto_2195313 ?auto_2195319 ) ) ( not ( = ?auto_2195313 ?auto_2195318 ) ) ( not ( = ?auto_2195313 ?auto_2195320 ) ) ( not ( = ?auto_2195313 ?auto_2195321 ) ) ( not ( = ?auto_2195313 ?auto_2195322 ) ) ( not ( = ?auto_2195313 ?auto_2195323 ) ) ( not ( = ?auto_2195313 ?auto_2195324 ) ) ( not ( = ?auto_2195313 ?auto_2195325 ) ) ( not ( = ?auto_2195313 ?auto_2195326 ) ) ( not ( = ?auto_2195313 ?auto_2195327 ) ) ( not ( = ?auto_2195313 ?auto_2195332 ) ) ( not ( = ?auto_2195317 ?auto_2195319 ) ) ( not ( = ?auto_2195317 ?auto_2195318 ) ) ( not ( = ?auto_2195317 ?auto_2195320 ) ) ( not ( = ?auto_2195317 ?auto_2195321 ) ) ( not ( = ?auto_2195317 ?auto_2195322 ) ) ( not ( = ?auto_2195317 ?auto_2195323 ) ) ( not ( = ?auto_2195317 ?auto_2195324 ) ) ( not ( = ?auto_2195317 ?auto_2195325 ) ) ( not ( = ?auto_2195317 ?auto_2195326 ) ) ( not ( = ?auto_2195317 ?auto_2195327 ) ) ( not ( = ?auto_2195317 ?auto_2195332 ) ) ( not ( = ?auto_2195319 ?auto_2195318 ) ) ( not ( = ?auto_2195319 ?auto_2195320 ) ) ( not ( = ?auto_2195319 ?auto_2195321 ) ) ( not ( = ?auto_2195319 ?auto_2195322 ) ) ( not ( = ?auto_2195319 ?auto_2195323 ) ) ( not ( = ?auto_2195319 ?auto_2195324 ) ) ( not ( = ?auto_2195319 ?auto_2195325 ) ) ( not ( = ?auto_2195319 ?auto_2195326 ) ) ( not ( = ?auto_2195319 ?auto_2195327 ) ) ( not ( = ?auto_2195319 ?auto_2195332 ) ) ( not ( = ?auto_2195318 ?auto_2195320 ) ) ( not ( = ?auto_2195318 ?auto_2195321 ) ) ( not ( = ?auto_2195318 ?auto_2195322 ) ) ( not ( = ?auto_2195318 ?auto_2195323 ) ) ( not ( = ?auto_2195318 ?auto_2195324 ) ) ( not ( = ?auto_2195318 ?auto_2195325 ) ) ( not ( = ?auto_2195318 ?auto_2195326 ) ) ( not ( = ?auto_2195318 ?auto_2195327 ) ) ( not ( = ?auto_2195318 ?auto_2195332 ) ) ( not ( = ?auto_2195320 ?auto_2195321 ) ) ( not ( = ?auto_2195320 ?auto_2195322 ) ) ( not ( = ?auto_2195320 ?auto_2195323 ) ) ( not ( = ?auto_2195320 ?auto_2195324 ) ) ( not ( = ?auto_2195320 ?auto_2195325 ) ) ( not ( = ?auto_2195320 ?auto_2195326 ) ) ( not ( = ?auto_2195320 ?auto_2195327 ) ) ( not ( = ?auto_2195320 ?auto_2195332 ) ) ( not ( = ?auto_2195321 ?auto_2195322 ) ) ( not ( = ?auto_2195321 ?auto_2195323 ) ) ( not ( = ?auto_2195321 ?auto_2195324 ) ) ( not ( = ?auto_2195321 ?auto_2195325 ) ) ( not ( = ?auto_2195321 ?auto_2195326 ) ) ( not ( = ?auto_2195321 ?auto_2195327 ) ) ( not ( = ?auto_2195321 ?auto_2195332 ) ) ( not ( = ?auto_2195322 ?auto_2195323 ) ) ( not ( = ?auto_2195322 ?auto_2195324 ) ) ( not ( = ?auto_2195322 ?auto_2195325 ) ) ( not ( = ?auto_2195322 ?auto_2195326 ) ) ( not ( = ?auto_2195322 ?auto_2195327 ) ) ( not ( = ?auto_2195322 ?auto_2195332 ) ) ( not ( = ?auto_2195323 ?auto_2195324 ) ) ( not ( = ?auto_2195323 ?auto_2195325 ) ) ( not ( = ?auto_2195323 ?auto_2195326 ) ) ( not ( = ?auto_2195323 ?auto_2195327 ) ) ( not ( = ?auto_2195323 ?auto_2195332 ) ) ( not ( = ?auto_2195324 ?auto_2195325 ) ) ( not ( = ?auto_2195324 ?auto_2195326 ) ) ( not ( = ?auto_2195324 ?auto_2195327 ) ) ( not ( = ?auto_2195324 ?auto_2195332 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2195325 ?auto_2195326 ?auto_2195327 )
      ( MAKE-14CRATE-VERIFY ?auto_2195314 ?auto_2195315 ?auto_2195316 ?auto_2195313 ?auto_2195317 ?auto_2195319 ?auto_2195318 ?auto_2195320 ?auto_2195321 ?auto_2195322 ?auto_2195323 ?auto_2195324 ?auto_2195325 ?auto_2195326 ?auto_2195327 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_2195518 - SURFACE
      ?auto_2195519 - SURFACE
      ?auto_2195520 - SURFACE
      ?auto_2195517 - SURFACE
      ?auto_2195521 - SURFACE
      ?auto_2195523 - SURFACE
      ?auto_2195522 - SURFACE
      ?auto_2195524 - SURFACE
      ?auto_2195525 - SURFACE
      ?auto_2195526 - SURFACE
      ?auto_2195527 - SURFACE
      ?auto_2195528 - SURFACE
      ?auto_2195529 - SURFACE
      ?auto_2195530 - SURFACE
      ?auto_2195531 - SURFACE
    )
    :vars
    (
      ?auto_2195534 - HOIST
      ?auto_2195533 - PLACE
      ?auto_2195532 - PLACE
      ?auto_2195536 - HOIST
      ?auto_2195535 - SURFACE
      ?auto_2195537 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2195534 ?auto_2195533 ) ( SURFACE-AT ?auto_2195530 ?auto_2195533 ) ( CLEAR ?auto_2195530 ) ( IS-CRATE ?auto_2195531 ) ( not ( = ?auto_2195530 ?auto_2195531 ) ) ( AVAILABLE ?auto_2195534 ) ( ON ?auto_2195530 ?auto_2195529 ) ( not ( = ?auto_2195529 ?auto_2195530 ) ) ( not ( = ?auto_2195529 ?auto_2195531 ) ) ( not ( = ?auto_2195532 ?auto_2195533 ) ) ( HOIST-AT ?auto_2195536 ?auto_2195532 ) ( not ( = ?auto_2195534 ?auto_2195536 ) ) ( AVAILABLE ?auto_2195536 ) ( SURFACE-AT ?auto_2195531 ?auto_2195532 ) ( ON ?auto_2195531 ?auto_2195535 ) ( CLEAR ?auto_2195531 ) ( not ( = ?auto_2195530 ?auto_2195535 ) ) ( not ( = ?auto_2195531 ?auto_2195535 ) ) ( not ( = ?auto_2195529 ?auto_2195535 ) ) ( TRUCK-AT ?auto_2195537 ?auto_2195533 ) ( ON ?auto_2195519 ?auto_2195518 ) ( ON ?auto_2195520 ?auto_2195519 ) ( ON ?auto_2195517 ?auto_2195520 ) ( ON ?auto_2195521 ?auto_2195517 ) ( ON ?auto_2195523 ?auto_2195521 ) ( ON ?auto_2195522 ?auto_2195523 ) ( ON ?auto_2195524 ?auto_2195522 ) ( ON ?auto_2195525 ?auto_2195524 ) ( ON ?auto_2195526 ?auto_2195525 ) ( ON ?auto_2195527 ?auto_2195526 ) ( ON ?auto_2195528 ?auto_2195527 ) ( ON ?auto_2195529 ?auto_2195528 ) ( not ( = ?auto_2195518 ?auto_2195519 ) ) ( not ( = ?auto_2195518 ?auto_2195520 ) ) ( not ( = ?auto_2195518 ?auto_2195517 ) ) ( not ( = ?auto_2195518 ?auto_2195521 ) ) ( not ( = ?auto_2195518 ?auto_2195523 ) ) ( not ( = ?auto_2195518 ?auto_2195522 ) ) ( not ( = ?auto_2195518 ?auto_2195524 ) ) ( not ( = ?auto_2195518 ?auto_2195525 ) ) ( not ( = ?auto_2195518 ?auto_2195526 ) ) ( not ( = ?auto_2195518 ?auto_2195527 ) ) ( not ( = ?auto_2195518 ?auto_2195528 ) ) ( not ( = ?auto_2195518 ?auto_2195529 ) ) ( not ( = ?auto_2195518 ?auto_2195530 ) ) ( not ( = ?auto_2195518 ?auto_2195531 ) ) ( not ( = ?auto_2195518 ?auto_2195535 ) ) ( not ( = ?auto_2195519 ?auto_2195520 ) ) ( not ( = ?auto_2195519 ?auto_2195517 ) ) ( not ( = ?auto_2195519 ?auto_2195521 ) ) ( not ( = ?auto_2195519 ?auto_2195523 ) ) ( not ( = ?auto_2195519 ?auto_2195522 ) ) ( not ( = ?auto_2195519 ?auto_2195524 ) ) ( not ( = ?auto_2195519 ?auto_2195525 ) ) ( not ( = ?auto_2195519 ?auto_2195526 ) ) ( not ( = ?auto_2195519 ?auto_2195527 ) ) ( not ( = ?auto_2195519 ?auto_2195528 ) ) ( not ( = ?auto_2195519 ?auto_2195529 ) ) ( not ( = ?auto_2195519 ?auto_2195530 ) ) ( not ( = ?auto_2195519 ?auto_2195531 ) ) ( not ( = ?auto_2195519 ?auto_2195535 ) ) ( not ( = ?auto_2195520 ?auto_2195517 ) ) ( not ( = ?auto_2195520 ?auto_2195521 ) ) ( not ( = ?auto_2195520 ?auto_2195523 ) ) ( not ( = ?auto_2195520 ?auto_2195522 ) ) ( not ( = ?auto_2195520 ?auto_2195524 ) ) ( not ( = ?auto_2195520 ?auto_2195525 ) ) ( not ( = ?auto_2195520 ?auto_2195526 ) ) ( not ( = ?auto_2195520 ?auto_2195527 ) ) ( not ( = ?auto_2195520 ?auto_2195528 ) ) ( not ( = ?auto_2195520 ?auto_2195529 ) ) ( not ( = ?auto_2195520 ?auto_2195530 ) ) ( not ( = ?auto_2195520 ?auto_2195531 ) ) ( not ( = ?auto_2195520 ?auto_2195535 ) ) ( not ( = ?auto_2195517 ?auto_2195521 ) ) ( not ( = ?auto_2195517 ?auto_2195523 ) ) ( not ( = ?auto_2195517 ?auto_2195522 ) ) ( not ( = ?auto_2195517 ?auto_2195524 ) ) ( not ( = ?auto_2195517 ?auto_2195525 ) ) ( not ( = ?auto_2195517 ?auto_2195526 ) ) ( not ( = ?auto_2195517 ?auto_2195527 ) ) ( not ( = ?auto_2195517 ?auto_2195528 ) ) ( not ( = ?auto_2195517 ?auto_2195529 ) ) ( not ( = ?auto_2195517 ?auto_2195530 ) ) ( not ( = ?auto_2195517 ?auto_2195531 ) ) ( not ( = ?auto_2195517 ?auto_2195535 ) ) ( not ( = ?auto_2195521 ?auto_2195523 ) ) ( not ( = ?auto_2195521 ?auto_2195522 ) ) ( not ( = ?auto_2195521 ?auto_2195524 ) ) ( not ( = ?auto_2195521 ?auto_2195525 ) ) ( not ( = ?auto_2195521 ?auto_2195526 ) ) ( not ( = ?auto_2195521 ?auto_2195527 ) ) ( not ( = ?auto_2195521 ?auto_2195528 ) ) ( not ( = ?auto_2195521 ?auto_2195529 ) ) ( not ( = ?auto_2195521 ?auto_2195530 ) ) ( not ( = ?auto_2195521 ?auto_2195531 ) ) ( not ( = ?auto_2195521 ?auto_2195535 ) ) ( not ( = ?auto_2195523 ?auto_2195522 ) ) ( not ( = ?auto_2195523 ?auto_2195524 ) ) ( not ( = ?auto_2195523 ?auto_2195525 ) ) ( not ( = ?auto_2195523 ?auto_2195526 ) ) ( not ( = ?auto_2195523 ?auto_2195527 ) ) ( not ( = ?auto_2195523 ?auto_2195528 ) ) ( not ( = ?auto_2195523 ?auto_2195529 ) ) ( not ( = ?auto_2195523 ?auto_2195530 ) ) ( not ( = ?auto_2195523 ?auto_2195531 ) ) ( not ( = ?auto_2195523 ?auto_2195535 ) ) ( not ( = ?auto_2195522 ?auto_2195524 ) ) ( not ( = ?auto_2195522 ?auto_2195525 ) ) ( not ( = ?auto_2195522 ?auto_2195526 ) ) ( not ( = ?auto_2195522 ?auto_2195527 ) ) ( not ( = ?auto_2195522 ?auto_2195528 ) ) ( not ( = ?auto_2195522 ?auto_2195529 ) ) ( not ( = ?auto_2195522 ?auto_2195530 ) ) ( not ( = ?auto_2195522 ?auto_2195531 ) ) ( not ( = ?auto_2195522 ?auto_2195535 ) ) ( not ( = ?auto_2195524 ?auto_2195525 ) ) ( not ( = ?auto_2195524 ?auto_2195526 ) ) ( not ( = ?auto_2195524 ?auto_2195527 ) ) ( not ( = ?auto_2195524 ?auto_2195528 ) ) ( not ( = ?auto_2195524 ?auto_2195529 ) ) ( not ( = ?auto_2195524 ?auto_2195530 ) ) ( not ( = ?auto_2195524 ?auto_2195531 ) ) ( not ( = ?auto_2195524 ?auto_2195535 ) ) ( not ( = ?auto_2195525 ?auto_2195526 ) ) ( not ( = ?auto_2195525 ?auto_2195527 ) ) ( not ( = ?auto_2195525 ?auto_2195528 ) ) ( not ( = ?auto_2195525 ?auto_2195529 ) ) ( not ( = ?auto_2195525 ?auto_2195530 ) ) ( not ( = ?auto_2195525 ?auto_2195531 ) ) ( not ( = ?auto_2195525 ?auto_2195535 ) ) ( not ( = ?auto_2195526 ?auto_2195527 ) ) ( not ( = ?auto_2195526 ?auto_2195528 ) ) ( not ( = ?auto_2195526 ?auto_2195529 ) ) ( not ( = ?auto_2195526 ?auto_2195530 ) ) ( not ( = ?auto_2195526 ?auto_2195531 ) ) ( not ( = ?auto_2195526 ?auto_2195535 ) ) ( not ( = ?auto_2195527 ?auto_2195528 ) ) ( not ( = ?auto_2195527 ?auto_2195529 ) ) ( not ( = ?auto_2195527 ?auto_2195530 ) ) ( not ( = ?auto_2195527 ?auto_2195531 ) ) ( not ( = ?auto_2195527 ?auto_2195535 ) ) ( not ( = ?auto_2195528 ?auto_2195529 ) ) ( not ( = ?auto_2195528 ?auto_2195530 ) ) ( not ( = ?auto_2195528 ?auto_2195531 ) ) ( not ( = ?auto_2195528 ?auto_2195535 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2195529 ?auto_2195530 ?auto_2195531 )
      ( MAKE-14CRATE-VERIFY ?auto_2195518 ?auto_2195519 ?auto_2195520 ?auto_2195517 ?auto_2195521 ?auto_2195523 ?auto_2195522 ?auto_2195524 ?auto_2195525 ?auto_2195526 ?auto_2195527 ?auto_2195528 ?auto_2195529 ?auto_2195530 ?auto_2195531 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_2195722 - SURFACE
      ?auto_2195723 - SURFACE
      ?auto_2195724 - SURFACE
      ?auto_2195721 - SURFACE
      ?auto_2195725 - SURFACE
      ?auto_2195727 - SURFACE
      ?auto_2195726 - SURFACE
      ?auto_2195728 - SURFACE
      ?auto_2195729 - SURFACE
      ?auto_2195730 - SURFACE
      ?auto_2195731 - SURFACE
      ?auto_2195732 - SURFACE
      ?auto_2195733 - SURFACE
      ?auto_2195734 - SURFACE
      ?auto_2195735 - SURFACE
    )
    :vars
    (
      ?auto_2195739 - HOIST
      ?auto_2195738 - PLACE
      ?auto_2195736 - PLACE
      ?auto_2195737 - HOIST
      ?auto_2195741 - SURFACE
      ?auto_2195740 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2195739 ?auto_2195738 ) ( IS-CRATE ?auto_2195735 ) ( not ( = ?auto_2195734 ?auto_2195735 ) ) ( not ( = ?auto_2195733 ?auto_2195734 ) ) ( not ( = ?auto_2195733 ?auto_2195735 ) ) ( not ( = ?auto_2195736 ?auto_2195738 ) ) ( HOIST-AT ?auto_2195737 ?auto_2195736 ) ( not ( = ?auto_2195739 ?auto_2195737 ) ) ( AVAILABLE ?auto_2195737 ) ( SURFACE-AT ?auto_2195735 ?auto_2195736 ) ( ON ?auto_2195735 ?auto_2195741 ) ( CLEAR ?auto_2195735 ) ( not ( = ?auto_2195734 ?auto_2195741 ) ) ( not ( = ?auto_2195735 ?auto_2195741 ) ) ( not ( = ?auto_2195733 ?auto_2195741 ) ) ( TRUCK-AT ?auto_2195740 ?auto_2195738 ) ( SURFACE-AT ?auto_2195733 ?auto_2195738 ) ( CLEAR ?auto_2195733 ) ( LIFTING ?auto_2195739 ?auto_2195734 ) ( IS-CRATE ?auto_2195734 ) ( ON ?auto_2195723 ?auto_2195722 ) ( ON ?auto_2195724 ?auto_2195723 ) ( ON ?auto_2195721 ?auto_2195724 ) ( ON ?auto_2195725 ?auto_2195721 ) ( ON ?auto_2195727 ?auto_2195725 ) ( ON ?auto_2195726 ?auto_2195727 ) ( ON ?auto_2195728 ?auto_2195726 ) ( ON ?auto_2195729 ?auto_2195728 ) ( ON ?auto_2195730 ?auto_2195729 ) ( ON ?auto_2195731 ?auto_2195730 ) ( ON ?auto_2195732 ?auto_2195731 ) ( ON ?auto_2195733 ?auto_2195732 ) ( not ( = ?auto_2195722 ?auto_2195723 ) ) ( not ( = ?auto_2195722 ?auto_2195724 ) ) ( not ( = ?auto_2195722 ?auto_2195721 ) ) ( not ( = ?auto_2195722 ?auto_2195725 ) ) ( not ( = ?auto_2195722 ?auto_2195727 ) ) ( not ( = ?auto_2195722 ?auto_2195726 ) ) ( not ( = ?auto_2195722 ?auto_2195728 ) ) ( not ( = ?auto_2195722 ?auto_2195729 ) ) ( not ( = ?auto_2195722 ?auto_2195730 ) ) ( not ( = ?auto_2195722 ?auto_2195731 ) ) ( not ( = ?auto_2195722 ?auto_2195732 ) ) ( not ( = ?auto_2195722 ?auto_2195733 ) ) ( not ( = ?auto_2195722 ?auto_2195734 ) ) ( not ( = ?auto_2195722 ?auto_2195735 ) ) ( not ( = ?auto_2195722 ?auto_2195741 ) ) ( not ( = ?auto_2195723 ?auto_2195724 ) ) ( not ( = ?auto_2195723 ?auto_2195721 ) ) ( not ( = ?auto_2195723 ?auto_2195725 ) ) ( not ( = ?auto_2195723 ?auto_2195727 ) ) ( not ( = ?auto_2195723 ?auto_2195726 ) ) ( not ( = ?auto_2195723 ?auto_2195728 ) ) ( not ( = ?auto_2195723 ?auto_2195729 ) ) ( not ( = ?auto_2195723 ?auto_2195730 ) ) ( not ( = ?auto_2195723 ?auto_2195731 ) ) ( not ( = ?auto_2195723 ?auto_2195732 ) ) ( not ( = ?auto_2195723 ?auto_2195733 ) ) ( not ( = ?auto_2195723 ?auto_2195734 ) ) ( not ( = ?auto_2195723 ?auto_2195735 ) ) ( not ( = ?auto_2195723 ?auto_2195741 ) ) ( not ( = ?auto_2195724 ?auto_2195721 ) ) ( not ( = ?auto_2195724 ?auto_2195725 ) ) ( not ( = ?auto_2195724 ?auto_2195727 ) ) ( not ( = ?auto_2195724 ?auto_2195726 ) ) ( not ( = ?auto_2195724 ?auto_2195728 ) ) ( not ( = ?auto_2195724 ?auto_2195729 ) ) ( not ( = ?auto_2195724 ?auto_2195730 ) ) ( not ( = ?auto_2195724 ?auto_2195731 ) ) ( not ( = ?auto_2195724 ?auto_2195732 ) ) ( not ( = ?auto_2195724 ?auto_2195733 ) ) ( not ( = ?auto_2195724 ?auto_2195734 ) ) ( not ( = ?auto_2195724 ?auto_2195735 ) ) ( not ( = ?auto_2195724 ?auto_2195741 ) ) ( not ( = ?auto_2195721 ?auto_2195725 ) ) ( not ( = ?auto_2195721 ?auto_2195727 ) ) ( not ( = ?auto_2195721 ?auto_2195726 ) ) ( not ( = ?auto_2195721 ?auto_2195728 ) ) ( not ( = ?auto_2195721 ?auto_2195729 ) ) ( not ( = ?auto_2195721 ?auto_2195730 ) ) ( not ( = ?auto_2195721 ?auto_2195731 ) ) ( not ( = ?auto_2195721 ?auto_2195732 ) ) ( not ( = ?auto_2195721 ?auto_2195733 ) ) ( not ( = ?auto_2195721 ?auto_2195734 ) ) ( not ( = ?auto_2195721 ?auto_2195735 ) ) ( not ( = ?auto_2195721 ?auto_2195741 ) ) ( not ( = ?auto_2195725 ?auto_2195727 ) ) ( not ( = ?auto_2195725 ?auto_2195726 ) ) ( not ( = ?auto_2195725 ?auto_2195728 ) ) ( not ( = ?auto_2195725 ?auto_2195729 ) ) ( not ( = ?auto_2195725 ?auto_2195730 ) ) ( not ( = ?auto_2195725 ?auto_2195731 ) ) ( not ( = ?auto_2195725 ?auto_2195732 ) ) ( not ( = ?auto_2195725 ?auto_2195733 ) ) ( not ( = ?auto_2195725 ?auto_2195734 ) ) ( not ( = ?auto_2195725 ?auto_2195735 ) ) ( not ( = ?auto_2195725 ?auto_2195741 ) ) ( not ( = ?auto_2195727 ?auto_2195726 ) ) ( not ( = ?auto_2195727 ?auto_2195728 ) ) ( not ( = ?auto_2195727 ?auto_2195729 ) ) ( not ( = ?auto_2195727 ?auto_2195730 ) ) ( not ( = ?auto_2195727 ?auto_2195731 ) ) ( not ( = ?auto_2195727 ?auto_2195732 ) ) ( not ( = ?auto_2195727 ?auto_2195733 ) ) ( not ( = ?auto_2195727 ?auto_2195734 ) ) ( not ( = ?auto_2195727 ?auto_2195735 ) ) ( not ( = ?auto_2195727 ?auto_2195741 ) ) ( not ( = ?auto_2195726 ?auto_2195728 ) ) ( not ( = ?auto_2195726 ?auto_2195729 ) ) ( not ( = ?auto_2195726 ?auto_2195730 ) ) ( not ( = ?auto_2195726 ?auto_2195731 ) ) ( not ( = ?auto_2195726 ?auto_2195732 ) ) ( not ( = ?auto_2195726 ?auto_2195733 ) ) ( not ( = ?auto_2195726 ?auto_2195734 ) ) ( not ( = ?auto_2195726 ?auto_2195735 ) ) ( not ( = ?auto_2195726 ?auto_2195741 ) ) ( not ( = ?auto_2195728 ?auto_2195729 ) ) ( not ( = ?auto_2195728 ?auto_2195730 ) ) ( not ( = ?auto_2195728 ?auto_2195731 ) ) ( not ( = ?auto_2195728 ?auto_2195732 ) ) ( not ( = ?auto_2195728 ?auto_2195733 ) ) ( not ( = ?auto_2195728 ?auto_2195734 ) ) ( not ( = ?auto_2195728 ?auto_2195735 ) ) ( not ( = ?auto_2195728 ?auto_2195741 ) ) ( not ( = ?auto_2195729 ?auto_2195730 ) ) ( not ( = ?auto_2195729 ?auto_2195731 ) ) ( not ( = ?auto_2195729 ?auto_2195732 ) ) ( not ( = ?auto_2195729 ?auto_2195733 ) ) ( not ( = ?auto_2195729 ?auto_2195734 ) ) ( not ( = ?auto_2195729 ?auto_2195735 ) ) ( not ( = ?auto_2195729 ?auto_2195741 ) ) ( not ( = ?auto_2195730 ?auto_2195731 ) ) ( not ( = ?auto_2195730 ?auto_2195732 ) ) ( not ( = ?auto_2195730 ?auto_2195733 ) ) ( not ( = ?auto_2195730 ?auto_2195734 ) ) ( not ( = ?auto_2195730 ?auto_2195735 ) ) ( not ( = ?auto_2195730 ?auto_2195741 ) ) ( not ( = ?auto_2195731 ?auto_2195732 ) ) ( not ( = ?auto_2195731 ?auto_2195733 ) ) ( not ( = ?auto_2195731 ?auto_2195734 ) ) ( not ( = ?auto_2195731 ?auto_2195735 ) ) ( not ( = ?auto_2195731 ?auto_2195741 ) ) ( not ( = ?auto_2195732 ?auto_2195733 ) ) ( not ( = ?auto_2195732 ?auto_2195734 ) ) ( not ( = ?auto_2195732 ?auto_2195735 ) ) ( not ( = ?auto_2195732 ?auto_2195741 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2195733 ?auto_2195734 ?auto_2195735 )
      ( MAKE-14CRATE-VERIFY ?auto_2195722 ?auto_2195723 ?auto_2195724 ?auto_2195721 ?auto_2195725 ?auto_2195727 ?auto_2195726 ?auto_2195728 ?auto_2195729 ?auto_2195730 ?auto_2195731 ?auto_2195732 ?auto_2195733 ?auto_2195734 ?auto_2195735 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_2195926 - SURFACE
      ?auto_2195927 - SURFACE
      ?auto_2195928 - SURFACE
      ?auto_2195925 - SURFACE
      ?auto_2195929 - SURFACE
      ?auto_2195931 - SURFACE
      ?auto_2195930 - SURFACE
      ?auto_2195932 - SURFACE
      ?auto_2195933 - SURFACE
      ?auto_2195934 - SURFACE
      ?auto_2195935 - SURFACE
      ?auto_2195936 - SURFACE
      ?auto_2195937 - SURFACE
      ?auto_2195938 - SURFACE
      ?auto_2195939 - SURFACE
    )
    :vars
    (
      ?auto_2195945 - HOIST
      ?auto_2195941 - PLACE
      ?auto_2195940 - PLACE
      ?auto_2195943 - HOIST
      ?auto_2195942 - SURFACE
      ?auto_2195944 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2195945 ?auto_2195941 ) ( IS-CRATE ?auto_2195939 ) ( not ( = ?auto_2195938 ?auto_2195939 ) ) ( not ( = ?auto_2195937 ?auto_2195938 ) ) ( not ( = ?auto_2195937 ?auto_2195939 ) ) ( not ( = ?auto_2195940 ?auto_2195941 ) ) ( HOIST-AT ?auto_2195943 ?auto_2195940 ) ( not ( = ?auto_2195945 ?auto_2195943 ) ) ( AVAILABLE ?auto_2195943 ) ( SURFACE-AT ?auto_2195939 ?auto_2195940 ) ( ON ?auto_2195939 ?auto_2195942 ) ( CLEAR ?auto_2195939 ) ( not ( = ?auto_2195938 ?auto_2195942 ) ) ( not ( = ?auto_2195939 ?auto_2195942 ) ) ( not ( = ?auto_2195937 ?auto_2195942 ) ) ( TRUCK-AT ?auto_2195944 ?auto_2195941 ) ( SURFACE-AT ?auto_2195937 ?auto_2195941 ) ( CLEAR ?auto_2195937 ) ( IS-CRATE ?auto_2195938 ) ( AVAILABLE ?auto_2195945 ) ( IN ?auto_2195938 ?auto_2195944 ) ( ON ?auto_2195927 ?auto_2195926 ) ( ON ?auto_2195928 ?auto_2195927 ) ( ON ?auto_2195925 ?auto_2195928 ) ( ON ?auto_2195929 ?auto_2195925 ) ( ON ?auto_2195931 ?auto_2195929 ) ( ON ?auto_2195930 ?auto_2195931 ) ( ON ?auto_2195932 ?auto_2195930 ) ( ON ?auto_2195933 ?auto_2195932 ) ( ON ?auto_2195934 ?auto_2195933 ) ( ON ?auto_2195935 ?auto_2195934 ) ( ON ?auto_2195936 ?auto_2195935 ) ( ON ?auto_2195937 ?auto_2195936 ) ( not ( = ?auto_2195926 ?auto_2195927 ) ) ( not ( = ?auto_2195926 ?auto_2195928 ) ) ( not ( = ?auto_2195926 ?auto_2195925 ) ) ( not ( = ?auto_2195926 ?auto_2195929 ) ) ( not ( = ?auto_2195926 ?auto_2195931 ) ) ( not ( = ?auto_2195926 ?auto_2195930 ) ) ( not ( = ?auto_2195926 ?auto_2195932 ) ) ( not ( = ?auto_2195926 ?auto_2195933 ) ) ( not ( = ?auto_2195926 ?auto_2195934 ) ) ( not ( = ?auto_2195926 ?auto_2195935 ) ) ( not ( = ?auto_2195926 ?auto_2195936 ) ) ( not ( = ?auto_2195926 ?auto_2195937 ) ) ( not ( = ?auto_2195926 ?auto_2195938 ) ) ( not ( = ?auto_2195926 ?auto_2195939 ) ) ( not ( = ?auto_2195926 ?auto_2195942 ) ) ( not ( = ?auto_2195927 ?auto_2195928 ) ) ( not ( = ?auto_2195927 ?auto_2195925 ) ) ( not ( = ?auto_2195927 ?auto_2195929 ) ) ( not ( = ?auto_2195927 ?auto_2195931 ) ) ( not ( = ?auto_2195927 ?auto_2195930 ) ) ( not ( = ?auto_2195927 ?auto_2195932 ) ) ( not ( = ?auto_2195927 ?auto_2195933 ) ) ( not ( = ?auto_2195927 ?auto_2195934 ) ) ( not ( = ?auto_2195927 ?auto_2195935 ) ) ( not ( = ?auto_2195927 ?auto_2195936 ) ) ( not ( = ?auto_2195927 ?auto_2195937 ) ) ( not ( = ?auto_2195927 ?auto_2195938 ) ) ( not ( = ?auto_2195927 ?auto_2195939 ) ) ( not ( = ?auto_2195927 ?auto_2195942 ) ) ( not ( = ?auto_2195928 ?auto_2195925 ) ) ( not ( = ?auto_2195928 ?auto_2195929 ) ) ( not ( = ?auto_2195928 ?auto_2195931 ) ) ( not ( = ?auto_2195928 ?auto_2195930 ) ) ( not ( = ?auto_2195928 ?auto_2195932 ) ) ( not ( = ?auto_2195928 ?auto_2195933 ) ) ( not ( = ?auto_2195928 ?auto_2195934 ) ) ( not ( = ?auto_2195928 ?auto_2195935 ) ) ( not ( = ?auto_2195928 ?auto_2195936 ) ) ( not ( = ?auto_2195928 ?auto_2195937 ) ) ( not ( = ?auto_2195928 ?auto_2195938 ) ) ( not ( = ?auto_2195928 ?auto_2195939 ) ) ( not ( = ?auto_2195928 ?auto_2195942 ) ) ( not ( = ?auto_2195925 ?auto_2195929 ) ) ( not ( = ?auto_2195925 ?auto_2195931 ) ) ( not ( = ?auto_2195925 ?auto_2195930 ) ) ( not ( = ?auto_2195925 ?auto_2195932 ) ) ( not ( = ?auto_2195925 ?auto_2195933 ) ) ( not ( = ?auto_2195925 ?auto_2195934 ) ) ( not ( = ?auto_2195925 ?auto_2195935 ) ) ( not ( = ?auto_2195925 ?auto_2195936 ) ) ( not ( = ?auto_2195925 ?auto_2195937 ) ) ( not ( = ?auto_2195925 ?auto_2195938 ) ) ( not ( = ?auto_2195925 ?auto_2195939 ) ) ( not ( = ?auto_2195925 ?auto_2195942 ) ) ( not ( = ?auto_2195929 ?auto_2195931 ) ) ( not ( = ?auto_2195929 ?auto_2195930 ) ) ( not ( = ?auto_2195929 ?auto_2195932 ) ) ( not ( = ?auto_2195929 ?auto_2195933 ) ) ( not ( = ?auto_2195929 ?auto_2195934 ) ) ( not ( = ?auto_2195929 ?auto_2195935 ) ) ( not ( = ?auto_2195929 ?auto_2195936 ) ) ( not ( = ?auto_2195929 ?auto_2195937 ) ) ( not ( = ?auto_2195929 ?auto_2195938 ) ) ( not ( = ?auto_2195929 ?auto_2195939 ) ) ( not ( = ?auto_2195929 ?auto_2195942 ) ) ( not ( = ?auto_2195931 ?auto_2195930 ) ) ( not ( = ?auto_2195931 ?auto_2195932 ) ) ( not ( = ?auto_2195931 ?auto_2195933 ) ) ( not ( = ?auto_2195931 ?auto_2195934 ) ) ( not ( = ?auto_2195931 ?auto_2195935 ) ) ( not ( = ?auto_2195931 ?auto_2195936 ) ) ( not ( = ?auto_2195931 ?auto_2195937 ) ) ( not ( = ?auto_2195931 ?auto_2195938 ) ) ( not ( = ?auto_2195931 ?auto_2195939 ) ) ( not ( = ?auto_2195931 ?auto_2195942 ) ) ( not ( = ?auto_2195930 ?auto_2195932 ) ) ( not ( = ?auto_2195930 ?auto_2195933 ) ) ( not ( = ?auto_2195930 ?auto_2195934 ) ) ( not ( = ?auto_2195930 ?auto_2195935 ) ) ( not ( = ?auto_2195930 ?auto_2195936 ) ) ( not ( = ?auto_2195930 ?auto_2195937 ) ) ( not ( = ?auto_2195930 ?auto_2195938 ) ) ( not ( = ?auto_2195930 ?auto_2195939 ) ) ( not ( = ?auto_2195930 ?auto_2195942 ) ) ( not ( = ?auto_2195932 ?auto_2195933 ) ) ( not ( = ?auto_2195932 ?auto_2195934 ) ) ( not ( = ?auto_2195932 ?auto_2195935 ) ) ( not ( = ?auto_2195932 ?auto_2195936 ) ) ( not ( = ?auto_2195932 ?auto_2195937 ) ) ( not ( = ?auto_2195932 ?auto_2195938 ) ) ( not ( = ?auto_2195932 ?auto_2195939 ) ) ( not ( = ?auto_2195932 ?auto_2195942 ) ) ( not ( = ?auto_2195933 ?auto_2195934 ) ) ( not ( = ?auto_2195933 ?auto_2195935 ) ) ( not ( = ?auto_2195933 ?auto_2195936 ) ) ( not ( = ?auto_2195933 ?auto_2195937 ) ) ( not ( = ?auto_2195933 ?auto_2195938 ) ) ( not ( = ?auto_2195933 ?auto_2195939 ) ) ( not ( = ?auto_2195933 ?auto_2195942 ) ) ( not ( = ?auto_2195934 ?auto_2195935 ) ) ( not ( = ?auto_2195934 ?auto_2195936 ) ) ( not ( = ?auto_2195934 ?auto_2195937 ) ) ( not ( = ?auto_2195934 ?auto_2195938 ) ) ( not ( = ?auto_2195934 ?auto_2195939 ) ) ( not ( = ?auto_2195934 ?auto_2195942 ) ) ( not ( = ?auto_2195935 ?auto_2195936 ) ) ( not ( = ?auto_2195935 ?auto_2195937 ) ) ( not ( = ?auto_2195935 ?auto_2195938 ) ) ( not ( = ?auto_2195935 ?auto_2195939 ) ) ( not ( = ?auto_2195935 ?auto_2195942 ) ) ( not ( = ?auto_2195936 ?auto_2195937 ) ) ( not ( = ?auto_2195936 ?auto_2195938 ) ) ( not ( = ?auto_2195936 ?auto_2195939 ) ) ( not ( = ?auto_2195936 ?auto_2195942 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2195937 ?auto_2195938 ?auto_2195939 )
      ( MAKE-14CRATE-VERIFY ?auto_2195926 ?auto_2195927 ?auto_2195928 ?auto_2195925 ?auto_2195929 ?auto_2195931 ?auto_2195930 ?auto_2195932 ?auto_2195933 ?auto_2195934 ?auto_2195935 ?auto_2195936 ?auto_2195937 ?auto_2195938 ?auto_2195939 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2213146 - SURFACE
      ?auto_2213147 - SURFACE
      ?auto_2213148 - SURFACE
      ?auto_2213145 - SURFACE
      ?auto_2213149 - SURFACE
      ?auto_2213151 - SURFACE
      ?auto_2213150 - SURFACE
      ?auto_2213152 - SURFACE
      ?auto_2213153 - SURFACE
      ?auto_2213154 - SURFACE
      ?auto_2213155 - SURFACE
      ?auto_2213156 - SURFACE
      ?auto_2213157 - SURFACE
      ?auto_2213158 - SURFACE
      ?auto_2213159 - SURFACE
      ?auto_2213160 - SURFACE
    )
    :vars
    (
      ?auto_2213162 - HOIST
      ?auto_2213161 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2213162 ?auto_2213161 ) ( SURFACE-AT ?auto_2213159 ?auto_2213161 ) ( CLEAR ?auto_2213159 ) ( LIFTING ?auto_2213162 ?auto_2213160 ) ( IS-CRATE ?auto_2213160 ) ( not ( = ?auto_2213159 ?auto_2213160 ) ) ( ON ?auto_2213147 ?auto_2213146 ) ( ON ?auto_2213148 ?auto_2213147 ) ( ON ?auto_2213145 ?auto_2213148 ) ( ON ?auto_2213149 ?auto_2213145 ) ( ON ?auto_2213151 ?auto_2213149 ) ( ON ?auto_2213150 ?auto_2213151 ) ( ON ?auto_2213152 ?auto_2213150 ) ( ON ?auto_2213153 ?auto_2213152 ) ( ON ?auto_2213154 ?auto_2213153 ) ( ON ?auto_2213155 ?auto_2213154 ) ( ON ?auto_2213156 ?auto_2213155 ) ( ON ?auto_2213157 ?auto_2213156 ) ( ON ?auto_2213158 ?auto_2213157 ) ( ON ?auto_2213159 ?auto_2213158 ) ( not ( = ?auto_2213146 ?auto_2213147 ) ) ( not ( = ?auto_2213146 ?auto_2213148 ) ) ( not ( = ?auto_2213146 ?auto_2213145 ) ) ( not ( = ?auto_2213146 ?auto_2213149 ) ) ( not ( = ?auto_2213146 ?auto_2213151 ) ) ( not ( = ?auto_2213146 ?auto_2213150 ) ) ( not ( = ?auto_2213146 ?auto_2213152 ) ) ( not ( = ?auto_2213146 ?auto_2213153 ) ) ( not ( = ?auto_2213146 ?auto_2213154 ) ) ( not ( = ?auto_2213146 ?auto_2213155 ) ) ( not ( = ?auto_2213146 ?auto_2213156 ) ) ( not ( = ?auto_2213146 ?auto_2213157 ) ) ( not ( = ?auto_2213146 ?auto_2213158 ) ) ( not ( = ?auto_2213146 ?auto_2213159 ) ) ( not ( = ?auto_2213146 ?auto_2213160 ) ) ( not ( = ?auto_2213147 ?auto_2213148 ) ) ( not ( = ?auto_2213147 ?auto_2213145 ) ) ( not ( = ?auto_2213147 ?auto_2213149 ) ) ( not ( = ?auto_2213147 ?auto_2213151 ) ) ( not ( = ?auto_2213147 ?auto_2213150 ) ) ( not ( = ?auto_2213147 ?auto_2213152 ) ) ( not ( = ?auto_2213147 ?auto_2213153 ) ) ( not ( = ?auto_2213147 ?auto_2213154 ) ) ( not ( = ?auto_2213147 ?auto_2213155 ) ) ( not ( = ?auto_2213147 ?auto_2213156 ) ) ( not ( = ?auto_2213147 ?auto_2213157 ) ) ( not ( = ?auto_2213147 ?auto_2213158 ) ) ( not ( = ?auto_2213147 ?auto_2213159 ) ) ( not ( = ?auto_2213147 ?auto_2213160 ) ) ( not ( = ?auto_2213148 ?auto_2213145 ) ) ( not ( = ?auto_2213148 ?auto_2213149 ) ) ( not ( = ?auto_2213148 ?auto_2213151 ) ) ( not ( = ?auto_2213148 ?auto_2213150 ) ) ( not ( = ?auto_2213148 ?auto_2213152 ) ) ( not ( = ?auto_2213148 ?auto_2213153 ) ) ( not ( = ?auto_2213148 ?auto_2213154 ) ) ( not ( = ?auto_2213148 ?auto_2213155 ) ) ( not ( = ?auto_2213148 ?auto_2213156 ) ) ( not ( = ?auto_2213148 ?auto_2213157 ) ) ( not ( = ?auto_2213148 ?auto_2213158 ) ) ( not ( = ?auto_2213148 ?auto_2213159 ) ) ( not ( = ?auto_2213148 ?auto_2213160 ) ) ( not ( = ?auto_2213145 ?auto_2213149 ) ) ( not ( = ?auto_2213145 ?auto_2213151 ) ) ( not ( = ?auto_2213145 ?auto_2213150 ) ) ( not ( = ?auto_2213145 ?auto_2213152 ) ) ( not ( = ?auto_2213145 ?auto_2213153 ) ) ( not ( = ?auto_2213145 ?auto_2213154 ) ) ( not ( = ?auto_2213145 ?auto_2213155 ) ) ( not ( = ?auto_2213145 ?auto_2213156 ) ) ( not ( = ?auto_2213145 ?auto_2213157 ) ) ( not ( = ?auto_2213145 ?auto_2213158 ) ) ( not ( = ?auto_2213145 ?auto_2213159 ) ) ( not ( = ?auto_2213145 ?auto_2213160 ) ) ( not ( = ?auto_2213149 ?auto_2213151 ) ) ( not ( = ?auto_2213149 ?auto_2213150 ) ) ( not ( = ?auto_2213149 ?auto_2213152 ) ) ( not ( = ?auto_2213149 ?auto_2213153 ) ) ( not ( = ?auto_2213149 ?auto_2213154 ) ) ( not ( = ?auto_2213149 ?auto_2213155 ) ) ( not ( = ?auto_2213149 ?auto_2213156 ) ) ( not ( = ?auto_2213149 ?auto_2213157 ) ) ( not ( = ?auto_2213149 ?auto_2213158 ) ) ( not ( = ?auto_2213149 ?auto_2213159 ) ) ( not ( = ?auto_2213149 ?auto_2213160 ) ) ( not ( = ?auto_2213151 ?auto_2213150 ) ) ( not ( = ?auto_2213151 ?auto_2213152 ) ) ( not ( = ?auto_2213151 ?auto_2213153 ) ) ( not ( = ?auto_2213151 ?auto_2213154 ) ) ( not ( = ?auto_2213151 ?auto_2213155 ) ) ( not ( = ?auto_2213151 ?auto_2213156 ) ) ( not ( = ?auto_2213151 ?auto_2213157 ) ) ( not ( = ?auto_2213151 ?auto_2213158 ) ) ( not ( = ?auto_2213151 ?auto_2213159 ) ) ( not ( = ?auto_2213151 ?auto_2213160 ) ) ( not ( = ?auto_2213150 ?auto_2213152 ) ) ( not ( = ?auto_2213150 ?auto_2213153 ) ) ( not ( = ?auto_2213150 ?auto_2213154 ) ) ( not ( = ?auto_2213150 ?auto_2213155 ) ) ( not ( = ?auto_2213150 ?auto_2213156 ) ) ( not ( = ?auto_2213150 ?auto_2213157 ) ) ( not ( = ?auto_2213150 ?auto_2213158 ) ) ( not ( = ?auto_2213150 ?auto_2213159 ) ) ( not ( = ?auto_2213150 ?auto_2213160 ) ) ( not ( = ?auto_2213152 ?auto_2213153 ) ) ( not ( = ?auto_2213152 ?auto_2213154 ) ) ( not ( = ?auto_2213152 ?auto_2213155 ) ) ( not ( = ?auto_2213152 ?auto_2213156 ) ) ( not ( = ?auto_2213152 ?auto_2213157 ) ) ( not ( = ?auto_2213152 ?auto_2213158 ) ) ( not ( = ?auto_2213152 ?auto_2213159 ) ) ( not ( = ?auto_2213152 ?auto_2213160 ) ) ( not ( = ?auto_2213153 ?auto_2213154 ) ) ( not ( = ?auto_2213153 ?auto_2213155 ) ) ( not ( = ?auto_2213153 ?auto_2213156 ) ) ( not ( = ?auto_2213153 ?auto_2213157 ) ) ( not ( = ?auto_2213153 ?auto_2213158 ) ) ( not ( = ?auto_2213153 ?auto_2213159 ) ) ( not ( = ?auto_2213153 ?auto_2213160 ) ) ( not ( = ?auto_2213154 ?auto_2213155 ) ) ( not ( = ?auto_2213154 ?auto_2213156 ) ) ( not ( = ?auto_2213154 ?auto_2213157 ) ) ( not ( = ?auto_2213154 ?auto_2213158 ) ) ( not ( = ?auto_2213154 ?auto_2213159 ) ) ( not ( = ?auto_2213154 ?auto_2213160 ) ) ( not ( = ?auto_2213155 ?auto_2213156 ) ) ( not ( = ?auto_2213155 ?auto_2213157 ) ) ( not ( = ?auto_2213155 ?auto_2213158 ) ) ( not ( = ?auto_2213155 ?auto_2213159 ) ) ( not ( = ?auto_2213155 ?auto_2213160 ) ) ( not ( = ?auto_2213156 ?auto_2213157 ) ) ( not ( = ?auto_2213156 ?auto_2213158 ) ) ( not ( = ?auto_2213156 ?auto_2213159 ) ) ( not ( = ?auto_2213156 ?auto_2213160 ) ) ( not ( = ?auto_2213157 ?auto_2213158 ) ) ( not ( = ?auto_2213157 ?auto_2213159 ) ) ( not ( = ?auto_2213157 ?auto_2213160 ) ) ( not ( = ?auto_2213158 ?auto_2213159 ) ) ( not ( = ?auto_2213158 ?auto_2213160 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2213159 ?auto_2213160 )
      ( MAKE-15CRATE-VERIFY ?auto_2213146 ?auto_2213147 ?auto_2213148 ?auto_2213145 ?auto_2213149 ?auto_2213151 ?auto_2213150 ?auto_2213152 ?auto_2213153 ?auto_2213154 ?auto_2213155 ?auto_2213156 ?auto_2213157 ?auto_2213158 ?auto_2213159 ?auto_2213160 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2213325 - SURFACE
      ?auto_2213326 - SURFACE
      ?auto_2213327 - SURFACE
      ?auto_2213324 - SURFACE
      ?auto_2213328 - SURFACE
      ?auto_2213330 - SURFACE
      ?auto_2213329 - SURFACE
      ?auto_2213331 - SURFACE
      ?auto_2213332 - SURFACE
      ?auto_2213333 - SURFACE
      ?auto_2213334 - SURFACE
      ?auto_2213335 - SURFACE
      ?auto_2213336 - SURFACE
      ?auto_2213337 - SURFACE
      ?auto_2213338 - SURFACE
      ?auto_2213339 - SURFACE
    )
    :vars
    (
      ?auto_2213341 - HOIST
      ?auto_2213342 - PLACE
      ?auto_2213340 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2213341 ?auto_2213342 ) ( SURFACE-AT ?auto_2213338 ?auto_2213342 ) ( CLEAR ?auto_2213338 ) ( IS-CRATE ?auto_2213339 ) ( not ( = ?auto_2213338 ?auto_2213339 ) ) ( TRUCK-AT ?auto_2213340 ?auto_2213342 ) ( AVAILABLE ?auto_2213341 ) ( IN ?auto_2213339 ?auto_2213340 ) ( ON ?auto_2213338 ?auto_2213337 ) ( not ( = ?auto_2213337 ?auto_2213338 ) ) ( not ( = ?auto_2213337 ?auto_2213339 ) ) ( ON ?auto_2213326 ?auto_2213325 ) ( ON ?auto_2213327 ?auto_2213326 ) ( ON ?auto_2213324 ?auto_2213327 ) ( ON ?auto_2213328 ?auto_2213324 ) ( ON ?auto_2213330 ?auto_2213328 ) ( ON ?auto_2213329 ?auto_2213330 ) ( ON ?auto_2213331 ?auto_2213329 ) ( ON ?auto_2213332 ?auto_2213331 ) ( ON ?auto_2213333 ?auto_2213332 ) ( ON ?auto_2213334 ?auto_2213333 ) ( ON ?auto_2213335 ?auto_2213334 ) ( ON ?auto_2213336 ?auto_2213335 ) ( ON ?auto_2213337 ?auto_2213336 ) ( not ( = ?auto_2213325 ?auto_2213326 ) ) ( not ( = ?auto_2213325 ?auto_2213327 ) ) ( not ( = ?auto_2213325 ?auto_2213324 ) ) ( not ( = ?auto_2213325 ?auto_2213328 ) ) ( not ( = ?auto_2213325 ?auto_2213330 ) ) ( not ( = ?auto_2213325 ?auto_2213329 ) ) ( not ( = ?auto_2213325 ?auto_2213331 ) ) ( not ( = ?auto_2213325 ?auto_2213332 ) ) ( not ( = ?auto_2213325 ?auto_2213333 ) ) ( not ( = ?auto_2213325 ?auto_2213334 ) ) ( not ( = ?auto_2213325 ?auto_2213335 ) ) ( not ( = ?auto_2213325 ?auto_2213336 ) ) ( not ( = ?auto_2213325 ?auto_2213337 ) ) ( not ( = ?auto_2213325 ?auto_2213338 ) ) ( not ( = ?auto_2213325 ?auto_2213339 ) ) ( not ( = ?auto_2213326 ?auto_2213327 ) ) ( not ( = ?auto_2213326 ?auto_2213324 ) ) ( not ( = ?auto_2213326 ?auto_2213328 ) ) ( not ( = ?auto_2213326 ?auto_2213330 ) ) ( not ( = ?auto_2213326 ?auto_2213329 ) ) ( not ( = ?auto_2213326 ?auto_2213331 ) ) ( not ( = ?auto_2213326 ?auto_2213332 ) ) ( not ( = ?auto_2213326 ?auto_2213333 ) ) ( not ( = ?auto_2213326 ?auto_2213334 ) ) ( not ( = ?auto_2213326 ?auto_2213335 ) ) ( not ( = ?auto_2213326 ?auto_2213336 ) ) ( not ( = ?auto_2213326 ?auto_2213337 ) ) ( not ( = ?auto_2213326 ?auto_2213338 ) ) ( not ( = ?auto_2213326 ?auto_2213339 ) ) ( not ( = ?auto_2213327 ?auto_2213324 ) ) ( not ( = ?auto_2213327 ?auto_2213328 ) ) ( not ( = ?auto_2213327 ?auto_2213330 ) ) ( not ( = ?auto_2213327 ?auto_2213329 ) ) ( not ( = ?auto_2213327 ?auto_2213331 ) ) ( not ( = ?auto_2213327 ?auto_2213332 ) ) ( not ( = ?auto_2213327 ?auto_2213333 ) ) ( not ( = ?auto_2213327 ?auto_2213334 ) ) ( not ( = ?auto_2213327 ?auto_2213335 ) ) ( not ( = ?auto_2213327 ?auto_2213336 ) ) ( not ( = ?auto_2213327 ?auto_2213337 ) ) ( not ( = ?auto_2213327 ?auto_2213338 ) ) ( not ( = ?auto_2213327 ?auto_2213339 ) ) ( not ( = ?auto_2213324 ?auto_2213328 ) ) ( not ( = ?auto_2213324 ?auto_2213330 ) ) ( not ( = ?auto_2213324 ?auto_2213329 ) ) ( not ( = ?auto_2213324 ?auto_2213331 ) ) ( not ( = ?auto_2213324 ?auto_2213332 ) ) ( not ( = ?auto_2213324 ?auto_2213333 ) ) ( not ( = ?auto_2213324 ?auto_2213334 ) ) ( not ( = ?auto_2213324 ?auto_2213335 ) ) ( not ( = ?auto_2213324 ?auto_2213336 ) ) ( not ( = ?auto_2213324 ?auto_2213337 ) ) ( not ( = ?auto_2213324 ?auto_2213338 ) ) ( not ( = ?auto_2213324 ?auto_2213339 ) ) ( not ( = ?auto_2213328 ?auto_2213330 ) ) ( not ( = ?auto_2213328 ?auto_2213329 ) ) ( not ( = ?auto_2213328 ?auto_2213331 ) ) ( not ( = ?auto_2213328 ?auto_2213332 ) ) ( not ( = ?auto_2213328 ?auto_2213333 ) ) ( not ( = ?auto_2213328 ?auto_2213334 ) ) ( not ( = ?auto_2213328 ?auto_2213335 ) ) ( not ( = ?auto_2213328 ?auto_2213336 ) ) ( not ( = ?auto_2213328 ?auto_2213337 ) ) ( not ( = ?auto_2213328 ?auto_2213338 ) ) ( not ( = ?auto_2213328 ?auto_2213339 ) ) ( not ( = ?auto_2213330 ?auto_2213329 ) ) ( not ( = ?auto_2213330 ?auto_2213331 ) ) ( not ( = ?auto_2213330 ?auto_2213332 ) ) ( not ( = ?auto_2213330 ?auto_2213333 ) ) ( not ( = ?auto_2213330 ?auto_2213334 ) ) ( not ( = ?auto_2213330 ?auto_2213335 ) ) ( not ( = ?auto_2213330 ?auto_2213336 ) ) ( not ( = ?auto_2213330 ?auto_2213337 ) ) ( not ( = ?auto_2213330 ?auto_2213338 ) ) ( not ( = ?auto_2213330 ?auto_2213339 ) ) ( not ( = ?auto_2213329 ?auto_2213331 ) ) ( not ( = ?auto_2213329 ?auto_2213332 ) ) ( not ( = ?auto_2213329 ?auto_2213333 ) ) ( not ( = ?auto_2213329 ?auto_2213334 ) ) ( not ( = ?auto_2213329 ?auto_2213335 ) ) ( not ( = ?auto_2213329 ?auto_2213336 ) ) ( not ( = ?auto_2213329 ?auto_2213337 ) ) ( not ( = ?auto_2213329 ?auto_2213338 ) ) ( not ( = ?auto_2213329 ?auto_2213339 ) ) ( not ( = ?auto_2213331 ?auto_2213332 ) ) ( not ( = ?auto_2213331 ?auto_2213333 ) ) ( not ( = ?auto_2213331 ?auto_2213334 ) ) ( not ( = ?auto_2213331 ?auto_2213335 ) ) ( not ( = ?auto_2213331 ?auto_2213336 ) ) ( not ( = ?auto_2213331 ?auto_2213337 ) ) ( not ( = ?auto_2213331 ?auto_2213338 ) ) ( not ( = ?auto_2213331 ?auto_2213339 ) ) ( not ( = ?auto_2213332 ?auto_2213333 ) ) ( not ( = ?auto_2213332 ?auto_2213334 ) ) ( not ( = ?auto_2213332 ?auto_2213335 ) ) ( not ( = ?auto_2213332 ?auto_2213336 ) ) ( not ( = ?auto_2213332 ?auto_2213337 ) ) ( not ( = ?auto_2213332 ?auto_2213338 ) ) ( not ( = ?auto_2213332 ?auto_2213339 ) ) ( not ( = ?auto_2213333 ?auto_2213334 ) ) ( not ( = ?auto_2213333 ?auto_2213335 ) ) ( not ( = ?auto_2213333 ?auto_2213336 ) ) ( not ( = ?auto_2213333 ?auto_2213337 ) ) ( not ( = ?auto_2213333 ?auto_2213338 ) ) ( not ( = ?auto_2213333 ?auto_2213339 ) ) ( not ( = ?auto_2213334 ?auto_2213335 ) ) ( not ( = ?auto_2213334 ?auto_2213336 ) ) ( not ( = ?auto_2213334 ?auto_2213337 ) ) ( not ( = ?auto_2213334 ?auto_2213338 ) ) ( not ( = ?auto_2213334 ?auto_2213339 ) ) ( not ( = ?auto_2213335 ?auto_2213336 ) ) ( not ( = ?auto_2213335 ?auto_2213337 ) ) ( not ( = ?auto_2213335 ?auto_2213338 ) ) ( not ( = ?auto_2213335 ?auto_2213339 ) ) ( not ( = ?auto_2213336 ?auto_2213337 ) ) ( not ( = ?auto_2213336 ?auto_2213338 ) ) ( not ( = ?auto_2213336 ?auto_2213339 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2213337 ?auto_2213338 ?auto_2213339 )
      ( MAKE-15CRATE-VERIFY ?auto_2213325 ?auto_2213326 ?auto_2213327 ?auto_2213324 ?auto_2213328 ?auto_2213330 ?auto_2213329 ?auto_2213331 ?auto_2213332 ?auto_2213333 ?auto_2213334 ?auto_2213335 ?auto_2213336 ?auto_2213337 ?auto_2213338 ?auto_2213339 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2213520 - SURFACE
      ?auto_2213521 - SURFACE
      ?auto_2213522 - SURFACE
      ?auto_2213519 - SURFACE
      ?auto_2213523 - SURFACE
      ?auto_2213525 - SURFACE
      ?auto_2213524 - SURFACE
      ?auto_2213526 - SURFACE
      ?auto_2213527 - SURFACE
      ?auto_2213528 - SURFACE
      ?auto_2213529 - SURFACE
      ?auto_2213530 - SURFACE
      ?auto_2213531 - SURFACE
      ?auto_2213532 - SURFACE
      ?auto_2213533 - SURFACE
      ?auto_2213534 - SURFACE
    )
    :vars
    (
      ?auto_2213536 - HOIST
      ?auto_2213535 - PLACE
      ?auto_2213538 - TRUCK
      ?auto_2213537 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2213536 ?auto_2213535 ) ( SURFACE-AT ?auto_2213533 ?auto_2213535 ) ( CLEAR ?auto_2213533 ) ( IS-CRATE ?auto_2213534 ) ( not ( = ?auto_2213533 ?auto_2213534 ) ) ( AVAILABLE ?auto_2213536 ) ( IN ?auto_2213534 ?auto_2213538 ) ( ON ?auto_2213533 ?auto_2213532 ) ( not ( = ?auto_2213532 ?auto_2213533 ) ) ( not ( = ?auto_2213532 ?auto_2213534 ) ) ( TRUCK-AT ?auto_2213538 ?auto_2213537 ) ( not ( = ?auto_2213537 ?auto_2213535 ) ) ( ON ?auto_2213521 ?auto_2213520 ) ( ON ?auto_2213522 ?auto_2213521 ) ( ON ?auto_2213519 ?auto_2213522 ) ( ON ?auto_2213523 ?auto_2213519 ) ( ON ?auto_2213525 ?auto_2213523 ) ( ON ?auto_2213524 ?auto_2213525 ) ( ON ?auto_2213526 ?auto_2213524 ) ( ON ?auto_2213527 ?auto_2213526 ) ( ON ?auto_2213528 ?auto_2213527 ) ( ON ?auto_2213529 ?auto_2213528 ) ( ON ?auto_2213530 ?auto_2213529 ) ( ON ?auto_2213531 ?auto_2213530 ) ( ON ?auto_2213532 ?auto_2213531 ) ( not ( = ?auto_2213520 ?auto_2213521 ) ) ( not ( = ?auto_2213520 ?auto_2213522 ) ) ( not ( = ?auto_2213520 ?auto_2213519 ) ) ( not ( = ?auto_2213520 ?auto_2213523 ) ) ( not ( = ?auto_2213520 ?auto_2213525 ) ) ( not ( = ?auto_2213520 ?auto_2213524 ) ) ( not ( = ?auto_2213520 ?auto_2213526 ) ) ( not ( = ?auto_2213520 ?auto_2213527 ) ) ( not ( = ?auto_2213520 ?auto_2213528 ) ) ( not ( = ?auto_2213520 ?auto_2213529 ) ) ( not ( = ?auto_2213520 ?auto_2213530 ) ) ( not ( = ?auto_2213520 ?auto_2213531 ) ) ( not ( = ?auto_2213520 ?auto_2213532 ) ) ( not ( = ?auto_2213520 ?auto_2213533 ) ) ( not ( = ?auto_2213520 ?auto_2213534 ) ) ( not ( = ?auto_2213521 ?auto_2213522 ) ) ( not ( = ?auto_2213521 ?auto_2213519 ) ) ( not ( = ?auto_2213521 ?auto_2213523 ) ) ( not ( = ?auto_2213521 ?auto_2213525 ) ) ( not ( = ?auto_2213521 ?auto_2213524 ) ) ( not ( = ?auto_2213521 ?auto_2213526 ) ) ( not ( = ?auto_2213521 ?auto_2213527 ) ) ( not ( = ?auto_2213521 ?auto_2213528 ) ) ( not ( = ?auto_2213521 ?auto_2213529 ) ) ( not ( = ?auto_2213521 ?auto_2213530 ) ) ( not ( = ?auto_2213521 ?auto_2213531 ) ) ( not ( = ?auto_2213521 ?auto_2213532 ) ) ( not ( = ?auto_2213521 ?auto_2213533 ) ) ( not ( = ?auto_2213521 ?auto_2213534 ) ) ( not ( = ?auto_2213522 ?auto_2213519 ) ) ( not ( = ?auto_2213522 ?auto_2213523 ) ) ( not ( = ?auto_2213522 ?auto_2213525 ) ) ( not ( = ?auto_2213522 ?auto_2213524 ) ) ( not ( = ?auto_2213522 ?auto_2213526 ) ) ( not ( = ?auto_2213522 ?auto_2213527 ) ) ( not ( = ?auto_2213522 ?auto_2213528 ) ) ( not ( = ?auto_2213522 ?auto_2213529 ) ) ( not ( = ?auto_2213522 ?auto_2213530 ) ) ( not ( = ?auto_2213522 ?auto_2213531 ) ) ( not ( = ?auto_2213522 ?auto_2213532 ) ) ( not ( = ?auto_2213522 ?auto_2213533 ) ) ( not ( = ?auto_2213522 ?auto_2213534 ) ) ( not ( = ?auto_2213519 ?auto_2213523 ) ) ( not ( = ?auto_2213519 ?auto_2213525 ) ) ( not ( = ?auto_2213519 ?auto_2213524 ) ) ( not ( = ?auto_2213519 ?auto_2213526 ) ) ( not ( = ?auto_2213519 ?auto_2213527 ) ) ( not ( = ?auto_2213519 ?auto_2213528 ) ) ( not ( = ?auto_2213519 ?auto_2213529 ) ) ( not ( = ?auto_2213519 ?auto_2213530 ) ) ( not ( = ?auto_2213519 ?auto_2213531 ) ) ( not ( = ?auto_2213519 ?auto_2213532 ) ) ( not ( = ?auto_2213519 ?auto_2213533 ) ) ( not ( = ?auto_2213519 ?auto_2213534 ) ) ( not ( = ?auto_2213523 ?auto_2213525 ) ) ( not ( = ?auto_2213523 ?auto_2213524 ) ) ( not ( = ?auto_2213523 ?auto_2213526 ) ) ( not ( = ?auto_2213523 ?auto_2213527 ) ) ( not ( = ?auto_2213523 ?auto_2213528 ) ) ( not ( = ?auto_2213523 ?auto_2213529 ) ) ( not ( = ?auto_2213523 ?auto_2213530 ) ) ( not ( = ?auto_2213523 ?auto_2213531 ) ) ( not ( = ?auto_2213523 ?auto_2213532 ) ) ( not ( = ?auto_2213523 ?auto_2213533 ) ) ( not ( = ?auto_2213523 ?auto_2213534 ) ) ( not ( = ?auto_2213525 ?auto_2213524 ) ) ( not ( = ?auto_2213525 ?auto_2213526 ) ) ( not ( = ?auto_2213525 ?auto_2213527 ) ) ( not ( = ?auto_2213525 ?auto_2213528 ) ) ( not ( = ?auto_2213525 ?auto_2213529 ) ) ( not ( = ?auto_2213525 ?auto_2213530 ) ) ( not ( = ?auto_2213525 ?auto_2213531 ) ) ( not ( = ?auto_2213525 ?auto_2213532 ) ) ( not ( = ?auto_2213525 ?auto_2213533 ) ) ( not ( = ?auto_2213525 ?auto_2213534 ) ) ( not ( = ?auto_2213524 ?auto_2213526 ) ) ( not ( = ?auto_2213524 ?auto_2213527 ) ) ( not ( = ?auto_2213524 ?auto_2213528 ) ) ( not ( = ?auto_2213524 ?auto_2213529 ) ) ( not ( = ?auto_2213524 ?auto_2213530 ) ) ( not ( = ?auto_2213524 ?auto_2213531 ) ) ( not ( = ?auto_2213524 ?auto_2213532 ) ) ( not ( = ?auto_2213524 ?auto_2213533 ) ) ( not ( = ?auto_2213524 ?auto_2213534 ) ) ( not ( = ?auto_2213526 ?auto_2213527 ) ) ( not ( = ?auto_2213526 ?auto_2213528 ) ) ( not ( = ?auto_2213526 ?auto_2213529 ) ) ( not ( = ?auto_2213526 ?auto_2213530 ) ) ( not ( = ?auto_2213526 ?auto_2213531 ) ) ( not ( = ?auto_2213526 ?auto_2213532 ) ) ( not ( = ?auto_2213526 ?auto_2213533 ) ) ( not ( = ?auto_2213526 ?auto_2213534 ) ) ( not ( = ?auto_2213527 ?auto_2213528 ) ) ( not ( = ?auto_2213527 ?auto_2213529 ) ) ( not ( = ?auto_2213527 ?auto_2213530 ) ) ( not ( = ?auto_2213527 ?auto_2213531 ) ) ( not ( = ?auto_2213527 ?auto_2213532 ) ) ( not ( = ?auto_2213527 ?auto_2213533 ) ) ( not ( = ?auto_2213527 ?auto_2213534 ) ) ( not ( = ?auto_2213528 ?auto_2213529 ) ) ( not ( = ?auto_2213528 ?auto_2213530 ) ) ( not ( = ?auto_2213528 ?auto_2213531 ) ) ( not ( = ?auto_2213528 ?auto_2213532 ) ) ( not ( = ?auto_2213528 ?auto_2213533 ) ) ( not ( = ?auto_2213528 ?auto_2213534 ) ) ( not ( = ?auto_2213529 ?auto_2213530 ) ) ( not ( = ?auto_2213529 ?auto_2213531 ) ) ( not ( = ?auto_2213529 ?auto_2213532 ) ) ( not ( = ?auto_2213529 ?auto_2213533 ) ) ( not ( = ?auto_2213529 ?auto_2213534 ) ) ( not ( = ?auto_2213530 ?auto_2213531 ) ) ( not ( = ?auto_2213530 ?auto_2213532 ) ) ( not ( = ?auto_2213530 ?auto_2213533 ) ) ( not ( = ?auto_2213530 ?auto_2213534 ) ) ( not ( = ?auto_2213531 ?auto_2213532 ) ) ( not ( = ?auto_2213531 ?auto_2213533 ) ) ( not ( = ?auto_2213531 ?auto_2213534 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2213532 ?auto_2213533 ?auto_2213534 )
      ( MAKE-15CRATE-VERIFY ?auto_2213520 ?auto_2213521 ?auto_2213522 ?auto_2213519 ?auto_2213523 ?auto_2213525 ?auto_2213524 ?auto_2213526 ?auto_2213527 ?auto_2213528 ?auto_2213529 ?auto_2213530 ?auto_2213531 ?auto_2213532 ?auto_2213533 ?auto_2213534 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2213730 - SURFACE
      ?auto_2213731 - SURFACE
      ?auto_2213732 - SURFACE
      ?auto_2213729 - SURFACE
      ?auto_2213733 - SURFACE
      ?auto_2213735 - SURFACE
      ?auto_2213734 - SURFACE
      ?auto_2213736 - SURFACE
      ?auto_2213737 - SURFACE
      ?auto_2213738 - SURFACE
      ?auto_2213739 - SURFACE
      ?auto_2213740 - SURFACE
      ?auto_2213741 - SURFACE
      ?auto_2213742 - SURFACE
      ?auto_2213743 - SURFACE
      ?auto_2213744 - SURFACE
    )
    :vars
    (
      ?auto_2213747 - HOIST
      ?auto_2213749 - PLACE
      ?auto_2213745 - TRUCK
      ?auto_2213746 - PLACE
      ?auto_2213748 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2213747 ?auto_2213749 ) ( SURFACE-AT ?auto_2213743 ?auto_2213749 ) ( CLEAR ?auto_2213743 ) ( IS-CRATE ?auto_2213744 ) ( not ( = ?auto_2213743 ?auto_2213744 ) ) ( AVAILABLE ?auto_2213747 ) ( ON ?auto_2213743 ?auto_2213742 ) ( not ( = ?auto_2213742 ?auto_2213743 ) ) ( not ( = ?auto_2213742 ?auto_2213744 ) ) ( TRUCK-AT ?auto_2213745 ?auto_2213746 ) ( not ( = ?auto_2213746 ?auto_2213749 ) ) ( HOIST-AT ?auto_2213748 ?auto_2213746 ) ( LIFTING ?auto_2213748 ?auto_2213744 ) ( not ( = ?auto_2213747 ?auto_2213748 ) ) ( ON ?auto_2213731 ?auto_2213730 ) ( ON ?auto_2213732 ?auto_2213731 ) ( ON ?auto_2213729 ?auto_2213732 ) ( ON ?auto_2213733 ?auto_2213729 ) ( ON ?auto_2213735 ?auto_2213733 ) ( ON ?auto_2213734 ?auto_2213735 ) ( ON ?auto_2213736 ?auto_2213734 ) ( ON ?auto_2213737 ?auto_2213736 ) ( ON ?auto_2213738 ?auto_2213737 ) ( ON ?auto_2213739 ?auto_2213738 ) ( ON ?auto_2213740 ?auto_2213739 ) ( ON ?auto_2213741 ?auto_2213740 ) ( ON ?auto_2213742 ?auto_2213741 ) ( not ( = ?auto_2213730 ?auto_2213731 ) ) ( not ( = ?auto_2213730 ?auto_2213732 ) ) ( not ( = ?auto_2213730 ?auto_2213729 ) ) ( not ( = ?auto_2213730 ?auto_2213733 ) ) ( not ( = ?auto_2213730 ?auto_2213735 ) ) ( not ( = ?auto_2213730 ?auto_2213734 ) ) ( not ( = ?auto_2213730 ?auto_2213736 ) ) ( not ( = ?auto_2213730 ?auto_2213737 ) ) ( not ( = ?auto_2213730 ?auto_2213738 ) ) ( not ( = ?auto_2213730 ?auto_2213739 ) ) ( not ( = ?auto_2213730 ?auto_2213740 ) ) ( not ( = ?auto_2213730 ?auto_2213741 ) ) ( not ( = ?auto_2213730 ?auto_2213742 ) ) ( not ( = ?auto_2213730 ?auto_2213743 ) ) ( not ( = ?auto_2213730 ?auto_2213744 ) ) ( not ( = ?auto_2213731 ?auto_2213732 ) ) ( not ( = ?auto_2213731 ?auto_2213729 ) ) ( not ( = ?auto_2213731 ?auto_2213733 ) ) ( not ( = ?auto_2213731 ?auto_2213735 ) ) ( not ( = ?auto_2213731 ?auto_2213734 ) ) ( not ( = ?auto_2213731 ?auto_2213736 ) ) ( not ( = ?auto_2213731 ?auto_2213737 ) ) ( not ( = ?auto_2213731 ?auto_2213738 ) ) ( not ( = ?auto_2213731 ?auto_2213739 ) ) ( not ( = ?auto_2213731 ?auto_2213740 ) ) ( not ( = ?auto_2213731 ?auto_2213741 ) ) ( not ( = ?auto_2213731 ?auto_2213742 ) ) ( not ( = ?auto_2213731 ?auto_2213743 ) ) ( not ( = ?auto_2213731 ?auto_2213744 ) ) ( not ( = ?auto_2213732 ?auto_2213729 ) ) ( not ( = ?auto_2213732 ?auto_2213733 ) ) ( not ( = ?auto_2213732 ?auto_2213735 ) ) ( not ( = ?auto_2213732 ?auto_2213734 ) ) ( not ( = ?auto_2213732 ?auto_2213736 ) ) ( not ( = ?auto_2213732 ?auto_2213737 ) ) ( not ( = ?auto_2213732 ?auto_2213738 ) ) ( not ( = ?auto_2213732 ?auto_2213739 ) ) ( not ( = ?auto_2213732 ?auto_2213740 ) ) ( not ( = ?auto_2213732 ?auto_2213741 ) ) ( not ( = ?auto_2213732 ?auto_2213742 ) ) ( not ( = ?auto_2213732 ?auto_2213743 ) ) ( not ( = ?auto_2213732 ?auto_2213744 ) ) ( not ( = ?auto_2213729 ?auto_2213733 ) ) ( not ( = ?auto_2213729 ?auto_2213735 ) ) ( not ( = ?auto_2213729 ?auto_2213734 ) ) ( not ( = ?auto_2213729 ?auto_2213736 ) ) ( not ( = ?auto_2213729 ?auto_2213737 ) ) ( not ( = ?auto_2213729 ?auto_2213738 ) ) ( not ( = ?auto_2213729 ?auto_2213739 ) ) ( not ( = ?auto_2213729 ?auto_2213740 ) ) ( not ( = ?auto_2213729 ?auto_2213741 ) ) ( not ( = ?auto_2213729 ?auto_2213742 ) ) ( not ( = ?auto_2213729 ?auto_2213743 ) ) ( not ( = ?auto_2213729 ?auto_2213744 ) ) ( not ( = ?auto_2213733 ?auto_2213735 ) ) ( not ( = ?auto_2213733 ?auto_2213734 ) ) ( not ( = ?auto_2213733 ?auto_2213736 ) ) ( not ( = ?auto_2213733 ?auto_2213737 ) ) ( not ( = ?auto_2213733 ?auto_2213738 ) ) ( not ( = ?auto_2213733 ?auto_2213739 ) ) ( not ( = ?auto_2213733 ?auto_2213740 ) ) ( not ( = ?auto_2213733 ?auto_2213741 ) ) ( not ( = ?auto_2213733 ?auto_2213742 ) ) ( not ( = ?auto_2213733 ?auto_2213743 ) ) ( not ( = ?auto_2213733 ?auto_2213744 ) ) ( not ( = ?auto_2213735 ?auto_2213734 ) ) ( not ( = ?auto_2213735 ?auto_2213736 ) ) ( not ( = ?auto_2213735 ?auto_2213737 ) ) ( not ( = ?auto_2213735 ?auto_2213738 ) ) ( not ( = ?auto_2213735 ?auto_2213739 ) ) ( not ( = ?auto_2213735 ?auto_2213740 ) ) ( not ( = ?auto_2213735 ?auto_2213741 ) ) ( not ( = ?auto_2213735 ?auto_2213742 ) ) ( not ( = ?auto_2213735 ?auto_2213743 ) ) ( not ( = ?auto_2213735 ?auto_2213744 ) ) ( not ( = ?auto_2213734 ?auto_2213736 ) ) ( not ( = ?auto_2213734 ?auto_2213737 ) ) ( not ( = ?auto_2213734 ?auto_2213738 ) ) ( not ( = ?auto_2213734 ?auto_2213739 ) ) ( not ( = ?auto_2213734 ?auto_2213740 ) ) ( not ( = ?auto_2213734 ?auto_2213741 ) ) ( not ( = ?auto_2213734 ?auto_2213742 ) ) ( not ( = ?auto_2213734 ?auto_2213743 ) ) ( not ( = ?auto_2213734 ?auto_2213744 ) ) ( not ( = ?auto_2213736 ?auto_2213737 ) ) ( not ( = ?auto_2213736 ?auto_2213738 ) ) ( not ( = ?auto_2213736 ?auto_2213739 ) ) ( not ( = ?auto_2213736 ?auto_2213740 ) ) ( not ( = ?auto_2213736 ?auto_2213741 ) ) ( not ( = ?auto_2213736 ?auto_2213742 ) ) ( not ( = ?auto_2213736 ?auto_2213743 ) ) ( not ( = ?auto_2213736 ?auto_2213744 ) ) ( not ( = ?auto_2213737 ?auto_2213738 ) ) ( not ( = ?auto_2213737 ?auto_2213739 ) ) ( not ( = ?auto_2213737 ?auto_2213740 ) ) ( not ( = ?auto_2213737 ?auto_2213741 ) ) ( not ( = ?auto_2213737 ?auto_2213742 ) ) ( not ( = ?auto_2213737 ?auto_2213743 ) ) ( not ( = ?auto_2213737 ?auto_2213744 ) ) ( not ( = ?auto_2213738 ?auto_2213739 ) ) ( not ( = ?auto_2213738 ?auto_2213740 ) ) ( not ( = ?auto_2213738 ?auto_2213741 ) ) ( not ( = ?auto_2213738 ?auto_2213742 ) ) ( not ( = ?auto_2213738 ?auto_2213743 ) ) ( not ( = ?auto_2213738 ?auto_2213744 ) ) ( not ( = ?auto_2213739 ?auto_2213740 ) ) ( not ( = ?auto_2213739 ?auto_2213741 ) ) ( not ( = ?auto_2213739 ?auto_2213742 ) ) ( not ( = ?auto_2213739 ?auto_2213743 ) ) ( not ( = ?auto_2213739 ?auto_2213744 ) ) ( not ( = ?auto_2213740 ?auto_2213741 ) ) ( not ( = ?auto_2213740 ?auto_2213742 ) ) ( not ( = ?auto_2213740 ?auto_2213743 ) ) ( not ( = ?auto_2213740 ?auto_2213744 ) ) ( not ( = ?auto_2213741 ?auto_2213742 ) ) ( not ( = ?auto_2213741 ?auto_2213743 ) ) ( not ( = ?auto_2213741 ?auto_2213744 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2213742 ?auto_2213743 ?auto_2213744 )
      ( MAKE-15CRATE-VERIFY ?auto_2213730 ?auto_2213731 ?auto_2213732 ?auto_2213729 ?auto_2213733 ?auto_2213735 ?auto_2213734 ?auto_2213736 ?auto_2213737 ?auto_2213738 ?auto_2213739 ?auto_2213740 ?auto_2213741 ?auto_2213742 ?auto_2213743 ?auto_2213744 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2213955 - SURFACE
      ?auto_2213956 - SURFACE
      ?auto_2213957 - SURFACE
      ?auto_2213954 - SURFACE
      ?auto_2213958 - SURFACE
      ?auto_2213960 - SURFACE
      ?auto_2213959 - SURFACE
      ?auto_2213961 - SURFACE
      ?auto_2213962 - SURFACE
      ?auto_2213963 - SURFACE
      ?auto_2213964 - SURFACE
      ?auto_2213965 - SURFACE
      ?auto_2213966 - SURFACE
      ?auto_2213967 - SURFACE
      ?auto_2213968 - SURFACE
      ?auto_2213969 - SURFACE
    )
    :vars
    (
      ?auto_2213975 - HOIST
      ?auto_2213974 - PLACE
      ?auto_2213971 - TRUCK
      ?auto_2213973 - PLACE
      ?auto_2213972 - HOIST
      ?auto_2213970 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2213975 ?auto_2213974 ) ( SURFACE-AT ?auto_2213968 ?auto_2213974 ) ( CLEAR ?auto_2213968 ) ( IS-CRATE ?auto_2213969 ) ( not ( = ?auto_2213968 ?auto_2213969 ) ) ( AVAILABLE ?auto_2213975 ) ( ON ?auto_2213968 ?auto_2213967 ) ( not ( = ?auto_2213967 ?auto_2213968 ) ) ( not ( = ?auto_2213967 ?auto_2213969 ) ) ( TRUCK-AT ?auto_2213971 ?auto_2213973 ) ( not ( = ?auto_2213973 ?auto_2213974 ) ) ( HOIST-AT ?auto_2213972 ?auto_2213973 ) ( not ( = ?auto_2213975 ?auto_2213972 ) ) ( AVAILABLE ?auto_2213972 ) ( SURFACE-AT ?auto_2213969 ?auto_2213973 ) ( ON ?auto_2213969 ?auto_2213970 ) ( CLEAR ?auto_2213969 ) ( not ( = ?auto_2213968 ?auto_2213970 ) ) ( not ( = ?auto_2213969 ?auto_2213970 ) ) ( not ( = ?auto_2213967 ?auto_2213970 ) ) ( ON ?auto_2213956 ?auto_2213955 ) ( ON ?auto_2213957 ?auto_2213956 ) ( ON ?auto_2213954 ?auto_2213957 ) ( ON ?auto_2213958 ?auto_2213954 ) ( ON ?auto_2213960 ?auto_2213958 ) ( ON ?auto_2213959 ?auto_2213960 ) ( ON ?auto_2213961 ?auto_2213959 ) ( ON ?auto_2213962 ?auto_2213961 ) ( ON ?auto_2213963 ?auto_2213962 ) ( ON ?auto_2213964 ?auto_2213963 ) ( ON ?auto_2213965 ?auto_2213964 ) ( ON ?auto_2213966 ?auto_2213965 ) ( ON ?auto_2213967 ?auto_2213966 ) ( not ( = ?auto_2213955 ?auto_2213956 ) ) ( not ( = ?auto_2213955 ?auto_2213957 ) ) ( not ( = ?auto_2213955 ?auto_2213954 ) ) ( not ( = ?auto_2213955 ?auto_2213958 ) ) ( not ( = ?auto_2213955 ?auto_2213960 ) ) ( not ( = ?auto_2213955 ?auto_2213959 ) ) ( not ( = ?auto_2213955 ?auto_2213961 ) ) ( not ( = ?auto_2213955 ?auto_2213962 ) ) ( not ( = ?auto_2213955 ?auto_2213963 ) ) ( not ( = ?auto_2213955 ?auto_2213964 ) ) ( not ( = ?auto_2213955 ?auto_2213965 ) ) ( not ( = ?auto_2213955 ?auto_2213966 ) ) ( not ( = ?auto_2213955 ?auto_2213967 ) ) ( not ( = ?auto_2213955 ?auto_2213968 ) ) ( not ( = ?auto_2213955 ?auto_2213969 ) ) ( not ( = ?auto_2213955 ?auto_2213970 ) ) ( not ( = ?auto_2213956 ?auto_2213957 ) ) ( not ( = ?auto_2213956 ?auto_2213954 ) ) ( not ( = ?auto_2213956 ?auto_2213958 ) ) ( not ( = ?auto_2213956 ?auto_2213960 ) ) ( not ( = ?auto_2213956 ?auto_2213959 ) ) ( not ( = ?auto_2213956 ?auto_2213961 ) ) ( not ( = ?auto_2213956 ?auto_2213962 ) ) ( not ( = ?auto_2213956 ?auto_2213963 ) ) ( not ( = ?auto_2213956 ?auto_2213964 ) ) ( not ( = ?auto_2213956 ?auto_2213965 ) ) ( not ( = ?auto_2213956 ?auto_2213966 ) ) ( not ( = ?auto_2213956 ?auto_2213967 ) ) ( not ( = ?auto_2213956 ?auto_2213968 ) ) ( not ( = ?auto_2213956 ?auto_2213969 ) ) ( not ( = ?auto_2213956 ?auto_2213970 ) ) ( not ( = ?auto_2213957 ?auto_2213954 ) ) ( not ( = ?auto_2213957 ?auto_2213958 ) ) ( not ( = ?auto_2213957 ?auto_2213960 ) ) ( not ( = ?auto_2213957 ?auto_2213959 ) ) ( not ( = ?auto_2213957 ?auto_2213961 ) ) ( not ( = ?auto_2213957 ?auto_2213962 ) ) ( not ( = ?auto_2213957 ?auto_2213963 ) ) ( not ( = ?auto_2213957 ?auto_2213964 ) ) ( not ( = ?auto_2213957 ?auto_2213965 ) ) ( not ( = ?auto_2213957 ?auto_2213966 ) ) ( not ( = ?auto_2213957 ?auto_2213967 ) ) ( not ( = ?auto_2213957 ?auto_2213968 ) ) ( not ( = ?auto_2213957 ?auto_2213969 ) ) ( not ( = ?auto_2213957 ?auto_2213970 ) ) ( not ( = ?auto_2213954 ?auto_2213958 ) ) ( not ( = ?auto_2213954 ?auto_2213960 ) ) ( not ( = ?auto_2213954 ?auto_2213959 ) ) ( not ( = ?auto_2213954 ?auto_2213961 ) ) ( not ( = ?auto_2213954 ?auto_2213962 ) ) ( not ( = ?auto_2213954 ?auto_2213963 ) ) ( not ( = ?auto_2213954 ?auto_2213964 ) ) ( not ( = ?auto_2213954 ?auto_2213965 ) ) ( not ( = ?auto_2213954 ?auto_2213966 ) ) ( not ( = ?auto_2213954 ?auto_2213967 ) ) ( not ( = ?auto_2213954 ?auto_2213968 ) ) ( not ( = ?auto_2213954 ?auto_2213969 ) ) ( not ( = ?auto_2213954 ?auto_2213970 ) ) ( not ( = ?auto_2213958 ?auto_2213960 ) ) ( not ( = ?auto_2213958 ?auto_2213959 ) ) ( not ( = ?auto_2213958 ?auto_2213961 ) ) ( not ( = ?auto_2213958 ?auto_2213962 ) ) ( not ( = ?auto_2213958 ?auto_2213963 ) ) ( not ( = ?auto_2213958 ?auto_2213964 ) ) ( not ( = ?auto_2213958 ?auto_2213965 ) ) ( not ( = ?auto_2213958 ?auto_2213966 ) ) ( not ( = ?auto_2213958 ?auto_2213967 ) ) ( not ( = ?auto_2213958 ?auto_2213968 ) ) ( not ( = ?auto_2213958 ?auto_2213969 ) ) ( not ( = ?auto_2213958 ?auto_2213970 ) ) ( not ( = ?auto_2213960 ?auto_2213959 ) ) ( not ( = ?auto_2213960 ?auto_2213961 ) ) ( not ( = ?auto_2213960 ?auto_2213962 ) ) ( not ( = ?auto_2213960 ?auto_2213963 ) ) ( not ( = ?auto_2213960 ?auto_2213964 ) ) ( not ( = ?auto_2213960 ?auto_2213965 ) ) ( not ( = ?auto_2213960 ?auto_2213966 ) ) ( not ( = ?auto_2213960 ?auto_2213967 ) ) ( not ( = ?auto_2213960 ?auto_2213968 ) ) ( not ( = ?auto_2213960 ?auto_2213969 ) ) ( not ( = ?auto_2213960 ?auto_2213970 ) ) ( not ( = ?auto_2213959 ?auto_2213961 ) ) ( not ( = ?auto_2213959 ?auto_2213962 ) ) ( not ( = ?auto_2213959 ?auto_2213963 ) ) ( not ( = ?auto_2213959 ?auto_2213964 ) ) ( not ( = ?auto_2213959 ?auto_2213965 ) ) ( not ( = ?auto_2213959 ?auto_2213966 ) ) ( not ( = ?auto_2213959 ?auto_2213967 ) ) ( not ( = ?auto_2213959 ?auto_2213968 ) ) ( not ( = ?auto_2213959 ?auto_2213969 ) ) ( not ( = ?auto_2213959 ?auto_2213970 ) ) ( not ( = ?auto_2213961 ?auto_2213962 ) ) ( not ( = ?auto_2213961 ?auto_2213963 ) ) ( not ( = ?auto_2213961 ?auto_2213964 ) ) ( not ( = ?auto_2213961 ?auto_2213965 ) ) ( not ( = ?auto_2213961 ?auto_2213966 ) ) ( not ( = ?auto_2213961 ?auto_2213967 ) ) ( not ( = ?auto_2213961 ?auto_2213968 ) ) ( not ( = ?auto_2213961 ?auto_2213969 ) ) ( not ( = ?auto_2213961 ?auto_2213970 ) ) ( not ( = ?auto_2213962 ?auto_2213963 ) ) ( not ( = ?auto_2213962 ?auto_2213964 ) ) ( not ( = ?auto_2213962 ?auto_2213965 ) ) ( not ( = ?auto_2213962 ?auto_2213966 ) ) ( not ( = ?auto_2213962 ?auto_2213967 ) ) ( not ( = ?auto_2213962 ?auto_2213968 ) ) ( not ( = ?auto_2213962 ?auto_2213969 ) ) ( not ( = ?auto_2213962 ?auto_2213970 ) ) ( not ( = ?auto_2213963 ?auto_2213964 ) ) ( not ( = ?auto_2213963 ?auto_2213965 ) ) ( not ( = ?auto_2213963 ?auto_2213966 ) ) ( not ( = ?auto_2213963 ?auto_2213967 ) ) ( not ( = ?auto_2213963 ?auto_2213968 ) ) ( not ( = ?auto_2213963 ?auto_2213969 ) ) ( not ( = ?auto_2213963 ?auto_2213970 ) ) ( not ( = ?auto_2213964 ?auto_2213965 ) ) ( not ( = ?auto_2213964 ?auto_2213966 ) ) ( not ( = ?auto_2213964 ?auto_2213967 ) ) ( not ( = ?auto_2213964 ?auto_2213968 ) ) ( not ( = ?auto_2213964 ?auto_2213969 ) ) ( not ( = ?auto_2213964 ?auto_2213970 ) ) ( not ( = ?auto_2213965 ?auto_2213966 ) ) ( not ( = ?auto_2213965 ?auto_2213967 ) ) ( not ( = ?auto_2213965 ?auto_2213968 ) ) ( not ( = ?auto_2213965 ?auto_2213969 ) ) ( not ( = ?auto_2213965 ?auto_2213970 ) ) ( not ( = ?auto_2213966 ?auto_2213967 ) ) ( not ( = ?auto_2213966 ?auto_2213968 ) ) ( not ( = ?auto_2213966 ?auto_2213969 ) ) ( not ( = ?auto_2213966 ?auto_2213970 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2213967 ?auto_2213968 ?auto_2213969 )
      ( MAKE-15CRATE-VERIFY ?auto_2213955 ?auto_2213956 ?auto_2213957 ?auto_2213954 ?auto_2213958 ?auto_2213960 ?auto_2213959 ?auto_2213961 ?auto_2213962 ?auto_2213963 ?auto_2213964 ?auto_2213965 ?auto_2213966 ?auto_2213967 ?auto_2213968 ?auto_2213969 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2214181 - SURFACE
      ?auto_2214182 - SURFACE
      ?auto_2214183 - SURFACE
      ?auto_2214180 - SURFACE
      ?auto_2214184 - SURFACE
      ?auto_2214186 - SURFACE
      ?auto_2214185 - SURFACE
      ?auto_2214187 - SURFACE
      ?auto_2214188 - SURFACE
      ?auto_2214189 - SURFACE
      ?auto_2214190 - SURFACE
      ?auto_2214191 - SURFACE
      ?auto_2214192 - SURFACE
      ?auto_2214193 - SURFACE
      ?auto_2214194 - SURFACE
      ?auto_2214195 - SURFACE
    )
    :vars
    (
      ?auto_2214198 - HOIST
      ?auto_2214196 - PLACE
      ?auto_2214201 - PLACE
      ?auto_2214197 - HOIST
      ?auto_2214200 - SURFACE
      ?auto_2214199 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2214198 ?auto_2214196 ) ( SURFACE-AT ?auto_2214194 ?auto_2214196 ) ( CLEAR ?auto_2214194 ) ( IS-CRATE ?auto_2214195 ) ( not ( = ?auto_2214194 ?auto_2214195 ) ) ( AVAILABLE ?auto_2214198 ) ( ON ?auto_2214194 ?auto_2214193 ) ( not ( = ?auto_2214193 ?auto_2214194 ) ) ( not ( = ?auto_2214193 ?auto_2214195 ) ) ( not ( = ?auto_2214201 ?auto_2214196 ) ) ( HOIST-AT ?auto_2214197 ?auto_2214201 ) ( not ( = ?auto_2214198 ?auto_2214197 ) ) ( AVAILABLE ?auto_2214197 ) ( SURFACE-AT ?auto_2214195 ?auto_2214201 ) ( ON ?auto_2214195 ?auto_2214200 ) ( CLEAR ?auto_2214195 ) ( not ( = ?auto_2214194 ?auto_2214200 ) ) ( not ( = ?auto_2214195 ?auto_2214200 ) ) ( not ( = ?auto_2214193 ?auto_2214200 ) ) ( TRUCK-AT ?auto_2214199 ?auto_2214196 ) ( ON ?auto_2214182 ?auto_2214181 ) ( ON ?auto_2214183 ?auto_2214182 ) ( ON ?auto_2214180 ?auto_2214183 ) ( ON ?auto_2214184 ?auto_2214180 ) ( ON ?auto_2214186 ?auto_2214184 ) ( ON ?auto_2214185 ?auto_2214186 ) ( ON ?auto_2214187 ?auto_2214185 ) ( ON ?auto_2214188 ?auto_2214187 ) ( ON ?auto_2214189 ?auto_2214188 ) ( ON ?auto_2214190 ?auto_2214189 ) ( ON ?auto_2214191 ?auto_2214190 ) ( ON ?auto_2214192 ?auto_2214191 ) ( ON ?auto_2214193 ?auto_2214192 ) ( not ( = ?auto_2214181 ?auto_2214182 ) ) ( not ( = ?auto_2214181 ?auto_2214183 ) ) ( not ( = ?auto_2214181 ?auto_2214180 ) ) ( not ( = ?auto_2214181 ?auto_2214184 ) ) ( not ( = ?auto_2214181 ?auto_2214186 ) ) ( not ( = ?auto_2214181 ?auto_2214185 ) ) ( not ( = ?auto_2214181 ?auto_2214187 ) ) ( not ( = ?auto_2214181 ?auto_2214188 ) ) ( not ( = ?auto_2214181 ?auto_2214189 ) ) ( not ( = ?auto_2214181 ?auto_2214190 ) ) ( not ( = ?auto_2214181 ?auto_2214191 ) ) ( not ( = ?auto_2214181 ?auto_2214192 ) ) ( not ( = ?auto_2214181 ?auto_2214193 ) ) ( not ( = ?auto_2214181 ?auto_2214194 ) ) ( not ( = ?auto_2214181 ?auto_2214195 ) ) ( not ( = ?auto_2214181 ?auto_2214200 ) ) ( not ( = ?auto_2214182 ?auto_2214183 ) ) ( not ( = ?auto_2214182 ?auto_2214180 ) ) ( not ( = ?auto_2214182 ?auto_2214184 ) ) ( not ( = ?auto_2214182 ?auto_2214186 ) ) ( not ( = ?auto_2214182 ?auto_2214185 ) ) ( not ( = ?auto_2214182 ?auto_2214187 ) ) ( not ( = ?auto_2214182 ?auto_2214188 ) ) ( not ( = ?auto_2214182 ?auto_2214189 ) ) ( not ( = ?auto_2214182 ?auto_2214190 ) ) ( not ( = ?auto_2214182 ?auto_2214191 ) ) ( not ( = ?auto_2214182 ?auto_2214192 ) ) ( not ( = ?auto_2214182 ?auto_2214193 ) ) ( not ( = ?auto_2214182 ?auto_2214194 ) ) ( not ( = ?auto_2214182 ?auto_2214195 ) ) ( not ( = ?auto_2214182 ?auto_2214200 ) ) ( not ( = ?auto_2214183 ?auto_2214180 ) ) ( not ( = ?auto_2214183 ?auto_2214184 ) ) ( not ( = ?auto_2214183 ?auto_2214186 ) ) ( not ( = ?auto_2214183 ?auto_2214185 ) ) ( not ( = ?auto_2214183 ?auto_2214187 ) ) ( not ( = ?auto_2214183 ?auto_2214188 ) ) ( not ( = ?auto_2214183 ?auto_2214189 ) ) ( not ( = ?auto_2214183 ?auto_2214190 ) ) ( not ( = ?auto_2214183 ?auto_2214191 ) ) ( not ( = ?auto_2214183 ?auto_2214192 ) ) ( not ( = ?auto_2214183 ?auto_2214193 ) ) ( not ( = ?auto_2214183 ?auto_2214194 ) ) ( not ( = ?auto_2214183 ?auto_2214195 ) ) ( not ( = ?auto_2214183 ?auto_2214200 ) ) ( not ( = ?auto_2214180 ?auto_2214184 ) ) ( not ( = ?auto_2214180 ?auto_2214186 ) ) ( not ( = ?auto_2214180 ?auto_2214185 ) ) ( not ( = ?auto_2214180 ?auto_2214187 ) ) ( not ( = ?auto_2214180 ?auto_2214188 ) ) ( not ( = ?auto_2214180 ?auto_2214189 ) ) ( not ( = ?auto_2214180 ?auto_2214190 ) ) ( not ( = ?auto_2214180 ?auto_2214191 ) ) ( not ( = ?auto_2214180 ?auto_2214192 ) ) ( not ( = ?auto_2214180 ?auto_2214193 ) ) ( not ( = ?auto_2214180 ?auto_2214194 ) ) ( not ( = ?auto_2214180 ?auto_2214195 ) ) ( not ( = ?auto_2214180 ?auto_2214200 ) ) ( not ( = ?auto_2214184 ?auto_2214186 ) ) ( not ( = ?auto_2214184 ?auto_2214185 ) ) ( not ( = ?auto_2214184 ?auto_2214187 ) ) ( not ( = ?auto_2214184 ?auto_2214188 ) ) ( not ( = ?auto_2214184 ?auto_2214189 ) ) ( not ( = ?auto_2214184 ?auto_2214190 ) ) ( not ( = ?auto_2214184 ?auto_2214191 ) ) ( not ( = ?auto_2214184 ?auto_2214192 ) ) ( not ( = ?auto_2214184 ?auto_2214193 ) ) ( not ( = ?auto_2214184 ?auto_2214194 ) ) ( not ( = ?auto_2214184 ?auto_2214195 ) ) ( not ( = ?auto_2214184 ?auto_2214200 ) ) ( not ( = ?auto_2214186 ?auto_2214185 ) ) ( not ( = ?auto_2214186 ?auto_2214187 ) ) ( not ( = ?auto_2214186 ?auto_2214188 ) ) ( not ( = ?auto_2214186 ?auto_2214189 ) ) ( not ( = ?auto_2214186 ?auto_2214190 ) ) ( not ( = ?auto_2214186 ?auto_2214191 ) ) ( not ( = ?auto_2214186 ?auto_2214192 ) ) ( not ( = ?auto_2214186 ?auto_2214193 ) ) ( not ( = ?auto_2214186 ?auto_2214194 ) ) ( not ( = ?auto_2214186 ?auto_2214195 ) ) ( not ( = ?auto_2214186 ?auto_2214200 ) ) ( not ( = ?auto_2214185 ?auto_2214187 ) ) ( not ( = ?auto_2214185 ?auto_2214188 ) ) ( not ( = ?auto_2214185 ?auto_2214189 ) ) ( not ( = ?auto_2214185 ?auto_2214190 ) ) ( not ( = ?auto_2214185 ?auto_2214191 ) ) ( not ( = ?auto_2214185 ?auto_2214192 ) ) ( not ( = ?auto_2214185 ?auto_2214193 ) ) ( not ( = ?auto_2214185 ?auto_2214194 ) ) ( not ( = ?auto_2214185 ?auto_2214195 ) ) ( not ( = ?auto_2214185 ?auto_2214200 ) ) ( not ( = ?auto_2214187 ?auto_2214188 ) ) ( not ( = ?auto_2214187 ?auto_2214189 ) ) ( not ( = ?auto_2214187 ?auto_2214190 ) ) ( not ( = ?auto_2214187 ?auto_2214191 ) ) ( not ( = ?auto_2214187 ?auto_2214192 ) ) ( not ( = ?auto_2214187 ?auto_2214193 ) ) ( not ( = ?auto_2214187 ?auto_2214194 ) ) ( not ( = ?auto_2214187 ?auto_2214195 ) ) ( not ( = ?auto_2214187 ?auto_2214200 ) ) ( not ( = ?auto_2214188 ?auto_2214189 ) ) ( not ( = ?auto_2214188 ?auto_2214190 ) ) ( not ( = ?auto_2214188 ?auto_2214191 ) ) ( not ( = ?auto_2214188 ?auto_2214192 ) ) ( not ( = ?auto_2214188 ?auto_2214193 ) ) ( not ( = ?auto_2214188 ?auto_2214194 ) ) ( not ( = ?auto_2214188 ?auto_2214195 ) ) ( not ( = ?auto_2214188 ?auto_2214200 ) ) ( not ( = ?auto_2214189 ?auto_2214190 ) ) ( not ( = ?auto_2214189 ?auto_2214191 ) ) ( not ( = ?auto_2214189 ?auto_2214192 ) ) ( not ( = ?auto_2214189 ?auto_2214193 ) ) ( not ( = ?auto_2214189 ?auto_2214194 ) ) ( not ( = ?auto_2214189 ?auto_2214195 ) ) ( not ( = ?auto_2214189 ?auto_2214200 ) ) ( not ( = ?auto_2214190 ?auto_2214191 ) ) ( not ( = ?auto_2214190 ?auto_2214192 ) ) ( not ( = ?auto_2214190 ?auto_2214193 ) ) ( not ( = ?auto_2214190 ?auto_2214194 ) ) ( not ( = ?auto_2214190 ?auto_2214195 ) ) ( not ( = ?auto_2214190 ?auto_2214200 ) ) ( not ( = ?auto_2214191 ?auto_2214192 ) ) ( not ( = ?auto_2214191 ?auto_2214193 ) ) ( not ( = ?auto_2214191 ?auto_2214194 ) ) ( not ( = ?auto_2214191 ?auto_2214195 ) ) ( not ( = ?auto_2214191 ?auto_2214200 ) ) ( not ( = ?auto_2214192 ?auto_2214193 ) ) ( not ( = ?auto_2214192 ?auto_2214194 ) ) ( not ( = ?auto_2214192 ?auto_2214195 ) ) ( not ( = ?auto_2214192 ?auto_2214200 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2214193 ?auto_2214194 ?auto_2214195 )
      ( MAKE-15CRATE-VERIFY ?auto_2214181 ?auto_2214182 ?auto_2214183 ?auto_2214180 ?auto_2214184 ?auto_2214186 ?auto_2214185 ?auto_2214187 ?auto_2214188 ?auto_2214189 ?auto_2214190 ?auto_2214191 ?auto_2214192 ?auto_2214193 ?auto_2214194 ?auto_2214195 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2214407 - SURFACE
      ?auto_2214408 - SURFACE
      ?auto_2214409 - SURFACE
      ?auto_2214406 - SURFACE
      ?auto_2214410 - SURFACE
      ?auto_2214412 - SURFACE
      ?auto_2214411 - SURFACE
      ?auto_2214413 - SURFACE
      ?auto_2214414 - SURFACE
      ?auto_2214415 - SURFACE
      ?auto_2214416 - SURFACE
      ?auto_2214417 - SURFACE
      ?auto_2214418 - SURFACE
      ?auto_2214419 - SURFACE
      ?auto_2214420 - SURFACE
      ?auto_2214421 - SURFACE
    )
    :vars
    (
      ?auto_2214423 - HOIST
      ?auto_2214426 - PLACE
      ?auto_2214424 - PLACE
      ?auto_2214425 - HOIST
      ?auto_2214422 - SURFACE
      ?auto_2214427 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2214423 ?auto_2214426 ) ( IS-CRATE ?auto_2214421 ) ( not ( = ?auto_2214420 ?auto_2214421 ) ) ( not ( = ?auto_2214419 ?auto_2214420 ) ) ( not ( = ?auto_2214419 ?auto_2214421 ) ) ( not ( = ?auto_2214424 ?auto_2214426 ) ) ( HOIST-AT ?auto_2214425 ?auto_2214424 ) ( not ( = ?auto_2214423 ?auto_2214425 ) ) ( AVAILABLE ?auto_2214425 ) ( SURFACE-AT ?auto_2214421 ?auto_2214424 ) ( ON ?auto_2214421 ?auto_2214422 ) ( CLEAR ?auto_2214421 ) ( not ( = ?auto_2214420 ?auto_2214422 ) ) ( not ( = ?auto_2214421 ?auto_2214422 ) ) ( not ( = ?auto_2214419 ?auto_2214422 ) ) ( TRUCK-AT ?auto_2214427 ?auto_2214426 ) ( SURFACE-AT ?auto_2214419 ?auto_2214426 ) ( CLEAR ?auto_2214419 ) ( LIFTING ?auto_2214423 ?auto_2214420 ) ( IS-CRATE ?auto_2214420 ) ( ON ?auto_2214408 ?auto_2214407 ) ( ON ?auto_2214409 ?auto_2214408 ) ( ON ?auto_2214406 ?auto_2214409 ) ( ON ?auto_2214410 ?auto_2214406 ) ( ON ?auto_2214412 ?auto_2214410 ) ( ON ?auto_2214411 ?auto_2214412 ) ( ON ?auto_2214413 ?auto_2214411 ) ( ON ?auto_2214414 ?auto_2214413 ) ( ON ?auto_2214415 ?auto_2214414 ) ( ON ?auto_2214416 ?auto_2214415 ) ( ON ?auto_2214417 ?auto_2214416 ) ( ON ?auto_2214418 ?auto_2214417 ) ( ON ?auto_2214419 ?auto_2214418 ) ( not ( = ?auto_2214407 ?auto_2214408 ) ) ( not ( = ?auto_2214407 ?auto_2214409 ) ) ( not ( = ?auto_2214407 ?auto_2214406 ) ) ( not ( = ?auto_2214407 ?auto_2214410 ) ) ( not ( = ?auto_2214407 ?auto_2214412 ) ) ( not ( = ?auto_2214407 ?auto_2214411 ) ) ( not ( = ?auto_2214407 ?auto_2214413 ) ) ( not ( = ?auto_2214407 ?auto_2214414 ) ) ( not ( = ?auto_2214407 ?auto_2214415 ) ) ( not ( = ?auto_2214407 ?auto_2214416 ) ) ( not ( = ?auto_2214407 ?auto_2214417 ) ) ( not ( = ?auto_2214407 ?auto_2214418 ) ) ( not ( = ?auto_2214407 ?auto_2214419 ) ) ( not ( = ?auto_2214407 ?auto_2214420 ) ) ( not ( = ?auto_2214407 ?auto_2214421 ) ) ( not ( = ?auto_2214407 ?auto_2214422 ) ) ( not ( = ?auto_2214408 ?auto_2214409 ) ) ( not ( = ?auto_2214408 ?auto_2214406 ) ) ( not ( = ?auto_2214408 ?auto_2214410 ) ) ( not ( = ?auto_2214408 ?auto_2214412 ) ) ( not ( = ?auto_2214408 ?auto_2214411 ) ) ( not ( = ?auto_2214408 ?auto_2214413 ) ) ( not ( = ?auto_2214408 ?auto_2214414 ) ) ( not ( = ?auto_2214408 ?auto_2214415 ) ) ( not ( = ?auto_2214408 ?auto_2214416 ) ) ( not ( = ?auto_2214408 ?auto_2214417 ) ) ( not ( = ?auto_2214408 ?auto_2214418 ) ) ( not ( = ?auto_2214408 ?auto_2214419 ) ) ( not ( = ?auto_2214408 ?auto_2214420 ) ) ( not ( = ?auto_2214408 ?auto_2214421 ) ) ( not ( = ?auto_2214408 ?auto_2214422 ) ) ( not ( = ?auto_2214409 ?auto_2214406 ) ) ( not ( = ?auto_2214409 ?auto_2214410 ) ) ( not ( = ?auto_2214409 ?auto_2214412 ) ) ( not ( = ?auto_2214409 ?auto_2214411 ) ) ( not ( = ?auto_2214409 ?auto_2214413 ) ) ( not ( = ?auto_2214409 ?auto_2214414 ) ) ( not ( = ?auto_2214409 ?auto_2214415 ) ) ( not ( = ?auto_2214409 ?auto_2214416 ) ) ( not ( = ?auto_2214409 ?auto_2214417 ) ) ( not ( = ?auto_2214409 ?auto_2214418 ) ) ( not ( = ?auto_2214409 ?auto_2214419 ) ) ( not ( = ?auto_2214409 ?auto_2214420 ) ) ( not ( = ?auto_2214409 ?auto_2214421 ) ) ( not ( = ?auto_2214409 ?auto_2214422 ) ) ( not ( = ?auto_2214406 ?auto_2214410 ) ) ( not ( = ?auto_2214406 ?auto_2214412 ) ) ( not ( = ?auto_2214406 ?auto_2214411 ) ) ( not ( = ?auto_2214406 ?auto_2214413 ) ) ( not ( = ?auto_2214406 ?auto_2214414 ) ) ( not ( = ?auto_2214406 ?auto_2214415 ) ) ( not ( = ?auto_2214406 ?auto_2214416 ) ) ( not ( = ?auto_2214406 ?auto_2214417 ) ) ( not ( = ?auto_2214406 ?auto_2214418 ) ) ( not ( = ?auto_2214406 ?auto_2214419 ) ) ( not ( = ?auto_2214406 ?auto_2214420 ) ) ( not ( = ?auto_2214406 ?auto_2214421 ) ) ( not ( = ?auto_2214406 ?auto_2214422 ) ) ( not ( = ?auto_2214410 ?auto_2214412 ) ) ( not ( = ?auto_2214410 ?auto_2214411 ) ) ( not ( = ?auto_2214410 ?auto_2214413 ) ) ( not ( = ?auto_2214410 ?auto_2214414 ) ) ( not ( = ?auto_2214410 ?auto_2214415 ) ) ( not ( = ?auto_2214410 ?auto_2214416 ) ) ( not ( = ?auto_2214410 ?auto_2214417 ) ) ( not ( = ?auto_2214410 ?auto_2214418 ) ) ( not ( = ?auto_2214410 ?auto_2214419 ) ) ( not ( = ?auto_2214410 ?auto_2214420 ) ) ( not ( = ?auto_2214410 ?auto_2214421 ) ) ( not ( = ?auto_2214410 ?auto_2214422 ) ) ( not ( = ?auto_2214412 ?auto_2214411 ) ) ( not ( = ?auto_2214412 ?auto_2214413 ) ) ( not ( = ?auto_2214412 ?auto_2214414 ) ) ( not ( = ?auto_2214412 ?auto_2214415 ) ) ( not ( = ?auto_2214412 ?auto_2214416 ) ) ( not ( = ?auto_2214412 ?auto_2214417 ) ) ( not ( = ?auto_2214412 ?auto_2214418 ) ) ( not ( = ?auto_2214412 ?auto_2214419 ) ) ( not ( = ?auto_2214412 ?auto_2214420 ) ) ( not ( = ?auto_2214412 ?auto_2214421 ) ) ( not ( = ?auto_2214412 ?auto_2214422 ) ) ( not ( = ?auto_2214411 ?auto_2214413 ) ) ( not ( = ?auto_2214411 ?auto_2214414 ) ) ( not ( = ?auto_2214411 ?auto_2214415 ) ) ( not ( = ?auto_2214411 ?auto_2214416 ) ) ( not ( = ?auto_2214411 ?auto_2214417 ) ) ( not ( = ?auto_2214411 ?auto_2214418 ) ) ( not ( = ?auto_2214411 ?auto_2214419 ) ) ( not ( = ?auto_2214411 ?auto_2214420 ) ) ( not ( = ?auto_2214411 ?auto_2214421 ) ) ( not ( = ?auto_2214411 ?auto_2214422 ) ) ( not ( = ?auto_2214413 ?auto_2214414 ) ) ( not ( = ?auto_2214413 ?auto_2214415 ) ) ( not ( = ?auto_2214413 ?auto_2214416 ) ) ( not ( = ?auto_2214413 ?auto_2214417 ) ) ( not ( = ?auto_2214413 ?auto_2214418 ) ) ( not ( = ?auto_2214413 ?auto_2214419 ) ) ( not ( = ?auto_2214413 ?auto_2214420 ) ) ( not ( = ?auto_2214413 ?auto_2214421 ) ) ( not ( = ?auto_2214413 ?auto_2214422 ) ) ( not ( = ?auto_2214414 ?auto_2214415 ) ) ( not ( = ?auto_2214414 ?auto_2214416 ) ) ( not ( = ?auto_2214414 ?auto_2214417 ) ) ( not ( = ?auto_2214414 ?auto_2214418 ) ) ( not ( = ?auto_2214414 ?auto_2214419 ) ) ( not ( = ?auto_2214414 ?auto_2214420 ) ) ( not ( = ?auto_2214414 ?auto_2214421 ) ) ( not ( = ?auto_2214414 ?auto_2214422 ) ) ( not ( = ?auto_2214415 ?auto_2214416 ) ) ( not ( = ?auto_2214415 ?auto_2214417 ) ) ( not ( = ?auto_2214415 ?auto_2214418 ) ) ( not ( = ?auto_2214415 ?auto_2214419 ) ) ( not ( = ?auto_2214415 ?auto_2214420 ) ) ( not ( = ?auto_2214415 ?auto_2214421 ) ) ( not ( = ?auto_2214415 ?auto_2214422 ) ) ( not ( = ?auto_2214416 ?auto_2214417 ) ) ( not ( = ?auto_2214416 ?auto_2214418 ) ) ( not ( = ?auto_2214416 ?auto_2214419 ) ) ( not ( = ?auto_2214416 ?auto_2214420 ) ) ( not ( = ?auto_2214416 ?auto_2214421 ) ) ( not ( = ?auto_2214416 ?auto_2214422 ) ) ( not ( = ?auto_2214417 ?auto_2214418 ) ) ( not ( = ?auto_2214417 ?auto_2214419 ) ) ( not ( = ?auto_2214417 ?auto_2214420 ) ) ( not ( = ?auto_2214417 ?auto_2214421 ) ) ( not ( = ?auto_2214417 ?auto_2214422 ) ) ( not ( = ?auto_2214418 ?auto_2214419 ) ) ( not ( = ?auto_2214418 ?auto_2214420 ) ) ( not ( = ?auto_2214418 ?auto_2214421 ) ) ( not ( = ?auto_2214418 ?auto_2214422 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2214419 ?auto_2214420 ?auto_2214421 )
      ( MAKE-15CRATE-VERIFY ?auto_2214407 ?auto_2214408 ?auto_2214409 ?auto_2214406 ?auto_2214410 ?auto_2214412 ?auto_2214411 ?auto_2214413 ?auto_2214414 ?auto_2214415 ?auto_2214416 ?auto_2214417 ?auto_2214418 ?auto_2214419 ?auto_2214420 ?auto_2214421 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2214633 - SURFACE
      ?auto_2214634 - SURFACE
      ?auto_2214635 - SURFACE
      ?auto_2214632 - SURFACE
      ?auto_2214636 - SURFACE
      ?auto_2214638 - SURFACE
      ?auto_2214637 - SURFACE
      ?auto_2214639 - SURFACE
      ?auto_2214640 - SURFACE
      ?auto_2214641 - SURFACE
      ?auto_2214642 - SURFACE
      ?auto_2214643 - SURFACE
      ?auto_2214644 - SURFACE
      ?auto_2214645 - SURFACE
      ?auto_2214646 - SURFACE
      ?auto_2214647 - SURFACE
    )
    :vars
    (
      ?auto_2214649 - HOIST
      ?auto_2214648 - PLACE
      ?auto_2214651 - PLACE
      ?auto_2214652 - HOIST
      ?auto_2214650 - SURFACE
      ?auto_2214653 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2214649 ?auto_2214648 ) ( IS-CRATE ?auto_2214647 ) ( not ( = ?auto_2214646 ?auto_2214647 ) ) ( not ( = ?auto_2214645 ?auto_2214646 ) ) ( not ( = ?auto_2214645 ?auto_2214647 ) ) ( not ( = ?auto_2214651 ?auto_2214648 ) ) ( HOIST-AT ?auto_2214652 ?auto_2214651 ) ( not ( = ?auto_2214649 ?auto_2214652 ) ) ( AVAILABLE ?auto_2214652 ) ( SURFACE-AT ?auto_2214647 ?auto_2214651 ) ( ON ?auto_2214647 ?auto_2214650 ) ( CLEAR ?auto_2214647 ) ( not ( = ?auto_2214646 ?auto_2214650 ) ) ( not ( = ?auto_2214647 ?auto_2214650 ) ) ( not ( = ?auto_2214645 ?auto_2214650 ) ) ( TRUCK-AT ?auto_2214653 ?auto_2214648 ) ( SURFACE-AT ?auto_2214645 ?auto_2214648 ) ( CLEAR ?auto_2214645 ) ( IS-CRATE ?auto_2214646 ) ( AVAILABLE ?auto_2214649 ) ( IN ?auto_2214646 ?auto_2214653 ) ( ON ?auto_2214634 ?auto_2214633 ) ( ON ?auto_2214635 ?auto_2214634 ) ( ON ?auto_2214632 ?auto_2214635 ) ( ON ?auto_2214636 ?auto_2214632 ) ( ON ?auto_2214638 ?auto_2214636 ) ( ON ?auto_2214637 ?auto_2214638 ) ( ON ?auto_2214639 ?auto_2214637 ) ( ON ?auto_2214640 ?auto_2214639 ) ( ON ?auto_2214641 ?auto_2214640 ) ( ON ?auto_2214642 ?auto_2214641 ) ( ON ?auto_2214643 ?auto_2214642 ) ( ON ?auto_2214644 ?auto_2214643 ) ( ON ?auto_2214645 ?auto_2214644 ) ( not ( = ?auto_2214633 ?auto_2214634 ) ) ( not ( = ?auto_2214633 ?auto_2214635 ) ) ( not ( = ?auto_2214633 ?auto_2214632 ) ) ( not ( = ?auto_2214633 ?auto_2214636 ) ) ( not ( = ?auto_2214633 ?auto_2214638 ) ) ( not ( = ?auto_2214633 ?auto_2214637 ) ) ( not ( = ?auto_2214633 ?auto_2214639 ) ) ( not ( = ?auto_2214633 ?auto_2214640 ) ) ( not ( = ?auto_2214633 ?auto_2214641 ) ) ( not ( = ?auto_2214633 ?auto_2214642 ) ) ( not ( = ?auto_2214633 ?auto_2214643 ) ) ( not ( = ?auto_2214633 ?auto_2214644 ) ) ( not ( = ?auto_2214633 ?auto_2214645 ) ) ( not ( = ?auto_2214633 ?auto_2214646 ) ) ( not ( = ?auto_2214633 ?auto_2214647 ) ) ( not ( = ?auto_2214633 ?auto_2214650 ) ) ( not ( = ?auto_2214634 ?auto_2214635 ) ) ( not ( = ?auto_2214634 ?auto_2214632 ) ) ( not ( = ?auto_2214634 ?auto_2214636 ) ) ( not ( = ?auto_2214634 ?auto_2214638 ) ) ( not ( = ?auto_2214634 ?auto_2214637 ) ) ( not ( = ?auto_2214634 ?auto_2214639 ) ) ( not ( = ?auto_2214634 ?auto_2214640 ) ) ( not ( = ?auto_2214634 ?auto_2214641 ) ) ( not ( = ?auto_2214634 ?auto_2214642 ) ) ( not ( = ?auto_2214634 ?auto_2214643 ) ) ( not ( = ?auto_2214634 ?auto_2214644 ) ) ( not ( = ?auto_2214634 ?auto_2214645 ) ) ( not ( = ?auto_2214634 ?auto_2214646 ) ) ( not ( = ?auto_2214634 ?auto_2214647 ) ) ( not ( = ?auto_2214634 ?auto_2214650 ) ) ( not ( = ?auto_2214635 ?auto_2214632 ) ) ( not ( = ?auto_2214635 ?auto_2214636 ) ) ( not ( = ?auto_2214635 ?auto_2214638 ) ) ( not ( = ?auto_2214635 ?auto_2214637 ) ) ( not ( = ?auto_2214635 ?auto_2214639 ) ) ( not ( = ?auto_2214635 ?auto_2214640 ) ) ( not ( = ?auto_2214635 ?auto_2214641 ) ) ( not ( = ?auto_2214635 ?auto_2214642 ) ) ( not ( = ?auto_2214635 ?auto_2214643 ) ) ( not ( = ?auto_2214635 ?auto_2214644 ) ) ( not ( = ?auto_2214635 ?auto_2214645 ) ) ( not ( = ?auto_2214635 ?auto_2214646 ) ) ( not ( = ?auto_2214635 ?auto_2214647 ) ) ( not ( = ?auto_2214635 ?auto_2214650 ) ) ( not ( = ?auto_2214632 ?auto_2214636 ) ) ( not ( = ?auto_2214632 ?auto_2214638 ) ) ( not ( = ?auto_2214632 ?auto_2214637 ) ) ( not ( = ?auto_2214632 ?auto_2214639 ) ) ( not ( = ?auto_2214632 ?auto_2214640 ) ) ( not ( = ?auto_2214632 ?auto_2214641 ) ) ( not ( = ?auto_2214632 ?auto_2214642 ) ) ( not ( = ?auto_2214632 ?auto_2214643 ) ) ( not ( = ?auto_2214632 ?auto_2214644 ) ) ( not ( = ?auto_2214632 ?auto_2214645 ) ) ( not ( = ?auto_2214632 ?auto_2214646 ) ) ( not ( = ?auto_2214632 ?auto_2214647 ) ) ( not ( = ?auto_2214632 ?auto_2214650 ) ) ( not ( = ?auto_2214636 ?auto_2214638 ) ) ( not ( = ?auto_2214636 ?auto_2214637 ) ) ( not ( = ?auto_2214636 ?auto_2214639 ) ) ( not ( = ?auto_2214636 ?auto_2214640 ) ) ( not ( = ?auto_2214636 ?auto_2214641 ) ) ( not ( = ?auto_2214636 ?auto_2214642 ) ) ( not ( = ?auto_2214636 ?auto_2214643 ) ) ( not ( = ?auto_2214636 ?auto_2214644 ) ) ( not ( = ?auto_2214636 ?auto_2214645 ) ) ( not ( = ?auto_2214636 ?auto_2214646 ) ) ( not ( = ?auto_2214636 ?auto_2214647 ) ) ( not ( = ?auto_2214636 ?auto_2214650 ) ) ( not ( = ?auto_2214638 ?auto_2214637 ) ) ( not ( = ?auto_2214638 ?auto_2214639 ) ) ( not ( = ?auto_2214638 ?auto_2214640 ) ) ( not ( = ?auto_2214638 ?auto_2214641 ) ) ( not ( = ?auto_2214638 ?auto_2214642 ) ) ( not ( = ?auto_2214638 ?auto_2214643 ) ) ( not ( = ?auto_2214638 ?auto_2214644 ) ) ( not ( = ?auto_2214638 ?auto_2214645 ) ) ( not ( = ?auto_2214638 ?auto_2214646 ) ) ( not ( = ?auto_2214638 ?auto_2214647 ) ) ( not ( = ?auto_2214638 ?auto_2214650 ) ) ( not ( = ?auto_2214637 ?auto_2214639 ) ) ( not ( = ?auto_2214637 ?auto_2214640 ) ) ( not ( = ?auto_2214637 ?auto_2214641 ) ) ( not ( = ?auto_2214637 ?auto_2214642 ) ) ( not ( = ?auto_2214637 ?auto_2214643 ) ) ( not ( = ?auto_2214637 ?auto_2214644 ) ) ( not ( = ?auto_2214637 ?auto_2214645 ) ) ( not ( = ?auto_2214637 ?auto_2214646 ) ) ( not ( = ?auto_2214637 ?auto_2214647 ) ) ( not ( = ?auto_2214637 ?auto_2214650 ) ) ( not ( = ?auto_2214639 ?auto_2214640 ) ) ( not ( = ?auto_2214639 ?auto_2214641 ) ) ( not ( = ?auto_2214639 ?auto_2214642 ) ) ( not ( = ?auto_2214639 ?auto_2214643 ) ) ( not ( = ?auto_2214639 ?auto_2214644 ) ) ( not ( = ?auto_2214639 ?auto_2214645 ) ) ( not ( = ?auto_2214639 ?auto_2214646 ) ) ( not ( = ?auto_2214639 ?auto_2214647 ) ) ( not ( = ?auto_2214639 ?auto_2214650 ) ) ( not ( = ?auto_2214640 ?auto_2214641 ) ) ( not ( = ?auto_2214640 ?auto_2214642 ) ) ( not ( = ?auto_2214640 ?auto_2214643 ) ) ( not ( = ?auto_2214640 ?auto_2214644 ) ) ( not ( = ?auto_2214640 ?auto_2214645 ) ) ( not ( = ?auto_2214640 ?auto_2214646 ) ) ( not ( = ?auto_2214640 ?auto_2214647 ) ) ( not ( = ?auto_2214640 ?auto_2214650 ) ) ( not ( = ?auto_2214641 ?auto_2214642 ) ) ( not ( = ?auto_2214641 ?auto_2214643 ) ) ( not ( = ?auto_2214641 ?auto_2214644 ) ) ( not ( = ?auto_2214641 ?auto_2214645 ) ) ( not ( = ?auto_2214641 ?auto_2214646 ) ) ( not ( = ?auto_2214641 ?auto_2214647 ) ) ( not ( = ?auto_2214641 ?auto_2214650 ) ) ( not ( = ?auto_2214642 ?auto_2214643 ) ) ( not ( = ?auto_2214642 ?auto_2214644 ) ) ( not ( = ?auto_2214642 ?auto_2214645 ) ) ( not ( = ?auto_2214642 ?auto_2214646 ) ) ( not ( = ?auto_2214642 ?auto_2214647 ) ) ( not ( = ?auto_2214642 ?auto_2214650 ) ) ( not ( = ?auto_2214643 ?auto_2214644 ) ) ( not ( = ?auto_2214643 ?auto_2214645 ) ) ( not ( = ?auto_2214643 ?auto_2214646 ) ) ( not ( = ?auto_2214643 ?auto_2214647 ) ) ( not ( = ?auto_2214643 ?auto_2214650 ) ) ( not ( = ?auto_2214644 ?auto_2214645 ) ) ( not ( = ?auto_2214644 ?auto_2214646 ) ) ( not ( = ?auto_2214644 ?auto_2214647 ) ) ( not ( = ?auto_2214644 ?auto_2214650 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2214645 ?auto_2214646 ?auto_2214647 )
      ( MAKE-15CRATE-VERIFY ?auto_2214633 ?auto_2214634 ?auto_2214635 ?auto_2214632 ?auto_2214636 ?auto_2214638 ?auto_2214637 ?auto_2214639 ?auto_2214640 ?auto_2214641 ?auto_2214642 ?auto_2214643 ?auto_2214644 ?auto_2214645 ?auto_2214646 ?auto_2214647 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2231155 - SURFACE
      ?auto_2231156 - SURFACE
    )
    :vars
    (
      ?auto_2231159 - HOIST
      ?auto_2231158 - PLACE
      ?auto_2231157 - SURFACE
      ?auto_2231161 - TRUCK
      ?auto_2231162 - PLACE
      ?auto_2231160 - HOIST
      ?auto_2231163 - SURFACE
      ?auto_2231164 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2231159 ?auto_2231158 ) ( SURFACE-AT ?auto_2231155 ?auto_2231158 ) ( CLEAR ?auto_2231155 ) ( IS-CRATE ?auto_2231156 ) ( not ( = ?auto_2231155 ?auto_2231156 ) ) ( AVAILABLE ?auto_2231159 ) ( ON ?auto_2231155 ?auto_2231157 ) ( not ( = ?auto_2231157 ?auto_2231155 ) ) ( not ( = ?auto_2231157 ?auto_2231156 ) ) ( TRUCK-AT ?auto_2231161 ?auto_2231162 ) ( not ( = ?auto_2231162 ?auto_2231158 ) ) ( HOIST-AT ?auto_2231160 ?auto_2231162 ) ( not ( = ?auto_2231159 ?auto_2231160 ) ) ( SURFACE-AT ?auto_2231156 ?auto_2231162 ) ( ON ?auto_2231156 ?auto_2231163 ) ( CLEAR ?auto_2231156 ) ( not ( = ?auto_2231155 ?auto_2231163 ) ) ( not ( = ?auto_2231156 ?auto_2231163 ) ) ( not ( = ?auto_2231157 ?auto_2231163 ) ) ( LIFTING ?auto_2231160 ?auto_2231164 ) ( IS-CRATE ?auto_2231164 ) ( not ( = ?auto_2231155 ?auto_2231164 ) ) ( not ( = ?auto_2231156 ?auto_2231164 ) ) ( not ( = ?auto_2231157 ?auto_2231164 ) ) ( not ( = ?auto_2231163 ?auto_2231164 ) ) )
    :subtasks
    ( ( !LOAD ?auto_2231160 ?auto_2231164 ?auto_2231161 ?auto_2231162 )
      ( MAKE-1CRATE ?auto_2231155 ?auto_2231156 )
      ( MAKE-1CRATE-VERIFY ?auto_2231155 ?auto_2231156 ) )
  )

  ( :method MAKE-16CRATE
    :parameters
    (
      ?auto_2235168 - SURFACE
      ?auto_2235169 - SURFACE
      ?auto_2235170 - SURFACE
      ?auto_2235167 - SURFACE
      ?auto_2235171 - SURFACE
      ?auto_2235173 - SURFACE
      ?auto_2235172 - SURFACE
      ?auto_2235174 - SURFACE
      ?auto_2235175 - SURFACE
      ?auto_2235176 - SURFACE
      ?auto_2235177 - SURFACE
      ?auto_2235178 - SURFACE
      ?auto_2235179 - SURFACE
      ?auto_2235180 - SURFACE
      ?auto_2235181 - SURFACE
      ?auto_2235182 - SURFACE
      ?auto_2235183 - SURFACE
    )
    :vars
    (
      ?auto_2235185 - HOIST
      ?auto_2235184 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2235185 ?auto_2235184 ) ( SURFACE-AT ?auto_2235182 ?auto_2235184 ) ( CLEAR ?auto_2235182 ) ( LIFTING ?auto_2235185 ?auto_2235183 ) ( IS-CRATE ?auto_2235183 ) ( not ( = ?auto_2235182 ?auto_2235183 ) ) ( ON ?auto_2235169 ?auto_2235168 ) ( ON ?auto_2235170 ?auto_2235169 ) ( ON ?auto_2235167 ?auto_2235170 ) ( ON ?auto_2235171 ?auto_2235167 ) ( ON ?auto_2235173 ?auto_2235171 ) ( ON ?auto_2235172 ?auto_2235173 ) ( ON ?auto_2235174 ?auto_2235172 ) ( ON ?auto_2235175 ?auto_2235174 ) ( ON ?auto_2235176 ?auto_2235175 ) ( ON ?auto_2235177 ?auto_2235176 ) ( ON ?auto_2235178 ?auto_2235177 ) ( ON ?auto_2235179 ?auto_2235178 ) ( ON ?auto_2235180 ?auto_2235179 ) ( ON ?auto_2235181 ?auto_2235180 ) ( ON ?auto_2235182 ?auto_2235181 ) ( not ( = ?auto_2235168 ?auto_2235169 ) ) ( not ( = ?auto_2235168 ?auto_2235170 ) ) ( not ( = ?auto_2235168 ?auto_2235167 ) ) ( not ( = ?auto_2235168 ?auto_2235171 ) ) ( not ( = ?auto_2235168 ?auto_2235173 ) ) ( not ( = ?auto_2235168 ?auto_2235172 ) ) ( not ( = ?auto_2235168 ?auto_2235174 ) ) ( not ( = ?auto_2235168 ?auto_2235175 ) ) ( not ( = ?auto_2235168 ?auto_2235176 ) ) ( not ( = ?auto_2235168 ?auto_2235177 ) ) ( not ( = ?auto_2235168 ?auto_2235178 ) ) ( not ( = ?auto_2235168 ?auto_2235179 ) ) ( not ( = ?auto_2235168 ?auto_2235180 ) ) ( not ( = ?auto_2235168 ?auto_2235181 ) ) ( not ( = ?auto_2235168 ?auto_2235182 ) ) ( not ( = ?auto_2235168 ?auto_2235183 ) ) ( not ( = ?auto_2235169 ?auto_2235170 ) ) ( not ( = ?auto_2235169 ?auto_2235167 ) ) ( not ( = ?auto_2235169 ?auto_2235171 ) ) ( not ( = ?auto_2235169 ?auto_2235173 ) ) ( not ( = ?auto_2235169 ?auto_2235172 ) ) ( not ( = ?auto_2235169 ?auto_2235174 ) ) ( not ( = ?auto_2235169 ?auto_2235175 ) ) ( not ( = ?auto_2235169 ?auto_2235176 ) ) ( not ( = ?auto_2235169 ?auto_2235177 ) ) ( not ( = ?auto_2235169 ?auto_2235178 ) ) ( not ( = ?auto_2235169 ?auto_2235179 ) ) ( not ( = ?auto_2235169 ?auto_2235180 ) ) ( not ( = ?auto_2235169 ?auto_2235181 ) ) ( not ( = ?auto_2235169 ?auto_2235182 ) ) ( not ( = ?auto_2235169 ?auto_2235183 ) ) ( not ( = ?auto_2235170 ?auto_2235167 ) ) ( not ( = ?auto_2235170 ?auto_2235171 ) ) ( not ( = ?auto_2235170 ?auto_2235173 ) ) ( not ( = ?auto_2235170 ?auto_2235172 ) ) ( not ( = ?auto_2235170 ?auto_2235174 ) ) ( not ( = ?auto_2235170 ?auto_2235175 ) ) ( not ( = ?auto_2235170 ?auto_2235176 ) ) ( not ( = ?auto_2235170 ?auto_2235177 ) ) ( not ( = ?auto_2235170 ?auto_2235178 ) ) ( not ( = ?auto_2235170 ?auto_2235179 ) ) ( not ( = ?auto_2235170 ?auto_2235180 ) ) ( not ( = ?auto_2235170 ?auto_2235181 ) ) ( not ( = ?auto_2235170 ?auto_2235182 ) ) ( not ( = ?auto_2235170 ?auto_2235183 ) ) ( not ( = ?auto_2235167 ?auto_2235171 ) ) ( not ( = ?auto_2235167 ?auto_2235173 ) ) ( not ( = ?auto_2235167 ?auto_2235172 ) ) ( not ( = ?auto_2235167 ?auto_2235174 ) ) ( not ( = ?auto_2235167 ?auto_2235175 ) ) ( not ( = ?auto_2235167 ?auto_2235176 ) ) ( not ( = ?auto_2235167 ?auto_2235177 ) ) ( not ( = ?auto_2235167 ?auto_2235178 ) ) ( not ( = ?auto_2235167 ?auto_2235179 ) ) ( not ( = ?auto_2235167 ?auto_2235180 ) ) ( not ( = ?auto_2235167 ?auto_2235181 ) ) ( not ( = ?auto_2235167 ?auto_2235182 ) ) ( not ( = ?auto_2235167 ?auto_2235183 ) ) ( not ( = ?auto_2235171 ?auto_2235173 ) ) ( not ( = ?auto_2235171 ?auto_2235172 ) ) ( not ( = ?auto_2235171 ?auto_2235174 ) ) ( not ( = ?auto_2235171 ?auto_2235175 ) ) ( not ( = ?auto_2235171 ?auto_2235176 ) ) ( not ( = ?auto_2235171 ?auto_2235177 ) ) ( not ( = ?auto_2235171 ?auto_2235178 ) ) ( not ( = ?auto_2235171 ?auto_2235179 ) ) ( not ( = ?auto_2235171 ?auto_2235180 ) ) ( not ( = ?auto_2235171 ?auto_2235181 ) ) ( not ( = ?auto_2235171 ?auto_2235182 ) ) ( not ( = ?auto_2235171 ?auto_2235183 ) ) ( not ( = ?auto_2235173 ?auto_2235172 ) ) ( not ( = ?auto_2235173 ?auto_2235174 ) ) ( not ( = ?auto_2235173 ?auto_2235175 ) ) ( not ( = ?auto_2235173 ?auto_2235176 ) ) ( not ( = ?auto_2235173 ?auto_2235177 ) ) ( not ( = ?auto_2235173 ?auto_2235178 ) ) ( not ( = ?auto_2235173 ?auto_2235179 ) ) ( not ( = ?auto_2235173 ?auto_2235180 ) ) ( not ( = ?auto_2235173 ?auto_2235181 ) ) ( not ( = ?auto_2235173 ?auto_2235182 ) ) ( not ( = ?auto_2235173 ?auto_2235183 ) ) ( not ( = ?auto_2235172 ?auto_2235174 ) ) ( not ( = ?auto_2235172 ?auto_2235175 ) ) ( not ( = ?auto_2235172 ?auto_2235176 ) ) ( not ( = ?auto_2235172 ?auto_2235177 ) ) ( not ( = ?auto_2235172 ?auto_2235178 ) ) ( not ( = ?auto_2235172 ?auto_2235179 ) ) ( not ( = ?auto_2235172 ?auto_2235180 ) ) ( not ( = ?auto_2235172 ?auto_2235181 ) ) ( not ( = ?auto_2235172 ?auto_2235182 ) ) ( not ( = ?auto_2235172 ?auto_2235183 ) ) ( not ( = ?auto_2235174 ?auto_2235175 ) ) ( not ( = ?auto_2235174 ?auto_2235176 ) ) ( not ( = ?auto_2235174 ?auto_2235177 ) ) ( not ( = ?auto_2235174 ?auto_2235178 ) ) ( not ( = ?auto_2235174 ?auto_2235179 ) ) ( not ( = ?auto_2235174 ?auto_2235180 ) ) ( not ( = ?auto_2235174 ?auto_2235181 ) ) ( not ( = ?auto_2235174 ?auto_2235182 ) ) ( not ( = ?auto_2235174 ?auto_2235183 ) ) ( not ( = ?auto_2235175 ?auto_2235176 ) ) ( not ( = ?auto_2235175 ?auto_2235177 ) ) ( not ( = ?auto_2235175 ?auto_2235178 ) ) ( not ( = ?auto_2235175 ?auto_2235179 ) ) ( not ( = ?auto_2235175 ?auto_2235180 ) ) ( not ( = ?auto_2235175 ?auto_2235181 ) ) ( not ( = ?auto_2235175 ?auto_2235182 ) ) ( not ( = ?auto_2235175 ?auto_2235183 ) ) ( not ( = ?auto_2235176 ?auto_2235177 ) ) ( not ( = ?auto_2235176 ?auto_2235178 ) ) ( not ( = ?auto_2235176 ?auto_2235179 ) ) ( not ( = ?auto_2235176 ?auto_2235180 ) ) ( not ( = ?auto_2235176 ?auto_2235181 ) ) ( not ( = ?auto_2235176 ?auto_2235182 ) ) ( not ( = ?auto_2235176 ?auto_2235183 ) ) ( not ( = ?auto_2235177 ?auto_2235178 ) ) ( not ( = ?auto_2235177 ?auto_2235179 ) ) ( not ( = ?auto_2235177 ?auto_2235180 ) ) ( not ( = ?auto_2235177 ?auto_2235181 ) ) ( not ( = ?auto_2235177 ?auto_2235182 ) ) ( not ( = ?auto_2235177 ?auto_2235183 ) ) ( not ( = ?auto_2235178 ?auto_2235179 ) ) ( not ( = ?auto_2235178 ?auto_2235180 ) ) ( not ( = ?auto_2235178 ?auto_2235181 ) ) ( not ( = ?auto_2235178 ?auto_2235182 ) ) ( not ( = ?auto_2235178 ?auto_2235183 ) ) ( not ( = ?auto_2235179 ?auto_2235180 ) ) ( not ( = ?auto_2235179 ?auto_2235181 ) ) ( not ( = ?auto_2235179 ?auto_2235182 ) ) ( not ( = ?auto_2235179 ?auto_2235183 ) ) ( not ( = ?auto_2235180 ?auto_2235181 ) ) ( not ( = ?auto_2235180 ?auto_2235182 ) ) ( not ( = ?auto_2235180 ?auto_2235183 ) ) ( not ( = ?auto_2235181 ?auto_2235182 ) ) ( not ( = ?auto_2235181 ?auto_2235183 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2235182 ?auto_2235183 )
      ( MAKE-16CRATE-VERIFY ?auto_2235168 ?auto_2235169 ?auto_2235170 ?auto_2235167 ?auto_2235171 ?auto_2235173 ?auto_2235172 ?auto_2235174 ?auto_2235175 ?auto_2235176 ?auto_2235177 ?auto_2235178 ?auto_2235179 ?auto_2235180 ?auto_2235181 ?auto_2235182 ?auto_2235183 ) )
  )

  ( :method MAKE-16CRATE
    :parameters
    (
      ?auto_2235367 - SURFACE
      ?auto_2235368 - SURFACE
      ?auto_2235369 - SURFACE
      ?auto_2235366 - SURFACE
      ?auto_2235370 - SURFACE
      ?auto_2235372 - SURFACE
      ?auto_2235371 - SURFACE
      ?auto_2235373 - SURFACE
      ?auto_2235374 - SURFACE
      ?auto_2235375 - SURFACE
      ?auto_2235376 - SURFACE
      ?auto_2235377 - SURFACE
      ?auto_2235378 - SURFACE
      ?auto_2235379 - SURFACE
      ?auto_2235380 - SURFACE
      ?auto_2235381 - SURFACE
      ?auto_2235382 - SURFACE
    )
    :vars
    (
      ?auto_2235385 - HOIST
      ?auto_2235383 - PLACE
      ?auto_2235384 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2235385 ?auto_2235383 ) ( SURFACE-AT ?auto_2235381 ?auto_2235383 ) ( CLEAR ?auto_2235381 ) ( IS-CRATE ?auto_2235382 ) ( not ( = ?auto_2235381 ?auto_2235382 ) ) ( TRUCK-AT ?auto_2235384 ?auto_2235383 ) ( AVAILABLE ?auto_2235385 ) ( IN ?auto_2235382 ?auto_2235384 ) ( ON ?auto_2235381 ?auto_2235380 ) ( not ( = ?auto_2235380 ?auto_2235381 ) ) ( not ( = ?auto_2235380 ?auto_2235382 ) ) ( ON ?auto_2235368 ?auto_2235367 ) ( ON ?auto_2235369 ?auto_2235368 ) ( ON ?auto_2235366 ?auto_2235369 ) ( ON ?auto_2235370 ?auto_2235366 ) ( ON ?auto_2235372 ?auto_2235370 ) ( ON ?auto_2235371 ?auto_2235372 ) ( ON ?auto_2235373 ?auto_2235371 ) ( ON ?auto_2235374 ?auto_2235373 ) ( ON ?auto_2235375 ?auto_2235374 ) ( ON ?auto_2235376 ?auto_2235375 ) ( ON ?auto_2235377 ?auto_2235376 ) ( ON ?auto_2235378 ?auto_2235377 ) ( ON ?auto_2235379 ?auto_2235378 ) ( ON ?auto_2235380 ?auto_2235379 ) ( not ( = ?auto_2235367 ?auto_2235368 ) ) ( not ( = ?auto_2235367 ?auto_2235369 ) ) ( not ( = ?auto_2235367 ?auto_2235366 ) ) ( not ( = ?auto_2235367 ?auto_2235370 ) ) ( not ( = ?auto_2235367 ?auto_2235372 ) ) ( not ( = ?auto_2235367 ?auto_2235371 ) ) ( not ( = ?auto_2235367 ?auto_2235373 ) ) ( not ( = ?auto_2235367 ?auto_2235374 ) ) ( not ( = ?auto_2235367 ?auto_2235375 ) ) ( not ( = ?auto_2235367 ?auto_2235376 ) ) ( not ( = ?auto_2235367 ?auto_2235377 ) ) ( not ( = ?auto_2235367 ?auto_2235378 ) ) ( not ( = ?auto_2235367 ?auto_2235379 ) ) ( not ( = ?auto_2235367 ?auto_2235380 ) ) ( not ( = ?auto_2235367 ?auto_2235381 ) ) ( not ( = ?auto_2235367 ?auto_2235382 ) ) ( not ( = ?auto_2235368 ?auto_2235369 ) ) ( not ( = ?auto_2235368 ?auto_2235366 ) ) ( not ( = ?auto_2235368 ?auto_2235370 ) ) ( not ( = ?auto_2235368 ?auto_2235372 ) ) ( not ( = ?auto_2235368 ?auto_2235371 ) ) ( not ( = ?auto_2235368 ?auto_2235373 ) ) ( not ( = ?auto_2235368 ?auto_2235374 ) ) ( not ( = ?auto_2235368 ?auto_2235375 ) ) ( not ( = ?auto_2235368 ?auto_2235376 ) ) ( not ( = ?auto_2235368 ?auto_2235377 ) ) ( not ( = ?auto_2235368 ?auto_2235378 ) ) ( not ( = ?auto_2235368 ?auto_2235379 ) ) ( not ( = ?auto_2235368 ?auto_2235380 ) ) ( not ( = ?auto_2235368 ?auto_2235381 ) ) ( not ( = ?auto_2235368 ?auto_2235382 ) ) ( not ( = ?auto_2235369 ?auto_2235366 ) ) ( not ( = ?auto_2235369 ?auto_2235370 ) ) ( not ( = ?auto_2235369 ?auto_2235372 ) ) ( not ( = ?auto_2235369 ?auto_2235371 ) ) ( not ( = ?auto_2235369 ?auto_2235373 ) ) ( not ( = ?auto_2235369 ?auto_2235374 ) ) ( not ( = ?auto_2235369 ?auto_2235375 ) ) ( not ( = ?auto_2235369 ?auto_2235376 ) ) ( not ( = ?auto_2235369 ?auto_2235377 ) ) ( not ( = ?auto_2235369 ?auto_2235378 ) ) ( not ( = ?auto_2235369 ?auto_2235379 ) ) ( not ( = ?auto_2235369 ?auto_2235380 ) ) ( not ( = ?auto_2235369 ?auto_2235381 ) ) ( not ( = ?auto_2235369 ?auto_2235382 ) ) ( not ( = ?auto_2235366 ?auto_2235370 ) ) ( not ( = ?auto_2235366 ?auto_2235372 ) ) ( not ( = ?auto_2235366 ?auto_2235371 ) ) ( not ( = ?auto_2235366 ?auto_2235373 ) ) ( not ( = ?auto_2235366 ?auto_2235374 ) ) ( not ( = ?auto_2235366 ?auto_2235375 ) ) ( not ( = ?auto_2235366 ?auto_2235376 ) ) ( not ( = ?auto_2235366 ?auto_2235377 ) ) ( not ( = ?auto_2235366 ?auto_2235378 ) ) ( not ( = ?auto_2235366 ?auto_2235379 ) ) ( not ( = ?auto_2235366 ?auto_2235380 ) ) ( not ( = ?auto_2235366 ?auto_2235381 ) ) ( not ( = ?auto_2235366 ?auto_2235382 ) ) ( not ( = ?auto_2235370 ?auto_2235372 ) ) ( not ( = ?auto_2235370 ?auto_2235371 ) ) ( not ( = ?auto_2235370 ?auto_2235373 ) ) ( not ( = ?auto_2235370 ?auto_2235374 ) ) ( not ( = ?auto_2235370 ?auto_2235375 ) ) ( not ( = ?auto_2235370 ?auto_2235376 ) ) ( not ( = ?auto_2235370 ?auto_2235377 ) ) ( not ( = ?auto_2235370 ?auto_2235378 ) ) ( not ( = ?auto_2235370 ?auto_2235379 ) ) ( not ( = ?auto_2235370 ?auto_2235380 ) ) ( not ( = ?auto_2235370 ?auto_2235381 ) ) ( not ( = ?auto_2235370 ?auto_2235382 ) ) ( not ( = ?auto_2235372 ?auto_2235371 ) ) ( not ( = ?auto_2235372 ?auto_2235373 ) ) ( not ( = ?auto_2235372 ?auto_2235374 ) ) ( not ( = ?auto_2235372 ?auto_2235375 ) ) ( not ( = ?auto_2235372 ?auto_2235376 ) ) ( not ( = ?auto_2235372 ?auto_2235377 ) ) ( not ( = ?auto_2235372 ?auto_2235378 ) ) ( not ( = ?auto_2235372 ?auto_2235379 ) ) ( not ( = ?auto_2235372 ?auto_2235380 ) ) ( not ( = ?auto_2235372 ?auto_2235381 ) ) ( not ( = ?auto_2235372 ?auto_2235382 ) ) ( not ( = ?auto_2235371 ?auto_2235373 ) ) ( not ( = ?auto_2235371 ?auto_2235374 ) ) ( not ( = ?auto_2235371 ?auto_2235375 ) ) ( not ( = ?auto_2235371 ?auto_2235376 ) ) ( not ( = ?auto_2235371 ?auto_2235377 ) ) ( not ( = ?auto_2235371 ?auto_2235378 ) ) ( not ( = ?auto_2235371 ?auto_2235379 ) ) ( not ( = ?auto_2235371 ?auto_2235380 ) ) ( not ( = ?auto_2235371 ?auto_2235381 ) ) ( not ( = ?auto_2235371 ?auto_2235382 ) ) ( not ( = ?auto_2235373 ?auto_2235374 ) ) ( not ( = ?auto_2235373 ?auto_2235375 ) ) ( not ( = ?auto_2235373 ?auto_2235376 ) ) ( not ( = ?auto_2235373 ?auto_2235377 ) ) ( not ( = ?auto_2235373 ?auto_2235378 ) ) ( not ( = ?auto_2235373 ?auto_2235379 ) ) ( not ( = ?auto_2235373 ?auto_2235380 ) ) ( not ( = ?auto_2235373 ?auto_2235381 ) ) ( not ( = ?auto_2235373 ?auto_2235382 ) ) ( not ( = ?auto_2235374 ?auto_2235375 ) ) ( not ( = ?auto_2235374 ?auto_2235376 ) ) ( not ( = ?auto_2235374 ?auto_2235377 ) ) ( not ( = ?auto_2235374 ?auto_2235378 ) ) ( not ( = ?auto_2235374 ?auto_2235379 ) ) ( not ( = ?auto_2235374 ?auto_2235380 ) ) ( not ( = ?auto_2235374 ?auto_2235381 ) ) ( not ( = ?auto_2235374 ?auto_2235382 ) ) ( not ( = ?auto_2235375 ?auto_2235376 ) ) ( not ( = ?auto_2235375 ?auto_2235377 ) ) ( not ( = ?auto_2235375 ?auto_2235378 ) ) ( not ( = ?auto_2235375 ?auto_2235379 ) ) ( not ( = ?auto_2235375 ?auto_2235380 ) ) ( not ( = ?auto_2235375 ?auto_2235381 ) ) ( not ( = ?auto_2235375 ?auto_2235382 ) ) ( not ( = ?auto_2235376 ?auto_2235377 ) ) ( not ( = ?auto_2235376 ?auto_2235378 ) ) ( not ( = ?auto_2235376 ?auto_2235379 ) ) ( not ( = ?auto_2235376 ?auto_2235380 ) ) ( not ( = ?auto_2235376 ?auto_2235381 ) ) ( not ( = ?auto_2235376 ?auto_2235382 ) ) ( not ( = ?auto_2235377 ?auto_2235378 ) ) ( not ( = ?auto_2235377 ?auto_2235379 ) ) ( not ( = ?auto_2235377 ?auto_2235380 ) ) ( not ( = ?auto_2235377 ?auto_2235381 ) ) ( not ( = ?auto_2235377 ?auto_2235382 ) ) ( not ( = ?auto_2235378 ?auto_2235379 ) ) ( not ( = ?auto_2235378 ?auto_2235380 ) ) ( not ( = ?auto_2235378 ?auto_2235381 ) ) ( not ( = ?auto_2235378 ?auto_2235382 ) ) ( not ( = ?auto_2235379 ?auto_2235380 ) ) ( not ( = ?auto_2235379 ?auto_2235381 ) ) ( not ( = ?auto_2235379 ?auto_2235382 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2235380 ?auto_2235381 ?auto_2235382 )
      ( MAKE-16CRATE-VERIFY ?auto_2235367 ?auto_2235368 ?auto_2235369 ?auto_2235366 ?auto_2235370 ?auto_2235372 ?auto_2235371 ?auto_2235373 ?auto_2235374 ?auto_2235375 ?auto_2235376 ?auto_2235377 ?auto_2235378 ?auto_2235379 ?auto_2235380 ?auto_2235381 ?auto_2235382 ) )
  )

  ( :method MAKE-16CRATE
    :parameters
    (
      ?auto_2235583 - SURFACE
      ?auto_2235584 - SURFACE
      ?auto_2235585 - SURFACE
      ?auto_2235582 - SURFACE
      ?auto_2235586 - SURFACE
      ?auto_2235588 - SURFACE
      ?auto_2235587 - SURFACE
      ?auto_2235589 - SURFACE
      ?auto_2235590 - SURFACE
      ?auto_2235591 - SURFACE
      ?auto_2235592 - SURFACE
      ?auto_2235593 - SURFACE
      ?auto_2235594 - SURFACE
      ?auto_2235595 - SURFACE
      ?auto_2235596 - SURFACE
      ?auto_2235597 - SURFACE
      ?auto_2235598 - SURFACE
    )
    :vars
    (
      ?auto_2235601 - HOIST
      ?auto_2235599 - PLACE
      ?auto_2235602 - TRUCK
      ?auto_2235600 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2235601 ?auto_2235599 ) ( SURFACE-AT ?auto_2235597 ?auto_2235599 ) ( CLEAR ?auto_2235597 ) ( IS-CRATE ?auto_2235598 ) ( not ( = ?auto_2235597 ?auto_2235598 ) ) ( AVAILABLE ?auto_2235601 ) ( IN ?auto_2235598 ?auto_2235602 ) ( ON ?auto_2235597 ?auto_2235596 ) ( not ( = ?auto_2235596 ?auto_2235597 ) ) ( not ( = ?auto_2235596 ?auto_2235598 ) ) ( TRUCK-AT ?auto_2235602 ?auto_2235600 ) ( not ( = ?auto_2235600 ?auto_2235599 ) ) ( ON ?auto_2235584 ?auto_2235583 ) ( ON ?auto_2235585 ?auto_2235584 ) ( ON ?auto_2235582 ?auto_2235585 ) ( ON ?auto_2235586 ?auto_2235582 ) ( ON ?auto_2235588 ?auto_2235586 ) ( ON ?auto_2235587 ?auto_2235588 ) ( ON ?auto_2235589 ?auto_2235587 ) ( ON ?auto_2235590 ?auto_2235589 ) ( ON ?auto_2235591 ?auto_2235590 ) ( ON ?auto_2235592 ?auto_2235591 ) ( ON ?auto_2235593 ?auto_2235592 ) ( ON ?auto_2235594 ?auto_2235593 ) ( ON ?auto_2235595 ?auto_2235594 ) ( ON ?auto_2235596 ?auto_2235595 ) ( not ( = ?auto_2235583 ?auto_2235584 ) ) ( not ( = ?auto_2235583 ?auto_2235585 ) ) ( not ( = ?auto_2235583 ?auto_2235582 ) ) ( not ( = ?auto_2235583 ?auto_2235586 ) ) ( not ( = ?auto_2235583 ?auto_2235588 ) ) ( not ( = ?auto_2235583 ?auto_2235587 ) ) ( not ( = ?auto_2235583 ?auto_2235589 ) ) ( not ( = ?auto_2235583 ?auto_2235590 ) ) ( not ( = ?auto_2235583 ?auto_2235591 ) ) ( not ( = ?auto_2235583 ?auto_2235592 ) ) ( not ( = ?auto_2235583 ?auto_2235593 ) ) ( not ( = ?auto_2235583 ?auto_2235594 ) ) ( not ( = ?auto_2235583 ?auto_2235595 ) ) ( not ( = ?auto_2235583 ?auto_2235596 ) ) ( not ( = ?auto_2235583 ?auto_2235597 ) ) ( not ( = ?auto_2235583 ?auto_2235598 ) ) ( not ( = ?auto_2235584 ?auto_2235585 ) ) ( not ( = ?auto_2235584 ?auto_2235582 ) ) ( not ( = ?auto_2235584 ?auto_2235586 ) ) ( not ( = ?auto_2235584 ?auto_2235588 ) ) ( not ( = ?auto_2235584 ?auto_2235587 ) ) ( not ( = ?auto_2235584 ?auto_2235589 ) ) ( not ( = ?auto_2235584 ?auto_2235590 ) ) ( not ( = ?auto_2235584 ?auto_2235591 ) ) ( not ( = ?auto_2235584 ?auto_2235592 ) ) ( not ( = ?auto_2235584 ?auto_2235593 ) ) ( not ( = ?auto_2235584 ?auto_2235594 ) ) ( not ( = ?auto_2235584 ?auto_2235595 ) ) ( not ( = ?auto_2235584 ?auto_2235596 ) ) ( not ( = ?auto_2235584 ?auto_2235597 ) ) ( not ( = ?auto_2235584 ?auto_2235598 ) ) ( not ( = ?auto_2235585 ?auto_2235582 ) ) ( not ( = ?auto_2235585 ?auto_2235586 ) ) ( not ( = ?auto_2235585 ?auto_2235588 ) ) ( not ( = ?auto_2235585 ?auto_2235587 ) ) ( not ( = ?auto_2235585 ?auto_2235589 ) ) ( not ( = ?auto_2235585 ?auto_2235590 ) ) ( not ( = ?auto_2235585 ?auto_2235591 ) ) ( not ( = ?auto_2235585 ?auto_2235592 ) ) ( not ( = ?auto_2235585 ?auto_2235593 ) ) ( not ( = ?auto_2235585 ?auto_2235594 ) ) ( not ( = ?auto_2235585 ?auto_2235595 ) ) ( not ( = ?auto_2235585 ?auto_2235596 ) ) ( not ( = ?auto_2235585 ?auto_2235597 ) ) ( not ( = ?auto_2235585 ?auto_2235598 ) ) ( not ( = ?auto_2235582 ?auto_2235586 ) ) ( not ( = ?auto_2235582 ?auto_2235588 ) ) ( not ( = ?auto_2235582 ?auto_2235587 ) ) ( not ( = ?auto_2235582 ?auto_2235589 ) ) ( not ( = ?auto_2235582 ?auto_2235590 ) ) ( not ( = ?auto_2235582 ?auto_2235591 ) ) ( not ( = ?auto_2235582 ?auto_2235592 ) ) ( not ( = ?auto_2235582 ?auto_2235593 ) ) ( not ( = ?auto_2235582 ?auto_2235594 ) ) ( not ( = ?auto_2235582 ?auto_2235595 ) ) ( not ( = ?auto_2235582 ?auto_2235596 ) ) ( not ( = ?auto_2235582 ?auto_2235597 ) ) ( not ( = ?auto_2235582 ?auto_2235598 ) ) ( not ( = ?auto_2235586 ?auto_2235588 ) ) ( not ( = ?auto_2235586 ?auto_2235587 ) ) ( not ( = ?auto_2235586 ?auto_2235589 ) ) ( not ( = ?auto_2235586 ?auto_2235590 ) ) ( not ( = ?auto_2235586 ?auto_2235591 ) ) ( not ( = ?auto_2235586 ?auto_2235592 ) ) ( not ( = ?auto_2235586 ?auto_2235593 ) ) ( not ( = ?auto_2235586 ?auto_2235594 ) ) ( not ( = ?auto_2235586 ?auto_2235595 ) ) ( not ( = ?auto_2235586 ?auto_2235596 ) ) ( not ( = ?auto_2235586 ?auto_2235597 ) ) ( not ( = ?auto_2235586 ?auto_2235598 ) ) ( not ( = ?auto_2235588 ?auto_2235587 ) ) ( not ( = ?auto_2235588 ?auto_2235589 ) ) ( not ( = ?auto_2235588 ?auto_2235590 ) ) ( not ( = ?auto_2235588 ?auto_2235591 ) ) ( not ( = ?auto_2235588 ?auto_2235592 ) ) ( not ( = ?auto_2235588 ?auto_2235593 ) ) ( not ( = ?auto_2235588 ?auto_2235594 ) ) ( not ( = ?auto_2235588 ?auto_2235595 ) ) ( not ( = ?auto_2235588 ?auto_2235596 ) ) ( not ( = ?auto_2235588 ?auto_2235597 ) ) ( not ( = ?auto_2235588 ?auto_2235598 ) ) ( not ( = ?auto_2235587 ?auto_2235589 ) ) ( not ( = ?auto_2235587 ?auto_2235590 ) ) ( not ( = ?auto_2235587 ?auto_2235591 ) ) ( not ( = ?auto_2235587 ?auto_2235592 ) ) ( not ( = ?auto_2235587 ?auto_2235593 ) ) ( not ( = ?auto_2235587 ?auto_2235594 ) ) ( not ( = ?auto_2235587 ?auto_2235595 ) ) ( not ( = ?auto_2235587 ?auto_2235596 ) ) ( not ( = ?auto_2235587 ?auto_2235597 ) ) ( not ( = ?auto_2235587 ?auto_2235598 ) ) ( not ( = ?auto_2235589 ?auto_2235590 ) ) ( not ( = ?auto_2235589 ?auto_2235591 ) ) ( not ( = ?auto_2235589 ?auto_2235592 ) ) ( not ( = ?auto_2235589 ?auto_2235593 ) ) ( not ( = ?auto_2235589 ?auto_2235594 ) ) ( not ( = ?auto_2235589 ?auto_2235595 ) ) ( not ( = ?auto_2235589 ?auto_2235596 ) ) ( not ( = ?auto_2235589 ?auto_2235597 ) ) ( not ( = ?auto_2235589 ?auto_2235598 ) ) ( not ( = ?auto_2235590 ?auto_2235591 ) ) ( not ( = ?auto_2235590 ?auto_2235592 ) ) ( not ( = ?auto_2235590 ?auto_2235593 ) ) ( not ( = ?auto_2235590 ?auto_2235594 ) ) ( not ( = ?auto_2235590 ?auto_2235595 ) ) ( not ( = ?auto_2235590 ?auto_2235596 ) ) ( not ( = ?auto_2235590 ?auto_2235597 ) ) ( not ( = ?auto_2235590 ?auto_2235598 ) ) ( not ( = ?auto_2235591 ?auto_2235592 ) ) ( not ( = ?auto_2235591 ?auto_2235593 ) ) ( not ( = ?auto_2235591 ?auto_2235594 ) ) ( not ( = ?auto_2235591 ?auto_2235595 ) ) ( not ( = ?auto_2235591 ?auto_2235596 ) ) ( not ( = ?auto_2235591 ?auto_2235597 ) ) ( not ( = ?auto_2235591 ?auto_2235598 ) ) ( not ( = ?auto_2235592 ?auto_2235593 ) ) ( not ( = ?auto_2235592 ?auto_2235594 ) ) ( not ( = ?auto_2235592 ?auto_2235595 ) ) ( not ( = ?auto_2235592 ?auto_2235596 ) ) ( not ( = ?auto_2235592 ?auto_2235597 ) ) ( not ( = ?auto_2235592 ?auto_2235598 ) ) ( not ( = ?auto_2235593 ?auto_2235594 ) ) ( not ( = ?auto_2235593 ?auto_2235595 ) ) ( not ( = ?auto_2235593 ?auto_2235596 ) ) ( not ( = ?auto_2235593 ?auto_2235597 ) ) ( not ( = ?auto_2235593 ?auto_2235598 ) ) ( not ( = ?auto_2235594 ?auto_2235595 ) ) ( not ( = ?auto_2235594 ?auto_2235596 ) ) ( not ( = ?auto_2235594 ?auto_2235597 ) ) ( not ( = ?auto_2235594 ?auto_2235598 ) ) ( not ( = ?auto_2235595 ?auto_2235596 ) ) ( not ( = ?auto_2235595 ?auto_2235597 ) ) ( not ( = ?auto_2235595 ?auto_2235598 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2235596 ?auto_2235597 ?auto_2235598 )
      ( MAKE-16CRATE-VERIFY ?auto_2235583 ?auto_2235584 ?auto_2235585 ?auto_2235582 ?auto_2235586 ?auto_2235588 ?auto_2235587 ?auto_2235589 ?auto_2235590 ?auto_2235591 ?auto_2235592 ?auto_2235593 ?auto_2235594 ?auto_2235595 ?auto_2235596 ?auto_2235597 ?auto_2235598 ) )
  )

  ( :method MAKE-16CRATE
    :parameters
    (
      ?auto_2235815 - SURFACE
      ?auto_2235816 - SURFACE
      ?auto_2235817 - SURFACE
      ?auto_2235814 - SURFACE
      ?auto_2235818 - SURFACE
      ?auto_2235820 - SURFACE
      ?auto_2235819 - SURFACE
      ?auto_2235821 - SURFACE
      ?auto_2235822 - SURFACE
      ?auto_2235823 - SURFACE
      ?auto_2235824 - SURFACE
      ?auto_2235825 - SURFACE
      ?auto_2235826 - SURFACE
      ?auto_2235827 - SURFACE
      ?auto_2235828 - SURFACE
      ?auto_2235829 - SURFACE
      ?auto_2235830 - SURFACE
    )
    :vars
    (
      ?auto_2235835 - HOIST
      ?auto_2235831 - PLACE
      ?auto_2235834 - TRUCK
      ?auto_2235832 - PLACE
      ?auto_2235833 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2235835 ?auto_2235831 ) ( SURFACE-AT ?auto_2235829 ?auto_2235831 ) ( CLEAR ?auto_2235829 ) ( IS-CRATE ?auto_2235830 ) ( not ( = ?auto_2235829 ?auto_2235830 ) ) ( AVAILABLE ?auto_2235835 ) ( ON ?auto_2235829 ?auto_2235828 ) ( not ( = ?auto_2235828 ?auto_2235829 ) ) ( not ( = ?auto_2235828 ?auto_2235830 ) ) ( TRUCK-AT ?auto_2235834 ?auto_2235832 ) ( not ( = ?auto_2235832 ?auto_2235831 ) ) ( HOIST-AT ?auto_2235833 ?auto_2235832 ) ( LIFTING ?auto_2235833 ?auto_2235830 ) ( not ( = ?auto_2235835 ?auto_2235833 ) ) ( ON ?auto_2235816 ?auto_2235815 ) ( ON ?auto_2235817 ?auto_2235816 ) ( ON ?auto_2235814 ?auto_2235817 ) ( ON ?auto_2235818 ?auto_2235814 ) ( ON ?auto_2235820 ?auto_2235818 ) ( ON ?auto_2235819 ?auto_2235820 ) ( ON ?auto_2235821 ?auto_2235819 ) ( ON ?auto_2235822 ?auto_2235821 ) ( ON ?auto_2235823 ?auto_2235822 ) ( ON ?auto_2235824 ?auto_2235823 ) ( ON ?auto_2235825 ?auto_2235824 ) ( ON ?auto_2235826 ?auto_2235825 ) ( ON ?auto_2235827 ?auto_2235826 ) ( ON ?auto_2235828 ?auto_2235827 ) ( not ( = ?auto_2235815 ?auto_2235816 ) ) ( not ( = ?auto_2235815 ?auto_2235817 ) ) ( not ( = ?auto_2235815 ?auto_2235814 ) ) ( not ( = ?auto_2235815 ?auto_2235818 ) ) ( not ( = ?auto_2235815 ?auto_2235820 ) ) ( not ( = ?auto_2235815 ?auto_2235819 ) ) ( not ( = ?auto_2235815 ?auto_2235821 ) ) ( not ( = ?auto_2235815 ?auto_2235822 ) ) ( not ( = ?auto_2235815 ?auto_2235823 ) ) ( not ( = ?auto_2235815 ?auto_2235824 ) ) ( not ( = ?auto_2235815 ?auto_2235825 ) ) ( not ( = ?auto_2235815 ?auto_2235826 ) ) ( not ( = ?auto_2235815 ?auto_2235827 ) ) ( not ( = ?auto_2235815 ?auto_2235828 ) ) ( not ( = ?auto_2235815 ?auto_2235829 ) ) ( not ( = ?auto_2235815 ?auto_2235830 ) ) ( not ( = ?auto_2235816 ?auto_2235817 ) ) ( not ( = ?auto_2235816 ?auto_2235814 ) ) ( not ( = ?auto_2235816 ?auto_2235818 ) ) ( not ( = ?auto_2235816 ?auto_2235820 ) ) ( not ( = ?auto_2235816 ?auto_2235819 ) ) ( not ( = ?auto_2235816 ?auto_2235821 ) ) ( not ( = ?auto_2235816 ?auto_2235822 ) ) ( not ( = ?auto_2235816 ?auto_2235823 ) ) ( not ( = ?auto_2235816 ?auto_2235824 ) ) ( not ( = ?auto_2235816 ?auto_2235825 ) ) ( not ( = ?auto_2235816 ?auto_2235826 ) ) ( not ( = ?auto_2235816 ?auto_2235827 ) ) ( not ( = ?auto_2235816 ?auto_2235828 ) ) ( not ( = ?auto_2235816 ?auto_2235829 ) ) ( not ( = ?auto_2235816 ?auto_2235830 ) ) ( not ( = ?auto_2235817 ?auto_2235814 ) ) ( not ( = ?auto_2235817 ?auto_2235818 ) ) ( not ( = ?auto_2235817 ?auto_2235820 ) ) ( not ( = ?auto_2235817 ?auto_2235819 ) ) ( not ( = ?auto_2235817 ?auto_2235821 ) ) ( not ( = ?auto_2235817 ?auto_2235822 ) ) ( not ( = ?auto_2235817 ?auto_2235823 ) ) ( not ( = ?auto_2235817 ?auto_2235824 ) ) ( not ( = ?auto_2235817 ?auto_2235825 ) ) ( not ( = ?auto_2235817 ?auto_2235826 ) ) ( not ( = ?auto_2235817 ?auto_2235827 ) ) ( not ( = ?auto_2235817 ?auto_2235828 ) ) ( not ( = ?auto_2235817 ?auto_2235829 ) ) ( not ( = ?auto_2235817 ?auto_2235830 ) ) ( not ( = ?auto_2235814 ?auto_2235818 ) ) ( not ( = ?auto_2235814 ?auto_2235820 ) ) ( not ( = ?auto_2235814 ?auto_2235819 ) ) ( not ( = ?auto_2235814 ?auto_2235821 ) ) ( not ( = ?auto_2235814 ?auto_2235822 ) ) ( not ( = ?auto_2235814 ?auto_2235823 ) ) ( not ( = ?auto_2235814 ?auto_2235824 ) ) ( not ( = ?auto_2235814 ?auto_2235825 ) ) ( not ( = ?auto_2235814 ?auto_2235826 ) ) ( not ( = ?auto_2235814 ?auto_2235827 ) ) ( not ( = ?auto_2235814 ?auto_2235828 ) ) ( not ( = ?auto_2235814 ?auto_2235829 ) ) ( not ( = ?auto_2235814 ?auto_2235830 ) ) ( not ( = ?auto_2235818 ?auto_2235820 ) ) ( not ( = ?auto_2235818 ?auto_2235819 ) ) ( not ( = ?auto_2235818 ?auto_2235821 ) ) ( not ( = ?auto_2235818 ?auto_2235822 ) ) ( not ( = ?auto_2235818 ?auto_2235823 ) ) ( not ( = ?auto_2235818 ?auto_2235824 ) ) ( not ( = ?auto_2235818 ?auto_2235825 ) ) ( not ( = ?auto_2235818 ?auto_2235826 ) ) ( not ( = ?auto_2235818 ?auto_2235827 ) ) ( not ( = ?auto_2235818 ?auto_2235828 ) ) ( not ( = ?auto_2235818 ?auto_2235829 ) ) ( not ( = ?auto_2235818 ?auto_2235830 ) ) ( not ( = ?auto_2235820 ?auto_2235819 ) ) ( not ( = ?auto_2235820 ?auto_2235821 ) ) ( not ( = ?auto_2235820 ?auto_2235822 ) ) ( not ( = ?auto_2235820 ?auto_2235823 ) ) ( not ( = ?auto_2235820 ?auto_2235824 ) ) ( not ( = ?auto_2235820 ?auto_2235825 ) ) ( not ( = ?auto_2235820 ?auto_2235826 ) ) ( not ( = ?auto_2235820 ?auto_2235827 ) ) ( not ( = ?auto_2235820 ?auto_2235828 ) ) ( not ( = ?auto_2235820 ?auto_2235829 ) ) ( not ( = ?auto_2235820 ?auto_2235830 ) ) ( not ( = ?auto_2235819 ?auto_2235821 ) ) ( not ( = ?auto_2235819 ?auto_2235822 ) ) ( not ( = ?auto_2235819 ?auto_2235823 ) ) ( not ( = ?auto_2235819 ?auto_2235824 ) ) ( not ( = ?auto_2235819 ?auto_2235825 ) ) ( not ( = ?auto_2235819 ?auto_2235826 ) ) ( not ( = ?auto_2235819 ?auto_2235827 ) ) ( not ( = ?auto_2235819 ?auto_2235828 ) ) ( not ( = ?auto_2235819 ?auto_2235829 ) ) ( not ( = ?auto_2235819 ?auto_2235830 ) ) ( not ( = ?auto_2235821 ?auto_2235822 ) ) ( not ( = ?auto_2235821 ?auto_2235823 ) ) ( not ( = ?auto_2235821 ?auto_2235824 ) ) ( not ( = ?auto_2235821 ?auto_2235825 ) ) ( not ( = ?auto_2235821 ?auto_2235826 ) ) ( not ( = ?auto_2235821 ?auto_2235827 ) ) ( not ( = ?auto_2235821 ?auto_2235828 ) ) ( not ( = ?auto_2235821 ?auto_2235829 ) ) ( not ( = ?auto_2235821 ?auto_2235830 ) ) ( not ( = ?auto_2235822 ?auto_2235823 ) ) ( not ( = ?auto_2235822 ?auto_2235824 ) ) ( not ( = ?auto_2235822 ?auto_2235825 ) ) ( not ( = ?auto_2235822 ?auto_2235826 ) ) ( not ( = ?auto_2235822 ?auto_2235827 ) ) ( not ( = ?auto_2235822 ?auto_2235828 ) ) ( not ( = ?auto_2235822 ?auto_2235829 ) ) ( not ( = ?auto_2235822 ?auto_2235830 ) ) ( not ( = ?auto_2235823 ?auto_2235824 ) ) ( not ( = ?auto_2235823 ?auto_2235825 ) ) ( not ( = ?auto_2235823 ?auto_2235826 ) ) ( not ( = ?auto_2235823 ?auto_2235827 ) ) ( not ( = ?auto_2235823 ?auto_2235828 ) ) ( not ( = ?auto_2235823 ?auto_2235829 ) ) ( not ( = ?auto_2235823 ?auto_2235830 ) ) ( not ( = ?auto_2235824 ?auto_2235825 ) ) ( not ( = ?auto_2235824 ?auto_2235826 ) ) ( not ( = ?auto_2235824 ?auto_2235827 ) ) ( not ( = ?auto_2235824 ?auto_2235828 ) ) ( not ( = ?auto_2235824 ?auto_2235829 ) ) ( not ( = ?auto_2235824 ?auto_2235830 ) ) ( not ( = ?auto_2235825 ?auto_2235826 ) ) ( not ( = ?auto_2235825 ?auto_2235827 ) ) ( not ( = ?auto_2235825 ?auto_2235828 ) ) ( not ( = ?auto_2235825 ?auto_2235829 ) ) ( not ( = ?auto_2235825 ?auto_2235830 ) ) ( not ( = ?auto_2235826 ?auto_2235827 ) ) ( not ( = ?auto_2235826 ?auto_2235828 ) ) ( not ( = ?auto_2235826 ?auto_2235829 ) ) ( not ( = ?auto_2235826 ?auto_2235830 ) ) ( not ( = ?auto_2235827 ?auto_2235828 ) ) ( not ( = ?auto_2235827 ?auto_2235829 ) ) ( not ( = ?auto_2235827 ?auto_2235830 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2235828 ?auto_2235829 ?auto_2235830 )
      ( MAKE-16CRATE-VERIFY ?auto_2235815 ?auto_2235816 ?auto_2235817 ?auto_2235814 ?auto_2235818 ?auto_2235820 ?auto_2235819 ?auto_2235821 ?auto_2235822 ?auto_2235823 ?auto_2235824 ?auto_2235825 ?auto_2235826 ?auto_2235827 ?auto_2235828 ?auto_2235829 ?auto_2235830 ) )
  )

  ( :method MAKE-16CRATE
    :parameters
    (
      ?auto_2236063 - SURFACE
      ?auto_2236064 - SURFACE
      ?auto_2236065 - SURFACE
      ?auto_2236062 - SURFACE
      ?auto_2236066 - SURFACE
      ?auto_2236068 - SURFACE
      ?auto_2236067 - SURFACE
      ?auto_2236069 - SURFACE
      ?auto_2236070 - SURFACE
      ?auto_2236071 - SURFACE
      ?auto_2236072 - SURFACE
      ?auto_2236073 - SURFACE
      ?auto_2236074 - SURFACE
      ?auto_2236075 - SURFACE
      ?auto_2236076 - SURFACE
      ?auto_2236077 - SURFACE
      ?auto_2236078 - SURFACE
    )
    :vars
    (
      ?auto_2236083 - HOIST
      ?auto_2236081 - PLACE
      ?auto_2236084 - TRUCK
      ?auto_2236080 - PLACE
      ?auto_2236082 - HOIST
      ?auto_2236079 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2236083 ?auto_2236081 ) ( SURFACE-AT ?auto_2236077 ?auto_2236081 ) ( CLEAR ?auto_2236077 ) ( IS-CRATE ?auto_2236078 ) ( not ( = ?auto_2236077 ?auto_2236078 ) ) ( AVAILABLE ?auto_2236083 ) ( ON ?auto_2236077 ?auto_2236076 ) ( not ( = ?auto_2236076 ?auto_2236077 ) ) ( not ( = ?auto_2236076 ?auto_2236078 ) ) ( TRUCK-AT ?auto_2236084 ?auto_2236080 ) ( not ( = ?auto_2236080 ?auto_2236081 ) ) ( HOIST-AT ?auto_2236082 ?auto_2236080 ) ( not ( = ?auto_2236083 ?auto_2236082 ) ) ( AVAILABLE ?auto_2236082 ) ( SURFACE-AT ?auto_2236078 ?auto_2236080 ) ( ON ?auto_2236078 ?auto_2236079 ) ( CLEAR ?auto_2236078 ) ( not ( = ?auto_2236077 ?auto_2236079 ) ) ( not ( = ?auto_2236078 ?auto_2236079 ) ) ( not ( = ?auto_2236076 ?auto_2236079 ) ) ( ON ?auto_2236064 ?auto_2236063 ) ( ON ?auto_2236065 ?auto_2236064 ) ( ON ?auto_2236062 ?auto_2236065 ) ( ON ?auto_2236066 ?auto_2236062 ) ( ON ?auto_2236068 ?auto_2236066 ) ( ON ?auto_2236067 ?auto_2236068 ) ( ON ?auto_2236069 ?auto_2236067 ) ( ON ?auto_2236070 ?auto_2236069 ) ( ON ?auto_2236071 ?auto_2236070 ) ( ON ?auto_2236072 ?auto_2236071 ) ( ON ?auto_2236073 ?auto_2236072 ) ( ON ?auto_2236074 ?auto_2236073 ) ( ON ?auto_2236075 ?auto_2236074 ) ( ON ?auto_2236076 ?auto_2236075 ) ( not ( = ?auto_2236063 ?auto_2236064 ) ) ( not ( = ?auto_2236063 ?auto_2236065 ) ) ( not ( = ?auto_2236063 ?auto_2236062 ) ) ( not ( = ?auto_2236063 ?auto_2236066 ) ) ( not ( = ?auto_2236063 ?auto_2236068 ) ) ( not ( = ?auto_2236063 ?auto_2236067 ) ) ( not ( = ?auto_2236063 ?auto_2236069 ) ) ( not ( = ?auto_2236063 ?auto_2236070 ) ) ( not ( = ?auto_2236063 ?auto_2236071 ) ) ( not ( = ?auto_2236063 ?auto_2236072 ) ) ( not ( = ?auto_2236063 ?auto_2236073 ) ) ( not ( = ?auto_2236063 ?auto_2236074 ) ) ( not ( = ?auto_2236063 ?auto_2236075 ) ) ( not ( = ?auto_2236063 ?auto_2236076 ) ) ( not ( = ?auto_2236063 ?auto_2236077 ) ) ( not ( = ?auto_2236063 ?auto_2236078 ) ) ( not ( = ?auto_2236063 ?auto_2236079 ) ) ( not ( = ?auto_2236064 ?auto_2236065 ) ) ( not ( = ?auto_2236064 ?auto_2236062 ) ) ( not ( = ?auto_2236064 ?auto_2236066 ) ) ( not ( = ?auto_2236064 ?auto_2236068 ) ) ( not ( = ?auto_2236064 ?auto_2236067 ) ) ( not ( = ?auto_2236064 ?auto_2236069 ) ) ( not ( = ?auto_2236064 ?auto_2236070 ) ) ( not ( = ?auto_2236064 ?auto_2236071 ) ) ( not ( = ?auto_2236064 ?auto_2236072 ) ) ( not ( = ?auto_2236064 ?auto_2236073 ) ) ( not ( = ?auto_2236064 ?auto_2236074 ) ) ( not ( = ?auto_2236064 ?auto_2236075 ) ) ( not ( = ?auto_2236064 ?auto_2236076 ) ) ( not ( = ?auto_2236064 ?auto_2236077 ) ) ( not ( = ?auto_2236064 ?auto_2236078 ) ) ( not ( = ?auto_2236064 ?auto_2236079 ) ) ( not ( = ?auto_2236065 ?auto_2236062 ) ) ( not ( = ?auto_2236065 ?auto_2236066 ) ) ( not ( = ?auto_2236065 ?auto_2236068 ) ) ( not ( = ?auto_2236065 ?auto_2236067 ) ) ( not ( = ?auto_2236065 ?auto_2236069 ) ) ( not ( = ?auto_2236065 ?auto_2236070 ) ) ( not ( = ?auto_2236065 ?auto_2236071 ) ) ( not ( = ?auto_2236065 ?auto_2236072 ) ) ( not ( = ?auto_2236065 ?auto_2236073 ) ) ( not ( = ?auto_2236065 ?auto_2236074 ) ) ( not ( = ?auto_2236065 ?auto_2236075 ) ) ( not ( = ?auto_2236065 ?auto_2236076 ) ) ( not ( = ?auto_2236065 ?auto_2236077 ) ) ( not ( = ?auto_2236065 ?auto_2236078 ) ) ( not ( = ?auto_2236065 ?auto_2236079 ) ) ( not ( = ?auto_2236062 ?auto_2236066 ) ) ( not ( = ?auto_2236062 ?auto_2236068 ) ) ( not ( = ?auto_2236062 ?auto_2236067 ) ) ( not ( = ?auto_2236062 ?auto_2236069 ) ) ( not ( = ?auto_2236062 ?auto_2236070 ) ) ( not ( = ?auto_2236062 ?auto_2236071 ) ) ( not ( = ?auto_2236062 ?auto_2236072 ) ) ( not ( = ?auto_2236062 ?auto_2236073 ) ) ( not ( = ?auto_2236062 ?auto_2236074 ) ) ( not ( = ?auto_2236062 ?auto_2236075 ) ) ( not ( = ?auto_2236062 ?auto_2236076 ) ) ( not ( = ?auto_2236062 ?auto_2236077 ) ) ( not ( = ?auto_2236062 ?auto_2236078 ) ) ( not ( = ?auto_2236062 ?auto_2236079 ) ) ( not ( = ?auto_2236066 ?auto_2236068 ) ) ( not ( = ?auto_2236066 ?auto_2236067 ) ) ( not ( = ?auto_2236066 ?auto_2236069 ) ) ( not ( = ?auto_2236066 ?auto_2236070 ) ) ( not ( = ?auto_2236066 ?auto_2236071 ) ) ( not ( = ?auto_2236066 ?auto_2236072 ) ) ( not ( = ?auto_2236066 ?auto_2236073 ) ) ( not ( = ?auto_2236066 ?auto_2236074 ) ) ( not ( = ?auto_2236066 ?auto_2236075 ) ) ( not ( = ?auto_2236066 ?auto_2236076 ) ) ( not ( = ?auto_2236066 ?auto_2236077 ) ) ( not ( = ?auto_2236066 ?auto_2236078 ) ) ( not ( = ?auto_2236066 ?auto_2236079 ) ) ( not ( = ?auto_2236068 ?auto_2236067 ) ) ( not ( = ?auto_2236068 ?auto_2236069 ) ) ( not ( = ?auto_2236068 ?auto_2236070 ) ) ( not ( = ?auto_2236068 ?auto_2236071 ) ) ( not ( = ?auto_2236068 ?auto_2236072 ) ) ( not ( = ?auto_2236068 ?auto_2236073 ) ) ( not ( = ?auto_2236068 ?auto_2236074 ) ) ( not ( = ?auto_2236068 ?auto_2236075 ) ) ( not ( = ?auto_2236068 ?auto_2236076 ) ) ( not ( = ?auto_2236068 ?auto_2236077 ) ) ( not ( = ?auto_2236068 ?auto_2236078 ) ) ( not ( = ?auto_2236068 ?auto_2236079 ) ) ( not ( = ?auto_2236067 ?auto_2236069 ) ) ( not ( = ?auto_2236067 ?auto_2236070 ) ) ( not ( = ?auto_2236067 ?auto_2236071 ) ) ( not ( = ?auto_2236067 ?auto_2236072 ) ) ( not ( = ?auto_2236067 ?auto_2236073 ) ) ( not ( = ?auto_2236067 ?auto_2236074 ) ) ( not ( = ?auto_2236067 ?auto_2236075 ) ) ( not ( = ?auto_2236067 ?auto_2236076 ) ) ( not ( = ?auto_2236067 ?auto_2236077 ) ) ( not ( = ?auto_2236067 ?auto_2236078 ) ) ( not ( = ?auto_2236067 ?auto_2236079 ) ) ( not ( = ?auto_2236069 ?auto_2236070 ) ) ( not ( = ?auto_2236069 ?auto_2236071 ) ) ( not ( = ?auto_2236069 ?auto_2236072 ) ) ( not ( = ?auto_2236069 ?auto_2236073 ) ) ( not ( = ?auto_2236069 ?auto_2236074 ) ) ( not ( = ?auto_2236069 ?auto_2236075 ) ) ( not ( = ?auto_2236069 ?auto_2236076 ) ) ( not ( = ?auto_2236069 ?auto_2236077 ) ) ( not ( = ?auto_2236069 ?auto_2236078 ) ) ( not ( = ?auto_2236069 ?auto_2236079 ) ) ( not ( = ?auto_2236070 ?auto_2236071 ) ) ( not ( = ?auto_2236070 ?auto_2236072 ) ) ( not ( = ?auto_2236070 ?auto_2236073 ) ) ( not ( = ?auto_2236070 ?auto_2236074 ) ) ( not ( = ?auto_2236070 ?auto_2236075 ) ) ( not ( = ?auto_2236070 ?auto_2236076 ) ) ( not ( = ?auto_2236070 ?auto_2236077 ) ) ( not ( = ?auto_2236070 ?auto_2236078 ) ) ( not ( = ?auto_2236070 ?auto_2236079 ) ) ( not ( = ?auto_2236071 ?auto_2236072 ) ) ( not ( = ?auto_2236071 ?auto_2236073 ) ) ( not ( = ?auto_2236071 ?auto_2236074 ) ) ( not ( = ?auto_2236071 ?auto_2236075 ) ) ( not ( = ?auto_2236071 ?auto_2236076 ) ) ( not ( = ?auto_2236071 ?auto_2236077 ) ) ( not ( = ?auto_2236071 ?auto_2236078 ) ) ( not ( = ?auto_2236071 ?auto_2236079 ) ) ( not ( = ?auto_2236072 ?auto_2236073 ) ) ( not ( = ?auto_2236072 ?auto_2236074 ) ) ( not ( = ?auto_2236072 ?auto_2236075 ) ) ( not ( = ?auto_2236072 ?auto_2236076 ) ) ( not ( = ?auto_2236072 ?auto_2236077 ) ) ( not ( = ?auto_2236072 ?auto_2236078 ) ) ( not ( = ?auto_2236072 ?auto_2236079 ) ) ( not ( = ?auto_2236073 ?auto_2236074 ) ) ( not ( = ?auto_2236073 ?auto_2236075 ) ) ( not ( = ?auto_2236073 ?auto_2236076 ) ) ( not ( = ?auto_2236073 ?auto_2236077 ) ) ( not ( = ?auto_2236073 ?auto_2236078 ) ) ( not ( = ?auto_2236073 ?auto_2236079 ) ) ( not ( = ?auto_2236074 ?auto_2236075 ) ) ( not ( = ?auto_2236074 ?auto_2236076 ) ) ( not ( = ?auto_2236074 ?auto_2236077 ) ) ( not ( = ?auto_2236074 ?auto_2236078 ) ) ( not ( = ?auto_2236074 ?auto_2236079 ) ) ( not ( = ?auto_2236075 ?auto_2236076 ) ) ( not ( = ?auto_2236075 ?auto_2236077 ) ) ( not ( = ?auto_2236075 ?auto_2236078 ) ) ( not ( = ?auto_2236075 ?auto_2236079 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2236076 ?auto_2236077 ?auto_2236078 )
      ( MAKE-16CRATE-VERIFY ?auto_2236063 ?auto_2236064 ?auto_2236065 ?auto_2236062 ?auto_2236066 ?auto_2236068 ?auto_2236067 ?auto_2236069 ?auto_2236070 ?auto_2236071 ?auto_2236072 ?auto_2236073 ?auto_2236074 ?auto_2236075 ?auto_2236076 ?auto_2236077 ?auto_2236078 ) )
  )

  ( :method MAKE-16CRATE
    :parameters
    (
      ?auto_2236312 - SURFACE
      ?auto_2236313 - SURFACE
      ?auto_2236314 - SURFACE
      ?auto_2236311 - SURFACE
      ?auto_2236315 - SURFACE
      ?auto_2236317 - SURFACE
      ?auto_2236316 - SURFACE
      ?auto_2236318 - SURFACE
      ?auto_2236319 - SURFACE
      ?auto_2236320 - SURFACE
      ?auto_2236321 - SURFACE
      ?auto_2236322 - SURFACE
      ?auto_2236323 - SURFACE
      ?auto_2236324 - SURFACE
      ?auto_2236325 - SURFACE
      ?auto_2236326 - SURFACE
      ?auto_2236327 - SURFACE
    )
    :vars
    (
      ?auto_2236332 - HOIST
      ?auto_2236331 - PLACE
      ?auto_2236328 - PLACE
      ?auto_2236329 - HOIST
      ?auto_2236330 - SURFACE
      ?auto_2236333 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2236332 ?auto_2236331 ) ( SURFACE-AT ?auto_2236326 ?auto_2236331 ) ( CLEAR ?auto_2236326 ) ( IS-CRATE ?auto_2236327 ) ( not ( = ?auto_2236326 ?auto_2236327 ) ) ( AVAILABLE ?auto_2236332 ) ( ON ?auto_2236326 ?auto_2236325 ) ( not ( = ?auto_2236325 ?auto_2236326 ) ) ( not ( = ?auto_2236325 ?auto_2236327 ) ) ( not ( = ?auto_2236328 ?auto_2236331 ) ) ( HOIST-AT ?auto_2236329 ?auto_2236328 ) ( not ( = ?auto_2236332 ?auto_2236329 ) ) ( AVAILABLE ?auto_2236329 ) ( SURFACE-AT ?auto_2236327 ?auto_2236328 ) ( ON ?auto_2236327 ?auto_2236330 ) ( CLEAR ?auto_2236327 ) ( not ( = ?auto_2236326 ?auto_2236330 ) ) ( not ( = ?auto_2236327 ?auto_2236330 ) ) ( not ( = ?auto_2236325 ?auto_2236330 ) ) ( TRUCK-AT ?auto_2236333 ?auto_2236331 ) ( ON ?auto_2236313 ?auto_2236312 ) ( ON ?auto_2236314 ?auto_2236313 ) ( ON ?auto_2236311 ?auto_2236314 ) ( ON ?auto_2236315 ?auto_2236311 ) ( ON ?auto_2236317 ?auto_2236315 ) ( ON ?auto_2236316 ?auto_2236317 ) ( ON ?auto_2236318 ?auto_2236316 ) ( ON ?auto_2236319 ?auto_2236318 ) ( ON ?auto_2236320 ?auto_2236319 ) ( ON ?auto_2236321 ?auto_2236320 ) ( ON ?auto_2236322 ?auto_2236321 ) ( ON ?auto_2236323 ?auto_2236322 ) ( ON ?auto_2236324 ?auto_2236323 ) ( ON ?auto_2236325 ?auto_2236324 ) ( not ( = ?auto_2236312 ?auto_2236313 ) ) ( not ( = ?auto_2236312 ?auto_2236314 ) ) ( not ( = ?auto_2236312 ?auto_2236311 ) ) ( not ( = ?auto_2236312 ?auto_2236315 ) ) ( not ( = ?auto_2236312 ?auto_2236317 ) ) ( not ( = ?auto_2236312 ?auto_2236316 ) ) ( not ( = ?auto_2236312 ?auto_2236318 ) ) ( not ( = ?auto_2236312 ?auto_2236319 ) ) ( not ( = ?auto_2236312 ?auto_2236320 ) ) ( not ( = ?auto_2236312 ?auto_2236321 ) ) ( not ( = ?auto_2236312 ?auto_2236322 ) ) ( not ( = ?auto_2236312 ?auto_2236323 ) ) ( not ( = ?auto_2236312 ?auto_2236324 ) ) ( not ( = ?auto_2236312 ?auto_2236325 ) ) ( not ( = ?auto_2236312 ?auto_2236326 ) ) ( not ( = ?auto_2236312 ?auto_2236327 ) ) ( not ( = ?auto_2236312 ?auto_2236330 ) ) ( not ( = ?auto_2236313 ?auto_2236314 ) ) ( not ( = ?auto_2236313 ?auto_2236311 ) ) ( not ( = ?auto_2236313 ?auto_2236315 ) ) ( not ( = ?auto_2236313 ?auto_2236317 ) ) ( not ( = ?auto_2236313 ?auto_2236316 ) ) ( not ( = ?auto_2236313 ?auto_2236318 ) ) ( not ( = ?auto_2236313 ?auto_2236319 ) ) ( not ( = ?auto_2236313 ?auto_2236320 ) ) ( not ( = ?auto_2236313 ?auto_2236321 ) ) ( not ( = ?auto_2236313 ?auto_2236322 ) ) ( not ( = ?auto_2236313 ?auto_2236323 ) ) ( not ( = ?auto_2236313 ?auto_2236324 ) ) ( not ( = ?auto_2236313 ?auto_2236325 ) ) ( not ( = ?auto_2236313 ?auto_2236326 ) ) ( not ( = ?auto_2236313 ?auto_2236327 ) ) ( not ( = ?auto_2236313 ?auto_2236330 ) ) ( not ( = ?auto_2236314 ?auto_2236311 ) ) ( not ( = ?auto_2236314 ?auto_2236315 ) ) ( not ( = ?auto_2236314 ?auto_2236317 ) ) ( not ( = ?auto_2236314 ?auto_2236316 ) ) ( not ( = ?auto_2236314 ?auto_2236318 ) ) ( not ( = ?auto_2236314 ?auto_2236319 ) ) ( not ( = ?auto_2236314 ?auto_2236320 ) ) ( not ( = ?auto_2236314 ?auto_2236321 ) ) ( not ( = ?auto_2236314 ?auto_2236322 ) ) ( not ( = ?auto_2236314 ?auto_2236323 ) ) ( not ( = ?auto_2236314 ?auto_2236324 ) ) ( not ( = ?auto_2236314 ?auto_2236325 ) ) ( not ( = ?auto_2236314 ?auto_2236326 ) ) ( not ( = ?auto_2236314 ?auto_2236327 ) ) ( not ( = ?auto_2236314 ?auto_2236330 ) ) ( not ( = ?auto_2236311 ?auto_2236315 ) ) ( not ( = ?auto_2236311 ?auto_2236317 ) ) ( not ( = ?auto_2236311 ?auto_2236316 ) ) ( not ( = ?auto_2236311 ?auto_2236318 ) ) ( not ( = ?auto_2236311 ?auto_2236319 ) ) ( not ( = ?auto_2236311 ?auto_2236320 ) ) ( not ( = ?auto_2236311 ?auto_2236321 ) ) ( not ( = ?auto_2236311 ?auto_2236322 ) ) ( not ( = ?auto_2236311 ?auto_2236323 ) ) ( not ( = ?auto_2236311 ?auto_2236324 ) ) ( not ( = ?auto_2236311 ?auto_2236325 ) ) ( not ( = ?auto_2236311 ?auto_2236326 ) ) ( not ( = ?auto_2236311 ?auto_2236327 ) ) ( not ( = ?auto_2236311 ?auto_2236330 ) ) ( not ( = ?auto_2236315 ?auto_2236317 ) ) ( not ( = ?auto_2236315 ?auto_2236316 ) ) ( not ( = ?auto_2236315 ?auto_2236318 ) ) ( not ( = ?auto_2236315 ?auto_2236319 ) ) ( not ( = ?auto_2236315 ?auto_2236320 ) ) ( not ( = ?auto_2236315 ?auto_2236321 ) ) ( not ( = ?auto_2236315 ?auto_2236322 ) ) ( not ( = ?auto_2236315 ?auto_2236323 ) ) ( not ( = ?auto_2236315 ?auto_2236324 ) ) ( not ( = ?auto_2236315 ?auto_2236325 ) ) ( not ( = ?auto_2236315 ?auto_2236326 ) ) ( not ( = ?auto_2236315 ?auto_2236327 ) ) ( not ( = ?auto_2236315 ?auto_2236330 ) ) ( not ( = ?auto_2236317 ?auto_2236316 ) ) ( not ( = ?auto_2236317 ?auto_2236318 ) ) ( not ( = ?auto_2236317 ?auto_2236319 ) ) ( not ( = ?auto_2236317 ?auto_2236320 ) ) ( not ( = ?auto_2236317 ?auto_2236321 ) ) ( not ( = ?auto_2236317 ?auto_2236322 ) ) ( not ( = ?auto_2236317 ?auto_2236323 ) ) ( not ( = ?auto_2236317 ?auto_2236324 ) ) ( not ( = ?auto_2236317 ?auto_2236325 ) ) ( not ( = ?auto_2236317 ?auto_2236326 ) ) ( not ( = ?auto_2236317 ?auto_2236327 ) ) ( not ( = ?auto_2236317 ?auto_2236330 ) ) ( not ( = ?auto_2236316 ?auto_2236318 ) ) ( not ( = ?auto_2236316 ?auto_2236319 ) ) ( not ( = ?auto_2236316 ?auto_2236320 ) ) ( not ( = ?auto_2236316 ?auto_2236321 ) ) ( not ( = ?auto_2236316 ?auto_2236322 ) ) ( not ( = ?auto_2236316 ?auto_2236323 ) ) ( not ( = ?auto_2236316 ?auto_2236324 ) ) ( not ( = ?auto_2236316 ?auto_2236325 ) ) ( not ( = ?auto_2236316 ?auto_2236326 ) ) ( not ( = ?auto_2236316 ?auto_2236327 ) ) ( not ( = ?auto_2236316 ?auto_2236330 ) ) ( not ( = ?auto_2236318 ?auto_2236319 ) ) ( not ( = ?auto_2236318 ?auto_2236320 ) ) ( not ( = ?auto_2236318 ?auto_2236321 ) ) ( not ( = ?auto_2236318 ?auto_2236322 ) ) ( not ( = ?auto_2236318 ?auto_2236323 ) ) ( not ( = ?auto_2236318 ?auto_2236324 ) ) ( not ( = ?auto_2236318 ?auto_2236325 ) ) ( not ( = ?auto_2236318 ?auto_2236326 ) ) ( not ( = ?auto_2236318 ?auto_2236327 ) ) ( not ( = ?auto_2236318 ?auto_2236330 ) ) ( not ( = ?auto_2236319 ?auto_2236320 ) ) ( not ( = ?auto_2236319 ?auto_2236321 ) ) ( not ( = ?auto_2236319 ?auto_2236322 ) ) ( not ( = ?auto_2236319 ?auto_2236323 ) ) ( not ( = ?auto_2236319 ?auto_2236324 ) ) ( not ( = ?auto_2236319 ?auto_2236325 ) ) ( not ( = ?auto_2236319 ?auto_2236326 ) ) ( not ( = ?auto_2236319 ?auto_2236327 ) ) ( not ( = ?auto_2236319 ?auto_2236330 ) ) ( not ( = ?auto_2236320 ?auto_2236321 ) ) ( not ( = ?auto_2236320 ?auto_2236322 ) ) ( not ( = ?auto_2236320 ?auto_2236323 ) ) ( not ( = ?auto_2236320 ?auto_2236324 ) ) ( not ( = ?auto_2236320 ?auto_2236325 ) ) ( not ( = ?auto_2236320 ?auto_2236326 ) ) ( not ( = ?auto_2236320 ?auto_2236327 ) ) ( not ( = ?auto_2236320 ?auto_2236330 ) ) ( not ( = ?auto_2236321 ?auto_2236322 ) ) ( not ( = ?auto_2236321 ?auto_2236323 ) ) ( not ( = ?auto_2236321 ?auto_2236324 ) ) ( not ( = ?auto_2236321 ?auto_2236325 ) ) ( not ( = ?auto_2236321 ?auto_2236326 ) ) ( not ( = ?auto_2236321 ?auto_2236327 ) ) ( not ( = ?auto_2236321 ?auto_2236330 ) ) ( not ( = ?auto_2236322 ?auto_2236323 ) ) ( not ( = ?auto_2236322 ?auto_2236324 ) ) ( not ( = ?auto_2236322 ?auto_2236325 ) ) ( not ( = ?auto_2236322 ?auto_2236326 ) ) ( not ( = ?auto_2236322 ?auto_2236327 ) ) ( not ( = ?auto_2236322 ?auto_2236330 ) ) ( not ( = ?auto_2236323 ?auto_2236324 ) ) ( not ( = ?auto_2236323 ?auto_2236325 ) ) ( not ( = ?auto_2236323 ?auto_2236326 ) ) ( not ( = ?auto_2236323 ?auto_2236327 ) ) ( not ( = ?auto_2236323 ?auto_2236330 ) ) ( not ( = ?auto_2236324 ?auto_2236325 ) ) ( not ( = ?auto_2236324 ?auto_2236326 ) ) ( not ( = ?auto_2236324 ?auto_2236327 ) ) ( not ( = ?auto_2236324 ?auto_2236330 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2236325 ?auto_2236326 ?auto_2236327 )
      ( MAKE-16CRATE-VERIFY ?auto_2236312 ?auto_2236313 ?auto_2236314 ?auto_2236311 ?auto_2236315 ?auto_2236317 ?auto_2236316 ?auto_2236318 ?auto_2236319 ?auto_2236320 ?auto_2236321 ?auto_2236322 ?auto_2236323 ?auto_2236324 ?auto_2236325 ?auto_2236326 ?auto_2236327 ) )
  )

  ( :method MAKE-16CRATE
    :parameters
    (
      ?auto_2236561 - SURFACE
      ?auto_2236562 - SURFACE
      ?auto_2236563 - SURFACE
      ?auto_2236560 - SURFACE
      ?auto_2236564 - SURFACE
      ?auto_2236566 - SURFACE
      ?auto_2236565 - SURFACE
      ?auto_2236567 - SURFACE
      ?auto_2236568 - SURFACE
      ?auto_2236569 - SURFACE
      ?auto_2236570 - SURFACE
      ?auto_2236571 - SURFACE
      ?auto_2236572 - SURFACE
      ?auto_2236573 - SURFACE
      ?auto_2236574 - SURFACE
      ?auto_2236575 - SURFACE
      ?auto_2236576 - SURFACE
    )
    :vars
    (
      ?auto_2236579 - HOIST
      ?auto_2236580 - PLACE
      ?auto_2236577 - PLACE
      ?auto_2236581 - HOIST
      ?auto_2236578 - SURFACE
      ?auto_2236582 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2236579 ?auto_2236580 ) ( IS-CRATE ?auto_2236576 ) ( not ( = ?auto_2236575 ?auto_2236576 ) ) ( not ( = ?auto_2236574 ?auto_2236575 ) ) ( not ( = ?auto_2236574 ?auto_2236576 ) ) ( not ( = ?auto_2236577 ?auto_2236580 ) ) ( HOIST-AT ?auto_2236581 ?auto_2236577 ) ( not ( = ?auto_2236579 ?auto_2236581 ) ) ( AVAILABLE ?auto_2236581 ) ( SURFACE-AT ?auto_2236576 ?auto_2236577 ) ( ON ?auto_2236576 ?auto_2236578 ) ( CLEAR ?auto_2236576 ) ( not ( = ?auto_2236575 ?auto_2236578 ) ) ( not ( = ?auto_2236576 ?auto_2236578 ) ) ( not ( = ?auto_2236574 ?auto_2236578 ) ) ( TRUCK-AT ?auto_2236582 ?auto_2236580 ) ( SURFACE-AT ?auto_2236574 ?auto_2236580 ) ( CLEAR ?auto_2236574 ) ( LIFTING ?auto_2236579 ?auto_2236575 ) ( IS-CRATE ?auto_2236575 ) ( ON ?auto_2236562 ?auto_2236561 ) ( ON ?auto_2236563 ?auto_2236562 ) ( ON ?auto_2236560 ?auto_2236563 ) ( ON ?auto_2236564 ?auto_2236560 ) ( ON ?auto_2236566 ?auto_2236564 ) ( ON ?auto_2236565 ?auto_2236566 ) ( ON ?auto_2236567 ?auto_2236565 ) ( ON ?auto_2236568 ?auto_2236567 ) ( ON ?auto_2236569 ?auto_2236568 ) ( ON ?auto_2236570 ?auto_2236569 ) ( ON ?auto_2236571 ?auto_2236570 ) ( ON ?auto_2236572 ?auto_2236571 ) ( ON ?auto_2236573 ?auto_2236572 ) ( ON ?auto_2236574 ?auto_2236573 ) ( not ( = ?auto_2236561 ?auto_2236562 ) ) ( not ( = ?auto_2236561 ?auto_2236563 ) ) ( not ( = ?auto_2236561 ?auto_2236560 ) ) ( not ( = ?auto_2236561 ?auto_2236564 ) ) ( not ( = ?auto_2236561 ?auto_2236566 ) ) ( not ( = ?auto_2236561 ?auto_2236565 ) ) ( not ( = ?auto_2236561 ?auto_2236567 ) ) ( not ( = ?auto_2236561 ?auto_2236568 ) ) ( not ( = ?auto_2236561 ?auto_2236569 ) ) ( not ( = ?auto_2236561 ?auto_2236570 ) ) ( not ( = ?auto_2236561 ?auto_2236571 ) ) ( not ( = ?auto_2236561 ?auto_2236572 ) ) ( not ( = ?auto_2236561 ?auto_2236573 ) ) ( not ( = ?auto_2236561 ?auto_2236574 ) ) ( not ( = ?auto_2236561 ?auto_2236575 ) ) ( not ( = ?auto_2236561 ?auto_2236576 ) ) ( not ( = ?auto_2236561 ?auto_2236578 ) ) ( not ( = ?auto_2236562 ?auto_2236563 ) ) ( not ( = ?auto_2236562 ?auto_2236560 ) ) ( not ( = ?auto_2236562 ?auto_2236564 ) ) ( not ( = ?auto_2236562 ?auto_2236566 ) ) ( not ( = ?auto_2236562 ?auto_2236565 ) ) ( not ( = ?auto_2236562 ?auto_2236567 ) ) ( not ( = ?auto_2236562 ?auto_2236568 ) ) ( not ( = ?auto_2236562 ?auto_2236569 ) ) ( not ( = ?auto_2236562 ?auto_2236570 ) ) ( not ( = ?auto_2236562 ?auto_2236571 ) ) ( not ( = ?auto_2236562 ?auto_2236572 ) ) ( not ( = ?auto_2236562 ?auto_2236573 ) ) ( not ( = ?auto_2236562 ?auto_2236574 ) ) ( not ( = ?auto_2236562 ?auto_2236575 ) ) ( not ( = ?auto_2236562 ?auto_2236576 ) ) ( not ( = ?auto_2236562 ?auto_2236578 ) ) ( not ( = ?auto_2236563 ?auto_2236560 ) ) ( not ( = ?auto_2236563 ?auto_2236564 ) ) ( not ( = ?auto_2236563 ?auto_2236566 ) ) ( not ( = ?auto_2236563 ?auto_2236565 ) ) ( not ( = ?auto_2236563 ?auto_2236567 ) ) ( not ( = ?auto_2236563 ?auto_2236568 ) ) ( not ( = ?auto_2236563 ?auto_2236569 ) ) ( not ( = ?auto_2236563 ?auto_2236570 ) ) ( not ( = ?auto_2236563 ?auto_2236571 ) ) ( not ( = ?auto_2236563 ?auto_2236572 ) ) ( not ( = ?auto_2236563 ?auto_2236573 ) ) ( not ( = ?auto_2236563 ?auto_2236574 ) ) ( not ( = ?auto_2236563 ?auto_2236575 ) ) ( not ( = ?auto_2236563 ?auto_2236576 ) ) ( not ( = ?auto_2236563 ?auto_2236578 ) ) ( not ( = ?auto_2236560 ?auto_2236564 ) ) ( not ( = ?auto_2236560 ?auto_2236566 ) ) ( not ( = ?auto_2236560 ?auto_2236565 ) ) ( not ( = ?auto_2236560 ?auto_2236567 ) ) ( not ( = ?auto_2236560 ?auto_2236568 ) ) ( not ( = ?auto_2236560 ?auto_2236569 ) ) ( not ( = ?auto_2236560 ?auto_2236570 ) ) ( not ( = ?auto_2236560 ?auto_2236571 ) ) ( not ( = ?auto_2236560 ?auto_2236572 ) ) ( not ( = ?auto_2236560 ?auto_2236573 ) ) ( not ( = ?auto_2236560 ?auto_2236574 ) ) ( not ( = ?auto_2236560 ?auto_2236575 ) ) ( not ( = ?auto_2236560 ?auto_2236576 ) ) ( not ( = ?auto_2236560 ?auto_2236578 ) ) ( not ( = ?auto_2236564 ?auto_2236566 ) ) ( not ( = ?auto_2236564 ?auto_2236565 ) ) ( not ( = ?auto_2236564 ?auto_2236567 ) ) ( not ( = ?auto_2236564 ?auto_2236568 ) ) ( not ( = ?auto_2236564 ?auto_2236569 ) ) ( not ( = ?auto_2236564 ?auto_2236570 ) ) ( not ( = ?auto_2236564 ?auto_2236571 ) ) ( not ( = ?auto_2236564 ?auto_2236572 ) ) ( not ( = ?auto_2236564 ?auto_2236573 ) ) ( not ( = ?auto_2236564 ?auto_2236574 ) ) ( not ( = ?auto_2236564 ?auto_2236575 ) ) ( not ( = ?auto_2236564 ?auto_2236576 ) ) ( not ( = ?auto_2236564 ?auto_2236578 ) ) ( not ( = ?auto_2236566 ?auto_2236565 ) ) ( not ( = ?auto_2236566 ?auto_2236567 ) ) ( not ( = ?auto_2236566 ?auto_2236568 ) ) ( not ( = ?auto_2236566 ?auto_2236569 ) ) ( not ( = ?auto_2236566 ?auto_2236570 ) ) ( not ( = ?auto_2236566 ?auto_2236571 ) ) ( not ( = ?auto_2236566 ?auto_2236572 ) ) ( not ( = ?auto_2236566 ?auto_2236573 ) ) ( not ( = ?auto_2236566 ?auto_2236574 ) ) ( not ( = ?auto_2236566 ?auto_2236575 ) ) ( not ( = ?auto_2236566 ?auto_2236576 ) ) ( not ( = ?auto_2236566 ?auto_2236578 ) ) ( not ( = ?auto_2236565 ?auto_2236567 ) ) ( not ( = ?auto_2236565 ?auto_2236568 ) ) ( not ( = ?auto_2236565 ?auto_2236569 ) ) ( not ( = ?auto_2236565 ?auto_2236570 ) ) ( not ( = ?auto_2236565 ?auto_2236571 ) ) ( not ( = ?auto_2236565 ?auto_2236572 ) ) ( not ( = ?auto_2236565 ?auto_2236573 ) ) ( not ( = ?auto_2236565 ?auto_2236574 ) ) ( not ( = ?auto_2236565 ?auto_2236575 ) ) ( not ( = ?auto_2236565 ?auto_2236576 ) ) ( not ( = ?auto_2236565 ?auto_2236578 ) ) ( not ( = ?auto_2236567 ?auto_2236568 ) ) ( not ( = ?auto_2236567 ?auto_2236569 ) ) ( not ( = ?auto_2236567 ?auto_2236570 ) ) ( not ( = ?auto_2236567 ?auto_2236571 ) ) ( not ( = ?auto_2236567 ?auto_2236572 ) ) ( not ( = ?auto_2236567 ?auto_2236573 ) ) ( not ( = ?auto_2236567 ?auto_2236574 ) ) ( not ( = ?auto_2236567 ?auto_2236575 ) ) ( not ( = ?auto_2236567 ?auto_2236576 ) ) ( not ( = ?auto_2236567 ?auto_2236578 ) ) ( not ( = ?auto_2236568 ?auto_2236569 ) ) ( not ( = ?auto_2236568 ?auto_2236570 ) ) ( not ( = ?auto_2236568 ?auto_2236571 ) ) ( not ( = ?auto_2236568 ?auto_2236572 ) ) ( not ( = ?auto_2236568 ?auto_2236573 ) ) ( not ( = ?auto_2236568 ?auto_2236574 ) ) ( not ( = ?auto_2236568 ?auto_2236575 ) ) ( not ( = ?auto_2236568 ?auto_2236576 ) ) ( not ( = ?auto_2236568 ?auto_2236578 ) ) ( not ( = ?auto_2236569 ?auto_2236570 ) ) ( not ( = ?auto_2236569 ?auto_2236571 ) ) ( not ( = ?auto_2236569 ?auto_2236572 ) ) ( not ( = ?auto_2236569 ?auto_2236573 ) ) ( not ( = ?auto_2236569 ?auto_2236574 ) ) ( not ( = ?auto_2236569 ?auto_2236575 ) ) ( not ( = ?auto_2236569 ?auto_2236576 ) ) ( not ( = ?auto_2236569 ?auto_2236578 ) ) ( not ( = ?auto_2236570 ?auto_2236571 ) ) ( not ( = ?auto_2236570 ?auto_2236572 ) ) ( not ( = ?auto_2236570 ?auto_2236573 ) ) ( not ( = ?auto_2236570 ?auto_2236574 ) ) ( not ( = ?auto_2236570 ?auto_2236575 ) ) ( not ( = ?auto_2236570 ?auto_2236576 ) ) ( not ( = ?auto_2236570 ?auto_2236578 ) ) ( not ( = ?auto_2236571 ?auto_2236572 ) ) ( not ( = ?auto_2236571 ?auto_2236573 ) ) ( not ( = ?auto_2236571 ?auto_2236574 ) ) ( not ( = ?auto_2236571 ?auto_2236575 ) ) ( not ( = ?auto_2236571 ?auto_2236576 ) ) ( not ( = ?auto_2236571 ?auto_2236578 ) ) ( not ( = ?auto_2236572 ?auto_2236573 ) ) ( not ( = ?auto_2236572 ?auto_2236574 ) ) ( not ( = ?auto_2236572 ?auto_2236575 ) ) ( not ( = ?auto_2236572 ?auto_2236576 ) ) ( not ( = ?auto_2236572 ?auto_2236578 ) ) ( not ( = ?auto_2236573 ?auto_2236574 ) ) ( not ( = ?auto_2236573 ?auto_2236575 ) ) ( not ( = ?auto_2236573 ?auto_2236576 ) ) ( not ( = ?auto_2236573 ?auto_2236578 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2236574 ?auto_2236575 ?auto_2236576 )
      ( MAKE-16CRATE-VERIFY ?auto_2236561 ?auto_2236562 ?auto_2236563 ?auto_2236560 ?auto_2236564 ?auto_2236566 ?auto_2236565 ?auto_2236567 ?auto_2236568 ?auto_2236569 ?auto_2236570 ?auto_2236571 ?auto_2236572 ?auto_2236573 ?auto_2236574 ?auto_2236575 ?auto_2236576 ) )
  )

  ( :method MAKE-16CRATE
    :parameters
    (
      ?auto_2236810 - SURFACE
      ?auto_2236811 - SURFACE
      ?auto_2236812 - SURFACE
      ?auto_2236809 - SURFACE
      ?auto_2236813 - SURFACE
      ?auto_2236815 - SURFACE
      ?auto_2236814 - SURFACE
      ?auto_2236816 - SURFACE
      ?auto_2236817 - SURFACE
      ?auto_2236818 - SURFACE
      ?auto_2236819 - SURFACE
      ?auto_2236820 - SURFACE
      ?auto_2236821 - SURFACE
      ?auto_2236822 - SURFACE
      ?auto_2236823 - SURFACE
      ?auto_2236824 - SURFACE
      ?auto_2236825 - SURFACE
    )
    :vars
    (
      ?auto_2236828 - HOIST
      ?auto_2236826 - PLACE
      ?auto_2236829 - PLACE
      ?auto_2236831 - HOIST
      ?auto_2236827 - SURFACE
      ?auto_2236830 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2236828 ?auto_2236826 ) ( IS-CRATE ?auto_2236825 ) ( not ( = ?auto_2236824 ?auto_2236825 ) ) ( not ( = ?auto_2236823 ?auto_2236824 ) ) ( not ( = ?auto_2236823 ?auto_2236825 ) ) ( not ( = ?auto_2236829 ?auto_2236826 ) ) ( HOIST-AT ?auto_2236831 ?auto_2236829 ) ( not ( = ?auto_2236828 ?auto_2236831 ) ) ( AVAILABLE ?auto_2236831 ) ( SURFACE-AT ?auto_2236825 ?auto_2236829 ) ( ON ?auto_2236825 ?auto_2236827 ) ( CLEAR ?auto_2236825 ) ( not ( = ?auto_2236824 ?auto_2236827 ) ) ( not ( = ?auto_2236825 ?auto_2236827 ) ) ( not ( = ?auto_2236823 ?auto_2236827 ) ) ( TRUCK-AT ?auto_2236830 ?auto_2236826 ) ( SURFACE-AT ?auto_2236823 ?auto_2236826 ) ( CLEAR ?auto_2236823 ) ( IS-CRATE ?auto_2236824 ) ( AVAILABLE ?auto_2236828 ) ( IN ?auto_2236824 ?auto_2236830 ) ( ON ?auto_2236811 ?auto_2236810 ) ( ON ?auto_2236812 ?auto_2236811 ) ( ON ?auto_2236809 ?auto_2236812 ) ( ON ?auto_2236813 ?auto_2236809 ) ( ON ?auto_2236815 ?auto_2236813 ) ( ON ?auto_2236814 ?auto_2236815 ) ( ON ?auto_2236816 ?auto_2236814 ) ( ON ?auto_2236817 ?auto_2236816 ) ( ON ?auto_2236818 ?auto_2236817 ) ( ON ?auto_2236819 ?auto_2236818 ) ( ON ?auto_2236820 ?auto_2236819 ) ( ON ?auto_2236821 ?auto_2236820 ) ( ON ?auto_2236822 ?auto_2236821 ) ( ON ?auto_2236823 ?auto_2236822 ) ( not ( = ?auto_2236810 ?auto_2236811 ) ) ( not ( = ?auto_2236810 ?auto_2236812 ) ) ( not ( = ?auto_2236810 ?auto_2236809 ) ) ( not ( = ?auto_2236810 ?auto_2236813 ) ) ( not ( = ?auto_2236810 ?auto_2236815 ) ) ( not ( = ?auto_2236810 ?auto_2236814 ) ) ( not ( = ?auto_2236810 ?auto_2236816 ) ) ( not ( = ?auto_2236810 ?auto_2236817 ) ) ( not ( = ?auto_2236810 ?auto_2236818 ) ) ( not ( = ?auto_2236810 ?auto_2236819 ) ) ( not ( = ?auto_2236810 ?auto_2236820 ) ) ( not ( = ?auto_2236810 ?auto_2236821 ) ) ( not ( = ?auto_2236810 ?auto_2236822 ) ) ( not ( = ?auto_2236810 ?auto_2236823 ) ) ( not ( = ?auto_2236810 ?auto_2236824 ) ) ( not ( = ?auto_2236810 ?auto_2236825 ) ) ( not ( = ?auto_2236810 ?auto_2236827 ) ) ( not ( = ?auto_2236811 ?auto_2236812 ) ) ( not ( = ?auto_2236811 ?auto_2236809 ) ) ( not ( = ?auto_2236811 ?auto_2236813 ) ) ( not ( = ?auto_2236811 ?auto_2236815 ) ) ( not ( = ?auto_2236811 ?auto_2236814 ) ) ( not ( = ?auto_2236811 ?auto_2236816 ) ) ( not ( = ?auto_2236811 ?auto_2236817 ) ) ( not ( = ?auto_2236811 ?auto_2236818 ) ) ( not ( = ?auto_2236811 ?auto_2236819 ) ) ( not ( = ?auto_2236811 ?auto_2236820 ) ) ( not ( = ?auto_2236811 ?auto_2236821 ) ) ( not ( = ?auto_2236811 ?auto_2236822 ) ) ( not ( = ?auto_2236811 ?auto_2236823 ) ) ( not ( = ?auto_2236811 ?auto_2236824 ) ) ( not ( = ?auto_2236811 ?auto_2236825 ) ) ( not ( = ?auto_2236811 ?auto_2236827 ) ) ( not ( = ?auto_2236812 ?auto_2236809 ) ) ( not ( = ?auto_2236812 ?auto_2236813 ) ) ( not ( = ?auto_2236812 ?auto_2236815 ) ) ( not ( = ?auto_2236812 ?auto_2236814 ) ) ( not ( = ?auto_2236812 ?auto_2236816 ) ) ( not ( = ?auto_2236812 ?auto_2236817 ) ) ( not ( = ?auto_2236812 ?auto_2236818 ) ) ( not ( = ?auto_2236812 ?auto_2236819 ) ) ( not ( = ?auto_2236812 ?auto_2236820 ) ) ( not ( = ?auto_2236812 ?auto_2236821 ) ) ( not ( = ?auto_2236812 ?auto_2236822 ) ) ( not ( = ?auto_2236812 ?auto_2236823 ) ) ( not ( = ?auto_2236812 ?auto_2236824 ) ) ( not ( = ?auto_2236812 ?auto_2236825 ) ) ( not ( = ?auto_2236812 ?auto_2236827 ) ) ( not ( = ?auto_2236809 ?auto_2236813 ) ) ( not ( = ?auto_2236809 ?auto_2236815 ) ) ( not ( = ?auto_2236809 ?auto_2236814 ) ) ( not ( = ?auto_2236809 ?auto_2236816 ) ) ( not ( = ?auto_2236809 ?auto_2236817 ) ) ( not ( = ?auto_2236809 ?auto_2236818 ) ) ( not ( = ?auto_2236809 ?auto_2236819 ) ) ( not ( = ?auto_2236809 ?auto_2236820 ) ) ( not ( = ?auto_2236809 ?auto_2236821 ) ) ( not ( = ?auto_2236809 ?auto_2236822 ) ) ( not ( = ?auto_2236809 ?auto_2236823 ) ) ( not ( = ?auto_2236809 ?auto_2236824 ) ) ( not ( = ?auto_2236809 ?auto_2236825 ) ) ( not ( = ?auto_2236809 ?auto_2236827 ) ) ( not ( = ?auto_2236813 ?auto_2236815 ) ) ( not ( = ?auto_2236813 ?auto_2236814 ) ) ( not ( = ?auto_2236813 ?auto_2236816 ) ) ( not ( = ?auto_2236813 ?auto_2236817 ) ) ( not ( = ?auto_2236813 ?auto_2236818 ) ) ( not ( = ?auto_2236813 ?auto_2236819 ) ) ( not ( = ?auto_2236813 ?auto_2236820 ) ) ( not ( = ?auto_2236813 ?auto_2236821 ) ) ( not ( = ?auto_2236813 ?auto_2236822 ) ) ( not ( = ?auto_2236813 ?auto_2236823 ) ) ( not ( = ?auto_2236813 ?auto_2236824 ) ) ( not ( = ?auto_2236813 ?auto_2236825 ) ) ( not ( = ?auto_2236813 ?auto_2236827 ) ) ( not ( = ?auto_2236815 ?auto_2236814 ) ) ( not ( = ?auto_2236815 ?auto_2236816 ) ) ( not ( = ?auto_2236815 ?auto_2236817 ) ) ( not ( = ?auto_2236815 ?auto_2236818 ) ) ( not ( = ?auto_2236815 ?auto_2236819 ) ) ( not ( = ?auto_2236815 ?auto_2236820 ) ) ( not ( = ?auto_2236815 ?auto_2236821 ) ) ( not ( = ?auto_2236815 ?auto_2236822 ) ) ( not ( = ?auto_2236815 ?auto_2236823 ) ) ( not ( = ?auto_2236815 ?auto_2236824 ) ) ( not ( = ?auto_2236815 ?auto_2236825 ) ) ( not ( = ?auto_2236815 ?auto_2236827 ) ) ( not ( = ?auto_2236814 ?auto_2236816 ) ) ( not ( = ?auto_2236814 ?auto_2236817 ) ) ( not ( = ?auto_2236814 ?auto_2236818 ) ) ( not ( = ?auto_2236814 ?auto_2236819 ) ) ( not ( = ?auto_2236814 ?auto_2236820 ) ) ( not ( = ?auto_2236814 ?auto_2236821 ) ) ( not ( = ?auto_2236814 ?auto_2236822 ) ) ( not ( = ?auto_2236814 ?auto_2236823 ) ) ( not ( = ?auto_2236814 ?auto_2236824 ) ) ( not ( = ?auto_2236814 ?auto_2236825 ) ) ( not ( = ?auto_2236814 ?auto_2236827 ) ) ( not ( = ?auto_2236816 ?auto_2236817 ) ) ( not ( = ?auto_2236816 ?auto_2236818 ) ) ( not ( = ?auto_2236816 ?auto_2236819 ) ) ( not ( = ?auto_2236816 ?auto_2236820 ) ) ( not ( = ?auto_2236816 ?auto_2236821 ) ) ( not ( = ?auto_2236816 ?auto_2236822 ) ) ( not ( = ?auto_2236816 ?auto_2236823 ) ) ( not ( = ?auto_2236816 ?auto_2236824 ) ) ( not ( = ?auto_2236816 ?auto_2236825 ) ) ( not ( = ?auto_2236816 ?auto_2236827 ) ) ( not ( = ?auto_2236817 ?auto_2236818 ) ) ( not ( = ?auto_2236817 ?auto_2236819 ) ) ( not ( = ?auto_2236817 ?auto_2236820 ) ) ( not ( = ?auto_2236817 ?auto_2236821 ) ) ( not ( = ?auto_2236817 ?auto_2236822 ) ) ( not ( = ?auto_2236817 ?auto_2236823 ) ) ( not ( = ?auto_2236817 ?auto_2236824 ) ) ( not ( = ?auto_2236817 ?auto_2236825 ) ) ( not ( = ?auto_2236817 ?auto_2236827 ) ) ( not ( = ?auto_2236818 ?auto_2236819 ) ) ( not ( = ?auto_2236818 ?auto_2236820 ) ) ( not ( = ?auto_2236818 ?auto_2236821 ) ) ( not ( = ?auto_2236818 ?auto_2236822 ) ) ( not ( = ?auto_2236818 ?auto_2236823 ) ) ( not ( = ?auto_2236818 ?auto_2236824 ) ) ( not ( = ?auto_2236818 ?auto_2236825 ) ) ( not ( = ?auto_2236818 ?auto_2236827 ) ) ( not ( = ?auto_2236819 ?auto_2236820 ) ) ( not ( = ?auto_2236819 ?auto_2236821 ) ) ( not ( = ?auto_2236819 ?auto_2236822 ) ) ( not ( = ?auto_2236819 ?auto_2236823 ) ) ( not ( = ?auto_2236819 ?auto_2236824 ) ) ( not ( = ?auto_2236819 ?auto_2236825 ) ) ( not ( = ?auto_2236819 ?auto_2236827 ) ) ( not ( = ?auto_2236820 ?auto_2236821 ) ) ( not ( = ?auto_2236820 ?auto_2236822 ) ) ( not ( = ?auto_2236820 ?auto_2236823 ) ) ( not ( = ?auto_2236820 ?auto_2236824 ) ) ( not ( = ?auto_2236820 ?auto_2236825 ) ) ( not ( = ?auto_2236820 ?auto_2236827 ) ) ( not ( = ?auto_2236821 ?auto_2236822 ) ) ( not ( = ?auto_2236821 ?auto_2236823 ) ) ( not ( = ?auto_2236821 ?auto_2236824 ) ) ( not ( = ?auto_2236821 ?auto_2236825 ) ) ( not ( = ?auto_2236821 ?auto_2236827 ) ) ( not ( = ?auto_2236822 ?auto_2236823 ) ) ( not ( = ?auto_2236822 ?auto_2236824 ) ) ( not ( = ?auto_2236822 ?auto_2236825 ) ) ( not ( = ?auto_2236822 ?auto_2236827 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2236823 ?auto_2236824 ?auto_2236825 )
      ( MAKE-16CRATE-VERIFY ?auto_2236810 ?auto_2236811 ?auto_2236812 ?auto_2236809 ?auto_2236813 ?auto_2236815 ?auto_2236814 ?auto_2236816 ?auto_2236817 ?auto_2236818 ?auto_2236819 ?auto_2236820 ?auto_2236821 ?auto_2236822 ?auto_2236823 ?auto_2236824 ?auto_2236825 ) )
  )

)

