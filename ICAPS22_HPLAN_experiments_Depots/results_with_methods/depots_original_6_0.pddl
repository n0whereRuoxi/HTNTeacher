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
      ?auto_10378 - SURFACE
      ?auto_10379 - SURFACE
    )
    :vars
    (
      ?auto_10380 - HOIST
      ?auto_10381 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10380 ?auto_10381 ) ( SURFACE-AT ?auto_10379 ?auto_10381 ) ( CLEAR ?auto_10379 ) ( LIFTING ?auto_10380 ?auto_10378 ) ( IS-CRATE ?auto_10378 ) ( not ( = ?auto_10378 ?auto_10379 ) ) )
    :subtasks
    ( ( !DROP ?auto_10380 ?auto_10378 ?auto_10379 ?auto_10381 )
      ( MAKE-ON-VERIFY ?auto_10378 ?auto_10379 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_10382 - SURFACE
      ?auto_10383 - SURFACE
    )
    :vars
    (
      ?auto_10385 - HOIST
      ?auto_10384 - PLACE
      ?auto_10386 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10385 ?auto_10384 ) ( SURFACE-AT ?auto_10383 ?auto_10384 ) ( CLEAR ?auto_10383 ) ( IS-CRATE ?auto_10382 ) ( not ( = ?auto_10382 ?auto_10383 ) ) ( TRUCK-AT ?auto_10386 ?auto_10384 ) ( AVAILABLE ?auto_10385 ) ( IN ?auto_10382 ?auto_10386 ) )
    :subtasks
    ( ( !UNLOAD ?auto_10385 ?auto_10382 ?auto_10386 ?auto_10384 )
      ( MAKE-ON ?auto_10382 ?auto_10383 )
      ( MAKE-ON-VERIFY ?auto_10382 ?auto_10383 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_10387 - SURFACE
      ?auto_10388 - SURFACE
    )
    :vars
    (
      ?auto_10390 - HOIST
      ?auto_10391 - PLACE
      ?auto_10389 - TRUCK
      ?auto_10392 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10390 ?auto_10391 ) ( SURFACE-AT ?auto_10388 ?auto_10391 ) ( CLEAR ?auto_10388 ) ( IS-CRATE ?auto_10387 ) ( not ( = ?auto_10387 ?auto_10388 ) ) ( AVAILABLE ?auto_10390 ) ( IN ?auto_10387 ?auto_10389 ) ( TRUCK-AT ?auto_10389 ?auto_10392 ) ( not ( = ?auto_10392 ?auto_10391 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_10389 ?auto_10392 ?auto_10391 )
      ( MAKE-ON ?auto_10387 ?auto_10388 )
      ( MAKE-ON-VERIFY ?auto_10387 ?auto_10388 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_10393 - SURFACE
      ?auto_10394 - SURFACE
    )
    :vars
    (
      ?auto_10396 - HOIST
      ?auto_10397 - PLACE
      ?auto_10395 - TRUCK
      ?auto_10398 - PLACE
      ?auto_10399 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_10396 ?auto_10397 ) ( SURFACE-AT ?auto_10394 ?auto_10397 ) ( CLEAR ?auto_10394 ) ( IS-CRATE ?auto_10393 ) ( not ( = ?auto_10393 ?auto_10394 ) ) ( AVAILABLE ?auto_10396 ) ( TRUCK-AT ?auto_10395 ?auto_10398 ) ( not ( = ?auto_10398 ?auto_10397 ) ) ( HOIST-AT ?auto_10399 ?auto_10398 ) ( LIFTING ?auto_10399 ?auto_10393 ) ( not ( = ?auto_10396 ?auto_10399 ) ) )
    :subtasks
    ( ( !LOAD ?auto_10399 ?auto_10393 ?auto_10395 ?auto_10398 )
      ( MAKE-ON ?auto_10393 ?auto_10394 )
      ( MAKE-ON-VERIFY ?auto_10393 ?auto_10394 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_10400 - SURFACE
      ?auto_10401 - SURFACE
    )
    :vars
    (
      ?auto_10403 - HOIST
      ?auto_10405 - PLACE
      ?auto_10402 - TRUCK
      ?auto_10406 - PLACE
      ?auto_10404 - HOIST
      ?auto_10407 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10403 ?auto_10405 ) ( SURFACE-AT ?auto_10401 ?auto_10405 ) ( CLEAR ?auto_10401 ) ( IS-CRATE ?auto_10400 ) ( not ( = ?auto_10400 ?auto_10401 ) ) ( AVAILABLE ?auto_10403 ) ( TRUCK-AT ?auto_10402 ?auto_10406 ) ( not ( = ?auto_10406 ?auto_10405 ) ) ( HOIST-AT ?auto_10404 ?auto_10406 ) ( not ( = ?auto_10403 ?auto_10404 ) ) ( AVAILABLE ?auto_10404 ) ( SURFACE-AT ?auto_10400 ?auto_10406 ) ( ON ?auto_10400 ?auto_10407 ) ( CLEAR ?auto_10400 ) ( not ( = ?auto_10400 ?auto_10407 ) ) ( not ( = ?auto_10401 ?auto_10407 ) ) )
    :subtasks
    ( ( !LIFT ?auto_10404 ?auto_10400 ?auto_10407 ?auto_10406 )
      ( MAKE-ON ?auto_10400 ?auto_10401 )
      ( MAKE-ON-VERIFY ?auto_10400 ?auto_10401 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_10408 - SURFACE
      ?auto_10409 - SURFACE
    )
    :vars
    (
      ?auto_10412 - HOIST
      ?auto_10414 - PLACE
      ?auto_10410 - PLACE
      ?auto_10413 - HOIST
      ?auto_10411 - SURFACE
      ?auto_10415 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10412 ?auto_10414 ) ( SURFACE-AT ?auto_10409 ?auto_10414 ) ( CLEAR ?auto_10409 ) ( IS-CRATE ?auto_10408 ) ( not ( = ?auto_10408 ?auto_10409 ) ) ( AVAILABLE ?auto_10412 ) ( not ( = ?auto_10410 ?auto_10414 ) ) ( HOIST-AT ?auto_10413 ?auto_10410 ) ( not ( = ?auto_10412 ?auto_10413 ) ) ( AVAILABLE ?auto_10413 ) ( SURFACE-AT ?auto_10408 ?auto_10410 ) ( ON ?auto_10408 ?auto_10411 ) ( CLEAR ?auto_10408 ) ( not ( = ?auto_10408 ?auto_10411 ) ) ( not ( = ?auto_10409 ?auto_10411 ) ) ( TRUCK-AT ?auto_10415 ?auto_10414 ) )
    :subtasks
    ( ( !DRIVE ?auto_10415 ?auto_10414 ?auto_10410 )
      ( MAKE-ON ?auto_10408 ?auto_10409 )
      ( MAKE-ON-VERIFY ?auto_10408 ?auto_10409 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_10418 - SURFACE
      ?auto_10419 - SURFACE
    )
    :vars
    (
      ?auto_10420 - HOIST
      ?auto_10421 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10420 ?auto_10421 ) ( SURFACE-AT ?auto_10419 ?auto_10421 ) ( CLEAR ?auto_10419 ) ( LIFTING ?auto_10420 ?auto_10418 ) ( IS-CRATE ?auto_10418 ) ( not ( = ?auto_10418 ?auto_10419 ) ) )
    :subtasks
    ( ( !DROP ?auto_10420 ?auto_10418 ?auto_10419 ?auto_10421 )
      ( MAKE-ON-VERIFY ?auto_10418 ?auto_10419 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_10422 - SURFACE
      ?auto_10423 - SURFACE
    )
    :vars
    (
      ?auto_10424 - HOIST
      ?auto_10425 - PLACE
      ?auto_10426 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10424 ?auto_10425 ) ( SURFACE-AT ?auto_10423 ?auto_10425 ) ( CLEAR ?auto_10423 ) ( IS-CRATE ?auto_10422 ) ( not ( = ?auto_10422 ?auto_10423 ) ) ( TRUCK-AT ?auto_10426 ?auto_10425 ) ( AVAILABLE ?auto_10424 ) ( IN ?auto_10422 ?auto_10426 ) )
    :subtasks
    ( ( !UNLOAD ?auto_10424 ?auto_10422 ?auto_10426 ?auto_10425 )
      ( MAKE-ON ?auto_10422 ?auto_10423 )
      ( MAKE-ON-VERIFY ?auto_10422 ?auto_10423 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_10427 - SURFACE
      ?auto_10428 - SURFACE
    )
    :vars
    (
      ?auto_10429 - HOIST
      ?auto_10431 - PLACE
      ?auto_10430 - TRUCK
      ?auto_10432 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10429 ?auto_10431 ) ( SURFACE-AT ?auto_10428 ?auto_10431 ) ( CLEAR ?auto_10428 ) ( IS-CRATE ?auto_10427 ) ( not ( = ?auto_10427 ?auto_10428 ) ) ( AVAILABLE ?auto_10429 ) ( IN ?auto_10427 ?auto_10430 ) ( TRUCK-AT ?auto_10430 ?auto_10432 ) ( not ( = ?auto_10432 ?auto_10431 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_10430 ?auto_10432 ?auto_10431 )
      ( MAKE-ON ?auto_10427 ?auto_10428 )
      ( MAKE-ON-VERIFY ?auto_10427 ?auto_10428 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_10433 - SURFACE
      ?auto_10434 - SURFACE
    )
    :vars
    (
      ?auto_10438 - HOIST
      ?auto_10436 - PLACE
      ?auto_10435 - TRUCK
      ?auto_10437 - PLACE
      ?auto_10439 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_10438 ?auto_10436 ) ( SURFACE-AT ?auto_10434 ?auto_10436 ) ( CLEAR ?auto_10434 ) ( IS-CRATE ?auto_10433 ) ( not ( = ?auto_10433 ?auto_10434 ) ) ( AVAILABLE ?auto_10438 ) ( TRUCK-AT ?auto_10435 ?auto_10437 ) ( not ( = ?auto_10437 ?auto_10436 ) ) ( HOIST-AT ?auto_10439 ?auto_10437 ) ( LIFTING ?auto_10439 ?auto_10433 ) ( not ( = ?auto_10438 ?auto_10439 ) ) )
    :subtasks
    ( ( !LOAD ?auto_10439 ?auto_10433 ?auto_10435 ?auto_10437 )
      ( MAKE-ON ?auto_10433 ?auto_10434 )
      ( MAKE-ON-VERIFY ?auto_10433 ?auto_10434 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_10440 - SURFACE
      ?auto_10441 - SURFACE
    )
    :vars
    (
      ?auto_10445 - HOIST
      ?auto_10443 - PLACE
      ?auto_10442 - TRUCK
      ?auto_10444 - PLACE
      ?auto_10446 - HOIST
      ?auto_10447 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10445 ?auto_10443 ) ( SURFACE-AT ?auto_10441 ?auto_10443 ) ( CLEAR ?auto_10441 ) ( IS-CRATE ?auto_10440 ) ( not ( = ?auto_10440 ?auto_10441 ) ) ( AVAILABLE ?auto_10445 ) ( TRUCK-AT ?auto_10442 ?auto_10444 ) ( not ( = ?auto_10444 ?auto_10443 ) ) ( HOIST-AT ?auto_10446 ?auto_10444 ) ( not ( = ?auto_10445 ?auto_10446 ) ) ( AVAILABLE ?auto_10446 ) ( SURFACE-AT ?auto_10440 ?auto_10444 ) ( ON ?auto_10440 ?auto_10447 ) ( CLEAR ?auto_10440 ) ( not ( = ?auto_10440 ?auto_10447 ) ) ( not ( = ?auto_10441 ?auto_10447 ) ) )
    :subtasks
    ( ( !LIFT ?auto_10446 ?auto_10440 ?auto_10447 ?auto_10444 )
      ( MAKE-ON ?auto_10440 ?auto_10441 )
      ( MAKE-ON-VERIFY ?auto_10440 ?auto_10441 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_10448 - SURFACE
      ?auto_10449 - SURFACE
    )
    :vars
    (
      ?auto_10455 - HOIST
      ?auto_10453 - PLACE
      ?auto_10454 - PLACE
      ?auto_10451 - HOIST
      ?auto_10452 - SURFACE
      ?auto_10450 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10455 ?auto_10453 ) ( SURFACE-AT ?auto_10449 ?auto_10453 ) ( CLEAR ?auto_10449 ) ( IS-CRATE ?auto_10448 ) ( not ( = ?auto_10448 ?auto_10449 ) ) ( AVAILABLE ?auto_10455 ) ( not ( = ?auto_10454 ?auto_10453 ) ) ( HOIST-AT ?auto_10451 ?auto_10454 ) ( not ( = ?auto_10455 ?auto_10451 ) ) ( AVAILABLE ?auto_10451 ) ( SURFACE-AT ?auto_10448 ?auto_10454 ) ( ON ?auto_10448 ?auto_10452 ) ( CLEAR ?auto_10448 ) ( not ( = ?auto_10448 ?auto_10452 ) ) ( not ( = ?auto_10449 ?auto_10452 ) ) ( TRUCK-AT ?auto_10450 ?auto_10453 ) )
    :subtasks
    ( ( !DRIVE ?auto_10450 ?auto_10453 ?auto_10454 )
      ( MAKE-ON ?auto_10448 ?auto_10449 )
      ( MAKE-ON-VERIFY ?auto_10448 ?auto_10449 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_10456 - SURFACE
      ?auto_10457 - SURFACE
    )
    :vars
    (
      ?auto_10460 - HOIST
      ?auto_10463 - PLACE
      ?auto_10459 - PLACE
      ?auto_10462 - HOIST
      ?auto_10458 - SURFACE
      ?auto_10461 - TRUCK
      ?auto_10464 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10460 ?auto_10463 ) ( IS-CRATE ?auto_10456 ) ( not ( = ?auto_10456 ?auto_10457 ) ) ( not ( = ?auto_10459 ?auto_10463 ) ) ( HOIST-AT ?auto_10462 ?auto_10459 ) ( not ( = ?auto_10460 ?auto_10462 ) ) ( AVAILABLE ?auto_10462 ) ( SURFACE-AT ?auto_10456 ?auto_10459 ) ( ON ?auto_10456 ?auto_10458 ) ( CLEAR ?auto_10456 ) ( not ( = ?auto_10456 ?auto_10458 ) ) ( not ( = ?auto_10457 ?auto_10458 ) ) ( TRUCK-AT ?auto_10461 ?auto_10463 ) ( SURFACE-AT ?auto_10464 ?auto_10463 ) ( CLEAR ?auto_10464 ) ( LIFTING ?auto_10460 ?auto_10457 ) ( IS-CRATE ?auto_10457 ) ( not ( = ?auto_10456 ?auto_10464 ) ) ( not ( = ?auto_10457 ?auto_10464 ) ) ( not ( = ?auto_10458 ?auto_10464 ) ) )
    :subtasks
    ( ( !DROP ?auto_10460 ?auto_10457 ?auto_10464 ?auto_10463 )
      ( MAKE-ON ?auto_10456 ?auto_10457 )
      ( MAKE-ON-VERIFY ?auto_10456 ?auto_10457 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_10465 - SURFACE
      ?auto_10466 - SURFACE
    )
    :vars
    (
      ?auto_10469 - HOIST
      ?auto_10467 - PLACE
      ?auto_10472 - PLACE
      ?auto_10471 - HOIST
      ?auto_10470 - SURFACE
      ?auto_10468 - TRUCK
      ?auto_10473 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10469 ?auto_10467 ) ( IS-CRATE ?auto_10465 ) ( not ( = ?auto_10465 ?auto_10466 ) ) ( not ( = ?auto_10472 ?auto_10467 ) ) ( HOIST-AT ?auto_10471 ?auto_10472 ) ( not ( = ?auto_10469 ?auto_10471 ) ) ( AVAILABLE ?auto_10471 ) ( SURFACE-AT ?auto_10465 ?auto_10472 ) ( ON ?auto_10465 ?auto_10470 ) ( CLEAR ?auto_10465 ) ( not ( = ?auto_10465 ?auto_10470 ) ) ( not ( = ?auto_10466 ?auto_10470 ) ) ( TRUCK-AT ?auto_10468 ?auto_10467 ) ( SURFACE-AT ?auto_10473 ?auto_10467 ) ( CLEAR ?auto_10473 ) ( IS-CRATE ?auto_10466 ) ( not ( = ?auto_10465 ?auto_10473 ) ) ( not ( = ?auto_10466 ?auto_10473 ) ) ( not ( = ?auto_10470 ?auto_10473 ) ) ( AVAILABLE ?auto_10469 ) ( IN ?auto_10466 ?auto_10468 ) )
    :subtasks
    ( ( !UNLOAD ?auto_10469 ?auto_10466 ?auto_10468 ?auto_10467 )
      ( MAKE-ON ?auto_10465 ?auto_10466 )
      ( MAKE-ON-VERIFY ?auto_10465 ?auto_10466 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_10474 - SURFACE
      ?auto_10475 - SURFACE
    )
    :vars
    (
      ?auto_10477 - HOIST
      ?auto_10480 - PLACE
      ?auto_10478 - PLACE
      ?auto_10482 - HOIST
      ?auto_10479 - SURFACE
      ?auto_10481 - SURFACE
      ?auto_10476 - TRUCK
      ?auto_10483 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10477 ?auto_10480 ) ( IS-CRATE ?auto_10474 ) ( not ( = ?auto_10474 ?auto_10475 ) ) ( not ( = ?auto_10478 ?auto_10480 ) ) ( HOIST-AT ?auto_10482 ?auto_10478 ) ( not ( = ?auto_10477 ?auto_10482 ) ) ( AVAILABLE ?auto_10482 ) ( SURFACE-AT ?auto_10474 ?auto_10478 ) ( ON ?auto_10474 ?auto_10479 ) ( CLEAR ?auto_10474 ) ( not ( = ?auto_10474 ?auto_10479 ) ) ( not ( = ?auto_10475 ?auto_10479 ) ) ( SURFACE-AT ?auto_10481 ?auto_10480 ) ( CLEAR ?auto_10481 ) ( IS-CRATE ?auto_10475 ) ( not ( = ?auto_10474 ?auto_10481 ) ) ( not ( = ?auto_10475 ?auto_10481 ) ) ( not ( = ?auto_10479 ?auto_10481 ) ) ( AVAILABLE ?auto_10477 ) ( IN ?auto_10475 ?auto_10476 ) ( TRUCK-AT ?auto_10476 ?auto_10483 ) ( not ( = ?auto_10483 ?auto_10480 ) ) ( not ( = ?auto_10478 ?auto_10483 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_10476 ?auto_10483 ?auto_10480 )
      ( MAKE-ON ?auto_10474 ?auto_10475 )
      ( MAKE-ON-VERIFY ?auto_10474 ?auto_10475 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_10484 - SURFACE
      ?auto_10485 - SURFACE
    )
    :vars
    (
      ?auto_10487 - HOIST
      ?auto_10489 - PLACE
      ?auto_10492 - PLACE
      ?auto_10488 - HOIST
      ?auto_10490 - SURFACE
      ?auto_10491 - SURFACE
      ?auto_10486 - TRUCK
      ?auto_10493 - PLACE
      ?auto_10494 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_10487 ?auto_10489 ) ( IS-CRATE ?auto_10484 ) ( not ( = ?auto_10484 ?auto_10485 ) ) ( not ( = ?auto_10492 ?auto_10489 ) ) ( HOIST-AT ?auto_10488 ?auto_10492 ) ( not ( = ?auto_10487 ?auto_10488 ) ) ( AVAILABLE ?auto_10488 ) ( SURFACE-AT ?auto_10484 ?auto_10492 ) ( ON ?auto_10484 ?auto_10490 ) ( CLEAR ?auto_10484 ) ( not ( = ?auto_10484 ?auto_10490 ) ) ( not ( = ?auto_10485 ?auto_10490 ) ) ( SURFACE-AT ?auto_10491 ?auto_10489 ) ( CLEAR ?auto_10491 ) ( IS-CRATE ?auto_10485 ) ( not ( = ?auto_10484 ?auto_10491 ) ) ( not ( = ?auto_10485 ?auto_10491 ) ) ( not ( = ?auto_10490 ?auto_10491 ) ) ( AVAILABLE ?auto_10487 ) ( TRUCK-AT ?auto_10486 ?auto_10493 ) ( not ( = ?auto_10493 ?auto_10489 ) ) ( not ( = ?auto_10492 ?auto_10493 ) ) ( HOIST-AT ?auto_10494 ?auto_10493 ) ( LIFTING ?auto_10494 ?auto_10485 ) ( not ( = ?auto_10487 ?auto_10494 ) ) ( not ( = ?auto_10488 ?auto_10494 ) ) )
    :subtasks
    ( ( !LOAD ?auto_10494 ?auto_10485 ?auto_10486 ?auto_10493 )
      ( MAKE-ON ?auto_10484 ?auto_10485 )
      ( MAKE-ON-VERIFY ?auto_10484 ?auto_10485 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_10495 - SURFACE
      ?auto_10496 - SURFACE
    )
    :vars
    (
      ?auto_10499 - HOIST
      ?auto_10503 - PLACE
      ?auto_10498 - PLACE
      ?auto_10504 - HOIST
      ?auto_10502 - SURFACE
      ?auto_10501 - SURFACE
      ?auto_10500 - TRUCK
      ?auto_10497 - PLACE
      ?auto_10505 - HOIST
      ?auto_10506 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10499 ?auto_10503 ) ( IS-CRATE ?auto_10495 ) ( not ( = ?auto_10495 ?auto_10496 ) ) ( not ( = ?auto_10498 ?auto_10503 ) ) ( HOIST-AT ?auto_10504 ?auto_10498 ) ( not ( = ?auto_10499 ?auto_10504 ) ) ( AVAILABLE ?auto_10504 ) ( SURFACE-AT ?auto_10495 ?auto_10498 ) ( ON ?auto_10495 ?auto_10502 ) ( CLEAR ?auto_10495 ) ( not ( = ?auto_10495 ?auto_10502 ) ) ( not ( = ?auto_10496 ?auto_10502 ) ) ( SURFACE-AT ?auto_10501 ?auto_10503 ) ( CLEAR ?auto_10501 ) ( IS-CRATE ?auto_10496 ) ( not ( = ?auto_10495 ?auto_10501 ) ) ( not ( = ?auto_10496 ?auto_10501 ) ) ( not ( = ?auto_10502 ?auto_10501 ) ) ( AVAILABLE ?auto_10499 ) ( TRUCK-AT ?auto_10500 ?auto_10497 ) ( not ( = ?auto_10497 ?auto_10503 ) ) ( not ( = ?auto_10498 ?auto_10497 ) ) ( HOIST-AT ?auto_10505 ?auto_10497 ) ( not ( = ?auto_10499 ?auto_10505 ) ) ( not ( = ?auto_10504 ?auto_10505 ) ) ( AVAILABLE ?auto_10505 ) ( SURFACE-AT ?auto_10496 ?auto_10497 ) ( ON ?auto_10496 ?auto_10506 ) ( CLEAR ?auto_10496 ) ( not ( = ?auto_10495 ?auto_10506 ) ) ( not ( = ?auto_10496 ?auto_10506 ) ) ( not ( = ?auto_10502 ?auto_10506 ) ) ( not ( = ?auto_10501 ?auto_10506 ) ) )
    :subtasks
    ( ( !LIFT ?auto_10505 ?auto_10496 ?auto_10506 ?auto_10497 )
      ( MAKE-ON ?auto_10495 ?auto_10496 )
      ( MAKE-ON-VERIFY ?auto_10495 ?auto_10496 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_10507 - SURFACE
      ?auto_10508 - SURFACE
    )
    :vars
    (
      ?auto_10511 - HOIST
      ?auto_10513 - PLACE
      ?auto_10517 - PLACE
      ?auto_10515 - HOIST
      ?auto_10512 - SURFACE
      ?auto_10509 - SURFACE
      ?auto_10510 - PLACE
      ?auto_10518 - HOIST
      ?auto_10514 - SURFACE
      ?auto_10516 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10511 ?auto_10513 ) ( IS-CRATE ?auto_10507 ) ( not ( = ?auto_10507 ?auto_10508 ) ) ( not ( = ?auto_10517 ?auto_10513 ) ) ( HOIST-AT ?auto_10515 ?auto_10517 ) ( not ( = ?auto_10511 ?auto_10515 ) ) ( AVAILABLE ?auto_10515 ) ( SURFACE-AT ?auto_10507 ?auto_10517 ) ( ON ?auto_10507 ?auto_10512 ) ( CLEAR ?auto_10507 ) ( not ( = ?auto_10507 ?auto_10512 ) ) ( not ( = ?auto_10508 ?auto_10512 ) ) ( SURFACE-AT ?auto_10509 ?auto_10513 ) ( CLEAR ?auto_10509 ) ( IS-CRATE ?auto_10508 ) ( not ( = ?auto_10507 ?auto_10509 ) ) ( not ( = ?auto_10508 ?auto_10509 ) ) ( not ( = ?auto_10512 ?auto_10509 ) ) ( AVAILABLE ?auto_10511 ) ( not ( = ?auto_10510 ?auto_10513 ) ) ( not ( = ?auto_10517 ?auto_10510 ) ) ( HOIST-AT ?auto_10518 ?auto_10510 ) ( not ( = ?auto_10511 ?auto_10518 ) ) ( not ( = ?auto_10515 ?auto_10518 ) ) ( AVAILABLE ?auto_10518 ) ( SURFACE-AT ?auto_10508 ?auto_10510 ) ( ON ?auto_10508 ?auto_10514 ) ( CLEAR ?auto_10508 ) ( not ( = ?auto_10507 ?auto_10514 ) ) ( not ( = ?auto_10508 ?auto_10514 ) ) ( not ( = ?auto_10512 ?auto_10514 ) ) ( not ( = ?auto_10509 ?auto_10514 ) ) ( TRUCK-AT ?auto_10516 ?auto_10513 ) )
    :subtasks
    ( ( !DRIVE ?auto_10516 ?auto_10513 ?auto_10510 )
      ( MAKE-ON ?auto_10507 ?auto_10508 )
      ( MAKE-ON-VERIFY ?auto_10507 ?auto_10508 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_10521 - SURFACE
      ?auto_10522 - SURFACE
    )
    :vars
    (
      ?auto_10523 - HOIST
      ?auto_10524 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10523 ?auto_10524 ) ( SURFACE-AT ?auto_10522 ?auto_10524 ) ( CLEAR ?auto_10522 ) ( LIFTING ?auto_10523 ?auto_10521 ) ( IS-CRATE ?auto_10521 ) ( not ( = ?auto_10521 ?auto_10522 ) ) )
    :subtasks
    ( ( !DROP ?auto_10523 ?auto_10521 ?auto_10522 ?auto_10524 )
      ( MAKE-ON-VERIFY ?auto_10521 ?auto_10522 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_10525 - SURFACE
      ?auto_10526 - SURFACE
    )
    :vars
    (
      ?auto_10528 - HOIST
      ?auto_10527 - PLACE
      ?auto_10529 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10528 ?auto_10527 ) ( SURFACE-AT ?auto_10526 ?auto_10527 ) ( CLEAR ?auto_10526 ) ( IS-CRATE ?auto_10525 ) ( not ( = ?auto_10525 ?auto_10526 ) ) ( TRUCK-AT ?auto_10529 ?auto_10527 ) ( AVAILABLE ?auto_10528 ) ( IN ?auto_10525 ?auto_10529 ) )
    :subtasks
    ( ( !UNLOAD ?auto_10528 ?auto_10525 ?auto_10529 ?auto_10527 )
      ( MAKE-ON ?auto_10525 ?auto_10526 )
      ( MAKE-ON-VERIFY ?auto_10525 ?auto_10526 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_10530 - SURFACE
      ?auto_10531 - SURFACE
    )
    :vars
    (
      ?auto_10534 - HOIST
      ?auto_10532 - PLACE
      ?auto_10533 - TRUCK
      ?auto_10535 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10534 ?auto_10532 ) ( SURFACE-AT ?auto_10531 ?auto_10532 ) ( CLEAR ?auto_10531 ) ( IS-CRATE ?auto_10530 ) ( not ( = ?auto_10530 ?auto_10531 ) ) ( AVAILABLE ?auto_10534 ) ( IN ?auto_10530 ?auto_10533 ) ( TRUCK-AT ?auto_10533 ?auto_10535 ) ( not ( = ?auto_10535 ?auto_10532 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_10533 ?auto_10535 ?auto_10532 )
      ( MAKE-ON ?auto_10530 ?auto_10531 )
      ( MAKE-ON-VERIFY ?auto_10530 ?auto_10531 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_10536 - SURFACE
      ?auto_10537 - SURFACE
    )
    :vars
    (
      ?auto_10539 - HOIST
      ?auto_10541 - PLACE
      ?auto_10538 - TRUCK
      ?auto_10540 - PLACE
      ?auto_10542 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_10539 ?auto_10541 ) ( SURFACE-AT ?auto_10537 ?auto_10541 ) ( CLEAR ?auto_10537 ) ( IS-CRATE ?auto_10536 ) ( not ( = ?auto_10536 ?auto_10537 ) ) ( AVAILABLE ?auto_10539 ) ( TRUCK-AT ?auto_10538 ?auto_10540 ) ( not ( = ?auto_10540 ?auto_10541 ) ) ( HOIST-AT ?auto_10542 ?auto_10540 ) ( LIFTING ?auto_10542 ?auto_10536 ) ( not ( = ?auto_10539 ?auto_10542 ) ) )
    :subtasks
    ( ( !LOAD ?auto_10542 ?auto_10536 ?auto_10538 ?auto_10540 )
      ( MAKE-ON ?auto_10536 ?auto_10537 )
      ( MAKE-ON-VERIFY ?auto_10536 ?auto_10537 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_10543 - SURFACE
      ?auto_10544 - SURFACE
    )
    :vars
    (
      ?auto_10549 - HOIST
      ?auto_10547 - PLACE
      ?auto_10545 - TRUCK
      ?auto_10548 - PLACE
      ?auto_10546 - HOIST
      ?auto_10550 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10549 ?auto_10547 ) ( SURFACE-AT ?auto_10544 ?auto_10547 ) ( CLEAR ?auto_10544 ) ( IS-CRATE ?auto_10543 ) ( not ( = ?auto_10543 ?auto_10544 ) ) ( AVAILABLE ?auto_10549 ) ( TRUCK-AT ?auto_10545 ?auto_10548 ) ( not ( = ?auto_10548 ?auto_10547 ) ) ( HOIST-AT ?auto_10546 ?auto_10548 ) ( not ( = ?auto_10549 ?auto_10546 ) ) ( AVAILABLE ?auto_10546 ) ( SURFACE-AT ?auto_10543 ?auto_10548 ) ( ON ?auto_10543 ?auto_10550 ) ( CLEAR ?auto_10543 ) ( not ( = ?auto_10543 ?auto_10550 ) ) ( not ( = ?auto_10544 ?auto_10550 ) ) )
    :subtasks
    ( ( !LIFT ?auto_10546 ?auto_10543 ?auto_10550 ?auto_10548 )
      ( MAKE-ON ?auto_10543 ?auto_10544 )
      ( MAKE-ON-VERIFY ?auto_10543 ?auto_10544 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_10551 - SURFACE
      ?auto_10552 - SURFACE
    )
    :vars
    (
      ?auto_10554 - HOIST
      ?auto_10553 - PLACE
      ?auto_10557 - PLACE
      ?auto_10555 - HOIST
      ?auto_10556 - SURFACE
      ?auto_10558 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10554 ?auto_10553 ) ( SURFACE-AT ?auto_10552 ?auto_10553 ) ( CLEAR ?auto_10552 ) ( IS-CRATE ?auto_10551 ) ( not ( = ?auto_10551 ?auto_10552 ) ) ( AVAILABLE ?auto_10554 ) ( not ( = ?auto_10557 ?auto_10553 ) ) ( HOIST-AT ?auto_10555 ?auto_10557 ) ( not ( = ?auto_10554 ?auto_10555 ) ) ( AVAILABLE ?auto_10555 ) ( SURFACE-AT ?auto_10551 ?auto_10557 ) ( ON ?auto_10551 ?auto_10556 ) ( CLEAR ?auto_10551 ) ( not ( = ?auto_10551 ?auto_10556 ) ) ( not ( = ?auto_10552 ?auto_10556 ) ) ( TRUCK-AT ?auto_10558 ?auto_10553 ) )
    :subtasks
    ( ( !DRIVE ?auto_10558 ?auto_10553 ?auto_10557 )
      ( MAKE-ON ?auto_10551 ?auto_10552 )
      ( MAKE-ON-VERIFY ?auto_10551 ?auto_10552 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_10559 - SURFACE
      ?auto_10560 - SURFACE
    )
    :vars
    (
      ?auto_10566 - HOIST
      ?auto_10561 - PLACE
      ?auto_10563 - PLACE
      ?auto_10564 - HOIST
      ?auto_10562 - SURFACE
      ?auto_10565 - TRUCK
      ?auto_10567 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10566 ?auto_10561 ) ( IS-CRATE ?auto_10559 ) ( not ( = ?auto_10559 ?auto_10560 ) ) ( not ( = ?auto_10563 ?auto_10561 ) ) ( HOIST-AT ?auto_10564 ?auto_10563 ) ( not ( = ?auto_10566 ?auto_10564 ) ) ( AVAILABLE ?auto_10564 ) ( SURFACE-AT ?auto_10559 ?auto_10563 ) ( ON ?auto_10559 ?auto_10562 ) ( CLEAR ?auto_10559 ) ( not ( = ?auto_10559 ?auto_10562 ) ) ( not ( = ?auto_10560 ?auto_10562 ) ) ( TRUCK-AT ?auto_10565 ?auto_10561 ) ( SURFACE-AT ?auto_10567 ?auto_10561 ) ( CLEAR ?auto_10567 ) ( LIFTING ?auto_10566 ?auto_10560 ) ( IS-CRATE ?auto_10560 ) ( not ( = ?auto_10559 ?auto_10567 ) ) ( not ( = ?auto_10560 ?auto_10567 ) ) ( not ( = ?auto_10562 ?auto_10567 ) ) )
    :subtasks
    ( ( !DROP ?auto_10566 ?auto_10560 ?auto_10567 ?auto_10561 )
      ( MAKE-ON ?auto_10559 ?auto_10560 )
      ( MAKE-ON-VERIFY ?auto_10559 ?auto_10560 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_10568 - SURFACE
      ?auto_10569 - SURFACE
    )
    :vars
    (
      ?auto_10571 - HOIST
      ?auto_10574 - PLACE
      ?auto_10573 - PLACE
      ?auto_10572 - HOIST
      ?auto_10570 - SURFACE
      ?auto_10576 - TRUCK
      ?auto_10575 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10571 ?auto_10574 ) ( IS-CRATE ?auto_10568 ) ( not ( = ?auto_10568 ?auto_10569 ) ) ( not ( = ?auto_10573 ?auto_10574 ) ) ( HOIST-AT ?auto_10572 ?auto_10573 ) ( not ( = ?auto_10571 ?auto_10572 ) ) ( AVAILABLE ?auto_10572 ) ( SURFACE-AT ?auto_10568 ?auto_10573 ) ( ON ?auto_10568 ?auto_10570 ) ( CLEAR ?auto_10568 ) ( not ( = ?auto_10568 ?auto_10570 ) ) ( not ( = ?auto_10569 ?auto_10570 ) ) ( TRUCK-AT ?auto_10576 ?auto_10574 ) ( SURFACE-AT ?auto_10575 ?auto_10574 ) ( CLEAR ?auto_10575 ) ( IS-CRATE ?auto_10569 ) ( not ( = ?auto_10568 ?auto_10575 ) ) ( not ( = ?auto_10569 ?auto_10575 ) ) ( not ( = ?auto_10570 ?auto_10575 ) ) ( AVAILABLE ?auto_10571 ) ( IN ?auto_10569 ?auto_10576 ) )
    :subtasks
    ( ( !UNLOAD ?auto_10571 ?auto_10569 ?auto_10576 ?auto_10574 )
      ( MAKE-ON ?auto_10568 ?auto_10569 )
      ( MAKE-ON-VERIFY ?auto_10568 ?auto_10569 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_10577 - SURFACE
      ?auto_10578 - SURFACE
    )
    :vars
    (
      ?auto_10580 - HOIST
      ?auto_10584 - PLACE
      ?auto_10581 - PLACE
      ?auto_10585 - HOIST
      ?auto_10579 - SURFACE
      ?auto_10583 - SURFACE
      ?auto_10582 - TRUCK
      ?auto_10586 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10580 ?auto_10584 ) ( IS-CRATE ?auto_10577 ) ( not ( = ?auto_10577 ?auto_10578 ) ) ( not ( = ?auto_10581 ?auto_10584 ) ) ( HOIST-AT ?auto_10585 ?auto_10581 ) ( not ( = ?auto_10580 ?auto_10585 ) ) ( AVAILABLE ?auto_10585 ) ( SURFACE-AT ?auto_10577 ?auto_10581 ) ( ON ?auto_10577 ?auto_10579 ) ( CLEAR ?auto_10577 ) ( not ( = ?auto_10577 ?auto_10579 ) ) ( not ( = ?auto_10578 ?auto_10579 ) ) ( SURFACE-AT ?auto_10583 ?auto_10584 ) ( CLEAR ?auto_10583 ) ( IS-CRATE ?auto_10578 ) ( not ( = ?auto_10577 ?auto_10583 ) ) ( not ( = ?auto_10578 ?auto_10583 ) ) ( not ( = ?auto_10579 ?auto_10583 ) ) ( AVAILABLE ?auto_10580 ) ( IN ?auto_10578 ?auto_10582 ) ( TRUCK-AT ?auto_10582 ?auto_10586 ) ( not ( = ?auto_10586 ?auto_10584 ) ) ( not ( = ?auto_10581 ?auto_10586 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_10582 ?auto_10586 ?auto_10584 )
      ( MAKE-ON ?auto_10577 ?auto_10578 )
      ( MAKE-ON-VERIFY ?auto_10577 ?auto_10578 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_10587 - SURFACE
      ?auto_10588 - SURFACE
    )
    :vars
    (
      ?auto_10596 - HOIST
      ?auto_10591 - PLACE
      ?auto_10593 - PLACE
      ?auto_10595 - HOIST
      ?auto_10590 - SURFACE
      ?auto_10589 - SURFACE
      ?auto_10592 - TRUCK
      ?auto_10594 - PLACE
      ?auto_10597 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_10596 ?auto_10591 ) ( IS-CRATE ?auto_10587 ) ( not ( = ?auto_10587 ?auto_10588 ) ) ( not ( = ?auto_10593 ?auto_10591 ) ) ( HOIST-AT ?auto_10595 ?auto_10593 ) ( not ( = ?auto_10596 ?auto_10595 ) ) ( AVAILABLE ?auto_10595 ) ( SURFACE-AT ?auto_10587 ?auto_10593 ) ( ON ?auto_10587 ?auto_10590 ) ( CLEAR ?auto_10587 ) ( not ( = ?auto_10587 ?auto_10590 ) ) ( not ( = ?auto_10588 ?auto_10590 ) ) ( SURFACE-AT ?auto_10589 ?auto_10591 ) ( CLEAR ?auto_10589 ) ( IS-CRATE ?auto_10588 ) ( not ( = ?auto_10587 ?auto_10589 ) ) ( not ( = ?auto_10588 ?auto_10589 ) ) ( not ( = ?auto_10590 ?auto_10589 ) ) ( AVAILABLE ?auto_10596 ) ( TRUCK-AT ?auto_10592 ?auto_10594 ) ( not ( = ?auto_10594 ?auto_10591 ) ) ( not ( = ?auto_10593 ?auto_10594 ) ) ( HOIST-AT ?auto_10597 ?auto_10594 ) ( LIFTING ?auto_10597 ?auto_10588 ) ( not ( = ?auto_10596 ?auto_10597 ) ) ( not ( = ?auto_10595 ?auto_10597 ) ) )
    :subtasks
    ( ( !LOAD ?auto_10597 ?auto_10588 ?auto_10592 ?auto_10594 )
      ( MAKE-ON ?auto_10587 ?auto_10588 )
      ( MAKE-ON-VERIFY ?auto_10587 ?auto_10588 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_10598 - SURFACE
      ?auto_10599 - SURFACE
    )
    :vars
    (
      ?auto_10607 - HOIST
      ?auto_10600 - PLACE
      ?auto_10602 - PLACE
      ?auto_10601 - HOIST
      ?auto_10608 - SURFACE
      ?auto_10603 - SURFACE
      ?auto_10606 - TRUCK
      ?auto_10605 - PLACE
      ?auto_10604 - HOIST
      ?auto_10609 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10607 ?auto_10600 ) ( IS-CRATE ?auto_10598 ) ( not ( = ?auto_10598 ?auto_10599 ) ) ( not ( = ?auto_10602 ?auto_10600 ) ) ( HOIST-AT ?auto_10601 ?auto_10602 ) ( not ( = ?auto_10607 ?auto_10601 ) ) ( AVAILABLE ?auto_10601 ) ( SURFACE-AT ?auto_10598 ?auto_10602 ) ( ON ?auto_10598 ?auto_10608 ) ( CLEAR ?auto_10598 ) ( not ( = ?auto_10598 ?auto_10608 ) ) ( not ( = ?auto_10599 ?auto_10608 ) ) ( SURFACE-AT ?auto_10603 ?auto_10600 ) ( CLEAR ?auto_10603 ) ( IS-CRATE ?auto_10599 ) ( not ( = ?auto_10598 ?auto_10603 ) ) ( not ( = ?auto_10599 ?auto_10603 ) ) ( not ( = ?auto_10608 ?auto_10603 ) ) ( AVAILABLE ?auto_10607 ) ( TRUCK-AT ?auto_10606 ?auto_10605 ) ( not ( = ?auto_10605 ?auto_10600 ) ) ( not ( = ?auto_10602 ?auto_10605 ) ) ( HOIST-AT ?auto_10604 ?auto_10605 ) ( not ( = ?auto_10607 ?auto_10604 ) ) ( not ( = ?auto_10601 ?auto_10604 ) ) ( AVAILABLE ?auto_10604 ) ( SURFACE-AT ?auto_10599 ?auto_10605 ) ( ON ?auto_10599 ?auto_10609 ) ( CLEAR ?auto_10599 ) ( not ( = ?auto_10598 ?auto_10609 ) ) ( not ( = ?auto_10599 ?auto_10609 ) ) ( not ( = ?auto_10608 ?auto_10609 ) ) ( not ( = ?auto_10603 ?auto_10609 ) ) )
    :subtasks
    ( ( !LIFT ?auto_10604 ?auto_10599 ?auto_10609 ?auto_10605 )
      ( MAKE-ON ?auto_10598 ?auto_10599 )
      ( MAKE-ON-VERIFY ?auto_10598 ?auto_10599 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_10610 - SURFACE
      ?auto_10611 - SURFACE
    )
    :vars
    (
      ?auto_10612 - HOIST
      ?auto_10619 - PLACE
      ?auto_10618 - PLACE
      ?auto_10621 - HOIST
      ?auto_10615 - SURFACE
      ?auto_10614 - SURFACE
      ?auto_10620 - PLACE
      ?auto_10617 - HOIST
      ?auto_10616 - SURFACE
      ?auto_10613 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10612 ?auto_10619 ) ( IS-CRATE ?auto_10610 ) ( not ( = ?auto_10610 ?auto_10611 ) ) ( not ( = ?auto_10618 ?auto_10619 ) ) ( HOIST-AT ?auto_10621 ?auto_10618 ) ( not ( = ?auto_10612 ?auto_10621 ) ) ( AVAILABLE ?auto_10621 ) ( SURFACE-AT ?auto_10610 ?auto_10618 ) ( ON ?auto_10610 ?auto_10615 ) ( CLEAR ?auto_10610 ) ( not ( = ?auto_10610 ?auto_10615 ) ) ( not ( = ?auto_10611 ?auto_10615 ) ) ( SURFACE-AT ?auto_10614 ?auto_10619 ) ( CLEAR ?auto_10614 ) ( IS-CRATE ?auto_10611 ) ( not ( = ?auto_10610 ?auto_10614 ) ) ( not ( = ?auto_10611 ?auto_10614 ) ) ( not ( = ?auto_10615 ?auto_10614 ) ) ( AVAILABLE ?auto_10612 ) ( not ( = ?auto_10620 ?auto_10619 ) ) ( not ( = ?auto_10618 ?auto_10620 ) ) ( HOIST-AT ?auto_10617 ?auto_10620 ) ( not ( = ?auto_10612 ?auto_10617 ) ) ( not ( = ?auto_10621 ?auto_10617 ) ) ( AVAILABLE ?auto_10617 ) ( SURFACE-AT ?auto_10611 ?auto_10620 ) ( ON ?auto_10611 ?auto_10616 ) ( CLEAR ?auto_10611 ) ( not ( = ?auto_10610 ?auto_10616 ) ) ( not ( = ?auto_10611 ?auto_10616 ) ) ( not ( = ?auto_10615 ?auto_10616 ) ) ( not ( = ?auto_10614 ?auto_10616 ) ) ( TRUCK-AT ?auto_10613 ?auto_10619 ) )
    :subtasks
    ( ( !DRIVE ?auto_10613 ?auto_10619 ?auto_10620 )
      ( MAKE-ON ?auto_10610 ?auto_10611 )
      ( MAKE-ON-VERIFY ?auto_10610 ?auto_10611 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_10622 - SURFACE
      ?auto_10623 - SURFACE
    )
    :vars
    (
      ?auto_10628 - HOIST
      ?auto_10631 - PLACE
      ?auto_10633 - PLACE
      ?auto_10632 - HOIST
      ?auto_10624 - SURFACE
      ?auto_10629 - SURFACE
      ?auto_10630 - PLACE
      ?auto_10625 - HOIST
      ?auto_10626 - SURFACE
      ?auto_10627 - TRUCK
      ?auto_10634 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10628 ?auto_10631 ) ( IS-CRATE ?auto_10622 ) ( not ( = ?auto_10622 ?auto_10623 ) ) ( not ( = ?auto_10633 ?auto_10631 ) ) ( HOIST-AT ?auto_10632 ?auto_10633 ) ( not ( = ?auto_10628 ?auto_10632 ) ) ( AVAILABLE ?auto_10632 ) ( SURFACE-AT ?auto_10622 ?auto_10633 ) ( ON ?auto_10622 ?auto_10624 ) ( CLEAR ?auto_10622 ) ( not ( = ?auto_10622 ?auto_10624 ) ) ( not ( = ?auto_10623 ?auto_10624 ) ) ( IS-CRATE ?auto_10623 ) ( not ( = ?auto_10622 ?auto_10629 ) ) ( not ( = ?auto_10623 ?auto_10629 ) ) ( not ( = ?auto_10624 ?auto_10629 ) ) ( not ( = ?auto_10630 ?auto_10631 ) ) ( not ( = ?auto_10633 ?auto_10630 ) ) ( HOIST-AT ?auto_10625 ?auto_10630 ) ( not ( = ?auto_10628 ?auto_10625 ) ) ( not ( = ?auto_10632 ?auto_10625 ) ) ( AVAILABLE ?auto_10625 ) ( SURFACE-AT ?auto_10623 ?auto_10630 ) ( ON ?auto_10623 ?auto_10626 ) ( CLEAR ?auto_10623 ) ( not ( = ?auto_10622 ?auto_10626 ) ) ( not ( = ?auto_10623 ?auto_10626 ) ) ( not ( = ?auto_10624 ?auto_10626 ) ) ( not ( = ?auto_10629 ?auto_10626 ) ) ( TRUCK-AT ?auto_10627 ?auto_10631 ) ( SURFACE-AT ?auto_10634 ?auto_10631 ) ( CLEAR ?auto_10634 ) ( LIFTING ?auto_10628 ?auto_10629 ) ( IS-CRATE ?auto_10629 ) ( not ( = ?auto_10622 ?auto_10634 ) ) ( not ( = ?auto_10623 ?auto_10634 ) ) ( not ( = ?auto_10624 ?auto_10634 ) ) ( not ( = ?auto_10629 ?auto_10634 ) ) ( not ( = ?auto_10626 ?auto_10634 ) ) )
    :subtasks
    ( ( !DROP ?auto_10628 ?auto_10629 ?auto_10634 ?auto_10631 )
      ( MAKE-ON ?auto_10622 ?auto_10623 )
      ( MAKE-ON-VERIFY ?auto_10622 ?auto_10623 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_10635 - SURFACE
      ?auto_10636 - SURFACE
    )
    :vars
    (
      ?auto_10642 - HOIST
      ?auto_10641 - PLACE
      ?auto_10643 - PLACE
      ?auto_10645 - HOIST
      ?auto_10646 - SURFACE
      ?auto_10638 - SURFACE
      ?auto_10640 - PLACE
      ?auto_10639 - HOIST
      ?auto_10637 - SURFACE
      ?auto_10644 - TRUCK
      ?auto_10647 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10642 ?auto_10641 ) ( IS-CRATE ?auto_10635 ) ( not ( = ?auto_10635 ?auto_10636 ) ) ( not ( = ?auto_10643 ?auto_10641 ) ) ( HOIST-AT ?auto_10645 ?auto_10643 ) ( not ( = ?auto_10642 ?auto_10645 ) ) ( AVAILABLE ?auto_10645 ) ( SURFACE-AT ?auto_10635 ?auto_10643 ) ( ON ?auto_10635 ?auto_10646 ) ( CLEAR ?auto_10635 ) ( not ( = ?auto_10635 ?auto_10646 ) ) ( not ( = ?auto_10636 ?auto_10646 ) ) ( IS-CRATE ?auto_10636 ) ( not ( = ?auto_10635 ?auto_10638 ) ) ( not ( = ?auto_10636 ?auto_10638 ) ) ( not ( = ?auto_10646 ?auto_10638 ) ) ( not ( = ?auto_10640 ?auto_10641 ) ) ( not ( = ?auto_10643 ?auto_10640 ) ) ( HOIST-AT ?auto_10639 ?auto_10640 ) ( not ( = ?auto_10642 ?auto_10639 ) ) ( not ( = ?auto_10645 ?auto_10639 ) ) ( AVAILABLE ?auto_10639 ) ( SURFACE-AT ?auto_10636 ?auto_10640 ) ( ON ?auto_10636 ?auto_10637 ) ( CLEAR ?auto_10636 ) ( not ( = ?auto_10635 ?auto_10637 ) ) ( not ( = ?auto_10636 ?auto_10637 ) ) ( not ( = ?auto_10646 ?auto_10637 ) ) ( not ( = ?auto_10638 ?auto_10637 ) ) ( TRUCK-AT ?auto_10644 ?auto_10641 ) ( SURFACE-AT ?auto_10647 ?auto_10641 ) ( CLEAR ?auto_10647 ) ( IS-CRATE ?auto_10638 ) ( not ( = ?auto_10635 ?auto_10647 ) ) ( not ( = ?auto_10636 ?auto_10647 ) ) ( not ( = ?auto_10646 ?auto_10647 ) ) ( not ( = ?auto_10638 ?auto_10647 ) ) ( not ( = ?auto_10637 ?auto_10647 ) ) ( AVAILABLE ?auto_10642 ) ( IN ?auto_10638 ?auto_10644 ) )
    :subtasks
    ( ( !UNLOAD ?auto_10642 ?auto_10638 ?auto_10644 ?auto_10641 )
      ( MAKE-ON ?auto_10635 ?auto_10636 )
      ( MAKE-ON-VERIFY ?auto_10635 ?auto_10636 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_10648 - SURFACE
      ?auto_10649 - SURFACE
    )
    :vars
    (
      ?auto_10652 - HOIST
      ?auto_10660 - PLACE
      ?auto_10653 - PLACE
      ?auto_10650 - HOIST
      ?auto_10657 - SURFACE
      ?auto_10651 - SURFACE
      ?auto_10659 - PLACE
      ?auto_10655 - HOIST
      ?auto_10656 - SURFACE
      ?auto_10654 - SURFACE
      ?auto_10658 - TRUCK
      ?auto_10661 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10652 ?auto_10660 ) ( IS-CRATE ?auto_10648 ) ( not ( = ?auto_10648 ?auto_10649 ) ) ( not ( = ?auto_10653 ?auto_10660 ) ) ( HOIST-AT ?auto_10650 ?auto_10653 ) ( not ( = ?auto_10652 ?auto_10650 ) ) ( AVAILABLE ?auto_10650 ) ( SURFACE-AT ?auto_10648 ?auto_10653 ) ( ON ?auto_10648 ?auto_10657 ) ( CLEAR ?auto_10648 ) ( not ( = ?auto_10648 ?auto_10657 ) ) ( not ( = ?auto_10649 ?auto_10657 ) ) ( IS-CRATE ?auto_10649 ) ( not ( = ?auto_10648 ?auto_10651 ) ) ( not ( = ?auto_10649 ?auto_10651 ) ) ( not ( = ?auto_10657 ?auto_10651 ) ) ( not ( = ?auto_10659 ?auto_10660 ) ) ( not ( = ?auto_10653 ?auto_10659 ) ) ( HOIST-AT ?auto_10655 ?auto_10659 ) ( not ( = ?auto_10652 ?auto_10655 ) ) ( not ( = ?auto_10650 ?auto_10655 ) ) ( AVAILABLE ?auto_10655 ) ( SURFACE-AT ?auto_10649 ?auto_10659 ) ( ON ?auto_10649 ?auto_10656 ) ( CLEAR ?auto_10649 ) ( not ( = ?auto_10648 ?auto_10656 ) ) ( not ( = ?auto_10649 ?auto_10656 ) ) ( not ( = ?auto_10657 ?auto_10656 ) ) ( not ( = ?auto_10651 ?auto_10656 ) ) ( SURFACE-AT ?auto_10654 ?auto_10660 ) ( CLEAR ?auto_10654 ) ( IS-CRATE ?auto_10651 ) ( not ( = ?auto_10648 ?auto_10654 ) ) ( not ( = ?auto_10649 ?auto_10654 ) ) ( not ( = ?auto_10657 ?auto_10654 ) ) ( not ( = ?auto_10651 ?auto_10654 ) ) ( not ( = ?auto_10656 ?auto_10654 ) ) ( AVAILABLE ?auto_10652 ) ( IN ?auto_10651 ?auto_10658 ) ( TRUCK-AT ?auto_10658 ?auto_10661 ) ( not ( = ?auto_10661 ?auto_10660 ) ) ( not ( = ?auto_10653 ?auto_10661 ) ) ( not ( = ?auto_10659 ?auto_10661 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_10658 ?auto_10661 ?auto_10660 )
      ( MAKE-ON ?auto_10648 ?auto_10649 )
      ( MAKE-ON-VERIFY ?auto_10648 ?auto_10649 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_10662 - SURFACE
      ?auto_10663 - SURFACE
    )
    :vars
    (
      ?auto_10664 - HOIST
      ?auto_10665 - PLACE
      ?auto_10674 - PLACE
      ?auto_10669 - HOIST
      ?auto_10673 - SURFACE
      ?auto_10675 - SURFACE
      ?auto_10670 - PLACE
      ?auto_10666 - HOIST
      ?auto_10672 - SURFACE
      ?auto_10667 - SURFACE
      ?auto_10668 - TRUCK
      ?auto_10671 - PLACE
      ?auto_10676 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_10664 ?auto_10665 ) ( IS-CRATE ?auto_10662 ) ( not ( = ?auto_10662 ?auto_10663 ) ) ( not ( = ?auto_10674 ?auto_10665 ) ) ( HOIST-AT ?auto_10669 ?auto_10674 ) ( not ( = ?auto_10664 ?auto_10669 ) ) ( AVAILABLE ?auto_10669 ) ( SURFACE-AT ?auto_10662 ?auto_10674 ) ( ON ?auto_10662 ?auto_10673 ) ( CLEAR ?auto_10662 ) ( not ( = ?auto_10662 ?auto_10673 ) ) ( not ( = ?auto_10663 ?auto_10673 ) ) ( IS-CRATE ?auto_10663 ) ( not ( = ?auto_10662 ?auto_10675 ) ) ( not ( = ?auto_10663 ?auto_10675 ) ) ( not ( = ?auto_10673 ?auto_10675 ) ) ( not ( = ?auto_10670 ?auto_10665 ) ) ( not ( = ?auto_10674 ?auto_10670 ) ) ( HOIST-AT ?auto_10666 ?auto_10670 ) ( not ( = ?auto_10664 ?auto_10666 ) ) ( not ( = ?auto_10669 ?auto_10666 ) ) ( AVAILABLE ?auto_10666 ) ( SURFACE-AT ?auto_10663 ?auto_10670 ) ( ON ?auto_10663 ?auto_10672 ) ( CLEAR ?auto_10663 ) ( not ( = ?auto_10662 ?auto_10672 ) ) ( not ( = ?auto_10663 ?auto_10672 ) ) ( not ( = ?auto_10673 ?auto_10672 ) ) ( not ( = ?auto_10675 ?auto_10672 ) ) ( SURFACE-AT ?auto_10667 ?auto_10665 ) ( CLEAR ?auto_10667 ) ( IS-CRATE ?auto_10675 ) ( not ( = ?auto_10662 ?auto_10667 ) ) ( not ( = ?auto_10663 ?auto_10667 ) ) ( not ( = ?auto_10673 ?auto_10667 ) ) ( not ( = ?auto_10675 ?auto_10667 ) ) ( not ( = ?auto_10672 ?auto_10667 ) ) ( AVAILABLE ?auto_10664 ) ( TRUCK-AT ?auto_10668 ?auto_10671 ) ( not ( = ?auto_10671 ?auto_10665 ) ) ( not ( = ?auto_10674 ?auto_10671 ) ) ( not ( = ?auto_10670 ?auto_10671 ) ) ( HOIST-AT ?auto_10676 ?auto_10671 ) ( LIFTING ?auto_10676 ?auto_10675 ) ( not ( = ?auto_10664 ?auto_10676 ) ) ( not ( = ?auto_10669 ?auto_10676 ) ) ( not ( = ?auto_10666 ?auto_10676 ) ) )
    :subtasks
    ( ( !LOAD ?auto_10676 ?auto_10675 ?auto_10668 ?auto_10671 )
      ( MAKE-ON ?auto_10662 ?auto_10663 )
      ( MAKE-ON-VERIFY ?auto_10662 ?auto_10663 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_10677 - SURFACE
      ?auto_10678 - SURFACE
    )
    :vars
    (
      ?auto_10691 - HOIST
      ?auto_10687 - PLACE
      ?auto_10685 - PLACE
      ?auto_10682 - HOIST
      ?auto_10683 - SURFACE
      ?auto_10684 - SURFACE
      ?auto_10681 - PLACE
      ?auto_10690 - HOIST
      ?auto_10686 - SURFACE
      ?auto_10689 - SURFACE
      ?auto_10688 - TRUCK
      ?auto_10679 - PLACE
      ?auto_10680 - HOIST
      ?auto_10692 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10691 ?auto_10687 ) ( IS-CRATE ?auto_10677 ) ( not ( = ?auto_10677 ?auto_10678 ) ) ( not ( = ?auto_10685 ?auto_10687 ) ) ( HOIST-AT ?auto_10682 ?auto_10685 ) ( not ( = ?auto_10691 ?auto_10682 ) ) ( AVAILABLE ?auto_10682 ) ( SURFACE-AT ?auto_10677 ?auto_10685 ) ( ON ?auto_10677 ?auto_10683 ) ( CLEAR ?auto_10677 ) ( not ( = ?auto_10677 ?auto_10683 ) ) ( not ( = ?auto_10678 ?auto_10683 ) ) ( IS-CRATE ?auto_10678 ) ( not ( = ?auto_10677 ?auto_10684 ) ) ( not ( = ?auto_10678 ?auto_10684 ) ) ( not ( = ?auto_10683 ?auto_10684 ) ) ( not ( = ?auto_10681 ?auto_10687 ) ) ( not ( = ?auto_10685 ?auto_10681 ) ) ( HOIST-AT ?auto_10690 ?auto_10681 ) ( not ( = ?auto_10691 ?auto_10690 ) ) ( not ( = ?auto_10682 ?auto_10690 ) ) ( AVAILABLE ?auto_10690 ) ( SURFACE-AT ?auto_10678 ?auto_10681 ) ( ON ?auto_10678 ?auto_10686 ) ( CLEAR ?auto_10678 ) ( not ( = ?auto_10677 ?auto_10686 ) ) ( not ( = ?auto_10678 ?auto_10686 ) ) ( not ( = ?auto_10683 ?auto_10686 ) ) ( not ( = ?auto_10684 ?auto_10686 ) ) ( SURFACE-AT ?auto_10689 ?auto_10687 ) ( CLEAR ?auto_10689 ) ( IS-CRATE ?auto_10684 ) ( not ( = ?auto_10677 ?auto_10689 ) ) ( not ( = ?auto_10678 ?auto_10689 ) ) ( not ( = ?auto_10683 ?auto_10689 ) ) ( not ( = ?auto_10684 ?auto_10689 ) ) ( not ( = ?auto_10686 ?auto_10689 ) ) ( AVAILABLE ?auto_10691 ) ( TRUCK-AT ?auto_10688 ?auto_10679 ) ( not ( = ?auto_10679 ?auto_10687 ) ) ( not ( = ?auto_10685 ?auto_10679 ) ) ( not ( = ?auto_10681 ?auto_10679 ) ) ( HOIST-AT ?auto_10680 ?auto_10679 ) ( not ( = ?auto_10691 ?auto_10680 ) ) ( not ( = ?auto_10682 ?auto_10680 ) ) ( not ( = ?auto_10690 ?auto_10680 ) ) ( AVAILABLE ?auto_10680 ) ( SURFACE-AT ?auto_10684 ?auto_10679 ) ( ON ?auto_10684 ?auto_10692 ) ( CLEAR ?auto_10684 ) ( not ( = ?auto_10677 ?auto_10692 ) ) ( not ( = ?auto_10678 ?auto_10692 ) ) ( not ( = ?auto_10683 ?auto_10692 ) ) ( not ( = ?auto_10684 ?auto_10692 ) ) ( not ( = ?auto_10686 ?auto_10692 ) ) ( not ( = ?auto_10689 ?auto_10692 ) ) )
    :subtasks
    ( ( !LIFT ?auto_10680 ?auto_10684 ?auto_10692 ?auto_10679 )
      ( MAKE-ON ?auto_10677 ?auto_10678 )
      ( MAKE-ON-VERIFY ?auto_10677 ?auto_10678 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_10693 - SURFACE
      ?auto_10694 - SURFACE
    )
    :vars
    (
      ?auto_10698 - HOIST
      ?auto_10702 - PLACE
      ?auto_10701 - PLACE
      ?auto_10706 - HOIST
      ?auto_10705 - SURFACE
      ?auto_10704 - SURFACE
      ?auto_10703 - PLACE
      ?auto_10696 - HOIST
      ?auto_10695 - SURFACE
      ?auto_10700 - SURFACE
      ?auto_10708 - PLACE
      ?auto_10697 - HOIST
      ?auto_10707 - SURFACE
      ?auto_10699 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10698 ?auto_10702 ) ( IS-CRATE ?auto_10693 ) ( not ( = ?auto_10693 ?auto_10694 ) ) ( not ( = ?auto_10701 ?auto_10702 ) ) ( HOIST-AT ?auto_10706 ?auto_10701 ) ( not ( = ?auto_10698 ?auto_10706 ) ) ( AVAILABLE ?auto_10706 ) ( SURFACE-AT ?auto_10693 ?auto_10701 ) ( ON ?auto_10693 ?auto_10705 ) ( CLEAR ?auto_10693 ) ( not ( = ?auto_10693 ?auto_10705 ) ) ( not ( = ?auto_10694 ?auto_10705 ) ) ( IS-CRATE ?auto_10694 ) ( not ( = ?auto_10693 ?auto_10704 ) ) ( not ( = ?auto_10694 ?auto_10704 ) ) ( not ( = ?auto_10705 ?auto_10704 ) ) ( not ( = ?auto_10703 ?auto_10702 ) ) ( not ( = ?auto_10701 ?auto_10703 ) ) ( HOIST-AT ?auto_10696 ?auto_10703 ) ( not ( = ?auto_10698 ?auto_10696 ) ) ( not ( = ?auto_10706 ?auto_10696 ) ) ( AVAILABLE ?auto_10696 ) ( SURFACE-AT ?auto_10694 ?auto_10703 ) ( ON ?auto_10694 ?auto_10695 ) ( CLEAR ?auto_10694 ) ( not ( = ?auto_10693 ?auto_10695 ) ) ( not ( = ?auto_10694 ?auto_10695 ) ) ( not ( = ?auto_10705 ?auto_10695 ) ) ( not ( = ?auto_10704 ?auto_10695 ) ) ( SURFACE-AT ?auto_10700 ?auto_10702 ) ( CLEAR ?auto_10700 ) ( IS-CRATE ?auto_10704 ) ( not ( = ?auto_10693 ?auto_10700 ) ) ( not ( = ?auto_10694 ?auto_10700 ) ) ( not ( = ?auto_10705 ?auto_10700 ) ) ( not ( = ?auto_10704 ?auto_10700 ) ) ( not ( = ?auto_10695 ?auto_10700 ) ) ( AVAILABLE ?auto_10698 ) ( not ( = ?auto_10708 ?auto_10702 ) ) ( not ( = ?auto_10701 ?auto_10708 ) ) ( not ( = ?auto_10703 ?auto_10708 ) ) ( HOIST-AT ?auto_10697 ?auto_10708 ) ( not ( = ?auto_10698 ?auto_10697 ) ) ( not ( = ?auto_10706 ?auto_10697 ) ) ( not ( = ?auto_10696 ?auto_10697 ) ) ( AVAILABLE ?auto_10697 ) ( SURFACE-AT ?auto_10704 ?auto_10708 ) ( ON ?auto_10704 ?auto_10707 ) ( CLEAR ?auto_10704 ) ( not ( = ?auto_10693 ?auto_10707 ) ) ( not ( = ?auto_10694 ?auto_10707 ) ) ( not ( = ?auto_10705 ?auto_10707 ) ) ( not ( = ?auto_10704 ?auto_10707 ) ) ( not ( = ?auto_10695 ?auto_10707 ) ) ( not ( = ?auto_10700 ?auto_10707 ) ) ( TRUCK-AT ?auto_10699 ?auto_10702 ) )
    :subtasks
    ( ( !DRIVE ?auto_10699 ?auto_10702 ?auto_10708 )
      ( MAKE-ON ?auto_10693 ?auto_10694 )
      ( MAKE-ON-VERIFY ?auto_10693 ?auto_10694 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_10711 - SURFACE
      ?auto_10712 - SURFACE
    )
    :vars
    (
      ?auto_10713 - HOIST
      ?auto_10714 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10713 ?auto_10714 ) ( SURFACE-AT ?auto_10712 ?auto_10714 ) ( CLEAR ?auto_10712 ) ( LIFTING ?auto_10713 ?auto_10711 ) ( IS-CRATE ?auto_10711 ) ( not ( = ?auto_10711 ?auto_10712 ) ) )
    :subtasks
    ( ( !DROP ?auto_10713 ?auto_10711 ?auto_10712 ?auto_10714 )
      ( MAKE-ON-VERIFY ?auto_10711 ?auto_10712 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_10715 - SURFACE
      ?auto_10716 - SURFACE
    )
    :vars
    (
      ?auto_10718 - HOIST
      ?auto_10717 - PLACE
      ?auto_10719 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10718 ?auto_10717 ) ( SURFACE-AT ?auto_10716 ?auto_10717 ) ( CLEAR ?auto_10716 ) ( IS-CRATE ?auto_10715 ) ( not ( = ?auto_10715 ?auto_10716 ) ) ( TRUCK-AT ?auto_10719 ?auto_10717 ) ( AVAILABLE ?auto_10718 ) ( IN ?auto_10715 ?auto_10719 ) )
    :subtasks
    ( ( !UNLOAD ?auto_10718 ?auto_10715 ?auto_10719 ?auto_10717 )
      ( MAKE-ON ?auto_10715 ?auto_10716 )
      ( MAKE-ON-VERIFY ?auto_10715 ?auto_10716 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_10720 - SURFACE
      ?auto_10721 - SURFACE
    )
    :vars
    (
      ?auto_10724 - HOIST
      ?auto_10723 - PLACE
      ?auto_10722 - TRUCK
      ?auto_10725 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10724 ?auto_10723 ) ( SURFACE-AT ?auto_10721 ?auto_10723 ) ( CLEAR ?auto_10721 ) ( IS-CRATE ?auto_10720 ) ( not ( = ?auto_10720 ?auto_10721 ) ) ( AVAILABLE ?auto_10724 ) ( IN ?auto_10720 ?auto_10722 ) ( TRUCK-AT ?auto_10722 ?auto_10725 ) ( not ( = ?auto_10725 ?auto_10723 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_10722 ?auto_10725 ?auto_10723 )
      ( MAKE-ON ?auto_10720 ?auto_10721 )
      ( MAKE-ON-VERIFY ?auto_10720 ?auto_10721 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_10726 - SURFACE
      ?auto_10727 - SURFACE
    )
    :vars
    (
      ?auto_10728 - HOIST
      ?auto_10730 - PLACE
      ?auto_10731 - TRUCK
      ?auto_10729 - PLACE
      ?auto_10732 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_10728 ?auto_10730 ) ( SURFACE-AT ?auto_10727 ?auto_10730 ) ( CLEAR ?auto_10727 ) ( IS-CRATE ?auto_10726 ) ( not ( = ?auto_10726 ?auto_10727 ) ) ( AVAILABLE ?auto_10728 ) ( TRUCK-AT ?auto_10731 ?auto_10729 ) ( not ( = ?auto_10729 ?auto_10730 ) ) ( HOIST-AT ?auto_10732 ?auto_10729 ) ( LIFTING ?auto_10732 ?auto_10726 ) ( not ( = ?auto_10728 ?auto_10732 ) ) )
    :subtasks
    ( ( !LOAD ?auto_10732 ?auto_10726 ?auto_10731 ?auto_10729 )
      ( MAKE-ON ?auto_10726 ?auto_10727 )
      ( MAKE-ON-VERIFY ?auto_10726 ?auto_10727 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_10733 - SURFACE
      ?auto_10734 - SURFACE
    )
    :vars
    (
      ?auto_10738 - HOIST
      ?auto_10739 - PLACE
      ?auto_10735 - TRUCK
      ?auto_10737 - PLACE
      ?auto_10736 - HOIST
      ?auto_10740 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10738 ?auto_10739 ) ( SURFACE-AT ?auto_10734 ?auto_10739 ) ( CLEAR ?auto_10734 ) ( IS-CRATE ?auto_10733 ) ( not ( = ?auto_10733 ?auto_10734 ) ) ( AVAILABLE ?auto_10738 ) ( TRUCK-AT ?auto_10735 ?auto_10737 ) ( not ( = ?auto_10737 ?auto_10739 ) ) ( HOIST-AT ?auto_10736 ?auto_10737 ) ( not ( = ?auto_10738 ?auto_10736 ) ) ( AVAILABLE ?auto_10736 ) ( SURFACE-AT ?auto_10733 ?auto_10737 ) ( ON ?auto_10733 ?auto_10740 ) ( CLEAR ?auto_10733 ) ( not ( = ?auto_10733 ?auto_10740 ) ) ( not ( = ?auto_10734 ?auto_10740 ) ) )
    :subtasks
    ( ( !LIFT ?auto_10736 ?auto_10733 ?auto_10740 ?auto_10737 )
      ( MAKE-ON ?auto_10733 ?auto_10734 )
      ( MAKE-ON-VERIFY ?auto_10733 ?auto_10734 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_10741 - SURFACE
      ?auto_10742 - SURFACE
    )
    :vars
    (
      ?auto_10745 - HOIST
      ?auto_10747 - PLACE
      ?auto_10746 - PLACE
      ?auto_10748 - HOIST
      ?auto_10744 - SURFACE
      ?auto_10743 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10745 ?auto_10747 ) ( SURFACE-AT ?auto_10742 ?auto_10747 ) ( CLEAR ?auto_10742 ) ( IS-CRATE ?auto_10741 ) ( not ( = ?auto_10741 ?auto_10742 ) ) ( AVAILABLE ?auto_10745 ) ( not ( = ?auto_10746 ?auto_10747 ) ) ( HOIST-AT ?auto_10748 ?auto_10746 ) ( not ( = ?auto_10745 ?auto_10748 ) ) ( AVAILABLE ?auto_10748 ) ( SURFACE-AT ?auto_10741 ?auto_10746 ) ( ON ?auto_10741 ?auto_10744 ) ( CLEAR ?auto_10741 ) ( not ( = ?auto_10741 ?auto_10744 ) ) ( not ( = ?auto_10742 ?auto_10744 ) ) ( TRUCK-AT ?auto_10743 ?auto_10747 ) )
    :subtasks
    ( ( !DRIVE ?auto_10743 ?auto_10747 ?auto_10746 )
      ( MAKE-ON ?auto_10741 ?auto_10742 )
      ( MAKE-ON-VERIFY ?auto_10741 ?auto_10742 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_10749 - SURFACE
      ?auto_10750 - SURFACE
    )
    :vars
    (
      ?auto_10751 - HOIST
      ?auto_10753 - PLACE
      ?auto_10755 - PLACE
      ?auto_10756 - HOIST
      ?auto_10754 - SURFACE
      ?auto_10752 - TRUCK
      ?auto_10757 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10751 ?auto_10753 ) ( IS-CRATE ?auto_10749 ) ( not ( = ?auto_10749 ?auto_10750 ) ) ( not ( = ?auto_10755 ?auto_10753 ) ) ( HOIST-AT ?auto_10756 ?auto_10755 ) ( not ( = ?auto_10751 ?auto_10756 ) ) ( AVAILABLE ?auto_10756 ) ( SURFACE-AT ?auto_10749 ?auto_10755 ) ( ON ?auto_10749 ?auto_10754 ) ( CLEAR ?auto_10749 ) ( not ( = ?auto_10749 ?auto_10754 ) ) ( not ( = ?auto_10750 ?auto_10754 ) ) ( TRUCK-AT ?auto_10752 ?auto_10753 ) ( SURFACE-AT ?auto_10757 ?auto_10753 ) ( CLEAR ?auto_10757 ) ( LIFTING ?auto_10751 ?auto_10750 ) ( IS-CRATE ?auto_10750 ) ( not ( = ?auto_10749 ?auto_10757 ) ) ( not ( = ?auto_10750 ?auto_10757 ) ) ( not ( = ?auto_10754 ?auto_10757 ) ) )
    :subtasks
    ( ( !DROP ?auto_10751 ?auto_10750 ?auto_10757 ?auto_10753 )
      ( MAKE-ON ?auto_10749 ?auto_10750 )
      ( MAKE-ON-VERIFY ?auto_10749 ?auto_10750 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_10758 - SURFACE
      ?auto_10759 - SURFACE
    )
    :vars
    (
      ?auto_10761 - HOIST
      ?auto_10764 - PLACE
      ?auto_10762 - PLACE
      ?auto_10766 - HOIST
      ?auto_10760 - SURFACE
      ?auto_10765 - TRUCK
      ?auto_10763 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10761 ?auto_10764 ) ( IS-CRATE ?auto_10758 ) ( not ( = ?auto_10758 ?auto_10759 ) ) ( not ( = ?auto_10762 ?auto_10764 ) ) ( HOIST-AT ?auto_10766 ?auto_10762 ) ( not ( = ?auto_10761 ?auto_10766 ) ) ( AVAILABLE ?auto_10766 ) ( SURFACE-AT ?auto_10758 ?auto_10762 ) ( ON ?auto_10758 ?auto_10760 ) ( CLEAR ?auto_10758 ) ( not ( = ?auto_10758 ?auto_10760 ) ) ( not ( = ?auto_10759 ?auto_10760 ) ) ( TRUCK-AT ?auto_10765 ?auto_10764 ) ( SURFACE-AT ?auto_10763 ?auto_10764 ) ( CLEAR ?auto_10763 ) ( IS-CRATE ?auto_10759 ) ( not ( = ?auto_10758 ?auto_10763 ) ) ( not ( = ?auto_10759 ?auto_10763 ) ) ( not ( = ?auto_10760 ?auto_10763 ) ) ( AVAILABLE ?auto_10761 ) ( IN ?auto_10759 ?auto_10765 ) )
    :subtasks
    ( ( !UNLOAD ?auto_10761 ?auto_10759 ?auto_10765 ?auto_10764 )
      ( MAKE-ON ?auto_10758 ?auto_10759 )
      ( MAKE-ON-VERIFY ?auto_10758 ?auto_10759 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_10767 - SURFACE
      ?auto_10768 - SURFACE
    )
    :vars
    (
      ?auto_10772 - HOIST
      ?auto_10771 - PLACE
      ?auto_10770 - PLACE
      ?auto_10773 - HOIST
      ?auto_10775 - SURFACE
      ?auto_10774 - SURFACE
      ?auto_10769 - TRUCK
      ?auto_10776 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10772 ?auto_10771 ) ( IS-CRATE ?auto_10767 ) ( not ( = ?auto_10767 ?auto_10768 ) ) ( not ( = ?auto_10770 ?auto_10771 ) ) ( HOIST-AT ?auto_10773 ?auto_10770 ) ( not ( = ?auto_10772 ?auto_10773 ) ) ( AVAILABLE ?auto_10773 ) ( SURFACE-AT ?auto_10767 ?auto_10770 ) ( ON ?auto_10767 ?auto_10775 ) ( CLEAR ?auto_10767 ) ( not ( = ?auto_10767 ?auto_10775 ) ) ( not ( = ?auto_10768 ?auto_10775 ) ) ( SURFACE-AT ?auto_10774 ?auto_10771 ) ( CLEAR ?auto_10774 ) ( IS-CRATE ?auto_10768 ) ( not ( = ?auto_10767 ?auto_10774 ) ) ( not ( = ?auto_10768 ?auto_10774 ) ) ( not ( = ?auto_10775 ?auto_10774 ) ) ( AVAILABLE ?auto_10772 ) ( IN ?auto_10768 ?auto_10769 ) ( TRUCK-AT ?auto_10769 ?auto_10776 ) ( not ( = ?auto_10776 ?auto_10771 ) ) ( not ( = ?auto_10770 ?auto_10776 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_10769 ?auto_10776 ?auto_10771 )
      ( MAKE-ON ?auto_10767 ?auto_10768 )
      ( MAKE-ON-VERIFY ?auto_10767 ?auto_10768 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_10777 - SURFACE
      ?auto_10778 - SURFACE
    )
    :vars
    (
      ?auto_10784 - HOIST
      ?auto_10779 - PLACE
      ?auto_10781 - PLACE
      ?auto_10780 - HOIST
      ?auto_10785 - SURFACE
      ?auto_10782 - SURFACE
      ?auto_10783 - TRUCK
      ?auto_10786 - PLACE
      ?auto_10787 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_10784 ?auto_10779 ) ( IS-CRATE ?auto_10777 ) ( not ( = ?auto_10777 ?auto_10778 ) ) ( not ( = ?auto_10781 ?auto_10779 ) ) ( HOIST-AT ?auto_10780 ?auto_10781 ) ( not ( = ?auto_10784 ?auto_10780 ) ) ( AVAILABLE ?auto_10780 ) ( SURFACE-AT ?auto_10777 ?auto_10781 ) ( ON ?auto_10777 ?auto_10785 ) ( CLEAR ?auto_10777 ) ( not ( = ?auto_10777 ?auto_10785 ) ) ( not ( = ?auto_10778 ?auto_10785 ) ) ( SURFACE-AT ?auto_10782 ?auto_10779 ) ( CLEAR ?auto_10782 ) ( IS-CRATE ?auto_10778 ) ( not ( = ?auto_10777 ?auto_10782 ) ) ( not ( = ?auto_10778 ?auto_10782 ) ) ( not ( = ?auto_10785 ?auto_10782 ) ) ( AVAILABLE ?auto_10784 ) ( TRUCK-AT ?auto_10783 ?auto_10786 ) ( not ( = ?auto_10786 ?auto_10779 ) ) ( not ( = ?auto_10781 ?auto_10786 ) ) ( HOIST-AT ?auto_10787 ?auto_10786 ) ( LIFTING ?auto_10787 ?auto_10778 ) ( not ( = ?auto_10784 ?auto_10787 ) ) ( not ( = ?auto_10780 ?auto_10787 ) ) )
    :subtasks
    ( ( !LOAD ?auto_10787 ?auto_10778 ?auto_10783 ?auto_10786 )
      ( MAKE-ON ?auto_10777 ?auto_10778 )
      ( MAKE-ON-VERIFY ?auto_10777 ?auto_10778 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_10788 - SURFACE
      ?auto_10789 - SURFACE
    )
    :vars
    (
      ?auto_10795 - HOIST
      ?auto_10794 - PLACE
      ?auto_10792 - PLACE
      ?auto_10798 - HOIST
      ?auto_10791 - SURFACE
      ?auto_10796 - SURFACE
      ?auto_10797 - TRUCK
      ?auto_10790 - PLACE
      ?auto_10793 - HOIST
      ?auto_10799 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10795 ?auto_10794 ) ( IS-CRATE ?auto_10788 ) ( not ( = ?auto_10788 ?auto_10789 ) ) ( not ( = ?auto_10792 ?auto_10794 ) ) ( HOIST-AT ?auto_10798 ?auto_10792 ) ( not ( = ?auto_10795 ?auto_10798 ) ) ( AVAILABLE ?auto_10798 ) ( SURFACE-AT ?auto_10788 ?auto_10792 ) ( ON ?auto_10788 ?auto_10791 ) ( CLEAR ?auto_10788 ) ( not ( = ?auto_10788 ?auto_10791 ) ) ( not ( = ?auto_10789 ?auto_10791 ) ) ( SURFACE-AT ?auto_10796 ?auto_10794 ) ( CLEAR ?auto_10796 ) ( IS-CRATE ?auto_10789 ) ( not ( = ?auto_10788 ?auto_10796 ) ) ( not ( = ?auto_10789 ?auto_10796 ) ) ( not ( = ?auto_10791 ?auto_10796 ) ) ( AVAILABLE ?auto_10795 ) ( TRUCK-AT ?auto_10797 ?auto_10790 ) ( not ( = ?auto_10790 ?auto_10794 ) ) ( not ( = ?auto_10792 ?auto_10790 ) ) ( HOIST-AT ?auto_10793 ?auto_10790 ) ( not ( = ?auto_10795 ?auto_10793 ) ) ( not ( = ?auto_10798 ?auto_10793 ) ) ( AVAILABLE ?auto_10793 ) ( SURFACE-AT ?auto_10789 ?auto_10790 ) ( ON ?auto_10789 ?auto_10799 ) ( CLEAR ?auto_10789 ) ( not ( = ?auto_10788 ?auto_10799 ) ) ( not ( = ?auto_10789 ?auto_10799 ) ) ( not ( = ?auto_10791 ?auto_10799 ) ) ( not ( = ?auto_10796 ?auto_10799 ) ) )
    :subtasks
    ( ( !LIFT ?auto_10793 ?auto_10789 ?auto_10799 ?auto_10790 )
      ( MAKE-ON ?auto_10788 ?auto_10789 )
      ( MAKE-ON-VERIFY ?auto_10788 ?auto_10789 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_10800 - SURFACE
      ?auto_10801 - SURFACE
    )
    :vars
    (
      ?auto_10811 - HOIST
      ?auto_10804 - PLACE
      ?auto_10809 - PLACE
      ?auto_10802 - HOIST
      ?auto_10808 - SURFACE
      ?auto_10810 - SURFACE
      ?auto_10806 - PLACE
      ?auto_10805 - HOIST
      ?auto_10803 - SURFACE
      ?auto_10807 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10811 ?auto_10804 ) ( IS-CRATE ?auto_10800 ) ( not ( = ?auto_10800 ?auto_10801 ) ) ( not ( = ?auto_10809 ?auto_10804 ) ) ( HOIST-AT ?auto_10802 ?auto_10809 ) ( not ( = ?auto_10811 ?auto_10802 ) ) ( AVAILABLE ?auto_10802 ) ( SURFACE-AT ?auto_10800 ?auto_10809 ) ( ON ?auto_10800 ?auto_10808 ) ( CLEAR ?auto_10800 ) ( not ( = ?auto_10800 ?auto_10808 ) ) ( not ( = ?auto_10801 ?auto_10808 ) ) ( SURFACE-AT ?auto_10810 ?auto_10804 ) ( CLEAR ?auto_10810 ) ( IS-CRATE ?auto_10801 ) ( not ( = ?auto_10800 ?auto_10810 ) ) ( not ( = ?auto_10801 ?auto_10810 ) ) ( not ( = ?auto_10808 ?auto_10810 ) ) ( AVAILABLE ?auto_10811 ) ( not ( = ?auto_10806 ?auto_10804 ) ) ( not ( = ?auto_10809 ?auto_10806 ) ) ( HOIST-AT ?auto_10805 ?auto_10806 ) ( not ( = ?auto_10811 ?auto_10805 ) ) ( not ( = ?auto_10802 ?auto_10805 ) ) ( AVAILABLE ?auto_10805 ) ( SURFACE-AT ?auto_10801 ?auto_10806 ) ( ON ?auto_10801 ?auto_10803 ) ( CLEAR ?auto_10801 ) ( not ( = ?auto_10800 ?auto_10803 ) ) ( not ( = ?auto_10801 ?auto_10803 ) ) ( not ( = ?auto_10808 ?auto_10803 ) ) ( not ( = ?auto_10810 ?auto_10803 ) ) ( TRUCK-AT ?auto_10807 ?auto_10804 ) )
    :subtasks
    ( ( !DRIVE ?auto_10807 ?auto_10804 ?auto_10806 )
      ( MAKE-ON ?auto_10800 ?auto_10801 )
      ( MAKE-ON-VERIFY ?auto_10800 ?auto_10801 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_10812 - SURFACE
      ?auto_10813 - SURFACE
    )
    :vars
    (
      ?auto_10816 - HOIST
      ?auto_10823 - PLACE
      ?auto_10821 - PLACE
      ?auto_10815 - HOIST
      ?auto_10820 - SURFACE
      ?auto_10814 - SURFACE
      ?auto_10819 - PLACE
      ?auto_10818 - HOIST
      ?auto_10817 - SURFACE
      ?auto_10822 - TRUCK
      ?auto_10824 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10816 ?auto_10823 ) ( IS-CRATE ?auto_10812 ) ( not ( = ?auto_10812 ?auto_10813 ) ) ( not ( = ?auto_10821 ?auto_10823 ) ) ( HOIST-AT ?auto_10815 ?auto_10821 ) ( not ( = ?auto_10816 ?auto_10815 ) ) ( AVAILABLE ?auto_10815 ) ( SURFACE-AT ?auto_10812 ?auto_10821 ) ( ON ?auto_10812 ?auto_10820 ) ( CLEAR ?auto_10812 ) ( not ( = ?auto_10812 ?auto_10820 ) ) ( not ( = ?auto_10813 ?auto_10820 ) ) ( IS-CRATE ?auto_10813 ) ( not ( = ?auto_10812 ?auto_10814 ) ) ( not ( = ?auto_10813 ?auto_10814 ) ) ( not ( = ?auto_10820 ?auto_10814 ) ) ( not ( = ?auto_10819 ?auto_10823 ) ) ( not ( = ?auto_10821 ?auto_10819 ) ) ( HOIST-AT ?auto_10818 ?auto_10819 ) ( not ( = ?auto_10816 ?auto_10818 ) ) ( not ( = ?auto_10815 ?auto_10818 ) ) ( AVAILABLE ?auto_10818 ) ( SURFACE-AT ?auto_10813 ?auto_10819 ) ( ON ?auto_10813 ?auto_10817 ) ( CLEAR ?auto_10813 ) ( not ( = ?auto_10812 ?auto_10817 ) ) ( not ( = ?auto_10813 ?auto_10817 ) ) ( not ( = ?auto_10820 ?auto_10817 ) ) ( not ( = ?auto_10814 ?auto_10817 ) ) ( TRUCK-AT ?auto_10822 ?auto_10823 ) ( SURFACE-AT ?auto_10824 ?auto_10823 ) ( CLEAR ?auto_10824 ) ( LIFTING ?auto_10816 ?auto_10814 ) ( IS-CRATE ?auto_10814 ) ( not ( = ?auto_10812 ?auto_10824 ) ) ( not ( = ?auto_10813 ?auto_10824 ) ) ( not ( = ?auto_10820 ?auto_10824 ) ) ( not ( = ?auto_10814 ?auto_10824 ) ) ( not ( = ?auto_10817 ?auto_10824 ) ) )
    :subtasks
    ( ( !DROP ?auto_10816 ?auto_10814 ?auto_10824 ?auto_10823 )
      ( MAKE-ON ?auto_10812 ?auto_10813 )
      ( MAKE-ON-VERIFY ?auto_10812 ?auto_10813 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_10825 - SURFACE
      ?auto_10826 - SURFACE
    )
    :vars
    (
      ?auto_10832 - HOIST
      ?auto_10835 - PLACE
      ?auto_10836 - PLACE
      ?auto_10831 - HOIST
      ?auto_10837 - SURFACE
      ?auto_10827 - SURFACE
      ?auto_10830 - PLACE
      ?auto_10829 - HOIST
      ?auto_10828 - SURFACE
      ?auto_10833 - TRUCK
      ?auto_10834 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10832 ?auto_10835 ) ( IS-CRATE ?auto_10825 ) ( not ( = ?auto_10825 ?auto_10826 ) ) ( not ( = ?auto_10836 ?auto_10835 ) ) ( HOIST-AT ?auto_10831 ?auto_10836 ) ( not ( = ?auto_10832 ?auto_10831 ) ) ( AVAILABLE ?auto_10831 ) ( SURFACE-AT ?auto_10825 ?auto_10836 ) ( ON ?auto_10825 ?auto_10837 ) ( CLEAR ?auto_10825 ) ( not ( = ?auto_10825 ?auto_10837 ) ) ( not ( = ?auto_10826 ?auto_10837 ) ) ( IS-CRATE ?auto_10826 ) ( not ( = ?auto_10825 ?auto_10827 ) ) ( not ( = ?auto_10826 ?auto_10827 ) ) ( not ( = ?auto_10837 ?auto_10827 ) ) ( not ( = ?auto_10830 ?auto_10835 ) ) ( not ( = ?auto_10836 ?auto_10830 ) ) ( HOIST-AT ?auto_10829 ?auto_10830 ) ( not ( = ?auto_10832 ?auto_10829 ) ) ( not ( = ?auto_10831 ?auto_10829 ) ) ( AVAILABLE ?auto_10829 ) ( SURFACE-AT ?auto_10826 ?auto_10830 ) ( ON ?auto_10826 ?auto_10828 ) ( CLEAR ?auto_10826 ) ( not ( = ?auto_10825 ?auto_10828 ) ) ( not ( = ?auto_10826 ?auto_10828 ) ) ( not ( = ?auto_10837 ?auto_10828 ) ) ( not ( = ?auto_10827 ?auto_10828 ) ) ( TRUCK-AT ?auto_10833 ?auto_10835 ) ( SURFACE-AT ?auto_10834 ?auto_10835 ) ( CLEAR ?auto_10834 ) ( IS-CRATE ?auto_10827 ) ( not ( = ?auto_10825 ?auto_10834 ) ) ( not ( = ?auto_10826 ?auto_10834 ) ) ( not ( = ?auto_10837 ?auto_10834 ) ) ( not ( = ?auto_10827 ?auto_10834 ) ) ( not ( = ?auto_10828 ?auto_10834 ) ) ( AVAILABLE ?auto_10832 ) ( IN ?auto_10827 ?auto_10833 ) )
    :subtasks
    ( ( !UNLOAD ?auto_10832 ?auto_10827 ?auto_10833 ?auto_10835 )
      ( MAKE-ON ?auto_10825 ?auto_10826 )
      ( MAKE-ON-VERIFY ?auto_10825 ?auto_10826 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_10838 - SURFACE
      ?auto_10839 - SURFACE
    )
    :vars
    (
      ?auto_10845 - HOIST
      ?auto_10842 - PLACE
      ?auto_10844 - PLACE
      ?auto_10843 - HOIST
      ?auto_10847 - SURFACE
      ?auto_10849 - SURFACE
      ?auto_10840 - PLACE
      ?auto_10848 - HOIST
      ?auto_10841 - SURFACE
      ?auto_10846 - SURFACE
      ?auto_10850 - TRUCK
      ?auto_10851 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10845 ?auto_10842 ) ( IS-CRATE ?auto_10838 ) ( not ( = ?auto_10838 ?auto_10839 ) ) ( not ( = ?auto_10844 ?auto_10842 ) ) ( HOIST-AT ?auto_10843 ?auto_10844 ) ( not ( = ?auto_10845 ?auto_10843 ) ) ( AVAILABLE ?auto_10843 ) ( SURFACE-AT ?auto_10838 ?auto_10844 ) ( ON ?auto_10838 ?auto_10847 ) ( CLEAR ?auto_10838 ) ( not ( = ?auto_10838 ?auto_10847 ) ) ( not ( = ?auto_10839 ?auto_10847 ) ) ( IS-CRATE ?auto_10839 ) ( not ( = ?auto_10838 ?auto_10849 ) ) ( not ( = ?auto_10839 ?auto_10849 ) ) ( not ( = ?auto_10847 ?auto_10849 ) ) ( not ( = ?auto_10840 ?auto_10842 ) ) ( not ( = ?auto_10844 ?auto_10840 ) ) ( HOIST-AT ?auto_10848 ?auto_10840 ) ( not ( = ?auto_10845 ?auto_10848 ) ) ( not ( = ?auto_10843 ?auto_10848 ) ) ( AVAILABLE ?auto_10848 ) ( SURFACE-AT ?auto_10839 ?auto_10840 ) ( ON ?auto_10839 ?auto_10841 ) ( CLEAR ?auto_10839 ) ( not ( = ?auto_10838 ?auto_10841 ) ) ( not ( = ?auto_10839 ?auto_10841 ) ) ( not ( = ?auto_10847 ?auto_10841 ) ) ( not ( = ?auto_10849 ?auto_10841 ) ) ( SURFACE-AT ?auto_10846 ?auto_10842 ) ( CLEAR ?auto_10846 ) ( IS-CRATE ?auto_10849 ) ( not ( = ?auto_10838 ?auto_10846 ) ) ( not ( = ?auto_10839 ?auto_10846 ) ) ( not ( = ?auto_10847 ?auto_10846 ) ) ( not ( = ?auto_10849 ?auto_10846 ) ) ( not ( = ?auto_10841 ?auto_10846 ) ) ( AVAILABLE ?auto_10845 ) ( IN ?auto_10849 ?auto_10850 ) ( TRUCK-AT ?auto_10850 ?auto_10851 ) ( not ( = ?auto_10851 ?auto_10842 ) ) ( not ( = ?auto_10844 ?auto_10851 ) ) ( not ( = ?auto_10840 ?auto_10851 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_10850 ?auto_10851 ?auto_10842 )
      ( MAKE-ON ?auto_10838 ?auto_10839 )
      ( MAKE-ON-VERIFY ?auto_10838 ?auto_10839 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_10852 - SURFACE
      ?auto_10853 - SURFACE
    )
    :vars
    (
      ?auto_10865 - HOIST
      ?auto_10862 - PLACE
      ?auto_10864 - PLACE
      ?auto_10855 - HOIST
      ?auto_10854 - SURFACE
      ?auto_10861 - SURFACE
      ?auto_10858 - PLACE
      ?auto_10863 - HOIST
      ?auto_10857 - SURFACE
      ?auto_10860 - SURFACE
      ?auto_10859 - TRUCK
      ?auto_10856 - PLACE
      ?auto_10866 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_10865 ?auto_10862 ) ( IS-CRATE ?auto_10852 ) ( not ( = ?auto_10852 ?auto_10853 ) ) ( not ( = ?auto_10864 ?auto_10862 ) ) ( HOIST-AT ?auto_10855 ?auto_10864 ) ( not ( = ?auto_10865 ?auto_10855 ) ) ( AVAILABLE ?auto_10855 ) ( SURFACE-AT ?auto_10852 ?auto_10864 ) ( ON ?auto_10852 ?auto_10854 ) ( CLEAR ?auto_10852 ) ( not ( = ?auto_10852 ?auto_10854 ) ) ( not ( = ?auto_10853 ?auto_10854 ) ) ( IS-CRATE ?auto_10853 ) ( not ( = ?auto_10852 ?auto_10861 ) ) ( not ( = ?auto_10853 ?auto_10861 ) ) ( not ( = ?auto_10854 ?auto_10861 ) ) ( not ( = ?auto_10858 ?auto_10862 ) ) ( not ( = ?auto_10864 ?auto_10858 ) ) ( HOIST-AT ?auto_10863 ?auto_10858 ) ( not ( = ?auto_10865 ?auto_10863 ) ) ( not ( = ?auto_10855 ?auto_10863 ) ) ( AVAILABLE ?auto_10863 ) ( SURFACE-AT ?auto_10853 ?auto_10858 ) ( ON ?auto_10853 ?auto_10857 ) ( CLEAR ?auto_10853 ) ( not ( = ?auto_10852 ?auto_10857 ) ) ( not ( = ?auto_10853 ?auto_10857 ) ) ( not ( = ?auto_10854 ?auto_10857 ) ) ( not ( = ?auto_10861 ?auto_10857 ) ) ( SURFACE-AT ?auto_10860 ?auto_10862 ) ( CLEAR ?auto_10860 ) ( IS-CRATE ?auto_10861 ) ( not ( = ?auto_10852 ?auto_10860 ) ) ( not ( = ?auto_10853 ?auto_10860 ) ) ( not ( = ?auto_10854 ?auto_10860 ) ) ( not ( = ?auto_10861 ?auto_10860 ) ) ( not ( = ?auto_10857 ?auto_10860 ) ) ( AVAILABLE ?auto_10865 ) ( TRUCK-AT ?auto_10859 ?auto_10856 ) ( not ( = ?auto_10856 ?auto_10862 ) ) ( not ( = ?auto_10864 ?auto_10856 ) ) ( not ( = ?auto_10858 ?auto_10856 ) ) ( HOIST-AT ?auto_10866 ?auto_10856 ) ( LIFTING ?auto_10866 ?auto_10861 ) ( not ( = ?auto_10865 ?auto_10866 ) ) ( not ( = ?auto_10855 ?auto_10866 ) ) ( not ( = ?auto_10863 ?auto_10866 ) ) )
    :subtasks
    ( ( !LOAD ?auto_10866 ?auto_10861 ?auto_10859 ?auto_10856 )
      ( MAKE-ON ?auto_10852 ?auto_10853 )
      ( MAKE-ON-VERIFY ?auto_10852 ?auto_10853 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_10867 - SURFACE
      ?auto_10868 - SURFACE
    )
    :vars
    (
      ?auto_10881 - HOIST
      ?auto_10875 - PLACE
      ?auto_10870 - PLACE
      ?auto_10873 - HOIST
      ?auto_10871 - SURFACE
      ?auto_10880 - SURFACE
      ?auto_10869 - PLACE
      ?auto_10877 - HOIST
      ?auto_10872 - SURFACE
      ?auto_10879 - SURFACE
      ?auto_10876 - TRUCK
      ?auto_10878 - PLACE
      ?auto_10874 - HOIST
      ?auto_10882 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10881 ?auto_10875 ) ( IS-CRATE ?auto_10867 ) ( not ( = ?auto_10867 ?auto_10868 ) ) ( not ( = ?auto_10870 ?auto_10875 ) ) ( HOIST-AT ?auto_10873 ?auto_10870 ) ( not ( = ?auto_10881 ?auto_10873 ) ) ( AVAILABLE ?auto_10873 ) ( SURFACE-AT ?auto_10867 ?auto_10870 ) ( ON ?auto_10867 ?auto_10871 ) ( CLEAR ?auto_10867 ) ( not ( = ?auto_10867 ?auto_10871 ) ) ( not ( = ?auto_10868 ?auto_10871 ) ) ( IS-CRATE ?auto_10868 ) ( not ( = ?auto_10867 ?auto_10880 ) ) ( not ( = ?auto_10868 ?auto_10880 ) ) ( not ( = ?auto_10871 ?auto_10880 ) ) ( not ( = ?auto_10869 ?auto_10875 ) ) ( not ( = ?auto_10870 ?auto_10869 ) ) ( HOIST-AT ?auto_10877 ?auto_10869 ) ( not ( = ?auto_10881 ?auto_10877 ) ) ( not ( = ?auto_10873 ?auto_10877 ) ) ( AVAILABLE ?auto_10877 ) ( SURFACE-AT ?auto_10868 ?auto_10869 ) ( ON ?auto_10868 ?auto_10872 ) ( CLEAR ?auto_10868 ) ( not ( = ?auto_10867 ?auto_10872 ) ) ( not ( = ?auto_10868 ?auto_10872 ) ) ( not ( = ?auto_10871 ?auto_10872 ) ) ( not ( = ?auto_10880 ?auto_10872 ) ) ( SURFACE-AT ?auto_10879 ?auto_10875 ) ( CLEAR ?auto_10879 ) ( IS-CRATE ?auto_10880 ) ( not ( = ?auto_10867 ?auto_10879 ) ) ( not ( = ?auto_10868 ?auto_10879 ) ) ( not ( = ?auto_10871 ?auto_10879 ) ) ( not ( = ?auto_10880 ?auto_10879 ) ) ( not ( = ?auto_10872 ?auto_10879 ) ) ( AVAILABLE ?auto_10881 ) ( TRUCK-AT ?auto_10876 ?auto_10878 ) ( not ( = ?auto_10878 ?auto_10875 ) ) ( not ( = ?auto_10870 ?auto_10878 ) ) ( not ( = ?auto_10869 ?auto_10878 ) ) ( HOIST-AT ?auto_10874 ?auto_10878 ) ( not ( = ?auto_10881 ?auto_10874 ) ) ( not ( = ?auto_10873 ?auto_10874 ) ) ( not ( = ?auto_10877 ?auto_10874 ) ) ( AVAILABLE ?auto_10874 ) ( SURFACE-AT ?auto_10880 ?auto_10878 ) ( ON ?auto_10880 ?auto_10882 ) ( CLEAR ?auto_10880 ) ( not ( = ?auto_10867 ?auto_10882 ) ) ( not ( = ?auto_10868 ?auto_10882 ) ) ( not ( = ?auto_10871 ?auto_10882 ) ) ( not ( = ?auto_10880 ?auto_10882 ) ) ( not ( = ?auto_10872 ?auto_10882 ) ) ( not ( = ?auto_10879 ?auto_10882 ) ) )
    :subtasks
    ( ( !LIFT ?auto_10874 ?auto_10880 ?auto_10882 ?auto_10878 )
      ( MAKE-ON ?auto_10867 ?auto_10868 )
      ( MAKE-ON-VERIFY ?auto_10867 ?auto_10868 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_10883 - SURFACE
      ?auto_10884 - SURFACE
    )
    :vars
    (
      ?auto_10888 - HOIST
      ?auto_10889 - PLACE
      ?auto_10898 - PLACE
      ?auto_10897 - HOIST
      ?auto_10891 - SURFACE
      ?auto_10893 - SURFACE
      ?auto_10894 - PLACE
      ?auto_10887 - HOIST
      ?auto_10886 - SURFACE
      ?auto_10885 - SURFACE
      ?auto_10892 - PLACE
      ?auto_10896 - HOIST
      ?auto_10895 - SURFACE
      ?auto_10890 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10888 ?auto_10889 ) ( IS-CRATE ?auto_10883 ) ( not ( = ?auto_10883 ?auto_10884 ) ) ( not ( = ?auto_10898 ?auto_10889 ) ) ( HOIST-AT ?auto_10897 ?auto_10898 ) ( not ( = ?auto_10888 ?auto_10897 ) ) ( AVAILABLE ?auto_10897 ) ( SURFACE-AT ?auto_10883 ?auto_10898 ) ( ON ?auto_10883 ?auto_10891 ) ( CLEAR ?auto_10883 ) ( not ( = ?auto_10883 ?auto_10891 ) ) ( not ( = ?auto_10884 ?auto_10891 ) ) ( IS-CRATE ?auto_10884 ) ( not ( = ?auto_10883 ?auto_10893 ) ) ( not ( = ?auto_10884 ?auto_10893 ) ) ( not ( = ?auto_10891 ?auto_10893 ) ) ( not ( = ?auto_10894 ?auto_10889 ) ) ( not ( = ?auto_10898 ?auto_10894 ) ) ( HOIST-AT ?auto_10887 ?auto_10894 ) ( not ( = ?auto_10888 ?auto_10887 ) ) ( not ( = ?auto_10897 ?auto_10887 ) ) ( AVAILABLE ?auto_10887 ) ( SURFACE-AT ?auto_10884 ?auto_10894 ) ( ON ?auto_10884 ?auto_10886 ) ( CLEAR ?auto_10884 ) ( not ( = ?auto_10883 ?auto_10886 ) ) ( not ( = ?auto_10884 ?auto_10886 ) ) ( not ( = ?auto_10891 ?auto_10886 ) ) ( not ( = ?auto_10893 ?auto_10886 ) ) ( SURFACE-AT ?auto_10885 ?auto_10889 ) ( CLEAR ?auto_10885 ) ( IS-CRATE ?auto_10893 ) ( not ( = ?auto_10883 ?auto_10885 ) ) ( not ( = ?auto_10884 ?auto_10885 ) ) ( not ( = ?auto_10891 ?auto_10885 ) ) ( not ( = ?auto_10893 ?auto_10885 ) ) ( not ( = ?auto_10886 ?auto_10885 ) ) ( AVAILABLE ?auto_10888 ) ( not ( = ?auto_10892 ?auto_10889 ) ) ( not ( = ?auto_10898 ?auto_10892 ) ) ( not ( = ?auto_10894 ?auto_10892 ) ) ( HOIST-AT ?auto_10896 ?auto_10892 ) ( not ( = ?auto_10888 ?auto_10896 ) ) ( not ( = ?auto_10897 ?auto_10896 ) ) ( not ( = ?auto_10887 ?auto_10896 ) ) ( AVAILABLE ?auto_10896 ) ( SURFACE-AT ?auto_10893 ?auto_10892 ) ( ON ?auto_10893 ?auto_10895 ) ( CLEAR ?auto_10893 ) ( not ( = ?auto_10883 ?auto_10895 ) ) ( not ( = ?auto_10884 ?auto_10895 ) ) ( not ( = ?auto_10891 ?auto_10895 ) ) ( not ( = ?auto_10893 ?auto_10895 ) ) ( not ( = ?auto_10886 ?auto_10895 ) ) ( not ( = ?auto_10885 ?auto_10895 ) ) ( TRUCK-AT ?auto_10890 ?auto_10889 ) )
    :subtasks
    ( ( !DRIVE ?auto_10890 ?auto_10889 ?auto_10892 )
      ( MAKE-ON ?auto_10883 ?auto_10884 )
      ( MAKE-ON-VERIFY ?auto_10883 ?auto_10884 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_10899 - SURFACE
      ?auto_10900 - SURFACE
    )
    :vars
    (
      ?auto_10910 - HOIST
      ?auto_10902 - PLACE
      ?auto_10911 - PLACE
      ?auto_10901 - HOIST
      ?auto_10908 - SURFACE
      ?auto_10905 - SURFACE
      ?auto_10903 - PLACE
      ?auto_10909 - HOIST
      ?auto_10912 - SURFACE
      ?auto_10914 - SURFACE
      ?auto_10907 - PLACE
      ?auto_10906 - HOIST
      ?auto_10913 - SURFACE
      ?auto_10904 - TRUCK
      ?auto_10915 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10910 ?auto_10902 ) ( IS-CRATE ?auto_10899 ) ( not ( = ?auto_10899 ?auto_10900 ) ) ( not ( = ?auto_10911 ?auto_10902 ) ) ( HOIST-AT ?auto_10901 ?auto_10911 ) ( not ( = ?auto_10910 ?auto_10901 ) ) ( AVAILABLE ?auto_10901 ) ( SURFACE-AT ?auto_10899 ?auto_10911 ) ( ON ?auto_10899 ?auto_10908 ) ( CLEAR ?auto_10899 ) ( not ( = ?auto_10899 ?auto_10908 ) ) ( not ( = ?auto_10900 ?auto_10908 ) ) ( IS-CRATE ?auto_10900 ) ( not ( = ?auto_10899 ?auto_10905 ) ) ( not ( = ?auto_10900 ?auto_10905 ) ) ( not ( = ?auto_10908 ?auto_10905 ) ) ( not ( = ?auto_10903 ?auto_10902 ) ) ( not ( = ?auto_10911 ?auto_10903 ) ) ( HOIST-AT ?auto_10909 ?auto_10903 ) ( not ( = ?auto_10910 ?auto_10909 ) ) ( not ( = ?auto_10901 ?auto_10909 ) ) ( AVAILABLE ?auto_10909 ) ( SURFACE-AT ?auto_10900 ?auto_10903 ) ( ON ?auto_10900 ?auto_10912 ) ( CLEAR ?auto_10900 ) ( not ( = ?auto_10899 ?auto_10912 ) ) ( not ( = ?auto_10900 ?auto_10912 ) ) ( not ( = ?auto_10908 ?auto_10912 ) ) ( not ( = ?auto_10905 ?auto_10912 ) ) ( IS-CRATE ?auto_10905 ) ( not ( = ?auto_10899 ?auto_10914 ) ) ( not ( = ?auto_10900 ?auto_10914 ) ) ( not ( = ?auto_10908 ?auto_10914 ) ) ( not ( = ?auto_10905 ?auto_10914 ) ) ( not ( = ?auto_10912 ?auto_10914 ) ) ( not ( = ?auto_10907 ?auto_10902 ) ) ( not ( = ?auto_10911 ?auto_10907 ) ) ( not ( = ?auto_10903 ?auto_10907 ) ) ( HOIST-AT ?auto_10906 ?auto_10907 ) ( not ( = ?auto_10910 ?auto_10906 ) ) ( not ( = ?auto_10901 ?auto_10906 ) ) ( not ( = ?auto_10909 ?auto_10906 ) ) ( AVAILABLE ?auto_10906 ) ( SURFACE-AT ?auto_10905 ?auto_10907 ) ( ON ?auto_10905 ?auto_10913 ) ( CLEAR ?auto_10905 ) ( not ( = ?auto_10899 ?auto_10913 ) ) ( not ( = ?auto_10900 ?auto_10913 ) ) ( not ( = ?auto_10908 ?auto_10913 ) ) ( not ( = ?auto_10905 ?auto_10913 ) ) ( not ( = ?auto_10912 ?auto_10913 ) ) ( not ( = ?auto_10914 ?auto_10913 ) ) ( TRUCK-AT ?auto_10904 ?auto_10902 ) ( SURFACE-AT ?auto_10915 ?auto_10902 ) ( CLEAR ?auto_10915 ) ( LIFTING ?auto_10910 ?auto_10914 ) ( IS-CRATE ?auto_10914 ) ( not ( = ?auto_10899 ?auto_10915 ) ) ( not ( = ?auto_10900 ?auto_10915 ) ) ( not ( = ?auto_10908 ?auto_10915 ) ) ( not ( = ?auto_10905 ?auto_10915 ) ) ( not ( = ?auto_10912 ?auto_10915 ) ) ( not ( = ?auto_10914 ?auto_10915 ) ) ( not ( = ?auto_10913 ?auto_10915 ) ) )
    :subtasks
    ( ( !DROP ?auto_10910 ?auto_10914 ?auto_10915 ?auto_10902 )
      ( MAKE-ON ?auto_10899 ?auto_10900 )
      ( MAKE-ON-VERIFY ?auto_10899 ?auto_10900 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_10916 - SURFACE
      ?auto_10917 - SURFACE
    )
    :vars
    (
      ?auto_10929 - HOIST
      ?auto_10922 - PLACE
      ?auto_10925 - PLACE
      ?auto_10928 - HOIST
      ?auto_10932 - SURFACE
      ?auto_10930 - SURFACE
      ?auto_10927 - PLACE
      ?auto_10931 - HOIST
      ?auto_10924 - SURFACE
      ?auto_10921 - SURFACE
      ?auto_10920 - PLACE
      ?auto_10919 - HOIST
      ?auto_10926 - SURFACE
      ?auto_10923 - TRUCK
      ?auto_10918 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10929 ?auto_10922 ) ( IS-CRATE ?auto_10916 ) ( not ( = ?auto_10916 ?auto_10917 ) ) ( not ( = ?auto_10925 ?auto_10922 ) ) ( HOIST-AT ?auto_10928 ?auto_10925 ) ( not ( = ?auto_10929 ?auto_10928 ) ) ( AVAILABLE ?auto_10928 ) ( SURFACE-AT ?auto_10916 ?auto_10925 ) ( ON ?auto_10916 ?auto_10932 ) ( CLEAR ?auto_10916 ) ( not ( = ?auto_10916 ?auto_10932 ) ) ( not ( = ?auto_10917 ?auto_10932 ) ) ( IS-CRATE ?auto_10917 ) ( not ( = ?auto_10916 ?auto_10930 ) ) ( not ( = ?auto_10917 ?auto_10930 ) ) ( not ( = ?auto_10932 ?auto_10930 ) ) ( not ( = ?auto_10927 ?auto_10922 ) ) ( not ( = ?auto_10925 ?auto_10927 ) ) ( HOIST-AT ?auto_10931 ?auto_10927 ) ( not ( = ?auto_10929 ?auto_10931 ) ) ( not ( = ?auto_10928 ?auto_10931 ) ) ( AVAILABLE ?auto_10931 ) ( SURFACE-AT ?auto_10917 ?auto_10927 ) ( ON ?auto_10917 ?auto_10924 ) ( CLEAR ?auto_10917 ) ( not ( = ?auto_10916 ?auto_10924 ) ) ( not ( = ?auto_10917 ?auto_10924 ) ) ( not ( = ?auto_10932 ?auto_10924 ) ) ( not ( = ?auto_10930 ?auto_10924 ) ) ( IS-CRATE ?auto_10930 ) ( not ( = ?auto_10916 ?auto_10921 ) ) ( not ( = ?auto_10917 ?auto_10921 ) ) ( not ( = ?auto_10932 ?auto_10921 ) ) ( not ( = ?auto_10930 ?auto_10921 ) ) ( not ( = ?auto_10924 ?auto_10921 ) ) ( not ( = ?auto_10920 ?auto_10922 ) ) ( not ( = ?auto_10925 ?auto_10920 ) ) ( not ( = ?auto_10927 ?auto_10920 ) ) ( HOIST-AT ?auto_10919 ?auto_10920 ) ( not ( = ?auto_10929 ?auto_10919 ) ) ( not ( = ?auto_10928 ?auto_10919 ) ) ( not ( = ?auto_10931 ?auto_10919 ) ) ( AVAILABLE ?auto_10919 ) ( SURFACE-AT ?auto_10930 ?auto_10920 ) ( ON ?auto_10930 ?auto_10926 ) ( CLEAR ?auto_10930 ) ( not ( = ?auto_10916 ?auto_10926 ) ) ( not ( = ?auto_10917 ?auto_10926 ) ) ( not ( = ?auto_10932 ?auto_10926 ) ) ( not ( = ?auto_10930 ?auto_10926 ) ) ( not ( = ?auto_10924 ?auto_10926 ) ) ( not ( = ?auto_10921 ?auto_10926 ) ) ( TRUCK-AT ?auto_10923 ?auto_10922 ) ( SURFACE-AT ?auto_10918 ?auto_10922 ) ( CLEAR ?auto_10918 ) ( IS-CRATE ?auto_10921 ) ( not ( = ?auto_10916 ?auto_10918 ) ) ( not ( = ?auto_10917 ?auto_10918 ) ) ( not ( = ?auto_10932 ?auto_10918 ) ) ( not ( = ?auto_10930 ?auto_10918 ) ) ( not ( = ?auto_10924 ?auto_10918 ) ) ( not ( = ?auto_10921 ?auto_10918 ) ) ( not ( = ?auto_10926 ?auto_10918 ) ) ( AVAILABLE ?auto_10929 ) ( IN ?auto_10921 ?auto_10923 ) )
    :subtasks
    ( ( !UNLOAD ?auto_10929 ?auto_10921 ?auto_10923 ?auto_10922 )
      ( MAKE-ON ?auto_10916 ?auto_10917 )
      ( MAKE-ON-VERIFY ?auto_10916 ?auto_10917 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_10933 - SURFACE
      ?auto_10934 - SURFACE
    )
    :vars
    (
      ?auto_10945 - HOIST
      ?auto_10940 - PLACE
      ?auto_10939 - PLACE
      ?auto_10937 - HOIST
      ?auto_10946 - SURFACE
      ?auto_10947 - SURFACE
      ?auto_10949 - PLACE
      ?auto_10936 - HOIST
      ?auto_10938 - SURFACE
      ?auto_10944 - SURFACE
      ?auto_10941 - PLACE
      ?auto_10948 - HOIST
      ?auto_10935 - SURFACE
      ?auto_10943 - SURFACE
      ?auto_10942 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10945 ?auto_10940 ) ( IS-CRATE ?auto_10933 ) ( not ( = ?auto_10933 ?auto_10934 ) ) ( not ( = ?auto_10939 ?auto_10940 ) ) ( HOIST-AT ?auto_10937 ?auto_10939 ) ( not ( = ?auto_10945 ?auto_10937 ) ) ( AVAILABLE ?auto_10937 ) ( SURFACE-AT ?auto_10933 ?auto_10939 ) ( ON ?auto_10933 ?auto_10946 ) ( CLEAR ?auto_10933 ) ( not ( = ?auto_10933 ?auto_10946 ) ) ( not ( = ?auto_10934 ?auto_10946 ) ) ( IS-CRATE ?auto_10934 ) ( not ( = ?auto_10933 ?auto_10947 ) ) ( not ( = ?auto_10934 ?auto_10947 ) ) ( not ( = ?auto_10946 ?auto_10947 ) ) ( not ( = ?auto_10949 ?auto_10940 ) ) ( not ( = ?auto_10939 ?auto_10949 ) ) ( HOIST-AT ?auto_10936 ?auto_10949 ) ( not ( = ?auto_10945 ?auto_10936 ) ) ( not ( = ?auto_10937 ?auto_10936 ) ) ( AVAILABLE ?auto_10936 ) ( SURFACE-AT ?auto_10934 ?auto_10949 ) ( ON ?auto_10934 ?auto_10938 ) ( CLEAR ?auto_10934 ) ( not ( = ?auto_10933 ?auto_10938 ) ) ( not ( = ?auto_10934 ?auto_10938 ) ) ( not ( = ?auto_10946 ?auto_10938 ) ) ( not ( = ?auto_10947 ?auto_10938 ) ) ( IS-CRATE ?auto_10947 ) ( not ( = ?auto_10933 ?auto_10944 ) ) ( not ( = ?auto_10934 ?auto_10944 ) ) ( not ( = ?auto_10946 ?auto_10944 ) ) ( not ( = ?auto_10947 ?auto_10944 ) ) ( not ( = ?auto_10938 ?auto_10944 ) ) ( not ( = ?auto_10941 ?auto_10940 ) ) ( not ( = ?auto_10939 ?auto_10941 ) ) ( not ( = ?auto_10949 ?auto_10941 ) ) ( HOIST-AT ?auto_10948 ?auto_10941 ) ( not ( = ?auto_10945 ?auto_10948 ) ) ( not ( = ?auto_10937 ?auto_10948 ) ) ( not ( = ?auto_10936 ?auto_10948 ) ) ( AVAILABLE ?auto_10948 ) ( SURFACE-AT ?auto_10947 ?auto_10941 ) ( ON ?auto_10947 ?auto_10935 ) ( CLEAR ?auto_10947 ) ( not ( = ?auto_10933 ?auto_10935 ) ) ( not ( = ?auto_10934 ?auto_10935 ) ) ( not ( = ?auto_10946 ?auto_10935 ) ) ( not ( = ?auto_10947 ?auto_10935 ) ) ( not ( = ?auto_10938 ?auto_10935 ) ) ( not ( = ?auto_10944 ?auto_10935 ) ) ( SURFACE-AT ?auto_10943 ?auto_10940 ) ( CLEAR ?auto_10943 ) ( IS-CRATE ?auto_10944 ) ( not ( = ?auto_10933 ?auto_10943 ) ) ( not ( = ?auto_10934 ?auto_10943 ) ) ( not ( = ?auto_10946 ?auto_10943 ) ) ( not ( = ?auto_10947 ?auto_10943 ) ) ( not ( = ?auto_10938 ?auto_10943 ) ) ( not ( = ?auto_10944 ?auto_10943 ) ) ( not ( = ?auto_10935 ?auto_10943 ) ) ( AVAILABLE ?auto_10945 ) ( IN ?auto_10944 ?auto_10942 ) ( TRUCK-AT ?auto_10942 ?auto_10939 ) )
    :subtasks
    ( ( !DRIVE ?auto_10942 ?auto_10939 ?auto_10940 )
      ( MAKE-ON ?auto_10933 ?auto_10934 )
      ( MAKE-ON-VERIFY ?auto_10933 ?auto_10934 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_10950 - SURFACE
      ?auto_10951 - SURFACE
    )
    :vars
    (
      ?auto_10955 - HOIST
      ?auto_10952 - PLACE
      ?auto_10961 - PLACE
      ?auto_10954 - HOIST
      ?auto_10962 - SURFACE
      ?auto_10963 - SURFACE
      ?auto_10966 - PLACE
      ?auto_10953 - HOIST
      ?auto_10956 - SURFACE
      ?auto_10959 - SURFACE
      ?auto_10964 - PLACE
      ?auto_10965 - HOIST
      ?auto_10958 - SURFACE
      ?auto_10957 - SURFACE
      ?auto_10960 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10955 ?auto_10952 ) ( IS-CRATE ?auto_10950 ) ( not ( = ?auto_10950 ?auto_10951 ) ) ( not ( = ?auto_10961 ?auto_10952 ) ) ( HOIST-AT ?auto_10954 ?auto_10961 ) ( not ( = ?auto_10955 ?auto_10954 ) ) ( SURFACE-AT ?auto_10950 ?auto_10961 ) ( ON ?auto_10950 ?auto_10962 ) ( CLEAR ?auto_10950 ) ( not ( = ?auto_10950 ?auto_10962 ) ) ( not ( = ?auto_10951 ?auto_10962 ) ) ( IS-CRATE ?auto_10951 ) ( not ( = ?auto_10950 ?auto_10963 ) ) ( not ( = ?auto_10951 ?auto_10963 ) ) ( not ( = ?auto_10962 ?auto_10963 ) ) ( not ( = ?auto_10966 ?auto_10952 ) ) ( not ( = ?auto_10961 ?auto_10966 ) ) ( HOIST-AT ?auto_10953 ?auto_10966 ) ( not ( = ?auto_10955 ?auto_10953 ) ) ( not ( = ?auto_10954 ?auto_10953 ) ) ( AVAILABLE ?auto_10953 ) ( SURFACE-AT ?auto_10951 ?auto_10966 ) ( ON ?auto_10951 ?auto_10956 ) ( CLEAR ?auto_10951 ) ( not ( = ?auto_10950 ?auto_10956 ) ) ( not ( = ?auto_10951 ?auto_10956 ) ) ( not ( = ?auto_10962 ?auto_10956 ) ) ( not ( = ?auto_10963 ?auto_10956 ) ) ( IS-CRATE ?auto_10963 ) ( not ( = ?auto_10950 ?auto_10959 ) ) ( not ( = ?auto_10951 ?auto_10959 ) ) ( not ( = ?auto_10962 ?auto_10959 ) ) ( not ( = ?auto_10963 ?auto_10959 ) ) ( not ( = ?auto_10956 ?auto_10959 ) ) ( not ( = ?auto_10964 ?auto_10952 ) ) ( not ( = ?auto_10961 ?auto_10964 ) ) ( not ( = ?auto_10966 ?auto_10964 ) ) ( HOIST-AT ?auto_10965 ?auto_10964 ) ( not ( = ?auto_10955 ?auto_10965 ) ) ( not ( = ?auto_10954 ?auto_10965 ) ) ( not ( = ?auto_10953 ?auto_10965 ) ) ( AVAILABLE ?auto_10965 ) ( SURFACE-AT ?auto_10963 ?auto_10964 ) ( ON ?auto_10963 ?auto_10958 ) ( CLEAR ?auto_10963 ) ( not ( = ?auto_10950 ?auto_10958 ) ) ( not ( = ?auto_10951 ?auto_10958 ) ) ( not ( = ?auto_10962 ?auto_10958 ) ) ( not ( = ?auto_10963 ?auto_10958 ) ) ( not ( = ?auto_10956 ?auto_10958 ) ) ( not ( = ?auto_10959 ?auto_10958 ) ) ( SURFACE-AT ?auto_10957 ?auto_10952 ) ( CLEAR ?auto_10957 ) ( IS-CRATE ?auto_10959 ) ( not ( = ?auto_10950 ?auto_10957 ) ) ( not ( = ?auto_10951 ?auto_10957 ) ) ( not ( = ?auto_10962 ?auto_10957 ) ) ( not ( = ?auto_10963 ?auto_10957 ) ) ( not ( = ?auto_10956 ?auto_10957 ) ) ( not ( = ?auto_10959 ?auto_10957 ) ) ( not ( = ?auto_10958 ?auto_10957 ) ) ( AVAILABLE ?auto_10955 ) ( TRUCK-AT ?auto_10960 ?auto_10961 ) ( LIFTING ?auto_10954 ?auto_10959 ) )
    :subtasks
    ( ( !LOAD ?auto_10954 ?auto_10959 ?auto_10960 ?auto_10961 )
      ( MAKE-ON ?auto_10950 ?auto_10951 )
      ( MAKE-ON-VERIFY ?auto_10950 ?auto_10951 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_10967 - SURFACE
      ?auto_10968 - SURFACE
    )
    :vars
    (
      ?auto_10974 - HOIST
      ?auto_10972 - PLACE
      ?auto_10971 - PLACE
      ?auto_10982 - HOIST
      ?auto_10970 - SURFACE
      ?auto_10979 - SURFACE
      ?auto_10973 - PLACE
      ?auto_10969 - HOIST
      ?auto_10978 - SURFACE
      ?auto_10981 - SURFACE
      ?auto_10980 - PLACE
      ?auto_10977 - HOIST
      ?auto_10975 - SURFACE
      ?auto_10976 - SURFACE
      ?auto_10983 - TRUCK
      ?auto_10984 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10974 ?auto_10972 ) ( IS-CRATE ?auto_10967 ) ( not ( = ?auto_10967 ?auto_10968 ) ) ( not ( = ?auto_10971 ?auto_10972 ) ) ( HOIST-AT ?auto_10982 ?auto_10971 ) ( not ( = ?auto_10974 ?auto_10982 ) ) ( SURFACE-AT ?auto_10967 ?auto_10971 ) ( ON ?auto_10967 ?auto_10970 ) ( CLEAR ?auto_10967 ) ( not ( = ?auto_10967 ?auto_10970 ) ) ( not ( = ?auto_10968 ?auto_10970 ) ) ( IS-CRATE ?auto_10968 ) ( not ( = ?auto_10967 ?auto_10979 ) ) ( not ( = ?auto_10968 ?auto_10979 ) ) ( not ( = ?auto_10970 ?auto_10979 ) ) ( not ( = ?auto_10973 ?auto_10972 ) ) ( not ( = ?auto_10971 ?auto_10973 ) ) ( HOIST-AT ?auto_10969 ?auto_10973 ) ( not ( = ?auto_10974 ?auto_10969 ) ) ( not ( = ?auto_10982 ?auto_10969 ) ) ( AVAILABLE ?auto_10969 ) ( SURFACE-AT ?auto_10968 ?auto_10973 ) ( ON ?auto_10968 ?auto_10978 ) ( CLEAR ?auto_10968 ) ( not ( = ?auto_10967 ?auto_10978 ) ) ( not ( = ?auto_10968 ?auto_10978 ) ) ( not ( = ?auto_10970 ?auto_10978 ) ) ( not ( = ?auto_10979 ?auto_10978 ) ) ( IS-CRATE ?auto_10979 ) ( not ( = ?auto_10967 ?auto_10981 ) ) ( not ( = ?auto_10968 ?auto_10981 ) ) ( not ( = ?auto_10970 ?auto_10981 ) ) ( not ( = ?auto_10979 ?auto_10981 ) ) ( not ( = ?auto_10978 ?auto_10981 ) ) ( not ( = ?auto_10980 ?auto_10972 ) ) ( not ( = ?auto_10971 ?auto_10980 ) ) ( not ( = ?auto_10973 ?auto_10980 ) ) ( HOIST-AT ?auto_10977 ?auto_10980 ) ( not ( = ?auto_10974 ?auto_10977 ) ) ( not ( = ?auto_10982 ?auto_10977 ) ) ( not ( = ?auto_10969 ?auto_10977 ) ) ( AVAILABLE ?auto_10977 ) ( SURFACE-AT ?auto_10979 ?auto_10980 ) ( ON ?auto_10979 ?auto_10975 ) ( CLEAR ?auto_10979 ) ( not ( = ?auto_10967 ?auto_10975 ) ) ( not ( = ?auto_10968 ?auto_10975 ) ) ( not ( = ?auto_10970 ?auto_10975 ) ) ( not ( = ?auto_10979 ?auto_10975 ) ) ( not ( = ?auto_10978 ?auto_10975 ) ) ( not ( = ?auto_10981 ?auto_10975 ) ) ( SURFACE-AT ?auto_10976 ?auto_10972 ) ( CLEAR ?auto_10976 ) ( IS-CRATE ?auto_10981 ) ( not ( = ?auto_10967 ?auto_10976 ) ) ( not ( = ?auto_10968 ?auto_10976 ) ) ( not ( = ?auto_10970 ?auto_10976 ) ) ( not ( = ?auto_10979 ?auto_10976 ) ) ( not ( = ?auto_10978 ?auto_10976 ) ) ( not ( = ?auto_10981 ?auto_10976 ) ) ( not ( = ?auto_10975 ?auto_10976 ) ) ( AVAILABLE ?auto_10974 ) ( TRUCK-AT ?auto_10983 ?auto_10971 ) ( AVAILABLE ?auto_10982 ) ( SURFACE-AT ?auto_10981 ?auto_10971 ) ( ON ?auto_10981 ?auto_10984 ) ( CLEAR ?auto_10981 ) ( not ( = ?auto_10967 ?auto_10984 ) ) ( not ( = ?auto_10968 ?auto_10984 ) ) ( not ( = ?auto_10970 ?auto_10984 ) ) ( not ( = ?auto_10979 ?auto_10984 ) ) ( not ( = ?auto_10978 ?auto_10984 ) ) ( not ( = ?auto_10981 ?auto_10984 ) ) ( not ( = ?auto_10975 ?auto_10984 ) ) ( not ( = ?auto_10976 ?auto_10984 ) ) )
    :subtasks
    ( ( !LIFT ?auto_10982 ?auto_10981 ?auto_10984 ?auto_10971 )
      ( MAKE-ON ?auto_10967 ?auto_10968 )
      ( MAKE-ON-VERIFY ?auto_10967 ?auto_10968 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_10985 - SURFACE
      ?auto_10986 - SURFACE
    )
    :vars
    (
      ?auto_11002 - HOIST
      ?auto_10987 - PLACE
      ?auto_10993 - PLACE
      ?auto_10988 - HOIST
      ?auto_10997 - SURFACE
      ?auto_10995 - SURFACE
      ?auto_10994 - PLACE
      ?auto_11001 - HOIST
      ?auto_10996 - SURFACE
      ?auto_10990 - SURFACE
      ?auto_10989 - PLACE
      ?auto_10991 - HOIST
      ?auto_10999 - SURFACE
      ?auto_10992 - SURFACE
      ?auto_11000 - SURFACE
      ?auto_10998 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11002 ?auto_10987 ) ( IS-CRATE ?auto_10985 ) ( not ( = ?auto_10985 ?auto_10986 ) ) ( not ( = ?auto_10993 ?auto_10987 ) ) ( HOIST-AT ?auto_10988 ?auto_10993 ) ( not ( = ?auto_11002 ?auto_10988 ) ) ( SURFACE-AT ?auto_10985 ?auto_10993 ) ( ON ?auto_10985 ?auto_10997 ) ( CLEAR ?auto_10985 ) ( not ( = ?auto_10985 ?auto_10997 ) ) ( not ( = ?auto_10986 ?auto_10997 ) ) ( IS-CRATE ?auto_10986 ) ( not ( = ?auto_10985 ?auto_10995 ) ) ( not ( = ?auto_10986 ?auto_10995 ) ) ( not ( = ?auto_10997 ?auto_10995 ) ) ( not ( = ?auto_10994 ?auto_10987 ) ) ( not ( = ?auto_10993 ?auto_10994 ) ) ( HOIST-AT ?auto_11001 ?auto_10994 ) ( not ( = ?auto_11002 ?auto_11001 ) ) ( not ( = ?auto_10988 ?auto_11001 ) ) ( AVAILABLE ?auto_11001 ) ( SURFACE-AT ?auto_10986 ?auto_10994 ) ( ON ?auto_10986 ?auto_10996 ) ( CLEAR ?auto_10986 ) ( not ( = ?auto_10985 ?auto_10996 ) ) ( not ( = ?auto_10986 ?auto_10996 ) ) ( not ( = ?auto_10997 ?auto_10996 ) ) ( not ( = ?auto_10995 ?auto_10996 ) ) ( IS-CRATE ?auto_10995 ) ( not ( = ?auto_10985 ?auto_10990 ) ) ( not ( = ?auto_10986 ?auto_10990 ) ) ( not ( = ?auto_10997 ?auto_10990 ) ) ( not ( = ?auto_10995 ?auto_10990 ) ) ( not ( = ?auto_10996 ?auto_10990 ) ) ( not ( = ?auto_10989 ?auto_10987 ) ) ( not ( = ?auto_10993 ?auto_10989 ) ) ( not ( = ?auto_10994 ?auto_10989 ) ) ( HOIST-AT ?auto_10991 ?auto_10989 ) ( not ( = ?auto_11002 ?auto_10991 ) ) ( not ( = ?auto_10988 ?auto_10991 ) ) ( not ( = ?auto_11001 ?auto_10991 ) ) ( AVAILABLE ?auto_10991 ) ( SURFACE-AT ?auto_10995 ?auto_10989 ) ( ON ?auto_10995 ?auto_10999 ) ( CLEAR ?auto_10995 ) ( not ( = ?auto_10985 ?auto_10999 ) ) ( not ( = ?auto_10986 ?auto_10999 ) ) ( not ( = ?auto_10997 ?auto_10999 ) ) ( not ( = ?auto_10995 ?auto_10999 ) ) ( not ( = ?auto_10996 ?auto_10999 ) ) ( not ( = ?auto_10990 ?auto_10999 ) ) ( SURFACE-AT ?auto_10992 ?auto_10987 ) ( CLEAR ?auto_10992 ) ( IS-CRATE ?auto_10990 ) ( not ( = ?auto_10985 ?auto_10992 ) ) ( not ( = ?auto_10986 ?auto_10992 ) ) ( not ( = ?auto_10997 ?auto_10992 ) ) ( not ( = ?auto_10995 ?auto_10992 ) ) ( not ( = ?auto_10996 ?auto_10992 ) ) ( not ( = ?auto_10990 ?auto_10992 ) ) ( not ( = ?auto_10999 ?auto_10992 ) ) ( AVAILABLE ?auto_11002 ) ( AVAILABLE ?auto_10988 ) ( SURFACE-AT ?auto_10990 ?auto_10993 ) ( ON ?auto_10990 ?auto_11000 ) ( CLEAR ?auto_10990 ) ( not ( = ?auto_10985 ?auto_11000 ) ) ( not ( = ?auto_10986 ?auto_11000 ) ) ( not ( = ?auto_10997 ?auto_11000 ) ) ( not ( = ?auto_10995 ?auto_11000 ) ) ( not ( = ?auto_10996 ?auto_11000 ) ) ( not ( = ?auto_10990 ?auto_11000 ) ) ( not ( = ?auto_10999 ?auto_11000 ) ) ( not ( = ?auto_10992 ?auto_11000 ) ) ( TRUCK-AT ?auto_10998 ?auto_10987 ) )
    :subtasks
    ( ( !DRIVE ?auto_10998 ?auto_10987 ?auto_10993 )
      ( MAKE-ON ?auto_10985 ?auto_10986 )
      ( MAKE-ON-VERIFY ?auto_10985 ?auto_10986 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_11005 - SURFACE
      ?auto_11006 - SURFACE
    )
    :vars
    (
      ?auto_11007 - HOIST
      ?auto_11008 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11007 ?auto_11008 ) ( SURFACE-AT ?auto_11006 ?auto_11008 ) ( CLEAR ?auto_11006 ) ( LIFTING ?auto_11007 ?auto_11005 ) ( IS-CRATE ?auto_11005 ) ( not ( = ?auto_11005 ?auto_11006 ) ) )
    :subtasks
    ( ( !DROP ?auto_11007 ?auto_11005 ?auto_11006 ?auto_11008 )
      ( MAKE-ON-VERIFY ?auto_11005 ?auto_11006 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_11009 - SURFACE
      ?auto_11010 - SURFACE
    )
    :vars
    (
      ?auto_11011 - HOIST
      ?auto_11012 - PLACE
      ?auto_11013 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11011 ?auto_11012 ) ( SURFACE-AT ?auto_11010 ?auto_11012 ) ( CLEAR ?auto_11010 ) ( IS-CRATE ?auto_11009 ) ( not ( = ?auto_11009 ?auto_11010 ) ) ( TRUCK-AT ?auto_11013 ?auto_11012 ) ( AVAILABLE ?auto_11011 ) ( IN ?auto_11009 ?auto_11013 ) )
    :subtasks
    ( ( !UNLOAD ?auto_11011 ?auto_11009 ?auto_11013 ?auto_11012 )
      ( MAKE-ON ?auto_11009 ?auto_11010 )
      ( MAKE-ON-VERIFY ?auto_11009 ?auto_11010 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_11014 - SURFACE
      ?auto_11015 - SURFACE
    )
    :vars
    (
      ?auto_11017 - HOIST
      ?auto_11018 - PLACE
      ?auto_11016 - TRUCK
      ?auto_11019 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11017 ?auto_11018 ) ( SURFACE-AT ?auto_11015 ?auto_11018 ) ( CLEAR ?auto_11015 ) ( IS-CRATE ?auto_11014 ) ( not ( = ?auto_11014 ?auto_11015 ) ) ( AVAILABLE ?auto_11017 ) ( IN ?auto_11014 ?auto_11016 ) ( TRUCK-AT ?auto_11016 ?auto_11019 ) ( not ( = ?auto_11019 ?auto_11018 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_11016 ?auto_11019 ?auto_11018 )
      ( MAKE-ON ?auto_11014 ?auto_11015 )
      ( MAKE-ON-VERIFY ?auto_11014 ?auto_11015 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_11020 - SURFACE
      ?auto_11021 - SURFACE
    )
    :vars
    (
      ?auto_11025 - HOIST
      ?auto_11024 - PLACE
      ?auto_11022 - TRUCK
      ?auto_11023 - PLACE
      ?auto_11026 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_11025 ?auto_11024 ) ( SURFACE-AT ?auto_11021 ?auto_11024 ) ( CLEAR ?auto_11021 ) ( IS-CRATE ?auto_11020 ) ( not ( = ?auto_11020 ?auto_11021 ) ) ( AVAILABLE ?auto_11025 ) ( TRUCK-AT ?auto_11022 ?auto_11023 ) ( not ( = ?auto_11023 ?auto_11024 ) ) ( HOIST-AT ?auto_11026 ?auto_11023 ) ( LIFTING ?auto_11026 ?auto_11020 ) ( not ( = ?auto_11025 ?auto_11026 ) ) )
    :subtasks
    ( ( !LOAD ?auto_11026 ?auto_11020 ?auto_11022 ?auto_11023 )
      ( MAKE-ON ?auto_11020 ?auto_11021 )
      ( MAKE-ON-VERIFY ?auto_11020 ?auto_11021 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_11027 - SURFACE
      ?auto_11028 - SURFACE
    )
    :vars
    (
      ?auto_11033 - HOIST
      ?auto_11031 - PLACE
      ?auto_11029 - TRUCK
      ?auto_11030 - PLACE
      ?auto_11032 - HOIST
      ?auto_11034 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11033 ?auto_11031 ) ( SURFACE-AT ?auto_11028 ?auto_11031 ) ( CLEAR ?auto_11028 ) ( IS-CRATE ?auto_11027 ) ( not ( = ?auto_11027 ?auto_11028 ) ) ( AVAILABLE ?auto_11033 ) ( TRUCK-AT ?auto_11029 ?auto_11030 ) ( not ( = ?auto_11030 ?auto_11031 ) ) ( HOIST-AT ?auto_11032 ?auto_11030 ) ( not ( = ?auto_11033 ?auto_11032 ) ) ( AVAILABLE ?auto_11032 ) ( SURFACE-AT ?auto_11027 ?auto_11030 ) ( ON ?auto_11027 ?auto_11034 ) ( CLEAR ?auto_11027 ) ( not ( = ?auto_11027 ?auto_11034 ) ) ( not ( = ?auto_11028 ?auto_11034 ) ) )
    :subtasks
    ( ( !LIFT ?auto_11032 ?auto_11027 ?auto_11034 ?auto_11030 )
      ( MAKE-ON ?auto_11027 ?auto_11028 )
      ( MAKE-ON-VERIFY ?auto_11027 ?auto_11028 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_11035 - SURFACE
      ?auto_11036 - SURFACE
    )
    :vars
    (
      ?auto_11038 - HOIST
      ?auto_11042 - PLACE
      ?auto_11037 - PLACE
      ?auto_11041 - HOIST
      ?auto_11040 - SURFACE
      ?auto_11039 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11038 ?auto_11042 ) ( SURFACE-AT ?auto_11036 ?auto_11042 ) ( CLEAR ?auto_11036 ) ( IS-CRATE ?auto_11035 ) ( not ( = ?auto_11035 ?auto_11036 ) ) ( AVAILABLE ?auto_11038 ) ( not ( = ?auto_11037 ?auto_11042 ) ) ( HOIST-AT ?auto_11041 ?auto_11037 ) ( not ( = ?auto_11038 ?auto_11041 ) ) ( AVAILABLE ?auto_11041 ) ( SURFACE-AT ?auto_11035 ?auto_11037 ) ( ON ?auto_11035 ?auto_11040 ) ( CLEAR ?auto_11035 ) ( not ( = ?auto_11035 ?auto_11040 ) ) ( not ( = ?auto_11036 ?auto_11040 ) ) ( TRUCK-AT ?auto_11039 ?auto_11042 ) )
    :subtasks
    ( ( !DRIVE ?auto_11039 ?auto_11042 ?auto_11037 )
      ( MAKE-ON ?auto_11035 ?auto_11036 )
      ( MAKE-ON-VERIFY ?auto_11035 ?auto_11036 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_11043 - SURFACE
      ?auto_11044 - SURFACE
    )
    :vars
    (
      ?auto_11049 - HOIST
      ?auto_11048 - PLACE
      ?auto_11045 - PLACE
      ?auto_11047 - HOIST
      ?auto_11050 - SURFACE
      ?auto_11046 - TRUCK
      ?auto_11051 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11049 ?auto_11048 ) ( IS-CRATE ?auto_11043 ) ( not ( = ?auto_11043 ?auto_11044 ) ) ( not ( = ?auto_11045 ?auto_11048 ) ) ( HOIST-AT ?auto_11047 ?auto_11045 ) ( not ( = ?auto_11049 ?auto_11047 ) ) ( AVAILABLE ?auto_11047 ) ( SURFACE-AT ?auto_11043 ?auto_11045 ) ( ON ?auto_11043 ?auto_11050 ) ( CLEAR ?auto_11043 ) ( not ( = ?auto_11043 ?auto_11050 ) ) ( not ( = ?auto_11044 ?auto_11050 ) ) ( TRUCK-AT ?auto_11046 ?auto_11048 ) ( SURFACE-AT ?auto_11051 ?auto_11048 ) ( CLEAR ?auto_11051 ) ( LIFTING ?auto_11049 ?auto_11044 ) ( IS-CRATE ?auto_11044 ) ( not ( = ?auto_11043 ?auto_11051 ) ) ( not ( = ?auto_11044 ?auto_11051 ) ) ( not ( = ?auto_11050 ?auto_11051 ) ) )
    :subtasks
    ( ( !DROP ?auto_11049 ?auto_11044 ?auto_11051 ?auto_11048 )
      ( MAKE-ON ?auto_11043 ?auto_11044 )
      ( MAKE-ON-VERIFY ?auto_11043 ?auto_11044 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_11052 - SURFACE
      ?auto_11053 - SURFACE
    )
    :vars
    (
      ?auto_11058 - HOIST
      ?auto_11060 - PLACE
      ?auto_11054 - PLACE
      ?auto_11057 - HOIST
      ?auto_11055 - SURFACE
      ?auto_11056 - TRUCK
      ?auto_11059 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11058 ?auto_11060 ) ( IS-CRATE ?auto_11052 ) ( not ( = ?auto_11052 ?auto_11053 ) ) ( not ( = ?auto_11054 ?auto_11060 ) ) ( HOIST-AT ?auto_11057 ?auto_11054 ) ( not ( = ?auto_11058 ?auto_11057 ) ) ( AVAILABLE ?auto_11057 ) ( SURFACE-AT ?auto_11052 ?auto_11054 ) ( ON ?auto_11052 ?auto_11055 ) ( CLEAR ?auto_11052 ) ( not ( = ?auto_11052 ?auto_11055 ) ) ( not ( = ?auto_11053 ?auto_11055 ) ) ( TRUCK-AT ?auto_11056 ?auto_11060 ) ( SURFACE-AT ?auto_11059 ?auto_11060 ) ( CLEAR ?auto_11059 ) ( IS-CRATE ?auto_11053 ) ( not ( = ?auto_11052 ?auto_11059 ) ) ( not ( = ?auto_11053 ?auto_11059 ) ) ( not ( = ?auto_11055 ?auto_11059 ) ) ( AVAILABLE ?auto_11058 ) ( IN ?auto_11053 ?auto_11056 ) )
    :subtasks
    ( ( !UNLOAD ?auto_11058 ?auto_11053 ?auto_11056 ?auto_11060 )
      ( MAKE-ON ?auto_11052 ?auto_11053 )
      ( MAKE-ON-VERIFY ?auto_11052 ?auto_11053 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_11061 - SURFACE
      ?auto_11062 - SURFACE
    )
    :vars
    (
      ?auto_11067 - HOIST
      ?auto_11066 - PLACE
      ?auto_11064 - PLACE
      ?auto_11068 - HOIST
      ?auto_11063 - SURFACE
      ?auto_11065 - SURFACE
      ?auto_11069 - TRUCK
      ?auto_11070 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11067 ?auto_11066 ) ( IS-CRATE ?auto_11061 ) ( not ( = ?auto_11061 ?auto_11062 ) ) ( not ( = ?auto_11064 ?auto_11066 ) ) ( HOIST-AT ?auto_11068 ?auto_11064 ) ( not ( = ?auto_11067 ?auto_11068 ) ) ( AVAILABLE ?auto_11068 ) ( SURFACE-AT ?auto_11061 ?auto_11064 ) ( ON ?auto_11061 ?auto_11063 ) ( CLEAR ?auto_11061 ) ( not ( = ?auto_11061 ?auto_11063 ) ) ( not ( = ?auto_11062 ?auto_11063 ) ) ( SURFACE-AT ?auto_11065 ?auto_11066 ) ( CLEAR ?auto_11065 ) ( IS-CRATE ?auto_11062 ) ( not ( = ?auto_11061 ?auto_11065 ) ) ( not ( = ?auto_11062 ?auto_11065 ) ) ( not ( = ?auto_11063 ?auto_11065 ) ) ( AVAILABLE ?auto_11067 ) ( IN ?auto_11062 ?auto_11069 ) ( TRUCK-AT ?auto_11069 ?auto_11070 ) ( not ( = ?auto_11070 ?auto_11066 ) ) ( not ( = ?auto_11064 ?auto_11070 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_11069 ?auto_11070 ?auto_11066 )
      ( MAKE-ON ?auto_11061 ?auto_11062 )
      ( MAKE-ON-VERIFY ?auto_11061 ?auto_11062 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_11071 - SURFACE
      ?auto_11072 - SURFACE
    )
    :vars
    (
      ?auto_11074 - HOIST
      ?auto_11078 - PLACE
      ?auto_11075 - PLACE
      ?auto_11080 - HOIST
      ?auto_11076 - SURFACE
      ?auto_11079 - SURFACE
      ?auto_11077 - TRUCK
      ?auto_11073 - PLACE
      ?auto_11081 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_11074 ?auto_11078 ) ( IS-CRATE ?auto_11071 ) ( not ( = ?auto_11071 ?auto_11072 ) ) ( not ( = ?auto_11075 ?auto_11078 ) ) ( HOIST-AT ?auto_11080 ?auto_11075 ) ( not ( = ?auto_11074 ?auto_11080 ) ) ( AVAILABLE ?auto_11080 ) ( SURFACE-AT ?auto_11071 ?auto_11075 ) ( ON ?auto_11071 ?auto_11076 ) ( CLEAR ?auto_11071 ) ( not ( = ?auto_11071 ?auto_11076 ) ) ( not ( = ?auto_11072 ?auto_11076 ) ) ( SURFACE-AT ?auto_11079 ?auto_11078 ) ( CLEAR ?auto_11079 ) ( IS-CRATE ?auto_11072 ) ( not ( = ?auto_11071 ?auto_11079 ) ) ( not ( = ?auto_11072 ?auto_11079 ) ) ( not ( = ?auto_11076 ?auto_11079 ) ) ( AVAILABLE ?auto_11074 ) ( TRUCK-AT ?auto_11077 ?auto_11073 ) ( not ( = ?auto_11073 ?auto_11078 ) ) ( not ( = ?auto_11075 ?auto_11073 ) ) ( HOIST-AT ?auto_11081 ?auto_11073 ) ( LIFTING ?auto_11081 ?auto_11072 ) ( not ( = ?auto_11074 ?auto_11081 ) ) ( not ( = ?auto_11080 ?auto_11081 ) ) )
    :subtasks
    ( ( !LOAD ?auto_11081 ?auto_11072 ?auto_11077 ?auto_11073 )
      ( MAKE-ON ?auto_11071 ?auto_11072 )
      ( MAKE-ON-VERIFY ?auto_11071 ?auto_11072 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_11082 - SURFACE
      ?auto_11083 - SURFACE
    )
    :vars
    (
      ?auto_11089 - HOIST
      ?auto_11092 - PLACE
      ?auto_11090 - PLACE
      ?auto_11086 - HOIST
      ?auto_11091 - SURFACE
      ?auto_11087 - SURFACE
      ?auto_11088 - TRUCK
      ?auto_11085 - PLACE
      ?auto_11084 - HOIST
      ?auto_11093 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11089 ?auto_11092 ) ( IS-CRATE ?auto_11082 ) ( not ( = ?auto_11082 ?auto_11083 ) ) ( not ( = ?auto_11090 ?auto_11092 ) ) ( HOIST-AT ?auto_11086 ?auto_11090 ) ( not ( = ?auto_11089 ?auto_11086 ) ) ( AVAILABLE ?auto_11086 ) ( SURFACE-AT ?auto_11082 ?auto_11090 ) ( ON ?auto_11082 ?auto_11091 ) ( CLEAR ?auto_11082 ) ( not ( = ?auto_11082 ?auto_11091 ) ) ( not ( = ?auto_11083 ?auto_11091 ) ) ( SURFACE-AT ?auto_11087 ?auto_11092 ) ( CLEAR ?auto_11087 ) ( IS-CRATE ?auto_11083 ) ( not ( = ?auto_11082 ?auto_11087 ) ) ( not ( = ?auto_11083 ?auto_11087 ) ) ( not ( = ?auto_11091 ?auto_11087 ) ) ( AVAILABLE ?auto_11089 ) ( TRUCK-AT ?auto_11088 ?auto_11085 ) ( not ( = ?auto_11085 ?auto_11092 ) ) ( not ( = ?auto_11090 ?auto_11085 ) ) ( HOIST-AT ?auto_11084 ?auto_11085 ) ( not ( = ?auto_11089 ?auto_11084 ) ) ( not ( = ?auto_11086 ?auto_11084 ) ) ( AVAILABLE ?auto_11084 ) ( SURFACE-AT ?auto_11083 ?auto_11085 ) ( ON ?auto_11083 ?auto_11093 ) ( CLEAR ?auto_11083 ) ( not ( = ?auto_11082 ?auto_11093 ) ) ( not ( = ?auto_11083 ?auto_11093 ) ) ( not ( = ?auto_11091 ?auto_11093 ) ) ( not ( = ?auto_11087 ?auto_11093 ) ) )
    :subtasks
    ( ( !LIFT ?auto_11084 ?auto_11083 ?auto_11093 ?auto_11085 )
      ( MAKE-ON ?auto_11082 ?auto_11083 )
      ( MAKE-ON-VERIFY ?auto_11082 ?auto_11083 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_11094 - SURFACE
      ?auto_11095 - SURFACE
    )
    :vars
    (
      ?auto_11098 - HOIST
      ?auto_11099 - PLACE
      ?auto_11105 - PLACE
      ?auto_11104 - HOIST
      ?auto_11102 - SURFACE
      ?auto_11097 - SURFACE
      ?auto_11103 - PLACE
      ?auto_11096 - HOIST
      ?auto_11101 - SURFACE
      ?auto_11100 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11098 ?auto_11099 ) ( IS-CRATE ?auto_11094 ) ( not ( = ?auto_11094 ?auto_11095 ) ) ( not ( = ?auto_11105 ?auto_11099 ) ) ( HOIST-AT ?auto_11104 ?auto_11105 ) ( not ( = ?auto_11098 ?auto_11104 ) ) ( AVAILABLE ?auto_11104 ) ( SURFACE-AT ?auto_11094 ?auto_11105 ) ( ON ?auto_11094 ?auto_11102 ) ( CLEAR ?auto_11094 ) ( not ( = ?auto_11094 ?auto_11102 ) ) ( not ( = ?auto_11095 ?auto_11102 ) ) ( SURFACE-AT ?auto_11097 ?auto_11099 ) ( CLEAR ?auto_11097 ) ( IS-CRATE ?auto_11095 ) ( not ( = ?auto_11094 ?auto_11097 ) ) ( not ( = ?auto_11095 ?auto_11097 ) ) ( not ( = ?auto_11102 ?auto_11097 ) ) ( AVAILABLE ?auto_11098 ) ( not ( = ?auto_11103 ?auto_11099 ) ) ( not ( = ?auto_11105 ?auto_11103 ) ) ( HOIST-AT ?auto_11096 ?auto_11103 ) ( not ( = ?auto_11098 ?auto_11096 ) ) ( not ( = ?auto_11104 ?auto_11096 ) ) ( AVAILABLE ?auto_11096 ) ( SURFACE-AT ?auto_11095 ?auto_11103 ) ( ON ?auto_11095 ?auto_11101 ) ( CLEAR ?auto_11095 ) ( not ( = ?auto_11094 ?auto_11101 ) ) ( not ( = ?auto_11095 ?auto_11101 ) ) ( not ( = ?auto_11102 ?auto_11101 ) ) ( not ( = ?auto_11097 ?auto_11101 ) ) ( TRUCK-AT ?auto_11100 ?auto_11099 ) )
    :subtasks
    ( ( !DRIVE ?auto_11100 ?auto_11099 ?auto_11103 )
      ( MAKE-ON ?auto_11094 ?auto_11095 )
      ( MAKE-ON-VERIFY ?auto_11094 ?auto_11095 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_11106 - SURFACE
      ?auto_11107 - SURFACE
    )
    :vars
    (
      ?auto_11109 - HOIST
      ?auto_11115 - PLACE
      ?auto_11112 - PLACE
      ?auto_11117 - HOIST
      ?auto_11116 - SURFACE
      ?auto_11111 - SURFACE
      ?auto_11110 - PLACE
      ?auto_11113 - HOIST
      ?auto_11108 - SURFACE
      ?auto_11114 - TRUCK
      ?auto_11118 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11109 ?auto_11115 ) ( IS-CRATE ?auto_11106 ) ( not ( = ?auto_11106 ?auto_11107 ) ) ( not ( = ?auto_11112 ?auto_11115 ) ) ( HOIST-AT ?auto_11117 ?auto_11112 ) ( not ( = ?auto_11109 ?auto_11117 ) ) ( AVAILABLE ?auto_11117 ) ( SURFACE-AT ?auto_11106 ?auto_11112 ) ( ON ?auto_11106 ?auto_11116 ) ( CLEAR ?auto_11106 ) ( not ( = ?auto_11106 ?auto_11116 ) ) ( not ( = ?auto_11107 ?auto_11116 ) ) ( IS-CRATE ?auto_11107 ) ( not ( = ?auto_11106 ?auto_11111 ) ) ( not ( = ?auto_11107 ?auto_11111 ) ) ( not ( = ?auto_11116 ?auto_11111 ) ) ( not ( = ?auto_11110 ?auto_11115 ) ) ( not ( = ?auto_11112 ?auto_11110 ) ) ( HOIST-AT ?auto_11113 ?auto_11110 ) ( not ( = ?auto_11109 ?auto_11113 ) ) ( not ( = ?auto_11117 ?auto_11113 ) ) ( AVAILABLE ?auto_11113 ) ( SURFACE-AT ?auto_11107 ?auto_11110 ) ( ON ?auto_11107 ?auto_11108 ) ( CLEAR ?auto_11107 ) ( not ( = ?auto_11106 ?auto_11108 ) ) ( not ( = ?auto_11107 ?auto_11108 ) ) ( not ( = ?auto_11116 ?auto_11108 ) ) ( not ( = ?auto_11111 ?auto_11108 ) ) ( TRUCK-AT ?auto_11114 ?auto_11115 ) ( SURFACE-AT ?auto_11118 ?auto_11115 ) ( CLEAR ?auto_11118 ) ( LIFTING ?auto_11109 ?auto_11111 ) ( IS-CRATE ?auto_11111 ) ( not ( = ?auto_11106 ?auto_11118 ) ) ( not ( = ?auto_11107 ?auto_11118 ) ) ( not ( = ?auto_11116 ?auto_11118 ) ) ( not ( = ?auto_11111 ?auto_11118 ) ) ( not ( = ?auto_11108 ?auto_11118 ) ) )
    :subtasks
    ( ( !DROP ?auto_11109 ?auto_11111 ?auto_11118 ?auto_11115 )
      ( MAKE-ON ?auto_11106 ?auto_11107 )
      ( MAKE-ON-VERIFY ?auto_11106 ?auto_11107 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_11119 - SURFACE
      ?auto_11120 - SURFACE
    )
    :vars
    (
      ?auto_11127 - HOIST
      ?auto_11131 - PLACE
      ?auto_11128 - PLACE
      ?auto_11130 - HOIST
      ?auto_11122 - SURFACE
      ?auto_11126 - SURFACE
      ?auto_11124 - PLACE
      ?auto_11125 - HOIST
      ?auto_11121 - SURFACE
      ?auto_11129 - TRUCK
      ?auto_11123 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11127 ?auto_11131 ) ( IS-CRATE ?auto_11119 ) ( not ( = ?auto_11119 ?auto_11120 ) ) ( not ( = ?auto_11128 ?auto_11131 ) ) ( HOIST-AT ?auto_11130 ?auto_11128 ) ( not ( = ?auto_11127 ?auto_11130 ) ) ( AVAILABLE ?auto_11130 ) ( SURFACE-AT ?auto_11119 ?auto_11128 ) ( ON ?auto_11119 ?auto_11122 ) ( CLEAR ?auto_11119 ) ( not ( = ?auto_11119 ?auto_11122 ) ) ( not ( = ?auto_11120 ?auto_11122 ) ) ( IS-CRATE ?auto_11120 ) ( not ( = ?auto_11119 ?auto_11126 ) ) ( not ( = ?auto_11120 ?auto_11126 ) ) ( not ( = ?auto_11122 ?auto_11126 ) ) ( not ( = ?auto_11124 ?auto_11131 ) ) ( not ( = ?auto_11128 ?auto_11124 ) ) ( HOIST-AT ?auto_11125 ?auto_11124 ) ( not ( = ?auto_11127 ?auto_11125 ) ) ( not ( = ?auto_11130 ?auto_11125 ) ) ( AVAILABLE ?auto_11125 ) ( SURFACE-AT ?auto_11120 ?auto_11124 ) ( ON ?auto_11120 ?auto_11121 ) ( CLEAR ?auto_11120 ) ( not ( = ?auto_11119 ?auto_11121 ) ) ( not ( = ?auto_11120 ?auto_11121 ) ) ( not ( = ?auto_11122 ?auto_11121 ) ) ( not ( = ?auto_11126 ?auto_11121 ) ) ( TRUCK-AT ?auto_11129 ?auto_11131 ) ( SURFACE-AT ?auto_11123 ?auto_11131 ) ( CLEAR ?auto_11123 ) ( IS-CRATE ?auto_11126 ) ( not ( = ?auto_11119 ?auto_11123 ) ) ( not ( = ?auto_11120 ?auto_11123 ) ) ( not ( = ?auto_11122 ?auto_11123 ) ) ( not ( = ?auto_11126 ?auto_11123 ) ) ( not ( = ?auto_11121 ?auto_11123 ) ) ( AVAILABLE ?auto_11127 ) ( IN ?auto_11126 ?auto_11129 ) )
    :subtasks
    ( ( !UNLOAD ?auto_11127 ?auto_11126 ?auto_11129 ?auto_11131 )
      ( MAKE-ON ?auto_11119 ?auto_11120 )
      ( MAKE-ON-VERIFY ?auto_11119 ?auto_11120 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_11132 - SURFACE
      ?auto_11133 - SURFACE
    )
    :vars
    (
      ?auto_11134 - HOIST
      ?auto_11137 - PLACE
      ?auto_11136 - PLACE
      ?auto_11135 - HOIST
      ?auto_11141 - SURFACE
      ?auto_11142 - SURFACE
      ?auto_11138 - PLACE
      ?auto_11139 - HOIST
      ?auto_11144 - SURFACE
      ?auto_11140 - SURFACE
      ?auto_11143 - TRUCK
      ?auto_11145 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11134 ?auto_11137 ) ( IS-CRATE ?auto_11132 ) ( not ( = ?auto_11132 ?auto_11133 ) ) ( not ( = ?auto_11136 ?auto_11137 ) ) ( HOIST-AT ?auto_11135 ?auto_11136 ) ( not ( = ?auto_11134 ?auto_11135 ) ) ( AVAILABLE ?auto_11135 ) ( SURFACE-AT ?auto_11132 ?auto_11136 ) ( ON ?auto_11132 ?auto_11141 ) ( CLEAR ?auto_11132 ) ( not ( = ?auto_11132 ?auto_11141 ) ) ( not ( = ?auto_11133 ?auto_11141 ) ) ( IS-CRATE ?auto_11133 ) ( not ( = ?auto_11132 ?auto_11142 ) ) ( not ( = ?auto_11133 ?auto_11142 ) ) ( not ( = ?auto_11141 ?auto_11142 ) ) ( not ( = ?auto_11138 ?auto_11137 ) ) ( not ( = ?auto_11136 ?auto_11138 ) ) ( HOIST-AT ?auto_11139 ?auto_11138 ) ( not ( = ?auto_11134 ?auto_11139 ) ) ( not ( = ?auto_11135 ?auto_11139 ) ) ( AVAILABLE ?auto_11139 ) ( SURFACE-AT ?auto_11133 ?auto_11138 ) ( ON ?auto_11133 ?auto_11144 ) ( CLEAR ?auto_11133 ) ( not ( = ?auto_11132 ?auto_11144 ) ) ( not ( = ?auto_11133 ?auto_11144 ) ) ( not ( = ?auto_11141 ?auto_11144 ) ) ( not ( = ?auto_11142 ?auto_11144 ) ) ( SURFACE-AT ?auto_11140 ?auto_11137 ) ( CLEAR ?auto_11140 ) ( IS-CRATE ?auto_11142 ) ( not ( = ?auto_11132 ?auto_11140 ) ) ( not ( = ?auto_11133 ?auto_11140 ) ) ( not ( = ?auto_11141 ?auto_11140 ) ) ( not ( = ?auto_11142 ?auto_11140 ) ) ( not ( = ?auto_11144 ?auto_11140 ) ) ( AVAILABLE ?auto_11134 ) ( IN ?auto_11142 ?auto_11143 ) ( TRUCK-AT ?auto_11143 ?auto_11145 ) ( not ( = ?auto_11145 ?auto_11137 ) ) ( not ( = ?auto_11136 ?auto_11145 ) ) ( not ( = ?auto_11138 ?auto_11145 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_11143 ?auto_11145 ?auto_11137 )
      ( MAKE-ON ?auto_11132 ?auto_11133 )
      ( MAKE-ON-VERIFY ?auto_11132 ?auto_11133 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_11146 - SURFACE
      ?auto_11147 - SURFACE
    )
    :vars
    (
      ?auto_11159 - HOIST
      ?auto_11153 - PLACE
      ?auto_11151 - PLACE
      ?auto_11154 - HOIST
      ?auto_11149 - SURFACE
      ?auto_11157 - SURFACE
      ?auto_11158 - PLACE
      ?auto_11148 - HOIST
      ?auto_11152 - SURFACE
      ?auto_11155 - SURFACE
      ?auto_11150 - TRUCK
      ?auto_11156 - PLACE
      ?auto_11160 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_11159 ?auto_11153 ) ( IS-CRATE ?auto_11146 ) ( not ( = ?auto_11146 ?auto_11147 ) ) ( not ( = ?auto_11151 ?auto_11153 ) ) ( HOIST-AT ?auto_11154 ?auto_11151 ) ( not ( = ?auto_11159 ?auto_11154 ) ) ( AVAILABLE ?auto_11154 ) ( SURFACE-AT ?auto_11146 ?auto_11151 ) ( ON ?auto_11146 ?auto_11149 ) ( CLEAR ?auto_11146 ) ( not ( = ?auto_11146 ?auto_11149 ) ) ( not ( = ?auto_11147 ?auto_11149 ) ) ( IS-CRATE ?auto_11147 ) ( not ( = ?auto_11146 ?auto_11157 ) ) ( not ( = ?auto_11147 ?auto_11157 ) ) ( not ( = ?auto_11149 ?auto_11157 ) ) ( not ( = ?auto_11158 ?auto_11153 ) ) ( not ( = ?auto_11151 ?auto_11158 ) ) ( HOIST-AT ?auto_11148 ?auto_11158 ) ( not ( = ?auto_11159 ?auto_11148 ) ) ( not ( = ?auto_11154 ?auto_11148 ) ) ( AVAILABLE ?auto_11148 ) ( SURFACE-AT ?auto_11147 ?auto_11158 ) ( ON ?auto_11147 ?auto_11152 ) ( CLEAR ?auto_11147 ) ( not ( = ?auto_11146 ?auto_11152 ) ) ( not ( = ?auto_11147 ?auto_11152 ) ) ( not ( = ?auto_11149 ?auto_11152 ) ) ( not ( = ?auto_11157 ?auto_11152 ) ) ( SURFACE-AT ?auto_11155 ?auto_11153 ) ( CLEAR ?auto_11155 ) ( IS-CRATE ?auto_11157 ) ( not ( = ?auto_11146 ?auto_11155 ) ) ( not ( = ?auto_11147 ?auto_11155 ) ) ( not ( = ?auto_11149 ?auto_11155 ) ) ( not ( = ?auto_11157 ?auto_11155 ) ) ( not ( = ?auto_11152 ?auto_11155 ) ) ( AVAILABLE ?auto_11159 ) ( TRUCK-AT ?auto_11150 ?auto_11156 ) ( not ( = ?auto_11156 ?auto_11153 ) ) ( not ( = ?auto_11151 ?auto_11156 ) ) ( not ( = ?auto_11158 ?auto_11156 ) ) ( HOIST-AT ?auto_11160 ?auto_11156 ) ( LIFTING ?auto_11160 ?auto_11157 ) ( not ( = ?auto_11159 ?auto_11160 ) ) ( not ( = ?auto_11154 ?auto_11160 ) ) ( not ( = ?auto_11148 ?auto_11160 ) ) )
    :subtasks
    ( ( !LOAD ?auto_11160 ?auto_11157 ?auto_11150 ?auto_11156 )
      ( MAKE-ON ?auto_11146 ?auto_11147 )
      ( MAKE-ON-VERIFY ?auto_11146 ?auto_11147 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_11161 - SURFACE
      ?auto_11162 - SURFACE
    )
    :vars
    (
      ?auto_11169 - HOIST
      ?auto_11175 - PLACE
      ?auto_11164 - PLACE
      ?auto_11173 - HOIST
      ?auto_11166 - SURFACE
      ?auto_11170 - SURFACE
      ?auto_11163 - PLACE
      ?auto_11168 - HOIST
      ?auto_11165 - SURFACE
      ?auto_11167 - SURFACE
      ?auto_11171 - TRUCK
      ?auto_11174 - PLACE
      ?auto_11172 - HOIST
      ?auto_11176 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11169 ?auto_11175 ) ( IS-CRATE ?auto_11161 ) ( not ( = ?auto_11161 ?auto_11162 ) ) ( not ( = ?auto_11164 ?auto_11175 ) ) ( HOIST-AT ?auto_11173 ?auto_11164 ) ( not ( = ?auto_11169 ?auto_11173 ) ) ( AVAILABLE ?auto_11173 ) ( SURFACE-AT ?auto_11161 ?auto_11164 ) ( ON ?auto_11161 ?auto_11166 ) ( CLEAR ?auto_11161 ) ( not ( = ?auto_11161 ?auto_11166 ) ) ( not ( = ?auto_11162 ?auto_11166 ) ) ( IS-CRATE ?auto_11162 ) ( not ( = ?auto_11161 ?auto_11170 ) ) ( not ( = ?auto_11162 ?auto_11170 ) ) ( not ( = ?auto_11166 ?auto_11170 ) ) ( not ( = ?auto_11163 ?auto_11175 ) ) ( not ( = ?auto_11164 ?auto_11163 ) ) ( HOIST-AT ?auto_11168 ?auto_11163 ) ( not ( = ?auto_11169 ?auto_11168 ) ) ( not ( = ?auto_11173 ?auto_11168 ) ) ( AVAILABLE ?auto_11168 ) ( SURFACE-AT ?auto_11162 ?auto_11163 ) ( ON ?auto_11162 ?auto_11165 ) ( CLEAR ?auto_11162 ) ( not ( = ?auto_11161 ?auto_11165 ) ) ( not ( = ?auto_11162 ?auto_11165 ) ) ( not ( = ?auto_11166 ?auto_11165 ) ) ( not ( = ?auto_11170 ?auto_11165 ) ) ( SURFACE-AT ?auto_11167 ?auto_11175 ) ( CLEAR ?auto_11167 ) ( IS-CRATE ?auto_11170 ) ( not ( = ?auto_11161 ?auto_11167 ) ) ( not ( = ?auto_11162 ?auto_11167 ) ) ( not ( = ?auto_11166 ?auto_11167 ) ) ( not ( = ?auto_11170 ?auto_11167 ) ) ( not ( = ?auto_11165 ?auto_11167 ) ) ( AVAILABLE ?auto_11169 ) ( TRUCK-AT ?auto_11171 ?auto_11174 ) ( not ( = ?auto_11174 ?auto_11175 ) ) ( not ( = ?auto_11164 ?auto_11174 ) ) ( not ( = ?auto_11163 ?auto_11174 ) ) ( HOIST-AT ?auto_11172 ?auto_11174 ) ( not ( = ?auto_11169 ?auto_11172 ) ) ( not ( = ?auto_11173 ?auto_11172 ) ) ( not ( = ?auto_11168 ?auto_11172 ) ) ( AVAILABLE ?auto_11172 ) ( SURFACE-AT ?auto_11170 ?auto_11174 ) ( ON ?auto_11170 ?auto_11176 ) ( CLEAR ?auto_11170 ) ( not ( = ?auto_11161 ?auto_11176 ) ) ( not ( = ?auto_11162 ?auto_11176 ) ) ( not ( = ?auto_11166 ?auto_11176 ) ) ( not ( = ?auto_11170 ?auto_11176 ) ) ( not ( = ?auto_11165 ?auto_11176 ) ) ( not ( = ?auto_11167 ?auto_11176 ) ) )
    :subtasks
    ( ( !LIFT ?auto_11172 ?auto_11170 ?auto_11176 ?auto_11174 )
      ( MAKE-ON ?auto_11161 ?auto_11162 )
      ( MAKE-ON-VERIFY ?auto_11161 ?auto_11162 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_11177 - SURFACE
      ?auto_11178 - SURFACE
    )
    :vars
    (
      ?auto_11191 - HOIST
      ?auto_11190 - PLACE
      ?auto_11183 - PLACE
      ?auto_11186 - HOIST
      ?auto_11187 - SURFACE
      ?auto_11192 - SURFACE
      ?auto_11180 - PLACE
      ?auto_11184 - HOIST
      ?auto_11188 - SURFACE
      ?auto_11179 - SURFACE
      ?auto_11185 - PLACE
      ?auto_11189 - HOIST
      ?auto_11182 - SURFACE
      ?auto_11181 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11191 ?auto_11190 ) ( IS-CRATE ?auto_11177 ) ( not ( = ?auto_11177 ?auto_11178 ) ) ( not ( = ?auto_11183 ?auto_11190 ) ) ( HOIST-AT ?auto_11186 ?auto_11183 ) ( not ( = ?auto_11191 ?auto_11186 ) ) ( AVAILABLE ?auto_11186 ) ( SURFACE-AT ?auto_11177 ?auto_11183 ) ( ON ?auto_11177 ?auto_11187 ) ( CLEAR ?auto_11177 ) ( not ( = ?auto_11177 ?auto_11187 ) ) ( not ( = ?auto_11178 ?auto_11187 ) ) ( IS-CRATE ?auto_11178 ) ( not ( = ?auto_11177 ?auto_11192 ) ) ( not ( = ?auto_11178 ?auto_11192 ) ) ( not ( = ?auto_11187 ?auto_11192 ) ) ( not ( = ?auto_11180 ?auto_11190 ) ) ( not ( = ?auto_11183 ?auto_11180 ) ) ( HOIST-AT ?auto_11184 ?auto_11180 ) ( not ( = ?auto_11191 ?auto_11184 ) ) ( not ( = ?auto_11186 ?auto_11184 ) ) ( AVAILABLE ?auto_11184 ) ( SURFACE-AT ?auto_11178 ?auto_11180 ) ( ON ?auto_11178 ?auto_11188 ) ( CLEAR ?auto_11178 ) ( not ( = ?auto_11177 ?auto_11188 ) ) ( not ( = ?auto_11178 ?auto_11188 ) ) ( not ( = ?auto_11187 ?auto_11188 ) ) ( not ( = ?auto_11192 ?auto_11188 ) ) ( SURFACE-AT ?auto_11179 ?auto_11190 ) ( CLEAR ?auto_11179 ) ( IS-CRATE ?auto_11192 ) ( not ( = ?auto_11177 ?auto_11179 ) ) ( not ( = ?auto_11178 ?auto_11179 ) ) ( not ( = ?auto_11187 ?auto_11179 ) ) ( not ( = ?auto_11192 ?auto_11179 ) ) ( not ( = ?auto_11188 ?auto_11179 ) ) ( AVAILABLE ?auto_11191 ) ( not ( = ?auto_11185 ?auto_11190 ) ) ( not ( = ?auto_11183 ?auto_11185 ) ) ( not ( = ?auto_11180 ?auto_11185 ) ) ( HOIST-AT ?auto_11189 ?auto_11185 ) ( not ( = ?auto_11191 ?auto_11189 ) ) ( not ( = ?auto_11186 ?auto_11189 ) ) ( not ( = ?auto_11184 ?auto_11189 ) ) ( AVAILABLE ?auto_11189 ) ( SURFACE-AT ?auto_11192 ?auto_11185 ) ( ON ?auto_11192 ?auto_11182 ) ( CLEAR ?auto_11192 ) ( not ( = ?auto_11177 ?auto_11182 ) ) ( not ( = ?auto_11178 ?auto_11182 ) ) ( not ( = ?auto_11187 ?auto_11182 ) ) ( not ( = ?auto_11192 ?auto_11182 ) ) ( not ( = ?auto_11188 ?auto_11182 ) ) ( not ( = ?auto_11179 ?auto_11182 ) ) ( TRUCK-AT ?auto_11181 ?auto_11190 ) )
    :subtasks
    ( ( !DRIVE ?auto_11181 ?auto_11190 ?auto_11185 )
      ( MAKE-ON ?auto_11177 ?auto_11178 )
      ( MAKE-ON-VERIFY ?auto_11177 ?auto_11178 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_11193 - SURFACE
      ?auto_11194 - SURFACE
    )
    :vars
    (
      ?auto_11204 - HOIST
      ?auto_11197 - PLACE
      ?auto_11205 - PLACE
      ?auto_11198 - HOIST
      ?auto_11196 - SURFACE
      ?auto_11202 - SURFACE
      ?auto_11195 - PLACE
      ?auto_11207 - HOIST
      ?auto_11206 - SURFACE
      ?auto_11203 - SURFACE
      ?auto_11199 - PLACE
      ?auto_11208 - HOIST
      ?auto_11201 - SURFACE
      ?auto_11200 - TRUCK
      ?auto_11209 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11204 ?auto_11197 ) ( IS-CRATE ?auto_11193 ) ( not ( = ?auto_11193 ?auto_11194 ) ) ( not ( = ?auto_11205 ?auto_11197 ) ) ( HOIST-AT ?auto_11198 ?auto_11205 ) ( not ( = ?auto_11204 ?auto_11198 ) ) ( AVAILABLE ?auto_11198 ) ( SURFACE-AT ?auto_11193 ?auto_11205 ) ( ON ?auto_11193 ?auto_11196 ) ( CLEAR ?auto_11193 ) ( not ( = ?auto_11193 ?auto_11196 ) ) ( not ( = ?auto_11194 ?auto_11196 ) ) ( IS-CRATE ?auto_11194 ) ( not ( = ?auto_11193 ?auto_11202 ) ) ( not ( = ?auto_11194 ?auto_11202 ) ) ( not ( = ?auto_11196 ?auto_11202 ) ) ( not ( = ?auto_11195 ?auto_11197 ) ) ( not ( = ?auto_11205 ?auto_11195 ) ) ( HOIST-AT ?auto_11207 ?auto_11195 ) ( not ( = ?auto_11204 ?auto_11207 ) ) ( not ( = ?auto_11198 ?auto_11207 ) ) ( AVAILABLE ?auto_11207 ) ( SURFACE-AT ?auto_11194 ?auto_11195 ) ( ON ?auto_11194 ?auto_11206 ) ( CLEAR ?auto_11194 ) ( not ( = ?auto_11193 ?auto_11206 ) ) ( not ( = ?auto_11194 ?auto_11206 ) ) ( not ( = ?auto_11196 ?auto_11206 ) ) ( not ( = ?auto_11202 ?auto_11206 ) ) ( IS-CRATE ?auto_11202 ) ( not ( = ?auto_11193 ?auto_11203 ) ) ( not ( = ?auto_11194 ?auto_11203 ) ) ( not ( = ?auto_11196 ?auto_11203 ) ) ( not ( = ?auto_11202 ?auto_11203 ) ) ( not ( = ?auto_11206 ?auto_11203 ) ) ( not ( = ?auto_11199 ?auto_11197 ) ) ( not ( = ?auto_11205 ?auto_11199 ) ) ( not ( = ?auto_11195 ?auto_11199 ) ) ( HOIST-AT ?auto_11208 ?auto_11199 ) ( not ( = ?auto_11204 ?auto_11208 ) ) ( not ( = ?auto_11198 ?auto_11208 ) ) ( not ( = ?auto_11207 ?auto_11208 ) ) ( AVAILABLE ?auto_11208 ) ( SURFACE-AT ?auto_11202 ?auto_11199 ) ( ON ?auto_11202 ?auto_11201 ) ( CLEAR ?auto_11202 ) ( not ( = ?auto_11193 ?auto_11201 ) ) ( not ( = ?auto_11194 ?auto_11201 ) ) ( not ( = ?auto_11196 ?auto_11201 ) ) ( not ( = ?auto_11202 ?auto_11201 ) ) ( not ( = ?auto_11206 ?auto_11201 ) ) ( not ( = ?auto_11203 ?auto_11201 ) ) ( TRUCK-AT ?auto_11200 ?auto_11197 ) ( SURFACE-AT ?auto_11209 ?auto_11197 ) ( CLEAR ?auto_11209 ) ( LIFTING ?auto_11204 ?auto_11203 ) ( IS-CRATE ?auto_11203 ) ( not ( = ?auto_11193 ?auto_11209 ) ) ( not ( = ?auto_11194 ?auto_11209 ) ) ( not ( = ?auto_11196 ?auto_11209 ) ) ( not ( = ?auto_11202 ?auto_11209 ) ) ( not ( = ?auto_11206 ?auto_11209 ) ) ( not ( = ?auto_11203 ?auto_11209 ) ) ( not ( = ?auto_11201 ?auto_11209 ) ) )
    :subtasks
    ( ( !DROP ?auto_11204 ?auto_11203 ?auto_11209 ?auto_11197 )
      ( MAKE-ON ?auto_11193 ?auto_11194 )
      ( MAKE-ON-VERIFY ?auto_11193 ?auto_11194 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_11210 - SURFACE
      ?auto_11211 - SURFACE
    )
    :vars
    (
      ?auto_11214 - HOIST
      ?auto_11212 - PLACE
      ?auto_11218 - PLACE
      ?auto_11225 - HOIST
      ?auto_11224 - SURFACE
      ?auto_11220 - SURFACE
      ?auto_11213 - PLACE
      ?auto_11226 - HOIST
      ?auto_11222 - SURFACE
      ?auto_11221 - SURFACE
      ?auto_11215 - PLACE
      ?auto_11223 - HOIST
      ?auto_11217 - SURFACE
      ?auto_11219 - TRUCK
      ?auto_11216 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11214 ?auto_11212 ) ( IS-CRATE ?auto_11210 ) ( not ( = ?auto_11210 ?auto_11211 ) ) ( not ( = ?auto_11218 ?auto_11212 ) ) ( HOIST-AT ?auto_11225 ?auto_11218 ) ( not ( = ?auto_11214 ?auto_11225 ) ) ( AVAILABLE ?auto_11225 ) ( SURFACE-AT ?auto_11210 ?auto_11218 ) ( ON ?auto_11210 ?auto_11224 ) ( CLEAR ?auto_11210 ) ( not ( = ?auto_11210 ?auto_11224 ) ) ( not ( = ?auto_11211 ?auto_11224 ) ) ( IS-CRATE ?auto_11211 ) ( not ( = ?auto_11210 ?auto_11220 ) ) ( not ( = ?auto_11211 ?auto_11220 ) ) ( not ( = ?auto_11224 ?auto_11220 ) ) ( not ( = ?auto_11213 ?auto_11212 ) ) ( not ( = ?auto_11218 ?auto_11213 ) ) ( HOIST-AT ?auto_11226 ?auto_11213 ) ( not ( = ?auto_11214 ?auto_11226 ) ) ( not ( = ?auto_11225 ?auto_11226 ) ) ( AVAILABLE ?auto_11226 ) ( SURFACE-AT ?auto_11211 ?auto_11213 ) ( ON ?auto_11211 ?auto_11222 ) ( CLEAR ?auto_11211 ) ( not ( = ?auto_11210 ?auto_11222 ) ) ( not ( = ?auto_11211 ?auto_11222 ) ) ( not ( = ?auto_11224 ?auto_11222 ) ) ( not ( = ?auto_11220 ?auto_11222 ) ) ( IS-CRATE ?auto_11220 ) ( not ( = ?auto_11210 ?auto_11221 ) ) ( not ( = ?auto_11211 ?auto_11221 ) ) ( not ( = ?auto_11224 ?auto_11221 ) ) ( not ( = ?auto_11220 ?auto_11221 ) ) ( not ( = ?auto_11222 ?auto_11221 ) ) ( not ( = ?auto_11215 ?auto_11212 ) ) ( not ( = ?auto_11218 ?auto_11215 ) ) ( not ( = ?auto_11213 ?auto_11215 ) ) ( HOIST-AT ?auto_11223 ?auto_11215 ) ( not ( = ?auto_11214 ?auto_11223 ) ) ( not ( = ?auto_11225 ?auto_11223 ) ) ( not ( = ?auto_11226 ?auto_11223 ) ) ( AVAILABLE ?auto_11223 ) ( SURFACE-AT ?auto_11220 ?auto_11215 ) ( ON ?auto_11220 ?auto_11217 ) ( CLEAR ?auto_11220 ) ( not ( = ?auto_11210 ?auto_11217 ) ) ( not ( = ?auto_11211 ?auto_11217 ) ) ( not ( = ?auto_11224 ?auto_11217 ) ) ( not ( = ?auto_11220 ?auto_11217 ) ) ( not ( = ?auto_11222 ?auto_11217 ) ) ( not ( = ?auto_11221 ?auto_11217 ) ) ( TRUCK-AT ?auto_11219 ?auto_11212 ) ( SURFACE-AT ?auto_11216 ?auto_11212 ) ( CLEAR ?auto_11216 ) ( IS-CRATE ?auto_11221 ) ( not ( = ?auto_11210 ?auto_11216 ) ) ( not ( = ?auto_11211 ?auto_11216 ) ) ( not ( = ?auto_11224 ?auto_11216 ) ) ( not ( = ?auto_11220 ?auto_11216 ) ) ( not ( = ?auto_11222 ?auto_11216 ) ) ( not ( = ?auto_11221 ?auto_11216 ) ) ( not ( = ?auto_11217 ?auto_11216 ) ) ( AVAILABLE ?auto_11214 ) ( IN ?auto_11221 ?auto_11219 ) )
    :subtasks
    ( ( !UNLOAD ?auto_11214 ?auto_11221 ?auto_11219 ?auto_11212 )
      ( MAKE-ON ?auto_11210 ?auto_11211 )
      ( MAKE-ON-VERIFY ?auto_11210 ?auto_11211 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_11227 - SURFACE
      ?auto_11228 - SURFACE
    )
    :vars
    (
      ?auto_11240 - HOIST
      ?auto_11236 - PLACE
      ?auto_11242 - PLACE
      ?auto_11233 - HOIST
      ?auto_11230 - SURFACE
      ?auto_11243 - SURFACE
      ?auto_11229 - PLACE
      ?auto_11239 - HOIST
      ?auto_11234 - SURFACE
      ?auto_11231 - SURFACE
      ?auto_11237 - PLACE
      ?auto_11238 - HOIST
      ?auto_11241 - SURFACE
      ?auto_11235 - SURFACE
      ?auto_11232 - TRUCK
      ?auto_11244 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11240 ?auto_11236 ) ( IS-CRATE ?auto_11227 ) ( not ( = ?auto_11227 ?auto_11228 ) ) ( not ( = ?auto_11242 ?auto_11236 ) ) ( HOIST-AT ?auto_11233 ?auto_11242 ) ( not ( = ?auto_11240 ?auto_11233 ) ) ( AVAILABLE ?auto_11233 ) ( SURFACE-AT ?auto_11227 ?auto_11242 ) ( ON ?auto_11227 ?auto_11230 ) ( CLEAR ?auto_11227 ) ( not ( = ?auto_11227 ?auto_11230 ) ) ( not ( = ?auto_11228 ?auto_11230 ) ) ( IS-CRATE ?auto_11228 ) ( not ( = ?auto_11227 ?auto_11243 ) ) ( not ( = ?auto_11228 ?auto_11243 ) ) ( not ( = ?auto_11230 ?auto_11243 ) ) ( not ( = ?auto_11229 ?auto_11236 ) ) ( not ( = ?auto_11242 ?auto_11229 ) ) ( HOIST-AT ?auto_11239 ?auto_11229 ) ( not ( = ?auto_11240 ?auto_11239 ) ) ( not ( = ?auto_11233 ?auto_11239 ) ) ( AVAILABLE ?auto_11239 ) ( SURFACE-AT ?auto_11228 ?auto_11229 ) ( ON ?auto_11228 ?auto_11234 ) ( CLEAR ?auto_11228 ) ( not ( = ?auto_11227 ?auto_11234 ) ) ( not ( = ?auto_11228 ?auto_11234 ) ) ( not ( = ?auto_11230 ?auto_11234 ) ) ( not ( = ?auto_11243 ?auto_11234 ) ) ( IS-CRATE ?auto_11243 ) ( not ( = ?auto_11227 ?auto_11231 ) ) ( not ( = ?auto_11228 ?auto_11231 ) ) ( not ( = ?auto_11230 ?auto_11231 ) ) ( not ( = ?auto_11243 ?auto_11231 ) ) ( not ( = ?auto_11234 ?auto_11231 ) ) ( not ( = ?auto_11237 ?auto_11236 ) ) ( not ( = ?auto_11242 ?auto_11237 ) ) ( not ( = ?auto_11229 ?auto_11237 ) ) ( HOIST-AT ?auto_11238 ?auto_11237 ) ( not ( = ?auto_11240 ?auto_11238 ) ) ( not ( = ?auto_11233 ?auto_11238 ) ) ( not ( = ?auto_11239 ?auto_11238 ) ) ( AVAILABLE ?auto_11238 ) ( SURFACE-AT ?auto_11243 ?auto_11237 ) ( ON ?auto_11243 ?auto_11241 ) ( CLEAR ?auto_11243 ) ( not ( = ?auto_11227 ?auto_11241 ) ) ( not ( = ?auto_11228 ?auto_11241 ) ) ( not ( = ?auto_11230 ?auto_11241 ) ) ( not ( = ?auto_11243 ?auto_11241 ) ) ( not ( = ?auto_11234 ?auto_11241 ) ) ( not ( = ?auto_11231 ?auto_11241 ) ) ( SURFACE-AT ?auto_11235 ?auto_11236 ) ( CLEAR ?auto_11235 ) ( IS-CRATE ?auto_11231 ) ( not ( = ?auto_11227 ?auto_11235 ) ) ( not ( = ?auto_11228 ?auto_11235 ) ) ( not ( = ?auto_11230 ?auto_11235 ) ) ( not ( = ?auto_11243 ?auto_11235 ) ) ( not ( = ?auto_11234 ?auto_11235 ) ) ( not ( = ?auto_11231 ?auto_11235 ) ) ( not ( = ?auto_11241 ?auto_11235 ) ) ( AVAILABLE ?auto_11240 ) ( IN ?auto_11231 ?auto_11232 ) ( TRUCK-AT ?auto_11232 ?auto_11244 ) ( not ( = ?auto_11244 ?auto_11236 ) ) ( not ( = ?auto_11242 ?auto_11244 ) ) ( not ( = ?auto_11229 ?auto_11244 ) ) ( not ( = ?auto_11237 ?auto_11244 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_11232 ?auto_11244 ?auto_11236 )
      ( MAKE-ON ?auto_11227 ?auto_11228 )
      ( MAKE-ON-VERIFY ?auto_11227 ?auto_11228 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_11245 - SURFACE
      ?auto_11246 - SURFACE
    )
    :vars
    (
      ?auto_11247 - HOIST
      ?auto_11255 - PLACE
      ?auto_11254 - PLACE
      ?auto_11249 - HOIST
      ?auto_11257 - SURFACE
      ?auto_11253 - SURFACE
      ?auto_11251 - PLACE
      ?auto_11259 - HOIST
      ?auto_11256 - SURFACE
      ?auto_11258 - SURFACE
      ?auto_11248 - PLACE
      ?auto_11250 - HOIST
      ?auto_11262 - SURFACE
      ?auto_11261 - SURFACE
      ?auto_11260 - TRUCK
      ?auto_11252 - PLACE
      ?auto_11263 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_11247 ?auto_11255 ) ( IS-CRATE ?auto_11245 ) ( not ( = ?auto_11245 ?auto_11246 ) ) ( not ( = ?auto_11254 ?auto_11255 ) ) ( HOIST-AT ?auto_11249 ?auto_11254 ) ( not ( = ?auto_11247 ?auto_11249 ) ) ( AVAILABLE ?auto_11249 ) ( SURFACE-AT ?auto_11245 ?auto_11254 ) ( ON ?auto_11245 ?auto_11257 ) ( CLEAR ?auto_11245 ) ( not ( = ?auto_11245 ?auto_11257 ) ) ( not ( = ?auto_11246 ?auto_11257 ) ) ( IS-CRATE ?auto_11246 ) ( not ( = ?auto_11245 ?auto_11253 ) ) ( not ( = ?auto_11246 ?auto_11253 ) ) ( not ( = ?auto_11257 ?auto_11253 ) ) ( not ( = ?auto_11251 ?auto_11255 ) ) ( not ( = ?auto_11254 ?auto_11251 ) ) ( HOIST-AT ?auto_11259 ?auto_11251 ) ( not ( = ?auto_11247 ?auto_11259 ) ) ( not ( = ?auto_11249 ?auto_11259 ) ) ( AVAILABLE ?auto_11259 ) ( SURFACE-AT ?auto_11246 ?auto_11251 ) ( ON ?auto_11246 ?auto_11256 ) ( CLEAR ?auto_11246 ) ( not ( = ?auto_11245 ?auto_11256 ) ) ( not ( = ?auto_11246 ?auto_11256 ) ) ( not ( = ?auto_11257 ?auto_11256 ) ) ( not ( = ?auto_11253 ?auto_11256 ) ) ( IS-CRATE ?auto_11253 ) ( not ( = ?auto_11245 ?auto_11258 ) ) ( not ( = ?auto_11246 ?auto_11258 ) ) ( not ( = ?auto_11257 ?auto_11258 ) ) ( not ( = ?auto_11253 ?auto_11258 ) ) ( not ( = ?auto_11256 ?auto_11258 ) ) ( not ( = ?auto_11248 ?auto_11255 ) ) ( not ( = ?auto_11254 ?auto_11248 ) ) ( not ( = ?auto_11251 ?auto_11248 ) ) ( HOIST-AT ?auto_11250 ?auto_11248 ) ( not ( = ?auto_11247 ?auto_11250 ) ) ( not ( = ?auto_11249 ?auto_11250 ) ) ( not ( = ?auto_11259 ?auto_11250 ) ) ( AVAILABLE ?auto_11250 ) ( SURFACE-AT ?auto_11253 ?auto_11248 ) ( ON ?auto_11253 ?auto_11262 ) ( CLEAR ?auto_11253 ) ( not ( = ?auto_11245 ?auto_11262 ) ) ( not ( = ?auto_11246 ?auto_11262 ) ) ( not ( = ?auto_11257 ?auto_11262 ) ) ( not ( = ?auto_11253 ?auto_11262 ) ) ( not ( = ?auto_11256 ?auto_11262 ) ) ( not ( = ?auto_11258 ?auto_11262 ) ) ( SURFACE-AT ?auto_11261 ?auto_11255 ) ( CLEAR ?auto_11261 ) ( IS-CRATE ?auto_11258 ) ( not ( = ?auto_11245 ?auto_11261 ) ) ( not ( = ?auto_11246 ?auto_11261 ) ) ( not ( = ?auto_11257 ?auto_11261 ) ) ( not ( = ?auto_11253 ?auto_11261 ) ) ( not ( = ?auto_11256 ?auto_11261 ) ) ( not ( = ?auto_11258 ?auto_11261 ) ) ( not ( = ?auto_11262 ?auto_11261 ) ) ( AVAILABLE ?auto_11247 ) ( TRUCK-AT ?auto_11260 ?auto_11252 ) ( not ( = ?auto_11252 ?auto_11255 ) ) ( not ( = ?auto_11254 ?auto_11252 ) ) ( not ( = ?auto_11251 ?auto_11252 ) ) ( not ( = ?auto_11248 ?auto_11252 ) ) ( HOIST-AT ?auto_11263 ?auto_11252 ) ( LIFTING ?auto_11263 ?auto_11258 ) ( not ( = ?auto_11247 ?auto_11263 ) ) ( not ( = ?auto_11249 ?auto_11263 ) ) ( not ( = ?auto_11259 ?auto_11263 ) ) ( not ( = ?auto_11250 ?auto_11263 ) ) )
    :subtasks
    ( ( !LOAD ?auto_11263 ?auto_11258 ?auto_11260 ?auto_11252 )
      ( MAKE-ON ?auto_11245 ?auto_11246 )
      ( MAKE-ON-VERIFY ?auto_11245 ?auto_11246 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_11264 - SURFACE
      ?auto_11265 - SURFACE
    )
    :vars
    (
      ?auto_11275 - HOIST
      ?auto_11279 - PLACE
      ?auto_11272 - PLACE
      ?auto_11271 - HOIST
      ?auto_11278 - SURFACE
      ?auto_11267 - SURFACE
      ?auto_11277 - PLACE
      ?auto_11282 - HOIST
      ?auto_11270 - SURFACE
      ?auto_11269 - SURFACE
      ?auto_11273 - PLACE
      ?auto_11281 - HOIST
      ?auto_11268 - SURFACE
      ?auto_11276 - SURFACE
      ?auto_11280 - TRUCK
      ?auto_11266 - PLACE
      ?auto_11274 - HOIST
      ?auto_11283 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11275 ?auto_11279 ) ( IS-CRATE ?auto_11264 ) ( not ( = ?auto_11264 ?auto_11265 ) ) ( not ( = ?auto_11272 ?auto_11279 ) ) ( HOIST-AT ?auto_11271 ?auto_11272 ) ( not ( = ?auto_11275 ?auto_11271 ) ) ( AVAILABLE ?auto_11271 ) ( SURFACE-AT ?auto_11264 ?auto_11272 ) ( ON ?auto_11264 ?auto_11278 ) ( CLEAR ?auto_11264 ) ( not ( = ?auto_11264 ?auto_11278 ) ) ( not ( = ?auto_11265 ?auto_11278 ) ) ( IS-CRATE ?auto_11265 ) ( not ( = ?auto_11264 ?auto_11267 ) ) ( not ( = ?auto_11265 ?auto_11267 ) ) ( not ( = ?auto_11278 ?auto_11267 ) ) ( not ( = ?auto_11277 ?auto_11279 ) ) ( not ( = ?auto_11272 ?auto_11277 ) ) ( HOIST-AT ?auto_11282 ?auto_11277 ) ( not ( = ?auto_11275 ?auto_11282 ) ) ( not ( = ?auto_11271 ?auto_11282 ) ) ( AVAILABLE ?auto_11282 ) ( SURFACE-AT ?auto_11265 ?auto_11277 ) ( ON ?auto_11265 ?auto_11270 ) ( CLEAR ?auto_11265 ) ( not ( = ?auto_11264 ?auto_11270 ) ) ( not ( = ?auto_11265 ?auto_11270 ) ) ( not ( = ?auto_11278 ?auto_11270 ) ) ( not ( = ?auto_11267 ?auto_11270 ) ) ( IS-CRATE ?auto_11267 ) ( not ( = ?auto_11264 ?auto_11269 ) ) ( not ( = ?auto_11265 ?auto_11269 ) ) ( not ( = ?auto_11278 ?auto_11269 ) ) ( not ( = ?auto_11267 ?auto_11269 ) ) ( not ( = ?auto_11270 ?auto_11269 ) ) ( not ( = ?auto_11273 ?auto_11279 ) ) ( not ( = ?auto_11272 ?auto_11273 ) ) ( not ( = ?auto_11277 ?auto_11273 ) ) ( HOIST-AT ?auto_11281 ?auto_11273 ) ( not ( = ?auto_11275 ?auto_11281 ) ) ( not ( = ?auto_11271 ?auto_11281 ) ) ( not ( = ?auto_11282 ?auto_11281 ) ) ( AVAILABLE ?auto_11281 ) ( SURFACE-AT ?auto_11267 ?auto_11273 ) ( ON ?auto_11267 ?auto_11268 ) ( CLEAR ?auto_11267 ) ( not ( = ?auto_11264 ?auto_11268 ) ) ( not ( = ?auto_11265 ?auto_11268 ) ) ( not ( = ?auto_11278 ?auto_11268 ) ) ( not ( = ?auto_11267 ?auto_11268 ) ) ( not ( = ?auto_11270 ?auto_11268 ) ) ( not ( = ?auto_11269 ?auto_11268 ) ) ( SURFACE-AT ?auto_11276 ?auto_11279 ) ( CLEAR ?auto_11276 ) ( IS-CRATE ?auto_11269 ) ( not ( = ?auto_11264 ?auto_11276 ) ) ( not ( = ?auto_11265 ?auto_11276 ) ) ( not ( = ?auto_11278 ?auto_11276 ) ) ( not ( = ?auto_11267 ?auto_11276 ) ) ( not ( = ?auto_11270 ?auto_11276 ) ) ( not ( = ?auto_11269 ?auto_11276 ) ) ( not ( = ?auto_11268 ?auto_11276 ) ) ( AVAILABLE ?auto_11275 ) ( TRUCK-AT ?auto_11280 ?auto_11266 ) ( not ( = ?auto_11266 ?auto_11279 ) ) ( not ( = ?auto_11272 ?auto_11266 ) ) ( not ( = ?auto_11277 ?auto_11266 ) ) ( not ( = ?auto_11273 ?auto_11266 ) ) ( HOIST-AT ?auto_11274 ?auto_11266 ) ( not ( = ?auto_11275 ?auto_11274 ) ) ( not ( = ?auto_11271 ?auto_11274 ) ) ( not ( = ?auto_11282 ?auto_11274 ) ) ( not ( = ?auto_11281 ?auto_11274 ) ) ( AVAILABLE ?auto_11274 ) ( SURFACE-AT ?auto_11269 ?auto_11266 ) ( ON ?auto_11269 ?auto_11283 ) ( CLEAR ?auto_11269 ) ( not ( = ?auto_11264 ?auto_11283 ) ) ( not ( = ?auto_11265 ?auto_11283 ) ) ( not ( = ?auto_11278 ?auto_11283 ) ) ( not ( = ?auto_11267 ?auto_11283 ) ) ( not ( = ?auto_11270 ?auto_11283 ) ) ( not ( = ?auto_11269 ?auto_11283 ) ) ( not ( = ?auto_11268 ?auto_11283 ) ) ( not ( = ?auto_11276 ?auto_11283 ) ) )
    :subtasks
    ( ( !LIFT ?auto_11274 ?auto_11269 ?auto_11283 ?auto_11266 )
      ( MAKE-ON ?auto_11264 ?auto_11265 )
      ( MAKE-ON-VERIFY ?auto_11264 ?auto_11265 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_11284 - SURFACE
      ?auto_11285 - SURFACE
    )
    :vars
    (
      ?auto_11302 - HOIST
      ?auto_11288 - PLACE
      ?auto_11301 - PLACE
      ?auto_11287 - HOIST
      ?auto_11297 - SURFACE
      ?auto_11293 - SURFACE
      ?auto_11299 - PLACE
      ?auto_11291 - HOIST
      ?auto_11290 - SURFACE
      ?auto_11286 - SURFACE
      ?auto_11294 - PLACE
      ?auto_11295 - HOIST
      ?auto_11292 - SURFACE
      ?auto_11298 - SURFACE
      ?auto_11296 - PLACE
      ?auto_11289 - HOIST
      ?auto_11303 - SURFACE
      ?auto_11300 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11302 ?auto_11288 ) ( IS-CRATE ?auto_11284 ) ( not ( = ?auto_11284 ?auto_11285 ) ) ( not ( = ?auto_11301 ?auto_11288 ) ) ( HOIST-AT ?auto_11287 ?auto_11301 ) ( not ( = ?auto_11302 ?auto_11287 ) ) ( AVAILABLE ?auto_11287 ) ( SURFACE-AT ?auto_11284 ?auto_11301 ) ( ON ?auto_11284 ?auto_11297 ) ( CLEAR ?auto_11284 ) ( not ( = ?auto_11284 ?auto_11297 ) ) ( not ( = ?auto_11285 ?auto_11297 ) ) ( IS-CRATE ?auto_11285 ) ( not ( = ?auto_11284 ?auto_11293 ) ) ( not ( = ?auto_11285 ?auto_11293 ) ) ( not ( = ?auto_11297 ?auto_11293 ) ) ( not ( = ?auto_11299 ?auto_11288 ) ) ( not ( = ?auto_11301 ?auto_11299 ) ) ( HOIST-AT ?auto_11291 ?auto_11299 ) ( not ( = ?auto_11302 ?auto_11291 ) ) ( not ( = ?auto_11287 ?auto_11291 ) ) ( AVAILABLE ?auto_11291 ) ( SURFACE-AT ?auto_11285 ?auto_11299 ) ( ON ?auto_11285 ?auto_11290 ) ( CLEAR ?auto_11285 ) ( not ( = ?auto_11284 ?auto_11290 ) ) ( not ( = ?auto_11285 ?auto_11290 ) ) ( not ( = ?auto_11297 ?auto_11290 ) ) ( not ( = ?auto_11293 ?auto_11290 ) ) ( IS-CRATE ?auto_11293 ) ( not ( = ?auto_11284 ?auto_11286 ) ) ( not ( = ?auto_11285 ?auto_11286 ) ) ( not ( = ?auto_11297 ?auto_11286 ) ) ( not ( = ?auto_11293 ?auto_11286 ) ) ( not ( = ?auto_11290 ?auto_11286 ) ) ( not ( = ?auto_11294 ?auto_11288 ) ) ( not ( = ?auto_11301 ?auto_11294 ) ) ( not ( = ?auto_11299 ?auto_11294 ) ) ( HOIST-AT ?auto_11295 ?auto_11294 ) ( not ( = ?auto_11302 ?auto_11295 ) ) ( not ( = ?auto_11287 ?auto_11295 ) ) ( not ( = ?auto_11291 ?auto_11295 ) ) ( AVAILABLE ?auto_11295 ) ( SURFACE-AT ?auto_11293 ?auto_11294 ) ( ON ?auto_11293 ?auto_11292 ) ( CLEAR ?auto_11293 ) ( not ( = ?auto_11284 ?auto_11292 ) ) ( not ( = ?auto_11285 ?auto_11292 ) ) ( not ( = ?auto_11297 ?auto_11292 ) ) ( not ( = ?auto_11293 ?auto_11292 ) ) ( not ( = ?auto_11290 ?auto_11292 ) ) ( not ( = ?auto_11286 ?auto_11292 ) ) ( SURFACE-AT ?auto_11298 ?auto_11288 ) ( CLEAR ?auto_11298 ) ( IS-CRATE ?auto_11286 ) ( not ( = ?auto_11284 ?auto_11298 ) ) ( not ( = ?auto_11285 ?auto_11298 ) ) ( not ( = ?auto_11297 ?auto_11298 ) ) ( not ( = ?auto_11293 ?auto_11298 ) ) ( not ( = ?auto_11290 ?auto_11298 ) ) ( not ( = ?auto_11286 ?auto_11298 ) ) ( not ( = ?auto_11292 ?auto_11298 ) ) ( AVAILABLE ?auto_11302 ) ( not ( = ?auto_11296 ?auto_11288 ) ) ( not ( = ?auto_11301 ?auto_11296 ) ) ( not ( = ?auto_11299 ?auto_11296 ) ) ( not ( = ?auto_11294 ?auto_11296 ) ) ( HOIST-AT ?auto_11289 ?auto_11296 ) ( not ( = ?auto_11302 ?auto_11289 ) ) ( not ( = ?auto_11287 ?auto_11289 ) ) ( not ( = ?auto_11291 ?auto_11289 ) ) ( not ( = ?auto_11295 ?auto_11289 ) ) ( AVAILABLE ?auto_11289 ) ( SURFACE-AT ?auto_11286 ?auto_11296 ) ( ON ?auto_11286 ?auto_11303 ) ( CLEAR ?auto_11286 ) ( not ( = ?auto_11284 ?auto_11303 ) ) ( not ( = ?auto_11285 ?auto_11303 ) ) ( not ( = ?auto_11297 ?auto_11303 ) ) ( not ( = ?auto_11293 ?auto_11303 ) ) ( not ( = ?auto_11290 ?auto_11303 ) ) ( not ( = ?auto_11286 ?auto_11303 ) ) ( not ( = ?auto_11292 ?auto_11303 ) ) ( not ( = ?auto_11298 ?auto_11303 ) ) ( TRUCK-AT ?auto_11300 ?auto_11288 ) )
    :subtasks
    ( ( !DRIVE ?auto_11300 ?auto_11288 ?auto_11296 )
      ( MAKE-ON ?auto_11284 ?auto_11285 )
      ( MAKE-ON-VERIFY ?auto_11284 ?auto_11285 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_11304 - SURFACE
      ?auto_11305 - SURFACE
    )
    :vars
    (
      ?auto_11306 - HOIST
      ?auto_11322 - PLACE
      ?auto_11310 - PLACE
      ?auto_11317 - HOIST
      ?auto_11320 - SURFACE
      ?auto_11312 - SURFACE
      ?auto_11323 - PLACE
      ?auto_11315 - HOIST
      ?auto_11314 - SURFACE
      ?auto_11316 - SURFACE
      ?auto_11319 - PLACE
      ?auto_11308 - HOIST
      ?auto_11318 - SURFACE
      ?auto_11307 - SURFACE
      ?auto_11313 - PLACE
      ?auto_11321 - HOIST
      ?auto_11311 - SURFACE
      ?auto_11309 - TRUCK
      ?auto_11324 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11306 ?auto_11322 ) ( IS-CRATE ?auto_11304 ) ( not ( = ?auto_11304 ?auto_11305 ) ) ( not ( = ?auto_11310 ?auto_11322 ) ) ( HOIST-AT ?auto_11317 ?auto_11310 ) ( not ( = ?auto_11306 ?auto_11317 ) ) ( AVAILABLE ?auto_11317 ) ( SURFACE-AT ?auto_11304 ?auto_11310 ) ( ON ?auto_11304 ?auto_11320 ) ( CLEAR ?auto_11304 ) ( not ( = ?auto_11304 ?auto_11320 ) ) ( not ( = ?auto_11305 ?auto_11320 ) ) ( IS-CRATE ?auto_11305 ) ( not ( = ?auto_11304 ?auto_11312 ) ) ( not ( = ?auto_11305 ?auto_11312 ) ) ( not ( = ?auto_11320 ?auto_11312 ) ) ( not ( = ?auto_11323 ?auto_11322 ) ) ( not ( = ?auto_11310 ?auto_11323 ) ) ( HOIST-AT ?auto_11315 ?auto_11323 ) ( not ( = ?auto_11306 ?auto_11315 ) ) ( not ( = ?auto_11317 ?auto_11315 ) ) ( AVAILABLE ?auto_11315 ) ( SURFACE-AT ?auto_11305 ?auto_11323 ) ( ON ?auto_11305 ?auto_11314 ) ( CLEAR ?auto_11305 ) ( not ( = ?auto_11304 ?auto_11314 ) ) ( not ( = ?auto_11305 ?auto_11314 ) ) ( not ( = ?auto_11320 ?auto_11314 ) ) ( not ( = ?auto_11312 ?auto_11314 ) ) ( IS-CRATE ?auto_11312 ) ( not ( = ?auto_11304 ?auto_11316 ) ) ( not ( = ?auto_11305 ?auto_11316 ) ) ( not ( = ?auto_11320 ?auto_11316 ) ) ( not ( = ?auto_11312 ?auto_11316 ) ) ( not ( = ?auto_11314 ?auto_11316 ) ) ( not ( = ?auto_11319 ?auto_11322 ) ) ( not ( = ?auto_11310 ?auto_11319 ) ) ( not ( = ?auto_11323 ?auto_11319 ) ) ( HOIST-AT ?auto_11308 ?auto_11319 ) ( not ( = ?auto_11306 ?auto_11308 ) ) ( not ( = ?auto_11317 ?auto_11308 ) ) ( not ( = ?auto_11315 ?auto_11308 ) ) ( AVAILABLE ?auto_11308 ) ( SURFACE-AT ?auto_11312 ?auto_11319 ) ( ON ?auto_11312 ?auto_11318 ) ( CLEAR ?auto_11312 ) ( not ( = ?auto_11304 ?auto_11318 ) ) ( not ( = ?auto_11305 ?auto_11318 ) ) ( not ( = ?auto_11320 ?auto_11318 ) ) ( not ( = ?auto_11312 ?auto_11318 ) ) ( not ( = ?auto_11314 ?auto_11318 ) ) ( not ( = ?auto_11316 ?auto_11318 ) ) ( IS-CRATE ?auto_11316 ) ( not ( = ?auto_11304 ?auto_11307 ) ) ( not ( = ?auto_11305 ?auto_11307 ) ) ( not ( = ?auto_11320 ?auto_11307 ) ) ( not ( = ?auto_11312 ?auto_11307 ) ) ( not ( = ?auto_11314 ?auto_11307 ) ) ( not ( = ?auto_11316 ?auto_11307 ) ) ( not ( = ?auto_11318 ?auto_11307 ) ) ( not ( = ?auto_11313 ?auto_11322 ) ) ( not ( = ?auto_11310 ?auto_11313 ) ) ( not ( = ?auto_11323 ?auto_11313 ) ) ( not ( = ?auto_11319 ?auto_11313 ) ) ( HOIST-AT ?auto_11321 ?auto_11313 ) ( not ( = ?auto_11306 ?auto_11321 ) ) ( not ( = ?auto_11317 ?auto_11321 ) ) ( not ( = ?auto_11315 ?auto_11321 ) ) ( not ( = ?auto_11308 ?auto_11321 ) ) ( AVAILABLE ?auto_11321 ) ( SURFACE-AT ?auto_11316 ?auto_11313 ) ( ON ?auto_11316 ?auto_11311 ) ( CLEAR ?auto_11316 ) ( not ( = ?auto_11304 ?auto_11311 ) ) ( not ( = ?auto_11305 ?auto_11311 ) ) ( not ( = ?auto_11320 ?auto_11311 ) ) ( not ( = ?auto_11312 ?auto_11311 ) ) ( not ( = ?auto_11314 ?auto_11311 ) ) ( not ( = ?auto_11316 ?auto_11311 ) ) ( not ( = ?auto_11318 ?auto_11311 ) ) ( not ( = ?auto_11307 ?auto_11311 ) ) ( TRUCK-AT ?auto_11309 ?auto_11322 ) ( SURFACE-AT ?auto_11324 ?auto_11322 ) ( CLEAR ?auto_11324 ) ( LIFTING ?auto_11306 ?auto_11307 ) ( IS-CRATE ?auto_11307 ) ( not ( = ?auto_11304 ?auto_11324 ) ) ( not ( = ?auto_11305 ?auto_11324 ) ) ( not ( = ?auto_11320 ?auto_11324 ) ) ( not ( = ?auto_11312 ?auto_11324 ) ) ( not ( = ?auto_11314 ?auto_11324 ) ) ( not ( = ?auto_11316 ?auto_11324 ) ) ( not ( = ?auto_11318 ?auto_11324 ) ) ( not ( = ?auto_11307 ?auto_11324 ) ) ( not ( = ?auto_11311 ?auto_11324 ) ) )
    :subtasks
    ( ( !DROP ?auto_11306 ?auto_11307 ?auto_11324 ?auto_11322 )
      ( MAKE-ON ?auto_11304 ?auto_11305 )
      ( MAKE-ON-VERIFY ?auto_11304 ?auto_11305 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_11325 - SURFACE
      ?auto_11326 - SURFACE
    )
    :vars
    (
      ?auto_11344 - HOIST
      ?auto_11330 - PLACE
      ?auto_11332 - PLACE
      ?auto_11337 - HOIST
      ?auto_11341 - SURFACE
      ?auto_11327 - SURFACE
      ?auto_11329 - PLACE
      ?auto_11342 - HOIST
      ?auto_11343 - SURFACE
      ?auto_11334 - SURFACE
      ?auto_11335 - PLACE
      ?auto_11338 - HOIST
      ?auto_11340 - SURFACE
      ?auto_11331 - SURFACE
      ?auto_11336 - PLACE
      ?auto_11328 - HOIST
      ?auto_11333 - SURFACE
      ?auto_11339 - TRUCK
      ?auto_11345 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11344 ?auto_11330 ) ( IS-CRATE ?auto_11325 ) ( not ( = ?auto_11325 ?auto_11326 ) ) ( not ( = ?auto_11332 ?auto_11330 ) ) ( HOIST-AT ?auto_11337 ?auto_11332 ) ( not ( = ?auto_11344 ?auto_11337 ) ) ( AVAILABLE ?auto_11337 ) ( SURFACE-AT ?auto_11325 ?auto_11332 ) ( ON ?auto_11325 ?auto_11341 ) ( CLEAR ?auto_11325 ) ( not ( = ?auto_11325 ?auto_11341 ) ) ( not ( = ?auto_11326 ?auto_11341 ) ) ( IS-CRATE ?auto_11326 ) ( not ( = ?auto_11325 ?auto_11327 ) ) ( not ( = ?auto_11326 ?auto_11327 ) ) ( not ( = ?auto_11341 ?auto_11327 ) ) ( not ( = ?auto_11329 ?auto_11330 ) ) ( not ( = ?auto_11332 ?auto_11329 ) ) ( HOIST-AT ?auto_11342 ?auto_11329 ) ( not ( = ?auto_11344 ?auto_11342 ) ) ( not ( = ?auto_11337 ?auto_11342 ) ) ( AVAILABLE ?auto_11342 ) ( SURFACE-AT ?auto_11326 ?auto_11329 ) ( ON ?auto_11326 ?auto_11343 ) ( CLEAR ?auto_11326 ) ( not ( = ?auto_11325 ?auto_11343 ) ) ( not ( = ?auto_11326 ?auto_11343 ) ) ( not ( = ?auto_11341 ?auto_11343 ) ) ( not ( = ?auto_11327 ?auto_11343 ) ) ( IS-CRATE ?auto_11327 ) ( not ( = ?auto_11325 ?auto_11334 ) ) ( not ( = ?auto_11326 ?auto_11334 ) ) ( not ( = ?auto_11341 ?auto_11334 ) ) ( not ( = ?auto_11327 ?auto_11334 ) ) ( not ( = ?auto_11343 ?auto_11334 ) ) ( not ( = ?auto_11335 ?auto_11330 ) ) ( not ( = ?auto_11332 ?auto_11335 ) ) ( not ( = ?auto_11329 ?auto_11335 ) ) ( HOIST-AT ?auto_11338 ?auto_11335 ) ( not ( = ?auto_11344 ?auto_11338 ) ) ( not ( = ?auto_11337 ?auto_11338 ) ) ( not ( = ?auto_11342 ?auto_11338 ) ) ( AVAILABLE ?auto_11338 ) ( SURFACE-AT ?auto_11327 ?auto_11335 ) ( ON ?auto_11327 ?auto_11340 ) ( CLEAR ?auto_11327 ) ( not ( = ?auto_11325 ?auto_11340 ) ) ( not ( = ?auto_11326 ?auto_11340 ) ) ( not ( = ?auto_11341 ?auto_11340 ) ) ( not ( = ?auto_11327 ?auto_11340 ) ) ( not ( = ?auto_11343 ?auto_11340 ) ) ( not ( = ?auto_11334 ?auto_11340 ) ) ( IS-CRATE ?auto_11334 ) ( not ( = ?auto_11325 ?auto_11331 ) ) ( not ( = ?auto_11326 ?auto_11331 ) ) ( not ( = ?auto_11341 ?auto_11331 ) ) ( not ( = ?auto_11327 ?auto_11331 ) ) ( not ( = ?auto_11343 ?auto_11331 ) ) ( not ( = ?auto_11334 ?auto_11331 ) ) ( not ( = ?auto_11340 ?auto_11331 ) ) ( not ( = ?auto_11336 ?auto_11330 ) ) ( not ( = ?auto_11332 ?auto_11336 ) ) ( not ( = ?auto_11329 ?auto_11336 ) ) ( not ( = ?auto_11335 ?auto_11336 ) ) ( HOIST-AT ?auto_11328 ?auto_11336 ) ( not ( = ?auto_11344 ?auto_11328 ) ) ( not ( = ?auto_11337 ?auto_11328 ) ) ( not ( = ?auto_11342 ?auto_11328 ) ) ( not ( = ?auto_11338 ?auto_11328 ) ) ( AVAILABLE ?auto_11328 ) ( SURFACE-AT ?auto_11334 ?auto_11336 ) ( ON ?auto_11334 ?auto_11333 ) ( CLEAR ?auto_11334 ) ( not ( = ?auto_11325 ?auto_11333 ) ) ( not ( = ?auto_11326 ?auto_11333 ) ) ( not ( = ?auto_11341 ?auto_11333 ) ) ( not ( = ?auto_11327 ?auto_11333 ) ) ( not ( = ?auto_11343 ?auto_11333 ) ) ( not ( = ?auto_11334 ?auto_11333 ) ) ( not ( = ?auto_11340 ?auto_11333 ) ) ( not ( = ?auto_11331 ?auto_11333 ) ) ( TRUCK-AT ?auto_11339 ?auto_11330 ) ( SURFACE-AT ?auto_11345 ?auto_11330 ) ( CLEAR ?auto_11345 ) ( IS-CRATE ?auto_11331 ) ( not ( = ?auto_11325 ?auto_11345 ) ) ( not ( = ?auto_11326 ?auto_11345 ) ) ( not ( = ?auto_11341 ?auto_11345 ) ) ( not ( = ?auto_11327 ?auto_11345 ) ) ( not ( = ?auto_11343 ?auto_11345 ) ) ( not ( = ?auto_11334 ?auto_11345 ) ) ( not ( = ?auto_11340 ?auto_11345 ) ) ( not ( = ?auto_11331 ?auto_11345 ) ) ( not ( = ?auto_11333 ?auto_11345 ) ) ( AVAILABLE ?auto_11344 ) ( IN ?auto_11331 ?auto_11339 ) )
    :subtasks
    ( ( !UNLOAD ?auto_11344 ?auto_11331 ?auto_11339 ?auto_11330 )
      ( MAKE-ON ?auto_11325 ?auto_11326 )
      ( MAKE-ON-VERIFY ?auto_11325 ?auto_11326 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_11346 - SURFACE
      ?auto_11347 - SURFACE
    )
    :vars
    (
      ?auto_11364 - HOIST
      ?auto_11348 - PLACE
      ?auto_11357 - PLACE
      ?auto_11355 - HOIST
      ?auto_11361 - SURFACE
      ?auto_11360 - SURFACE
      ?auto_11351 - PLACE
      ?auto_11366 - HOIST
      ?auto_11363 - SURFACE
      ?auto_11352 - SURFACE
      ?auto_11350 - PLACE
      ?auto_11349 - HOIST
      ?auto_11358 - SURFACE
      ?auto_11362 - SURFACE
      ?auto_11354 - PLACE
      ?auto_11359 - HOIST
      ?auto_11356 - SURFACE
      ?auto_11365 - SURFACE
      ?auto_11353 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11364 ?auto_11348 ) ( IS-CRATE ?auto_11346 ) ( not ( = ?auto_11346 ?auto_11347 ) ) ( not ( = ?auto_11357 ?auto_11348 ) ) ( HOIST-AT ?auto_11355 ?auto_11357 ) ( not ( = ?auto_11364 ?auto_11355 ) ) ( AVAILABLE ?auto_11355 ) ( SURFACE-AT ?auto_11346 ?auto_11357 ) ( ON ?auto_11346 ?auto_11361 ) ( CLEAR ?auto_11346 ) ( not ( = ?auto_11346 ?auto_11361 ) ) ( not ( = ?auto_11347 ?auto_11361 ) ) ( IS-CRATE ?auto_11347 ) ( not ( = ?auto_11346 ?auto_11360 ) ) ( not ( = ?auto_11347 ?auto_11360 ) ) ( not ( = ?auto_11361 ?auto_11360 ) ) ( not ( = ?auto_11351 ?auto_11348 ) ) ( not ( = ?auto_11357 ?auto_11351 ) ) ( HOIST-AT ?auto_11366 ?auto_11351 ) ( not ( = ?auto_11364 ?auto_11366 ) ) ( not ( = ?auto_11355 ?auto_11366 ) ) ( AVAILABLE ?auto_11366 ) ( SURFACE-AT ?auto_11347 ?auto_11351 ) ( ON ?auto_11347 ?auto_11363 ) ( CLEAR ?auto_11347 ) ( not ( = ?auto_11346 ?auto_11363 ) ) ( not ( = ?auto_11347 ?auto_11363 ) ) ( not ( = ?auto_11361 ?auto_11363 ) ) ( not ( = ?auto_11360 ?auto_11363 ) ) ( IS-CRATE ?auto_11360 ) ( not ( = ?auto_11346 ?auto_11352 ) ) ( not ( = ?auto_11347 ?auto_11352 ) ) ( not ( = ?auto_11361 ?auto_11352 ) ) ( not ( = ?auto_11360 ?auto_11352 ) ) ( not ( = ?auto_11363 ?auto_11352 ) ) ( not ( = ?auto_11350 ?auto_11348 ) ) ( not ( = ?auto_11357 ?auto_11350 ) ) ( not ( = ?auto_11351 ?auto_11350 ) ) ( HOIST-AT ?auto_11349 ?auto_11350 ) ( not ( = ?auto_11364 ?auto_11349 ) ) ( not ( = ?auto_11355 ?auto_11349 ) ) ( not ( = ?auto_11366 ?auto_11349 ) ) ( AVAILABLE ?auto_11349 ) ( SURFACE-AT ?auto_11360 ?auto_11350 ) ( ON ?auto_11360 ?auto_11358 ) ( CLEAR ?auto_11360 ) ( not ( = ?auto_11346 ?auto_11358 ) ) ( not ( = ?auto_11347 ?auto_11358 ) ) ( not ( = ?auto_11361 ?auto_11358 ) ) ( not ( = ?auto_11360 ?auto_11358 ) ) ( not ( = ?auto_11363 ?auto_11358 ) ) ( not ( = ?auto_11352 ?auto_11358 ) ) ( IS-CRATE ?auto_11352 ) ( not ( = ?auto_11346 ?auto_11362 ) ) ( not ( = ?auto_11347 ?auto_11362 ) ) ( not ( = ?auto_11361 ?auto_11362 ) ) ( not ( = ?auto_11360 ?auto_11362 ) ) ( not ( = ?auto_11363 ?auto_11362 ) ) ( not ( = ?auto_11352 ?auto_11362 ) ) ( not ( = ?auto_11358 ?auto_11362 ) ) ( not ( = ?auto_11354 ?auto_11348 ) ) ( not ( = ?auto_11357 ?auto_11354 ) ) ( not ( = ?auto_11351 ?auto_11354 ) ) ( not ( = ?auto_11350 ?auto_11354 ) ) ( HOIST-AT ?auto_11359 ?auto_11354 ) ( not ( = ?auto_11364 ?auto_11359 ) ) ( not ( = ?auto_11355 ?auto_11359 ) ) ( not ( = ?auto_11366 ?auto_11359 ) ) ( not ( = ?auto_11349 ?auto_11359 ) ) ( AVAILABLE ?auto_11359 ) ( SURFACE-AT ?auto_11352 ?auto_11354 ) ( ON ?auto_11352 ?auto_11356 ) ( CLEAR ?auto_11352 ) ( not ( = ?auto_11346 ?auto_11356 ) ) ( not ( = ?auto_11347 ?auto_11356 ) ) ( not ( = ?auto_11361 ?auto_11356 ) ) ( not ( = ?auto_11360 ?auto_11356 ) ) ( not ( = ?auto_11363 ?auto_11356 ) ) ( not ( = ?auto_11352 ?auto_11356 ) ) ( not ( = ?auto_11358 ?auto_11356 ) ) ( not ( = ?auto_11362 ?auto_11356 ) ) ( SURFACE-AT ?auto_11365 ?auto_11348 ) ( CLEAR ?auto_11365 ) ( IS-CRATE ?auto_11362 ) ( not ( = ?auto_11346 ?auto_11365 ) ) ( not ( = ?auto_11347 ?auto_11365 ) ) ( not ( = ?auto_11361 ?auto_11365 ) ) ( not ( = ?auto_11360 ?auto_11365 ) ) ( not ( = ?auto_11363 ?auto_11365 ) ) ( not ( = ?auto_11352 ?auto_11365 ) ) ( not ( = ?auto_11358 ?auto_11365 ) ) ( not ( = ?auto_11362 ?auto_11365 ) ) ( not ( = ?auto_11356 ?auto_11365 ) ) ( AVAILABLE ?auto_11364 ) ( IN ?auto_11362 ?auto_11353 ) ( TRUCK-AT ?auto_11353 ?auto_11351 ) )
    :subtasks
    ( ( !DRIVE ?auto_11353 ?auto_11351 ?auto_11348 )
      ( MAKE-ON ?auto_11346 ?auto_11347 )
      ( MAKE-ON-VERIFY ?auto_11346 ?auto_11347 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_11367 - SURFACE
      ?auto_11368 - SURFACE
    )
    :vars
    (
      ?auto_11369 - HOIST
      ?auto_11386 - PLACE
      ?auto_11370 - PLACE
      ?auto_11374 - HOIST
      ?auto_11381 - SURFACE
      ?auto_11384 - SURFACE
      ?auto_11377 - PLACE
      ?auto_11372 - HOIST
      ?auto_11385 - SURFACE
      ?auto_11387 - SURFACE
      ?auto_11379 - PLACE
      ?auto_11376 - HOIST
      ?auto_11371 - SURFACE
      ?auto_11382 - SURFACE
      ?auto_11383 - PLACE
      ?auto_11375 - HOIST
      ?auto_11380 - SURFACE
      ?auto_11373 - SURFACE
      ?auto_11378 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11369 ?auto_11386 ) ( IS-CRATE ?auto_11367 ) ( not ( = ?auto_11367 ?auto_11368 ) ) ( not ( = ?auto_11370 ?auto_11386 ) ) ( HOIST-AT ?auto_11374 ?auto_11370 ) ( not ( = ?auto_11369 ?auto_11374 ) ) ( AVAILABLE ?auto_11374 ) ( SURFACE-AT ?auto_11367 ?auto_11370 ) ( ON ?auto_11367 ?auto_11381 ) ( CLEAR ?auto_11367 ) ( not ( = ?auto_11367 ?auto_11381 ) ) ( not ( = ?auto_11368 ?auto_11381 ) ) ( IS-CRATE ?auto_11368 ) ( not ( = ?auto_11367 ?auto_11384 ) ) ( not ( = ?auto_11368 ?auto_11384 ) ) ( not ( = ?auto_11381 ?auto_11384 ) ) ( not ( = ?auto_11377 ?auto_11386 ) ) ( not ( = ?auto_11370 ?auto_11377 ) ) ( HOIST-AT ?auto_11372 ?auto_11377 ) ( not ( = ?auto_11369 ?auto_11372 ) ) ( not ( = ?auto_11374 ?auto_11372 ) ) ( SURFACE-AT ?auto_11368 ?auto_11377 ) ( ON ?auto_11368 ?auto_11385 ) ( CLEAR ?auto_11368 ) ( not ( = ?auto_11367 ?auto_11385 ) ) ( not ( = ?auto_11368 ?auto_11385 ) ) ( not ( = ?auto_11381 ?auto_11385 ) ) ( not ( = ?auto_11384 ?auto_11385 ) ) ( IS-CRATE ?auto_11384 ) ( not ( = ?auto_11367 ?auto_11387 ) ) ( not ( = ?auto_11368 ?auto_11387 ) ) ( not ( = ?auto_11381 ?auto_11387 ) ) ( not ( = ?auto_11384 ?auto_11387 ) ) ( not ( = ?auto_11385 ?auto_11387 ) ) ( not ( = ?auto_11379 ?auto_11386 ) ) ( not ( = ?auto_11370 ?auto_11379 ) ) ( not ( = ?auto_11377 ?auto_11379 ) ) ( HOIST-AT ?auto_11376 ?auto_11379 ) ( not ( = ?auto_11369 ?auto_11376 ) ) ( not ( = ?auto_11374 ?auto_11376 ) ) ( not ( = ?auto_11372 ?auto_11376 ) ) ( AVAILABLE ?auto_11376 ) ( SURFACE-AT ?auto_11384 ?auto_11379 ) ( ON ?auto_11384 ?auto_11371 ) ( CLEAR ?auto_11384 ) ( not ( = ?auto_11367 ?auto_11371 ) ) ( not ( = ?auto_11368 ?auto_11371 ) ) ( not ( = ?auto_11381 ?auto_11371 ) ) ( not ( = ?auto_11384 ?auto_11371 ) ) ( not ( = ?auto_11385 ?auto_11371 ) ) ( not ( = ?auto_11387 ?auto_11371 ) ) ( IS-CRATE ?auto_11387 ) ( not ( = ?auto_11367 ?auto_11382 ) ) ( not ( = ?auto_11368 ?auto_11382 ) ) ( not ( = ?auto_11381 ?auto_11382 ) ) ( not ( = ?auto_11384 ?auto_11382 ) ) ( not ( = ?auto_11385 ?auto_11382 ) ) ( not ( = ?auto_11387 ?auto_11382 ) ) ( not ( = ?auto_11371 ?auto_11382 ) ) ( not ( = ?auto_11383 ?auto_11386 ) ) ( not ( = ?auto_11370 ?auto_11383 ) ) ( not ( = ?auto_11377 ?auto_11383 ) ) ( not ( = ?auto_11379 ?auto_11383 ) ) ( HOIST-AT ?auto_11375 ?auto_11383 ) ( not ( = ?auto_11369 ?auto_11375 ) ) ( not ( = ?auto_11374 ?auto_11375 ) ) ( not ( = ?auto_11372 ?auto_11375 ) ) ( not ( = ?auto_11376 ?auto_11375 ) ) ( AVAILABLE ?auto_11375 ) ( SURFACE-AT ?auto_11387 ?auto_11383 ) ( ON ?auto_11387 ?auto_11380 ) ( CLEAR ?auto_11387 ) ( not ( = ?auto_11367 ?auto_11380 ) ) ( not ( = ?auto_11368 ?auto_11380 ) ) ( not ( = ?auto_11381 ?auto_11380 ) ) ( not ( = ?auto_11384 ?auto_11380 ) ) ( not ( = ?auto_11385 ?auto_11380 ) ) ( not ( = ?auto_11387 ?auto_11380 ) ) ( not ( = ?auto_11371 ?auto_11380 ) ) ( not ( = ?auto_11382 ?auto_11380 ) ) ( SURFACE-AT ?auto_11373 ?auto_11386 ) ( CLEAR ?auto_11373 ) ( IS-CRATE ?auto_11382 ) ( not ( = ?auto_11367 ?auto_11373 ) ) ( not ( = ?auto_11368 ?auto_11373 ) ) ( not ( = ?auto_11381 ?auto_11373 ) ) ( not ( = ?auto_11384 ?auto_11373 ) ) ( not ( = ?auto_11385 ?auto_11373 ) ) ( not ( = ?auto_11387 ?auto_11373 ) ) ( not ( = ?auto_11371 ?auto_11373 ) ) ( not ( = ?auto_11382 ?auto_11373 ) ) ( not ( = ?auto_11380 ?auto_11373 ) ) ( AVAILABLE ?auto_11369 ) ( TRUCK-AT ?auto_11378 ?auto_11377 ) ( LIFTING ?auto_11372 ?auto_11382 ) )
    :subtasks
    ( ( !LOAD ?auto_11372 ?auto_11382 ?auto_11378 ?auto_11377 )
      ( MAKE-ON ?auto_11367 ?auto_11368 )
      ( MAKE-ON-VERIFY ?auto_11367 ?auto_11368 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_11388 - SURFACE
      ?auto_11389 - SURFACE
    )
    :vars
    (
      ?auto_11399 - HOIST
      ?auto_11392 - PLACE
      ?auto_11407 - PLACE
      ?auto_11408 - HOIST
      ?auto_11404 - SURFACE
      ?auto_11397 - SURFACE
      ?auto_11403 - PLACE
      ?auto_11405 - HOIST
      ?auto_11394 - SURFACE
      ?auto_11393 - SURFACE
      ?auto_11398 - PLACE
      ?auto_11395 - HOIST
      ?auto_11396 - SURFACE
      ?auto_11401 - SURFACE
      ?auto_11391 - PLACE
      ?auto_11402 - HOIST
      ?auto_11406 - SURFACE
      ?auto_11400 - SURFACE
      ?auto_11390 - TRUCK
      ?auto_11409 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11399 ?auto_11392 ) ( IS-CRATE ?auto_11388 ) ( not ( = ?auto_11388 ?auto_11389 ) ) ( not ( = ?auto_11407 ?auto_11392 ) ) ( HOIST-AT ?auto_11408 ?auto_11407 ) ( not ( = ?auto_11399 ?auto_11408 ) ) ( AVAILABLE ?auto_11408 ) ( SURFACE-AT ?auto_11388 ?auto_11407 ) ( ON ?auto_11388 ?auto_11404 ) ( CLEAR ?auto_11388 ) ( not ( = ?auto_11388 ?auto_11404 ) ) ( not ( = ?auto_11389 ?auto_11404 ) ) ( IS-CRATE ?auto_11389 ) ( not ( = ?auto_11388 ?auto_11397 ) ) ( not ( = ?auto_11389 ?auto_11397 ) ) ( not ( = ?auto_11404 ?auto_11397 ) ) ( not ( = ?auto_11403 ?auto_11392 ) ) ( not ( = ?auto_11407 ?auto_11403 ) ) ( HOIST-AT ?auto_11405 ?auto_11403 ) ( not ( = ?auto_11399 ?auto_11405 ) ) ( not ( = ?auto_11408 ?auto_11405 ) ) ( SURFACE-AT ?auto_11389 ?auto_11403 ) ( ON ?auto_11389 ?auto_11394 ) ( CLEAR ?auto_11389 ) ( not ( = ?auto_11388 ?auto_11394 ) ) ( not ( = ?auto_11389 ?auto_11394 ) ) ( not ( = ?auto_11404 ?auto_11394 ) ) ( not ( = ?auto_11397 ?auto_11394 ) ) ( IS-CRATE ?auto_11397 ) ( not ( = ?auto_11388 ?auto_11393 ) ) ( not ( = ?auto_11389 ?auto_11393 ) ) ( not ( = ?auto_11404 ?auto_11393 ) ) ( not ( = ?auto_11397 ?auto_11393 ) ) ( not ( = ?auto_11394 ?auto_11393 ) ) ( not ( = ?auto_11398 ?auto_11392 ) ) ( not ( = ?auto_11407 ?auto_11398 ) ) ( not ( = ?auto_11403 ?auto_11398 ) ) ( HOIST-AT ?auto_11395 ?auto_11398 ) ( not ( = ?auto_11399 ?auto_11395 ) ) ( not ( = ?auto_11408 ?auto_11395 ) ) ( not ( = ?auto_11405 ?auto_11395 ) ) ( AVAILABLE ?auto_11395 ) ( SURFACE-AT ?auto_11397 ?auto_11398 ) ( ON ?auto_11397 ?auto_11396 ) ( CLEAR ?auto_11397 ) ( not ( = ?auto_11388 ?auto_11396 ) ) ( not ( = ?auto_11389 ?auto_11396 ) ) ( not ( = ?auto_11404 ?auto_11396 ) ) ( not ( = ?auto_11397 ?auto_11396 ) ) ( not ( = ?auto_11394 ?auto_11396 ) ) ( not ( = ?auto_11393 ?auto_11396 ) ) ( IS-CRATE ?auto_11393 ) ( not ( = ?auto_11388 ?auto_11401 ) ) ( not ( = ?auto_11389 ?auto_11401 ) ) ( not ( = ?auto_11404 ?auto_11401 ) ) ( not ( = ?auto_11397 ?auto_11401 ) ) ( not ( = ?auto_11394 ?auto_11401 ) ) ( not ( = ?auto_11393 ?auto_11401 ) ) ( not ( = ?auto_11396 ?auto_11401 ) ) ( not ( = ?auto_11391 ?auto_11392 ) ) ( not ( = ?auto_11407 ?auto_11391 ) ) ( not ( = ?auto_11403 ?auto_11391 ) ) ( not ( = ?auto_11398 ?auto_11391 ) ) ( HOIST-AT ?auto_11402 ?auto_11391 ) ( not ( = ?auto_11399 ?auto_11402 ) ) ( not ( = ?auto_11408 ?auto_11402 ) ) ( not ( = ?auto_11405 ?auto_11402 ) ) ( not ( = ?auto_11395 ?auto_11402 ) ) ( AVAILABLE ?auto_11402 ) ( SURFACE-AT ?auto_11393 ?auto_11391 ) ( ON ?auto_11393 ?auto_11406 ) ( CLEAR ?auto_11393 ) ( not ( = ?auto_11388 ?auto_11406 ) ) ( not ( = ?auto_11389 ?auto_11406 ) ) ( not ( = ?auto_11404 ?auto_11406 ) ) ( not ( = ?auto_11397 ?auto_11406 ) ) ( not ( = ?auto_11394 ?auto_11406 ) ) ( not ( = ?auto_11393 ?auto_11406 ) ) ( not ( = ?auto_11396 ?auto_11406 ) ) ( not ( = ?auto_11401 ?auto_11406 ) ) ( SURFACE-AT ?auto_11400 ?auto_11392 ) ( CLEAR ?auto_11400 ) ( IS-CRATE ?auto_11401 ) ( not ( = ?auto_11388 ?auto_11400 ) ) ( not ( = ?auto_11389 ?auto_11400 ) ) ( not ( = ?auto_11404 ?auto_11400 ) ) ( not ( = ?auto_11397 ?auto_11400 ) ) ( not ( = ?auto_11394 ?auto_11400 ) ) ( not ( = ?auto_11393 ?auto_11400 ) ) ( not ( = ?auto_11396 ?auto_11400 ) ) ( not ( = ?auto_11401 ?auto_11400 ) ) ( not ( = ?auto_11406 ?auto_11400 ) ) ( AVAILABLE ?auto_11399 ) ( TRUCK-AT ?auto_11390 ?auto_11403 ) ( AVAILABLE ?auto_11405 ) ( SURFACE-AT ?auto_11401 ?auto_11403 ) ( ON ?auto_11401 ?auto_11409 ) ( CLEAR ?auto_11401 ) ( not ( = ?auto_11388 ?auto_11409 ) ) ( not ( = ?auto_11389 ?auto_11409 ) ) ( not ( = ?auto_11404 ?auto_11409 ) ) ( not ( = ?auto_11397 ?auto_11409 ) ) ( not ( = ?auto_11394 ?auto_11409 ) ) ( not ( = ?auto_11393 ?auto_11409 ) ) ( not ( = ?auto_11396 ?auto_11409 ) ) ( not ( = ?auto_11401 ?auto_11409 ) ) ( not ( = ?auto_11406 ?auto_11409 ) ) ( not ( = ?auto_11400 ?auto_11409 ) ) )
    :subtasks
    ( ( !LIFT ?auto_11405 ?auto_11401 ?auto_11409 ?auto_11403 )
      ( MAKE-ON ?auto_11388 ?auto_11389 )
      ( MAKE-ON-VERIFY ?auto_11388 ?auto_11389 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_11410 - SURFACE
      ?auto_11411 - SURFACE
    )
    :vars
    (
      ?auto_11423 - HOIST
      ?auto_11428 - PLACE
      ?auto_11418 - PLACE
      ?auto_11419 - HOIST
      ?auto_11417 - SURFACE
      ?auto_11415 - SURFACE
      ?auto_11427 - PLACE
      ?auto_11414 - HOIST
      ?auto_11426 - SURFACE
      ?auto_11416 - SURFACE
      ?auto_11430 - PLACE
      ?auto_11421 - HOIST
      ?auto_11413 - SURFACE
      ?auto_11425 - SURFACE
      ?auto_11424 - PLACE
      ?auto_11422 - HOIST
      ?auto_11412 - SURFACE
      ?auto_11420 - SURFACE
      ?auto_11429 - SURFACE
      ?auto_11431 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11423 ?auto_11428 ) ( IS-CRATE ?auto_11410 ) ( not ( = ?auto_11410 ?auto_11411 ) ) ( not ( = ?auto_11418 ?auto_11428 ) ) ( HOIST-AT ?auto_11419 ?auto_11418 ) ( not ( = ?auto_11423 ?auto_11419 ) ) ( AVAILABLE ?auto_11419 ) ( SURFACE-AT ?auto_11410 ?auto_11418 ) ( ON ?auto_11410 ?auto_11417 ) ( CLEAR ?auto_11410 ) ( not ( = ?auto_11410 ?auto_11417 ) ) ( not ( = ?auto_11411 ?auto_11417 ) ) ( IS-CRATE ?auto_11411 ) ( not ( = ?auto_11410 ?auto_11415 ) ) ( not ( = ?auto_11411 ?auto_11415 ) ) ( not ( = ?auto_11417 ?auto_11415 ) ) ( not ( = ?auto_11427 ?auto_11428 ) ) ( not ( = ?auto_11418 ?auto_11427 ) ) ( HOIST-AT ?auto_11414 ?auto_11427 ) ( not ( = ?auto_11423 ?auto_11414 ) ) ( not ( = ?auto_11419 ?auto_11414 ) ) ( SURFACE-AT ?auto_11411 ?auto_11427 ) ( ON ?auto_11411 ?auto_11426 ) ( CLEAR ?auto_11411 ) ( not ( = ?auto_11410 ?auto_11426 ) ) ( not ( = ?auto_11411 ?auto_11426 ) ) ( not ( = ?auto_11417 ?auto_11426 ) ) ( not ( = ?auto_11415 ?auto_11426 ) ) ( IS-CRATE ?auto_11415 ) ( not ( = ?auto_11410 ?auto_11416 ) ) ( not ( = ?auto_11411 ?auto_11416 ) ) ( not ( = ?auto_11417 ?auto_11416 ) ) ( not ( = ?auto_11415 ?auto_11416 ) ) ( not ( = ?auto_11426 ?auto_11416 ) ) ( not ( = ?auto_11430 ?auto_11428 ) ) ( not ( = ?auto_11418 ?auto_11430 ) ) ( not ( = ?auto_11427 ?auto_11430 ) ) ( HOIST-AT ?auto_11421 ?auto_11430 ) ( not ( = ?auto_11423 ?auto_11421 ) ) ( not ( = ?auto_11419 ?auto_11421 ) ) ( not ( = ?auto_11414 ?auto_11421 ) ) ( AVAILABLE ?auto_11421 ) ( SURFACE-AT ?auto_11415 ?auto_11430 ) ( ON ?auto_11415 ?auto_11413 ) ( CLEAR ?auto_11415 ) ( not ( = ?auto_11410 ?auto_11413 ) ) ( not ( = ?auto_11411 ?auto_11413 ) ) ( not ( = ?auto_11417 ?auto_11413 ) ) ( not ( = ?auto_11415 ?auto_11413 ) ) ( not ( = ?auto_11426 ?auto_11413 ) ) ( not ( = ?auto_11416 ?auto_11413 ) ) ( IS-CRATE ?auto_11416 ) ( not ( = ?auto_11410 ?auto_11425 ) ) ( not ( = ?auto_11411 ?auto_11425 ) ) ( not ( = ?auto_11417 ?auto_11425 ) ) ( not ( = ?auto_11415 ?auto_11425 ) ) ( not ( = ?auto_11426 ?auto_11425 ) ) ( not ( = ?auto_11416 ?auto_11425 ) ) ( not ( = ?auto_11413 ?auto_11425 ) ) ( not ( = ?auto_11424 ?auto_11428 ) ) ( not ( = ?auto_11418 ?auto_11424 ) ) ( not ( = ?auto_11427 ?auto_11424 ) ) ( not ( = ?auto_11430 ?auto_11424 ) ) ( HOIST-AT ?auto_11422 ?auto_11424 ) ( not ( = ?auto_11423 ?auto_11422 ) ) ( not ( = ?auto_11419 ?auto_11422 ) ) ( not ( = ?auto_11414 ?auto_11422 ) ) ( not ( = ?auto_11421 ?auto_11422 ) ) ( AVAILABLE ?auto_11422 ) ( SURFACE-AT ?auto_11416 ?auto_11424 ) ( ON ?auto_11416 ?auto_11412 ) ( CLEAR ?auto_11416 ) ( not ( = ?auto_11410 ?auto_11412 ) ) ( not ( = ?auto_11411 ?auto_11412 ) ) ( not ( = ?auto_11417 ?auto_11412 ) ) ( not ( = ?auto_11415 ?auto_11412 ) ) ( not ( = ?auto_11426 ?auto_11412 ) ) ( not ( = ?auto_11416 ?auto_11412 ) ) ( not ( = ?auto_11413 ?auto_11412 ) ) ( not ( = ?auto_11425 ?auto_11412 ) ) ( SURFACE-AT ?auto_11420 ?auto_11428 ) ( CLEAR ?auto_11420 ) ( IS-CRATE ?auto_11425 ) ( not ( = ?auto_11410 ?auto_11420 ) ) ( not ( = ?auto_11411 ?auto_11420 ) ) ( not ( = ?auto_11417 ?auto_11420 ) ) ( not ( = ?auto_11415 ?auto_11420 ) ) ( not ( = ?auto_11426 ?auto_11420 ) ) ( not ( = ?auto_11416 ?auto_11420 ) ) ( not ( = ?auto_11413 ?auto_11420 ) ) ( not ( = ?auto_11425 ?auto_11420 ) ) ( not ( = ?auto_11412 ?auto_11420 ) ) ( AVAILABLE ?auto_11423 ) ( AVAILABLE ?auto_11414 ) ( SURFACE-AT ?auto_11425 ?auto_11427 ) ( ON ?auto_11425 ?auto_11429 ) ( CLEAR ?auto_11425 ) ( not ( = ?auto_11410 ?auto_11429 ) ) ( not ( = ?auto_11411 ?auto_11429 ) ) ( not ( = ?auto_11417 ?auto_11429 ) ) ( not ( = ?auto_11415 ?auto_11429 ) ) ( not ( = ?auto_11426 ?auto_11429 ) ) ( not ( = ?auto_11416 ?auto_11429 ) ) ( not ( = ?auto_11413 ?auto_11429 ) ) ( not ( = ?auto_11425 ?auto_11429 ) ) ( not ( = ?auto_11412 ?auto_11429 ) ) ( not ( = ?auto_11420 ?auto_11429 ) ) ( TRUCK-AT ?auto_11431 ?auto_11428 ) )
    :subtasks
    ( ( !DRIVE ?auto_11431 ?auto_11428 ?auto_11427 )
      ( MAKE-ON ?auto_11410 ?auto_11411 )
      ( MAKE-ON-VERIFY ?auto_11410 ?auto_11411 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_11434 - SURFACE
      ?auto_11435 - SURFACE
    )
    :vars
    (
      ?auto_11436 - HOIST
      ?auto_11437 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11436 ?auto_11437 ) ( SURFACE-AT ?auto_11435 ?auto_11437 ) ( CLEAR ?auto_11435 ) ( LIFTING ?auto_11436 ?auto_11434 ) ( IS-CRATE ?auto_11434 ) ( not ( = ?auto_11434 ?auto_11435 ) ) )
    :subtasks
    ( ( !DROP ?auto_11436 ?auto_11434 ?auto_11435 ?auto_11437 )
      ( MAKE-ON-VERIFY ?auto_11434 ?auto_11435 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_11438 - SURFACE
      ?auto_11439 - SURFACE
    )
    :vars
    (
      ?auto_11440 - HOIST
      ?auto_11441 - PLACE
      ?auto_11442 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11440 ?auto_11441 ) ( SURFACE-AT ?auto_11439 ?auto_11441 ) ( CLEAR ?auto_11439 ) ( IS-CRATE ?auto_11438 ) ( not ( = ?auto_11438 ?auto_11439 ) ) ( TRUCK-AT ?auto_11442 ?auto_11441 ) ( AVAILABLE ?auto_11440 ) ( IN ?auto_11438 ?auto_11442 ) )
    :subtasks
    ( ( !UNLOAD ?auto_11440 ?auto_11438 ?auto_11442 ?auto_11441 )
      ( MAKE-ON ?auto_11438 ?auto_11439 )
      ( MAKE-ON-VERIFY ?auto_11438 ?auto_11439 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_11443 - SURFACE
      ?auto_11444 - SURFACE
    )
    :vars
    (
      ?auto_11447 - HOIST
      ?auto_11445 - PLACE
      ?auto_11446 - TRUCK
      ?auto_11448 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11447 ?auto_11445 ) ( SURFACE-AT ?auto_11444 ?auto_11445 ) ( CLEAR ?auto_11444 ) ( IS-CRATE ?auto_11443 ) ( not ( = ?auto_11443 ?auto_11444 ) ) ( AVAILABLE ?auto_11447 ) ( IN ?auto_11443 ?auto_11446 ) ( TRUCK-AT ?auto_11446 ?auto_11448 ) ( not ( = ?auto_11448 ?auto_11445 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_11446 ?auto_11448 ?auto_11445 )
      ( MAKE-ON ?auto_11443 ?auto_11444 )
      ( MAKE-ON-VERIFY ?auto_11443 ?auto_11444 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_11449 - SURFACE
      ?auto_11450 - SURFACE
    )
    :vars
    (
      ?auto_11452 - HOIST
      ?auto_11454 - PLACE
      ?auto_11453 - TRUCK
      ?auto_11451 - PLACE
      ?auto_11455 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_11452 ?auto_11454 ) ( SURFACE-AT ?auto_11450 ?auto_11454 ) ( CLEAR ?auto_11450 ) ( IS-CRATE ?auto_11449 ) ( not ( = ?auto_11449 ?auto_11450 ) ) ( AVAILABLE ?auto_11452 ) ( TRUCK-AT ?auto_11453 ?auto_11451 ) ( not ( = ?auto_11451 ?auto_11454 ) ) ( HOIST-AT ?auto_11455 ?auto_11451 ) ( LIFTING ?auto_11455 ?auto_11449 ) ( not ( = ?auto_11452 ?auto_11455 ) ) )
    :subtasks
    ( ( !LOAD ?auto_11455 ?auto_11449 ?auto_11453 ?auto_11451 )
      ( MAKE-ON ?auto_11449 ?auto_11450 )
      ( MAKE-ON-VERIFY ?auto_11449 ?auto_11450 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_11456 - SURFACE
      ?auto_11457 - SURFACE
    )
    :vars
    (
      ?auto_11460 - HOIST
      ?auto_11461 - PLACE
      ?auto_11459 - TRUCK
      ?auto_11458 - PLACE
      ?auto_11462 - HOIST
      ?auto_11463 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11460 ?auto_11461 ) ( SURFACE-AT ?auto_11457 ?auto_11461 ) ( CLEAR ?auto_11457 ) ( IS-CRATE ?auto_11456 ) ( not ( = ?auto_11456 ?auto_11457 ) ) ( AVAILABLE ?auto_11460 ) ( TRUCK-AT ?auto_11459 ?auto_11458 ) ( not ( = ?auto_11458 ?auto_11461 ) ) ( HOIST-AT ?auto_11462 ?auto_11458 ) ( not ( = ?auto_11460 ?auto_11462 ) ) ( AVAILABLE ?auto_11462 ) ( SURFACE-AT ?auto_11456 ?auto_11458 ) ( ON ?auto_11456 ?auto_11463 ) ( CLEAR ?auto_11456 ) ( not ( = ?auto_11456 ?auto_11463 ) ) ( not ( = ?auto_11457 ?auto_11463 ) ) )
    :subtasks
    ( ( !LIFT ?auto_11462 ?auto_11456 ?auto_11463 ?auto_11458 )
      ( MAKE-ON ?auto_11456 ?auto_11457 )
      ( MAKE-ON-VERIFY ?auto_11456 ?auto_11457 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_11464 - SURFACE
      ?auto_11465 - SURFACE
    )
    :vars
    (
      ?auto_11468 - HOIST
      ?auto_11469 - PLACE
      ?auto_11466 - PLACE
      ?auto_11470 - HOIST
      ?auto_11467 - SURFACE
      ?auto_11471 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11468 ?auto_11469 ) ( SURFACE-AT ?auto_11465 ?auto_11469 ) ( CLEAR ?auto_11465 ) ( IS-CRATE ?auto_11464 ) ( not ( = ?auto_11464 ?auto_11465 ) ) ( AVAILABLE ?auto_11468 ) ( not ( = ?auto_11466 ?auto_11469 ) ) ( HOIST-AT ?auto_11470 ?auto_11466 ) ( not ( = ?auto_11468 ?auto_11470 ) ) ( AVAILABLE ?auto_11470 ) ( SURFACE-AT ?auto_11464 ?auto_11466 ) ( ON ?auto_11464 ?auto_11467 ) ( CLEAR ?auto_11464 ) ( not ( = ?auto_11464 ?auto_11467 ) ) ( not ( = ?auto_11465 ?auto_11467 ) ) ( TRUCK-AT ?auto_11471 ?auto_11469 ) )
    :subtasks
    ( ( !DRIVE ?auto_11471 ?auto_11469 ?auto_11466 )
      ( MAKE-ON ?auto_11464 ?auto_11465 )
      ( MAKE-ON-VERIFY ?auto_11464 ?auto_11465 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_11472 - SURFACE
      ?auto_11473 - SURFACE
    )
    :vars
    (
      ?auto_11475 - HOIST
      ?auto_11474 - PLACE
      ?auto_11479 - PLACE
      ?auto_11476 - HOIST
      ?auto_11478 - SURFACE
      ?auto_11477 - TRUCK
      ?auto_11480 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11475 ?auto_11474 ) ( IS-CRATE ?auto_11472 ) ( not ( = ?auto_11472 ?auto_11473 ) ) ( not ( = ?auto_11479 ?auto_11474 ) ) ( HOIST-AT ?auto_11476 ?auto_11479 ) ( not ( = ?auto_11475 ?auto_11476 ) ) ( AVAILABLE ?auto_11476 ) ( SURFACE-AT ?auto_11472 ?auto_11479 ) ( ON ?auto_11472 ?auto_11478 ) ( CLEAR ?auto_11472 ) ( not ( = ?auto_11472 ?auto_11478 ) ) ( not ( = ?auto_11473 ?auto_11478 ) ) ( TRUCK-AT ?auto_11477 ?auto_11474 ) ( SURFACE-AT ?auto_11480 ?auto_11474 ) ( CLEAR ?auto_11480 ) ( LIFTING ?auto_11475 ?auto_11473 ) ( IS-CRATE ?auto_11473 ) ( not ( = ?auto_11472 ?auto_11480 ) ) ( not ( = ?auto_11473 ?auto_11480 ) ) ( not ( = ?auto_11478 ?auto_11480 ) ) )
    :subtasks
    ( ( !DROP ?auto_11475 ?auto_11473 ?auto_11480 ?auto_11474 )
      ( MAKE-ON ?auto_11472 ?auto_11473 )
      ( MAKE-ON-VERIFY ?auto_11472 ?auto_11473 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_11481 - SURFACE
      ?auto_11482 - SURFACE
    )
    :vars
    (
      ?auto_11484 - HOIST
      ?auto_11488 - PLACE
      ?auto_11483 - PLACE
      ?auto_11485 - HOIST
      ?auto_11486 - SURFACE
      ?auto_11487 - TRUCK
      ?auto_11489 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11484 ?auto_11488 ) ( IS-CRATE ?auto_11481 ) ( not ( = ?auto_11481 ?auto_11482 ) ) ( not ( = ?auto_11483 ?auto_11488 ) ) ( HOIST-AT ?auto_11485 ?auto_11483 ) ( not ( = ?auto_11484 ?auto_11485 ) ) ( AVAILABLE ?auto_11485 ) ( SURFACE-AT ?auto_11481 ?auto_11483 ) ( ON ?auto_11481 ?auto_11486 ) ( CLEAR ?auto_11481 ) ( not ( = ?auto_11481 ?auto_11486 ) ) ( not ( = ?auto_11482 ?auto_11486 ) ) ( TRUCK-AT ?auto_11487 ?auto_11488 ) ( SURFACE-AT ?auto_11489 ?auto_11488 ) ( CLEAR ?auto_11489 ) ( IS-CRATE ?auto_11482 ) ( not ( = ?auto_11481 ?auto_11489 ) ) ( not ( = ?auto_11482 ?auto_11489 ) ) ( not ( = ?auto_11486 ?auto_11489 ) ) ( AVAILABLE ?auto_11484 ) ( IN ?auto_11482 ?auto_11487 ) )
    :subtasks
    ( ( !UNLOAD ?auto_11484 ?auto_11482 ?auto_11487 ?auto_11488 )
      ( MAKE-ON ?auto_11481 ?auto_11482 )
      ( MAKE-ON-VERIFY ?auto_11481 ?auto_11482 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_11490 - SURFACE
      ?auto_11491 - SURFACE
    )
    :vars
    (
      ?auto_11496 - HOIST
      ?auto_11497 - PLACE
      ?auto_11495 - PLACE
      ?auto_11492 - HOIST
      ?auto_11493 - SURFACE
      ?auto_11498 - SURFACE
      ?auto_11494 - TRUCK
      ?auto_11499 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11496 ?auto_11497 ) ( IS-CRATE ?auto_11490 ) ( not ( = ?auto_11490 ?auto_11491 ) ) ( not ( = ?auto_11495 ?auto_11497 ) ) ( HOIST-AT ?auto_11492 ?auto_11495 ) ( not ( = ?auto_11496 ?auto_11492 ) ) ( AVAILABLE ?auto_11492 ) ( SURFACE-AT ?auto_11490 ?auto_11495 ) ( ON ?auto_11490 ?auto_11493 ) ( CLEAR ?auto_11490 ) ( not ( = ?auto_11490 ?auto_11493 ) ) ( not ( = ?auto_11491 ?auto_11493 ) ) ( SURFACE-AT ?auto_11498 ?auto_11497 ) ( CLEAR ?auto_11498 ) ( IS-CRATE ?auto_11491 ) ( not ( = ?auto_11490 ?auto_11498 ) ) ( not ( = ?auto_11491 ?auto_11498 ) ) ( not ( = ?auto_11493 ?auto_11498 ) ) ( AVAILABLE ?auto_11496 ) ( IN ?auto_11491 ?auto_11494 ) ( TRUCK-AT ?auto_11494 ?auto_11499 ) ( not ( = ?auto_11499 ?auto_11497 ) ) ( not ( = ?auto_11495 ?auto_11499 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_11494 ?auto_11499 ?auto_11497 )
      ( MAKE-ON ?auto_11490 ?auto_11491 )
      ( MAKE-ON-VERIFY ?auto_11490 ?auto_11491 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_11500 - SURFACE
      ?auto_11501 - SURFACE
    )
    :vars
    (
      ?auto_11506 - HOIST
      ?auto_11507 - PLACE
      ?auto_11505 - PLACE
      ?auto_11509 - HOIST
      ?auto_11503 - SURFACE
      ?auto_11502 - SURFACE
      ?auto_11504 - TRUCK
      ?auto_11508 - PLACE
      ?auto_11510 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_11506 ?auto_11507 ) ( IS-CRATE ?auto_11500 ) ( not ( = ?auto_11500 ?auto_11501 ) ) ( not ( = ?auto_11505 ?auto_11507 ) ) ( HOIST-AT ?auto_11509 ?auto_11505 ) ( not ( = ?auto_11506 ?auto_11509 ) ) ( AVAILABLE ?auto_11509 ) ( SURFACE-AT ?auto_11500 ?auto_11505 ) ( ON ?auto_11500 ?auto_11503 ) ( CLEAR ?auto_11500 ) ( not ( = ?auto_11500 ?auto_11503 ) ) ( not ( = ?auto_11501 ?auto_11503 ) ) ( SURFACE-AT ?auto_11502 ?auto_11507 ) ( CLEAR ?auto_11502 ) ( IS-CRATE ?auto_11501 ) ( not ( = ?auto_11500 ?auto_11502 ) ) ( not ( = ?auto_11501 ?auto_11502 ) ) ( not ( = ?auto_11503 ?auto_11502 ) ) ( AVAILABLE ?auto_11506 ) ( TRUCK-AT ?auto_11504 ?auto_11508 ) ( not ( = ?auto_11508 ?auto_11507 ) ) ( not ( = ?auto_11505 ?auto_11508 ) ) ( HOIST-AT ?auto_11510 ?auto_11508 ) ( LIFTING ?auto_11510 ?auto_11501 ) ( not ( = ?auto_11506 ?auto_11510 ) ) ( not ( = ?auto_11509 ?auto_11510 ) ) )
    :subtasks
    ( ( !LOAD ?auto_11510 ?auto_11501 ?auto_11504 ?auto_11508 )
      ( MAKE-ON ?auto_11500 ?auto_11501 )
      ( MAKE-ON-VERIFY ?auto_11500 ?auto_11501 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_11511 - SURFACE
      ?auto_11512 - SURFACE
    )
    :vars
    (
      ?auto_11518 - HOIST
      ?auto_11517 - PLACE
      ?auto_11514 - PLACE
      ?auto_11513 - HOIST
      ?auto_11519 - SURFACE
      ?auto_11521 - SURFACE
      ?auto_11516 - TRUCK
      ?auto_11515 - PLACE
      ?auto_11520 - HOIST
      ?auto_11522 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11518 ?auto_11517 ) ( IS-CRATE ?auto_11511 ) ( not ( = ?auto_11511 ?auto_11512 ) ) ( not ( = ?auto_11514 ?auto_11517 ) ) ( HOIST-AT ?auto_11513 ?auto_11514 ) ( not ( = ?auto_11518 ?auto_11513 ) ) ( AVAILABLE ?auto_11513 ) ( SURFACE-AT ?auto_11511 ?auto_11514 ) ( ON ?auto_11511 ?auto_11519 ) ( CLEAR ?auto_11511 ) ( not ( = ?auto_11511 ?auto_11519 ) ) ( not ( = ?auto_11512 ?auto_11519 ) ) ( SURFACE-AT ?auto_11521 ?auto_11517 ) ( CLEAR ?auto_11521 ) ( IS-CRATE ?auto_11512 ) ( not ( = ?auto_11511 ?auto_11521 ) ) ( not ( = ?auto_11512 ?auto_11521 ) ) ( not ( = ?auto_11519 ?auto_11521 ) ) ( AVAILABLE ?auto_11518 ) ( TRUCK-AT ?auto_11516 ?auto_11515 ) ( not ( = ?auto_11515 ?auto_11517 ) ) ( not ( = ?auto_11514 ?auto_11515 ) ) ( HOIST-AT ?auto_11520 ?auto_11515 ) ( not ( = ?auto_11518 ?auto_11520 ) ) ( not ( = ?auto_11513 ?auto_11520 ) ) ( AVAILABLE ?auto_11520 ) ( SURFACE-AT ?auto_11512 ?auto_11515 ) ( ON ?auto_11512 ?auto_11522 ) ( CLEAR ?auto_11512 ) ( not ( = ?auto_11511 ?auto_11522 ) ) ( not ( = ?auto_11512 ?auto_11522 ) ) ( not ( = ?auto_11519 ?auto_11522 ) ) ( not ( = ?auto_11521 ?auto_11522 ) ) )
    :subtasks
    ( ( !LIFT ?auto_11520 ?auto_11512 ?auto_11522 ?auto_11515 )
      ( MAKE-ON ?auto_11511 ?auto_11512 )
      ( MAKE-ON-VERIFY ?auto_11511 ?auto_11512 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_11523 - SURFACE
      ?auto_11524 - SURFACE
    )
    :vars
    (
      ?auto_11526 - HOIST
      ?auto_11525 - PLACE
      ?auto_11530 - PLACE
      ?auto_11528 - HOIST
      ?auto_11533 - SURFACE
      ?auto_11529 - SURFACE
      ?auto_11532 - PLACE
      ?auto_11531 - HOIST
      ?auto_11534 - SURFACE
      ?auto_11527 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11526 ?auto_11525 ) ( IS-CRATE ?auto_11523 ) ( not ( = ?auto_11523 ?auto_11524 ) ) ( not ( = ?auto_11530 ?auto_11525 ) ) ( HOIST-AT ?auto_11528 ?auto_11530 ) ( not ( = ?auto_11526 ?auto_11528 ) ) ( AVAILABLE ?auto_11528 ) ( SURFACE-AT ?auto_11523 ?auto_11530 ) ( ON ?auto_11523 ?auto_11533 ) ( CLEAR ?auto_11523 ) ( not ( = ?auto_11523 ?auto_11533 ) ) ( not ( = ?auto_11524 ?auto_11533 ) ) ( SURFACE-AT ?auto_11529 ?auto_11525 ) ( CLEAR ?auto_11529 ) ( IS-CRATE ?auto_11524 ) ( not ( = ?auto_11523 ?auto_11529 ) ) ( not ( = ?auto_11524 ?auto_11529 ) ) ( not ( = ?auto_11533 ?auto_11529 ) ) ( AVAILABLE ?auto_11526 ) ( not ( = ?auto_11532 ?auto_11525 ) ) ( not ( = ?auto_11530 ?auto_11532 ) ) ( HOIST-AT ?auto_11531 ?auto_11532 ) ( not ( = ?auto_11526 ?auto_11531 ) ) ( not ( = ?auto_11528 ?auto_11531 ) ) ( AVAILABLE ?auto_11531 ) ( SURFACE-AT ?auto_11524 ?auto_11532 ) ( ON ?auto_11524 ?auto_11534 ) ( CLEAR ?auto_11524 ) ( not ( = ?auto_11523 ?auto_11534 ) ) ( not ( = ?auto_11524 ?auto_11534 ) ) ( not ( = ?auto_11533 ?auto_11534 ) ) ( not ( = ?auto_11529 ?auto_11534 ) ) ( TRUCK-AT ?auto_11527 ?auto_11525 ) )
    :subtasks
    ( ( !DRIVE ?auto_11527 ?auto_11525 ?auto_11532 )
      ( MAKE-ON ?auto_11523 ?auto_11524 )
      ( MAKE-ON-VERIFY ?auto_11523 ?auto_11524 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_11535 - SURFACE
      ?auto_11536 - SURFACE
    )
    :vars
    (
      ?auto_11543 - HOIST
      ?auto_11539 - PLACE
      ?auto_11538 - PLACE
      ?auto_11540 - HOIST
      ?auto_11546 - SURFACE
      ?auto_11537 - SURFACE
      ?auto_11541 - PLACE
      ?auto_11545 - HOIST
      ?auto_11544 - SURFACE
      ?auto_11542 - TRUCK
      ?auto_11547 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11543 ?auto_11539 ) ( IS-CRATE ?auto_11535 ) ( not ( = ?auto_11535 ?auto_11536 ) ) ( not ( = ?auto_11538 ?auto_11539 ) ) ( HOIST-AT ?auto_11540 ?auto_11538 ) ( not ( = ?auto_11543 ?auto_11540 ) ) ( AVAILABLE ?auto_11540 ) ( SURFACE-AT ?auto_11535 ?auto_11538 ) ( ON ?auto_11535 ?auto_11546 ) ( CLEAR ?auto_11535 ) ( not ( = ?auto_11535 ?auto_11546 ) ) ( not ( = ?auto_11536 ?auto_11546 ) ) ( IS-CRATE ?auto_11536 ) ( not ( = ?auto_11535 ?auto_11537 ) ) ( not ( = ?auto_11536 ?auto_11537 ) ) ( not ( = ?auto_11546 ?auto_11537 ) ) ( not ( = ?auto_11541 ?auto_11539 ) ) ( not ( = ?auto_11538 ?auto_11541 ) ) ( HOIST-AT ?auto_11545 ?auto_11541 ) ( not ( = ?auto_11543 ?auto_11545 ) ) ( not ( = ?auto_11540 ?auto_11545 ) ) ( AVAILABLE ?auto_11545 ) ( SURFACE-AT ?auto_11536 ?auto_11541 ) ( ON ?auto_11536 ?auto_11544 ) ( CLEAR ?auto_11536 ) ( not ( = ?auto_11535 ?auto_11544 ) ) ( not ( = ?auto_11536 ?auto_11544 ) ) ( not ( = ?auto_11546 ?auto_11544 ) ) ( not ( = ?auto_11537 ?auto_11544 ) ) ( TRUCK-AT ?auto_11542 ?auto_11539 ) ( SURFACE-AT ?auto_11547 ?auto_11539 ) ( CLEAR ?auto_11547 ) ( LIFTING ?auto_11543 ?auto_11537 ) ( IS-CRATE ?auto_11537 ) ( not ( = ?auto_11535 ?auto_11547 ) ) ( not ( = ?auto_11536 ?auto_11547 ) ) ( not ( = ?auto_11546 ?auto_11547 ) ) ( not ( = ?auto_11537 ?auto_11547 ) ) ( not ( = ?auto_11544 ?auto_11547 ) ) )
    :subtasks
    ( ( !DROP ?auto_11543 ?auto_11537 ?auto_11547 ?auto_11539 )
      ( MAKE-ON ?auto_11535 ?auto_11536 )
      ( MAKE-ON-VERIFY ?auto_11535 ?auto_11536 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_11548 - SURFACE
      ?auto_11549 - SURFACE
    )
    :vars
    (
      ?auto_11553 - HOIST
      ?auto_11550 - PLACE
      ?auto_11555 - PLACE
      ?auto_11556 - HOIST
      ?auto_11552 - SURFACE
      ?auto_11559 - SURFACE
      ?auto_11557 - PLACE
      ?auto_11558 - HOIST
      ?auto_11551 - SURFACE
      ?auto_11554 - TRUCK
      ?auto_11560 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11553 ?auto_11550 ) ( IS-CRATE ?auto_11548 ) ( not ( = ?auto_11548 ?auto_11549 ) ) ( not ( = ?auto_11555 ?auto_11550 ) ) ( HOIST-AT ?auto_11556 ?auto_11555 ) ( not ( = ?auto_11553 ?auto_11556 ) ) ( AVAILABLE ?auto_11556 ) ( SURFACE-AT ?auto_11548 ?auto_11555 ) ( ON ?auto_11548 ?auto_11552 ) ( CLEAR ?auto_11548 ) ( not ( = ?auto_11548 ?auto_11552 ) ) ( not ( = ?auto_11549 ?auto_11552 ) ) ( IS-CRATE ?auto_11549 ) ( not ( = ?auto_11548 ?auto_11559 ) ) ( not ( = ?auto_11549 ?auto_11559 ) ) ( not ( = ?auto_11552 ?auto_11559 ) ) ( not ( = ?auto_11557 ?auto_11550 ) ) ( not ( = ?auto_11555 ?auto_11557 ) ) ( HOIST-AT ?auto_11558 ?auto_11557 ) ( not ( = ?auto_11553 ?auto_11558 ) ) ( not ( = ?auto_11556 ?auto_11558 ) ) ( AVAILABLE ?auto_11558 ) ( SURFACE-AT ?auto_11549 ?auto_11557 ) ( ON ?auto_11549 ?auto_11551 ) ( CLEAR ?auto_11549 ) ( not ( = ?auto_11548 ?auto_11551 ) ) ( not ( = ?auto_11549 ?auto_11551 ) ) ( not ( = ?auto_11552 ?auto_11551 ) ) ( not ( = ?auto_11559 ?auto_11551 ) ) ( TRUCK-AT ?auto_11554 ?auto_11550 ) ( SURFACE-AT ?auto_11560 ?auto_11550 ) ( CLEAR ?auto_11560 ) ( IS-CRATE ?auto_11559 ) ( not ( = ?auto_11548 ?auto_11560 ) ) ( not ( = ?auto_11549 ?auto_11560 ) ) ( not ( = ?auto_11552 ?auto_11560 ) ) ( not ( = ?auto_11559 ?auto_11560 ) ) ( not ( = ?auto_11551 ?auto_11560 ) ) ( AVAILABLE ?auto_11553 ) ( IN ?auto_11559 ?auto_11554 ) )
    :subtasks
    ( ( !UNLOAD ?auto_11553 ?auto_11559 ?auto_11554 ?auto_11550 )
      ( MAKE-ON ?auto_11548 ?auto_11549 )
      ( MAKE-ON-VERIFY ?auto_11548 ?auto_11549 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_11561 - SURFACE
      ?auto_11562 - SURFACE
    )
    :vars
    (
      ?auto_11565 - HOIST
      ?auto_11573 - PLACE
      ?auto_11564 - PLACE
      ?auto_11570 - HOIST
      ?auto_11563 - SURFACE
      ?auto_11571 - SURFACE
      ?auto_11572 - PLACE
      ?auto_11569 - HOIST
      ?auto_11566 - SURFACE
      ?auto_11568 - SURFACE
      ?auto_11567 - TRUCK
      ?auto_11574 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11565 ?auto_11573 ) ( IS-CRATE ?auto_11561 ) ( not ( = ?auto_11561 ?auto_11562 ) ) ( not ( = ?auto_11564 ?auto_11573 ) ) ( HOIST-AT ?auto_11570 ?auto_11564 ) ( not ( = ?auto_11565 ?auto_11570 ) ) ( AVAILABLE ?auto_11570 ) ( SURFACE-AT ?auto_11561 ?auto_11564 ) ( ON ?auto_11561 ?auto_11563 ) ( CLEAR ?auto_11561 ) ( not ( = ?auto_11561 ?auto_11563 ) ) ( not ( = ?auto_11562 ?auto_11563 ) ) ( IS-CRATE ?auto_11562 ) ( not ( = ?auto_11561 ?auto_11571 ) ) ( not ( = ?auto_11562 ?auto_11571 ) ) ( not ( = ?auto_11563 ?auto_11571 ) ) ( not ( = ?auto_11572 ?auto_11573 ) ) ( not ( = ?auto_11564 ?auto_11572 ) ) ( HOIST-AT ?auto_11569 ?auto_11572 ) ( not ( = ?auto_11565 ?auto_11569 ) ) ( not ( = ?auto_11570 ?auto_11569 ) ) ( AVAILABLE ?auto_11569 ) ( SURFACE-AT ?auto_11562 ?auto_11572 ) ( ON ?auto_11562 ?auto_11566 ) ( CLEAR ?auto_11562 ) ( not ( = ?auto_11561 ?auto_11566 ) ) ( not ( = ?auto_11562 ?auto_11566 ) ) ( not ( = ?auto_11563 ?auto_11566 ) ) ( not ( = ?auto_11571 ?auto_11566 ) ) ( SURFACE-AT ?auto_11568 ?auto_11573 ) ( CLEAR ?auto_11568 ) ( IS-CRATE ?auto_11571 ) ( not ( = ?auto_11561 ?auto_11568 ) ) ( not ( = ?auto_11562 ?auto_11568 ) ) ( not ( = ?auto_11563 ?auto_11568 ) ) ( not ( = ?auto_11571 ?auto_11568 ) ) ( not ( = ?auto_11566 ?auto_11568 ) ) ( AVAILABLE ?auto_11565 ) ( IN ?auto_11571 ?auto_11567 ) ( TRUCK-AT ?auto_11567 ?auto_11574 ) ( not ( = ?auto_11574 ?auto_11573 ) ) ( not ( = ?auto_11564 ?auto_11574 ) ) ( not ( = ?auto_11572 ?auto_11574 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_11567 ?auto_11574 ?auto_11573 )
      ( MAKE-ON ?auto_11561 ?auto_11562 )
      ( MAKE-ON-VERIFY ?auto_11561 ?auto_11562 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_11575 - SURFACE
      ?auto_11576 - SURFACE
    )
    :vars
    (
      ?auto_11586 - HOIST
      ?auto_11580 - PLACE
      ?auto_11577 - PLACE
      ?auto_11584 - HOIST
      ?auto_11578 - SURFACE
      ?auto_11581 - SURFACE
      ?auto_11585 - PLACE
      ?auto_11587 - HOIST
      ?auto_11579 - SURFACE
      ?auto_11583 - SURFACE
      ?auto_11582 - TRUCK
      ?auto_11588 - PLACE
      ?auto_11589 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_11586 ?auto_11580 ) ( IS-CRATE ?auto_11575 ) ( not ( = ?auto_11575 ?auto_11576 ) ) ( not ( = ?auto_11577 ?auto_11580 ) ) ( HOIST-AT ?auto_11584 ?auto_11577 ) ( not ( = ?auto_11586 ?auto_11584 ) ) ( AVAILABLE ?auto_11584 ) ( SURFACE-AT ?auto_11575 ?auto_11577 ) ( ON ?auto_11575 ?auto_11578 ) ( CLEAR ?auto_11575 ) ( not ( = ?auto_11575 ?auto_11578 ) ) ( not ( = ?auto_11576 ?auto_11578 ) ) ( IS-CRATE ?auto_11576 ) ( not ( = ?auto_11575 ?auto_11581 ) ) ( not ( = ?auto_11576 ?auto_11581 ) ) ( not ( = ?auto_11578 ?auto_11581 ) ) ( not ( = ?auto_11585 ?auto_11580 ) ) ( not ( = ?auto_11577 ?auto_11585 ) ) ( HOIST-AT ?auto_11587 ?auto_11585 ) ( not ( = ?auto_11586 ?auto_11587 ) ) ( not ( = ?auto_11584 ?auto_11587 ) ) ( AVAILABLE ?auto_11587 ) ( SURFACE-AT ?auto_11576 ?auto_11585 ) ( ON ?auto_11576 ?auto_11579 ) ( CLEAR ?auto_11576 ) ( not ( = ?auto_11575 ?auto_11579 ) ) ( not ( = ?auto_11576 ?auto_11579 ) ) ( not ( = ?auto_11578 ?auto_11579 ) ) ( not ( = ?auto_11581 ?auto_11579 ) ) ( SURFACE-AT ?auto_11583 ?auto_11580 ) ( CLEAR ?auto_11583 ) ( IS-CRATE ?auto_11581 ) ( not ( = ?auto_11575 ?auto_11583 ) ) ( not ( = ?auto_11576 ?auto_11583 ) ) ( not ( = ?auto_11578 ?auto_11583 ) ) ( not ( = ?auto_11581 ?auto_11583 ) ) ( not ( = ?auto_11579 ?auto_11583 ) ) ( AVAILABLE ?auto_11586 ) ( TRUCK-AT ?auto_11582 ?auto_11588 ) ( not ( = ?auto_11588 ?auto_11580 ) ) ( not ( = ?auto_11577 ?auto_11588 ) ) ( not ( = ?auto_11585 ?auto_11588 ) ) ( HOIST-AT ?auto_11589 ?auto_11588 ) ( LIFTING ?auto_11589 ?auto_11581 ) ( not ( = ?auto_11586 ?auto_11589 ) ) ( not ( = ?auto_11584 ?auto_11589 ) ) ( not ( = ?auto_11587 ?auto_11589 ) ) )
    :subtasks
    ( ( !LOAD ?auto_11589 ?auto_11581 ?auto_11582 ?auto_11588 )
      ( MAKE-ON ?auto_11575 ?auto_11576 )
      ( MAKE-ON-VERIFY ?auto_11575 ?auto_11576 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_11590 - SURFACE
      ?auto_11591 - SURFACE
    )
    :vars
    (
      ?auto_11599 - HOIST
      ?auto_11597 - PLACE
      ?auto_11593 - PLACE
      ?auto_11594 - HOIST
      ?auto_11598 - SURFACE
      ?auto_11595 - SURFACE
      ?auto_11603 - PLACE
      ?auto_11596 - HOIST
      ?auto_11600 - SURFACE
      ?auto_11602 - SURFACE
      ?auto_11604 - TRUCK
      ?auto_11592 - PLACE
      ?auto_11601 - HOIST
      ?auto_11605 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11599 ?auto_11597 ) ( IS-CRATE ?auto_11590 ) ( not ( = ?auto_11590 ?auto_11591 ) ) ( not ( = ?auto_11593 ?auto_11597 ) ) ( HOIST-AT ?auto_11594 ?auto_11593 ) ( not ( = ?auto_11599 ?auto_11594 ) ) ( AVAILABLE ?auto_11594 ) ( SURFACE-AT ?auto_11590 ?auto_11593 ) ( ON ?auto_11590 ?auto_11598 ) ( CLEAR ?auto_11590 ) ( not ( = ?auto_11590 ?auto_11598 ) ) ( not ( = ?auto_11591 ?auto_11598 ) ) ( IS-CRATE ?auto_11591 ) ( not ( = ?auto_11590 ?auto_11595 ) ) ( not ( = ?auto_11591 ?auto_11595 ) ) ( not ( = ?auto_11598 ?auto_11595 ) ) ( not ( = ?auto_11603 ?auto_11597 ) ) ( not ( = ?auto_11593 ?auto_11603 ) ) ( HOIST-AT ?auto_11596 ?auto_11603 ) ( not ( = ?auto_11599 ?auto_11596 ) ) ( not ( = ?auto_11594 ?auto_11596 ) ) ( AVAILABLE ?auto_11596 ) ( SURFACE-AT ?auto_11591 ?auto_11603 ) ( ON ?auto_11591 ?auto_11600 ) ( CLEAR ?auto_11591 ) ( not ( = ?auto_11590 ?auto_11600 ) ) ( not ( = ?auto_11591 ?auto_11600 ) ) ( not ( = ?auto_11598 ?auto_11600 ) ) ( not ( = ?auto_11595 ?auto_11600 ) ) ( SURFACE-AT ?auto_11602 ?auto_11597 ) ( CLEAR ?auto_11602 ) ( IS-CRATE ?auto_11595 ) ( not ( = ?auto_11590 ?auto_11602 ) ) ( not ( = ?auto_11591 ?auto_11602 ) ) ( not ( = ?auto_11598 ?auto_11602 ) ) ( not ( = ?auto_11595 ?auto_11602 ) ) ( not ( = ?auto_11600 ?auto_11602 ) ) ( AVAILABLE ?auto_11599 ) ( TRUCK-AT ?auto_11604 ?auto_11592 ) ( not ( = ?auto_11592 ?auto_11597 ) ) ( not ( = ?auto_11593 ?auto_11592 ) ) ( not ( = ?auto_11603 ?auto_11592 ) ) ( HOIST-AT ?auto_11601 ?auto_11592 ) ( not ( = ?auto_11599 ?auto_11601 ) ) ( not ( = ?auto_11594 ?auto_11601 ) ) ( not ( = ?auto_11596 ?auto_11601 ) ) ( AVAILABLE ?auto_11601 ) ( SURFACE-AT ?auto_11595 ?auto_11592 ) ( ON ?auto_11595 ?auto_11605 ) ( CLEAR ?auto_11595 ) ( not ( = ?auto_11590 ?auto_11605 ) ) ( not ( = ?auto_11591 ?auto_11605 ) ) ( not ( = ?auto_11598 ?auto_11605 ) ) ( not ( = ?auto_11595 ?auto_11605 ) ) ( not ( = ?auto_11600 ?auto_11605 ) ) ( not ( = ?auto_11602 ?auto_11605 ) ) )
    :subtasks
    ( ( !LIFT ?auto_11601 ?auto_11595 ?auto_11605 ?auto_11592 )
      ( MAKE-ON ?auto_11590 ?auto_11591 )
      ( MAKE-ON-VERIFY ?auto_11590 ?auto_11591 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_11606 - SURFACE
      ?auto_11607 - SURFACE
    )
    :vars
    (
      ?auto_11609 - HOIST
      ?auto_11615 - PLACE
      ?auto_11614 - PLACE
      ?auto_11613 - HOIST
      ?auto_11610 - SURFACE
      ?auto_11618 - SURFACE
      ?auto_11616 - PLACE
      ?auto_11608 - HOIST
      ?auto_11619 - SURFACE
      ?auto_11617 - SURFACE
      ?auto_11620 - PLACE
      ?auto_11612 - HOIST
      ?auto_11621 - SURFACE
      ?auto_11611 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11609 ?auto_11615 ) ( IS-CRATE ?auto_11606 ) ( not ( = ?auto_11606 ?auto_11607 ) ) ( not ( = ?auto_11614 ?auto_11615 ) ) ( HOIST-AT ?auto_11613 ?auto_11614 ) ( not ( = ?auto_11609 ?auto_11613 ) ) ( AVAILABLE ?auto_11613 ) ( SURFACE-AT ?auto_11606 ?auto_11614 ) ( ON ?auto_11606 ?auto_11610 ) ( CLEAR ?auto_11606 ) ( not ( = ?auto_11606 ?auto_11610 ) ) ( not ( = ?auto_11607 ?auto_11610 ) ) ( IS-CRATE ?auto_11607 ) ( not ( = ?auto_11606 ?auto_11618 ) ) ( not ( = ?auto_11607 ?auto_11618 ) ) ( not ( = ?auto_11610 ?auto_11618 ) ) ( not ( = ?auto_11616 ?auto_11615 ) ) ( not ( = ?auto_11614 ?auto_11616 ) ) ( HOIST-AT ?auto_11608 ?auto_11616 ) ( not ( = ?auto_11609 ?auto_11608 ) ) ( not ( = ?auto_11613 ?auto_11608 ) ) ( AVAILABLE ?auto_11608 ) ( SURFACE-AT ?auto_11607 ?auto_11616 ) ( ON ?auto_11607 ?auto_11619 ) ( CLEAR ?auto_11607 ) ( not ( = ?auto_11606 ?auto_11619 ) ) ( not ( = ?auto_11607 ?auto_11619 ) ) ( not ( = ?auto_11610 ?auto_11619 ) ) ( not ( = ?auto_11618 ?auto_11619 ) ) ( SURFACE-AT ?auto_11617 ?auto_11615 ) ( CLEAR ?auto_11617 ) ( IS-CRATE ?auto_11618 ) ( not ( = ?auto_11606 ?auto_11617 ) ) ( not ( = ?auto_11607 ?auto_11617 ) ) ( not ( = ?auto_11610 ?auto_11617 ) ) ( not ( = ?auto_11618 ?auto_11617 ) ) ( not ( = ?auto_11619 ?auto_11617 ) ) ( AVAILABLE ?auto_11609 ) ( not ( = ?auto_11620 ?auto_11615 ) ) ( not ( = ?auto_11614 ?auto_11620 ) ) ( not ( = ?auto_11616 ?auto_11620 ) ) ( HOIST-AT ?auto_11612 ?auto_11620 ) ( not ( = ?auto_11609 ?auto_11612 ) ) ( not ( = ?auto_11613 ?auto_11612 ) ) ( not ( = ?auto_11608 ?auto_11612 ) ) ( AVAILABLE ?auto_11612 ) ( SURFACE-AT ?auto_11618 ?auto_11620 ) ( ON ?auto_11618 ?auto_11621 ) ( CLEAR ?auto_11618 ) ( not ( = ?auto_11606 ?auto_11621 ) ) ( not ( = ?auto_11607 ?auto_11621 ) ) ( not ( = ?auto_11610 ?auto_11621 ) ) ( not ( = ?auto_11618 ?auto_11621 ) ) ( not ( = ?auto_11619 ?auto_11621 ) ) ( not ( = ?auto_11617 ?auto_11621 ) ) ( TRUCK-AT ?auto_11611 ?auto_11615 ) )
    :subtasks
    ( ( !DRIVE ?auto_11611 ?auto_11615 ?auto_11620 )
      ( MAKE-ON ?auto_11606 ?auto_11607 )
      ( MAKE-ON-VERIFY ?auto_11606 ?auto_11607 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_11622 - SURFACE
      ?auto_11623 - SURFACE
    )
    :vars
    (
      ?auto_11632 - HOIST
      ?auto_11625 - PLACE
      ?auto_11630 - PLACE
      ?auto_11624 - HOIST
      ?auto_11631 - SURFACE
      ?auto_11626 - SURFACE
      ?auto_11636 - PLACE
      ?auto_11637 - HOIST
      ?auto_11633 - SURFACE
      ?auto_11627 - SURFACE
      ?auto_11629 - PLACE
      ?auto_11628 - HOIST
      ?auto_11634 - SURFACE
      ?auto_11635 - TRUCK
      ?auto_11638 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11632 ?auto_11625 ) ( IS-CRATE ?auto_11622 ) ( not ( = ?auto_11622 ?auto_11623 ) ) ( not ( = ?auto_11630 ?auto_11625 ) ) ( HOIST-AT ?auto_11624 ?auto_11630 ) ( not ( = ?auto_11632 ?auto_11624 ) ) ( AVAILABLE ?auto_11624 ) ( SURFACE-AT ?auto_11622 ?auto_11630 ) ( ON ?auto_11622 ?auto_11631 ) ( CLEAR ?auto_11622 ) ( not ( = ?auto_11622 ?auto_11631 ) ) ( not ( = ?auto_11623 ?auto_11631 ) ) ( IS-CRATE ?auto_11623 ) ( not ( = ?auto_11622 ?auto_11626 ) ) ( not ( = ?auto_11623 ?auto_11626 ) ) ( not ( = ?auto_11631 ?auto_11626 ) ) ( not ( = ?auto_11636 ?auto_11625 ) ) ( not ( = ?auto_11630 ?auto_11636 ) ) ( HOIST-AT ?auto_11637 ?auto_11636 ) ( not ( = ?auto_11632 ?auto_11637 ) ) ( not ( = ?auto_11624 ?auto_11637 ) ) ( AVAILABLE ?auto_11637 ) ( SURFACE-AT ?auto_11623 ?auto_11636 ) ( ON ?auto_11623 ?auto_11633 ) ( CLEAR ?auto_11623 ) ( not ( = ?auto_11622 ?auto_11633 ) ) ( not ( = ?auto_11623 ?auto_11633 ) ) ( not ( = ?auto_11631 ?auto_11633 ) ) ( not ( = ?auto_11626 ?auto_11633 ) ) ( IS-CRATE ?auto_11626 ) ( not ( = ?auto_11622 ?auto_11627 ) ) ( not ( = ?auto_11623 ?auto_11627 ) ) ( not ( = ?auto_11631 ?auto_11627 ) ) ( not ( = ?auto_11626 ?auto_11627 ) ) ( not ( = ?auto_11633 ?auto_11627 ) ) ( not ( = ?auto_11629 ?auto_11625 ) ) ( not ( = ?auto_11630 ?auto_11629 ) ) ( not ( = ?auto_11636 ?auto_11629 ) ) ( HOIST-AT ?auto_11628 ?auto_11629 ) ( not ( = ?auto_11632 ?auto_11628 ) ) ( not ( = ?auto_11624 ?auto_11628 ) ) ( not ( = ?auto_11637 ?auto_11628 ) ) ( AVAILABLE ?auto_11628 ) ( SURFACE-AT ?auto_11626 ?auto_11629 ) ( ON ?auto_11626 ?auto_11634 ) ( CLEAR ?auto_11626 ) ( not ( = ?auto_11622 ?auto_11634 ) ) ( not ( = ?auto_11623 ?auto_11634 ) ) ( not ( = ?auto_11631 ?auto_11634 ) ) ( not ( = ?auto_11626 ?auto_11634 ) ) ( not ( = ?auto_11633 ?auto_11634 ) ) ( not ( = ?auto_11627 ?auto_11634 ) ) ( TRUCK-AT ?auto_11635 ?auto_11625 ) ( SURFACE-AT ?auto_11638 ?auto_11625 ) ( CLEAR ?auto_11638 ) ( LIFTING ?auto_11632 ?auto_11627 ) ( IS-CRATE ?auto_11627 ) ( not ( = ?auto_11622 ?auto_11638 ) ) ( not ( = ?auto_11623 ?auto_11638 ) ) ( not ( = ?auto_11631 ?auto_11638 ) ) ( not ( = ?auto_11626 ?auto_11638 ) ) ( not ( = ?auto_11633 ?auto_11638 ) ) ( not ( = ?auto_11627 ?auto_11638 ) ) ( not ( = ?auto_11634 ?auto_11638 ) ) )
    :subtasks
    ( ( !DROP ?auto_11632 ?auto_11627 ?auto_11638 ?auto_11625 )
      ( MAKE-ON ?auto_11622 ?auto_11623 )
      ( MAKE-ON-VERIFY ?auto_11622 ?auto_11623 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_11639 - SURFACE
      ?auto_11640 - SURFACE
    )
    :vars
    (
      ?auto_11643 - HOIST
      ?auto_11652 - PLACE
      ?auto_11654 - PLACE
      ?auto_11646 - HOIST
      ?auto_11649 - SURFACE
      ?auto_11645 - SURFACE
      ?auto_11641 - PLACE
      ?auto_11651 - HOIST
      ?auto_11647 - SURFACE
      ?auto_11653 - SURFACE
      ?auto_11650 - PLACE
      ?auto_11648 - HOIST
      ?auto_11642 - SURFACE
      ?auto_11644 - TRUCK
      ?auto_11655 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11643 ?auto_11652 ) ( IS-CRATE ?auto_11639 ) ( not ( = ?auto_11639 ?auto_11640 ) ) ( not ( = ?auto_11654 ?auto_11652 ) ) ( HOIST-AT ?auto_11646 ?auto_11654 ) ( not ( = ?auto_11643 ?auto_11646 ) ) ( AVAILABLE ?auto_11646 ) ( SURFACE-AT ?auto_11639 ?auto_11654 ) ( ON ?auto_11639 ?auto_11649 ) ( CLEAR ?auto_11639 ) ( not ( = ?auto_11639 ?auto_11649 ) ) ( not ( = ?auto_11640 ?auto_11649 ) ) ( IS-CRATE ?auto_11640 ) ( not ( = ?auto_11639 ?auto_11645 ) ) ( not ( = ?auto_11640 ?auto_11645 ) ) ( not ( = ?auto_11649 ?auto_11645 ) ) ( not ( = ?auto_11641 ?auto_11652 ) ) ( not ( = ?auto_11654 ?auto_11641 ) ) ( HOIST-AT ?auto_11651 ?auto_11641 ) ( not ( = ?auto_11643 ?auto_11651 ) ) ( not ( = ?auto_11646 ?auto_11651 ) ) ( AVAILABLE ?auto_11651 ) ( SURFACE-AT ?auto_11640 ?auto_11641 ) ( ON ?auto_11640 ?auto_11647 ) ( CLEAR ?auto_11640 ) ( not ( = ?auto_11639 ?auto_11647 ) ) ( not ( = ?auto_11640 ?auto_11647 ) ) ( not ( = ?auto_11649 ?auto_11647 ) ) ( not ( = ?auto_11645 ?auto_11647 ) ) ( IS-CRATE ?auto_11645 ) ( not ( = ?auto_11639 ?auto_11653 ) ) ( not ( = ?auto_11640 ?auto_11653 ) ) ( not ( = ?auto_11649 ?auto_11653 ) ) ( not ( = ?auto_11645 ?auto_11653 ) ) ( not ( = ?auto_11647 ?auto_11653 ) ) ( not ( = ?auto_11650 ?auto_11652 ) ) ( not ( = ?auto_11654 ?auto_11650 ) ) ( not ( = ?auto_11641 ?auto_11650 ) ) ( HOIST-AT ?auto_11648 ?auto_11650 ) ( not ( = ?auto_11643 ?auto_11648 ) ) ( not ( = ?auto_11646 ?auto_11648 ) ) ( not ( = ?auto_11651 ?auto_11648 ) ) ( AVAILABLE ?auto_11648 ) ( SURFACE-AT ?auto_11645 ?auto_11650 ) ( ON ?auto_11645 ?auto_11642 ) ( CLEAR ?auto_11645 ) ( not ( = ?auto_11639 ?auto_11642 ) ) ( not ( = ?auto_11640 ?auto_11642 ) ) ( not ( = ?auto_11649 ?auto_11642 ) ) ( not ( = ?auto_11645 ?auto_11642 ) ) ( not ( = ?auto_11647 ?auto_11642 ) ) ( not ( = ?auto_11653 ?auto_11642 ) ) ( TRUCK-AT ?auto_11644 ?auto_11652 ) ( SURFACE-AT ?auto_11655 ?auto_11652 ) ( CLEAR ?auto_11655 ) ( IS-CRATE ?auto_11653 ) ( not ( = ?auto_11639 ?auto_11655 ) ) ( not ( = ?auto_11640 ?auto_11655 ) ) ( not ( = ?auto_11649 ?auto_11655 ) ) ( not ( = ?auto_11645 ?auto_11655 ) ) ( not ( = ?auto_11647 ?auto_11655 ) ) ( not ( = ?auto_11653 ?auto_11655 ) ) ( not ( = ?auto_11642 ?auto_11655 ) ) ( AVAILABLE ?auto_11643 ) ( IN ?auto_11653 ?auto_11644 ) )
    :subtasks
    ( ( !UNLOAD ?auto_11643 ?auto_11653 ?auto_11644 ?auto_11652 )
      ( MAKE-ON ?auto_11639 ?auto_11640 )
      ( MAKE-ON-VERIFY ?auto_11639 ?auto_11640 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_11656 - SURFACE
      ?auto_11657 - SURFACE
    )
    :vars
    (
      ?auto_11669 - HOIST
      ?auto_11665 - PLACE
      ?auto_11659 - PLACE
      ?auto_11670 - HOIST
      ?auto_11672 - SURFACE
      ?auto_11660 - SURFACE
      ?auto_11667 - PLACE
      ?auto_11662 - HOIST
      ?auto_11671 - SURFACE
      ?auto_11661 - SURFACE
      ?auto_11658 - PLACE
      ?auto_11663 - HOIST
      ?auto_11664 - SURFACE
      ?auto_11666 - SURFACE
      ?auto_11668 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11669 ?auto_11665 ) ( IS-CRATE ?auto_11656 ) ( not ( = ?auto_11656 ?auto_11657 ) ) ( not ( = ?auto_11659 ?auto_11665 ) ) ( HOIST-AT ?auto_11670 ?auto_11659 ) ( not ( = ?auto_11669 ?auto_11670 ) ) ( AVAILABLE ?auto_11670 ) ( SURFACE-AT ?auto_11656 ?auto_11659 ) ( ON ?auto_11656 ?auto_11672 ) ( CLEAR ?auto_11656 ) ( not ( = ?auto_11656 ?auto_11672 ) ) ( not ( = ?auto_11657 ?auto_11672 ) ) ( IS-CRATE ?auto_11657 ) ( not ( = ?auto_11656 ?auto_11660 ) ) ( not ( = ?auto_11657 ?auto_11660 ) ) ( not ( = ?auto_11672 ?auto_11660 ) ) ( not ( = ?auto_11667 ?auto_11665 ) ) ( not ( = ?auto_11659 ?auto_11667 ) ) ( HOIST-AT ?auto_11662 ?auto_11667 ) ( not ( = ?auto_11669 ?auto_11662 ) ) ( not ( = ?auto_11670 ?auto_11662 ) ) ( AVAILABLE ?auto_11662 ) ( SURFACE-AT ?auto_11657 ?auto_11667 ) ( ON ?auto_11657 ?auto_11671 ) ( CLEAR ?auto_11657 ) ( not ( = ?auto_11656 ?auto_11671 ) ) ( not ( = ?auto_11657 ?auto_11671 ) ) ( not ( = ?auto_11672 ?auto_11671 ) ) ( not ( = ?auto_11660 ?auto_11671 ) ) ( IS-CRATE ?auto_11660 ) ( not ( = ?auto_11656 ?auto_11661 ) ) ( not ( = ?auto_11657 ?auto_11661 ) ) ( not ( = ?auto_11672 ?auto_11661 ) ) ( not ( = ?auto_11660 ?auto_11661 ) ) ( not ( = ?auto_11671 ?auto_11661 ) ) ( not ( = ?auto_11658 ?auto_11665 ) ) ( not ( = ?auto_11659 ?auto_11658 ) ) ( not ( = ?auto_11667 ?auto_11658 ) ) ( HOIST-AT ?auto_11663 ?auto_11658 ) ( not ( = ?auto_11669 ?auto_11663 ) ) ( not ( = ?auto_11670 ?auto_11663 ) ) ( not ( = ?auto_11662 ?auto_11663 ) ) ( AVAILABLE ?auto_11663 ) ( SURFACE-AT ?auto_11660 ?auto_11658 ) ( ON ?auto_11660 ?auto_11664 ) ( CLEAR ?auto_11660 ) ( not ( = ?auto_11656 ?auto_11664 ) ) ( not ( = ?auto_11657 ?auto_11664 ) ) ( not ( = ?auto_11672 ?auto_11664 ) ) ( not ( = ?auto_11660 ?auto_11664 ) ) ( not ( = ?auto_11671 ?auto_11664 ) ) ( not ( = ?auto_11661 ?auto_11664 ) ) ( SURFACE-AT ?auto_11666 ?auto_11665 ) ( CLEAR ?auto_11666 ) ( IS-CRATE ?auto_11661 ) ( not ( = ?auto_11656 ?auto_11666 ) ) ( not ( = ?auto_11657 ?auto_11666 ) ) ( not ( = ?auto_11672 ?auto_11666 ) ) ( not ( = ?auto_11660 ?auto_11666 ) ) ( not ( = ?auto_11671 ?auto_11666 ) ) ( not ( = ?auto_11661 ?auto_11666 ) ) ( not ( = ?auto_11664 ?auto_11666 ) ) ( AVAILABLE ?auto_11669 ) ( IN ?auto_11661 ?auto_11668 ) ( TRUCK-AT ?auto_11668 ?auto_11659 ) )
    :subtasks
    ( ( !DRIVE ?auto_11668 ?auto_11659 ?auto_11665 )
      ( MAKE-ON ?auto_11656 ?auto_11657 )
      ( MAKE-ON-VERIFY ?auto_11656 ?auto_11657 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_11673 - SURFACE
      ?auto_11674 - SURFACE
    )
    :vars
    (
      ?auto_11678 - HOIST
      ?auto_11681 - PLACE
      ?auto_11684 - PLACE
      ?auto_11675 - HOIST
      ?auto_11682 - SURFACE
      ?auto_11683 - SURFACE
      ?auto_11680 - PLACE
      ?auto_11679 - HOIST
      ?auto_11677 - SURFACE
      ?auto_11686 - SURFACE
      ?auto_11689 - PLACE
      ?auto_11676 - HOIST
      ?auto_11687 - SURFACE
      ?auto_11688 - SURFACE
      ?auto_11685 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11678 ?auto_11681 ) ( IS-CRATE ?auto_11673 ) ( not ( = ?auto_11673 ?auto_11674 ) ) ( not ( = ?auto_11684 ?auto_11681 ) ) ( HOIST-AT ?auto_11675 ?auto_11684 ) ( not ( = ?auto_11678 ?auto_11675 ) ) ( SURFACE-AT ?auto_11673 ?auto_11684 ) ( ON ?auto_11673 ?auto_11682 ) ( CLEAR ?auto_11673 ) ( not ( = ?auto_11673 ?auto_11682 ) ) ( not ( = ?auto_11674 ?auto_11682 ) ) ( IS-CRATE ?auto_11674 ) ( not ( = ?auto_11673 ?auto_11683 ) ) ( not ( = ?auto_11674 ?auto_11683 ) ) ( not ( = ?auto_11682 ?auto_11683 ) ) ( not ( = ?auto_11680 ?auto_11681 ) ) ( not ( = ?auto_11684 ?auto_11680 ) ) ( HOIST-AT ?auto_11679 ?auto_11680 ) ( not ( = ?auto_11678 ?auto_11679 ) ) ( not ( = ?auto_11675 ?auto_11679 ) ) ( AVAILABLE ?auto_11679 ) ( SURFACE-AT ?auto_11674 ?auto_11680 ) ( ON ?auto_11674 ?auto_11677 ) ( CLEAR ?auto_11674 ) ( not ( = ?auto_11673 ?auto_11677 ) ) ( not ( = ?auto_11674 ?auto_11677 ) ) ( not ( = ?auto_11682 ?auto_11677 ) ) ( not ( = ?auto_11683 ?auto_11677 ) ) ( IS-CRATE ?auto_11683 ) ( not ( = ?auto_11673 ?auto_11686 ) ) ( not ( = ?auto_11674 ?auto_11686 ) ) ( not ( = ?auto_11682 ?auto_11686 ) ) ( not ( = ?auto_11683 ?auto_11686 ) ) ( not ( = ?auto_11677 ?auto_11686 ) ) ( not ( = ?auto_11689 ?auto_11681 ) ) ( not ( = ?auto_11684 ?auto_11689 ) ) ( not ( = ?auto_11680 ?auto_11689 ) ) ( HOIST-AT ?auto_11676 ?auto_11689 ) ( not ( = ?auto_11678 ?auto_11676 ) ) ( not ( = ?auto_11675 ?auto_11676 ) ) ( not ( = ?auto_11679 ?auto_11676 ) ) ( AVAILABLE ?auto_11676 ) ( SURFACE-AT ?auto_11683 ?auto_11689 ) ( ON ?auto_11683 ?auto_11687 ) ( CLEAR ?auto_11683 ) ( not ( = ?auto_11673 ?auto_11687 ) ) ( not ( = ?auto_11674 ?auto_11687 ) ) ( not ( = ?auto_11682 ?auto_11687 ) ) ( not ( = ?auto_11683 ?auto_11687 ) ) ( not ( = ?auto_11677 ?auto_11687 ) ) ( not ( = ?auto_11686 ?auto_11687 ) ) ( SURFACE-AT ?auto_11688 ?auto_11681 ) ( CLEAR ?auto_11688 ) ( IS-CRATE ?auto_11686 ) ( not ( = ?auto_11673 ?auto_11688 ) ) ( not ( = ?auto_11674 ?auto_11688 ) ) ( not ( = ?auto_11682 ?auto_11688 ) ) ( not ( = ?auto_11683 ?auto_11688 ) ) ( not ( = ?auto_11677 ?auto_11688 ) ) ( not ( = ?auto_11686 ?auto_11688 ) ) ( not ( = ?auto_11687 ?auto_11688 ) ) ( AVAILABLE ?auto_11678 ) ( TRUCK-AT ?auto_11685 ?auto_11684 ) ( LIFTING ?auto_11675 ?auto_11686 ) )
    :subtasks
    ( ( !LOAD ?auto_11675 ?auto_11686 ?auto_11685 ?auto_11684 )
      ( MAKE-ON ?auto_11673 ?auto_11674 )
      ( MAKE-ON-VERIFY ?auto_11673 ?auto_11674 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_11690 - SURFACE
      ?auto_11691 - SURFACE
    )
    :vars
    (
      ?auto_11699 - HOIST
      ?auto_11698 - PLACE
      ?auto_11706 - PLACE
      ?auto_11700 - HOIST
      ?auto_11693 - SURFACE
      ?auto_11702 - SURFACE
      ?auto_11697 - PLACE
      ?auto_11704 - HOIST
      ?auto_11692 - SURFACE
      ?auto_11696 - SURFACE
      ?auto_11701 - PLACE
      ?auto_11694 - HOIST
      ?auto_11695 - SURFACE
      ?auto_11703 - SURFACE
      ?auto_11705 - TRUCK
      ?auto_11707 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11699 ?auto_11698 ) ( IS-CRATE ?auto_11690 ) ( not ( = ?auto_11690 ?auto_11691 ) ) ( not ( = ?auto_11706 ?auto_11698 ) ) ( HOIST-AT ?auto_11700 ?auto_11706 ) ( not ( = ?auto_11699 ?auto_11700 ) ) ( SURFACE-AT ?auto_11690 ?auto_11706 ) ( ON ?auto_11690 ?auto_11693 ) ( CLEAR ?auto_11690 ) ( not ( = ?auto_11690 ?auto_11693 ) ) ( not ( = ?auto_11691 ?auto_11693 ) ) ( IS-CRATE ?auto_11691 ) ( not ( = ?auto_11690 ?auto_11702 ) ) ( not ( = ?auto_11691 ?auto_11702 ) ) ( not ( = ?auto_11693 ?auto_11702 ) ) ( not ( = ?auto_11697 ?auto_11698 ) ) ( not ( = ?auto_11706 ?auto_11697 ) ) ( HOIST-AT ?auto_11704 ?auto_11697 ) ( not ( = ?auto_11699 ?auto_11704 ) ) ( not ( = ?auto_11700 ?auto_11704 ) ) ( AVAILABLE ?auto_11704 ) ( SURFACE-AT ?auto_11691 ?auto_11697 ) ( ON ?auto_11691 ?auto_11692 ) ( CLEAR ?auto_11691 ) ( not ( = ?auto_11690 ?auto_11692 ) ) ( not ( = ?auto_11691 ?auto_11692 ) ) ( not ( = ?auto_11693 ?auto_11692 ) ) ( not ( = ?auto_11702 ?auto_11692 ) ) ( IS-CRATE ?auto_11702 ) ( not ( = ?auto_11690 ?auto_11696 ) ) ( not ( = ?auto_11691 ?auto_11696 ) ) ( not ( = ?auto_11693 ?auto_11696 ) ) ( not ( = ?auto_11702 ?auto_11696 ) ) ( not ( = ?auto_11692 ?auto_11696 ) ) ( not ( = ?auto_11701 ?auto_11698 ) ) ( not ( = ?auto_11706 ?auto_11701 ) ) ( not ( = ?auto_11697 ?auto_11701 ) ) ( HOIST-AT ?auto_11694 ?auto_11701 ) ( not ( = ?auto_11699 ?auto_11694 ) ) ( not ( = ?auto_11700 ?auto_11694 ) ) ( not ( = ?auto_11704 ?auto_11694 ) ) ( AVAILABLE ?auto_11694 ) ( SURFACE-AT ?auto_11702 ?auto_11701 ) ( ON ?auto_11702 ?auto_11695 ) ( CLEAR ?auto_11702 ) ( not ( = ?auto_11690 ?auto_11695 ) ) ( not ( = ?auto_11691 ?auto_11695 ) ) ( not ( = ?auto_11693 ?auto_11695 ) ) ( not ( = ?auto_11702 ?auto_11695 ) ) ( not ( = ?auto_11692 ?auto_11695 ) ) ( not ( = ?auto_11696 ?auto_11695 ) ) ( SURFACE-AT ?auto_11703 ?auto_11698 ) ( CLEAR ?auto_11703 ) ( IS-CRATE ?auto_11696 ) ( not ( = ?auto_11690 ?auto_11703 ) ) ( not ( = ?auto_11691 ?auto_11703 ) ) ( not ( = ?auto_11693 ?auto_11703 ) ) ( not ( = ?auto_11702 ?auto_11703 ) ) ( not ( = ?auto_11692 ?auto_11703 ) ) ( not ( = ?auto_11696 ?auto_11703 ) ) ( not ( = ?auto_11695 ?auto_11703 ) ) ( AVAILABLE ?auto_11699 ) ( TRUCK-AT ?auto_11705 ?auto_11706 ) ( AVAILABLE ?auto_11700 ) ( SURFACE-AT ?auto_11696 ?auto_11706 ) ( ON ?auto_11696 ?auto_11707 ) ( CLEAR ?auto_11696 ) ( not ( = ?auto_11690 ?auto_11707 ) ) ( not ( = ?auto_11691 ?auto_11707 ) ) ( not ( = ?auto_11693 ?auto_11707 ) ) ( not ( = ?auto_11702 ?auto_11707 ) ) ( not ( = ?auto_11692 ?auto_11707 ) ) ( not ( = ?auto_11696 ?auto_11707 ) ) ( not ( = ?auto_11695 ?auto_11707 ) ) ( not ( = ?auto_11703 ?auto_11707 ) ) )
    :subtasks
    ( ( !LIFT ?auto_11700 ?auto_11696 ?auto_11707 ?auto_11706 )
      ( MAKE-ON ?auto_11690 ?auto_11691 )
      ( MAKE-ON-VERIFY ?auto_11690 ?auto_11691 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_11708 - SURFACE
      ?auto_11709 - SURFACE
    )
    :vars
    (
      ?auto_11718 - HOIST
      ?auto_11722 - PLACE
      ?auto_11721 - PLACE
      ?auto_11717 - HOIST
      ?auto_11714 - SURFACE
      ?auto_11710 - SURFACE
      ?auto_11711 - PLACE
      ?auto_11724 - HOIST
      ?auto_11716 - SURFACE
      ?auto_11712 - SURFACE
      ?auto_11719 - PLACE
      ?auto_11715 - HOIST
      ?auto_11713 - SURFACE
      ?auto_11725 - SURFACE
      ?auto_11723 - SURFACE
      ?auto_11720 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11718 ?auto_11722 ) ( IS-CRATE ?auto_11708 ) ( not ( = ?auto_11708 ?auto_11709 ) ) ( not ( = ?auto_11721 ?auto_11722 ) ) ( HOIST-AT ?auto_11717 ?auto_11721 ) ( not ( = ?auto_11718 ?auto_11717 ) ) ( SURFACE-AT ?auto_11708 ?auto_11721 ) ( ON ?auto_11708 ?auto_11714 ) ( CLEAR ?auto_11708 ) ( not ( = ?auto_11708 ?auto_11714 ) ) ( not ( = ?auto_11709 ?auto_11714 ) ) ( IS-CRATE ?auto_11709 ) ( not ( = ?auto_11708 ?auto_11710 ) ) ( not ( = ?auto_11709 ?auto_11710 ) ) ( not ( = ?auto_11714 ?auto_11710 ) ) ( not ( = ?auto_11711 ?auto_11722 ) ) ( not ( = ?auto_11721 ?auto_11711 ) ) ( HOIST-AT ?auto_11724 ?auto_11711 ) ( not ( = ?auto_11718 ?auto_11724 ) ) ( not ( = ?auto_11717 ?auto_11724 ) ) ( AVAILABLE ?auto_11724 ) ( SURFACE-AT ?auto_11709 ?auto_11711 ) ( ON ?auto_11709 ?auto_11716 ) ( CLEAR ?auto_11709 ) ( not ( = ?auto_11708 ?auto_11716 ) ) ( not ( = ?auto_11709 ?auto_11716 ) ) ( not ( = ?auto_11714 ?auto_11716 ) ) ( not ( = ?auto_11710 ?auto_11716 ) ) ( IS-CRATE ?auto_11710 ) ( not ( = ?auto_11708 ?auto_11712 ) ) ( not ( = ?auto_11709 ?auto_11712 ) ) ( not ( = ?auto_11714 ?auto_11712 ) ) ( not ( = ?auto_11710 ?auto_11712 ) ) ( not ( = ?auto_11716 ?auto_11712 ) ) ( not ( = ?auto_11719 ?auto_11722 ) ) ( not ( = ?auto_11721 ?auto_11719 ) ) ( not ( = ?auto_11711 ?auto_11719 ) ) ( HOIST-AT ?auto_11715 ?auto_11719 ) ( not ( = ?auto_11718 ?auto_11715 ) ) ( not ( = ?auto_11717 ?auto_11715 ) ) ( not ( = ?auto_11724 ?auto_11715 ) ) ( AVAILABLE ?auto_11715 ) ( SURFACE-AT ?auto_11710 ?auto_11719 ) ( ON ?auto_11710 ?auto_11713 ) ( CLEAR ?auto_11710 ) ( not ( = ?auto_11708 ?auto_11713 ) ) ( not ( = ?auto_11709 ?auto_11713 ) ) ( not ( = ?auto_11714 ?auto_11713 ) ) ( not ( = ?auto_11710 ?auto_11713 ) ) ( not ( = ?auto_11716 ?auto_11713 ) ) ( not ( = ?auto_11712 ?auto_11713 ) ) ( SURFACE-AT ?auto_11725 ?auto_11722 ) ( CLEAR ?auto_11725 ) ( IS-CRATE ?auto_11712 ) ( not ( = ?auto_11708 ?auto_11725 ) ) ( not ( = ?auto_11709 ?auto_11725 ) ) ( not ( = ?auto_11714 ?auto_11725 ) ) ( not ( = ?auto_11710 ?auto_11725 ) ) ( not ( = ?auto_11716 ?auto_11725 ) ) ( not ( = ?auto_11712 ?auto_11725 ) ) ( not ( = ?auto_11713 ?auto_11725 ) ) ( AVAILABLE ?auto_11718 ) ( AVAILABLE ?auto_11717 ) ( SURFACE-AT ?auto_11712 ?auto_11721 ) ( ON ?auto_11712 ?auto_11723 ) ( CLEAR ?auto_11712 ) ( not ( = ?auto_11708 ?auto_11723 ) ) ( not ( = ?auto_11709 ?auto_11723 ) ) ( not ( = ?auto_11714 ?auto_11723 ) ) ( not ( = ?auto_11710 ?auto_11723 ) ) ( not ( = ?auto_11716 ?auto_11723 ) ) ( not ( = ?auto_11712 ?auto_11723 ) ) ( not ( = ?auto_11713 ?auto_11723 ) ) ( not ( = ?auto_11725 ?auto_11723 ) ) ( TRUCK-AT ?auto_11720 ?auto_11722 ) )
    :subtasks
    ( ( !DRIVE ?auto_11720 ?auto_11722 ?auto_11721 )
      ( MAKE-ON ?auto_11708 ?auto_11709 )
      ( MAKE-ON-VERIFY ?auto_11708 ?auto_11709 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_11726 - SURFACE
      ?auto_11727 - SURFACE
    )
    :vars
    (
      ?auto_11743 - HOIST
      ?auto_11737 - PLACE
      ?auto_11729 - PLACE
      ?auto_11736 - HOIST
      ?auto_11735 - SURFACE
      ?auto_11738 - SURFACE
      ?auto_11739 - PLACE
      ?auto_11733 - HOIST
      ?auto_11742 - SURFACE
      ?auto_11740 - SURFACE
      ?auto_11732 - PLACE
      ?auto_11731 - HOIST
      ?auto_11730 - SURFACE
      ?auto_11734 - SURFACE
      ?auto_11741 - SURFACE
      ?auto_11728 - TRUCK
      ?auto_11744 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11743 ?auto_11737 ) ( IS-CRATE ?auto_11726 ) ( not ( = ?auto_11726 ?auto_11727 ) ) ( not ( = ?auto_11729 ?auto_11737 ) ) ( HOIST-AT ?auto_11736 ?auto_11729 ) ( not ( = ?auto_11743 ?auto_11736 ) ) ( SURFACE-AT ?auto_11726 ?auto_11729 ) ( ON ?auto_11726 ?auto_11735 ) ( CLEAR ?auto_11726 ) ( not ( = ?auto_11726 ?auto_11735 ) ) ( not ( = ?auto_11727 ?auto_11735 ) ) ( IS-CRATE ?auto_11727 ) ( not ( = ?auto_11726 ?auto_11738 ) ) ( not ( = ?auto_11727 ?auto_11738 ) ) ( not ( = ?auto_11735 ?auto_11738 ) ) ( not ( = ?auto_11739 ?auto_11737 ) ) ( not ( = ?auto_11729 ?auto_11739 ) ) ( HOIST-AT ?auto_11733 ?auto_11739 ) ( not ( = ?auto_11743 ?auto_11733 ) ) ( not ( = ?auto_11736 ?auto_11733 ) ) ( AVAILABLE ?auto_11733 ) ( SURFACE-AT ?auto_11727 ?auto_11739 ) ( ON ?auto_11727 ?auto_11742 ) ( CLEAR ?auto_11727 ) ( not ( = ?auto_11726 ?auto_11742 ) ) ( not ( = ?auto_11727 ?auto_11742 ) ) ( not ( = ?auto_11735 ?auto_11742 ) ) ( not ( = ?auto_11738 ?auto_11742 ) ) ( IS-CRATE ?auto_11738 ) ( not ( = ?auto_11726 ?auto_11740 ) ) ( not ( = ?auto_11727 ?auto_11740 ) ) ( not ( = ?auto_11735 ?auto_11740 ) ) ( not ( = ?auto_11738 ?auto_11740 ) ) ( not ( = ?auto_11742 ?auto_11740 ) ) ( not ( = ?auto_11732 ?auto_11737 ) ) ( not ( = ?auto_11729 ?auto_11732 ) ) ( not ( = ?auto_11739 ?auto_11732 ) ) ( HOIST-AT ?auto_11731 ?auto_11732 ) ( not ( = ?auto_11743 ?auto_11731 ) ) ( not ( = ?auto_11736 ?auto_11731 ) ) ( not ( = ?auto_11733 ?auto_11731 ) ) ( AVAILABLE ?auto_11731 ) ( SURFACE-AT ?auto_11738 ?auto_11732 ) ( ON ?auto_11738 ?auto_11730 ) ( CLEAR ?auto_11738 ) ( not ( = ?auto_11726 ?auto_11730 ) ) ( not ( = ?auto_11727 ?auto_11730 ) ) ( not ( = ?auto_11735 ?auto_11730 ) ) ( not ( = ?auto_11738 ?auto_11730 ) ) ( not ( = ?auto_11742 ?auto_11730 ) ) ( not ( = ?auto_11740 ?auto_11730 ) ) ( IS-CRATE ?auto_11740 ) ( not ( = ?auto_11726 ?auto_11734 ) ) ( not ( = ?auto_11727 ?auto_11734 ) ) ( not ( = ?auto_11735 ?auto_11734 ) ) ( not ( = ?auto_11738 ?auto_11734 ) ) ( not ( = ?auto_11742 ?auto_11734 ) ) ( not ( = ?auto_11740 ?auto_11734 ) ) ( not ( = ?auto_11730 ?auto_11734 ) ) ( AVAILABLE ?auto_11736 ) ( SURFACE-AT ?auto_11740 ?auto_11729 ) ( ON ?auto_11740 ?auto_11741 ) ( CLEAR ?auto_11740 ) ( not ( = ?auto_11726 ?auto_11741 ) ) ( not ( = ?auto_11727 ?auto_11741 ) ) ( not ( = ?auto_11735 ?auto_11741 ) ) ( not ( = ?auto_11738 ?auto_11741 ) ) ( not ( = ?auto_11742 ?auto_11741 ) ) ( not ( = ?auto_11740 ?auto_11741 ) ) ( not ( = ?auto_11730 ?auto_11741 ) ) ( not ( = ?auto_11734 ?auto_11741 ) ) ( TRUCK-AT ?auto_11728 ?auto_11737 ) ( SURFACE-AT ?auto_11744 ?auto_11737 ) ( CLEAR ?auto_11744 ) ( LIFTING ?auto_11743 ?auto_11734 ) ( IS-CRATE ?auto_11734 ) ( not ( = ?auto_11726 ?auto_11744 ) ) ( not ( = ?auto_11727 ?auto_11744 ) ) ( not ( = ?auto_11735 ?auto_11744 ) ) ( not ( = ?auto_11738 ?auto_11744 ) ) ( not ( = ?auto_11742 ?auto_11744 ) ) ( not ( = ?auto_11740 ?auto_11744 ) ) ( not ( = ?auto_11730 ?auto_11744 ) ) ( not ( = ?auto_11734 ?auto_11744 ) ) ( not ( = ?auto_11741 ?auto_11744 ) ) )
    :subtasks
    ( ( !DROP ?auto_11743 ?auto_11734 ?auto_11744 ?auto_11737 )
      ( MAKE-ON ?auto_11726 ?auto_11727 )
      ( MAKE-ON-VERIFY ?auto_11726 ?auto_11727 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_11745 - SURFACE
      ?auto_11746 - SURFACE
    )
    :vars
    (
      ?auto_11750 - HOIST
      ?auto_11758 - PLACE
      ?auto_11748 - PLACE
      ?auto_11762 - HOIST
      ?auto_11756 - SURFACE
      ?auto_11754 - SURFACE
      ?auto_11757 - PLACE
      ?auto_11753 - HOIST
      ?auto_11759 - SURFACE
      ?auto_11760 - SURFACE
      ?auto_11752 - PLACE
      ?auto_11751 - HOIST
      ?auto_11747 - SURFACE
      ?auto_11749 - SURFACE
      ?auto_11755 - SURFACE
      ?auto_11763 - TRUCK
      ?auto_11761 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11750 ?auto_11758 ) ( IS-CRATE ?auto_11745 ) ( not ( = ?auto_11745 ?auto_11746 ) ) ( not ( = ?auto_11748 ?auto_11758 ) ) ( HOIST-AT ?auto_11762 ?auto_11748 ) ( not ( = ?auto_11750 ?auto_11762 ) ) ( SURFACE-AT ?auto_11745 ?auto_11748 ) ( ON ?auto_11745 ?auto_11756 ) ( CLEAR ?auto_11745 ) ( not ( = ?auto_11745 ?auto_11756 ) ) ( not ( = ?auto_11746 ?auto_11756 ) ) ( IS-CRATE ?auto_11746 ) ( not ( = ?auto_11745 ?auto_11754 ) ) ( not ( = ?auto_11746 ?auto_11754 ) ) ( not ( = ?auto_11756 ?auto_11754 ) ) ( not ( = ?auto_11757 ?auto_11758 ) ) ( not ( = ?auto_11748 ?auto_11757 ) ) ( HOIST-AT ?auto_11753 ?auto_11757 ) ( not ( = ?auto_11750 ?auto_11753 ) ) ( not ( = ?auto_11762 ?auto_11753 ) ) ( AVAILABLE ?auto_11753 ) ( SURFACE-AT ?auto_11746 ?auto_11757 ) ( ON ?auto_11746 ?auto_11759 ) ( CLEAR ?auto_11746 ) ( not ( = ?auto_11745 ?auto_11759 ) ) ( not ( = ?auto_11746 ?auto_11759 ) ) ( not ( = ?auto_11756 ?auto_11759 ) ) ( not ( = ?auto_11754 ?auto_11759 ) ) ( IS-CRATE ?auto_11754 ) ( not ( = ?auto_11745 ?auto_11760 ) ) ( not ( = ?auto_11746 ?auto_11760 ) ) ( not ( = ?auto_11756 ?auto_11760 ) ) ( not ( = ?auto_11754 ?auto_11760 ) ) ( not ( = ?auto_11759 ?auto_11760 ) ) ( not ( = ?auto_11752 ?auto_11758 ) ) ( not ( = ?auto_11748 ?auto_11752 ) ) ( not ( = ?auto_11757 ?auto_11752 ) ) ( HOIST-AT ?auto_11751 ?auto_11752 ) ( not ( = ?auto_11750 ?auto_11751 ) ) ( not ( = ?auto_11762 ?auto_11751 ) ) ( not ( = ?auto_11753 ?auto_11751 ) ) ( AVAILABLE ?auto_11751 ) ( SURFACE-AT ?auto_11754 ?auto_11752 ) ( ON ?auto_11754 ?auto_11747 ) ( CLEAR ?auto_11754 ) ( not ( = ?auto_11745 ?auto_11747 ) ) ( not ( = ?auto_11746 ?auto_11747 ) ) ( not ( = ?auto_11756 ?auto_11747 ) ) ( not ( = ?auto_11754 ?auto_11747 ) ) ( not ( = ?auto_11759 ?auto_11747 ) ) ( not ( = ?auto_11760 ?auto_11747 ) ) ( IS-CRATE ?auto_11760 ) ( not ( = ?auto_11745 ?auto_11749 ) ) ( not ( = ?auto_11746 ?auto_11749 ) ) ( not ( = ?auto_11756 ?auto_11749 ) ) ( not ( = ?auto_11754 ?auto_11749 ) ) ( not ( = ?auto_11759 ?auto_11749 ) ) ( not ( = ?auto_11760 ?auto_11749 ) ) ( not ( = ?auto_11747 ?auto_11749 ) ) ( AVAILABLE ?auto_11762 ) ( SURFACE-AT ?auto_11760 ?auto_11748 ) ( ON ?auto_11760 ?auto_11755 ) ( CLEAR ?auto_11760 ) ( not ( = ?auto_11745 ?auto_11755 ) ) ( not ( = ?auto_11746 ?auto_11755 ) ) ( not ( = ?auto_11756 ?auto_11755 ) ) ( not ( = ?auto_11754 ?auto_11755 ) ) ( not ( = ?auto_11759 ?auto_11755 ) ) ( not ( = ?auto_11760 ?auto_11755 ) ) ( not ( = ?auto_11747 ?auto_11755 ) ) ( not ( = ?auto_11749 ?auto_11755 ) ) ( TRUCK-AT ?auto_11763 ?auto_11758 ) ( SURFACE-AT ?auto_11761 ?auto_11758 ) ( CLEAR ?auto_11761 ) ( IS-CRATE ?auto_11749 ) ( not ( = ?auto_11745 ?auto_11761 ) ) ( not ( = ?auto_11746 ?auto_11761 ) ) ( not ( = ?auto_11756 ?auto_11761 ) ) ( not ( = ?auto_11754 ?auto_11761 ) ) ( not ( = ?auto_11759 ?auto_11761 ) ) ( not ( = ?auto_11760 ?auto_11761 ) ) ( not ( = ?auto_11747 ?auto_11761 ) ) ( not ( = ?auto_11749 ?auto_11761 ) ) ( not ( = ?auto_11755 ?auto_11761 ) ) ( AVAILABLE ?auto_11750 ) ( IN ?auto_11749 ?auto_11763 ) )
    :subtasks
    ( ( !UNLOAD ?auto_11750 ?auto_11749 ?auto_11763 ?auto_11758 )
      ( MAKE-ON ?auto_11745 ?auto_11746 )
      ( MAKE-ON-VERIFY ?auto_11745 ?auto_11746 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_11764 - SURFACE
      ?auto_11765 - SURFACE
    )
    :vars
    (
      ?auto_11766 - HOIST
      ?auto_11782 - PLACE
      ?auto_11774 - PLACE
      ?auto_11779 - HOIST
      ?auto_11770 - SURFACE
      ?auto_11771 - SURFACE
      ?auto_11773 - PLACE
      ?auto_11768 - HOIST
      ?auto_11780 - SURFACE
      ?auto_11775 - SURFACE
      ?auto_11769 - PLACE
      ?auto_11776 - HOIST
      ?auto_11777 - SURFACE
      ?auto_11767 - SURFACE
      ?auto_11781 - SURFACE
      ?auto_11778 - SURFACE
      ?auto_11772 - TRUCK
      ?auto_11783 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11766 ?auto_11782 ) ( IS-CRATE ?auto_11764 ) ( not ( = ?auto_11764 ?auto_11765 ) ) ( not ( = ?auto_11774 ?auto_11782 ) ) ( HOIST-AT ?auto_11779 ?auto_11774 ) ( not ( = ?auto_11766 ?auto_11779 ) ) ( SURFACE-AT ?auto_11764 ?auto_11774 ) ( ON ?auto_11764 ?auto_11770 ) ( CLEAR ?auto_11764 ) ( not ( = ?auto_11764 ?auto_11770 ) ) ( not ( = ?auto_11765 ?auto_11770 ) ) ( IS-CRATE ?auto_11765 ) ( not ( = ?auto_11764 ?auto_11771 ) ) ( not ( = ?auto_11765 ?auto_11771 ) ) ( not ( = ?auto_11770 ?auto_11771 ) ) ( not ( = ?auto_11773 ?auto_11782 ) ) ( not ( = ?auto_11774 ?auto_11773 ) ) ( HOIST-AT ?auto_11768 ?auto_11773 ) ( not ( = ?auto_11766 ?auto_11768 ) ) ( not ( = ?auto_11779 ?auto_11768 ) ) ( AVAILABLE ?auto_11768 ) ( SURFACE-AT ?auto_11765 ?auto_11773 ) ( ON ?auto_11765 ?auto_11780 ) ( CLEAR ?auto_11765 ) ( not ( = ?auto_11764 ?auto_11780 ) ) ( not ( = ?auto_11765 ?auto_11780 ) ) ( not ( = ?auto_11770 ?auto_11780 ) ) ( not ( = ?auto_11771 ?auto_11780 ) ) ( IS-CRATE ?auto_11771 ) ( not ( = ?auto_11764 ?auto_11775 ) ) ( not ( = ?auto_11765 ?auto_11775 ) ) ( not ( = ?auto_11770 ?auto_11775 ) ) ( not ( = ?auto_11771 ?auto_11775 ) ) ( not ( = ?auto_11780 ?auto_11775 ) ) ( not ( = ?auto_11769 ?auto_11782 ) ) ( not ( = ?auto_11774 ?auto_11769 ) ) ( not ( = ?auto_11773 ?auto_11769 ) ) ( HOIST-AT ?auto_11776 ?auto_11769 ) ( not ( = ?auto_11766 ?auto_11776 ) ) ( not ( = ?auto_11779 ?auto_11776 ) ) ( not ( = ?auto_11768 ?auto_11776 ) ) ( AVAILABLE ?auto_11776 ) ( SURFACE-AT ?auto_11771 ?auto_11769 ) ( ON ?auto_11771 ?auto_11777 ) ( CLEAR ?auto_11771 ) ( not ( = ?auto_11764 ?auto_11777 ) ) ( not ( = ?auto_11765 ?auto_11777 ) ) ( not ( = ?auto_11770 ?auto_11777 ) ) ( not ( = ?auto_11771 ?auto_11777 ) ) ( not ( = ?auto_11780 ?auto_11777 ) ) ( not ( = ?auto_11775 ?auto_11777 ) ) ( IS-CRATE ?auto_11775 ) ( not ( = ?auto_11764 ?auto_11767 ) ) ( not ( = ?auto_11765 ?auto_11767 ) ) ( not ( = ?auto_11770 ?auto_11767 ) ) ( not ( = ?auto_11771 ?auto_11767 ) ) ( not ( = ?auto_11780 ?auto_11767 ) ) ( not ( = ?auto_11775 ?auto_11767 ) ) ( not ( = ?auto_11777 ?auto_11767 ) ) ( AVAILABLE ?auto_11779 ) ( SURFACE-AT ?auto_11775 ?auto_11774 ) ( ON ?auto_11775 ?auto_11781 ) ( CLEAR ?auto_11775 ) ( not ( = ?auto_11764 ?auto_11781 ) ) ( not ( = ?auto_11765 ?auto_11781 ) ) ( not ( = ?auto_11770 ?auto_11781 ) ) ( not ( = ?auto_11771 ?auto_11781 ) ) ( not ( = ?auto_11780 ?auto_11781 ) ) ( not ( = ?auto_11775 ?auto_11781 ) ) ( not ( = ?auto_11777 ?auto_11781 ) ) ( not ( = ?auto_11767 ?auto_11781 ) ) ( SURFACE-AT ?auto_11778 ?auto_11782 ) ( CLEAR ?auto_11778 ) ( IS-CRATE ?auto_11767 ) ( not ( = ?auto_11764 ?auto_11778 ) ) ( not ( = ?auto_11765 ?auto_11778 ) ) ( not ( = ?auto_11770 ?auto_11778 ) ) ( not ( = ?auto_11771 ?auto_11778 ) ) ( not ( = ?auto_11780 ?auto_11778 ) ) ( not ( = ?auto_11775 ?auto_11778 ) ) ( not ( = ?auto_11777 ?auto_11778 ) ) ( not ( = ?auto_11767 ?auto_11778 ) ) ( not ( = ?auto_11781 ?auto_11778 ) ) ( AVAILABLE ?auto_11766 ) ( IN ?auto_11767 ?auto_11772 ) ( TRUCK-AT ?auto_11772 ?auto_11783 ) ( not ( = ?auto_11783 ?auto_11782 ) ) ( not ( = ?auto_11774 ?auto_11783 ) ) ( not ( = ?auto_11773 ?auto_11783 ) ) ( not ( = ?auto_11769 ?auto_11783 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_11772 ?auto_11783 ?auto_11782 )
      ( MAKE-ON ?auto_11764 ?auto_11765 )
      ( MAKE-ON-VERIFY ?auto_11764 ?auto_11765 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_11784 - SURFACE
      ?auto_11785 - SURFACE
    )
    :vars
    (
      ?auto_11789 - HOIST
      ?auto_11800 - PLACE
      ?auto_11794 - PLACE
      ?auto_11796 - HOIST
      ?auto_11788 - SURFACE
      ?auto_11802 - SURFACE
      ?auto_11787 - PLACE
      ?auto_11795 - HOIST
      ?auto_11797 - SURFACE
      ?auto_11793 - SURFACE
      ?auto_11801 - PLACE
      ?auto_11803 - HOIST
      ?auto_11792 - SURFACE
      ?auto_11791 - SURFACE
      ?auto_11786 - SURFACE
      ?auto_11790 - SURFACE
      ?auto_11798 - TRUCK
      ?auto_11799 - PLACE
      ?auto_11804 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_11789 ?auto_11800 ) ( IS-CRATE ?auto_11784 ) ( not ( = ?auto_11784 ?auto_11785 ) ) ( not ( = ?auto_11794 ?auto_11800 ) ) ( HOIST-AT ?auto_11796 ?auto_11794 ) ( not ( = ?auto_11789 ?auto_11796 ) ) ( SURFACE-AT ?auto_11784 ?auto_11794 ) ( ON ?auto_11784 ?auto_11788 ) ( CLEAR ?auto_11784 ) ( not ( = ?auto_11784 ?auto_11788 ) ) ( not ( = ?auto_11785 ?auto_11788 ) ) ( IS-CRATE ?auto_11785 ) ( not ( = ?auto_11784 ?auto_11802 ) ) ( not ( = ?auto_11785 ?auto_11802 ) ) ( not ( = ?auto_11788 ?auto_11802 ) ) ( not ( = ?auto_11787 ?auto_11800 ) ) ( not ( = ?auto_11794 ?auto_11787 ) ) ( HOIST-AT ?auto_11795 ?auto_11787 ) ( not ( = ?auto_11789 ?auto_11795 ) ) ( not ( = ?auto_11796 ?auto_11795 ) ) ( AVAILABLE ?auto_11795 ) ( SURFACE-AT ?auto_11785 ?auto_11787 ) ( ON ?auto_11785 ?auto_11797 ) ( CLEAR ?auto_11785 ) ( not ( = ?auto_11784 ?auto_11797 ) ) ( not ( = ?auto_11785 ?auto_11797 ) ) ( not ( = ?auto_11788 ?auto_11797 ) ) ( not ( = ?auto_11802 ?auto_11797 ) ) ( IS-CRATE ?auto_11802 ) ( not ( = ?auto_11784 ?auto_11793 ) ) ( not ( = ?auto_11785 ?auto_11793 ) ) ( not ( = ?auto_11788 ?auto_11793 ) ) ( not ( = ?auto_11802 ?auto_11793 ) ) ( not ( = ?auto_11797 ?auto_11793 ) ) ( not ( = ?auto_11801 ?auto_11800 ) ) ( not ( = ?auto_11794 ?auto_11801 ) ) ( not ( = ?auto_11787 ?auto_11801 ) ) ( HOIST-AT ?auto_11803 ?auto_11801 ) ( not ( = ?auto_11789 ?auto_11803 ) ) ( not ( = ?auto_11796 ?auto_11803 ) ) ( not ( = ?auto_11795 ?auto_11803 ) ) ( AVAILABLE ?auto_11803 ) ( SURFACE-AT ?auto_11802 ?auto_11801 ) ( ON ?auto_11802 ?auto_11792 ) ( CLEAR ?auto_11802 ) ( not ( = ?auto_11784 ?auto_11792 ) ) ( not ( = ?auto_11785 ?auto_11792 ) ) ( not ( = ?auto_11788 ?auto_11792 ) ) ( not ( = ?auto_11802 ?auto_11792 ) ) ( not ( = ?auto_11797 ?auto_11792 ) ) ( not ( = ?auto_11793 ?auto_11792 ) ) ( IS-CRATE ?auto_11793 ) ( not ( = ?auto_11784 ?auto_11791 ) ) ( not ( = ?auto_11785 ?auto_11791 ) ) ( not ( = ?auto_11788 ?auto_11791 ) ) ( not ( = ?auto_11802 ?auto_11791 ) ) ( not ( = ?auto_11797 ?auto_11791 ) ) ( not ( = ?auto_11793 ?auto_11791 ) ) ( not ( = ?auto_11792 ?auto_11791 ) ) ( AVAILABLE ?auto_11796 ) ( SURFACE-AT ?auto_11793 ?auto_11794 ) ( ON ?auto_11793 ?auto_11786 ) ( CLEAR ?auto_11793 ) ( not ( = ?auto_11784 ?auto_11786 ) ) ( not ( = ?auto_11785 ?auto_11786 ) ) ( not ( = ?auto_11788 ?auto_11786 ) ) ( not ( = ?auto_11802 ?auto_11786 ) ) ( not ( = ?auto_11797 ?auto_11786 ) ) ( not ( = ?auto_11793 ?auto_11786 ) ) ( not ( = ?auto_11792 ?auto_11786 ) ) ( not ( = ?auto_11791 ?auto_11786 ) ) ( SURFACE-AT ?auto_11790 ?auto_11800 ) ( CLEAR ?auto_11790 ) ( IS-CRATE ?auto_11791 ) ( not ( = ?auto_11784 ?auto_11790 ) ) ( not ( = ?auto_11785 ?auto_11790 ) ) ( not ( = ?auto_11788 ?auto_11790 ) ) ( not ( = ?auto_11802 ?auto_11790 ) ) ( not ( = ?auto_11797 ?auto_11790 ) ) ( not ( = ?auto_11793 ?auto_11790 ) ) ( not ( = ?auto_11792 ?auto_11790 ) ) ( not ( = ?auto_11791 ?auto_11790 ) ) ( not ( = ?auto_11786 ?auto_11790 ) ) ( AVAILABLE ?auto_11789 ) ( TRUCK-AT ?auto_11798 ?auto_11799 ) ( not ( = ?auto_11799 ?auto_11800 ) ) ( not ( = ?auto_11794 ?auto_11799 ) ) ( not ( = ?auto_11787 ?auto_11799 ) ) ( not ( = ?auto_11801 ?auto_11799 ) ) ( HOIST-AT ?auto_11804 ?auto_11799 ) ( LIFTING ?auto_11804 ?auto_11791 ) ( not ( = ?auto_11789 ?auto_11804 ) ) ( not ( = ?auto_11796 ?auto_11804 ) ) ( not ( = ?auto_11795 ?auto_11804 ) ) ( not ( = ?auto_11803 ?auto_11804 ) ) )
    :subtasks
    ( ( !LOAD ?auto_11804 ?auto_11791 ?auto_11798 ?auto_11799 )
      ( MAKE-ON ?auto_11784 ?auto_11785 )
      ( MAKE-ON-VERIFY ?auto_11784 ?auto_11785 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_11805 - SURFACE
      ?auto_11806 - SURFACE
    )
    :vars
    (
      ?auto_11825 - HOIST
      ?auto_11819 - PLACE
      ?auto_11817 - PLACE
      ?auto_11808 - HOIST
      ?auto_11824 - SURFACE
      ?auto_11809 - SURFACE
      ?auto_11813 - PLACE
      ?auto_11822 - HOIST
      ?auto_11814 - SURFACE
      ?auto_11820 - SURFACE
      ?auto_11818 - PLACE
      ?auto_11810 - HOIST
      ?auto_11816 - SURFACE
      ?auto_11812 - SURFACE
      ?auto_11807 - SURFACE
      ?auto_11811 - SURFACE
      ?auto_11823 - TRUCK
      ?auto_11821 - PLACE
      ?auto_11815 - HOIST
      ?auto_11826 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11825 ?auto_11819 ) ( IS-CRATE ?auto_11805 ) ( not ( = ?auto_11805 ?auto_11806 ) ) ( not ( = ?auto_11817 ?auto_11819 ) ) ( HOIST-AT ?auto_11808 ?auto_11817 ) ( not ( = ?auto_11825 ?auto_11808 ) ) ( SURFACE-AT ?auto_11805 ?auto_11817 ) ( ON ?auto_11805 ?auto_11824 ) ( CLEAR ?auto_11805 ) ( not ( = ?auto_11805 ?auto_11824 ) ) ( not ( = ?auto_11806 ?auto_11824 ) ) ( IS-CRATE ?auto_11806 ) ( not ( = ?auto_11805 ?auto_11809 ) ) ( not ( = ?auto_11806 ?auto_11809 ) ) ( not ( = ?auto_11824 ?auto_11809 ) ) ( not ( = ?auto_11813 ?auto_11819 ) ) ( not ( = ?auto_11817 ?auto_11813 ) ) ( HOIST-AT ?auto_11822 ?auto_11813 ) ( not ( = ?auto_11825 ?auto_11822 ) ) ( not ( = ?auto_11808 ?auto_11822 ) ) ( AVAILABLE ?auto_11822 ) ( SURFACE-AT ?auto_11806 ?auto_11813 ) ( ON ?auto_11806 ?auto_11814 ) ( CLEAR ?auto_11806 ) ( not ( = ?auto_11805 ?auto_11814 ) ) ( not ( = ?auto_11806 ?auto_11814 ) ) ( not ( = ?auto_11824 ?auto_11814 ) ) ( not ( = ?auto_11809 ?auto_11814 ) ) ( IS-CRATE ?auto_11809 ) ( not ( = ?auto_11805 ?auto_11820 ) ) ( not ( = ?auto_11806 ?auto_11820 ) ) ( not ( = ?auto_11824 ?auto_11820 ) ) ( not ( = ?auto_11809 ?auto_11820 ) ) ( not ( = ?auto_11814 ?auto_11820 ) ) ( not ( = ?auto_11818 ?auto_11819 ) ) ( not ( = ?auto_11817 ?auto_11818 ) ) ( not ( = ?auto_11813 ?auto_11818 ) ) ( HOIST-AT ?auto_11810 ?auto_11818 ) ( not ( = ?auto_11825 ?auto_11810 ) ) ( not ( = ?auto_11808 ?auto_11810 ) ) ( not ( = ?auto_11822 ?auto_11810 ) ) ( AVAILABLE ?auto_11810 ) ( SURFACE-AT ?auto_11809 ?auto_11818 ) ( ON ?auto_11809 ?auto_11816 ) ( CLEAR ?auto_11809 ) ( not ( = ?auto_11805 ?auto_11816 ) ) ( not ( = ?auto_11806 ?auto_11816 ) ) ( not ( = ?auto_11824 ?auto_11816 ) ) ( not ( = ?auto_11809 ?auto_11816 ) ) ( not ( = ?auto_11814 ?auto_11816 ) ) ( not ( = ?auto_11820 ?auto_11816 ) ) ( IS-CRATE ?auto_11820 ) ( not ( = ?auto_11805 ?auto_11812 ) ) ( not ( = ?auto_11806 ?auto_11812 ) ) ( not ( = ?auto_11824 ?auto_11812 ) ) ( not ( = ?auto_11809 ?auto_11812 ) ) ( not ( = ?auto_11814 ?auto_11812 ) ) ( not ( = ?auto_11820 ?auto_11812 ) ) ( not ( = ?auto_11816 ?auto_11812 ) ) ( AVAILABLE ?auto_11808 ) ( SURFACE-AT ?auto_11820 ?auto_11817 ) ( ON ?auto_11820 ?auto_11807 ) ( CLEAR ?auto_11820 ) ( not ( = ?auto_11805 ?auto_11807 ) ) ( not ( = ?auto_11806 ?auto_11807 ) ) ( not ( = ?auto_11824 ?auto_11807 ) ) ( not ( = ?auto_11809 ?auto_11807 ) ) ( not ( = ?auto_11814 ?auto_11807 ) ) ( not ( = ?auto_11820 ?auto_11807 ) ) ( not ( = ?auto_11816 ?auto_11807 ) ) ( not ( = ?auto_11812 ?auto_11807 ) ) ( SURFACE-AT ?auto_11811 ?auto_11819 ) ( CLEAR ?auto_11811 ) ( IS-CRATE ?auto_11812 ) ( not ( = ?auto_11805 ?auto_11811 ) ) ( not ( = ?auto_11806 ?auto_11811 ) ) ( not ( = ?auto_11824 ?auto_11811 ) ) ( not ( = ?auto_11809 ?auto_11811 ) ) ( not ( = ?auto_11814 ?auto_11811 ) ) ( not ( = ?auto_11820 ?auto_11811 ) ) ( not ( = ?auto_11816 ?auto_11811 ) ) ( not ( = ?auto_11812 ?auto_11811 ) ) ( not ( = ?auto_11807 ?auto_11811 ) ) ( AVAILABLE ?auto_11825 ) ( TRUCK-AT ?auto_11823 ?auto_11821 ) ( not ( = ?auto_11821 ?auto_11819 ) ) ( not ( = ?auto_11817 ?auto_11821 ) ) ( not ( = ?auto_11813 ?auto_11821 ) ) ( not ( = ?auto_11818 ?auto_11821 ) ) ( HOIST-AT ?auto_11815 ?auto_11821 ) ( not ( = ?auto_11825 ?auto_11815 ) ) ( not ( = ?auto_11808 ?auto_11815 ) ) ( not ( = ?auto_11822 ?auto_11815 ) ) ( not ( = ?auto_11810 ?auto_11815 ) ) ( AVAILABLE ?auto_11815 ) ( SURFACE-AT ?auto_11812 ?auto_11821 ) ( ON ?auto_11812 ?auto_11826 ) ( CLEAR ?auto_11812 ) ( not ( = ?auto_11805 ?auto_11826 ) ) ( not ( = ?auto_11806 ?auto_11826 ) ) ( not ( = ?auto_11824 ?auto_11826 ) ) ( not ( = ?auto_11809 ?auto_11826 ) ) ( not ( = ?auto_11814 ?auto_11826 ) ) ( not ( = ?auto_11820 ?auto_11826 ) ) ( not ( = ?auto_11816 ?auto_11826 ) ) ( not ( = ?auto_11812 ?auto_11826 ) ) ( not ( = ?auto_11807 ?auto_11826 ) ) ( not ( = ?auto_11811 ?auto_11826 ) ) )
    :subtasks
    ( ( !LIFT ?auto_11815 ?auto_11812 ?auto_11826 ?auto_11821 )
      ( MAKE-ON ?auto_11805 ?auto_11806 )
      ( MAKE-ON-VERIFY ?auto_11805 ?auto_11806 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_11827 - SURFACE
      ?auto_11828 - SURFACE
    )
    :vars
    (
      ?auto_11829 - HOIST
      ?auto_11841 - PLACE
      ?auto_11834 - PLACE
      ?auto_11832 - HOIST
      ?auto_11836 - SURFACE
      ?auto_11837 - SURFACE
      ?auto_11843 - PLACE
      ?auto_11842 - HOIST
      ?auto_11835 - SURFACE
      ?auto_11845 - SURFACE
      ?auto_11831 - PLACE
      ?auto_11840 - HOIST
      ?auto_11839 - SURFACE
      ?auto_11833 - SURFACE
      ?auto_11848 - SURFACE
      ?auto_11844 - SURFACE
      ?auto_11838 - PLACE
      ?auto_11847 - HOIST
      ?auto_11846 - SURFACE
      ?auto_11830 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11829 ?auto_11841 ) ( IS-CRATE ?auto_11827 ) ( not ( = ?auto_11827 ?auto_11828 ) ) ( not ( = ?auto_11834 ?auto_11841 ) ) ( HOIST-AT ?auto_11832 ?auto_11834 ) ( not ( = ?auto_11829 ?auto_11832 ) ) ( SURFACE-AT ?auto_11827 ?auto_11834 ) ( ON ?auto_11827 ?auto_11836 ) ( CLEAR ?auto_11827 ) ( not ( = ?auto_11827 ?auto_11836 ) ) ( not ( = ?auto_11828 ?auto_11836 ) ) ( IS-CRATE ?auto_11828 ) ( not ( = ?auto_11827 ?auto_11837 ) ) ( not ( = ?auto_11828 ?auto_11837 ) ) ( not ( = ?auto_11836 ?auto_11837 ) ) ( not ( = ?auto_11843 ?auto_11841 ) ) ( not ( = ?auto_11834 ?auto_11843 ) ) ( HOIST-AT ?auto_11842 ?auto_11843 ) ( not ( = ?auto_11829 ?auto_11842 ) ) ( not ( = ?auto_11832 ?auto_11842 ) ) ( AVAILABLE ?auto_11842 ) ( SURFACE-AT ?auto_11828 ?auto_11843 ) ( ON ?auto_11828 ?auto_11835 ) ( CLEAR ?auto_11828 ) ( not ( = ?auto_11827 ?auto_11835 ) ) ( not ( = ?auto_11828 ?auto_11835 ) ) ( not ( = ?auto_11836 ?auto_11835 ) ) ( not ( = ?auto_11837 ?auto_11835 ) ) ( IS-CRATE ?auto_11837 ) ( not ( = ?auto_11827 ?auto_11845 ) ) ( not ( = ?auto_11828 ?auto_11845 ) ) ( not ( = ?auto_11836 ?auto_11845 ) ) ( not ( = ?auto_11837 ?auto_11845 ) ) ( not ( = ?auto_11835 ?auto_11845 ) ) ( not ( = ?auto_11831 ?auto_11841 ) ) ( not ( = ?auto_11834 ?auto_11831 ) ) ( not ( = ?auto_11843 ?auto_11831 ) ) ( HOIST-AT ?auto_11840 ?auto_11831 ) ( not ( = ?auto_11829 ?auto_11840 ) ) ( not ( = ?auto_11832 ?auto_11840 ) ) ( not ( = ?auto_11842 ?auto_11840 ) ) ( AVAILABLE ?auto_11840 ) ( SURFACE-AT ?auto_11837 ?auto_11831 ) ( ON ?auto_11837 ?auto_11839 ) ( CLEAR ?auto_11837 ) ( not ( = ?auto_11827 ?auto_11839 ) ) ( not ( = ?auto_11828 ?auto_11839 ) ) ( not ( = ?auto_11836 ?auto_11839 ) ) ( not ( = ?auto_11837 ?auto_11839 ) ) ( not ( = ?auto_11835 ?auto_11839 ) ) ( not ( = ?auto_11845 ?auto_11839 ) ) ( IS-CRATE ?auto_11845 ) ( not ( = ?auto_11827 ?auto_11833 ) ) ( not ( = ?auto_11828 ?auto_11833 ) ) ( not ( = ?auto_11836 ?auto_11833 ) ) ( not ( = ?auto_11837 ?auto_11833 ) ) ( not ( = ?auto_11835 ?auto_11833 ) ) ( not ( = ?auto_11845 ?auto_11833 ) ) ( not ( = ?auto_11839 ?auto_11833 ) ) ( AVAILABLE ?auto_11832 ) ( SURFACE-AT ?auto_11845 ?auto_11834 ) ( ON ?auto_11845 ?auto_11848 ) ( CLEAR ?auto_11845 ) ( not ( = ?auto_11827 ?auto_11848 ) ) ( not ( = ?auto_11828 ?auto_11848 ) ) ( not ( = ?auto_11836 ?auto_11848 ) ) ( not ( = ?auto_11837 ?auto_11848 ) ) ( not ( = ?auto_11835 ?auto_11848 ) ) ( not ( = ?auto_11845 ?auto_11848 ) ) ( not ( = ?auto_11839 ?auto_11848 ) ) ( not ( = ?auto_11833 ?auto_11848 ) ) ( SURFACE-AT ?auto_11844 ?auto_11841 ) ( CLEAR ?auto_11844 ) ( IS-CRATE ?auto_11833 ) ( not ( = ?auto_11827 ?auto_11844 ) ) ( not ( = ?auto_11828 ?auto_11844 ) ) ( not ( = ?auto_11836 ?auto_11844 ) ) ( not ( = ?auto_11837 ?auto_11844 ) ) ( not ( = ?auto_11835 ?auto_11844 ) ) ( not ( = ?auto_11845 ?auto_11844 ) ) ( not ( = ?auto_11839 ?auto_11844 ) ) ( not ( = ?auto_11833 ?auto_11844 ) ) ( not ( = ?auto_11848 ?auto_11844 ) ) ( AVAILABLE ?auto_11829 ) ( not ( = ?auto_11838 ?auto_11841 ) ) ( not ( = ?auto_11834 ?auto_11838 ) ) ( not ( = ?auto_11843 ?auto_11838 ) ) ( not ( = ?auto_11831 ?auto_11838 ) ) ( HOIST-AT ?auto_11847 ?auto_11838 ) ( not ( = ?auto_11829 ?auto_11847 ) ) ( not ( = ?auto_11832 ?auto_11847 ) ) ( not ( = ?auto_11842 ?auto_11847 ) ) ( not ( = ?auto_11840 ?auto_11847 ) ) ( AVAILABLE ?auto_11847 ) ( SURFACE-AT ?auto_11833 ?auto_11838 ) ( ON ?auto_11833 ?auto_11846 ) ( CLEAR ?auto_11833 ) ( not ( = ?auto_11827 ?auto_11846 ) ) ( not ( = ?auto_11828 ?auto_11846 ) ) ( not ( = ?auto_11836 ?auto_11846 ) ) ( not ( = ?auto_11837 ?auto_11846 ) ) ( not ( = ?auto_11835 ?auto_11846 ) ) ( not ( = ?auto_11845 ?auto_11846 ) ) ( not ( = ?auto_11839 ?auto_11846 ) ) ( not ( = ?auto_11833 ?auto_11846 ) ) ( not ( = ?auto_11848 ?auto_11846 ) ) ( not ( = ?auto_11844 ?auto_11846 ) ) ( TRUCK-AT ?auto_11830 ?auto_11841 ) )
    :subtasks
    ( ( !DRIVE ?auto_11830 ?auto_11841 ?auto_11838 )
      ( MAKE-ON ?auto_11827 ?auto_11828 )
      ( MAKE-ON-VERIFY ?auto_11827 ?auto_11828 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_11849 - SURFACE
      ?auto_11850 - SURFACE
    )
    :vars
    (
      ?auto_11860 - HOIST
      ?auto_11854 - PLACE
      ?auto_11851 - PLACE
      ?auto_11853 - HOIST
      ?auto_11864 - SURFACE
      ?auto_11870 - SURFACE
      ?auto_11861 - PLACE
      ?auto_11858 - HOIST
      ?auto_11852 - SURFACE
      ?auto_11865 - SURFACE
      ?auto_11856 - PLACE
      ?auto_11859 - HOIST
      ?auto_11857 - SURFACE
      ?auto_11862 - SURFACE
      ?auto_11868 - SURFACE
      ?auto_11869 - SURFACE
      ?auto_11855 - PLACE
      ?auto_11867 - HOIST
      ?auto_11866 - SURFACE
      ?auto_11863 - TRUCK
      ?auto_11871 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11860 ?auto_11854 ) ( IS-CRATE ?auto_11849 ) ( not ( = ?auto_11849 ?auto_11850 ) ) ( not ( = ?auto_11851 ?auto_11854 ) ) ( HOIST-AT ?auto_11853 ?auto_11851 ) ( not ( = ?auto_11860 ?auto_11853 ) ) ( SURFACE-AT ?auto_11849 ?auto_11851 ) ( ON ?auto_11849 ?auto_11864 ) ( CLEAR ?auto_11849 ) ( not ( = ?auto_11849 ?auto_11864 ) ) ( not ( = ?auto_11850 ?auto_11864 ) ) ( IS-CRATE ?auto_11850 ) ( not ( = ?auto_11849 ?auto_11870 ) ) ( not ( = ?auto_11850 ?auto_11870 ) ) ( not ( = ?auto_11864 ?auto_11870 ) ) ( not ( = ?auto_11861 ?auto_11854 ) ) ( not ( = ?auto_11851 ?auto_11861 ) ) ( HOIST-AT ?auto_11858 ?auto_11861 ) ( not ( = ?auto_11860 ?auto_11858 ) ) ( not ( = ?auto_11853 ?auto_11858 ) ) ( AVAILABLE ?auto_11858 ) ( SURFACE-AT ?auto_11850 ?auto_11861 ) ( ON ?auto_11850 ?auto_11852 ) ( CLEAR ?auto_11850 ) ( not ( = ?auto_11849 ?auto_11852 ) ) ( not ( = ?auto_11850 ?auto_11852 ) ) ( not ( = ?auto_11864 ?auto_11852 ) ) ( not ( = ?auto_11870 ?auto_11852 ) ) ( IS-CRATE ?auto_11870 ) ( not ( = ?auto_11849 ?auto_11865 ) ) ( not ( = ?auto_11850 ?auto_11865 ) ) ( not ( = ?auto_11864 ?auto_11865 ) ) ( not ( = ?auto_11870 ?auto_11865 ) ) ( not ( = ?auto_11852 ?auto_11865 ) ) ( not ( = ?auto_11856 ?auto_11854 ) ) ( not ( = ?auto_11851 ?auto_11856 ) ) ( not ( = ?auto_11861 ?auto_11856 ) ) ( HOIST-AT ?auto_11859 ?auto_11856 ) ( not ( = ?auto_11860 ?auto_11859 ) ) ( not ( = ?auto_11853 ?auto_11859 ) ) ( not ( = ?auto_11858 ?auto_11859 ) ) ( AVAILABLE ?auto_11859 ) ( SURFACE-AT ?auto_11870 ?auto_11856 ) ( ON ?auto_11870 ?auto_11857 ) ( CLEAR ?auto_11870 ) ( not ( = ?auto_11849 ?auto_11857 ) ) ( not ( = ?auto_11850 ?auto_11857 ) ) ( not ( = ?auto_11864 ?auto_11857 ) ) ( not ( = ?auto_11870 ?auto_11857 ) ) ( not ( = ?auto_11852 ?auto_11857 ) ) ( not ( = ?auto_11865 ?auto_11857 ) ) ( IS-CRATE ?auto_11865 ) ( not ( = ?auto_11849 ?auto_11862 ) ) ( not ( = ?auto_11850 ?auto_11862 ) ) ( not ( = ?auto_11864 ?auto_11862 ) ) ( not ( = ?auto_11870 ?auto_11862 ) ) ( not ( = ?auto_11852 ?auto_11862 ) ) ( not ( = ?auto_11865 ?auto_11862 ) ) ( not ( = ?auto_11857 ?auto_11862 ) ) ( AVAILABLE ?auto_11853 ) ( SURFACE-AT ?auto_11865 ?auto_11851 ) ( ON ?auto_11865 ?auto_11868 ) ( CLEAR ?auto_11865 ) ( not ( = ?auto_11849 ?auto_11868 ) ) ( not ( = ?auto_11850 ?auto_11868 ) ) ( not ( = ?auto_11864 ?auto_11868 ) ) ( not ( = ?auto_11870 ?auto_11868 ) ) ( not ( = ?auto_11852 ?auto_11868 ) ) ( not ( = ?auto_11865 ?auto_11868 ) ) ( not ( = ?auto_11857 ?auto_11868 ) ) ( not ( = ?auto_11862 ?auto_11868 ) ) ( IS-CRATE ?auto_11862 ) ( not ( = ?auto_11849 ?auto_11869 ) ) ( not ( = ?auto_11850 ?auto_11869 ) ) ( not ( = ?auto_11864 ?auto_11869 ) ) ( not ( = ?auto_11870 ?auto_11869 ) ) ( not ( = ?auto_11852 ?auto_11869 ) ) ( not ( = ?auto_11865 ?auto_11869 ) ) ( not ( = ?auto_11857 ?auto_11869 ) ) ( not ( = ?auto_11862 ?auto_11869 ) ) ( not ( = ?auto_11868 ?auto_11869 ) ) ( not ( = ?auto_11855 ?auto_11854 ) ) ( not ( = ?auto_11851 ?auto_11855 ) ) ( not ( = ?auto_11861 ?auto_11855 ) ) ( not ( = ?auto_11856 ?auto_11855 ) ) ( HOIST-AT ?auto_11867 ?auto_11855 ) ( not ( = ?auto_11860 ?auto_11867 ) ) ( not ( = ?auto_11853 ?auto_11867 ) ) ( not ( = ?auto_11858 ?auto_11867 ) ) ( not ( = ?auto_11859 ?auto_11867 ) ) ( AVAILABLE ?auto_11867 ) ( SURFACE-AT ?auto_11862 ?auto_11855 ) ( ON ?auto_11862 ?auto_11866 ) ( CLEAR ?auto_11862 ) ( not ( = ?auto_11849 ?auto_11866 ) ) ( not ( = ?auto_11850 ?auto_11866 ) ) ( not ( = ?auto_11864 ?auto_11866 ) ) ( not ( = ?auto_11870 ?auto_11866 ) ) ( not ( = ?auto_11852 ?auto_11866 ) ) ( not ( = ?auto_11865 ?auto_11866 ) ) ( not ( = ?auto_11857 ?auto_11866 ) ) ( not ( = ?auto_11862 ?auto_11866 ) ) ( not ( = ?auto_11868 ?auto_11866 ) ) ( not ( = ?auto_11869 ?auto_11866 ) ) ( TRUCK-AT ?auto_11863 ?auto_11854 ) ( SURFACE-AT ?auto_11871 ?auto_11854 ) ( CLEAR ?auto_11871 ) ( LIFTING ?auto_11860 ?auto_11869 ) ( IS-CRATE ?auto_11869 ) ( not ( = ?auto_11849 ?auto_11871 ) ) ( not ( = ?auto_11850 ?auto_11871 ) ) ( not ( = ?auto_11864 ?auto_11871 ) ) ( not ( = ?auto_11870 ?auto_11871 ) ) ( not ( = ?auto_11852 ?auto_11871 ) ) ( not ( = ?auto_11865 ?auto_11871 ) ) ( not ( = ?auto_11857 ?auto_11871 ) ) ( not ( = ?auto_11862 ?auto_11871 ) ) ( not ( = ?auto_11868 ?auto_11871 ) ) ( not ( = ?auto_11869 ?auto_11871 ) ) ( not ( = ?auto_11866 ?auto_11871 ) ) )
    :subtasks
    ( ( !DROP ?auto_11860 ?auto_11869 ?auto_11871 ?auto_11854 )
      ( MAKE-ON ?auto_11849 ?auto_11850 )
      ( MAKE-ON-VERIFY ?auto_11849 ?auto_11850 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_11872 - SURFACE
      ?auto_11873 - SURFACE
    )
    :vars
    (
      ?auto_11882 - HOIST
      ?auto_11894 - PLACE
      ?auto_11877 - PLACE
      ?auto_11888 - HOIST
      ?auto_11880 - SURFACE
      ?auto_11887 - SURFACE
      ?auto_11881 - PLACE
      ?auto_11883 - HOIST
      ?auto_11878 - SURFACE
      ?auto_11892 - SURFACE
      ?auto_11884 - PLACE
      ?auto_11889 - HOIST
      ?auto_11893 - SURFACE
      ?auto_11876 - SURFACE
      ?auto_11874 - SURFACE
      ?auto_11886 - SURFACE
      ?auto_11879 - PLACE
      ?auto_11875 - HOIST
      ?auto_11890 - SURFACE
      ?auto_11885 - TRUCK
      ?auto_11891 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11882 ?auto_11894 ) ( IS-CRATE ?auto_11872 ) ( not ( = ?auto_11872 ?auto_11873 ) ) ( not ( = ?auto_11877 ?auto_11894 ) ) ( HOIST-AT ?auto_11888 ?auto_11877 ) ( not ( = ?auto_11882 ?auto_11888 ) ) ( SURFACE-AT ?auto_11872 ?auto_11877 ) ( ON ?auto_11872 ?auto_11880 ) ( CLEAR ?auto_11872 ) ( not ( = ?auto_11872 ?auto_11880 ) ) ( not ( = ?auto_11873 ?auto_11880 ) ) ( IS-CRATE ?auto_11873 ) ( not ( = ?auto_11872 ?auto_11887 ) ) ( not ( = ?auto_11873 ?auto_11887 ) ) ( not ( = ?auto_11880 ?auto_11887 ) ) ( not ( = ?auto_11881 ?auto_11894 ) ) ( not ( = ?auto_11877 ?auto_11881 ) ) ( HOIST-AT ?auto_11883 ?auto_11881 ) ( not ( = ?auto_11882 ?auto_11883 ) ) ( not ( = ?auto_11888 ?auto_11883 ) ) ( AVAILABLE ?auto_11883 ) ( SURFACE-AT ?auto_11873 ?auto_11881 ) ( ON ?auto_11873 ?auto_11878 ) ( CLEAR ?auto_11873 ) ( not ( = ?auto_11872 ?auto_11878 ) ) ( not ( = ?auto_11873 ?auto_11878 ) ) ( not ( = ?auto_11880 ?auto_11878 ) ) ( not ( = ?auto_11887 ?auto_11878 ) ) ( IS-CRATE ?auto_11887 ) ( not ( = ?auto_11872 ?auto_11892 ) ) ( not ( = ?auto_11873 ?auto_11892 ) ) ( not ( = ?auto_11880 ?auto_11892 ) ) ( not ( = ?auto_11887 ?auto_11892 ) ) ( not ( = ?auto_11878 ?auto_11892 ) ) ( not ( = ?auto_11884 ?auto_11894 ) ) ( not ( = ?auto_11877 ?auto_11884 ) ) ( not ( = ?auto_11881 ?auto_11884 ) ) ( HOIST-AT ?auto_11889 ?auto_11884 ) ( not ( = ?auto_11882 ?auto_11889 ) ) ( not ( = ?auto_11888 ?auto_11889 ) ) ( not ( = ?auto_11883 ?auto_11889 ) ) ( AVAILABLE ?auto_11889 ) ( SURFACE-AT ?auto_11887 ?auto_11884 ) ( ON ?auto_11887 ?auto_11893 ) ( CLEAR ?auto_11887 ) ( not ( = ?auto_11872 ?auto_11893 ) ) ( not ( = ?auto_11873 ?auto_11893 ) ) ( not ( = ?auto_11880 ?auto_11893 ) ) ( not ( = ?auto_11887 ?auto_11893 ) ) ( not ( = ?auto_11878 ?auto_11893 ) ) ( not ( = ?auto_11892 ?auto_11893 ) ) ( IS-CRATE ?auto_11892 ) ( not ( = ?auto_11872 ?auto_11876 ) ) ( not ( = ?auto_11873 ?auto_11876 ) ) ( not ( = ?auto_11880 ?auto_11876 ) ) ( not ( = ?auto_11887 ?auto_11876 ) ) ( not ( = ?auto_11878 ?auto_11876 ) ) ( not ( = ?auto_11892 ?auto_11876 ) ) ( not ( = ?auto_11893 ?auto_11876 ) ) ( AVAILABLE ?auto_11888 ) ( SURFACE-AT ?auto_11892 ?auto_11877 ) ( ON ?auto_11892 ?auto_11874 ) ( CLEAR ?auto_11892 ) ( not ( = ?auto_11872 ?auto_11874 ) ) ( not ( = ?auto_11873 ?auto_11874 ) ) ( not ( = ?auto_11880 ?auto_11874 ) ) ( not ( = ?auto_11887 ?auto_11874 ) ) ( not ( = ?auto_11878 ?auto_11874 ) ) ( not ( = ?auto_11892 ?auto_11874 ) ) ( not ( = ?auto_11893 ?auto_11874 ) ) ( not ( = ?auto_11876 ?auto_11874 ) ) ( IS-CRATE ?auto_11876 ) ( not ( = ?auto_11872 ?auto_11886 ) ) ( not ( = ?auto_11873 ?auto_11886 ) ) ( not ( = ?auto_11880 ?auto_11886 ) ) ( not ( = ?auto_11887 ?auto_11886 ) ) ( not ( = ?auto_11878 ?auto_11886 ) ) ( not ( = ?auto_11892 ?auto_11886 ) ) ( not ( = ?auto_11893 ?auto_11886 ) ) ( not ( = ?auto_11876 ?auto_11886 ) ) ( not ( = ?auto_11874 ?auto_11886 ) ) ( not ( = ?auto_11879 ?auto_11894 ) ) ( not ( = ?auto_11877 ?auto_11879 ) ) ( not ( = ?auto_11881 ?auto_11879 ) ) ( not ( = ?auto_11884 ?auto_11879 ) ) ( HOIST-AT ?auto_11875 ?auto_11879 ) ( not ( = ?auto_11882 ?auto_11875 ) ) ( not ( = ?auto_11888 ?auto_11875 ) ) ( not ( = ?auto_11883 ?auto_11875 ) ) ( not ( = ?auto_11889 ?auto_11875 ) ) ( AVAILABLE ?auto_11875 ) ( SURFACE-AT ?auto_11876 ?auto_11879 ) ( ON ?auto_11876 ?auto_11890 ) ( CLEAR ?auto_11876 ) ( not ( = ?auto_11872 ?auto_11890 ) ) ( not ( = ?auto_11873 ?auto_11890 ) ) ( not ( = ?auto_11880 ?auto_11890 ) ) ( not ( = ?auto_11887 ?auto_11890 ) ) ( not ( = ?auto_11878 ?auto_11890 ) ) ( not ( = ?auto_11892 ?auto_11890 ) ) ( not ( = ?auto_11893 ?auto_11890 ) ) ( not ( = ?auto_11876 ?auto_11890 ) ) ( not ( = ?auto_11874 ?auto_11890 ) ) ( not ( = ?auto_11886 ?auto_11890 ) ) ( TRUCK-AT ?auto_11885 ?auto_11894 ) ( SURFACE-AT ?auto_11891 ?auto_11894 ) ( CLEAR ?auto_11891 ) ( IS-CRATE ?auto_11886 ) ( not ( = ?auto_11872 ?auto_11891 ) ) ( not ( = ?auto_11873 ?auto_11891 ) ) ( not ( = ?auto_11880 ?auto_11891 ) ) ( not ( = ?auto_11887 ?auto_11891 ) ) ( not ( = ?auto_11878 ?auto_11891 ) ) ( not ( = ?auto_11892 ?auto_11891 ) ) ( not ( = ?auto_11893 ?auto_11891 ) ) ( not ( = ?auto_11876 ?auto_11891 ) ) ( not ( = ?auto_11874 ?auto_11891 ) ) ( not ( = ?auto_11886 ?auto_11891 ) ) ( not ( = ?auto_11890 ?auto_11891 ) ) ( AVAILABLE ?auto_11882 ) ( IN ?auto_11886 ?auto_11885 ) )
    :subtasks
    ( ( !UNLOAD ?auto_11882 ?auto_11886 ?auto_11885 ?auto_11894 )
      ( MAKE-ON ?auto_11872 ?auto_11873 )
      ( MAKE-ON-VERIFY ?auto_11872 ?auto_11873 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_11895 - SURFACE
      ?auto_11896 - SURFACE
    )
    :vars
    (
      ?auto_11913 - HOIST
      ?auto_11908 - PLACE
      ?auto_11915 - PLACE
      ?auto_11916 - HOIST
      ?auto_11912 - SURFACE
      ?auto_11911 - SURFACE
      ?auto_11910 - PLACE
      ?auto_11900 - HOIST
      ?auto_11898 - SURFACE
      ?auto_11905 - SURFACE
      ?auto_11897 - PLACE
      ?auto_11914 - HOIST
      ?auto_11904 - SURFACE
      ?auto_11902 - SURFACE
      ?auto_11903 - SURFACE
      ?auto_11917 - SURFACE
      ?auto_11899 - PLACE
      ?auto_11901 - HOIST
      ?auto_11907 - SURFACE
      ?auto_11906 - SURFACE
      ?auto_11909 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11913 ?auto_11908 ) ( IS-CRATE ?auto_11895 ) ( not ( = ?auto_11895 ?auto_11896 ) ) ( not ( = ?auto_11915 ?auto_11908 ) ) ( HOIST-AT ?auto_11916 ?auto_11915 ) ( not ( = ?auto_11913 ?auto_11916 ) ) ( SURFACE-AT ?auto_11895 ?auto_11915 ) ( ON ?auto_11895 ?auto_11912 ) ( CLEAR ?auto_11895 ) ( not ( = ?auto_11895 ?auto_11912 ) ) ( not ( = ?auto_11896 ?auto_11912 ) ) ( IS-CRATE ?auto_11896 ) ( not ( = ?auto_11895 ?auto_11911 ) ) ( not ( = ?auto_11896 ?auto_11911 ) ) ( not ( = ?auto_11912 ?auto_11911 ) ) ( not ( = ?auto_11910 ?auto_11908 ) ) ( not ( = ?auto_11915 ?auto_11910 ) ) ( HOIST-AT ?auto_11900 ?auto_11910 ) ( not ( = ?auto_11913 ?auto_11900 ) ) ( not ( = ?auto_11916 ?auto_11900 ) ) ( AVAILABLE ?auto_11900 ) ( SURFACE-AT ?auto_11896 ?auto_11910 ) ( ON ?auto_11896 ?auto_11898 ) ( CLEAR ?auto_11896 ) ( not ( = ?auto_11895 ?auto_11898 ) ) ( not ( = ?auto_11896 ?auto_11898 ) ) ( not ( = ?auto_11912 ?auto_11898 ) ) ( not ( = ?auto_11911 ?auto_11898 ) ) ( IS-CRATE ?auto_11911 ) ( not ( = ?auto_11895 ?auto_11905 ) ) ( not ( = ?auto_11896 ?auto_11905 ) ) ( not ( = ?auto_11912 ?auto_11905 ) ) ( not ( = ?auto_11911 ?auto_11905 ) ) ( not ( = ?auto_11898 ?auto_11905 ) ) ( not ( = ?auto_11897 ?auto_11908 ) ) ( not ( = ?auto_11915 ?auto_11897 ) ) ( not ( = ?auto_11910 ?auto_11897 ) ) ( HOIST-AT ?auto_11914 ?auto_11897 ) ( not ( = ?auto_11913 ?auto_11914 ) ) ( not ( = ?auto_11916 ?auto_11914 ) ) ( not ( = ?auto_11900 ?auto_11914 ) ) ( AVAILABLE ?auto_11914 ) ( SURFACE-AT ?auto_11911 ?auto_11897 ) ( ON ?auto_11911 ?auto_11904 ) ( CLEAR ?auto_11911 ) ( not ( = ?auto_11895 ?auto_11904 ) ) ( not ( = ?auto_11896 ?auto_11904 ) ) ( not ( = ?auto_11912 ?auto_11904 ) ) ( not ( = ?auto_11911 ?auto_11904 ) ) ( not ( = ?auto_11898 ?auto_11904 ) ) ( not ( = ?auto_11905 ?auto_11904 ) ) ( IS-CRATE ?auto_11905 ) ( not ( = ?auto_11895 ?auto_11902 ) ) ( not ( = ?auto_11896 ?auto_11902 ) ) ( not ( = ?auto_11912 ?auto_11902 ) ) ( not ( = ?auto_11911 ?auto_11902 ) ) ( not ( = ?auto_11898 ?auto_11902 ) ) ( not ( = ?auto_11905 ?auto_11902 ) ) ( not ( = ?auto_11904 ?auto_11902 ) ) ( AVAILABLE ?auto_11916 ) ( SURFACE-AT ?auto_11905 ?auto_11915 ) ( ON ?auto_11905 ?auto_11903 ) ( CLEAR ?auto_11905 ) ( not ( = ?auto_11895 ?auto_11903 ) ) ( not ( = ?auto_11896 ?auto_11903 ) ) ( not ( = ?auto_11912 ?auto_11903 ) ) ( not ( = ?auto_11911 ?auto_11903 ) ) ( not ( = ?auto_11898 ?auto_11903 ) ) ( not ( = ?auto_11905 ?auto_11903 ) ) ( not ( = ?auto_11904 ?auto_11903 ) ) ( not ( = ?auto_11902 ?auto_11903 ) ) ( IS-CRATE ?auto_11902 ) ( not ( = ?auto_11895 ?auto_11917 ) ) ( not ( = ?auto_11896 ?auto_11917 ) ) ( not ( = ?auto_11912 ?auto_11917 ) ) ( not ( = ?auto_11911 ?auto_11917 ) ) ( not ( = ?auto_11898 ?auto_11917 ) ) ( not ( = ?auto_11905 ?auto_11917 ) ) ( not ( = ?auto_11904 ?auto_11917 ) ) ( not ( = ?auto_11902 ?auto_11917 ) ) ( not ( = ?auto_11903 ?auto_11917 ) ) ( not ( = ?auto_11899 ?auto_11908 ) ) ( not ( = ?auto_11915 ?auto_11899 ) ) ( not ( = ?auto_11910 ?auto_11899 ) ) ( not ( = ?auto_11897 ?auto_11899 ) ) ( HOIST-AT ?auto_11901 ?auto_11899 ) ( not ( = ?auto_11913 ?auto_11901 ) ) ( not ( = ?auto_11916 ?auto_11901 ) ) ( not ( = ?auto_11900 ?auto_11901 ) ) ( not ( = ?auto_11914 ?auto_11901 ) ) ( AVAILABLE ?auto_11901 ) ( SURFACE-AT ?auto_11902 ?auto_11899 ) ( ON ?auto_11902 ?auto_11907 ) ( CLEAR ?auto_11902 ) ( not ( = ?auto_11895 ?auto_11907 ) ) ( not ( = ?auto_11896 ?auto_11907 ) ) ( not ( = ?auto_11912 ?auto_11907 ) ) ( not ( = ?auto_11911 ?auto_11907 ) ) ( not ( = ?auto_11898 ?auto_11907 ) ) ( not ( = ?auto_11905 ?auto_11907 ) ) ( not ( = ?auto_11904 ?auto_11907 ) ) ( not ( = ?auto_11902 ?auto_11907 ) ) ( not ( = ?auto_11903 ?auto_11907 ) ) ( not ( = ?auto_11917 ?auto_11907 ) ) ( SURFACE-AT ?auto_11906 ?auto_11908 ) ( CLEAR ?auto_11906 ) ( IS-CRATE ?auto_11917 ) ( not ( = ?auto_11895 ?auto_11906 ) ) ( not ( = ?auto_11896 ?auto_11906 ) ) ( not ( = ?auto_11912 ?auto_11906 ) ) ( not ( = ?auto_11911 ?auto_11906 ) ) ( not ( = ?auto_11898 ?auto_11906 ) ) ( not ( = ?auto_11905 ?auto_11906 ) ) ( not ( = ?auto_11904 ?auto_11906 ) ) ( not ( = ?auto_11902 ?auto_11906 ) ) ( not ( = ?auto_11903 ?auto_11906 ) ) ( not ( = ?auto_11917 ?auto_11906 ) ) ( not ( = ?auto_11907 ?auto_11906 ) ) ( AVAILABLE ?auto_11913 ) ( IN ?auto_11917 ?auto_11909 ) ( TRUCK-AT ?auto_11909 ?auto_11897 ) )
    :subtasks
    ( ( !DRIVE ?auto_11909 ?auto_11897 ?auto_11908 )
      ( MAKE-ON ?auto_11895 ?auto_11896 )
      ( MAKE-ON-VERIFY ?auto_11895 ?auto_11896 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_11918 - SURFACE
      ?auto_11919 - SURFACE
    )
    :vars
    (
      ?auto_11920 - HOIST
      ?auto_11921 - PLACE
      ?auto_11935 - PLACE
      ?auto_11939 - HOIST
      ?auto_11923 - SURFACE
      ?auto_11931 - SURFACE
      ?auto_11930 - PLACE
      ?auto_11924 - HOIST
      ?auto_11932 - SURFACE
      ?auto_11936 - SURFACE
      ?auto_11937 - PLACE
      ?auto_11934 - HOIST
      ?auto_11933 - SURFACE
      ?auto_11925 - SURFACE
      ?auto_11929 - SURFACE
      ?auto_11940 - SURFACE
      ?auto_11938 - PLACE
      ?auto_11922 - HOIST
      ?auto_11927 - SURFACE
      ?auto_11926 - SURFACE
      ?auto_11928 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11920 ?auto_11921 ) ( IS-CRATE ?auto_11918 ) ( not ( = ?auto_11918 ?auto_11919 ) ) ( not ( = ?auto_11935 ?auto_11921 ) ) ( HOIST-AT ?auto_11939 ?auto_11935 ) ( not ( = ?auto_11920 ?auto_11939 ) ) ( SURFACE-AT ?auto_11918 ?auto_11935 ) ( ON ?auto_11918 ?auto_11923 ) ( CLEAR ?auto_11918 ) ( not ( = ?auto_11918 ?auto_11923 ) ) ( not ( = ?auto_11919 ?auto_11923 ) ) ( IS-CRATE ?auto_11919 ) ( not ( = ?auto_11918 ?auto_11931 ) ) ( not ( = ?auto_11919 ?auto_11931 ) ) ( not ( = ?auto_11923 ?auto_11931 ) ) ( not ( = ?auto_11930 ?auto_11921 ) ) ( not ( = ?auto_11935 ?auto_11930 ) ) ( HOIST-AT ?auto_11924 ?auto_11930 ) ( not ( = ?auto_11920 ?auto_11924 ) ) ( not ( = ?auto_11939 ?auto_11924 ) ) ( AVAILABLE ?auto_11924 ) ( SURFACE-AT ?auto_11919 ?auto_11930 ) ( ON ?auto_11919 ?auto_11932 ) ( CLEAR ?auto_11919 ) ( not ( = ?auto_11918 ?auto_11932 ) ) ( not ( = ?auto_11919 ?auto_11932 ) ) ( not ( = ?auto_11923 ?auto_11932 ) ) ( not ( = ?auto_11931 ?auto_11932 ) ) ( IS-CRATE ?auto_11931 ) ( not ( = ?auto_11918 ?auto_11936 ) ) ( not ( = ?auto_11919 ?auto_11936 ) ) ( not ( = ?auto_11923 ?auto_11936 ) ) ( not ( = ?auto_11931 ?auto_11936 ) ) ( not ( = ?auto_11932 ?auto_11936 ) ) ( not ( = ?auto_11937 ?auto_11921 ) ) ( not ( = ?auto_11935 ?auto_11937 ) ) ( not ( = ?auto_11930 ?auto_11937 ) ) ( HOIST-AT ?auto_11934 ?auto_11937 ) ( not ( = ?auto_11920 ?auto_11934 ) ) ( not ( = ?auto_11939 ?auto_11934 ) ) ( not ( = ?auto_11924 ?auto_11934 ) ) ( SURFACE-AT ?auto_11931 ?auto_11937 ) ( ON ?auto_11931 ?auto_11933 ) ( CLEAR ?auto_11931 ) ( not ( = ?auto_11918 ?auto_11933 ) ) ( not ( = ?auto_11919 ?auto_11933 ) ) ( not ( = ?auto_11923 ?auto_11933 ) ) ( not ( = ?auto_11931 ?auto_11933 ) ) ( not ( = ?auto_11932 ?auto_11933 ) ) ( not ( = ?auto_11936 ?auto_11933 ) ) ( IS-CRATE ?auto_11936 ) ( not ( = ?auto_11918 ?auto_11925 ) ) ( not ( = ?auto_11919 ?auto_11925 ) ) ( not ( = ?auto_11923 ?auto_11925 ) ) ( not ( = ?auto_11931 ?auto_11925 ) ) ( not ( = ?auto_11932 ?auto_11925 ) ) ( not ( = ?auto_11936 ?auto_11925 ) ) ( not ( = ?auto_11933 ?auto_11925 ) ) ( AVAILABLE ?auto_11939 ) ( SURFACE-AT ?auto_11936 ?auto_11935 ) ( ON ?auto_11936 ?auto_11929 ) ( CLEAR ?auto_11936 ) ( not ( = ?auto_11918 ?auto_11929 ) ) ( not ( = ?auto_11919 ?auto_11929 ) ) ( not ( = ?auto_11923 ?auto_11929 ) ) ( not ( = ?auto_11931 ?auto_11929 ) ) ( not ( = ?auto_11932 ?auto_11929 ) ) ( not ( = ?auto_11936 ?auto_11929 ) ) ( not ( = ?auto_11933 ?auto_11929 ) ) ( not ( = ?auto_11925 ?auto_11929 ) ) ( IS-CRATE ?auto_11925 ) ( not ( = ?auto_11918 ?auto_11940 ) ) ( not ( = ?auto_11919 ?auto_11940 ) ) ( not ( = ?auto_11923 ?auto_11940 ) ) ( not ( = ?auto_11931 ?auto_11940 ) ) ( not ( = ?auto_11932 ?auto_11940 ) ) ( not ( = ?auto_11936 ?auto_11940 ) ) ( not ( = ?auto_11933 ?auto_11940 ) ) ( not ( = ?auto_11925 ?auto_11940 ) ) ( not ( = ?auto_11929 ?auto_11940 ) ) ( not ( = ?auto_11938 ?auto_11921 ) ) ( not ( = ?auto_11935 ?auto_11938 ) ) ( not ( = ?auto_11930 ?auto_11938 ) ) ( not ( = ?auto_11937 ?auto_11938 ) ) ( HOIST-AT ?auto_11922 ?auto_11938 ) ( not ( = ?auto_11920 ?auto_11922 ) ) ( not ( = ?auto_11939 ?auto_11922 ) ) ( not ( = ?auto_11924 ?auto_11922 ) ) ( not ( = ?auto_11934 ?auto_11922 ) ) ( AVAILABLE ?auto_11922 ) ( SURFACE-AT ?auto_11925 ?auto_11938 ) ( ON ?auto_11925 ?auto_11927 ) ( CLEAR ?auto_11925 ) ( not ( = ?auto_11918 ?auto_11927 ) ) ( not ( = ?auto_11919 ?auto_11927 ) ) ( not ( = ?auto_11923 ?auto_11927 ) ) ( not ( = ?auto_11931 ?auto_11927 ) ) ( not ( = ?auto_11932 ?auto_11927 ) ) ( not ( = ?auto_11936 ?auto_11927 ) ) ( not ( = ?auto_11933 ?auto_11927 ) ) ( not ( = ?auto_11925 ?auto_11927 ) ) ( not ( = ?auto_11929 ?auto_11927 ) ) ( not ( = ?auto_11940 ?auto_11927 ) ) ( SURFACE-AT ?auto_11926 ?auto_11921 ) ( CLEAR ?auto_11926 ) ( IS-CRATE ?auto_11940 ) ( not ( = ?auto_11918 ?auto_11926 ) ) ( not ( = ?auto_11919 ?auto_11926 ) ) ( not ( = ?auto_11923 ?auto_11926 ) ) ( not ( = ?auto_11931 ?auto_11926 ) ) ( not ( = ?auto_11932 ?auto_11926 ) ) ( not ( = ?auto_11936 ?auto_11926 ) ) ( not ( = ?auto_11933 ?auto_11926 ) ) ( not ( = ?auto_11925 ?auto_11926 ) ) ( not ( = ?auto_11929 ?auto_11926 ) ) ( not ( = ?auto_11940 ?auto_11926 ) ) ( not ( = ?auto_11927 ?auto_11926 ) ) ( AVAILABLE ?auto_11920 ) ( TRUCK-AT ?auto_11928 ?auto_11937 ) ( LIFTING ?auto_11934 ?auto_11940 ) )
    :subtasks
    ( ( !LOAD ?auto_11934 ?auto_11940 ?auto_11928 ?auto_11937 )
      ( MAKE-ON ?auto_11918 ?auto_11919 )
      ( MAKE-ON-VERIFY ?auto_11918 ?auto_11919 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_11941 - SURFACE
      ?auto_11942 - SURFACE
    )
    :vars
    (
      ?auto_11954 - HOIST
      ?auto_11958 - PLACE
      ?auto_11943 - PLACE
      ?auto_11945 - HOIST
      ?auto_11959 - SURFACE
      ?auto_11962 - SURFACE
      ?auto_11963 - PLACE
      ?auto_11960 - HOIST
      ?auto_11961 - SURFACE
      ?auto_11946 - SURFACE
      ?auto_11944 - PLACE
      ?auto_11955 - HOIST
      ?auto_11953 - SURFACE
      ?auto_11949 - SURFACE
      ?auto_11952 - SURFACE
      ?auto_11950 - SURFACE
      ?auto_11948 - PLACE
      ?auto_11957 - HOIST
      ?auto_11956 - SURFACE
      ?auto_11951 - SURFACE
      ?auto_11947 - TRUCK
      ?auto_11964 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11954 ?auto_11958 ) ( IS-CRATE ?auto_11941 ) ( not ( = ?auto_11941 ?auto_11942 ) ) ( not ( = ?auto_11943 ?auto_11958 ) ) ( HOIST-AT ?auto_11945 ?auto_11943 ) ( not ( = ?auto_11954 ?auto_11945 ) ) ( SURFACE-AT ?auto_11941 ?auto_11943 ) ( ON ?auto_11941 ?auto_11959 ) ( CLEAR ?auto_11941 ) ( not ( = ?auto_11941 ?auto_11959 ) ) ( not ( = ?auto_11942 ?auto_11959 ) ) ( IS-CRATE ?auto_11942 ) ( not ( = ?auto_11941 ?auto_11962 ) ) ( not ( = ?auto_11942 ?auto_11962 ) ) ( not ( = ?auto_11959 ?auto_11962 ) ) ( not ( = ?auto_11963 ?auto_11958 ) ) ( not ( = ?auto_11943 ?auto_11963 ) ) ( HOIST-AT ?auto_11960 ?auto_11963 ) ( not ( = ?auto_11954 ?auto_11960 ) ) ( not ( = ?auto_11945 ?auto_11960 ) ) ( AVAILABLE ?auto_11960 ) ( SURFACE-AT ?auto_11942 ?auto_11963 ) ( ON ?auto_11942 ?auto_11961 ) ( CLEAR ?auto_11942 ) ( not ( = ?auto_11941 ?auto_11961 ) ) ( not ( = ?auto_11942 ?auto_11961 ) ) ( not ( = ?auto_11959 ?auto_11961 ) ) ( not ( = ?auto_11962 ?auto_11961 ) ) ( IS-CRATE ?auto_11962 ) ( not ( = ?auto_11941 ?auto_11946 ) ) ( not ( = ?auto_11942 ?auto_11946 ) ) ( not ( = ?auto_11959 ?auto_11946 ) ) ( not ( = ?auto_11962 ?auto_11946 ) ) ( not ( = ?auto_11961 ?auto_11946 ) ) ( not ( = ?auto_11944 ?auto_11958 ) ) ( not ( = ?auto_11943 ?auto_11944 ) ) ( not ( = ?auto_11963 ?auto_11944 ) ) ( HOIST-AT ?auto_11955 ?auto_11944 ) ( not ( = ?auto_11954 ?auto_11955 ) ) ( not ( = ?auto_11945 ?auto_11955 ) ) ( not ( = ?auto_11960 ?auto_11955 ) ) ( SURFACE-AT ?auto_11962 ?auto_11944 ) ( ON ?auto_11962 ?auto_11953 ) ( CLEAR ?auto_11962 ) ( not ( = ?auto_11941 ?auto_11953 ) ) ( not ( = ?auto_11942 ?auto_11953 ) ) ( not ( = ?auto_11959 ?auto_11953 ) ) ( not ( = ?auto_11962 ?auto_11953 ) ) ( not ( = ?auto_11961 ?auto_11953 ) ) ( not ( = ?auto_11946 ?auto_11953 ) ) ( IS-CRATE ?auto_11946 ) ( not ( = ?auto_11941 ?auto_11949 ) ) ( not ( = ?auto_11942 ?auto_11949 ) ) ( not ( = ?auto_11959 ?auto_11949 ) ) ( not ( = ?auto_11962 ?auto_11949 ) ) ( not ( = ?auto_11961 ?auto_11949 ) ) ( not ( = ?auto_11946 ?auto_11949 ) ) ( not ( = ?auto_11953 ?auto_11949 ) ) ( AVAILABLE ?auto_11945 ) ( SURFACE-AT ?auto_11946 ?auto_11943 ) ( ON ?auto_11946 ?auto_11952 ) ( CLEAR ?auto_11946 ) ( not ( = ?auto_11941 ?auto_11952 ) ) ( not ( = ?auto_11942 ?auto_11952 ) ) ( not ( = ?auto_11959 ?auto_11952 ) ) ( not ( = ?auto_11962 ?auto_11952 ) ) ( not ( = ?auto_11961 ?auto_11952 ) ) ( not ( = ?auto_11946 ?auto_11952 ) ) ( not ( = ?auto_11953 ?auto_11952 ) ) ( not ( = ?auto_11949 ?auto_11952 ) ) ( IS-CRATE ?auto_11949 ) ( not ( = ?auto_11941 ?auto_11950 ) ) ( not ( = ?auto_11942 ?auto_11950 ) ) ( not ( = ?auto_11959 ?auto_11950 ) ) ( not ( = ?auto_11962 ?auto_11950 ) ) ( not ( = ?auto_11961 ?auto_11950 ) ) ( not ( = ?auto_11946 ?auto_11950 ) ) ( not ( = ?auto_11953 ?auto_11950 ) ) ( not ( = ?auto_11949 ?auto_11950 ) ) ( not ( = ?auto_11952 ?auto_11950 ) ) ( not ( = ?auto_11948 ?auto_11958 ) ) ( not ( = ?auto_11943 ?auto_11948 ) ) ( not ( = ?auto_11963 ?auto_11948 ) ) ( not ( = ?auto_11944 ?auto_11948 ) ) ( HOIST-AT ?auto_11957 ?auto_11948 ) ( not ( = ?auto_11954 ?auto_11957 ) ) ( not ( = ?auto_11945 ?auto_11957 ) ) ( not ( = ?auto_11960 ?auto_11957 ) ) ( not ( = ?auto_11955 ?auto_11957 ) ) ( AVAILABLE ?auto_11957 ) ( SURFACE-AT ?auto_11949 ?auto_11948 ) ( ON ?auto_11949 ?auto_11956 ) ( CLEAR ?auto_11949 ) ( not ( = ?auto_11941 ?auto_11956 ) ) ( not ( = ?auto_11942 ?auto_11956 ) ) ( not ( = ?auto_11959 ?auto_11956 ) ) ( not ( = ?auto_11962 ?auto_11956 ) ) ( not ( = ?auto_11961 ?auto_11956 ) ) ( not ( = ?auto_11946 ?auto_11956 ) ) ( not ( = ?auto_11953 ?auto_11956 ) ) ( not ( = ?auto_11949 ?auto_11956 ) ) ( not ( = ?auto_11952 ?auto_11956 ) ) ( not ( = ?auto_11950 ?auto_11956 ) ) ( SURFACE-AT ?auto_11951 ?auto_11958 ) ( CLEAR ?auto_11951 ) ( IS-CRATE ?auto_11950 ) ( not ( = ?auto_11941 ?auto_11951 ) ) ( not ( = ?auto_11942 ?auto_11951 ) ) ( not ( = ?auto_11959 ?auto_11951 ) ) ( not ( = ?auto_11962 ?auto_11951 ) ) ( not ( = ?auto_11961 ?auto_11951 ) ) ( not ( = ?auto_11946 ?auto_11951 ) ) ( not ( = ?auto_11953 ?auto_11951 ) ) ( not ( = ?auto_11949 ?auto_11951 ) ) ( not ( = ?auto_11952 ?auto_11951 ) ) ( not ( = ?auto_11950 ?auto_11951 ) ) ( not ( = ?auto_11956 ?auto_11951 ) ) ( AVAILABLE ?auto_11954 ) ( TRUCK-AT ?auto_11947 ?auto_11944 ) ( AVAILABLE ?auto_11955 ) ( SURFACE-AT ?auto_11950 ?auto_11944 ) ( ON ?auto_11950 ?auto_11964 ) ( CLEAR ?auto_11950 ) ( not ( = ?auto_11941 ?auto_11964 ) ) ( not ( = ?auto_11942 ?auto_11964 ) ) ( not ( = ?auto_11959 ?auto_11964 ) ) ( not ( = ?auto_11962 ?auto_11964 ) ) ( not ( = ?auto_11961 ?auto_11964 ) ) ( not ( = ?auto_11946 ?auto_11964 ) ) ( not ( = ?auto_11953 ?auto_11964 ) ) ( not ( = ?auto_11949 ?auto_11964 ) ) ( not ( = ?auto_11952 ?auto_11964 ) ) ( not ( = ?auto_11950 ?auto_11964 ) ) ( not ( = ?auto_11956 ?auto_11964 ) ) ( not ( = ?auto_11951 ?auto_11964 ) ) )
    :subtasks
    ( ( !LIFT ?auto_11955 ?auto_11950 ?auto_11964 ?auto_11944 )
      ( MAKE-ON ?auto_11941 ?auto_11942 )
      ( MAKE-ON-VERIFY ?auto_11941 ?auto_11942 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_11965 - SURFACE
      ?auto_11966 - SURFACE
    )
    :vars
    (
      ?auto_11974 - HOIST
      ?auto_11970 - PLACE
      ?auto_11968 - PLACE
      ?auto_11980 - HOIST
      ?auto_11985 - SURFACE
      ?auto_11988 - SURFACE
      ?auto_11969 - PLACE
      ?auto_11986 - HOIST
      ?auto_11987 - SURFACE
      ?auto_11976 - SURFACE
      ?auto_11981 - PLACE
      ?auto_11977 - HOIST
      ?auto_11973 - SURFACE
      ?auto_11984 - SURFACE
      ?auto_11967 - SURFACE
      ?auto_11979 - SURFACE
      ?auto_11971 - PLACE
      ?auto_11983 - HOIST
      ?auto_11978 - SURFACE
      ?auto_11972 - SURFACE
      ?auto_11982 - SURFACE
      ?auto_11975 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11974 ?auto_11970 ) ( IS-CRATE ?auto_11965 ) ( not ( = ?auto_11965 ?auto_11966 ) ) ( not ( = ?auto_11968 ?auto_11970 ) ) ( HOIST-AT ?auto_11980 ?auto_11968 ) ( not ( = ?auto_11974 ?auto_11980 ) ) ( SURFACE-AT ?auto_11965 ?auto_11968 ) ( ON ?auto_11965 ?auto_11985 ) ( CLEAR ?auto_11965 ) ( not ( = ?auto_11965 ?auto_11985 ) ) ( not ( = ?auto_11966 ?auto_11985 ) ) ( IS-CRATE ?auto_11966 ) ( not ( = ?auto_11965 ?auto_11988 ) ) ( not ( = ?auto_11966 ?auto_11988 ) ) ( not ( = ?auto_11985 ?auto_11988 ) ) ( not ( = ?auto_11969 ?auto_11970 ) ) ( not ( = ?auto_11968 ?auto_11969 ) ) ( HOIST-AT ?auto_11986 ?auto_11969 ) ( not ( = ?auto_11974 ?auto_11986 ) ) ( not ( = ?auto_11980 ?auto_11986 ) ) ( AVAILABLE ?auto_11986 ) ( SURFACE-AT ?auto_11966 ?auto_11969 ) ( ON ?auto_11966 ?auto_11987 ) ( CLEAR ?auto_11966 ) ( not ( = ?auto_11965 ?auto_11987 ) ) ( not ( = ?auto_11966 ?auto_11987 ) ) ( not ( = ?auto_11985 ?auto_11987 ) ) ( not ( = ?auto_11988 ?auto_11987 ) ) ( IS-CRATE ?auto_11988 ) ( not ( = ?auto_11965 ?auto_11976 ) ) ( not ( = ?auto_11966 ?auto_11976 ) ) ( not ( = ?auto_11985 ?auto_11976 ) ) ( not ( = ?auto_11988 ?auto_11976 ) ) ( not ( = ?auto_11987 ?auto_11976 ) ) ( not ( = ?auto_11981 ?auto_11970 ) ) ( not ( = ?auto_11968 ?auto_11981 ) ) ( not ( = ?auto_11969 ?auto_11981 ) ) ( HOIST-AT ?auto_11977 ?auto_11981 ) ( not ( = ?auto_11974 ?auto_11977 ) ) ( not ( = ?auto_11980 ?auto_11977 ) ) ( not ( = ?auto_11986 ?auto_11977 ) ) ( SURFACE-AT ?auto_11988 ?auto_11981 ) ( ON ?auto_11988 ?auto_11973 ) ( CLEAR ?auto_11988 ) ( not ( = ?auto_11965 ?auto_11973 ) ) ( not ( = ?auto_11966 ?auto_11973 ) ) ( not ( = ?auto_11985 ?auto_11973 ) ) ( not ( = ?auto_11988 ?auto_11973 ) ) ( not ( = ?auto_11987 ?auto_11973 ) ) ( not ( = ?auto_11976 ?auto_11973 ) ) ( IS-CRATE ?auto_11976 ) ( not ( = ?auto_11965 ?auto_11984 ) ) ( not ( = ?auto_11966 ?auto_11984 ) ) ( not ( = ?auto_11985 ?auto_11984 ) ) ( not ( = ?auto_11988 ?auto_11984 ) ) ( not ( = ?auto_11987 ?auto_11984 ) ) ( not ( = ?auto_11976 ?auto_11984 ) ) ( not ( = ?auto_11973 ?auto_11984 ) ) ( AVAILABLE ?auto_11980 ) ( SURFACE-AT ?auto_11976 ?auto_11968 ) ( ON ?auto_11976 ?auto_11967 ) ( CLEAR ?auto_11976 ) ( not ( = ?auto_11965 ?auto_11967 ) ) ( not ( = ?auto_11966 ?auto_11967 ) ) ( not ( = ?auto_11985 ?auto_11967 ) ) ( not ( = ?auto_11988 ?auto_11967 ) ) ( not ( = ?auto_11987 ?auto_11967 ) ) ( not ( = ?auto_11976 ?auto_11967 ) ) ( not ( = ?auto_11973 ?auto_11967 ) ) ( not ( = ?auto_11984 ?auto_11967 ) ) ( IS-CRATE ?auto_11984 ) ( not ( = ?auto_11965 ?auto_11979 ) ) ( not ( = ?auto_11966 ?auto_11979 ) ) ( not ( = ?auto_11985 ?auto_11979 ) ) ( not ( = ?auto_11988 ?auto_11979 ) ) ( not ( = ?auto_11987 ?auto_11979 ) ) ( not ( = ?auto_11976 ?auto_11979 ) ) ( not ( = ?auto_11973 ?auto_11979 ) ) ( not ( = ?auto_11984 ?auto_11979 ) ) ( not ( = ?auto_11967 ?auto_11979 ) ) ( not ( = ?auto_11971 ?auto_11970 ) ) ( not ( = ?auto_11968 ?auto_11971 ) ) ( not ( = ?auto_11969 ?auto_11971 ) ) ( not ( = ?auto_11981 ?auto_11971 ) ) ( HOIST-AT ?auto_11983 ?auto_11971 ) ( not ( = ?auto_11974 ?auto_11983 ) ) ( not ( = ?auto_11980 ?auto_11983 ) ) ( not ( = ?auto_11986 ?auto_11983 ) ) ( not ( = ?auto_11977 ?auto_11983 ) ) ( AVAILABLE ?auto_11983 ) ( SURFACE-AT ?auto_11984 ?auto_11971 ) ( ON ?auto_11984 ?auto_11978 ) ( CLEAR ?auto_11984 ) ( not ( = ?auto_11965 ?auto_11978 ) ) ( not ( = ?auto_11966 ?auto_11978 ) ) ( not ( = ?auto_11985 ?auto_11978 ) ) ( not ( = ?auto_11988 ?auto_11978 ) ) ( not ( = ?auto_11987 ?auto_11978 ) ) ( not ( = ?auto_11976 ?auto_11978 ) ) ( not ( = ?auto_11973 ?auto_11978 ) ) ( not ( = ?auto_11984 ?auto_11978 ) ) ( not ( = ?auto_11967 ?auto_11978 ) ) ( not ( = ?auto_11979 ?auto_11978 ) ) ( SURFACE-AT ?auto_11972 ?auto_11970 ) ( CLEAR ?auto_11972 ) ( IS-CRATE ?auto_11979 ) ( not ( = ?auto_11965 ?auto_11972 ) ) ( not ( = ?auto_11966 ?auto_11972 ) ) ( not ( = ?auto_11985 ?auto_11972 ) ) ( not ( = ?auto_11988 ?auto_11972 ) ) ( not ( = ?auto_11987 ?auto_11972 ) ) ( not ( = ?auto_11976 ?auto_11972 ) ) ( not ( = ?auto_11973 ?auto_11972 ) ) ( not ( = ?auto_11984 ?auto_11972 ) ) ( not ( = ?auto_11967 ?auto_11972 ) ) ( not ( = ?auto_11979 ?auto_11972 ) ) ( not ( = ?auto_11978 ?auto_11972 ) ) ( AVAILABLE ?auto_11974 ) ( AVAILABLE ?auto_11977 ) ( SURFACE-AT ?auto_11979 ?auto_11981 ) ( ON ?auto_11979 ?auto_11982 ) ( CLEAR ?auto_11979 ) ( not ( = ?auto_11965 ?auto_11982 ) ) ( not ( = ?auto_11966 ?auto_11982 ) ) ( not ( = ?auto_11985 ?auto_11982 ) ) ( not ( = ?auto_11988 ?auto_11982 ) ) ( not ( = ?auto_11987 ?auto_11982 ) ) ( not ( = ?auto_11976 ?auto_11982 ) ) ( not ( = ?auto_11973 ?auto_11982 ) ) ( not ( = ?auto_11984 ?auto_11982 ) ) ( not ( = ?auto_11967 ?auto_11982 ) ) ( not ( = ?auto_11979 ?auto_11982 ) ) ( not ( = ?auto_11978 ?auto_11982 ) ) ( not ( = ?auto_11972 ?auto_11982 ) ) ( TRUCK-AT ?auto_11975 ?auto_11970 ) )
    :subtasks
    ( ( !DRIVE ?auto_11975 ?auto_11970 ?auto_11981 )
      ( MAKE-ON ?auto_11965 ?auto_11966 )
      ( MAKE-ON-VERIFY ?auto_11965 ?auto_11966 ) )
  )

)

