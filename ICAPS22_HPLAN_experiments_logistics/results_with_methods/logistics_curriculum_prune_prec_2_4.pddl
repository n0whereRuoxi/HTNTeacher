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

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_226 - OBJ
      ?auto_227 - LOCATION
    )
    :vars
    (
      ?auto_236 - LOCATION
      ?auto_233 - CITY
      ?auto_228 - TRUCK
      ?auto_239 - LOCATION
      ?auto_240 - CITY
    )
    :precondition
    ( and ( IN-CITY ?auto_236 ?auto_233 ) ( IN-CITY ?auto_227 ?auto_233 ) ( not ( = ?auto_227 ?auto_236 ) ) ( OBJ-AT ?auto_226 ?auto_236 ) ( TRUCK-AT ?auto_228 ?auto_239 ) ( IN-CITY ?auto_239 ?auto_240 ) ( IN-CITY ?auto_236 ?auto_240 ) ( not ( = ?auto_236 ?auto_239 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_228 ?auto_239 ?auto_236 ?auto_240 )
      ( !LOAD-TRUCK ?auto_226 ?auto_228 ?auto_236 )
      ( !DRIVE-TRUCK ?auto_228 ?auto_236 ?auto_227 ?auto_233 )
      ( !UNLOAD-TRUCK ?auto_226 ?auto_228 ?auto_227 )
      ( DELIVER-1PKG-VERIFY ?auto_226 ?auto_227 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_263 - OBJ
      ?auto_265 - OBJ
      ?auto_268 - LOCATION
    )
    :vars
    (
      ?auto_272 - LOCATION
      ?auto_269 - CITY
      ?auto_270 - CITY
      ?auto_275 - LOCATION
      ?auto_276 - CITY
      ?auto_267 - TRUCK
      ?auto_278 - LOCATION
      ?auto_273 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_265 ?auto_263 ) ( IN-CITY ?auto_272 ?auto_269 ) ( IN-CITY ?auto_268 ?auto_269 ) ( not ( = ?auto_268 ?auto_272 ) ) ( OBJ-AT ?auto_265 ?auto_272 ) ( IN-CITY ?auto_268 ?auto_270 ) ( IN-CITY ?auto_272 ?auto_270 ) ( IN-CITY ?auto_275 ?auto_276 ) ( IN-CITY ?auto_268 ?auto_276 ) ( not ( = ?auto_268 ?auto_275 ) ) ( OBJ-AT ?auto_263 ?auto_275 ) ( TRUCK-AT ?auto_267 ?auto_278 ) ( IN-CITY ?auto_278 ?auto_273 ) ( IN-CITY ?auto_275 ?auto_273 ) ( not ( = ?auto_275 ?auto_278 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_263 ?auto_268 )
      ( DELIVER-1PKG ?auto_265 ?auto_268 )
      ( DELIVER-2PKG-VERIFY ?auto_263 ?auto_265 ?auto_268 ) )
  )

)

