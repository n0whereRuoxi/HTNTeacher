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
      ?auto_13246 - OBJ
      ?auto_13247 - LOCATION
    )
    :vars
    (
      ?auto_13248 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_13248 ?auto_13247 ) ( IN-TRUCK ?auto_13246 ?auto_13248 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_13246 ?auto_13248 ?auto_13247 )
      ( DELIVER-1PKG-VERIFY ?auto_13246 ?auto_13247 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_13251 - OBJ
      ?auto_13252 - LOCATION
    )
    :vars
    (
      ?auto_13253 - TRUCK
      ?auto_13254 - LOCATION
      ?auto_13255 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_13251 ?auto_13253 ) ( TRUCK-AT ?auto_13253 ?auto_13254 ) ( IN-CITY ?auto_13254 ?auto_13255 ) ( IN-CITY ?auto_13252 ?auto_13255 ) ( not ( = ?auto_13252 ?auto_13254 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_13253 ?auto_13254 ?auto_13252 ?auto_13255 )
      ( DELIVER-1PKG ?auto_13251 ?auto_13252 )
      ( DELIVER-1PKG-VERIFY ?auto_13251 ?auto_13252 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_13258 - OBJ
      ?auto_13259 - LOCATION
    )
    :vars
    (
      ?auto_13260 - TRUCK
      ?auto_13262 - LOCATION
      ?auto_13261 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_13260 ?auto_13262 ) ( IN-CITY ?auto_13262 ?auto_13261 ) ( IN-CITY ?auto_13259 ?auto_13261 ) ( not ( = ?auto_13259 ?auto_13262 ) ) ( OBJ-AT ?auto_13258 ?auto_13262 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_13258 ?auto_13260 ?auto_13262 )
      ( DELIVER-1PKG ?auto_13258 ?auto_13259 )
      ( DELIVER-1PKG-VERIFY ?auto_13258 ?auto_13259 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_13265 - OBJ
      ?auto_13266 - LOCATION
    )
    :vars
    (
      ?auto_13268 - LOCATION
      ?auto_13269 - CITY
      ?auto_13267 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13268 ?auto_13269 ) ( IN-CITY ?auto_13266 ?auto_13269 ) ( not ( = ?auto_13266 ?auto_13268 ) ) ( OBJ-AT ?auto_13265 ?auto_13268 ) ( TRUCK-AT ?auto_13267 ?auto_13266 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_13267 ?auto_13266 ?auto_13268 ?auto_13269 )
      ( DELIVER-1PKG ?auto_13265 ?auto_13266 )
      ( DELIVER-1PKG-VERIFY ?auto_13265 ?auto_13266 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_13299 - OBJ
      ?auto_13301 - OBJ
      ?auto_13300 - LOCATION
    )
    :vars
    (
      ?auto_13302 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_13301 ?auto_13299 ) ( TRUCK-AT ?auto_13302 ?auto_13300 ) ( IN-TRUCK ?auto_13301 ?auto_13302 ) ( OBJ-AT ?auto_13299 ?auto_13300 ) ( not ( = ?auto_13299 ?auto_13301 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_13301 ?auto_13300 )
      ( DELIVER-2PKG-VERIFY ?auto_13299 ?auto_13301 ?auto_13300 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_13306 - OBJ
      ?auto_13308 - OBJ
      ?auto_13307 - LOCATION
    )
    :vars
    (
      ?auto_13311 - TRUCK
      ?auto_13310 - LOCATION
      ?auto_13309 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_13308 ?auto_13306 ) ( IN-TRUCK ?auto_13308 ?auto_13311 ) ( TRUCK-AT ?auto_13311 ?auto_13310 ) ( IN-CITY ?auto_13310 ?auto_13309 ) ( IN-CITY ?auto_13307 ?auto_13309 ) ( not ( = ?auto_13307 ?auto_13310 ) ) ( OBJ-AT ?auto_13306 ?auto_13307 ) ( not ( = ?auto_13306 ?auto_13308 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_13308 ?auto_13307 )
      ( DELIVER-2PKG-VERIFY ?auto_13306 ?auto_13308 ?auto_13307 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_13315 - OBJ
      ?auto_13317 - OBJ
      ?auto_13316 - LOCATION
    )
    :vars
    (
      ?auto_13320 - TRUCK
      ?auto_13318 - LOCATION
      ?auto_13319 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_13317 ?auto_13315 ) ( TRUCK-AT ?auto_13320 ?auto_13318 ) ( IN-CITY ?auto_13318 ?auto_13319 ) ( IN-CITY ?auto_13316 ?auto_13319 ) ( not ( = ?auto_13316 ?auto_13318 ) ) ( OBJ-AT ?auto_13317 ?auto_13318 ) ( OBJ-AT ?auto_13315 ?auto_13316 ) ( not ( = ?auto_13315 ?auto_13317 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_13317 ?auto_13316 )
      ( DELIVER-2PKG-VERIFY ?auto_13315 ?auto_13317 ?auto_13316 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_13324 - OBJ
      ?auto_13326 - OBJ
      ?auto_13325 - LOCATION
    )
    :vars
    (
      ?auto_13327 - LOCATION
      ?auto_13328 - CITY
      ?auto_13329 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_13326 ?auto_13324 ) ( IN-CITY ?auto_13327 ?auto_13328 ) ( IN-CITY ?auto_13325 ?auto_13328 ) ( not ( = ?auto_13325 ?auto_13327 ) ) ( OBJ-AT ?auto_13326 ?auto_13327 ) ( TRUCK-AT ?auto_13329 ?auto_13325 ) ( OBJ-AT ?auto_13324 ?auto_13325 ) ( not ( = ?auto_13324 ?auto_13326 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_13326 ?auto_13325 )
      ( DELIVER-2PKG-VERIFY ?auto_13324 ?auto_13326 ?auto_13325 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_13333 - OBJ
      ?auto_13335 - OBJ
      ?auto_13334 - LOCATION
    )
    :vars
    (
      ?auto_13337 - LOCATION
      ?auto_13336 - CITY
      ?auto_13338 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_13335 ?auto_13333 ) ( IN-CITY ?auto_13337 ?auto_13336 ) ( IN-CITY ?auto_13334 ?auto_13336 ) ( not ( = ?auto_13334 ?auto_13337 ) ) ( OBJ-AT ?auto_13335 ?auto_13337 ) ( TRUCK-AT ?auto_13338 ?auto_13334 ) ( not ( = ?auto_13333 ?auto_13335 ) ) ( IN-TRUCK ?auto_13333 ?auto_13338 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_13333 ?auto_13334 )
      ( DELIVER-2PKG ?auto_13333 ?auto_13335 ?auto_13334 )
      ( DELIVER-2PKG-VERIFY ?auto_13333 ?auto_13335 ?auto_13334 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_13342 - OBJ
      ?auto_13344 - OBJ
      ?auto_13343 - LOCATION
    )
    :vars
    (
      ?auto_13346 - LOCATION
      ?auto_13347 - CITY
      ?auto_13345 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_13344 ?auto_13342 ) ( IN-CITY ?auto_13346 ?auto_13347 ) ( IN-CITY ?auto_13343 ?auto_13347 ) ( not ( = ?auto_13343 ?auto_13346 ) ) ( OBJ-AT ?auto_13344 ?auto_13346 ) ( not ( = ?auto_13342 ?auto_13344 ) ) ( IN-TRUCK ?auto_13342 ?auto_13345 ) ( TRUCK-AT ?auto_13345 ?auto_13346 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_13345 ?auto_13346 ?auto_13343 ?auto_13347 )
      ( DELIVER-2PKG ?auto_13342 ?auto_13344 ?auto_13343 )
      ( DELIVER-2PKG-VERIFY ?auto_13342 ?auto_13344 ?auto_13343 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_13351 - OBJ
      ?auto_13353 - OBJ
      ?auto_13352 - LOCATION
    )
    :vars
    (
      ?auto_13355 - LOCATION
      ?auto_13354 - CITY
      ?auto_13356 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_13353 ?auto_13351 ) ( IN-CITY ?auto_13355 ?auto_13354 ) ( IN-CITY ?auto_13352 ?auto_13354 ) ( not ( = ?auto_13352 ?auto_13355 ) ) ( OBJ-AT ?auto_13353 ?auto_13355 ) ( not ( = ?auto_13351 ?auto_13353 ) ) ( TRUCK-AT ?auto_13356 ?auto_13355 ) ( OBJ-AT ?auto_13351 ?auto_13355 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_13351 ?auto_13356 ?auto_13355 )
      ( DELIVER-2PKG ?auto_13351 ?auto_13353 ?auto_13352 )
      ( DELIVER-2PKG-VERIFY ?auto_13351 ?auto_13353 ?auto_13352 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_13360 - OBJ
      ?auto_13362 - OBJ
      ?auto_13361 - LOCATION
    )
    :vars
    (
      ?auto_13363 - LOCATION
      ?auto_13364 - CITY
      ?auto_13365 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_13362 ?auto_13360 ) ( IN-CITY ?auto_13363 ?auto_13364 ) ( IN-CITY ?auto_13361 ?auto_13364 ) ( not ( = ?auto_13361 ?auto_13363 ) ) ( OBJ-AT ?auto_13362 ?auto_13363 ) ( not ( = ?auto_13360 ?auto_13362 ) ) ( OBJ-AT ?auto_13360 ?auto_13363 ) ( TRUCK-AT ?auto_13365 ?auto_13361 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_13365 ?auto_13361 ?auto_13363 ?auto_13364 )
      ( DELIVER-2PKG ?auto_13360 ?auto_13362 ?auto_13361 )
      ( DELIVER-2PKG-VERIFY ?auto_13360 ?auto_13362 ?auto_13361 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13396 - OBJ
      ?auto_13398 - OBJ
      ?auto_13399 - OBJ
      ?auto_13397 - LOCATION
    )
    :vars
    (
      ?auto_13400 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_13398 ?auto_13396 ) ( GREATER-THAN ?auto_13399 ?auto_13396 ) ( GREATER-THAN ?auto_13399 ?auto_13398 ) ( TRUCK-AT ?auto_13400 ?auto_13397 ) ( IN-TRUCK ?auto_13399 ?auto_13400 ) ( OBJ-AT ?auto_13396 ?auto_13397 ) ( OBJ-AT ?auto_13398 ?auto_13397 ) ( not ( = ?auto_13396 ?auto_13398 ) ) ( not ( = ?auto_13396 ?auto_13399 ) ) ( not ( = ?auto_13398 ?auto_13399 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_13399 ?auto_13397 )
      ( DELIVER-3PKG-VERIFY ?auto_13396 ?auto_13398 ?auto_13399 ?auto_13397 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13405 - OBJ
      ?auto_13407 - OBJ
      ?auto_13408 - OBJ
      ?auto_13406 - LOCATION
    )
    :vars
    (
      ?auto_13410 - TRUCK
      ?auto_13411 - LOCATION
      ?auto_13409 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_13407 ?auto_13405 ) ( GREATER-THAN ?auto_13408 ?auto_13405 ) ( GREATER-THAN ?auto_13408 ?auto_13407 ) ( IN-TRUCK ?auto_13408 ?auto_13410 ) ( TRUCK-AT ?auto_13410 ?auto_13411 ) ( IN-CITY ?auto_13411 ?auto_13409 ) ( IN-CITY ?auto_13406 ?auto_13409 ) ( not ( = ?auto_13406 ?auto_13411 ) ) ( OBJ-AT ?auto_13405 ?auto_13406 ) ( OBJ-AT ?auto_13407 ?auto_13406 ) ( not ( = ?auto_13405 ?auto_13407 ) ) ( not ( = ?auto_13405 ?auto_13408 ) ) ( not ( = ?auto_13407 ?auto_13408 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_13408 ?auto_13406 )
      ( DELIVER-3PKG-VERIFY ?auto_13405 ?auto_13407 ?auto_13408 ?auto_13406 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13416 - OBJ
      ?auto_13418 - OBJ
      ?auto_13419 - OBJ
      ?auto_13417 - LOCATION
    )
    :vars
    (
      ?auto_13421 - TRUCK
      ?auto_13420 - LOCATION
      ?auto_13422 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_13418 ?auto_13416 ) ( GREATER-THAN ?auto_13419 ?auto_13416 ) ( GREATER-THAN ?auto_13419 ?auto_13418 ) ( TRUCK-AT ?auto_13421 ?auto_13420 ) ( IN-CITY ?auto_13420 ?auto_13422 ) ( IN-CITY ?auto_13417 ?auto_13422 ) ( not ( = ?auto_13417 ?auto_13420 ) ) ( OBJ-AT ?auto_13419 ?auto_13420 ) ( OBJ-AT ?auto_13416 ?auto_13417 ) ( OBJ-AT ?auto_13418 ?auto_13417 ) ( not ( = ?auto_13416 ?auto_13418 ) ) ( not ( = ?auto_13416 ?auto_13419 ) ) ( not ( = ?auto_13418 ?auto_13419 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_13419 ?auto_13417 )
      ( DELIVER-3PKG-VERIFY ?auto_13416 ?auto_13418 ?auto_13419 ?auto_13417 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13427 - OBJ
      ?auto_13429 - OBJ
      ?auto_13430 - OBJ
      ?auto_13428 - LOCATION
    )
    :vars
    (
      ?auto_13431 - LOCATION
      ?auto_13433 - CITY
      ?auto_13432 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_13429 ?auto_13427 ) ( GREATER-THAN ?auto_13430 ?auto_13427 ) ( GREATER-THAN ?auto_13430 ?auto_13429 ) ( IN-CITY ?auto_13431 ?auto_13433 ) ( IN-CITY ?auto_13428 ?auto_13433 ) ( not ( = ?auto_13428 ?auto_13431 ) ) ( OBJ-AT ?auto_13430 ?auto_13431 ) ( TRUCK-AT ?auto_13432 ?auto_13428 ) ( OBJ-AT ?auto_13427 ?auto_13428 ) ( OBJ-AT ?auto_13429 ?auto_13428 ) ( not ( = ?auto_13427 ?auto_13429 ) ) ( not ( = ?auto_13427 ?auto_13430 ) ) ( not ( = ?auto_13429 ?auto_13430 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_13430 ?auto_13428 )
      ( DELIVER-3PKG-VERIFY ?auto_13427 ?auto_13429 ?auto_13430 ?auto_13428 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13438 - OBJ
      ?auto_13440 - OBJ
      ?auto_13441 - OBJ
      ?auto_13439 - LOCATION
    )
    :vars
    (
      ?auto_13442 - LOCATION
      ?auto_13443 - CITY
      ?auto_13444 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_13440 ?auto_13438 ) ( GREATER-THAN ?auto_13441 ?auto_13438 ) ( GREATER-THAN ?auto_13441 ?auto_13440 ) ( IN-CITY ?auto_13442 ?auto_13443 ) ( IN-CITY ?auto_13439 ?auto_13443 ) ( not ( = ?auto_13439 ?auto_13442 ) ) ( OBJ-AT ?auto_13441 ?auto_13442 ) ( TRUCK-AT ?auto_13444 ?auto_13439 ) ( OBJ-AT ?auto_13438 ?auto_13439 ) ( not ( = ?auto_13438 ?auto_13440 ) ) ( not ( = ?auto_13438 ?auto_13441 ) ) ( not ( = ?auto_13440 ?auto_13441 ) ) ( IN-TRUCK ?auto_13440 ?auto_13444 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_13440 ?auto_13439 )
      ( DELIVER-3PKG ?auto_13438 ?auto_13440 ?auto_13441 ?auto_13439 )
      ( DELIVER-3PKG-VERIFY ?auto_13438 ?auto_13440 ?auto_13441 ?auto_13439 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13449 - OBJ
      ?auto_13451 - OBJ
      ?auto_13452 - OBJ
      ?auto_13450 - LOCATION
    )
    :vars
    (
      ?auto_13455 - LOCATION
      ?auto_13454 - CITY
      ?auto_13453 - TRUCK
      ?auto_13456 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_13451 ?auto_13449 ) ( GREATER-THAN ?auto_13452 ?auto_13449 ) ( GREATER-THAN ?auto_13452 ?auto_13451 ) ( IN-CITY ?auto_13455 ?auto_13454 ) ( IN-CITY ?auto_13450 ?auto_13454 ) ( not ( = ?auto_13450 ?auto_13455 ) ) ( OBJ-AT ?auto_13452 ?auto_13455 ) ( OBJ-AT ?auto_13449 ?auto_13450 ) ( not ( = ?auto_13449 ?auto_13451 ) ) ( not ( = ?auto_13449 ?auto_13452 ) ) ( not ( = ?auto_13451 ?auto_13452 ) ) ( IN-TRUCK ?auto_13451 ?auto_13453 ) ( TRUCK-AT ?auto_13453 ?auto_13456 ) ( IN-CITY ?auto_13456 ?auto_13454 ) ( not ( = ?auto_13450 ?auto_13456 ) ) ( not ( = ?auto_13455 ?auto_13456 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_13453 ?auto_13456 ?auto_13450 ?auto_13454 )
      ( DELIVER-3PKG ?auto_13449 ?auto_13451 ?auto_13452 ?auto_13450 )
      ( DELIVER-3PKG-VERIFY ?auto_13449 ?auto_13451 ?auto_13452 ?auto_13450 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13461 - OBJ
      ?auto_13463 - OBJ
      ?auto_13464 - OBJ
      ?auto_13462 - LOCATION
    )
    :vars
    (
      ?auto_13467 - LOCATION
      ?auto_13468 - CITY
      ?auto_13466 - TRUCK
      ?auto_13465 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_13463 ?auto_13461 ) ( GREATER-THAN ?auto_13464 ?auto_13461 ) ( GREATER-THAN ?auto_13464 ?auto_13463 ) ( IN-CITY ?auto_13467 ?auto_13468 ) ( IN-CITY ?auto_13462 ?auto_13468 ) ( not ( = ?auto_13462 ?auto_13467 ) ) ( OBJ-AT ?auto_13464 ?auto_13467 ) ( OBJ-AT ?auto_13461 ?auto_13462 ) ( not ( = ?auto_13461 ?auto_13463 ) ) ( not ( = ?auto_13461 ?auto_13464 ) ) ( not ( = ?auto_13463 ?auto_13464 ) ) ( TRUCK-AT ?auto_13466 ?auto_13465 ) ( IN-CITY ?auto_13465 ?auto_13468 ) ( not ( = ?auto_13462 ?auto_13465 ) ) ( not ( = ?auto_13467 ?auto_13465 ) ) ( OBJ-AT ?auto_13463 ?auto_13465 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_13463 ?auto_13466 ?auto_13465 )
      ( DELIVER-3PKG ?auto_13461 ?auto_13463 ?auto_13464 ?auto_13462 )
      ( DELIVER-3PKG-VERIFY ?auto_13461 ?auto_13463 ?auto_13464 ?auto_13462 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13473 - OBJ
      ?auto_13475 - OBJ
      ?auto_13476 - OBJ
      ?auto_13474 - LOCATION
    )
    :vars
    (
      ?auto_13480 - LOCATION
      ?auto_13477 - CITY
      ?auto_13479 - LOCATION
      ?auto_13478 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_13475 ?auto_13473 ) ( GREATER-THAN ?auto_13476 ?auto_13473 ) ( GREATER-THAN ?auto_13476 ?auto_13475 ) ( IN-CITY ?auto_13480 ?auto_13477 ) ( IN-CITY ?auto_13474 ?auto_13477 ) ( not ( = ?auto_13474 ?auto_13480 ) ) ( OBJ-AT ?auto_13476 ?auto_13480 ) ( OBJ-AT ?auto_13473 ?auto_13474 ) ( not ( = ?auto_13473 ?auto_13475 ) ) ( not ( = ?auto_13473 ?auto_13476 ) ) ( not ( = ?auto_13475 ?auto_13476 ) ) ( IN-CITY ?auto_13479 ?auto_13477 ) ( not ( = ?auto_13474 ?auto_13479 ) ) ( not ( = ?auto_13480 ?auto_13479 ) ) ( OBJ-AT ?auto_13475 ?auto_13479 ) ( TRUCK-AT ?auto_13478 ?auto_13474 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_13478 ?auto_13474 ?auto_13479 ?auto_13477 )
      ( DELIVER-3PKG ?auto_13473 ?auto_13475 ?auto_13476 ?auto_13474 )
      ( DELIVER-3PKG-VERIFY ?auto_13473 ?auto_13475 ?auto_13476 ?auto_13474 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13485 - OBJ
      ?auto_13487 - OBJ
      ?auto_13488 - OBJ
      ?auto_13486 - LOCATION
    )
    :vars
    (
      ?auto_13491 - LOCATION
      ?auto_13489 - CITY
      ?auto_13490 - LOCATION
      ?auto_13492 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_13487 ?auto_13485 ) ( GREATER-THAN ?auto_13488 ?auto_13485 ) ( GREATER-THAN ?auto_13488 ?auto_13487 ) ( IN-CITY ?auto_13491 ?auto_13489 ) ( IN-CITY ?auto_13486 ?auto_13489 ) ( not ( = ?auto_13486 ?auto_13491 ) ) ( OBJ-AT ?auto_13488 ?auto_13491 ) ( not ( = ?auto_13485 ?auto_13487 ) ) ( not ( = ?auto_13485 ?auto_13488 ) ) ( not ( = ?auto_13487 ?auto_13488 ) ) ( IN-CITY ?auto_13490 ?auto_13489 ) ( not ( = ?auto_13486 ?auto_13490 ) ) ( not ( = ?auto_13491 ?auto_13490 ) ) ( OBJ-AT ?auto_13487 ?auto_13490 ) ( TRUCK-AT ?auto_13492 ?auto_13486 ) ( IN-TRUCK ?auto_13485 ?auto_13492 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_13485 ?auto_13486 )
      ( DELIVER-3PKG ?auto_13485 ?auto_13487 ?auto_13488 ?auto_13486 )
      ( DELIVER-3PKG-VERIFY ?auto_13485 ?auto_13487 ?auto_13488 ?auto_13486 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13497 - OBJ
      ?auto_13499 - OBJ
      ?auto_13500 - OBJ
      ?auto_13498 - LOCATION
    )
    :vars
    (
      ?auto_13501 - LOCATION
      ?auto_13502 - CITY
      ?auto_13504 - LOCATION
      ?auto_13503 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_13499 ?auto_13497 ) ( GREATER-THAN ?auto_13500 ?auto_13497 ) ( GREATER-THAN ?auto_13500 ?auto_13499 ) ( IN-CITY ?auto_13501 ?auto_13502 ) ( IN-CITY ?auto_13498 ?auto_13502 ) ( not ( = ?auto_13498 ?auto_13501 ) ) ( OBJ-AT ?auto_13500 ?auto_13501 ) ( not ( = ?auto_13497 ?auto_13499 ) ) ( not ( = ?auto_13497 ?auto_13500 ) ) ( not ( = ?auto_13499 ?auto_13500 ) ) ( IN-CITY ?auto_13504 ?auto_13502 ) ( not ( = ?auto_13498 ?auto_13504 ) ) ( not ( = ?auto_13501 ?auto_13504 ) ) ( OBJ-AT ?auto_13499 ?auto_13504 ) ( IN-TRUCK ?auto_13497 ?auto_13503 ) ( TRUCK-AT ?auto_13503 ?auto_13504 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_13503 ?auto_13504 ?auto_13498 ?auto_13502 )
      ( DELIVER-3PKG ?auto_13497 ?auto_13499 ?auto_13500 ?auto_13498 )
      ( DELIVER-3PKG-VERIFY ?auto_13497 ?auto_13499 ?auto_13500 ?auto_13498 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13509 - OBJ
      ?auto_13511 - OBJ
      ?auto_13512 - OBJ
      ?auto_13510 - LOCATION
    )
    :vars
    (
      ?auto_13516 - LOCATION
      ?auto_13515 - CITY
      ?auto_13514 - LOCATION
      ?auto_13513 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_13511 ?auto_13509 ) ( GREATER-THAN ?auto_13512 ?auto_13509 ) ( GREATER-THAN ?auto_13512 ?auto_13511 ) ( IN-CITY ?auto_13516 ?auto_13515 ) ( IN-CITY ?auto_13510 ?auto_13515 ) ( not ( = ?auto_13510 ?auto_13516 ) ) ( OBJ-AT ?auto_13512 ?auto_13516 ) ( not ( = ?auto_13509 ?auto_13511 ) ) ( not ( = ?auto_13509 ?auto_13512 ) ) ( not ( = ?auto_13511 ?auto_13512 ) ) ( IN-CITY ?auto_13514 ?auto_13515 ) ( not ( = ?auto_13510 ?auto_13514 ) ) ( not ( = ?auto_13516 ?auto_13514 ) ) ( OBJ-AT ?auto_13511 ?auto_13514 ) ( TRUCK-AT ?auto_13513 ?auto_13514 ) ( OBJ-AT ?auto_13509 ?auto_13514 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_13509 ?auto_13513 ?auto_13514 )
      ( DELIVER-3PKG ?auto_13509 ?auto_13511 ?auto_13512 ?auto_13510 )
      ( DELIVER-3PKG-VERIFY ?auto_13509 ?auto_13511 ?auto_13512 ?auto_13510 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13521 - OBJ
      ?auto_13523 - OBJ
      ?auto_13524 - OBJ
      ?auto_13522 - LOCATION
    )
    :vars
    (
      ?auto_13525 - LOCATION
      ?auto_13528 - CITY
      ?auto_13526 - LOCATION
      ?auto_13527 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_13523 ?auto_13521 ) ( GREATER-THAN ?auto_13524 ?auto_13521 ) ( GREATER-THAN ?auto_13524 ?auto_13523 ) ( IN-CITY ?auto_13525 ?auto_13528 ) ( IN-CITY ?auto_13522 ?auto_13528 ) ( not ( = ?auto_13522 ?auto_13525 ) ) ( OBJ-AT ?auto_13524 ?auto_13525 ) ( not ( = ?auto_13521 ?auto_13523 ) ) ( not ( = ?auto_13521 ?auto_13524 ) ) ( not ( = ?auto_13523 ?auto_13524 ) ) ( IN-CITY ?auto_13526 ?auto_13528 ) ( not ( = ?auto_13522 ?auto_13526 ) ) ( not ( = ?auto_13525 ?auto_13526 ) ) ( OBJ-AT ?auto_13523 ?auto_13526 ) ( OBJ-AT ?auto_13521 ?auto_13526 ) ( TRUCK-AT ?auto_13527 ?auto_13522 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_13527 ?auto_13522 ?auto_13526 ?auto_13528 )
      ( DELIVER-3PKG ?auto_13521 ?auto_13523 ?auto_13524 ?auto_13522 )
      ( DELIVER-3PKG-VERIFY ?auto_13521 ?auto_13523 ?auto_13524 ?auto_13522 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_13560 - OBJ
      ?auto_13562 - OBJ
      ?auto_13563 - OBJ
      ?auto_13564 - OBJ
      ?auto_13561 - LOCATION
    )
    :vars
    (
      ?auto_13565 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_13562 ?auto_13560 ) ( GREATER-THAN ?auto_13563 ?auto_13560 ) ( GREATER-THAN ?auto_13563 ?auto_13562 ) ( GREATER-THAN ?auto_13564 ?auto_13560 ) ( GREATER-THAN ?auto_13564 ?auto_13562 ) ( GREATER-THAN ?auto_13564 ?auto_13563 ) ( TRUCK-AT ?auto_13565 ?auto_13561 ) ( IN-TRUCK ?auto_13564 ?auto_13565 ) ( OBJ-AT ?auto_13560 ?auto_13561 ) ( OBJ-AT ?auto_13562 ?auto_13561 ) ( OBJ-AT ?auto_13563 ?auto_13561 ) ( not ( = ?auto_13560 ?auto_13562 ) ) ( not ( = ?auto_13560 ?auto_13563 ) ) ( not ( = ?auto_13560 ?auto_13564 ) ) ( not ( = ?auto_13562 ?auto_13563 ) ) ( not ( = ?auto_13562 ?auto_13564 ) ) ( not ( = ?auto_13563 ?auto_13564 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_13564 ?auto_13561 )
      ( DELIVER-4PKG-VERIFY ?auto_13560 ?auto_13562 ?auto_13563 ?auto_13564 ?auto_13561 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_13571 - OBJ
      ?auto_13573 - OBJ
      ?auto_13574 - OBJ
      ?auto_13575 - OBJ
      ?auto_13572 - LOCATION
    )
    :vars
    (
      ?auto_13577 - TRUCK
      ?auto_13576 - LOCATION
      ?auto_13578 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_13573 ?auto_13571 ) ( GREATER-THAN ?auto_13574 ?auto_13571 ) ( GREATER-THAN ?auto_13574 ?auto_13573 ) ( GREATER-THAN ?auto_13575 ?auto_13571 ) ( GREATER-THAN ?auto_13575 ?auto_13573 ) ( GREATER-THAN ?auto_13575 ?auto_13574 ) ( IN-TRUCK ?auto_13575 ?auto_13577 ) ( TRUCK-AT ?auto_13577 ?auto_13576 ) ( IN-CITY ?auto_13576 ?auto_13578 ) ( IN-CITY ?auto_13572 ?auto_13578 ) ( not ( = ?auto_13572 ?auto_13576 ) ) ( OBJ-AT ?auto_13571 ?auto_13572 ) ( OBJ-AT ?auto_13573 ?auto_13572 ) ( OBJ-AT ?auto_13574 ?auto_13572 ) ( not ( = ?auto_13571 ?auto_13573 ) ) ( not ( = ?auto_13571 ?auto_13574 ) ) ( not ( = ?auto_13571 ?auto_13575 ) ) ( not ( = ?auto_13573 ?auto_13574 ) ) ( not ( = ?auto_13573 ?auto_13575 ) ) ( not ( = ?auto_13574 ?auto_13575 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_13575 ?auto_13572 )
      ( DELIVER-4PKG-VERIFY ?auto_13571 ?auto_13573 ?auto_13574 ?auto_13575 ?auto_13572 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_13584 - OBJ
      ?auto_13586 - OBJ
      ?auto_13587 - OBJ
      ?auto_13588 - OBJ
      ?auto_13585 - LOCATION
    )
    :vars
    (
      ?auto_13590 - TRUCK
      ?auto_13591 - LOCATION
      ?auto_13589 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_13586 ?auto_13584 ) ( GREATER-THAN ?auto_13587 ?auto_13584 ) ( GREATER-THAN ?auto_13587 ?auto_13586 ) ( GREATER-THAN ?auto_13588 ?auto_13584 ) ( GREATER-THAN ?auto_13588 ?auto_13586 ) ( GREATER-THAN ?auto_13588 ?auto_13587 ) ( TRUCK-AT ?auto_13590 ?auto_13591 ) ( IN-CITY ?auto_13591 ?auto_13589 ) ( IN-CITY ?auto_13585 ?auto_13589 ) ( not ( = ?auto_13585 ?auto_13591 ) ) ( OBJ-AT ?auto_13588 ?auto_13591 ) ( OBJ-AT ?auto_13584 ?auto_13585 ) ( OBJ-AT ?auto_13586 ?auto_13585 ) ( OBJ-AT ?auto_13587 ?auto_13585 ) ( not ( = ?auto_13584 ?auto_13586 ) ) ( not ( = ?auto_13584 ?auto_13587 ) ) ( not ( = ?auto_13584 ?auto_13588 ) ) ( not ( = ?auto_13586 ?auto_13587 ) ) ( not ( = ?auto_13586 ?auto_13588 ) ) ( not ( = ?auto_13587 ?auto_13588 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_13588 ?auto_13585 )
      ( DELIVER-4PKG-VERIFY ?auto_13584 ?auto_13586 ?auto_13587 ?auto_13588 ?auto_13585 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_13597 - OBJ
      ?auto_13599 - OBJ
      ?auto_13600 - OBJ
      ?auto_13601 - OBJ
      ?auto_13598 - LOCATION
    )
    :vars
    (
      ?auto_13603 - LOCATION
      ?auto_13602 - CITY
      ?auto_13604 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_13599 ?auto_13597 ) ( GREATER-THAN ?auto_13600 ?auto_13597 ) ( GREATER-THAN ?auto_13600 ?auto_13599 ) ( GREATER-THAN ?auto_13601 ?auto_13597 ) ( GREATER-THAN ?auto_13601 ?auto_13599 ) ( GREATER-THAN ?auto_13601 ?auto_13600 ) ( IN-CITY ?auto_13603 ?auto_13602 ) ( IN-CITY ?auto_13598 ?auto_13602 ) ( not ( = ?auto_13598 ?auto_13603 ) ) ( OBJ-AT ?auto_13601 ?auto_13603 ) ( TRUCK-AT ?auto_13604 ?auto_13598 ) ( OBJ-AT ?auto_13597 ?auto_13598 ) ( OBJ-AT ?auto_13599 ?auto_13598 ) ( OBJ-AT ?auto_13600 ?auto_13598 ) ( not ( = ?auto_13597 ?auto_13599 ) ) ( not ( = ?auto_13597 ?auto_13600 ) ) ( not ( = ?auto_13597 ?auto_13601 ) ) ( not ( = ?auto_13599 ?auto_13600 ) ) ( not ( = ?auto_13599 ?auto_13601 ) ) ( not ( = ?auto_13600 ?auto_13601 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_13601 ?auto_13598 )
      ( DELIVER-4PKG-VERIFY ?auto_13597 ?auto_13599 ?auto_13600 ?auto_13601 ?auto_13598 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_13610 - OBJ
      ?auto_13612 - OBJ
      ?auto_13613 - OBJ
      ?auto_13614 - OBJ
      ?auto_13611 - LOCATION
    )
    :vars
    (
      ?auto_13617 - LOCATION
      ?auto_13615 - CITY
      ?auto_13616 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_13612 ?auto_13610 ) ( GREATER-THAN ?auto_13613 ?auto_13610 ) ( GREATER-THAN ?auto_13613 ?auto_13612 ) ( GREATER-THAN ?auto_13614 ?auto_13610 ) ( GREATER-THAN ?auto_13614 ?auto_13612 ) ( GREATER-THAN ?auto_13614 ?auto_13613 ) ( IN-CITY ?auto_13617 ?auto_13615 ) ( IN-CITY ?auto_13611 ?auto_13615 ) ( not ( = ?auto_13611 ?auto_13617 ) ) ( OBJ-AT ?auto_13614 ?auto_13617 ) ( TRUCK-AT ?auto_13616 ?auto_13611 ) ( OBJ-AT ?auto_13610 ?auto_13611 ) ( OBJ-AT ?auto_13612 ?auto_13611 ) ( not ( = ?auto_13610 ?auto_13612 ) ) ( not ( = ?auto_13610 ?auto_13613 ) ) ( not ( = ?auto_13610 ?auto_13614 ) ) ( not ( = ?auto_13612 ?auto_13613 ) ) ( not ( = ?auto_13612 ?auto_13614 ) ) ( not ( = ?auto_13613 ?auto_13614 ) ) ( IN-TRUCK ?auto_13613 ?auto_13616 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_13613 ?auto_13611 )
      ( DELIVER-4PKG ?auto_13610 ?auto_13612 ?auto_13613 ?auto_13614 ?auto_13611 )
      ( DELIVER-4PKG-VERIFY ?auto_13610 ?auto_13612 ?auto_13613 ?auto_13614 ?auto_13611 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_13623 - OBJ
      ?auto_13625 - OBJ
      ?auto_13626 - OBJ
      ?auto_13627 - OBJ
      ?auto_13624 - LOCATION
    )
    :vars
    (
      ?auto_13630 - LOCATION
      ?auto_13628 - CITY
      ?auto_13629 - TRUCK
      ?auto_13631 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_13625 ?auto_13623 ) ( GREATER-THAN ?auto_13626 ?auto_13623 ) ( GREATER-THAN ?auto_13626 ?auto_13625 ) ( GREATER-THAN ?auto_13627 ?auto_13623 ) ( GREATER-THAN ?auto_13627 ?auto_13625 ) ( GREATER-THAN ?auto_13627 ?auto_13626 ) ( IN-CITY ?auto_13630 ?auto_13628 ) ( IN-CITY ?auto_13624 ?auto_13628 ) ( not ( = ?auto_13624 ?auto_13630 ) ) ( OBJ-AT ?auto_13627 ?auto_13630 ) ( OBJ-AT ?auto_13623 ?auto_13624 ) ( OBJ-AT ?auto_13625 ?auto_13624 ) ( not ( = ?auto_13623 ?auto_13625 ) ) ( not ( = ?auto_13623 ?auto_13626 ) ) ( not ( = ?auto_13623 ?auto_13627 ) ) ( not ( = ?auto_13625 ?auto_13626 ) ) ( not ( = ?auto_13625 ?auto_13627 ) ) ( not ( = ?auto_13626 ?auto_13627 ) ) ( IN-TRUCK ?auto_13626 ?auto_13629 ) ( TRUCK-AT ?auto_13629 ?auto_13631 ) ( IN-CITY ?auto_13631 ?auto_13628 ) ( not ( = ?auto_13624 ?auto_13631 ) ) ( not ( = ?auto_13630 ?auto_13631 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_13629 ?auto_13631 ?auto_13624 ?auto_13628 )
      ( DELIVER-4PKG ?auto_13623 ?auto_13625 ?auto_13626 ?auto_13627 ?auto_13624 )
      ( DELIVER-4PKG-VERIFY ?auto_13623 ?auto_13625 ?auto_13626 ?auto_13627 ?auto_13624 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_13637 - OBJ
      ?auto_13639 - OBJ
      ?auto_13640 - OBJ
      ?auto_13641 - OBJ
      ?auto_13638 - LOCATION
    )
    :vars
    (
      ?auto_13643 - LOCATION
      ?auto_13645 - CITY
      ?auto_13644 - TRUCK
      ?auto_13642 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_13639 ?auto_13637 ) ( GREATER-THAN ?auto_13640 ?auto_13637 ) ( GREATER-THAN ?auto_13640 ?auto_13639 ) ( GREATER-THAN ?auto_13641 ?auto_13637 ) ( GREATER-THAN ?auto_13641 ?auto_13639 ) ( GREATER-THAN ?auto_13641 ?auto_13640 ) ( IN-CITY ?auto_13643 ?auto_13645 ) ( IN-CITY ?auto_13638 ?auto_13645 ) ( not ( = ?auto_13638 ?auto_13643 ) ) ( OBJ-AT ?auto_13641 ?auto_13643 ) ( OBJ-AT ?auto_13637 ?auto_13638 ) ( OBJ-AT ?auto_13639 ?auto_13638 ) ( not ( = ?auto_13637 ?auto_13639 ) ) ( not ( = ?auto_13637 ?auto_13640 ) ) ( not ( = ?auto_13637 ?auto_13641 ) ) ( not ( = ?auto_13639 ?auto_13640 ) ) ( not ( = ?auto_13639 ?auto_13641 ) ) ( not ( = ?auto_13640 ?auto_13641 ) ) ( TRUCK-AT ?auto_13644 ?auto_13642 ) ( IN-CITY ?auto_13642 ?auto_13645 ) ( not ( = ?auto_13638 ?auto_13642 ) ) ( not ( = ?auto_13643 ?auto_13642 ) ) ( OBJ-AT ?auto_13640 ?auto_13642 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_13640 ?auto_13644 ?auto_13642 )
      ( DELIVER-4PKG ?auto_13637 ?auto_13639 ?auto_13640 ?auto_13641 ?auto_13638 )
      ( DELIVER-4PKG-VERIFY ?auto_13637 ?auto_13639 ?auto_13640 ?auto_13641 ?auto_13638 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_13651 - OBJ
      ?auto_13653 - OBJ
      ?auto_13654 - OBJ
      ?auto_13655 - OBJ
      ?auto_13652 - LOCATION
    )
    :vars
    (
      ?auto_13657 - LOCATION
      ?auto_13656 - CITY
      ?auto_13658 - LOCATION
      ?auto_13659 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_13653 ?auto_13651 ) ( GREATER-THAN ?auto_13654 ?auto_13651 ) ( GREATER-THAN ?auto_13654 ?auto_13653 ) ( GREATER-THAN ?auto_13655 ?auto_13651 ) ( GREATER-THAN ?auto_13655 ?auto_13653 ) ( GREATER-THAN ?auto_13655 ?auto_13654 ) ( IN-CITY ?auto_13657 ?auto_13656 ) ( IN-CITY ?auto_13652 ?auto_13656 ) ( not ( = ?auto_13652 ?auto_13657 ) ) ( OBJ-AT ?auto_13655 ?auto_13657 ) ( OBJ-AT ?auto_13651 ?auto_13652 ) ( OBJ-AT ?auto_13653 ?auto_13652 ) ( not ( = ?auto_13651 ?auto_13653 ) ) ( not ( = ?auto_13651 ?auto_13654 ) ) ( not ( = ?auto_13651 ?auto_13655 ) ) ( not ( = ?auto_13653 ?auto_13654 ) ) ( not ( = ?auto_13653 ?auto_13655 ) ) ( not ( = ?auto_13654 ?auto_13655 ) ) ( IN-CITY ?auto_13658 ?auto_13656 ) ( not ( = ?auto_13652 ?auto_13658 ) ) ( not ( = ?auto_13657 ?auto_13658 ) ) ( OBJ-AT ?auto_13654 ?auto_13658 ) ( TRUCK-AT ?auto_13659 ?auto_13652 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_13659 ?auto_13652 ?auto_13658 ?auto_13656 )
      ( DELIVER-4PKG ?auto_13651 ?auto_13653 ?auto_13654 ?auto_13655 ?auto_13652 )
      ( DELIVER-4PKG-VERIFY ?auto_13651 ?auto_13653 ?auto_13654 ?auto_13655 ?auto_13652 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_13665 - OBJ
      ?auto_13667 - OBJ
      ?auto_13668 - OBJ
      ?auto_13669 - OBJ
      ?auto_13666 - LOCATION
    )
    :vars
    (
      ?auto_13672 - LOCATION
      ?auto_13671 - CITY
      ?auto_13670 - LOCATION
      ?auto_13673 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_13667 ?auto_13665 ) ( GREATER-THAN ?auto_13668 ?auto_13665 ) ( GREATER-THAN ?auto_13668 ?auto_13667 ) ( GREATER-THAN ?auto_13669 ?auto_13665 ) ( GREATER-THAN ?auto_13669 ?auto_13667 ) ( GREATER-THAN ?auto_13669 ?auto_13668 ) ( IN-CITY ?auto_13672 ?auto_13671 ) ( IN-CITY ?auto_13666 ?auto_13671 ) ( not ( = ?auto_13666 ?auto_13672 ) ) ( OBJ-AT ?auto_13669 ?auto_13672 ) ( OBJ-AT ?auto_13665 ?auto_13666 ) ( not ( = ?auto_13665 ?auto_13667 ) ) ( not ( = ?auto_13665 ?auto_13668 ) ) ( not ( = ?auto_13665 ?auto_13669 ) ) ( not ( = ?auto_13667 ?auto_13668 ) ) ( not ( = ?auto_13667 ?auto_13669 ) ) ( not ( = ?auto_13668 ?auto_13669 ) ) ( IN-CITY ?auto_13670 ?auto_13671 ) ( not ( = ?auto_13666 ?auto_13670 ) ) ( not ( = ?auto_13672 ?auto_13670 ) ) ( OBJ-AT ?auto_13668 ?auto_13670 ) ( TRUCK-AT ?auto_13673 ?auto_13666 ) ( IN-TRUCK ?auto_13667 ?auto_13673 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_13667 ?auto_13666 )
      ( DELIVER-4PKG ?auto_13665 ?auto_13667 ?auto_13668 ?auto_13669 ?auto_13666 )
      ( DELIVER-4PKG-VERIFY ?auto_13665 ?auto_13667 ?auto_13668 ?auto_13669 ?auto_13666 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_13679 - OBJ
      ?auto_13681 - OBJ
      ?auto_13682 - OBJ
      ?auto_13683 - OBJ
      ?auto_13680 - LOCATION
    )
    :vars
    (
      ?auto_13685 - LOCATION
      ?auto_13686 - CITY
      ?auto_13687 - LOCATION
      ?auto_13684 - TRUCK
      ?auto_13688 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_13681 ?auto_13679 ) ( GREATER-THAN ?auto_13682 ?auto_13679 ) ( GREATER-THAN ?auto_13682 ?auto_13681 ) ( GREATER-THAN ?auto_13683 ?auto_13679 ) ( GREATER-THAN ?auto_13683 ?auto_13681 ) ( GREATER-THAN ?auto_13683 ?auto_13682 ) ( IN-CITY ?auto_13685 ?auto_13686 ) ( IN-CITY ?auto_13680 ?auto_13686 ) ( not ( = ?auto_13680 ?auto_13685 ) ) ( OBJ-AT ?auto_13683 ?auto_13685 ) ( OBJ-AT ?auto_13679 ?auto_13680 ) ( not ( = ?auto_13679 ?auto_13681 ) ) ( not ( = ?auto_13679 ?auto_13682 ) ) ( not ( = ?auto_13679 ?auto_13683 ) ) ( not ( = ?auto_13681 ?auto_13682 ) ) ( not ( = ?auto_13681 ?auto_13683 ) ) ( not ( = ?auto_13682 ?auto_13683 ) ) ( IN-CITY ?auto_13687 ?auto_13686 ) ( not ( = ?auto_13680 ?auto_13687 ) ) ( not ( = ?auto_13685 ?auto_13687 ) ) ( OBJ-AT ?auto_13682 ?auto_13687 ) ( IN-TRUCK ?auto_13681 ?auto_13684 ) ( TRUCK-AT ?auto_13684 ?auto_13688 ) ( IN-CITY ?auto_13688 ?auto_13686 ) ( not ( = ?auto_13680 ?auto_13688 ) ) ( not ( = ?auto_13685 ?auto_13688 ) ) ( not ( = ?auto_13687 ?auto_13688 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_13684 ?auto_13688 ?auto_13680 ?auto_13686 )
      ( DELIVER-4PKG ?auto_13679 ?auto_13681 ?auto_13682 ?auto_13683 ?auto_13680 )
      ( DELIVER-4PKG-VERIFY ?auto_13679 ?auto_13681 ?auto_13682 ?auto_13683 ?auto_13680 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_13694 - OBJ
      ?auto_13696 - OBJ
      ?auto_13697 - OBJ
      ?auto_13698 - OBJ
      ?auto_13695 - LOCATION
    )
    :vars
    (
      ?auto_13702 - LOCATION
      ?auto_13699 - CITY
      ?auto_13700 - LOCATION
      ?auto_13701 - TRUCK
      ?auto_13703 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_13696 ?auto_13694 ) ( GREATER-THAN ?auto_13697 ?auto_13694 ) ( GREATER-THAN ?auto_13697 ?auto_13696 ) ( GREATER-THAN ?auto_13698 ?auto_13694 ) ( GREATER-THAN ?auto_13698 ?auto_13696 ) ( GREATER-THAN ?auto_13698 ?auto_13697 ) ( IN-CITY ?auto_13702 ?auto_13699 ) ( IN-CITY ?auto_13695 ?auto_13699 ) ( not ( = ?auto_13695 ?auto_13702 ) ) ( OBJ-AT ?auto_13698 ?auto_13702 ) ( OBJ-AT ?auto_13694 ?auto_13695 ) ( not ( = ?auto_13694 ?auto_13696 ) ) ( not ( = ?auto_13694 ?auto_13697 ) ) ( not ( = ?auto_13694 ?auto_13698 ) ) ( not ( = ?auto_13696 ?auto_13697 ) ) ( not ( = ?auto_13696 ?auto_13698 ) ) ( not ( = ?auto_13697 ?auto_13698 ) ) ( IN-CITY ?auto_13700 ?auto_13699 ) ( not ( = ?auto_13695 ?auto_13700 ) ) ( not ( = ?auto_13702 ?auto_13700 ) ) ( OBJ-AT ?auto_13697 ?auto_13700 ) ( TRUCK-AT ?auto_13701 ?auto_13703 ) ( IN-CITY ?auto_13703 ?auto_13699 ) ( not ( = ?auto_13695 ?auto_13703 ) ) ( not ( = ?auto_13702 ?auto_13703 ) ) ( not ( = ?auto_13700 ?auto_13703 ) ) ( OBJ-AT ?auto_13696 ?auto_13703 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_13696 ?auto_13701 ?auto_13703 )
      ( DELIVER-4PKG ?auto_13694 ?auto_13696 ?auto_13697 ?auto_13698 ?auto_13695 )
      ( DELIVER-4PKG-VERIFY ?auto_13694 ?auto_13696 ?auto_13697 ?auto_13698 ?auto_13695 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_13709 - OBJ
      ?auto_13711 - OBJ
      ?auto_13712 - OBJ
      ?auto_13713 - OBJ
      ?auto_13710 - LOCATION
    )
    :vars
    (
      ?auto_13715 - LOCATION
      ?auto_13718 - CITY
      ?auto_13716 - LOCATION
      ?auto_13717 - LOCATION
      ?auto_13714 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_13711 ?auto_13709 ) ( GREATER-THAN ?auto_13712 ?auto_13709 ) ( GREATER-THAN ?auto_13712 ?auto_13711 ) ( GREATER-THAN ?auto_13713 ?auto_13709 ) ( GREATER-THAN ?auto_13713 ?auto_13711 ) ( GREATER-THAN ?auto_13713 ?auto_13712 ) ( IN-CITY ?auto_13715 ?auto_13718 ) ( IN-CITY ?auto_13710 ?auto_13718 ) ( not ( = ?auto_13710 ?auto_13715 ) ) ( OBJ-AT ?auto_13713 ?auto_13715 ) ( OBJ-AT ?auto_13709 ?auto_13710 ) ( not ( = ?auto_13709 ?auto_13711 ) ) ( not ( = ?auto_13709 ?auto_13712 ) ) ( not ( = ?auto_13709 ?auto_13713 ) ) ( not ( = ?auto_13711 ?auto_13712 ) ) ( not ( = ?auto_13711 ?auto_13713 ) ) ( not ( = ?auto_13712 ?auto_13713 ) ) ( IN-CITY ?auto_13716 ?auto_13718 ) ( not ( = ?auto_13710 ?auto_13716 ) ) ( not ( = ?auto_13715 ?auto_13716 ) ) ( OBJ-AT ?auto_13712 ?auto_13716 ) ( IN-CITY ?auto_13717 ?auto_13718 ) ( not ( = ?auto_13710 ?auto_13717 ) ) ( not ( = ?auto_13715 ?auto_13717 ) ) ( not ( = ?auto_13716 ?auto_13717 ) ) ( OBJ-AT ?auto_13711 ?auto_13717 ) ( TRUCK-AT ?auto_13714 ?auto_13710 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_13714 ?auto_13710 ?auto_13717 ?auto_13718 )
      ( DELIVER-4PKG ?auto_13709 ?auto_13711 ?auto_13712 ?auto_13713 ?auto_13710 )
      ( DELIVER-4PKG-VERIFY ?auto_13709 ?auto_13711 ?auto_13712 ?auto_13713 ?auto_13710 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_13724 - OBJ
      ?auto_13726 - OBJ
      ?auto_13727 - OBJ
      ?auto_13728 - OBJ
      ?auto_13725 - LOCATION
    )
    :vars
    (
      ?auto_13731 - LOCATION
      ?auto_13729 - CITY
      ?auto_13733 - LOCATION
      ?auto_13730 - LOCATION
      ?auto_13732 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_13726 ?auto_13724 ) ( GREATER-THAN ?auto_13727 ?auto_13724 ) ( GREATER-THAN ?auto_13727 ?auto_13726 ) ( GREATER-THAN ?auto_13728 ?auto_13724 ) ( GREATER-THAN ?auto_13728 ?auto_13726 ) ( GREATER-THAN ?auto_13728 ?auto_13727 ) ( IN-CITY ?auto_13731 ?auto_13729 ) ( IN-CITY ?auto_13725 ?auto_13729 ) ( not ( = ?auto_13725 ?auto_13731 ) ) ( OBJ-AT ?auto_13728 ?auto_13731 ) ( not ( = ?auto_13724 ?auto_13726 ) ) ( not ( = ?auto_13724 ?auto_13727 ) ) ( not ( = ?auto_13724 ?auto_13728 ) ) ( not ( = ?auto_13726 ?auto_13727 ) ) ( not ( = ?auto_13726 ?auto_13728 ) ) ( not ( = ?auto_13727 ?auto_13728 ) ) ( IN-CITY ?auto_13733 ?auto_13729 ) ( not ( = ?auto_13725 ?auto_13733 ) ) ( not ( = ?auto_13731 ?auto_13733 ) ) ( OBJ-AT ?auto_13727 ?auto_13733 ) ( IN-CITY ?auto_13730 ?auto_13729 ) ( not ( = ?auto_13725 ?auto_13730 ) ) ( not ( = ?auto_13731 ?auto_13730 ) ) ( not ( = ?auto_13733 ?auto_13730 ) ) ( OBJ-AT ?auto_13726 ?auto_13730 ) ( TRUCK-AT ?auto_13732 ?auto_13725 ) ( IN-TRUCK ?auto_13724 ?auto_13732 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_13724 ?auto_13725 )
      ( DELIVER-4PKG ?auto_13724 ?auto_13726 ?auto_13727 ?auto_13728 ?auto_13725 )
      ( DELIVER-4PKG-VERIFY ?auto_13724 ?auto_13726 ?auto_13727 ?auto_13728 ?auto_13725 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_13739 - OBJ
      ?auto_13741 - OBJ
      ?auto_13742 - OBJ
      ?auto_13743 - OBJ
      ?auto_13740 - LOCATION
    )
    :vars
    (
      ?auto_13745 - LOCATION
      ?auto_13748 - CITY
      ?auto_13747 - LOCATION
      ?auto_13744 - LOCATION
      ?auto_13746 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_13741 ?auto_13739 ) ( GREATER-THAN ?auto_13742 ?auto_13739 ) ( GREATER-THAN ?auto_13742 ?auto_13741 ) ( GREATER-THAN ?auto_13743 ?auto_13739 ) ( GREATER-THAN ?auto_13743 ?auto_13741 ) ( GREATER-THAN ?auto_13743 ?auto_13742 ) ( IN-CITY ?auto_13745 ?auto_13748 ) ( IN-CITY ?auto_13740 ?auto_13748 ) ( not ( = ?auto_13740 ?auto_13745 ) ) ( OBJ-AT ?auto_13743 ?auto_13745 ) ( not ( = ?auto_13739 ?auto_13741 ) ) ( not ( = ?auto_13739 ?auto_13742 ) ) ( not ( = ?auto_13739 ?auto_13743 ) ) ( not ( = ?auto_13741 ?auto_13742 ) ) ( not ( = ?auto_13741 ?auto_13743 ) ) ( not ( = ?auto_13742 ?auto_13743 ) ) ( IN-CITY ?auto_13747 ?auto_13748 ) ( not ( = ?auto_13740 ?auto_13747 ) ) ( not ( = ?auto_13745 ?auto_13747 ) ) ( OBJ-AT ?auto_13742 ?auto_13747 ) ( IN-CITY ?auto_13744 ?auto_13748 ) ( not ( = ?auto_13740 ?auto_13744 ) ) ( not ( = ?auto_13745 ?auto_13744 ) ) ( not ( = ?auto_13747 ?auto_13744 ) ) ( OBJ-AT ?auto_13741 ?auto_13744 ) ( IN-TRUCK ?auto_13739 ?auto_13746 ) ( TRUCK-AT ?auto_13746 ?auto_13744 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_13746 ?auto_13744 ?auto_13740 ?auto_13748 )
      ( DELIVER-4PKG ?auto_13739 ?auto_13741 ?auto_13742 ?auto_13743 ?auto_13740 )
      ( DELIVER-4PKG-VERIFY ?auto_13739 ?auto_13741 ?auto_13742 ?auto_13743 ?auto_13740 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_13754 - OBJ
      ?auto_13756 - OBJ
      ?auto_13757 - OBJ
      ?auto_13758 - OBJ
      ?auto_13755 - LOCATION
    )
    :vars
    (
      ?auto_13761 - LOCATION
      ?auto_13762 - CITY
      ?auto_13759 - LOCATION
      ?auto_13763 - LOCATION
      ?auto_13760 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_13756 ?auto_13754 ) ( GREATER-THAN ?auto_13757 ?auto_13754 ) ( GREATER-THAN ?auto_13757 ?auto_13756 ) ( GREATER-THAN ?auto_13758 ?auto_13754 ) ( GREATER-THAN ?auto_13758 ?auto_13756 ) ( GREATER-THAN ?auto_13758 ?auto_13757 ) ( IN-CITY ?auto_13761 ?auto_13762 ) ( IN-CITY ?auto_13755 ?auto_13762 ) ( not ( = ?auto_13755 ?auto_13761 ) ) ( OBJ-AT ?auto_13758 ?auto_13761 ) ( not ( = ?auto_13754 ?auto_13756 ) ) ( not ( = ?auto_13754 ?auto_13757 ) ) ( not ( = ?auto_13754 ?auto_13758 ) ) ( not ( = ?auto_13756 ?auto_13757 ) ) ( not ( = ?auto_13756 ?auto_13758 ) ) ( not ( = ?auto_13757 ?auto_13758 ) ) ( IN-CITY ?auto_13759 ?auto_13762 ) ( not ( = ?auto_13755 ?auto_13759 ) ) ( not ( = ?auto_13761 ?auto_13759 ) ) ( OBJ-AT ?auto_13757 ?auto_13759 ) ( IN-CITY ?auto_13763 ?auto_13762 ) ( not ( = ?auto_13755 ?auto_13763 ) ) ( not ( = ?auto_13761 ?auto_13763 ) ) ( not ( = ?auto_13759 ?auto_13763 ) ) ( OBJ-AT ?auto_13756 ?auto_13763 ) ( TRUCK-AT ?auto_13760 ?auto_13763 ) ( OBJ-AT ?auto_13754 ?auto_13763 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_13754 ?auto_13760 ?auto_13763 )
      ( DELIVER-4PKG ?auto_13754 ?auto_13756 ?auto_13757 ?auto_13758 ?auto_13755 )
      ( DELIVER-4PKG-VERIFY ?auto_13754 ?auto_13756 ?auto_13757 ?auto_13758 ?auto_13755 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_13769 - OBJ
      ?auto_13771 - OBJ
      ?auto_13772 - OBJ
      ?auto_13773 - OBJ
      ?auto_13770 - LOCATION
    )
    :vars
    (
      ?auto_13777 - LOCATION
      ?auto_13774 - CITY
      ?auto_13778 - LOCATION
      ?auto_13776 - LOCATION
      ?auto_13775 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_13771 ?auto_13769 ) ( GREATER-THAN ?auto_13772 ?auto_13769 ) ( GREATER-THAN ?auto_13772 ?auto_13771 ) ( GREATER-THAN ?auto_13773 ?auto_13769 ) ( GREATER-THAN ?auto_13773 ?auto_13771 ) ( GREATER-THAN ?auto_13773 ?auto_13772 ) ( IN-CITY ?auto_13777 ?auto_13774 ) ( IN-CITY ?auto_13770 ?auto_13774 ) ( not ( = ?auto_13770 ?auto_13777 ) ) ( OBJ-AT ?auto_13773 ?auto_13777 ) ( not ( = ?auto_13769 ?auto_13771 ) ) ( not ( = ?auto_13769 ?auto_13772 ) ) ( not ( = ?auto_13769 ?auto_13773 ) ) ( not ( = ?auto_13771 ?auto_13772 ) ) ( not ( = ?auto_13771 ?auto_13773 ) ) ( not ( = ?auto_13772 ?auto_13773 ) ) ( IN-CITY ?auto_13778 ?auto_13774 ) ( not ( = ?auto_13770 ?auto_13778 ) ) ( not ( = ?auto_13777 ?auto_13778 ) ) ( OBJ-AT ?auto_13772 ?auto_13778 ) ( IN-CITY ?auto_13776 ?auto_13774 ) ( not ( = ?auto_13770 ?auto_13776 ) ) ( not ( = ?auto_13777 ?auto_13776 ) ) ( not ( = ?auto_13778 ?auto_13776 ) ) ( OBJ-AT ?auto_13771 ?auto_13776 ) ( OBJ-AT ?auto_13769 ?auto_13776 ) ( TRUCK-AT ?auto_13775 ?auto_13770 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_13775 ?auto_13770 ?auto_13776 ?auto_13774 )
      ( DELIVER-4PKG ?auto_13769 ?auto_13771 ?auto_13772 ?auto_13773 ?auto_13770 )
      ( DELIVER-4PKG-VERIFY ?auto_13769 ?auto_13771 ?auto_13772 ?auto_13773 ?auto_13770 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_13811 - OBJ
      ?auto_13813 - OBJ
      ?auto_13814 - OBJ
      ?auto_13815 - OBJ
      ?auto_13816 - OBJ
      ?auto_13812 - LOCATION
    )
    :vars
    (
      ?auto_13817 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_13813 ?auto_13811 ) ( GREATER-THAN ?auto_13814 ?auto_13811 ) ( GREATER-THAN ?auto_13814 ?auto_13813 ) ( GREATER-THAN ?auto_13815 ?auto_13811 ) ( GREATER-THAN ?auto_13815 ?auto_13813 ) ( GREATER-THAN ?auto_13815 ?auto_13814 ) ( GREATER-THAN ?auto_13816 ?auto_13811 ) ( GREATER-THAN ?auto_13816 ?auto_13813 ) ( GREATER-THAN ?auto_13816 ?auto_13814 ) ( GREATER-THAN ?auto_13816 ?auto_13815 ) ( TRUCK-AT ?auto_13817 ?auto_13812 ) ( IN-TRUCK ?auto_13816 ?auto_13817 ) ( OBJ-AT ?auto_13811 ?auto_13812 ) ( OBJ-AT ?auto_13813 ?auto_13812 ) ( OBJ-AT ?auto_13814 ?auto_13812 ) ( OBJ-AT ?auto_13815 ?auto_13812 ) ( not ( = ?auto_13811 ?auto_13813 ) ) ( not ( = ?auto_13811 ?auto_13814 ) ) ( not ( = ?auto_13811 ?auto_13815 ) ) ( not ( = ?auto_13811 ?auto_13816 ) ) ( not ( = ?auto_13813 ?auto_13814 ) ) ( not ( = ?auto_13813 ?auto_13815 ) ) ( not ( = ?auto_13813 ?auto_13816 ) ) ( not ( = ?auto_13814 ?auto_13815 ) ) ( not ( = ?auto_13814 ?auto_13816 ) ) ( not ( = ?auto_13815 ?auto_13816 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_13816 ?auto_13812 )
      ( DELIVER-5PKG-VERIFY ?auto_13811 ?auto_13813 ?auto_13814 ?auto_13815 ?auto_13816 ?auto_13812 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_13824 - OBJ
      ?auto_13826 - OBJ
      ?auto_13827 - OBJ
      ?auto_13828 - OBJ
      ?auto_13829 - OBJ
      ?auto_13825 - LOCATION
    )
    :vars
    (
      ?auto_13832 - TRUCK
      ?auto_13831 - LOCATION
      ?auto_13830 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_13826 ?auto_13824 ) ( GREATER-THAN ?auto_13827 ?auto_13824 ) ( GREATER-THAN ?auto_13827 ?auto_13826 ) ( GREATER-THAN ?auto_13828 ?auto_13824 ) ( GREATER-THAN ?auto_13828 ?auto_13826 ) ( GREATER-THAN ?auto_13828 ?auto_13827 ) ( GREATER-THAN ?auto_13829 ?auto_13824 ) ( GREATER-THAN ?auto_13829 ?auto_13826 ) ( GREATER-THAN ?auto_13829 ?auto_13827 ) ( GREATER-THAN ?auto_13829 ?auto_13828 ) ( IN-TRUCK ?auto_13829 ?auto_13832 ) ( TRUCK-AT ?auto_13832 ?auto_13831 ) ( IN-CITY ?auto_13831 ?auto_13830 ) ( IN-CITY ?auto_13825 ?auto_13830 ) ( not ( = ?auto_13825 ?auto_13831 ) ) ( OBJ-AT ?auto_13824 ?auto_13825 ) ( OBJ-AT ?auto_13826 ?auto_13825 ) ( OBJ-AT ?auto_13827 ?auto_13825 ) ( OBJ-AT ?auto_13828 ?auto_13825 ) ( not ( = ?auto_13824 ?auto_13826 ) ) ( not ( = ?auto_13824 ?auto_13827 ) ) ( not ( = ?auto_13824 ?auto_13828 ) ) ( not ( = ?auto_13824 ?auto_13829 ) ) ( not ( = ?auto_13826 ?auto_13827 ) ) ( not ( = ?auto_13826 ?auto_13828 ) ) ( not ( = ?auto_13826 ?auto_13829 ) ) ( not ( = ?auto_13827 ?auto_13828 ) ) ( not ( = ?auto_13827 ?auto_13829 ) ) ( not ( = ?auto_13828 ?auto_13829 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_13829 ?auto_13825 )
      ( DELIVER-5PKG-VERIFY ?auto_13824 ?auto_13826 ?auto_13827 ?auto_13828 ?auto_13829 ?auto_13825 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_13839 - OBJ
      ?auto_13841 - OBJ
      ?auto_13842 - OBJ
      ?auto_13843 - OBJ
      ?auto_13844 - OBJ
      ?auto_13840 - LOCATION
    )
    :vars
    (
      ?auto_13847 - TRUCK
      ?auto_13846 - LOCATION
      ?auto_13845 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_13841 ?auto_13839 ) ( GREATER-THAN ?auto_13842 ?auto_13839 ) ( GREATER-THAN ?auto_13842 ?auto_13841 ) ( GREATER-THAN ?auto_13843 ?auto_13839 ) ( GREATER-THAN ?auto_13843 ?auto_13841 ) ( GREATER-THAN ?auto_13843 ?auto_13842 ) ( GREATER-THAN ?auto_13844 ?auto_13839 ) ( GREATER-THAN ?auto_13844 ?auto_13841 ) ( GREATER-THAN ?auto_13844 ?auto_13842 ) ( GREATER-THAN ?auto_13844 ?auto_13843 ) ( TRUCK-AT ?auto_13847 ?auto_13846 ) ( IN-CITY ?auto_13846 ?auto_13845 ) ( IN-CITY ?auto_13840 ?auto_13845 ) ( not ( = ?auto_13840 ?auto_13846 ) ) ( OBJ-AT ?auto_13844 ?auto_13846 ) ( OBJ-AT ?auto_13839 ?auto_13840 ) ( OBJ-AT ?auto_13841 ?auto_13840 ) ( OBJ-AT ?auto_13842 ?auto_13840 ) ( OBJ-AT ?auto_13843 ?auto_13840 ) ( not ( = ?auto_13839 ?auto_13841 ) ) ( not ( = ?auto_13839 ?auto_13842 ) ) ( not ( = ?auto_13839 ?auto_13843 ) ) ( not ( = ?auto_13839 ?auto_13844 ) ) ( not ( = ?auto_13841 ?auto_13842 ) ) ( not ( = ?auto_13841 ?auto_13843 ) ) ( not ( = ?auto_13841 ?auto_13844 ) ) ( not ( = ?auto_13842 ?auto_13843 ) ) ( not ( = ?auto_13842 ?auto_13844 ) ) ( not ( = ?auto_13843 ?auto_13844 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_13844 ?auto_13840 )
      ( DELIVER-5PKG-VERIFY ?auto_13839 ?auto_13841 ?auto_13842 ?auto_13843 ?auto_13844 ?auto_13840 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_13854 - OBJ
      ?auto_13856 - OBJ
      ?auto_13857 - OBJ
      ?auto_13858 - OBJ
      ?auto_13859 - OBJ
      ?auto_13855 - LOCATION
    )
    :vars
    (
      ?auto_13862 - LOCATION
      ?auto_13861 - CITY
      ?auto_13860 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_13856 ?auto_13854 ) ( GREATER-THAN ?auto_13857 ?auto_13854 ) ( GREATER-THAN ?auto_13857 ?auto_13856 ) ( GREATER-THAN ?auto_13858 ?auto_13854 ) ( GREATER-THAN ?auto_13858 ?auto_13856 ) ( GREATER-THAN ?auto_13858 ?auto_13857 ) ( GREATER-THAN ?auto_13859 ?auto_13854 ) ( GREATER-THAN ?auto_13859 ?auto_13856 ) ( GREATER-THAN ?auto_13859 ?auto_13857 ) ( GREATER-THAN ?auto_13859 ?auto_13858 ) ( IN-CITY ?auto_13862 ?auto_13861 ) ( IN-CITY ?auto_13855 ?auto_13861 ) ( not ( = ?auto_13855 ?auto_13862 ) ) ( OBJ-AT ?auto_13859 ?auto_13862 ) ( TRUCK-AT ?auto_13860 ?auto_13855 ) ( OBJ-AT ?auto_13854 ?auto_13855 ) ( OBJ-AT ?auto_13856 ?auto_13855 ) ( OBJ-AT ?auto_13857 ?auto_13855 ) ( OBJ-AT ?auto_13858 ?auto_13855 ) ( not ( = ?auto_13854 ?auto_13856 ) ) ( not ( = ?auto_13854 ?auto_13857 ) ) ( not ( = ?auto_13854 ?auto_13858 ) ) ( not ( = ?auto_13854 ?auto_13859 ) ) ( not ( = ?auto_13856 ?auto_13857 ) ) ( not ( = ?auto_13856 ?auto_13858 ) ) ( not ( = ?auto_13856 ?auto_13859 ) ) ( not ( = ?auto_13857 ?auto_13858 ) ) ( not ( = ?auto_13857 ?auto_13859 ) ) ( not ( = ?auto_13858 ?auto_13859 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_13859 ?auto_13855 )
      ( DELIVER-5PKG-VERIFY ?auto_13854 ?auto_13856 ?auto_13857 ?auto_13858 ?auto_13859 ?auto_13855 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_13869 - OBJ
      ?auto_13871 - OBJ
      ?auto_13872 - OBJ
      ?auto_13873 - OBJ
      ?auto_13874 - OBJ
      ?auto_13870 - LOCATION
    )
    :vars
    (
      ?auto_13875 - LOCATION
      ?auto_13876 - CITY
      ?auto_13877 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_13871 ?auto_13869 ) ( GREATER-THAN ?auto_13872 ?auto_13869 ) ( GREATER-THAN ?auto_13872 ?auto_13871 ) ( GREATER-THAN ?auto_13873 ?auto_13869 ) ( GREATER-THAN ?auto_13873 ?auto_13871 ) ( GREATER-THAN ?auto_13873 ?auto_13872 ) ( GREATER-THAN ?auto_13874 ?auto_13869 ) ( GREATER-THAN ?auto_13874 ?auto_13871 ) ( GREATER-THAN ?auto_13874 ?auto_13872 ) ( GREATER-THAN ?auto_13874 ?auto_13873 ) ( IN-CITY ?auto_13875 ?auto_13876 ) ( IN-CITY ?auto_13870 ?auto_13876 ) ( not ( = ?auto_13870 ?auto_13875 ) ) ( OBJ-AT ?auto_13874 ?auto_13875 ) ( TRUCK-AT ?auto_13877 ?auto_13870 ) ( OBJ-AT ?auto_13869 ?auto_13870 ) ( OBJ-AT ?auto_13871 ?auto_13870 ) ( OBJ-AT ?auto_13872 ?auto_13870 ) ( not ( = ?auto_13869 ?auto_13871 ) ) ( not ( = ?auto_13869 ?auto_13872 ) ) ( not ( = ?auto_13869 ?auto_13873 ) ) ( not ( = ?auto_13869 ?auto_13874 ) ) ( not ( = ?auto_13871 ?auto_13872 ) ) ( not ( = ?auto_13871 ?auto_13873 ) ) ( not ( = ?auto_13871 ?auto_13874 ) ) ( not ( = ?auto_13872 ?auto_13873 ) ) ( not ( = ?auto_13872 ?auto_13874 ) ) ( not ( = ?auto_13873 ?auto_13874 ) ) ( IN-TRUCK ?auto_13873 ?auto_13877 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_13873 ?auto_13870 )
      ( DELIVER-5PKG ?auto_13869 ?auto_13871 ?auto_13872 ?auto_13873 ?auto_13874 ?auto_13870 )
      ( DELIVER-5PKG-VERIFY ?auto_13869 ?auto_13871 ?auto_13872 ?auto_13873 ?auto_13874 ?auto_13870 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_13884 - OBJ
      ?auto_13886 - OBJ
      ?auto_13887 - OBJ
      ?auto_13888 - OBJ
      ?auto_13889 - OBJ
      ?auto_13885 - LOCATION
    )
    :vars
    (
      ?auto_13890 - LOCATION
      ?auto_13892 - CITY
      ?auto_13891 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_13886 ?auto_13884 ) ( GREATER-THAN ?auto_13887 ?auto_13884 ) ( GREATER-THAN ?auto_13887 ?auto_13886 ) ( GREATER-THAN ?auto_13888 ?auto_13884 ) ( GREATER-THAN ?auto_13888 ?auto_13886 ) ( GREATER-THAN ?auto_13888 ?auto_13887 ) ( GREATER-THAN ?auto_13889 ?auto_13884 ) ( GREATER-THAN ?auto_13889 ?auto_13886 ) ( GREATER-THAN ?auto_13889 ?auto_13887 ) ( GREATER-THAN ?auto_13889 ?auto_13888 ) ( IN-CITY ?auto_13890 ?auto_13892 ) ( IN-CITY ?auto_13885 ?auto_13892 ) ( not ( = ?auto_13885 ?auto_13890 ) ) ( OBJ-AT ?auto_13889 ?auto_13890 ) ( OBJ-AT ?auto_13884 ?auto_13885 ) ( OBJ-AT ?auto_13886 ?auto_13885 ) ( OBJ-AT ?auto_13887 ?auto_13885 ) ( not ( = ?auto_13884 ?auto_13886 ) ) ( not ( = ?auto_13884 ?auto_13887 ) ) ( not ( = ?auto_13884 ?auto_13888 ) ) ( not ( = ?auto_13884 ?auto_13889 ) ) ( not ( = ?auto_13886 ?auto_13887 ) ) ( not ( = ?auto_13886 ?auto_13888 ) ) ( not ( = ?auto_13886 ?auto_13889 ) ) ( not ( = ?auto_13887 ?auto_13888 ) ) ( not ( = ?auto_13887 ?auto_13889 ) ) ( not ( = ?auto_13888 ?auto_13889 ) ) ( IN-TRUCK ?auto_13888 ?auto_13891 ) ( TRUCK-AT ?auto_13891 ?auto_13890 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_13891 ?auto_13890 ?auto_13885 ?auto_13892 )
      ( DELIVER-5PKG ?auto_13884 ?auto_13886 ?auto_13887 ?auto_13888 ?auto_13889 ?auto_13885 )
      ( DELIVER-5PKG-VERIFY ?auto_13884 ?auto_13886 ?auto_13887 ?auto_13888 ?auto_13889 ?auto_13885 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_13899 - OBJ
      ?auto_13901 - OBJ
      ?auto_13902 - OBJ
      ?auto_13903 - OBJ
      ?auto_13904 - OBJ
      ?auto_13900 - LOCATION
    )
    :vars
    (
      ?auto_13907 - LOCATION
      ?auto_13906 - CITY
      ?auto_13905 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_13901 ?auto_13899 ) ( GREATER-THAN ?auto_13902 ?auto_13899 ) ( GREATER-THAN ?auto_13902 ?auto_13901 ) ( GREATER-THAN ?auto_13903 ?auto_13899 ) ( GREATER-THAN ?auto_13903 ?auto_13901 ) ( GREATER-THAN ?auto_13903 ?auto_13902 ) ( GREATER-THAN ?auto_13904 ?auto_13899 ) ( GREATER-THAN ?auto_13904 ?auto_13901 ) ( GREATER-THAN ?auto_13904 ?auto_13902 ) ( GREATER-THAN ?auto_13904 ?auto_13903 ) ( IN-CITY ?auto_13907 ?auto_13906 ) ( IN-CITY ?auto_13900 ?auto_13906 ) ( not ( = ?auto_13900 ?auto_13907 ) ) ( OBJ-AT ?auto_13904 ?auto_13907 ) ( OBJ-AT ?auto_13899 ?auto_13900 ) ( OBJ-AT ?auto_13901 ?auto_13900 ) ( OBJ-AT ?auto_13902 ?auto_13900 ) ( not ( = ?auto_13899 ?auto_13901 ) ) ( not ( = ?auto_13899 ?auto_13902 ) ) ( not ( = ?auto_13899 ?auto_13903 ) ) ( not ( = ?auto_13899 ?auto_13904 ) ) ( not ( = ?auto_13901 ?auto_13902 ) ) ( not ( = ?auto_13901 ?auto_13903 ) ) ( not ( = ?auto_13901 ?auto_13904 ) ) ( not ( = ?auto_13902 ?auto_13903 ) ) ( not ( = ?auto_13902 ?auto_13904 ) ) ( not ( = ?auto_13903 ?auto_13904 ) ) ( TRUCK-AT ?auto_13905 ?auto_13907 ) ( OBJ-AT ?auto_13903 ?auto_13907 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_13903 ?auto_13905 ?auto_13907 )
      ( DELIVER-5PKG ?auto_13899 ?auto_13901 ?auto_13902 ?auto_13903 ?auto_13904 ?auto_13900 )
      ( DELIVER-5PKG-VERIFY ?auto_13899 ?auto_13901 ?auto_13902 ?auto_13903 ?auto_13904 ?auto_13900 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_13914 - OBJ
      ?auto_13916 - OBJ
      ?auto_13917 - OBJ
      ?auto_13918 - OBJ
      ?auto_13919 - OBJ
      ?auto_13915 - LOCATION
    )
    :vars
    (
      ?auto_13920 - LOCATION
      ?auto_13922 - CITY
      ?auto_13921 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_13916 ?auto_13914 ) ( GREATER-THAN ?auto_13917 ?auto_13914 ) ( GREATER-THAN ?auto_13917 ?auto_13916 ) ( GREATER-THAN ?auto_13918 ?auto_13914 ) ( GREATER-THAN ?auto_13918 ?auto_13916 ) ( GREATER-THAN ?auto_13918 ?auto_13917 ) ( GREATER-THAN ?auto_13919 ?auto_13914 ) ( GREATER-THAN ?auto_13919 ?auto_13916 ) ( GREATER-THAN ?auto_13919 ?auto_13917 ) ( GREATER-THAN ?auto_13919 ?auto_13918 ) ( IN-CITY ?auto_13920 ?auto_13922 ) ( IN-CITY ?auto_13915 ?auto_13922 ) ( not ( = ?auto_13915 ?auto_13920 ) ) ( OBJ-AT ?auto_13919 ?auto_13920 ) ( OBJ-AT ?auto_13914 ?auto_13915 ) ( OBJ-AT ?auto_13916 ?auto_13915 ) ( OBJ-AT ?auto_13917 ?auto_13915 ) ( not ( = ?auto_13914 ?auto_13916 ) ) ( not ( = ?auto_13914 ?auto_13917 ) ) ( not ( = ?auto_13914 ?auto_13918 ) ) ( not ( = ?auto_13914 ?auto_13919 ) ) ( not ( = ?auto_13916 ?auto_13917 ) ) ( not ( = ?auto_13916 ?auto_13918 ) ) ( not ( = ?auto_13916 ?auto_13919 ) ) ( not ( = ?auto_13917 ?auto_13918 ) ) ( not ( = ?auto_13917 ?auto_13919 ) ) ( not ( = ?auto_13918 ?auto_13919 ) ) ( OBJ-AT ?auto_13918 ?auto_13920 ) ( TRUCK-AT ?auto_13921 ?auto_13915 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_13921 ?auto_13915 ?auto_13920 ?auto_13922 )
      ( DELIVER-5PKG ?auto_13914 ?auto_13916 ?auto_13917 ?auto_13918 ?auto_13919 ?auto_13915 )
      ( DELIVER-5PKG-VERIFY ?auto_13914 ?auto_13916 ?auto_13917 ?auto_13918 ?auto_13919 ?auto_13915 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_13929 - OBJ
      ?auto_13931 - OBJ
      ?auto_13932 - OBJ
      ?auto_13933 - OBJ
      ?auto_13934 - OBJ
      ?auto_13930 - LOCATION
    )
    :vars
    (
      ?auto_13937 - LOCATION
      ?auto_13936 - CITY
      ?auto_13935 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_13931 ?auto_13929 ) ( GREATER-THAN ?auto_13932 ?auto_13929 ) ( GREATER-THAN ?auto_13932 ?auto_13931 ) ( GREATER-THAN ?auto_13933 ?auto_13929 ) ( GREATER-THAN ?auto_13933 ?auto_13931 ) ( GREATER-THAN ?auto_13933 ?auto_13932 ) ( GREATER-THAN ?auto_13934 ?auto_13929 ) ( GREATER-THAN ?auto_13934 ?auto_13931 ) ( GREATER-THAN ?auto_13934 ?auto_13932 ) ( GREATER-THAN ?auto_13934 ?auto_13933 ) ( IN-CITY ?auto_13937 ?auto_13936 ) ( IN-CITY ?auto_13930 ?auto_13936 ) ( not ( = ?auto_13930 ?auto_13937 ) ) ( OBJ-AT ?auto_13934 ?auto_13937 ) ( OBJ-AT ?auto_13929 ?auto_13930 ) ( OBJ-AT ?auto_13931 ?auto_13930 ) ( not ( = ?auto_13929 ?auto_13931 ) ) ( not ( = ?auto_13929 ?auto_13932 ) ) ( not ( = ?auto_13929 ?auto_13933 ) ) ( not ( = ?auto_13929 ?auto_13934 ) ) ( not ( = ?auto_13931 ?auto_13932 ) ) ( not ( = ?auto_13931 ?auto_13933 ) ) ( not ( = ?auto_13931 ?auto_13934 ) ) ( not ( = ?auto_13932 ?auto_13933 ) ) ( not ( = ?auto_13932 ?auto_13934 ) ) ( not ( = ?auto_13933 ?auto_13934 ) ) ( OBJ-AT ?auto_13933 ?auto_13937 ) ( TRUCK-AT ?auto_13935 ?auto_13930 ) ( IN-TRUCK ?auto_13932 ?auto_13935 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_13932 ?auto_13930 )
      ( DELIVER-5PKG ?auto_13929 ?auto_13931 ?auto_13932 ?auto_13933 ?auto_13934 ?auto_13930 )
      ( DELIVER-5PKG-VERIFY ?auto_13929 ?auto_13931 ?auto_13932 ?auto_13933 ?auto_13934 ?auto_13930 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_13944 - OBJ
      ?auto_13946 - OBJ
      ?auto_13947 - OBJ
      ?auto_13948 - OBJ
      ?auto_13949 - OBJ
      ?auto_13945 - LOCATION
    )
    :vars
    (
      ?auto_13951 - LOCATION
      ?auto_13952 - CITY
      ?auto_13950 - TRUCK
      ?auto_13953 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_13946 ?auto_13944 ) ( GREATER-THAN ?auto_13947 ?auto_13944 ) ( GREATER-THAN ?auto_13947 ?auto_13946 ) ( GREATER-THAN ?auto_13948 ?auto_13944 ) ( GREATER-THAN ?auto_13948 ?auto_13946 ) ( GREATER-THAN ?auto_13948 ?auto_13947 ) ( GREATER-THAN ?auto_13949 ?auto_13944 ) ( GREATER-THAN ?auto_13949 ?auto_13946 ) ( GREATER-THAN ?auto_13949 ?auto_13947 ) ( GREATER-THAN ?auto_13949 ?auto_13948 ) ( IN-CITY ?auto_13951 ?auto_13952 ) ( IN-CITY ?auto_13945 ?auto_13952 ) ( not ( = ?auto_13945 ?auto_13951 ) ) ( OBJ-AT ?auto_13949 ?auto_13951 ) ( OBJ-AT ?auto_13944 ?auto_13945 ) ( OBJ-AT ?auto_13946 ?auto_13945 ) ( not ( = ?auto_13944 ?auto_13946 ) ) ( not ( = ?auto_13944 ?auto_13947 ) ) ( not ( = ?auto_13944 ?auto_13948 ) ) ( not ( = ?auto_13944 ?auto_13949 ) ) ( not ( = ?auto_13946 ?auto_13947 ) ) ( not ( = ?auto_13946 ?auto_13948 ) ) ( not ( = ?auto_13946 ?auto_13949 ) ) ( not ( = ?auto_13947 ?auto_13948 ) ) ( not ( = ?auto_13947 ?auto_13949 ) ) ( not ( = ?auto_13948 ?auto_13949 ) ) ( OBJ-AT ?auto_13948 ?auto_13951 ) ( IN-TRUCK ?auto_13947 ?auto_13950 ) ( TRUCK-AT ?auto_13950 ?auto_13953 ) ( IN-CITY ?auto_13953 ?auto_13952 ) ( not ( = ?auto_13945 ?auto_13953 ) ) ( not ( = ?auto_13951 ?auto_13953 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_13950 ?auto_13953 ?auto_13945 ?auto_13952 )
      ( DELIVER-5PKG ?auto_13944 ?auto_13946 ?auto_13947 ?auto_13948 ?auto_13949 ?auto_13945 )
      ( DELIVER-5PKG-VERIFY ?auto_13944 ?auto_13946 ?auto_13947 ?auto_13948 ?auto_13949 ?auto_13945 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_13960 - OBJ
      ?auto_13962 - OBJ
      ?auto_13963 - OBJ
      ?auto_13964 - OBJ
      ?auto_13965 - OBJ
      ?auto_13961 - LOCATION
    )
    :vars
    (
      ?auto_13969 - LOCATION
      ?auto_13966 - CITY
      ?auto_13968 - TRUCK
      ?auto_13967 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_13962 ?auto_13960 ) ( GREATER-THAN ?auto_13963 ?auto_13960 ) ( GREATER-THAN ?auto_13963 ?auto_13962 ) ( GREATER-THAN ?auto_13964 ?auto_13960 ) ( GREATER-THAN ?auto_13964 ?auto_13962 ) ( GREATER-THAN ?auto_13964 ?auto_13963 ) ( GREATER-THAN ?auto_13965 ?auto_13960 ) ( GREATER-THAN ?auto_13965 ?auto_13962 ) ( GREATER-THAN ?auto_13965 ?auto_13963 ) ( GREATER-THAN ?auto_13965 ?auto_13964 ) ( IN-CITY ?auto_13969 ?auto_13966 ) ( IN-CITY ?auto_13961 ?auto_13966 ) ( not ( = ?auto_13961 ?auto_13969 ) ) ( OBJ-AT ?auto_13965 ?auto_13969 ) ( OBJ-AT ?auto_13960 ?auto_13961 ) ( OBJ-AT ?auto_13962 ?auto_13961 ) ( not ( = ?auto_13960 ?auto_13962 ) ) ( not ( = ?auto_13960 ?auto_13963 ) ) ( not ( = ?auto_13960 ?auto_13964 ) ) ( not ( = ?auto_13960 ?auto_13965 ) ) ( not ( = ?auto_13962 ?auto_13963 ) ) ( not ( = ?auto_13962 ?auto_13964 ) ) ( not ( = ?auto_13962 ?auto_13965 ) ) ( not ( = ?auto_13963 ?auto_13964 ) ) ( not ( = ?auto_13963 ?auto_13965 ) ) ( not ( = ?auto_13964 ?auto_13965 ) ) ( OBJ-AT ?auto_13964 ?auto_13969 ) ( TRUCK-AT ?auto_13968 ?auto_13967 ) ( IN-CITY ?auto_13967 ?auto_13966 ) ( not ( = ?auto_13961 ?auto_13967 ) ) ( not ( = ?auto_13969 ?auto_13967 ) ) ( OBJ-AT ?auto_13963 ?auto_13967 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_13963 ?auto_13968 ?auto_13967 )
      ( DELIVER-5PKG ?auto_13960 ?auto_13962 ?auto_13963 ?auto_13964 ?auto_13965 ?auto_13961 )
      ( DELIVER-5PKG-VERIFY ?auto_13960 ?auto_13962 ?auto_13963 ?auto_13964 ?auto_13965 ?auto_13961 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_13976 - OBJ
      ?auto_13978 - OBJ
      ?auto_13979 - OBJ
      ?auto_13980 - OBJ
      ?auto_13981 - OBJ
      ?auto_13977 - LOCATION
    )
    :vars
    (
      ?auto_13984 - LOCATION
      ?auto_13982 - CITY
      ?auto_13983 - LOCATION
      ?auto_13985 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_13978 ?auto_13976 ) ( GREATER-THAN ?auto_13979 ?auto_13976 ) ( GREATER-THAN ?auto_13979 ?auto_13978 ) ( GREATER-THAN ?auto_13980 ?auto_13976 ) ( GREATER-THAN ?auto_13980 ?auto_13978 ) ( GREATER-THAN ?auto_13980 ?auto_13979 ) ( GREATER-THAN ?auto_13981 ?auto_13976 ) ( GREATER-THAN ?auto_13981 ?auto_13978 ) ( GREATER-THAN ?auto_13981 ?auto_13979 ) ( GREATER-THAN ?auto_13981 ?auto_13980 ) ( IN-CITY ?auto_13984 ?auto_13982 ) ( IN-CITY ?auto_13977 ?auto_13982 ) ( not ( = ?auto_13977 ?auto_13984 ) ) ( OBJ-AT ?auto_13981 ?auto_13984 ) ( OBJ-AT ?auto_13976 ?auto_13977 ) ( OBJ-AT ?auto_13978 ?auto_13977 ) ( not ( = ?auto_13976 ?auto_13978 ) ) ( not ( = ?auto_13976 ?auto_13979 ) ) ( not ( = ?auto_13976 ?auto_13980 ) ) ( not ( = ?auto_13976 ?auto_13981 ) ) ( not ( = ?auto_13978 ?auto_13979 ) ) ( not ( = ?auto_13978 ?auto_13980 ) ) ( not ( = ?auto_13978 ?auto_13981 ) ) ( not ( = ?auto_13979 ?auto_13980 ) ) ( not ( = ?auto_13979 ?auto_13981 ) ) ( not ( = ?auto_13980 ?auto_13981 ) ) ( OBJ-AT ?auto_13980 ?auto_13984 ) ( IN-CITY ?auto_13983 ?auto_13982 ) ( not ( = ?auto_13977 ?auto_13983 ) ) ( not ( = ?auto_13984 ?auto_13983 ) ) ( OBJ-AT ?auto_13979 ?auto_13983 ) ( TRUCK-AT ?auto_13985 ?auto_13977 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_13985 ?auto_13977 ?auto_13983 ?auto_13982 )
      ( DELIVER-5PKG ?auto_13976 ?auto_13978 ?auto_13979 ?auto_13980 ?auto_13981 ?auto_13977 )
      ( DELIVER-5PKG-VERIFY ?auto_13976 ?auto_13978 ?auto_13979 ?auto_13980 ?auto_13981 ?auto_13977 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_13992 - OBJ
      ?auto_13994 - OBJ
      ?auto_13995 - OBJ
      ?auto_13996 - OBJ
      ?auto_13997 - OBJ
      ?auto_13993 - LOCATION
    )
    :vars
    (
      ?auto_14001 - LOCATION
      ?auto_14000 - CITY
      ?auto_13999 - LOCATION
      ?auto_13998 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_13994 ?auto_13992 ) ( GREATER-THAN ?auto_13995 ?auto_13992 ) ( GREATER-THAN ?auto_13995 ?auto_13994 ) ( GREATER-THAN ?auto_13996 ?auto_13992 ) ( GREATER-THAN ?auto_13996 ?auto_13994 ) ( GREATER-THAN ?auto_13996 ?auto_13995 ) ( GREATER-THAN ?auto_13997 ?auto_13992 ) ( GREATER-THAN ?auto_13997 ?auto_13994 ) ( GREATER-THAN ?auto_13997 ?auto_13995 ) ( GREATER-THAN ?auto_13997 ?auto_13996 ) ( IN-CITY ?auto_14001 ?auto_14000 ) ( IN-CITY ?auto_13993 ?auto_14000 ) ( not ( = ?auto_13993 ?auto_14001 ) ) ( OBJ-AT ?auto_13997 ?auto_14001 ) ( OBJ-AT ?auto_13992 ?auto_13993 ) ( not ( = ?auto_13992 ?auto_13994 ) ) ( not ( = ?auto_13992 ?auto_13995 ) ) ( not ( = ?auto_13992 ?auto_13996 ) ) ( not ( = ?auto_13992 ?auto_13997 ) ) ( not ( = ?auto_13994 ?auto_13995 ) ) ( not ( = ?auto_13994 ?auto_13996 ) ) ( not ( = ?auto_13994 ?auto_13997 ) ) ( not ( = ?auto_13995 ?auto_13996 ) ) ( not ( = ?auto_13995 ?auto_13997 ) ) ( not ( = ?auto_13996 ?auto_13997 ) ) ( OBJ-AT ?auto_13996 ?auto_14001 ) ( IN-CITY ?auto_13999 ?auto_14000 ) ( not ( = ?auto_13993 ?auto_13999 ) ) ( not ( = ?auto_14001 ?auto_13999 ) ) ( OBJ-AT ?auto_13995 ?auto_13999 ) ( TRUCK-AT ?auto_13998 ?auto_13993 ) ( IN-TRUCK ?auto_13994 ?auto_13998 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_13994 ?auto_13993 )
      ( DELIVER-5PKG ?auto_13992 ?auto_13994 ?auto_13995 ?auto_13996 ?auto_13997 ?auto_13993 )
      ( DELIVER-5PKG-VERIFY ?auto_13992 ?auto_13994 ?auto_13995 ?auto_13996 ?auto_13997 ?auto_13993 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_14008 - OBJ
      ?auto_14010 - OBJ
      ?auto_14011 - OBJ
      ?auto_14012 - OBJ
      ?auto_14013 - OBJ
      ?auto_14009 - LOCATION
    )
    :vars
    (
      ?auto_14015 - LOCATION
      ?auto_14016 - CITY
      ?auto_14017 - LOCATION
      ?auto_14014 - TRUCK
      ?auto_14018 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_14010 ?auto_14008 ) ( GREATER-THAN ?auto_14011 ?auto_14008 ) ( GREATER-THAN ?auto_14011 ?auto_14010 ) ( GREATER-THAN ?auto_14012 ?auto_14008 ) ( GREATER-THAN ?auto_14012 ?auto_14010 ) ( GREATER-THAN ?auto_14012 ?auto_14011 ) ( GREATER-THAN ?auto_14013 ?auto_14008 ) ( GREATER-THAN ?auto_14013 ?auto_14010 ) ( GREATER-THAN ?auto_14013 ?auto_14011 ) ( GREATER-THAN ?auto_14013 ?auto_14012 ) ( IN-CITY ?auto_14015 ?auto_14016 ) ( IN-CITY ?auto_14009 ?auto_14016 ) ( not ( = ?auto_14009 ?auto_14015 ) ) ( OBJ-AT ?auto_14013 ?auto_14015 ) ( OBJ-AT ?auto_14008 ?auto_14009 ) ( not ( = ?auto_14008 ?auto_14010 ) ) ( not ( = ?auto_14008 ?auto_14011 ) ) ( not ( = ?auto_14008 ?auto_14012 ) ) ( not ( = ?auto_14008 ?auto_14013 ) ) ( not ( = ?auto_14010 ?auto_14011 ) ) ( not ( = ?auto_14010 ?auto_14012 ) ) ( not ( = ?auto_14010 ?auto_14013 ) ) ( not ( = ?auto_14011 ?auto_14012 ) ) ( not ( = ?auto_14011 ?auto_14013 ) ) ( not ( = ?auto_14012 ?auto_14013 ) ) ( OBJ-AT ?auto_14012 ?auto_14015 ) ( IN-CITY ?auto_14017 ?auto_14016 ) ( not ( = ?auto_14009 ?auto_14017 ) ) ( not ( = ?auto_14015 ?auto_14017 ) ) ( OBJ-AT ?auto_14011 ?auto_14017 ) ( IN-TRUCK ?auto_14010 ?auto_14014 ) ( TRUCK-AT ?auto_14014 ?auto_14018 ) ( IN-CITY ?auto_14018 ?auto_14016 ) ( not ( = ?auto_14009 ?auto_14018 ) ) ( not ( = ?auto_14015 ?auto_14018 ) ) ( not ( = ?auto_14017 ?auto_14018 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_14014 ?auto_14018 ?auto_14009 ?auto_14016 )
      ( DELIVER-5PKG ?auto_14008 ?auto_14010 ?auto_14011 ?auto_14012 ?auto_14013 ?auto_14009 )
      ( DELIVER-5PKG-VERIFY ?auto_14008 ?auto_14010 ?auto_14011 ?auto_14012 ?auto_14013 ?auto_14009 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_14025 - OBJ
      ?auto_14027 - OBJ
      ?auto_14028 - OBJ
      ?auto_14029 - OBJ
      ?auto_14030 - OBJ
      ?auto_14026 - LOCATION
    )
    :vars
    (
      ?auto_14034 - LOCATION
      ?auto_14032 - CITY
      ?auto_14031 - LOCATION
      ?auto_14033 - TRUCK
      ?auto_14035 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_14027 ?auto_14025 ) ( GREATER-THAN ?auto_14028 ?auto_14025 ) ( GREATER-THAN ?auto_14028 ?auto_14027 ) ( GREATER-THAN ?auto_14029 ?auto_14025 ) ( GREATER-THAN ?auto_14029 ?auto_14027 ) ( GREATER-THAN ?auto_14029 ?auto_14028 ) ( GREATER-THAN ?auto_14030 ?auto_14025 ) ( GREATER-THAN ?auto_14030 ?auto_14027 ) ( GREATER-THAN ?auto_14030 ?auto_14028 ) ( GREATER-THAN ?auto_14030 ?auto_14029 ) ( IN-CITY ?auto_14034 ?auto_14032 ) ( IN-CITY ?auto_14026 ?auto_14032 ) ( not ( = ?auto_14026 ?auto_14034 ) ) ( OBJ-AT ?auto_14030 ?auto_14034 ) ( OBJ-AT ?auto_14025 ?auto_14026 ) ( not ( = ?auto_14025 ?auto_14027 ) ) ( not ( = ?auto_14025 ?auto_14028 ) ) ( not ( = ?auto_14025 ?auto_14029 ) ) ( not ( = ?auto_14025 ?auto_14030 ) ) ( not ( = ?auto_14027 ?auto_14028 ) ) ( not ( = ?auto_14027 ?auto_14029 ) ) ( not ( = ?auto_14027 ?auto_14030 ) ) ( not ( = ?auto_14028 ?auto_14029 ) ) ( not ( = ?auto_14028 ?auto_14030 ) ) ( not ( = ?auto_14029 ?auto_14030 ) ) ( OBJ-AT ?auto_14029 ?auto_14034 ) ( IN-CITY ?auto_14031 ?auto_14032 ) ( not ( = ?auto_14026 ?auto_14031 ) ) ( not ( = ?auto_14034 ?auto_14031 ) ) ( OBJ-AT ?auto_14028 ?auto_14031 ) ( TRUCK-AT ?auto_14033 ?auto_14035 ) ( IN-CITY ?auto_14035 ?auto_14032 ) ( not ( = ?auto_14026 ?auto_14035 ) ) ( not ( = ?auto_14034 ?auto_14035 ) ) ( not ( = ?auto_14031 ?auto_14035 ) ) ( OBJ-AT ?auto_14027 ?auto_14035 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_14027 ?auto_14033 ?auto_14035 )
      ( DELIVER-5PKG ?auto_14025 ?auto_14027 ?auto_14028 ?auto_14029 ?auto_14030 ?auto_14026 )
      ( DELIVER-5PKG-VERIFY ?auto_14025 ?auto_14027 ?auto_14028 ?auto_14029 ?auto_14030 ?auto_14026 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_14042 - OBJ
      ?auto_14044 - OBJ
      ?auto_14045 - OBJ
      ?auto_14046 - OBJ
      ?auto_14047 - OBJ
      ?auto_14043 - LOCATION
    )
    :vars
    (
      ?auto_14051 - LOCATION
      ?auto_14052 - CITY
      ?auto_14050 - LOCATION
      ?auto_14048 - LOCATION
      ?auto_14049 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_14044 ?auto_14042 ) ( GREATER-THAN ?auto_14045 ?auto_14042 ) ( GREATER-THAN ?auto_14045 ?auto_14044 ) ( GREATER-THAN ?auto_14046 ?auto_14042 ) ( GREATER-THAN ?auto_14046 ?auto_14044 ) ( GREATER-THAN ?auto_14046 ?auto_14045 ) ( GREATER-THAN ?auto_14047 ?auto_14042 ) ( GREATER-THAN ?auto_14047 ?auto_14044 ) ( GREATER-THAN ?auto_14047 ?auto_14045 ) ( GREATER-THAN ?auto_14047 ?auto_14046 ) ( IN-CITY ?auto_14051 ?auto_14052 ) ( IN-CITY ?auto_14043 ?auto_14052 ) ( not ( = ?auto_14043 ?auto_14051 ) ) ( OBJ-AT ?auto_14047 ?auto_14051 ) ( OBJ-AT ?auto_14042 ?auto_14043 ) ( not ( = ?auto_14042 ?auto_14044 ) ) ( not ( = ?auto_14042 ?auto_14045 ) ) ( not ( = ?auto_14042 ?auto_14046 ) ) ( not ( = ?auto_14042 ?auto_14047 ) ) ( not ( = ?auto_14044 ?auto_14045 ) ) ( not ( = ?auto_14044 ?auto_14046 ) ) ( not ( = ?auto_14044 ?auto_14047 ) ) ( not ( = ?auto_14045 ?auto_14046 ) ) ( not ( = ?auto_14045 ?auto_14047 ) ) ( not ( = ?auto_14046 ?auto_14047 ) ) ( OBJ-AT ?auto_14046 ?auto_14051 ) ( IN-CITY ?auto_14050 ?auto_14052 ) ( not ( = ?auto_14043 ?auto_14050 ) ) ( not ( = ?auto_14051 ?auto_14050 ) ) ( OBJ-AT ?auto_14045 ?auto_14050 ) ( IN-CITY ?auto_14048 ?auto_14052 ) ( not ( = ?auto_14043 ?auto_14048 ) ) ( not ( = ?auto_14051 ?auto_14048 ) ) ( not ( = ?auto_14050 ?auto_14048 ) ) ( OBJ-AT ?auto_14044 ?auto_14048 ) ( TRUCK-AT ?auto_14049 ?auto_14043 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_14049 ?auto_14043 ?auto_14048 ?auto_14052 )
      ( DELIVER-5PKG ?auto_14042 ?auto_14044 ?auto_14045 ?auto_14046 ?auto_14047 ?auto_14043 )
      ( DELIVER-5PKG-VERIFY ?auto_14042 ?auto_14044 ?auto_14045 ?auto_14046 ?auto_14047 ?auto_14043 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_14059 - OBJ
      ?auto_14061 - OBJ
      ?auto_14062 - OBJ
      ?auto_14063 - OBJ
      ?auto_14064 - OBJ
      ?auto_14060 - LOCATION
    )
    :vars
    (
      ?auto_14066 - LOCATION
      ?auto_14069 - CITY
      ?auto_14065 - LOCATION
      ?auto_14067 - LOCATION
      ?auto_14068 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_14061 ?auto_14059 ) ( GREATER-THAN ?auto_14062 ?auto_14059 ) ( GREATER-THAN ?auto_14062 ?auto_14061 ) ( GREATER-THAN ?auto_14063 ?auto_14059 ) ( GREATER-THAN ?auto_14063 ?auto_14061 ) ( GREATER-THAN ?auto_14063 ?auto_14062 ) ( GREATER-THAN ?auto_14064 ?auto_14059 ) ( GREATER-THAN ?auto_14064 ?auto_14061 ) ( GREATER-THAN ?auto_14064 ?auto_14062 ) ( GREATER-THAN ?auto_14064 ?auto_14063 ) ( IN-CITY ?auto_14066 ?auto_14069 ) ( IN-CITY ?auto_14060 ?auto_14069 ) ( not ( = ?auto_14060 ?auto_14066 ) ) ( OBJ-AT ?auto_14064 ?auto_14066 ) ( not ( = ?auto_14059 ?auto_14061 ) ) ( not ( = ?auto_14059 ?auto_14062 ) ) ( not ( = ?auto_14059 ?auto_14063 ) ) ( not ( = ?auto_14059 ?auto_14064 ) ) ( not ( = ?auto_14061 ?auto_14062 ) ) ( not ( = ?auto_14061 ?auto_14063 ) ) ( not ( = ?auto_14061 ?auto_14064 ) ) ( not ( = ?auto_14062 ?auto_14063 ) ) ( not ( = ?auto_14062 ?auto_14064 ) ) ( not ( = ?auto_14063 ?auto_14064 ) ) ( OBJ-AT ?auto_14063 ?auto_14066 ) ( IN-CITY ?auto_14065 ?auto_14069 ) ( not ( = ?auto_14060 ?auto_14065 ) ) ( not ( = ?auto_14066 ?auto_14065 ) ) ( OBJ-AT ?auto_14062 ?auto_14065 ) ( IN-CITY ?auto_14067 ?auto_14069 ) ( not ( = ?auto_14060 ?auto_14067 ) ) ( not ( = ?auto_14066 ?auto_14067 ) ) ( not ( = ?auto_14065 ?auto_14067 ) ) ( OBJ-AT ?auto_14061 ?auto_14067 ) ( TRUCK-AT ?auto_14068 ?auto_14060 ) ( IN-TRUCK ?auto_14059 ?auto_14068 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_14059 ?auto_14060 )
      ( DELIVER-5PKG ?auto_14059 ?auto_14061 ?auto_14062 ?auto_14063 ?auto_14064 ?auto_14060 )
      ( DELIVER-5PKG-VERIFY ?auto_14059 ?auto_14061 ?auto_14062 ?auto_14063 ?auto_14064 ?auto_14060 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_14076 - OBJ
      ?auto_14078 - OBJ
      ?auto_14079 - OBJ
      ?auto_14080 - OBJ
      ?auto_14081 - OBJ
      ?auto_14077 - LOCATION
    )
    :vars
    (
      ?auto_14082 - LOCATION
      ?auto_14085 - CITY
      ?auto_14083 - LOCATION
      ?auto_14086 - LOCATION
      ?auto_14084 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_14078 ?auto_14076 ) ( GREATER-THAN ?auto_14079 ?auto_14076 ) ( GREATER-THAN ?auto_14079 ?auto_14078 ) ( GREATER-THAN ?auto_14080 ?auto_14076 ) ( GREATER-THAN ?auto_14080 ?auto_14078 ) ( GREATER-THAN ?auto_14080 ?auto_14079 ) ( GREATER-THAN ?auto_14081 ?auto_14076 ) ( GREATER-THAN ?auto_14081 ?auto_14078 ) ( GREATER-THAN ?auto_14081 ?auto_14079 ) ( GREATER-THAN ?auto_14081 ?auto_14080 ) ( IN-CITY ?auto_14082 ?auto_14085 ) ( IN-CITY ?auto_14077 ?auto_14085 ) ( not ( = ?auto_14077 ?auto_14082 ) ) ( OBJ-AT ?auto_14081 ?auto_14082 ) ( not ( = ?auto_14076 ?auto_14078 ) ) ( not ( = ?auto_14076 ?auto_14079 ) ) ( not ( = ?auto_14076 ?auto_14080 ) ) ( not ( = ?auto_14076 ?auto_14081 ) ) ( not ( = ?auto_14078 ?auto_14079 ) ) ( not ( = ?auto_14078 ?auto_14080 ) ) ( not ( = ?auto_14078 ?auto_14081 ) ) ( not ( = ?auto_14079 ?auto_14080 ) ) ( not ( = ?auto_14079 ?auto_14081 ) ) ( not ( = ?auto_14080 ?auto_14081 ) ) ( OBJ-AT ?auto_14080 ?auto_14082 ) ( IN-CITY ?auto_14083 ?auto_14085 ) ( not ( = ?auto_14077 ?auto_14083 ) ) ( not ( = ?auto_14082 ?auto_14083 ) ) ( OBJ-AT ?auto_14079 ?auto_14083 ) ( IN-CITY ?auto_14086 ?auto_14085 ) ( not ( = ?auto_14077 ?auto_14086 ) ) ( not ( = ?auto_14082 ?auto_14086 ) ) ( not ( = ?auto_14083 ?auto_14086 ) ) ( OBJ-AT ?auto_14078 ?auto_14086 ) ( IN-TRUCK ?auto_14076 ?auto_14084 ) ( TRUCK-AT ?auto_14084 ?auto_14086 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_14084 ?auto_14086 ?auto_14077 ?auto_14085 )
      ( DELIVER-5PKG ?auto_14076 ?auto_14078 ?auto_14079 ?auto_14080 ?auto_14081 ?auto_14077 )
      ( DELIVER-5PKG-VERIFY ?auto_14076 ?auto_14078 ?auto_14079 ?auto_14080 ?auto_14081 ?auto_14077 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_14093 - OBJ
      ?auto_14095 - OBJ
      ?auto_14096 - OBJ
      ?auto_14097 - OBJ
      ?auto_14098 - OBJ
      ?auto_14094 - LOCATION
    )
    :vars
    (
      ?auto_14101 - LOCATION
      ?auto_14103 - CITY
      ?auto_14100 - LOCATION
      ?auto_14099 - LOCATION
      ?auto_14102 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_14095 ?auto_14093 ) ( GREATER-THAN ?auto_14096 ?auto_14093 ) ( GREATER-THAN ?auto_14096 ?auto_14095 ) ( GREATER-THAN ?auto_14097 ?auto_14093 ) ( GREATER-THAN ?auto_14097 ?auto_14095 ) ( GREATER-THAN ?auto_14097 ?auto_14096 ) ( GREATER-THAN ?auto_14098 ?auto_14093 ) ( GREATER-THAN ?auto_14098 ?auto_14095 ) ( GREATER-THAN ?auto_14098 ?auto_14096 ) ( GREATER-THAN ?auto_14098 ?auto_14097 ) ( IN-CITY ?auto_14101 ?auto_14103 ) ( IN-CITY ?auto_14094 ?auto_14103 ) ( not ( = ?auto_14094 ?auto_14101 ) ) ( OBJ-AT ?auto_14098 ?auto_14101 ) ( not ( = ?auto_14093 ?auto_14095 ) ) ( not ( = ?auto_14093 ?auto_14096 ) ) ( not ( = ?auto_14093 ?auto_14097 ) ) ( not ( = ?auto_14093 ?auto_14098 ) ) ( not ( = ?auto_14095 ?auto_14096 ) ) ( not ( = ?auto_14095 ?auto_14097 ) ) ( not ( = ?auto_14095 ?auto_14098 ) ) ( not ( = ?auto_14096 ?auto_14097 ) ) ( not ( = ?auto_14096 ?auto_14098 ) ) ( not ( = ?auto_14097 ?auto_14098 ) ) ( OBJ-AT ?auto_14097 ?auto_14101 ) ( IN-CITY ?auto_14100 ?auto_14103 ) ( not ( = ?auto_14094 ?auto_14100 ) ) ( not ( = ?auto_14101 ?auto_14100 ) ) ( OBJ-AT ?auto_14096 ?auto_14100 ) ( IN-CITY ?auto_14099 ?auto_14103 ) ( not ( = ?auto_14094 ?auto_14099 ) ) ( not ( = ?auto_14101 ?auto_14099 ) ) ( not ( = ?auto_14100 ?auto_14099 ) ) ( OBJ-AT ?auto_14095 ?auto_14099 ) ( TRUCK-AT ?auto_14102 ?auto_14099 ) ( OBJ-AT ?auto_14093 ?auto_14099 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_14093 ?auto_14102 ?auto_14099 )
      ( DELIVER-5PKG ?auto_14093 ?auto_14095 ?auto_14096 ?auto_14097 ?auto_14098 ?auto_14094 )
      ( DELIVER-5PKG-VERIFY ?auto_14093 ?auto_14095 ?auto_14096 ?auto_14097 ?auto_14098 ?auto_14094 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_14110 - OBJ
      ?auto_14112 - OBJ
      ?auto_14113 - OBJ
      ?auto_14114 - OBJ
      ?auto_14115 - OBJ
      ?auto_14111 - LOCATION
    )
    :vars
    (
      ?auto_14116 - LOCATION
      ?auto_14119 - CITY
      ?auto_14120 - LOCATION
      ?auto_14117 - LOCATION
      ?auto_14118 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_14112 ?auto_14110 ) ( GREATER-THAN ?auto_14113 ?auto_14110 ) ( GREATER-THAN ?auto_14113 ?auto_14112 ) ( GREATER-THAN ?auto_14114 ?auto_14110 ) ( GREATER-THAN ?auto_14114 ?auto_14112 ) ( GREATER-THAN ?auto_14114 ?auto_14113 ) ( GREATER-THAN ?auto_14115 ?auto_14110 ) ( GREATER-THAN ?auto_14115 ?auto_14112 ) ( GREATER-THAN ?auto_14115 ?auto_14113 ) ( GREATER-THAN ?auto_14115 ?auto_14114 ) ( IN-CITY ?auto_14116 ?auto_14119 ) ( IN-CITY ?auto_14111 ?auto_14119 ) ( not ( = ?auto_14111 ?auto_14116 ) ) ( OBJ-AT ?auto_14115 ?auto_14116 ) ( not ( = ?auto_14110 ?auto_14112 ) ) ( not ( = ?auto_14110 ?auto_14113 ) ) ( not ( = ?auto_14110 ?auto_14114 ) ) ( not ( = ?auto_14110 ?auto_14115 ) ) ( not ( = ?auto_14112 ?auto_14113 ) ) ( not ( = ?auto_14112 ?auto_14114 ) ) ( not ( = ?auto_14112 ?auto_14115 ) ) ( not ( = ?auto_14113 ?auto_14114 ) ) ( not ( = ?auto_14113 ?auto_14115 ) ) ( not ( = ?auto_14114 ?auto_14115 ) ) ( OBJ-AT ?auto_14114 ?auto_14116 ) ( IN-CITY ?auto_14120 ?auto_14119 ) ( not ( = ?auto_14111 ?auto_14120 ) ) ( not ( = ?auto_14116 ?auto_14120 ) ) ( OBJ-AT ?auto_14113 ?auto_14120 ) ( IN-CITY ?auto_14117 ?auto_14119 ) ( not ( = ?auto_14111 ?auto_14117 ) ) ( not ( = ?auto_14116 ?auto_14117 ) ) ( not ( = ?auto_14120 ?auto_14117 ) ) ( OBJ-AT ?auto_14112 ?auto_14117 ) ( OBJ-AT ?auto_14110 ?auto_14117 ) ( TRUCK-AT ?auto_14118 ?auto_14111 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_14118 ?auto_14111 ?auto_14117 ?auto_14119 )
      ( DELIVER-5PKG ?auto_14110 ?auto_14112 ?auto_14113 ?auto_14114 ?auto_14115 ?auto_14111 )
      ( DELIVER-5PKG-VERIFY ?auto_14110 ?auto_14112 ?auto_14113 ?auto_14114 ?auto_14115 ?auto_14111 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_14154 - OBJ
      ?auto_14156 - OBJ
      ?auto_14158 - OBJ
      ?auto_14159 - OBJ
      ?auto_14160 - OBJ
      ?auto_14157 - OBJ
      ?auto_14155 - LOCATION
    )
    :vars
    (
      ?auto_14161 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_14156 ?auto_14154 ) ( GREATER-THAN ?auto_14158 ?auto_14154 ) ( GREATER-THAN ?auto_14158 ?auto_14156 ) ( GREATER-THAN ?auto_14159 ?auto_14154 ) ( GREATER-THAN ?auto_14159 ?auto_14156 ) ( GREATER-THAN ?auto_14159 ?auto_14158 ) ( GREATER-THAN ?auto_14160 ?auto_14154 ) ( GREATER-THAN ?auto_14160 ?auto_14156 ) ( GREATER-THAN ?auto_14160 ?auto_14158 ) ( GREATER-THAN ?auto_14160 ?auto_14159 ) ( GREATER-THAN ?auto_14157 ?auto_14154 ) ( GREATER-THAN ?auto_14157 ?auto_14156 ) ( GREATER-THAN ?auto_14157 ?auto_14158 ) ( GREATER-THAN ?auto_14157 ?auto_14159 ) ( GREATER-THAN ?auto_14157 ?auto_14160 ) ( TRUCK-AT ?auto_14161 ?auto_14155 ) ( IN-TRUCK ?auto_14157 ?auto_14161 ) ( OBJ-AT ?auto_14154 ?auto_14155 ) ( OBJ-AT ?auto_14156 ?auto_14155 ) ( OBJ-AT ?auto_14158 ?auto_14155 ) ( OBJ-AT ?auto_14159 ?auto_14155 ) ( OBJ-AT ?auto_14160 ?auto_14155 ) ( not ( = ?auto_14154 ?auto_14156 ) ) ( not ( = ?auto_14154 ?auto_14158 ) ) ( not ( = ?auto_14154 ?auto_14159 ) ) ( not ( = ?auto_14154 ?auto_14160 ) ) ( not ( = ?auto_14154 ?auto_14157 ) ) ( not ( = ?auto_14156 ?auto_14158 ) ) ( not ( = ?auto_14156 ?auto_14159 ) ) ( not ( = ?auto_14156 ?auto_14160 ) ) ( not ( = ?auto_14156 ?auto_14157 ) ) ( not ( = ?auto_14158 ?auto_14159 ) ) ( not ( = ?auto_14158 ?auto_14160 ) ) ( not ( = ?auto_14158 ?auto_14157 ) ) ( not ( = ?auto_14159 ?auto_14160 ) ) ( not ( = ?auto_14159 ?auto_14157 ) ) ( not ( = ?auto_14160 ?auto_14157 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_14157 ?auto_14155 )
      ( DELIVER-6PKG-VERIFY ?auto_14154 ?auto_14156 ?auto_14158 ?auto_14159 ?auto_14160 ?auto_14157 ?auto_14155 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_14169 - OBJ
      ?auto_14171 - OBJ
      ?auto_14173 - OBJ
      ?auto_14174 - OBJ
      ?auto_14175 - OBJ
      ?auto_14172 - OBJ
      ?auto_14170 - LOCATION
    )
    :vars
    (
      ?auto_14177 - TRUCK
      ?auto_14178 - LOCATION
      ?auto_14176 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_14171 ?auto_14169 ) ( GREATER-THAN ?auto_14173 ?auto_14169 ) ( GREATER-THAN ?auto_14173 ?auto_14171 ) ( GREATER-THAN ?auto_14174 ?auto_14169 ) ( GREATER-THAN ?auto_14174 ?auto_14171 ) ( GREATER-THAN ?auto_14174 ?auto_14173 ) ( GREATER-THAN ?auto_14175 ?auto_14169 ) ( GREATER-THAN ?auto_14175 ?auto_14171 ) ( GREATER-THAN ?auto_14175 ?auto_14173 ) ( GREATER-THAN ?auto_14175 ?auto_14174 ) ( GREATER-THAN ?auto_14172 ?auto_14169 ) ( GREATER-THAN ?auto_14172 ?auto_14171 ) ( GREATER-THAN ?auto_14172 ?auto_14173 ) ( GREATER-THAN ?auto_14172 ?auto_14174 ) ( GREATER-THAN ?auto_14172 ?auto_14175 ) ( IN-TRUCK ?auto_14172 ?auto_14177 ) ( TRUCK-AT ?auto_14177 ?auto_14178 ) ( IN-CITY ?auto_14178 ?auto_14176 ) ( IN-CITY ?auto_14170 ?auto_14176 ) ( not ( = ?auto_14170 ?auto_14178 ) ) ( OBJ-AT ?auto_14169 ?auto_14170 ) ( OBJ-AT ?auto_14171 ?auto_14170 ) ( OBJ-AT ?auto_14173 ?auto_14170 ) ( OBJ-AT ?auto_14174 ?auto_14170 ) ( OBJ-AT ?auto_14175 ?auto_14170 ) ( not ( = ?auto_14169 ?auto_14171 ) ) ( not ( = ?auto_14169 ?auto_14173 ) ) ( not ( = ?auto_14169 ?auto_14174 ) ) ( not ( = ?auto_14169 ?auto_14175 ) ) ( not ( = ?auto_14169 ?auto_14172 ) ) ( not ( = ?auto_14171 ?auto_14173 ) ) ( not ( = ?auto_14171 ?auto_14174 ) ) ( not ( = ?auto_14171 ?auto_14175 ) ) ( not ( = ?auto_14171 ?auto_14172 ) ) ( not ( = ?auto_14173 ?auto_14174 ) ) ( not ( = ?auto_14173 ?auto_14175 ) ) ( not ( = ?auto_14173 ?auto_14172 ) ) ( not ( = ?auto_14174 ?auto_14175 ) ) ( not ( = ?auto_14174 ?auto_14172 ) ) ( not ( = ?auto_14175 ?auto_14172 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_14172 ?auto_14170 )
      ( DELIVER-6PKG-VERIFY ?auto_14169 ?auto_14171 ?auto_14173 ?auto_14174 ?auto_14175 ?auto_14172 ?auto_14170 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_14186 - OBJ
      ?auto_14188 - OBJ
      ?auto_14190 - OBJ
      ?auto_14191 - OBJ
      ?auto_14192 - OBJ
      ?auto_14189 - OBJ
      ?auto_14187 - LOCATION
    )
    :vars
    (
      ?auto_14195 - TRUCK
      ?auto_14193 - LOCATION
      ?auto_14194 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_14188 ?auto_14186 ) ( GREATER-THAN ?auto_14190 ?auto_14186 ) ( GREATER-THAN ?auto_14190 ?auto_14188 ) ( GREATER-THAN ?auto_14191 ?auto_14186 ) ( GREATER-THAN ?auto_14191 ?auto_14188 ) ( GREATER-THAN ?auto_14191 ?auto_14190 ) ( GREATER-THAN ?auto_14192 ?auto_14186 ) ( GREATER-THAN ?auto_14192 ?auto_14188 ) ( GREATER-THAN ?auto_14192 ?auto_14190 ) ( GREATER-THAN ?auto_14192 ?auto_14191 ) ( GREATER-THAN ?auto_14189 ?auto_14186 ) ( GREATER-THAN ?auto_14189 ?auto_14188 ) ( GREATER-THAN ?auto_14189 ?auto_14190 ) ( GREATER-THAN ?auto_14189 ?auto_14191 ) ( GREATER-THAN ?auto_14189 ?auto_14192 ) ( TRUCK-AT ?auto_14195 ?auto_14193 ) ( IN-CITY ?auto_14193 ?auto_14194 ) ( IN-CITY ?auto_14187 ?auto_14194 ) ( not ( = ?auto_14187 ?auto_14193 ) ) ( OBJ-AT ?auto_14189 ?auto_14193 ) ( OBJ-AT ?auto_14186 ?auto_14187 ) ( OBJ-AT ?auto_14188 ?auto_14187 ) ( OBJ-AT ?auto_14190 ?auto_14187 ) ( OBJ-AT ?auto_14191 ?auto_14187 ) ( OBJ-AT ?auto_14192 ?auto_14187 ) ( not ( = ?auto_14186 ?auto_14188 ) ) ( not ( = ?auto_14186 ?auto_14190 ) ) ( not ( = ?auto_14186 ?auto_14191 ) ) ( not ( = ?auto_14186 ?auto_14192 ) ) ( not ( = ?auto_14186 ?auto_14189 ) ) ( not ( = ?auto_14188 ?auto_14190 ) ) ( not ( = ?auto_14188 ?auto_14191 ) ) ( not ( = ?auto_14188 ?auto_14192 ) ) ( not ( = ?auto_14188 ?auto_14189 ) ) ( not ( = ?auto_14190 ?auto_14191 ) ) ( not ( = ?auto_14190 ?auto_14192 ) ) ( not ( = ?auto_14190 ?auto_14189 ) ) ( not ( = ?auto_14191 ?auto_14192 ) ) ( not ( = ?auto_14191 ?auto_14189 ) ) ( not ( = ?auto_14192 ?auto_14189 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_14189 ?auto_14187 )
      ( DELIVER-6PKG-VERIFY ?auto_14186 ?auto_14188 ?auto_14190 ?auto_14191 ?auto_14192 ?auto_14189 ?auto_14187 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_14203 - OBJ
      ?auto_14205 - OBJ
      ?auto_14207 - OBJ
      ?auto_14208 - OBJ
      ?auto_14209 - OBJ
      ?auto_14206 - OBJ
      ?auto_14204 - LOCATION
    )
    :vars
    (
      ?auto_14211 - LOCATION
      ?auto_14212 - CITY
      ?auto_14210 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_14205 ?auto_14203 ) ( GREATER-THAN ?auto_14207 ?auto_14203 ) ( GREATER-THAN ?auto_14207 ?auto_14205 ) ( GREATER-THAN ?auto_14208 ?auto_14203 ) ( GREATER-THAN ?auto_14208 ?auto_14205 ) ( GREATER-THAN ?auto_14208 ?auto_14207 ) ( GREATER-THAN ?auto_14209 ?auto_14203 ) ( GREATER-THAN ?auto_14209 ?auto_14205 ) ( GREATER-THAN ?auto_14209 ?auto_14207 ) ( GREATER-THAN ?auto_14209 ?auto_14208 ) ( GREATER-THAN ?auto_14206 ?auto_14203 ) ( GREATER-THAN ?auto_14206 ?auto_14205 ) ( GREATER-THAN ?auto_14206 ?auto_14207 ) ( GREATER-THAN ?auto_14206 ?auto_14208 ) ( GREATER-THAN ?auto_14206 ?auto_14209 ) ( IN-CITY ?auto_14211 ?auto_14212 ) ( IN-CITY ?auto_14204 ?auto_14212 ) ( not ( = ?auto_14204 ?auto_14211 ) ) ( OBJ-AT ?auto_14206 ?auto_14211 ) ( TRUCK-AT ?auto_14210 ?auto_14204 ) ( OBJ-AT ?auto_14203 ?auto_14204 ) ( OBJ-AT ?auto_14205 ?auto_14204 ) ( OBJ-AT ?auto_14207 ?auto_14204 ) ( OBJ-AT ?auto_14208 ?auto_14204 ) ( OBJ-AT ?auto_14209 ?auto_14204 ) ( not ( = ?auto_14203 ?auto_14205 ) ) ( not ( = ?auto_14203 ?auto_14207 ) ) ( not ( = ?auto_14203 ?auto_14208 ) ) ( not ( = ?auto_14203 ?auto_14209 ) ) ( not ( = ?auto_14203 ?auto_14206 ) ) ( not ( = ?auto_14205 ?auto_14207 ) ) ( not ( = ?auto_14205 ?auto_14208 ) ) ( not ( = ?auto_14205 ?auto_14209 ) ) ( not ( = ?auto_14205 ?auto_14206 ) ) ( not ( = ?auto_14207 ?auto_14208 ) ) ( not ( = ?auto_14207 ?auto_14209 ) ) ( not ( = ?auto_14207 ?auto_14206 ) ) ( not ( = ?auto_14208 ?auto_14209 ) ) ( not ( = ?auto_14208 ?auto_14206 ) ) ( not ( = ?auto_14209 ?auto_14206 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_14206 ?auto_14204 )
      ( DELIVER-6PKG-VERIFY ?auto_14203 ?auto_14205 ?auto_14207 ?auto_14208 ?auto_14209 ?auto_14206 ?auto_14204 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_14220 - OBJ
      ?auto_14222 - OBJ
      ?auto_14224 - OBJ
      ?auto_14225 - OBJ
      ?auto_14226 - OBJ
      ?auto_14223 - OBJ
      ?auto_14221 - LOCATION
    )
    :vars
    (
      ?auto_14229 - LOCATION
      ?auto_14227 - CITY
      ?auto_14228 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_14222 ?auto_14220 ) ( GREATER-THAN ?auto_14224 ?auto_14220 ) ( GREATER-THAN ?auto_14224 ?auto_14222 ) ( GREATER-THAN ?auto_14225 ?auto_14220 ) ( GREATER-THAN ?auto_14225 ?auto_14222 ) ( GREATER-THAN ?auto_14225 ?auto_14224 ) ( GREATER-THAN ?auto_14226 ?auto_14220 ) ( GREATER-THAN ?auto_14226 ?auto_14222 ) ( GREATER-THAN ?auto_14226 ?auto_14224 ) ( GREATER-THAN ?auto_14226 ?auto_14225 ) ( GREATER-THAN ?auto_14223 ?auto_14220 ) ( GREATER-THAN ?auto_14223 ?auto_14222 ) ( GREATER-THAN ?auto_14223 ?auto_14224 ) ( GREATER-THAN ?auto_14223 ?auto_14225 ) ( GREATER-THAN ?auto_14223 ?auto_14226 ) ( IN-CITY ?auto_14229 ?auto_14227 ) ( IN-CITY ?auto_14221 ?auto_14227 ) ( not ( = ?auto_14221 ?auto_14229 ) ) ( OBJ-AT ?auto_14223 ?auto_14229 ) ( TRUCK-AT ?auto_14228 ?auto_14221 ) ( OBJ-AT ?auto_14220 ?auto_14221 ) ( OBJ-AT ?auto_14222 ?auto_14221 ) ( OBJ-AT ?auto_14224 ?auto_14221 ) ( OBJ-AT ?auto_14225 ?auto_14221 ) ( not ( = ?auto_14220 ?auto_14222 ) ) ( not ( = ?auto_14220 ?auto_14224 ) ) ( not ( = ?auto_14220 ?auto_14225 ) ) ( not ( = ?auto_14220 ?auto_14226 ) ) ( not ( = ?auto_14220 ?auto_14223 ) ) ( not ( = ?auto_14222 ?auto_14224 ) ) ( not ( = ?auto_14222 ?auto_14225 ) ) ( not ( = ?auto_14222 ?auto_14226 ) ) ( not ( = ?auto_14222 ?auto_14223 ) ) ( not ( = ?auto_14224 ?auto_14225 ) ) ( not ( = ?auto_14224 ?auto_14226 ) ) ( not ( = ?auto_14224 ?auto_14223 ) ) ( not ( = ?auto_14225 ?auto_14226 ) ) ( not ( = ?auto_14225 ?auto_14223 ) ) ( not ( = ?auto_14226 ?auto_14223 ) ) ( IN-TRUCK ?auto_14226 ?auto_14228 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_14226 ?auto_14221 )
      ( DELIVER-6PKG ?auto_14220 ?auto_14222 ?auto_14224 ?auto_14225 ?auto_14226 ?auto_14223 ?auto_14221 )
      ( DELIVER-6PKG-VERIFY ?auto_14220 ?auto_14222 ?auto_14224 ?auto_14225 ?auto_14226 ?auto_14223 ?auto_14221 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_14237 - OBJ
      ?auto_14239 - OBJ
      ?auto_14241 - OBJ
      ?auto_14242 - OBJ
      ?auto_14243 - OBJ
      ?auto_14240 - OBJ
      ?auto_14238 - LOCATION
    )
    :vars
    (
      ?auto_14246 - LOCATION
      ?auto_14244 - CITY
      ?auto_14245 - TRUCK
      ?auto_14247 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_14239 ?auto_14237 ) ( GREATER-THAN ?auto_14241 ?auto_14237 ) ( GREATER-THAN ?auto_14241 ?auto_14239 ) ( GREATER-THAN ?auto_14242 ?auto_14237 ) ( GREATER-THAN ?auto_14242 ?auto_14239 ) ( GREATER-THAN ?auto_14242 ?auto_14241 ) ( GREATER-THAN ?auto_14243 ?auto_14237 ) ( GREATER-THAN ?auto_14243 ?auto_14239 ) ( GREATER-THAN ?auto_14243 ?auto_14241 ) ( GREATER-THAN ?auto_14243 ?auto_14242 ) ( GREATER-THAN ?auto_14240 ?auto_14237 ) ( GREATER-THAN ?auto_14240 ?auto_14239 ) ( GREATER-THAN ?auto_14240 ?auto_14241 ) ( GREATER-THAN ?auto_14240 ?auto_14242 ) ( GREATER-THAN ?auto_14240 ?auto_14243 ) ( IN-CITY ?auto_14246 ?auto_14244 ) ( IN-CITY ?auto_14238 ?auto_14244 ) ( not ( = ?auto_14238 ?auto_14246 ) ) ( OBJ-AT ?auto_14240 ?auto_14246 ) ( OBJ-AT ?auto_14237 ?auto_14238 ) ( OBJ-AT ?auto_14239 ?auto_14238 ) ( OBJ-AT ?auto_14241 ?auto_14238 ) ( OBJ-AT ?auto_14242 ?auto_14238 ) ( not ( = ?auto_14237 ?auto_14239 ) ) ( not ( = ?auto_14237 ?auto_14241 ) ) ( not ( = ?auto_14237 ?auto_14242 ) ) ( not ( = ?auto_14237 ?auto_14243 ) ) ( not ( = ?auto_14237 ?auto_14240 ) ) ( not ( = ?auto_14239 ?auto_14241 ) ) ( not ( = ?auto_14239 ?auto_14242 ) ) ( not ( = ?auto_14239 ?auto_14243 ) ) ( not ( = ?auto_14239 ?auto_14240 ) ) ( not ( = ?auto_14241 ?auto_14242 ) ) ( not ( = ?auto_14241 ?auto_14243 ) ) ( not ( = ?auto_14241 ?auto_14240 ) ) ( not ( = ?auto_14242 ?auto_14243 ) ) ( not ( = ?auto_14242 ?auto_14240 ) ) ( not ( = ?auto_14243 ?auto_14240 ) ) ( IN-TRUCK ?auto_14243 ?auto_14245 ) ( TRUCK-AT ?auto_14245 ?auto_14247 ) ( IN-CITY ?auto_14247 ?auto_14244 ) ( not ( = ?auto_14238 ?auto_14247 ) ) ( not ( = ?auto_14246 ?auto_14247 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_14245 ?auto_14247 ?auto_14238 ?auto_14244 )
      ( DELIVER-6PKG ?auto_14237 ?auto_14239 ?auto_14241 ?auto_14242 ?auto_14243 ?auto_14240 ?auto_14238 )
      ( DELIVER-6PKG-VERIFY ?auto_14237 ?auto_14239 ?auto_14241 ?auto_14242 ?auto_14243 ?auto_14240 ?auto_14238 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_14255 - OBJ
      ?auto_14257 - OBJ
      ?auto_14259 - OBJ
      ?auto_14260 - OBJ
      ?auto_14261 - OBJ
      ?auto_14258 - OBJ
      ?auto_14256 - LOCATION
    )
    :vars
    (
      ?auto_14264 - LOCATION
      ?auto_14263 - CITY
      ?auto_14265 - TRUCK
      ?auto_14262 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_14257 ?auto_14255 ) ( GREATER-THAN ?auto_14259 ?auto_14255 ) ( GREATER-THAN ?auto_14259 ?auto_14257 ) ( GREATER-THAN ?auto_14260 ?auto_14255 ) ( GREATER-THAN ?auto_14260 ?auto_14257 ) ( GREATER-THAN ?auto_14260 ?auto_14259 ) ( GREATER-THAN ?auto_14261 ?auto_14255 ) ( GREATER-THAN ?auto_14261 ?auto_14257 ) ( GREATER-THAN ?auto_14261 ?auto_14259 ) ( GREATER-THAN ?auto_14261 ?auto_14260 ) ( GREATER-THAN ?auto_14258 ?auto_14255 ) ( GREATER-THAN ?auto_14258 ?auto_14257 ) ( GREATER-THAN ?auto_14258 ?auto_14259 ) ( GREATER-THAN ?auto_14258 ?auto_14260 ) ( GREATER-THAN ?auto_14258 ?auto_14261 ) ( IN-CITY ?auto_14264 ?auto_14263 ) ( IN-CITY ?auto_14256 ?auto_14263 ) ( not ( = ?auto_14256 ?auto_14264 ) ) ( OBJ-AT ?auto_14258 ?auto_14264 ) ( OBJ-AT ?auto_14255 ?auto_14256 ) ( OBJ-AT ?auto_14257 ?auto_14256 ) ( OBJ-AT ?auto_14259 ?auto_14256 ) ( OBJ-AT ?auto_14260 ?auto_14256 ) ( not ( = ?auto_14255 ?auto_14257 ) ) ( not ( = ?auto_14255 ?auto_14259 ) ) ( not ( = ?auto_14255 ?auto_14260 ) ) ( not ( = ?auto_14255 ?auto_14261 ) ) ( not ( = ?auto_14255 ?auto_14258 ) ) ( not ( = ?auto_14257 ?auto_14259 ) ) ( not ( = ?auto_14257 ?auto_14260 ) ) ( not ( = ?auto_14257 ?auto_14261 ) ) ( not ( = ?auto_14257 ?auto_14258 ) ) ( not ( = ?auto_14259 ?auto_14260 ) ) ( not ( = ?auto_14259 ?auto_14261 ) ) ( not ( = ?auto_14259 ?auto_14258 ) ) ( not ( = ?auto_14260 ?auto_14261 ) ) ( not ( = ?auto_14260 ?auto_14258 ) ) ( not ( = ?auto_14261 ?auto_14258 ) ) ( TRUCK-AT ?auto_14265 ?auto_14262 ) ( IN-CITY ?auto_14262 ?auto_14263 ) ( not ( = ?auto_14256 ?auto_14262 ) ) ( not ( = ?auto_14264 ?auto_14262 ) ) ( OBJ-AT ?auto_14261 ?auto_14262 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_14261 ?auto_14265 ?auto_14262 )
      ( DELIVER-6PKG ?auto_14255 ?auto_14257 ?auto_14259 ?auto_14260 ?auto_14261 ?auto_14258 ?auto_14256 )
      ( DELIVER-6PKG-VERIFY ?auto_14255 ?auto_14257 ?auto_14259 ?auto_14260 ?auto_14261 ?auto_14258 ?auto_14256 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_14273 - OBJ
      ?auto_14275 - OBJ
      ?auto_14277 - OBJ
      ?auto_14278 - OBJ
      ?auto_14279 - OBJ
      ?auto_14276 - OBJ
      ?auto_14274 - LOCATION
    )
    :vars
    (
      ?auto_14282 - LOCATION
      ?auto_14280 - CITY
      ?auto_14281 - LOCATION
      ?auto_14283 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_14275 ?auto_14273 ) ( GREATER-THAN ?auto_14277 ?auto_14273 ) ( GREATER-THAN ?auto_14277 ?auto_14275 ) ( GREATER-THAN ?auto_14278 ?auto_14273 ) ( GREATER-THAN ?auto_14278 ?auto_14275 ) ( GREATER-THAN ?auto_14278 ?auto_14277 ) ( GREATER-THAN ?auto_14279 ?auto_14273 ) ( GREATER-THAN ?auto_14279 ?auto_14275 ) ( GREATER-THAN ?auto_14279 ?auto_14277 ) ( GREATER-THAN ?auto_14279 ?auto_14278 ) ( GREATER-THAN ?auto_14276 ?auto_14273 ) ( GREATER-THAN ?auto_14276 ?auto_14275 ) ( GREATER-THAN ?auto_14276 ?auto_14277 ) ( GREATER-THAN ?auto_14276 ?auto_14278 ) ( GREATER-THAN ?auto_14276 ?auto_14279 ) ( IN-CITY ?auto_14282 ?auto_14280 ) ( IN-CITY ?auto_14274 ?auto_14280 ) ( not ( = ?auto_14274 ?auto_14282 ) ) ( OBJ-AT ?auto_14276 ?auto_14282 ) ( OBJ-AT ?auto_14273 ?auto_14274 ) ( OBJ-AT ?auto_14275 ?auto_14274 ) ( OBJ-AT ?auto_14277 ?auto_14274 ) ( OBJ-AT ?auto_14278 ?auto_14274 ) ( not ( = ?auto_14273 ?auto_14275 ) ) ( not ( = ?auto_14273 ?auto_14277 ) ) ( not ( = ?auto_14273 ?auto_14278 ) ) ( not ( = ?auto_14273 ?auto_14279 ) ) ( not ( = ?auto_14273 ?auto_14276 ) ) ( not ( = ?auto_14275 ?auto_14277 ) ) ( not ( = ?auto_14275 ?auto_14278 ) ) ( not ( = ?auto_14275 ?auto_14279 ) ) ( not ( = ?auto_14275 ?auto_14276 ) ) ( not ( = ?auto_14277 ?auto_14278 ) ) ( not ( = ?auto_14277 ?auto_14279 ) ) ( not ( = ?auto_14277 ?auto_14276 ) ) ( not ( = ?auto_14278 ?auto_14279 ) ) ( not ( = ?auto_14278 ?auto_14276 ) ) ( not ( = ?auto_14279 ?auto_14276 ) ) ( IN-CITY ?auto_14281 ?auto_14280 ) ( not ( = ?auto_14274 ?auto_14281 ) ) ( not ( = ?auto_14282 ?auto_14281 ) ) ( OBJ-AT ?auto_14279 ?auto_14281 ) ( TRUCK-AT ?auto_14283 ?auto_14274 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_14283 ?auto_14274 ?auto_14281 ?auto_14280 )
      ( DELIVER-6PKG ?auto_14273 ?auto_14275 ?auto_14277 ?auto_14278 ?auto_14279 ?auto_14276 ?auto_14274 )
      ( DELIVER-6PKG-VERIFY ?auto_14273 ?auto_14275 ?auto_14277 ?auto_14278 ?auto_14279 ?auto_14276 ?auto_14274 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_14291 - OBJ
      ?auto_14293 - OBJ
      ?auto_14295 - OBJ
      ?auto_14296 - OBJ
      ?auto_14297 - OBJ
      ?auto_14294 - OBJ
      ?auto_14292 - LOCATION
    )
    :vars
    (
      ?auto_14299 - LOCATION
      ?auto_14300 - CITY
      ?auto_14298 - LOCATION
      ?auto_14301 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_14293 ?auto_14291 ) ( GREATER-THAN ?auto_14295 ?auto_14291 ) ( GREATER-THAN ?auto_14295 ?auto_14293 ) ( GREATER-THAN ?auto_14296 ?auto_14291 ) ( GREATER-THAN ?auto_14296 ?auto_14293 ) ( GREATER-THAN ?auto_14296 ?auto_14295 ) ( GREATER-THAN ?auto_14297 ?auto_14291 ) ( GREATER-THAN ?auto_14297 ?auto_14293 ) ( GREATER-THAN ?auto_14297 ?auto_14295 ) ( GREATER-THAN ?auto_14297 ?auto_14296 ) ( GREATER-THAN ?auto_14294 ?auto_14291 ) ( GREATER-THAN ?auto_14294 ?auto_14293 ) ( GREATER-THAN ?auto_14294 ?auto_14295 ) ( GREATER-THAN ?auto_14294 ?auto_14296 ) ( GREATER-THAN ?auto_14294 ?auto_14297 ) ( IN-CITY ?auto_14299 ?auto_14300 ) ( IN-CITY ?auto_14292 ?auto_14300 ) ( not ( = ?auto_14292 ?auto_14299 ) ) ( OBJ-AT ?auto_14294 ?auto_14299 ) ( OBJ-AT ?auto_14291 ?auto_14292 ) ( OBJ-AT ?auto_14293 ?auto_14292 ) ( OBJ-AT ?auto_14295 ?auto_14292 ) ( not ( = ?auto_14291 ?auto_14293 ) ) ( not ( = ?auto_14291 ?auto_14295 ) ) ( not ( = ?auto_14291 ?auto_14296 ) ) ( not ( = ?auto_14291 ?auto_14297 ) ) ( not ( = ?auto_14291 ?auto_14294 ) ) ( not ( = ?auto_14293 ?auto_14295 ) ) ( not ( = ?auto_14293 ?auto_14296 ) ) ( not ( = ?auto_14293 ?auto_14297 ) ) ( not ( = ?auto_14293 ?auto_14294 ) ) ( not ( = ?auto_14295 ?auto_14296 ) ) ( not ( = ?auto_14295 ?auto_14297 ) ) ( not ( = ?auto_14295 ?auto_14294 ) ) ( not ( = ?auto_14296 ?auto_14297 ) ) ( not ( = ?auto_14296 ?auto_14294 ) ) ( not ( = ?auto_14297 ?auto_14294 ) ) ( IN-CITY ?auto_14298 ?auto_14300 ) ( not ( = ?auto_14292 ?auto_14298 ) ) ( not ( = ?auto_14299 ?auto_14298 ) ) ( OBJ-AT ?auto_14297 ?auto_14298 ) ( TRUCK-AT ?auto_14301 ?auto_14292 ) ( IN-TRUCK ?auto_14296 ?auto_14301 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_14296 ?auto_14292 )
      ( DELIVER-6PKG ?auto_14291 ?auto_14293 ?auto_14295 ?auto_14296 ?auto_14297 ?auto_14294 ?auto_14292 )
      ( DELIVER-6PKG-VERIFY ?auto_14291 ?auto_14293 ?auto_14295 ?auto_14296 ?auto_14297 ?auto_14294 ?auto_14292 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_14309 - OBJ
      ?auto_14311 - OBJ
      ?auto_14313 - OBJ
      ?auto_14314 - OBJ
      ?auto_14315 - OBJ
      ?auto_14312 - OBJ
      ?auto_14310 - LOCATION
    )
    :vars
    (
      ?auto_14317 - LOCATION
      ?auto_14316 - CITY
      ?auto_14318 - LOCATION
      ?auto_14319 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_14311 ?auto_14309 ) ( GREATER-THAN ?auto_14313 ?auto_14309 ) ( GREATER-THAN ?auto_14313 ?auto_14311 ) ( GREATER-THAN ?auto_14314 ?auto_14309 ) ( GREATER-THAN ?auto_14314 ?auto_14311 ) ( GREATER-THAN ?auto_14314 ?auto_14313 ) ( GREATER-THAN ?auto_14315 ?auto_14309 ) ( GREATER-THAN ?auto_14315 ?auto_14311 ) ( GREATER-THAN ?auto_14315 ?auto_14313 ) ( GREATER-THAN ?auto_14315 ?auto_14314 ) ( GREATER-THAN ?auto_14312 ?auto_14309 ) ( GREATER-THAN ?auto_14312 ?auto_14311 ) ( GREATER-THAN ?auto_14312 ?auto_14313 ) ( GREATER-THAN ?auto_14312 ?auto_14314 ) ( GREATER-THAN ?auto_14312 ?auto_14315 ) ( IN-CITY ?auto_14317 ?auto_14316 ) ( IN-CITY ?auto_14310 ?auto_14316 ) ( not ( = ?auto_14310 ?auto_14317 ) ) ( OBJ-AT ?auto_14312 ?auto_14317 ) ( OBJ-AT ?auto_14309 ?auto_14310 ) ( OBJ-AT ?auto_14311 ?auto_14310 ) ( OBJ-AT ?auto_14313 ?auto_14310 ) ( not ( = ?auto_14309 ?auto_14311 ) ) ( not ( = ?auto_14309 ?auto_14313 ) ) ( not ( = ?auto_14309 ?auto_14314 ) ) ( not ( = ?auto_14309 ?auto_14315 ) ) ( not ( = ?auto_14309 ?auto_14312 ) ) ( not ( = ?auto_14311 ?auto_14313 ) ) ( not ( = ?auto_14311 ?auto_14314 ) ) ( not ( = ?auto_14311 ?auto_14315 ) ) ( not ( = ?auto_14311 ?auto_14312 ) ) ( not ( = ?auto_14313 ?auto_14314 ) ) ( not ( = ?auto_14313 ?auto_14315 ) ) ( not ( = ?auto_14313 ?auto_14312 ) ) ( not ( = ?auto_14314 ?auto_14315 ) ) ( not ( = ?auto_14314 ?auto_14312 ) ) ( not ( = ?auto_14315 ?auto_14312 ) ) ( IN-CITY ?auto_14318 ?auto_14316 ) ( not ( = ?auto_14310 ?auto_14318 ) ) ( not ( = ?auto_14317 ?auto_14318 ) ) ( OBJ-AT ?auto_14315 ?auto_14318 ) ( IN-TRUCK ?auto_14314 ?auto_14319 ) ( TRUCK-AT ?auto_14319 ?auto_14318 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_14319 ?auto_14318 ?auto_14310 ?auto_14316 )
      ( DELIVER-6PKG ?auto_14309 ?auto_14311 ?auto_14313 ?auto_14314 ?auto_14315 ?auto_14312 ?auto_14310 )
      ( DELIVER-6PKG-VERIFY ?auto_14309 ?auto_14311 ?auto_14313 ?auto_14314 ?auto_14315 ?auto_14312 ?auto_14310 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_14327 - OBJ
      ?auto_14329 - OBJ
      ?auto_14331 - OBJ
      ?auto_14332 - OBJ
      ?auto_14333 - OBJ
      ?auto_14330 - OBJ
      ?auto_14328 - LOCATION
    )
    :vars
    (
      ?auto_14334 - LOCATION
      ?auto_14337 - CITY
      ?auto_14336 - LOCATION
      ?auto_14335 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_14329 ?auto_14327 ) ( GREATER-THAN ?auto_14331 ?auto_14327 ) ( GREATER-THAN ?auto_14331 ?auto_14329 ) ( GREATER-THAN ?auto_14332 ?auto_14327 ) ( GREATER-THAN ?auto_14332 ?auto_14329 ) ( GREATER-THAN ?auto_14332 ?auto_14331 ) ( GREATER-THAN ?auto_14333 ?auto_14327 ) ( GREATER-THAN ?auto_14333 ?auto_14329 ) ( GREATER-THAN ?auto_14333 ?auto_14331 ) ( GREATER-THAN ?auto_14333 ?auto_14332 ) ( GREATER-THAN ?auto_14330 ?auto_14327 ) ( GREATER-THAN ?auto_14330 ?auto_14329 ) ( GREATER-THAN ?auto_14330 ?auto_14331 ) ( GREATER-THAN ?auto_14330 ?auto_14332 ) ( GREATER-THAN ?auto_14330 ?auto_14333 ) ( IN-CITY ?auto_14334 ?auto_14337 ) ( IN-CITY ?auto_14328 ?auto_14337 ) ( not ( = ?auto_14328 ?auto_14334 ) ) ( OBJ-AT ?auto_14330 ?auto_14334 ) ( OBJ-AT ?auto_14327 ?auto_14328 ) ( OBJ-AT ?auto_14329 ?auto_14328 ) ( OBJ-AT ?auto_14331 ?auto_14328 ) ( not ( = ?auto_14327 ?auto_14329 ) ) ( not ( = ?auto_14327 ?auto_14331 ) ) ( not ( = ?auto_14327 ?auto_14332 ) ) ( not ( = ?auto_14327 ?auto_14333 ) ) ( not ( = ?auto_14327 ?auto_14330 ) ) ( not ( = ?auto_14329 ?auto_14331 ) ) ( not ( = ?auto_14329 ?auto_14332 ) ) ( not ( = ?auto_14329 ?auto_14333 ) ) ( not ( = ?auto_14329 ?auto_14330 ) ) ( not ( = ?auto_14331 ?auto_14332 ) ) ( not ( = ?auto_14331 ?auto_14333 ) ) ( not ( = ?auto_14331 ?auto_14330 ) ) ( not ( = ?auto_14332 ?auto_14333 ) ) ( not ( = ?auto_14332 ?auto_14330 ) ) ( not ( = ?auto_14333 ?auto_14330 ) ) ( IN-CITY ?auto_14336 ?auto_14337 ) ( not ( = ?auto_14328 ?auto_14336 ) ) ( not ( = ?auto_14334 ?auto_14336 ) ) ( OBJ-AT ?auto_14333 ?auto_14336 ) ( TRUCK-AT ?auto_14335 ?auto_14336 ) ( OBJ-AT ?auto_14332 ?auto_14336 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_14332 ?auto_14335 ?auto_14336 )
      ( DELIVER-6PKG ?auto_14327 ?auto_14329 ?auto_14331 ?auto_14332 ?auto_14333 ?auto_14330 ?auto_14328 )
      ( DELIVER-6PKG-VERIFY ?auto_14327 ?auto_14329 ?auto_14331 ?auto_14332 ?auto_14333 ?auto_14330 ?auto_14328 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_14345 - OBJ
      ?auto_14347 - OBJ
      ?auto_14349 - OBJ
      ?auto_14350 - OBJ
      ?auto_14351 - OBJ
      ?auto_14348 - OBJ
      ?auto_14346 - LOCATION
    )
    :vars
    (
      ?auto_14355 - LOCATION
      ?auto_14353 - CITY
      ?auto_14354 - LOCATION
      ?auto_14352 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_14347 ?auto_14345 ) ( GREATER-THAN ?auto_14349 ?auto_14345 ) ( GREATER-THAN ?auto_14349 ?auto_14347 ) ( GREATER-THAN ?auto_14350 ?auto_14345 ) ( GREATER-THAN ?auto_14350 ?auto_14347 ) ( GREATER-THAN ?auto_14350 ?auto_14349 ) ( GREATER-THAN ?auto_14351 ?auto_14345 ) ( GREATER-THAN ?auto_14351 ?auto_14347 ) ( GREATER-THAN ?auto_14351 ?auto_14349 ) ( GREATER-THAN ?auto_14351 ?auto_14350 ) ( GREATER-THAN ?auto_14348 ?auto_14345 ) ( GREATER-THAN ?auto_14348 ?auto_14347 ) ( GREATER-THAN ?auto_14348 ?auto_14349 ) ( GREATER-THAN ?auto_14348 ?auto_14350 ) ( GREATER-THAN ?auto_14348 ?auto_14351 ) ( IN-CITY ?auto_14355 ?auto_14353 ) ( IN-CITY ?auto_14346 ?auto_14353 ) ( not ( = ?auto_14346 ?auto_14355 ) ) ( OBJ-AT ?auto_14348 ?auto_14355 ) ( OBJ-AT ?auto_14345 ?auto_14346 ) ( OBJ-AT ?auto_14347 ?auto_14346 ) ( OBJ-AT ?auto_14349 ?auto_14346 ) ( not ( = ?auto_14345 ?auto_14347 ) ) ( not ( = ?auto_14345 ?auto_14349 ) ) ( not ( = ?auto_14345 ?auto_14350 ) ) ( not ( = ?auto_14345 ?auto_14351 ) ) ( not ( = ?auto_14345 ?auto_14348 ) ) ( not ( = ?auto_14347 ?auto_14349 ) ) ( not ( = ?auto_14347 ?auto_14350 ) ) ( not ( = ?auto_14347 ?auto_14351 ) ) ( not ( = ?auto_14347 ?auto_14348 ) ) ( not ( = ?auto_14349 ?auto_14350 ) ) ( not ( = ?auto_14349 ?auto_14351 ) ) ( not ( = ?auto_14349 ?auto_14348 ) ) ( not ( = ?auto_14350 ?auto_14351 ) ) ( not ( = ?auto_14350 ?auto_14348 ) ) ( not ( = ?auto_14351 ?auto_14348 ) ) ( IN-CITY ?auto_14354 ?auto_14353 ) ( not ( = ?auto_14346 ?auto_14354 ) ) ( not ( = ?auto_14355 ?auto_14354 ) ) ( OBJ-AT ?auto_14351 ?auto_14354 ) ( OBJ-AT ?auto_14350 ?auto_14354 ) ( TRUCK-AT ?auto_14352 ?auto_14346 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_14352 ?auto_14346 ?auto_14354 ?auto_14353 )
      ( DELIVER-6PKG ?auto_14345 ?auto_14347 ?auto_14349 ?auto_14350 ?auto_14351 ?auto_14348 ?auto_14346 )
      ( DELIVER-6PKG-VERIFY ?auto_14345 ?auto_14347 ?auto_14349 ?auto_14350 ?auto_14351 ?auto_14348 ?auto_14346 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_14363 - OBJ
      ?auto_14365 - OBJ
      ?auto_14367 - OBJ
      ?auto_14368 - OBJ
      ?auto_14369 - OBJ
      ?auto_14366 - OBJ
      ?auto_14364 - LOCATION
    )
    :vars
    (
      ?auto_14370 - LOCATION
      ?auto_14371 - CITY
      ?auto_14372 - LOCATION
      ?auto_14373 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_14365 ?auto_14363 ) ( GREATER-THAN ?auto_14367 ?auto_14363 ) ( GREATER-THAN ?auto_14367 ?auto_14365 ) ( GREATER-THAN ?auto_14368 ?auto_14363 ) ( GREATER-THAN ?auto_14368 ?auto_14365 ) ( GREATER-THAN ?auto_14368 ?auto_14367 ) ( GREATER-THAN ?auto_14369 ?auto_14363 ) ( GREATER-THAN ?auto_14369 ?auto_14365 ) ( GREATER-THAN ?auto_14369 ?auto_14367 ) ( GREATER-THAN ?auto_14369 ?auto_14368 ) ( GREATER-THAN ?auto_14366 ?auto_14363 ) ( GREATER-THAN ?auto_14366 ?auto_14365 ) ( GREATER-THAN ?auto_14366 ?auto_14367 ) ( GREATER-THAN ?auto_14366 ?auto_14368 ) ( GREATER-THAN ?auto_14366 ?auto_14369 ) ( IN-CITY ?auto_14370 ?auto_14371 ) ( IN-CITY ?auto_14364 ?auto_14371 ) ( not ( = ?auto_14364 ?auto_14370 ) ) ( OBJ-AT ?auto_14366 ?auto_14370 ) ( OBJ-AT ?auto_14363 ?auto_14364 ) ( OBJ-AT ?auto_14365 ?auto_14364 ) ( not ( = ?auto_14363 ?auto_14365 ) ) ( not ( = ?auto_14363 ?auto_14367 ) ) ( not ( = ?auto_14363 ?auto_14368 ) ) ( not ( = ?auto_14363 ?auto_14369 ) ) ( not ( = ?auto_14363 ?auto_14366 ) ) ( not ( = ?auto_14365 ?auto_14367 ) ) ( not ( = ?auto_14365 ?auto_14368 ) ) ( not ( = ?auto_14365 ?auto_14369 ) ) ( not ( = ?auto_14365 ?auto_14366 ) ) ( not ( = ?auto_14367 ?auto_14368 ) ) ( not ( = ?auto_14367 ?auto_14369 ) ) ( not ( = ?auto_14367 ?auto_14366 ) ) ( not ( = ?auto_14368 ?auto_14369 ) ) ( not ( = ?auto_14368 ?auto_14366 ) ) ( not ( = ?auto_14369 ?auto_14366 ) ) ( IN-CITY ?auto_14372 ?auto_14371 ) ( not ( = ?auto_14364 ?auto_14372 ) ) ( not ( = ?auto_14370 ?auto_14372 ) ) ( OBJ-AT ?auto_14369 ?auto_14372 ) ( OBJ-AT ?auto_14368 ?auto_14372 ) ( TRUCK-AT ?auto_14373 ?auto_14364 ) ( IN-TRUCK ?auto_14367 ?auto_14373 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_14367 ?auto_14364 )
      ( DELIVER-6PKG ?auto_14363 ?auto_14365 ?auto_14367 ?auto_14368 ?auto_14369 ?auto_14366 ?auto_14364 )
      ( DELIVER-6PKG-VERIFY ?auto_14363 ?auto_14365 ?auto_14367 ?auto_14368 ?auto_14369 ?auto_14366 ?auto_14364 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_14381 - OBJ
      ?auto_14383 - OBJ
      ?auto_14385 - OBJ
      ?auto_14386 - OBJ
      ?auto_14387 - OBJ
      ?auto_14384 - OBJ
      ?auto_14382 - LOCATION
    )
    :vars
    (
      ?auto_14391 - LOCATION
      ?auto_14388 - CITY
      ?auto_14389 - LOCATION
      ?auto_14390 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_14383 ?auto_14381 ) ( GREATER-THAN ?auto_14385 ?auto_14381 ) ( GREATER-THAN ?auto_14385 ?auto_14383 ) ( GREATER-THAN ?auto_14386 ?auto_14381 ) ( GREATER-THAN ?auto_14386 ?auto_14383 ) ( GREATER-THAN ?auto_14386 ?auto_14385 ) ( GREATER-THAN ?auto_14387 ?auto_14381 ) ( GREATER-THAN ?auto_14387 ?auto_14383 ) ( GREATER-THAN ?auto_14387 ?auto_14385 ) ( GREATER-THAN ?auto_14387 ?auto_14386 ) ( GREATER-THAN ?auto_14384 ?auto_14381 ) ( GREATER-THAN ?auto_14384 ?auto_14383 ) ( GREATER-THAN ?auto_14384 ?auto_14385 ) ( GREATER-THAN ?auto_14384 ?auto_14386 ) ( GREATER-THAN ?auto_14384 ?auto_14387 ) ( IN-CITY ?auto_14391 ?auto_14388 ) ( IN-CITY ?auto_14382 ?auto_14388 ) ( not ( = ?auto_14382 ?auto_14391 ) ) ( OBJ-AT ?auto_14384 ?auto_14391 ) ( OBJ-AT ?auto_14381 ?auto_14382 ) ( OBJ-AT ?auto_14383 ?auto_14382 ) ( not ( = ?auto_14381 ?auto_14383 ) ) ( not ( = ?auto_14381 ?auto_14385 ) ) ( not ( = ?auto_14381 ?auto_14386 ) ) ( not ( = ?auto_14381 ?auto_14387 ) ) ( not ( = ?auto_14381 ?auto_14384 ) ) ( not ( = ?auto_14383 ?auto_14385 ) ) ( not ( = ?auto_14383 ?auto_14386 ) ) ( not ( = ?auto_14383 ?auto_14387 ) ) ( not ( = ?auto_14383 ?auto_14384 ) ) ( not ( = ?auto_14385 ?auto_14386 ) ) ( not ( = ?auto_14385 ?auto_14387 ) ) ( not ( = ?auto_14385 ?auto_14384 ) ) ( not ( = ?auto_14386 ?auto_14387 ) ) ( not ( = ?auto_14386 ?auto_14384 ) ) ( not ( = ?auto_14387 ?auto_14384 ) ) ( IN-CITY ?auto_14389 ?auto_14388 ) ( not ( = ?auto_14382 ?auto_14389 ) ) ( not ( = ?auto_14391 ?auto_14389 ) ) ( OBJ-AT ?auto_14387 ?auto_14389 ) ( OBJ-AT ?auto_14386 ?auto_14389 ) ( IN-TRUCK ?auto_14385 ?auto_14390 ) ( TRUCK-AT ?auto_14390 ?auto_14391 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_14390 ?auto_14391 ?auto_14382 ?auto_14388 )
      ( DELIVER-6PKG ?auto_14381 ?auto_14383 ?auto_14385 ?auto_14386 ?auto_14387 ?auto_14384 ?auto_14382 )
      ( DELIVER-6PKG-VERIFY ?auto_14381 ?auto_14383 ?auto_14385 ?auto_14386 ?auto_14387 ?auto_14384 ?auto_14382 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_14399 - OBJ
      ?auto_14401 - OBJ
      ?auto_14403 - OBJ
      ?auto_14404 - OBJ
      ?auto_14405 - OBJ
      ?auto_14402 - OBJ
      ?auto_14400 - LOCATION
    )
    :vars
    (
      ?auto_14409 - LOCATION
      ?auto_14407 - CITY
      ?auto_14406 - LOCATION
      ?auto_14408 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_14401 ?auto_14399 ) ( GREATER-THAN ?auto_14403 ?auto_14399 ) ( GREATER-THAN ?auto_14403 ?auto_14401 ) ( GREATER-THAN ?auto_14404 ?auto_14399 ) ( GREATER-THAN ?auto_14404 ?auto_14401 ) ( GREATER-THAN ?auto_14404 ?auto_14403 ) ( GREATER-THAN ?auto_14405 ?auto_14399 ) ( GREATER-THAN ?auto_14405 ?auto_14401 ) ( GREATER-THAN ?auto_14405 ?auto_14403 ) ( GREATER-THAN ?auto_14405 ?auto_14404 ) ( GREATER-THAN ?auto_14402 ?auto_14399 ) ( GREATER-THAN ?auto_14402 ?auto_14401 ) ( GREATER-THAN ?auto_14402 ?auto_14403 ) ( GREATER-THAN ?auto_14402 ?auto_14404 ) ( GREATER-THAN ?auto_14402 ?auto_14405 ) ( IN-CITY ?auto_14409 ?auto_14407 ) ( IN-CITY ?auto_14400 ?auto_14407 ) ( not ( = ?auto_14400 ?auto_14409 ) ) ( OBJ-AT ?auto_14402 ?auto_14409 ) ( OBJ-AT ?auto_14399 ?auto_14400 ) ( OBJ-AT ?auto_14401 ?auto_14400 ) ( not ( = ?auto_14399 ?auto_14401 ) ) ( not ( = ?auto_14399 ?auto_14403 ) ) ( not ( = ?auto_14399 ?auto_14404 ) ) ( not ( = ?auto_14399 ?auto_14405 ) ) ( not ( = ?auto_14399 ?auto_14402 ) ) ( not ( = ?auto_14401 ?auto_14403 ) ) ( not ( = ?auto_14401 ?auto_14404 ) ) ( not ( = ?auto_14401 ?auto_14405 ) ) ( not ( = ?auto_14401 ?auto_14402 ) ) ( not ( = ?auto_14403 ?auto_14404 ) ) ( not ( = ?auto_14403 ?auto_14405 ) ) ( not ( = ?auto_14403 ?auto_14402 ) ) ( not ( = ?auto_14404 ?auto_14405 ) ) ( not ( = ?auto_14404 ?auto_14402 ) ) ( not ( = ?auto_14405 ?auto_14402 ) ) ( IN-CITY ?auto_14406 ?auto_14407 ) ( not ( = ?auto_14400 ?auto_14406 ) ) ( not ( = ?auto_14409 ?auto_14406 ) ) ( OBJ-AT ?auto_14405 ?auto_14406 ) ( OBJ-AT ?auto_14404 ?auto_14406 ) ( TRUCK-AT ?auto_14408 ?auto_14409 ) ( OBJ-AT ?auto_14403 ?auto_14409 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_14403 ?auto_14408 ?auto_14409 )
      ( DELIVER-6PKG ?auto_14399 ?auto_14401 ?auto_14403 ?auto_14404 ?auto_14405 ?auto_14402 ?auto_14400 )
      ( DELIVER-6PKG-VERIFY ?auto_14399 ?auto_14401 ?auto_14403 ?auto_14404 ?auto_14405 ?auto_14402 ?auto_14400 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_14417 - OBJ
      ?auto_14419 - OBJ
      ?auto_14421 - OBJ
      ?auto_14422 - OBJ
      ?auto_14423 - OBJ
      ?auto_14420 - OBJ
      ?auto_14418 - LOCATION
    )
    :vars
    (
      ?auto_14427 - LOCATION
      ?auto_14424 - CITY
      ?auto_14426 - LOCATION
      ?auto_14425 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_14419 ?auto_14417 ) ( GREATER-THAN ?auto_14421 ?auto_14417 ) ( GREATER-THAN ?auto_14421 ?auto_14419 ) ( GREATER-THAN ?auto_14422 ?auto_14417 ) ( GREATER-THAN ?auto_14422 ?auto_14419 ) ( GREATER-THAN ?auto_14422 ?auto_14421 ) ( GREATER-THAN ?auto_14423 ?auto_14417 ) ( GREATER-THAN ?auto_14423 ?auto_14419 ) ( GREATER-THAN ?auto_14423 ?auto_14421 ) ( GREATER-THAN ?auto_14423 ?auto_14422 ) ( GREATER-THAN ?auto_14420 ?auto_14417 ) ( GREATER-THAN ?auto_14420 ?auto_14419 ) ( GREATER-THAN ?auto_14420 ?auto_14421 ) ( GREATER-THAN ?auto_14420 ?auto_14422 ) ( GREATER-THAN ?auto_14420 ?auto_14423 ) ( IN-CITY ?auto_14427 ?auto_14424 ) ( IN-CITY ?auto_14418 ?auto_14424 ) ( not ( = ?auto_14418 ?auto_14427 ) ) ( OBJ-AT ?auto_14420 ?auto_14427 ) ( OBJ-AT ?auto_14417 ?auto_14418 ) ( OBJ-AT ?auto_14419 ?auto_14418 ) ( not ( = ?auto_14417 ?auto_14419 ) ) ( not ( = ?auto_14417 ?auto_14421 ) ) ( not ( = ?auto_14417 ?auto_14422 ) ) ( not ( = ?auto_14417 ?auto_14423 ) ) ( not ( = ?auto_14417 ?auto_14420 ) ) ( not ( = ?auto_14419 ?auto_14421 ) ) ( not ( = ?auto_14419 ?auto_14422 ) ) ( not ( = ?auto_14419 ?auto_14423 ) ) ( not ( = ?auto_14419 ?auto_14420 ) ) ( not ( = ?auto_14421 ?auto_14422 ) ) ( not ( = ?auto_14421 ?auto_14423 ) ) ( not ( = ?auto_14421 ?auto_14420 ) ) ( not ( = ?auto_14422 ?auto_14423 ) ) ( not ( = ?auto_14422 ?auto_14420 ) ) ( not ( = ?auto_14423 ?auto_14420 ) ) ( IN-CITY ?auto_14426 ?auto_14424 ) ( not ( = ?auto_14418 ?auto_14426 ) ) ( not ( = ?auto_14427 ?auto_14426 ) ) ( OBJ-AT ?auto_14423 ?auto_14426 ) ( OBJ-AT ?auto_14422 ?auto_14426 ) ( OBJ-AT ?auto_14421 ?auto_14427 ) ( TRUCK-AT ?auto_14425 ?auto_14418 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_14425 ?auto_14418 ?auto_14427 ?auto_14424 )
      ( DELIVER-6PKG ?auto_14417 ?auto_14419 ?auto_14421 ?auto_14422 ?auto_14423 ?auto_14420 ?auto_14418 )
      ( DELIVER-6PKG-VERIFY ?auto_14417 ?auto_14419 ?auto_14421 ?auto_14422 ?auto_14423 ?auto_14420 ?auto_14418 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_14435 - OBJ
      ?auto_14437 - OBJ
      ?auto_14439 - OBJ
      ?auto_14440 - OBJ
      ?auto_14441 - OBJ
      ?auto_14438 - OBJ
      ?auto_14436 - LOCATION
    )
    :vars
    (
      ?auto_14442 - LOCATION
      ?auto_14445 - CITY
      ?auto_14443 - LOCATION
      ?auto_14444 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_14437 ?auto_14435 ) ( GREATER-THAN ?auto_14439 ?auto_14435 ) ( GREATER-THAN ?auto_14439 ?auto_14437 ) ( GREATER-THAN ?auto_14440 ?auto_14435 ) ( GREATER-THAN ?auto_14440 ?auto_14437 ) ( GREATER-THAN ?auto_14440 ?auto_14439 ) ( GREATER-THAN ?auto_14441 ?auto_14435 ) ( GREATER-THAN ?auto_14441 ?auto_14437 ) ( GREATER-THAN ?auto_14441 ?auto_14439 ) ( GREATER-THAN ?auto_14441 ?auto_14440 ) ( GREATER-THAN ?auto_14438 ?auto_14435 ) ( GREATER-THAN ?auto_14438 ?auto_14437 ) ( GREATER-THAN ?auto_14438 ?auto_14439 ) ( GREATER-THAN ?auto_14438 ?auto_14440 ) ( GREATER-THAN ?auto_14438 ?auto_14441 ) ( IN-CITY ?auto_14442 ?auto_14445 ) ( IN-CITY ?auto_14436 ?auto_14445 ) ( not ( = ?auto_14436 ?auto_14442 ) ) ( OBJ-AT ?auto_14438 ?auto_14442 ) ( OBJ-AT ?auto_14435 ?auto_14436 ) ( not ( = ?auto_14435 ?auto_14437 ) ) ( not ( = ?auto_14435 ?auto_14439 ) ) ( not ( = ?auto_14435 ?auto_14440 ) ) ( not ( = ?auto_14435 ?auto_14441 ) ) ( not ( = ?auto_14435 ?auto_14438 ) ) ( not ( = ?auto_14437 ?auto_14439 ) ) ( not ( = ?auto_14437 ?auto_14440 ) ) ( not ( = ?auto_14437 ?auto_14441 ) ) ( not ( = ?auto_14437 ?auto_14438 ) ) ( not ( = ?auto_14439 ?auto_14440 ) ) ( not ( = ?auto_14439 ?auto_14441 ) ) ( not ( = ?auto_14439 ?auto_14438 ) ) ( not ( = ?auto_14440 ?auto_14441 ) ) ( not ( = ?auto_14440 ?auto_14438 ) ) ( not ( = ?auto_14441 ?auto_14438 ) ) ( IN-CITY ?auto_14443 ?auto_14445 ) ( not ( = ?auto_14436 ?auto_14443 ) ) ( not ( = ?auto_14442 ?auto_14443 ) ) ( OBJ-AT ?auto_14441 ?auto_14443 ) ( OBJ-AT ?auto_14440 ?auto_14443 ) ( OBJ-AT ?auto_14439 ?auto_14442 ) ( TRUCK-AT ?auto_14444 ?auto_14436 ) ( IN-TRUCK ?auto_14437 ?auto_14444 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_14437 ?auto_14436 )
      ( DELIVER-6PKG ?auto_14435 ?auto_14437 ?auto_14439 ?auto_14440 ?auto_14441 ?auto_14438 ?auto_14436 )
      ( DELIVER-6PKG-VERIFY ?auto_14435 ?auto_14437 ?auto_14439 ?auto_14440 ?auto_14441 ?auto_14438 ?auto_14436 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_14453 - OBJ
      ?auto_14455 - OBJ
      ?auto_14457 - OBJ
      ?auto_14458 - OBJ
      ?auto_14459 - OBJ
      ?auto_14456 - OBJ
      ?auto_14454 - LOCATION
    )
    :vars
    (
      ?auto_14463 - LOCATION
      ?auto_14461 - CITY
      ?auto_14460 - LOCATION
      ?auto_14462 - TRUCK
      ?auto_14464 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_14455 ?auto_14453 ) ( GREATER-THAN ?auto_14457 ?auto_14453 ) ( GREATER-THAN ?auto_14457 ?auto_14455 ) ( GREATER-THAN ?auto_14458 ?auto_14453 ) ( GREATER-THAN ?auto_14458 ?auto_14455 ) ( GREATER-THAN ?auto_14458 ?auto_14457 ) ( GREATER-THAN ?auto_14459 ?auto_14453 ) ( GREATER-THAN ?auto_14459 ?auto_14455 ) ( GREATER-THAN ?auto_14459 ?auto_14457 ) ( GREATER-THAN ?auto_14459 ?auto_14458 ) ( GREATER-THAN ?auto_14456 ?auto_14453 ) ( GREATER-THAN ?auto_14456 ?auto_14455 ) ( GREATER-THAN ?auto_14456 ?auto_14457 ) ( GREATER-THAN ?auto_14456 ?auto_14458 ) ( GREATER-THAN ?auto_14456 ?auto_14459 ) ( IN-CITY ?auto_14463 ?auto_14461 ) ( IN-CITY ?auto_14454 ?auto_14461 ) ( not ( = ?auto_14454 ?auto_14463 ) ) ( OBJ-AT ?auto_14456 ?auto_14463 ) ( OBJ-AT ?auto_14453 ?auto_14454 ) ( not ( = ?auto_14453 ?auto_14455 ) ) ( not ( = ?auto_14453 ?auto_14457 ) ) ( not ( = ?auto_14453 ?auto_14458 ) ) ( not ( = ?auto_14453 ?auto_14459 ) ) ( not ( = ?auto_14453 ?auto_14456 ) ) ( not ( = ?auto_14455 ?auto_14457 ) ) ( not ( = ?auto_14455 ?auto_14458 ) ) ( not ( = ?auto_14455 ?auto_14459 ) ) ( not ( = ?auto_14455 ?auto_14456 ) ) ( not ( = ?auto_14457 ?auto_14458 ) ) ( not ( = ?auto_14457 ?auto_14459 ) ) ( not ( = ?auto_14457 ?auto_14456 ) ) ( not ( = ?auto_14458 ?auto_14459 ) ) ( not ( = ?auto_14458 ?auto_14456 ) ) ( not ( = ?auto_14459 ?auto_14456 ) ) ( IN-CITY ?auto_14460 ?auto_14461 ) ( not ( = ?auto_14454 ?auto_14460 ) ) ( not ( = ?auto_14463 ?auto_14460 ) ) ( OBJ-AT ?auto_14459 ?auto_14460 ) ( OBJ-AT ?auto_14458 ?auto_14460 ) ( OBJ-AT ?auto_14457 ?auto_14463 ) ( IN-TRUCK ?auto_14455 ?auto_14462 ) ( TRUCK-AT ?auto_14462 ?auto_14464 ) ( IN-CITY ?auto_14464 ?auto_14461 ) ( not ( = ?auto_14454 ?auto_14464 ) ) ( not ( = ?auto_14463 ?auto_14464 ) ) ( not ( = ?auto_14460 ?auto_14464 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_14462 ?auto_14464 ?auto_14454 ?auto_14461 )
      ( DELIVER-6PKG ?auto_14453 ?auto_14455 ?auto_14457 ?auto_14458 ?auto_14459 ?auto_14456 ?auto_14454 )
      ( DELIVER-6PKG-VERIFY ?auto_14453 ?auto_14455 ?auto_14457 ?auto_14458 ?auto_14459 ?auto_14456 ?auto_14454 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_14472 - OBJ
      ?auto_14474 - OBJ
      ?auto_14476 - OBJ
      ?auto_14477 - OBJ
      ?auto_14478 - OBJ
      ?auto_14475 - OBJ
      ?auto_14473 - LOCATION
    )
    :vars
    (
      ?auto_14480 - LOCATION
      ?auto_14481 - CITY
      ?auto_14482 - LOCATION
      ?auto_14483 - TRUCK
      ?auto_14479 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_14474 ?auto_14472 ) ( GREATER-THAN ?auto_14476 ?auto_14472 ) ( GREATER-THAN ?auto_14476 ?auto_14474 ) ( GREATER-THAN ?auto_14477 ?auto_14472 ) ( GREATER-THAN ?auto_14477 ?auto_14474 ) ( GREATER-THAN ?auto_14477 ?auto_14476 ) ( GREATER-THAN ?auto_14478 ?auto_14472 ) ( GREATER-THAN ?auto_14478 ?auto_14474 ) ( GREATER-THAN ?auto_14478 ?auto_14476 ) ( GREATER-THAN ?auto_14478 ?auto_14477 ) ( GREATER-THAN ?auto_14475 ?auto_14472 ) ( GREATER-THAN ?auto_14475 ?auto_14474 ) ( GREATER-THAN ?auto_14475 ?auto_14476 ) ( GREATER-THAN ?auto_14475 ?auto_14477 ) ( GREATER-THAN ?auto_14475 ?auto_14478 ) ( IN-CITY ?auto_14480 ?auto_14481 ) ( IN-CITY ?auto_14473 ?auto_14481 ) ( not ( = ?auto_14473 ?auto_14480 ) ) ( OBJ-AT ?auto_14475 ?auto_14480 ) ( OBJ-AT ?auto_14472 ?auto_14473 ) ( not ( = ?auto_14472 ?auto_14474 ) ) ( not ( = ?auto_14472 ?auto_14476 ) ) ( not ( = ?auto_14472 ?auto_14477 ) ) ( not ( = ?auto_14472 ?auto_14478 ) ) ( not ( = ?auto_14472 ?auto_14475 ) ) ( not ( = ?auto_14474 ?auto_14476 ) ) ( not ( = ?auto_14474 ?auto_14477 ) ) ( not ( = ?auto_14474 ?auto_14478 ) ) ( not ( = ?auto_14474 ?auto_14475 ) ) ( not ( = ?auto_14476 ?auto_14477 ) ) ( not ( = ?auto_14476 ?auto_14478 ) ) ( not ( = ?auto_14476 ?auto_14475 ) ) ( not ( = ?auto_14477 ?auto_14478 ) ) ( not ( = ?auto_14477 ?auto_14475 ) ) ( not ( = ?auto_14478 ?auto_14475 ) ) ( IN-CITY ?auto_14482 ?auto_14481 ) ( not ( = ?auto_14473 ?auto_14482 ) ) ( not ( = ?auto_14480 ?auto_14482 ) ) ( OBJ-AT ?auto_14478 ?auto_14482 ) ( OBJ-AT ?auto_14477 ?auto_14482 ) ( OBJ-AT ?auto_14476 ?auto_14480 ) ( TRUCK-AT ?auto_14483 ?auto_14479 ) ( IN-CITY ?auto_14479 ?auto_14481 ) ( not ( = ?auto_14473 ?auto_14479 ) ) ( not ( = ?auto_14480 ?auto_14479 ) ) ( not ( = ?auto_14482 ?auto_14479 ) ) ( OBJ-AT ?auto_14474 ?auto_14479 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_14474 ?auto_14483 ?auto_14479 )
      ( DELIVER-6PKG ?auto_14472 ?auto_14474 ?auto_14476 ?auto_14477 ?auto_14478 ?auto_14475 ?auto_14473 )
      ( DELIVER-6PKG-VERIFY ?auto_14472 ?auto_14474 ?auto_14476 ?auto_14477 ?auto_14478 ?auto_14475 ?auto_14473 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_14491 - OBJ
      ?auto_14493 - OBJ
      ?auto_14495 - OBJ
      ?auto_14496 - OBJ
      ?auto_14497 - OBJ
      ?auto_14494 - OBJ
      ?auto_14492 - LOCATION
    )
    :vars
    (
      ?auto_14498 - LOCATION
      ?auto_14499 - CITY
      ?auto_14500 - LOCATION
      ?auto_14501 - LOCATION
      ?auto_14502 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_14493 ?auto_14491 ) ( GREATER-THAN ?auto_14495 ?auto_14491 ) ( GREATER-THAN ?auto_14495 ?auto_14493 ) ( GREATER-THAN ?auto_14496 ?auto_14491 ) ( GREATER-THAN ?auto_14496 ?auto_14493 ) ( GREATER-THAN ?auto_14496 ?auto_14495 ) ( GREATER-THAN ?auto_14497 ?auto_14491 ) ( GREATER-THAN ?auto_14497 ?auto_14493 ) ( GREATER-THAN ?auto_14497 ?auto_14495 ) ( GREATER-THAN ?auto_14497 ?auto_14496 ) ( GREATER-THAN ?auto_14494 ?auto_14491 ) ( GREATER-THAN ?auto_14494 ?auto_14493 ) ( GREATER-THAN ?auto_14494 ?auto_14495 ) ( GREATER-THAN ?auto_14494 ?auto_14496 ) ( GREATER-THAN ?auto_14494 ?auto_14497 ) ( IN-CITY ?auto_14498 ?auto_14499 ) ( IN-CITY ?auto_14492 ?auto_14499 ) ( not ( = ?auto_14492 ?auto_14498 ) ) ( OBJ-AT ?auto_14494 ?auto_14498 ) ( OBJ-AT ?auto_14491 ?auto_14492 ) ( not ( = ?auto_14491 ?auto_14493 ) ) ( not ( = ?auto_14491 ?auto_14495 ) ) ( not ( = ?auto_14491 ?auto_14496 ) ) ( not ( = ?auto_14491 ?auto_14497 ) ) ( not ( = ?auto_14491 ?auto_14494 ) ) ( not ( = ?auto_14493 ?auto_14495 ) ) ( not ( = ?auto_14493 ?auto_14496 ) ) ( not ( = ?auto_14493 ?auto_14497 ) ) ( not ( = ?auto_14493 ?auto_14494 ) ) ( not ( = ?auto_14495 ?auto_14496 ) ) ( not ( = ?auto_14495 ?auto_14497 ) ) ( not ( = ?auto_14495 ?auto_14494 ) ) ( not ( = ?auto_14496 ?auto_14497 ) ) ( not ( = ?auto_14496 ?auto_14494 ) ) ( not ( = ?auto_14497 ?auto_14494 ) ) ( IN-CITY ?auto_14500 ?auto_14499 ) ( not ( = ?auto_14492 ?auto_14500 ) ) ( not ( = ?auto_14498 ?auto_14500 ) ) ( OBJ-AT ?auto_14497 ?auto_14500 ) ( OBJ-AT ?auto_14496 ?auto_14500 ) ( OBJ-AT ?auto_14495 ?auto_14498 ) ( IN-CITY ?auto_14501 ?auto_14499 ) ( not ( = ?auto_14492 ?auto_14501 ) ) ( not ( = ?auto_14498 ?auto_14501 ) ) ( not ( = ?auto_14500 ?auto_14501 ) ) ( OBJ-AT ?auto_14493 ?auto_14501 ) ( TRUCK-AT ?auto_14502 ?auto_14492 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_14502 ?auto_14492 ?auto_14501 ?auto_14499 )
      ( DELIVER-6PKG ?auto_14491 ?auto_14493 ?auto_14495 ?auto_14496 ?auto_14497 ?auto_14494 ?auto_14492 )
      ( DELIVER-6PKG-VERIFY ?auto_14491 ?auto_14493 ?auto_14495 ?auto_14496 ?auto_14497 ?auto_14494 ?auto_14492 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_14510 - OBJ
      ?auto_14512 - OBJ
      ?auto_14514 - OBJ
      ?auto_14515 - OBJ
      ?auto_14516 - OBJ
      ?auto_14513 - OBJ
      ?auto_14511 - LOCATION
    )
    :vars
    (
      ?auto_14517 - LOCATION
      ?auto_14520 - CITY
      ?auto_14518 - LOCATION
      ?auto_14521 - LOCATION
      ?auto_14519 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_14512 ?auto_14510 ) ( GREATER-THAN ?auto_14514 ?auto_14510 ) ( GREATER-THAN ?auto_14514 ?auto_14512 ) ( GREATER-THAN ?auto_14515 ?auto_14510 ) ( GREATER-THAN ?auto_14515 ?auto_14512 ) ( GREATER-THAN ?auto_14515 ?auto_14514 ) ( GREATER-THAN ?auto_14516 ?auto_14510 ) ( GREATER-THAN ?auto_14516 ?auto_14512 ) ( GREATER-THAN ?auto_14516 ?auto_14514 ) ( GREATER-THAN ?auto_14516 ?auto_14515 ) ( GREATER-THAN ?auto_14513 ?auto_14510 ) ( GREATER-THAN ?auto_14513 ?auto_14512 ) ( GREATER-THAN ?auto_14513 ?auto_14514 ) ( GREATER-THAN ?auto_14513 ?auto_14515 ) ( GREATER-THAN ?auto_14513 ?auto_14516 ) ( IN-CITY ?auto_14517 ?auto_14520 ) ( IN-CITY ?auto_14511 ?auto_14520 ) ( not ( = ?auto_14511 ?auto_14517 ) ) ( OBJ-AT ?auto_14513 ?auto_14517 ) ( not ( = ?auto_14510 ?auto_14512 ) ) ( not ( = ?auto_14510 ?auto_14514 ) ) ( not ( = ?auto_14510 ?auto_14515 ) ) ( not ( = ?auto_14510 ?auto_14516 ) ) ( not ( = ?auto_14510 ?auto_14513 ) ) ( not ( = ?auto_14512 ?auto_14514 ) ) ( not ( = ?auto_14512 ?auto_14515 ) ) ( not ( = ?auto_14512 ?auto_14516 ) ) ( not ( = ?auto_14512 ?auto_14513 ) ) ( not ( = ?auto_14514 ?auto_14515 ) ) ( not ( = ?auto_14514 ?auto_14516 ) ) ( not ( = ?auto_14514 ?auto_14513 ) ) ( not ( = ?auto_14515 ?auto_14516 ) ) ( not ( = ?auto_14515 ?auto_14513 ) ) ( not ( = ?auto_14516 ?auto_14513 ) ) ( IN-CITY ?auto_14518 ?auto_14520 ) ( not ( = ?auto_14511 ?auto_14518 ) ) ( not ( = ?auto_14517 ?auto_14518 ) ) ( OBJ-AT ?auto_14516 ?auto_14518 ) ( OBJ-AT ?auto_14515 ?auto_14518 ) ( OBJ-AT ?auto_14514 ?auto_14517 ) ( IN-CITY ?auto_14521 ?auto_14520 ) ( not ( = ?auto_14511 ?auto_14521 ) ) ( not ( = ?auto_14517 ?auto_14521 ) ) ( not ( = ?auto_14518 ?auto_14521 ) ) ( OBJ-AT ?auto_14512 ?auto_14521 ) ( TRUCK-AT ?auto_14519 ?auto_14511 ) ( IN-TRUCK ?auto_14510 ?auto_14519 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_14510 ?auto_14511 )
      ( DELIVER-6PKG ?auto_14510 ?auto_14512 ?auto_14514 ?auto_14515 ?auto_14516 ?auto_14513 ?auto_14511 )
      ( DELIVER-6PKG-VERIFY ?auto_14510 ?auto_14512 ?auto_14514 ?auto_14515 ?auto_14516 ?auto_14513 ?auto_14511 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_14529 - OBJ
      ?auto_14531 - OBJ
      ?auto_14533 - OBJ
      ?auto_14534 - OBJ
      ?auto_14535 - OBJ
      ?auto_14532 - OBJ
      ?auto_14530 - LOCATION
    )
    :vars
    (
      ?auto_14539 - LOCATION
      ?auto_14536 - CITY
      ?auto_14538 - LOCATION
      ?auto_14537 - LOCATION
      ?auto_14540 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_14531 ?auto_14529 ) ( GREATER-THAN ?auto_14533 ?auto_14529 ) ( GREATER-THAN ?auto_14533 ?auto_14531 ) ( GREATER-THAN ?auto_14534 ?auto_14529 ) ( GREATER-THAN ?auto_14534 ?auto_14531 ) ( GREATER-THAN ?auto_14534 ?auto_14533 ) ( GREATER-THAN ?auto_14535 ?auto_14529 ) ( GREATER-THAN ?auto_14535 ?auto_14531 ) ( GREATER-THAN ?auto_14535 ?auto_14533 ) ( GREATER-THAN ?auto_14535 ?auto_14534 ) ( GREATER-THAN ?auto_14532 ?auto_14529 ) ( GREATER-THAN ?auto_14532 ?auto_14531 ) ( GREATER-THAN ?auto_14532 ?auto_14533 ) ( GREATER-THAN ?auto_14532 ?auto_14534 ) ( GREATER-THAN ?auto_14532 ?auto_14535 ) ( IN-CITY ?auto_14539 ?auto_14536 ) ( IN-CITY ?auto_14530 ?auto_14536 ) ( not ( = ?auto_14530 ?auto_14539 ) ) ( OBJ-AT ?auto_14532 ?auto_14539 ) ( not ( = ?auto_14529 ?auto_14531 ) ) ( not ( = ?auto_14529 ?auto_14533 ) ) ( not ( = ?auto_14529 ?auto_14534 ) ) ( not ( = ?auto_14529 ?auto_14535 ) ) ( not ( = ?auto_14529 ?auto_14532 ) ) ( not ( = ?auto_14531 ?auto_14533 ) ) ( not ( = ?auto_14531 ?auto_14534 ) ) ( not ( = ?auto_14531 ?auto_14535 ) ) ( not ( = ?auto_14531 ?auto_14532 ) ) ( not ( = ?auto_14533 ?auto_14534 ) ) ( not ( = ?auto_14533 ?auto_14535 ) ) ( not ( = ?auto_14533 ?auto_14532 ) ) ( not ( = ?auto_14534 ?auto_14535 ) ) ( not ( = ?auto_14534 ?auto_14532 ) ) ( not ( = ?auto_14535 ?auto_14532 ) ) ( IN-CITY ?auto_14538 ?auto_14536 ) ( not ( = ?auto_14530 ?auto_14538 ) ) ( not ( = ?auto_14539 ?auto_14538 ) ) ( OBJ-AT ?auto_14535 ?auto_14538 ) ( OBJ-AT ?auto_14534 ?auto_14538 ) ( OBJ-AT ?auto_14533 ?auto_14539 ) ( IN-CITY ?auto_14537 ?auto_14536 ) ( not ( = ?auto_14530 ?auto_14537 ) ) ( not ( = ?auto_14539 ?auto_14537 ) ) ( not ( = ?auto_14538 ?auto_14537 ) ) ( OBJ-AT ?auto_14531 ?auto_14537 ) ( IN-TRUCK ?auto_14529 ?auto_14540 ) ( TRUCK-AT ?auto_14540 ?auto_14537 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_14540 ?auto_14537 ?auto_14530 ?auto_14536 )
      ( DELIVER-6PKG ?auto_14529 ?auto_14531 ?auto_14533 ?auto_14534 ?auto_14535 ?auto_14532 ?auto_14530 )
      ( DELIVER-6PKG-VERIFY ?auto_14529 ?auto_14531 ?auto_14533 ?auto_14534 ?auto_14535 ?auto_14532 ?auto_14530 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_14548 - OBJ
      ?auto_14550 - OBJ
      ?auto_14552 - OBJ
      ?auto_14553 - OBJ
      ?auto_14554 - OBJ
      ?auto_14551 - OBJ
      ?auto_14549 - LOCATION
    )
    :vars
    (
      ?auto_14557 - LOCATION
      ?auto_14559 - CITY
      ?auto_14555 - LOCATION
      ?auto_14558 - LOCATION
      ?auto_14556 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_14550 ?auto_14548 ) ( GREATER-THAN ?auto_14552 ?auto_14548 ) ( GREATER-THAN ?auto_14552 ?auto_14550 ) ( GREATER-THAN ?auto_14553 ?auto_14548 ) ( GREATER-THAN ?auto_14553 ?auto_14550 ) ( GREATER-THAN ?auto_14553 ?auto_14552 ) ( GREATER-THAN ?auto_14554 ?auto_14548 ) ( GREATER-THAN ?auto_14554 ?auto_14550 ) ( GREATER-THAN ?auto_14554 ?auto_14552 ) ( GREATER-THAN ?auto_14554 ?auto_14553 ) ( GREATER-THAN ?auto_14551 ?auto_14548 ) ( GREATER-THAN ?auto_14551 ?auto_14550 ) ( GREATER-THAN ?auto_14551 ?auto_14552 ) ( GREATER-THAN ?auto_14551 ?auto_14553 ) ( GREATER-THAN ?auto_14551 ?auto_14554 ) ( IN-CITY ?auto_14557 ?auto_14559 ) ( IN-CITY ?auto_14549 ?auto_14559 ) ( not ( = ?auto_14549 ?auto_14557 ) ) ( OBJ-AT ?auto_14551 ?auto_14557 ) ( not ( = ?auto_14548 ?auto_14550 ) ) ( not ( = ?auto_14548 ?auto_14552 ) ) ( not ( = ?auto_14548 ?auto_14553 ) ) ( not ( = ?auto_14548 ?auto_14554 ) ) ( not ( = ?auto_14548 ?auto_14551 ) ) ( not ( = ?auto_14550 ?auto_14552 ) ) ( not ( = ?auto_14550 ?auto_14553 ) ) ( not ( = ?auto_14550 ?auto_14554 ) ) ( not ( = ?auto_14550 ?auto_14551 ) ) ( not ( = ?auto_14552 ?auto_14553 ) ) ( not ( = ?auto_14552 ?auto_14554 ) ) ( not ( = ?auto_14552 ?auto_14551 ) ) ( not ( = ?auto_14553 ?auto_14554 ) ) ( not ( = ?auto_14553 ?auto_14551 ) ) ( not ( = ?auto_14554 ?auto_14551 ) ) ( IN-CITY ?auto_14555 ?auto_14559 ) ( not ( = ?auto_14549 ?auto_14555 ) ) ( not ( = ?auto_14557 ?auto_14555 ) ) ( OBJ-AT ?auto_14554 ?auto_14555 ) ( OBJ-AT ?auto_14553 ?auto_14555 ) ( OBJ-AT ?auto_14552 ?auto_14557 ) ( IN-CITY ?auto_14558 ?auto_14559 ) ( not ( = ?auto_14549 ?auto_14558 ) ) ( not ( = ?auto_14557 ?auto_14558 ) ) ( not ( = ?auto_14555 ?auto_14558 ) ) ( OBJ-AT ?auto_14550 ?auto_14558 ) ( TRUCK-AT ?auto_14556 ?auto_14558 ) ( OBJ-AT ?auto_14548 ?auto_14558 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_14548 ?auto_14556 ?auto_14558 )
      ( DELIVER-6PKG ?auto_14548 ?auto_14550 ?auto_14552 ?auto_14553 ?auto_14554 ?auto_14551 ?auto_14549 )
      ( DELIVER-6PKG-VERIFY ?auto_14548 ?auto_14550 ?auto_14552 ?auto_14553 ?auto_14554 ?auto_14551 ?auto_14549 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_14567 - OBJ
      ?auto_14569 - OBJ
      ?auto_14571 - OBJ
      ?auto_14572 - OBJ
      ?auto_14573 - OBJ
      ?auto_14570 - OBJ
      ?auto_14568 - LOCATION
    )
    :vars
    (
      ?auto_14575 - LOCATION
      ?auto_14574 - CITY
      ?auto_14578 - LOCATION
      ?auto_14577 - LOCATION
      ?auto_14576 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_14569 ?auto_14567 ) ( GREATER-THAN ?auto_14571 ?auto_14567 ) ( GREATER-THAN ?auto_14571 ?auto_14569 ) ( GREATER-THAN ?auto_14572 ?auto_14567 ) ( GREATER-THAN ?auto_14572 ?auto_14569 ) ( GREATER-THAN ?auto_14572 ?auto_14571 ) ( GREATER-THAN ?auto_14573 ?auto_14567 ) ( GREATER-THAN ?auto_14573 ?auto_14569 ) ( GREATER-THAN ?auto_14573 ?auto_14571 ) ( GREATER-THAN ?auto_14573 ?auto_14572 ) ( GREATER-THAN ?auto_14570 ?auto_14567 ) ( GREATER-THAN ?auto_14570 ?auto_14569 ) ( GREATER-THAN ?auto_14570 ?auto_14571 ) ( GREATER-THAN ?auto_14570 ?auto_14572 ) ( GREATER-THAN ?auto_14570 ?auto_14573 ) ( IN-CITY ?auto_14575 ?auto_14574 ) ( IN-CITY ?auto_14568 ?auto_14574 ) ( not ( = ?auto_14568 ?auto_14575 ) ) ( OBJ-AT ?auto_14570 ?auto_14575 ) ( not ( = ?auto_14567 ?auto_14569 ) ) ( not ( = ?auto_14567 ?auto_14571 ) ) ( not ( = ?auto_14567 ?auto_14572 ) ) ( not ( = ?auto_14567 ?auto_14573 ) ) ( not ( = ?auto_14567 ?auto_14570 ) ) ( not ( = ?auto_14569 ?auto_14571 ) ) ( not ( = ?auto_14569 ?auto_14572 ) ) ( not ( = ?auto_14569 ?auto_14573 ) ) ( not ( = ?auto_14569 ?auto_14570 ) ) ( not ( = ?auto_14571 ?auto_14572 ) ) ( not ( = ?auto_14571 ?auto_14573 ) ) ( not ( = ?auto_14571 ?auto_14570 ) ) ( not ( = ?auto_14572 ?auto_14573 ) ) ( not ( = ?auto_14572 ?auto_14570 ) ) ( not ( = ?auto_14573 ?auto_14570 ) ) ( IN-CITY ?auto_14578 ?auto_14574 ) ( not ( = ?auto_14568 ?auto_14578 ) ) ( not ( = ?auto_14575 ?auto_14578 ) ) ( OBJ-AT ?auto_14573 ?auto_14578 ) ( OBJ-AT ?auto_14572 ?auto_14578 ) ( OBJ-AT ?auto_14571 ?auto_14575 ) ( IN-CITY ?auto_14577 ?auto_14574 ) ( not ( = ?auto_14568 ?auto_14577 ) ) ( not ( = ?auto_14575 ?auto_14577 ) ) ( not ( = ?auto_14578 ?auto_14577 ) ) ( OBJ-AT ?auto_14569 ?auto_14577 ) ( OBJ-AT ?auto_14567 ?auto_14577 ) ( TRUCK-AT ?auto_14576 ?auto_14568 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_14576 ?auto_14568 ?auto_14577 ?auto_14574 )
      ( DELIVER-6PKG ?auto_14567 ?auto_14569 ?auto_14571 ?auto_14572 ?auto_14573 ?auto_14570 ?auto_14568 )
      ( DELIVER-6PKG-VERIFY ?auto_14567 ?auto_14569 ?auto_14571 ?auto_14572 ?auto_14573 ?auto_14570 ?auto_14568 ) )
  )

)

