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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12406 - SURFACE
      ?auto_12407 - SURFACE
    )
    :vars
    (
      ?auto_12408 - HOIST
      ?auto_12409 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12408 ?auto_12409 ) ( SURFACE-AT ?auto_12406 ?auto_12409 ) ( CLEAR ?auto_12406 ) ( LIFTING ?auto_12408 ?auto_12407 ) ( IS-CRATE ?auto_12407 ) ( not ( = ?auto_12406 ?auto_12407 ) ) )
    :subtasks
    ( ( !DROP ?auto_12408 ?auto_12407 ?auto_12406 ?auto_12409 )
      ( MAKE-1CRATE-VERIFY ?auto_12406 ?auto_12407 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12410 - SURFACE
      ?auto_12411 - SURFACE
    )
    :vars
    (
      ?auto_12412 - HOIST
      ?auto_12413 - PLACE
      ?auto_12414 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12412 ?auto_12413 ) ( SURFACE-AT ?auto_12410 ?auto_12413 ) ( CLEAR ?auto_12410 ) ( IS-CRATE ?auto_12411 ) ( not ( = ?auto_12410 ?auto_12411 ) ) ( TRUCK-AT ?auto_12414 ?auto_12413 ) ( AVAILABLE ?auto_12412 ) ( IN ?auto_12411 ?auto_12414 ) )
    :subtasks
    ( ( !UNLOAD ?auto_12412 ?auto_12411 ?auto_12414 ?auto_12413 )
      ( MAKE-1CRATE ?auto_12410 ?auto_12411 )
      ( MAKE-1CRATE-VERIFY ?auto_12410 ?auto_12411 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12415 - SURFACE
      ?auto_12416 - SURFACE
    )
    :vars
    (
      ?auto_12417 - HOIST
      ?auto_12418 - PLACE
      ?auto_12419 - TRUCK
      ?auto_12420 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12417 ?auto_12418 ) ( SURFACE-AT ?auto_12415 ?auto_12418 ) ( CLEAR ?auto_12415 ) ( IS-CRATE ?auto_12416 ) ( not ( = ?auto_12415 ?auto_12416 ) ) ( AVAILABLE ?auto_12417 ) ( IN ?auto_12416 ?auto_12419 ) ( TRUCK-AT ?auto_12419 ?auto_12420 ) ( not ( = ?auto_12420 ?auto_12418 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_12419 ?auto_12420 ?auto_12418 )
      ( MAKE-1CRATE ?auto_12415 ?auto_12416 )
      ( MAKE-1CRATE-VERIFY ?auto_12415 ?auto_12416 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12421 - SURFACE
      ?auto_12422 - SURFACE
    )
    :vars
    (
      ?auto_12424 - HOIST
      ?auto_12426 - PLACE
      ?auto_12425 - TRUCK
      ?auto_12423 - PLACE
      ?auto_12427 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_12424 ?auto_12426 ) ( SURFACE-AT ?auto_12421 ?auto_12426 ) ( CLEAR ?auto_12421 ) ( IS-CRATE ?auto_12422 ) ( not ( = ?auto_12421 ?auto_12422 ) ) ( AVAILABLE ?auto_12424 ) ( TRUCK-AT ?auto_12425 ?auto_12423 ) ( not ( = ?auto_12423 ?auto_12426 ) ) ( HOIST-AT ?auto_12427 ?auto_12423 ) ( LIFTING ?auto_12427 ?auto_12422 ) ( not ( = ?auto_12424 ?auto_12427 ) ) )
    :subtasks
    ( ( !LOAD ?auto_12427 ?auto_12422 ?auto_12425 ?auto_12423 )
      ( MAKE-1CRATE ?auto_12421 ?auto_12422 )
      ( MAKE-1CRATE-VERIFY ?auto_12421 ?auto_12422 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12428 - SURFACE
      ?auto_12429 - SURFACE
    )
    :vars
    (
      ?auto_12432 - HOIST
      ?auto_12430 - PLACE
      ?auto_12433 - TRUCK
      ?auto_12431 - PLACE
      ?auto_12434 - HOIST
      ?auto_12435 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12432 ?auto_12430 ) ( SURFACE-AT ?auto_12428 ?auto_12430 ) ( CLEAR ?auto_12428 ) ( IS-CRATE ?auto_12429 ) ( not ( = ?auto_12428 ?auto_12429 ) ) ( AVAILABLE ?auto_12432 ) ( TRUCK-AT ?auto_12433 ?auto_12431 ) ( not ( = ?auto_12431 ?auto_12430 ) ) ( HOIST-AT ?auto_12434 ?auto_12431 ) ( not ( = ?auto_12432 ?auto_12434 ) ) ( AVAILABLE ?auto_12434 ) ( SURFACE-AT ?auto_12429 ?auto_12431 ) ( ON ?auto_12429 ?auto_12435 ) ( CLEAR ?auto_12429 ) ( not ( = ?auto_12428 ?auto_12435 ) ) ( not ( = ?auto_12429 ?auto_12435 ) ) )
    :subtasks
    ( ( !LIFT ?auto_12434 ?auto_12429 ?auto_12435 ?auto_12431 )
      ( MAKE-1CRATE ?auto_12428 ?auto_12429 )
      ( MAKE-1CRATE-VERIFY ?auto_12428 ?auto_12429 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12436 - SURFACE
      ?auto_12437 - SURFACE
    )
    :vars
    (
      ?auto_12440 - HOIST
      ?auto_12438 - PLACE
      ?auto_12443 - PLACE
      ?auto_12439 - HOIST
      ?auto_12442 - SURFACE
      ?auto_12441 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12440 ?auto_12438 ) ( SURFACE-AT ?auto_12436 ?auto_12438 ) ( CLEAR ?auto_12436 ) ( IS-CRATE ?auto_12437 ) ( not ( = ?auto_12436 ?auto_12437 ) ) ( AVAILABLE ?auto_12440 ) ( not ( = ?auto_12443 ?auto_12438 ) ) ( HOIST-AT ?auto_12439 ?auto_12443 ) ( not ( = ?auto_12440 ?auto_12439 ) ) ( AVAILABLE ?auto_12439 ) ( SURFACE-AT ?auto_12437 ?auto_12443 ) ( ON ?auto_12437 ?auto_12442 ) ( CLEAR ?auto_12437 ) ( not ( = ?auto_12436 ?auto_12442 ) ) ( not ( = ?auto_12437 ?auto_12442 ) ) ( TRUCK-AT ?auto_12441 ?auto_12438 ) )
    :subtasks
    ( ( !DRIVE ?auto_12441 ?auto_12438 ?auto_12443 )
      ( MAKE-1CRATE ?auto_12436 ?auto_12437 )
      ( MAKE-1CRATE-VERIFY ?auto_12436 ?auto_12437 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_12453 - SURFACE
      ?auto_12454 - SURFACE
      ?auto_12455 - SURFACE
    )
    :vars
    (
      ?auto_12456 - HOIST
      ?auto_12457 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12456 ?auto_12457 ) ( SURFACE-AT ?auto_12454 ?auto_12457 ) ( CLEAR ?auto_12454 ) ( LIFTING ?auto_12456 ?auto_12455 ) ( IS-CRATE ?auto_12455 ) ( not ( = ?auto_12454 ?auto_12455 ) ) ( ON ?auto_12454 ?auto_12453 ) ( not ( = ?auto_12453 ?auto_12454 ) ) ( not ( = ?auto_12453 ?auto_12455 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_12454 ?auto_12455 )
      ( MAKE-2CRATE-VERIFY ?auto_12453 ?auto_12454 ?auto_12455 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_12463 - SURFACE
      ?auto_12464 - SURFACE
      ?auto_12465 - SURFACE
    )
    :vars
    (
      ?auto_12467 - HOIST
      ?auto_12466 - PLACE
      ?auto_12468 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12467 ?auto_12466 ) ( SURFACE-AT ?auto_12464 ?auto_12466 ) ( CLEAR ?auto_12464 ) ( IS-CRATE ?auto_12465 ) ( not ( = ?auto_12464 ?auto_12465 ) ) ( TRUCK-AT ?auto_12468 ?auto_12466 ) ( AVAILABLE ?auto_12467 ) ( IN ?auto_12465 ?auto_12468 ) ( ON ?auto_12464 ?auto_12463 ) ( not ( = ?auto_12463 ?auto_12464 ) ) ( not ( = ?auto_12463 ?auto_12465 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_12464 ?auto_12465 )
      ( MAKE-2CRATE-VERIFY ?auto_12463 ?auto_12464 ?auto_12465 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12469 - SURFACE
      ?auto_12470 - SURFACE
    )
    :vars
    (
      ?auto_12473 - HOIST
      ?auto_12471 - PLACE
      ?auto_12474 - TRUCK
      ?auto_12472 - SURFACE
      ?auto_12475 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12473 ?auto_12471 ) ( SURFACE-AT ?auto_12469 ?auto_12471 ) ( CLEAR ?auto_12469 ) ( IS-CRATE ?auto_12470 ) ( not ( = ?auto_12469 ?auto_12470 ) ) ( AVAILABLE ?auto_12473 ) ( IN ?auto_12470 ?auto_12474 ) ( ON ?auto_12469 ?auto_12472 ) ( not ( = ?auto_12472 ?auto_12469 ) ) ( not ( = ?auto_12472 ?auto_12470 ) ) ( TRUCK-AT ?auto_12474 ?auto_12475 ) ( not ( = ?auto_12475 ?auto_12471 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_12474 ?auto_12475 ?auto_12471 )
      ( MAKE-2CRATE ?auto_12472 ?auto_12469 ?auto_12470 )
      ( MAKE-1CRATE-VERIFY ?auto_12469 ?auto_12470 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_12476 - SURFACE
      ?auto_12477 - SURFACE
      ?auto_12478 - SURFACE
    )
    :vars
    (
      ?auto_12481 - HOIST
      ?auto_12480 - PLACE
      ?auto_12482 - TRUCK
      ?auto_12479 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12481 ?auto_12480 ) ( SURFACE-AT ?auto_12477 ?auto_12480 ) ( CLEAR ?auto_12477 ) ( IS-CRATE ?auto_12478 ) ( not ( = ?auto_12477 ?auto_12478 ) ) ( AVAILABLE ?auto_12481 ) ( IN ?auto_12478 ?auto_12482 ) ( ON ?auto_12477 ?auto_12476 ) ( not ( = ?auto_12476 ?auto_12477 ) ) ( not ( = ?auto_12476 ?auto_12478 ) ) ( TRUCK-AT ?auto_12482 ?auto_12479 ) ( not ( = ?auto_12479 ?auto_12480 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_12477 ?auto_12478 )
      ( MAKE-2CRATE-VERIFY ?auto_12476 ?auto_12477 ?auto_12478 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12483 - SURFACE
      ?auto_12484 - SURFACE
    )
    :vars
    (
      ?auto_12488 - HOIST
      ?auto_12486 - PLACE
      ?auto_12489 - SURFACE
      ?auto_12485 - TRUCK
      ?auto_12487 - PLACE
      ?auto_12490 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_12488 ?auto_12486 ) ( SURFACE-AT ?auto_12483 ?auto_12486 ) ( CLEAR ?auto_12483 ) ( IS-CRATE ?auto_12484 ) ( not ( = ?auto_12483 ?auto_12484 ) ) ( AVAILABLE ?auto_12488 ) ( ON ?auto_12483 ?auto_12489 ) ( not ( = ?auto_12489 ?auto_12483 ) ) ( not ( = ?auto_12489 ?auto_12484 ) ) ( TRUCK-AT ?auto_12485 ?auto_12487 ) ( not ( = ?auto_12487 ?auto_12486 ) ) ( HOIST-AT ?auto_12490 ?auto_12487 ) ( LIFTING ?auto_12490 ?auto_12484 ) ( not ( = ?auto_12488 ?auto_12490 ) ) )
    :subtasks
    ( ( !LOAD ?auto_12490 ?auto_12484 ?auto_12485 ?auto_12487 )
      ( MAKE-2CRATE ?auto_12489 ?auto_12483 ?auto_12484 )
      ( MAKE-1CRATE-VERIFY ?auto_12483 ?auto_12484 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_12491 - SURFACE
      ?auto_12492 - SURFACE
      ?auto_12493 - SURFACE
    )
    :vars
    (
      ?auto_12497 - HOIST
      ?auto_12495 - PLACE
      ?auto_12498 - TRUCK
      ?auto_12494 - PLACE
      ?auto_12496 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_12497 ?auto_12495 ) ( SURFACE-AT ?auto_12492 ?auto_12495 ) ( CLEAR ?auto_12492 ) ( IS-CRATE ?auto_12493 ) ( not ( = ?auto_12492 ?auto_12493 ) ) ( AVAILABLE ?auto_12497 ) ( ON ?auto_12492 ?auto_12491 ) ( not ( = ?auto_12491 ?auto_12492 ) ) ( not ( = ?auto_12491 ?auto_12493 ) ) ( TRUCK-AT ?auto_12498 ?auto_12494 ) ( not ( = ?auto_12494 ?auto_12495 ) ) ( HOIST-AT ?auto_12496 ?auto_12494 ) ( LIFTING ?auto_12496 ?auto_12493 ) ( not ( = ?auto_12497 ?auto_12496 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_12492 ?auto_12493 )
      ( MAKE-2CRATE-VERIFY ?auto_12491 ?auto_12492 ?auto_12493 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12499 - SURFACE
      ?auto_12500 - SURFACE
    )
    :vars
    (
      ?auto_12506 - HOIST
      ?auto_12504 - PLACE
      ?auto_12501 - SURFACE
      ?auto_12502 - TRUCK
      ?auto_12503 - PLACE
      ?auto_12505 - HOIST
      ?auto_12507 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12506 ?auto_12504 ) ( SURFACE-AT ?auto_12499 ?auto_12504 ) ( CLEAR ?auto_12499 ) ( IS-CRATE ?auto_12500 ) ( not ( = ?auto_12499 ?auto_12500 ) ) ( AVAILABLE ?auto_12506 ) ( ON ?auto_12499 ?auto_12501 ) ( not ( = ?auto_12501 ?auto_12499 ) ) ( not ( = ?auto_12501 ?auto_12500 ) ) ( TRUCK-AT ?auto_12502 ?auto_12503 ) ( not ( = ?auto_12503 ?auto_12504 ) ) ( HOIST-AT ?auto_12505 ?auto_12503 ) ( not ( = ?auto_12506 ?auto_12505 ) ) ( AVAILABLE ?auto_12505 ) ( SURFACE-AT ?auto_12500 ?auto_12503 ) ( ON ?auto_12500 ?auto_12507 ) ( CLEAR ?auto_12500 ) ( not ( = ?auto_12499 ?auto_12507 ) ) ( not ( = ?auto_12500 ?auto_12507 ) ) ( not ( = ?auto_12501 ?auto_12507 ) ) )
    :subtasks
    ( ( !LIFT ?auto_12505 ?auto_12500 ?auto_12507 ?auto_12503 )
      ( MAKE-2CRATE ?auto_12501 ?auto_12499 ?auto_12500 )
      ( MAKE-1CRATE-VERIFY ?auto_12499 ?auto_12500 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_12508 - SURFACE
      ?auto_12509 - SURFACE
      ?auto_12510 - SURFACE
    )
    :vars
    (
      ?auto_12515 - HOIST
      ?auto_12511 - PLACE
      ?auto_12514 - TRUCK
      ?auto_12516 - PLACE
      ?auto_12513 - HOIST
      ?auto_12512 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12515 ?auto_12511 ) ( SURFACE-AT ?auto_12509 ?auto_12511 ) ( CLEAR ?auto_12509 ) ( IS-CRATE ?auto_12510 ) ( not ( = ?auto_12509 ?auto_12510 ) ) ( AVAILABLE ?auto_12515 ) ( ON ?auto_12509 ?auto_12508 ) ( not ( = ?auto_12508 ?auto_12509 ) ) ( not ( = ?auto_12508 ?auto_12510 ) ) ( TRUCK-AT ?auto_12514 ?auto_12516 ) ( not ( = ?auto_12516 ?auto_12511 ) ) ( HOIST-AT ?auto_12513 ?auto_12516 ) ( not ( = ?auto_12515 ?auto_12513 ) ) ( AVAILABLE ?auto_12513 ) ( SURFACE-AT ?auto_12510 ?auto_12516 ) ( ON ?auto_12510 ?auto_12512 ) ( CLEAR ?auto_12510 ) ( not ( = ?auto_12509 ?auto_12512 ) ) ( not ( = ?auto_12510 ?auto_12512 ) ) ( not ( = ?auto_12508 ?auto_12512 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_12509 ?auto_12510 )
      ( MAKE-2CRATE-VERIFY ?auto_12508 ?auto_12509 ?auto_12510 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12517 - SURFACE
      ?auto_12518 - SURFACE
    )
    :vars
    (
      ?auto_12522 - HOIST
      ?auto_12523 - PLACE
      ?auto_12519 - SURFACE
      ?auto_12520 - PLACE
      ?auto_12521 - HOIST
      ?auto_12525 - SURFACE
      ?auto_12524 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12522 ?auto_12523 ) ( SURFACE-AT ?auto_12517 ?auto_12523 ) ( CLEAR ?auto_12517 ) ( IS-CRATE ?auto_12518 ) ( not ( = ?auto_12517 ?auto_12518 ) ) ( AVAILABLE ?auto_12522 ) ( ON ?auto_12517 ?auto_12519 ) ( not ( = ?auto_12519 ?auto_12517 ) ) ( not ( = ?auto_12519 ?auto_12518 ) ) ( not ( = ?auto_12520 ?auto_12523 ) ) ( HOIST-AT ?auto_12521 ?auto_12520 ) ( not ( = ?auto_12522 ?auto_12521 ) ) ( AVAILABLE ?auto_12521 ) ( SURFACE-AT ?auto_12518 ?auto_12520 ) ( ON ?auto_12518 ?auto_12525 ) ( CLEAR ?auto_12518 ) ( not ( = ?auto_12517 ?auto_12525 ) ) ( not ( = ?auto_12518 ?auto_12525 ) ) ( not ( = ?auto_12519 ?auto_12525 ) ) ( TRUCK-AT ?auto_12524 ?auto_12523 ) )
    :subtasks
    ( ( !DRIVE ?auto_12524 ?auto_12523 ?auto_12520 )
      ( MAKE-2CRATE ?auto_12519 ?auto_12517 ?auto_12518 )
      ( MAKE-1CRATE-VERIFY ?auto_12517 ?auto_12518 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_12526 - SURFACE
      ?auto_12527 - SURFACE
      ?auto_12528 - SURFACE
    )
    :vars
    (
      ?auto_12533 - HOIST
      ?auto_12532 - PLACE
      ?auto_12531 - PLACE
      ?auto_12534 - HOIST
      ?auto_12529 - SURFACE
      ?auto_12530 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12533 ?auto_12532 ) ( SURFACE-AT ?auto_12527 ?auto_12532 ) ( CLEAR ?auto_12527 ) ( IS-CRATE ?auto_12528 ) ( not ( = ?auto_12527 ?auto_12528 ) ) ( AVAILABLE ?auto_12533 ) ( ON ?auto_12527 ?auto_12526 ) ( not ( = ?auto_12526 ?auto_12527 ) ) ( not ( = ?auto_12526 ?auto_12528 ) ) ( not ( = ?auto_12531 ?auto_12532 ) ) ( HOIST-AT ?auto_12534 ?auto_12531 ) ( not ( = ?auto_12533 ?auto_12534 ) ) ( AVAILABLE ?auto_12534 ) ( SURFACE-AT ?auto_12528 ?auto_12531 ) ( ON ?auto_12528 ?auto_12529 ) ( CLEAR ?auto_12528 ) ( not ( = ?auto_12527 ?auto_12529 ) ) ( not ( = ?auto_12528 ?auto_12529 ) ) ( not ( = ?auto_12526 ?auto_12529 ) ) ( TRUCK-AT ?auto_12530 ?auto_12532 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_12527 ?auto_12528 )
      ( MAKE-2CRATE-VERIFY ?auto_12526 ?auto_12527 ?auto_12528 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12535 - SURFACE
      ?auto_12536 - SURFACE
    )
    :vars
    (
      ?auto_12540 - HOIST
      ?auto_12537 - PLACE
      ?auto_12541 - SURFACE
      ?auto_12542 - PLACE
      ?auto_12538 - HOIST
      ?auto_12543 - SURFACE
      ?auto_12539 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12540 ?auto_12537 ) ( IS-CRATE ?auto_12536 ) ( not ( = ?auto_12535 ?auto_12536 ) ) ( not ( = ?auto_12541 ?auto_12535 ) ) ( not ( = ?auto_12541 ?auto_12536 ) ) ( not ( = ?auto_12542 ?auto_12537 ) ) ( HOIST-AT ?auto_12538 ?auto_12542 ) ( not ( = ?auto_12540 ?auto_12538 ) ) ( AVAILABLE ?auto_12538 ) ( SURFACE-AT ?auto_12536 ?auto_12542 ) ( ON ?auto_12536 ?auto_12543 ) ( CLEAR ?auto_12536 ) ( not ( = ?auto_12535 ?auto_12543 ) ) ( not ( = ?auto_12536 ?auto_12543 ) ) ( not ( = ?auto_12541 ?auto_12543 ) ) ( TRUCK-AT ?auto_12539 ?auto_12537 ) ( SURFACE-AT ?auto_12541 ?auto_12537 ) ( CLEAR ?auto_12541 ) ( LIFTING ?auto_12540 ?auto_12535 ) ( IS-CRATE ?auto_12535 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_12541 ?auto_12535 )
      ( MAKE-2CRATE ?auto_12541 ?auto_12535 ?auto_12536 )
      ( MAKE-1CRATE-VERIFY ?auto_12535 ?auto_12536 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_12544 - SURFACE
      ?auto_12545 - SURFACE
      ?auto_12546 - SURFACE
    )
    :vars
    (
      ?auto_12550 - HOIST
      ?auto_12552 - PLACE
      ?auto_12547 - PLACE
      ?auto_12548 - HOIST
      ?auto_12551 - SURFACE
      ?auto_12549 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12550 ?auto_12552 ) ( IS-CRATE ?auto_12546 ) ( not ( = ?auto_12545 ?auto_12546 ) ) ( not ( = ?auto_12544 ?auto_12545 ) ) ( not ( = ?auto_12544 ?auto_12546 ) ) ( not ( = ?auto_12547 ?auto_12552 ) ) ( HOIST-AT ?auto_12548 ?auto_12547 ) ( not ( = ?auto_12550 ?auto_12548 ) ) ( AVAILABLE ?auto_12548 ) ( SURFACE-AT ?auto_12546 ?auto_12547 ) ( ON ?auto_12546 ?auto_12551 ) ( CLEAR ?auto_12546 ) ( not ( = ?auto_12545 ?auto_12551 ) ) ( not ( = ?auto_12546 ?auto_12551 ) ) ( not ( = ?auto_12544 ?auto_12551 ) ) ( TRUCK-AT ?auto_12549 ?auto_12552 ) ( SURFACE-AT ?auto_12544 ?auto_12552 ) ( CLEAR ?auto_12544 ) ( LIFTING ?auto_12550 ?auto_12545 ) ( IS-CRATE ?auto_12545 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_12545 ?auto_12546 )
      ( MAKE-2CRATE-VERIFY ?auto_12544 ?auto_12545 ?auto_12546 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12553 - SURFACE
      ?auto_12554 - SURFACE
    )
    :vars
    (
      ?auto_12559 - HOIST
      ?auto_12558 - PLACE
      ?auto_12556 - SURFACE
      ?auto_12561 - PLACE
      ?auto_12555 - HOIST
      ?auto_12557 - SURFACE
      ?auto_12560 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12559 ?auto_12558 ) ( IS-CRATE ?auto_12554 ) ( not ( = ?auto_12553 ?auto_12554 ) ) ( not ( = ?auto_12556 ?auto_12553 ) ) ( not ( = ?auto_12556 ?auto_12554 ) ) ( not ( = ?auto_12561 ?auto_12558 ) ) ( HOIST-AT ?auto_12555 ?auto_12561 ) ( not ( = ?auto_12559 ?auto_12555 ) ) ( AVAILABLE ?auto_12555 ) ( SURFACE-AT ?auto_12554 ?auto_12561 ) ( ON ?auto_12554 ?auto_12557 ) ( CLEAR ?auto_12554 ) ( not ( = ?auto_12553 ?auto_12557 ) ) ( not ( = ?auto_12554 ?auto_12557 ) ) ( not ( = ?auto_12556 ?auto_12557 ) ) ( TRUCK-AT ?auto_12560 ?auto_12558 ) ( SURFACE-AT ?auto_12556 ?auto_12558 ) ( CLEAR ?auto_12556 ) ( IS-CRATE ?auto_12553 ) ( AVAILABLE ?auto_12559 ) ( IN ?auto_12553 ?auto_12560 ) )
    :subtasks
    ( ( !UNLOAD ?auto_12559 ?auto_12553 ?auto_12560 ?auto_12558 )
      ( MAKE-2CRATE ?auto_12556 ?auto_12553 ?auto_12554 )
      ( MAKE-1CRATE-VERIFY ?auto_12553 ?auto_12554 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_12562 - SURFACE
      ?auto_12563 - SURFACE
      ?auto_12564 - SURFACE
    )
    :vars
    (
      ?auto_12569 - HOIST
      ?auto_12566 - PLACE
      ?auto_12567 - PLACE
      ?auto_12570 - HOIST
      ?auto_12565 - SURFACE
      ?auto_12568 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12569 ?auto_12566 ) ( IS-CRATE ?auto_12564 ) ( not ( = ?auto_12563 ?auto_12564 ) ) ( not ( = ?auto_12562 ?auto_12563 ) ) ( not ( = ?auto_12562 ?auto_12564 ) ) ( not ( = ?auto_12567 ?auto_12566 ) ) ( HOIST-AT ?auto_12570 ?auto_12567 ) ( not ( = ?auto_12569 ?auto_12570 ) ) ( AVAILABLE ?auto_12570 ) ( SURFACE-AT ?auto_12564 ?auto_12567 ) ( ON ?auto_12564 ?auto_12565 ) ( CLEAR ?auto_12564 ) ( not ( = ?auto_12563 ?auto_12565 ) ) ( not ( = ?auto_12564 ?auto_12565 ) ) ( not ( = ?auto_12562 ?auto_12565 ) ) ( TRUCK-AT ?auto_12568 ?auto_12566 ) ( SURFACE-AT ?auto_12562 ?auto_12566 ) ( CLEAR ?auto_12562 ) ( IS-CRATE ?auto_12563 ) ( AVAILABLE ?auto_12569 ) ( IN ?auto_12563 ?auto_12568 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_12563 ?auto_12564 )
      ( MAKE-2CRATE-VERIFY ?auto_12562 ?auto_12563 ?auto_12564 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12607 - SURFACE
      ?auto_12608 - SURFACE
    )
    :vars
    (
      ?auto_12612 - HOIST
      ?auto_12613 - PLACE
      ?auto_12614 - SURFACE
      ?auto_12610 - PLACE
      ?auto_12615 - HOIST
      ?auto_12609 - SURFACE
      ?auto_12611 - TRUCK
      ?auto_12616 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12612 ?auto_12613 ) ( SURFACE-AT ?auto_12607 ?auto_12613 ) ( CLEAR ?auto_12607 ) ( IS-CRATE ?auto_12608 ) ( not ( = ?auto_12607 ?auto_12608 ) ) ( AVAILABLE ?auto_12612 ) ( ON ?auto_12607 ?auto_12614 ) ( not ( = ?auto_12614 ?auto_12607 ) ) ( not ( = ?auto_12614 ?auto_12608 ) ) ( not ( = ?auto_12610 ?auto_12613 ) ) ( HOIST-AT ?auto_12615 ?auto_12610 ) ( not ( = ?auto_12612 ?auto_12615 ) ) ( AVAILABLE ?auto_12615 ) ( SURFACE-AT ?auto_12608 ?auto_12610 ) ( ON ?auto_12608 ?auto_12609 ) ( CLEAR ?auto_12608 ) ( not ( = ?auto_12607 ?auto_12609 ) ) ( not ( = ?auto_12608 ?auto_12609 ) ) ( not ( = ?auto_12614 ?auto_12609 ) ) ( TRUCK-AT ?auto_12611 ?auto_12616 ) ( not ( = ?auto_12616 ?auto_12613 ) ) ( not ( = ?auto_12610 ?auto_12616 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_12611 ?auto_12616 ?auto_12613 )
      ( MAKE-1CRATE ?auto_12607 ?auto_12608 )
      ( MAKE-1CRATE-VERIFY ?auto_12607 ?auto_12608 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_12647 - SURFACE
      ?auto_12648 - SURFACE
      ?auto_12649 - SURFACE
      ?auto_12646 - SURFACE
    )
    :vars
    (
      ?auto_12651 - HOIST
      ?auto_12650 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12651 ?auto_12650 ) ( SURFACE-AT ?auto_12649 ?auto_12650 ) ( CLEAR ?auto_12649 ) ( LIFTING ?auto_12651 ?auto_12646 ) ( IS-CRATE ?auto_12646 ) ( not ( = ?auto_12649 ?auto_12646 ) ) ( ON ?auto_12648 ?auto_12647 ) ( ON ?auto_12649 ?auto_12648 ) ( not ( = ?auto_12647 ?auto_12648 ) ) ( not ( = ?auto_12647 ?auto_12649 ) ) ( not ( = ?auto_12647 ?auto_12646 ) ) ( not ( = ?auto_12648 ?auto_12649 ) ) ( not ( = ?auto_12648 ?auto_12646 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_12649 ?auto_12646 )
      ( MAKE-3CRATE-VERIFY ?auto_12647 ?auto_12648 ?auto_12649 ?auto_12646 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_12664 - SURFACE
      ?auto_12665 - SURFACE
      ?auto_12666 - SURFACE
      ?auto_12663 - SURFACE
    )
    :vars
    (
      ?auto_12668 - HOIST
      ?auto_12667 - PLACE
      ?auto_12669 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12668 ?auto_12667 ) ( SURFACE-AT ?auto_12666 ?auto_12667 ) ( CLEAR ?auto_12666 ) ( IS-CRATE ?auto_12663 ) ( not ( = ?auto_12666 ?auto_12663 ) ) ( TRUCK-AT ?auto_12669 ?auto_12667 ) ( AVAILABLE ?auto_12668 ) ( IN ?auto_12663 ?auto_12669 ) ( ON ?auto_12666 ?auto_12665 ) ( not ( = ?auto_12665 ?auto_12666 ) ) ( not ( = ?auto_12665 ?auto_12663 ) ) ( ON ?auto_12665 ?auto_12664 ) ( not ( = ?auto_12664 ?auto_12665 ) ) ( not ( = ?auto_12664 ?auto_12666 ) ) ( not ( = ?auto_12664 ?auto_12663 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_12665 ?auto_12666 ?auto_12663 )
      ( MAKE-3CRATE-VERIFY ?auto_12664 ?auto_12665 ?auto_12666 ?auto_12663 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_12685 - SURFACE
      ?auto_12686 - SURFACE
      ?auto_12687 - SURFACE
      ?auto_12684 - SURFACE
    )
    :vars
    (
      ?auto_12691 - HOIST
      ?auto_12688 - PLACE
      ?auto_12690 - TRUCK
      ?auto_12689 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12691 ?auto_12688 ) ( SURFACE-AT ?auto_12687 ?auto_12688 ) ( CLEAR ?auto_12687 ) ( IS-CRATE ?auto_12684 ) ( not ( = ?auto_12687 ?auto_12684 ) ) ( AVAILABLE ?auto_12691 ) ( IN ?auto_12684 ?auto_12690 ) ( ON ?auto_12687 ?auto_12686 ) ( not ( = ?auto_12686 ?auto_12687 ) ) ( not ( = ?auto_12686 ?auto_12684 ) ) ( TRUCK-AT ?auto_12690 ?auto_12689 ) ( not ( = ?auto_12689 ?auto_12688 ) ) ( ON ?auto_12686 ?auto_12685 ) ( not ( = ?auto_12685 ?auto_12686 ) ) ( not ( = ?auto_12685 ?auto_12687 ) ) ( not ( = ?auto_12685 ?auto_12684 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_12686 ?auto_12687 ?auto_12684 )
      ( MAKE-3CRATE-VERIFY ?auto_12685 ?auto_12686 ?auto_12687 ?auto_12684 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_12709 - SURFACE
      ?auto_12710 - SURFACE
      ?auto_12711 - SURFACE
      ?auto_12708 - SURFACE
    )
    :vars
    (
      ?auto_12716 - HOIST
      ?auto_12715 - PLACE
      ?auto_12714 - TRUCK
      ?auto_12713 - PLACE
      ?auto_12712 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_12716 ?auto_12715 ) ( SURFACE-AT ?auto_12711 ?auto_12715 ) ( CLEAR ?auto_12711 ) ( IS-CRATE ?auto_12708 ) ( not ( = ?auto_12711 ?auto_12708 ) ) ( AVAILABLE ?auto_12716 ) ( ON ?auto_12711 ?auto_12710 ) ( not ( = ?auto_12710 ?auto_12711 ) ) ( not ( = ?auto_12710 ?auto_12708 ) ) ( TRUCK-AT ?auto_12714 ?auto_12713 ) ( not ( = ?auto_12713 ?auto_12715 ) ) ( HOIST-AT ?auto_12712 ?auto_12713 ) ( LIFTING ?auto_12712 ?auto_12708 ) ( not ( = ?auto_12716 ?auto_12712 ) ) ( ON ?auto_12710 ?auto_12709 ) ( not ( = ?auto_12709 ?auto_12710 ) ) ( not ( = ?auto_12709 ?auto_12711 ) ) ( not ( = ?auto_12709 ?auto_12708 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_12710 ?auto_12711 ?auto_12708 )
      ( MAKE-3CRATE-VERIFY ?auto_12709 ?auto_12710 ?auto_12711 ?auto_12708 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_12736 - SURFACE
      ?auto_12737 - SURFACE
      ?auto_12738 - SURFACE
      ?auto_12735 - SURFACE
    )
    :vars
    (
      ?auto_12744 - HOIST
      ?auto_12742 - PLACE
      ?auto_12741 - TRUCK
      ?auto_12740 - PLACE
      ?auto_12743 - HOIST
      ?auto_12739 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12744 ?auto_12742 ) ( SURFACE-AT ?auto_12738 ?auto_12742 ) ( CLEAR ?auto_12738 ) ( IS-CRATE ?auto_12735 ) ( not ( = ?auto_12738 ?auto_12735 ) ) ( AVAILABLE ?auto_12744 ) ( ON ?auto_12738 ?auto_12737 ) ( not ( = ?auto_12737 ?auto_12738 ) ) ( not ( = ?auto_12737 ?auto_12735 ) ) ( TRUCK-AT ?auto_12741 ?auto_12740 ) ( not ( = ?auto_12740 ?auto_12742 ) ) ( HOIST-AT ?auto_12743 ?auto_12740 ) ( not ( = ?auto_12744 ?auto_12743 ) ) ( AVAILABLE ?auto_12743 ) ( SURFACE-AT ?auto_12735 ?auto_12740 ) ( ON ?auto_12735 ?auto_12739 ) ( CLEAR ?auto_12735 ) ( not ( = ?auto_12738 ?auto_12739 ) ) ( not ( = ?auto_12735 ?auto_12739 ) ) ( not ( = ?auto_12737 ?auto_12739 ) ) ( ON ?auto_12737 ?auto_12736 ) ( not ( = ?auto_12736 ?auto_12737 ) ) ( not ( = ?auto_12736 ?auto_12738 ) ) ( not ( = ?auto_12736 ?auto_12735 ) ) ( not ( = ?auto_12736 ?auto_12739 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_12737 ?auto_12738 ?auto_12735 )
      ( MAKE-3CRATE-VERIFY ?auto_12736 ?auto_12737 ?auto_12738 ?auto_12735 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_12764 - SURFACE
      ?auto_12765 - SURFACE
      ?auto_12766 - SURFACE
      ?auto_12763 - SURFACE
    )
    :vars
    (
      ?auto_12771 - HOIST
      ?auto_12772 - PLACE
      ?auto_12770 - PLACE
      ?auto_12768 - HOIST
      ?auto_12769 - SURFACE
      ?auto_12767 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12771 ?auto_12772 ) ( SURFACE-AT ?auto_12766 ?auto_12772 ) ( CLEAR ?auto_12766 ) ( IS-CRATE ?auto_12763 ) ( not ( = ?auto_12766 ?auto_12763 ) ) ( AVAILABLE ?auto_12771 ) ( ON ?auto_12766 ?auto_12765 ) ( not ( = ?auto_12765 ?auto_12766 ) ) ( not ( = ?auto_12765 ?auto_12763 ) ) ( not ( = ?auto_12770 ?auto_12772 ) ) ( HOIST-AT ?auto_12768 ?auto_12770 ) ( not ( = ?auto_12771 ?auto_12768 ) ) ( AVAILABLE ?auto_12768 ) ( SURFACE-AT ?auto_12763 ?auto_12770 ) ( ON ?auto_12763 ?auto_12769 ) ( CLEAR ?auto_12763 ) ( not ( = ?auto_12766 ?auto_12769 ) ) ( not ( = ?auto_12763 ?auto_12769 ) ) ( not ( = ?auto_12765 ?auto_12769 ) ) ( TRUCK-AT ?auto_12767 ?auto_12772 ) ( ON ?auto_12765 ?auto_12764 ) ( not ( = ?auto_12764 ?auto_12765 ) ) ( not ( = ?auto_12764 ?auto_12766 ) ) ( not ( = ?auto_12764 ?auto_12763 ) ) ( not ( = ?auto_12764 ?auto_12769 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_12765 ?auto_12766 ?auto_12763 )
      ( MAKE-3CRATE-VERIFY ?auto_12764 ?auto_12765 ?auto_12766 ?auto_12763 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_12792 - SURFACE
      ?auto_12793 - SURFACE
      ?auto_12794 - SURFACE
      ?auto_12791 - SURFACE
    )
    :vars
    (
      ?auto_12800 - HOIST
      ?auto_12798 - PLACE
      ?auto_12797 - PLACE
      ?auto_12799 - HOIST
      ?auto_12795 - SURFACE
      ?auto_12796 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12800 ?auto_12798 ) ( IS-CRATE ?auto_12791 ) ( not ( = ?auto_12794 ?auto_12791 ) ) ( not ( = ?auto_12793 ?auto_12794 ) ) ( not ( = ?auto_12793 ?auto_12791 ) ) ( not ( = ?auto_12797 ?auto_12798 ) ) ( HOIST-AT ?auto_12799 ?auto_12797 ) ( not ( = ?auto_12800 ?auto_12799 ) ) ( AVAILABLE ?auto_12799 ) ( SURFACE-AT ?auto_12791 ?auto_12797 ) ( ON ?auto_12791 ?auto_12795 ) ( CLEAR ?auto_12791 ) ( not ( = ?auto_12794 ?auto_12795 ) ) ( not ( = ?auto_12791 ?auto_12795 ) ) ( not ( = ?auto_12793 ?auto_12795 ) ) ( TRUCK-AT ?auto_12796 ?auto_12798 ) ( SURFACE-AT ?auto_12793 ?auto_12798 ) ( CLEAR ?auto_12793 ) ( LIFTING ?auto_12800 ?auto_12794 ) ( IS-CRATE ?auto_12794 ) ( ON ?auto_12793 ?auto_12792 ) ( not ( = ?auto_12792 ?auto_12793 ) ) ( not ( = ?auto_12792 ?auto_12794 ) ) ( not ( = ?auto_12792 ?auto_12791 ) ) ( not ( = ?auto_12792 ?auto_12795 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_12793 ?auto_12794 ?auto_12791 )
      ( MAKE-3CRATE-VERIFY ?auto_12792 ?auto_12793 ?auto_12794 ?auto_12791 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_12820 - SURFACE
      ?auto_12821 - SURFACE
      ?auto_12822 - SURFACE
      ?auto_12819 - SURFACE
    )
    :vars
    (
      ?auto_12823 - HOIST
      ?auto_12824 - PLACE
      ?auto_12826 - PLACE
      ?auto_12828 - HOIST
      ?auto_12827 - SURFACE
      ?auto_12825 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12823 ?auto_12824 ) ( IS-CRATE ?auto_12819 ) ( not ( = ?auto_12822 ?auto_12819 ) ) ( not ( = ?auto_12821 ?auto_12822 ) ) ( not ( = ?auto_12821 ?auto_12819 ) ) ( not ( = ?auto_12826 ?auto_12824 ) ) ( HOIST-AT ?auto_12828 ?auto_12826 ) ( not ( = ?auto_12823 ?auto_12828 ) ) ( AVAILABLE ?auto_12828 ) ( SURFACE-AT ?auto_12819 ?auto_12826 ) ( ON ?auto_12819 ?auto_12827 ) ( CLEAR ?auto_12819 ) ( not ( = ?auto_12822 ?auto_12827 ) ) ( not ( = ?auto_12819 ?auto_12827 ) ) ( not ( = ?auto_12821 ?auto_12827 ) ) ( TRUCK-AT ?auto_12825 ?auto_12824 ) ( SURFACE-AT ?auto_12821 ?auto_12824 ) ( CLEAR ?auto_12821 ) ( IS-CRATE ?auto_12822 ) ( AVAILABLE ?auto_12823 ) ( IN ?auto_12822 ?auto_12825 ) ( ON ?auto_12821 ?auto_12820 ) ( not ( = ?auto_12820 ?auto_12821 ) ) ( not ( = ?auto_12820 ?auto_12822 ) ) ( not ( = ?auto_12820 ?auto_12819 ) ) ( not ( = ?auto_12820 ?auto_12827 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_12821 ?auto_12822 ?auto_12819 )
      ( MAKE-3CRATE-VERIFY ?auto_12820 ?auto_12821 ?auto_12822 ?auto_12819 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_13111 - SURFACE
      ?auto_13112 - SURFACE
      ?auto_13113 - SURFACE
      ?auto_13110 - SURFACE
      ?auto_13114 - SURFACE
    )
    :vars
    (
      ?auto_13116 - HOIST
      ?auto_13115 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13116 ?auto_13115 ) ( SURFACE-AT ?auto_13110 ?auto_13115 ) ( CLEAR ?auto_13110 ) ( LIFTING ?auto_13116 ?auto_13114 ) ( IS-CRATE ?auto_13114 ) ( not ( = ?auto_13110 ?auto_13114 ) ) ( ON ?auto_13112 ?auto_13111 ) ( ON ?auto_13113 ?auto_13112 ) ( ON ?auto_13110 ?auto_13113 ) ( not ( = ?auto_13111 ?auto_13112 ) ) ( not ( = ?auto_13111 ?auto_13113 ) ) ( not ( = ?auto_13111 ?auto_13110 ) ) ( not ( = ?auto_13111 ?auto_13114 ) ) ( not ( = ?auto_13112 ?auto_13113 ) ) ( not ( = ?auto_13112 ?auto_13110 ) ) ( not ( = ?auto_13112 ?auto_13114 ) ) ( not ( = ?auto_13113 ?auto_13110 ) ) ( not ( = ?auto_13113 ?auto_13114 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_13110 ?auto_13114 )
      ( MAKE-4CRATE-VERIFY ?auto_13111 ?auto_13112 ?auto_13113 ?auto_13110 ?auto_13114 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_13136 - SURFACE
      ?auto_13137 - SURFACE
      ?auto_13138 - SURFACE
      ?auto_13135 - SURFACE
      ?auto_13139 - SURFACE
    )
    :vars
    (
      ?auto_13140 - HOIST
      ?auto_13141 - PLACE
      ?auto_13142 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13140 ?auto_13141 ) ( SURFACE-AT ?auto_13135 ?auto_13141 ) ( CLEAR ?auto_13135 ) ( IS-CRATE ?auto_13139 ) ( not ( = ?auto_13135 ?auto_13139 ) ) ( TRUCK-AT ?auto_13142 ?auto_13141 ) ( AVAILABLE ?auto_13140 ) ( IN ?auto_13139 ?auto_13142 ) ( ON ?auto_13135 ?auto_13138 ) ( not ( = ?auto_13138 ?auto_13135 ) ) ( not ( = ?auto_13138 ?auto_13139 ) ) ( ON ?auto_13137 ?auto_13136 ) ( ON ?auto_13138 ?auto_13137 ) ( not ( = ?auto_13136 ?auto_13137 ) ) ( not ( = ?auto_13136 ?auto_13138 ) ) ( not ( = ?auto_13136 ?auto_13135 ) ) ( not ( = ?auto_13136 ?auto_13139 ) ) ( not ( = ?auto_13137 ?auto_13138 ) ) ( not ( = ?auto_13137 ?auto_13135 ) ) ( not ( = ?auto_13137 ?auto_13139 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_13138 ?auto_13135 ?auto_13139 )
      ( MAKE-4CRATE-VERIFY ?auto_13136 ?auto_13137 ?auto_13138 ?auto_13135 ?auto_13139 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_13166 - SURFACE
      ?auto_13167 - SURFACE
      ?auto_13168 - SURFACE
      ?auto_13165 - SURFACE
      ?auto_13169 - SURFACE
    )
    :vars
    (
      ?auto_13171 - HOIST
      ?auto_13170 - PLACE
      ?auto_13172 - TRUCK
      ?auto_13173 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13171 ?auto_13170 ) ( SURFACE-AT ?auto_13165 ?auto_13170 ) ( CLEAR ?auto_13165 ) ( IS-CRATE ?auto_13169 ) ( not ( = ?auto_13165 ?auto_13169 ) ) ( AVAILABLE ?auto_13171 ) ( IN ?auto_13169 ?auto_13172 ) ( ON ?auto_13165 ?auto_13168 ) ( not ( = ?auto_13168 ?auto_13165 ) ) ( not ( = ?auto_13168 ?auto_13169 ) ) ( TRUCK-AT ?auto_13172 ?auto_13173 ) ( not ( = ?auto_13173 ?auto_13170 ) ) ( ON ?auto_13167 ?auto_13166 ) ( ON ?auto_13168 ?auto_13167 ) ( not ( = ?auto_13166 ?auto_13167 ) ) ( not ( = ?auto_13166 ?auto_13168 ) ) ( not ( = ?auto_13166 ?auto_13165 ) ) ( not ( = ?auto_13166 ?auto_13169 ) ) ( not ( = ?auto_13167 ?auto_13168 ) ) ( not ( = ?auto_13167 ?auto_13165 ) ) ( not ( = ?auto_13167 ?auto_13169 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_13168 ?auto_13165 ?auto_13169 )
      ( MAKE-4CRATE-VERIFY ?auto_13166 ?auto_13167 ?auto_13168 ?auto_13165 ?auto_13169 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_13200 - SURFACE
      ?auto_13201 - SURFACE
      ?auto_13202 - SURFACE
      ?auto_13199 - SURFACE
      ?auto_13203 - SURFACE
    )
    :vars
    (
      ?auto_13205 - HOIST
      ?auto_13204 - PLACE
      ?auto_13208 - TRUCK
      ?auto_13207 - PLACE
      ?auto_13206 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_13205 ?auto_13204 ) ( SURFACE-AT ?auto_13199 ?auto_13204 ) ( CLEAR ?auto_13199 ) ( IS-CRATE ?auto_13203 ) ( not ( = ?auto_13199 ?auto_13203 ) ) ( AVAILABLE ?auto_13205 ) ( ON ?auto_13199 ?auto_13202 ) ( not ( = ?auto_13202 ?auto_13199 ) ) ( not ( = ?auto_13202 ?auto_13203 ) ) ( TRUCK-AT ?auto_13208 ?auto_13207 ) ( not ( = ?auto_13207 ?auto_13204 ) ) ( HOIST-AT ?auto_13206 ?auto_13207 ) ( LIFTING ?auto_13206 ?auto_13203 ) ( not ( = ?auto_13205 ?auto_13206 ) ) ( ON ?auto_13201 ?auto_13200 ) ( ON ?auto_13202 ?auto_13201 ) ( not ( = ?auto_13200 ?auto_13201 ) ) ( not ( = ?auto_13200 ?auto_13202 ) ) ( not ( = ?auto_13200 ?auto_13199 ) ) ( not ( = ?auto_13200 ?auto_13203 ) ) ( not ( = ?auto_13201 ?auto_13202 ) ) ( not ( = ?auto_13201 ?auto_13199 ) ) ( not ( = ?auto_13201 ?auto_13203 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_13202 ?auto_13199 ?auto_13203 )
      ( MAKE-4CRATE-VERIFY ?auto_13200 ?auto_13201 ?auto_13202 ?auto_13199 ?auto_13203 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_13238 - SURFACE
      ?auto_13239 - SURFACE
      ?auto_13240 - SURFACE
      ?auto_13237 - SURFACE
      ?auto_13241 - SURFACE
    )
    :vars
    (
      ?auto_13245 - HOIST
      ?auto_13243 - PLACE
      ?auto_13246 - TRUCK
      ?auto_13247 - PLACE
      ?auto_13242 - HOIST
      ?auto_13244 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13245 ?auto_13243 ) ( SURFACE-AT ?auto_13237 ?auto_13243 ) ( CLEAR ?auto_13237 ) ( IS-CRATE ?auto_13241 ) ( not ( = ?auto_13237 ?auto_13241 ) ) ( AVAILABLE ?auto_13245 ) ( ON ?auto_13237 ?auto_13240 ) ( not ( = ?auto_13240 ?auto_13237 ) ) ( not ( = ?auto_13240 ?auto_13241 ) ) ( TRUCK-AT ?auto_13246 ?auto_13247 ) ( not ( = ?auto_13247 ?auto_13243 ) ) ( HOIST-AT ?auto_13242 ?auto_13247 ) ( not ( = ?auto_13245 ?auto_13242 ) ) ( AVAILABLE ?auto_13242 ) ( SURFACE-AT ?auto_13241 ?auto_13247 ) ( ON ?auto_13241 ?auto_13244 ) ( CLEAR ?auto_13241 ) ( not ( = ?auto_13237 ?auto_13244 ) ) ( not ( = ?auto_13241 ?auto_13244 ) ) ( not ( = ?auto_13240 ?auto_13244 ) ) ( ON ?auto_13239 ?auto_13238 ) ( ON ?auto_13240 ?auto_13239 ) ( not ( = ?auto_13238 ?auto_13239 ) ) ( not ( = ?auto_13238 ?auto_13240 ) ) ( not ( = ?auto_13238 ?auto_13237 ) ) ( not ( = ?auto_13238 ?auto_13241 ) ) ( not ( = ?auto_13238 ?auto_13244 ) ) ( not ( = ?auto_13239 ?auto_13240 ) ) ( not ( = ?auto_13239 ?auto_13237 ) ) ( not ( = ?auto_13239 ?auto_13241 ) ) ( not ( = ?auto_13239 ?auto_13244 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_13240 ?auto_13237 ?auto_13241 )
      ( MAKE-4CRATE-VERIFY ?auto_13238 ?auto_13239 ?auto_13240 ?auto_13237 ?auto_13241 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_13277 - SURFACE
      ?auto_13278 - SURFACE
      ?auto_13279 - SURFACE
      ?auto_13276 - SURFACE
      ?auto_13280 - SURFACE
    )
    :vars
    (
      ?auto_13285 - HOIST
      ?auto_13286 - PLACE
      ?auto_13281 - PLACE
      ?auto_13283 - HOIST
      ?auto_13282 - SURFACE
      ?auto_13284 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13285 ?auto_13286 ) ( SURFACE-AT ?auto_13276 ?auto_13286 ) ( CLEAR ?auto_13276 ) ( IS-CRATE ?auto_13280 ) ( not ( = ?auto_13276 ?auto_13280 ) ) ( AVAILABLE ?auto_13285 ) ( ON ?auto_13276 ?auto_13279 ) ( not ( = ?auto_13279 ?auto_13276 ) ) ( not ( = ?auto_13279 ?auto_13280 ) ) ( not ( = ?auto_13281 ?auto_13286 ) ) ( HOIST-AT ?auto_13283 ?auto_13281 ) ( not ( = ?auto_13285 ?auto_13283 ) ) ( AVAILABLE ?auto_13283 ) ( SURFACE-AT ?auto_13280 ?auto_13281 ) ( ON ?auto_13280 ?auto_13282 ) ( CLEAR ?auto_13280 ) ( not ( = ?auto_13276 ?auto_13282 ) ) ( not ( = ?auto_13280 ?auto_13282 ) ) ( not ( = ?auto_13279 ?auto_13282 ) ) ( TRUCK-AT ?auto_13284 ?auto_13286 ) ( ON ?auto_13278 ?auto_13277 ) ( ON ?auto_13279 ?auto_13278 ) ( not ( = ?auto_13277 ?auto_13278 ) ) ( not ( = ?auto_13277 ?auto_13279 ) ) ( not ( = ?auto_13277 ?auto_13276 ) ) ( not ( = ?auto_13277 ?auto_13280 ) ) ( not ( = ?auto_13277 ?auto_13282 ) ) ( not ( = ?auto_13278 ?auto_13279 ) ) ( not ( = ?auto_13278 ?auto_13276 ) ) ( not ( = ?auto_13278 ?auto_13280 ) ) ( not ( = ?auto_13278 ?auto_13282 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_13279 ?auto_13276 ?auto_13280 )
      ( MAKE-4CRATE-VERIFY ?auto_13277 ?auto_13278 ?auto_13279 ?auto_13276 ?auto_13280 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_13316 - SURFACE
      ?auto_13317 - SURFACE
      ?auto_13318 - SURFACE
      ?auto_13315 - SURFACE
      ?auto_13319 - SURFACE
    )
    :vars
    (
      ?auto_13323 - HOIST
      ?auto_13325 - PLACE
      ?auto_13321 - PLACE
      ?auto_13320 - HOIST
      ?auto_13322 - SURFACE
      ?auto_13324 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13323 ?auto_13325 ) ( IS-CRATE ?auto_13319 ) ( not ( = ?auto_13315 ?auto_13319 ) ) ( not ( = ?auto_13318 ?auto_13315 ) ) ( not ( = ?auto_13318 ?auto_13319 ) ) ( not ( = ?auto_13321 ?auto_13325 ) ) ( HOIST-AT ?auto_13320 ?auto_13321 ) ( not ( = ?auto_13323 ?auto_13320 ) ) ( AVAILABLE ?auto_13320 ) ( SURFACE-AT ?auto_13319 ?auto_13321 ) ( ON ?auto_13319 ?auto_13322 ) ( CLEAR ?auto_13319 ) ( not ( = ?auto_13315 ?auto_13322 ) ) ( not ( = ?auto_13319 ?auto_13322 ) ) ( not ( = ?auto_13318 ?auto_13322 ) ) ( TRUCK-AT ?auto_13324 ?auto_13325 ) ( SURFACE-AT ?auto_13318 ?auto_13325 ) ( CLEAR ?auto_13318 ) ( LIFTING ?auto_13323 ?auto_13315 ) ( IS-CRATE ?auto_13315 ) ( ON ?auto_13317 ?auto_13316 ) ( ON ?auto_13318 ?auto_13317 ) ( not ( = ?auto_13316 ?auto_13317 ) ) ( not ( = ?auto_13316 ?auto_13318 ) ) ( not ( = ?auto_13316 ?auto_13315 ) ) ( not ( = ?auto_13316 ?auto_13319 ) ) ( not ( = ?auto_13316 ?auto_13322 ) ) ( not ( = ?auto_13317 ?auto_13318 ) ) ( not ( = ?auto_13317 ?auto_13315 ) ) ( not ( = ?auto_13317 ?auto_13319 ) ) ( not ( = ?auto_13317 ?auto_13322 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_13318 ?auto_13315 ?auto_13319 )
      ( MAKE-4CRATE-VERIFY ?auto_13316 ?auto_13317 ?auto_13318 ?auto_13315 ?auto_13319 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_13355 - SURFACE
      ?auto_13356 - SURFACE
      ?auto_13357 - SURFACE
      ?auto_13354 - SURFACE
      ?auto_13358 - SURFACE
    )
    :vars
    (
      ?auto_13361 - HOIST
      ?auto_13364 - PLACE
      ?auto_13363 - PLACE
      ?auto_13362 - HOIST
      ?auto_13359 - SURFACE
      ?auto_13360 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13361 ?auto_13364 ) ( IS-CRATE ?auto_13358 ) ( not ( = ?auto_13354 ?auto_13358 ) ) ( not ( = ?auto_13357 ?auto_13354 ) ) ( not ( = ?auto_13357 ?auto_13358 ) ) ( not ( = ?auto_13363 ?auto_13364 ) ) ( HOIST-AT ?auto_13362 ?auto_13363 ) ( not ( = ?auto_13361 ?auto_13362 ) ) ( AVAILABLE ?auto_13362 ) ( SURFACE-AT ?auto_13358 ?auto_13363 ) ( ON ?auto_13358 ?auto_13359 ) ( CLEAR ?auto_13358 ) ( not ( = ?auto_13354 ?auto_13359 ) ) ( not ( = ?auto_13358 ?auto_13359 ) ) ( not ( = ?auto_13357 ?auto_13359 ) ) ( TRUCK-AT ?auto_13360 ?auto_13364 ) ( SURFACE-AT ?auto_13357 ?auto_13364 ) ( CLEAR ?auto_13357 ) ( IS-CRATE ?auto_13354 ) ( AVAILABLE ?auto_13361 ) ( IN ?auto_13354 ?auto_13360 ) ( ON ?auto_13356 ?auto_13355 ) ( ON ?auto_13357 ?auto_13356 ) ( not ( = ?auto_13355 ?auto_13356 ) ) ( not ( = ?auto_13355 ?auto_13357 ) ) ( not ( = ?auto_13355 ?auto_13354 ) ) ( not ( = ?auto_13355 ?auto_13358 ) ) ( not ( = ?auto_13355 ?auto_13359 ) ) ( not ( = ?auto_13356 ?auto_13357 ) ) ( not ( = ?auto_13356 ?auto_13354 ) ) ( not ( = ?auto_13356 ?auto_13358 ) ) ( not ( = ?auto_13356 ?auto_13359 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_13357 ?auto_13354 ?auto_13358 )
      ( MAKE-4CRATE-VERIFY ?auto_13355 ?auto_13356 ?auto_13357 ?auto_13354 ?auto_13358 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13855 - SURFACE
      ?auto_13856 - SURFACE
    )
    :vars
    (
      ?auto_13860 - HOIST
      ?auto_13863 - PLACE
      ?auto_13857 - SURFACE
      ?auto_13862 - TRUCK
      ?auto_13859 - PLACE
      ?auto_13861 - HOIST
      ?auto_13858 - SURFACE
      ?auto_13864 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13860 ?auto_13863 ) ( SURFACE-AT ?auto_13855 ?auto_13863 ) ( CLEAR ?auto_13855 ) ( IS-CRATE ?auto_13856 ) ( not ( = ?auto_13855 ?auto_13856 ) ) ( AVAILABLE ?auto_13860 ) ( ON ?auto_13855 ?auto_13857 ) ( not ( = ?auto_13857 ?auto_13855 ) ) ( not ( = ?auto_13857 ?auto_13856 ) ) ( TRUCK-AT ?auto_13862 ?auto_13859 ) ( not ( = ?auto_13859 ?auto_13863 ) ) ( HOIST-AT ?auto_13861 ?auto_13859 ) ( not ( = ?auto_13860 ?auto_13861 ) ) ( SURFACE-AT ?auto_13856 ?auto_13859 ) ( ON ?auto_13856 ?auto_13858 ) ( CLEAR ?auto_13856 ) ( not ( = ?auto_13855 ?auto_13858 ) ) ( not ( = ?auto_13856 ?auto_13858 ) ) ( not ( = ?auto_13857 ?auto_13858 ) ) ( LIFTING ?auto_13861 ?auto_13864 ) ( IS-CRATE ?auto_13864 ) ( not ( = ?auto_13855 ?auto_13864 ) ) ( not ( = ?auto_13856 ?auto_13864 ) ) ( not ( = ?auto_13857 ?auto_13864 ) ) ( not ( = ?auto_13858 ?auto_13864 ) ) )
    :subtasks
    ( ( !LOAD ?auto_13861 ?auto_13864 ?auto_13862 ?auto_13859 )
      ( MAKE-1CRATE ?auto_13855 ?auto_13856 )
      ( MAKE-1CRATE-VERIFY ?auto_13855 ?auto_13856 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_14015 - SURFACE
      ?auto_14016 - SURFACE
      ?auto_14017 - SURFACE
      ?auto_14014 - SURFACE
      ?auto_14018 - SURFACE
      ?auto_14019 - SURFACE
    )
    :vars
    (
      ?auto_14021 - HOIST
      ?auto_14020 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14021 ?auto_14020 ) ( SURFACE-AT ?auto_14018 ?auto_14020 ) ( CLEAR ?auto_14018 ) ( LIFTING ?auto_14021 ?auto_14019 ) ( IS-CRATE ?auto_14019 ) ( not ( = ?auto_14018 ?auto_14019 ) ) ( ON ?auto_14016 ?auto_14015 ) ( ON ?auto_14017 ?auto_14016 ) ( ON ?auto_14014 ?auto_14017 ) ( ON ?auto_14018 ?auto_14014 ) ( not ( = ?auto_14015 ?auto_14016 ) ) ( not ( = ?auto_14015 ?auto_14017 ) ) ( not ( = ?auto_14015 ?auto_14014 ) ) ( not ( = ?auto_14015 ?auto_14018 ) ) ( not ( = ?auto_14015 ?auto_14019 ) ) ( not ( = ?auto_14016 ?auto_14017 ) ) ( not ( = ?auto_14016 ?auto_14014 ) ) ( not ( = ?auto_14016 ?auto_14018 ) ) ( not ( = ?auto_14016 ?auto_14019 ) ) ( not ( = ?auto_14017 ?auto_14014 ) ) ( not ( = ?auto_14017 ?auto_14018 ) ) ( not ( = ?auto_14017 ?auto_14019 ) ) ( not ( = ?auto_14014 ?auto_14018 ) ) ( not ( = ?auto_14014 ?auto_14019 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_14018 ?auto_14019 )
      ( MAKE-5CRATE-VERIFY ?auto_14015 ?auto_14016 ?auto_14017 ?auto_14014 ?auto_14018 ?auto_14019 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_14049 - SURFACE
      ?auto_14050 - SURFACE
      ?auto_14051 - SURFACE
      ?auto_14048 - SURFACE
      ?auto_14052 - SURFACE
      ?auto_14053 - SURFACE
    )
    :vars
    (
      ?auto_14055 - HOIST
      ?auto_14056 - PLACE
      ?auto_14054 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14055 ?auto_14056 ) ( SURFACE-AT ?auto_14052 ?auto_14056 ) ( CLEAR ?auto_14052 ) ( IS-CRATE ?auto_14053 ) ( not ( = ?auto_14052 ?auto_14053 ) ) ( TRUCK-AT ?auto_14054 ?auto_14056 ) ( AVAILABLE ?auto_14055 ) ( IN ?auto_14053 ?auto_14054 ) ( ON ?auto_14052 ?auto_14048 ) ( not ( = ?auto_14048 ?auto_14052 ) ) ( not ( = ?auto_14048 ?auto_14053 ) ) ( ON ?auto_14050 ?auto_14049 ) ( ON ?auto_14051 ?auto_14050 ) ( ON ?auto_14048 ?auto_14051 ) ( not ( = ?auto_14049 ?auto_14050 ) ) ( not ( = ?auto_14049 ?auto_14051 ) ) ( not ( = ?auto_14049 ?auto_14048 ) ) ( not ( = ?auto_14049 ?auto_14052 ) ) ( not ( = ?auto_14049 ?auto_14053 ) ) ( not ( = ?auto_14050 ?auto_14051 ) ) ( not ( = ?auto_14050 ?auto_14048 ) ) ( not ( = ?auto_14050 ?auto_14052 ) ) ( not ( = ?auto_14050 ?auto_14053 ) ) ( not ( = ?auto_14051 ?auto_14048 ) ) ( not ( = ?auto_14051 ?auto_14052 ) ) ( not ( = ?auto_14051 ?auto_14053 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_14048 ?auto_14052 ?auto_14053 )
      ( MAKE-5CRATE-VERIFY ?auto_14049 ?auto_14050 ?auto_14051 ?auto_14048 ?auto_14052 ?auto_14053 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_14089 - SURFACE
      ?auto_14090 - SURFACE
      ?auto_14091 - SURFACE
      ?auto_14088 - SURFACE
      ?auto_14092 - SURFACE
      ?auto_14093 - SURFACE
    )
    :vars
    (
      ?auto_14096 - HOIST
      ?auto_14094 - PLACE
      ?auto_14095 - TRUCK
      ?auto_14097 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14096 ?auto_14094 ) ( SURFACE-AT ?auto_14092 ?auto_14094 ) ( CLEAR ?auto_14092 ) ( IS-CRATE ?auto_14093 ) ( not ( = ?auto_14092 ?auto_14093 ) ) ( AVAILABLE ?auto_14096 ) ( IN ?auto_14093 ?auto_14095 ) ( ON ?auto_14092 ?auto_14088 ) ( not ( = ?auto_14088 ?auto_14092 ) ) ( not ( = ?auto_14088 ?auto_14093 ) ) ( TRUCK-AT ?auto_14095 ?auto_14097 ) ( not ( = ?auto_14097 ?auto_14094 ) ) ( ON ?auto_14090 ?auto_14089 ) ( ON ?auto_14091 ?auto_14090 ) ( ON ?auto_14088 ?auto_14091 ) ( not ( = ?auto_14089 ?auto_14090 ) ) ( not ( = ?auto_14089 ?auto_14091 ) ) ( not ( = ?auto_14089 ?auto_14088 ) ) ( not ( = ?auto_14089 ?auto_14092 ) ) ( not ( = ?auto_14089 ?auto_14093 ) ) ( not ( = ?auto_14090 ?auto_14091 ) ) ( not ( = ?auto_14090 ?auto_14088 ) ) ( not ( = ?auto_14090 ?auto_14092 ) ) ( not ( = ?auto_14090 ?auto_14093 ) ) ( not ( = ?auto_14091 ?auto_14088 ) ) ( not ( = ?auto_14091 ?auto_14092 ) ) ( not ( = ?auto_14091 ?auto_14093 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_14088 ?auto_14092 ?auto_14093 )
      ( MAKE-5CRATE-VERIFY ?auto_14089 ?auto_14090 ?auto_14091 ?auto_14088 ?auto_14092 ?auto_14093 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_14134 - SURFACE
      ?auto_14135 - SURFACE
      ?auto_14136 - SURFACE
      ?auto_14133 - SURFACE
      ?auto_14137 - SURFACE
      ?auto_14138 - SURFACE
    )
    :vars
    (
      ?auto_14141 - HOIST
      ?auto_14140 - PLACE
      ?auto_14143 - TRUCK
      ?auto_14142 - PLACE
      ?auto_14139 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_14141 ?auto_14140 ) ( SURFACE-AT ?auto_14137 ?auto_14140 ) ( CLEAR ?auto_14137 ) ( IS-CRATE ?auto_14138 ) ( not ( = ?auto_14137 ?auto_14138 ) ) ( AVAILABLE ?auto_14141 ) ( ON ?auto_14137 ?auto_14133 ) ( not ( = ?auto_14133 ?auto_14137 ) ) ( not ( = ?auto_14133 ?auto_14138 ) ) ( TRUCK-AT ?auto_14143 ?auto_14142 ) ( not ( = ?auto_14142 ?auto_14140 ) ) ( HOIST-AT ?auto_14139 ?auto_14142 ) ( LIFTING ?auto_14139 ?auto_14138 ) ( not ( = ?auto_14141 ?auto_14139 ) ) ( ON ?auto_14135 ?auto_14134 ) ( ON ?auto_14136 ?auto_14135 ) ( ON ?auto_14133 ?auto_14136 ) ( not ( = ?auto_14134 ?auto_14135 ) ) ( not ( = ?auto_14134 ?auto_14136 ) ) ( not ( = ?auto_14134 ?auto_14133 ) ) ( not ( = ?auto_14134 ?auto_14137 ) ) ( not ( = ?auto_14134 ?auto_14138 ) ) ( not ( = ?auto_14135 ?auto_14136 ) ) ( not ( = ?auto_14135 ?auto_14133 ) ) ( not ( = ?auto_14135 ?auto_14137 ) ) ( not ( = ?auto_14135 ?auto_14138 ) ) ( not ( = ?auto_14136 ?auto_14133 ) ) ( not ( = ?auto_14136 ?auto_14137 ) ) ( not ( = ?auto_14136 ?auto_14138 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_14133 ?auto_14137 ?auto_14138 )
      ( MAKE-5CRATE-VERIFY ?auto_14134 ?auto_14135 ?auto_14136 ?auto_14133 ?auto_14137 ?auto_14138 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_14184 - SURFACE
      ?auto_14185 - SURFACE
      ?auto_14186 - SURFACE
      ?auto_14183 - SURFACE
      ?auto_14187 - SURFACE
      ?auto_14188 - SURFACE
    )
    :vars
    (
      ?auto_14189 - HOIST
      ?auto_14191 - PLACE
      ?auto_14190 - TRUCK
      ?auto_14193 - PLACE
      ?auto_14192 - HOIST
      ?auto_14194 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14189 ?auto_14191 ) ( SURFACE-AT ?auto_14187 ?auto_14191 ) ( CLEAR ?auto_14187 ) ( IS-CRATE ?auto_14188 ) ( not ( = ?auto_14187 ?auto_14188 ) ) ( AVAILABLE ?auto_14189 ) ( ON ?auto_14187 ?auto_14183 ) ( not ( = ?auto_14183 ?auto_14187 ) ) ( not ( = ?auto_14183 ?auto_14188 ) ) ( TRUCK-AT ?auto_14190 ?auto_14193 ) ( not ( = ?auto_14193 ?auto_14191 ) ) ( HOIST-AT ?auto_14192 ?auto_14193 ) ( not ( = ?auto_14189 ?auto_14192 ) ) ( AVAILABLE ?auto_14192 ) ( SURFACE-AT ?auto_14188 ?auto_14193 ) ( ON ?auto_14188 ?auto_14194 ) ( CLEAR ?auto_14188 ) ( not ( = ?auto_14187 ?auto_14194 ) ) ( not ( = ?auto_14188 ?auto_14194 ) ) ( not ( = ?auto_14183 ?auto_14194 ) ) ( ON ?auto_14185 ?auto_14184 ) ( ON ?auto_14186 ?auto_14185 ) ( ON ?auto_14183 ?auto_14186 ) ( not ( = ?auto_14184 ?auto_14185 ) ) ( not ( = ?auto_14184 ?auto_14186 ) ) ( not ( = ?auto_14184 ?auto_14183 ) ) ( not ( = ?auto_14184 ?auto_14187 ) ) ( not ( = ?auto_14184 ?auto_14188 ) ) ( not ( = ?auto_14184 ?auto_14194 ) ) ( not ( = ?auto_14185 ?auto_14186 ) ) ( not ( = ?auto_14185 ?auto_14183 ) ) ( not ( = ?auto_14185 ?auto_14187 ) ) ( not ( = ?auto_14185 ?auto_14188 ) ) ( not ( = ?auto_14185 ?auto_14194 ) ) ( not ( = ?auto_14186 ?auto_14183 ) ) ( not ( = ?auto_14186 ?auto_14187 ) ) ( not ( = ?auto_14186 ?auto_14188 ) ) ( not ( = ?auto_14186 ?auto_14194 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_14183 ?auto_14187 ?auto_14188 )
      ( MAKE-5CRATE-VERIFY ?auto_14184 ?auto_14185 ?auto_14186 ?auto_14183 ?auto_14187 ?auto_14188 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_14235 - SURFACE
      ?auto_14236 - SURFACE
      ?auto_14237 - SURFACE
      ?auto_14234 - SURFACE
      ?auto_14238 - SURFACE
      ?auto_14239 - SURFACE
    )
    :vars
    (
      ?auto_14240 - HOIST
      ?auto_14243 - PLACE
      ?auto_14244 - PLACE
      ?auto_14241 - HOIST
      ?auto_14245 - SURFACE
      ?auto_14242 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14240 ?auto_14243 ) ( SURFACE-AT ?auto_14238 ?auto_14243 ) ( CLEAR ?auto_14238 ) ( IS-CRATE ?auto_14239 ) ( not ( = ?auto_14238 ?auto_14239 ) ) ( AVAILABLE ?auto_14240 ) ( ON ?auto_14238 ?auto_14234 ) ( not ( = ?auto_14234 ?auto_14238 ) ) ( not ( = ?auto_14234 ?auto_14239 ) ) ( not ( = ?auto_14244 ?auto_14243 ) ) ( HOIST-AT ?auto_14241 ?auto_14244 ) ( not ( = ?auto_14240 ?auto_14241 ) ) ( AVAILABLE ?auto_14241 ) ( SURFACE-AT ?auto_14239 ?auto_14244 ) ( ON ?auto_14239 ?auto_14245 ) ( CLEAR ?auto_14239 ) ( not ( = ?auto_14238 ?auto_14245 ) ) ( not ( = ?auto_14239 ?auto_14245 ) ) ( not ( = ?auto_14234 ?auto_14245 ) ) ( TRUCK-AT ?auto_14242 ?auto_14243 ) ( ON ?auto_14236 ?auto_14235 ) ( ON ?auto_14237 ?auto_14236 ) ( ON ?auto_14234 ?auto_14237 ) ( not ( = ?auto_14235 ?auto_14236 ) ) ( not ( = ?auto_14235 ?auto_14237 ) ) ( not ( = ?auto_14235 ?auto_14234 ) ) ( not ( = ?auto_14235 ?auto_14238 ) ) ( not ( = ?auto_14235 ?auto_14239 ) ) ( not ( = ?auto_14235 ?auto_14245 ) ) ( not ( = ?auto_14236 ?auto_14237 ) ) ( not ( = ?auto_14236 ?auto_14234 ) ) ( not ( = ?auto_14236 ?auto_14238 ) ) ( not ( = ?auto_14236 ?auto_14239 ) ) ( not ( = ?auto_14236 ?auto_14245 ) ) ( not ( = ?auto_14237 ?auto_14234 ) ) ( not ( = ?auto_14237 ?auto_14238 ) ) ( not ( = ?auto_14237 ?auto_14239 ) ) ( not ( = ?auto_14237 ?auto_14245 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_14234 ?auto_14238 ?auto_14239 )
      ( MAKE-5CRATE-VERIFY ?auto_14235 ?auto_14236 ?auto_14237 ?auto_14234 ?auto_14238 ?auto_14239 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_14286 - SURFACE
      ?auto_14287 - SURFACE
      ?auto_14288 - SURFACE
      ?auto_14285 - SURFACE
      ?auto_14289 - SURFACE
      ?auto_14290 - SURFACE
    )
    :vars
    (
      ?auto_14296 - HOIST
      ?auto_14292 - PLACE
      ?auto_14293 - PLACE
      ?auto_14291 - HOIST
      ?auto_14295 - SURFACE
      ?auto_14294 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14296 ?auto_14292 ) ( IS-CRATE ?auto_14290 ) ( not ( = ?auto_14289 ?auto_14290 ) ) ( not ( = ?auto_14285 ?auto_14289 ) ) ( not ( = ?auto_14285 ?auto_14290 ) ) ( not ( = ?auto_14293 ?auto_14292 ) ) ( HOIST-AT ?auto_14291 ?auto_14293 ) ( not ( = ?auto_14296 ?auto_14291 ) ) ( AVAILABLE ?auto_14291 ) ( SURFACE-AT ?auto_14290 ?auto_14293 ) ( ON ?auto_14290 ?auto_14295 ) ( CLEAR ?auto_14290 ) ( not ( = ?auto_14289 ?auto_14295 ) ) ( not ( = ?auto_14290 ?auto_14295 ) ) ( not ( = ?auto_14285 ?auto_14295 ) ) ( TRUCK-AT ?auto_14294 ?auto_14292 ) ( SURFACE-AT ?auto_14285 ?auto_14292 ) ( CLEAR ?auto_14285 ) ( LIFTING ?auto_14296 ?auto_14289 ) ( IS-CRATE ?auto_14289 ) ( ON ?auto_14287 ?auto_14286 ) ( ON ?auto_14288 ?auto_14287 ) ( ON ?auto_14285 ?auto_14288 ) ( not ( = ?auto_14286 ?auto_14287 ) ) ( not ( = ?auto_14286 ?auto_14288 ) ) ( not ( = ?auto_14286 ?auto_14285 ) ) ( not ( = ?auto_14286 ?auto_14289 ) ) ( not ( = ?auto_14286 ?auto_14290 ) ) ( not ( = ?auto_14286 ?auto_14295 ) ) ( not ( = ?auto_14287 ?auto_14288 ) ) ( not ( = ?auto_14287 ?auto_14285 ) ) ( not ( = ?auto_14287 ?auto_14289 ) ) ( not ( = ?auto_14287 ?auto_14290 ) ) ( not ( = ?auto_14287 ?auto_14295 ) ) ( not ( = ?auto_14288 ?auto_14285 ) ) ( not ( = ?auto_14288 ?auto_14289 ) ) ( not ( = ?auto_14288 ?auto_14290 ) ) ( not ( = ?auto_14288 ?auto_14295 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_14285 ?auto_14289 ?auto_14290 )
      ( MAKE-5CRATE-VERIFY ?auto_14286 ?auto_14287 ?auto_14288 ?auto_14285 ?auto_14289 ?auto_14290 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_14337 - SURFACE
      ?auto_14338 - SURFACE
      ?auto_14339 - SURFACE
      ?auto_14336 - SURFACE
      ?auto_14340 - SURFACE
      ?auto_14341 - SURFACE
    )
    :vars
    (
      ?auto_14344 - HOIST
      ?auto_14346 - PLACE
      ?auto_14347 - PLACE
      ?auto_14345 - HOIST
      ?auto_14342 - SURFACE
      ?auto_14343 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14344 ?auto_14346 ) ( IS-CRATE ?auto_14341 ) ( not ( = ?auto_14340 ?auto_14341 ) ) ( not ( = ?auto_14336 ?auto_14340 ) ) ( not ( = ?auto_14336 ?auto_14341 ) ) ( not ( = ?auto_14347 ?auto_14346 ) ) ( HOIST-AT ?auto_14345 ?auto_14347 ) ( not ( = ?auto_14344 ?auto_14345 ) ) ( AVAILABLE ?auto_14345 ) ( SURFACE-AT ?auto_14341 ?auto_14347 ) ( ON ?auto_14341 ?auto_14342 ) ( CLEAR ?auto_14341 ) ( not ( = ?auto_14340 ?auto_14342 ) ) ( not ( = ?auto_14341 ?auto_14342 ) ) ( not ( = ?auto_14336 ?auto_14342 ) ) ( TRUCK-AT ?auto_14343 ?auto_14346 ) ( SURFACE-AT ?auto_14336 ?auto_14346 ) ( CLEAR ?auto_14336 ) ( IS-CRATE ?auto_14340 ) ( AVAILABLE ?auto_14344 ) ( IN ?auto_14340 ?auto_14343 ) ( ON ?auto_14338 ?auto_14337 ) ( ON ?auto_14339 ?auto_14338 ) ( ON ?auto_14336 ?auto_14339 ) ( not ( = ?auto_14337 ?auto_14338 ) ) ( not ( = ?auto_14337 ?auto_14339 ) ) ( not ( = ?auto_14337 ?auto_14336 ) ) ( not ( = ?auto_14337 ?auto_14340 ) ) ( not ( = ?auto_14337 ?auto_14341 ) ) ( not ( = ?auto_14337 ?auto_14342 ) ) ( not ( = ?auto_14338 ?auto_14339 ) ) ( not ( = ?auto_14338 ?auto_14336 ) ) ( not ( = ?auto_14338 ?auto_14340 ) ) ( not ( = ?auto_14338 ?auto_14341 ) ) ( not ( = ?auto_14338 ?auto_14342 ) ) ( not ( = ?auto_14339 ?auto_14336 ) ) ( not ( = ?auto_14339 ?auto_14340 ) ) ( not ( = ?auto_14339 ?auto_14341 ) ) ( not ( = ?auto_14339 ?auto_14342 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_14336 ?auto_14340 ?auto_14341 )
      ( MAKE-5CRATE-VERIFY ?auto_14337 ?auto_14338 ?auto_14339 ?auto_14336 ?auto_14340 ?auto_14341 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15328 - SURFACE
      ?auto_15329 - SURFACE
    )
    :vars
    (
      ?auto_15333 - HOIST
      ?auto_15332 - PLACE
      ?auto_15331 - SURFACE
      ?auto_15335 - PLACE
      ?auto_15334 - HOIST
      ?auto_15330 - SURFACE
      ?auto_15336 - TRUCK
      ?auto_15337 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15333 ?auto_15332 ) ( SURFACE-AT ?auto_15328 ?auto_15332 ) ( CLEAR ?auto_15328 ) ( IS-CRATE ?auto_15329 ) ( not ( = ?auto_15328 ?auto_15329 ) ) ( ON ?auto_15328 ?auto_15331 ) ( not ( = ?auto_15331 ?auto_15328 ) ) ( not ( = ?auto_15331 ?auto_15329 ) ) ( not ( = ?auto_15335 ?auto_15332 ) ) ( HOIST-AT ?auto_15334 ?auto_15335 ) ( not ( = ?auto_15333 ?auto_15334 ) ) ( AVAILABLE ?auto_15334 ) ( SURFACE-AT ?auto_15329 ?auto_15335 ) ( ON ?auto_15329 ?auto_15330 ) ( CLEAR ?auto_15329 ) ( not ( = ?auto_15328 ?auto_15330 ) ) ( not ( = ?auto_15329 ?auto_15330 ) ) ( not ( = ?auto_15331 ?auto_15330 ) ) ( TRUCK-AT ?auto_15336 ?auto_15332 ) ( LIFTING ?auto_15333 ?auto_15337 ) ( IS-CRATE ?auto_15337 ) ( not ( = ?auto_15328 ?auto_15337 ) ) ( not ( = ?auto_15329 ?auto_15337 ) ) ( not ( = ?auto_15331 ?auto_15337 ) ) ( not ( = ?auto_15330 ?auto_15337 ) ) )
    :subtasks
    ( ( !LOAD ?auto_15333 ?auto_15337 ?auto_15336 ?auto_15332 )
      ( MAKE-1CRATE ?auto_15328 ?auto_15329 )
      ( MAKE-1CRATE-VERIFY ?auto_15328 ?auto_15329 ) )
  )

)

