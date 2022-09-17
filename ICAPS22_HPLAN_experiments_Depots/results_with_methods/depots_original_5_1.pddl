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
      ?auto_6419 - SURFACE
      ?auto_6420 - SURFACE
    )
    :vars
    (
      ?auto_6421 - HOIST
      ?auto_6422 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6421 ?auto_6422 ) ( SURFACE-AT ?auto_6420 ?auto_6422 ) ( CLEAR ?auto_6420 ) ( LIFTING ?auto_6421 ?auto_6419 ) ( IS-CRATE ?auto_6419 ) ( not ( = ?auto_6419 ?auto_6420 ) ) )
    :subtasks
    ( ( !DROP ?auto_6421 ?auto_6419 ?auto_6420 ?auto_6422 )
      ( MAKE-ON-VERIFY ?auto_6419 ?auto_6420 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_6423 - SURFACE
      ?auto_6424 - SURFACE
    )
    :vars
    (
      ?auto_6425 - HOIST
      ?auto_6426 - PLACE
      ?auto_6427 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6425 ?auto_6426 ) ( SURFACE-AT ?auto_6424 ?auto_6426 ) ( CLEAR ?auto_6424 ) ( IS-CRATE ?auto_6423 ) ( not ( = ?auto_6423 ?auto_6424 ) ) ( TRUCK-AT ?auto_6427 ?auto_6426 ) ( AVAILABLE ?auto_6425 ) ( IN ?auto_6423 ?auto_6427 ) )
    :subtasks
    ( ( !UNLOAD ?auto_6425 ?auto_6423 ?auto_6427 ?auto_6426 )
      ( MAKE-ON ?auto_6423 ?auto_6424 )
      ( MAKE-ON-VERIFY ?auto_6423 ?auto_6424 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_6428 - SURFACE
      ?auto_6429 - SURFACE
    )
    :vars
    (
      ?auto_6431 - HOIST
      ?auto_6430 - PLACE
      ?auto_6432 - TRUCK
      ?auto_6433 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6431 ?auto_6430 ) ( SURFACE-AT ?auto_6429 ?auto_6430 ) ( CLEAR ?auto_6429 ) ( IS-CRATE ?auto_6428 ) ( not ( = ?auto_6428 ?auto_6429 ) ) ( AVAILABLE ?auto_6431 ) ( IN ?auto_6428 ?auto_6432 ) ( TRUCK-AT ?auto_6432 ?auto_6433 ) ( not ( = ?auto_6433 ?auto_6430 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_6432 ?auto_6433 ?auto_6430 )
      ( MAKE-ON ?auto_6428 ?auto_6429 )
      ( MAKE-ON-VERIFY ?auto_6428 ?auto_6429 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_6434 - SURFACE
      ?auto_6435 - SURFACE
    )
    :vars
    (
      ?auto_6437 - HOIST
      ?auto_6438 - PLACE
      ?auto_6439 - TRUCK
      ?auto_6436 - PLACE
      ?auto_6440 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_6437 ?auto_6438 ) ( SURFACE-AT ?auto_6435 ?auto_6438 ) ( CLEAR ?auto_6435 ) ( IS-CRATE ?auto_6434 ) ( not ( = ?auto_6434 ?auto_6435 ) ) ( AVAILABLE ?auto_6437 ) ( TRUCK-AT ?auto_6439 ?auto_6436 ) ( not ( = ?auto_6436 ?auto_6438 ) ) ( HOIST-AT ?auto_6440 ?auto_6436 ) ( LIFTING ?auto_6440 ?auto_6434 ) ( not ( = ?auto_6437 ?auto_6440 ) ) )
    :subtasks
    ( ( !LOAD ?auto_6440 ?auto_6434 ?auto_6439 ?auto_6436 )
      ( MAKE-ON ?auto_6434 ?auto_6435 )
      ( MAKE-ON-VERIFY ?auto_6434 ?auto_6435 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_6441 - SURFACE
      ?auto_6442 - SURFACE
    )
    :vars
    (
      ?auto_6447 - HOIST
      ?auto_6445 - PLACE
      ?auto_6444 - TRUCK
      ?auto_6446 - PLACE
      ?auto_6443 - HOIST
      ?auto_6448 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6447 ?auto_6445 ) ( SURFACE-AT ?auto_6442 ?auto_6445 ) ( CLEAR ?auto_6442 ) ( IS-CRATE ?auto_6441 ) ( not ( = ?auto_6441 ?auto_6442 ) ) ( AVAILABLE ?auto_6447 ) ( TRUCK-AT ?auto_6444 ?auto_6446 ) ( not ( = ?auto_6446 ?auto_6445 ) ) ( HOIST-AT ?auto_6443 ?auto_6446 ) ( not ( = ?auto_6447 ?auto_6443 ) ) ( AVAILABLE ?auto_6443 ) ( SURFACE-AT ?auto_6441 ?auto_6446 ) ( ON ?auto_6441 ?auto_6448 ) ( CLEAR ?auto_6441 ) ( not ( = ?auto_6441 ?auto_6448 ) ) ( not ( = ?auto_6442 ?auto_6448 ) ) )
    :subtasks
    ( ( !LIFT ?auto_6443 ?auto_6441 ?auto_6448 ?auto_6446 )
      ( MAKE-ON ?auto_6441 ?auto_6442 )
      ( MAKE-ON-VERIFY ?auto_6441 ?auto_6442 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_6449 - SURFACE
      ?auto_6450 - SURFACE
    )
    :vars
    (
      ?auto_6454 - HOIST
      ?auto_6456 - PLACE
      ?auto_6451 - PLACE
      ?auto_6452 - HOIST
      ?auto_6453 - SURFACE
      ?auto_6455 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6454 ?auto_6456 ) ( SURFACE-AT ?auto_6450 ?auto_6456 ) ( CLEAR ?auto_6450 ) ( IS-CRATE ?auto_6449 ) ( not ( = ?auto_6449 ?auto_6450 ) ) ( AVAILABLE ?auto_6454 ) ( not ( = ?auto_6451 ?auto_6456 ) ) ( HOIST-AT ?auto_6452 ?auto_6451 ) ( not ( = ?auto_6454 ?auto_6452 ) ) ( AVAILABLE ?auto_6452 ) ( SURFACE-AT ?auto_6449 ?auto_6451 ) ( ON ?auto_6449 ?auto_6453 ) ( CLEAR ?auto_6449 ) ( not ( = ?auto_6449 ?auto_6453 ) ) ( not ( = ?auto_6450 ?auto_6453 ) ) ( TRUCK-AT ?auto_6455 ?auto_6456 ) )
    :subtasks
    ( ( !DRIVE ?auto_6455 ?auto_6456 ?auto_6451 )
      ( MAKE-ON ?auto_6449 ?auto_6450 )
      ( MAKE-ON-VERIFY ?auto_6449 ?auto_6450 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_6459 - SURFACE
      ?auto_6460 - SURFACE
    )
    :vars
    (
      ?auto_6461 - HOIST
      ?auto_6462 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6461 ?auto_6462 ) ( SURFACE-AT ?auto_6460 ?auto_6462 ) ( CLEAR ?auto_6460 ) ( LIFTING ?auto_6461 ?auto_6459 ) ( IS-CRATE ?auto_6459 ) ( not ( = ?auto_6459 ?auto_6460 ) ) )
    :subtasks
    ( ( !DROP ?auto_6461 ?auto_6459 ?auto_6460 ?auto_6462 )
      ( MAKE-ON-VERIFY ?auto_6459 ?auto_6460 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_6463 - SURFACE
      ?auto_6464 - SURFACE
    )
    :vars
    (
      ?auto_6466 - HOIST
      ?auto_6465 - PLACE
      ?auto_6467 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6466 ?auto_6465 ) ( SURFACE-AT ?auto_6464 ?auto_6465 ) ( CLEAR ?auto_6464 ) ( IS-CRATE ?auto_6463 ) ( not ( = ?auto_6463 ?auto_6464 ) ) ( TRUCK-AT ?auto_6467 ?auto_6465 ) ( AVAILABLE ?auto_6466 ) ( IN ?auto_6463 ?auto_6467 ) )
    :subtasks
    ( ( !UNLOAD ?auto_6466 ?auto_6463 ?auto_6467 ?auto_6465 )
      ( MAKE-ON ?auto_6463 ?auto_6464 )
      ( MAKE-ON-VERIFY ?auto_6463 ?auto_6464 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_6468 - SURFACE
      ?auto_6469 - SURFACE
    )
    :vars
    (
      ?auto_6470 - HOIST
      ?auto_6472 - PLACE
      ?auto_6471 - TRUCK
      ?auto_6473 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6470 ?auto_6472 ) ( SURFACE-AT ?auto_6469 ?auto_6472 ) ( CLEAR ?auto_6469 ) ( IS-CRATE ?auto_6468 ) ( not ( = ?auto_6468 ?auto_6469 ) ) ( AVAILABLE ?auto_6470 ) ( IN ?auto_6468 ?auto_6471 ) ( TRUCK-AT ?auto_6471 ?auto_6473 ) ( not ( = ?auto_6473 ?auto_6472 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_6471 ?auto_6473 ?auto_6472 )
      ( MAKE-ON ?auto_6468 ?auto_6469 )
      ( MAKE-ON-VERIFY ?auto_6468 ?auto_6469 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_6474 - SURFACE
      ?auto_6475 - SURFACE
    )
    :vars
    (
      ?auto_6476 - HOIST
      ?auto_6477 - PLACE
      ?auto_6478 - TRUCK
      ?auto_6479 - PLACE
      ?auto_6480 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_6476 ?auto_6477 ) ( SURFACE-AT ?auto_6475 ?auto_6477 ) ( CLEAR ?auto_6475 ) ( IS-CRATE ?auto_6474 ) ( not ( = ?auto_6474 ?auto_6475 ) ) ( AVAILABLE ?auto_6476 ) ( TRUCK-AT ?auto_6478 ?auto_6479 ) ( not ( = ?auto_6479 ?auto_6477 ) ) ( HOIST-AT ?auto_6480 ?auto_6479 ) ( LIFTING ?auto_6480 ?auto_6474 ) ( not ( = ?auto_6476 ?auto_6480 ) ) )
    :subtasks
    ( ( !LOAD ?auto_6480 ?auto_6474 ?auto_6478 ?auto_6479 )
      ( MAKE-ON ?auto_6474 ?auto_6475 )
      ( MAKE-ON-VERIFY ?auto_6474 ?auto_6475 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_6481 - SURFACE
      ?auto_6482 - SURFACE
    )
    :vars
    (
      ?auto_6484 - HOIST
      ?auto_6486 - PLACE
      ?auto_6483 - TRUCK
      ?auto_6485 - PLACE
      ?auto_6487 - HOIST
      ?auto_6488 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6484 ?auto_6486 ) ( SURFACE-AT ?auto_6482 ?auto_6486 ) ( CLEAR ?auto_6482 ) ( IS-CRATE ?auto_6481 ) ( not ( = ?auto_6481 ?auto_6482 ) ) ( AVAILABLE ?auto_6484 ) ( TRUCK-AT ?auto_6483 ?auto_6485 ) ( not ( = ?auto_6485 ?auto_6486 ) ) ( HOIST-AT ?auto_6487 ?auto_6485 ) ( not ( = ?auto_6484 ?auto_6487 ) ) ( AVAILABLE ?auto_6487 ) ( SURFACE-AT ?auto_6481 ?auto_6485 ) ( ON ?auto_6481 ?auto_6488 ) ( CLEAR ?auto_6481 ) ( not ( = ?auto_6481 ?auto_6488 ) ) ( not ( = ?auto_6482 ?auto_6488 ) ) )
    :subtasks
    ( ( !LIFT ?auto_6487 ?auto_6481 ?auto_6488 ?auto_6485 )
      ( MAKE-ON ?auto_6481 ?auto_6482 )
      ( MAKE-ON-VERIFY ?auto_6481 ?auto_6482 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_6489 - SURFACE
      ?auto_6490 - SURFACE
    )
    :vars
    (
      ?auto_6493 - HOIST
      ?auto_6494 - PLACE
      ?auto_6492 - PLACE
      ?auto_6495 - HOIST
      ?auto_6491 - SURFACE
      ?auto_6496 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6493 ?auto_6494 ) ( SURFACE-AT ?auto_6490 ?auto_6494 ) ( CLEAR ?auto_6490 ) ( IS-CRATE ?auto_6489 ) ( not ( = ?auto_6489 ?auto_6490 ) ) ( AVAILABLE ?auto_6493 ) ( not ( = ?auto_6492 ?auto_6494 ) ) ( HOIST-AT ?auto_6495 ?auto_6492 ) ( not ( = ?auto_6493 ?auto_6495 ) ) ( AVAILABLE ?auto_6495 ) ( SURFACE-AT ?auto_6489 ?auto_6492 ) ( ON ?auto_6489 ?auto_6491 ) ( CLEAR ?auto_6489 ) ( not ( = ?auto_6489 ?auto_6491 ) ) ( not ( = ?auto_6490 ?auto_6491 ) ) ( TRUCK-AT ?auto_6496 ?auto_6494 ) )
    :subtasks
    ( ( !DRIVE ?auto_6496 ?auto_6494 ?auto_6492 )
      ( MAKE-ON ?auto_6489 ?auto_6490 )
      ( MAKE-ON-VERIFY ?auto_6489 ?auto_6490 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_6497 - SURFACE
      ?auto_6498 - SURFACE
    )
    :vars
    (
      ?auto_6502 - HOIST
      ?auto_6503 - PLACE
      ?auto_6500 - PLACE
      ?auto_6499 - HOIST
      ?auto_6504 - SURFACE
      ?auto_6501 - TRUCK
      ?auto_6505 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6502 ?auto_6503 ) ( IS-CRATE ?auto_6497 ) ( not ( = ?auto_6497 ?auto_6498 ) ) ( not ( = ?auto_6500 ?auto_6503 ) ) ( HOIST-AT ?auto_6499 ?auto_6500 ) ( not ( = ?auto_6502 ?auto_6499 ) ) ( AVAILABLE ?auto_6499 ) ( SURFACE-AT ?auto_6497 ?auto_6500 ) ( ON ?auto_6497 ?auto_6504 ) ( CLEAR ?auto_6497 ) ( not ( = ?auto_6497 ?auto_6504 ) ) ( not ( = ?auto_6498 ?auto_6504 ) ) ( TRUCK-AT ?auto_6501 ?auto_6503 ) ( SURFACE-AT ?auto_6505 ?auto_6503 ) ( CLEAR ?auto_6505 ) ( LIFTING ?auto_6502 ?auto_6498 ) ( IS-CRATE ?auto_6498 ) ( not ( = ?auto_6497 ?auto_6505 ) ) ( not ( = ?auto_6498 ?auto_6505 ) ) ( not ( = ?auto_6504 ?auto_6505 ) ) )
    :subtasks
    ( ( !DROP ?auto_6502 ?auto_6498 ?auto_6505 ?auto_6503 )
      ( MAKE-ON ?auto_6497 ?auto_6498 )
      ( MAKE-ON-VERIFY ?auto_6497 ?auto_6498 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_6506 - SURFACE
      ?auto_6507 - SURFACE
    )
    :vars
    (
      ?auto_6508 - HOIST
      ?auto_6509 - PLACE
      ?auto_6510 - PLACE
      ?auto_6513 - HOIST
      ?auto_6511 - SURFACE
      ?auto_6512 - TRUCK
      ?auto_6514 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6508 ?auto_6509 ) ( IS-CRATE ?auto_6506 ) ( not ( = ?auto_6506 ?auto_6507 ) ) ( not ( = ?auto_6510 ?auto_6509 ) ) ( HOIST-AT ?auto_6513 ?auto_6510 ) ( not ( = ?auto_6508 ?auto_6513 ) ) ( AVAILABLE ?auto_6513 ) ( SURFACE-AT ?auto_6506 ?auto_6510 ) ( ON ?auto_6506 ?auto_6511 ) ( CLEAR ?auto_6506 ) ( not ( = ?auto_6506 ?auto_6511 ) ) ( not ( = ?auto_6507 ?auto_6511 ) ) ( TRUCK-AT ?auto_6512 ?auto_6509 ) ( SURFACE-AT ?auto_6514 ?auto_6509 ) ( CLEAR ?auto_6514 ) ( IS-CRATE ?auto_6507 ) ( not ( = ?auto_6506 ?auto_6514 ) ) ( not ( = ?auto_6507 ?auto_6514 ) ) ( not ( = ?auto_6511 ?auto_6514 ) ) ( AVAILABLE ?auto_6508 ) ( IN ?auto_6507 ?auto_6512 ) )
    :subtasks
    ( ( !UNLOAD ?auto_6508 ?auto_6507 ?auto_6512 ?auto_6509 )
      ( MAKE-ON ?auto_6506 ?auto_6507 )
      ( MAKE-ON-VERIFY ?auto_6506 ?auto_6507 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_6515 - SURFACE
      ?auto_6516 - SURFACE
    )
    :vars
    (
      ?auto_6519 - HOIST
      ?auto_6521 - PLACE
      ?auto_6522 - PLACE
      ?auto_6520 - HOIST
      ?auto_6518 - SURFACE
      ?auto_6523 - SURFACE
      ?auto_6517 - TRUCK
      ?auto_6524 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6519 ?auto_6521 ) ( IS-CRATE ?auto_6515 ) ( not ( = ?auto_6515 ?auto_6516 ) ) ( not ( = ?auto_6522 ?auto_6521 ) ) ( HOIST-AT ?auto_6520 ?auto_6522 ) ( not ( = ?auto_6519 ?auto_6520 ) ) ( AVAILABLE ?auto_6520 ) ( SURFACE-AT ?auto_6515 ?auto_6522 ) ( ON ?auto_6515 ?auto_6518 ) ( CLEAR ?auto_6515 ) ( not ( = ?auto_6515 ?auto_6518 ) ) ( not ( = ?auto_6516 ?auto_6518 ) ) ( SURFACE-AT ?auto_6523 ?auto_6521 ) ( CLEAR ?auto_6523 ) ( IS-CRATE ?auto_6516 ) ( not ( = ?auto_6515 ?auto_6523 ) ) ( not ( = ?auto_6516 ?auto_6523 ) ) ( not ( = ?auto_6518 ?auto_6523 ) ) ( AVAILABLE ?auto_6519 ) ( IN ?auto_6516 ?auto_6517 ) ( TRUCK-AT ?auto_6517 ?auto_6524 ) ( not ( = ?auto_6524 ?auto_6521 ) ) ( not ( = ?auto_6522 ?auto_6524 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_6517 ?auto_6524 ?auto_6521 )
      ( MAKE-ON ?auto_6515 ?auto_6516 )
      ( MAKE-ON-VERIFY ?auto_6515 ?auto_6516 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_6525 - SURFACE
      ?auto_6526 - SURFACE
    )
    :vars
    (
      ?auto_6530 - HOIST
      ?auto_6528 - PLACE
      ?auto_6532 - PLACE
      ?auto_6533 - HOIST
      ?auto_6527 - SURFACE
      ?auto_6529 - SURFACE
      ?auto_6534 - TRUCK
      ?auto_6531 - PLACE
      ?auto_6535 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_6530 ?auto_6528 ) ( IS-CRATE ?auto_6525 ) ( not ( = ?auto_6525 ?auto_6526 ) ) ( not ( = ?auto_6532 ?auto_6528 ) ) ( HOIST-AT ?auto_6533 ?auto_6532 ) ( not ( = ?auto_6530 ?auto_6533 ) ) ( AVAILABLE ?auto_6533 ) ( SURFACE-AT ?auto_6525 ?auto_6532 ) ( ON ?auto_6525 ?auto_6527 ) ( CLEAR ?auto_6525 ) ( not ( = ?auto_6525 ?auto_6527 ) ) ( not ( = ?auto_6526 ?auto_6527 ) ) ( SURFACE-AT ?auto_6529 ?auto_6528 ) ( CLEAR ?auto_6529 ) ( IS-CRATE ?auto_6526 ) ( not ( = ?auto_6525 ?auto_6529 ) ) ( not ( = ?auto_6526 ?auto_6529 ) ) ( not ( = ?auto_6527 ?auto_6529 ) ) ( AVAILABLE ?auto_6530 ) ( TRUCK-AT ?auto_6534 ?auto_6531 ) ( not ( = ?auto_6531 ?auto_6528 ) ) ( not ( = ?auto_6532 ?auto_6531 ) ) ( HOIST-AT ?auto_6535 ?auto_6531 ) ( LIFTING ?auto_6535 ?auto_6526 ) ( not ( = ?auto_6530 ?auto_6535 ) ) ( not ( = ?auto_6533 ?auto_6535 ) ) )
    :subtasks
    ( ( !LOAD ?auto_6535 ?auto_6526 ?auto_6534 ?auto_6531 )
      ( MAKE-ON ?auto_6525 ?auto_6526 )
      ( MAKE-ON-VERIFY ?auto_6525 ?auto_6526 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_6536 - SURFACE
      ?auto_6537 - SURFACE
    )
    :vars
    (
      ?auto_6544 - HOIST
      ?auto_6541 - PLACE
      ?auto_6539 - PLACE
      ?auto_6540 - HOIST
      ?auto_6543 - SURFACE
      ?auto_6542 - SURFACE
      ?auto_6545 - TRUCK
      ?auto_6538 - PLACE
      ?auto_6546 - HOIST
      ?auto_6547 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6544 ?auto_6541 ) ( IS-CRATE ?auto_6536 ) ( not ( = ?auto_6536 ?auto_6537 ) ) ( not ( = ?auto_6539 ?auto_6541 ) ) ( HOIST-AT ?auto_6540 ?auto_6539 ) ( not ( = ?auto_6544 ?auto_6540 ) ) ( AVAILABLE ?auto_6540 ) ( SURFACE-AT ?auto_6536 ?auto_6539 ) ( ON ?auto_6536 ?auto_6543 ) ( CLEAR ?auto_6536 ) ( not ( = ?auto_6536 ?auto_6543 ) ) ( not ( = ?auto_6537 ?auto_6543 ) ) ( SURFACE-AT ?auto_6542 ?auto_6541 ) ( CLEAR ?auto_6542 ) ( IS-CRATE ?auto_6537 ) ( not ( = ?auto_6536 ?auto_6542 ) ) ( not ( = ?auto_6537 ?auto_6542 ) ) ( not ( = ?auto_6543 ?auto_6542 ) ) ( AVAILABLE ?auto_6544 ) ( TRUCK-AT ?auto_6545 ?auto_6538 ) ( not ( = ?auto_6538 ?auto_6541 ) ) ( not ( = ?auto_6539 ?auto_6538 ) ) ( HOIST-AT ?auto_6546 ?auto_6538 ) ( not ( = ?auto_6544 ?auto_6546 ) ) ( not ( = ?auto_6540 ?auto_6546 ) ) ( AVAILABLE ?auto_6546 ) ( SURFACE-AT ?auto_6537 ?auto_6538 ) ( ON ?auto_6537 ?auto_6547 ) ( CLEAR ?auto_6537 ) ( not ( = ?auto_6536 ?auto_6547 ) ) ( not ( = ?auto_6537 ?auto_6547 ) ) ( not ( = ?auto_6543 ?auto_6547 ) ) ( not ( = ?auto_6542 ?auto_6547 ) ) )
    :subtasks
    ( ( !LIFT ?auto_6546 ?auto_6537 ?auto_6547 ?auto_6538 )
      ( MAKE-ON ?auto_6536 ?auto_6537 )
      ( MAKE-ON-VERIFY ?auto_6536 ?auto_6537 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_6548 - SURFACE
      ?auto_6549 - SURFACE
    )
    :vars
    (
      ?auto_6553 - HOIST
      ?auto_6558 - PLACE
      ?auto_6559 - PLACE
      ?auto_6555 - HOIST
      ?auto_6554 - SURFACE
      ?auto_6552 - SURFACE
      ?auto_6550 - PLACE
      ?auto_6557 - HOIST
      ?auto_6551 - SURFACE
      ?auto_6556 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6553 ?auto_6558 ) ( IS-CRATE ?auto_6548 ) ( not ( = ?auto_6548 ?auto_6549 ) ) ( not ( = ?auto_6559 ?auto_6558 ) ) ( HOIST-AT ?auto_6555 ?auto_6559 ) ( not ( = ?auto_6553 ?auto_6555 ) ) ( AVAILABLE ?auto_6555 ) ( SURFACE-AT ?auto_6548 ?auto_6559 ) ( ON ?auto_6548 ?auto_6554 ) ( CLEAR ?auto_6548 ) ( not ( = ?auto_6548 ?auto_6554 ) ) ( not ( = ?auto_6549 ?auto_6554 ) ) ( SURFACE-AT ?auto_6552 ?auto_6558 ) ( CLEAR ?auto_6552 ) ( IS-CRATE ?auto_6549 ) ( not ( = ?auto_6548 ?auto_6552 ) ) ( not ( = ?auto_6549 ?auto_6552 ) ) ( not ( = ?auto_6554 ?auto_6552 ) ) ( AVAILABLE ?auto_6553 ) ( not ( = ?auto_6550 ?auto_6558 ) ) ( not ( = ?auto_6559 ?auto_6550 ) ) ( HOIST-AT ?auto_6557 ?auto_6550 ) ( not ( = ?auto_6553 ?auto_6557 ) ) ( not ( = ?auto_6555 ?auto_6557 ) ) ( AVAILABLE ?auto_6557 ) ( SURFACE-AT ?auto_6549 ?auto_6550 ) ( ON ?auto_6549 ?auto_6551 ) ( CLEAR ?auto_6549 ) ( not ( = ?auto_6548 ?auto_6551 ) ) ( not ( = ?auto_6549 ?auto_6551 ) ) ( not ( = ?auto_6554 ?auto_6551 ) ) ( not ( = ?auto_6552 ?auto_6551 ) ) ( TRUCK-AT ?auto_6556 ?auto_6558 ) )
    :subtasks
    ( ( !DRIVE ?auto_6556 ?auto_6558 ?auto_6550 )
      ( MAKE-ON ?auto_6548 ?auto_6549 )
      ( MAKE-ON-VERIFY ?auto_6548 ?auto_6549 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_6562 - SURFACE
      ?auto_6563 - SURFACE
    )
    :vars
    (
      ?auto_6564 - HOIST
      ?auto_6565 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6564 ?auto_6565 ) ( SURFACE-AT ?auto_6563 ?auto_6565 ) ( CLEAR ?auto_6563 ) ( LIFTING ?auto_6564 ?auto_6562 ) ( IS-CRATE ?auto_6562 ) ( not ( = ?auto_6562 ?auto_6563 ) ) )
    :subtasks
    ( ( !DROP ?auto_6564 ?auto_6562 ?auto_6563 ?auto_6565 )
      ( MAKE-ON-VERIFY ?auto_6562 ?auto_6563 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_6566 - SURFACE
      ?auto_6567 - SURFACE
    )
    :vars
    (
      ?auto_6568 - HOIST
      ?auto_6569 - PLACE
      ?auto_6570 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6568 ?auto_6569 ) ( SURFACE-AT ?auto_6567 ?auto_6569 ) ( CLEAR ?auto_6567 ) ( IS-CRATE ?auto_6566 ) ( not ( = ?auto_6566 ?auto_6567 ) ) ( TRUCK-AT ?auto_6570 ?auto_6569 ) ( AVAILABLE ?auto_6568 ) ( IN ?auto_6566 ?auto_6570 ) )
    :subtasks
    ( ( !UNLOAD ?auto_6568 ?auto_6566 ?auto_6570 ?auto_6569 )
      ( MAKE-ON ?auto_6566 ?auto_6567 )
      ( MAKE-ON-VERIFY ?auto_6566 ?auto_6567 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_6571 - SURFACE
      ?auto_6572 - SURFACE
    )
    :vars
    (
      ?auto_6573 - HOIST
      ?auto_6574 - PLACE
      ?auto_6575 - TRUCK
      ?auto_6576 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6573 ?auto_6574 ) ( SURFACE-AT ?auto_6572 ?auto_6574 ) ( CLEAR ?auto_6572 ) ( IS-CRATE ?auto_6571 ) ( not ( = ?auto_6571 ?auto_6572 ) ) ( AVAILABLE ?auto_6573 ) ( IN ?auto_6571 ?auto_6575 ) ( TRUCK-AT ?auto_6575 ?auto_6576 ) ( not ( = ?auto_6576 ?auto_6574 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_6575 ?auto_6576 ?auto_6574 )
      ( MAKE-ON ?auto_6571 ?auto_6572 )
      ( MAKE-ON-VERIFY ?auto_6571 ?auto_6572 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_6577 - SURFACE
      ?auto_6578 - SURFACE
    )
    :vars
    (
      ?auto_6579 - HOIST
      ?auto_6582 - PLACE
      ?auto_6581 - TRUCK
      ?auto_6580 - PLACE
      ?auto_6583 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_6579 ?auto_6582 ) ( SURFACE-AT ?auto_6578 ?auto_6582 ) ( CLEAR ?auto_6578 ) ( IS-CRATE ?auto_6577 ) ( not ( = ?auto_6577 ?auto_6578 ) ) ( AVAILABLE ?auto_6579 ) ( TRUCK-AT ?auto_6581 ?auto_6580 ) ( not ( = ?auto_6580 ?auto_6582 ) ) ( HOIST-AT ?auto_6583 ?auto_6580 ) ( LIFTING ?auto_6583 ?auto_6577 ) ( not ( = ?auto_6579 ?auto_6583 ) ) )
    :subtasks
    ( ( !LOAD ?auto_6583 ?auto_6577 ?auto_6581 ?auto_6580 )
      ( MAKE-ON ?auto_6577 ?auto_6578 )
      ( MAKE-ON-VERIFY ?auto_6577 ?auto_6578 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_6584 - SURFACE
      ?auto_6585 - SURFACE
    )
    :vars
    (
      ?auto_6588 - HOIST
      ?auto_6586 - PLACE
      ?auto_6590 - TRUCK
      ?auto_6587 - PLACE
      ?auto_6589 - HOIST
      ?auto_6591 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6588 ?auto_6586 ) ( SURFACE-AT ?auto_6585 ?auto_6586 ) ( CLEAR ?auto_6585 ) ( IS-CRATE ?auto_6584 ) ( not ( = ?auto_6584 ?auto_6585 ) ) ( AVAILABLE ?auto_6588 ) ( TRUCK-AT ?auto_6590 ?auto_6587 ) ( not ( = ?auto_6587 ?auto_6586 ) ) ( HOIST-AT ?auto_6589 ?auto_6587 ) ( not ( = ?auto_6588 ?auto_6589 ) ) ( AVAILABLE ?auto_6589 ) ( SURFACE-AT ?auto_6584 ?auto_6587 ) ( ON ?auto_6584 ?auto_6591 ) ( CLEAR ?auto_6584 ) ( not ( = ?auto_6584 ?auto_6591 ) ) ( not ( = ?auto_6585 ?auto_6591 ) ) )
    :subtasks
    ( ( !LIFT ?auto_6589 ?auto_6584 ?auto_6591 ?auto_6587 )
      ( MAKE-ON ?auto_6584 ?auto_6585 )
      ( MAKE-ON-VERIFY ?auto_6584 ?auto_6585 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_6592 - SURFACE
      ?auto_6593 - SURFACE
    )
    :vars
    (
      ?auto_6599 - HOIST
      ?auto_6596 - PLACE
      ?auto_6595 - PLACE
      ?auto_6598 - HOIST
      ?auto_6597 - SURFACE
      ?auto_6594 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6599 ?auto_6596 ) ( SURFACE-AT ?auto_6593 ?auto_6596 ) ( CLEAR ?auto_6593 ) ( IS-CRATE ?auto_6592 ) ( not ( = ?auto_6592 ?auto_6593 ) ) ( AVAILABLE ?auto_6599 ) ( not ( = ?auto_6595 ?auto_6596 ) ) ( HOIST-AT ?auto_6598 ?auto_6595 ) ( not ( = ?auto_6599 ?auto_6598 ) ) ( AVAILABLE ?auto_6598 ) ( SURFACE-AT ?auto_6592 ?auto_6595 ) ( ON ?auto_6592 ?auto_6597 ) ( CLEAR ?auto_6592 ) ( not ( = ?auto_6592 ?auto_6597 ) ) ( not ( = ?auto_6593 ?auto_6597 ) ) ( TRUCK-AT ?auto_6594 ?auto_6596 ) )
    :subtasks
    ( ( !DRIVE ?auto_6594 ?auto_6596 ?auto_6595 )
      ( MAKE-ON ?auto_6592 ?auto_6593 )
      ( MAKE-ON-VERIFY ?auto_6592 ?auto_6593 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_6600 - SURFACE
      ?auto_6601 - SURFACE
    )
    :vars
    (
      ?auto_6603 - HOIST
      ?auto_6606 - PLACE
      ?auto_6605 - PLACE
      ?auto_6602 - HOIST
      ?auto_6604 - SURFACE
      ?auto_6607 - TRUCK
      ?auto_6608 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6603 ?auto_6606 ) ( IS-CRATE ?auto_6600 ) ( not ( = ?auto_6600 ?auto_6601 ) ) ( not ( = ?auto_6605 ?auto_6606 ) ) ( HOIST-AT ?auto_6602 ?auto_6605 ) ( not ( = ?auto_6603 ?auto_6602 ) ) ( AVAILABLE ?auto_6602 ) ( SURFACE-AT ?auto_6600 ?auto_6605 ) ( ON ?auto_6600 ?auto_6604 ) ( CLEAR ?auto_6600 ) ( not ( = ?auto_6600 ?auto_6604 ) ) ( not ( = ?auto_6601 ?auto_6604 ) ) ( TRUCK-AT ?auto_6607 ?auto_6606 ) ( SURFACE-AT ?auto_6608 ?auto_6606 ) ( CLEAR ?auto_6608 ) ( LIFTING ?auto_6603 ?auto_6601 ) ( IS-CRATE ?auto_6601 ) ( not ( = ?auto_6600 ?auto_6608 ) ) ( not ( = ?auto_6601 ?auto_6608 ) ) ( not ( = ?auto_6604 ?auto_6608 ) ) )
    :subtasks
    ( ( !DROP ?auto_6603 ?auto_6601 ?auto_6608 ?auto_6606 )
      ( MAKE-ON ?auto_6600 ?auto_6601 )
      ( MAKE-ON-VERIFY ?auto_6600 ?auto_6601 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_6609 - SURFACE
      ?auto_6610 - SURFACE
    )
    :vars
    (
      ?auto_6616 - HOIST
      ?auto_6612 - PLACE
      ?auto_6615 - PLACE
      ?auto_6613 - HOIST
      ?auto_6617 - SURFACE
      ?auto_6611 - TRUCK
      ?auto_6614 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6616 ?auto_6612 ) ( IS-CRATE ?auto_6609 ) ( not ( = ?auto_6609 ?auto_6610 ) ) ( not ( = ?auto_6615 ?auto_6612 ) ) ( HOIST-AT ?auto_6613 ?auto_6615 ) ( not ( = ?auto_6616 ?auto_6613 ) ) ( AVAILABLE ?auto_6613 ) ( SURFACE-AT ?auto_6609 ?auto_6615 ) ( ON ?auto_6609 ?auto_6617 ) ( CLEAR ?auto_6609 ) ( not ( = ?auto_6609 ?auto_6617 ) ) ( not ( = ?auto_6610 ?auto_6617 ) ) ( TRUCK-AT ?auto_6611 ?auto_6612 ) ( SURFACE-AT ?auto_6614 ?auto_6612 ) ( CLEAR ?auto_6614 ) ( IS-CRATE ?auto_6610 ) ( not ( = ?auto_6609 ?auto_6614 ) ) ( not ( = ?auto_6610 ?auto_6614 ) ) ( not ( = ?auto_6617 ?auto_6614 ) ) ( AVAILABLE ?auto_6616 ) ( IN ?auto_6610 ?auto_6611 ) )
    :subtasks
    ( ( !UNLOAD ?auto_6616 ?auto_6610 ?auto_6611 ?auto_6612 )
      ( MAKE-ON ?auto_6609 ?auto_6610 )
      ( MAKE-ON-VERIFY ?auto_6609 ?auto_6610 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_6618 - SURFACE
      ?auto_6619 - SURFACE
    )
    :vars
    (
      ?auto_6620 - HOIST
      ?auto_6626 - PLACE
      ?auto_6624 - PLACE
      ?auto_6623 - HOIST
      ?auto_6622 - SURFACE
      ?auto_6625 - SURFACE
      ?auto_6621 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6620 ?auto_6626 ) ( IS-CRATE ?auto_6618 ) ( not ( = ?auto_6618 ?auto_6619 ) ) ( not ( = ?auto_6624 ?auto_6626 ) ) ( HOIST-AT ?auto_6623 ?auto_6624 ) ( not ( = ?auto_6620 ?auto_6623 ) ) ( AVAILABLE ?auto_6623 ) ( SURFACE-AT ?auto_6618 ?auto_6624 ) ( ON ?auto_6618 ?auto_6622 ) ( CLEAR ?auto_6618 ) ( not ( = ?auto_6618 ?auto_6622 ) ) ( not ( = ?auto_6619 ?auto_6622 ) ) ( SURFACE-AT ?auto_6625 ?auto_6626 ) ( CLEAR ?auto_6625 ) ( IS-CRATE ?auto_6619 ) ( not ( = ?auto_6618 ?auto_6625 ) ) ( not ( = ?auto_6619 ?auto_6625 ) ) ( not ( = ?auto_6622 ?auto_6625 ) ) ( AVAILABLE ?auto_6620 ) ( IN ?auto_6619 ?auto_6621 ) ( TRUCK-AT ?auto_6621 ?auto_6624 ) )
    :subtasks
    ( ( !DRIVE ?auto_6621 ?auto_6624 ?auto_6626 )
      ( MAKE-ON ?auto_6618 ?auto_6619 )
      ( MAKE-ON-VERIFY ?auto_6618 ?auto_6619 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_6627 - SURFACE
      ?auto_6628 - SURFACE
    )
    :vars
    (
      ?auto_6635 - HOIST
      ?auto_6633 - PLACE
      ?auto_6631 - PLACE
      ?auto_6632 - HOIST
      ?auto_6629 - SURFACE
      ?auto_6634 - SURFACE
      ?auto_6630 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6635 ?auto_6633 ) ( IS-CRATE ?auto_6627 ) ( not ( = ?auto_6627 ?auto_6628 ) ) ( not ( = ?auto_6631 ?auto_6633 ) ) ( HOIST-AT ?auto_6632 ?auto_6631 ) ( not ( = ?auto_6635 ?auto_6632 ) ) ( SURFACE-AT ?auto_6627 ?auto_6631 ) ( ON ?auto_6627 ?auto_6629 ) ( CLEAR ?auto_6627 ) ( not ( = ?auto_6627 ?auto_6629 ) ) ( not ( = ?auto_6628 ?auto_6629 ) ) ( SURFACE-AT ?auto_6634 ?auto_6633 ) ( CLEAR ?auto_6634 ) ( IS-CRATE ?auto_6628 ) ( not ( = ?auto_6627 ?auto_6634 ) ) ( not ( = ?auto_6628 ?auto_6634 ) ) ( not ( = ?auto_6629 ?auto_6634 ) ) ( AVAILABLE ?auto_6635 ) ( TRUCK-AT ?auto_6630 ?auto_6631 ) ( LIFTING ?auto_6632 ?auto_6628 ) )
    :subtasks
    ( ( !LOAD ?auto_6632 ?auto_6628 ?auto_6630 ?auto_6631 )
      ( MAKE-ON ?auto_6627 ?auto_6628 )
      ( MAKE-ON-VERIFY ?auto_6627 ?auto_6628 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_6636 - SURFACE
      ?auto_6637 - SURFACE
    )
    :vars
    (
      ?auto_6644 - HOIST
      ?auto_6642 - PLACE
      ?auto_6641 - PLACE
      ?auto_6643 - HOIST
      ?auto_6640 - SURFACE
      ?auto_6639 - SURFACE
      ?auto_6638 - TRUCK
      ?auto_6645 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6644 ?auto_6642 ) ( IS-CRATE ?auto_6636 ) ( not ( = ?auto_6636 ?auto_6637 ) ) ( not ( = ?auto_6641 ?auto_6642 ) ) ( HOIST-AT ?auto_6643 ?auto_6641 ) ( not ( = ?auto_6644 ?auto_6643 ) ) ( SURFACE-AT ?auto_6636 ?auto_6641 ) ( ON ?auto_6636 ?auto_6640 ) ( CLEAR ?auto_6636 ) ( not ( = ?auto_6636 ?auto_6640 ) ) ( not ( = ?auto_6637 ?auto_6640 ) ) ( SURFACE-AT ?auto_6639 ?auto_6642 ) ( CLEAR ?auto_6639 ) ( IS-CRATE ?auto_6637 ) ( not ( = ?auto_6636 ?auto_6639 ) ) ( not ( = ?auto_6637 ?auto_6639 ) ) ( not ( = ?auto_6640 ?auto_6639 ) ) ( AVAILABLE ?auto_6644 ) ( TRUCK-AT ?auto_6638 ?auto_6641 ) ( AVAILABLE ?auto_6643 ) ( SURFACE-AT ?auto_6637 ?auto_6641 ) ( ON ?auto_6637 ?auto_6645 ) ( CLEAR ?auto_6637 ) ( not ( = ?auto_6636 ?auto_6645 ) ) ( not ( = ?auto_6637 ?auto_6645 ) ) ( not ( = ?auto_6640 ?auto_6645 ) ) ( not ( = ?auto_6639 ?auto_6645 ) ) )
    :subtasks
    ( ( !LIFT ?auto_6643 ?auto_6637 ?auto_6645 ?auto_6641 )
      ( MAKE-ON ?auto_6636 ?auto_6637 )
      ( MAKE-ON-VERIFY ?auto_6636 ?auto_6637 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_6646 - SURFACE
      ?auto_6647 - SURFACE
    )
    :vars
    (
      ?auto_6650 - HOIST
      ?auto_6653 - PLACE
      ?auto_6651 - PLACE
      ?auto_6649 - HOIST
      ?auto_6652 - SURFACE
      ?auto_6654 - SURFACE
      ?auto_6648 - SURFACE
      ?auto_6655 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6650 ?auto_6653 ) ( IS-CRATE ?auto_6646 ) ( not ( = ?auto_6646 ?auto_6647 ) ) ( not ( = ?auto_6651 ?auto_6653 ) ) ( HOIST-AT ?auto_6649 ?auto_6651 ) ( not ( = ?auto_6650 ?auto_6649 ) ) ( SURFACE-AT ?auto_6646 ?auto_6651 ) ( ON ?auto_6646 ?auto_6652 ) ( CLEAR ?auto_6646 ) ( not ( = ?auto_6646 ?auto_6652 ) ) ( not ( = ?auto_6647 ?auto_6652 ) ) ( SURFACE-AT ?auto_6654 ?auto_6653 ) ( CLEAR ?auto_6654 ) ( IS-CRATE ?auto_6647 ) ( not ( = ?auto_6646 ?auto_6654 ) ) ( not ( = ?auto_6647 ?auto_6654 ) ) ( not ( = ?auto_6652 ?auto_6654 ) ) ( AVAILABLE ?auto_6650 ) ( AVAILABLE ?auto_6649 ) ( SURFACE-AT ?auto_6647 ?auto_6651 ) ( ON ?auto_6647 ?auto_6648 ) ( CLEAR ?auto_6647 ) ( not ( = ?auto_6646 ?auto_6648 ) ) ( not ( = ?auto_6647 ?auto_6648 ) ) ( not ( = ?auto_6652 ?auto_6648 ) ) ( not ( = ?auto_6654 ?auto_6648 ) ) ( TRUCK-AT ?auto_6655 ?auto_6653 ) )
    :subtasks
    ( ( !DRIVE ?auto_6655 ?auto_6653 ?auto_6651 )
      ( MAKE-ON ?auto_6646 ?auto_6647 )
      ( MAKE-ON-VERIFY ?auto_6646 ?auto_6647 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_6656 - SURFACE
      ?auto_6657 - SURFACE
    )
    :vars
    (
      ?auto_6662 - HOIST
      ?auto_6664 - PLACE
      ?auto_6658 - PLACE
      ?auto_6659 - HOIST
      ?auto_6665 - SURFACE
      ?auto_6663 - SURFACE
      ?auto_6660 - SURFACE
      ?auto_6661 - TRUCK
      ?auto_6666 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6662 ?auto_6664 ) ( IS-CRATE ?auto_6656 ) ( not ( = ?auto_6656 ?auto_6657 ) ) ( not ( = ?auto_6658 ?auto_6664 ) ) ( HOIST-AT ?auto_6659 ?auto_6658 ) ( not ( = ?auto_6662 ?auto_6659 ) ) ( SURFACE-AT ?auto_6656 ?auto_6658 ) ( ON ?auto_6656 ?auto_6665 ) ( CLEAR ?auto_6656 ) ( not ( = ?auto_6656 ?auto_6665 ) ) ( not ( = ?auto_6657 ?auto_6665 ) ) ( IS-CRATE ?auto_6657 ) ( not ( = ?auto_6656 ?auto_6663 ) ) ( not ( = ?auto_6657 ?auto_6663 ) ) ( not ( = ?auto_6665 ?auto_6663 ) ) ( AVAILABLE ?auto_6659 ) ( SURFACE-AT ?auto_6657 ?auto_6658 ) ( ON ?auto_6657 ?auto_6660 ) ( CLEAR ?auto_6657 ) ( not ( = ?auto_6656 ?auto_6660 ) ) ( not ( = ?auto_6657 ?auto_6660 ) ) ( not ( = ?auto_6665 ?auto_6660 ) ) ( not ( = ?auto_6663 ?auto_6660 ) ) ( TRUCK-AT ?auto_6661 ?auto_6664 ) ( SURFACE-AT ?auto_6666 ?auto_6664 ) ( CLEAR ?auto_6666 ) ( LIFTING ?auto_6662 ?auto_6663 ) ( IS-CRATE ?auto_6663 ) ( not ( = ?auto_6656 ?auto_6666 ) ) ( not ( = ?auto_6657 ?auto_6666 ) ) ( not ( = ?auto_6665 ?auto_6666 ) ) ( not ( = ?auto_6663 ?auto_6666 ) ) ( not ( = ?auto_6660 ?auto_6666 ) ) )
    :subtasks
    ( ( !DROP ?auto_6662 ?auto_6663 ?auto_6666 ?auto_6664 )
      ( MAKE-ON ?auto_6656 ?auto_6657 )
      ( MAKE-ON-VERIFY ?auto_6656 ?auto_6657 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_6667 - SURFACE
      ?auto_6668 - SURFACE
    )
    :vars
    (
      ?auto_6675 - HOIST
      ?auto_6672 - PLACE
      ?auto_6677 - PLACE
      ?auto_6673 - HOIST
      ?auto_6670 - SURFACE
      ?auto_6674 - SURFACE
      ?auto_6671 - SURFACE
      ?auto_6676 - TRUCK
      ?auto_6669 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6675 ?auto_6672 ) ( IS-CRATE ?auto_6667 ) ( not ( = ?auto_6667 ?auto_6668 ) ) ( not ( = ?auto_6677 ?auto_6672 ) ) ( HOIST-AT ?auto_6673 ?auto_6677 ) ( not ( = ?auto_6675 ?auto_6673 ) ) ( SURFACE-AT ?auto_6667 ?auto_6677 ) ( ON ?auto_6667 ?auto_6670 ) ( CLEAR ?auto_6667 ) ( not ( = ?auto_6667 ?auto_6670 ) ) ( not ( = ?auto_6668 ?auto_6670 ) ) ( IS-CRATE ?auto_6668 ) ( not ( = ?auto_6667 ?auto_6674 ) ) ( not ( = ?auto_6668 ?auto_6674 ) ) ( not ( = ?auto_6670 ?auto_6674 ) ) ( AVAILABLE ?auto_6673 ) ( SURFACE-AT ?auto_6668 ?auto_6677 ) ( ON ?auto_6668 ?auto_6671 ) ( CLEAR ?auto_6668 ) ( not ( = ?auto_6667 ?auto_6671 ) ) ( not ( = ?auto_6668 ?auto_6671 ) ) ( not ( = ?auto_6670 ?auto_6671 ) ) ( not ( = ?auto_6674 ?auto_6671 ) ) ( TRUCK-AT ?auto_6676 ?auto_6672 ) ( SURFACE-AT ?auto_6669 ?auto_6672 ) ( CLEAR ?auto_6669 ) ( IS-CRATE ?auto_6674 ) ( not ( = ?auto_6667 ?auto_6669 ) ) ( not ( = ?auto_6668 ?auto_6669 ) ) ( not ( = ?auto_6670 ?auto_6669 ) ) ( not ( = ?auto_6674 ?auto_6669 ) ) ( not ( = ?auto_6671 ?auto_6669 ) ) ( AVAILABLE ?auto_6675 ) ( IN ?auto_6674 ?auto_6676 ) )
    :subtasks
    ( ( !UNLOAD ?auto_6675 ?auto_6674 ?auto_6676 ?auto_6672 )
      ( MAKE-ON ?auto_6667 ?auto_6668 )
      ( MAKE-ON-VERIFY ?auto_6667 ?auto_6668 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_6678 - SURFACE
      ?auto_6679 - SURFACE
    )
    :vars
    (
      ?auto_6685 - HOIST
      ?auto_6681 - PLACE
      ?auto_6684 - PLACE
      ?auto_6688 - HOIST
      ?auto_6680 - SURFACE
      ?auto_6682 - SURFACE
      ?auto_6683 - SURFACE
      ?auto_6687 - SURFACE
      ?auto_6686 - TRUCK
      ?auto_6689 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6685 ?auto_6681 ) ( IS-CRATE ?auto_6678 ) ( not ( = ?auto_6678 ?auto_6679 ) ) ( not ( = ?auto_6684 ?auto_6681 ) ) ( HOIST-AT ?auto_6688 ?auto_6684 ) ( not ( = ?auto_6685 ?auto_6688 ) ) ( SURFACE-AT ?auto_6678 ?auto_6684 ) ( ON ?auto_6678 ?auto_6680 ) ( CLEAR ?auto_6678 ) ( not ( = ?auto_6678 ?auto_6680 ) ) ( not ( = ?auto_6679 ?auto_6680 ) ) ( IS-CRATE ?auto_6679 ) ( not ( = ?auto_6678 ?auto_6682 ) ) ( not ( = ?auto_6679 ?auto_6682 ) ) ( not ( = ?auto_6680 ?auto_6682 ) ) ( AVAILABLE ?auto_6688 ) ( SURFACE-AT ?auto_6679 ?auto_6684 ) ( ON ?auto_6679 ?auto_6683 ) ( CLEAR ?auto_6679 ) ( not ( = ?auto_6678 ?auto_6683 ) ) ( not ( = ?auto_6679 ?auto_6683 ) ) ( not ( = ?auto_6680 ?auto_6683 ) ) ( not ( = ?auto_6682 ?auto_6683 ) ) ( SURFACE-AT ?auto_6687 ?auto_6681 ) ( CLEAR ?auto_6687 ) ( IS-CRATE ?auto_6682 ) ( not ( = ?auto_6678 ?auto_6687 ) ) ( not ( = ?auto_6679 ?auto_6687 ) ) ( not ( = ?auto_6680 ?auto_6687 ) ) ( not ( = ?auto_6682 ?auto_6687 ) ) ( not ( = ?auto_6683 ?auto_6687 ) ) ( AVAILABLE ?auto_6685 ) ( IN ?auto_6682 ?auto_6686 ) ( TRUCK-AT ?auto_6686 ?auto_6689 ) ( not ( = ?auto_6689 ?auto_6681 ) ) ( not ( = ?auto_6684 ?auto_6689 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_6686 ?auto_6689 ?auto_6681 )
      ( MAKE-ON ?auto_6678 ?auto_6679 )
      ( MAKE-ON-VERIFY ?auto_6678 ?auto_6679 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_6690 - SURFACE
      ?auto_6691 - SURFACE
    )
    :vars
    (
      ?auto_6698 - HOIST
      ?auto_6697 - PLACE
      ?auto_6693 - PLACE
      ?auto_6692 - HOIST
      ?auto_6699 - SURFACE
      ?auto_6695 - SURFACE
      ?auto_6696 - SURFACE
      ?auto_6700 - SURFACE
      ?auto_6701 - TRUCK
      ?auto_6694 - PLACE
      ?auto_6702 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_6698 ?auto_6697 ) ( IS-CRATE ?auto_6690 ) ( not ( = ?auto_6690 ?auto_6691 ) ) ( not ( = ?auto_6693 ?auto_6697 ) ) ( HOIST-AT ?auto_6692 ?auto_6693 ) ( not ( = ?auto_6698 ?auto_6692 ) ) ( SURFACE-AT ?auto_6690 ?auto_6693 ) ( ON ?auto_6690 ?auto_6699 ) ( CLEAR ?auto_6690 ) ( not ( = ?auto_6690 ?auto_6699 ) ) ( not ( = ?auto_6691 ?auto_6699 ) ) ( IS-CRATE ?auto_6691 ) ( not ( = ?auto_6690 ?auto_6695 ) ) ( not ( = ?auto_6691 ?auto_6695 ) ) ( not ( = ?auto_6699 ?auto_6695 ) ) ( AVAILABLE ?auto_6692 ) ( SURFACE-AT ?auto_6691 ?auto_6693 ) ( ON ?auto_6691 ?auto_6696 ) ( CLEAR ?auto_6691 ) ( not ( = ?auto_6690 ?auto_6696 ) ) ( not ( = ?auto_6691 ?auto_6696 ) ) ( not ( = ?auto_6699 ?auto_6696 ) ) ( not ( = ?auto_6695 ?auto_6696 ) ) ( SURFACE-AT ?auto_6700 ?auto_6697 ) ( CLEAR ?auto_6700 ) ( IS-CRATE ?auto_6695 ) ( not ( = ?auto_6690 ?auto_6700 ) ) ( not ( = ?auto_6691 ?auto_6700 ) ) ( not ( = ?auto_6699 ?auto_6700 ) ) ( not ( = ?auto_6695 ?auto_6700 ) ) ( not ( = ?auto_6696 ?auto_6700 ) ) ( AVAILABLE ?auto_6698 ) ( TRUCK-AT ?auto_6701 ?auto_6694 ) ( not ( = ?auto_6694 ?auto_6697 ) ) ( not ( = ?auto_6693 ?auto_6694 ) ) ( HOIST-AT ?auto_6702 ?auto_6694 ) ( LIFTING ?auto_6702 ?auto_6695 ) ( not ( = ?auto_6698 ?auto_6702 ) ) ( not ( = ?auto_6692 ?auto_6702 ) ) )
    :subtasks
    ( ( !LOAD ?auto_6702 ?auto_6695 ?auto_6701 ?auto_6694 )
      ( MAKE-ON ?auto_6690 ?auto_6691 )
      ( MAKE-ON-VERIFY ?auto_6690 ?auto_6691 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_6703 - SURFACE
      ?auto_6704 - SURFACE
    )
    :vars
    (
      ?auto_6709 - HOIST
      ?auto_6714 - PLACE
      ?auto_6712 - PLACE
      ?auto_6706 - HOIST
      ?auto_6708 - SURFACE
      ?auto_6713 - SURFACE
      ?auto_6711 - SURFACE
      ?auto_6710 - SURFACE
      ?auto_6715 - TRUCK
      ?auto_6707 - PLACE
      ?auto_6705 - HOIST
      ?auto_6716 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6709 ?auto_6714 ) ( IS-CRATE ?auto_6703 ) ( not ( = ?auto_6703 ?auto_6704 ) ) ( not ( = ?auto_6712 ?auto_6714 ) ) ( HOIST-AT ?auto_6706 ?auto_6712 ) ( not ( = ?auto_6709 ?auto_6706 ) ) ( SURFACE-AT ?auto_6703 ?auto_6712 ) ( ON ?auto_6703 ?auto_6708 ) ( CLEAR ?auto_6703 ) ( not ( = ?auto_6703 ?auto_6708 ) ) ( not ( = ?auto_6704 ?auto_6708 ) ) ( IS-CRATE ?auto_6704 ) ( not ( = ?auto_6703 ?auto_6713 ) ) ( not ( = ?auto_6704 ?auto_6713 ) ) ( not ( = ?auto_6708 ?auto_6713 ) ) ( AVAILABLE ?auto_6706 ) ( SURFACE-AT ?auto_6704 ?auto_6712 ) ( ON ?auto_6704 ?auto_6711 ) ( CLEAR ?auto_6704 ) ( not ( = ?auto_6703 ?auto_6711 ) ) ( not ( = ?auto_6704 ?auto_6711 ) ) ( not ( = ?auto_6708 ?auto_6711 ) ) ( not ( = ?auto_6713 ?auto_6711 ) ) ( SURFACE-AT ?auto_6710 ?auto_6714 ) ( CLEAR ?auto_6710 ) ( IS-CRATE ?auto_6713 ) ( not ( = ?auto_6703 ?auto_6710 ) ) ( not ( = ?auto_6704 ?auto_6710 ) ) ( not ( = ?auto_6708 ?auto_6710 ) ) ( not ( = ?auto_6713 ?auto_6710 ) ) ( not ( = ?auto_6711 ?auto_6710 ) ) ( AVAILABLE ?auto_6709 ) ( TRUCK-AT ?auto_6715 ?auto_6707 ) ( not ( = ?auto_6707 ?auto_6714 ) ) ( not ( = ?auto_6712 ?auto_6707 ) ) ( HOIST-AT ?auto_6705 ?auto_6707 ) ( not ( = ?auto_6709 ?auto_6705 ) ) ( not ( = ?auto_6706 ?auto_6705 ) ) ( AVAILABLE ?auto_6705 ) ( SURFACE-AT ?auto_6713 ?auto_6707 ) ( ON ?auto_6713 ?auto_6716 ) ( CLEAR ?auto_6713 ) ( not ( = ?auto_6703 ?auto_6716 ) ) ( not ( = ?auto_6704 ?auto_6716 ) ) ( not ( = ?auto_6708 ?auto_6716 ) ) ( not ( = ?auto_6713 ?auto_6716 ) ) ( not ( = ?auto_6711 ?auto_6716 ) ) ( not ( = ?auto_6710 ?auto_6716 ) ) )
    :subtasks
    ( ( !LIFT ?auto_6705 ?auto_6713 ?auto_6716 ?auto_6707 )
      ( MAKE-ON ?auto_6703 ?auto_6704 )
      ( MAKE-ON-VERIFY ?auto_6703 ?auto_6704 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_6717 - SURFACE
      ?auto_6718 - SURFACE
    )
    :vars
    (
      ?auto_6722 - HOIST
      ?auto_6729 - PLACE
      ?auto_6724 - PLACE
      ?auto_6727 - HOIST
      ?auto_6730 - SURFACE
      ?auto_6726 - SURFACE
      ?auto_6721 - SURFACE
      ?auto_6719 - SURFACE
      ?auto_6728 - PLACE
      ?auto_6725 - HOIST
      ?auto_6720 - SURFACE
      ?auto_6723 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6722 ?auto_6729 ) ( IS-CRATE ?auto_6717 ) ( not ( = ?auto_6717 ?auto_6718 ) ) ( not ( = ?auto_6724 ?auto_6729 ) ) ( HOIST-AT ?auto_6727 ?auto_6724 ) ( not ( = ?auto_6722 ?auto_6727 ) ) ( SURFACE-AT ?auto_6717 ?auto_6724 ) ( ON ?auto_6717 ?auto_6730 ) ( CLEAR ?auto_6717 ) ( not ( = ?auto_6717 ?auto_6730 ) ) ( not ( = ?auto_6718 ?auto_6730 ) ) ( IS-CRATE ?auto_6718 ) ( not ( = ?auto_6717 ?auto_6726 ) ) ( not ( = ?auto_6718 ?auto_6726 ) ) ( not ( = ?auto_6730 ?auto_6726 ) ) ( AVAILABLE ?auto_6727 ) ( SURFACE-AT ?auto_6718 ?auto_6724 ) ( ON ?auto_6718 ?auto_6721 ) ( CLEAR ?auto_6718 ) ( not ( = ?auto_6717 ?auto_6721 ) ) ( not ( = ?auto_6718 ?auto_6721 ) ) ( not ( = ?auto_6730 ?auto_6721 ) ) ( not ( = ?auto_6726 ?auto_6721 ) ) ( SURFACE-AT ?auto_6719 ?auto_6729 ) ( CLEAR ?auto_6719 ) ( IS-CRATE ?auto_6726 ) ( not ( = ?auto_6717 ?auto_6719 ) ) ( not ( = ?auto_6718 ?auto_6719 ) ) ( not ( = ?auto_6730 ?auto_6719 ) ) ( not ( = ?auto_6726 ?auto_6719 ) ) ( not ( = ?auto_6721 ?auto_6719 ) ) ( AVAILABLE ?auto_6722 ) ( not ( = ?auto_6728 ?auto_6729 ) ) ( not ( = ?auto_6724 ?auto_6728 ) ) ( HOIST-AT ?auto_6725 ?auto_6728 ) ( not ( = ?auto_6722 ?auto_6725 ) ) ( not ( = ?auto_6727 ?auto_6725 ) ) ( AVAILABLE ?auto_6725 ) ( SURFACE-AT ?auto_6726 ?auto_6728 ) ( ON ?auto_6726 ?auto_6720 ) ( CLEAR ?auto_6726 ) ( not ( = ?auto_6717 ?auto_6720 ) ) ( not ( = ?auto_6718 ?auto_6720 ) ) ( not ( = ?auto_6730 ?auto_6720 ) ) ( not ( = ?auto_6726 ?auto_6720 ) ) ( not ( = ?auto_6721 ?auto_6720 ) ) ( not ( = ?auto_6719 ?auto_6720 ) ) ( TRUCK-AT ?auto_6723 ?auto_6729 ) )
    :subtasks
    ( ( !DRIVE ?auto_6723 ?auto_6729 ?auto_6728 )
      ( MAKE-ON ?auto_6717 ?auto_6718 )
      ( MAKE-ON-VERIFY ?auto_6717 ?auto_6718 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_6733 - SURFACE
      ?auto_6734 - SURFACE
    )
    :vars
    (
      ?auto_6735 - HOIST
      ?auto_6736 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6735 ?auto_6736 ) ( SURFACE-AT ?auto_6734 ?auto_6736 ) ( CLEAR ?auto_6734 ) ( LIFTING ?auto_6735 ?auto_6733 ) ( IS-CRATE ?auto_6733 ) ( not ( = ?auto_6733 ?auto_6734 ) ) )
    :subtasks
    ( ( !DROP ?auto_6735 ?auto_6733 ?auto_6734 ?auto_6736 )
      ( MAKE-ON-VERIFY ?auto_6733 ?auto_6734 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_6737 - SURFACE
      ?auto_6738 - SURFACE
    )
    :vars
    (
      ?auto_6740 - HOIST
      ?auto_6739 - PLACE
      ?auto_6741 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6740 ?auto_6739 ) ( SURFACE-AT ?auto_6738 ?auto_6739 ) ( CLEAR ?auto_6738 ) ( IS-CRATE ?auto_6737 ) ( not ( = ?auto_6737 ?auto_6738 ) ) ( TRUCK-AT ?auto_6741 ?auto_6739 ) ( AVAILABLE ?auto_6740 ) ( IN ?auto_6737 ?auto_6741 ) )
    :subtasks
    ( ( !UNLOAD ?auto_6740 ?auto_6737 ?auto_6741 ?auto_6739 )
      ( MAKE-ON ?auto_6737 ?auto_6738 )
      ( MAKE-ON-VERIFY ?auto_6737 ?auto_6738 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_6742 - SURFACE
      ?auto_6743 - SURFACE
    )
    :vars
    (
      ?auto_6745 - HOIST
      ?auto_6746 - PLACE
      ?auto_6744 - TRUCK
      ?auto_6747 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6745 ?auto_6746 ) ( SURFACE-AT ?auto_6743 ?auto_6746 ) ( CLEAR ?auto_6743 ) ( IS-CRATE ?auto_6742 ) ( not ( = ?auto_6742 ?auto_6743 ) ) ( AVAILABLE ?auto_6745 ) ( IN ?auto_6742 ?auto_6744 ) ( TRUCK-AT ?auto_6744 ?auto_6747 ) ( not ( = ?auto_6747 ?auto_6746 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_6744 ?auto_6747 ?auto_6746 )
      ( MAKE-ON ?auto_6742 ?auto_6743 )
      ( MAKE-ON-VERIFY ?auto_6742 ?auto_6743 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_6748 - SURFACE
      ?auto_6749 - SURFACE
    )
    :vars
    (
      ?auto_6752 - HOIST
      ?auto_6753 - PLACE
      ?auto_6750 - TRUCK
      ?auto_6751 - PLACE
      ?auto_6754 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_6752 ?auto_6753 ) ( SURFACE-AT ?auto_6749 ?auto_6753 ) ( CLEAR ?auto_6749 ) ( IS-CRATE ?auto_6748 ) ( not ( = ?auto_6748 ?auto_6749 ) ) ( AVAILABLE ?auto_6752 ) ( TRUCK-AT ?auto_6750 ?auto_6751 ) ( not ( = ?auto_6751 ?auto_6753 ) ) ( HOIST-AT ?auto_6754 ?auto_6751 ) ( LIFTING ?auto_6754 ?auto_6748 ) ( not ( = ?auto_6752 ?auto_6754 ) ) )
    :subtasks
    ( ( !LOAD ?auto_6754 ?auto_6748 ?auto_6750 ?auto_6751 )
      ( MAKE-ON ?auto_6748 ?auto_6749 )
      ( MAKE-ON-VERIFY ?auto_6748 ?auto_6749 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_6755 - SURFACE
      ?auto_6756 - SURFACE
    )
    :vars
    (
      ?auto_6757 - HOIST
      ?auto_6761 - PLACE
      ?auto_6759 - TRUCK
      ?auto_6758 - PLACE
      ?auto_6760 - HOIST
      ?auto_6762 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6757 ?auto_6761 ) ( SURFACE-AT ?auto_6756 ?auto_6761 ) ( CLEAR ?auto_6756 ) ( IS-CRATE ?auto_6755 ) ( not ( = ?auto_6755 ?auto_6756 ) ) ( AVAILABLE ?auto_6757 ) ( TRUCK-AT ?auto_6759 ?auto_6758 ) ( not ( = ?auto_6758 ?auto_6761 ) ) ( HOIST-AT ?auto_6760 ?auto_6758 ) ( not ( = ?auto_6757 ?auto_6760 ) ) ( AVAILABLE ?auto_6760 ) ( SURFACE-AT ?auto_6755 ?auto_6758 ) ( ON ?auto_6755 ?auto_6762 ) ( CLEAR ?auto_6755 ) ( not ( = ?auto_6755 ?auto_6762 ) ) ( not ( = ?auto_6756 ?auto_6762 ) ) )
    :subtasks
    ( ( !LIFT ?auto_6760 ?auto_6755 ?auto_6762 ?auto_6758 )
      ( MAKE-ON ?auto_6755 ?auto_6756 )
      ( MAKE-ON-VERIFY ?auto_6755 ?auto_6756 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_6763 - SURFACE
      ?auto_6764 - SURFACE
    )
    :vars
    (
      ?auto_6765 - HOIST
      ?auto_6766 - PLACE
      ?auto_6769 - PLACE
      ?auto_6767 - HOIST
      ?auto_6768 - SURFACE
      ?auto_6770 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6765 ?auto_6766 ) ( SURFACE-AT ?auto_6764 ?auto_6766 ) ( CLEAR ?auto_6764 ) ( IS-CRATE ?auto_6763 ) ( not ( = ?auto_6763 ?auto_6764 ) ) ( AVAILABLE ?auto_6765 ) ( not ( = ?auto_6769 ?auto_6766 ) ) ( HOIST-AT ?auto_6767 ?auto_6769 ) ( not ( = ?auto_6765 ?auto_6767 ) ) ( AVAILABLE ?auto_6767 ) ( SURFACE-AT ?auto_6763 ?auto_6769 ) ( ON ?auto_6763 ?auto_6768 ) ( CLEAR ?auto_6763 ) ( not ( = ?auto_6763 ?auto_6768 ) ) ( not ( = ?auto_6764 ?auto_6768 ) ) ( TRUCK-AT ?auto_6770 ?auto_6766 ) )
    :subtasks
    ( ( !DRIVE ?auto_6770 ?auto_6766 ?auto_6769 )
      ( MAKE-ON ?auto_6763 ?auto_6764 )
      ( MAKE-ON-VERIFY ?auto_6763 ?auto_6764 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_6771 - SURFACE
      ?auto_6772 - SURFACE
    )
    :vars
    (
      ?auto_6774 - HOIST
      ?auto_6778 - PLACE
      ?auto_6776 - PLACE
      ?auto_6777 - HOIST
      ?auto_6775 - SURFACE
      ?auto_6773 - TRUCK
      ?auto_6779 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6774 ?auto_6778 ) ( IS-CRATE ?auto_6771 ) ( not ( = ?auto_6771 ?auto_6772 ) ) ( not ( = ?auto_6776 ?auto_6778 ) ) ( HOIST-AT ?auto_6777 ?auto_6776 ) ( not ( = ?auto_6774 ?auto_6777 ) ) ( AVAILABLE ?auto_6777 ) ( SURFACE-AT ?auto_6771 ?auto_6776 ) ( ON ?auto_6771 ?auto_6775 ) ( CLEAR ?auto_6771 ) ( not ( = ?auto_6771 ?auto_6775 ) ) ( not ( = ?auto_6772 ?auto_6775 ) ) ( TRUCK-AT ?auto_6773 ?auto_6778 ) ( SURFACE-AT ?auto_6779 ?auto_6778 ) ( CLEAR ?auto_6779 ) ( LIFTING ?auto_6774 ?auto_6772 ) ( IS-CRATE ?auto_6772 ) ( not ( = ?auto_6771 ?auto_6779 ) ) ( not ( = ?auto_6772 ?auto_6779 ) ) ( not ( = ?auto_6775 ?auto_6779 ) ) )
    :subtasks
    ( ( !DROP ?auto_6774 ?auto_6772 ?auto_6779 ?auto_6778 )
      ( MAKE-ON ?auto_6771 ?auto_6772 )
      ( MAKE-ON-VERIFY ?auto_6771 ?auto_6772 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_6780 - SURFACE
      ?auto_6781 - SURFACE
    )
    :vars
    (
      ?auto_6787 - HOIST
      ?auto_6782 - PLACE
      ?auto_6784 - PLACE
      ?auto_6785 - HOIST
      ?auto_6788 - SURFACE
      ?auto_6783 - TRUCK
      ?auto_6786 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6787 ?auto_6782 ) ( IS-CRATE ?auto_6780 ) ( not ( = ?auto_6780 ?auto_6781 ) ) ( not ( = ?auto_6784 ?auto_6782 ) ) ( HOIST-AT ?auto_6785 ?auto_6784 ) ( not ( = ?auto_6787 ?auto_6785 ) ) ( AVAILABLE ?auto_6785 ) ( SURFACE-AT ?auto_6780 ?auto_6784 ) ( ON ?auto_6780 ?auto_6788 ) ( CLEAR ?auto_6780 ) ( not ( = ?auto_6780 ?auto_6788 ) ) ( not ( = ?auto_6781 ?auto_6788 ) ) ( TRUCK-AT ?auto_6783 ?auto_6782 ) ( SURFACE-AT ?auto_6786 ?auto_6782 ) ( CLEAR ?auto_6786 ) ( IS-CRATE ?auto_6781 ) ( not ( = ?auto_6780 ?auto_6786 ) ) ( not ( = ?auto_6781 ?auto_6786 ) ) ( not ( = ?auto_6788 ?auto_6786 ) ) ( AVAILABLE ?auto_6787 ) ( IN ?auto_6781 ?auto_6783 ) )
    :subtasks
    ( ( !UNLOAD ?auto_6787 ?auto_6781 ?auto_6783 ?auto_6782 )
      ( MAKE-ON ?auto_6780 ?auto_6781 )
      ( MAKE-ON-VERIFY ?auto_6780 ?auto_6781 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_6789 - SURFACE
      ?auto_6790 - SURFACE
    )
    :vars
    (
      ?auto_6793 - HOIST
      ?auto_6797 - PLACE
      ?auto_6795 - PLACE
      ?auto_6796 - HOIST
      ?auto_6791 - SURFACE
      ?auto_6792 - SURFACE
      ?auto_6794 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6793 ?auto_6797 ) ( IS-CRATE ?auto_6789 ) ( not ( = ?auto_6789 ?auto_6790 ) ) ( not ( = ?auto_6795 ?auto_6797 ) ) ( HOIST-AT ?auto_6796 ?auto_6795 ) ( not ( = ?auto_6793 ?auto_6796 ) ) ( AVAILABLE ?auto_6796 ) ( SURFACE-AT ?auto_6789 ?auto_6795 ) ( ON ?auto_6789 ?auto_6791 ) ( CLEAR ?auto_6789 ) ( not ( = ?auto_6789 ?auto_6791 ) ) ( not ( = ?auto_6790 ?auto_6791 ) ) ( SURFACE-AT ?auto_6792 ?auto_6797 ) ( CLEAR ?auto_6792 ) ( IS-CRATE ?auto_6790 ) ( not ( = ?auto_6789 ?auto_6792 ) ) ( not ( = ?auto_6790 ?auto_6792 ) ) ( not ( = ?auto_6791 ?auto_6792 ) ) ( AVAILABLE ?auto_6793 ) ( IN ?auto_6790 ?auto_6794 ) ( TRUCK-AT ?auto_6794 ?auto_6795 ) )
    :subtasks
    ( ( !DRIVE ?auto_6794 ?auto_6795 ?auto_6797 )
      ( MAKE-ON ?auto_6789 ?auto_6790 )
      ( MAKE-ON-VERIFY ?auto_6789 ?auto_6790 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_6798 - SURFACE
      ?auto_6799 - SURFACE
    )
    :vars
    (
      ?auto_6802 - HOIST
      ?auto_6803 - PLACE
      ?auto_6804 - PLACE
      ?auto_6806 - HOIST
      ?auto_6801 - SURFACE
      ?auto_6805 - SURFACE
      ?auto_6800 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6802 ?auto_6803 ) ( IS-CRATE ?auto_6798 ) ( not ( = ?auto_6798 ?auto_6799 ) ) ( not ( = ?auto_6804 ?auto_6803 ) ) ( HOIST-AT ?auto_6806 ?auto_6804 ) ( not ( = ?auto_6802 ?auto_6806 ) ) ( SURFACE-AT ?auto_6798 ?auto_6804 ) ( ON ?auto_6798 ?auto_6801 ) ( CLEAR ?auto_6798 ) ( not ( = ?auto_6798 ?auto_6801 ) ) ( not ( = ?auto_6799 ?auto_6801 ) ) ( SURFACE-AT ?auto_6805 ?auto_6803 ) ( CLEAR ?auto_6805 ) ( IS-CRATE ?auto_6799 ) ( not ( = ?auto_6798 ?auto_6805 ) ) ( not ( = ?auto_6799 ?auto_6805 ) ) ( not ( = ?auto_6801 ?auto_6805 ) ) ( AVAILABLE ?auto_6802 ) ( TRUCK-AT ?auto_6800 ?auto_6804 ) ( LIFTING ?auto_6806 ?auto_6799 ) )
    :subtasks
    ( ( !LOAD ?auto_6806 ?auto_6799 ?auto_6800 ?auto_6804 )
      ( MAKE-ON ?auto_6798 ?auto_6799 )
      ( MAKE-ON-VERIFY ?auto_6798 ?auto_6799 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_6807 - SURFACE
      ?auto_6808 - SURFACE
    )
    :vars
    (
      ?auto_6815 - HOIST
      ?auto_6809 - PLACE
      ?auto_6814 - PLACE
      ?auto_6813 - HOIST
      ?auto_6811 - SURFACE
      ?auto_6810 - SURFACE
      ?auto_6812 - TRUCK
      ?auto_6816 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6815 ?auto_6809 ) ( IS-CRATE ?auto_6807 ) ( not ( = ?auto_6807 ?auto_6808 ) ) ( not ( = ?auto_6814 ?auto_6809 ) ) ( HOIST-AT ?auto_6813 ?auto_6814 ) ( not ( = ?auto_6815 ?auto_6813 ) ) ( SURFACE-AT ?auto_6807 ?auto_6814 ) ( ON ?auto_6807 ?auto_6811 ) ( CLEAR ?auto_6807 ) ( not ( = ?auto_6807 ?auto_6811 ) ) ( not ( = ?auto_6808 ?auto_6811 ) ) ( SURFACE-AT ?auto_6810 ?auto_6809 ) ( CLEAR ?auto_6810 ) ( IS-CRATE ?auto_6808 ) ( not ( = ?auto_6807 ?auto_6810 ) ) ( not ( = ?auto_6808 ?auto_6810 ) ) ( not ( = ?auto_6811 ?auto_6810 ) ) ( AVAILABLE ?auto_6815 ) ( TRUCK-AT ?auto_6812 ?auto_6814 ) ( AVAILABLE ?auto_6813 ) ( SURFACE-AT ?auto_6808 ?auto_6814 ) ( ON ?auto_6808 ?auto_6816 ) ( CLEAR ?auto_6808 ) ( not ( = ?auto_6807 ?auto_6816 ) ) ( not ( = ?auto_6808 ?auto_6816 ) ) ( not ( = ?auto_6811 ?auto_6816 ) ) ( not ( = ?auto_6810 ?auto_6816 ) ) )
    :subtasks
    ( ( !LIFT ?auto_6813 ?auto_6808 ?auto_6816 ?auto_6814 )
      ( MAKE-ON ?auto_6807 ?auto_6808 )
      ( MAKE-ON-VERIFY ?auto_6807 ?auto_6808 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_6817 - SURFACE
      ?auto_6818 - SURFACE
    )
    :vars
    (
      ?auto_6824 - HOIST
      ?auto_6823 - PLACE
      ?auto_6822 - PLACE
      ?auto_6825 - HOIST
      ?auto_6819 - SURFACE
      ?auto_6826 - SURFACE
      ?auto_6821 - SURFACE
      ?auto_6820 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6824 ?auto_6823 ) ( IS-CRATE ?auto_6817 ) ( not ( = ?auto_6817 ?auto_6818 ) ) ( not ( = ?auto_6822 ?auto_6823 ) ) ( HOIST-AT ?auto_6825 ?auto_6822 ) ( not ( = ?auto_6824 ?auto_6825 ) ) ( SURFACE-AT ?auto_6817 ?auto_6822 ) ( ON ?auto_6817 ?auto_6819 ) ( CLEAR ?auto_6817 ) ( not ( = ?auto_6817 ?auto_6819 ) ) ( not ( = ?auto_6818 ?auto_6819 ) ) ( SURFACE-AT ?auto_6826 ?auto_6823 ) ( CLEAR ?auto_6826 ) ( IS-CRATE ?auto_6818 ) ( not ( = ?auto_6817 ?auto_6826 ) ) ( not ( = ?auto_6818 ?auto_6826 ) ) ( not ( = ?auto_6819 ?auto_6826 ) ) ( AVAILABLE ?auto_6824 ) ( AVAILABLE ?auto_6825 ) ( SURFACE-AT ?auto_6818 ?auto_6822 ) ( ON ?auto_6818 ?auto_6821 ) ( CLEAR ?auto_6818 ) ( not ( = ?auto_6817 ?auto_6821 ) ) ( not ( = ?auto_6818 ?auto_6821 ) ) ( not ( = ?auto_6819 ?auto_6821 ) ) ( not ( = ?auto_6826 ?auto_6821 ) ) ( TRUCK-AT ?auto_6820 ?auto_6823 ) )
    :subtasks
    ( ( !DRIVE ?auto_6820 ?auto_6823 ?auto_6822 )
      ( MAKE-ON ?auto_6817 ?auto_6818 )
      ( MAKE-ON-VERIFY ?auto_6817 ?auto_6818 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_6827 - SURFACE
      ?auto_6828 - SURFACE
    )
    :vars
    (
      ?auto_6836 - HOIST
      ?auto_6830 - PLACE
      ?auto_6832 - PLACE
      ?auto_6829 - HOIST
      ?auto_6835 - SURFACE
      ?auto_6834 - SURFACE
      ?auto_6833 - SURFACE
      ?auto_6831 - TRUCK
      ?auto_6837 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6836 ?auto_6830 ) ( IS-CRATE ?auto_6827 ) ( not ( = ?auto_6827 ?auto_6828 ) ) ( not ( = ?auto_6832 ?auto_6830 ) ) ( HOIST-AT ?auto_6829 ?auto_6832 ) ( not ( = ?auto_6836 ?auto_6829 ) ) ( SURFACE-AT ?auto_6827 ?auto_6832 ) ( ON ?auto_6827 ?auto_6835 ) ( CLEAR ?auto_6827 ) ( not ( = ?auto_6827 ?auto_6835 ) ) ( not ( = ?auto_6828 ?auto_6835 ) ) ( IS-CRATE ?auto_6828 ) ( not ( = ?auto_6827 ?auto_6834 ) ) ( not ( = ?auto_6828 ?auto_6834 ) ) ( not ( = ?auto_6835 ?auto_6834 ) ) ( AVAILABLE ?auto_6829 ) ( SURFACE-AT ?auto_6828 ?auto_6832 ) ( ON ?auto_6828 ?auto_6833 ) ( CLEAR ?auto_6828 ) ( not ( = ?auto_6827 ?auto_6833 ) ) ( not ( = ?auto_6828 ?auto_6833 ) ) ( not ( = ?auto_6835 ?auto_6833 ) ) ( not ( = ?auto_6834 ?auto_6833 ) ) ( TRUCK-AT ?auto_6831 ?auto_6830 ) ( SURFACE-AT ?auto_6837 ?auto_6830 ) ( CLEAR ?auto_6837 ) ( LIFTING ?auto_6836 ?auto_6834 ) ( IS-CRATE ?auto_6834 ) ( not ( = ?auto_6827 ?auto_6837 ) ) ( not ( = ?auto_6828 ?auto_6837 ) ) ( not ( = ?auto_6835 ?auto_6837 ) ) ( not ( = ?auto_6834 ?auto_6837 ) ) ( not ( = ?auto_6833 ?auto_6837 ) ) )
    :subtasks
    ( ( !DROP ?auto_6836 ?auto_6834 ?auto_6837 ?auto_6830 )
      ( MAKE-ON ?auto_6827 ?auto_6828 )
      ( MAKE-ON-VERIFY ?auto_6827 ?auto_6828 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_6838 - SURFACE
      ?auto_6839 - SURFACE
    )
    :vars
    (
      ?auto_6848 - HOIST
      ?auto_6841 - PLACE
      ?auto_6846 - PLACE
      ?auto_6847 - HOIST
      ?auto_6845 - SURFACE
      ?auto_6843 - SURFACE
      ?auto_6844 - SURFACE
      ?auto_6842 - TRUCK
      ?auto_6840 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6848 ?auto_6841 ) ( IS-CRATE ?auto_6838 ) ( not ( = ?auto_6838 ?auto_6839 ) ) ( not ( = ?auto_6846 ?auto_6841 ) ) ( HOIST-AT ?auto_6847 ?auto_6846 ) ( not ( = ?auto_6848 ?auto_6847 ) ) ( SURFACE-AT ?auto_6838 ?auto_6846 ) ( ON ?auto_6838 ?auto_6845 ) ( CLEAR ?auto_6838 ) ( not ( = ?auto_6838 ?auto_6845 ) ) ( not ( = ?auto_6839 ?auto_6845 ) ) ( IS-CRATE ?auto_6839 ) ( not ( = ?auto_6838 ?auto_6843 ) ) ( not ( = ?auto_6839 ?auto_6843 ) ) ( not ( = ?auto_6845 ?auto_6843 ) ) ( AVAILABLE ?auto_6847 ) ( SURFACE-AT ?auto_6839 ?auto_6846 ) ( ON ?auto_6839 ?auto_6844 ) ( CLEAR ?auto_6839 ) ( not ( = ?auto_6838 ?auto_6844 ) ) ( not ( = ?auto_6839 ?auto_6844 ) ) ( not ( = ?auto_6845 ?auto_6844 ) ) ( not ( = ?auto_6843 ?auto_6844 ) ) ( TRUCK-AT ?auto_6842 ?auto_6841 ) ( SURFACE-AT ?auto_6840 ?auto_6841 ) ( CLEAR ?auto_6840 ) ( IS-CRATE ?auto_6843 ) ( not ( = ?auto_6838 ?auto_6840 ) ) ( not ( = ?auto_6839 ?auto_6840 ) ) ( not ( = ?auto_6845 ?auto_6840 ) ) ( not ( = ?auto_6843 ?auto_6840 ) ) ( not ( = ?auto_6844 ?auto_6840 ) ) ( AVAILABLE ?auto_6848 ) ( IN ?auto_6843 ?auto_6842 ) )
    :subtasks
    ( ( !UNLOAD ?auto_6848 ?auto_6843 ?auto_6842 ?auto_6841 )
      ( MAKE-ON ?auto_6838 ?auto_6839 )
      ( MAKE-ON-VERIFY ?auto_6838 ?auto_6839 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_6849 - SURFACE
      ?auto_6850 - SURFACE
    )
    :vars
    (
      ?auto_6856 - HOIST
      ?auto_6853 - PLACE
      ?auto_6851 - PLACE
      ?auto_6852 - HOIST
      ?auto_6857 - SURFACE
      ?auto_6855 - SURFACE
      ?auto_6858 - SURFACE
      ?auto_6859 - SURFACE
      ?auto_6854 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6856 ?auto_6853 ) ( IS-CRATE ?auto_6849 ) ( not ( = ?auto_6849 ?auto_6850 ) ) ( not ( = ?auto_6851 ?auto_6853 ) ) ( HOIST-AT ?auto_6852 ?auto_6851 ) ( not ( = ?auto_6856 ?auto_6852 ) ) ( SURFACE-AT ?auto_6849 ?auto_6851 ) ( ON ?auto_6849 ?auto_6857 ) ( CLEAR ?auto_6849 ) ( not ( = ?auto_6849 ?auto_6857 ) ) ( not ( = ?auto_6850 ?auto_6857 ) ) ( IS-CRATE ?auto_6850 ) ( not ( = ?auto_6849 ?auto_6855 ) ) ( not ( = ?auto_6850 ?auto_6855 ) ) ( not ( = ?auto_6857 ?auto_6855 ) ) ( AVAILABLE ?auto_6852 ) ( SURFACE-AT ?auto_6850 ?auto_6851 ) ( ON ?auto_6850 ?auto_6858 ) ( CLEAR ?auto_6850 ) ( not ( = ?auto_6849 ?auto_6858 ) ) ( not ( = ?auto_6850 ?auto_6858 ) ) ( not ( = ?auto_6857 ?auto_6858 ) ) ( not ( = ?auto_6855 ?auto_6858 ) ) ( SURFACE-AT ?auto_6859 ?auto_6853 ) ( CLEAR ?auto_6859 ) ( IS-CRATE ?auto_6855 ) ( not ( = ?auto_6849 ?auto_6859 ) ) ( not ( = ?auto_6850 ?auto_6859 ) ) ( not ( = ?auto_6857 ?auto_6859 ) ) ( not ( = ?auto_6855 ?auto_6859 ) ) ( not ( = ?auto_6858 ?auto_6859 ) ) ( AVAILABLE ?auto_6856 ) ( IN ?auto_6855 ?auto_6854 ) ( TRUCK-AT ?auto_6854 ?auto_6851 ) )
    :subtasks
    ( ( !DRIVE ?auto_6854 ?auto_6851 ?auto_6853 )
      ( MAKE-ON ?auto_6849 ?auto_6850 )
      ( MAKE-ON-VERIFY ?auto_6849 ?auto_6850 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_6860 - SURFACE
      ?auto_6861 - SURFACE
    )
    :vars
    (
      ?auto_6870 - HOIST
      ?auto_6864 - PLACE
      ?auto_6868 - PLACE
      ?auto_6863 - HOIST
      ?auto_6862 - SURFACE
      ?auto_6865 - SURFACE
      ?auto_6869 - SURFACE
      ?auto_6866 - SURFACE
      ?auto_6867 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6870 ?auto_6864 ) ( IS-CRATE ?auto_6860 ) ( not ( = ?auto_6860 ?auto_6861 ) ) ( not ( = ?auto_6868 ?auto_6864 ) ) ( HOIST-AT ?auto_6863 ?auto_6868 ) ( not ( = ?auto_6870 ?auto_6863 ) ) ( SURFACE-AT ?auto_6860 ?auto_6868 ) ( ON ?auto_6860 ?auto_6862 ) ( CLEAR ?auto_6860 ) ( not ( = ?auto_6860 ?auto_6862 ) ) ( not ( = ?auto_6861 ?auto_6862 ) ) ( IS-CRATE ?auto_6861 ) ( not ( = ?auto_6860 ?auto_6865 ) ) ( not ( = ?auto_6861 ?auto_6865 ) ) ( not ( = ?auto_6862 ?auto_6865 ) ) ( SURFACE-AT ?auto_6861 ?auto_6868 ) ( ON ?auto_6861 ?auto_6869 ) ( CLEAR ?auto_6861 ) ( not ( = ?auto_6860 ?auto_6869 ) ) ( not ( = ?auto_6861 ?auto_6869 ) ) ( not ( = ?auto_6862 ?auto_6869 ) ) ( not ( = ?auto_6865 ?auto_6869 ) ) ( SURFACE-AT ?auto_6866 ?auto_6864 ) ( CLEAR ?auto_6866 ) ( IS-CRATE ?auto_6865 ) ( not ( = ?auto_6860 ?auto_6866 ) ) ( not ( = ?auto_6861 ?auto_6866 ) ) ( not ( = ?auto_6862 ?auto_6866 ) ) ( not ( = ?auto_6865 ?auto_6866 ) ) ( not ( = ?auto_6869 ?auto_6866 ) ) ( AVAILABLE ?auto_6870 ) ( TRUCK-AT ?auto_6867 ?auto_6868 ) ( LIFTING ?auto_6863 ?auto_6865 ) )
    :subtasks
    ( ( !LOAD ?auto_6863 ?auto_6865 ?auto_6867 ?auto_6868 )
      ( MAKE-ON ?auto_6860 ?auto_6861 )
      ( MAKE-ON-VERIFY ?auto_6860 ?auto_6861 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_6871 - SURFACE
      ?auto_6872 - SURFACE
    )
    :vars
    (
      ?auto_6874 - HOIST
      ?auto_6876 - PLACE
      ?auto_6873 - PLACE
      ?auto_6878 - HOIST
      ?auto_6879 - SURFACE
      ?auto_6881 - SURFACE
      ?auto_6880 - SURFACE
      ?auto_6875 - SURFACE
      ?auto_6877 - TRUCK
      ?auto_6882 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6874 ?auto_6876 ) ( IS-CRATE ?auto_6871 ) ( not ( = ?auto_6871 ?auto_6872 ) ) ( not ( = ?auto_6873 ?auto_6876 ) ) ( HOIST-AT ?auto_6878 ?auto_6873 ) ( not ( = ?auto_6874 ?auto_6878 ) ) ( SURFACE-AT ?auto_6871 ?auto_6873 ) ( ON ?auto_6871 ?auto_6879 ) ( CLEAR ?auto_6871 ) ( not ( = ?auto_6871 ?auto_6879 ) ) ( not ( = ?auto_6872 ?auto_6879 ) ) ( IS-CRATE ?auto_6872 ) ( not ( = ?auto_6871 ?auto_6881 ) ) ( not ( = ?auto_6872 ?auto_6881 ) ) ( not ( = ?auto_6879 ?auto_6881 ) ) ( SURFACE-AT ?auto_6872 ?auto_6873 ) ( ON ?auto_6872 ?auto_6880 ) ( CLEAR ?auto_6872 ) ( not ( = ?auto_6871 ?auto_6880 ) ) ( not ( = ?auto_6872 ?auto_6880 ) ) ( not ( = ?auto_6879 ?auto_6880 ) ) ( not ( = ?auto_6881 ?auto_6880 ) ) ( SURFACE-AT ?auto_6875 ?auto_6876 ) ( CLEAR ?auto_6875 ) ( IS-CRATE ?auto_6881 ) ( not ( = ?auto_6871 ?auto_6875 ) ) ( not ( = ?auto_6872 ?auto_6875 ) ) ( not ( = ?auto_6879 ?auto_6875 ) ) ( not ( = ?auto_6881 ?auto_6875 ) ) ( not ( = ?auto_6880 ?auto_6875 ) ) ( AVAILABLE ?auto_6874 ) ( TRUCK-AT ?auto_6877 ?auto_6873 ) ( AVAILABLE ?auto_6878 ) ( SURFACE-AT ?auto_6881 ?auto_6873 ) ( ON ?auto_6881 ?auto_6882 ) ( CLEAR ?auto_6881 ) ( not ( = ?auto_6871 ?auto_6882 ) ) ( not ( = ?auto_6872 ?auto_6882 ) ) ( not ( = ?auto_6879 ?auto_6882 ) ) ( not ( = ?auto_6881 ?auto_6882 ) ) ( not ( = ?auto_6880 ?auto_6882 ) ) ( not ( = ?auto_6875 ?auto_6882 ) ) )
    :subtasks
    ( ( !LIFT ?auto_6878 ?auto_6881 ?auto_6882 ?auto_6873 )
      ( MAKE-ON ?auto_6871 ?auto_6872 )
      ( MAKE-ON-VERIFY ?auto_6871 ?auto_6872 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_6883 - SURFACE
      ?auto_6884 - SURFACE
    )
    :vars
    (
      ?auto_6888 - HOIST
      ?auto_6891 - PLACE
      ?auto_6886 - PLACE
      ?auto_6893 - HOIST
      ?auto_6890 - SURFACE
      ?auto_6887 - SURFACE
      ?auto_6892 - SURFACE
      ?auto_6885 - SURFACE
      ?auto_6894 - SURFACE
      ?auto_6889 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6888 ?auto_6891 ) ( IS-CRATE ?auto_6883 ) ( not ( = ?auto_6883 ?auto_6884 ) ) ( not ( = ?auto_6886 ?auto_6891 ) ) ( HOIST-AT ?auto_6893 ?auto_6886 ) ( not ( = ?auto_6888 ?auto_6893 ) ) ( SURFACE-AT ?auto_6883 ?auto_6886 ) ( ON ?auto_6883 ?auto_6890 ) ( CLEAR ?auto_6883 ) ( not ( = ?auto_6883 ?auto_6890 ) ) ( not ( = ?auto_6884 ?auto_6890 ) ) ( IS-CRATE ?auto_6884 ) ( not ( = ?auto_6883 ?auto_6887 ) ) ( not ( = ?auto_6884 ?auto_6887 ) ) ( not ( = ?auto_6890 ?auto_6887 ) ) ( SURFACE-AT ?auto_6884 ?auto_6886 ) ( ON ?auto_6884 ?auto_6892 ) ( CLEAR ?auto_6884 ) ( not ( = ?auto_6883 ?auto_6892 ) ) ( not ( = ?auto_6884 ?auto_6892 ) ) ( not ( = ?auto_6890 ?auto_6892 ) ) ( not ( = ?auto_6887 ?auto_6892 ) ) ( SURFACE-AT ?auto_6885 ?auto_6891 ) ( CLEAR ?auto_6885 ) ( IS-CRATE ?auto_6887 ) ( not ( = ?auto_6883 ?auto_6885 ) ) ( not ( = ?auto_6884 ?auto_6885 ) ) ( not ( = ?auto_6890 ?auto_6885 ) ) ( not ( = ?auto_6887 ?auto_6885 ) ) ( not ( = ?auto_6892 ?auto_6885 ) ) ( AVAILABLE ?auto_6888 ) ( AVAILABLE ?auto_6893 ) ( SURFACE-AT ?auto_6887 ?auto_6886 ) ( ON ?auto_6887 ?auto_6894 ) ( CLEAR ?auto_6887 ) ( not ( = ?auto_6883 ?auto_6894 ) ) ( not ( = ?auto_6884 ?auto_6894 ) ) ( not ( = ?auto_6890 ?auto_6894 ) ) ( not ( = ?auto_6887 ?auto_6894 ) ) ( not ( = ?auto_6892 ?auto_6894 ) ) ( not ( = ?auto_6885 ?auto_6894 ) ) ( TRUCK-AT ?auto_6889 ?auto_6891 ) )
    :subtasks
    ( ( !DRIVE ?auto_6889 ?auto_6891 ?auto_6886 )
      ( MAKE-ON ?auto_6883 ?auto_6884 )
      ( MAKE-ON-VERIFY ?auto_6883 ?auto_6884 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_6895 - SURFACE
      ?auto_6896 - SURFACE
    )
    :vars
    (
      ?auto_6904 - HOIST
      ?auto_6898 - PLACE
      ?auto_6897 - PLACE
      ?auto_6906 - HOIST
      ?auto_6899 - SURFACE
      ?auto_6903 - SURFACE
      ?auto_6902 - SURFACE
      ?auto_6905 - SURFACE
      ?auto_6901 - SURFACE
      ?auto_6900 - TRUCK
      ?auto_6907 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6904 ?auto_6898 ) ( IS-CRATE ?auto_6895 ) ( not ( = ?auto_6895 ?auto_6896 ) ) ( not ( = ?auto_6897 ?auto_6898 ) ) ( HOIST-AT ?auto_6906 ?auto_6897 ) ( not ( = ?auto_6904 ?auto_6906 ) ) ( SURFACE-AT ?auto_6895 ?auto_6897 ) ( ON ?auto_6895 ?auto_6899 ) ( CLEAR ?auto_6895 ) ( not ( = ?auto_6895 ?auto_6899 ) ) ( not ( = ?auto_6896 ?auto_6899 ) ) ( IS-CRATE ?auto_6896 ) ( not ( = ?auto_6895 ?auto_6903 ) ) ( not ( = ?auto_6896 ?auto_6903 ) ) ( not ( = ?auto_6899 ?auto_6903 ) ) ( SURFACE-AT ?auto_6896 ?auto_6897 ) ( ON ?auto_6896 ?auto_6902 ) ( CLEAR ?auto_6896 ) ( not ( = ?auto_6895 ?auto_6902 ) ) ( not ( = ?auto_6896 ?auto_6902 ) ) ( not ( = ?auto_6899 ?auto_6902 ) ) ( not ( = ?auto_6903 ?auto_6902 ) ) ( IS-CRATE ?auto_6903 ) ( not ( = ?auto_6895 ?auto_6905 ) ) ( not ( = ?auto_6896 ?auto_6905 ) ) ( not ( = ?auto_6899 ?auto_6905 ) ) ( not ( = ?auto_6903 ?auto_6905 ) ) ( not ( = ?auto_6902 ?auto_6905 ) ) ( AVAILABLE ?auto_6906 ) ( SURFACE-AT ?auto_6903 ?auto_6897 ) ( ON ?auto_6903 ?auto_6901 ) ( CLEAR ?auto_6903 ) ( not ( = ?auto_6895 ?auto_6901 ) ) ( not ( = ?auto_6896 ?auto_6901 ) ) ( not ( = ?auto_6899 ?auto_6901 ) ) ( not ( = ?auto_6903 ?auto_6901 ) ) ( not ( = ?auto_6902 ?auto_6901 ) ) ( not ( = ?auto_6905 ?auto_6901 ) ) ( TRUCK-AT ?auto_6900 ?auto_6898 ) ( SURFACE-AT ?auto_6907 ?auto_6898 ) ( CLEAR ?auto_6907 ) ( LIFTING ?auto_6904 ?auto_6905 ) ( IS-CRATE ?auto_6905 ) ( not ( = ?auto_6895 ?auto_6907 ) ) ( not ( = ?auto_6896 ?auto_6907 ) ) ( not ( = ?auto_6899 ?auto_6907 ) ) ( not ( = ?auto_6903 ?auto_6907 ) ) ( not ( = ?auto_6902 ?auto_6907 ) ) ( not ( = ?auto_6905 ?auto_6907 ) ) ( not ( = ?auto_6901 ?auto_6907 ) ) )
    :subtasks
    ( ( !DROP ?auto_6904 ?auto_6905 ?auto_6907 ?auto_6898 )
      ( MAKE-ON ?auto_6895 ?auto_6896 )
      ( MAKE-ON-VERIFY ?auto_6895 ?auto_6896 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_6908 - SURFACE
      ?auto_6909 - SURFACE
    )
    :vars
    (
      ?auto_6912 - HOIST
      ?auto_6914 - PLACE
      ?auto_6920 - PLACE
      ?auto_6917 - HOIST
      ?auto_6918 - SURFACE
      ?auto_6915 - SURFACE
      ?auto_6910 - SURFACE
      ?auto_6916 - SURFACE
      ?auto_6911 - SURFACE
      ?auto_6919 - TRUCK
      ?auto_6913 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6912 ?auto_6914 ) ( IS-CRATE ?auto_6908 ) ( not ( = ?auto_6908 ?auto_6909 ) ) ( not ( = ?auto_6920 ?auto_6914 ) ) ( HOIST-AT ?auto_6917 ?auto_6920 ) ( not ( = ?auto_6912 ?auto_6917 ) ) ( SURFACE-AT ?auto_6908 ?auto_6920 ) ( ON ?auto_6908 ?auto_6918 ) ( CLEAR ?auto_6908 ) ( not ( = ?auto_6908 ?auto_6918 ) ) ( not ( = ?auto_6909 ?auto_6918 ) ) ( IS-CRATE ?auto_6909 ) ( not ( = ?auto_6908 ?auto_6915 ) ) ( not ( = ?auto_6909 ?auto_6915 ) ) ( not ( = ?auto_6918 ?auto_6915 ) ) ( SURFACE-AT ?auto_6909 ?auto_6920 ) ( ON ?auto_6909 ?auto_6910 ) ( CLEAR ?auto_6909 ) ( not ( = ?auto_6908 ?auto_6910 ) ) ( not ( = ?auto_6909 ?auto_6910 ) ) ( not ( = ?auto_6918 ?auto_6910 ) ) ( not ( = ?auto_6915 ?auto_6910 ) ) ( IS-CRATE ?auto_6915 ) ( not ( = ?auto_6908 ?auto_6916 ) ) ( not ( = ?auto_6909 ?auto_6916 ) ) ( not ( = ?auto_6918 ?auto_6916 ) ) ( not ( = ?auto_6915 ?auto_6916 ) ) ( not ( = ?auto_6910 ?auto_6916 ) ) ( AVAILABLE ?auto_6917 ) ( SURFACE-AT ?auto_6915 ?auto_6920 ) ( ON ?auto_6915 ?auto_6911 ) ( CLEAR ?auto_6915 ) ( not ( = ?auto_6908 ?auto_6911 ) ) ( not ( = ?auto_6909 ?auto_6911 ) ) ( not ( = ?auto_6918 ?auto_6911 ) ) ( not ( = ?auto_6915 ?auto_6911 ) ) ( not ( = ?auto_6910 ?auto_6911 ) ) ( not ( = ?auto_6916 ?auto_6911 ) ) ( TRUCK-AT ?auto_6919 ?auto_6914 ) ( SURFACE-AT ?auto_6913 ?auto_6914 ) ( CLEAR ?auto_6913 ) ( IS-CRATE ?auto_6916 ) ( not ( = ?auto_6908 ?auto_6913 ) ) ( not ( = ?auto_6909 ?auto_6913 ) ) ( not ( = ?auto_6918 ?auto_6913 ) ) ( not ( = ?auto_6915 ?auto_6913 ) ) ( not ( = ?auto_6910 ?auto_6913 ) ) ( not ( = ?auto_6916 ?auto_6913 ) ) ( not ( = ?auto_6911 ?auto_6913 ) ) ( AVAILABLE ?auto_6912 ) ( IN ?auto_6916 ?auto_6919 ) )
    :subtasks
    ( ( !UNLOAD ?auto_6912 ?auto_6916 ?auto_6919 ?auto_6914 )
      ( MAKE-ON ?auto_6908 ?auto_6909 )
      ( MAKE-ON-VERIFY ?auto_6908 ?auto_6909 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_6921 - SURFACE
      ?auto_6922 - SURFACE
    )
    :vars
    (
      ?auto_6929 - HOIST
      ?auto_6931 - PLACE
      ?auto_6925 - PLACE
      ?auto_6932 - HOIST
      ?auto_6924 - SURFACE
      ?auto_6930 - SURFACE
      ?auto_6927 - SURFACE
      ?auto_6923 - SURFACE
      ?auto_6926 - SURFACE
      ?auto_6928 - SURFACE
      ?auto_6933 - TRUCK
      ?auto_6934 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6929 ?auto_6931 ) ( IS-CRATE ?auto_6921 ) ( not ( = ?auto_6921 ?auto_6922 ) ) ( not ( = ?auto_6925 ?auto_6931 ) ) ( HOIST-AT ?auto_6932 ?auto_6925 ) ( not ( = ?auto_6929 ?auto_6932 ) ) ( SURFACE-AT ?auto_6921 ?auto_6925 ) ( ON ?auto_6921 ?auto_6924 ) ( CLEAR ?auto_6921 ) ( not ( = ?auto_6921 ?auto_6924 ) ) ( not ( = ?auto_6922 ?auto_6924 ) ) ( IS-CRATE ?auto_6922 ) ( not ( = ?auto_6921 ?auto_6930 ) ) ( not ( = ?auto_6922 ?auto_6930 ) ) ( not ( = ?auto_6924 ?auto_6930 ) ) ( SURFACE-AT ?auto_6922 ?auto_6925 ) ( ON ?auto_6922 ?auto_6927 ) ( CLEAR ?auto_6922 ) ( not ( = ?auto_6921 ?auto_6927 ) ) ( not ( = ?auto_6922 ?auto_6927 ) ) ( not ( = ?auto_6924 ?auto_6927 ) ) ( not ( = ?auto_6930 ?auto_6927 ) ) ( IS-CRATE ?auto_6930 ) ( not ( = ?auto_6921 ?auto_6923 ) ) ( not ( = ?auto_6922 ?auto_6923 ) ) ( not ( = ?auto_6924 ?auto_6923 ) ) ( not ( = ?auto_6930 ?auto_6923 ) ) ( not ( = ?auto_6927 ?auto_6923 ) ) ( AVAILABLE ?auto_6932 ) ( SURFACE-AT ?auto_6930 ?auto_6925 ) ( ON ?auto_6930 ?auto_6926 ) ( CLEAR ?auto_6930 ) ( not ( = ?auto_6921 ?auto_6926 ) ) ( not ( = ?auto_6922 ?auto_6926 ) ) ( not ( = ?auto_6924 ?auto_6926 ) ) ( not ( = ?auto_6930 ?auto_6926 ) ) ( not ( = ?auto_6927 ?auto_6926 ) ) ( not ( = ?auto_6923 ?auto_6926 ) ) ( SURFACE-AT ?auto_6928 ?auto_6931 ) ( CLEAR ?auto_6928 ) ( IS-CRATE ?auto_6923 ) ( not ( = ?auto_6921 ?auto_6928 ) ) ( not ( = ?auto_6922 ?auto_6928 ) ) ( not ( = ?auto_6924 ?auto_6928 ) ) ( not ( = ?auto_6930 ?auto_6928 ) ) ( not ( = ?auto_6927 ?auto_6928 ) ) ( not ( = ?auto_6923 ?auto_6928 ) ) ( not ( = ?auto_6926 ?auto_6928 ) ) ( AVAILABLE ?auto_6929 ) ( IN ?auto_6923 ?auto_6933 ) ( TRUCK-AT ?auto_6933 ?auto_6934 ) ( not ( = ?auto_6934 ?auto_6931 ) ) ( not ( = ?auto_6925 ?auto_6934 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_6933 ?auto_6934 ?auto_6931 )
      ( MAKE-ON ?auto_6921 ?auto_6922 )
      ( MAKE-ON-VERIFY ?auto_6921 ?auto_6922 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_6935 - SURFACE
      ?auto_6936 - SURFACE
    )
    :vars
    (
      ?auto_6939 - HOIST
      ?auto_6947 - PLACE
      ?auto_6944 - PLACE
      ?auto_6938 - HOIST
      ?auto_6937 - SURFACE
      ?auto_6942 - SURFACE
      ?auto_6941 - SURFACE
      ?auto_6946 - SURFACE
      ?auto_6940 - SURFACE
      ?auto_6943 - SURFACE
      ?auto_6945 - TRUCK
      ?auto_6948 - PLACE
      ?auto_6949 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_6939 ?auto_6947 ) ( IS-CRATE ?auto_6935 ) ( not ( = ?auto_6935 ?auto_6936 ) ) ( not ( = ?auto_6944 ?auto_6947 ) ) ( HOIST-AT ?auto_6938 ?auto_6944 ) ( not ( = ?auto_6939 ?auto_6938 ) ) ( SURFACE-AT ?auto_6935 ?auto_6944 ) ( ON ?auto_6935 ?auto_6937 ) ( CLEAR ?auto_6935 ) ( not ( = ?auto_6935 ?auto_6937 ) ) ( not ( = ?auto_6936 ?auto_6937 ) ) ( IS-CRATE ?auto_6936 ) ( not ( = ?auto_6935 ?auto_6942 ) ) ( not ( = ?auto_6936 ?auto_6942 ) ) ( not ( = ?auto_6937 ?auto_6942 ) ) ( SURFACE-AT ?auto_6936 ?auto_6944 ) ( ON ?auto_6936 ?auto_6941 ) ( CLEAR ?auto_6936 ) ( not ( = ?auto_6935 ?auto_6941 ) ) ( not ( = ?auto_6936 ?auto_6941 ) ) ( not ( = ?auto_6937 ?auto_6941 ) ) ( not ( = ?auto_6942 ?auto_6941 ) ) ( IS-CRATE ?auto_6942 ) ( not ( = ?auto_6935 ?auto_6946 ) ) ( not ( = ?auto_6936 ?auto_6946 ) ) ( not ( = ?auto_6937 ?auto_6946 ) ) ( not ( = ?auto_6942 ?auto_6946 ) ) ( not ( = ?auto_6941 ?auto_6946 ) ) ( AVAILABLE ?auto_6938 ) ( SURFACE-AT ?auto_6942 ?auto_6944 ) ( ON ?auto_6942 ?auto_6940 ) ( CLEAR ?auto_6942 ) ( not ( = ?auto_6935 ?auto_6940 ) ) ( not ( = ?auto_6936 ?auto_6940 ) ) ( not ( = ?auto_6937 ?auto_6940 ) ) ( not ( = ?auto_6942 ?auto_6940 ) ) ( not ( = ?auto_6941 ?auto_6940 ) ) ( not ( = ?auto_6946 ?auto_6940 ) ) ( SURFACE-AT ?auto_6943 ?auto_6947 ) ( CLEAR ?auto_6943 ) ( IS-CRATE ?auto_6946 ) ( not ( = ?auto_6935 ?auto_6943 ) ) ( not ( = ?auto_6936 ?auto_6943 ) ) ( not ( = ?auto_6937 ?auto_6943 ) ) ( not ( = ?auto_6942 ?auto_6943 ) ) ( not ( = ?auto_6941 ?auto_6943 ) ) ( not ( = ?auto_6946 ?auto_6943 ) ) ( not ( = ?auto_6940 ?auto_6943 ) ) ( AVAILABLE ?auto_6939 ) ( TRUCK-AT ?auto_6945 ?auto_6948 ) ( not ( = ?auto_6948 ?auto_6947 ) ) ( not ( = ?auto_6944 ?auto_6948 ) ) ( HOIST-AT ?auto_6949 ?auto_6948 ) ( LIFTING ?auto_6949 ?auto_6946 ) ( not ( = ?auto_6939 ?auto_6949 ) ) ( not ( = ?auto_6938 ?auto_6949 ) ) )
    :subtasks
    ( ( !LOAD ?auto_6949 ?auto_6946 ?auto_6945 ?auto_6948 )
      ( MAKE-ON ?auto_6935 ?auto_6936 )
      ( MAKE-ON-VERIFY ?auto_6935 ?auto_6936 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_6950 - SURFACE
      ?auto_6951 - SURFACE
    )
    :vars
    (
      ?auto_6961 - HOIST
      ?auto_6959 - PLACE
      ?auto_6960 - PLACE
      ?auto_6962 - HOIST
      ?auto_6953 - SURFACE
      ?auto_6964 - SURFACE
      ?auto_6955 - SURFACE
      ?auto_6956 - SURFACE
      ?auto_6954 - SURFACE
      ?auto_6952 - SURFACE
      ?auto_6958 - TRUCK
      ?auto_6957 - PLACE
      ?auto_6963 - HOIST
      ?auto_6965 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6961 ?auto_6959 ) ( IS-CRATE ?auto_6950 ) ( not ( = ?auto_6950 ?auto_6951 ) ) ( not ( = ?auto_6960 ?auto_6959 ) ) ( HOIST-AT ?auto_6962 ?auto_6960 ) ( not ( = ?auto_6961 ?auto_6962 ) ) ( SURFACE-AT ?auto_6950 ?auto_6960 ) ( ON ?auto_6950 ?auto_6953 ) ( CLEAR ?auto_6950 ) ( not ( = ?auto_6950 ?auto_6953 ) ) ( not ( = ?auto_6951 ?auto_6953 ) ) ( IS-CRATE ?auto_6951 ) ( not ( = ?auto_6950 ?auto_6964 ) ) ( not ( = ?auto_6951 ?auto_6964 ) ) ( not ( = ?auto_6953 ?auto_6964 ) ) ( SURFACE-AT ?auto_6951 ?auto_6960 ) ( ON ?auto_6951 ?auto_6955 ) ( CLEAR ?auto_6951 ) ( not ( = ?auto_6950 ?auto_6955 ) ) ( not ( = ?auto_6951 ?auto_6955 ) ) ( not ( = ?auto_6953 ?auto_6955 ) ) ( not ( = ?auto_6964 ?auto_6955 ) ) ( IS-CRATE ?auto_6964 ) ( not ( = ?auto_6950 ?auto_6956 ) ) ( not ( = ?auto_6951 ?auto_6956 ) ) ( not ( = ?auto_6953 ?auto_6956 ) ) ( not ( = ?auto_6964 ?auto_6956 ) ) ( not ( = ?auto_6955 ?auto_6956 ) ) ( AVAILABLE ?auto_6962 ) ( SURFACE-AT ?auto_6964 ?auto_6960 ) ( ON ?auto_6964 ?auto_6954 ) ( CLEAR ?auto_6964 ) ( not ( = ?auto_6950 ?auto_6954 ) ) ( not ( = ?auto_6951 ?auto_6954 ) ) ( not ( = ?auto_6953 ?auto_6954 ) ) ( not ( = ?auto_6964 ?auto_6954 ) ) ( not ( = ?auto_6955 ?auto_6954 ) ) ( not ( = ?auto_6956 ?auto_6954 ) ) ( SURFACE-AT ?auto_6952 ?auto_6959 ) ( CLEAR ?auto_6952 ) ( IS-CRATE ?auto_6956 ) ( not ( = ?auto_6950 ?auto_6952 ) ) ( not ( = ?auto_6951 ?auto_6952 ) ) ( not ( = ?auto_6953 ?auto_6952 ) ) ( not ( = ?auto_6964 ?auto_6952 ) ) ( not ( = ?auto_6955 ?auto_6952 ) ) ( not ( = ?auto_6956 ?auto_6952 ) ) ( not ( = ?auto_6954 ?auto_6952 ) ) ( AVAILABLE ?auto_6961 ) ( TRUCK-AT ?auto_6958 ?auto_6957 ) ( not ( = ?auto_6957 ?auto_6959 ) ) ( not ( = ?auto_6960 ?auto_6957 ) ) ( HOIST-AT ?auto_6963 ?auto_6957 ) ( not ( = ?auto_6961 ?auto_6963 ) ) ( not ( = ?auto_6962 ?auto_6963 ) ) ( AVAILABLE ?auto_6963 ) ( SURFACE-AT ?auto_6956 ?auto_6957 ) ( ON ?auto_6956 ?auto_6965 ) ( CLEAR ?auto_6956 ) ( not ( = ?auto_6950 ?auto_6965 ) ) ( not ( = ?auto_6951 ?auto_6965 ) ) ( not ( = ?auto_6953 ?auto_6965 ) ) ( not ( = ?auto_6964 ?auto_6965 ) ) ( not ( = ?auto_6955 ?auto_6965 ) ) ( not ( = ?auto_6956 ?auto_6965 ) ) ( not ( = ?auto_6954 ?auto_6965 ) ) ( not ( = ?auto_6952 ?auto_6965 ) ) )
    :subtasks
    ( ( !LIFT ?auto_6963 ?auto_6956 ?auto_6965 ?auto_6957 )
      ( MAKE-ON ?auto_6950 ?auto_6951 )
      ( MAKE-ON-VERIFY ?auto_6950 ?auto_6951 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_6966 - SURFACE
      ?auto_6967 - SURFACE
    )
    :vars
    (
      ?auto_6976 - HOIST
      ?auto_6973 - PLACE
      ?auto_6979 - PLACE
      ?auto_6969 - HOIST
      ?auto_6970 - SURFACE
      ?auto_6978 - SURFACE
      ?auto_6968 - SURFACE
      ?auto_6974 - SURFACE
      ?auto_6971 - SURFACE
      ?auto_6975 - SURFACE
      ?auto_6972 - PLACE
      ?auto_6977 - HOIST
      ?auto_6981 - SURFACE
      ?auto_6980 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6976 ?auto_6973 ) ( IS-CRATE ?auto_6966 ) ( not ( = ?auto_6966 ?auto_6967 ) ) ( not ( = ?auto_6979 ?auto_6973 ) ) ( HOIST-AT ?auto_6969 ?auto_6979 ) ( not ( = ?auto_6976 ?auto_6969 ) ) ( SURFACE-AT ?auto_6966 ?auto_6979 ) ( ON ?auto_6966 ?auto_6970 ) ( CLEAR ?auto_6966 ) ( not ( = ?auto_6966 ?auto_6970 ) ) ( not ( = ?auto_6967 ?auto_6970 ) ) ( IS-CRATE ?auto_6967 ) ( not ( = ?auto_6966 ?auto_6978 ) ) ( not ( = ?auto_6967 ?auto_6978 ) ) ( not ( = ?auto_6970 ?auto_6978 ) ) ( SURFACE-AT ?auto_6967 ?auto_6979 ) ( ON ?auto_6967 ?auto_6968 ) ( CLEAR ?auto_6967 ) ( not ( = ?auto_6966 ?auto_6968 ) ) ( not ( = ?auto_6967 ?auto_6968 ) ) ( not ( = ?auto_6970 ?auto_6968 ) ) ( not ( = ?auto_6978 ?auto_6968 ) ) ( IS-CRATE ?auto_6978 ) ( not ( = ?auto_6966 ?auto_6974 ) ) ( not ( = ?auto_6967 ?auto_6974 ) ) ( not ( = ?auto_6970 ?auto_6974 ) ) ( not ( = ?auto_6978 ?auto_6974 ) ) ( not ( = ?auto_6968 ?auto_6974 ) ) ( AVAILABLE ?auto_6969 ) ( SURFACE-AT ?auto_6978 ?auto_6979 ) ( ON ?auto_6978 ?auto_6971 ) ( CLEAR ?auto_6978 ) ( not ( = ?auto_6966 ?auto_6971 ) ) ( not ( = ?auto_6967 ?auto_6971 ) ) ( not ( = ?auto_6970 ?auto_6971 ) ) ( not ( = ?auto_6978 ?auto_6971 ) ) ( not ( = ?auto_6968 ?auto_6971 ) ) ( not ( = ?auto_6974 ?auto_6971 ) ) ( SURFACE-AT ?auto_6975 ?auto_6973 ) ( CLEAR ?auto_6975 ) ( IS-CRATE ?auto_6974 ) ( not ( = ?auto_6966 ?auto_6975 ) ) ( not ( = ?auto_6967 ?auto_6975 ) ) ( not ( = ?auto_6970 ?auto_6975 ) ) ( not ( = ?auto_6978 ?auto_6975 ) ) ( not ( = ?auto_6968 ?auto_6975 ) ) ( not ( = ?auto_6974 ?auto_6975 ) ) ( not ( = ?auto_6971 ?auto_6975 ) ) ( AVAILABLE ?auto_6976 ) ( not ( = ?auto_6972 ?auto_6973 ) ) ( not ( = ?auto_6979 ?auto_6972 ) ) ( HOIST-AT ?auto_6977 ?auto_6972 ) ( not ( = ?auto_6976 ?auto_6977 ) ) ( not ( = ?auto_6969 ?auto_6977 ) ) ( AVAILABLE ?auto_6977 ) ( SURFACE-AT ?auto_6974 ?auto_6972 ) ( ON ?auto_6974 ?auto_6981 ) ( CLEAR ?auto_6974 ) ( not ( = ?auto_6966 ?auto_6981 ) ) ( not ( = ?auto_6967 ?auto_6981 ) ) ( not ( = ?auto_6970 ?auto_6981 ) ) ( not ( = ?auto_6978 ?auto_6981 ) ) ( not ( = ?auto_6968 ?auto_6981 ) ) ( not ( = ?auto_6974 ?auto_6981 ) ) ( not ( = ?auto_6971 ?auto_6981 ) ) ( not ( = ?auto_6975 ?auto_6981 ) ) ( TRUCK-AT ?auto_6980 ?auto_6973 ) )
    :subtasks
    ( ( !DRIVE ?auto_6980 ?auto_6973 ?auto_6972 )
      ( MAKE-ON ?auto_6966 ?auto_6967 )
      ( MAKE-ON-VERIFY ?auto_6966 ?auto_6967 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_6984 - SURFACE
      ?auto_6985 - SURFACE
    )
    :vars
    (
      ?auto_6986 - HOIST
      ?auto_6987 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6986 ?auto_6987 ) ( SURFACE-AT ?auto_6985 ?auto_6987 ) ( CLEAR ?auto_6985 ) ( LIFTING ?auto_6986 ?auto_6984 ) ( IS-CRATE ?auto_6984 ) ( not ( = ?auto_6984 ?auto_6985 ) ) )
    :subtasks
    ( ( !DROP ?auto_6986 ?auto_6984 ?auto_6985 ?auto_6987 )
      ( MAKE-ON-VERIFY ?auto_6984 ?auto_6985 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_6988 - SURFACE
      ?auto_6989 - SURFACE
    )
    :vars
    (
      ?auto_6990 - HOIST
      ?auto_6991 - PLACE
      ?auto_6992 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6990 ?auto_6991 ) ( SURFACE-AT ?auto_6989 ?auto_6991 ) ( CLEAR ?auto_6989 ) ( IS-CRATE ?auto_6988 ) ( not ( = ?auto_6988 ?auto_6989 ) ) ( TRUCK-AT ?auto_6992 ?auto_6991 ) ( AVAILABLE ?auto_6990 ) ( IN ?auto_6988 ?auto_6992 ) )
    :subtasks
    ( ( !UNLOAD ?auto_6990 ?auto_6988 ?auto_6992 ?auto_6991 )
      ( MAKE-ON ?auto_6988 ?auto_6989 )
      ( MAKE-ON-VERIFY ?auto_6988 ?auto_6989 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_6993 - SURFACE
      ?auto_6994 - SURFACE
    )
    :vars
    (
      ?auto_6996 - HOIST
      ?auto_6995 - PLACE
      ?auto_6997 - TRUCK
      ?auto_6998 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6996 ?auto_6995 ) ( SURFACE-AT ?auto_6994 ?auto_6995 ) ( CLEAR ?auto_6994 ) ( IS-CRATE ?auto_6993 ) ( not ( = ?auto_6993 ?auto_6994 ) ) ( AVAILABLE ?auto_6996 ) ( IN ?auto_6993 ?auto_6997 ) ( TRUCK-AT ?auto_6997 ?auto_6998 ) ( not ( = ?auto_6998 ?auto_6995 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_6997 ?auto_6998 ?auto_6995 )
      ( MAKE-ON ?auto_6993 ?auto_6994 )
      ( MAKE-ON-VERIFY ?auto_6993 ?auto_6994 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_6999 - SURFACE
      ?auto_7000 - SURFACE
    )
    :vars
    (
      ?auto_7002 - HOIST
      ?auto_7004 - PLACE
      ?auto_7001 - TRUCK
      ?auto_7003 - PLACE
      ?auto_7005 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_7002 ?auto_7004 ) ( SURFACE-AT ?auto_7000 ?auto_7004 ) ( CLEAR ?auto_7000 ) ( IS-CRATE ?auto_6999 ) ( not ( = ?auto_6999 ?auto_7000 ) ) ( AVAILABLE ?auto_7002 ) ( TRUCK-AT ?auto_7001 ?auto_7003 ) ( not ( = ?auto_7003 ?auto_7004 ) ) ( HOIST-AT ?auto_7005 ?auto_7003 ) ( LIFTING ?auto_7005 ?auto_6999 ) ( not ( = ?auto_7002 ?auto_7005 ) ) )
    :subtasks
    ( ( !LOAD ?auto_7005 ?auto_6999 ?auto_7001 ?auto_7003 )
      ( MAKE-ON ?auto_6999 ?auto_7000 )
      ( MAKE-ON-VERIFY ?auto_6999 ?auto_7000 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_7006 - SURFACE
      ?auto_7007 - SURFACE
    )
    :vars
    (
      ?auto_7009 - HOIST
      ?auto_7011 - PLACE
      ?auto_7010 - TRUCK
      ?auto_7008 - PLACE
      ?auto_7012 - HOIST
      ?auto_7013 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7009 ?auto_7011 ) ( SURFACE-AT ?auto_7007 ?auto_7011 ) ( CLEAR ?auto_7007 ) ( IS-CRATE ?auto_7006 ) ( not ( = ?auto_7006 ?auto_7007 ) ) ( AVAILABLE ?auto_7009 ) ( TRUCK-AT ?auto_7010 ?auto_7008 ) ( not ( = ?auto_7008 ?auto_7011 ) ) ( HOIST-AT ?auto_7012 ?auto_7008 ) ( not ( = ?auto_7009 ?auto_7012 ) ) ( AVAILABLE ?auto_7012 ) ( SURFACE-AT ?auto_7006 ?auto_7008 ) ( ON ?auto_7006 ?auto_7013 ) ( CLEAR ?auto_7006 ) ( not ( = ?auto_7006 ?auto_7013 ) ) ( not ( = ?auto_7007 ?auto_7013 ) ) )
    :subtasks
    ( ( !LIFT ?auto_7012 ?auto_7006 ?auto_7013 ?auto_7008 )
      ( MAKE-ON ?auto_7006 ?auto_7007 )
      ( MAKE-ON-VERIFY ?auto_7006 ?auto_7007 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_7014 - SURFACE
      ?auto_7015 - SURFACE
    )
    :vars
    (
      ?auto_7019 - HOIST
      ?auto_7018 - PLACE
      ?auto_7020 - PLACE
      ?auto_7017 - HOIST
      ?auto_7016 - SURFACE
      ?auto_7021 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7019 ?auto_7018 ) ( SURFACE-AT ?auto_7015 ?auto_7018 ) ( CLEAR ?auto_7015 ) ( IS-CRATE ?auto_7014 ) ( not ( = ?auto_7014 ?auto_7015 ) ) ( AVAILABLE ?auto_7019 ) ( not ( = ?auto_7020 ?auto_7018 ) ) ( HOIST-AT ?auto_7017 ?auto_7020 ) ( not ( = ?auto_7019 ?auto_7017 ) ) ( AVAILABLE ?auto_7017 ) ( SURFACE-AT ?auto_7014 ?auto_7020 ) ( ON ?auto_7014 ?auto_7016 ) ( CLEAR ?auto_7014 ) ( not ( = ?auto_7014 ?auto_7016 ) ) ( not ( = ?auto_7015 ?auto_7016 ) ) ( TRUCK-AT ?auto_7021 ?auto_7018 ) )
    :subtasks
    ( ( !DRIVE ?auto_7021 ?auto_7018 ?auto_7020 )
      ( MAKE-ON ?auto_7014 ?auto_7015 )
      ( MAKE-ON-VERIFY ?auto_7014 ?auto_7015 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_7022 - SURFACE
      ?auto_7023 - SURFACE
    )
    :vars
    (
      ?auto_7028 - HOIST
      ?auto_7027 - PLACE
      ?auto_7025 - PLACE
      ?auto_7024 - HOIST
      ?auto_7026 - SURFACE
      ?auto_7029 - TRUCK
      ?auto_7030 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7028 ?auto_7027 ) ( IS-CRATE ?auto_7022 ) ( not ( = ?auto_7022 ?auto_7023 ) ) ( not ( = ?auto_7025 ?auto_7027 ) ) ( HOIST-AT ?auto_7024 ?auto_7025 ) ( not ( = ?auto_7028 ?auto_7024 ) ) ( AVAILABLE ?auto_7024 ) ( SURFACE-AT ?auto_7022 ?auto_7025 ) ( ON ?auto_7022 ?auto_7026 ) ( CLEAR ?auto_7022 ) ( not ( = ?auto_7022 ?auto_7026 ) ) ( not ( = ?auto_7023 ?auto_7026 ) ) ( TRUCK-AT ?auto_7029 ?auto_7027 ) ( SURFACE-AT ?auto_7030 ?auto_7027 ) ( CLEAR ?auto_7030 ) ( LIFTING ?auto_7028 ?auto_7023 ) ( IS-CRATE ?auto_7023 ) ( not ( = ?auto_7022 ?auto_7030 ) ) ( not ( = ?auto_7023 ?auto_7030 ) ) ( not ( = ?auto_7026 ?auto_7030 ) ) )
    :subtasks
    ( ( !DROP ?auto_7028 ?auto_7023 ?auto_7030 ?auto_7027 )
      ( MAKE-ON ?auto_7022 ?auto_7023 )
      ( MAKE-ON-VERIFY ?auto_7022 ?auto_7023 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_7031 - SURFACE
      ?auto_7032 - SURFACE
    )
    :vars
    (
      ?auto_7039 - HOIST
      ?auto_7033 - PLACE
      ?auto_7037 - PLACE
      ?auto_7034 - HOIST
      ?auto_7036 - SURFACE
      ?auto_7038 - TRUCK
      ?auto_7035 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7039 ?auto_7033 ) ( IS-CRATE ?auto_7031 ) ( not ( = ?auto_7031 ?auto_7032 ) ) ( not ( = ?auto_7037 ?auto_7033 ) ) ( HOIST-AT ?auto_7034 ?auto_7037 ) ( not ( = ?auto_7039 ?auto_7034 ) ) ( AVAILABLE ?auto_7034 ) ( SURFACE-AT ?auto_7031 ?auto_7037 ) ( ON ?auto_7031 ?auto_7036 ) ( CLEAR ?auto_7031 ) ( not ( = ?auto_7031 ?auto_7036 ) ) ( not ( = ?auto_7032 ?auto_7036 ) ) ( TRUCK-AT ?auto_7038 ?auto_7033 ) ( SURFACE-AT ?auto_7035 ?auto_7033 ) ( CLEAR ?auto_7035 ) ( IS-CRATE ?auto_7032 ) ( not ( = ?auto_7031 ?auto_7035 ) ) ( not ( = ?auto_7032 ?auto_7035 ) ) ( not ( = ?auto_7036 ?auto_7035 ) ) ( AVAILABLE ?auto_7039 ) ( IN ?auto_7032 ?auto_7038 ) )
    :subtasks
    ( ( !UNLOAD ?auto_7039 ?auto_7032 ?auto_7038 ?auto_7033 )
      ( MAKE-ON ?auto_7031 ?auto_7032 )
      ( MAKE-ON-VERIFY ?auto_7031 ?auto_7032 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_7040 - SURFACE
      ?auto_7041 - SURFACE
    )
    :vars
    (
      ?auto_7048 - HOIST
      ?auto_7047 - PLACE
      ?auto_7043 - PLACE
      ?auto_7046 - HOIST
      ?auto_7042 - SURFACE
      ?auto_7044 - SURFACE
      ?auto_7045 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7048 ?auto_7047 ) ( IS-CRATE ?auto_7040 ) ( not ( = ?auto_7040 ?auto_7041 ) ) ( not ( = ?auto_7043 ?auto_7047 ) ) ( HOIST-AT ?auto_7046 ?auto_7043 ) ( not ( = ?auto_7048 ?auto_7046 ) ) ( AVAILABLE ?auto_7046 ) ( SURFACE-AT ?auto_7040 ?auto_7043 ) ( ON ?auto_7040 ?auto_7042 ) ( CLEAR ?auto_7040 ) ( not ( = ?auto_7040 ?auto_7042 ) ) ( not ( = ?auto_7041 ?auto_7042 ) ) ( SURFACE-AT ?auto_7044 ?auto_7047 ) ( CLEAR ?auto_7044 ) ( IS-CRATE ?auto_7041 ) ( not ( = ?auto_7040 ?auto_7044 ) ) ( not ( = ?auto_7041 ?auto_7044 ) ) ( not ( = ?auto_7042 ?auto_7044 ) ) ( AVAILABLE ?auto_7048 ) ( IN ?auto_7041 ?auto_7045 ) ( TRUCK-AT ?auto_7045 ?auto_7043 ) )
    :subtasks
    ( ( !DRIVE ?auto_7045 ?auto_7043 ?auto_7047 )
      ( MAKE-ON ?auto_7040 ?auto_7041 )
      ( MAKE-ON-VERIFY ?auto_7040 ?auto_7041 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_7049 - SURFACE
      ?auto_7050 - SURFACE
    )
    :vars
    (
      ?auto_7055 - HOIST
      ?auto_7051 - PLACE
      ?auto_7052 - PLACE
      ?auto_7056 - HOIST
      ?auto_7057 - SURFACE
      ?auto_7053 - SURFACE
      ?auto_7054 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7055 ?auto_7051 ) ( IS-CRATE ?auto_7049 ) ( not ( = ?auto_7049 ?auto_7050 ) ) ( not ( = ?auto_7052 ?auto_7051 ) ) ( HOIST-AT ?auto_7056 ?auto_7052 ) ( not ( = ?auto_7055 ?auto_7056 ) ) ( SURFACE-AT ?auto_7049 ?auto_7052 ) ( ON ?auto_7049 ?auto_7057 ) ( CLEAR ?auto_7049 ) ( not ( = ?auto_7049 ?auto_7057 ) ) ( not ( = ?auto_7050 ?auto_7057 ) ) ( SURFACE-AT ?auto_7053 ?auto_7051 ) ( CLEAR ?auto_7053 ) ( IS-CRATE ?auto_7050 ) ( not ( = ?auto_7049 ?auto_7053 ) ) ( not ( = ?auto_7050 ?auto_7053 ) ) ( not ( = ?auto_7057 ?auto_7053 ) ) ( AVAILABLE ?auto_7055 ) ( TRUCK-AT ?auto_7054 ?auto_7052 ) ( LIFTING ?auto_7056 ?auto_7050 ) )
    :subtasks
    ( ( !LOAD ?auto_7056 ?auto_7050 ?auto_7054 ?auto_7052 )
      ( MAKE-ON ?auto_7049 ?auto_7050 )
      ( MAKE-ON-VERIFY ?auto_7049 ?auto_7050 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_7058 - SURFACE
      ?auto_7059 - SURFACE
    )
    :vars
    (
      ?auto_7060 - HOIST
      ?auto_7062 - PLACE
      ?auto_7063 - PLACE
      ?auto_7065 - HOIST
      ?auto_7066 - SURFACE
      ?auto_7064 - SURFACE
      ?auto_7061 - TRUCK
      ?auto_7067 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7060 ?auto_7062 ) ( IS-CRATE ?auto_7058 ) ( not ( = ?auto_7058 ?auto_7059 ) ) ( not ( = ?auto_7063 ?auto_7062 ) ) ( HOIST-AT ?auto_7065 ?auto_7063 ) ( not ( = ?auto_7060 ?auto_7065 ) ) ( SURFACE-AT ?auto_7058 ?auto_7063 ) ( ON ?auto_7058 ?auto_7066 ) ( CLEAR ?auto_7058 ) ( not ( = ?auto_7058 ?auto_7066 ) ) ( not ( = ?auto_7059 ?auto_7066 ) ) ( SURFACE-AT ?auto_7064 ?auto_7062 ) ( CLEAR ?auto_7064 ) ( IS-CRATE ?auto_7059 ) ( not ( = ?auto_7058 ?auto_7064 ) ) ( not ( = ?auto_7059 ?auto_7064 ) ) ( not ( = ?auto_7066 ?auto_7064 ) ) ( AVAILABLE ?auto_7060 ) ( TRUCK-AT ?auto_7061 ?auto_7063 ) ( AVAILABLE ?auto_7065 ) ( SURFACE-AT ?auto_7059 ?auto_7063 ) ( ON ?auto_7059 ?auto_7067 ) ( CLEAR ?auto_7059 ) ( not ( = ?auto_7058 ?auto_7067 ) ) ( not ( = ?auto_7059 ?auto_7067 ) ) ( not ( = ?auto_7066 ?auto_7067 ) ) ( not ( = ?auto_7064 ?auto_7067 ) ) )
    :subtasks
    ( ( !LIFT ?auto_7065 ?auto_7059 ?auto_7067 ?auto_7063 )
      ( MAKE-ON ?auto_7058 ?auto_7059 )
      ( MAKE-ON-VERIFY ?auto_7058 ?auto_7059 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_7068 - SURFACE
      ?auto_7069 - SURFACE
    )
    :vars
    (
      ?auto_7073 - HOIST
      ?auto_7071 - PLACE
      ?auto_7072 - PLACE
      ?auto_7076 - HOIST
      ?auto_7070 - SURFACE
      ?auto_7074 - SURFACE
      ?auto_7077 - SURFACE
      ?auto_7075 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7073 ?auto_7071 ) ( IS-CRATE ?auto_7068 ) ( not ( = ?auto_7068 ?auto_7069 ) ) ( not ( = ?auto_7072 ?auto_7071 ) ) ( HOIST-AT ?auto_7076 ?auto_7072 ) ( not ( = ?auto_7073 ?auto_7076 ) ) ( SURFACE-AT ?auto_7068 ?auto_7072 ) ( ON ?auto_7068 ?auto_7070 ) ( CLEAR ?auto_7068 ) ( not ( = ?auto_7068 ?auto_7070 ) ) ( not ( = ?auto_7069 ?auto_7070 ) ) ( SURFACE-AT ?auto_7074 ?auto_7071 ) ( CLEAR ?auto_7074 ) ( IS-CRATE ?auto_7069 ) ( not ( = ?auto_7068 ?auto_7074 ) ) ( not ( = ?auto_7069 ?auto_7074 ) ) ( not ( = ?auto_7070 ?auto_7074 ) ) ( AVAILABLE ?auto_7073 ) ( AVAILABLE ?auto_7076 ) ( SURFACE-AT ?auto_7069 ?auto_7072 ) ( ON ?auto_7069 ?auto_7077 ) ( CLEAR ?auto_7069 ) ( not ( = ?auto_7068 ?auto_7077 ) ) ( not ( = ?auto_7069 ?auto_7077 ) ) ( not ( = ?auto_7070 ?auto_7077 ) ) ( not ( = ?auto_7074 ?auto_7077 ) ) ( TRUCK-AT ?auto_7075 ?auto_7071 ) )
    :subtasks
    ( ( !DRIVE ?auto_7075 ?auto_7071 ?auto_7072 )
      ( MAKE-ON ?auto_7068 ?auto_7069 )
      ( MAKE-ON-VERIFY ?auto_7068 ?auto_7069 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_7078 - SURFACE
      ?auto_7079 - SURFACE
    )
    :vars
    (
      ?auto_7087 - HOIST
      ?auto_7086 - PLACE
      ?auto_7085 - PLACE
      ?auto_7082 - HOIST
      ?auto_7080 - SURFACE
      ?auto_7083 - SURFACE
      ?auto_7081 - SURFACE
      ?auto_7084 - TRUCK
      ?auto_7088 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7087 ?auto_7086 ) ( IS-CRATE ?auto_7078 ) ( not ( = ?auto_7078 ?auto_7079 ) ) ( not ( = ?auto_7085 ?auto_7086 ) ) ( HOIST-AT ?auto_7082 ?auto_7085 ) ( not ( = ?auto_7087 ?auto_7082 ) ) ( SURFACE-AT ?auto_7078 ?auto_7085 ) ( ON ?auto_7078 ?auto_7080 ) ( CLEAR ?auto_7078 ) ( not ( = ?auto_7078 ?auto_7080 ) ) ( not ( = ?auto_7079 ?auto_7080 ) ) ( IS-CRATE ?auto_7079 ) ( not ( = ?auto_7078 ?auto_7083 ) ) ( not ( = ?auto_7079 ?auto_7083 ) ) ( not ( = ?auto_7080 ?auto_7083 ) ) ( AVAILABLE ?auto_7082 ) ( SURFACE-AT ?auto_7079 ?auto_7085 ) ( ON ?auto_7079 ?auto_7081 ) ( CLEAR ?auto_7079 ) ( not ( = ?auto_7078 ?auto_7081 ) ) ( not ( = ?auto_7079 ?auto_7081 ) ) ( not ( = ?auto_7080 ?auto_7081 ) ) ( not ( = ?auto_7083 ?auto_7081 ) ) ( TRUCK-AT ?auto_7084 ?auto_7086 ) ( SURFACE-AT ?auto_7088 ?auto_7086 ) ( CLEAR ?auto_7088 ) ( LIFTING ?auto_7087 ?auto_7083 ) ( IS-CRATE ?auto_7083 ) ( not ( = ?auto_7078 ?auto_7088 ) ) ( not ( = ?auto_7079 ?auto_7088 ) ) ( not ( = ?auto_7080 ?auto_7088 ) ) ( not ( = ?auto_7083 ?auto_7088 ) ) ( not ( = ?auto_7081 ?auto_7088 ) ) )
    :subtasks
    ( ( !DROP ?auto_7087 ?auto_7083 ?auto_7088 ?auto_7086 )
      ( MAKE-ON ?auto_7078 ?auto_7079 )
      ( MAKE-ON-VERIFY ?auto_7078 ?auto_7079 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_7089 - SURFACE
      ?auto_7090 - SURFACE
    )
    :vars
    (
      ?auto_7099 - HOIST
      ?auto_7092 - PLACE
      ?auto_7097 - PLACE
      ?auto_7096 - HOIST
      ?auto_7094 - SURFACE
      ?auto_7091 - SURFACE
      ?auto_7095 - SURFACE
      ?auto_7098 - TRUCK
      ?auto_7093 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7099 ?auto_7092 ) ( IS-CRATE ?auto_7089 ) ( not ( = ?auto_7089 ?auto_7090 ) ) ( not ( = ?auto_7097 ?auto_7092 ) ) ( HOIST-AT ?auto_7096 ?auto_7097 ) ( not ( = ?auto_7099 ?auto_7096 ) ) ( SURFACE-AT ?auto_7089 ?auto_7097 ) ( ON ?auto_7089 ?auto_7094 ) ( CLEAR ?auto_7089 ) ( not ( = ?auto_7089 ?auto_7094 ) ) ( not ( = ?auto_7090 ?auto_7094 ) ) ( IS-CRATE ?auto_7090 ) ( not ( = ?auto_7089 ?auto_7091 ) ) ( not ( = ?auto_7090 ?auto_7091 ) ) ( not ( = ?auto_7094 ?auto_7091 ) ) ( AVAILABLE ?auto_7096 ) ( SURFACE-AT ?auto_7090 ?auto_7097 ) ( ON ?auto_7090 ?auto_7095 ) ( CLEAR ?auto_7090 ) ( not ( = ?auto_7089 ?auto_7095 ) ) ( not ( = ?auto_7090 ?auto_7095 ) ) ( not ( = ?auto_7094 ?auto_7095 ) ) ( not ( = ?auto_7091 ?auto_7095 ) ) ( TRUCK-AT ?auto_7098 ?auto_7092 ) ( SURFACE-AT ?auto_7093 ?auto_7092 ) ( CLEAR ?auto_7093 ) ( IS-CRATE ?auto_7091 ) ( not ( = ?auto_7089 ?auto_7093 ) ) ( not ( = ?auto_7090 ?auto_7093 ) ) ( not ( = ?auto_7094 ?auto_7093 ) ) ( not ( = ?auto_7091 ?auto_7093 ) ) ( not ( = ?auto_7095 ?auto_7093 ) ) ( AVAILABLE ?auto_7099 ) ( IN ?auto_7091 ?auto_7098 ) )
    :subtasks
    ( ( !UNLOAD ?auto_7099 ?auto_7091 ?auto_7098 ?auto_7092 )
      ( MAKE-ON ?auto_7089 ?auto_7090 )
      ( MAKE-ON-VERIFY ?auto_7089 ?auto_7090 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_7100 - SURFACE
      ?auto_7101 - SURFACE
    )
    :vars
    (
      ?auto_7104 - HOIST
      ?auto_7102 - PLACE
      ?auto_7109 - PLACE
      ?auto_7110 - HOIST
      ?auto_7108 - SURFACE
      ?auto_7106 - SURFACE
      ?auto_7105 - SURFACE
      ?auto_7103 - SURFACE
      ?auto_7107 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7104 ?auto_7102 ) ( IS-CRATE ?auto_7100 ) ( not ( = ?auto_7100 ?auto_7101 ) ) ( not ( = ?auto_7109 ?auto_7102 ) ) ( HOIST-AT ?auto_7110 ?auto_7109 ) ( not ( = ?auto_7104 ?auto_7110 ) ) ( SURFACE-AT ?auto_7100 ?auto_7109 ) ( ON ?auto_7100 ?auto_7108 ) ( CLEAR ?auto_7100 ) ( not ( = ?auto_7100 ?auto_7108 ) ) ( not ( = ?auto_7101 ?auto_7108 ) ) ( IS-CRATE ?auto_7101 ) ( not ( = ?auto_7100 ?auto_7106 ) ) ( not ( = ?auto_7101 ?auto_7106 ) ) ( not ( = ?auto_7108 ?auto_7106 ) ) ( AVAILABLE ?auto_7110 ) ( SURFACE-AT ?auto_7101 ?auto_7109 ) ( ON ?auto_7101 ?auto_7105 ) ( CLEAR ?auto_7101 ) ( not ( = ?auto_7100 ?auto_7105 ) ) ( not ( = ?auto_7101 ?auto_7105 ) ) ( not ( = ?auto_7108 ?auto_7105 ) ) ( not ( = ?auto_7106 ?auto_7105 ) ) ( SURFACE-AT ?auto_7103 ?auto_7102 ) ( CLEAR ?auto_7103 ) ( IS-CRATE ?auto_7106 ) ( not ( = ?auto_7100 ?auto_7103 ) ) ( not ( = ?auto_7101 ?auto_7103 ) ) ( not ( = ?auto_7108 ?auto_7103 ) ) ( not ( = ?auto_7106 ?auto_7103 ) ) ( not ( = ?auto_7105 ?auto_7103 ) ) ( AVAILABLE ?auto_7104 ) ( IN ?auto_7106 ?auto_7107 ) ( TRUCK-AT ?auto_7107 ?auto_7109 ) )
    :subtasks
    ( ( !DRIVE ?auto_7107 ?auto_7109 ?auto_7102 )
      ( MAKE-ON ?auto_7100 ?auto_7101 )
      ( MAKE-ON-VERIFY ?auto_7100 ?auto_7101 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_7111 - SURFACE
      ?auto_7112 - SURFACE
    )
    :vars
    (
      ?auto_7114 - HOIST
      ?auto_7113 - PLACE
      ?auto_7119 - PLACE
      ?auto_7116 - HOIST
      ?auto_7121 - SURFACE
      ?auto_7117 - SURFACE
      ?auto_7115 - SURFACE
      ?auto_7118 - SURFACE
      ?auto_7120 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7114 ?auto_7113 ) ( IS-CRATE ?auto_7111 ) ( not ( = ?auto_7111 ?auto_7112 ) ) ( not ( = ?auto_7119 ?auto_7113 ) ) ( HOIST-AT ?auto_7116 ?auto_7119 ) ( not ( = ?auto_7114 ?auto_7116 ) ) ( SURFACE-AT ?auto_7111 ?auto_7119 ) ( ON ?auto_7111 ?auto_7121 ) ( CLEAR ?auto_7111 ) ( not ( = ?auto_7111 ?auto_7121 ) ) ( not ( = ?auto_7112 ?auto_7121 ) ) ( IS-CRATE ?auto_7112 ) ( not ( = ?auto_7111 ?auto_7117 ) ) ( not ( = ?auto_7112 ?auto_7117 ) ) ( not ( = ?auto_7121 ?auto_7117 ) ) ( SURFACE-AT ?auto_7112 ?auto_7119 ) ( ON ?auto_7112 ?auto_7115 ) ( CLEAR ?auto_7112 ) ( not ( = ?auto_7111 ?auto_7115 ) ) ( not ( = ?auto_7112 ?auto_7115 ) ) ( not ( = ?auto_7121 ?auto_7115 ) ) ( not ( = ?auto_7117 ?auto_7115 ) ) ( SURFACE-AT ?auto_7118 ?auto_7113 ) ( CLEAR ?auto_7118 ) ( IS-CRATE ?auto_7117 ) ( not ( = ?auto_7111 ?auto_7118 ) ) ( not ( = ?auto_7112 ?auto_7118 ) ) ( not ( = ?auto_7121 ?auto_7118 ) ) ( not ( = ?auto_7117 ?auto_7118 ) ) ( not ( = ?auto_7115 ?auto_7118 ) ) ( AVAILABLE ?auto_7114 ) ( TRUCK-AT ?auto_7120 ?auto_7119 ) ( LIFTING ?auto_7116 ?auto_7117 ) )
    :subtasks
    ( ( !LOAD ?auto_7116 ?auto_7117 ?auto_7120 ?auto_7119 )
      ( MAKE-ON ?auto_7111 ?auto_7112 )
      ( MAKE-ON-VERIFY ?auto_7111 ?auto_7112 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_7122 - SURFACE
      ?auto_7123 - SURFACE
    )
    :vars
    (
      ?auto_7127 - HOIST
      ?auto_7132 - PLACE
      ?auto_7124 - PLACE
      ?auto_7129 - HOIST
      ?auto_7128 - SURFACE
      ?auto_7130 - SURFACE
      ?auto_7125 - SURFACE
      ?auto_7126 - SURFACE
      ?auto_7131 - TRUCK
      ?auto_7133 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7127 ?auto_7132 ) ( IS-CRATE ?auto_7122 ) ( not ( = ?auto_7122 ?auto_7123 ) ) ( not ( = ?auto_7124 ?auto_7132 ) ) ( HOIST-AT ?auto_7129 ?auto_7124 ) ( not ( = ?auto_7127 ?auto_7129 ) ) ( SURFACE-AT ?auto_7122 ?auto_7124 ) ( ON ?auto_7122 ?auto_7128 ) ( CLEAR ?auto_7122 ) ( not ( = ?auto_7122 ?auto_7128 ) ) ( not ( = ?auto_7123 ?auto_7128 ) ) ( IS-CRATE ?auto_7123 ) ( not ( = ?auto_7122 ?auto_7130 ) ) ( not ( = ?auto_7123 ?auto_7130 ) ) ( not ( = ?auto_7128 ?auto_7130 ) ) ( SURFACE-AT ?auto_7123 ?auto_7124 ) ( ON ?auto_7123 ?auto_7125 ) ( CLEAR ?auto_7123 ) ( not ( = ?auto_7122 ?auto_7125 ) ) ( not ( = ?auto_7123 ?auto_7125 ) ) ( not ( = ?auto_7128 ?auto_7125 ) ) ( not ( = ?auto_7130 ?auto_7125 ) ) ( SURFACE-AT ?auto_7126 ?auto_7132 ) ( CLEAR ?auto_7126 ) ( IS-CRATE ?auto_7130 ) ( not ( = ?auto_7122 ?auto_7126 ) ) ( not ( = ?auto_7123 ?auto_7126 ) ) ( not ( = ?auto_7128 ?auto_7126 ) ) ( not ( = ?auto_7130 ?auto_7126 ) ) ( not ( = ?auto_7125 ?auto_7126 ) ) ( AVAILABLE ?auto_7127 ) ( TRUCK-AT ?auto_7131 ?auto_7124 ) ( AVAILABLE ?auto_7129 ) ( SURFACE-AT ?auto_7130 ?auto_7124 ) ( ON ?auto_7130 ?auto_7133 ) ( CLEAR ?auto_7130 ) ( not ( = ?auto_7122 ?auto_7133 ) ) ( not ( = ?auto_7123 ?auto_7133 ) ) ( not ( = ?auto_7128 ?auto_7133 ) ) ( not ( = ?auto_7130 ?auto_7133 ) ) ( not ( = ?auto_7125 ?auto_7133 ) ) ( not ( = ?auto_7126 ?auto_7133 ) ) )
    :subtasks
    ( ( !LIFT ?auto_7129 ?auto_7130 ?auto_7133 ?auto_7124 )
      ( MAKE-ON ?auto_7122 ?auto_7123 )
      ( MAKE-ON-VERIFY ?auto_7122 ?auto_7123 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_7134 - SURFACE
      ?auto_7135 - SURFACE
    )
    :vars
    (
      ?auto_7144 - HOIST
      ?auto_7137 - PLACE
      ?auto_7141 - PLACE
      ?auto_7145 - HOIST
      ?auto_7136 - SURFACE
      ?auto_7139 - SURFACE
      ?auto_7138 - SURFACE
      ?auto_7140 - SURFACE
      ?auto_7142 - SURFACE
      ?auto_7143 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7144 ?auto_7137 ) ( IS-CRATE ?auto_7134 ) ( not ( = ?auto_7134 ?auto_7135 ) ) ( not ( = ?auto_7141 ?auto_7137 ) ) ( HOIST-AT ?auto_7145 ?auto_7141 ) ( not ( = ?auto_7144 ?auto_7145 ) ) ( SURFACE-AT ?auto_7134 ?auto_7141 ) ( ON ?auto_7134 ?auto_7136 ) ( CLEAR ?auto_7134 ) ( not ( = ?auto_7134 ?auto_7136 ) ) ( not ( = ?auto_7135 ?auto_7136 ) ) ( IS-CRATE ?auto_7135 ) ( not ( = ?auto_7134 ?auto_7139 ) ) ( not ( = ?auto_7135 ?auto_7139 ) ) ( not ( = ?auto_7136 ?auto_7139 ) ) ( SURFACE-AT ?auto_7135 ?auto_7141 ) ( ON ?auto_7135 ?auto_7138 ) ( CLEAR ?auto_7135 ) ( not ( = ?auto_7134 ?auto_7138 ) ) ( not ( = ?auto_7135 ?auto_7138 ) ) ( not ( = ?auto_7136 ?auto_7138 ) ) ( not ( = ?auto_7139 ?auto_7138 ) ) ( SURFACE-AT ?auto_7140 ?auto_7137 ) ( CLEAR ?auto_7140 ) ( IS-CRATE ?auto_7139 ) ( not ( = ?auto_7134 ?auto_7140 ) ) ( not ( = ?auto_7135 ?auto_7140 ) ) ( not ( = ?auto_7136 ?auto_7140 ) ) ( not ( = ?auto_7139 ?auto_7140 ) ) ( not ( = ?auto_7138 ?auto_7140 ) ) ( AVAILABLE ?auto_7144 ) ( AVAILABLE ?auto_7145 ) ( SURFACE-AT ?auto_7139 ?auto_7141 ) ( ON ?auto_7139 ?auto_7142 ) ( CLEAR ?auto_7139 ) ( not ( = ?auto_7134 ?auto_7142 ) ) ( not ( = ?auto_7135 ?auto_7142 ) ) ( not ( = ?auto_7136 ?auto_7142 ) ) ( not ( = ?auto_7139 ?auto_7142 ) ) ( not ( = ?auto_7138 ?auto_7142 ) ) ( not ( = ?auto_7140 ?auto_7142 ) ) ( TRUCK-AT ?auto_7143 ?auto_7137 ) )
    :subtasks
    ( ( !DRIVE ?auto_7143 ?auto_7137 ?auto_7141 )
      ( MAKE-ON ?auto_7134 ?auto_7135 )
      ( MAKE-ON-VERIFY ?auto_7134 ?auto_7135 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_7146 - SURFACE
      ?auto_7147 - SURFACE
    )
    :vars
    (
      ?auto_7152 - HOIST
      ?auto_7156 - PLACE
      ?auto_7153 - PLACE
      ?auto_7148 - HOIST
      ?auto_7151 - SURFACE
      ?auto_7157 - SURFACE
      ?auto_7154 - SURFACE
      ?auto_7150 - SURFACE
      ?auto_7149 - SURFACE
      ?auto_7155 - TRUCK
      ?auto_7158 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7152 ?auto_7156 ) ( IS-CRATE ?auto_7146 ) ( not ( = ?auto_7146 ?auto_7147 ) ) ( not ( = ?auto_7153 ?auto_7156 ) ) ( HOIST-AT ?auto_7148 ?auto_7153 ) ( not ( = ?auto_7152 ?auto_7148 ) ) ( SURFACE-AT ?auto_7146 ?auto_7153 ) ( ON ?auto_7146 ?auto_7151 ) ( CLEAR ?auto_7146 ) ( not ( = ?auto_7146 ?auto_7151 ) ) ( not ( = ?auto_7147 ?auto_7151 ) ) ( IS-CRATE ?auto_7147 ) ( not ( = ?auto_7146 ?auto_7157 ) ) ( not ( = ?auto_7147 ?auto_7157 ) ) ( not ( = ?auto_7151 ?auto_7157 ) ) ( SURFACE-AT ?auto_7147 ?auto_7153 ) ( ON ?auto_7147 ?auto_7154 ) ( CLEAR ?auto_7147 ) ( not ( = ?auto_7146 ?auto_7154 ) ) ( not ( = ?auto_7147 ?auto_7154 ) ) ( not ( = ?auto_7151 ?auto_7154 ) ) ( not ( = ?auto_7157 ?auto_7154 ) ) ( IS-CRATE ?auto_7157 ) ( not ( = ?auto_7146 ?auto_7150 ) ) ( not ( = ?auto_7147 ?auto_7150 ) ) ( not ( = ?auto_7151 ?auto_7150 ) ) ( not ( = ?auto_7157 ?auto_7150 ) ) ( not ( = ?auto_7154 ?auto_7150 ) ) ( AVAILABLE ?auto_7148 ) ( SURFACE-AT ?auto_7157 ?auto_7153 ) ( ON ?auto_7157 ?auto_7149 ) ( CLEAR ?auto_7157 ) ( not ( = ?auto_7146 ?auto_7149 ) ) ( not ( = ?auto_7147 ?auto_7149 ) ) ( not ( = ?auto_7151 ?auto_7149 ) ) ( not ( = ?auto_7157 ?auto_7149 ) ) ( not ( = ?auto_7154 ?auto_7149 ) ) ( not ( = ?auto_7150 ?auto_7149 ) ) ( TRUCK-AT ?auto_7155 ?auto_7156 ) ( SURFACE-AT ?auto_7158 ?auto_7156 ) ( CLEAR ?auto_7158 ) ( LIFTING ?auto_7152 ?auto_7150 ) ( IS-CRATE ?auto_7150 ) ( not ( = ?auto_7146 ?auto_7158 ) ) ( not ( = ?auto_7147 ?auto_7158 ) ) ( not ( = ?auto_7151 ?auto_7158 ) ) ( not ( = ?auto_7157 ?auto_7158 ) ) ( not ( = ?auto_7154 ?auto_7158 ) ) ( not ( = ?auto_7150 ?auto_7158 ) ) ( not ( = ?auto_7149 ?auto_7158 ) ) )
    :subtasks
    ( ( !DROP ?auto_7152 ?auto_7150 ?auto_7158 ?auto_7156 )
      ( MAKE-ON ?auto_7146 ?auto_7147 )
      ( MAKE-ON-VERIFY ?auto_7146 ?auto_7147 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_7159 - SURFACE
      ?auto_7160 - SURFACE
    )
    :vars
    (
      ?auto_7163 - HOIST
      ?auto_7171 - PLACE
      ?auto_7162 - PLACE
      ?auto_7168 - HOIST
      ?auto_7167 - SURFACE
      ?auto_7165 - SURFACE
      ?auto_7169 - SURFACE
      ?auto_7166 - SURFACE
      ?auto_7161 - SURFACE
      ?auto_7164 - TRUCK
      ?auto_7170 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7163 ?auto_7171 ) ( IS-CRATE ?auto_7159 ) ( not ( = ?auto_7159 ?auto_7160 ) ) ( not ( = ?auto_7162 ?auto_7171 ) ) ( HOIST-AT ?auto_7168 ?auto_7162 ) ( not ( = ?auto_7163 ?auto_7168 ) ) ( SURFACE-AT ?auto_7159 ?auto_7162 ) ( ON ?auto_7159 ?auto_7167 ) ( CLEAR ?auto_7159 ) ( not ( = ?auto_7159 ?auto_7167 ) ) ( not ( = ?auto_7160 ?auto_7167 ) ) ( IS-CRATE ?auto_7160 ) ( not ( = ?auto_7159 ?auto_7165 ) ) ( not ( = ?auto_7160 ?auto_7165 ) ) ( not ( = ?auto_7167 ?auto_7165 ) ) ( SURFACE-AT ?auto_7160 ?auto_7162 ) ( ON ?auto_7160 ?auto_7169 ) ( CLEAR ?auto_7160 ) ( not ( = ?auto_7159 ?auto_7169 ) ) ( not ( = ?auto_7160 ?auto_7169 ) ) ( not ( = ?auto_7167 ?auto_7169 ) ) ( not ( = ?auto_7165 ?auto_7169 ) ) ( IS-CRATE ?auto_7165 ) ( not ( = ?auto_7159 ?auto_7166 ) ) ( not ( = ?auto_7160 ?auto_7166 ) ) ( not ( = ?auto_7167 ?auto_7166 ) ) ( not ( = ?auto_7165 ?auto_7166 ) ) ( not ( = ?auto_7169 ?auto_7166 ) ) ( AVAILABLE ?auto_7168 ) ( SURFACE-AT ?auto_7165 ?auto_7162 ) ( ON ?auto_7165 ?auto_7161 ) ( CLEAR ?auto_7165 ) ( not ( = ?auto_7159 ?auto_7161 ) ) ( not ( = ?auto_7160 ?auto_7161 ) ) ( not ( = ?auto_7167 ?auto_7161 ) ) ( not ( = ?auto_7165 ?auto_7161 ) ) ( not ( = ?auto_7169 ?auto_7161 ) ) ( not ( = ?auto_7166 ?auto_7161 ) ) ( TRUCK-AT ?auto_7164 ?auto_7171 ) ( SURFACE-AT ?auto_7170 ?auto_7171 ) ( CLEAR ?auto_7170 ) ( IS-CRATE ?auto_7166 ) ( not ( = ?auto_7159 ?auto_7170 ) ) ( not ( = ?auto_7160 ?auto_7170 ) ) ( not ( = ?auto_7167 ?auto_7170 ) ) ( not ( = ?auto_7165 ?auto_7170 ) ) ( not ( = ?auto_7169 ?auto_7170 ) ) ( not ( = ?auto_7166 ?auto_7170 ) ) ( not ( = ?auto_7161 ?auto_7170 ) ) ( AVAILABLE ?auto_7163 ) ( IN ?auto_7166 ?auto_7164 ) )
    :subtasks
    ( ( !UNLOAD ?auto_7163 ?auto_7166 ?auto_7164 ?auto_7171 )
      ( MAKE-ON ?auto_7159 ?auto_7160 )
      ( MAKE-ON-VERIFY ?auto_7159 ?auto_7160 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_7172 - SURFACE
      ?auto_7173 - SURFACE
    )
    :vars
    (
      ?auto_7180 - HOIST
      ?auto_7182 - PLACE
      ?auto_7179 - PLACE
      ?auto_7183 - HOIST
      ?auto_7177 - SURFACE
      ?auto_7176 - SURFACE
      ?auto_7174 - SURFACE
      ?auto_7181 - SURFACE
      ?auto_7175 - SURFACE
      ?auto_7184 - SURFACE
      ?auto_7178 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7180 ?auto_7182 ) ( IS-CRATE ?auto_7172 ) ( not ( = ?auto_7172 ?auto_7173 ) ) ( not ( = ?auto_7179 ?auto_7182 ) ) ( HOIST-AT ?auto_7183 ?auto_7179 ) ( not ( = ?auto_7180 ?auto_7183 ) ) ( SURFACE-AT ?auto_7172 ?auto_7179 ) ( ON ?auto_7172 ?auto_7177 ) ( CLEAR ?auto_7172 ) ( not ( = ?auto_7172 ?auto_7177 ) ) ( not ( = ?auto_7173 ?auto_7177 ) ) ( IS-CRATE ?auto_7173 ) ( not ( = ?auto_7172 ?auto_7176 ) ) ( not ( = ?auto_7173 ?auto_7176 ) ) ( not ( = ?auto_7177 ?auto_7176 ) ) ( SURFACE-AT ?auto_7173 ?auto_7179 ) ( ON ?auto_7173 ?auto_7174 ) ( CLEAR ?auto_7173 ) ( not ( = ?auto_7172 ?auto_7174 ) ) ( not ( = ?auto_7173 ?auto_7174 ) ) ( not ( = ?auto_7177 ?auto_7174 ) ) ( not ( = ?auto_7176 ?auto_7174 ) ) ( IS-CRATE ?auto_7176 ) ( not ( = ?auto_7172 ?auto_7181 ) ) ( not ( = ?auto_7173 ?auto_7181 ) ) ( not ( = ?auto_7177 ?auto_7181 ) ) ( not ( = ?auto_7176 ?auto_7181 ) ) ( not ( = ?auto_7174 ?auto_7181 ) ) ( AVAILABLE ?auto_7183 ) ( SURFACE-AT ?auto_7176 ?auto_7179 ) ( ON ?auto_7176 ?auto_7175 ) ( CLEAR ?auto_7176 ) ( not ( = ?auto_7172 ?auto_7175 ) ) ( not ( = ?auto_7173 ?auto_7175 ) ) ( not ( = ?auto_7177 ?auto_7175 ) ) ( not ( = ?auto_7176 ?auto_7175 ) ) ( not ( = ?auto_7174 ?auto_7175 ) ) ( not ( = ?auto_7181 ?auto_7175 ) ) ( SURFACE-AT ?auto_7184 ?auto_7182 ) ( CLEAR ?auto_7184 ) ( IS-CRATE ?auto_7181 ) ( not ( = ?auto_7172 ?auto_7184 ) ) ( not ( = ?auto_7173 ?auto_7184 ) ) ( not ( = ?auto_7177 ?auto_7184 ) ) ( not ( = ?auto_7176 ?auto_7184 ) ) ( not ( = ?auto_7174 ?auto_7184 ) ) ( not ( = ?auto_7181 ?auto_7184 ) ) ( not ( = ?auto_7175 ?auto_7184 ) ) ( AVAILABLE ?auto_7180 ) ( IN ?auto_7181 ?auto_7178 ) ( TRUCK-AT ?auto_7178 ?auto_7179 ) )
    :subtasks
    ( ( !DRIVE ?auto_7178 ?auto_7179 ?auto_7182 )
      ( MAKE-ON ?auto_7172 ?auto_7173 )
      ( MAKE-ON-VERIFY ?auto_7172 ?auto_7173 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_7185 - SURFACE
      ?auto_7186 - SURFACE
    )
    :vars
    (
      ?auto_7195 - HOIST
      ?auto_7190 - PLACE
      ?auto_7192 - PLACE
      ?auto_7197 - HOIST
      ?auto_7194 - SURFACE
      ?auto_7191 - SURFACE
      ?auto_7187 - SURFACE
      ?auto_7189 - SURFACE
      ?auto_7196 - SURFACE
      ?auto_7188 - SURFACE
      ?auto_7193 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7195 ?auto_7190 ) ( IS-CRATE ?auto_7185 ) ( not ( = ?auto_7185 ?auto_7186 ) ) ( not ( = ?auto_7192 ?auto_7190 ) ) ( HOIST-AT ?auto_7197 ?auto_7192 ) ( not ( = ?auto_7195 ?auto_7197 ) ) ( SURFACE-AT ?auto_7185 ?auto_7192 ) ( ON ?auto_7185 ?auto_7194 ) ( CLEAR ?auto_7185 ) ( not ( = ?auto_7185 ?auto_7194 ) ) ( not ( = ?auto_7186 ?auto_7194 ) ) ( IS-CRATE ?auto_7186 ) ( not ( = ?auto_7185 ?auto_7191 ) ) ( not ( = ?auto_7186 ?auto_7191 ) ) ( not ( = ?auto_7194 ?auto_7191 ) ) ( SURFACE-AT ?auto_7186 ?auto_7192 ) ( ON ?auto_7186 ?auto_7187 ) ( CLEAR ?auto_7186 ) ( not ( = ?auto_7185 ?auto_7187 ) ) ( not ( = ?auto_7186 ?auto_7187 ) ) ( not ( = ?auto_7194 ?auto_7187 ) ) ( not ( = ?auto_7191 ?auto_7187 ) ) ( IS-CRATE ?auto_7191 ) ( not ( = ?auto_7185 ?auto_7189 ) ) ( not ( = ?auto_7186 ?auto_7189 ) ) ( not ( = ?auto_7194 ?auto_7189 ) ) ( not ( = ?auto_7191 ?auto_7189 ) ) ( not ( = ?auto_7187 ?auto_7189 ) ) ( SURFACE-AT ?auto_7191 ?auto_7192 ) ( ON ?auto_7191 ?auto_7196 ) ( CLEAR ?auto_7191 ) ( not ( = ?auto_7185 ?auto_7196 ) ) ( not ( = ?auto_7186 ?auto_7196 ) ) ( not ( = ?auto_7194 ?auto_7196 ) ) ( not ( = ?auto_7191 ?auto_7196 ) ) ( not ( = ?auto_7187 ?auto_7196 ) ) ( not ( = ?auto_7189 ?auto_7196 ) ) ( SURFACE-AT ?auto_7188 ?auto_7190 ) ( CLEAR ?auto_7188 ) ( IS-CRATE ?auto_7189 ) ( not ( = ?auto_7185 ?auto_7188 ) ) ( not ( = ?auto_7186 ?auto_7188 ) ) ( not ( = ?auto_7194 ?auto_7188 ) ) ( not ( = ?auto_7191 ?auto_7188 ) ) ( not ( = ?auto_7187 ?auto_7188 ) ) ( not ( = ?auto_7189 ?auto_7188 ) ) ( not ( = ?auto_7196 ?auto_7188 ) ) ( AVAILABLE ?auto_7195 ) ( TRUCK-AT ?auto_7193 ?auto_7192 ) ( LIFTING ?auto_7197 ?auto_7189 ) )
    :subtasks
    ( ( !LOAD ?auto_7197 ?auto_7189 ?auto_7193 ?auto_7192 )
      ( MAKE-ON ?auto_7185 ?auto_7186 )
      ( MAKE-ON-VERIFY ?auto_7185 ?auto_7186 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_7198 - SURFACE
      ?auto_7199 - SURFACE
    )
    :vars
    (
      ?auto_7201 - HOIST
      ?auto_7204 - PLACE
      ?auto_7209 - PLACE
      ?auto_7208 - HOIST
      ?auto_7210 - SURFACE
      ?auto_7202 - SURFACE
      ?auto_7200 - SURFACE
      ?auto_7206 - SURFACE
      ?auto_7205 - SURFACE
      ?auto_7207 - SURFACE
      ?auto_7203 - TRUCK
      ?auto_7211 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7201 ?auto_7204 ) ( IS-CRATE ?auto_7198 ) ( not ( = ?auto_7198 ?auto_7199 ) ) ( not ( = ?auto_7209 ?auto_7204 ) ) ( HOIST-AT ?auto_7208 ?auto_7209 ) ( not ( = ?auto_7201 ?auto_7208 ) ) ( SURFACE-AT ?auto_7198 ?auto_7209 ) ( ON ?auto_7198 ?auto_7210 ) ( CLEAR ?auto_7198 ) ( not ( = ?auto_7198 ?auto_7210 ) ) ( not ( = ?auto_7199 ?auto_7210 ) ) ( IS-CRATE ?auto_7199 ) ( not ( = ?auto_7198 ?auto_7202 ) ) ( not ( = ?auto_7199 ?auto_7202 ) ) ( not ( = ?auto_7210 ?auto_7202 ) ) ( SURFACE-AT ?auto_7199 ?auto_7209 ) ( ON ?auto_7199 ?auto_7200 ) ( CLEAR ?auto_7199 ) ( not ( = ?auto_7198 ?auto_7200 ) ) ( not ( = ?auto_7199 ?auto_7200 ) ) ( not ( = ?auto_7210 ?auto_7200 ) ) ( not ( = ?auto_7202 ?auto_7200 ) ) ( IS-CRATE ?auto_7202 ) ( not ( = ?auto_7198 ?auto_7206 ) ) ( not ( = ?auto_7199 ?auto_7206 ) ) ( not ( = ?auto_7210 ?auto_7206 ) ) ( not ( = ?auto_7202 ?auto_7206 ) ) ( not ( = ?auto_7200 ?auto_7206 ) ) ( SURFACE-AT ?auto_7202 ?auto_7209 ) ( ON ?auto_7202 ?auto_7205 ) ( CLEAR ?auto_7202 ) ( not ( = ?auto_7198 ?auto_7205 ) ) ( not ( = ?auto_7199 ?auto_7205 ) ) ( not ( = ?auto_7210 ?auto_7205 ) ) ( not ( = ?auto_7202 ?auto_7205 ) ) ( not ( = ?auto_7200 ?auto_7205 ) ) ( not ( = ?auto_7206 ?auto_7205 ) ) ( SURFACE-AT ?auto_7207 ?auto_7204 ) ( CLEAR ?auto_7207 ) ( IS-CRATE ?auto_7206 ) ( not ( = ?auto_7198 ?auto_7207 ) ) ( not ( = ?auto_7199 ?auto_7207 ) ) ( not ( = ?auto_7210 ?auto_7207 ) ) ( not ( = ?auto_7202 ?auto_7207 ) ) ( not ( = ?auto_7200 ?auto_7207 ) ) ( not ( = ?auto_7206 ?auto_7207 ) ) ( not ( = ?auto_7205 ?auto_7207 ) ) ( AVAILABLE ?auto_7201 ) ( TRUCK-AT ?auto_7203 ?auto_7209 ) ( AVAILABLE ?auto_7208 ) ( SURFACE-AT ?auto_7206 ?auto_7209 ) ( ON ?auto_7206 ?auto_7211 ) ( CLEAR ?auto_7206 ) ( not ( = ?auto_7198 ?auto_7211 ) ) ( not ( = ?auto_7199 ?auto_7211 ) ) ( not ( = ?auto_7210 ?auto_7211 ) ) ( not ( = ?auto_7202 ?auto_7211 ) ) ( not ( = ?auto_7200 ?auto_7211 ) ) ( not ( = ?auto_7206 ?auto_7211 ) ) ( not ( = ?auto_7205 ?auto_7211 ) ) ( not ( = ?auto_7207 ?auto_7211 ) ) )
    :subtasks
    ( ( !LIFT ?auto_7208 ?auto_7206 ?auto_7211 ?auto_7209 )
      ( MAKE-ON ?auto_7198 ?auto_7199 )
      ( MAKE-ON-VERIFY ?auto_7198 ?auto_7199 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_7212 - SURFACE
      ?auto_7213 - SURFACE
    )
    :vars
    (
      ?auto_7217 - HOIST
      ?auto_7224 - PLACE
      ?auto_7223 - PLACE
      ?auto_7225 - HOIST
      ?auto_7216 - SURFACE
      ?auto_7221 - SURFACE
      ?auto_7218 - SURFACE
      ?auto_7219 - SURFACE
      ?auto_7215 - SURFACE
      ?auto_7214 - SURFACE
      ?auto_7222 - SURFACE
      ?auto_7220 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7217 ?auto_7224 ) ( IS-CRATE ?auto_7212 ) ( not ( = ?auto_7212 ?auto_7213 ) ) ( not ( = ?auto_7223 ?auto_7224 ) ) ( HOIST-AT ?auto_7225 ?auto_7223 ) ( not ( = ?auto_7217 ?auto_7225 ) ) ( SURFACE-AT ?auto_7212 ?auto_7223 ) ( ON ?auto_7212 ?auto_7216 ) ( CLEAR ?auto_7212 ) ( not ( = ?auto_7212 ?auto_7216 ) ) ( not ( = ?auto_7213 ?auto_7216 ) ) ( IS-CRATE ?auto_7213 ) ( not ( = ?auto_7212 ?auto_7221 ) ) ( not ( = ?auto_7213 ?auto_7221 ) ) ( not ( = ?auto_7216 ?auto_7221 ) ) ( SURFACE-AT ?auto_7213 ?auto_7223 ) ( ON ?auto_7213 ?auto_7218 ) ( CLEAR ?auto_7213 ) ( not ( = ?auto_7212 ?auto_7218 ) ) ( not ( = ?auto_7213 ?auto_7218 ) ) ( not ( = ?auto_7216 ?auto_7218 ) ) ( not ( = ?auto_7221 ?auto_7218 ) ) ( IS-CRATE ?auto_7221 ) ( not ( = ?auto_7212 ?auto_7219 ) ) ( not ( = ?auto_7213 ?auto_7219 ) ) ( not ( = ?auto_7216 ?auto_7219 ) ) ( not ( = ?auto_7221 ?auto_7219 ) ) ( not ( = ?auto_7218 ?auto_7219 ) ) ( SURFACE-AT ?auto_7221 ?auto_7223 ) ( ON ?auto_7221 ?auto_7215 ) ( CLEAR ?auto_7221 ) ( not ( = ?auto_7212 ?auto_7215 ) ) ( not ( = ?auto_7213 ?auto_7215 ) ) ( not ( = ?auto_7216 ?auto_7215 ) ) ( not ( = ?auto_7221 ?auto_7215 ) ) ( not ( = ?auto_7218 ?auto_7215 ) ) ( not ( = ?auto_7219 ?auto_7215 ) ) ( SURFACE-AT ?auto_7214 ?auto_7224 ) ( CLEAR ?auto_7214 ) ( IS-CRATE ?auto_7219 ) ( not ( = ?auto_7212 ?auto_7214 ) ) ( not ( = ?auto_7213 ?auto_7214 ) ) ( not ( = ?auto_7216 ?auto_7214 ) ) ( not ( = ?auto_7221 ?auto_7214 ) ) ( not ( = ?auto_7218 ?auto_7214 ) ) ( not ( = ?auto_7219 ?auto_7214 ) ) ( not ( = ?auto_7215 ?auto_7214 ) ) ( AVAILABLE ?auto_7217 ) ( AVAILABLE ?auto_7225 ) ( SURFACE-AT ?auto_7219 ?auto_7223 ) ( ON ?auto_7219 ?auto_7222 ) ( CLEAR ?auto_7219 ) ( not ( = ?auto_7212 ?auto_7222 ) ) ( not ( = ?auto_7213 ?auto_7222 ) ) ( not ( = ?auto_7216 ?auto_7222 ) ) ( not ( = ?auto_7221 ?auto_7222 ) ) ( not ( = ?auto_7218 ?auto_7222 ) ) ( not ( = ?auto_7219 ?auto_7222 ) ) ( not ( = ?auto_7215 ?auto_7222 ) ) ( not ( = ?auto_7214 ?auto_7222 ) ) ( TRUCK-AT ?auto_7220 ?auto_7224 ) )
    :subtasks
    ( ( !DRIVE ?auto_7220 ?auto_7224 ?auto_7223 )
      ( MAKE-ON ?auto_7212 ?auto_7213 )
      ( MAKE-ON-VERIFY ?auto_7212 ?auto_7213 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_7226 - SURFACE
      ?auto_7227 - SURFACE
    )
    :vars
    (
      ?auto_7237 - HOIST
      ?auto_7230 - PLACE
      ?auto_7231 - PLACE
      ?auto_7235 - HOIST
      ?auto_7232 - SURFACE
      ?auto_7228 - SURFACE
      ?auto_7236 - SURFACE
      ?auto_7233 - SURFACE
      ?auto_7234 - SURFACE
      ?auto_7229 - SURFACE
      ?auto_7239 - SURFACE
      ?auto_7238 - TRUCK
      ?auto_7240 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7237 ?auto_7230 ) ( IS-CRATE ?auto_7226 ) ( not ( = ?auto_7226 ?auto_7227 ) ) ( not ( = ?auto_7231 ?auto_7230 ) ) ( HOIST-AT ?auto_7235 ?auto_7231 ) ( not ( = ?auto_7237 ?auto_7235 ) ) ( SURFACE-AT ?auto_7226 ?auto_7231 ) ( ON ?auto_7226 ?auto_7232 ) ( CLEAR ?auto_7226 ) ( not ( = ?auto_7226 ?auto_7232 ) ) ( not ( = ?auto_7227 ?auto_7232 ) ) ( IS-CRATE ?auto_7227 ) ( not ( = ?auto_7226 ?auto_7228 ) ) ( not ( = ?auto_7227 ?auto_7228 ) ) ( not ( = ?auto_7232 ?auto_7228 ) ) ( SURFACE-AT ?auto_7227 ?auto_7231 ) ( ON ?auto_7227 ?auto_7236 ) ( CLEAR ?auto_7227 ) ( not ( = ?auto_7226 ?auto_7236 ) ) ( not ( = ?auto_7227 ?auto_7236 ) ) ( not ( = ?auto_7232 ?auto_7236 ) ) ( not ( = ?auto_7228 ?auto_7236 ) ) ( IS-CRATE ?auto_7228 ) ( not ( = ?auto_7226 ?auto_7233 ) ) ( not ( = ?auto_7227 ?auto_7233 ) ) ( not ( = ?auto_7232 ?auto_7233 ) ) ( not ( = ?auto_7228 ?auto_7233 ) ) ( not ( = ?auto_7236 ?auto_7233 ) ) ( SURFACE-AT ?auto_7228 ?auto_7231 ) ( ON ?auto_7228 ?auto_7234 ) ( CLEAR ?auto_7228 ) ( not ( = ?auto_7226 ?auto_7234 ) ) ( not ( = ?auto_7227 ?auto_7234 ) ) ( not ( = ?auto_7232 ?auto_7234 ) ) ( not ( = ?auto_7228 ?auto_7234 ) ) ( not ( = ?auto_7236 ?auto_7234 ) ) ( not ( = ?auto_7233 ?auto_7234 ) ) ( IS-CRATE ?auto_7233 ) ( not ( = ?auto_7226 ?auto_7229 ) ) ( not ( = ?auto_7227 ?auto_7229 ) ) ( not ( = ?auto_7232 ?auto_7229 ) ) ( not ( = ?auto_7228 ?auto_7229 ) ) ( not ( = ?auto_7236 ?auto_7229 ) ) ( not ( = ?auto_7233 ?auto_7229 ) ) ( not ( = ?auto_7234 ?auto_7229 ) ) ( AVAILABLE ?auto_7235 ) ( SURFACE-AT ?auto_7233 ?auto_7231 ) ( ON ?auto_7233 ?auto_7239 ) ( CLEAR ?auto_7233 ) ( not ( = ?auto_7226 ?auto_7239 ) ) ( not ( = ?auto_7227 ?auto_7239 ) ) ( not ( = ?auto_7232 ?auto_7239 ) ) ( not ( = ?auto_7228 ?auto_7239 ) ) ( not ( = ?auto_7236 ?auto_7239 ) ) ( not ( = ?auto_7233 ?auto_7239 ) ) ( not ( = ?auto_7234 ?auto_7239 ) ) ( not ( = ?auto_7229 ?auto_7239 ) ) ( TRUCK-AT ?auto_7238 ?auto_7230 ) ( SURFACE-AT ?auto_7240 ?auto_7230 ) ( CLEAR ?auto_7240 ) ( LIFTING ?auto_7237 ?auto_7229 ) ( IS-CRATE ?auto_7229 ) ( not ( = ?auto_7226 ?auto_7240 ) ) ( not ( = ?auto_7227 ?auto_7240 ) ) ( not ( = ?auto_7232 ?auto_7240 ) ) ( not ( = ?auto_7228 ?auto_7240 ) ) ( not ( = ?auto_7236 ?auto_7240 ) ) ( not ( = ?auto_7233 ?auto_7240 ) ) ( not ( = ?auto_7234 ?auto_7240 ) ) ( not ( = ?auto_7229 ?auto_7240 ) ) ( not ( = ?auto_7239 ?auto_7240 ) ) )
    :subtasks
    ( ( !DROP ?auto_7237 ?auto_7229 ?auto_7240 ?auto_7230 )
      ( MAKE-ON ?auto_7226 ?auto_7227 )
      ( MAKE-ON-VERIFY ?auto_7226 ?auto_7227 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_7241 - SURFACE
      ?auto_7242 - SURFACE
    )
    :vars
    (
      ?auto_7245 - HOIST
      ?auto_7255 - PLACE
      ?auto_7252 - PLACE
      ?auto_7249 - HOIST
      ?auto_7251 - SURFACE
      ?auto_7246 - SURFACE
      ?auto_7243 - SURFACE
      ?auto_7247 - SURFACE
      ?auto_7253 - SURFACE
      ?auto_7254 - SURFACE
      ?auto_7250 - SURFACE
      ?auto_7248 - TRUCK
      ?auto_7244 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7245 ?auto_7255 ) ( IS-CRATE ?auto_7241 ) ( not ( = ?auto_7241 ?auto_7242 ) ) ( not ( = ?auto_7252 ?auto_7255 ) ) ( HOIST-AT ?auto_7249 ?auto_7252 ) ( not ( = ?auto_7245 ?auto_7249 ) ) ( SURFACE-AT ?auto_7241 ?auto_7252 ) ( ON ?auto_7241 ?auto_7251 ) ( CLEAR ?auto_7241 ) ( not ( = ?auto_7241 ?auto_7251 ) ) ( not ( = ?auto_7242 ?auto_7251 ) ) ( IS-CRATE ?auto_7242 ) ( not ( = ?auto_7241 ?auto_7246 ) ) ( not ( = ?auto_7242 ?auto_7246 ) ) ( not ( = ?auto_7251 ?auto_7246 ) ) ( SURFACE-AT ?auto_7242 ?auto_7252 ) ( ON ?auto_7242 ?auto_7243 ) ( CLEAR ?auto_7242 ) ( not ( = ?auto_7241 ?auto_7243 ) ) ( not ( = ?auto_7242 ?auto_7243 ) ) ( not ( = ?auto_7251 ?auto_7243 ) ) ( not ( = ?auto_7246 ?auto_7243 ) ) ( IS-CRATE ?auto_7246 ) ( not ( = ?auto_7241 ?auto_7247 ) ) ( not ( = ?auto_7242 ?auto_7247 ) ) ( not ( = ?auto_7251 ?auto_7247 ) ) ( not ( = ?auto_7246 ?auto_7247 ) ) ( not ( = ?auto_7243 ?auto_7247 ) ) ( SURFACE-AT ?auto_7246 ?auto_7252 ) ( ON ?auto_7246 ?auto_7253 ) ( CLEAR ?auto_7246 ) ( not ( = ?auto_7241 ?auto_7253 ) ) ( not ( = ?auto_7242 ?auto_7253 ) ) ( not ( = ?auto_7251 ?auto_7253 ) ) ( not ( = ?auto_7246 ?auto_7253 ) ) ( not ( = ?auto_7243 ?auto_7253 ) ) ( not ( = ?auto_7247 ?auto_7253 ) ) ( IS-CRATE ?auto_7247 ) ( not ( = ?auto_7241 ?auto_7254 ) ) ( not ( = ?auto_7242 ?auto_7254 ) ) ( not ( = ?auto_7251 ?auto_7254 ) ) ( not ( = ?auto_7246 ?auto_7254 ) ) ( not ( = ?auto_7243 ?auto_7254 ) ) ( not ( = ?auto_7247 ?auto_7254 ) ) ( not ( = ?auto_7253 ?auto_7254 ) ) ( AVAILABLE ?auto_7249 ) ( SURFACE-AT ?auto_7247 ?auto_7252 ) ( ON ?auto_7247 ?auto_7250 ) ( CLEAR ?auto_7247 ) ( not ( = ?auto_7241 ?auto_7250 ) ) ( not ( = ?auto_7242 ?auto_7250 ) ) ( not ( = ?auto_7251 ?auto_7250 ) ) ( not ( = ?auto_7246 ?auto_7250 ) ) ( not ( = ?auto_7243 ?auto_7250 ) ) ( not ( = ?auto_7247 ?auto_7250 ) ) ( not ( = ?auto_7253 ?auto_7250 ) ) ( not ( = ?auto_7254 ?auto_7250 ) ) ( TRUCK-AT ?auto_7248 ?auto_7255 ) ( SURFACE-AT ?auto_7244 ?auto_7255 ) ( CLEAR ?auto_7244 ) ( IS-CRATE ?auto_7254 ) ( not ( = ?auto_7241 ?auto_7244 ) ) ( not ( = ?auto_7242 ?auto_7244 ) ) ( not ( = ?auto_7251 ?auto_7244 ) ) ( not ( = ?auto_7246 ?auto_7244 ) ) ( not ( = ?auto_7243 ?auto_7244 ) ) ( not ( = ?auto_7247 ?auto_7244 ) ) ( not ( = ?auto_7253 ?auto_7244 ) ) ( not ( = ?auto_7254 ?auto_7244 ) ) ( not ( = ?auto_7250 ?auto_7244 ) ) ( AVAILABLE ?auto_7245 ) ( IN ?auto_7254 ?auto_7248 ) )
    :subtasks
    ( ( !UNLOAD ?auto_7245 ?auto_7254 ?auto_7248 ?auto_7255 )
      ( MAKE-ON ?auto_7241 ?auto_7242 )
      ( MAKE-ON-VERIFY ?auto_7241 ?auto_7242 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_7256 - SURFACE
      ?auto_7257 - SURFACE
    )
    :vars
    (
      ?auto_7261 - HOIST
      ?auto_7269 - PLACE
      ?auto_7267 - PLACE
      ?auto_7263 - HOIST
      ?auto_7268 - SURFACE
      ?auto_7262 - SURFACE
      ?auto_7259 - SURFACE
      ?auto_7264 - SURFACE
      ?auto_7266 - SURFACE
      ?auto_7270 - SURFACE
      ?auto_7258 - SURFACE
      ?auto_7265 - SURFACE
      ?auto_7260 - TRUCK
      ?auto_7271 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7261 ?auto_7269 ) ( IS-CRATE ?auto_7256 ) ( not ( = ?auto_7256 ?auto_7257 ) ) ( not ( = ?auto_7267 ?auto_7269 ) ) ( HOIST-AT ?auto_7263 ?auto_7267 ) ( not ( = ?auto_7261 ?auto_7263 ) ) ( SURFACE-AT ?auto_7256 ?auto_7267 ) ( ON ?auto_7256 ?auto_7268 ) ( CLEAR ?auto_7256 ) ( not ( = ?auto_7256 ?auto_7268 ) ) ( not ( = ?auto_7257 ?auto_7268 ) ) ( IS-CRATE ?auto_7257 ) ( not ( = ?auto_7256 ?auto_7262 ) ) ( not ( = ?auto_7257 ?auto_7262 ) ) ( not ( = ?auto_7268 ?auto_7262 ) ) ( SURFACE-AT ?auto_7257 ?auto_7267 ) ( ON ?auto_7257 ?auto_7259 ) ( CLEAR ?auto_7257 ) ( not ( = ?auto_7256 ?auto_7259 ) ) ( not ( = ?auto_7257 ?auto_7259 ) ) ( not ( = ?auto_7268 ?auto_7259 ) ) ( not ( = ?auto_7262 ?auto_7259 ) ) ( IS-CRATE ?auto_7262 ) ( not ( = ?auto_7256 ?auto_7264 ) ) ( not ( = ?auto_7257 ?auto_7264 ) ) ( not ( = ?auto_7268 ?auto_7264 ) ) ( not ( = ?auto_7262 ?auto_7264 ) ) ( not ( = ?auto_7259 ?auto_7264 ) ) ( SURFACE-AT ?auto_7262 ?auto_7267 ) ( ON ?auto_7262 ?auto_7266 ) ( CLEAR ?auto_7262 ) ( not ( = ?auto_7256 ?auto_7266 ) ) ( not ( = ?auto_7257 ?auto_7266 ) ) ( not ( = ?auto_7268 ?auto_7266 ) ) ( not ( = ?auto_7262 ?auto_7266 ) ) ( not ( = ?auto_7259 ?auto_7266 ) ) ( not ( = ?auto_7264 ?auto_7266 ) ) ( IS-CRATE ?auto_7264 ) ( not ( = ?auto_7256 ?auto_7270 ) ) ( not ( = ?auto_7257 ?auto_7270 ) ) ( not ( = ?auto_7268 ?auto_7270 ) ) ( not ( = ?auto_7262 ?auto_7270 ) ) ( not ( = ?auto_7259 ?auto_7270 ) ) ( not ( = ?auto_7264 ?auto_7270 ) ) ( not ( = ?auto_7266 ?auto_7270 ) ) ( AVAILABLE ?auto_7263 ) ( SURFACE-AT ?auto_7264 ?auto_7267 ) ( ON ?auto_7264 ?auto_7258 ) ( CLEAR ?auto_7264 ) ( not ( = ?auto_7256 ?auto_7258 ) ) ( not ( = ?auto_7257 ?auto_7258 ) ) ( not ( = ?auto_7268 ?auto_7258 ) ) ( not ( = ?auto_7262 ?auto_7258 ) ) ( not ( = ?auto_7259 ?auto_7258 ) ) ( not ( = ?auto_7264 ?auto_7258 ) ) ( not ( = ?auto_7266 ?auto_7258 ) ) ( not ( = ?auto_7270 ?auto_7258 ) ) ( SURFACE-AT ?auto_7265 ?auto_7269 ) ( CLEAR ?auto_7265 ) ( IS-CRATE ?auto_7270 ) ( not ( = ?auto_7256 ?auto_7265 ) ) ( not ( = ?auto_7257 ?auto_7265 ) ) ( not ( = ?auto_7268 ?auto_7265 ) ) ( not ( = ?auto_7262 ?auto_7265 ) ) ( not ( = ?auto_7259 ?auto_7265 ) ) ( not ( = ?auto_7264 ?auto_7265 ) ) ( not ( = ?auto_7266 ?auto_7265 ) ) ( not ( = ?auto_7270 ?auto_7265 ) ) ( not ( = ?auto_7258 ?auto_7265 ) ) ( AVAILABLE ?auto_7261 ) ( IN ?auto_7270 ?auto_7260 ) ( TRUCK-AT ?auto_7260 ?auto_7271 ) ( not ( = ?auto_7271 ?auto_7269 ) ) ( not ( = ?auto_7267 ?auto_7271 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_7260 ?auto_7271 ?auto_7269 )
      ( MAKE-ON ?auto_7256 ?auto_7257 )
      ( MAKE-ON-VERIFY ?auto_7256 ?auto_7257 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_7272 - SURFACE
      ?auto_7273 - SURFACE
    )
    :vars
    (
      ?auto_7274 - HOIST
      ?auto_7282 - PLACE
      ?auto_7277 - PLACE
      ?auto_7286 - HOIST
      ?auto_7283 - SURFACE
      ?auto_7280 - SURFACE
      ?auto_7276 - SURFACE
      ?auto_7287 - SURFACE
      ?auto_7278 - SURFACE
      ?auto_7284 - SURFACE
      ?auto_7281 - SURFACE
      ?auto_7285 - SURFACE
      ?auto_7275 - TRUCK
      ?auto_7279 - PLACE
      ?auto_7288 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_7274 ?auto_7282 ) ( IS-CRATE ?auto_7272 ) ( not ( = ?auto_7272 ?auto_7273 ) ) ( not ( = ?auto_7277 ?auto_7282 ) ) ( HOIST-AT ?auto_7286 ?auto_7277 ) ( not ( = ?auto_7274 ?auto_7286 ) ) ( SURFACE-AT ?auto_7272 ?auto_7277 ) ( ON ?auto_7272 ?auto_7283 ) ( CLEAR ?auto_7272 ) ( not ( = ?auto_7272 ?auto_7283 ) ) ( not ( = ?auto_7273 ?auto_7283 ) ) ( IS-CRATE ?auto_7273 ) ( not ( = ?auto_7272 ?auto_7280 ) ) ( not ( = ?auto_7273 ?auto_7280 ) ) ( not ( = ?auto_7283 ?auto_7280 ) ) ( SURFACE-AT ?auto_7273 ?auto_7277 ) ( ON ?auto_7273 ?auto_7276 ) ( CLEAR ?auto_7273 ) ( not ( = ?auto_7272 ?auto_7276 ) ) ( not ( = ?auto_7273 ?auto_7276 ) ) ( not ( = ?auto_7283 ?auto_7276 ) ) ( not ( = ?auto_7280 ?auto_7276 ) ) ( IS-CRATE ?auto_7280 ) ( not ( = ?auto_7272 ?auto_7287 ) ) ( not ( = ?auto_7273 ?auto_7287 ) ) ( not ( = ?auto_7283 ?auto_7287 ) ) ( not ( = ?auto_7280 ?auto_7287 ) ) ( not ( = ?auto_7276 ?auto_7287 ) ) ( SURFACE-AT ?auto_7280 ?auto_7277 ) ( ON ?auto_7280 ?auto_7278 ) ( CLEAR ?auto_7280 ) ( not ( = ?auto_7272 ?auto_7278 ) ) ( not ( = ?auto_7273 ?auto_7278 ) ) ( not ( = ?auto_7283 ?auto_7278 ) ) ( not ( = ?auto_7280 ?auto_7278 ) ) ( not ( = ?auto_7276 ?auto_7278 ) ) ( not ( = ?auto_7287 ?auto_7278 ) ) ( IS-CRATE ?auto_7287 ) ( not ( = ?auto_7272 ?auto_7284 ) ) ( not ( = ?auto_7273 ?auto_7284 ) ) ( not ( = ?auto_7283 ?auto_7284 ) ) ( not ( = ?auto_7280 ?auto_7284 ) ) ( not ( = ?auto_7276 ?auto_7284 ) ) ( not ( = ?auto_7287 ?auto_7284 ) ) ( not ( = ?auto_7278 ?auto_7284 ) ) ( AVAILABLE ?auto_7286 ) ( SURFACE-AT ?auto_7287 ?auto_7277 ) ( ON ?auto_7287 ?auto_7281 ) ( CLEAR ?auto_7287 ) ( not ( = ?auto_7272 ?auto_7281 ) ) ( not ( = ?auto_7273 ?auto_7281 ) ) ( not ( = ?auto_7283 ?auto_7281 ) ) ( not ( = ?auto_7280 ?auto_7281 ) ) ( not ( = ?auto_7276 ?auto_7281 ) ) ( not ( = ?auto_7287 ?auto_7281 ) ) ( not ( = ?auto_7278 ?auto_7281 ) ) ( not ( = ?auto_7284 ?auto_7281 ) ) ( SURFACE-AT ?auto_7285 ?auto_7282 ) ( CLEAR ?auto_7285 ) ( IS-CRATE ?auto_7284 ) ( not ( = ?auto_7272 ?auto_7285 ) ) ( not ( = ?auto_7273 ?auto_7285 ) ) ( not ( = ?auto_7283 ?auto_7285 ) ) ( not ( = ?auto_7280 ?auto_7285 ) ) ( not ( = ?auto_7276 ?auto_7285 ) ) ( not ( = ?auto_7287 ?auto_7285 ) ) ( not ( = ?auto_7278 ?auto_7285 ) ) ( not ( = ?auto_7284 ?auto_7285 ) ) ( not ( = ?auto_7281 ?auto_7285 ) ) ( AVAILABLE ?auto_7274 ) ( TRUCK-AT ?auto_7275 ?auto_7279 ) ( not ( = ?auto_7279 ?auto_7282 ) ) ( not ( = ?auto_7277 ?auto_7279 ) ) ( HOIST-AT ?auto_7288 ?auto_7279 ) ( LIFTING ?auto_7288 ?auto_7284 ) ( not ( = ?auto_7274 ?auto_7288 ) ) ( not ( = ?auto_7286 ?auto_7288 ) ) )
    :subtasks
    ( ( !LOAD ?auto_7288 ?auto_7284 ?auto_7275 ?auto_7279 )
      ( MAKE-ON ?auto_7272 ?auto_7273 )
      ( MAKE-ON-VERIFY ?auto_7272 ?auto_7273 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_7289 - SURFACE
      ?auto_7290 - SURFACE
    )
    :vars
    (
      ?auto_7299 - HOIST
      ?auto_7302 - PLACE
      ?auto_7303 - PLACE
      ?auto_7300 - HOIST
      ?auto_7291 - SURFACE
      ?auto_7301 - SURFACE
      ?auto_7298 - SURFACE
      ?auto_7304 - SURFACE
      ?auto_7297 - SURFACE
      ?auto_7293 - SURFACE
      ?auto_7305 - SURFACE
      ?auto_7295 - SURFACE
      ?auto_7296 - TRUCK
      ?auto_7294 - PLACE
      ?auto_7292 - HOIST
      ?auto_7306 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7299 ?auto_7302 ) ( IS-CRATE ?auto_7289 ) ( not ( = ?auto_7289 ?auto_7290 ) ) ( not ( = ?auto_7303 ?auto_7302 ) ) ( HOIST-AT ?auto_7300 ?auto_7303 ) ( not ( = ?auto_7299 ?auto_7300 ) ) ( SURFACE-AT ?auto_7289 ?auto_7303 ) ( ON ?auto_7289 ?auto_7291 ) ( CLEAR ?auto_7289 ) ( not ( = ?auto_7289 ?auto_7291 ) ) ( not ( = ?auto_7290 ?auto_7291 ) ) ( IS-CRATE ?auto_7290 ) ( not ( = ?auto_7289 ?auto_7301 ) ) ( not ( = ?auto_7290 ?auto_7301 ) ) ( not ( = ?auto_7291 ?auto_7301 ) ) ( SURFACE-AT ?auto_7290 ?auto_7303 ) ( ON ?auto_7290 ?auto_7298 ) ( CLEAR ?auto_7290 ) ( not ( = ?auto_7289 ?auto_7298 ) ) ( not ( = ?auto_7290 ?auto_7298 ) ) ( not ( = ?auto_7291 ?auto_7298 ) ) ( not ( = ?auto_7301 ?auto_7298 ) ) ( IS-CRATE ?auto_7301 ) ( not ( = ?auto_7289 ?auto_7304 ) ) ( not ( = ?auto_7290 ?auto_7304 ) ) ( not ( = ?auto_7291 ?auto_7304 ) ) ( not ( = ?auto_7301 ?auto_7304 ) ) ( not ( = ?auto_7298 ?auto_7304 ) ) ( SURFACE-AT ?auto_7301 ?auto_7303 ) ( ON ?auto_7301 ?auto_7297 ) ( CLEAR ?auto_7301 ) ( not ( = ?auto_7289 ?auto_7297 ) ) ( not ( = ?auto_7290 ?auto_7297 ) ) ( not ( = ?auto_7291 ?auto_7297 ) ) ( not ( = ?auto_7301 ?auto_7297 ) ) ( not ( = ?auto_7298 ?auto_7297 ) ) ( not ( = ?auto_7304 ?auto_7297 ) ) ( IS-CRATE ?auto_7304 ) ( not ( = ?auto_7289 ?auto_7293 ) ) ( not ( = ?auto_7290 ?auto_7293 ) ) ( not ( = ?auto_7291 ?auto_7293 ) ) ( not ( = ?auto_7301 ?auto_7293 ) ) ( not ( = ?auto_7298 ?auto_7293 ) ) ( not ( = ?auto_7304 ?auto_7293 ) ) ( not ( = ?auto_7297 ?auto_7293 ) ) ( AVAILABLE ?auto_7300 ) ( SURFACE-AT ?auto_7304 ?auto_7303 ) ( ON ?auto_7304 ?auto_7305 ) ( CLEAR ?auto_7304 ) ( not ( = ?auto_7289 ?auto_7305 ) ) ( not ( = ?auto_7290 ?auto_7305 ) ) ( not ( = ?auto_7291 ?auto_7305 ) ) ( not ( = ?auto_7301 ?auto_7305 ) ) ( not ( = ?auto_7298 ?auto_7305 ) ) ( not ( = ?auto_7304 ?auto_7305 ) ) ( not ( = ?auto_7297 ?auto_7305 ) ) ( not ( = ?auto_7293 ?auto_7305 ) ) ( SURFACE-AT ?auto_7295 ?auto_7302 ) ( CLEAR ?auto_7295 ) ( IS-CRATE ?auto_7293 ) ( not ( = ?auto_7289 ?auto_7295 ) ) ( not ( = ?auto_7290 ?auto_7295 ) ) ( not ( = ?auto_7291 ?auto_7295 ) ) ( not ( = ?auto_7301 ?auto_7295 ) ) ( not ( = ?auto_7298 ?auto_7295 ) ) ( not ( = ?auto_7304 ?auto_7295 ) ) ( not ( = ?auto_7297 ?auto_7295 ) ) ( not ( = ?auto_7293 ?auto_7295 ) ) ( not ( = ?auto_7305 ?auto_7295 ) ) ( AVAILABLE ?auto_7299 ) ( TRUCK-AT ?auto_7296 ?auto_7294 ) ( not ( = ?auto_7294 ?auto_7302 ) ) ( not ( = ?auto_7303 ?auto_7294 ) ) ( HOIST-AT ?auto_7292 ?auto_7294 ) ( not ( = ?auto_7299 ?auto_7292 ) ) ( not ( = ?auto_7300 ?auto_7292 ) ) ( AVAILABLE ?auto_7292 ) ( SURFACE-AT ?auto_7293 ?auto_7294 ) ( ON ?auto_7293 ?auto_7306 ) ( CLEAR ?auto_7293 ) ( not ( = ?auto_7289 ?auto_7306 ) ) ( not ( = ?auto_7290 ?auto_7306 ) ) ( not ( = ?auto_7291 ?auto_7306 ) ) ( not ( = ?auto_7301 ?auto_7306 ) ) ( not ( = ?auto_7298 ?auto_7306 ) ) ( not ( = ?auto_7304 ?auto_7306 ) ) ( not ( = ?auto_7297 ?auto_7306 ) ) ( not ( = ?auto_7293 ?auto_7306 ) ) ( not ( = ?auto_7305 ?auto_7306 ) ) ( not ( = ?auto_7295 ?auto_7306 ) ) )
    :subtasks
    ( ( !LIFT ?auto_7292 ?auto_7293 ?auto_7306 ?auto_7294 )
      ( MAKE-ON ?auto_7289 ?auto_7290 )
      ( MAKE-ON-VERIFY ?auto_7289 ?auto_7290 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_7307 - SURFACE
      ?auto_7308 - SURFACE
    )
    :vars
    (
      ?auto_7323 - HOIST
      ?auto_7319 - PLACE
      ?auto_7310 - PLACE
      ?auto_7312 - HOIST
      ?auto_7324 - SURFACE
      ?auto_7316 - SURFACE
      ?auto_7314 - SURFACE
      ?auto_7321 - SURFACE
      ?auto_7313 - SURFACE
      ?auto_7315 - SURFACE
      ?auto_7317 - SURFACE
      ?auto_7320 - SURFACE
      ?auto_7311 - PLACE
      ?auto_7318 - HOIST
      ?auto_7322 - SURFACE
      ?auto_7309 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7323 ?auto_7319 ) ( IS-CRATE ?auto_7307 ) ( not ( = ?auto_7307 ?auto_7308 ) ) ( not ( = ?auto_7310 ?auto_7319 ) ) ( HOIST-AT ?auto_7312 ?auto_7310 ) ( not ( = ?auto_7323 ?auto_7312 ) ) ( SURFACE-AT ?auto_7307 ?auto_7310 ) ( ON ?auto_7307 ?auto_7324 ) ( CLEAR ?auto_7307 ) ( not ( = ?auto_7307 ?auto_7324 ) ) ( not ( = ?auto_7308 ?auto_7324 ) ) ( IS-CRATE ?auto_7308 ) ( not ( = ?auto_7307 ?auto_7316 ) ) ( not ( = ?auto_7308 ?auto_7316 ) ) ( not ( = ?auto_7324 ?auto_7316 ) ) ( SURFACE-AT ?auto_7308 ?auto_7310 ) ( ON ?auto_7308 ?auto_7314 ) ( CLEAR ?auto_7308 ) ( not ( = ?auto_7307 ?auto_7314 ) ) ( not ( = ?auto_7308 ?auto_7314 ) ) ( not ( = ?auto_7324 ?auto_7314 ) ) ( not ( = ?auto_7316 ?auto_7314 ) ) ( IS-CRATE ?auto_7316 ) ( not ( = ?auto_7307 ?auto_7321 ) ) ( not ( = ?auto_7308 ?auto_7321 ) ) ( not ( = ?auto_7324 ?auto_7321 ) ) ( not ( = ?auto_7316 ?auto_7321 ) ) ( not ( = ?auto_7314 ?auto_7321 ) ) ( SURFACE-AT ?auto_7316 ?auto_7310 ) ( ON ?auto_7316 ?auto_7313 ) ( CLEAR ?auto_7316 ) ( not ( = ?auto_7307 ?auto_7313 ) ) ( not ( = ?auto_7308 ?auto_7313 ) ) ( not ( = ?auto_7324 ?auto_7313 ) ) ( not ( = ?auto_7316 ?auto_7313 ) ) ( not ( = ?auto_7314 ?auto_7313 ) ) ( not ( = ?auto_7321 ?auto_7313 ) ) ( IS-CRATE ?auto_7321 ) ( not ( = ?auto_7307 ?auto_7315 ) ) ( not ( = ?auto_7308 ?auto_7315 ) ) ( not ( = ?auto_7324 ?auto_7315 ) ) ( not ( = ?auto_7316 ?auto_7315 ) ) ( not ( = ?auto_7314 ?auto_7315 ) ) ( not ( = ?auto_7321 ?auto_7315 ) ) ( not ( = ?auto_7313 ?auto_7315 ) ) ( AVAILABLE ?auto_7312 ) ( SURFACE-AT ?auto_7321 ?auto_7310 ) ( ON ?auto_7321 ?auto_7317 ) ( CLEAR ?auto_7321 ) ( not ( = ?auto_7307 ?auto_7317 ) ) ( not ( = ?auto_7308 ?auto_7317 ) ) ( not ( = ?auto_7324 ?auto_7317 ) ) ( not ( = ?auto_7316 ?auto_7317 ) ) ( not ( = ?auto_7314 ?auto_7317 ) ) ( not ( = ?auto_7321 ?auto_7317 ) ) ( not ( = ?auto_7313 ?auto_7317 ) ) ( not ( = ?auto_7315 ?auto_7317 ) ) ( SURFACE-AT ?auto_7320 ?auto_7319 ) ( CLEAR ?auto_7320 ) ( IS-CRATE ?auto_7315 ) ( not ( = ?auto_7307 ?auto_7320 ) ) ( not ( = ?auto_7308 ?auto_7320 ) ) ( not ( = ?auto_7324 ?auto_7320 ) ) ( not ( = ?auto_7316 ?auto_7320 ) ) ( not ( = ?auto_7314 ?auto_7320 ) ) ( not ( = ?auto_7321 ?auto_7320 ) ) ( not ( = ?auto_7313 ?auto_7320 ) ) ( not ( = ?auto_7315 ?auto_7320 ) ) ( not ( = ?auto_7317 ?auto_7320 ) ) ( AVAILABLE ?auto_7323 ) ( not ( = ?auto_7311 ?auto_7319 ) ) ( not ( = ?auto_7310 ?auto_7311 ) ) ( HOIST-AT ?auto_7318 ?auto_7311 ) ( not ( = ?auto_7323 ?auto_7318 ) ) ( not ( = ?auto_7312 ?auto_7318 ) ) ( AVAILABLE ?auto_7318 ) ( SURFACE-AT ?auto_7315 ?auto_7311 ) ( ON ?auto_7315 ?auto_7322 ) ( CLEAR ?auto_7315 ) ( not ( = ?auto_7307 ?auto_7322 ) ) ( not ( = ?auto_7308 ?auto_7322 ) ) ( not ( = ?auto_7324 ?auto_7322 ) ) ( not ( = ?auto_7316 ?auto_7322 ) ) ( not ( = ?auto_7314 ?auto_7322 ) ) ( not ( = ?auto_7321 ?auto_7322 ) ) ( not ( = ?auto_7313 ?auto_7322 ) ) ( not ( = ?auto_7315 ?auto_7322 ) ) ( not ( = ?auto_7317 ?auto_7322 ) ) ( not ( = ?auto_7320 ?auto_7322 ) ) ( TRUCK-AT ?auto_7309 ?auto_7319 ) )
    :subtasks
    ( ( !DRIVE ?auto_7309 ?auto_7319 ?auto_7311 )
      ( MAKE-ON ?auto_7307 ?auto_7308 )
      ( MAKE-ON-VERIFY ?auto_7307 ?auto_7308 ) )
  )

)

