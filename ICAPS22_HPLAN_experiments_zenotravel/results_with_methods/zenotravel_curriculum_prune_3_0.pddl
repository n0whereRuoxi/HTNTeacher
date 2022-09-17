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
      ?auto_224 - PERSON
      ?auto_223 - CITY
    )
    :vars
    (
      ?auto_227 - FLEVEL
      ?auto_226 - FLEVEL
      ?auto_228 - CITY
      ?auto_225 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_227 ?auto_226 ) ( PERSON-AT ?auto_224 ?auto_228 ) ( AIRCRAFT-AT ?auto_225 ?auto_223 ) ( FUEL-LEVEL ?auto_225 ?auto_227 ) ( not ( = ?auto_223 ?auto_228 ) ) ( not ( = ?auto_227 ?auto_226 ) ) )
    :subtasks
    ( ( !REFUEL ?auto_225 ?auto_223 ?auto_227 ?auto_226 )
      ( !FLY ?auto_225 ?auto_223 ?auto_228 ?auto_226 ?auto_227 )
      ( !REFUEL ?auto_225 ?auto_228 ?auto_227 ?auto_226 )
      ( !BOARD ?auto_224 ?auto_225 ?auto_228 )
      ( !FLY ?auto_225 ?auto_228 ?auto_223 ?auto_226 ?auto_227 )
      ( !DEBARK ?auto_224 ?auto_225 ?auto_223 )
      ( FLY-1PPL-VERIFY ?auto_224 ?auto_223 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_247 - PERSON
      ?auto_248 - PERSON
      ?auto_246 - CITY
    )
    :vars
    (
      ?auto_252 - FLEVEL
      ?auto_249 - FLEVEL
      ?auto_250 - CITY
      ?auto_253 - CITY
      ?auto_251 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_252 ?auto_249 ) ( PERSON-AT ?auto_248 ?auto_250 ) ( not ( = ?auto_246 ?auto_250 ) ) ( not ( = ?auto_252 ?auto_249 ) ) ( PERSON-AT ?auto_247 ?auto_253 ) ( AIRCRAFT-AT ?auto_251 ?auto_246 ) ( FUEL-LEVEL ?auto_251 ?auto_252 ) ( not ( = ?auto_246 ?auto_253 ) ) ( not ( = ?auto_247 ?auto_248 ) ) ( not ( = ?auto_250 ?auto_253 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_247 ?auto_246 )
      ( FLY-1PPL ?auto_248 ?auto_246 )
      ( FLY-2PPL-VERIFY ?auto_247 ?auto_248 ?auto_246 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_362 - PERSON
      ?auto_363 - PERSON
      ?auto_364 - PERSON
      ?auto_361 - CITY
    )
    :vars
    (
      ?auto_368 - FLEVEL
      ?auto_367 - FLEVEL
      ?auto_365 - CITY
      ?auto_369 - CITY
      ?auto_370 - CITY
      ?auto_366 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_368 ?auto_367 ) ( PERSON-AT ?auto_364 ?auto_365 ) ( not ( = ?auto_361 ?auto_365 ) ) ( not ( = ?auto_368 ?auto_367 ) ) ( PERSON-AT ?auto_363 ?auto_369 ) ( not ( = ?auto_361 ?auto_369 ) ) ( PERSON-AT ?auto_362 ?auto_370 ) ( AIRCRAFT-AT ?auto_366 ?auto_361 ) ( FUEL-LEVEL ?auto_366 ?auto_368 ) ( not ( = ?auto_361 ?auto_370 ) ) ( not ( = ?auto_362 ?auto_363 ) ) ( not ( = ?auto_369 ?auto_370 ) ) ( not ( = ?auto_362 ?auto_364 ) ) ( not ( = ?auto_363 ?auto_364 ) ) ( not ( = ?auto_365 ?auto_369 ) ) ( not ( = ?auto_365 ?auto_370 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_362 ?auto_363 ?auto_361 )
      ( FLY-1PPL ?auto_364 ?auto_361 )
      ( FLY-3PPL-VERIFY ?auto_362 ?auto_363 ?auto_364 ?auto_361 ) )
  )

)

