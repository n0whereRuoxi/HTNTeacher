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
      ?auto_9 - PERSON
      ?auto_10 - CITY
    )
    :vars
    (
      ?auto_12 - AIRCRAFT
      ?auto_17 - CITY
      ?auto_15 - FLEVEL
      ?auto_16 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_9 ?auto_12 ) ( AIRCRAFT-AT ?auto_12 ?auto_17 ) ( FUEL-LEVEL ?auto_12 ?auto_15 ) ( NEXT ?auto_16 ?auto_15 ) )
    :subtasks
    ( ( !FLY ?auto_12 ?auto_17 ?auto_10 ?auto_15 ?auto_16 )
      ( TRAVEL ?auto_9 ?auto_10 )
      ( TRAVEL-VERIFY ?auto_9 ?auto_10 ) )
  )

  ( :method TRAVEL
    :parameters
    (
      ?auto_23 - PERSON
      ?auto_24 - CITY
    )
    :vars
    (
      ?auto_26 - AIRCRAFT
      ?auto_25 - CITY
      ?auto_28 - FLEVEL
      ?auto_30 - FLEVEL
      ?auto_32 - CITY
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_26 ?auto_25 ) ( FUEL-LEVEL ?auto_26 ?auto_28 ) ( NEXT ?auto_30 ?auto_28 ) ( PERSON-AT ?auto_23 ?auto_32 ) ( AIRCRAFT-AT ?auto_26 ?auto_32 ) )
    :subtasks
    ( ( !BOARD ?auto_23 ?auto_26 ?auto_32 )
      ( TRAVEL ?auto_23 ?auto_24 )
      ( TRAVEL-VERIFY ?auto_23 ?auto_24 ) )
  )

  ( :method TRAVEL
    :parameters
    (
      ?auto_268 - PERSON
      ?auto_269 - CITY
    )
    :vars
    (
      ?auto_273 - FLEVEL
      ?auto_272 - FLEVEL
      ?auto_271 - CITY
      ?auto_275 - FLEVEL
      ?auto_270 - AIRCRAFT
      ?auto_277 - CITY
      ?auto_278 - FLEVEL
      ?auto_281 - FLEVEL
      ?auto_279 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_273 ?auto_272 ) ( PERSON-AT ?auto_268 ?auto_271 ) ( NEXT ?auto_275 ?auto_272 ) ( AIRCRAFT-AT ?auto_270 ?auto_277 ) ( NEXT ?auto_275 ?auto_278 ) ( FUEL-LEVEL ?auto_270 ?auto_281 ) ( NEXT ?auto_281 ?auto_278 ) ( AIRCRAFT-AT ?auto_270 ?auto_279 ) )
    :subtasks
    ( ( !REFUEL ?auto_270 ?auto_279 ?auto_281 ?auto_278 )
      ( TRAVEL ?auto_268 ?auto_269 )
      ( TRAVEL-VERIFY ?auto_268 ?auto_269 ) )
  )

  ( :method TRAVEL
    :parameters
    (
      ?auto_47 - PERSON
      ?auto_48 - CITY
    )
    :vars
    (
      ?auto_55 - FLEVEL
      ?auto_56 - FLEVEL
      ?auto_57 - CITY
      ?auto_49 - FLEVEL
      ?auto_51 - AIRCRAFT
      ?auto_61 - CITY
      ?auto_59 - FLEVEL
    )
    :precondition
    ( and ( NEXT ?auto_55 ?auto_56 ) ( PERSON-AT ?auto_47 ?auto_57 ) ( NEXT ?auto_49 ?auto_56 ) ( AIRCRAFT-AT ?auto_51 ?auto_61 ) ( FUEL-LEVEL ?auto_51 ?auto_59 ) ( NEXT ?auto_49 ?auto_59 ) )
    :subtasks
    ( ( !FLY ?auto_51 ?auto_61 ?auto_57 ?auto_59 ?auto_49 )
      ( TRAVEL ?auto_47 ?auto_48 )
      ( TRAVEL-VERIFY ?auto_47 ?auto_48 ) )
  )

  ( :method TRAVEL
    :parameters
    (
      ?auto_116 - PERSON
      ?auto_117 - CITY
    )
    :vars
    (
      ?auto_123 - AIRCRAFT
      ?auto_118 - CITY
      ?auto_120 - FLEVEL
      ?auto_121 - FLEVEL
      ?auto_126 - FLEVEL
      ?auto_124 - CITY
    )
    :precondition
    ( and ( IN ?auto_116 ?auto_123 ) ( AIRCRAFT-AT ?auto_123 ?auto_118 ) ( NEXT ?auto_120 ?auto_121 ) ( FUEL-LEVEL ?auto_123 ?auto_126 ) ( NEXT ?auto_126 ?auto_121 ) ( AIRCRAFT-AT ?auto_123 ?auto_124 ) )
    :subtasks
    ( ( !REFUEL ?auto_123 ?auto_124 ?auto_126 ?auto_121 )
      ( TRAVEL ?auto_116 ?auto_117 )
      ( TRAVEL-VERIFY ?auto_116 ?auto_117 ) )
  )

  ( :method TRAVEL
    :parameters
    (
      ?auto_130 - PERSON
      ?auto_131 - CITY
    )
    :vars
    (
      ?auto_133 - AIRCRAFT
      ?auto_134 - CITY
      ?auto_135 - FLEVEL
      ?auto_136 - FLEVEL
      ?auto_138 - FLEVEL
      ?auto_137 - CITY
      ?auto_141 - CITY
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_133 ?auto_134 ) ( NEXT ?auto_135 ?auto_136 ) ( FUEL-LEVEL ?auto_133 ?auto_138 ) ( NEXT ?auto_138 ?auto_136 ) ( AIRCRAFT-AT ?auto_133 ?auto_137 ) ( PERSON-AT ?auto_130 ?auto_141 ) ( AIRCRAFT-AT ?auto_133 ?auto_141 ) )
    :subtasks
    ( ( !BOARD ?auto_130 ?auto_133 ?auto_141 )
      ( TRAVEL ?auto_130 ?auto_131 )
      ( TRAVEL-VERIFY ?auto_130 ?auto_131 ) )
  )

  ( :method TRAVEL
    :parameters
    (
      ?auto_289 - PERSON
      ?auto_290 - CITY
    )
    :vars
    (
      ?auto_293 - AIRCRAFT
      ?auto_298 - CITY
      ?auto_295 - FLEVEL
      ?auto_296 - FLEVEL
      ?auto_297 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_289 ?auto_293 ) ( AIRCRAFT-AT ?auto_293 ?auto_298 ) ( FUEL-LEVEL ?auto_293 ?auto_295 ) ( NEXT ?auto_296 ?auto_295 ) ( NEXT ?auto_297 ?auto_296 ) )
    :subtasks
    ( ( !ZOOM ?auto_293 ?auto_298 ?auto_290 ?auto_295 ?auto_296 ?auto_297 )
      ( TRAVEL ?auto_289 ?auto_290 )
      ( TRAVEL-VERIFY ?auto_289 ?auto_290 ) )
  )

  ( :method TRAVEL
    :parameters
    (
      ?auto_361 - PERSON
      ?auto_362 - CITY
    )
    :vars
    (
      ?auto_366 - FLEVEL
      ?auto_368 - FLEVEL
      ?auto_365 - CITY
      ?auto_369 - FLEVEL
      ?auto_364 - AIRCRAFT
      ?auto_376 - CITY
      ?auto_373 - FLEVEL
      ?auto_374 - FLEVEL
    )
    :precondition
    ( and ( NEXT ?auto_366 ?auto_368 ) ( PERSON-AT ?auto_361 ?auto_365 ) ( NEXT ?auto_369 ?auto_368 ) ( AIRCRAFT-AT ?auto_364 ?auto_376 ) ( FUEL-LEVEL ?auto_364 ?auto_373 ) ( NEXT ?auto_374 ?auto_373 ) ( NEXT ?auto_369 ?auto_374 ) )
    :subtasks
    ( ( !ZOOM ?auto_364 ?auto_376 ?auto_365 ?auto_373 ?auto_374 ?auto_369 )
      ( TRAVEL ?auto_361 ?auto_362 )
      ( TRAVEL-VERIFY ?auto_361 ?auto_362 ) )
  )

)

