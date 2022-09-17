( define ( domain zeno-travel )
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

  ( :method TRAVEL-VERIFY
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

  ( :method TRAVEL
    :parameters
    (
      ?auto_2 - PERSON
      ?auto_3 - CITY
    )
    :vars
    (
      ?auto_6 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_2 ?auto_6 ) ( AIRCRAFT-AT ?auto_6 ?auto_3 ) )
    :subtasks
    ( ( !DEBARK ?auto_2 ?auto_6 ?auto_3 )
      ( TRAVEL-VERIFY ?auto_2 ?auto_3 ) )
  )

  ( :method TRAVEL
    :parameters
    (
      ?auto_11 - PERSON
      ?auto_12 - CITY
    )
    :vars
    (
      ?auto_13 - AIRCRAFT
      ?auto_19 - CITY
      ?auto_17 - FLEVEL
      ?auto_18 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_11 ?auto_13 ) ( AIRCRAFT-AT ?auto_13 ?auto_19 ) ( FUEL-LEVEL ?auto_13 ?auto_17 ) ( NEXT ?auto_18 ?auto_17 ) )
    :subtasks
    ( ( !FLY ?auto_13 ?auto_19 ?auto_12 ?auto_17 ?auto_18 )
      ( TRAVEL ?auto_11 ?auto_12 )
      ( TRAVEL-VERIFY ?auto_11 ?auto_12 ) )
  )

  ( :method TRAVEL
    :parameters
    (
      ?auto_25 - PERSON
      ?auto_26 - CITY
    )
    :vars
    (
      ?auto_28 - AIRCRAFT
      ?auto_27 - CITY
      ?auto_30 - FLEVEL
      ?auto_32 - FLEVEL
      ?auto_34 - CITY
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_28 ?auto_27 ) ( FUEL-LEVEL ?auto_28 ?auto_30 ) ( NEXT ?auto_32 ?auto_30 ) ( PERSON-AT ?auto_25 ?auto_34 ) ( AIRCRAFT-AT ?auto_28 ?auto_34 ) )
    :subtasks
    ( ( !BOARD ?auto_25 ?auto_28 ?auto_34 )
      ( TRAVEL ?auto_25 ?auto_26 )
      ( TRAVEL-VERIFY ?auto_25 ?auto_26 ) )
  )

  ( :method TRAVEL
    :parameters
    (
      ?auto_412 - PERSON
      ?auto_413 - CITY
    )
    :vars
    (
      ?auto_420 - FLEVEL
      ?auto_416 - FLEVEL
      ?auto_422 - CITY
      ?auto_421 - FLEVEL
      ?auto_415 - AIRCRAFT
      ?auto_426 - CITY
      ?auto_424 - FLEVEL
    )
    :precondition
    ( and ( NEXT ?auto_420 ?auto_416 ) ( PERSON-AT ?auto_412 ?auto_422 ) ( NEXT ?auto_421 ?auto_416 ) ( AIRCRAFT-AT ?auto_415 ?auto_426 ) ( FUEL-LEVEL ?auto_415 ?auto_424 ) ( NEXT ?auto_421 ?auto_424 ) )
    :subtasks
    ( ( !FLY ?auto_415 ?auto_426 ?auto_422 ?auto_424 ?auto_421 )
      ( TRAVEL ?auto_412 ?auto_413 )
      ( TRAVEL-VERIFY ?auto_412 ?auto_413 ) )
  )

  ( :method TRAVEL
    :parameters
    (
      ?auto_497 - PERSON
      ?auto_498 - CITY
    )
    :vars
    (
      ?auto_507 - FLEVEL
      ?auto_504 - FLEVEL
      ?auto_502 - CITY
      ?auto_503 - FLEVEL
      ?auto_506 - AIRCRAFT
      ?auto_505 - CITY
      ?auto_500 - FLEVEL
      ?auto_510 - FLEVEL
      ?auto_508 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_507 ?auto_504 ) ( PERSON-AT ?auto_497 ?auto_502 ) ( NEXT ?auto_503 ?auto_504 ) ( AIRCRAFT-AT ?auto_506 ?auto_505 ) ( NEXT ?auto_503 ?auto_500 ) ( FUEL-LEVEL ?auto_506 ?auto_510 ) ( NEXT ?auto_510 ?auto_500 ) ( AIRCRAFT-AT ?auto_506 ?auto_508 ) )
    :subtasks
    ( ( !REFUEL ?auto_506 ?auto_508 ?auto_510 ?auto_500 )
      ( TRAVEL ?auto_497 ?auto_498 )
      ( TRAVEL-VERIFY ?auto_497 ?auto_498 ) )
  )

  ( :method TRAVEL
    :parameters
    (
      ?auto_250 - PERSON
      ?auto_251 - CITY
    )
    :vars
    (
      ?auto_253 - AIRCRAFT
      ?auto_257 - CITY
      ?auto_254 - FLEVEL
      ?auto_256 - FLEVEL
      ?auto_260 - FLEVEL
      ?auto_258 - CITY
    )
    :precondition
    ( and ( IN ?auto_250 ?auto_253 ) ( AIRCRAFT-AT ?auto_253 ?auto_257 ) ( NEXT ?auto_254 ?auto_256 ) ( FUEL-LEVEL ?auto_253 ?auto_260 ) ( NEXT ?auto_260 ?auto_256 ) ( AIRCRAFT-AT ?auto_253 ?auto_258 ) )
    :subtasks
    ( ( !REFUEL ?auto_253 ?auto_258 ?auto_260 ?auto_256 )
      ( TRAVEL ?auto_250 ?auto_251 )
      ( TRAVEL-VERIFY ?auto_250 ?auto_251 ) )
  )

  ( :method TRAVEL
    :parameters
    (
      ?auto_305 - PERSON
      ?auto_306 - CITY
    )
    :vars
    (
      ?auto_309 - AIRCRAFT
      ?auto_308 - CITY
      ?auto_307 - FLEVEL
      ?auto_310 - FLEVEL
      ?auto_313 - FLEVEL
      ?auto_314 - CITY
      ?auto_316 - CITY
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_309 ?auto_308 ) ( NEXT ?auto_307 ?auto_310 ) ( FUEL-LEVEL ?auto_309 ?auto_313 ) ( NEXT ?auto_313 ?auto_310 ) ( AIRCRAFT-AT ?auto_309 ?auto_314 ) ( PERSON-AT ?auto_305 ?auto_316 ) ( AIRCRAFT-AT ?auto_309 ?auto_316 ) )
    :subtasks
    ( ( !BOARD ?auto_305 ?auto_309 ?auto_316 )
      ( TRAVEL ?auto_305 ?auto_306 )
      ( TRAVEL-VERIFY ?auto_305 ?auto_306 ) )
  )

  ( :method TRAVEL
    :parameters
    (
      ?auto_518 - PERSON
      ?auto_519 - CITY
    )
    :vars
    (
      ?auto_522 - AIRCRAFT
      ?auto_527 - CITY
      ?auto_524 - FLEVEL
      ?auto_525 - FLEVEL
      ?auto_526 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_518 ?auto_522 ) ( AIRCRAFT-AT ?auto_522 ?auto_527 ) ( FUEL-LEVEL ?auto_522 ?auto_524 ) ( NEXT ?auto_525 ?auto_524 ) ( NEXT ?auto_526 ?auto_525 ) )
    :subtasks
    ( ( !ZOOM ?auto_522 ?auto_527 ?auto_519 ?auto_524 ?auto_525 ?auto_526 )
      ( TRAVEL ?auto_518 ?auto_519 )
      ( TRAVEL-VERIFY ?auto_518 ?auto_519 ) )
  )

  ( :method TRAVEL
    :parameters
    (
      ?auto_679 - PERSON
      ?auto_680 - CITY
    )
    :vars
    (
      ?auto_681 - FLEVEL
      ?auto_684 - FLEVEL
      ?auto_689 - CITY
      ?auto_683 - FLEVEL
      ?auto_687 - AIRCRAFT
      ?auto_694 - CITY
      ?auto_691 - FLEVEL
      ?auto_692 - FLEVEL
    )
    :precondition
    ( and ( NEXT ?auto_681 ?auto_684 ) ( PERSON-AT ?auto_679 ?auto_689 ) ( NEXT ?auto_683 ?auto_684 ) ( AIRCRAFT-AT ?auto_687 ?auto_694 ) ( FUEL-LEVEL ?auto_687 ?auto_691 ) ( NEXT ?auto_692 ?auto_691 ) ( NEXT ?auto_683 ?auto_692 ) )
    :subtasks
    ( ( !ZOOM ?auto_687 ?auto_694 ?auto_689 ?auto_691 ?auto_692 ?auto_683 )
      ( TRAVEL ?auto_679 ?auto_680 )
      ( TRAVEL-VERIFY ?auto_679 ?auto_680 ) )
  )

)

