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
      ?auto_306 - PERSON
      ?auto_307 - CITY
    )
    :vars
    (
      ?auto_309 - FLEVEL
      ?auto_313 - FLEVEL
      ?auto_316 - CITY
      ?auto_315 - FLEVEL
      ?auto_314 - AIRCRAFT
      ?auto_320 - CITY
      ?auto_318 - FLEVEL
    )
    :precondition
    ( and ( NEXT ?auto_309 ?auto_313 ) ( PERSON-AT ?auto_306 ?auto_316 ) ( NEXT ?auto_315 ?auto_313 ) ( AIRCRAFT-AT ?auto_314 ?auto_320 ) ( FUEL-LEVEL ?auto_314 ?auto_318 ) ( NEXT ?auto_315 ?auto_318 ) )
    :subtasks
    ( ( !FLY ?auto_314 ?auto_320 ?auto_316 ?auto_318 ?auto_315 )
      ( TRAVEL ?auto_306 ?auto_307 )
      ( TRAVEL-VERIFY ?auto_306 ?auto_307 ) )
  )

  ( :method TRAVEL
    :parameters
    (
      ?auto_226 - PERSON
      ?auto_227 - CITY
    )
    :vars
    (
      ?auto_229 - AIRCRAFT
      ?auto_230 - CITY
      ?auto_232 - FLEVEL
      ?auto_228 - FLEVEL
      ?auto_236 - FLEVEL
      ?auto_234 - CITY
    )
    :precondition
    ( and ( IN ?auto_226 ?auto_229 ) ( AIRCRAFT-AT ?auto_229 ?auto_230 ) ( NEXT ?auto_232 ?auto_228 ) ( FUEL-LEVEL ?auto_229 ?auto_236 ) ( NEXT ?auto_236 ?auto_228 ) ( AIRCRAFT-AT ?auto_229 ?auto_234 ) )
    :subtasks
    ( ( !REFUEL ?auto_229 ?auto_234 ?auto_236 ?auto_228 )
      ( TRAVEL ?auto_226 ?auto_227 )
      ( TRAVEL-VERIFY ?auto_226 ?auto_227 ) )
  )

  ( :method TRAVEL
    :parameters
    (
      ?auto_242 - PERSON
      ?auto_243 - CITY
    )
    :vars
    (
      ?auto_248 - AIRCRAFT
      ?auto_244 - CITY
      ?auto_247 - FLEVEL
      ?auto_246 - FLEVEL
      ?auto_251 - FLEVEL
      ?auto_249 - CITY
      ?auto_253 - CITY
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_248 ?auto_244 ) ( NEXT ?auto_247 ?auto_246 ) ( FUEL-LEVEL ?auto_248 ?auto_251 ) ( NEXT ?auto_251 ?auto_246 ) ( AIRCRAFT-AT ?auto_248 ?auto_249 ) ( PERSON-AT ?auto_242 ?auto_253 ) ( AIRCRAFT-AT ?auto_248 ?auto_253 ) )
    :subtasks
    ( ( !BOARD ?auto_242 ?auto_248 ?auto_253 )
      ( TRAVEL ?auto_242 ?auto_243 )
      ( TRAVEL-VERIFY ?auto_242 ?auto_243 ) )
  )

  ( :method TRAVEL
    :parameters
    (
      ?auto_606 - PERSON
      ?auto_607 - CITY
    )
    :vars
    (
      ?auto_614 - FLEVEL
      ?auto_616 - FLEVEL
      ?auto_612 - CITY
      ?auto_610 - FLEVEL
      ?auto_609 - AIRCRAFT
      ?auto_608 - CITY
      ?auto_611 - FLEVEL
      ?auto_619 - FLEVEL
      ?auto_617 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_614 ?auto_616 ) ( PERSON-AT ?auto_606 ?auto_612 ) ( NEXT ?auto_610 ?auto_616 ) ( AIRCRAFT-AT ?auto_609 ?auto_608 ) ( NEXT ?auto_610 ?auto_611 ) ( FUEL-LEVEL ?auto_609 ?auto_619 ) ( NEXT ?auto_619 ?auto_611 ) ( AIRCRAFT-AT ?auto_609 ?auto_617 ) )
    :subtasks
    ( ( !REFUEL ?auto_609 ?auto_617 ?auto_619 ?auto_611 )
      ( TRAVEL ?auto_606 ?auto_607 )
      ( TRAVEL-VERIFY ?auto_606 ?auto_607 ) )
  )

  ( :method TRAVEL
    :parameters
    (
      ?auto_627 - PERSON
      ?auto_628 - CITY
    )
    :vars
    (
      ?auto_631 - AIRCRAFT
      ?auto_636 - CITY
      ?auto_633 - FLEVEL
      ?auto_634 - FLEVEL
      ?auto_635 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_627 ?auto_631 ) ( AIRCRAFT-AT ?auto_631 ?auto_636 ) ( FUEL-LEVEL ?auto_631 ?auto_633 ) ( NEXT ?auto_634 ?auto_633 ) ( NEXT ?auto_635 ?auto_634 ) )
    :subtasks
    ( ( !ZOOM ?auto_631 ?auto_636 ?auto_628 ?auto_633 ?auto_634 ?auto_635 )
      ( TRAVEL ?auto_627 ?auto_628 )
      ( TRAVEL-VERIFY ?auto_627 ?auto_628 ) )
  )

  ( :method TRAVEL
    :parameters
    (
      ?auto_788 - PERSON
      ?auto_789 - CITY
    )
    :vars
    (
      ?auto_794 - FLEVEL
      ?auto_797 - FLEVEL
      ?auto_796 - CITY
      ?auto_795 - FLEVEL
      ?auto_792 - AIRCRAFT
      ?auto_803 - CITY
      ?auto_800 - FLEVEL
      ?auto_801 - FLEVEL
    )
    :precondition
    ( and ( NEXT ?auto_794 ?auto_797 ) ( PERSON-AT ?auto_788 ?auto_796 ) ( NEXT ?auto_795 ?auto_797 ) ( AIRCRAFT-AT ?auto_792 ?auto_803 ) ( FUEL-LEVEL ?auto_792 ?auto_800 ) ( NEXT ?auto_801 ?auto_800 ) ( NEXT ?auto_795 ?auto_801 ) )
    :subtasks
    ( ( !ZOOM ?auto_792 ?auto_803 ?auto_796 ?auto_800 ?auto_801 ?auto_795 )
      ( TRAVEL ?auto_788 ?auto_789 )
      ( TRAVEL-VERIFY ?auto_788 ?auto_789 ) )
  )

)

