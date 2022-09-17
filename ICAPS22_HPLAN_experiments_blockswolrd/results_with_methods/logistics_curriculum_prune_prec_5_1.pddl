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
      ?auto_57810 - OBJ
      ?auto_57809 - LOCATION
    )
    :vars
    (
      ?auto_57812 - LOCATION
      ?auto_57813 - CITY
      ?auto_57811 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_57812 ?auto_57813 ) ( IN-CITY ?auto_57809 ?auto_57813 ) ( not ( = ?auto_57809 ?auto_57812 ) ) ( OBJ-AT ?auto_57810 ?auto_57812 ) ( TRUCK-AT ?auto_57811 ?auto_57809 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_57811 ?auto_57809 ?auto_57812 ?auto_57813 )
      ( !LOAD-TRUCK ?auto_57810 ?auto_57811 ?auto_57812 )
      ( !DRIVE-TRUCK ?auto_57811 ?auto_57812 ?auto_57809 ?auto_57813 )
      ( !UNLOAD-TRUCK ?auto_57810 ?auto_57811 ?auto_57809 )
      ( DELIVER-1PKG-VERIFY ?auto_57810 ?auto_57809 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_57831 - OBJ
      ?auto_57832 - OBJ
      ?auto_57830 - LOCATION
    )
    :vars
    (
      ?auto_57833 - LOCATION
      ?auto_57834 - CITY
      ?auto_57836 - LOCATION
      ?auto_57835 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_57833 ?auto_57834 ) ( IN-CITY ?auto_57830 ?auto_57834 ) ( not ( = ?auto_57830 ?auto_57833 ) ) ( OBJ-AT ?auto_57832 ?auto_57833 ) ( IN-CITY ?auto_57836 ?auto_57834 ) ( not ( = ?auto_57830 ?auto_57836 ) ) ( OBJ-AT ?auto_57831 ?auto_57836 ) ( TRUCK-AT ?auto_57835 ?auto_57830 ) ( not ( = ?auto_57831 ?auto_57832 ) ) ( not ( = ?auto_57833 ?auto_57836 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_57831 ?auto_57830 )
      ( DELIVER-1PKG ?auto_57832 ?auto_57830 )
      ( DELIVER-2PKG-VERIFY ?auto_57831 ?auto_57832 ?auto_57830 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_57942 - OBJ
      ?auto_57943 - OBJ
      ?auto_57944 - OBJ
      ?auto_57941 - LOCATION
    )
    :vars
    (
      ?auto_57945 - LOCATION
      ?auto_57946 - CITY
      ?auto_57948 - LOCATION
      ?auto_57949 - LOCATION
      ?auto_57947 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_57945 ?auto_57946 ) ( IN-CITY ?auto_57941 ?auto_57946 ) ( not ( = ?auto_57941 ?auto_57945 ) ) ( OBJ-AT ?auto_57944 ?auto_57945 ) ( IN-CITY ?auto_57948 ?auto_57946 ) ( not ( = ?auto_57941 ?auto_57948 ) ) ( OBJ-AT ?auto_57943 ?auto_57948 ) ( IN-CITY ?auto_57949 ?auto_57946 ) ( not ( = ?auto_57941 ?auto_57949 ) ) ( OBJ-AT ?auto_57942 ?auto_57949 ) ( TRUCK-AT ?auto_57947 ?auto_57941 ) ( not ( = ?auto_57942 ?auto_57943 ) ) ( not ( = ?auto_57948 ?auto_57949 ) ) ( not ( = ?auto_57942 ?auto_57944 ) ) ( not ( = ?auto_57943 ?auto_57944 ) ) ( not ( = ?auto_57945 ?auto_57948 ) ) ( not ( = ?auto_57945 ?auto_57949 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_57942 ?auto_57943 ?auto_57941 )
      ( DELIVER-1PKG ?auto_57944 ?auto_57941 )
      ( DELIVER-3PKG-VERIFY ?auto_57942 ?auto_57943 ?auto_57944 ?auto_57941 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_59085 - OBJ
      ?auto_59086 - OBJ
      ?auto_59087 - OBJ
      ?auto_59088 - OBJ
      ?auto_59084 - LOCATION
    )
    :vars
    (
      ?auto_59090 - LOCATION
      ?auto_59091 - CITY
      ?auto_59094 - LOCATION
      ?auto_59092 - LOCATION
      ?auto_59093 - LOCATION
      ?auto_59089 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_59090 ?auto_59091 ) ( IN-CITY ?auto_59084 ?auto_59091 ) ( not ( = ?auto_59084 ?auto_59090 ) ) ( OBJ-AT ?auto_59088 ?auto_59090 ) ( IN-CITY ?auto_59094 ?auto_59091 ) ( not ( = ?auto_59084 ?auto_59094 ) ) ( OBJ-AT ?auto_59087 ?auto_59094 ) ( IN-CITY ?auto_59092 ?auto_59091 ) ( not ( = ?auto_59084 ?auto_59092 ) ) ( OBJ-AT ?auto_59086 ?auto_59092 ) ( IN-CITY ?auto_59093 ?auto_59091 ) ( not ( = ?auto_59084 ?auto_59093 ) ) ( OBJ-AT ?auto_59085 ?auto_59093 ) ( TRUCK-AT ?auto_59089 ?auto_59084 ) ( not ( = ?auto_59085 ?auto_59086 ) ) ( not ( = ?auto_59092 ?auto_59093 ) ) ( not ( = ?auto_59085 ?auto_59087 ) ) ( not ( = ?auto_59086 ?auto_59087 ) ) ( not ( = ?auto_59094 ?auto_59092 ) ) ( not ( = ?auto_59094 ?auto_59093 ) ) ( not ( = ?auto_59085 ?auto_59088 ) ) ( not ( = ?auto_59086 ?auto_59088 ) ) ( not ( = ?auto_59087 ?auto_59088 ) ) ( not ( = ?auto_59090 ?auto_59094 ) ) ( not ( = ?auto_59090 ?auto_59092 ) ) ( not ( = ?auto_59090 ?auto_59093 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_59085 ?auto_59086 ?auto_59087 ?auto_59084 )
      ( DELIVER-1PKG ?auto_59088 ?auto_59084 )
      ( DELIVER-4PKG-VERIFY ?auto_59085 ?auto_59086 ?auto_59087 ?auto_59088 ?auto_59084 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_74695 - OBJ
      ?auto_74696 - OBJ
      ?auto_74697 - OBJ
      ?auto_74698 - OBJ
      ?auto_74699 - OBJ
      ?auto_74694 - LOCATION
    )
    :vars
    (
      ?auto_74701 - LOCATION
      ?auto_74700 - CITY
      ?auto_74703 - LOCATION
      ?auto_74705 - LOCATION
      ?auto_74704 - LOCATION
      ?auto_74702 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_74701 ?auto_74700 ) ( IN-CITY ?auto_74694 ?auto_74700 ) ( not ( = ?auto_74694 ?auto_74701 ) ) ( OBJ-AT ?auto_74699 ?auto_74701 ) ( IN-CITY ?auto_74703 ?auto_74700 ) ( not ( = ?auto_74694 ?auto_74703 ) ) ( OBJ-AT ?auto_74698 ?auto_74703 ) ( IN-CITY ?auto_74705 ?auto_74700 ) ( not ( = ?auto_74694 ?auto_74705 ) ) ( OBJ-AT ?auto_74697 ?auto_74705 ) ( OBJ-AT ?auto_74696 ?auto_74701 ) ( IN-CITY ?auto_74704 ?auto_74700 ) ( not ( = ?auto_74694 ?auto_74704 ) ) ( OBJ-AT ?auto_74695 ?auto_74704 ) ( TRUCK-AT ?auto_74702 ?auto_74694 ) ( not ( = ?auto_74695 ?auto_74696 ) ) ( not ( = ?auto_74701 ?auto_74704 ) ) ( not ( = ?auto_74695 ?auto_74697 ) ) ( not ( = ?auto_74696 ?auto_74697 ) ) ( not ( = ?auto_74705 ?auto_74701 ) ) ( not ( = ?auto_74705 ?auto_74704 ) ) ( not ( = ?auto_74695 ?auto_74698 ) ) ( not ( = ?auto_74696 ?auto_74698 ) ) ( not ( = ?auto_74697 ?auto_74698 ) ) ( not ( = ?auto_74703 ?auto_74705 ) ) ( not ( = ?auto_74703 ?auto_74701 ) ) ( not ( = ?auto_74703 ?auto_74704 ) ) ( not ( = ?auto_74695 ?auto_74699 ) ) ( not ( = ?auto_74696 ?auto_74699 ) ) ( not ( = ?auto_74697 ?auto_74699 ) ) ( not ( = ?auto_74698 ?auto_74699 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_74695 ?auto_74696 ?auto_74697 ?auto_74698 ?auto_74694 )
      ( DELIVER-1PKG ?auto_74699 ?auto_74694 )
      ( DELIVER-5PKG-VERIFY ?auto_74695 ?auto_74696 ?auto_74697 ?auto_74698 ?auto_74699 ?auto_74694 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_74746 - OBJ
      ?auto_74747 - OBJ
      ?auto_74748 - OBJ
      ?auto_74749 - OBJ
      ?auto_74750 - OBJ
      ?auto_74745 - LOCATION
    )
    :vars
    (
      ?auto_74754 - LOCATION
      ?auto_74755 - CITY
      ?auto_74751 - LOCATION
      ?auto_74753 - LOCATION
      ?auto_74756 - LOCATION
      ?auto_74752 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_74754 ?auto_74755 ) ( IN-CITY ?auto_74745 ?auto_74755 ) ( not ( = ?auto_74745 ?auto_74754 ) ) ( OBJ-AT ?auto_74749 ?auto_74754 ) ( IN-CITY ?auto_74751 ?auto_74755 ) ( not ( = ?auto_74745 ?auto_74751 ) ) ( OBJ-AT ?auto_74750 ?auto_74751 ) ( IN-CITY ?auto_74753 ?auto_74755 ) ( not ( = ?auto_74745 ?auto_74753 ) ) ( OBJ-AT ?auto_74748 ?auto_74753 ) ( OBJ-AT ?auto_74747 ?auto_74754 ) ( IN-CITY ?auto_74756 ?auto_74755 ) ( not ( = ?auto_74745 ?auto_74756 ) ) ( OBJ-AT ?auto_74746 ?auto_74756 ) ( TRUCK-AT ?auto_74752 ?auto_74745 ) ( not ( = ?auto_74746 ?auto_74747 ) ) ( not ( = ?auto_74754 ?auto_74756 ) ) ( not ( = ?auto_74746 ?auto_74748 ) ) ( not ( = ?auto_74747 ?auto_74748 ) ) ( not ( = ?auto_74753 ?auto_74754 ) ) ( not ( = ?auto_74753 ?auto_74756 ) ) ( not ( = ?auto_74746 ?auto_74750 ) ) ( not ( = ?auto_74747 ?auto_74750 ) ) ( not ( = ?auto_74748 ?auto_74750 ) ) ( not ( = ?auto_74751 ?auto_74753 ) ) ( not ( = ?auto_74751 ?auto_74754 ) ) ( not ( = ?auto_74751 ?auto_74756 ) ) ( not ( = ?auto_74746 ?auto_74749 ) ) ( not ( = ?auto_74747 ?auto_74749 ) ) ( not ( = ?auto_74748 ?auto_74749 ) ) ( not ( = ?auto_74750 ?auto_74749 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_74746 ?auto_74747 ?auto_74748 ?auto_74750 ?auto_74749 ?auto_74745 )
      ( DELIVER-5PKG-VERIFY ?auto_74746 ?auto_74747 ?auto_74748 ?auto_74749 ?auto_74750 ?auto_74745 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_75049 - OBJ
      ?auto_75050 - OBJ
      ?auto_75051 - OBJ
      ?auto_75052 - OBJ
      ?auto_75053 - OBJ
      ?auto_75048 - LOCATION
    )
    :vars
    (
      ?auto_75057 - LOCATION
      ?auto_75058 - CITY
      ?auto_75059 - LOCATION
      ?auto_75054 - LOCATION
      ?auto_75056 - LOCATION
      ?auto_75055 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_75057 ?auto_75058 ) ( IN-CITY ?auto_75048 ?auto_75058 ) ( not ( = ?auto_75048 ?auto_75057 ) ) ( OBJ-AT ?auto_75051 ?auto_75057 ) ( IN-CITY ?auto_75059 ?auto_75058 ) ( not ( = ?auto_75048 ?auto_75059 ) ) ( OBJ-AT ?auto_75053 ?auto_75059 ) ( IN-CITY ?auto_75054 ?auto_75058 ) ( not ( = ?auto_75048 ?auto_75054 ) ) ( OBJ-AT ?auto_75052 ?auto_75054 ) ( OBJ-AT ?auto_75050 ?auto_75057 ) ( IN-CITY ?auto_75056 ?auto_75058 ) ( not ( = ?auto_75048 ?auto_75056 ) ) ( OBJ-AT ?auto_75049 ?auto_75056 ) ( TRUCK-AT ?auto_75055 ?auto_75048 ) ( not ( = ?auto_75049 ?auto_75050 ) ) ( not ( = ?auto_75057 ?auto_75056 ) ) ( not ( = ?auto_75049 ?auto_75052 ) ) ( not ( = ?auto_75050 ?auto_75052 ) ) ( not ( = ?auto_75054 ?auto_75057 ) ) ( not ( = ?auto_75054 ?auto_75056 ) ) ( not ( = ?auto_75049 ?auto_75053 ) ) ( not ( = ?auto_75050 ?auto_75053 ) ) ( not ( = ?auto_75052 ?auto_75053 ) ) ( not ( = ?auto_75059 ?auto_75054 ) ) ( not ( = ?auto_75059 ?auto_75057 ) ) ( not ( = ?auto_75059 ?auto_75056 ) ) ( not ( = ?auto_75049 ?auto_75051 ) ) ( not ( = ?auto_75050 ?auto_75051 ) ) ( not ( = ?auto_75052 ?auto_75051 ) ) ( not ( = ?auto_75053 ?auto_75051 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_75049 ?auto_75050 ?auto_75052 ?auto_75051 ?auto_75053 ?auto_75048 )
      ( DELIVER-5PKG-VERIFY ?auto_75049 ?auto_75050 ?auto_75051 ?auto_75052 ?auto_75053 ?auto_75048 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_75361 - OBJ
      ?auto_75362 - OBJ
      ?auto_75363 - OBJ
      ?auto_75364 - OBJ
      ?auto_75365 - OBJ
      ?auto_75360 - LOCATION
    )
    :vars
    (
      ?auto_75369 - LOCATION
      ?auto_75370 - CITY
      ?auto_75371 - LOCATION
      ?auto_75366 - LOCATION
      ?auto_75368 - LOCATION
      ?auto_75367 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_75369 ?auto_75370 ) ( IN-CITY ?auto_75360 ?auto_75370 ) ( not ( = ?auto_75360 ?auto_75369 ) ) ( OBJ-AT ?auto_75365 ?auto_75369 ) ( IN-CITY ?auto_75371 ?auto_75370 ) ( not ( = ?auto_75360 ?auto_75371 ) ) ( OBJ-AT ?auto_75364 ?auto_75371 ) ( IN-CITY ?auto_75366 ?auto_75370 ) ( not ( = ?auto_75360 ?auto_75366 ) ) ( OBJ-AT ?auto_75362 ?auto_75366 ) ( OBJ-AT ?auto_75363 ?auto_75369 ) ( IN-CITY ?auto_75368 ?auto_75370 ) ( not ( = ?auto_75360 ?auto_75368 ) ) ( OBJ-AT ?auto_75361 ?auto_75368 ) ( TRUCK-AT ?auto_75367 ?auto_75360 ) ( not ( = ?auto_75361 ?auto_75363 ) ) ( not ( = ?auto_75369 ?auto_75368 ) ) ( not ( = ?auto_75361 ?auto_75362 ) ) ( not ( = ?auto_75363 ?auto_75362 ) ) ( not ( = ?auto_75366 ?auto_75369 ) ) ( not ( = ?auto_75366 ?auto_75368 ) ) ( not ( = ?auto_75361 ?auto_75364 ) ) ( not ( = ?auto_75363 ?auto_75364 ) ) ( not ( = ?auto_75362 ?auto_75364 ) ) ( not ( = ?auto_75371 ?auto_75366 ) ) ( not ( = ?auto_75371 ?auto_75369 ) ) ( not ( = ?auto_75371 ?auto_75368 ) ) ( not ( = ?auto_75361 ?auto_75365 ) ) ( not ( = ?auto_75363 ?auto_75365 ) ) ( not ( = ?auto_75362 ?auto_75365 ) ) ( not ( = ?auto_75364 ?auto_75365 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_75361 ?auto_75363 ?auto_75362 ?auto_75365 ?auto_75364 ?auto_75360 )
      ( DELIVER-5PKG-VERIFY ?auto_75361 ?auto_75362 ?auto_75363 ?auto_75364 ?auto_75365 ?auto_75360 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_75412 - OBJ
      ?auto_75413 - OBJ
      ?auto_75414 - OBJ
      ?auto_75415 - OBJ
      ?auto_75416 - OBJ
      ?auto_75411 - LOCATION
    )
    :vars
    (
      ?auto_75420 - LOCATION
      ?auto_75421 - CITY
      ?auto_75422 - LOCATION
      ?auto_75417 - LOCATION
      ?auto_75419 - LOCATION
      ?auto_75418 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_75420 ?auto_75421 ) ( IN-CITY ?auto_75411 ?auto_75421 ) ( not ( = ?auto_75411 ?auto_75420 ) ) ( OBJ-AT ?auto_75415 ?auto_75420 ) ( IN-CITY ?auto_75422 ?auto_75421 ) ( not ( = ?auto_75411 ?auto_75422 ) ) ( OBJ-AT ?auto_75416 ?auto_75422 ) ( IN-CITY ?auto_75417 ?auto_75421 ) ( not ( = ?auto_75411 ?auto_75417 ) ) ( OBJ-AT ?auto_75413 ?auto_75417 ) ( OBJ-AT ?auto_75414 ?auto_75420 ) ( IN-CITY ?auto_75419 ?auto_75421 ) ( not ( = ?auto_75411 ?auto_75419 ) ) ( OBJ-AT ?auto_75412 ?auto_75419 ) ( TRUCK-AT ?auto_75418 ?auto_75411 ) ( not ( = ?auto_75412 ?auto_75414 ) ) ( not ( = ?auto_75420 ?auto_75419 ) ) ( not ( = ?auto_75412 ?auto_75413 ) ) ( not ( = ?auto_75414 ?auto_75413 ) ) ( not ( = ?auto_75417 ?auto_75420 ) ) ( not ( = ?auto_75417 ?auto_75419 ) ) ( not ( = ?auto_75412 ?auto_75416 ) ) ( not ( = ?auto_75414 ?auto_75416 ) ) ( not ( = ?auto_75413 ?auto_75416 ) ) ( not ( = ?auto_75422 ?auto_75417 ) ) ( not ( = ?auto_75422 ?auto_75420 ) ) ( not ( = ?auto_75422 ?auto_75419 ) ) ( not ( = ?auto_75412 ?auto_75415 ) ) ( not ( = ?auto_75414 ?auto_75415 ) ) ( not ( = ?auto_75413 ?auto_75415 ) ) ( not ( = ?auto_75416 ?auto_75415 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_75412 ?auto_75414 ?auto_75413 ?auto_75415 ?auto_75416 ?auto_75411 )
      ( DELIVER-5PKG-VERIFY ?auto_75412 ?auto_75413 ?auto_75414 ?auto_75415 ?auto_75416 ?auto_75411 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_75572 - OBJ
      ?auto_75573 - OBJ
      ?auto_75574 - OBJ
      ?auto_75575 - OBJ
      ?auto_75576 - OBJ
      ?auto_75571 - LOCATION
    )
    :vars
    (
      ?auto_75580 - LOCATION
      ?auto_75581 - CITY
      ?auto_75582 - LOCATION
      ?auto_75577 - LOCATION
      ?auto_75579 - LOCATION
      ?auto_75578 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_75580 ?auto_75581 ) ( IN-CITY ?auto_75571 ?auto_75581 ) ( not ( = ?auto_75571 ?auto_75580 ) ) ( OBJ-AT ?auto_75576 ?auto_75580 ) ( IN-CITY ?auto_75582 ?auto_75581 ) ( not ( = ?auto_75571 ?auto_75582 ) ) ( OBJ-AT ?auto_75574 ?auto_75582 ) ( IN-CITY ?auto_75577 ?auto_75581 ) ( not ( = ?auto_75571 ?auto_75577 ) ) ( OBJ-AT ?auto_75573 ?auto_75577 ) ( OBJ-AT ?auto_75575 ?auto_75580 ) ( IN-CITY ?auto_75579 ?auto_75581 ) ( not ( = ?auto_75571 ?auto_75579 ) ) ( OBJ-AT ?auto_75572 ?auto_75579 ) ( TRUCK-AT ?auto_75578 ?auto_75571 ) ( not ( = ?auto_75572 ?auto_75575 ) ) ( not ( = ?auto_75580 ?auto_75579 ) ) ( not ( = ?auto_75572 ?auto_75573 ) ) ( not ( = ?auto_75575 ?auto_75573 ) ) ( not ( = ?auto_75577 ?auto_75580 ) ) ( not ( = ?auto_75577 ?auto_75579 ) ) ( not ( = ?auto_75572 ?auto_75574 ) ) ( not ( = ?auto_75575 ?auto_75574 ) ) ( not ( = ?auto_75573 ?auto_75574 ) ) ( not ( = ?auto_75582 ?auto_75577 ) ) ( not ( = ?auto_75582 ?auto_75580 ) ) ( not ( = ?auto_75582 ?auto_75579 ) ) ( not ( = ?auto_75572 ?auto_75576 ) ) ( not ( = ?auto_75575 ?auto_75576 ) ) ( not ( = ?auto_75573 ?auto_75576 ) ) ( not ( = ?auto_75574 ?auto_75576 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_75572 ?auto_75575 ?auto_75573 ?auto_75576 ?auto_75574 ?auto_75571 )
      ( DELIVER-5PKG-VERIFY ?auto_75572 ?auto_75573 ?auto_75574 ?auto_75575 ?auto_75576 ?auto_75571 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_78697 - OBJ
      ?auto_78698 - OBJ
      ?auto_78699 - OBJ
      ?auto_78700 - OBJ
      ?auto_78701 - OBJ
      ?auto_78696 - LOCATION
    )
    :vars
    (
      ?auto_78705 - LOCATION
      ?auto_78706 - CITY
      ?auto_78707 - LOCATION
      ?auto_78702 - LOCATION
      ?auto_78704 - LOCATION
      ?auto_78703 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_78705 ?auto_78706 ) ( IN-CITY ?auto_78696 ?auto_78706 ) ( not ( = ?auto_78696 ?auto_78705 ) ) ( OBJ-AT ?auto_78701 ?auto_78705 ) ( IN-CITY ?auto_78707 ?auto_78706 ) ( not ( = ?auto_78696 ?auto_78707 ) ) ( OBJ-AT ?auto_78700 ?auto_78707 ) ( IN-CITY ?auto_78702 ?auto_78706 ) ( not ( = ?auto_78696 ?auto_78702 ) ) ( OBJ-AT ?auto_78699 ?auto_78702 ) ( OBJ-AT ?auto_78697 ?auto_78705 ) ( IN-CITY ?auto_78704 ?auto_78706 ) ( not ( = ?auto_78696 ?auto_78704 ) ) ( OBJ-AT ?auto_78698 ?auto_78704 ) ( TRUCK-AT ?auto_78703 ?auto_78696 ) ( not ( = ?auto_78698 ?auto_78697 ) ) ( not ( = ?auto_78705 ?auto_78704 ) ) ( not ( = ?auto_78698 ?auto_78699 ) ) ( not ( = ?auto_78697 ?auto_78699 ) ) ( not ( = ?auto_78702 ?auto_78705 ) ) ( not ( = ?auto_78702 ?auto_78704 ) ) ( not ( = ?auto_78698 ?auto_78700 ) ) ( not ( = ?auto_78697 ?auto_78700 ) ) ( not ( = ?auto_78699 ?auto_78700 ) ) ( not ( = ?auto_78707 ?auto_78702 ) ) ( not ( = ?auto_78707 ?auto_78705 ) ) ( not ( = ?auto_78707 ?auto_78704 ) ) ( not ( = ?auto_78698 ?auto_78701 ) ) ( not ( = ?auto_78697 ?auto_78701 ) ) ( not ( = ?auto_78699 ?auto_78701 ) ) ( not ( = ?auto_78700 ?auto_78701 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_78698 ?auto_78697 ?auto_78699 ?auto_78701 ?auto_78700 ?auto_78696 )
      ( DELIVER-5PKG-VERIFY ?auto_78697 ?auto_78698 ?auto_78699 ?auto_78700 ?auto_78701 ?auto_78696 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_78748 - OBJ
      ?auto_78749 - OBJ
      ?auto_78750 - OBJ
      ?auto_78751 - OBJ
      ?auto_78752 - OBJ
      ?auto_78747 - LOCATION
    )
    :vars
    (
      ?auto_78756 - LOCATION
      ?auto_78757 - CITY
      ?auto_78758 - LOCATION
      ?auto_78753 - LOCATION
      ?auto_78755 - LOCATION
      ?auto_78754 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_78756 ?auto_78757 ) ( IN-CITY ?auto_78747 ?auto_78757 ) ( not ( = ?auto_78747 ?auto_78756 ) ) ( OBJ-AT ?auto_78751 ?auto_78756 ) ( IN-CITY ?auto_78758 ?auto_78757 ) ( not ( = ?auto_78747 ?auto_78758 ) ) ( OBJ-AT ?auto_78752 ?auto_78758 ) ( IN-CITY ?auto_78753 ?auto_78757 ) ( not ( = ?auto_78747 ?auto_78753 ) ) ( OBJ-AT ?auto_78750 ?auto_78753 ) ( OBJ-AT ?auto_78748 ?auto_78756 ) ( IN-CITY ?auto_78755 ?auto_78757 ) ( not ( = ?auto_78747 ?auto_78755 ) ) ( OBJ-AT ?auto_78749 ?auto_78755 ) ( TRUCK-AT ?auto_78754 ?auto_78747 ) ( not ( = ?auto_78749 ?auto_78748 ) ) ( not ( = ?auto_78756 ?auto_78755 ) ) ( not ( = ?auto_78749 ?auto_78750 ) ) ( not ( = ?auto_78748 ?auto_78750 ) ) ( not ( = ?auto_78753 ?auto_78756 ) ) ( not ( = ?auto_78753 ?auto_78755 ) ) ( not ( = ?auto_78749 ?auto_78752 ) ) ( not ( = ?auto_78748 ?auto_78752 ) ) ( not ( = ?auto_78750 ?auto_78752 ) ) ( not ( = ?auto_78758 ?auto_78753 ) ) ( not ( = ?auto_78758 ?auto_78756 ) ) ( not ( = ?auto_78758 ?auto_78755 ) ) ( not ( = ?auto_78749 ?auto_78751 ) ) ( not ( = ?auto_78748 ?auto_78751 ) ) ( not ( = ?auto_78750 ?auto_78751 ) ) ( not ( = ?auto_78752 ?auto_78751 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_78749 ?auto_78748 ?auto_78750 ?auto_78751 ?auto_78752 ?auto_78747 )
      ( DELIVER-5PKG-VERIFY ?auto_78748 ?auto_78749 ?auto_78750 ?auto_78751 ?auto_78752 ?auto_78747 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_79051 - OBJ
      ?auto_79052 - OBJ
      ?auto_79053 - OBJ
      ?auto_79054 - OBJ
      ?auto_79055 - OBJ
      ?auto_79050 - LOCATION
    )
    :vars
    (
      ?auto_79059 - LOCATION
      ?auto_79060 - CITY
      ?auto_79061 - LOCATION
      ?auto_79056 - LOCATION
      ?auto_79058 - LOCATION
      ?auto_79057 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_79059 ?auto_79060 ) ( IN-CITY ?auto_79050 ?auto_79060 ) ( not ( = ?auto_79050 ?auto_79059 ) ) ( OBJ-AT ?auto_79053 ?auto_79059 ) ( IN-CITY ?auto_79061 ?auto_79060 ) ( not ( = ?auto_79050 ?auto_79061 ) ) ( OBJ-AT ?auto_79055 ?auto_79061 ) ( IN-CITY ?auto_79056 ?auto_79060 ) ( not ( = ?auto_79050 ?auto_79056 ) ) ( OBJ-AT ?auto_79054 ?auto_79056 ) ( OBJ-AT ?auto_79051 ?auto_79059 ) ( IN-CITY ?auto_79058 ?auto_79060 ) ( not ( = ?auto_79050 ?auto_79058 ) ) ( OBJ-AT ?auto_79052 ?auto_79058 ) ( TRUCK-AT ?auto_79057 ?auto_79050 ) ( not ( = ?auto_79052 ?auto_79051 ) ) ( not ( = ?auto_79059 ?auto_79058 ) ) ( not ( = ?auto_79052 ?auto_79054 ) ) ( not ( = ?auto_79051 ?auto_79054 ) ) ( not ( = ?auto_79056 ?auto_79059 ) ) ( not ( = ?auto_79056 ?auto_79058 ) ) ( not ( = ?auto_79052 ?auto_79055 ) ) ( not ( = ?auto_79051 ?auto_79055 ) ) ( not ( = ?auto_79054 ?auto_79055 ) ) ( not ( = ?auto_79061 ?auto_79056 ) ) ( not ( = ?auto_79061 ?auto_79059 ) ) ( not ( = ?auto_79061 ?auto_79058 ) ) ( not ( = ?auto_79052 ?auto_79053 ) ) ( not ( = ?auto_79051 ?auto_79053 ) ) ( not ( = ?auto_79054 ?auto_79053 ) ) ( not ( = ?auto_79055 ?auto_79053 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_79052 ?auto_79051 ?auto_79054 ?auto_79053 ?auto_79055 ?auto_79050 )
      ( DELIVER-5PKG-VERIFY ?auto_79051 ?auto_79052 ?auto_79053 ?auto_79054 ?auto_79055 ?auto_79050 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_81760 - OBJ
      ?auto_81761 - OBJ
      ?auto_81762 - OBJ
      ?auto_81763 - OBJ
      ?auto_81764 - OBJ
      ?auto_81759 - LOCATION
    )
    :vars
    (
      ?auto_81768 - LOCATION
      ?auto_81769 - CITY
      ?auto_81770 - LOCATION
      ?auto_81765 - LOCATION
      ?auto_81767 - LOCATION
      ?auto_81766 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_81768 ?auto_81769 ) ( IN-CITY ?auto_81759 ?auto_81769 ) ( not ( = ?auto_81759 ?auto_81768 ) ) ( OBJ-AT ?auto_81761 ?auto_81768 ) ( IN-CITY ?auto_81770 ?auto_81769 ) ( not ( = ?auto_81759 ?auto_81770 ) ) ( OBJ-AT ?auto_81764 ?auto_81770 ) ( IN-CITY ?auto_81765 ?auto_81769 ) ( not ( = ?auto_81759 ?auto_81765 ) ) ( OBJ-AT ?auto_81763 ?auto_81765 ) ( OBJ-AT ?auto_81760 ?auto_81768 ) ( IN-CITY ?auto_81767 ?auto_81769 ) ( not ( = ?auto_81759 ?auto_81767 ) ) ( OBJ-AT ?auto_81762 ?auto_81767 ) ( TRUCK-AT ?auto_81766 ?auto_81759 ) ( not ( = ?auto_81762 ?auto_81760 ) ) ( not ( = ?auto_81768 ?auto_81767 ) ) ( not ( = ?auto_81762 ?auto_81763 ) ) ( not ( = ?auto_81760 ?auto_81763 ) ) ( not ( = ?auto_81765 ?auto_81768 ) ) ( not ( = ?auto_81765 ?auto_81767 ) ) ( not ( = ?auto_81762 ?auto_81764 ) ) ( not ( = ?auto_81760 ?auto_81764 ) ) ( not ( = ?auto_81763 ?auto_81764 ) ) ( not ( = ?auto_81770 ?auto_81765 ) ) ( not ( = ?auto_81770 ?auto_81768 ) ) ( not ( = ?auto_81770 ?auto_81767 ) ) ( not ( = ?auto_81762 ?auto_81761 ) ) ( not ( = ?auto_81760 ?auto_81761 ) ) ( not ( = ?auto_81763 ?auto_81761 ) ) ( not ( = ?auto_81764 ?auto_81761 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_81762 ?auto_81760 ?auto_81763 ?auto_81761 ?auto_81764 ?auto_81759 )
      ( DELIVER-5PKG-VERIFY ?auto_81760 ?auto_81761 ?auto_81762 ?auto_81763 ?auto_81764 ?auto_81759 ) )
  )

)

