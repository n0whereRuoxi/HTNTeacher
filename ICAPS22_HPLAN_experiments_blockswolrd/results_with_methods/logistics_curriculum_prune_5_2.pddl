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

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_101247 - OBJ
      ?auto_101246 - LOCATION
    )
    :vars
    (
      ?auto_101249 - LOCATION
      ?auto_101250 - CITY
      ?auto_101248 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_101249 ?auto_101250 ) ( IN-CITY ?auto_101246 ?auto_101250 ) ( not ( = ?auto_101246 ?auto_101249 ) ) ( OBJ-AT ?auto_101247 ?auto_101249 ) ( TRUCK-AT ?auto_101248 ?auto_101246 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_101248 ?auto_101246 ?auto_101249 ?auto_101250 )
      ( !LOAD-TRUCK ?auto_101247 ?auto_101248 ?auto_101249 )
      ( !DRIVE-TRUCK ?auto_101248 ?auto_101249 ?auto_101246 ?auto_101250 )
      ( !UNLOAD-TRUCK ?auto_101247 ?auto_101248 ?auto_101246 )
      ( DELIVER-1PKG-VERIFY ?auto_101247 ?auto_101246 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_101268 - OBJ
      ?auto_101269 - OBJ
      ?auto_101267 - LOCATION
    )
    :vars
    (
      ?auto_101271 - LOCATION
      ?auto_101270 - CITY
      ?auto_101273 - LOCATION
      ?auto_101272 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_101271 ?auto_101270 ) ( IN-CITY ?auto_101267 ?auto_101270 ) ( not ( = ?auto_101267 ?auto_101271 ) ) ( OBJ-AT ?auto_101269 ?auto_101271 ) ( IN-CITY ?auto_101273 ?auto_101270 ) ( not ( = ?auto_101267 ?auto_101273 ) ) ( OBJ-AT ?auto_101268 ?auto_101273 ) ( TRUCK-AT ?auto_101272 ?auto_101267 ) ( not ( = ?auto_101268 ?auto_101269 ) ) ( not ( = ?auto_101271 ?auto_101273 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_101268 ?auto_101267 )
      ( DELIVER-1PKG ?auto_101269 ?auto_101267 )
      ( DELIVER-2PKG-VERIFY ?auto_101268 ?auto_101269 ?auto_101267 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_101379 - OBJ
      ?auto_101380 - OBJ
      ?auto_101381 - OBJ
      ?auto_101378 - LOCATION
    )
    :vars
    (
      ?auto_101383 - LOCATION
      ?auto_101384 - CITY
      ?auto_101385 - LOCATION
      ?auto_101386 - LOCATION
      ?auto_101382 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_101383 ?auto_101384 ) ( IN-CITY ?auto_101378 ?auto_101384 ) ( not ( = ?auto_101378 ?auto_101383 ) ) ( OBJ-AT ?auto_101381 ?auto_101383 ) ( IN-CITY ?auto_101385 ?auto_101384 ) ( not ( = ?auto_101378 ?auto_101385 ) ) ( OBJ-AT ?auto_101380 ?auto_101385 ) ( IN-CITY ?auto_101386 ?auto_101384 ) ( not ( = ?auto_101378 ?auto_101386 ) ) ( OBJ-AT ?auto_101379 ?auto_101386 ) ( TRUCK-AT ?auto_101382 ?auto_101378 ) ( not ( = ?auto_101379 ?auto_101380 ) ) ( not ( = ?auto_101385 ?auto_101386 ) ) ( not ( = ?auto_101379 ?auto_101381 ) ) ( not ( = ?auto_101380 ?auto_101381 ) ) ( not ( = ?auto_101383 ?auto_101385 ) ) ( not ( = ?auto_101383 ?auto_101386 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_101379 ?auto_101380 ?auto_101378 )
      ( DELIVER-1PKG ?auto_101381 ?auto_101378 )
      ( DELIVER-3PKG-VERIFY ?auto_101379 ?auto_101380 ?auto_101381 ?auto_101378 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_102513 - OBJ
      ?auto_102514 - OBJ
      ?auto_102515 - OBJ
      ?auto_102516 - OBJ
      ?auto_102512 - LOCATION
    )
    :vars
    (
      ?auto_102518 - LOCATION
      ?auto_102519 - CITY
      ?auto_102521 - LOCATION
      ?auto_102520 - LOCATION
      ?auto_102517 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_102518 ?auto_102519 ) ( IN-CITY ?auto_102512 ?auto_102519 ) ( not ( = ?auto_102512 ?auto_102518 ) ) ( OBJ-AT ?auto_102516 ?auto_102518 ) ( OBJ-AT ?auto_102515 ?auto_102518 ) ( IN-CITY ?auto_102521 ?auto_102519 ) ( not ( = ?auto_102512 ?auto_102521 ) ) ( OBJ-AT ?auto_102514 ?auto_102521 ) ( IN-CITY ?auto_102520 ?auto_102519 ) ( not ( = ?auto_102512 ?auto_102520 ) ) ( OBJ-AT ?auto_102513 ?auto_102520 ) ( TRUCK-AT ?auto_102517 ?auto_102512 ) ( not ( = ?auto_102513 ?auto_102514 ) ) ( not ( = ?auto_102521 ?auto_102520 ) ) ( not ( = ?auto_102513 ?auto_102515 ) ) ( not ( = ?auto_102514 ?auto_102515 ) ) ( not ( = ?auto_102518 ?auto_102521 ) ) ( not ( = ?auto_102518 ?auto_102520 ) ) ( not ( = ?auto_102513 ?auto_102516 ) ) ( not ( = ?auto_102514 ?auto_102516 ) ) ( not ( = ?auto_102515 ?auto_102516 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_102513 ?auto_102514 ?auto_102515 ?auto_102512 )
      ( DELIVER-1PKG ?auto_102516 ?auto_102512 )
      ( DELIVER-4PKG-VERIFY ?auto_102513 ?auto_102514 ?auto_102515 ?auto_102516 ?auto_102512 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_102572 - OBJ
      ?auto_102573 - OBJ
      ?auto_102574 - OBJ
      ?auto_102575 - OBJ
      ?auto_102571 - LOCATION
    )
    :vars
    (
      ?auto_102579 - LOCATION
      ?auto_102578 - CITY
      ?auto_102577 - LOCATION
      ?auto_102576 - LOCATION
      ?auto_102580 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_102579 ?auto_102578 ) ( IN-CITY ?auto_102571 ?auto_102578 ) ( not ( = ?auto_102571 ?auto_102579 ) ) ( OBJ-AT ?auto_102575 ?auto_102579 ) ( OBJ-AT ?auto_102573 ?auto_102579 ) ( IN-CITY ?auto_102577 ?auto_102578 ) ( not ( = ?auto_102571 ?auto_102577 ) ) ( OBJ-AT ?auto_102574 ?auto_102577 ) ( IN-CITY ?auto_102576 ?auto_102578 ) ( not ( = ?auto_102571 ?auto_102576 ) ) ( OBJ-AT ?auto_102572 ?auto_102576 ) ( TRUCK-AT ?auto_102580 ?auto_102571 ) ( not ( = ?auto_102572 ?auto_102574 ) ) ( not ( = ?auto_102577 ?auto_102576 ) ) ( not ( = ?auto_102572 ?auto_102573 ) ) ( not ( = ?auto_102574 ?auto_102573 ) ) ( not ( = ?auto_102579 ?auto_102577 ) ) ( not ( = ?auto_102579 ?auto_102576 ) ) ( not ( = ?auto_102572 ?auto_102575 ) ) ( not ( = ?auto_102574 ?auto_102575 ) ) ( not ( = ?auto_102573 ?auto_102575 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_102572 ?auto_102574 ?auto_102573 ?auto_102575 ?auto_102571 )
      ( DELIVER-4PKG-VERIFY ?auto_102572 ?auto_102573 ?auto_102574 ?auto_102575 ?auto_102571 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_102604 - OBJ
      ?auto_102605 - OBJ
      ?auto_102606 - OBJ
      ?auto_102607 - OBJ
      ?auto_102603 - LOCATION
    )
    :vars
    (
      ?auto_102608 - LOCATION
      ?auto_102609 - CITY
      ?auto_102610 - LOCATION
      ?auto_102612 - LOCATION
      ?auto_102611 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_102608 ?auto_102609 ) ( IN-CITY ?auto_102603 ?auto_102609 ) ( not ( = ?auto_102603 ?auto_102608 ) ) ( OBJ-AT ?auto_102606 ?auto_102608 ) ( OBJ-AT ?auto_102605 ?auto_102608 ) ( IN-CITY ?auto_102610 ?auto_102609 ) ( not ( = ?auto_102603 ?auto_102610 ) ) ( OBJ-AT ?auto_102607 ?auto_102610 ) ( IN-CITY ?auto_102612 ?auto_102609 ) ( not ( = ?auto_102603 ?auto_102612 ) ) ( OBJ-AT ?auto_102604 ?auto_102612 ) ( TRUCK-AT ?auto_102611 ?auto_102603 ) ( not ( = ?auto_102604 ?auto_102607 ) ) ( not ( = ?auto_102610 ?auto_102612 ) ) ( not ( = ?auto_102604 ?auto_102605 ) ) ( not ( = ?auto_102607 ?auto_102605 ) ) ( not ( = ?auto_102608 ?auto_102610 ) ) ( not ( = ?auto_102608 ?auto_102612 ) ) ( not ( = ?auto_102604 ?auto_102606 ) ) ( not ( = ?auto_102607 ?auto_102606 ) ) ( not ( = ?auto_102605 ?auto_102606 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_102604 ?auto_102605 ?auto_102607 ?auto_102606 ?auto_102603 )
      ( DELIVER-4PKG-VERIFY ?auto_102604 ?auto_102605 ?auto_102606 ?auto_102607 ?auto_102603 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_103193 - OBJ
      ?auto_103194 - OBJ
      ?auto_103195 - OBJ
      ?auto_103196 - OBJ
      ?auto_103192 - LOCATION
    )
    :vars
    (
      ?auto_103197 - LOCATION
      ?auto_103198 - CITY
      ?auto_103199 - LOCATION
      ?auto_103201 - LOCATION
      ?auto_103200 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_103197 ?auto_103198 ) ( IN-CITY ?auto_103192 ?auto_103198 ) ( not ( = ?auto_103192 ?auto_103197 ) ) ( OBJ-AT ?auto_103196 ?auto_103197 ) ( OBJ-AT ?auto_103193 ?auto_103197 ) ( IN-CITY ?auto_103199 ?auto_103198 ) ( not ( = ?auto_103192 ?auto_103199 ) ) ( OBJ-AT ?auto_103195 ?auto_103199 ) ( IN-CITY ?auto_103201 ?auto_103198 ) ( not ( = ?auto_103192 ?auto_103201 ) ) ( OBJ-AT ?auto_103194 ?auto_103201 ) ( TRUCK-AT ?auto_103200 ?auto_103192 ) ( not ( = ?auto_103194 ?auto_103195 ) ) ( not ( = ?auto_103199 ?auto_103201 ) ) ( not ( = ?auto_103194 ?auto_103193 ) ) ( not ( = ?auto_103195 ?auto_103193 ) ) ( not ( = ?auto_103197 ?auto_103199 ) ) ( not ( = ?auto_103197 ?auto_103201 ) ) ( not ( = ?auto_103194 ?auto_103196 ) ) ( not ( = ?auto_103195 ?auto_103196 ) ) ( not ( = ?auto_103193 ?auto_103196 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_103194 ?auto_103193 ?auto_103195 ?auto_103196 ?auto_103192 )
      ( DELIVER-4PKG-VERIFY ?auto_103193 ?auto_103194 ?auto_103195 ?auto_103196 ?auto_103192 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_103225 - OBJ
      ?auto_103226 - OBJ
      ?auto_103227 - OBJ
      ?auto_103228 - OBJ
      ?auto_103224 - LOCATION
    )
    :vars
    (
      ?auto_103229 - LOCATION
      ?auto_103230 - CITY
      ?auto_103231 - LOCATION
      ?auto_103233 - LOCATION
      ?auto_103232 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_103229 ?auto_103230 ) ( IN-CITY ?auto_103224 ?auto_103230 ) ( not ( = ?auto_103224 ?auto_103229 ) ) ( OBJ-AT ?auto_103227 ?auto_103229 ) ( OBJ-AT ?auto_103225 ?auto_103229 ) ( IN-CITY ?auto_103231 ?auto_103230 ) ( not ( = ?auto_103224 ?auto_103231 ) ) ( OBJ-AT ?auto_103228 ?auto_103231 ) ( IN-CITY ?auto_103233 ?auto_103230 ) ( not ( = ?auto_103224 ?auto_103233 ) ) ( OBJ-AT ?auto_103226 ?auto_103233 ) ( TRUCK-AT ?auto_103232 ?auto_103224 ) ( not ( = ?auto_103226 ?auto_103228 ) ) ( not ( = ?auto_103231 ?auto_103233 ) ) ( not ( = ?auto_103226 ?auto_103225 ) ) ( not ( = ?auto_103228 ?auto_103225 ) ) ( not ( = ?auto_103229 ?auto_103231 ) ) ( not ( = ?auto_103229 ?auto_103233 ) ) ( not ( = ?auto_103226 ?auto_103227 ) ) ( not ( = ?auto_103228 ?auto_103227 ) ) ( not ( = ?auto_103225 ?auto_103227 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_103226 ?auto_103225 ?auto_103228 ?auto_103227 ?auto_103224 )
      ( DELIVER-4PKG-VERIFY ?auto_103225 ?auto_103226 ?auto_103227 ?auto_103228 ?auto_103224 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_103413 - OBJ
      ?auto_103414 - OBJ
      ?auto_103415 - OBJ
      ?auto_103416 - OBJ
      ?auto_103412 - LOCATION
    )
    :vars
    (
      ?auto_103417 - LOCATION
      ?auto_103418 - CITY
      ?auto_103419 - LOCATION
      ?auto_103421 - LOCATION
      ?auto_103420 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_103417 ?auto_103418 ) ( IN-CITY ?auto_103412 ?auto_103418 ) ( not ( = ?auto_103412 ?auto_103417 ) ) ( OBJ-AT ?auto_103414 ?auto_103417 ) ( OBJ-AT ?auto_103413 ?auto_103417 ) ( IN-CITY ?auto_103419 ?auto_103418 ) ( not ( = ?auto_103412 ?auto_103419 ) ) ( OBJ-AT ?auto_103416 ?auto_103419 ) ( IN-CITY ?auto_103421 ?auto_103418 ) ( not ( = ?auto_103412 ?auto_103421 ) ) ( OBJ-AT ?auto_103415 ?auto_103421 ) ( TRUCK-AT ?auto_103420 ?auto_103412 ) ( not ( = ?auto_103415 ?auto_103416 ) ) ( not ( = ?auto_103419 ?auto_103421 ) ) ( not ( = ?auto_103415 ?auto_103413 ) ) ( not ( = ?auto_103416 ?auto_103413 ) ) ( not ( = ?auto_103417 ?auto_103419 ) ) ( not ( = ?auto_103417 ?auto_103421 ) ) ( not ( = ?auto_103415 ?auto_103414 ) ) ( not ( = ?auto_103416 ?auto_103414 ) ) ( not ( = ?auto_103413 ?auto_103414 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_103415 ?auto_103413 ?auto_103416 ?auto_103414 ?auto_103412 )
      ( DELIVER-4PKG-VERIFY ?auto_103413 ?auto_103414 ?auto_103415 ?auto_103416 ?auto_103412 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_118005 - OBJ
      ?auto_118006 - OBJ
      ?auto_118007 - OBJ
      ?auto_118008 - OBJ
      ?auto_118009 - OBJ
      ?auto_118004 - LOCATION
    )
    :vars
    (
      ?auto_118011 - LOCATION
      ?auto_118012 - CITY
      ?auto_118013 - LOCATION
      ?auto_118014 - LOCATION
      ?auto_118015 - LOCATION
      ?auto_118010 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_118011 ?auto_118012 ) ( IN-CITY ?auto_118004 ?auto_118012 ) ( not ( = ?auto_118004 ?auto_118011 ) ) ( OBJ-AT ?auto_118009 ?auto_118011 ) ( IN-CITY ?auto_118013 ?auto_118012 ) ( not ( = ?auto_118004 ?auto_118013 ) ) ( OBJ-AT ?auto_118008 ?auto_118013 ) ( OBJ-AT ?auto_118007 ?auto_118013 ) ( IN-CITY ?auto_118014 ?auto_118012 ) ( not ( = ?auto_118004 ?auto_118014 ) ) ( OBJ-AT ?auto_118006 ?auto_118014 ) ( IN-CITY ?auto_118015 ?auto_118012 ) ( not ( = ?auto_118004 ?auto_118015 ) ) ( OBJ-AT ?auto_118005 ?auto_118015 ) ( TRUCK-AT ?auto_118010 ?auto_118004 ) ( not ( = ?auto_118005 ?auto_118006 ) ) ( not ( = ?auto_118014 ?auto_118015 ) ) ( not ( = ?auto_118005 ?auto_118007 ) ) ( not ( = ?auto_118006 ?auto_118007 ) ) ( not ( = ?auto_118013 ?auto_118014 ) ) ( not ( = ?auto_118013 ?auto_118015 ) ) ( not ( = ?auto_118005 ?auto_118008 ) ) ( not ( = ?auto_118006 ?auto_118008 ) ) ( not ( = ?auto_118007 ?auto_118008 ) ) ( not ( = ?auto_118005 ?auto_118009 ) ) ( not ( = ?auto_118006 ?auto_118009 ) ) ( not ( = ?auto_118007 ?auto_118009 ) ) ( not ( = ?auto_118008 ?auto_118009 ) ) ( not ( = ?auto_118011 ?auto_118013 ) ) ( not ( = ?auto_118011 ?auto_118014 ) ) ( not ( = ?auto_118011 ?auto_118015 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_118005 ?auto_118007 ?auto_118006 ?auto_118008 ?auto_118004 )
      ( DELIVER-1PKG ?auto_118009 ?auto_118004 )
      ( DELIVER-5PKG-VERIFY ?auto_118005 ?auto_118006 ?auto_118007 ?auto_118008 ?auto_118009 ?auto_118004 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_118056 - OBJ
      ?auto_118057 - OBJ
      ?auto_118058 - OBJ
      ?auto_118059 - OBJ
      ?auto_118060 - OBJ
      ?auto_118055 - LOCATION
    )
    :vars
    (
      ?auto_118062 - LOCATION
      ?auto_118063 - CITY
      ?auto_118065 - LOCATION
      ?auto_118064 - LOCATION
      ?auto_118066 - LOCATION
      ?auto_118061 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_118062 ?auto_118063 ) ( IN-CITY ?auto_118055 ?auto_118063 ) ( not ( = ?auto_118055 ?auto_118062 ) ) ( OBJ-AT ?auto_118059 ?auto_118062 ) ( IN-CITY ?auto_118065 ?auto_118063 ) ( not ( = ?auto_118055 ?auto_118065 ) ) ( OBJ-AT ?auto_118060 ?auto_118065 ) ( OBJ-AT ?auto_118058 ?auto_118065 ) ( IN-CITY ?auto_118064 ?auto_118063 ) ( not ( = ?auto_118055 ?auto_118064 ) ) ( OBJ-AT ?auto_118057 ?auto_118064 ) ( IN-CITY ?auto_118066 ?auto_118063 ) ( not ( = ?auto_118055 ?auto_118066 ) ) ( OBJ-AT ?auto_118056 ?auto_118066 ) ( TRUCK-AT ?auto_118061 ?auto_118055 ) ( not ( = ?auto_118056 ?auto_118057 ) ) ( not ( = ?auto_118064 ?auto_118066 ) ) ( not ( = ?auto_118056 ?auto_118058 ) ) ( not ( = ?auto_118057 ?auto_118058 ) ) ( not ( = ?auto_118065 ?auto_118064 ) ) ( not ( = ?auto_118065 ?auto_118066 ) ) ( not ( = ?auto_118056 ?auto_118060 ) ) ( not ( = ?auto_118057 ?auto_118060 ) ) ( not ( = ?auto_118058 ?auto_118060 ) ) ( not ( = ?auto_118056 ?auto_118059 ) ) ( not ( = ?auto_118057 ?auto_118059 ) ) ( not ( = ?auto_118058 ?auto_118059 ) ) ( not ( = ?auto_118060 ?auto_118059 ) ) ( not ( = ?auto_118062 ?auto_118065 ) ) ( not ( = ?auto_118062 ?auto_118064 ) ) ( not ( = ?auto_118062 ?auto_118066 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_118056 ?auto_118057 ?auto_118058 ?auto_118060 ?auto_118059 ?auto_118055 )
      ( DELIVER-5PKG-VERIFY ?auto_118056 ?auto_118057 ?auto_118058 ?auto_118059 ?auto_118060 ?auto_118055 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_118359 - OBJ
      ?auto_118360 - OBJ
      ?auto_118361 - OBJ
      ?auto_118362 - OBJ
      ?auto_118363 - OBJ
      ?auto_118358 - LOCATION
    )
    :vars
    (
      ?auto_118365 - LOCATION
      ?auto_118369 - CITY
      ?auto_118368 - LOCATION
      ?auto_118367 - LOCATION
      ?auto_118366 - LOCATION
      ?auto_118364 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_118365 ?auto_118369 ) ( IN-CITY ?auto_118358 ?auto_118369 ) ( not ( = ?auto_118358 ?auto_118365 ) ) ( OBJ-AT ?auto_118361 ?auto_118365 ) ( IN-CITY ?auto_118368 ?auto_118369 ) ( not ( = ?auto_118358 ?auto_118368 ) ) ( OBJ-AT ?auto_118363 ?auto_118368 ) ( OBJ-AT ?auto_118362 ?auto_118368 ) ( IN-CITY ?auto_118367 ?auto_118369 ) ( not ( = ?auto_118358 ?auto_118367 ) ) ( OBJ-AT ?auto_118360 ?auto_118367 ) ( IN-CITY ?auto_118366 ?auto_118369 ) ( not ( = ?auto_118358 ?auto_118366 ) ) ( OBJ-AT ?auto_118359 ?auto_118366 ) ( TRUCK-AT ?auto_118364 ?auto_118358 ) ( not ( = ?auto_118359 ?auto_118360 ) ) ( not ( = ?auto_118367 ?auto_118366 ) ) ( not ( = ?auto_118359 ?auto_118362 ) ) ( not ( = ?auto_118360 ?auto_118362 ) ) ( not ( = ?auto_118368 ?auto_118367 ) ) ( not ( = ?auto_118368 ?auto_118366 ) ) ( not ( = ?auto_118359 ?auto_118363 ) ) ( not ( = ?auto_118360 ?auto_118363 ) ) ( not ( = ?auto_118362 ?auto_118363 ) ) ( not ( = ?auto_118359 ?auto_118361 ) ) ( not ( = ?auto_118360 ?auto_118361 ) ) ( not ( = ?auto_118362 ?auto_118361 ) ) ( not ( = ?auto_118363 ?auto_118361 ) ) ( not ( = ?auto_118365 ?auto_118368 ) ) ( not ( = ?auto_118365 ?auto_118367 ) ) ( not ( = ?auto_118365 ?auto_118366 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_118359 ?auto_118360 ?auto_118362 ?auto_118361 ?auto_118363 ?auto_118358 )
      ( DELIVER-5PKG-VERIFY ?auto_118359 ?auto_118360 ?auto_118361 ?auto_118362 ?auto_118363 ?auto_118358 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_118671 - OBJ
      ?auto_118672 - OBJ
      ?auto_118673 - OBJ
      ?auto_118674 - OBJ
      ?auto_118675 - OBJ
      ?auto_118670 - LOCATION
    )
    :vars
    (
      ?auto_118677 - LOCATION
      ?auto_118681 - CITY
      ?auto_118680 - LOCATION
      ?auto_118679 - LOCATION
      ?auto_118678 - LOCATION
      ?auto_118676 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_118677 ?auto_118681 ) ( IN-CITY ?auto_118670 ?auto_118681 ) ( not ( = ?auto_118670 ?auto_118677 ) ) ( OBJ-AT ?auto_118675 ?auto_118677 ) ( IN-CITY ?auto_118680 ?auto_118681 ) ( not ( = ?auto_118670 ?auto_118680 ) ) ( OBJ-AT ?auto_118674 ?auto_118680 ) ( OBJ-AT ?auto_118672 ?auto_118680 ) ( IN-CITY ?auto_118679 ?auto_118681 ) ( not ( = ?auto_118670 ?auto_118679 ) ) ( OBJ-AT ?auto_118673 ?auto_118679 ) ( IN-CITY ?auto_118678 ?auto_118681 ) ( not ( = ?auto_118670 ?auto_118678 ) ) ( OBJ-AT ?auto_118671 ?auto_118678 ) ( TRUCK-AT ?auto_118676 ?auto_118670 ) ( not ( = ?auto_118671 ?auto_118673 ) ) ( not ( = ?auto_118679 ?auto_118678 ) ) ( not ( = ?auto_118671 ?auto_118672 ) ) ( not ( = ?auto_118673 ?auto_118672 ) ) ( not ( = ?auto_118680 ?auto_118679 ) ) ( not ( = ?auto_118680 ?auto_118678 ) ) ( not ( = ?auto_118671 ?auto_118674 ) ) ( not ( = ?auto_118673 ?auto_118674 ) ) ( not ( = ?auto_118672 ?auto_118674 ) ) ( not ( = ?auto_118671 ?auto_118675 ) ) ( not ( = ?auto_118673 ?auto_118675 ) ) ( not ( = ?auto_118672 ?auto_118675 ) ) ( not ( = ?auto_118674 ?auto_118675 ) ) ( not ( = ?auto_118677 ?auto_118680 ) ) ( not ( = ?auto_118677 ?auto_118679 ) ) ( not ( = ?auto_118677 ?auto_118678 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_118671 ?auto_118673 ?auto_118672 ?auto_118675 ?auto_118674 ?auto_118670 )
      ( DELIVER-5PKG-VERIFY ?auto_118671 ?auto_118672 ?auto_118673 ?auto_118674 ?auto_118675 ?auto_118670 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_118722 - OBJ
      ?auto_118723 - OBJ
      ?auto_118724 - OBJ
      ?auto_118725 - OBJ
      ?auto_118726 - OBJ
      ?auto_118721 - LOCATION
    )
    :vars
    (
      ?auto_118728 - LOCATION
      ?auto_118732 - CITY
      ?auto_118731 - LOCATION
      ?auto_118730 - LOCATION
      ?auto_118729 - LOCATION
      ?auto_118727 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_118728 ?auto_118732 ) ( IN-CITY ?auto_118721 ?auto_118732 ) ( not ( = ?auto_118721 ?auto_118728 ) ) ( OBJ-AT ?auto_118725 ?auto_118728 ) ( IN-CITY ?auto_118731 ?auto_118732 ) ( not ( = ?auto_118721 ?auto_118731 ) ) ( OBJ-AT ?auto_118726 ?auto_118731 ) ( OBJ-AT ?auto_118723 ?auto_118731 ) ( IN-CITY ?auto_118730 ?auto_118732 ) ( not ( = ?auto_118721 ?auto_118730 ) ) ( OBJ-AT ?auto_118724 ?auto_118730 ) ( IN-CITY ?auto_118729 ?auto_118732 ) ( not ( = ?auto_118721 ?auto_118729 ) ) ( OBJ-AT ?auto_118722 ?auto_118729 ) ( TRUCK-AT ?auto_118727 ?auto_118721 ) ( not ( = ?auto_118722 ?auto_118724 ) ) ( not ( = ?auto_118730 ?auto_118729 ) ) ( not ( = ?auto_118722 ?auto_118723 ) ) ( not ( = ?auto_118724 ?auto_118723 ) ) ( not ( = ?auto_118731 ?auto_118730 ) ) ( not ( = ?auto_118731 ?auto_118729 ) ) ( not ( = ?auto_118722 ?auto_118726 ) ) ( not ( = ?auto_118724 ?auto_118726 ) ) ( not ( = ?auto_118723 ?auto_118726 ) ) ( not ( = ?auto_118722 ?auto_118725 ) ) ( not ( = ?auto_118724 ?auto_118725 ) ) ( not ( = ?auto_118723 ?auto_118725 ) ) ( not ( = ?auto_118726 ?auto_118725 ) ) ( not ( = ?auto_118728 ?auto_118731 ) ) ( not ( = ?auto_118728 ?auto_118730 ) ) ( not ( = ?auto_118728 ?auto_118729 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_118722 ?auto_118724 ?auto_118723 ?auto_118725 ?auto_118726 ?auto_118721 )
      ( DELIVER-5PKG-VERIFY ?auto_118722 ?auto_118723 ?auto_118724 ?auto_118725 ?auto_118726 ?auto_118721 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_118882 - OBJ
      ?auto_118883 - OBJ
      ?auto_118884 - OBJ
      ?auto_118885 - OBJ
      ?auto_118886 - OBJ
      ?auto_118881 - LOCATION
    )
    :vars
    (
      ?auto_118888 - LOCATION
      ?auto_118892 - CITY
      ?auto_118891 - LOCATION
      ?auto_118890 - LOCATION
      ?auto_118889 - LOCATION
      ?auto_118887 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_118888 ?auto_118892 ) ( IN-CITY ?auto_118881 ?auto_118892 ) ( not ( = ?auto_118881 ?auto_118888 ) ) ( OBJ-AT ?auto_118886 ?auto_118888 ) ( IN-CITY ?auto_118891 ?auto_118892 ) ( not ( = ?auto_118881 ?auto_118891 ) ) ( OBJ-AT ?auto_118884 ?auto_118891 ) ( OBJ-AT ?auto_118883 ?auto_118891 ) ( IN-CITY ?auto_118890 ?auto_118892 ) ( not ( = ?auto_118881 ?auto_118890 ) ) ( OBJ-AT ?auto_118885 ?auto_118890 ) ( IN-CITY ?auto_118889 ?auto_118892 ) ( not ( = ?auto_118881 ?auto_118889 ) ) ( OBJ-AT ?auto_118882 ?auto_118889 ) ( TRUCK-AT ?auto_118887 ?auto_118881 ) ( not ( = ?auto_118882 ?auto_118885 ) ) ( not ( = ?auto_118890 ?auto_118889 ) ) ( not ( = ?auto_118882 ?auto_118883 ) ) ( not ( = ?auto_118885 ?auto_118883 ) ) ( not ( = ?auto_118891 ?auto_118890 ) ) ( not ( = ?auto_118891 ?auto_118889 ) ) ( not ( = ?auto_118882 ?auto_118884 ) ) ( not ( = ?auto_118885 ?auto_118884 ) ) ( not ( = ?auto_118883 ?auto_118884 ) ) ( not ( = ?auto_118882 ?auto_118886 ) ) ( not ( = ?auto_118885 ?auto_118886 ) ) ( not ( = ?auto_118883 ?auto_118886 ) ) ( not ( = ?auto_118884 ?auto_118886 ) ) ( not ( = ?auto_118888 ?auto_118891 ) ) ( not ( = ?auto_118888 ?auto_118890 ) ) ( not ( = ?auto_118888 ?auto_118889 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_118882 ?auto_118885 ?auto_118883 ?auto_118886 ?auto_118884 ?auto_118881 )
      ( DELIVER-5PKG-VERIFY ?auto_118882 ?auto_118883 ?auto_118884 ?auto_118885 ?auto_118886 ?auto_118881 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_126694 - OBJ
      ?auto_126695 - OBJ
      ?auto_126696 - OBJ
      ?auto_126697 - OBJ
      ?auto_126698 - OBJ
      ?auto_126693 - LOCATION
    )
    :vars
    (
      ?auto_126700 - LOCATION
      ?auto_126704 - CITY
      ?auto_126703 - LOCATION
      ?auto_126702 - LOCATION
      ?auto_126701 - LOCATION
      ?auto_126699 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_126700 ?auto_126704 ) ( IN-CITY ?auto_126693 ?auto_126704 ) ( not ( = ?auto_126693 ?auto_126700 ) ) ( OBJ-AT ?auto_126698 ?auto_126700 ) ( IN-CITY ?auto_126703 ?auto_126704 ) ( not ( = ?auto_126693 ?auto_126703 ) ) ( OBJ-AT ?auto_126697 ?auto_126703 ) ( OBJ-AT ?auto_126694 ?auto_126703 ) ( IN-CITY ?auto_126702 ?auto_126704 ) ( not ( = ?auto_126693 ?auto_126702 ) ) ( OBJ-AT ?auto_126696 ?auto_126702 ) ( IN-CITY ?auto_126701 ?auto_126704 ) ( not ( = ?auto_126693 ?auto_126701 ) ) ( OBJ-AT ?auto_126695 ?auto_126701 ) ( TRUCK-AT ?auto_126699 ?auto_126693 ) ( not ( = ?auto_126695 ?auto_126696 ) ) ( not ( = ?auto_126702 ?auto_126701 ) ) ( not ( = ?auto_126695 ?auto_126694 ) ) ( not ( = ?auto_126696 ?auto_126694 ) ) ( not ( = ?auto_126703 ?auto_126702 ) ) ( not ( = ?auto_126703 ?auto_126701 ) ) ( not ( = ?auto_126695 ?auto_126697 ) ) ( not ( = ?auto_126696 ?auto_126697 ) ) ( not ( = ?auto_126694 ?auto_126697 ) ) ( not ( = ?auto_126695 ?auto_126698 ) ) ( not ( = ?auto_126696 ?auto_126698 ) ) ( not ( = ?auto_126694 ?auto_126698 ) ) ( not ( = ?auto_126697 ?auto_126698 ) ) ( not ( = ?auto_126700 ?auto_126703 ) ) ( not ( = ?auto_126700 ?auto_126702 ) ) ( not ( = ?auto_126700 ?auto_126701 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_126695 ?auto_126696 ?auto_126694 ?auto_126698 ?auto_126697 ?auto_126693 )
      ( DELIVER-5PKG-VERIFY ?auto_126694 ?auto_126695 ?auto_126696 ?auto_126697 ?auto_126698 ?auto_126693 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_126745 - OBJ
      ?auto_126746 - OBJ
      ?auto_126747 - OBJ
      ?auto_126748 - OBJ
      ?auto_126749 - OBJ
      ?auto_126744 - LOCATION
    )
    :vars
    (
      ?auto_126751 - LOCATION
      ?auto_126755 - CITY
      ?auto_126754 - LOCATION
      ?auto_126753 - LOCATION
      ?auto_126752 - LOCATION
      ?auto_126750 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_126751 ?auto_126755 ) ( IN-CITY ?auto_126744 ?auto_126755 ) ( not ( = ?auto_126744 ?auto_126751 ) ) ( OBJ-AT ?auto_126748 ?auto_126751 ) ( IN-CITY ?auto_126754 ?auto_126755 ) ( not ( = ?auto_126744 ?auto_126754 ) ) ( OBJ-AT ?auto_126749 ?auto_126754 ) ( OBJ-AT ?auto_126745 ?auto_126754 ) ( IN-CITY ?auto_126753 ?auto_126755 ) ( not ( = ?auto_126744 ?auto_126753 ) ) ( OBJ-AT ?auto_126747 ?auto_126753 ) ( IN-CITY ?auto_126752 ?auto_126755 ) ( not ( = ?auto_126744 ?auto_126752 ) ) ( OBJ-AT ?auto_126746 ?auto_126752 ) ( TRUCK-AT ?auto_126750 ?auto_126744 ) ( not ( = ?auto_126746 ?auto_126747 ) ) ( not ( = ?auto_126753 ?auto_126752 ) ) ( not ( = ?auto_126746 ?auto_126745 ) ) ( not ( = ?auto_126747 ?auto_126745 ) ) ( not ( = ?auto_126754 ?auto_126753 ) ) ( not ( = ?auto_126754 ?auto_126752 ) ) ( not ( = ?auto_126746 ?auto_126749 ) ) ( not ( = ?auto_126747 ?auto_126749 ) ) ( not ( = ?auto_126745 ?auto_126749 ) ) ( not ( = ?auto_126746 ?auto_126748 ) ) ( not ( = ?auto_126747 ?auto_126748 ) ) ( not ( = ?auto_126745 ?auto_126748 ) ) ( not ( = ?auto_126749 ?auto_126748 ) ) ( not ( = ?auto_126751 ?auto_126754 ) ) ( not ( = ?auto_126751 ?auto_126753 ) ) ( not ( = ?auto_126751 ?auto_126752 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_126746 ?auto_126747 ?auto_126745 ?auto_126748 ?auto_126749 ?auto_126744 )
      ( DELIVER-5PKG-VERIFY ?auto_126745 ?auto_126746 ?auto_126747 ?auto_126748 ?auto_126749 ?auto_126744 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_126905 - OBJ
      ?auto_126906 - OBJ
      ?auto_126907 - OBJ
      ?auto_126908 - OBJ
      ?auto_126909 - OBJ
      ?auto_126904 - LOCATION
    )
    :vars
    (
      ?auto_126911 - LOCATION
      ?auto_126915 - CITY
      ?auto_126914 - LOCATION
      ?auto_126913 - LOCATION
      ?auto_126912 - LOCATION
      ?auto_126910 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_126911 ?auto_126915 ) ( IN-CITY ?auto_126904 ?auto_126915 ) ( not ( = ?auto_126904 ?auto_126911 ) ) ( OBJ-AT ?auto_126909 ?auto_126911 ) ( IN-CITY ?auto_126914 ?auto_126915 ) ( not ( = ?auto_126904 ?auto_126914 ) ) ( OBJ-AT ?auto_126907 ?auto_126914 ) ( OBJ-AT ?auto_126905 ?auto_126914 ) ( IN-CITY ?auto_126913 ?auto_126915 ) ( not ( = ?auto_126904 ?auto_126913 ) ) ( OBJ-AT ?auto_126908 ?auto_126913 ) ( IN-CITY ?auto_126912 ?auto_126915 ) ( not ( = ?auto_126904 ?auto_126912 ) ) ( OBJ-AT ?auto_126906 ?auto_126912 ) ( TRUCK-AT ?auto_126910 ?auto_126904 ) ( not ( = ?auto_126906 ?auto_126908 ) ) ( not ( = ?auto_126913 ?auto_126912 ) ) ( not ( = ?auto_126906 ?auto_126905 ) ) ( not ( = ?auto_126908 ?auto_126905 ) ) ( not ( = ?auto_126914 ?auto_126913 ) ) ( not ( = ?auto_126914 ?auto_126912 ) ) ( not ( = ?auto_126906 ?auto_126907 ) ) ( not ( = ?auto_126908 ?auto_126907 ) ) ( not ( = ?auto_126905 ?auto_126907 ) ) ( not ( = ?auto_126906 ?auto_126909 ) ) ( not ( = ?auto_126908 ?auto_126909 ) ) ( not ( = ?auto_126905 ?auto_126909 ) ) ( not ( = ?auto_126907 ?auto_126909 ) ) ( not ( = ?auto_126911 ?auto_126914 ) ) ( not ( = ?auto_126911 ?auto_126913 ) ) ( not ( = ?auto_126911 ?auto_126912 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_126906 ?auto_126908 ?auto_126905 ?auto_126909 ?auto_126907 ?auto_126904 )
      ( DELIVER-5PKG-VERIFY ?auto_126905 ?auto_126906 ?auto_126907 ?auto_126908 ?auto_126909 ?auto_126904 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_128947 - OBJ
      ?auto_128948 - OBJ
      ?auto_128949 - OBJ
      ?auto_128950 - OBJ
      ?auto_128951 - OBJ
      ?auto_128946 - LOCATION
    )
    :vars
    (
      ?auto_128953 - LOCATION
      ?auto_128957 - CITY
      ?auto_128956 - LOCATION
      ?auto_128955 - LOCATION
      ?auto_128954 - LOCATION
      ?auto_128952 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_128953 ?auto_128957 ) ( IN-CITY ?auto_128946 ?auto_128957 ) ( not ( = ?auto_128946 ?auto_128953 ) ) ( OBJ-AT ?auto_128951 ?auto_128953 ) ( IN-CITY ?auto_128956 ?auto_128957 ) ( not ( = ?auto_128946 ?auto_128956 ) ) ( OBJ-AT ?auto_128948 ?auto_128956 ) ( OBJ-AT ?auto_128947 ?auto_128956 ) ( IN-CITY ?auto_128955 ?auto_128957 ) ( not ( = ?auto_128946 ?auto_128955 ) ) ( OBJ-AT ?auto_128950 ?auto_128955 ) ( IN-CITY ?auto_128954 ?auto_128957 ) ( not ( = ?auto_128946 ?auto_128954 ) ) ( OBJ-AT ?auto_128949 ?auto_128954 ) ( TRUCK-AT ?auto_128952 ?auto_128946 ) ( not ( = ?auto_128949 ?auto_128950 ) ) ( not ( = ?auto_128955 ?auto_128954 ) ) ( not ( = ?auto_128949 ?auto_128947 ) ) ( not ( = ?auto_128950 ?auto_128947 ) ) ( not ( = ?auto_128956 ?auto_128955 ) ) ( not ( = ?auto_128956 ?auto_128954 ) ) ( not ( = ?auto_128949 ?auto_128948 ) ) ( not ( = ?auto_128950 ?auto_128948 ) ) ( not ( = ?auto_128947 ?auto_128948 ) ) ( not ( = ?auto_128949 ?auto_128951 ) ) ( not ( = ?auto_128950 ?auto_128951 ) ) ( not ( = ?auto_128947 ?auto_128951 ) ) ( not ( = ?auto_128948 ?auto_128951 ) ) ( not ( = ?auto_128953 ?auto_128956 ) ) ( not ( = ?auto_128953 ?auto_128955 ) ) ( not ( = ?auto_128953 ?auto_128954 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_128949 ?auto_128950 ?auto_128947 ?auto_128951 ?auto_128948 ?auto_128946 )
      ( DELIVER-5PKG-VERIFY ?auto_128947 ?auto_128948 ?auto_128949 ?auto_128950 ?auto_128951 ?auto_128946 ) )
  )

)

