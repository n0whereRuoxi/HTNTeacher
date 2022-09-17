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
      ?auto_181 - PERSON
      ?auto_180 - CITY
    )
    :vars
    (
      ?auto_184 - FLEVEL
      ?auto_183 - FLEVEL
      ?auto_185 - CITY
      ?auto_182 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_184 ?auto_183 ) ( PERSON-AT ?auto_181 ?auto_185 ) ( AIRCRAFT-AT ?auto_182 ?auto_180 ) ( FUEL-LEVEL ?auto_182 ?auto_184 ) ( not ( = ?auto_180 ?auto_185 ) ) ( not ( = ?auto_184 ?auto_183 ) ) )
    :subtasks
    ( ( !REFUEL ?auto_182 ?auto_180 ?auto_184 ?auto_183 )
      ( !FLY ?auto_182 ?auto_180 ?auto_185 ?auto_183 ?auto_184 )
      ( !REFUEL ?auto_182 ?auto_185 ?auto_184 ?auto_183 )
      ( !BOARD ?auto_181 ?auto_182 ?auto_185 )
      ( !FLY ?auto_182 ?auto_185 ?auto_180 ?auto_183 ?auto_184 )
      ( !DEBARK ?auto_181 ?auto_182 ?auto_180 )
      ( FLY-1PPL-VERIFY ?auto_181 ?auto_180 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_204 - PERSON
      ?auto_205 - PERSON
      ?auto_203 - CITY
    )
    :vars
    (
      ?auto_207 - FLEVEL
      ?auto_206 - FLEVEL
      ?auto_209 - CITY
      ?auto_208 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_207 ?auto_206 ) ( PERSON-AT ?auto_205 ?auto_209 ) ( not ( = ?auto_203 ?auto_209 ) ) ( not ( = ?auto_207 ?auto_206 ) ) ( PERSON-AT ?auto_204 ?auto_209 ) ( AIRCRAFT-AT ?auto_208 ?auto_203 ) ( FUEL-LEVEL ?auto_208 ?auto_207 ) ( not ( = ?auto_204 ?auto_205 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_204 ?auto_203 )
      ( FLY-1PPL ?auto_205 ?auto_203 )
      ( FLY-2PPL-VERIFY ?auto_204 ?auto_205 ?auto_203 ) )
  )

)

