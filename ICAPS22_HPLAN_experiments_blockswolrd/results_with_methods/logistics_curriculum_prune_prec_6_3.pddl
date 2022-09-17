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
      ?auto_2351325 - OBJ
      ?auto_2351324 - LOCATION
    )
    :vars
    (
      ?auto_2351327 - LOCATION
      ?auto_2351328 - CITY
      ?auto_2351326 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2351327 ?auto_2351328 ) ( IN-CITY ?auto_2351324 ?auto_2351328 ) ( not ( = ?auto_2351324 ?auto_2351327 ) ) ( OBJ-AT ?auto_2351325 ?auto_2351327 ) ( TRUCK-AT ?auto_2351326 ?auto_2351324 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_2351326 ?auto_2351324 ?auto_2351327 ?auto_2351328 )
      ( !LOAD-TRUCK ?auto_2351325 ?auto_2351326 ?auto_2351327 )
      ( !DRIVE-TRUCK ?auto_2351326 ?auto_2351327 ?auto_2351324 ?auto_2351328 )
      ( !UNLOAD-TRUCK ?auto_2351325 ?auto_2351326 ?auto_2351324 )
      ( DELIVER-1PKG-VERIFY ?auto_2351325 ?auto_2351324 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2351346 - OBJ
      ?auto_2351347 - OBJ
      ?auto_2351345 - LOCATION
    )
    :vars
    (
      ?auto_2351349 - LOCATION
      ?auto_2351350 - CITY
      ?auto_2351351 - LOCATION
      ?auto_2351348 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2351349 ?auto_2351350 ) ( IN-CITY ?auto_2351345 ?auto_2351350 ) ( not ( = ?auto_2351345 ?auto_2351349 ) ) ( OBJ-AT ?auto_2351347 ?auto_2351349 ) ( IN-CITY ?auto_2351351 ?auto_2351350 ) ( not ( = ?auto_2351345 ?auto_2351351 ) ) ( OBJ-AT ?auto_2351346 ?auto_2351351 ) ( TRUCK-AT ?auto_2351348 ?auto_2351345 ) ( not ( = ?auto_2351346 ?auto_2351347 ) ) ( not ( = ?auto_2351349 ?auto_2351351 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2351346 ?auto_2351345 )
      ( DELIVER-1PKG ?auto_2351347 ?auto_2351345 )
      ( DELIVER-2PKG-VERIFY ?auto_2351346 ?auto_2351347 ?auto_2351345 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2351457 - OBJ
      ?auto_2351458 - OBJ
      ?auto_2351459 - OBJ
      ?auto_2351456 - LOCATION
    )
    :vars
    (
      ?auto_2351460 - LOCATION
      ?auto_2351462 - CITY
      ?auto_2351464 - LOCATION
      ?auto_2351463 - LOCATION
      ?auto_2351461 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2351460 ?auto_2351462 ) ( IN-CITY ?auto_2351456 ?auto_2351462 ) ( not ( = ?auto_2351456 ?auto_2351460 ) ) ( OBJ-AT ?auto_2351459 ?auto_2351460 ) ( IN-CITY ?auto_2351464 ?auto_2351462 ) ( not ( = ?auto_2351456 ?auto_2351464 ) ) ( OBJ-AT ?auto_2351458 ?auto_2351464 ) ( IN-CITY ?auto_2351463 ?auto_2351462 ) ( not ( = ?auto_2351456 ?auto_2351463 ) ) ( OBJ-AT ?auto_2351457 ?auto_2351463 ) ( TRUCK-AT ?auto_2351461 ?auto_2351456 ) ( not ( = ?auto_2351457 ?auto_2351458 ) ) ( not ( = ?auto_2351464 ?auto_2351463 ) ) ( not ( = ?auto_2351457 ?auto_2351459 ) ) ( not ( = ?auto_2351458 ?auto_2351459 ) ) ( not ( = ?auto_2351460 ?auto_2351464 ) ) ( not ( = ?auto_2351460 ?auto_2351463 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2351457 ?auto_2351458 ?auto_2351456 )
      ( DELIVER-1PKG ?auto_2351459 ?auto_2351456 )
      ( DELIVER-3PKG-VERIFY ?auto_2351457 ?auto_2351458 ?auto_2351459 ?auto_2351456 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_2352600 - OBJ
      ?auto_2352601 - OBJ
      ?auto_2352602 - OBJ
      ?auto_2352603 - OBJ
      ?auto_2352599 - LOCATION
    )
    :vars
    (
      ?auto_2352604 - LOCATION
      ?auto_2352606 - CITY
      ?auto_2352607 - LOCATION
      ?auto_2352609 - LOCATION
      ?auto_2352608 - LOCATION
      ?auto_2352605 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2352604 ?auto_2352606 ) ( IN-CITY ?auto_2352599 ?auto_2352606 ) ( not ( = ?auto_2352599 ?auto_2352604 ) ) ( OBJ-AT ?auto_2352603 ?auto_2352604 ) ( IN-CITY ?auto_2352607 ?auto_2352606 ) ( not ( = ?auto_2352599 ?auto_2352607 ) ) ( OBJ-AT ?auto_2352602 ?auto_2352607 ) ( IN-CITY ?auto_2352609 ?auto_2352606 ) ( not ( = ?auto_2352599 ?auto_2352609 ) ) ( OBJ-AT ?auto_2352601 ?auto_2352609 ) ( IN-CITY ?auto_2352608 ?auto_2352606 ) ( not ( = ?auto_2352599 ?auto_2352608 ) ) ( OBJ-AT ?auto_2352600 ?auto_2352608 ) ( TRUCK-AT ?auto_2352605 ?auto_2352599 ) ( not ( = ?auto_2352600 ?auto_2352601 ) ) ( not ( = ?auto_2352609 ?auto_2352608 ) ) ( not ( = ?auto_2352600 ?auto_2352602 ) ) ( not ( = ?auto_2352601 ?auto_2352602 ) ) ( not ( = ?auto_2352607 ?auto_2352609 ) ) ( not ( = ?auto_2352607 ?auto_2352608 ) ) ( not ( = ?auto_2352600 ?auto_2352603 ) ) ( not ( = ?auto_2352601 ?auto_2352603 ) ) ( not ( = ?auto_2352602 ?auto_2352603 ) ) ( not ( = ?auto_2352604 ?auto_2352607 ) ) ( not ( = ?auto_2352604 ?auto_2352609 ) ) ( not ( = ?auto_2352604 ?auto_2352608 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_2352600 ?auto_2352601 ?auto_2352602 ?auto_2352599 )
      ( DELIVER-1PKG ?auto_2352603 ?auto_2352599 )
      ( DELIVER-4PKG-VERIFY ?auto_2352600 ?auto_2352601 ?auto_2352602 ?auto_2352603 ?auto_2352599 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_2368210 - OBJ
      ?auto_2368211 - OBJ
      ?auto_2368212 - OBJ
      ?auto_2368213 - OBJ
      ?auto_2368214 - OBJ
      ?auto_2368209 - LOCATION
    )
    :vars
    (
      ?auto_2368217 - LOCATION
      ?auto_2368216 - CITY
      ?auto_2368218 - LOCATION
      ?auto_2368219 - LOCATION
      ?auto_2368220 - LOCATION
      ?auto_2368215 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2368217 ?auto_2368216 ) ( IN-CITY ?auto_2368209 ?auto_2368216 ) ( not ( = ?auto_2368209 ?auto_2368217 ) ) ( OBJ-AT ?auto_2368214 ?auto_2368217 ) ( OBJ-AT ?auto_2368213 ?auto_2368217 ) ( IN-CITY ?auto_2368218 ?auto_2368216 ) ( not ( = ?auto_2368209 ?auto_2368218 ) ) ( OBJ-AT ?auto_2368212 ?auto_2368218 ) ( IN-CITY ?auto_2368219 ?auto_2368216 ) ( not ( = ?auto_2368209 ?auto_2368219 ) ) ( OBJ-AT ?auto_2368211 ?auto_2368219 ) ( IN-CITY ?auto_2368220 ?auto_2368216 ) ( not ( = ?auto_2368209 ?auto_2368220 ) ) ( OBJ-AT ?auto_2368210 ?auto_2368220 ) ( TRUCK-AT ?auto_2368215 ?auto_2368209 ) ( not ( = ?auto_2368210 ?auto_2368211 ) ) ( not ( = ?auto_2368219 ?auto_2368220 ) ) ( not ( = ?auto_2368210 ?auto_2368212 ) ) ( not ( = ?auto_2368211 ?auto_2368212 ) ) ( not ( = ?auto_2368218 ?auto_2368219 ) ) ( not ( = ?auto_2368218 ?auto_2368220 ) ) ( not ( = ?auto_2368210 ?auto_2368213 ) ) ( not ( = ?auto_2368211 ?auto_2368213 ) ) ( not ( = ?auto_2368212 ?auto_2368213 ) ) ( not ( = ?auto_2368217 ?auto_2368218 ) ) ( not ( = ?auto_2368217 ?auto_2368219 ) ) ( not ( = ?auto_2368217 ?auto_2368220 ) ) ( not ( = ?auto_2368210 ?auto_2368214 ) ) ( not ( = ?auto_2368211 ?auto_2368214 ) ) ( not ( = ?auto_2368212 ?auto_2368214 ) ) ( not ( = ?auto_2368213 ?auto_2368214 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_2368210 ?auto_2368211 ?auto_2368212 ?auto_2368213 ?auto_2368209 )
      ( DELIVER-1PKG ?auto_2368214 ?auto_2368209 )
      ( DELIVER-5PKG-VERIFY ?auto_2368210 ?auto_2368211 ?auto_2368212 ?auto_2368213 ?auto_2368214 ?auto_2368209 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_2368306 - OBJ
      ?auto_2368307 - OBJ
      ?auto_2368308 - OBJ
      ?auto_2368309 - OBJ
      ?auto_2368310 - OBJ
      ?auto_2368305 - LOCATION
    )
    :vars
    (
      ?auto_2368311 - LOCATION
      ?auto_2368315 - CITY
      ?auto_2368314 - LOCATION
      ?auto_2368313 - LOCATION
      ?auto_2368312 - LOCATION
      ?auto_2368316 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2368311 ?auto_2368315 ) ( IN-CITY ?auto_2368305 ?auto_2368315 ) ( not ( = ?auto_2368305 ?auto_2368311 ) ) ( OBJ-AT ?auto_2368310 ?auto_2368311 ) ( OBJ-AT ?auto_2368308 ?auto_2368311 ) ( IN-CITY ?auto_2368314 ?auto_2368315 ) ( not ( = ?auto_2368305 ?auto_2368314 ) ) ( OBJ-AT ?auto_2368309 ?auto_2368314 ) ( IN-CITY ?auto_2368313 ?auto_2368315 ) ( not ( = ?auto_2368305 ?auto_2368313 ) ) ( OBJ-AT ?auto_2368307 ?auto_2368313 ) ( IN-CITY ?auto_2368312 ?auto_2368315 ) ( not ( = ?auto_2368305 ?auto_2368312 ) ) ( OBJ-AT ?auto_2368306 ?auto_2368312 ) ( TRUCK-AT ?auto_2368316 ?auto_2368305 ) ( not ( = ?auto_2368306 ?auto_2368307 ) ) ( not ( = ?auto_2368313 ?auto_2368312 ) ) ( not ( = ?auto_2368306 ?auto_2368309 ) ) ( not ( = ?auto_2368307 ?auto_2368309 ) ) ( not ( = ?auto_2368314 ?auto_2368313 ) ) ( not ( = ?auto_2368314 ?auto_2368312 ) ) ( not ( = ?auto_2368306 ?auto_2368308 ) ) ( not ( = ?auto_2368307 ?auto_2368308 ) ) ( not ( = ?auto_2368309 ?auto_2368308 ) ) ( not ( = ?auto_2368311 ?auto_2368314 ) ) ( not ( = ?auto_2368311 ?auto_2368313 ) ) ( not ( = ?auto_2368311 ?auto_2368312 ) ) ( not ( = ?auto_2368306 ?auto_2368310 ) ) ( not ( = ?auto_2368307 ?auto_2368310 ) ) ( not ( = ?auto_2368309 ?auto_2368310 ) ) ( not ( = ?auto_2368308 ?auto_2368310 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_2368306 ?auto_2368307 ?auto_2368309 ?auto_2368308 ?auto_2368310 ?auto_2368305 )
      ( DELIVER-5PKG-VERIFY ?auto_2368306 ?auto_2368307 ?auto_2368308 ?auto_2368309 ?auto_2368310 ?auto_2368305 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_2368357 - OBJ
      ?auto_2368358 - OBJ
      ?auto_2368359 - OBJ
      ?auto_2368360 - OBJ
      ?auto_2368361 - OBJ
      ?auto_2368356 - LOCATION
    )
    :vars
    (
      ?auto_2368362 - LOCATION
      ?auto_2368366 - CITY
      ?auto_2368367 - LOCATION
      ?auto_2368363 - LOCATION
      ?auto_2368364 - LOCATION
      ?auto_2368365 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2368362 ?auto_2368366 ) ( IN-CITY ?auto_2368356 ?auto_2368366 ) ( not ( = ?auto_2368356 ?auto_2368362 ) ) ( OBJ-AT ?auto_2368360 ?auto_2368362 ) ( OBJ-AT ?auto_2368359 ?auto_2368362 ) ( IN-CITY ?auto_2368367 ?auto_2368366 ) ( not ( = ?auto_2368356 ?auto_2368367 ) ) ( OBJ-AT ?auto_2368361 ?auto_2368367 ) ( IN-CITY ?auto_2368363 ?auto_2368366 ) ( not ( = ?auto_2368356 ?auto_2368363 ) ) ( OBJ-AT ?auto_2368358 ?auto_2368363 ) ( IN-CITY ?auto_2368364 ?auto_2368366 ) ( not ( = ?auto_2368356 ?auto_2368364 ) ) ( OBJ-AT ?auto_2368357 ?auto_2368364 ) ( TRUCK-AT ?auto_2368365 ?auto_2368356 ) ( not ( = ?auto_2368357 ?auto_2368358 ) ) ( not ( = ?auto_2368363 ?auto_2368364 ) ) ( not ( = ?auto_2368357 ?auto_2368361 ) ) ( not ( = ?auto_2368358 ?auto_2368361 ) ) ( not ( = ?auto_2368367 ?auto_2368363 ) ) ( not ( = ?auto_2368367 ?auto_2368364 ) ) ( not ( = ?auto_2368357 ?auto_2368359 ) ) ( not ( = ?auto_2368358 ?auto_2368359 ) ) ( not ( = ?auto_2368361 ?auto_2368359 ) ) ( not ( = ?auto_2368362 ?auto_2368367 ) ) ( not ( = ?auto_2368362 ?auto_2368363 ) ) ( not ( = ?auto_2368362 ?auto_2368364 ) ) ( not ( = ?auto_2368357 ?auto_2368360 ) ) ( not ( = ?auto_2368358 ?auto_2368360 ) ) ( not ( = ?auto_2368361 ?auto_2368360 ) ) ( not ( = ?auto_2368359 ?auto_2368360 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_2368357 ?auto_2368358 ?auto_2368359 ?auto_2368361 ?auto_2368360 ?auto_2368356 )
      ( DELIVER-5PKG-VERIFY ?auto_2368357 ?auto_2368358 ?auto_2368359 ?auto_2368360 ?auto_2368361 ?auto_2368356 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_2369633 - OBJ
      ?auto_2369634 - OBJ
      ?auto_2369635 - OBJ
      ?auto_2369636 - OBJ
      ?auto_2369637 - OBJ
      ?auto_2369632 - LOCATION
    )
    :vars
    (
      ?auto_2369638 - LOCATION
      ?auto_2369642 - CITY
      ?auto_2369643 - LOCATION
      ?auto_2369639 - LOCATION
      ?auto_2369640 - LOCATION
      ?auto_2369641 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2369638 ?auto_2369642 ) ( IN-CITY ?auto_2369632 ?auto_2369642 ) ( not ( = ?auto_2369632 ?auto_2369638 ) ) ( OBJ-AT ?auto_2369637 ?auto_2369638 ) ( OBJ-AT ?auto_2369634 ?auto_2369638 ) ( IN-CITY ?auto_2369643 ?auto_2369642 ) ( not ( = ?auto_2369632 ?auto_2369643 ) ) ( OBJ-AT ?auto_2369636 ?auto_2369643 ) ( IN-CITY ?auto_2369639 ?auto_2369642 ) ( not ( = ?auto_2369632 ?auto_2369639 ) ) ( OBJ-AT ?auto_2369635 ?auto_2369639 ) ( IN-CITY ?auto_2369640 ?auto_2369642 ) ( not ( = ?auto_2369632 ?auto_2369640 ) ) ( OBJ-AT ?auto_2369633 ?auto_2369640 ) ( TRUCK-AT ?auto_2369641 ?auto_2369632 ) ( not ( = ?auto_2369633 ?auto_2369635 ) ) ( not ( = ?auto_2369639 ?auto_2369640 ) ) ( not ( = ?auto_2369633 ?auto_2369636 ) ) ( not ( = ?auto_2369635 ?auto_2369636 ) ) ( not ( = ?auto_2369643 ?auto_2369639 ) ) ( not ( = ?auto_2369643 ?auto_2369640 ) ) ( not ( = ?auto_2369633 ?auto_2369634 ) ) ( not ( = ?auto_2369635 ?auto_2369634 ) ) ( not ( = ?auto_2369636 ?auto_2369634 ) ) ( not ( = ?auto_2369638 ?auto_2369643 ) ) ( not ( = ?auto_2369638 ?auto_2369639 ) ) ( not ( = ?auto_2369638 ?auto_2369640 ) ) ( not ( = ?auto_2369633 ?auto_2369637 ) ) ( not ( = ?auto_2369635 ?auto_2369637 ) ) ( not ( = ?auto_2369636 ?auto_2369637 ) ) ( not ( = ?auto_2369634 ?auto_2369637 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_2369633 ?auto_2369635 ?auto_2369634 ?auto_2369636 ?auto_2369637 ?auto_2369632 )
      ( DELIVER-5PKG-VERIFY ?auto_2369633 ?auto_2369634 ?auto_2369635 ?auto_2369636 ?auto_2369637 ?auto_2369632 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_2369684 - OBJ
      ?auto_2369685 - OBJ
      ?auto_2369686 - OBJ
      ?auto_2369687 - OBJ
      ?auto_2369688 - OBJ
      ?auto_2369683 - LOCATION
    )
    :vars
    (
      ?auto_2369689 - LOCATION
      ?auto_2369693 - CITY
      ?auto_2369694 - LOCATION
      ?auto_2369690 - LOCATION
      ?auto_2369691 - LOCATION
      ?auto_2369692 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2369689 ?auto_2369693 ) ( IN-CITY ?auto_2369683 ?auto_2369693 ) ( not ( = ?auto_2369683 ?auto_2369689 ) ) ( OBJ-AT ?auto_2369687 ?auto_2369689 ) ( OBJ-AT ?auto_2369685 ?auto_2369689 ) ( IN-CITY ?auto_2369694 ?auto_2369693 ) ( not ( = ?auto_2369683 ?auto_2369694 ) ) ( OBJ-AT ?auto_2369688 ?auto_2369694 ) ( IN-CITY ?auto_2369690 ?auto_2369693 ) ( not ( = ?auto_2369683 ?auto_2369690 ) ) ( OBJ-AT ?auto_2369686 ?auto_2369690 ) ( IN-CITY ?auto_2369691 ?auto_2369693 ) ( not ( = ?auto_2369683 ?auto_2369691 ) ) ( OBJ-AT ?auto_2369684 ?auto_2369691 ) ( TRUCK-AT ?auto_2369692 ?auto_2369683 ) ( not ( = ?auto_2369684 ?auto_2369686 ) ) ( not ( = ?auto_2369690 ?auto_2369691 ) ) ( not ( = ?auto_2369684 ?auto_2369688 ) ) ( not ( = ?auto_2369686 ?auto_2369688 ) ) ( not ( = ?auto_2369694 ?auto_2369690 ) ) ( not ( = ?auto_2369694 ?auto_2369691 ) ) ( not ( = ?auto_2369684 ?auto_2369685 ) ) ( not ( = ?auto_2369686 ?auto_2369685 ) ) ( not ( = ?auto_2369688 ?auto_2369685 ) ) ( not ( = ?auto_2369689 ?auto_2369694 ) ) ( not ( = ?auto_2369689 ?auto_2369690 ) ) ( not ( = ?auto_2369689 ?auto_2369691 ) ) ( not ( = ?auto_2369684 ?auto_2369687 ) ) ( not ( = ?auto_2369686 ?auto_2369687 ) ) ( not ( = ?auto_2369688 ?auto_2369687 ) ) ( not ( = ?auto_2369685 ?auto_2369687 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_2369684 ?auto_2369686 ?auto_2369685 ?auto_2369688 ?auto_2369687 ?auto_2369683 )
      ( DELIVER-5PKG-VERIFY ?auto_2369684 ?auto_2369685 ?auto_2369686 ?auto_2369687 ?auto_2369688 ?auto_2369683 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_2370041 - OBJ
      ?auto_2370042 - OBJ
      ?auto_2370043 - OBJ
      ?auto_2370044 - OBJ
      ?auto_2370045 - OBJ
      ?auto_2370040 - LOCATION
    )
    :vars
    (
      ?auto_2370046 - LOCATION
      ?auto_2370050 - CITY
      ?auto_2370051 - LOCATION
      ?auto_2370047 - LOCATION
      ?auto_2370048 - LOCATION
      ?auto_2370049 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2370046 ?auto_2370050 ) ( IN-CITY ?auto_2370040 ?auto_2370050 ) ( not ( = ?auto_2370040 ?auto_2370046 ) ) ( OBJ-AT ?auto_2370043 ?auto_2370046 ) ( OBJ-AT ?auto_2370042 ?auto_2370046 ) ( IN-CITY ?auto_2370051 ?auto_2370050 ) ( not ( = ?auto_2370040 ?auto_2370051 ) ) ( OBJ-AT ?auto_2370045 ?auto_2370051 ) ( IN-CITY ?auto_2370047 ?auto_2370050 ) ( not ( = ?auto_2370040 ?auto_2370047 ) ) ( OBJ-AT ?auto_2370044 ?auto_2370047 ) ( IN-CITY ?auto_2370048 ?auto_2370050 ) ( not ( = ?auto_2370040 ?auto_2370048 ) ) ( OBJ-AT ?auto_2370041 ?auto_2370048 ) ( TRUCK-AT ?auto_2370049 ?auto_2370040 ) ( not ( = ?auto_2370041 ?auto_2370044 ) ) ( not ( = ?auto_2370047 ?auto_2370048 ) ) ( not ( = ?auto_2370041 ?auto_2370045 ) ) ( not ( = ?auto_2370044 ?auto_2370045 ) ) ( not ( = ?auto_2370051 ?auto_2370047 ) ) ( not ( = ?auto_2370051 ?auto_2370048 ) ) ( not ( = ?auto_2370041 ?auto_2370042 ) ) ( not ( = ?auto_2370044 ?auto_2370042 ) ) ( not ( = ?auto_2370045 ?auto_2370042 ) ) ( not ( = ?auto_2370046 ?auto_2370051 ) ) ( not ( = ?auto_2370046 ?auto_2370047 ) ) ( not ( = ?auto_2370046 ?auto_2370048 ) ) ( not ( = ?auto_2370041 ?auto_2370043 ) ) ( not ( = ?auto_2370044 ?auto_2370043 ) ) ( not ( = ?auto_2370045 ?auto_2370043 ) ) ( not ( = ?auto_2370042 ?auto_2370043 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_2370041 ?auto_2370044 ?auto_2370042 ?auto_2370045 ?auto_2370043 ?auto_2370040 )
      ( DELIVER-5PKG-VERIFY ?auto_2370041 ?auto_2370042 ?auto_2370043 ?auto_2370044 ?auto_2370045 ?auto_2370040 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_2381695 - OBJ
      ?auto_2381696 - OBJ
      ?auto_2381697 - OBJ
      ?auto_2381698 - OBJ
      ?auto_2381699 - OBJ
      ?auto_2381694 - LOCATION
    )
    :vars
    (
      ?auto_2381700 - LOCATION
      ?auto_2381704 - CITY
      ?auto_2381705 - LOCATION
      ?auto_2381701 - LOCATION
      ?auto_2381702 - LOCATION
      ?auto_2381703 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2381700 ?auto_2381704 ) ( IN-CITY ?auto_2381694 ?auto_2381704 ) ( not ( = ?auto_2381694 ?auto_2381700 ) ) ( OBJ-AT ?auto_2381699 ?auto_2381700 ) ( OBJ-AT ?auto_2381695 ?auto_2381700 ) ( IN-CITY ?auto_2381705 ?auto_2381704 ) ( not ( = ?auto_2381694 ?auto_2381705 ) ) ( OBJ-AT ?auto_2381698 ?auto_2381705 ) ( IN-CITY ?auto_2381701 ?auto_2381704 ) ( not ( = ?auto_2381694 ?auto_2381701 ) ) ( OBJ-AT ?auto_2381697 ?auto_2381701 ) ( IN-CITY ?auto_2381702 ?auto_2381704 ) ( not ( = ?auto_2381694 ?auto_2381702 ) ) ( OBJ-AT ?auto_2381696 ?auto_2381702 ) ( TRUCK-AT ?auto_2381703 ?auto_2381694 ) ( not ( = ?auto_2381696 ?auto_2381697 ) ) ( not ( = ?auto_2381701 ?auto_2381702 ) ) ( not ( = ?auto_2381696 ?auto_2381698 ) ) ( not ( = ?auto_2381697 ?auto_2381698 ) ) ( not ( = ?auto_2381705 ?auto_2381701 ) ) ( not ( = ?auto_2381705 ?auto_2381702 ) ) ( not ( = ?auto_2381696 ?auto_2381695 ) ) ( not ( = ?auto_2381697 ?auto_2381695 ) ) ( not ( = ?auto_2381698 ?auto_2381695 ) ) ( not ( = ?auto_2381700 ?auto_2381705 ) ) ( not ( = ?auto_2381700 ?auto_2381701 ) ) ( not ( = ?auto_2381700 ?auto_2381702 ) ) ( not ( = ?auto_2381696 ?auto_2381699 ) ) ( not ( = ?auto_2381697 ?auto_2381699 ) ) ( not ( = ?auto_2381698 ?auto_2381699 ) ) ( not ( = ?auto_2381695 ?auto_2381699 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_2381696 ?auto_2381697 ?auto_2381695 ?auto_2381698 ?auto_2381699 ?auto_2381694 )
      ( DELIVER-5PKG-VERIFY ?auto_2381695 ?auto_2381696 ?auto_2381697 ?auto_2381698 ?auto_2381699 ?auto_2381694 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_2381746 - OBJ
      ?auto_2381747 - OBJ
      ?auto_2381748 - OBJ
      ?auto_2381749 - OBJ
      ?auto_2381750 - OBJ
      ?auto_2381745 - LOCATION
    )
    :vars
    (
      ?auto_2381751 - LOCATION
      ?auto_2381755 - CITY
      ?auto_2381756 - LOCATION
      ?auto_2381752 - LOCATION
      ?auto_2381753 - LOCATION
      ?auto_2381754 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2381751 ?auto_2381755 ) ( IN-CITY ?auto_2381745 ?auto_2381755 ) ( not ( = ?auto_2381745 ?auto_2381751 ) ) ( OBJ-AT ?auto_2381749 ?auto_2381751 ) ( OBJ-AT ?auto_2381746 ?auto_2381751 ) ( IN-CITY ?auto_2381756 ?auto_2381755 ) ( not ( = ?auto_2381745 ?auto_2381756 ) ) ( OBJ-AT ?auto_2381750 ?auto_2381756 ) ( IN-CITY ?auto_2381752 ?auto_2381755 ) ( not ( = ?auto_2381745 ?auto_2381752 ) ) ( OBJ-AT ?auto_2381748 ?auto_2381752 ) ( IN-CITY ?auto_2381753 ?auto_2381755 ) ( not ( = ?auto_2381745 ?auto_2381753 ) ) ( OBJ-AT ?auto_2381747 ?auto_2381753 ) ( TRUCK-AT ?auto_2381754 ?auto_2381745 ) ( not ( = ?auto_2381747 ?auto_2381748 ) ) ( not ( = ?auto_2381752 ?auto_2381753 ) ) ( not ( = ?auto_2381747 ?auto_2381750 ) ) ( not ( = ?auto_2381748 ?auto_2381750 ) ) ( not ( = ?auto_2381756 ?auto_2381752 ) ) ( not ( = ?auto_2381756 ?auto_2381753 ) ) ( not ( = ?auto_2381747 ?auto_2381746 ) ) ( not ( = ?auto_2381748 ?auto_2381746 ) ) ( not ( = ?auto_2381750 ?auto_2381746 ) ) ( not ( = ?auto_2381751 ?auto_2381756 ) ) ( not ( = ?auto_2381751 ?auto_2381752 ) ) ( not ( = ?auto_2381751 ?auto_2381753 ) ) ( not ( = ?auto_2381747 ?auto_2381749 ) ) ( not ( = ?auto_2381748 ?auto_2381749 ) ) ( not ( = ?auto_2381750 ?auto_2381749 ) ) ( not ( = ?auto_2381746 ?auto_2381749 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_2381747 ?auto_2381748 ?auto_2381746 ?auto_2381750 ?auto_2381749 ?auto_2381745 )
      ( DELIVER-5PKG-VERIFY ?auto_2381746 ?auto_2381747 ?auto_2381748 ?auto_2381749 ?auto_2381750 ?auto_2381745 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_2382103 - OBJ
      ?auto_2382104 - OBJ
      ?auto_2382105 - OBJ
      ?auto_2382106 - OBJ
      ?auto_2382107 - OBJ
      ?auto_2382102 - LOCATION
    )
    :vars
    (
      ?auto_2382108 - LOCATION
      ?auto_2382112 - CITY
      ?auto_2382113 - LOCATION
      ?auto_2382109 - LOCATION
      ?auto_2382110 - LOCATION
      ?auto_2382111 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2382108 ?auto_2382112 ) ( IN-CITY ?auto_2382102 ?auto_2382112 ) ( not ( = ?auto_2382102 ?auto_2382108 ) ) ( OBJ-AT ?auto_2382105 ?auto_2382108 ) ( OBJ-AT ?auto_2382103 ?auto_2382108 ) ( IN-CITY ?auto_2382113 ?auto_2382112 ) ( not ( = ?auto_2382102 ?auto_2382113 ) ) ( OBJ-AT ?auto_2382107 ?auto_2382113 ) ( IN-CITY ?auto_2382109 ?auto_2382112 ) ( not ( = ?auto_2382102 ?auto_2382109 ) ) ( OBJ-AT ?auto_2382106 ?auto_2382109 ) ( IN-CITY ?auto_2382110 ?auto_2382112 ) ( not ( = ?auto_2382102 ?auto_2382110 ) ) ( OBJ-AT ?auto_2382104 ?auto_2382110 ) ( TRUCK-AT ?auto_2382111 ?auto_2382102 ) ( not ( = ?auto_2382104 ?auto_2382106 ) ) ( not ( = ?auto_2382109 ?auto_2382110 ) ) ( not ( = ?auto_2382104 ?auto_2382107 ) ) ( not ( = ?auto_2382106 ?auto_2382107 ) ) ( not ( = ?auto_2382113 ?auto_2382109 ) ) ( not ( = ?auto_2382113 ?auto_2382110 ) ) ( not ( = ?auto_2382104 ?auto_2382103 ) ) ( not ( = ?auto_2382106 ?auto_2382103 ) ) ( not ( = ?auto_2382107 ?auto_2382103 ) ) ( not ( = ?auto_2382108 ?auto_2382113 ) ) ( not ( = ?auto_2382108 ?auto_2382109 ) ) ( not ( = ?auto_2382108 ?auto_2382110 ) ) ( not ( = ?auto_2382104 ?auto_2382105 ) ) ( not ( = ?auto_2382106 ?auto_2382105 ) ) ( not ( = ?auto_2382107 ?auto_2382105 ) ) ( not ( = ?auto_2382103 ?auto_2382105 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_2382104 ?auto_2382106 ?auto_2382103 ?auto_2382107 ?auto_2382105 ?auto_2382102 )
      ( DELIVER-5PKG-VERIFY ?auto_2382103 ?auto_2382104 ?auto_2382105 ?auto_2382106 ?auto_2382107 ?auto_2382102 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_2384812 - OBJ
      ?auto_2384813 - OBJ
      ?auto_2384814 - OBJ
      ?auto_2384815 - OBJ
      ?auto_2384816 - OBJ
      ?auto_2384811 - LOCATION
    )
    :vars
    (
      ?auto_2384817 - LOCATION
      ?auto_2384821 - CITY
      ?auto_2384822 - LOCATION
      ?auto_2384818 - LOCATION
      ?auto_2384819 - LOCATION
      ?auto_2384820 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2384817 ?auto_2384821 ) ( IN-CITY ?auto_2384811 ?auto_2384821 ) ( not ( = ?auto_2384811 ?auto_2384817 ) ) ( OBJ-AT ?auto_2384813 ?auto_2384817 ) ( OBJ-AT ?auto_2384812 ?auto_2384817 ) ( IN-CITY ?auto_2384822 ?auto_2384821 ) ( not ( = ?auto_2384811 ?auto_2384822 ) ) ( OBJ-AT ?auto_2384816 ?auto_2384822 ) ( IN-CITY ?auto_2384818 ?auto_2384821 ) ( not ( = ?auto_2384811 ?auto_2384818 ) ) ( OBJ-AT ?auto_2384815 ?auto_2384818 ) ( IN-CITY ?auto_2384819 ?auto_2384821 ) ( not ( = ?auto_2384811 ?auto_2384819 ) ) ( OBJ-AT ?auto_2384814 ?auto_2384819 ) ( TRUCK-AT ?auto_2384820 ?auto_2384811 ) ( not ( = ?auto_2384814 ?auto_2384815 ) ) ( not ( = ?auto_2384818 ?auto_2384819 ) ) ( not ( = ?auto_2384814 ?auto_2384816 ) ) ( not ( = ?auto_2384815 ?auto_2384816 ) ) ( not ( = ?auto_2384822 ?auto_2384818 ) ) ( not ( = ?auto_2384822 ?auto_2384819 ) ) ( not ( = ?auto_2384814 ?auto_2384812 ) ) ( not ( = ?auto_2384815 ?auto_2384812 ) ) ( not ( = ?auto_2384816 ?auto_2384812 ) ) ( not ( = ?auto_2384817 ?auto_2384822 ) ) ( not ( = ?auto_2384817 ?auto_2384818 ) ) ( not ( = ?auto_2384817 ?auto_2384819 ) ) ( not ( = ?auto_2384814 ?auto_2384813 ) ) ( not ( = ?auto_2384815 ?auto_2384813 ) ) ( not ( = ?auto_2384816 ?auto_2384813 ) ) ( not ( = ?auto_2384812 ?auto_2384813 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_2384814 ?auto_2384815 ?auto_2384812 ?auto_2384816 ?auto_2384813 ?auto_2384811 )
      ( DELIVER-5PKG-VERIFY ?auto_2384812 ?auto_2384813 ?auto_2384814 ?auto_2384815 ?auto_2384816 ?auto_2384811 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_2625454 - OBJ
      ?auto_2625455 - OBJ
      ?auto_2625456 - OBJ
      ?auto_2625457 - OBJ
      ?auto_2625458 - OBJ
      ?auto_2625459 - OBJ
      ?auto_2625453 - LOCATION
    )
    :vars
    (
      ?auto_2625460 - LOCATION
      ?auto_2625461 - CITY
      ?auto_2625465 - LOCATION
      ?auto_2625463 - LOCATION
      ?auto_2625464 - LOCATION
      ?auto_2625462 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2625460 ?auto_2625461 ) ( IN-CITY ?auto_2625453 ?auto_2625461 ) ( not ( = ?auto_2625453 ?auto_2625460 ) ) ( OBJ-AT ?auto_2625459 ?auto_2625460 ) ( OBJ-AT ?auto_2625458 ?auto_2625460 ) ( OBJ-AT ?auto_2625457 ?auto_2625460 ) ( IN-CITY ?auto_2625465 ?auto_2625461 ) ( not ( = ?auto_2625453 ?auto_2625465 ) ) ( OBJ-AT ?auto_2625456 ?auto_2625465 ) ( IN-CITY ?auto_2625463 ?auto_2625461 ) ( not ( = ?auto_2625453 ?auto_2625463 ) ) ( OBJ-AT ?auto_2625455 ?auto_2625463 ) ( IN-CITY ?auto_2625464 ?auto_2625461 ) ( not ( = ?auto_2625453 ?auto_2625464 ) ) ( OBJ-AT ?auto_2625454 ?auto_2625464 ) ( TRUCK-AT ?auto_2625462 ?auto_2625453 ) ( not ( = ?auto_2625454 ?auto_2625455 ) ) ( not ( = ?auto_2625463 ?auto_2625464 ) ) ( not ( = ?auto_2625454 ?auto_2625456 ) ) ( not ( = ?auto_2625455 ?auto_2625456 ) ) ( not ( = ?auto_2625465 ?auto_2625463 ) ) ( not ( = ?auto_2625465 ?auto_2625464 ) ) ( not ( = ?auto_2625454 ?auto_2625457 ) ) ( not ( = ?auto_2625455 ?auto_2625457 ) ) ( not ( = ?auto_2625456 ?auto_2625457 ) ) ( not ( = ?auto_2625460 ?auto_2625465 ) ) ( not ( = ?auto_2625460 ?auto_2625463 ) ) ( not ( = ?auto_2625460 ?auto_2625464 ) ) ( not ( = ?auto_2625454 ?auto_2625458 ) ) ( not ( = ?auto_2625455 ?auto_2625458 ) ) ( not ( = ?auto_2625456 ?auto_2625458 ) ) ( not ( = ?auto_2625457 ?auto_2625458 ) ) ( not ( = ?auto_2625454 ?auto_2625459 ) ) ( not ( = ?auto_2625455 ?auto_2625459 ) ) ( not ( = ?auto_2625456 ?auto_2625459 ) ) ( not ( = ?auto_2625457 ?auto_2625459 ) ) ( not ( = ?auto_2625458 ?auto_2625459 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_2625454 ?auto_2625455 ?auto_2625457 ?auto_2625456 ?auto_2625458 ?auto_2625453 )
      ( DELIVER-1PKG ?auto_2625459 ?auto_2625453 )
      ( DELIVER-6PKG-VERIFY ?auto_2625454 ?auto_2625455 ?auto_2625456 ?auto_2625457 ?auto_2625458 ?auto_2625459 ?auto_2625453 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_2626568 - OBJ
      ?auto_2626569 - OBJ
      ?auto_2626570 - OBJ
      ?auto_2626571 - OBJ
      ?auto_2626572 - OBJ
      ?auto_2626573 - OBJ
      ?auto_2626567 - LOCATION
    )
    :vars
    (
      ?auto_2626574 - LOCATION
      ?auto_2626575 - CITY
      ?auto_2626576 - LOCATION
      ?auto_2626578 - LOCATION
      ?auto_2626577 - LOCATION
      ?auto_2626579 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2626574 ?auto_2626575 ) ( IN-CITY ?auto_2626567 ?auto_2626575 ) ( not ( = ?auto_2626567 ?auto_2626574 ) ) ( OBJ-AT ?auto_2626573 ?auto_2626574 ) ( OBJ-AT ?auto_2626572 ?auto_2626574 ) ( OBJ-AT ?auto_2626570 ?auto_2626574 ) ( IN-CITY ?auto_2626576 ?auto_2626575 ) ( not ( = ?auto_2626567 ?auto_2626576 ) ) ( OBJ-AT ?auto_2626571 ?auto_2626576 ) ( IN-CITY ?auto_2626578 ?auto_2626575 ) ( not ( = ?auto_2626567 ?auto_2626578 ) ) ( OBJ-AT ?auto_2626569 ?auto_2626578 ) ( IN-CITY ?auto_2626577 ?auto_2626575 ) ( not ( = ?auto_2626567 ?auto_2626577 ) ) ( OBJ-AT ?auto_2626568 ?auto_2626577 ) ( TRUCK-AT ?auto_2626579 ?auto_2626567 ) ( not ( = ?auto_2626568 ?auto_2626569 ) ) ( not ( = ?auto_2626578 ?auto_2626577 ) ) ( not ( = ?auto_2626568 ?auto_2626571 ) ) ( not ( = ?auto_2626569 ?auto_2626571 ) ) ( not ( = ?auto_2626576 ?auto_2626578 ) ) ( not ( = ?auto_2626576 ?auto_2626577 ) ) ( not ( = ?auto_2626568 ?auto_2626570 ) ) ( not ( = ?auto_2626569 ?auto_2626570 ) ) ( not ( = ?auto_2626571 ?auto_2626570 ) ) ( not ( = ?auto_2626574 ?auto_2626576 ) ) ( not ( = ?auto_2626574 ?auto_2626578 ) ) ( not ( = ?auto_2626574 ?auto_2626577 ) ) ( not ( = ?auto_2626568 ?auto_2626572 ) ) ( not ( = ?auto_2626569 ?auto_2626572 ) ) ( not ( = ?auto_2626571 ?auto_2626572 ) ) ( not ( = ?auto_2626570 ?auto_2626572 ) ) ( not ( = ?auto_2626568 ?auto_2626573 ) ) ( not ( = ?auto_2626569 ?auto_2626573 ) ) ( not ( = ?auto_2626571 ?auto_2626573 ) ) ( not ( = ?auto_2626570 ?auto_2626573 ) ) ( not ( = ?auto_2626572 ?auto_2626573 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_2626568 ?auto_2626569 ?auto_2626571 ?auto_2626570 ?auto_2626572 ?auto_2626573 ?auto_2626567 )
      ( DELIVER-6PKG-VERIFY ?auto_2626568 ?auto_2626569 ?auto_2626570 ?auto_2626571 ?auto_2626572 ?auto_2626573 ?auto_2626567 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_2626847 - OBJ
      ?auto_2626848 - OBJ
      ?auto_2626849 - OBJ
      ?auto_2626850 - OBJ
      ?auto_2626851 - OBJ
      ?auto_2626852 - OBJ
      ?auto_2626846 - LOCATION
    )
    :vars
    (
      ?auto_2626856 - LOCATION
      ?auto_2626858 - CITY
      ?auto_2626855 - LOCATION
      ?auto_2626853 - LOCATION
      ?auto_2626857 - LOCATION
      ?auto_2626854 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2626856 ?auto_2626858 ) ( IN-CITY ?auto_2626846 ?auto_2626858 ) ( not ( = ?auto_2626846 ?auto_2626856 ) ) ( OBJ-AT ?auto_2626852 ?auto_2626856 ) ( OBJ-AT ?auto_2626850 ?auto_2626856 ) ( OBJ-AT ?auto_2626849 ?auto_2626856 ) ( IN-CITY ?auto_2626855 ?auto_2626858 ) ( not ( = ?auto_2626846 ?auto_2626855 ) ) ( OBJ-AT ?auto_2626851 ?auto_2626855 ) ( IN-CITY ?auto_2626853 ?auto_2626858 ) ( not ( = ?auto_2626846 ?auto_2626853 ) ) ( OBJ-AT ?auto_2626848 ?auto_2626853 ) ( IN-CITY ?auto_2626857 ?auto_2626858 ) ( not ( = ?auto_2626846 ?auto_2626857 ) ) ( OBJ-AT ?auto_2626847 ?auto_2626857 ) ( TRUCK-AT ?auto_2626854 ?auto_2626846 ) ( not ( = ?auto_2626847 ?auto_2626848 ) ) ( not ( = ?auto_2626853 ?auto_2626857 ) ) ( not ( = ?auto_2626847 ?auto_2626851 ) ) ( not ( = ?auto_2626848 ?auto_2626851 ) ) ( not ( = ?auto_2626855 ?auto_2626853 ) ) ( not ( = ?auto_2626855 ?auto_2626857 ) ) ( not ( = ?auto_2626847 ?auto_2626849 ) ) ( not ( = ?auto_2626848 ?auto_2626849 ) ) ( not ( = ?auto_2626851 ?auto_2626849 ) ) ( not ( = ?auto_2626856 ?auto_2626855 ) ) ( not ( = ?auto_2626856 ?auto_2626853 ) ) ( not ( = ?auto_2626856 ?auto_2626857 ) ) ( not ( = ?auto_2626847 ?auto_2626850 ) ) ( not ( = ?auto_2626848 ?auto_2626850 ) ) ( not ( = ?auto_2626851 ?auto_2626850 ) ) ( not ( = ?auto_2626849 ?auto_2626850 ) ) ( not ( = ?auto_2626847 ?auto_2626852 ) ) ( not ( = ?auto_2626848 ?auto_2626852 ) ) ( not ( = ?auto_2626851 ?auto_2626852 ) ) ( not ( = ?auto_2626849 ?auto_2626852 ) ) ( not ( = ?auto_2626850 ?auto_2626852 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_2626847 ?auto_2626848 ?auto_2626849 ?auto_2626851 ?auto_2626850 ?auto_2626852 ?auto_2626846 )
      ( DELIVER-6PKG-VERIFY ?auto_2626847 ?auto_2626848 ?auto_2626849 ?auto_2626850 ?auto_2626851 ?auto_2626852 ?auto_2626846 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_2626916 - OBJ
      ?auto_2626917 - OBJ
      ?auto_2626918 - OBJ
      ?auto_2626919 - OBJ
      ?auto_2626920 - OBJ
      ?auto_2626921 - OBJ
      ?auto_2626915 - LOCATION
    )
    :vars
    (
      ?auto_2626925 - LOCATION
      ?auto_2626927 - CITY
      ?auto_2626924 - LOCATION
      ?auto_2626922 - LOCATION
      ?auto_2626926 - LOCATION
      ?auto_2626923 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2626925 ?auto_2626927 ) ( IN-CITY ?auto_2626915 ?auto_2626927 ) ( not ( = ?auto_2626915 ?auto_2626925 ) ) ( OBJ-AT ?auto_2626920 ?auto_2626925 ) ( OBJ-AT ?auto_2626919 ?auto_2626925 ) ( OBJ-AT ?auto_2626918 ?auto_2626925 ) ( IN-CITY ?auto_2626924 ?auto_2626927 ) ( not ( = ?auto_2626915 ?auto_2626924 ) ) ( OBJ-AT ?auto_2626921 ?auto_2626924 ) ( IN-CITY ?auto_2626922 ?auto_2626927 ) ( not ( = ?auto_2626915 ?auto_2626922 ) ) ( OBJ-AT ?auto_2626917 ?auto_2626922 ) ( IN-CITY ?auto_2626926 ?auto_2626927 ) ( not ( = ?auto_2626915 ?auto_2626926 ) ) ( OBJ-AT ?auto_2626916 ?auto_2626926 ) ( TRUCK-AT ?auto_2626923 ?auto_2626915 ) ( not ( = ?auto_2626916 ?auto_2626917 ) ) ( not ( = ?auto_2626922 ?auto_2626926 ) ) ( not ( = ?auto_2626916 ?auto_2626921 ) ) ( not ( = ?auto_2626917 ?auto_2626921 ) ) ( not ( = ?auto_2626924 ?auto_2626922 ) ) ( not ( = ?auto_2626924 ?auto_2626926 ) ) ( not ( = ?auto_2626916 ?auto_2626918 ) ) ( not ( = ?auto_2626917 ?auto_2626918 ) ) ( not ( = ?auto_2626921 ?auto_2626918 ) ) ( not ( = ?auto_2626925 ?auto_2626924 ) ) ( not ( = ?auto_2626925 ?auto_2626922 ) ) ( not ( = ?auto_2626925 ?auto_2626926 ) ) ( not ( = ?auto_2626916 ?auto_2626919 ) ) ( not ( = ?auto_2626917 ?auto_2626919 ) ) ( not ( = ?auto_2626921 ?auto_2626919 ) ) ( not ( = ?auto_2626918 ?auto_2626919 ) ) ( not ( = ?auto_2626916 ?auto_2626920 ) ) ( not ( = ?auto_2626917 ?auto_2626920 ) ) ( not ( = ?auto_2626921 ?auto_2626920 ) ) ( not ( = ?auto_2626918 ?auto_2626920 ) ) ( not ( = ?auto_2626919 ?auto_2626920 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_2626916 ?auto_2626917 ?auto_2626918 ?auto_2626921 ?auto_2626919 ?auto_2626920 ?auto_2626915 )
      ( DELIVER-6PKG-VERIFY ?auto_2626916 ?auto_2626917 ?auto_2626918 ?auto_2626919 ?auto_2626920 ?auto_2626921 ?auto_2626915 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_2643323 - OBJ
      ?auto_2643324 - OBJ
      ?auto_2643325 - OBJ
      ?auto_2643326 - OBJ
      ?auto_2643327 - OBJ
      ?auto_2643328 - OBJ
      ?auto_2643322 - LOCATION
    )
    :vars
    (
      ?auto_2643332 - LOCATION
      ?auto_2643334 - CITY
      ?auto_2643331 - LOCATION
      ?auto_2643329 - LOCATION
      ?auto_2643333 - LOCATION
      ?auto_2643330 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2643332 ?auto_2643334 ) ( IN-CITY ?auto_2643322 ?auto_2643334 ) ( not ( = ?auto_2643322 ?auto_2643332 ) ) ( OBJ-AT ?auto_2643328 ?auto_2643332 ) ( OBJ-AT ?auto_2643327 ?auto_2643332 ) ( OBJ-AT ?auto_2643324 ?auto_2643332 ) ( IN-CITY ?auto_2643331 ?auto_2643334 ) ( not ( = ?auto_2643322 ?auto_2643331 ) ) ( OBJ-AT ?auto_2643326 ?auto_2643331 ) ( IN-CITY ?auto_2643329 ?auto_2643334 ) ( not ( = ?auto_2643322 ?auto_2643329 ) ) ( OBJ-AT ?auto_2643325 ?auto_2643329 ) ( IN-CITY ?auto_2643333 ?auto_2643334 ) ( not ( = ?auto_2643322 ?auto_2643333 ) ) ( OBJ-AT ?auto_2643323 ?auto_2643333 ) ( TRUCK-AT ?auto_2643330 ?auto_2643322 ) ( not ( = ?auto_2643323 ?auto_2643325 ) ) ( not ( = ?auto_2643329 ?auto_2643333 ) ) ( not ( = ?auto_2643323 ?auto_2643326 ) ) ( not ( = ?auto_2643325 ?auto_2643326 ) ) ( not ( = ?auto_2643331 ?auto_2643329 ) ) ( not ( = ?auto_2643331 ?auto_2643333 ) ) ( not ( = ?auto_2643323 ?auto_2643324 ) ) ( not ( = ?auto_2643325 ?auto_2643324 ) ) ( not ( = ?auto_2643326 ?auto_2643324 ) ) ( not ( = ?auto_2643332 ?auto_2643331 ) ) ( not ( = ?auto_2643332 ?auto_2643329 ) ) ( not ( = ?auto_2643332 ?auto_2643333 ) ) ( not ( = ?auto_2643323 ?auto_2643327 ) ) ( not ( = ?auto_2643325 ?auto_2643327 ) ) ( not ( = ?auto_2643326 ?auto_2643327 ) ) ( not ( = ?auto_2643324 ?auto_2643327 ) ) ( not ( = ?auto_2643323 ?auto_2643328 ) ) ( not ( = ?auto_2643325 ?auto_2643328 ) ) ( not ( = ?auto_2643326 ?auto_2643328 ) ) ( not ( = ?auto_2643324 ?auto_2643328 ) ) ( not ( = ?auto_2643327 ?auto_2643328 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_2643323 ?auto_2643325 ?auto_2643324 ?auto_2643326 ?auto_2643327 ?auto_2643328 ?auto_2643322 )
      ( DELIVER-6PKG-VERIFY ?auto_2643323 ?auto_2643324 ?auto_2643325 ?auto_2643326 ?auto_2643327 ?auto_2643328 ?auto_2643322 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_2643602 - OBJ
      ?auto_2643603 - OBJ
      ?auto_2643604 - OBJ
      ?auto_2643605 - OBJ
      ?auto_2643606 - OBJ
      ?auto_2643607 - OBJ
      ?auto_2643601 - LOCATION
    )
    :vars
    (
      ?auto_2643611 - LOCATION
      ?auto_2643613 - CITY
      ?auto_2643610 - LOCATION
      ?auto_2643608 - LOCATION
      ?auto_2643612 - LOCATION
      ?auto_2643609 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2643611 ?auto_2643613 ) ( IN-CITY ?auto_2643601 ?auto_2643613 ) ( not ( = ?auto_2643601 ?auto_2643611 ) ) ( OBJ-AT ?auto_2643607 ?auto_2643611 ) ( OBJ-AT ?auto_2643605 ?auto_2643611 ) ( OBJ-AT ?auto_2643603 ?auto_2643611 ) ( IN-CITY ?auto_2643610 ?auto_2643613 ) ( not ( = ?auto_2643601 ?auto_2643610 ) ) ( OBJ-AT ?auto_2643606 ?auto_2643610 ) ( IN-CITY ?auto_2643608 ?auto_2643613 ) ( not ( = ?auto_2643601 ?auto_2643608 ) ) ( OBJ-AT ?auto_2643604 ?auto_2643608 ) ( IN-CITY ?auto_2643612 ?auto_2643613 ) ( not ( = ?auto_2643601 ?auto_2643612 ) ) ( OBJ-AT ?auto_2643602 ?auto_2643612 ) ( TRUCK-AT ?auto_2643609 ?auto_2643601 ) ( not ( = ?auto_2643602 ?auto_2643604 ) ) ( not ( = ?auto_2643608 ?auto_2643612 ) ) ( not ( = ?auto_2643602 ?auto_2643606 ) ) ( not ( = ?auto_2643604 ?auto_2643606 ) ) ( not ( = ?auto_2643610 ?auto_2643608 ) ) ( not ( = ?auto_2643610 ?auto_2643612 ) ) ( not ( = ?auto_2643602 ?auto_2643603 ) ) ( not ( = ?auto_2643604 ?auto_2643603 ) ) ( not ( = ?auto_2643606 ?auto_2643603 ) ) ( not ( = ?auto_2643611 ?auto_2643610 ) ) ( not ( = ?auto_2643611 ?auto_2643608 ) ) ( not ( = ?auto_2643611 ?auto_2643612 ) ) ( not ( = ?auto_2643602 ?auto_2643605 ) ) ( not ( = ?auto_2643604 ?auto_2643605 ) ) ( not ( = ?auto_2643606 ?auto_2643605 ) ) ( not ( = ?auto_2643603 ?auto_2643605 ) ) ( not ( = ?auto_2643602 ?auto_2643607 ) ) ( not ( = ?auto_2643604 ?auto_2643607 ) ) ( not ( = ?auto_2643606 ?auto_2643607 ) ) ( not ( = ?auto_2643603 ?auto_2643607 ) ) ( not ( = ?auto_2643605 ?auto_2643607 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_2643602 ?auto_2643604 ?auto_2643603 ?auto_2643606 ?auto_2643605 ?auto_2643607 ?auto_2643601 )
      ( DELIVER-6PKG-VERIFY ?auto_2643602 ?auto_2643603 ?auto_2643604 ?auto_2643605 ?auto_2643606 ?auto_2643607 ?auto_2643601 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_2643671 - OBJ
      ?auto_2643672 - OBJ
      ?auto_2643673 - OBJ
      ?auto_2643674 - OBJ
      ?auto_2643675 - OBJ
      ?auto_2643676 - OBJ
      ?auto_2643670 - LOCATION
    )
    :vars
    (
      ?auto_2643680 - LOCATION
      ?auto_2643682 - CITY
      ?auto_2643679 - LOCATION
      ?auto_2643677 - LOCATION
      ?auto_2643681 - LOCATION
      ?auto_2643678 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2643680 ?auto_2643682 ) ( IN-CITY ?auto_2643670 ?auto_2643682 ) ( not ( = ?auto_2643670 ?auto_2643680 ) ) ( OBJ-AT ?auto_2643675 ?auto_2643680 ) ( OBJ-AT ?auto_2643674 ?auto_2643680 ) ( OBJ-AT ?auto_2643672 ?auto_2643680 ) ( IN-CITY ?auto_2643679 ?auto_2643682 ) ( not ( = ?auto_2643670 ?auto_2643679 ) ) ( OBJ-AT ?auto_2643676 ?auto_2643679 ) ( IN-CITY ?auto_2643677 ?auto_2643682 ) ( not ( = ?auto_2643670 ?auto_2643677 ) ) ( OBJ-AT ?auto_2643673 ?auto_2643677 ) ( IN-CITY ?auto_2643681 ?auto_2643682 ) ( not ( = ?auto_2643670 ?auto_2643681 ) ) ( OBJ-AT ?auto_2643671 ?auto_2643681 ) ( TRUCK-AT ?auto_2643678 ?auto_2643670 ) ( not ( = ?auto_2643671 ?auto_2643673 ) ) ( not ( = ?auto_2643677 ?auto_2643681 ) ) ( not ( = ?auto_2643671 ?auto_2643676 ) ) ( not ( = ?auto_2643673 ?auto_2643676 ) ) ( not ( = ?auto_2643679 ?auto_2643677 ) ) ( not ( = ?auto_2643679 ?auto_2643681 ) ) ( not ( = ?auto_2643671 ?auto_2643672 ) ) ( not ( = ?auto_2643673 ?auto_2643672 ) ) ( not ( = ?auto_2643676 ?auto_2643672 ) ) ( not ( = ?auto_2643680 ?auto_2643679 ) ) ( not ( = ?auto_2643680 ?auto_2643677 ) ) ( not ( = ?auto_2643680 ?auto_2643681 ) ) ( not ( = ?auto_2643671 ?auto_2643674 ) ) ( not ( = ?auto_2643673 ?auto_2643674 ) ) ( not ( = ?auto_2643676 ?auto_2643674 ) ) ( not ( = ?auto_2643672 ?auto_2643674 ) ) ( not ( = ?auto_2643671 ?auto_2643675 ) ) ( not ( = ?auto_2643673 ?auto_2643675 ) ) ( not ( = ?auto_2643676 ?auto_2643675 ) ) ( not ( = ?auto_2643672 ?auto_2643675 ) ) ( not ( = ?auto_2643674 ?auto_2643675 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_2643671 ?auto_2643673 ?auto_2643672 ?auto_2643676 ?auto_2643674 ?auto_2643675 ?auto_2643670 )
      ( DELIVER-6PKG-VERIFY ?auto_2643671 ?auto_2643672 ?auto_2643673 ?auto_2643674 ?auto_2643675 ?auto_2643676 ?auto_2643670 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_2647056 - OBJ
      ?auto_2647057 - OBJ
      ?auto_2647058 - OBJ
      ?auto_2647059 - OBJ
      ?auto_2647060 - OBJ
      ?auto_2647061 - OBJ
      ?auto_2647055 - LOCATION
    )
    :vars
    (
      ?auto_2647065 - LOCATION
      ?auto_2647067 - CITY
      ?auto_2647064 - LOCATION
      ?auto_2647062 - LOCATION
      ?auto_2647066 - LOCATION
      ?auto_2647063 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2647065 ?auto_2647067 ) ( IN-CITY ?auto_2647055 ?auto_2647067 ) ( not ( = ?auto_2647055 ?auto_2647065 ) ) ( OBJ-AT ?auto_2647061 ?auto_2647065 ) ( OBJ-AT ?auto_2647058 ?auto_2647065 ) ( OBJ-AT ?auto_2647057 ?auto_2647065 ) ( IN-CITY ?auto_2647064 ?auto_2647067 ) ( not ( = ?auto_2647055 ?auto_2647064 ) ) ( OBJ-AT ?auto_2647060 ?auto_2647064 ) ( IN-CITY ?auto_2647062 ?auto_2647067 ) ( not ( = ?auto_2647055 ?auto_2647062 ) ) ( OBJ-AT ?auto_2647059 ?auto_2647062 ) ( IN-CITY ?auto_2647066 ?auto_2647067 ) ( not ( = ?auto_2647055 ?auto_2647066 ) ) ( OBJ-AT ?auto_2647056 ?auto_2647066 ) ( TRUCK-AT ?auto_2647063 ?auto_2647055 ) ( not ( = ?auto_2647056 ?auto_2647059 ) ) ( not ( = ?auto_2647062 ?auto_2647066 ) ) ( not ( = ?auto_2647056 ?auto_2647060 ) ) ( not ( = ?auto_2647059 ?auto_2647060 ) ) ( not ( = ?auto_2647064 ?auto_2647062 ) ) ( not ( = ?auto_2647064 ?auto_2647066 ) ) ( not ( = ?auto_2647056 ?auto_2647057 ) ) ( not ( = ?auto_2647059 ?auto_2647057 ) ) ( not ( = ?auto_2647060 ?auto_2647057 ) ) ( not ( = ?auto_2647065 ?auto_2647064 ) ) ( not ( = ?auto_2647065 ?auto_2647062 ) ) ( not ( = ?auto_2647065 ?auto_2647066 ) ) ( not ( = ?auto_2647056 ?auto_2647058 ) ) ( not ( = ?auto_2647059 ?auto_2647058 ) ) ( not ( = ?auto_2647060 ?auto_2647058 ) ) ( not ( = ?auto_2647057 ?auto_2647058 ) ) ( not ( = ?auto_2647056 ?auto_2647061 ) ) ( not ( = ?auto_2647059 ?auto_2647061 ) ) ( not ( = ?auto_2647060 ?auto_2647061 ) ) ( not ( = ?auto_2647057 ?auto_2647061 ) ) ( not ( = ?auto_2647058 ?auto_2647061 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_2647056 ?auto_2647059 ?auto_2647057 ?auto_2647060 ?auto_2647058 ?auto_2647061 ?auto_2647055 )
      ( DELIVER-6PKG-VERIFY ?auto_2647056 ?auto_2647057 ?auto_2647058 ?auto_2647059 ?auto_2647060 ?auto_2647061 ?auto_2647055 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_2647125 - OBJ
      ?auto_2647126 - OBJ
      ?auto_2647127 - OBJ
      ?auto_2647128 - OBJ
      ?auto_2647129 - OBJ
      ?auto_2647130 - OBJ
      ?auto_2647124 - LOCATION
    )
    :vars
    (
      ?auto_2647134 - LOCATION
      ?auto_2647136 - CITY
      ?auto_2647133 - LOCATION
      ?auto_2647131 - LOCATION
      ?auto_2647135 - LOCATION
      ?auto_2647132 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2647134 ?auto_2647136 ) ( IN-CITY ?auto_2647124 ?auto_2647136 ) ( not ( = ?auto_2647124 ?auto_2647134 ) ) ( OBJ-AT ?auto_2647129 ?auto_2647134 ) ( OBJ-AT ?auto_2647127 ?auto_2647134 ) ( OBJ-AT ?auto_2647126 ?auto_2647134 ) ( IN-CITY ?auto_2647133 ?auto_2647136 ) ( not ( = ?auto_2647124 ?auto_2647133 ) ) ( OBJ-AT ?auto_2647130 ?auto_2647133 ) ( IN-CITY ?auto_2647131 ?auto_2647136 ) ( not ( = ?auto_2647124 ?auto_2647131 ) ) ( OBJ-AT ?auto_2647128 ?auto_2647131 ) ( IN-CITY ?auto_2647135 ?auto_2647136 ) ( not ( = ?auto_2647124 ?auto_2647135 ) ) ( OBJ-AT ?auto_2647125 ?auto_2647135 ) ( TRUCK-AT ?auto_2647132 ?auto_2647124 ) ( not ( = ?auto_2647125 ?auto_2647128 ) ) ( not ( = ?auto_2647131 ?auto_2647135 ) ) ( not ( = ?auto_2647125 ?auto_2647130 ) ) ( not ( = ?auto_2647128 ?auto_2647130 ) ) ( not ( = ?auto_2647133 ?auto_2647131 ) ) ( not ( = ?auto_2647133 ?auto_2647135 ) ) ( not ( = ?auto_2647125 ?auto_2647126 ) ) ( not ( = ?auto_2647128 ?auto_2647126 ) ) ( not ( = ?auto_2647130 ?auto_2647126 ) ) ( not ( = ?auto_2647134 ?auto_2647133 ) ) ( not ( = ?auto_2647134 ?auto_2647131 ) ) ( not ( = ?auto_2647134 ?auto_2647135 ) ) ( not ( = ?auto_2647125 ?auto_2647127 ) ) ( not ( = ?auto_2647128 ?auto_2647127 ) ) ( not ( = ?auto_2647130 ?auto_2647127 ) ) ( not ( = ?auto_2647126 ?auto_2647127 ) ) ( not ( = ?auto_2647125 ?auto_2647129 ) ) ( not ( = ?auto_2647128 ?auto_2647129 ) ) ( not ( = ?auto_2647130 ?auto_2647129 ) ) ( not ( = ?auto_2647126 ?auto_2647129 ) ) ( not ( = ?auto_2647127 ?auto_2647129 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_2647125 ?auto_2647128 ?auto_2647126 ?auto_2647130 ?auto_2647127 ?auto_2647129 ?auto_2647124 )
      ( DELIVER-6PKG-VERIFY ?auto_2647125 ?auto_2647126 ?auto_2647127 ?auto_2647128 ?auto_2647129 ?auto_2647130 ?auto_2647124 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_2647758 - OBJ
      ?auto_2647759 - OBJ
      ?auto_2647760 - OBJ
      ?auto_2647761 - OBJ
      ?auto_2647762 - OBJ
      ?auto_2647763 - OBJ
      ?auto_2647757 - LOCATION
    )
    :vars
    (
      ?auto_2647767 - LOCATION
      ?auto_2647769 - CITY
      ?auto_2647766 - LOCATION
      ?auto_2647764 - LOCATION
      ?auto_2647768 - LOCATION
      ?auto_2647765 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2647767 ?auto_2647769 ) ( IN-CITY ?auto_2647757 ?auto_2647769 ) ( not ( = ?auto_2647757 ?auto_2647767 ) ) ( OBJ-AT ?auto_2647761 ?auto_2647767 ) ( OBJ-AT ?auto_2647760 ?auto_2647767 ) ( OBJ-AT ?auto_2647759 ?auto_2647767 ) ( IN-CITY ?auto_2647766 ?auto_2647769 ) ( not ( = ?auto_2647757 ?auto_2647766 ) ) ( OBJ-AT ?auto_2647763 ?auto_2647766 ) ( IN-CITY ?auto_2647764 ?auto_2647769 ) ( not ( = ?auto_2647757 ?auto_2647764 ) ) ( OBJ-AT ?auto_2647762 ?auto_2647764 ) ( IN-CITY ?auto_2647768 ?auto_2647769 ) ( not ( = ?auto_2647757 ?auto_2647768 ) ) ( OBJ-AT ?auto_2647758 ?auto_2647768 ) ( TRUCK-AT ?auto_2647765 ?auto_2647757 ) ( not ( = ?auto_2647758 ?auto_2647762 ) ) ( not ( = ?auto_2647764 ?auto_2647768 ) ) ( not ( = ?auto_2647758 ?auto_2647763 ) ) ( not ( = ?auto_2647762 ?auto_2647763 ) ) ( not ( = ?auto_2647766 ?auto_2647764 ) ) ( not ( = ?auto_2647766 ?auto_2647768 ) ) ( not ( = ?auto_2647758 ?auto_2647759 ) ) ( not ( = ?auto_2647762 ?auto_2647759 ) ) ( not ( = ?auto_2647763 ?auto_2647759 ) ) ( not ( = ?auto_2647767 ?auto_2647766 ) ) ( not ( = ?auto_2647767 ?auto_2647764 ) ) ( not ( = ?auto_2647767 ?auto_2647768 ) ) ( not ( = ?auto_2647758 ?auto_2647760 ) ) ( not ( = ?auto_2647762 ?auto_2647760 ) ) ( not ( = ?auto_2647763 ?auto_2647760 ) ) ( not ( = ?auto_2647759 ?auto_2647760 ) ) ( not ( = ?auto_2647758 ?auto_2647761 ) ) ( not ( = ?auto_2647762 ?auto_2647761 ) ) ( not ( = ?auto_2647763 ?auto_2647761 ) ) ( not ( = ?auto_2647759 ?auto_2647761 ) ) ( not ( = ?auto_2647760 ?auto_2647761 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_2647758 ?auto_2647762 ?auto_2647759 ?auto_2647763 ?auto_2647760 ?auto_2647761 ?auto_2647757 )
      ( DELIVER-6PKG-VERIFY ?auto_2647758 ?auto_2647759 ?auto_2647760 ?auto_2647761 ?auto_2647762 ?auto_2647763 ?auto_2647757 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_2818229 - OBJ
      ?auto_2818230 - OBJ
      ?auto_2818231 - OBJ
      ?auto_2818232 - OBJ
      ?auto_2818233 - OBJ
      ?auto_2818234 - OBJ
      ?auto_2818228 - LOCATION
    )
    :vars
    (
      ?auto_2818238 - LOCATION
      ?auto_2818240 - CITY
      ?auto_2818237 - LOCATION
      ?auto_2818235 - LOCATION
      ?auto_2818239 - LOCATION
      ?auto_2818236 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2818238 ?auto_2818240 ) ( IN-CITY ?auto_2818228 ?auto_2818240 ) ( not ( = ?auto_2818228 ?auto_2818238 ) ) ( OBJ-AT ?auto_2818234 ?auto_2818238 ) ( OBJ-AT ?auto_2818233 ?auto_2818238 ) ( OBJ-AT ?auto_2818229 ?auto_2818238 ) ( IN-CITY ?auto_2818237 ?auto_2818240 ) ( not ( = ?auto_2818228 ?auto_2818237 ) ) ( OBJ-AT ?auto_2818232 ?auto_2818237 ) ( IN-CITY ?auto_2818235 ?auto_2818240 ) ( not ( = ?auto_2818228 ?auto_2818235 ) ) ( OBJ-AT ?auto_2818231 ?auto_2818235 ) ( IN-CITY ?auto_2818239 ?auto_2818240 ) ( not ( = ?auto_2818228 ?auto_2818239 ) ) ( OBJ-AT ?auto_2818230 ?auto_2818239 ) ( TRUCK-AT ?auto_2818236 ?auto_2818228 ) ( not ( = ?auto_2818230 ?auto_2818231 ) ) ( not ( = ?auto_2818235 ?auto_2818239 ) ) ( not ( = ?auto_2818230 ?auto_2818232 ) ) ( not ( = ?auto_2818231 ?auto_2818232 ) ) ( not ( = ?auto_2818237 ?auto_2818235 ) ) ( not ( = ?auto_2818237 ?auto_2818239 ) ) ( not ( = ?auto_2818230 ?auto_2818229 ) ) ( not ( = ?auto_2818231 ?auto_2818229 ) ) ( not ( = ?auto_2818232 ?auto_2818229 ) ) ( not ( = ?auto_2818238 ?auto_2818237 ) ) ( not ( = ?auto_2818238 ?auto_2818235 ) ) ( not ( = ?auto_2818238 ?auto_2818239 ) ) ( not ( = ?auto_2818230 ?auto_2818233 ) ) ( not ( = ?auto_2818231 ?auto_2818233 ) ) ( not ( = ?auto_2818232 ?auto_2818233 ) ) ( not ( = ?auto_2818229 ?auto_2818233 ) ) ( not ( = ?auto_2818230 ?auto_2818234 ) ) ( not ( = ?auto_2818231 ?auto_2818234 ) ) ( not ( = ?auto_2818232 ?auto_2818234 ) ) ( not ( = ?auto_2818229 ?auto_2818234 ) ) ( not ( = ?auto_2818233 ?auto_2818234 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_2818230 ?auto_2818231 ?auto_2818229 ?auto_2818232 ?auto_2818233 ?auto_2818234 ?auto_2818228 )
      ( DELIVER-6PKG-VERIFY ?auto_2818229 ?auto_2818230 ?auto_2818231 ?auto_2818232 ?auto_2818233 ?auto_2818234 ?auto_2818228 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_2818508 - OBJ
      ?auto_2818509 - OBJ
      ?auto_2818510 - OBJ
      ?auto_2818511 - OBJ
      ?auto_2818512 - OBJ
      ?auto_2818513 - OBJ
      ?auto_2818507 - LOCATION
    )
    :vars
    (
      ?auto_2818517 - LOCATION
      ?auto_2818519 - CITY
      ?auto_2818516 - LOCATION
      ?auto_2818514 - LOCATION
      ?auto_2818518 - LOCATION
      ?auto_2818515 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2818517 ?auto_2818519 ) ( IN-CITY ?auto_2818507 ?auto_2818519 ) ( not ( = ?auto_2818507 ?auto_2818517 ) ) ( OBJ-AT ?auto_2818513 ?auto_2818517 ) ( OBJ-AT ?auto_2818511 ?auto_2818517 ) ( OBJ-AT ?auto_2818508 ?auto_2818517 ) ( IN-CITY ?auto_2818516 ?auto_2818519 ) ( not ( = ?auto_2818507 ?auto_2818516 ) ) ( OBJ-AT ?auto_2818512 ?auto_2818516 ) ( IN-CITY ?auto_2818514 ?auto_2818519 ) ( not ( = ?auto_2818507 ?auto_2818514 ) ) ( OBJ-AT ?auto_2818510 ?auto_2818514 ) ( IN-CITY ?auto_2818518 ?auto_2818519 ) ( not ( = ?auto_2818507 ?auto_2818518 ) ) ( OBJ-AT ?auto_2818509 ?auto_2818518 ) ( TRUCK-AT ?auto_2818515 ?auto_2818507 ) ( not ( = ?auto_2818509 ?auto_2818510 ) ) ( not ( = ?auto_2818514 ?auto_2818518 ) ) ( not ( = ?auto_2818509 ?auto_2818512 ) ) ( not ( = ?auto_2818510 ?auto_2818512 ) ) ( not ( = ?auto_2818516 ?auto_2818514 ) ) ( not ( = ?auto_2818516 ?auto_2818518 ) ) ( not ( = ?auto_2818509 ?auto_2818508 ) ) ( not ( = ?auto_2818510 ?auto_2818508 ) ) ( not ( = ?auto_2818512 ?auto_2818508 ) ) ( not ( = ?auto_2818517 ?auto_2818516 ) ) ( not ( = ?auto_2818517 ?auto_2818514 ) ) ( not ( = ?auto_2818517 ?auto_2818518 ) ) ( not ( = ?auto_2818509 ?auto_2818511 ) ) ( not ( = ?auto_2818510 ?auto_2818511 ) ) ( not ( = ?auto_2818512 ?auto_2818511 ) ) ( not ( = ?auto_2818508 ?auto_2818511 ) ) ( not ( = ?auto_2818509 ?auto_2818513 ) ) ( not ( = ?auto_2818510 ?auto_2818513 ) ) ( not ( = ?auto_2818512 ?auto_2818513 ) ) ( not ( = ?auto_2818508 ?auto_2818513 ) ) ( not ( = ?auto_2818511 ?auto_2818513 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_2818509 ?auto_2818510 ?auto_2818508 ?auto_2818512 ?auto_2818511 ?auto_2818513 ?auto_2818507 )
      ( DELIVER-6PKG-VERIFY ?auto_2818508 ?auto_2818509 ?auto_2818510 ?auto_2818511 ?auto_2818512 ?auto_2818513 ?auto_2818507 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_2818577 - OBJ
      ?auto_2818578 - OBJ
      ?auto_2818579 - OBJ
      ?auto_2818580 - OBJ
      ?auto_2818581 - OBJ
      ?auto_2818582 - OBJ
      ?auto_2818576 - LOCATION
    )
    :vars
    (
      ?auto_2818586 - LOCATION
      ?auto_2818588 - CITY
      ?auto_2818585 - LOCATION
      ?auto_2818583 - LOCATION
      ?auto_2818587 - LOCATION
      ?auto_2818584 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2818586 ?auto_2818588 ) ( IN-CITY ?auto_2818576 ?auto_2818588 ) ( not ( = ?auto_2818576 ?auto_2818586 ) ) ( OBJ-AT ?auto_2818581 ?auto_2818586 ) ( OBJ-AT ?auto_2818580 ?auto_2818586 ) ( OBJ-AT ?auto_2818577 ?auto_2818586 ) ( IN-CITY ?auto_2818585 ?auto_2818588 ) ( not ( = ?auto_2818576 ?auto_2818585 ) ) ( OBJ-AT ?auto_2818582 ?auto_2818585 ) ( IN-CITY ?auto_2818583 ?auto_2818588 ) ( not ( = ?auto_2818576 ?auto_2818583 ) ) ( OBJ-AT ?auto_2818579 ?auto_2818583 ) ( IN-CITY ?auto_2818587 ?auto_2818588 ) ( not ( = ?auto_2818576 ?auto_2818587 ) ) ( OBJ-AT ?auto_2818578 ?auto_2818587 ) ( TRUCK-AT ?auto_2818584 ?auto_2818576 ) ( not ( = ?auto_2818578 ?auto_2818579 ) ) ( not ( = ?auto_2818583 ?auto_2818587 ) ) ( not ( = ?auto_2818578 ?auto_2818582 ) ) ( not ( = ?auto_2818579 ?auto_2818582 ) ) ( not ( = ?auto_2818585 ?auto_2818583 ) ) ( not ( = ?auto_2818585 ?auto_2818587 ) ) ( not ( = ?auto_2818578 ?auto_2818577 ) ) ( not ( = ?auto_2818579 ?auto_2818577 ) ) ( not ( = ?auto_2818582 ?auto_2818577 ) ) ( not ( = ?auto_2818586 ?auto_2818585 ) ) ( not ( = ?auto_2818586 ?auto_2818583 ) ) ( not ( = ?auto_2818586 ?auto_2818587 ) ) ( not ( = ?auto_2818578 ?auto_2818580 ) ) ( not ( = ?auto_2818579 ?auto_2818580 ) ) ( not ( = ?auto_2818582 ?auto_2818580 ) ) ( not ( = ?auto_2818577 ?auto_2818580 ) ) ( not ( = ?auto_2818578 ?auto_2818581 ) ) ( not ( = ?auto_2818579 ?auto_2818581 ) ) ( not ( = ?auto_2818582 ?auto_2818581 ) ) ( not ( = ?auto_2818577 ?auto_2818581 ) ) ( not ( = ?auto_2818580 ?auto_2818581 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_2818578 ?auto_2818579 ?auto_2818577 ?auto_2818582 ?auto_2818580 ?auto_2818581 ?auto_2818576 )
      ( DELIVER-6PKG-VERIFY ?auto_2818577 ?auto_2818578 ?auto_2818579 ?auto_2818580 ?auto_2818581 ?auto_2818582 ?auto_2818576 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_2821962 - OBJ
      ?auto_2821963 - OBJ
      ?auto_2821964 - OBJ
      ?auto_2821965 - OBJ
      ?auto_2821966 - OBJ
      ?auto_2821967 - OBJ
      ?auto_2821961 - LOCATION
    )
    :vars
    (
      ?auto_2821971 - LOCATION
      ?auto_2821973 - CITY
      ?auto_2821970 - LOCATION
      ?auto_2821968 - LOCATION
      ?auto_2821972 - LOCATION
      ?auto_2821969 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2821971 ?auto_2821973 ) ( IN-CITY ?auto_2821961 ?auto_2821973 ) ( not ( = ?auto_2821961 ?auto_2821971 ) ) ( OBJ-AT ?auto_2821967 ?auto_2821971 ) ( OBJ-AT ?auto_2821964 ?auto_2821971 ) ( OBJ-AT ?auto_2821962 ?auto_2821971 ) ( IN-CITY ?auto_2821970 ?auto_2821973 ) ( not ( = ?auto_2821961 ?auto_2821970 ) ) ( OBJ-AT ?auto_2821966 ?auto_2821970 ) ( IN-CITY ?auto_2821968 ?auto_2821973 ) ( not ( = ?auto_2821961 ?auto_2821968 ) ) ( OBJ-AT ?auto_2821965 ?auto_2821968 ) ( IN-CITY ?auto_2821972 ?auto_2821973 ) ( not ( = ?auto_2821961 ?auto_2821972 ) ) ( OBJ-AT ?auto_2821963 ?auto_2821972 ) ( TRUCK-AT ?auto_2821969 ?auto_2821961 ) ( not ( = ?auto_2821963 ?auto_2821965 ) ) ( not ( = ?auto_2821968 ?auto_2821972 ) ) ( not ( = ?auto_2821963 ?auto_2821966 ) ) ( not ( = ?auto_2821965 ?auto_2821966 ) ) ( not ( = ?auto_2821970 ?auto_2821968 ) ) ( not ( = ?auto_2821970 ?auto_2821972 ) ) ( not ( = ?auto_2821963 ?auto_2821962 ) ) ( not ( = ?auto_2821965 ?auto_2821962 ) ) ( not ( = ?auto_2821966 ?auto_2821962 ) ) ( not ( = ?auto_2821971 ?auto_2821970 ) ) ( not ( = ?auto_2821971 ?auto_2821968 ) ) ( not ( = ?auto_2821971 ?auto_2821972 ) ) ( not ( = ?auto_2821963 ?auto_2821964 ) ) ( not ( = ?auto_2821965 ?auto_2821964 ) ) ( not ( = ?auto_2821966 ?auto_2821964 ) ) ( not ( = ?auto_2821962 ?auto_2821964 ) ) ( not ( = ?auto_2821963 ?auto_2821967 ) ) ( not ( = ?auto_2821965 ?auto_2821967 ) ) ( not ( = ?auto_2821966 ?auto_2821967 ) ) ( not ( = ?auto_2821962 ?auto_2821967 ) ) ( not ( = ?auto_2821964 ?auto_2821967 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_2821963 ?auto_2821965 ?auto_2821962 ?auto_2821966 ?auto_2821964 ?auto_2821967 ?auto_2821961 )
      ( DELIVER-6PKG-VERIFY ?auto_2821962 ?auto_2821963 ?auto_2821964 ?auto_2821965 ?auto_2821966 ?auto_2821967 ?auto_2821961 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_2822031 - OBJ
      ?auto_2822032 - OBJ
      ?auto_2822033 - OBJ
      ?auto_2822034 - OBJ
      ?auto_2822035 - OBJ
      ?auto_2822036 - OBJ
      ?auto_2822030 - LOCATION
    )
    :vars
    (
      ?auto_2822040 - LOCATION
      ?auto_2822042 - CITY
      ?auto_2822039 - LOCATION
      ?auto_2822037 - LOCATION
      ?auto_2822041 - LOCATION
      ?auto_2822038 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2822040 ?auto_2822042 ) ( IN-CITY ?auto_2822030 ?auto_2822042 ) ( not ( = ?auto_2822030 ?auto_2822040 ) ) ( OBJ-AT ?auto_2822035 ?auto_2822040 ) ( OBJ-AT ?auto_2822033 ?auto_2822040 ) ( OBJ-AT ?auto_2822031 ?auto_2822040 ) ( IN-CITY ?auto_2822039 ?auto_2822042 ) ( not ( = ?auto_2822030 ?auto_2822039 ) ) ( OBJ-AT ?auto_2822036 ?auto_2822039 ) ( IN-CITY ?auto_2822037 ?auto_2822042 ) ( not ( = ?auto_2822030 ?auto_2822037 ) ) ( OBJ-AT ?auto_2822034 ?auto_2822037 ) ( IN-CITY ?auto_2822041 ?auto_2822042 ) ( not ( = ?auto_2822030 ?auto_2822041 ) ) ( OBJ-AT ?auto_2822032 ?auto_2822041 ) ( TRUCK-AT ?auto_2822038 ?auto_2822030 ) ( not ( = ?auto_2822032 ?auto_2822034 ) ) ( not ( = ?auto_2822037 ?auto_2822041 ) ) ( not ( = ?auto_2822032 ?auto_2822036 ) ) ( not ( = ?auto_2822034 ?auto_2822036 ) ) ( not ( = ?auto_2822039 ?auto_2822037 ) ) ( not ( = ?auto_2822039 ?auto_2822041 ) ) ( not ( = ?auto_2822032 ?auto_2822031 ) ) ( not ( = ?auto_2822034 ?auto_2822031 ) ) ( not ( = ?auto_2822036 ?auto_2822031 ) ) ( not ( = ?auto_2822040 ?auto_2822039 ) ) ( not ( = ?auto_2822040 ?auto_2822037 ) ) ( not ( = ?auto_2822040 ?auto_2822041 ) ) ( not ( = ?auto_2822032 ?auto_2822033 ) ) ( not ( = ?auto_2822034 ?auto_2822033 ) ) ( not ( = ?auto_2822036 ?auto_2822033 ) ) ( not ( = ?auto_2822031 ?auto_2822033 ) ) ( not ( = ?auto_2822032 ?auto_2822035 ) ) ( not ( = ?auto_2822034 ?auto_2822035 ) ) ( not ( = ?auto_2822036 ?auto_2822035 ) ) ( not ( = ?auto_2822031 ?auto_2822035 ) ) ( not ( = ?auto_2822033 ?auto_2822035 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_2822032 ?auto_2822034 ?auto_2822031 ?auto_2822036 ?auto_2822033 ?auto_2822035 ?auto_2822030 )
      ( DELIVER-6PKG-VERIFY ?auto_2822031 ?auto_2822032 ?auto_2822033 ?auto_2822034 ?auto_2822035 ?auto_2822036 ?auto_2822030 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_2822664 - OBJ
      ?auto_2822665 - OBJ
      ?auto_2822666 - OBJ
      ?auto_2822667 - OBJ
      ?auto_2822668 - OBJ
      ?auto_2822669 - OBJ
      ?auto_2822663 - LOCATION
    )
    :vars
    (
      ?auto_2822673 - LOCATION
      ?auto_2822675 - CITY
      ?auto_2822672 - LOCATION
      ?auto_2822670 - LOCATION
      ?auto_2822674 - LOCATION
      ?auto_2822671 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2822673 ?auto_2822675 ) ( IN-CITY ?auto_2822663 ?auto_2822675 ) ( not ( = ?auto_2822663 ?auto_2822673 ) ) ( OBJ-AT ?auto_2822667 ?auto_2822673 ) ( OBJ-AT ?auto_2822666 ?auto_2822673 ) ( OBJ-AT ?auto_2822664 ?auto_2822673 ) ( IN-CITY ?auto_2822672 ?auto_2822675 ) ( not ( = ?auto_2822663 ?auto_2822672 ) ) ( OBJ-AT ?auto_2822669 ?auto_2822672 ) ( IN-CITY ?auto_2822670 ?auto_2822675 ) ( not ( = ?auto_2822663 ?auto_2822670 ) ) ( OBJ-AT ?auto_2822668 ?auto_2822670 ) ( IN-CITY ?auto_2822674 ?auto_2822675 ) ( not ( = ?auto_2822663 ?auto_2822674 ) ) ( OBJ-AT ?auto_2822665 ?auto_2822674 ) ( TRUCK-AT ?auto_2822671 ?auto_2822663 ) ( not ( = ?auto_2822665 ?auto_2822668 ) ) ( not ( = ?auto_2822670 ?auto_2822674 ) ) ( not ( = ?auto_2822665 ?auto_2822669 ) ) ( not ( = ?auto_2822668 ?auto_2822669 ) ) ( not ( = ?auto_2822672 ?auto_2822670 ) ) ( not ( = ?auto_2822672 ?auto_2822674 ) ) ( not ( = ?auto_2822665 ?auto_2822664 ) ) ( not ( = ?auto_2822668 ?auto_2822664 ) ) ( not ( = ?auto_2822669 ?auto_2822664 ) ) ( not ( = ?auto_2822673 ?auto_2822672 ) ) ( not ( = ?auto_2822673 ?auto_2822670 ) ) ( not ( = ?auto_2822673 ?auto_2822674 ) ) ( not ( = ?auto_2822665 ?auto_2822666 ) ) ( not ( = ?auto_2822668 ?auto_2822666 ) ) ( not ( = ?auto_2822669 ?auto_2822666 ) ) ( not ( = ?auto_2822664 ?auto_2822666 ) ) ( not ( = ?auto_2822665 ?auto_2822667 ) ) ( not ( = ?auto_2822668 ?auto_2822667 ) ) ( not ( = ?auto_2822669 ?auto_2822667 ) ) ( not ( = ?auto_2822664 ?auto_2822667 ) ) ( not ( = ?auto_2822666 ?auto_2822667 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_2822665 ?auto_2822668 ?auto_2822664 ?auto_2822669 ?auto_2822666 ?auto_2822667 ?auto_2822663 )
      ( DELIVER-6PKG-VERIFY ?auto_2822664 ?auto_2822665 ?auto_2822666 ?auto_2822667 ?auto_2822668 ?auto_2822669 ?auto_2822663 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_2855967 - OBJ
      ?auto_2855968 - OBJ
      ?auto_2855969 - OBJ
      ?auto_2855970 - OBJ
      ?auto_2855971 - OBJ
      ?auto_2855972 - OBJ
      ?auto_2855966 - LOCATION
    )
    :vars
    (
      ?auto_2855976 - LOCATION
      ?auto_2855978 - CITY
      ?auto_2855975 - LOCATION
      ?auto_2855973 - LOCATION
      ?auto_2855977 - LOCATION
      ?auto_2855974 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2855976 ?auto_2855978 ) ( IN-CITY ?auto_2855966 ?auto_2855978 ) ( not ( = ?auto_2855966 ?auto_2855976 ) ) ( OBJ-AT ?auto_2855972 ?auto_2855976 ) ( OBJ-AT ?auto_2855968 ?auto_2855976 ) ( OBJ-AT ?auto_2855967 ?auto_2855976 ) ( IN-CITY ?auto_2855975 ?auto_2855978 ) ( not ( = ?auto_2855966 ?auto_2855975 ) ) ( OBJ-AT ?auto_2855971 ?auto_2855975 ) ( IN-CITY ?auto_2855973 ?auto_2855978 ) ( not ( = ?auto_2855966 ?auto_2855973 ) ) ( OBJ-AT ?auto_2855970 ?auto_2855973 ) ( IN-CITY ?auto_2855977 ?auto_2855978 ) ( not ( = ?auto_2855966 ?auto_2855977 ) ) ( OBJ-AT ?auto_2855969 ?auto_2855977 ) ( TRUCK-AT ?auto_2855974 ?auto_2855966 ) ( not ( = ?auto_2855969 ?auto_2855970 ) ) ( not ( = ?auto_2855973 ?auto_2855977 ) ) ( not ( = ?auto_2855969 ?auto_2855971 ) ) ( not ( = ?auto_2855970 ?auto_2855971 ) ) ( not ( = ?auto_2855975 ?auto_2855973 ) ) ( not ( = ?auto_2855975 ?auto_2855977 ) ) ( not ( = ?auto_2855969 ?auto_2855967 ) ) ( not ( = ?auto_2855970 ?auto_2855967 ) ) ( not ( = ?auto_2855971 ?auto_2855967 ) ) ( not ( = ?auto_2855976 ?auto_2855975 ) ) ( not ( = ?auto_2855976 ?auto_2855973 ) ) ( not ( = ?auto_2855976 ?auto_2855977 ) ) ( not ( = ?auto_2855969 ?auto_2855968 ) ) ( not ( = ?auto_2855970 ?auto_2855968 ) ) ( not ( = ?auto_2855971 ?auto_2855968 ) ) ( not ( = ?auto_2855967 ?auto_2855968 ) ) ( not ( = ?auto_2855969 ?auto_2855972 ) ) ( not ( = ?auto_2855970 ?auto_2855972 ) ) ( not ( = ?auto_2855971 ?auto_2855972 ) ) ( not ( = ?auto_2855967 ?auto_2855972 ) ) ( not ( = ?auto_2855968 ?auto_2855972 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_2855969 ?auto_2855970 ?auto_2855967 ?auto_2855971 ?auto_2855968 ?auto_2855972 ?auto_2855966 )
      ( DELIVER-6PKG-VERIFY ?auto_2855967 ?auto_2855968 ?auto_2855969 ?auto_2855970 ?auto_2855971 ?auto_2855972 ?auto_2855966 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_2856036 - OBJ
      ?auto_2856037 - OBJ
      ?auto_2856038 - OBJ
      ?auto_2856039 - OBJ
      ?auto_2856040 - OBJ
      ?auto_2856041 - OBJ
      ?auto_2856035 - LOCATION
    )
    :vars
    (
      ?auto_2856045 - LOCATION
      ?auto_2856047 - CITY
      ?auto_2856044 - LOCATION
      ?auto_2856042 - LOCATION
      ?auto_2856046 - LOCATION
      ?auto_2856043 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2856045 ?auto_2856047 ) ( IN-CITY ?auto_2856035 ?auto_2856047 ) ( not ( = ?auto_2856035 ?auto_2856045 ) ) ( OBJ-AT ?auto_2856040 ?auto_2856045 ) ( OBJ-AT ?auto_2856037 ?auto_2856045 ) ( OBJ-AT ?auto_2856036 ?auto_2856045 ) ( IN-CITY ?auto_2856044 ?auto_2856047 ) ( not ( = ?auto_2856035 ?auto_2856044 ) ) ( OBJ-AT ?auto_2856041 ?auto_2856044 ) ( IN-CITY ?auto_2856042 ?auto_2856047 ) ( not ( = ?auto_2856035 ?auto_2856042 ) ) ( OBJ-AT ?auto_2856039 ?auto_2856042 ) ( IN-CITY ?auto_2856046 ?auto_2856047 ) ( not ( = ?auto_2856035 ?auto_2856046 ) ) ( OBJ-AT ?auto_2856038 ?auto_2856046 ) ( TRUCK-AT ?auto_2856043 ?auto_2856035 ) ( not ( = ?auto_2856038 ?auto_2856039 ) ) ( not ( = ?auto_2856042 ?auto_2856046 ) ) ( not ( = ?auto_2856038 ?auto_2856041 ) ) ( not ( = ?auto_2856039 ?auto_2856041 ) ) ( not ( = ?auto_2856044 ?auto_2856042 ) ) ( not ( = ?auto_2856044 ?auto_2856046 ) ) ( not ( = ?auto_2856038 ?auto_2856036 ) ) ( not ( = ?auto_2856039 ?auto_2856036 ) ) ( not ( = ?auto_2856041 ?auto_2856036 ) ) ( not ( = ?auto_2856045 ?auto_2856044 ) ) ( not ( = ?auto_2856045 ?auto_2856042 ) ) ( not ( = ?auto_2856045 ?auto_2856046 ) ) ( not ( = ?auto_2856038 ?auto_2856037 ) ) ( not ( = ?auto_2856039 ?auto_2856037 ) ) ( not ( = ?auto_2856041 ?auto_2856037 ) ) ( not ( = ?auto_2856036 ?auto_2856037 ) ) ( not ( = ?auto_2856038 ?auto_2856040 ) ) ( not ( = ?auto_2856039 ?auto_2856040 ) ) ( not ( = ?auto_2856041 ?auto_2856040 ) ) ( not ( = ?auto_2856036 ?auto_2856040 ) ) ( not ( = ?auto_2856037 ?auto_2856040 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_2856038 ?auto_2856039 ?auto_2856036 ?auto_2856041 ?auto_2856037 ?auto_2856040 ?auto_2856035 )
      ( DELIVER-6PKG-VERIFY ?auto_2856036 ?auto_2856037 ?auto_2856038 ?auto_2856039 ?auto_2856040 ?auto_2856041 ?auto_2856035 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_2856669 - OBJ
      ?auto_2856670 - OBJ
      ?auto_2856671 - OBJ
      ?auto_2856672 - OBJ
      ?auto_2856673 - OBJ
      ?auto_2856674 - OBJ
      ?auto_2856668 - LOCATION
    )
    :vars
    (
      ?auto_2856678 - LOCATION
      ?auto_2856680 - CITY
      ?auto_2856677 - LOCATION
      ?auto_2856675 - LOCATION
      ?auto_2856679 - LOCATION
      ?auto_2856676 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2856678 ?auto_2856680 ) ( IN-CITY ?auto_2856668 ?auto_2856680 ) ( not ( = ?auto_2856668 ?auto_2856678 ) ) ( OBJ-AT ?auto_2856672 ?auto_2856678 ) ( OBJ-AT ?auto_2856670 ?auto_2856678 ) ( OBJ-AT ?auto_2856669 ?auto_2856678 ) ( IN-CITY ?auto_2856677 ?auto_2856680 ) ( not ( = ?auto_2856668 ?auto_2856677 ) ) ( OBJ-AT ?auto_2856674 ?auto_2856677 ) ( IN-CITY ?auto_2856675 ?auto_2856680 ) ( not ( = ?auto_2856668 ?auto_2856675 ) ) ( OBJ-AT ?auto_2856673 ?auto_2856675 ) ( IN-CITY ?auto_2856679 ?auto_2856680 ) ( not ( = ?auto_2856668 ?auto_2856679 ) ) ( OBJ-AT ?auto_2856671 ?auto_2856679 ) ( TRUCK-AT ?auto_2856676 ?auto_2856668 ) ( not ( = ?auto_2856671 ?auto_2856673 ) ) ( not ( = ?auto_2856675 ?auto_2856679 ) ) ( not ( = ?auto_2856671 ?auto_2856674 ) ) ( not ( = ?auto_2856673 ?auto_2856674 ) ) ( not ( = ?auto_2856677 ?auto_2856675 ) ) ( not ( = ?auto_2856677 ?auto_2856679 ) ) ( not ( = ?auto_2856671 ?auto_2856669 ) ) ( not ( = ?auto_2856673 ?auto_2856669 ) ) ( not ( = ?auto_2856674 ?auto_2856669 ) ) ( not ( = ?auto_2856678 ?auto_2856677 ) ) ( not ( = ?auto_2856678 ?auto_2856675 ) ) ( not ( = ?auto_2856678 ?auto_2856679 ) ) ( not ( = ?auto_2856671 ?auto_2856670 ) ) ( not ( = ?auto_2856673 ?auto_2856670 ) ) ( not ( = ?auto_2856674 ?auto_2856670 ) ) ( not ( = ?auto_2856669 ?auto_2856670 ) ) ( not ( = ?auto_2856671 ?auto_2856672 ) ) ( not ( = ?auto_2856673 ?auto_2856672 ) ) ( not ( = ?auto_2856674 ?auto_2856672 ) ) ( not ( = ?auto_2856669 ?auto_2856672 ) ) ( not ( = ?auto_2856670 ?auto_2856672 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_2856671 ?auto_2856673 ?auto_2856669 ?auto_2856674 ?auto_2856670 ?auto_2856672 ?auto_2856668 )
      ( DELIVER-6PKG-VERIFY ?auto_2856669 ?auto_2856670 ?auto_2856671 ?auto_2856672 ?auto_2856673 ?auto_2856674 ?auto_2856668 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_2862451 - OBJ
      ?auto_2862452 - OBJ
      ?auto_2862453 - OBJ
      ?auto_2862454 - OBJ
      ?auto_2862455 - OBJ
      ?auto_2862456 - OBJ
      ?auto_2862450 - LOCATION
    )
    :vars
    (
      ?auto_2862460 - LOCATION
      ?auto_2862462 - CITY
      ?auto_2862459 - LOCATION
      ?auto_2862457 - LOCATION
      ?auto_2862461 - LOCATION
      ?auto_2862458 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2862460 ?auto_2862462 ) ( IN-CITY ?auto_2862450 ?auto_2862462 ) ( not ( = ?auto_2862450 ?auto_2862460 ) ) ( OBJ-AT ?auto_2862453 ?auto_2862460 ) ( OBJ-AT ?auto_2862452 ?auto_2862460 ) ( OBJ-AT ?auto_2862451 ?auto_2862460 ) ( IN-CITY ?auto_2862459 ?auto_2862462 ) ( not ( = ?auto_2862450 ?auto_2862459 ) ) ( OBJ-AT ?auto_2862456 ?auto_2862459 ) ( IN-CITY ?auto_2862457 ?auto_2862462 ) ( not ( = ?auto_2862450 ?auto_2862457 ) ) ( OBJ-AT ?auto_2862455 ?auto_2862457 ) ( IN-CITY ?auto_2862461 ?auto_2862462 ) ( not ( = ?auto_2862450 ?auto_2862461 ) ) ( OBJ-AT ?auto_2862454 ?auto_2862461 ) ( TRUCK-AT ?auto_2862458 ?auto_2862450 ) ( not ( = ?auto_2862454 ?auto_2862455 ) ) ( not ( = ?auto_2862457 ?auto_2862461 ) ) ( not ( = ?auto_2862454 ?auto_2862456 ) ) ( not ( = ?auto_2862455 ?auto_2862456 ) ) ( not ( = ?auto_2862459 ?auto_2862457 ) ) ( not ( = ?auto_2862459 ?auto_2862461 ) ) ( not ( = ?auto_2862454 ?auto_2862451 ) ) ( not ( = ?auto_2862455 ?auto_2862451 ) ) ( not ( = ?auto_2862456 ?auto_2862451 ) ) ( not ( = ?auto_2862460 ?auto_2862459 ) ) ( not ( = ?auto_2862460 ?auto_2862457 ) ) ( not ( = ?auto_2862460 ?auto_2862461 ) ) ( not ( = ?auto_2862454 ?auto_2862452 ) ) ( not ( = ?auto_2862455 ?auto_2862452 ) ) ( not ( = ?auto_2862456 ?auto_2862452 ) ) ( not ( = ?auto_2862451 ?auto_2862452 ) ) ( not ( = ?auto_2862454 ?auto_2862453 ) ) ( not ( = ?auto_2862455 ?auto_2862453 ) ) ( not ( = ?auto_2862456 ?auto_2862453 ) ) ( not ( = ?auto_2862451 ?auto_2862453 ) ) ( not ( = ?auto_2862452 ?auto_2862453 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_2862454 ?auto_2862455 ?auto_2862451 ?auto_2862456 ?auto_2862452 ?auto_2862453 ?auto_2862450 )
      ( DELIVER-6PKG-VERIFY ?auto_2862451 ?auto_2862452 ?auto_2862453 ?auto_2862454 ?auto_2862455 ?auto_2862456 ?auto_2862450 ) )
  )

)

