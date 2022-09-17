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
      ?auto_187994 - OBJ
      ?auto_187993 - LOCATION
    )
    :vars
    (
      ?auto_187996 - LOCATION
      ?auto_187997 - CITY
      ?auto_187995 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_187996 ?auto_187997 ) ( IN-CITY ?auto_187993 ?auto_187997 ) ( not ( = ?auto_187993 ?auto_187996 ) ) ( OBJ-AT ?auto_187994 ?auto_187996 ) ( TRUCK-AT ?auto_187995 ?auto_187993 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_187995 ?auto_187993 ?auto_187996 ?auto_187997 )
      ( !LOAD-TRUCK ?auto_187994 ?auto_187995 ?auto_187996 )
      ( !DRIVE-TRUCK ?auto_187995 ?auto_187996 ?auto_187993 ?auto_187997 )
      ( !UNLOAD-TRUCK ?auto_187994 ?auto_187995 ?auto_187993 )
      ( DELIVER-1PKG-VERIFY ?auto_187994 ?auto_187993 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_188015 - OBJ
      ?auto_188016 - OBJ
      ?auto_188014 - LOCATION
    )
    :vars
    (
      ?auto_188018 - LOCATION
      ?auto_188019 - CITY
      ?auto_188020 - LOCATION
      ?auto_188017 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_188018 ?auto_188019 ) ( IN-CITY ?auto_188014 ?auto_188019 ) ( not ( = ?auto_188014 ?auto_188018 ) ) ( OBJ-AT ?auto_188016 ?auto_188018 ) ( IN-CITY ?auto_188020 ?auto_188019 ) ( not ( = ?auto_188014 ?auto_188020 ) ) ( OBJ-AT ?auto_188015 ?auto_188020 ) ( TRUCK-AT ?auto_188017 ?auto_188014 ) ( not ( = ?auto_188015 ?auto_188016 ) ) ( not ( = ?auto_188018 ?auto_188020 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_188015 ?auto_188014 )
      ( DELIVER-1PKG ?auto_188016 ?auto_188014 )
      ( DELIVER-2PKG-VERIFY ?auto_188015 ?auto_188016 ?auto_188014 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_188126 - OBJ
      ?auto_188127 - OBJ
      ?auto_188128 - OBJ
      ?auto_188125 - LOCATION
    )
    :vars
    (
      ?auto_188131 - LOCATION
      ?auto_188130 - CITY
      ?auto_188133 - LOCATION
      ?auto_188132 - LOCATION
      ?auto_188129 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_188131 ?auto_188130 ) ( IN-CITY ?auto_188125 ?auto_188130 ) ( not ( = ?auto_188125 ?auto_188131 ) ) ( OBJ-AT ?auto_188128 ?auto_188131 ) ( IN-CITY ?auto_188133 ?auto_188130 ) ( not ( = ?auto_188125 ?auto_188133 ) ) ( OBJ-AT ?auto_188127 ?auto_188133 ) ( IN-CITY ?auto_188132 ?auto_188130 ) ( not ( = ?auto_188125 ?auto_188132 ) ) ( OBJ-AT ?auto_188126 ?auto_188132 ) ( TRUCK-AT ?auto_188129 ?auto_188125 ) ( not ( = ?auto_188126 ?auto_188127 ) ) ( not ( = ?auto_188133 ?auto_188132 ) ) ( not ( = ?auto_188126 ?auto_188128 ) ) ( not ( = ?auto_188127 ?auto_188128 ) ) ( not ( = ?auto_188131 ?auto_188133 ) ) ( not ( = ?auto_188131 ?auto_188132 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_188126 ?auto_188127 ?auto_188125 )
      ( DELIVER-1PKG ?auto_188128 ?auto_188125 )
      ( DELIVER-3PKG-VERIFY ?auto_188126 ?auto_188127 ?auto_188128 ?auto_188125 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_189269 - OBJ
      ?auto_189270 - OBJ
      ?auto_189271 - OBJ
      ?auto_189272 - OBJ
      ?auto_189268 - LOCATION
    )
    :vars
    (
      ?auto_189274 - LOCATION
      ?auto_189275 - CITY
      ?auto_189278 - LOCATION
      ?auto_189277 - LOCATION
      ?auto_189276 - LOCATION
      ?auto_189273 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_189274 ?auto_189275 ) ( IN-CITY ?auto_189268 ?auto_189275 ) ( not ( = ?auto_189268 ?auto_189274 ) ) ( OBJ-AT ?auto_189272 ?auto_189274 ) ( IN-CITY ?auto_189278 ?auto_189275 ) ( not ( = ?auto_189268 ?auto_189278 ) ) ( OBJ-AT ?auto_189271 ?auto_189278 ) ( IN-CITY ?auto_189277 ?auto_189275 ) ( not ( = ?auto_189268 ?auto_189277 ) ) ( OBJ-AT ?auto_189270 ?auto_189277 ) ( IN-CITY ?auto_189276 ?auto_189275 ) ( not ( = ?auto_189268 ?auto_189276 ) ) ( OBJ-AT ?auto_189269 ?auto_189276 ) ( TRUCK-AT ?auto_189273 ?auto_189268 ) ( not ( = ?auto_189269 ?auto_189270 ) ) ( not ( = ?auto_189277 ?auto_189276 ) ) ( not ( = ?auto_189269 ?auto_189271 ) ) ( not ( = ?auto_189270 ?auto_189271 ) ) ( not ( = ?auto_189278 ?auto_189277 ) ) ( not ( = ?auto_189278 ?auto_189276 ) ) ( not ( = ?auto_189269 ?auto_189272 ) ) ( not ( = ?auto_189270 ?auto_189272 ) ) ( not ( = ?auto_189271 ?auto_189272 ) ) ( not ( = ?auto_189274 ?auto_189278 ) ) ( not ( = ?auto_189274 ?auto_189277 ) ) ( not ( = ?auto_189274 ?auto_189276 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_189269 ?auto_189270 ?auto_189271 ?auto_189268 )
      ( DELIVER-1PKG ?auto_189272 ?auto_189268 )
      ( DELIVER-4PKG-VERIFY ?auto_189269 ?auto_189270 ?auto_189271 ?auto_189272 ?auto_189268 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_204961 - OBJ
      ?auto_204962 - OBJ
      ?auto_204963 - OBJ
      ?auto_204964 - OBJ
      ?auto_204965 - OBJ
      ?auto_204960 - LOCATION
    )
    :vars
    (
      ?auto_204967 - LOCATION
      ?auto_204966 - CITY
      ?auto_204969 - LOCATION
      ?auto_204970 - LOCATION
      ?auto_204972 - LOCATION
      ?auto_204971 - LOCATION
      ?auto_204968 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_204967 ?auto_204966 ) ( IN-CITY ?auto_204960 ?auto_204966 ) ( not ( = ?auto_204960 ?auto_204967 ) ) ( OBJ-AT ?auto_204965 ?auto_204967 ) ( IN-CITY ?auto_204969 ?auto_204966 ) ( not ( = ?auto_204960 ?auto_204969 ) ) ( OBJ-AT ?auto_204964 ?auto_204969 ) ( IN-CITY ?auto_204970 ?auto_204966 ) ( not ( = ?auto_204960 ?auto_204970 ) ) ( OBJ-AT ?auto_204963 ?auto_204970 ) ( IN-CITY ?auto_204972 ?auto_204966 ) ( not ( = ?auto_204960 ?auto_204972 ) ) ( OBJ-AT ?auto_204962 ?auto_204972 ) ( IN-CITY ?auto_204971 ?auto_204966 ) ( not ( = ?auto_204960 ?auto_204971 ) ) ( OBJ-AT ?auto_204961 ?auto_204971 ) ( TRUCK-AT ?auto_204968 ?auto_204960 ) ( not ( = ?auto_204961 ?auto_204962 ) ) ( not ( = ?auto_204972 ?auto_204971 ) ) ( not ( = ?auto_204961 ?auto_204963 ) ) ( not ( = ?auto_204962 ?auto_204963 ) ) ( not ( = ?auto_204970 ?auto_204972 ) ) ( not ( = ?auto_204970 ?auto_204971 ) ) ( not ( = ?auto_204961 ?auto_204964 ) ) ( not ( = ?auto_204962 ?auto_204964 ) ) ( not ( = ?auto_204963 ?auto_204964 ) ) ( not ( = ?auto_204969 ?auto_204970 ) ) ( not ( = ?auto_204969 ?auto_204972 ) ) ( not ( = ?auto_204969 ?auto_204971 ) ) ( not ( = ?auto_204961 ?auto_204965 ) ) ( not ( = ?auto_204962 ?auto_204965 ) ) ( not ( = ?auto_204963 ?auto_204965 ) ) ( not ( = ?auto_204964 ?auto_204965 ) ) ( not ( = ?auto_204967 ?auto_204969 ) ) ( not ( = ?auto_204967 ?auto_204970 ) ) ( not ( = ?auto_204967 ?auto_204972 ) ) ( not ( = ?auto_204967 ?auto_204971 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_204961 ?auto_204962 ?auto_204963 ?auto_204964 ?auto_204960 )
      ( DELIVER-1PKG ?auto_204965 ?auto_204960 )
      ( DELIVER-5PKG-VERIFY ?auto_204961 ?auto_204962 ?auto_204963 ?auto_204964 ?auto_204965 ?auto_204960 ) )
  )

)

