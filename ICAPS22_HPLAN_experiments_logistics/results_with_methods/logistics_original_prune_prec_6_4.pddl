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
      ?auto_56468201 - OBJ
      ?auto_56468202 - LOCATION
    )
    :vars
    (
      ?auto_56468203 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_56468203 ?auto_56468202 ) ( IN-TRUCK ?auto_56468201 ?auto_56468203 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_56468201 ?auto_56468203 ?auto_56468202 )
      ( DELIVER-1PKG-VERIFY ?auto_56468201 ?auto_56468202 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_56468234 - OBJ
      ?auto_56468235 - LOCATION
    )
    :vars
    (
      ?auto_56468236 - TRUCK
      ?auto_56468237 - LOCATION
      ?auto_56468238 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_56468234 ?auto_56468236 ) ( TRUCK-AT ?auto_56468236 ?auto_56468237 ) ( IN-CITY ?auto_56468237 ?auto_56468238 ) ( IN-CITY ?auto_56468235 ?auto_56468238 ) ( not ( = ?auto_56468235 ?auto_56468237 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_56468236 ?auto_56468237 ?auto_56468235 ?auto_56468238 )
      ( DELIVER-1PKG ?auto_56468234 ?auto_56468235 )
      ( DELIVER-1PKG-VERIFY ?auto_56468234 ?auto_56468235 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_56468279 - OBJ
      ?auto_56468280 - LOCATION
    )
    :vars
    (
      ?auto_56468281 - TRUCK
      ?auto_56468282 - LOCATION
      ?auto_56468283 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_56468281 ?auto_56468282 ) ( IN-CITY ?auto_56468282 ?auto_56468283 ) ( IN-CITY ?auto_56468280 ?auto_56468283 ) ( not ( = ?auto_56468280 ?auto_56468282 ) ) ( OBJ-AT ?auto_56468279 ?auto_56468282 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_56468279 ?auto_56468281 ?auto_56468282 )
      ( DELIVER-1PKG ?auto_56468279 ?auto_56468280 )
      ( DELIVER-1PKG-VERIFY ?auto_56468279 ?auto_56468280 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_56468324 - OBJ
      ?auto_56468325 - LOCATION
    )
    :vars
    (
      ?auto_56468326 - LOCATION
      ?auto_56468327 - CITY
      ?auto_56468328 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_56468326 ?auto_56468327 ) ( IN-CITY ?auto_56468325 ?auto_56468327 ) ( not ( = ?auto_56468325 ?auto_56468326 ) ) ( OBJ-AT ?auto_56468324 ?auto_56468326 ) ( TRUCK-AT ?auto_56468328 ?auto_56468325 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_56468328 ?auto_56468325 ?auto_56468326 ?auto_56468327 )
      ( DELIVER-1PKG ?auto_56468324 ?auto_56468325 )
      ( DELIVER-1PKG-VERIFY ?auto_56468324 ?auto_56468325 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_56469113 - OBJ
      ?auto_56469115 - OBJ
      ?auto_56469114 - LOCATION
    )
    :vars
    (
      ?auto_56469116 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_56469115 ?auto_56469113 ) ( TRUCK-AT ?auto_56469116 ?auto_56469114 ) ( IN-TRUCK ?auto_56469115 ?auto_56469116 ) ( OBJ-AT ?auto_56469113 ?auto_56469114 ) ( not ( = ?auto_56469113 ?auto_56469115 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_56469115 ?auto_56469114 )
      ( DELIVER-2PKG-VERIFY ?auto_56469113 ?auto_56469115 ?auto_56469114 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_56469976 - OBJ
      ?auto_56469978 - OBJ
      ?auto_56469977 - LOCATION
    )
    :vars
    (
      ?auto_56469981 - TRUCK
      ?auto_56469980 - LOCATION
      ?auto_56469979 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_56469978 ?auto_56469976 ) ( IN-TRUCK ?auto_56469978 ?auto_56469981 ) ( TRUCK-AT ?auto_56469981 ?auto_56469980 ) ( IN-CITY ?auto_56469980 ?auto_56469979 ) ( IN-CITY ?auto_56469977 ?auto_56469979 ) ( not ( = ?auto_56469977 ?auto_56469980 ) ) ( OBJ-AT ?auto_56469976 ?auto_56469977 ) ( not ( = ?auto_56469976 ?auto_56469978 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_56469978 ?auto_56469977 )
      ( DELIVER-2PKG-VERIFY ?auto_56469976 ?auto_56469978 ?auto_56469977 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_56471077 - OBJ
      ?auto_56471078 - LOCATION
    )
    :vars
    (
      ?auto_56471079 - OBJ
      ?auto_56471082 - TRUCK
      ?auto_56471081 - LOCATION
      ?auto_56471080 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_56471077 ?auto_56471079 ) ( TRUCK-AT ?auto_56471082 ?auto_56471081 ) ( IN-CITY ?auto_56471081 ?auto_56471080 ) ( IN-CITY ?auto_56471078 ?auto_56471080 ) ( not ( = ?auto_56471078 ?auto_56471081 ) ) ( OBJ-AT ?auto_56471079 ?auto_56471078 ) ( not ( = ?auto_56471079 ?auto_56471077 ) ) ( OBJ-AT ?auto_56471077 ?auto_56471081 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_56471077 ?auto_56471082 ?auto_56471081 )
      ( DELIVER-2PKG ?auto_56471079 ?auto_56471077 ?auto_56471078 )
      ( DELIVER-1PKG-VERIFY ?auto_56471077 ?auto_56471078 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_56471083 - OBJ
      ?auto_56471085 - OBJ
      ?auto_56471084 - LOCATION
    )
    :vars
    (
      ?auto_56471086 - TRUCK
      ?auto_56471087 - LOCATION
      ?auto_56471088 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_56471085 ?auto_56471083 ) ( TRUCK-AT ?auto_56471086 ?auto_56471087 ) ( IN-CITY ?auto_56471087 ?auto_56471088 ) ( IN-CITY ?auto_56471084 ?auto_56471088 ) ( not ( = ?auto_56471084 ?auto_56471087 ) ) ( OBJ-AT ?auto_56471083 ?auto_56471084 ) ( not ( = ?auto_56471083 ?auto_56471085 ) ) ( OBJ-AT ?auto_56471085 ?auto_56471087 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_56471085 ?auto_56471084 )
      ( DELIVER-2PKG-VERIFY ?auto_56471083 ?auto_56471085 ?auto_56471084 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_56472184 - OBJ
      ?auto_56472185 - LOCATION
    )
    :vars
    (
      ?auto_56472189 - OBJ
      ?auto_56472186 - LOCATION
      ?auto_56472187 - CITY
      ?auto_56472188 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_56472184 ?auto_56472189 ) ( IN-CITY ?auto_56472186 ?auto_56472187 ) ( IN-CITY ?auto_56472185 ?auto_56472187 ) ( not ( = ?auto_56472185 ?auto_56472186 ) ) ( OBJ-AT ?auto_56472189 ?auto_56472185 ) ( not ( = ?auto_56472189 ?auto_56472184 ) ) ( OBJ-AT ?auto_56472184 ?auto_56472186 ) ( TRUCK-AT ?auto_56472188 ?auto_56472185 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_56472188 ?auto_56472185 ?auto_56472186 ?auto_56472187 )
      ( DELIVER-2PKG ?auto_56472189 ?auto_56472184 ?auto_56472185 )
      ( DELIVER-1PKG-VERIFY ?auto_56472184 ?auto_56472185 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_56472190 - OBJ
      ?auto_56472192 - OBJ
      ?auto_56472191 - LOCATION
    )
    :vars
    (
      ?auto_56472195 - LOCATION
      ?auto_56472194 - CITY
      ?auto_56472193 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_56472192 ?auto_56472190 ) ( IN-CITY ?auto_56472195 ?auto_56472194 ) ( IN-CITY ?auto_56472191 ?auto_56472194 ) ( not ( = ?auto_56472191 ?auto_56472195 ) ) ( OBJ-AT ?auto_56472190 ?auto_56472191 ) ( not ( = ?auto_56472190 ?auto_56472192 ) ) ( OBJ-AT ?auto_56472192 ?auto_56472195 ) ( TRUCK-AT ?auto_56472193 ?auto_56472191 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_56472192 ?auto_56472191 )
      ( DELIVER-2PKG-VERIFY ?auto_56472190 ?auto_56472192 ?auto_56472191 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_56473291 - OBJ
      ?auto_56473292 - LOCATION
    )
    :vars
    (
      ?auto_56473293 - OBJ
      ?auto_56473296 - LOCATION
      ?auto_56473295 - CITY
      ?auto_56473294 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_56473291 ?auto_56473293 ) ( IN-CITY ?auto_56473296 ?auto_56473295 ) ( IN-CITY ?auto_56473292 ?auto_56473295 ) ( not ( = ?auto_56473292 ?auto_56473296 ) ) ( not ( = ?auto_56473293 ?auto_56473291 ) ) ( OBJ-AT ?auto_56473291 ?auto_56473296 ) ( TRUCK-AT ?auto_56473294 ?auto_56473292 ) ( IN-TRUCK ?auto_56473293 ?auto_56473294 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_56473293 ?auto_56473292 )
      ( DELIVER-2PKG ?auto_56473293 ?auto_56473291 ?auto_56473292 )
      ( DELIVER-1PKG-VERIFY ?auto_56473291 ?auto_56473292 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_56473297 - OBJ
      ?auto_56473299 - OBJ
      ?auto_56473298 - LOCATION
    )
    :vars
    (
      ?auto_56473300 - LOCATION
      ?auto_56473301 - CITY
      ?auto_56473302 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_56473299 ?auto_56473297 ) ( IN-CITY ?auto_56473300 ?auto_56473301 ) ( IN-CITY ?auto_56473298 ?auto_56473301 ) ( not ( = ?auto_56473298 ?auto_56473300 ) ) ( not ( = ?auto_56473297 ?auto_56473299 ) ) ( OBJ-AT ?auto_56473299 ?auto_56473300 ) ( TRUCK-AT ?auto_56473302 ?auto_56473298 ) ( IN-TRUCK ?auto_56473297 ?auto_56473302 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_56473299 ?auto_56473298 )
      ( DELIVER-2PKG-VERIFY ?auto_56473297 ?auto_56473299 ?auto_56473298 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_56474398 - OBJ
      ?auto_56474399 - LOCATION
    )
    :vars
    (
      ?auto_56474401 - OBJ
      ?auto_56474400 - LOCATION
      ?auto_56474402 - CITY
      ?auto_56474403 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_56474398 ?auto_56474401 ) ( IN-CITY ?auto_56474400 ?auto_56474402 ) ( IN-CITY ?auto_56474399 ?auto_56474402 ) ( not ( = ?auto_56474399 ?auto_56474400 ) ) ( not ( = ?auto_56474401 ?auto_56474398 ) ) ( OBJ-AT ?auto_56474398 ?auto_56474400 ) ( IN-TRUCK ?auto_56474401 ?auto_56474403 ) ( TRUCK-AT ?auto_56474403 ?auto_56474400 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_56474403 ?auto_56474400 ?auto_56474399 ?auto_56474402 )
      ( DELIVER-2PKG ?auto_56474401 ?auto_56474398 ?auto_56474399 )
      ( DELIVER-1PKG-VERIFY ?auto_56474398 ?auto_56474399 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_56474404 - OBJ
      ?auto_56474406 - OBJ
      ?auto_56474405 - LOCATION
    )
    :vars
    (
      ?auto_56474407 - LOCATION
      ?auto_56474408 - CITY
      ?auto_56474409 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_56474406 ?auto_56474404 ) ( IN-CITY ?auto_56474407 ?auto_56474408 ) ( IN-CITY ?auto_56474405 ?auto_56474408 ) ( not ( = ?auto_56474405 ?auto_56474407 ) ) ( not ( = ?auto_56474404 ?auto_56474406 ) ) ( OBJ-AT ?auto_56474406 ?auto_56474407 ) ( IN-TRUCK ?auto_56474404 ?auto_56474409 ) ( TRUCK-AT ?auto_56474409 ?auto_56474407 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_56474406 ?auto_56474405 )
      ( DELIVER-2PKG-VERIFY ?auto_56474404 ?auto_56474406 ?auto_56474405 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_56484067 - OBJ
      ?auto_56484069 - OBJ
      ?auto_56484070 - OBJ
      ?auto_56484068 - LOCATION
    )
    :vars
    (
      ?auto_56484071 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_56484069 ?auto_56484067 ) ( GREATER-THAN ?auto_56484070 ?auto_56484067 ) ( GREATER-THAN ?auto_56484070 ?auto_56484069 ) ( TRUCK-AT ?auto_56484071 ?auto_56484068 ) ( IN-TRUCK ?auto_56484070 ?auto_56484071 ) ( OBJ-AT ?auto_56484067 ?auto_56484068 ) ( OBJ-AT ?auto_56484069 ?auto_56484068 ) ( not ( = ?auto_56484067 ?auto_56484069 ) ) ( not ( = ?auto_56484067 ?auto_56484070 ) ) ( not ( = ?auto_56484069 ?auto_56484070 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_56484070 ?auto_56484068 )
      ( DELIVER-3PKG-VERIFY ?auto_56484067 ?auto_56484069 ?auto_56484070 ?auto_56484068 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_56491385 - OBJ
      ?auto_56491387 - OBJ
      ?auto_56491388 - OBJ
      ?auto_56491386 - LOCATION
    )
    :vars
    (
      ?auto_56491389 - TRUCK
      ?auto_56491390 - LOCATION
      ?auto_56491391 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_56491387 ?auto_56491385 ) ( GREATER-THAN ?auto_56491388 ?auto_56491385 ) ( GREATER-THAN ?auto_56491388 ?auto_56491387 ) ( IN-TRUCK ?auto_56491388 ?auto_56491389 ) ( TRUCK-AT ?auto_56491389 ?auto_56491390 ) ( IN-CITY ?auto_56491390 ?auto_56491391 ) ( IN-CITY ?auto_56491386 ?auto_56491391 ) ( not ( = ?auto_56491386 ?auto_56491390 ) ) ( OBJ-AT ?auto_56491385 ?auto_56491386 ) ( not ( = ?auto_56491385 ?auto_56491388 ) ) ( OBJ-AT ?auto_56491387 ?auto_56491386 ) ( not ( = ?auto_56491385 ?auto_56491387 ) ) ( not ( = ?auto_56491387 ?auto_56491388 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_56491385 ?auto_56491388 ?auto_56491386 )
      ( DELIVER-3PKG-VERIFY ?auto_56491385 ?auto_56491387 ?auto_56491388 ?auto_56491386 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_56500738 - OBJ
      ?auto_56500740 - OBJ
      ?auto_56500741 - OBJ
      ?auto_56500739 - LOCATION
    )
    :vars
    (
      ?auto_56500742 - TRUCK
      ?auto_56500743 - LOCATION
      ?auto_56500744 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_56500740 ?auto_56500738 ) ( GREATER-THAN ?auto_56500741 ?auto_56500738 ) ( GREATER-THAN ?auto_56500741 ?auto_56500740 ) ( TRUCK-AT ?auto_56500742 ?auto_56500743 ) ( IN-CITY ?auto_56500743 ?auto_56500744 ) ( IN-CITY ?auto_56500739 ?auto_56500744 ) ( not ( = ?auto_56500739 ?auto_56500743 ) ) ( OBJ-AT ?auto_56500738 ?auto_56500739 ) ( not ( = ?auto_56500738 ?auto_56500741 ) ) ( OBJ-AT ?auto_56500741 ?auto_56500743 ) ( OBJ-AT ?auto_56500740 ?auto_56500739 ) ( not ( = ?auto_56500738 ?auto_56500740 ) ) ( not ( = ?auto_56500740 ?auto_56500741 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_56500738 ?auto_56500741 ?auto_56500739 )
      ( DELIVER-3PKG-VERIFY ?auto_56500738 ?auto_56500740 ?auto_56500741 ?auto_56500739 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_56510091 - OBJ
      ?auto_56510093 - OBJ
      ?auto_56510094 - OBJ
      ?auto_56510092 - LOCATION
    )
    :vars
    (
      ?auto_56510095 - LOCATION
      ?auto_56510096 - CITY
      ?auto_56510097 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_56510093 ?auto_56510091 ) ( GREATER-THAN ?auto_56510094 ?auto_56510091 ) ( GREATER-THAN ?auto_56510094 ?auto_56510093 ) ( IN-CITY ?auto_56510095 ?auto_56510096 ) ( IN-CITY ?auto_56510092 ?auto_56510096 ) ( not ( = ?auto_56510092 ?auto_56510095 ) ) ( OBJ-AT ?auto_56510091 ?auto_56510092 ) ( not ( = ?auto_56510091 ?auto_56510094 ) ) ( OBJ-AT ?auto_56510094 ?auto_56510095 ) ( TRUCK-AT ?auto_56510097 ?auto_56510092 ) ( OBJ-AT ?auto_56510093 ?auto_56510092 ) ( not ( = ?auto_56510091 ?auto_56510093 ) ) ( not ( = ?auto_56510093 ?auto_56510094 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_56510091 ?auto_56510094 ?auto_56510092 )
      ( DELIVER-3PKG-VERIFY ?auto_56510091 ?auto_56510093 ?auto_56510094 ?auto_56510092 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_56528752 - OBJ
      ?auto_56528753 - LOCATION
    )
    :vars
    (
      ?auto_56528754 - OBJ
      ?auto_56528756 - LOCATION
      ?auto_56528757 - CITY
      ?auto_56528755 - TRUCK
      ?auto_56528758 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_56528752 ?auto_56528754 ) ( IN-CITY ?auto_56528756 ?auto_56528757 ) ( IN-CITY ?auto_56528753 ?auto_56528757 ) ( not ( = ?auto_56528753 ?auto_56528756 ) ) ( OBJ-AT ?auto_56528754 ?auto_56528753 ) ( not ( = ?auto_56528754 ?auto_56528752 ) ) ( OBJ-AT ?auto_56528752 ?auto_56528756 ) ( TRUCK-AT ?auto_56528755 ?auto_56528758 ) ( IN-CITY ?auto_56528758 ?auto_56528757 ) ( not ( = ?auto_56528753 ?auto_56528758 ) ) ( not ( = ?auto_56528756 ?auto_56528758 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_56528755 ?auto_56528758 ?auto_56528753 ?auto_56528757 )
      ( DELIVER-2PKG ?auto_56528754 ?auto_56528752 ?auto_56528753 )
      ( DELIVER-1PKG-VERIFY ?auto_56528752 ?auto_56528753 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_56528759 - OBJ
      ?auto_56528761 - OBJ
      ?auto_56528760 - LOCATION
    )
    :vars
    (
      ?auto_56528762 - LOCATION
      ?auto_56528765 - CITY
      ?auto_56528763 - TRUCK
      ?auto_56528764 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_56528761 ?auto_56528759 ) ( IN-CITY ?auto_56528762 ?auto_56528765 ) ( IN-CITY ?auto_56528760 ?auto_56528765 ) ( not ( = ?auto_56528760 ?auto_56528762 ) ) ( OBJ-AT ?auto_56528759 ?auto_56528760 ) ( not ( = ?auto_56528759 ?auto_56528761 ) ) ( OBJ-AT ?auto_56528761 ?auto_56528762 ) ( TRUCK-AT ?auto_56528763 ?auto_56528764 ) ( IN-CITY ?auto_56528764 ?auto_56528765 ) ( not ( = ?auto_56528760 ?auto_56528764 ) ) ( not ( = ?auto_56528762 ?auto_56528764 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_56528761 ?auto_56528760 )
      ( DELIVER-2PKG-VERIFY ?auto_56528759 ?auto_56528761 ?auto_56528760 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_56568089 - OBJ
      ?auto_56568090 - LOCATION
    )
    :vars
    (
      ?auto_56568093 - OBJ
      ?auto_56568094 - LOCATION
      ?auto_56568091 - CITY
      ?auto_56568092 - TRUCK
      ?auto_56568095 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_56568089 ?auto_56568093 ) ( IN-CITY ?auto_56568094 ?auto_56568091 ) ( IN-CITY ?auto_56568090 ?auto_56568091 ) ( not ( = ?auto_56568090 ?auto_56568094 ) ) ( not ( = ?auto_56568093 ?auto_56568089 ) ) ( OBJ-AT ?auto_56568089 ?auto_56568094 ) ( IN-TRUCK ?auto_56568093 ?auto_56568092 ) ( TRUCK-AT ?auto_56568092 ?auto_56568095 ) ( IN-CITY ?auto_56568095 ?auto_56568091 ) ( not ( = ?auto_56568090 ?auto_56568095 ) ) ( not ( = ?auto_56568094 ?auto_56568095 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_56568092 ?auto_56568095 ?auto_56568090 ?auto_56568091 )
      ( DELIVER-2PKG ?auto_56568093 ?auto_56568089 ?auto_56568090 )
      ( DELIVER-1PKG-VERIFY ?auto_56568089 ?auto_56568090 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_56568096 - OBJ
      ?auto_56568098 - OBJ
      ?auto_56568097 - LOCATION
    )
    :vars
    (
      ?auto_56568102 - LOCATION
      ?auto_56568100 - CITY
      ?auto_56568101 - TRUCK
      ?auto_56568099 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_56568098 ?auto_56568096 ) ( IN-CITY ?auto_56568102 ?auto_56568100 ) ( IN-CITY ?auto_56568097 ?auto_56568100 ) ( not ( = ?auto_56568097 ?auto_56568102 ) ) ( not ( = ?auto_56568096 ?auto_56568098 ) ) ( OBJ-AT ?auto_56568098 ?auto_56568102 ) ( IN-TRUCK ?auto_56568096 ?auto_56568101 ) ( TRUCK-AT ?auto_56568101 ?auto_56568099 ) ( IN-CITY ?auto_56568099 ?auto_56568100 ) ( not ( = ?auto_56568097 ?auto_56568099 ) ) ( not ( = ?auto_56568102 ?auto_56568099 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_56568098 ?auto_56568097 )
      ( DELIVER-2PKG-VERIFY ?auto_56568096 ?auto_56568098 ?auto_56568097 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_56578412 - OBJ
      ?auto_56578413 - LOCATION
    )
    :vars
    (
      ?auto_56578417 - OBJ
      ?auto_56578415 - LOCATION
      ?auto_56578416 - CITY
      ?auto_56578414 - TRUCK
      ?auto_56578418 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_56578412 ?auto_56578417 ) ( IN-CITY ?auto_56578415 ?auto_56578416 ) ( IN-CITY ?auto_56578413 ?auto_56578416 ) ( not ( = ?auto_56578413 ?auto_56578415 ) ) ( not ( = ?auto_56578417 ?auto_56578412 ) ) ( OBJ-AT ?auto_56578412 ?auto_56578415 ) ( TRUCK-AT ?auto_56578414 ?auto_56578418 ) ( IN-CITY ?auto_56578418 ?auto_56578416 ) ( not ( = ?auto_56578413 ?auto_56578418 ) ) ( not ( = ?auto_56578415 ?auto_56578418 ) ) ( OBJ-AT ?auto_56578417 ?auto_56578418 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_56578417 ?auto_56578414 ?auto_56578418 )
      ( DELIVER-2PKG ?auto_56578417 ?auto_56578412 ?auto_56578413 )
      ( DELIVER-1PKG-VERIFY ?auto_56578412 ?auto_56578413 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_56578419 - OBJ
      ?auto_56578421 - OBJ
      ?auto_56578420 - LOCATION
    )
    :vars
    (
      ?auto_56578423 - LOCATION
      ?auto_56578422 - CITY
      ?auto_56578424 - TRUCK
      ?auto_56578425 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_56578421 ?auto_56578419 ) ( IN-CITY ?auto_56578423 ?auto_56578422 ) ( IN-CITY ?auto_56578420 ?auto_56578422 ) ( not ( = ?auto_56578420 ?auto_56578423 ) ) ( not ( = ?auto_56578419 ?auto_56578421 ) ) ( OBJ-AT ?auto_56578421 ?auto_56578423 ) ( TRUCK-AT ?auto_56578424 ?auto_56578425 ) ( IN-CITY ?auto_56578425 ?auto_56578422 ) ( not ( = ?auto_56578420 ?auto_56578425 ) ) ( not ( = ?auto_56578423 ?auto_56578425 ) ) ( OBJ-AT ?auto_56578419 ?auto_56578425 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_56578421 ?auto_56578420 )
      ( DELIVER-2PKG-VERIFY ?auto_56578419 ?auto_56578421 ?auto_56578420 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_56627531 - OBJ
      ?auto_56627533 - OBJ
      ?auto_56627534 - OBJ
      ?auto_56627535 - OBJ
      ?auto_56627532 - LOCATION
    )
    :vars
    (
      ?auto_56627536 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_56627533 ?auto_56627531 ) ( GREATER-THAN ?auto_56627534 ?auto_56627531 ) ( GREATER-THAN ?auto_56627534 ?auto_56627533 ) ( GREATER-THAN ?auto_56627535 ?auto_56627531 ) ( GREATER-THAN ?auto_56627535 ?auto_56627533 ) ( GREATER-THAN ?auto_56627535 ?auto_56627534 ) ( TRUCK-AT ?auto_56627536 ?auto_56627532 ) ( IN-TRUCK ?auto_56627535 ?auto_56627536 ) ( OBJ-AT ?auto_56627531 ?auto_56627532 ) ( OBJ-AT ?auto_56627533 ?auto_56627532 ) ( OBJ-AT ?auto_56627534 ?auto_56627532 ) ( not ( = ?auto_56627531 ?auto_56627533 ) ) ( not ( = ?auto_56627531 ?auto_56627534 ) ) ( not ( = ?auto_56627531 ?auto_56627535 ) ) ( not ( = ?auto_56627533 ?auto_56627534 ) ) ( not ( = ?auto_56627533 ?auto_56627535 ) ) ( not ( = ?auto_56627534 ?auto_56627535 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_56627535 ?auto_56627532 )
      ( DELIVER-4PKG-VERIFY ?auto_56627531 ?auto_56627533 ?auto_56627534 ?auto_56627535 ?auto_56627532 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_56661317 - OBJ
      ?auto_56661319 - OBJ
      ?auto_56661320 - OBJ
      ?auto_56661321 - OBJ
      ?auto_56661318 - LOCATION
    )
    :vars
    (
      ?auto_56661323 - TRUCK
      ?auto_56661324 - LOCATION
      ?auto_56661322 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_56661319 ?auto_56661317 ) ( GREATER-THAN ?auto_56661320 ?auto_56661317 ) ( GREATER-THAN ?auto_56661320 ?auto_56661319 ) ( GREATER-THAN ?auto_56661321 ?auto_56661317 ) ( GREATER-THAN ?auto_56661321 ?auto_56661319 ) ( GREATER-THAN ?auto_56661321 ?auto_56661320 ) ( IN-TRUCK ?auto_56661321 ?auto_56661323 ) ( TRUCK-AT ?auto_56661323 ?auto_56661324 ) ( IN-CITY ?auto_56661324 ?auto_56661322 ) ( IN-CITY ?auto_56661318 ?auto_56661322 ) ( not ( = ?auto_56661318 ?auto_56661324 ) ) ( OBJ-AT ?auto_56661317 ?auto_56661318 ) ( not ( = ?auto_56661317 ?auto_56661321 ) ) ( OBJ-AT ?auto_56661319 ?auto_56661318 ) ( OBJ-AT ?auto_56661320 ?auto_56661318 ) ( not ( = ?auto_56661317 ?auto_56661319 ) ) ( not ( = ?auto_56661317 ?auto_56661320 ) ) ( not ( = ?auto_56661319 ?auto_56661320 ) ) ( not ( = ?auto_56661319 ?auto_56661321 ) ) ( not ( = ?auto_56661320 ?auto_56661321 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_56661317 ?auto_56661321 ?auto_56661318 )
      ( DELIVER-4PKG-VERIFY ?auto_56661317 ?auto_56661319 ?auto_56661320 ?auto_56661321 ?auto_56661318 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_56704673 - OBJ
      ?auto_56704675 - OBJ
      ?auto_56704676 - OBJ
      ?auto_56704677 - OBJ
      ?auto_56704674 - LOCATION
    )
    :vars
    (
      ?auto_56704680 - TRUCK
      ?auto_56704678 - LOCATION
      ?auto_56704679 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_56704675 ?auto_56704673 ) ( GREATER-THAN ?auto_56704676 ?auto_56704673 ) ( GREATER-THAN ?auto_56704676 ?auto_56704675 ) ( GREATER-THAN ?auto_56704677 ?auto_56704673 ) ( GREATER-THAN ?auto_56704677 ?auto_56704675 ) ( GREATER-THAN ?auto_56704677 ?auto_56704676 ) ( TRUCK-AT ?auto_56704680 ?auto_56704678 ) ( IN-CITY ?auto_56704678 ?auto_56704679 ) ( IN-CITY ?auto_56704674 ?auto_56704679 ) ( not ( = ?auto_56704674 ?auto_56704678 ) ) ( OBJ-AT ?auto_56704673 ?auto_56704674 ) ( not ( = ?auto_56704673 ?auto_56704677 ) ) ( OBJ-AT ?auto_56704677 ?auto_56704678 ) ( OBJ-AT ?auto_56704675 ?auto_56704674 ) ( OBJ-AT ?auto_56704676 ?auto_56704674 ) ( not ( = ?auto_56704673 ?auto_56704675 ) ) ( not ( = ?auto_56704673 ?auto_56704676 ) ) ( not ( = ?auto_56704675 ?auto_56704676 ) ) ( not ( = ?auto_56704675 ?auto_56704677 ) ) ( not ( = ?auto_56704676 ?auto_56704677 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_56704673 ?auto_56704677 ?auto_56704674 )
      ( DELIVER-4PKG-VERIFY ?auto_56704673 ?auto_56704675 ?auto_56704676 ?auto_56704677 ?auto_56704674 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_56748029 - OBJ
      ?auto_56748031 - OBJ
      ?auto_56748032 - OBJ
      ?auto_56748033 - OBJ
      ?auto_56748030 - LOCATION
    )
    :vars
    (
      ?auto_56748034 - LOCATION
      ?auto_56748036 - CITY
      ?auto_56748035 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_56748031 ?auto_56748029 ) ( GREATER-THAN ?auto_56748032 ?auto_56748029 ) ( GREATER-THAN ?auto_56748032 ?auto_56748031 ) ( GREATER-THAN ?auto_56748033 ?auto_56748029 ) ( GREATER-THAN ?auto_56748033 ?auto_56748031 ) ( GREATER-THAN ?auto_56748033 ?auto_56748032 ) ( IN-CITY ?auto_56748034 ?auto_56748036 ) ( IN-CITY ?auto_56748030 ?auto_56748036 ) ( not ( = ?auto_56748030 ?auto_56748034 ) ) ( OBJ-AT ?auto_56748029 ?auto_56748030 ) ( not ( = ?auto_56748029 ?auto_56748033 ) ) ( OBJ-AT ?auto_56748033 ?auto_56748034 ) ( TRUCK-AT ?auto_56748035 ?auto_56748030 ) ( OBJ-AT ?auto_56748031 ?auto_56748030 ) ( OBJ-AT ?auto_56748032 ?auto_56748030 ) ( not ( = ?auto_56748029 ?auto_56748031 ) ) ( not ( = ?auto_56748029 ?auto_56748032 ) ) ( not ( = ?auto_56748031 ?auto_56748032 ) ) ( not ( = ?auto_56748031 ?auto_56748033 ) ) ( not ( = ?auto_56748032 ?auto_56748033 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_56748029 ?auto_56748033 ?auto_56748030 )
      ( DELIVER-4PKG-VERIFY ?auto_56748029 ?auto_56748031 ?auto_56748032 ?auto_56748033 ?auto_56748030 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_56834418 - OBJ
      ?auto_56834420 - OBJ
      ?auto_56834421 - OBJ
      ?auto_56834419 - LOCATION
    )
    :vars
    (
      ?auto_56834423 - LOCATION
      ?auto_56834422 - CITY
      ?auto_56834424 - TRUCK
      ?auto_56834425 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_56834420 ?auto_56834418 ) ( GREATER-THAN ?auto_56834421 ?auto_56834418 ) ( GREATER-THAN ?auto_56834421 ?auto_56834420 ) ( IN-CITY ?auto_56834423 ?auto_56834422 ) ( IN-CITY ?auto_56834419 ?auto_56834422 ) ( not ( = ?auto_56834419 ?auto_56834423 ) ) ( OBJ-AT ?auto_56834418 ?auto_56834419 ) ( not ( = ?auto_56834418 ?auto_56834421 ) ) ( OBJ-AT ?auto_56834421 ?auto_56834423 ) ( TRUCK-AT ?auto_56834424 ?auto_56834425 ) ( IN-CITY ?auto_56834425 ?auto_56834422 ) ( not ( = ?auto_56834419 ?auto_56834425 ) ) ( not ( = ?auto_56834423 ?auto_56834425 ) ) ( OBJ-AT ?auto_56834420 ?auto_56834419 ) ( not ( = ?auto_56834418 ?auto_56834420 ) ) ( not ( = ?auto_56834420 ?auto_56834421 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_56834418 ?auto_56834421 ?auto_56834419 )
      ( DELIVER-3PKG-VERIFY ?auto_56834418 ?auto_56834420 ?auto_56834421 ?auto_56834419 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_57416702 - OBJ
      ?auto_57416704 - OBJ
      ?auto_57416705 - OBJ
      ?auto_57416706 - OBJ
      ?auto_57416707 - OBJ
      ?auto_57416703 - LOCATION
    )
    :vars
    (
      ?auto_57416708 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_57416704 ?auto_57416702 ) ( GREATER-THAN ?auto_57416705 ?auto_57416702 ) ( GREATER-THAN ?auto_57416705 ?auto_57416704 ) ( GREATER-THAN ?auto_57416706 ?auto_57416702 ) ( GREATER-THAN ?auto_57416706 ?auto_57416704 ) ( GREATER-THAN ?auto_57416706 ?auto_57416705 ) ( GREATER-THAN ?auto_57416707 ?auto_57416702 ) ( GREATER-THAN ?auto_57416707 ?auto_57416704 ) ( GREATER-THAN ?auto_57416707 ?auto_57416705 ) ( GREATER-THAN ?auto_57416707 ?auto_57416706 ) ( TRUCK-AT ?auto_57416708 ?auto_57416703 ) ( IN-TRUCK ?auto_57416707 ?auto_57416708 ) ( OBJ-AT ?auto_57416702 ?auto_57416703 ) ( OBJ-AT ?auto_57416704 ?auto_57416703 ) ( OBJ-AT ?auto_57416705 ?auto_57416703 ) ( OBJ-AT ?auto_57416706 ?auto_57416703 ) ( not ( = ?auto_57416702 ?auto_57416704 ) ) ( not ( = ?auto_57416702 ?auto_57416705 ) ) ( not ( = ?auto_57416702 ?auto_57416706 ) ) ( not ( = ?auto_57416702 ?auto_57416707 ) ) ( not ( = ?auto_57416704 ?auto_57416705 ) ) ( not ( = ?auto_57416704 ?auto_57416706 ) ) ( not ( = ?auto_57416704 ?auto_57416707 ) ) ( not ( = ?auto_57416705 ?auto_57416706 ) ) ( not ( = ?auto_57416705 ?auto_57416707 ) ) ( not ( = ?auto_57416706 ?auto_57416707 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_57416707 ?auto_57416703 )
      ( DELIVER-5PKG-VERIFY ?auto_57416702 ?auto_57416704 ?auto_57416705 ?auto_57416706 ?auto_57416707 ?auto_57416703 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_57527422 - OBJ
      ?auto_57527424 - OBJ
      ?auto_57527425 - OBJ
      ?auto_57527426 - OBJ
      ?auto_57527427 - OBJ
      ?auto_57527423 - LOCATION
    )
    :vars
    (
      ?auto_57527430 - TRUCK
      ?auto_57527429 - LOCATION
      ?auto_57527428 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_57527424 ?auto_57527422 ) ( GREATER-THAN ?auto_57527425 ?auto_57527422 ) ( GREATER-THAN ?auto_57527425 ?auto_57527424 ) ( GREATER-THAN ?auto_57527426 ?auto_57527422 ) ( GREATER-THAN ?auto_57527426 ?auto_57527424 ) ( GREATER-THAN ?auto_57527426 ?auto_57527425 ) ( GREATER-THAN ?auto_57527427 ?auto_57527422 ) ( GREATER-THAN ?auto_57527427 ?auto_57527424 ) ( GREATER-THAN ?auto_57527427 ?auto_57527425 ) ( GREATER-THAN ?auto_57527427 ?auto_57527426 ) ( IN-TRUCK ?auto_57527427 ?auto_57527430 ) ( TRUCK-AT ?auto_57527430 ?auto_57527429 ) ( IN-CITY ?auto_57527429 ?auto_57527428 ) ( IN-CITY ?auto_57527423 ?auto_57527428 ) ( not ( = ?auto_57527423 ?auto_57527429 ) ) ( OBJ-AT ?auto_57527422 ?auto_57527423 ) ( not ( = ?auto_57527422 ?auto_57527427 ) ) ( OBJ-AT ?auto_57527424 ?auto_57527423 ) ( OBJ-AT ?auto_57527425 ?auto_57527423 ) ( OBJ-AT ?auto_57527426 ?auto_57527423 ) ( not ( = ?auto_57527422 ?auto_57527424 ) ) ( not ( = ?auto_57527422 ?auto_57527425 ) ) ( not ( = ?auto_57527422 ?auto_57527426 ) ) ( not ( = ?auto_57527424 ?auto_57527425 ) ) ( not ( = ?auto_57527424 ?auto_57527426 ) ) ( not ( = ?auto_57527424 ?auto_57527427 ) ) ( not ( = ?auto_57527425 ?auto_57527426 ) ) ( not ( = ?auto_57527425 ?auto_57527427 ) ) ( not ( = ?auto_57527426 ?auto_57527427 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_57527422 ?auto_57527427 ?auto_57527423 )
      ( DELIVER-5PKG-VERIFY ?auto_57527422 ?auto_57527424 ?auto_57527425 ?auto_57527426 ?auto_57527427 ?auto_57527423 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_57669387 - OBJ
      ?auto_57669389 - OBJ
      ?auto_57669390 - OBJ
      ?auto_57669391 - OBJ
      ?auto_57669392 - OBJ
      ?auto_57669388 - LOCATION
    )
    :vars
    (
      ?auto_57669395 - TRUCK
      ?auto_57669393 - LOCATION
      ?auto_57669394 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_57669389 ?auto_57669387 ) ( GREATER-THAN ?auto_57669390 ?auto_57669387 ) ( GREATER-THAN ?auto_57669390 ?auto_57669389 ) ( GREATER-THAN ?auto_57669391 ?auto_57669387 ) ( GREATER-THAN ?auto_57669391 ?auto_57669389 ) ( GREATER-THAN ?auto_57669391 ?auto_57669390 ) ( GREATER-THAN ?auto_57669392 ?auto_57669387 ) ( GREATER-THAN ?auto_57669392 ?auto_57669389 ) ( GREATER-THAN ?auto_57669392 ?auto_57669390 ) ( GREATER-THAN ?auto_57669392 ?auto_57669391 ) ( TRUCK-AT ?auto_57669395 ?auto_57669393 ) ( IN-CITY ?auto_57669393 ?auto_57669394 ) ( IN-CITY ?auto_57669388 ?auto_57669394 ) ( not ( = ?auto_57669388 ?auto_57669393 ) ) ( OBJ-AT ?auto_57669387 ?auto_57669388 ) ( not ( = ?auto_57669387 ?auto_57669392 ) ) ( OBJ-AT ?auto_57669392 ?auto_57669393 ) ( OBJ-AT ?auto_57669389 ?auto_57669388 ) ( OBJ-AT ?auto_57669390 ?auto_57669388 ) ( OBJ-AT ?auto_57669391 ?auto_57669388 ) ( not ( = ?auto_57669387 ?auto_57669389 ) ) ( not ( = ?auto_57669387 ?auto_57669390 ) ) ( not ( = ?auto_57669387 ?auto_57669391 ) ) ( not ( = ?auto_57669389 ?auto_57669390 ) ) ( not ( = ?auto_57669389 ?auto_57669391 ) ) ( not ( = ?auto_57669389 ?auto_57669392 ) ) ( not ( = ?auto_57669390 ?auto_57669391 ) ) ( not ( = ?auto_57669390 ?auto_57669392 ) ) ( not ( = ?auto_57669391 ?auto_57669392 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_57669387 ?auto_57669392 ?auto_57669388 )
      ( DELIVER-5PKG-VERIFY ?auto_57669387 ?auto_57669389 ?auto_57669390 ?auto_57669391 ?auto_57669392 ?auto_57669388 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_57811352 - OBJ
      ?auto_57811354 - OBJ
      ?auto_57811355 - OBJ
      ?auto_57811356 - OBJ
      ?auto_57811357 - OBJ
      ?auto_57811353 - LOCATION
    )
    :vars
    (
      ?auto_57811360 - LOCATION
      ?auto_57811359 - CITY
      ?auto_57811358 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_57811354 ?auto_57811352 ) ( GREATER-THAN ?auto_57811355 ?auto_57811352 ) ( GREATER-THAN ?auto_57811355 ?auto_57811354 ) ( GREATER-THAN ?auto_57811356 ?auto_57811352 ) ( GREATER-THAN ?auto_57811356 ?auto_57811354 ) ( GREATER-THAN ?auto_57811356 ?auto_57811355 ) ( GREATER-THAN ?auto_57811357 ?auto_57811352 ) ( GREATER-THAN ?auto_57811357 ?auto_57811354 ) ( GREATER-THAN ?auto_57811357 ?auto_57811355 ) ( GREATER-THAN ?auto_57811357 ?auto_57811356 ) ( IN-CITY ?auto_57811360 ?auto_57811359 ) ( IN-CITY ?auto_57811353 ?auto_57811359 ) ( not ( = ?auto_57811353 ?auto_57811360 ) ) ( OBJ-AT ?auto_57811352 ?auto_57811353 ) ( not ( = ?auto_57811352 ?auto_57811357 ) ) ( OBJ-AT ?auto_57811357 ?auto_57811360 ) ( TRUCK-AT ?auto_57811358 ?auto_57811353 ) ( OBJ-AT ?auto_57811354 ?auto_57811353 ) ( OBJ-AT ?auto_57811355 ?auto_57811353 ) ( OBJ-AT ?auto_57811356 ?auto_57811353 ) ( not ( = ?auto_57811352 ?auto_57811354 ) ) ( not ( = ?auto_57811352 ?auto_57811355 ) ) ( not ( = ?auto_57811352 ?auto_57811356 ) ) ( not ( = ?auto_57811354 ?auto_57811355 ) ) ( not ( = ?auto_57811354 ?auto_57811356 ) ) ( not ( = ?auto_57811354 ?auto_57811357 ) ) ( not ( = ?auto_57811355 ?auto_57811356 ) ) ( not ( = ?auto_57811355 ?auto_57811357 ) ) ( not ( = ?auto_57811356 ?auto_57811357 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_57811352 ?auto_57811357 ?auto_57811353 )
      ( DELIVER-5PKG-VERIFY ?auto_57811352 ?auto_57811354 ?auto_57811355 ?auto_57811356 ?auto_57811357 ?auto_57811353 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_58091620 - OBJ
      ?auto_58091622 - OBJ
      ?auto_58091623 - OBJ
      ?auto_58091624 - OBJ
      ?auto_58091621 - LOCATION
    )
    :vars
    (
      ?auto_58091628 - LOCATION
      ?auto_58091627 - CITY
      ?auto_58091625 - TRUCK
      ?auto_58091626 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_58091622 ?auto_58091620 ) ( GREATER-THAN ?auto_58091623 ?auto_58091620 ) ( GREATER-THAN ?auto_58091623 ?auto_58091622 ) ( GREATER-THAN ?auto_58091624 ?auto_58091620 ) ( GREATER-THAN ?auto_58091624 ?auto_58091622 ) ( GREATER-THAN ?auto_58091624 ?auto_58091623 ) ( IN-CITY ?auto_58091628 ?auto_58091627 ) ( IN-CITY ?auto_58091621 ?auto_58091627 ) ( not ( = ?auto_58091621 ?auto_58091628 ) ) ( OBJ-AT ?auto_58091620 ?auto_58091621 ) ( not ( = ?auto_58091620 ?auto_58091624 ) ) ( OBJ-AT ?auto_58091624 ?auto_58091628 ) ( TRUCK-AT ?auto_58091625 ?auto_58091626 ) ( IN-CITY ?auto_58091626 ?auto_58091627 ) ( not ( = ?auto_58091621 ?auto_58091626 ) ) ( not ( = ?auto_58091628 ?auto_58091626 ) ) ( OBJ-AT ?auto_58091622 ?auto_58091621 ) ( OBJ-AT ?auto_58091623 ?auto_58091621 ) ( not ( = ?auto_58091620 ?auto_58091622 ) ) ( not ( = ?auto_58091620 ?auto_58091623 ) ) ( not ( = ?auto_58091622 ?auto_58091623 ) ) ( not ( = ?auto_58091622 ?auto_58091624 ) ) ( not ( = ?auto_58091623 ?auto_58091624 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58091620 ?auto_58091624 ?auto_58091621 )
      ( DELIVER-4PKG-VERIFY ?auto_58091620 ?auto_58091622 ?auto_58091623 ?auto_58091624 ?auto_58091621 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_60593912 - OBJ
      ?auto_60593914 - OBJ
      ?auto_60593915 - OBJ
      ?auto_60593916 - OBJ
      ?auto_60593917 - OBJ
      ?auto_60593918 - OBJ
      ?auto_60593913 - LOCATION
    )
    :vars
    (
      ?auto_60593919 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_60593914 ?auto_60593912 ) ( GREATER-THAN ?auto_60593915 ?auto_60593912 ) ( GREATER-THAN ?auto_60593915 ?auto_60593914 ) ( GREATER-THAN ?auto_60593916 ?auto_60593912 ) ( GREATER-THAN ?auto_60593916 ?auto_60593914 ) ( GREATER-THAN ?auto_60593916 ?auto_60593915 ) ( GREATER-THAN ?auto_60593917 ?auto_60593912 ) ( GREATER-THAN ?auto_60593917 ?auto_60593914 ) ( GREATER-THAN ?auto_60593917 ?auto_60593915 ) ( GREATER-THAN ?auto_60593917 ?auto_60593916 ) ( GREATER-THAN ?auto_60593918 ?auto_60593912 ) ( GREATER-THAN ?auto_60593918 ?auto_60593914 ) ( GREATER-THAN ?auto_60593918 ?auto_60593915 ) ( GREATER-THAN ?auto_60593918 ?auto_60593916 ) ( GREATER-THAN ?auto_60593918 ?auto_60593917 ) ( TRUCK-AT ?auto_60593919 ?auto_60593913 ) ( IN-TRUCK ?auto_60593918 ?auto_60593919 ) ( OBJ-AT ?auto_60593912 ?auto_60593913 ) ( OBJ-AT ?auto_60593914 ?auto_60593913 ) ( OBJ-AT ?auto_60593915 ?auto_60593913 ) ( OBJ-AT ?auto_60593916 ?auto_60593913 ) ( OBJ-AT ?auto_60593917 ?auto_60593913 ) ( not ( = ?auto_60593912 ?auto_60593914 ) ) ( not ( = ?auto_60593912 ?auto_60593915 ) ) ( not ( = ?auto_60593912 ?auto_60593916 ) ) ( not ( = ?auto_60593912 ?auto_60593917 ) ) ( not ( = ?auto_60593912 ?auto_60593918 ) ) ( not ( = ?auto_60593914 ?auto_60593915 ) ) ( not ( = ?auto_60593914 ?auto_60593916 ) ) ( not ( = ?auto_60593914 ?auto_60593917 ) ) ( not ( = ?auto_60593914 ?auto_60593918 ) ) ( not ( = ?auto_60593915 ?auto_60593916 ) ) ( not ( = ?auto_60593915 ?auto_60593917 ) ) ( not ( = ?auto_60593915 ?auto_60593918 ) ) ( not ( = ?auto_60593916 ?auto_60593917 ) ) ( not ( = ?auto_60593916 ?auto_60593918 ) ) ( not ( = ?auto_60593917 ?auto_60593918 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_60593918 ?auto_60593913 )
      ( DELIVER-6PKG-VERIFY ?auto_60593912 ?auto_60593914 ?auto_60593915 ?auto_60593916 ?auto_60593917 ?auto_60593918 ?auto_60593913 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_60894322 - OBJ
      ?auto_60894324 - OBJ
      ?auto_60894325 - OBJ
      ?auto_60894326 - OBJ
      ?auto_60894327 - OBJ
      ?auto_60894328 - OBJ
      ?auto_60894323 - LOCATION
    )
    :vars
    (
      ?auto_60894331 - TRUCK
      ?auto_60894330 - LOCATION
      ?auto_60894329 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_60894324 ?auto_60894322 ) ( GREATER-THAN ?auto_60894325 ?auto_60894322 ) ( GREATER-THAN ?auto_60894325 ?auto_60894324 ) ( GREATER-THAN ?auto_60894326 ?auto_60894322 ) ( GREATER-THAN ?auto_60894326 ?auto_60894324 ) ( GREATER-THAN ?auto_60894326 ?auto_60894325 ) ( GREATER-THAN ?auto_60894327 ?auto_60894322 ) ( GREATER-THAN ?auto_60894327 ?auto_60894324 ) ( GREATER-THAN ?auto_60894327 ?auto_60894325 ) ( GREATER-THAN ?auto_60894327 ?auto_60894326 ) ( GREATER-THAN ?auto_60894328 ?auto_60894322 ) ( GREATER-THAN ?auto_60894328 ?auto_60894324 ) ( GREATER-THAN ?auto_60894328 ?auto_60894325 ) ( GREATER-THAN ?auto_60894328 ?auto_60894326 ) ( GREATER-THAN ?auto_60894328 ?auto_60894327 ) ( IN-TRUCK ?auto_60894328 ?auto_60894331 ) ( TRUCK-AT ?auto_60894331 ?auto_60894330 ) ( IN-CITY ?auto_60894330 ?auto_60894329 ) ( IN-CITY ?auto_60894323 ?auto_60894329 ) ( not ( = ?auto_60894323 ?auto_60894330 ) ) ( OBJ-AT ?auto_60894322 ?auto_60894323 ) ( not ( = ?auto_60894322 ?auto_60894328 ) ) ( OBJ-AT ?auto_60894324 ?auto_60894323 ) ( OBJ-AT ?auto_60894325 ?auto_60894323 ) ( OBJ-AT ?auto_60894326 ?auto_60894323 ) ( OBJ-AT ?auto_60894327 ?auto_60894323 ) ( not ( = ?auto_60894322 ?auto_60894324 ) ) ( not ( = ?auto_60894322 ?auto_60894325 ) ) ( not ( = ?auto_60894322 ?auto_60894326 ) ) ( not ( = ?auto_60894322 ?auto_60894327 ) ) ( not ( = ?auto_60894324 ?auto_60894325 ) ) ( not ( = ?auto_60894324 ?auto_60894326 ) ) ( not ( = ?auto_60894324 ?auto_60894327 ) ) ( not ( = ?auto_60894324 ?auto_60894328 ) ) ( not ( = ?auto_60894325 ?auto_60894326 ) ) ( not ( = ?auto_60894325 ?auto_60894327 ) ) ( not ( = ?auto_60894325 ?auto_60894328 ) ) ( not ( = ?auto_60894326 ?auto_60894327 ) ) ( not ( = ?auto_60894326 ?auto_60894328 ) ) ( not ( = ?auto_60894327 ?auto_60894328 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_60894322 ?auto_60894328 ?auto_60894323 )
      ( DELIVER-6PKG-VERIFY ?auto_60894322 ?auto_60894324 ?auto_60894325 ?auto_60894326 ?auto_60894327 ?auto_60894328 ?auto_60894323 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_61266544 - OBJ
      ?auto_61266546 - OBJ
      ?auto_61266547 - OBJ
      ?auto_61266548 - OBJ
      ?auto_61266549 - OBJ
      ?auto_61266550 - OBJ
      ?auto_61266545 - LOCATION
    )
    :vars
    (
      ?auto_61266553 - TRUCK
      ?auto_61266552 - LOCATION
      ?auto_61266551 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_61266546 ?auto_61266544 ) ( GREATER-THAN ?auto_61266547 ?auto_61266544 ) ( GREATER-THAN ?auto_61266547 ?auto_61266546 ) ( GREATER-THAN ?auto_61266548 ?auto_61266544 ) ( GREATER-THAN ?auto_61266548 ?auto_61266546 ) ( GREATER-THAN ?auto_61266548 ?auto_61266547 ) ( GREATER-THAN ?auto_61266549 ?auto_61266544 ) ( GREATER-THAN ?auto_61266549 ?auto_61266546 ) ( GREATER-THAN ?auto_61266549 ?auto_61266547 ) ( GREATER-THAN ?auto_61266549 ?auto_61266548 ) ( GREATER-THAN ?auto_61266550 ?auto_61266544 ) ( GREATER-THAN ?auto_61266550 ?auto_61266546 ) ( GREATER-THAN ?auto_61266550 ?auto_61266547 ) ( GREATER-THAN ?auto_61266550 ?auto_61266548 ) ( GREATER-THAN ?auto_61266550 ?auto_61266549 ) ( TRUCK-AT ?auto_61266553 ?auto_61266552 ) ( IN-CITY ?auto_61266552 ?auto_61266551 ) ( IN-CITY ?auto_61266545 ?auto_61266551 ) ( not ( = ?auto_61266545 ?auto_61266552 ) ) ( OBJ-AT ?auto_61266544 ?auto_61266545 ) ( not ( = ?auto_61266544 ?auto_61266550 ) ) ( OBJ-AT ?auto_61266550 ?auto_61266552 ) ( OBJ-AT ?auto_61266546 ?auto_61266545 ) ( OBJ-AT ?auto_61266547 ?auto_61266545 ) ( OBJ-AT ?auto_61266548 ?auto_61266545 ) ( OBJ-AT ?auto_61266549 ?auto_61266545 ) ( not ( = ?auto_61266544 ?auto_61266546 ) ) ( not ( = ?auto_61266544 ?auto_61266547 ) ) ( not ( = ?auto_61266544 ?auto_61266548 ) ) ( not ( = ?auto_61266544 ?auto_61266549 ) ) ( not ( = ?auto_61266546 ?auto_61266547 ) ) ( not ( = ?auto_61266546 ?auto_61266548 ) ) ( not ( = ?auto_61266546 ?auto_61266549 ) ) ( not ( = ?auto_61266546 ?auto_61266550 ) ) ( not ( = ?auto_61266547 ?auto_61266548 ) ) ( not ( = ?auto_61266547 ?auto_61266549 ) ) ( not ( = ?auto_61266547 ?auto_61266550 ) ) ( not ( = ?auto_61266548 ?auto_61266549 ) ) ( not ( = ?auto_61266548 ?auto_61266550 ) ) ( not ( = ?auto_61266549 ?auto_61266550 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_61266544 ?auto_61266550 ?auto_61266545 )
      ( DELIVER-6PKG-VERIFY ?auto_61266544 ?auto_61266546 ?auto_61266547 ?auto_61266548 ?auto_61266549 ?auto_61266550 ?auto_61266545 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_61638766 - OBJ
      ?auto_61638768 - OBJ
      ?auto_61638769 - OBJ
      ?auto_61638770 - OBJ
      ?auto_61638771 - OBJ
      ?auto_61638772 - OBJ
      ?auto_61638767 - LOCATION
    )
    :vars
    (
      ?auto_61638773 - LOCATION
      ?auto_61638775 - CITY
      ?auto_61638774 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_61638768 ?auto_61638766 ) ( GREATER-THAN ?auto_61638769 ?auto_61638766 ) ( GREATER-THAN ?auto_61638769 ?auto_61638768 ) ( GREATER-THAN ?auto_61638770 ?auto_61638766 ) ( GREATER-THAN ?auto_61638770 ?auto_61638768 ) ( GREATER-THAN ?auto_61638770 ?auto_61638769 ) ( GREATER-THAN ?auto_61638771 ?auto_61638766 ) ( GREATER-THAN ?auto_61638771 ?auto_61638768 ) ( GREATER-THAN ?auto_61638771 ?auto_61638769 ) ( GREATER-THAN ?auto_61638771 ?auto_61638770 ) ( GREATER-THAN ?auto_61638772 ?auto_61638766 ) ( GREATER-THAN ?auto_61638772 ?auto_61638768 ) ( GREATER-THAN ?auto_61638772 ?auto_61638769 ) ( GREATER-THAN ?auto_61638772 ?auto_61638770 ) ( GREATER-THAN ?auto_61638772 ?auto_61638771 ) ( IN-CITY ?auto_61638773 ?auto_61638775 ) ( IN-CITY ?auto_61638767 ?auto_61638775 ) ( not ( = ?auto_61638767 ?auto_61638773 ) ) ( OBJ-AT ?auto_61638766 ?auto_61638767 ) ( not ( = ?auto_61638766 ?auto_61638772 ) ) ( OBJ-AT ?auto_61638772 ?auto_61638773 ) ( TRUCK-AT ?auto_61638774 ?auto_61638767 ) ( OBJ-AT ?auto_61638768 ?auto_61638767 ) ( OBJ-AT ?auto_61638769 ?auto_61638767 ) ( OBJ-AT ?auto_61638770 ?auto_61638767 ) ( OBJ-AT ?auto_61638771 ?auto_61638767 ) ( not ( = ?auto_61638766 ?auto_61638768 ) ) ( not ( = ?auto_61638766 ?auto_61638769 ) ) ( not ( = ?auto_61638766 ?auto_61638770 ) ) ( not ( = ?auto_61638766 ?auto_61638771 ) ) ( not ( = ?auto_61638768 ?auto_61638769 ) ) ( not ( = ?auto_61638768 ?auto_61638770 ) ) ( not ( = ?auto_61638768 ?auto_61638771 ) ) ( not ( = ?auto_61638768 ?auto_61638772 ) ) ( not ( = ?auto_61638769 ?auto_61638770 ) ) ( not ( = ?auto_61638769 ?auto_61638771 ) ) ( not ( = ?auto_61638769 ?auto_61638772 ) ) ( not ( = ?auto_61638770 ?auto_61638771 ) ) ( not ( = ?auto_61638770 ?auto_61638772 ) ) ( not ( = ?auto_61638771 ?auto_61638772 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_61638766 ?auto_61638772 ?auto_61638767 )
      ( DELIVER-6PKG-VERIFY ?auto_61638766 ?auto_61638768 ?auto_61638769 ?auto_61638770 ?auto_61638771 ?auto_61638772 ?auto_61638767 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_62332363 - OBJ
      ?auto_62332365 - OBJ
      ?auto_62332366 - OBJ
      ?auto_62332367 - OBJ
      ?auto_62332368 - OBJ
      ?auto_62332364 - LOCATION
    )
    :vars
    (
      ?auto_62332371 - LOCATION
      ?auto_62332370 - CITY
      ?auto_62332369 - TRUCK
      ?auto_62332372 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_62332365 ?auto_62332363 ) ( GREATER-THAN ?auto_62332366 ?auto_62332363 ) ( GREATER-THAN ?auto_62332366 ?auto_62332365 ) ( GREATER-THAN ?auto_62332367 ?auto_62332363 ) ( GREATER-THAN ?auto_62332367 ?auto_62332365 ) ( GREATER-THAN ?auto_62332367 ?auto_62332366 ) ( GREATER-THAN ?auto_62332368 ?auto_62332363 ) ( GREATER-THAN ?auto_62332368 ?auto_62332365 ) ( GREATER-THAN ?auto_62332368 ?auto_62332366 ) ( GREATER-THAN ?auto_62332368 ?auto_62332367 ) ( IN-CITY ?auto_62332371 ?auto_62332370 ) ( IN-CITY ?auto_62332364 ?auto_62332370 ) ( not ( = ?auto_62332364 ?auto_62332371 ) ) ( OBJ-AT ?auto_62332363 ?auto_62332364 ) ( not ( = ?auto_62332363 ?auto_62332368 ) ) ( OBJ-AT ?auto_62332368 ?auto_62332371 ) ( TRUCK-AT ?auto_62332369 ?auto_62332372 ) ( IN-CITY ?auto_62332372 ?auto_62332370 ) ( not ( = ?auto_62332364 ?auto_62332372 ) ) ( not ( = ?auto_62332371 ?auto_62332372 ) ) ( OBJ-AT ?auto_62332365 ?auto_62332364 ) ( OBJ-AT ?auto_62332366 ?auto_62332364 ) ( OBJ-AT ?auto_62332367 ?auto_62332364 ) ( not ( = ?auto_62332363 ?auto_62332365 ) ) ( not ( = ?auto_62332363 ?auto_62332366 ) ) ( not ( = ?auto_62332363 ?auto_62332367 ) ) ( not ( = ?auto_62332365 ?auto_62332366 ) ) ( not ( = ?auto_62332365 ?auto_62332367 ) ) ( not ( = ?auto_62332365 ?auto_62332368 ) ) ( not ( = ?auto_62332366 ?auto_62332367 ) ) ( not ( = ?auto_62332366 ?auto_62332368 ) ) ( not ( = ?auto_62332367 ?auto_62332368 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_62332363 ?auto_62332368 ?auto_62332364 )
      ( DELIVER-5PKG-VERIFY ?auto_62332363 ?auto_62332365 ?auto_62332366 ?auto_62332367 ?auto_62332368 ?auto_62332364 ) )
  )

)

