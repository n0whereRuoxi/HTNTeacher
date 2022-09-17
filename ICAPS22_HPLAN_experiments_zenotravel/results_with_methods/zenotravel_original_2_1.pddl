( define ( domain zenotravel )
  ( :requirements :strips :typing :htn )
  ( :types aircraft city flevel person )
  ( :predicates
    ( PERSON-AT ?x - PERSON ?c - CITY )
    ( AIRCRAFT-AT ?y - AIRCRAFT ?c - CITY )
    ( IN ?p - PERSON ?a - AIRCRAFT )
    ( FUEL-LEVEL ?a - AIRCRAFT ?l - FLEVEL )
    ( NEXT ?l1 - FLEVEL ?l2 - FLEVEL )
  )
  ( :action !BOARD
    :parameters
    (
      ?p - PERSON
      ?a - AIRCRAFT
      ?c - CITY
    )
    :precondition
    ( and ( PERSON-AT ?p ?c ) ( AIRCRAFT-AT ?a ?c ) )
    :effect
    ( and ( not ( PERSON-AT ?p ?c ) ) ( IN ?p ?a ) )
  )
  ( :action !DEBARK
    :parameters
    (
      ?p - PERSON
      ?a - AIRCRAFT
      ?c - CITY
    )
    :precondition
    ( and ( IN ?p ?a ) ( AIRCRAFT-AT ?a ?c ) )
    :effect
    ( and ( not ( IN ?p ?a ) ) ( PERSON-AT ?p ?c ) )
  )
  ( :action !FLY
    :parameters
    (
      ?a - AIRCRAFT
      ?c1 - CITY
      ?c2 - CITY
      ?l1 - FLEVEL
      ?l2 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?a ?c1 ) ( FUEL-LEVEL ?a ?l1 ) ( NEXT ?l2 ?l1 ) )
    :effect
    ( and ( not ( AIRCRAFT-AT ?a ?c1 ) ) ( AIRCRAFT-AT ?a ?c2 ) ( not ( FUEL-LEVEL ?a ?l1 ) ) ( FUEL-LEVEL ?a ?l2 ) )
  )
  ( :action !ZOOM
    :parameters
    (
      ?a - AIRCRAFT
      ?c1 - CITY
      ?c2 - CITY
      ?l1 - FLEVEL
      ?l2 - FLEVEL
      ?l3 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?a ?c1 ) ( FUEL-LEVEL ?a ?l1 ) ( NEXT ?l2 ?l1 ) ( NEXT ?l3 ?l2 ) )
    :effect
    ( and ( not ( AIRCRAFT-AT ?a ?c1 ) ) ( AIRCRAFT-AT ?a ?c2 ) ( not ( FUEL-LEVEL ?a ?l1 ) ) ( FUEL-LEVEL ?a ?l3 ) )
  )
  ( :action !REFUEL
    :parameters
    (
      ?a - AIRCRAFT
      ?c - CITY
      ?l - FLEVEL
      ?l1 - FLEVEL
    )
    :precondition
    ( and ( FUEL-LEVEL ?a ?l ) ( NEXT ?l ?l1 ) ( AIRCRAFT-AT ?a ?c ) )
    :effect
    ( and ( FUEL-LEVEL ?a ?l1 ) ( not ( FUEL-LEVEL ?a ?l ) ) )
  )
  ( :method TRAVEL
    :parameters
    (
      ?p - PERSON
      ?c - CITY
    )
    :precondition
    ( and ( PERSON-AT ?p ?c ) )
    :subtasks
    (  )
  )

  ( :method FLY-1PPL-VERIFY
    :parameters
    (
      ?p1 - PERSON
      ?c - CITY
    )
    :precondition
    ( and ( PERSON-AT ?p1 ?c ) )
    :subtasks
    (  )
  )

  ( :method FLY-2PPL-VERIFY
    :parameters
    (
      ?p1 - PERSON
      ?p2 - PERSON
      ?c - CITY
    )
    :precondition
    ( and ( PERSON-AT ?p1 ?c ) ( PERSON-AT ?p2 ?c ) )
    :subtasks
    (  )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_427 - PERSON
      ?auto_426 - CITY
    )
    :vars
    (
      ?auto_428 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_427 ?auto_428 ) ( AIRCRAFT-AT ?auto_428 ?auto_426 ) )
    :subtasks
    ( ( !DEBARK ?auto_427 ?auto_428 ?auto_426 )
      ( FLY-1PPL-VERIFY ?auto_427 ?auto_426 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_434 - PERSON
      ?auto_433 - CITY
    )
    :vars
    (
      ?auto_435 - AIRCRAFT
      ?auto_438 - CITY
      ?auto_436 - FLEVEL
      ?auto_437 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_434 ?auto_435 ) ( AIRCRAFT-AT ?auto_435 ?auto_438 ) ( FUEL-LEVEL ?auto_435 ?auto_436 ) ( NEXT ?auto_437 ?auto_436 ) ( not ( = ?auto_433 ?auto_438 ) ) ( not ( = ?auto_436 ?auto_437 ) ) )
    :subtasks
    ( ( !FLY ?auto_435 ?auto_438 ?auto_433 ?auto_436 ?auto_437 )
      ( FLY-1PPL ?auto_434 ?auto_433 )
      ( FLY-1PPL-VERIFY ?auto_434 ?auto_433 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_447 - PERSON
      ?auto_446 - CITY
    )
    :vars
    (
      ?auto_451 - AIRCRAFT
      ?auto_449 - CITY
      ?auto_448 - FLEVEL
      ?auto_450 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_451 ?auto_449 ) ( FUEL-LEVEL ?auto_451 ?auto_448 ) ( NEXT ?auto_450 ?auto_448 ) ( not ( = ?auto_446 ?auto_449 ) ) ( not ( = ?auto_448 ?auto_450 ) ) ( PERSON-AT ?auto_447 ?auto_449 ) )
    :subtasks
    ( ( !BOARD ?auto_447 ?auto_451 ?auto_449 )
      ( FLY-1PPL ?auto_447 ?auto_446 )
      ( FLY-1PPL-VERIFY ?auto_447 ?auto_446 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_460 - PERSON
      ?auto_459 - CITY
    )
    :vars
    (
      ?auto_461 - AIRCRAFT
      ?auto_464 - CITY
      ?auto_463 - FLEVEL
      ?auto_462 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_461 ?auto_464 ) ( NEXT ?auto_463 ?auto_462 ) ( not ( = ?auto_459 ?auto_464 ) ) ( not ( = ?auto_462 ?auto_463 ) ) ( PERSON-AT ?auto_460 ?auto_464 ) ( FUEL-LEVEL ?auto_461 ?auto_463 ) )
    :subtasks
    ( ( !REFUEL ?auto_461 ?auto_464 ?auto_463 ?auto_462 )
      ( FLY-1PPL ?auto_460 ?auto_459 )
      ( FLY-1PPL-VERIFY ?auto_460 ?auto_459 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_473 - PERSON
      ?auto_472 - CITY
    )
    :vars
    (
      ?auto_474 - FLEVEL
      ?auto_476 - FLEVEL
      ?auto_475 - CITY
      ?auto_477 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_474 ?auto_476 ) ( not ( = ?auto_472 ?auto_475 ) ) ( not ( = ?auto_476 ?auto_474 ) ) ( PERSON-AT ?auto_473 ?auto_475 ) ( AIRCRAFT-AT ?auto_477 ?auto_472 ) ( FUEL-LEVEL ?auto_477 ?auto_476 ) )
    :subtasks
    ( ( !FLY ?auto_477 ?auto_472 ?auto_475 ?auto_476 ?auto_474 )
      ( FLY-1PPL ?auto_473 ?auto_472 )
      ( FLY-1PPL-VERIFY ?auto_473 ?auto_472 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_486 - PERSON
      ?auto_485 - CITY
    )
    :vars
    (
      ?auto_489 - FLEVEL
      ?auto_488 - FLEVEL
      ?auto_487 - CITY
      ?auto_490 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_489 ?auto_488 ) ( not ( = ?auto_485 ?auto_487 ) ) ( not ( = ?auto_488 ?auto_489 ) ) ( PERSON-AT ?auto_486 ?auto_487 ) ( AIRCRAFT-AT ?auto_490 ?auto_485 ) ( FUEL-LEVEL ?auto_490 ?auto_489 ) )
    :subtasks
    ( ( !REFUEL ?auto_490 ?auto_485 ?auto_489 ?auto_488 )
      ( FLY-1PPL ?auto_486 ?auto_485 )
      ( FLY-1PPL-VERIFY ?auto_486 ?auto_485 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_510 - PERSON
      ?auto_509 - CITY
    )
    :vars
    (
      ?auto_511 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_510 ?auto_511 ) ( AIRCRAFT-AT ?auto_511 ?auto_509 ) )
    :subtasks
    ( ( !DEBARK ?auto_510 ?auto_511 ?auto_509 )
      ( FLY-1PPL-VERIFY ?auto_510 ?auto_509 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_513 - PERSON
      ?auto_514 - PERSON
      ?auto_512 - CITY
    )
    :vars
    (
      ?auto_515 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_514 ?auto_515 ) ( AIRCRAFT-AT ?auto_515 ?auto_512 ) ( PERSON-AT ?auto_513 ?auto_512 ) ( not ( = ?auto_513 ?auto_514 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_514 ?auto_512 )
      ( FLY-2PPL-VERIFY ?auto_513 ?auto_514 ?auto_512 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_517 - PERSON
      ?auto_518 - PERSON
      ?auto_516 - CITY
    )
    :vars
    (
      ?auto_519 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_517 ?auto_519 ) ( AIRCRAFT-AT ?auto_519 ?auto_516 ) ( PERSON-AT ?auto_518 ?auto_516 ) ( not ( = ?auto_517 ?auto_518 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_517 ?auto_516 )
      ( FLY-2PPL-VERIFY ?auto_517 ?auto_518 ?auto_516 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_525 - PERSON
      ?auto_524 - CITY
    )
    :vars
    (
      ?auto_526 - AIRCRAFT
      ?auto_529 - CITY
      ?auto_527 - FLEVEL
      ?auto_528 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_525 ?auto_526 ) ( AIRCRAFT-AT ?auto_526 ?auto_529 ) ( FUEL-LEVEL ?auto_526 ?auto_527 ) ( NEXT ?auto_528 ?auto_527 ) ( not ( = ?auto_524 ?auto_529 ) ) ( not ( = ?auto_527 ?auto_528 ) ) )
    :subtasks
    ( ( !FLY ?auto_526 ?auto_529 ?auto_524 ?auto_527 ?auto_528 )
      ( FLY-1PPL ?auto_525 ?auto_524 )
      ( FLY-1PPL-VERIFY ?auto_525 ?auto_524 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_531 - PERSON
      ?auto_532 - PERSON
      ?auto_530 - CITY
    )
    :vars
    (
      ?auto_533 - AIRCRAFT
      ?auto_535 - CITY
      ?auto_534 - FLEVEL
      ?auto_536 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_532 ?auto_533 ) ( AIRCRAFT-AT ?auto_533 ?auto_535 ) ( FUEL-LEVEL ?auto_533 ?auto_534 ) ( NEXT ?auto_536 ?auto_534 ) ( not ( = ?auto_530 ?auto_535 ) ) ( not ( = ?auto_534 ?auto_536 ) ) ( PERSON-AT ?auto_531 ?auto_530 ) ( not ( = ?auto_531 ?auto_532 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_532 ?auto_530 )
      ( FLY-2PPL-VERIFY ?auto_531 ?auto_532 ?auto_530 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_538 - PERSON
      ?auto_539 - PERSON
      ?auto_537 - CITY
    )
    :vars
    (
      ?auto_540 - AIRCRAFT
      ?auto_542 - CITY
      ?auto_543 - FLEVEL
      ?auto_541 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_538 ?auto_540 ) ( AIRCRAFT-AT ?auto_540 ?auto_542 ) ( FUEL-LEVEL ?auto_540 ?auto_543 ) ( NEXT ?auto_541 ?auto_543 ) ( not ( = ?auto_537 ?auto_542 ) ) ( not ( = ?auto_543 ?auto_541 ) ) ( PERSON-AT ?auto_539 ?auto_537 ) ( not ( = ?auto_539 ?auto_538 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_539 ?auto_538 ?auto_537 )
      ( FLY-2PPL-VERIFY ?auto_538 ?auto_539 ?auto_537 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_553 - PERSON
      ?auto_552 - CITY
    )
    :vars
    (
      ?auto_554 - AIRCRAFT
      ?auto_556 - CITY
      ?auto_557 - FLEVEL
      ?auto_555 - FLEVEL
      ?auto_558 - PERSON
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_554 ?auto_556 ) ( FUEL-LEVEL ?auto_554 ?auto_557 ) ( NEXT ?auto_555 ?auto_557 ) ( not ( = ?auto_552 ?auto_556 ) ) ( not ( = ?auto_557 ?auto_555 ) ) ( PERSON-AT ?auto_558 ?auto_552 ) ( not ( = ?auto_558 ?auto_553 ) ) ( PERSON-AT ?auto_553 ?auto_556 ) )
    :subtasks
    ( ( !BOARD ?auto_553 ?auto_554 ?auto_556 )
      ( FLY-2PPL ?auto_558 ?auto_553 ?auto_552 )
      ( FLY-1PPL-VERIFY ?auto_553 ?auto_552 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_560 - PERSON
      ?auto_561 - PERSON
      ?auto_559 - CITY
    )
    :vars
    (
      ?auto_564 - AIRCRAFT
      ?auto_562 - CITY
      ?auto_565 - FLEVEL
      ?auto_563 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_564 ?auto_562 ) ( FUEL-LEVEL ?auto_564 ?auto_565 ) ( NEXT ?auto_563 ?auto_565 ) ( not ( = ?auto_559 ?auto_562 ) ) ( not ( = ?auto_565 ?auto_563 ) ) ( PERSON-AT ?auto_560 ?auto_559 ) ( not ( = ?auto_560 ?auto_561 ) ) ( PERSON-AT ?auto_561 ?auto_562 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_561 ?auto_559 )
      ( FLY-2PPL-VERIFY ?auto_560 ?auto_561 ?auto_559 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_567 - PERSON
      ?auto_568 - PERSON
      ?auto_566 - CITY
    )
    :vars
    (
      ?auto_571 - AIRCRAFT
      ?auto_570 - CITY
      ?auto_572 - FLEVEL
      ?auto_569 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_571 ?auto_570 ) ( FUEL-LEVEL ?auto_571 ?auto_572 ) ( NEXT ?auto_569 ?auto_572 ) ( not ( = ?auto_566 ?auto_570 ) ) ( not ( = ?auto_572 ?auto_569 ) ) ( PERSON-AT ?auto_568 ?auto_566 ) ( not ( = ?auto_568 ?auto_567 ) ) ( PERSON-AT ?auto_567 ?auto_570 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_568 ?auto_567 ?auto_566 )
      ( FLY-2PPL-VERIFY ?auto_567 ?auto_568 ?auto_566 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_582 - PERSON
      ?auto_581 - CITY
    )
    :vars
    (
      ?auto_586 - AIRCRAFT
      ?auto_585 - CITY
      ?auto_583 - FLEVEL
      ?auto_587 - FLEVEL
      ?auto_584 - PERSON
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_586 ?auto_585 ) ( NEXT ?auto_583 ?auto_587 ) ( not ( = ?auto_581 ?auto_585 ) ) ( not ( = ?auto_587 ?auto_583 ) ) ( PERSON-AT ?auto_584 ?auto_581 ) ( not ( = ?auto_584 ?auto_582 ) ) ( PERSON-AT ?auto_582 ?auto_585 ) ( FUEL-LEVEL ?auto_586 ?auto_583 ) )
    :subtasks
    ( ( !REFUEL ?auto_586 ?auto_585 ?auto_583 ?auto_587 )
      ( FLY-2PPL ?auto_584 ?auto_582 ?auto_581 )
      ( FLY-1PPL-VERIFY ?auto_582 ?auto_581 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_589 - PERSON
      ?auto_590 - PERSON
      ?auto_588 - CITY
    )
    :vars
    (
      ?auto_592 - AIRCRAFT
      ?auto_591 - CITY
      ?auto_593 - FLEVEL
      ?auto_594 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_592 ?auto_591 ) ( NEXT ?auto_593 ?auto_594 ) ( not ( = ?auto_588 ?auto_591 ) ) ( not ( = ?auto_594 ?auto_593 ) ) ( PERSON-AT ?auto_589 ?auto_588 ) ( not ( = ?auto_589 ?auto_590 ) ) ( PERSON-AT ?auto_590 ?auto_591 ) ( FUEL-LEVEL ?auto_592 ?auto_593 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_590 ?auto_588 )
      ( FLY-2PPL-VERIFY ?auto_589 ?auto_590 ?auto_588 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_596 - PERSON
      ?auto_597 - PERSON
      ?auto_595 - CITY
    )
    :vars
    (
      ?auto_600 - AIRCRAFT
      ?auto_599 - CITY
      ?auto_601 - FLEVEL
      ?auto_598 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_600 ?auto_599 ) ( NEXT ?auto_601 ?auto_598 ) ( not ( = ?auto_595 ?auto_599 ) ) ( not ( = ?auto_598 ?auto_601 ) ) ( PERSON-AT ?auto_597 ?auto_595 ) ( not ( = ?auto_597 ?auto_596 ) ) ( PERSON-AT ?auto_596 ?auto_599 ) ( FUEL-LEVEL ?auto_600 ?auto_601 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_597 ?auto_596 ?auto_595 )
      ( FLY-2PPL-VERIFY ?auto_596 ?auto_597 ?auto_595 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_611 - PERSON
      ?auto_610 - CITY
    )
    :vars
    (
      ?auto_616 - FLEVEL
      ?auto_612 - FLEVEL
      ?auto_614 - CITY
      ?auto_613 - PERSON
      ?auto_615 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_616 ?auto_612 ) ( not ( = ?auto_610 ?auto_614 ) ) ( not ( = ?auto_612 ?auto_616 ) ) ( PERSON-AT ?auto_613 ?auto_610 ) ( not ( = ?auto_613 ?auto_611 ) ) ( PERSON-AT ?auto_611 ?auto_614 ) ( AIRCRAFT-AT ?auto_615 ?auto_610 ) ( FUEL-LEVEL ?auto_615 ?auto_612 ) )
    :subtasks
    ( ( !FLY ?auto_615 ?auto_610 ?auto_614 ?auto_612 ?auto_616 )
      ( FLY-2PPL ?auto_613 ?auto_611 ?auto_610 )
      ( FLY-1PPL-VERIFY ?auto_611 ?auto_610 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_618 - PERSON
      ?auto_619 - PERSON
      ?auto_617 - CITY
    )
    :vars
    (
      ?auto_623 - FLEVEL
      ?auto_622 - FLEVEL
      ?auto_621 - CITY
      ?auto_620 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_623 ?auto_622 ) ( not ( = ?auto_617 ?auto_621 ) ) ( not ( = ?auto_622 ?auto_623 ) ) ( PERSON-AT ?auto_618 ?auto_617 ) ( not ( = ?auto_618 ?auto_619 ) ) ( PERSON-AT ?auto_619 ?auto_621 ) ( AIRCRAFT-AT ?auto_620 ?auto_617 ) ( FUEL-LEVEL ?auto_620 ?auto_622 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_619 ?auto_617 )
      ( FLY-2PPL-VERIFY ?auto_618 ?auto_619 ?auto_617 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_625 - PERSON
      ?auto_626 - PERSON
      ?auto_624 - CITY
    )
    :vars
    (
      ?auto_630 - FLEVEL
      ?auto_627 - FLEVEL
      ?auto_628 - CITY
      ?auto_629 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_630 ?auto_627 ) ( not ( = ?auto_624 ?auto_628 ) ) ( not ( = ?auto_627 ?auto_630 ) ) ( PERSON-AT ?auto_626 ?auto_624 ) ( not ( = ?auto_626 ?auto_625 ) ) ( PERSON-AT ?auto_625 ?auto_628 ) ( AIRCRAFT-AT ?auto_629 ?auto_624 ) ( FUEL-LEVEL ?auto_629 ?auto_627 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_626 ?auto_625 ?auto_624 )
      ( FLY-2PPL-VERIFY ?auto_625 ?auto_626 ?auto_624 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_640 - PERSON
      ?auto_639 - CITY
    )
    :vars
    (
      ?auto_645 - FLEVEL
      ?auto_641 - FLEVEL
      ?auto_643 - CITY
      ?auto_642 - PERSON
      ?auto_644 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_645 ?auto_641 ) ( not ( = ?auto_639 ?auto_643 ) ) ( not ( = ?auto_641 ?auto_645 ) ) ( PERSON-AT ?auto_642 ?auto_639 ) ( not ( = ?auto_642 ?auto_640 ) ) ( PERSON-AT ?auto_640 ?auto_643 ) ( AIRCRAFT-AT ?auto_644 ?auto_639 ) ( FUEL-LEVEL ?auto_644 ?auto_645 ) )
    :subtasks
    ( ( !REFUEL ?auto_644 ?auto_639 ?auto_645 ?auto_641 )
      ( FLY-2PPL ?auto_642 ?auto_640 ?auto_639 )
      ( FLY-1PPL-VERIFY ?auto_640 ?auto_639 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_647 - PERSON
      ?auto_648 - PERSON
      ?auto_646 - CITY
    )
    :vars
    (
      ?auto_651 - FLEVEL
      ?auto_649 - FLEVEL
      ?auto_650 - CITY
      ?auto_652 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_651 ?auto_649 ) ( not ( = ?auto_646 ?auto_650 ) ) ( not ( = ?auto_649 ?auto_651 ) ) ( PERSON-AT ?auto_647 ?auto_646 ) ( not ( = ?auto_647 ?auto_648 ) ) ( PERSON-AT ?auto_648 ?auto_650 ) ( AIRCRAFT-AT ?auto_652 ?auto_646 ) ( FUEL-LEVEL ?auto_652 ?auto_651 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_648 ?auto_646 )
      ( FLY-2PPL-VERIFY ?auto_647 ?auto_648 ?auto_646 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_654 - PERSON
      ?auto_655 - PERSON
      ?auto_653 - CITY
    )
    :vars
    (
      ?auto_656 - FLEVEL
      ?auto_658 - FLEVEL
      ?auto_657 - CITY
      ?auto_659 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_656 ?auto_658 ) ( not ( = ?auto_653 ?auto_657 ) ) ( not ( = ?auto_658 ?auto_656 ) ) ( PERSON-AT ?auto_655 ?auto_653 ) ( not ( = ?auto_655 ?auto_654 ) ) ( PERSON-AT ?auto_654 ?auto_657 ) ( AIRCRAFT-AT ?auto_659 ?auto_653 ) ( FUEL-LEVEL ?auto_659 ?auto_656 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_655 ?auto_654 ?auto_653 )
      ( FLY-2PPL-VERIFY ?auto_654 ?auto_655 ?auto_653 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_669 - PERSON
      ?auto_668 - CITY
    )
    :vars
    (
      ?auto_670 - FLEVEL
      ?auto_673 - FLEVEL
      ?auto_671 - CITY
      ?auto_672 - PERSON
      ?auto_674 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_670 ?auto_673 ) ( not ( = ?auto_668 ?auto_671 ) ) ( not ( = ?auto_673 ?auto_670 ) ) ( not ( = ?auto_672 ?auto_669 ) ) ( PERSON-AT ?auto_669 ?auto_671 ) ( AIRCRAFT-AT ?auto_674 ?auto_668 ) ( FUEL-LEVEL ?auto_674 ?auto_670 ) ( IN ?auto_672 ?auto_674 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_672 ?auto_668 )
      ( FLY-2PPL ?auto_672 ?auto_669 ?auto_668 )
      ( FLY-1PPL-VERIFY ?auto_669 ?auto_668 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_676 - PERSON
      ?auto_677 - PERSON
      ?auto_675 - CITY
    )
    :vars
    (
      ?auto_681 - FLEVEL
      ?auto_680 - FLEVEL
      ?auto_679 - CITY
      ?auto_678 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_681 ?auto_680 ) ( not ( = ?auto_675 ?auto_679 ) ) ( not ( = ?auto_680 ?auto_681 ) ) ( not ( = ?auto_676 ?auto_677 ) ) ( PERSON-AT ?auto_677 ?auto_679 ) ( AIRCRAFT-AT ?auto_678 ?auto_675 ) ( FUEL-LEVEL ?auto_678 ?auto_681 ) ( IN ?auto_676 ?auto_678 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_677 ?auto_675 )
      ( FLY-2PPL-VERIFY ?auto_676 ?auto_677 ?auto_675 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_683 - PERSON
      ?auto_684 - PERSON
      ?auto_682 - CITY
    )
    :vars
    (
      ?auto_685 - FLEVEL
      ?auto_687 - FLEVEL
      ?auto_688 - CITY
      ?auto_686 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_685 ?auto_687 ) ( not ( = ?auto_682 ?auto_688 ) ) ( not ( = ?auto_687 ?auto_685 ) ) ( not ( = ?auto_684 ?auto_683 ) ) ( PERSON-AT ?auto_683 ?auto_688 ) ( AIRCRAFT-AT ?auto_686 ?auto_682 ) ( FUEL-LEVEL ?auto_686 ?auto_685 ) ( IN ?auto_684 ?auto_686 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_684 ?auto_683 ?auto_682 )
      ( FLY-2PPL-VERIFY ?auto_683 ?auto_684 ?auto_682 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_698 - PERSON
      ?auto_697 - CITY
    )
    :vars
    (
      ?auto_699 - FLEVEL
      ?auto_701 - FLEVEL
      ?auto_702 - CITY
      ?auto_703 - PERSON
      ?auto_700 - AIRCRAFT
      ?auto_704 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_699 ?auto_701 ) ( not ( = ?auto_697 ?auto_702 ) ) ( not ( = ?auto_701 ?auto_699 ) ) ( not ( = ?auto_703 ?auto_698 ) ) ( PERSON-AT ?auto_698 ?auto_702 ) ( IN ?auto_703 ?auto_700 ) ( AIRCRAFT-AT ?auto_700 ?auto_704 ) ( FUEL-LEVEL ?auto_700 ?auto_701 ) ( not ( = ?auto_697 ?auto_704 ) ) ( not ( = ?auto_702 ?auto_704 ) ) )
    :subtasks
    ( ( !FLY ?auto_700 ?auto_704 ?auto_697 ?auto_701 ?auto_699 )
      ( FLY-2PPL ?auto_703 ?auto_698 ?auto_697 )
      ( FLY-1PPL-VERIFY ?auto_698 ?auto_697 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_706 - PERSON
      ?auto_707 - PERSON
      ?auto_705 - CITY
    )
    :vars
    (
      ?auto_709 - FLEVEL
      ?auto_708 - FLEVEL
      ?auto_711 - CITY
      ?auto_710 - AIRCRAFT
      ?auto_712 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_709 ?auto_708 ) ( not ( = ?auto_705 ?auto_711 ) ) ( not ( = ?auto_708 ?auto_709 ) ) ( not ( = ?auto_706 ?auto_707 ) ) ( PERSON-AT ?auto_707 ?auto_711 ) ( IN ?auto_706 ?auto_710 ) ( AIRCRAFT-AT ?auto_710 ?auto_712 ) ( FUEL-LEVEL ?auto_710 ?auto_708 ) ( not ( = ?auto_705 ?auto_712 ) ) ( not ( = ?auto_711 ?auto_712 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_707 ?auto_705 )
      ( FLY-2PPL-VERIFY ?auto_706 ?auto_707 ?auto_705 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_714 - PERSON
      ?auto_715 - PERSON
      ?auto_713 - CITY
    )
    :vars
    (
      ?auto_716 - FLEVEL
      ?auto_719 - FLEVEL
      ?auto_717 - CITY
      ?auto_720 - AIRCRAFT
      ?auto_718 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_716 ?auto_719 ) ( not ( = ?auto_713 ?auto_717 ) ) ( not ( = ?auto_719 ?auto_716 ) ) ( not ( = ?auto_715 ?auto_714 ) ) ( PERSON-AT ?auto_714 ?auto_717 ) ( IN ?auto_715 ?auto_720 ) ( AIRCRAFT-AT ?auto_720 ?auto_718 ) ( FUEL-LEVEL ?auto_720 ?auto_719 ) ( not ( = ?auto_713 ?auto_718 ) ) ( not ( = ?auto_717 ?auto_718 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_715 ?auto_714 ?auto_713 )
      ( FLY-2PPL-VERIFY ?auto_714 ?auto_715 ?auto_713 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_731 - PERSON
      ?auto_730 - CITY
    )
    :vars
    (
      ?auto_732 - FLEVEL
      ?auto_735 - FLEVEL
      ?auto_733 - CITY
      ?auto_737 - PERSON
      ?auto_736 - AIRCRAFT
      ?auto_734 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_732 ?auto_735 ) ( not ( = ?auto_730 ?auto_733 ) ) ( not ( = ?auto_735 ?auto_732 ) ) ( not ( = ?auto_737 ?auto_731 ) ) ( PERSON-AT ?auto_731 ?auto_733 ) ( AIRCRAFT-AT ?auto_736 ?auto_734 ) ( FUEL-LEVEL ?auto_736 ?auto_735 ) ( not ( = ?auto_730 ?auto_734 ) ) ( not ( = ?auto_733 ?auto_734 ) ) ( PERSON-AT ?auto_737 ?auto_734 ) )
    :subtasks
    ( ( !BOARD ?auto_737 ?auto_736 ?auto_734 )
      ( FLY-2PPL ?auto_737 ?auto_731 ?auto_730 )
      ( FLY-1PPL-VERIFY ?auto_731 ?auto_730 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_739 - PERSON
      ?auto_740 - PERSON
      ?auto_738 - CITY
    )
    :vars
    (
      ?auto_743 - FLEVEL
      ?auto_744 - FLEVEL
      ?auto_741 - CITY
      ?auto_745 - AIRCRAFT
      ?auto_742 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_743 ?auto_744 ) ( not ( = ?auto_738 ?auto_741 ) ) ( not ( = ?auto_744 ?auto_743 ) ) ( not ( = ?auto_739 ?auto_740 ) ) ( PERSON-AT ?auto_740 ?auto_741 ) ( AIRCRAFT-AT ?auto_745 ?auto_742 ) ( FUEL-LEVEL ?auto_745 ?auto_744 ) ( not ( = ?auto_738 ?auto_742 ) ) ( not ( = ?auto_741 ?auto_742 ) ) ( PERSON-AT ?auto_739 ?auto_742 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_740 ?auto_738 )
      ( FLY-2PPL-VERIFY ?auto_739 ?auto_740 ?auto_738 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_747 - PERSON
      ?auto_748 - PERSON
      ?auto_746 - CITY
    )
    :vars
    (
      ?auto_752 - FLEVEL
      ?auto_751 - FLEVEL
      ?auto_750 - CITY
      ?auto_749 - AIRCRAFT
      ?auto_753 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_752 ?auto_751 ) ( not ( = ?auto_746 ?auto_750 ) ) ( not ( = ?auto_751 ?auto_752 ) ) ( not ( = ?auto_748 ?auto_747 ) ) ( PERSON-AT ?auto_747 ?auto_750 ) ( AIRCRAFT-AT ?auto_749 ?auto_753 ) ( FUEL-LEVEL ?auto_749 ?auto_751 ) ( not ( = ?auto_746 ?auto_753 ) ) ( not ( = ?auto_750 ?auto_753 ) ) ( PERSON-AT ?auto_748 ?auto_753 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_748 ?auto_747 ?auto_746 )
      ( FLY-2PPL-VERIFY ?auto_747 ?auto_748 ?auto_746 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_764 - PERSON
      ?auto_763 - CITY
    )
    :vars
    (
      ?auto_768 - FLEVEL
      ?auto_767 - FLEVEL
      ?auto_766 - CITY
      ?auto_770 - PERSON
      ?auto_765 - AIRCRAFT
      ?auto_769 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_768 ?auto_767 ) ( not ( = ?auto_763 ?auto_766 ) ) ( not ( = ?auto_767 ?auto_768 ) ) ( not ( = ?auto_770 ?auto_764 ) ) ( PERSON-AT ?auto_764 ?auto_766 ) ( AIRCRAFT-AT ?auto_765 ?auto_769 ) ( not ( = ?auto_763 ?auto_769 ) ) ( not ( = ?auto_766 ?auto_769 ) ) ( PERSON-AT ?auto_770 ?auto_769 ) ( FUEL-LEVEL ?auto_765 ?auto_768 ) )
    :subtasks
    ( ( !REFUEL ?auto_765 ?auto_769 ?auto_768 ?auto_767 )
      ( FLY-2PPL ?auto_770 ?auto_764 ?auto_763 )
      ( FLY-1PPL-VERIFY ?auto_764 ?auto_763 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_772 - PERSON
      ?auto_773 - PERSON
      ?auto_771 - CITY
    )
    :vars
    (
      ?auto_776 - FLEVEL
      ?auto_777 - FLEVEL
      ?auto_774 - CITY
      ?auto_778 - AIRCRAFT
      ?auto_775 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_776 ?auto_777 ) ( not ( = ?auto_771 ?auto_774 ) ) ( not ( = ?auto_777 ?auto_776 ) ) ( not ( = ?auto_772 ?auto_773 ) ) ( PERSON-AT ?auto_773 ?auto_774 ) ( AIRCRAFT-AT ?auto_778 ?auto_775 ) ( not ( = ?auto_771 ?auto_775 ) ) ( not ( = ?auto_774 ?auto_775 ) ) ( PERSON-AT ?auto_772 ?auto_775 ) ( FUEL-LEVEL ?auto_778 ?auto_776 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_773 ?auto_771 )
      ( FLY-2PPL-VERIFY ?auto_772 ?auto_773 ?auto_771 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_780 - PERSON
      ?auto_781 - PERSON
      ?auto_779 - CITY
    )
    :vars
    (
      ?auto_784 - FLEVEL
      ?auto_786 - FLEVEL
      ?auto_783 - CITY
      ?auto_785 - AIRCRAFT
      ?auto_782 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_784 ?auto_786 ) ( not ( = ?auto_779 ?auto_783 ) ) ( not ( = ?auto_786 ?auto_784 ) ) ( not ( = ?auto_781 ?auto_780 ) ) ( PERSON-AT ?auto_780 ?auto_783 ) ( AIRCRAFT-AT ?auto_785 ?auto_782 ) ( not ( = ?auto_779 ?auto_782 ) ) ( not ( = ?auto_783 ?auto_782 ) ) ( PERSON-AT ?auto_781 ?auto_782 ) ( FUEL-LEVEL ?auto_785 ?auto_784 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_781 ?auto_780 ?auto_779 )
      ( FLY-2PPL-VERIFY ?auto_780 ?auto_781 ?auto_779 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_797 - PERSON
      ?auto_796 - CITY
    )
    :vars
    (
      ?auto_800 - FLEVEL
      ?auto_802 - FLEVEL
      ?auto_799 - CITY
      ?auto_803 - PERSON
      ?auto_798 - CITY
      ?auto_801 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_800 ?auto_802 ) ( not ( = ?auto_796 ?auto_799 ) ) ( not ( = ?auto_802 ?auto_800 ) ) ( not ( = ?auto_803 ?auto_797 ) ) ( PERSON-AT ?auto_797 ?auto_799 ) ( not ( = ?auto_796 ?auto_798 ) ) ( not ( = ?auto_799 ?auto_798 ) ) ( PERSON-AT ?auto_803 ?auto_798 ) ( AIRCRAFT-AT ?auto_801 ?auto_796 ) ( FUEL-LEVEL ?auto_801 ?auto_802 ) )
    :subtasks
    ( ( !FLY ?auto_801 ?auto_796 ?auto_798 ?auto_802 ?auto_800 )
      ( FLY-2PPL ?auto_803 ?auto_797 ?auto_796 )
      ( FLY-1PPL-VERIFY ?auto_797 ?auto_796 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_805 - PERSON
      ?auto_806 - PERSON
      ?auto_804 - CITY
    )
    :vars
    (
      ?auto_810 - FLEVEL
      ?auto_809 - FLEVEL
      ?auto_811 - CITY
      ?auto_808 - CITY
      ?auto_807 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_810 ?auto_809 ) ( not ( = ?auto_804 ?auto_811 ) ) ( not ( = ?auto_809 ?auto_810 ) ) ( not ( = ?auto_805 ?auto_806 ) ) ( PERSON-AT ?auto_806 ?auto_811 ) ( not ( = ?auto_804 ?auto_808 ) ) ( not ( = ?auto_811 ?auto_808 ) ) ( PERSON-AT ?auto_805 ?auto_808 ) ( AIRCRAFT-AT ?auto_807 ?auto_804 ) ( FUEL-LEVEL ?auto_807 ?auto_809 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_806 ?auto_804 )
      ( FLY-2PPL-VERIFY ?auto_805 ?auto_806 ?auto_804 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_813 - PERSON
      ?auto_814 - PERSON
      ?auto_812 - CITY
    )
    :vars
    (
      ?auto_816 - FLEVEL
      ?auto_819 - FLEVEL
      ?auto_817 - CITY
      ?auto_818 - CITY
      ?auto_815 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_816 ?auto_819 ) ( not ( = ?auto_812 ?auto_817 ) ) ( not ( = ?auto_819 ?auto_816 ) ) ( not ( = ?auto_814 ?auto_813 ) ) ( PERSON-AT ?auto_813 ?auto_817 ) ( not ( = ?auto_812 ?auto_818 ) ) ( not ( = ?auto_817 ?auto_818 ) ) ( PERSON-AT ?auto_814 ?auto_818 ) ( AIRCRAFT-AT ?auto_815 ?auto_812 ) ( FUEL-LEVEL ?auto_815 ?auto_819 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_814 ?auto_813 ?auto_812 )
      ( FLY-2PPL-VERIFY ?auto_813 ?auto_814 ?auto_812 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_830 - PERSON
      ?auto_829 - CITY
    )
    :vars
    (
      ?auto_832 - FLEVEL
      ?auto_835 - FLEVEL
      ?auto_833 - CITY
      ?auto_836 - PERSON
      ?auto_834 - CITY
      ?auto_831 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_832 ?auto_835 ) ( not ( = ?auto_829 ?auto_833 ) ) ( not ( = ?auto_835 ?auto_832 ) ) ( not ( = ?auto_836 ?auto_830 ) ) ( PERSON-AT ?auto_830 ?auto_833 ) ( not ( = ?auto_829 ?auto_834 ) ) ( not ( = ?auto_833 ?auto_834 ) ) ( PERSON-AT ?auto_836 ?auto_834 ) ( AIRCRAFT-AT ?auto_831 ?auto_829 ) ( FUEL-LEVEL ?auto_831 ?auto_832 ) )
    :subtasks
    ( ( !REFUEL ?auto_831 ?auto_829 ?auto_832 ?auto_835 )
      ( FLY-2PPL ?auto_836 ?auto_830 ?auto_829 )
      ( FLY-1PPL-VERIFY ?auto_830 ?auto_829 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_838 - PERSON
      ?auto_839 - PERSON
      ?auto_837 - CITY
    )
    :vars
    (
      ?auto_841 - FLEVEL
      ?auto_844 - FLEVEL
      ?auto_840 - CITY
      ?auto_842 - CITY
      ?auto_843 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_841 ?auto_844 ) ( not ( = ?auto_837 ?auto_840 ) ) ( not ( = ?auto_844 ?auto_841 ) ) ( not ( = ?auto_838 ?auto_839 ) ) ( PERSON-AT ?auto_839 ?auto_840 ) ( not ( = ?auto_837 ?auto_842 ) ) ( not ( = ?auto_840 ?auto_842 ) ) ( PERSON-AT ?auto_838 ?auto_842 ) ( AIRCRAFT-AT ?auto_843 ?auto_837 ) ( FUEL-LEVEL ?auto_843 ?auto_841 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_839 ?auto_837 )
      ( FLY-2PPL-VERIFY ?auto_838 ?auto_839 ?auto_837 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_846 - PERSON
      ?auto_847 - PERSON
      ?auto_845 - CITY
    )
    :vars
    (
      ?auto_848 - FLEVEL
      ?auto_849 - FLEVEL
      ?auto_852 - CITY
      ?auto_850 - CITY
      ?auto_851 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_848 ?auto_849 ) ( not ( = ?auto_845 ?auto_852 ) ) ( not ( = ?auto_849 ?auto_848 ) ) ( not ( = ?auto_847 ?auto_846 ) ) ( PERSON-AT ?auto_846 ?auto_852 ) ( not ( = ?auto_845 ?auto_850 ) ) ( not ( = ?auto_852 ?auto_850 ) ) ( PERSON-AT ?auto_847 ?auto_850 ) ( AIRCRAFT-AT ?auto_851 ?auto_845 ) ( FUEL-LEVEL ?auto_851 ?auto_848 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_847 ?auto_846 ?auto_845 )
      ( FLY-2PPL-VERIFY ?auto_846 ?auto_847 ?auto_845 ) )
  )

)

