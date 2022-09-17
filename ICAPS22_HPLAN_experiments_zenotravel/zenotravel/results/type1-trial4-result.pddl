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
      ?auto_122 - PERSON
      ?auto_123 - CITY
    )
    :vars
    (
      ?auto_130 - FLEVEL
      ?auto_127 - FLEVEL
      ?auto_132 - CITY
      ?auto_128 - FLEVEL
      ?auto_126 - AIRCRAFT
      ?auto_136 - CITY
      ?auto_134 - FLEVEL
    )
    :precondition
    ( and ( NEXT ?auto_130 ?auto_127 ) ( PERSON-AT ?auto_122 ?auto_132 ) ( NEXT ?auto_128 ?auto_127 ) ( AIRCRAFT-AT ?auto_126 ?auto_136 ) ( FUEL-LEVEL ?auto_126 ?auto_134 ) ( NEXT ?auto_128 ?auto_134 ) )
    :subtasks
    ( ( !FLY ?auto_126 ?auto_136 ?auto_132 ?auto_134 ?auto_128 )
      ( TRAVEL ?auto_122 ?auto_123 )
      ( TRAVEL-VERIFY ?auto_122 ?auto_123 ) )
  )

  ( :method TRAVEL
    :parameters
    (
      ?auto_276 - PERSON
      ?auto_277 - CITY
    )
    :vars
    (
      ?auto_285 - FLEVEL
      ?auto_278 - FLEVEL
      ?auto_284 - CITY
      ?auto_282 - FLEVEL
      ?auto_281 - AIRCRAFT
      ?auto_283 - CITY
      ?auto_280 - FLEVEL
      ?auto_289 - FLEVEL
      ?auto_287 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_285 ?auto_278 ) ( PERSON-AT ?auto_276 ?auto_284 ) ( NEXT ?auto_282 ?auto_278 ) ( AIRCRAFT-AT ?auto_281 ?auto_283 ) ( NEXT ?auto_282 ?auto_280 ) ( FUEL-LEVEL ?auto_281 ?auto_289 ) ( NEXT ?auto_289 ?auto_280 ) ( AIRCRAFT-AT ?auto_281 ?auto_287 ) )
    :subtasks
    ( ( !REFUEL ?auto_281 ?auto_287 ?auto_289 ?auto_280 )
      ( TRAVEL ?auto_276 ?auto_277 )
      ( TRAVEL-VERIFY ?auto_276 ?auto_277 ) )
  )

  ( :method TRAVEL
    :parameters
    (
      ?auto_164 - PERSON
      ?auto_165 - CITY
    )
    :vars
    (
      ?auto_169 - AIRCRAFT
      ?auto_168 - CITY
      ?auto_171 - FLEVEL
      ?auto_166 - FLEVEL
      ?auto_174 - FLEVEL
      ?auto_172 - CITY
    )
    :precondition
    ( and ( IN ?auto_164 ?auto_169 ) ( AIRCRAFT-AT ?auto_169 ?auto_168 ) ( NEXT ?auto_171 ?auto_166 ) ( FUEL-LEVEL ?auto_169 ?auto_174 ) ( NEXT ?auto_174 ?auto_166 ) ( AIRCRAFT-AT ?auto_169 ?auto_172 ) )
    :subtasks
    ( ( !REFUEL ?auto_169 ?auto_172 ?auto_174 ?auto_166 )
      ( TRAVEL ?auto_164 ?auto_165 )
      ( TRAVEL-VERIFY ?auto_164 ?auto_165 ) )
  )

  ( :method TRAVEL
    :parameters
    (
      ?auto_178 - PERSON
      ?auto_179 - CITY
    )
    :vars
    (
      ?auto_183 - AIRCRAFT
      ?auto_184 - CITY
      ?auto_185 - FLEVEL
      ?auto_180 - FLEVEL
      ?auto_182 - FLEVEL
      ?auto_186 - CITY
      ?auto_189 - CITY
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_183 ?auto_184 ) ( NEXT ?auto_185 ?auto_180 ) ( FUEL-LEVEL ?auto_183 ?auto_182 ) ( NEXT ?auto_182 ?auto_180 ) ( AIRCRAFT-AT ?auto_183 ?auto_186 ) ( PERSON-AT ?auto_178 ?auto_189 ) ( AIRCRAFT-AT ?auto_183 ?auto_189 ) )
    :subtasks
    ( ( !BOARD ?auto_178 ?auto_183 ?auto_189 )
      ( TRAVEL ?auto_178 ?auto_179 )
      ( TRAVEL-VERIFY ?auto_178 ?auto_179 ) )
  )

  ( :method TRAVEL
    :parameters
    (
      ?auto_297 - PERSON
      ?auto_298 - CITY
    )
    :vars
    (
      ?auto_301 - AIRCRAFT
      ?auto_306 - CITY
      ?auto_303 - FLEVEL
      ?auto_304 - FLEVEL
      ?auto_305 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_297 ?auto_301 ) ( AIRCRAFT-AT ?auto_301 ?auto_306 ) ( FUEL-LEVEL ?auto_301 ?auto_303 ) ( NEXT ?auto_304 ?auto_303 ) ( NEXT ?auto_305 ?auto_304 ) )
    :subtasks
    ( ( !ZOOM ?auto_301 ?auto_306 ?auto_298 ?auto_303 ?auto_304 ?auto_305 )
      ( TRAVEL ?auto_297 ?auto_298 )
      ( TRAVEL-VERIFY ?auto_297 ?auto_298 ) )
  )

  ( :method TRAVEL
    :parameters
    (
      ?auto_446 - PERSON
      ?auto_447 - CITY
    )
    :vars
    (
      ?auto_453 - FLEVEL
      ?auto_456 - FLEVEL
      ?auto_455 - CITY
      ?auto_448 - FLEVEL
      ?auto_452 - AIRCRAFT
      ?auto_461 - CITY
      ?auto_458 - FLEVEL
      ?auto_459 - FLEVEL
    )
    :precondition
    ( and ( NEXT ?auto_453 ?auto_456 ) ( PERSON-AT ?auto_446 ?auto_455 ) ( NEXT ?auto_448 ?auto_456 ) ( AIRCRAFT-AT ?auto_452 ?auto_461 ) ( FUEL-LEVEL ?auto_452 ?auto_458 ) ( NEXT ?auto_459 ?auto_458 ) ( NEXT ?auto_448 ?auto_459 ) )
    :subtasks
    ( ( !ZOOM ?auto_452 ?auto_461 ?auto_455 ?auto_458 ?auto_459 ?auto_448 )
      ( TRAVEL ?auto_446 ?auto_447 )
      ( TRAVEL-VERIFY ?auto_446 ?auto_447 ) )
  )

)

