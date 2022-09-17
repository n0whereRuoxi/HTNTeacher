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
      ?auto_21 - PERSON
      ?auto_22 - CITY
    )
    :vars
    (
      ?auto_25 - AIRCRAFT
      ?auto_28 - CITY
      ?auto_26 - FLEVEL
      ?auto_27 - FLEVEL
      ?auto_30 - CITY
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_25 ?auto_28 ) ( FUEL-LEVEL ?auto_25 ?auto_26 ) ( NEXT ?auto_27 ?auto_26 ) ( PERSON-AT ?auto_21 ?auto_30 ) ( AIRCRAFT-AT ?auto_25 ?auto_30 ) )
    :subtasks
    ( ( !BOARD ?auto_21 ?auto_25 ?auto_30 )
      ( TRAVEL ?auto_21 ?auto_22 )
      ( TRAVEL-VERIFY ?auto_21 ?auto_22 ) )
  )

  ( :method TRAVEL
    :parameters
    (
      ?auto_133 - PERSON
      ?auto_134 - CITY
    )
    :vars
    (
      ?auto_142 - FLEVEL
      ?auto_136 - FLEVEL
      ?auto_143 - CITY
      ?auto_141 - FLEVEL
      ?auto_135 - AIRCRAFT
      ?auto_147 - CITY
      ?auto_145 - FLEVEL
    )
    :precondition
    ( and ( NEXT ?auto_142 ?auto_136 ) ( PERSON-AT ?auto_133 ?auto_143 ) ( NEXT ?auto_141 ?auto_136 ) ( AIRCRAFT-AT ?auto_135 ?auto_147 ) ( FUEL-LEVEL ?auto_135 ?auto_145 ) ( NEXT ?auto_141 ?auto_145 ) )
    :subtasks
    ( ( !FLY ?auto_135 ?auto_147 ?auto_143 ?auto_145 ?auto_141 )
      ( TRAVEL ?auto_133 ?auto_134 )
      ( TRAVEL-VERIFY ?auto_133 ?auto_134 ) )
  )

  ( :method TRAVEL
    :parameters
    (
      ?auto_401 - PERSON
      ?auto_402 - CITY
    )
    :vars
    (
      ?auto_405 - FLEVEL
      ?auto_406 - FLEVEL
      ?auto_411 - CITY
      ?auto_403 - FLEVEL
      ?auto_410 - AIRCRAFT
      ?auto_409 - CITY
      ?auto_404 - FLEVEL
      ?auto_414 - FLEVEL
      ?auto_412 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_405 ?auto_406 ) ( PERSON-AT ?auto_401 ?auto_411 ) ( NEXT ?auto_403 ?auto_406 ) ( AIRCRAFT-AT ?auto_410 ?auto_409 ) ( NEXT ?auto_403 ?auto_404 ) ( FUEL-LEVEL ?auto_410 ?auto_414 ) ( NEXT ?auto_414 ?auto_404 ) ( AIRCRAFT-AT ?auto_410 ?auto_412 ) )
    :subtasks
    ( ( !REFUEL ?auto_410 ?auto_412 ?auto_414 ?auto_404 )
      ( TRAVEL ?auto_401 ?auto_402 )
      ( TRAVEL-VERIFY ?auto_401 ?auto_402 ) )
  )

  ( :method TRAVEL
    :parameters
    (
      ?auto_178 - PERSON
      ?auto_179 - CITY
    )
    :vars
    (
      ?auto_182 - AIRCRAFT
      ?auto_185 - CITY
      ?auto_184 - FLEVEL
      ?auto_183 - FLEVEL
      ?auto_188 - FLEVEL
      ?auto_186 - CITY
    )
    :precondition
    ( and ( IN ?auto_178 ?auto_182 ) ( AIRCRAFT-AT ?auto_182 ?auto_185 ) ( NEXT ?auto_184 ?auto_183 ) ( FUEL-LEVEL ?auto_182 ?auto_188 ) ( NEXT ?auto_188 ?auto_183 ) ( AIRCRAFT-AT ?auto_182 ?auto_186 ) )
    :subtasks
    ( ( !REFUEL ?auto_182 ?auto_186 ?auto_188 ?auto_183 )
      ( TRAVEL ?auto_178 ?auto_179 )
      ( TRAVEL-VERIFY ?auto_178 ?auto_179 ) )
  )

  ( :method TRAVEL
    :parameters
    (
      ?auto_239 - PERSON
      ?auto_240 - CITY
    )
    :vars
    (
      ?auto_242 - AIRCRAFT
      ?auto_245 - CITY
      ?auto_243 - FLEVEL
      ?auto_246 - FLEVEL
      ?auto_248 - FLEVEL
      ?auto_241 - CITY
      ?auto_250 - CITY
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_242 ?auto_245 ) ( NEXT ?auto_243 ?auto_246 ) ( FUEL-LEVEL ?auto_242 ?auto_248 ) ( NEXT ?auto_248 ?auto_246 ) ( AIRCRAFT-AT ?auto_242 ?auto_241 ) ( PERSON-AT ?auto_239 ?auto_250 ) ( AIRCRAFT-AT ?auto_242 ?auto_250 ) )
    :subtasks
    ( ( !BOARD ?auto_239 ?auto_242 ?auto_250 )
      ( TRAVEL ?auto_239 ?auto_240 )
      ( TRAVEL-VERIFY ?auto_239 ?auto_240 ) )
  )

  ( :method TRAVEL
    :parameters
    (
      ?auto_422 - PERSON
      ?auto_423 - CITY
    )
    :vars
    (
      ?auto_426 - AIRCRAFT
      ?auto_431 - CITY
      ?auto_428 - FLEVEL
      ?auto_429 - FLEVEL
      ?auto_430 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_422 ?auto_426 ) ( AIRCRAFT-AT ?auto_426 ?auto_431 ) ( FUEL-LEVEL ?auto_426 ?auto_428 ) ( NEXT ?auto_429 ?auto_428 ) ( NEXT ?auto_430 ?auto_429 ) )
    :subtasks
    ( ( !ZOOM ?auto_426 ?auto_431 ?auto_423 ?auto_428 ?auto_429 ?auto_430 )
      ( TRAVEL ?auto_422 ?auto_423 )
      ( TRAVEL-VERIFY ?auto_422 ?auto_423 ) )
  )

  ( :method TRAVEL
    :parameters
    (
      ?auto_494 - PERSON
      ?auto_495 - CITY
    )
    :vars
    (
      ?auto_502 - FLEVEL
      ?auto_499 - FLEVEL
      ?auto_498 - CITY
      ?auto_497 - FLEVEL
      ?auto_496 - AIRCRAFT
      ?auto_509 - CITY
      ?auto_506 - FLEVEL
      ?auto_507 - FLEVEL
    )
    :precondition
    ( and ( NEXT ?auto_502 ?auto_499 ) ( PERSON-AT ?auto_494 ?auto_498 ) ( NEXT ?auto_497 ?auto_499 ) ( AIRCRAFT-AT ?auto_496 ?auto_509 ) ( FUEL-LEVEL ?auto_496 ?auto_506 ) ( NEXT ?auto_507 ?auto_506 ) ( NEXT ?auto_497 ?auto_507 ) )
    :subtasks
    ( ( !ZOOM ?auto_496 ?auto_509 ?auto_498 ?auto_506 ?auto_507 ?auto_497 )
      ( TRAVEL ?auto_494 ?auto_495 )
      ( TRAVEL-VERIFY ?auto_494 ?auto_495 ) )
  )

)

