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
      ?auto_403 - PERSON
      ?auto_402 - CITY
    )
    :vars
    (
      ?auto_404 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_403 ?auto_404 ) ( AIRCRAFT-AT ?auto_404 ?auto_402 ) )
    :subtasks
    ( ( !DEBARK ?auto_403 ?auto_404 ?auto_402 )
      ( FLY-1PPL-VERIFY ?auto_403 ?auto_402 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_410 - PERSON
      ?auto_409 - CITY
    )
    :vars
    (
      ?auto_411 - AIRCRAFT
      ?auto_414 - CITY
      ?auto_412 - FLEVEL
      ?auto_413 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_410 ?auto_411 ) ( AIRCRAFT-AT ?auto_411 ?auto_414 ) ( FUEL-LEVEL ?auto_411 ?auto_412 ) ( NEXT ?auto_413 ?auto_412 ) ( not ( = ?auto_409 ?auto_414 ) ) ( not ( = ?auto_412 ?auto_413 ) ) )
    :subtasks
    ( ( !FLY ?auto_411 ?auto_414 ?auto_409 ?auto_412 ?auto_413 )
      ( FLY-1PPL ?auto_410 ?auto_409 )
      ( FLY-1PPL-VERIFY ?auto_410 ?auto_409 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_423 - PERSON
      ?auto_422 - CITY
    )
    :vars
    (
      ?auto_424 - AIRCRAFT
      ?auto_427 - CITY
      ?auto_425 - FLEVEL
      ?auto_426 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_424 ?auto_427 ) ( FUEL-LEVEL ?auto_424 ?auto_425 ) ( NEXT ?auto_426 ?auto_425 ) ( not ( = ?auto_422 ?auto_427 ) ) ( not ( = ?auto_425 ?auto_426 ) ) ( PERSON-AT ?auto_423 ?auto_427 ) )
    :subtasks
    ( ( !BOARD ?auto_423 ?auto_424 ?auto_427 )
      ( FLY-1PPL ?auto_423 ?auto_422 )
      ( FLY-1PPL-VERIFY ?auto_423 ?auto_422 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_436 - PERSON
      ?auto_435 - CITY
    )
    :vars
    (
      ?auto_437 - AIRCRAFT
      ?auto_439 - CITY
      ?auto_440 - FLEVEL
      ?auto_438 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_437 ?auto_439 ) ( NEXT ?auto_440 ?auto_438 ) ( not ( = ?auto_435 ?auto_439 ) ) ( not ( = ?auto_438 ?auto_440 ) ) ( PERSON-AT ?auto_436 ?auto_439 ) ( FUEL-LEVEL ?auto_437 ?auto_440 ) )
    :subtasks
    ( ( !REFUEL ?auto_437 ?auto_439 ?auto_440 ?auto_438 )
      ( FLY-1PPL ?auto_436 ?auto_435 )
      ( FLY-1PPL-VERIFY ?auto_436 ?auto_435 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_449 - PERSON
      ?auto_448 - CITY
    )
    :vars
    (
      ?auto_452 - FLEVEL
      ?auto_453 - FLEVEL
      ?auto_451 - CITY
      ?auto_450 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_452 ?auto_453 ) ( not ( = ?auto_448 ?auto_451 ) ) ( not ( = ?auto_453 ?auto_452 ) ) ( PERSON-AT ?auto_449 ?auto_451 ) ( AIRCRAFT-AT ?auto_450 ?auto_448 ) ( FUEL-LEVEL ?auto_450 ?auto_453 ) )
    :subtasks
    ( ( !FLY ?auto_450 ?auto_448 ?auto_451 ?auto_453 ?auto_452 )
      ( FLY-1PPL ?auto_449 ?auto_448 )
      ( FLY-1PPL-VERIFY ?auto_449 ?auto_448 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_462 - PERSON
      ?auto_461 - CITY
    )
    :vars
    (
      ?auto_464 - FLEVEL
      ?auto_465 - FLEVEL
      ?auto_466 - CITY
      ?auto_463 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_464 ?auto_465 ) ( not ( = ?auto_461 ?auto_466 ) ) ( not ( = ?auto_465 ?auto_464 ) ) ( PERSON-AT ?auto_462 ?auto_466 ) ( AIRCRAFT-AT ?auto_463 ?auto_461 ) ( FUEL-LEVEL ?auto_463 ?auto_464 ) )
    :subtasks
    ( ( !REFUEL ?auto_463 ?auto_461 ?auto_464 ?auto_465 )
      ( FLY-1PPL ?auto_462 ?auto_461 )
      ( FLY-1PPL-VERIFY ?auto_462 ?auto_461 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_489 - PERSON
      ?auto_490 - PERSON
      ?auto_488 - CITY
    )
    :vars
    (
      ?auto_491 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_490 ?auto_491 ) ( AIRCRAFT-AT ?auto_491 ?auto_488 ) ( PERSON-AT ?auto_489 ?auto_488 ) ( not ( = ?auto_489 ?auto_490 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_490 ?auto_488 )
      ( FLY-2PPL-VERIFY ?auto_489 ?auto_490 ?auto_488 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_493 - PERSON
      ?auto_494 - PERSON
      ?auto_492 - CITY
    )
    :vars
    (
      ?auto_495 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_493 ?auto_495 ) ( AIRCRAFT-AT ?auto_495 ?auto_492 ) ( PERSON-AT ?auto_494 ?auto_492 ) ( not ( = ?auto_493 ?auto_494 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_493 ?auto_492 )
      ( FLY-2PPL-VERIFY ?auto_493 ?auto_494 ?auto_492 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_507 - PERSON
      ?auto_508 - PERSON
      ?auto_506 - CITY
    )
    :vars
    (
      ?auto_512 - AIRCRAFT
      ?auto_511 - CITY
      ?auto_510 - FLEVEL
      ?auto_509 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_508 ?auto_512 ) ( AIRCRAFT-AT ?auto_512 ?auto_511 ) ( FUEL-LEVEL ?auto_512 ?auto_510 ) ( NEXT ?auto_509 ?auto_510 ) ( not ( = ?auto_506 ?auto_511 ) ) ( not ( = ?auto_510 ?auto_509 ) ) ( PERSON-AT ?auto_507 ?auto_506 ) ( not ( = ?auto_507 ?auto_508 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_508 ?auto_506 )
      ( FLY-2PPL-VERIFY ?auto_507 ?auto_508 ?auto_506 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_514 - PERSON
      ?auto_515 - PERSON
      ?auto_513 - CITY
    )
    :vars
    (
      ?auto_518 - AIRCRAFT
      ?auto_519 - CITY
      ?auto_517 - FLEVEL
      ?auto_516 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_514 ?auto_518 ) ( AIRCRAFT-AT ?auto_518 ?auto_519 ) ( FUEL-LEVEL ?auto_518 ?auto_517 ) ( NEXT ?auto_516 ?auto_517 ) ( not ( = ?auto_513 ?auto_519 ) ) ( not ( = ?auto_517 ?auto_516 ) ) ( PERSON-AT ?auto_515 ?auto_513 ) ( not ( = ?auto_515 ?auto_514 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_515 ?auto_514 ?auto_513 )
      ( FLY-2PPL-VERIFY ?auto_514 ?auto_515 ?auto_513 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_529 - PERSON
      ?auto_528 - CITY
    )
    :vars
    (
      ?auto_533 - AIRCRAFT
      ?auto_534 - CITY
      ?auto_532 - FLEVEL
      ?auto_530 - FLEVEL
      ?auto_531 - PERSON
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_533 ?auto_534 ) ( FUEL-LEVEL ?auto_533 ?auto_532 ) ( NEXT ?auto_530 ?auto_532 ) ( not ( = ?auto_528 ?auto_534 ) ) ( not ( = ?auto_532 ?auto_530 ) ) ( PERSON-AT ?auto_531 ?auto_528 ) ( not ( = ?auto_531 ?auto_529 ) ) ( PERSON-AT ?auto_529 ?auto_534 ) )
    :subtasks
    ( ( !BOARD ?auto_529 ?auto_533 ?auto_534 )
      ( FLY-2PPL ?auto_531 ?auto_529 ?auto_528 )
      ( FLY-1PPL-VERIFY ?auto_529 ?auto_528 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_536 - PERSON
      ?auto_537 - PERSON
      ?auto_535 - CITY
    )
    :vars
    (
      ?auto_541 - AIRCRAFT
      ?auto_538 - CITY
      ?auto_540 - FLEVEL
      ?auto_539 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_541 ?auto_538 ) ( FUEL-LEVEL ?auto_541 ?auto_540 ) ( NEXT ?auto_539 ?auto_540 ) ( not ( = ?auto_535 ?auto_538 ) ) ( not ( = ?auto_540 ?auto_539 ) ) ( PERSON-AT ?auto_536 ?auto_535 ) ( not ( = ?auto_536 ?auto_537 ) ) ( PERSON-AT ?auto_537 ?auto_538 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_537 ?auto_535 )
      ( FLY-2PPL-VERIFY ?auto_536 ?auto_537 ?auto_535 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_543 - PERSON
      ?auto_544 - PERSON
      ?auto_542 - CITY
    )
    :vars
    (
      ?auto_548 - AIRCRAFT
      ?auto_545 - CITY
      ?auto_546 - FLEVEL
      ?auto_547 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_548 ?auto_545 ) ( FUEL-LEVEL ?auto_548 ?auto_546 ) ( NEXT ?auto_547 ?auto_546 ) ( not ( = ?auto_542 ?auto_545 ) ) ( not ( = ?auto_546 ?auto_547 ) ) ( PERSON-AT ?auto_544 ?auto_542 ) ( not ( = ?auto_544 ?auto_543 ) ) ( PERSON-AT ?auto_543 ?auto_545 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_544 ?auto_543 ?auto_542 )
      ( FLY-2PPL-VERIFY ?auto_543 ?auto_544 ?auto_542 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_558 - PERSON
      ?auto_557 - CITY
    )
    :vars
    (
      ?auto_563 - AIRCRAFT
      ?auto_559 - CITY
      ?auto_562 - FLEVEL
      ?auto_561 - FLEVEL
      ?auto_560 - PERSON
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_563 ?auto_559 ) ( NEXT ?auto_562 ?auto_561 ) ( not ( = ?auto_557 ?auto_559 ) ) ( not ( = ?auto_561 ?auto_562 ) ) ( PERSON-AT ?auto_560 ?auto_557 ) ( not ( = ?auto_560 ?auto_558 ) ) ( PERSON-AT ?auto_558 ?auto_559 ) ( FUEL-LEVEL ?auto_563 ?auto_562 ) )
    :subtasks
    ( ( !REFUEL ?auto_563 ?auto_559 ?auto_562 ?auto_561 )
      ( FLY-2PPL ?auto_560 ?auto_558 ?auto_557 )
      ( FLY-1PPL-VERIFY ?auto_558 ?auto_557 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_565 - PERSON
      ?auto_566 - PERSON
      ?auto_564 - CITY
    )
    :vars
    (
      ?auto_568 - AIRCRAFT
      ?auto_567 - CITY
      ?auto_569 - FLEVEL
      ?auto_570 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_568 ?auto_567 ) ( NEXT ?auto_569 ?auto_570 ) ( not ( = ?auto_564 ?auto_567 ) ) ( not ( = ?auto_570 ?auto_569 ) ) ( PERSON-AT ?auto_565 ?auto_564 ) ( not ( = ?auto_565 ?auto_566 ) ) ( PERSON-AT ?auto_566 ?auto_567 ) ( FUEL-LEVEL ?auto_568 ?auto_569 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_566 ?auto_564 )
      ( FLY-2PPL-VERIFY ?auto_565 ?auto_566 ?auto_564 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_572 - PERSON
      ?auto_573 - PERSON
      ?auto_571 - CITY
    )
    :vars
    (
      ?auto_577 - AIRCRAFT
      ?auto_574 - CITY
      ?auto_576 - FLEVEL
      ?auto_575 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_577 ?auto_574 ) ( NEXT ?auto_576 ?auto_575 ) ( not ( = ?auto_571 ?auto_574 ) ) ( not ( = ?auto_575 ?auto_576 ) ) ( PERSON-AT ?auto_573 ?auto_571 ) ( not ( = ?auto_573 ?auto_572 ) ) ( PERSON-AT ?auto_572 ?auto_574 ) ( FUEL-LEVEL ?auto_577 ?auto_576 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_573 ?auto_572 ?auto_571 )
      ( FLY-2PPL-VERIFY ?auto_572 ?auto_573 ?auto_571 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_587 - PERSON
      ?auto_586 - CITY
    )
    :vars
    (
      ?auto_590 - FLEVEL
      ?auto_589 - FLEVEL
      ?auto_588 - CITY
      ?auto_591 - PERSON
      ?auto_592 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_590 ?auto_589 ) ( not ( = ?auto_586 ?auto_588 ) ) ( not ( = ?auto_589 ?auto_590 ) ) ( PERSON-AT ?auto_591 ?auto_586 ) ( not ( = ?auto_591 ?auto_587 ) ) ( PERSON-AT ?auto_587 ?auto_588 ) ( AIRCRAFT-AT ?auto_592 ?auto_586 ) ( FUEL-LEVEL ?auto_592 ?auto_589 ) )
    :subtasks
    ( ( !FLY ?auto_592 ?auto_586 ?auto_588 ?auto_589 ?auto_590 )
      ( FLY-2PPL ?auto_591 ?auto_587 ?auto_586 )
      ( FLY-1PPL-VERIFY ?auto_587 ?auto_586 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_594 - PERSON
      ?auto_595 - PERSON
      ?auto_593 - CITY
    )
    :vars
    (
      ?auto_596 - FLEVEL
      ?auto_597 - FLEVEL
      ?auto_598 - CITY
      ?auto_599 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_596 ?auto_597 ) ( not ( = ?auto_593 ?auto_598 ) ) ( not ( = ?auto_597 ?auto_596 ) ) ( PERSON-AT ?auto_594 ?auto_593 ) ( not ( = ?auto_594 ?auto_595 ) ) ( PERSON-AT ?auto_595 ?auto_598 ) ( AIRCRAFT-AT ?auto_599 ?auto_593 ) ( FUEL-LEVEL ?auto_599 ?auto_597 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_595 ?auto_593 )
      ( FLY-2PPL-VERIFY ?auto_594 ?auto_595 ?auto_593 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_601 - PERSON
      ?auto_602 - PERSON
      ?auto_600 - CITY
    )
    :vars
    (
      ?auto_606 - FLEVEL
      ?auto_603 - FLEVEL
      ?auto_605 - CITY
      ?auto_604 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_606 ?auto_603 ) ( not ( = ?auto_600 ?auto_605 ) ) ( not ( = ?auto_603 ?auto_606 ) ) ( PERSON-AT ?auto_602 ?auto_600 ) ( not ( = ?auto_602 ?auto_601 ) ) ( PERSON-AT ?auto_601 ?auto_605 ) ( AIRCRAFT-AT ?auto_604 ?auto_600 ) ( FUEL-LEVEL ?auto_604 ?auto_603 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_602 ?auto_601 ?auto_600 )
      ( FLY-2PPL-VERIFY ?auto_601 ?auto_602 ?auto_600 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_616 - PERSON
      ?auto_615 - CITY
    )
    :vars
    (
      ?auto_621 - FLEVEL
      ?auto_617 - FLEVEL
      ?auto_619 - CITY
      ?auto_620 - PERSON
      ?auto_618 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_621 ?auto_617 ) ( not ( = ?auto_615 ?auto_619 ) ) ( not ( = ?auto_617 ?auto_621 ) ) ( PERSON-AT ?auto_620 ?auto_615 ) ( not ( = ?auto_620 ?auto_616 ) ) ( PERSON-AT ?auto_616 ?auto_619 ) ( AIRCRAFT-AT ?auto_618 ?auto_615 ) ( FUEL-LEVEL ?auto_618 ?auto_621 ) )
    :subtasks
    ( ( !REFUEL ?auto_618 ?auto_615 ?auto_621 ?auto_617 )
      ( FLY-2PPL ?auto_620 ?auto_616 ?auto_615 )
      ( FLY-1PPL-VERIFY ?auto_616 ?auto_615 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_623 - PERSON
      ?auto_624 - PERSON
      ?auto_622 - CITY
    )
    :vars
    (
      ?auto_626 - FLEVEL
      ?auto_627 - FLEVEL
      ?auto_625 - CITY
      ?auto_628 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_626 ?auto_627 ) ( not ( = ?auto_622 ?auto_625 ) ) ( not ( = ?auto_627 ?auto_626 ) ) ( PERSON-AT ?auto_623 ?auto_622 ) ( not ( = ?auto_623 ?auto_624 ) ) ( PERSON-AT ?auto_624 ?auto_625 ) ( AIRCRAFT-AT ?auto_628 ?auto_622 ) ( FUEL-LEVEL ?auto_628 ?auto_626 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_624 ?auto_622 )
      ( FLY-2PPL-VERIFY ?auto_623 ?auto_624 ?auto_622 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_630 - PERSON
      ?auto_631 - PERSON
      ?auto_629 - CITY
    )
    :vars
    (
      ?auto_635 - FLEVEL
      ?auto_633 - FLEVEL
      ?auto_634 - CITY
      ?auto_632 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_635 ?auto_633 ) ( not ( = ?auto_629 ?auto_634 ) ) ( not ( = ?auto_633 ?auto_635 ) ) ( PERSON-AT ?auto_631 ?auto_629 ) ( not ( = ?auto_631 ?auto_630 ) ) ( PERSON-AT ?auto_630 ?auto_634 ) ( AIRCRAFT-AT ?auto_632 ?auto_629 ) ( FUEL-LEVEL ?auto_632 ?auto_635 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_631 ?auto_630 ?auto_629 )
      ( FLY-2PPL-VERIFY ?auto_630 ?auto_631 ?auto_629 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_645 - PERSON
      ?auto_644 - CITY
    )
    :vars
    (
      ?auto_650 - FLEVEL
      ?auto_648 - FLEVEL
      ?auto_649 - CITY
      ?auto_646 - PERSON
      ?auto_647 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_650 ?auto_648 ) ( not ( = ?auto_644 ?auto_649 ) ) ( not ( = ?auto_648 ?auto_650 ) ) ( not ( = ?auto_646 ?auto_645 ) ) ( PERSON-AT ?auto_645 ?auto_649 ) ( AIRCRAFT-AT ?auto_647 ?auto_644 ) ( FUEL-LEVEL ?auto_647 ?auto_650 ) ( IN ?auto_646 ?auto_647 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_646 ?auto_644 )
      ( FLY-2PPL ?auto_646 ?auto_645 ?auto_644 )
      ( FLY-1PPL-VERIFY ?auto_645 ?auto_644 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_652 - PERSON
      ?auto_653 - PERSON
      ?auto_651 - CITY
    )
    :vars
    (
      ?auto_656 - FLEVEL
      ?auto_654 - FLEVEL
      ?auto_655 - CITY
      ?auto_657 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_656 ?auto_654 ) ( not ( = ?auto_651 ?auto_655 ) ) ( not ( = ?auto_654 ?auto_656 ) ) ( not ( = ?auto_652 ?auto_653 ) ) ( PERSON-AT ?auto_653 ?auto_655 ) ( AIRCRAFT-AT ?auto_657 ?auto_651 ) ( FUEL-LEVEL ?auto_657 ?auto_656 ) ( IN ?auto_652 ?auto_657 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_653 ?auto_651 )
      ( FLY-2PPL-VERIFY ?auto_652 ?auto_653 ?auto_651 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_659 - PERSON
      ?auto_660 - PERSON
      ?auto_658 - CITY
    )
    :vars
    (
      ?auto_663 - FLEVEL
      ?auto_661 - FLEVEL
      ?auto_662 - CITY
      ?auto_664 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_663 ?auto_661 ) ( not ( = ?auto_658 ?auto_662 ) ) ( not ( = ?auto_661 ?auto_663 ) ) ( not ( = ?auto_660 ?auto_659 ) ) ( PERSON-AT ?auto_659 ?auto_662 ) ( AIRCRAFT-AT ?auto_664 ?auto_658 ) ( FUEL-LEVEL ?auto_664 ?auto_663 ) ( IN ?auto_660 ?auto_664 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_660 ?auto_659 ?auto_658 )
      ( FLY-2PPL-VERIFY ?auto_659 ?auto_660 ?auto_658 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_674 - PERSON
      ?auto_673 - CITY
    )
    :vars
    (
      ?auto_678 - FLEVEL
      ?auto_675 - FLEVEL
      ?auto_676 - CITY
      ?auto_677 - PERSON
      ?auto_679 - AIRCRAFT
      ?auto_680 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_678 ?auto_675 ) ( not ( = ?auto_673 ?auto_676 ) ) ( not ( = ?auto_675 ?auto_678 ) ) ( not ( = ?auto_677 ?auto_674 ) ) ( PERSON-AT ?auto_674 ?auto_676 ) ( IN ?auto_677 ?auto_679 ) ( AIRCRAFT-AT ?auto_679 ?auto_680 ) ( FUEL-LEVEL ?auto_679 ?auto_675 ) ( not ( = ?auto_673 ?auto_680 ) ) ( not ( = ?auto_676 ?auto_680 ) ) )
    :subtasks
    ( ( !FLY ?auto_679 ?auto_680 ?auto_673 ?auto_675 ?auto_678 )
      ( FLY-2PPL ?auto_677 ?auto_674 ?auto_673 )
      ( FLY-1PPL-VERIFY ?auto_674 ?auto_673 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_682 - PERSON
      ?auto_683 - PERSON
      ?auto_681 - CITY
    )
    :vars
    (
      ?auto_684 - FLEVEL
      ?auto_688 - FLEVEL
      ?auto_686 - CITY
      ?auto_685 - AIRCRAFT
      ?auto_687 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_684 ?auto_688 ) ( not ( = ?auto_681 ?auto_686 ) ) ( not ( = ?auto_688 ?auto_684 ) ) ( not ( = ?auto_682 ?auto_683 ) ) ( PERSON-AT ?auto_683 ?auto_686 ) ( IN ?auto_682 ?auto_685 ) ( AIRCRAFT-AT ?auto_685 ?auto_687 ) ( FUEL-LEVEL ?auto_685 ?auto_688 ) ( not ( = ?auto_681 ?auto_687 ) ) ( not ( = ?auto_686 ?auto_687 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_683 ?auto_681 )
      ( FLY-2PPL-VERIFY ?auto_682 ?auto_683 ?auto_681 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_690 - PERSON
      ?auto_691 - PERSON
      ?auto_689 - CITY
    )
    :vars
    (
      ?auto_694 - FLEVEL
      ?auto_692 - FLEVEL
      ?auto_696 - CITY
      ?auto_693 - AIRCRAFT
      ?auto_695 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_694 ?auto_692 ) ( not ( = ?auto_689 ?auto_696 ) ) ( not ( = ?auto_692 ?auto_694 ) ) ( not ( = ?auto_691 ?auto_690 ) ) ( PERSON-AT ?auto_690 ?auto_696 ) ( IN ?auto_691 ?auto_693 ) ( AIRCRAFT-AT ?auto_693 ?auto_695 ) ( FUEL-LEVEL ?auto_693 ?auto_692 ) ( not ( = ?auto_689 ?auto_695 ) ) ( not ( = ?auto_696 ?auto_695 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_691 ?auto_690 ?auto_689 )
      ( FLY-2PPL-VERIFY ?auto_690 ?auto_691 ?auto_689 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_707 - PERSON
      ?auto_706 - CITY
    )
    :vars
    (
      ?auto_711 - FLEVEL
      ?auto_709 - FLEVEL
      ?auto_713 - CITY
      ?auto_708 - PERSON
      ?auto_710 - AIRCRAFT
      ?auto_712 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_711 ?auto_709 ) ( not ( = ?auto_706 ?auto_713 ) ) ( not ( = ?auto_709 ?auto_711 ) ) ( not ( = ?auto_708 ?auto_707 ) ) ( PERSON-AT ?auto_707 ?auto_713 ) ( AIRCRAFT-AT ?auto_710 ?auto_712 ) ( FUEL-LEVEL ?auto_710 ?auto_709 ) ( not ( = ?auto_706 ?auto_712 ) ) ( not ( = ?auto_713 ?auto_712 ) ) ( PERSON-AT ?auto_708 ?auto_712 ) )
    :subtasks
    ( ( !BOARD ?auto_708 ?auto_710 ?auto_712 )
      ( FLY-2PPL ?auto_708 ?auto_707 ?auto_706 )
      ( FLY-1PPL-VERIFY ?auto_707 ?auto_706 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_715 - PERSON
      ?auto_716 - PERSON
      ?auto_714 - CITY
    )
    :vars
    (
      ?auto_718 - FLEVEL
      ?auto_717 - FLEVEL
      ?auto_721 - CITY
      ?auto_720 - AIRCRAFT
      ?auto_719 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_718 ?auto_717 ) ( not ( = ?auto_714 ?auto_721 ) ) ( not ( = ?auto_717 ?auto_718 ) ) ( not ( = ?auto_715 ?auto_716 ) ) ( PERSON-AT ?auto_716 ?auto_721 ) ( AIRCRAFT-AT ?auto_720 ?auto_719 ) ( FUEL-LEVEL ?auto_720 ?auto_717 ) ( not ( = ?auto_714 ?auto_719 ) ) ( not ( = ?auto_721 ?auto_719 ) ) ( PERSON-AT ?auto_715 ?auto_719 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_716 ?auto_714 )
      ( FLY-2PPL-VERIFY ?auto_715 ?auto_716 ?auto_714 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_723 - PERSON
      ?auto_724 - PERSON
      ?auto_722 - CITY
    )
    :vars
    (
      ?auto_726 - FLEVEL
      ?auto_725 - FLEVEL
      ?auto_728 - CITY
      ?auto_727 - AIRCRAFT
      ?auto_729 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_726 ?auto_725 ) ( not ( = ?auto_722 ?auto_728 ) ) ( not ( = ?auto_725 ?auto_726 ) ) ( not ( = ?auto_724 ?auto_723 ) ) ( PERSON-AT ?auto_723 ?auto_728 ) ( AIRCRAFT-AT ?auto_727 ?auto_729 ) ( FUEL-LEVEL ?auto_727 ?auto_725 ) ( not ( = ?auto_722 ?auto_729 ) ) ( not ( = ?auto_728 ?auto_729 ) ) ( PERSON-AT ?auto_724 ?auto_729 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_724 ?auto_723 ?auto_722 )
      ( FLY-2PPL-VERIFY ?auto_723 ?auto_724 ?auto_722 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_740 - PERSON
      ?auto_739 - CITY
    )
    :vars
    (
      ?auto_742 - FLEVEL
      ?auto_741 - FLEVEL
      ?auto_744 - CITY
      ?auto_746 - PERSON
      ?auto_743 - AIRCRAFT
      ?auto_745 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_742 ?auto_741 ) ( not ( = ?auto_739 ?auto_744 ) ) ( not ( = ?auto_741 ?auto_742 ) ) ( not ( = ?auto_746 ?auto_740 ) ) ( PERSON-AT ?auto_740 ?auto_744 ) ( AIRCRAFT-AT ?auto_743 ?auto_745 ) ( not ( = ?auto_739 ?auto_745 ) ) ( not ( = ?auto_744 ?auto_745 ) ) ( PERSON-AT ?auto_746 ?auto_745 ) ( FUEL-LEVEL ?auto_743 ?auto_742 ) )
    :subtasks
    ( ( !REFUEL ?auto_743 ?auto_745 ?auto_742 ?auto_741 )
      ( FLY-2PPL ?auto_746 ?auto_740 ?auto_739 )
      ( FLY-1PPL-VERIFY ?auto_740 ?auto_739 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_748 - PERSON
      ?auto_749 - PERSON
      ?auto_747 - CITY
    )
    :vars
    (
      ?auto_751 - FLEVEL
      ?auto_752 - FLEVEL
      ?auto_753 - CITY
      ?auto_754 - AIRCRAFT
      ?auto_750 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_751 ?auto_752 ) ( not ( = ?auto_747 ?auto_753 ) ) ( not ( = ?auto_752 ?auto_751 ) ) ( not ( = ?auto_748 ?auto_749 ) ) ( PERSON-AT ?auto_749 ?auto_753 ) ( AIRCRAFT-AT ?auto_754 ?auto_750 ) ( not ( = ?auto_747 ?auto_750 ) ) ( not ( = ?auto_753 ?auto_750 ) ) ( PERSON-AT ?auto_748 ?auto_750 ) ( FUEL-LEVEL ?auto_754 ?auto_751 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_749 ?auto_747 )
      ( FLY-2PPL-VERIFY ?auto_748 ?auto_749 ?auto_747 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_756 - PERSON
      ?auto_757 - PERSON
      ?auto_755 - CITY
    )
    :vars
    (
      ?auto_761 - FLEVEL
      ?auto_759 - FLEVEL
      ?auto_760 - CITY
      ?auto_758 - AIRCRAFT
      ?auto_762 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_761 ?auto_759 ) ( not ( = ?auto_755 ?auto_760 ) ) ( not ( = ?auto_759 ?auto_761 ) ) ( not ( = ?auto_757 ?auto_756 ) ) ( PERSON-AT ?auto_756 ?auto_760 ) ( AIRCRAFT-AT ?auto_758 ?auto_762 ) ( not ( = ?auto_755 ?auto_762 ) ) ( not ( = ?auto_760 ?auto_762 ) ) ( PERSON-AT ?auto_757 ?auto_762 ) ( FUEL-LEVEL ?auto_758 ?auto_761 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_757 ?auto_756 ?auto_755 )
      ( FLY-2PPL-VERIFY ?auto_756 ?auto_757 ?auto_755 ) )
  )

)

