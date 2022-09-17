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
      ?auto_136 - PERSON
      ?auto_135 - CITY
    )
    :vars
    (
      ?auto_139 - FLEVEL
      ?auto_138 - FLEVEL
      ?auto_140 - CITY
      ?auto_137 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_139 ?auto_138 ) ( PERSON-AT ?auto_136 ?auto_140 ) ( AIRCRAFT-AT ?auto_137 ?auto_135 ) ( FUEL-LEVEL ?auto_137 ?auto_139 ) ( not ( = ?auto_135 ?auto_140 ) ) ( not ( = ?auto_139 ?auto_138 ) ) )
    :subtasks
    ( ( !REFUEL ?auto_137 ?auto_135 ?auto_139 ?auto_138 )
      ( !FLY ?auto_137 ?auto_135 ?auto_140 ?auto_138 ?auto_139 )
      ( !REFUEL ?auto_137 ?auto_140 ?auto_139 ?auto_138 )
      ( !BOARD ?auto_136 ?auto_137 ?auto_140 )
      ( !FLY ?auto_137 ?auto_140 ?auto_135 ?auto_138 ?auto_139 )
      ( !DEBARK ?auto_136 ?auto_137 ?auto_135 )
      ( FLY-1PPL-VERIFY ?auto_136 ?auto_135 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_159 - PERSON
      ?auto_160 - PERSON
      ?auto_158 - CITY
    )
    :vars
    (
      ?auto_161 - FLEVEL
      ?auto_164 - FLEVEL
      ?auto_163 - CITY
      ?auto_165 - CITY
      ?auto_162 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_161 ?auto_164 ) ( PERSON-AT ?auto_160 ?auto_163 ) ( not ( = ?auto_158 ?auto_163 ) ) ( not ( = ?auto_161 ?auto_164 ) ) ( PERSON-AT ?auto_159 ?auto_165 ) ( AIRCRAFT-AT ?auto_162 ?auto_158 ) ( FUEL-LEVEL ?auto_162 ?auto_161 ) ( not ( = ?auto_158 ?auto_165 ) ) ( not ( = ?auto_159 ?auto_160 ) ) ( not ( = ?auto_163 ?auto_165 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_159 ?auto_158 )
      ( FLY-1PPL ?auto_160 ?auto_158 )
      ( FLY-2PPL-VERIFY ?auto_159 ?auto_160 ?auto_158 ) )
  )

)

