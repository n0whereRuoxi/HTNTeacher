( define ( domain logistics )
  ( :requirements :strips :typing :equality :htn )
  ( :types airplane city location obj truck )
  ( :predicates
    ( OBJ-AT ?a - OBJ ?b - LOCATION )
    ( TRUCK-AT ?c - TRUCK ?d - LOCATION )
    ( AIRPLANE-AT ?e - AIRPLANE ?f - LOCATION )
    ( IN-TRUCK ?g - OBJ ?h - TRUCK )
    ( IN-AIRPLANE ?i - OBJ ?j - AIRPLANE )
    ( IN-CITY ?k - LOCATION ?l - CITY )
    ( AIRPORT ?o - LOCATION )
    ( GREATER-THAN ?p - OBJ ?q - OBJ )
  )
  ( :action !LOAD-TRUCK
    :parameters
    (
      ?obj - OBJ
      ?truck - TRUCK
      ?loc - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?truck ?loc ) ( OBJ-AT ?obj ?loc ) )
    :effect
    ( and ( not ( OBJ-AT ?obj ?loc ) ) ( IN-TRUCK ?obj ?truck ) )
  )
  ( :action !LOAD-AIRPLANE
    :parameters
    (
      ?obj - OBJ
      ?airplane - AIRPLANE
      ?loc - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj ?loc ) ( AIRPLANE-AT ?airplane ?loc ) )
    :effect
    ( and ( not ( OBJ-AT ?obj ?loc ) ) ( IN-AIRPLANE ?obj ?airplane ) )
  )
  ( :action !UNLOAD-TRUCK
    :parameters
    (
      ?obj - OBJ
      ?truck - TRUCK
      ?loc - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?truck ?loc ) ( IN-TRUCK ?obj ?truck ) )
    :effect
    ( and ( not ( IN-TRUCK ?obj ?truck ) ) ( OBJ-AT ?obj ?loc ) )
  )
  ( :action !UNLOAD-AIRPLANE
    :parameters
    (
      ?obj - OBJ
      ?airplane - AIRPLANE
      ?loc - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?obj ?airplane ) ( AIRPLANE-AT ?airplane ?loc ) )
    :effect
    ( and ( not ( IN-AIRPLANE ?obj ?airplane ) ) ( OBJ-AT ?obj ?loc ) )
  )
  ( :action !DRIVE-TRUCK
    :parameters
    (
      ?truck - TRUCK
      ?loc-from - LOCATION
      ?loc-to - LOCATION
      ?city - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?truck ?loc-from ) ( IN-CITY ?loc-from ?city ) ( IN-CITY ?loc-to ?city ) ( not ( = ?loc-from ?loc-to ) ) )
    :effect
    ( and ( not ( TRUCK-AT ?truck ?loc-from ) ) ( TRUCK-AT ?truck ?loc-to ) )
  )
  ( :action !FLY-AIRPLANE
    :parameters
    (
      ?airplane - AIRPLANE
      ?loc-from - LOCATION
      ?loc-to - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?loc-from ) ( AIRPORT ?loc-to ) ( AIRPLANE-AT ?airplane ?loc-from ) ( not ( = ?loc-from ?loc-to ) ) )
    :effect
    ( and ( not ( AIRPLANE-AT ?airplane ?loc-from ) ) ( AIRPLANE-AT ?airplane ?loc-to ) )
  )
  ( :method DELIVER-PKG
    :parameters
    (
      ?obj - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-1PKG-VERIFY
    :parameters
    (
      ?obj1 - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj1 ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-2PKG-VERIFY
    :parameters
    (
      ?obj1 - OBJ
      ?obj2 - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj1 ?dst ) ( OBJ-AT ?obj2 ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-3PKG-VERIFY
    :parameters
    (
      ?obj1 - OBJ
      ?obj2 - OBJ
      ?obj3 - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj1 ?dst ) ( OBJ-AT ?obj2 ?dst ) ( OBJ-AT ?obj3 ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-4PKG-VERIFY
    :parameters
    (
      ?obj1 - OBJ
      ?obj2 - OBJ
      ?obj3 - OBJ
      ?obj4 - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj1 ?dst ) ( OBJ-AT ?obj2 ?dst ) ( OBJ-AT ?obj3 ?dst ) ( OBJ-AT ?obj4 ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-5PKG-VERIFY
    :parameters
    (
      ?obj1 - OBJ
      ?obj2 - OBJ
      ?obj3 - OBJ
      ?obj4 - OBJ
      ?obj5 - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj1 ?dst ) ( OBJ-AT ?obj2 ?dst ) ( OBJ-AT ?obj3 ?dst ) ( OBJ-AT ?obj4 ?dst ) ( OBJ-AT ?obj5 ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-6PKG-VERIFY
    :parameters
    (
      ?obj1 - OBJ
      ?obj2 - OBJ
      ?obj3 - OBJ
      ?obj4 - OBJ
      ?obj5 - OBJ
      ?obj6 - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj1 ?dst ) ( OBJ-AT ?obj2 ?dst ) ( OBJ-AT ?obj3 ?dst ) ( OBJ-AT ?obj4 ?dst ) ( OBJ-AT ?obj5 ?dst ) ( OBJ-AT ?obj6 ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1668127 - OBJ
      ?auto_1668126 - LOCATION
    )
    :vars
    (
      ?auto_1668129 - LOCATION
      ?auto_1668130 - CITY
      ?auto_1668128 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1668129 ?auto_1668130 ) ( IN-CITY ?auto_1668126 ?auto_1668130 ) ( not ( = ?auto_1668126 ?auto_1668129 ) ) ( OBJ-AT ?auto_1668127 ?auto_1668129 ) ( TRUCK-AT ?auto_1668128 ?auto_1668126 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1668128 ?auto_1668126 ?auto_1668129 ?auto_1668130 )
      ( !LOAD-TRUCK ?auto_1668127 ?auto_1668128 ?auto_1668129 )
      ( !DRIVE-TRUCK ?auto_1668128 ?auto_1668129 ?auto_1668126 ?auto_1668130 )
      ( !UNLOAD-TRUCK ?auto_1668127 ?auto_1668128 ?auto_1668126 )
      ( DELIVER-1PKG-VERIFY ?auto_1668127 ?auto_1668126 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1668148 - OBJ
      ?auto_1668149 - OBJ
      ?auto_1668147 - LOCATION
    )
    :vars
    (
      ?auto_1668151 - LOCATION
      ?auto_1668150 - CITY
      ?auto_1668152 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1668151 ?auto_1668150 ) ( IN-CITY ?auto_1668147 ?auto_1668150 ) ( not ( = ?auto_1668147 ?auto_1668151 ) ) ( OBJ-AT ?auto_1668149 ?auto_1668151 ) ( OBJ-AT ?auto_1668148 ?auto_1668151 ) ( TRUCK-AT ?auto_1668152 ?auto_1668147 ) ( not ( = ?auto_1668148 ?auto_1668149 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1668148 ?auto_1668147 )
      ( DELIVER-1PKG ?auto_1668149 ?auto_1668147 )
      ( DELIVER-2PKG-VERIFY ?auto_1668148 ?auto_1668149 ?auto_1668147 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1668256 - OBJ
      ?auto_1668257 - OBJ
      ?auto_1668258 - OBJ
      ?auto_1668255 - LOCATION
    )
    :vars
    (
      ?auto_1668259 - LOCATION
      ?auto_1668260 - CITY
      ?auto_1668262 - LOCATION
      ?auto_1668261 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1668259 ?auto_1668260 ) ( IN-CITY ?auto_1668255 ?auto_1668260 ) ( not ( = ?auto_1668255 ?auto_1668259 ) ) ( OBJ-AT ?auto_1668258 ?auto_1668259 ) ( IN-CITY ?auto_1668262 ?auto_1668260 ) ( not ( = ?auto_1668255 ?auto_1668262 ) ) ( OBJ-AT ?auto_1668257 ?auto_1668262 ) ( OBJ-AT ?auto_1668256 ?auto_1668262 ) ( TRUCK-AT ?auto_1668261 ?auto_1668255 ) ( not ( = ?auto_1668256 ?auto_1668257 ) ) ( not ( = ?auto_1668256 ?auto_1668258 ) ) ( not ( = ?auto_1668257 ?auto_1668258 ) ) ( not ( = ?auto_1668259 ?auto_1668262 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1668256 ?auto_1668257 ?auto_1668255 )
      ( DELIVER-1PKG ?auto_1668258 ?auto_1668255 )
      ( DELIVER-3PKG-VERIFY ?auto_1668256 ?auto_1668257 ?auto_1668258 ?auto_1668255 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1668273 - OBJ
      ?auto_1668274 - OBJ
      ?auto_1668275 - OBJ
      ?auto_1668272 - LOCATION
    )
    :vars
    (
      ?auto_1668279 - LOCATION
      ?auto_1668277 - CITY
      ?auto_1668276 - LOCATION
      ?auto_1668278 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1668279 ?auto_1668277 ) ( IN-CITY ?auto_1668272 ?auto_1668277 ) ( not ( = ?auto_1668272 ?auto_1668279 ) ) ( OBJ-AT ?auto_1668274 ?auto_1668279 ) ( IN-CITY ?auto_1668276 ?auto_1668277 ) ( not ( = ?auto_1668272 ?auto_1668276 ) ) ( OBJ-AT ?auto_1668275 ?auto_1668276 ) ( OBJ-AT ?auto_1668273 ?auto_1668276 ) ( TRUCK-AT ?auto_1668278 ?auto_1668272 ) ( not ( = ?auto_1668273 ?auto_1668275 ) ) ( not ( = ?auto_1668273 ?auto_1668274 ) ) ( not ( = ?auto_1668275 ?auto_1668274 ) ) ( not ( = ?auto_1668279 ?auto_1668276 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_1668273 ?auto_1668275 ?auto_1668274 ?auto_1668272 )
      ( DELIVER-3PKG-VERIFY ?auto_1668273 ?auto_1668274 ?auto_1668275 ?auto_1668272 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1668334 - OBJ
      ?auto_1668335 - OBJ
      ?auto_1668336 - OBJ
      ?auto_1668333 - LOCATION
    )
    :vars
    (
      ?auto_1668338 - LOCATION
      ?auto_1668340 - CITY
      ?auto_1668337 - LOCATION
      ?auto_1668339 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1668338 ?auto_1668340 ) ( IN-CITY ?auto_1668333 ?auto_1668340 ) ( not ( = ?auto_1668333 ?auto_1668338 ) ) ( OBJ-AT ?auto_1668334 ?auto_1668338 ) ( IN-CITY ?auto_1668337 ?auto_1668340 ) ( not ( = ?auto_1668333 ?auto_1668337 ) ) ( OBJ-AT ?auto_1668336 ?auto_1668337 ) ( OBJ-AT ?auto_1668335 ?auto_1668337 ) ( TRUCK-AT ?auto_1668339 ?auto_1668333 ) ( not ( = ?auto_1668335 ?auto_1668336 ) ) ( not ( = ?auto_1668335 ?auto_1668334 ) ) ( not ( = ?auto_1668336 ?auto_1668334 ) ) ( not ( = ?auto_1668338 ?auto_1668337 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_1668335 ?auto_1668334 ?auto_1668336 ?auto_1668333 )
      ( DELIVER-3PKG-VERIFY ?auto_1668334 ?auto_1668335 ?auto_1668336 ?auto_1668333 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_1669385 - OBJ
      ?auto_1669386 - OBJ
      ?auto_1669387 - OBJ
      ?auto_1669388 - OBJ
      ?auto_1669384 - LOCATION
    )
    :vars
    (
      ?auto_1669391 - LOCATION
      ?auto_1669390 - CITY
      ?auto_1669393 - LOCATION
      ?auto_1669392 - LOCATION
      ?auto_1669389 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1669391 ?auto_1669390 ) ( IN-CITY ?auto_1669384 ?auto_1669390 ) ( not ( = ?auto_1669384 ?auto_1669391 ) ) ( OBJ-AT ?auto_1669388 ?auto_1669391 ) ( IN-CITY ?auto_1669393 ?auto_1669390 ) ( not ( = ?auto_1669384 ?auto_1669393 ) ) ( OBJ-AT ?auto_1669387 ?auto_1669393 ) ( IN-CITY ?auto_1669392 ?auto_1669390 ) ( not ( = ?auto_1669384 ?auto_1669392 ) ) ( OBJ-AT ?auto_1669386 ?auto_1669392 ) ( OBJ-AT ?auto_1669385 ?auto_1669392 ) ( TRUCK-AT ?auto_1669389 ?auto_1669384 ) ( not ( = ?auto_1669385 ?auto_1669386 ) ) ( not ( = ?auto_1669385 ?auto_1669387 ) ) ( not ( = ?auto_1669386 ?auto_1669387 ) ) ( not ( = ?auto_1669393 ?auto_1669392 ) ) ( not ( = ?auto_1669385 ?auto_1669388 ) ) ( not ( = ?auto_1669386 ?auto_1669388 ) ) ( not ( = ?auto_1669387 ?auto_1669388 ) ) ( not ( = ?auto_1669391 ?auto_1669393 ) ) ( not ( = ?auto_1669391 ?auto_1669392 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_1669385 ?auto_1669387 ?auto_1669386 ?auto_1669384 )
      ( DELIVER-1PKG ?auto_1669388 ?auto_1669384 )
      ( DELIVER-4PKG-VERIFY ?auto_1669385 ?auto_1669386 ?auto_1669387 ?auto_1669388 ?auto_1669384 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_1669444 - OBJ
      ?auto_1669445 - OBJ
      ?auto_1669446 - OBJ
      ?auto_1669447 - OBJ
      ?auto_1669443 - LOCATION
    )
    :vars
    (
      ?auto_1669449 - LOCATION
      ?auto_1669450 - CITY
      ?auto_1669451 - LOCATION
      ?auto_1669452 - LOCATION
      ?auto_1669448 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1669449 ?auto_1669450 ) ( IN-CITY ?auto_1669443 ?auto_1669450 ) ( not ( = ?auto_1669443 ?auto_1669449 ) ) ( OBJ-AT ?auto_1669447 ?auto_1669449 ) ( IN-CITY ?auto_1669451 ?auto_1669450 ) ( not ( = ?auto_1669443 ?auto_1669451 ) ) ( OBJ-AT ?auto_1669445 ?auto_1669451 ) ( IN-CITY ?auto_1669452 ?auto_1669450 ) ( not ( = ?auto_1669443 ?auto_1669452 ) ) ( OBJ-AT ?auto_1669446 ?auto_1669452 ) ( OBJ-AT ?auto_1669444 ?auto_1669452 ) ( TRUCK-AT ?auto_1669448 ?auto_1669443 ) ( not ( = ?auto_1669444 ?auto_1669446 ) ) ( not ( = ?auto_1669444 ?auto_1669445 ) ) ( not ( = ?auto_1669446 ?auto_1669445 ) ) ( not ( = ?auto_1669451 ?auto_1669452 ) ) ( not ( = ?auto_1669444 ?auto_1669447 ) ) ( not ( = ?auto_1669446 ?auto_1669447 ) ) ( not ( = ?auto_1669445 ?auto_1669447 ) ) ( not ( = ?auto_1669449 ?auto_1669451 ) ) ( not ( = ?auto_1669449 ?auto_1669452 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_1669444 ?auto_1669446 ?auto_1669445 ?auto_1669447 ?auto_1669443 )
      ( DELIVER-4PKG-VERIFY ?auto_1669444 ?auto_1669445 ?auto_1669446 ?auto_1669447 ?auto_1669443 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_1669476 - OBJ
      ?auto_1669477 - OBJ
      ?auto_1669478 - OBJ
      ?auto_1669479 - OBJ
      ?auto_1669475 - LOCATION
    )
    :vars
    (
      ?auto_1669483 - LOCATION
      ?auto_1669482 - CITY
      ?auto_1669484 - LOCATION
      ?auto_1669481 - LOCATION
      ?auto_1669480 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1669483 ?auto_1669482 ) ( IN-CITY ?auto_1669475 ?auto_1669482 ) ( not ( = ?auto_1669475 ?auto_1669483 ) ) ( OBJ-AT ?auto_1669478 ?auto_1669483 ) ( IN-CITY ?auto_1669484 ?auto_1669482 ) ( not ( = ?auto_1669475 ?auto_1669484 ) ) ( OBJ-AT ?auto_1669477 ?auto_1669484 ) ( IN-CITY ?auto_1669481 ?auto_1669482 ) ( not ( = ?auto_1669475 ?auto_1669481 ) ) ( OBJ-AT ?auto_1669479 ?auto_1669481 ) ( OBJ-AT ?auto_1669476 ?auto_1669481 ) ( TRUCK-AT ?auto_1669480 ?auto_1669475 ) ( not ( = ?auto_1669476 ?auto_1669479 ) ) ( not ( = ?auto_1669476 ?auto_1669477 ) ) ( not ( = ?auto_1669479 ?auto_1669477 ) ) ( not ( = ?auto_1669484 ?auto_1669481 ) ) ( not ( = ?auto_1669476 ?auto_1669478 ) ) ( not ( = ?auto_1669479 ?auto_1669478 ) ) ( not ( = ?auto_1669477 ?auto_1669478 ) ) ( not ( = ?auto_1669483 ?auto_1669484 ) ) ( not ( = ?auto_1669483 ?auto_1669481 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_1669476 ?auto_1669477 ?auto_1669479 ?auto_1669478 ?auto_1669475 )
      ( DELIVER-4PKG-VERIFY ?auto_1669476 ?auto_1669477 ?auto_1669478 ?auto_1669479 ?auto_1669475 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_1670065 - OBJ
      ?auto_1670066 - OBJ
      ?auto_1670067 - OBJ
      ?auto_1670068 - OBJ
      ?auto_1670064 - LOCATION
    )
    :vars
    (
      ?auto_1670072 - LOCATION
      ?auto_1670071 - CITY
      ?auto_1670073 - LOCATION
      ?auto_1670070 - LOCATION
      ?auto_1670069 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1670072 ?auto_1670071 ) ( IN-CITY ?auto_1670064 ?auto_1670071 ) ( not ( = ?auto_1670064 ?auto_1670072 ) ) ( OBJ-AT ?auto_1670068 ?auto_1670072 ) ( IN-CITY ?auto_1670073 ?auto_1670071 ) ( not ( = ?auto_1670064 ?auto_1670073 ) ) ( OBJ-AT ?auto_1670065 ?auto_1670073 ) ( IN-CITY ?auto_1670070 ?auto_1670071 ) ( not ( = ?auto_1670064 ?auto_1670070 ) ) ( OBJ-AT ?auto_1670067 ?auto_1670070 ) ( OBJ-AT ?auto_1670066 ?auto_1670070 ) ( TRUCK-AT ?auto_1670069 ?auto_1670064 ) ( not ( = ?auto_1670066 ?auto_1670067 ) ) ( not ( = ?auto_1670066 ?auto_1670065 ) ) ( not ( = ?auto_1670067 ?auto_1670065 ) ) ( not ( = ?auto_1670073 ?auto_1670070 ) ) ( not ( = ?auto_1670066 ?auto_1670068 ) ) ( not ( = ?auto_1670067 ?auto_1670068 ) ) ( not ( = ?auto_1670065 ?auto_1670068 ) ) ( not ( = ?auto_1670072 ?auto_1670073 ) ) ( not ( = ?auto_1670072 ?auto_1670070 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_1670066 ?auto_1670065 ?auto_1670067 ?auto_1670068 ?auto_1670064 )
      ( DELIVER-4PKG-VERIFY ?auto_1670065 ?auto_1670066 ?auto_1670067 ?auto_1670068 ?auto_1670064 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_1670097 - OBJ
      ?auto_1670098 - OBJ
      ?auto_1670099 - OBJ
      ?auto_1670100 - OBJ
      ?auto_1670096 - LOCATION
    )
    :vars
    (
      ?auto_1670104 - LOCATION
      ?auto_1670103 - CITY
      ?auto_1670105 - LOCATION
      ?auto_1670102 - LOCATION
      ?auto_1670101 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1670104 ?auto_1670103 ) ( IN-CITY ?auto_1670096 ?auto_1670103 ) ( not ( = ?auto_1670096 ?auto_1670104 ) ) ( OBJ-AT ?auto_1670099 ?auto_1670104 ) ( IN-CITY ?auto_1670105 ?auto_1670103 ) ( not ( = ?auto_1670096 ?auto_1670105 ) ) ( OBJ-AT ?auto_1670097 ?auto_1670105 ) ( IN-CITY ?auto_1670102 ?auto_1670103 ) ( not ( = ?auto_1670096 ?auto_1670102 ) ) ( OBJ-AT ?auto_1670100 ?auto_1670102 ) ( OBJ-AT ?auto_1670098 ?auto_1670102 ) ( TRUCK-AT ?auto_1670101 ?auto_1670096 ) ( not ( = ?auto_1670098 ?auto_1670100 ) ) ( not ( = ?auto_1670098 ?auto_1670097 ) ) ( not ( = ?auto_1670100 ?auto_1670097 ) ) ( not ( = ?auto_1670105 ?auto_1670102 ) ) ( not ( = ?auto_1670098 ?auto_1670099 ) ) ( not ( = ?auto_1670100 ?auto_1670099 ) ) ( not ( = ?auto_1670097 ?auto_1670099 ) ) ( not ( = ?auto_1670104 ?auto_1670105 ) ) ( not ( = ?auto_1670104 ?auto_1670102 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_1670098 ?auto_1670097 ?auto_1670100 ?auto_1670099 ?auto_1670096 )
      ( DELIVER-4PKG-VERIFY ?auto_1670097 ?auto_1670098 ?auto_1670099 ?auto_1670100 ?auto_1670096 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_1670285 - OBJ
      ?auto_1670286 - OBJ
      ?auto_1670287 - OBJ
      ?auto_1670288 - OBJ
      ?auto_1670284 - LOCATION
    )
    :vars
    (
      ?auto_1670292 - LOCATION
      ?auto_1670291 - CITY
      ?auto_1670293 - LOCATION
      ?auto_1670290 - LOCATION
      ?auto_1670289 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1670292 ?auto_1670291 ) ( IN-CITY ?auto_1670284 ?auto_1670291 ) ( not ( = ?auto_1670284 ?auto_1670292 ) ) ( OBJ-AT ?auto_1670286 ?auto_1670292 ) ( IN-CITY ?auto_1670293 ?auto_1670291 ) ( not ( = ?auto_1670284 ?auto_1670293 ) ) ( OBJ-AT ?auto_1670285 ?auto_1670293 ) ( IN-CITY ?auto_1670290 ?auto_1670291 ) ( not ( = ?auto_1670284 ?auto_1670290 ) ) ( OBJ-AT ?auto_1670288 ?auto_1670290 ) ( OBJ-AT ?auto_1670287 ?auto_1670290 ) ( TRUCK-AT ?auto_1670289 ?auto_1670284 ) ( not ( = ?auto_1670287 ?auto_1670288 ) ) ( not ( = ?auto_1670287 ?auto_1670285 ) ) ( not ( = ?auto_1670288 ?auto_1670285 ) ) ( not ( = ?auto_1670293 ?auto_1670290 ) ) ( not ( = ?auto_1670287 ?auto_1670286 ) ) ( not ( = ?auto_1670288 ?auto_1670286 ) ) ( not ( = ?auto_1670285 ?auto_1670286 ) ) ( not ( = ?auto_1670292 ?auto_1670293 ) ) ( not ( = ?auto_1670292 ?auto_1670290 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_1670287 ?auto_1670285 ?auto_1670288 ?auto_1670286 ?auto_1670284 )
      ( DELIVER-4PKG-VERIFY ?auto_1670285 ?auto_1670286 ?auto_1670287 ?auto_1670288 ?auto_1670284 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_1684795 - OBJ
      ?auto_1684796 - OBJ
      ?auto_1684797 - OBJ
      ?auto_1684798 - OBJ
      ?auto_1684799 - OBJ
      ?auto_1684794 - LOCATION
    )
    :vars
    (
      ?auto_1684802 - LOCATION
      ?auto_1684801 - CITY
      ?auto_1684803 - LOCATION
      ?auto_1684804 - LOCATION
      ?auto_1684800 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1684802 ?auto_1684801 ) ( IN-CITY ?auto_1684794 ?auto_1684801 ) ( not ( = ?auto_1684794 ?auto_1684802 ) ) ( OBJ-AT ?auto_1684799 ?auto_1684802 ) ( IN-CITY ?auto_1684803 ?auto_1684801 ) ( not ( = ?auto_1684794 ?auto_1684803 ) ) ( OBJ-AT ?auto_1684798 ?auto_1684803 ) ( IN-CITY ?auto_1684804 ?auto_1684801 ) ( not ( = ?auto_1684794 ?auto_1684804 ) ) ( OBJ-AT ?auto_1684797 ?auto_1684804 ) ( OBJ-AT ?auto_1684796 ?auto_1684802 ) ( OBJ-AT ?auto_1684795 ?auto_1684802 ) ( TRUCK-AT ?auto_1684800 ?auto_1684794 ) ( not ( = ?auto_1684795 ?auto_1684796 ) ) ( not ( = ?auto_1684795 ?auto_1684797 ) ) ( not ( = ?auto_1684796 ?auto_1684797 ) ) ( not ( = ?auto_1684804 ?auto_1684802 ) ) ( not ( = ?auto_1684795 ?auto_1684798 ) ) ( not ( = ?auto_1684796 ?auto_1684798 ) ) ( not ( = ?auto_1684797 ?auto_1684798 ) ) ( not ( = ?auto_1684803 ?auto_1684804 ) ) ( not ( = ?auto_1684803 ?auto_1684802 ) ) ( not ( = ?auto_1684795 ?auto_1684799 ) ) ( not ( = ?auto_1684796 ?auto_1684799 ) ) ( not ( = ?auto_1684797 ?auto_1684799 ) ) ( not ( = ?auto_1684798 ?auto_1684799 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_1684795 ?auto_1684797 ?auto_1684796 ?auto_1684798 ?auto_1684794 )
      ( DELIVER-1PKG ?auto_1684799 ?auto_1684794 )
      ( DELIVER-5PKG-VERIFY ?auto_1684795 ?auto_1684796 ?auto_1684797 ?auto_1684798 ?auto_1684799 ?auto_1684794 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_1684842 - OBJ
      ?auto_1684843 - OBJ
      ?auto_1684844 - OBJ
      ?auto_1684845 - OBJ
      ?auto_1684846 - OBJ
      ?auto_1684841 - LOCATION
    )
    :vars
    (
      ?auto_1684851 - LOCATION
      ?auto_1684848 - CITY
      ?auto_1684849 - LOCATION
      ?auto_1684847 - LOCATION
      ?auto_1684850 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1684851 ?auto_1684848 ) ( IN-CITY ?auto_1684841 ?auto_1684848 ) ( not ( = ?auto_1684841 ?auto_1684851 ) ) ( OBJ-AT ?auto_1684845 ?auto_1684851 ) ( IN-CITY ?auto_1684849 ?auto_1684848 ) ( not ( = ?auto_1684841 ?auto_1684849 ) ) ( OBJ-AT ?auto_1684846 ?auto_1684849 ) ( IN-CITY ?auto_1684847 ?auto_1684848 ) ( not ( = ?auto_1684841 ?auto_1684847 ) ) ( OBJ-AT ?auto_1684844 ?auto_1684847 ) ( OBJ-AT ?auto_1684843 ?auto_1684851 ) ( OBJ-AT ?auto_1684842 ?auto_1684851 ) ( TRUCK-AT ?auto_1684850 ?auto_1684841 ) ( not ( = ?auto_1684842 ?auto_1684843 ) ) ( not ( = ?auto_1684842 ?auto_1684844 ) ) ( not ( = ?auto_1684843 ?auto_1684844 ) ) ( not ( = ?auto_1684847 ?auto_1684851 ) ) ( not ( = ?auto_1684842 ?auto_1684846 ) ) ( not ( = ?auto_1684843 ?auto_1684846 ) ) ( not ( = ?auto_1684844 ?auto_1684846 ) ) ( not ( = ?auto_1684849 ?auto_1684847 ) ) ( not ( = ?auto_1684849 ?auto_1684851 ) ) ( not ( = ?auto_1684842 ?auto_1684845 ) ) ( not ( = ?auto_1684843 ?auto_1684845 ) ) ( not ( = ?auto_1684844 ?auto_1684845 ) ) ( not ( = ?auto_1684846 ?auto_1684845 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_1684842 ?auto_1684843 ?auto_1684844 ?auto_1684846 ?auto_1684845 ?auto_1684841 )
      ( DELIVER-5PKG-VERIFY ?auto_1684842 ?auto_1684843 ?auto_1684844 ?auto_1684845 ?auto_1684846 ?auto_1684841 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_1685123 - OBJ
      ?auto_1685124 - OBJ
      ?auto_1685125 - OBJ
      ?auto_1685126 - OBJ
      ?auto_1685127 - OBJ
      ?auto_1685122 - LOCATION
    )
    :vars
    (
      ?auto_1685128 - LOCATION
      ?auto_1685132 - CITY
      ?auto_1685130 - LOCATION
      ?auto_1685131 - LOCATION
      ?auto_1685129 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1685128 ?auto_1685132 ) ( IN-CITY ?auto_1685122 ?auto_1685132 ) ( not ( = ?auto_1685122 ?auto_1685128 ) ) ( OBJ-AT ?auto_1685125 ?auto_1685128 ) ( IN-CITY ?auto_1685130 ?auto_1685132 ) ( not ( = ?auto_1685122 ?auto_1685130 ) ) ( OBJ-AT ?auto_1685127 ?auto_1685130 ) ( IN-CITY ?auto_1685131 ?auto_1685132 ) ( not ( = ?auto_1685122 ?auto_1685131 ) ) ( OBJ-AT ?auto_1685126 ?auto_1685131 ) ( OBJ-AT ?auto_1685124 ?auto_1685128 ) ( OBJ-AT ?auto_1685123 ?auto_1685128 ) ( TRUCK-AT ?auto_1685129 ?auto_1685122 ) ( not ( = ?auto_1685123 ?auto_1685124 ) ) ( not ( = ?auto_1685123 ?auto_1685126 ) ) ( not ( = ?auto_1685124 ?auto_1685126 ) ) ( not ( = ?auto_1685131 ?auto_1685128 ) ) ( not ( = ?auto_1685123 ?auto_1685127 ) ) ( not ( = ?auto_1685124 ?auto_1685127 ) ) ( not ( = ?auto_1685126 ?auto_1685127 ) ) ( not ( = ?auto_1685130 ?auto_1685131 ) ) ( not ( = ?auto_1685130 ?auto_1685128 ) ) ( not ( = ?auto_1685123 ?auto_1685125 ) ) ( not ( = ?auto_1685124 ?auto_1685125 ) ) ( not ( = ?auto_1685126 ?auto_1685125 ) ) ( not ( = ?auto_1685127 ?auto_1685125 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_1685123 ?auto_1685124 ?auto_1685126 ?auto_1685125 ?auto_1685127 ?auto_1685122 )
      ( DELIVER-5PKG-VERIFY ?auto_1685123 ?auto_1685124 ?auto_1685125 ?auto_1685126 ?auto_1685127 ?auto_1685122 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_1685412 - OBJ
      ?auto_1685413 - OBJ
      ?auto_1685414 - OBJ
      ?auto_1685415 - OBJ
      ?auto_1685416 - OBJ
      ?auto_1685411 - LOCATION
    )
    :vars
    (
      ?auto_1685417 - LOCATION
      ?auto_1685421 - CITY
      ?auto_1685419 - LOCATION
      ?auto_1685420 - LOCATION
      ?auto_1685418 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1685417 ?auto_1685421 ) ( IN-CITY ?auto_1685411 ?auto_1685421 ) ( not ( = ?auto_1685411 ?auto_1685417 ) ) ( OBJ-AT ?auto_1685416 ?auto_1685417 ) ( IN-CITY ?auto_1685419 ?auto_1685421 ) ( not ( = ?auto_1685411 ?auto_1685419 ) ) ( OBJ-AT ?auto_1685415 ?auto_1685419 ) ( IN-CITY ?auto_1685420 ?auto_1685421 ) ( not ( = ?auto_1685411 ?auto_1685420 ) ) ( OBJ-AT ?auto_1685413 ?auto_1685420 ) ( OBJ-AT ?auto_1685414 ?auto_1685417 ) ( OBJ-AT ?auto_1685412 ?auto_1685417 ) ( TRUCK-AT ?auto_1685418 ?auto_1685411 ) ( not ( = ?auto_1685412 ?auto_1685414 ) ) ( not ( = ?auto_1685412 ?auto_1685413 ) ) ( not ( = ?auto_1685414 ?auto_1685413 ) ) ( not ( = ?auto_1685420 ?auto_1685417 ) ) ( not ( = ?auto_1685412 ?auto_1685415 ) ) ( not ( = ?auto_1685414 ?auto_1685415 ) ) ( not ( = ?auto_1685413 ?auto_1685415 ) ) ( not ( = ?auto_1685419 ?auto_1685420 ) ) ( not ( = ?auto_1685419 ?auto_1685417 ) ) ( not ( = ?auto_1685412 ?auto_1685416 ) ) ( not ( = ?auto_1685414 ?auto_1685416 ) ) ( not ( = ?auto_1685413 ?auto_1685416 ) ) ( not ( = ?auto_1685415 ?auto_1685416 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_1685412 ?auto_1685414 ?auto_1685413 ?auto_1685416 ?auto_1685415 ?auto_1685411 )
      ( DELIVER-5PKG-VERIFY ?auto_1685412 ?auto_1685413 ?auto_1685414 ?auto_1685415 ?auto_1685416 ?auto_1685411 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_1685459 - OBJ
      ?auto_1685460 - OBJ
      ?auto_1685461 - OBJ
      ?auto_1685462 - OBJ
      ?auto_1685463 - OBJ
      ?auto_1685458 - LOCATION
    )
    :vars
    (
      ?auto_1685464 - LOCATION
      ?auto_1685468 - CITY
      ?auto_1685466 - LOCATION
      ?auto_1685467 - LOCATION
      ?auto_1685465 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1685464 ?auto_1685468 ) ( IN-CITY ?auto_1685458 ?auto_1685468 ) ( not ( = ?auto_1685458 ?auto_1685464 ) ) ( OBJ-AT ?auto_1685462 ?auto_1685464 ) ( IN-CITY ?auto_1685466 ?auto_1685468 ) ( not ( = ?auto_1685458 ?auto_1685466 ) ) ( OBJ-AT ?auto_1685463 ?auto_1685466 ) ( IN-CITY ?auto_1685467 ?auto_1685468 ) ( not ( = ?auto_1685458 ?auto_1685467 ) ) ( OBJ-AT ?auto_1685460 ?auto_1685467 ) ( OBJ-AT ?auto_1685461 ?auto_1685464 ) ( OBJ-AT ?auto_1685459 ?auto_1685464 ) ( TRUCK-AT ?auto_1685465 ?auto_1685458 ) ( not ( = ?auto_1685459 ?auto_1685461 ) ) ( not ( = ?auto_1685459 ?auto_1685460 ) ) ( not ( = ?auto_1685461 ?auto_1685460 ) ) ( not ( = ?auto_1685467 ?auto_1685464 ) ) ( not ( = ?auto_1685459 ?auto_1685463 ) ) ( not ( = ?auto_1685461 ?auto_1685463 ) ) ( not ( = ?auto_1685460 ?auto_1685463 ) ) ( not ( = ?auto_1685466 ?auto_1685467 ) ) ( not ( = ?auto_1685466 ?auto_1685464 ) ) ( not ( = ?auto_1685459 ?auto_1685462 ) ) ( not ( = ?auto_1685461 ?auto_1685462 ) ) ( not ( = ?auto_1685460 ?auto_1685462 ) ) ( not ( = ?auto_1685463 ?auto_1685462 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_1685459 ?auto_1685461 ?auto_1685460 ?auto_1685462 ?auto_1685463 ?auto_1685458 )
      ( DELIVER-5PKG-VERIFY ?auto_1685459 ?auto_1685460 ?auto_1685461 ?auto_1685462 ?auto_1685463 ?auto_1685458 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_1685607 - OBJ
      ?auto_1685608 - OBJ
      ?auto_1685609 - OBJ
      ?auto_1685610 - OBJ
      ?auto_1685611 - OBJ
      ?auto_1685606 - LOCATION
    )
    :vars
    (
      ?auto_1685612 - LOCATION
      ?auto_1685616 - CITY
      ?auto_1685614 - LOCATION
      ?auto_1685615 - LOCATION
      ?auto_1685613 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1685612 ?auto_1685616 ) ( IN-CITY ?auto_1685606 ?auto_1685616 ) ( not ( = ?auto_1685606 ?auto_1685612 ) ) ( OBJ-AT ?auto_1685611 ?auto_1685612 ) ( IN-CITY ?auto_1685614 ?auto_1685616 ) ( not ( = ?auto_1685606 ?auto_1685614 ) ) ( OBJ-AT ?auto_1685609 ?auto_1685614 ) ( IN-CITY ?auto_1685615 ?auto_1685616 ) ( not ( = ?auto_1685606 ?auto_1685615 ) ) ( OBJ-AT ?auto_1685608 ?auto_1685615 ) ( OBJ-AT ?auto_1685610 ?auto_1685612 ) ( OBJ-AT ?auto_1685607 ?auto_1685612 ) ( TRUCK-AT ?auto_1685613 ?auto_1685606 ) ( not ( = ?auto_1685607 ?auto_1685610 ) ) ( not ( = ?auto_1685607 ?auto_1685608 ) ) ( not ( = ?auto_1685610 ?auto_1685608 ) ) ( not ( = ?auto_1685615 ?auto_1685612 ) ) ( not ( = ?auto_1685607 ?auto_1685609 ) ) ( not ( = ?auto_1685610 ?auto_1685609 ) ) ( not ( = ?auto_1685608 ?auto_1685609 ) ) ( not ( = ?auto_1685614 ?auto_1685615 ) ) ( not ( = ?auto_1685614 ?auto_1685612 ) ) ( not ( = ?auto_1685607 ?auto_1685611 ) ) ( not ( = ?auto_1685610 ?auto_1685611 ) ) ( not ( = ?auto_1685608 ?auto_1685611 ) ) ( not ( = ?auto_1685609 ?auto_1685611 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_1685607 ?auto_1685610 ?auto_1685608 ?auto_1685611 ?auto_1685609 ?auto_1685606 )
      ( DELIVER-5PKG-VERIFY ?auto_1685607 ?auto_1685608 ?auto_1685609 ?auto_1685610 ?auto_1685611 ?auto_1685606 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_1692858 - OBJ
      ?auto_1692859 - OBJ
      ?auto_1692860 - OBJ
      ?auto_1692861 - OBJ
      ?auto_1692862 - OBJ
      ?auto_1692857 - LOCATION
    )
    :vars
    (
      ?auto_1692863 - LOCATION
      ?auto_1692867 - CITY
      ?auto_1692865 - LOCATION
      ?auto_1692866 - LOCATION
      ?auto_1692864 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1692863 ?auto_1692867 ) ( IN-CITY ?auto_1692857 ?auto_1692867 ) ( not ( = ?auto_1692857 ?auto_1692863 ) ) ( OBJ-AT ?auto_1692862 ?auto_1692863 ) ( IN-CITY ?auto_1692865 ?auto_1692867 ) ( not ( = ?auto_1692857 ?auto_1692865 ) ) ( OBJ-AT ?auto_1692861 ?auto_1692865 ) ( IN-CITY ?auto_1692866 ?auto_1692867 ) ( not ( = ?auto_1692857 ?auto_1692866 ) ) ( OBJ-AT ?auto_1692858 ?auto_1692866 ) ( OBJ-AT ?auto_1692860 ?auto_1692863 ) ( OBJ-AT ?auto_1692859 ?auto_1692863 ) ( TRUCK-AT ?auto_1692864 ?auto_1692857 ) ( not ( = ?auto_1692859 ?auto_1692860 ) ) ( not ( = ?auto_1692859 ?auto_1692858 ) ) ( not ( = ?auto_1692860 ?auto_1692858 ) ) ( not ( = ?auto_1692866 ?auto_1692863 ) ) ( not ( = ?auto_1692859 ?auto_1692861 ) ) ( not ( = ?auto_1692860 ?auto_1692861 ) ) ( not ( = ?auto_1692858 ?auto_1692861 ) ) ( not ( = ?auto_1692865 ?auto_1692866 ) ) ( not ( = ?auto_1692865 ?auto_1692863 ) ) ( not ( = ?auto_1692859 ?auto_1692862 ) ) ( not ( = ?auto_1692860 ?auto_1692862 ) ) ( not ( = ?auto_1692858 ?auto_1692862 ) ) ( not ( = ?auto_1692861 ?auto_1692862 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_1692859 ?auto_1692860 ?auto_1692858 ?auto_1692862 ?auto_1692861 ?auto_1692857 )
      ( DELIVER-5PKG-VERIFY ?auto_1692858 ?auto_1692859 ?auto_1692860 ?auto_1692861 ?auto_1692862 ?auto_1692857 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_1692905 - OBJ
      ?auto_1692906 - OBJ
      ?auto_1692907 - OBJ
      ?auto_1692908 - OBJ
      ?auto_1692909 - OBJ
      ?auto_1692904 - LOCATION
    )
    :vars
    (
      ?auto_1692910 - LOCATION
      ?auto_1692914 - CITY
      ?auto_1692912 - LOCATION
      ?auto_1692913 - LOCATION
      ?auto_1692911 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1692910 ?auto_1692914 ) ( IN-CITY ?auto_1692904 ?auto_1692914 ) ( not ( = ?auto_1692904 ?auto_1692910 ) ) ( OBJ-AT ?auto_1692908 ?auto_1692910 ) ( IN-CITY ?auto_1692912 ?auto_1692914 ) ( not ( = ?auto_1692904 ?auto_1692912 ) ) ( OBJ-AT ?auto_1692909 ?auto_1692912 ) ( IN-CITY ?auto_1692913 ?auto_1692914 ) ( not ( = ?auto_1692904 ?auto_1692913 ) ) ( OBJ-AT ?auto_1692905 ?auto_1692913 ) ( OBJ-AT ?auto_1692907 ?auto_1692910 ) ( OBJ-AT ?auto_1692906 ?auto_1692910 ) ( TRUCK-AT ?auto_1692911 ?auto_1692904 ) ( not ( = ?auto_1692906 ?auto_1692907 ) ) ( not ( = ?auto_1692906 ?auto_1692905 ) ) ( not ( = ?auto_1692907 ?auto_1692905 ) ) ( not ( = ?auto_1692913 ?auto_1692910 ) ) ( not ( = ?auto_1692906 ?auto_1692909 ) ) ( not ( = ?auto_1692907 ?auto_1692909 ) ) ( not ( = ?auto_1692905 ?auto_1692909 ) ) ( not ( = ?auto_1692912 ?auto_1692913 ) ) ( not ( = ?auto_1692912 ?auto_1692910 ) ) ( not ( = ?auto_1692906 ?auto_1692908 ) ) ( not ( = ?auto_1692907 ?auto_1692908 ) ) ( not ( = ?auto_1692905 ?auto_1692908 ) ) ( not ( = ?auto_1692909 ?auto_1692908 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_1692906 ?auto_1692907 ?auto_1692905 ?auto_1692908 ?auto_1692909 ?auto_1692904 )
      ( DELIVER-5PKG-VERIFY ?auto_1692905 ?auto_1692906 ?auto_1692907 ?auto_1692908 ?auto_1692909 ?auto_1692904 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_1693053 - OBJ
      ?auto_1693054 - OBJ
      ?auto_1693055 - OBJ
      ?auto_1693056 - OBJ
      ?auto_1693057 - OBJ
      ?auto_1693052 - LOCATION
    )
    :vars
    (
      ?auto_1693058 - LOCATION
      ?auto_1693062 - CITY
      ?auto_1693060 - LOCATION
      ?auto_1693061 - LOCATION
      ?auto_1693059 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1693058 ?auto_1693062 ) ( IN-CITY ?auto_1693052 ?auto_1693062 ) ( not ( = ?auto_1693052 ?auto_1693058 ) ) ( OBJ-AT ?auto_1693057 ?auto_1693058 ) ( IN-CITY ?auto_1693060 ?auto_1693062 ) ( not ( = ?auto_1693052 ?auto_1693060 ) ) ( OBJ-AT ?auto_1693055 ?auto_1693060 ) ( IN-CITY ?auto_1693061 ?auto_1693062 ) ( not ( = ?auto_1693052 ?auto_1693061 ) ) ( OBJ-AT ?auto_1693053 ?auto_1693061 ) ( OBJ-AT ?auto_1693056 ?auto_1693058 ) ( OBJ-AT ?auto_1693054 ?auto_1693058 ) ( TRUCK-AT ?auto_1693059 ?auto_1693052 ) ( not ( = ?auto_1693054 ?auto_1693056 ) ) ( not ( = ?auto_1693054 ?auto_1693053 ) ) ( not ( = ?auto_1693056 ?auto_1693053 ) ) ( not ( = ?auto_1693061 ?auto_1693058 ) ) ( not ( = ?auto_1693054 ?auto_1693055 ) ) ( not ( = ?auto_1693056 ?auto_1693055 ) ) ( not ( = ?auto_1693053 ?auto_1693055 ) ) ( not ( = ?auto_1693060 ?auto_1693061 ) ) ( not ( = ?auto_1693060 ?auto_1693058 ) ) ( not ( = ?auto_1693054 ?auto_1693057 ) ) ( not ( = ?auto_1693056 ?auto_1693057 ) ) ( not ( = ?auto_1693053 ?auto_1693057 ) ) ( not ( = ?auto_1693055 ?auto_1693057 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_1693054 ?auto_1693056 ?auto_1693053 ?auto_1693057 ?auto_1693055 ?auto_1693052 )
      ( DELIVER-5PKG-VERIFY ?auto_1693053 ?auto_1693054 ?auto_1693055 ?auto_1693056 ?auto_1693057 ?auto_1693052 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_1694948 - OBJ
      ?auto_1694949 - OBJ
      ?auto_1694950 - OBJ
      ?auto_1694951 - OBJ
      ?auto_1694952 - OBJ
      ?auto_1694947 - LOCATION
    )
    :vars
    (
      ?auto_1694953 - LOCATION
      ?auto_1694957 - CITY
      ?auto_1694955 - LOCATION
      ?auto_1694956 - LOCATION
      ?auto_1694954 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1694953 ?auto_1694957 ) ( IN-CITY ?auto_1694947 ?auto_1694957 ) ( not ( = ?auto_1694947 ?auto_1694953 ) ) ( OBJ-AT ?auto_1694952 ?auto_1694953 ) ( IN-CITY ?auto_1694955 ?auto_1694957 ) ( not ( = ?auto_1694947 ?auto_1694955 ) ) ( OBJ-AT ?auto_1694949 ?auto_1694955 ) ( IN-CITY ?auto_1694956 ?auto_1694957 ) ( not ( = ?auto_1694947 ?auto_1694956 ) ) ( OBJ-AT ?auto_1694948 ?auto_1694956 ) ( OBJ-AT ?auto_1694951 ?auto_1694953 ) ( OBJ-AT ?auto_1694950 ?auto_1694953 ) ( TRUCK-AT ?auto_1694954 ?auto_1694947 ) ( not ( = ?auto_1694950 ?auto_1694951 ) ) ( not ( = ?auto_1694950 ?auto_1694948 ) ) ( not ( = ?auto_1694951 ?auto_1694948 ) ) ( not ( = ?auto_1694956 ?auto_1694953 ) ) ( not ( = ?auto_1694950 ?auto_1694949 ) ) ( not ( = ?auto_1694951 ?auto_1694949 ) ) ( not ( = ?auto_1694948 ?auto_1694949 ) ) ( not ( = ?auto_1694955 ?auto_1694956 ) ) ( not ( = ?auto_1694955 ?auto_1694953 ) ) ( not ( = ?auto_1694950 ?auto_1694952 ) ) ( not ( = ?auto_1694951 ?auto_1694952 ) ) ( not ( = ?auto_1694948 ?auto_1694952 ) ) ( not ( = ?auto_1694949 ?auto_1694952 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_1694950 ?auto_1694951 ?auto_1694948 ?auto_1694952 ?auto_1694949 ?auto_1694947 )
      ( DELIVER-5PKG-VERIFY ?auto_1694948 ?auto_1694949 ?auto_1694950 ?auto_1694951 ?auto_1694952 ?auto_1694947 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_1939240 - OBJ
      ?auto_1939241 - OBJ
      ?auto_1939242 - OBJ
      ?auto_1939243 - OBJ
      ?auto_1939244 - OBJ
      ?auto_1939245 - OBJ
      ?auto_1939239 - LOCATION
    )
    :vars
    (
      ?auto_1939248 - LOCATION
      ?auto_1939246 - CITY
      ?auto_1939249 - LOCATION
      ?auto_1939250 - LOCATION
      ?auto_1939247 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1939248 ?auto_1939246 ) ( IN-CITY ?auto_1939239 ?auto_1939246 ) ( not ( = ?auto_1939239 ?auto_1939248 ) ) ( OBJ-AT ?auto_1939245 ?auto_1939248 ) ( IN-CITY ?auto_1939249 ?auto_1939246 ) ( not ( = ?auto_1939239 ?auto_1939249 ) ) ( OBJ-AT ?auto_1939244 ?auto_1939249 ) ( IN-CITY ?auto_1939250 ?auto_1939246 ) ( not ( = ?auto_1939239 ?auto_1939250 ) ) ( OBJ-AT ?auto_1939243 ?auto_1939250 ) ( OBJ-AT ?auto_1939242 ?auto_1939248 ) ( OBJ-AT ?auto_1939241 ?auto_1939249 ) ( OBJ-AT ?auto_1939240 ?auto_1939249 ) ( TRUCK-AT ?auto_1939247 ?auto_1939239 ) ( not ( = ?auto_1939240 ?auto_1939241 ) ) ( not ( = ?auto_1939240 ?auto_1939242 ) ) ( not ( = ?auto_1939241 ?auto_1939242 ) ) ( not ( = ?auto_1939248 ?auto_1939249 ) ) ( not ( = ?auto_1939240 ?auto_1939243 ) ) ( not ( = ?auto_1939241 ?auto_1939243 ) ) ( not ( = ?auto_1939242 ?auto_1939243 ) ) ( not ( = ?auto_1939250 ?auto_1939248 ) ) ( not ( = ?auto_1939250 ?auto_1939249 ) ) ( not ( = ?auto_1939240 ?auto_1939244 ) ) ( not ( = ?auto_1939241 ?auto_1939244 ) ) ( not ( = ?auto_1939242 ?auto_1939244 ) ) ( not ( = ?auto_1939243 ?auto_1939244 ) ) ( not ( = ?auto_1939240 ?auto_1939245 ) ) ( not ( = ?auto_1939241 ?auto_1939245 ) ) ( not ( = ?auto_1939242 ?auto_1939245 ) ) ( not ( = ?auto_1939243 ?auto_1939245 ) ) ( not ( = ?auto_1939244 ?auto_1939245 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_1939240 ?auto_1939241 ?auto_1939242 ?auto_1939244 ?auto_1939243 ?auto_1939239 )
      ( DELIVER-1PKG ?auto_1939245 ?auto_1939239 )
      ( DELIVER-6PKG-VERIFY ?auto_1939240 ?auto_1939241 ?auto_1939242 ?auto_1939243 ?auto_1939244 ?auto_1939245 ?auto_1939239 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_1939304 - OBJ
      ?auto_1939305 - OBJ
      ?auto_1939306 - OBJ
      ?auto_1939307 - OBJ
      ?auto_1939308 - OBJ
      ?auto_1939309 - OBJ
      ?auto_1939303 - LOCATION
    )
    :vars
    (
      ?auto_1939313 - LOCATION
      ?auto_1939310 - CITY
      ?auto_1939311 - LOCATION
      ?auto_1939312 - LOCATION
      ?auto_1939314 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1939313 ?auto_1939310 ) ( IN-CITY ?auto_1939303 ?auto_1939310 ) ( not ( = ?auto_1939303 ?auto_1939313 ) ) ( OBJ-AT ?auto_1939308 ?auto_1939313 ) ( IN-CITY ?auto_1939311 ?auto_1939310 ) ( not ( = ?auto_1939303 ?auto_1939311 ) ) ( OBJ-AT ?auto_1939309 ?auto_1939311 ) ( IN-CITY ?auto_1939312 ?auto_1939310 ) ( not ( = ?auto_1939303 ?auto_1939312 ) ) ( OBJ-AT ?auto_1939307 ?auto_1939312 ) ( OBJ-AT ?auto_1939306 ?auto_1939313 ) ( OBJ-AT ?auto_1939305 ?auto_1939311 ) ( OBJ-AT ?auto_1939304 ?auto_1939311 ) ( TRUCK-AT ?auto_1939314 ?auto_1939303 ) ( not ( = ?auto_1939304 ?auto_1939305 ) ) ( not ( = ?auto_1939304 ?auto_1939306 ) ) ( not ( = ?auto_1939305 ?auto_1939306 ) ) ( not ( = ?auto_1939313 ?auto_1939311 ) ) ( not ( = ?auto_1939304 ?auto_1939307 ) ) ( not ( = ?auto_1939305 ?auto_1939307 ) ) ( not ( = ?auto_1939306 ?auto_1939307 ) ) ( not ( = ?auto_1939312 ?auto_1939313 ) ) ( not ( = ?auto_1939312 ?auto_1939311 ) ) ( not ( = ?auto_1939304 ?auto_1939309 ) ) ( not ( = ?auto_1939305 ?auto_1939309 ) ) ( not ( = ?auto_1939306 ?auto_1939309 ) ) ( not ( = ?auto_1939307 ?auto_1939309 ) ) ( not ( = ?auto_1939304 ?auto_1939308 ) ) ( not ( = ?auto_1939305 ?auto_1939308 ) ) ( not ( = ?auto_1939306 ?auto_1939308 ) ) ( not ( = ?auto_1939307 ?auto_1939308 ) ) ( not ( = ?auto_1939309 ?auto_1939308 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_1939304 ?auto_1939305 ?auto_1939306 ?auto_1939307 ?auto_1939309 ?auto_1939308 ?auto_1939303 )
      ( DELIVER-6PKG-VERIFY ?auto_1939304 ?auto_1939305 ?auto_1939306 ?auto_1939307 ?auto_1939308 ?auto_1939309 ?auto_1939303 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_1939368 - OBJ
      ?auto_1939369 - OBJ
      ?auto_1939370 - OBJ
      ?auto_1939371 - OBJ
      ?auto_1939372 - OBJ
      ?auto_1939373 - OBJ
      ?auto_1939367 - LOCATION
    )
    :vars
    (
      ?auto_1939378 - LOCATION
      ?auto_1939375 - CITY
      ?auto_1939374 - LOCATION
      ?auto_1939377 - LOCATION
      ?auto_1939376 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1939378 ?auto_1939375 ) ( IN-CITY ?auto_1939367 ?auto_1939375 ) ( not ( = ?auto_1939367 ?auto_1939378 ) ) ( OBJ-AT ?auto_1939373 ?auto_1939378 ) ( IN-CITY ?auto_1939374 ?auto_1939375 ) ( not ( = ?auto_1939367 ?auto_1939374 ) ) ( OBJ-AT ?auto_1939371 ?auto_1939374 ) ( IN-CITY ?auto_1939377 ?auto_1939375 ) ( not ( = ?auto_1939367 ?auto_1939377 ) ) ( OBJ-AT ?auto_1939372 ?auto_1939377 ) ( OBJ-AT ?auto_1939370 ?auto_1939378 ) ( OBJ-AT ?auto_1939369 ?auto_1939374 ) ( OBJ-AT ?auto_1939368 ?auto_1939374 ) ( TRUCK-AT ?auto_1939376 ?auto_1939367 ) ( not ( = ?auto_1939368 ?auto_1939369 ) ) ( not ( = ?auto_1939368 ?auto_1939370 ) ) ( not ( = ?auto_1939369 ?auto_1939370 ) ) ( not ( = ?auto_1939378 ?auto_1939374 ) ) ( not ( = ?auto_1939368 ?auto_1939372 ) ) ( not ( = ?auto_1939369 ?auto_1939372 ) ) ( not ( = ?auto_1939370 ?auto_1939372 ) ) ( not ( = ?auto_1939377 ?auto_1939378 ) ) ( not ( = ?auto_1939377 ?auto_1939374 ) ) ( not ( = ?auto_1939368 ?auto_1939371 ) ) ( not ( = ?auto_1939369 ?auto_1939371 ) ) ( not ( = ?auto_1939370 ?auto_1939371 ) ) ( not ( = ?auto_1939372 ?auto_1939371 ) ) ( not ( = ?auto_1939368 ?auto_1939373 ) ) ( not ( = ?auto_1939369 ?auto_1939373 ) ) ( not ( = ?auto_1939370 ?auto_1939373 ) ) ( not ( = ?auto_1939372 ?auto_1939373 ) ) ( not ( = ?auto_1939371 ?auto_1939373 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_1939368 ?auto_1939369 ?auto_1939370 ?auto_1939372 ?auto_1939373 ?auto_1939371 ?auto_1939367 )
      ( DELIVER-6PKG-VERIFY ?auto_1939368 ?auto_1939369 ?auto_1939370 ?auto_1939371 ?auto_1939372 ?auto_1939373 ?auto_1939367 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_1939432 - OBJ
      ?auto_1939433 - OBJ
      ?auto_1939434 - OBJ
      ?auto_1939435 - OBJ
      ?auto_1939436 - OBJ
      ?auto_1939437 - OBJ
      ?auto_1939431 - LOCATION
    )
    :vars
    (
      ?auto_1939442 - LOCATION
      ?auto_1939439 - CITY
      ?auto_1939438 - LOCATION
      ?auto_1939441 - LOCATION
      ?auto_1939440 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1939442 ?auto_1939439 ) ( IN-CITY ?auto_1939431 ?auto_1939439 ) ( not ( = ?auto_1939431 ?auto_1939442 ) ) ( OBJ-AT ?auto_1939436 ?auto_1939442 ) ( IN-CITY ?auto_1939438 ?auto_1939439 ) ( not ( = ?auto_1939431 ?auto_1939438 ) ) ( OBJ-AT ?auto_1939435 ?auto_1939438 ) ( IN-CITY ?auto_1939441 ?auto_1939439 ) ( not ( = ?auto_1939431 ?auto_1939441 ) ) ( OBJ-AT ?auto_1939437 ?auto_1939441 ) ( OBJ-AT ?auto_1939434 ?auto_1939442 ) ( OBJ-AT ?auto_1939433 ?auto_1939438 ) ( OBJ-AT ?auto_1939432 ?auto_1939438 ) ( TRUCK-AT ?auto_1939440 ?auto_1939431 ) ( not ( = ?auto_1939432 ?auto_1939433 ) ) ( not ( = ?auto_1939432 ?auto_1939434 ) ) ( not ( = ?auto_1939433 ?auto_1939434 ) ) ( not ( = ?auto_1939442 ?auto_1939438 ) ) ( not ( = ?auto_1939432 ?auto_1939437 ) ) ( not ( = ?auto_1939433 ?auto_1939437 ) ) ( not ( = ?auto_1939434 ?auto_1939437 ) ) ( not ( = ?auto_1939441 ?auto_1939442 ) ) ( not ( = ?auto_1939441 ?auto_1939438 ) ) ( not ( = ?auto_1939432 ?auto_1939435 ) ) ( not ( = ?auto_1939433 ?auto_1939435 ) ) ( not ( = ?auto_1939434 ?auto_1939435 ) ) ( not ( = ?auto_1939437 ?auto_1939435 ) ) ( not ( = ?auto_1939432 ?auto_1939436 ) ) ( not ( = ?auto_1939433 ?auto_1939436 ) ) ( not ( = ?auto_1939434 ?auto_1939436 ) ) ( not ( = ?auto_1939437 ?auto_1939436 ) ) ( not ( = ?auto_1939435 ?auto_1939436 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_1939432 ?auto_1939433 ?auto_1939434 ?auto_1939437 ?auto_1939436 ?auto_1939435 ?auto_1939431 )
      ( DELIVER-6PKG-VERIFY ?auto_1939432 ?auto_1939433 ?auto_1939434 ?auto_1939435 ?auto_1939436 ?auto_1939437 ?auto_1939431 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_1939768 - OBJ
      ?auto_1939769 - OBJ
      ?auto_1939770 - OBJ
      ?auto_1939771 - OBJ
      ?auto_1939772 - OBJ
      ?auto_1939773 - OBJ
      ?auto_1939767 - LOCATION
    )
    :vars
    (
      ?auto_1939778 - LOCATION
      ?auto_1939775 - CITY
      ?auto_1939774 - LOCATION
      ?auto_1939777 - LOCATION
      ?auto_1939776 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1939778 ?auto_1939775 ) ( IN-CITY ?auto_1939767 ?auto_1939775 ) ( not ( = ?auto_1939767 ?auto_1939778 ) ) ( OBJ-AT ?auto_1939771 ?auto_1939778 ) ( IN-CITY ?auto_1939774 ?auto_1939775 ) ( not ( = ?auto_1939767 ?auto_1939774 ) ) ( OBJ-AT ?auto_1939773 ?auto_1939774 ) ( IN-CITY ?auto_1939777 ?auto_1939775 ) ( not ( = ?auto_1939767 ?auto_1939777 ) ) ( OBJ-AT ?auto_1939772 ?auto_1939777 ) ( OBJ-AT ?auto_1939770 ?auto_1939778 ) ( OBJ-AT ?auto_1939769 ?auto_1939774 ) ( OBJ-AT ?auto_1939768 ?auto_1939774 ) ( TRUCK-AT ?auto_1939776 ?auto_1939767 ) ( not ( = ?auto_1939768 ?auto_1939769 ) ) ( not ( = ?auto_1939768 ?auto_1939770 ) ) ( not ( = ?auto_1939769 ?auto_1939770 ) ) ( not ( = ?auto_1939778 ?auto_1939774 ) ) ( not ( = ?auto_1939768 ?auto_1939772 ) ) ( not ( = ?auto_1939769 ?auto_1939772 ) ) ( not ( = ?auto_1939770 ?auto_1939772 ) ) ( not ( = ?auto_1939777 ?auto_1939778 ) ) ( not ( = ?auto_1939777 ?auto_1939774 ) ) ( not ( = ?auto_1939768 ?auto_1939773 ) ) ( not ( = ?auto_1939769 ?auto_1939773 ) ) ( not ( = ?auto_1939770 ?auto_1939773 ) ) ( not ( = ?auto_1939772 ?auto_1939773 ) ) ( not ( = ?auto_1939768 ?auto_1939771 ) ) ( not ( = ?auto_1939769 ?auto_1939771 ) ) ( not ( = ?auto_1939770 ?auto_1939771 ) ) ( not ( = ?auto_1939772 ?auto_1939771 ) ) ( not ( = ?auto_1939773 ?auto_1939771 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_1939768 ?auto_1939769 ?auto_1939770 ?auto_1939772 ?auto_1939771 ?auto_1939773 ?auto_1939767 )
      ( DELIVER-6PKG-VERIFY ?auto_1939768 ?auto_1939769 ?auto_1939770 ?auto_1939771 ?auto_1939772 ?auto_1939773 ?auto_1939767 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_1939832 - OBJ
      ?auto_1939833 - OBJ
      ?auto_1939834 - OBJ
      ?auto_1939835 - OBJ
      ?auto_1939836 - OBJ
      ?auto_1939837 - OBJ
      ?auto_1939831 - LOCATION
    )
    :vars
    (
      ?auto_1939842 - LOCATION
      ?auto_1939839 - CITY
      ?auto_1939838 - LOCATION
      ?auto_1939841 - LOCATION
      ?auto_1939840 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1939842 ?auto_1939839 ) ( IN-CITY ?auto_1939831 ?auto_1939839 ) ( not ( = ?auto_1939831 ?auto_1939842 ) ) ( OBJ-AT ?auto_1939835 ?auto_1939842 ) ( IN-CITY ?auto_1939838 ?auto_1939839 ) ( not ( = ?auto_1939831 ?auto_1939838 ) ) ( OBJ-AT ?auto_1939836 ?auto_1939838 ) ( IN-CITY ?auto_1939841 ?auto_1939839 ) ( not ( = ?auto_1939831 ?auto_1939841 ) ) ( OBJ-AT ?auto_1939837 ?auto_1939841 ) ( OBJ-AT ?auto_1939834 ?auto_1939842 ) ( OBJ-AT ?auto_1939833 ?auto_1939838 ) ( OBJ-AT ?auto_1939832 ?auto_1939838 ) ( TRUCK-AT ?auto_1939840 ?auto_1939831 ) ( not ( = ?auto_1939832 ?auto_1939833 ) ) ( not ( = ?auto_1939832 ?auto_1939834 ) ) ( not ( = ?auto_1939833 ?auto_1939834 ) ) ( not ( = ?auto_1939842 ?auto_1939838 ) ) ( not ( = ?auto_1939832 ?auto_1939837 ) ) ( not ( = ?auto_1939833 ?auto_1939837 ) ) ( not ( = ?auto_1939834 ?auto_1939837 ) ) ( not ( = ?auto_1939841 ?auto_1939842 ) ) ( not ( = ?auto_1939841 ?auto_1939838 ) ) ( not ( = ?auto_1939832 ?auto_1939836 ) ) ( not ( = ?auto_1939833 ?auto_1939836 ) ) ( not ( = ?auto_1939834 ?auto_1939836 ) ) ( not ( = ?auto_1939837 ?auto_1939836 ) ) ( not ( = ?auto_1939832 ?auto_1939835 ) ) ( not ( = ?auto_1939833 ?auto_1939835 ) ) ( not ( = ?auto_1939834 ?auto_1939835 ) ) ( not ( = ?auto_1939837 ?auto_1939835 ) ) ( not ( = ?auto_1939836 ?auto_1939835 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_1939832 ?auto_1939833 ?auto_1939834 ?auto_1939837 ?auto_1939835 ?auto_1939836 ?auto_1939831 )
      ( DELIVER-6PKG-VERIFY ?auto_1939832 ?auto_1939833 ?auto_1939834 ?auto_1939835 ?auto_1939836 ?auto_1939837 ?auto_1939831 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_1940304 - OBJ
      ?auto_1940305 - OBJ
      ?auto_1940306 - OBJ
      ?auto_1940307 - OBJ
      ?auto_1940308 - OBJ
      ?auto_1940309 - OBJ
      ?auto_1940303 - LOCATION
    )
    :vars
    (
      ?auto_1940314 - LOCATION
      ?auto_1940311 - CITY
      ?auto_1940310 - LOCATION
      ?auto_1940313 - LOCATION
      ?auto_1940312 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1940314 ?auto_1940311 ) ( IN-CITY ?auto_1940303 ?auto_1940311 ) ( not ( = ?auto_1940303 ?auto_1940314 ) ) ( OBJ-AT ?auto_1940309 ?auto_1940314 ) ( IN-CITY ?auto_1940310 ?auto_1940311 ) ( not ( = ?auto_1940303 ?auto_1940310 ) ) ( OBJ-AT ?auto_1940308 ?auto_1940310 ) ( IN-CITY ?auto_1940313 ?auto_1940311 ) ( not ( = ?auto_1940303 ?auto_1940313 ) ) ( OBJ-AT ?auto_1940306 ?auto_1940313 ) ( OBJ-AT ?auto_1940307 ?auto_1940314 ) ( OBJ-AT ?auto_1940305 ?auto_1940310 ) ( OBJ-AT ?auto_1940304 ?auto_1940310 ) ( TRUCK-AT ?auto_1940312 ?auto_1940303 ) ( not ( = ?auto_1940304 ?auto_1940305 ) ) ( not ( = ?auto_1940304 ?auto_1940307 ) ) ( not ( = ?auto_1940305 ?auto_1940307 ) ) ( not ( = ?auto_1940314 ?auto_1940310 ) ) ( not ( = ?auto_1940304 ?auto_1940306 ) ) ( not ( = ?auto_1940305 ?auto_1940306 ) ) ( not ( = ?auto_1940307 ?auto_1940306 ) ) ( not ( = ?auto_1940313 ?auto_1940314 ) ) ( not ( = ?auto_1940313 ?auto_1940310 ) ) ( not ( = ?auto_1940304 ?auto_1940308 ) ) ( not ( = ?auto_1940305 ?auto_1940308 ) ) ( not ( = ?auto_1940307 ?auto_1940308 ) ) ( not ( = ?auto_1940306 ?auto_1940308 ) ) ( not ( = ?auto_1940304 ?auto_1940309 ) ) ( not ( = ?auto_1940305 ?auto_1940309 ) ) ( not ( = ?auto_1940307 ?auto_1940309 ) ) ( not ( = ?auto_1940306 ?auto_1940309 ) ) ( not ( = ?auto_1940308 ?auto_1940309 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_1940304 ?auto_1940305 ?auto_1940307 ?auto_1940306 ?auto_1940309 ?auto_1940308 ?auto_1940303 )
      ( DELIVER-6PKG-VERIFY ?auto_1940304 ?auto_1940305 ?auto_1940306 ?auto_1940307 ?auto_1940308 ?auto_1940309 ?auto_1940303 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_1940368 - OBJ
      ?auto_1940369 - OBJ
      ?auto_1940370 - OBJ
      ?auto_1940371 - OBJ
      ?auto_1940372 - OBJ
      ?auto_1940373 - OBJ
      ?auto_1940367 - LOCATION
    )
    :vars
    (
      ?auto_1940378 - LOCATION
      ?auto_1940375 - CITY
      ?auto_1940374 - LOCATION
      ?auto_1940377 - LOCATION
      ?auto_1940376 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1940378 ?auto_1940375 ) ( IN-CITY ?auto_1940367 ?auto_1940375 ) ( not ( = ?auto_1940367 ?auto_1940378 ) ) ( OBJ-AT ?auto_1940372 ?auto_1940378 ) ( IN-CITY ?auto_1940374 ?auto_1940375 ) ( not ( = ?auto_1940367 ?auto_1940374 ) ) ( OBJ-AT ?auto_1940373 ?auto_1940374 ) ( IN-CITY ?auto_1940377 ?auto_1940375 ) ( not ( = ?auto_1940367 ?auto_1940377 ) ) ( OBJ-AT ?auto_1940370 ?auto_1940377 ) ( OBJ-AT ?auto_1940371 ?auto_1940378 ) ( OBJ-AT ?auto_1940369 ?auto_1940374 ) ( OBJ-AT ?auto_1940368 ?auto_1940374 ) ( TRUCK-AT ?auto_1940376 ?auto_1940367 ) ( not ( = ?auto_1940368 ?auto_1940369 ) ) ( not ( = ?auto_1940368 ?auto_1940371 ) ) ( not ( = ?auto_1940369 ?auto_1940371 ) ) ( not ( = ?auto_1940378 ?auto_1940374 ) ) ( not ( = ?auto_1940368 ?auto_1940370 ) ) ( not ( = ?auto_1940369 ?auto_1940370 ) ) ( not ( = ?auto_1940371 ?auto_1940370 ) ) ( not ( = ?auto_1940377 ?auto_1940378 ) ) ( not ( = ?auto_1940377 ?auto_1940374 ) ) ( not ( = ?auto_1940368 ?auto_1940373 ) ) ( not ( = ?auto_1940369 ?auto_1940373 ) ) ( not ( = ?auto_1940371 ?auto_1940373 ) ) ( not ( = ?auto_1940370 ?auto_1940373 ) ) ( not ( = ?auto_1940368 ?auto_1940372 ) ) ( not ( = ?auto_1940369 ?auto_1940372 ) ) ( not ( = ?auto_1940371 ?auto_1940372 ) ) ( not ( = ?auto_1940370 ?auto_1940372 ) ) ( not ( = ?auto_1940373 ?auto_1940372 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_1940368 ?auto_1940369 ?auto_1940371 ?auto_1940370 ?auto_1940372 ?auto_1940373 ?auto_1940367 )
      ( DELIVER-6PKG-VERIFY ?auto_1940368 ?auto_1940369 ?auto_1940370 ?auto_1940371 ?auto_1940372 ?auto_1940373 ?auto_1940367 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_1940569 - OBJ
      ?auto_1940570 - OBJ
      ?auto_1940571 - OBJ
      ?auto_1940572 - OBJ
      ?auto_1940573 - OBJ
      ?auto_1940574 - OBJ
      ?auto_1940568 - LOCATION
    )
    :vars
    (
      ?auto_1940579 - LOCATION
      ?auto_1940576 - CITY
      ?auto_1940575 - LOCATION
      ?auto_1940578 - LOCATION
      ?auto_1940577 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1940579 ?auto_1940576 ) ( IN-CITY ?auto_1940568 ?auto_1940576 ) ( not ( = ?auto_1940568 ?auto_1940579 ) ) ( OBJ-AT ?auto_1940574 ?auto_1940579 ) ( IN-CITY ?auto_1940575 ?auto_1940576 ) ( not ( = ?auto_1940568 ?auto_1940575 ) ) ( OBJ-AT ?auto_1940572 ?auto_1940575 ) ( IN-CITY ?auto_1940578 ?auto_1940576 ) ( not ( = ?auto_1940568 ?auto_1940578 ) ) ( OBJ-AT ?auto_1940571 ?auto_1940578 ) ( OBJ-AT ?auto_1940573 ?auto_1940579 ) ( OBJ-AT ?auto_1940570 ?auto_1940575 ) ( OBJ-AT ?auto_1940569 ?auto_1940575 ) ( TRUCK-AT ?auto_1940577 ?auto_1940568 ) ( not ( = ?auto_1940569 ?auto_1940570 ) ) ( not ( = ?auto_1940569 ?auto_1940573 ) ) ( not ( = ?auto_1940570 ?auto_1940573 ) ) ( not ( = ?auto_1940579 ?auto_1940575 ) ) ( not ( = ?auto_1940569 ?auto_1940571 ) ) ( not ( = ?auto_1940570 ?auto_1940571 ) ) ( not ( = ?auto_1940573 ?auto_1940571 ) ) ( not ( = ?auto_1940578 ?auto_1940579 ) ) ( not ( = ?auto_1940578 ?auto_1940575 ) ) ( not ( = ?auto_1940569 ?auto_1940572 ) ) ( not ( = ?auto_1940570 ?auto_1940572 ) ) ( not ( = ?auto_1940573 ?auto_1940572 ) ) ( not ( = ?auto_1940571 ?auto_1940572 ) ) ( not ( = ?auto_1940569 ?auto_1940574 ) ) ( not ( = ?auto_1940570 ?auto_1940574 ) ) ( not ( = ?auto_1940573 ?auto_1940574 ) ) ( not ( = ?auto_1940571 ?auto_1940574 ) ) ( not ( = ?auto_1940572 ?auto_1940574 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_1940569 ?auto_1940570 ?auto_1940573 ?auto_1940571 ?auto_1940574 ?auto_1940572 ?auto_1940568 )
      ( DELIVER-6PKG-VERIFY ?auto_1940569 ?auto_1940570 ?auto_1940571 ?auto_1940572 ?auto_1940573 ?auto_1940574 ?auto_1940568 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_1941490 - OBJ
      ?auto_1941491 - OBJ
      ?auto_1941492 - OBJ
      ?auto_1941493 - OBJ
      ?auto_1941494 - OBJ
      ?auto_1941495 - OBJ
      ?auto_1941489 - LOCATION
    )
    :vars
    (
      ?auto_1941500 - LOCATION
      ?auto_1941497 - CITY
      ?auto_1941496 - LOCATION
      ?auto_1941499 - LOCATION
      ?auto_1941498 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1941500 ?auto_1941497 ) ( IN-CITY ?auto_1941489 ?auto_1941497 ) ( not ( = ?auto_1941489 ?auto_1941500 ) ) ( OBJ-AT ?auto_1941495 ?auto_1941500 ) ( IN-CITY ?auto_1941496 ?auto_1941497 ) ( not ( = ?auto_1941489 ?auto_1941496 ) ) ( OBJ-AT ?auto_1941492 ?auto_1941496 ) ( IN-CITY ?auto_1941499 ?auto_1941497 ) ( not ( = ?auto_1941489 ?auto_1941499 ) ) ( OBJ-AT ?auto_1941494 ?auto_1941499 ) ( OBJ-AT ?auto_1941493 ?auto_1941500 ) ( OBJ-AT ?auto_1941491 ?auto_1941496 ) ( OBJ-AT ?auto_1941490 ?auto_1941496 ) ( TRUCK-AT ?auto_1941498 ?auto_1941489 ) ( not ( = ?auto_1941490 ?auto_1941491 ) ) ( not ( = ?auto_1941490 ?auto_1941493 ) ) ( not ( = ?auto_1941491 ?auto_1941493 ) ) ( not ( = ?auto_1941500 ?auto_1941496 ) ) ( not ( = ?auto_1941490 ?auto_1941494 ) ) ( not ( = ?auto_1941491 ?auto_1941494 ) ) ( not ( = ?auto_1941493 ?auto_1941494 ) ) ( not ( = ?auto_1941499 ?auto_1941500 ) ) ( not ( = ?auto_1941499 ?auto_1941496 ) ) ( not ( = ?auto_1941490 ?auto_1941492 ) ) ( not ( = ?auto_1941491 ?auto_1941492 ) ) ( not ( = ?auto_1941493 ?auto_1941492 ) ) ( not ( = ?auto_1941494 ?auto_1941492 ) ) ( not ( = ?auto_1941490 ?auto_1941495 ) ) ( not ( = ?auto_1941491 ?auto_1941495 ) ) ( not ( = ?auto_1941493 ?auto_1941495 ) ) ( not ( = ?auto_1941494 ?auto_1941495 ) ) ( not ( = ?auto_1941492 ?auto_1941495 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_1941490 ?auto_1941491 ?auto_1941493 ?auto_1941494 ?auto_1941495 ?auto_1941492 ?auto_1941489 )
      ( DELIVER-6PKG-VERIFY ?auto_1941490 ?auto_1941491 ?auto_1941492 ?auto_1941493 ?auto_1941494 ?auto_1941495 ?auto_1941489 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_1941554 - OBJ
      ?auto_1941555 - OBJ
      ?auto_1941556 - OBJ
      ?auto_1941557 - OBJ
      ?auto_1941558 - OBJ
      ?auto_1941559 - OBJ
      ?auto_1941553 - LOCATION
    )
    :vars
    (
      ?auto_1941564 - LOCATION
      ?auto_1941561 - CITY
      ?auto_1941560 - LOCATION
      ?auto_1941563 - LOCATION
      ?auto_1941562 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1941564 ?auto_1941561 ) ( IN-CITY ?auto_1941553 ?auto_1941561 ) ( not ( = ?auto_1941553 ?auto_1941564 ) ) ( OBJ-AT ?auto_1941558 ?auto_1941564 ) ( IN-CITY ?auto_1941560 ?auto_1941561 ) ( not ( = ?auto_1941553 ?auto_1941560 ) ) ( OBJ-AT ?auto_1941556 ?auto_1941560 ) ( IN-CITY ?auto_1941563 ?auto_1941561 ) ( not ( = ?auto_1941553 ?auto_1941563 ) ) ( OBJ-AT ?auto_1941559 ?auto_1941563 ) ( OBJ-AT ?auto_1941557 ?auto_1941564 ) ( OBJ-AT ?auto_1941555 ?auto_1941560 ) ( OBJ-AT ?auto_1941554 ?auto_1941560 ) ( TRUCK-AT ?auto_1941562 ?auto_1941553 ) ( not ( = ?auto_1941554 ?auto_1941555 ) ) ( not ( = ?auto_1941554 ?auto_1941557 ) ) ( not ( = ?auto_1941555 ?auto_1941557 ) ) ( not ( = ?auto_1941564 ?auto_1941560 ) ) ( not ( = ?auto_1941554 ?auto_1941559 ) ) ( not ( = ?auto_1941555 ?auto_1941559 ) ) ( not ( = ?auto_1941557 ?auto_1941559 ) ) ( not ( = ?auto_1941563 ?auto_1941564 ) ) ( not ( = ?auto_1941563 ?auto_1941560 ) ) ( not ( = ?auto_1941554 ?auto_1941556 ) ) ( not ( = ?auto_1941555 ?auto_1941556 ) ) ( not ( = ?auto_1941557 ?auto_1941556 ) ) ( not ( = ?auto_1941559 ?auto_1941556 ) ) ( not ( = ?auto_1941554 ?auto_1941558 ) ) ( not ( = ?auto_1941555 ?auto_1941558 ) ) ( not ( = ?auto_1941557 ?auto_1941558 ) ) ( not ( = ?auto_1941559 ?auto_1941558 ) ) ( not ( = ?auto_1941556 ?auto_1941558 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_1941554 ?auto_1941555 ?auto_1941557 ?auto_1941559 ?auto_1941558 ?auto_1941556 ?auto_1941553 )
      ( DELIVER-6PKG-VERIFY ?auto_1941554 ?auto_1941555 ?auto_1941556 ?auto_1941557 ?auto_1941558 ?auto_1941559 ?auto_1941553 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_1941618 - OBJ
      ?auto_1941619 - OBJ
      ?auto_1941620 - OBJ
      ?auto_1941621 - OBJ
      ?auto_1941622 - OBJ
      ?auto_1941623 - OBJ
      ?auto_1941617 - LOCATION
    )
    :vars
    (
      ?auto_1941628 - LOCATION
      ?auto_1941625 - CITY
      ?auto_1941624 - LOCATION
      ?auto_1941627 - LOCATION
      ?auto_1941626 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1941628 ?auto_1941625 ) ( IN-CITY ?auto_1941617 ?auto_1941625 ) ( not ( = ?auto_1941617 ?auto_1941628 ) ) ( OBJ-AT ?auto_1941623 ?auto_1941628 ) ( IN-CITY ?auto_1941624 ?auto_1941625 ) ( not ( = ?auto_1941617 ?auto_1941624 ) ) ( OBJ-AT ?auto_1941620 ?auto_1941624 ) ( IN-CITY ?auto_1941627 ?auto_1941625 ) ( not ( = ?auto_1941617 ?auto_1941627 ) ) ( OBJ-AT ?auto_1941621 ?auto_1941627 ) ( OBJ-AT ?auto_1941622 ?auto_1941628 ) ( OBJ-AT ?auto_1941619 ?auto_1941624 ) ( OBJ-AT ?auto_1941618 ?auto_1941624 ) ( TRUCK-AT ?auto_1941626 ?auto_1941617 ) ( not ( = ?auto_1941618 ?auto_1941619 ) ) ( not ( = ?auto_1941618 ?auto_1941622 ) ) ( not ( = ?auto_1941619 ?auto_1941622 ) ) ( not ( = ?auto_1941628 ?auto_1941624 ) ) ( not ( = ?auto_1941618 ?auto_1941621 ) ) ( not ( = ?auto_1941619 ?auto_1941621 ) ) ( not ( = ?auto_1941622 ?auto_1941621 ) ) ( not ( = ?auto_1941627 ?auto_1941628 ) ) ( not ( = ?auto_1941627 ?auto_1941624 ) ) ( not ( = ?auto_1941618 ?auto_1941620 ) ) ( not ( = ?auto_1941619 ?auto_1941620 ) ) ( not ( = ?auto_1941622 ?auto_1941620 ) ) ( not ( = ?auto_1941621 ?auto_1941620 ) ) ( not ( = ?auto_1941618 ?auto_1941623 ) ) ( not ( = ?auto_1941619 ?auto_1941623 ) ) ( not ( = ?auto_1941622 ?auto_1941623 ) ) ( not ( = ?auto_1941621 ?auto_1941623 ) ) ( not ( = ?auto_1941620 ?auto_1941623 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_1941618 ?auto_1941619 ?auto_1941622 ?auto_1941621 ?auto_1941623 ?auto_1941620 ?auto_1941617 )
      ( DELIVER-6PKG-VERIFY ?auto_1941618 ?auto_1941619 ?auto_1941620 ?auto_1941621 ?auto_1941622 ?auto_1941623 ?auto_1941617 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_1947064 - OBJ
      ?auto_1947065 - OBJ
      ?auto_1947066 - OBJ
      ?auto_1947067 - OBJ
      ?auto_1947068 - OBJ
      ?auto_1947069 - OBJ
      ?auto_1947063 - LOCATION
    )
    :vars
    (
      ?auto_1947074 - LOCATION
      ?auto_1947071 - CITY
      ?auto_1947070 - LOCATION
      ?auto_1947073 - LOCATION
      ?auto_1947072 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1947074 ?auto_1947071 ) ( IN-CITY ?auto_1947063 ?auto_1947071 ) ( not ( = ?auto_1947063 ?auto_1947074 ) ) ( OBJ-AT ?auto_1947069 ?auto_1947074 ) ( IN-CITY ?auto_1947070 ?auto_1947071 ) ( not ( = ?auto_1947063 ?auto_1947070 ) ) ( OBJ-AT ?auto_1947068 ?auto_1947070 ) ( IN-CITY ?auto_1947073 ?auto_1947071 ) ( not ( = ?auto_1947063 ?auto_1947073 ) ) ( OBJ-AT ?auto_1947067 ?auto_1947073 ) ( OBJ-AT ?auto_1947065 ?auto_1947074 ) ( OBJ-AT ?auto_1947066 ?auto_1947070 ) ( OBJ-AT ?auto_1947064 ?auto_1947070 ) ( TRUCK-AT ?auto_1947072 ?auto_1947063 ) ( not ( = ?auto_1947064 ?auto_1947066 ) ) ( not ( = ?auto_1947064 ?auto_1947065 ) ) ( not ( = ?auto_1947066 ?auto_1947065 ) ) ( not ( = ?auto_1947074 ?auto_1947070 ) ) ( not ( = ?auto_1947064 ?auto_1947067 ) ) ( not ( = ?auto_1947066 ?auto_1947067 ) ) ( not ( = ?auto_1947065 ?auto_1947067 ) ) ( not ( = ?auto_1947073 ?auto_1947074 ) ) ( not ( = ?auto_1947073 ?auto_1947070 ) ) ( not ( = ?auto_1947064 ?auto_1947068 ) ) ( not ( = ?auto_1947066 ?auto_1947068 ) ) ( not ( = ?auto_1947065 ?auto_1947068 ) ) ( not ( = ?auto_1947067 ?auto_1947068 ) ) ( not ( = ?auto_1947064 ?auto_1947069 ) ) ( not ( = ?auto_1947066 ?auto_1947069 ) ) ( not ( = ?auto_1947065 ?auto_1947069 ) ) ( not ( = ?auto_1947067 ?auto_1947069 ) ) ( not ( = ?auto_1947068 ?auto_1947069 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_1947064 ?auto_1947066 ?auto_1947065 ?auto_1947067 ?auto_1947069 ?auto_1947068 ?auto_1947063 )
      ( DELIVER-6PKG-VERIFY ?auto_1947064 ?auto_1947065 ?auto_1947066 ?auto_1947067 ?auto_1947068 ?auto_1947069 ?auto_1947063 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_1947128 - OBJ
      ?auto_1947129 - OBJ
      ?auto_1947130 - OBJ
      ?auto_1947131 - OBJ
      ?auto_1947132 - OBJ
      ?auto_1947133 - OBJ
      ?auto_1947127 - LOCATION
    )
    :vars
    (
      ?auto_1947138 - LOCATION
      ?auto_1947135 - CITY
      ?auto_1947134 - LOCATION
      ?auto_1947137 - LOCATION
      ?auto_1947136 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1947138 ?auto_1947135 ) ( IN-CITY ?auto_1947127 ?auto_1947135 ) ( not ( = ?auto_1947127 ?auto_1947138 ) ) ( OBJ-AT ?auto_1947132 ?auto_1947138 ) ( IN-CITY ?auto_1947134 ?auto_1947135 ) ( not ( = ?auto_1947127 ?auto_1947134 ) ) ( OBJ-AT ?auto_1947133 ?auto_1947134 ) ( IN-CITY ?auto_1947137 ?auto_1947135 ) ( not ( = ?auto_1947127 ?auto_1947137 ) ) ( OBJ-AT ?auto_1947131 ?auto_1947137 ) ( OBJ-AT ?auto_1947129 ?auto_1947138 ) ( OBJ-AT ?auto_1947130 ?auto_1947134 ) ( OBJ-AT ?auto_1947128 ?auto_1947134 ) ( TRUCK-AT ?auto_1947136 ?auto_1947127 ) ( not ( = ?auto_1947128 ?auto_1947130 ) ) ( not ( = ?auto_1947128 ?auto_1947129 ) ) ( not ( = ?auto_1947130 ?auto_1947129 ) ) ( not ( = ?auto_1947138 ?auto_1947134 ) ) ( not ( = ?auto_1947128 ?auto_1947131 ) ) ( not ( = ?auto_1947130 ?auto_1947131 ) ) ( not ( = ?auto_1947129 ?auto_1947131 ) ) ( not ( = ?auto_1947137 ?auto_1947138 ) ) ( not ( = ?auto_1947137 ?auto_1947134 ) ) ( not ( = ?auto_1947128 ?auto_1947133 ) ) ( not ( = ?auto_1947130 ?auto_1947133 ) ) ( not ( = ?auto_1947129 ?auto_1947133 ) ) ( not ( = ?auto_1947131 ?auto_1947133 ) ) ( not ( = ?auto_1947128 ?auto_1947132 ) ) ( not ( = ?auto_1947130 ?auto_1947132 ) ) ( not ( = ?auto_1947129 ?auto_1947132 ) ) ( not ( = ?auto_1947131 ?auto_1947132 ) ) ( not ( = ?auto_1947133 ?auto_1947132 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_1947128 ?auto_1947130 ?auto_1947129 ?auto_1947131 ?auto_1947132 ?auto_1947133 ?auto_1947127 )
      ( DELIVER-6PKG-VERIFY ?auto_1947128 ?auto_1947129 ?auto_1947130 ?auto_1947131 ?auto_1947132 ?auto_1947133 ?auto_1947127 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_1947192 - OBJ
      ?auto_1947193 - OBJ
      ?auto_1947194 - OBJ
      ?auto_1947195 - OBJ
      ?auto_1947196 - OBJ
      ?auto_1947197 - OBJ
      ?auto_1947191 - LOCATION
    )
    :vars
    (
      ?auto_1947202 - LOCATION
      ?auto_1947199 - CITY
      ?auto_1947198 - LOCATION
      ?auto_1947201 - LOCATION
      ?auto_1947200 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1947202 ?auto_1947199 ) ( IN-CITY ?auto_1947191 ?auto_1947199 ) ( not ( = ?auto_1947191 ?auto_1947202 ) ) ( OBJ-AT ?auto_1947197 ?auto_1947202 ) ( IN-CITY ?auto_1947198 ?auto_1947199 ) ( not ( = ?auto_1947191 ?auto_1947198 ) ) ( OBJ-AT ?auto_1947195 ?auto_1947198 ) ( IN-CITY ?auto_1947201 ?auto_1947199 ) ( not ( = ?auto_1947191 ?auto_1947201 ) ) ( OBJ-AT ?auto_1947196 ?auto_1947201 ) ( OBJ-AT ?auto_1947193 ?auto_1947202 ) ( OBJ-AT ?auto_1947194 ?auto_1947198 ) ( OBJ-AT ?auto_1947192 ?auto_1947198 ) ( TRUCK-AT ?auto_1947200 ?auto_1947191 ) ( not ( = ?auto_1947192 ?auto_1947194 ) ) ( not ( = ?auto_1947192 ?auto_1947193 ) ) ( not ( = ?auto_1947194 ?auto_1947193 ) ) ( not ( = ?auto_1947202 ?auto_1947198 ) ) ( not ( = ?auto_1947192 ?auto_1947196 ) ) ( not ( = ?auto_1947194 ?auto_1947196 ) ) ( not ( = ?auto_1947193 ?auto_1947196 ) ) ( not ( = ?auto_1947201 ?auto_1947202 ) ) ( not ( = ?auto_1947201 ?auto_1947198 ) ) ( not ( = ?auto_1947192 ?auto_1947195 ) ) ( not ( = ?auto_1947194 ?auto_1947195 ) ) ( not ( = ?auto_1947193 ?auto_1947195 ) ) ( not ( = ?auto_1947196 ?auto_1947195 ) ) ( not ( = ?auto_1947192 ?auto_1947197 ) ) ( not ( = ?auto_1947194 ?auto_1947197 ) ) ( not ( = ?auto_1947193 ?auto_1947197 ) ) ( not ( = ?auto_1947196 ?auto_1947197 ) ) ( not ( = ?auto_1947195 ?auto_1947197 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_1947192 ?auto_1947194 ?auto_1947193 ?auto_1947196 ?auto_1947197 ?auto_1947195 ?auto_1947191 )
      ( DELIVER-6PKG-VERIFY ?auto_1947192 ?auto_1947193 ?auto_1947194 ?auto_1947195 ?auto_1947196 ?auto_1947197 ?auto_1947191 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_1947256 - OBJ
      ?auto_1947257 - OBJ
      ?auto_1947258 - OBJ
      ?auto_1947259 - OBJ
      ?auto_1947260 - OBJ
      ?auto_1947261 - OBJ
      ?auto_1947255 - LOCATION
    )
    :vars
    (
      ?auto_1947266 - LOCATION
      ?auto_1947263 - CITY
      ?auto_1947262 - LOCATION
      ?auto_1947265 - LOCATION
      ?auto_1947264 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1947266 ?auto_1947263 ) ( IN-CITY ?auto_1947255 ?auto_1947263 ) ( not ( = ?auto_1947255 ?auto_1947266 ) ) ( OBJ-AT ?auto_1947260 ?auto_1947266 ) ( IN-CITY ?auto_1947262 ?auto_1947263 ) ( not ( = ?auto_1947255 ?auto_1947262 ) ) ( OBJ-AT ?auto_1947259 ?auto_1947262 ) ( IN-CITY ?auto_1947265 ?auto_1947263 ) ( not ( = ?auto_1947255 ?auto_1947265 ) ) ( OBJ-AT ?auto_1947261 ?auto_1947265 ) ( OBJ-AT ?auto_1947257 ?auto_1947266 ) ( OBJ-AT ?auto_1947258 ?auto_1947262 ) ( OBJ-AT ?auto_1947256 ?auto_1947262 ) ( TRUCK-AT ?auto_1947264 ?auto_1947255 ) ( not ( = ?auto_1947256 ?auto_1947258 ) ) ( not ( = ?auto_1947256 ?auto_1947257 ) ) ( not ( = ?auto_1947258 ?auto_1947257 ) ) ( not ( = ?auto_1947266 ?auto_1947262 ) ) ( not ( = ?auto_1947256 ?auto_1947261 ) ) ( not ( = ?auto_1947258 ?auto_1947261 ) ) ( not ( = ?auto_1947257 ?auto_1947261 ) ) ( not ( = ?auto_1947265 ?auto_1947266 ) ) ( not ( = ?auto_1947265 ?auto_1947262 ) ) ( not ( = ?auto_1947256 ?auto_1947259 ) ) ( not ( = ?auto_1947258 ?auto_1947259 ) ) ( not ( = ?auto_1947257 ?auto_1947259 ) ) ( not ( = ?auto_1947261 ?auto_1947259 ) ) ( not ( = ?auto_1947256 ?auto_1947260 ) ) ( not ( = ?auto_1947258 ?auto_1947260 ) ) ( not ( = ?auto_1947257 ?auto_1947260 ) ) ( not ( = ?auto_1947261 ?auto_1947260 ) ) ( not ( = ?auto_1947259 ?auto_1947260 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_1947256 ?auto_1947258 ?auto_1947257 ?auto_1947261 ?auto_1947260 ?auto_1947259 ?auto_1947255 )
      ( DELIVER-6PKG-VERIFY ?auto_1947256 ?auto_1947257 ?auto_1947258 ?auto_1947259 ?auto_1947260 ?auto_1947261 ?auto_1947255 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_1947592 - OBJ
      ?auto_1947593 - OBJ
      ?auto_1947594 - OBJ
      ?auto_1947595 - OBJ
      ?auto_1947596 - OBJ
      ?auto_1947597 - OBJ
      ?auto_1947591 - LOCATION
    )
    :vars
    (
      ?auto_1947602 - LOCATION
      ?auto_1947599 - CITY
      ?auto_1947598 - LOCATION
      ?auto_1947601 - LOCATION
      ?auto_1947600 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1947602 ?auto_1947599 ) ( IN-CITY ?auto_1947591 ?auto_1947599 ) ( not ( = ?auto_1947591 ?auto_1947602 ) ) ( OBJ-AT ?auto_1947595 ?auto_1947602 ) ( IN-CITY ?auto_1947598 ?auto_1947599 ) ( not ( = ?auto_1947591 ?auto_1947598 ) ) ( OBJ-AT ?auto_1947597 ?auto_1947598 ) ( IN-CITY ?auto_1947601 ?auto_1947599 ) ( not ( = ?auto_1947591 ?auto_1947601 ) ) ( OBJ-AT ?auto_1947596 ?auto_1947601 ) ( OBJ-AT ?auto_1947593 ?auto_1947602 ) ( OBJ-AT ?auto_1947594 ?auto_1947598 ) ( OBJ-AT ?auto_1947592 ?auto_1947598 ) ( TRUCK-AT ?auto_1947600 ?auto_1947591 ) ( not ( = ?auto_1947592 ?auto_1947594 ) ) ( not ( = ?auto_1947592 ?auto_1947593 ) ) ( not ( = ?auto_1947594 ?auto_1947593 ) ) ( not ( = ?auto_1947602 ?auto_1947598 ) ) ( not ( = ?auto_1947592 ?auto_1947596 ) ) ( not ( = ?auto_1947594 ?auto_1947596 ) ) ( not ( = ?auto_1947593 ?auto_1947596 ) ) ( not ( = ?auto_1947601 ?auto_1947602 ) ) ( not ( = ?auto_1947601 ?auto_1947598 ) ) ( not ( = ?auto_1947592 ?auto_1947597 ) ) ( not ( = ?auto_1947594 ?auto_1947597 ) ) ( not ( = ?auto_1947593 ?auto_1947597 ) ) ( not ( = ?auto_1947596 ?auto_1947597 ) ) ( not ( = ?auto_1947592 ?auto_1947595 ) ) ( not ( = ?auto_1947594 ?auto_1947595 ) ) ( not ( = ?auto_1947593 ?auto_1947595 ) ) ( not ( = ?auto_1947596 ?auto_1947595 ) ) ( not ( = ?auto_1947597 ?auto_1947595 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_1947592 ?auto_1947594 ?auto_1947593 ?auto_1947596 ?auto_1947595 ?auto_1947597 ?auto_1947591 )
      ( DELIVER-6PKG-VERIFY ?auto_1947592 ?auto_1947593 ?auto_1947594 ?auto_1947595 ?auto_1947596 ?auto_1947597 ?auto_1947591 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_1947656 - OBJ
      ?auto_1947657 - OBJ
      ?auto_1947658 - OBJ
      ?auto_1947659 - OBJ
      ?auto_1947660 - OBJ
      ?auto_1947661 - OBJ
      ?auto_1947655 - LOCATION
    )
    :vars
    (
      ?auto_1947666 - LOCATION
      ?auto_1947663 - CITY
      ?auto_1947662 - LOCATION
      ?auto_1947665 - LOCATION
      ?auto_1947664 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1947666 ?auto_1947663 ) ( IN-CITY ?auto_1947655 ?auto_1947663 ) ( not ( = ?auto_1947655 ?auto_1947666 ) ) ( OBJ-AT ?auto_1947659 ?auto_1947666 ) ( IN-CITY ?auto_1947662 ?auto_1947663 ) ( not ( = ?auto_1947655 ?auto_1947662 ) ) ( OBJ-AT ?auto_1947660 ?auto_1947662 ) ( IN-CITY ?auto_1947665 ?auto_1947663 ) ( not ( = ?auto_1947655 ?auto_1947665 ) ) ( OBJ-AT ?auto_1947661 ?auto_1947665 ) ( OBJ-AT ?auto_1947657 ?auto_1947666 ) ( OBJ-AT ?auto_1947658 ?auto_1947662 ) ( OBJ-AT ?auto_1947656 ?auto_1947662 ) ( TRUCK-AT ?auto_1947664 ?auto_1947655 ) ( not ( = ?auto_1947656 ?auto_1947658 ) ) ( not ( = ?auto_1947656 ?auto_1947657 ) ) ( not ( = ?auto_1947658 ?auto_1947657 ) ) ( not ( = ?auto_1947666 ?auto_1947662 ) ) ( not ( = ?auto_1947656 ?auto_1947661 ) ) ( not ( = ?auto_1947658 ?auto_1947661 ) ) ( not ( = ?auto_1947657 ?auto_1947661 ) ) ( not ( = ?auto_1947665 ?auto_1947666 ) ) ( not ( = ?auto_1947665 ?auto_1947662 ) ) ( not ( = ?auto_1947656 ?auto_1947660 ) ) ( not ( = ?auto_1947658 ?auto_1947660 ) ) ( not ( = ?auto_1947657 ?auto_1947660 ) ) ( not ( = ?auto_1947661 ?auto_1947660 ) ) ( not ( = ?auto_1947656 ?auto_1947659 ) ) ( not ( = ?auto_1947658 ?auto_1947659 ) ) ( not ( = ?auto_1947657 ?auto_1947659 ) ) ( not ( = ?auto_1947661 ?auto_1947659 ) ) ( not ( = ?auto_1947660 ?auto_1947659 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_1947656 ?auto_1947658 ?auto_1947657 ?auto_1947661 ?auto_1947659 ?auto_1947660 ?auto_1947655 )
      ( DELIVER-6PKG-VERIFY ?auto_1947656 ?auto_1947657 ?auto_1947658 ?auto_1947659 ?auto_1947660 ?auto_1947661 ?auto_1947655 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_1949253 - OBJ
      ?auto_1949254 - OBJ
      ?auto_1949255 - OBJ
      ?auto_1949256 - OBJ
      ?auto_1949257 - OBJ
      ?auto_1949258 - OBJ
      ?auto_1949252 - LOCATION
    )
    :vars
    (
      ?auto_1949263 - LOCATION
      ?auto_1949260 - CITY
      ?auto_1949259 - LOCATION
      ?auto_1949262 - LOCATION
      ?auto_1949261 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1949263 ?auto_1949260 ) ( IN-CITY ?auto_1949252 ?auto_1949260 ) ( not ( = ?auto_1949252 ?auto_1949263 ) ) ( OBJ-AT ?auto_1949258 ?auto_1949263 ) ( IN-CITY ?auto_1949259 ?auto_1949260 ) ( not ( = ?auto_1949252 ?auto_1949259 ) ) ( OBJ-AT ?auto_1949257 ?auto_1949259 ) ( IN-CITY ?auto_1949262 ?auto_1949260 ) ( not ( = ?auto_1949252 ?auto_1949262 ) ) ( OBJ-AT ?auto_1949255 ?auto_1949262 ) ( OBJ-AT ?auto_1949254 ?auto_1949263 ) ( OBJ-AT ?auto_1949256 ?auto_1949259 ) ( OBJ-AT ?auto_1949253 ?auto_1949259 ) ( TRUCK-AT ?auto_1949261 ?auto_1949252 ) ( not ( = ?auto_1949253 ?auto_1949256 ) ) ( not ( = ?auto_1949253 ?auto_1949254 ) ) ( not ( = ?auto_1949256 ?auto_1949254 ) ) ( not ( = ?auto_1949263 ?auto_1949259 ) ) ( not ( = ?auto_1949253 ?auto_1949255 ) ) ( not ( = ?auto_1949256 ?auto_1949255 ) ) ( not ( = ?auto_1949254 ?auto_1949255 ) ) ( not ( = ?auto_1949262 ?auto_1949263 ) ) ( not ( = ?auto_1949262 ?auto_1949259 ) ) ( not ( = ?auto_1949253 ?auto_1949257 ) ) ( not ( = ?auto_1949256 ?auto_1949257 ) ) ( not ( = ?auto_1949254 ?auto_1949257 ) ) ( not ( = ?auto_1949255 ?auto_1949257 ) ) ( not ( = ?auto_1949253 ?auto_1949258 ) ) ( not ( = ?auto_1949256 ?auto_1949258 ) ) ( not ( = ?auto_1949254 ?auto_1949258 ) ) ( not ( = ?auto_1949255 ?auto_1949258 ) ) ( not ( = ?auto_1949257 ?auto_1949258 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_1949253 ?auto_1949256 ?auto_1949254 ?auto_1949255 ?auto_1949258 ?auto_1949257 ?auto_1949252 )
      ( DELIVER-6PKG-VERIFY ?auto_1949253 ?auto_1949254 ?auto_1949255 ?auto_1949256 ?auto_1949257 ?auto_1949258 ?auto_1949252 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_1949317 - OBJ
      ?auto_1949318 - OBJ
      ?auto_1949319 - OBJ
      ?auto_1949320 - OBJ
      ?auto_1949321 - OBJ
      ?auto_1949322 - OBJ
      ?auto_1949316 - LOCATION
    )
    :vars
    (
      ?auto_1949327 - LOCATION
      ?auto_1949324 - CITY
      ?auto_1949323 - LOCATION
      ?auto_1949326 - LOCATION
      ?auto_1949325 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1949327 ?auto_1949324 ) ( IN-CITY ?auto_1949316 ?auto_1949324 ) ( not ( = ?auto_1949316 ?auto_1949327 ) ) ( OBJ-AT ?auto_1949321 ?auto_1949327 ) ( IN-CITY ?auto_1949323 ?auto_1949324 ) ( not ( = ?auto_1949316 ?auto_1949323 ) ) ( OBJ-AT ?auto_1949322 ?auto_1949323 ) ( IN-CITY ?auto_1949326 ?auto_1949324 ) ( not ( = ?auto_1949316 ?auto_1949326 ) ) ( OBJ-AT ?auto_1949319 ?auto_1949326 ) ( OBJ-AT ?auto_1949318 ?auto_1949327 ) ( OBJ-AT ?auto_1949320 ?auto_1949323 ) ( OBJ-AT ?auto_1949317 ?auto_1949323 ) ( TRUCK-AT ?auto_1949325 ?auto_1949316 ) ( not ( = ?auto_1949317 ?auto_1949320 ) ) ( not ( = ?auto_1949317 ?auto_1949318 ) ) ( not ( = ?auto_1949320 ?auto_1949318 ) ) ( not ( = ?auto_1949327 ?auto_1949323 ) ) ( not ( = ?auto_1949317 ?auto_1949319 ) ) ( not ( = ?auto_1949320 ?auto_1949319 ) ) ( not ( = ?auto_1949318 ?auto_1949319 ) ) ( not ( = ?auto_1949326 ?auto_1949327 ) ) ( not ( = ?auto_1949326 ?auto_1949323 ) ) ( not ( = ?auto_1949317 ?auto_1949322 ) ) ( not ( = ?auto_1949320 ?auto_1949322 ) ) ( not ( = ?auto_1949318 ?auto_1949322 ) ) ( not ( = ?auto_1949319 ?auto_1949322 ) ) ( not ( = ?auto_1949317 ?auto_1949321 ) ) ( not ( = ?auto_1949320 ?auto_1949321 ) ) ( not ( = ?auto_1949318 ?auto_1949321 ) ) ( not ( = ?auto_1949319 ?auto_1949321 ) ) ( not ( = ?auto_1949322 ?auto_1949321 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_1949317 ?auto_1949320 ?auto_1949318 ?auto_1949319 ?auto_1949321 ?auto_1949322 ?auto_1949316 )
      ( DELIVER-6PKG-VERIFY ?auto_1949317 ?auto_1949318 ?auto_1949319 ?auto_1949320 ?auto_1949321 ?auto_1949322 ?auto_1949316 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_1949907 - OBJ
      ?auto_1949908 - OBJ
      ?auto_1949909 - OBJ
      ?auto_1949910 - OBJ
      ?auto_1949911 - OBJ
      ?auto_1949912 - OBJ
      ?auto_1949906 - LOCATION
    )
    :vars
    (
      ?auto_1949917 - LOCATION
      ?auto_1949914 - CITY
      ?auto_1949913 - LOCATION
      ?auto_1949916 - LOCATION
      ?auto_1949915 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1949917 ?auto_1949914 ) ( IN-CITY ?auto_1949906 ?auto_1949914 ) ( not ( = ?auto_1949906 ?auto_1949917 ) ) ( OBJ-AT ?auto_1949910 ?auto_1949917 ) ( IN-CITY ?auto_1949913 ?auto_1949914 ) ( not ( = ?auto_1949906 ?auto_1949913 ) ) ( OBJ-AT ?auto_1949912 ?auto_1949913 ) ( IN-CITY ?auto_1949916 ?auto_1949914 ) ( not ( = ?auto_1949906 ?auto_1949916 ) ) ( OBJ-AT ?auto_1949909 ?auto_1949916 ) ( OBJ-AT ?auto_1949908 ?auto_1949917 ) ( OBJ-AT ?auto_1949911 ?auto_1949913 ) ( OBJ-AT ?auto_1949907 ?auto_1949913 ) ( TRUCK-AT ?auto_1949915 ?auto_1949906 ) ( not ( = ?auto_1949907 ?auto_1949911 ) ) ( not ( = ?auto_1949907 ?auto_1949908 ) ) ( not ( = ?auto_1949911 ?auto_1949908 ) ) ( not ( = ?auto_1949917 ?auto_1949913 ) ) ( not ( = ?auto_1949907 ?auto_1949909 ) ) ( not ( = ?auto_1949911 ?auto_1949909 ) ) ( not ( = ?auto_1949908 ?auto_1949909 ) ) ( not ( = ?auto_1949916 ?auto_1949917 ) ) ( not ( = ?auto_1949916 ?auto_1949913 ) ) ( not ( = ?auto_1949907 ?auto_1949912 ) ) ( not ( = ?auto_1949911 ?auto_1949912 ) ) ( not ( = ?auto_1949908 ?auto_1949912 ) ) ( not ( = ?auto_1949909 ?auto_1949912 ) ) ( not ( = ?auto_1949907 ?auto_1949910 ) ) ( not ( = ?auto_1949911 ?auto_1949910 ) ) ( not ( = ?auto_1949908 ?auto_1949910 ) ) ( not ( = ?auto_1949909 ?auto_1949910 ) ) ( not ( = ?auto_1949912 ?auto_1949910 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_1949907 ?auto_1949911 ?auto_1949908 ?auto_1949909 ?auto_1949910 ?auto_1949912 ?auto_1949906 )
      ( DELIVER-6PKG-VERIFY ?auto_1949907 ?auto_1949908 ?auto_1949909 ?auto_1949910 ?auto_1949911 ?auto_1949912 ?auto_1949906 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_1952239 - OBJ
      ?auto_1952240 - OBJ
      ?auto_1952241 - OBJ
      ?auto_1952242 - OBJ
      ?auto_1952243 - OBJ
      ?auto_1952244 - OBJ
      ?auto_1952238 - LOCATION
    )
    :vars
    (
      ?auto_1952249 - LOCATION
      ?auto_1952246 - CITY
      ?auto_1952245 - LOCATION
      ?auto_1952248 - LOCATION
      ?auto_1952247 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1952249 ?auto_1952246 ) ( IN-CITY ?auto_1952238 ?auto_1952246 ) ( not ( = ?auto_1952238 ?auto_1952249 ) ) ( OBJ-AT ?auto_1952241 ?auto_1952249 ) ( IN-CITY ?auto_1952245 ?auto_1952246 ) ( not ( = ?auto_1952238 ?auto_1952245 ) ) ( OBJ-AT ?auto_1952244 ?auto_1952245 ) ( IN-CITY ?auto_1952248 ?auto_1952246 ) ( not ( = ?auto_1952238 ?auto_1952248 ) ) ( OBJ-AT ?auto_1952243 ?auto_1952248 ) ( OBJ-AT ?auto_1952240 ?auto_1952249 ) ( OBJ-AT ?auto_1952242 ?auto_1952245 ) ( OBJ-AT ?auto_1952239 ?auto_1952245 ) ( TRUCK-AT ?auto_1952247 ?auto_1952238 ) ( not ( = ?auto_1952239 ?auto_1952242 ) ) ( not ( = ?auto_1952239 ?auto_1952240 ) ) ( not ( = ?auto_1952242 ?auto_1952240 ) ) ( not ( = ?auto_1952249 ?auto_1952245 ) ) ( not ( = ?auto_1952239 ?auto_1952243 ) ) ( not ( = ?auto_1952242 ?auto_1952243 ) ) ( not ( = ?auto_1952240 ?auto_1952243 ) ) ( not ( = ?auto_1952248 ?auto_1952249 ) ) ( not ( = ?auto_1952248 ?auto_1952245 ) ) ( not ( = ?auto_1952239 ?auto_1952244 ) ) ( not ( = ?auto_1952242 ?auto_1952244 ) ) ( not ( = ?auto_1952240 ?auto_1952244 ) ) ( not ( = ?auto_1952243 ?auto_1952244 ) ) ( not ( = ?auto_1952239 ?auto_1952241 ) ) ( not ( = ?auto_1952242 ?auto_1952241 ) ) ( not ( = ?auto_1952240 ?auto_1952241 ) ) ( not ( = ?auto_1952243 ?auto_1952241 ) ) ( not ( = ?auto_1952244 ?auto_1952241 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_1952239 ?auto_1952242 ?auto_1952240 ?auto_1952243 ?auto_1952241 ?auto_1952244 ?auto_1952238 )
      ( DELIVER-6PKG-VERIFY ?auto_1952239 ?auto_1952240 ?auto_1952241 ?auto_1952242 ?auto_1952243 ?auto_1952244 ?auto_1952238 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_1952303 - OBJ
      ?auto_1952304 - OBJ
      ?auto_1952305 - OBJ
      ?auto_1952306 - OBJ
      ?auto_1952307 - OBJ
      ?auto_1952308 - OBJ
      ?auto_1952302 - LOCATION
    )
    :vars
    (
      ?auto_1952313 - LOCATION
      ?auto_1952310 - CITY
      ?auto_1952309 - LOCATION
      ?auto_1952312 - LOCATION
      ?auto_1952311 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1952313 ?auto_1952310 ) ( IN-CITY ?auto_1952302 ?auto_1952310 ) ( not ( = ?auto_1952302 ?auto_1952313 ) ) ( OBJ-AT ?auto_1952305 ?auto_1952313 ) ( IN-CITY ?auto_1952309 ?auto_1952310 ) ( not ( = ?auto_1952302 ?auto_1952309 ) ) ( OBJ-AT ?auto_1952307 ?auto_1952309 ) ( IN-CITY ?auto_1952312 ?auto_1952310 ) ( not ( = ?auto_1952302 ?auto_1952312 ) ) ( OBJ-AT ?auto_1952308 ?auto_1952312 ) ( OBJ-AT ?auto_1952304 ?auto_1952313 ) ( OBJ-AT ?auto_1952306 ?auto_1952309 ) ( OBJ-AT ?auto_1952303 ?auto_1952309 ) ( TRUCK-AT ?auto_1952311 ?auto_1952302 ) ( not ( = ?auto_1952303 ?auto_1952306 ) ) ( not ( = ?auto_1952303 ?auto_1952304 ) ) ( not ( = ?auto_1952306 ?auto_1952304 ) ) ( not ( = ?auto_1952313 ?auto_1952309 ) ) ( not ( = ?auto_1952303 ?auto_1952308 ) ) ( not ( = ?auto_1952306 ?auto_1952308 ) ) ( not ( = ?auto_1952304 ?auto_1952308 ) ) ( not ( = ?auto_1952312 ?auto_1952313 ) ) ( not ( = ?auto_1952312 ?auto_1952309 ) ) ( not ( = ?auto_1952303 ?auto_1952307 ) ) ( not ( = ?auto_1952306 ?auto_1952307 ) ) ( not ( = ?auto_1952304 ?auto_1952307 ) ) ( not ( = ?auto_1952308 ?auto_1952307 ) ) ( not ( = ?auto_1952303 ?auto_1952305 ) ) ( not ( = ?auto_1952306 ?auto_1952305 ) ) ( not ( = ?auto_1952304 ?auto_1952305 ) ) ( not ( = ?auto_1952308 ?auto_1952305 ) ) ( not ( = ?auto_1952307 ?auto_1952305 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_1952303 ?auto_1952306 ?auto_1952304 ?auto_1952308 ?auto_1952305 ?auto_1952307 ?auto_1952302 )
      ( DELIVER-6PKG-VERIFY ?auto_1952303 ?auto_1952304 ?auto_1952305 ?auto_1952306 ?auto_1952307 ?auto_1952308 ?auto_1952302 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_1953064 - OBJ
      ?auto_1953065 - OBJ
      ?auto_1953066 - OBJ
      ?auto_1953067 - OBJ
      ?auto_1953068 - OBJ
      ?auto_1953069 - OBJ
      ?auto_1953063 - LOCATION
    )
    :vars
    (
      ?auto_1953074 - LOCATION
      ?auto_1953071 - CITY
      ?auto_1953070 - LOCATION
      ?auto_1953073 - LOCATION
      ?auto_1953072 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1953074 ?auto_1953071 ) ( IN-CITY ?auto_1953063 ?auto_1953071 ) ( not ( = ?auto_1953063 ?auto_1953074 ) ) ( OBJ-AT ?auto_1953066 ?auto_1953074 ) ( IN-CITY ?auto_1953070 ?auto_1953071 ) ( not ( = ?auto_1953063 ?auto_1953070 ) ) ( OBJ-AT ?auto_1953069 ?auto_1953070 ) ( IN-CITY ?auto_1953073 ?auto_1953071 ) ( not ( = ?auto_1953063 ?auto_1953073 ) ) ( OBJ-AT ?auto_1953067 ?auto_1953073 ) ( OBJ-AT ?auto_1953065 ?auto_1953074 ) ( OBJ-AT ?auto_1953068 ?auto_1953070 ) ( OBJ-AT ?auto_1953064 ?auto_1953070 ) ( TRUCK-AT ?auto_1953072 ?auto_1953063 ) ( not ( = ?auto_1953064 ?auto_1953068 ) ) ( not ( = ?auto_1953064 ?auto_1953065 ) ) ( not ( = ?auto_1953068 ?auto_1953065 ) ) ( not ( = ?auto_1953074 ?auto_1953070 ) ) ( not ( = ?auto_1953064 ?auto_1953067 ) ) ( not ( = ?auto_1953068 ?auto_1953067 ) ) ( not ( = ?auto_1953065 ?auto_1953067 ) ) ( not ( = ?auto_1953073 ?auto_1953074 ) ) ( not ( = ?auto_1953073 ?auto_1953070 ) ) ( not ( = ?auto_1953064 ?auto_1953069 ) ) ( not ( = ?auto_1953068 ?auto_1953069 ) ) ( not ( = ?auto_1953065 ?auto_1953069 ) ) ( not ( = ?auto_1953067 ?auto_1953069 ) ) ( not ( = ?auto_1953064 ?auto_1953066 ) ) ( not ( = ?auto_1953068 ?auto_1953066 ) ) ( not ( = ?auto_1953065 ?auto_1953066 ) ) ( not ( = ?auto_1953067 ?auto_1953066 ) ) ( not ( = ?auto_1953069 ?auto_1953066 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_1953064 ?auto_1953068 ?auto_1953065 ?auto_1953067 ?auto_1953066 ?auto_1953069 ?auto_1953063 )
      ( DELIVER-6PKG-VERIFY ?auto_1953064 ?auto_1953065 ?auto_1953066 ?auto_1953067 ?auto_1953068 ?auto_1953069 ?auto_1953063 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_1956013 - OBJ
      ?auto_1956014 - OBJ
      ?auto_1956015 - OBJ
      ?auto_1956016 - OBJ
      ?auto_1956017 - OBJ
      ?auto_1956018 - OBJ
      ?auto_1956012 - LOCATION
    )
    :vars
    (
      ?auto_1956023 - LOCATION
      ?auto_1956020 - CITY
      ?auto_1956019 - LOCATION
      ?auto_1956022 - LOCATION
      ?auto_1956021 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1956023 ?auto_1956020 ) ( IN-CITY ?auto_1956012 ?auto_1956020 ) ( not ( = ?auto_1956012 ?auto_1956023 ) ) ( OBJ-AT ?auto_1956018 ?auto_1956023 ) ( IN-CITY ?auto_1956019 ?auto_1956020 ) ( not ( = ?auto_1956012 ?auto_1956019 ) ) ( OBJ-AT ?auto_1956017 ?auto_1956019 ) ( IN-CITY ?auto_1956022 ?auto_1956020 ) ( not ( = ?auto_1956012 ?auto_1956022 ) ) ( OBJ-AT ?auto_1956014 ?auto_1956022 ) ( OBJ-AT ?auto_1956016 ?auto_1956023 ) ( OBJ-AT ?auto_1956015 ?auto_1956019 ) ( OBJ-AT ?auto_1956013 ?auto_1956019 ) ( TRUCK-AT ?auto_1956021 ?auto_1956012 ) ( not ( = ?auto_1956013 ?auto_1956015 ) ) ( not ( = ?auto_1956013 ?auto_1956016 ) ) ( not ( = ?auto_1956015 ?auto_1956016 ) ) ( not ( = ?auto_1956023 ?auto_1956019 ) ) ( not ( = ?auto_1956013 ?auto_1956014 ) ) ( not ( = ?auto_1956015 ?auto_1956014 ) ) ( not ( = ?auto_1956016 ?auto_1956014 ) ) ( not ( = ?auto_1956022 ?auto_1956023 ) ) ( not ( = ?auto_1956022 ?auto_1956019 ) ) ( not ( = ?auto_1956013 ?auto_1956017 ) ) ( not ( = ?auto_1956015 ?auto_1956017 ) ) ( not ( = ?auto_1956016 ?auto_1956017 ) ) ( not ( = ?auto_1956014 ?auto_1956017 ) ) ( not ( = ?auto_1956013 ?auto_1956018 ) ) ( not ( = ?auto_1956015 ?auto_1956018 ) ) ( not ( = ?auto_1956016 ?auto_1956018 ) ) ( not ( = ?auto_1956014 ?auto_1956018 ) ) ( not ( = ?auto_1956017 ?auto_1956018 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_1956013 ?auto_1956015 ?auto_1956016 ?auto_1956014 ?auto_1956018 ?auto_1956017 ?auto_1956012 )
      ( DELIVER-6PKG-VERIFY ?auto_1956013 ?auto_1956014 ?auto_1956015 ?auto_1956016 ?auto_1956017 ?auto_1956018 ?auto_1956012 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_1956077 - OBJ
      ?auto_1956078 - OBJ
      ?auto_1956079 - OBJ
      ?auto_1956080 - OBJ
      ?auto_1956081 - OBJ
      ?auto_1956082 - OBJ
      ?auto_1956076 - LOCATION
    )
    :vars
    (
      ?auto_1956087 - LOCATION
      ?auto_1956084 - CITY
      ?auto_1956083 - LOCATION
      ?auto_1956086 - LOCATION
      ?auto_1956085 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1956087 ?auto_1956084 ) ( IN-CITY ?auto_1956076 ?auto_1956084 ) ( not ( = ?auto_1956076 ?auto_1956087 ) ) ( OBJ-AT ?auto_1956081 ?auto_1956087 ) ( IN-CITY ?auto_1956083 ?auto_1956084 ) ( not ( = ?auto_1956076 ?auto_1956083 ) ) ( OBJ-AT ?auto_1956082 ?auto_1956083 ) ( IN-CITY ?auto_1956086 ?auto_1956084 ) ( not ( = ?auto_1956076 ?auto_1956086 ) ) ( OBJ-AT ?auto_1956078 ?auto_1956086 ) ( OBJ-AT ?auto_1956080 ?auto_1956087 ) ( OBJ-AT ?auto_1956079 ?auto_1956083 ) ( OBJ-AT ?auto_1956077 ?auto_1956083 ) ( TRUCK-AT ?auto_1956085 ?auto_1956076 ) ( not ( = ?auto_1956077 ?auto_1956079 ) ) ( not ( = ?auto_1956077 ?auto_1956080 ) ) ( not ( = ?auto_1956079 ?auto_1956080 ) ) ( not ( = ?auto_1956087 ?auto_1956083 ) ) ( not ( = ?auto_1956077 ?auto_1956078 ) ) ( not ( = ?auto_1956079 ?auto_1956078 ) ) ( not ( = ?auto_1956080 ?auto_1956078 ) ) ( not ( = ?auto_1956086 ?auto_1956087 ) ) ( not ( = ?auto_1956086 ?auto_1956083 ) ) ( not ( = ?auto_1956077 ?auto_1956082 ) ) ( not ( = ?auto_1956079 ?auto_1956082 ) ) ( not ( = ?auto_1956080 ?auto_1956082 ) ) ( not ( = ?auto_1956078 ?auto_1956082 ) ) ( not ( = ?auto_1956077 ?auto_1956081 ) ) ( not ( = ?auto_1956079 ?auto_1956081 ) ) ( not ( = ?auto_1956080 ?auto_1956081 ) ) ( not ( = ?auto_1956078 ?auto_1956081 ) ) ( not ( = ?auto_1956082 ?auto_1956081 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_1956077 ?auto_1956079 ?auto_1956080 ?auto_1956078 ?auto_1956081 ?auto_1956082 ?auto_1956076 )
      ( DELIVER-6PKG-VERIFY ?auto_1956077 ?auto_1956078 ?auto_1956079 ?auto_1956080 ?auto_1956081 ?auto_1956082 ?auto_1956076 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_1956278 - OBJ
      ?auto_1956279 - OBJ
      ?auto_1956280 - OBJ
      ?auto_1956281 - OBJ
      ?auto_1956282 - OBJ
      ?auto_1956283 - OBJ
      ?auto_1956277 - LOCATION
    )
    :vars
    (
      ?auto_1956288 - LOCATION
      ?auto_1956285 - CITY
      ?auto_1956284 - LOCATION
      ?auto_1956287 - LOCATION
      ?auto_1956286 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1956288 ?auto_1956285 ) ( IN-CITY ?auto_1956277 ?auto_1956285 ) ( not ( = ?auto_1956277 ?auto_1956288 ) ) ( OBJ-AT ?auto_1956283 ?auto_1956288 ) ( IN-CITY ?auto_1956284 ?auto_1956285 ) ( not ( = ?auto_1956277 ?auto_1956284 ) ) ( OBJ-AT ?auto_1956281 ?auto_1956284 ) ( IN-CITY ?auto_1956287 ?auto_1956285 ) ( not ( = ?auto_1956277 ?auto_1956287 ) ) ( OBJ-AT ?auto_1956279 ?auto_1956287 ) ( OBJ-AT ?auto_1956282 ?auto_1956288 ) ( OBJ-AT ?auto_1956280 ?auto_1956284 ) ( OBJ-AT ?auto_1956278 ?auto_1956284 ) ( TRUCK-AT ?auto_1956286 ?auto_1956277 ) ( not ( = ?auto_1956278 ?auto_1956280 ) ) ( not ( = ?auto_1956278 ?auto_1956282 ) ) ( not ( = ?auto_1956280 ?auto_1956282 ) ) ( not ( = ?auto_1956288 ?auto_1956284 ) ) ( not ( = ?auto_1956278 ?auto_1956279 ) ) ( not ( = ?auto_1956280 ?auto_1956279 ) ) ( not ( = ?auto_1956282 ?auto_1956279 ) ) ( not ( = ?auto_1956287 ?auto_1956288 ) ) ( not ( = ?auto_1956287 ?auto_1956284 ) ) ( not ( = ?auto_1956278 ?auto_1956281 ) ) ( not ( = ?auto_1956280 ?auto_1956281 ) ) ( not ( = ?auto_1956282 ?auto_1956281 ) ) ( not ( = ?auto_1956279 ?auto_1956281 ) ) ( not ( = ?auto_1956278 ?auto_1956283 ) ) ( not ( = ?auto_1956280 ?auto_1956283 ) ) ( not ( = ?auto_1956282 ?auto_1956283 ) ) ( not ( = ?auto_1956279 ?auto_1956283 ) ) ( not ( = ?auto_1956281 ?auto_1956283 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_1956278 ?auto_1956280 ?auto_1956282 ?auto_1956279 ?auto_1956283 ?auto_1956281 ?auto_1956277 )
      ( DELIVER-6PKG-VERIFY ?auto_1956278 ?auto_1956279 ?auto_1956280 ?auto_1956281 ?auto_1956282 ?auto_1956283 ?auto_1956277 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_1957062 - OBJ
      ?auto_1957063 - OBJ
      ?auto_1957064 - OBJ
      ?auto_1957065 - OBJ
      ?auto_1957066 - OBJ
      ?auto_1957067 - OBJ
      ?auto_1957061 - LOCATION
    )
    :vars
    (
      ?auto_1957072 - LOCATION
      ?auto_1957069 - CITY
      ?auto_1957068 - LOCATION
      ?auto_1957071 - LOCATION
      ?auto_1957070 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1957072 ?auto_1957069 ) ( IN-CITY ?auto_1957061 ?auto_1957069 ) ( not ( = ?auto_1957061 ?auto_1957072 ) ) ( OBJ-AT ?auto_1957067 ?auto_1957072 ) ( IN-CITY ?auto_1957068 ?auto_1957069 ) ( not ( = ?auto_1957061 ?auto_1957068 ) ) ( OBJ-AT ?auto_1957066 ?auto_1957068 ) ( IN-CITY ?auto_1957071 ?auto_1957069 ) ( not ( = ?auto_1957061 ?auto_1957071 ) ) ( OBJ-AT ?auto_1957063 ?auto_1957071 ) ( OBJ-AT ?auto_1957064 ?auto_1957072 ) ( OBJ-AT ?auto_1957065 ?auto_1957068 ) ( OBJ-AT ?auto_1957062 ?auto_1957068 ) ( TRUCK-AT ?auto_1957070 ?auto_1957061 ) ( not ( = ?auto_1957062 ?auto_1957065 ) ) ( not ( = ?auto_1957062 ?auto_1957064 ) ) ( not ( = ?auto_1957065 ?auto_1957064 ) ) ( not ( = ?auto_1957072 ?auto_1957068 ) ) ( not ( = ?auto_1957062 ?auto_1957063 ) ) ( not ( = ?auto_1957065 ?auto_1957063 ) ) ( not ( = ?auto_1957064 ?auto_1957063 ) ) ( not ( = ?auto_1957071 ?auto_1957072 ) ) ( not ( = ?auto_1957071 ?auto_1957068 ) ) ( not ( = ?auto_1957062 ?auto_1957066 ) ) ( not ( = ?auto_1957065 ?auto_1957066 ) ) ( not ( = ?auto_1957064 ?auto_1957066 ) ) ( not ( = ?auto_1957063 ?auto_1957066 ) ) ( not ( = ?auto_1957062 ?auto_1957067 ) ) ( not ( = ?auto_1957065 ?auto_1957067 ) ) ( not ( = ?auto_1957064 ?auto_1957067 ) ) ( not ( = ?auto_1957063 ?auto_1957067 ) ) ( not ( = ?auto_1957066 ?auto_1957067 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_1957062 ?auto_1957065 ?auto_1957064 ?auto_1957063 ?auto_1957067 ?auto_1957066 ?auto_1957061 )
      ( DELIVER-6PKG-VERIFY ?auto_1957062 ?auto_1957063 ?auto_1957064 ?auto_1957065 ?auto_1957066 ?auto_1957067 ?auto_1957061 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_1957126 - OBJ
      ?auto_1957127 - OBJ
      ?auto_1957128 - OBJ
      ?auto_1957129 - OBJ
      ?auto_1957130 - OBJ
      ?auto_1957131 - OBJ
      ?auto_1957125 - LOCATION
    )
    :vars
    (
      ?auto_1957136 - LOCATION
      ?auto_1957133 - CITY
      ?auto_1957132 - LOCATION
      ?auto_1957135 - LOCATION
      ?auto_1957134 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1957136 ?auto_1957133 ) ( IN-CITY ?auto_1957125 ?auto_1957133 ) ( not ( = ?auto_1957125 ?auto_1957136 ) ) ( OBJ-AT ?auto_1957130 ?auto_1957136 ) ( IN-CITY ?auto_1957132 ?auto_1957133 ) ( not ( = ?auto_1957125 ?auto_1957132 ) ) ( OBJ-AT ?auto_1957131 ?auto_1957132 ) ( IN-CITY ?auto_1957135 ?auto_1957133 ) ( not ( = ?auto_1957125 ?auto_1957135 ) ) ( OBJ-AT ?auto_1957127 ?auto_1957135 ) ( OBJ-AT ?auto_1957128 ?auto_1957136 ) ( OBJ-AT ?auto_1957129 ?auto_1957132 ) ( OBJ-AT ?auto_1957126 ?auto_1957132 ) ( TRUCK-AT ?auto_1957134 ?auto_1957125 ) ( not ( = ?auto_1957126 ?auto_1957129 ) ) ( not ( = ?auto_1957126 ?auto_1957128 ) ) ( not ( = ?auto_1957129 ?auto_1957128 ) ) ( not ( = ?auto_1957136 ?auto_1957132 ) ) ( not ( = ?auto_1957126 ?auto_1957127 ) ) ( not ( = ?auto_1957129 ?auto_1957127 ) ) ( not ( = ?auto_1957128 ?auto_1957127 ) ) ( not ( = ?auto_1957135 ?auto_1957136 ) ) ( not ( = ?auto_1957135 ?auto_1957132 ) ) ( not ( = ?auto_1957126 ?auto_1957131 ) ) ( not ( = ?auto_1957129 ?auto_1957131 ) ) ( not ( = ?auto_1957128 ?auto_1957131 ) ) ( not ( = ?auto_1957127 ?auto_1957131 ) ) ( not ( = ?auto_1957126 ?auto_1957130 ) ) ( not ( = ?auto_1957129 ?auto_1957130 ) ) ( not ( = ?auto_1957128 ?auto_1957130 ) ) ( not ( = ?auto_1957127 ?auto_1957130 ) ) ( not ( = ?auto_1957131 ?auto_1957130 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_1957126 ?auto_1957129 ?auto_1957128 ?auto_1957127 ?auto_1957130 ?auto_1957131 ?auto_1957125 )
      ( DELIVER-6PKG-VERIFY ?auto_1957126 ?auto_1957127 ?auto_1957128 ?auto_1957129 ?auto_1957130 ?auto_1957131 ?auto_1957125 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_1957716 - OBJ
      ?auto_1957717 - OBJ
      ?auto_1957718 - OBJ
      ?auto_1957719 - OBJ
      ?auto_1957720 - OBJ
      ?auto_1957721 - OBJ
      ?auto_1957715 - LOCATION
    )
    :vars
    (
      ?auto_1957726 - LOCATION
      ?auto_1957723 - CITY
      ?auto_1957722 - LOCATION
      ?auto_1957725 - LOCATION
      ?auto_1957724 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1957726 ?auto_1957723 ) ( IN-CITY ?auto_1957715 ?auto_1957723 ) ( not ( = ?auto_1957715 ?auto_1957726 ) ) ( OBJ-AT ?auto_1957719 ?auto_1957726 ) ( IN-CITY ?auto_1957722 ?auto_1957723 ) ( not ( = ?auto_1957715 ?auto_1957722 ) ) ( OBJ-AT ?auto_1957721 ?auto_1957722 ) ( IN-CITY ?auto_1957725 ?auto_1957723 ) ( not ( = ?auto_1957715 ?auto_1957725 ) ) ( OBJ-AT ?auto_1957717 ?auto_1957725 ) ( OBJ-AT ?auto_1957718 ?auto_1957726 ) ( OBJ-AT ?auto_1957720 ?auto_1957722 ) ( OBJ-AT ?auto_1957716 ?auto_1957722 ) ( TRUCK-AT ?auto_1957724 ?auto_1957715 ) ( not ( = ?auto_1957716 ?auto_1957720 ) ) ( not ( = ?auto_1957716 ?auto_1957718 ) ) ( not ( = ?auto_1957720 ?auto_1957718 ) ) ( not ( = ?auto_1957726 ?auto_1957722 ) ) ( not ( = ?auto_1957716 ?auto_1957717 ) ) ( not ( = ?auto_1957720 ?auto_1957717 ) ) ( not ( = ?auto_1957718 ?auto_1957717 ) ) ( not ( = ?auto_1957725 ?auto_1957726 ) ) ( not ( = ?auto_1957725 ?auto_1957722 ) ) ( not ( = ?auto_1957716 ?auto_1957721 ) ) ( not ( = ?auto_1957720 ?auto_1957721 ) ) ( not ( = ?auto_1957718 ?auto_1957721 ) ) ( not ( = ?auto_1957717 ?auto_1957721 ) ) ( not ( = ?auto_1957716 ?auto_1957719 ) ) ( not ( = ?auto_1957720 ?auto_1957719 ) ) ( not ( = ?auto_1957718 ?auto_1957719 ) ) ( not ( = ?auto_1957717 ?auto_1957719 ) ) ( not ( = ?auto_1957721 ?auto_1957719 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_1957716 ?auto_1957720 ?auto_1957718 ?auto_1957717 ?auto_1957719 ?auto_1957721 ?auto_1957715 )
      ( DELIVER-6PKG-VERIFY ?auto_1957716 ?auto_1957717 ?auto_1957718 ?auto_1957719 ?auto_1957720 ?auto_1957721 ?auto_1957715 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_2055819 - OBJ
      ?auto_2055820 - OBJ
      ?auto_2055821 - OBJ
      ?auto_2055822 - OBJ
      ?auto_2055823 - OBJ
      ?auto_2055824 - OBJ
      ?auto_2055818 - LOCATION
    )
    :vars
    (
      ?auto_2055829 - LOCATION
      ?auto_2055826 - CITY
      ?auto_2055825 - LOCATION
      ?auto_2055828 - LOCATION
      ?auto_2055827 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2055829 ?auto_2055826 ) ( IN-CITY ?auto_2055818 ?auto_2055826 ) ( not ( = ?auto_2055818 ?auto_2055829 ) ) ( OBJ-AT ?auto_2055824 ?auto_2055829 ) ( IN-CITY ?auto_2055825 ?auto_2055826 ) ( not ( = ?auto_2055818 ?auto_2055825 ) ) ( OBJ-AT ?auto_2055823 ?auto_2055825 ) ( IN-CITY ?auto_2055828 ?auto_2055826 ) ( not ( = ?auto_2055818 ?auto_2055828 ) ) ( OBJ-AT ?auto_2055822 ?auto_2055828 ) ( OBJ-AT ?auto_2055819 ?auto_2055829 ) ( OBJ-AT ?auto_2055821 ?auto_2055825 ) ( OBJ-AT ?auto_2055820 ?auto_2055825 ) ( TRUCK-AT ?auto_2055827 ?auto_2055818 ) ( not ( = ?auto_2055820 ?auto_2055821 ) ) ( not ( = ?auto_2055820 ?auto_2055819 ) ) ( not ( = ?auto_2055821 ?auto_2055819 ) ) ( not ( = ?auto_2055829 ?auto_2055825 ) ) ( not ( = ?auto_2055820 ?auto_2055822 ) ) ( not ( = ?auto_2055821 ?auto_2055822 ) ) ( not ( = ?auto_2055819 ?auto_2055822 ) ) ( not ( = ?auto_2055828 ?auto_2055829 ) ) ( not ( = ?auto_2055828 ?auto_2055825 ) ) ( not ( = ?auto_2055820 ?auto_2055823 ) ) ( not ( = ?auto_2055821 ?auto_2055823 ) ) ( not ( = ?auto_2055819 ?auto_2055823 ) ) ( not ( = ?auto_2055822 ?auto_2055823 ) ) ( not ( = ?auto_2055820 ?auto_2055824 ) ) ( not ( = ?auto_2055821 ?auto_2055824 ) ) ( not ( = ?auto_2055819 ?auto_2055824 ) ) ( not ( = ?auto_2055822 ?auto_2055824 ) ) ( not ( = ?auto_2055823 ?auto_2055824 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_2055820 ?auto_2055821 ?auto_2055819 ?auto_2055822 ?auto_2055824 ?auto_2055823 ?auto_2055818 )
      ( DELIVER-6PKG-VERIFY ?auto_2055819 ?auto_2055820 ?auto_2055821 ?auto_2055822 ?auto_2055823 ?auto_2055824 ?auto_2055818 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_2055883 - OBJ
      ?auto_2055884 - OBJ
      ?auto_2055885 - OBJ
      ?auto_2055886 - OBJ
      ?auto_2055887 - OBJ
      ?auto_2055888 - OBJ
      ?auto_2055882 - LOCATION
    )
    :vars
    (
      ?auto_2055893 - LOCATION
      ?auto_2055890 - CITY
      ?auto_2055889 - LOCATION
      ?auto_2055892 - LOCATION
      ?auto_2055891 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2055893 ?auto_2055890 ) ( IN-CITY ?auto_2055882 ?auto_2055890 ) ( not ( = ?auto_2055882 ?auto_2055893 ) ) ( OBJ-AT ?auto_2055887 ?auto_2055893 ) ( IN-CITY ?auto_2055889 ?auto_2055890 ) ( not ( = ?auto_2055882 ?auto_2055889 ) ) ( OBJ-AT ?auto_2055888 ?auto_2055889 ) ( IN-CITY ?auto_2055892 ?auto_2055890 ) ( not ( = ?auto_2055882 ?auto_2055892 ) ) ( OBJ-AT ?auto_2055886 ?auto_2055892 ) ( OBJ-AT ?auto_2055883 ?auto_2055893 ) ( OBJ-AT ?auto_2055885 ?auto_2055889 ) ( OBJ-AT ?auto_2055884 ?auto_2055889 ) ( TRUCK-AT ?auto_2055891 ?auto_2055882 ) ( not ( = ?auto_2055884 ?auto_2055885 ) ) ( not ( = ?auto_2055884 ?auto_2055883 ) ) ( not ( = ?auto_2055885 ?auto_2055883 ) ) ( not ( = ?auto_2055893 ?auto_2055889 ) ) ( not ( = ?auto_2055884 ?auto_2055886 ) ) ( not ( = ?auto_2055885 ?auto_2055886 ) ) ( not ( = ?auto_2055883 ?auto_2055886 ) ) ( not ( = ?auto_2055892 ?auto_2055893 ) ) ( not ( = ?auto_2055892 ?auto_2055889 ) ) ( not ( = ?auto_2055884 ?auto_2055888 ) ) ( not ( = ?auto_2055885 ?auto_2055888 ) ) ( not ( = ?auto_2055883 ?auto_2055888 ) ) ( not ( = ?auto_2055886 ?auto_2055888 ) ) ( not ( = ?auto_2055884 ?auto_2055887 ) ) ( not ( = ?auto_2055885 ?auto_2055887 ) ) ( not ( = ?auto_2055883 ?auto_2055887 ) ) ( not ( = ?auto_2055886 ?auto_2055887 ) ) ( not ( = ?auto_2055888 ?auto_2055887 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_2055884 ?auto_2055885 ?auto_2055883 ?auto_2055886 ?auto_2055887 ?auto_2055888 ?auto_2055882 )
      ( DELIVER-6PKG-VERIFY ?auto_2055883 ?auto_2055884 ?auto_2055885 ?auto_2055886 ?auto_2055887 ?auto_2055888 ?auto_2055882 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_2055947 - OBJ
      ?auto_2055948 - OBJ
      ?auto_2055949 - OBJ
      ?auto_2055950 - OBJ
      ?auto_2055951 - OBJ
      ?auto_2055952 - OBJ
      ?auto_2055946 - LOCATION
    )
    :vars
    (
      ?auto_2055957 - LOCATION
      ?auto_2055954 - CITY
      ?auto_2055953 - LOCATION
      ?auto_2055956 - LOCATION
      ?auto_2055955 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2055957 ?auto_2055954 ) ( IN-CITY ?auto_2055946 ?auto_2055954 ) ( not ( = ?auto_2055946 ?auto_2055957 ) ) ( OBJ-AT ?auto_2055952 ?auto_2055957 ) ( IN-CITY ?auto_2055953 ?auto_2055954 ) ( not ( = ?auto_2055946 ?auto_2055953 ) ) ( OBJ-AT ?auto_2055950 ?auto_2055953 ) ( IN-CITY ?auto_2055956 ?auto_2055954 ) ( not ( = ?auto_2055946 ?auto_2055956 ) ) ( OBJ-AT ?auto_2055951 ?auto_2055956 ) ( OBJ-AT ?auto_2055947 ?auto_2055957 ) ( OBJ-AT ?auto_2055949 ?auto_2055953 ) ( OBJ-AT ?auto_2055948 ?auto_2055953 ) ( TRUCK-AT ?auto_2055955 ?auto_2055946 ) ( not ( = ?auto_2055948 ?auto_2055949 ) ) ( not ( = ?auto_2055948 ?auto_2055947 ) ) ( not ( = ?auto_2055949 ?auto_2055947 ) ) ( not ( = ?auto_2055957 ?auto_2055953 ) ) ( not ( = ?auto_2055948 ?auto_2055951 ) ) ( not ( = ?auto_2055949 ?auto_2055951 ) ) ( not ( = ?auto_2055947 ?auto_2055951 ) ) ( not ( = ?auto_2055956 ?auto_2055957 ) ) ( not ( = ?auto_2055956 ?auto_2055953 ) ) ( not ( = ?auto_2055948 ?auto_2055950 ) ) ( not ( = ?auto_2055949 ?auto_2055950 ) ) ( not ( = ?auto_2055947 ?auto_2055950 ) ) ( not ( = ?auto_2055951 ?auto_2055950 ) ) ( not ( = ?auto_2055948 ?auto_2055952 ) ) ( not ( = ?auto_2055949 ?auto_2055952 ) ) ( not ( = ?auto_2055947 ?auto_2055952 ) ) ( not ( = ?auto_2055951 ?auto_2055952 ) ) ( not ( = ?auto_2055950 ?auto_2055952 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_2055948 ?auto_2055949 ?auto_2055947 ?auto_2055951 ?auto_2055952 ?auto_2055950 ?auto_2055946 )
      ( DELIVER-6PKG-VERIFY ?auto_2055947 ?auto_2055948 ?auto_2055949 ?auto_2055950 ?auto_2055951 ?auto_2055952 ?auto_2055946 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_2056011 - OBJ
      ?auto_2056012 - OBJ
      ?auto_2056013 - OBJ
      ?auto_2056014 - OBJ
      ?auto_2056015 - OBJ
      ?auto_2056016 - OBJ
      ?auto_2056010 - LOCATION
    )
    :vars
    (
      ?auto_2056021 - LOCATION
      ?auto_2056018 - CITY
      ?auto_2056017 - LOCATION
      ?auto_2056020 - LOCATION
      ?auto_2056019 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2056021 ?auto_2056018 ) ( IN-CITY ?auto_2056010 ?auto_2056018 ) ( not ( = ?auto_2056010 ?auto_2056021 ) ) ( OBJ-AT ?auto_2056015 ?auto_2056021 ) ( IN-CITY ?auto_2056017 ?auto_2056018 ) ( not ( = ?auto_2056010 ?auto_2056017 ) ) ( OBJ-AT ?auto_2056014 ?auto_2056017 ) ( IN-CITY ?auto_2056020 ?auto_2056018 ) ( not ( = ?auto_2056010 ?auto_2056020 ) ) ( OBJ-AT ?auto_2056016 ?auto_2056020 ) ( OBJ-AT ?auto_2056011 ?auto_2056021 ) ( OBJ-AT ?auto_2056013 ?auto_2056017 ) ( OBJ-AT ?auto_2056012 ?auto_2056017 ) ( TRUCK-AT ?auto_2056019 ?auto_2056010 ) ( not ( = ?auto_2056012 ?auto_2056013 ) ) ( not ( = ?auto_2056012 ?auto_2056011 ) ) ( not ( = ?auto_2056013 ?auto_2056011 ) ) ( not ( = ?auto_2056021 ?auto_2056017 ) ) ( not ( = ?auto_2056012 ?auto_2056016 ) ) ( not ( = ?auto_2056013 ?auto_2056016 ) ) ( not ( = ?auto_2056011 ?auto_2056016 ) ) ( not ( = ?auto_2056020 ?auto_2056021 ) ) ( not ( = ?auto_2056020 ?auto_2056017 ) ) ( not ( = ?auto_2056012 ?auto_2056014 ) ) ( not ( = ?auto_2056013 ?auto_2056014 ) ) ( not ( = ?auto_2056011 ?auto_2056014 ) ) ( not ( = ?auto_2056016 ?auto_2056014 ) ) ( not ( = ?auto_2056012 ?auto_2056015 ) ) ( not ( = ?auto_2056013 ?auto_2056015 ) ) ( not ( = ?auto_2056011 ?auto_2056015 ) ) ( not ( = ?auto_2056016 ?auto_2056015 ) ) ( not ( = ?auto_2056014 ?auto_2056015 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_2056012 ?auto_2056013 ?auto_2056011 ?auto_2056016 ?auto_2056015 ?auto_2056014 ?auto_2056010 )
      ( DELIVER-6PKG-VERIFY ?auto_2056011 ?auto_2056012 ?auto_2056013 ?auto_2056014 ?auto_2056015 ?auto_2056016 ?auto_2056010 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_2056347 - OBJ
      ?auto_2056348 - OBJ
      ?auto_2056349 - OBJ
      ?auto_2056350 - OBJ
      ?auto_2056351 - OBJ
      ?auto_2056352 - OBJ
      ?auto_2056346 - LOCATION
    )
    :vars
    (
      ?auto_2056357 - LOCATION
      ?auto_2056354 - CITY
      ?auto_2056353 - LOCATION
      ?auto_2056356 - LOCATION
      ?auto_2056355 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2056357 ?auto_2056354 ) ( IN-CITY ?auto_2056346 ?auto_2056354 ) ( not ( = ?auto_2056346 ?auto_2056357 ) ) ( OBJ-AT ?auto_2056350 ?auto_2056357 ) ( IN-CITY ?auto_2056353 ?auto_2056354 ) ( not ( = ?auto_2056346 ?auto_2056353 ) ) ( OBJ-AT ?auto_2056352 ?auto_2056353 ) ( IN-CITY ?auto_2056356 ?auto_2056354 ) ( not ( = ?auto_2056346 ?auto_2056356 ) ) ( OBJ-AT ?auto_2056351 ?auto_2056356 ) ( OBJ-AT ?auto_2056347 ?auto_2056357 ) ( OBJ-AT ?auto_2056349 ?auto_2056353 ) ( OBJ-AT ?auto_2056348 ?auto_2056353 ) ( TRUCK-AT ?auto_2056355 ?auto_2056346 ) ( not ( = ?auto_2056348 ?auto_2056349 ) ) ( not ( = ?auto_2056348 ?auto_2056347 ) ) ( not ( = ?auto_2056349 ?auto_2056347 ) ) ( not ( = ?auto_2056357 ?auto_2056353 ) ) ( not ( = ?auto_2056348 ?auto_2056351 ) ) ( not ( = ?auto_2056349 ?auto_2056351 ) ) ( not ( = ?auto_2056347 ?auto_2056351 ) ) ( not ( = ?auto_2056356 ?auto_2056357 ) ) ( not ( = ?auto_2056356 ?auto_2056353 ) ) ( not ( = ?auto_2056348 ?auto_2056352 ) ) ( not ( = ?auto_2056349 ?auto_2056352 ) ) ( not ( = ?auto_2056347 ?auto_2056352 ) ) ( not ( = ?auto_2056351 ?auto_2056352 ) ) ( not ( = ?auto_2056348 ?auto_2056350 ) ) ( not ( = ?auto_2056349 ?auto_2056350 ) ) ( not ( = ?auto_2056347 ?auto_2056350 ) ) ( not ( = ?auto_2056351 ?auto_2056350 ) ) ( not ( = ?auto_2056352 ?auto_2056350 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_2056348 ?auto_2056349 ?auto_2056347 ?auto_2056351 ?auto_2056350 ?auto_2056352 ?auto_2056346 )
      ( DELIVER-6PKG-VERIFY ?auto_2056347 ?auto_2056348 ?auto_2056349 ?auto_2056350 ?auto_2056351 ?auto_2056352 ?auto_2056346 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_2056411 - OBJ
      ?auto_2056412 - OBJ
      ?auto_2056413 - OBJ
      ?auto_2056414 - OBJ
      ?auto_2056415 - OBJ
      ?auto_2056416 - OBJ
      ?auto_2056410 - LOCATION
    )
    :vars
    (
      ?auto_2056421 - LOCATION
      ?auto_2056418 - CITY
      ?auto_2056417 - LOCATION
      ?auto_2056420 - LOCATION
      ?auto_2056419 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2056421 ?auto_2056418 ) ( IN-CITY ?auto_2056410 ?auto_2056418 ) ( not ( = ?auto_2056410 ?auto_2056421 ) ) ( OBJ-AT ?auto_2056414 ?auto_2056421 ) ( IN-CITY ?auto_2056417 ?auto_2056418 ) ( not ( = ?auto_2056410 ?auto_2056417 ) ) ( OBJ-AT ?auto_2056415 ?auto_2056417 ) ( IN-CITY ?auto_2056420 ?auto_2056418 ) ( not ( = ?auto_2056410 ?auto_2056420 ) ) ( OBJ-AT ?auto_2056416 ?auto_2056420 ) ( OBJ-AT ?auto_2056411 ?auto_2056421 ) ( OBJ-AT ?auto_2056413 ?auto_2056417 ) ( OBJ-AT ?auto_2056412 ?auto_2056417 ) ( TRUCK-AT ?auto_2056419 ?auto_2056410 ) ( not ( = ?auto_2056412 ?auto_2056413 ) ) ( not ( = ?auto_2056412 ?auto_2056411 ) ) ( not ( = ?auto_2056413 ?auto_2056411 ) ) ( not ( = ?auto_2056421 ?auto_2056417 ) ) ( not ( = ?auto_2056412 ?auto_2056416 ) ) ( not ( = ?auto_2056413 ?auto_2056416 ) ) ( not ( = ?auto_2056411 ?auto_2056416 ) ) ( not ( = ?auto_2056420 ?auto_2056421 ) ) ( not ( = ?auto_2056420 ?auto_2056417 ) ) ( not ( = ?auto_2056412 ?auto_2056415 ) ) ( not ( = ?auto_2056413 ?auto_2056415 ) ) ( not ( = ?auto_2056411 ?auto_2056415 ) ) ( not ( = ?auto_2056416 ?auto_2056415 ) ) ( not ( = ?auto_2056412 ?auto_2056414 ) ) ( not ( = ?auto_2056413 ?auto_2056414 ) ) ( not ( = ?auto_2056411 ?auto_2056414 ) ) ( not ( = ?auto_2056416 ?auto_2056414 ) ) ( not ( = ?auto_2056415 ?auto_2056414 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_2056412 ?auto_2056413 ?auto_2056411 ?auto_2056416 ?auto_2056414 ?auto_2056415 ?auto_2056410 )
      ( DELIVER-6PKG-VERIFY ?auto_2056411 ?auto_2056412 ?auto_2056413 ?auto_2056414 ?auto_2056415 ?auto_2056416 ?auto_2056410 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_2058008 - OBJ
      ?auto_2058009 - OBJ
      ?auto_2058010 - OBJ
      ?auto_2058011 - OBJ
      ?auto_2058012 - OBJ
      ?auto_2058013 - OBJ
      ?auto_2058007 - LOCATION
    )
    :vars
    (
      ?auto_2058018 - LOCATION
      ?auto_2058015 - CITY
      ?auto_2058014 - LOCATION
      ?auto_2058017 - LOCATION
      ?auto_2058016 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2058018 ?auto_2058015 ) ( IN-CITY ?auto_2058007 ?auto_2058015 ) ( not ( = ?auto_2058007 ?auto_2058018 ) ) ( OBJ-AT ?auto_2058013 ?auto_2058018 ) ( IN-CITY ?auto_2058014 ?auto_2058015 ) ( not ( = ?auto_2058007 ?auto_2058014 ) ) ( OBJ-AT ?auto_2058012 ?auto_2058014 ) ( IN-CITY ?auto_2058017 ?auto_2058015 ) ( not ( = ?auto_2058007 ?auto_2058017 ) ) ( OBJ-AT ?auto_2058010 ?auto_2058017 ) ( OBJ-AT ?auto_2058008 ?auto_2058018 ) ( OBJ-AT ?auto_2058011 ?auto_2058014 ) ( OBJ-AT ?auto_2058009 ?auto_2058014 ) ( TRUCK-AT ?auto_2058016 ?auto_2058007 ) ( not ( = ?auto_2058009 ?auto_2058011 ) ) ( not ( = ?auto_2058009 ?auto_2058008 ) ) ( not ( = ?auto_2058011 ?auto_2058008 ) ) ( not ( = ?auto_2058018 ?auto_2058014 ) ) ( not ( = ?auto_2058009 ?auto_2058010 ) ) ( not ( = ?auto_2058011 ?auto_2058010 ) ) ( not ( = ?auto_2058008 ?auto_2058010 ) ) ( not ( = ?auto_2058017 ?auto_2058018 ) ) ( not ( = ?auto_2058017 ?auto_2058014 ) ) ( not ( = ?auto_2058009 ?auto_2058012 ) ) ( not ( = ?auto_2058011 ?auto_2058012 ) ) ( not ( = ?auto_2058008 ?auto_2058012 ) ) ( not ( = ?auto_2058010 ?auto_2058012 ) ) ( not ( = ?auto_2058009 ?auto_2058013 ) ) ( not ( = ?auto_2058011 ?auto_2058013 ) ) ( not ( = ?auto_2058008 ?auto_2058013 ) ) ( not ( = ?auto_2058010 ?auto_2058013 ) ) ( not ( = ?auto_2058012 ?auto_2058013 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_2058009 ?auto_2058011 ?auto_2058008 ?auto_2058010 ?auto_2058013 ?auto_2058012 ?auto_2058007 )
      ( DELIVER-6PKG-VERIFY ?auto_2058008 ?auto_2058009 ?auto_2058010 ?auto_2058011 ?auto_2058012 ?auto_2058013 ?auto_2058007 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_2058072 - OBJ
      ?auto_2058073 - OBJ
      ?auto_2058074 - OBJ
      ?auto_2058075 - OBJ
      ?auto_2058076 - OBJ
      ?auto_2058077 - OBJ
      ?auto_2058071 - LOCATION
    )
    :vars
    (
      ?auto_2058082 - LOCATION
      ?auto_2058079 - CITY
      ?auto_2058078 - LOCATION
      ?auto_2058081 - LOCATION
      ?auto_2058080 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2058082 ?auto_2058079 ) ( IN-CITY ?auto_2058071 ?auto_2058079 ) ( not ( = ?auto_2058071 ?auto_2058082 ) ) ( OBJ-AT ?auto_2058076 ?auto_2058082 ) ( IN-CITY ?auto_2058078 ?auto_2058079 ) ( not ( = ?auto_2058071 ?auto_2058078 ) ) ( OBJ-AT ?auto_2058077 ?auto_2058078 ) ( IN-CITY ?auto_2058081 ?auto_2058079 ) ( not ( = ?auto_2058071 ?auto_2058081 ) ) ( OBJ-AT ?auto_2058074 ?auto_2058081 ) ( OBJ-AT ?auto_2058072 ?auto_2058082 ) ( OBJ-AT ?auto_2058075 ?auto_2058078 ) ( OBJ-AT ?auto_2058073 ?auto_2058078 ) ( TRUCK-AT ?auto_2058080 ?auto_2058071 ) ( not ( = ?auto_2058073 ?auto_2058075 ) ) ( not ( = ?auto_2058073 ?auto_2058072 ) ) ( not ( = ?auto_2058075 ?auto_2058072 ) ) ( not ( = ?auto_2058082 ?auto_2058078 ) ) ( not ( = ?auto_2058073 ?auto_2058074 ) ) ( not ( = ?auto_2058075 ?auto_2058074 ) ) ( not ( = ?auto_2058072 ?auto_2058074 ) ) ( not ( = ?auto_2058081 ?auto_2058082 ) ) ( not ( = ?auto_2058081 ?auto_2058078 ) ) ( not ( = ?auto_2058073 ?auto_2058077 ) ) ( not ( = ?auto_2058075 ?auto_2058077 ) ) ( not ( = ?auto_2058072 ?auto_2058077 ) ) ( not ( = ?auto_2058074 ?auto_2058077 ) ) ( not ( = ?auto_2058073 ?auto_2058076 ) ) ( not ( = ?auto_2058075 ?auto_2058076 ) ) ( not ( = ?auto_2058072 ?auto_2058076 ) ) ( not ( = ?auto_2058074 ?auto_2058076 ) ) ( not ( = ?auto_2058077 ?auto_2058076 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_2058073 ?auto_2058075 ?auto_2058072 ?auto_2058074 ?auto_2058076 ?auto_2058077 ?auto_2058071 )
      ( DELIVER-6PKG-VERIFY ?auto_2058072 ?auto_2058073 ?auto_2058074 ?auto_2058075 ?auto_2058076 ?auto_2058077 ?auto_2058071 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_2058662 - OBJ
      ?auto_2058663 - OBJ
      ?auto_2058664 - OBJ
      ?auto_2058665 - OBJ
      ?auto_2058666 - OBJ
      ?auto_2058667 - OBJ
      ?auto_2058661 - LOCATION
    )
    :vars
    (
      ?auto_2058672 - LOCATION
      ?auto_2058669 - CITY
      ?auto_2058668 - LOCATION
      ?auto_2058671 - LOCATION
      ?auto_2058670 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2058672 ?auto_2058669 ) ( IN-CITY ?auto_2058661 ?auto_2058669 ) ( not ( = ?auto_2058661 ?auto_2058672 ) ) ( OBJ-AT ?auto_2058665 ?auto_2058672 ) ( IN-CITY ?auto_2058668 ?auto_2058669 ) ( not ( = ?auto_2058661 ?auto_2058668 ) ) ( OBJ-AT ?auto_2058667 ?auto_2058668 ) ( IN-CITY ?auto_2058671 ?auto_2058669 ) ( not ( = ?auto_2058661 ?auto_2058671 ) ) ( OBJ-AT ?auto_2058664 ?auto_2058671 ) ( OBJ-AT ?auto_2058662 ?auto_2058672 ) ( OBJ-AT ?auto_2058666 ?auto_2058668 ) ( OBJ-AT ?auto_2058663 ?auto_2058668 ) ( TRUCK-AT ?auto_2058670 ?auto_2058661 ) ( not ( = ?auto_2058663 ?auto_2058666 ) ) ( not ( = ?auto_2058663 ?auto_2058662 ) ) ( not ( = ?auto_2058666 ?auto_2058662 ) ) ( not ( = ?auto_2058672 ?auto_2058668 ) ) ( not ( = ?auto_2058663 ?auto_2058664 ) ) ( not ( = ?auto_2058666 ?auto_2058664 ) ) ( not ( = ?auto_2058662 ?auto_2058664 ) ) ( not ( = ?auto_2058671 ?auto_2058672 ) ) ( not ( = ?auto_2058671 ?auto_2058668 ) ) ( not ( = ?auto_2058663 ?auto_2058667 ) ) ( not ( = ?auto_2058666 ?auto_2058667 ) ) ( not ( = ?auto_2058662 ?auto_2058667 ) ) ( not ( = ?auto_2058664 ?auto_2058667 ) ) ( not ( = ?auto_2058663 ?auto_2058665 ) ) ( not ( = ?auto_2058666 ?auto_2058665 ) ) ( not ( = ?auto_2058662 ?auto_2058665 ) ) ( not ( = ?auto_2058664 ?auto_2058665 ) ) ( not ( = ?auto_2058667 ?auto_2058665 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_2058663 ?auto_2058666 ?auto_2058662 ?auto_2058664 ?auto_2058665 ?auto_2058667 ?auto_2058661 )
      ( DELIVER-6PKG-VERIFY ?auto_2058662 ?auto_2058663 ?auto_2058664 ?auto_2058665 ?auto_2058666 ?auto_2058667 ?auto_2058661 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_2060994 - OBJ
      ?auto_2060995 - OBJ
      ?auto_2060996 - OBJ
      ?auto_2060997 - OBJ
      ?auto_2060998 - OBJ
      ?auto_2060999 - OBJ
      ?auto_2060993 - LOCATION
    )
    :vars
    (
      ?auto_2061004 - LOCATION
      ?auto_2061001 - CITY
      ?auto_2061000 - LOCATION
      ?auto_2061003 - LOCATION
      ?auto_2061002 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2061004 ?auto_2061001 ) ( IN-CITY ?auto_2060993 ?auto_2061001 ) ( not ( = ?auto_2060993 ?auto_2061004 ) ) ( OBJ-AT ?auto_2060996 ?auto_2061004 ) ( IN-CITY ?auto_2061000 ?auto_2061001 ) ( not ( = ?auto_2060993 ?auto_2061000 ) ) ( OBJ-AT ?auto_2060999 ?auto_2061000 ) ( IN-CITY ?auto_2061003 ?auto_2061001 ) ( not ( = ?auto_2060993 ?auto_2061003 ) ) ( OBJ-AT ?auto_2060998 ?auto_2061003 ) ( OBJ-AT ?auto_2060994 ?auto_2061004 ) ( OBJ-AT ?auto_2060997 ?auto_2061000 ) ( OBJ-AT ?auto_2060995 ?auto_2061000 ) ( TRUCK-AT ?auto_2061002 ?auto_2060993 ) ( not ( = ?auto_2060995 ?auto_2060997 ) ) ( not ( = ?auto_2060995 ?auto_2060994 ) ) ( not ( = ?auto_2060997 ?auto_2060994 ) ) ( not ( = ?auto_2061004 ?auto_2061000 ) ) ( not ( = ?auto_2060995 ?auto_2060998 ) ) ( not ( = ?auto_2060997 ?auto_2060998 ) ) ( not ( = ?auto_2060994 ?auto_2060998 ) ) ( not ( = ?auto_2061003 ?auto_2061004 ) ) ( not ( = ?auto_2061003 ?auto_2061000 ) ) ( not ( = ?auto_2060995 ?auto_2060999 ) ) ( not ( = ?auto_2060997 ?auto_2060999 ) ) ( not ( = ?auto_2060994 ?auto_2060999 ) ) ( not ( = ?auto_2060998 ?auto_2060999 ) ) ( not ( = ?auto_2060995 ?auto_2060996 ) ) ( not ( = ?auto_2060997 ?auto_2060996 ) ) ( not ( = ?auto_2060994 ?auto_2060996 ) ) ( not ( = ?auto_2060998 ?auto_2060996 ) ) ( not ( = ?auto_2060999 ?auto_2060996 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_2060995 ?auto_2060997 ?auto_2060994 ?auto_2060998 ?auto_2060996 ?auto_2060999 ?auto_2060993 )
      ( DELIVER-6PKG-VERIFY ?auto_2060994 ?auto_2060995 ?auto_2060996 ?auto_2060997 ?auto_2060998 ?auto_2060999 ?auto_2060993 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_2061058 - OBJ
      ?auto_2061059 - OBJ
      ?auto_2061060 - OBJ
      ?auto_2061061 - OBJ
      ?auto_2061062 - OBJ
      ?auto_2061063 - OBJ
      ?auto_2061057 - LOCATION
    )
    :vars
    (
      ?auto_2061068 - LOCATION
      ?auto_2061065 - CITY
      ?auto_2061064 - LOCATION
      ?auto_2061067 - LOCATION
      ?auto_2061066 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2061068 ?auto_2061065 ) ( IN-CITY ?auto_2061057 ?auto_2061065 ) ( not ( = ?auto_2061057 ?auto_2061068 ) ) ( OBJ-AT ?auto_2061060 ?auto_2061068 ) ( IN-CITY ?auto_2061064 ?auto_2061065 ) ( not ( = ?auto_2061057 ?auto_2061064 ) ) ( OBJ-AT ?auto_2061062 ?auto_2061064 ) ( IN-CITY ?auto_2061067 ?auto_2061065 ) ( not ( = ?auto_2061057 ?auto_2061067 ) ) ( OBJ-AT ?auto_2061063 ?auto_2061067 ) ( OBJ-AT ?auto_2061058 ?auto_2061068 ) ( OBJ-AT ?auto_2061061 ?auto_2061064 ) ( OBJ-AT ?auto_2061059 ?auto_2061064 ) ( TRUCK-AT ?auto_2061066 ?auto_2061057 ) ( not ( = ?auto_2061059 ?auto_2061061 ) ) ( not ( = ?auto_2061059 ?auto_2061058 ) ) ( not ( = ?auto_2061061 ?auto_2061058 ) ) ( not ( = ?auto_2061068 ?auto_2061064 ) ) ( not ( = ?auto_2061059 ?auto_2061063 ) ) ( not ( = ?auto_2061061 ?auto_2061063 ) ) ( not ( = ?auto_2061058 ?auto_2061063 ) ) ( not ( = ?auto_2061067 ?auto_2061068 ) ) ( not ( = ?auto_2061067 ?auto_2061064 ) ) ( not ( = ?auto_2061059 ?auto_2061062 ) ) ( not ( = ?auto_2061061 ?auto_2061062 ) ) ( not ( = ?auto_2061058 ?auto_2061062 ) ) ( not ( = ?auto_2061063 ?auto_2061062 ) ) ( not ( = ?auto_2061059 ?auto_2061060 ) ) ( not ( = ?auto_2061061 ?auto_2061060 ) ) ( not ( = ?auto_2061058 ?auto_2061060 ) ) ( not ( = ?auto_2061063 ?auto_2061060 ) ) ( not ( = ?auto_2061062 ?auto_2061060 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_2061059 ?auto_2061061 ?auto_2061058 ?auto_2061063 ?auto_2061060 ?auto_2061062 ?auto_2061057 )
      ( DELIVER-6PKG-VERIFY ?auto_2061058 ?auto_2061059 ?auto_2061060 ?auto_2061061 ?auto_2061062 ?auto_2061063 ?auto_2061057 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_2061819 - OBJ
      ?auto_2061820 - OBJ
      ?auto_2061821 - OBJ
      ?auto_2061822 - OBJ
      ?auto_2061823 - OBJ
      ?auto_2061824 - OBJ
      ?auto_2061818 - LOCATION
    )
    :vars
    (
      ?auto_2061829 - LOCATION
      ?auto_2061826 - CITY
      ?auto_2061825 - LOCATION
      ?auto_2061828 - LOCATION
      ?auto_2061827 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2061829 ?auto_2061826 ) ( IN-CITY ?auto_2061818 ?auto_2061826 ) ( not ( = ?auto_2061818 ?auto_2061829 ) ) ( OBJ-AT ?auto_2061821 ?auto_2061829 ) ( IN-CITY ?auto_2061825 ?auto_2061826 ) ( not ( = ?auto_2061818 ?auto_2061825 ) ) ( OBJ-AT ?auto_2061824 ?auto_2061825 ) ( IN-CITY ?auto_2061828 ?auto_2061826 ) ( not ( = ?auto_2061818 ?auto_2061828 ) ) ( OBJ-AT ?auto_2061822 ?auto_2061828 ) ( OBJ-AT ?auto_2061819 ?auto_2061829 ) ( OBJ-AT ?auto_2061823 ?auto_2061825 ) ( OBJ-AT ?auto_2061820 ?auto_2061825 ) ( TRUCK-AT ?auto_2061827 ?auto_2061818 ) ( not ( = ?auto_2061820 ?auto_2061823 ) ) ( not ( = ?auto_2061820 ?auto_2061819 ) ) ( not ( = ?auto_2061823 ?auto_2061819 ) ) ( not ( = ?auto_2061829 ?auto_2061825 ) ) ( not ( = ?auto_2061820 ?auto_2061822 ) ) ( not ( = ?auto_2061823 ?auto_2061822 ) ) ( not ( = ?auto_2061819 ?auto_2061822 ) ) ( not ( = ?auto_2061828 ?auto_2061829 ) ) ( not ( = ?auto_2061828 ?auto_2061825 ) ) ( not ( = ?auto_2061820 ?auto_2061824 ) ) ( not ( = ?auto_2061823 ?auto_2061824 ) ) ( not ( = ?auto_2061819 ?auto_2061824 ) ) ( not ( = ?auto_2061822 ?auto_2061824 ) ) ( not ( = ?auto_2061820 ?auto_2061821 ) ) ( not ( = ?auto_2061823 ?auto_2061821 ) ) ( not ( = ?auto_2061819 ?auto_2061821 ) ) ( not ( = ?auto_2061822 ?auto_2061821 ) ) ( not ( = ?auto_2061824 ?auto_2061821 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_2061820 ?auto_2061823 ?auto_2061819 ?auto_2061822 ?auto_2061821 ?auto_2061824 ?auto_2061818 )
      ( DELIVER-6PKG-VERIFY ?auto_2061819 ?auto_2061820 ?auto_2061821 ?auto_2061822 ?auto_2061823 ?auto_2061824 ?auto_2061818 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_2081910 - OBJ
      ?auto_2081911 - OBJ
      ?auto_2081912 - OBJ
      ?auto_2081913 - OBJ
      ?auto_2081914 - OBJ
      ?auto_2081915 - OBJ
      ?auto_2081909 - LOCATION
    )
    :vars
    (
      ?auto_2081920 - LOCATION
      ?auto_2081917 - CITY
      ?auto_2081916 - LOCATION
      ?auto_2081919 - LOCATION
      ?auto_2081918 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2081920 ?auto_2081917 ) ( IN-CITY ?auto_2081909 ?auto_2081917 ) ( not ( = ?auto_2081909 ?auto_2081920 ) ) ( OBJ-AT ?auto_2081915 ?auto_2081920 ) ( IN-CITY ?auto_2081916 ?auto_2081917 ) ( not ( = ?auto_2081909 ?auto_2081916 ) ) ( OBJ-AT ?auto_2081914 ?auto_2081916 ) ( IN-CITY ?auto_2081919 ?auto_2081917 ) ( not ( = ?auto_2081909 ?auto_2081919 ) ) ( OBJ-AT ?auto_2081911 ?auto_2081919 ) ( OBJ-AT ?auto_2081910 ?auto_2081920 ) ( OBJ-AT ?auto_2081913 ?auto_2081916 ) ( OBJ-AT ?auto_2081912 ?auto_2081916 ) ( TRUCK-AT ?auto_2081918 ?auto_2081909 ) ( not ( = ?auto_2081912 ?auto_2081913 ) ) ( not ( = ?auto_2081912 ?auto_2081910 ) ) ( not ( = ?auto_2081913 ?auto_2081910 ) ) ( not ( = ?auto_2081920 ?auto_2081916 ) ) ( not ( = ?auto_2081912 ?auto_2081911 ) ) ( not ( = ?auto_2081913 ?auto_2081911 ) ) ( not ( = ?auto_2081910 ?auto_2081911 ) ) ( not ( = ?auto_2081919 ?auto_2081920 ) ) ( not ( = ?auto_2081919 ?auto_2081916 ) ) ( not ( = ?auto_2081912 ?auto_2081914 ) ) ( not ( = ?auto_2081913 ?auto_2081914 ) ) ( not ( = ?auto_2081910 ?auto_2081914 ) ) ( not ( = ?auto_2081911 ?auto_2081914 ) ) ( not ( = ?auto_2081912 ?auto_2081915 ) ) ( not ( = ?auto_2081913 ?auto_2081915 ) ) ( not ( = ?auto_2081910 ?auto_2081915 ) ) ( not ( = ?auto_2081911 ?auto_2081915 ) ) ( not ( = ?auto_2081914 ?auto_2081915 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_2081912 ?auto_2081913 ?auto_2081910 ?auto_2081911 ?auto_2081915 ?auto_2081914 ?auto_2081909 )
      ( DELIVER-6PKG-VERIFY ?auto_2081910 ?auto_2081911 ?auto_2081912 ?auto_2081913 ?auto_2081914 ?auto_2081915 ?auto_2081909 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_2081974 - OBJ
      ?auto_2081975 - OBJ
      ?auto_2081976 - OBJ
      ?auto_2081977 - OBJ
      ?auto_2081978 - OBJ
      ?auto_2081979 - OBJ
      ?auto_2081973 - LOCATION
    )
    :vars
    (
      ?auto_2081984 - LOCATION
      ?auto_2081981 - CITY
      ?auto_2081980 - LOCATION
      ?auto_2081983 - LOCATION
      ?auto_2081982 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2081984 ?auto_2081981 ) ( IN-CITY ?auto_2081973 ?auto_2081981 ) ( not ( = ?auto_2081973 ?auto_2081984 ) ) ( OBJ-AT ?auto_2081978 ?auto_2081984 ) ( IN-CITY ?auto_2081980 ?auto_2081981 ) ( not ( = ?auto_2081973 ?auto_2081980 ) ) ( OBJ-AT ?auto_2081979 ?auto_2081980 ) ( IN-CITY ?auto_2081983 ?auto_2081981 ) ( not ( = ?auto_2081973 ?auto_2081983 ) ) ( OBJ-AT ?auto_2081975 ?auto_2081983 ) ( OBJ-AT ?auto_2081974 ?auto_2081984 ) ( OBJ-AT ?auto_2081977 ?auto_2081980 ) ( OBJ-AT ?auto_2081976 ?auto_2081980 ) ( TRUCK-AT ?auto_2081982 ?auto_2081973 ) ( not ( = ?auto_2081976 ?auto_2081977 ) ) ( not ( = ?auto_2081976 ?auto_2081974 ) ) ( not ( = ?auto_2081977 ?auto_2081974 ) ) ( not ( = ?auto_2081984 ?auto_2081980 ) ) ( not ( = ?auto_2081976 ?auto_2081975 ) ) ( not ( = ?auto_2081977 ?auto_2081975 ) ) ( not ( = ?auto_2081974 ?auto_2081975 ) ) ( not ( = ?auto_2081983 ?auto_2081984 ) ) ( not ( = ?auto_2081983 ?auto_2081980 ) ) ( not ( = ?auto_2081976 ?auto_2081979 ) ) ( not ( = ?auto_2081977 ?auto_2081979 ) ) ( not ( = ?auto_2081974 ?auto_2081979 ) ) ( not ( = ?auto_2081975 ?auto_2081979 ) ) ( not ( = ?auto_2081976 ?auto_2081978 ) ) ( not ( = ?auto_2081977 ?auto_2081978 ) ) ( not ( = ?auto_2081974 ?auto_2081978 ) ) ( not ( = ?auto_2081975 ?auto_2081978 ) ) ( not ( = ?auto_2081979 ?auto_2081978 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_2081976 ?auto_2081977 ?auto_2081974 ?auto_2081975 ?auto_2081978 ?auto_2081979 ?auto_2081973 )
      ( DELIVER-6PKG-VERIFY ?auto_2081974 ?auto_2081975 ?auto_2081976 ?auto_2081977 ?auto_2081978 ?auto_2081979 ?auto_2081973 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_2082564 - OBJ
      ?auto_2082565 - OBJ
      ?auto_2082566 - OBJ
      ?auto_2082567 - OBJ
      ?auto_2082568 - OBJ
      ?auto_2082569 - OBJ
      ?auto_2082563 - LOCATION
    )
    :vars
    (
      ?auto_2082574 - LOCATION
      ?auto_2082571 - CITY
      ?auto_2082570 - LOCATION
      ?auto_2082573 - LOCATION
      ?auto_2082572 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2082574 ?auto_2082571 ) ( IN-CITY ?auto_2082563 ?auto_2082571 ) ( not ( = ?auto_2082563 ?auto_2082574 ) ) ( OBJ-AT ?auto_2082567 ?auto_2082574 ) ( IN-CITY ?auto_2082570 ?auto_2082571 ) ( not ( = ?auto_2082563 ?auto_2082570 ) ) ( OBJ-AT ?auto_2082569 ?auto_2082570 ) ( IN-CITY ?auto_2082573 ?auto_2082571 ) ( not ( = ?auto_2082563 ?auto_2082573 ) ) ( OBJ-AT ?auto_2082565 ?auto_2082573 ) ( OBJ-AT ?auto_2082564 ?auto_2082574 ) ( OBJ-AT ?auto_2082568 ?auto_2082570 ) ( OBJ-AT ?auto_2082566 ?auto_2082570 ) ( TRUCK-AT ?auto_2082572 ?auto_2082563 ) ( not ( = ?auto_2082566 ?auto_2082568 ) ) ( not ( = ?auto_2082566 ?auto_2082564 ) ) ( not ( = ?auto_2082568 ?auto_2082564 ) ) ( not ( = ?auto_2082574 ?auto_2082570 ) ) ( not ( = ?auto_2082566 ?auto_2082565 ) ) ( not ( = ?auto_2082568 ?auto_2082565 ) ) ( not ( = ?auto_2082564 ?auto_2082565 ) ) ( not ( = ?auto_2082573 ?auto_2082574 ) ) ( not ( = ?auto_2082573 ?auto_2082570 ) ) ( not ( = ?auto_2082566 ?auto_2082569 ) ) ( not ( = ?auto_2082568 ?auto_2082569 ) ) ( not ( = ?auto_2082564 ?auto_2082569 ) ) ( not ( = ?auto_2082565 ?auto_2082569 ) ) ( not ( = ?auto_2082566 ?auto_2082567 ) ) ( not ( = ?auto_2082568 ?auto_2082567 ) ) ( not ( = ?auto_2082564 ?auto_2082567 ) ) ( not ( = ?auto_2082565 ?auto_2082567 ) ) ( not ( = ?auto_2082569 ?auto_2082567 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_2082566 ?auto_2082568 ?auto_2082564 ?auto_2082565 ?auto_2082567 ?auto_2082569 ?auto_2082563 )
      ( DELIVER-6PKG-VERIFY ?auto_2082564 ?auto_2082565 ?auto_2082566 ?auto_2082567 ?auto_2082568 ?auto_2082569 ?auto_2082563 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_2087959 - OBJ
      ?auto_2087960 - OBJ
      ?auto_2087961 - OBJ
      ?auto_2087962 - OBJ
      ?auto_2087963 - OBJ
      ?auto_2087964 - OBJ
      ?auto_2087958 - LOCATION
    )
    :vars
    (
      ?auto_2087969 - LOCATION
      ?auto_2087966 - CITY
      ?auto_2087965 - LOCATION
      ?auto_2087968 - LOCATION
      ?auto_2087967 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2087969 ?auto_2087966 ) ( IN-CITY ?auto_2087958 ?auto_2087966 ) ( not ( = ?auto_2087958 ?auto_2087969 ) ) ( OBJ-AT ?auto_2087961 ?auto_2087969 ) ( IN-CITY ?auto_2087965 ?auto_2087966 ) ( not ( = ?auto_2087958 ?auto_2087965 ) ) ( OBJ-AT ?auto_2087964 ?auto_2087965 ) ( IN-CITY ?auto_2087968 ?auto_2087966 ) ( not ( = ?auto_2087958 ?auto_2087968 ) ) ( OBJ-AT ?auto_2087960 ?auto_2087968 ) ( OBJ-AT ?auto_2087959 ?auto_2087969 ) ( OBJ-AT ?auto_2087963 ?auto_2087965 ) ( OBJ-AT ?auto_2087962 ?auto_2087965 ) ( TRUCK-AT ?auto_2087967 ?auto_2087958 ) ( not ( = ?auto_2087962 ?auto_2087963 ) ) ( not ( = ?auto_2087962 ?auto_2087959 ) ) ( not ( = ?auto_2087963 ?auto_2087959 ) ) ( not ( = ?auto_2087969 ?auto_2087965 ) ) ( not ( = ?auto_2087962 ?auto_2087960 ) ) ( not ( = ?auto_2087963 ?auto_2087960 ) ) ( not ( = ?auto_2087959 ?auto_2087960 ) ) ( not ( = ?auto_2087968 ?auto_2087969 ) ) ( not ( = ?auto_2087968 ?auto_2087965 ) ) ( not ( = ?auto_2087962 ?auto_2087964 ) ) ( not ( = ?auto_2087963 ?auto_2087964 ) ) ( not ( = ?auto_2087959 ?auto_2087964 ) ) ( not ( = ?auto_2087960 ?auto_2087964 ) ) ( not ( = ?auto_2087962 ?auto_2087961 ) ) ( not ( = ?auto_2087963 ?auto_2087961 ) ) ( not ( = ?auto_2087959 ?auto_2087961 ) ) ( not ( = ?auto_2087960 ?auto_2087961 ) ) ( not ( = ?auto_2087964 ?auto_2087961 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_2087962 ?auto_2087963 ?auto_2087959 ?auto_2087960 ?auto_2087961 ?auto_2087964 ?auto_2087958 )
      ( DELIVER-6PKG-VERIFY ?auto_2087959 ?auto_2087960 ?auto_2087961 ?auto_2087962 ?auto_2087963 ?auto_2087964 ?auto_2087958 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_2100611 - OBJ
      ?auto_2100612 - OBJ
      ?auto_2100613 - OBJ
      ?auto_2100614 - OBJ
      ?auto_2100615 - OBJ
      ?auto_2100616 - OBJ
      ?auto_2100610 - LOCATION
    )
    :vars
    (
      ?auto_2100621 - LOCATION
      ?auto_2100618 - CITY
      ?auto_2100617 - LOCATION
      ?auto_2100620 - LOCATION
      ?auto_2100619 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2100621 ?auto_2100618 ) ( IN-CITY ?auto_2100610 ?auto_2100618 ) ( not ( = ?auto_2100610 ?auto_2100621 ) ) ( OBJ-AT ?auto_2100612 ?auto_2100621 ) ( IN-CITY ?auto_2100617 ?auto_2100618 ) ( not ( = ?auto_2100610 ?auto_2100617 ) ) ( OBJ-AT ?auto_2100616 ?auto_2100617 ) ( IN-CITY ?auto_2100620 ?auto_2100618 ) ( not ( = ?auto_2100610 ?auto_2100620 ) ) ( OBJ-AT ?auto_2100615 ?auto_2100620 ) ( OBJ-AT ?auto_2100611 ?auto_2100621 ) ( OBJ-AT ?auto_2100614 ?auto_2100617 ) ( OBJ-AT ?auto_2100613 ?auto_2100617 ) ( TRUCK-AT ?auto_2100619 ?auto_2100610 ) ( not ( = ?auto_2100613 ?auto_2100614 ) ) ( not ( = ?auto_2100613 ?auto_2100611 ) ) ( not ( = ?auto_2100614 ?auto_2100611 ) ) ( not ( = ?auto_2100621 ?auto_2100617 ) ) ( not ( = ?auto_2100613 ?auto_2100615 ) ) ( not ( = ?auto_2100614 ?auto_2100615 ) ) ( not ( = ?auto_2100611 ?auto_2100615 ) ) ( not ( = ?auto_2100620 ?auto_2100621 ) ) ( not ( = ?auto_2100620 ?auto_2100617 ) ) ( not ( = ?auto_2100613 ?auto_2100616 ) ) ( not ( = ?auto_2100614 ?auto_2100616 ) ) ( not ( = ?auto_2100611 ?auto_2100616 ) ) ( not ( = ?auto_2100615 ?auto_2100616 ) ) ( not ( = ?auto_2100613 ?auto_2100612 ) ) ( not ( = ?auto_2100614 ?auto_2100612 ) ) ( not ( = ?auto_2100611 ?auto_2100612 ) ) ( not ( = ?auto_2100615 ?auto_2100612 ) ) ( not ( = ?auto_2100616 ?auto_2100612 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_2100613 ?auto_2100614 ?auto_2100611 ?auto_2100615 ?auto_2100612 ?auto_2100616 ?auto_2100610 )
      ( DELIVER-6PKG-VERIFY ?auto_2100611 ?auto_2100612 ?auto_2100613 ?auto_2100614 ?auto_2100615 ?auto_2100616 ?auto_2100610 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_2100675 - OBJ
      ?auto_2100676 - OBJ
      ?auto_2100677 - OBJ
      ?auto_2100678 - OBJ
      ?auto_2100679 - OBJ
      ?auto_2100680 - OBJ
      ?auto_2100674 - LOCATION
    )
    :vars
    (
      ?auto_2100685 - LOCATION
      ?auto_2100682 - CITY
      ?auto_2100681 - LOCATION
      ?auto_2100684 - LOCATION
      ?auto_2100683 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2100685 ?auto_2100682 ) ( IN-CITY ?auto_2100674 ?auto_2100682 ) ( not ( = ?auto_2100674 ?auto_2100685 ) ) ( OBJ-AT ?auto_2100676 ?auto_2100685 ) ( IN-CITY ?auto_2100681 ?auto_2100682 ) ( not ( = ?auto_2100674 ?auto_2100681 ) ) ( OBJ-AT ?auto_2100679 ?auto_2100681 ) ( IN-CITY ?auto_2100684 ?auto_2100682 ) ( not ( = ?auto_2100674 ?auto_2100684 ) ) ( OBJ-AT ?auto_2100680 ?auto_2100684 ) ( OBJ-AT ?auto_2100675 ?auto_2100685 ) ( OBJ-AT ?auto_2100678 ?auto_2100681 ) ( OBJ-AT ?auto_2100677 ?auto_2100681 ) ( TRUCK-AT ?auto_2100683 ?auto_2100674 ) ( not ( = ?auto_2100677 ?auto_2100678 ) ) ( not ( = ?auto_2100677 ?auto_2100675 ) ) ( not ( = ?auto_2100678 ?auto_2100675 ) ) ( not ( = ?auto_2100685 ?auto_2100681 ) ) ( not ( = ?auto_2100677 ?auto_2100680 ) ) ( not ( = ?auto_2100678 ?auto_2100680 ) ) ( not ( = ?auto_2100675 ?auto_2100680 ) ) ( not ( = ?auto_2100684 ?auto_2100685 ) ) ( not ( = ?auto_2100684 ?auto_2100681 ) ) ( not ( = ?auto_2100677 ?auto_2100679 ) ) ( not ( = ?auto_2100678 ?auto_2100679 ) ) ( not ( = ?auto_2100675 ?auto_2100679 ) ) ( not ( = ?auto_2100680 ?auto_2100679 ) ) ( not ( = ?auto_2100677 ?auto_2100676 ) ) ( not ( = ?auto_2100678 ?auto_2100676 ) ) ( not ( = ?auto_2100675 ?auto_2100676 ) ) ( not ( = ?auto_2100680 ?auto_2100676 ) ) ( not ( = ?auto_2100679 ?auto_2100676 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_2100677 ?auto_2100678 ?auto_2100675 ?auto_2100680 ?auto_2100676 ?auto_2100679 ?auto_2100674 )
      ( DELIVER-6PKG-VERIFY ?auto_2100675 ?auto_2100676 ?auto_2100677 ?auto_2100678 ?auto_2100679 ?auto_2100680 ?auto_2100674 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_2101436 - OBJ
      ?auto_2101437 - OBJ
      ?auto_2101438 - OBJ
      ?auto_2101439 - OBJ
      ?auto_2101440 - OBJ
      ?auto_2101441 - OBJ
      ?auto_2101435 - LOCATION
    )
    :vars
    (
      ?auto_2101446 - LOCATION
      ?auto_2101443 - CITY
      ?auto_2101442 - LOCATION
      ?auto_2101445 - LOCATION
      ?auto_2101444 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2101446 ?auto_2101443 ) ( IN-CITY ?auto_2101435 ?auto_2101443 ) ( not ( = ?auto_2101435 ?auto_2101446 ) ) ( OBJ-AT ?auto_2101437 ?auto_2101446 ) ( IN-CITY ?auto_2101442 ?auto_2101443 ) ( not ( = ?auto_2101435 ?auto_2101442 ) ) ( OBJ-AT ?auto_2101441 ?auto_2101442 ) ( IN-CITY ?auto_2101445 ?auto_2101443 ) ( not ( = ?auto_2101435 ?auto_2101445 ) ) ( OBJ-AT ?auto_2101439 ?auto_2101445 ) ( OBJ-AT ?auto_2101436 ?auto_2101446 ) ( OBJ-AT ?auto_2101440 ?auto_2101442 ) ( OBJ-AT ?auto_2101438 ?auto_2101442 ) ( TRUCK-AT ?auto_2101444 ?auto_2101435 ) ( not ( = ?auto_2101438 ?auto_2101440 ) ) ( not ( = ?auto_2101438 ?auto_2101436 ) ) ( not ( = ?auto_2101440 ?auto_2101436 ) ) ( not ( = ?auto_2101446 ?auto_2101442 ) ) ( not ( = ?auto_2101438 ?auto_2101439 ) ) ( not ( = ?auto_2101440 ?auto_2101439 ) ) ( not ( = ?auto_2101436 ?auto_2101439 ) ) ( not ( = ?auto_2101445 ?auto_2101446 ) ) ( not ( = ?auto_2101445 ?auto_2101442 ) ) ( not ( = ?auto_2101438 ?auto_2101441 ) ) ( not ( = ?auto_2101440 ?auto_2101441 ) ) ( not ( = ?auto_2101436 ?auto_2101441 ) ) ( not ( = ?auto_2101439 ?auto_2101441 ) ) ( not ( = ?auto_2101438 ?auto_2101437 ) ) ( not ( = ?auto_2101440 ?auto_2101437 ) ) ( not ( = ?auto_2101436 ?auto_2101437 ) ) ( not ( = ?auto_2101439 ?auto_2101437 ) ) ( not ( = ?auto_2101441 ?auto_2101437 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_2101438 ?auto_2101440 ?auto_2101436 ?auto_2101439 ?auto_2101437 ?auto_2101441 ?auto_2101435 )
      ( DELIVER-6PKG-VERIFY ?auto_2101436 ?auto_2101437 ?auto_2101438 ?auto_2101439 ?auto_2101440 ?auto_2101441 ?auto_2101435 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_2108921 - OBJ
      ?auto_2108922 - OBJ
      ?auto_2108923 - OBJ
      ?auto_2108924 - OBJ
      ?auto_2108925 - OBJ
      ?auto_2108926 - OBJ
      ?auto_2108920 - LOCATION
    )
    :vars
    (
      ?auto_2108931 - LOCATION
      ?auto_2108928 - CITY
      ?auto_2108927 - LOCATION
      ?auto_2108930 - LOCATION
      ?auto_2108929 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2108931 ?auto_2108928 ) ( IN-CITY ?auto_2108920 ?auto_2108928 ) ( not ( = ?auto_2108920 ?auto_2108931 ) ) ( OBJ-AT ?auto_2108922 ?auto_2108931 ) ( IN-CITY ?auto_2108927 ?auto_2108928 ) ( not ( = ?auto_2108920 ?auto_2108927 ) ) ( OBJ-AT ?auto_2108926 ?auto_2108927 ) ( IN-CITY ?auto_2108930 ?auto_2108928 ) ( not ( = ?auto_2108920 ?auto_2108930 ) ) ( OBJ-AT ?auto_2108923 ?auto_2108930 ) ( OBJ-AT ?auto_2108921 ?auto_2108931 ) ( OBJ-AT ?auto_2108925 ?auto_2108927 ) ( OBJ-AT ?auto_2108924 ?auto_2108927 ) ( TRUCK-AT ?auto_2108929 ?auto_2108920 ) ( not ( = ?auto_2108924 ?auto_2108925 ) ) ( not ( = ?auto_2108924 ?auto_2108921 ) ) ( not ( = ?auto_2108925 ?auto_2108921 ) ) ( not ( = ?auto_2108931 ?auto_2108927 ) ) ( not ( = ?auto_2108924 ?auto_2108923 ) ) ( not ( = ?auto_2108925 ?auto_2108923 ) ) ( not ( = ?auto_2108921 ?auto_2108923 ) ) ( not ( = ?auto_2108930 ?auto_2108931 ) ) ( not ( = ?auto_2108930 ?auto_2108927 ) ) ( not ( = ?auto_2108924 ?auto_2108926 ) ) ( not ( = ?auto_2108925 ?auto_2108926 ) ) ( not ( = ?auto_2108921 ?auto_2108926 ) ) ( not ( = ?auto_2108923 ?auto_2108926 ) ) ( not ( = ?auto_2108924 ?auto_2108922 ) ) ( not ( = ?auto_2108925 ?auto_2108922 ) ) ( not ( = ?auto_2108921 ?auto_2108922 ) ) ( not ( = ?auto_2108923 ?auto_2108922 ) ) ( not ( = ?auto_2108926 ?auto_2108922 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_2108924 ?auto_2108925 ?auto_2108921 ?auto_2108923 ?auto_2108922 ?auto_2108926 ?auto_2108920 )
      ( DELIVER-6PKG-VERIFY ?auto_2108921 ?auto_2108922 ?auto_2108923 ?auto_2108924 ?auto_2108925 ?auto_2108926 ?auto_2108920 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_2119385 - OBJ
      ?auto_2119386 - OBJ
      ?auto_2119387 - OBJ
      ?auto_2119388 - OBJ
      ?auto_2119389 - OBJ
      ?auto_2119390 - OBJ
      ?auto_2119384 - LOCATION
    )
    :vars
    (
      ?auto_2119395 - LOCATION
      ?auto_2119392 - CITY
      ?auto_2119391 - LOCATION
      ?auto_2119394 - LOCATION
      ?auto_2119393 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2119395 ?auto_2119392 ) ( IN-CITY ?auto_2119384 ?auto_2119392 ) ( not ( = ?auto_2119384 ?auto_2119395 ) ) ( OBJ-AT ?auto_2119390 ?auto_2119395 ) ( IN-CITY ?auto_2119391 ?auto_2119392 ) ( not ( = ?auto_2119384 ?auto_2119391 ) ) ( OBJ-AT ?auto_2119389 ?auto_2119391 ) ( IN-CITY ?auto_2119394 ?auto_2119392 ) ( not ( = ?auto_2119384 ?auto_2119394 ) ) ( OBJ-AT ?auto_2119385 ?auto_2119394 ) ( OBJ-AT ?auto_2119388 ?auto_2119395 ) ( OBJ-AT ?auto_2119387 ?auto_2119391 ) ( OBJ-AT ?auto_2119386 ?auto_2119391 ) ( TRUCK-AT ?auto_2119393 ?auto_2119384 ) ( not ( = ?auto_2119386 ?auto_2119387 ) ) ( not ( = ?auto_2119386 ?auto_2119388 ) ) ( not ( = ?auto_2119387 ?auto_2119388 ) ) ( not ( = ?auto_2119395 ?auto_2119391 ) ) ( not ( = ?auto_2119386 ?auto_2119385 ) ) ( not ( = ?auto_2119387 ?auto_2119385 ) ) ( not ( = ?auto_2119388 ?auto_2119385 ) ) ( not ( = ?auto_2119394 ?auto_2119395 ) ) ( not ( = ?auto_2119394 ?auto_2119391 ) ) ( not ( = ?auto_2119386 ?auto_2119389 ) ) ( not ( = ?auto_2119387 ?auto_2119389 ) ) ( not ( = ?auto_2119388 ?auto_2119389 ) ) ( not ( = ?auto_2119385 ?auto_2119389 ) ) ( not ( = ?auto_2119386 ?auto_2119390 ) ) ( not ( = ?auto_2119387 ?auto_2119390 ) ) ( not ( = ?auto_2119388 ?auto_2119390 ) ) ( not ( = ?auto_2119385 ?auto_2119390 ) ) ( not ( = ?auto_2119389 ?auto_2119390 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_2119386 ?auto_2119387 ?auto_2119388 ?auto_2119385 ?auto_2119390 ?auto_2119389 ?auto_2119384 )
      ( DELIVER-6PKG-VERIFY ?auto_2119385 ?auto_2119386 ?auto_2119387 ?auto_2119388 ?auto_2119389 ?auto_2119390 ?auto_2119384 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_2119449 - OBJ
      ?auto_2119450 - OBJ
      ?auto_2119451 - OBJ
      ?auto_2119452 - OBJ
      ?auto_2119453 - OBJ
      ?auto_2119454 - OBJ
      ?auto_2119448 - LOCATION
    )
    :vars
    (
      ?auto_2119459 - LOCATION
      ?auto_2119456 - CITY
      ?auto_2119455 - LOCATION
      ?auto_2119458 - LOCATION
      ?auto_2119457 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2119459 ?auto_2119456 ) ( IN-CITY ?auto_2119448 ?auto_2119456 ) ( not ( = ?auto_2119448 ?auto_2119459 ) ) ( OBJ-AT ?auto_2119453 ?auto_2119459 ) ( IN-CITY ?auto_2119455 ?auto_2119456 ) ( not ( = ?auto_2119448 ?auto_2119455 ) ) ( OBJ-AT ?auto_2119454 ?auto_2119455 ) ( IN-CITY ?auto_2119458 ?auto_2119456 ) ( not ( = ?auto_2119448 ?auto_2119458 ) ) ( OBJ-AT ?auto_2119449 ?auto_2119458 ) ( OBJ-AT ?auto_2119452 ?auto_2119459 ) ( OBJ-AT ?auto_2119451 ?auto_2119455 ) ( OBJ-AT ?auto_2119450 ?auto_2119455 ) ( TRUCK-AT ?auto_2119457 ?auto_2119448 ) ( not ( = ?auto_2119450 ?auto_2119451 ) ) ( not ( = ?auto_2119450 ?auto_2119452 ) ) ( not ( = ?auto_2119451 ?auto_2119452 ) ) ( not ( = ?auto_2119459 ?auto_2119455 ) ) ( not ( = ?auto_2119450 ?auto_2119449 ) ) ( not ( = ?auto_2119451 ?auto_2119449 ) ) ( not ( = ?auto_2119452 ?auto_2119449 ) ) ( not ( = ?auto_2119458 ?auto_2119459 ) ) ( not ( = ?auto_2119458 ?auto_2119455 ) ) ( not ( = ?auto_2119450 ?auto_2119454 ) ) ( not ( = ?auto_2119451 ?auto_2119454 ) ) ( not ( = ?auto_2119452 ?auto_2119454 ) ) ( not ( = ?auto_2119449 ?auto_2119454 ) ) ( not ( = ?auto_2119450 ?auto_2119453 ) ) ( not ( = ?auto_2119451 ?auto_2119453 ) ) ( not ( = ?auto_2119452 ?auto_2119453 ) ) ( not ( = ?auto_2119449 ?auto_2119453 ) ) ( not ( = ?auto_2119454 ?auto_2119453 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_2119450 ?auto_2119451 ?auto_2119452 ?auto_2119449 ?auto_2119453 ?auto_2119454 ?auto_2119448 )
      ( DELIVER-6PKG-VERIFY ?auto_2119449 ?auto_2119450 ?auto_2119451 ?auto_2119452 ?auto_2119453 ?auto_2119454 ?auto_2119448 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_2119650 - OBJ
      ?auto_2119651 - OBJ
      ?auto_2119652 - OBJ
      ?auto_2119653 - OBJ
      ?auto_2119654 - OBJ
      ?auto_2119655 - OBJ
      ?auto_2119649 - LOCATION
    )
    :vars
    (
      ?auto_2119660 - LOCATION
      ?auto_2119657 - CITY
      ?auto_2119656 - LOCATION
      ?auto_2119659 - LOCATION
      ?auto_2119658 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2119660 ?auto_2119657 ) ( IN-CITY ?auto_2119649 ?auto_2119657 ) ( not ( = ?auto_2119649 ?auto_2119660 ) ) ( OBJ-AT ?auto_2119655 ?auto_2119660 ) ( IN-CITY ?auto_2119656 ?auto_2119657 ) ( not ( = ?auto_2119649 ?auto_2119656 ) ) ( OBJ-AT ?auto_2119653 ?auto_2119656 ) ( IN-CITY ?auto_2119659 ?auto_2119657 ) ( not ( = ?auto_2119649 ?auto_2119659 ) ) ( OBJ-AT ?auto_2119650 ?auto_2119659 ) ( OBJ-AT ?auto_2119654 ?auto_2119660 ) ( OBJ-AT ?auto_2119652 ?auto_2119656 ) ( OBJ-AT ?auto_2119651 ?auto_2119656 ) ( TRUCK-AT ?auto_2119658 ?auto_2119649 ) ( not ( = ?auto_2119651 ?auto_2119652 ) ) ( not ( = ?auto_2119651 ?auto_2119654 ) ) ( not ( = ?auto_2119652 ?auto_2119654 ) ) ( not ( = ?auto_2119660 ?auto_2119656 ) ) ( not ( = ?auto_2119651 ?auto_2119650 ) ) ( not ( = ?auto_2119652 ?auto_2119650 ) ) ( not ( = ?auto_2119654 ?auto_2119650 ) ) ( not ( = ?auto_2119659 ?auto_2119660 ) ) ( not ( = ?auto_2119659 ?auto_2119656 ) ) ( not ( = ?auto_2119651 ?auto_2119653 ) ) ( not ( = ?auto_2119652 ?auto_2119653 ) ) ( not ( = ?auto_2119654 ?auto_2119653 ) ) ( not ( = ?auto_2119650 ?auto_2119653 ) ) ( not ( = ?auto_2119651 ?auto_2119655 ) ) ( not ( = ?auto_2119652 ?auto_2119655 ) ) ( not ( = ?auto_2119654 ?auto_2119655 ) ) ( not ( = ?auto_2119650 ?auto_2119655 ) ) ( not ( = ?auto_2119653 ?auto_2119655 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_2119651 ?auto_2119652 ?auto_2119654 ?auto_2119650 ?auto_2119655 ?auto_2119653 ?auto_2119649 )
      ( DELIVER-6PKG-VERIFY ?auto_2119650 ?auto_2119651 ?auto_2119652 ?auto_2119653 ?auto_2119654 ?auto_2119655 ?auto_2119649 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_2120434 - OBJ
      ?auto_2120435 - OBJ
      ?auto_2120436 - OBJ
      ?auto_2120437 - OBJ
      ?auto_2120438 - OBJ
      ?auto_2120439 - OBJ
      ?auto_2120433 - LOCATION
    )
    :vars
    (
      ?auto_2120444 - LOCATION
      ?auto_2120441 - CITY
      ?auto_2120440 - LOCATION
      ?auto_2120443 - LOCATION
      ?auto_2120442 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2120444 ?auto_2120441 ) ( IN-CITY ?auto_2120433 ?auto_2120441 ) ( not ( = ?auto_2120433 ?auto_2120444 ) ) ( OBJ-AT ?auto_2120439 ?auto_2120444 ) ( IN-CITY ?auto_2120440 ?auto_2120441 ) ( not ( = ?auto_2120433 ?auto_2120440 ) ) ( OBJ-AT ?auto_2120438 ?auto_2120440 ) ( IN-CITY ?auto_2120443 ?auto_2120441 ) ( not ( = ?auto_2120433 ?auto_2120443 ) ) ( OBJ-AT ?auto_2120434 ?auto_2120443 ) ( OBJ-AT ?auto_2120436 ?auto_2120444 ) ( OBJ-AT ?auto_2120437 ?auto_2120440 ) ( OBJ-AT ?auto_2120435 ?auto_2120440 ) ( TRUCK-AT ?auto_2120442 ?auto_2120433 ) ( not ( = ?auto_2120435 ?auto_2120437 ) ) ( not ( = ?auto_2120435 ?auto_2120436 ) ) ( not ( = ?auto_2120437 ?auto_2120436 ) ) ( not ( = ?auto_2120444 ?auto_2120440 ) ) ( not ( = ?auto_2120435 ?auto_2120434 ) ) ( not ( = ?auto_2120437 ?auto_2120434 ) ) ( not ( = ?auto_2120436 ?auto_2120434 ) ) ( not ( = ?auto_2120443 ?auto_2120444 ) ) ( not ( = ?auto_2120443 ?auto_2120440 ) ) ( not ( = ?auto_2120435 ?auto_2120438 ) ) ( not ( = ?auto_2120437 ?auto_2120438 ) ) ( not ( = ?auto_2120436 ?auto_2120438 ) ) ( not ( = ?auto_2120434 ?auto_2120438 ) ) ( not ( = ?auto_2120435 ?auto_2120439 ) ) ( not ( = ?auto_2120437 ?auto_2120439 ) ) ( not ( = ?auto_2120436 ?auto_2120439 ) ) ( not ( = ?auto_2120434 ?auto_2120439 ) ) ( not ( = ?auto_2120438 ?auto_2120439 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_2120435 ?auto_2120437 ?auto_2120436 ?auto_2120434 ?auto_2120439 ?auto_2120438 ?auto_2120433 )
      ( DELIVER-6PKG-VERIFY ?auto_2120434 ?auto_2120435 ?auto_2120436 ?auto_2120437 ?auto_2120438 ?auto_2120439 ?auto_2120433 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_2120498 - OBJ
      ?auto_2120499 - OBJ
      ?auto_2120500 - OBJ
      ?auto_2120501 - OBJ
      ?auto_2120502 - OBJ
      ?auto_2120503 - OBJ
      ?auto_2120497 - LOCATION
    )
    :vars
    (
      ?auto_2120508 - LOCATION
      ?auto_2120505 - CITY
      ?auto_2120504 - LOCATION
      ?auto_2120507 - LOCATION
      ?auto_2120506 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2120508 ?auto_2120505 ) ( IN-CITY ?auto_2120497 ?auto_2120505 ) ( not ( = ?auto_2120497 ?auto_2120508 ) ) ( OBJ-AT ?auto_2120502 ?auto_2120508 ) ( IN-CITY ?auto_2120504 ?auto_2120505 ) ( not ( = ?auto_2120497 ?auto_2120504 ) ) ( OBJ-AT ?auto_2120503 ?auto_2120504 ) ( IN-CITY ?auto_2120507 ?auto_2120505 ) ( not ( = ?auto_2120497 ?auto_2120507 ) ) ( OBJ-AT ?auto_2120498 ?auto_2120507 ) ( OBJ-AT ?auto_2120500 ?auto_2120508 ) ( OBJ-AT ?auto_2120501 ?auto_2120504 ) ( OBJ-AT ?auto_2120499 ?auto_2120504 ) ( TRUCK-AT ?auto_2120506 ?auto_2120497 ) ( not ( = ?auto_2120499 ?auto_2120501 ) ) ( not ( = ?auto_2120499 ?auto_2120500 ) ) ( not ( = ?auto_2120501 ?auto_2120500 ) ) ( not ( = ?auto_2120508 ?auto_2120504 ) ) ( not ( = ?auto_2120499 ?auto_2120498 ) ) ( not ( = ?auto_2120501 ?auto_2120498 ) ) ( not ( = ?auto_2120500 ?auto_2120498 ) ) ( not ( = ?auto_2120507 ?auto_2120508 ) ) ( not ( = ?auto_2120507 ?auto_2120504 ) ) ( not ( = ?auto_2120499 ?auto_2120503 ) ) ( not ( = ?auto_2120501 ?auto_2120503 ) ) ( not ( = ?auto_2120500 ?auto_2120503 ) ) ( not ( = ?auto_2120498 ?auto_2120503 ) ) ( not ( = ?auto_2120499 ?auto_2120502 ) ) ( not ( = ?auto_2120501 ?auto_2120502 ) ) ( not ( = ?auto_2120500 ?auto_2120502 ) ) ( not ( = ?auto_2120498 ?auto_2120502 ) ) ( not ( = ?auto_2120503 ?auto_2120502 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_2120499 ?auto_2120501 ?auto_2120500 ?auto_2120498 ?auto_2120502 ?auto_2120503 ?auto_2120497 )
      ( DELIVER-6PKG-VERIFY ?auto_2120498 ?auto_2120499 ?auto_2120500 ?auto_2120501 ?auto_2120502 ?auto_2120503 ?auto_2120497 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_2121088 - OBJ
      ?auto_2121089 - OBJ
      ?auto_2121090 - OBJ
      ?auto_2121091 - OBJ
      ?auto_2121092 - OBJ
      ?auto_2121093 - OBJ
      ?auto_2121087 - LOCATION
    )
    :vars
    (
      ?auto_2121098 - LOCATION
      ?auto_2121095 - CITY
      ?auto_2121094 - LOCATION
      ?auto_2121097 - LOCATION
      ?auto_2121096 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2121098 ?auto_2121095 ) ( IN-CITY ?auto_2121087 ?auto_2121095 ) ( not ( = ?auto_2121087 ?auto_2121098 ) ) ( OBJ-AT ?auto_2121091 ?auto_2121098 ) ( IN-CITY ?auto_2121094 ?auto_2121095 ) ( not ( = ?auto_2121087 ?auto_2121094 ) ) ( OBJ-AT ?auto_2121093 ?auto_2121094 ) ( IN-CITY ?auto_2121097 ?auto_2121095 ) ( not ( = ?auto_2121087 ?auto_2121097 ) ) ( OBJ-AT ?auto_2121088 ?auto_2121097 ) ( OBJ-AT ?auto_2121090 ?auto_2121098 ) ( OBJ-AT ?auto_2121092 ?auto_2121094 ) ( OBJ-AT ?auto_2121089 ?auto_2121094 ) ( TRUCK-AT ?auto_2121096 ?auto_2121087 ) ( not ( = ?auto_2121089 ?auto_2121092 ) ) ( not ( = ?auto_2121089 ?auto_2121090 ) ) ( not ( = ?auto_2121092 ?auto_2121090 ) ) ( not ( = ?auto_2121098 ?auto_2121094 ) ) ( not ( = ?auto_2121089 ?auto_2121088 ) ) ( not ( = ?auto_2121092 ?auto_2121088 ) ) ( not ( = ?auto_2121090 ?auto_2121088 ) ) ( not ( = ?auto_2121097 ?auto_2121098 ) ) ( not ( = ?auto_2121097 ?auto_2121094 ) ) ( not ( = ?auto_2121089 ?auto_2121093 ) ) ( not ( = ?auto_2121092 ?auto_2121093 ) ) ( not ( = ?auto_2121090 ?auto_2121093 ) ) ( not ( = ?auto_2121088 ?auto_2121093 ) ) ( not ( = ?auto_2121089 ?auto_2121091 ) ) ( not ( = ?auto_2121092 ?auto_2121091 ) ) ( not ( = ?auto_2121090 ?auto_2121091 ) ) ( not ( = ?auto_2121088 ?auto_2121091 ) ) ( not ( = ?auto_2121093 ?auto_2121091 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_2121089 ?auto_2121092 ?auto_2121090 ?auto_2121088 ?auto_2121091 ?auto_2121093 ?auto_2121087 )
      ( DELIVER-6PKG-VERIFY ?auto_2121088 ?auto_2121089 ?auto_2121090 ?auto_2121091 ?auto_2121092 ?auto_2121093 ?auto_2121087 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_2136068 - OBJ
      ?auto_2136069 - OBJ
      ?auto_2136070 - OBJ
      ?auto_2136071 - OBJ
      ?auto_2136072 - OBJ
      ?auto_2136073 - OBJ
      ?auto_2136067 - LOCATION
    )
    :vars
    (
      ?auto_2136078 - LOCATION
      ?auto_2136075 - CITY
      ?auto_2136074 - LOCATION
      ?auto_2136077 - LOCATION
      ?auto_2136076 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2136078 ?auto_2136075 ) ( IN-CITY ?auto_2136067 ?auto_2136075 ) ( not ( = ?auto_2136067 ?auto_2136078 ) ) ( OBJ-AT ?auto_2136073 ?auto_2136078 ) ( IN-CITY ?auto_2136074 ?auto_2136075 ) ( not ( = ?auto_2136067 ?auto_2136074 ) ) ( OBJ-AT ?auto_2136072 ?auto_2136074 ) ( IN-CITY ?auto_2136077 ?auto_2136075 ) ( not ( = ?auto_2136067 ?auto_2136077 ) ) ( OBJ-AT ?auto_2136068 ?auto_2136077 ) ( OBJ-AT ?auto_2136069 ?auto_2136078 ) ( OBJ-AT ?auto_2136071 ?auto_2136074 ) ( OBJ-AT ?auto_2136070 ?auto_2136074 ) ( TRUCK-AT ?auto_2136076 ?auto_2136067 ) ( not ( = ?auto_2136070 ?auto_2136071 ) ) ( not ( = ?auto_2136070 ?auto_2136069 ) ) ( not ( = ?auto_2136071 ?auto_2136069 ) ) ( not ( = ?auto_2136078 ?auto_2136074 ) ) ( not ( = ?auto_2136070 ?auto_2136068 ) ) ( not ( = ?auto_2136071 ?auto_2136068 ) ) ( not ( = ?auto_2136069 ?auto_2136068 ) ) ( not ( = ?auto_2136077 ?auto_2136078 ) ) ( not ( = ?auto_2136077 ?auto_2136074 ) ) ( not ( = ?auto_2136070 ?auto_2136072 ) ) ( not ( = ?auto_2136071 ?auto_2136072 ) ) ( not ( = ?auto_2136069 ?auto_2136072 ) ) ( not ( = ?auto_2136068 ?auto_2136072 ) ) ( not ( = ?auto_2136070 ?auto_2136073 ) ) ( not ( = ?auto_2136071 ?auto_2136073 ) ) ( not ( = ?auto_2136069 ?auto_2136073 ) ) ( not ( = ?auto_2136068 ?auto_2136073 ) ) ( not ( = ?auto_2136072 ?auto_2136073 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_2136070 ?auto_2136071 ?auto_2136069 ?auto_2136068 ?auto_2136073 ?auto_2136072 ?auto_2136067 )
      ( DELIVER-6PKG-VERIFY ?auto_2136068 ?auto_2136069 ?auto_2136070 ?auto_2136071 ?auto_2136072 ?auto_2136073 ?auto_2136067 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_2136132 - OBJ
      ?auto_2136133 - OBJ
      ?auto_2136134 - OBJ
      ?auto_2136135 - OBJ
      ?auto_2136136 - OBJ
      ?auto_2136137 - OBJ
      ?auto_2136131 - LOCATION
    )
    :vars
    (
      ?auto_2136142 - LOCATION
      ?auto_2136139 - CITY
      ?auto_2136138 - LOCATION
      ?auto_2136141 - LOCATION
      ?auto_2136140 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2136142 ?auto_2136139 ) ( IN-CITY ?auto_2136131 ?auto_2136139 ) ( not ( = ?auto_2136131 ?auto_2136142 ) ) ( OBJ-AT ?auto_2136136 ?auto_2136142 ) ( IN-CITY ?auto_2136138 ?auto_2136139 ) ( not ( = ?auto_2136131 ?auto_2136138 ) ) ( OBJ-AT ?auto_2136137 ?auto_2136138 ) ( IN-CITY ?auto_2136141 ?auto_2136139 ) ( not ( = ?auto_2136131 ?auto_2136141 ) ) ( OBJ-AT ?auto_2136132 ?auto_2136141 ) ( OBJ-AT ?auto_2136133 ?auto_2136142 ) ( OBJ-AT ?auto_2136135 ?auto_2136138 ) ( OBJ-AT ?auto_2136134 ?auto_2136138 ) ( TRUCK-AT ?auto_2136140 ?auto_2136131 ) ( not ( = ?auto_2136134 ?auto_2136135 ) ) ( not ( = ?auto_2136134 ?auto_2136133 ) ) ( not ( = ?auto_2136135 ?auto_2136133 ) ) ( not ( = ?auto_2136142 ?auto_2136138 ) ) ( not ( = ?auto_2136134 ?auto_2136132 ) ) ( not ( = ?auto_2136135 ?auto_2136132 ) ) ( not ( = ?auto_2136133 ?auto_2136132 ) ) ( not ( = ?auto_2136141 ?auto_2136142 ) ) ( not ( = ?auto_2136141 ?auto_2136138 ) ) ( not ( = ?auto_2136134 ?auto_2136137 ) ) ( not ( = ?auto_2136135 ?auto_2136137 ) ) ( not ( = ?auto_2136133 ?auto_2136137 ) ) ( not ( = ?auto_2136132 ?auto_2136137 ) ) ( not ( = ?auto_2136134 ?auto_2136136 ) ) ( not ( = ?auto_2136135 ?auto_2136136 ) ) ( not ( = ?auto_2136133 ?auto_2136136 ) ) ( not ( = ?auto_2136132 ?auto_2136136 ) ) ( not ( = ?auto_2136137 ?auto_2136136 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_2136134 ?auto_2136135 ?auto_2136133 ?auto_2136132 ?auto_2136136 ?auto_2136137 ?auto_2136131 )
      ( DELIVER-6PKG-VERIFY ?auto_2136132 ?auto_2136133 ?auto_2136134 ?auto_2136135 ?auto_2136136 ?auto_2136137 ?auto_2136131 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_2136722 - OBJ
      ?auto_2136723 - OBJ
      ?auto_2136724 - OBJ
      ?auto_2136725 - OBJ
      ?auto_2136726 - OBJ
      ?auto_2136727 - OBJ
      ?auto_2136721 - LOCATION
    )
    :vars
    (
      ?auto_2136732 - LOCATION
      ?auto_2136729 - CITY
      ?auto_2136728 - LOCATION
      ?auto_2136731 - LOCATION
      ?auto_2136730 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2136732 ?auto_2136729 ) ( IN-CITY ?auto_2136721 ?auto_2136729 ) ( not ( = ?auto_2136721 ?auto_2136732 ) ) ( OBJ-AT ?auto_2136725 ?auto_2136732 ) ( IN-CITY ?auto_2136728 ?auto_2136729 ) ( not ( = ?auto_2136721 ?auto_2136728 ) ) ( OBJ-AT ?auto_2136727 ?auto_2136728 ) ( IN-CITY ?auto_2136731 ?auto_2136729 ) ( not ( = ?auto_2136721 ?auto_2136731 ) ) ( OBJ-AT ?auto_2136722 ?auto_2136731 ) ( OBJ-AT ?auto_2136723 ?auto_2136732 ) ( OBJ-AT ?auto_2136726 ?auto_2136728 ) ( OBJ-AT ?auto_2136724 ?auto_2136728 ) ( TRUCK-AT ?auto_2136730 ?auto_2136721 ) ( not ( = ?auto_2136724 ?auto_2136726 ) ) ( not ( = ?auto_2136724 ?auto_2136723 ) ) ( not ( = ?auto_2136726 ?auto_2136723 ) ) ( not ( = ?auto_2136732 ?auto_2136728 ) ) ( not ( = ?auto_2136724 ?auto_2136722 ) ) ( not ( = ?auto_2136726 ?auto_2136722 ) ) ( not ( = ?auto_2136723 ?auto_2136722 ) ) ( not ( = ?auto_2136731 ?auto_2136732 ) ) ( not ( = ?auto_2136731 ?auto_2136728 ) ) ( not ( = ?auto_2136724 ?auto_2136727 ) ) ( not ( = ?auto_2136726 ?auto_2136727 ) ) ( not ( = ?auto_2136723 ?auto_2136727 ) ) ( not ( = ?auto_2136722 ?auto_2136727 ) ) ( not ( = ?auto_2136724 ?auto_2136725 ) ) ( not ( = ?auto_2136726 ?auto_2136725 ) ) ( not ( = ?auto_2136723 ?auto_2136725 ) ) ( not ( = ?auto_2136722 ?auto_2136725 ) ) ( not ( = ?auto_2136727 ?auto_2136725 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_2136724 ?auto_2136726 ?auto_2136723 ?auto_2136722 ?auto_2136725 ?auto_2136727 ?auto_2136721 )
      ( DELIVER-6PKG-VERIFY ?auto_2136722 ?auto_2136723 ?auto_2136724 ?auto_2136725 ?auto_2136726 ?auto_2136727 ?auto_2136721 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_2142117 - OBJ
      ?auto_2142118 - OBJ
      ?auto_2142119 - OBJ
      ?auto_2142120 - OBJ
      ?auto_2142121 - OBJ
      ?auto_2142122 - OBJ
      ?auto_2142116 - LOCATION
    )
    :vars
    (
      ?auto_2142127 - LOCATION
      ?auto_2142124 - CITY
      ?auto_2142123 - LOCATION
      ?auto_2142126 - LOCATION
      ?auto_2142125 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2142127 ?auto_2142124 ) ( IN-CITY ?auto_2142116 ?auto_2142124 ) ( not ( = ?auto_2142116 ?auto_2142127 ) ) ( OBJ-AT ?auto_2142119 ?auto_2142127 ) ( IN-CITY ?auto_2142123 ?auto_2142124 ) ( not ( = ?auto_2142116 ?auto_2142123 ) ) ( OBJ-AT ?auto_2142122 ?auto_2142123 ) ( IN-CITY ?auto_2142126 ?auto_2142124 ) ( not ( = ?auto_2142116 ?auto_2142126 ) ) ( OBJ-AT ?auto_2142117 ?auto_2142126 ) ( OBJ-AT ?auto_2142118 ?auto_2142127 ) ( OBJ-AT ?auto_2142121 ?auto_2142123 ) ( OBJ-AT ?auto_2142120 ?auto_2142123 ) ( TRUCK-AT ?auto_2142125 ?auto_2142116 ) ( not ( = ?auto_2142120 ?auto_2142121 ) ) ( not ( = ?auto_2142120 ?auto_2142118 ) ) ( not ( = ?auto_2142121 ?auto_2142118 ) ) ( not ( = ?auto_2142127 ?auto_2142123 ) ) ( not ( = ?auto_2142120 ?auto_2142117 ) ) ( not ( = ?auto_2142121 ?auto_2142117 ) ) ( not ( = ?auto_2142118 ?auto_2142117 ) ) ( not ( = ?auto_2142126 ?auto_2142127 ) ) ( not ( = ?auto_2142126 ?auto_2142123 ) ) ( not ( = ?auto_2142120 ?auto_2142122 ) ) ( not ( = ?auto_2142121 ?auto_2142122 ) ) ( not ( = ?auto_2142118 ?auto_2142122 ) ) ( not ( = ?auto_2142117 ?auto_2142122 ) ) ( not ( = ?auto_2142120 ?auto_2142119 ) ) ( not ( = ?auto_2142121 ?auto_2142119 ) ) ( not ( = ?auto_2142118 ?auto_2142119 ) ) ( not ( = ?auto_2142117 ?auto_2142119 ) ) ( not ( = ?auto_2142122 ?auto_2142119 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_2142120 ?auto_2142121 ?auto_2142118 ?auto_2142117 ?auto_2142119 ?auto_2142122 ?auto_2142116 )
      ( DELIVER-6PKG-VERIFY ?auto_2142117 ?auto_2142118 ?auto_2142119 ?auto_2142120 ?auto_2142121 ?auto_2142122 ?auto_2142116 ) )
  )

)

