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
      ?auto_15200 - PERSON
      ?auto_15199 - CITY
    )
    :vars
    (
      ?auto_15203 - FLEVEL
      ?auto_15202 - FLEVEL
      ?auto_15204 - CITY
      ?auto_15201 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_15203 ?auto_15202 ) ( PERSON-AT ?auto_15200 ?auto_15204 ) ( AIRCRAFT-AT ?auto_15201 ?auto_15199 ) ( FUEL-LEVEL ?auto_15201 ?auto_15203 ) ( not ( = ?auto_15199 ?auto_15204 ) ) ( not ( = ?auto_15203 ?auto_15202 ) ) )
    :subtasks
    ( ( !REFUEL ?auto_15201 ?auto_15199 ?auto_15203 ?auto_15202 )
      ( !FLY ?auto_15201 ?auto_15199 ?auto_15204 ?auto_15202 ?auto_15203 )
      ( !REFUEL ?auto_15201 ?auto_15204 ?auto_15203 ?auto_15202 )
      ( !BOARD ?auto_15200 ?auto_15201 ?auto_15204 )
      ( !FLY ?auto_15201 ?auto_15204 ?auto_15199 ?auto_15202 ?auto_15203 )
      ( !DEBARK ?auto_15200 ?auto_15201 ?auto_15199 )
      ( FLY-1PPL-VERIFY ?auto_15200 ?auto_15199 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_15208 - PERSON
      ?auto_15207 - CITY
    )
    :vars
    (
      ?auto_15211 - FLEVEL
      ?auto_15210 - FLEVEL
      ?auto_15212 - CITY
      ?auto_15209 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_15211 ?auto_15210 ) ( PERSON-AT ?auto_15208 ?auto_15212 ) ( AIRCRAFT-AT ?auto_15209 ?auto_15207 ) ( FUEL-LEVEL ?auto_15209 ?auto_15211 ) ( not ( = ?auto_15207 ?auto_15212 ) ) ( not ( = ?auto_15211 ?auto_15210 ) ) )
    :subtasks
    ( ( !REFUEL ?auto_15209 ?auto_15207 ?auto_15211 ?auto_15210 )
      ( !FLY ?auto_15209 ?auto_15207 ?auto_15212 ?auto_15210 ?auto_15211 )
      ( !REFUEL ?auto_15209 ?auto_15212 ?auto_15211 ?auto_15210 )
      ( !BOARD ?auto_15208 ?auto_15209 ?auto_15212 )
      ( !FLY ?auto_15209 ?auto_15212 ?auto_15207 ?auto_15210 ?auto_15211 )
      ( !DEBARK ?auto_15208 ?auto_15209 ?auto_15207 )
      ( FLY-1PPL-VERIFY ?auto_15208 ?auto_15207 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_15223 - PERSON
      ?auto_15224 - PERSON
      ?auto_15222 - CITY
    )
    :vars
    (
      ?auto_15227 - FLEVEL
      ?auto_15225 - FLEVEL
      ?auto_15226 - CITY
      ?auto_15228 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_15227 ?auto_15225 ) ( PERSON-AT ?auto_15224 ?auto_15226 ) ( not ( = ?auto_15222 ?auto_15226 ) ) ( not ( = ?auto_15227 ?auto_15225 ) ) ( PERSON-AT ?auto_15223 ?auto_15226 ) ( AIRCRAFT-AT ?auto_15228 ?auto_15222 ) ( FUEL-LEVEL ?auto_15228 ?auto_15227 ) ( not ( = ?auto_15223 ?auto_15224 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_15223 ?auto_15222 )
      ( FLY-1PPL ?auto_15224 ?auto_15222 )
      ( FLY-2PPL-VERIFY ?auto_15223 ?auto_15224 ?auto_15222 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_15230 - PERSON
      ?auto_15231 - PERSON
      ?auto_15229 - CITY
    )
    :vars
    (
      ?auto_15234 - FLEVEL
      ?auto_15235 - FLEVEL
      ?auto_15233 - CITY
      ?auto_15232 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_15234 ?auto_15235 ) ( PERSON-AT ?auto_15230 ?auto_15233 ) ( not ( = ?auto_15229 ?auto_15233 ) ) ( not ( = ?auto_15234 ?auto_15235 ) ) ( PERSON-AT ?auto_15231 ?auto_15233 ) ( AIRCRAFT-AT ?auto_15232 ?auto_15229 ) ( FUEL-LEVEL ?auto_15232 ?auto_15234 ) ( not ( = ?auto_15231 ?auto_15230 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_15231 ?auto_15230 ?auto_15229 )
      ( FLY-2PPL-VERIFY ?auto_15230 ?auto_15231 ?auto_15229 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_15247 - PERSON
      ?auto_15246 - CITY
    )
    :vars
    (
      ?auto_15250 - FLEVEL
      ?auto_15249 - FLEVEL
      ?auto_15251 - CITY
      ?auto_15248 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_15250 ?auto_15249 ) ( PERSON-AT ?auto_15247 ?auto_15251 ) ( AIRCRAFT-AT ?auto_15248 ?auto_15246 ) ( FUEL-LEVEL ?auto_15248 ?auto_15250 ) ( not ( = ?auto_15246 ?auto_15251 ) ) ( not ( = ?auto_15250 ?auto_15249 ) ) )
    :subtasks
    ( ( !REFUEL ?auto_15248 ?auto_15246 ?auto_15250 ?auto_15249 )
      ( !FLY ?auto_15248 ?auto_15246 ?auto_15251 ?auto_15249 ?auto_15250 )
      ( !REFUEL ?auto_15248 ?auto_15251 ?auto_15250 ?auto_15249 )
      ( !BOARD ?auto_15247 ?auto_15248 ?auto_15251 )
      ( !FLY ?auto_15248 ?auto_15251 ?auto_15246 ?auto_15249 ?auto_15250 )
      ( !DEBARK ?auto_15247 ?auto_15248 ?auto_15246 )
      ( FLY-1PPL-VERIFY ?auto_15247 ?auto_15246 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_15339 - PERSON
      ?auto_15340 - PERSON
      ?auto_15341 - PERSON
      ?auto_15338 - CITY
    )
    :vars
    (
      ?auto_15342 - FLEVEL
      ?auto_15345 - FLEVEL
      ?auto_15343 - CITY
      ?auto_15346 - CITY
      ?auto_15344 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_15342 ?auto_15345 ) ( PERSON-AT ?auto_15341 ?auto_15343 ) ( not ( = ?auto_15338 ?auto_15343 ) ) ( not ( = ?auto_15342 ?auto_15345 ) ) ( PERSON-AT ?auto_15340 ?auto_15346 ) ( not ( = ?auto_15338 ?auto_15346 ) ) ( PERSON-AT ?auto_15339 ?auto_15346 ) ( AIRCRAFT-AT ?auto_15344 ?auto_15338 ) ( FUEL-LEVEL ?auto_15344 ?auto_15342 ) ( not ( = ?auto_15339 ?auto_15340 ) ) ( not ( = ?auto_15339 ?auto_15341 ) ) ( not ( = ?auto_15340 ?auto_15341 ) ) ( not ( = ?auto_15343 ?auto_15346 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_15340 ?auto_15339 ?auto_15338 )
      ( FLY-1PPL ?auto_15341 ?auto_15338 )
      ( FLY-3PPL-VERIFY ?auto_15339 ?auto_15340 ?auto_15341 ?auto_15338 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_15358 - PERSON
      ?auto_15359 - PERSON
      ?auto_15360 - PERSON
      ?auto_15357 - CITY
    )
    :vars
    (
      ?auto_15361 - FLEVEL
      ?auto_15365 - FLEVEL
      ?auto_15363 - CITY
      ?auto_15364 - CITY
      ?auto_15362 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_15361 ?auto_15365 ) ( PERSON-AT ?auto_15359 ?auto_15363 ) ( not ( = ?auto_15357 ?auto_15363 ) ) ( not ( = ?auto_15361 ?auto_15365 ) ) ( PERSON-AT ?auto_15360 ?auto_15364 ) ( not ( = ?auto_15357 ?auto_15364 ) ) ( PERSON-AT ?auto_15358 ?auto_15364 ) ( AIRCRAFT-AT ?auto_15362 ?auto_15357 ) ( FUEL-LEVEL ?auto_15362 ?auto_15361 ) ( not ( = ?auto_15358 ?auto_15360 ) ) ( not ( = ?auto_15358 ?auto_15359 ) ) ( not ( = ?auto_15360 ?auto_15359 ) ) ( not ( = ?auto_15363 ?auto_15364 ) ) )
    :subtasks
    ( ( FLY-3PPL ?auto_15358 ?auto_15360 ?auto_15359 ?auto_15357 )
      ( FLY-3PPL-VERIFY ?auto_15358 ?auto_15359 ?auto_15360 ?auto_15357 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_15377 - PERSON
      ?auto_15378 - PERSON
      ?auto_15379 - PERSON
      ?auto_15376 - CITY
    )
    :vars
    (
      ?auto_15384 - FLEVEL
      ?auto_15381 - FLEVEL
      ?auto_15383 - CITY
      ?auto_15382 - CITY
      ?auto_15380 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_15384 ?auto_15381 ) ( PERSON-AT ?auto_15379 ?auto_15383 ) ( not ( = ?auto_15376 ?auto_15383 ) ) ( not ( = ?auto_15384 ?auto_15381 ) ) ( PERSON-AT ?auto_15377 ?auto_15382 ) ( not ( = ?auto_15376 ?auto_15382 ) ) ( PERSON-AT ?auto_15378 ?auto_15382 ) ( AIRCRAFT-AT ?auto_15380 ?auto_15376 ) ( FUEL-LEVEL ?auto_15380 ?auto_15384 ) ( not ( = ?auto_15378 ?auto_15377 ) ) ( not ( = ?auto_15378 ?auto_15379 ) ) ( not ( = ?auto_15377 ?auto_15379 ) ) ( not ( = ?auto_15383 ?auto_15382 ) ) )
    :subtasks
    ( ( FLY-3PPL ?auto_15378 ?auto_15379 ?auto_15377 ?auto_15376 )
      ( FLY-3PPL-VERIFY ?auto_15377 ?auto_15378 ?auto_15379 ?auto_15376 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_15396 - PERSON
      ?auto_15397 - PERSON
      ?auto_15398 - PERSON
      ?auto_15395 - CITY
    )
    :vars
    (
      ?auto_15403 - FLEVEL
      ?auto_15400 - FLEVEL
      ?auto_15402 - CITY
      ?auto_15401 - CITY
      ?auto_15399 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_15403 ?auto_15400 ) ( PERSON-AT ?auto_15397 ?auto_15402 ) ( not ( = ?auto_15395 ?auto_15402 ) ) ( not ( = ?auto_15403 ?auto_15400 ) ) ( PERSON-AT ?auto_15396 ?auto_15401 ) ( not ( = ?auto_15395 ?auto_15401 ) ) ( PERSON-AT ?auto_15398 ?auto_15401 ) ( AIRCRAFT-AT ?auto_15399 ?auto_15395 ) ( FUEL-LEVEL ?auto_15399 ?auto_15403 ) ( not ( = ?auto_15398 ?auto_15396 ) ) ( not ( = ?auto_15398 ?auto_15397 ) ) ( not ( = ?auto_15396 ?auto_15397 ) ) ( not ( = ?auto_15402 ?auto_15401 ) ) )
    :subtasks
    ( ( FLY-3PPL ?auto_15398 ?auto_15397 ?auto_15396 ?auto_15395 )
      ( FLY-3PPL-VERIFY ?auto_15396 ?auto_15397 ?auto_15398 ?auto_15395 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_15435 - PERSON
      ?auto_15436 - PERSON
      ?auto_15437 - PERSON
      ?auto_15434 - CITY
    )
    :vars
    (
      ?auto_15442 - FLEVEL
      ?auto_15439 - FLEVEL
      ?auto_15441 - CITY
      ?auto_15440 - CITY
      ?auto_15438 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_15442 ?auto_15439 ) ( PERSON-AT ?auto_15435 ?auto_15441 ) ( not ( = ?auto_15434 ?auto_15441 ) ) ( not ( = ?auto_15442 ?auto_15439 ) ) ( PERSON-AT ?auto_15437 ?auto_15440 ) ( not ( = ?auto_15434 ?auto_15440 ) ) ( PERSON-AT ?auto_15436 ?auto_15440 ) ( AIRCRAFT-AT ?auto_15438 ?auto_15434 ) ( FUEL-LEVEL ?auto_15438 ?auto_15442 ) ( not ( = ?auto_15436 ?auto_15437 ) ) ( not ( = ?auto_15436 ?auto_15435 ) ) ( not ( = ?auto_15437 ?auto_15435 ) ) ( not ( = ?auto_15441 ?auto_15440 ) ) )
    :subtasks
    ( ( FLY-3PPL ?auto_15436 ?auto_15435 ?auto_15437 ?auto_15434 )
      ( FLY-3PPL-VERIFY ?auto_15435 ?auto_15436 ?auto_15437 ?auto_15434 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_15454 - PERSON
      ?auto_15455 - PERSON
      ?auto_15456 - PERSON
      ?auto_15453 - CITY
    )
    :vars
    (
      ?auto_15461 - FLEVEL
      ?auto_15458 - FLEVEL
      ?auto_15460 - CITY
      ?auto_15459 - CITY
      ?auto_15457 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_15461 ?auto_15458 ) ( PERSON-AT ?auto_15454 ?auto_15460 ) ( not ( = ?auto_15453 ?auto_15460 ) ) ( not ( = ?auto_15461 ?auto_15458 ) ) ( PERSON-AT ?auto_15455 ?auto_15459 ) ( not ( = ?auto_15453 ?auto_15459 ) ) ( PERSON-AT ?auto_15456 ?auto_15459 ) ( AIRCRAFT-AT ?auto_15457 ?auto_15453 ) ( FUEL-LEVEL ?auto_15457 ?auto_15461 ) ( not ( = ?auto_15456 ?auto_15455 ) ) ( not ( = ?auto_15456 ?auto_15454 ) ) ( not ( = ?auto_15455 ?auto_15454 ) ) ( not ( = ?auto_15460 ?auto_15459 ) ) )
    :subtasks
    ( ( FLY-3PPL ?auto_15456 ?auto_15454 ?auto_15455 ?auto_15453 )
      ( FLY-3PPL-VERIFY ?auto_15454 ?auto_15455 ?auto_15456 ?auto_15453 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_15516 - PERSON
      ?auto_15515 - CITY
    )
    :vars
    (
      ?auto_15519 - FLEVEL
      ?auto_15518 - FLEVEL
      ?auto_15520 - CITY
      ?auto_15517 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_15519 ?auto_15518 ) ( PERSON-AT ?auto_15516 ?auto_15520 ) ( AIRCRAFT-AT ?auto_15517 ?auto_15515 ) ( FUEL-LEVEL ?auto_15517 ?auto_15519 ) ( not ( = ?auto_15515 ?auto_15520 ) ) ( not ( = ?auto_15519 ?auto_15518 ) ) )
    :subtasks
    ( ( !REFUEL ?auto_15517 ?auto_15515 ?auto_15519 ?auto_15518 )
      ( !FLY ?auto_15517 ?auto_15515 ?auto_15520 ?auto_15518 ?auto_15519 )
      ( !REFUEL ?auto_15517 ?auto_15520 ?auto_15519 ?auto_15518 )
      ( !BOARD ?auto_15516 ?auto_15517 ?auto_15520 )
      ( !FLY ?auto_15517 ?auto_15520 ?auto_15515 ?auto_15518 ?auto_15519 )
      ( !DEBARK ?auto_15516 ?auto_15517 ?auto_15515 )
      ( FLY-1PPL-VERIFY ?auto_15516 ?auto_15515 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_16499 - PERSON
      ?auto_16500 - PERSON
      ?auto_16501 - PERSON
      ?auto_16502 - PERSON
      ?auto_16498 - CITY
    )
    :vars
    (
      ?auto_16503 - FLEVEL
      ?auto_16505 - FLEVEL
      ?auto_16506 - CITY
      ?auto_16507 - CITY
      ?auto_16504 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_16503 ?auto_16505 ) ( PERSON-AT ?auto_16502 ?auto_16506 ) ( not ( = ?auto_16498 ?auto_16506 ) ) ( not ( = ?auto_16503 ?auto_16505 ) ) ( PERSON-AT ?auto_16501 ?auto_16507 ) ( not ( = ?auto_16498 ?auto_16507 ) ) ( PERSON-AT ?auto_16500 ?auto_16506 ) ( PERSON-AT ?auto_16499 ?auto_16506 ) ( AIRCRAFT-AT ?auto_16504 ?auto_16498 ) ( FUEL-LEVEL ?auto_16504 ?auto_16503 ) ( not ( = ?auto_16499 ?auto_16500 ) ) ( not ( = ?auto_16499 ?auto_16501 ) ) ( not ( = ?auto_16500 ?auto_16501 ) ) ( not ( = ?auto_16507 ?auto_16506 ) ) ( not ( = ?auto_16499 ?auto_16502 ) ) ( not ( = ?auto_16500 ?auto_16502 ) ) ( not ( = ?auto_16501 ?auto_16502 ) ) )
    :subtasks
    ( ( FLY-3PPL ?auto_16499 ?auto_16501 ?auto_16500 ?auto_16498 )
      ( FLY-1PPL ?auto_16502 ?auto_16498 )
      ( FLY-4PPL-VERIFY ?auto_16499 ?auto_16500 ?auto_16501 ?auto_16502 ?auto_16498 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_16531 - PERSON
      ?auto_16532 - PERSON
      ?auto_16533 - PERSON
      ?auto_16534 - PERSON
      ?auto_16530 - CITY
    )
    :vars
    (
      ?auto_16535 - FLEVEL
      ?auto_16536 - FLEVEL
      ?auto_16538 - CITY
      ?auto_16537 - CITY
      ?auto_16539 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_16535 ?auto_16536 ) ( PERSON-AT ?auto_16533 ?auto_16538 ) ( not ( = ?auto_16530 ?auto_16538 ) ) ( not ( = ?auto_16535 ?auto_16536 ) ) ( PERSON-AT ?auto_16534 ?auto_16537 ) ( not ( = ?auto_16530 ?auto_16537 ) ) ( PERSON-AT ?auto_16532 ?auto_16538 ) ( PERSON-AT ?auto_16531 ?auto_16538 ) ( AIRCRAFT-AT ?auto_16539 ?auto_16530 ) ( FUEL-LEVEL ?auto_16539 ?auto_16535 ) ( not ( = ?auto_16531 ?auto_16532 ) ) ( not ( = ?auto_16531 ?auto_16534 ) ) ( not ( = ?auto_16532 ?auto_16534 ) ) ( not ( = ?auto_16537 ?auto_16538 ) ) ( not ( = ?auto_16531 ?auto_16533 ) ) ( not ( = ?auto_16532 ?auto_16533 ) ) ( not ( = ?auto_16534 ?auto_16533 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_16531 ?auto_16532 ?auto_16534 ?auto_16533 ?auto_16530 )
      ( FLY-4PPL-VERIFY ?auto_16531 ?auto_16532 ?auto_16533 ?auto_16534 ?auto_16530 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_16563 - PERSON
      ?auto_16564 - PERSON
      ?auto_16565 - PERSON
      ?auto_16566 - PERSON
      ?auto_16562 - CITY
    )
    :vars
    (
      ?auto_16567 - FLEVEL
      ?auto_16571 - FLEVEL
      ?auto_16568 - CITY
      ?auto_16570 - CITY
      ?auto_16569 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_16567 ?auto_16571 ) ( PERSON-AT ?auto_16566 ?auto_16568 ) ( not ( = ?auto_16562 ?auto_16568 ) ) ( not ( = ?auto_16567 ?auto_16571 ) ) ( PERSON-AT ?auto_16564 ?auto_16570 ) ( not ( = ?auto_16562 ?auto_16570 ) ) ( PERSON-AT ?auto_16565 ?auto_16568 ) ( PERSON-AT ?auto_16563 ?auto_16568 ) ( AIRCRAFT-AT ?auto_16569 ?auto_16562 ) ( FUEL-LEVEL ?auto_16569 ?auto_16567 ) ( not ( = ?auto_16563 ?auto_16565 ) ) ( not ( = ?auto_16563 ?auto_16564 ) ) ( not ( = ?auto_16565 ?auto_16564 ) ) ( not ( = ?auto_16570 ?auto_16568 ) ) ( not ( = ?auto_16563 ?auto_16566 ) ) ( not ( = ?auto_16565 ?auto_16566 ) ) ( not ( = ?auto_16564 ?auto_16566 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_16563 ?auto_16565 ?auto_16566 ?auto_16564 ?auto_16562 )
      ( FLY-4PPL-VERIFY ?auto_16563 ?auto_16564 ?auto_16565 ?auto_16566 ?auto_16562 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_16595 - PERSON
      ?auto_16596 - PERSON
      ?auto_16597 - PERSON
      ?auto_16598 - PERSON
      ?auto_16594 - CITY
    )
    :vars
    (
      ?auto_16599 - FLEVEL
      ?auto_16603 - FLEVEL
      ?auto_16600 - CITY
      ?auto_16602 - CITY
      ?auto_16601 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_16599 ?auto_16603 ) ( PERSON-AT ?auto_16597 ?auto_16600 ) ( not ( = ?auto_16594 ?auto_16600 ) ) ( not ( = ?auto_16599 ?auto_16603 ) ) ( PERSON-AT ?auto_16596 ?auto_16602 ) ( not ( = ?auto_16594 ?auto_16602 ) ) ( PERSON-AT ?auto_16598 ?auto_16600 ) ( PERSON-AT ?auto_16595 ?auto_16600 ) ( AIRCRAFT-AT ?auto_16601 ?auto_16594 ) ( FUEL-LEVEL ?auto_16601 ?auto_16599 ) ( not ( = ?auto_16595 ?auto_16598 ) ) ( not ( = ?auto_16595 ?auto_16596 ) ) ( not ( = ?auto_16598 ?auto_16596 ) ) ( not ( = ?auto_16602 ?auto_16600 ) ) ( not ( = ?auto_16595 ?auto_16597 ) ) ( not ( = ?auto_16598 ?auto_16597 ) ) ( not ( = ?auto_16596 ?auto_16597 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_16595 ?auto_16598 ?auto_16597 ?auto_16596 ?auto_16594 )
      ( FLY-4PPL-VERIFY ?auto_16595 ?auto_16596 ?auto_16597 ?auto_16598 ?auto_16594 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_16695 - PERSON
      ?auto_16696 - PERSON
      ?auto_16697 - PERSON
      ?auto_16698 - PERSON
      ?auto_16694 - CITY
    )
    :vars
    (
      ?auto_16699 - FLEVEL
      ?auto_16703 - FLEVEL
      ?auto_16700 - CITY
      ?auto_16702 - CITY
      ?auto_16701 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_16699 ?auto_16703 ) ( PERSON-AT ?auto_16696 ?auto_16700 ) ( not ( = ?auto_16694 ?auto_16700 ) ) ( not ( = ?auto_16699 ?auto_16703 ) ) ( PERSON-AT ?auto_16698 ?auto_16702 ) ( not ( = ?auto_16694 ?auto_16702 ) ) ( PERSON-AT ?auto_16697 ?auto_16700 ) ( PERSON-AT ?auto_16695 ?auto_16700 ) ( AIRCRAFT-AT ?auto_16701 ?auto_16694 ) ( FUEL-LEVEL ?auto_16701 ?auto_16699 ) ( not ( = ?auto_16695 ?auto_16697 ) ) ( not ( = ?auto_16695 ?auto_16698 ) ) ( not ( = ?auto_16697 ?auto_16698 ) ) ( not ( = ?auto_16702 ?auto_16700 ) ) ( not ( = ?auto_16695 ?auto_16696 ) ) ( not ( = ?auto_16697 ?auto_16696 ) ) ( not ( = ?auto_16698 ?auto_16696 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_16695 ?auto_16697 ?auto_16696 ?auto_16698 ?auto_16694 )
      ( FLY-4PPL-VERIFY ?auto_16695 ?auto_16696 ?auto_16697 ?auto_16698 ?auto_16694 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_16727 - PERSON
      ?auto_16728 - PERSON
      ?auto_16729 - PERSON
      ?auto_16730 - PERSON
      ?auto_16726 - CITY
    )
    :vars
    (
      ?auto_16731 - FLEVEL
      ?auto_16735 - FLEVEL
      ?auto_16732 - CITY
      ?auto_16734 - CITY
      ?auto_16733 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_16731 ?auto_16735 ) ( PERSON-AT ?auto_16728 ?auto_16732 ) ( not ( = ?auto_16726 ?auto_16732 ) ) ( not ( = ?auto_16731 ?auto_16735 ) ) ( PERSON-AT ?auto_16729 ?auto_16734 ) ( not ( = ?auto_16726 ?auto_16734 ) ) ( PERSON-AT ?auto_16730 ?auto_16732 ) ( PERSON-AT ?auto_16727 ?auto_16732 ) ( AIRCRAFT-AT ?auto_16733 ?auto_16726 ) ( FUEL-LEVEL ?auto_16733 ?auto_16731 ) ( not ( = ?auto_16727 ?auto_16730 ) ) ( not ( = ?auto_16727 ?auto_16729 ) ) ( not ( = ?auto_16730 ?auto_16729 ) ) ( not ( = ?auto_16734 ?auto_16732 ) ) ( not ( = ?auto_16727 ?auto_16728 ) ) ( not ( = ?auto_16730 ?auto_16728 ) ) ( not ( = ?auto_16729 ?auto_16728 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_16727 ?auto_16730 ?auto_16728 ?auto_16729 ?auto_16726 )
      ( FLY-4PPL-VERIFY ?auto_16727 ?auto_16728 ?auto_16729 ?auto_16730 ?auto_16726 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_16827 - PERSON
      ?auto_16828 - PERSON
      ?auto_16829 - PERSON
      ?auto_16830 - PERSON
      ?auto_16826 - CITY
    )
    :vars
    (
      ?auto_16831 - FLEVEL
      ?auto_16835 - FLEVEL
      ?auto_16832 - CITY
      ?auto_16834 - CITY
      ?auto_16833 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_16831 ?auto_16835 ) ( PERSON-AT ?auto_16830 ?auto_16832 ) ( not ( = ?auto_16826 ?auto_16832 ) ) ( not ( = ?auto_16831 ?auto_16835 ) ) ( PERSON-AT ?auto_16829 ?auto_16834 ) ( not ( = ?auto_16826 ?auto_16834 ) ) ( PERSON-AT ?auto_16827 ?auto_16832 ) ( PERSON-AT ?auto_16828 ?auto_16832 ) ( AIRCRAFT-AT ?auto_16833 ?auto_16826 ) ( FUEL-LEVEL ?auto_16833 ?auto_16831 ) ( not ( = ?auto_16828 ?auto_16827 ) ) ( not ( = ?auto_16828 ?auto_16829 ) ) ( not ( = ?auto_16827 ?auto_16829 ) ) ( not ( = ?auto_16834 ?auto_16832 ) ) ( not ( = ?auto_16828 ?auto_16830 ) ) ( not ( = ?auto_16827 ?auto_16830 ) ) ( not ( = ?auto_16829 ?auto_16830 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_16828 ?auto_16827 ?auto_16830 ?auto_16829 ?auto_16826 )
      ( FLY-4PPL-VERIFY ?auto_16827 ?auto_16828 ?auto_16829 ?auto_16830 ?auto_16826 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_16859 - PERSON
      ?auto_16860 - PERSON
      ?auto_16861 - PERSON
      ?auto_16862 - PERSON
      ?auto_16858 - CITY
    )
    :vars
    (
      ?auto_16863 - FLEVEL
      ?auto_16867 - FLEVEL
      ?auto_16864 - CITY
      ?auto_16866 - CITY
      ?auto_16865 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_16863 ?auto_16867 ) ( PERSON-AT ?auto_16861 ?auto_16864 ) ( not ( = ?auto_16858 ?auto_16864 ) ) ( not ( = ?auto_16863 ?auto_16867 ) ) ( PERSON-AT ?auto_16862 ?auto_16866 ) ( not ( = ?auto_16858 ?auto_16866 ) ) ( PERSON-AT ?auto_16859 ?auto_16864 ) ( PERSON-AT ?auto_16860 ?auto_16864 ) ( AIRCRAFT-AT ?auto_16865 ?auto_16858 ) ( FUEL-LEVEL ?auto_16865 ?auto_16863 ) ( not ( = ?auto_16860 ?auto_16859 ) ) ( not ( = ?auto_16860 ?auto_16862 ) ) ( not ( = ?auto_16859 ?auto_16862 ) ) ( not ( = ?auto_16866 ?auto_16864 ) ) ( not ( = ?auto_16860 ?auto_16861 ) ) ( not ( = ?auto_16859 ?auto_16861 ) ) ( not ( = ?auto_16862 ?auto_16861 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_16860 ?auto_16859 ?auto_16861 ?auto_16862 ?auto_16858 )
      ( FLY-4PPL-VERIFY ?auto_16859 ?auto_16860 ?auto_16861 ?auto_16862 ?auto_16858 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_16960 - PERSON
      ?auto_16961 - PERSON
      ?auto_16962 - PERSON
      ?auto_16963 - PERSON
      ?auto_16959 - CITY
    )
    :vars
    (
      ?auto_16964 - FLEVEL
      ?auto_16968 - FLEVEL
      ?auto_16965 - CITY
      ?auto_16967 - CITY
      ?auto_16966 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_16964 ?auto_16968 ) ( PERSON-AT ?auto_16963 ?auto_16965 ) ( not ( = ?auto_16959 ?auto_16965 ) ) ( not ( = ?auto_16964 ?auto_16968 ) ) ( PERSON-AT ?auto_16961 ?auto_16967 ) ( not ( = ?auto_16959 ?auto_16967 ) ) ( PERSON-AT ?auto_16960 ?auto_16965 ) ( PERSON-AT ?auto_16962 ?auto_16965 ) ( AIRCRAFT-AT ?auto_16966 ?auto_16959 ) ( FUEL-LEVEL ?auto_16966 ?auto_16964 ) ( not ( = ?auto_16962 ?auto_16960 ) ) ( not ( = ?auto_16962 ?auto_16961 ) ) ( not ( = ?auto_16960 ?auto_16961 ) ) ( not ( = ?auto_16967 ?auto_16965 ) ) ( not ( = ?auto_16962 ?auto_16963 ) ) ( not ( = ?auto_16960 ?auto_16963 ) ) ( not ( = ?auto_16961 ?auto_16963 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_16962 ?auto_16960 ?auto_16963 ?auto_16961 ?auto_16959 )
      ( FLY-4PPL-VERIFY ?auto_16960 ?auto_16961 ?auto_16962 ?auto_16963 ?auto_16959 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_16992 - PERSON
      ?auto_16993 - PERSON
      ?auto_16994 - PERSON
      ?auto_16995 - PERSON
      ?auto_16991 - CITY
    )
    :vars
    (
      ?auto_16996 - FLEVEL
      ?auto_17000 - FLEVEL
      ?auto_16997 - CITY
      ?auto_16999 - CITY
      ?auto_16998 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_16996 ?auto_17000 ) ( PERSON-AT ?auto_16994 ?auto_16997 ) ( not ( = ?auto_16991 ?auto_16997 ) ) ( not ( = ?auto_16996 ?auto_17000 ) ) ( PERSON-AT ?auto_16993 ?auto_16999 ) ( not ( = ?auto_16991 ?auto_16999 ) ) ( PERSON-AT ?auto_16992 ?auto_16997 ) ( PERSON-AT ?auto_16995 ?auto_16997 ) ( AIRCRAFT-AT ?auto_16998 ?auto_16991 ) ( FUEL-LEVEL ?auto_16998 ?auto_16996 ) ( not ( = ?auto_16995 ?auto_16992 ) ) ( not ( = ?auto_16995 ?auto_16993 ) ) ( not ( = ?auto_16992 ?auto_16993 ) ) ( not ( = ?auto_16999 ?auto_16997 ) ) ( not ( = ?auto_16995 ?auto_16994 ) ) ( not ( = ?auto_16992 ?auto_16994 ) ) ( not ( = ?auto_16993 ?auto_16994 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_16995 ?auto_16992 ?auto_16994 ?auto_16993 ?auto_16991 )
      ( FLY-4PPL-VERIFY ?auto_16992 ?auto_16993 ?auto_16994 ?auto_16995 ?auto_16991 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_17057 - PERSON
      ?auto_17058 - PERSON
      ?auto_17059 - PERSON
      ?auto_17060 - PERSON
      ?auto_17056 - CITY
    )
    :vars
    (
      ?auto_17061 - FLEVEL
      ?auto_17065 - FLEVEL
      ?auto_17062 - CITY
      ?auto_17064 - CITY
      ?auto_17063 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_17061 ?auto_17065 ) ( PERSON-AT ?auto_17058 ?auto_17062 ) ( not ( = ?auto_17056 ?auto_17062 ) ) ( not ( = ?auto_17061 ?auto_17065 ) ) ( PERSON-AT ?auto_17060 ?auto_17064 ) ( not ( = ?auto_17056 ?auto_17064 ) ) ( PERSON-AT ?auto_17057 ?auto_17062 ) ( PERSON-AT ?auto_17059 ?auto_17062 ) ( AIRCRAFT-AT ?auto_17063 ?auto_17056 ) ( FUEL-LEVEL ?auto_17063 ?auto_17061 ) ( not ( = ?auto_17059 ?auto_17057 ) ) ( not ( = ?auto_17059 ?auto_17060 ) ) ( not ( = ?auto_17057 ?auto_17060 ) ) ( not ( = ?auto_17064 ?auto_17062 ) ) ( not ( = ?auto_17059 ?auto_17058 ) ) ( not ( = ?auto_17057 ?auto_17058 ) ) ( not ( = ?auto_17060 ?auto_17058 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_17059 ?auto_17057 ?auto_17058 ?auto_17060 ?auto_17056 )
      ( FLY-4PPL-VERIFY ?auto_17057 ?auto_17058 ?auto_17059 ?auto_17060 ?auto_17056 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_17124 - PERSON
      ?auto_17125 - PERSON
      ?auto_17126 - PERSON
      ?auto_17127 - PERSON
      ?auto_17123 - CITY
    )
    :vars
    (
      ?auto_17128 - FLEVEL
      ?auto_17132 - FLEVEL
      ?auto_17129 - CITY
      ?auto_17131 - CITY
      ?auto_17130 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_17128 ?auto_17132 ) ( PERSON-AT ?auto_17125 ?auto_17129 ) ( not ( = ?auto_17123 ?auto_17129 ) ) ( not ( = ?auto_17128 ?auto_17132 ) ) ( PERSON-AT ?auto_17126 ?auto_17131 ) ( not ( = ?auto_17123 ?auto_17131 ) ) ( PERSON-AT ?auto_17124 ?auto_17129 ) ( PERSON-AT ?auto_17127 ?auto_17129 ) ( AIRCRAFT-AT ?auto_17130 ?auto_17123 ) ( FUEL-LEVEL ?auto_17130 ?auto_17128 ) ( not ( = ?auto_17127 ?auto_17124 ) ) ( not ( = ?auto_17127 ?auto_17126 ) ) ( not ( = ?auto_17124 ?auto_17126 ) ) ( not ( = ?auto_17131 ?auto_17129 ) ) ( not ( = ?auto_17127 ?auto_17125 ) ) ( not ( = ?auto_17124 ?auto_17125 ) ) ( not ( = ?auto_17126 ?auto_17125 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_17127 ?auto_17124 ?auto_17125 ?auto_17126 ?auto_17123 )
      ( FLY-4PPL-VERIFY ?auto_17124 ?auto_17125 ?auto_17126 ?auto_17127 ?auto_17123 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_17224 - PERSON
      ?auto_17225 - PERSON
      ?auto_17226 - PERSON
      ?auto_17227 - PERSON
      ?auto_17223 - CITY
    )
    :vars
    (
      ?auto_17228 - FLEVEL
      ?auto_17232 - FLEVEL
      ?auto_17229 - CITY
      ?auto_17231 - CITY
      ?auto_17230 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_17228 ?auto_17232 ) ( PERSON-AT ?auto_17227 ?auto_17229 ) ( not ( = ?auto_17223 ?auto_17229 ) ) ( not ( = ?auto_17228 ?auto_17232 ) ) ( PERSON-AT ?auto_17224 ?auto_17231 ) ( not ( = ?auto_17223 ?auto_17231 ) ) ( PERSON-AT ?auto_17226 ?auto_17229 ) ( PERSON-AT ?auto_17225 ?auto_17229 ) ( AIRCRAFT-AT ?auto_17230 ?auto_17223 ) ( FUEL-LEVEL ?auto_17230 ?auto_17228 ) ( not ( = ?auto_17225 ?auto_17226 ) ) ( not ( = ?auto_17225 ?auto_17224 ) ) ( not ( = ?auto_17226 ?auto_17224 ) ) ( not ( = ?auto_17231 ?auto_17229 ) ) ( not ( = ?auto_17225 ?auto_17227 ) ) ( not ( = ?auto_17226 ?auto_17227 ) ) ( not ( = ?auto_17224 ?auto_17227 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_17225 ?auto_17226 ?auto_17227 ?auto_17224 ?auto_17223 )
      ( FLY-4PPL-VERIFY ?auto_17224 ?auto_17225 ?auto_17226 ?auto_17227 ?auto_17223 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_17256 - PERSON
      ?auto_17257 - PERSON
      ?auto_17258 - PERSON
      ?auto_17259 - PERSON
      ?auto_17255 - CITY
    )
    :vars
    (
      ?auto_17260 - FLEVEL
      ?auto_17264 - FLEVEL
      ?auto_17261 - CITY
      ?auto_17263 - CITY
      ?auto_17262 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_17260 ?auto_17264 ) ( PERSON-AT ?auto_17258 ?auto_17261 ) ( not ( = ?auto_17255 ?auto_17261 ) ) ( not ( = ?auto_17260 ?auto_17264 ) ) ( PERSON-AT ?auto_17256 ?auto_17263 ) ( not ( = ?auto_17255 ?auto_17263 ) ) ( PERSON-AT ?auto_17259 ?auto_17261 ) ( PERSON-AT ?auto_17257 ?auto_17261 ) ( AIRCRAFT-AT ?auto_17262 ?auto_17255 ) ( FUEL-LEVEL ?auto_17262 ?auto_17260 ) ( not ( = ?auto_17257 ?auto_17259 ) ) ( not ( = ?auto_17257 ?auto_17256 ) ) ( not ( = ?auto_17259 ?auto_17256 ) ) ( not ( = ?auto_17263 ?auto_17261 ) ) ( not ( = ?auto_17257 ?auto_17258 ) ) ( not ( = ?auto_17259 ?auto_17258 ) ) ( not ( = ?auto_17256 ?auto_17258 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_17257 ?auto_17259 ?auto_17258 ?auto_17256 ?auto_17255 )
      ( FLY-4PPL-VERIFY ?auto_17256 ?auto_17257 ?auto_17258 ?auto_17259 ?auto_17255 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_17288 - PERSON
      ?auto_17289 - PERSON
      ?auto_17290 - PERSON
      ?auto_17291 - PERSON
      ?auto_17287 - CITY
    )
    :vars
    (
      ?auto_17292 - FLEVEL
      ?auto_17296 - FLEVEL
      ?auto_17293 - CITY
      ?auto_17295 - CITY
      ?auto_17294 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_17292 ?auto_17296 ) ( PERSON-AT ?auto_17291 ?auto_17293 ) ( not ( = ?auto_17287 ?auto_17293 ) ) ( not ( = ?auto_17292 ?auto_17296 ) ) ( PERSON-AT ?auto_17288 ?auto_17295 ) ( not ( = ?auto_17287 ?auto_17295 ) ) ( PERSON-AT ?auto_17289 ?auto_17293 ) ( PERSON-AT ?auto_17290 ?auto_17293 ) ( AIRCRAFT-AT ?auto_17294 ?auto_17287 ) ( FUEL-LEVEL ?auto_17294 ?auto_17292 ) ( not ( = ?auto_17290 ?auto_17289 ) ) ( not ( = ?auto_17290 ?auto_17288 ) ) ( not ( = ?auto_17289 ?auto_17288 ) ) ( not ( = ?auto_17295 ?auto_17293 ) ) ( not ( = ?auto_17290 ?auto_17291 ) ) ( not ( = ?auto_17289 ?auto_17291 ) ) ( not ( = ?auto_17288 ?auto_17291 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_17290 ?auto_17289 ?auto_17291 ?auto_17288 ?auto_17287 )
      ( FLY-4PPL-VERIFY ?auto_17288 ?auto_17289 ?auto_17290 ?auto_17291 ?auto_17287 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_17320 - PERSON
      ?auto_17321 - PERSON
      ?auto_17322 - PERSON
      ?auto_17323 - PERSON
      ?auto_17319 - CITY
    )
    :vars
    (
      ?auto_17324 - FLEVEL
      ?auto_17328 - FLEVEL
      ?auto_17325 - CITY
      ?auto_17327 - CITY
      ?auto_17326 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_17324 ?auto_17328 ) ( PERSON-AT ?auto_17322 ?auto_17325 ) ( not ( = ?auto_17319 ?auto_17325 ) ) ( not ( = ?auto_17324 ?auto_17328 ) ) ( PERSON-AT ?auto_17320 ?auto_17327 ) ( not ( = ?auto_17319 ?auto_17327 ) ) ( PERSON-AT ?auto_17321 ?auto_17325 ) ( PERSON-AT ?auto_17323 ?auto_17325 ) ( AIRCRAFT-AT ?auto_17326 ?auto_17319 ) ( FUEL-LEVEL ?auto_17326 ?auto_17324 ) ( not ( = ?auto_17323 ?auto_17321 ) ) ( not ( = ?auto_17323 ?auto_17320 ) ) ( not ( = ?auto_17321 ?auto_17320 ) ) ( not ( = ?auto_17327 ?auto_17325 ) ) ( not ( = ?auto_17323 ?auto_17322 ) ) ( not ( = ?auto_17321 ?auto_17322 ) ) ( not ( = ?auto_17320 ?auto_17322 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_17323 ?auto_17321 ?auto_17322 ?auto_17320 ?auto_17319 )
      ( FLY-4PPL-VERIFY ?auto_17320 ?auto_17321 ?auto_17322 ?auto_17323 ?auto_17319 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_17454 - PERSON
      ?auto_17455 - PERSON
      ?auto_17456 - PERSON
      ?auto_17457 - PERSON
      ?auto_17453 - CITY
    )
    :vars
    (
      ?auto_17458 - FLEVEL
      ?auto_17462 - FLEVEL
      ?auto_17459 - CITY
      ?auto_17461 - CITY
      ?auto_17460 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_17458 ?auto_17462 ) ( PERSON-AT ?auto_17455 ?auto_17459 ) ( not ( = ?auto_17453 ?auto_17459 ) ) ( not ( = ?auto_17458 ?auto_17462 ) ) ( PERSON-AT ?auto_17454 ?auto_17461 ) ( not ( = ?auto_17453 ?auto_17461 ) ) ( PERSON-AT ?auto_17457 ?auto_17459 ) ( PERSON-AT ?auto_17456 ?auto_17459 ) ( AIRCRAFT-AT ?auto_17460 ?auto_17453 ) ( FUEL-LEVEL ?auto_17460 ?auto_17458 ) ( not ( = ?auto_17456 ?auto_17457 ) ) ( not ( = ?auto_17456 ?auto_17454 ) ) ( not ( = ?auto_17457 ?auto_17454 ) ) ( not ( = ?auto_17461 ?auto_17459 ) ) ( not ( = ?auto_17456 ?auto_17455 ) ) ( not ( = ?auto_17457 ?auto_17455 ) ) ( not ( = ?auto_17454 ?auto_17455 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_17456 ?auto_17457 ?auto_17455 ?auto_17454 ?auto_17453 )
      ( FLY-4PPL-VERIFY ?auto_17454 ?auto_17455 ?auto_17456 ?auto_17457 ?auto_17453 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_17486 - PERSON
      ?auto_17487 - PERSON
      ?auto_17488 - PERSON
      ?auto_17489 - PERSON
      ?auto_17485 - CITY
    )
    :vars
    (
      ?auto_17490 - FLEVEL
      ?auto_17494 - FLEVEL
      ?auto_17491 - CITY
      ?auto_17493 - CITY
      ?auto_17492 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_17490 ?auto_17494 ) ( PERSON-AT ?auto_17487 ?auto_17491 ) ( not ( = ?auto_17485 ?auto_17491 ) ) ( not ( = ?auto_17490 ?auto_17494 ) ) ( PERSON-AT ?auto_17486 ?auto_17493 ) ( not ( = ?auto_17485 ?auto_17493 ) ) ( PERSON-AT ?auto_17488 ?auto_17491 ) ( PERSON-AT ?auto_17489 ?auto_17491 ) ( AIRCRAFT-AT ?auto_17492 ?auto_17485 ) ( FUEL-LEVEL ?auto_17492 ?auto_17490 ) ( not ( = ?auto_17489 ?auto_17488 ) ) ( not ( = ?auto_17489 ?auto_17486 ) ) ( not ( = ?auto_17488 ?auto_17486 ) ) ( not ( = ?auto_17493 ?auto_17491 ) ) ( not ( = ?auto_17489 ?auto_17487 ) ) ( not ( = ?auto_17488 ?auto_17487 ) ) ( not ( = ?auto_17486 ?auto_17487 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_17489 ?auto_17488 ?auto_17487 ?auto_17486 ?auto_17485 )
      ( FLY-4PPL-VERIFY ?auto_17486 ?auto_17487 ?auto_17488 ?auto_17489 ?auto_17485 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_17689 - PERSON
      ?auto_17690 - PERSON
      ?auto_17691 - PERSON
      ?auto_17692 - PERSON
      ?auto_17688 - CITY
    )
    :vars
    (
      ?auto_17693 - FLEVEL
      ?auto_17697 - FLEVEL
      ?auto_17694 - CITY
      ?auto_17696 - CITY
      ?auto_17695 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_17693 ?auto_17697 ) ( PERSON-AT ?auto_17689 ?auto_17694 ) ( not ( = ?auto_17688 ?auto_17694 ) ) ( not ( = ?auto_17693 ?auto_17697 ) ) ( PERSON-AT ?auto_17692 ?auto_17696 ) ( not ( = ?auto_17688 ?auto_17696 ) ) ( PERSON-AT ?auto_17691 ?auto_17694 ) ( PERSON-AT ?auto_17690 ?auto_17694 ) ( AIRCRAFT-AT ?auto_17695 ?auto_17688 ) ( FUEL-LEVEL ?auto_17695 ?auto_17693 ) ( not ( = ?auto_17690 ?auto_17691 ) ) ( not ( = ?auto_17690 ?auto_17692 ) ) ( not ( = ?auto_17691 ?auto_17692 ) ) ( not ( = ?auto_17696 ?auto_17694 ) ) ( not ( = ?auto_17690 ?auto_17689 ) ) ( not ( = ?auto_17691 ?auto_17689 ) ) ( not ( = ?auto_17692 ?auto_17689 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_17690 ?auto_17691 ?auto_17689 ?auto_17692 ?auto_17688 )
      ( FLY-4PPL-VERIFY ?auto_17689 ?auto_17690 ?auto_17691 ?auto_17692 ?auto_17688 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_17721 - PERSON
      ?auto_17722 - PERSON
      ?auto_17723 - PERSON
      ?auto_17724 - PERSON
      ?auto_17720 - CITY
    )
    :vars
    (
      ?auto_17725 - FLEVEL
      ?auto_17729 - FLEVEL
      ?auto_17726 - CITY
      ?auto_17728 - CITY
      ?auto_17727 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_17725 ?auto_17729 ) ( PERSON-AT ?auto_17721 ?auto_17726 ) ( not ( = ?auto_17720 ?auto_17726 ) ) ( not ( = ?auto_17725 ?auto_17729 ) ) ( PERSON-AT ?auto_17723 ?auto_17728 ) ( not ( = ?auto_17720 ?auto_17728 ) ) ( PERSON-AT ?auto_17724 ?auto_17726 ) ( PERSON-AT ?auto_17722 ?auto_17726 ) ( AIRCRAFT-AT ?auto_17727 ?auto_17720 ) ( FUEL-LEVEL ?auto_17727 ?auto_17725 ) ( not ( = ?auto_17722 ?auto_17724 ) ) ( not ( = ?auto_17722 ?auto_17723 ) ) ( not ( = ?auto_17724 ?auto_17723 ) ) ( not ( = ?auto_17728 ?auto_17726 ) ) ( not ( = ?auto_17722 ?auto_17721 ) ) ( not ( = ?auto_17724 ?auto_17721 ) ) ( not ( = ?auto_17723 ?auto_17721 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_17722 ?auto_17724 ?auto_17721 ?auto_17723 ?auto_17720 )
      ( FLY-4PPL-VERIFY ?auto_17721 ?auto_17722 ?auto_17723 ?auto_17724 ?auto_17720 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_17821 - PERSON
      ?auto_17822 - PERSON
      ?auto_17823 - PERSON
      ?auto_17824 - PERSON
      ?auto_17820 - CITY
    )
    :vars
    (
      ?auto_17825 - FLEVEL
      ?auto_17829 - FLEVEL
      ?auto_17826 - CITY
      ?auto_17828 - CITY
      ?auto_17827 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_17825 ?auto_17829 ) ( PERSON-AT ?auto_17821 ?auto_17826 ) ( not ( = ?auto_17820 ?auto_17826 ) ) ( not ( = ?auto_17825 ?auto_17829 ) ) ( PERSON-AT ?auto_17824 ?auto_17828 ) ( not ( = ?auto_17820 ?auto_17828 ) ) ( PERSON-AT ?auto_17822 ?auto_17826 ) ( PERSON-AT ?auto_17823 ?auto_17826 ) ( AIRCRAFT-AT ?auto_17827 ?auto_17820 ) ( FUEL-LEVEL ?auto_17827 ?auto_17825 ) ( not ( = ?auto_17823 ?auto_17822 ) ) ( not ( = ?auto_17823 ?auto_17824 ) ) ( not ( = ?auto_17822 ?auto_17824 ) ) ( not ( = ?auto_17828 ?auto_17826 ) ) ( not ( = ?auto_17823 ?auto_17821 ) ) ( not ( = ?auto_17822 ?auto_17821 ) ) ( not ( = ?auto_17824 ?auto_17821 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_17823 ?auto_17822 ?auto_17821 ?auto_17824 ?auto_17820 )
      ( FLY-4PPL-VERIFY ?auto_17821 ?auto_17822 ?auto_17823 ?auto_17824 ?auto_17820 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_17888 - PERSON
      ?auto_17889 - PERSON
      ?auto_17890 - PERSON
      ?auto_17891 - PERSON
      ?auto_17887 - CITY
    )
    :vars
    (
      ?auto_17892 - FLEVEL
      ?auto_17896 - FLEVEL
      ?auto_17893 - CITY
      ?auto_17895 - CITY
      ?auto_17894 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_17892 ?auto_17896 ) ( PERSON-AT ?auto_17888 ?auto_17893 ) ( not ( = ?auto_17887 ?auto_17893 ) ) ( not ( = ?auto_17892 ?auto_17896 ) ) ( PERSON-AT ?auto_17890 ?auto_17895 ) ( not ( = ?auto_17887 ?auto_17895 ) ) ( PERSON-AT ?auto_17889 ?auto_17893 ) ( PERSON-AT ?auto_17891 ?auto_17893 ) ( AIRCRAFT-AT ?auto_17894 ?auto_17887 ) ( FUEL-LEVEL ?auto_17894 ?auto_17892 ) ( not ( = ?auto_17891 ?auto_17889 ) ) ( not ( = ?auto_17891 ?auto_17890 ) ) ( not ( = ?auto_17889 ?auto_17890 ) ) ( not ( = ?auto_17895 ?auto_17893 ) ) ( not ( = ?auto_17891 ?auto_17888 ) ) ( not ( = ?auto_17889 ?auto_17888 ) ) ( not ( = ?auto_17890 ?auto_17888 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_17891 ?auto_17889 ?auto_17888 ?auto_17890 ?auto_17887 )
      ( FLY-4PPL-VERIFY ?auto_17888 ?auto_17889 ?auto_17890 ?auto_17891 ?auto_17887 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_17988 - PERSON
      ?auto_17989 - PERSON
      ?auto_17990 - PERSON
      ?auto_17991 - PERSON
      ?auto_17987 - CITY
    )
    :vars
    (
      ?auto_17992 - FLEVEL
      ?auto_17996 - FLEVEL
      ?auto_17993 - CITY
      ?auto_17995 - CITY
      ?auto_17994 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_17992 ?auto_17996 ) ( PERSON-AT ?auto_17988 ?auto_17993 ) ( not ( = ?auto_17987 ?auto_17993 ) ) ( not ( = ?auto_17992 ?auto_17996 ) ) ( PERSON-AT ?auto_17989 ?auto_17995 ) ( not ( = ?auto_17987 ?auto_17995 ) ) ( PERSON-AT ?auto_17991 ?auto_17993 ) ( PERSON-AT ?auto_17990 ?auto_17993 ) ( AIRCRAFT-AT ?auto_17994 ?auto_17987 ) ( FUEL-LEVEL ?auto_17994 ?auto_17992 ) ( not ( = ?auto_17990 ?auto_17991 ) ) ( not ( = ?auto_17990 ?auto_17989 ) ) ( not ( = ?auto_17991 ?auto_17989 ) ) ( not ( = ?auto_17995 ?auto_17993 ) ) ( not ( = ?auto_17990 ?auto_17988 ) ) ( not ( = ?auto_17991 ?auto_17988 ) ) ( not ( = ?auto_17989 ?auto_17988 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_17990 ?auto_17991 ?auto_17988 ?auto_17989 ?auto_17987 )
      ( FLY-4PPL-VERIFY ?auto_17988 ?auto_17989 ?auto_17990 ?auto_17991 ?auto_17987 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_18020 - PERSON
      ?auto_18021 - PERSON
      ?auto_18022 - PERSON
      ?auto_18023 - PERSON
      ?auto_18019 - CITY
    )
    :vars
    (
      ?auto_18024 - FLEVEL
      ?auto_18028 - FLEVEL
      ?auto_18025 - CITY
      ?auto_18027 - CITY
      ?auto_18026 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_18024 ?auto_18028 ) ( PERSON-AT ?auto_18020 ?auto_18025 ) ( not ( = ?auto_18019 ?auto_18025 ) ) ( not ( = ?auto_18024 ?auto_18028 ) ) ( PERSON-AT ?auto_18021 ?auto_18027 ) ( not ( = ?auto_18019 ?auto_18027 ) ) ( PERSON-AT ?auto_18022 ?auto_18025 ) ( PERSON-AT ?auto_18023 ?auto_18025 ) ( AIRCRAFT-AT ?auto_18026 ?auto_18019 ) ( FUEL-LEVEL ?auto_18026 ?auto_18024 ) ( not ( = ?auto_18023 ?auto_18022 ) ) ( not ( = ?auto_18023 ?auto_18021 ) ) ( not ( = ?auto_18022 ?auto_18021 ) ) ( not ( = ?auto_18027 ?auto_18025 ) ) ( not ( = ?auto_18023 ?auto_18020 ) ) ( not ( = ?auto_18022 ?auto_18020 ) ) ( not ( = ?auto_18021 ?auto_18020 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_18023 ?auto_18022 ?auto_18020 ?auto_18021 ?auto_18019 )
      ( FLY-4PPL-VERIFY ?auto_18020 ?auto_18021 ?auto_18022 ?auto_18023 ?auto_18019 ) )
  )

)

