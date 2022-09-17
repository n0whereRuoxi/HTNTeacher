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

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_3 - PERSON
      ?auto_2 - CITY
    )
    :vars
    (
      ?auto_6 - FLEVEL
      ?auto_5 - FLEVEL
      ?auto_7 - CITY
      ?auto_4 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_6 ?auto_5 ) ( PERSON-AT ?auto_3 ?auto_7 ) ( AIRCRAFT-AT ?auto_4 ?auto_2 ) ( FUEL-LEVEL ?auto_4 ?auto_6 ) ( not ( = ?auto_2 ?auto_7 ) ) ( not ( = ?auto_6 ?auto_5 ) ) )
    :subtasks
    ( ( !REFUEL ?auto_4 ?auto_2 ?auto_6 ?auto_5 )
      ( !FLY ?auto_4 ?auto_2 ?auto_7 ?auto_5 ?auto_6 )
      ( !REFUEL ?auto_4 ?auto_7 ?auto_6 ?auto_5 )
      ( !BOARD ?auto_3 ?auto_4 ?auto_7 )
      ( !FLY ?auto_4 ?auto_7 ?auto_2 ?auto_5 ?auto_6 )
      ( !DEBARK ?auto_3 ?auto_4 ?auto_2 )
      ( FLY-1PPL-VERIFY ?auto_3 ?auto_2 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_11 - PERSON
      ?auto_10 - CITY
    )
    :vars
    (
      ?auto_14 - FLEVEL
      ?auto_13 - FLEVEL
      ?auto_15 - CITY
      ?auto_12 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_14 ?auto_13 ) ( PERSON-AT ?auto_11 ?auto_15 ) ( AIRCRAFT-AT ?auto_12 ?auto_10 ) ( FUEL-LEVEL ?auto_12 ?auto_14 ) ( not ( = ?auto_10 ?auto_15 ) ) ( not ( = ?auto_14 ?auto_13 ) ) )
    :subtasks
    ( ( !REFUEL ?auto_12 ?auto_10 ?auto_14 ?auto_13 )
      ( !FLY ?auto_12 ?auto_10 ?auto_15 ?auto_13 ?auto_14 )
      ( !REFUEL ?auto_12 ?auto_15 ?auto_14 ?auto_13 )
      ( !BOARD ?auto_11 ?auto_12 ?auto_15 )
      ( !FLY ?auto_12 ?auto_15 ?auto_10 ?auto_13 ?auto_14 )
      ( !DEBARK ?auto_11 ?auto_12 ?auto_10 )
      ( FLY-1PPL-VERIFY ?auto_11 ?auto_10 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_26 - PERSON
      ?auto_27 - PERSON
      ?auto_25 - CITY
    )
    :vars
    (
      ?auto_30 - FLEVEL
      ?auto_31 - FLEVEL
      ?auto_28 - CITY
      ?auto_29 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_30 ?auto_31 ) ( PERSON-AT ?auto_27 ?auto_28 ) ( not ( = ?auto_25 ?auto_28 ) ) ( not ( = ?auto_30 ?auto_31 ) ) ( PERSON-AT ?auto_26 ?auto_28 ) ( AIRCRAFT-AT ?auto_29 ?auto_25 ) ( FUEL-LEVEL ?auto_29 ?auto_30 ) ( not ( = ?auto_26 ?auto_27 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_26 ?auto_25 )
      ( FLY-1PPL ?auto_27 ?auto_25 )
      ( FLY-2PPL-VERIFY ?auto_26 ?auto_27 ?auto_25 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_33 - PERSON
      ?auto_34 - PERSON
      ?auto_32 - CITY
    )
    :vars
    (
      ?auto_37 - FLEVEL
      ?auto_38 - FLEVEL
      ?auto_36 - CITY
      ?auto_35 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_37 ?auto_38 ) ( PERSON-AT ?auto_33 ?auto_36 ) ( not ( = ?auto_32 ?auto_36 ) ) ( not ( = ?auto_37 ?auto_38 ) ) ( PERSON-AT ?auto_34 ?auto_36 ) ( AIRCRAFT-AT ?auto_35 ?auto_32 ) ( FUEL-LEVEL ?auto_35 ?auto_37 ) ( not ( = ?auto_34 ?auto_33 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_34 ?auto_33 ?auto_32 )
      ( FLY-2PPL-VERIFY ?auto_33 ?auto_34 ?auto_32 ) )
  )

)

