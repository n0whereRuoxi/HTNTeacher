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
      ?auto_20 - PERSON
      ?auto_19 - CITY
    )
    :vars
    (
      ?auto_23 - AIRCRAFT
      ?auto_21 - CITY
      ?auto_22 - FLEVEL
      ?auto_24 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_23 ?auto_21 ) ( FUEL-LEVEL ?auto_23 ?auto_22 ) ( NEXT ?auto_24 ?auto_22 ) ( not ( = ?auto_19 ?auto_21 ) ) ( not ( = ?auto_22 ?auto_24 ) ) ( PERSON-AT ?auto_20 ?auto_21 ) )
    :subtasks
    ( ( !BOARD ?auto_20 ?auto_23 ?auto_21 )
      ( TRAVEL ?auto_20 ?auto_19 )
      ( TRAVEL-VERIFY ?auto_20 ?auto_19 ) )
  )

  ( :method TRAVEL
    :parameters
    (
      ?auto_445 - PERSON
      ?auto_444 - CITY
    )
    :vars
    (
      ?auto_449 - FLEVEL
      ?auto_447 - FLEVEL
      ?auto_446 - CITY
      ?auto_448 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_449 ?auto_447 ) ( not ( = ?auto_444 ?auto_446 ) ) ( not ( = ?auto_447 ?auto_449 ) ) ( PERSON-AT ?auto_445 ?auto_446 ) ( AIRCRAFT-AT ?auto_448 ?auto_444 ) ( FUEL-LEVEL ?auto_448 ?auto_447 ) )
    :subtasks
    ( ( !FLY ?auto_448 ?auto_444 ?auto_446 ?auto_447 ?auto_449 )
      ( TRAVEL ?auto_445 ?auto_444 )
      ( TRAVEL-VERIFY ?auto_445 ?auto_444 ) )
  )

  ( :method TRAVEL
    :parameters
    (
      ?auto_216 - PERSON
      ?auto_215 - CITY
    )
    :vars
    (
      ?auto_217 - FLEVEL
      ?auto_218 - FLEVEL
      ?auto_219 - CITY
      ?auto_220 - AIRCRAFT
      ?auto_221 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_217 ?auto_218 ) ( not ( = ?auto_215 ?auto_219 ) ) ( not ( = ?auto_218 ?auto_217 ) ) ( PERSON-AT ?auto_216 ?auto_219 ) ( AIRCRAFT-AT ?auto_220 ?auto_221 ) ( FUEL-LEVEL ?auto_220 ?auto_218 ) ( not ( = ?auto_215 ?auto_221 ) ) ( not ( = ?auto_219 ?auto_221 ) ) )
    :subtasks
    ( ( !FLY ?auto_220 ?auto_221 ?auto_219 ?auto_218 ?auto_217 )
      ( TRAVEL ?auto_216 ?auto_215 )
      ( TRAVEL-VERIFY ?auto_216 ?auto_215 ) )
  )

  ( :method TRAVEL
    :parameters
    (
      ?auto_196 - PERSON
      ?auto_195 - CITY
    )
    :vars
    (
      ?auto_197 - AIRCRAFT
      ?auto_200 - CITY
      ?auto_199 - FLEVEL
      ?auto_198 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_196 ?auto_197 ) ( AIRCRAFT-AT ?auto_197 ?auto_200 ) ( NEXT ?auto_199 ?auto_198 ) ( not ( = ?auto_195 ?auto_200 ) ) ( not ( = ?auto_198 ?auto_199 ) ) ( FUEL-LEVEL ?auto_197 ?auto_199 ) )
    :subtasks
    ( ( !REFUEL ?auto_197 ?auto_200 ?auto_199 ?auto_198 )
      ( TRAVEL ?auto_196 ?auto_195 )
      ( TRAVEL-VERIFY ?auto_196 ?auto_195 ) )
  )

  ( :method TRAVEL
    :parameters
    (
      ?auto_206 - PERSON
      ?auto_205 - CITY
    )
    :vars
    (
      ?auto_209 - AIRCRAFT
      ?auto_207 - CITY
      ?auto_208 - FLEVEL
      ?auto_210 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_209 ?auto_207 ) ( NEXT ?auto_208 ?auto_210 ) ( not ( = ?auto_205 ?auto_207 ) ) ( not ( = ?auto_210 ?auto_208 ) ) ( FUEL-LEVEL ?auto_209 ?auto_208 ) ( PERSON-AT ?auto_206 ?auto_207 ) )
    :subtasks
    ( ( !BOARD ?auto_206 ?auto_209 ?auto_207 )
      ( TRAVEL ?auto_206 ?auto_205 )
      ( TRAVEL-VERIFY ?auto_206 ?auto_205 ) )
  )

  ( :method TRAVEL
    :parameters
    (
      ?auto_244 - PERSON
      ?auto_243 - CITY
    )
    :vars
    (
      ?auto_245 - AIRCRAFT
      ?auto_246 - CITY
      ?auto_248 - FLEVEL
      ?auto_247 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_245 ?auto_246 ) ( NEXT ?auto_248 ?auto_247 ) ( not ( = ?auto_243 ?auto_246 ) ) ( not ( = ?auto_247 ?auto_248 ) ) ( PERSON-AT ?auto_244 ?auto_246 ) ( FUEL-LEVEL ?auto_245 ?auto_248 ) )
    :subtasks
    ( ( !REFUEL ?auto_245 ?auto_246 ?auto_248 ?auto_247 )
      ( TRAVEL ?auto_244 ?auto_243 )
      ( TRAVEL-VERIFY ?auto_244 ?auto_243 ) )
  )

  ( :method TRAVEL
    :parameters
    (
      ?auto_455 - PERSON
      ?auto_454 - CITY
    )
    :vars
    (
      ?auto_458 - FLEVEL
      ?auto_459 - FLEVEL
      ?auto_457 - CITY
      ?auto_456 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_458 ?auto_459 ) ( not ( = ?auto_454 ?auto_457 ) ) ( not ( = ?auto_459 ?auto_458 ) ) ( PERSON-AT ?auto_455 ?auto_457 ) ( AIRCRAFT-AT ?auto_456 ?auto_454 ) ( FUEL-LEVEL ?auto_456 ?auto_458 ) )
    :subtasks
    ( ( !REFUEL ?auto_456 ?auto_454 ?auto_458 ?auto_459 )
      ( TRAVEL ?auto_455 ?auto_454 )
      ( TRAVEL-VERIFY ?auto_455 ?auto_454 ) )
  )

  ( :method TRAVEL
    :parameters
    (
      ?auto_521 - PERSON
      ?auto_520 - CITY
    )
    :vars
    (
      ?auto_524 - FLEVEL
      ?auto_526 - FLEVEL
      ?auto_523 - CITY
      ?auto_522 - AIRCRAFT
      ?auto_525 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_524 ?auto_526 ) ( not ( = ?auto_520 ?auto_523 ) ) ( not ( = ?auto_526 ?auto_524 ) ) ( PERSON-AT ?auto_521 ?auto_523 ) ( AIRCRAFT-AT ?auto_522 ?auto_525 ) ( not ( = ?auto_520 ?auto_525 ) ) ( not ( = ?auto_523 ?auto_525 ) ) ( FUEL-LEVEL ?auto_522 ?auto_524 ) )
    :subtasks
    ( ( !REFUEL ?auto_522 ?auto_525 ?auto_524 ?auto_526 )
      ( TRAVEL ?auto_521 ?auto_520 )
      ( TRAVEL-VERIFY ?auto_521 ?auto_520 ) )
  )

  ( :method TRAVEL
    :parameters
    (
      ?auto_755 - PERSON
      ?auto_754 - CITY
    )
    :vars
    (
      ?auto_757 - FLEVEL
      ?auto_756 - FLEVEL
      ?auto_760 - CITY
      ?auto_758 - CITY
      ?auto_759 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_757 ?auto_756 ) ( not ( = ?auto_754 ?auto_760 ) ) ( not ( = ?auto_756 ?auto_757 ) ) ( PERSON-AT ?auto_755 ?auto_760 ) ( not ( = ?auto_754 ?auto_758 ) ) ( not ( = ?auto_760 ?auto_758 ) ) ( AIRCRAFT-AT ?auto_759 ?auto_754 ) ( FUEL-LEVEL ?auto_759 ?auto_756 ) )
    :subtasks
    ( ( !FLY ?auto_759 ?auto_754 ?auto_758 ?auto_756 ?auto_757 )
      ( TRAVEL ?auto_755 ?auto_754 )
      ( TRAVEL-VERIFY ?auto_755 ?auto_754 ) )
  )

  ( :method TRAVEL
    :parameters
    (
      ?auto_1099 - PERSON
      ?auto_1098 - CITY
    )
    :vars
    (
      ?auto_1100 - FLEVEL
      ?auto_1101 - FLEVEL
      ?auto_1103 - CITY
      ?auto_1102 - AIRCRAFT
      ?auto_1104 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_1100 ?auto_1101 ) ( not ( = ?auto_1098 ?auto_1103 ) ) ( not ( = ?auto_1101 ?auto_1100 ) ) ( PERSON-AT ?auto_1099 ?auto_1103 ) ( AIRCRAFT-AT ?auto_1102 ?auto_1104 ) ( FUEL-LEVEL ?auto_1102 ?auto_1101 ) ( not ( = ?auto_1098 ?auto_1104 ) ) ( not ( = ?auto_1103 ?auto_1104 ) ) )
    :subtasks
    ( ( !FLY ?auto_1102 ?auto_1104 ?auto_1098 ?auto_1101 ?auto_1100 )
      ( TRAVEL ?auto_1099 ?auto_1098 )
      ( TRAVEL-VERIFY ?auto_1099 ?auto_1098 ) )
  )

  ( :method TRAVEL
    :parameters
    (
      ?auto_1111 - PERSON
      ?auto_1110 - CITY
    )
    :vars
    (
      ?auto_1112 - AIRCRAFT
      ?auto_1116 - CITY
      ?auto_1113 - FLEVEL
      ?auto_1114 - FLEVEL
      ?auto_1115 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_1111 ?auto_1112 ) ( AIRCRAFT-AT ?auto_1112 ?auto_1116 ) ( FUEL-LEVEL ?auto_1112 ?auto_1113 ) ( NEXT ?auto_1114 ?auto_1113 ) ( NEXT ?auto_1115 ?auto_1114 ) ( not ( = ?auto_1110 ?auto_1116 ) ) ( not ( = ?auto_1113 ?auto_1114 ) ) ( not ( = ?auto_1113 ?auto_1115 ) ) ( not ( = ?auto_1114 ?auto_1115 ) ) )
    :subtasks
    ( ( !ZOOM ?auto_1112 ?auto_1116 ?auto_1110 ?auto_1113 ?auto_1114 ?auto_1115 )
      ( TRAVEL ?auto_1111 ?auto_1110 )
      ( TRAVEL-VERIFY ?auto_1111 ?auto_1110 ) )
  )

  ( :method TRAVEL
    :parameters
    (
      ?auto_1222 - PERSON
      ?auto_1221 - CITY
    )
    :vars
    (
      ?auto_1226 - FLEVEL
      ?auto_1225 - FLEVEL
      ?auto_1224 - CITY
      ?auto_1223 - AIRCRAFT
      ?auto_1228 - CITY
      ?auto_1227 - FLEVEL
    )
    :precondition
    ( and ( NEXT ?auto_1226 ?auto_1225 ) ( not ( = ?auto_1221 ?auto_1224 ) ) ( not ( = ?auto_1225 ?auto_1226 ) ) ( PERSON-AT ?auto_1222 ?auto_1224 ) ( AIRCRAFT-AT ?auto_1223 ?auto_1228 ) ( FUEL-LEVEL ?auto_1223 ?auto_1227 ) ( NEXT ?auto_1225 ?auto_1227 ) ( not ( = ?auto_1221 ?auto_1228 ) ) ( not ( = ?auto_1226 ?auto_1227 ) ) ( not ( = ?auto_1225 ?auto_1227 ) ) ( not ( = ?auto_1224 ?auto_1228 ) ) )
    :subtasks
    ( ( !ZOOM ?auto_1223 ?auto_1228 ?auto_1224 ?auto_1227 ?auto_1225 ?auto_1226 )
      ( TRAVEL ?auto_1222 ?auto_1221 )
      ( TRAVEL-VERIFY ?auto_1222 ?auto_1221 ) )
  )

  ( :method TRAVEL
    :parameters
    (
      ?auto_1321 - PERSON
      ?auto_1320 - CITY
    )
    :vars
    (
      ?auto_1324 - FLEVEL
      ?auto_1323 - FLEVEL
      ?auto_1322 - CITY
      ?auto_1325 - AIRCRAFT
      ?auto_1326 - FLEVEL
    )
    :precondition
    ( and ( NEXT ?auto_1324 ?auto_1323 ) ( not ( = ?auto_1320 ?auto_1322 ) ) ( not ( = ?auto_1323 ?auto_1324 ) ) ( PERSON-AT ?auto_1321 ?auto_1322 ) ( AIRCRAFT-AT ?auto_1325 ?auto_1320 ) ( FUEL-LEVEL ?auto_1325 ?auto_1326 ) ( NEXT ?auto_1323 ?auto_1326 ) ( not ( = ?auto_1324 ?auto_1326 ) ) ( not ( = ?auto_1323 ?auto_1326 ) ) )
    :subtasks
    ( ( !ZOOM ?auto_1325 ?auto_1320 ?auto_1322 ?auto_1326 ?auto_1323 ?auto_1324 )
      ( TRAVEL ?auto_1321 ?auto_1320 )
      ( TRAVEL-VERIFY ?auto_1321 ?auto_1320 ) )
  )

)

