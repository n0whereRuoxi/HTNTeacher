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
      ?auto_91 - PERSON
      ?auto_90 - CITY
    )
    :vars
    (
      ?auto_94 - FLEVEL
      ?auto_93 - FLEVEL
      ?auto_95 - CITY
      ?auto_92 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_94 ?auto_93 ) ( PERSON-AT ?auto_91 ?auto_95 ) ( AIRCRAFT-AT ?auto_92 ?auto_90 ) ( FUEL-LEVEL ?auto_92 ?auto_94 ) ( not ( = ?auto_90 ?auto_95 ) ) ( not ( = ?auto_94 ?auto_93 ) ) )
    :subtasks
    ( ( !REFUEL ?auto_92 ?auto_90 ?auto_94 ?auto_93 )
      ( !FLY ?auto_92 ?auto_90 ?auto_95 ?auto_93 ?auto_94 )
      ( !REFUEL ?auto_92 ?auto_95 ?auto_94 ?auto_93 )
      ( !BOARD ?auto_91 ?auto_92 ?auto_95 )
      ( !FLY ?auto_92 ?auto_95 ?auto_90 ?auto_93 ?auto_94 )
      ( !DEBARK ?auto_91 ?auto_92 ?auto_90 )
      ( FLY-1PPL-VERIFY ?auto_91 ?auto_90 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_114 - PERSON
      ?auto_115 - PERSON
      ?auto_113 - CITY
    )
    :vars
    (
      ?auto_117 - FLEVEL
      ?auto_116 - FLEVEL
      ?auto_119 - CITY
      ?auto_120 - CITY
      ?auto_118 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_117 ?auto_116 ) ( PERSON-AT ?auto_115 ?auto_119 ) ( not ( = ?auto_113 ?auto_119 ) ) ( not ( = ?auto_117 ?auto_116 ) ) ( PERSON-AT ?auto_114 ?auto_120 ) ( AIRCRAFT-AT ?auto_118 ?auto_113 ) ( FUEL-LEVEL ?auto_118 ?auto_117 ) ( not ( = ?auto_113 ?auto_120 ) ) ( not ( = ?auto_114 ?auto_115 ) ) ( not ( = ?auto_119 ?auto_120 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_114 ?auto_113 )
      ( FLY-1PPL ?auto_115 ?auto_113 )
      ( FLY-2PPL-VERIFY ?auto_114 ?auto_115 ?auto_113 ) )
  )

)

