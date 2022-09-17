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
      ?auto_200 - PERSON
      ?auto_199 - CITY
    )
    :vars
    (
      ?auto_203 - FLEVEL
      ?auto_202 - FLEVEL
      ?auto_204 - CITY
      ?auto_201 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_203 ?auto_202 ) ( PERSON-AT ?auto_200 ?auto_204 ) ( AIRCRAFT-AT ?auto_201 ?auto_199 ) ( FUEL-LEVEL ?auto_201 ?auto_203 ) ( not ( = ?auto_199 ?auto_204 ) ) ( not ( = ?auto_203 ?auto_202 ) ) )
    :subtasks
    ( ( !REFUEL ?auto_201 ?auto_199 ?auto_203 ?auto_202 )
      ( !FLY ?auto_201 ?auto_199 ?auto_204 ?auto_202 ?auto_203 )
      ( !REFUEL ?auto_201 ?auto_204 ?auto_203 ?auto_202 )
      ( !BOARD ?auto_200 ?auto_201 ?auto_204 )
      ( !FLY ?auto_201 ?auto_204 ?auto_199 ?auto_202 ?auto_203 )
      ( !DEBARK ?auto_200 ?auto_201 ?auto_199 )
      ( FLY-1PPL-VERIFY ?auto_200 ?auto_199 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_208 - PERSON
      ?auto_207 - CITY
    )
    :vars
    (
      ?auto_211 - FLEVEL
      ?auto_210 - FLEVEL
      ?auto_212 - CITY
      ?auto_209 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_211 ?auto_210 ) ( PERSON-AT ?auto_208 ?auto_212 ) ( AIRCRAFT-AT ?auto_209 ?auto_207 ) ( FUEL-LEVEL ?auto_209 ?auto_211 ) ( not ( = ?auto_207 ?auto_212 ) ) ( not ( = ?auto_211 ?auto_210 ) ) )
    :subtasks
    ( ( !REFUEL ?auto_209 ?auto_207 ?auto_211 ?auto_210 )
      ( !FLY ?auto_209 ?auto_207 ?auto_212 ?auto_210 ?auto_211 )
      ( !REFUEL ?auto_209 ?auto_212 ?auto_211 ?auto_210 )
      ( !BOARD ?auto_208 ?auto_209 ?auto_212 )
      ( !FLY ?auto_209 ?auto_212 ?auto_207 ?auto_210 ?auto_211 )
      ( !DEBARK ?auto_208 ?auto_209 ?auto_207 )
      ( FLY-1PPL-VERIFY ?auto_208 ?auto_207 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_223 - PERSON
      ?auto_224 - PERSON
      ?auto_222 - CITY
    )
    :vars
    (
      ?auto_227 - FLEVEL
      ?auto_228 - FLEVEL
      ?auto_225 - CITY
      ?auto_226 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_227 ?auto_228 ) ( PERSON-AT ?auto_224 ?auto_225 ) ( not ( = ?auto_222 ?auto_225 ) ) ( not ( = ?auto_227 ?auto_228 ) ) ( PERSON-AT ?auto_223 ?auto_225 ) ( AIRCRAFT-AT ?auto_226 ?auto_222 ) ( FUEL-LEVEL ?auto_226 ?auto_227 ) ( not ( = ?auto_223 ?auto_224 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_223 ?auto_222 )
      ( FLY-1PPL ?auto_224 ?auto_222 )
      ( FLY-2PPL-VERIFY ?auto_223 ?auto_224 ?auto_222 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_230 - PERSON
      ?auto_231 - PERSON
      ?auto_229 - CITY
    )
    :vars
    (
      ?auto_233 - FLEVEL
      ?auto_232 - FLEVEL
      ?auto_235 - CITY
      ?auto_234 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_233 ?auto_232 ) ( PERSON-AT ?auto_230 ?auto_235 ) ( not ( = ?auto_229 ?auto_235 ) ) ( not ( = ?auto_233 ?auto_232 ) ) ( PERSON-AT ?auto_231 ?auto_235 ) ( AIRCRAFT-AT ?auto_234 ?auto_229 ) ( FUEL-LEVEL ?auto_234 ?auto_233 ) ( not ( = ?auto_231 ?auto_230 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_231 ?auto_230 ?auto_229 )
      ( FLY-2PPL-VERIFY ?auto_230 ?auto_231 ?auto_229 ) )
  )

)

