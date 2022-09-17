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
      ?auto_11137 - PERSON
      ?auto_11136 - CITY
    )
    :vars
    (
      ?auto_11140 - FLEVEL
      ?auto_11139 - FLEVEL
      ?auto_11141 - CITY
      ?auto_11138 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_11140 ?auto_11139 ) ( PERSON-AT ?auto_11137 ?auto_11141 ) ( AIRCRAFT-AT ?auto_11138 ?auto_11136 ) ( FUEL-LEVEL ?auto_11138 ?auto_11140 ) ( not ( = ?auto_11136 ?auto_11141 ) ) ( not ( = ?auto_11140 ?auto_11139 ) ) )
    :subtasks
    ( ( !REFUEL ?auto_11138 ?auto_11136 ?auto_11140 ?auto_11139 )
      ( !FLY ?auto_11138 ?auto_11136 ?auto_11141 ?auto_11139 ?auto_11140 )
      ( !REFUEL ?auto_11138 ?auto_11141 ?auto_11140 ?auto_11139 )
      ( !BOARD ?auto_11137 ?auto_11138 ?auto_11141 )
      ( !FLY ?auto_11138 ?auto_11141 ?auto_11136 ?auto_11139 ?auto_11140 )
      ( !DEBARK ?auto_11137 ?auto_11138 ?auto_11136 )
      ( FLY-1PPL-VERIFY ?auto_11137 ?auto_11136 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_11160 - PERSON
      ?auto_11161 - PERSON
      ?auto_11159 - CITY
    )
    :vars
    (
      ?auto_11162 - FLEVEL
      ?auto_11164 - FLEVEL
      ?auto_11165 - CITY
      ?auto_11166 - CITY
      ?auto_11163 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_11162 ?auto_11164 ) ( PERSON-AT ?auto_11161 ?auto_11165 ) ( not ( = ?auto_11159 ?auto_11165 ) ) ( not ( = ?auto_11162 ?auto_11164 ) ) ( PERSON-AT ?auto_11160 ?auto_11166 ) ( AIRCRAFT-AT ?auto_11163 ?auto_11159 ) ( FUEL-LEVEL ?auto_11163 ?auto_11162 ) ( not ( = ?auto_11159 ?auto_11166 ) ) ( not ( = ?auto_11160 ?auto_11161 ) ) ( not ( = ?auto_11165 ?auto_11166 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_11160 ?auto_11159 )
      ( FLY-1PPL ?auto_11161 ?auto_11159 )
      ( FLY-2PPL-VERIFY ?auto_11160 ?auto_11161 ?auto_11159 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_11275 - PERSON
      ?auto_11276 - PERSON
      ?auto_11277 - PERSON
      ?auto_11274 - CITY
    )
    :vars
    (
      ?auto_11279 - FLEVEL
      ?auto_11280 - FLEVEL
      ?auto_11278 - CITY
      ?auto_11283 - CITY
      ?auto_11282 - CITY
      ?auto_11281 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_11279 ?auto_11280 ) ( PERSON-AT ?auto_11277 ?auto_11278 ) ( not ( = ?auto_11274 ?auto_11278 ) ) ( not ( = ?auto_11279 ?auto_11280 ) ) ( PERSON-AT ?auto_11276 ?auto_11283 ) ( not ( = ?auto_11274 ?auto_11283 ) ) ( PERSON-AT ?auto_11275 ?auto_11282 ) ( AIRCRAFT-AT ?auto_11281 ?auto_11274 ) ( FUEL-LEVEL ?auto_11281 ?auto_11279 ) ( not ( = ?auto_11274 ?auto_11282 ) ) ( not ( = ?auto_11275 ?auto_11276 ) ) ( not ( = ?auto_11283 ?auto_11282 ) ) ( not ( = ?auto_11275 ?auto_11277 ) ) ( not ( = ?auto_11276 ?auto_11277 ) ) ( not ( = ?auto_11278 ?auto_11283 ) ) ( not ( = ?auto_11278 ?auto_11282 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_11275 ?auto_11276 ?auto_11274 )
      ( FLY-1PPL ?auto_11277 ?auto_11274 )
      ( FLY-3PPL-VERIFY ?auto_11275 ?auto_11276 ?auto_11277 ?auto_11274 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_12441 - PERSON
      ?auto_12442 - PERSON
      ?auto_12443 - PERSON
      ?auto_12444 - PERSON
      ?auto_12440 - CITY
    )
    :vars
    (
      ?auto_12446 - FLEVEL
      ?auto_12445 - FLEVEL
      ?auto_12447 - CITY
      ?auto_12449 - CITY
      ?auto_12450 - CITY
      ?auto_12451 - CITY
      ?auto_12448 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_12446 ?auto_12445 ) ( PERSON-AT ?auto_12444 ?auto_12447 ) ( not ( = ?auto_12440 ?auto_12447 ) ) ( not ( = ?auto_12446 ?auto_12445 ) ) ( PERSON-AT ?auto_12443 ?auto_12449 ) ( not ( = ?auto_12440 ?auto_12449 ) ) ( PERSON-AT ?auto_12442 ?auto_12450 ) ( not ( = ?auto_12440 ?auto_12450 ) ) ( PERSON-AT ?auto_12441 ?auto_12451 ) ( AIRCRAFT-AT ?auto_12448 ?auto_12440 ) ( FUEL-LEVEL ?auto_12448 ?auto_12446 ) ( not ( = ?auto_12440 ?auto_12451 ) ) ( not ( = ?auto_12441 ?auto_12442 ) ) ( not ( = ?auto_12450 ?auto_12451 ) ) ( not ( = ?auto_12441 ?auto_12443 ) ) ( not ( = ?auto_12442 ?auto_12443 ) ) ( not ( = ?auto_12449 ?auto_12450 ) ) ( not ( = ?auto_12449 ?auto_12451 ) ) ( not ( = ?auto_12441 ?auto_12444 ) ) ( not ( = ?auto_12442 ?auto_12444 ) ) ( not ( = ?auto_12443 ?auto_12444 ) ) ( not ( = ?auto_12447 ?auto_12449 ) ) ( not ( = ?auto_12447 ?auto_12450 ) ) ( not ( = ?auto_12447 ?auto_12451 ) ) )
    :subtasks
    ( ( FLY-3PPL ?auto_12441 ?auto_12442 ?auto_12443 ?auto_12440 )
      ( FLY-1PPL ?auto_12444 ?auto_12440 )
      ( FLY-4PPL-VERIFY ?auto_12441 ?auto_12442 ?auto_12443 ?auto_12444 ?auto_12440 ) )
  )

)

