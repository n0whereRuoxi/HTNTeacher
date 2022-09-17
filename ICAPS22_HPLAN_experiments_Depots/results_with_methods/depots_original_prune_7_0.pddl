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
      ?auto_8298 - SURFACE
      ?auto_8299 - SURFACE
    )
    :vars
    (
      ?auto_8300 - HOIST
      ?auto_8301 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8300 ?auto_8301 ) ( SURFACE-AT ?auto_8299 ?auto_8301 ) ( CLEAR ?auto_8299 ) ( LIFTING ?auto_8300 ?auto_8298 ) ( IS-CRATE ?auto_8298 ) ( not ( = ?auto_8298 ?auto_8299 ) ) )
    :subtasks
    ( ( !DROP ?auto_8300 ?auto_8298 ?auto_8299 ?auto_8301 )
      ( MAKE-ON-VERIFY ?auto_8298 ?auto_8299 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_8302 - SURFACE
      ?auto_8303 - SURFACE
    )
    :vars
    (
      ?auto_8305 - HOIST
      ?auto_8304 - PLACE
      ?auto_8306 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8305 ?auto_8304 ) ( SURFACE-AT ?auto_8303 ?auto_8304 ) ( CLEAR ?auto_8303 ) ( IS-CRATE ?auto_8302 ) ( not ( = ?auto_8302 ?auto_8303 ) ) ( TRUCK-AT ?auto_8306 ?auto_8304 ) ( AVAILABLE ?auto_8305 ) ( IN ?auto_8302 ?auto_8306 ) )
    :subtasks
    ( ( !UNLOAD ?auto_8305 ?auto_8302 ?auto_8306 ?auto_8304 )
      ( MAKE-ON ?auto_8302 ?auto_8303 )
      ( MAKE-ON-VERIFY ?auto_8302 ?auto_8303 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_8307 - SURFACE
      ?auto_8308 - SURFACE
    )
    :vars
    (
      ?auto_8311 - HOIST
      ?auto_8310 - PLACE
      ?auto_8309 - TRUCK
      ?auto_8312 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8311 ?auto_8310 ) ( SURFACE-AT ?auto_8308 ?auto_8310 ) ( CLEAR ?auto_8308 ) ( IS-CRATE ?auto_8307 ) ( not ( = ?auto_8307 ?auto_8308 ) ) ( AVAILABLE ?auto_8311 ) ( IN ?auto_8307 ?auto_8309 ) ( TRUCK-AT ?auto_8309 ?auto_8312 ) ( not ( = ?auto_8312 ?auto_8310 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_8309 ?auto_8312 ?auto_8310 )
      ( MAKE-ON ?auto_8307 ?auto_8308 )
      ( MAKE-ON-VERIFY ?auto_8307 ?auto_8308 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_8313 - SURFACE
      ?auto_8314 - SURFACE
    )
    :vars
    (
      ?auto_8316 - HOIST
      ?auto_8317 - PLACE
      ?auto_8318 - TRUCK
      ?auto_8315 - PLACE
      ?auto_8319 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_8316 ?auto_8317 ) ( SURFACE-AT ?auto_8314 ?auto_8317 ) ( CLEAR ?auto_8314 ) ( IS-CRATE ?auto_8313 ) ( not ( = ?auto_8313 ?auto_8314 ) ) ( AVAILABLE ?auto_8316 ) ( TRUCK-AT ?auto_8318 ?auto_8315 ) ( not ( = ?auto_8315 ?auto_8317 ) ) ( HOIST-AT ?auto_8319 ?auto_8315 ) ( LIFTING ?auto_8319 ?auto_8313 ) ( not ( = ?auto_8316 ?auto_8319 ) ) )
    :subtasks
    ( ( !LOAD ?auto_8319 ?auto_8313 ?auto_8318 ?auto_8315 )
      ( MAKE-ON ?auto_8313 ?auto_8314 )
      ( MAKE-ON-VERIFY ?auto_8313 ?auto_8314 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_8320 - SURFACE
      ?auto_8321 - SURFACE
    )
    :vars
    (
      ?auto_8325 - HOIST
      ?auto_8324 - PLACE
      ?auto_8323 - TRUCK
      ?auto_8322 - PLACE
      ?auto_8326 - HOIST
      ?auto_8327 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8325 ?auto_8324 ) ( SURFACE-AT ?auto_8321 ?auto_8324 ) ( CLEAR ?auto_8321 ) ( IS-CRATE ?auto_8320 ) ( not ( = ?auto_8320 ?auto_8321 ) ) ( AVAILABLE ?auto_8325 ) ( TRUCK-AT ?auto_8323 ?auto_8322 ) ( not ( = ?auto_8322 ?auto_8324 ) ) ( HOIST-AT ?auto_8326 ?auto_8322 ) ( not ( = ?auto_8325 ?auto_8326 ) ) ( AVAILABLE ?auto_8326 ) ( SURFACE-AT ?auto_8320 ?auto_8322 ) ( ON ?auto_8320 ?auto_8327 ) ( CLEAR ?auto_8320 ) ( not ( = ?auto_8320 ?auto_8327 ) ) ( not ( = ?auto_8321 ?auto_8327 ) ) )
    :subtasks
    ( ( !LIFT ?auto_8326 ?auto_8320 ?auto_8327 ?auto_8322 )
      ( MAKE-ON ?auto_8320 ?auto_8321 )
      ( MAKE-ON-VERIFY ?auto_8320 ?auto_8321 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_8328 - SURFACE
      ?auto_8329 - SURFACE
    )
    :vars
    (
      ?auto_8332 - HOIST
      ?auto_8333 - PLACE
      ?auto_8331 - PLACE
      ?auto_8335 - HOIST
      ?auto_8334 - SURFACE
      ?auto_8330 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8332 ?auto_8333 ) ( SURFACE-AT ?auto_8329 ?auto_8333 ) ( CLEAR ?auto_8329 ) ( IS-CRATE ?auto_8328 ) ( not ( = ?auto_8328 ?auto_8329 ) ) ( AVAILABLE ?auto_8332 ) ( not ( = ?auto_8331 ?auto_8333 ) ) ( HOIST-AT ?auto_8335 ?auto_8331 ) ( not ( = ?auto_8332 ?auto_8335 ) ) ( AVAILABLE ?auto_8335 ) ( SURFACE-AT ?auto_8328 ?auto_8331 ) ( ON ?auto_8328 ?auto_8334 ) ( CLEAR ?auto_8328 ) ( not ( = ?auto_8328 ?auto_8334 ) ) ( not ( = ?auto_8329 ?auto_8334 ) ) ( TRUCK-AT ?auto_8330 ?auto_8333 ) )
    :subtasks
    ( ( !DRIVE ?auto_8330 ?auto_8333 ?auto_8331 )
      ( MAKE-ON ?auto_8328 ?auto_8329 )
      ( MAKE-ON-VERIFY ?auto_8328 ?auto_8329 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_8376 - SURFACE
      ?auto_8377 - SURFACE
    )
    :vars
    (
      ?auto_8381 - HOIST
      ?auto_8379 - PLACE
      ?auto_8383 - PLACE
      ?auto_8380 - HOIST
      ?auto_8382 - SURFACE
      ?auto_8378 - TRUCK
      ?auto_8384 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8381 ?auto_8379 ) ( IS-CRATE ?auto_8376 ) ( not ( = ?auto_8376 ?auto_8377 ) ) ( not ( = ?auto_8383 ?auto_8379 ) ) ( HOIST-AT ?auto_8380 ?auto_8383 ) ( not ( = ?auto_8381 ?auto_8380 ) ) ( AVAILABLE ?auto_8380 ) ( SURFACE-AT ?auto_8376 ?auto_8383 ) ( ON ?auto_8376 ?auto_8382 ) ( CLEAR ?auto_8376 ) ( not ( = ?auto_8376 ?auto_8382 ) ) ( not ( = ?auto_8377 ?auto_8382 ) ) ( TRUCK-AT ?auto_8378 ?auto_8379 ) ( SURFACE-AT ?auto_8384 ?auto_8379 ) ( CLEAR ?auto_8384 ) ( LIFTING ?auto_8381 ?auto_8377 ) ( IS-CRATE ?auto_8377 ) ( not ( = ?auto_8376 ?auto_8384 ) ) ( not ( = ?auto_8377 ?auto_8384 ) ) ( not ( = ?auto_8382 ?auto_8384 ) ) )
    :subtasks
    ( ( !DROP ?auto_8381 ?auto_8377 ?auto_8384 ?auto_8379 )
      ( MAKE-ON ?auto_8376 ?auto_8377 )
      ( MAKE-ON-VERIFY ?auto_8376 ?auto_8377 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_8385 - SURFACE
      ?auto_8386 - SURFACE
    )
    :vars
    (
      ?auto_8391 - HOIST
      ?auto_8392 - PLACE
      ?auto_8390 - PLACE
      ?auto_8388 - HOIST
      ?auto_8387 - SURFACE
      ?auto_8393 - TRUCK
      ?auto_8389 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8391 ?auto_8392 ) ( IS-CRATE ?auto_8385 ) ( not ( = ?auto_8385 ?auto_8386 ) ) ( not ( = ?auto_8390 ?auto_8392 ) ) ( HOIST-AT ?auto_8388 ?auto_8390 ) ( not ( = ?auto_8391 ?auto_8388 ) ) ( AVAILABLE ?auto_8388 ) ( SURFACE-AT ?auto_8385 ?auto_8390 ) ( ON ?auto_8385 ?auto_8387 ) ( CLEAR ?auto_8385 ) ( not ( = ?auto_8385 ?auto_8387 ) ) ( not ( = ?auto_8386 ?auto_8387 ) ) ( TRUCK-AT ?auto_8393 ?auto_8392 ) ( SURFACE-AT ?auto_8389 ?auto_8392 ) ( CLEAR ?auto_8389 ) ( IS-CRATE ?auto_8386 ) ( not ( = ?auto_8385 ?auto_8389 ) ) ( not ( = ?auto_8386 ?auto_8389 ) ) ( not ( = ?auto_8387 ?auto_8389 ) ) ( AVAILABLE ?auto_8391 ) ( IN ?auto_8386 ?auto_8393 ) )
    :subtasks
    ( ( !UNLOAD ?auto_8391 ?auto_8386 ?auto_8393 ?auto_8392 )
      ( MAKE-ON ?auto_8385 ?auto_8386 )
      ( MAKE-ON-VERIFY ?auto_8385 ?auto_8386 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_8400 - SURFACE
      ?auto_8401 - SURFACE
    )
    :vars
    (
      ?auto_8407 - HOIST
      ?auto_8404 - PLACE
      ?auto_8402 - PLACE
      ?auto_8406 - HOIST
      ?auto_8403 - SURFACE
      ?auto_8405 - TRUCK
      ?auto_8408 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8407 ?auto_8404 ) ( SURFACE-AT ?auto_8401 ?auto_8404 ) ( CLEAR ?auto_8401 ) ( IS-CRATE ?auto_8400 ) ( not ( = ?auto_8400 ?auto_8401 ) ) ( AVAILABLE ?auto_8407 ) ( not ( = ?auto_8402 ?auto_8404 ) ) ( HOIST-AT ?auto_8406 ?auto_8402 ) ( not ( = ?auto_8407 ?auto_8406 ) ) ( AVAILABLE ?auto_8406 ) ( SURFACE-AT ?auto_8400 ?auto_8402 ) ( ON ?auto_8400 ?auto_8403 ) ( CLEAR ?auto_8400 ) ( not ( = ?auto_8400 ?auto_8403 ) ) ( not ( = ?auto_8401 ?auto_8403 ) ) ( TRUCK-AT ?auto_8405 ?auto_8408 ) ( not ( = ?auto_8408 ?auto_8404 ) ) ( not ( = ?auto_8402 ?auto_8408 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_8405 ?auto_8408 ?auto_8404 )
      ( MAKE-ON ?auto_8400 ?auto_8401 )
      ( MAKE-ON-VERIFY ?auto_8400 ?auto_8401 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_8488 - SURFACE
      ?auto_8489 - SURFACE
    )
    :vars
    (
      ?auto_8495 - HOIST
      ?auto_8492 - PLACE
      ?auto_8493 - TRUCK
      ?auto_8491 - PLACE
      ?auto_8494 - HOIST
      ?auto_8490 - SURFACE
      ?auto_8496 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8495 ?auto_8492 ) ( SURFACE-AT ?auto_8489 ?auto_8492 ) ( CLEAR ?auto_8489 ) ( IS-CRATE ?auto_8488 ) ( not ( = ?auto_8488 ?auto_8489 ) ) ( AVAILABLE ?auto_8495 ) ( TRUCK-AT ?auto_8493 ?auto_8491 ) ( not ( = ?auto_8491 ?auto_8492 ) ) ( HOIST-AT ?auto_8494 ?auto_8491 ) ( not ( = ?auto_8495 ?auto_8494 ) ) ( SURFACE-AT ?auto_8488 ?auto_8491 ) ( ON ?auto_8488 ?auto_8490 ) ( CLEAR ?auto_8488 ) ( not ( = ?auto_8488 ?auto_8490 ) ) ( not ( = ?auto_8489 ?auto_8490 ) ) ( LIFTING ?auto_8494 ?auto_8496 ) ( IS-CRATE ?auto_8496 ) ( not ( = ?auto_8488 ?auto_8496 ) ) ( not ( = ?auto_8489 ?auto_8496 ) ) ( not ( = ?auto_8490 ?auto_8496 ) ) )
    :subtasks
    ( ( !LOAD ?auto_8494 ?auto_8496 ?auto_8493 ?auto_8491 )
      ( MAKE-ON ?auto_8488 ?auto_8489 )
      ( MAKE-ON-VERIFY ?auto_8488 ?auto_8489 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_8592 - SURFACE
      ?auto_8593 - SURFACE
    )
    :vars
    (
      ?auto_8597 - HOIST
      ?auto_8594 - PLACE
      ?auto_8596 - PLACE
      ?auto_8599 - HOIST
      ?auto_8595 - SURFACE
      ?auto_8598 - TRUCK
      ?auto_8600 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8597 ?auto_8594 ) ( SURFACE-AT ?auto_8593 ?auto_8594 ) ( CLEAR ?auto_8593 ) ( IS-CRATE ?auto_8592 ) ( not ( = ?auto_8592 ?auto_8593 ) ) ( not ( = ?auto_8596 ?auto_8594 ) ) ( HOIST-AT ?auto_8599 ?auto_8596 ) ( not ( = ?auto_8597 ?auto_8599 ) ) ( AVAILABLE ?auto_8599 ) ( SURFACE-AT ?auto_8592 ?auto_8596 ) ( ON ?auto_8592 ?auto_8595 ) ( CLEAR ?auto_8592 ) ( not ( = ?auto_8592 ?auto_8595 ) ) ( not ( = ?auto_8593 ?auto_8595 ) ) ( TRUCK-AT ?auto_8598 ?auto_8594 ) ( LIFTING ?auto_8597 ?auto_8600 ) ( IS-CRATE ?auto_8600 ) ( not ( = ?auto_8592 ?auto_8600 ) ) ( not ( = ?auto_8593 ?auto_8600 ) ) ( not ( = ?auto_8595 ?auto_8600 ) ) )
    :subtasks
    ( ( !LOAD ?auto_8597 ?auto_8600 ?auto_8598 ?auto_8594 )
      ( MAKE-ON ?auto_8592 ?auto_8593 )
      ( MAKE-ON-VERIFY ?auto_8592 ?auto_8593 ) )
  )

)

