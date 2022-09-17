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
      ?auto_46 - PERSON
      ?auto_45 - CITY
    )
    :vars
    (
      ?auto_49 - FLEVEL
      ?auto_48 - FLEVEL
      ?auto_50 - CITY
      ?auto_47 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_49 ?auto_48 ) ( PERSON-AT ?auto_46 ?auto_50 ) ( AIRCRAFT-AT ?auto_47 ?auto_45 ) ( FUEL-LEVEL ?auto_47 ?auto_49 ) ( not ( = ?auto_45 ?auto_50 ) ) ( not ( = ?auto_49 ?auto_48 ) ) )
    :subtasks
    ( ( !REFUEL ?auto_47 ?auto_45 ?auto_49 ?auto_48 )
      ( !FLY ?auto_47 ?auto_45 ?auto_50 ?auto_48 ?auto_49 )
      ( !REFUEL ?auto_47 ?auto_50 ?auto_49 ?auto_48 )
      ( !BOARD ?auto_46 ?auto_47 ?auto_50 )
      ( !FLY ?auto_47 ?auto_50 ?auto_45 ?auto_48 ?auto_49 )
      ( !DEBARK ?auto_46 ?auto_47 ?auto_45 )
      ( FLY-1PPL-VERIFY ?auto_46 ?auto_45 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_69 - PERSON
      ?auto_70 - PERSON
      ?auto_68 - CITY
    )
    :vars
    (
      ?auto_71 - FLEVEL
      ?auto_72 - FLEVEL
      ?auto_74 - CITY
      ?auto_75 - CITY
      ?auto_73 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_71 ?auto_72 ) ( PERSON-AT ?auto_70 ?auto_74 ) ( not ( = ?auto_68 ?auto_74 ) ) ( not ( = ?auto_71 ?auto_72 ) ) ( PERSON-AT ?auto_69 ?auto_75 ) ( AIRCRAFT-AT ?auto_73 ?auto_68 ) ( FUEL-LEVEL ?auto_73 ?auto_71 ) ( not ( = ?auto_68 ?auto_75 ) ) ( not ( = ?auto_69 ?auto_70 ) ) ( not ( = ?auto_74 ?auto_75 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_69 ?auto_68 )
      ( FLY-1PPL ?auto_70 ?auto_68 )
      ( FLY-2PPL-VERIFY ?auto_69 ?auto_70 ?auto_68 ) )
  )

)

