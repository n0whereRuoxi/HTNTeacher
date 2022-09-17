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
      ?auto_412 - SURFACE
      ?auto_413 - SURFACE
    )
    :vars
    (
      ?auto_414 - HOIST
      ?auto_415 - PLACE
      ?auto_417 - PLACE
      ?auto_418 - HOIST
      ?auto_419 - SURFACE
      ?auto_416 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_414 ?auto_415 ) ( SURFACE-AT ?auto_413 ?auto_415 ) ( CLEAR ?auto_413 ) ( IS-CRATE ?auto_412 ) ( AVAILABLE ?auto_414 ) ( not ( = ?auto_417 ?auto_415 ) ) ( HOIST-AT ?auto_418 ?auto_417 ) ( AVAILABLE ?auto_418 ) ( SURFACE-AT ?auto_412 ?auto_417 ) ( ON ?auto_412 ?auto_419 ) ( CLEAR ?auto_412 ) ( TRUCK-AT ?auto_416 ?auto_415 ) ( not ( = ?auto_412 ?auto_413 ) ) ( not ( = ?auto_412 ?auto_419 ) ) ( not ( = ?auto_413 ?auto_419 ) ) ( not ( = ?auto_414 ?auto_418 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_416 ?auto_415 ?auto_417 )
      ( !LIFT ?auto_418 ?auto_412 ?auto_419 ?auto_417 )
      ( !LOAD ?auto_418 ?auto_412 ?auto_416 ?auto_417 )
      ( !DRIVE ?auto_416 ?auto_417 ?auto_415 )
      ( !UNLOAD ?auto_414 ?auto_412 ?auto_416 ?auto_415 )
      ( !DROP ?auto_414 ?auto_412 ?auto_413 ?auto_415 )
      ( MAKE-ON-VERIFY ?auto_412 ?auto_413 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_422 - SURFACE
      ?auto_423 - SURFACE
    )
    :vars
    (
      ?auto_424 - HOIST
      ?auto_425 - PLACE
      ?auto_427 - PLACE
      ?auto_428 - HOIST
      ?auto_429 - SURFACE
      ?auto_426 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_424 ?auto_425 ) ( SURFACE-AT ?auto_423 ?auto_425 ) ( CLEAR ?auto_423 ) ( IS-CRATE ?auto_422 ) ( AVAILABLE ?auto_424 ) ( not ( = ?auto_427 ?auto_425 ) ) ( HOIST-AT ?auto_428 ?auto_427 ) ( AVAILABLE ?auto_428 ) ( SURFACE-AT ?auto_422 ?auto_427 ) ( ON ?auto_422 ?auto_429 ) ( CLEAR ?auto_422 ) ( TRUCK-AT ?auto_426 ?auto_425 ) ( not ( = ?auto_422 ?auto_423 ) ) ( not ( = ?auto_422 ?auto_429 ) ) ( not ( = ?auto_423 ?auto_429 ) ) ( not ( = ?auto_424 ?auto_428 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_426 ?auto_425 ?auto_427 )
      ( !LIFT ?auto_428 ?auto_422 ?auto_429 ?auto_427 )
      ( !LOAD ?auto_428 ?auto_422 ?auto_426 ?auto_427 )
      ( !DRIVE ?auto_426 ?auto_427 ?auto_425 )
      ( !UNLOAD ?auto_424 ?auto_422 ?auto_426 ?auto_425 )
      ( !DROP ?auto_424 ?auto_422 ?auto_423 ?auto_425 )
      ( MAKE-ON-VERIFY ?auto_422 ?auto_423 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_432 - SURFACE
      ?auto_433 - SURFACE
    )
    :vars
    (
      ?auto_434 - HOIST
      ?auto_435 - PLACE
      ?auto_437 - PLACE
      ?auto_438 - HOIST
      ?auto_439 - SURFACE
      ?auto_436 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_434 ?auto_435 ) ( SURFACE-AT ?auto_433 ?auto_435 ) ( CLEAR ?auto_433 ) ( IS-CRATE ?auto_432 ) ( AVAILABLE ?auto_434 ) ( not ( = ?auto_437 ?auto_435 ) ) ( HOIST-AT ?auto_438 ?auto_437 ) ( AVAILABLE ?auto_438 ) ( SURFACE-AT ?auto_432 ?auto_437 ) ( ON ?auto_432 ?auto_439 ) ( CLEAR ?auto_432 ) ( TRUCK-AT ?auto_436 ?auto_435 ) ( not ( = ?auto_432 ?auto_433 ) ) ( not ( = ?auto_432 ?auto_439 ) ) ( not ( = ?auto_433 ?auto_439 ) ) ( not ( = ?auto_434 ?auto_438 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_436 ?auto_435 ?auto_437 )
      ( !LIFT ?auto_438 ?auto_432 ?auto_439 ?auto_437 )
      ( !LOAD ?auto_438 ?auto_432 ?auto_436 ?auto_437 )
      ( !DRIVE ?auto_436 ?auto_437 ?auto_435 )
      ( !UNLOAD ?auto_434 ?auto_432 ?auto_436 ?auto_435 )
      ( !DROP ?auto_434 ?auto_432 ?auto_433 ?auto_435 )
      ( MAKE-ON-VERIFY ?auto_432 ?auto_433 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_442 - SURFACE
      ?auto_443 - SURFACE
    )
    :vars
    (
      ?auto_444 - HOIST
      ?auto_445 - PLACE
      ?auto_447 - PLACE
      ?auto_448 - HOIST
      ?auto_449 - SURFACE
      ?auto_446 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_444 ?auto_445 ) ( SURFACE-AT ?auto_443 ?auto_445 ) ( CLEAR ?auto_443 ) ( IS-CRATE ?auto_442 ) ( AVAILABLE ?auto_444 ) ( not ( = ?auto_447 ?auto_445 ) ) ( HOIST-AT ?auto_448 ?auto_447 ) ( AVAILABLE ?auto_448 ) ( SURFACE-AT ?auto_442 ?auto_447 ) ( ON ?auto_442 ?auto_449 ) ( CLEAR ?auto_442 ) ( TRUCK-AT ?auto_446 ?auto_445 ) ( not ( = ?auto_442 ?auto_443 ) ) ( not ( = ?auto_442 ?auto_449 ) ) ( not ( = ?auto_443 ?auto_449 ) ) ( not ( = ?auto_444 ?auto_448 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_446 ?auto_445 ?auto_447 )
      ( !LIFT ?auto_448 ?auto_442 ?auto_449 ?auto_447 )
      ( !LOAD ?auto_448 ?auto_442 ?auto_446 ?auto_447 )
      ( !DRIVE ?auto_446 ?auto_447 ?auto_445 )
      ( !UNLOAD ?auto_444 ?auto_442 ?auto_446 ?auto_445 )
      ( !DROP ?auto_444 ?auto_442 ?auto_443 ?auto_445 )
      ( MAKE-ON-VERIFY ?auto_442 ?auto_443 ) )
  )

)

