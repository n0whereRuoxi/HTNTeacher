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

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_766 - OBJ
      ?auto_765 - LOCATION
    )
    :vars
    (
      ?auto_768 - LOCATION
      ?auto_769 - CITY
      ?auto_767 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_768 ?auto_769 ) ( IN-CITY ?auto_765 ?auto_769 ) ( not ( = ?auto_765 ?auto_768 ) ) ( OBJ-AT ?auto_766 ?auto_768 ) ( TRUCK-AT ?auto_767 ?auto_765 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_767 ?auto_765 ?auto_768 ?auto_769 )
      ( !LOAD-TRUCK ?auto_766 ?auto_767 ?auto_768 )
      ( !DRIVE-TRUCK ?auto_767 ?auto_768 ?auto_765 ?auto_769 )
      ( !UNLOAD-TRUCK ?auto_766 ?auto_767 ?auto_765 )
      ( DELIVER-1PKG-VERIFY ?auto_766 ?auto_765 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_787 - OBJ
      ?auto_788 - OBJ
      ?auto_786 - LOCATION
    )
    :vars
    (
      ?auto_790 - LOCATION
      ?auto_789 - CITY
      ?auto_792 - LOCATION
      ?auto_791 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_790 ?auto_789 ) ( IN-CITY ?auto_786 ?auto_789 ) ( not ( = ?auto_786 ?auto_790 ) ) ( OBJ-AT ?auto_788 ?auto_790 ) ( IN-CITY ?auto_792 ?auto_789 ) ( not ( = ?auto_786 ?auto_792 ) ) ( OBJ-AT ?auto_787 ?auto_792 ) ( TRUCK-AT ?auto_791 ?auto_786 ) ( not ( = ?auto_787 ?auto_788 ) ) ( not ( = ?auto_790 ?auto_792 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_787 ?auto_786 )
      ( DELIVER-1PKG ?auto_788 ?auto_786 )
      ( DELIVER-2PKG-VERIFY ?auto_787 ?auto_788 ?auto_786 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_898 - OBJ
      ?auto_899 - OBJ
      ?auto_900 - OBJ
      ?auto_897 - LOCATION
    )
    :vars
    (
      ?auto_902 - LOCATION
      ?auto_903 - CITY
      ?auto_905 - LOCATION
      ?auto_904 - LOCATION
      ?auto_901 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_902 ?auto_903 ) ( IN-CITY ?auto_897 ?auto_903 ) ( not ( = ?auto_897 ?auto_902 ) ) ( OBJ-AT ?auto_900 ?auto_902 ) ( IN-CITY ?auto_905 ?auto_903 ) ( not ( = ?auto_897 ?auto_905 ) ) ( OBJ-AT ?auto_899 ?auto_905 ) ( IN-CITY ?auto_904 ?auto_903 ) ( not ( = ?auto_897 ?auto_904 ) ) ( OBJ-AT ?auto_898 ?auto_904 ) ( TRUCK-AT ?auto_901 ?auto_897 ) ( not ( = ?auto_898 ?auto_899 ) ) ( not ( = ?auto_905 ?auto_904 ) ) ( not ( = ?auto_898 ?auto_900 ) ) ( not ( = ?auto_899 ?auto_900 ) ) ( not ( = ?auto_902 ?auto_905 ) ) ( not ( = ?auto_902 ?auto_904 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_898 ?auto_899 ?auto_897 )
      ( DELIVER-1PKG ?auto_900 ?auto_897 )
      ( DELIVER-3PKG-VERIFY ?auto_898 ?auto_899 ?auto_900 ?auto_897 ) )
  )

)

