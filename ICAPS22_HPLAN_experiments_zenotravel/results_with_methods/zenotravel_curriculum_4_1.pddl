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

  ( :method FLY-4PPL-VERIFY
    :parameters
    (
      ?p1 - PERSON
      ?p2 - PERSON
      ?p3 - PERSON
      ?p4 - PERSON
      ?c - CITY
    )
    :precondition
    ( and ( PERSON-AT ?p1 ?c ) ( PERSON-AT ?p2 ?c ) ( PERSON-AT ?p3 ?c ) ( PERSON-AT ?p4 ?c ) )
    :subtasks
    (  )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_5043 - PERSON
      ?auto_5042 - CITY
    )
    :vars
    (
      ?auto_5046 - FLEVEL
      ?auto_5045 - FLEVEL
      ?auto_5047 - CITY
      ?auto_5044 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_5046 ?auto_5045 ) ( PERSON-AT ?auto_5043 ?auto_5047 ) ( AIRCRAFT-AT ?auto_5044 ?auto_5042 ) ( FUEL-LEVEL ?auto_5044 ?auto_5046 ) ( not ( = ?auto_5042 ?auto_5047 ) ) ( not ( = ?auto_5046 ?auto_5045 ) ) )
    :subtasks
    ( ( !REFUEL ?auto_5044 ?auto_5042 ?auto_5046 ?auto_5045 )
      ( !FLY ?auto_5044 ?auto_5042 ?auto_5047 ?auto_5045 ?auto_5046 )
      ( !REFUEL ?auto_5044 ?auto_5047 ?auto_5046 ?auto_5045 )
      ( !BOARD ?auto_5043 ?auto_5044 ?auto_5047 )
      ( !FLY ?auto_5044 ?auto_5047 ?auto_5042 ?auto_5045 ?auto_5046 )
      ( !DEBARK ?auto_5043 ?auto_5044 ?auto_5042 )
      ( FLY-1PPL-VERIFY ?auto_5043 ?auto_5042 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_5051 - PERSON
      ?auto_5050 - CITY
    )
    :vars
    (
      ?auto_5054 - FLEVEL
      ?auto_5053 - FLEVEL
      ?auto_5055 - CITY
      ?auto_5052 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_5054 ?auto_5053 ) ( PERSON-AT ?auto_5051 ?auto_5055 ) ( AIRCRAFT-AT ?auto_5052 ?auto_5050 ) ( FUEL-LEVEL ?auto_5052 ?auto_5054 ) ( not ( = ?auto_5050 ?auto_5055 ) ) ( not ( = ?auto_5054 ?auto_5053 ) ) )
    :subtasks
    ( ( !REFUEL ?auto_5052 ?auto_5050 ?auto_5054 ?auto_5053 )
      ( !FLY ?auto_5052 ?auto_5050 ?auto_5055 ?auto_5053 ?auto_5054 )
      ( !REFUEL ?auto_5052 ?auto_5055 ?auto_5054 ?auto_5053 )
      ( !BOARD ?auto_5051 ?auto_5052 ?auto_5055 )
      ( !FLY ?auto_5052 ?auto_5055 ?auto_5050 ?auto_5053 ?auto_5054 )
      ( !DEBARK ?auto_5051 ?auto_5052 ?auto_5050 )
      ( FLY-1PPL-VERIFY ?auto_5051 ?auto_5050 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_5066 - PERSON
      ?auto_5067 - PERSON
      ?auto_5065 - CITY
    )
    :vars
    (
      ?auto_5070 - FLEVEL
      ?auto_5069 - FLEVEL
      ?auto_5068 - CITY
      ?auto_5071 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_5070 ?auto_5069 ) ( PERSON-AT ?auto_5067 ?auto_5068 ) ( not ( = ?auto_5065 ?auto_5068 ) ) ( not ( = ?auto_5070 ?auto_5069 ) ) ( PERSON-AT ?auto_5066 ?auto_5068 ) ( AIRCRAFT-AT ?auto_5071 ?auto_5065 ) ( FUEL-LEVEL ?auto_5071 ?auto_5070 ) ( not ( = ?auto_5066 ?auto_5067 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_5066 ?auto_5065 )
      ( FLY-1PPL ?auto_5067 ?auto_5065 )
      ( FLY-2PPL-VERIFY ?auto_5066 ?auto_5067 ?auto_5065 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_5073 - PERSON
      ?auto_5074 - PERSON
      ?auto_5072 - CITY
    )
    :vars
    (
      ?auto_5078 - FLEVEL
      ?auto_5077 - FLEVEL
      ?auto_5076 - CITY
      ?auto_5075 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_5078 ?auto_5077 ) ( PERSON-AT ?auto_5073 ?auto_5076 ) ( not ( = ?auto_5072 ?auto_5076 ) ) ( not ( = ?auto_5078 ?auto_5077 ) ) ( PERSON-AT ?auto_5074 ?auto_5076 ) ( AIRCRAFT-AT ?auto_5075 ?auto_5072 ) ( FUEL-LEVEL ?auto_5075 ?auto_5078 ) ( not ( = ?auto_5074 ?auto_5073 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_5074 ?auto_5073 ?auto_5072 )
      ( FLY-2PPL-VERIFY ?auto_5073 ?auto_5074 ?auto_5072 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_5090 - PERSON
      ?auto_5089 - CITY
    )
    :vars
    (
      ?auto_5093 - FLEVEL
      ?auto_5092 - FLEVEL
      ?auto_5094 - CITY
      ?auto_5091 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_5093 ?auto_5092 ) ( PERSON-AT ?auto_5090 ?auto_5094 ) ( AIRCRAFT-AT ?auto_5091 ?auto_5089 ) ( FUEL-LEVEL ?auto_5091 ?auto_5093 ) ( not ( = ?auto_5089 ?auto_5094 ) ) ( not ( = ?auto_5093 ?auto_5092 ) ) )
    :subtasks
    ( ( !REFUEL ?auto_5091 ?auto_5089 ?auto_5093 ?auto_5092 )
      ( !FLY ?auto_5091 ?auto_5089 ?auto_5094 ?auto_5092 ?auto_5093 )
      ( !REFUEL ?auto_5091 ?auto_5094 ?auto_5093 ?auto_5092 )
      ( !BOARD ?auto_5090 ?auto_5091 ?auto_5094 )
      ( !FLY ?auto_5091 ?auto_5094 ?auto_5089 ?auto_5092 ?auto_5093 )
      ( !DEBARK ?auto_5090 ?auto_5091 ?auto_5089 )
      ( FLY-1PPL-VERIFY ?auto_5090 ?auto_5089 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_5182 - PERSON
      ?auto_5183 - PERSON
      ?auto_5184 - PERSON
      ?auto_5181 - CITY
    )
    :vars
    (
      ?auto_5185 - FLEVEL
      ?auto_5188 - FLEVEL
      ?auto_5187 - CITY
      ?auto_5189 - CITY
      ?auto_5186 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_5185 ?auto_5188 ) ( PERSON-AT ?auto_5184 ?auto_5187 ) ( not ( = ?auto_5181 ?auto_5187 ) ) ( not ( = ?auto_5185 ?auto_5188 ) ) ( PERSON-AT ?auto_5183 ?auto_5189 ) ( not ( = ?auto_5181 ?auto_5189 ) ) ( PERSON-AT ?auto_5182 ?auto_5189 ) ( AIRCRAFT-AT ?auto_5186 ?auto_5181 ) ( FUEL-LEVEL ?auto_5186 ?auto_5185 ) ( not ( = ?auto_5182 ?auto_5183 ) ) ( not ( = ?auto_5182 ?auto_5184 ) ) ( not ( = ?auto_5183 ?auto_5184 ) ) ( not ( = ?auto_5187 ?auto_5189 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_5183 ?auto_5182 ?auto_5181 )
      ( FLY-1PPL ?auto_5184 ?auto_5181 )
      ( FLY-3PPL-VERIFY ?auto_5182 ?auto_5183 ?auto_5184 ?auto_5181 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_5201 - PERSON
      ?auto_5202 - PERSON
      ?auto_5203 - PERSON
      ?auto_5200 - CITY
    )
    :vars
    (
      ?auto_5208 - FLEVEL
      ?auto_5206 - FLEVEL
      ?auto_5207 - CITY
      ?auto_5205 - CITY
      ?auto_5204 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_5208 ?auto_5206 ) ( PERSON-AT ?auto_5202 ?auto_5207 ) ( not ( = ?auto_5200 ?auto_5207 ) ) ( not ( = ?auto_5208 ?auto_5206 ) ) ( PERSON-AT ?auto_5203 ?auto_5205 ) ( not ( = ?auto_5200 ?auto_5205 ) ) ( PERSON-AT ?auto_5201 ?auto_5205 ) ( AIRCRAFT-AT ?auto_5204 ?auto_5200 ) ( FUEL-LEVEL ?auto_5204 ?auto_5208 ) ( not ( = ?auto_5201 ?auto_5203 ) ) ( not ( = ?auto_5201 ?auto_5202 ) ) ( not ( = ?auto_5203 ?auto_5202 ) ) ( not ( = ?auto_5207 ?auto_5205 ) ) )
    :subtasks
    ( ( FLY-3PPL ?auto_5201 ?auto_5203 ?auto_5202 ?auto_5200 )
      ( FLY-3PPL-VERIFY ?auto_5201 ?auto_5202 ?auto_5203 ?auto_5200 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_5220 - PERSON
      ?auto_5221 - PERSON
      ?auto_5222 - PERSON
      ?auto_5219 - CITY
    )
    :vars
    (
      ?auto_5225 - FLEVEL
      ?auto_5223 - FLEVEL
      ?auto_5224 - CITY
      ?auto_5226 - CITY
      ?auto_5227 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_5225 ?auto_5223 ) ( PERSON-AT ?auto_5222 ?auto_5224 ) ( not ( = ?auto_5219 ?auto_5224 ) ) ( not ( = ?auto_5225 ?auto_5223 ) ) ( PERSON-AT ?auto_5220 ?auto_5226 ) ( not ( = ?auto_5219 ?auto_5226 ) ) ( PERSON-AT ?auto_5221 ?auto_5226 ) ( AIRCRAFT-AT ?auto_5227 ?auto_5219 ) ( FUEL-LEVEL ?auto_5227 ?auto_5225 ) ( not ( = ?auto_5221 ?auto_5220 ) ) ( not ( = ?auto_5221 ?auto_5222 ) ) ( not ( = ?auto_5220 ?auto_5222 ) ) ( not ( = ?auto_5224 ?auto_5226 ) ) )
    :subtasks
    ( ( FLY-3PPL ?auto_5221 ?auto_5222 ?auto_5220 ?auto_5219 )
      ( FLY-3PPL-VERIFY ?auto_5220 ?auto_5221 ?auto_5222 ?auto_5219 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_5239 - PERSON
      ?auto_5240 - PERSON
      ?auto_5241 - PERSON
      ?auto_5238 - CITY
    )
    :vars
    (
      ?auto_5244 - FLEVEL
      ?auto_5242 - FLEVEL
      ?auto_5243 - CITY
      ?auto_5245 - CITY
      ?auto_5246 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_5244 ?auto_5242 ) ( PERSON-AT ?auto_5240 ?auto_5243 ) ( not ( = ?auto_5238 ?auto_5243 ) ) ( not ( = ?auto_5244 ?auto_5242 ) ) ( PERSON-AT ?auto_5239 ?auto_5245 ) ( not ( = ?auto_5238 ?auto_5245 ) ) ( PERSON-AT ?auto_5241 ?auto_5245 ) ( AIRCRAFT-AT ?auto_5246 ?auto_5238 ) ( FUEL-LEVEL ?auto_5246 ?auto_5244 ) ( not ( = ?auto_5241 ?auto_5239 ) ) ( not ( = ?auto_5241 ?auto_5240 ) ) ( not ( = ?auto_5239 ?auto_5240 ) ) ( not ( = ?auto_5243 ?auto_5245 ) ) )
    :subtasks
    ( ( FLY-3PPL ?auto_5241 ?auto_5240 ?auto_5239 ?auto_5238 )
      ( FLY-3PPL-VERIFY ?auto_5239 ?auto_5240 ?auto_5241 ?auto_5238 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_5278 - PERSON
      ?auto_5279 - PERSON
      ?auto_5280 - PERSON
      ?auto_5277 - CITY
    )
    :vars
    (
      ?auto_5283 - FLEVEL
      ?auto_5281 - FLEVEL
      ?auto_5282 - CITY
      ?auto_5284 - CITY
      ?auto_5285 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_5283 ?auto_5281 ) ( PERSON-AT ?auto_5278 ?auto_5282 ) ( not ( = ?auto_5277 ?auto_5282 ) ) ( not ( = ?auto_5283 ?auto_5281 ) ) ( PERSON-AT ?auto_5280 ?auto_5284 ) ( not ( = ?auto_5277 ?auto_5284 ) ) ( PERSON-AT ?auto_5279 ?auto_5284 ) ( AIRCRAFT-AT ?auto_5285 ?auto_5277 ) ( FUEL-LEVEL ?auto_5285 ?auto_5283 ) ( not ( = ?auto_5279 ?auto_5280 ) ) ( not ( = ?auto_5279 ?auto_5278 ) ) ( not ( = ?auto_5280 ?auto_5278 ) ) ( not ( = ?auto_5282 ?auto_5284 ) ) )
    :subtasks
    ( ( FLY-3PPL ?auto_5279 ?auto_5278 ?auto_5280 ?auto_5277 )
      ( FLY-3PPL-VERIFY ?auto_5278 ?auto_5279 ?auto_5280 ?auto_5277 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_5297 - PERSON
      ?auto_5298 - PERSON
      ?auto_5299 - PERSON
      ?auto_5296 - CITY
    )
    :vars
    (
      ?auto_5302 - FLEVEL
      ?auto_5300 - FLEVEL
      ?auto_5301 - CITY
      ?auto_5303 - CITY
      ?auto_5304 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_5302 ?auto_5300 ) ( PERSON-AT ?auto_5297 ?auto_5301 ) ( not ( = ?auto_5296 ?auto_5301 ) ) ( not ( = ?auto_5302 ?auto_5300 ) ) ( PERSON-AT ?auto_5298 ?auto_5303 ) ( not ( = ?auto_5296 ?auto_5303 ) ) ( PERSON-AT ?auto_5299 ?auto_5303 ) ( AIRCRAFT-AT ?auto_5304 ?auto_5296 ) ( FUEL-LEVEL ?auto_5304 ?auto_5302 ) ( not ( = ?auto_5299 ?auto_5298 ) ) ( not ( = ?auto_5299 ?auto_5297 ) ) ( not ( = ?auto_5298 ?auto_5297 ) ) ( not ( = ?auto_5301 ?auto_5303 ) ) )
    :subtasks
    ( ( FLY-3PPL ?auto_5299 ?auto_5297 ?auto_5298 ?auto_5296 )
      ( FLY-3PPL-VERIFY ?auto_5297 ?auto_5298 ?auto_5299 ?auto_5296 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_5359 - PERSON
      ?auto_5358 - CITY
    )
    :vars
    (
      ?auto_5362 - FLEVEL
      ?auto_5361 - FLEVEL
      ?auto_5363 - CITY
      ?auto_5360 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_5362 ?auto_5361 ) ( PERSON-AT ?auto_5359 ?auto_5363 ) ( AIRCRAFT-AT ?auto_5360 ?auto_5358 ) ( FUEL-LEVEL ?auto_5360 ?auto_5362 ) ( not ( = ?auto_5358 ?auto_5363 ) ) ( not ( = ?auto_5362 ?auto_5361 ) ) )
    :subtasks
    ( ( !REFUEL ?auto_5360 ?auto_5358 ?auto_5362 ?auto_5361 )
      ( !FLY ?auto_5360 ?auto_5358 ?auto_5363 ?auto_5361 ?auto_5362 )
      ( !REFUEL ?auto_5360 ?auto_5363 ?auto_5362 ?auto_5361 )
      ( !BOARD ?auto_5359 ?auto_5360 ?auto_5363 )
      ( !FLY ?auto_5360 ?auto_5363 ?auto_5358 ?auto_5361 ?auto_5362 )
      ( !DEBARK ?auto_5359 ?auto_5360 ?auto_5358 )
      ( FLY-1PPL-VERIFY ?auto_5359 ?auto_5358 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_6351 - PERSON
      ?auto_6352 - PERSON
      ?auto_6353 - PERSON
      ?auto_6354 - PERSON
      ?auto_6350 - CITY
    )
    :vars
    (
      ?auto_6356 - FLEVEL
      ?auto_6357 - FLEVEL
      ?auto_6358 - CITY
      ?auto_6359 - CITY
      ?auto_6360 - CITY
      ?auto_6355 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_6356 ?auto_6357 ) ( PERSON-AT ?auto_6354 ?auto_6358 ) ( not ( = ?auto_6350 ?auto_6358 ) ) ( not ( = ?auto_6356 ?auto_6357 ) ) ( PERSON-AT ?auto_6353 ?auto_6359 ) ( not ( = ?auto_6350 ?auto_6359 ) ) ( PERSON-AT ?auto_6352 ?auto_6360 ) ( not ( = ?auto_6350 ?auto_6360 ) ) ( PERSON-AT ?auto_6351 ?auto_6360 ) ( AIRCRAFT-AT ?auto_6355 ?auto_6350 ) ( FUEL-LEVEL ?auto_6355 ?auto_6356 ) ( not ( = ?auto_6351 ?auto_6352 ) ) ( not ( = ?auto_6351 ?auto_6353 ) ) ( not ( = ?auto_6352 ?auto_6353 ) ) ( not ( = ?auto_6359 ?auto_6360 ) ) ( not ( = ?auto_6351 ?auto_6354 ) ) ( not ( = ?auto_6352 ?auto_6354 ) ) ( not ( = ?auto_6353 ?auto_6354 ) ) ( not ( = ?auto_6358 ?auto_6359 ) ) ( not ( = ?auto_6358 ?auto_6360 ) ) )
    :subtasks
    ( ( FLY-3PPL ?auto_6351 ?auto_6353 ?auto_6352 ?auto_6350 )
      ( FLY-1PPL ?auto_6354 ?auto_6350 )
      ( FLY-4PPL-VERIFY ?auto_6351 ?auto_6352 ?auto_6353 ?auto_6354 ?auto_6350 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_6386 - PERSON
      ?auto_6387 - PERSON
      ?auto_6388 - PERSON
      ?auto_6389 - PERSON
      ?auto_6385 - CITY
    )
    :vars
    (
      ?auto_6391 - FLEVEL
      ?auto_6392 - FLEVEL
      ?auto_6394 - CITY
      ?auto_6393 - CITY
      ?auto_6395 - CITY
      ?auto_6390 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_6391 ?auto_6392 ) ( PERSON-AT ?auto_6388 ?auto_6394 ) ( not ( = ?auto_6385 ?auto_6394 ) ) ( not ( = ?auto_6391 ?auto_6392 ) ) ( PERSON-AT ?auto_6389 ?auto_6393 ) ( not ( = ?auto_6385 ?auto_6393 ) ) ( PERSON-AT ?auto_6387 ?auto_6395 ) ( not ( = ?auto_6385 ?auto_6395 ) ) ( PERSON-AT ?auto_6386 ?auto_6395 ) ( AIRCRAFT-AT ?auto_6390 ?auto_6385 ) ( FUEL-LEVEL ?auto_6390 ?auto_6391 ) ( not ( = ?auto_6386 ?auto_6387 ) ) ( not ( = ?auto_6386 ?auto_6389 ) ) ( not ( = ?auto_6387 ?auto_6389 ) ) ( not ( = ?auto_6393 ?auto_6395 ) ) ( not ( = ?auto_6386 ?auto_6388 ) ) ( not ( = ?auto_6387 ?auto_6388 ) ) ( not ( = ?auto_6389 ?auto_6388 ) ) ( not ( = ?auto_6394 ?auto_6393 ) ) ( not ( = ?auto_6394 ?auto_6395 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_6386 ?auto_6387 ?auto_6389 ?auto_6388 ?auto_6385 )
      ( FLY-4PPL-VERIFY ?auto_6386 ?auto_6387 ?auto_6388 ?auto_6389 ?auto_6385 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_6421 - PERSON
      ?auto_6422 - PERSON
      ?auto_6423 - PERSON
      ?auto_6424 - PERSON
      ?auto_6420 - CITY
    )
    :vars
    (
      ?auto_6430 - FLEVEL
      ?auto_6426 - FLEVEL
      ?auto_6428 - CITY
      ?auto_6429 - CITY
      ?auto_6425 - CITY
      ?auto_6427 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_6430 ?auto_6426 ) ( PERSON-AT ?auto_6424 ?auto_6428 ) ( not ( = ?auto_6420 ?auto_6428 ) ) ( not ( = ?auto_6430 ?auto_6426 ) ) ( PERSON-AT ?auto_6422 ?auto_6429 ) ( not ( = ?auto_6420 ?auto_6429 ) ) ( PERSON-AT ?auto_6423 ?auto_6425 ) ( not ( = ?auto_6420 ?auto_6425 ) ) ( PERSON-AT ?auto_6421 ?auto_6425 ) ( AIRCRAFT-AT ?auto_6427 ?auto_6420 ) ( FUEL-LEVEL ?auto_6427 ?auto_6430 ) ( not ( = ?auto_6421 ?auto_6423 ) ) ( not ( = ?auto_6421 ?auto_6422 ) ) ( not ( = ?auto_6423 ?auto_6422 ) ) ( not ( = ?auto_6429 ?auto_6425 ) ) ( not ( = ?auto_6421 ?auto_6424 ) ) ( not ( = ?auto_6423 ?auto_6424 ) ) ( not ( = ?auto_6422 ?auto_6424 ) ) ( not ( = ?auto_6428 ?auto_6429 ) ) ( not ( = ?auto_6428 ?auto_6425 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_6421 ?auto_6423 ?auto_6424 ?auto_6422 ?auto_6420 )
      ( FLY-4PPL-VERIFY ?auto_6421 ?auto_6422 ?auto_6423 ?auto_6424 ?auto_6420 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_6456 - PERSON
      ?auto_6457 - PERSON
      ?auto_6458 - PERSON
      ?auto_6459 - PERSON
      ?auto_6455 - CITY
    )
    :vars
    (
      ?auto_6465 - FLEVEL
      ?auto_6461 - FLEVEL
      ?auto_6463 - CITY
      ?auto_6464 - CITY
      ?auto_6460 - CITY
      ?auto_6462 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_6465 ?auto_6461 ) ( PERSON-AT ?auto_6458 ?auto_6463 ) ( not ( = ?auto_6455 ?auto_6463 ) ) ( not ( = ?auto_6465 ?auto_6461 ) ) ( PERSON-AT ?auto_6457 ?auto_6464 ) ( not ( = ?auto_6455 ?auto_6464 ) ) ( PERSON-AT ?auto_6459 ?auto_6460 ) ( not ( = ?auto_6455 ?auto_6460 ) ) ( PERSON-AT ?auto_6456 ?auto_6460 ) ( AIRCRAFT-AT ?auto_6462 ?auto_6455 ) ( FUEL-LEVEL ?auto_6462 ?auto_6465 ) ( not ( = ?auto_6456 ?auto_6459 ) ) ( not ( = ?auto_6456 ?auto_6457 ) ) ( not ( = ?auto_6459 ?auto_6457 ) ) ( not ( = ?auto_6464 ?auto_6460 ) ) ( not ( = ?auto_6456 ?auto_6458 ) ) ( not ( = ?auto_6459 ?auto_6458 ) ) ( not ( = ?auto_6457 ?auto_6458 ) ) ( not ( = ?auto_6463 ?auto_6464 ) ) ( not ( = ?auto_6463 ?auto_6460 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_6456 ?auto_6459 ?auto_6458 ?auto_6457 ?auto_6455 )
      ( FLY-4PPL-VERIFY ?auto_6456 ?auto_6457 ?auto_6458 ?auto_6459 ?auto_6455 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_6565 - PERSON
      ?auto_6566 - PERSON
      ?auto_6567 - PERSON
      ?auto_6568 - PERSON
      ?auto_6564 - CITY
    )
    :vars
    (
      ?auto_6574 - FLEVEL
      ?auto_6570 - FLEVEL
      ?auto_6572 - CITY
      ?auto_6573 - CITY
      ?auto_6569 - CITY
      ?auto_6571 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_6574 ?auto_6570 ) ( PERSON-AT ?auto_6566 ?auto_6572 ) ( not ( = ?auto_6564 ?auto_6572 ) ) ( not ( = ?auto_6574 ?auto_6570 ) ) ( PERSON-AT ?auto_6568 ?auto_6573 ) ( not ( = ?auto_6564 ?auto_6573 ) ) ( PERSON-AT ?auto_6567 ?auto_6569 ) ( not ( = ?auto_6564 ?auto_6569 ) ) ( PERSON-AT ?auto_6565 ?auto_6569 ) ( AIRCRAFT-AT ?auto_6571 ?auto_6564 ) ( FUEL-LEVEL ?auto_6571 ?auto_6574 ) ( not ( = ?auto_6565 ?auto_6567 ) ) ( not ( = ?auto_6565 ?auto_6568 ) ) ( not ( = ?auto_6567 ?auto_6568 ) ) ( not ( = ?auto_6573 ?auto_6569 ) ) ( not ( = ?auto_6565 ?auto_6566 ) ) ( not ( = ?auto_6567 ?auto_6566 ) ) ( not ( = ?auto_6568 ?auto_6566 ) ) ( not ( = ?auto_6572 ?auto_6573 ) ) ( not ( = ?auto_6572 ?auto_6569 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_6565 ?auto_6567 ?auto_6566 ?auto_6568 ?auto_6564 )
      ( FLY-4PPL-VERIFY ?auto_6565 ?auto_6566 ?auto_6567 ?auto_6568 ?auto_6564 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_6600 - PERSON
      ?auto_6601 - PERSON
      ?auto_6602 - PERSON
      ?auto_6603 - PERSON
      ?auto_6599 - CITY
    )
    :vars
    (
      ?auto_6609 - FLEVEL
      ?auto_6605 - FLEVEL
      ?auto_6607 - CITY
      ?auto_6608 - CITY
      ?auto_6604 - CITY
      ?auto_6606 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_6609 ?auto_6605 ) ( PERSON-AT ?auto_6601 ?auto_6607 ) ( not ( = ?auto_6599 ?auto_6607 ) ) ( not ( = ?auto_6609 ?auto_6605 ) ) ( PERSON-AT ?auto_6602 ?auto_6608 ) ( not ( = ?auto_6599 ?auto_6608 ) ) ( PERSON-AT ?auto_6603 ?auto_6604 ) ( not ( = ?auto_6599 ?auto_6604 ) ) ( PERSON-AT ?auto_6600 ?auto_6604 ) ( AIRCRAFT-AT ?auto_6606 ?auto_6599 ) ( FUEL-LEVEL ?auto_6606 ?auto_6609 ) ( not ( = ?auto_6600 ?auto_6603 ) ) ( not ( = ?auto_6600 ?auto_6602 ) ) ( not ( = ?auto_6603 ?auto_6602 ) ) ( not ( = ?auto_6608 ?auto_6604 ) ) ( not ( = ?auto_6600 ?auto_6601 ) ) ( not ( = ?auto_6603 ?auto_6601 ) ) ( not ( = ?auto_6602 ?auto_6601 ) ) ( not ( = ?auto_6607 ?auto_6608 ) ) ( not ( = ?auto_6607 ?auto_6604 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_6600 ?auto_6603 ?auto_6601 ?auto_6602 ?auto_6599 )
      ( FLY-4PPL-VERIFY ?auto_6600 ?auto_6601 ?auto_6602 ?auto_6603 ?auto_6599 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_6709 - PERSON
      ?auto_6710 - PERSON
      ?auto_6711 - PERSON
      ?auto_6712 - PERSON
      ?auto_6708 - CITY
    )
    :vars
    (
      ?auto_6718 - FLEVEL
      ?auto_6714 - FLEVEL
      ?auto_6716 - CITY
      ?auto_6717 - CITY
      ?auto_6713 - CITY
      ?auto_6715 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_6718 ?auto_6714 ) ( PERSON-AT ?auto_6712 ?auto_6716 ) ( not ( = ?auto_6708 ?auto_6716 ) ) ( not ( = ?auto_6718 ?auto_6714 ) ) ( PERSON-AT ?auto_6711 ?auto_6717 ) ( not ( = ?auto_6708 ?auto_6717 ) ) ( PERSON-AT ?auto_6709 ?auto_6713 ) ( not ( = ?auto_6708 ?auto_6713 ) ) ( PERSON-AT ?auto_6710 ?auto_6713 ) ( AIRCRAFT-AT ?auto_6715 ?auto_6708 ) ( FUEL-LEVEL ?auto_6715 ?auto_6718 ) ( not ( = ?auto_6710 ?auto_6709 ) ) ( not ( = ?auto_6710 ?auto_6711 ) ) ( not ( = ?auto_6709 ?auto_6711 ) ) ( not ( = ?auto_6717 ?auto_6713 ) ) ( not ( = ?auto_6710 ?auto_6712 ) ) ( not ( = ?auto_6709 ?auto_6712 ) ) ( not ( = ?auto_6711 ?auto_6712 ) ) ( not ( = ?auto_6716 ?auto_6717 ) ) ( not ( = ?auto_6716 ?auto_6713 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_6710 ?auto_6709 ?auto_6712 ?auto_6711 ?auto_6708 )
      ( FLY-4PPL-VERIFY ?auto_6709 ?auto_6710 ?auto_6711 ?auto_6712 ?auto_6708 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_6744 - PERSON
      ?auto_6745 - PERSON
      ?auto_6746 - PERSON
      ?auto_6747 - PERSON
      ?auto_6743 - CITY
    )
    :vars
    (
      ?auto_6753 - FLEVEL
      ?auto_6749 - FLEVEL
      ?auto_6751 - CITY
      ?auto_6752 - CITY
      ?auto_6748 - CITY
      ?auto_6750 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_6753 ?auto_6749 ) ( PERSON-AT ?auto_6746 ?auto_6751 ) ( not ( = ?auto_6743 ?auto_6751 ) ) ( not ( = ?auto_6753 ?auto_6749 ) ) ( PERSON-AT ?auto_6747 ?auto_6752 ) ( not ( = ?auto_6743 ?auto_6752 ) ) ( PERSON-AT ?auto_6744 ?auto_6748 ) ( not ( = ?auto_6743 ?auto_6748 ) ) ( PERSON-AT ?auto_6745 ?auto_6748 ) ( AIRCRAFT-AT ?auto_6750 ?auto_6743 ) ( FUEL-LEVEL ?auto_6750 ?auto_6753 ) ( not ( = ?auto_6745 ?auto_6744 ) ) ( not ( = ?auto_6745 ?auto_6747 ) ) ( not ( = ?auto_6744 ?auto_6747 ) ) ( not ( = ?auto_6752 ?auto_6748 ) ) ( not ( = ?auto_6745 ?auto_6746 ) ) ( not ( = ?auto_6744 ?auto_6746 ) ) ( not ( = ?auto_6747 ?auto_6746 ) ) ( not ( = ?auto_6751 ?auto_6752 ) ) ( not ( = ?auto_6751 ?auto_6748 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_6745 ?auto_6744 ?auto_6746 ?auto_6747 ?auto_6743 )
      ( FLY-4PPL-VERIFY ?auto_6744 ?auto_6745 ?auto_6746 ?auto_6747 ?auto_6743 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_6854 - PERSON
      ?auto_6855 - PERSON
      ?auto_6856 - PERSON
      ?auto_6857 - PERSON
      ?auto_6853 - CITY
    )
    :vars
    (
      ?auto_6863 - FLEVEL
      ?auto_6859 - FLEVEL
      ?auto_6861 - CITY
      ?auto_6862 - CITY
      ?auto_6858 - CITY
      ?auto_6860 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_6863 ?auto_6859 ) ( PERSON-AT ?auto_6857 ?auto_6861 ) ( not ( = ?auto_6853 ?auto_6861 ) ) ( not ( = ?auto_6863 ?auto_6859 ) ) ( PERSON-AT ?auto_6855 ?auto_6862 ) ( not ( = ?auto_6853 ?auto_6862 ) ) ( PERSON-AT ?auto_6854 ?auto_6858 ) ( not ( = ?auto_6853 ?auto_6858 ) ) ( PERSON-AT ?auto_6856 ?auto_6858 ) ( AIRCRAFT-AT ?auto_6860 ?auto_6853 ) ( FUEL-LEVEL ?auto_6860 ?auto_6863 ) ( not ( = ?auto_6856 ?auto_6854 ) ) ( not ( = ?auto_6856 ?auto_6855 ) ) ( not ( = ?auto_6854 ?auto_6855 ) ) ( not ( = ?auto_6862 ?auto_6858 ) ) ( not ( = ?auto_6856 ?auto_6857 ) ) ( not ( = ?auto_6854 ?auto_6857 ) ) ( not ( = ?auto_6855 ?auto_6857 ) ) ( not ( = ?auto_6861 ?auto_6862 ) ) ( not ( = ?auto_6861 ?auto_6858 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_6856 ?auto_6854 ?auto_6857 ?auto_6855 ?auto_6853 )
      ( FLY-4PPL-VERIFY ?auto_6854 ?auto_6855 ?auto_6856 ?auto_6857 ?auto_6853 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_6889 - PERSON
      ?auto_6890 - PERSON
      ?auto_6891 - PERSON
      ?auto_6892 - PERSON
      ?auto_6888 - CITY
    )
    :vars
    (
      ?auto_6898 - FLEVEL
      ?auto_6894 - FLEVEL
      ?auto_6896 - CITY
      ?auto_6897 - CITY
      ?auto_6893 - CITY
      ?auto_6895 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_6898 ?auto_6894 ) ( PERSON-AT ?auto_6891 ?auto_6896 ) ( not ( = ?auto_6888 ?auto_6896 ) ) ( not ( = ?auto_6898 ?auto_6894 ) ) ( PERSON-AT ?auto_6890 ?auto_6897 ) ( not ( = ?auto_6888 ?auto_6897 ) ) ( PERSON-AT ?auto_6889 ?auto_6893 ) ( not ( = ?auto_6888 ?auto_6893 ) ) ( PERSON-AT ?auto_6892 ?auto_6893 ) ( AIRCRAFT-AT ?auto_6895 ?auto_6888 ) ( FUEL-LEVEL ?auto_6895 ?auto_6898 ) ( not ( = ?auto_6892 ?auto_6889 ) ) ( not ( = ?auto_6892 ?auto_6890 ) ) ( not ( = ?auto_6889 ?auto_6890 ) ) ( not ( = ?auto_6897 ?auto_6893 ) ) ( not ( = ?auto_6892 ?auto_6891 ) ) ( not ( = ?auto_6889 ?auto_6891 ) ) ( not ( = ?auto_6890 ?auto_6891 ) ) ( not ( = ?auto_6896 ?auto_6897 ) ) ( not ( = ?auto_6896 ?auto_6893 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_6892 ?auto_6889 ?auto_6891 ?auto_6890 ?auto_6888 )
      ( FLY-4PPL-VERIFY ?auto_6889 ?auto_6890 ?auto_6891 ?auto_6892 ?auto_6888 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_6960 - PERSON
      ?auto_6961 - PERSON
      ?auto_6962 - PERSON
      ?auto_6963 - PERSON
      ?auto_6959 - CITY
    )
    :vars
    (
      ?auto_6969 - FLEVEL
      ?auto_6965 - FLEVEL
      ?auto_6967 - CITY
      ?auto_6968 - CITY
      ?auto_6964 - CITY
      ?auto_6966 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_6969 ?auto_6965 ) ( PERSON-AT ?auto_6961 ?auto_6967 ) ( not ( = ?auto_6959 ?auto_6967 ) ) ( not ( = ?auto_6969 ?auto_6965 ) ) ( PERSON-AT ?auto_6963 ?auto_6968 ) ( not ( = ?auto_6959 ?auto_6968 ) ) ( PERSON-AT ?auto_6960 ?auto_6964 ) ( not ( = ?auto_6959 ?auto_6964 ) ) ( PERSON-AT ?auto_6962 ?auto_6964 ) ( AIRCRAFT-AT ?auto_6966 ?auto_6959 ) ( FUEL-LEVEL ?auto_6966 ?auto_6969 ) ( not ( = ?auto_6962 ?auto_6960 ) ) ( not ( = ?auto_6962 ?auto_6963 ) ) ( not ( = ?auto_6960 ?auto_6963 ) ) ( not ( = ?auto_6968 ?auto_6964 ) ) ( not ( = ?auto_6962 ?auto_6961 ) ) ( not ( = ?auto_6960 ?auto_6961 ) ) ( not ( = ?auto_6963 ?auto_6961 ) ) ( not ( = ?auto_6967 ?auto_6968 ) ) ( not ( = ?auto_6967 ?auto_6964 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_6962 ?auto_6960 ?auto_6961 ?auto_6963 ?auto_6959 )
      ( FLY-4PPL-VERIFY ?auto_6960 ?auto_6961 ?auto_6962 ?auto_6963 ?auto_6959 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_7033 - PERSON
      ?auto_7034 - PERSON
      ?auto_7035 - PERSON
      ?auto_7036 - PERSON
      ?auto_7032 - CITY
    )
    :vars
    (
      ?auto_7042 - FLEVEL
      ?auto_7038 - FLEVEL
      ?auto_7040 - CITY
      ?auto_7041 - CITY
      ?auto_7037 - CITY
      ?auto_7039 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_7042 ?auto_7038 ) ( PERSON-AT ?auto_7034 ?auto_7040 ) ( not ( = ?auto_7032 ?auto_7040 ) ) ( not ( = ?auto_7042 ?auto_7038 ) ) ( PERSON-AT ?auto_7035 ?auto_7041 ) ( not ( = ?auto_7032 ?auto_7041 ) ) ( PERSON-AT ?auto_7033 ?auto_7037 ) ( not ( = ?auto_7032 ?auto_7037 ) ) ( PERSON-AT ?auto_7036 ?auto_7037 ) ( AIRCRAFT-AT ?auto_7039 ?auto_7032 ) ( FUEL-LEVEL ?auto_7039 ?auto_7042 ) ( not ( = ?auto_7036 ?auto_7033 ) ) ( not ( = ?auto_7036 ?auto_7035 ) ) ( not ( = ?auto_7033 ?auto_7035 ) ) ( not ( = ?auto_7041 ?auto_7037 ) ) ( not ( = ?auto_7036 ?auto_7034 ) ) ( not ( = ?auto_7033 ?auto_7034 ) ) ( not ( = ?auto_7035 ?auto_7034 ) ) ( not ( = ?auto_7040 ?auto_7041 ) ) ( not ( = ?auto_7040 ?auto_7037 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_7036 ?auto_7033 ?auto_7034 ?auto_7035 ?auto_7032 )
      ( FLY-4PPL-VERIFY ?auto_7033 ?auto_7034 ?auto_7035 ?auto_7036 ?auto_7032 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_7142 - PERSON
      ?auto_7143 - PERSON
      ?auto_7144 - PERSON
      ?auto_7145 - PERSON
      ?auto_7141 - CITY
    )
    :vars
    (
      ?auto_7151 - FLEVEL
      ?auto_7147 - FLEVEL
      ?auto_7149 - CITY
      ?auto_7150 - CITY
      ?auto_7146 - CITY
      ?auto_7148 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_7151 ?auto_7147 ) ( PERSON-AT ?auto_7145 ?auto_7149 ) ( not ( = ?auto_7141 ?auto_7149 ) ) ( not ( = ?auto_7151 ?auto_7147 ) ) ( PERSON-AT ?auto_7142 ?auto_7150 ) ( not ( = ?auto_7141 ?auto_7150 ) ) ( PERSON-AT ?auto_7144 ?auto_7146 ) ( not ( = ?auto_7141 ?auto_7146 ) ) ( PERSON-AT ?auto_7143 ?auto_7146 ) ( AIRCRAFT-AT ?auto_7148 ?auto_7141 ) ( FUEL-LEVEL ?auto_7148 ?auto_7151 ) ( not ( = ?auto_7143 ?auto_7144 ) ) ( not ( = ?auto_7143 ?auto_7142 ) ) ( not ( = ?auto_7144 ?auto_7142 ) ) ( not ( = ?auto_7150 ?auto_7146 ) ) ( not ( = ?auto_7143 ?auto_7145 ) ) ( not ( = ?auto_7144 ?auto_7145 ) ) ( not ( = ?auto_7142 ?auto_7145 ) ) ( not ( = ?auto_7149 ?auto_7150 ) ) ( not ( = ?auto_7149 ?auto_7146 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_7143 ?auto_7144 ?auto_7145 ?auto_7142 ?auto_7141 )
      ( FLY-4PPL-VERIFY ?auto_7142 ?auto_7143 ?auto_7144 ?auto_7145 ?auto_7141 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_7177 - PERSON
      ?auto_7178 - PERSON
      ?auto_7179 - PERSON
      ?auto_7180 - PERSON
      ?auto_7176 - CITY
    )
    :vars
    (
      ?auto_7186 - FLEVEL
      ?auto_7182 - FLEVEL
      ?auto_7184 - CITY
      ?auto_7185 - CITY
      ?auto_7181 - CITY
      ?auto_7183 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_7186 ?auto_7182 ) ( PERSON-AT ?auto_7179 ?auto_7184 ) ( not ( = ?auto_7176 ?auto_7184 ) ) ( not ( = ?auto_7186 ?auto_7182 ) ) ( PERSON-AT ?auto_7177 ?auto_7185 ) ( not ( = ?auto_7176 ?auto_7185 ) ) ( PERSON-AT ?auto_7180 ?auto_7181 ) ( not ( = ?auto_7176 ?auto_7181 ) ) ( PERSON-AT ?auto_7178 ?auto_7181 ) ( AIRCRAFT-AT ?auto_7183 ?auto_7176 ) ( FUEL-LEVEL ?auto_7183 ?auto_7186 ) ( not ( = ?auto_7178 ?auto_7180 ) ) ( not ( = ?auto_7178 ?auto_7177 ) ) ( not ( = ?auto_7180 ?auto_7177 ) ) ( not ( = ?auto_7185 ?auto_7181 ) ) ( not ( = ?auto_7178 ?auto_7179 ) ) ( not ( = ?auto_7180 ?auto_7179 ) ) ( not ( = ?auto_7177 ?auto_7179 ) ) ( not ( = ?auto_7184 ?auto_7185 ) ) ( not ( = ?auto_7184 ?auto_7181 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_7178 ?auto_7180 ?auto_7179 ?auto_7177 ?auto_7176 )
      ( FLY-4PPL-VERIFY ?auto_7177 ?auto_7178 ?auto_7179 ?auto_7180 ?auto_7176 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_7212 - PERSON
      ?auto_7213 - PERSON
      ?auto_7214 - PERSON
      ?auto_7215 - PERSON
      ?auto_7211 - CITY
    )
    :vars
    (
      ?auto_7221 - FLEVEL
      ?auto_7217 - FLEVEL
      ?auto_7219 - CITY
      ?auto_7220 - CITY
      ?auto_7216 - CITY
      ?auto_7218 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_7221 ?auto_7217 ) ( PERSON-AT ?auto_7215 ?auto_7219 ) ( not ( = ?auto_7211 ?auto_7219 ) ) ( not ( = ?auto_7221 ?auto_7217 ) ) ( PERSON-AT ?auto_7212 ?auto_7220 ) ( not ( = ?auto_7211 ?auto_7220 ) ) ( PERSON-AT ?auto_7213 ?auto_7216 ) ( not ( = ?auto_7211 ?auto_7216 ) ) ( PERSON-AT ?auto_7214 ?auto_7216 ) ( AIRCRAFT-AT ?auto_7218 ?auto_7211 ) ( FUEL-LEVEL ?auto_7218 ?auto_7221 ) ( not ( = ?auto_7214 ?auto_7213 ) ) ( not ( = ?auto_7214 ?auto_7212 ) ) ( not ( = ?auto_7213 ?auto_7212 ) ) ( not ( = ?auto_7220 ?auto_7216 ) ) ( not ( = ?auto_7214 ?auto_7215 ) ) ( not ( = ?auto_7213 ?auto_7215 ) ) ( not ( = ?auto_7212 ?auto_7215 ) ) ( not ( = ?auto_7219 ?auto_7220 ) ) ( not ( = ?auto_7219 ?auto_7216 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_7214 ?auto_7213 ?auto_7215 ?auto_7212 ?auto_7211 )
      ( FLY-4PPL-VERIFY ?auto_7212 ?auto_7213 ?auto_7214 ?auto_7215 ?auto_7211 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_7247 - PERSON
      ?auto_7248 - PERSON
      ?auto_7249 - PERSON
      ?auto_7250 - PERSON
      ?auto_7246 - CITY
    )
    :vars
    (
      ?auto_7256 - FLEVEL
      ?auto_7252 - FLEVEL
      ?auto_7254 - CITY
      ?auto_7255 - CITY
      ?auto_7251 - CITY
      ?auto_7253 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_7256 ?auto_7252 ) ( PERSON-AT ?auto_7249 ?auto_7254 ) ( not ( = ?auto_7246 ?auto_7254 ) ) ( not ( = ?auto_7256 ?auto_7252 ) ) ( PERSON-AT ?auto_7247 ?auto_7255 ) ( not ( = ?auto_7246 ?auto_7255 ) ) ( PERSON-AT ?auto_7248 ?auto_7251 ) ( not ( = ?auto_7246 ?auto_7251 ) ) ( PERSON-AT ?auto_7250 ?auto_7251 ) ( AIRCRAFT-AT ?auto_7253 ?auto_7246 ) ( FUEL-LEVEL ?auto_7253 ?auto_7256 ) ( not ( = ?auto_7250 ?auto_7248 ) ) ( not ( = ?auto_7250 ?auto_7247 ) ) ( not ( = ?auto_7248 ?auto_7247 ) ) ( not ( = ?auto_7255 ?auto_7251 ) ) ( not ( = ?auto_7250 ?auto_7249 ) ) ( not ( = ?auto_7248 ?auto_7249 ) ) ( not ( = ?auto_7247 ?auto_7249 ) ) ( not ( = ?auto_7254 ?auto_7255 ) ) ( not ( = ?auto_7254 ?auto_7251 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_7250 ?auto_7248 ?auto_7249 ?auto_7247 ?auto_7246 )
      ( FLY-4PPL-VERIFY ?auto_7247 ?auto_7248 ?auto_7249 ?auto_7250 ?auto_7246 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_7393 - PERSON
      ?auto_7394 - PERSON
      ?auto_7395 - PERSON
      ?auto_7396 - PERSON
      ?auto_7392 - CITY
    )
    :vars
    (
      ?auto_7402 - FLEVEL
      ?auto_7398 - FLEVEL
      ?auto_7400 - CITY
      ?auto_7401 - CITY
      ?auto_7397 - CITY
      ?auto_7399 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_7402 ?auto_7398 ) ( PERSON-AT ?auto_7394 ?auto_7400 ) ( not ( = ?auto_7392 ?auto_7400 ) ) ( not ( = ?auto_7402 ?auto_7398 ) ) ( PERSON-AT ?auto_7393 ?auto_7401 ) ( not ( = ?auto_7392 ?auto_7401 ) ) ( PERSON-AT ?auto_7396 ?auto_7397 ) ( not ( = ?auto_7392 ?auto_7397 ) ) ( PERSON-AT ?auto_7395 ?auto_7397 ) ( AIRCRAFT-AT ?auto_7399 ?auto_7392 ) ( FUEL-LEVEL ?auto_7399 ?auto_7402 ) ( not ( = ?auto_7395 ?auto_7396 ) ) ( not ( = ?auto_7395 ?auto_7393 ) ) ( not ( = ?auto_7396 ?auto_7393 ) ) ( not ( = ?auto_7401 ?auto_7397 ) ) ( not ( = ?auto_7395 ?auto_7394 ) ) ( not ( = ?auto_7396 ?auto_7394 ) ) ( not ( = ?auto_7393 ?auto_7394 ) ) ( not ( = ?auto_7400 ?auto_7401 ) ) ( not ( = ?auto_7400 ?auto_7397 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_7395 ?auto_7396 ?auto_7394 ?auto_7393 ?auto_7392 )
      ( FLY-4PPL-VERIFY ?auto_7393 ?auto_7394 ?auto_7395 ?auto_7396 ?auto_7392 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_7428 - PERSON
      ?auto_7429 - PERSON
      ?auto_7430 - PERSON
      ?auto_7431 - PERSON
      ?auto_7427 - CITY
    )
    :vars
    (
      ?auto_7437 - FLEVEL
      ?auto_7433 - FLEVEL
      ?auto_7435 - CITY
      ?auto_7436 - CITY
      ?auto_7432 - CITY
      ?auto_7434 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_7437 ?auto_7433 ) ( PERSON-AT ?auto_7429 ?auto_7435 ) ( not ( = ?auto_7427 ?auto_7435 ) ) ( not ( = ?auto_7437 ?auto_7433 ) ) ( PERSON-AT ?auto_7428 ?auto_7436 ) ( not ( = ?auto_7427 ?auto_7436 ) ) ( PERSON-AT ?auto_7430 ?auto_7432 ) ( not ( = ?auto_7427 ?auto_7432 ) ) ( PERSON-AT ?auto_7431 ?auto_7432 ) ( AIRCRAFT-AT ?auto_7434 ?auto_7427 ) ( FUEL-LEVEL ?auto_7434 ?auto_7437 ) ( not ( = ?auto_7431 ?auto_7430 ) ) ( not ( = ?auto_7431 ?auto_7428 ) ) ( not ( = ?auto_7430 ?auto_7428 ) ) ( not ( = ?auto_7436 ?auto_7432 ) ) ( not ( = ?auto_7431 ?auto_7429 ) ) ( not ( = ?auto_7430 ?auto_7429 ) ) ( not ( = ?auto_7428 ?auto_7429 ) ) ( not ( = ?auto_7435 ?auto_7436 ) ) ( not ( = ?auto_7435 ?auto_7432 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_7431 ?auto_7430 ?auto_7429 ?auto_7428 ?auto_7427 )
      ( FLY-4PPL-VERIFY ?auto_7428 ?auto_7429 ?auto_7430 ?auto_7431 ?auto_7427 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_7649 - PERSON
      ?auto_7650 - PERSON
      ?auto_7651 - PERSON
      ?auto_7652 - PERSON
      ?auto_7648 - CITY
    )
    :vars
    (
      ?auto_7658 - FLEVEL
      ?auto_7654 - FLEVEL
      ?auto_7656 - CITY
      ?auto_7657 - CITY
      ?auto_7653 - CITY
      ?auto_7655 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_7658 ?auto_7654 ) ( PERSON-AT ?auto_7649 ?auto_7656 ) ( not ( = ?auto_7648 ?auto_7656 ) ) ( not ( = ?auto_7658 ?auto_7654 ) ) ( PERSON-AT ?auto_7652 ?auto_7657 ) ( not ( = ?auto_7648 ?auto_7657 ) ) ( PERSON-AT ?auto_7651 ?auto_7653 ) ( not ( = ?auto_7648 ?auto_7653 ) ) ( PERSON-AT ?auto_7650 ?auto_7653 ) ( AIRCRAFT-AT ?auto_7655 ?auto_7648 ) ( FUEL-LEVEL ?auto_7655 ?auto_7658 ) ( not ( = ?auto_7650 ?auto_7651 ) ) ( not ( = ?auto_7650 ?auto_7652 ) ) ( not ( = ?auto_7651 ?auto_7652 ) ) ( not ( = ?auto_7657 ?auto_7653 ) ) ( not ( = ?auto_7650 ?auto_7649 ) ) ( not ( = ?auto_7651 ?auto_7649 ) ) ( not ( = ?auto_7652 ?auto_7649 ) ) ( not ( = ?auto_7656 ?auto_7657 ) ) ( not ( = ?auto_7656 ?auto_7653 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_7650 ?auto_7651 ?auto_7649 ?auto_7652 ?auto_7648 )
      ( FLY-4PPL-VERIFY ?auto_7649 ?auto_7650 ?auto_7651 ?auto_7652 ?auto_7648 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_7684 - PERSON
      ?auto_7685 - PERSON
      ?auto_7686 - PERSON
      ?auto_7687 - PERSON
      ?auto_7683 - CITY
    )
    :vars
    (
      ?auto_7693 - FLEVEL
      ?auto_7689 - FLEVEL
      ?auto_7691 - CITY
      ?auto_7692 - CITY
      ?auto_7688 - CITY
      ?auto_7690 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_7693 ?auto_7689 ) ( PERSON-AT ?auto_7684 ?auto_7691 ) ( not ( = ?auto_7683 ?auto_7691 ) ) ( not ( = ?auto_7693 ?auto_7689 ) ) ( PERSON-AT ?auto_7686 ?auto_7692 ) ( not ( = ?auto_7683 ?auto_7692 ) ) ( PERSON-AT ?auto_7687 ?auto_7688 ) ( not ( = ?auto_7683 ?auto_7688 ) ) ( PERSON-AT ?auto_7685 ?auto_7688 ) ( AIRCRAFT-AT ?auto_7690 ?auto_7683 ) ( FUEL-LEVEL ?auto_7690 ?auto_7693 ) ( not ( = ?auto_7685 ?auto_7687 ) ) ( not ( = ?auto_7685 ?auto_7686 ) ) ( not ( = ?auto_7687 ?auto_7686 ) ) ( not ( = ?auto_7692 ?auto_7688 ) ) ( not ( = ?auto_7685 ?auto_7684 ) ) ( not ( = ?auto_7687 ?auto_7684 ) ) ( not ( = ?auto_7686 ?auto_7684 ) ) ( not ( = ?auto_7691 ?auto_7692 ) ) ( not ( = ?auto_7691 ?auto_7688 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_7685 ?auto_7687 ?auto_7684 ?auto_7686 ?auto_7683 )
      ( FLY-4PPL-VERIFY ?auto_7684 ?auto_7685 ?auto_7686 ?auto_7687 ?auto_7683 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_7793 - PERSON
      ?auto_7794 - PERSON
      ?auto_7795 - PERSON
      ?auto_7796 - PERSON
      ?auto_7792 - CITY
    )
    :vars
    (
      ?auto_7802 - FLEVEL
      ?auto_7798 - FLEVEL
      ?auto_7800 - CITY
      ?auto_7801 - CITY
      ?auto_7797 - CITY
      ?auto_7799 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_7802 ?auto_7798 ) ( PERSON-AT ?auto_7793 ?auto_7800 ) ( not ( = ?auto_7792 ?auto_7800 ) ) ( not ( = ?auto_7802 ?auto_7798 ) ) ( PERSON-AT ?auto_7796 ?auto_7801 ) ( not ( = ?auto_7792 ?auto_7801 ) ) ( PERSON-AT ?auto_7794 ?auto_7797 ) ( not ( = ?auto_7792 ?auto_7797 ) ) ( PERSON-AT ?auto_7795 ?auto_7797 ) ( AIRCRAFT-AT ?auto_7799 ?auto_7792 ) ( FUEL-LEVEL ?auto_7799 ?auto_7802 ) ( not ( = ?auto_7795 ?auto_7794 ) ) ( not ( = ?auto_7795 ?auto_7796 ) ) ( not ( = ?auto_7794 ?auto_7796 ) ) ( not ( = ?auto_7801 ?auto_7797 ) ) ( not ( = ?auto_7795 ?auto_7793 ) ) ( not ( = ?auto_7794 ?auto_7793 ) ) ( not ( = ?auto_7796 ?auto_7793 ) ) ( not ( = ?auto_7800 ?auto_7801 ) ) ( not ( = ?auto_7800 ?auto_7797 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_7795 ?auto_7794 ?auto_7793 ?auto_7796 ?auto_7792 )
      ( FLY-4PPL-VERIFY ?auto_7793 ?auto_7794 ?auto_7795 ?auto_7796 ?auto_7792 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_7866 - PERSON
      ?auto_7867 - PERSON
      ?auto_7868 - PERSON
      ?auto_7869 - PERSON
      ?auto_7865 - CITY
    )
    :vars
    (
      ?auto_7875 - FLEVEL
      ?auto_7871 - FLEVEL
      ?auto_7873 - CITY
      ?auto_7874 - CITY
      ?auto_7870 - CITY
      ?auto_7872 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_7875 ?auto_7871 ) ( PERSON-AT ?auto_7866 ?auto_7873 ) ( not ( = ?auto_7865 ?auto_7873 ) ) ( not ( = ?auto_7875 ?auto_7871 ) ) ( PERSON-AT ?auto_7868 ?auto_7874 ) ( not ( = ?auto_7865 ?auto_7874 ) ) ( PERSON-AT ?auto_7867 ?auto_7870 ) ( not ( = ?auto_7865 ?auto_7870 ) ) ( PERSON-AT ?auto_7869 ?auto_7870 ) ( AIRCRAFT-AT ?auto_7872 ?auto_7865 ) ( FUEL-LEVEL ?auto_7872 ?auto_7875 ) ( not ( = ?auto_7869 ?auto_7867 ) ) ( not ( = ?auto_7869 ?auto_7868 ) ) ( not ( = ?auto_7867 ?auto_7868 ) ) ( not ( = ?auto_7874 ?auto_7870 ) ) ( not ( = ?auto_7869 ?auto_7866 ) ) ( not ( = ?auto_7867 ?auto_7866 ) ) ( not ( = ?auto_7868 ?auto_7866 ) ) ( not ( = ?auto_7873 ?auto_7874 ) ) ( not ( = ?auto_7873 ?auto_7870 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_7869 ?auto_7867 ?auto_7866 ?auto_7868 ?auto_7865 )
      ( FLY-4PPL-VERIFY ?auto_7866 ?auto_7867 ?auto_7868 ?auto_7869 ?auto_7865 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_7975 - PERSON
      ?auto_7976 - PERSON
      ?auto_7977 - PERSON
      ?auto_7978 - PERSON
      ?auto_7974 - CITY
    )
    :vars
    (
      ?auto_7984 - FLEVEL
      ?auto_7980 - FLEVEL
      ?auto_7982 - CITY
      ?auto_7983 - CITY
      ?auto_7979 - CITY
      ?auto_7981 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_7984 ?auto_7980 ) ( PERSON-AT ?auto_7975 ?auto_7982 ) ( not ( = ?auto_7974 ?auto_7982 ) ) ( not ( = ?auto_7984 ?auto_7980 ) ) ( PERSON-AT ?auto_7976 ?auto_7983 ) ( not ( = ?auto_7974 ?auto_7983 ) ) ( PERSON-AT ?auto_7978 ?auto_7979 ) ( not ( = ?auto_7974 ?auto_7979 ) ) ( PERSON-AT ?auto_7977 ?auto_7979 ) ( AIRCRAFT-AT ?auto_7981 ?auto_7974 ) ( FUEL-LEVEL ?auto_7981 ?auto_7984 ) ( not ( = ?auto_7977 ?auto_7978 ) ) ( not ( = ?auto_7977 ?auto_7976 ) ) ( not ( = ?auto_7978 ?auto_7976 ) ) ( not ( = ?auto_7983 ?auto_7979 ) ) ( not ( = ?auto_7977 ?auto_7975 ) ) ( not ( = ?auto_7978 ?auto_7975 ) ) ( not ( = ?auto_7976 ?auto_7975 ) ) ( not ( = ?auto_7982 ?auto_7983 ) ) ( not ( = ?auto_7982 ?auto_7979 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_7977 ?auto_7978 ?auto_7975 ?auto_7976 ?auto_7974 )
      ( FLY-4PPL-VERIFY ?auto_7975 ?auto_7976 ?auto_7977 ?auto_7978 ?auto_7974 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_8010 - PERSON
      ?auto_8011 - PERSON
      ?auto_8012 - PERSON
      ?auto_8013 - PERSON
      ?auto_8009 - CITY
    )
    :vars
    (
      ?auto_8019 - FLEVEL
      ?auto_8015 - FLEVEL
      ?auto_8017 - CITY
      ?auto_8018 - CITY
      ?auto_8014 - CITY
      ?auto_8016 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_8019 ?auto_8015 ) ( PERSON-AT ?auto_8010 ?auto_8017 ) ( not ( = ?auto_8009 ?auto_8017 ) ) ( not ( = ?auto_8019 ?auto_8015 ) ) ( PERSON-AT ?auto_8011 ?auto_8018 ) ( not ( = ?auto_8009 ?auto_8018 ) ) ( PERSON-AT ?auto_8012 ?auto_8014 ) ( not ( = ?auto_8009 ?auto_8014 ) ) ( PERSON-AT ?auto_8013 ?auto_8014 ) ( AIRCRAFT-AT ?auto_8016 ?auto_8009 ) ( FUEL-LEVEL ?auto_8016 ?auto_8019 ) ( not ( = ?auto_8013 ?auto_8012 ) ) ( not ( = ?auto_8013 ?auto_8011 ) ) ( not ( = ?auto_8012 ?auto_8011 ) ) ( not ( = ?auto_8018 ?auto_8014 ) ) ( not ( = ?auto_8013 ?auto_8010 ) ) ( not ( = ?auto_8012 ?auto_8010 ) ) ( not ( = ?auto_8011 ?auto_8010 ) ) ( not ( = ?auto_8017 ?auto_8018 ) ) ( not ( = ?auto_8017 ?auto_8014 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_8013 ?auto_8012 ?auto_8010 ?auto_8011 ?auto_8009 )
      ( FLY-4PPL-VERIFY ?auto_8010 ?auto_8011 ?auto_8012 ?auto_8013 ?auto_8009 ) )
  )

)

