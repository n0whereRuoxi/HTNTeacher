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

  ( :method FLY-3PPL-VERIFY
    :parameters
    (
      ?p1 - PERSON
      ?p2 - PERSON
      ?p3 - PERSON
      ?c - CITY
    )
    :precondition
    ( and ( PERSON-AT ?p1 ?c ) ( PERSON-AT ?p2 ?c ) ( PERSON-AT ?p3 ?c ) )
    :subtasks
    (  )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_247 - PERSON
      ?auto_246 - CITY
    )
    :vars
    (
      ?auto_250 - FLEVEL
      ?auto_249 - FLEVEL
      ?auto_251 - CITY
      ?auto_248 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_250 ?auto_249 ) ( PERSON-AT ?auto_247 ?auto_251 ) ( AIRCRAFT-AT ?auto_248 ?auto_246 ) ( FUEL-LEVEL ?auto_248 ?auto_250 ) ( not ( = ?auto_246 ?auto_251 ) ) ( not ( = ?auto_250 ?auto_249 ) ) )
    :subtasks
    ( ( !REFUEL ?auto_248 ?auto_246 ?auto_250 ?auto_249 )
      ( !FLY ?auto_248 ?auto_246 ?auto_251 ?auto_249 ?auto_250 )
      ( !REFUEL ?auto_248 ?auto_251 ?auto_250 ?auto_249 )
      ( !BOARD ?auto_247 ?auto_248 ?auto_251 )
      ( !FLY ?auto_248 ?auto_251 ?auto_246 ?auto_249 ?auto_250 )
      ( !DEBARK ?auto_247 ?auto_248 ?auto_246 )
      ( FLY-1PPL-VERIFY ?auto_247 ?auto_246 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_255 - PERSON
      ?auto_254 - CITY
    )
    :vars
    (
      ?auto_258 - FLEVEL
      ?auto_257 - FLEVEL
      ?auto_259 - CITY
      ?auto_256 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_258 ?auto_257 ) ( PERSON-AT ?auto_255 ?auto_259 ) ( AIRCRAFT-AT ?auto_256 ?auto_254 ) ( FUEL-LEVEL ?auto_256 ?auto_258 ) ( not ( = ?auto_254 ?auto_259 ) ) ( not ( = ?auto_258 ?auto_257 ) ) )
    :subtasks
    ( ( !REFUEL ?auto_256 ?auto_254 ?auto_258 ?auto_257 )
      ( !FLY ?auto_256 ?auto_254 ?auto_259 ?auto_257 ?auto_258 )
      ( !REFUEL ?auto_256 ?auto_259 ?auto_258 ?auto_257 )
      ( !BOARD ?auto_255 ?auto_256 ?auto_259 )
      ( !FLY ?auto_256 ?auto_259 ?auto_254 ?auto_257 ?auto_258 )
      ( !DEBARK ?auto_255 ?auto_256 ?auto_254 )
      ( FLY-1PPL-VERIFY ?auto_255 ?auto_254 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_270 - PERSON
      ?auto_271 - PERSON
      ?auto_269 - CITY
    )
    :vars
    (
      ?auto_274 - FLEVEL
      ?auto_273 - FLEVEL
      ?auto_275 - CITY
      ?auto_276 - CITY
      ?auto_272 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_274 ?auto_273 ) ( PERSON-AT ?auto_271 ?auto_275 ) ( not ( = ?auto_269 ?auto_275 ) ) ( not ( = ?auto_274 ?auto_273 ) ) ( PERSON-AT ?auto_270 ?auto_276 ) ( AIRCRAFT-AT ?auto_272 ?auto_269 ) ( FUEL-LEVEL ?auto_272 ?auto_274 ) ( not ( = ?auto_269 ?auto_276 ) ) ( not ( = ?auto_270 ?auto_271 ) ) ( not ( = ?auto_275 ?auto_276 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_270 ?auto_269 )
      ( FLY-1PPL ?auto_271 ?auto_269 )
      ( FLY-2PPL-VERIFY ?auto_270 ?auto_271 ?auto_269 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_278 - PERSON
      ?auto_279 - PERSON
      ?auto_277 - CITY
    )
    :vars
    (
      ?auto_280 - FLEVEL
      ?auto_282 - FLEVEL
      ?auto_281 - CITY
      ?auto_283 - CITY
      ?auto_284 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_280 ?auto_282 ) ( PERSON-AT ?auto_278 ?auto_281 ) ( not ( = ?auto_277 ?auto_281 ) ) ( not ( = ?auto_280 ?auto_282 ) ) ( PERSON-AT ?auto_279 ?auto_283 ) ( AIRCRAFT-AT ?auto_284 ?auto_277 ) ( FUEL-LEVEL ?auto_284 ?auto_280 ) ( not ( = ?auto_277 ?auto_283 ) ) ( not ( = ?auto_279 ?auto_278 ) ) ( not ( = ?auto_281 ?auto_283 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_279 ?auto_278 ?auto_277 )
      ( FLY-2PPL-VERIFY ?auto_278 ?auto_279 ?auto_277 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_297 - PERSON
      ?auto_296 - CITY
    )
    :vars
    (
      ?auto_300 - FLEVEL
      ?auto_299 - FLEVEL
      ?auto_301 - CITY
      ?auto_298 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_300 ?auto_299 ) ( PERSON-AT ?auto_297 ?auto_301 ) ( AIRCRAFT-AT ?auto_298 ?auto_296 ) ( FUEL-LEVEL ?auto_298 ?auto_300 ) ( not ( = ?auto_296 ?auto_301 ) ) ( not ( = ?auto_300 ?auto_299 ) ) )
    :subtasks
    ( ( !REFUEL ?auto_298 ?auto_296 ?auto_300 ?auto_299 )
      ( !FLY ?auto_298 ?auto_296 ?auto_301 ?auto_299 ?auto_300 )
      ( !REFUEL ?auto_298 ?auto_301 ?auto_300 ?auto_299 )
      ( !BOARD ?auto_297 ?auto_298 ?auto_301 )
      ( !FLY ?auto_298 ?auto_301 ?auto_296 ?auto_299 ?auto_300 )
      ( !DEBARK ?auto_297 ?auto_298 ?auto_296 )
      ( FLY-1PPL-VERIFY ?auto_297 ?auto_296 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_390 - PERSON
      ?auto_391 - PERSON
      ?auto_392 - PERSON
      ?auto_389 - CITY
    )
    :vars
    (
      ?auto_394 - FLEVEL
      ?auto_393 - FLEVEL
      ?auto_395 - CITY
      ?auto_398 - CITY
      ?auto_397 - CITY
      ?auto_396 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_394 ?auto_393 ) ( PERSON-AT ?auto_392 ?auto_395 ) ( not ( = ?auto_389 ?auto_395 ) ) ( not ( = ?auto_394 ?auto_393 ) ) ( PERSON-AT ?auto_391 ?auto_398 ) ( not ( = ?auto_389 ?auto_398 ) ) ( PERSON-AT ?auto_390 ?auto_397 ) ( AIRCRAFT-AT ?auto_396 ?auto_389 ) ( FUEL-LEVEL ?auto_396 ?auto_394 ) ( not ( = ?auto_389 ?auto_397 ) ) ( not ( = ?auto_390 ?auto_391 ) ) ( not ( = ?auto_398 ?auto_397 ) ) ( not ( = ?auto_390 ?auto_392 ) ) ( not ( = ?auto_391 ?auto_392 ) ) ( not ( = ?auto_395 ?auto_398 ) ) ( not ( = ?auto_395 ?auto_397 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_391 ?auto_390 ?auto_389 )
      ( FLY-1PPL ?auto_392 ?auto_389 )
      ( FLY-3PPL-VERIFY ?auto_390 ?auto_391 ?auto_392 ?auto_389 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_411 - PERSON
      ?auto_412 - PERSON
      ?auto_413 - PERSON
      ?auto_410 - CITY
    )
    :vars
    (
      ?auto_419 - FLEVEL
      ?auto_417 - FLEVEL
      ?auto_414 - CITY
      ?auto_416 - CITY
      ?auto_418 - CITY
      ?auto_415 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_419 ?auto_417 ) ( PERSON-AT ?auto_412 ?auto_414 ) ( not ( = ?auto_410 ?auto_414 ) ) ( not ( = ?auto_419 ?auto_417 ) ) ( PERSON-AT ?auto_413 ?auto_416 ) ( not ( = ?auto_410 ?auto_416 ) ) ( PERSON-AT ?auto_411 ?auto_418 ) ( AIRCRAFT-AT ?auto_415 ?auto_410 ) ( FUEL-LEVEL ?auto_415 ?auto_419 ) ( not ( = ?auto_410 ?auto_418 ) ) ( not ( = ?auto_411 ?auto_413 ) ) ( not ( = ?auto_416 ?auto_418 ) ) ( not ( = ?auto_411 ?auto_412 ) ) ( not ( = ?auto_413 ?auto_412 ) ) ( not ( = ?auto_414 ?auto_416 ) ) ( not ( = ?auto_414 ?auto_418 ) ) )
    :subtasks
    ( ( FLY-3PPL ?auto_411 ?auto_413 ?auto_412 ?auto_410 )
      ( FLY-3PPL-VERIFY ?auto_411 ?auto_412 ?auto_413 ?auto_410 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_432 - PERSON
      ?auto_433 - PERSON
      ?auto_434 - PERSON
      ?auto_431 - CITY
    )
    :vars
    (
      ?auto_437 - FLEVEL
      ?auto_439 - FLEVEL
      ?auto_436 - CITY
      ?auto_435 - CITY
      ?auto_438 - CITY
      ?auto_440 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_437 ?auto_439 ) ( PERSON-AT ?auto_434 ?auto_436 ) ( not ( = ?auto_431 ?auto_436 ) ) ( not ( = ?auto_437 ?auto_439 ) ) ( PERSON-AT ?auto_432 ?auto_435 ) ( not ( = ?auto_431 ?auto_435 ) ) ( PERSON-AT ?auto_433 ?auto_438 ) ( AIRCRAFT-AT ?auto_440 ?auto_431 ) ( FUEL-LEVEL ?auto_440 ?auto_437 ) ( not ( = ?auto_431 ?auto_438 ) ) ( not ( = ?auto_433 ?auto_432 ) ) ( not ( = ?auto_435 ?auto_438 ) ) ( not ( = ?auto_433 ?auto_434 ) ) ( not ( = ?auto_432 ?auto_434 ) ) ( not ( = ?auto_436 ?auto_435 ) ) ( not ( = ?auto_436 ?auto_438 ) ) )
    :subtasks
    ( ( FLY-3PPL ?auto_433 ?auto_434 ?auto_432 ?auto_431 )
      ( FLY-3PPL-VERIFY ?auto_432 ?auto_433 ?auto_434 ?auto_431 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_453 - PERSON
      ?auto_454 - PERSON
      ?auto_455 - PERSON
      ?auto_452 - CITY
    )
    :vars
    (
      ?auto_458 - FLEVEL
      ?auto_460 - FLEVEL
      ?auto_457 - CITY
      ?auto_456 - CITY
      ?auto_459 - CITY
      ?auto_461 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_458 ?auto_460 ) ( PERSON-AT ?auto_454 ?auto_457 ) ( not ( = ?auto_452 ?auto_457 ) ) ( not ( = ?auto_458 ?auto_460 ) ) ( PERSON-AT ?auto_453 ?auto_456 ) ( not ( = ?auto_452 ?auto_456 ) ) ( PERSON-AT ?auto_455 ?auto_459 ) ( AIRCRAFT-AT ?auto_461 ?auto_452 ) ( FUEL-LEVEL ?auto_461 ?auto_458 ) ( not ( = ?auto_452 ?auto_459 ) ) ( not ( = ?auto_455 ?auto_453 ) ) ( not ( = ?auto_456 ?auto_459 ) ) ( not ( = ?auto_455 ?auto_454 ) ) ( not ( = ?auto_453 ?auto_454 ) ) ( not ( = ?auto_457 ?auto_456 ) ) ( not ( = ?auto_457 ?auto_459 ) ) )
    :subtasks
    ( ( FLY-3PPL ?auto_455 ?auto_454 ?auto_453 ?auto_452 )
      ( FLY-3PPL-VERIFY ?auto_453 ?auto_454 ?auto_455 ?auto_452 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_496 - PERSON
      ?auto_497 - PERSON
      ?auto_498 - PERSON
      ?auto_495 - CITY
    )
    :vars
    (
      ?auto_501 - FLEVEL
      ?auto_503 - FLEVEL
      ?auto_500 - CITY
      ?auto_499 - CITY
      ?auto_502 - CITY
      ?auto_504 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_501 ?auto_503 ) ( PERSON-AT ?auto_496 ?auto_500 ) ( not ( = ?auto_495 ?auto_500 ) ) ( not ( = ?auto_501 ?auto_503 ) ) ( PERSON-AT ?auto_498 ?auto_499 ) ( not ( = ?auto_495 ?auto_499 ) ) ( PERSON-AT ?auto_497 ?auto_502 ) ( AIRCRAFT-AT ?auto_504 ?auto_495 ) ( FUEL-LEVEL ?auto_504 ?auto_501 ) ( not ( = ?auto_495 ?auto_502 ) ) ( not ( = ?auto_497 ?auto_498 ) ) ( not ( = ?auto_499 ?auto_502 ) ) ( not ( = ?auto_497 ?auto_496 ) ) ( not ( = ?auto_498 ?auto_496 ) ) ( not ( = ?auto_500 ?auto_499 ) ) ( not ( = ?auto_500 ?auto_502 ) ) )
    :subtasks
    ( ( FLY-3PPL ?auto_497 ?auto_496 ?auto_498 ?auto_495 )
      ( FLY-3PPL-VERIFY ?auto_496 ?auto_497 ?auto_498 ?auto_495 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_517 - PERSON
      ?auto_518 - PERSON
      ?auto_519 - PERSON
      ?auto_516 - CITY
    )
    :vars
    (
      ?auto_522 - FLEVEL
      ?auto_524 - FLEVEL
      ?auto_521 - CITY
      ?auto_520 - CITY
      ?auto_523 - CITY
      ?auto_525 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_522 ?auto_524 ) ( PERSON-AT ?auto_517 ?auto_521 ) ( not ( = ?auto_516 ?auto_521 ) ) ( not ( = ?auto_522 ?auto_524 ) ) ( PERSON-AT ?auto_518 ?auto_520 ) ( not ( = ?auto_516 ?auto_520 ) ) ( PERSON-AT ?auto_519 ?auto_523 ) ( AIRCRAFT-AT ?auto_525 ?auto_516 ) ( FUEL-LEVEL ?auto_525 ?auto_522 ) ( not ( = ?auto_516 ?auto_523 ) ) ( not ( = ?auto_519 ?auto_518 ) ) ( not ( = ?auto_520 ?auto_523 ) ) ( not ( = ?auto_519 ?auto_517 ) ) ( not ( = ?auto_518 ?auto_517 ) ) ( not ( = ?auto_521 ?auto_520 ) ) ( not ( = ?auto_521 ?auto_523 ) ) )
    :subtasks
    ( ( FLY-3PPL ?auto_519 ?auto_517 ?auto_518 ?auto_516 )
      ( FLY-3PPL-VERIFY ?auto_517 ?auto_518 ?auto_519 ?auto_516 ) )
  )

)

