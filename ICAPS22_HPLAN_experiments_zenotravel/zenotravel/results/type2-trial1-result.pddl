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
      ?auto_3 - PERSON
      ?auto_2 - CITY
    )
    :vars
    (
      ?auto_4 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_3 ?auto_4 ) ( AIRCRAFT-AT ?auto_4 ?auto_2 ) )
    :subtasks
    ( ( !DEBARK ?auto_3 ?auto_4 ?auto_2 )
      ( TRAVEL-VERIFY ?auto_3 ?auto_2 ) )
  )

  ( :method TRAVEL
    :parameters
    (
      ?auto_10 - PERSON
      ?auto_9 - CITY
    )
    :vars
    (
      ?auto_11 - AIRCRAFT
      ?auto_14 - CITY
      ?auto_12 - FLEVEL
      ?auto_13 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_10 ?auto_11 ) ( AIRCRAFT-AT ?auto_11 ?auto_14 ) ( FUEL-LEVEL ?auto_11 ?auto_12 ) ( NEXT ?auto_13 ?auto_12 ) ( not ( = ?auto_9 ?auto_14 ) ) ( not ( = ?auto_12 ?auto_13 ) ) )
    :subtasks
    ( ( !FLY ?auto_11 ?auto_14 ?auto_9 ?auto_12 ?auto_13 )
      ( TRAVEL ?auto_10 ?auto_9 )
      ( TRAVEL-VERIFY ?auto_10 ?auto_9 ) )
  )

  ( :method TRAVEL
    :parameters
    (
      ?auto_20 - PERSON
      ?auto_19 - CITY
    )
    :vars
    (
      ?auto_23 - AIRCRAFT
      ?auto_21 - CITY
      ?auto_22 - FLEVEL
      ?auto_24 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_23 ?auto_21 ) ( FUEL-LEVEL ?auto_23 ?auto_22 ) ( NEXT ?auto_24 ?auto_22 ) ( not ( = ?auto_19 ?auto_21 ) ) ( not ( = ?auto_22 ?auto_24 ) ) ( PERSON-AT ?auto_20 ?auto_21 ) )
    :subtasks
    ( ( !BOARD ?auto_20 ?auto_23 ?auto_21 )
      ( TRAVEL ?auto_20 ?auto_19 )
      ( TRAVEL-VERIFY ?auto_20 ?auto_19 ) )
  )

  ( :method TRAVEL
    :parameters
    (
      ?auto_427 - PERSON
      ?auto_426 - CITY
    )
    :vars
    (
      ?auto_428 - FLEVEL
      ?auto_431 - FLEVEL
      ?auto_430 - CITY
      ?auto_429 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_428 ?auto_431 ) ( not ( = ?auto_426 ?auto_430 ) ) ( not ( = ?auto_431 ?auto_428 ) ) ( PERSON-AT ?auto_427 ?auto_430 ) ( AIRCRAFT-AT ?auto_429 ?auto_426 ) ( FUEL-LEVEL ?auto_429 ?auto_431 ) )
    :subtasks
    ( ( !FLY ?auto_429 ?auto_426 ?auto_430 ?auto_431 ?auto_428 )
      ( TRAVEL ?auto_427 ?auto_426 )
      ( TRAVEL-VERIFY ?auto_427 ?auto_426 ) )
  )

  ( :method TRAVEL
    :parameters
    (
      ?auto_339 - PERSON
      ?auto_338 - CITY
    )
    :vars
    (
      ?auto_340 - FLEVEL
      ?auto_342 - FLEVEL
      ?auto_343 - CITY
      ?auto_341 - AIRCRAFT
      ?auto_344 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_340 ?auto_342 ) ( not ( = ?auto_338 ?auto_343 ) ) ( not ( = ?auto_342 ?auto_340 ) ) ( PERSON-AT ?auto_339 ?auto_343 ) ( AIRCRAFT-AT ?auto_341 ?auto_344 ) ( FUEL-LEVEL ?auto_341 ?auto_342 ) ( not ( = ?auto_338 ?auto_344 ) ) ( not ( = ?auto_343 ?auto_344 ) ) )
    :subtasks
    ( ( !FLY ?auto_341 ?auto_344 ?auto_343 ?auto_342 ?auto_340 )
      ( TRAVEL ?auto_339 ?auto_338 )
      ( TRAVEL-VERIFY ?auto_339 ?auto_338 ) )
  )

  ( :method TRAVEL
    :parameters
    (
      ?auto_203 - PERSON
      ?auto_202 - CITY
    )
    :vars
    (
      ?auto_207 - AIRCRAFT
      ?auto_205 - CITY
      ?auto_204 - FLEVEL
      ?auto_206 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_207 ?auto_205 ) ( NEXT ?auto_204 ?auto_206 ) ( not ( = ?auto_202 ?auto_205 ) ) ( not ( = ?auto_206 ?auto_204 ) ) ( PERSON-AT ?auto_203 ?auto_205 ) ( FUEL-LEVEL ?auto_207 ?auto_204 ) )
    :subtasks
    ( ( !REFUEL ?auto_207 ?auto_205 ?auto_204 ?auto_206 )
      ( TRAVEL ?auto_203 ?auto_202 )
      ( TRAVEL-VERIFY ?auto_203 ?auto_202 ) )
  )

  ( :method TRAVEL
    :parameters
    (
      ?auto_222 - PERSON
      ?auto_221 - CITY
    )
    :vars
    (
      ?auto_223 - AIRCRAFT
      ?auto_226 - CITY
      ?auto_225 - FLEVEL
      ?auto_224 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_222 ?auto_223 ) ( AIRCRAFT-AT ?auto_223 ?auto_226 ) ( NEXT ?auto_225 ?auto_224 ) ( not ( = ?auto_221 ?auto_226 ) ) ( not ( = ?auto_224 ?auto_225 ) ) ( FUEL-LEVEL ?auto_223 ?auto_225 ) )
    :subtasks
    ( ( !REFUEL ?auto_223 ?auto_226 ?auto_225 ?auto_224 )
      ( TRAVEL ?auto_222 ?auto_221 )
      ( TRAVEL-VERIFY ?auto_222 ?auto_221 ) )
  )

  ( :method TRAVEL
    :parameters
    (
      ?auto_269 - PERSON
      ?auto_268 - CITY
    )
    :vars
    (
      ?auto_273 - AIRCRAFT
      ?auto_271 - CITY
      ?auto_272 - FLEVEL
      ?auto_270 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_273 ?auto_271 ) ( NEXT ?auto_272 ?auto_270 ) ( not ( = ?auto_268 ?auto_271 ) ) ( not ( = ?auto_270 ?auto_272 ) ) ( FUEL-LEVEL ?auto_273 ?auto_272 ) ( PERSON-AT ?auto_269 ?auto_271 ) )
    :subtasks
    ( ( !BOARD ?auto_269 ?auto_273 ?auto_271 )
      ( TRAVEL ?auto_269 ?auto_268 )
      ( TRAVEL-VERIFY ?auto_269 ?auto_268 ) )
  )

  ( :method TRAVEL
    :parameters
    (
      ?auto_388 - PERSON
      ?auto_387 - CITY
    )
    :vars
    (
      ?auto_389 - FLEVEL
      ?auto_390 - FLEVEL
      ?auto_391 - CITY
      ?auto_393 - AIRCRAFT
      ?auto_392 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_389 ?auto_390 ) ( not ( = ?auto_387 ?auto_391 ) ) ( not ( = ?auto_390 ?auto_389 ) ) ( PERSON-AT ?auto_388 ?auto_391 ) ( AIRCRAFT-AT ?auto_393 ?auto_392 ) ( not ( = ?auto_387 ?auto_392 ) ) ( not ( = ?auto_391 ?auto_392 ) ) ( FUEL-LEVEL ?auto_393 ?auto_389 ) )
    :subtasks
    ( ( !REFUEL ?auto_393 ?auto_392 ?auto_389 ?auto_390 )
      ( TRAVEL ?auto_388 ?auto_387 )
      ( TRAVEL-VERIFY ?auto_388 ?auto_387 ) )
  )

  ( :method TRAVEL
    :parameters
    (
      ?auto_395 - PERSON
      ?auto_394 - CITY
    )
    :vars
    (
      ?auto_397 - FLEVEL
      ?auto_398 - FLEVEL
      ?auto_396 - CITY
      ?auto_399 - CITY
      ?auto_400 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_397 ?auto_398 ) ( not ( = ?auto_394 ?auto_396 ) ) ( not ( = ?auto_398 ?auto_397 ) ) ( PERSON-AT ?auto_395 ?auto_396 ) ( not ( = ?auto_394 ?auto_399 ) ) ( not ( = ?auto_396 ?auto_399 ) ) ( AIRCRAFT-AT ?auto_400 ?auto_394 ) ( FUEL-LEVEL ?auto_400 ?auto_398 ) )
    :subtasks
    ( ( !FLY ?auto_400 ?auto_394 ?auto_399 ?auto_398 ?auto_397 )
      ( TRAVEL ?auto_395 ?auto_394 )
      ( TRAVEL-VERIFY ?auto_395 ?auto_394 ) )
  )

  ( :method TRAVEL
    :parameters
    (
      ?auto_433 - PERSON
      ?auto_432 - CITY
    )
    :vars
    (
      ?auto_434 - FLEVEL
      ?auto_437 - FLEVEL
      ?auto_436 - CITY
      ?auto_435 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_434 ?auto_437 ) ( not ( = ?auto_432 ?auto_436 ) ) ( not ( = ?auto_437 ?auto_434 ) ) ( PERSON-AT ?auto_433 ?auto_436 ) ( AIRCRAFT-AT ?auto_435 ?auto_432 ) ( FUEL-LEVEL ?auto_435 ?auto_434 ) )
    :subtasks
    ( ( !REFUEL ?auto_435 ?auto_432 ?auto_434 ?auto_437 )
      ( TRAVEL ?auto_433 ?auto_432 )
      ( TRAVEL-VERIFY ?auto_433 ?auto_432 ) )
  )

  ( :method TRAVEL
    :parameters
    (
      ?auto_444 - PERSON
      ?auto_443 - CITY
    )
    :vars
    (
      ?auto_445 - AIRCRAFT
      ?auto_449 - CITY
      ?auto_446 - FLEVEL
      ?auto_447 - FLEVEL
      ?auto_448 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_444 ?auto_445 ) ( AIRCRAFT-AT ?auto_445 ?auto_449 ) ( FUEL-LEVEL ?auto_445 ?auto_446 ) ( NEXT ?auto_447 ?auto_446 ) ( NEXT ?auto_448 ?auto_447 ) ( not ( = ?auto_443 ?auto_449 ) ) ( not ( = ?auto_446 ?auto_447 ) ) ( not ( = ?auto_446 ?auto_448 ) ) ( not ( = ?auto_447 ?auto_448 ) ) )
    :subtasks
    ( ( !ZOOM ?auto_445 ?auto_449 ?auto_443 ?auto_446 ?auto_447 ?auto_448 )
      ( TRAVEL ?auto_444 ?auto_443 )
      ( TRAVEL-VERIFY ?auto_444 ?auto_443 ) )
  )

  ( :method TRAVEL
    :parameters
    (
      ?auto_555 - PERSON
      ?auto_554 - CITY
    )
    :vars
    (
      ?auto_556 - FLEVEL
      ?auto_558 - FLEVEL
      ?auto_559 - CITY
      ?auto_557 - AIRCRAFT
      ?auto_561 - CITY
      ?auto_560 - FLEVEL
    )
    :precondition
    ( and ( NEXT ?auto_556 ?auto_558 ) ( not ( = ?auto_554 ?auto_559 ) ) ( not ( = ?auto_558 ?auto_556 ) ) ( PERSON-AT ?auto_555 ?auto_559 ) ( AIRCRAFT-AT ?auto_557 ?auto_561 ) ( FUEL-LEVEL ?auto_557 ?auto_560 ) ( NEXT ?auto_558 ?auto_560 ) ( not ( = ?auto_554 ?auto_561 ) ) ( not ( = ?auto_556 ?auto_560 ) ) ( not ( = ?auto_558 ?auto_560 ) ) ( not ( = ?auto_559 ?auto_561 ) ) )
    :subtasks
    ( ( !ZOOM ?auto_557 ?auto_561 ?auto_559 ?auto_560 ?auto_558 ?auto_556 )
      ( TRAVEL ?auto_555 ?auto_554 )
      ( TRAVEL-VERIFY ?auto_555 ?auto_554 ) )
  )

  ( :method TRAVEL
    :parameters
    (
      ?auto_939 - PERSON
      ?auto_938 - CITY
    )
    :vars
    (
      ?auto_940 - FLEVEL
      ?auto_941 - FLEVEL
      ?auto_942 - CITY
      ?auto_943 - AIRCRAFT
      ?auto_944 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_940 ?auto_941 ) ( not ( = ?auto_938 ?auto_942 ) ) ( not ( = ?auto_941 ?auto_940 ) ) ( PERSON-AT ?auto_939 ?auto_942 ) ( AIRCRAFT-AT ?auto_943 ?auto_944 ) ( FUEL-LEVEL ?auto_943 ?auto_941 ) ( not ( = ?auto_938 ?auto_944 ) ) ( not ( = ?auto_942 ?auto_944 ) ) )
    :subtasks
    ( ( !FLY ?auto_943 ?auto_944 ?auto_938 ?auto_941 ?auto_940 )
      ( TRAVEL ?auto_939 ?auto_938 )
      ( TRAVEL-VERIFY ?auto_939 ?auto_938 ) )
  )

  ( :method TRAVEL
    :parameters
    (
      ?auto_1037 - PERSON
      ?auto_1036 - CITY
    )
    :vars
    (
      ?auto_1039 - FLEVEL
      ?auto_1038 - FLEVEL
      ?auto_1040 - CITY
      ?auto_1041 - AIRCRAFT
      ?auto_1042 - FLEVEL
    )
    :precondition
    ( and ( NEXT ?auto_1039 ?auto_1038 ) ( not ( = ?auto_1036 ?auto_1040 ) ) ( not ( = ?auto_1038 ?auto_1039 ) ) ( PERSON-AT ?auto_1037 ?auto_1040 ) ( AIRCRAFT-AT ?auto_1041 ?auto_1036 ) ( FUEL-LEVEL ?auto_1041 ?auto_1042 ) ( NEXT ?auto_1038 ?auto_1042 ) ( not ( = ?auto_1039 ?auto_1042 ) ) ( not ( = ?auto_1038 ?auto_1042 ) ) )
    :subtasks
    ( ( !ZOOM ?auto_1041 ?auto_1036 ?auto_1040 ?auto_1042 ?auto_1038 ?auto_1039 )
      ( TRAVEL ?auto_1037 ?auto_1036 )
      ( TRAVEL-VERIFY ?auto_1037 ?auto_1036 ) )
  )

)

