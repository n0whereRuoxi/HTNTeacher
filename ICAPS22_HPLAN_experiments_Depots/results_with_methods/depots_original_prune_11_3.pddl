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
      ?auto_31386 - SURFACE
      ?auto_31387 - SURFACE
    )
    :vars
    (
      ?auto_31388 - HOIST
      ?auto_31389 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_31388 ?auto_31389 ) ( SURFACE-AT ?auto_31387 ?auto_31389 ) ( CLEAR ?auto_31387 ) ( LIFTING ?auto_31388 ?auto_31386 ) ( IS-CRATE ?auto_31386 ) ( not ( = ?auto_31386 ?auto_31387 ) ) )
    :subtasks
    ( ( !DROP ?auto_31388 ?auto_31386 ?auto_31387 ?auto_31389 )
      ( MAKE-ON-VERIFY ?auto_31386 ?auto_31387 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_31390 - SURFACE
      ?auto_31391 - SURFACE
    )
    :vars
    (
      ?auto_31393 - HOIST
      ?auto_31392 - PLACE
      ?auto_31394 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_31393 ?auto_31392 ) ( SURFACE-AT ?auto_31391 ?auto_31392 ) ( CLEAR ?auto_31391 ) ( IS-CRATE ?auto_31390 ) ( not ( = ?auto_31390 ?auto_31391 ) ) ( TRUCK-AT ?auto_31394 ?auto_31392 ) ( AVAILABLE ?auto_31393 ) ( IN ?auto_31390 ?auto_31394 ) )
    :subtasks
    ( ( !UNLOAD ?auto_31393 ?auto_31390 ?auto_31394 ?auto_31392 )
      ( MAKE-ON ?auto_31390 ?auto_31391 )
      ( MAKE-ON-VERIFY ?auto_31390 ?auto_31391 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_31395 - SURFACE
      ?auto_31396 - SURFACE
    )
    :vars
    (
      ?auto_31397 - HOIST
      ?auto_31399 - PLACE
      ?auto_31398 - TRUCK
      ?auto_31400 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_31397 ?auto_31399 ) ( SURFACE-AT ?auto_31396 ?auto_31399 ) ( CLEAR ?auto_31396 ) ( IS-CRATE ?auto_31395 ) ( not ( = ?auto_31395 ?auto_31396 ) ) ( AVAILABLE ?auto_31397 ) ( IN ?auto_31395 ?auto_31398 ) ( TRUCK-AT ?auto_31398 ?auto_31400 ) ( not ( = ?auto_31400 ?auto_31399 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_31398 ?auto_31400 ?auto_31399 )
      ( MAKE-ON ?auto_31395 ?auto_31396 )
      ( MAKE-ON-VERIFY ?auto_31395 ?auto_31396 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_31401 - SURFACE
      ?auto_31402 - SURFACE
    )
    :vars
    (
      ?auto_31406 - HOIST
      ?auto_31403 - PLACE
      ?auto_31404 - TRUCK
      ?auto_31405 - PLACE
      ?auto_31407 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_31406 ?auto_31403 ) ( SURFACE-AT ?auto_31402 ?auto_31403 ) ( CLEAR ?auto_31402 ) ( IS-CRATE ?auto_31401 ) ( not ( = ?auto_31401 ?auto_31402 ) ) ( AVAILABLE ?auto_31406 ) ( TRUCK-AT ?auto_31404 ?auto_31405 ) ( not ( = ?auto_31405 ?auto_31403 ) ) ( HOIST-AT ?auto_31407 ?auto_31405 ) ( LIFTING ?auto_31407 ?auto_31401 ) ( not ( = ?auto_31406 ?auto_31407 ) ) )
    :subtasks
    ( ( !LOAD ?auto_31407 ?auto_31401 ?auto_31404 ?auto_31405 )
      ( MAKE-ON ?auto_31401 ?auto_31402 )
      ( MAKE-ON-VERIFY ?auto_31401 ?auto_31402 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_31408 - SURFACE
      ?auto_31409 - SURFACE
    )
    :vars
    (
      ?auto_31411 - HOIST
      ?auto_31410 - PLACE
      ?auto_31412 - TRUCK
      ?auto_31414 - PLACE
      ?auto_31413 - HOIST
      ?auto_31415 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_31411 ?auto_31410 ) ( SURFACE-AT ?auto_31409 ?auto_31410 ) ( CLEAR ?auto_31409 ) ( IS-CRATE ?auto_31408 ) ( not ( = ?auto_31408 ?auto_31409 ) ) ( AVAILABLE ?auto_31411 ) ( TRUCK-AT ?auto_31412 ?auto_31414 ) ( not ( = ?auto_31414 ?auto_31410 ) ) ( HOIST-AT ?auto_31413 ?auto_31414 ) ( not ( = ?auto_31411 ?auto_31413 ) ) ( AVAILABLE ?auto_31413 ) ( SURFACE-AT ?auto_31408 ?auto_31414 ) ( ON ?auto_31408 ?auto_31415 ) ( CLEAR ?auto_31408 ) ( not ( = ?auto_31408 ?auto_31415 ) ) ( not ( = ?auto_31409 ?auto_31415 ) ) )
    :subtasks
    ( ( !LIFT ?auto_31413 ?auto_31408 ?auto_31415 ?auto_31414 )
      ( MAKE-ON ?auto_31408 ?auto_31409 )
      ( MAKE-ON-VERIFY ?auto_31408 ?auto_31409 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_31416 - SURFACE
      ?auto_31417 - SURFACE
    )
    :vars
    (
      ?auto_31418 - HOIST
      ?auto_31420 - PLACE
      ?auto_31422 - PLACE
      ?auto_31423 - HOIST
      ?auto_31421 - SURFACE
      ?auto_31419 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_31418 ?auto_31420 ) ( SURFACE-AT ?auto_31417 ?auto_31420 ) ( CLEAR ?auto_31417 ) ( IS-CRATE ?auto_31416 ) ( not ( = ?auto_31416 ?auto_31417 ) ) ( AVAILABLE ?auto_31418 ) ( not ( = ?auto_31422 ?auto_31420 ) ) ( HOIST-AT ?auto_31423 ?auto_31422 ) ( not ( = ?auto_31418 ?auto_31423 ) ) ( AVAILABLE ?auto_31423 ) ( SURFACE-AT ?auto_31416 ?auto_31422 ) ( ON ?auto_31416 ?auto_31421 ) ( CLEAR ?auto_31416 ) ( not ( = ?auto_31416 ?auto_31421 ) ) ( not ( = ?auto_31417 ?auto_31421 ) ) ( TRUCK-AT ?auto_31419 ?auto_31420 ) )
    :subtasks
    ( ( !DRIVE ?auto_31419 ?auto_31420 ?auto_31422 )
      ( MAKE-ON ?auto_31416 ?auto_31417 )
      ( MAKE-ON-VERIFY ?auto_31416 ?auto_31417 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_31464 - SURFACE
      ?auto_31465 - SURFACE
    )
    :vars
    (
      ?auto_31469 - HOIST
      ?auto_31470 - PLACE
      ?auto_31466 - PLACE
      ?auto_31467 - HOIST
      ?auto_31471 - SURFACE
      ?auto_31468 - TRUCK
      ?auto_31472 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_31469 ?auto_31470 ) ( IS-CRATE ?auto_31464 ) ( not ( = ?auto_31464 ?auto_31465 ) ) ( not ( = ?auto_31466 ?auto_31470 ) ) ( HOIST-AT ?auto_31467 ?auto_31466 ) ( not ( = ?auto_31469 ?auto_31467 ) ) ( AVAILABLE ?auto_31467 ) ( SURFACE-AT ?auto_31464 ?auto_31466 ) ( ON ?auto_31464 ?auto_31471 ) ( CLEAR ?auto_31464 ) ( not ( = ?auto_31464 ?auto_31471 ) ) ( not ( = ?auto_31465 ?auto_31471 ) ) ( TRUCK-AT ?auto_31468 ?auto_31470 ) ( SURFACE-AT ?auto_31472 ?auto_31470 ) ( CLEAR ?auto_31472 ) ( LIFTING ?auto_31469 ?auto_31465 ) ( IS-CRATE ?auto_31465 ) ( not ( = ?auto_31464 ?auto_31472 ) ) ( not ( = ?auto_31465 ?auto_31472 ) ) ( not ( = ?auto_31471 ?auto_31472 ) ) )
    :subtasks
    ( ( !DROP ?auto_31469 ?auto_31465 ?auto_31472 ?auto_31470 )
      ( MAKE-ON ?auto_31464 ?auto_31465 )
      ( MAKE-ON-VERIFY ?auto_31464 ?auto_31465 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_31473 - SURFACE
      ?auto_31474 - SURFACE
    )
    :vars
    (
      ?auto_31476 - HOIST
      ?auto_31475 - PLACE
      ?auto_31480 - PLACE
      ?auto_31477 - HOIST
      ?auto_31481 - SURFACE
      ?auto_31479 - TRUCK
      ?auto_31478 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_31476 ?auto_31475 ) ( IS-CRATE ?auto_31473 ) ( not ( = ?auto_31473 ?auto_31474 ) ) ( not ( = ?auto_31480 ?auto_31475 ) ) ( HOIST-AT ?auto_31477 ?auto_31480 ) ( not ( = ?auto_31476 ?auto_31477 ) ) ( AVAILABLE ?auto_31477 ) ( SURFACE-AT ?auto_31473 ?auto_31480 ) ( ON ?auto_31473 ?auto_31481 ) ( CLEAR ?auto_31473 ) ( not ( = ?auto_31473 ?auto_31481 ) ) ( not ( = ?auto_31474 ?auto_31481 ) ) ( TRUCK-AT ?auto_31479 ?auto_31475 ) ( SURFACE-AT ?auto_31478 ?auto_31475 ) ( CLEAR ?auto_31478 ) ( IS-CRATE ?auto_31474 ) ( not ( = ?auto_31473 ?auto_31478 ) ) ( not ( = ?auto_31474 ?auto_31478 ) ) ( not ( = ?auto_31481 ?auto_31478 ) ) ( AVAILABLE ?auto_31476 ) ( IN ?auto_31474 ?auto_31479 ) )
    :subtasks
    ( ( !UNLOAD ?auto_31476 ?auto_31474 ?auto_31479 ?auto_31475 )
      ( MAKE-ON ?auto_31473 ?auto_31474 )
      ( MAKE-ON-VERIFY ?auto_31473 ?auto_31474 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_31488 - SURFACE
      ?auto_31489 - SURFACE
    )
    :vars
    (
      ?auto_31491 - HOIST
      ?auto_31490 - PLACE
      ?auto_31492 - PLACE
      ?auto_31493 - HOIST
      ?auto_31494 - SURFACE
      ?auto_31495 - TRUCK
      ?auto_31496 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_31491 ?auto_31490 ) ( SURFACE-AT ?auto_31489 ?auto_31490 ) ( CLEAR ?auto_31489 ) ( IS-CRATE ?auto_31488 ) ( not ( = ?auto_31488 ?auto_31489 ) ) ( AVAILABLE ?auto_31491 ) ( not ( = ?auto_31492 ?auto_31490 ) ) ( HOIST-AT ?auto_31493 ?auto_31492 ) ( not ( = ?auto_31491 ?auto_31493 ) ) ( AVAILABLE ?auto_31493 ) ( SURFACE-AT ?auto_31488 ?auto_31492 ) ( ON ?auto_31488 ?auto_31494 ) ( CLEAR ?auto_31488 ) ( not ( = ?auto_31488 ?auto_31494 ) ) ( not ( = ?auto_31489 ?auto_31494 ) ) ( TRUCK-AT ?auto_31495 ?auto_31496 ) ( not ( = ?auto_31496 ?auto_31490 ) ) ( not ( = ?auto_31492 ?auto_31496 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_31495 ?auto_31496 ?auto_31490 )
      ( MAKE-ON ?auto_31488 ?auto_31489 )
      ( MAKE-ON-VERIFY ?auto_31488 ?auto_31489 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_31661 - SURFACE
      ?auto_31662 - SURFACE
    )
    :vars
    (
      ?auto_31667 - HOIST
      ?auto_31666 - PLACE
      ?auto_31663 - TRUCK
      ?auto_31665 - PLACE
      ?auto_31668 - HOIST
      ?auto_31664 - SURFACE
      ?auto_31669 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_31667 ?auto_31666 ) ( SURFACE-AT ?auto_31662 ?auto_31666 ) ( CLEAR ?auto_31662 ) ( IS-CRATE ?auto_31661 ) ( not ( = ?auto_31661 ?auto_31662 ) ) ( AVAILABLE ?auto_31667 ) ( TRUCK-AT ?auto_31663 ?auto_31665 ) ( not ( = ?auto_31665 ?auto_31666 ) ) ( HOIST-AT ?auto_31668 ?auto_31665 ) ( not ( = ?auto_31667 ?auto_31668 ) ) ( SURFACE-AT ?auto_31661 ?auto_31665 ) ( ON ?auto_31661 ?auto_31664 ) ( CLEAR ?auto_31661 ) ( not ( = ?auto_31661 ?auto_31664 ) ) ( not ( = ?auto_31662 ?auto_31664 ) ) ( LIFTING ?auto_31668 ?auto_31669 ) ( IS-CRATE ?auto_31669 ) ( not ( = ?auto_31661 ?auto_31669 ) ) ( not ( = ?auto_31662 ?auto_31669 ) ) ( not ( = ?auto_31664 ?auto_31669 ) ) )
    :subtasks
    ( ( !LOAD ?auto_31668 ?auto_31669 ?auto_31663 ?auto_31665 )
      ( MAKE-ON ?auto_31661 ?auto_31662 )
      ( MAKE-ON-VERIFY ?auto_31661 ?auto_31662 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_31777 - SURFACE
      ?auto_31778 - SURFACE
    )
    :vars
    (
      ?auto_31783 - HOIST
      ?auto_31779 - PLACE
      ?auto_31781 - PLACE
      ?auto_31784 - HOIST
      ?auto_31782 - SURFACE
      ?auto_31780 - TRUCK
      ?auto_31785 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_31783 ?auto_31779 ) ( SURFACE-AT ?auto_31778 ?auto_31779 ) ( CLEAR ?auto_31778 ) ( IS-CRATE ?auto_31777 ) ( not ( = ?auto_31777 ?auto_31778 ) ) ( not ( = ?auto_31781 ?auto_31779 ) ) ( HOIST-AT ?auto_31784 ?auto_31781 ) ( not ( = ?auto_31783 ?auto_31784 ) ) ( AVAILABLE ?auto_31784 ) ( SURFACE-AT ?auto_31777 ?auto_31781 ) ( ON ?auto_31777 ?auto_31782 ) ( CLEAR ?auto_31777 ) ( not ( = ?auto_31777 ?auto_31782 ) ) ( not ( = ?auto_31778 ?auto_31782 ) ) ( TRUCK-AT ?auto_31780 ?auto_31779 ) ( LIFTING ?auto_31783 ?auto_31785 ) ( IS-CRATE ?auto_31785 ) ( not ( = ?auto_31777 ?auto_31785 ) ) ( not ( = ?auto_31778 ?auto_31785 ) ) ( not ( = ?auto_31782 ?auto_31785 ) ) )
    :subtasks
    ( ( !LOAD ?auto_31783 ?auto_31785 ?auto_31780 ?auto_31779 )
      ( MAKE-ON ?auto_31777 ?auto_31778 )
      ( MAKE-ON-VERIFY ?auto_31777 ?auto_31778 ) )
  )

)

