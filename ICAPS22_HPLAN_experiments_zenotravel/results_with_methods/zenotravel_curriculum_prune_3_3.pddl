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

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_1125 - PERSON
      ?auto_1124 - CITY
    )
    :vars
    (
      ?auto_1128 - FLEVEL
      ?auto_1127 - FLEVEL
      ?auto_1129 - CITY
      ?auto_1126 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1128 ?auto_1127 ) ( PERSON-AT ?auto_1125 ?auto_1129 ) ( AIRCRAFT-AT ?auto_1126 ?auto_1124 ) ( FUEL-LEVEL ?auto_1126 ?auto_1128 ) ( not ( = ?auto_1124 ?auto_1129 ) ) ( not ( = ?auto_1128 ?auto_1127 ) ) )
    :subtasks
    ( ( !REFUEL ?auto_1126 ?auto_1124 ?auto_1128 ?auto_1127 )
      ( !FLY ?auto_1126 ?auto_1124 ?auto_1129 ?auto_1127 ?auto_1128 )
      ( !REFUEL ?auto_1126 ?auto_1129 ?auto_1128 ?auto_1127 )
      ( !BOARD ?auto_1125 ?auto_1126 ?auto_1129 )
      ( !FLY ?auto_1126 ?auto_1129 ?auto_1124 ?auto_1127 ?auto_1128 )
      ( !DEBARK ?auto_1125 ?auto_1126 ?auto_1124 )
      ( FLY-1PPL-VERIFY ?auto_1125 ?auto_1124 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_1148 - PERSON
      ?auto_1149 - PERSON
      ?auto_1147 - CITY
    )
    :vars
    (
      ?auto_1151 - FLEVEL
      ?auto_1153 - FLEVEL
      ?auto_1150 - CITY
      ?auto_1154 - CITY
      ?auto_1152 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1151 ?auto_1153 ) ( PERSON-AT ?auto_1149 ?auto_1150 ) ( not ( = ?auto_1147 ?auto_1150 ) ) ( not ( = ?auto_1151 ?auto_1153 ) ) ( PERSON-AT ?auto_1148 ?auto_1154 ) ( AIRCRAFT-AT ?auto_1152 ?auto_1147 ) ( FUEL-LEVEL ?auto_1152 ?auto_1151 ) ( not ( = ?auto_1147 ?auto_1154 ) ) ( not ( = ?auto_1148 ?auto_1149 ) ) ( not ( = ?auto_1150 ?auto_1154 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_1148 ?auto_1147 )
      ( FLY-1PPL ?auto_1149 ?auto_1147 )
      ( FLY-2PPL-VERIFY ?auto_1148 ?auto_1149 ?auto_1147 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_1263 - PERSON
      ?auto_1264 - PERSON
      ?auto_1265 - PERSON
      ?auto_1262 - CITY
    )
    :vars
    (
      ?auto_1266 - FLEVEL
      ?auto_1269 - FLEVEL
      ?auto_1267 - CITY
      ?auto_1271 - CITY
      ?auto_1270 - CITY
      ?auto_1268 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1266 ?auto_1269 ) ( PERSON-AT ?auto_1265 ?auto_1267 ) ( not ( = ?auto_1262 ?auto_1267 ) ) ( not ( = ?auto_1266 ?auto_1269 ) ) ( PERSON-AT ?auto_1264 ?auto_1271 ) ( not ( = ?auto_1262 ?auto_1271 ) ) ( PERSON-AT ?auto_1263 ?auto_1270 ) ( AIRCRAFT-AT ?auto_1268 ?auto_1262 ) ( FUEL-LEVEL ?auto_1268 ?auto_1266 ) ( not ( = ?auto_1262 ?auto_1270 ) ) ( not ( = ?auto_1263 ?auto_1264 ) ) ( not ( = ?auto_1271 ?auto_1270 ) ) ( not ( = ?auto_1263 ?auto_1265 ) ) ( not ( = ?auto_1264 ?auto_1265 ) ) ( not ( = ?auto_1267 ?auto_1271 ) ) ( not ( = ?auto_1267 ?auto_1270 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_1263 ?auto_1264 ?auto_1262 )
      ( FLY-1PPL ?auto_1265 ?auto_1262 )
      ( FLY-3PPL-VERIFY ?auto_1263 ?auto_1264 ?auto_1265 ?auto_1262 ) )
  )

)

