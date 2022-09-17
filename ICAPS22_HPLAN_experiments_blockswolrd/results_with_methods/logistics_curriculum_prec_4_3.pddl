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

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_11128 - OBJ
      ?auto_11127 - LOCATION
    )
    :vars
    (
      ?auto_11130 - LOCATION
      ?auto_11131 - CITY
      ?auto_11129 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_11130 ?auto_11131 ) ( IN-CITY ?auto_11127 ?auto_11131 ) ( not ( = ?auto_11127 ?auto_11130 ) ) ( OBJ-AT ?auto_11128 ?auto_11130 ) ( TRUCK-AT ?auto_11129 ?auto_11127 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_11129 ?auto_11127 ?auto_11130 ?auto_11131 )
      ( !LOAD-TRUCK ?auto_11128 ?auto_11129 ?auto_11130 )
      ( !DRIVE-TRUCK ?auto_11129 ?auto_11130 ?auto_11127 ?auto_11131 )
      ( !UNLOAD-TRUCK ?auto_11128 ?auto_11129 ?auto_11127 )
      ( DELIVER-1PKG-VERIFY ?auto_11128 ?auto_11127 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_11135 - OBJ
      ?auto_11134 - LOCATION
    )
    :vars
    (
      ?auto_11137 - LOCATION
      ?auto_11138 - CITY
      ?auto_11136 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_11137 ?auto_11138 ) ( IN-CITY ?auto_11134 ?auto_11138 ) ( not ( = ?auto_11134 ?auto_11137 ) ) ( OBJ-AT ?auto_11135 ?auto_11137 ) ( TRUCK-AT ?auto_11136 ?auto_11134 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_11136 ?auto_11134 ?auto_11137 ?auto_11138 )
      ( !LOAD-TRUCK ?auto_11135 ?auto_11136 ?auto_11137 )
      ( !DRIVE-TRUCK ?auto_11136 ?auto_11137 ?auto_11134 ?auto_11138 )
      ( !UNLOAD-TRUCK ?auto_11135 ?auto_11136 ?auto_11134 )
      ( DELIVER-1PKG-VERIFY ?auto_11135 ?auto_11134 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_11149 - OBJ
      ?auto_11150 - OBJ
      ?auto_11148 - LOCATION
    )
    :vars
    (
      ?auto_11151 - LOCATION
      ?auto_11152 - CITY
      ?auto_11154 - LOCATION
      ?auto_11153 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_11151 ?auto_11152 ) ( IN-CITY ?auto_11148 ?auto_11152 ) ( not ( = ?auto_11148 ?auto_11151 ) ) ( OBJ-AT ?auto_11150 ?auto_11151 ) ( IN-CITY ?auto_11154 ?auto_11152 ) ( not ( = ?auto_11148 ?auto_11154 ) ) ( OBJ-AT ?auto_11149 ?auto_11154 ) ( TRUCK-AT ?auto_11153 ?auto_11148 ) ( not ( = ?auto_11149 ?auto_11150 ) ) ( not ( = ?auto_11151 ?auto_11154 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_11149 ?auto_11148 )
      ( DELIVER-1PKG ?auto_11150 ?auto_11148 )
      ( DELIVER-2PKG-VERIFY ?auto_11149 ?auto_11150 ?auto_11148 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_11156 - OBJ
      ?auto_11157 - OBJ
      ?auto_11155 - LOCATION
    )
    :vars
    (
      ?auto_11160 - LOCATION
      ?auto_11161 - CITY
      ?auto_11159 - LOCATION
      ?auto_11158 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_11160 ?auto_11161 ) ( IN-CITY ?auto_11155 ?auto_11161 ) ( not ( = ?auto_11155 ?auto_11160 ) ) ( OBJ-AT ?auto_11156 ?auto_11160 ) ( IN-CITY ?auto_11159 ?auto_11161 ) ( not ( = ?auto_11155 ?auto_11159 ) ) ( OBJ-AT ?auto_11157 ?auto_11159 ) ( TRUCK-AT ?auto_11158 ?auto_11155 ) ( not ( = ?auto_11157 ?auto_11156 ) ) ( not ( = ?auto_11160 ?auto_11159 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11157 ?auto_11156 ?auto_11155 )
      ( DELIVER-2PKG-VERIFY ?auto_11156 ?auto_11157 ?auto_11155 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_11173 - OBJ
      ?auto_11172 - LOCATION
    )
    :vars
    (
      ?auto_11175 - LOCATION
      ?auto_11176 - CITY
      ?auto_11174 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_11175 ?auto_11176 ) ( IN-CITY ?auto_11172 ?auto_11176 ) ( not ( = ?auto_11172 ?auto_11175 ) ) ( OBJ-AT ?auto_11173 ?auto_11175 ) ( TRUCK-AT ?auto_11174 ?auto_11172 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_11174 ?auto_11172 ?auto_11175 ?auto_11176 )
      ( !LOAD-TRUCK ?auto_11173 ?auto_11174 ?auto_11175 )
      ( !DRIVE-TRUCK ?auto_11174 ?auto_11175 ?auto_11172 ?auto_11176 )
      ( !UNLOAD-TRUCK ?auto_11173 ?auto_11174 ?auto_11172 )
      ( DELIVER-1PKG-VERIFY ?auto_11173 ?auto_11172 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_11263 - OBJ
      ?auto_11264 - OBJ
      ?auto_11265 - OBJ
      ?auto_11262 - LOCATION
    )
    :vars
    (
      ?auto_11268 - LOCATION
      ?auto_11267 - CITY
      ?auto_11269 - LOCATION
      ?auto_11266 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_11268 ?auto_11267 ) ( IN-CITY ?auto_11262 ?auto_11267 ) ( not ( = ?auto_11262 ?auto_11268 ) ) ( OBJ-AT ?auto_11265 ?auto_11268 ) ( IN-CITY ?auto_11269 ?auto_11267 ) ( not ( = ?auto_11262 ?auto_11269 ) ) ( OBJ-AT ?auto_11264 ?auto_11269 ) ( OBJ-AT ?auto_11263 ?auto_11268 ) ( TRUCK-AT ?auto_11266 ?auto_11262 ) ( not ( = ?auto_11263 ?auto_11264 ) ) ( not ( = ?auto_11269 ?auto_11268 ) ) ( not ( = ?auto_11263 ?auto_11265 ) ) ( not ( = ?auto_11264 ?auto_11265 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11264 ?auto_11263 ?auto_11262 )
      ( DELIVER-1PKG ?auto_11265 ?auto_11262 )
      ( DELIVER-3PKG-VERIFY ?auto_11263 ?auto_11264 ?auto_11265 ?auto_11262 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_11280 - OBJ
      ?auto_11281 - OBJ
      ?auto_11282 - OBJ
      ?auto_11279 - LOCATION
    )
    :vars
    (
      ?auto_11286 - LOCATION
      ?auto_11283 - CITY
      ?auto_11285 - LOCATION
      ?auto_11284 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_11286 ?auto_11283 ) ( IN-CITY ?auto_11279 ?auto_11283 ) ( not ( = ?auto_11279 ?auto_11286 ) ) ( OBJ-AT ?auto_11281 ?auto_11286 ) ( IN-CITY ?auto_11285 ?auto_11283 ) ( not ( = ?auto_11279 ?auto_11285 ) ) ( OBJ-AT ?auto_11282 ?auto_11285 ) ( OBJ-AT ?auto_11280 ?auto_11286 ) ( TRUCK-AT ?auto_11284 ?auto_11279 ) ( not ( = ?auto_11280 ?auto_11282 ) ) ( not ( = ?auto_11285 ?auto_11286 ) ) ( not ( = ?auto_11280 ?auto_11281 ) ) ( not ( = ?auto_11282 ?auto_11281 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_11280 ?auto_11282 ?auto_11281 ?auto_11279 )
      ( DELIVER-3PKG-VERIFY ?auto_11280 ?auto_11281 ?auto_11282 ?auto_11279 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_11297 - OBJ
      ?auto_11298 - OBJ
      ?auto_11299 - OBJ
      ?auto_11296 - LOCATION
    )
    :vars
    (
      ?auto_11302 - LOCATION
      ?auto_11301 - CITY
      ?auto_11300 - LOCATION
      ?auto_11303 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_11302 ?auto_11301 ) ( IN-CITY ?auto_11296 ?auto_11301 ) ( not ( = ?auto_11296 ?auto_11302 ) ) ( OBJ-AT ?auto_11299 ?auto_11302 ) ( IN-CITY ?auto_11300 ?auto_11301 ) ( not ( = ?auto_11296 ?auto_11300 ) ) ( OBJ-AT ?auto_11297 ?auto_11300 ) ( OBJ-AT ?auto_11298 ?auto_11302 ) ( TRUCK-AT ?auto_11303 ?auto_11296 ) ( not ( = ?auto_11298 ?auto_11297 ) ) ( not ( = ?auto_11300 ?auto_11302 ) ) ( not ( = ?auto_11298 ?auto_11299 ) ) ( not ( = ?auto_11297 ?auto_11299 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_11298 ?auto_11299 ?auto_11297 ?auto_11296 )
      ( DELIVER-3PKG-VERIFY ?auto_11297 ?auto_11298 ?auto_11299 ?auto_11296 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_11314 - OBJ
      ?auto_11315 - OBJ
      ?auto_11316 - OBJ
      ?auto_11313 - LOCATION
    )
    :vars
    (
      ?auto_11319 - LOCATION
      ?auto_11318 - CITY
      ?auto_11317 - LOCATION
      ?auto_11320 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_11319 ?auto_11318 ) ( IN-CITY ?auto_11313 ?auto_11318 ) ( not ( = ?auto_11313 ?auto_11319 ) ) ( OBJ-AT ?auto_11315 ?auto_11319 ) ( IN-CITY ?auto_11317 ?auto_11318 ) ( not ( = ?auto_11313 ?auto_11317 ) ) ( OBJ-AT ?auto_11314 ?auto_11317 ) ( OBJ-AT ?auto_11316 ?auto_11319 ) ( TRUCK-AT ?auto_11320 ?auto_11313 ) ( not ( = ?auto_11316 ?auto_11314 ) ) ( not ( = ?auto_11317 ?auto_11319 ) ) ( not ( = ?auto_11316 ?auto_11315 ) ) ( not ( = ?auto_11314 ?auto_11315 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_11316 ?auto_11315 ?auto_11314 ?auto_11313 )
      ( DELIVER-3PKG-VERIFY ?auto_11314 ?auto_11315 ?auto_11316 ?auto_11313 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_11349 - OBJ
      ?auto_11350 - OBJ
      ?auto_11351 - OBJ
      ?auto_11348 - LOCATION
    )
    :vars
    (
      ?auto_11354 - LOCATION
      ?auto_11353 - CITY
      ?auto_11352 - LOCATION
      ?auto_11355 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_11354 ?auto_11353 ) ( IN-CITY ?auto_11348 ?auto_11353 ) ( not ( = ?auto_11348 ?auto_11354 ) ) ( OBJ-AT ?auto_11349 ?auto_11354 ) ( IN-CITY ?auto_11352 ?auto_11353 ) ( not ( = ?auto_11348 ?auto_11352 ) ) ( OBJ-AT ?auto_11351 ?auto_11352 ) ( OBJ-AT ?auto_11350 ?auto_11354 ) ( TRUCK-AT ?auto_11355 ?auto_11348 ) ( not ( = ?auto_11350 ?auto_11351 ) ) ( not ( = ?auto_11352 ?auto_11354 ) ) ( not ( = ?auto_11350 ?auto_11349 ) ) ( not ( = ?auto_11351 ?auto_11349 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_11350 ?auto_11349 ?auto_11351 ?auto_11348 )
      ( DELIVER-3PKG-VERIFY ?auto_11349 ?auto_11350 ?auto_11351 ?auto_11348 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_11366 - OBJ
      ?auto_11367 - OBJ
      ?auto_11368 - OBJ
      ?auto_11365 - LOCATION
    )
    :vars
    (
      ?auto_11371 - LOCATION
      ?auto_11370 - CITY
      ?auto_11369 - LOCATION
      ?auto_11372 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_11371 ?auto_11370 ) ( IN-CITY ?auto_11365 ?auto_11370 ) ( not ( = ?auto_11365 ?auto_11371 ) ) ( OBJ-AT ?auto_11366 ?auto_11371 ) ( IN-CITY ?auto_11369 ?auto_11370 ) ( not ( = ?auto_11365 ?auto_11369 ) ) ( OBJ-AT ?auto_11367 ?auto_11369 ) ( OBJ-AT ?auto_11368 ?auto_11371 ) ( TRUCK-AT ?auto_11372 ?auto_11365 ) ( not ( = ?auto_11368 ?auto_11367 ) ) ( not ( = ?auto_11369 ?auto_11371 ) ) ( not ( = ?auto_11368 ?auto_11366 ) ) ( not ( = ?auto_11367 ?auto_11366 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_11368 ?auto_11366 ?auto_11367 ?auto_11365 )
      ( DELIVER-3PKG-VERIFY ?auto_11366 ?auto_11367 ?auto_11368 ?auto_11365 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_11422 - OBJ
      ?auto_11421 - LOCATION
    )
    :vars
    (
      ?auto_11424 - LOCATION
      ?auto_11425 - CITY
      ?auto_11423 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_11424 ?auto_11425 ) ( IN-CITY ?auto_11421 ?auto_11425 ) ( not ( = ?auto_11421 ?auto_11424 ) ) ( OBJ-AT ?auto_11422 ?auto_11424 ) ( TRUCK-AT ?auto_11423 ?auto_11421 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_11423 ?auto_11421 ?auto_11424 ?auto_11425 )
      ( !LOAD-TRUCK ?auto_11422 ?auto_11423 ?auto_11424 )
      ( !DRIVE-TRUCK ?auto_11423 ?auto_11424 ?auto_11421 ?auto_11425 )
      ( !UNLOAD-TRUCK ?auto_11422 ?auto_11423 ?auto_11421 )
      ( DELIVER-1PKG-VERIFY ?auto_11422 ?auto_11421 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_12395 - OBJ
      ?auto_12396 - OBJ
      ?auto_12397 - OBJ
      ?auto_12398 - OBJ
      ?auto_12394 - LOCATION
    )
    :vars
    (
      ?auto_12400 - LOCATION
      ?auto_12399 - CITY
      ?auto_12402 - LOCATION
      ?auto_12401 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12400 ?auto_12399 ) ( IN-CITY ?auto_12394 ?auto_12399 ) ( not ( = ?auto_12394 ?auto_12400 ) ) ( OBJ-AT ?auto_12398 ?auto_12400 ) ( IN-CITY ?auto_12402 ?auto_12399 ) ( not ( = ?auto_12394 ?auto_12402 ) ) ( OBJ-AT ?auto_12397 ?auto_12402 ) ( OBJ-AT ?auto_12396 ?auto_12400 ) ( OBJ-AT ?auto_12395 ?auto_12402 ) ( TRUCK-AT ?auto_12401 ?auto_12394 ) ( not ( = ?auto_12395 ?auto_12396 ) ) ( not ( = ?auto_12400 ?auto_12402 ) ) ( not ( = ?auto_12395 ?auto_12397 ) ) ( not ( = ?auto_12396 ?auto_12397 ) ) ( not ( = ?auto_12395 ?auto_12398 ) ) ( not ( = ?auto_12396 ?auto_12398 ) ) ( not ( = ?auto_12397 ?auto_12398 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_12395 ?auto_12397 ?auto_12396 ?auto_12394 )
      ( DELIVER-1PKG ?auto_12398 ?auto_12394 )
      ( DELIVER-4PKG-VERIFY ?auto_12395 ?auto_12396 ?auto_12397 ?auto_12398 ?auto_12394 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_12424 - OBJ
      ?auto_12425 - OBJ
      ?auto_12426 - OBJ
      ?auto_12427 - OBJ
      ?auto_12423 - LOCATION
    )
    :vars
    (
      ?auto_12428 - LOCATION
      ?auto_12431 - CITY
      ?auto_12429 - LOCATION
      ?auto_12430 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12428 ?auto_12431 ) ( IN-CITY ?auto_12423 ?auto_12431 ) ( not ( = ?auto_12423 ?auto_12428 ) ) ( OBJ-AT ?auto_12426 ?auto_12428 ) ( IN-CITY ?auto_12429 ?auto_12431 ) ( not ( = ?auto_12423 ?auto_12429 ) ) ( OBJ-AT ?auto_12427 ?auto_12429 ) ( OBJ-AT ?auto_12425 ?auto_12428 ) ( OBJ-AT ?auto_12424 ?auto_12429 ) ( TRUCK-AT ?auto_12430 ?auto_12423 ) ( not ( = ?auto_12424 ?auto_12425 ) ) ( not ( = ?auto_12428 ?auto_12429 ) ) ( not ( = ?auto_12424 ?auto_12427 ) ) ( not ( = ?auto_12425 ?auto_12427 ) ) ( not ( = ?auto_12424 ?auto_12426 ) ) ( not ( = ?auto_12425 ?auto_12426 ) ) ( not ( = ?auto_12427 ?auto_12426 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_12424 ?auto_12425 ?auto_12427 ?auto_12426 ?auto_12423 )
      ( DELIVER-4PKG-VERIFY ?auto_12424 ?auto_12425 ?auto_12426 ?auto_12427 ?auto_12423 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_12453 - OBJ
      ?auto_12454 - OBJ
      ?auto_12455 - OBJ
      ?auto_12456 - OBJ
      ?auto_12452 - LOCATION
    )
    :vars
    (
      ?auto_12457 - LOCATION
      ?auto_12460 - CITY
      ?auto_12458 - LOCATION
      ?auto_12459 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12457 ?auto_12460 ) ( IN-CITY ?auto_12452 ?auto_12460 ) ( not ( = ?auto_12452 ?auto_12457 ) ) ( OBJ-AT ?auto_12456 ?auto_12457 ) ( IN-CITY ?auto_12458 ?auto_12460 ) ( not ( = ?auto_12452 ?auto_12458 ) ) ( OBJ-AT ?auto_12454 ?auto_12458 ) ( OBJ-AT ?auto_12455 ?auto_12457 ) ( OBJ-AT ?auto_12453 ?auto_12458 ) ( TRUCK-AT ?auto_12459 ?auto_12452 ) ( not ( = ?auto_12453 ?auto_12455 ) ) ( not ( = ?auto_12457 ?auto_12458 ) ) ( not ( = ?auto_12453 ?auto_12454 ) ) ( not ( = ?auto_12455 ?auto_12454 ) ) ( not ( = ?auto_12453 ?auto_12456 ) ) ( not ( = ?auto_12455 ?auto_12456 ) ) ( not ( = ?auto_12454 ?auto_12456 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_12453 ?auto_12455 ?auto_12456 ?auto_12454 ?auto_12452 )
      ( DELIVER-4PKG-VERIFY ?auto_12453 ?auto_12454 ?auto_12455 ?auto_12456 ?auto_12452 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_12482 - OBJ
      ?auto_12483 - OBJ
      ?auto_12484 - OBJ
      ?auto_12485 - OBJ
      ?auto_12481 - LOCATION
    )
    :vars
    (
      ?auto_12486 - LOCATION
      ?auto_12489 - CITY
      ?auto_12487 - LOCATION
      ?auto_12488 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12486 ?auto_12489 ) ( IN-CITY ?auto_12481 ?auto_12489 ) ( not ( = ?auto_12481 ?auto_12486 ) ) ( OBJ-AT ?auto_12484 ?auto_12486 ) ( IN-CITY ?auto_12487 ?auto_12489 ) ( not ( = ?auto_12481 ?auto_12487 ) ) ( OBJ-AT ?auto_12483 ?auto_12487 ) ( OBJ-AT ?auto_12485 ?auto_12486 ) ( OBJ-AT ?auto_12482 ?auto_12487 ) ( TRUCK-AT ?auto_12488 ?auto_12481 ) ( not ( = ?auto_12482 ?auto_12485 ) ) ( not ( = ?auto_12486 ?auto_12487 ) ) ( not ( = ?auto_12482 ?auto_12483 ) ) ( not ( = ?auto_12485 ?auto_12483 ) ) ( not ( = ?auto_12482 ?auto_12484 ) ) ( not ( = ?auto_12485 ?auto_12484 ) ) ( not ( = ?auto_12483 ?auto_12484 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_12482 ?auto_12485 ?auto_12484 ?auto_12483 ?auto_12481 )
      ( DELIVER-4PKG-VERIFY ?auto_12482 ?auto_12483 ?auto_12484 ?auto_12485 ?auto_12481 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_12573 - OBJ
      ?auto_12574 - OBJ
      ?auto_12575 - OBJ
      ?auto_12576 - OBJ
      ?auto_12572 - LOCATION
    )
    :vars
    (
      ?auto_12577 - LOCATION
      ?auto_12580 - CITY
      ?auto_12578 - LOCATION
      ?auto_12579 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12577 ?auto_12580 ) ( IN-CITY ?auto_12572 ?auto_12580 ) ( not ( = ?auto_12572 ?auto_12577 ) ) ( OBJ-AT ?auto_12574 ?auto_12577 ) ( IN-CITY ?auto_12578 ?auto_12580 ) ( not ( = ?auto_12572 ?auto_12578 ) ) ( OBJ-AT ?auto_12576 ?auto_12578 ) ( OBJ-AT ?auto_12575 ?auto_12577 ) ( OBJ-AT ?auto_12573 ?auto_12578 ) ( TRUCK-AT ?auto_12579 ?auto_12572 ) ( not ( = ?auto_12573 ?auto_12575 ) ) ( not ( = ?auto_12577 ?auto_12578 ) ) ( not ( = ?auto_12573 ?auto_12576 ) ) ( not ( = ?auto_12575 ?auto_12576 ) ) ( not ( = ?auto_12573 ?auto_12574 ) ) ( not ( = ?auto_12575 ?auto_12574 ) ) ( not ( = ?auto_12576 ?auto_12574 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_12573 ?auto_12575 ?auto_12574 ?auto_12576 ?auto_12572 )
      ( DELIVER-4PKG-VERIFY ?auto_12573 ?auto_12574 ?auto_12575 ?auto_12576 ?auto_12572 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_12602 - OBJ
      ?auto_12603 - OBJ
      ?auto_12604 - OBJ
      ?auto_12605 - OBJ
      ?auto_12601 - LOCATION
    )
    :vars
    (
      ?auto_12606 - LOCATION
      ?auto_12609 - CITY
      ?auto_12607 - LOCATION
      ?auto_12608 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12606 ?auto_12609 ) ( IN-CITY ?auto_12601 ?auto_12609 ) ( not ( = ?auto_12601 ?auto_12606 ) ) ( OBJ-AT ?auto_12603 ?auto_12606 ) ( IN-CITY ?auto_12607 ?auto_12609 ) ( not ( = ?auto_12601 ?auto_12607 ) ) ( OBJ-AT ?auto_12604 ?auto_12607 ) ( OBJ-AT ?auto_12605 ?auto_12606 ) ( OBJ-AT ?auto_12602 ?auto_12607 ) ( TRUCK-AT ?auto_12608 ?auto_12601 ) ( not ( = ?auto_12602 ?auto_12605 ) ) ( not ( = ?auto_12606 ?auto_12607 ) ) ( not ( = ?auto_12602 ?auto_12604 ) ) ( not ( = ?auto_12605 ?auto_12604 ) ) ( not ( = ?auto_12602 ?auto_12603 ) ) ( not ( = ?auto_12605 ?auto_12603 ) ) ( not ( = ?auto_12604 ?auto_12603 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_12602 ?auto_12605 ?auto_12603 ?auto_12604 ?auto_12601 )
      ( DELIVER-4PKG-VERIFY ?auto_12602 ?auto_12603 ?auto_12604 ?auto_12605 ?auto_12601 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_12693 - OBJ
      ?auto_12694 - OBJ
      ?auto_12695 - OBJ
      ?auto_12696 - OBJ
      ?auto_12692 - LOCATION
    )
    :vars
    (
      ?auto_12697 - LOCATION
      ?auto_12700 - CITY
      ?auto_12698 - LOCATION
      ?auto_12699 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12697 ?auto_12700 ) ( IN-CITY ?auto_12692 ?auto_12700 ) ( not ( = ?auto_12692 ?auto_12697 ) ) ( OBJ-AT ?auto_12696 ?auto_12697 ) ( IN-CITY ?auto_12698 ?auto_12700 ) ( not ( = ?auto_12692 ?auto_12698 ) ) ( OBJ-AT ?auto_12695 ?auto_12698 ) ( OBJ-AT ?auto_12693 ?auto_12697 ) ( OBJ-AT ?auto_12694 ?auto_12698 ) ( TRUCK-AT ?auto_12699 ?auto_12692 ) ( not ( = ?auto_12694 ?auto_12693 ) ) ( not ( = ?auto_12697 ?auto_12698 ) ) ( not ( = ?auto_12694 ?auto_12695 ) ) ( not ( = ?auto_12693 ?auto_12695 ) ) ( not ( = ?auto_12694 ?auto_12696 ) ) ( not ( = ?auto_12693 ?auto_12696 ) ) ( not ( = ?auto_12695 ?auto_12696 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_12694 ?auto_12693 ?auto_12696 ?auto_12695 ?auto_12692 )
      ( DELIVER-4PKG-VERIFY ?auto_12693 ?auto_12694 ?auto_12695 ?auto_12696 ?auto_12692 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_12722 - OBJ
      ?auto_12723 - OBJ
      ?auto_12724 - OBJ
      ?auto_12725 - OBJ
      ?auto_12721 - LOCATION
    )
    :vars
    (
      ?auto_12726 - LOCATION
      ?auto_12729 - CITY
      ?auto_12727 - LOCATION
      ?auto_12728 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12726 ?auto_12729 ) ( IN-CITY ?auto_12721 ?auto_12729 ) ( not ( = ?auto_12721 ?auto_12726 ) ) ( OBJ-AT ?auto_12724 ?auto_12726 ) ( IN-CITY ?auto_12727 ?auto_12729 ) ( not ( = ?auto_12721 ?auto_12727 ) ) ( OBJ-AT ?auto_12725 ?auto_12727 ) ( OBJ-AT ?auto_12722 ?auto_12726 ) ( OBJ-AT ?auto_12723 ?auto_12727 ) ( TRUCK-AT ?auto_12728 ?auto_12721 ) ( not ( = ?auto_12723 ?auto_12722 ) ) ( not ( = ?auto_12726 ?auto_12727 ) ) ( not ( = ?auto_12723 ?auto_12725 ) ) ( not ( = ?auto_12722 ?auto_12725 ) ) ( not ( = ?auto_12723 ?auto_12724 ) ) ( not ( = ?auto_12722 ?auto_12724 ) ) ( not ( = ?auto_12725 ?auto_12724 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_12723 ?auto_12722 ?auto_12724 ?auto_12725 ?auto_12721 )
      ( DELIVER-4PKG-VERIFY ?auto_12722 ?auto_12723 ?auto_12724 ?auto_12725 ?auto_12721 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_12814 - OBJ
      ?auto_12815 - OBJ
      ?auto_12816 - OBJ
      ?auto_12817 - OBJ
      ?auto_12813 - LOCATION
    )
    :vars
    (
      ?auto_12818 - LOCATION
      ?auto_12821 - CITY
      ?auto_12819 - LOCATION
      ?auto_12820 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12818 ?auto_12821 ) ( IN-CITY ?auto_12813 ?auto_12821 ) ( not ( = ?auto_12813 ?auto_12818 ) ) ( OBJ-AT ?auto_12817 ?auto_12818 ) ( IN-CITY ?auto_12819 ?auto_12821 ) ( not ( = ?auto_12813 ?auto_12819 ) ) ( OBJ-AT ?auto_12815 ?auto_12819 ) ( OBJ-AT ?auto_12814 ?auto_12818 ) ( OBJ-AT ?auto_12816 ?auto_12819 ) ( TRUCK-AT ?auto_12820 ?auto_12813 ) ( not ( = ?auto_12816 ?auto_12814 ) ) ( not ( = ?auto_12818 ?auto_12819 ) ) ( not ( = ?auto_12816 ?auto_12815 ) ) ( not ( = ?auto_12814 ?auto_12815 ) ) ( not ( = ?auto_12816 ?auto_12817 ) ) ( not ( = ?auto_12814 ?auto_12817 ) ) ( not ( = ?auto_12815 ?auto_12817 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_12816 ?auto_12814 ?auto_12817 ?auto_12815 ?auto_12813 )
      ( DELIVER-4PKG-VERIFY ?auto_12814 ?auto_12815 ?auto_12816 ?auto_12817 ?auto_12813 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_12843 - OBJ
      ?auto_12844 - OBJ
      ?auto_12845 - OBJ
      ?auto_12846 - OBJ
      ?auto_12842 - LOCATION
    )
    :vars
    (
      ?auto_12847 - LOCATION
      ?auto_12850 - CITY
      ?auto_12848 - LOCATION
      ?auto_12849 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12847 ?auto_12850 ) ( IN-CITY ?auto_12842 ?auto_12850 ) ( not ( = ?auto_12842 ?auto_12847 ) ) ( OBJ-AT ?auto_12845 ?auto_12847 ) ( IN-CITY ?auto_12848 ?auto_12850 ) ( not ( = ?auto_12842 ?auto_12848 ) ) ( OBJ-AT ?auto_12844 ?auto_12848 ) ( OBJ-AT ?auto_12843 ?auto_12847 ) ( OBJ-AT ?auto_12846 ?auto_12848 ) ( TRUCK-AT ?auto_12849 ?auto_12842 ) ( not ( = ?auto_12846 ?auto_12843 ) ) ( not ( = ?auto_12847 ?auto_12848 ) ) ( not ( = ?auto_12846 ?auto_12844 ) ) ( not ( = ?auto_12843 ?auto_12844 ) ) ( not ( = ?auto_12846 ?auto_12845 ) ) ( not ( = ?auto_12843 ?auto_12845 ) ) ( not ( = ?auto_12844 ?auto_12845 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_12846 ?auto_12843 ?auto_12845 ?auto_12844 ?auto_12842 )
      ( DELIVER-4PKG-VERIFY ?auto_12843 ?auto_12844 ?auto_12845 ?auto_12846 ?auto_12842 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_12902 - OBJ
      ?auto_12903 - OBJ
      ?auto_12904 - OBJ
      ?auto_12905 - OBJ
      ?auto_12901 - LOCATION
    )
    :vars
    (
      ?auto_12906 - LOCATION
      ?auto_12909 - CITY
      ?auto_12907 - LOCATION
      ?auto_12908 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12906 ?auto_12909 ) ( IN-CITY ?auto_12901 ?auto_12909 ) ( not ( = ?auto_12901 ?auto_12906 ) ) ( OBJ-AT ?auto_12903 ?auto_12906 ) ( IN-CITY ?auto_12907 ?auto_12909 ) ( not ( = ?auto_12901 ?auto_12907 ) ) ( OBJ-AT ?auto_12905 ?auto_12907 ) ( OBJ-AT ?auto_12902 ?auto_12906 ) ( OBJ-AT ?auto_12904 ?auto_12907 ) ( TRUCK-AT ?auto_12908 ?auto_12901 ) ( not ( = ?auto_12904 ?auto_12902 ) ) ( not ( = ?auto_12906 ?auto_12907 ) ) ( not ( = ?auto_12904 ?auto_12905 ) ) ( not ( = ?auto_12902 ?auto_12905 ) ) ( not ( = ?auto_12904 ?auto_12903 ) ) ( not ( = ?auto_12902 ?auto_12903 ) ) ( not ( = ?auto_12905 ?auto_12903 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_12904 ?auto_12902 ?auto_12903 ?auto_12905 ?auto_12901 )
      ( DELIVER-4PKG-VERIFY ?auto_12902 ?auto_12903 ?auto_12904 ?auto_12905 ?auto_12901 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_12963 - OBJ
      ?auto_12964 - OBJ
      ?auto_12965 - OBJ
      ?auto_12966 - OBJ
      ?auto_12962 - LOCATION
    )
    :vars
    (
      ?auto_12967 - LOCATION
      ?auto_12970 - CITY
      ?auto_12968 - LOCATION
      ?auto_12969 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12967 ?auto_12970 ) ( IN-CITY ?auto_12962 ?auto_12970 ) ( not ( = ?auto_12962 ?auto_12967 ) ) ( OBJ-AT ?auto_12964 ?auto_12967 ) ( IN-CITY ?auto_12968 ?auto_12970 ) ( not ( = ?auto_12962 ?auto_12968 ) ) ( OBJ-AT ?auto_12965 ?auto_12968 ) ( OBJ-AT ?auto_12963 ?auto_12967 ) ( OBJ-AT ?auto_12966 ?auto_12968 ) ( TRUCK-AT ?auto_12969 ?auto_12962 ) ( not ( = ?auto_12966 ?auto_12963 ) ) ( not ( = ?auto_12967 ?auto_12968 ) ) ( not ( = ?auto_12966 ?auto_12965 ) ) ( not ( = ?auto_12963 ?auto_12965 ) ) ( not ( = ?auto_12966 ?auto_12964 ) ) ( not ( = ?auto_12963 ?auto_12964 ) ) ( not ( = ?auto_12965 ?auto_12964 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_12966 ?auto_12963 ?auto_12964 ?auto_12965 ?auto_12962 )
      ( DELIVER-4PKG-VERIFY ?auto_12963 ?auto_12964 ?auto_12965 ?auto_12966 ?auto_12962 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_13054 - OBJ
      ?auto_13055 - OBJ
      ?auto_13056 - OBJ
      ?auto_13057 - OBJ
      ?auto_13053 - LOCATION
    )
    :vars
    (
      ?auto_13058 - LOCATION
      ?auto_13061 - CITY
      ?auto_13059 - LOCATION
      ?auto_13060 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13058 ?auto_13061 ) ( IN-CITY ?auto_13053 ?auto_13061 ) ( not ( = ?auto_13053 ?auto_13058 ) ) ( OBJ-AT ?auto_13057 ?auto_13058 ) ( IN-CITY ?auto_13059 ?auto_13061 ) ( not ( = ?auto_13053 ?auto_13059 ) ) ( OBJ-AT ?auto_13054 ?auto_13059 ) ( OBJ-AT ?auto_13056 ?auto_13058 ) ( OBJ-AT ?auto_13055 ?auto_13059 ) ( TRUCK-AT ?auto_13060 ?auto_13053 ) ( not ( = ?auto_13055 ?auto_13056 ) ) ( not ( = ?auto_13058 ?auto_13059 ) ) ( not ( = ?auto_13055 ?auto_13054 ) ) ( not ( = ?auto_13056 ?auto_13054 ) ) ( not ( = ?auto_13055 ?auto_13057 ) ) ( not ( = ?auto_13056 ?auto_13057 ) ) ( not ( = ?auto_13054 ?auto_13057 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_13055 ?auto_13056 ?auto_13057 ?auto_13054 ?auto_13053 )
      ( DELIVER-4PKG-VERIFY ?auto_13054 ?auto_13055 ?auto_13056 ?auto_13057 ?auto_13053 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_13083 - OBJ
      ?auto_13084 - OBJ
      ?auto_13085 - OBJ
      ?auto_13086 - OBJ
      ?auto_13082 - LOCATION
    )
    :vars
    (
      ?auto_13087 - LOCATION
      ?auto_13090 - CITY
      ?auto_13088 - LOCATION
      ?auto_13089 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13087 ?auto_13090 ) ( IN-CITY ?auto_13082 ?auto_13090 ) ( not ( = ?auto_13082 ?auto_13087 ) ) ( OBJ-AT ?auto_13085 ?auto_13087 ) ( IN-CITY ?auto_13088 ?auto_13090 ) ( not ( = ?auto_13082 ?auto_13088 ) ) ( OBJ-AT ?auto_13083 ?auto_13088 ) ( OBJ-AT ?auto_13086 ?auto_13087 ) ( OBJ-AT ?auto_13084 ?auto_13088 ) ( TRUCK-AT ?auto_13089 ?auto_13082 ) ( not ( = ?auto_13084 ?auto_13086 ) ) ( not ( = ?auto_13087 ?auto_13088 ) ) ( not ( = ?auto_13084 ?auto_13083 ) ) ( not ( = ?auto_13086 ?auto_13083 ) ) ( not ( = ?auto_13084 ?auto_13085 ) ) ( not ( = ?auto_13086 ?auto_13085 ) ) ( not ( = ?auto_13083 ?auto_13085 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_13084 ?auto_13086 ?auto_13085 ?auto_13083 ?auto_13082 )
      ( DELIVER-4PKG-VERIFY ?auto_13083 ?auto_13084 ?auto_13085 ?auto_13086 ?auto_13082 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_13112 - OBJ
      ?auto_13113 - OBJ
      ?auto_13114 - OBJ
      ?auto_13115 - OBJ
      ?auto_13111 - LOCATION
    )
    :vars
    (
      ?auto_13116 - LOCATION
      ?auto_13119 - CITY
      ?auto_13117 - LOCATION
      ?auto_13118 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13116 ?auto_13119 ) ( IN-CITY ?auto_13111 ?auto_13119 ) ( not ( = ?auto_13111 ?auto_13116 ) ) ( OBJ-AT ?auto_13115 ?auto_13116 ) ( IN-CITY ?auto_13117 ?auto_13119 ) ( not ( = ?auto_13111 ?auto_13117 ) ) ( OBJ-AT ?auto_13112 ?auto_13117 ) ( OBJ-AT ?auto_13113 ?auto_13116 ) ( OBJ-AT ?auto_13114 ?auto_13117 ) ( TRUCK-AT ?auto_13118 ?auto_13111 ) ( not ( = ?auto_13114 ?auto_13113 ) ) ( not ( = ?auto_13116 ?auto_13117 ) ) ( not ( = ?auto_13114 ?auto_13112 ) ) ( not ( = ?auto_13113 ?auto_13112 ) ) ( not ( = ?auto_13114 ?auto_13115 ) ) ( not ( = ?auto_13113 ?auto_13115 ) ) ( not ( = ?auto_13112 ?auto_13115 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_13114 ?auto_13113 ?auto_13115 ?auto_13112 ?auto_13111 )
      ( DELIVER-4PKG-VERIFY ?auto_13112 ?auto_13113 ?auto_13114 ?auto_13115 ?auto_13111 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_13141 - OBJ
      ?auto_13142 - OBJ
      ?auto_13143 - OBJ
      ?auto_13144 - OBJ
      ?auto_13140 - LOCATION
    )
    :vars
    (
      ?auto_13145 - LOCATION
      ?auto_13148 - CITY
      ?auto_13146 - LOCATION
      ?auto_13147 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13145 ?auto_13148 ) ( IN-CITY ?auto_13140 ?auto_13148 ) ( not ( = ?auto_13140 ?auto_13145 ) ) ( OBJ-AT ?auto_13143 ?auto_13145 ) ( IN-CITY ?auto_13146 ?auto_13148 ) ( not ( = ?auto_13140 ?auto_13146 ) ) ( OBJ-AT ?auto_13141 ?auto_13146 ) ( OBJ-AT ?auto_13142 ?auto_13145 ) ( OBJ-AT ?auto_13144 ?auto_13146 ) ( TRUCK-AT ?auto_13147 ?auto_13140 ) ( not ( = ?auto_13144 ?auto_13142 ) ) ( not ( = ?auto_13145 ?auto_13146 ) ) ( not ( = ?auto_13144 ?auto_13141 ) ) ( not ( = ?auto_13142 ?auto_13141 ) ) ( not ( = ?auto_13144 ?auto_13143 ) ) ( not ( = ?auto_13142 ?auto_13143 ) ) ( not ( = ?auto_13141 ?auto_13143 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_13144 ?auto_13142 ?auto_13143 ?auto_13141 ?auto_13140 )
      ( DELIVER-4PKG-VERIFY ?auto_13141 ?auto_13142 ?auto_13143 ?auto_13144 ?auto_13140 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_13263 - OBJ
      ?auto_13264 - OBJ
      ?auto_13265 - OBJ
      ?auto_13266 - OBJ
      ?auto_13262 - LOCATION
    )
    :vars
    (
      ?auto_13267 - LOCATION
      ?auto_13270 - CITY
      ?auto_13268 - LOCATION
      ?auto_13269 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13267 ?auto_13270 ) ( IN-CITY ?auto_13262 ?auto_13270 ) ( not ( = ?auto_13262 ?auto_13267 ) ) ( OBJ-AT ?auto_13264 ?auto_13267 ) ( IN-CITY ?auto_13268 ?auto_13270 ) ( not ( = ?auto_13262 ?auto_13268 ) ) ( OBJ-AT ?auto_13263 ?auto_13268 ) ( OBJ-AT ?auto_13266 ?auto_13267 ) ( OBJ-AT ?auto_13265 ?auto_13268 ) ( TRUCK-AT ?auto_13269 ?auto_13262 ) ( not ( = ?auto_13265 ?auto_13266 ) ) ( not ( = ?auto_13267 ?auto_13268 ) ) ( not ( = ?auto_13265 ?auto_13263 ) ) ( not ( = ?auto_13266 ?auto_13263 ) ) ( not ( = ?auto_13265 ?auto_13264 ) ) ( not ( = ?auto_13266 ?auto_13264 ) ) ( not ( = ?auto_13263 ?auto_13264 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_13265 ?auto_13266 ?auto_13264 ?auto_13263 ?auto_13262 )
      ( DELIVER-4PKG-VERIFY ?auto_13263 ?auto_13264 ?auto_13265 ?auto_13266 ?auto_13262 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_13292 - OBJ
      ?auto_13293 - OBJ
      ?auto_13294 - OBJ
      ?auto_13295 - OBJ
      ?auto_13291 - LOCATION
    )
    :vars
    (
      ?auto_13296 - LOCATION
      ?auto_13299 - CITY
      ?auto_13297 - LOCATION
      ?auto_13298 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13296 ?auto_13299 ) ( IN-CITY ?auto_13291 ?auto_13299 ) ( not ( = ?auto_13291 ?auto_13296 ) ) ( OBJ-AT ?auto_13293 ?auto_13296 ) ( IN-CITY ?auto_13297 ?auto_13299 ) ( not ( = ?auto_13291 ?auto_13297 ) ) ( OBJ-AT ?auto_13292 ?auto_13297 ) ( OBJ-AT ?auto_13294 ?auto_13296 ) ( OBJ-AT ?auto_13295 ?auto_13297 ) ( TRUCK-AT ?auto_13298 ?auto_13291 ) ( not ( = ?auto_13295 ?auto_13294 ) ) ( not ( = ?auto_13296 ?auto_13297 ) ) ( not ( = ?auto_13295 ?auto_13292 ) ) ( not ( = ?auto_13294 ?auto_13292 ) ) ( not ( = ?auto_13295 ?auto_13293 ) ) ( not ( = ?auto_13294 ?auto_13293 ) ) ( not ( = ?auto_13292 ?auto_13293 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_13295 ?auto_13294 ?auto_13293 ?auto_13292 ?auto_13291 )
      ( DELIVER-4PKG-VERIFY ?auto_13292 ?auto_13293 ?auto_13294 ?auto_13295 ?auto_13291 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_13477 - OBJ
      ?auto_13478 - OBJ
      ?auto_13479 - OBJ
      ?auto_13480 - OBJ
      ?auto_13476 - LOCATION
    )
    :vars
    (
      ?auto_13481 - LOCATION
      ?auto_13484 - CITY
      ?auto_13482 - LOCATION
      ?auto_13483 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13481 ?auto_13484 ) ( IN-CITY ?auto_13476 ?auto_13484 ) ( not ( = ?auto_13476 ?auto_13481 ) ) ( OBJ-AT ?auto_13477 ?auto_13481 ) ( IN-CITY ?auto_13482 ?auto_13484 ) ( not ( = ?auto_13476 ?auto_13482 ) ) ( OBJ-AT ?auto_13480 ?auto_13482 ) ( OBJ-AT ?auto_13479 ?auto_13481 ) ( OBJ-AT ?auto_13478 ?auto_13482 ) ( TRUCK-AT ?auto_13483 ?auto_13476 ) ( not ( = ?auto_13478 ?auto_13479 ) ) ( not ( = ?auto_13481 ?auto_13482 ) ) ( not ( = ?auto_13478 ?auto_13480 ) ) ( not ( = ?auto_13479 ?auto_13480 ) ) ( not ( = ?auto_13478 ?auto_13477 ) ) ( not ( = ?auto_13479 ?auto_13477 ) ) ( not ( = ?auto_13480 ?auto_13477 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_13478 ?auto_13479 ?auto_13477 ?auto_13480 ?auto_13476 )
      ( DELIVER-4PKG-VERIFY ?auto_13477 ?auto_13478 ?auto_13479 ?auto_13480 ?auto_13476 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_13506 - OBJ
      ?auto_13507 - OBJ
      ?auto_13508 - OBJ
      ?auto_13509 - OBJ
      ?auto_13505 - LOCATION
    )
    :vars
    (
      ?auto_13510 - LOCATION
      ?auto_13513 - CITY
      ?auto_13511 - LOCATION
      ?auto_13512 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13510 ?auto_13513 ) ( IN-CITY ?auto_13505 ?auto_13513 ) ( not ( = ?auto_13505 ?auto_13510 ) ) ( OBJ-AT ?auto_13506 ?auto_13510 ) ( IN-CITY ?auto_13511 ?auto_13513 ) ( not ( = ?auto_13505 ?auto_13511 ) ) ( OBJ-AT ?auto_13508 ?auto_13511 ) ( OBJ-AT ?auto_13509 ?auto_13510 ) ( OBJ-AT ?auto_13507 ?auto_13511 ) ( TRUCK-AT ?auto_13512 ?auto_13505 ) ( not ( = ?auto_13507 ?auto_13509 ) ) ( not ( = ?auto_13510 ?auto_13511 ) ) ( not ( = ?auto_13507 ?auto_13508 ) ) ( not ( = ?auto_13509 ?auto_13508 ) ) ( not ( = ?auto_13507 ?auto_13506 ) ) ( not ( = ?auto_13509 ?auto_13506 ) ) ( not ( = ?auto_13508 ?auto_13506 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_13507 ?auto_13509 ?auto_13506 ?auto_13508 ?auto_13505 )
      ( DELIVER-4PKG-VERIFY ?auto_13506 ?auto_13507 ?auto_13508 ?auto_13509 ?auto_13505 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_13597 - OBJ
      ?auto_13598 - OBJ
      ?auto_13599 - OBJ
      ?auto_13600 - OBJ
      ?auto_13596 - LOCATION
    )
    :vars
    (
      ?auto_13601 - LOCATION
      ?auto_13604 - CITY
      ?auto_13602 - LOCATION
      ?auto_13603 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13601 ?auto_13604 ) ( IN-CITY ?auto_13596 ?auto_13604 ) ( not ( = ?auto_13596 ?auto_13601 ) ) ( OBJ-AT ?auto_13597 ?auto_13601 ) ( IN-CITY ?auto_13602 ?auto_13604 ) ( not ( = ?auto_13596 ?auto_13602 ) ) ( OBJ-AT ?auto_13600 ?auto_13602 ) ( OBJ-AT ?auto_13598 ?auto_13601 ) ( OBJ-AT ?auto_13599 ?auto_13602 ) ( TRUCK-AT ?auto_13603 ?auto_13596 ) ( not ( = ?auto_13599 ?auto_13598 ) ) ( not ( = ?auto_13601 ?auto_13602 ) ) ( not ( = ?auto_13599 ?auto_13600 ) ) ( not ( = ?auto_13598 ?auto_13600 ) ) ( not ( = ?auto_13599 ?auto_13597 ) ) ( not ( = ?auto_13598 ?auto_13597 ) ) ( not ( = ?auto_13600 ?auto_13597 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_13599 ?auto_13598 ?auto_13597 ?auto_13600 ?auto_13596 )
      ( DELIVER-4PKG-VERIFY ?auto_13597 ?auto_13598 ?auto_13599 ?auto_13600 ?auto_13596 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_13658 - OBJ
      ?auto_13659 - OBJ
      ?auto_13660 - OBJ
      ?auto_13661 - OBJ
      ?auto_13657 - LOCATION
    )
    :vars
    (
      ?auto_13662 - LOCATION
      ?auto_13665 - CITY
      ?auto_13663 - LOCATION
      ?auto_13664 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13662 ?auto_13665 ) ( IN-CITY ?auto_13657 ?auto_13665 ) ( not ( = ?auto_13657 ?auto_13662 ) ) ( OBJ-AT ?auto_13658 ?auto_13662 ) ( IN-CITY ?auto_13663 ?auto_13665 ) ( not ( = ?auto_13657 ?auto_13663 ) ) ( OBJ-AT ?auto_13660 ?auto_13663 ) ( OBJ-AT ?auto_13659 ?auto_13662 ) ( OBJ-AT ?auto_13661 ?auto_13663 ) ( TRUCK-AT ?auto_13664 ?auto_13657 ) ( not ( = ?auto_13661 ?auto_13659 ) ) ( not ( = ?auto_13662 ?auto_13663 ) ) ( not ( = ?auto_13661 ?auto_13660 ) ) ( not ( = ?auto_13659 ?auto_13660 ) ) ( not ( = ?auto_13661 ?auto_13658 ) ) ( not ( = ?auto_13659 ?auto_13658 ) ) ( not ( = ?auto_13660 ?auto_13658 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_13661 ?auto_13659 ?auto_13658 ?auto_13660 ?auto_13657 )
      ( DELIVER-4PKG-VERIFY ?auto_13658 ?auto_13659 ?auto_13660 ?auto_13661 ?auto_13657 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_13749 - OBJ
      ?auto_13750 - OBJ
      ?auto_13751 - OBJ
      ?auto_13752 - OBJ
      ?auto_13748 - LOCATION
    )
    :vars
    (
      ?auto_13753 - LOCATION
      ?auto_13756 - CITY
      ?auto_13754 - LOCATION
      ?auto_13755 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13753 ?auto_13756 ) ( IN-CITY ?auto_13748 ?auto_13756 ) ( not ( = ?auto_13748 ?auto_13753 ) ) ( OBJ-AT ?auto_13749 ?auto_13753 ) ( IN-CITY ?auto_13754 ?auto_13756 ) ( not ( = ?auto_13748 ?auto_13754 ) ) ( OBJ-AT ?auto_13750 ?auto_13754 ) ( OBJ-AT ?auto_13752 ?auto_13753 ) ( OBJ-AT ?auto_13751 ?auto_13754 ) ( TRUCK-AT ?auto_13755 ?auto_13748 ) ( not ( = ?auto_13751 ?auto_13752 ) ) ( not ( = ?auto_13753 ?auto_13754 ) ) ( not ( = ?auto_13751 ?auto_13750 ) ) ( not ( = ?auto_13752 ?auto_13750 ) ) ( not ( = ?auto_13751 ?auto_13749 ) ) ( not ( = ?auto_13752 ?auto_13749 ) ) ( not ( = ?auto_13750 ?auto_13749 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_13751 ?auto_13752 ?auto_13749 ?auto_13750 ?auto_13748 )
      ( DELIVER-4PKG-VERIFY ?auto_13749 ?auto_13750 ?auto_13751 ?auto_13752 ?auto_13748 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_13778 - OBJ
      ?auto_13779 - OBJ
      ?auto_13780 - OBJ
      ?auto_13781 - OBJ
      ?auto_13777 - LOCATION
    )
    :vars
    (
      ?auto_13782 - LOCATION
      ?auto_13785 - CITY
      ?auto_13783 - LOCATION
      ?auto_13784 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13782 ?auto_13785 ) ( IN-CITY ?auto_13777 ?auto_13785 ) ( not ( = ?auto_13777 ?auto_13782 ) ) ( OBJ-AT ?auto_13778 ?auto_13782 ) ( IN-CITY ?auto_13783 ?auto_13785 ) ( not ( = ?auto_13777 ?auto_13783 ) ) ( OBJ-AT ?auto_13779 ?auto_13783 ) ( OBJ-AT ?auto_13780 ?auto_13782 ) ( OBJ-AT ?auto_13781 ?auto_13783 ) ( TRUCK-AT ?auto_13784 ?auto_13777 ) ( not ( = ?auto_13781 ?auto_13780 ) ) ( not ( = ?auto_13782 ?auto_13783 ) ) ( not ( = ?auto_13781 ?auto_13779 ) ) ( not ( = ?auto_13780 ?auto_13779 ) ) ( not ( = ?auto_13781 ?auto_13778 ) ) ( not ( = ?auto_13780 ?auto_13778 ) ) ( not ( = ?auto_13779 ?auto_13778 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_13781 ?auto_13780 ?auto_13778 ?auto_13779 ?auto_13777 )
      ( DELIVER-4PKG-VERIFY ?auto_13778 ?auto_13779 ?auto_13780 ?auto_13781 ?auto_13777 ) )
  )

)

