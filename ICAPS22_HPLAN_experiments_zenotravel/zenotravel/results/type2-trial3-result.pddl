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
      ?auto_16 - PERSON
      ?auto_15 - CITY
    )
    :vars
    (
      ?auto_17 - AIRCRAFT
      ?auto_20 - CITY
      ?auto_18 - FLEVEL
      ?auto_19 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_17 ?auto_20 ) ( FUEL-LEVEL ?auto_17 ?auto_18 ) ( NEXT ?auto_19 ?auto_18 ) ( not ( = ?auto_15 ?auto_20 ) ) ( not ( = ?auto_18 ?auto_19 ) ) ( PERSON-AT ?auto_16 ?auto_20 ) )
    :subtasks
    ( ( !BOARD ?auto_16 ?auto_17 ?auto_20 )
      ( TRAVEL ?auto_16 ?auto_15 )
      ( TRAVEL-VERIFY ?auto_16 ?auto_15 ) )
  )

  ( :method TRAVEL
    :parameters
    (
      ?auto_88 - PERSON
      ?auto_87 - CITY
    )
    :vars
    (
      ?auto_89 - FLEVEL
      ?auto_91 - FLEVEL
      ?auto_92 - CITY
      ?auto_90 - AIRCRAFT
      ?auto_93 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_89 ?auto_91 ) ( not ( = ?auto_87 ?auto_92 ) ) ( not ( = ?auto_91 ?auto_89 ) ) ( PERSON-AT ?auto_88 ?auto_92 ) ( AIRCRAFT-AT ?auto_90 ?auto_93 ) ( FUEL-LEVEL ?auto_90 ?auto_91 ) ( not ( = ?auto_87 ?auto_93 ) ) ( not ( = ?auto_92 ?auto_93 ) ) )
    :subtasks
    ( ( !FLY ?auto_90 ?auto_93 ?auto_92 ?auto_91 ?auto_89 )
      ( TRAVEL ?auto_88 ?auto_87 )
      ( TRAVEL-VERIFY ?auto_88 ?auto_87 ) )
  )

  ( :method TRAVEL
    :parameters
    (
      ?auto_82 - PERSON
      ?auto_81 - CITY
    )
    :vars
    (
      ?auto_85 - AIRCRAFT
      ?auto_83 - CITY
      ?auto_86 - FLEVEL
      ?auto_84 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_85 ?auto_83 ) ( NEXT ?auto_86 ?auto_84 ) ( not ( = ?auto_81 ?auto_83 ) ) ( not ( = ?auto_84 ?auto_86 ) ) ( PERSON-AT ?auto_82 ?auto_83 ) ( FUEL-LEVEL ?auto_85 ?auto_86 ) )
    :subtasks
    ( ( !REFUEL ?auto_85 ?auto_83 ?auto_86 ?auto_84 )
      ( TRAVEL ?auto_82 ?auto_81 )
      ( TRAVEL-VERIFY ?auto_82 ?auto_81 ) )
  )

  ( :method TRAVEL
    :parameters
    (
      ?auto_122 - PERSON
      ?auto_121 - CITY
    )
    :vars
    (
      ?auto_123 - AIRCRAFT
      ?auto_126 - CITY
      ?auto_125 - FLEVEL
      ?auto_124 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_122 ?auto_123 ) ( AIRCRAFT-AT ?auto_123 ?auto_126 ) ( NEXT ?auto_125 ?auto_124 ) ( not ( = ?auto_121 ?auto_126 ) ) ( not ( = ?auto_124 ?auto_125 ) ) ( FUEL-LEVEL ?auto_123 ?auto_125 ) )
    :subtasks
    ( ( !REFUEL ?auto_123 ?auto_126 ?auto_125 ?auto_124 )
      ( TRAVEL ?auto_122 ?auto_121 )
      ( TRAVEL-VERIFY ?auto_122 ?auto_121 ) )
  )

  ( :method TRAVEL
    :parameters
    (
      ?auto_165 - PERSON
      ?auto_164 - CITY
    )
    :vars
    (
      ?auto_166 - AIRCRAFT
      ?auto_168 - CITY
      ?auto_167 - FLEVEL
      ?auto_169 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_166 ?auto_168 ) ( NEXT ?auto_167 ?auto_169 ) ( not ( = ?auto_164 ?auto_168 ) ) ( not ( = ?auto_169 ?auto_167 ) ) ( FUEL-LEVEL ?auto_166 ?auto_167 ) ( PERSON-AT ?auto_165 ?auto_168 ) )
    :subtasks
    ( ( !BOARD ?auto_165 ?auto_166 ?auto_168 )
      ( TRAVEL ?auto_165 ?auto_164 )
      ( TRAVEL-VERIFY ?auto_165 ?auto_164 ) )
  )

  ( :method TRAVEL
    :parameters
    (
      ?auto_555 - PERSON
      ?auto_554 - CITY
    )
    :vars
    (
      ?auto_557 - FLEVEL
      ?auto_560 - FLEVEL
      ?auto_559 - CITY
      ?auto_556 - CITY
      ?auto_558 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_557 ?auto_560 ) ( not ( = ?auto_554 ?auto_559 ) ) ( not ( = ?auto_560 ?auto_557 ) ) ( PERSON-AT ?auto_555 ?auto_559 ) ( not ( = ?auto_554 ?auto_556 ) ) ( not ( = ?auto_559 ?auto_556 ) ) ( AIRCRAFT-AT ?auto_558 ?auto_554 ) ( FUEL-LEVEL ?auto_558 ?auto_560 ) )
    :subtasks
    ( ( !FLY ?auto_558 ?auto_554 ?auto_556 ?auto_560 ?auto_557 )
      ( TRAVEL ?auto_555 ?auto_554 )
      ( TRAVEL-VERIFY ?auto_555 ?auto_554 ) )
  )

  ( :method TRAVEL
    :parameters
    (
      ?auto_291 - PERSON
      ?auto_290 - CITY
    )
    :vars
    (
      ?auto_292 - FLEVEL
      ?auto_294 - FLEVEL
      ?auto_293 - CITY
      ?auto_295 - AIRCRAFT
      ?auto_296 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_292 ?auto_294 ) ( not ( = ?auto_290 ?auto_293 ) ) ( not ( = ?auto_294 ?auto_292 ) ) ( PERSON-AT ?auto_291 ?auto_293 ) ( AIRCRAFT-AT ?auto_295 ?auto_296 ) ( not ( = ?auto_290 ?auto_296 ) ) ( not ( = ?auto_293 ?auto_296 ) ) ( FUEL-LEVEL ?auto_295 ?auto_292 ) )
    :subtasks
    ( ( !REFUEL ?auto_295 ?auto_296 ?auto_292 ?auto_294 )
      ( TRAVEL ?auto_291 ?auto_290 )
      ( TRAVEL-VERIFY ?auto_291 ?auto_290 ) )
  )

  ( :method TRAVEL
    :parameters
    (
      ?auto_331 - PERSON
      ?auto_330 - CITY
    )
    :vars
    (
      ?auto_332 - FLEVEL
      ?auto_334 - FLEVEL
      ?auto_335 - CITY
      ?auto_333 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_332 ?auto_334 ) ( not ( = ?auto_330 ?auto_335 ) ) ( not ( = ?auto_334 ?auto_332 ) ) ( PERSON-AT ?auto_331 ?auto_335 ) ( AIRCRAFT-AT ?auto_333 ?auto_330 ) ( FUEL-LEVEL ?auto_333 ?auto_334 ) )
    :subtasks
    ( ( !FLY ?auto_333 ?auto_330 ?auto_335 ?auto_334 ?auto_332 )
      ( TRAVEL ?auto_331 ?auto_330 )
      ( TRAVEL-VERIFY ?auto_331 ?auto_330 ) )
  )

  ( :method TRAVEL
    :parameters
    (
      ?auto_427 - PERSON
      ?auto_426 - CITY
    )
    :vars
    (
      ?auto_429 - FLEVEL
      ?auto_430 - FLEVEL
      ?auto_431 - CITY
      ?auto_428 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_429 ?auto_430 ) ( not ( = ?auto_426 ?auto_431 ) ) ( not ( = ?auto_430 ?auto_429 ) ) ( PERSON-AT ?auto_427 ?auto_431 ) ( AIRCRAFT-AT ?auto_428 ?auto_426 ) ( FUEL-LEVEL ?auto_428 ?auto_429 ) )
    :subtasks
    ( ( !REFUEL ?auto_428 ?auto_426 ?auto_429 ?auto_430 )
      ( TRAVEL ?auto_427 ?auto_426 )
      ( TRAVEL-VERIFY ?auto_427 ?auto_426 ) )
  )

  ( :method TRAVEL
    :parameters
    (
      ?auto_957 - PERSON
      ?auto_956 - CITY
    )
    :vars
    (
      ?auto_960 - FLEVEL
      ?auto_958 - FLEVEL
      ?auto_961 - CITY
      ?auto_959 - AIRCRAFT
      ?auto_962 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_960 ?auto_958 ) ( not ( = ?auto_956 ?auto_961 ) ) ( not ( = ?auto_958 ?auto_960 ) ) ( PERSON-AT ?auto_957 ?auto_961 ) ( AIRCRAFT-AT ?auto_959 ?auto_962 ) ( FUEL-LEVEL ?auto_959 ?auto_958 ) ( not ( = ?auto_956 ?auto_962 ) ) ( not ( = ?auto_961 ?auto_962 ) ) )
    :subtasks
    ( ( !FLY ?auto_959 ?auto_962 ?auto_956 ?auto_958 ?auto_960 )
      ( TRAVEL ?auto_957 ?auto_956 )
      ( TRAVEL-VERIFY ?auto_957 ?auto_956 ) )
  )

  ( :method TRAVEL
    :parameters
    (
      ?auto_567 - PERSON
      ?auto_566 - CITY
    )
    :vars
    (
      ?auto_568 - AIRCRAFT
      ?auto_572 - CITY
      ?auto_569 - FLEVEL
      ?auto_570 - FLEVEL
      ?auto_571 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_567 ?auto_568 ) ( AIRCRAFT-AT ?auto_568 ?auto_572 ) ( FUEL-LEVEL ?auto_568 ?auto_569 ) ( NEXT ?auto_570 ?auto_569 ) ( NEXT ?auto_571 ?auto_570 ) ( not ( = ?auto_566 ?auto_572 ) ) ( not ( = ?auto_569 ?auto_570 ) ) ( not ( = ?auto_569 ?auto_571 ) ) ( not ( = ?auto_570 ?auto_571 ) ) )
    :subtasks
    ( ( !ZOOM ?auto_568 ?auto_572 ?auto_566 ?auto_569 ?auto_570 ?auto_571 )
      ( TRAVEL ?auto_567 ?auto_566 )
      ( TRAVEL-VERIFY ?auto_567 ?auto_566 ) )
  )

  ( :method TRAVEL
    :parameters
    (
      ?auto_612 - PERSON
      ?auto_611 - CITY
    )
    :vars
    (
      ?auto_614 - FLEVEL
      ?auto_613 - FLEVEL
      ?auto_615 - CITY
      ?auto_616 - AIRCRAFT
      ?auto_618 - CITY
      ?auto_617 - FLEVEL
    )
    :precondition
    ( and ( NEXT ?auto_614 ?auto_613 ) ( not ( = ?auto_611 ?auto_615 ) ) ( not ( = ?auto_613 ?auto_614 ) ) ( PERSON-AT ?auto_612 ?auto_615 ) ( AIRCRAFT-AT ?auto_616 ?auto_618 ) ( FUEL-LEVEL ?auto_616 ?auto_617 ) ( NEXT ?auto_613 ?auto_617 ) ( not ( = ?auto_611 ?auto_618 ) ) ( not ( = ?auto_614 ?auto_617 ) ) ( not ( = ?auto_613 ?auto_617 ) ) ( not ( = ?auto_615 ?auto_618 ) ) )
    :subtasks
    ( ( !ZOOM ?auto_616 ?auto_618 ?auto_615 ?auto_617 ?auto_613 ?auto_614 )
      ( TRAVEL ?auto_612 ?auto_611 )
      ( TRAVEL-VERIFY ?auto_612 ?auto_611 ) )
  )

  ( :method TRAVEL
    :parameters
    (
      ?auto_1148 - PERSON
      ?auto_1147 - CITY
    )
    :vars
    (
      ?auto_1151 - FLEVEL
      ?auto_1152 - FLEVEL
      ?auto_1149 - CITY
      ?auto_1150 - AIRCRAFT
      ?auto_1153 - FLEVEL
    )
    :precondition
    ( and ( NEXT ?auto_1151 ?auto_1152 ) ( not ( = ?auto_1147 ?auto_1149 ) ) ( not ( = ?auto_1152 ?auto_1151 ) ) ( PERSON-AT ?auto_1148 ?auto_1149 ) ( AIRCRAFT-AT ?auto_1150 ?auto_1147 ) ( FUEL-LEVEL ?auto_1150 ?auto_1153 ) ( NEXT ?auto_1152 ?auto_1153 ) ( not ( = ?auto_1151 ?auto_1153 ) ) ( not ( = ?auto_1152 ?auto_1153 ) ) )
    :subtasks
    ( ( !ZOOM ?auto_1150 ?auto_1147 ?auto_1149 ?auto_1153 ?auto_1152 ?auto_1151 )
      ( TRAVEL ?auto_1148 ?auto_1147 )
      ( TRAVEL-VERIFY ?auto_1148 ?auto_1147 ) )
  )

)

